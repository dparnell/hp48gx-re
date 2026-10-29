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
        :: ID>$ addtics ;                        * 160D1

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
        :: MINUSONE NULL$TEMP OBJ_539CA ERRSET OBJ_34D3C ERRTRAP OBJ_159AF * 16103
          OBJ_539D8 ?SEMI                        * 1612B
          ROTROT2DROP ;                          * 16135

* -> $
* refs (16): 15E88 1610D 161DA 1622F 172F2 17342 ...
NULL$TEMP:
        :: NULL$ TOTEMPOB ;                      * 1613F

* refs (1): 15C70
~PALPTRDCMP;NOTcase;_type(_)_:
        :: PALPTRDCMP NOTcase _type(_)_          * 16153
        ;                                        * 16167

* refs (4): 15C41 15C46 39A79 62B60
->str(xn):
        :: DUP ROMPTRDECOMP case                 * 1616C
          :: SWAPDROP ID>$ ;                     * 16180
          ROMPTR># #>$ SWAP #>$ APPEND_SPACE !!insert$ $ "XLIB " !!insert$ ; * 16194

* refs (7): 15B74 15B83 15B92 15BBF 15BEC 15BFB ...
->str2(ar):
        :: OBJ_159B4 NULL$TEMP SWAP NULL{}       * 161D0
L_161E9:
          OVERSWAP OBJ_169E1 4ROLLROT !append$ OVER NULLCOMP? case * 161E9
          ROTROT2DROP                            * 1620C
          NEWLINE$&$ 3UNROLL GOTO L_161E9 ;      * 16211

* refs (5): 15B6F 15B7E 15B8D 15BF6 15C05
->str1(ar):
        :: NULL$TEMP OVER NULL{}                 * 1622A
L_1623E:
          OBJ_539CA ERRSET OBJ_169E1 ERRTRAP OBJ_159AF OBJ_539D8 3UNROLL * 1623E
          !append$ DUPLEN$ DcompWidth@ #1+ #> 3PICK NULLCOMP? ORcase * 16261
          ROTROT2DROP                            * 16289
          APPEND_SPACE 3PICK ROT GOTO L_1623E ;  * 1628E

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
        GOYES   St10Gb~1                         * 16340
        GOVLNG  GPMEMERR                         * 16342
St10Gb~1:
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
        :: BINT51 TestSysFlag NOT ;              * 167BF

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
        GOSUBL  s:str(st,s)~1                    * 16861
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
        # 13                                     * 16969  19

* refs (2): 16A54 1709A
2D/3D(ar)?:
        :: DUP prefix(ar) TYPEREAL EQ NOTcsdrpfls DIMLIMITS INNERDUP ONE_EQ * 16973
          NOTcase                                * 169A0

* meta -> F
* refs (1): 496E1
NDROPFALSE:
          :: NDROP FALSE ;                       * 169A5
          #1+ EQcase TRUE                        * 169B9
          BINT3 EQcase TRUE                      * 169C8
          DROPFALSE ;                            * 169D7

* refs (2): 161EE 16248
OBJ_169E1:
        :: OBJ_5394C GOTO L_16A22 ;              * 169E1

* refs (2): 319CB 31B15
OBJ_169FA:
        :: GOTO L_16A1D ;                        * 169FA

* refs (2): 2FCAE 39E8C
OBJ_16A0E:
        :: OBJ_5394C OBJ_16969                   * 16A0E
L_16A1D:
          !DcompWidth                            * 16A1D
L_16A22:
          ?ATTNQUIT OVER TYPECMP? case OBJ_17518 * 16A22
          OVER TYPEARRAY? IT                     * 16A3B
          :: OVER 2D/3D(ar)? case                * 16A4A
            :: RDROP OBJ_1748C ;                 * 16A5E
            OBJ_5395A case                       * 16A72
            :: RDROP OBJ_31ACA ;                 * 16A7C
          ;                                      * 16A90
          ERRSET                                 * 16A95
          :: OBJ_172C0 COLA                      * 16A9A

