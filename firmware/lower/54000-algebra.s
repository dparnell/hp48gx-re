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
        GOSUB   SAVPTR~jump_53F69                * 5403E
        GOSUB   getwordsize                      * 54042
        R0=A                                     * 54046
L_54049:
        GOVLNG  PUSH#LOOP                        * 54049

* -> #
* refs (4): 2565F 256C6 3ED34 5407F
BASE:
        CON(5)  (*)+5                            * 54050  primitive code object
        GOSUB   SAVPTR~jump_53F69                * 54055
        GOSUB   SUB_541FA                        * 54059
        GOTO    L_54049                          * 5405D
        RPL

* hxs -> $
* refs (4): 15BD8 15D10 15F92 15FAB
HXS>$:
        :: hxs>$ BASECHAR >T$ ;                  * 54061

* -> char
* refs (1): 5406B
BASECHAR:
        :: BASE BINT2 #=casedrop CHR_b           * 5407A
          BINT8 #=casedrop CHR_o                 * 54093
          BINT10 #=case CHR_d                    * 540A2
          CHR_h ;                                * 540B1

* hxs -> $
* refs (1): 54066
hxs>$:
        CON(5)  (*)+5                            * 540BB  primitive code object
        ASSEMBLE
        GOSUB   SAVPTR~jump_53F69                * 540C0
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
        GOSUB   GETPTR~jump_53F70                * 5426B
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
        :: SWAP %># SWAP bit/ ;                  * 5429F

* hxs % -> hxs'
* refs (1): 1AF46
bit#%/:
        :: %># bit/ ;                            * 542BD

* % hxs -> hxs'
* refs (1): 1AE25
bit%#*:
        :: SWAP %># bit* ;                       * 542D1

* hxs % -> hxs'
* refs (1): 1AE2F
bit#%*:
        :: %># bit* ;                            * 542EA

* % hxs -> hxs'
* refs (1): 1AD40
bit%#-:
        :: SWAP %># SWAP bit- ;                  * 542FE

* hxs % -> hxs'
* refs (1): 1AD4A
bit#%-:
        :: %># bit- ;                            * 5431C

* % hxs -> hxs'
* refs (1): 1AB9E
bit%#+:
        :: SWAP %># bit+ ;                       * 54330

* hxs % -> hxs'
* refs (1): 1ABA8
bit#%+:
        :: %># bit+ ;                            * 54349

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
        :: HXS==HXS not(r) ;                     * 544EC

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
        GOSUB   GETPTR~jump_53F70                * 54519
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
            LAM 'tcls                            * 5456F

Π'fcls:
            LAM 'fcls }                          * 54580
          BIND                                   * 54596
          ::                                     * 5459B

* sym -> symf
* refs (42): 54EA5 54EBE 54ED7 54EF0 54F09 54F22 ...
cknumdsptch1:
            :: NOTNUM? case PTR ckseval1:        * 545A0
              EVAL CK1NOLASTWD ->num(ex) CK1NOLASTWD CK&DISPATCH1 * 545B4
              BINT6 ifte(ex,2_)~1                * 545CD  name
              BINT7 ifte(ex,2_)~1                * 545D7  local
              BINT0 skipcola                     * 545E1  any
            ;                                    * 545EB
            MetaIFTE NumIFTE ;                   * 545F0
          ABND ;                                 * 545FF

* refs (1): 545F0
MetaIFTE:
        ::                                       * 54609

Π'tcls_5460E:
          LAM 'tcls symcomp                      * 5460E

Π'fcls_54624:
          LAM 'fcls symcomp BINT2 top& PTR addt: xIFTE ; * 54624

* refs (1): 545F5
NumIFTE:
        :: RDROP                                 * 54653

Π'tcls_5465D:
          LAM 'tcls                              * 5465D

Π'fcls_5466E:
          LAM 'fcls ABND COLA xIFTE              * 5466E
        ;                                        * 5468E

* refs (1): 2300E
xALG->~1:
        :: xALG->~1~1 'R COMPEVAL OBJ_546B1 ;    * 54693

* refs (2): 546A7 56B73
OBJ_546B1:
        :: DUP TYPELAM? case                     * 546B1
          :: EVAL ABND ;                         * 546C5
          DUP TYPESYMB? NOTcase ABND             * 546D9
          ZEROOVER EXPLODE DUP#0_DO #1-SWAP OBJ_54747 LOOP DROP ABND * 546ED
          DUP#0=csDROP #1+DUP dvarlsBIND nmetasyms lam'dvar ABND DUP#1+ Cr * 54715
          xWHERE ;                               * 5473D

* refs (1): 54701
OBJ_54747:
        :: DUP TYPELAM? NOTcaseDROP DUP          * 54747
          FIRST@LAM NOTcaseDROP REQcasedrop      * 54760
          {}_547AB                               * 5476F
          DROP {}_547AB 3PICK STOLAM SWAP symcomp SWAP BINT2 psh over& ; * 54774

* refs (2): 5476F 54779
{}_547AB:
        { }                                      * 547AB

* symf QN1 id1..QNn idn #2n+1 -> symf
* refs (2): 1F4E8 86849
SYMBWHERE:
        :: pullrev SINNER DUP#1= case WHERE1     * 547B5
          COLA WHEREN                            * 547D3
        ;                                        * 547DD

* QN1 id1..QNn idn #n meta1 -> symf
* refs (1): 547CE
WHERE1:
        :: DROPDUP TYPEIDNT? OVER TYPELAM? ORNOT case * 547E2
          :: OVER#2+UNROL NDROP BINT1 DROPSYM ;  * 54805
          BEGIN 4PICK CARCOMP OVER EQUALcasedrp  * 54823

* meta&ob -> ob
COLAkeep1st:
          :: 2DUP #2+UNROLL NDROP RDROP ;        * 5483C
          ROTDROP ROTDROP SWAP #2- DUPUNROT #0= UNTIL SWAPDROP ; * 5485A

* QN1 id1..QNn idn #2 metan -> symf
* refs (1): 547D8
WHEREN:
        :: #1-SWAP OBJ_26F6C case EVAL           * 54887
          infarg? ITE                            * 548A0

* meta&ob1 ob2 -> ob1&ob2 meta
revpull&psh:
          :: pshm1 pullpsh1& ; pshm1             * 548AA
          COLA OBJ_548D2                         * 548C3
        ;                                        * 548CD

* refs (2): 548C8 5A0B8
OBJ_548D2:
        :: rot #1+DUP PTR addt: xWHERE unrot BEGIN DUP#0<>WHILE OBJ_54922 * 548D2
          REPEAT DROP SWAPUnNDROP SYMBN COLA COMPEVAL * 548FF
        ;                                        * 5491D

* refs (1): 548FA
OBJ_54922:
        :: metaROTDUP 4unroll psh larg CKSYMBN symcomp psh1& overev& ; * 54922

* sym sym -> symf
* refs (1): 1EF97
SYMDER:
        :: symcomp SWAP SYMDERSTEP COLA OBJ_54BAF * 54954
        ;                                        * 54972

