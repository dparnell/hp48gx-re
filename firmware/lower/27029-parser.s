* HP 48GX ROM revision R, #27029-#2A001: Parser and compiler
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PACK tok=casedrop GetGNTData PutGNTData POP1% NOTROMPcase drop;dq true;1Lput #1-UNROT COLAskipcola 3SKIP NoDecSep
* Follows on from the previous file (at #27029 in the original ROM).
        A=C     A                                * 27029
        PC=(A)                                   * 2702B

* refs (1): 26FDA
SUB_2702F:
        P=      4                                * 2702F
        A=0     P                                * 27031
        C=C-1   S                                * 27034
        GOC     L_27048                          * 27037
L_2703A:
        C=0     P                                * 2703A
        C=C+C   A                                * 2703D
        A=A+C   P                                * 2703F
        C=C-1   S                                * 27042
        GONC    L_2703A                          * 27045
L_27048:
        C=A     P                                * 27048
        P=C     4                                * 2704B
        CPEX    15                               * 2704F
        P=      3                                * 27053
        C=C+C   P                                * 27055
        P=      0                                * 27058
        RTN                                      * 2705A
        RPL

* refs (1): 27022
OBJ_2705C:
        :: ?ACCPTR> NOTROMPcase TRUE             * 2705C
          OBJ_29202 FALSE SWAPDROP ?ACCPTR> TRUE ; * 27070

* refs (10): 4ABE4 6850F 6852D 68DFA 68ECC 6DEAF ...
OBJ_2708E:
        :: CK&DISPATCH0                          * 2708E
          BINT8 OBJ_270BB                        * 27098  program
          BINT15 OBJ_270D9                       * 270A2  romptr
          BINT0 FALSE                            * 270AC  any
        ;                                        * 270B6

* refs (1): 2709D
OBJ_270BB:
        :: DUPROM-WORD? case OBJ_2710B           * 270BB
          FALSE ;                                * 270CF

* refs (1): 270A7
OBJ_270D9:
        :: OBJ_71DFF FALSE OBJ_7221F ;           * 270D9

* refs (1): 7222C
OBJ_270F2:
        :: OBJ_2710B NOTcsdrpfls SWAPDROPTRUE ;  * 270F2

* refs (2): 270CA 270F7
OBJ_2710B:
        CON(5)  L_71FA7                          * 2710B  code object: the address of its machine code
        ASSEMBLE
L_27110:
        A=DAT1  X                                * 27110
        CD1EX                                    * 27114
        RSTK=C                                   * 27117
        LC(3)   #700                             * 27119
        ST=0    6                                * 2711E
        ?C>A    X                                * 27121
        GOYES   L_27129                          * 27124
        ST=1    6                                * 27126
L_27129:
        C=RSTK                                   * 27129
        CD1EX                                    * 2712B
        D1=D1-  1                                * 2712E
        A=DAT1  1                                * 27131
        D1=C                                     * 27135
        ?ABIT=1 2                                * 27138
        GOYES   L_2714C                          * 2713D
L_2713F:
        LC(5)   FALSE                            * 2713F
        A=C     A                                * 27146
        PC=(A)                                   * 27148
L_2714C:
        C=0     S                                * 2714C
        ?ST=0   6                                * 2714F
        GOYES   L_27168                          * 27152
        ?ABIT=0 3                                * 27154
        GOYES   L_2715E                          * 27159
        C=C+1   S                                * 2715B
L_2715E:
        ?ABIT=1 1                                * 2715E
        GOYES   L_27168                          * 27163
        C=C+1   S                                * 27165
L_27168:
        GOSBVL  SAVPTR                           * 27168
        A=R0.F  A                                * 2716F
        D0=A                                     * 27175
        GOTO    L_26FE1                          * 27178
        FILLTO  #271C5                           * 2717C  73 zero nibbles: the next entry stays at #271C5
        RPL

* refs (1): 1476C
OBJ_271C5:
        :: DUP OBJ_2699F NOTcaseFALSE DUPTYPECOL? * 271C5
          case OBJ_27206                         * 271DE
          OBJ_71DFF FALSE OBJ_27206 NOTcsdrpfls SWAPDROPTRUE ; * 271E8

* refs (2): 271E3 271F2
OBJ_27206:
        CON(5)  L_71FB5                          * 27206  code object: the address of its machine code
        ASSEMBLE
L_2720B:
        A=DAT1  1                                * 2720B
        D1=C                                     * 2720F
        ?ABIT=1 3                                * 27212
        GOYES   L_2721D                          * 27217
        GOTO    L_2713F                          * 27219
L_2721D:
        C=0     S                                * 2721D
        GOTO    L_2715E                          * 27220

* bak -> :: bak <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (4): 0902A 215E3 853AF 8550F
DNOTBAKcase:
        CON(5)  (*)+5                            * 27224  primitive code object
        LC(5)   DOBAK                            * 27229
        GOTO    L_27270                          * 27230

* lib -> :: lib <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (1): 09034
DNOTLIBcase:
        CON(5)  (*)+5                            * 27234  primitive code object
        LC(5)   DOLIB                            * 27239
        GOTO    L_27270                          * 27240

* {} -> :: {} <ob2> <rest> ; ob -> :: ob <ob1> ;
NOTLISTcase:
        CON(5)  (*)+5                            * 27244  primitive code object
        LC(5)   DOLIST                           * 27249
        GOTO    L_27270                          * 27250

* seco -> :: seco <ob2> <rest> ; ob -> :: ob <ob1> ;
NOTSECOcase:
        CON(5)  (*)+5                            * 27254  primitive code object
        LC(5)   DOCOL                            * 27259
        GOTO    L_27270                          * 27260

* romp -> :: romp <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (15): 0F1C3 268DB 2691C 269A4 27066 291F8 ...
NOTROMPcase:
        CON(5)  (*)+5                            * 27264  primitive code object
        LC(5)   DOROMP                           * 27269
L_27270:
        RSTK=C                                   * 27270
        C=DAT1  A                                * 27272
        CD1EX                                    * 27275
        A=DAT1  A                                * 27278
        D1=C                                     * 2727B
L_2727E:
        C=RSTK                                   * 2727E
        A=A-C   A                                * 27280
        LC(5)   COLA                             * 27282
        ?A#0    A                                * 27289
        GOYES   L_27295                          * 2728C
        LC(5)   SKIP                             * 2728E
L_27295:
        A=C     A                                * 27295
        PC=(A)                                   * 27297
        RPL

* refs (1): 24753
OBJ_2729B:
        :: BINT4 OBJ_285C6 DUP#1+ SWAPUnDROP BINT0 BINT7 NDUPN DROP * 2729B
          {                                      * 272C8

Π'ttt:
            LAM 'ttt                             * 272CD

Π'str:
            LAM 'str                             * 272DC

Π'ofs:
            LAM 'ofs                             * 272EB

Π'tok:
            LAM 'tok                             * 272FA

Π'rbv:
            LAM 'rbv                             * 27309

Π'idfflg:
            LAM 'idfflg                          * 27318

Π'tmpop:
            LAM 'tmpop                           * 2732D

Π'tmppdat:
            LAM 'tmppdat                         * 27340

Π'ploc:
            LAM 'ploc                            * 27357

Π'bv:
            LAM 'bv                              * 27368

Π'unbound:
            LAM 'unbound }                       * 27375
          BIND pshzer OBJ_273AA ABND ;           * 27391

* refs (12): 2739B 276B1 27814 2792C 27A3A 27ABC ...
* Probably: the algebraic parser's main loop
OBJ_273AA:
        :: check_pdata OBJ_27ED1 OBJ_2768E OBJ_27CCE 8GETLAM nultrior * 273AA
          :: drop;dq OBJ_27530 ; tok' tok=casedrop OBJ_27530 * 273CD
          toklparen tok=casedrop OBJ_27A03       * 273F0
          tokrparen tok=casedrop OBJ_278D7       * 273FF
          NoDecSep tok=casedrop OBJ_276D4        * 2740E
          tok; tok=casedrop OBJ_276D4            * 2741D
          tok= tok=casedrop OBJ_2781E            * 2742C
          DROP GetGNTData OBJ_25D03 !*trior OBJ_27AC6 ngsizecase failed * 2743B
          OBJ_24609 !*trior OBJ_27AC6 SWAP COMPILEID ROT ORNOT casedrop * 2745E
          failed                                 * 27486
          OBJ_274D1 ?OKINALG NOTcasedrop failed  * 2748B
          OBJ_26BED NOTcase OBJ_27670            * 2749F
          7UNROLL 7UNROLL 7UNROLL 4DROP COLA OBJ_27B0C * 274AE
        ;                                        * 274CC

* refs (3): 2748B 68814 68AA3
OBJ_274D1:
        :: 1GETLAM #0<> ?SEMI                    * 274D1
          DUP M1st-case                          * 274E5
          :: 2DROP ' xNEG ;                      * 274EF
          M1st+case                              * 27508
          :: 2DROP ' xNEGNEG ;                   * 2750D
          DROP ;                                 * 27526

* refs (2): 273D7 273EB
OBJ_27530:
        :: 1GETLAM #0=case OBJ_27797             * 27530
          COLA OBJ_27553                         * 27544
        ;                                        * 2754E

* refs (3): 27549 2757B 275A3
OBJ_27553:
        :: DUP#0=case OBJ_2763E                  * 27553
          OBJ_282D7 NOTcase                      * 27562
          :: OBJ_27FC1 COLA OBJ_27553            * 2756C
          ;                                      * 27580
          OBJ_28616 IT OBJ_275AD                 * 27585
          OBJ_284C3 OBJ_27FC1 COLA OBJ_27553     * 27594
        ;                                        * 275A8

* refs (1): 2758F
OBJ_275AD:
        :: DUP BINT5 #=case                      * 275AD
          :: NDROP BINT0 RDROPCOLA OBJ_2763E ;   * 275C1
          BEGIN ROT#1+UNROT OBJ_282FA DROP SWAPDUP BINT5 #= SWAP BINT7 #> OR * 275DF
          NOTcase                                * 27616
          :: 2RDROP DROP OBJ_27797 ;             * 2761B
          NOT_UNTIL ;                            * 27634

* refs (2): 2755D 275D5
OBJ_2763E:
        :: DROPONE OVER#= ITE CKSYMBN PSYMBN     * 2763E
          SWAP#1+ GetGNTData TrueTrue ;          * 2765C

* refs (1): 274A9
OBJ_27670:
        :: OBJ_24681 2DROP COLA OBJ_27AC6        * 27670
        ;                                        * 27689

* refs (1): 273B9
OBJ_2768E:
        :: GetGNTData 5ROLL tok8trior            * 2768E

* refs (1): 276CA
OBJ_276A2:
          :: PutGNTData COLA OBJ_273AA           * 276A2
          ;                                      * 276B6
          tok; OBJ_0BC15 !*triand OBJ_276A2 ;    * 276BB

* refs (2): 27418 27427
OBJ_276D4:
        :: 1GETLAM #0=case OBJ_27797             * 276D4
          COLA OBJ_276F7                         * 276E8
        ;                                        * 276F2

* refs (3): 276ED 2772E 27756
OBJ_276F7:
        :: DUP#0=case OBJ_27797                  * 276F7
          3PICK #0=case OBJ_2842D                * 27706
          OBJ_282FA NOTcase                      * 27715
          :: OBJ_27FC1 COLA OBJ_276F7            * 2771F
          ;                                      * 27733
          OBJ_28616 NOTcase                      * 27738
          :: OBJ_284C3 OBJ_27FC1 COLA OBJ_276F7  * 27742
          ;                                      * 2775B
          ROT#1+UNROT OBJ_282FA 2DROP BINT6 EQcasedrop OBJ_277B0 * 27760
          DUP BINT7 #>case OBJ_277C9             * 2777E
          DROP                                   * 27792

* refs (22): 2753F 2762A 276E3 27701 2782D 2784B ...
* Probably: parser failure exit: restore the saved token and parser state (lams 11..8), FALSE TRUE
OBJ_27797:
          :: GetGNTData failed ; ;               * 27797

* refs (4): 27779 278C3 279A9 279F4
OBJ_277B0:
        :: BINT7 COLA OBJ_277C9                  * 277B0
        ;                                        * 277C4

* refs (2): 2778D 277BF
OBJ_277C9:
        :: BINT8 #- 4ROLL SWAP#- 3UNROLL OBJ_284C3 * 277C9

* refs (5): 27922 27A30 27AB2 27C65 27EB8
OBJ_277EC:
          :: GetGNTData DROP GetNextToken PutGNTData ; ~BINT0;1PUTLAM COLA * 277EC
          OBJ_273AA                              * 27814
        ;                                        * 27819

* refs (1): 27436
OBJ_2781E:
        :: 1GETLAM #0=case OBJ_27797             * 2781E
          COLA OBJ_27841                         * 27832
        ;                                        * 2783C

* refs (3): 27837 27878 278A0
OBJ_27841:
        :: DUP#0=case OBJ_27797                  * 27841
          3PICK #0=case OBJ_27797                * 27850
          OBJ_282FA NOTcase                      * 2785F
          :: OBJ_27FC1 COLA OBJ_27841            * 27869
          ;                                      * 2787D
          OBJ_28616 NOTcase                      * 27882
          :: OBJ_284C3 OBJ_27FC1 COLA OBJ_27841  * 2788C
          ;                                      * 278A5
          ROT#1+UNROT OBJ_282FA 2DROP BINT7 #=casedrop OBJ_277B0 * 278AA
          DROP OBJ_27797 ;                       * 278C8

* refs (1): 27409
OBJ_278D7:
        :: 1GETLAM #0=case OBJ_27797             * 278D7
          COLA OBJ_278FA                         * 278EB
        ;                                        * 278F5

* refs (3): 278F0 2794F 27977
OBJ_278FA:
        :: DUP#0=case OBJ_27797                  * 278FA
          3PICK #0=case                          * 27909
          :: metatail NDROP OBJ_277EC COLA OBJ_273AA * 27913
          ;                                      * 27931
          OBJ_282FA NOTcase                      * 27936
          :: OBJ_27FC1 COLA OBJ_278FA            * 27940
          ;                                      * 27954
          OBJ_28616 NOTcase                      * 27959
          :: OBJ_284C3 OBJ_27FC1 COLA OBJ_278FA  * 27963
          ;                                      * 2797C
          ROT#1+UNROT OBJ_282FA DROPOVER BINT5 #=case * 27981
          :: 2DROP COLA OBJ_277B0                * 2799A
          ;                                      * 279AE
          SWAP BINT9 #< casedrop OBJ_27797       * 279B3
          NOTcase OBJ_27797                      * 279CC
          ROT#1+UNROT OBJ_282FA 2DROP BINT5 #= case OBJ_277B0 * 279D6
          OBJ_27797 ;                            * 279F9

* refs (1): 273FA
OBJ_27A03:
        :: 1GETLAM #0=case                       * 27A03
          :: NULLHXS ZEROZERO BINT3 5ROLL #4+ OBJ_277EC COLA OBJ_273AA * 27A12
          ;                                      * 27A3F
          psh OVERDUP TYPEIDNT? SWAP TYPELAM? OR NOTcase OBJ_27797 * 27A44
          #1-SWAP symcomp BINT0 ' xFCNAPPLY #0590410h BINT0 BINT3 BINT6 * 27A6C
          BINT7 psh over& psh ~BINT0;1PUTLAM OBJ_277EC COLA OBJ_273AA * 27A99
        ;                                        * 27AC1

* refs (3): 2744F 27468 27684
OBJ_27AC6:
        :: 1GETLAM ~BINT1;1PUTLAM #0= NOTcase    * 27AC6
          :: 4DROP OBJ_27797 ;                   * 27ADF
          PutGNTData pullrev1& COLA OBJ_273AA    * 27AF3
        ;                                        * 27B07

* refs (1): 274C7
OBJ_27B0C:
        :: #1+ #0= 6PUTLAM SWAP 5PUTLAM DUP4PUTLAM OBJ_26E61 DROP 7PUTLAM * 27B0C
          2PUTLAM NOTcase OBJ_27BA2              * 27B3E
          1GETLAM #0=case OBJ_27797              * 27B4D
          OBJ_27C74 BINT3 3PUTLAM 4GETLAM OBJ_28599 BINT2 #<> ?SKIP * 27B5C
          OBJ_282B4                              * 27B84
          OBJ_27BD9 OBJ_284C3 COLA OBJ_273AA     * 27B89
        ;                                        * 27B9D

* refs (1): 27B48
OBJ_27BA2:
        :: 1GETLAM #0= NOTcase OBJ_27797         * 27BA2
          BINT2 3PUTLAM OBJ_27BD9 COLA OBJ_273AA * 27BBB
        ;                                        * 27BD4

* refs (2): 27B89 27BC5
OBJ_27BD9:
        :: 5GETLAM DUP TYPEROMP? ITE             * 27BD9
          :: symcomp BINT0 ' xFCNAPPLY BINT3 ;   * 27BF2
          :: 6GETLAM ITE                         * 27C15
            :: ZEROSWAP BINT2 ; BINT1            * 27C24
          ;                                      * 27C3D
          4GETLAM 7GETLAM 3GETLAM BINT3 top& DUP#1+ top& OBJ_277EC * 27C42
          ~BINT0;1PUTLAM ;                       * 27C6A

* refs (2): 27B5C 27CC4
OBJ_27C74:
        :: DUP#0= ?SEMI                          * 27C74
          4PICK 2GETLAM #< ?SEMI                 * 27C83
          OBJ_282FA IT                           * 27C97
          :: OBJ_28616 DROP ;                    * 27CA1
          OBJ_284C3 OBJ_27FC1 COLA OBJ_27C74     * 27CB5
        ;                                        * 27CC9

* refs (1): 273BE
OBJ_27CCE:
        :: 1GETLAM #0= NOTcase OBJ_27797         * 27CCE
          ~BINT1;1PUTLAM OBJ_27FC1 COLA OBJ_273AA * 27CE7
        ;                                        * 27CFB

* refs (2): 273AF 27EC7
check_pdata:
        :: DUP#0=case 3SKIP                      * 27D00
          3PICK #0=case 3SKIP                    * 27D0F
          OBJ_282FA NOTcase 2skipcola            * 27D1E
          DROP                                   * 27D2D

* refs (1): 69A59
OBJ_27D32:
          CODE                                   * 27D32  69 nibbles
            GOSBVL  POP#                         * 27D3C
            LC(5)   #00000                       * 27D43
            ?C=A    A                            * 27D4A
            GOYES   L_27D74                      * 27D4D
            LC(1)   #2                           * 27D4F
            ?C=A    A                            * 27D52
            GOYES   L_27D74                      * 27D55
            D0=D0+  5                            * 27D57
            LC(1)   #3                           * 27D5A
            ?C=A    A                            * 27D5D
            GOYES   L_27D74                      * 27D60
            D0=D0+  5                            * 27D62
            D1=D1-  5                            * 27D65
            D=D-1   A                            * 27D68
            A=DAT0  A                            * 27D6A
            D0=D0+  5                            * 27D6D
            PC=(A)                               * 27D70
L_27D74:
            LC(5)   COLA                         * 27D74
            A=C     A                            * 27D7B
            PC=(A)                               * 27D7D
          ENDCODE                                * 27D81
          3SKIP COLA 4ROLL                       * 27D81
          #1+ 4UNROLL                            * 27D90

* refs (1): 69A68
OBJ_27D9A:
          CODE                                   * 27D9A  106 nibbles
            GOSBVL  POP#                         * 27DA4
            LC(5)   #00004                       * 27DAB
            ?C=A    A                            * 27DB2
            GOYES   L_27DEF                      * 27DB5
            D0=D0+  15                           * 27DB7
            D0=D0+  5                            * 27DBA
            LC(1)   #5                           * 27DBD
            ?C=A    A                            * 27DC0
            GOYES   L_27DEF                      * 27DC3
            D0=D0+  15                           * 27DC5
            D0=D0+  5                            * 27DC8
            LC(1)   #6                           * 27DCB
            ?C=A    A                            * 27DCE
            GOYES   L_27DEF                      * 27DD1
            D0=D0+  15                           * 27DD3
            D0=D0+  5                            * 27DD6
            LC(1)   #7                           * 27DD9
            ?C=A    A                            * 27DDC
            GOYES   L_27DEF                      * 27DDF
            D0=D0+  15                           * 27DE1
            D0=D0+  5                            * 27DE4
            LC(1)   #1                           * 27DE7
            ?C#A    A                            * 27DEA
            GOYES   L_27DFC                      * 27DED
L_27DEF:
            LC(5)   COLA                         * 27DEF
            A=C     A                            * 27DF6
            PC=(A)                               * 27DF8
L_27DFC:
            D0=D0+  5                            * 27DFC
            D1=D1-  5                            * 27DFF
            D=D-1   A                            * 27E02
            A=DAT0  A                            * 27E04
            D0=D0+  5                            * 27E07
            PC=(A)                               * 27E0A
          ENDCODE                                * 27E0E
          :: toklparen COLAskipcola ;            * 27E0E
          :: tokrparen COLAskipcola ;            * 27E22
          :: NoDecSep COLAskipcola ;             * 27E36
          :: tok= COLAskipcola ; 3SKIP 8GETLAM   * 27E4A

* refs (1): 69AC7
OBJ_27E68:
          :: NoDecSep tok=casedrop TRUE          * 27E68
            tok; tok=casedrop TRUE               * 27E7C
            2DROPFALSE ;                         * 27E8B
          IT                                     * 27E95
          :: BINT7 #- 4ROLL SWAP#- 3UNROLL OBJ_277EC ; * 27E9A
          COLA check_pdata                       * 27EC2
        ;                                        * 27ECC

* refs (1): 273B4
OBJ_27ED1:
        :: GetGNTData ~;eval;q                   * 27ED1

* refs (2): 246C7 24E51
OBJ_27EE0:
          :: ngsizecase failed                   * 27EE0
            delimcase failed                     * 27EEF
            DUP RDROP ;                          * 27EF9
          $>ID DUP undo ITE                      * 27F08

* refs (1): 69801
OBJ_27F1C:
          :: DROP ID>LAM TRUE ;                  * 27F1C

* refs (1): 69806
OBJ_27F35:
          :: DUP COMPILEID DROP TYPEIDNT? ;      * 27F35
          NOTcase                                * 27F53

drop;false;true:
          :: DROP failed ;                       * 27F58
          symcomp 6rolld;1+(s5) DROP GetNextToken PutGNTData pullrev1& * 27F6C
          OBJ_284C3 ROT#1+UNROT COLA OBJ_273AA   * 27F8A
        ;                                        * 27F9E

* refs (6): 2740E 27E3B 27E6D 68B4D 69616 69A9A
NoDecSep:
        :: DPRADIX? tok, tok. RPITE ;            * 27FA3

* refs (10): 27571 27599 27724 2774C 2786E 27896 ...
OBJ_27FC1:
        :: metatail #3- 4UNROLL3DROP rotswap top& OBJ_27FEE psh ; * 27FC1

* refs (2): 27FDF 6B018
OBJ_27FEE:
        :: M1stNEGcase OBJ_2813D                 * 27FEE
          AEQ1stcase xNEGNEG                     * 27FFD
          SWAPDROP#1- AEQ1stcase ~CK2&Dispatch   * 28007
          OBJ_2818D AEQ1stcase ~CK2&Dispatch_2   * 28016
          OBJ_281F6 AEQ1stcase xFORMUNIT         * 28025
          OBJ_2806B AEQ1stcase xPREDIV           * 28034
          OBJ_2804D ;                            * 28043

* refs (2): 28043 6AFB9
OBJ_2804D:
        :: SWAPDROP ' x/ SWAP ;                  * 2804D

* refs (1): 28034
OBJ_2806B:
        :: larg dup                              * 2806B

* refs (1): 28115
{}_2807A:
          { } OVER#2+UNROL SWAPDROP#1- larg CKSYMBN EXPLODE IMPLODE pshm1 * 2807A
          CKSYMBN EXPLODE IMPLODE SWAPDROPSWAP ERRSET * 280A7
          :: ' OBJ_28A65 parameval ChkEvalNext? x* NOTcase doerrB01 * 280C0
            SWAPDROP pshm1 NDROP DROP ;          * 280E8
          ERRTRAP                                * 28101
          :: ERRORCLR BEGIN {}_2807A EQ UNTIL IMPLODE ; SINNER top& ; * 28106

* refs (1): 27FF8
OBJ_2813D:
        :: CK&DISPATCH0                          * 2813D
          REALOBOB ~#1-UNROT;EvalNoCK;SWAP       * 28147  real any any
          CMPOBOB ~#1-UNROT;EvalNoCK;SWAP        * 28151  complex any any
          EXTOBOB ~#1-UNROT;EvalNoCK;SWAP        * 2815B  unit any any
          BINT0 NOP                              * 28165  any
        ;                                        * 2816F

* refs (3): 2814C 28156 28160
~#1-UNROT;EvalNoCK;SWAP:
        :: #1-UNROT EvalNoCK SWAP ;              * 28174

* refs (2): 28016 5F594
OBJ_2818D:
        :: SWAPDROP#1- CK&DISPATCH0              * 2818D
          REALREALOB ~#1-UNROT;%>C%;SWAP         * 2819C  real real any
          BINT0 Addi*+[_]                        * 281A6  any
        ;                                        * 281B0

* refs (1): 281A1
~#1-UNROT;%>C%;SWAP:
        :: #1-UNROT %>C% SWAP ;                  * 281B5

* refs (2): 281AB 28282
Addi*+[_]:
        ::                                       * 281CE
          { xi x* x+ } INNERtop& ;               * 281D3

* refs (2): 28025 5F599
OBJ_281F6:
        :: SWAPDROP#1- CK&DISPATCH0              * 281F6
          REALREALOB OBJ_2821E                   * 28205  real real any
          BINT0 OBJ_2823C                        * 2820F  any
        ;                                        * 28219

* refs (1): 2820A
OBJ_2821E:
        :: #1-UNROT %POL>%REC %>C% SWAP ;        * 2821E

* refs (1): 28214
OBJ_2823C:
        :: pshzerpsharg parg& psh dup PTR addt2: xCOS x* psh PTR addt2: xSIN * 2823C
          x* top& top& Addi*+[_] ;               * 28273
        NIBHEX  E8E60                            * 2828C  ←n

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 28291  entry 0

* ob1..obn-i..obn #i #n+1 -> ob1..ob..obn-i #n-i obn-i+1..obn #i
* refs (3): 27918 27FC6 28432
metatail:
        :: OVER#- #1- OVER #2+UNROLL ;           * 28296

* refs (3): 27B84 28639 28648
OBJ_282B4:
        :: psh larg PSYMBN SWAP#1+ psh ;         * 282B4

* refs (1): 27562
OBJ_282D7:
        :: 3PICK #0=case FALSE                   * 282D7
          COLA OBJ_282FA                         * 282EB
        ;                                        * 282F5

* refs (13): 275E9 27715 27765 2785F 278AF 27936 ...
* Probably: algebraic parser: nibble #i of its context hex string
OBJ_282FA:
        :: FALSE BINT0 COLA OBJ_28318            * 282FA
        ;                                        * 28313

* refs (1): 2830E
OBJ_28318:
        CON(5)  (*)+5                            * 28318  primitive code object
        ASSEMBLE
        CD1EX                                    * 2831D
        RSTK=C                                   * 28320
        D1=C                                     * 28322
        D1=D1+  5                                * 28325
        D1=D1+  15                               * 28328
L_2832B:
        C=DAT1  A                                * 2832B
        CD1EX                                    * 2832E
        D1=D1+  5                                * 28331
        A=DAT1  A                                * 28334
        D1=C                                     * 28337
        D1=D1+  10                               * 2833A
        C=DAT1  A                                * 2833D
        D1=C                                     * 28340
        D1=D1+  5                                * 28343
        C=DAT1  A                                * 28346
        C=C-CON A,7                              * 28349
        ?C<A    A                                * 2834F
        GOYES   L_28362                          * 28352
        A=0     S                                * 28354
        ?C>A    A                                * 28357
        GOYES   L_28376                          * 2835A
        A=A+1   S                                * 2835C
        GONC    L_28376                          * 2835F
L_28362:
        C=RSTK                                   * 28362
        D1=C                                     * 28364
        D1=D1+  5                                * 28367
        D=D+1   A                                * 2836A
        A=DAT0  A                                * 2836C
        D0=D0+  5                                * 2836F
        PC=(A)                                   * 28372
L_28376:
        D1=D1+  5                                * 28376
        CD1EX                                    * 28379
        C=C+A   A                                * 2837C
        D1=C                                     * 2837E
        A=0     A                                * 28381
        A=DAT1  1                                * 28383
        C=A     A                                * 28387
        A=A+A   A                                * 28389
        A=A+A   A                                * 2838B
        A=A+C   A                                * 2838D
        A=A+A   A                                * 2838F
        C=RSTK                                   * 28391
        D1=C                                     * 28393
        LC(5)   BINT0                            * 28396
        A=A+C   A                                * 2839D
        D1=D1+  5                                * 2839F
        DAT1=A  A                                * 283A2
        D1=D1-  5                                * 283A5
        LC(5)   TRUE                             * 283A8
        A=C     A                                * 283AF
        ?A=0    S                                * 283B1
        GOYES   L_283BD                          * 283B4
        LC(5)   FALSE                            * 283B6
L_283BD:
        DAT1=C  A                                * 283BD
        PC=(A)                                   * 283C0
        RPL

* Drops rest of current stream, skipcola in the above.
* refs (8): 27E18 27E2C 27E40 27E54 69A77 69A8B ...
COLAskipcola:
        :: RDROPCOLA skipcola ;                  * 283C4

* Skips 3 objs in the runstream.
* refs (7): 27D0A 27D19 27D81 27E5E 69A40 69A5E ...
3SKIP:
        :: RSKIP RSKIP RSKIP ;                   * 283D8

* refs (19): 27440 27661 27693 2779C 277F1 27ED6 ...
* -> hxs-mask $ #next $token: the parser's tokenizer state, from lams 11..8
GetGNTData:
        :: 11GETLAM 10GETLAM 9GETLAM 8GETLAM ;   * 283F1

* refs (18): 276A7 27800 27AF3 27F80 2848C 686F7 ...
* hxs-mask $ #next $token -> : store the tokenizer state in lams 8..11
PutGNTData:
        :: 8PUTLAM 9PUTLAM 10PUTLAM 11PUTLAM ;   * 2840F

* refs (1): 27710
OBJ_2842D:
        :: metatail NDROP GetGNTData DROP GetNextToken * 2842D
          :: tokanglesign tok8trior              * 2844B

* refs (3): 699F0 6F1B7 6F8C4
OBJ_2845A:
            :: ' ~CK2&Dispatch_2 ;               * 2845A

* refs (5): 69468 699D7 6F144 6F1F8 6F8B5
OBJ_2846E:
            :: ' ~CK2&Dispatch ; ;               * 2846E
          5UNROLL PutGNTData #05060410h BINT0 BINT5 BINT4 BINT5 top& * 28487
          ~BINT0;1PUTLAM COLA OBJ_273AA          * 284AF
        ;                                        * 284BE

* refs (8): 27594 27747 277E7 27891 27968 27B8E ...
OBJ_284C3:
        :: OBJ_284E6 ?SEMI                       * 284C3
          7ROLL #1+ 7UNROLL ;                    * 284D2

* refs (1): 284C8
OBJ_284E6:
        CON(5)  (*)+5                            * 284E6  primitive code object
        ASSEMBLE
        LC(5)   BINT0                            * 284EB
        A=DAT1  A                                * 284F2
        ?C=A    A                                * 284F5
        GOYES   L_2854B                          * 284F8
        D1=D1+  10                               * 284FA
        A=DAT1  A                                * 284FD
        ?C=A    A                                * 28500
        GOYES   L_28548                          * 28503
        D1=D1+  15                               * 28505
        C=DAT1  A                                * 28508
        LA(5)   xFCNAPPLY                        * 2850B
        ?C=A    A                                * 28515
        GOYES   L_28532                          * 28518
        CD1EX                                    * 2851A
        D1=D1+  5                                * 2851D
        A=DAT1  A                                * 28520
        D1=C                                     * 28523
        LC(5)   CKINFARGS                        * 28526
        ?C#A    A                                * 2852D
        GOYES   L_28545                          * 28530
L_28532:
        D1=D1-  15                               * 28532
        D1=D1-  10                               * 28535
        LC(5)   FALSE                            * 28538
        A=C     A                                * 2853F
        PC=(A)                                   * 28541
L_28545:
        D1=D1-  15                               * 28545
L_28548:
        D1=D1-  10                               * 28548
L_2854B:
        LC(5)   TRUE                             * 2854B
        A=C     A                                * 28552
        PC=(A)                                   * 28554
        RPL

* ob ob' # -> #-1 ob ob'
* refs (9): 28179 281BA 28223 56D79 56D88 6F3DD ...
#1-UNROT:
        :: #1- 3UNROLL ;                         * 28558

* $ $' -> :: <ob1> ; -> :: $ <ob2> <rest> ;
* refs (20): 24FF0 273E6 273F5 27404 27413 27422 ...
tok=casedrop:
        :: tok8cktrior drop;dq COLASKIP ;        * 2856C

* refs (14): 1718F 181EB 24DF7 273D2 28576 34EE4 ...
drop;dq:
        :: DROP COLACOLA ;                       * 28585

* refs (1): 27B70
OBJ_28599:
        :: BINT1 DUPDUP DUP OBJ_282FA 2DROP 6UNROLL 5DROP ; * 28599

* refs (2): 272A5 6C823
OBJ_285C6:
        :: ' x= #00700h BINT0 BINT1 BINT4 ;      * 285C6

* refs (7): 27AD0 27CE7 688CD 68936 68AC6 68E54 ...
~BINT1;1PUTLAM:
        :: BINT1 1PUTLAM ;                       * 285EE

* refs (10): 2780A 27AAD 27C6A 284AF 68887 68F6C ...
~BINT0;1PUTLAM:
        :: BINT0 1PUTLAM ;                       * 28602

* refs (5): 27585 27738 27882 27959 27CA6
OBJ_28616:
        :: SWAP BINT2 #<> ?SEMI                  * 28616
          case                                   * 2862F
          :: OBJ_282B4 TRUE ;                    * 28634
          OBJ_282B4 FALSE ;                      * 28648

* refs (1): 280D4
ChkEvalNext?:
        :: 'R COLA ChkEval?                      * 28657
        ;                                        * 2866B

* refs (3): 28666 2899F 28B28
ChkEval?:
        :: NOTNUM? CLRNUM ERRSET ITE             * 28670
          :: EvalNoCK ERRTRAP ~CLRNUM;RDROP;FALSE CLRNUM TRUE ; * 28689
          :: EvalNoCK ERRTRAP ~SETNUM;RDROP;FALSE SETNUM TRUE ; * 286AC
        ;                                        * 286CF

* refs (1): 28698
~CLRNUM;RDROP;FALSE:
        :: CLRNUM RDROP FALSE ;                  * 286D4

* refs (1): 286BB
~SETNUM;RDROP;FALSE:
        :: SETNUM RDROP FALSE ;                  * 286ED

* refs (3): 24474 28747 3EFA5
OBJ_28706:
        :: OBJ_28724 !*triand COLA OBJ_287C4     * 28706
        ;                                        * 2871F

* refs (2): 2870B 28828
OBJ_28724:
        :: toklparen tok8trior OBJ_28742 OBJ_28774 ; * 28724

* refs (1): 28733
OBJ_28742:
        :: OBJ_28706 !*triand nultrior TrueTrue tokrparen tok8trior TrueTrue * 28742
          failed ;                               * 2876A

* refs (1): 28738
OBJ_28774:
        :: OBJ_25D03 !*trior TrueTrue _SQRT_ tok8trior OBJ_288FA _SQ_ * 28774
          tok8trior OBJ_28918 _INV_ tok8trior OBJ_28945 COLA OBJ_289E0 * 2879C
        ;                                        * 287BF

* refs (2): 2871A 28814
OBJ_287C4:
        :: nultrior TrueTrue                     * 287C4
          :: tok* tok8trior OBJ_28878 tok/ tok8trior OBJ_28896 tok^ * 287D3
            tok8trior OBJ_288B4 FALSE ;          * 287FB
          !*trior OBJ_287C4 TrueTrue ;           * 2880F

* refs (5): 2887D 2889B 288FF 2892C 28959
OBJ_28823:
        :: OBJ_28724 !*triand COLA OBJ_28841     * 28823
        ;                                        * 2883C

* refs (2): 28837 28864
OBJ_28841:
        :: tok^ tok8trior                        * 28841
          :: OBJ_288B4 !*triand COLA OBJ_28841   * 28850
          ;                                      * 28869
          TrueTrue ;                             * 2886E

* refs (1): 287E2
OBJ_28878:
        :: OBJ_28823 !*triand OBJ_28972 x* ;     * 28878

* refs (1): 287F1
OBJ_28896:
        :: OBJ_28823 !*triand OBJ_28972 x/ ;     * 28896

* refs (3): 28800 28855 288C8
OBJ_288B4:
        :: tok- tok8trior                        * 288B4
          :: OBJ_288B4 !*triand OBJ_28972 xINV ; OBJ_25D03 !*triand * 288C3
          OBJ_28972 x^ ;                         * 288EB

* refs (1): 28792
OBJ_288FA:
        :: OBJ_28823 !*triand OBJ_28972 xSQRT ;  * 288FA

* refs (1): 287A1
OBJ_28918:
        :: toklparen OBJ_0BC47 !*triand OBJ_28823 !*triand OBJ_28972 xSQ ; * 28918

* refs (1): 287B0
OBJ_28945:
        :: toklparen OBJ_0BC47 !*triand OBJ_28823 !*triand OBJ_28972 xINV ; * 28945

* refs (8): 2447E 28887 288A5 288D2 288EB 28909 ...
OBJ_28972:
        :: {}_23989 BINT5 psh 'R SWAP#1+ larg rotswap DROP ChkEval? case * 28972
          :: ROTROT2DROP 6rolld;1+(s5) TrueTrue ; * 289A9
          BEGIN {}_23989 EQ UNTIL failed ;       * 289C2

* refs (1): 287BA
OBJ_289E0:
        :: DUP st=>uo? NOTcase failed            * 289E0
          SWAPDROP DaDGNTc ;                     * 289F9

* refs (1): 28788
_SQRT_:
        $ "SQRT"                                 * 28A08

* refs (1): 28797
_SQ_:
        $ "SQ"                                   * 28A1A

* refs (1): 287A6
_INV_:
        $ "INV"                                  * 28A28

* refs (1): 1FB0E
xFORMUNIT~name|local|algebraic:
        :: BINT2 nmetasyms ' OBJ_28A65 parameval COLA x* * 28A38
        ;                                        * 28A60

* refs (2): 280CA 28A4C
OBJ_28A65:
        :: CK&DISPATCH0                          * 28A65
          BINT6 nm=>uo?                          * 28A6F  name
          BINT7 nm=>uo?                          * 28A79  local
          BINT8 OBJ_28B05                        * 28A83  program
          BINT15 OBJ_28AA6                       * 28A8D  romptr
          BINT0 TRUE                             * 28A97  any
        ;                                        * 28AA1

* refs (1): 28A92
OBJ_28AA6:
        :: ROMPTRDECOMP ?SKIP doerrB01           * 28AA6
          COLA nm=>uo?                           * 28ABA
        ;                                        * 28AC4

* refs (3): 28A74 28A7E 28ABF
nm=>uo?:
        :: ID>$ st=>uo? case TRUE                * 28AC9

* refs (4): 280E3 28AB5 28B14 28B23
doerrB01:
          :: # B01 ERRORSTO ERRJMP ; ;           * 28AE2

* refs (1): 28A88
OBJ_28B05:
        :: REQcasedrop xFCNAPPLY                 * 28B05
          doerrB01 OBJ_26F7A case doerrB01       * 28B14
          ChkEval? ?SKIP ERRJMP                  * 28B28
          TRUE ;                                 * 28B37

* refs (2): 34E85 68990
OBJ_28B41:
        :: FALSE OBJ_29A51 ZEROFALSE ' NULLLAM BINT4 NDUPN DOBIND * 28B41
          DUPTYPESYMB? ITE OBJ_73010 OBJ_28BFF   * 28B6E
          2GETLAM #1<> 1GETLAM OR ITE OBJ_290E6 OBJ_290BE * 28B82
          ABND ;                                 * 28BA5

* refs (1): 73024
OBJ_28BAF:
        ::                                       * 28BAF

{{}}:
          { {}_600F3 } >R >R BEGIN nextsym'R DUP {}_600F3 EQ NOT_WHILE * 28BB4
          OBJ_28BFF REPEAT DROP ;                * 28BEB

* refs (3): 28B7D 28BEB 73074
OBJ_28BFF:
        :: subpdcdptch OBJ_291B7 OBJ_28D99 OBJ_28DCB OBJ_28DB7 * 28BFF
          drop;true;1Lput OBJ_26C72 NOTcase OBJ_28DB7 * 28C1D
          MINUSONE #=casedrop OBJ_293A4          * 28C31
          OBJ_28C4A ;                            * 28C40

* refs (5): 28C40 2922A 292A7 292BB 2940D
OBJ_28C4A:
        :: 2GETLAM 2DUP #>case OBJ_28D7B         * 28C4A
          OBJ_2957A OBJ_28D7B OBJ_29CC7 OBJ_26E61 DROP 5ROLL #2+ 6UNROLL * 28C63
          5ROLL SWAP BINT1 BINT6 BINT7 7ROLL ITE OBJ_29692 OBJ_2965B * 28C8B
          BEGIN OBJ_282FA WHILE                  * 28CB8
          :: SWAP OBJ_28D08 OBJ_29417 OBJ_29494 OBJ_294CB OBJ_294DF * 28CC7
            OBJ_294F3 OBJ_29525 ;                * 28CEA
          REPEAT OBJ_29D5F ;                     * 28CF9

* refs (1): 28CD1
OBJ_28D08:
        CON(5)  (*)+5                            * 28D08  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 28D0D
        LC(5)   #00000                           * 28D14
        ?C=A    A                                * 28D1B
        GOYES   L_28D5C                          * 28D1E
        LC(1)   #2                               * 28D20
        ?C=A    A                                * 28D23
        GOYES   L_28D5C                          * 28D26
        LC(1)   #3                               * 28D28
        ?C=A    A                                * 28D2B
        GOYES   L_28D5C                          * 28D2E
        D0=D0+  5                                * 28D30
        LC(1)   #4                               * 28D33
        ?C=A    A                                * 28D36
        GOYES   L_28D5C                          * 28D39
        D0=D0+  5                                * 28D3B
        LC(1)   #5                               * 28D3E
        ?C=A    A                                * 28D41
        GOYES   L_28D5C                          * 28D44
        D0=D0+  5                                * 28D46
        LC(1)   #7                               * 28D49
        ?C=A    A                                * 28D4C
        GOYES   L_28D5C                          * 28D4F
        D0=D0+  5                                * 28D51
        LC(1)   #6                               * 28D54
        ?C#A    A                                * 28D57
        GOYES   L_28D69                          * 28D5A
L_28D5C:
        LC(5)   COLA                             * 28D5C
        A=C     A                                * 28D63
        PC=(A)                                   * 28D65
L_28D69:
        D0=D0+  5                                * 28D69
        D1=D1-  5                                * 28D6C
        D=D-1   A                                * 28D6F
L_28D71:
        A=DAT0  A                                * 28D71
        D0=D0+  5                                * 28D74
        PC=(A)                                   * 28D77
        RPL

* refs (2): 28C5E 28C68
OBJ_28D7B:
        :: 3DROP true;1Lput COLA OBJ_28DB7       * 28D7B
        ;                                        * 28D94

* refs (1): 28C0E
OBJ_28D99:
        :: BINT0 3GETLAM BINT3 OBJ_29140 ;       * 28D99

* refs (3): 28C18 28C2C 28D8F
OBJ_28DB7:
        :: BINT1 OBJ_29140 ;                     * 28DB7

* refs (1): 28C13
OBJ_28DCB:
        :: DUPLENCOMP BINT3 #<case drop;true;1Lput * 28DCB
          INNERCOMP SWAPDROP#1- pullrev tokuscore BINT2 psh AEQ1stcase um/ * 28DE4
          OBJ_28E7A OBJ_28FB5 DUPZERO #>case     * 28E0C

* refs (2): 28E8E 28EAC
OBJ_28E20:
          :: NDROP NDROP NDROP true;1Lput ;      * 28E20
          DROP                                   * 28E3E

* refs (1): 28ED4
OBJ_28E43:
          :: top& #72109h OBJ_26E61 DROP ROTDROP BINT2 top& OBJ_29140 ; ; * 28E43

* refs (1): 28E0C
OBJ_28E7A:
        :: SWAPDROP#1- OBJ_28FB5 DUP#0=case OBJ_28E20 * 28E7A
          OBJ_28FB5 DUPZERO #>case               * 28E93
          :: NDROP OBJ_28E20 ;                   * 28EA2
          DROP PTR addt: x/ psh OBJ_28EDE top& OBJ_28E43 ; * 28EB6

* refs (1): 28ECA
OBJ_28EDE:
        :: EqwImplicit()? case OBJ_28F92         * 28EDE
          DUP #<3 ?SEMI                          * 28EF2
          3PICK REQcasedrop x*                   * 28F01
          OBJ_28F92 DROPDUP #3= ?SEMI            * 28F10
          4PICK REQcasedrop x*                   * 28F24
          OBJ_28F92 DROPDUP BINT4 #= ?SEMI       * 28F33
          5PICK REQcasedrop x*                   * 28F4C
          OBJ_28F92 DROPDUP BINT5 #= ?SEMI       * 28F5B
          6PICK REQcasedrop x*                   * 28F74
          OBJ_28F92 DROP ;                       * 28F83

* refs (5): 28EED 28F10 28F33 28F5B 28F83
OBJ_28F92:
        :: toklparen pshm1 top& tokrparen SWAP#1+ ; * 28F92

* refs (3): 28E11 28E84 28E93
OBJ_28FB5:
        :: pshzer OBJ_28FC9 ;                    * 28FB5

* refs (7): 28FBF 2905A 29078 2908C 29091 290A5 ...
OBJ_28FC9:
        :: DUP#0=case true;1Lput                 * 28FC9
          AEQ1stcase um*                         * 28FD8
          OBJ_2900F AEQ1stcase um^               * 28FE2
          OBJ_29023 AEQ1stcase umP               * 28FF1
          OBJ_29082 pullpsh1& ;                  * 29000

* refs (1): 28FE2
OBJ_2900F:
        :: OBJ_2909B x* ;                        * 2900F

* refs (1): 28FF1
OBJ_29023:
        :: EqwImplicit()? case OBJ_29046         * 29023
          OBJ_2909B x^ ;                         * 29037

* refs (1): 29032
OBJ_29046:
        :: SWAPDROP#1- tokrparen psh1& OBJ_28FC9 toklparen psh1& ' x^ psh1& * 29046
          OBJ_28FC9 ;                            * 29078

* refs (1): 29000
OBJ_29082:
        :: SWAPDROP#1- OBJ_28FC9 OBJ_28FC9 ;     * 29082

* refs (2): 29014 29037
OBJ_2909B:
        :: SWAPDROP#1- OBJ_28FC9 'R psh1& OBJ_28FC9 ; * 2909B

* refs (1): 28BA0
OBJ_290BE:
        :: DUP#1= ?SKIP 2pull2DROP               * 290BE
          get1 IT OBJ_2911D                      * 290D2
        ;                                        * 290E1

* refs (1): 28B9B
OBJ_290E6:
        :: 2GETLAM ZERO_DO NDROP LOOP DROP tok' OBJ_2970A tok' BINT3 ; * 290E6

* refs (1): 290DC
OBJ_2911D:
        :: tok' SWAP#1+ tok' pshm1 top& ;        * 2911D

* refs (3): 28DAD 28DC1 28E6B
OBJ_29140:
        CON(5)  (*)+5                            * 29140  primitive code object
        ASSEMBLE
        ST=1    0                                * 29145
L_29148:
        GOSBVL  SAVPTR                           * 29148
        D1=(5)  TEMPENV                          * 2914F
        A=DAT1  A                                * 29156
        LC(5)   #00019                           * 29159
        A=A+C   A                                * 29160
        R1=A.F  A                                * 29162
        D1=A                                     * 29168
        C=DAT1  A                                * 2916B
        D1=C                                     * 2916E
        D1=D1+  5                                * 29171
        A=DAT1  A                                * 29174
        ?ST=1   0                                * 29177
        GOYES   L_29181                          * 2917A
        A=A-1   A                                * 2917C
        GONC    L_29183                          * 2917E
L_29181:
        A=A+1   A                                * 29181
L_29183:
        R0=A.F  A                                * 29183
        GOSBVL  PUSH#                            * 29189
        C=DAT1  A                                * 29190
        D=D+1   A                                * 29193
        D1=D1+  5                                * 29195
        A=R1.F  A                                * 29198
        AD1EX                                    * 2919E
        DAT1=C  A                                * 291A1
        D1=A                                     * 291A4
        GOTO    L_28D71                          * 291A7

* refs (3): 291E9 291EE 29403
OBJ_291AB:
        CON(5)  (*)+5                            * 291AB  primitive code object
        ST=0    0                                * 291B0
        GOTO    L_29148                          * 291B3
        RPL

* refs (1): 28C09
OBJ_291B7:
        :: DROP 2GETLAM BINT3 #<case true;1Lput  * 291B7
          OBJ_292F7 case true;1Lput              * 291D5
          DROPSWAPDROP OBJ_291AB OBJ_291AB SWAP NOTROMPcase OBJ_29216 * 291E4

* refs (1): 27070
OBJ_29202:
          :: DUPROMPTR@ COLANOTcase ;            * 29202

* refs (1): 291FD
OBJ_29216:
          :: #0590410h ROT COLA OBJ_28C4A        * 29216
          ;                                      * 2922F
          DROPSWAP OVER ?OKINALG NOTcase         * 29234

3dropn;true;1Lput:
          :: 3DROP true;1Lput ;                  * 29248
          3PICK EQUALNOTcase drop2;true;1Lput    * 2925C
          SWAP OBJ_26C1A NOTcase                 * 2926B

* refs (5): 29266 293B3 293C7 293DB 293EF
drop2;true;1Lput:
          :: 2DROP true;1Lput ;                  * 2927A
          MINUSONE #=casedrop                    * 2928E
          :: ROT COLA OBJ_28C4A                  * 29298
          ;                                      * 292AC
          4ROLLOVER #=casedrop OBJ_28C4A         * 292B1
          4DROP true;1Lput ;                     * 292C0

* refs (9): 28D85 28E34 28FD3 291D0 291DF 29252 ...
true;1Lput:
        :: TRUE 1PUTLAM ;                        * 292CF

* refs (2): 28C1D 28DDF
drop;true;1Lput:
        :: DROP true;1Lput ;                     * 292E3

* refs (1): 291D5
OBJ_292F7:
        CON(5)  (*)+5                            * 292F7  primitive code object
        ASSEMBLE
        CD1EX                                    * 292FC
        RSTK=C                                   * 292FF
        D1=C                                     * 29301
        C=DAT1  A                                * 29304
        CD1EX                                    * 29307
        D1=D1+  5                                * 2930A
        A=DAT1  A                                * 2930D
        D1=C                                     * 29310
        A=A-1   A                                * 29313
        ?A=0    A                                * 29315
        GOYES   L_2932C                          * 29318
L_2931A:
        LC(5)   TRUE                             * 2931A
L_29321:
        A=C     A                                * 29321
        C=RSTK                                   * 29323
        D1=C                                     * 29325
        PC=(A)                                   * 29328
L_2932C:
        GOSUB   SUB_29393                        * 2932C
        ?A=0    A                                * 29330
        GOYES   L_2931A                          * 29333
        D1=D1-  5                                * 29335
        A=DAT1  A                                * 29338
        D1=C                                     * 2933B
        LC(5)   DOBINT                           * 2933E
        ?C#A    A                                * 29345
        GOYES   L_2931A                          * 29348
        GOSUB   SUB_29393                        * 2934A
        D1=C                                     * 2934E
        A=A-1   A                                * 29351
        ?A#0    A                                * 29353
        GOYES   L_2931A                          * 29356
        D1=D1+  5                                * 29358
        C=DAT1  A                                * 2935B
        CD1EX                                    * 2935E
        A=DAT1  A                                * 29361
        LC(5)   DOIDNT                           * 29364
        ?C=A    A                                * 2936B
        GOYES   L_29388                          * 2936E
        LC(5)   DOLAM                            * 29370
        ?C=A    A                                * 29377
        GOYES   L_29388                          * 2937A
        LC(5)   DOROMP                           * 2937C
        ?C#A    A                                * 29383
        GOYES   L_2931A                          * 29386
L_29388:
        LC(5)   FALSE                            * 29388
        GOTO    L_29321                          * 2938F

* refs (4): 2932C 2934A 29586 2958F
SUB_29393:
        D1=D1+  5                                * 29393
        C=DAT1  A                                * 29396
        CD1EX                                    * 29399
        D1=D1+  5                                * 2939C
        A=DAT1  A                                * 2939F
        RTN                                      * 293A2
        RPL

* refs (1): 28C3B
OBJ_293A4:
        :: 2GETLAM #0=case drop2;true;1Lput      * 293A4
          3PICK BINT1 #<>case drop2;true;1Lput   * 293B8
          4PICK BINT0 #=casedrop drop2;true;1Lput * 293CC
          DUP TYPEBINT? NOTcasedrop drop2;true;1Lput * 293E0
          BINT3 psh #1+NDROP OBJ_291AB COLA OBJ_28C4A * 293F4
        ;                                        * 29412

* refs (1): 28CD6
OBJ_29417:
        :: OBJ_29C7C BINT9 ROLL DUP #1- 10UNROLL ONESWAP N+1roll get1 DROP * 29417
          get1 OVER #1= casedrop psh&            * 2944E
          SWAP #2- 4UNROLL case2drop psh&        * 29467
          OBJ_29829 OBJ_296D8 psh& ;             * 29480

* refs (1): 28CDB
OBJ_29494:
        :: OBJ_294A8 toklparen ;                 * 29494

* refs (4): 29499 294D0 294E4 294F8
OBJ_294A8:
        :: DROP 'R psh1&rev ROT#1+ 3UNROLL ;     * 294A8

* refs (1): 28CE0
OBJ_294CB:
        :: OBJ_294A8 tokrparen ;                 * 294CB

* refs (1): 28CE5
OBJ_294DF:
        :: OBJ_294A8 tok= ;                      * 294DF

* refs (1): 28CEA
OBJ_294F3:
        :: OBJ_294A8 tok; 4GETLAM NOT?SEMI       * 294F3
          tokanglesign psh1&rev FALSE 4PUTLAM ;  * 2950C

* refs (1): 28CEF
OBJ_29525:
        :: SWAPDROP OBJ_29C7C 8PICK #0=case DROP * 29525
          8ROLL #1- 8UNROLL BINT7 #- 4ROLL SWAP#- 3UNROLL tok; psh1&rev ; * 29543

* refs (1): 28C63
OBJ_2957A:
        CON(5)  (*)+5                            * 2957A  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 2957F
        GOSUB   SUB_29393                        * 29586
        D1=C                                     * 2958A
        B=A     A                                * 2958D
        GOSUB   SUB_29393                        * 2958F
        C=A     A                                * 29593
        C=C-CON A,8                              * 29595
        D=C     A                                * 2959B
        CD1EX                                    * 2959D
        C=C+A   A                                * 295A0
        D1=C                                     * 295A2
        D1=D1-  2                                * 295A5
        B=0     S                                * 295A8
        C=0     S                                * 295AB
        P=      8                                * 295AE
        CPEX    15                               * 295B0
        A=C     S                                * 295B4
        D=0     S                                * 295B7
L_295BA:
        C=DAT1  S                                * 295BA
        P=C     15                               * 295BE
        ?P=     0                                * 295C2
        GOYES   L_29618                          * 295C5
        ?P=     2                                * 295C7
        GOYES   L_29618                          * 295CA
        ?P=     3                                * 295CC
        GOYES   L_29618                          * 295CF
        C=C-A   S                                * 295D1
        GOC     L_295DD                          * 295D4
        B=C     S                                * 295D7
        B=B+1   S                                * 295DA
L_295DD:
        D1=D1-  1                                * 295DD
        D=D-1   A                                * 295E0
        GOC     L_295F0                          * 295E2
        ?B=0    S                                * 295E5
        GOYES   L_295BA                          * 295E8
        B=B-1   S                                * 295EA
        GONC    L_295BA                          * 295ED
L_295F0:
        A=0     A                                * 295F0
        ?B=0    A                                * 295F2
        GOYES   L_2963F                          * 295F5
        ?D=0    S                                * 295F7
        GOYES   L_29629                          * 295FA
        C=D     S                                * 295FC
        C=0     A                                * 295FF
        CPEX    15                               * 29601
        CPEX    0                                * 29605
L_29609:
        A=A+1   A                                * 29609
        B=B-C   A                                * 2960B
        GOC     L_29629                          * 2960D
        ?B=0    A                                * 29610
        GOYES   L_2963F                          * 29613
        GONC    L_29609                          * 29615
L_29618:
        B=B-1   A                                * 29618
        GOC     L_29629                          * 2961A
        ?B=0    S                                * 2961D
        GOYES   L_295DD                          * 29620
        D=D+1   S                                * 29622
        GOTO    L_295DD                          * 29625
L_29629:
        P=      0                                * 29629
        GOSBVL  GETPTR                           * 2962B
        LC(5)   COLA                             * 29632
        A=C     A                                * 29639
        PC=(A)                                   * 2963B
L_2963F:
        P=      0                                * 2963F
        R0=A.F  A                                * 29641
        GOSBVL  PUSH#                            * 29647
        LC(5)   SKIP                             * 2964E
        A=C     A                                * 29655
        PC=(A)                                   * 29657
        RPL

* refs (1): 28CB3
OBJ_2965B:
        :: ROTDROP BINT2 3UNROLL DUP #3+PICK ' ~CK2&Dispatch_2 EQ 4PUTLAM ; * 2965B

* refs (1): 28CAE
OBJ_29692:
        :: ROTDROP BINT3 3UNROLL 8ROLL #1-DUP 9rolld N+1roll BINT1 * 29692
          #=casedrop psh1&                       * 296BF
          #2- 3UNROLL OBJ_29738                  * 296C9

* refs (1): 29485
OBJ_296D8:
          :: tokrparen SWAP#1+ toklparen BINT1 pshtop& ; unrot over& ; * 296D8

* refs (1): 29109
OBJ_2970A:
        $ "Invalid Expression"                   * 2970A

* refs (1): 296D3
OBJ_29738:
        CON(5)  (*)+5                            * 29738  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 2973D
        C=DAT1  A                                * 29740
        R2=C.F  A                                * 29743
        D1=D1-  5                                * 29749
        GOSBVL  POP2#                            * 2974C
        R0=C.F  A                                * 29753
        R1=A.F  A                                * 29759
        GOSUB   SUB_2980F                        * 2975F
        GONC    L_2977F                          * 29763
L_29766:
        A=R0.F  A                                * 29766
        ?A#0    A                                * 2976C
        GOYES   L_297AC                          * 2976F
        A=R1.F  A                                * 29771
        ?A=0    A                                * 29777
        GOYES   L_297B6                          * 2977A
        GONC    L_297AC                          * 2977C
L_2977F:
        GOSUB   SUB_297EA                        * 2977F
        RSTK=C                                   * 29783
        D1=D1+  10                               * 29785
        C=DAT1  A                                * 29788
        CD1EX                                    * 2978B
        D1=D1+  5                                * 2978E
        A=DAT1  A                                * 29791
        D1=C                                     * 29794
        C=R0.F  A                                * 29797
        ?C=0    A                                * 2979D
        GOYES   L_297C3                          * 297A0
        ?C>=A   A                                * 297A2
        GOYES   L_297C3                          * 297A5
        C=RSTK                                   * 297A7
        D1=C                                     * 297A9
L_297AC:
        A=DAT0  A                                * 297AC
        D0=D0+  5                                * 297AF
        PC=(A)                                   * 297B2
L_297B6:
        LC(5)   SKIP                             * 297B6
        A=C     A                                * 297BD
        PC=(A)                                   * 297BF
L_297C3:
        C=R1.F  A                                * 297C3
        ?C=0    A                                * 297C9
        GOYES   L_297E1                          * 297CC
        ?A=0    A                                * 297CE
        GOYES   L_297E1                          * 297D1
        ?C>=A   A                                * 297D3
        GOYES   L_297E1                          * 297D6
        C=R2.F  A                                * 297D8
        DAT1=C  A                                * 297DE
L_297E1:
        C=RSTK                                   * 297E1
        D1=C                                     * 297E3
        GOTO    L_297B6                          * 297E6

* refs (2): 2977F 29855
SUB_297EA:
        C=DAT1  A                                * 297EA
        CD1EX                                    * 297ED
        RSTK=C                                   * 297F0
        D1=D1+  5                                * 297F2
        A=DAT1  A                                * 297F5
        A=A+CON A,4                              * 297F8
        C=A     A                                * 297FE
        A=A+A   A                                * 29800
        A=A+A   A                                * 29802
        A=A+C   A                                * 29804
        C=RSTK                                   * 29806
        A=A+C   A                                * 29808
        D1=A                                     * 2980A
        RTN                                      * 2980D

* refs (2): 2975F 2984A
SUB_2980F:
        LC(5)   #80850                           * 2980F
        CD1EX                                    * 29816
        A=DAT1  1                                * 29819
        D1=C                                     * 2981D
        ?ABIT=1 0                                * 29820
        RTNYES                                   * 29825
        RTN                                      * 29827

* refs (1): 29480
OBJ_29829:
        CON(5)  (*)+5                            * 29829  primitive code object
        C=DAT1  A                                * 2982E
        R2=C.F  A                                * 29831
        GOSBVL  POP2#                            * 29837
        R1=C.F  A                                * 2983E
        R0=A.F  A                                * 29844
        GOSUB   SUB_2980F                        * 2984A
        GONC    L_29855                          * 2984E
        GOTO    L_29766                          * 29851
L_29855:
        GOSUB   SUB_297EA                        * 29855
        RSTK=C                                   * 29859
        C=DAT1  A                                * 2985B
        CD1EX                                    * 2985E
        D1=D1+  5                                * 29861
        A=DAT1  A                                * 29864
        D1=C                                     * 29867
        C=R0.F  A                                * 2986A
        ?C=0    A                                * 29870
        GOYES   L_29883                          * 29873
        ?C>A    A                                * 29875
        GOYES   L_29883                          * 29878
        C=RSTK                                   * 2987A
        D1=C                                     * 2987C
        GOTO    L_297AC                          * 2987F
L_29883:
        C=R1.F  A                                * 29883
        ?C=0    A                                * 29889
        GOYES   L_298A1                          * 2988C
        ?A=0    A                                * 2988E
        GOYES   L_298A1                          * 29891
        ?C>=A   A                                * 29893
        GOYES   L_298A1                          * 29896
        C=R2.F  A                                * 29898
        DAT1=C  A                                * 2989E
L_298A1:
        C=RSTK                                   * 298A1
        D1=C                                     * 298A3
        GOTO    L_297B6                          * 298A6
        RPL

* refs (1): 34FED
OBJ_298AA:
        :: NULLHXS 3PICK BINT5 #* EXPAND SWAP OBJ_298D7 ; * 298AA

* refs (1): 298CD
OBJ_298D7:
        CON(5)  (*)+5                            * 298D7  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 298DC
        C=DAT1  A                                * 298E3
        R0=C.F  A                                * 298E6
        D1=D1+  5                                * 298EC
        C=DAT1  A                                * 298EF
        D0=C                                     * 298F2
        D1=D1+  5                                * 298F5
        C=DAT1  A                                * 298F8
        CD1EX                                    * 298FB
        D1=D1+  5                                * 298FE
        A=DAT1  A                                * 29901
        D1=C                                     * 29904
        R1=A.F  A                                * 29907
        B=A     A                                * 2990D
        D0=D0+  5                                * 2990F
        C=DAT0  A                                * 29912
        AD0EX                                    * 29915
        A=A+C   A                                * 29918
        D0=A                                     * 2991A
        B=B-1   A                                * 2991D
        LC(5)   CMOS                             * 2991F
        D=C     A                                * 29926
L_29928:
        D1=D1+  5                                * 29928
        D0=D0-  5                                * 2992B
        C=DAT1  A                                * 2992E
        ?D<=C   A                                * 29931
        GOYES   L_29973                          * 29934
L_29936:
        DAT0=C  A                                * 29936
        B=B-1   A                                * 29939
        GONC    L_29928                          * 2993B
        D0=D0-  10                               * 2993E
        CD0EX                                    * 29941
        DAT1=C  A                                * 29944
        LC(5)   DSKTOP                           * 29947
        CD1EX                                    * 2994E
        DAT1=C  A                                * 29951
        GOSBVL  GETPTR                           * 29954
        C=R1.F  A                                * 2995B
        C=C+CON A,2                              * 29961
        D=D+C   A                                * 29967
        A=DAT0  A                                * 29969
        D0=D0+  5                                * 2996C
        PC=(A)                                   * 2996F
L_29973:
        A=R0.F  A                                * 29973
        A=A-C   A                                * 29979
        GONC    L_29985                          * 2997B
        C=A     A                                * 2997E
        A=A+A   A                                * 29980
        GOC     L_29936                          * 29982
L_29985:
        GOSBVL  GETPTR                           * 29985
        GOVLNG  DOMEMERR                         * 2998C

* refs (1): 34EDA
OBJ_29993:
        CON(5)  (*)+5                            * 29993  primitive code object
        GOSBVL  SAVPTR                           * 29998
        ST=0    4                                * 2999F
L_299A2:
        D1=D1+  5                                * 299A2
        C=DAT1  A                                * 299A5
        CD1EX                                    * 299A8
        D=C     A                                * 299AB
        D1=D1+  5                                * 299AD
        A=DAT1  A                                * 299B0
        B=A     A                                * 299B3
        GOSBVL  ROOM                             * 299B5
        ?B<C    A                                * 299BC
        GOYES   L_299EF                          * 299BF
        ?ST=0   4                                * 299C1
        GOYES   L_299D4                          * 299C4
        GOSBVL  GETPTR                           * 299C6
        GOVLNG  DOMEMERR                         * 299CD
L_299D4:
        GOSBVL  GARBAGECOL                       * 299D4  inline data follows
        D1=(5)  DSKTOP                           * 299DB
        C=DAT1  A                                * 299E2
        D1=C                                     * 299E5
        ST=1    4                                * 299E8
        GOTO    L_299A2                          * 299EB
L_299EF:
        C=D     A                                * 299EF
        D0=C                                     * 299F1
        D0=D0-  5                                * 299F4
        A=DAT0  A                                * 299F7
        D0=D0+  5                                * 299FA
        D1=D1+  9                                * 299FD
        B=B-CON A,10                             * 29A00
        D=0     A                                * 29A06
L_29A08:
        C=DAT1  S                                * 29A08
        D1=D1-  4                                * 29A0C
        C=DAT1  A                                * 29A0F
        C=C+C   S                                * 29A12
        GONC    L_29A1A                          * 29A15
        C=A-C   A                                * 29A18
L_29A1A:
        DAT0=C  A                                * 29A1A
        D0=D0-  5                                * 29A1D
        D1=D1+  9                                * 29A20
        D=D+1   A                                * 29A23
        B=B-CON A,5                              * 29A25
        GONC    L_29A08                          * 29A2B
        D0=D0+  5                                * 29A2E
        D1=(5)  DSKTOP                           * 29A31
        CD0EX                                    * 29A38
        DAT1=C  A                                * 29A3B
        C=D     A                                * 29A3E
        R0=C                                     * 29A40
        GOSBVL  ADJMEM                           * 29A43
        GOVLNG  PUSH#LOOP                        * 29A4A

* refs (1): 28B4B
OBJ_29A51:
        CON(5)  (*)+5                            * 29A51  primitive code object
        LC(5)   #8010h+5                         * 29A56  moved into D1
        CD1EX                                    * 29A5D
        A=DAT1  A                                * 29A60
        A=A-1   A                                * 29A63
        CD1EX                                    * 29A65
        A=A+C   A                                * 29A68
        AD1EX                                    * 29A6A
        C=0     A                                * 29A6D
        C=DAT1  1                                * 29A6F
        D1=A                                     * 29A73
        C=C+C   A                                * 29A76
        A=C     A                                * 29A78
        A=A+A   A                                * 29A7A
        A=A+A   A                                * 29A7C
        A=A+C   A                                * 29A7E
        LC(5)   BINT0                            * 29A80
        A=A+C   A                                * 29A87
        PC=(A)                                   * 29A89

* refs (2): 28BD2 730E6
nextsym'R:
        CON(5)  (*)+5                            * 29A8D  primitive code object
        C=B     A                                * 29A92
        CD0EX                                    * 29A94
        RSTK=C                                   * 29A97
        D0=D0-  10                               * 29A99
L_29A9C:
        C=DAT0  A                                * 29A9C
        CD0EX                                    * 29A9F
        A=DAT0  A                                * 29AA2
        D0=C                                     * 29AA5
L_29AA8:
        LC(5)   SEMI                             * 29AA8
        ?C#A    A                                * 29AAF
        GOYES   L_29ACE                          * 29AB2
        D0=D0+  5                                * 29AB4
        A=DAT0  A                                * 29AB7
        D0=D0-  5                                * 29ABA
        DAT0=A  A                                * 29ABD
        D0=D0-  5                                * 29AC0
        B=B-CON A,5                              * 29AC3
        D=D+1   A                                * 29AC9
        GONC    L_29A9C                          * 29ACB
L_29ACE:
        LC(5)   DOSYMB                           * 29ACE
        ?C#A    A                                * 29AD5
        GOYES   L_29B1E                          * 29AD8
        GOSUB   SUB_29B73                        * 29ADA
        A=DAT0  10                               * 29ADE
        A=A+CON A,5                              * 29AE2
        D0=D0+  5                                * 29AE8
        DAT0=A  10                               * 29AEB
        B=B+CON A,5                              * 29AEF
        D0=D0-  5                                * 29AF5
        A=DAT0  A                                * 29AF8
        AD0EX                                    * 29AFB
        R0=A.F  A                                * 29AFE
        GOSBVL  SKIPOB                           * 29B04
        A=R0.F  A                                * 29B0B
        AD0EX                                    * 29B11
        DAT0=A  A                                * 29B14
        D0=D0+  5                                * 29B17
        GOTO    L_29A9C                          * 29B1A
L_29B1E:
        GOSUB   SUB_29B73                        * 29B1E
        C=DAT0  A                                * 29B22
        R0=C.F  A                                * 29B25
        CD0EX                                    * 29B2B
        R1=C.F  A                                * 29B2E
        GOSBVL  SKIPOB                           * 29B34
        A=R0.F  A                                * 29B3B
        C=R1.F  A                                * 29B41
        CD0EX                                    * 29B47
        DAT0=C  A                                * 29B4A
        C=C-CON A,5                              * 29B4D
        ?C#A    A                                * 29B53
        GOYES   L_29B5E                          * 29B56
        D0=A                                     * 29B58
        A=DAT0  A                                * 29B5B
L_29B5E:
        D1=D1-  5                                * 29B5E
        DAT1=A  A                                * 29B61
        C=RSTK                                   * 29B64
        D0=C                                     * 29B66
        A=DAT0  A                                * 29B69
        D0=D0+  5                                * 29B6C
        PC=(A)                                   * 29B6F

* refs (2): 29ADA 29B1E
SUB_29B73:
        ST=0    7                                * 29B73
L_29B76:
        D=D-1   A                                * 29B76
        RTNNC                                    * 29B78
        C=RSTK                                   * 29B7B
        A=C     A                                * 29B7D
        C=RSTK                                   * 29B7F
        D0=C                                     * 29B81
        CAEX    A                                * 29B84
        RSTK=C                                   * 29B86
        ?ST=0   7                                * 29B88
        GOYES   L_29B94                          * 29B8B
        GOVLNG  DOMEMERR                         * 29B8D
L_29B94:
        GOSBVL  SAVPTR                           * 29B94
        GOSBVL  GARBAGECOL                       * 29B9B  inline data follows
        GOSBVL  GETPTR                           * 29BA2
        A=B     A                                * 29BA9
        AD0EX                                    * 29BAB
        D0=D0-  10                               * 29BAE
        C=RSTK                                   * 29BB1
        CAEX    A                                * 29BB3
        RSTK=C                                   * 29BB5
        CAEX    A                                * 29BB7
        RSTK=C                                   * 29BB9
        ST=1    7                                * 29BBB
        GOTO    L_29B76                          * 29BBE

* refs (1): 28C04
subpdcdptch:
        CON(5)  (*)+5                            * 29BC2  primitive code object
        A=DAT1  A                                * 29BC7
        LC(5)   xFCNAPPLY                        * 29BCA
        ?C=A    A                                * 29BD1
        GOYES   L_29C53                          * 29BD4
        D0=D0+  5                                * 29BD6
        AD1EX                                    * 29BD9
        C=DAT1  A                                * 29BDC
        D1=(5)  DOREAL                           * 29BDF
        AD1EX                                    * 29BE6
        ?C#A    A                                * 29BE9
        GOYES   L_29C0D                          * 29BEC
        A=DAT1  A                                * 29BEE
        AD1EX                                    * 29BF1
        D1=D1+  5                                * 29BF4
        D1=D1+  15                               * 29BF7
        C=DAT1  S                                * 29BFA
        D1=A                                     * 29BFE
        ?C#0    S                                * 29C01
        GOYES   L_29C53                          * 29C04
        D0=D0+  10                               * 29C06
        GOTO    L_29C53                          * 29C09
L_29C0D:
        D0=D0+  5                                * 29C0D
        A=C     A                                * 29C10
        LC(5)   DOEXT                            * 29C12
        ?C=A    A                                * 29C19
        GOYES   L_29C53                          * 29C1C
        D0=D0+  5                                * 29C1E
        LC(5)   DOCOL                            * 29C21
        ?C#A    A                                * 29C28
        GOYES   L_29C53                          * 29C2B
        D0=D0+  5                                * 29C2D
        A=DAT1  A                                * 29C30
        LC(5)   CMOS                             * 29C33
        ?C<=A   A                                * 29C3A
        GOYES   L_29C53                          * 29C3D
        AD1EX                                    * 29C3F
        D1=D1-  7                                * 29C42
        C=DAT1  4                                * 29C45
        D1=A                                     * 29C49
        ?CBIT=0 3                                * 29C4C
        GOYES   L_29C60                          * 29C51
L_29C53:
        LC(5)   COLA                             * 29C53
        A=C     A                                * 29C5A
        PC=(A)                                   * 29C5C
L_29C60:
        CSR     A                                * 29C60
        A=C     X                                * 29C62
        LC(3)   #002                             * 29C65
        ?C#A    X                                * 29C6A
        GOYES   L_29C53                          * 29C6D
        D0=D0+  5                                * 29C6F
        A=DAT0  A                                * 29C72
        D0=D0+  5                                * 29C75
        PC=(A)                                   * 29C78

* refs (2): 2941C 2952F
OBJ_29C7C:
        CON(5)  (*)+5                            * 29C7C  primitive code object
        GOSBVL  SAVPTR                           * 29C81
        D1=D1+  15                               * 29C88
        C=DAT1  A                                * 29C8B
        CD1EX                                    * 29C8E
        D1=D1+  5                                * 29C91
        A=DAT1  A                                * 29C94
        D1=C                                     * 29C97
        D1=D1-  15                               * 29C9A
        A=A+1   A                                * 29C9D
        R0=A.F  A                                * 29C9F
        GOSBVL  PUSH#                            * 29CA5
        C=DAT1  A                                * 29CAC
        D=D+1   A                                * 29CAF
        D1=D1+  15                               * 29CB1
        D1=D1+  5                                * 29CB4
        DAT1=C  A                                * 29CB7
        D1=D1-  15                               * 29CBA
        A=DAT0  A                                * 29CBD
        D0=D0+  5                                * 29CC0
        PC=(A)                                   * 29CC3

* refs (1): 28C6D
OBJ_29CC7:
        CON(5)  (*)+5                            * 29CC7  primitive code object
        D=D-1   A                                * 29CCC
        GONC    L_29CF4                          * 29CCE
        GOSBVL  SAVPTR                           * 29CD1
        GOSBVL  GARBAGECOL                       * 29CD8  inline data follows
        GOSBVL  GETPTR                           * 29CDF
        D=D-1   A                                * 29CE6
        GONC    L_29CF4                          * 29CE8
        D=D+1   A                                * 29CEB
        GOVLNG  DOMEMERR                         * 29CED
L_29CF4:
        D1=D1-  5                                * 29CF4
        GOSBVL  SAVPTR                           * 29CF7
        D1=D1+  10                               * 29CFE
        C=DAT1  A                                * 29D01
        B=C     A                                * 29D04
        D1=D1+  5                                * 29D06
        A=DAT1  10                               * 29D09
        D1=D1+  5                                * 29D0D
        LC(5)   BINT1                            * 29D10
        DAT1=C  A                                * 29D17
        D1=D1-  10                               * 29D1A
        DAT1=A  10                               * 29D1D
        D1=D1+  5                                * 29D21
        C=DAT1  A                                * 29D24
        D1=D1-  15                               * 29D27
        DAT1=C  A                                * 29D2A
        D1=A                                     * 29D2D
        D1=D1+  5                                * 29D30
        A=DAT1  A                                * 29D33
        C=B     A                                * 29D36
        D1=C                                     * 29D38
        D1=D1+  5                                * 29D3B
        C=DAT1  A                                * 29D3E
        C=C-A   A                                * 29D41
        C=C+1   A                                * 29D43
        R0=C.F  A                                * 29D45
        GOSBVL  PUSH#                            * 29D4B
        LC(5)   2PUTLAM                          * 29D52
        A=C     A                                * 29D59
        PC=(A)                                   * 29D5B

* refs (1): 28CFE
OBJ_29D5F:
        CON(5)  (*)+5                            * 29D5F  primitive code object
        D1=D1+  15                               * 29D64
        A=DAT1  A                                * 29D67
        R1=A.F  A                                * 29D6A
        D1=D1+  10                               * 29D70
        A=DAT1  A                                * 29D73
        D1=D1+  15                               * 29D76
        C=DAT1  A                                * 29D79
        DAT1=A  A                                * 29D7C
        D1=D1-  5                                * 29D7F
        A=R1.F  A                                * 29D82
        DAT1=A  A                                * 29D88
        CAEX    A                                * 29D8B
        GOSBVL  SAVPTR                           * 29D8D
        D1=A                                     * 29D94
        D1=D1+  5                                * 29D97
        A=DAT1  A                                * 29D9A
        A=A+1   A                                * 29D9D
        A=A+1   A                                * 29D9F
        R0=A.F  A                                * 29DA1
        GOVLNG  PUSH#LOOP                        * 29DA7
        NIBHEX  3D22000                          * 29DAE  Ó".

LIB003:
        CON(3)  #003                             * 29DB5  library number
        CON(5)  0                                * 29DB8  hash table
        REL(5)  LIB003.message                   * 29DBD  message table
        CON(5)  0                                * 29DC2  link table
        CON(5)  0                                * 29DC7  config

* Error 301h
POSFLOWERR:
        CON(5)  (*)+5                            * 29DCC  primitive code object

* refs (1): 29DCC
DoErrPU:
        LC(5)   posunferr                        * 29DD1
        GOTO    L_29E18                          * 29DD8

* Error 302h
NEGFLOWERR:
        CON(5)  (*)+5                            * 29DDC  primitive code object

* refs (1): 29DDC
DoErrNU:
        LC(5)   negunferr                        * 29DE1
        GOTO    L_29E18                          * 29DE8

* Error 303h
OVERFLOWERR:
        CON(5)  (*)+5                            * 29DEC  primitive code object
        LC(5)   ofloerr                          * 29DF1
        GOTO    L_29E18                          * 29DF8

* Error 304h
* refs (3): 3643A 524E8 9799A
SETIVLERR:
        CON(5)  (*)+5                            * 29DFC  primitive code object

* refs (1): 29DFC
DoErrUR:
        LC(5)   #00304                           * 29E01
        GOTO    L_29E18                          * 29E08

* Error 305h
* refs (1): 5204E
INFRESERR:
        CON(5)  (*)+5                            * 29E0C  primitive code object

* refs (1): 29E0C
DoErrIR:
        LC(5)   infreserr                        * 29E11
L_29E18:
        A=C     A                                * 29E18
        GOVLNG  Errjmp                           * 29E1A

* ( x -> A ) Converts %% to %.If SB is clear uses roundup, if set uses lowest nibble in % field to determine rounding direction. Obeys and sets flow flags/indicators
* refs (2): 2AEE9 79ECF
PACKSB:
        P=      0                                * 29E21
        ?B#0    M                                * 29E23
        GOYES   L_29E2D                          * 29E26
        A=0     W                                * 29E28
        RTN                                      * 29E2B
L_29E2D:
        B=B+B   X                                * 29E2D
        GONC    L_29E74                          * 29E30
        C=0     M                                * 29E33
        C=C+1   M                                * 29E36
        ?B#0    X                                * 29E39
        GOYES   L_29E65                          * 29E3C
        ?SB=0                                    * 29E3E
        GOYES   L_29E61                          * 29E41
        GONC    L_29E65                          * 29E43

* ( x -> A ) <REF>PACKSB without rounding 
* refs (22): 23313 2AEDB 2C11B 2CD97 35AE0 5060D ...
PACK:
        P=      0                                * 29E46
        ?B#0    M                                * 29E48
        GOYES   L_29E52                          * 29E4B
        A=0     W                                * 29E4D
        RTN                                      * 29E50
L_29E52:
        B=B+B   X                                * 29E52
        GONC    L_29E74                          * 29E55
        C=0     M                                * 29E58
        C=C+1   M                                * 29E5B
        GONC    L_29E65                          * 29E5E
L_29E61:
        C=C&B   M                                * 29E61
L_29E65:
        B=B+C   M                                * 29E65
        GONC    L_29E74                          * 29E68
        P=      14                               * 29E6B
        B=B+1   P                                * 29E6D
        P=      0                                * 29E70
        A=A+1   A                                * 29E72
L_29E74:
        C=A     A                                * 29E74
        C=C+C   A                                * 29E76
        GOC     L_29E8C                          * 29E78
        LC(5)   #00499                           * 29E7B
        ?C<A    A                                * 29E82
        GOYES   L_29EEC                          * 29E85
L_29E87:
        A=B     M                                * 29E87
        RTN                                      * 29E8A
L_29E8C:
        LC(5)   #99501                           * 29E8C
        ?C<=A   A                                * 29E93
        GOYES   L_29E87                          * 29E96
        D0=(5)  #80847                           * 29E98
        A=DAT0  B                                * 29E9F
        ?ABIT=0 3                                * 29EA2
        GOYES   L_29EBE                          * 29EA7
        LC(5)   posunferr                        * 29EA9
        ?A=0    S                                * 29EB0
        GOYES   L_29EB7                          * 29EB3
        C=C+1   A                                * 29EB5
L_29EB7:
        GOVLNG  GPErrjmpC                        * 29EB7
L_29EBE:
        ?A#0    S                                * 29EBE
        GOYES   L_29ED5                          * 29EC1
        D0=(5)  #80848                           * 29EC3
        A=DAT0  B                                * 29ECA
        ABIT=1  3                                * 29ECD
        GONC    L_29EE4                          * 29ED2
L_29ED5:
        D0=(5)  #80848                           * 29ED5
        A=DAT0  B                                * 29EDC
        ABIT=1  2                                * 29EDF
L_29EE4:
        DAT0=A  B                                * 29EE4
        A=0     W                                * 29EE7
        RTN                                      * 29EEA
* a branch also enters #29EF1, where the nibbles decode as CLRST
L_29EEC:
        D0=(5)  #80848                           * 29EEC
        A=DAT0  B                                * 29EF3
        ?ABIT=0 0                                * 29EF6
        GOYES   L_29F07                          * 29EFB
        LC(5)   ofloerr                          * 29EFD
        GONC    L_29EB7                          * 29F04
L_29F07:
        D0=(5)  #80849                           * 29F07
        A=DAT0  B                                * 29F0E
        ABIT=1  0                                * 29F11
        DAT0=A  B                                * 29F16
        LC(3)   #499                             * 29F19
        A=C     X                                * 29F1E
        A=0     M                                * 29F21
        A=-A-1  M                                * 29F24
        RTN                                      * 29F27
        P=      0                                * 29F29
        ?B#0    M                                * 29F2B
        GOYES   L_29F35                          * 29F2E
        A=0     W                                * 29F30
        RTN                                      * 29F33
L_29F35:
        B=B+B   X                                * 29F35
        GONC    L_29F4A                          * 29F38
        B=B+1   M                                * 29F3B
        GONC    L_29F4A                          * 29F3E
        P=      14                               * 29F41
        B=B+1   P                                * 29F43
        P=      0                                * 29F46
        A=A+1   A                                * 29F48
L_29F4A:
        C=A     A                                * 29F4A
        C=C+C   A                                * 29F4C
        GOC     L_29F62                          * 29F4E
        LC(5)   #00499                           * 29F51
        ?C<A    A                                * 29F58
        GOYES   L_29F72                          * 29F5B
L_29F5D:
        A=B     M                                * 29F5D
        RTN                                      * 29F60
L_29F62:
        LC(5)   #99501                           * 29F62
        ?C<=A   A                                * 29F69
        GOYES   L_29F5D                          * 29F6C
        GOTO    L_29EBE                          * 29F6E
L_29F72:
        GOTO    L_29F07                          * 29F72

* refs (6): 3443F 34C3E 37239 535A7 789F1 7D6CB
SUB_29F76:
        P=      0                                * 29F76
        ?B#0    M                                * 29F78
        GOYES   L_29F82                          * 29F7B
        A=0     W                                * 29F7D
        RTN                                      * 29F80
L_29F82:
        B=B+B   X                                * 29F82
        GONC    L_29F97                          * 29F85
        B=B+1   M                                * 29F88
        GONC    L_29F97                          * 29F8B
        P=      14                               * 29F8E
        B=B+1   P                                * 29F90
        P=      0                                * 29F93
        A=A+1   A                                * 29F95
L_29F97:
        C=A     A                                * 29F97
        C=C+C   A                                * 29F99
        GOC     L_29FAF                          * 29F9B
        LC(5)   #00499                           * 29F9E
        ?C<A    A                                * 29FA5
        GOYES   L_29FC0                          * 29FA8
L_29FAA:
        A=B     M                                * 29FAA
        RTN                                      * 29FAD
L_29FAF:
        LC(5)   #99501                           * 29FAF
        ?C<=A   A                                * 29FB6
        GOYES   L_29FAA                          * 29FB9
        A=0     W                                * 29FBB
        RTN                                      * 29FBE
L_29FC0:
        LC(3)   #499                             * 29FC0
        A=C     X                                * 29FC5
        A=0     M                                * 29FC8
        A=-A-1  M                                * 29FCB
        RTN                                      * 29FCE

* ( %pop -> x ) Pop %, convert to %%, <REF>SAVPTR
* refs (5): 0CE14 2AEA2 3523B 3726C 5066E
POP1%SPLITA:
        GOSUB   POP1%                            * 29FD0
        GOLONG  SPLITA                           * 29FD4

* ( %pop -> A ) Pop %, <REF>SAVPTR
* refs (17): 0D8B0 0D92C 0EEE9 14169 18CDC 18CEF ...
POP1%:
        C=DAT1  A                                * 29FDA
        CD1EX                                    * 29FDD
        D1=D1+  5                                * 29FE0
        A=DAT1  W                                * 29FE3
        D1=C                                     * 29FE7
        D1=D1+  5                                * 29FEA
        D=D+1   A                                * 29FED
        SETDEC                                   * 29FEF

* refs (1): 2A22E
SAVPTR~jump_11:
        GOVLNG  SAVPTR                           * 29FF1

* refs (2): 2AEA9 34C99
Pop%ACSrSep:
        GOSUB   POP2%                            * 29FF8
        GOLONG  SPLTAC                           * 29FFC