* refs (4): 16BE6 16CD4 16D9F 17202
OBJ_16AA9:
            :: 4PICK DUPROM-WORD? SWAP TYPECOL? NOTAND case OBJ_16FDE * 16AA9
              CK&DISPATCH0                       * 16AD1
              # 4000 OBJ_1700B                   * 16AD6  array any any any
              # 5000 OBJ_16BA3                   * 16AE5  list any any any
              # 8000 OBJ_16E2B                   * 16AF4  program any any any
              # 9000 OBJ_16DB3                   * 16B03  algebraic any any any
              # E000 OBJ_16DB3                   * 16B12  unit any any any
              # D000 OBJ_16D16                   * 16B21  tagged any any any
              # 2F000 OBJ_16C01                  * 16B30  directory any any any
              BINT0 OBJ_16FDE                    * 16B3F  any
            ;                                    * 16B49
          ;                                      * 16B4E
          ERRTRAP                                * 16B53
          :: BEGIN FixRRP OBJ_177B6 UNTIL ERRJMP ; ; * 16B58

* refs (2): 16BF7 1707C
OBJ_16B80:
        :: RDROP OBJ_177CA COLAITE OBJ_171DF OBJ_1727A ; * 16B80

* refs (1): 16AEF
OBJ_16BA3:
        :: IT                                    * 16BA3
          ::                                     * 16BAD

_{_:
            $ "{" OBJ_177CA ?SEMI                * 16BB2
            RDROP XYZ>ZCOLA OBJ_1727A ;          * 16BC8
          OBJ_17351 case OBJ_16AA9               * 16BDC

_}_:
          $ "}" OBJ_16B80 ;                      * 16BEB

* refs (1): 16B3A
OBJ_16C01:
        :: OVER NULL$? NOTcase                   * 16C01
          :: IT ROTROT2DROP                      * 16C15
            COLA OBJ_1727A                       * 16C24
          ;                                      * 16C2E
          casedrop                               * 16C33
          :: OBJ_178E2                           * 16C38

_DIR_:
            $ "DIR" OBJ_17914 OBJ_178E2 SWAP ONE{}N SWAPCOLA OBJ_1727A ; * 16C42
          SWAPDUP TYPELIST? DUPUNROT ?CARCOMP 3UNROLL 4UNROLL OBJ_17351 case * 16C75
          :: 7ROLL IT                            * 16C9D
            :: SWAP4PICK RAM-WORDNAME ID>$ OBJ_17914 !append$SWAP ; * 16CAC
            COLA OBJ_16AA9                       * 16CCF
          ;                                      * 16CD9
          4ROLL 2DROP OBJ_178FB                  * 16CDE

_END_:
          $ "END" OBJ_17914 OBJ_178FB COLA OBJ_17211 * 16CED
        ;                                        * 16D11

* refs (1): 16B2B
OBJ_16D16:
        :: case                                  * 16D16
          ::                                     * 16D20

_:_:
            $ ":" 4PICK ID>$ OVER !append$SWAP 6PICK OBJ_177B6 OBJ_53930 * 16D25
            OBJ_5395A OR AND ITE_DROP !insert$ OBJ_177CA case OBJ_171E9 * 16D54
L_16D7C:
            XYZ>ZCOLA OBJ_1727A ;                * 16D7C

* refs (1): 16FD4
OBJ_16D8B:
          :: RDROP OBJ_17351 COLAITE OBJ_16AA9 OBJ_171DF ; ; * 16D8B

* refs (2): 16B0D 16B1C
OBJ_16DB3:
        :: IT                                    * 16DB3

Rep2(<FFFFF>):
          :: SWAPDROP MINUSONE SWAP ;            * 16DBD
          SPACE$ OBJ_177CA NOT?GOTO L_16D7C OBJ_6B359 OBJ_34D3C * 16DD6

* refs (3): 16E21 16FC0 16FFC
OBJ_16DF4:
          :: RDROP COLAITE OBJ_171E9 OBJ_1727A ; ; * 16DF4

* refs (3): 16E80 16E8A 16ED5
OBJ_16E17:
        :: OBJ_177CA OBJ_16DF4 ;                 * 16E17

* refs (1): 16AFE
OBJ_16E2B:
        :: 4PICK REQcasedrop x'                  * 16E2B
          OBJ_16EDF ROM-WORD? NOTcase OBJ_16FCA  * 16E3F
          DROPSWAPDROP SWAP OBJ_53930 case OBJ_16FED * 16E53
          MACRODCMP NOTcase OBJ_16FED            * 16E6C
          NOTcase OBJ_16E17                      * 16E7B
          DUP#0=csedrp OBJ_16E17 3PICK NULL$? NOTcase2drop OBJ_1727A * 16E85
          DUP#1= IT OBJ_178E2                    * 16EA3
          SWAP OBJ_1792D SWAP #3= IT OBJ_178FB   * 16EB2
          COLA OBJ_16E17                         * 16ED0
        ;                                        * 16EDA

