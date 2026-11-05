* HP 48GX ROM revision R, #16000-#1802D: Conversion of objects to text: strings for each type, number formatting, the line-at-a-time decompiler that wraps programs and lists, and the out-of-memory (VLM) dialog
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: #>$ NULL$TEMP St10Gb a%>$ DclEndLine !DcompWidth VLMPurge? DPRADIX? DclFit? ->str2(ar) DcompWidth@ 9rolld
* Follows on from the previous file (at #16000 in the original ROM).
        B=B-C   A                                * 16000
        D1=D1+  5                                * 16002
longhxs~1.loop1:
        A=DAT1  8                                * 16005
        D1=D1+  8                                * 16009
longhxs~1.loop2:
        LC(2)   #39                              * 1600C
        ?C>=A   P                                * 16010
        GOYES   longhxs~1.L3                     * 16013
        LC(2)   #47                              * 16015
        A=A+C   P                                * 16019
longhxs~1.L3:
        C=A     P                                * 1601C
        CSRC                                     * 1601F
        CSRC                                     * 16022
        ASR     W                                * 16025
        ?C=0    B                                * 16028
        GOYES   longhxs~1.loop2                  * 1602B
        A=C     W                                * 1602D
        C=0     W                                * 16030
        LC(1)   #8                               * 16033
        B=B-C   A                                * 16036
        GOC     longhxs~1.L4                     * 16038
        DAT0=A  W                                * 1603B
        D0=D0+  16                               * 1603F
        GONC    longhxs~1.loop1                  * 16042
longhxs~1.L4:
        C=C+B   A                                * 16045
        C=C+C   A                                * 16047
        C=C-1   A                                * 16049
        GOC     longhxs~1.L5                     * 1604B
        P=C     0                                * 1604E
        DAT0=A  WP                               * 16052
        P=      0                                * 16056
longhxs~1.L5:
        GOVLNG  GETPTRLOOP                       * 16058

* refs (3): 14BC7 160DB 16F7A
addtics:
        CON(5)  (*)+5                            * 1605F  primitive code object
        LC(2)   #27                              * 16064
        GOTO    add2_(st).L1                     * 16068

* refs (4): 15F0F 15F1E 15F4C 15F79
add2_(st):
        CON(5)  (*)+5                            * 1606C  primitive code object
        LC(2)   #22                              * 16071
add2_(st).L1:
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
        GOYES   ->str2(nm).L1                    * 160F4
        LC(5)   ->str1(nm)                       * 160F6
->str2(nm).L1:
        A=C     A                                * 160FD
        PC=(A)                                   * 160FF
        RPL

* refs (2): 15BBA 15BE7
->str1(ex):
        :: MINUSONE NULL$TEMP SetISF20B ERRSET OBJ_34D3C ERRTRAP DcompErr * 16103
          ClrISF20B ?SEMI                        * 1612B
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
        :: ClrDcompFlags NULL$TEMP SWAP NULL{}   * 161D0
->str2(ar).loop1:
          OVERSWAP DclLine 4ROLLROT !append$ OVER NULLCOMP? case ROTROT2DROP * 161E9
          NEWLINE$&$ 3UNROLL GOTO ->str2(ar).loop1 ; * 16211

* refs (5): 15B6F 15B7E 15B8D 15BF6 15C05
->str1(ar):
        :: NULL$TEMP OVER NULL{}                 * 1622A
->str1(ar).loop1:
          SetISF20B ERRSET DclLine ERRTRAP DcompErr ClrISF20B 3UNROLL * 1623E
          !append$ DUPLEN$ DcompWidth@ #1+ #> 3PICK NULLCOMP? ORcase * 16261
          ROTROT2DROP                            * 16289
          APPEND_SPACE 3PICK ROT GOTO ->str1(ar).loop1 ; * 1628E

* refs (2): 15B51 B51D5
->str1(r):
        CON(5)  (*)+5                            * 162AC  primitive code object
        ASSEMBLE
        ST=1    0                                * 162B1
        GOTO    a%>$.L1                          * 162B4

* % -> $
* refs (11): 0F23B 15B56 175D6 176C6 17851 31CE0 ...
a%>$:
        CON(5)  (*)+5                            * 162B8  primitive code object
        ST=0    0                                * 162BD
a%>$.L1:
        LC(5)   #00030                           * 162C0
        GOSUB   Temp$Alloc                       * 162C7
        A=DAT1  A                                * 162CB
        D1=A                                     * 162CE
        D1=D1+  5                                * 162D1
        A=DAT1  W                                * 162D4
        GOSUB   %>Text                           * 162D8
        AD0EX                                    * 162DC
        GOSUB   Clean$                           * 162DF
        GOVLNG  GPOverWrR0Lp                     * 162E3

* refs (1): 162C7
* C.A = size in nibbles -> SAVPTR, then as Temp$AllocR0
Temp$Alloc:
        R0=C                                     * 162EA
        GOSBVL  SAVPTR                           * 162ED

* refs (1): 18448
* R0.A = size in nibbles -> new string in TEMPOB (garbage-collecting once if needed), R0 = the object, R1 = its length field, D0 = its body, D1 = stack level 1
Temp$AllocR0:
        ST=0    10                               * 162F4
Temp$AllocR0.loop1:
        C=R0                                     * 162F7
        GOSBVL  CREATETEMP                       * 162FA
        GONC    Temp$AllocR0.L2                  * 16301
        GOSUB   St10Gb                           * 16304
        GOTO    Temp$AllocR0.loop1               * 16308
Temp$AllocR0.L2:
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
* A.W = real number, D0 = output -> the number's characters at D0 in the display format of flags -45..-50, with the fraction mark of flag -51, D0 past them
%>Text:
        ?A=0    S                                * 16353
        GOYES   %>Text~1                         * 16356
        LC(2)   #2D                              * 16358
        DAT0=C  B                                * 1635C
        D0=D0+  2                                * 1635F
%>Text~1:
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
        GOYES   %>Text~1.L1                      * 1638A
        D=C     P                                * 1638C
%>Text~1.L1:
        P=      0                                * 1638F
        C=D     B                                * 16391
        ?C#0    P                                * 16394
        GOYES   %>Text~1.L8                      * 16397
        ST=0    0                                * 16399
        ?A#0    M                                * 1639C
        GOYES   %>Text~1.L2                      * 1639F
        LC(2)   #30                              * 163A1
        DAT0=C  B                                * 163A5
        D0=D0+  2                                * 163A8
        RTNCC                                    * 163AB
%>Text~1.L2:
        SETDEC                                   * 163AD
        LC(3)   #012                             * 163AF
        B=C     A                                * 163B4
        P=      2                                * 163B6
%>Text~1.loop3:
        P=P+1                                    * 163B8
        B=B-1   X                                * 163BA
        ?A=0    P                                * 163BD
        GOYES   %>Text~1.loop3                   * 163C0
        P=P+1                                    * 163C2
        CPEX    15                               * 163C4
        SETHEX                                   * 163C8
        C=-C-1  S                                * 163CA
        SETDEC                                   * 163CD
        P=      0                                * 163CF
        B=B-A   X                                * 163D1
        GONC    %>Text~1.loop4                   * 163D4
        LC(3)   #500                             * 163D7
        ?C<A    X                                * 163DC
        GOYES   %>Text~1.L6                      * 163DF
        LC(3)   #011                             * 163E1
        ?C<A    X                                * 163E6
        GOYES   %>Text~1.L7                      * 163E9
        B=0     A                                * 163EB
%>Text~1.loop4:
        P=      15                               * 163ED
%>Text~1.loop5:
        P=P+1                                    * 163EF
        B=B-1   X                                * 163F1
        GONC    %>Text~1.loop5                   * 163F4
        CPEX    1                                * 163F7
        P=      0                                * 163FB
        LC(1)   #9                               * 163FD
        GOC     %>Text~1.L8                      * 16400
%>Text~1.L6:
        LC(3)   #012                             * 16403
        ?B<=C   X                                * 16408
        GOYES   %>Text~1.loop4                   * 1640B
%>Text~1.L7:
        CSLC                                     * 1640D
        CSL     A                                * 16410
        LC(1)   #2                               * 16412
%>Text~1.L8:
        D=C     B                                * 16415
        B=0     W                                * 16418
        ABEX    M                                * 1641B
        C=A     XS                               * 1641E
        A=0     S                                * 16421
        SETDEC                                   * 16424
        C=C+C   XS                               * 16426
        GONC    %>Text~1.L9                      * 16429
        A=A+1   S                                * 1642C
%>Text~1.L9:
        C=D     B                                * 1642F
        CSTEX                                    * 16432
        ?ST=1   1                                * 16434
        GOYES   %>Text~1.L10                     * 16437
        GOTO    %>Text~1.L21                     * 16439
%>Text~1.L10:
        CSTEX                                    * 1643D
%>Text~1.loop11:
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
        GOYES   %>Text~1.L12                     * 1645E
        BSR     W                                * 16460
        A=A+1   X                                * 16463
        GONC    %>Text~1.L12                     * 16466
        A=0     S                                * 16469
%>Text~1.L12:
        B=0     WP                               * 1646C
        SETHEX                                   * 1646F
        B=B-1   WP                               * 16471
        P=      0                                * 16474
        B=0     P                                * 16476
        SETDEC                                   * 16479
        ?A=0    S                                * 1647B
        GOYES   %>Text~1.L13                     * 1647E
        A=-A    X                                * 16480
        LC(3)   #499                             * 16483
        ?C=A    X                                * 16488
        GOYES   %>Text~1.L18                     * 1648B
%>Text~1.L13:
        C=D     B                                * 1648D
        CSTEX                                    * 16490
        ?ST=1   0                                * 16492
        GOYES   %>Text~1.L14                     * 16495
%>Text~1.L14:
        CSTEX                                    * 16497
        GONC    %>Text~1.L18                     * 16499
        LC(3)   #300                             * 1649C
        D=C     X                                * 164A1
        C=A     A                                * 164A4
%>Text~1.loop15:
        C=C-D   X                                * 164A6
        GONC    %>Text~1.loop15                  * 164A9
        C=C+D   X                                * 164AC
        DSR     X                                * 164AF
        ?D#0    X                                * 164B2
        GOYES   %>Text~1.loop15                  * 164B5
        ?C=0    X                                * 164B7
        GOYES   %>Text~1.L18                     * 164BA
        B=C     P                                * 164BC
        A=A-C   A                                * 164BF
        ?A=0    S                                * 164C1
        GOYES   %>Text~1.L16                     * 164C4
        LC(1)   #3                               * 164C6
        A=A+C   A                                * 164C9
        B=C-B   P                                * 164CB
%>Text~1.L16:
        SETHEX                                   * 164CE
        LC(1)   #D                               * 164D0
        C=C-B   P                                * 164D3
        P=C     0                                * 164D6
%>Text~1.loop17:
        P=P+1                                    * 164DA
        B=B+1   P                                * 164DC
        GOC     %>Text~1.loop17                  * 164DF
        B=B-1   P                                * 164E2
%>Text~1.L18:
        SETHEX                                   * 164E5
        A=A+1   A                                * 164E7
        P=      14                               * 164E9
%>Text~1.loop19:
        ASL     WP                               * 164EB
        ?A=0    P                                * 164EE
        GOYES   %>Text~1.loop19                  * 164F1
        A=A-1   WP                               * 164F3
        GOTO    %>Text~1.L30                     * 164F6
%>Text~1.loop20:
        GOTO    %>Text~1.loop11                  * 164FA
%>Text~1.L21:
        ST=0    0                                * 164FE
        CSTEX                                    * 16501
        D=C     B                                * 16503
        P=C     1                                * 16506
        C=A     A                                * 1650A
%>Text~1.loop22:
        C=C+1   A                                * 1650C
        P=P-1                                    * 1650E
        GONC    %>Text~1.loop22                  * 16510
        C=C+C   XS                               * 16513
        GOC     %>Text~1.loop20                  * 16516
%>Text~1.loop23:
        P=P-1                                    * 16519
        ?P=     1                                * 1651B
        GOYES   %>Text~1.L25                     * 1651E
        C=C-1   X                                * 16520
        GONC    %>Text~1.loop23                  * 16523
        C=0     W                                * 16526
        ?B=0    M                                * 16529
        GOYES   %>Text~1.L26                     * 1652C
        C=B     WP                               * 1652E
        C=C+B   W                                * 16531
        C=0     WP                               * 16534
        ?C=0    W                                * 16537
        GOYES   %>Text~1.loop20                  * 1653A
        ?C=0    S                                * 1653C
        GOYES   %>Text~1.L26                     * 1653F
        CSR     W                                * 16541
        A=A+1   X                                * 16544
        GONC    %>Text~1.L24                     * 16547
        A=0     S                                * 1654A
%>Text~1.L24:
        P=P-1                                    * 1654D
        ?P#     1                                * 1654F
        GOYES   %>Text~1.L26                     * 16552
%>Text~1.L25:
        P=      0                                * 16554
        LC(3)   #011                             * 16556
        P=      2                                * 1655B
        ?C<A    X                                * 1655D
        GOYES   %>Text~1.loop20                  * 16560
        C=B     W                                * 16562
%>Text~1.L26:
        B=C     W                                * 16565
        ?A=0    S                                * 16568
        GOYES   %>Text~1.L28                     * 1656B
%>Text~1.loop27:
        BSR     W                                * 1656D
        P=P-1                                    * 16570
        A=A+1   X                                * 16572
        GONC    %>Text~1.loop27                  * 16575
%>Text~1.L28:
        SETHEX                                   * 16578
        B=B-1   WP                               * 1657A
        P=      0                                * 1657D
        B=A     P                                * 1657F
        ASR     B                                * 16582
        ?A=0    P                                * 16585
        GOYES   %>Text~1.L29                     * 16588
        LC(1)   #A                               * 1658A
        B=B+C   P                                * 1658D
%>Text~1.L29:
        A=0     W                                * 16590
        A=A-1   W                                * 16593
%>Text~1.L30:
        P=      0                                * 16596
        A=B     P                                * 16598
        D=D+D   P                                * 1659B
        BSL     W                                * 1659E
        GONC    %>Text~1.loop32                  * 165A1
        ?B=0    S                                * 165A4
        GOYES   %>Text~1.loop34                  * 165A7
        LC(1)   #E                               * 165A9
        C=C-A   P                                * 165AC
        P=C     0                                * 165AF
        LC(1)   #F                               * 165B3
        ?B#C    P                                * 165B6
        GOYES   %>Text~1.L31                     * 165B9
        A=0     A                                * 165BB
        A=A-1   A                                * 165BD
%>Text~1.L31:
        P=      0                                * 165BF
%>Text~1.loop32:
        C=B     S                                * 165C1
        B=B+1   S                                * 165C4
        GOC     %>Text~1.L35                     * 165C7
        LC(1)   #3                               * 165CA
        CSLC                                     * 165CD
%>Text~1.loop33:
        DAT0=C  B                                * 165D0
        D0=D0+  2                                * 165D3
        ?ST=0   0                                * 165D6
        GOYES   %>Text~1.loop34                  * 165D9
        C=A     A                                * 165DB
        C=-C    A                                * 165DD
        P=C     0                                * 165DF
        C=0     A                                * 165E3
        LC(10)  #1001001000                      * 165E5
        P=      0                                * 165F1
        ?C=0    P                                * 165F3
        GOYES   %>Text~1.loop34                  * 165F6
        LC(4)   #2E2C                            * 165F8
        GOSUB   ?Comma                           * 165FE
        DAT0=C  B                                * 16602
        D0=D0+  2                                * 16605
%>Text~1.loop34:
        BSL     W                                * 16608
        A=A-1   P                                * 1660B
        GONC    %>Text~1.loop32                  * 1660E
        ST=0    0                                * 16611
        LC(4)   #2C2E                            * 16614
        GOSUB   ?Comma                           * 1661A
        BSR     W                                * 1661E
        GOTO    %>Text~1.loop33                  * 16621
%>Text~1.L35:
        A=A+1   S                                * 16625
        RTNC                                     * 16628
        LC(2)   #45                              * 1662B
        DAT0=C  B                                * 1662F
        D0=D0+  2                                * 16632
        A=A-1   S                                * 16635
        ?A=0    S                                * 16638
        GOYES   %>Text~1.L36                     * 1663B
        LC(2)   #2D                              * 1663D
        DAT0=C  B                                * 16641
        D0=D0+  2                                * 16644
%>Text~1.L36:
        B=A     W                                * 16647
        A=0     W                                * 1664A
        A=A-1   W                                * 1664D
        ST=0    0                                * 16650
        GOC     %>Text~1.loop34                  * 16653

* refs (2): 165FE 1661A
* C.A = two characters -> C.B: the low one, or the high one when flag -51 (comma as fraction mark) is set
?Comma:
        D=C     A                                * 16656
        D1=(5)  #8084F                           * 16658
        C=DAT1  B                                * 1665F
        ?CBIT=0 2                                * 16662
        GOYES   ?Comma.L1                        * 16667
        DSR     A                                * 16669
        DSR     A                                * 1666B
?Comma.L1:
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
DOFIX.L1:
        A=A+1   A                                * 166EA
        GONC    DOSTD.L1                         * 166EC  always taken

* # ->
* refs (4): 1C441 45DCF 468CE B9207
DOSCI:
        CON(5)  (*)+5                            * 166EF  primitive code object
        A=0     A                                * 166F4
DOSCI.L1:
        A=A+1   A                                * 166F6
        GONC    DOFIX.L1                         * 166F8  always taken

* # ->
* refs (2): 1C475 B922A
DOENG:
        CON(5)  (*)+5                            * 166FB  primitive code object
        A=0     A                                * 16700
        A=A+1   A                                * 16702
        GONC    DOSCI.L1                         * 16704  always taken

* ->
* refs (3): 1C490 B91BC D13AD
DOSTD:
        CON(5)  (*)+5                            * 16707  primitive code object
        A=0     B                                * 1670C
        R0=A                                     * 1670F
        GOTO    DOSTD.L2                         * 16712
DOSTD.L1:
        R0=A                                     * 16716
        GOSBVL  POP#                             * 16719
        LC(5)   #0000B                           * 16720
        ?C>=A   A                                * 16727
        GOYES   DOSTD.L2                         * 1672A
        A=C     A                                * 1672C
DOSTD.L2:
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
* A.A = binary number, D0 = output -> its decimal digits as characters, D0 past them
Bin>Dec$:
        C=0     W                                * 1676A
        C=A     A                                * 1676D
        A=0     W                                * 1676F
        A=A+1   A                                * 16772
        SETDEC                                   * 16774
        B=0     W                                * 16776
Bin>Dec$.loop1:
        SB=0                                     * 16779
        CSRB                                     * 1677C
        ?SB=0                                    * 1677F
        GOYES   Bin>Dec$.L2                      * 16782
        B=B+A   W                                * 16784
Bin>Dec$.L2:
        A=A+A   W                                * 16787
        ?C#0    W                                * 1678A
        GOYES   Bin>Dec$.loop1                   * 1678D
        C=B     W                                * 1678F
        SETHEX                                   * 16792
        A=0     B                                * 16794
        P=      5                                * 16797
Bin>Dec$.loop3:
        A=A+1   B                                * 16799
        CSRC                                     * 1679C
        ?C#0    WP                               * 1679F
        GOYES   Bin>Dec$.loop3                   * 167A2
        P=      1                                * 167A4
        A=A-1   B                                * 167A6
Bin>Dec$.loop4:
        CSLC                                     * 167A9
        LC(1)   #3                               * 167AC
        DAT0=C  B                                * 167AF
        D0=D0+  2                                * 167B2
        A=A-1   B                                * 167B5
        GONC    Bin>Dec$.loop4                   * 167B8
        P=      0                                * 167BB
        RTNCC                                    * 167BD
        RPL

* -> flag
* refs (9): 17559 24FFF 250F4 25D0D 2616C 27FA8 ...
DPRADIX?:
        :: BINT51 TestSysFlag NOT ;              * 167BF  flag -51: Fraction mark: . / Fraction mark: ,

* # -> "#:\ "
* refs (5): 15D4C 31A48 39DCE 39DFB 3F610
#:>$:
        CON(5)  (*)+5                            * 167D8  primitive code object
        ASSEMBLE
        ST=0    9                                * 167DD
        GOTO    #>$.L1                           * 167E0

* # -> $
* refs (24): 15DCE 15DD8 15EB5 16199 161A3 219C2 ...
#>$:
        CON(5)  (*)+5                            * 167E4  primitive code object
        ST=1    9                                * 167E9
#>$.L1:
        GOSBVL  SAVPTR                           * 167EC
        ST=0    10                               * 167F3
        A=0     W                                * 167F6
        GOSBVL  POP#                             * 167F9
        R1=A                                     * 16800
        C=0     W                                * 16803
        B=0     A                                * 16806
        LC(1)   #A                               * 16808
#>$.loop2:
        B=B+1   A                                * 1680B
        ?C>A    W                                * 1680D
        GOYES   #>$.L3                           * 16810
        C=C+C   W                                * 16812
        D=C     W                                * 16815
        C=C+C   W                                * 16818
        C=C+C   W                                * 1681B
        C=C+D   W                                * 1681E
        GONC    #>$.loop2                        * 16821
#>$.L3:
        ?ST=1   9                                * 16824
        GOYES   #>$.L4                           * 16827
        B=B+1   A                                * 16829
        B=B+1   A                                * 1682B
#>$.L4:
        C=B     A                                * 1682D
        GOSUB   Make#:$                          * 1682F
        GOTO    stackitw.loop11                  * 16833

* refs (2): 1682F 168D6
* C.A = size, R1 = number -> new string (MAKE$) starting with the number in decimal; ": " follows unless ST9 is set
Make#:$:
        GOSBVL  MAKE$                            * 16837
        A=R1                                     * 1683E
        GOSBVL  Bin>Dec$                         * 16841
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
        GONC    stackitw.L1                      * 16867  always taken

* refs (1): 159A5
stackitw:
        CON(5)  (*)+5                            * 1686A  primitive code object
stackitw.L1:
        GOSBVL  POP#                             * 1686F
        R1=A                                     * 16876
        GOSBVL  SAVPTR                           * 16879
        C=0     A                                * 16880
        LC(1)   #2                               * 16882
        B=C     A                                * 16885
        LC(1)   #A                               * 16887
        ?C>A    A                                * 1688A
        GOYES   stackitw.L3                      * 1688D
        LC(2)   #64                              * 1688F
        ?C>A    A                                * 16893
        GOYES   stackitw.L2                      * 16896
        B=B+1   A                                * 16898
stackitw.L2:
        B=B+1   A                                * 1689A
stackitw.L3:
        B=B+1   A                                * 1689C
        GOSBVL  GetStrLenStk                     * 1689E
        A=C     A                                * 168A5
        A=A+B   A                                * 168A7
        D1=(5)  DcompWidth                       * 168A9
        C=0     A                                * 168B0
        C=DAT1  B                                * 168B2
        C=C+CON A,3                              * 168B5
        ?C>=A   A                                * 168BB
        GOYES   stackitw.L4                      * 168BE
        A=0     A                                * 168C0
        LA(2)   #16                              * 168C2
        ?C>A    A                                * 168C9
        GOYES   stackitw.L4                      * 168CC
        C=C+1   A                                * 168CE
stackitw.L4:
        R2=C                                     * 168D0
        ST=0    9                                * 168D3
        GOSUB   Make#:$                          * 168D6
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
        GOYES   stackitw.L10                     * 1690E
        C=C+B   A                                * 16910
        B=B+A   A                                * 16912
        D=C     A                                * 16914
        C=0     A                                * 16916
        LC(2)   #18                              * 16918
        C=C+C   A                                * 1691C
        ?D>=C   A                                * 1691E
        GOYES   stackitw.L6                      * 16921
        C=D     A                                * 16923
stackitw.loop5:
        B=C-B   A                                * 16925
        GOC     stackitw.L9                      * 16927
        BSRB                                     * 1692A
        LC(2)   #20                              * 1692D
        GONC    stackitw.L8                      * 16931
stackitw.L6:
        ST=1    0                                * 16934
        GOC     stackitw.loop5                   * 16937
stackitw.loop7:
        DAT1=C  B                                * 1693A
        D1=D1+  2                                * 1693D
stackitw.L8:
        B=B-1   B                                * 16940
        GONC    stackitw.loop7                   * 16943
stackitw.L9:
        C=A     A                                * 16946
stackitw.L10:
        GOSBVL  MOVEDOWN                         * 16948
        ?ST=1   0                                * 1694F
        GOYES   stackitw.L12                     * 16952
stackitw.loop11:
        GOVLNG  GPOverWrR0Lp                     * 16954
stackitw.L12:
        AD1EX                                    * 1695B
        GOSBVL  Clean$R0                         * 1695E
        GOTO    stackitw.loop11                  * 16965
        RPL

* refs (3): 1595A 159FF 16A18
* # 13: the characters of a stack line
StdDcompWidth:
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
* ob {state} -> $line {state'}: the next line of ob, at width DcompWidth, in edit form. {state} is where the last line stopped ({} to start) and {state'} is {} when ob is finished. Text is produced line by line, so a large object can be shown or edited without its whole text in memory.
DclLine:
        :: ClrISF803 GOTO DclLine~1 ;            * 169E1

* refs (2): 319CB 31B15
* ob {state} #width -> $line {state'}: DclLine at another width, keeping the form flag (#803); used for printing
DclLine#:
        :: GOTO DclLine#~1 ;                     * 169FA

* refs (2): 2FCAE 39E8C
* ob {state} -> $line {state'}: DclLine at the standard width
DclLine19:
        :: ClrISF803 StdDcompWidth               * 16A0E
DclLine#~1:
          !DcompWidth                            * 16A1D
DclLine~1:
          ?ATTNQUIT OVER TYPECMP? case DclCmp    * 16A22
          OVER TYPEARRAY? IT                     * 16A3B
          :: OVER 2D/3D(ar)? case                * 16A4A
            :: RDROP DclVecAr ;                  * 16A5E
            ISF803? case                         * 16A72
            :: RDROP DclLine19~1 ;               * 16A7C
          ;                                      * 16A90
          ERRSET                                 * 16A95
          :: DclResume COLA                      * 16A9A

* refs (4): 16BE6 16CD4 16D9F 17202
* Add the current object to the line by type; composites descend into their contents and leave resume information on the stack. Works on a 4-level frame with the object in level 4.
DclOb:
            :: 4PICK DUPROM-WORD? SWAP TYPECOL? NOTAND case DclAtom * 16AA9
              CK&DISPATCH0                       * 16AD1
              # 4000 DclArray                    * 16AD6  array any any any
              # 5000 DclList                     * 16AE5  list any any any
              # 8000 DclSeco                     * 16AF4  program any any any
              # 9000 DclSymb                     * 16B03  algebraic any any any
              # E000 DclSymb                     * 16B12  unit any any any
              # D000 DclTag                      * 16B21  tagged any any any
              # 2F000 DclDir                     * 16B30  directory any any any
              BINT0 DclAtom                      * 16B3F  any
            ;                                    * 16B49
          ;                                      * 16B4E
* An error during the walk unwinds to the marker pushed by DclResume and passes on
          ERRTRAP                                * 16B53
          :: BEGIN FixRRP DclMark? UNTIL ERRJMP ; ; * 16B58

* refs (2): 16BF7 1707C
* $ -> : add a composite's closing token, or end the line when it doesn't fit
DclCloser:
        :: RDROP DclFit? COLAITE OBJ_171DF DclEndLine ; * 16B80

* refs (1): 16AEF
* Lists: { and the elements, one by one, then }
DclList:
        :: IT                                    * 16BA3
          ::                                     * 16BAD

_{_:
            $ "{" DclFit? ?SEMI                  * 16BB2
            RDROP XYZ>ZCOLA DclEndLine ;         * 16BC8
          DclNextOb? case DclOb                  * 16BDC

_}_:
          $ "}" DclCloser ;                      * 16BEB

* refs (1): 16B3A
* Directories: DIR, each name followed by its object, then END, indented
DclDir:
        :: OVER NULL$? NOTcase                   * 16C01
          :: IT ROTROT2DROP                      * 16C15
            COLA DclEndLine                      * 16C24
          ;                                      * 16C2E
          casedrop                               * 16C33
          :: Dcl+Indent                          * 16C38

_DIR_:
            $ "DIR" ?DclIndent$ Dcl+Indent SWAP ONE{}N SWAPCOLA DclEndLine ; * 16C42
          SWAPDUP TYPELIST? DUPUNROT ?CARCOMP 3UNROLL 4UNROLL DclNextOb? * 16C75
          case                                   * 16C98
          :: 7ROLL IT                            * 16C9D
            :: SWAP4PICK RAM-WORDNAME ID>$ ?DclIndent$ !append$SWAP ; * 16CAC
            COLA DclOb                           * 16CCF
          ;                                      * 16CD9
          4ROLL 2DROP Dcl-Indent                 * 16CDE

_END_:
          $ "END" ?DclIndent$ Dcl-Indent COLA OBJ_17211 * 16CED
        ;                                        * 16D11

* refs (1): 16B2B
* Tagged objects: :tag: then the object
DclTag:
        :: case                                  * 16D16
          ::                                     * 16D20

_:_:
            $ ":" 4PICK ID>$ OVER !append$SWAP 6PICK DclMark? ISF805? * 16D25
            ISF803? OR AND ITE_DROP !insert$ DclFit? case OBJ_171E9 * 16D54
DclSymb~1:
            XYZ>ZCOLA DclEndLine ;               * 16D7C

* refs (1): 16FD4
* Go on with the next object of the composite, or close it when there are none
DclNext:
          :: RDROP DclNextOb? COLAITE DclOb OBJ_171DF ; ; * 16D8B

* refs (2): 16B0D 16B1C
* Algebraics and units: their text as one piece
DclSymb:
        :: IT                                    * 16DB3

Rep2(<FFFFF>):
          :: SWAPDROP MINUSONE SWAP ;            * 16DBD
          SPACE$ DclFit? NOT?GOTO DclSymb~1 $DropLast OBJ_34D3C * 16DD6

* refs (3): 16E21 16FC0 16FFC
* flag -> : the word fit: go on at the same level, otherwise finish the line and resume there
DclPut:
          :: RDROP COLAITE OBJ_171E9 DclEndLine ; ; * 16DF4

* refs (3): 16E80 16E8A 16ED5
* $line $word -> : add the word to the line and go on
DclPut$:
        :: DclFit? DclPut ;                      * 16E17

* refs (1): 16AFE
* Programs: each word on the line in turn; program structures (MACRODCMP) change the indentation and start new lines
DclSeco:
        :: 4PICK REQcasedrop x'                  * 16E2B
          DclTick ROM-WORD? NOTcase DclSecoOb    * 16E3F
          DROPSWAPDROP SWAP ISF805? case DclWord * 16E53
          MACRODCMP NOTcase DclWord              * 16E6C
          NOTcase DclPut$                        * 16E7B
          DUP#0=csedrp DclPut$ 3PICK NULL$? NOTcase2drop DclEndLine * 16E85
          DUP#1= IT Dcl+Indent                   * 16EA3
          SWAP DclIndent$ SWAP #3= IT Dcl-Indent * 16EB2
          COLA DclPut$                           * 16ED0
        ;                                        * 16EDA

* refs (1): 16E3F
* Program words ' ob ': names are written 'X' as a unit
DclTick:
        :: DROP ROTROT2DROP UNROTDUP 4UNROLL NEXTCOMPOB DROP PALPTRDCMP DROP * 16EDF
          4UNROLL DclGetOb ?SKIP NULL{}          * 16F0C
          ROT 3PICK DclGetOb ?SKIP NULL{}        * 16F20
          SWAPDROPSWAP 4UNROLL ' xENDTIC EQOVER DUPTYPEIDNT? SWAP TYPELAM? * 16F39
          OR ANDITE                              * 16F61
          :: 5ROLLDROP ID>$ addtics ;            * 16F6B
          :: 2DROP 4PICK 4ROLL ; 4ROLLSWAP DclFit? DUP 4ROLL 6ROLL RPITE * 16F84
          3UNROLL DclPut                         * 16FBB
        ;                                        * 16FC5

* refs (1): 16E4E
* A non-ROM word in a program: an object in its own right
DclSecoOb:
        :: DROP DclNext ;                        * 16FCA

* refs (2): 16ACC 16B44
* Any object without structure: decompile it whole
DclAtom:
        :: DROPSWAPDROP SWAPCOLA                 * 16FDE

* refs (2): 16E67 16E76
* ob -> : a ROM word in a program: its name
DclWord:
          :: decomp$w DclFit? DclPut ; ;         * 16FED

* refs (1): 16AE0
* Arrays: real and complex arrays row by row; other types show "Array of ..."
DclArray:
        :: DROP 3PICK prefix(ar) DUP TYPEREAL EQ SWAP TYPECMP EQOR NOTcase * 1700B
          :: $ "Array of " BINT1 5PICK GETATELN IT $+TypeName * 17042
            DclCloser ;                          * 1707C
          DUPNULL$? NOTcase DclEndLine           * 17086
          3PICK 2D/3D(ar)? case DclVec2D3D       * 17095
          3PICK Vector? ?SKIP                    * 170A9
          :: OVER#0= ITE CHR_[ CHR_Space         * 170B8
            >T$ ;                                * 170D1
          lbrac !append$ SWAP#1+SWAP 3PICK DUPUNROT MDIMS ITE SWAP BINT1 * 170DB
          4UNROLLDUP 6PICK #* #1+DUP ROT#- DclElems * 17108

* refs (1): 17158
* Close a matrix row; the next row starts on a new line
DclRowEnd:
          :: tok] !append$ ; SWAP3PICK #<>case DclEndLine * 17126
          3PICK Vector? ?SKIP DclRowEnd          * 17149
          COLA OBJ_17211                         * 1715D
        ;                                        * 17167

* refs (1): 170A4
* Two- and three-element vectors, shown in the current coordinate mode
DclVec2D3D:
        :: SWAPDROP #3= 3UNROLL tok[ TRUE DclVecEnd drop;dq DclVec2D3D~1 ; * 1716C

* refs (2): 171EE 17220
* Leave a composite: drop to the level above, or stop with {} at the marker
DclLevelUp:
        :: OVER DclMark? case                    * 1719E
          :: RDROP SWAPDROP NULL{} ;             * 171B2
          3UNROLL DclGetOb 2DROP ;               * 171CB

* refs (2): 16B94 16DA4
* Probably: line decompiler: keep the top of the frame and go on as the routine at #171E9
OBJ_171DF:
        :: XYZ>ZCOLA                             * 171DF

* refs (2): 16D77 16E03
* Probably: line decompiler: leave a composite and go on with what follows it in its parent
OBJ_171E9:
          :: DclLevelUp ROT FALSE COLA DclOb     * 171E9
          ;                                      * 17207
        ;                                        * 1720C

* refs (2): 16D0C 17162
OBJ_17211:
        :: XYZ>ZCOLA                             * 17211

* refs (2): 17194 1726B
* Probably: line decompiler: go up levels until a composite with more elements is found, then end the line there
DclVec2D3D~1:
          :: DclLevelUp 2DUP DclStepOb casedrop  * 1721B
            :: ROT COLA DclEndLine               * 17234
            ;                                    * 17248
            OVERDUP TYPERRP? SWAP TYPELIST? ORNOT case2drop DclVec2D3D~1 * 1724D
            ROT COLA                             * 17270

* refs (10): 16B99 16BD2 16C29 16C6B 16D81 16E08 ...
* End the line: pop the walk's levels back to the marker, collecting the resume state as a list
DclEndLine:
            :: NULL{} BEGIN ROT >HCOMP ROT FixRRP DROP3PICK DclMark? UNTIL * 1727A
              ROTDROP ;                          * 172AC
          ;                                      * 172B6
        ;                                        * 172BB

* refs (1): 16A9F
* ob {state} -> ...: start at ob, or descend again along the saved {state}. Pushes the marker that ends the walk.
DclResume:
        :: Mark$ 3UNROLL BINT0 NEXTCOMPOB NOTcase * 172C0
          :: BINT14 PADCOUNT! DROPZERO NULL$TEMP TRUE ; * 172DE
          3UNROLL BEGIN NEXTCOMPOB WHILE         * 17301
          :: 5PICK 5PICK DclStepOb DROPSWAP 2SWAP ; REPEAT DROP NULL$TEMP * 17315
          FALSE ;                                * 17347

* refs (3): 16BDC 16C93 16D95
* -> flag: move to the next element of the composite in the frame, if it has one
DclNextOb?:
        :: 3PICK3PICK DclStepOb DUP NOT?SEMI     * 17351
          ROT ZEROSWAP ROTDUP ;                  * 1736A

* refs (3): 1722A 17324 1735B
* Next element of the composite, with the frame moved up a level when there is one
DclStepOb:
        :: DclGetOb DUP ITE 2SWAP 3UNROLL        * 1737E
          2DROP ;                                * 1739C

* refs (4): 16F11 16F2A 171D0 17383
* Step into the composite: next element by its type (see DclNextByType)
DclGetOb:
        :: SWAP2DUP TYPE DclNextByType DUP case 5ROLLDROP * 173A6
          ROTSWAP ;                              * 173C9

* refs (1): 173B5
* #type -> ob TRUE | FALSE: the next element of a secondary or list (NEXTCOMPOB), a directory (DclNextVar), or the object of a tagged object
DclNextByType:
        :: TYPECOL EQcasedrop NEXTCOMPOB         * 173D3
          TYPELIST EQcasedrop NEXTCOMPOB         * 173E7
          TYPERRP EQcasedrop DclNextVar          * 173F6
          DROP BINT2 EQcasedrop FALSE            * 17405
          #1+ 2DUP ONE_EQ caseTRUE TAG>          * 17419
          DROPTRUE ;                             * 17432

* refs (1): 17400
* Next variable of a directory (NEXTRRPOB) with its name in a list
DclNextVar:
        :: DUPTYPELIST? casedrpfls NEXTRRPOB     * 1743C
          DUP NOT?SEMI                           * 17450
          ROT ONE{}N 3UNROLL ;                   * 1745A

* refs (6): 15BAB 15BB0 1785B 352E1 352F0 352FF
->str(c):
        :: ->str(c)~1 TRUE ->str(c)~2 DROP ;     * 1746E

* refs (1): 16A68
* A 2D or 3D vector: [ then its elements in the angle mode
DclVecAr:
        :: #3= 3UNROLL INNERCOMP #0=ITE          * 1748C
          :: BINT0 tok[ ; NULL$TEMP FALSE        * 174A5

* refs (1): 1718A
* Set up the closing ] and the polar or rectangular forms of the elements
DclVecEnd:
          :: tok] SPACE$ 6ROLL Vec>%% OBJ_34C49 3PICK TYPEREAL? IT * 174C3

* refs (6): 296B0 45213 6D8B9 96565 A9A11 B3F91
9rolld:
            :: BINT9 UNROLL ;                    * 174F0
            GOTO DclVecAr~1 ;                    * 17504
        ;                                        * 17513

* refs (3): 16A36 31CEF 31D1C
* Complex numbers in the same frame, using the steps of DclCmpSteps
DclCmp:
        :: INNERCOMP #0=ITE                      * 17518

* refs (1): 17473
->str(c)~1:
          :: BINT0 toklparen ; NULL$TEMP FALSE   * 17527

* refs (1): 1747D
->str(c)~2:
          :: FALSE 5UNROLL tokrparen DPRADIX? tok, tok; RPITE 6ROLL * 17545
            C>%%Coords                           * 17572
            OBJ_34C49                            * 17577
DclVecAr~1:
            6ROLL 7ROLL DUP DclCmpSteps >R       * 1757C
DclVecAr~1.loop1:
            DUP#0= ?GOTO DclVecAr~1.L2 RSKIP #1- GOTO DclVecAr~1.loop1 * 17595
DclVecAr~1.L2:
            DROP ;                               * 175B8
        ;                                        * 175C2

* refs (1): 1758B
* The steps of a complex or a vector in polar form, as a list: each is run in turn by putting it on the return stack
DclCmpSteps:
        {                                        * 175C7
          :: 4PICK a%>$ DclCmpPut ; DclCmpAdd    * 175CC
          :: 3PICK TRUE BINT16 DclAngle ;        * 175EA
          :: 8PICK case DclCmpAdd                * 17608
            #2+ COLASKIP ;                       * 1761C
          :: BINT9 PICK BINT16 TestSysFlag BINT15 DclAngle ; * 1762B  flag -16: coordinate system
          :: 6PICK DclCmpPut ; DROP 7UNROLL 5DROP IT SWAPDROP * 17653
          NULL{} }                               * 17680

* refs (2): 175E5 17617
* Add a complex or vector token and go on
DclCmpAdd:
        :: 5PICK SPACE$ EQcasedrop #1+           * 1768A
          DclCmpFit ;                            * 176A3

* refs (2): 175FE 17649
* Add an angle with its ∡ sign where the coordinate flags call for it
DclAngle:
        :: RDROP TestSysFlag AND SWAP a%>$ SWAP ?SKIP DclCmpPut * 176AD
          tokanglesign !!insert$ DclCmpPut ;     * 176DA

* refs (4): 175DB 1765D 176D5 176E4
* Add an element, a separator first when one is needed
DclCmpPut:
        :: RDROP 3PICK NULL$? ?SKIP              * 176EE
          :: 6PICK SPACE$ EQ NOT?SEMI            * 17707
            +(sp,st) ;                           * 17720
          DclCmpFit ;                            * 1772A

* refs (2): 176A3 1772A
* Add the token if it fits; otherwise stop and save the step reached
DclCmpFit:
        :: RDROP ROTSWAP 8PICK ?SKIP             * 17734
          :: OVER NULL$? ?SEMI                   * 1774D
            2LEN$#+ DcompWidth@ #> NOT?SEMI      * 17761
            DROP 7UNROLL 6UNROLL 5DROP ROT IT ROTDROP * 17775
            ONE{}N 2RDROP ;                      * 17798
          !append$ SWAP#1+ ;                     * 177A7

* refs (4): 16B67 16D4A 171A8 172A2
* ob -> flag: ob is the marker (the object at #25CF5) that bounds the walk on the stack
DclMark?:
        :: Mark$ EQ ;                            * 177B6

* refs (7): 16B8A 16BBE 16D6D 16DDB 16E1C 16FA2 ...
* $line $word -> $line' TRUE when the two fit in DcompWidth with a space between, or when one is empty; else $line $word FALSE
DclFit?:
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
* Add array elements until the line is full
DclElems:
        :: ' a%>$ ' ->str(c) 6PICK TYPERARRY? NOT?SWAPDROP 5UNROLL DO * 17847
          SWAPINDEX@ PULLEL 4PICK EVAL ROTSWAP !append$ APPEND_SPACE ISF805? * 17879
          IT ?DclFull                            * 178A1
          LOOP ROTROT2DROP ;                     * 178AB

* refs (1): 178A6
* $ -> $: leave the DO loop once the text passes the width
?DclFull:
        :: DUPLEN$ DcompWidth@ #3+ #< ?SEMI      * 178BA
          ExitAtLOOP ;                           * 178D8

* refs (3): 16C3D 16C57 16EAD
* Indent by two more (PADCOUNT)
Dcl+Indent:
        :: PADCOUNT@ #2+ PADCOUNT! ;             * 178E2

* refs (3): 16CE8 16D02 16ECB
* Indent by two less
Dcl-Indent:
        :: PADCOUNT@ #2- PADCOUNT! ;             * 178FB

* refs (3): 16C52 16CC0 16CFD
* $ -> $': as DclIndent$, except in stack display (flag #805), which has no indentation
?DclIndent$:
        :: ISF805? ?SEMI                         * 17914
          DclIndent$ ;                           * 17923

* refs (2): 16EB7 17923
* $ -> $': prefix the current indentation
DclIndent$:
        :: PADCOUNT@ DUP#0=csDROP 14SPACES$ BINT1 ROT SUB$ !insert$ ; * 1792D

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
        GOYES   DcompWidth@.L1                   * 1799B
        C=C-1   A                                * 1799D
        C=0     P                                * 1799F
DcompWidth@.L1:
        R0=C                                     * 179A2
        GOVLNG  PUSH#LOOP                        * 179A5

* refs (3): 170AE 1714E 31CC2
* array -> flag: the array has one dimension
Vector?:
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
        GOYES   addrTEMPTOP.L1                   * 179F8
        D0=(5)  TEMPOB                           * 179FA
        C=DAT0  A                                * 17A01
        ?C>A    A                                * 17A04
        GOYES   addrTEMPTOP.L1                   * 17A07
        ST=1    0                                * 17A09
addrTEMPTOP.L1:
        GOSBVL  Rrp>Last                         * 17A0C
        CD0EX                                    * 17A13
        D1=C                                     * 17A16
        A=DAT1  A                                * 17A19
        ?A#0    A                                * 17A1C
        GOYES   addrTEMPTOP.L2                   * 17A1F
        GOTO    FixRRP.L4                        * 17A21
addrTEMPTOP.L2:
        ABEX    A                                * 17A25
        ?A#0    A                                * 17A27
        GOYES   addrTEMPTOP.L4                   * 17A2A
        C=C+B   A                                * 17A2C
        D0=C                                     * 17A2E
addrTEMPTOP.loop3:
        GOSBVL  SKIPVARNAME                      * 17A31
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
addrTEMPTOP.L4:
        ?ST=1   0                                * 17A6A
        GOYES   addrTEMPTOP.L5                   * 17A6D
        B=A     A                                * 17A6F
addrTEMPTOP.L5:
        C=C+B   A                                * 17A71
        D0=C                                     * 17A73
addrTEMPTOP.loop6:
        ?A>B    A                                * 17A76
        GOYES   addrTEMPTOP.loop3                * 17A79
        LC(5)   #00005                           * 17A7B
        B=B-C   A                                * 17A82
        ?B#C    A                                * 17A84
        GOYES   addrTEMPTOP.L7                   * 17A87
        GOTO    FixRRP.L1                        * 17A89
addrTEMPTOP.L7:
        D0=D0-  5                                * 17A8D
        C=DAT0  A                                * 17A90
        B=B-C   A                                * 17A93
        ?ST=0   0                                * 17A95
        GOYES   addrTEMPTOP.L9                   * 17A98
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
        GOYES   addrTEMPTOP.L8                   * 17ABC
        C=C-1   A                                * 17ABE
        C=C+1   M                                * 17AC0
addrTEMPTOP.L8:
        LC(5)   DOTAG                            * 17AC3
        DAT0=C  7                                * 17ACA
        C=RSTK                                   * 17ACE
addrTEMPTOP.L9:
        AD0EX                                    * 17AD0
        A=A-C   A                                * 17AD3
        AD0EX                                    * 17AD5
        GONC    addrTEMPTOP.loop6                * 17AD8  always taken
        RPL

* refs (2): 16B62 17298
FixRRP:
        :: DUPTYPERRP? IT                        * 17ADB
          CODE                                   * 17AEA  141 nibbles
            GOSBVL  SAVPTR                       * 17AF4
            A=DAT1  A                            * 17AFB
            GOSBVL  Rrp>Last                     * 17AFE
            AD0EX                                * 17B05
            D1=A                                 * 17B08
FixRRP.L1:
            C=DAT1  A                            * 17B0B
            ?C=0    A                            * 17B0E
            GOYES   FixRRP.L4                    * 17B11
            AD1EX                                * 17B13
            D1=A                                 * 17B16
            A=A+C   A                            * 17B19
            D1=D1+  5                            * 17B1B
            C=DAT1  A                            * 17B1E
            D1=D1-  5                            * 17B21
            C=C-1   A                            * 17B24
            GOC     FixRRP.L4                    * 17B26
FixRRP.loop2:
            R1=C                                 * 17B29
            D0=A                                 * 17B2C
            B=A     A                            * 17B2F
            GOSBVL  SKIPVARNAME                  * 17B31
            GOSBVL  SKIPOB                       * 17B38
            C=0     M                            * 17B3F
            C=DAT0  7                            * 17B42
            C=0     A                            * 17B46
            C=C-1   M                            * 17B48
            GONC    FixRRP.L3                    * 17B4B
            C=0     M                            * 17B4E
FixRRP.L3:
            CD0EX                                * 17B51
            D0=C                                 * 17B54
            C=C-B   A                            * 17B57
            DAT0=C  7                            * 17B59
            D0=D0+  5                            * 17B5D
            AD0EX                                * 17B60
            C=R1                                 * 17B63
            C=C-1   A                            * 17B66
            GONC    FixRRP.loop2                 * 17B68
            C=0     M                            * 17B6B
            CD1EX                                * 17B6E
            D1=C                                 * 17B71
            C=A-C   A                            * 17B74
            DAT1=C  10                           * 17B76
FixRRP.L4:
            GOVLNG  GPOverWrFLp                  * 17B7A
          ENDCODE                                * 17B81
        ;                                        * 17B81

* refs (3): 17C0D 17C48 3859D
VLM:
        :: RDROP VLMClrLeeway ClrBusyAnn RECLAIMDISP ClrDA1IsStat * 17B86
          ShowHeldAnn ERROR@ ErrResetState #1<> VLMRoomOK? AND ?GOTO VLM.L1 * 17BA4
          ERRBEEP DoMenuMTH ERRORCLR #135_64EAA JstGetTHEMESG DISPROW1 * 17BCC
          ERRSET VLMAsk ERRTRAP VLMAgain         * 17BEA
VLM.L1:
          VLMReserve VLMRestart ERRTRAP VLM ;    * 17BFE

* refs (1): 17C03
* Re-enter the outer loop at HOME after recovering
VLMRestart:
        :: HOMEDIR ERRSET SetThisRow ClrDAsOK GOTO StartupProc~1.L1 ; * 17C17

* refs (1): 17BF9
* Empty the stack, garbage-collect and start the dialog again
VLMAgain:
        CON(5)  (*)+5                            * 17C3F  primitive code object
        ASSEMBLE
        GOSUB   GCEmptyStack                     * 17C44
        LC(5)   VLM                              * 17C48
        A=C     A                                * 17C4F
        PC=(A)                                   * 17C51

* refs (1): 17B90
* Forget the reserve: leeway = 0
VLMClrLeeway:
        CON(5)  (*)+5                            * 17C55  primitive code object
        A=0     A                                * 17C5A
        D1=(5)  leeway                           * 17C5C
        DAT1=A  A                                * 17C63
        GOTO    DropSysObs.L1                    * 17C66
        RPL

* refs (1): 17BEF
* Out of Memory dialog: offers to delete, in turn, the command line, stack levels, saved items, PICT, key assignments, alarms, then variables and port libraries, until there is room
VLMAsk:
        :: #134_64EA0 JstGetTHEMESG DISPROW3 Y/N-Menu BEGIN HOMEDIR * 17C6A
          NoEditLine? ?SKIP                      * 17C8D
          :: #13D_64EF0 JstGetTHEMESG VLMPurge? InitEd&Modes ; * 17C97
VLMAsk.loop1:
          DEPTH #0=?SKIP                         * 17CB5
          :: VLMAsk~1 OVER $+TypeName VLMPurge?  * 17CBF
            :: DROP CK0NOLASTWD 3RDROP GOTO VLMAsk.loop1 ; ; * 17CD8
          NoMemComLine? ?SKIP                    * 17D00
          :: #138_64EC8 JstGetTHEMESG VLMPurge? DelMemComLine ; * 17D0A
          NoLastStack? ?SKIP                     * 17D28
          :: #137_64EBE JstGetTHEMESG VLMPurge?  * 17D32

DelLastStack:
            :: ABND BINT0 ' SAVELAM CACHE ERRSET ; ; * 17D46
          NoLastArg? ?SKIP                       * 17D73
          :: #13B_64EE6 JstGetTHEMESG VLMPurge? DelLastArg ; * 17D7D
          GBUFF GROBDIM DROP #0=?SKIP            * 17D9B
          ::                                     * 17DAF

_PICT_:
            $ "PICT" VLMPurge? KILLADISP ;       * 17DB4
          GetUserKeys NULL{} EQUAL ?SKIP         * 17DD5
          :: #139_64ED2 JstGetTHEMESG VLMPurge? ClrUserKeys ; * 17DE9
          alarm<>{}? IT                          * 17E07
          :: #13A_64EDC JstGetTHEMESG VLMPurge? DelAlarrm(0) ; * 17E11
          DEPTH #0=?SKIP                         * 17E2F
          :: #136_64EB4 JstGetTHEMESG VLMPurge? DelStack ; CONTEXT@ * 17E39
          LastNonNull IT VLMAskVars              * 17E5C
          AdrPort0 NEXTLIBBAK IT                 * 17E6B
          :: BEGIN NEXTLIBBAK DUP ITE 4ROLL SWAP * 17E7A
            REFERENCED? ITE DROP                 * 17E9D
            :: VLMAskVar casedrop                * 17EAC
              :: IT 2DROP                        * 17EBB
                2RDROP 2RDROP ;                  * 17ECA
              NOTcaseDROP purge(bk,s)            * 17ED9
            ;                                    * 17EE3
            NOT_UNTIL ;                          * 17EE8
          NULL$ DISPROW5 NULL$ DISPROW6 VLMRoomOK? UNTIL ; * 17EF2

* refs (1): 17C7E
Y/N-Menu:
        CON(5)  (*)+5                            * 17F15  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 17F1A
        ST=0    15                               * 17F21
        LC(5)   YesNoLabels                      * 17F24  code in the self-test area
        GOSBVL  SUB_7008B                        * 17F2B
        GOSBVL  AllowIntr                        * 17F32
        GOVLNG  GETPTRLOOP                       * 17F39
        RPL

* refs (2): 17BFE 3861A
* Give leeway a fresh 184-nibble hex string. It holds the system's work space at the out-of-memory dialog.
VLMReserve:
        :: NULLHXS # B8 EXPAND                   * 17F40
          CODE                                   * 17F59  28 nibbles
            A=DAT1  A                            * 17F63
            LC(5)   leeway                       * 17F66
            CD0EX                                * 17F6D
            DAT0=A  A                            * 17F70
            D0=C                                 * 17F73
            D1=D1+  5                            * 17F76
            D=D+1   A                            * 17F79
            GOTO    DropSysObs.L2                * 17F7B
          ENDCODE                                * 17F7F
        ;                                        * 17F7F

* refs (9): 17CA6 17CD3 17D19 17D41 17D8C 17DC6 ...
* $ -> : show $ with the question and run the next object in the stream if the answer is YES
VLMPurge?:
        :: DISPROW5 'R VLMYesNo casedrop 2RDROP  * 17F84
          NOTcaseDROP EVAL                       * 17FA2
        ;                                        * 17FAC

* refs (2): 17F93 181BE
* -> flag TRUE (a menu key: YES or NO) | FALSE (ATTN, when memory is now enough): waits, turning off on timeout
VLMYesNo:
        :: NOBLINK                               * 17FB1
VLMYesNo.loop1:
          SetISF801 GETKEY ?GOTO VLMYesNoKey ATTN? ?GOTO VLMYesNo.L2 * 17FBB
          TIMEOUT? IT off!                       * 17FDE
          UART? IT FLUSHRSBUF                    * 17FED
          GOTO VLMYesNo.loop1                    * 17FFC
VLMYesNo.L2:
          ATTNFLGCLR ClrTimeout VLMRoomOK? caseTRUE ERRBEEP * 18006
          GOTO VLMYesNo.loop1 ;                  * 1801F
