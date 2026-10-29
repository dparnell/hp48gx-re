* HP 48GX ROM revision R, #24028-#27028: Parser and compiler
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: nultrior 'Rapndit GetNextToken 4psh 6rolld;1+(s5) GETPTRFALSE ?OKINALG _END__253D6 DaDGNTc drop2;6rolld;1+(s5) ngsizecase delimcase
* Follows on from the previous file (at #24028 in the original ROM).
        RPL

* refs (2): 23FFB 2400A
OBJ_24028:
        :: OBJ_252CD 'Rapndit xWHILEEND TrueTrue ; * 24028

* refs (1): 2342F
OBJ_24046:
        :: 'Rapndit xIFERR ~BINT0;5UNROLL COLA OBJ_24069 * 24046
        ;                                        * 24064

* refs (2): 2405F 24096
OBJ_24069:
        :: nultrior failed _THEN_ tok8trior OBJ_240A0 OBJ_23A2E !*triand * 24069
          COLA OBJ_24069                         * 24091
        ;                                        * 2409B

* refs (1): 24082
OBJ_240A0:
        :: OBJ_2525A 4psh DROP drop2;6rolld;1+(s5) 'Rapndit xERRTHEN * 240A0
          ~BINT0;5UNROLL COLA OBJ_240D7          * 240C3
        ;                                        * 240D2

* refs (2): 240CD 24113
OBJ_240D7:
        :: nultrior OBJ_2417C _END__253D6 tok8trior OBJ_2417C _ELSE_ * 240D7
          tok8trior OBJ_2411D OBJ_23A2E !*triand COLA OBJ_240D7 * 240FA
        ;                                        * 24118

* refs (1): 240FF
OBJ_2411D:
        :: OBJ_252CD 'Rapndit xELSE ~BINT0;5UNROLL COLA OBJ_24145 * 2411D
        ;                                        * 24140

* refs (2): 2413B 24172
OBJ_24145:
        :: nultrior OBJ_2417C _END__253D6 tok8trior OBJ_2417C OBJ_23A2E * 24145
          !*triand COLA OBJ_24145                * 24168
        ;                                        * 24177

* refs (4): 240E1 240F0 2414F 2415E
OBJ_2417C:
        :: OBJ_252CD 'Rapndit xIFEND TrueTrue ;  * 2417C

* refs (2): 23022 234F8
OBJ_2419A:
        :: ~BINT0;5UNROLL OBJ_23E52 !*triand COLA OBJ_241BD * 2419A
        ;                                        * 241B8

* refs (2): 241B3 241F9
OBJ_241BD:
        :: nultrior failed tok' tok8cktrior OBJ_24203 tok<< tok8trior * 241BD
          OBJ_24280 OBJ_23E52 !*triand COLA OBJ_241BD * 241E5
        ;                                        * 241FE

* refs (1): 241D6
OBJ_24203:
        ::                                       * 24203

* refs (1): 24285
OBJ_24208:
          :: 4psh P{}N DUPDUP INNERCOMP #1+ROLL BIND INNERCOMP ; SWAPUnDROP * 24208
          OBJ_2472B ABND !*triand BINT4 ' xALG-> psh1& unrot SWAP symcomp * 2423A
          SWAP top& swapB;drop;2true ;           * 2426C

* refs (1): 241E5
OBJ_24280:
        :: OBJ_24208 ' x<< SWAP#1+ SWAPUnDROP OBJ_242D0 ABND !*triand BINT4 * 24280
          ' xRPN-> psh1& roll2top& swapB;drop;2true ; * 242B2

* refs (2): 2429E 242FD
OBJ_242D0:
        :: nultrior ~'Rapndit;x>>ABND;TrueTrue tok>> tok8trior * 242D0
          ~'Rapndit;x>>ABND;TrueTrue OBJ_23A2E !*triand COLA OBJ_242D0 * 242E9
        ;                                        * 24302

* refs (2): 242DA 242E9
~'Rapndit;x>>ABND;TrueTrue:
        :: 'Rapndit x>>ABND TrueTrue ;           * 24307

* refs (1): 2348B
~'Rapndit;xHALT;TrueTrue:
        :: 'Rapndit xHALT TrueTrue ;             * 24320

* refs (1): 2385B
~'Rapndit;xPROMPT;TrueTrue:
        :: 'Rapndit xPROMPT TrueTrue ;           * 24339

* refs (3): 2452D 24C5D 24E1F
OBJ_24352:
        :: OBJ_24384 !*trior TrueTrue OBJ_24537 !*trior TrueTrue COLA * 24352
          OBJ_2469F                              * 2437A
        ;                                        * 2437F

* refs (2): 23A42 24357
OBJ_24384:
        :: ?ATTNQUIT nultrior FALSE OBJ_25D03 !*trior OBJ_24447 tok' * 24384
          tok8cktrior OBJ_2472B toklparen tok8trior OBJ_2478A tok[ tok8trior * 243AC
          OBJ_24816 tok{ tok8trior List toksharp tok8cktrior OBJ_24C9E * 243CF
          tokquote tok8cktrior ~getmatchtok;DaDGNTc _:__253B8 tok8cktrior * 243F2
          OBJ_244A1 _DIR tok8trior OBJ_24D20 tokCTSTR tok8trior OBJ_24FE6 * 2440B
          tokCTGROB tok8trior OBJ_25B3D FALSE ;  * 2442E

* refs (1): 243A2
OBJ_24447:
        :: tokuscore tok8cktrior OBJ_24465 TrueTrue ; * 24447

* refs (1): 24456
OBJ_24465:
        :: OBJ_26058 OBJ_25AB6 OBJ_28706 !*triand OBJ_28972 x* !*triand * 24465
          OBJ_25D3A OBJ_25AD4 TrueTrue ;         * 2448D

* refs (1): 2440B
OBJ_244A1:
        :: getmatchtok DUPLEN$ BINT253 #>case failed * 244A1
          DaDGNTc 2DROP OBJ_244F6 !*triand 4psh #1- SWAPROT >TAG SWAP * 244BF
          swapB;drop;2true ;                     * 244EC

* refs (1): 244C9
OBJ_244F6:
        :: tok<< tok8trior                       * 244F6
          :: ~BINT0;5UNROLL 'Rapndit x<< COLA OBJ_23DFD * 24505
          ;                                      * 24523
          COLA OBJ_24352                         * 24528
        ;                                        * 24532

* refs (1): 24366
OBJ_24537:
        :: ~;eval;q                              * 24537

* refs (1): 245E6
OBJ_24541:
          :: ngsizecase FALSE                    * 24541
            OBJ_24609 !*trior TrueTrue DROP COMPILEID NOTcsdrpfls DUP * 24550
            OBJ_2699F NOTcase OBJ_24681          * 24573
            OBJ_26917 NOTcase failed             * 24582
            RDROP ;                              * 24591
          BINT5 pshzer                           * 2459B

* refs (1): 245F0
OBJ_245A5:
          :: UNROLL DROP GetNextToken 5ROLL ; EVAL !*triand * 245A5
          ~4psh;P::N;drop2;6rolld;1+(s5) TrueTrue ; * 245CD

* refs (1): 23A51
OBJ_245DC:
        :: ~;eval;q OBJ_24541 BINT5 OBJ_245A5 EVAL !*triand TrueTrue ; * 245DC

* refs (3): 24550 2745E 687D3
OBJ_24609:
        :: delimcase                             * 24609
          :: DUP$>ID FalseFalse ;                * 24613
          DUP$>ID OBJ_72DC5 DUP@ casedrop OBJ_24681 * 24627
          OBJ_2464F TrueFalse ;                  * 24640

* refs (1): 24640
OBJ_2464F:
        CON(5)  (*)+5                            * 2464F  primitive code object
        ASSEMBLE
        LC(5)   DOIDNT                           * 24654
        GOTO    L_2466B                          * 2465B

        CON(5)  (*)+5                            * 2465F  primitive code object
        LC(5)   DOLAM                            * 24664
L_2466B:
        A=DAT1  A                                * 2466B
        AD1EX                                    * 2466E
        DAT1=C  A                                * 24671
        AD1EX                                    * 24674
        A=DAT0  A                                * 24677
        D0=D0+  5                                * 2467A
        PC=(A)                                   * 2467D
        RPL

* refs (5): 2457D 2463B 27675 68837 72E01
OBJ_24681:
        :: 6rolld;1+(s5) DROP GetNextToken TrueTrue ; * 24681

* refs (2): 23A65 2437A
OBJ_2469F:
        :: OBJ_246BD !*trior DaDGNTc failed ;    * 2469F

* refs (2): 23E61 246A4
OBJ_246BD:
        :: ~;eval;q OBJ_27EE0 OBJ_25F4E SWAPONE OBJ_25A93 delimcase * 246BD
          4dropn;false;true                      * 246E0
          DROP OBJ_25A93 nultrior                * 246E5
          :: 4DROP $>ID TrueTrue ; 4dropn;false;true ; * 246F4

* refs (2): 246E0 2470D
4dropn;false;true:
        :: 4DROP failed ;                        * 24717

* refs (3): 23A74 2423A 243B1
OBJ_2472B:
        :: OBJ_25F4E OBJ_25AB6 nultrior OBJ_24771 tok' tok8cktrior OBJ_24771 * 2472B
          OBJ_2729B !*triand OBJ_25D3A OBJ_25AB6 TrueTrue ; * 24753

* refs (2): 2473F 2474E
OBJ_24771:
        :: OBJ_25D3A OBJ_25AB6 FALSE ;           * 24771

* refs (2): 243C0 24997
OBJ_2478A:
        :: ~BINT0;5UNROLL OBJ_25D03 !*triand     * 2478A
          :: tokanglesign tok8trior FALSE TRUE ; 6rolld;1+(s5) OBJ_25D03 * 2479E
          !*triand                               * 247C6
          :: nultrior TrueTrue tokrparen OBJ_0BC15 ; !*triand 4psh DROPSWAP * 247CB
          ?SKIP %POL>%REC                        * 247F8
          %>C% drop2;6rolld;1+(s5) TrueTrue ;    * 24802

* refs (1): 243CF
OBJ_24816:
        :: nultrior failed tok[ tok8trior OBJ_249C9 tok] tok8trior failed * 24816
          ~BINT0;5UNROLL OBJ_2489D !*triand 4psh UNCOERCE ONE{}N XEQ>ARRAY * 24843
          drop2;6rolld;1+(s5) TrueTrue ;         * 24866

        :: nultrior TrueTrue tok] tok8trior TrueTrue FALSE ; * 24875

* refs (1): 24848
OBJ_2489D:
        :: toklparen tok8trior OBJ_24992 OBJ_25D03 !*triand tokanglesign * 2489D
          tok8trior OBJ_248D9 COLA OBJ_24956     * 248C0
        ;                                        * 248D4

* refs (1): 248C5
OBJ_248D9:
        :: OBJ_25D03 !*triand tokanglesign tok8trior OBJ_2491F 4psh 3UNROLL * 248D9
          %POL>%REC ROT SWAPUnDROP COLA OBJ_24956 * 24901
        ;                                        * 2491A

* refs (1): 248F2
OBJ_2491F:
        :: OBJ_25D03 !*triand 4psh DROP %SPH>%REC BINT3 SWAPUnDROP COLA * 2491F
          OBJ_24956                              * 2494C
        ;                                        * 24951

* refs (8): 248CF 24915 2494C 249A6 249BF 249FB ...
OBJ_24956:
        :: ?ATTNQUIT tok] tok8trior TrueTrue tok[ tok8cktrior TrueTrue * 24956
          nultrior TrueTrue toklparen tok8trior  * 2497E

* refs (1): 248AC
OBJ_24992:
          :: OBJ_2478A !*triand COLA OBJ_24956   * 24992
          ;                                      * 249AB
          OBJ_25D03 !*triand COLA OBJ_24956      * 249B0
        ;                                        * 249C4

* refs (1): 2482F
OBJ_249C9:
        :: tok] tok8trior failed tok[ tok8trior failed nultrior failed * 249C9
          ~BINT0;5UNROLL OBJ_24956 !*triand COLA OBJ_24A14 * 249F6
        ;                                        * 24A0F

* refs (1): 24A0A
OBJ_24A14:
        :: 4psh DUP ONESWAP                      * 24A14
          {                                      * 24A28

Πi:
            LAM i                                * 24A2D

Πj:
            LAM j }                              * 24A36
          BIND SWAPUnDROP OBJ_24AC9              * 24A44
          :: !*triand                            * 24A53

Πi_24A5D:
            LAM i 6rolld;1+(s5)                  * 24A5D

Πj_24A6B:
            LAM j 6rolld;1+(s5) ABND RDROPCOLA OBJ_24A97 ; * 24A6B
          ABND ;                                 * 24A8D

* refs (1): 24A83
OBJ_24A97:
        :: 4psh DROP UNCOERCE2 BINT2 P{}N XEQ>ARRAY drop2;6rolld;1+(s5) * 24A97
          TrueTrue ;                             * 24ABF

* refs (2): 24A4E 24BF4
OBJ_24AC9:
        :: tok] tok8trior TrueTrue nultrior TrueTrue tok[ tok8trior * 24AC9
          OBJ_24B70 ~BINT0;5UNROLL OBJ_24956 !*triand 5PICK * 24AF1

Πj_24B0A:
          LAM j #/ DUPUNROT                      * 24B0A

Πi_24B1D:
          LAM i #+ '                             * 24B1D

Πi_24B30:
          LAM i STO #0= SWAP #0<> ANDNOTcase failed * 24B30
          BINT4 over& DROP TrueTrue ;            * 24B57

* refs (1): 24AF1
OBJ_24B70:
        :: nultrior failed tok] tok8trior failed tok[ tok8trior failed * 24B70
          ~BINT0;5UNROLL OBJ_24956 !*triand 4psh DUP * 24B9D

Πj_24BB6:
          LAM j #=case                           * 24BB6
          :: psh& DROP                           * 24BC4

Πi_24BD3:
            LAM i #1+'                           * 24BD3

Πi_24BE1:
            LAM i STO COLA OBJ_24AC9             * 24BE1
          ;                                      * 24BF9
          #1+NDROP failed ;                      * 24BFE

* refs (1): 243DE
List:
        :: ~BINT0;5UNROLL OBJ_24C30 !*triand ~4psh;P{}N;drop2;6rolld;1+(s5) * 24C0D
          TrueTrue ;                             * 24C26

* refs (3): 24C17 24C67 24C94
OBJ_24C30:
        :: nultrior TrueTrue tok} tok8trior TrueTrue tok<< tok8trior * 24C30
          OBJ_24C71 OBJ_24352 !*triand OBJ_24C30 ; * 24C58

* refs (1): 24C58
OBJ_24C71:
        :: ~BINT0;5UNROLL 'Rapndit x<< OBJ_23DFD !*triand COLA OBJ_24C30 * 24C71
        ;                                        * 24C99

* refs (1): 243ED
OBJ_24C9E:
        :: DROP OBJ_254F7 newBASE BINT64 Null# OVER #1- BINT4 #/ SWAPDROP * 24C9E
          #1+ EXPAND SWAPROT convertbase OVER ?SKIP * 24CD5
          :: ROTDROP 3GETLAM 3UNROLL ;           * 24CF3
          ABND !*triand DaDGNTc ;                * 24D0C

* refs (1): 2441A
OBJ_24D20:
        :: ~BINT0;5UNROLL NULLHXS BINT3 EXPAND 6rolld;1+(s5) OBJ_24D75 * 24D20
          !*triand 4psh #1-SWAP pshm1 top& P{}N {}>DIR drop2;6rolld;1+(s5) * 24D43
          TrueTrue ;                             * 24D6B

* refs (2): 24D3E 24DFC
OBJ_24D75:
        :: nultrior TrueTrue _END__253D6 tok8trior TrueTrue OBJ_24E47 * 24D75
          !*triand OBJ_24E06 !*triand 4psh SWAP NOTINHARDROM? ?SKIP * 24D98
          :: DUPROM-WORD? ITE PTR>ROMPTR TOTEMPOB * 24DBB
          ;                                      * 24DD4
          SWAP #1-SWAP pshm1 pullpsh1& top& psh drop;dq OBJ_24D75 ; * 24DD9

* refs (1): 24D9D
OBJ_24E06:
        :: tok<< tok8trior OBJ_24E29 COLA OBJ_24352 * 24E06
        ;                                        * 24E24

* refs (1): 24E15
OBJ_24E29:
        :: ~BINT0;5UNROLL 'Rapndit x<< OBJ_23DFD ; * 24E29

* refs (1): 24D93
OBJ_24E47:
        :: ~;eval;q OBJ_27EE0 $>ID COMPILEID NOTcase OBJ_24E83 * 24E47
          idntcase OBJ_24E83                     * 24E6A
          DROP failed ;                          * 24E74

* refs (2): 24E65 24E6F
OBJ_24E83:
        :: DROP toklparen &$ $>ID DaDGNTc ;      * 24E83

* refs (1): 24D61
{}>DIR:
        CON(5)  (*)+5                            * 24EA6  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 24EAB
        A=DAT1  A                                * 24EB2
        AD1EX                                    * 24EB5
        D1=D1+  5                                * 24EB8
        LC(5)   DORRP                            * 24EBB
        DAT1=C  A                                * 24EC2
        D1=D1+  5                                * 24EC5
        LC(3)   #7FF                             * 24EC8
        DAT1=C  3                                * 24ECD
        D1=D1+  3                                * 24ED1
        AD1EX                                    * 24ED4
        R0=A.F  A                                * 24ED7
        D0=A                                     * 24EDD
        R1=A.F  A                                * 24EE0
        D0=D0+  5                                * 24EE6
        A=DAT0  A                                * 24EE9
        LC(5)   SEMI                             * 24EEC
        ?C=A    A                                * 24EF3
        GOYES   L_24F5C                          * 24EF6
        AD0EX                                    * 24EF8
        D0=A                                     * 24EFB
        C=0     A                                * 24EFE
        GOTO    L_24F21                          * 24F00
L_24F04:
        A=DAT0  A                                * 24F04
        LC(5)   SEMI                             * 24F07
        ?C=A    A                                * 24F0E
        GOYES   L_24F5C                          * 24F11
        AD0EX                                    * 24F13
        D0=A                                     * 24F16
        C=R1.F  A                                * 24F19
        C=A-C   A                                * 24F1F
L_24F21:
        DAT0=C  A                                * 24F21
        A=A+CON A,5                              * 24F24
        R1=A.F  A                                * 24F2A
        D0=A                                     * 24F30
        A=0     A                                * 24F33
        A=DAT0  B                                * 24F35
        A=A-1   B                                * 24F38
        DAT0=A  B                                * 24F3B
        CD0EX                                    * 24F3E
        C=C+A   A                                * 24F41
        C=C+A   A                                * 24F43
        D0=C                                     * 24F45
        D0=D0+  2                                * 24F48
        DAT0=A  B                                * 24F4B
        D0=D0+  2                                * 24F4E
        GOSBVL  SKIPOB                           * 24F51
        GOTO    L_24F04                          * 24F58
L_24F5C:
        A=R1.F  A                                * 24F5C
        C=R0.F  A                                * 24F62
        D0=C                                     * 24F68
        A=A-C   A                                * 24F6B
        DAT0=A  A                                * 24F6D
        D1=(5)  DSKTOP                           * 24F70
        C=DAT1  A                                * 24F77
        D1=C                                     * 24F7A
        A=R0.F  A                                * 24F7D
        A=A-CON A,8                              * 24F83
        DAT1=A  A                                * 24F89
        LC(5)   #00005                           * 24F8C
        GOSBVL  MOVERSD                          * 24F93
        A=B     A                                * 24F9A
        D0=A                                     * 24F9C
        GOSBVL  SKIPOB                           * 24F9F
        D0=D0+  5                                * 24FA6
        AD0EX                                    * 24FA9
        LC(5)   #00005                           * 24FAC
        GOSBVL  MOVERSD                          * 24FB3
        A=B     A                                * 24FBA
        D0=A                                     * 24FBC
        A=DAT0  A                                * 24FBF
        A=A-CON A,10                             * 24FC2
        DAT0=A  A                                * 24FC8
        GOVLNG  GETPTRLOOP                       * 24FCB
        RPL

* refs (1): 243FC
~getmatchtok;DaDGNTc:
        :: getmatchtok DaDGNTc ;                 * 24FD2

* refs (1): 24429
OBJ_24FE6:
        :: tok$ tok=casedrop OBJ_250D1           * 24FE6
          tokexponent DPRADIX? tok. tok, RPITE realPAcode !*triand * 24FFA
          COERCE DUP#0= casedrop                 * 2501D
          :: NULL$ DaDGNTc ;                     * 2502C
          #1- SWAP#1+ SWAPCOLA OBJ_25059 ;       * 25040

* refs (3): 2504F 250C7 250E5
OBJ_25059:
        :: 2DUP5ROLL UNROTOVER #+OVF TRUE OBJ_261AD OBJ_250B8 DROP 4ROLLDROP * 25059
          BINT3 NDUP SUB$ SWAPDROPDUP 6rolld;1+(s5) LEN$ #+ GetNextToken * 25086
          TrueTrue ;                             * 250AE

* refs (1): 25077
OBJ_250B8:
        :: ROT COLA OBJ_25059                    * 250B8
        ;                                        * 250CC

* refs (1): 24FF5
OBJ_250D1:
        :: #1+ MINUSONE COLA OBJ_25059           * 250D1
        ;                                        * 250EA

* refs (2): 69833 6B632
OBJ_250EF:
        :: DPRADIX? COLA OBJ_25108               * 250EF
        ;                                        * 25103

* refs (1): 250FE
OBJ_25108:
        CON(5)  (*)+5                            * 25108  primitive code object
        ASSEMBLE
        ST=1    0                                * 2510D
        ST=1    3                                * 25110
        A=DAT1  A                                * 25113
        D1=D1+  5                                * 25116
        D=D+1   A                                * 25119
        LC(5)   TRUE                             * 2511B
        ?C=A    A                                * 25122
        GOYES   L_25135                          * 25125
        ST=0    3                                * 25127
        GONC    L_25135                          * 2512A

* refs (6): 0F182 2460E 246DB 27EEF 56FA9 697DE
delimcase:
        CON(5)  (*)+5                            * 2512D  primitive code object
        ST=0    0                                * 25132
L_25135:
        A=DAT1  A                                * 25135
        AD1EX                                    * 25138
        D1=D1+  5                                * 2513B
        C=DAT1  A                                * 2513E
        CD1EX                                    * 25141
        D1=D1-  5                                * 25144
        AD1EX                                    * 25147
        ST=0    1                                * 2514A
        A=A-CON A,2                              * 2514D
        GONC    L_25159                          * 25153
        ST=1    1                                * 25156
L_25159:
        A=A+1   A                                * 25159
        A=A+1   A                                * 2515B
        ?A=0    A                                * 2515D
        GOYES   L_251B2                          * 25160
        A=0     B                                * 25162
        ?A#0    A                                * 25165
        GOYES   L_251B2                          * 25168
        A=0     A                                * 2516A
        CD1EX                                    * 2516C
        D1=D1+  5                                * 2516F
        A=DAT1  B                                * 25172
        D1=C                                     * 25175
        D1=D1+  15                               * 25178
        C=DAT1  A                                * 2517B
        D1=D1-  15                               * 2517E
        CD1EX                                    * 25181
        D1=D1+  10                               * 25184
        CD1EX                                    * 25187
        A=A+C   A                                * 2518A
        AD1EX                                    * 2518C
        C=DAT1  1                                * 2518F
        D1=A                                     * 25193
        CPEX    0                                * 25196
        ?P=     1                                * 2519A
        GOYES   L_251A9                          * 2519D
        ?P=     6                                * 2519F
        GOYES   L_251A9                          * 251A2
        ?P#     15                               * 251A4
        GOYES   L_251BB                          * 251A7
L_251A9:
        P=      0                                * 251A9
        GOVLNG  doskip                           * 251AB
L_251B2:
        P=      0                                * 251B2
        GOVLNG  docola                           * 251B4
L_251BB:
        ?ST=0   0                                * 251BB
        GOYES   L_251B2                          * 251BE
        ?P=     2                                * 251C0
        GOYES   L_251A9                          * 251C3
        ?P=     10                               * 251C5
        GOYES   L_251DC                          * 251C8
        ?P=     11                               * 251CA
        GOYES   L_251E4                          * 251CD
        ?P#     7                                * 251CF
        GOYES   L_251B2                          * 251D2
        ?ST=0   1                                * 251D4
        GOYES   L_251B2                          * 251D7
        GONC    L_251A9                          * 251D9
L_251DC:
        ?ST=1   3                                * 251DC
        GOYES   L_251A9                          * 251DF
        GONC    L_251B2                          * 251E1
L_251E4:
        ?ST=0   3                                * 251E4
        GOYES   L_251A9                          * 251E7
        GONC    L_251B2                          * 251E9
        RPL

* refs (12): 24686 247BC 24A66 24A74 24D39 2509A ...
6rolld;1+(s5):
        :: 6UNROLL 5ROLL #1+ 5UNROLL ;           * 251EC

* meta ob1...ob4 -> meta&ob ob1...ob4
* refs (30): 23AE7 23B05 23B64 23B82 23BD7 23C2C ...
'Rapndit:
        :: 'R COLA 6rolld;1+(s5)                 * 2520A
        ;                                        * 2521E

* refs (9): 23E75 244BF 246AE 24D16 24E9C 24FDC ...
DaDGNTc:
        :: DUP 6rolld;1+(s5) DROP GetNextToken TrueTrue ; * 25223

* refs (4): 23AD8 24276 242C6 244EC
swapB;drop;2true:
        :: SWAPUnDROP TrueTrue ;                 * 25246

* refs (2): 239F7 240A5
OBJ_2525A:
        :: 4psh DUP#1= ITE OBJ_25282 ~P::N;BINT1 * 2525A
          SWAPUnDROP ;                           * 25278

* refs (1): 2526E
OBJ_25282:
        :: OVER OBJ_2699F case ~P::N;BINT1       * 25282
        ;                                        * 2529B

* refs (2): 25273 25296
~P::N;BINT1:
        :: P::N BINT1 ;                          * 252A0

* refs (2): 23E43 245CD
~4psh;P::N;drop2;6rolld;1+(s5):
        :: 4psh P::N drop2;6rolld;1+(s5) ;       * 252B4

* refs (7): 23B00 23B7D 23C95 23CF4 2402D 24122 ...
OBJ_252CD:
        :: 4psh DUP#1= ITE DROP P::N             * 252CD
          drop2;6rolld;1+(s5) ;                  * 252EB

* refs (1): 24C21
~4psh;P{}N;drop2;6rolld;1+(s5):
        :: 4psh P{}N drop2;6rolld;1+(s5) ;       * 252F5

* refs (21): 239E8 23AF1 23B6E 23C36 23CA4 23DDF ...
* Probably: compiler: open an empty meta under the four objects on top (BINT0 5UNROLL), for 4psh to collect a clause into
~BINT0;5UNROLL:
        :: BINT0 5UNROLL ;                       * 2530E

* meta1 ob1..ob4 -> ob1&..ob4 meta1
* refs (18): 23ABA 23EAC 240AA 2420D 244D3 247EE ...
4psh:
        :: BINT4 psh ;                           * 25322

* refs (8): 240B4 24807 24866 24ABA 24D66 252C3 ...
drop2;6rolld;1+(s5):
        :: SWAPDROP 6rolld;1+(s5) ;              * 25336

* NULL$ -> :: ; $ -> :: $ <Ob1> <Rest> ;
* refs (39): 0F1A0 23A0B 23B1E 23BA0 23BF5 23C4F ...
nultrior:
        CON(5)  (*)+5                            * 2534A  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 2534F
        AD1EX                                    * 25352
        D1=D1+  5                                * 25355
        C=DAT1  A                                * 25358
        D1=C                                     * 2535B
        D1=D1-  6                                * 2535E
        GOC     L_2536E                          * 25361
        D1=(5)  SKIP                             * 25364
        GONC    L_25375                          * 2536B
L_2536E:
        D1=(5)  COLA                             * 2536E
L_25375:
        AD1EX                                    * 25375
        PC=(A)                                   * 25378
        RPL

        :: tok8trior NOP failed RDROP ;          * 2537C

_TO_:
        $ "TO"                                   * 2539A

* refs (1): 24410
_DIR:
        $ "DIR"                                  * 253A8

* refs (2): 24401 3F615
_:__253B8:
        $ ":"                                    * 253B8

* refs (2): 23C68 240F5
_ELSE_:
        $ "ELSE"                                 * 253C4

* refs (9): 23B28 23BAA 23C59 23CC7 23D8F 24000 ...
_END__253D6:
        $ "END"                                  * 253D6

* refs (1): 23D3A
_UNTIL_:
        $ "UNTIL"                                * 253E6

* refs (1): 23FA6
_REPEAT_:
        $ "REPEAT"                               * 253FA

* refs (1): 23F10
_NEXT_:
        $ "NEXT"                                 * 25410

* refs (1): 23F1F
_STEP_:
        $ "STEP"                                 * 25422

* refs (3): 23B37 23BFF 24078
_THEN_:
        $ "THEN"                                 * 25434

* "->"
* refs (1): 20E37
tok->:
        $ "→"                                    * 25446

* hxs-mask $ #loc $_tok -> hxs-mask $ #next $match
* refs (3): 244A6 24FD7 254ED
getmatchtok:
        :: 2DUP5ROLL 3UNROLL getmatchtok~2 getmatchtok~1 4ROLLDROP 4ROLLDROP * 25452
          BINT3 NDUP #1- SUB$ ROTDROP SWAP#1+ SWAP ; * 25475

* refs (1): 25466
getmatchtok~1:
        :: FALSE OBJ_2622F ~ROT;COLA;getmatchtok DROP ROTDROP OVERDUP LEN$ * 2549D
          ROTSWAP #1+DUP 4UNROLL SUB$ ;          * 254C5

* refs (1): 254AC
~ROT;COLA;getmatchtok:
        :: ROT COLA getmatchtok                  * 254DE
        ;                                        * 254F2

* refs (1): 24CA8
OBJ_254F7:
        :: OBJ_25E44                             * 254F7
          :: 3UNROLL GetNextToken 4ROLLDROP ; ;  * 25501

* refs (1): 25461
getmatchtok~2:
        CON(5)  (*)+5                            * 2551F  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 25524
        D=D+1   A                                * 25527
        GOSBVL  SAVPTR                           * 25529
        D1=D1-  5                                * 25530
        A=DAT1  A                                * 25533
        D1=D1+  5                                * 25536
        AD1EX                                    * 25539
        D1=D1+  10                               * 2553C
        C=DAT1  B                                * 2553F
        D=C     B                                * 25542
        D1=A                                     * 25545
        C=DAT1  A                                * 25548
        CD1EX                                    * 2554B
        D1=D1+  5                                * 2554E
        A=DAT1  A                                * 25551
        D1=C                                     * 25554
        B=A     A                                * 25557
        A=A+A   A                                * 25559
        D1=D1+  5                                * 2555B
        C=DAT1  A                                * 2555E
        D1=C                                     * 25561
        D1=D1+  5                                * 25564
        LC(5)   #00005                           * 25567
        A=A+C   A                                * 2556E
        C=DAT1  A                                * 25570
        C=C-A   A                                * 25573
        GOC     L_255AF                          * 25575
        CD1EX                                    * 25578
        C=C+A   A                                * 2557B
        D0=C                                     * 2557D
        D0=D0-  2                                * 25580
        C=D     B                                * 25583
L_25586:
        A=DAT0  B                                * 25586
        ?C=A    B                                * 25589
        GOYES   L_2559C                          * 2558C
        B=B+1   A                                * 2558E
        D0=D0+  2                                * 25590
        D1=D1-  2                                * 25593
        GONC    L_25586                          * 25596
        GOC     L_255AF                          * 25599
L_2559C:
        A=B     A                                * 2559C
        R0=A                                     * 2559E
        GOSBVL  PUSH#                            * 255A1
        GOVLNG  doskip                           * 255A8
L_255AF:
        GOSBVL  GETPTR                           * 255AF
        GOVLNG  docola                           * 255B6

* refs (6): 0F169 24546 27454 27EE5 687C9 697C5
ngsizecase:
        CON(5)  (*)+5                            * 255BD  primitive code object
        C=DAT1  A                                * 255C2
        CD1EX                                    * 255C5
        D1=D1+  5                                * 255C8
        A=DAT1  A                                * 255CB
        D1=C                                     * 255CE
        LC(5)   #00005                           * 255D1
        A=A-C   A                                * 255D8
        LC(5)   COLA                             * 255DA
        ?A=0    A                                * 255E1
        GOYES   L_255F5                          * 255E4
        A=0     B                                * 255E6
        ?A#0    A                                * 255E9
        GOYES   L_255F5                          * 255EC
        LC(5)   SKIP                             * 255EE
L_255F5:
        A=C     A                                * 255F5
        PC=(A)                                   * 255F7

* refs (1): 23A97
need'case:
        CON(5)  (*)+5                            * 255FB  primitive code object
        C=DAT1  A                                * 25600
        CD1EX                                    * 25603
        A=DAT1  A                                * 25606
        D1=C                                     * 25609
        LC(5)   DOIDNT                           * 2560C
        ?C=A    A                                * 25613
        GOYES   L_2562B                          * 25616
        LC(5)   DOLAM                            * 25618
        ?C=A    A                                * 2561F
        GOYES   L_2562B                          * 25622
        GOVLNG  doskip                           * 25624
L_2562B:
        GOVLNG  docola                           * 2562B
        RPL

* refs (1): 24CAD
newBASE:
        :: DUPLEN$ DUP OBJ_56FD1 BIND 3GETLAM 2GETLAM BINT2 #<case BASE * 25632
          DUP 2GETLAM DUP SUB$                   * 25664

_bodh_:
          $ "bodh" SWAP XEQPOS$ COERCE           * 25678
          { BINT2 BINT8 BINT10 BINT16 } SWAP NTHELCOMP NOTcase BASE * 25699
          SWAPONE 2GETLAM #1- SUB$SWAP ;         * 256CB

* refs (1): 24CE4
convertbase:
        CON(5)  (*)+5                            * 256E4  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 256E9
        ?A#0    P                                * 256F0
        GOYES   L_25701                          * 256F3
        LC(5)   L_2588A                          * 256F5
        RSTK=C                                   * 256FC
        GONC    L_2572D                          * 256FE
L_25701:
        A=A+A   P                                * 25701
        GOC     L_25713                          * 25704
        LC(5)   L_2580B                          * 25707
        RSTK=C                                   * 2570E
        GONC    L_2572D                          * 25710
L_25713:
        ?A#0    P                                * 25713
        GOYES   L_25724                          * 25716
        LC(5)   L_2582D                          * 25718
        RSTK=C                                   * 2571F
        GONC    L_2572D                          * 25721
L_25724:
        LC(5)   L_25857                          * 25724
        RSTK=C                                   * 2572B
L_2572D:
        GOSBVL  POP#                             * 2572D
        R0=A                                     * 25734
        D1=D1+  5                                * 25737
        D=D+1   A                                * 2573A
        GOSBVL  SAVPTR                           * 2573C
        A=DAT1  A                                * 25743
        AD1EX                                    * 25746
        D1=D1+  5                                * 25749
        A=DAT1  A                                * 2574C
        D0=A                                     * 2574F
        D0=D0-  7                                * 25752
        GOC     L_25773                          * 25755
        D1=D1+  5                                * 25758
        B=0     W                                * 2575B
L_2575E:
        C=RSTK                                   * 2575E
        RSTK=C                                   * 25760
        RSTK=C                                   * 25762
        RTN                                      * 25764
L_25766:
        D1=D1+  2                                * 25766
        D0=D0-  2                                * 25769
        GONC    L_2575E                          * 2576C
        GOTO    L_25789                          * 2576F
L_25773:
        C=RSTK                                   * 25773
        GOSBVL  GETPTR                           * 25775
        LC(5)   failed                           * 2577C
        A=C     A                                * 25783
        PC=(A)                                   * 25785
L_25789:
        C=RSTK                                   * 25789
        A=DAT1  A                                * 2578B
        D1=A                                     * 2578E
        C=R0                                     * 25791
        C=C-1   A                                * 25794
        C=C+C   A                                * 25796
        C=C+C   A                                * 25798
        A=C     P                                * 2579A
        CSR     B                                * 2579D
        ASL     B                                * 257A0
        P=C     0                                * 257A3
        C=0     P                                * 257A7
        C=C+1   P                                * 257AA
        A=A+A   B                                * 257AD
        GONC    L_257BF                          * 257B0
        C=C+C   P                                * 257B3
        C=C+1   P                                * 257B6
        C=C+C   P                                * 257B9
        C=C+1   P                                * 257BC
L_257BF:
        A=A+A   B                                * 257BF
        GONC    L_257CB                          * 257C2
        C=C+C   P                                * 257C5
        C=C+1   P                                * 257C8
L_257CB:
        B=B&C   P                                * 257CB
        D1=(5)  DSKTOP                           * 257CF
        A=DAT1  A                                * 257D6
        D1=A                                     * 257D9
        D1=D1-  5                                * 257DC
        A=DAT1  A                                * 257DF
        D1=D1+  5                                * 257E2
        DAT1=A  A                                * 257E5
        AD1EX                                    * 257E8
        D1=D1+  10                               * 257EB
        C=B     WP                               * 257EE
        DAT1=C  WP                               * 257F1
        P=      0                                * 257F5
        GOSBVL  GETPTR                           * 257F7
        LC(5)   TrueTrue                         * 257FE
        A=C     A                                * 25805
        PC=(A)                                   * 25807
L_2580B:
        B=B+B   W                                * 2580B
        A=DAT1  B                                * 2580E
        LC(2)   #30                              * 25811
        ?C=A    B                                * 25815
        GOYES   L_25825                          * 25818
        C=C+1   B                                * 2581A
        ?C#A    B                                * 2581D
        GOYES   L_25829                          * 25820
        B=B+1   P                                * 25822
L_25825:
        GOTO    L_25766                          * 25825
L_25829:
        GOTO    L_25773                          * 25829
L_2582D:
        B=B+B   W                                * 2582D
        B=B+B   W                                * 25830
        B=B+B   W                                * 25833
        A=DAT1  B                                * 25836
        LC(2)   #30                              * 25839
        A=A-C   B                                * 2583D
        GOC     L_25853                          * 25840
        LC(2)   #07                              * 25843
        ?C<A    B                                * 25847
        GOYES   L_25853                          * 2584A
        B=B+A   P                                * 2584C
        GOTO    L_25766                          * 2584F
L_25853:
        GOTO    L_25773                          * 25853
L_25857:
        C=B     W                                * 25857
        B=B+B   W                                * 2585A
        B=B+B   W                                * 2585D
        B=B+C   W                                * 25860
        B=B+B   W                                * 25863
        A=0     W                                * 25866
        A=DAT1  B                                * 25869
        LC(2)   #30                              * 2586C
        A=A-C   B                                * 25870
        GOC     L_25886                          * 25873
        LC(2)   #09                              * 25876
        ?C<A    B                                * 2587A
        GOYES   L_25886                          * 2587D
        B=B+A   W                                * 2587F
        GOTO    L_25766                          * 25882
L_25886:
        GOTO    L_25773                          * 25886
L_2588A:
        BSL     W                                * 2588A
        A=DAT1  B                                * 2588D
        LC(2)   #41                              * 25890
        ?C<=A   B                                * 25894
        GOYES   L_258B7                          * 25897
        LC(2)   #30                              * 25899
        A=A-C   B                                * 2589D
        GOC     L_258B3                          * 258A0
        LC(2)   #09                              * 258A3
        ?C<A    B                                * 258A7
        GOYES   L_258B3                          * 258AA
        B=A     P                                * 258AC
        GOTO    L_25766                          * 258AF
L_258B3:
        GOTO    L_25773                          * 258B3
L_258B7:
        A=A-C   B                                * 258B7
        LC(2)   #05                              * 258BA
        ?C<A    B                                * 258BE
        GOYES   L_258B3                          * 258C1
        LC(1)   #A                               * 258C3
        A=A+C   P                                * 258C6
        B=A     P                                * 258C9
        GOTO    L_25766                          * 258CC

* refs (1): 24CB7
Null#:
        CON(5)  DOHSTR                           * 258D0  DOHSTR
        LENGTH                                   * 258D5  length, to #258DA
        ENDLENGTH                                * 258DA
        RPL

* refs (1): 2F5C4
OBJ_258DA:
        :: TRUE {'ioinprogress} BIND             * 258DA

* refs (1): 259E3
{}_258EE:
          { } SWAP ERRSET OBJ_238B8 ERRTRAP OBJ_259C0 ABND case OBJ_25934 * 258EE
          4ROLLDROP FALSE TRUE ;                 * 25920

* refs (1): 2591B
OBJ_25934:
        :: SWAPDROP DUPTYPECOL? NOTcase 3true    * 25934
          DUPLENCOMP BINT2 #=casedrop OBJ_25984  * 2594D
          DROP                                   * 25961

* refs (3): 25948 259A7 259B6
3true:
          :: TRUE TRUE TRUE ; ;                  * 25966

* refs (1): 2595C
OBJ_25984:
        :: DUP CARCOMP ' xSILENT' EQ NOTcase 3true * 25984
          BINT2 NTHCOMPDROP 3true ;              * 259AC

* refs (1): 2590C
OBJ_259C0:
        :: ERROR@ OBJ_26289 #<>case              * 259C0
          ::                                     * 259D4

* refs (1): 25A36
OBJ_259D9:
            :: BEGIN {}_258EE EQ UNTIL ; ERRJMP ; * 259D9
          ERRORCLR                               * 25A01
          {                                      * 25A06

Π'1:
            LAM '1                               * 25A0B

Π'2:
            LAM '2                               * 25A16

Π'3:
            LAM '3 }                             * 25A21
          BIND OBJ_259D9                         * 25A31

Π'1_25A3B:
          LAM '1                                 * 25A3B

Π'2_25A46:
          LAM '2                                 * 25A46

Π'3_25A51:
          LAM '3 DUP IT                          * 25A51

drop2;2true:
          :: 2DROP TRUE TRUE ;                   * 25A66
          ABND RDROP ABND ;                      * 25A7F

* refs (4): 0F191 0F19B 246D6 246EA
OBJ_25A93:
        :: FALSE {'ioinprogress} BIND GetNextToken ABND ; * 25A93

* refs (5): 2446F 24735 24762 2477B 25BEC
OBJ_25AB6:
        :: 4UNROLL 5ROLL 2DROP GetNextToken ;    * 25AB6

* refs (2): 24492 25B5B
OBJ_25AD4:
        :: 4UNROLL 5ROLLDROP LEN$ 2DUP#> 3UNROLL #- BINT1 RPITE GetNextToken ; * 25AD4

* # #' -> #+#'
* refs (1): 25068
#+OVF:
        CON(5)  (*)+5                            * 25B0B  primitive code object
        ASSEMBLE
        GOSBVL  POP2#                            * 25B10
        A=A+C   A                                * 25B17
        GOC     L_25B30                          * 25B19
        R0=A.F  A                                * 25B1C
        GOSBVL  SAVPTR                           * 25B22
        GOVLNG  PUSH#LOOP                        * 25B29
L_25B30:
        LC(5)   MINUSONE                         * 25B30
        A=C     A                                * 25B37
        PC=(A)                                   * 25B39
        RPL

* refs (1): 24438
OBJ_25B3D:
        :: OBJ_25D03 !*triand OBJ_25D03 !*triand OBJ_25E44 OBJ_25AD4 5ROLL * 25B3D
          #2- 5UNROLL 7ROLL 7ROLL COERCESWAP COERCE MAKEGROB DUP BINT15 #- * 25B65
          3PICK LEN$ #<case                      * 25B97
          :: DROP failed ;                       * 25BA6
          BINT20                                 * 25BBA
* The Very Big List names this address 3dropn;false;true, but it is a pointer inside an object; the name is not used
          OBJ_25C37 Extobcode NOTcase            * 25BBF
          :: DROP failed ;                       * 25BCE
          6rolld;1+(s5) OBJ_25D3A OBJ_25AB6 TrueTrue ; * 25BE2

* refs (1): 6F43C
OBJ_25BFB:
        GROB    "images/25BFB.png"               * 25BFB  6 x 10

* refs (4): 69BFB 6AC5D 6B11F 6F60D
OBJ_25C23:
        :: 'LB OBJ_6FACC ;                       * 25C23

* refs (1): 25BBF
OBJ_25C37:
        # DOGROB                                 * 25C37  address

* refs (1): 25BC4
Extobcode:
        CON(5)  (*)+5                            * 25C41  primitive code object
        ASSEMBLE
        GOSBVL  POP2#                            * 25C46
        R0=A.F  A                                * 25C4D
        A=DAT1  A                                * 25C53
        AD1EX                                    * 25C56
        DAT1=C  A                                * 25C59
        AD1EX                                    * 25C5C
        GOSBVL  SAVPTR                           * 25C5F
        C=R0.F  A                                * 25C66
        A=A+C   A                                * 25C6C
        D0=A                                     * 25C6E
        D1=D1+  5                                * 25C71
        C=DAT1  A                                * 25C74
        D1=C                                     * 25C77
        D1=D1+  5                                * 25C7A
        C=DAT1  A                                * 25C7D
        D1=D1+  5                                * 25C80
        C=C-CON A,7                              * 25C83
        GOC     GETPTRTRUE                       * 25C89
        D=C     A                                * 25C8C
        LC(4)   #3041                            * 25C8E
        B=C     A                                * 25C94
L_25C96:
        A=DAT1  B                                * 25C96
        LC(2)   #41                              * 25C99
        ?C<=A   B                                * 25C9D
        GOYES   L_25CBC                          * 25CA0
        LC(2)   #30                              * 25CA2
        A=A-C   B                                * 25CA6
        GOC     L_25CB5                          * 25CA9
        LC(2)   #09                              * 25CAC
        ?C>=A   B                                * 25CB0
        GOYES   L_25CCE                          * 25CB3
L_25CB5:
        GOVLNG  GETPTRFALSE                      * 25CB5
L_25CBC:
        A=A-C   B                                * 25CBC
        LC(2)   #05                              * 25CBF
        ?C<A    B                                * 25CC3
        GOYES   L_25CB5                          * 25CC6
        LC(1)   #A                               * 25CC8
        A=A+C   P                                * 25CCB
L_25CCE:
        DAT0=A  1                                * 25CCE
        D1=D1+  2                                * 25CD2
        D0=D0+  1                                * 25CD5
        D=D-CON A,2                              * 25CD8
        GONC    L_25C96                          * 25CDE

* <REF>GETPTR , Do TRUE
* refs (6): 04263 0B405 0BB51 0E3D8 0ED3E 25C89
GETPTRTRUE:
        GOSBVL  GETPTR                           * 25CE1
        LC(5)   TRUE                             * 25CE8
        A=C     A                                * 25CEF
        PC=(A)                                   * 25CF1
        RPL

* refs (2): 172C5 177BB
OBJ_25CF5:
        $ "  "                                   * 25CF5

* refs (13): 24398 24794 247C1 248B1 248DE 24924 ...
* Probably: parser: read the current token as a real number
OBJ_25D03:
        :: tokexponent DPRADIX? tok. tok, RPITE realPAcode !*trior * 25D03
          DaDGNTc FALSE ;                        * 25D2B

* refs (5): 238D1 2448D 2475D 24776 25BE7
* Parser character classes, table 1
* Classes: 0 separator, 1 name character, 2 digit, 3 opener ' ( [ { <<, 4 closer, 5 one-character token, 6 ESC, 8/10 '.', 9/11 ',', 12 '=', 13 '@' (comment), 14 newline, 15 'E' (exponent)
OBJ_25D3A:
        CON(5)  DOHSTR                           * 25D3A
        LENGTH                                   * 25D3F  length, to #25E44
          NIBHEX  0000000000E00000               * 25D44  #00-#0F ................
          NIBHEX  0000000000060000               * 25D54  #10-#1F ................
          NIBHEX  0555111334129281               * 25D64  #20-#2F  !"#$%&'()*+,-./
          NIBHEX  2222222222501111               * 25D74  #30-#3F 0123456789:;<=>?
          NIBHEX  D1111F1111111111               * 25D84  #40-#4F @ABCDEFGHIJKLMNO
          NIBHEX  1111111111131415               * 25D94  #50-#5F PQRSTUVWXYZ[\]^_
          NIBHEX  1111111111111111               * 25DA4  #60-#6F `abcdefghijklmno
          NIBHEX  1111111111131410               * 25DB4  #70-#7F pqrstuvwxyz{|}~.
          NIBHEX  5111111111111111               * 25DC4  #80-#8F ∡ā∇√∫Σ▶π∂≤≥≠α→←↓
          NIBHEX  1111111111111111               * 25DD4  #90-#9F ↑γδεηθλρστωΔΠΩ■∞
          NIBHEX  0111111111131111               * 25DE4  #A0-#AF .¡¢£¤¥¦§¨©ª«¬­®¯
          NIBHEX  1111111111141111               * 25DF4  #B0-#BF °±²³´µ¶·¸¹º»¼½¾¿
          NIBHEX  1111111111111111               * 25E04  #C0-#CF ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏ
          NIBHEX  1111111111111111               * 25E14  #D0-#DF ÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß
          NIBHEX  1111111111111111               * 25E24  #E0-#EF àáâãäåæçèéêëìíîï
          NIBHEX  1111111111111111               * 25E34  #F0-#FF ðñòóôõö÷øùúûüýþÿ
        ENDLENGTH                                * 25E44

* refs (2): 254FC 25B56
* Parser character classes, table 2: digits and E are name characters
* Classes: 0 separator, 1 name character, 2 digit, 3 opener ' ( [ { <<, 4 closer, 5 one-character token, 6 ESC, 8/10 '.', 9/11 ',', 12 '=', 13 '@' (comment), 14 newline, 15 'E' (exponent)
OBJ_25E44:
        CON(5)  DOHSTR                           * 25E44
        LENGTH                                   * 25E49  length, to #25F4E
          NIBHEX  0000000000E00000               * 25E4E  #00-#0F ................
          NIBHEX  0000000000060000               * 25E5E  #10-#1F ................
          NIBHEX  0555111334129281               * 25E6E  #20-#2F  !"#$%&'()*+,-./
          NIBHEX  1111111111501111               * 25E7E  #30-#3F 0123456789:;<=>?
          NIBHEX  D111111111111111               * 25E8E  #40-#4F @ABCDEFGHIJKLMNO
          NIBHEX  1111111111131415               * 25E9E  #50-#5F PQRSTUVWXYZ[\]^_
          NIBHEX  1111111111111111               * 25EAE  #60-#6F `abcdefghijklmno
          NIBHEX  1111111111131410               * 25EBE  #70-#7F pqrstuvwxyz{|}~.
          NIBHEX  5111111111111111               * 25ECE  #80-#8F ∡ā∇√∫Σ▶π∂≤≥≠α→←↓
          NIBHEX  1111111111111111               * 25EDE  #90-#9F ↑γδεηθλρστωΔΠΩ■∞
          NIBHEX  0111111111131111               * 25EEE  #A0-#AF .¡¢£¤¥¦§¨©ª«¬­®¯
          NIBHEX  1111111111141111               * 25EFE  #B0-#BF °±²³´µ¶·¸¹º»¼½¾¿
          NIBHEX  1111111111111111               * 25F0E  #C0-#CF ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏ
          NIBHEX  1111111111111111               * 25F1E  #D0-#DF ÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß
          NIBHEX  1111111111111111               * 25F2E  #E0-#EF àáâãäåæçèéêëìíîï
          NIBHEX  1111111111111111               * 25F3E  #F0-#FF ðñòóôõö÷øùúûüýþÿ
        ENDLENGTH                                * 25F4E

* refs (7): 0F173 246CC 24730 3EF91 56F95 6AAFA ...
* Parser character classes, table 3
* Classes: 0 separator, 1 name character, 2 digit, 3 opener ' ( [ { <<, 4 closer, 5 one-character token, 6 ESC, 8/10 '.', 9/11 ',', 12 '=', 13 '@' (comment), 14 newline, 15 'E' (exponent)
OBJ_25F4E:
        CON(5)  DOHSTR                           * 25F4E
        LENGTH                                   * 25F53  length, to #26058
L_25F58:
          NIBHEX  0000000000E00000               * 25F58  #00-#0F ................
          NIBHEX  0000000555060000               * 25F68  #10-#1F ................
          NIBHEX  055511153455B5A5               * 25F78  #20-#2F  !"#$%&'()*+,-./
          NIBHEX  2222222222555C51               * 25F88  #30-#3F 0123456789:;<=>?
          NIBHEX  D1111F1111111111               * 25F98  #40-#4F @ABCDEFGHIJKLMNO
          NIBHEX  1111111111131455               * 25FA8  #50-#5F PQRSTUVWXYZ[\]^_
          NIBHEX  1111111111111111               * 25FB8  #60-#6F `abcdefghijklmno
          NIBHEX  1111111111135410               * 25FC8  #70-#7F pqrstuvwxyz{|}~.
          NIBHEX  5115511155551111               * 25FD8  #80-#8F ∡ā∇√∫Σ▶π∂≤≥≠α→←↓
          NIBHEX  1111111111111111               * 25FE8  #90-#9F ↑γδεηθλρστωΔΠΩ■∞
          NIBHEX  0111111111131111               * 25FF8  #A0-#AF .¡¢£¤¥¦§¨©ª«¬­®¯
          NIBHEX  1111111111141111               * 26008  #B0-#BF °±²³´µ¶·¸¹º»¼½¾¿
          NIBHEX  1111111111111111               * 26018  #C0-#CF ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏ
          NIBHEX  1111111111111111               * 26028  #D0-#DF ÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß
          NIBHEX  1111111111111111               * 26038  #E0-#EF àáâãäåæçèéêëìíîï
          NIBHEX  1111111111111111               * 26048  #F0-#FF ðñòóôõö÷øùúûüýþÿ
        ENDLENGTH                                * 26058

* refs (1): 2446A
* Parser character classes, table 4 (used at #2446A): CR, LF and space are tokens
* Classes: 0 separator, 1 name character, 2 digit, 3 opener ' ( [ { <<, 4 closer, 5 one-character token, 6 ESC, 8/10 '.', 9/11 ',', 12 '=', 13 '@' (comment), 14 newline, 15 'E' (exponent)
OBJ_26058:
        CON(5)  DOHSTR                           * 26058
        LENGTH                                   * 2605D  length, to #26162
          NIBHEX  0000000000500500               * 26062  #00-#0F ................
          NIBHEX  0000000000060000               * 26072  #10-#1F ................
          NIBHEX  555511153455B5A5               * 26082  #20-#2F  !"#$%&'()*+,-./
          NIBHEX  2222222222555C51               * 26092  #30-#3F 0123456789:;<=>?
          NIBHEX  D1111F1111111111               * 260A2  #40-#4F @ABCDEFGHIJKLMNO
          NIBHEX  1111111111131455               * 260B2  #50-#5F PQRSTUVWXYZ[\]^_
          NIBHEX  1111111111111111               * 260C2  #60-#6F `abcdefghijklmno
          NIBHEX  1111111111135410               * 260D2  #70-#7F pqrstuvwxyz{|}~.
          NIBHEX  5115511155551111               * 260E2  #80-#8F ∡ā∇√∫Σ▶π∂≤≥≠α→←↓
          NIBHEX  1111111111111111               * 260F2  #90-#9F ↑γδεηθλρστωΔΠΩ■∞
          NIBHEX  0111111111131111               * 26102  #A0-#AF .¡¢£¤¥¦§¨©ª«¬­®¯
          NIBHEX  1111111111141111               * 26112  #B0-#BF °±²³´µ¶·¸¹º»¼½¾¿
          NIBHEX  1111111111111111               * 26122  #C0-#CF ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏ
          NIBHEX  1111111111111111               * 26132  #D0-#DF ÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß
          NIBHEX  1111111111111111               * 26142  #E0-#EF àáâãäåæçèéêëìíîï
          NIBHEX  1111111111111111               * 26152  #F0-#FF ðñòóôõö÷øùúûüýþÿ
        ENDLENGTH                                * 26162

* hxs-mask $ #start -> hxs-mask $ #next $token
* refs (23): 0BC2E 0BE00 238DB 245B4 24690 250A9 ...
GetNextToken:
        :: DUP4UNROLL DPRADIX? GetNextToken~1 OBJ_261AD GetNextToken NOTcase * 26162
          NULL$                                  * 26185
          ROT2DUP SWAP#1+ 5UNROLL 5UNROLL 3UNROLL SUB$ ; * 2618A

* refs (2): 25072 26176
OBJ_261AD:
        CON(5)  (*)+5                            * 261AD  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 261B2
        LC(5)   FALSE                            * 261B5
        ?C=A    A                                * 261BC
        GOYES   L_26224                          * 261BF
        D1=D1+  5                                * 261C1
        C=DAT1  A                                * 261C4
        CD1EX                                    * 261C7
        D1=D1+  5                                * 261CA
        A=DAT1  A                                * 261CD
        D1=C                                     * 261D0
        D1=D1+  10                               * 261D3
        C=DAT1  A                                * 261D6
        CD1EX                                    * 261D9
        RSTK=C                                   * 261DC
        D1=D1+  5                                * 261DE
        C=DAT1  A                                * 261E1
        CD1EX                                    * 261E4
        D1=D1-  5                                * 261E7
        C=RSTK                                   * 261EA
        CD1EX                                    * 261EC
        A=A+A   A                                * 261EF
        ?C<=A   A                                * 261F1
        GOYES   L_26221                          * 261F4
        A=DAT1  10                               * 261F6
        D1=D1+  5                                * 261FA
        DAT1=A  10                               * 261FD
        D1=D1-  5                                * 26201
        D1=D1-  15                               * 26204
        A=DAT1  15                               * 26207
        D1=D1+  5                                * 2620B
        DAT1=A  15                               * 2620E
        D=D+1   A                                * 26212
        LC(5)   SKIP                             * 26214
L_2621B:
        A=C     A                                * 2621B
        PC=(A)                                   * 2621D
L_26221:
        D1=D1-  15                               * 26221
L_26224:
        LC(5)   OBJ_2622F                        * 26224
        GOTO    L_2621B                          * 2622B
        RPL

* refs (2): 254A7 26224
OBJ_2622F:
        :: ' Π'ioinprogress undo NOTcase OBJ_26293 * 2622F
          NOTcase OBJ_26293                      * 2624D
          OBJ_2FB64 case OBJ_262BB               * 26257
          FALSE FALSE' Π'ioinprogress STOLAM OBJ_26289 ERROROUT ; * 26266

* refs (4): 2399D 259CA 2627A 262F2
OBJ_26289:
        # CFF                                    * 26289  3327

* refs (3): 26248 26252 262DE
OBJ_26293:
        :: DUP BINT6 BINT5 RPITE ROLLDROP COLASKIP * 26293
        ;                                        * 262B6

* refs (1): 26261
OBJ_262BB:
        :: case OBJ_26301                        * 262BB
          FALSE' Π'ioinprogress STOLAM case OBJ_26293 * 262CA
          FALSE FALSE TRUE OBJ_26289 ERROROUT ;  * 262E3

* refs (1): 262C5
OBJ_26301:
        :: SWAP ITE ROTROT2DROP SWAPDROP         * 26301
          SWAP 4ROLL OVERLEN$ SUB$ SWAP&$ BINT1 COLACOLA ; * 2631A
        ASSEMBLE

* refs (1): 26363
GetNextToken~2:
        ST=1    2                                * 26342
        A=DAT1  A                                * 26345
        D1=D1+  5                                * 26348
        D=D+1   A                                * 2634B
        LC(5)   TRUE                             * 2634D
        ?C=A    A                                * 26354
        RTNYES                                   * 26357
        ST=0    2                                * 26359
        RTNCC                                    * 2635C

* refs (1): 26171
GetNextToken~1:
        CON(5)  (*)+5                            * 2635E  primitive code object
        GOSUB   GetNextToken~2                   * 26363
        ST=1    3                                * 26367
        A=DAT1  A                                * 2636A
        D1=D1+  5                                * 2636D
        D=D+1   A                                * 26370
        GOSBVL  SAVPTR                           * 26372
        D0=A                                     * 26379
        D0=D0+  5                                * 2637C
        A=DAT0  A                                * 2637F
        B=A     A                                * 26382
        A=DAT1  A                                * 26384
        D1=D1+  5                                * 26387
        AD0EX                                    * 2638A
        D0=D0+  5                                * 2638D
        A=DAT1  A                                * 26390
        AD1EX                                    * 26393
        D1=D1+  10                               * 26396
        A=B     A                                * 26399
        A=A+A   A                                * 2639B
        GONC    L_263A4                          * 2639D
L_263A0:
        GOTO    L_26435                          * 263A0
L_263A4:
        LC(5)   #00003                           * 263A4
        A=A+C   A                                * 263AB
        GOC     L_263A0                          * 263AD
        C=DAT0  A                                * 263B0
        C=C-A   A                                * 263B3
        GOC     L_263A0                          * 263B5
        D=C     A                                * 263B8
        CD0EX                                    * 263BA
        C=C+A   A                                * 263BD
        GOC     L_263A0                          * 263BF
        D0=C                                     * 263C2
        CD1EX                                    * 263C5
        A=0     A                                * 263C8
        GONC    L_263CF                          * 263CA
L_263CD:
        B=B+1   A                                * 263CD
L_263CF:
        ?D=0    A                                * 263CF
        GOYES   L_26435                          * 263D2
        A=DAT0  B                                * 263D4
        D1=C                                     * 263D7
        C=C+A   A                                * 263DA
        CD1EX                                    * 263DC
        C=DAT1  S                                * 263DF
        GOSUBL  SUB_2653C                        * 263E3
        D0=D0+  2                                * 263E9
        D=D-1   A                                * 263EC
        D=D-1   A                                * 263EE
        ?C=0    S                                * 263F0
        GOYES   L_263CD                          * 263F3
        ?D=0    A                                * 263F5
        GOYES   L_2644E                          * 263F8
        P=C     15                               * 263FA
        ?P=     3                                * 263FE
        GOYES   L_2644E                          * 26401
        ?P=     4                                * 26403
        GOYES   L_2644E                          * 26406
        ?P=     5                                * 26408
        GOYES   L_2644E                          * 2640B
        ?P=     7                                * 2640D
        GOYES   L_26469                          * 26410
        BCEX    A                                * 26412
        R0=C                                     * 26414
        BCEX    A                                * 26417
        ?P=     6                                * 26419
        GOYES   L_26422                          * 2641C
        GOTO    L_264B7                          * 2641E
L_26422:
        C=0     S                                * 26422
        C=C+1   S                                * 26425
        D=D-1   A                                * 26428
        D=D-1   A                                * 2642A
        D0=D0+  2                                * 2642C
        B=B+1   A                                * 2642F
        GOTO    L_264B7                          * 26431
L_26435:
        A=B     A                                * 26435
        R0=A                                     * 26437
        GOSBVL  PUSH#                            * 2643A
        LC(5)   FALSE                            * 26441
        A=C     A                                * 26448
        PC=(A)                                   * 2644A
L_2644E:
        P=      0                                * 2644E
        A=B     A                                * 26450
        R0=A                                     * 26452
        GOSBVL  PUSH#                            * 26455
        LC(5)   dup;true                         * 2645C
        A=C     A                                * 26463
        PC=(A)                                   * 26465
L_26469:
        P=      0                                * 26469
        A=B     A                                * 2646B
        R0=A                                     * 2646D
        GOSBVL  PUSH#                            * 26470
        LC(5)   1+(s);true                       * 26477
        A=C     A                                * 2647E
        PC=(A)                                   * 26480
L_26484:
        P=      0                                * 26484
        A=B     A                                * 26486
        R1=A                                     * 26488
        GOSBVL  PUSH#                            * 2648B
        GOSBVL  SAVPTR                           * 26492
        A=R1                                     * 26499
        R0=A                                     * 2649C
        GOSBVL  PUSH#                            * 2649F
        LC(5)   TRUE                             * 264A6
        A=C     A                                * 264AD
        PC=(A)                                   * 264AF
L_264B3:
        P=      0                                * 264B3
L_264B5:
        B=B+1   A                                * 264B5
L_264B7:
        ?D=0    A                                * 264B7
        GOYES   L_26484                          * 264BA
        A=DAT0  B                                * 264BC
        D1=C                                     * 264BF
        C=C+A   A                                * 264C2
        CD1EX                                    * 264C4
        A=DAT1  S                                * 264C7
        CAEX    S                                * 264CB
        GOSUBL  SUB_2655F                        * 264CE
        CAEX    S                                * 264D4
        D=D-1   A                                * 264D7
        D=D-1   A                                * 264D9
        D0=D0+  2                                * 264DB
        ?C=A    S                                * 264DE
        GOYES   L_264B5                          * 264E1
        P=C     15                               * 264E3
        ?P=     2                                * 264E7
        GOYES   L_264F5                          * 264EA
        ?P=     1                                * 264EC
        GOYES   L_26508                          * 264EF
        GOTO    L_26484                          * 264F1
L_264F5:
        CAEX    S                                * 264F5
        P=C     15                               * 264F8
        CAEX    S                                * 264FC
        ?P=     15                               * 264FF
        GOYES   L_26528                          * 26502
        GOTO    L_26484                          * 26504
L_26508:
        CAEX    S                                * 26508
        P=C     15                               * 2650B
        CAEX    S                                * 2650F
        ?P=     2                                * 26512
        GOYES   L_264B3                          * 26515
        ?P=     15                               * 26517
        GOYES   L_264B3                          * 2651A
        ?P#     6                                * 2651C
        GOYES   L_26524                          * 2651F
        GONC    L_26528                          * 26521
L_26524:
        GOTO    L_26484                          * 26524
L_26528:
        P=      0                                * 26528
        ?D=0    A                                * 2652A
        GOYES   L_26538                          * 2652D
        D=D-1   A                                * 2652F
        D=D-1   A                                * 26531
        D0=D0+  2                                * 26533
        B=B+1   A                                * 26536
L_26538:
        GOTO    L_264B5                          * 26538

* refs (1): 263E3
SUB_2653C:
        CPEX    15                               * 2653C
        ?P=     13                               * 26540
        GOYES   L_2658D                          * 26543
        ?P=     14                               * 26545
        GOYES   L_2658A                          * 26548
        ?ST=0   3                                * 2654A
        GOYES   L_26582                          * 2654D
        ?P=     15                               * 2654F
        GOYES   L_26557                          * 26552
        GONC    L_26563                          * 26554
L_26557:
        P=      1                                * 26557
        CPEX    15                               * 26559
        RTN                                      * 2655D

* refs (1): 264CE
SUB_2655F:
        CPEX    15                               * 2655F
L_26563:
        ?P=     8                                * 26563
        GOYES   L_2657D                          * 26566
        ?P=     9                                * 26568
        GOYES   L_2659E                          * 2656B
        ?P=     10                               * 2656D
        GOYES   L_265AB                          * 26570
        ?P=     11                               * 26572
        GOYES   L_265B8                          * 26575
        CPEX    15                               * 26577
        RTN                                      * 2657B
L_2657D:
        ?ST=1   2                                * 2657D
        GOYES   L_265A3                          * 26580
L_26582:
        P=      0                                * 26582
        CPEX    15                               * 26584
        RTN                                      * 26588
L_2658A:
        ST=0    3                                * 2658A
L_2658D:
        ?ST=0   3                                * 2658D
        GOYES   L_26598                          * 26590
        ST=0    3                                * 26592
        GONC    L_26582                          * 26595
L_26598:
        ST=1    3                                * 26598
        GOC     L_26582                          * 2659B
L_2659E:
        ?ST=1   2                                * 2659E
        GOYES   L_26582                          * 265A1
L_265A3:
        P=      2                                * 265A3
        CPEX    15                               * 265A5
        RTN                                      * 265A9
L_265AB:
        ?ST=1   2                                * 265AB
        GOYES   L_265A3                          * 265AE
L_265B0:
        P=      5                                * 265B0
        CPEX    15                               * 265B2
        RTN                                      * 265B6
L_265B8:
        ?ST=1   2                                * 265B8
        GOYES   L_265B0                          * 265BB
        P=      2                                * 265BD
        CPEX    15                               * 265BF
        RTN                                      * 265C3
        RPL

* refs (1): 2645C
dup;true:
        :: DUP TRUE ;                            * 265C5

* refs (1): 26477
1+(s);true:
        :: #1+ TRUE ;                            * 265D9

* refs (2): 25013 25D21
realPAcode:
        CON(5)  (*)+5                            * 265ED  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 265F2
        CD1EX                                    * 265F5
        D1=D1+  10                               * 265F8
        A=DAT1  B                                * 265FB
        ASL     A                                * 265FE
        ASL     A                                * 26600
        D1=C                                     * 26602
        D1=D1+  5                                * 26605
        C=DAT1  A                                * 26608
        CD1EX                                    * 2660B
        D1=D1+  10                               * 2660E
        A=DAT1  B                                * 26611
        D1=C                                     * 26614
        D1=D1+  5                                * 26617
        P=      12                               * 2661A
L_2661C:
        ASL     W                                * 2661C
        ASL     W                                * 2661F
        P=P+1                                    * 26622
        GONC    L_2661C                          * 26624
        LA(8)   #2D2B3039                        * 26627
        R0=A                                     * 26634
        D=D+1   A                                * 26637
        D=D+1   A                                * 26639
        GOSBVL  SAVPTR                           * 2663B
        A=DAT1  A                                * 26642
        D1=A                                     * 26645
        D1=D1+  5                                * 26648
        C=DAT1  A                                * 2664B
        D0=C                                     * 2664E
        D0=D0-  5                                * 26651
        D1=D1+  5                                * 26654
        A=0     W                                * 26657
        SETDEC                                   * 2665A
        D=0     A                                * 2665C
        D=D-1   A                                * 2665E
        B=0     A                                * 26660
        ST=0    1                                * 26662
        ST=0    2                                * 26665
        ST=0    3                                * 26668
        ST=0    4                                * 2666B
        ST=0    5                                * 2666E
        ST=0    0                                * 26671
        GOSUBL  SUB_2681A                        * 26674
        GOC     L_26695                          * 2667A
L_2667D:
        SETHEX                                   * 2667D
        P=      0                                * 2667F
        GOSBVL  GETPTR                           * 26681
        LC(5)   FALSE                            * 26688
        A=C     A                                * 2668F
        PC=(A)                                   * 26691
L_26695:
        ?P=     0                                * 26695
        GOYES   L_2667D                          * 26698
        ?P=     14                               * 2669A
        GOYES   L_2667D                          * 2669D
        ?P=     12                               * 2669F
        GOYES   L_266AC                          * 266A2
        ?P#     13                               * 266A4
        GOYES   L_266B9                          * 266A7
        ST=1    1                                * 266A9
L_266AC:
        GOSUBL  SUB_2681A                        * 266AC
        GOC     L_266B9                          * 266B2
        GOTO    L_2676E                          * 266B5
L_266B9:
        ?P=     1                                * 266B9
        GOYES   L_266D1                          * 266BC
        ?P=     2                                * 266BE
        GOYES   L_266EC                          * 266C1
        ?P=     15                               * 266C3
        GOYES   L_266F3                          * 266C6
        ?P=     14                               * 266C8
        GOYES   L_26703                          * 266CB
        GOTO    L_267D1                          * 266CD
L_266D1:
        SETDEC                                   * 266D1
        ?ST=0   4                                * 266D3
        GOYES   L_266DA                          * 266D6
        D=D+1   A                                * 266D8
L_266DA:
        ?ST=0   3                                * 266DA
        GOYES   L_266E1                          * 266DD
        D=D-1   A                                * 266DF
L_266E1:
        ST=1    5                                * 266E1
        GOSUB   SUB_2670F                        * 266E4
        GOTO    L_266AC                          * 266E8
L_266EC:
        ST=1    4                                * 266EC
        GOTO    L_266D1                          * 266EF
L_266F3:
        ?ST=0   3                                * 266F3
        GOYES   L_266FC                          * 266F6
L_266F8:
        GOTO    L_267D1                          * 266F8
L_266FC:
        ST=1    3                                * 266FC
        GOTO    L_266AC                          * 266FF
L_26703:
        ?ST=0   5                                * 26703
        GOYES   L_266F8                          * 26706
        ST=0    5                                * 26708
        GOTO    L_26725                          * 2670B

* refs (1): 266E4
SUB_2670F:
        P=      14                               * 2670F
        ?A#0    P                                * 26711
        RTNYES                                   * 26714
        ASL     B                                * 26716
        ASL     W                                * 26719
        ?A=0    P                                * 2671C
        RTNYES                                   * 2671F
        GOTO    L_26867                          * 26721
L_26725:
        GOSUB   SUB_2681A                        * 26725
        GOC     L_26730                          * 26729
        GOTO    L_26788                          * 2672C
L_26730:
        ?ST=1   0                                * 26730
        GOYES   L_26749                          * 26733
        ?P=     12                               * 26735
        GOYES   L_26742                          * 26738
        ?P#     13                               * 2673A
        GOYES   L_26749                          * 2673D
        ST=1    2                                * 2673F
L_26742:
        ST=1    0                                * 26742
        GOTO    L_26725                          * 26745
L_26749:
        ?P=     1                                * 26749
        GOYES   L_26757                          * 2674C
        ?P=     2                                * 2674E
        GOYES   L_26757                          * 26751
L_26753:
        GOTO    L_267D1                          * 26753
L_26757:
        ?B#0    XS                               * 26757
        GOYES   L_26753                          * 2675A
        BSL     X                                * 2675C
        P=      0                                * 2675F
        B=A     P                                * 26761
        ST=1    5                                * 26764
        ST=1    0                                * 26767
        GOTO    L_26725                          * 2676A
L_2676E:
        ?ST=1   4                                * 2676E
        GOYES   L_26791                          * 26771
        ?ST=0   5                                * 26773
        GOYES   L_2677F                          * 26776
        A=0     W                                * 26778
        GOTO    L_267F7                          * 2677B
L_2677F:
        ?ST=1   3                                * 2677F
        GOYES   L_267D1                          * 26782
        GOTO    L_2667D                          * 26784
L_26788:
        ?ST=1   5                                * 26788
        GOYES   L_26791                          * 2678B
        GOTO    L_267D1                          * 2678D
L_26791:
        A=0     S                                * 26791
        A=0     B                                * 26794
        ?A=0    W                                * 26797
        GOYES   L_267F7                          * 2679A
        P=      14                               * 2679C
        ?A#0    P                                * 2679E
        GOYES   L_267AB                          * 267A1
L_267A3:
        ASL     W                                * 267A3
        ?A=0    P                                * 267A6
        GOYES   L_267A3                          * 267A9
L_267AB:
        SETDEC                                   * 267AB
        C=D     A                                * 267AD
        ?ST=0   2                                * 267AF
        GOYES   L_267B6                          * 267B2
        B=-B    A                                * 267B4
L_267B6:
        C=C+B   A                                * 267B6
        D=C     A                                * 267B8
        P=      0                                * 267BA
        LC(5)   #00500                           * 267BC
        DCEX    A                                * 267C3
        ?D>C    A                                * 267C5
        GOYES   L_267E9                          * 267C8
        D=-D    A                                * 267CA
        ?D<C    A                                * 267CC
        GOYES   L_267E9                          * 267CF
L_267D1:
        SETHEX                                   * 267D1
        P=      0                                * 267D3

* <REF>GETPTR , Loop to FalseTrue
GPPushFTLp:
        GOSBVL  GETPTR                           * 267D5

* Loop to False/True
PushFTLp:
        LC(5)   failed                           * 267DC
        A=C     A                                * 267E3
        PC=(A)                                   * 267E5
L_267E9:
        A=C     X                                * 267E9
        A=0     S                                * 267EC
        ?ST=0   1                                * 267EF
        GOYES   L_267F7                          * 267F2
        A=-A-1  S                                * 267F4
L_267F7:
        GOSBVL  PUSH%                            * 267F7
        LC(5)   TRUE                             * 267FE
        A=C     A                                * 26805
        C=DAT1  A                                * 26807
        D1=D1+  5                                * 2680A
        DAT1=C  A                                * 2680D
        D1=D1-  5                                * 26810
        DAT1=A  A                                * 26813
        PC=(A)                                   * 26816

* refs (3): 26674 266AC 26725
SUB_2681A:
        SETHEX                                   * 2681A
        P=      0                                * 2681C
        D0=D0-  2                                * 2681E
        GONC    L_26826                          * 26821
        RTNCC                                    * 26824
L_26826:
        P=      12                               * 26826
        A=DAT1  B                                * 26828
        D1=D1+  2                                * 2682B
        C=R0                                     * 2682E
        ?C<A    B                                * 26831
        GOYES   L_2684F                          * 26834
        CSR     W                                * 26836
        CSR     W                                * 26839
        ?C>A    B                                * 2683C
        GOYES   L_26855                          * 2683F
        P=      1                                * 26841
        A=A-C   B                                * 26843
        ?A=0    B                                * 26846
        RTNYES                                   * 26849
        P=      2                                * 2684B
        RTNSC                                    * 2684D
L_2684F:
        CSR     W                                * 2684F
        CSR     W                                * 26852
L_26855:
        CSR     W                                * 26855
        CSR     W                                * 26858
        ?C=A    B                                * 2685B
        RTNYES                                   * 2685E
        P=P+1                                    * 26860
        GONC    L_26855                          * 26862
        RTN                                      * 26865
L_26867:
        SETDEC                                   * 26867
        C=0     B                                * 26869
        P=      2                                * 2686C
        LC(1)   #5                               * 2686E
        A=A+C   XS                               * 26871
        RTNNC                                    * 26874
        A=A+1   M                                * 26877
        RTNNC                                    * 2687A
        D=D+1   A                                * 2687D
        P=      14                               * 2687F
        A=A+1   P                                * 26881
        RTN                                      * 26884
        RPL

* refs (1): 2DC2F
DOSERVER~1:
        :: DROP PATHDIR DO>STR APPEND_SPACE 'EvalNoCK:_sup xMEM DECOMP$ &$ * 26886
          NEWLINE$&$ ;                           * 268B3

* refs (1): 22DE7
LIB700.config:
        :: # 700 TOSRRP ;                        * 268BD

* refs (1): 62AED
MACRODCMP~1:
        :: NOTROMPcase OBJ_26912                 * 268D6
          COLA MACRODCMP~2                       * 268E5
        ;                                        * 268EF

* refs (1): 268EA
MACRODCMP~2:
        :: RPTRACC NOTcase BINT2                 * 268F4
          OBJ_26912 ;                            * 26908

* refs (2): 268E0 26908
OBJ_26912:
        CON(5)  L_71E1D                          * 26912  code object: the address of its machine code

* refs (1): 24582
OBJ_26917:
        :: NOTROMPcase OBJ_26953                 * 26917
          COLA OBJ_26935                         * 26926
        ;                                        * 26930

* refs (1): 2692B
OBJ_26935:
        :: RPTRACC case OBJ_26953                * 26935
          FALSE ;                                * 26949

* refs (2): 26921 26944
OBJ_26953:
        CON(5)  L_71F99                          * 26953  code object: the address of its machine code
        ASSEMBLE
L_26958:
        A=DAT1  1                                * 26958
        D1=C                                     * 2695C
        ABIT=0  2                                * 2695F
        ABIT=0  3                                * 26964
        A=A-1   P                                * 26969
        GOC     L_26988                          * 2696C
        ?A=0    P                                * 2696F
        GOYES   L_26988                          * 26972
        LC(5)   FALSE                            * 26974
        DAT1=C  A                                * 2697B
        A=DAT0  A                                * 2697E
        D0=D0+  5                                * 26981
        PC=(A)                                   * 26984
L_26988:
        GOSBVL  SAVPTR                           * 26988
        C=R0.F  A                                * 2698F
        D0=C                                     * 26995
        C=0     S                                * 26998
        GOTO    L_26FE1                          * 2699B
        RPL

* refs (7): 24573 2528C 271CF 40549 62AC5 72EB9 ...
OBJ_2699F:
        :: NOTROMPcase OBJ_269BD                 * 2699F
          COLA OBJ_269E7                         * 269AE
        ;                                        * 269B8

* refs (1): 269A9
OBJ_269BD:
        :: DUPROM-WORD? case OBJ_269DB           * 269BD
          DROPFALSE ;                            * 269D1

* refs (2): 269CC 26A96
OBJ_269DB:
        CON(5)  (*)+5                            * 269DB  primitive code object
        ASSEMBLE
        ST=1    5                                * 269E0
        GOTO    L_269EF                          * 269E3

* refs (2): 269B3 26AC3
OBJ_269E7:
        CON(5)  (*)+5                            * 269E7  primitive code object
        ST=0    5                                * 269EC
L_269EF:
        C=DAT1  A                                * 269EF
        CD1EX                                    * 269F2
        D1=D1+  5                                * 269F5
        ?ST=0   5                                * 269F8
        GOYES   L_26A00                          * 269FB
        D1=D1-  11                               * 269FD
L_26A00:
        A=DAT1  X                                * 26A00
        D1=C                                     * 26A04
        LC(3)   #700                             * 26A07
        A=A-C   X                                * 26A0C
        LC(5)   TRUE                             * 26A0F
        GONC    L_26A20                          * 26A16
        LC(5)   FALSE                            * 26A19
L_26A20:
        DAT1=C  A                                * 26A20
        A=DAT0  A                                * 26A23
        D0=D0+  5                                * 26A26
        PC=(A)                                   * 26A29
        RPL

* ob -> ob flag
* refs (11): 1CDE8 1F87A 27490 2923E 40576 405E9 ...
?OKINALG:
        :: CK&DISPATCH0                          * 26A2D
          BINT8 OBJ_26A82                        * 26A37  program
          BINT15 ?OKINALG~romptr                 * 26A41  romptr
          BINT1 TRUE                             * 26A4B  real
          BINT2 TRUE                             * 26A55  complex
          BINT14 TRUE                            * 26A5F  unit
          BINT10 TRUE                            * 26A69  name|local|algebraic
          BINT0 FALSE                            * 26A73  any
        ;                                        * 26A7D

* refs (2): 26A3C 6E04D
OBJ_26A82:
        :: DUPROM-WORD? NOTcaseFALSE DUP         * 26A82
          OBJ_269DB caseFALSE OBJ_26B04          * 26A96
          NOTcase OBJ_26B2E                      * 26AA5
          TRUE ;                                 * 26AAF

* refs (1): 26A46
?OKINALG~romptr:
        :: DUP OBJ_269E7 caseFALSE OBJ_71DFF     * 26AB9
          FALSE ?OKINALG~romptr~1 ;              * 26AD2

* refs (1): 71F51
OBJ_26AE1:
        :: OBJ_26B04 casedrptru OBJ_26B2E        * 26AE1
          NOTcsdrpfls SWAPDROPTRUE ;             * 26AF5

* refs (2): 26AA0 26AE6
OBJ_26B04:
        CON(5)  L_71F00                          * 26B04  code object: the address of its machine code
        ASSEMBLE
L_26B09:
        D1=D1-  1                                * 26B09
        A=DAT1  1                                * 26B0C
        D1=C                                     * 26B10
        LC(5)   TRUE                             * 26B13
        ?ABIT=0 3                                * 26B1A
        GOYES   L_26B28                          * 26B1F
        LC(5)   FALSE                            * 26B21
L_26B28:
        A=C     A                                * 26B28
        PC=(A)                                   * 26B2A

* refs (2): 26AAA 26AF0
OBJ_26B2E:
        CON(5)  L_71F8B                          * 26B2E  code object: the address of its machine code
L_26B33:
        D1=D1-  1                                * 26B33
        A=DAT1  1                                * 26B36
        D1=C                                     * 26B3A
        ?ABIT=1 1                                * 26B3D
        GOYES   L_26B51                          * 26B42
        LC(5)   FALSE                            * 26B44
        A=C     A                                * 26B4B
        PC=(A)                                   * 26B4D
L_26B51:
        C=0     S                                * 26B51
        ?ABIT=0 2                                * 26B54
        GOYES   L_26B5E                          * 26B59
        C=C+1   S                                * 26B5B
L_26B5E:
        GOSBVL  SAVPTR                           * 26B5E
        C=R0.F  A                                * 26B65
        D0=C                                     * 26B6B
        GOTO    L_26FE1                          * 26B6E
        FILLTO  #26BED                           * 26B72  123 zero nibbles: the next entry stays at #26BED
        RPL

* refs (15): 0C218 1F889 2749F 40643 5E9E6 68828 ...
* Probably: ob -> ob' x #n TRUE | ob FALSE: the argument count of a program or ROMPTR that starts with CKn&Dispatch or -> locals
OBJ_26BED:
        :: CK&DISPATCH0                          * 26BED
          BINT15 OBJ_26C1A                       * 26BF7  romptr
          BINT8 OBJ_26C72                        * 26C01  program
          BINT0 FALSE                            * 26C0B  any
        ;                                        * 26C15

* refs (2): 26BFC 29270
OBJ_26C1A:
        :: OBJ_71DFF FALSE OBJ_720D4 OBJ_26C72 NOTcsdrpfls ROTDROP TRUE ; * 26C1A

* refs (1): 26C7C
OBJ_26C47:
        CON(5)  (*)+5                            * 26C47  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 26C4C
        LC(5)   FALSE                            * 26C4F
        ?C=A    A                                * 26C56
        GOYES   L_26C65                          * 26C59
        A=DAT0  A                                * 26C5B
        D0=D0+  5                                * 26C5E
        PC=(A)                                   * 26C61
L_26C65:
        LC(5)   SEMI                             * 26C65
        A=C     A                                * 26C6C
        PC=(A)                                   * 26C6E
        RPL

* refs (3): 26C06 26C2E 28C22
OBJ_26C72:
        :: OBJ_26C8B OBJ_26C47 OBJ_721A6 ;       * 26C72

* refs (1): 26C77
OBJ_26C8B:
        CON(5)  L_7211C                          * 26C8B  code object: the address of its machine code
        ASSEMBLE
L_26C90:
        ?C=A    A                                * 26C90
        GOYES   L_26CC0                          * 26C93
        D1=(5)  L_26DA1                          * 26C95
        B=0     A                                * 26C9C
        B=B+CON A,5                              * 26C9E
L_26CA4:
        C=DAT1  A                                * 26CA4
        ?C=A    A                                * 26CA7
        GOYES   L_26CB4                          * 26CAA
        D1=D1+  5                                * 26CAC
        B=B-1   A                                * 26CAF
        GONC    L_26CA4                          * 26CB1
L_26CB4:
        ?B#0    A                                * 26CB4
        GOYES   L_26D0D                          * 26CB7
        GOVLNG  L_7218E                          * 26CB9
L_26CC0:
        CD0EX                                    * 26CC0
        RSTK=C                                   * 26CC3
        D0=C                                     * 26CC5
        D0=D0+  10                               * 26CC8
        B=0     A                                * 26CCB
        B=B+CON A,5                              * 26CCD
        LC(5)   DOLAM                            * 26CD3
        D=C     A                                * 26CDA
L_26CDC:
        B=B-1   A                                * 26CDC
        GOC     L_26D08                          * 26CDE
        GOSBVL  SKIPOB                           * 26CE1
        C=DAT0  A                                * 26CE8
        ?D=C    A                                * 26CEB
        GOYES   L_26CDC                          * 26CEE
        CD0EX                                    * 26CF0
        A=C     A                                * 26CF3
        C=DAT0  A                                * 26CF5
        D0=A                                     * 26CF8
        ?D=C    A                                * 26CFB
        GOYES   L_26CDC                          * 26CFE
        B=B-CON A,5                              * 26D00
        B=-B    A                                * 26D06
L_26D08:
        C=RSTK                                   * 26D08
        D0=C                                     * 26D0A
L_26D0D:
        D0=D0-  5                                * 26D0D
        CD0EX                                    * 26D10
        D0=C                                     * 26D13
        D0=D0-  7                                * 26D16
        A=DAT0  1                                * 26D19
        D0=C                                     * 26D1D
        ST=0    1                                * 26D20
        ?ABIT=0 0                                * 26D23
        GOYES   L_26D6C                          * 26D28
        C=0     S                                * 26D2A
        ?ABIT=0 2                                * 26D2D
        GOYES   L_26D37                          * 26D32
        C=C+1   S                                * 26D34
L_26D37:
        GOSBVL  SKIPOB                           * 26D37
        C=C-1   S                                * 26D3E
        GONC    L_26D37                          * 26D41
        A=DAT0  A                                * 26D44
        AD0EX                                    * 26D47
        R1=A.F  A                                * 26D4A
        A=DAT0  A                                * 26D50
        LC(5)   PRLG                             * 26D53
        ST=1    1                                * 26D5A
        ?C=A    A                                * 26D5D
        GOYES   L_26D92                          * 26D60
        ST=0    1                                * 26D62
        AD0EX                                    * 26D65
        GOTO    L_26D8C                          * 26D68
L_26D6C:
        A=B     A                                * 26D6C
        A=A+1   A                                * 26D6E
        GOC     L_26D75                          * 26D70
        A=A-1   A                                * 26D73
L_26D75:
        C=A     A                                * 26D75
        A=A+A   A                                * 26D77
        A=A+A   A                                * 26D79
        A=A+C   A                                * 26D7B
        LC(5)   L_26DBF                          * 26D7D
        A=A+C   A                                * 26D84
        D0=A                                     * 26D86
        A=DAT0  A                                * 26D89
L_26D8C:
        R1=A.F  A                                * 26D8C
L_26D92:
        A=B     A                                * 26D92
        R0=A.F  A                                * 26D94
        GOVLNG  L_721C4                          * 26D9A

L_26DA1:
        CON(5)  CK5&Dispatch                     * 26DA1  address (the code jumps or points through it)

        CON(5)  CK4&Dispatch                     * 26DA6  address (the code jumps or points through it)

        CON(5)  CK3&Dispatch                     * 26DAB  address (the code jumps or points through it)

        CON(5)  CK2&Dispatch                     * 26DB0  address (the code jumps or points through it)

        CON(5)  CK1&Dispatch                     * 26DB5  address (the code jumps or points through it)

        CON(5)  CK0                              * 26DBA  address (the code jumps or points through it)

L_26DBF:
        CON(5)  #0590410h                        * 26DBF  address (the code jumps or points through it)

        CON(5)  #050410h                         * 26DC4  address (the code jumps or points through it)

        CON(5)  #05060410h                       * 26DC9  address (the code jumps or points through it)

        CON(5)  #0506060410h                     * 26DCE  address (the code jumps or points through it)

        CON(5)  #050606060410h                   * 26DD3  address (the code jumps or points through it)

        CON(5)  #05060606060410h                 * 26DD8  address (the code jumps or points through it)
        RPL

* refs (4): 26DBF 27A85 2921B 692FB
#0590410h:
        HXS 0140950                              * 26DDD

* refs (1): 1B3D3
#050410h:
        HXS 014050                               * 26DEE

* refs (4): 1FB7B 26DC9 28491 6946D
#05060410h:
        HXS 01406050                             * 26DFE

* refs (1): 26DCE
#0506060410h:
        HXS 0140606050                           * 26E10

* refs (1): 26DD3
#050606060410h:
        HXS 014060606050                         * 26E24

* refs (1): 26DD8
#05060606060410h:
        HXS 01406060606050                       * 26E3A

* refs (2): 1A978 285D5
#00700h:
        HXS 00700                                * 26E52

* refs (8): 27B2F 28C72 28E52 40666 68D14 6E2FD ...
OBJ_26E61:
        CON(5)  (*)+5                            * 26E61  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 26E66
        A=DAT1  A                                * 26E6D
        AD1EX                                    * 26E70
        D1=D1+  5                                * 26E73
        C=DAT1  A                                * 26E76
        B=C     A                                * 26E79
        AD1EX                                    * 26E7B
        B=B+A   A                                * 26E7E
        AD1EX                                    * 26E80
        B=B-1   A                                * 26E83
        D1=D1+  5                                * 26E85
        C=0     A                                * 26E88
        C=DAT1  1                                * 26E8A
        R0=C.F  A                                * 26E8E
        D1=D1+  1                                * 26E94
        LC(5)   FALSE                            * 26E97
        C=DAT1  S                                * 26E9E
        C=C-1   S                                * 26EA2
        C=C-1   S                                * 26EA5
        GOC     L_26EB5                          * 26EA8
        LC(5)   TRUE                             * 26EAB
        D1=D1+  1                                * 26EB2
L_26EB5:
        AD1EX                                    * 26EB5
        DAT1=C  A                                * 26EB8
        D1=A                                     * 26EBB
        D1=D1+  1                                * 26EBE
        LC(5)   FALSE                            * 26EC1
        AD1EX                                    * 26EC8
        D1=A                                     * 26ECB
        ?A=B    A                                * 26ECE
        GOYES   L_26EF0                          * 26ED1
        A=0     B                                * 26ED3
        A=DAT1  1                                * 26ED6
        A=A-CON B,4                              * 26EDA
        GOC     L_26EF0                          * 26EE0
        A=A-1   B                                * 26EE3
        GONC    L_26EF0                          * 26EE6
        LC(5)   TRUE                             * 26EE9
L_26EF0:
        R3=C.F  A                                * 26EF0
        A=B     A                                * 26EF6
        D1=A                                     * 26EF8
        A=0     A                                * 26EFB
        A=DAT1  1                                * 26EFD
        R1=A.F  A                                * 26F01
        GOSBVL  PUSH2#                           * 26F07
        A=R3.F  A                                * 26F0E
        PC=(A)                                   * 26F14

* refs (2): 54B37 56D3D
OBJ_26F18:
        CON(5)  (*)+5                            * 26F18  primitive code object
        P=      15                               * 26F1D
        LC(1)   #4                               * 26F1F
        GOTO    L_26F88                          * 26F22

* refs (2): 57383 573BF
OBJ_26F26:
        CON(5)  (*)+5                            * 26F26  primitive code object
        P=      15                               * 26F2B
        LC(1)   #5                               * 26F2D
        GOTO    L_26F88                          * 26F30

* refs (2): 58D48 85E8F
OBJ_26F34:
        CON(5)  (*)+5                            * 26F34  primitive code object
        P=      15                               * 26F39
        LC(1)   #6                               * 26F3B
        GOTO    L_26F88                          * 26F3E

* refs (1): 57B1F
?expanapp~2:
        CON(5)  (*)+5                            * 26F42  primitive code object
        P=      15                               * 26F47
        LC(1)   #7                               * 26F49
        GOTO    L_26F88                          * 26F4C

* refs (1): 3F1E8
OBJ_26F50:
        CON(5)  (*)+5                            * 26F50  primitive code object
        P=      15                               * 26F55
        LC(1)   #8                               * 26F57
        GOTO    L_26F88                          * 26F5A

* refs (1): 5B1D6
intg1~2:
        CON(5)  (*)+5                            * 26F5E  primitive code object
        P=      15                               * 26F63
        LC(1)   #9                               * 26F65
        GOTO    L_26F88                          * 26F68

* refs (2): 54891 84EC2
OBJ_26F6C:
        CON(5)  (*)+5                            * 26F6C  primitive code object
        P=      15                               * 26F71
        LC(1)   #A                               * 26F73
        GOTO    L_26F88                          * 26F76

* refs (7): 28B19 58DFF 5F34D 5F433 5F5DA 5F6A7 ...
OBJ_26F7A:
        CON(5)  (*)+5                            * 26F7A  primitive code object
        P=      15                               * 26F7F
        LC(1)   #B                               * 26F81
        NOP4                                     * 26F84
L_26F88:
        P=      0                                * 26F88
        R4=C.F  S                                * 26F8A
        GOSBVL  SAVPTR                           * 26F90
        C=DAT1  A                                * 26F97
        CD1EX                                    * 26F9A
        A=DAT1  A                                * 26F9D
        LC(5)   DOROMP                           * 26FA0
        GOVLNG  L_71FC3                          * 26FA7

* <REF>GETPTR , Do FALSE
* refs (11): 0425C 0B3A4 0BB4A 0E3D1 0E9AB 25CB5 ...
GETPTRFALSE:
        GOSBVL  GETPTR                           * 26FAE
        LC(5)   FALSE                            * 26FB5
        A=C     A                                * 26FBC
        PC=(A)                                   * 26FBE
L_26FC2:
        D0=A                                     * 26FC2
        D0=D0-  10                               * 26FC5
        C=DAT0  A                                * 26FC8
        A=R0.F  A                                * 26FCB
        D0=A                                     * 26FD1
        C=R4.F  S                                * 26FD4
        GOSUB   SUB_2702F                        * 26FDA
        GONC    GETPTRFALSE                      * 26FDE
L_26FE1:
        GOSBVL  SUB_7204C                        * 26FE1
        ST=1    1                                * 26FE8
        A=DAT0  A                                * 26FEB
        AD0EX                                    * 26FEE
        R0=A.F  A                                * 26FF1
        A=DAT0  A                                * 26FF7
        LC(5)   PRLG                             * 26FFA
        ?C=A    A                                * 27001
        GOYES   L_27012                          * 27004
        ST=0    1                                * 27006
        AD0EX                                    * 27009
        R0=A.F  A                                * 2700C
L_27012:
        GOSBVL  SUB_72080                        * 27012
        A=R0.F  A                                * 27019
        DAT1=A  A                                * 2701F
        LC(5)   OBJ_2705C                        * 27022