* refs (1): 16E3F
OBJ_16EDF:
        :: DROP ROTROT2DROP UNROTDUP 4UNROLL NEXTCOMPOB DROP PALPTRDCMP DROP * 16EDF
          4UNROLL OBJ_173A6 ?SKIP NULL{}         * 16F0C
          ROT 3PICK OBJ_173A6 ?SKIP NULL{}       * 16F20
          SWAPDROPSWAP 4UNROLL ' xENDTIC EQOVER DUPTYPEIDNT? SWAP TYPELAM? * 16F39
          OR ANDITE                              * 16F61
          :: 5ROLLDROP ID>$ addtics ;            * 16F6B
          :: 2DROP 4PICK 4ROLL ; 4ROLLSWAP OBJ_177CA DUP 4ROLL 6ROLL RPITE * 16F84
          3UNROLL OBJ_16DF4                      * 16FBB
        ;                                        * 16FC5

* refs (1): 16E4E
OBJ_16FCA:
        :: DROP OBJ_16D8B ;                      * 16FCA

* refs (2): 16ACC 16B44
OBJ_16FDE:
        :: DROPSWAPDROP SWAPCOLA                 * 16FDE

* refs (2): 16E67 16E76
OBJ_16FED:
          :: OBJ_15B3D OBJ_177CA OBJ_16DF4 ; ;   * 16FED

* refs (1): 16AE0
OBJ_1700B:
        :: DROP 3PICK prefix(ar) DUP TYPEREAL EQ SWAP TYPECMP EQOR NOTcase * 1700B
          :: $ "Array of " BINT1 5PICK GETATELN IT OBJ_15CCF * 17042
            OBJ_16B80 ;                          * 1707C
          DUPNULL$? NOTcase OBJ_1727A            * 17086
          3PICK 2D/3D(ar)? case OBJ_1716C        * 17095
          3PICK OBJ_179AC ?SKIP                  * 170A9
          :: OVER#0= ITE CHR_[ CHR_Space         * 170B8
            >T$ ;                                * 170D1
          lbrac !append$ SWAP#1+SWAP 3PICK DUPUNROT MDIMS ITE SWAP BINT1 * 170DB
          4UNROLLDUP 6PICK #* #1+DUP ROT#- OBJ_17847 * 17108

* refs (1): 17158
OBJ_17126:
          :: tok] !append$ ; SWAP3PICK #<>case OBJ_1727A * 17126
          3PICK OBJ_179AC ?SKIP OBJ_17126        * 17149
          COLA OBJ_17211                         * 1715D
        ;                                        * 17167

* refs (1): 170A4
OBJ_1716C:
        :: SWAPDROP #3= 3UNROLL tok[ TRUE OBJ_174C3 drop;dq OBJ_1721B ; * 1716C

* refs (2): 171EE 17220
OBJ_1719E:
        :: OVER OBJ_177B6 case                   * 1719E
          :: RDROP SWAPDROP NULL{} ;             * 171B2
          3UNROLL OBJ_173A6 2DROP ;              * 171CB

* refs (2): 16B94 16DA4
OBJ_171DF:
        :: XYZ>ZCOLA                             * 171DF

* refs (2): 16D77 16E03
OBJ_171E9:
          :: OBJ_1719E ROT FALSE COLA OBJ_16AA9  * 171E9
          ;                                      * 17207
        ;                                        * 1720C

* refs (2): 16D0C 17162
OBJ_17211:
        :: XYZ>ZCOLA                             * 17211

* refs (2): 17194 1726B
OBJ_1721B:
          :: OBJ_1719E 2DUP OBJ_1737E casedrop   * 1721B
            :: ROT COLA OBJ_1727A                * 17234
            ;                                    * 17248
            OVERDUP TYPERRP? SWAP TYPELIST? ORNOT case2drop OBJ_1721B * 1724D
            ROT COLA                             * 17270

