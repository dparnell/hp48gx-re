* HP 48GX ROM revision R, #54000-#57003: Symbolic algebra
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: cknumdsptch1 Cr 1GETLAMSWP1+ sscknum2 sncknum2 nscknum2 lam'dvar xssgeneral xsngeneral xnsgeneral nmetasyms %>#
* Follows on from the previous file (at #54000 in the original ROM).
        ?D>=C   B                                * 54000
        GOYES   L_5400D                          * 54003
        DCEX    A                                * 54005
        P=C     0                                * 54007
        DCEX    A                                * 5400B
L_5400D:
        A=0     W                                * 5400D
        A=DAT1  WP                               * 54010
        P=C     0                                * 54014
        C=B     P                                * 54018
        A=A&B   P                                * 5401B
        RTNCC                                    * 5401F

* Fetches current word size to A, Clear Carry
* refs (2): 53FB5 54042
getwordsize:
        D0=(5)  #80844                           * 54021
        A=0     A                                * 54028
        A=DAT0  B                                * 5402A
        LC(2)   #3F                              * 5402D
        A=A&C   B                                * 54031
        A=A+1   A                                * 54035
        RTNCC                                    * 54037

* -> #
* refs (1): 53CF5
WORDSIZE:
        CON(5)  (*)+5                            * 54039  primitive code object
        GOSUB   SUB_53F69                        * 5403E
        GOSUB   getwordsize                      * 54042
        R0=A                                     * 54046
L_54049:
        GOVLNG  PUSH#LOOP                        * 54049

* -> #
* refs (4): 2565F 256C6 3ED34 5407F
BASE:
        CON(5)  (*)+5                            * 54050  primitive code object
        GOSUB   SUB_53F69                        * 54055
        GOSUB   SUB_541FA                        * 54059
        GOTO    L_54049                          * 5405D
        RPL

* hxs -> $
* refs (4): 15BD8 15D10 15F92 15FAB
HXS>$:
        ::                                       * 54061
          hxs>$                                  * 54066
          BASECHAR                               * 5406B
          >T$                                    * 54070
        ;                                        * 54075

* -> char
* refs (1): 5406B
BASECHAR:
        ::                                       * 5407A
          BASE                                   * 5407F
          BINT2                                  * 54084
          #=casedrop                             * 54089
          CHR_b                                  * 5408E
          BINT8                                  * 54093
          #=casedrop                             * 54098
          CHR_o                                  * 5409D
          BINT10                                 * 540A2
          #=case                                 * 540A7
          CHR_d                                  * 540AC
          CHR_h                                  * 540B1
        ;                                        * 540B6

* hxs -> $
* refs (1): 54066
hxs>$:
        CON(5)  (*)+5                            * 540BB  primitive code object
        ASSEMBLE
        GOSUB   SUB_53F69                        * 540C0
        GOSBVL  SUB_53F99                        * 540C4
        P=      0                                * 540CB
        GOSUB   SUB_541FA                        * 540CD
        D=0     A                                * 540D1
        D=D+1   A                                * 540D3
        D=D+1   A                                * 540D5
        D=D+1   A                                * 540D7
        ?C<=A   W                                * 540D9
        GOYES   L_540E8                          * 540DC
        C=0     B                                * 540DE
        C=C+1   B                                * 540E1
        GOTO    L_54124                          * 540E4
L_540E8:
        B=C     W                                * 540E8
        ?ST=1   2                                * 540EB
        GOYES   L_54101                          * 540EE
        ?ST=1   3                                * 540F0
        GOYES   L_5410F                          * 540F3
        C=C+C   W                                * 540F5
        C=C+C   W                                * 540F8
        C=C+B   W                                * 540FB
        GONC    L_5410F                          * 540FE
L_54101:
        C=C+C   W                                * 54101
        C=C+C   W                                * 54104
        ?ST=0   3                                * 54107
        GOYES   L_5410F                          * 5410A
        C=C+C   W                                * 5410C
L_5410F:
        D=D+1   A                                * 5410F
        C=C+C   W                                * 54111
        GOC     L_54121                          * 54114
        ?C=0    W                                * 54117
        GOYES   L_54121                          * 5411A
        ?C<=A   W                                * 5411C
        GOYES   L_540E8                          * 5411F
L_54121:
        C=B     W                                * 54121
L_54124:
        R2=A                                     * 54124
        R3=C                                     * 54127
        C=R0                                     * 5412A
        RSTK=C                                   * 5412D
        C=D     A                                * 5412F
        GOSBVL  MAKE$                            * 54131
        LC(4)   #2023                            * 54138
        DAT0=C  4                                * 5413E
        D0=D0+  4                                * 54142
        A=R2                                     * 54145
        C=0     W                                * 54148
        C=RSTK                                   * 5414B
        CR0EX                                    * 5414D
        RSTK=C                                   * 54150
        C=R3                                     * 54152
L_54155:
        B=0     B                                * 54155
        C=C-1   W                                * 54158
        ?C#0    W                                * 5415B
        GOYES   L_54166                          * 5415E
        ABEX    B                                * 54160
        GONC    L_54178                          * 54163
L_54166:
        C=C+1   W                                * 54166
L_54169:
        B=B+1   B                                * 54169
        A=A-C   W                                * 5416C
        GONC    L_54169                          * 5416F
        B=B-1   B                                * 54172
        A=A+C   W                                * 54175
L_54178:
        D=C     B                                * 54178
        LC(2)   #0A                              * 5417B
        ?B<C    B                                * 5417F
        GOYES   L_5418A                          * 54182
        LC(1)   #7                               * 54184
        B=B+C   B                                * 54187
L_5418A:
        LC(2)   #30                              * 5418A
        C=C+B   B                                * 5418E
        DAT0=C  B                                * 54191
        D0=D0+  2                                * 54194
        C=D     B                                * 54197
        ?C=0    W                                * 5419A
        GOYES   L_541EF                          * 5419D
        ?ST=1   2                                * 5419F
        GOYES   L_541DA                          * 541A2
        ?ST=1   3                                * 541A4
        GOYES   L_541E8                          * 541A7
        R1=A                                     * 541A9
        A=R0                                     * 541AC
        B=0     W                                * 541AF
        ?C#A    W                                * 541B2
        GOYES   L_541BC                          * 541B5
        B=B+1   A                                * 541B7
        GONC    L_541D0                          * 541B9
L_541BC:
        B=A     W                                * 541BC
        A=A+A   W                                * 541BF
        A=A+A   W                                * 541C2
        A=A+B   W                                * 541C5
        A=A+A   W                                * 541C8
        ?C#A    W                                * 541CB
        GOYES   L_541BC                          * 541CE
L_541D0:
        C=B     W                                * 541D0
        A=R1                                     * 541D3
        GOTO    L_54155                          * 541D6
L_541DA:
        CSRB                                     * 541DA
        CSRB                                     * 541DD
        ?ST=0   3                                * 541E0
        GOYES   L_541E8                          * 541E3
        CSRB                                     * 541E5
L_541E8:
        CSRB                                     * 541E8
        GOTO    L_54155                          * 541EB
L_541EF:
        C=RSTK                                   * 541EF
        A=C     A                                * 541F1
        GOVLNG  GPOverWrALp                      * 541F3

* refs (2): 54059 540CD
SUB_541FA:
        D0=(5)  #80845                           * 541FA
        C=DAT0  B                                * 54201
        CSTEX                                    * 54204
        C=0     W                                * 54206
        ?ST=0   2                                * 54209
        GOYES   L_5421C                          * 5420C
        LC(1)   #8                               * 5420E
        ?ST=0   3                                * 54211
        GOYES   L_54227                          * 54214
        C=C+C   B                                * 54216
        GONC    L_54227                          * 54219
L_5421C:
        LC(1)   #A                               * 5421C
        ?ST=0   3                                * 5421F
        GOYES   L_54227                          * 54222
        LC(1)   #2                               * 54224
L_54227:
        R0=C                                     * 54227
        RTNCC                                    * 5422A

* Push A.WP as hxs
* refs (2): 0596D 1C667
PUSHhxs:
        R0=A                                     * 5422C
        ST=0    10                               * 5422F
        C=0     A                                * 54232
        CPEX    0                                * 54234
        R1=C                                     * 54238
        C=C+CON A,11                             * 5423B
        GOSBVL  GETTEMP                          * 54241
        GOSBVL  SUB_37412                        * 54248
        C=R1                                     * 5424F
        P=C     0                                * 54252
        A=R0                                     * 54256
        D0=D0+  10                               * 54259
        DAT0=A  WP                               * 5425C
        D0=D0-  10                               * 54260
        AD0EX                                    * 54263

* <REF>GETPTR , Push A, Clear Carry
* refs (1): 307D5
GPPushA:
        P=      0                                * 54266
        ST=0    10                               * 54268
L_5426B:
        GOSUB   SUB_53F70                        * 5426B
        D=D-1   A                                * 5426F
        GONC    L_54297                          * 54271
        D0=(5)  OSAVE                            * 54274
        DAT0=A  A                                * 5427B
        GOSBVL  SUB_12D68                        * 5427E
        D0=(5)  OSAVE                            * 54285
        A=DAT0  A                                * 5428C
        C=0     A                                * 5428F
        DAT0=C  A                                * 54291
        GONC    L_5426B                          * 54294
L_54297:
        D1=D1-  5                                * 54297
        DAT1=A  A                                * 5429A
        RTNCC                                    * 5429D
        RPL

* % hxs -> hxs'
* refs (1): 1AF3C
bit%#/:
        ::                                       * 5429F
          SWAP                                   * 542A4
          %>#                                    * 542A9
          SWAP                                   * 542AE
          bit/                                   * 542B3
        ;                                        * 542B8

* hxs % -> hxs'
* refs (1): 1AF46
bit#%/:
        ::                                       * 542BD
          %>#                                    * 542C2
          bit/                                   * 542C7
        ;                                        * 542CC

* % hxs -> hxs'
* refs (1): 1AE25
bit%#*:
        ::                                       * 542D1
          SWAP                                   * 542D6
          %>#                                    * 542DB
          bit*                                   * 542E0
        ;                                        * 542E5

* hxs % -> hxs'
* refs (1): 1AE2F
bit#%*:
        ::                                       * 542EA
          %>#                                    * 542EF
          bit*                                   * 542F4
        ;                                        * 542F9

* % hxs -> hxs'
* refs (1): 1AD40
bit%#-:
        ::                                       * 542FE
          SWAP                                   * 54303
          %>#                                    * 54308
          SWAP                                   * 5430D
          bit-                                   * 54312
        ;                                        * 54317

* hxs % -> hxs'
* refs (1): 1AD4A
bit#%-:
        ::                                       * 5431C
          %>#                                    * 54321
          bit-                                   * 54326
        ;                                        * 5432B

* % hxs -> hxs'
* refs (1): 1AB9E
bit%#+:
        ::                                       * 54330
          SWAP                                   * 54335
          %>#                                    * 5433A
          bit+                                   * 5433F
        ;                                        * 54344

* hxs % -> hxs'
* refs (1): 1ABA8
bit#%+:
        ::                                       * 54349
          %>#                                    * 5434E
          bit+                                   * 54353
        ;                                        * 54358

* hxs -> %
* refs (4): 196CA 2DC9D B5FB8 B5FC2
#>%:
        CON(5)  (*)+5                            * 5435D  primitive code object
        ASSEMBLE
        GOSUB   POPHXS                           * 54362
        GOSUB   SUB_54371                        * 54366
L_5436A:
        GOVLNG  PUSH%LOOP                        * 5436A

* refs (1): 54366
SUB_54371:
        P=      0                                * 54371
        LC(2)   #63                              * 54373
        B=0     W                                * 54377
        D=0     W                                * 5437A
        D=D-1   S                                * 5437D
L_54380:
        D=D+D   A                                * 54380
        B=B+B   W                                * 54382
        GONC    L_5438A                          * 54385
        D=D+1   A                                * 54388
L_5438A:
        SETHEX                                   * 5438A
        A=A+A   W                                * 5438C
        SETDEC                                   * 5438F
        GONC    L_5439C                          * 54391
        B=B+1   W                                * 54394
        GONC    L_5439C                          * 54397
        D=D+1   A                                * 5439A
L_5439C:
        C=C-1   B                                * 5439C
        GONC    L_54380                          * 5439F
        C=0     X                                * 543A2
        C=C-1   X                                * 543A5
L_543A8:
        BSRC                                     * 543A8
        A=B     S                                * 543AB
        ?D#0    A                                * 543AE
        GOYES   L_543B8                          * 543B1
        ?B=0    W                                * 543B3
        GOYES   L_543D4                          * 543B6
L_543B8:
        B=0     S                                * 543B8
        ASR     W                                * 543BB
        C=C+1   X                                * 543BE
        SETHEX                                   * 543C1
        D=D-1   S                                * 543C3
        SETDEC                                   * 543C6
        GONC    L_543A8                          * 543C8
        DCEX    A                                * 543CB
        BCEX    A                                * 543CD
        DCEX    A                                * 543CF
        GOC     L_543A8                          * 543D1
L_543D4:
        P=      2                                * 543D4
        A=A+A   P                                * 543D6
        GONC    L_543EA                          * 543D9
        A=A+1   M                                * 543DC
        GONC    L_543EA                          * 543DF
        P=      14                               * 543E2
        A=A+1   P                                * 543E4
        C=C+1   X                                * 543E7
L_543EA:
        P=      0                                * 543EA
        A=C     X                                * 543EC
        ?A#0    M                                * 543EF
        RTNYES                                   * 543F2
        A=0     X                                * 543F4
        RTN                                      * 543F7

* % -> hxs
* refs (15): 1405B 196AA 1A7E8 1CA71 1CA7B 542A9 ...
%>#:
        CON(5)  (*)+5                            * 543F9  primitive code object
        GOSBVL  POP1%                            * 543FE
        SETHEX                                   * 54405
        ?A=0    S                                * 54407
        GOYES   L_54422                          * 5440A
L_5440C:
        A=0     W                                * 5440C
        GOTO    L_54419                          * 5440F
L_54413:
        A=0     W                                * 54413
        A=A-1   W                                * 54416
L_54419:
        P=      15                               * 54419
        GOVLNG  PUSHhxsLoop                      * 5441B
L_54422:
        ?A=0    W                                * 54422
        GOYES   L_54419                          * 54425
        LC(3)   #500                             * 54427
        ?C>A    X                                * 5442C
        GOYES   L_54451                          * 5442F
        LC(3)   #999                             * 54431
        ?C#A    X                                * 54436
        GOYES   L_5440C                          * 54439
        P=      14                               * 5443B
        LC(1)   #4                               * 5443D
        C=C-A   P                                * 54440
        P=      0                                * 54443
        GONC    L_5440C                          * 54445
        A=0     W                                * 54448
        A=A+1   B                                * 5444B
        GONC    L_54419                          * 5444E
L_54451:
        LC(3)   #019                             * 54451
        ?C<A    X                                * 54456
        GOYES   L_54413                          * 54459
        B=A     X                                * 5445B
        C=A     X                                * 5445E
        A=0     X                                * 54461
        P=      14                               * 54464
        SETDEC                                   * 54466
L_54468:
        P=P-1                                    * 54468
        ?P=     2                                * 5446A
        GOYES   L_5448F                          * 5446D
        C=C-1   X                                * 5446F
        GONC    L_54468                          * 54472
        A=A+A   P                                * 54475
        A=0     WP                               * 54478
        GONC    L_5448F                          * 5447B
        A=A-1   WP                               * 5447E
        A=A+1   W                                * 54481
        ?A=0    S                                * 54484
        GOYES   L_5448F                          * 54487
        ASR     W                                * 54489
        B=B+1   X                                * 5448C
L_5448F:
        C=0     W                                * 5448F
        SETHEX                                   * 54492
L_54494:
        C=C+C   W                                * 54494
        GONC    L_5449E                          * 54497
L_5449A:
        GOTO    L_54413                          * 5449A
L_5449E:
        D=C     W                                * 5449E
        C=C+C   W                                * 544A1
        GOC     L_5449A                          * 544A4
        C=C+C   W                                * 544A7
        GOC     L_5449A                          * 544AA
        C=C+D   W                                * 544AD
        GOC     L_5449A                          * 544B0
        ASL     W                                * 544B3
        ?A=0    S                                * 544B6
        GOYES   L_544C6                          * 544B9
L_544BB:
        C=C+1   W                                * 544BB
        A=A-1   S                                * 544BE
        ?A#0    S                                * 544C1
        GOYES   L_544BB                          * 544C4
L_544C6:
        SETDEC                                   * 544C6
        B=B-1   X                                * 544C8
        SETHEX                                   * 544CB
        GONC    L_54494                          * 544CD
        A=C     W                                * 544D0
        P=      0                                * 544D3
        GOTO    L_54419                          * 544D5

* hxs hxs' -> %flag
* refs (2): 1E9C7 544F1
HXS==HXS:
        CON(5)  (*)+5                            * 544D9  primitive code object
        GOSUB   POP2HXS                          * 544DE
        P=      0                                * 544E2
        ?C=A    W                                * 544E4
        GOYES   L_54521                          * 544E7
        GONC    L_54510                          * 544E9
        RPL

* hxs hxs' -> %flag
* refs (1): 1EAF2
HXS#HXS:
        ::                                       * 544EC
          HXS==HXS                               * 544F1
          not(r)                                 * 544F6
        ;                                        * 544FB

* hxs hxs' -> %flag
* refs (2): 1EC76 D1EA5
HXS>HXS:
        CON(5)  (*)+5                            * 54500  primitive code object
        ASSEMBLE
        GOSUB   POP2HXS                          * 54505
        P=      0                                * 54509
        ?C<A    W                                * 5450B
        GOYES   L_54521                          * 5450E
L_54510:
        LC(5)   %0_2A2B4                         * 54510
L_54517:
        A=C     A                                * 54517
        GOSUB   SUB_53F70                        * 54519
        PC=(A)                                   * 5451D
L_54521:
        LC(5)   %1                               * 54521
        GOTO    L_54517                          * 54528

* hxs hxs' -> %flag
* refs (1): 1EDB4
HXS>=HXS:
        CON(5)  (*)+5                            * 5452C  primitive code object
        GOSUB   POP2HXS                          * 54531
        P=      0                                * 54535
        ?C>A    W                                * 54537
        GOYES   L_54510                          * 5453A
        GONC    L_54521                          * 5453C

* hxs hxs' -> %flag
* refs (1): 1ED15
HXS<=HXS:
        CON(5)  (*)+5                            * 5453F  primitive code object
        GOSUB   POP2HXS                          * 54544
        P=      0                                * 54548
        ?C<A    W                                * 5454A
        GOYES   L_54510                          * 5454D
        GONC    L_54521                          * 5454F

* hxs hxs' -> %flag
* refs (1): 1EBD7
HXS<HXS:
        CON(5)  (*)+5                            * 54552  primitive code object
        GOSUB   POP2HXS                          * 54557
        P=      0                                * 5455B
        ?C>A    W                                * 5455D
        GOYES   L_54521                          * 54560
        GONC    L_54510                          * 54562
        RPL

* refs (9): 1A417 1A421 1A42B 1A435 1A43F 1A449 ...
ifte(ex,2_):
        ::                                       * 54565

{'tcls,'fcls}:
          {                                      * 5456A

Π'tcls:
            LAM     'tcls                        * 5456F

Π'fcls:
            LAM     'fcls                        * 54580
          }                                      * 54591
          BIND                                   * 54596
          ::                                     * 5459B

* sym -> symf
* refs (42): 54EA5 54EBE 54ED7 54EF0 54F09 54F22 ...
cknumdsptch1:
            ::                                   * 545A0
              NOTNUM?                            * 545A5
              case                               * 545AA
              PTR     ckseval1:                  * 545AF
              EVAL                               * 545B4
              CK1NOLASTWD                        * 545B9
              ->num(ex)                          * 545BE
              CK1NOLASTWD                        * 545C3
              CK&DISPATCH1                       * 545C8
              BINT6                              * 545CD
              OBJ_54D9E                          * 545D2
              BINT7                              * 545D7
              OBJ_54D9E                          * 545DC
              BINT0                              * 545E1
              skipcola                           * 545E6
            ;                                    * 545EB
            MetaIFTE                             * 545F0
            NumIFTE                              * 545F5
          ;                                      * 545FA
          ABND                                   * 545FF
        ;                                        * 54604

* refs (1): 545F0
MetaIFTE:
        ::                                       * 54609

Π'tcls_5460E:
          LAM     'tcls                          * 5460E
          symcomp                                * 5461F

Π'fcls_54624:
          LAM     'fcls                          * 54624
          symcomp                                * 54635
          BINT2                                  * 5463A
          top&                                   * 5463F
          PTR     addt:                          * 54644
          xIFTE                                  * 54649
        ;                                        * 5464E

* refs (1): 545F5
NumIFTE:
        ::                                       * 54653
          RDROP                                  * 54658

Π'tcls_5465D:
          LAM     'tcls                          * 5465D

Π'fcls_5466E:
          LAM     'fcls                          * 5466E
          ABND                                   * 5467F
          COLA                                   * 54684
          xIFTE                                  * 54689
        ;                                        * 5468E

* refs (1): 2300E
OBJ_54693:
        ::                                       * 54693
          OBJ_4B94A                              * 54698
          'R                                     * 5469D
          COMPEVAL                               * 546A2
          OBJ_546B1                              * 546A7
        ;                                        * 546AC

* refs (2): 546A7 56B73
OBJ_546B1:
        ::                                       * 546B1
          DUP                                    * 546B6
          TYPELAM?                               * 546BB
          case                                   * 546C0
          ::                                     * 546C5
            EVAL                                 * 546CA
            ABND                                 * 546CF
          ;                                      * 546D4
          DUP                                    * 546D9
          TYPESYMB?                              * 546DE
          NOTcase                                * 546E3
          ABND                                   * 546E8
          ZEROOVER                               * 546ED
          EXPLODE                                * 546F2
          DUP#0_DO                               * 546F7
          #1-SWAP                                * 546FC
          OBJ_54747                              * 54701
          LOOP                                   * 54706
          DROP                                   * 5470B
          ABND                                   * 54710
          DUP#0=csDROP                           * 54715
          #1+DUP                                 * 5471A
          dvarlsBIND                             * 5471F
          nmetasyms                              * 54724
          lam'dvar                               * 54729
          ABND                                   * 5472E
          DUP#1+                                 * 54733
          Cr                                     * 54738
          xWHERE                                 * 5473D
        ;                                        * 54742

* refs (1): 54701
OBJ_54747:
        ::                                       * 54747
          DUP                                    * 5474C
          TYPELAM?                               * 54751
          NOTcaseDROP                            * 54756
          DUP                                    * 5475B
          FIRST@LAM                              * 54760
          NOTcaseDROP                            * 54765
          REQcasedrop                            * 5476A
          {}_547AB                               * 5476F
          DROP                                   * 54774
          {}_547AB                               * 54779
          3PICK                                  * 5477E
          STOLAM                                 * 54783
          SWAP                                   * 54788
          symcomp                                * 5478D
          SWAP                                   * 54792
          BINT2                                  * 54797
          psh                                    * 5479C
          over&                                  * 547A1
        ;                                        * 547A6

* refs (2): 5476F 54779
{}_547AB:
        {                                        * 547AB
        }                                        * 547B0

* symf QN1 id1..QNn idn #2n+1 -> symf
* refs (2): 1F4E8 86849
SYMBWHERE:
        ::                                       * 547B5
          pullrev                                * 547BA
          SINNER                                 * 547BF
          DUP#1=                                 * 547C4
          case                                   * 547C9
          WHERE1                                 * 547CE
          COLA                                   * 547D3
          WHEREN                                 * 547D8
        ;                                        * 547DD

* QN1 id1..QNn idn #n meta1 -> symf
* refs (1): 547CE
WHERE1:
        ::                                       * 547E2
          DROPDUP                                * 547E7
          TYPEIDNT?                              * 547EC
          OVER                                   * 547F1
          TYPELAM?                               * 547F6
          ORNOT                                  * 547FB
          case                                   * 54800
          ::                                     * 54805
            OVER#2+UNROL                         * 5480A
            NDROP                                * 5480F
            BINT1                                * 54814
            DROPSYM                              * 54819
          ;                                      * 5481E
          BEGIN                                  * 54823
          4PICK                                  * 54828
          CARCOMP                                * 5482D
          OVER                                   * 54832
          EQUALcasedrp                           * 54837

* meta&ob -> ob
COLAkeep1st:
          ::                                     * 5483C
            2DUP                                 * 54841
            #2+UNROLL                            * 54846
            NDROP                                * 5484B
            RDROP                                * 54850
          ;                                      * 54855
          ROTDROP                                * 5485A
          ROTDROP                                * 5485F
          SWAP                                   * 54864
          #2-                                    * 54869
          DUPUNROT                               * 5486E
          #0=                                    * 54873
          UNTIL                                  * 54878
          SWAPDROP                               * 5487D
        ;                                        * 54882

* QN1 id1..QNn idn #2 metan -> symf
* refs (1): 547D8
WHEREN:
        ::                                       * 54887
          #1-SWAP                                * 5488C
          OBJ_26F6C                              * 54891
          case                                   * 54896
          EVAL                                   * 5489B
          infarg?                                * 548A0
          ITE                                    * 548A5

* meta&ob1 ob2 -> ob1&ob2 meta
revpull&psh:
          ::                                     * 548AA
            pshm1                                * 548AF
            pullpsh1&                            * 548B4
          ;                                      * 548B9
          pshm1                                  * 548BE
          COLA                                   * 548C3
          OBJ_548D2                              * 548C8
        ;                                        * 548CD

* refs (2): 548C8 5A0B8
OBJ_548D2:
        ::                                       * 548D2
          rot                                    * 548D7
          #1+DUP                                 * 548DC
          PTR     addt:                          * 548E1
          xWHERE                                 * 548E6
          unrot                                  * 548EB
          BEGIN                                  * 548F0
          DUP#0<>WHILE                           * 548F5
          OBJ_54922                              * 548FA
          REPEAT                                 * 548FF
          DROP                                   * 54904
          SWAPUnNDROP                            * 54909
          SYMBN                                  * 5490E
          COLA                                   * 54913
          COMPEVAL                               * 54918
        ;                                        * 5491D

* refs (1): 548FA
OBJ_54922:
        ::                                       * 54922
          metaROTDUP                             * 54927
          4unroll                                * 5492C
          psh                                    * 54931
          larg                                   * 54936
          CKSYMBN                                * 5493B
          symcomp                                * 54940
          psh1&                                  * 54945
          overev&                                * 5494A
        ;                                        * 5494F

* sym sym -> symf
* refs (1): 1EF97
SYMDER:
        ::                                       * 54954
          symcomp                                * 54959
          SWAP                                   * 5495E
          SYMDERSTEP                             * 54963
          COLA                                   * 54968
          OBJ_54BAF                              * 5496D
        ;                                        * 54972

* QN sym -> symf
* refs (6): 1F109 54963 54B14 56DFB 83883 8681C
SYMDERSTEP:
        ::                                       * 54977
          SWAP                                   * 5497C
          dvarlsBIND                             * 54981
          SINNER                                 * 54986
          DUP#1=                                 * 5498B
          case                                   * 54990
          OBJ_54A6F                              * 54995
          MetaConcase                            * 5499A

* meta -> %0
Repl0ABND:
          ::                                     * 5499F
            NDROP                                * 549A4
            ABND                                 * 549A9
            %0_2A2B4                             * 549AE
          ;                                      * 549B3
          #1-SWAP                                * 549B8
          1ABNDSWAP                              * 549BD
          OBJ_54B32                              * 549C2
        ;                                        * 549C7

* refs (3): 1F645 63A2E 85E30
{'dvar}:
        {                                        * 549CC
          lam'dvar                               * 549D1
        }                                        * 549D6

* LAM 'dvar
* refs (32): 54729 549D1 58F1C 5907F 5938C 593BE ...
lam'dvar:
        LAM     'dvar                            * 549DB

* meta -> meta
* refs (7): 5499A 5703B 85ED5 85F57 85FBB 8601A ...
MetaConcase:
        CON(5)  (*)+5                            * 549EC  primitive code object
        ASSEMBLE
        C=B     A                                * 549F1
        RSTK=C                                   * 549F3
        C=DAT1  A                                * 549F5
        CD1EX                                    * 549F8
        RSTK=C                                   * 549FB
        D1=D1+  5                                * 549FD
        A=DAT1  A                                * 54A00
        B=A     A                                * 54A03
        D1=C                                     * 54A05
L_54A08:
        B=B-1   A                                * 54A08
        GOC     L_54A59                          * 54A0A
        D1=D1+  5                                * 54A0D
        C=DAT1  A                                * 54A10
        CD1EX                                    * 54A13
        A=DAT1  A                                * 54A16
        D1=C                                     * 54A19
        LC(5)   DOIDNT                           * 54A1C
        ?C=A    A                                * 54A23
        GOYES   L_54A4C                          * 54A26
        LC(5)   DOLAM                            * 54A28
        ?C=A    A                                * 54A2F
        GOYES   L_54A4C                          * 54A32
        LC(5)   DOROMP                           * 54A34
        ?C=A    A                                * 54A3B
        GOYES   L_54A4C                          * 54A3E
        LC(5)   DOSYMB                           * 54A40
        ?C#A    A                                * 54A47
        GOYES   L_54A08                          * 54A4A
L_54A4C:
        LC(5)   SKIP                             * 54A4C
        A=C     A                                * 54A53
        GOTO    L_54A62                          * 54A55
L_54A59:
        LC(5)   COLA                             * 54A59
        A=C     A                                * 54A60
L_54A62:
        C=RSTK                                   * 54A62
        D1=C                                     * 54A64
        C=RSTK                                   * 54A67
        B=C     A                                * 54A69
        PC=(A)                                   * 54A6B
        RPL

* refs (1): 54995
OBJ_54A6F:
        ::                                       * 54A6F
          GETLAM                                 * 54A74
          CARCOMP                                * 54A79
          DUP                                    * 54A7E
          TYPELAM?                               * 54A83
          case                                   * 54A88
          OBJ_54AE2                              * 54A8D
          OVERSWAP                               * 54A92
          EQUALcase                              * 54A97

* ob -> %1
DROP%1ABND:
          ::                                     * 54A9C
            DROP                                 * 54AA1
            %1                                   * 54AA6
            ABND                                 * 54AAB
          ;                                      * 54AB0
          ROMPTR@NOT                             * 54AB5
          case                                   * 54ABA
          DROP%0ABND                             * 54ABF
          CK&DISPATCH0                           * 54AC4
          BINT10                                 * 54AC9
          OBJ_54B05                              * 54ACE
          BINT0                                  * 54AD3
          DROP%0ABND                             * 54AD8
        ;                                        * 54ADD

* refs (1): 54A8D
OBJ_54AE2:
        ::                                       * 54AE2
          ABND                                   * 54AE7
          EQUAL                                  * 54AEC
          %1                                     * 54AF1
          %0_2A2B4                               * 54AF6
          RPITE                                  * 54AFB
        ;                                        * 54B00

* refs (1): 54ACE
OBJ_54B05:
        ::                                       * 54B05
          1ABNDSWAP                              * 54B0A
          COLA                                   * 54B0F
          SYMDERSTEP                             * 54B14
        ;                                        * 54B19

* ob -> %0
* refs (2): 54ABF 54AD8
DROP%0ABND:
        ::                                       * 54B1E
          DROP%0                                 * 54B23
          ABND                                   * 54B28
        ;                                        * 54B2D

* refs (1): 549C2
OBJ_54B32:
        ::                                       * 54B32
          OBJ_26F18                              * 54B37
          case                                   * 54B3C
          EVAL                                   * 54B41
          DUP                                    * 54B46
          PTR>ROMPTR                             * 54B4B
          ROMPTRDECOMP                           * 54B50
          NcaseTYPEERR                           * 54B55
          SWAP                                   * 54B5A
          infarg?                                * 54B5F
          ITE                                    * 54B64
          ::                                     * 54B69
            5ROLL                                * 54B6E
            5ROLL                                * 54B73
            #1-                                  * 54B78
            5UNROLL                              * 54B7D
          ;                                      * 54B82
          argum                                  * 54B87
          SWAPDROP                               * 54B8C
          4UNROLLROT                             * 54B91
          #2+                                    * 54B96
          3UNROLL                                * 54B9B
          COLA                                   * 54BA0
          OBJ_56EDC                              * 54BA5
        ;                                        * 54BAA

* refs (2): 5496D 593CD
OBJ_54BAF:
        ::                                       * 54BAF
          CK1NOLASTWD                            * 54BB4
          BEGIN                                  * 54BB9
          DUPTYPESYMB?                           * 54BBE
          ITE                                    * 54BC3
          OBJ_54BF5                              * 54BC8
          FALSE                                  * 54BCD
          WHILE                                  * 54BD2
          ::                                     * 54BD7
            COMPEVAL                             * 54BDC
            CK1NOLASTWD                          * 54BE1
          ;                                      * 54BE6
          REPEAT                                 * 54BEB
        ;                                        * 54BF0

* refs (1): 54BC8
OBJ_54BF5:
        ::                                       * 54BF5
          DUP                                    * 54BFA
          >R                                     * 54BFF
          BEGIN                                  * 54C04
          RSWAP                                  * 54C09
          ticR                                   * 54C0E
          case                                   * 54C13
          OBJ_54C2C                              * 54C18
          RDROP                                  * 54C1D
          FALSE                                  * 54C22
        ;                                        * 54C27

* refs (1): 54C18
OBJ_54C2C:
        ::                                       * 54C2C
          'xDEREQ                                * 54C31
          case                                   * 54C36
          RDROPCOLATRUE                          * 54C3B
          RSWAP                                  * 54C40
          REPEAT                                 * 54C45
        ;                                        * 54C4A

* -> T
* refs (1): 54C3B
RDROPCOLATRUE:
        ::                                       * 54C4F
          2RDROP                                 * 54C54
          TRUE                                   * 54C59
        ;                                        * 54C5E

* meta -> meta
* refs (19): 1F289 1F2A7 1F452 1F49D 1F6FE 1FB3B ...
nmetasyms:
        ::                                       * 54C63
          #1+DUP                                 * 54C68
          ONE_DO                                 * 54C6D
          DUPROLL                                * 54C72
          CK&DISPATCH1                           * 54C77
          BINT1                                  * 54C7C
          SWAPDROPLOOP                           * 54C81
          BINT2                                  * 54C86
          SWAPDROPLOOP                           * 54C8B
          BINT14                                 * 54C90
          SWAPDROPLOOP                           * 54C95
          BINT10                                 * 54C9A
          SWAPDROPLOOP                           * 54C9F
          BINT0                                  * 54CA4
          drop(2);BAT!                           * 54CA9
        ;                                        * 54CAE

* ob1 ob2 -> ob2
* refs (4): 54C81 54C8B 54C95 54C9F
SWAPDROPLOOP:
        ::                                       * 54CB3
          SWAPLOOP                               * 54CB8
          DROP                                   * 54CBD
        ;                                        * 54CC2

* refs (1): 54CA9
drop(2);BAT!:
        ::                                       * 54CC7
          SWAPDROP                               * 54CCC
          SETTYPEERR                             * 54CD1
        ;                                        * 54CD6

* refs (1): 1AB0B
OBJ_54CDB:
        ::                                       * 54CDB
          OBJ_5EA72                              * 54CE0
          %MINREAL                               * 54CE5
          BINT0                                  * 54CEA

* ob1..obn #n -> symb
* refs (40): 1F735 54738 54D26 54D49 54D6C 54D8F ...
Cr:
          ::                                     * 54CEF
            'R                                   * 54CF4
            SWAP#1+                              * 54CF9
            SYMBN                                * 54CFE
          ;                                      * 54D03
          xMINR                                  * 54D08
        ;                                        * 54D0D

* refs (1): 1AAE9
maxr:
        ::                                       * 54D12
          OBJ_5EA72                              * 54D17
          %MAXREAL                               * 54D1C
          BINT0                                  * 54D21
          Cr                                     * 54D26
          xMAXR                                  * 54D2B
        ;                                        * 54D30

* refs (1): 1AAC7
pi:
        ::                                       * 54D35
          OBJ_5EA72                              * 54D3A
          %PI                                    * 54D3F
          BINT0                                  * 54D44
          Cr                                     * 54D49
          xPI                                    * 54D4E
        ;                                        * 54D53

* refs (1): 1AB4F
i:
        ::                                       * 54D58
          OBJ_5EA72                              * 54D5D
          C%i                                    * 54D62
          BINT0                                  * 54D67
          Cr                                     * 54D6C
          xi                                     * 54D71
        ;                                        * 54D76

* refs (1): 1AB2D
e:
        ::                                       * 54D7B
          OBJ_5EA72                              * 54D80
          %e                                     * 54D85
          BINT0                                  * 54D8A
          Cr                                     * 54D8F
          xCONSTANTe                             * 54D94
        ;                                        * 54D99

* refs (2): 545D2 545DC
OBJ_54D9E:
        ::                                       * 54D9E
          XEQRCL                                 * 54DA3
          COLA                                   * 54DA8
          skipcola                               * 54DAD
          NOP                                    * 54DB2
        ;                                        * 54DB7

* symf' -> symf'
* refs (1): 545AF
ckseval1::
        ::                                       * 54DBC
          'R'R                                   * 54DC1
          RDROP                                  * 54DC6

{'xSYMfcn,'xfcn}:
          {                                      * 54DCB

Π'xSYMfcn:
            LAM     'xSYMfcn                     * 54DD0

Π'xfcn:
            LAM     'xfcn                        * 54DE7
          }                                      * 54DF8
          BIND                                   * 54DFD
          SINNER                                 * 54E02
          AEQ1stcase                             * 54E07
          x=                                     * 54E0C
          ckevaleq1                              * 54E11
          2GETEVAL                               * 54E16
          ABND                                   * 54E1B
          CKSYMBN                                * 54E20
        ;                                        * 54E25

* meta&= -> sym
* refs (2): 54E11 557D3
ckevaleq1:
        ::                                       * 54E2A
          SWAPDROP#1-                            * 54E2F
          pshzerpsharg                           * 54E34
          2GETEVAL                               * 54E39
          psh                                    * 54E3E
          2GETEVAL                               * 54E43
          ABND                                   * 54E48
          top&Cr                                 * 54E4D
          x=                                     * 54E52
        ;                                        * 54E57

* refs (3): 5535A 55387 553B4
OBJ_54E5C:
        ::                                       * 54E5C
          RAD?                                   * 54E61
          IT                                     * 54E66
          OBJ_54E7F                              * 54E6B
          'R'R                                   * 54E70
          2DROP                                  * 54E75
        ;                                        * 54E7A

* refs (1): 54E6B
OBJ_54E7F:
        CON(5)  (*)+5                            * 54E7F  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 54E84  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  C0000                            * 54E8B  pattern: op11
        CON(5)  COLA                             * 54E90  run if it matches
        NIBHEX  4DC00                            * 54E95  pattern: op3 op12 op11
        CON(5)  skipcola                         * 54E9A  run if it matches
        NIBHEX  F                                * 54E9F  end of the rules
        RPL

* refs (1): 1C7F7
re(ex):
        ::                                       * 54EA0
          cknumdsptch1                           * 54EA5
          MetaRE                                 * 54EAA
          xRE                                    * 54EAF
        ;                                        * 54EB4

* refs (1): 1C846
SYMIM:
        ::                                       * 54EB9
          cknumdsptch1                           * 54EBE
          MetaIM                                 * 54EC3
          xIM                                    * 54EC8
        ;                                        * 54ECD

* refs (1): 1E8B2
SYMNOT:
        ::                                       * 54ED2
          cknumdsptch1                           * 54ED7
          1GETLAMSWP1+                           * 54EDC
          xNOT                                   * 54EE1
        ;                                        * 54EE6

* refs (1): 1A9C2
SYMNEG:
        ::                                       * 54EEB
          cknumdsptch1                           * 54EF0
          MetaNEG                                * 54EF5
          xNEG                                   * 54EFA
        ;                                        * 54EFF

* refs (1): 1AA4C
SYMABS:
        ::                                       * 54F04
          cknumdsptch1                           * 54F09
          MetaABS                                * 54F0E
          xABS                                   * 54F13
        ;                                        * 54F18

* refs (1): 1AA9B
SYMCONJ:
        ::                                       * 54F1D
          cknumdsptch1                           * 54F22
          MetaCONJ                               * 54F27
          xCONJ                                  * 54F2C
        ;                                        * 54F31

* refs (1): 1B2A5
SYMINV:
        ::                                       * 54F36
          cknumdsptch1                           * 54F3B
          MetaINV                                * 54F40
          xINV                                   * 54F45
        ;                                        * 54F4A

* refs (1): 1B2FE
SYMARG:
        ::                                       * 54F4F
          cknumdsptch1                           * 54F54
          1GETLAMSWP1+                           * 54F59
          xARG                                   * 54F5E
        ;                                        * 54F63

* refs (1): 1B34D
SYMSIGN:
        ::                                       * 54F68
          cknumdsptch1                           * 54F6D
          ?addrever                              * 54F72
          xSIGN                                  * 54F77
        ;                                        * 54F7C

* refs (1): 1B397
SYMSQRT:
        ::                                       * 54F81
          cknumdsptch1                           * 54F86
          1GETLAMSWP1+                           * 54F8B
          xSQRT                                  * 54F90
        ;                                        * 54F95

* refs (1): 1B453
SYMSQ:
        ::                                       * 54F9A
          cknumdsptch1                           * 54F9F
          MetaSQ                                 * 54FA4
          xSQ                                    * 54FA9
        ;                                        * 54FAE

* refs (1): 1B4CF
SYMSIN:
        ::                                       * 54FB3
          cknumdsptch1                           * 54FB8
          MetaSIN                                * 54FBD
          xSIN                                   * 54FC2
        ;                                        * 54FC7

* refs (1): 1B528
SYMCOS:
        ::                                       * 54FCC
          cknumdsptch1                           * 54FD1
          MetaCOS                                * 54FD6
          xCOS                                   * 54FDB
        ;                                        * 54FE0

* refs (1): 1B581
SYMTAN:
        ::                                       * 54FE5
          cknumdsptch1                           * 54FEA
          MetaTAN                                * 54FEF
          xTAN                                   * 54FF4
        ;                                        * 54FF9

* refs (1): 1B5DA
SYMSINH:
        ::                                       * 54FFE
          cknumdsptch1                           * 55003
          MetaSINH                               * 55008
          xSINH                                  * 5500D
        ;                                        * 55012

* refs (1): 1B629
SYMCOSH:
        ::                                       * 55017
          cknumdsptch1                           * 5501C
          MetaCOSH                               * 55021
          xCOSH                                  * 55026
        ;                                        * 5502B

* refs (1): 1B678
SYMTANH:
        ::                                       * 55030
          cknumdsptch1                           * 55035
          MetaTANH                               * 5503A
          xTANH                                  * 5503F
        ;                                        * 55044

* refs (1): 1B6C7
SYMASIN:
        ::                                       * 55049
          cknumdsptch1                           * 5504E
          1GETLAMSWP1+                           * 55053
          xASIN                                  * 55058
        ;                                        * 5505D

* refs (1): 1B752
SYMACOS:
        ::                                       * 55062
          cknumdsptch1                           * 55067
          1GETLAMSWP1+                           * 5506C
          xACOS                                  * 55071
        ;                                        * 55076

* refs (1): 1B7BF
SYMATAN:
        ::                                       * 5507B
          cknumdsptch1                           * 55080
          1GETLAMSWP1+                           * 55085
          xATAN                                  * 5508A
        ;                                        * 5508F

* refs (1): 1B80E
SYMASINH:
        ::                                       * 55094
          cknumdsptch1                           * 55099
          1GETLAMSWP1+                           * 5509E
          xASINH                                 * 550A3
        ;                                        * 550A8

* refs (1): 1B853
SYMACOSH:
        ::                                       * 550AD
          cknumdsptch1                           * 550B2
          1GETLAMSWP1+                           * 550B7
          xACOSH                                 * 550BC
        ;                                        * 550C1

* refs (1): 1B8C5
SYMATANH:
        ::                                       * 550C6
          cknumdsptch1                           * 550CB
          1GETLAMSWP1+                           * 550D0
          xATANH                                 * 550D5
        ;                                        * 550DA

* refs (1): 1B928
SYMEXP:
        ::                                       * 550DF
          cknumdsptch1                           * 550E4
          MetaEXP                                * 550E9
          xEXP                                   * 550EE
        ;                                        * 550F3

* refs (1): 1B972
SYMLN:
        ::                                       * 550F8
          cknumdsptch1                           * 550FD
          1GETLAMSWP1+                           * 55102
          xLN                                    * 55107
        ;                                        * 5510C

* refs (1): 1B9E9
SYMLOG:
        ::                                       * 55111
          cknumdsptch1                           * 55116
          1GETLAMSWP1+                           * 5511B
          xLOG                                   * 55120
        ;                                        * 55125

* refs (1): 1BA60
SYMALOG:
        ::                                       * 5512A
          cknumdsptch1                           * 5512F
          MetaALOG                               * 55134
          xALOG                                  * 55139
        ;                                        * 5513E

* refs (1): 1BAA5
SYMLNP1:
        ::                                       * 55143
          cknumdsptch1                           * 55148
          1GETLAMSWP1+                           * 5514D
          xLNP1                                  * 55152
        ;                                        * 55157

* refs (1): 1BADB
SYMEXPM:
        ::                                       * 5515C
          cknumdsptch1                           * 55161
          MetaEXPM                               * 55166
          xEXPM                                  * 5516B
        ;                                        * 55170

* refs (3): 1BB1B 1BB5A 594CC
SYMFACT:
        ::                                       * 55175
          cknumdsptch1                           * 5517A
          1GETLAMSWP1+                           * 5517F
          xFACT                                  * 55184
        ;                                        * 55189

* refs (1): 1BB86
SYMIP:
        ::                                       * 5518E
          cknumdsptch1                           * 55193
          1GETLAMSWP1+                           * 55198
          xIP                                    * 5519D
        ;                                        * 551A2

* refs (1): 1BBBC
SYMFP:
        ::                                       * 551A7
          cknumdsptch1                           * 551AC
          1GETLAMSWP1+                           * 551B1
          xFP                                    * 551B6
        ;                                        * 551BB

* refs (1): 1BBF2
SYMFLOOR:
        ::                                       * 551C0
          cknumdsptch1                           * 551C5
          1GETLAMSWP1+                           * 551CA
          xFLOOR                                 * 551CF
        ;                                        * 551D4

* refs (1): 1BC28
SYMCEIL:
        ::                                       * 551D9
          cknumdsptch1                           * 551DE
          1GETLAMSWP1+                           * 551E3
          xCEIL                                  * 551E8
        ;                                        * 551ED

* refs (1): 1BC5E
SYMEXPONENT:
        ::                                       * 551F2
          cknumdsptch1                           * 551F7
          1GETLAMSWP1+                           * 551FC
          xXPON                                  * 55201
        ;                                        * 55206

* refs (1): 1BEB5
SYMMANT:
        ::                                       * 5520B
          cknumdsptch1                           * 55210
          1GETLAMSWP1+                           * 55215
          xMANT                                  * 5521A
        ;                                        * 5521F

* refs (1): 1BEE1
SYMD>R:
        ::                                       * 55224
          cknumdsptch1                           * 55229
          1GETLAMSWP1+                           * 5522E
          xD>R                                   * 55233
        ;                                        * 55238

* refs (1): 1BF0D
SYMR>D:
        ::                                       * 5523D
          cknumdsptch1                           * 55242
          1GETLAMSWP1+                           * 55247
          xR>D                                   * 5524C
        ;                                        * 55251

* refs (1): 19794
SYMUBASE:
        ::                                       * 55256
          cknumdsptch1                           * 5525B
          1GETLAMSWP1+                           * 55260
          xUBASE                                 * 55265
        ;                                        * 5526A

* refs (1): 1973E
uval(ex):
        ::                                       * 5526F
          cknumdsptch1                           * 55274
          1GETLAMSWP1+                           * 55279
          xUVAL                                  * 5527E
        ;                                        * 55283

* # -> 1lamob #+1
* refs (36): 54EDC 54F59 54F8B 55053 5506C 55085 ...
1GETLAMSWP1+:
        ::                                       * 55288
          1GETLAM                                * 5528D
          SWAP#1+                                * 55292
        ;                                        * 55297

* refs (1): 55008
MetaSINH:
        ::                                       * 5529C
          PTR     ?addinver:                     * 552A1
          xASINH                                 * 552A6
        ;                                        * 552AB

* refs (1): 55021
MetaCOSH:
        ::                                       * 552B0
          PTR     ?addinver:                     * 552B5
          xACOSH                                 * 552BA
        ;                                        * 552BF

* refs (1): 5503A
MetaTANH:
        ::                                       * 552C4
          PTR     ?addinver:                     * 552C9
          xATANH                                 * 552CE
        ;                                        * 552D3

* refs (1): 550E9
MetaEXP:
        ::                                       * 552D8
          PTR     ?addinver:                     * 552DD
          xLN                                    * 552E2
        ;                                        * 552E7

* refs (1): 55134
MetaALOG:
        ::                                       * 552EC
          PTR     ?addinver:                     * 552F1
          xLOG                                   * 552F6
        ;                                        * 552FB

* refs (1): 55166
MetaEXPM:
        ::                                       * 55300
          PTR     ?addinver:                     * 55305
          xLNP1                                  * 5530A
        ;                                        * 5530F

* meta&Nob -> meta meta -> meta&1LAM
* refs (10): 552A1 552B5 552C9 552DD 552F1 55305 ...
?addinver::
        ::                                       * 55314
          SWAP                                   * 55319
          'RRDROP                                * 5531E
          EQcasedrop                             * 55323
          #1-                                    * 55328
          1GETLAM                                * 5532D
          ROT#1+                                 * 55332
        ;                                        * 55337

* refs (1): 54FBD
MetaSIN:
        ::                                       * 5533C
          M-1stcasechs                           * 55341

* refs (1): 553AF
OBJ_55346:
          ::                                     * 55346
            1GETLAMSWP1+                         * 5534B
            metaneg                              * 55350
          ;                                      * 55355
          OBJ_54E5C                              * 5535A
          Repl0                                  * 5535F
          Repl1                                  * 55364
          PTR     ?addinver:                     * 55369
          xASIN                                  * 5536E
        ;                                        * 55373

* refs (1): 54FD6
MetaCOS:
        ::                                       * 55378
          M-1stcasechs                           * 5537D
          1GETLAMSWP1+                           * 55382
          OBJ_54E5C                              * 55387
          Repl-1                                 * 5538C
          Repl0                                  * 55391
          PTR     ?addinver:                     * 55396
          xACOS                                  * 5539B
        ;                                        * 553A0

* refs (1): 54FEF
MetaTAN:
        ::                                       * 553A5
          M-1stcasechs                           * 553AA
          OBJ_55346                              * 553AF
          OBJ_54E5C                              * 553B4
          Repl0                                  * 553B9
          1GETLAMSWP1+                           * 553BE
          PTR     ?addinver:                     * 553C3
          xATAN                                  * 553C8
        ;                                        * 553CD

* refs (1): 54EF5
MetaNEG:
        ::                                       * 553D2
          M-1stcasechs                           * 553D7
          NOP                                    * 553DC
          1GETLAMSWP1+                           * 553E1
        ;                                        * 553E6

* refs (1): 54F40
MetaINV:
        ::                                       * 553EB
          AEQ1stcase                             * 553F0
          xi                                     * 553F5
          addtNEG                                * 553FA
          PTR     ?addinver:                     * 553FF
          xINV                                   * 55404
        ;                                        * 55409

* meta&1LAM -> meta&1LAM meta -> meta&1LAM
* refs (1): 54F72
?addrever:
        ::                                       * 5540E
          1GETLAM                                * 55413
          MEQ1stcase                             * 55418
          NOP                                    * 5541D
          1GETLAMSWP1+                           * 55422
        ;                                        * 55427

* refs (1): 54EAA
MetaRE:
        ::                                       * 5542C
          1GETLAM                                * 55431
          MEQ1stcase                             * 55436
          NOP                                    * 5543B
          AEQ1stcase                             * 55440
          xIM                                    * 55445
          NOP                                    * 5544A
          AEQ1stcase                             * 5544F
          xPI                                    * 55454
          NOP                                    * 55459
          AEQ1stcase                             * 5545E
          xi                                     * 55463
          Repl0                                  * 55468
          AEQ1stcase                             * 5546D
          xCONJ                                  * 55472

* meta&ob -> meta&LAM1
replfunc:
          ::                                     * 55477
            1GETLAM                              * 5547C
            ROTDROPSWAP                          * 55481
          ;                                      * 55486
          1GETLAMSWP1+                           * 5548B
        ;                                        * 55490

* refs (1): 54EC3
MetaIM:
        ::                                       * 55495
          AEQ1stcase                             * 5549A
          xRE                                    * 5549F
          Repl0                                  * 554A4
          AEQ1stcase                             * 554A9
          xi                                     * 554AE

* meta&ob -> meta&%1
repl%1:
          ::                                     * 554B3
            %1                                   * 554B8
            ROTDROPSWAP                          * 554BD
          ;                                      * 554C2
          AEQ1stcase                             * 554C7
          xPI                                    * 554CC
          Repl0                                  * 554D1
          1GETLAM                                * 554D6
          MEQ1stcase                             * 554DB
          Repl0                                  * 554E0
          AEQ1stcase                             * 554E5
          xCONJ                                  * 554EA
          ::                                     * 554EF
            SWAPDROP                             * 554F4
            1GETLAM                              * 554F9
            '                                    * 554FE
            xNEG                                 * 55503
            ROT#1+                               * 55508
          ;                                      * 5550D
          1GETLAMSWP1+                           * 55512
        ;                                        * 55517

* meta -> %0 #0
* refs (10): 5535F 55391 553B9 55468 554A4 554D1 ...
Repl0:
        ::                                       * 5551C
          NDROP                                  * 55521
          %0_2A2B4                               * 55526
          BINT1                                  * 5552B
        ;                                        * 55530

* meta -> %1 #1
* refs (1): 55364
Repl1:
        ::                                       * 55535
          NDROP                                  * 5553A
          %1                                     * 5553F
          BINT1                                  * 55544
        ;                                        * 55549

* meta -> %-1 #1
* refs (2): 5538C 561E2
Repl-1:
        ::                                       * 5554E
          NDROP                                  * 55553
          %-1                                    * 55558
          BINT1                                  * 5555D
        ;                                        * 55562

* refs (1): 54F27
MetaCONJ:
        ::                                       * 55567
          AEQ1stcase                             * 5556C
          xi                                     * 55571
          addtNEG                                * 55576
          AEQ1stcase                             * 5557B
          xRE                                    * 55580
          NOP                                    * 55585
          AEQ1stcase                             * 5558A
          xIM                                    * 5558F
          NOP                                    * 55594
          1GETLAM                                * 55599
          MEQ1stcase                             * 5559E
          SWAPDROP#1-                            * 555A3
          1GETLAMSWP1+                           * 555A8
        ;                                        * 555AD

* refs (1): 54F0E
MetaABS:
        ::                                       * 555B2
          1GETLAM                                * 555B7
          MEQ1stcase                             * 555BC
          NOP                                    * 555C1
          M1stNEGcase                            * 555C6
          ::                                     * 555CB
            SWAPDROP                             * 555D0
            1GETSWAP                             * 555D5
          ;                                      * 555DA
          1GETLAMSWP1+                           * 555DF
        ;                                        * 555E4

* refs (1): 54FA4
MetaSQ:
        ::                                       * 555E9
          AEQ1stcase                             * 555EE
          xSQRT                                  * 555F3
          SWAPDROP#1-                            * 555F8
          AEQ1stcase                             * 555FD
          xi                                     * 55602

* meta&ob -> meta&%-1
repl%-1:
          ::                                     * 55607
            %-1                                  * 5560C
            ROTDROPSWAP                          * 55611
          ;                                      * 55616
          M1st^case                              * 5561B
          ::                                     * 55620
            SWAPDROP                             * 55625
            %2                                   * 5562A
            'x*                                  * 5562F
            '                                    * 55634
            x^                                   * 55639
            4ROLL                                * 5563E
            #2+                                  * 55643
          ;                                      * 55648
          1GETLAMSWP1+                           * 5564D
        ;                                        * 55652

* symf symf -> symf
* refs (4): 558E1 558FA 55913 55931
cknum2::
        ::                                       * 55657
          NOTNUM?                                * 5565C
          ?SEMI                                  * 55661

{'oth}:
          {                                      * 55666

Π'oth:
            LAM     'oth                         * 5566B
          }                                      * 5567A
          BIND                                   * 5567F
          EVAL                                   * 55684
          CK1NOLASTWD                            * 55689
          ->num(ex)                              * 5568E
          CK1NOLASTWD                            * 55693
          1GETABND                               * 55698
          EVAL                                   * 5569D
          CK2NOLASTWD                            * 556A2
          ->num(ex)                              * 556A7
          CK2NOLASTWD                            * 556AC
          CK&DISPATCH1                           * 556B1
          BINT6                                  * 556B6
          OBJ_556ED                              * 556BB
          BINT7                                  * 556C0
          OBJ_556ED                              * 556C5
          BINT96                                 * 556CA
          OBJ_5570B                              * 556CF
          BINT112                                * 556D4
          OBJ_5570B                              * 556D9
          BINT0                                  * 556DE
          COLAthexFCN                            * 556E3
        ;                                        * 556E8

* refs (2): 556BB 556C5
OBJ_556ED:
        ::                                       * 556ED
          XEQRCL                                 * 556F2
          COLA                                   * 556F7
          COLAthexFCN                            * 556FC
          NOP                                    * 55701
        ;                                        * 55706

* refs (2): 556CF 556D9
OBJ_5570B:
        ::                                       * 5570B
          SWAP                                   * 55710
          XEQRCL                                 * 55715
          COLA                                   * 5571A
          ::                                     * 5571F
            SWAPCOLA                             * 55724
            COLAthexFCN                          * 55729
          ;                                      * 5572E
          NOP                                    * 55733
        ;                                        * 55738

* refs (3): 556E3 556FC 55729
COLAthexFCN:
        ::                                       * 5573D
          RDROP                                  * 55742
          'R                                     * 55747
          drop;dq                                * 5574C
          COLA                                   * 55751
        ;                                        * 55756

* % sym -> symf
* refs (1): 5591D
cknseval::
        ::                                       * 5575B
          SWAPCOLA                               * 55760
          PTR     cksneval2:                     * 55765
        ;                                        * 5576A

* sym % -> symf
* refs (2): 55765 55904
cksneval2::
        ::                                       * 5576F
          'R'R                                   * 55774
          RDROP                                  * 55779
          {                                      * 5577E

Π'scl:
            LAM     'scl                         * 55783

Π'xSYMfcn_55792:
            LAM     'xSYMfcn                     * 55792

Π'xfcn_557A9:
            LAM     'xfcn                        * 557A9
          }                                      * 557BA
          BIND                                   * 557BF
          SINNER                                 * 557C4
          AEQ1stcase                             * 557C9
          x=                                     * 557CE
          ckevaleq1                              * 557D3
          2GETEVAL                               * 557D8
          ABND                                   * 557DD
          CKSYMBN                                * 557E2
        ;                                        * 557E7

* sym sym -> symf
* refs (1): 558EB
cksseval2::
        ::                                       * 557EC
          'R'R                                   * 557F1
          RDROP                                  * 557F6

{Π'xSYMfcn,Π'xfcn}:
          {                                      * 557FB

Π'xSYMfcn_55800:
            LAM     'xSYMfcn                     * 55800

Π'xfcn_55817:
            LAM     'xfcn                        * 55817
          }                                      * 55828
          BIND                                   * 5582D
          2SINNER                                * 55832
          AEQ1stcase                             * 55837
          x=                                     * 5583C
          OBJ_55878                              * 55841
          DUP                                    * 55846
          #3+PICK                                * 5584B
          REQcasedrop                            * 55850
          x=                                     * 55855
          OBJ_55878                              * 5585A
          DROP                                   * 5585F
          2GETEVAL                               * 55864
          ABND                                   * 55869
          CKSYMBN                                * 5586E
        ;                                        * 55873

* refs (2): 55841 5585A
OBJ_55878:
        ::                                       * 55878
          psh                                    * 5587D
          ?spliteq                               * 55882
          rot                                    * 55887
          ?spliteq                               * 5588C
          rot                                    * 55891
          psh                                    * 55896
          2GETEVAL                               * 5589B
          unrot                                  * 558A0
          2GETEVAL                               * 558A5
          ABND                                   * 558AA
          top&Cr                                 * 558AF
          x=                                     * 558B4
        ;                                        * 558B9

* meta1&meta2&= -> meta2 meta1
* refs (2): 55882 5588C
?spliteq:
        ::                                       * 558BE
          AEQ1stcase                             * 558C3
          x=                                     * 558C8
          plDRPpZparg                            * 558CD
          dup                                    * 558D2
        ;                                        * 558D7

* sym sym -> symf
* refs (32): 559D1 55A1C 55A67 55AB2 55AFD 55B48 ...
sscknum2:
        ::                                       * 558DC
          PTR     cknum2:                        * 558E1
          COLA                                   * 558E6
          PTR     cksseval2:                     * 558EB
        ;                                        * 558F0

* sym % -> symf
* refs (32): 5599F 559EA 55A35 55A80 55ACB 55B16 ...
sncknum2:
        ::                                       * 558F5
          PTR     cknum2:                        * 558FA
          COLA                                   * 558FF
          PTR     cksneval2:                     * 55904
        ;                                        * 55909

* % sym -> symf
* refs (32): 559B8 55A03 55A4E 55A99 55AE4 55B2F ...
nscknum2:
        ::                                       * 5590E
          PTR     cknum2:                        * 55913
          COLA                                   * 55918
          PTR     cknseval:                      * 5591D
        ;                                        * 55922

* refs (14): 1A8E7 1A8F1 1A8FB 1A905 1A90F 1A919 ...
OBJ_55927:
        ::                                       * 55927
          ::                                     * 5592C
            PTR     cknum2:                      * 55931
            COLA                                 * 55936
            OBJ_55954                            * 5593B
          ;                                      * 55940
          NOP                                    * 55945
          x-                                     * 5594A
        ;                                        * 5594F

* refs (1): 5593B
OBJ_55954:
        ::                                       * 55954
          RDROP                                  * 55959
          2SINNER                                * 5595E
          AEQ1stcase                             * 55963
          x=                                     * 55968
          SETTYPEERR                             * 5596D
          psh                                    * 55972
          AEQ1stcase                             * 55977
          x=                                     * 5597C
          SETTYPEERR                             * 55981
          pshtop&                                * 55986
          Cr                                     * 5598B
          x=                                     * 55990
        ;                                        * 55995

* refs (1): 1E7B0
SYM%AND:
        ::                                       * 5599A
          sncknum2                               * 5599F
          xsngeneral                             * 559A4
          xAND                                   * 559A9
        ;                                        * 559AE

* refs (1): 1E7A6
%SYMAND:
        ::                                       * 559B3
          nscknum2                               * 559B8
          xnsgeneral                             * 559BD
          xAND                                   * 559C2
        ;                                        * 559C7

* refs (1): 1E7BA
SYMAND:
        ::                                       * 559CC
          sscknum2                               * 559D1
          xssgeneral                             * 559D6
          xAND                                   * 559DB
        ;                                        * 559E0

* refs (1): 1E836
SYM%OR:
        ::                                       * 559E5
          sncknum2                               * 559EA
          xsngeneral                             * 559EF
          xOR                                    * 559F4
        ;                                        * 559F9

* refs (1): 1E82C
%SYMOR:
        ::                                       * 559FE
          nscknum2                               * 55A03
          xnsgeneral                             * 55A08
          xOR                                    * 55A0D
        ;                                        * 55A12

* refs (1): 1E840
SYMOR:
        ::                                       * 55A17
          sscknum2                               * 55A1C
          xssgeneral                             * 55A21
          xOR                                    * 55A26
        ;                                        * 55A2B

* refs (1): 1E923
SYM%XOR:
        ::                                       * 55A30
          sncknum2                               * 55A35
          xsngeneral                             * 55A3A
          xXOR                                   * 55A3F
        ;                                        * 55A44

* refs (1): 1E919
%SYMXOR:
        ::                                       * 55A49
          nscknum2                               * 55A4E
          xnsgeneral                             * 55A53
          xXOR                                   * 55A58
        ;                                        * 55A5D

* refs (1): 1E92D
SYMXOR:
        ::                                       * 55A62
          sscknum2                               * 55A67
          xssgeneral                             * 55A6C
          xXOR                                   * 55A71
        ;                                        * 55A76

* refs (3): 1E995 1E99F 1E9EF
SYMFLOAT==:
        ::                                       * 55A7B
          sncknum2                               * 55A80
          xsngeneral                             * 55A85
          x==                                    * 55A8A
        ;                                        * 55A8F

* refs (3): 1E981 1E98B 1E9F9
FLOATSYM==:
        ::                                       * 55A94
          nscknum2                               * 55A99
          xnsgeneral                             * 55A9E
          x==                                    * 55AA3
        ;                                        * 55AA8

* refs (1): 1E9A9
SYM==:
        ::                                       * 55AAD
          sscknum2                               * 55AB2
          xssgeneral                             * 55AB7
          x==                                    * 55ABC
        ;                                        * 55AC1

* refs (3): 1EAC0 1EACA 1EB1A
SYMFLOAT<>:
        ::                                       * 55AC6
          sncknum2                               * 55ACB
          xsngeneral                             * 55AD0
          x#?                                    * 55AD5
        ;                                        * 55ADA

* refs (3): 1EAAC 1EAB6 1EB24
FLOATSYM<>:
        ::                                       * 55ADF
          nscknum2                               * 55AE4
          xnsgeneral                             * 55AE9
          x#?                                    * 55AEE
        ;                                        * 55AF3

* refs (1): 1EAD4
SYM<>:
        ::                                       * 55AF8
          sscknum2                               * 55AFD
          xssgeneral                             * 55B02
          x#?                                    * 55B07
        ;                                        * 55B0C

* refs (2): 1EBF5 1EC27
SYM%<:
        ::                                       * 55B11
          sncknum2                               * 55B16
          xsngeneral                             * 55B1B
          x<                                     * 55B20
        ;                                        * 55B25

* refs (2): 1EBEB 1EC31
%SYM<:
        ::                                       * 55B2A
          nscknum2                               * 55B2F
          xnsgeneral                             * 55B34
          x<                                     * 55B39
        ;                                        * 55B3E

* refs (1): 1EBFF
SYM<:
        ::                                       * 55B43
          sscknum2                               * 55B48
          xssgeneral                             * 55B4D
          x<                                     * 55B52
        ;                                        * 55B57

* refs (2): 1EC94 1ECC6
SYM%>:
        ::                                       * 55B5C
          sncknum2                               * 55B61
          xsngeneral                             * 55B66
          x>                                     * 55B6B
        ;                                        * 55B70

* refs (2): 1EC8A 1ECD0
%SYM>:
        ::                                       * 55B75
          nscknum2                               * 55B7A
          xnsgeneral                             * 55B7F
          x>                                     * 55B84
        ;                                        * 55B89

* refs (1): 1EC9E
SYM>:
        ::                                       * 55B8E
          sscknum2                               * 55B93
          xssgeneral                             * 55B98
          x>                                     * 55B9D
        ;                                        * 55BA2

* refs (2): 1ED33 1ED65
SYM%<=:
        ::                                       * 55BA7
          sncknum2                               * 55BAC
          xsngeneral                             * 55BB1
          x<=?                                   * 55BB6
        ;                                        * 55BBB

* refs (2): 1ED29 1ED6F
%SYM<=:
        ::                                       * 55BC0
          nscknum2                               * 55BC5
          xnsgeneral                             * 55BCA
          x<=?                                   * 55BCF
        ;                                        * 55BD4

* refs (1): 1ED3D
SYM<=:
        ::                                       * 55BD9
          sscknum2                               * 55BDE
          xssgeneral                             * 55BE3
          x<=?                                   * 55BE8
        ;                                        * 55BED

* refs (2): 1EDD2 1EE04
SYM%>=:
        ::                                       * 55BF2
          sncknum2                               * 55BF7
          xsngeneral                             * 55BFC
          x>=?                                   * 55C01
        ;                                        * 55C06

* refs (2): 1EDC8 1EE0E
%SYM>=:
        ::                                       * 55C0B
          nscknum2                               * 55C10
          xnsgeneral                             * 55C15
          x>=?                                   * 55C1A
        ;                                        * 55C1F

* refs (1): 1EDDC
SYM>=:
        ::                                       * 55C24
          sscknum2                               * 55C29
          xssgeneral                             * 55C2E
          x>=?                                   * 55C33
        ;                                        * 55C38

* refs (2): 1C083 1C0AB
SYM%%OF:
        ::                                       * 55C3D
          sncknum2                               * 55C42
          xsngeneral                             * 55C47
          x%                                     * 55C4C
        ;                                        * 55C51

* refs (2): 1C079 1C0A1
%SYM%OF:
        ::                                       * 55C56
          nscknum2                               * 55C5B
          xnsgeneral                             * 55C60
          x%                                     * 55C65
        ;                                        * 55C6A

* refs (1): 1C08D
SYM%OF:
        ::                                       * 55C6F
          sscknum2                               * 55C74
          xssgeneral                             * 55C79
          x%                                     * 55C7E
        ;                                        * 55C83

* refs (2): 1C16C 1C1A8
SYM%%CH:
        ::                                       * 55C88
          sncknum2                               * 55C8D
          xsngeneral                             * 55C92
          x%CH                                   * 55C97
        ;                                        * 55C9C

* refs (2): 1C162 1C19E
%SYM%CH:
        ::                                       * 55CA1
          nscknum2                               * 55CA6
          xnsgeneral                             * 55CAB
          x%CH                                   * 55CB0
        ;                                        * 55CB5

* refs (1): 1C176
SYM%CH:
        ::                                       * 55CBA
          sscknum2                               * 55CBF
          xssgeneral                             * 55CC4
          x%CH                                   * 55CC9
        ;                                        * 55CCE

* refs (2): 1C0FA 1C136
SYM%%T:
        ::                                       * 55CD3
          sncknum2                               * 55CD8
          xsngeneral                             * 55CDD
          x%T                                    * 55CE2
        ;                                        * 55CE7

* refs (2): 1C0F0 1C12C
%SYM%T:
        ::                                       * 55CEC
          nscknum2                               * 55CF1
          xnsgeneral                             * 55CF6
          x%T                                    * 55CFB
        ;                                        * 55D00

* refs (1): 1C104
SYM%T:
        ::                                       * 55D05
          sscknum2                               * 55D0A
          xssgeneral                             * 55D0F
          x%T                                    * 55D14
        ;                                        * 55D19

* refs (1): 1C219
SYM%COMB:
        ::                                       * 55D1E
          sncknum2                               * 55D23
          xsngeneral                             * 55D28
          xCOMB                                  * 55D2D
        ;                                        * 55D32

* refs (1): 1C20F
%SYMCOMB:
        ::                                       * 55D37
          nscknum2                               * 55D3C
          xnsgeneral                             * 55D41
          xCOMB                                  * 55D46
        ;                                        * 55D4B

* refs (1): 1C223
SYMCOMB:
        ::                                       * 55D50
          sscknum2                               * 55D55
          xssgeneral                             * 55D5A
          xCOMB                                  * 55D5F
        ;                                        * 55D64

* refs (1): 1C259
SYM%PERM:
        ::                                       * 55D69
          sncknum2                               * 55D6E
          xsngeneral                             * 55D73
          xPERM                                  * 55D78
        ;                                        * 55D7D

* refs (1): 1C24F
%SYMPERM:
        ::                                       * 55D82
          nscknum2                               * 55D87
          xnsgeneral                             * 55D8C
          xPERM                                  * 55D91
        ;                                        * 55D96

* refs (1): 1C263
SYMPERM:
        ::                                       * 55D9B
          sscknum2                               * 55DA0
          xssgeneral                             * 55DA5
          xPERM                                  * 55DAA
        ;                                        * 55DAF

* refs (1): 1BD96
SYM%RND:
        ::                                       * 55DB4
          sncknum2                               * 55DB9
          xsngeneral                             * 55DBE
          xRND                                   * 55DC3
        ;                                        * 55DC8

* refs (3): 1BD6E 1BD82 1BDB4
SYMRND:
        ::                                       * 55DCD
          nscknum2                               * 55DD2
          xnsgeneral                             * 55DD7
          xRND                                   * 55DDC
        ;                                        * 55DE1

* refs (1): 1BDA0
RNDSYM:
        ::                                       * 55DE6
          sscknum2                               * 55DEB
          xssgeneral                             * 55DF0
          xRND                                   * 55DF5
        ;                                        * 55DFA

* refs (1): 1BE12
SYM%TRNC:
        ::                                       * 55DFF
          sncknum2                               * 55E04
          xsngeneral                             * 55E09
          xTRNC                                  * 55E0E
        ;                                        * 55E13

* refs (3): 1BDEA 1BDFE 1BE30
TRCNYM:
        ::                                       * 55E18
          nscknum2                               * 55E1D
          xnsgeneral                             * 55E22
          xTRNC                                  * 55E27
        ;                                        * 55E2C

* refs (1): 1BE1C
SYMTRCN:
        ::                                       * 55E31
          sscknum2                               * 55E36
          xssgeneral                             * 55E3B
          xTRNC                                  * 55E40
        ;                                        * 55E45

* refs (2): 1BC94 1BCD0
SYM%MAX:
        ::                                       * 55E4A
          sncknum2                               * 55E4F
          xsngeneral                             * 55E54
          xMAX                                   * 55E59
        ;                                        * 55E5E

* refs (2): 1BC8A 1BCC6
%SYMMAX:
        ::                                       * 55E63
          nscknum2                               * 55E68
          xnsgeneral                             * 55E6D
          xMAX                                   * 55E72
        ;                                        * 55E77

* refs (1): 1BC9E
SYMMAX:
        ::                                       * 55E7C
          sscknum2                               * 55E81
          ?addsimir                              * 55E86
          xMAX                                   * 55E8B
        ;                                        * 55E90

* refs (2): 1BD06 1BD42
SYM%MIN:
        ::                                       * 55E95
          sncknum2                               * 55E9A
          xsngeneral                             * 55E9F
          xMIN                                   * 55EA4
        ;                                        * 55EA9

* refs (2): 1BCFC 1BD38
%SYMMIN:
        ::                                       * 55EAE
          nscknum2                               * 55EB3
          xnsgeneral                             * 55EB8
          xMIN                                   * 55EBD
        ;                                        * 55EC2

* refs (1): 1BD10
SYMMIN:
        ::                                       * 55EC7
          sscknum2                               * 55ECC
          ?addsimir                              * 55ED1
          xMIN                                   * 55ED6
        ;                                        * 55EDB

* refs (3): 1B078 1B082 1B0B4
SYM^O:
        ::                                       * 55EE0
          sncknum2                               * 55EE5
          Meta^Con                               * 55EEA
          x^                                     * 55EEF
        ;                                        * 55EF4

* refs (3): 1B064 1B06E 1B0BE
O^SYM:
        ::                                       * 55EF9
          nscknum2                               * 55EFE
          Con^Meta                               * 55F03
          x^                                     * 55F08
        ;                                        * 55F0D

* refs (1): 1B08C
SYM^:
        ::                                       * 55F12
          sscknum2                               * 55F17
          xssgeneral                             * 55F1C
          x^                                     * 55F21
        ;                                        * 55F26

* refs (3): 1ABEE 1AC02 1AC0C
SYM+O:
        ::                                       * 55F2B
          sncknum2                               * 55F30
          Meta+Con                               * 55F35
          x+                                     * 55F3A
        ;                                        * 55F3F

* refs (3): 1ABE4 1ABF8 1AC16
O+SYM:
        ::                                       * 55F44
          nscknum2                               * 55F49
          Con+Meta                               * 55F4E
          x+                                     * 55F53
        ;                                        * 55F58

* refs (1): 1ABDA
SYM+:
        ::                                       * 55F5D
          sscknum2                               * 55F62
          Meta+                                  * 55F67
          x+                                     * 55F6C
        ;                                        * 55F71

* refs (3): 1AD7C 1AD86 1ADB8
SYM-O:
        ::                                       * 55F76
          sncknum2                               * 55F7B
          Meta-Con                               * 55F80

O-SYM:
          x-                                     * 55F85
        ;                                        * 55F8A

* refs (3): 1AD68 1AD72 1ADC2
SYM-:
        ::                                       * 55F8F
          nscknum2                               * 55F94
          Con-Meta                               * 55F99
          x-                                     * 55F9E
        ;                                        * 55FA3

* refs (1): 1AD90
-(2ex):
        ::                                       * 55FA8
          sscknum2                               * 55FAD
          Meta-                                  * 55FB2
          x-                                     * 55FB7
        ;                                        * 55FBC

* refs (3): 1AE89 1AE93 1AEC5
SYM*O:
        ::                                       * 55FC1
          sncknum2                               * 55FC6
          Meta*Con                               * 55FCB
          x*                                     * 55FD0
        ;                                        * 55FD5

* refs (3): 1AE75 1AE7F 1AECF
O*SYM:
        ::                                       * 55FDA
          nscknum2                               * 55FDF
          Con*Meta                               * 55FE4
          x*                                     * 55FE9
        ;                                        * 55FEE

* refs (1): 1AE9D
SYM*:
        ::                                       * 55FF3
          sscknum2                               * 55FF8
          Meta*                                  * 55FFD
          x*                                     * 56002
        ;                                        * 56007

* refs (3): 1AF8C 1AF96 1AFC8
SYM/O:
        ::                                       * 5600C
          sncknum2                               * 56011
          Meta/Con                               * 56016
          x/                                     * 5601B
        ;                                        * 56020

* refs (3): 1AF78 1AF82 1AFD2
O/SYM:
        ::                                       * 56025
          nscknum2                               * 5602A
          Con/Meta                               * 5602F
          x/                                     * 56034
        ;                                        * 56039

* refs (1): 1AFA0
SYM/:
        ::                                       * 5603E
          sscknum2                               * 56043
          Meta/                                  * 56048
          x/                                     * 5604D
        ;                                        * 56052

* refs (1): 1BE70
SYM%MOD:
        ::                                       * 56057
          sncknum2                               * 5605C
          MetamodCon                             * 56061
          xMOD                                   * 56066
        ;                                        * 5606B

* refs (1): 1BE66
%SYMMOD:
        ::                                       * 56070
          nscknum2                               * 56075
          ConmodMeta                             * 5607A
          xMOD                                   * 5607F
        ;                                        * 56084

* refs (1): 1BE7A
SYMMOD:
        ::                                       * 56089
          sscknum2                               * 5608E
          Metamod                                * 56093
          xMOD                                   * 56098
        ;                                        * 5609D

* refs (2): 1B20B 1B21F
SYM%XROOT:
        ::                                       * 560A2
          sncknum2                               * 560A7
          xsngeneral                             * 560AC
          xXROOT                                 * 560B1
        ;                                        * 560B6

* refs (2): 1B201 1B229
%SYMXROOT:
        ::                                       * 560BB
          nscknum2                               * 560C0
          xnsgeneral                             * 560C5
          xXROOT                                 * 560CA
        ;                                        * 560CF

* refs (1): 1B215
SYMXROOT:
        ::                                       * 560D4
          sscknum2                               * 560D9
          xssgeneral                             * 560DE
          xXROOT                                 * 560E3
        ;                                        * 560E8

* refs (23): 559D6 55A21 55A6C 55AB7 55B02 55B4D ...
xssgeneral:
        ::                                       * 560ED
          top&                                   * 560F2
          1GETLAMSWP1+                           * 560F7
        ;                                        * 560FC

* meta -> LAM3&meta&LAM1
* refs (21): 559BD 55A08 55A53 55A9E 55AE9 55B34 ...
xnsgeneral:
        ::                                       * 56101
          3GETLAM                                * 56106
          BINT1                                  * 5610B
          pshtop&                                * 56110
          1GETLAMSWP1+                           * 56115
        ;                                        * 5611A

* meta -> meta&LAM3&LAM1
* refs (21): 559A4 559EF 55A3A 55A85 55AD0 55B1B ...
xsngeneral:
        ::                                       * 5611F
          3GETLAM                                * 56124
          BINT1                                  * 56129
          top&                                   * 5612E
          1GETLAMSWP1+                           * 56133
        ;                                        * 56138

* meta meta -> meta
* refs (2): 55E86 55ED1
?addsimir:
        ::                                       * 5613D
          MEQU?                                  * 56142
          case                                   * 56147
          NDROP                                  * 5614C
          COLA                                   * 56151
          xssgeneral                             * 56156
        ;                                        * 5615B

* refs (3): 55F67 5634F 5655C
Meta+:
        ::                                       * 56160
          top&                                   * 56165
          meta+                                  * 5616A
        ;                                        * 5616F

* refs (1): 55FB2
Meta-:
        ::                                       * 56174
          MEQU?                                  * 56179
          case                                   * 5617E

* meta1 meta2 -> %0 #1
2Repl0:
          ::                                     * 56183
            NDROP                                * 56188
            Repl0                                * 5618D
          ;                                      * 56192
          COLA                                   * 56197
          OBJ_561A6                              * 5619C
        ;                                        * 561A1

* refs (3): 5619C 56386 5657F
OBJ_561A6:
        ::                                       * 561A6
          top&                                   * 561AB
          meta-                                  * 561B0
        ;                                        * 561B5

* refs (3): 55FFD 563D1 565C5
Meta*:
        ::                                       * 561BA
          psh                                    * 561BF
          M-1stcasechs                           * 561C4
          OBJ_561FB                              * 561C9
          AEQopscase                             * 561CE
          xi                                     * 561D3

* meta1 meta2 -> %-1 #1
2Repl-1:
          ::                                     * 561D8
            NDROP                                * 561DD
            Repl-1                               * 561E2
          ;                                      * 561E7
          pshtop&                                * 561EC
          meta*                                  * 561F1
        ;                                        * 561F6

* refs (1): 561C9
OBJ_561FB:
        ::                                       * 561FB
          pshtop&                                * 56200
          meta*                                  * 56205
          metaneg                                * 5620A
        ;                                        * 5620F

* refs (3): 56048 56421 56601
Meta/:
        ::                                       * 56214
          psh                                    * 56219
          M-1stcasechs                           * 5621E
          OBJ_56237                              * 56223
          pshtop&                                * 56228
          meta/                                  * 5622D
        ;                                        * 56232

* refs (1): 56223
OBJ_56237:
        ::                                       * 56237
          pshtop&                                * 5623C
          meta/                                  * 56241
          metaneg                                * 56246
        ;                                        * 5624B

* refs (2): 56093 56624
Metamod:
        ::                                       * 56250
          MEQU?                                  * 56255
          case                                   * 5625A
          ::                                     * 5625F
            NDROP                                * 56264
            Repl0                                * 56269
          ;                                      * 5626E
          psh                                    * 56273
          #1-SWAP                                * 56278
          1GETLAM                                * 5627D
          EQcasedrop                             * 56282
          OBJ_562A5                              * 56287
          SWAP#1+                                * 5628C
          psh                                    * 56291
          COLA                                   * 56296
          xssgeneral                             * 5629B
        ;                                        * 562A0

* refs (1): 56287
OBJ_562A5:
        ::                                       * 562A5
          pshzerpsharg                           * 562AA
          unrot                                  * 562AF
          MEQU?                                  * 562B4
          case                                   * 562B9

* meta1 meta2 meta3 -> meta1&meta2&LAM1
dropaddoper:
          ::                                     * 562BE
            NDROP                                * 562C3
            COLA                                 * 562C8
            xssgeneral                           * 562CD
          ;                                      * 562D2
          rot                                    * 562D7
          psh                                    * 562DC
          xssgeneral                             * 562E1
          psh                                    * 562E6
          COLA                                   * 562EB
          xssgeneral                             * 562F0
        ;                                        * 562F5

* refs (1): 55F03
Con^Meta:
        ::                                       * 562FA
          3GETLAM                                * 562FF
          num1=case                              * 56304

* meta ob -> LAM3 #1
* refs (3): 5639F 563EA 56598
MetaUnCalc:
          ::                                     * 56309
            DROPNDROP                            * 5630E
            3GETLAM                              * 56313
            BINT1                                * 56318
          ;                                      * 5631D
          drop;dq                                * 56322
          xnsgeneral                             * 56327
        ;                                        * 5632C

* refs (1): 55F4E
Con+Meta:
        ::                                       * 56331
          3GETLAM                                * 56336
          num0=case                              * 5633B
          DROP                                   * 56340
          pshm1                                  * 56345
          COLA                                   * 5634A
          Meta+                                  * 5634F
        ;                                        * 56354

* refs (1): 55F99
Con-Meta:
        ::                                       * 56359
          3GETLAM                                * 5635E
          num0=case                              * 56363
          ::                                     * 56368
            DROP                                 * 5636D
            metaneg                              * 56372
          ;                                      * 56377
          pshm1                                  * 5637C
          COLA                                   * 56381
          OBJ_561A6                              * 56386
        ;                                        * 5638B

* refs (1): 55FE4
Con*Meta:
        ::                                       * 56390
          3GETLAM                                * 56395
          num0=case                              * 5639A
          MetaUnCalc                             * 5639F
          num1=case                              * 563A4
          DROP                                   * 563A9
          num-1=case                             * 563AE
          ::                                     * 563B3
            DROP                                 * 563B8
            metaneg                              * 563BD
          ;                                      * 563C2
          pshm1                                  * 563C7
          COLA                                   * 563CC
          Meta*                                  * 563D1
        ;                                        * 563D6

* refs (1): 5602F
Con/Meta:
        ::                                       * 563DB
          3GETLAM                                * 563E0
          num0=case                              * 563E5
          MetaUnCalc                             * 563EA
          num1=case                              * 563EF

* refs (1): 56412
OBJ_563F4:
          ::                                     * 563F4
            pshm1                                * 563F9
            top&                                 * 563FE
            meta/                                * 56403
          ;                                      * 56408
          num-1=case                             * 5640D
          OBJ_563F4                              * 56412
          pshm1                                  * 56417
          COLA                                   * 5641C
          Meta/                                  * 56421
        ;                                        * 56426

* refs (1): 5607A
ConmodMeta:
        ::                                       * 5642B
          3GETLAM                                * 56430
          num0=case                              * 56435

* meta ob -> %0 #1
DropRepl0:
          ::                                     * 5643A
            DROP                                 * 5643F
            Repl0                                * 56444
          ;                                      * 56449
          drop;dq                                * 5644E
          xnsgeneral                             * 56453
        ;                                        * 56458

* refs (1): 55EEA
Meta^Con:
        ::                                       * 5645D
          3GETLAM                                * 56462
          num0=case                              * 56467
          ::                                     * 5646C
            DROP                                 * 56471
            NDROP                                * 56476
            3GETLAM                              * 5647B
            TYPE                                 * 56480
            TYPEREAL                             * 56485
            #=                                   * 5648A
            %1                                   * 5648F
            C%1                                  * 56494
            RPITE                                * 56499
            BINT1                                * 5649E
          ;                                      * 564A3
          num1=case                              * 564A8
          DROP                                   * 564AD
          num-1=case                             * 564B2
          ::                                     * 564B7
            DROP                                 * 564BC
            metainv                              * 564C1
          ;                                      * 564C6
          num2=case                              * 564CB
          ::                                     * 564D0
            DROP                                 * 564D5
            AEQ1stcase                           * 564DA
            xSQRT                                * 564DF
            SWAPDROP#1-                          * 564E4
            AEQ1stcase                           * 564E9
            xi                                   * 564EE
            ::                                   * 564F3
              3GETLAM                            * 564F8
              TYPE                               * 564FD
              TYPEREAL                           * 56502
              #=                                 * 56507
              %-1                                * 5650C
              C%-1                               * 56511
              RPITE                              * 56516
              ROTDROPSWAP                        * 5651B
            ;                                    * 56520
            COLA                                 * 56525
            xsngeneral                           * 5652A
          ;                                      * 5652F
          drop;dq                                * 56534
          xsngeneral                             * 56539
        ;                                        * 5653E

* refs (1): 55F35
Meta+Con:
        ::                                       * 56543
          3GETLAM                                * 56548
          num0=case                              * 5654D
          DROP                                   * 56552
          ONECOLA                                * 56557
          Meta+                                  * 5655C
        ;                                        * 56561

* refs (1): 55F80
Meta-Con:
        ::                                       * 56566
          3GETLAM                                * 5656B
          num0=case                              * 56570
          DROP                                   * 56575
          ONECOLA                                * 5657A
          OBJ_561A6                              * 5657F
        ;                                        * 56584

* refs (1): 55FCB
Meta*Con:
        ::                                       * 56589
          3GETLAM                                * 5658E
          num0=case                              * 56593
          MetaUnCalc                             * 56598
          num1=case                              * 5659D
          DROP                                   * 565A2
          num-1=case                             * 565A7
          ::                                     * 565AC
            DROP                                 * 565B1
            metaneg                              * 565B6
          ;                                      * 565BB
          ONECOLA                                * 565C0
          Meta*                                  * 565C5
        ;                                        * 565CA

* refs (1): 56016
Meta/Con:
        ::                                       * 565CF
          3GETLAM                                * 565D4
          num1=case                              * 565D9
          DROP                                   * 565DE
          num-1=case                             * 565E3
          ::                                     * 565E8
            DROP                                 * 565ED
            metaneg                              * 565F2
          ;                                      * 565F7
          ONECOLA                                * 565FC
          Meta/                                  * 56601
        ;                                        * 56606

* refs (1): 56061
MetamodCon:
        ::                                       * 5660B
          3GETLAM                                * 56610
          num0=case                              * 56615
          DROP                                   * 5661A
          ONECOLA                                * 5661F
          Metamod                                * 56624
        ;                                        * 56629

* symf QN symf_lo symf_hi -> %
* refs (1): 1F29D
NUMINTEG:
        ::                                       * 5662E
          CK&DISPATCH0                           * 56633
          BINT17                                 * 56638
          OBJ_566A6                              * 5663D
          2EXT                                   * 56642
          OBJ_56683                              * 56647
          BINT26                                 * 5664C
          OBJ_56912                              * 56651
          EXTSYM                                 * 56656
          OBJ_56912                              * 5665B
          SYMREAL                                * 56660
          OBJ_56912                              * 56665
          SYMEXT                                 * 5666A
          OBJ_56912                              * 5666F
          SYMSYM                                 * 56674
          OBJ_56912                              * 56679
        ;                                        * 5667E

* refs (1): 56647
OBJ_56683:
        ::                                       * 56683
          OVER                                   * 56688
          UMCONV                                 * 5668D
          TRUE                                   * 56692
          COLA                                   * 56697
          OBJ_566BF                              * 5669C
        ;                                        * 566A1

* refs (1): 5663D
OBJ_566A6:
        ::                                       * 566A6
          FALSE                                  * 566AB
          COLA                                   * 566B0
          OBJ_566BF                              * 566B5
        ;                                        * 566BA

* refs (2): 5669C 566B5
OBJ_566BF:
        ::                                       * 566BF
          DUPDUP                                 * 566C4
          OBJ_56FD1                              * 566C9
          BIND                                   * 566CE
          2SWAP                                  * 566D3

* refs (1): 56B0F
OBJ_566D8:
          ::                                     * 566D8
            CARCOMP                              * 566DD
            DUP                                  * 566E2
            ID>LAM                               * 566E7
            BINT1                                * 566EC
            DOBIND                               * 566F1
          ;                                      * 566F6
          BINT0                                  * 566FB
          SWAP                                   * 56700
          EXPLODE                                * 56705

* refs (1): 56B1E
OBJ_5670A:
          ::                                     * 5670A

* meta1 meta2 -> meta1&meta2'
* refs (5): 5AB19 5B8E8 8386F 838B5 C0D69
>dvars:
            ::                                   * 5670F
              BEGIN                              * 56714
              #1-SWAP                            * 56719
              BINT10                             * 5671E
              GETLAMPAIR                         * 56723
              DROP                               * 56728
              ROTDROP                            * 5672D
              UNROTOVER                          * 56732
              EQUAL                              * 56737
              NOT?SWAPDROP                       * 5673C
              psh1&                              * 56741
              #0=UNTIL                           * 56746
              DROP                               * 5674B
            ;                                    * 56750
            IMPLODE                              * 56755
            symcomp                              * 5675A
          ;                                      * 5675F
          '                                      * 56764
          '                                      * 56769

* refs (1): 56B32
OBJ_5676E:
          ::                                     * 5676E
            BINT10                               * 56773
            GETLAMPAIR                           * 56778
            DROPSWAPDROP                         * 5677D
            SWAPDROP                             * 56782
          ;                                      * 56787
          '                                      * 5678C
          STOLAM                                 * 56791
          4ROLL                                  * 56796
          '                                      * 5679B
          COMPEVAL                               * 567A0
          '                                      * 567A5
          OBJ_568AE                              * 567AA
          Π'dv                                   * 567AF
          ITE                                    * 567B4
          ::                                     * 567B9
            7ROLL                                * 567BE
            CARCOMP                              * 567C3
            7UNROLL                              * 567C8
            8ROLL                                * 567CD
            UMU>                                 * 567D2
            OVER                                 * 567D7
            10UNROLL                             * 567DC
            SWAPDROP                             * 567E1
            DUP                                  * 567E6
            '                                    * 567EB
            Π'op                                 * 567F0
            STOLAM                               * 567F5
            7UNROLL                              * 567FA
            '                                    * 567FF
            UM>U                                 * 56804
            7UNROLL                              * 56809
            BINT8                                * 5680E
          ;                                      * 56813
          BINT6                                  * 56818
          ::N                                    * 5681D
          OBJ_5A952                              * 56822
          2SWAP                                  * 56827
          CALCINTEG                              * 5682C
          ABND                                   * 56831
          CK2NOLASTWD                            * 56836
          Π'nm                                   * 5683B
          OBJ_56872                              * 56840
          Π'op                                   * 56845
          OBJ_56872                              * 5684A
          ABND                                   * 5684F
          '                                      * 56854

IERR:
          ID      IERR                           * 56859
          XEQSTOID                               * 56868
        ;                                        * 5686D

* refs (2): 56840 5684A
OBJ_56872:
        ::                                       * 56872
          DUPTYPEEXT?                            * 56877
          NOTcase                                * 5687C
          DROP                                   * 56881
          UMU>                                   * 56886
          SWAPDROP                               * 5688B
          DUPUNROT                               * 56890
          UM*                                    * 56895
          3UNROLL                                * 5689A
          UM*                                    * 5689F
          SWAP                                   * 568A4
        ;                                        * 568A9

* refs (1): 567AA
OBJ_568AE:
        ::                                       * 568AE
          CK&DISPATCH1                           * 568B3
          BINT14                                 * 568B8
          OBJ_568D1                              * 568BD
          BINT0                                  * 568C2
          NOP                                    * 568C7
        ;                                        * 568CC

* refs (1): 568BD
OBJ_568D1:
        ::                                       * 568D1
          Π'nm                                   * 568D6
          DUPTYPEEXT?                            * 568DB
          ITE                                    * 568E0
          UMCONV                                 * 568E5
          ::                                     * 568EA
            DROPDUP                              * 568EF
            '                                    * 568F4
            Π'nm                                 * 568F9
            STOLAM                               * 568FE
          ;                                      * 56903
          CARCOMP                                * 56908
        ;                                        * 5690D

* refs (5): 56651 5665B 56665 5666F 56679
OBJ_56912:
        ::                                       * 56912
          SYMCRUNCH1                             * 56917
          SYMCRUNCH2                             * 5691C
          DEPTH                                  * 56921
          BINT3                                  * 56926
          #>                                     * 5692B
          IT                                     * 56930
          2SWAP                                  * 56935
          COLA                                   * 5693A
          xINTEGRAL                              * 5693F
        ;                                        * 56944

* sym sym sym ob -> symf
* refs (1): 1F30A
SYMSUM:
        ::                                       * 56949

* refs (2): 56A0B 56A51
OBJ_5694E:
          ::                                     * 5694E
            BINT1                                * 56953
            nmetasyms                            * 56958
            symcomp                              * 5695D
            4ROLL                                * 56962
            symcomp                              * 56967
            ChkExpr1Name                         * 5696C

{'sumexpr,'sumvar}:
            {                                    * 56971

* refs (1): 569ED
Π'sumexpr:
              LAM     'sumexpr                   * 56976

* refs (1): 569DE
Π'sumvar:
              LAM     'sumvar                    * 5698D
            }                                    * 569A2
            BIND                                 * 569A7
          ;                                      * 569AC
          ::                                     * 569B1
            sscknum2                             * 569B6
            OBJ_569D4                            * 569BB
            OBJ_56A9C                            * 569C0
          ;                                      * 569C5
          ABND                                   * 569CA
        ;                                        * 569CF

* refs (3): 569BB 56A42 56A92
OBJ_569D4:
        ::                                       * 569D4
          top&                                   * 569D9
          Π'sumvar                               * 569DE
          OVER#2+UNROL                           * 569E3
          #1+                                    * 569E8
          Π'sumexpr                              * 569ED
          SWAP#1+                                * 569F2
          PTR     addt:                          * 569F7
          ä                                      * 569FC
        ;                                        * 56A01

* sym sym % ob -> symf
* refs (1): 1F2EC
SYM%SUM:
        ::                                       * 56A06
          OBJ_5694E                              * 56A0B
          ::                                     * 56A10
            sncknum2                             * 56A15
            OBJ_56A33                            * 56A1A
            OBJ_56A9C                            * 56A1F
          ;                                      * 56A24
          ABND                                   * 56A29
        ;                                        * 56A2E

* refs (1): 56A1A
OBJ_56A33:
        ::                                       * 56A33
          3GETLAM                                * 56A38
          ONECOLA                                * 56A3D
          OBJ_569D4                              * 56A42
        ;                                        * 56A47

* sym % sym ob -> symf
* refs (1): 1F2FB
%SYMSUM:
        ::                                       * 56A4C
          OBJ_5694E                              * 56A51
          ::                                     * 56A56
            nscknum2                             * 56A5B
            OBJ_56A79                            * 56A60
            OBJ_56A9C                            * 56A65
          ;                                      * 56A6A
          ABND                                   * 56A6F
        ;                                        * 56A74

* refs (1): 56A60
OBJ_56A79:
        ::                                       * 56A79
          3GETLAM                                * 56A7E
          BINT1                                  * 56A83
          psh                                    * 56A88
          COLA                                   * 56A8D
          OBJ_569D4                              * 56A92
        ;                                        * 56A97

* refs (3): 569C0 56A1F 56A65
OBJ_56A9C:
        ::                                       * 56A9C
          CK2NOLASTWD                            * 56AA1
          1GETLAM                                * 56AA6
          3UNROLL                                * 56AAB
          2GETLAM                                * 56AB0
          ABND                                   * 56AB5
          RDROPCOLA                              * 56ABA
          ä                                      * 56ABF
        ;                                        * 56AC4

* sym % % ob -> symf
* refs (1): 1F2DD
%%SUM:
        ::                                       * 56AC9
          BINT1                                  * 56ACE
          nmetasyms                              * 56AD3
          4ROLL                                  * 56AD8
          symcomp                                * 56ADD
          ChkExpr1Name                           * 56AE2
          4PICK                                  * 56AE7
          4PICK                                  * 56AEC
          %>                                     * 56AF1
          case                                   * 56AF6

* 1...4 -> %0
4DROP%0:
          ::                                     * 56AFB
            4DROP                                * 56B00
            %0_2A2B4                             * 56B05
          ;                                      * 56B0A
          OBJ_566D8                              * 56B0F
          ZEROSWAP                               * 56B14
          EXPLODE                                * 56B19
          OBJ_5670A                              * 56B1E
          3UNROLL                                * 56B23
          '                                      * 56B28
          Π'fcn                                  * 56B2D
          OBJ_5676E                              * 56B32
          ABND                                   * 56B37
          '                                      * 56B3C
          Π'stop                                 * 56B41
          BINT3                                  * 56B46
          DOBIND                                 * 56B4B
          %0_2A2B4                               * 56B50
          BEGIN                                  * 56B55
          ?ATTNQUIT                              * 56B5A
          3GETLAM                                * 56B5F
          COMPEVAL                               * 56B64
          CK1NOLASTWD                            * 56B69
          DUPTEMPENV                             * 56B6E
          OBJ_546B1                              * 56B73
          x+                                     * 56B78
          xNEXT                                  * 56B7D
        ;                                        * 56B82

* refs (14): 1AAD1 1AAF3 1AB15 1AB37 1AB59 2EB00 ...
OBJ_56B87:
        ::                                       * 56B87
          DROP                                   * 56B8C
          %0_2A2B4                               * 56B91
        ;                                        * 56B96

* refs (3): 86411 865C4 866B4
OBJ_56B9B:
        ::                                       * 56B9B
          psh                                    * 56BA0
          OBJ_56BEB                              * 56BA5
          top&                                   * 56BAA
          OBJ_56C13                              * 56BAF
          Cr                                     * 56BB4
          x*                                     * 56BB9
        ;                                        * 56BBE

* refs (3): 86196 86303 8639E
OBJ_56BC3:
        ::                                       * 56BC3
          psh                                    * 56BC8
          OBJ_56BEB                              * 56BCD
          top&                                   * 56BD2
          OBJ_56C72                              * 56BD7
          Cr                                     * 56BDC
          x*                                     * 56BE1
        ;                                        * 56BE6

* refs (26): 56BA5 56BCD 7DD03 7DD21 85EBC 85F0C ...
OBJ_56BEB:
        ::                                       * 56BEB
          OBJ_56D01                              * 56BF0
          ABND                                   * 56BF5
        ;                                        * 56BFA

* refs (6): 85EE4 85F66 85FCA 8602E 86713 86731
OBJ_56BFF:
        ::                                       * 56BFF
          ABND                                   * 56C04
          SYMBN                                  * 56C09
        ;                                        * 56C0E

* refs (1): 56BAF
OBJ_56C13:
        ::                                       * 56C13
          RAD?                                   * 56C18
          ?SEMI                                  * 56C1D
          DEG?                                   * 56C22
          ITE                                    * 56C27

{PI,180,/,*}:
          {                                      * 56C2C
            xPI                                  * 56C31
            %180                                 * 56C36
            x/                                   * 56C3B
            x*                                   * 56C40
          }                                      * 56C45

{PI,200,/,*}:
          {                                      * 56C4A
            xPI                                  * 56C4F
            %200                                 * 56C54
            x/                                   * 56C59
            x*                                   * 56C5E
          }                                      * 56C63
          INNERtop&                              * 56C68
        ;                                        * 56C6D

* refs (2): 56BD7 862B3
OBJ_56C72:
        ::                                       * 56C72
          RAD?                                   * 56C77
          ?SEMI                                  * 56C7C
          DEG?                                   * 56C81
          ITE                                    * 56C86

{180,PI,/,*}:
          {                                      * 56C8B
            %180                                 * 56C90
            xPI                                  * 56C95
            x/                                   * 56C9A
            x*                                   * 56C9F
          }                                      * 56CA4

{200,PI,/,*}:
          {                                      * 56CA9
            %200                                 * 56CAE
            xPI                                  * 56CB3
            x/                                   * 56CB8
            x*                                   * 56CBD
          }                                      * 56CC2
          INNERtop&                              * 56CC7
        ;                                        * 56CCC

* refs (7): 57027 5704A 7DCFE 7DD1C 86074 8655B ...
OBJ_56CD1:
        ::                                       * 56CD1
          OBJ_56CE5                              * 56CD6
          BIND                                   * 56CDB
        ;                                        * 56CE0

* refs (1): 56CD6
OBJ_56CE5:
        {                                        * 56CE5
          Π'dv                                   * 56CEA
        }                                        * 56CEF

* refs (3): 567AF 56CEA 56FD6
Π'dv:
        LAM     'dv                              * 56CF4

* refs (10): 56BF0 7DC1D 7DC5E 85F4D 85F70 85FB1 ...
OBJ_56D01:
        ::                                       * 56D01
          SYMBN                                  * 56D06
          1GETSWAP                               * 56D0B
          'xDER                                  * 56D10
          BINT3                                  * 56D15
        ;                                        * 56D1A

* refs (2): 1F6C7 86A33
OBJ_56D1F:
        ::                                       * 56D1F
          4ROLL                                  * 56D24
          CARCOMP                                * 56D29
          NOTROMPcase                            * 56D2E
          OBJ_56D97                              * 56D33
          DUP                                    * 56D38
          OBJ_26F18                              * 56D3D
          NOTcasedrop                            * 56D42
          OBJ_56D97                              * 56D47
          SWAP                                   * 56D4C
          ROMPTR@                                * 56D51
          DROP                                   * 56D56
          infarg?                                * 56D5B
          SWAPDROP                               * 56D60
          ?SKIP                                  * 56D65
          ::                                     * 56D6A
            4ROLLDROP                            * 56D6F
            ROT                                  * 56D74
            #1-UNROT                             * 56D79
          ;                                      * 56D7E
          ROT                                    * 56D83
          #1-UNROT                               * 56D88
          COLA_EVAL                              * 56D8D
        ;                                        * 56D92

* refs (2): 56D33 56D47
OBJ_56D97:
        ::                                       * 56D97
          DUP                                    * 56D9C
          ROMPTR@NOT                             * 56DA1
          casedrop                               * 56DA6
          ::                                     * 56DAB
            NOTROMPcase                          * 56DB0
            OBJ_56EDC                            * 56DB5
            SETTYPEERR                           * 56DBA
          ;                                      * 56DBF
          ROTSWAP                                * 56DC4
          5ROLL                                  * 56DC9
          OBJ_56FD1                              * 56DCE
          BIND                                   * 56DD3
          2GETLAM                                * 56DD8
          OBJ_5DEF7                              * 56DDD
          ARGNUMERR                              * 56DE2
          OBJ_56E96                              * 56DE7
          2DROP                                  * 56DEC
          OBJ_56E05                              * 56DF1
          COLA                                   * 56DF6
          SYMDERSTEP                             * 56DFB
        ;                                        * 56E00

* refs (2): 56DF1 58ECC
OBJ_56E05:
        ::                                       * 56E05
          BINT2                                  * 56E0A
          #-                                     * 56E0F
          pshzer                                 * 56E14
          1GETLAM                                * 56E19
          ZERO_DO                                * 56E1E
          larg                                   * 56E23
          CKSYMBN                                * 56E28
          psh1&                                  * 56E2D
          LOOP                                   * 56E32
          DROP                                   * 56E37
          2GETLAM                                * 56E3C
          SWAPDROPDUP                            * 56E41
          1GETLAM                                * 56E46
          #3+                                    * 56E4B
          NTHCOMPDROP                            * 56E50
          1GETLAM                                * 56E55
          #2+UNROLL                              * 56E5A
          3GETLAM                                * 56E5F
          1GETLAM                                * 56E64
          #3+                                    * 56E69
          UNROLL                                 * 56E6E
          BINT3                                  * 56E73
          1GETLAM                                * 56E78
          #2+                                    * 56E7D
          SUBCOMP                                * 56E82
          1GETABND                               * 56E87
          SPLITWHERE                             * 56E8C
        ;                                        * 56E91

* refs (1): 56DE7
OBJ_56E96:
        ::                                       * 56E96
          DROP                                   * 56E9B
          1GETLAM                                * 56EA0
          3UNROLL                                * 56EA5
          3GETLAM                                * 56EAA
          ABND                                   * 56EAF
          SWAP                                   * 56EB4
          NOTROMPcase                            * 56EB9
          OBJ_56EDC                              * 56EBE
          ROMPTRDECOMP                           * 56EC3
          case                                   * 56EC8
          OBJ_56EDC                              * 56ECD
          SETTYPEERR                             * 56ED2
        ;                                        * 56ED7

* refs (4): 54BA5 56DB5 56EBE 56ECD
OBJ_56EDC:
        ::                                       * 56EDC
          4ROLL                                  * 56EE1
          OBJ_56FD1                              * 56EE6
          BIND                                   * 56EEB
          BINT2                                  * 56EF0
          #-                                     * 56EF5
          dup                                    * 56EFA
          pshzer                                 * 56EFF
          1GETLAM                                * 56F04
          ZERO_DO                                * 56F09
          larg                                   * 56F0E
          SYMBN                                  * 56F13
          3GETLAM                                * 56F18
          SWAP                                   * 56F1D
          'xDER                                  * 56F22
          BINT3                                  * 56F27
          ROTUntop&                              * 56F2C
          psh                                    * 56F31
          LOOP                                   * 56F36
          NDROP                                  * 56F3B
          top&                                   * 56F40
          2GETLAM                                * 56F45
          nm=>st                                 * 56F4A
          OBJ_56F90                              * 56F4F
          $DER                                   * 56F54
          SWAP&$                                 * 56F59
          $>ID                                   * 56F5E
          symcomp                                * 56F63
          1GETABND                               * 56F68
          #2*                                    * 56F6D
          '                                      * 56F72
          xFCNAPPLY                              * 56F77
          4ROLL                                  * 56F7C
          #3+                                    * 56F81
          SYMBN                                  * 56F86
        ;                                        * 56F8B

* refs (1): 56F4F
OBJ_56F90:
        ::                                       * 56F90
          OBJ_25F4E                              * 56F95
          SWAPONE                                * 56F9A
          OVER                                   * 56F9F
          ::                                     * 56FA4
            delimcase                            * 56FA9
            ::                                   * 56FAE
              tokESC                             * 56FB3
              SWAP&$                             * 56FB8
            ;                                    * 56FBD
          ;                                      * 56FC2
          4UNROLL3DROP                           * 56FC7
        ;                                        * 56FCC

* refs (9): 25641 34E3F 566C9 56DCE 56EE6 58E81 ...
OBJ_56FD1:
        {                                        * 56FD1
          Π'dv                                   * 56FD6
          Π'op                                   * 56FDB
          Π'nm                                   * 56FE0
        }                                        * 56FE5

* refs (4): 5683B 568D6 568F9 56FE0
Π'nm:
        LAM     'nm                              * 56FEA

* refs (3): 567F0 56845 56FDB
Π'op:
        LAM     'op                              * 56FF7
