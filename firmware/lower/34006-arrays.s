* HP 48GX ROM revision R, #34006-#36038: Arrays
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: NULLLAM NextInArray MDIMS PUTEL PULLLONGEL PULLEL PULLREALEL DOARRYPRG2 PUTREALEL SWITCHFLOATS FINDVAR DOARRYPRG1
* Follows on from the previous file (at #34006 in the original ROM).
        RPL

* refs (3): 33571 33684 3371A
OBJ_34006:
        :: BINT2 BINT5 GOTO L_34051 ;            * 34006

* refs (5): 333F5 33495 334D6 335DA 3382D
OBJ_34024:
        :: BINT2 BINT4 GOTO L_34051 ;            * 34024

* refs (1): 33B1B
OBJ_34042:
        :: BINT1 BINT5                           * 34042
L_34051:
          CHECKKEY NOTcase2DROP 7GETLAM          * 34051
          case 3DROP                             * 34060
          DROPOVER OBJ_34771 OVER OBJ_34771 2DUP %< ITE ROTSWAP 4ROLLROT * 3406A
          OBJ_340B0 DISPROW1 OBJ_340B0 DISPROW2 ; * 34097

* refs (2): 34097 340A1
OBJ_340B0:
        :: DUP a%>$ SWAP %0<                     * 340B0

+(_+_,st):
          ?SKIP                                  * 340C9
          :: tok+ !insert$ ;                     * 340CE
          OVER OBJ_3437C ITE                     * 340E2
          :: OVER OBJ_347DA %0>                  * 340F1

+:
            $ "+  "                              * 34105

-:
            $ "-  " RPITE ;                      * 34115

?:
          $ "?  "                                * 3412F
          ROTDROP !insert$ ;                     * 3413F

* refs (4): 33175 331AC 331CA 333AF
OBJ_3414E:
        :: NoAttn?Semi BINT2 BINT3 BINT4 GOTO L_34298 ; * 3414E

* refs (2): 33422 33468
OBJ_34176:
        :: NoAttn?Semi BINT2 BINT5 BINT4 GOTO L_34298 ; * 34176

* refs (1): 33553
OBJ_3419E:
        :: NoAttn?Semi BINT2 BINT3 BINT4 GOTO L_34298 ; * 3419E

* refs (1): 33666
OBJ_341C6:
        :: NoAttn?Semi BINT4 BINT3 BINT2 GOTO L_34298 ; * 341C6

* refs (1): 337CE
OBJ_341EE:
        :: NoAttn?Semi BINT4 BINT2 BINT5 GOTO L_34298 ; * 341EE

* refs (1): 33A80
OBJ_34216:
        :: NoAttn?Semi BINT2 BINT4 BINT3 GOTO L_34257 ; * 34216

* refs (1): 33B6B
OBJ_3423E:
        :: NoAttn?Semi BINT1 BINT5 BINT4         * 3423E
L_34257:
          3UNROLL                                * 34257

* refs (1): 33C38
OBJ_3425C:
          :: OVER OBJ_347DA %ABS OVER OBJ_347DA %ABS %<= ?SEMI * 3425C
            SWAP ;                               * 34289
          ROT                                    * 34293
L_34298:
          RDROP SWAP OBJ_34771 SWAP OBJ_34771 ROT OBJ_34771 OBJ_33DAA OVER * 34298
          5UNROLL XEQSTOID THREE{}N              * 342C5
          :: 7GETLAM NOT?SEMI                    * 342D4
            6GETLAM SWAP 5GETLAM SWAP ;          * 342E3
          ABND                                   * 342FC

* 2563d A03h
* refs (5): 32FDB 48B61 49BFA 9EFDF 9F1EB
ATTN#:
          # A03 FLUSHKEYS ATTNFLGCLR TRUE ;      * 34301

* refs (47): 33166 33170 33198 331BB 331E3 33224 ...
OBJ_3431F:
        CON(5)  (*)+5                            * 3431F  primitive code object
        ASSEMBLE
        GOSUB   SUB_34847                        * 34324
        A=R0                                     * 34328
        LC(5)   #00070                           * 3432B
        A=A+C   A                                * 34332
        C=R2                                     * 34334
        CSL     A                                * 34337
        C=C+A   A                                * 34339
        CD1EX                                    * 3433B
        R1=C                                     * 3433E
        C=R3                                     * 34341
        CSL     A                                * 34344
        C=C+A   A                                * 34346
        A=DAT1  W                                * 34348
        D1=C                                     * 3434C
        DAT1=A  W                                * 3434F
        A=R0                                     * 34353
        C=R2                                     * 34356
        CSL     A                                * 34359
        C=C+A   A                                * 3435B
        D1=C                                     * 3435D
        C=R3                                     * 34360
        CSL     A                                * 34363
        C=C+A   A                                * 34365
        A=DAT1  W                                * 34367
        D1=C                                     * 3436B
        DAT1=A  W                                * 3436E
        A=R1                                     * 34372
L_34375:
        D1=A                                     * 34375
        GOTO    L_34744                          * 34378

* refs (7): 33184 331F7 333B9 333CD 333E6 3385A ...
OBJ_3437C:
        CON(5)  (*)+5                            * 3437C  primitive code object
        GOSUB   SUB_348A8                        * 34381
        GOTO    L_343A4                          * 34385

* refs (2): 334AE 33521
OBJ_34389:
        CON(5)  (*)+5                            * 34389  primitive code object
        C=0     A                                * 3438E
        GOTO    L_343A0                          * 34390

* refs (6): 331CF 33486 33558 3366B 33A85 33B70
OBJ_34394:
        CON(5)  (*)+5                            * 34394  primitive code object
        LC(5)   #00003                           * 34399
L_343A0:
        GOSUB   SUB_348BC                        * 343A0
L_343A4:
        A=R0                                     * 343A4
        LC(5)   #00070                           * 343A7
        A=A+C   A                                * 343AE
        C=R2                                     * 343B0
        CSL     A                                * 343B3
        C=C+A   A                                * 343B5
        CD1EX                                    * 343B7
        A=DAT1  A                                * 343BA
        D1=C                                     * 343BD
        D1=D1-  5                                * 343C0
        D=D-1   A                                * 343C3
        A=A+1   XS                               * 343C5
        ?A#0    XS                               * 343C8
        GOYES   L_343CD                          * 343CB
L_343CD:
        GOTO    L_34A4F                          * 343CD

* refs (5): 33409 3350D 3368E 33837 33B25
OBJ_343D1:
        CON(5)  (*)+5                            * 343D1  primitive code object
        GOSUB   SUB_34847                        * 343D6
        GOSUB   SUB_3448A                        * 343DA
        GONC    L_343FB                          * 343DE
        LC(15)  #999999999999499                 * 343E1
        A=C     M                                * 343F2
        A=C     X                                * 343F5
        GOC     L_34465                          * 343F8
L_343FB:
        ?C=0    W                                * 343FB
        GOYES   L_34408                          * 343FE
        ?A#0    W                                * 34400
        GOYES   L_34429                          * 34403
        A=C     W                                * 34405
L_34408:
        SETDEC                                   * 34408
        HST=0   3                                * 3440A
        GOSBVL  SPLITA                           * 3440D
        GOSUBL  SUB_34CCE                        * 34414
        GONC    L_34435                          * 3441A
        LC(5)   #00010                           * 3441D
        A=A-C   A                                * 34424
        GONC    L_34439                          * 34426
L_34429:
        GOSUBL  SUB_34C56                        * 34429
        GOSUBL  SUB_34C65                        * 3442F
L_34435:
        GOSUB   SUB_346AD                        * 34435
L_34439:
        GOSUBL  SUB_34C7A                        * 34439
        GOSBVL  SUB_29F76                        * 3443F
        ?A#0    W                                * 34446
        GOYES   L_34465                          * 34449
        C=R1                                     * 3444B
        ?C=0    M                                * 3444E
        GOYES   L_34465                          * 34451
        A=R0                                     * 34453
        C=0     W                                * 34456
        P=      14                               * 34459
        LC(5)   #50101                           * 3445B
        A=C     WP                               * 34462
L_34465:
        R1=A                                     * 34465
        GOSBVL  PUSH%                            * 34468
        A=R1                                     * 3446F
        C=R2                                     * 34472
        ?C=A    W                                * 34475
        GOYES   L_34486                          * 34478
        C=R3                                     * 3447A
        ?C=A    W                                * 3447D
        GOYES   L_34486                          * 34480
        GOTO    L_34516                          * 34482
L_34486:
        GOTO    L_34620                          * 34486

* refs (2): 343DA 344D0
SUB_3448A:
        GOSBVL  SAVPTR                           * 3448A
        A=R0                                     * 34491
        C=R2                                     * 34494
        CSL     A                                * 34497
        C=C+A   A                                * 34499
        CD0EX                                    * 3449B
        C=R3                                     * 3449E
        CSL     A                                * 344A1
        C=C+A   A                                * 344A3
        A=DAT0  W                                * 344A5
        R2=A                                     * 344A9
        D0=C                                     * 344AC
        C=DAT0  W                                * 344AF
        R3=C                                     * 344B3
        A=A+1   XS                               * 344B6
        A=A-1   XS                               * 344B9
        RTNC                                     * 344BC
        C=C+1   XS                               * 344BF
        C=C-1   XS                               * 344C2
        RTN                                      * 344C5

* refs (5): 334F4 33616 3375B 33A35 34CE7
OBJ_344C7:
        CON(5)  (*)+5                            * 344C7  primitive code object
        GOSUB   SUB_34869                        * 344CC
        GOSUB   SUB_3448A                        * 344D0
        A=DAT1  A                                * 344D4
        D1=A                                     * 344D7
        D1=D1+  5                                * 344DA
        A=DAT1  W                                * 344DD
        C=R2                                     * 344E1
        GOSUB   SUB_34C56                        * 344E4
        P=      1                                * 344E8
        ?ST=0   3                                * 344EA
        GOYES   L_344F1                          * 344ED
        P=      4                                * 344EF
L_344F1:
        GOSUB   SUB_34CA0                        * 344F1
        GONC    L_3451D                          * 344F5
        C=R3                                     * 344F8
        GOSBVL  SUB_2BCAC                        * 344FB
        P=      4                                * 34502
        ?ST=0   3                                * 34504
        GOYES   L_3450B                          * 34507
        P=      1                                * 34509
L_3450B:
        GOSUB   SUB_34CA0                        * 3450B
        GONC    L_3452D                          * 3450F
L_34512:
        GOSUB   SUB_34CA7                        * 34512
L_34516:
        GOVLNG  PushTLoop                        * 34516
L_3451D:
        GOSUB   SUB_34CA7                        * 3451D
        D1=D1-  10                               * 34521
        A=DAT1  A                                * 34524
        D1=D1+  10                               * 34527
        GONC    L_3453A                          * 3452A
L_3452D:
        GOSUB   SUB_34CA7                        * 3452D
        D1=D1-  5                                * 34531
        A=DAT1  A                                * 34534
        D1=D1+  5                                * 34537
L_3453A:
        DAT1=A  A                                * 3453A
        D1=D1-  5                                * 3453D
        D=D-1   A                                * 34540
        GOTO    L_34A4F                          * 34542

* refs (4): 3344F 33639 337E7 33A58
OBJ_34546:
        CON(5)  (*)+5                            * 34546  primitive code object
        GOSUB   SUB_34847                        * 3454B
        GOSBVL  SAVPTR                           * 3454F
        A=R0                                     * 34556
        C=R2                                     * 34559
        CSL     A                                * 3455C
        C=C+A   A                                * 3455E
        CD1EX                                    * 34560
        C=R3                                     * 34563
        CSL     A                                * 34566
        A=A+C   A                                * 34568
        C=DAT1  W                                * 3456A
        R0=C                                     * 3456E
        D1=A                                     * 34571
        A=DAT1  W                                * 34574
        GOSUB   SUB_34C56                        * 34578
        P=      1                                * 3457C
        GOSUB   SUB_34CA0                        * 3457E
        A=B     M                                * 34582
        GOC     L_34591                          * 34585
        ?P=     4                                * 34588
        GOYES   L_345CB                          * 3458B
        GOTO    L_3461C                          * 3458D
L_34591:
        ?A#0    M                                * 34591
        GOYES   L_345A8                          * 34594
        C=0     W                                * 34596
        P=      14                               * 34599
        LC(5)   #50101                           * 3459B
        A=C     W                                * 345A2
        GONC    L_34609                          * 345A5
L_345A8:
        ?A#0    S                                * 345A8
        GOYES   L_345E7                          * 345AB
L_345AD:
        A=A+1   M                                * 345AD
        GONC    L_34609                          * 345B0
        P=      0                                * 345B3
        LC(3)   #499                             * 345B5
        ?C=A    X                                * 345BA
        GOYES   L_3461C                          * 345BD
        P=      14                               * 345BF
        A=A+1   P                                * 345C1
        A=A+1   X                                * 345C4
        GOTO    L_34609                          * 345C7
L_345CB:
        ?A#0    M                                * 345CB
        GOYES   L_345E2                          * 345CE
        C=0     W                                * 345D0
        P=      14                               * 345D3
        LC(5)   #50191                           * 345D5
        A=C     W                                * 345DC
        GONC    L_34609                          * 345DF
L_345E2:
        ?A#0    S                                * 345E2
        GOYES   L_345AD                          * 345E5
L_345E7:
        A=A-1   M                                * 345E7
        P=      14                               * 345EA
        ?A#0    P                                * 345EC
        GOYES   L_34609                          * 345EF
        A=0     M                                * 345F1
        A=A-1   M                                * 345F4
        A=A-1   X                                * 345F7
        P=      0                                * 345FA
        LC(3)   #500                             * 345FC
        ?C#A    X                                * 34601
        GOYES   L_34609                          * 34604
        A=0     W                                * 34606
L_34609:
        C=R0                                     * 34609
        ?C=A    W                                * 3460C
        GOYES   L_3461C                          * 3460F
        GOSBVL  PUSH%                            * 34611
        GOTO    L_34516                          * 34618
L_3461C:
        GOSUB   SUB_34CA7                        * 3461C
L_34620:
        GOVLNG  PushFLoop                        * 34620

* refs (1): 33846
OBJ_34627:
        CON(5)  (*)+5                            * 34627  primitive code object
        GOSUB   SUB_348DC                        * 3462C
        GOSBVL  SAVPTR                           * 34630
        CAEX    A                                * 34637
        RSTK=C                                   * 34639
        D1=C                                     * 3463B
        ?ST=0   3                                * 3463E
        GOYES   L_34649                          * 34641
        D1=D1+  16                               * 34643
        D1=D1+  16                               * 34646
L_34649:
        SETDEC                                   * 34649
        GOSUB   SUB_346C1                        * 3464B
        GOSUB   SUB_34C81                        * 3464F
        C=RSTK                                   * 34653
        D1=C                                     * 34655
        D1=D1+  16                               * 34658
        GOSUB   SUB_346C1                        * 3465B
        GOSUB   SUB_34C8F                        * 3465F
        P=      3                                * 34663
        GOSUB   SUB_34CA0                        * 34665
        GOC     L_34675                          * 34669
        A=C     W                                * 3466C
        C=D     W                                * 3466F
        B=C     W                                * 34672
L_34675:
        GOSBVL  SUB_2BD02                        * 34675
        GOC     L_346A5                          * 3467C
        GOSUB   SUB_346AD                        * 3467F
        GOSUB   SUB_34C81                        * 34683
        D1=D1-  16                               * 34687
        A=DAT1  W                                * 3468A
        D1=D1-  16                               * 3468E
        D1=D1-  16                               * 34691
        GOSUB   SUB_346D1                        * 34694
        GOSUB   SUB_34C8F                        * 34698
        P=      4                                * 3469C
        GOSUB   SUB_34CA0                        * 3469E
        GOC     L_346A9                          * 346A2
L_346A5:
        GOTO    L_3461C                          * 346A5
L_346A9:
        GOTO    L_34512                          * 346A9

* refs (3): 34435 3467F 34B64
SUB_346AD:
        C=0     W                                * 346AD
        P=      14                               * 346B0
        LC(1)   #5                               * 346B2
        D=C     W                                * 346B5
        C=C-1   A                                * 346B8

* refs (5): 34A91 34AD0 34B08 34B21 34B60
SUB_346BA:
        GOVLNG  MULTF                            * 346BA

* refs (2): 3464B 3465B
SUB_346C1:
        A=DAT1  W                                * 346C1
        D1=D1+  16                               * 346C5
        D1=D1+  16                               * 346C8
        D1=D1+  16                               * 346CB
        D1=D1+  16                               * 346CE

* refs (1): 34694
SUB_346D1:
        C=DAT1  W                                * 346D1
        GOSUB   SUB_34C5B                        * 346D5
        C=-C-1  S                                * 346D9
        GOSBVL  SUB_2B7BE                        * 346DC
        A=0     S                                * 346E3
        RTN                                      * 346E6

* refs (10): 33157 331C0 3337D 33418 3345E 33549 ...
OBJ_346E8:
        CON(5)  (*)+5                            * 346E8  primitive code object
        LC(5)   #00003                           * 346ED
        GOTO    L_34714                          * 346F4

* refs (2): 3314D 33378
OBJ_346F8:
        CON(5)  (*)+5                            * 346F8  primitive code object
        LC(5)   #00004                           * 346FD
        GOTO    L_34714                          * 34704

* refs (1): 33152
OBJ_34708:
        CON(5)  (*)+5                            * 34708  primitive code object
        LC(5)   #00005                           * 3470D
L_34714:
        GOSUB   SUB_348BC                        * 34714
L_34718:
        C=DAT1  A                                * 34718
        D1=D1+  5                                * 3471B
        D=D+1   A                                * 3471E
        CD1EX                                    * 34720
        D1=D1+  5                                * 34723
        A=DAT1  W                                * 34726
        D1=C                                     * 3472A
        AR0EX                                    * 3472D
        C=R2                                     * 34730
        CSL     A                                * 34733
        C=C+A   A                                * 34735
        CD1EX                                    * 34737
        A=R0                                     * 3473A
        DAT1=A  W                                * 3473D
        D1=C                                     * 34741
L_34744:
        A=DAT0  A                                * 34744
        D0=D0+  5                                * 34747
        PC=(A)                                   * 3474A

* refs (1): 33D78
OBJ_3474E:
        CON(5)  (*)+5                            * 3474E  primitive code object
        LC(5)   #00003                           * 34753
        GOSUB   SUB_348BC                        * 3475A
        A=R0                                     * 3475E
        LC(5)   #00070                           * 34761
        A=A+C   A                                * 34768
        R0=A                                     * 3476A
        GOTO    L_34718                          * 3476D

* refs (6): 33C42 3406F 34079 342A2 342AC 342B6
OBJ_34771:
        CON(5)  (*)+5                            * 34771  primitive code object
        GOSUB   SUB_348A8                        * 34776
        GOTO    L_347BE                          * 3477A

* refs (4): 33EF8 33F16 33F93 33FB1
OBJ_3477E:
        CON(5)  (*)+5                            * 3477E  primitive code object
        LC(5)   #00001                           * 34783
        GOTO    L_347BA                          * 3478A

* refs (9): 334E0 335F8 33873 33904 339A9 33EE4 ...
OBJ_3478E:
        CON(5)  (*)+5                            * 3478E  primitive code object
        LC(5)   #00002                           * 34793
        GOTO    L_347BA                          * 3479A

* refs (2): 33D0A 33D96
OBJ_3479E:
        CON(5)  (*)+5                            * 3479E  primitive code object
        LC(5)   #00003                           * 347A3
        GOTO    L_347BA                          * 347AA

* refs (14): 331B1 334DB 335F3 3373D 3376F 33788 ...
OBJ_347AE:
        CON(5)  (*)+5                            * 347AE  primitive code object
        LC(5)   #00004                           * 347B3
L_347BA:
        GOSUB   SUB_348BC                        * 347BA
L_347BE:
        A=R0                                     * 347BE
L_347C1:
        C=R2                                     * 347C1
        CSL     A                                * 347C4
        A=A+C   A                                * 347C6
        GOSBVL  SAVPTR                           * 347C8
        D0=A                                     * 347CF
        A=DAT0  W                                * 347D2
        GOTO    L_34A01                          * 347D6

* refs (3): 340FB 34266 34275
OBJ_347DA:
        CON(5)  (*)+5                            * 347DA  primitive code object
        GOSUB   SUB_348A8                        * 347DF
        GOTO    L_34837                          * 347E3

* refs (4): 33931 33EBC 33FC5 33FD9
OBJ_347E7:
        CON(5)  (*)+5                            * 347E7  primitive code object
        LC(5)   #00001                           * 347EC
        GOTO    L_34833                          * 347F3

* refs (14): 33206 3325B 33297 332B0 3331E 334C2 ...
OBJ_347F7:
        CON(5)  (*)+5                            * 347F7  primitive code object
        LC(5)   #00002                           * 347FC
        GOTO    L_34833                          * 34803

* refs (7): 3320B 33279 332D3 33328 336B6 33A94 ...
OBJ_34807:
        CON(5)  (*)+5                            * 34807  primitive code object
        LC(5)   #00003                           * 3480C
        GOTO    L_34833                          * 34813

* refs (16): 33260 33274 3329C 332BA 332D8 334BD ...
OBJ_34817:
        CON(5)  (*)+5                            * 34817  primitive code object
        LC(5)   #00004                           * 3481C
        GOTO    L_34833                          * 34823

* refs (1): 33B84
OBJ_34827:
        CON(5)  (*)+5                            * 34827  primitive code object
        LC(5)   #00005                           * 3482C
L_34833:
        GOSUB   SUB_348BC                        * 34833
L_34837:
        A=R0                                     * 34837
        LC(5)   #00070                           * 3483A
        A=A+C   A                                * 34841
        GOTO    L_347C1                          * 34843

* refs (3): 34324 343D6 3454B
SUB_34847:
        A=DAT1  A                                * 34847
        D1=D1+  5                                * 3484A
        D=D+1   A                                * 3484D
        AD1EX                                    * 3484F
        D1=D1+  5                                * 34852
        C=DAT1  A                                * 34855
        D1=A                                     * 34858
        A=0     A                                * 3485B
        A=C     P                                * 3485D
        CSR     A                                * 34860
        R2=A                                     * 34862
        GOTO    L_34894                          * 34865

* refs (1): 344CC
SUB_34869:
        A=DAT1  A                                * 34869
        D1=D1+  5                                * 3486C
        D=D+1   A                                * 3486F
        AD1EX                                    * 34871
        D1=D1+  5                                * 34874
        C=DAT1  A                                * 34877
        R2=C                                     * 3487A
        D1=A                                     * 3487D
        A=DAT1  A                                * 34880
        D1=D1+  5                                * 34883
        D=D+1   A                                * 34886
        AD1EX                                    * 34888
        D1=D1+  5                                * 3488B
        C=DAT1  A                                * 3488E
        D1=A                                     * 34891
L_34894:
        R3=C                                     * 34894
        GOSUB   SUB_348BF                        * 34897
        RTNC                                     * 3489B
        C=R3                                     * 3489E
        C=A-C   A                                * 348A1
        R3=C                                     * 348A3
        RTN                                      * 348A6

* refs (3): 34381 34776 347DF
SUB_348A8:
        A=DAT1  A                                * 348A8
        D1=D1+  5                                * 348AB
        D=D+1   A                                * 348AE
        AD1EX                                    * 348B0
        D1=D1+  5                                * 348B3
        C=DAT1  A                                * 348B6
        D1=A                                     * 348B9

* refs (5): 343A0 34714 3475A 347BA 34833
SUB_348BC:
        R2=C                                     * 348BC

* refs (1): 34897
SUB_348BF:
        GOSUB   SUB_348DC                        * 348BF
        R0=A                                     * 348C3
        ?ST=0   3                                * 348C6
        RTNYES                                   * 348C9
        C=0     A                                * 348CB
        LC(1)   #6                               * 348CD
        A=C     A                                * 348D0
        C=R2                                     * 348D2
        C=A-C   A                                * 348D5
        R2=C                                     * 348D7
        RTNCC                                    * 348DA

* refs (2): 3462C 348BF
SUB_348DC:
        LC(5)   TEMPENV                          * 348DC
        CD0EX                                    * 348E3
        RSTK=C                                   * 348E6
        C=DAT0  A                                * 348E8
        D0=C                                     * 348EB
        D0=D0+  15                               * 348EE
        A=DAT0  A                                * 348F1
        ST=0    3                                * 348F4
        LC(5)   FALSE                            * 348F7
        ?C=A    A                                * 348FE
        GOYES   L_34906                          * 34901
        ST=1    3                                * 34903
L_34906:
        D0=D0+  10                               * 34906
        A=DAT0  A                                * 34909
        C=RSTK                                   * 3490C
        D0=C                                     * 3490E
        C=0     A                                * 34911
        LC(2)   #19                              * 34913
        A=A+C   A                                * 34917
        RTN                                      * 34919

* refs (13): 3330F 33341 333DC 33481 334B8 3353A ...
OBJ_3491B:
        CON(5)  (*)+5                            * 3491B  primitive code object
        LC(5)   TEMPENV                          * 34920
        CD0EX                                    * 34927
        RSTK=C                                   * 3492A
        A=DAT0  A                                * 3492C
        D0=A                                     * 3492F
        D0=D0+  15                               * 34932
        A=DAT0  A                                * 34935
        LC(5)   TRUE                             * 34938
        ?C#A    A                                * 3493F
        GOYES   L_3494B                          * 34942
        LC(5)   FALSE                            * 34944
L_3494B:
        DAT0=C  A                                * 3494B
        C=RSTK                                   * 3494E
        D0=C                                     * 34950
        GOTO    L_34744                          * 34953
        RPL

* refs (2): 3317A 33382
OBJ_34957:
        :: 2GETLAM                               * 34957
          CODE                                   * 34961  86 nibbles
            A=DAT1  A                            * 3496B
            D1=D1+  5                            * 3496E
            D=D+1   A                            * 34971
            LC(5)   #00029                       * 34973
            A=A+C   A                            * 3497A
            AD1EX                                * 3497C
            P=      15                           * 3497F
            LC(4)   #F009                        * 34981
            P=      0                            * 34987
            DAT1=C  W                            * 34989
            D1=D1+  16                           * 3498D
            D1=D1+  16                           * 34990
            D1=D1+  16                           * 34993
            D1=D1+  16                           * 34996
            C=0     S                            * 34999
            DAT1=C  W                            * 3499C
            D1=D1+  16                           * 349A0
            D1=D1+  16                           * 349A3
            D1=D1+  16                           * 349A6
            DAT1=C  W                            * 349A9
            D1=D1+  16                           * 349AD
            D1=D1+  16                           * 349B0
            D1=D1+  16                           * 349B3
            D1=D1+  16                           * 349B6
            DAT1=C  W                            * 349B9
            GOTO    L_34375                      * 349BD
          ENDCODE                                * 349C1
        ;                                        * 349C1

* refs (2): 33355 33369
OBJ_349C6:
        CON(5)  (*)+5                            * 349C6  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 349CB
        D1=D1+  5                                * 349CE
        D=D+1   A                                * 349D1
        GOSBVL  SAVPTR                           * 349D3
        AD1EX                                    * 349DA
        D1=D1+  5                                * 349DD
        A=DAT1  W                                * 349E0
        ?A#0    W                                * 349E4
        GOYES   L_349F1                          * 349E7
        P=      14                               * 349E9
        A=A+1   P                                * 349EB
        GONC    L_34A01                          * 349EE
L_349F1:
        P=      8                                * 349F1
        SETDEC                                   * 349F3
        A=A+1   P                                * 349F5
        GONC    L_34A01                          * 349F8
        A=A-1   P                                * 349FB
        A=A-1   P                                * 349FE
L_34A01:
        GOVLNG  L_5436A                          * 34A01

* refs (1): 338A0
OBJ_34A08:
        CON(5)  (*)+5                            * 34A08  primitive code object
        C=DAT1  A                                * 34A0D
        CD1EX                                    * 34A10
        D1=D1+  5                                * 34A13
        GOTO    L_34A25                          * 34A16

* refs (7): 33210 332A1 332E2 335AD 336C5 33A9E ...
OBJ_34A1A:
        CON(5)  (*)+5                            * 34A1A  primitive code object
        C=DAT1  A                                * 34A1F
        CD1EX                                    * 34A22
L_34A25:
        D1=D1+  5                                * 34A25
        D1=D1+  15                               * 34A28
        A=DAT1  S                                * 34A2B
        D1=C                                     * 34A2F
        D1=D1+  5                                * 34A32
        D=D+1   A                                * 34A35
        C=DAT1  A                                * 34A37
        CD1EX                                    * 34A3A
        D1=D1+  5                                * 34A3D
        D1=D1+  15                               * 34A40
        C=DAT1  S                                * 34A43
        D1=C                                     * 34A47
        ?C#A    S                                * 34A4A
        GOYES   L_34A4F                          * 34A4D
L_34A4F:
        GOVLNG  OverWrT/FLp                      * 34A4F

* refs (1): 33927
OBJ_34A56:
        CON(5)  (*)+5                            * 34A56  primitive code object
        GOSUB   SUB_34CC4                        * 34A5B
        ?D#0    M                                * 34A5F
        GOYES   L_34A68                          * 34A62
        GOTO    L_34AF5                          * 34A64
L_34A68:
        GOSBVL  STCD2                            * 34A68
        GOSUB   SUB_34C73                        * 34A6F
        GOSUB   SUB_34C7A                        * 34A73
        GOSUB   SUB_34CBD                        * 34A77
        GOSBVL  EXAB2                            * 34A7B
        GOSBVL  XYEX                             * 34A82
        GOSUB   SUB_34C73                        * 34A89
        GOSUB   SUB_34C88                        * 34A8D
        GOSUB   SUB_346BA                        * 34A91
        B=B+B   W                                * 34A95
        B=B+B   W                                * 34A98
        ?B=0    S                                * 34A9B
        GOYES   L_34AA5                          * 34A9E
        BSR     W                                * 34AA0
        A=A+1   A                                * 34AA3
L_34AA5:
        A=-A-1  S                                * 34AA5
        GOSBVL  RADD1                            * 34AA8
        GOSBVL  SQRF                             * 34AAF
        GOSBVL  RADD1                            * 34AB6
        GOSUB   SUB_34C88                        * 34ABD
        GOSBVL  XYEX                             * 34AC1
        GOSUB   SUB_34C73                        * 34AC8
        GOSUB   SUB_34C8F                        * 34ACC
        GOSUB   SUB_346BA                        * 34AD0
        B=B+B   W                                * 34AD4
        ?B=0    S                                * 34AD7
        GOYES   L_34AE1                          * 34ADA
        BSR     W                                * 34ADC
        A=A+1   A                                * 34ADF
L_34AE1:
        GOSUB   SUB_34C7A                        * 34AE1
        GOSUB   SUB_34CB2                        * 34AE5
        GOSUB   SUB_34C88                        * 34AE9
        GOSUB   SUB_34C62                        * 34AED
        GOTO    L_34C3E                          * 34AF1
L_34AF5:
        GOSUB   SUB_34C7A                        * 34AF5
        GOSUB   SUB_34CBD                        * 34AF9
        GOSUB   SUB_34C81                        * 34AFD
        GOSBVL  RCAB0                            * 34B01
        GOSUB   SUB_346BA                        * 34B08
        A=0     S                                * 34B0C
        GOSBVL  SQRF                             * 34B0F
        GOSBVL  EXAB0                            * 34B16
        GOSUB   SUB_34C8F                        * 34B1D
        GOSUB   SUB_346BA                        * 34B21
        GOSUB   SUB_34C6C                        * 34B25
        GOTO    L_34AE1                          * 34B29

* refs (1): 3374C
OBJ_34B2D:
        CON(5)  (*)+5                            * 34B2D  primitive code object
        GOSUB   SUB_34CC4                        * 34B32
        GOSUB   SUB_34C62                        * 34B36
        GOSUB   SUB_34C7A                        * 34B3A
        GOSUB   SUB_34CBD                        * 34B3E
        GOSBVL  EXAB0                            * 34B42
        GOSUB   SUB_34C65                        * 34B49
        GOSUB   SUB_34C6C                        * 34B4D
        GOSUB   SUB_34C7A                        * 34B51
        GOSUB   SUB_34CBD                        * 34B55
        GOSBVL  EXAB0                            * 34B59
        GOSUB   SUB_346BA                        * 34B60
        GOSUB   SUB_346AD                        * 34B64
        A=-A-1  S                                * 34B68
        GOSUB   SUB_34C88                        * 34B6B
        GOSUB   SUB_34C65                        * 34B6F
        GOTO    L_34C3E                          * 34B73

* refs (1): 33882
OBJ_34B77:
        CON(5)  (*)+5                            * 34B77  primitive code object
        GOSUB   SUB_34C96                        * 34B7C
        GOSUB   SUB_34C73                        * 34B80
        A=-A-1  S                                * 34B84
        GOSBVL  RADD1                            * 34B87
        GOSUB   SUB_34C7A                        * 34B8E
        GOSUB   SUB_34CA7                        * 34B92
        GOSUB   SUB_34C99                        * 34B96
        GOSUB   SUB_34C81                        * 34B9A
        GOSUB   SUB_34C62                        * 34B9E
        GOSUB   SUB_34C6C                        * 34BA2
        GOSUB   SUB_34C8F                        * 34BA6
        A=-A-1  S                                * 34BAA
        GOSUB   SUB_34C65                        * 34BAD
        GOTO    L_34C3E                          * 34BB1

* refs (1): 33607
OBJ_34BB5:
        CON(5)  (*)+5                            * 34BB5  primitive code object
        GOSUB   SUB_34C96                        * 34BBA
        GOSUB   SUB_34C73                        * 34BBE
        C=0     W                                * 34BC2
        D=0     W                                * 34BC5
        P=      14                               * 34BC8
        LC(6)   #100091                          * 34BCA
        DCEX    M                                * 34BD2
        GOSUB   SUB_34C65                        * 34BD5
        C=0     W                                * 34BD9
        D=0     W                                * 34BDC
        P=      14                               * 34BDF
        D=D+1   P                                * 34BE1
        D=D+1   P                                * 34BE4
        C=C-1   A                                * 34BE7
        C=C-1   A                                * 34BE9
        P=      6                                * 34BEB
        GOSUB   SUB_34CA0                        * 34BED
        GOC     L_34BFD                          * 34BF1
        A=C     W                                * 34BF4
        C=D     W                                * 34BF7
        B=C     W                                * 34BFA
L_34BFD:
        GOSUB   SUB_34C7A                        * 34BFD
        GOSUB   SUB_34CA7                        * 34C01
        GOSUB   SUB_34C99                        * 34C05
        GOSUB   SUB_34C81                        * 34C09
        GOSUB   SUB_34C62                        * 34C0D
        GOSUB   SUB_34C6C                        * 34C11
        GOSUB   SUB_34C8F                        * 34C15
        GOSUB   SUB_34C65                        * 34C19
        GOTO    L_34C3E                          * 34C1D

* refs (1): 334E5
OBJ_34C21:
        CON(5)  (*)+5                            * 34C21  primitive code object
        GOSUB   SUB_34C96                        * 34C26
        GOSUB   SUB_34C7A                        * 34C2A
        GOSUB   SUB_34C62                        * 34C2E
        A=A+1   A                                * 34C32
        A=A+1   A                                * 34C34
        GOSUB   SUB_34C88                        * 34C36
        GOSUB   SUB_34C65                        * 34C3A
L_34C3E:
        GOSBVL  SUB_29F76                        * 34C3E
        GOTO    L_34A01                          * 34C45

* refs (4): 174DC 17577 339E0 352D2
OBJ_34C49:
        CON(5)  (*)+5                            * 34C49  primitive code object
        GOSUB   SUB_34CB6                        * 34C4E
        GOTO    L_34C3E                          * 34C52

* refs (3): 34429 344E4 34578
SUB_34C56:
        SETDEC                                   * 34C56
        HST=0   3                                * 34C58

* refs (1): 346D5
SUB_34C5B:
        GOVLNG  SPLTAC                           * 34C5B

* refs (5): 34AED 34B36 34B9E 34C0D 34C2E
SUB_34C62:
        C=-C-1  S                                * 34C62

* refs (7): 3442F 34B49 34B6F 34BAD 34BD5 34C19 ...
SUB_34C65:
        GOVLNG  RADDF                            * 34C65

* refs (4): 34B25 34B4D 34BA2 34C11
SUB_34C6C:
        GOSBVL  RCCD0                            * 34C6C

* refs (5): 34A6F 34A89 34AC8 34B80 34BBE
SUB_34C73:
        GOVLNG  DIVF                             * 34C73

* refs (9): 34439 34A73 34AE1 34AF5 34B3A 34B51 ...
SUB_34C7A:
        GOVLNG  STAB0                            * 34C7A

* refs (5): 3464F 34683 34AFD 34B9A 34C09
SUB_34C81:
        GOVLNG  STAB2                            * 34C81

* refs (5): 34A8D 34ABD 34AE9 34B6B 34C36
SUB_34C88:
        GOVLNG  RCCD0                            * 34C88

* refs (6): 3465F 34698 34ACC 34B1D 34BA6 34C15
SUB_34C8F:
        GOVLNG  RCCD2                            * 34C8F

* refs (4): 34B7C 34BBA 34C26 34CFB
SUB_34C96:
        HST=0   3                                * 34C96

* refs (2): 34B96 34C05
SUB_34C99:
        GOVLNG  Pop%ACSrSep                      * 34C99

* refs (6): 344F1 3450B 3457E 34665 3469E 34BED
SUB_34CA0:
        GOVLNG  TST15                            * 34CA0

* refs (10): 34512 3451D 3452D 3461C 34B92 34C01 ...
SUB_34CA7:
        P=      0                                * 34CA7
        SETHEX                                   * 34CA9
        GOVLNG  GETPTR                           * 34CAB

* refs (1): 34AE5
SUB_34CB2:
        GOSUB   SUB_34CA7                        * 34CB2

* refs (1): 34C4E
SUB_34CB6:
        GOVLNG  SUB_2A060                        * 34CB6

* refs (4): 34A77 34AF9 34B3E 34B55
SUB_34CBD:
        GOSUB   SUB_34CA7                        * 34CBD
        GONC    L_34CC7                          * 34CC1

* refs (2): 34A5B 34B32
SUB_34CC4:
        HST=0   3                                * 34CC4
L_34CC7:
        GOVLNG  SUB_2A0B1                        * 34CC7

* refs (2): 34414 34CFF
SUB_34CCE:
        P=      0                                * 34CCE
        C=A     A                                * 34CD0
        C=C+C   A                                * 34CD2
        RTNNC                                    * 34CD4
        LC(5)   #99989                           * 34CD7
        C=A-C   A                                * 34CDE
        RTN                                      * 34CE0
        RPL

* refs (2): 33657 33A71
OBJ_34CE2:
        :: OBJ_344C7 NOTcaseDROP                 * 34CE2
          CODE                                   * 34CF1  43 nibbles
            GOSUB   SUB_34C96                    * 34CFB
            GOSUB   SUB_34CCE                    * 34CFF
            GONC    L_34D19                      * 34D03
            GOSUB   SUB_34CA7                    * 34D06
            D1=D1-  10                           * 34D0A
            A=DAT1  A                            * 34D0D
            D1=D1+  5                            * 34D10
            DAT1=A  A                            * 34D13
            GONC    L_34D20                      * 34D16
L_34D19:
            GOSUB   SUB_34CA7                    * 34D19
            D1=D1-  5                            * 34D1D
L_34D20:
            D=D-1   A                            * 34D20
            GOTO    L_34744                      * 34D22
          ENDCODE                                * 34D26
        ;                                        * 34D26

* -> {}
* refs (2): 41F7E 634D4
1NULLLAM{}:
        {                                        * 34D2B

* -> lam
* refs (108): 10E3B 10E40 10E45 10E4A 10E4F 10E54 ...
NULLLAM:
          LAM "" }                               * 34D30

* refs (2): 1611C 16DEF
OBJ_34D3C:
        CON(5)  (*)+5                            * 34D3C  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 34D41
        C=DAT1  A                                * 34D44
        CD1EX                                    * 34D47
        A=DAT1  A                                * 34D4A
        D1=C                                     * 34D4D
        D1=D1-  5                                * 34D50
        LC(5)   DOLIST                           * 34D53
        ?C=A    A                                * 34D5A
        GOYES   L_34D81                          * 34D5D
        D1=D1+  10                               * 34D5F
        A=DAT1  A                                * 34D62
        D1=D1-  10                               * 34D65
        LC(5)   TEMPTOP                          * 34D68
        CD1EX                                    * 34D6F
        RSTK=C                                   * 34D72
        C=DAT1  A                                * 34D74
        ?C>A    A                                * 34D77
        GOYES   L_34D8E                          * 34D7A
L_34D7C:
        C=RSTK                                   * 34D7C
        D1=C                                     * 34D7E
L_34D81:
        LC(5)   OBJ_34E2B                        * 34D81
L_34D88:
        A=C     A                                * 34D88
        PC=(A)                                   * 34D8A
L_34D8E:
        D1=(5)  TEMPOB                           * 34D8E
        C=DAT1  A                                * 34D95
        ?C>A    A                                * 34D98
        GOYES   L_34D7C                          * 34D9B
        C=RSTK                                   * 34D9D
        D1=C                                     * 34D9F
        LC(5)   OBJ_34DAC                        * 34DA2
        GONC    L_34D88                          * 34DA9
        RPL

* refs (1): 34DA2
OBJ_34DAC:
        :: ROT '                                 * 34DAC

* refs (3): 34DD6 34E03 34E1C
'symb:
          ID 'symb StoHiddenVar ' 'symb RclHiddenVar DROP 3UNROLL ERRSET * 34DBB
          OBJ_34E2B ERRTRAP                      * 34DEF
          :: ' 'symb PuHiddenVar ERRJMP ; ' 'symb PuHiddenVar ; * 34DF9

* refs (2): 34D81 34DEF
OBJ_34E2B:
        :: OVER 4PICK OBJ_539BC OBJ_56FD1 BIND OVER TYPELIST? case OBJ_34EBC * 34E2B
          BINT3 4PICK DUPTYPESYMB? OBJ_53930 OBJ_5395A ORNOT OR SWAP * 34E5D
          OBJ_28B41 psh DROPSWAP                 * 34E85
          :: MINUSONE #=casedrop BINT1           * 34E94
          ;                                      * 34EA8
          COLA OBJ_34EF3                         * 34EAD
        ;                                        * 34EB7

* refs (1): 34E58
OBJ_34EBC:
        :: SWAP INCOMPDROP 4PICK BINT3 3UNROLL OBJ_29993 psh drop;dq * 34EBC
          OBJ_34EF3 ;                            * 34EE9

* refs (2): 34EB2 34EE9
OBJ_34EF3:
        :: BEGIN OBJ_35015 NOTcase OBJ_34F43     * 34EF3
          4UNROLL ROTSWAP OBJ_35318 OBJ_34F6B !append$ SWAPROT IT #1+ * 34F0C
          #1+ AGAIN ;                            * 34F34

* refs (1): 34F07
OBJ_34F43:
        :: ABND RDROP DROPSWAPDROP pshm1 #1+NDROP TRUE ; * 34F43

* refs (1): 34F1B
OBJ_34F6B:
        :: RDROP 4ROLLDROP 1GETLAM ITE !!append$ DROP * 34F6B
          BINT3 psh 1GETLAM case                 * 34F8E
          :: #1+NDROP false;Lpop ;               * 34FA2
          3GETLAM TYPELIST? ITE                  * 34FB6
          :: NDROP 3GETLAM BINT2 NTHCOMPDROP ;   * 34FC5
          :: 2GETLAM OBJ_298AA ;                 * 34FE3
          ABND SWAPDROP ROTSWAP TWO{}N swap;false ; * 34FF7

* refs (1): 34EFD
OBJ_35015:
        :: DUP OBJ_350B5 NOTcaseFALSE DUPTYPECHAR? * 35015
          DUP 5UNROLL ITE OBJ_35074 OBJ_35126    * 3502E
          OBJ_3516C IT                           * 35047

* refs (1): 17720
+(sp,st):
          :: SPACE$ !insert$ ;                   * 35051
          4ROLL TRUE ;                           * 35065

* refs (1): 3503D
OBJ_35074:
        :: dvarlsBIND ROTDROP DUP#1+ OBJ_350B5 ITE OBJ_35126 NULL$ * 35074
          1GETABND >H$ TRUE 4UNROLL ;            * 3509C

* refs (2): 3501F 35088
OBJ_350B5:
        CON(5)  (*)+5                            * 350B5  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 350BA
        CD1EX                                    * 350BD
        RSTK=C                                   * 350C0
        D1=D1+  5                                * 350C2
        A=DAT1  A                                * 350C5
        R0=A.F  A                                * 350C8
        D1=C                                     * 350CE
        D1=D1+  15                               * 350D1
        D1=D1+  5                                * 350D4
        C=DAT1  A                                * 350D7
        CD1EX                                    * 350DA
        D1=D1+  5                                * 350DD
        A=DAT1  A                                * 350E0
        D1=C                                     * 350E3
        C=R0.F  A                                * 350E6
        ?C=0    A                                * 350EC
        GOYES   L_3511A                          * 350EF
        A=A-C   A                                * 350F1
        GOC     L_3511A                          * 350F3
        A=A+1   A                                * 350F6
        C=A     A                                * 350F8
        A=A+A   A                                * 350FA
        A=A+A   A                                * 350FC
        A=A+C   A                                * 350FE
        CD1EX                                    * 35100
        C=C+A   A                                * 35103
        D1=C                                     * 35105
        A=DAT1  A                                * 35108
        C=RSTK                                   * 3510B
        D1=C                                     * 3510D
        DAT1=A  A                                * 35110
        GOVLNG  PushTLoop                        * 35113
L_3511A:
        C=RSTK                                   * 3511A
        D1=C                                     * 3511C
        GOVLNG  OverWrFLoop                      * 3511F
        RPL

* refs (2): 35042 35092
OBJ_35126:
        :: REQcase tok;                          * 35126
          OBJ_3514E DUPTYPECSTR? ?SEMI           * 35135
          ->StrExpr(_) ;                         * 35144

* refs (1): 35135
OBJ_3514E:
        :: DPRADIX? NOT?SEMI                     * 3514E
          DROP tok, ;                            * 3515D

* refs (4): 35047 406B6 406ED 6BECA
OBJ_3516C:
        CON(5)  (*)+5                            * 3516C  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 35171
        CD1EX                                    * 35174
        RSTK=C                                   * 35177
        D1=D1+  5                                * 35179
        A=DAT1  A                                * 3517C
        A=A-CON A,6                              * 3517F
        GOC     L_351AA                          * 35185
        D1=D1+  5                                * 35188
        A=0     A                                * 3518B
        A=DAT1  B                                * 3518D
        D1=(5)  L_25F58                          * 35190
        CD1EX                                    * 35197
        C=C+A   A                                * 3519A
        CD1EX                                    * 3519C
        A=DAT1  S                                * 3519F
        GOSUB   SUB_35205                        * 351A3
        GOC     L_351BC                          * 351A7
L_351AA:
        LC(5)   FALSE                            * 351AA
L_351B1:
        A=C     A                                * 351B1
        C=RSTK                                   * 351B3
        D1=C                                     * 351B5
        PC=(A)                                   * 351B8
L_351BC:
        D1=C                                     * 351BC
        D1=D1+  10                               * 351BF
        C=DAT1  A                                * 351C2
        D1=C                                     * 351C5
        D1=D1+  5                                * 351C8
        A=DAT1  A                                * 351CB
        A=A-CON A,7                              * 351CE
        GOC     L_351AA                          * 351D4
        C=C+A   A                                * 351D7
        D1=C                                     * 351D9
        D1=D1+  10                               * 351DC
        A=0     A                                * 351DF
        A=DAT1  B                                * 351E1
        LC(5)   L_25F58                          * 351E4
        C=C+A   A                                * 351EB
        D1=C                                     * 351ED
        A=DAT1  S                                * 351F0
        LC(5)   TRUE                             * 351F4
        GOSUB   SUB_35205                        * 351FB
        GOC     L_351B1                          * 351FF
        GONC    L_351AA                          * 35202

* refs (2): 351A3 351FB
SUB_35205:
        A=A+1   S                                * 35205
        RTNC                                     * 35208
        A=A-1   S                                * 3520B
        A=A-1   S                                * 3520E
        GONC    L_35216                          * 35211
        RTNCC                                    * 35214
L_35216:
        GOVLNG  L_6FF81                          * 35216
        NIBHEX  64000                            * 3521D  F.
        RPL

* refs (3): 10266 10766 1077A
dup;roll(s);swap:
        :: DUPROLL SWAP ;                        * 35222

* refs (3): 3526E 352D7 352E6
OBJ_35236:
        CON(5)  (*)+5                            * 35236  primitive code object
        ASSEMBLE
        GOSBVL  POP1%SPLITA                      * 3523B
        GOSBVL  SUB_2BBFC                        * 35242
        SETHEX                                   * 35249
        ?B#0    WP                               * 3524B
        GOYES   L_3525B                          * 3524E
        C=0     A                                * 35250
        C+P+1                                    * 35252
        C=C-CON A,12                             * 35255
L_3525B:
        P=      0                                * 3525B
        GOVLNG  GPPushT/FLp                      * 3525D
        RPL

* refs (3): 0F272 41364 5F9C8
OBJ_35264:
        :: DUP OBJ_35236 case a%>$               * 35264
          ->StdStr(r) ;                          * 3527D

* refs (1): 3527D
->StdStr(r):
        :: TempStd ERRSET a%>$ ERRTRAP OBJ_352AF RclOldMode ; * 35287

* refs (2): 352A0 35309
OBJ_352AF:
        :: RclOldMode ERRJMP ;                   * 352AF

* refs (1): 5F9D2
->StdStr(c):
        :: DUP OBJ_1DE19 OBJ_34C49 OBJ_35236 casedrop ->str(c) * 352C3
          OBJ_35236 case ->str(c)                * 352E6
          TempStd ERRSET ->str(c) ERRTRAP OBJ_352AF RclOldMode ; * 352F5

* refs (1): 34F16
OBJ_35318:
        CON(5)  (*)+5                            * 35318  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 3531D
        C=DAT1  A                                * 35320
        D1=D1-  5                                * 35323
        CD0EX                                    * 35326
        RSTK=C                                   * 35329
        D0=D0+  5                                * 3532B
        A=DAT0  A                                * 3532E
        LC(5)   #00005                           * 35331
        ?C=A    A                                * 35338
        GOYES   L_35399                          * 3533B
        LC(1)   #7                               * 3533D
        ?C#A    A                                * 35340
        GOYES   L_3535A                          * 35343
        D0=D0+  5                                * 35345
        A=DAT0  B                                * 35348
        LC(2)   #27                              * 3534B
        ?C=A    B                                * 3534F
        GOYES   L_35399                          * 35352
        LC(2)   #07                              * 35354
        A=C     A                                * 35358
L_3535A:
        C=DAT1  A                                * 3535A
        D0=C                                     * 3535D
        D0=D0+  5                                * 35360
        C=DAT0  A                                * 35363
        A=A+C   A                                * 35366
        LC(5)   portnotaverr                     * 35368
        A=A-C   A                                * 3536F
        D0=(5)  DcompWidth                       * 35371
        C=DAT0  B                                * 35378
        ?C=0    B                                * 3537B
        GOYES   L_35399                          * 3537E
        C=C+C   A                                * 35380
        ?C>=A   A                                * 35382
        GOYES   L_35399                          * 35385
        C=RSTK                                   * 35387
        D0=C                                     * 35389
        LC(5)   COLA                             * 3538C
        A=C     A                                * 35393
        PC=(A)                                   * 35395
L_35399:
        C=RSTK                                   * 35399
        D0=C                                     * 3539B
        LC(5)   SKIP                             * 3539E
        A=C     A                                * 353A5
        PC=(A)                                   * 353A7
        RPL

* sym -> {}
* refs (5): 1525A 1550E 51017 B4BA3 B4CA5
FINDVAR:
        :: NULL{} DUPROT OBJ_353C9 SWAPDROP ;    * 353AB

* refs (3): 353BA 353FB 35482
OBJ_353C9:
        :: DUPTYPEIDNT? ?GOTO L_3540A DUP OBJ_354AF NOTcaseDROP >R * 353C9
L_353F1:
          ticR NOT?SEMI                          * 353F1
          OBJ_353C9 GOTO L_353F1                 * 353FB
L_3540A:
          DUPSAFE@ ?GOTO L_35423 COLA apndvarlst * 3540A
L_35423:
          DUP OBJ_354E1 ?GOTO L_3545A TYPERRP? NOTcase apndvarlst * 35423
          ROTSWAP apndvarlst COLA SWAP           * 35446
L_3545A:
          4ROLLROT OVER matchob? ?GOTO L_35487 >TCOMP 3UNROLL COLA OBJ_353C9 * 3545A
L_35487:
          SWAPDROPSWAP ;                         * 35487

* {} ob -> {}'
* refs (4): 3541E 35441 3544B 9F51B
apndvarlst:
        :: OVER matchob? ?SKIP >TCOMP            * 35491
        ;                                        * 354AA

* refs (2): 353E2 354F0
OBJ_354AF:
        :: INHARDROM? NOT SWAP DUPTYPECOL? SWAP TYPESYMB? OR AND ; * 354AF

* refs (1): 35428
OBJ_354E1:
        :: DUPTYPEIDNT? SWAP OBJ_354AF OR ;      * 354E1
        NIBHEX  A803000                          * 354FF  ≥0.

LIB005:
        CON(3)  #005                             * 35506  library number
        CON(5)  0                                * 35509  hash table
        REL(5)  LIB005.message                   * 3550E  message table
        CON(5)  0                                * 35513  link table
        CON(5)  0                                * 35518  config
        ASSEMBLE

* refs (2): 355BD 35607
SUB_3551D:
        GOSUB   SUB_35AD2                        * 3551D
        GOSUB   SUB_35AD9                        * 35521
        C=DAT1  A                                * 35525
        D1=C                                     * 35528
        D1=D1+  15                               * 3552B
        C=DAT1  B                                * 3552E
        D1=D1+  10                               * 35531
        C=C-1   B                                * 35534
        ?C=0    B                                * 35537
        GOYES   L_3553F                          * 3553A
        D1=D1+  5                                * 3553C
L_3553F:
        CD1EX                                    * 3553F
        A=A-1   A                                * 35542
        ASL     A                                * 35544
        C=C+A   A                                * 35546
        D1=C                                     * 35548
        A=DAT1  W                                * 3554B
        RTN                                      * 3554F

* refs (2): 355CD 35619
SUB_35551:
        GOSUB   SUB_35AD2                        * 35551
        GOSUB   SUB_35AD9                        * 35555
        C=DAT1  A                                * 35559
        D1=C                                     * 3555C
        D1=D1+  15                               * 3555F
        C=DAT1  B                                * 35562
        D1=D1+  10                               * 35565
        C=C-1   B                                * 35568
        ?C=0    B                                * 3556B
        GOYES   L_35573                          * 3556E
        D1=D1+  5                                * 35570
L_35573:
        CD1EX                                    * 35573
        A=A-1   A                                * 35576
        ASL     A                                * 35578
        A=A+A   A                                * 3557A
        C=C+A   A                                * 3557C
        D1=C                                     * 3557E
        A=DAT1  W                                * 35581
        D1=D1+  16                               * 35585
        C=DAT1  W                                * 35588
        RTN                                      * 3558C

* [F%] #n -> [F%] F%
* refs (14): 0F9A4 1787E 1D0BA 1D884 1D98F 36F4C ...
PULLEL:
        CON(5)  (*)+5                            * 3558E  primitive code object
        D1=D1+  5                                * 35593
        C=DAT1  A                                * 35596
        D1=D1-  5                                * 35599
        CD1EX                                    * 3559C
        D1=D1+  10                               * 3559F
        A=DAT1  A                                * 355A2
        D1=C                                     * 355A5
        LC(5)   DOREAL                           * 355A8
        ?C=A    A                                * 355AF
        GOYES   L_355BD                          * 355B2
        GOTO    L_355CD                          * 355B4

* [%] # -> [%] %
* refs (13): 2C3F6 35E77 3607A 3608E 36A16 48AB2 ...
PULLREALEL:
        CON(5)  (*)+5                            * 355B8  primitive code object
L_355BD:
        GOSUB   SUB_3551D                        * 355BD
        GOVLNG  L_5436A                          * 355C1

* [C%] # -> [C%] C%
* refs (1): 360DE
PULLCMPEL:
        CON(5)  (*)+5                            * 355C8  primitive code object
L_355CD:
        GOSUB   SUB_35551                        * 355CD
        GOVLNG  L_51B81                          * 355D1

* [F%] #n -> [F%] L%
* refs (17): 10C81 35C3B 35C77 35C81 36688 36737 ...
PULLLONGEL:
        CON(5)  (*)+5                            * 355D8  primitive code object
        D1=D1+  5                                * 355DD
        C=DAT1  A                                * 355E0
        D1=D1-  5                                * 355E3
        CD1EX                                    * 355E6
        D1=D1+  10                               * 355E9
        A=DAT1  A                                * 355EC
        D1=C                                     * 355EF
        LC(5)   DOREAL                           * 355F2
        ?C=A    A                                * 355F9
        GOYES   L_35607                          * 355FC
        GOTO    L_35619                          * 355FE

* [%] #n -> [%] %%
* refs (1): CAC0E
PULLEREALEL:
        CON(5)  (*)+5                            * 35602  primitive code object
L_35607:
        GOSUB   SUB_3551D                        * 35607
        GOSBVL  SPLITA                           * 3560B
L_35612:
        GOVLNG  L_37915                          * 35612
L_35619:
        GOSUB   SUB_35551                        * 35619
        GOSUB   SUB_35AE7                        * 3561D
        GOVLNG  L_51BA2                          * 35621

* [%] % # -> [%]' [C%] C% # -> [C%]'
* refs (23): 10C95 1DBBF 1DBF1 35C4F 35C9A 36584 ...
PUTEL:
        CON(5)  (*)+5                            * 35628  primitive code object
        D1=D1+  5                                * 3562D
        C=DAT1  A                                * 35630
        D1=D1-  5                                * 35633
        CD1EX                                    * 35636
        A=DAT1  A                                * 35639
        D1=C                                     * 3563C
        LC(5)   DOREAL                           * 3563F
        ?C=A    A                                * 35646
        GOYES   L_35674                          * 35649
        LC(5)   DOEREL                           * 3564B
        ?C#A    A                                * 35652
        GOYES   L_3565B                          * 35655
        GOTO    L_356D1                          * 35657
L_3565B:
        LC(5)   DOCMP                            * 3565B
        ?C#A    A                                * 35662
        GOYES   L_3566B                          * 35665
        GOTO    L_356F8                          * 35667
L_3566B:
        GOTO    L_35756                          * 3566B

* [%] % # -> [%]'
* refs (6): 2C40F 2C661 35E90 360F2 36101 CAC22
PUTREALEL:
        CON(5)  (*)+5                            * 3566F  primitive code object
L_35674:
        GOSUB   SUB_356B3                        * 35674
        D1=C                                     * 35678
L_3567B:
        C=DAT1  A                                * 3567B
        CD1EX                                    * 3567E
        RSTK=C                                   * 35681
        D1=D1+  15                               * 35683
        C=DAT1  B                                * 35686
        D1=D1+  10                               * 35689
        C=C-1   B                                * 3568C
        ?C=0    B                                * 3568F
        GOYES   L_35697                          * 35692
        D1=D1+  5                                * 35694
L_35697:
        CD1EX                                    * 35697
        A=A-1   A                                * 3569A
        ASL     A                                * 3569C
        C=C+A   A                                * 3569E
        D1=C                                     * 356A0
        C=R0                                     * 356A3
        DAT1=C  W                                * 356A6
        C=RSTK                                   * 356AA
        D1=C                                     * 356AC
        GOTO    L_3574C                          * 356AF

* refs (2): 35674 356F8
SUB_356B3:
        GOSUB   SUB_35AD2                        * 356B3
        R0=A                                     * 356B7
        C=DAT1  A                                * 356BA
        D1=D1+  5                                * 356BD
        D=D+1   A                                * 356C0
        CD1EX                                    * 356C2
        D1=D1+  5                                * 356C5
        A=DAT1  W                                * 356C8
        AR0EX                                    * 356CC
        RTN                                      * 356CF
L_356D1:
        GOSUB   SUB_35AD2                        * 356D1
        R0=A                                     * 356D5
        GOSBVL  SUB_2A060                        * 356D8
        GOSUB   SUB_35AE0                        * 356DF
        SETHEX                                   * 356E3
        GOSBVL  GETPTR                           * 356E5
        AR0EX                                    * 356EC
        GOTO    L_3567B                          * 356EF

* [C%] C% # -> [C%]'
* refs (1): 360A2
PUTCMPEL:
        CON(5)  (*)+5                            * 356F3  primitive code object
L_356F8:
        GOSUB   SUB_356B3                        * 356F8
        D1=D1+  16                               * 356FC
        R1=A                                     * 356FF
        A=DAT1  W                                * 35702
        AR1EX                                    * 35706
        D1=C                                     * 35709
L_3570C:
        C=DAT1  A                                * 3570C
        CD1EX                                    * 3570F
        RSTK=C                                   * 35712
        D1=D1+  15                               * 35714
        C=DAT1  B                                * 35717
        D1=D1+  10                               * 3571A
        C=C-1   B                                * 3571D
        ?C=0    B                                * 35720
        GOYES   L_35728                          * 35723
        D1=D1+  5                                * 35725
L_35728:
        CD1EX                                    * 35728
        A=A-1   A                                * 3572B
        ASL     A                                * 3572D
        A=A+A   A                                * 3572F
        C=C+A   A                                * 35731
        D1=C                                     * 35733
        C=R0                                     * 35736
        DAT1=C  W                                * 35739
        C=R1                                     * 3573D
        D1=D1+  16                               * 35740
        DAT1=C  W                                * 35743
        C=RSTK                                   * 35747
        D1=C                                     * 35749
L_3574C:
        A=DAT0  A                                * 3574C
        D0=D0+  5                                * 3574F
        PC=(A)                                   * 35752
L_35756:
        GOSUB   SUB_35AD2                        * 35756
        R0=A                                     * 3575A
        GOSBVL  POPC%%                           * 3575D
        GOSBVL  STCD2                            * 35764
        GOSUB   SUB_35AE0                        * 3576B
        R1=A                                     * 3576F
        GOSBVL  RCAB2                            * 35772
        GOSUB   SUB_35AE0                        * 35779
        AR1EX                                    * 3577D
        AR0EX                                    * 35780
        SETHEX                                   * 35783
        GOSBVL  GETPTR                           * 35785
        GOTO    L_3570C                          * 3578C
L_35790:
        B=0     A                                * 35790
        DSL     A                                * 35792
        P=      15                               * 35794
L_35796:
        B=B+B   A                                * 35796
        D=D+D   A                                * 35798
        GONC    L_3579F                          * 3579A
        B=B+C   A                                * 3579D
L_3579F:
        P=P-1                                    * 3579F
        GONC    L_35796                          * 357A1
        P=      0                                * 357A4
        RTN                                      * 357A6

* [1D] -> #m F [2D] -> #m #n T
* refs (51): 170F4 2C34C 2C39C 364B2 364C1 365C5 ...
MDIMS:
        CON(5)  (*)+5                            * 357A8  primitive code object
        A=DAT1  A                                * 357AD
        D1=D1+  5                                * 357B0
        D=D+1   A                                * 357B3
        GOSUB   SUB_35AD9                        * 357B5
        D1=A                                     * 357B9
        D1=D1+  15                               * 357BC
        C=DAT1  A                                * 357BF
        D1=D1+  5                                * 357C2
        A=DAT1  A                                * 357C5
        R0=A                                     * 357C8
        C=C-1   A                                * 357CB
        ?C=0    A                                * 357CD
        GOYES   L_357E9                          * 357D0
        D1=D1+  5                                * 357D2
        A=DAT1  A                                * 357D5
        R1=A                                     * 357D8
L_357DB:
        GOSBVL  PUSH2#                           * 357DB
        GOVLNG  PushTLoop                        * 357E2
L_357E9:
        GOVLNG  Push#FLoop                       * 357E9

* refs (24): 369BC 7CEFF 90507 90A2B 90C33 90F32 ...
OBJ_357F0:
        CON(5)  (*)+5                            * 357F0  primitive code object
        GOSUB   SUB_3580D                        * 357F5
        GOTO    L_3574C                          * 357F9

* refs (95): 10C9A 2C414 35C54 35C9F 35E95 360A7 ...
NextInArray:
        CON(5)  (*)+5                            * 357FD  primitive code object
        GOSUB   SUB_3580D                        * 35802
        GOVLNG  L_07339                          * 35806

* refs (2): 357F5 35802
SUB_3580D:
        AD0EX                                    * 3580D
        D0=(5)  ATTNFLG                          * 35810
        C=DAT0  A                                * 35817
        D0=A                                     * 3581A
        ?C=0    A                                * 3581D
        RTNYES                                   * 35820
        LC(5)   ?ATTNQUIT                        * 35822
        A=C     A                                * 35829
        PC=(A)                                   * 3582B

* refs (1): 36566
OBJ_3582F:
        CON(5)  (*)+5                            * 3582F  primitive code object
        GOSUB   SUB_35AD2                        * 35834
        R4=A                                     * 35838
        GOSUB   SUB_35AD2                        * 3583B
        R0=A                                     * 3583F
        GOSUB   SUB_35AD2                        * 35842
        GOSUB   SUB_35AD9                        * 35846
        C=DAT1  A                                * 3584A
        D0=C                                     * 3584D
        D1=D1+  5                                * 35850
        C=DAT1  A                                * 35853
        D1=C                                     * 35856
        D1=D1+  10                               * 35859
        C=DAT1  A                                * 3585C
        D=C     A                                * 3585F
        D1=D1+  15                               * 35861
        D1=D1+  5                                * 35864
        A=A-1   A                                * 35867
        ASL     A                                * 35869
        ST=0    1                                * 3586B
        LC(5)   DOREAL                           * 3586E
        ?D=C    A                                * 35875
        GOYES   L_3587F                          * 35878
        ST=1    1                                * 3587A
        A=A+A   A                                * 3587D
L_3587F:
        CD1EX                                    * 3587F
        C=C+A   A                                * 35882
        D1=C                                     * 35884
        A=R0                                     * 35887
        D0=D0+  10                               * 3588A
        C=DAT0  A                                * 3588D
        D=C     A                                * 35890
        D0=D0+  5                                * 35892
        C=DAT0  A                                * 35895
        D0=D0+  10                               * 35898
        B=C     A                                * 3589B
        C=C-1   A                                * 3589D
        ?C=0    A                                * 3589F
        GOYES   L_358AC                          * 358A2
        C=DAT0  A                                * 358A4
        B=C     A                                * 358A7
        D0=D0+  5                                * 358A9
L_358AC:
        ST=0    2                                * 358AC
        A=A-1   A                                * 358AF
        ASL     A                                * 358B1
        BSL     A                                * 358B3
        LC(5)   DOREAL                           * 358B5
        ?D=C    A                                * 358BC
        GOYES   L_358C8                          * 358BF
        ST=1    2                                * 358C1
        A=A+A   A                                * 358C4
        B=B+B   A                                * 358C6
L_358C8:
        C=B     A                                * 358C8
        RSTK=C                                   * 358CA
        CD0EX                                    * 358CC
        C=C+A   A                                * 358CF
        RSTK=C                                   * 358D1
        C=0     W                                * 358D3
        R0=C                                     * 358D6
        R1=C                                     * 358D9
        R2=C                                     * 358DC
        R3=C                                     * 358DF
        ?ST=1   2                                * 358E2
        GOYES   L_3591E                          * 358E5
        ?ST=0   1                                * 358E7
        GOYES   L_3590C                          * 358EA
        GOTO    L_35A13                          * 358EC
L_358F0:
        C=RSTK                                   * 358F0
        D0=C                                     * 358F2
        A=C     A                                * 358F5
        C=RSTK                                   * 358F7
        RSTK=C                                   * 358F9
        C=C+A   A                                * 358FB
        RSTK=C                                   * 358FD
        A=DAT1  W                                * 358FF
        D1=D1+  16                               * 35903
        GOSUB   SUB_35A22                        * 35906
        SETHEX                                   * 3590A
L_3590C:
        C=R4                                     * 3590C
        C=C-1   A                                * 3590F
        R4=C                                     * 35911
        GONC    L_358F0                          * 35914
        GOVLNG  L_7C8DA                          * 35917
L_3591E:
        ?ST=1   1                                * 3591E
        GOYES   L_35927                          * 35921
        GOTO    L_359D2                          * 35923
L_35927:
        GOTO    L_3598A                          * 35927
L_3592B:
        A=DAT1  W                                * 3592B
        C=RSTK                                   * 3592F
        RSTK=C                                   * 35931
        D0=C                                     * 35933
        GOSUB   SUB_35A22                        * 35936
        D1=D1+  16                               * 3593A
        A=DAT1  W                                * 3593D
        A=-A-1  S                                * 35941
        C=RSTK                                   * 35944
        RSTK=C                                   * 35946
        D0=C                                     * 35948
        D0=D0+  16                               * 3594B
        GOSUB   SUB_35A22                        * 3594E
        D1=D1-  16                               * 35952
        A=DAT1  W                                * 35955
        C=RSTK                                   * 35959
        RSTK=C                                   * 3595B
        D0=C                                     * 3595D
        D0=D0+  16                               * 35960
        GOSUB   SUB_35A49                        * 35963
        D1=D1+  16                               * 35967
        A=DAT1  W                                * 3596A
        D1=D1+  16                               * 3596E
        C=RSTK                                   * 35971
        RSTK=C                                   * 35973
        D0=C                                     * 35975
        GOSUB   SUB_35A49                        * 35978
        SETHEX                                   * 3597C
        C=RSTK                                   * 3597E
        A=C     A                                * 35980
        C=RSTK                                   * 35982
        RSTK=C                                   * 35984
        C=C+A   A                                * 35986
        RSTK=C                                   * 35988
L_3598A:
        C=R4                                     * 3598A
        C=C-1   A                                * 3598D
        R4=C                                     * 3598F
        GOC     L_35999                          * 35992
        GOTO    L_3592B                          * 35995
L_35999:
        GOVLNG  L_7C96D                          * 35999
L_359A0:
        A=DAT1  W                                * 359A0
        C=RSTK                                   * 359A4
        RSTK=C                                   * 359A6
        D0=C                                     * 359A8
        GOSUB   SUB_35A22                        * 359AB
        A=DAT1  W                                * 359AF
        D1=D1+  16                               * 359B3
        C=RSTK                                   * 359B6
        RSTK=C                                   * 359B8
        D0=C                                     * 359BA
        D0=D0+  16                               * 359BD
        GOSUB   SUB_35A49                        * 359C0
        SETHEX                                   * 359C4
        C=RSTK                                   * 359C6
        A=C     A                                * 359C8
        C=RSTK                                   * 359CA
        RSTK=C                                   * 359CC
        C=C+A   A                                * 359CE
        RSTK=C                                   * 359D0
L_359D2:
        C=R4                                     * 359D2
        C=C-1   A                                * 359D5
        R4=C                                     * 359D7
        GONC    L_359A0                          * 359DA
        GOTO    L_35999                          * 359DD
L_359E1:
        A=DAT1  W                                * 359E1
        D1=D1+  16                               * 359E5
        C=RSTK                                   * 359E8
        RSTK=C                                   * 359EA
        D0=C                                     * 359EC
        GOSUB   SUB_35A22                        * 359EF
        A=DAT1  W                                * 359F3
        D1=D1+  16                               * 359F7
        C=RSTK                                   * 359FA
        RSTK=C                                   * 359FC
        D0=C                                     * 359FE
        GOSUB   SUB_35A49                        * 35A01
        SETHEX                                   * 35A05
        C=RSTK                                   * 35A07
        A=C     A                                * 35A09
        C=RSTK                                   * 35A0B
        RSTK=C                                   * 35A0D
        C=C+A   A                                * 35A0F
        RSTK=C                                   * 35A11
L_35A13:
        C=R4                                     * 35A13
        C=C-1   A                                * 35A16
        R4=C                                     * 35A18
        GONC    L_359E1                          * 35A1B
        GOTO    L_35999                          * 35A1E

* refs (5): 35906 35936 3594E 359AB 359EF
SUB_35A22:
        GOSUB   SUB_35A70                        * 35A22
        RTNC                                     * 35A26
        GOSUB   SUB_35AE7                        * 35A29
L_35A2D:
        GOSBVL  MULTF                            * 35A2D
        GOSBVL  RCCD0                            * 35A34
        GOSBVL  RADDF                            * 35A3B
        GOVLNG  STAB0                            * 35A42

* refs (4): 35963 35978 359C0 35A01
SUB_35A49:
        GOSUB   SUB_35A70                        * 35A49
        RTNC                                     * 35A4D
        GOSUB   SUB_35AE7                        * 35A50
L_35A54:
        GOSBVL  MULTF                            * 35A54
        GOSBVL  RCCD2                            * 35A5B
        GOSBVL  RADDF                            * 35A62
        GOVLNG  STAB2                            * 35A69

* refs (2): 35A22 35A49
SUB_35A70:
        C=DAT0  W                                * 35A70
        SETDEC                                   * 35A74
        ?A=0    M                                * 35A76
        RTNYES                                   * 35A79
        ?C=0    M                                * 35A7B
        RTNYES                                   * 35A7E
        RTNCC                                    * 35A80
L_35A82:
        SETDEC                                   * 35A82
        ?B=0    M                                * 35A84
        RTNYES                                   * 35A87
        GOSUB   SUB_35ABD                        * 35A89
        ?D=0    M                                * 35A8D
        RTNYES                                   * 35A90
        GONC    L_35A2D                          * 35A92
L_35A95:
        SETDEC                                   * 35A95
        ?B=0    M                                * 35A97
        RTNYES                                   * 35A9A
        GOSUB   SUB_35ABD                        * 35A9C
        ?D=0    M                                * 35AA0
        RTNYES                                   * 35AA3
        GONC    L_35A54                          * 35AA5
L_35AA8:
        D1=D1+  5                                * 35AA8
        A=DAT1  W                                * 35AAB
        B=A     W                                * 35AAF
        B=0     S                                * 35AB2
        D1=D1-  5                                * 35AB5
        A=DAT1  A                                * 35AB8
        RTN                                      * 35ABB

* refs (2): 35A89 35A9C
SUB_35ABD:
        D0=D0+  5                                * 35ABD
        C=DAT0  W                                * 35AC0
        D=C     W                                * 35AC4
        D=0     S                                * 35AC7
        D0=D0-  5                                * 35ACA
        C=DAT0  A                                * 35ACD
        RTN                                      * 35AD0

* refs (8): 3551D 35551 356B3 356D1 35756 35834 ...
SUB_35AD2:
        GOVLNG  POP#                             * 35AD2

* refs (4): 35521 35555 357B5 35846
SUB_35AD9:
        GOVLNG  SAVPTR                           * 35AD9

* refs (3): 356DF 3576B 35779
SUB_35AE0:
        GOVLNG  PACK                             * 35AE0

* refs (3): 3561D 35A29 35A50
SUB_35AE7:
        GOVLNG  SPLTAC                           * 35AE7

* refs (7): 36138 361E7 366B0 3687C 36B19 36B6F ...
OBJ_35AEE:
        CON(5)  (*)+5                            * 35AEE  primitive code object
        C=DAT1  A                                * 35AF3
        CD1EX                                    * 35AF6
        RSTK=C                                   * 35AF9
        D1=D1+  10                               * 35AFB
        A=DAT1  A                                * 35AFE
        LC(5)   DOREAL                           * 35B01
        ?C=A    A                                * 35B08
        GOYES   L_35B10                          * 35B0B
        D0=D0+  10                               * 35B0D
L_35B10:
        C=RSTK                                   * 35B10
        RSTK=C                                   * 35B12
        D1=C                                     * 35B14
        D1=D1+  5                                * 35B17
        C=DAT1  A                                * 35B1A
        D1=C                                     * 35B1D
        D1=D1+  10                               * 35B20
        A=DAT1  A                                * 35B23
        LC(5)   DOREAL                           * 35B26
        ?C=A    A                                * 35B2D
        GOYES   L_35B35                          * 35B30
        D0=D0+  5                                * 35B32
L_35B35:
        C=RSTK                                   * 35B35
        D1=C                                     * 35B37
L_35B3A:
        LC(5)   COLA                             * 35B3A
        A=C     A                                * 35B41
        PC=(A)                                   * 35B43

* B% -> ?
* refs (5): 3676E 37C7A 37C9D 37CD8 37CFB
SWITCHFLOATS:
        CON(5)  (*)+5                            * 35B47  primitive code object
        C=DAT1  A                                * 35B4C
        CD1EX                                    * 35B4F
        A=DAT1  A                                * 35B52
        CD1EX                                    * 35B55
        LC(5)   DOREAL                           * 35B58
        ?C=A    A                                * 35B5F
        GOYES   L_35B3A                          * 35B62
        D0=D0+  5                                * 35B64
        LC(5)   DOCMP                            * 35B67
        ?C=A    A                                * 35B6E
        GOYES   L_35B3A                          * 35B71
        D0=D0+  5                                * 35B73
        LC(5)   DOEREL                           * 35B76
        ?C=A    A                                * 35B7D
        GOYES   L_35B3A                          * 35B80
        D0=D0+  5                                * 35B82
        GONC    L_35B3A                          * 35B85  always taken

* L% L% -> ?
* refs (4): 37BEE 37C11 37C34 37C57
SWITCH2FLOATS:
        CON(5)  (*)+5                            * 35B88  primitive code object
        C=DAT1  A                                * 35B8D
        CD1EX                                    * 35B90
        RSTK=C                                   * 35B93
        A=DAT1  A                                * 35B95
        LC(5)   DOEREL                           * 35B98
        ?C=A    A                                * 35B9F
        GOYES   L_35BA7                          * 35BA2
        D0=D0+  10                               * 35BA4
L_35BA7:
        C=RSTK                                   * 35BA7
        RSTK=C                                   * 35BA9
        D1=C                                     * 35BAB
        D1=D1+  5                                * 35BAE
        C=DAT1  A                                * 35BB1
        D1=C                                     * 35BB4
        A=DAT1  A                                * 35BB7
        LC(5)   DOEREL                           * 35BBA
        ?C=A    A                                * 35BC1
        GOYES   L_35BC9                          * 35BC4
        D0=D0+  5                                * 35BC6
L_35BC9:
        GOTO    L_35B35                          * 35BC9
        RPL

* refs (1): 2A696
OBJ_35BCD:
        :: OBJ_35BF5 %%>% ;                      * 35BCD

* refs (1): 2A6B9
OBJ_35BE1:
        :: OBJ_35BF5 %%H>HMS ;                   * 35BE1

* refs (2): 35BD2 35BE6
OBJ_35BF5:
        CON(5)  (*)+5                            * 35BF5  primitive code object
        ASSEMBLE
        GOSBVL  SUB_2A060                        * 35BFA
        HST=0   3                                * 35C01
        GOSBVL  SUB_79F38                        * 35C04
        GOTO    L_35612                          * 35C0B
        BSS     9                                * 35C0F
        RPL

* refs (4): 35CC7 36363 36AAE 37E32
OBJ_35C18:
        :: SWAP FreeRefs ;                       * 35C18

* seco [F%] -> [F%]'
* refs (5): 35D21 35E1D 35F80 36318 36381
DOARRYPRG1:
        :: ONE_DO_ARRY INDEX@ PULLLONGEL 3PICK EVAL INDEX@ PUTEL NextInArray * 35C2C
          SWAPDROP ;                             * 35C59

* seco [F%] [F%] -> [F%]'
* refs (8): 35FE4 3602F 3617E 361B5 36214 3622D ...
DOARRYPRG2:
        :: ONE_DO_ARRY SWAPINDEX@ DUPUNROT PULLLONGEL 2SWAP PULLLONGEL * 35C63
          ROTSWAP 5PICK EVAL INDEX@ PUTEL NextInArray ROTROT2DROP ; * 35C86

* [%] % -> [%]' [C%] C% -> [C%]'
* refs (4): 1D1A9 1D235 1D29E 1D2C6
MATCON:
        :: SWAPCKREF @con!(nb,ar) ;              * 35CAE

* refs (2): 1D253 1D27B
@con(ar,nb):
        :: OBJ_35C18                             * 35CC2

* refs (1): 35CB8
@con!(nb,ar):
          :: OVER TYPE OVER prefix(ar) #=?SKIP   * 35CCC

2r=>c:
            :: SWAP Re>C% SWAP ; '               * 35CEA

* 1 2 3 4 -> 1 2 3 1
* refs (1): 1729D
DROP3PICK:
            :: DROP 3PICK ; SWAP DOARRYPRG1 SWAPDROP ; * 35D08
        ;                                        * 35D30

* [F%] -> [F%]'
* refs (3): 1D2F5 1D340 1D37C
MATIDN:
        :: sqmat(ar)? DROP CKREF @idn!(ar) ;     * 35D35

* refs (1): 1D35E
@idn(ar):
        :: sqmat(ar)? DROP FreeRefs @idn!(ar) ;  * 35D53

* refs (4): 35D49 35D67 93B19 97E61
@idn!(ar):
        CON(5)  (*)+5                            * 35D71  primitive code object
        ASSEMBLE
        GOSUBL  SUB_376AC                        * 35D76
        C=DAT1  A                                * 35D7C
        D1=C                                     * 35D7F
        D1=D1+  5                                * 35D82
        A=DAT1  A                                * 35D85
        D1=D1+  5                                * 35D88
        C=DAT1  A                                * 35D8B
        D=C     A                                * 35D8E
        D1=D1+  10                               * 35D90
        C=DAT1  A                                * 35D93
        B=C     A                                * 35D96
        D1=D1+  10                               * 35D98
        CD1EX                                    * 35D9B
        D1=C                                     * 35D9E
        D0=C                                     * 35DA1
        D0=D0+  14                               * 35DA4
        LC(5)   #00019                           * 35DA7
        C=A-C   A                                * 35DAE
        GOSBVL  WIPEOUT                          * 35DB0
        A=B     A                                * 35DB7
        A=A+1   A                                * 35DB9
        ASL     A                                * 35DBB
        LC(5)   DOREAL                           * 35DBD
        ?D=C    A                                * 35DC4
        GOYES   L_35DCB                          * 35DC7
        A=A+A   A                                * 35DC9
L_35DCB:
        C=0     S                                * 35DCB
        C=C+1   S                                * 35DCE
        GONC    L_35DE0                          * 35DD1
L_35DD4:
        DAT0=C  S                                * 35DD4
        CD0EX                                    * 35DD8
        C=C+A   A                                * 35DDB
        D0=C                                     * 35DDD
L_35DE0:
        B=B-1   A                                * 35DE0
        GONC    L_35DD4                          * 35DE2
        GOLONG  L_37501                          * 35DE5
        RPL

* [F%] -> [F%]'
* refs (1): 1A9B8
MATNEG:
        :: CKREF @neg!(ar) ;                     * 35DEB

* refs (1): 203B6
@neg(ar):
        :: FreeRefs                              * 35DFF

* refs (1): 35DF5
@neg!(ar):
          :: ' B%NEG SWAP DOARRYPRG1 ; ;         * 35E09

* [F%] % -> [F%]'
* refs (3): 0FC14 0FC23 1BD8C
MATRND:
        :: ' OBJ_2B551                           * 35E2C

* refs (1): 35EB8
OBJ_35E3B:
          :: 3UNROLL OBJ_2B590 SWAPCKREF DUP ARSIZE OVER TYPERARRY? ?SKIP * 35E3B
            #2*                                  * 35E68
            #1+_ONE_DO INDEX@ PULLREALEL 3PICK 5PICK EVAL INDEX@ PUTREALEL * 35E6D
            NextInArray ROTROT2DROP ;            * 35E95
        ;                                        * 35EA4

* [F%] % -> [F%]'
* refs (1): 1BE08
MATTRNC:
        :: ' OBJ_2B55D OBJ_35E3B ;               * 35EA9

* refs (2): 1BD78 4FE1C
trunc(c,r):
        :: ' OBJ_2B551                           * 35EC2

* refs (1): 35F26
OBJ_35ED1:
          :: 3UNROLL OBJ_2B590 SWAP C%>% 3PICK 5PICK EVAL SWAPROT 4ROLL EVAL * 35ED1
            SWAP%>C% ;                           * 35F08
        ;                                        * 35F12

* refs (1): 1BDF4
conj(ar):
        :: ' OBJ_2B55D OBJ_35ED1 ;               * 35F17

* [F%] -> [F%]'
* refs (1): 1AA91
MATCONJ:
        :: DUP TYPERARRY? ?SEMI                  * 35F30
          CKREF drop;re(cc) ;                    * 35F44

* refs (1): 20435
@conj!(ar):
        :: DUP TYPERARRY? ?SEMI                  * 35F53
          FreeRefs                               * 35F67

* refs (1): 35F49
drop;re(cc):
          :: ' C%%CONJ SWAP DOARRYPRG1 ; ;       * 35F6C

* [F%] -> [%re]
* refs (2): 1C7ED 8835C
MATRE:
        :: DUP TYPERARRY? ?SEMI                  * 35F8F

* [F%] -> [F%] [0%]
* refs (4): 35FF3 360C0 7CDD8 97E5C
DUP%0CON:
          :: DUP DIMLIMITS %0_2A2B4 MAKEARRY ; ' * 35FA3
          :: DROP C%%>%% DROP ; 3UNROLL DOARRYPRG2 ; * 35FC6

* [F%] -> [%im]
* refs (1): 1C83C
MATIM:
        :: DUP%0CON OVER TYPERARRY? case SWAPDROP * 35FEE
          '                                      * 3600C
          :: DROP C%%>%% SWAPDROP ; 3UNROLL DOARRYPRG2 ; * 36011