* refs (10): 16B99 16BD2 16C29 16C6B 16D81 16E08 ...
OBJ_1727A:
            :: NULL{} BEGIN ROT >HCOMP ROT FixRRP DROP3PICK OBJ_177B6 UNTIL * 1727A
              ROTDROP ;                          * 172AC
          ;                                      * 172B6
        ;                                        * 172BB

* refs (1): 16A9F
OBJ_172C0:
        :: OBJ_25CF5 3UNROLL BINT0 NEXTCOMPOB NOTcase * 172C0
          :: BINT14 OBJ_11495 DROPZERO NULL$TEMP TRUE ; * 172DE
          3UNROLL BEGIN NEXTCOMPOB WHILE         * 17301
          :: 5PICK 5PICK OBJ_1737E DROPSWAP 2SWAP ; REPEAT DROP NULL$TEMP * 17315
          FALSE ;                                * 17347

* refs (3): 16BDC 16C93 16D95
OBJ_17351:
        :: 3PICK3PICK OBJ_1737E DUP NOT?SEMI     * 17351
          ROT ZEROSWAP ROTDUP ;                  * 1736A

* refs (3): 1722A 17324 1735B
OBJ_1737E:
        :: OBJ_173A6 DUP ITE 2SWAP 3UNROLL       * 1737E
          2DROP ;                                * 1739C

* refs (4): 16F11 16F2A 171D0 17383
OBJ_173A6:
        :: SWAP2DUP TYPE OBJ_173D3 DUP case 5ROLLDROP * 173A6
          ROTSWAP ;                              * 173C9

* refs (1): 173B5
OBJ_173D3:
        :: TYPECOL EQcasedrop NEXTCOMPOB         * 173D3
          TYPELIST EQcasedrop NEXTCOMPOB         * 173E7
          TYPERRP EQcasedrop OBJ_1743C           * 173F6
          DROP BINT2 EQcasedrop FALSE            * 17405
          #1+ 2DUP ONE_EQ caseTRUE TAG>          * 17419
          DROPTRUE ;                             * 17432

* refs (1): 17400
OBJ_1743C:
        :: DUPTYPELIST? casedrpfls NEXTRRPOB     * 1743C
          DUP NOT?SEMI                           * 17450
          ROT ONE{}N 3UNROLL ;                   * 1745A

* refs (6): 15BAB 15BB0 1785B 352E1 352F0 352FF
->str(c):
        :: ->str(c)~1 TRUE ->str(c)~2 DROP ;     * 1746E

* refs (1): 16A68
OBJ_1748C:
        :: #3= 3UNROLL INNERCOMP #0=ITE          * 1748C
          :: BINT0 tok[ ; NULL$TEMP FALSE        * 174A5

* refs (1): 1718A
OBJ_174C3:
          :: tok] SPACE$ 6ROLL OBJ_1DD51 OBJ_34C49 3PICK TYPEREAL? IT * 174C3

* refs (6): 296B0 45213 6D8B9 96565 A9A11 B3F91
9rolld:
            :: BINT9 UNROLL ;                    * 174F0
            GOTO L_1757C ;                       * 17504
        ;                                        * 17513

* refs (3): 16A36 31CEF 31D1C
OBJ_17518:
        :: INNERCOMP #0=ITE                      * 17518

* refs (1): 17473
->str(c)~1:
          :: BINT0 toklparen ; NULL$TEMP FALSE   * 17527

* refs (1): 1747D
->str(c)~2:
          :: FALSE 5UNROLL tokrparen DPRADIX? tok, tok; RPITE 6ROLL * 17545
            OBJ_1DE19                            * 17572
            OBJ_34C49                            * 17577
L_1757C:
            6ROLL 7ROLL DUP OBJ_175C7 >R         * 1757C
L_17595:
            DUP#0= ?GOTO L_175B8 RSKIP #1- GOTO L_17595 * 17595
L_175B8:
            DROP ;                               * 175B8
        ;                                        * 175C2

* refs (1): 1758B
OBJ_175C7:
        {                                        * 175C7
          :: 4PICK a%>$ OBJ_176EE ; OBJ_1768A    * 175CC
          :: 3PICK TRUE BINT16 OBJ_176AD ;       * 175EA
          :: 8PICK case OBJ_1768A                * 17608
            #2+ COLASKIP ;                       * 1761C
          :: BINT9 PICK BINT16 TestSysFlag BINT15 OBJ_176AD ; * 1762B
          :: 6PICK OBJ_176EE ; DROP 7UNROLL 5DROP IT SWAPDROP * 17653
          NULL{} }                               * 17680