* QN sym -> symf
* refs (6): 1F109 54963 54B14 56DFB 83883 8681C
SYMDERSTEP:
        :: SWAP dvarlsBIND SINNER DUP#1= case SYMDERSTEP~1 * 54977
          MetaConcase                            * 5499A

* meta -> %0
Repl0ABND:
          :: NDROP ABND %0_2A2B4 ;               * 5499F
          #1-SWAP 1ABNDSWAP SYMDERSTEP~2 ;       * 549B8

* refs (3): 1F645 63A2E 85E30
{'dvar}:
        { lam'dvar }                             * 549CC

* LAM 'dvar
* refs (32): 54729 549D1 58F1C 5907F 5938C 593BE ...
lam'dvar:
        LAM 'dvar                                * 549DB

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
SYMDERSTEP~1:
        :: GETLAM CARCOMP DUP TYPELAM? case SYMDERSTEP~1~1 * 54A6F
          OVERSWAP EQUALcase                     * 54A92

* ob -> %1
DROP%1ABND:
          :: DROP %1 ABND ;                      * 54A9C
          ROMPTR@NOT case DROP%0ABND             * 54AB5
          CK&DISPATCH0                           * 54AC4
          BINT10 SYMDERSTEP~1~name|local|algebraic * 54AC9  name|local|algebraic
          BINT0 DROP%0ABND                       * 54AD3  any
        ;                                        * 54ADD

* refs (1): 54A8D
SYMDERSTEP~1~1:
        :: ABND EQUAL %1 %0_2A2B4 RPITE ;        * 54AE2

* refs (1): 54ACE
SYMDERSTEP~1~name|local|algebraic:
        :: 1ABNDSWAP COLA SYMDERSTEP             * 54B05
        ;                                        * 54B19

* ob -> %0
* refs (2): 54ABF 54AD8
DROP%0ABND:
        :: DROP%0 ABND ;                         * 54B1E

* refs (1): 549C2
SYMDERSTEP~2:
        :: OBJ_26F18 case EVAL                   * 54B32
          DUP PTR>ROMPTR ROMPTRDECOMP NcaseTYPEERR SWAP * 54B46
          infarg? ITE                            * 54B5F
          :: 5ROLL 5ROLL #1- 5UNROLL ; argum     * 54B69
          SWAPDROP 4UNROLLROT #2+ 3UNROLL COLA OBJ_56EDC * 54B8C
        ;                                        * 54BAA

* refs (2): 5496D 593CD
OBJ_54BAF:
        :: CK1NOLASTWD BEGIN DUPTYPESYMB? ITE OBJ_54BF5 FALSE * 54BAF
          WHILE                                  * 54BD2
          :: COMPEVAL CK1NOLASTWD ; REPEAT ;     * 54BD7

* refs (1): 54BC8
OBJ_54BF5:
        :: DUP >R BEGIN RSWAP ticR case OBJ_54C2C * 54BF5
          RDROP FALSE ;                          * 54C1D

* refs (1): 54C18
OBJ_54C2C:
        :: 'xDEREQ case RDROPCOLATRUE            * 54C2C
          RSWAP REPEAT ;                         * 54C40

* -> T
* refs (1): 54C3B
RDROPCOLATRUE:
        :: 2RDROP TRUE ;                         * 54C4F

* meta -> meta
* refs (19): 1F289 1F2A7 1F452 1F49D 1F6FE 1FB3B ...
nmetasyms:
        :: #1+DUP ONE_DO DUPROLL CK&DISPATCH1    * 54C63
          BINT1 SWAPDROPLOOP                     * 54C7C  real
          BINT2 SWAPDROPLOOP                     * 54C86  complex
          BINT14 SWAPDROPLOOP                    * 54C90  unit
          BINT10 SWAPDROPLOOP                    * 54C9A  name|local|algebraic
          BINT0 drop(2);BAT!                     * 54CA4  any
        ;                                        * 54CAE

* ob1 ob2 -> ob2
* refs (4): 54C81 54C8B 54C95 54C9F
SWAPDROPLOOP:
        :: SWAPLOOP DROP ;                       * 54CB3

* refs (1): 54CA9
drop(2);BAT!:
        :: SWAPDROP SETTYPEERR ;                 * 54CC7

* refs (1): 1AB0B
xMINR~1:
        :: OBJ_5EA72 %MINREAL BINT0              * 54CDB

* ob1..obn #n -> symb
* refs (40): 1F735 54738 54D26 54D49 54D6C 54D8F ...
Cr:
          :: 'R SWAP#1+ SYMBN ; xMINR ;          * 54CEF

* refs (1): 1AAE9
maxr:
        :: OBJ_5EA72 %MAXREAL BINT0 Cr xMAXR ;   * 54D12

* refs (1): 1AAC7
pi:
        :: OBJ_5EA72 %PI BINT0 Cr xPI ;          * 54D35

* refs (1): 1AB4F
i:
        :: OBJ_5EA72 C%i BINT0 Cr xi ;           * 54D58

* refs (1): 1AB2D
e:
        :: OBJ_5EA72 %e BINT0 Cr xCONSTANTe ;    * 54D7B

* refs (2): 545D2 545DC
ifte(ex,2_)~1:
        :: XEQRCL COLA skipcola                  * 54D9E
          NOP ;                                  * 54DB2

* symf' -> symf'
* refs (1): 545AF
ckseval1::
        :: 'R'R RDROP                            * 54DBC

{'xSYMfcn,'xfcn}:
          {                                      * 54DCB

Π'xSYMfcn:
            LAM 'xSYMfcn                         * 54DD0

Π'xfcn:
            LAM 'xfcn }                          * 54DE7
          BIND SINNER AEQ1stcase x=              * 54DFD
          ckevaleq1 2GETEVAL ABND CKSYMBN ;      * 54E11

* meta&= -> sym
* refs (2): 54E11 557D3
ckevaleq1:
        :: SWAPDROP#1- pshzerpsharg 2GETEVAL psh 2GETEVAL ABND top&Cr x= ; * 54E2A

* refs (3): 5535A 55387 553B4
OBJ_54E5C:
        :: RAD? IT OBJ_54E7F                     * 54E5C
          'R'R 2DROP ;                           * 54E70

* refs (1): 54E6B
OBJ_54E7F:
        CON(5)  (*)+5                            * 54E7F  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 54E84  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  C0000                            * 54E8B  pattern: op11
        CON(5)  COLA                             * 54E90  run if it matches
        NIBHEX  4DC00                            * 54E95  pattern: op3 op12 op11
        CON(5)  skipcola                         * 54E9A  run if it matches
        NIBHEX  F                                * 54E9F  end of the rules
        RPL

* refs (1): 1C7F7
re(ex):
        :: cknumdsptch1 MetaRE xRE ;             * 54EA0

* refs (1): 1C846
SYMIM:
        :: cknumdsptch1 MetaIM xIM ;             * 54EB9

* refs (1): 1E8B2
SYMNOT:
        :: cknumdsptch1 1GETLAMSWP1+ xNOT ;      * 54ED2

* refs (1): 1A9C2
SYMNEG:
        :: cknumdsptch1 MetaNEG xNEG ;           * 54EEB

* refs (1): 1AA4C
SYMABS:
        :: cknumdsptch1 MetaABS xABS ;           * 54F04

* refs (1): 1AA9B
SYMCONJ:
        :: cknumdsptch1 MetaCONJ xCONJ ;         * 54F1D

* refs (1): 1B2A5
SYMINV:
        :: cknumdsptch1 MetaINV xINV ;           * 54F36

* refs (1): 1B2FE
SYMARG:
        :: cknumdsptch1 1GETLAMSWP1+ xARG ;      * 54F4F

* refs (1): 1B34D
SYMSIGN:
        :: cknumdsptch1 ?addrever xSIGN ;        * 54F68

* refs (1): 1B397
SYMSQRT:
        :: cknumdsptch1 1GETLAMSWP1+ xSQRT ;     * 54F81

* refs (1): 1B453
SYMSQ:
        :: cknumdsptch1 MetaSQ xSQ ;             * 54F9A

* refs (1): 1B4CF
SYMSIN:
        :: cknumdsptch1 MetaSIN xSIN ;           * 54FB3

* refs (1): 1B528
SYMCOS:
        :: cknumdsptch1 MetaCOS xCOS ;           * 54FCC

* refs (1): 1B581
SYMTAN:
        :: cknumdsptch1 MetaTAN xTAN ;           * 54FE5

* refs (1): 1B5DA
SYMSINH:
        :: cknumdsptch1 MetaSINH xSINH ;         * 54FFE

* refs (1): 1B629
SYMCOSH:
        :: cknumdsptch1 MetaCOSH xCOSH ;         * 55017

* refs (1): 1B678
SYMTANH:
        :: cknumdsptch1 MetaTANH xTANH ;         * 55030

* refs (1): 1B6C7
SYMASIN:
        :: cknumdsptch1 1GETLAMSWP1+ xASIN ;     * 55049

* refs (1): 1B752
SYMACOS:
        :: cknumdsptch1 1GETLAMSWP1+ xACOS ;     * 55062

* refs (1): 1B7BF
SYMATAN:
        :: cknumdsptch1 1GETLAMSWP1+ xATAN ;     * 5507B

* refs (1): 1B80E
SYMASINH:
        :: cknumdsptch1 1GETLAMSWP1+ xASINH ;    * 55094

* refs (1): 1B853
SYMACOSH:
        :: cknumdsptch1 1GETLAMSWP1+ xACOSH ;    * 550AD

* refs (1): 1B8C5
SYMATANH:
        :: cknumdsptch1 1GETLAMSWP1+ xATANH ;    * 550C6

* refs (1): 1B928
SYMEXP:
        :: cknumdsptch1 MetaEXP xEXP ;           * 550DF

* refs (1): 1B972
SYMLN:
        :: cknumdsptch1 1GETLAMSWP1+ xLN ;       * 550F8

* refs (1): 1B9E9
SYMLOG:
        :: cknumdsptch1 1GETLAMSWP1+ xLOG ;      * 55111

* refs (1): 1BA60
SYMALOG:
        :: cknumdsptch1 MetaALOG xALOG ;         * 5512A

* refs (1): 1BAA5
SYMLNP1:
        :: cknumdsptch1 1GETLAMSWP1+ xLNP1 ;     * 55143

* refs (1): 1BADB
SYMEXPM:
        :: cknumdsptch1 MetaEXPM xEXPM ;         * 5515C

* refs (3): 1BB1B 1BB5A 594CC
SYMFACT:
        :: cknumdsptch1 1GETLAMSWP1+ xFACT ;     * 55175

* refs (1): 1BB86
SYMIP:
        :: cknumdsptch1 1GETLAMSWP1+ xIP ;       * 5518E

* refs (1): 1BBBC
SYMFP:
        :: cknumdsptch1 1GETLAMSWP1+ xFP ;       * 551A7

* refs (1): 1BBF2
SYMFLOOR:
        :: cknumdsptch1 1GETLAMSWP1+ xFLOOR ;    * 551C0

* refs (1): 1BC28
SYMCEIL:
        :: cknumdsptch1 1GETLAMSWP1+ xCEIL ;     * 551D9

* refs (1): 1BC5E
SYMEXPONENT:
        :: cknumdsptch1 1GETLAMSWP1+ xXPON ;     * 551F2

* refs (1): 1BEB5
SYMMANT:
        :: cknumdsptch1 1GETLAMSWP1+ xMANT ;     * 5520B

* refs (1): 1BEE1
SYMD>R:
        :: cknumdsptch1 1GETLAMSWP1+ xD>R ;      * 55224

* refs (1): 1BF0D
SYMR>D:
        :: cknumdsptch1 1GETLAMSWP1+ xR>D ;      * 5523D

* refs (1): 19794
SYMUBASE:
        :: cknumdsptch1 1GETLAMSWP1+ xUBASE ;    * 55256

* refs (1): 1973E
uval(ex):
        :: cknumdsptch1 1GETLAMSWP1+ xUVAL ;     * 5526F

* # -> 1lamob #+1
* refs (36): 54EDC 54F59 54F8B 55053 5506C 55085 ...
1GETLAMSWP1+:
        :: 1GETLAM SWAP#1+ ;                     * 55288

* refs (1): 55008
MetaSINH:
        :: PTR ?addinver: xASINH ;               * 5529C

* refs (1): 55021
MetaCOSH:
        :: PTR ?addinver: xACOSH ;               * 552B0

* refs (1): 5503A
MetaTANH:
        :: PTR ?addinver: xATANH ;               * 552C4

* refs (1): 550E9
MetaEXP:
        :: PTR ?addinver: xLN ;                  * 552D8

* refs (1): 55134
MetaALOG:
        :: PTR ?addinver: xLOG ;                 * 552EC

* refs (1): 55166
MetaEXPM:
        :: PTR ?addinver: xLNP1 ;                * 55300

* meta&Nob -> meta meta -> meta&1LAM
* refs (10): 552A1 552B5 552C9 552DD 552F1 55305 ...
?addinver::
        :: SWAP 'RRDROP EQcasedrop #1-           * 55314
          1GETLAM ROT#1+ ;                       * 5532D

* refs (1): 54FBD
MetaSIN:
        :: M-1stcasechs                          * 5533C

* refs (1): 553AF
MetaTAN~1:
          :: 1GETLAMSWP1+ metaneg ;              * 55346
          OBJ_54E5C Repl0 Repl1 PTR ?addinver: xASIN ; * 5535A

* refs (1): 54FD6
MetaCOS:
        :: M-1stcasechs 1GETLAMSWP1+             * 55378
          OBJ_54E5C Repl-1 Repl0 PTR ?addinver: xACOS ; * 55387

* refs (1): 54FEF
MetaTAN:
        :: M-1stcasechs MetaTAN~1                * 553A5
          OBJ_54E5C Repl0 1GETLAMSWP1+ PTR ?addinver: xATAN ; * 553B4

* refs (1): 54EF5
MetaNEG:
        :: M-1stcasechs NOP                      * 553D2
          1GETLAMSWP1+ ;                         * 553E1

* refs (1): 54F40
MetaINV:
        :: AEQ1stcase xi                         * 553EB
          addtNEG PTR ?addinver: xINV ;          * 553FA

* meta&1LAM -> meta&1LAM meta -> meta&1LAM
* refs (1): 54F72
?addrever:
        :: 1GETLAM MEQ1stcase NOP                * 5540E
          1GETLAMSWP1+ ;                         * 55422

* refs (1): 54EAA
MetaRE:
        :: 1GETLAM MEQ1stcase NOP                * 5542C
          AEQ1stcase xIM                         * 55440
          NOP AEQ1stcase xPI                     * 5544A
          NOP AEQ1stcase xi                      * 55459
          Repl0 AEQ1stcase xCONJ                 * 55468

* meta&ob -> meta&LAM1
replfunc:
          :: 1GETLAM ROTDROPSWAP ; 1GETLAMSWP1+ ; * 55477

* refs (1): 54EC3
MetaIM:
        :: AEQ1stcase xRE                        * 55495
          Repl0 AEQ1stcase xi                    * 554A4

* meta&ob -> meta&%1
repl%1:
          :: %1 ROTDROPSWAP ; AEQ1stcase xPI     * 554B3
          Repl0 1GETLAM MEQ1stcase Repl0         * 554D1
          AEQ1stcase xCONJ                       * 554E5
          :: SWAPDROP 1GETLAM ' xNEG ROT#1+ ; 1GETLAMSWP1+ ; * 554EF

* meta -> %0 #0
* refs (10): 5535F 55391 553B9 55468 554A4 554D1 ...
Repl0:
        :: NDROP %0_2A2B4 BINT1 ;                * 5551C

* meta -> %1 #1
* refs (1): 55364
Repl1:
        :: NDROP %1 BINT1 ;                      * 55535

* meta -> %-1 #1
* refs (2): 5538C 561E2
Repl-1:
        :: NDROP %-1 BINT1 ;                     * 5554E

* refs (1): 54F27
MetaCONJ:
        :: AEQ1stcase xi                         * 55567
          addtNEG AEQ1stcase xRE                 * 55576
          NOP AEQ1stcase xIM                     * 55585
          NOP 1GETLAM MEQ1stcase SWAPDROP#1-     * 55594
          1GETLAMSWP1+ ;                         * 555A8

* refs (1): 54F0E
MetaABS:
        :: 1GETLAM MEQ1stcase NOP                * 555B2
          M1stNEGcase                            * 555C6
          :: SWAPDROP 1GETSWAP ;                 * 555CB
          1GETLAMSWP1+ ;                         * 555DF

* refs (1): 54FA4
MetaSQ:
        :: AEQ1stcase xSQRT                      * 555E9
          SWAPDROP#1- AEQ1stcase xi              * 555F8

* meta&ob -> meta&%-1
repl%-1:
          :: %-1 ROTDROPSWAP ; M1st^case         * 55607
          :: SWAPDROP %2 'x* ' x^ 4ROLL #2+ ;    * 55620
          1GETLAMSWP1+ ;                         * 5564D

* symf symf -> symf
* refs (4): 558E1 558FA 55913 55931
cknum2::
        :: NOTNUM? ?SEMI                         * 55657

{'oth}:
          {                                      * 55666

Π'oth:
            LAM 'oth }                           * 5566B
          BIND EVAL CK1NOLASTWD ->num(ex) CK1NOLASTWD 1GETABND EVAL * 5567F
          CK2NOLASTWD ->num(ex) CK2NOLASTWD CK&DISPATCH1 * 556A2
          BINT6 cknum2:~1                        * 556B6  name
          BINT7 cknum2:~1                        * 556C0  local
          BINT96 cknum2:~2                       * 556CA  name any
          BINT112 cknum2:~2                      * 556D4  local any
          BINT0 COLAthexFCN                      * 556DE  any
        ;                                        * 556E8

* refs (2): 556BB 556C5
cknum2:~1:
        :: XEQRCL COLA COLAthexFCN               * 556ED
          NOP ;                                  * 55701

* refs (2): 556CF 556D9
cknum2:~2:
        :: SWAP XEQRCL COLA                      * 5570B
          :: SWAPCOLA COLAthexFCN ;              * 5571F
          NOP ;                                  * 55733

* refs (3): 556E3 556FC 55729
COLAthexFCN:
        :: RDROP 'R drop;dq COLA ;               * 5573D

* % sym -> symf
* refs (1): 5591D
cknseval::
        :: SWAPCOLA PTR cksneval2: ;             * 5575B

* sym % -> symf
* refs (2): 55765 55904
cksneval2::
        :: 'R'R RDROP                            * 5576F
          {                                      * 5577E

Π'scl:
            LAM 'scl                             * 55783

Π'xSYMfcn_55792:
            LAM 'xSYMfcn                         * 55792

Π'xfcn_557A9:
            LAM 'xfcn }                          * 557A9
          BIND SINNER AEQ1stcase x=              * 557BF
          ckevaleq1 2GETEVAL ABND CKSYMBN ;      * 557D3

* sym sym -> symf
* refs (1): 558EB
cksseval2::
        :: 'R'R RDROP                            * 557EC

{Π'xSYMfcn,Π'xfcn}:
          {                                      * 557FB

Π'xSYMfcn_55800:
            LAM 'xSYMfcn                         * 55800

Π'xfcn_55817:
            LAM 'xfcn }                          * 55817
          BIND 2SINNER AEQ1stcase x=             * 5582D
          cksseval2:~1 DUP #3+PICK REQcasedrop x= * 55841
          cksseval2:~1 DROP 2GETEVAL ABND CKSYMBN ; * 5585A

* refs (2): 55841 5585A
cksseval2:~1:
        :: psh ?spliteq rot ?spliteq rot psh 2GETEVAL unrot 2GETEVAL ABND * 55878
          top&Cr x= ;                            * 558AF

* meta1&meta2&= -> meta2 meta1
* refs (2): 55882 5588C
?spliteq:
        :: AEQ1stcase x=                         * 558BE
          plDRPpZparg dup ;                      * 558CD

* sym sym -> symf
* refs (32): 559D1 55A1C 55A67 55AB2 55AFD 55B48 ...
sscknum2:
        :: PTR cknum2: COLA PTR cksseval2:       * 558DC
        ;                                        * 558F0

* sym % -> symf
* refs (32): 5599F 559EA 55A35 55A80 55ACB 55B16 ...
sncknum2:
        :: PTR cknum2: COLA PTR cksneval2:       * 558F5
        ;                                        * 55909

* % sym -> symf
* refs (32): 559B8 55A03 55A4E 55A99 55AE4 55B2F ...
nscknum2:
        :: PTR cknum2: COLA PTR cknseval:        * 5590E
        ;                                        * 55922

* refs (14): 1A8E7 1A8F1 1A8FB 1A905 1A90F 1A919 ...
x=~1:
        ::                                       * 55927
          :: PTR cknum2: COLA x=~1~1             * 5592C
          ;                                      * 55940
          NOP x- ;                               * 55945

* refs (1): 5593B
x=~1~1:
        :: RDROP 2SINNER AEQ1stcase x=           * 55954
          SETTYPEERR psh AEQ1stcase x=           * 5596D
          SETTYPEERR pshtop& Cr x= ;             * 55981

* refs (1): 1E7B0
SYM%AND:
        :: sncknum2 xsngeneral xAND ;            * 5599A

* refs (1): 1E7A6
%SYMAND:
        :: nscknum2 xnsgeneral xAND ;            * 559B3

* refs (1): 1E7BA
SYMAND:
        :: sscknum2 xssgeneral xAND ;            * 559CC

* refs (1): 1E836
SYM%OR:
        :: sncknum2 xsngeneral xOR ;             * 559E5

* refs (1): 1E82C
%SYMOR:
        :: nscknum2 xnsgeneral xOR ;             * 559FE

* refs (1): 1E840
SYMOR:
        :: sscknum2 xssgeneral xOR ;             * 55A17

* refs (1): 1E923
SYM%XOR:
        :: sncknum2 xsngeneral xXOR ;            * 55A30

* refs (1): 1E919
%SYMXOR:
        :: nscknum2 xnsgeneral xXOR ;            * 55A49

* refs (1): 1E92D
SYMXOR:
        :: sscknum2 xssgeneral xXOR ;            * 55A62

* refs (3): 1E995 1E99F 1E9EF
SYMFLOAT==:
        :: sncknum2 xsngeneral x== ;             * 55A7B

* refs (3): 1E981 1E98B 1E9F9
FLOATSYM==:
        :: nscknum2 xnsgeneral x== ;             * 55A94

* refs (1): 1E9A9
SYM==:
        :: sscknum2 xssgeneral x== ;             * 55AAD

* refs (3): 1EAC0 1EACA 1EB1A
SYMFLOAT<>:
        :: sncknum2 xsngeneral x#? ;             * 55AC6

* refs (3): 1EAAC 1EAB6 1EB24
FLOATSYM<>:
        :: nscknum2 xnsgeneral x#? ;             * 55ADF

* refs (1): 1EAD4
SYM<>:
        :: sscknum2 xssgeneral x#? ;             * 55AF8

* refs (2): 1EBF5 1EC27
SYM%<:
        :: sncknum2 xsngeneral x< ;              * 55B11

* refs (2): 1EBEB 1EC31
%SYM<:
        :: nscknum2 xnsgeneral x< ;              * 55B2A

* refs (1): 1EBFF
SYM<:
        :: sscknum2 xssgeneral x< ;              * 55B43

* refs (2): 1EC94 1ECC6
SYM%>:
        :: sncknum2 xsngeneral x> ;              * 55B5C

* refs (2): 1EC8A 1ECD0
%SYM>:
        :: nscknum2 xnsgeneral x> ;              * 55B75

* refs (1): 1EC9E
SYM>:
        :: sscknum2 xssgeneral x> ;              * 55B8E

* refs (2): 1ED33 1ED65
SYM%<=:
        :: sncknum2 xsngeneral x<=? ;            * 55BA7

* refs (2): 1ED29 1ED6F
%SYM<=:
        :: nscknum2 xnsgeneral x<=? ;            * 55BC0

* refs (1): 1ED3D
SYM<=:
        :: sscknum2 xssgeneral x<=? ;            * 55BD9

* refs (2): 1EDD2 1EE04
SYM%>=:
        :: sncknum2 xsngeneral x>=? ;            * 55BF2

* refs (2): 1EDC8 1EE0E
%SYM>=:
        :: nscknum2 xnsgeneral x>=? ;            * 55C0B

* refs (1): 1EDDC
SYM>=:
        :: sscknum2 xssgeneral x>=? ;            * 55C24

* refs (2): 1C083 1C0AB
SYM%%OF:
        :: sncknum2 xsngeneral x% ;              * 55C3D

* refs (2): 1C079 1C0A1
%SYM%OF:
        :: nscknum2 xnsgeneral x% ;              * 55C56

* refs (1): 1C08D
SYM%OF:
        :: sscknum2 xssgeneral x% ;              * 55C6F

* refs (2): 1C16C 1C1A8
SYM%%CH:
        :: sncknum2 xsngeneral x%CH ;            * 55C88

* refs (2): 1C162 1C19E
%SYM%CH:
        :: nscknum2 xnsgeneral x%CH ;            * 55CA1

* refs (1): 1C176
SYM%CH:
        :: sscknum2 xssgeneral x%CH ;            * 55CBA

* refs (2): 1C0FA 1C136
SYM%%T:
        :: sncknum2 xsngeneral x%T ;             * 55CD3

* refs (2): 1C0F0 1C12C
%SYM%T:
        :: nscknum2 xnsgeneral x%T ;             * 55CEC

* refs (1): 1C104
SYM%T:
        :: sscknum2 xssgeneral x%T ;             * 55D05

* refs (1): 1C219
SYM%COMB:
        :: sncknum2 xsngeneral xCOMB ;           * 55D1E

* refs (1): 1C20F
%SYMCOMB:
        :: nscknum2 xnsgeneral xCOMB ;           * 55D37

* refs (1): 1C223
SYMCOMB:
        :: sscknum2 xssgeneral xCOMB ;           * 55D50

* refs (1): 1C259
SYM%PERM:
        :: sncknum2 xsngeneral xPERM ;           * 55D69

* refs (1): 1C24F
%SYMPERM:
        :: nscknum2 xnsgeneral xPERM ;           * 55D82

* refs (1): 1C263
SYMPERM:
        :: sscknum2 xssgeneral xPERM ;           * 55D9B

* refs (1): 1BD96
SYM%RND:
        :: sncknum2 xsngeneral xRND ;            * 55DB4

* refs (3): 1BD6E 1BD82 1BDB4
SYMRND:
        :: nscknum2 xnsgeneral xRND ;            * 55DCD

* refs (1): 1BDA0
RNDSYM:
        :: sscknum2 xssgeneral xRND ;            * 55DE6

* refs (1): 1BE12
SYM%TRNC:
        :: sncknum2 xsngeneral xTRNC ;           * 55DFF

* refs (3): 1BDEA 1BDFE 1BE30
TRCNYM:
        :: nscknum2 xnsgeneral xTRNC ;           * 55E18

* refs (1): 1BE1C
SYMTRCN:
        :: sscknum2 xssgeneral xTRNC ;           * 55E31

* refs (2): 1BC94 1BCD0
SYM%MAX:
        :: sncknum2 xsngeneral xMAX ;            * 55E4A

* refs (2): 1BC8A 1BCC6
%SYMMAX:
        :: nscknum2 xnsgeneral xMAX ;            * 55E63

* refs (1): 1BC9E
SYMMAX:
        :: sscknum2 ?addsimir xMAX ;             * 55E7C

* refs (2): 1BD06 1BD42
SYM%MIN:
        :: sncknum2 xsngeneral xMIN ;            * 55E95

* refs (2): 1BCFC 1BD38
%SYMMIN:
        :: nscknum2 xnsgeneral xMIN ;            * 55EAE

* refs (1): 1BD10
SYMMIN:
        :: sscknum2 ?addsimir xMIN ;             * 55EC7

* refs (3): 1B078 1B082 1B0B4
SYM^O:
        :: sncknum2 Meta^Con x^ ;                * 55EE0

* refs (3): 1B064 1B06E 1B0BE
O^SYM:
        :: nscknum2 Con^Meta x^ ;                * 55EF9

* refs (1): 1B08C
SYM^:
        :: sscknum2 xssgeneral x^ ;              * 55F12

* refs (3): 1ABEE 1AC02 1AC0C
SYM+O:
        :: sncknum2 Meta+Con x+ ;                * 55F2B

* refs (3): 1ABE4 1ABF8 1AC16
O+SYM:
        :: nscknum2 Con+Meta x+ ;                * 55F44

* refs (1): 1ABDA
SYM+:
        :: sscknum2 Meta+ x+ ;                   * 55F5D

* refs (3): 1AD7C 1AD86 1ADB8
SYM-O:
        :: sncknum2 Meta-Con                     * 55F76

O-SYM:
          x- ;                                   * 55F85

* refs (3): 1AD68 1AD72 1ADC2
SYM-:
        :: nscknum2 Con-Meta x- ;                * 55F8F

* refs (1): 1AD90
-(2ex):
        :: sscknum2 Meta- x- ;                   * 55FA8

* refs (3): 1AE89 1AE93 1AEC5
SYM*O:
        :: sncknum2 Meta*Con x* ;                * 55FC1

* refs (3): 1AE75 1AE7F 1AECF
O*SYM:
        :: nscknum2 Con*Meta x* ;                * 55FDA

* refs (1): 1AE9D
SYM*:
        :: sscknum2 Meta* x* ;                   * 55FF3

* refs (3): 1AF8C 1AF96 1AFC8
SYM/O:
        :: sncknum2 Meta/Con x/ ;                * 5600C

* refs (3): 1AF78 1AF82 1AFD2
O/SYM:
        :: nscknum2 Con/Meta x/ ;                * 56025

* refs (1): 1AFA0
SYM/:
        :: sscknum2 Meta/ x/ ;                   * 5603E

* refs (1): 1BE70
SYM%MOD:
        :: sncknum2 MetamodCon xMOD ;            * 56057

* refs (1): 1BE66
%SYMMOD:
        :: nscknum2 ConmodMeta xMOD ;            * 56070

* refs (1): 1BE7A
SYMMOD:
        :: sscknum2 Metamod xMOD ;               * 56089

* refs (2): 1B20B 1B21F
SYM%XROOT:
        :: sncknum2 xsngeneral xXROOT ;          * 560A2

* refs (2): 1B201 1B229
%SYMXROOT:
        :: nscknum2 xnsgeneral xXROOT ;          * 560BB

* refs (1): 1B215
SYMXROOT:
        :: sscknum2 xssgeneral xXROOT ;          * 560D4

* refs (23): 559D6 55A21 55A6C 55AB7 55B02 55B4D ...
xssgeneral:
        :: top& 1GETLAMSWP1+ ;                   * 560ED

* meta -> LAM3&meta&LAM1
* refs (21): 559BD 55A08 55A53 55A9E 55AE9 55B34 ...
xnsgeneral:
        :: 3GETLAM BINT1 pshtop& 1GETLAMSWP1+ ;  * 56101

* meta -> meta&LAM3&LAM1
* refs (21): 559A4 559EF 55A3A 55A85 55AD0 55B1B ...
xsngeneral:
        :: 3GETLAM BINT1 top& 1GETLAMSWP1+ ;     * 5611F

* meta meta -> meta
* refs (2): 55E86 55ED1
?addsimir:
        :: MEQU? case NDROP                      * 5613D
          COLA xssgeneral                        * 56151
        ;                                        * 5615B

* refs (3): 55F67 5634F 5655C
Meta+:
        :: top& meta+ ;                          * 56160

* refs (1): 55FB2
Meta-:
        :: MEQU? case                            * 56174

* meta1 meta2 -> %0 #1
2Repl0:
          :: NDROP Repl0 ;                       * 56183
          COLA OBJ_561A6                         * 56197
        ;                                        * 561A1

* refs (3): 5619C 56386 5657F
OBJ_561A6:
        :: top& meta- ;                          * 561A6

* refs (3): 55FFD 563D1 565C5
Meta*:
        :: psh M-1stcasechs Meta*~1              * 561BA
          AEQopscase xi                          * 561CE

* meta1 meta2 -> %-1 #1
2Repl-1:
          :: NDROP Repl-1 ; pshtop& meta* ;      * 561D8

* refs (1): 561C9
Meta*~1:
        :: pshtop& meta* metaneg ;               * 561FB

* refs (3): 56048 56421 56601
Meta/:
        :: psh M-1stcasechs Meta/~1              * 56214
          pshtop& meta/ ;                        * 56228

* refs (1): 56223
Meta/~1:
        :: pshtop& meta/ metaneg ;               * 56237

* refs (2): 56093 56624
Metamod:
        :: MEQU? case                            * 56250
          :: NDROP Repl0 ;                       * 5625F
          psh #1-SWAP 1GETLAM EQcasedrop Metamod~1 * 56273
          SWAP#1+ psh COLA xssgeneral            * 5628C
        ;                                        * 562A0

* refs (1): 56287
Metamod~1:
        :: pshzerpsharg unrot MEQU? case         * 562A5

* meta1 meta2 meta3 -> meta1&meta2&LAM1
dropaddoper:
          :: NDROP COLA xssgeneral               * 562BE
          ;                                      * 562D2
          rot psh xssgeneral psh COLA xssgeneral * 562D7
        ;                                        * 562F5

* refs (1): 55F03
Con^Meta:
        :: 3GETLAM num1=case                     * 562FA

* meta ob -> LAM3 #1
* refs (3): 5639F 563EA 56598
MetaUnCalc:
          :: DROPNDROP 3GETLAM BINT1 ;           * 56309
          drop;dq xnsgeneral ;                   * 56322

* refs (1): 55F4E
Con+Meta:
        :: 3GETLAM num0=case DROP                * 56331
          pshm1 COLA Meta+                       * 56345
        ;                                        * 56354

* refs (1): 55F99
Con-Meta:
        :: 3GETLAM num0=case                     * 56359
          :: DROP metaneg ;                      * 56368
          pshm1 COLA OBJ_561A6                   * 5637C
        ;                                        * 5638B

* refs (1): 55FE4
Con*Meta:
        :: 3GETLAM num0=case MetaUnCalc          * 56390
          num1=case DROP                         * 563A4
          num-1=case                             * 563AE
          :: DROP metaneg ;                      * 563B3
          pshm1 COLA Meta*                       * 563C7
        ;                                        * 563D6

* refs (1): 5602F
Con/Meta:
        :: 3GETLAM num0=case MetaUnCalc          * 563DB
          num1=case                              * 563EF

* refs (1): 56412
OBJ_563F4:
          :: pshm1 top& meta/ ;                  * 563F4
          num-1=case OBJ_563F4                   * 5640D
          pshm1 COLA Meta/                       * 56417
        ;                                        * 56426

* refs (1): 5607A
ConmodMeta:
        :: 3GETLAM num0=case                     * 5642B

* meta ob -> %0 #1
DropRepl0:
          :: DROP Repl0 ;                        * 5643A
          drop;dq xnsgeneral ;                   * 5644E

* refs (1): 55EEA
Meta^Con:
        :: 3GETLAM num0=case                     * 5645D
          :: DROP NDROP 3GETLAM TYPE TYPEREAL #= %1 C%1 RPITE BINT1 ; * 5646C
          num1=case DROP                         * 564A8
          num-1=case                             * 564B2
          :: DROP metainv ;                      * 564B7
          num2=case                              * 564CB
          :: DROP AEQ1stcase xSQRT               * 564D0
            SWAPDROP#1- AEQ1stcase xi            * 564E4
            :: 3GETLAM TYPE TYPEREAL #= %-1 C%-1 RPITE ROTDROPSWAP ; COLA * 564F3
            xsngeneral                           * 5652A
          ;                                      * 5652F
          drop;dq xsngeneral ;                   * 56534

* refs (1): 55F35
Meta+Con:
        :: 3GETLAM num0=case DROP                * 56543
          ONECOLA Meta+ ;                        * 56557

* refs (1): 55F80
Meta-Con:
        :: 3GETLAM num0=case DROP                * 56566
          ONECOLA OBJ_561A6 ;                    * 5657A

* refs (1): 55FCB
Meta*Con:
        :: 3GETLAM num0=case MetaUnCalc          * 56589
          num1=case DROP                         * 5659D
          num-1=case                             * 565A7
          :: DROP metaneg ;                      * 565AC
          ONECOLA Meta* ;                        * 565C0

* refs (1): 56016
Meta/Con:
        :: 3GETLAM num1=case DROP                * 565CF
          num-1=case                             * 565E3
          :: DROP metaneg ;                      * 565E8
          ONECOLA Meta/ ;                        * 565FC

* refs (1): 56061
MetamodCon:
        :: 3GETLAM num0=case DROP                * 5660B
          ONECOLA Metamod ;                      * 5661F

* symf QN symf_lo symf_hi -> %
* refs (1): 1F29D
NUMINTEG:
        :: CK&DISPATCH0                          * 5662E
          BINT17 NUMINTEG~real,real              * 56638  real real
          2EXT NUMINTEG~unit,unit                * 56642  unit unit
          BINT26 NUMINTEG~1                      * 5664C  real name|local|algebraic
          EXTSYM NUMINTEG~1                      * 56656  unit name|local|algebraic
          SYMREAL NUMINTEG~1                     * 56660  name|local|algebraic real
          SYMEXT NUMINTEG~1                      * 5666A  name|local|algebraic unit
          SYMSYM NUMINTEG~1                      * 56674  name|local|algebraic name|local|algebraic
        ;                                        * 5667E

* refs (1): 56647
NUMINTEG~unit,unit:
        :: OVER UMCONV TRUE COLA OBJ_566BF       * 56683
        ;                                        * 566A1

* refs (1): 5663D
NUMINTEG~real,real:
        :: FALSE COLA OBJ_566BF                  * 566A6
        ;                                        * 566BA

* refs (2): 5669C 566B5
OBJ_566BF:
        :: DUPDUP OBJ_56FD1 BIND 2SWAP           * 566BF

* refs (1): 56B0F
%%SUM~1:
          :: CARCOMP DUP ID>LAM BINT1 DOBIND ; BINT0 SWAP EXPLODE * 566D8

* refs (1): 56B1E
%%SUM~2:
          ::                                     * 5670A

* meta1 meta2 -> meta1&meta2'
* refs (5): 5AB19 5B8E8 8386F 838B5 C0D69
>dvars:
            :: BEGIN #1-SWAP BINT10 GETLAMPAIR DROP ROTDROP UNROTOVER EQUAL * 5670F
              NOT?SWAPDROP psh1& #0=UNTIL DROP ; * 5673C
            IMPLODE symcomp ;                    * 56755
          ' '                                    * 56764

* refs (1): 56B32
%%SUM~3:
          :: BINT10 GETLAMPAIR DROPSWAPDROP SWAPDROP ; ' STOLAM 4ROLL ' * 5676E
          COMPEVAL ' OBJ_568AE Π'dv ITE          * 567A0
          :: 7ROLL CARCOMP 7UNROLL 8ROLL UMU> OVER 10UNROLL SWAPDROP DUP ' * 567B9
            Π'op STOLAM 7UNROLL ' UM>U 7UNROLL BINT8 ; * 567F0
          BINT6                                  * 56818
          ::N OBJ_5A952 2SWAP CALCINTEG ABND CK2NOLASTWD Π'nm OBJ_56872 Π'op * 5681D
          OBJ_56872 ABND '                       * 5684A

IERR:
          ID IERR XEQSTOID ;                     * 56859

* refs (2): 56840 5684A
OBJ_56872:
        :: DUPTYPEEXT? NOTcase DROP              * 56872
          UMU> SWAPDROP DUPUNROT UM* 3UNROLL UM* SWAP ; * 56886

* refs (1): 567AA
OBJ_568AE:
        :: CK&DISPATCH1                          * 568AE
          BINT14 OBJ_568D1                       * 568B8  unit
          BINT0 NOP                              * 568C2  any
        ;                                        * 568CC

* refs (1): 568BD
OBJ_568D1:
        :: Π'nm DUPTYPEEXT? ITE UMCONV           * 568D1
          :: DROPDUP ' Π'nm STOLAM ;             * 568EA
          CARCOMP ;                              * 56908

* refs (5): 56651 5665B 56665 5666F 56679
NUMINTEG~1:
        :: SYMCRUNCH1 SYMCRUNCH2 DEPTH BINT3 #> IT 2SWAP * 56912
          COLA xINTEGRAL                         * 5693A
        ;                                        * 56944

* sym sym sym ob -> symf
* refs (1): 1F30A
SYMSUM:
        ::                                       * 56949

* refs (2): 56A0B 56A51
OBJ_5694E:
          :: BINT1 nmetasyms symcomp 4ROLL symcomp ChkExpr1Name * 5694E

{'sumexpr,'sumvar}:
            {                                    * 56971

* refs (1): 569ED
Π'sumexpr:
              LAM 'sumexpr                       * 56976

* refs (1): 569DE
Π'sumvar:
              LAM 'sumvar }                      * 5698D
            BIND ;                               * 569A7
          :: sscknum2 OBJ_569D4 OBJ_56A9C ; ABND ; * 569B1

* refs (3): 569BB 56A42 56A92
OBJ_569D4:
        :: top& Π'sumvar OVER#2+UNROL #1+ Π'sumexpr SWAP#1+ PTR addt: ä ; * 569D4

* sym sym % ob -> symf
* refs (1): 1F2EC
SYM%SUM:
        :: OBJ_5694E                             * 56A06
          :: sncknum2 SYM%SUM~1 OBJ_56A9C ; ABND ; * 56A10

* refs (1): 56A1A
SYM%SUM~1:
        :: 3GETLAM ONECOLA OBJ_569D4 ;           * 56A33

* sym % sym ob -> symf
* refs (1): 1F2FB
%SYMSUM:
        :: OBJ_5694E                             * 56A4C
          :: nscknum2 %SYMSUM~1 OBJ_56A9C ; ABND ; * 56A56

* refs (1): 56A60
%SYMSUM~1:
        :: 3GETLAM BINT1 psh COLA OBJ_569D4      * 56A79
        ;                                        * 56A97

* refs (3): 569C0 56A1F 56A65
OBJ_56A9C:
        :: CK2NOLASTWD 1GETLAM 3UNROLL 2GETLAM ABND RDROPCOLA ä ; * 56A9C

* sym % % ob -> symf
* refs (1): 1F2DD
%%SUM:
        :: BINT1 nmetasyms 4ROLL symcomp ChkExpr1Name 4PICK 4PICK %> case * 56AC9

* 1...4 -> %0
4DROP%0:
          :: 4DROP %0_2A2B4 ;                    * 56AFB
          %%SUM~1 ZEROSWAP EXPLODE %%SUM~2 3UNROLL ' Π'fcn %%SUM~3 ABND ' * 56B0F
          Π'stop BINT3 DOBIND %0_2A2B4 BEGIN ?ATTNQUIT 3GETLAM COMPEVAL * 56B41
          CK1NOLASTWD DUPTEMPENV OBJ_546B1 x+ xNEXT ; * 56B69

* refs (14): 1AAD1 1AAF3 1AB15 1AB37 1AB59 2EB00 ...
* ob -> %0 (a second DROP%0; the derivative slot of constants)
DROP%0b:
        :: DROP %0_2A2B4 ;                       * 56B87

* refs (3): 86411 865C4 866B4
OBJ_56B9B:
        :: psh OBJ_56BEB top& OBJ_56C13 Cr x* ;  * 56B9B

* refs (3): 86196 86303 8639E
OBJ_56BC3:
        :: psh OBJ_56BEB top& OBJ_56C72 Cr x* ;  * 56BC3

* refs (26): 56BA5 56BCD 7DD03 7DD21 85EBC 85F0C ...
* Probably: derivatives: wrap the inner argument as d/d'dv(arg) for the chain rule, then ABND the 'dv environment
OBJ_56BEB:
        :: OBJ_56D01 ABND ;                      * 56BEB

* refs (6): 85EE4 85F66 85FCA 8602E 86713 86731
OBJ_56BFF:
        :: ABND SYMBN ;                          * 56BFF

* refs (1): 56BAF
OBJ_56C13:
        :: RAD? ?SEMI                            * 56C13
          DEG? ITE                               * 56C22

{PI,180,/,*}:
          { xPI %180 x/ x* }                     * 56C2C

{PI,200,/,*}:
          { xPI %200 x/ x* }                     * 56C4A
          INNERtop& ;                            * 56C68

* refs (2): 56BD7 862B3
OBJ_56C72:
        :: RAD? ?SEMI                            * 56C72
          DEG? ITE                               * 56C81

{180,PI,/,*}:
          { %180 xPI x/ x* }                     * 56C8B

{200,PI,/,*}:
          { %200 xPI x/ x* }                     * 56CA9
          INNERtop& ;                            * 56CC7

* refs (7): 57027 5704A 7DCFE 7DD1C 86074 8655B ...
OBJ_56CD1:
        :: OBJ_56CE5 BIND ;                      * 56CD1

* refs (1): 56CD6
OBJ_56CE5:
        { Π'dv }                                 * 56CE5

* refs (3): 567AF 56CEA 56FD6
Π'dv:
        LAM 'dv                                  * 56CF4

* refs (10): 56BF0 7DC1D 7DC5E 85F4D 85F70 85FB1 ...
OBJ_56D01:
        :: SYMBN 1GETSWAP 'xDER BINT3 ;          * 56D01

* refs (2): 1F6C7 86A33
OBJ_56D1F:
        :: 4ROLL CARCOMP NOTROMPcase OBJ_56D97   * 56D1F
          DUP OBJ_26F18 NOTcasedrop OBJ_56D97    * 56D38
          SWAP ROMPTR@ DROP infarg? SWAPDROP ?SKIP * 56D4C
          :: 4ROLLDROP ROT #1-UNROT ;            * 56D6A
          ROT #1-UNROT COLA_EVAL ;               * 56D83

* refs (2): 56D33 56D47
OBJ_56D97:
        :: DUP ROMPTR@NOT casedrop               * 56D97
          :: NOTROMPcase OBJ_56EDC               * 56DAB
            SETTYPEERR ;                         * 56DBA
          ROTSWAP 5ROLL OBJ_56FD1 BIND 2GETLAM OBJ_5DEF7 ARGNUMERR OBJ_56E96 * 56DC4
          2DROP OBJ_56E05 COLA SYMDERSTEP        * 56DEC
        ;                                        * 56E00

* refs (2): 56DF1 58ECC
OBJ_56E05:
        :: BINT2 #- pshzer 1GETLAM ZERO_DO larg CKSYMBN psh1& LOOP DROP * 56E05
          2GETLAM SWAPDROPDUP 1GETLAM #3+ NTHCOMPDROP 1GETLAM #2+UNROLL * 56E3C
          3GETLAM 1GETLAM #3+ UNROLL BINT3 1GETLAM #2+ SUBCOMP 1GETABND * 56E5F
          SPLITWHERE ;                           * 56E8C

* refs (1): 56DE7
OBJ_56E96:
        :: DROP 1GETLAM 3UNROLL 3GETLAM ABND SWAP NOTROMPcase OBJ_56EDC * 56E96
          ROMPTRDECOMP case OBJ_56EDC            * 56EC3
          SETTYPEERR ;                           * 56ED2

* refs (4): 54BA5 56DB5 56EBE 56ECD
OBJ_56EDC:
        :: 4ROLL OBJ_56FD1 BIND BINT2 #- dup pshzer 1GETLAM ZERO_DO larg * 56EDC
          SYMBN 3GETLAM SWAP 'xDER BINT3 ROTUntop& psh LOOP NDROP top& * 56F13
          2GETLAM nm=>st OBJ_56F90 $DER SWAP&$ $>ID symcomp 1GETABND #2* ' * 56F45
          xFCNAPPLY 4ROLL #3+ SYMBN ;            * 56F77

* refs (1): 56F4F
OBJ_56F90:
        :: OBJ_25F4E SWAPONE OVER                * 56F90
          :: delimcase                           * 56FA4
            :: tokESC SWAP&$ ;                   * 56FAE
          ;                                      * 56FC2
          4UNROLL3DROP ;                         * 56FC7

* refs (9): 25641 34E3F 566C9 56DCE 56EE6 58E81 ...
OBJ_56FD1:
        { Π'dv Π'op Π'nm }                       * 56FD1

* refs (4): 5683B 568D6 568F9 56FE0
Π'nm:
        LAM 'nm                                  * 56FEA

* refs (3): 567F0 56845 56FDB
Π'op:
        LAM 'op                                  * 56FF7
