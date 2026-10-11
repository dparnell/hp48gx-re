* HP 48GX ROM revision R, #16000-#1802D: Conversion of objects to strings
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: #>$ NULL$TEMP St10Gb a%>$ !DcompWidth DPRADIX? ->str2(ar) DcompWidth@ 9rolld ->str(c) ->str1(ar) #:>$
* Follows on from the previous file (at #16000 in the original ROM).
        B=B-C   A                                * 16000
        D1=D1+  5                                * 16002
L_16005:
        A=DAT1  8                                * 16005
        D1=D1+  8                                * 16009
L_1600C:
        LC(2)   #39                              * 1600C
        ?C>=A   P                                * 16010
        GOYES   L_1601C                          * 16013
        LC(2)   #47                              * 16015
        A=A+C   P                                * 16019
L_1601C:
        C=A     P                                * 1601C
        CSRC                                     * 1601F
        CSRC                                     * 16022
        ASR     W                                * 16025
        ?C=0    B                                * 16028
        GOYES   L_1600C                          * 1602B
        A=C     W                                * 1602D
        C=0     W                                * 16030
        LC(1)   #8                               * 16033
        B=B-C   A                                * 16036
        GOC     L_16045                          * 16038
        DAT0=A  W                                * 1603B
        D0=D0+  16                               * 1603F
        GONC    L_16005                          * 16042
L_16045:
        C=C+B   A                                * 16045
        C=C+C   A                                * 16047
        C=C-1   A                                * 16049
        GOC     L_16058                          * 1604B
        P=C     0                                * 1604E
        DAT0=A  WP                               * 16052
        P=      0                                * 16056
L_16058:
        GOVLNG  GETPTRLOOP                       * 16058

* refs (3): 14BC7 160DB 16F7A
addtics:
        CON(5)  (*)+5                            * 1605F  primitive code object
        LC(2)   #27                              * 16064
        GOTO    L_16075                          * 16068

* refs (4): 15F0F 15F1E 15F4C 15F79
add2_(st):
        CON(5)  (*)+5                            * 1606C  primitive code object
        LC(2)   #22                              * 16071
L_16075:
        RSTK=C                                   * 16075
        GOSBVL  SAVPTR                           * 16077
        A=DAT1  A                                * 1607E
        D1=A                                     * 16081
        GOSBVL  GetStrLen                        * 16084
        R1=C                                     * 1608B
        C=C+1   A                                * 1608E
        C=C+1   A                                * 16090
        GOSBVL  MAKE$                            * 16092
        CD0EX                                    * 16099
        D1=C                                     * 1609C
        C=RSTK                                   * 1609F
        RSTK=C                                   * 160A1
        DAT1=C  B                                * 160A3
        D1=D1+  2                                * 160A6
        GOSBVL  D0=DSKTOP                        * 160A9
        C=DAT0  A                                * 160B0
        D0=C                                     * 160B3
        D0=D0+  10                               * 160B6
        C=R1                                     * 160B9
        C=C+C   A                                * 160BC
        GOSBVL  MOVEDOWN                         * 160BE
        C=RSTK                                   * 160C5
        DAT1=C  B                                * 160C7
        GOVLNG  GPOverWrR0Lp                     * 160CA
        RPL

* refs (3): 15B60 15BC9 160F6
->str1(nm):
        ::                                       * 160D1
          ID>$                                   * 160D6
          addtics                                * 160DB
        ;                                        * 160E0

* refs (2): 15B65 15BCE
->str2(nm):
        CON(5)  (*)+5                            * 160E5  primitive code object
        ASSEMBLE
        LC(5)   ID>$                             * 160EA
        ?ST=0   4                                * 160F1
        GOYES   L_160FD                          * 160F4
        LC(5)   ->str1(nm)                       * 160F6
L_160FD:
        A=C     A                                * 160FD
        PC=(A)                                   * 160FF
        RPL

* refs (2): 15BBA 15BE7
->str1(ex):
        ::                                       * 16103
          MINUSONE                               * 16108
          NULL$TEMP                              * 1610D
          OBJ_539CA                              * 16112
          ERRSET                                 * 16117
          OBJ_34D3C                              * 1611C
          ERRTRAP                                * 16121
          OBJ_159AF                              * 16126
          OBJ_539D8                              * 1612B
          ?SEMI                                  * 16130
          ROTROT2DROP                            * 16135
        ;                                        * 1613A

* -> $
* refs (16): 15E88 1610D 161DA 1622F 172F2 17342 ...
NULL$TEMP:
        ::                                       * 1613F
          NULL$                                  * 16144
          TOTEMPOB                               * 16149
        ;                                        * 1614E

* refs (1): 15C70
OBJ_16153:
        ::                                       * 16153
          PALPTRDCMP                             * 16158
          NOTcase                                * 1615D
          _type(_)_                              * 16162
        ;                                        * 16167

* refs (4): 15C41 15C46 39A79 62B60
->str(xn):
        ::                                       * 1616C
          DUP                                    * 16171
          ROMPTRDECOMP                           * 16176
          case                                   * 1617B
          ::                                     * 16180
            SWAPDROP                             * 16185
            ID>$                                 * 1618A
          ;                                      * 1618F
          ROMPTR>#                               * 16194
          #>$                                    * 16199
          SWAP                                   * 1619E
          #>$                                    * 161A3
          APPEND_SPACE                           * 161A8
          !!insert$                              * 161AD
          $       "XLIB "                        * 161B2
          !!insert$                              * 161C6
        ;                                        * 161CB

* refs (7): 15B74 15B83 15B92 15BBF 15BEC 15BFB ...
->str2(ar):
        ::                                       * 161D0
          OBJ_159B4                              * 161D5
          NULL$TEMP                              * 161DA
          SWAP                                   * 161DF
          NULL{}                                 * 161E4
L_161E9:
          OVERSWAP                               * 161E9
          OBJ_169E1                              * 161EE
          4ROLLROT                               * 161F3
          !append$                               * 161F8
          OVER                                   * 161FD
          NULLCOMP?                              * 16202
          case                                   * 16207
          ROTROT2DROP                            * 1620C
          NEWLINE$&$                             * 16211
          3UNROLL                                * 16216
          GOTO                                   * 1621B
          L_161E9                                * 16220
        ;                                        * 16225

* refs (5): 15B6F 15B7E 15B8D 15BF6 15C05
->str1(ar):
        ::                                       * 1622A
          NULL$TEMP                              * 1622F
          OVER                                   * 16234
          NULL{}                                 * 16239
L_1623E:
          OBJ_539CA                              * 1623E
          ERRSET                                 * 16243
          OBJ_169E1                              * 16248
          ERRTRAP                                * 1624D
          OBJ_159AF                              * 16252
          OBJ_539D8                              * 16257
          3UNROLL                                * 1625C
          !append$                               * 16261
          DUPLEN$                                * 16266
          DcompWidth@                            * 1626B
          #1+                                    * 16270
          #>                                     * 16275
          3PICK                                  * 1627A
          NULLCOMP?                              * 1627F
          ORcase                                 * 16284
          ROTROT2DROP                            * 16289
          APPEND_SPACE                           * 1628E
          3PICK                                  * 16293
          ROT                                    * 16298
          GOTO                                   * 1629D
          L_1623E                                * 162A2
        ;                                        * 162A7

* refs (2): 15B51 B51D5
->str1(r):
        CON(5)  (*)+5                            * 162AC  primitive code object
        ASSEMBLE
        ST=1    0                                * 162B1
        GOTO    L_162C0                          * 162B4

* % -> $
* refs (11): 0F23B 15B56 175D6 176C6 17851 31CE0 ...
a%>$:
        CON(5)  (*)+5                            * 162B8  primitive code object
        ST=0    0                                * 162BD
L_162C0:
        LC(5)   #00030                           * 162C0
        GOSUB   SUB_162EA                        * 162C7
        A=DAT1  A                                * 162CB
        D1=A                                     * 162CE
        D1=D1+  5                                * 162D1
        A=DAT1  W                                * 162D4
        GOSUB   SUB_16353                        * 162D8
        AD0EX                                    * 162DC
        GOSUB   Clean$                           * 162DF
        GOVLNG  GPOverWrR0Lp                     * 162E3

* refs (1): 162C7
SUB_162EA:
        R0=C                                     * 162EA
        GOSBVL  SAVPTR                           * 162ED

* refs (1): 18448
SUB_162F4:
        ST=0    10                               * 162F4
L_162F7:
        C=R0                                     * 162F7
        GOSBVL  CREATETEMP                       * 162FA
        GONC    L_1630C                          * 16301
        GOSUB   St10Gb                           * 16304
        GOTO    L_162F7                          * 16308
L_1630C:
        D1=(5)  DSKTOP                           * 1630C
        C=DAT1  A                                * 16313
        D1=C                                     * 16316
        AD0EX                                    * 16319
        R0=A                                     * 1631C
        D0=A                                     * 1631F
        LC(5)   DOCSTR                           * 16322
        DAT0=C  A                                * 16329
        D0=D0+  5                                * 1632C
        AD0EX                                    * 1632F
        R1=A                                     * 16332
        D0=A                                     * 16335
        D0=D0+  5                                * 16338
        RTN                                      * 1633B

* refs (12): 05BA7 07072 0742B 0751B 115E9 16304 ...
St10Gb:
        ?ST=0   10                               * 1633D
        GOYES   L_16349                          * 16340
        GOVLNG  GPMEMERR                         * 16342
L_16349:
        ST=1    10                               * 16349
        GOVLNG  GARBAGECOL                       * 1634C

* refs (1): 162D8
SUB_16353:
        ?A=0    S                                * 16353
        GOYES   L_16362                          * 16356
        LC(2)   #2D                              * 16358
        DAT0=C  B                                * 1635C
        D0=D0+  2                                * 1635F
L_16362:
        D1=(5)  #8084D                           * 16362
        C=DAT1  B                                * 16369
        D1=(5)  #8084F                           * 1636C
        C=DAT1  P                                * 16373
        D=C     B                                * 16377
        LC(2)   #F3                              * 1637A
        D=D&C   B                                * 1637E
        P=      1                                * 16382
        LC(1)   #B                               * 16384
        ?D<=C   P                                * 16387
        GOYES   L_1638F                          * 1638A
        D=C     P                                * 1638C
L_1638F:
        P=      0                                * 1638F
        C=D     B                                * 16391
        ?C#0    P                                * 16394
        GOYES   L_16415                          * 16397
        ST=0    0                                * 16399
        ?A#0    M                                * 1639C
        GOYES   L_163AD                          * 1639F
        LC(2)   #30                              * 163A1
        DAT0=C  B                                * 163A5
        D0=D0+  2                                * 163A8
        RTNCC                                    * 163AB
L_163AD:
        SETDEC                                   * 163AD
        LC(3)   #012                             * 163AF
        B=C     A                                * 163B4
        P=      2                                * 163B6
L_163B8:
        P=P+1                                    * 163B8
        B=B-1   X                                * 163BA
        ?A=0    P                                * 163BD
        GOYES   L_163B8                          * 163C0
        P=P+1                                    * 163C2
        CPEX    15                               * 163C4
        SETHEX                                   * 163C8
        C=-C-1  S                                * 163CA
        SETDEC                                   * 163CD
        P=      0                                * 163CF
        B=B-A   X                                * 163D1
        GONC    L_163ED                          * 163D4
        LC(3)   #500                             * 163D7
        ?C<A    X                                * 163DC
        GOYES   L_16403                          * 163DF
        LC(3)   #011                             * 163E1
        ?C<A    X                                * 163E6
        GOYES   L_1640D                          * 163E9
        B=0     A                                * 163EB
L_163ED:
        P=      15                               * 163ED
L_163EF:
        P=P+1                                    * 163EF
        B=B-1   X                                * 163F1
        GONC    L_163EF                          * 163F4
        CPEX    1                                * 163F7
        P=      0                                * 163FB
        LC(1)   #9                               * 163FD
        GOC     L_16415                          * 16400
L_16403:
        LC(3)   #012                             * 16403
        ?B<=C   X                                * 16408
        GOYES   L_163ED                          * 1640B
L_1640D:
        CSLC                                     * 1640D
        CSL     A                                * 16410
        LC(1)   #2                               * 16412
L_16415:
        D=C     B                                * 16415
        B=0     W                                * 16418
        ABEX    M                                * 1641B
        C=A     XS                               * 1641E
        A=0     S                                * 16421
        SETDEC                                   * 16424
        C=C+C   XS                               * 16426
        GONC    L_1642F                          * 16429
        A=A+1   S                                * 1642C
L_1642F:
        C=D     B                                * 1642F
        CSTEX                                    * 16432
        ?ST=1   1                                * 16434
        GOYES   L_1643D                          * 16437
        GOTO    L_164FE                          * 16439
L_1643D:
        CSTEX                                    * 1643D
L_1643F:
        SETHEX                                   * 1643F
        ST=0    0                                * 16441
        P=      1                                * 16444
        LC(1)   #D                               * 16446
        C=C-D   P                                * 16449
        P=C     1                                * 1644C
        SETDEC                                   * 16450
        C=0     W                                * 16452
        C=B     WP                               * 16455
        B=B+C   W                                * 16458
        ?B=0    S                                * 1645B
        GOYES   L_1646C                          * 1645E
        BSR     W                                * 16460
        A=A+1   X                                * 16463
        GONC    L_1646C                          * 16466
        A=0     S                                * 16469
L_1646C:
        B=0     WP                               * 1646C
        SETHEX                                   * 1646F
        B=B-1   WP                               * 16471
        P=      0                                * 16474
        B=0     P                                * 16476
        SETDEC                                   * 16479
        ?A=0    S                                * 1647B
        GOYES   L_1648D                          * 1647E
        A=-A    X                                * 16480
        LC(3)   #499                             * 16483
        ?C=A    X                                * 16488
        GOYES   L_164E5                          * 1648B
L_1648D:
        C=D     B                                * 1648D
        CSTEX                                    * 16490
        ?ST=1   0                                * 16492
        GOYES   L_16497                          * 16495
L_16497:
        CSTEX                                    * 16497
        GONC    L_164E5                          * 16499
        LC(3)   #300                             * 1649C
        D=C     X                                * 164A1
        C=A     A                                * 164A4
L_164A6:
        C=C-D   X                                * 164A6
        GONC    L_164A6                          * 164A9
        C=C+D   X                                * 164AC
        DSR     X                                * 164AF
        ?D#0    X                                * 164B2
        GOYES   L_164A6                          * 164B5
        ?C=0    X                                * 164B7
        GOYES   L_164E5                          * 164BA
        B=C     P                                * 164BC
        A=A-C   A                                * 164BF
        ?A=0    S                                * 164C1
        GOYES   L_164CE                          * 164C4
        LC(1)   #3                               * 164C6
        A=A+C   A                                * 164C9
        B=C-B   P                                * 164CB
L_164CE:
        SETHEX                                   * 164CE
        LC(1)   #D                               * 164D0
        C=C-B   P                                * 164D3
        P=C     0                                * 164D6
L_164DA:
        P=P+1                                    * 164DA
        B=B+1   P                                * 164DC
        GOC     L_164DA                          * 164DF
        B=B-1   P                                * 164E2
L_164E5:
        SETHEX                                   * 164E5
        A=A+1   A                                * 164E7
        P=      14                               * 164E9
L_164EB:
        ASL     WP                               * 164EB
        ?A=0    P                                * 164EE
        GOYES   L_164EB                          * 164F1
        A=A-1   WP                               * 164F3
        GOTO    L_16596                          * 164F6
L_164FA:
        GOTO    L_1643F                          * 164FA
L_164FE:
        ST=0    0                                * 164FE
        CSTEX                                    * 16501
        D=C     B                                * 16503
        P=C     1                                * 16506
        C=A     A                                * 1650A
L_1650C:
        C=C+1   A                                * 1650C
        P=P-1                                    * 1650E
        GONC    L_1650C                          * 16510
        C=C+C   XS                               * 16513
        GOC     L_164FA                          * 16516
L_16519:
        P=P-1                                    * 16519
        ?P=     1                                * 1651B
        GOYES   L_16554                          * 1651E
        C=C-1   X                                * 16520
        GONC    L_16519                          * 16523
        C=0     W                                * 16526
        ?B=0    M                                * 16529
        GOYES   L_16565                          * 1652C
        C=B     WP                               * 1652E
        C=C+B   W                                * 16531
        C=0     WP                               * 16534
        ?C=0    W                                * 16537
        GOYES   L_164FA                          * 1653A
        ?C=0    S                                * 1653C
        GOYES   L_16565                          * 1653F
        CSR     W                                * 16541
        A=A+1   X                                * 16544
        GONC    L_1654D                          * 16547
        A=0     S                                * 1654A
L_1654D:
        P=P-1                                    * 1654D
        ?P#     1                                * 1654F
        GOYES   L_16565                          * 16552
L_16554:
        P=      0                                * 16554
        LC(3)   #011                             * 16556
        P=      2                                * 1655B
        ?C<A    X                                * 1655D
        GOYES   L_164FA                          * 16560
        C=B     W                                * 16562
L_16565:
        B=C     W                                * 16565
        ?A=0    S                                * 16568
        GOYES   L_16578                          * 1656B
L_1656D:
        BSR     W                                * 1656D
        P=P-1                                    * 16570
        A=A+1   X                                * 16572
        GONC    L_1656D                          * 16575
L_16578:
        SETHEX                                   * 16578
        B=B-1   WP                               * 1657A
        P=      0                                * 1657D
        B=A     P                                * 1657F
        ASR     B                                * 16582
        ?A=0    P                                * 16585
        GOYES   L_16590                          * 16588
        LC(1)   #A                               * 1658A
        B=B+C   P                                * 1658D
L_16590:
        A=0     W                                * 16590
        A=A-1   W                                * 16593
L_16596:
        P=      0                                * 16596
        A=B     P                                * 16598
        D=D+D   P                                * 1659B
        BSL     W                                * 1659E
        GONC    L_165C1                          * 165A1
        ?B=0    S                                * 165A4
        GOYES   L_16608                          * 165A7
        LC(1)   #E                               * 165A9
        C=C-A   P                                * 165AC
        P=C     0                                * 165AF
        LC(1)   #F                               * 165B3
        ?B#C    P                                * 165B6
        GOYES   L_165BF                          * 165B9
        A=0     A                                * 165BB
        A=A-1   A                                * 165BD
L_165BF:
        P=      0                                * 165BF
L_165C1:
        C=B     S                                * 165C1
        B=B+1   S                                * 165C4
        GOC     L_16625                          * 165C7
        LC(1)   #3                               * 165CA
        CSLC                                     * 165CD
L_165D0:
        DAT0=C  B                                * 165D0
        D0=D0+  2                                * 165D3
        ?ST=0   0                                * 165D6
        GOYES   L_16608                          * 165D9
        C=A     A                                * 165DB
        C=-C    A                                * 165DD
        P=C     0                                * 165DF
        C=0     A                                * 165E3
        LC(10)  #1001001000                      * 165E5
        P=      0                                * 165F1
        ?C=0    P                                * 165F3
        GOYES   L_16608                          * 165F6
        LC(4)   #2E2C                            * 165F8
        GOSUB   SUB_16656                        * 165FE
        DAT0=C  B                                * 16602
        D0=D0+  2                                * 16605
L_16608:
        BSL     W                                * 16608
        A=A-1   P                                * 1660B
        GONC    L_165C1                          * 1660E
        ST=0    0                                * 16611
        LC(4)   #2C2E                            * 16614
        GOSUB   SUB_16656                        * 1661A
        BSR     W                                * 1661E
        GOTO    L_165D0                          * 16621
L_16625:
        A=A+1   S                                * 16625
        RTNC                                     * 16628
        LC(2)   #45                              * 1662B
        DAT0=C  B                                * 1662F
        D0=D0+  2                                * 16632
        A=A-1   S                                * 16635
        ?A=0    S                                * 16638
        GOYES   L_16647                          * 1663B
        LC(2)   #2D                              * 1663D
        DAT0=C  B                                * 16641
        D0=D0+  2                                * 16644
L_16647:
        B=A     W                                * 16647
        A=0     W                                * 1664A
        A=A-1   W                                * 1664D
        ST=0    0                                * 16650
        GOC     L_16608                          * 16653

* refs (2): 165FE 1661A
SUB_16656:
        D=C     A                                * 16656
        D1=(5)  #8084F                           * 16658
        C=DAT1  B                                * 1665F
        ?CBIT=0 2                                * 16662
        GOYES   L_1666D                          * 16667
        DSR     A                                * 16669
        DSR     A                                * 1666B
L_1666D:
        C=D     A                                * 1666D
        RTN                                      * 1666F

* Shrinks a strobj R0.A=->$ D0=end of $ Uses A.W B.A C.W D.10 D0 D1
* refs (3): 30CDC 31558 D440F
Shrink$:
        AD0EX                                    * 16671
        D0=A                                     * 16674

* R1=R0+5 <REF>Clean$
* refs (1): 1695E
Clean$R0:
        C=R0                                     * 16677
        C=C+CON A,5                              * 1667A
        R1=C                                     * 16680

* Shrink strobj in top of TEMPOB R1=addr of length field A.A=new end address Uses A.W B.A C.W D.A D0 D1
* refs (1): 162DF
Clean$:
        D0=A                                     * 16683
        C=R1                                     * 16686
        D1=C                                     * 16689
        C=A-C   A                                * 1668C
        DAT1=C  A                                * 1668E
        C=R0                                     * 16691
        A=A-C   A                                * 16694
        A=A+CON A,6                              * 16696
        DAT0=A  A                                * 1669C
        D0=D0+  5                                * 1669F
        CD0EX                                    * 166A2
        D=C     A                                * 166A5
        D0=(5)  TEMPTOP                          * 166A7
        D1=(5)  RSKTOP                           * 166AE
        A=DAT0  A                                * 166B5
        DAT0=C  A                                * 166B8
        D0=A                                     * 166BB
        C=A-C   A                                * 166BE
        B=C     A                                * 166C0
        C=DAT1  A                                * 166C2
        CAEX    A                                * 166C5
        C=A-C   A                                * 166C7
        A=A-B   A                                * 166C9
        DAT1=A  A                                * 166CB
        DCEX    A                                * 166CE
        D1=C                                     * 166D0
        C=D     A                                * 166D3
        GOSBVL  MOVEDOWN                         * 166D5
        GOVLNG  ADJMEM                           * 166DC

* # ->
* refs (3): 1C40D B51D0 B91E4
DOFIX:
        CON(5)  (*)+5                            * 166E3  primitive code object
        A=0     A                                * 166E8
L_166EA:
        A=A+1   A                                * 166EA
        GONC    L_16716                          * 166EC  always taken

* # ->
* refs (4): 1C441 45DCF 468CE B9207
DOSCI:
        CON(5)  (*)+5                            * 166EF  primitive code object
        A=0     A                                * 166F4
L_166F6:
        A=A+1   A                                * 166F6
        GONC    L_166EA                          * 166F8  always taken

* # ->
* refs (2): 1C475 B922A
DOENG:
        CON(5)  (*)+5                            * 166FB  primitive code object
        A=0     A                                * 16700
        A=A+1   A                                * 16702
        GONC    L_166F6                          * 16704  always taken

* ->
* refs (3): 1C490 B91BC D13AD
DOSTD:
        CON(5)  (*)+5                            * 16707  primitive code object
        A=0     B                                * 1670C
        R0=A                                     * 1670F
        GOTO    L_1672E                          * 16712
L_16716:
        R0=A                                     * 16716
        GOSBVL  POP#                             * 16719
        LC(5)   #0000B                           * 16720
        ?C>=A   A                                * 16727
        GOYES   L_1672E                          * 1672A
        A=C     A                                * 1672C
L_1672E:
        CD0EX                                    * 1672E
        RSTK=C                                   * 16731
        D0=(5)  #8084E                           * 16733
        DAT0=A  1                                * 1673A
        D0=(5)  #8084F                           * 1673E
        A=DAT0  1                                * 16745
        LC(1)   #C                               * 16749
        A=A&C   P                                * 1674C
        C=R0                                     * 16750
        A=A!C   P                                * 16753
        DAT0=A  1                                * 16757
        C=RSTK                                   * 1675B
        D0=C                                     * 1675D
        A=DAT0  A                                * 16760
        D0=D0+  5                                * 16763
        PC=(A)                                   * 16766

* refs (1): 16841
SUB_1676A:
        C=0     W                                * 1676A
        C=A     A                                * 1676D
        A=0     W                                * 1676F
        A=A+1   A                                * 16772
        SETDEC                                   * 16774
        B=0     W                                * 16776
L_16779:
        SB=0                                     * 16779
        CSRB                                     * 1677C
        ?SB=0                                    * 1677F
        GOYES   L_16787                          * 16782
        B=B+A   W                                * 16784
L_16787:
        A=A+A   W                                * 16787
        ?C#0    W                                * 1678A
        GOYES   L_16779                          * 1678D
        C=B     W                                * 1678F
        SETHEX                                   * 16792
        A=0     B                                * 16794
        P=      5                                * 16797
L_16799:
        A=A+1   B                                * 16799
        CSRC                                     * 1679C
        ?C#0    WP                               * 1679F
        GOYES   L_16799                          * 167A2
        P=      1                                * 167A4
        A=A-1   B                                * 167A6
L_167A9:
        CSLC                                     * 167A9
        LC(1)   #3                               * 167AC
        DAT0=C  B                                * 167AF
        D0=D0+  2                                * 167B2
        A=A-1   B                                * 167B5
        GONC    L_167A9                          * 167B8
        P=      0                                * 167BB
        RTNCC                                    * 167BD
        RPL

* -> flag
* refs (9): 17559 24FFF 250F4 25D0D 2616C 27FA8 ...
DPRADIX?:
        ::                                       * 167BF
          BINT51                                 * 167C4
          TestSysFlag                            * 167C9
          NOT                                    * 167CE
        ;                                        * 167D3

* # -> "#:\ "
* refs (5): 15D4C 31A48 39DCE 39DFB 3F610
#:>$:
        CON(5)  (*)+5                            * 167D8  primitive code object
        ASSEMBLE
        ST=0    9                                * 167DD
        GOTO    L_167EC                          * 167E0

* # -> $
* refs (24): 15DCE 15DD8 15EB5 16199 161A3 219C2 ...
#>$:
        CON(5)  (*)+5                            * 167E4  primitive code object
        ST=1    9                                * 167E9
L_167EC:
        GOSBVL  SAVPTR                           * 167EC
        ST=0    10                               * 167F3
        A=0     W                                * 167F6
        GOSBVL  POP#                             * 167F9
        R1=A                                     * 16800
        C=0     W                                * 16803
        B=0     A                                * 16806
        LC(1)   #A                               * 16808
L_1680B:
        B=B+1   A                                * 1680B
        ?C>A    W                                * 1680D
        GOYES   L_16824                          * 16810
        C=C+C   W                                * 16812
        D=C     W                                * 16815
        C=C+C   W                                * 16818
        C=C+C   W                                * 1681B
        C=C+D   W                                * 1681E
        GONC    L_1680B                          * 16821
L_16824:
        ?ST=1   9                                * 16824
        GOYES   L_1682D                          * 16827
        B=B+1   A                                * 16829
        B=B+1   A                                * 1682B
L_1682D:
        C=B     A                                * 1682D
        GOSUB   SUB_16837                        * 1682F
        GOTO    L_16954                          * 16833

* refs (2): 1682F 168D6
SUB_16837:
        GOSBVL  MAKE$                            * 16837
        A=R1                                     * 1683E
        GOSBVL  SUB_1676A                        * 16841
        ?ST=1   9                                * 16848
        RTNYES                                   * 1684B
        LC(4)   #203A                            * 1684D
        DAT0=C  4                                * 16853
        D0=D0+  4                                * 16857
        RTN                                      * 1685A

* refs (1): 39ED7
s:str(st,s):
        CON(5)  (*)+5                            * 1685C  primitive code object
        GOSUBL  SUB_15AFD                        * 16861
        GONC    L_1686F                          * 16867  always taken

* refs (1): 159A5
stackitw:
        CON(5)  (*)+5                            * 1686A  primitive code object
L_1686F:
        GOSBVL  POP#                             * 1686F
        R1=A                                     * 16876
        GOSBVL  SAVPTR                           * 16879
        C=0     A                                * 16880
        LC(1)   #2                               * 16882
        B=C     A                                * 16885
        LC(1)   #A                               * 16887
        ?C>A    A                                * 1688A
        GOYES   L_1689C                          * 1688D
        LC(2)   #64                              * 1688F
        ?C>A    A                                * 16893
        GOYES   L_1689A                          * 16896
        B=B+1   A                                * 16898
L_1689A:
        B=B+1   A                                * 1689A
L_1689C:
        B=B+1   A                                * 1689C
        GOSBVL  GetStrLenStk                     * 1689E
        A=C     A                                * 168A5
        A=A+B   A                                * 168A7
        D1=(5)  DcompWidth                       * 168A9
        C=0     A                                * 168B0
        C=DAT1  B                                * 168B2
        C=C+CON A,3                              * 168B5
        ?C>=A   A                                * 168BB
        GOYES   L_168D0                          * 168BE
        A=0     A                                * 168C0
        LA(2)   #16                              * 168C2
        ?C>A    A                                * 168C9
        GOYES   L_168D0                          * 168CC
        C=C+1   A                                * 168CE
L_168D0:
        R2=C                                     * 168D0
        ST=0    9                                * 168D3
        GOSUB   SUB_16837                        * 168D6
        AD0EX                                    * 168DA
        D0=A                                     * 168DD
        C=R0                                     * 168E0
        A=A-C   A                                * 168E3
        A=A-CON A,10                             * 168E5
        B=A     A                                * 168EB
        GOSBVL  GetStrLenStk                     * 168ED
        C=C+C   A                                * 168F4
        A=C     A                                * 168F6
        CD1EX                                    * 168F8
        CD0EX                                    * 168FB
        D1=C                                     * 168FE
        C=R2                                     * 16901
        C=C+C   A                                * 16904
        C=C-B   A                                * 16906
        ST=0    0                                * 16908
        ?C<=A   A                                * 1690B
        GOYES   L_16948                          * 1690E
        C=C+B   A                                * 16910
        B=B+A   A                                * 16912
        D=C     A                                * 16914
        C=0     A                                * 16916
        LC(2)   #18                              * 16918
        C=C+C   A                                * 1691C
        ?D>=C   A                                * 1691E
        GOYES   L_16934                          * 16921
        C=D     A                                * 16923
L_16925:
        B=C-B   A                                * 16925
        GOC     L_16946                          * 16927
        BSRB                                     * 1692A
        LC(2)   #20                              * 1692D
        GONC    L_16940                          * 16931
L_16934:
        ST=1    0                                * 16934
        GOC     L_16925                          * 16937
L_1693A:
        DAT1=C  B                                * 1693A
        D1=D1+  2                                * 1693D
L_16940:
        B=B-1   B                                * 16940
        GONC    L_1693A                          * 16943
L_16946:
        C=A     A                                * 16946
L_16948:
        GOSBVL  MOVEDOWN                         * 16948
        ?ST=1   0                                * 1694F
        GOYES   L_1695B                          * 16952
L_16954:
        GOVLNG  GPOverWrR0Lp                     * 16954
L_1695B:
        AD1EX                                    * 1695B
        GOSBVL  Clean$R0                         * 1695E
        GOTO    L_16954                          * 16965
        RPL

* refs (3): 1595A 159FF 16A18
OBJ_16969:
        #       13                               * 16969  19

* refs (2): 16A54 1709A
2D/3D(ar)?:
        ::                                       * 16973
          DUP                                    * 16978
          prefix(ar)                             * 1697D
          TYPEREAL                               * 16982
          EQ                                     * 16987
          NOTcsdrpfls                            * 1698C
          DIMLIMITS                              * 16991
          INNERDUP                               * 16996
          ONE_EQ                                 * 1699B
          NOTcase                                * 169A0

* meta -> F
* refs (1): 496E1
NDROPFALSE:
          ::                                     * 169A5
            NDROP                                * 169AA
            FALSE                                * 169AF
          ;                                      * 169B4
          #1+                                    * 169B9
          EQcase                                 * 169BE
          TRUE                                   * 169C3
          BINT3                                  * 169C8
          EQcase                                 * 169CD
          TRUE                                   * 169D2
          DROPFALSE                              * 169D7
        ;                                        * 169DC

* refs (2): 161EE 16248
OBJ_169E1:
        ::                                       * 169E1
          OBJ_5394C                              * 169E6
          GOTO                                   * 169EB
          L_16A22                                * 169F0
        ;                                        * 169F5

* refs (2): 319CB 31B15
OBJ_169FA:
        ::                                       * 169FA
          GOTO                                   * 169FF
          L_16A1D                                * 16A04
        ;                                        * 16A09

* refs (2): 2FCAE 39E8C
OBJ_16A0E:
        ::                                       * 16A0E
          OBJ_5394C                              * 16A13
          OBJ_16969                              * 16A18
L_16A1D:
          !DcompWidth                            * 16A1D
L_16A22:
          ?ATTNQUIT                              * 16A22
          OVER                                   * 16A27
          TYPECMP?                               * 16A2C
          case                                   * 16A31
          OBJ_17518                              * 16A36
          OVER                                   * 16A3B
          TYPEARRAY?                             * 16A40
          IT                                     * 16A45
          ::                                     * 16A4A
            OVER                                 * 16A4F
            2D/3D(ar)?                           * 16A54
            case                                 * 16A59
            ::                                   * 16A5E
              RDROP                              * 16A63
              OBJ_1748C                          * 16A68
            ;                                    * 16A6D
            OBJ_5395A                            * 16A72
            case                                 * 16A77
            ::                                   * 16A7C
              RDROP                              * 16A81
              OBJ_31ACA                          * 16A86
            ;                                    * 16A8B
          ;                                      * 16A90
          ERRSET                                 * 16A95
          ::                                     * 16A9A
            OBJ_172C0                            * 16A9F
            COLA                                 * 16AA4

* refs (4): 16BE6 16CD4 16D9F 17202
OBJ_16AA9:
            ::                                   * 16AA9
              4PICK                              * 16AAE
              DUPROM-WORD?                       * 16AB3
              SWAP                               * 16AB8
              TYPECOL?                           * 16ABD
              NOTAND                             * 16AC2
              case                               * 16AC7
              OBJ_16FDE                          * 16ACC
              CK&DISPATCH0                       * 16AD1
              #       4000                       * 16AD6  16384
              OBJ_1700B                          * 16AE0
              #       5000                       * 16AE5  20480
              OBJ_16BA3                          * 16AEF
              #       8000                       * 16AF4  32768
              OBJ_16E2B                          * 16AFE
              #       9000                       * 16B03  36864
              OBJ_16DB3                          * 16B0D
              #       E000                       * 16B12  57344
              OBJ_16DB3                          * 16B1C
              #       D000                       * 16B21  53248
              OBJ_16D16                          * 16B2B
              #       2F000                      * 16B30  192512
              OBJ_16C01                          * 16B3A
              BINT0                              * 16B3F
              OBJ_16FDE                          * 16B44
            ;                                    * 16B49
          ;                                      * 16B4E
          ERRTRAP                                * 16B53
          ::                                     * 16B58
            BEGIN                                * 16B5D
            FixRRP                               * 16B62
            OBJ_177B6                            * 16B67
            UNTIL                                * 16B6C
            ERRJMP                               * 16B71
          ;                                      * 16B76
        ;                                        * 16B7B

* refs (2): 16BF7 1707C
OBJ_16B80:
        ::                                       * 16B80
          RDROP                                  * 16B85
          OBJ_177CA                              * 16B8A
          COLAITE                                * 16B8F
          OBJ_171DF                              * 16B94
          OBJ_1727A                              * 16B99
        ;                                        * 16B9E

* refs (1): 16AEF
OBJ_16BA3:
        ::                                       * 16BA3
          IT                                     * 16BA8
          ::                                     * 16BAD

_{_:
            $       "{"                          * 16BB2
            OBJ_177CA                            * 16BBE
            ?SEMI                                * 16BC3
            RDROP                                * 16BC8
            XYZ>ZCOLA                            * 16BCD
            OBJ_1727A                            * 16BD2
          ;                                      * 16BD7
          OBJ_17351                              * 16BDC
          case                                   * 16BE1
          OBJ_16AA9                              * 16BE6

_}_:
          $       "}"                            * 16BEB
          OBJ_16B80                              * 16BF7
        ;                                        * 16BFC

* refs (1): 16B3A
OBJ_16C01:
        ::                                       * 16C01
          OVER                                   * 16C06
          NULL$?                                 * 16C0B
          NOTcase                                * 16C10
          ::                                     * 16C15
            IT                                   * 16C1A
            ROTROT2DROP                          * 16C1F
            COLA                                 * 16C24
            OBJ_1727A                            * 16C29
          ;                                      * 16C2E
          casedrop                               * 16C33
          ::                                     * 16C38
            OBJ_178E2                            * 16C3D

_DIR_:
            $       "DIR"                        * 16C42
            OBJ_17914                            * 16C52
            OBJ_178E2                            * 16C57
            SWAP                                 * 16C5C
            ONE{}N                               * 16C61
            SWAPCOLA                             * 16C66
            OBJ_1727A                            * 16C6B
          ;                                      * 16C70
          SWAPDUP                                * 16C75
          TYPELIST?                              * 16C7A
          DUPUNROT                               * 16C7F
          ?CARCOMP                               * 16C84
          3UNROLL                                * 16C89
          4UNROLL                                * 16C8E
          OBJ_17351                              * 16C93
          case                                   * 16C98
          ::                                     * 16C9D
            7ROLL                                * 16CA2
            IT                                   * 16CA7
            ::                                   * 16CAC
              SWAP4PICK                          * 16CB1
              RAM-WORDNAME                       * 16CB6
              ID>$                               * 16CBB
              OBJ_17914                          * 16CC0
              !append$SWAP                       * 16CC5
            ;                                    * 16CCA
            COLA                                 * 16CCF
            OBJ_16AA9                            * 16CD4
          ;                                      * 16CD9
          4ROLL                                  * 16CDE
          2DROP                                  * 16CE3
          OBJ_178FB                              * 16CE8

_END_:
          $       "END"                          * 16CED
          OBJ_17914                              * 16CFD
          OBJ_178FB                              * 16D02
          COLA                                   * 16D07
          OBJ_17211                              * 16D0C
        ;                                        * 16D11

* refs (1): 16B2B
OBJ_16D16:
        ::                                       * 16D16
          case                                   * 16D1B
          ::                                     * 16D20

_:_:
            $       ":"                          * 16D25
            4PICK                                * 16D31
            ID>$                                 * 16D36
            OVER                                 * 16D3B
            !append$SWAP                         * 16D40
            6PICK                                * 16D45
            OBJ_177B6                            * 16D4A
            OBJ_53930                            * 16D4F
            OBJ_5395A                            * 16D54
            OR                                   * 16D59
            AND                                  * 16D5E
            ITE_DROP                             * 16D63
            !insert$                             * 16D68
            OBJ_177CA                            * 16D6D
            case                                 * 16D72
            OBJ_171E9                            * 16D77
L_16D7C:
            XYZ>ZCOLA                            * 16D7C
            OBJ_1727A                            * 16D81
          ;                                      * 16D86

* refs (1): 16FD4
OBJ_16D8B:
          ::                                     * 16D8B
            RDROP                                * 16D90
            OBJ_17351                            * 16D95
            COLAITE                              * 16D9A
            OBJ_16AA9                            * 16D9F
            OBJ_171DF                            * 16DA4
          ;                                      * 16DA9
        ;                                        * 16DAE

* refs (2): 16B0D 16B1C
OBJ_16DB3:
        ::                                       * 16DB3
          IT                                     * 16DB8

Rep2(<FFFFF>):
          ::                                     * 16DBD
            SWAPDROP                             * 16DC2
            MINUSONE                             * 16DC7
            SWAP                                 * 16DCC
          ;                                      * 16DD1
          SPACE$                                 * 16DD6
          OBJ_177CA                              * 16DDB
          NOT?GOTO                               * 16DE0
          L_16D7C                                * 16DE5
          OBJ_6B359                              * 16DEA
          OBJ_34D3C                              * 16DEF

* refs (3): 16E21 16FC0 16FFC
OBJ_16DF4:
          ::                                     * 16DF4
            RDROP                                * 16DF9
            COLAITE                              * 16DFE
            OBJ_171E9                            * 16E03
            OBJ_1727A                            * 16E08
          ;                                      * 16E0D
        ;                                        * 16E12

* refs (3): 16E80 16E8A 16ED5
OBJ_16E17:
        ::                                       * 16E17
          OBJ_177CA                              * 16E1C
          OBJ_16DF4                              * 16E21
        ;                                        * 16E26

* refs (1): 16AFE
OBJ_16E2B:
        ::                                       * 16E2B
          4PICK                                  * 16E30
          REQcasedrop                            * 16E35
          x'                                     * 16E3A
          OBJ_16EDF                              * 16E3F
          ROM-WORD?                              * 16E44
          NOTcase                                * 16E49
          OBJ_16FCA                              * 16E4E
          DROPSWAPDROP                           * 16E53
          SWAP                                   * 16E58
          OBJ_53930                              * 16E5D
          case                                   * 16E62
          OBJ_16FED                              * 16E67
          MACRODCMP                              * 16E6C
          NOTcase                                * 16E71
          OBJ_16FED                              * 16E76
          NOTcase                                * 16E7B
          OBJ_16E17                              * 16E80
          DUP#0=csedrp                           * 16E85
          OBJ_16E17                              * 16E8A
          3PICK                                  * 16E8F
          NULL$?                                 * 16E94
          NOTcase2drop                           * 16E99
          OBJ_1727A                              * 16E9E
          DUP#1=                                 * 16EA3
          IT                                     * 16EA8
          OBJ_178E2                              * 16EAD
          SWAP                                   * 16EB2
          OBJ_1792D                              * 16EB7
          SWAP                                   * 16EBC
          #3=                                    * 16EC1
          IT                                     * 16EC6
          OBJ_178FB                              * 16ECB
          COLA                                   * 16ED0
          OBJ_16E17                              * 16ED5
        ;                                        * 16EDA

* refs (1): 16E3F
OBJ_16EDF:
        ::                                       * 16EDF
          DROP                                   * 16EE4
          ROTROT2DROP                            * 16EE9
          UNROTDUP                               * 16EEE
          4UNROLL                                * 16EF3
          NEXTCOMPOB                             * 16EF8
          DROP                                   * 16EFD
          PALPTRDCMP                             * 16F02
          DROP                                   * 16F07
          4UNROLL                                * 16F0C
          OBJ_173A6                              * 16F11
          ?SKIP                                  * 16F16
          NULL{}                                 * 16F1B
          ROT                                    * 16F20
          3PICK                                  * 16F25
          OBJ_173A6                              * 16F2A
          ?SKIP                                  * 16F2F
          NULL{}                                 * 16F34
          SWAPDROPSWAP                           * 16F39
          4UNROLL                                * 16F3E
          '                                      * 16F43
          xENDTIC                                * 16F48
          EQOVER                                 * 16F4D
          DUPTYPEIDNT?                           * 16F52
          SWAP                                   * 16F57
          TYPELAM?                               * 16F5C
          OR                                     * 16F61
          ANDITE                                 * 16F66
          ::                                     * 16F6B
            5ROLLDROP                            * 16F70
            ID>$                                 * 16F75
            addtics                              * 16F7A
          ;                                      * 16F7F
          ::                                     * 16F84
            2DROP                                * 16F89
            4PICK                                * 16F8E
            4ROLL                                * 16F93
          ;                                      * 16F98
          4ROLLSWAP                              * 16F9D
          OBJ_177CA                              * 16FA2
          DUP                                    * 16FA7
          4ROLL                                  * 16FAC
          6ROLL                                  * 16FB1
          RPITE                                  * 16FB6
          3UNROLL                                * 16FBB
          OBJ_16DF4                              * 16FC0
        ;                                        * 16FC5

* refs (1): 16E4E
OBJ_16FCA:
        ::                                       * 16FCA
          DROP                                   * 16FCF
          OBJ_16D8B                              * 16FD4
        ;                                        * 16FD9

* refs (2): 16ACC 16B44
OBJ_16FDE:
        ::                                       * 16FDE
          DROPSWAPDROP                           * 16FE3
          SWAPCOLA                               * 16FE8

* refs (2): 16E67 16E76
OBJ_16FED:
          ::                                     * 16FED
            OBJ_15B3D                            * 16FF2
            OBJ_177CA                            * 16FF7
            OBJ_16DF4                            * 16FFC
          ;                                      * 17001
        ;                                        * 17006

* refs (1): 16AE0
OBJ_1700B:
        ::                                       * 1700B
          DROP                                   * 17010
          3PICK                                  * 17015
          prefix(ar)                             * 1701A
          DUP                                    * 1701F
          TYPEREAL                               * 17024
          EQ                                     * 17029
          SWAP                                   * 1702E
          TYPECMP                                * 17033
          EQOR                                   * 17038
          NOTcase                                * 1703D
          ::                                     * 17042
            $       "Array of "                  * 17047
            BINT1                                * 17063
            5PICK                                * 17068
            GETATELN                             * 1706D
            IT                                   * 17072
            OBJ_15CCF                            * 17077
            OBJ_16B80                            * 1707C
          ;                                      * 17081
          DUPNULL$?                              * 17086
          NOTcase                                * 1708B
          OBJ_1727A                              * 17090
          3PICK                                  * 17095
          2D/3D(ar)?                             * 1709A
          case                                   * 1709F
          OBJ_1716C                              * 170A4
          3PICK                                  * 170A9
          OBJ_179AC                              * 170AE
          ?SKIP                                  * 170B3
          ::                                     * 170B8
            OVER#0=                              * 170BD
            ITE                                  * 170C2
            CHR_[                                * 170C7
            CHR_Space                            * 170CC
            >T$                                  * 170D1
          ;                                      * 170D6
          lbrac                                  * 170DB
          !append$                               * 170E0
          SWAP#1+SWAP                            * 170E5
          3PICK                                  * 170EA
          DUPUNROT                               * 170EF
          MDIMS                                  * 170F4
          ITE                                    * 170F9
          SWAP                                   * 170FE
          BINT1                                  * 17103
          4UNROLLDUP                             * 17108
          6PICK                                  * 1710D
          #*                                     * 17112
          #1+DUP                                 * 17117
          ROT#-                                  * 1711C
          OBJ_17847                              * 17121

* refs (1): 17158
OBJ_17126:
          ::                                     * 17126
            tok]                                 * 1712B
            !append$                             * 17130
          ;                                      * 17135
          SWAP3PICK                              * 1713A
          #<>case                                * 1713F
          OBJ_1727A                              * 17144
          3PICK                                  * 17149
          OBJ_179AC                              * 1714E
          ?SKIP                                  * 17153
          OBJ_17126                              * 17158
          COLA                                   * 1715D
          OBJ_17211                              * 17162
        ;                                        * 17167

* refs (1): 170A4
OBJ_1716C:
        ::                                       * 1716C
          SWAPDROP                               * 17171
          #3=                                    * 17176
          3UNROLL                                * 1717B
          tok[                                   * 17180
          TRUE                                   * 17185
          OBJ_174C3                              * 1718A
          drop;dq                                * 1718F
          OBJ_1721B                              * 17194
        ;                                        * 17199

* refs (2): 171EE 17220
OBJ_1719E:
        ::                                       * 1719E
          OVER                                   * 171A3
          OBJ_177B6                              * 171A8
          case                                   * 171AD
          ::                                     * 171B2
            RDROP                                * 171B7
            SWAPDROP                             * 171BC
            NULL{}                               * 171C1
          ;                                      * 171C6
          3UNROLL                                * 171CB
          OBJ_173A6                              * 171D0
          2DROP                                  * 171D5
        ;                                        * 171DA

* refs (2): 16B94 16DA4
OBJ_171DF:
        ::                                       * 171DF
          XYZ>ZCOLA                              * 171E4

* refs (2): 16D77 16E03
OBJ_171E9:
          ::                                     * 171E9
            OBJ_1719E                            * 171EE
            ROT                                  * 171F3
            FALSE                                * 171F8
            COLA                                 * 171FD
            OBJ_16AA9                            * 17202
          ;                                      * 17207
        ;                                        * 1720C

* refs (2): 16D0C 17162
OBJ_17211:
        ::                                       * 17211
          XYZ>ZCOLA                              * 17216

* refs (2): 17194 1726B
OBJ_1721B:
          ::                                     * 1721B
            OBJ_1719E                            * 17220
            2DUP                                 * 17225
            OBJ_1737E                            * 1722A
            casedrop                             * 1722F
            ::                                   * 17234
              ROT                                * 17239
              COLA                               * 1723E
              OBJ_1727A                          * 17243
            ;                                    * 17248
            OVERDUP                              * 1724D
            TYPERRP?                             * 17252
            SWAP                                 * 17257
            TYPELIST?                            * 1725C
            ORNOT                                * 17261
            case2drop                            * 17266
            OBJ_1721B                            * 1726B
            ROT                                  * 17270
            COLA                                 * 17275

* refs (10): 16B99 16BD2 16C29 16C6B 16D81 16E08 ...
OBJ_1727A:
            ::                                   * 1727A
              NULL{}                             * 1727F
              BEGIN                              * 17284
              ROT                                * 17289
              >HCOMP                             * 1728E
              ROT                                * 17293
              FixRRP                             * 17298
              DROP3PICK                          * 1729D
              OBJ_177B6                          * 172A2
              UNTIL                              * 172A7
              ROTDROP                            * 172AC
            ;                                    * 172B1
          ;                                      * 172B6
        ;                                        * 172BB

* refs (1): 16A9F
OBJ_172C0:
        ::                                       * 172C0
          OBJ_25CF5                              * 172C5
          3UNROLL                                * 172CA
          BINT0                                  * 172CF
          NEXTCOMPOB                             * 172D4
          NOTcase                                * 172D9
          ::                                     * 172DE
            BINT14                               * 172E3
            OBJ_11495                            * 172E8
            DROPZERO                             * 172ED
            NULL$TEMP                            * 172F2
            TRUE                                 * 172F7
          ;                                      * 172FC
          3UNROLL                                * 17301
          BEGIN                                  * 17306
          NEXTCOMPOB                             * 1730B
          WHILE                                  * 17310
          ::                                     * 17315
            5PICK                                * 1731A
            5PICK                                * 1731F
            OBJ_1737E                            * 17324
            DROPSWAP                             * 17329
            2SWAP                                * 1732E
          ;                                      * 17333
          REPEAT                                 * 17338
          DROP                                   * 1733D
          NULL$TEMP                              * 17342
          FALSE                                  * 17347
        ;                                        * 1734C

* refs (3): 16BDC 16C93 16D95
OBJ_17351:
        ::                                       * 17351
          3PICK3PICK                             * 17356
          OBJ_1737E                              * 1735B
          DUP                                    * 17360
          NOT?SEMI                               * 17365
          ROT                                    * 1736A
          ZEROSWAP                               * 1736F
          ROTDUP                                 * 17374
        ;                                        * 17379

* refs (3): 1722A 17324 1735B
OBJ_1737E:
        ::                                       * 1737E
          OBJ_173A6                              * 17383
          DUP                                    * 17388
          ITE                                    * 1738D
          2SWAP                                  * 17392
          3UNROLL                                * 17397
          2DROP                                  * 1739C
        ;                                        * 173A1

* refs (4): 16F11 16F2A 171D0 17383
OBJ_173A6:
        ::                                       * 173A6
          SWAP2DUP                               * 173AB
          TYPE                                   * 173B0
          OBJ_173D3                              * 173B5
          DUP                                    * 173BA
          case                                   * 173BF
          5ROLLDROP                              * 173C4
          ROTSWAP                                * 173C9
        ;                                        * 173CE

* refs (1): 173B5
OBJ_173D3:
        ::                                       * 173D3
          TYPECOL                                * 173D8
          EQcasedrop                             * 173DD
          NEXTCOMPOB                             * 173E2
          TYPELIST                               * 173E7
          EQcasedrop                             * 173EC
          NEXTCOMPOB                             * 173F1
          TYPERRP                                * 173F6
          EQcasedrop                             * 173FB
          OBJ_1743C                              * 17400
          DROP                                   * 17405
          BINT2                                  * 1740A
          EQcasedrop                             * 1740F
          FALSE                                  * 17414
          #1+                                    * 17419
          2DUP                                   * 1741E
          ONE_EQ                                 * 17423
          caseTRUE                               * 17428
          TAG>                                   * 1742D
          DROPTRUE                               * 17432
        ;                                        * 17437

* refs (1): 17400
OBJ_1743C:
        ::                                       * 1743C
          DUPTYPELIST?                           * 17441
          casedrpfls                             * 17446
          NEXTRRPOB                              * 1744B
          DUP                                    * 17450
          NOT?SEMI                               * 17455
          ROT                                    * 1745A
          ONE{}N                                 * 1745F
          3UNROLL                                * 17464
        ;                                        * 17469

* refs (6): 15BAB 15BB0 1785B 352E1 352F0 352FF
->str(c):
        ::                                       * 1746E
          OBJ_17527                              * 17473
          TRUE                                   * 17478
          OBJ_17545                              * 1747D
          DROP                                   * 17482
        ;                                        * 17487

* refs (1): 16A68
OBJ_1748C:
        ::                                       * 1748C
          #3=                                    * 17491
          3UNROLL                                * 17496
          INNERCOMP                              * 1749B
          #0=ITE                                 * 174A0
          ::                                     * 174A5
            BINT0                                * 174AA
            tok[                                 * 174AF
          ;                                      * 174B4
          NULL$TEMP                              * 174B9
          FALSE                                  * 174BE

* refs (1): 1718A
OBJ_174C3:
          ::                                     * 174C3
            tok]                                 * 174C8
            SPACE$                               * 174CD
            6ROLL                                * 174D2
            OBJ_1DD51                            * 174D7
            OBJ_34C49                            * 174DC
            3PICK                                * 174E1
            TYPEREAL?                            * 174E6
            IT                                   * 174EB

* refs (6): 296B0 45213 6D8B9 96565 A9A11 B3F91
9rolld:
            ::                                   * 174F0
              BINT9                              * 174F5
              UNROLL                             * 174FA
            ;                                    * 174FF
            GOTO                                 * 17504
            L_1757C                              * 17509
          ;                                      * 1750E
        ;                                        * 17513

* refs (3): 16A36 31CEF 31D1C
OBJ_17518:
        ::                                       * 17518
          INNERCOMP                              * 1751D
          #0=ITE                                 * 17522

* refs (1): 17473
OBJ_17527:
          ::                                     * 17527
            BINT0                                * 1752C
            toklparen                            * 17531
          ;                                      * 17536
          NULL$TEMP                              * 1753B
          FALSE                                  * 17540

* refs (1): 1747D
OBJ_17545:
          ::                                     * 17545
            FALSE                                * 1754A
            5UNROLL                              * 1754F
            tokrparen                            * 17554
            DPRADIX?                             * 17559
            tok,                                 * 1755E
            tok;                                 * 17563
            RPITE                                * 17568
            6ROLL                                * 1756D
            OBJ_1DE19                            * 17572
            OBJ_34C49                            * 17577
L_1757C:
            6ROLL                                * 1757C
            7ROLL                                * 17581
            DUP                                  * 17586
            OBJ_175C7                            * 1758B
            >R                                   * 17590
L_17595:
            DUP#0=                               * 17595
            ?GOTO                                * 1759A
            L_175B8                              * 1759F
            RSKIP                                * 175A4
            #1-                                  * 175A9
            GOTO                                 * 175AE
            L_17595                              * 175B3
L_175B8:
            DROP                                 * 175B8
          ;                                      * 175BD
        ;                                        * 175C2

* refs (1): 1758B
OBJ_175C7:
        {                                        * 175C7
          ::                                     * 175CC
            4PICK                                * 175D1
            a%>$                                 * 175D6
            OBJ_176EE                            * 175DB
          ;                                      * 175E0
          OBJ_1768A                              * 175E5
          ::                                     * 175EA
            3PICK                                * 175EF
            TRUE                                 * 175F4
            BINT16                               * 175F9
            OBJ_176AD                            * 175FE
          ;                                      * 17603
          ::                                     * 17608
            8PICK                                * 1760D
            case                                 * 17612
            OBJ_1768A                            * 17617
            #2+                                  * 1761C
            COLASKIP                             * 17621
          ;                                      * 17626
          ::                                     * 1762B
            BINT9                                * 17630
            PICK                                 * 17635
            BINT16                               * 1763A
            TestSysFlag                          * 1763F
            BINT15                               * 17644
            OBJ_176AD                            * 17649
          ;                                      * 1764E
          ::                                     * 17653
            6PICK                                * 17658
            OBJ_176EE                            * 1765D
          ;                                      * 17662
          DROP                                   * 17667
          7UNROLL                                * 1766C
          5DROP                                  * 17671
          IT                                     * 17676
          SWAPDROP                               * 1767B
          NULL{}                                 * 17680
        }                                        * 17685

* refs (2): 175E5 17617
OBJ_1768A:
        ::                                       * 1768A
          5PICK                                  * 1768F
          SPACE$                                 * 17694
          EQcasedrop                             * 17699
          #1+                                    * 1769E
          OBJ_17734                              * 176A3
        ;                                        * 176A8

* refs (2): 175FE 17649
OBJ_176AD:
        ::                                       * 176AD
          RDROP                                  * 176B2
          TestSysFlag                            * 176B7
          AND                                    * 176BC
          SWAP                                   * 176C1
          a%>$                                   * 176C6
          SWAP                                   * 176CB
          ?SKIP                                  * 176D0
          OBJ_176EE                              * 176D5
          tokanglesign                           * 176DA
          !!insert$                              * 176DF
          OBJ_176EE                              * 176E4
        ;                                        * 176E9

* refs (4): 175DB 1765D 176D5 176E4
OBJ_176EE:
        ::                                       * 176EE
          RDROP                                  * 176F3
          3PICK                                  * 176F8
          NULL$?                                 * 176FD
          ?SKIP                                  * 17702
          ::                                     * 17707
            6PICK                                * 1770C
            SPACE$                               * 17711
            EQ                                   * 17716
            NOT?SEMI                             * 1771B
            +(sp,st)                             * 17720
          ;                                      * 17725
          OBJ_17734                              * 1772A
        ;                                        * 1772F

* refs (2): 176A3 1772A
OBJ_17734:
        ::                                       * 17734
          RDROP                                  * 17739
          ROTSWAP                                * 1773E
          8PICK                                  * 17743
          ?SKIP                                  * 17748
          ::                                     * 1774D
            OVER                                 * 17752
            NULL$?                               * 17757
            ?SEMI                                * 1775C
            2LEN$#+                              * 17761
            DcompWidth@                          * 17766
            #>                                   * 1776B
            NOT?SEMI                             * 17770
            DROP                                 * 17775
            7UNROLL                              * 1777A
            6UNROLL                              * 1777F
            5DROP                                * 17784
            ROT                                  * 17789
            IT                                   * 1778E
            ROTDROP                              * 17793
            ONE{}N                               * 17798
            2RDROP                               * 1779D
          ;                                      * 177A2
          !append$                               * 177A7
          SWAP#1+                                * 177AC
        ;                                        * 177B1

* refs (4): 16B67 16D4A 171A8 172A2
OBJ_177B6:
        ::                                       * 177B6
          OBJ_25CF5                              * 177BB
          EQ                                     * 177C0
        ;                                        * 177C5

* refs (7): 16B8A 16BBE 16D6D 16DDB 16E1C 16FA2 ...
OBJ_177CA:
        ::                                       * 177CA
          DUPNULL$?                              * 177CF
          casedrptru                             * 177D4
          SWAPDUP                                * 177D9
          NULL$?                                 * 177DE
          casedrptru                             * 177E3
          2LEN$#+                                * 177E8
          #1+                                    * 177ED
          DcompWidth@                            * 177F2
          #>case                                 * 177F7
          drop(2);false                          * 177FC
          SPACE$                                 * 17801
          !append$SWAP                           * 17806
          !append$                               * 1780B
          TRUE                                   * 17810
        ;                                        * 17815

* refs (3): 177FC 3089D 6FA86
drop(2);false:
        ::                                       * 1781A
          SWAPDROP                               * 1781F
          FALSE                                  * 17824
        ;                                        * 17829

* $ $' -> $ $' #
* refs (2): 17761 177E8
2LEN$#+:
        ::                                       * 1782E
          OVERLEN$                               * 17833
          OVERLEN$                               * 17838
          #+                                     * 1783D
        ;                                        * 17842

* refs (1): 17121
OBJ_17847:
        ::                                       * 17847
          '                                      * 1784C
          a%>$                                   * 17851
          '                                      * 17856
          ->str(c)                               * 1785B
          6PICK                                  * 17860
          TYPERARRY?                             * 17865
          NOT?SWAPDROP                           * 1786A
          5UNROLL                                * 1786F
          DO                                     * 17874
          SWAPINDEX@                             * 17879
          PULLEL                                 * 1787E
          4PICK                                  * 17883
          EVAL                                   * 17888
          ROTSWAP                                * 1788D
          !append$                               * 17892
          APPEND_SPACE                           * 17897
          OBJ_53930                              * 1789C
          IT                                     * 178A1
          OBJ_178BA                              * 178A6
          LOOP                                   * 178AB
          ROTROT2DROP                            * 178B0
        ;                                        * 178B5

* refs (1): 178A6
OBJ_178BA:
        ::                                       * 178BA
          DUPLEN$                                * 178BF
          DcompWidth@                            * 178C4
          #3+                                    * 178C9
          #<                                     * 178CE
          ?SEMI                                  * 178D3
          ExitAtLOOP                             * 178D8
        ;                                        * 178DD

* refs (3): 16C3D 16C57 16EAD
OBJ_178E2:
        ::                                       * 178E2
          OBJ_11472                              * 178E7
          #2+                                    * 178EC
          OBJ_11495                              * 178F1
        ;                                        * 178F6

* refs (3): 16CE8 16D02 16ECB
OBJ_178FB:
        ::                                       * 178FB
          OBJ_11472                              * 17900
          #2-                                    * 17905
          OBJ_11495                              * 1790A
        ;                                        * 1790F

* refs (3): 16C52 16CC0 16CFD
OBJ_17914:
        ::                                       * 17914
          OBJ_53930                              * 17919
          ?SEMI                                  * 1791E
          OBJ_1792D                              * 17923
        ;                                        * 17928

* refs (2): 16EB7 17923
OBJ_1792D:
        ::                                       * 1792D
          OBJ_11472                              * 17932
          DUP#0=csDROP                           * 17937
          14SPACES$                              * 1793C
          BINT1                                  * 17941
          ROT                                    * 17946
          SUB$                                   * 1794B
          !insert$                               * 17950
        ;                                        * 17955

* # ->
* refs (10): 14092 15973 15A04 16A1D 31980 46897 ...
!DcompWidth:
        CON(5)  (*)+5                            * 1795A  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 1795F
        CD0EX                                    * 17966
        D0=(5)  DcompWidth                       * 17969
        DAT0=A  B                                * 17970
        CD0EX                                    * 17973
        A=DAT0  A                                * 17976
        D0=D0+  5                                * 17979
        PC=(A)                                   * 1797C

* -> #
* refs (6): 15F56 1626B 17766 177F2 178C4 31B0B
DcompWidth@:
        CON(5)  (*)+5                            * 17980  primitive code object
        GOSBVL  SAVPTR                           * 17985
        D0=(5)  DcompWidth                       * 1798C
        C=0     A                                * 17993
        C=DAT0  B                                * 17995
        ?C#0    B                                * 17998
        GOYES   L_179A2                          * 1799B
        C=C-1   A                                * 1799D
        C=0     P                                * 1799F
L_179A2:
        R0=C                                     * 179A2
        GOVLNG  PUSH#LOOP                        * 179A5

* refs (3): 170AE 1714E 31CC2
OBJ_179AC:
        CON(5)  (*)+5                            * 179AC  primitive code object
        C=DAT1  A                                * 179B1
        D1=D1+  5                                * 179B4
        D=D+1   A                                * 179B7
        CD1EX                                    * 179B9
        D1=D1+  15                               * 179BC
        A=DAT1  A                                * 179BF
        D1=C                                     * 179C2
        A=A-1   A                                * 179C5
        A=A-1   A                                * 179C7
        GOVLNG  PushT/FLoop                      * 179C9

* refs (1): 1744B
NEXTRRPOB:
        CON(5)  (*)+5                            * 179D0  primitive code object
        GOSBVL  SAVPTR                           * 179D5
        GOSBVL  POP#                             * 179DC
        B=A     A                                * 179E3
        A=DAT1  A                                * 179E5

addrTEMPTOP:
        D0=(5)  TEMPTOP                          * 179E8
        C=DAT0  A                                * 179EF
        ST=0    0                                * 179F2
        ?C<=A   A                                * 179F5
        GOYES   L_17A0C                          * 179F8
        D0=(5)  TEMPOB                           * 179FA
        C=DAT0  A                                * 17A01
        ?C>A    A                                * 17A04
        GOYES   L_17A0C                          * 17A07
        ST=1    0                                * 17A09
L_17A0C:
        GOSBVL  SUB_08503                        * 17A0C
        CD0EX                                    * 17A13
        D1=C                                     * 17A16
        A=DAT1  A                                * 17A19
        ?A#0    A                                * 17A1C
        GOYES   L_17A25                          * 17A1F
        GOTO    L_17B7A                          * 17A21
L_17A25:
        ABEX    A                                * 17A25
        ?A#0    A                                * 17A27
        GOYES   L_17A6A                          * 17A2A
        C=C+B   A                                * 17A2C
        D0=C                                     * 17A2E
L_17A31:
        GOSBVL  SUB_08400                        * 17A31
        AD0EX                                    * 17A38
        C=B     A                                * 17A3B
        R0=C                                     * 17A3D
        GOSBVL  D1=DSKTOP                        * 17A40
        DAT1=A  A                                * 17A47
        GOSBVL  PUSH#                            * 17A4A
        C=DAT1  A                                * 17A51
        D1=D1+  5                                * 17A54
        A=DAT1  A                                * 17A57
        DAT1=C  A                                * 17A5A
        D1=D1-  5                                * 17A5D
        DAT1=A  A                                * 17A60
        GOVLNG  PushTLoop                        * 17A63
L_17A6A:
        ?ST=1   0                                * 17A6A
        GOYES   L_17A71                          * 17A6D
        B=A     A                                * 17A6F
L_17A71:
        C=C+B   A                                * 17A71
        D0=C                                     * 17A73
L_17A76:
        ?A>B    A                                * 17A76
        GOYES   L_17A31                          * 17A79
        LC(5)   #00005                           * 17A7B
        B=B-C   A                                * 17A82
        ?B#C    A                                * 17A84
        GOYES   L_17A8D                          * 17A87
        GOTO    L_17B0B                          * 17A89
L_17A8D:
        D0=D0-  5                                * 17A8D
        C=DAT0  A                                * 17A90
        B=B-C   A                                * 17A93
        ?ST=0   0                                * 17A95
        GOYES   L_17AD0                          * 17A98
        RSTK=C                                   * 17A9A
        C=0     M                                * 17A9C
        C=DAT1  10                               * 17A9F
        C=0     A                                * 17AA3
        C=C-1   A                                * 17AA5
        C=C+1   M                                * 17AA7
        C=B     A                                * 17AAA
        DAT1=C  10                               * 17AAC
        C=0     M                                * 17AB0
        C=DAT0  7                                * 17AB3
        C=0     A                                * 17AB7
        ?C=0    M                                * 17AB9
        GOYES   L_17AC3                          * 17ABC
        C=C-1   A                                * 17ABE
        C=C+1   M                                * 17AC0
L_17AC3:
        LC(5)   DOTAG                            * 17AC3
        DAT0=C  7                                * 17ACA
        C=RSTK                                   * 17ACE
L_17AD0:
        AD0EX                                    * 17AD0
        A=A-C   A                                * 17AD3
        AD0EX                                    * 17AD5
        GONC    L_17A76                          * 17AD8  always taken
        RPL

* refs (2): 16B62 17298
FixRRP:
        ::                                       * 17ADB
          DUPTYPERRP?                            * 17AE0
          IT                                     * 17AE5
          CODE                                   * 17AEA  141 nibbles
            GOSBVL  SAVPTR                       * 17AF4
            A=DAT1  A                            * 17AFB
            GOSBVL  SUB_08503                    * 17AFE
            AD0EX                                * 17B05
            D1=A                                 * 17B08
L_17B0B:
            C=DAT1  A                            * 17B0B
            ?C=0    A                            * 17B0E
            GOYES   L_17B7A                      * 17B11
            AD1EX                                * 17B13
            D1=A                                 * 17B16
            A=A+C   A                            * 17B19
            D1=D1+  5                            * 17B1B
            C=DAT1  A                            * 17B1E
            D1=D1-  5                            * 17B21
            C=C-1   A                            * 17B24
            GOC     L_17B7A                      * 17B26
L_17B29:
            R1=C                                 * 17B29
            D0=A                                 * 17B2C
            B=A     A                            * 17B2F
            GOSBVL  SUB_08400                    * 17B31
            GOSBVL  SKIPOB                       * 17B38
            C=0     M                            * 17B3F
            C=DAT0  7                            * 17B42
            C=0     A                            * 17B46
            C=C-1   M                            * 17B48
            GONC    L_17B51                      * 17B4B
            C=0     M                            * 17B4E
L_17B51:
            CD0EX                                * 17B51
            D0=C                                 * 17B54
            C=C-B   A                            * 17B57
            DAT0=C  7                            * 17B59
            D0=D0+  5                            * 17B5D
            AD0EX                                * 17B60
            C=R1                                 * 17B63
            C=C-1   A                            * 17B66
            GONC    L_17B29                      * 17B68
            C=0     M                            * 17B6B
            CD1EX                                * 17B6E
            D1=C                                 * 17B71
            C=A-C   A                            * 17B74
            DAT1=C  10                           * 17B76
L_17B7A:
            GOVLNG  GPOverWrFLp                  * 17B7A
          ENDCODE                                * 17B81
        ;                                        * 17B81

* refs (3): 17C0D 17C48 3859D
VLM:
        ::                                       * 17B86
          RDROP                                  * 17B8B
          OBJ_17C55                              * 17B90
          ClrBusyAnn                             * 17B95
          RECLAIMDISP                            * 17B9A
          ClrDA1IsStat                           * 17B9F
          OBJ_01E5E                              * 17BA4
          ERROR@                                 * 17BA9
          OBJ_38854                              * 17BAE
          #1<>                                   * 17BB3
          OBJ_18338                              * 17BB8
          AND                                    * 17BBD
          ?GOTO                                  * 17BC2
          L_17BFE                                * 17BC7
          ERRBEEP                                * 17BCC
          DoMenuMTH                              * 17BD1
          ERRORCLR                               * 17BD6
          #135_64EAA                             * 17BDB
          JstGetTHEMESG                          * 17BE0
          DISPROW1                               * 17BE5
          ERRSET                                 * 17BEA
          OBJ_17C6A                              * 17BEF
          ERRTRAP                                * 17BF4
          OBJ_17C3F                              * 17BF9
L_17BFE:
          OBJ_17F40                              * 17BFE
          OBJ_17C17                              * 17C03
          ERRTRAP                                * 17C08
          VLM                                    * 17C0D
        ;                                        * 17C12

* refs (1): 17C03
OBJ_17C17:
        ::                                       * 17C17
          HOMEDIR                                * 17C1C
          ERRSET                                 * 17C21
          SetThisRow                             * 17C26
          ClrDAsOK                               * 17C2B
          GOTO                                   * 17C30
          L_385B1                                * 17C35
        ;                                        * 17C3A

* refs (1): 17BF9
OBJ_17C3F:
        CON(5)  (*)+5                            * 17C3F  primitive code object
        ASSEMBLE
        GOSUB   SUB_18362                        * 17C44
        LC(5)   VLM                              * 17C48
        A=C     A                                * 17C4F
        PC=(A)                                   * 17C51

* refs (1): 17B90
OBJ_17C55:
        CON(5)  (*)+5                            * 17C55  primitive code object
        A=0     A                                * 17C5A
        D1=(5)  leeway                           * 17C5C
        DAT1=A  A                                * 17C63
        GOTO    L_1830D                          * 17C66
        RPL

* refs (1): 17BEF
OBJ_17C6A:
        ::                                       * 17C6A
          #134_64EA0                             * 17C6F
          JstGetTHEMESG                          * 17C74
          DISPROW3                               * 17C79
          Y/N-Menu                               * 17C7E
          BEGIN                                  * 17C83
          HOMEDIR                                * 17C88
          NoEditLine?                            * 17C8D
          ?SKIP                                  * 17C92
          ::                                     * 17C97
            #13D_64EF0                           * 17C9C
            JstGetTHEMESG                        * 17CA1
            OBJ_17F84                            * 17CA6
            InitEd&Modes                         * 17CAB
          ;                                      * 17CB0
L_17CB5:
          DEPTH                                  * 17CB5
          #0=?SKIP                               * 17CBA
          ::                                     * 17CBF
            OBJ_39F09                            * 17CC4
            OVER                                 * 17CC9
            OBJ_15CCF                            * 17CCE
            OBJ_17F84                            * 17CD3
            ::                                   * 17CD8
              DROP                               * 17CDD
              CK0NOLASTWD                        * 17CE2
              3RDROP                             * 17CE7
              GOTO                               * 17CEC
              L_17CB5                            * 17CF1
            ;                                    * 17CF6
          ;                                      * 17CFB
          NoMemComLine?                          * 17D00
          ?SKIP                                  * 17D05
          ::                                     * 17D0A
            #138_64EC8                           * 17D0F
            JstGetTHEMESG                        * 17D14
            OBJ_17F84                            * 17D19
            DelMemComLine                        * 17D1E
          ;                                      * 17D23
          NoLastStack?                           * 17D28
          ?SKIP                                  * 17D2D
          ::                                     * 17D32
            #137_64EBE                           * 17D37
            JstGetTHEMESG                        * 17D3C
            OBJ_17F84                            * 17D41

DelLastStack:
            ::                                   * 17D46
              ABND                               * 17D4B
              BINT0                              * 17D50
              '                                  * 17D55
              SAVELAM                            * 17D5A
              CACHE                              * 17D5F
              ERRSET                             * 17D64
            ;                                    * 17D69
          ;                                      * 17D6E
          NoLastArg?                             * 17D73
          ?SKIP                                  * 17D78
          ::                                     * 17D7D
            #13B_64EE6                           * 17D82
            JstGetTHEMESG                        * 17D87
            OBJ_17F84                            * 17D8C
            DelLastArg                           * 17D91
          ;                                      * 17D96
          GBUFF                                  * 17D9B
          GROBDIM                                * 17DA0
          DROP                                   * 17DA5
          #0=?SKIP                               * 17DAA
          ::                                     * 17DAF

_PICT_:
            $       "PICT"                       * 17DB4
            OBJ_17F84                            * 17DC6
            KILLADISP                            * 17DCB
          ;                                      * 17DD0
          GetUserKeys                            * 17DD5
          NULL{}                                 * 17DDA
          EQUAL                                  * 17DDF
          ?SKIP                                  * 17DE4
          ::                                     * 17DE9
            #139_64ED2                           * 17DEE
            JstGetTHEMESG                        * 17DF3
            OBJ_17F84                            * 17DF8
            ClrUserKeys                          * 17DFD
          ;                                      * 17E02
          alarm<>{}?                             * 17E07
          IT                                     * 17E0C
          ::                                     * 17E11
            #13A_64EDC                           * 17E16
            JstGetTHEMESG                        * 17E1B
            OBJ_17F84                            * 17E20
            DelAlarrm(0)                         * 17E25
          ;                                      * 17E2A
          DEPTH                                  * 17E2F
          #0=?SKIP                               * 17E34
          ::                                     * 17E39
            #136_64EB4                           * 17E3E
            JstGetTHEMESG                        * 17E43
            OBJ_17F84                            * 17E48
            DelStack                             * 17E4D
          ;                                      * 17E52
          CONTEXT@                               * 17E57
          LastNonNull                            * 17E5C
          IT                                     * 17E61
          OBJ_1804C                              * 17E66
          AdrPort0                               * 17E6B
          NEXTLIBBAK                             * 17E70
          IT                                     * 17E75
          ::                                     * 17E7A
            BEGIN                                * 17E7F
            NEXTLIBBAK                           * 17E84
            DUP                                  * 17E89
            ITE                                  * 17E8E
            4ROLL                                * 17E93
            SWAP                                 * 17E98
            REFERENCED?                          * 17E9D
            ITE                                  * 17EA2
            DROP                                 * 17EA7
            ::                                   * 17EAC
              OBJ_18178                          * 17EB1
              casedrop                           * 17EB6
              ::                                 * 17EBB
                IT                               * 17EC0
                2DROP                            * 17EC5
                2RDROP                           * 17ECA
                2RDROP                           * 17ECF
              ;                                  * 17ED4
              NOTcaseDROP                        * 17ED9
              purge(bk,s)                        * 17EDE
            ;                                    * 17EE3
            NOT_UNTIL                            * 17EE8
          ;                                      * 17EED
          NULL$                                  * 17EF2
          DISPROW5                               * 17EF7
          NULL$                                  * 17EFC
          DISPROW6                               * 17F01
          OBJ_18338                              * 17F06
          UNTIL                                  * 17F0B
        ;                                        * 17F10

* refs (1): 17C7E
Y/N-Menu:
        CON(5)  (*)+5                            * 17F15  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 17F1A
        ST=0    15                               * 17F21
        LC(5)   L_81D33                          * 17F24  code in the self-test area
        GOSBVL  SUB_7008B                        * 17F2B
        GOSBVL  AllowIntr                        * 17F32
        GOVLNG  GETPTRLOOP                       * 17F39
        RPL

* refs (2): 17BFE 3861A
OBJ_17F40:
        ::                                       * 17F40
          NULLHXS                                * 17F45
          #       B8                             * 17F4A  184
          EXPAND                                 * 17F54
          CODE                                   * 17F59  28 nibbles
            A=DAT1  A                            * 17F63
            LC(5)   leeway                       * 17F66
            CD0EX                                * 17F6D
            DAT0=A  A                            * 17F70
            D0=C                                 * 17F73
            D1=D1+  5                            * 17F76
            D=D+1   A                            * 17F79
            GOTO    L_18311                      * 17F7B
          ENDCODE                                * 17F7F
        ;                                        * 17F7F

* refs (9): 17CA6 17CD3 17D19 17D41 17D8C 17DC6 ...
OBJ_17F84:
        ::                                       * 17F84
          DISPROW5                               * 17F89
          'R                                     * 17F8E
          OBJ_17FB1                              * 17F93
          casedrop                               * 17F98
          2RDROP                                 * 17F9D
          NOTcaseDROP                            * 17FA2
          EVAL                                   * 17FA7
        ;                                        * 17FAC

* refs (2): 17F93 181BE
OBJ_17FB1:
        ::                                       * 17FB1
          NOBLINK                                * 17FB6
L_17FBB:
          OBJ_53AD6                              * 17FBB
          GETKEY                                 * 17FC0
          ?GOTO                                  * 17FC5
          OBJ_1802E                              * 17FCA
          ATTN?                                  * 17FCF
          ?GOTO                                  * 17FD4
          L_18006                                * 17FD9
          TIMEOUT?                               * 17FDE
          IT                                     * 17FE3
          off!                                   * 17FE8
          UART?                                  * 17FED
          IT                                     * 17FF2
          FLUSHRSBUF                             * 17FF7
          GOTO                                   * 17FFC
          L_17FBB                                * 18001
L_18006:
          ATTNFLGCLR                             * 18006
          OBJ_42396                              * 1800B
          OBJ_18338                              * 18010
          caseTRUE                               * 18015
          ERRBEEP                                * 1801A
          GOTO                                   * 1801F
          L_17FBB                                * 18024
        ;                                        * 18029