* refs (2): 175E5 17617
OBJ_1768A:
        :: 5PICK SPACE$ EQcasedrop #1+           * 1768A
          OBJ_17734 ;                            * 176A3

* refs (2): 175FE 17649
OBJ_176AD:
        :: RDROP TestSysFlag AND SWAP a%>$ SWAP ?SKIP OBJ_176EE * 176AD
          tokanglesign !!insert$ OBJ_176EE ;     * 176DA

* refs (4): 175DB 1765D 176D5 176E4
OBJ_176EE:
        :: RDROP 3PICK NULL$? ?SKIP              * 176EE
          :: 6PICK SPACE$ EQ NOT?SEMI            * 17707
            +(sp,st) ;                           * 17720
          OBJ_17734 ;                            * 1772A

* refs (2): 176A3 1772A
OBJ_17734:
        :: RDROP ROTSWAP 8PICK ?SKIP             * 17734
          :: OVER NULL$? ?SEMI                   * 1774D
            2LEN$#+ DcompWidth@ #> NOT?SEMI      * 17761
            DROP 7UNROLL 6UNROLL 5DROP ROT IT ROTDROP * 17775
            ONE{}N 2RDROP ;                      * 17798
          !append$ SWAP#1+ ;                     * 177A7

* refs (4): 16B67 16D4A 171A8 172A2
OBJ_177B6:
        :: OBJ_25CF5 EQ ;                        * 177B6

* refs (7): 16B8A 16BBE 16D6D 16DDB 16E1C 16FA2 ...
OBJ_177CA:
        :: DUPNULL$? casedrptru SWAPDUP          * 177CA
          NULL$? casedrptru 2LEN$#+              * 177DE
          #1+ DcompWidth@ #>case drop(2);false   * 177ED
          SPACE$ !append$SWAP !append$ TRUE ;    * 17801

* refs (3): 177FC 3089D 6FA86
drop(2);false:
        :: SWAPDROP FALSE ;                      * 1781A

* $ $' -> $ $' #
* refs (2): 17761 177E8
2LEN$#+:
        :: OVERLEN$ OVERLEN$ #+ ;                * 1782E

* refs (1): 17121
OBJ_17847:
        :: ' a%>$ ' ->str(c) 6PICK TYPERARRY? NOT?SWAPDROP 5UNROLL DO * 17847
          SWAPINDEX@ PULLEL 4PICK EVAL ROTSWAP !append$ APPEND_SPACE * 17879
          OBJ_53930 IT OBJ_178BA                 * 1789C
          LOOP ROTROT2DROP ;                     * 178AB

* refs (1): 178A6
OBJ_178BA:
        :: DUPLEN$ DcompWidth@ #3+ #< ?SEMI      * 178BA
          ExitAtLOOP ;                           * 178D8

* refs (3): 16C3D 16C57 16EAD
OBJ_178E2:
        :: OBJ_11472 #2+ OBJ_11495 ;             * 178E2

* refs (3): 16CE8 16D02 16ECB
OBJ_178FB:
        :: OBJ_11472 #2- OBJ_11495 ;             * 178FB

* refs (3): 16C52 16CC0 16CFD
OBJ_17914:
        :: OBJ_53930 ?SEMI                       * 17914
          OBJ_1792D ;                            * 17923

* refs (2): 16EB7 17923
OBJ_1792D:
        :: OBJ_11472 DUP#0=csDROP 14SPACES$ BINT1 ROT SUB$ !insert$ ; * 1792D

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
        :: DUPTYPERRP? IT                        * 17ADB
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
        :: RDROP VLM~3 ClrBusyAnn RECLAIMDISP ClrDA1IsStat OBJ_01E5E ERROR@ * 17B86
          OBJ_38854 #1<> OBJ_18338 AND ?GOTO L_17BFE ERRBEEP DoMenuMTH * 17BAE
          ERRORCLR #135_64EAA JstGetTHEMESG DISPROW1 ERRSET VLM~4 ERRTRAP * 17BD6
          VLM~2                                  * 17BF9
L_17BFE:
          OBJ_17F40 VLM~1 ERRTRAP VLM ;          * 17BFE

