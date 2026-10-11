* HP 48GX ROM revision R, #660FC-#69141: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: drop;false;true_680B4 SmallCursor MediumCursor BigCursor Code_67005
* Follows on from the previous file (at #660FC in the original ROM).
        RPL

* refs (1): 68443
OBJ_660FC:
        ::                                       * 660FC
          OBJ_66C8B                              * 66101
          OBJ_679B3                              * 66106
          OBJ_67AAF                              * 6610B
          #9+                                    * 66110
        ;                                        * 66115

* refs (1): 68448
OBJ_6611A:
        ::                                       * 6611A
          OBJ_66C8B                              * 6611F
          OBJ_6799C                              * 66124
          OBJ_679B3                              * 66129
          OBJ_67AAF                              * 6612E
          #9+                                    * 66133
          OVER                                   * 66138
          OBJ_679B3                              * 6613D
          OBJ_67987                              * 66142
          DUP                                    * 66147
          OBJ_67AE2                              * 6614C
          SWAP                                   * 66151
          4UNROLL                                * 66156
          ROTOVER                                * 6615B
          2DUP#<                                 * 66160
          IT                                     * 66165
          DROPDUP                                * 6616A
          #-                                     * 6616F
          ROTOVER                                * 66174
          OBJ_65EC7                              * 66179
          DUPUNROT                               * 6617E
          #+                                     * 66183
          4UNROLL                                * 66188
          SWAP                                   * 6618D
          OBJ_67AAF                              * 66192
          #+                                     * 66197
          OBJ_67BBB                              * 6619C
        ;                                        * 661A1

* refs (1): 65EFE
OBJ_661A6:
        ::                                       * 661A6
          SKIP                                   * 661AB
          OBJ_66331                              * 661B0
          OBJ_6FD85                              * 661B5
          ::                                     * 661BA
            OBJ_6DFDE                            * 661BF
            OBJ_67416                            * 661C4
            OBJ_6F42D                            * 661C9
            OBJ_44DFE                            * 661CE
          ;                                      * 661D3
          OBJ_6FDB6                              * 661D8
          OBJ_66255                              * 661DD
          OBJ_6FDC6                              * 661E2
          OBJ_662B9                              * 661E7
          BINT8                                  * 661EC
          OBJ_6E433                              * 661F1
          OBJ_6E00B                              * 661F6
          OBJ_67E0C                              * 661FB
          OBJ_65D14                              * 66200
          OBJ_679AE                              * 66205
          DUP                                    * 6620A
          OBJ_6733B                              * 6620F
          OBJ_67BE2                              * 66214
          BINT0                                  * 66219
          3PICK                                  * 6621E
          BINT9                                  * 66223
          BINT7                                  * 66228
          OBJ_6DD2D                              * 6622D
          OBJ_682D2                              * 66232
          OBJ_67381                              * 66237
          OBJ_67BFC                              * 6623C
          OBJ_67381                              * 66241
          OBJ_67448                              * 66246
          OBJ_6E4F6                              * 6624B
        ;                                        * 66250

* refs (1): 661DD
OBJ_66255:
        ::                                       * 66255
          OBJ_6E1C7                              * 6625A
          DUP                                    * 6625F
          tok=                                   * 66264
          OBJ_6CB70                              * 66269
          OBJ_68245                              * 6626E
          DUPZERO                                * 66273
          OVER                                   * 66278
          OBJ_678DB                              * 6627D
          BINT5                                  * 66282
          OBJ_6DAE9                              * 66287
          OBJ_67381                              * 6628C
          OVER                                   * 66291
          OBJ_678DB                              * 66296
          OVER                                   * 6629B
          OBJ_67BFC                              * 662A0
          DUPUNROT                               * 662A5
          OBJ_67BE2                              * 662AA
          OBJ_67448                              * 662AF
        ;                                        * 662B4

* refs (1): 661E7
OBJ_662B9:
        ::                                       * 662B9
          OBJ_67E0C                              * 662BE
          OBJ_679B3                              * 662C3
          OBJ_679B3                              * 662C8
          DUPZERO                                * 662CD
          OBJ_67C3C                              * 662D2
          OBJ_6DD6E                              * 662D7
          4PICK                                  * 662DC
          #1+                                    * 662E1
          OBJ_678D6                              * 662E6
          BINT7                                  * 662EB
          BINT6                                  * 662F0
          OBJ_6DD2D                              * 662F5
          OBJ_682DE                              * 662FA
          OBJ_67381                              * 662FF
          SWAPDUP                                * 66304
          OBJ_678DB                              * 66309
          3PICK                                  * 6630E
          OBJ_67BEF                              * 66313
          #1+                                    * 66318
          OVER                                   * 6631D
          OBJ_67BD5                              * 66322
          OBJ_67448                              * 66327
        ;                                        * 6632C

* refs (1): 661B0
OBJ_66331:
        ::                                       * 66331
          OBJ_65E13                              * 66336
          OBJ_67E34                              * 6633B
          #2+                                    * 66340
          BINT9                                  * 66345
          #=casedrop                             * 6634A
          ::                                     * 6634F
            OBJ_67E64                            * 66354
            OBJ_65D14                            * 66359
            OBJ_679AE                            * 6635E
            OBJ_6D523                            * 66363
            OBJ_67BFC                            * 66368
          ;                                      * 6636D
          BINT7                                  * 66372
          #=casedrop                             * 66377
          ::                                     * 6637C
            OBJ_67E64                            * 66381
            OBJ_679B3                            * 66386
            DUP#1+                               * 6638B
            DUPUNROT                             * 66390
            OBJ_67BEF                            * 66395
            DUP#1+                               * 6639A
            SWAP                                 * 6639F
            OBJ_67BD5                            * 663A4
          ;                                      * 663A9
          SWAPDROP                               * 663AE
          #5=                                    * 663B3
          NOT?SEMI                               * 663B8
          OBJ_6E1C7                              * 663BD
          OBJ_6D523                              * 663C2
          OBJ_678D6                              * 663C7
          OVER                                   * 663CC
          OBJ_67BFC                              * 663D1
          OBJ_6E057                              * 663D6
          OBJ_65EC7                              * 663DB
        ;                                        * 663E0

* refs (1): 1B233
OBJ_663E5:
        ::                                       * 663E5
          SKIP                                   * 663EA
          OBJ_6656B                              * 663EF
          OBJ_67356                              * 663F4
          OBJ_6733B                              * 663F9
          OBJ_6CFB5                              * 663FE
          SWAPDROP                               * 66403
          OBJ_6E0D2                              * 66408
          #+                                     * 6640D
          #6+                                    * 66412
          SWAP                                   * 66417
          #2+                                    * 6641C
          OBJ_6C873                              * 66421
          #1+                                    * 66426
          OBJ_6D8DC                              * 6642B
          OBJ_67381                              * 66430
          #5+                                    * 66435
          DUPZERO                                * 6643A
          OBJ_67348                              * 6643F
          OBJ_67416                              * 66444
          OBJ_6D39D                              * 66449
          OBJ_6E0D2                              * 6644E
          OBJ_6E0C0                              * 66453
          OBJ_6C873                              * 66458
          #3+                                    * 6645D
          OBJ_6D990                              * 66462
          OBJ_682DE                              * 66467
          OBJ_67381                              * 6646C
          OBJ_67348                              * 66471
          OBJ_67416                              * 66476
          BINT1                                  * 6647B
          BINT4                                  * 66480
          BINT0                                  * 66485
          OBJ_6D779                              * 6648A
          BINT4                                  * 6648F
          OBJ_6DC51                              * 66494
          4ROLL                                  * 66499
          #1+                                    * 6649E
          4UNROLL                                * 664A3
          OBJ_682D2                              * 664A8
          OBJ_67348                              * 664AD
          DUP                                    * 664B2
          OBJ_67381                              * 664B7
          BINT0                                  * 664BC
          OBJ_67416                              * 664C1
          OBJ_6D39D                              * 664C6
          OBJ_6D7DD                              * 664CB
          OBJ_6D779                              * 664D0
          OBJ_6C873                              * 664D5
          #1+                                    * 664DA
          OBJ_6D990                              * 664DF
          OBJ_6DD6E                              * 664E4
          BINT0                                  * 664E9
          OBJ_6733B                              * 664EE
          BINT0                                  * 664F3
          #THREE#FOUR                            * 664F8
          BINT2                                  * 664FD
          OBJ_6D7DD                              * 66502
          OBJ_6DC51                              * 66507
          OBJ_6DFDE                              * 6650C
          ZEROZERO                               * 66511
          ZEROZERO                               * 66516
          OBJ_67364                              * 6651B
          OBJ_6D163                              * 66520
          OBJ_6D4CE                              * 66525
          OBJ_6D5EB                              * 6652A
        ;                                        * 6652F

* refs (1): 68439
OBJ_66534:
        ::                                       * 66534
          SWAPDROP                               * 66539
          ZEROSWAP                               * 6653E
          OBJ_66C8B                              * 66543
          OBJ_679AE                              * 66548
          SWAP                                   * 6654D
          OBJ_679C5                              * 66552
          OBJ_67AE2                              * 66557
          DUPUNROT                               * 6655C
          OBJ_67C16                              * 66561
        ;                                        * 66566

* refs (1): 663EF
OBJ_6656B:
        ::                                       * 6656B
          SKIP                                   * 66570
          ::                                     * 66575
            OBJ_65E13                            * 6657A
            OBJ_6F36A                            * 6657F
            OBJ_679AE                            * 66584
            OBJ_6D523                            * 66589
            DUP                                  * 6658E
            OBJ_6F42D                            * 66593
            OBJ_68245                            * 66598
            OVER                                 * 6659D
            OBJ_679A1                            * 665A2
            DUP                                  * 665A7
            OBJ_6F42D                            * 665AC
            OBJ_68245                            * 665B1
            ZEROSWAP                             * 665B6
            OBJ_68593                            * 665BB
            OBJ_67BFC                            * 665C0
          ;                                      * 665C5
          BINT4                                  * 665CA
          OBJ_6E433                              * 665CF
          OBJ_6E00B                              * 665D4
          OBJ_67E0C                              * 665D9
          OBJ_679C5                              * 665DE
          OBJ_679AE                              * 665E3
          DUPZERO                                * 665E8
          4PICK                                  * 665ED
          BINT5                                  * 665F2
          OBJ_6DAE9                              * 665F7
          2DUP                                   * 665FC
          OBJ_67381                              * 66601
          OBJ_67BE2                              * 66606
          OBJ_67381                              * 6660B
          OBJ_67BFC                              * 66610
          BINT7                                  * 66615
          3PICK                                  * 6661A
          OBJ_679A1                              * 6661F
          OBJ_68593                              * 66624
          OBJ_6D7DD                              * 66629
          OBJ_66FF1                              * 6662E
          OBJ_68245                              * 66633
          OBJ_678D6                              * 66638
          SWAP                                   * 6663D
          OBJ_679A1                              * 66642
          OBJ_66660                              * 66647
          2DROP                                  * 6664C
          OBJ_67381                              * 66651
          OBJ_67448                              * 66656
        ;                                        * 6665B

* refs (2): 66647 6841B
OBJ_66660:
        ::                                       * 66660
          OBJ_6799C                              * 66665
          OVER                                   * 6666A
          OBJ_6798C                              * 6666F
          DUP                                    * 66674
          OBJ_67AE2                              * 66679
          OVER                                   * 6667E

* refs (1): 666A6
OBJ_66683:
          ::                                     * 66683
            OBJ_67AAA                            * 66688
            SWAP                                 * 6668D
            OBJ_67AE2                            * 66692
            OBJ_6C339                            * 66697
          ;                                      * 6669C
          4ROLL                                  * 666A1
          OBJ_66683                              * 666A6
          #MAX                                   * 666AB
          #+OVER                                 * 666B0
          OBJ_67AAF                              * 666B5
          #MAX                                   * 666BA
          OBJ_44CD2                              * 666BF
          OBJ_44DB3                              * 666C4
          OBJ_44D9A                              * 666C9
        ;                                        * 666CE

* refs (5): 69DB1 6A159 6B115 6B7B3 6C4C4
OBJ_666D3:
        ::                                       * 666D3
          OBJ_66CD6                              * 666D8
          BINT1                                  * 666DD
          OBJ_6670A                              * 666E2
        ;                                        * 666E7

* refs (1): 66769
OBJ_666EC:
        ::                                       * 666EC
          BEGIN                                  * 666F1
          DUP                                    * 666F6
          OBJ_6670A                              * 666FB
          OBJ_6FEE1                              * 66700
        ;                                        * 66705

* refs (2): 666E2 666FB
OBJ_6670A:
        CON(5)  (*)+5                            * 6670A  primitive code object
        ASSEMBLE
        ST=0    10                               * 6670F
L_66712:
        LC(5)   #00009                           * 66712
        D=D-C   A                                * 66719
        GONC    L_66728                          * 6671B
        GOSBVL  SUB_6DDAB                        * 6671E
        GOC     L_66712                          * 66725
L_66728:
        D=D+C   A                                * 66728
        GOSBVL  POP#                             * 6672A
        R1=A.F  A                                * 66731
        GOSBVL  SUB_67A51                        * 66737
        A=DAT0  S                                * 6673E
        ?A=0    S                                * 66742
        GOYES   L_66776                          * 66745
        AD0EX                                    * 66747
        LC(5)   #00024                           * 6674A
        A=A+C   A                                * 66751
        D0=A                                     * 66753
        A=0     A                                * 66756
        A=DAT0  X                                * 66758
        GOSBVL  SUB_67918                        * 6675C
        C=R2                                     * 66763
        D0=C                                     * 66766
        LC(5)   OBJ_666EC                        * 66769
        A=C     A                                * 66770
        PC=(A)                                   * 66772
L_66776:
        D0=D0+  1                                * 66776
        A=DAT0  S                                * 66779
        A=A+A   S                                * 6677D
        GONC    L_6678A                          * 66780
        GOVLNG  L_685CD                          * 66783
L_6678A:
        A=DAT0  S                                * 6678A
        P=      15                               * 6678E
        LC(1)   #8                               * 66790
        A=A!C   P                                * 66793
        P=      0                                * 66797
        DAT0=A  S                                * 66799
        D0=D0+  4                                * 6679D
        A=0     A                                * 667A0
        A=DAT0  X                                * 667A2
        GOSBVL  SUB_680FB                        * 667A6
        D0=D0-  3                                * 667AD
        A=0     A                                * 667B0
        A=DAT0  X                                * 667B2
        GOSBVL  SUB_67918                        * 667B6
        CD1EX                                    * 667BD
        RSTK=C                                   * 667C0
        D1=(5)  EDITLINE                         * 667C2
        C=DAT1  A                                * 667C9
        D1=(5)  PDCHXS                           * 667CC
        A=DAT1  A                                * 667D3
        C=C-A   A                                * 667D6
        D1=(5)  MENULEVEL                        * 667D8
        A=DAT1  A                                * 667DF
        CR1EX                                    * 667E2
        A=A-C   A                                * 667E5
        C=A     A                                * 667E7
        A=A+A   A                                * 667E9
        A=A+A   A                                * 667EB
        A=A+C   A                                * 667ED
        C=R1                                     * 667EF
        C=C+A   A                                * 667F2
        D1=C                                     * 667F4
        A=DAT1  A                                * 667F7
        C=RSTK                                   * 667FA
        D1=C                                     * 667FC
        D1=D1-  5                                * 667FF
        D=D-1   A                                * 66802
        DAT1=A  A                                * 66804
        C=R2                                     * 66807
        D0=C                                     * 6680A
        LC(5)   XYGROBDISP                       * 6680D
        A=C     A                                * 66814
        PC=(A)                                   * 66816
        RPL

* refs (8): 68E2C 68EE5 692F1 69A27 6A14F 6D546 ...
OBJ_6681A:
        ::                                       * 6681A
          BEGIN                                  * 6681F
          OBJ_678DB                              * 66824
          DUP#0=                                 * 66829
          case                                   * 6682E
          drop;q_58A0C                           * 66833
          ::                                     * 66838
            OBJ_679AE                            * 6683D
            BEGIN                                * 66842
            OBJ_6689C                            * 66847
L_6684C:
            OBJ_6FEE1                            * 6684C
L_66851:
          ;                                      * 66851
          ZEROSWAP                               * 66856
          OBJ_679AE                              * 6685B
          ZEROZERO                               * 66860
          4PICK                                  * 66865
          OBJ_679D7                              * 6686A
          #1=                                    * 6686F
          ITE                                    * 66874
          OBJ_66933                              * 66879
          OBJ_66956                              * 6687E
          DUP                                    * 66883
          ?SKIP                                  * 66888
          SWAPDROP                               * 6688D
          NOT_UNTIL                              * 66892
        ;                                        * 66897

* refs (1): 66847
OBJ_6689C:
        CON(5)  (*)+5                            * 6689C  primitive code object
        ASSEMBLE
        GOSBVL  SUB_67A4A                        * 668A1
        D1=D1-  5                                * 668A8
        D=D-1   A                                * 668AB
L_668AD:
        A=DAT0  S                                * 668AD
        D0=D0+  10                               * 668B1
        D0=D0+  10                               * 668B4
        A=0     A                                * 668B7
        A=DAT0  B                                * 668B9
        ?A#0    S                                * 668BC
        GOYES   L_668E8                          * 668BF
        ?A=0    B                                * 668C1
        GOYES   L_668E8                          * 668C4
        A=A+1   B                                * 668C6
        GONC    L_668D3                          * 668C9
        GOVLNG  L_684C3                          * 668CC
L_668D3:
        A=A-1   B                                * 668D3
        GOSBVL  SUB_683D2                        * 668D6
        D0=(5)  L_6684C                          * 668DD
        PC=(A)                                   * 668E4
L_668E8:
        D0=D0+  10                               * 668E8
        A=0     A                                * 668EB
        A=DAT0  X                                * 668ED
        ?A=0    A                                * 668F1
        GOYES   L_66919                          * 668F4
        R3=A.F  A                                * 668F6
        D1=D1+  5                                * 668FC
        D=D+1   A                                * 668FF
        GOSBVL  SUB_67918                        * 66901
        A=R3.F  A                                * 66908
        GOSBVL  SUB_67A3D                        * 6690E
        GOTO    L_668AD                          * 66915
L_66919:
        D1=D1+  5                                * 66919
        D=D+1   A                                * 6691C
        D0=(5)  L_66851                          * 6691E
        LA(5)   RDROP                            * 66925
        PC=(A)                                   * 6692F
        RPL

* refs (1): 66879
OBJ_66933:
        ::                                       * 66933
          BINT0                                  * 66938
          4ROLL                                  * 6693D
          OBJ_66A0A                              * 66942
          OVER#+                                 * 66947
          OBJ_669B5                              * 6694C
        ;                                        * 66951

* refs (1): 6687E
OBJ_66956:
        ::                                       * 66956
          ROT                                    * 6695B
          BEGIN                                  * 66960
          OBJ_68550                              * 66965
          #0=?SKIP                               * 6696A
          ::                                     * 6696F
            5ROLLDROP                            * 66974
            OBJ_68550                            * 66979
            5UNROLL                              * 6697E
          ;                                      * 66983
          OBJ_67A98                              * 66988
          4ROLL                                  * 6698D
          #MAX                                   * 66992
          3UNROLL                                * 66997
          OBJ_67AAA                              * 6699C
          ROT#+                                  * 669A1
          SWAP                                   * 669A6
          OBJ_6FEE1                              * 669AB
          ZEROSWAP                               * 669B0

* refs (1): 6694C
OBJ_669B5:
          ::                                     * 669B5
            OBJ_66B19                            * 669BA
            6UNROLL                              * 669BF
            4PICK                                * 669C4
            4ROLLROT                             * 669C9
            OBJ_6CE8E                            * 669CE
            OVER                                 * 669D3
            4ROLL                                * 669D8
            OBJ_684D4                            * 669DD
            ROT                                  * 669E2
            DUP#0=ITE                            * 669E7
            DROP                                 * 669EC
            SWAPDROP                             * 669F1
            OBJ_66BC1                            * 669F6
            SWAP                                 * 669FB
          ;                                      * 66A00
        ;                                        * 66A05

* refs (1): 66942
OBJ_66A0A:
        CON(5)  (*)+5                            * 66A0A  primitive code object
        ASSEMBLE
L_66A0F:
        GOSBVL  SUB_67A4A                        * 66A0F
        D1=D1+  15                               * 66A16
        D1=D1+  10                               * 66A19
        D0=D0+  10                               * 66A1C
        D0=D0+  12                               * 66A1F
        A=0     A                                * 66A22
        A=DAT0  B                                * 66A24
        ?A#0    B                                * 66A27
        GOYES   L_66A34                          * 66A2A
        D1=D1-  5                                * 66A2C
        D=D-1   A                                * 66A2F
        GONC    L_66A3B                          * 66A31
L_66A34:
        GOSBVL  SUB_68573                        * 66A34
L_66A3B:
        C=0     A                                * 66A3B
        D0=D0-  5                                * 66A3D
        C=DAT0  X                                * 66A40
        R0=C                                     * 66A44
        D0=D0-  3                                * 66A47
        C=DAT0  X                                * 66A4A
        R3=C                                     * 66A4E
        D0=D0-  6                                * 66A51
        C=DAT0  X                                * 66A54
        R1=C                                     * 66A58
        D1=D1-  15                               * 66A5B
        D1=D1-  10                               * 66A5E
        D=D-1   A                                * 66A61
        GOSBVL  POP#                             * 66A63
        R4=A                                     * 66A6A
        GOSBVL  POP#                             * 66A6D
        AR3EX                                    * 66A74
        C=R1                                     * 66A77
        C=A-C   A                                * 66A7A
        GONC    L_66A81                          * 66A7C
        C=0     A                                * 66A7F
L_66A81:
        A=R3                                     * 66A81
        ?C<=A   A                                * 66A84
        GOYES   L_66A8B                          * 66A87
        A=C     A                                * 66A89
L_66A8B:
        R3=A                                     * 66A8B
        GOSBVL  POP#                             * 66A8E
        C=R1                                     * 66A95
        ?C>=A   A                                * 66A98
        GOYES   L_66A9F                          * 66A9B
        C=A     A                                * 66A9D
L_66A9F:
        R1=C                                     * 66A9F
        GOSBVL  POP#                             * 66AA2
        C=R0                                     * 66AA9
        C=C+A   A                                * 66AAC
        R0=C                                     * 66AAE
        D0=D0+  10                               * 66AB1
        D0=D0+  12                               * 66AB4
        C=0     A                                * 66AB7
        C=DAT0  X                                * 66AB9
        CR2EX                                    * 66ABD
        D0=C                                     * 66AC0
        GOSBVL  SAVPTR                           * 66AC3
        GOSBVL  PUSH2#                           * 66ACA
        GOSBVL  SAVPTR                           * 66AD1
        C=R3                                     * 66AD8
        R0=C                                     * 66ADB
        C=R4                                     * 66ADE
        R1=C                                     * 66AE1
        GOSBVL  PUSH2#                           * 66AE4
        D1=D1+  5                                * 66AEB
        D=D+1   A                                * 66AEE
        A=R2                                     * 66AF0
        ?A=0    A                                * 66AF3
        GOYES   L_66B0F                          * 66AF6
        CD0EX                                    * 66AF8
        R2=C                                     * 66AFB
        GOSBVL  SUB_67918                        * 66AFE
        C=R2                                     * 66B05
        D0=C                                     * 66B08
        GOTO    L_66A0F                          * 66B0B
L_66B0F:
        A=DAT0  A                                * 66B0F
        D0=D0+  5                                * 66B12
        PC=(A)                                   * 66B15

* refs (1): 669BA
OBJ_66B19:
        CON(5)  (*)+5                            * 66B19  primitive code object
        D1=D1+  15                               * 66B1E
        D1=D1+  5                                * 66B21
        A=DAT1  A                                * 66B24
        D1=D1-  10                               * 66B27
        LC(5)   BINT0                            * 66B2A
        ?C=A    A                                * 66B31
        GOYES   L_66B3D                          * 66B34
        D1=D1-  10                               * 66B36
        GOTO    L_66BA6                          * 66B39
L_66B3D:
        A=DAT1  A                                * 66B3D
        AD0EX                                    * 66B40
        D0=D0+  5                                * 66B43
        C=DAT0  A                                * 66B46
        R1=C                                     * 66B49
        D1=D1-  10                               * 66B4C
        C=DAT1  A                                * 66B4F
        D0=C                                     * 66B52
        D0=D0+  5                                * 66B55
        C=DAT0  A                                * 66B58
        R3=C                                     * 66B5B
        D0=A                                     * 66B5E
        D1=D1+  15                               * 66B61
        GOSBVL  SUB_67A4A                        * 66B64
        D=D-1   A                                * 66B6B
        D1=D1-  10                               * 66B6D
        D1=D1-  10                               * 66B70
        D0=D0+  14                               * 66B73
        A=0     A                                * 66B76
        A=DAT0  X                                * 66B78
        C=R3                                     * 66B7C
        ?C#A    A                                * 66B7F
        GOYES   L_66BA0                          * 66B82
        D0=D0+  3                                * 66B84
        A=DAT0  X                                * 66B87
        C=R2                                     * 66B8B
        D0=C                                     * 66B8E
        C=R1                                     * 66B91
        ?C#A    A                                * 66B94
        GOYES   L_66BA0                          * 66B97
L_66B99:
        GOVLNG  PushFLoop                        * 66B99
L_66BA0:
        C=R2                                     * 66BA0
        D0=C                                     * 66BA3
L_66BA6:
        GOVLNG  PushTLoop                        * 66BA6

* refs (9): 49AAB 694AE 6A339 6A3ED 6EA23 6F77F ...
OBJ_66BAD:
        CON(5)  (*)+5                            * 66BAD  primitive code object
        GOSBVL  POP#                             * 66BB2
        A=A+A   A                                * 66BB9
        GOC     L_66BA6                          * 66BBB
        GONC    L_66B99                          * 66BBE

* refs (1): 669F6
OBJ_66BC1:
        CON(5)  (*)+5                            * 66BC1  primitive code object
        D1=D1+  10                               * 66BC6
        GOSBVL  SUB_67A4A                        * 66BC9
        D1=D1-  15                               * 66BD0
        D0=D0+  8                                * 66BD3
        C=0     A                                * 66BD6
        C=DAT0  X                                * 66BD8
        GOSBVL  POP#                             * 66BDC
        DAT0=A  X                                * 66BE3
        GOSBVL  POP#                             * 66BE7
        D0=D0+  3                                * 66BEE
        DAT0=A  X                                * 66BF1
        CR2EX                                    * 66BF5
        D0=C                                     * 66BF8
        C=R2                                     * 66BFB
        D1=D1-  10                               * 66BFE
        A=DAT1  A                                * 66C01
        D1=D1+  10                               * 66C04
        D=D-1   A                                * 66C07
        ?C#A    A                                * 66C09
        GOYES   L_66C18                          * 66C0C
L_66C0E:
        A=DAT0  A                                * 66C0E
        D0=D0+  5                                * 66C11
        PC=(A)                                   * 66C14
L_66C18:
        LC(5)   TRUE                             * 66C18
        D1=D1+  5                                * 66C1F
        DAT1=C  A                                * 66C22
        D1=D1-  5                                * 66C25
        GOTO    L_66C0E                          * 66C28
        RPL

* refs (1): 6842A
OBJ_66C2C:
        ::                                       * 66C2C
          OBJ_66C8B                              * 66C31
          OBJ_679B3                              * 66C36
          OBJ_67AAF                              * 66C3B
          #1+                                    * 66C40
        ;                                        * 66C45

* refs (1): 6842F
OBJ_66C4A:
        ::                                       * 66C4A
          OBJ_679AE                              * 66C4F
          OBJ_67ABC                              * 66C54
          SWAP                                   * 66C59
          #2/                                    * 66C5E
          SWAPROT                                * 66C63
          OBJ_678DB                              * 66C68
          OBJ_679B3                              * 66C6D
          OBJ_67AE2                              * 66C72
          #+                                     * 66C77
          #2-                                    * 66C7C
        ;                                        * 66C81

* refs (1): 68434
OBJ_66C86:
        ::                                       * 66C86

* refs (5): 66101 6611F 66543 66C31 66CBD
OBJ_66C8B:
          ::                                     * 66C8B
            OBJ_67A98                            * 66C90
            #2/                                  * 66C95
            SWAP                                 * 66C9A
          ;                                      * 66C9F
          OBJ_679C5                              * 66CA4
          OBJ_67AE2                              * 66CA9
          #2+                                    * 66CAE
        ;                                        * 66CB3

* refs (1): 6843E
OBJ_66CB8:
        ::                                       * 66CB8
          OBJ_66C8B                              * 66CBD
          OBJ_679A1                              * 66CC2
          OBJ_679A1                              * 66CC7
          OBJ_67AE2                              * 66CCC
        ;                                        * 66CD1

* refs (2): 666D8 69BF1
OBJ_66CD6:
        ::                                       * 66CD6
          BINT1                                  * 66CDB
          BINT27                                 * 66CE0
          OVER                                   * 66CE5
          OBJ_67AE2                              * 66CEA
          2DUP#>                                 * 66CEF
          ITE                                    * 66CF4
          ::                                     * 66CF9
            DUPUNROT                             * 66CFE
            #-                                   * 66D03
          ;                                      * 66D08
          ::                                     * 66D0D
            SWAPDROP                             * 66D12
            BINT0                                * 66D17
          ;                                      * 66D1C
          3PICKOVER                              * 66D21

* refs (1): 44DF4
OBJ_66D26:
          ::                                     * 66D26
            OVER                                 * 66D2B
            BINT0                                * 66D30
            OBJ_67B67                            * 66D35
            OBJ_67BA1                            * 66D3A
          ;                                      * 66D3F
          #+                                     * 66D44
          BINT0                                  * 66D49
          ROT                                    * 66D4E
          OBJ_679B3                              * 66D53
          GOTO                                   * 66D58
          L_66D76                                * 66D5D
        ;                                        * 66D62

* refs (1): 66DDA
OBJ_66D67:
        ::                                       * 66D67
          OBJ_6812C                              * 66D6C
          3UNROLL                                * 66D71
L_66D76:
          BEGIN                                  * 66D76
          3PICKOVER                              * 66D7B
          OBJ_67AE2                              * 66D80
          #-                                     * 66D85
          OVERSWAP                               * 66D8A
          4PICKSWAP                              * 66D8F
          OBJ_66E61                              * 66D94
          OBJ_67A98                              * 66D99
          OBJ_66DB2                              * 66D9E
          NOT_UNTIL                              * 66DA3
          2DROP                                  * 66DA8
        ;                                        * 66DAD

* refs (2): 66D9E 66E4D
OBJ_66DB2:
        ::                                       * 66DB2
          ROT#+SWAP                              * 66DB7
          OBJ_679EA                              * 66DBC
          ?SKIP                                  * 66DC1
          ::                                     * 66DC6
            DUP                                  * 66DCB
            OBJ_679D2                            * 66DD0
            #1=case                              * 66DD5
            OBJ_66D67                            * 66DDA
            OBJ_66DF3                            * 66DDF
          ;                                      * 66DE4
          OBJ_67969                              * 66DE9
        ;                                        * 66DEE

* refs (1): 66DDF
OBJ_66DF3:
        ::                                       * 66DF3
          DUP                                    * 66DF8
          OBJ_67AD5                              * 66DFD
          OVER                                   * 66E02
          OBJ_67A7E                              * 66E07
          #+SWAP                                 * 66E0C
          OBJ_679AE                              * 66E11
          SWAP                                   * 66E16
          OBJ_67A8B                              * 66E1B
          SWAP                                   * 66E20
          BEGIN                                  * 66E25
          3PICKOVER                              * 66E2A
          OBJ_67AD5                              * 66E2F
          #-                                     * 66E34
          OVERSWAP                               * 66E39
          4PICK                                  * 66E3E
          OBJ_66E61                              * 66E43
          OBJ_67AAA                              * 66E48
          OBJ_66DB2                              * 66E4D
          NOT_UNTIL                              * 66E52
          2DROP                                  * 66E57
        ;                                        * 66E5C

* refs (2): 66D94 66E43
OBJ_66E61:
        ::                                       * 66E61
          OBJ_68017                              * 66E66
          3PICK                                  * 66E6B
          OBJ_67CA2                              * 66E70
          OBJ_44DD6                              * 66E75
        ;                                        * 66E7A

* refs (2): 6E0F3 6F44B
OBJ_66E7F:
        GROB    "images/66E7F.png"               * 66E7F  4 x 6
        BSS     6                                * 66E9F

* -> grob
* refs (1): 6C986
BigCursor:
        GROB    "images/66EA5-BigCursor.png"     * 66EA5  6 x 10

* -> grob
* refs (1): 6C995
MediumCursor:
        GROB    "images/66ECD-MediumCursor.png"  * 66ECD  6 x 8

* -> grob
* refs (1): 6C99A
SmallCursor:
        GROB    "images/66EF1-SmallCursor.png"   * 66EF1  4 x 6

* refs (1): 66011
OBJ_66F11:
        GROB    "images/66F11.png"               * 66F11  16 x 18

* refs (1): 6CB98
OBJ_66F6D:
        GROB    "images/66F6D.png"               * 66F6D  3 x 8

* refs (1): 44C55
OBJ_66F91:
        GROB    "images/66F91.png"               * 66F91  6 x 6

* refs (2): 6E0FE 6F446
OBJ_66FB1:
        GROB    "images/66FB1.png"               * 66FB1  6 x 8

* refs (1): 6FB22
OBJ_66FD5:
        GROB    "images/66FD5.png"               * 66FD5  5 x 4

* refs (6): 44D31 6662E 6CE20 6CF38 6D828 6DA3F
OBJ_66FF1:
        ::                                       * 66FF1
          BINT2                                  * 66FF6
          SWAP                                   * 66FFB
          MAKEGROB                               * 67000

Code_67005:
          CODE                                   * 67005  34 nibbles
            ST=0    0                            * 6700F
            GOSUB   SUB_67036                    * 67012
            C=R1.F  A                            * 67016
            D=C     A                            * 6701C
            A=R0.F  A                            * 6701E
            D1=A                                 * 67024
            A=DAT0  A                            * 67027
            D0=D0+  5                            * 6702A
            PC=(A)                               * 6702D
          ENDCODE                                * 67031
        ;                                        * 67031
        ASSEMBLE

* refs (1): 67012
SUB_67036:
        A=DAT1  A                                * 67036
        AD1EX                                    * 67039
        R0=A.F  A                                * 6703C
        D1=D1+  10                               * 67042
        A=DAT1  A                                * 67045
        R2=A.F  A                                * 67048
        D1=D1+  5                                * 6704E
        A=DAT1  A                                * 67051
        D1=D1+  5                                * 67054
        LC(1)   #3                               * 67057
        C=C&A   P                                * 6705A
        CSRC                                     * 6705E
        C=A     A                                * 67061
        SB=0                                     * 67063
        CSRB.F  A                                * 67066
        CSRB.F  A                                * 6706B
        ?SB=0                                    * 67070
        GOYES   L_67077                          * 67073
        C=C+1   A                                * 67075
L_67077:
        ?C#0    S                                * 67077
        GOYES   L_6707E                          * 6707A
        C=C+1   A                                * 6707C
L_6707E:
        R4=C.F  A                                * 6707E
        DCEX    A                                * 67084
        R1=C.F  A                                * 67086
        GOSBVL  w->W                             * 6708C
        R3=A.F  A                                * 67093
        C=A     A                                * 67099
        AD1EX                                    * 6709B
        ?ST=0   0                                * 6709E
        GOYES   L_670A5                          * 670A1
        A=A+C   A                                * 670A3
L_670A5:
        D1=A                                     * 670A5
        D=D-1   A                                * 670A8
        RTNC                                     * 670AA
        LC(1)   #F                               * 670AD
        D=D-1   A                                * 670B0
        GOC     L_670C1                          * 670B2
L_670B5:
        DAT1=C  1                                * 670B5
        D1=D1+  1                                * 670B9
        D=D-1   A                                * 670BC
        GONC    L_670B5                          * 670BE
L_670C1:
        C=C-1   S                                * 670C1
        GONC    L_670D3                          * 670C4
        D1=D1-  1                                * 670C7
        LC(1)   #7                               * 670CA
        DAT1=C  P                                * 670CD
        RTNCC                                    * 670D1
L_670D3:
        C=C-1   S                                * 670D3
        GOC     L_670EC                          * 670D6
        C=0     P                                * 670D9
L_670DC:
        C=C+C   P                                * 670DC
        C=C+1   P                                * 670DF
        C=C-1   S                                * 670E2
        GONC    L_670DC                          * 670E5
        DAT1=C  1                                * 670E8
L_670EC:
        RTNCC                                    * 670EC

* refs (1): 44CAF
OBJ_670EE:
        CON(5)  (*)+5                            * 670EE  primitive code object
        GOSUB   SUB_67136                        * 670F3
        LC(2)   #08                              * 670F7
        DAT1=C  B                                * 670FB
        D1=D1+  2                                * 670FE
        LC(2)   #14                              * 67101
        DAT1=C  B                                * 67105
        D1=D1+  2                                * 67108
        LC(2)   #04                              * 6710B
        GOSUB   SUB_67129                        * 6710F
        LC(1)   #5                               * 67113
        DAT1=C  B                                * 67116
        D1=D1+  2                                * 67119
        LC(1)   #2                               * 6711C
        DAT1=C  B                                * 6711F
L_67122:
        GOVLNG  GETPTRLOOP                       * 67122

* refs (4): 6710F 67131 67173 671A8
SUB_67129:
        DAT1=C  B                                * 67129
        D1=D1+  2                                * 6712C
        D=D-1   A                                * 6712F
        GONC    SUB_67129                        * 67131
        RTN                                      * 67134

* refs (3): 670F3 67162 67198
SUB_67136:
        GOSUB   SUB_67156                        * 67136
        A=DAT1  A                                * 6713A
        D1=A                                     * 6713D
        D1=D1+  10                               * 67140
        C=DAT1  A                                * 67143
        C=C-CON A,5                              * 67146
        GOC     L_67122                          * 6714C
        D=C     A                                * 6714F
        D1=D1+  10                               * 67151
        RTN                                      * 67154

* refs (1): 67136
SUB_67156:
        GOVLNG  SAVPTR                           * 67156

* refs (1): 44CE1
OBJ_6715D:
        CON(5)  (*)+5                            * 6715D  primitive code object
        GOSUB   SUB_67136                        * 67162
        LC(2)   #0C                              * 67166
        DAT1=C  B                                * 6716A
        D1=D1+  2                                * 6716D
        LC(1)   #4                               * 67170
        GOSUB   SUB_67129                        * 67173
        LC(1)   #5                               * 67177
        DAT1=C  B                                * 6717A
        D1=D1+  2                                * 6717D
        LC(1)   #6                               * 67180
        DAT1=C  B                                * 67183
        D1=D1+  2                                * 67186
        LC(1)   #4                               * 67189
        DAT1=C  B                                * 6718C
        GOTO    L_67122                          * 6718F

* refs (1): 44D8B
OBJ_67193:
        CON(5)  (*)+5                            * 67193  primitive code object
        GOSUB   SUB_67136                        * 67198
        LC(5)   #00004                           * 6719C
        D=D+C   A                                * 671A3
        LC(1)   #1                               * 671A5
        GOSUB   SUB_67129                        * 671A8
        GOTO    L_67122                          * 671AC

* refs (1): 6D4A1
OBJ_671B0:
        CON(5)  (*)+5                            * 671B0  primitive code object
        ST=0    0                                * 671B5
        ST=0    3                                * 671B8
        GOTO    L_671CA                          * 671BB

* refs (1): 44C64
OBJ_671BF:
        CON(5)  (*)+5                            * 671BF  primitive code object
        ST=1    0                                * 671C4
        ST=0    3                                * 671C7
L_671CA:
        GOSBVL  SAVPTR                           * 671CA
        A=DAT1  A                                * 671D1
        D1=A                                     * 671D4
        D1=D1+  10                               * 671D7
        C=DAT1  A                                * 671DA
        D=C     A                                * 671DD
        D1=D1+  5                                * 671DF
        A=DAT1  A                                * 671E2
        D1=D1+  5                                * 671E5
        AD1EX                                    * 671E8
        R0=A.F  A                                * 671EB
        AD1EX                                    * 671F1
        GOSBVL  w->W                             * 671F4
        B=A     A                                * 671FB
        ?ST=0   3                                * 671FD
        GOYES   L_67228                          * 67200
        LC(1)   #8                               * 67202
        DAT1=C  P                                * 67205
        GOSUB   SUB_672D2                        * 67209
        LC(1)   #4                               * 6720D
        DAT1=C  P                                * 67210
        D1=D1+  1                                * 67214
        P=      15                               * 67217
        LC(1)   #1                               * 67219
        P=      0                                * 6721C
        GOSUB   SUB_672C4                        * 6721E
        D1=D1-  1                                * 67222
        GONC    L_67254                          * 67225
L_67228:
        D=D-1   A                                * 67228
        P=      15                               * 6722A
        LC(1)   #1                               * 6722C
        ?ST=0   0                                * 6722F
        GOYES   L_67237                          * 67232
        LC(1)   #8                               * 67234
L_67237:
        P=      0                                * 67237
        GOSUB   SUB_672C4                        * 67239
        GOSUB   SUB_672D2                        * 6723D
        P=      15                               * 67241
        LC(1)   #2                               * 67243
        ?ST=0   0                                * 67246
        GOYES   L_6724E                          * 67249
        LC(1)   #4                               * 6724B
L_6724E:
        P=      0                                * 6724E
        GOSUB   SUB_672C4                        * 67250
L_67254:
        P=      15                               * 67254
        LC(1)   #2                               * 67256
        ?ST=1   0                                * 67259
        GOYES   L_67261                          * 6725C
        LC(1)   #4                               * 6725E
L_67261:
        P=      0                                * 67261
        C=0     A                                * 67263
        LC(1)   #5                               * 67265
        D=D-C   A                                * 67268
L_6726A:
        GOSUB   SUB_672D2                        * 6726A
        GOSUB   SUB_672C4                        * 6726E
        D=D-1   A                                * 67272
        GONC    L_6726A                          * 67274
        P=      15                               * 67277
        ?ST=1   3                                * 67279
        GOYES   L_672AE                          * 6727C
        LC(1)   #2                               * 6727E
        ?ST=0   0                                * 67281
        GOYES   L_67289                          * 67284
        LC(1)   #4                               * 67286
L_67289:
        P=      0                                * 67289
        GOSUB   SUB_672D2                        * 6728B
        GOSUB   SUB_672C4                        * 6728F
        GOSUB   SUB_672D2                        * 67293
        P=      15                               * 67297
        LC(1)   #1                               * 67299
        ?ST=0   0                                * 6729C
        GOYES   L_672A4                          * 6729F
        LC(1)   #8                               * 672A1
L_672A4:
        P=      0                                * 672A4
        GOSUB   SUB_672C4                        * 672A6
        GOTO    L_67122                          * 672AA
L_672AE:
        LC(1)   #5                               * 672AE
        DAT1=C  P                                * 672B1
        GOSUB   SUB_672D2                        * 672B5
        LC(1)   #2                               * 672B9
        DAT1=C  P                                * 672BC
        GOTO    L_67289                          * 672C0

* refs (6): 6721E 67239 67250 6726E 6728F 672A6
SUB_672C4:
        A=DAT1  S                                * 672C4
        A=A!C   S                                * 672C8
        DAT1=A  S                                * 672CC
        RTN                                      * 672D0

* refs (6): 67209 6723D 6726A 6728B 67293 672B5
SUB_672D2:
        CD1EX                                    * 672D2
        C=C+B   A                                * 672D5
        D1=C                                     * 672D7
        RTN                                      * 672DA
        RPL

* refs (2): 2DFEB 2F8C1
OBJ_672DC:
        #       C17                              * 672DC  3095

* refs (11): 68909 69599 695E9 69950 699EB 69AF4 ...
OBJ_672E6:
        CON(5)  (*)+5                            * 672E6  primitive code object
        ASSEMBLE
        LC(5)   KEYLIST                          * 672EB
        CD0EX                                    * 672F2
        RSTK=C                                   * 672F5
        A=DAT0  A                                * 672F7
        D0=(5)  STACKNUM                         * 672FA
        C=DAT0  A                                * 67301
        A=A-C   A                                * 67304
        C=RSTK                                   * 67306
        D0=C                                     * 67308
        GOTO    L_6739E                          * 6730B
        BSS     14                               * 6730F
        RPL

* refs (2): 6AC8F 6C3DE
OBJ_6731D:
        ::                                       * 6731D
          OBJ_67519                              * 67322
          OBJ_6773D                              * 67327
          OBJ_673D6                              * 6732C
          #+                                     * 67331
        ;                                        * 67336

* refs (14): 65C22 65DD7 65DE1 65F0D 6620F 663F9 ...
OBJ_6733B:
        CON(5)  (*)+5                            * 6733B  primitive code object
        ASSEMBLE
        C=0     A                                * 67340
        C=C+1   A                                * 67342
        GOTO    L_67388                          * 67344

* refs (21): 65AA1 65AE2 65B78 65BB9 65BF0 66093 ...
OBJ_67348:
        CON(5)  (*)+5                            * 67348  primitive code object
        C=0     A                                * 6734D
        LC(1)   #2                               * 6734F
        GOTO    L_67388                          * 67352

* refs (18): 65AEC 65FDF 6602A 66061 660A7 663F4 ...
OBJ_67356:
        CON(5)  (*)+5                            * 67356  primitive code object
        C=0     A                                * 6735B
        LC(1)   #3                               * 6735D
        GOTO    L_67388                          * 67360

* refs (11): 65AF1 65BF5 660D9 6651B 6A028 6CD49 ...
OBJ_67364:
        CON(5)  (*)+5                            * 67364  primitive code object
        C=0     A                                * 67369
        C=C-1   A                                * 6736B
        GOTO    L_67388                          * 6736D

* refs (6): 6CE2F 6CE3E 6D50F 6D550 6DAD0 6DD5F
OBJ_67371:
        CON(5)  (*)+5                            * 67371  primitive code object
        LC(5)   #FFFFE                           * 67376
        GOTO    L_67388                          * 6737D

* refs (62): 65AD8 65AE7 65B3C 65B46 65B6E 65BBE ...
OBJ_67381:
        CON(5)  (*)+5                            * 67381  primitive code object
        C=0     A                                * 67386
L_67388:
        RSTK=C                                   * 67388
        LC(5)   MENULEVEL                        * 6738A
        CD0EX                                    * 67391
        A=DAT0  A                                * 67394
        CD0EX                                    * 67397
        C=RSTK                                   * 6739A
        A=A+C   A                                * 6739C
L_6739E:
        GOTO    L_67907                          * 6739E

* refs (4): 6867F 69FD8 6C096 6CDAD
OBJ_673A2:
        CON(5)  (*)+5                            * 673A2  primitive code object
        LC(5)   SAVECROSS                        * 673A7
L_673AE:
        CD0EX                                    * 673AE
        A=DAT0  A                                * 673B1
        D0=C                                     * 673B4
        GOTO    L_67907                          * 673B7

* refs (5): 6C0A0 6C97C 6CB84 6CBA2 6F432
OBJ_673BB:
        CON(5)  (*)+5                            * 673BB  primitive code object
        LC(5)   AppCount                         * 673C0
        CD0EX                                    * 673C7
        A=0     A                                * 673CA
        A=DAT0  B                                * 673CC
        D0=C                                     * 673CF
        GOTO    L_6739E                          * 673D2

* refs (7): 0C4ED 6732C 676D9 69192 6A037 6C1D1 ...
OBJ_673D6:
        CON(5)  (*)+5                            * 673D6  primitive code object
        LC(5)   EqPtr                            * 673DB
        GOTO    L_673AE                          * 673E2

* refs (4): 0C4E8 676F7 69FC9 6C1E0
OBJ_673E6:
        CON(5)  (*)+5                            * 673E6  primitive code object
        LC(5)   VIEWLEVEL                        * 673EB
        GOTO    L_673AE                          * 673F2

* refs (2): 67537 69FDD
OBJ_673F6:
        CON(5)  (*)+5                            * 673F6  primitive code object
        LC(5)   STACKNUM                         * 673FB
        GOTO    L_673AE                          * 67402

* refs (3): 675F8 67742 69FD3
OBJ_67406:
        CON(5)  (*)+5                            * 67406  primitive code object
        LC(5)   KEYLIST                          * 6740B
        GOTO    L_673AE                          * 67412

* refs (61): 4B8F0 65AA6 65B8C 65F99 660AC 661C4 ...
OBJ_67416:
        CON(5)  (*)+5                            * 67416  primitive code object
        LC(5)   FONTHEIGHT                       * 6741B
        GOTO    L_673AE                          * 67422

* refs (4): 69D1F 6AAE6 6C8B4 6E8C5
OBJ_67426:
        CON(5)  (*)+5                            * 67426  primitive code object
        GOSBVL  POP#                             * 6742B
        LC(5)   AppCount                         * 67432
        CD0EX                                    * 67439
        DAT0=A  B                                * 6743C
        GOTO    L_6778D                          * 6743F

* refs (2): 4B8FA 6E20D
OBJ_67443:
        CON(5)  DupAndThen                       * 67443  code object: the address of its machine code

* refs (22): 65D00 65D9B 65E04 66246 662AF 66327 ...
OBJ_67448:
        CON(5)  (*)+5                            * 67448  primitive code object
        LC(5)   FONTHEIGHT                       * 6744D
        GOTO    L_67464                          * 67454

* refs (5): 6868E 6A0B9 6C578 6CDB7 6E8CF
OBJ_67458:
        CON(5)  (*)+5                            * 67458  primitive code object
        LC(5)   SAVECROSS                        * 6745D
L_67464:
        GOVLNG  L_114C9                          * 67464

* refs (5): 6A0C3 6A54B 6C596 6CDC1 6E8C0
OBJ_6746B:
        CON(5)  (*)+5                            * 6746B  primitive code object
        LC(5)   MENULEVEL                        * 67470
        GOTO    L_67464                          * 67477

* refs (5): 676F2 67733 6919C 6A0D2 6C5A0
OBJ_6747B:
        CON(5)  (*)+5                            * 6747B  primitive code object
        LC(5)   EqPtr                            * 67480
        GOTO    L_67464                          * 67487

* refs (3): 67706 6A0CD 6C56E
OBJ_6748B:
        CON(5)  (*)+5                            * 6748B  primitive code object
        LC(5)   VIEWLEVEL                        * 67490
        GOTO    L_67464                          * 67497

* refs (4): 6754B 675F3 6A0B4 6C587
OBJ_6749B:
        CON(5)  (*)+5                            * 6749B  primitive code object
        LC(5)   STACKNUM                         * 674A0
        GOTO    L_67464                          * 674A7

* refs (3): 67602 6A0BE 6C58C
OBJ_674AB:
        CON(5)  (*)+5                            * 674AB  primitive code object
        LC(5)   KEYLIST                          * 674B0
        GOTO    L_67464                          * 674B7

* refs (3): 6912E 69454 6EB9F
OBJ_674BB:
        CON(5)  (*)+5                            * 674BB  primitive code object
        LC(5)   STACKNUM                         * 674C0
        CD0EX                                    * 674C7
        A=DAT0  A                                * 674CA
        A=A+1   A                                * 674CD
        DAT0=A  A                                * 674CF
        GOTO    L_6778D                          * 674D2

* refs (3): 6CDC6 6D4E7 6E8A7
OBJ_674D6:
        CON(5)  (*)+5                            * 674D6  primitive code object
        GOSUB   SUB_674EA                        * 674DB
L_674DF:
        GOSBVL  GETPTR                           * 674DF
        GOTO    L_67907                          * 674E6

* refs (2): 674DB 6751E
SUB_674EA:
        GOSBVL  SAVPTR                           * 674EA
        D0=(5)  EDITLINE                         * 674F1
        C=DAT0  A                                * 674F8
        AD1EX                                    * 674FB
        C=C-A   A                                * 674FE
        D0=(5)  PDCHXS                           * 67500
        A=DAT0  A                                * 67507
        C=C-A   A                                * 6750A
        GOSBVL  DIV5                             * 6750C
        A=C     A                                * 67513
        A=A+1   A                                * 67515
        RTN                                      * 67517

* refs (7): 67322 67607 6770B 67C71 68254 6A4E2 ...
OBJ_67519:
        CON(5)  (*)+5                            * 67519  primitive code object
        GOSUB   SUB_674EA                        * 6751E
        D0=(5)  MENULEVEL                        * 67522
        C=DAT0  A                                * 67529
        A=A+C   A                                * 6752C
        GOTO    L_674DF                          * 6752E
        RPL

* refs (5): 68F62 6947C 6C82D 6EF55 6F02C
OBJ_67532:
        ::                                       * 67532
          OBJ_673F6                              * 67537
          DUP#0=IT                               * 6753C
          OBJ_675E4                              * 67541
          DUP#1-                                 * 67546
          OBJ_6749B                              * 6754B
          OBJ_6755A                              * 67550
        ;                                        * 67555

* refs (1): 67550
OBJ_6755A:
        CON(5)  (*)+5                            * 6755A  primitive code object
        ASSEMBLE
        LC(5)   MENULEVEL                        * 6755F
        CD0EX                                    * 67566
        A=DAT0  A                                * 67569
        D0=C                                     * 6756C
        GOSUB   SUB_676C5                        * 6756F
        R0=A                                     * 67573
        GOSBVL  POP#                             * 67576
        A=A-1   A                                * 6757D
        GOSUB   SUB_676C5                        * 6757F
        GOSUB   SUB_676C5                        * 67583
        R1=A                                     * 67587
        GOSUB   SUB_675BE                        * 6758A
        A=R1                                     * 6758E
        C=C+A   A                                * 67591
        D0=C                                     * 67593
        C=DAT1  15                               * 67596
        DAT0=C  15                               * 6759A
        D1=D1+  15                               * 6759E
        D0=D0+  15                               * 675A1
        C=DAT1  10                               * 675A4
        DAT0=C  10                               * 675A8
        D1=D1+  10                               * 675AC
        LC(5)   #00005                           * 675AF
        D=D+C   A                                * 675B6
        GOLONG  L_685CD                          * 675B8

* refs (4): 6758A 67778 677AD 67F00
SUB_675BE:
        LC(5)   PDCHXS                           * 675BE
        CD0EX                                    * 675C5
        R2=C.F  A                                * 675C8
        C=DAT0  A                                * 675CE
        D0=(5)  EDITLINE                         * 675D1
        A=DAT0  A                                * 675D8
        A=A-C   A                                * 675DB
        C=R0                                     * 675DD
        C=C+A   A                                * 675E0
        RTN                                      * 675E2
        RPL

* refs (1): 67541
OBJ_675E4:
        ::                                       * 675E4
          #6+                                    * 675E9
          DUP                                    * 675EE
          OBJ_6749B                              * 675F3
          OBJ_67406                              * 675F8
          #6+                                    * 675FD
          OBJ_674AB                              * 67602
          OBJ_67519                              * 67607
          #1+                                    * 6760C
          BINT30                                 * 67611

* refs (2): 6771F 6A4FB
OBJ_67616:
          ::                                     * 67616
            OBJ_67682                            * 6761B
            ZERO_DO                              * 67620
            OBJ_6C7F6                            * 67625
            OVER                                 * 6762A
            UNROLL                               * 6762F
            LOOP                                 * 67634
            DROP                                 * 67639
          ;                                      * 6763E
        ;                                        * 67643

* refs (2): 6A06E 6C819
OBJ_67648:
        CON(5)  (*)+5                            * 67648  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 6764D
        LC(5)   PDCHXS                           * 67654
        CD0EX                                    * 6765B
        DAT0=A  A                                * 6765E
        GOTO    L_6778D                          * 67661

* refs (1): 69FEC
OBJ_67665:
        CON(5)  (*)+5                            * 67665  primitive code object
        GOSBVL  SAVPTR                           * 6766A
        D0=(5)  PDCHXS                           * 67671
        A=DAT0  A                                * 67678
        GOVLNG  PUSH#ALOOP                       * 6767B

* refs (3): 6761B 6A979 6C30C
OBJ_67682:
        CON(5)  (*)+5                            * 67682  primitive code object
        LC(5)   PDCHXS                           * 67687
        CD1EX                                    * 6768E
        A=DAT1  A                                * 67691
        D1=C                                     * 67694
        R0=A                                     * 67697
        A=DAT1  A                                * 6769A
        AD1EX                                    * 6769D
        D1=D1+  5                                * 676A0
        C=DAT1  A                                * 676A3
        D1=A                                     * 676A6
        A=C     A                                * 676A9
        GOSUB   SUB_676C5                        * 676AB
        C=R0                                     * 676AF
        A=A+C   A                                * 676B2
        LC(5)   PDCHXS                           * 676B4
        CD0EX                                    * 676BB
        DAT0=A  A                                * 676BE
        GOTO    L_6778D                          * 676C1

* refs (8): 6756F 6757F 67583 676AB 67771 677A6 ...
SUB_676C5:
        C=A     A                                * 676C5
        A=A+A   A                                * 676C7
        A=A+A   A                                * 676C9
        A=A+C   A                                * 676CB
        RTN                                      * 676CD

* refs (3): 68ACB 691BA 69874
OBJ_676CF:
        CON(5)  DupAndThen                       * 676CF  code object: the address of its machine code
        RPL

* refs (4): 6894F 68E72 690F2 6910B
OBJ_676D4:
        ::                                       * 676D4
          OBJ_673D6                              * 676D9
          DUP#0=IT                               * 676DE
          ::                                     * 676E3
            DROP                                 * 676E8
            BINT15                               * 676ED
            OBJ_6747B                            * 676F2
            OBJ_673E6                            * 676F7
            BINT15                               * 676FC
            #+                                   * 67701
            OBJ_6748B                            * 67706
            OBJ_67519                            * 6770B
            #1+                                  * 67710
            OBJ_6773D                            * 67715
            BINT15                               * 6771A
            OBJ_67616                            * 6771F
            BINT15                               * 67724
          ;                                      * 67729
          #1-DUP                                 * 6772E
          OBJ_6747B                              * 67733
          OBJ_67381                              * 67738

* refs (5): 67327 67715 691A6 6A03C 6C1CC
OBJ_6773D:
          ::                                     * 6773D
            OBJ_67406                            * 67742
            OBJ_68183                            * 67747
            #+                                   * 6774C
          ;                                      * 67751
          #+                                     * 67756
          OBJ_67765                              * 6775B
        ;                                        * 67760

* refs (1): 6775B
OBJ_67765:
        CON(5)  (*)+5                            * 67765  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 6776A
        GOSUB   SUB_676C5                        * 67771
        R0=A                                     * 67775
        GOSUB   SUB_675BE                        * 67778
        D0=C                                     * 6777C
        C=DAT1  A                                * 6777F
        D1=D1+  5                                * 67782
        D=D+1   A                                * 67785
        DAT0=C  A                                * 67787
L_6778A:
        C=R2                                     * 6778A
L_6778D:
        D0=C                                     * 6778D
L_67790:
        A=DAT0  A                                * 67790
        D0=D0+  5                                * 67793
        PC=(A)                                   * 67796

* refs (1): 691B0
OBJ_6779A:
        CON(5)  (*)+5                            * 6779A  primitive code object
        GOSBVL  POP#                             * 6779F
        GOSUB   SUB_676C5                        * 677A6
        R0=A                                     * 677AA
        GOSUB   SUB_675BE                        * 677AD
        D0=C                                     * 677B1
        C=DAT0  A                                * 677B4
        D1=D1-  5                                * 677B7
        D=D-1   A                                * 677BA
        DAT1=C  A                                * 677BC
        GOTO    L_6778A                          * 677BF

* refs (1): 69567
OBJ_677C3:
        CON(5)  (*)+5                            * 677C3  primitive code object
        GOSUB   SUB_67E7B                        * 677C8
        C=R2                                     * 677CC
        CD0EX                                    * 677CF
        CD1EX                                    * 677D2
        RSTK=C                                   * 677D5
        GOVLNG  L_2832B                          * 677D7

* refs (5): 69CDE 69D57 69D6B 6AE4C 6C8DC
OBJ_677DE:
        CON(5)  (*)+5                            * 677DE  primitive code object
        ST=0    0                                * 677E3
        GOTO    L_677F2                          * 677E6

* refs (11): 69D15 69D5C 6A960 6AE74 6AED3 6AF50 ...
OBJ_677EA:
        CON(5)  (*)+5                            * 677EA  primitive code object
        ST=1    0                                * 677EF
L_677F2:
        GOSBVL  SAVPTR                           * 677F2
        D0=(5)  EDITLINE                         * 677F9
        C=DAT0  A                                * 67800
        D0=C                                     * 67803
        D0=D0-  5                                * 67806
        B=0     A                                * 67809
        LC(5)   OBJ_6C7E5                        * 6780B
L_67812:
        A=DAT1  A                                * 67812
        B=B+1   A                                * 67815
        ?C=A    A                                * 67817
        GOYES   L_6782F                          * 6781A
        D1=D1+  5                                * 6781C
        AD1EX                                    * 6781F
        CD0EX                                    * 67822
        ?C>A    A                                * 67825
        GOYES   L_6783D                          * 67828
        D1=A                                     * 6782A
        B=0     A                                * 6782D
L_6782F:
        A=B     A                                * 6782F
        ?ST=0   0                                * 67831
        GOYES   L_67846                          * 67834
        GOVLNG  PUSH#ALOOP                       * 67836
L_6783D:
        CD0EX                                    * 6783D
        D1=A                                     * 67840
        GOC     L_67812                          * 67843
L_67846:
        ?A#0    A                                * 67846
        GOYES   L_6784E                          * 67849
        ST=1    0                                * 6784B
L_6784E:
        D1=D1+  5                                * 6784E
        CD1EX                                    * 67851
        RSTK=C                                   * 67854
        GOSBVL  ADJMEM                           * 67856
        GOSBVL  GETPTR                           * 6785D
        ?ST=1   0                                * 67864
        GOYES   L_6786E                          * 67867
        C=RSTK                                   * 67869
        D1=C                                     * 6786B
L_6786E:
        A=DAT0  A                                * 6786E
        D0=D0+  5                                * 67871
        PC=(A)                                   * 67874

* refs (1): 69503
OBJ_67878:
        CON(5)  (*)+5                            * 67878  primitive code object
        GOSBVL  POP2#                            * 6787D
        CAEX    A                                * 67884
        RSTK=C                                   * 67886
        C=0     A                                * 67888
        R1=C                                     * 6788A
        R3=C                                     * 6788D
L_67890:
        R0=A                                     * 67890
        GOSUB   SUB_67A51                        * 67893
        D0=D0+  10                               * 67897
        D0=D0+  14                               * 6789A
        C=DAT0  X                                * 6789D
        A=C     X                                * 678A1
        A=A+A   X                                * 678A4
        GOC     L_678BB                          * 678A7
        A=R1                                     * 678AA
        ?C<=A   X                                * 678AD
        GOYES   L_678BB                          * 678B0
        R1=C                                     * 678B2
        C=R0                                     * 678B5
        R3=C                                     * 678B8
L_678BB:
        A=R0                                     * 678BB
        A=A+1   A                                * 678BE
        C=R2                                     * 678C0
        D0=C                                     * 678C3
        C=RSTK                                   * 678C6
        RSTK=C                                   * 678C8
        ?C>=A   A                                * 678CA
        GOYES   L_67890                          * 678CD
        A=R3                                     * 678CF
        GOTO    L_67907                          * 678D2

* refs (13): 461B4 662E6 663C7 66638 6A190 6E28A ...
OBJ_678D6:
        CON(5)  DupAndThen                       * 678D6  code object: the address of its machine code

* refs (20): 6627D 66296 66309 66824 66C68 6945E ...
OBJ_678DB:
        CON(5)  (*)+5                            * 678DB  primitive code object
        LC(2)   #1B                              * 678E0
L_678E4:
        R1=C                                     * 678E4
        GOSUB   SUB_67A4A                        * 678E7
        AD0EX                                    * 678EB
        C=0     A                                * 678EE
        C=R1.F  B                                * 678F0
        A=A+C   A                                * 678F6
        D0=A                                     * 678F8
        A=0     A                                * 678FB
        A=DAT0  X                                * 678FD
L_67901:
        C=R2                                     * 67901
        D0=C                                     * 67904
* a branch also enters #67908, where the nibbles decode as LC(7) #7431A01
L_67907:
        CD0EX                                    * 67907
* the rest of LC(7) #7431A01 at #67908
* a branch also enters #6790A, where the nibbles decode as R2=C
* a branch also enters #6790D, where the nibbles decode as D0=C
* a branch also enters #67910, where the nibbles decode as GOSUB #67918
        NIBHEX  10A1347                          * 6790A  ..C
* the rest of GOSUB #67918 at #67910
        NIBHEX  400                              * 67911  .
        GOTO    L_67790                          * 67914

* refs (8): 6675C 667B6 66901 66AFE 67910 68112 ...
SUB_67918:
        D=D-1   A                                * 67918
        GONC    L_67923                          * 6791A
        D=0     A                                * 6791D
        GOTO    L_6794A                          * 6791F
L_67923:
        LC(5)   #0002C                           * 67923
        ?C<=A   A                                * 6792A
        GOYES   L_6794A                          * 6792D
        A=A+A   A                                * 6792F
        C=A     A                                * 67931
        A=A+A   A                                * 67933
        A=A+A   A                                * 67935
        A=A+C   A                                * 67937
        LC(5)   BINT0                            * 67939
        A=A+C   A                                * 67940
        D1=D1-  5                                * 67942
        DAT1=A  A                                * 67945
        RTNCC                                    * 67948
L_6794A:
        R0=A                                     * 6794A
        C=R2                                     * 6794D
        D0=C                                     * 67950
        GOSBVL  SAVPTR                           * 67953
        GOSBVL  PUSH#                            * 6795A
        CD0EX                                    * 67961
        R2=C                                     * 67964
        RTNSC                                    * 67967
        RPL

* refs (2): 66DE9 6FEE6
OBJ_67969:
        ::                                       * 67969
          OBJ_6798C                              * 6796E
          DUP#0=                                 * 67973
          casedrpfls                             * 67978
          TRUE                                   * 6797D
        ;                                        * 67982

* refs (7): 44C91 44CFF 44D4F 65DCD 66142 6A19A ...
OBJ_67987:
        CON(5)  DupAndThen                       * 67987  code object: the address of its machine code

* refs (17): 65CD6 65CDB 65D1E 65D55 65EB3 65EB8 ...
OBJ_6798C:
        CON(5)  (*)+5                            * 6798C  primitive code object
        ASSEMBLE
        LC(2)   #1E                              * 67991
        ST=1    2                                * 67995
        GOTO    L_678E4                          * 67998

* refs (5): 66124 66665 6A1A4 6CD58 6E12C
OBJ_6799C:
        CON(5)  DupAndThen                       * 6799C  code object: the address of its machine code

* refs (15): 4B8FF 665A2 6661F 66642 66CC2 66CC7 ...
OBJ_679A1:
        CON(5)  (*)+5                            * 679A1  primitive code object
        LC(2)   #21                              * 679A6
        GOTO    L_678E4                          * 679AA

* refs (12): 65D28 66205 6635E 66548 66584 665E3 ...
OBJ_679AE:
        CON(5)  DupAndThen                       * 679AE  code object: the address of its machine code

* refs (23): 44D18 65D19 65DC8 66106 66129 6613D ...
OBJ_679B3:
        CON(5)  (*)+5                            * 679B3  primitive code object
        LC(2)   #24                              * 679B8
        GOTO    L_678E4                          * 679BC

* refs (1): 6F342
OBJ_679C0:
        CON(5)  DupAndThen                       * 679C0  code object: the address of its machine code

* refs (14): 44D72 65CCC 65DB9 66552 665DE 66CA4 ...
OBJ_679C5:
        CON(5)  (*)+5                            * 679C5  primitive code object
        LC(2)   #27                              * 679CA
        GOTO    L_678E4                          * 679CE

* refs (4): 66DD0 6F720 6FA3B 6FA5E
OBJ_679D2:
        CON(5)  DupAndThen                       * 679D2  code object: the address of its machine code

* refs (8): 461B9 6686A 6B7C7 6F5FE 6F630 6F6BC ...
OBJ_679D7:
        CON(5)  (*)+5                            * 679D7  primitive code object
        GOSUB   SUB_67A4A                        * 679DC
        A=0     A                                * 679E0
        A=DAT0  1                                * 679E2
        GOTO    L_67901                          * 679E6

* refs (10): 66DBC 68F80 68FCB 694C7 6E8E8 6E9BA ...
OBJ_679EA:
        CON(5)  (*)+5                            * 679EA  primitive code object
        GOSUB   SUB_67A4A                        * 679EF
        D1=D1-  5                                * 679F3
        D=D-1   A                                * 679F6
        A=DAT0  S                                * 679F8
        C=R2                                     * 679FC
        D0=C                                     * 679FF
        ?A=0    S                                * 67A02
        GOYES   L_67A11                          * 67A05
        LC(5)   FALSE                            * 67A07
        GONC    L_67A18                          * 67A0E
L_67A11:
        LC(5)   TRUE                             * 67A11
L_67A18:
        A=C     A                                * 67A18
        PC=(A)                                   * 67A1A

* refs (1): 6A005
OBJ_67A1E:
        CON(5)  (*)+5                            * 67A1E  primitive code object
        GOSUB   SUB_67A4A                        * 67A23
        D0=D0+  1                                * 67A27
        A=0     A                                * 67A2A
        A=DAT0  1                                * 67A2C
        LC(1)   #7                               * 67A30
        A=A&C   P                                * 67A33
        GOTO    L_67901                          * 67A37

* refs (5): 6A71D 6DF64 6DF85 6DFA4 6F0DF
SUB_67A3B:
        A=A+1   A                                * 67A3B

* refs (1): 6690E
SUB_67A3D:
        C=R2.F  A                                * 67A3D
        D0=C                                     * 67A43
        GOTO    SUB_67A51                        * 67A46

* refs (22): 668A1 66A0F 66B64 66BC9 678E7 679DC ...
SUB_67A4A:
        GOSBVL  POP#                             * 67A4A

* refs (6): 66737 67893 67A46 68323 6B3B2 6DF47
SUB_67A51:
        A=A-1   A                                * 67A51
        A=A+A   A                                * 67A53
        C=A     A                                * 67A55
        ASL     A                                * 67A57
        A=A+C   A                                * 67A59
        C=C+C   A                                * 67A5B
        C=C+C   A                                * 67A5D
        A=A+C   A                                * 67A5F
        LC(5)   ITEM1STATE                       * 67A61
        CD0EX                                    * 67A68
        R2=C.F  A                                * 67A6B
        C=DAT0  A                                * 67A71
        C=C+A   A                                * 67A74
        D0=C                                     * 67A76
        D0=D0+  10                               * 67A79
        RTN                                      * 67A7C

* refs (2): 66E07 67AFE
OBJ_67A7E:
        CON(5)  (*)+5                            * 67A7E  primitive code object
        LC(2)   #05                              * 67A83
        GOTO    L_678E4                          * 67A87

* refs (3): 66E1B 67B08 6FB18
OBJ_67A8B:
        CON(5)  (*)+5                            * 67A8B  primitive code object
        LC(2)   #02                              * 67A90
        GOTO    L_678E4                          * 67A94

* refs (5): 66988 66C90 66D99 67AC1 6CD71
OBJ_67A98:
        CON(5)  DupAndThen                       * 67A98  code object: the address of its machine code

* refs (7): 44D0E 44D1D 44D54 6B826 6CE0C 6D334 ...
OBJ_67A9D:
        CON(5)  (*)+5                            * 67A9D  primitive code object
        LC(2)   #11                              * 67AA2
        GOTO    L_678E4                          * 67AA6

* refs (7): 44C96 44D77 66688 6699C 66E48 6D24E ...
OBJ_67AAA:
        CON(5)  DupAndThen                       * 67AAA  code object: the address of its machine code

* refs (10): 6610B 6612E 66192 666B5 66C3B 67ACB ...
OBJ_67AAF:
        CON(5)  (*)+5                            * 67AAF  primitive code object
        LC(2)   #0E                              * 67AB4
        GOTO    L_678E4                          * 67AB8
        RPL

* refs (5): 65A0B 66C54 6AD25 6CE4D 6FB45
OBJ_67ABC:
        ::                                       * 67ABC
          OBJ_67A98                              * 67AC1
          SWAP                                   * 67AC6
          OBJ_67AAF                              * 67ACB
        ;                                        * 67AD0

* refs (5): 65D5A 66DFD 66E2F 6CD8A 6D3CA
OBJ_67AD5:
        CON(5)  (*)+5                            * 67AD5  primitive code object
        ASSEMBLE
        LC(2)   #0B                              * 67ADA
        GOTO    L_678E4                          * 67ADE

* refs (19): 44C73 44D9F 6614C 66557 66679 66692 ...
OBJ_67AE2:
        CON(5)  (*)+5                            * 67AE2  primitive code object
        LC(2)   #08                              * 67AE7
        GOTO    L_678E4                          * 67AEB

* refs (4): 44DC2 6AD16 6B7BD 6FAE6
OBJ_67AEF:
        CON(5)  DupAndThen                       * 67AEF  code object: the address of its machine code
        RPL

* refs (1): 6E7B2
OBJ_67AF4:
        ::                                       * 67AF4
          DUP                                    * 67AF9
          OBJ_67A7E                              * 67AFE
          SWAP                                   * 67B03
          OBJ_67A8B                              * 67B08
        ;                                        * 67B0D

* refs (11): 694D6 69FA1 6A2B2 6A32A 6AD02 6EA1E ...
OBJ_67B12:
        CON(5)  DupAndThen                       * 67B12  code object: the address of its machine code

* refs (6): 694A9 6AC71 6EC80 6F667 6F8E7 6FE91
OBJ_67B17:
        CON(5)  (*)+5                            * 67B17  primitive code object
        ASSEMBLE
        GOSUB   SUB_67A4A                        * 67B1C
        D0=D0+  12                               * 67B20
        D0=D0+  12                               * 67B23
        A=0     A                                * 67B26
        C=DAT0  X                                * 67B28
        A=C     X                                * 67B2C
        C=C+1   X                                * 67B2F
        GOC     L_67B48                          * 67B32
        C=A     X                                * 67B35
        C=C+C   X                                * 67B38
        GOC     L_67B4F                          * 67B3B
L_67B3E:
        C=R2                                     * 67B3E
        D0=C                                     * 67B41
        GOTO    L_67907                          * 67B44
L_67B48:
        A=0     A                                * 67B48
        A=A-1   A                                * 67B4A
        GOC     L_67B3E                          * 67B4C
L_67B4F:
        LC(3)   #7FF                             * 67B4F
        A=A&C   X                                * 67B54
        LC(5)   CMOS                             * 67B58
        A=A!C   A                                * 67B5F
        GOTO    L_67B3E                          * 67B63

* refs (1): 66D35
OBJ_67B67:
        CON(5)  (*)+5                            * 67B67  primitive code object
        LC(2)   #05                              * 67B6C
L_67B70:
        R1=C.F  B                                * 67B70
        GOSBVL  POP#                             * 67B76
L_67B7D:
        C=A     A                                * 67B7D
        RSTK=C                                   * 67B7F
        GOSUB   SUB_67A4A                        * 67B81
        AD0EX                                    * 67B85
        C=0     A                                * 67B88
        C=R1.F  B                                * 67B8A
        A=A+C   A                                * 67B90
        D0=A                                     * 67B92
        C=RSTK                                   * 67B95
        DAT0=C  X                                * 67B97
        GOLONG  L_685CD                          * 67B9B

* refs (1): 66D3A
OBJ_67BA1:
        CON(5)  (*)+5                            * 67BA1  primitive code object
        LC(2)   #02                              * 67BA6
        GOTO    L_67B70                          * 67BAA

* refs (4): 6CD80 6CE9D 6D348 6D657
OBJ_67BAE:
        CON(5)  (*)+5                            * 67BAE  primitive code object
        LC(2)   #11                              * 67BB3
        GOTO    L_67B70                          * 67BB7

* refs (4): 6619C 6CE98 6D267 6D316
OBJ_67BBB:
        CON(5)  (*)+5                            * 67BBB  primitive code object
        LC(2)   #0E                              * 67BC0
        GOTO    L_67B70                          * 67BC4

* refs (2): 6A640 6D541
OBJ_67BC8:
        CON(5)  (*)+5                            * 67BC8  primitive code object
        LC(2)   #1B                              * 67BCD
        GOTO    L_67B70                          * 67BD1

* refs (7): 65D7D 65DDC 65E68 65E9F 66322 663A4 ...
OBJ_67BD5:
        CON(5)  (*)+5                            * 67BD5  primitive code object
        LC(2)   #21                              * 67BDA
        GOTO    L_67B70                          * 67BDE

* refs (15): 65DE6 65E95 66214 662AA 66606 6A60E ...
OBJ_67BE2:
        CON(5)  (*)+5                            * 67BE2  primitive code object
        LC(2)   #1E                              * 67BE7
        GOTO    L_67B70                          * 67BEB

* refs (6): 65D6E 65E5E 66313 66395 6D230 6E9FB
OBJ_67BEF:
        CON(5)  (*)+5                            * 67BEF  primitive code object
        LC(2)   #24                              * 67BF4
        GOTO    L_67B70                          * 67BF8

* refs (17): 6623C 662A0 66368 663D1 665C0 66610 ...
OBJ_67BFC:
        CON(5)  (*)+5                            * 67BFC  primitive code object
        LC(2)   #27                              * 67C01
        GOTO    L_67B70                          * 67C05

* refs (5): 44D40 65D5F 67C32 6CD9E 6D352
OBJ_67C09:
        CON(5)  (*)+5                            * 67C09  primitive code object
        LC(2)   #0B                              * 67C0E
        GOTO    L_67B70                          * 67C12

* refs (6): 44C7D 44DA4 66561 67C2D 6D280 6E163
OBJ_67C16:
        CON(5)  (*)+5                            * 67C16  primitive code object
        LC(2)   #08                              * 67C1B
        GOTO    L_67B70                          * 67C1F
        RPL

* refs (3): 44E17 6CE75 6DBBB
OBJ_67C23:
        ::                                       * 67C23
          3PICKSWAP                              * 67C28
          OBJ_67C16                              * 67C2D
          OBJ_67C09                              * 67C32
        ;                                        * 67C37

* refs (11): 662D2 6953F 6A2E9 6A384 6CEBB 6D221 ...
OBJ_67C3C:
        CON(5)  (*)+5                            * 67C3C  primitive code object
        ASSEMBLE
        GOSUB   SUB_67C53                        * 67C41
        LC(2)   #18                              * 67C45
        R1=C.F  B                                * 67C49
        GOTO    L_67B7D                          * 67C4F

* refs (1): 67C41
SUB_67C53:
        GOSBVL  POP#                             * 67C53
        C=A     A                                * 67C5A
        C=C+C   A                                * 67C5C
        RTNNC                                    * 67C5E
        LC(3)   #800                             * 67C61
        A=A!C   X                                * 67C66
        RTN                                      * 67C6A
        RPL

* refs (3): 6B7DB 6FAF0 6FBFE
OBJ_67C6C:
        ::                                       * 67C6C
          OBJ_67519                              * 67C71
          #1-SWAP                                * 67C76
          #-PICK                                 * 67C7B
        ;                                        * 67C80

* refs (2): 6CDFD 6D212
OBJ_67C85:
        CON(5)  (*)+5                            * 67C85  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 67C8A
        ASRC                                     * 67C91
        GOSUB   SUB_67A4A                        * 67C94
L_67C98:
        DAT0=A  S                                * 67C98
        GOLONG  L_685CD                          * 67C9C

* refs (2): 66E70 6824F
OBJ_67CA2:
        CON(5)  (*)+5                            * 67CA2  primitive code object
        GOSUBL  SUB_67A4A                        * 67CA7
        D0=D0+  1                                * 67CAD
        A=DAT0  S                                * 67CB0
        A=A+A   S                                * 67CB4
        ASRB                                     * 67CB7
        GOTO    L_67C98                          * 67CBA

* refs (4): 69BF6 6B110 6B11A 6E767
OBJ_67CBE:
        CON(5)  (*)+5                            * 67CBE  primitive code object
        LC(5)   MENULEVEL                        * 67CC3
        CD0EX                                    * 67CCA
        RSTK=C                                   * 67CCD
        A=DAT0  A                                * 67CCF
        D0=(5)  ITEM1STATE                       * 67CD2
        C=DAT0  A                                * 67CD9
        D0=C                                     * 67CDC
        P=      15                               * 67CDF
        LC(1)   #7                               * 67CE1
        P=      0                                * 67CE4
        D0=D0+  11                               * 67CE6
L_67CE9:
        A=A-1   A                                * 67CE9
        GOC     L_67D07                          * 67CEB
        A=DAT0  S                                * 67CEE
        A=A&C   S                                * 67CF2
        DAT0=A  S                                * 67CF6
        D0=D0+  16                               * 67CFA
        D0=D0+  16                               * 67CFD
        D0=D0+  10                               * 67D00
        GOTO    L_67CE9                          * 67D03
L_67D07:
        C=RSTK                                   * 67D07
        GOLONG  L_6778D                          * 67D09

* refs (1): 6F9A5
OBJ_67D0F:
        CON(5)  (*)+5                            * 67D0F  primitive code object
        ST=0    0                                * 67D14
        GOTO    L_67D23                          * 67D17

* refs (2): 6C438 6F9C3
OBJ_67D1B:
        CON(5)  (*)+5                            * 67D1B  primitive code object
        ST=1    0                                * 67D20
L_67D23:
        GOSBVL  SAVPTR                           * 67D23
        D0=(5)  MENULEVEL                        * 67D2A
        B=0     A                                * 67D31
        C=DAT0  A                                * 67D33
        C=C-1   A                                * 67D36
        RSTK=C                                   * 67D38
        D0=(5)  ITEM1STATE                       * 67D3A
        C=DAT0  A                                * 67D41
        D0=C                                     * 67D44
        D0=D0+  10                               * 67D47
        C=0     X                                * 67D4A
        ?ST=1   0                                * 67D4D
        GOYES   L_67D55                          * 67D50
        C=C-1   X                                * 67D52
L_67D55:
        R2=C                                     * 67D55
L_67D58:
        B=B+1   A                                * 67D58
        A=DAT0  S                                * 67D5A
        D0=D0+  5                                * 67D5E
        ?A=0    S                                * 67D61
        GOYES   L_67D73                          * 67D64
        D0=D0+  15                               * 67D66
        D0=D0+  15                               * 67D69
        D0=D0+  7                                * 67D6C
        GOTO    L_67DBB                          * 67D6F
L_67D73:
        A=DAT0  X                                * 67D73
        D0=D0+  15                               * 67D77
        C=DAT0  B                                * 67D7A
        D=C     B                                * 67D7D
        D0=D0+  4                                * 67D80
        C=DAT0  X                                * 67D83
        D0=D0+  15                               * 67D87
        D0=D0+  3                                * 67D8A
        ?C=0    X                                * 67D8D
        GOYES   L_67DBB                          * 67D90
        D=D-1   B                                * 67D92
        GOC     L_67D9E                          * 67D95
        D=D-1   B                                * 67D98
        GOC     L_67DBB                          * 67D9B
L_67D9E:
        C=R2                                     * 67D9E
        ?ST=1   0                                * 67DA1
        GOYES   L_67DAE                          * 67DA4
        ?C<A    X                                * 67DA6
        GOYES   L_67DBB                          * 67DA9
        GONC    L_67DB3                          * 67DAB
L_67DAE:
        ?C>A    X                                * 67DAE
        GOYES   L_67DBB                          * 67DB1
L_67DB3:
        R2=A                                     * 67DB3
        C=B     A                                * 67DB6
        R0=C                                     * 67DB8
L_67DBB:
        C=RSTK                                   * 67DBB
        C=C-1   A                                * 67DBD
        GOC     L_67DC8                          * 67DBF
        RSTK=C                                   * 67DC2
        GOTO    L_67D58                          * 67DC4
L_67DC8:
        GOVLNG  PUSH#LOOP                        * 67DC8

* refs (2): 68D4B 6E753
OBJ_67DCF:
        CON(5)  (*)+5                            * 67DCF  primitive code object
        GOSUB   SUB_67E77                        * 67DD4
        D0=D0+  5                                * 67DD8
        GOTO    L_67E1B                          * 67DDB

* refs (13): 68891 688E1 68913 6904D 690CF 6943B ...
OBJ_67DDF:
        CON(5)  (*)+5                            * 67DDF  primitive code object
        GOSUB   SUB_67E77                        * 67DE4
        GOTO    L_67E1B                          * 67DE8

* refs (6): 6893B 690DE 69982 699D2 6E375 6E96A
OBJ_67DEC:
        CON(5)  (*)+5                            * 67DEC  primitive code object
        GOSUB   SUB_67E77                        * 67DF1
        D0=D0+  15                               * 67DF5
        GOTO    L_67E1B                          * 67DF8

* refs (2): 4B891 6E712
OBJ_67DFC:
        CON(5)  (*)+5                            * 67DFC  primitive code object
        GOSUB   SUB_67E77                        * 67E01
        D0=D0+  10                               * 67E05
        GOTO    L_67E1B                          * 67E08

* refs (13): 4B8E1 65CC7 65D0F 65DB4 661FB 662BE ...
OBJ_67E0C:
        CON(5)  (*)+5                            * 67E0C  primitive code object
        GOSUB   SUB_67E77                        * 67E11
        D0=D0+  15                               * 67E15
        D0=D0+  5                                * 67E18
L_67E1B:
        A=DAT0  A                                * 67E1B
        C=R2                                     * 67E1E
        D0=C                                     * 67E21
        D1=D1-  5                                * 67E24
        DAT1=A  A                                * 67E27
        A=DAT0  A                                * 67E2A
        D0=D0+  5                                * 67E2D
        PC=(A)                                   * 67E30

* refs (7): 65E36 6633B 6959E 69955 69AF9 6C05F ...
OBJ_67E34:
        CON(5)  DupAndThen                       * 67E34  code object: the address of its machine code

* refs (1): 6AA91
OBJ_67E39:
        CON(5)  (*)+5                            * 67E39  primitive code object
        GOSUB   SUB_67EB4                        * 67E3E
        GONC    L_67E1B                          * 67E42  always taken

* refs (1): 6C073
OBJ_67E45:
        CON(5)  (*)+5                            * 67E45  primitive code object
        GOSUB   SUB_67EB4                        * 67E4A
        D0=D0+  10                               * 67E4E
        GONC    L_67E1B                          * 67E51  always taken

* refs (6): 6F13A 6F2A7 6F31F 6F3CE 6F55E 6FF36
OBJ_67E54:
        CON(5)  (*)+5                            * 67E54  primitive code object
        GOSUB   SUB_67EB4                        * 67E59
        D0=D0+  15                               * 67E5D
        GOTO    L_67E1B                          * 67E60

* refs (12): 65E4A 66354 66381 6C069 6E253 6F180 ...
OBJ_67E64:
        CON(5)  (*)+5                            * 67E64  primitive code object
        GOSUB   SUB_67EB4                        * 67E69
        D0=D0+  10                               * 67E6D
        D0=D0+  10                               * 67E70
        GOTO    L_67E1B                          * 67E73

* refs (5): 67DD4 67DE4 67DF1 67E01 67E11
SUB_67E77:
        GOSUB   SUB_67E9E                        * 67E77

* refs (3): 677C8 67F4A 69670
SUB_67E7B:
        LC(5)   STACKNUM                         * 67E7B
        CD0EX                                    * 67E82
        RSTK=C                                   * 67E85
        C=DAT0  A                                * 67E87
        D0=(5)  KEYLIST                          * 67E8A
        A=DAT0  A                                * 67E91
        A=A-C   A                                * 67E94
        R3=A                                     * 67E96
        C=RSTK                                   * 67E99
        GONC    L_67ECC                          * 67E9B

* refs (4): 67E77 67EB1 67EB4 680EE
SUB_67E9E:
        ST=0    10                               * 67E9E
        D=D-1   A                                * 67EA1
        RTNNC                                    * 67EA3
        C=0     A                                * 67EA6
        C=C+1   A                                * 67EA8
        GOSBVL  SUB_6DDAB                        * 67EAA
        GOC     SUB_67E9E                        * 67EB1

* refs (4): 67E3E 67E4A 67E59 67E69
SUB_67EB4:
        GOSUB   SUB_67E9E                        * 67EB4

* refs (2): 67F14 67F3A
SUB_67EB8:
        GOSBVL  POP#                             * 67EB8
        R3=A                                     * 67EBF
        LC(5)   KEYLIST                          * 67EC2
        CD0EX                                    * 67EC9
L_67ECC:
        A=DAT0  A                                * 67ECC
        R0=A                                     * 67ECF
        D0=(5)  MENULEVEL                        * 67ED2
        A=DAT0  A                                * 67ED9
        R1=A                                     * 67EDC
        D0=C                                     * 67EDF
        A=R3                                     * 67EE2
        C=R0                                     * 67EE5
        C=C-A   A                                * 67EE8
        A=C     A                                * 67EEA
        GOSUBL  SUB_676C5                        * 67EEC
        C=R1                                     * 67EF2
        A=A+C   A                                * 67EF5
        GOSUBL  SUB_676C5                        * 67EF7
        R0=A                                     * 67EFD
        GOSUBL  SUB_675BE                        * 67F00
        D0=C                                     * 67F06
        RTN                                      * 67F09

* refs (6): 695A8 6995F 69B03 6F17B 6F47D 6F518
OBJ_67F0B:
        CON(5)  (*)+5                            * 67F0B  primitive code object
        GOSUB   SUB_67F24                        * 67F10
        GOSUB   SUB_67EB8                        * 67F14
L_67F18:
        C=R4                                     * 67F18
        DAT0=C  A                                * 67F1B
        GOLONG  L_685CD                          * 67F1E

* refs (2): 67F10 67F36
SUB_67F24:
        C=DAT1  A                                * 67F24
        R4=C                                     * 67F27
        D1=D1+  5                                * 67F2A
        D=D+1   A                                * 67F2D
        RTN                                      * 67F2F

* refs (5): 699F5 6F171 6F1FD 6F3E7 6F58B
OBJ_67F31:
        CON(5)  (*)+5                            * 67F31  primitive code object
        GOSUB   SUB_67F24                        * 67F36
        GOSUB   SUB_67EB8                        * 67F3A
        D0=D0+  15                               * 67F3E
        GOTO    L_67F18                          * 67F41

* refs (7): 688FF 68D64 68E36 690BB 695B7 6987E ...
OBJ_67F45:
        CON(5)  (*)+5                            * 67F45  primitive code object
        GOSUB   SUB_67E7B                        * 67F4A
        D0=D0+  15                               * 67F4E
        A=DAT0  A                                * 67F51
        D0=A                                     * 67F54
        A=DAT0  A                                * 67F57
        LC(5)   DOLIST                           * 67F5A
        ?C=A    A                                * 67F61
        GOYES   L_67F6A                          * 67F64
L_67F66:
        GOTO    L_67FE7                          * 67F66
L_67F6A:
        D0=D0+  5                                * 67F6A
        A=DAT0  A                                * 67F6D
        LC(5)   SEMI                             * 67F70
        ?C=A    A                                * 67F77
        GOYES   L_67F66                          * 67F7A
        AD0EX                                    * 67F7C
        R0=A                                     * 67F7F
        A=DAT0  A                                * 67F82
        LC(5)   DOBINT                           * 67F85
        ST=0    3                                * 67F8C
        ?C#A    A                                * 67F8F
        GOYES   L_67F97                          * 67F92
        ST=1    3                                * 67F94
L_67F97:
        A=R0                                     * 67F97
        D0=A                                     * 67F9A
        ?ST=1   3                                * 67F9D
        GOYES   L_67FA9                          * 67FA0
        GOSBVL  SKIPOB                           * 67FA2
L_67FA9:
        A=DAT0  A                                * 67FA9
        AD0EX                                    * 67FAC
        D0=D0+  5                                * 67FAF
        C=DAT0  A                                * 67FB2
        D0=A                                     * 67FB5
        A=C     A                                * 67FB8
        LC(5)   #0002C                           * 67FBA
        ?C<=A   A                                * 67FC1
        GOYES   L_68001                          * 67FC4
        CD1EX                                    * 67FC6
        R1=C                                     * 67FC9
        LA(5)   OBJ_67FED                        * 67FCC
        AD0EX                                    * 67FD6
        D1=(5)  #1+                              * 67FD9
        AD1EX                                    * 67FE0
        PC=(A)                                   * 67FE3
L_67FE7:
        GOLONG  L_685CD                          * 67FE7

* refs (1): 67FCC
OBJ_67FED:
        CON(5)  (*)+5                            * 67FED  primitive code object
        GOSUB   L_687F1+4                        * 67FF2
        GOTO    L_67907+1                        * 67FF6
        NIBHEX  13569EF                          * 67FFA  1eé
L_68001:
        C=R2                                     * 68001
        D0=C                                     * 68004
        LC(5)   #00106                           * 68007
        A=C     A                                * 6800E
        GOVLNG  Errjmp                           * 68010

* refs (1): 66E66
OBJ_68017:
        CON(5)  (*)+5                            * 68017  primitive code object
        D1=D1+  10                               * 6801C
        GOSUBL  SUB_67A4A                        * 6801F
        D1=D1-  15                               * 68025
        D0=D0+  2                                * 68028
        C=0     A                                * 6802B
        C=DAT0  X                                * 6802D
        ST=0    1                                * 68031
        ?C#0    A                                * 68034
        GOYES   L_6803C                          * 68037
        ST=1    1                                * 68039
L_6803C:
        RSTK=C                                   * 6803C
        GOSBVL  POP#                             * 6803E
        C=RSTK                                   * 68045
        CAEX    A                                * 68047
        R1=C                                     * 68049
        R4=A.F  A                                * 6804C
        GOSUB   SUB_680FB                        * 68052
        A=R4.F  A                                * 68056
        C=R1                                     * 6805C
        ST=0    2                                * 6805F
        ?C=A    A                                * 68062
        GOYES   L_6806E                          * 68065
        DAT0=C  X                                * 68067
        ST=1    2                                * 6806B
L_6806E:
        D0=D0+  3                                * 6806E
        D1=D1+  5                                * 68071
        C=0     A                                * 68074
        C=DAT0  X                                * 68076
        ?ST=0   1                                * 6807A
        GOYES   L_68087                          * 6807D
        ?C=0    A                                * 6807F
        GOYES   L_68087                          * 68082
        ST=0    1                                * 68084
L_68087:
        RSTK=C                                   * 68087
        GOSBVL  POP#                             * 68089
        C=RSTK                                   * 68090
        CAEX    A                                * 68092
        R1=C                                     * 68094
        R4=A.F  A                                * 68097
        GOSUB   SUB_680FB                        * 6809D
        A=R4.F  A                                * 680A1
        C=R1                                     * 680A7
        ?C#A    A                                * 680AA
        GOYES   L_680C9                          * 680AD
        ?ST=1   2                                * 680AF
        GOYES   L_680CD                          * 680B2

* refs (2): 680E6 680E9
drop;false;true_680B4:
        D1=D1+  10                               * 680B4
        D=D+1   A                                * 680B7
        D=D+1   A                                * 680B9
        LA(5)   SEMI                             * 680BB
        PC=(A)                                   * 680C5
L_680C9:
        DAT0=C  X                                * 680C9
L_680CD:
        D0=D0-  4                                * 680CD
        A=DAT0  S                                * 680D0
        A=A+A   S                                * 680D4
        GOC     L_680EE                          * 680D7
        D0=D0-  1                                * 680DA
        A=DAT0  S                                * 680DD
        ?A=0    S                                * 680E1
        GOYES   L_680E9                          * 680E4
        GONC    drop;false;true_680B4            * 680E6
L_680E9:
        ?ST=1   1                                * 680E9
        GOYES   drop;false;true_680B4            * 680EC
L_680EE:
        GOSUB   SUB_67E9E                        * 680EE
        D1=D1-  5                                * 680F2
        GOLONG  L_685CD                          * 680F5

* refs (6): 667A6 68052 6809D 68140 68159 6DE76
SUB_680FB:
        R3=A                                     * 680FB
        LC(5)   ITEM1STATE                       * 680FE
        CD0EX                                    * 68105
        A=DAT0  A                                * 68108
        C=C-A   A                                * 6810B
        CR3EX                                    * 6810D
        A=C     A                                * 68110
        GOSUBL  SUB_67918                        * 68112
        D0=(5)  ITEM1STATE                       * 68118
        A=DAT0  A                                * 6811F
        C=R3                                     * 68122
        A=A+C   A                                * 68125
        D0=A                                     * 68127
        RTN                                      * 6812A

* refs (1): 66D6C
OBJ_6812C:
        CON(5)  (*)+5                            * 6812C  primitive code object
        GOSUBL  SUB_67A4A                        * 68131
        D0=D0+  5                                * 68137
        A=0     A                                * 6813A
        A=DAT0  X                                * 6813C
        GOSUB   SUB_680FB                        * 68140
        AD0EX                                    * 68144
        LC(5)   #0001F                           * 68147
        A=A+C   A                                * 6814E
        D0=A                                     * 68150
        A=0     A                                * 68153
        A=DAT0  X                                * 68155
        GOSUB   SUB_680FB                        * 68159
        LC(5)   #00022                           * 6815D
        AD0EX                                    * 68164
        A=A-C   A                                * 68167
        D0=A                                     * 68169
        A=0     A                                * 6816C
        A=DAT0  X                                * 6816E
        D0=D0+  6                                * 68172
        C=0     A                                * 68175
        C=DAT0  X                                * 68177
        A=A+C   A                                * 6817B
        GOLONG  L_67901                          * 6817D

* refs (4): 65A83 67747 6A57D 6C814
OBJ_68183:
        CON(5)  (*)+5                            * 68183  primitive code object
        GOSBVL  POP#                             * 68188
        C=A     A                                * 6818F
        A=A+A   A                                * 68191
        A=A+A   A                                * 68193
L_68195:
        A=A+C   A                                * 68195
        GOLONG  L_67907                          * 68197

* refs (17): 19A57 65B9B 6604D 6C082 6D8C3 6DB3E ...
OBJ_6819D:
        CON(5)  (*)+5                            * 6819D  primitive code object
        GOSBVL  POP#                             * 681A2
        C=A     A                                * 681A9
        C=C+C   A                                * 681AB
        GOTO    L_68195                          * 681AD

* refs (5): 686B6 6A0AF 6A4AB 6C846 6C909
OBJ_681B1:
        CON(5)  (*)+5                            * 681B1  primitive code object
        LC(5)   ITEM1STATE                       * 681B6
L_681BD:
        A=DAT1  A                                * 681BD
        D1=D1+  5                                * 681C0
        D=D+1   A                                * 681C3
        CD0EX                                    * 681C5
        DAT0=A  A                                * 681C8
L_681CB:
        D0=C                                     * 681CB
        A=DAT0  A                                * 681CE
        D0=D0+  5                                * 681D1
        PC=(A)                                   * 681D4

* refs (4): 6B8DF 6C0DC 6C136 6C55F
OBJ_681D8:
        CON(5)  (*)+5                            * 681D8  primitive code object
        LC(5)   PAINTTREE                        * 681DD
        GOTO    L_681BD                          * 681E4

* refs (4): 68693 69FE2 6A091 6A456
OBJ_681E8:
        CON(5)  (*)+5                            * 681E8  primitive code object
        LC(5)   ITEM1STATE                       * 681ED
L_681F4:
        ST=0    10                               * 681F4
        R0=C                                     * 681F7
L_681FA:
        D=D-1   A                                * 681FA
        GONC    L_68209                          * 681FC
        GOSBVL  SUB_6DDAB                        * 681FF
        GOC     L_681FA                          * 68206
L_68209:
        D1=D1-  5                                * 68209
        C=R0                                     * 6820C
        CD0EX                                    * 6820F
        A=DAT0  A                                * 68212
        DAT1=A  A                                * 68215
        GOTO    L_681CB                          * 68218

* refs (4): 6B8BC 6C046 6C12C 6E83E
OBJ_6821C:
        CON(5)  (*)+5                            * 6821C  primitive code object
        LC(5)   PAINTTREE                        * 68221
        GOTO    L_681F4                          * 68228
        RPL

* refs (4): 6CE34 6D648 6DEEB 6E9EC
OBJ_6822C:
        ::                                       * 6822C
          DUP                                    * 68231
          BINT11                                 * 68236
          UNROLL                                 * 6823B
          OBJ_68277                              * 68240

* refs (11): 44E2B 4B90E 65CF6 65EEA 6626E 66598 ...
OBJ_68245:
          ::                                     * 68245
            SWAPDUP                              * 6824A
            OBJ_67CA2                            * 6824F
            OBJ_67519                            * 68254
            SWAP#-                               * 68259
            dup;drop(s)                          * 6825E
            #2-                                  * 68263
            UNROLL                               * 68268
          ;                                      * 6826D
        ;                                        * 68272

* refs (1): 68240
OBJ_68277:
        CON(5)  (*)+5                            * 68277  primitive code object
        ASSEMBLE
        ST=1    3                                * 6827C
        GOTO    L_682AE                          * 6827F
        RPL

* refs (3): 65F76 6CF10 6D5AA
OBJ_68283:
        ::                                       * 68283
          DUP                                    * 68288
          BINT18                                 * 6828D
          UNROLL                                 * 68292
          OBJ_682A6                              * 68297
          OBJ_68245                              * 6829C
        ;                                        * 682A1

* refs (1): 68297
OBJ_682A6:
        CON(5)  (*)+5                            * 682A6  primitive code object
        ASSEMBLE
        ST=0    3                                * 682AB
L_682AE:
        GOSUBL  SUB_67A4A                        * 682AE
        ST=0    4                                * 682B4
        GOSUB   SUB_68329                        * 682B7
        GOTO    L_685D3                          * 682BB
L_682BF:
        D0=C                                     * 682BF
        D0=D0-  5                                * 682C2
        LC(5)   OBJ_6867A                        * 682C5
        A=C     A                                * 682CC
        PC=(A)                                   * 682CE

* refs (10): 65C81 66232 664A8 6CF56 6D0C8 6D2DF ...
OBJ_682D2:
        CON(5)  (*)+5                            * 682D2  primitive code object
        ST=1    4                                * 682D7
        GOTO    L_682E6                          * 682DA

* refs (22): 65AD3 65B32 65B69 65BAF 65BDC 65D46 ...
OBJ_682DE:
        CON(5)  (*)+5                            * 682DE  primitive code object
        ST=0    4                                * 682E3
L_682E6:
        GOSUB   SUB_682F7                        * 682E6
        LC(5)   OBJ_6D4E2                        * 682EA
        A=C     A                                * 682F1
        PC=(A)                                   * 682F3

* refs (4): 682E6 6861D 6862C 6863B
SUB_682F7:
        ST=0    3                                * 682F7
        LC(5)   SAVECROSS                        * 682FA
        CD0EX                                    * 68301
        A=DAT0  A                                * 68304
        ?A=0    A                                * 68307
        GOYES   L_682BF                          * 6830A
        A=A-1   A                                * 6830C
        DAT0=A  A                                * 6830E
        D0=(5)  MENULEVEL                        * 68311
        A=DAT0  A                                * 68318
        A=A+1   A                                * 6831B
        DAT0=A  A                                * 6831D
        D0=C                                     * 68320
        GOSUBL  SUB_67A51                        * 68323

* refs (1): 682B7
SUB_68329:
        GOSBVL  POP#                             * 68329
        DAT0=A  1                                * 68330
        D0=D0+  1                                * 68334
        LC(5)   AppCount                         * 68337
        CD0EX                                    * 6833E
        A=DAT0  B                                * 68341
        D0=C                                     * 68344
        LC(1)   #7                               * 68347
        ?C>=A   P                                * 6834A
        GOYES   L_68352                          * 6834D
        A=C     P                                * 6834F
L_68352:
        DAT0=A  1                                * 68352
        D0=D0+  1                                * 68356
        P=      5                                * 68359
        GOSUB   SUB_683BB                        * 6835B
        A=DAT1  A                                * 6835F
        D1=D1+  5                                * 68362
        D=D+1   A                                * 68365
        R3=A.F  A                                * 68367
        GOSBVL  POP#                             * 6836D
        DAT0=A  B                                * 68374
        D0=D0+  2                                * 68377
        ?ST=1   3                                * 6837A
        GOYES   L_683A7                          * 6837D
        GOSBVL  POP#                             * 6837F
        D=D-1   A                                * 68386
        DAT0=A  B                                * 68388
        D0=D0+  2                                * 6838B
        P=      5                                * 6838E
        ?ST=0   4                                * 68390
        GOYES   L_68397                          * 68393
        P=      3                                * 68395
L_68397:
        GOSUB   SUB_683BB                        * 68397
        ?ST=0   4                                * 6839B
        GOYES   L_683A7                          * 6839E
        C=0     W                                * 683A0
        DAT0=C  6                                * 683A3
L_683A7:
        D1=D1-  5                                * 683A7
        A=R3.F  A                                * 683AA
        DAT1=A  A                                * 683B0
        C=R2                                     * 683B3
        D0=C                                     * 683B6
        RTN                                      * 683B9

* refs (3): 6835B 68397 683CB
SUB_683BB:
        GOSBVL  POP#                             * 683BB
        DAT0=A  X                                * 683C2
        D0=D0+  3                                * 683C6
        P=P-1                                    * 683C9
        GONC    SUB_683BB                        * 683CB
        P=      0                                * 683CE
        RTN                                      * 683D0

* refs (2): 668D6 6847C
SUB_683D2:
        LC(5)   L_683F8                          * 683D2

* refs (1): 684F8
SUB_683D9:
        CD1EX                                    * 683D9
        RSTK=C                                   * 683DC
        C=A     A                                * 683DE
        C=C+C   A                                * 683E0
        C=C+C   A                                * 683E2
        A=A+C   A                                * 683E4
        CD1EX                                    * 683E6
        C=C+A   A                                * 683E9
        D1=C                                     * 683EB
        A=DAT1  A                                * 683EE
        C=RSTK                                   * 683F1
        D1=C                                     * 683F3
        RTN                                      * 683F6

L_683F8:
        CON(5)  OBJ_65A29                        * 683F8  address (the code jumps or points through it)

        CON(5)  OBJ_44C3C                        * 683FD  address (the code jumps or points through it)

        CON(5)  OBJ_65A38                        * 68402  address (the code jumps or points through it)

        CON(5)  OBJ_44CFA                        * 68407  address (the code jumps or points through it)

        CON(5)  OBJ_44D4A                        * 6840C  address (the code jumps or points through it)

        CON(5)  OBJ_44C87                        * 68411  address (the code jumps or points through it)

        CON(5)  OBJ_44CC8                        * 68416  address (the code jumps or points through it)

        CON(5)  OBJ_66660                        * 6841B  address (the code jumps or points through it)

        CON(5)  OBJ_44D68                        * 68420  address (the code jumps or points through it)

L_68425:
        CON(5)  OBJ_65A06                        * 68425  address (the code jumps or points through it)

        CON(5)  OBJ_66C2C                        * 6842A  address (the code jumps or points through it)

        CON(5)  OBJ_66C4A                        * 6842F  address (the code jumps or points through it)

        CON(5)  OBJ_66C86                        * 68434  address (the code jumps or points through it)

        CON(5)  OBJ_66534                        * 68439  address (the code jumps or points through it)

        CON(5)  OBJ_66CB8                        * 6843E  address (the code jumps or points through it)

        CON(5)  OBJ_660FC                        * 68443  address (the code jumps or points through it)

        CON(5)  OBJ_6611A                        * 68448  address (the code jumps or points through it)

        CON(5)  DupAndThen                       * 6844D  address (the code jumps or points through it)

* refs (2): 6AABE 6D1CC
OBJ_68452:
        CON(5)  (*)+5                            * 68452  primitive code object
        GOSUB   SUB_6845F                        * 68457
        GOTO    L_685CD                          * 6845B

* refs (1): 68457
SUB_6845F:
        GOSUBL  SUB_67A4A                        * 6845F
        D0=D0+  10                               * 68465
        D0=D0+  10                               * 68468
        C=DAT0  B                                * 6846B
        C=C+1   B                                * 6846E
        GOC     L_6848A                          * 68471
        C=C-1   B                                * 68474
        A=0     A                                * 68477
        A=C     B                                * 68479
        GOSUB   SUB_683D2                        * 6847C
        D1=D1-  5                                * 68480
        DAT1=A  A                                * 68483
        D=D-1   A                                * 68486
        RTN                                      * 68488
L_6848A:
        C=R2                                     * 6848A
        D0=C                                     * 6848D
        LC(5)   #0002A                           * 68490
        BCEX    A                                * 68497
        RSTK=C                                   * 68499
        C=0     A                                * 6849B
L_6849D:
        A=A-B   A                                * 6849D
        GOC     L_684A7                          * 6849F
        C=C+1   A                                * 684A2
        GONC    L_6849D                          * 684A4
L_684A7:
        A=C     A                                * 684A7
        C=RSTK                                   * 684A9
        B=C     A                                * 684AB
        A=A+1   A                                * 684AD
        GOSBVL  SUB_67918                        * 684AF
        LC(5)   OBJ_6FE73                        * 684B6
L_684BD:
        A=C     A                                * 684BD
        PC=(A)                                   * 684BF
L_684C3:
        C=R2                                     * 684C3
        D0=C                                     * 684C6
        LC(5)   OBJ_6FE69                        * 684C9
        GOTO    L_684BD                          * 684D0

* refs (1): 669DD
OBJ_684D4:
        CON(5)  (*)+5                            * 684D4  primitive code object
        GOSBVL  POP#                             * 684D9
        C=A     A                                * 684E0
        C=C+1   A                                * 684E2
        GONC    L_684F1                          * 684E4
        LC(5)   OBJ_68500                        * 684E7
        GOC     L_684BD                          * 684EE
L_684F1:
        LC(5)   L_68425                          * 684F1
        GOSUB   SUB_683D9                        * 684F8
        PC=(A)                                   * 684FC
        RPL

* refs (1): 684E7
OBJ_68500:
        ::                                       * 68500
          OBJ_679AE                              * 68505
          OBJ_6FE78                              * 6850A
          OBJ_2708E                              * 6850F
          ?SKIP                                  * 68514
          ::                                     * 68519
            DROPDUP                              * 6851E
            OBJ_65D14                            * 68523
            OBJ_6FE78                            * 68528
            OBJ_2708E                            * 6852D
            DROP                                 * 68532
          ;                                      * 68537
          BINT6                                  * 6853C
          NTHCOMPDROP                            * 68541
          EVAL                                   * 68546
        ;                                        * 6854B

* refs (3): 66965 66979 6A186
OBJ_68550:
        CON(5)  DupAndThen                       * 68550  code object: the address of its machine code

        CON(5)  (*)+5                            * 68555  primitive code object
        ASSEMBLE
        GOSUBL  SUB_67A4A                        * 6855A
        D0=D0+  10                               * 68560
        D0=D0+  12                               * 68563
        A=0     A                                * 68566
        A=DAT0  B                                * 68568
        GOSUB   SUB_68573                        * 6856B
        GOTO    L_685CD                          * 6856F

* refs (2): 66A34 6856B
SUB_68573:
        A=A+1   B                                * 68573
        GONC    L_6858A                          * 68576
        LC(5)   MINUSONE                         * 68579
        D1=D1-  5                                * 68580
        DAT1=C  A                                * 68583
        D=D-1   A                                * 68586
        RTN                                      * 68588
L_6858A:
        A=A-1   B                                * 6858A
        GOLONG  SUB_67918                        * 6858D

* refs (6): 4B8EB 665BB 66624 6DBD4 6E154 6F45F
OBJ_68593:
        CON(5)  (*)+5                            * 68593  primitive code object
        GOSUBL  SUB_67A4A                        * 68598
        GOSBVL  POP#                             * 6859E
        D0=D0+  10                               * 685A5
        D0=D0+  10                               * 685A8
        DAT0=A  B                                * 685AB
        GOTO    L_685CD                          * 685AE

* refs (2): 6A3B1 6CE43
OBJ_685B2:
        CON(5)  (*)+5                            * 685B2  primitive code object
        GOSUBL  SUB_67A4A                        * 685B7
        GOSBVL  POP#                             * 685BD
        D0=D0+  10                               * 685C4
        D0=D0+  12                               * 685C7
        DAT0=A  B                                * 685CA
L_685CD:
        C=R2                                     * 685CD
        D0=C                                     * 685D0
L_685D3:
        A=DAT0  A                                * 685D3
        D0=D0+  5                                * 685D6
        PC=(A)                                   * 685D9

* refs (1): 6D4D3
OBJ_685DD:
        CON(5)  (*)+5                            * 685DD  primitive code object
        LC(5)   SAVECROSS                        * 685E2
        CD0EX                                    * 685E9
        A=DAT0  A                                * 685EC
        D0=C                                     * 685EF
        A=A-CON A,3                              * 685F2
        GOC     L_685FF                          * 685F8
        GOTO    L_685D3                          * 685FB
L_685FF:
        LC(5)   OBJ_6867A                        * 685FF
        GOTO    L_684BD                          * 68606

* refs (1): 6D4D8
OBJ_6860A:
        CON(5)  (*)+5                            * 6860A  primitive code object
        ST=0    4                                * 6860F
        LC(5)   #000A0                           * 68612
        GOSUB   SUB_68670                        * 68619
        GOSUB   SUB_682F7                        * 6861D
        LC(5)   #FFF65                           * 68621
        GOSUB   SUB_68670                        * 68628
        GOSUB   SUB_682F7                        * 6862C
        LC(5)   #FFF65                           * 68630
        GOSUB   SUB_68670                        * 68637
        GOSUB   SUB_682F7                        * 6863B
        C=DAT1  A                                * 6863F
        RSTK=C                                   * 68642
        LC(5)   #00050                           * 68644
        GOSUB   SUB_68670                        * 6864B
        C=DAT1  A                                * 6864F
        RSTK=C                                   * 68652
        LC(5)   #0004B                           * 68654
        GOSUB   SUB_68670                        * 6865B
        C=RSTK                                   * 6865F
        DAT1=C  A                                * 68661
        D1=D1-  5                                * 68664
        C=RSTK                                   * 68667
        DAT1=C  A                                * 68669
        GOTO    L_685D3                          * 6866C

* refs (5): 68619 68628 68637 6864B 6865B
SUB_68670:
        AD1EX                                    * 68670
        A=A+C   A                                * 68673
        D1=A                                     * 68675
        RTN                                      * 68678
        RPL

* refs (2): 682C5 685FF
OBJ_6867A:
        ::                                       * 6867A
          OBJ_673A2                              * 6867F
          BINT20                                 * 68684
          #+                                     * 68689
          OBJ_67458                              * 6868E
          OBJ_681E8                              * 68693
          BINT20                                 * 68698

* refs (4): 6A0A0 6A46F 6A492 6C83C
OBJ_6869D:
          ::                                     * 6869D
            BINT42                               * 686A2
            #*                                   * 686A7
          ;                                      * 686AC
          EXPAND                                 * 686B1
          OBJ_681B1                              * 686B6
        ;                                        * 686BB

* refs (4): 69237 6B88A 6BC0F 6C0EB
OBJ_686C0:
        ::                                       * 686C0
          OBJ_4DA58                              * 686C5
          18PUTLAM                               * 686CA

* refs (1): 6892C
OBJ_686CF:
          ::                                     * 686CF
            BEGIN                                * 686D4
            ?ATTNQUIT                            * 686D9
            OBJ_68701                            * 686DE
            AGAIN                                * 686E3
          ;                                      * 686E8
          DROP                                   * 686ED
          5UNROLL                                * 686F2
          OBJ_2840F                              * 686F7
        ;                                        * 686FC

* refs (1): 686DE
OBJ_68701:
        ::                                       * 68701
          OBJ_69A31                              * 68706
          OBJ_6979D                              * 6870B
          OBJ_69323                              * 68710
          OBJ_688C3                              * 68715
          8GETLAM                                * 6871A
          nultrior                               * 6871F

* refs (1): 697B6
OBJ_68724:
          ::                                     * 68724
            DROP                                 * 68729
            2RDROP                               * 6872E
            7GETLAM                              * 68733
            OBJ_6BC03                            * 68738
            EQ                                   * 6873D
            case                                 * 68742
            OBJ_68873                            * 68747
            OBJ_688EB                            * 6874C
          ;                                      * 68751
          TRUE                                   * 68756
          18PUTLAM                               * 6875B
          tok'                                   * 68760
          tok=casedrop                           * 68765
          OBJ_69020                              * 6876A
          OBJ_68B3E                              * 6876F
          casedrop                               * 68774
          ::                                     * 68779
            2RDROP                               * 6877E
            5ROLL                                * 68783
            6ROLL                                * 68788
          ;                                      * 6878D
          ?SEMI                                  * 68792
          DROPZERO                               * 68797
          OBJ_283F1                              * 6879C
          OBJ_25D03                              * 687A1
          case                                   * 687A6
          ::                                     * 687AB
            case                                 * 687B0
            OBJ_68E45                            * 687B5
            COLA                                 * 687BA
            OBJ_687FB                            * 687BF
          ;                                      * 687C4
          ngsizecase                             * 687C9
          OBJ_687FB                              * 687CE
          OBJ_24609                              * 687D3
          !*trior                                * 687D8
          OBJ_68E45                              * 687DD
          SWAP                                   * 687E2
          COMPILEID                              * 687E7
          ROT                                    * 687EC
L_687F1:
          ORNOT                                  * 687F1
          casedrop                               * 687F6

* refs (3): 687BF 687CE 68823
OBJ_687FB:
          ::                                     * 687FB
            5ROLLDROP                            * 68800
            COLA                                 * 68805
            OBJ_697CA                            * 6880A
          ;                                      * 6880F
          OBJ_274D1                              * 68814
          OBJ_6E026                              * 68819
          NOTcasedrop                            * 6881E
          OBJ_687FB                              * 68823
          OBJ_26BED                              * 68828
          NOTcase                                * 6882D
          ::                                     * 68832
            OBJ_24681                            * 68837
            2DROP                                * 6883C
            COLA                                 * 68841
            OBJ_68E45                            * 68846
          ;                                      * 6884B
          8UNROLL                                * 68850
          8UNROLL                                * 68855
          8UNROLL                                * 6885A
          5DROP                                  * 6885F
          COLA                                   * 68864
          OBJ_68CF6                              * 68869
        ;                                        * 6886E

* refs (2): 68747 68B20
OBJ_68873:
        ::                                       * 68873
          OBJ_69147                              * 68878
          OBJ_27797                              * 6887D
          OBJ_69495                              * 68882
          OBJ_28602                              * 68887
          BEGIN                                  * 6888C
          OBJ_67DDF                              * 68891
          #0=                                    * 68896
          WHILE                                  * 6889B
          ::                                     * 688A0
            OBJ_283F1                            * 688A5
            DROP                                 * 688AA
            tokrparen                            * 688AF
            DUP                                  * 688B4
            OBJ_6934B                            * 688B9
            OBJ_2840F                            * 688BE

* refs (3): 68715 68B0C 69057
OBJ_688C3:
            ::                                   * 688C3
              OBJ_690C0                          * 688C8
              OBJ_285EE                          * 688CD
            ;                                    * 688D2
          ;                                      * 688D7
          REPEAT                                 * 688DC
          OBJ_67DDF                              * 688E1
          #1=case                                * 688E6

* refs (3): 6874C 6894A 68968
OBJ_688EB:
          ::                                     * 688EB
            OBJ_283F1                            * 688F0
            TrueTrue                             * 688F5
          ;                                      * 688FA
          OBJ_67F45                              * 688FF
          OBJ_69941                              * 68904
          OBJ_672E6                              * 68909
          #1=                                    * 6890E
          OBJ_67DDF                              * 68913
          BINT4                                  * 68918
          #=                                     * 6891D
          AND                                    * 68922
          NOTcase                                * 68927
          OBJ_686CF                              * 6892C
          OBJ_69594                              * 68931
          OBJ_285EE                              * 68936
          OBJ_67DEC                              * 6893B
          OBJ_69188                              * 68940
          EQcasedrop                             * 68945
          OBJ_688EB                              * 6894A
          OBJ_676D4                              * 6894F
          OBJ_67416                              * 68954
          OBJ_679A1                              * 68959
          OBJ_67448                              * 6895E
          OBJ_69495                              * 68963
          OBJ_688EB                              * 68968
        ;                                        * 6896D

* refs (2): 6C4BF 8D3F5
OBJ_68972:
        ::                                       * 68972
          TRUE                                   * 68977
          BINT33                                 * 6897C
          PUTLAM                                 * 68981
          FALSE                                  * 68986
          SWAP                                   * 6898B
          OBJ_28B41                              * 68990
          ZERO_DO                                * 68995
          ?ATTNQUIT                              * 6899A
          OBJ_68BE3                              * 6899F
          ::                                     * 689A4
            '                                    * 689A9
            x=                                   * 689AE
            EQcasedrop                           * 689B3
            ::                                   * 689B8
              OBJ_698CE                          * 689BD
              DUP                                * 689C2
              NOT?SEMI                           * 689C7
              6DROP                              * 689CC
              SYNTAXERR                          * 689D1
            ;                                    * 689D6
            DUP                                  * 689DB
            OBJ_6F8AB                            * 689E0
            caseDROP                             * 689E5
            tokuscore                            * 689EA
            EQcasedrop                           * 689EF
            OBJ_68CE2                            * 689F4
            DUPTYPECSTR?                         * 689F9
            case                                 * 689FE
            ::                                   * 68A03
              OBJ_68B3E                          * 68A08
              DROP                               * 68A0D
              ?SEMI                              * 68A12
              $>ID                               * 68A17
              OBJ_68AC1                          * 68A1C
            ;                                    * 68A21
            DUPTYPECHAR?                         * 68A26
            case                                 * 68A2B
            ::                                   * 68A30
              CHR>$                              * 68A35
              OBJ_68BE3                          * 68A3A
              &$                                 * 68A3F
              ISTOP-INDEX                        * 68A44
              #1-                                * 68A49
              UNROLL                             * 68A4E
            ;                                    * 68A53
            DUPTYPECMP?                          * 68A58
            case                                 * 68A5D
            OBJ_68C47                            * 68A62
            DUPTYPEREAL?                         * 68A67
            case                                 * 68A6C
            ::                                   * 68A71
              DUP                                * 68A76
              %0<                                * 68A7B
              case                               * 68A80
              OBJ_68C06                          * 68A85
              OBJ_68AC1                          * 68A8A
            ;                                    * 68A8F
            DUPTYPEIDNT?                         * 68A94
            case                                 * 68A99
            OBJ_68AC1                            * 68A9E
            OBJ_274D1                            * 68AA3
            OBJ_26BED                            * 68AA8
            case                                 * 68AAD
            OBJ_68CF6                            * 68AB2
            DUPTYPEROMP?                         * 68AB7
            NOTcase                              * 68ABC

* refs (4): 68A1C 68A8A 68A9E 68AE4
OBJ_68AC1:
            ::                                   * 68AC1
              OBJ_285EE                          * 68AC6
              OBJ_676CF                          * 68ACB
              OBJ_6DE96                          * 68AD0
            ;                                    * 68AD5
            DUPROMPTR@                           * 68ADA
            casedrop                             * 68ADF
            OBJ_68AC1                            * 68AE4
            BINT4                                * 68AE9
            ERROROUT                             * 68AEE
          ;                                      * 68AF3

* refs (2): 68BCF 68BFC
OBJ_68AF8:
          ::                                     * 68AF8
            OBJ_69A31                            * 68AFD
            OBJ_68BD9                            * 68B02
            OBJ_68BB6                            * 68B07
            OBJ_688C3                            * 68B0C
            NOP                                  * 68B11
          ;                                      * 68B16
          LOOP                                   * 68B1B
          OBJ_68873                              * 68B20
          6DROP                                  * 68B25
          FALSE                                  * 68B2A
          BINT33                                 * 68B2F
          PUTLAM                                 * 68B34
        ;                                        * 68B39

* refs (2): 6876F 68A08
OBJ_68B3E:
        ::                                       * 68B3E
          TrueFalse                              * 68B43
          ROT                                    * 68B48
          NoDecSep                               * 68B4D
          tok=casedrop                           * 68B52
          OBJ_6940E                              * 68B57
          toklparen                              * 68B5C
          tok=casedrop                           * 68B61
          OBJ_69142                              * 68B66
          tokrparen                              * 68B6B
          tok=casedrop                           * 68B70
          OBJ_69002                              * 68B75
          tok;                                   * 68B7A
          tok=casedrop                           * 68B7F
          OBJ_6940E                              * 68B84
          tok=                                   * 68B89
          tok=casedrop                           * 68B8E
          OBJ_698CE                              * 68B93
          tokanglesign                           * 68B98
          tok=casedrop                           * 68B9D
          OBJ_699B4                              * 68BA2
          ROTROT2DROP                            * 68BA7
          FalseFalse                             * 68BAC
        ;                                        * 68BB1

* refs (1): 68B07
OBJ_68BB6:
        ::                                       * 68BB6
          OBJ_68BE3                              * 68BBB
          2DROP                                  * 68BC0
          OBJ_6EEC4                              * 68BC5
          OBJ_69941                              * 68BCA
          OBJ_68AF8                              * 68BCF
        ;                                        * 68BD4

* refs (1): 68B02
OBJ_68BD9:
        ::                                       * 68BD9
          OBJ_6EEC4                              * 68BDE

* refs (4): 6899F 68A3A 68BBB 69106
OBJ_68BE3:
          ::                                     * 68BE3
            ISTOP-INDEX                          * 68BE8
            ROLL                                 * 68BED
          ;                                      * 68BF2
          OBJ_6986F                              * 68BF7
          OBJ_68AF8                              * 68BFC
        ;                                        * 68C01

* refs (1): 68A85
OBJ_68C06:
        ::                                       * 68C06
          %CHS                                   * 68C0B
          OBJ_68C7E                              * 68C10
          '                                      * 68C15
          xNEG                                   * 68C1A

* refs (3): 68C51 68C60 68C79
OBJ_68C1F:
          ::                                     * 68C1F
            ISTOP-INDEX                          * 68C24
            #1+UNROLL                            * 68C29
          ;                                      * 68C2E
          ISTOP@                                 * 68C33
          #2+                                    * 68C38
          ISTOPSTO                               * 68C3D
        ;                                        * 68C42

* refs (1): 68A62
OBJ_68C47:
        ::                                       * 68C47
          toklparen                              * 68C4C
          OBJ_68C1F                              * 68C51
          v->(c)                                 * 68C56
          SWAP                                   * 68C5B
          OBJ_68C1F                              * 68C60
          DPRADIX?                               * 68C65
          tok,                                   * 68C6A
          tok;                                   * 68C6F
          RPITE                                  * 68C74
          OBJ_68C1F                              * 68C79

* refs (2): 68C10 68C97
OBJ_68C7E:
          ::                                     * 68C7E
            ISTOP-INDEX                          * 68C83
            UNROLL                               * 68C88
          ;                                      * 68C8D
          tokrparen                              * 68C92
          OBJ_68C7E                              * 68C97
          ISTOP@                                 * 68C9C
          #5+                                    * 68CA1
          ISTOPSTO                               * 68CA6
          BINT16                                 * 68CAB
          TestSysFlag                            * 68CB0
          NOT?SEMI                               * 68CB5
          tokanglesign                           * 68CBA
          ISTOP-INDEX                            * 68CBF
          #3-                                    * 68CC4
          UNROLL                                 * 68CC9
          ISTOP@                                 * 68CCE
          #1+                                    * 68CD3
          ISTOPSTO                               * 68CD8
        ;                                        * 68CDD

* refs (1): 689F4
OBJ_68CE2:
        ::                                       * 68CE2
          OBJ_6BC91                              * 68CE7
          #72109h                                * 68CEC
          BINT2                                  * 68CF1

* refs (2): 68869 68AB2
OBJ_68CF6:
          ::                                     * 68CF6
            OBJ_6EE65                            * 68CFB
            6PUTLAM                              * 68D00
            SWAP                                 * 68D05
            5PUTLAM                              * 68D0A
            DUP4PUTLAM                           * 68D0F
            OBJ_26E61                            * 68D14
            DROP                                 * 68D19
            7PUTLAM                              * 68D1E
            2PUTLAM                              * 68D23
            NOTcase                              * 68D28
            OBJ_68E90                            * 68D2D
            OBJ_69147                            * 68D32
            ::                                   * 68D37
              2RDROP                             * 68D3C
              OBJ_27797                          * 68D41
            ;                                    * 68D46
L_68D4B:
            OBJ_67DCF                            * 68D4B
            2GETLAM                              * 68D50
            #<                                   * 68D55
            ?GOTO                                * 68D5A
            L_68D78                              * 68D5F
            OBJ_67F45                            * 68D64
            OBJ_690C0                            * 68D69
            GOTO                                 * 68D6E
            L_68D4B                              * 68D73
L_68D78:
            BINT2                                * 68D78
            5GETLAM                              * 68D7D
            OBJ_6E2D0                            * 68D82
            BINT3                                * 68D87
            3PUTLAM                              * 68D8C
            OBJ_69495                            * 68D91
            5GETLAM                              * 68D96

* refs (1): 68EC2
OBJ_68D9B:
            ::                                   * 68D9B
              BINT33                             * 68DA0
              GETLAM                             * 68DA5
              NOTcase                            * 68DAA
              8GETLAM                            * 68DAF
              DUP                                * 68DB4
              ->StrExpr(_)                       * 68DB9
            ;                                    * 68DBE
            DUPLEN$                              * 68DC3
            #>1                                  * 68DC8
            IT                                   * 68DCD
            ::                                   * 68DD2
              SPACE$                             * 68DD7
              DUPROT                             * 68DDC
              &$                                 * 68DE1
              SWAP&$                             * 68DE6
            ;                                    * 68DEB
            OBJ_6D62A                            * 68DF0
            DUP                                  * 68DF5
            OBJ_2708E                            * 68DFA
            ITE                                  * 68DFF
            EVAL                                 * 68E04
            ::                                   * 68E09
              DROP                               * 68E0E
              OBJ_6CCCC                          * 68E13
            ;                                    * 68E18
            OBJ_6DF1D                            * 68E1D
            OBJ_67448                            * 68E22
            DUP                                  * 68E27
            OBJ_6681A                            * 68E2C
            OBJ_68EEF                            * 68E31
            OBJ_67F45                            * 68E36
          ;                                      * 68E3B
        ;                                        * 68E40

* refs (3): 687B5 687DD 68846
OBJ_68E45:
        ::                                       * 68E45
          OBJ_69147                              * 68E4A
          ::                                     * 68E4F
            OBJ_285EE                            * 68E54
            OBJ_69824                            * 68E59
            8GETLAM                              * 68E5E
            OBJ_6D62A                            * 68E63
            OBJ_2840F                            * 68E68
            DROPDUP                              * 68E6D
            OBJ_676D4                            * 68E72
            OBJ_6DEAA                            * 68E77
          ;                                      * 68E7C
          6DROP                                  * 68E81
          OBJ_691E7                              * 68E86
        ;                                        * 68E8B

* refs (1): 68D2D
OBJ_68E90:
        ::                                       * 68E90
          OBJ_4EC49                              * 68E95
          NOTcase                                * 68E9A
          OBJ_691E7                              * 68E9F
          BINT2                                  * 68EA4
          3PUTLAM                                * 68EA9
          5GETLAM                                * 68EAE
          BINT1                                  * 68EB3
          OVER                                   * 68EB8
          OBJ_6E2D0                              * 68EBD
          OBJ_68D9B                              * 68EC2
          OBJ_6D62A                              * 68EC7
          OBJ_2708E                              * 68ECC
          ?SKIP                                  * 68ED1
          OBJ_6E311                              * 68ED6
          EVAL                                   * 68EDB
          OVER                                   * 68EE0
          OBJ_6681A                              * 68EE5
          OBJ_67448                              * 68EEA

* refs (2): 68E31 69319
OBJ_68EEF:
          ::                                     * 68EEF
            5GETLAM                              * 68EF4
            dup;#nm?                             * 68EF9
            NOT                                  * 68EFE
            OVER                                 * 68F03
            TYPEROMP?                            * 68F08
            OR                                   * 68F0D
            ITE                                  * 68F12
            ::                                   * 68F17
              BINT0                              * 68F1C
              '                                  * 68F21
              xFCNAPPLY                          * 68F26
              THREE{}N                           * 68F2B
            ;                                    * 68F30
            ::                                   * 68F35
              6GETLAM                            * 68F3A
              NOT?SEMI                           * 68F3F
              ZEROSWAP                           * 68F44
              TWO{}N                             * 68F49
            ;                                    * 68F4E
            4GETLAM                              * 68F53
            7GETLAM                              * 68F58
            3GETLAM                              * 68F5D
            OBJ_67532                            * 68F62
            OBJ_69020                            * 68F67
            OBJ_28602                            * 68F6C
          ;                                      * 68F71
        ;                                        * 68F76

* refs (5): 68FDA 694FE 6A1B3 6EC58 6F392
OBJ_68F7B:
        ::                                       * 68F7B
          OBJ_679EA                              * 68F80
          case                                   * 68F85
          DUP                                    * 68F8A
          DUPDUP                                 * 68F8F
          OBJ_6A75D                              * 68F94
          #MAX                                   * 68F99
          OVER                                   * 68F9E
          OBJ_6A705                              * 68FA3
          ROTOVER                                * 68FA8
          #=                                     * 68FAD
          IT                                     * 68FB2
          OBJ_679B3                              * 68FB7
          DUP                                    * 68FBC
          BEGIN                                  * 68FC1
          DUP                                    * 68FC6
          OBJ_679EA                              * 68FCB
          ITE                                    * 68FD0
          DUP                                    * 68FD5
          OBJ_68F7B                              * 68FDA
          4ROLL                                  * 68FDF
          #MIN                                   * 68FE4
          SWAP4ROLL                              * 68FE9
          #MAX                                   * 68FEE
          SWAPROT                                * 68FF3
          OBJ_6FEE1                              * 68FF8
        ;                                        * 68FFD

* refs (1): 68B75
OBJ_69002:
        ::                                       * 69002
          OBJ_698D3                              * 69007
          BINT5                                  * 6900C
          OBJ_69659                              * 69011
          OBJ_698FB                              * 69016
          OBJ_698FB                              * 6901B

* refs (7): 6876A 68F67 6917E 6942C 69919 699E6 ...
OBJ_69020:
          ::                                     * 69020
            OBJ_283F1                            * 69025
            DROP                                 * 6902A
            GetNextToken                         * 6902F
            OBJ_69824                            * 69034
            OBJ_2840F                            * 69039
          ;                                      * 6903E

* refs (1): 69061
OBJ_69043:
          ::                                     * 69043
            RDROP                                * 69048
            OBJ_67DDF                            * 6904D
            #0=case                              * 69052
            OBJ_688C3                            * 69057
            OBJ_69098                            * 6905C
            OBJ_69043                            * 69061
            OBJ_69941                            * 69066
            OBJ_69553                            * 6906B
            2DROP                                * 69070
            BINT5                                * 69075
            #=?SKIP                              * 6907A
            OBJ_6994B                            * 6907F
            OBJ_6996E                            * 69084
            OBJ_69996                            * 69089
          ;                                      * 6908E
        ;                                        * 69093

* refs (3): 6905C 6948B 69932
OBJ_69098:
        ::                                       * 69098
          'R                                     * 6909D
          OBJ_69553                              * 690A2
          NOT?GOTO                               * 690A7
          OBJ_690C0                              * 690AC
          SWAPDROP                               * 690B1
          caseDROP                               * 690B6
          OBJ_67F45                              * 690BB

* refs (3): 688C8 68D69 690AC
OBJ_690C0:
          ::                                     * 690C0
            OBJ_6996E                            * 690C5
            OBJ_69495                            * 690CA
            OBJ_67DDF                            * 690CF
            #0=?SKIP                             * 690D4
            ::                                   * 690D9
              OBJ_67DEC                          * 690DE
              ::                                 * 690E3
                DUPTYPELIST?                     * 690E8
                NOTcase                          * 690ED
                OBJ_676D4                        * 690F2
                INNERCOMP                        * 690F7

* refs (1): 6A109
OBJ_690FC:
                ::                               * 690FC
                  ZERO_DO                        * 69101
                  OBJ_68BE3                      * 69106
                  OBJ_676D4                      * 6910B
                  LOOP                           * 69110
                ;                                * 69115
              ;                                  * 6911A
            ;                                    * 6911F
            OBJ_67E0C                            * 69124
            OBJ_67448                            * 69129
            OBJ_674BB                            * 6912E
          ;                                      * 69133
          COLA_EVAL                              * 69138
        ;                                        * 6913D