* refs (1): 17C03
VLM~1:
        :: HOMEDIR ERRSET SetThisRow ClrDAsOK GOTO L_385B1 ; * 17C17

* refs (1): 17BF9
VLM~2:
        CON(5)  (*)+5                            * 17C3F  primitive code object
        ASSEMBLE
        GOSUB   SUB_18362                        * 17C44
        LC(5)   VLM                              * 17C48
        A=C     A                                * 17C4F
        PC=(A)                                   * 17C51

* refs (1): 17B90
VLM~3:
        CON(5)  (*)+5                            * 17C55  primitive code object
        A=0     A                                * 17C5A
        D1=(5)  leeway                           * 17C5C
        DAT1=A  A                                * 17C63
        GOTO    L_1830D                          * 17C66
        RPL

* refs (1): 17BEF
VLM~4:
        :: #134_64EA0 JstGetTHEMESG DISPROW3 Y/N-Menu BEGIN HOMEDIR * 17C6A
          NoEditLine? ?SKIP                      * 17C8D
          :: #13D_64EF0 JstGetTHEMESG VLM~5 InitEd&Modes ; * 17C97
L_17CB5:
          DEPTH #0=?SKIP                         * 17CB5
          :: VLM~6 OVER OBJ_15CCF VLM~5          * 17CBF
            :: DROP CK0NOLASTWD 3RDROP GOTO L_17CB5 ; ; * 17CD8
          NoMemComLine? ?SKIP                    * 17D00
          :: #138_64EC8 JstGetTHEMESG VLM~5 DelMemComLine ; * 17D0A
          NoLastStack? ?SKIP                     * 17D28
          :: #137_64EBE JstGetTHEMESG VLM~5      * 17D32

DelLastStack:
            :: ABND BINT0 ' SAVELAM CACHE ERRSET ; ; * 17D46
          NoLastArg? ?SKIP                       * 17D73
          :: #13B_64EE6 JstGetTHEMESG VLM~5 DelLastArg ; * 17D7D
          GBUFF GROBDIM DROP #0=?SKIP            * 17D9B
          ::                                     * 17DAF

_PICT_:
            $ "PICT" VLM~5 KILLADISP ;           * 17DB4
          GetUserKeys NULL{} EQUAL ?SKIP         * 17DD5
          :: #139_64ED2 JstGetTHEMESG VLM~5 ClrUserKeys ; * 17DE9
          alarm<>{}? IT                          * 17E07
          :: #13A_64EDC JstGetTHEMESG VLM~5 DelAlarrm(0) ; * 17E11
          DEPTH #0=?SKIP                         * 17E2F
          :: #136_64EB4 JstGetTHEMESG VLM~5 DelStack ; CONTEXT@ LastNonNull * 17E39
          IT OBJ_1804C                           * 17E61
          AdrPort0 NEXTLIBBAK IT                 * 17E6B
          :: BEGIN NEXTLIBBAK DUP ITE 4ROLL SWAP * 17E7A
            REFERENCED? ITE DROP                 * 17E9D
            :: OBJ_18178 casedrop                * 17EAC
              :: IT 2DROP                        * 17EBB
                2RDROP 2RDROP ;                  * 17ECA
              NOTcaseDROP purge(bk,s)            * 17ED9
            ;                                    * 17EE3
            NOT_UNTIL ;                          * 17EE8
          NULL$ DISPROW5 NULL$ DISPROW6 OBJ_18338 UNTIL ; * 17EF2

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
        :: NULLHXS # B8 EXPAND                   * 17F40
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
VLM~5:
        :: DISPROW5 'R OBJ_17FB1 casedrop 2RDROP * 17F84
          NOTcaseDROP EVAL                       * 17FA2
        ;                                        * 17FAC

* refs (2): 17F93 181BE
OBJ_17FB1:
        :: NOBLINK                               * 17FB1
L_17FBB:
          OBJ_53AD6 GETKEY ?GOTO OBJ_1802E ATTN? ?GOTO L_18006 TIMEOUT? IT * 17FBB
          off!                                   * 17FE8
          UART? IT FLUSHRSBUF                    * 17FED
          GOTO L_17FBB                           * 17FFC
L_18006:
          ATTNFLGCLR OBJ_42396 OBJ_18338 caseTRUE ERRBEEP * 18006
          GOTO L_17FBB ;                         * 1801F
