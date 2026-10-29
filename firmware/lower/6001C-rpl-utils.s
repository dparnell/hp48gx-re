* HP 48GX ROM revision R, #6001C-#63028: Control structures and stack utilities
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: case ITE NOTcase 3PICK IT 3UNROLL SWAPDROP 4PICK 1GETLAM ?SEMI 2GETLAM 4ROLL
* Follows on from the previous file (at #6001C in the original ROM).
        RPL

* refs (1): 5FFEF
OBJ_6001C:
        :: nonopcase BINT0                       * 6001C
          REQcase xFCNAPPLY                      * 6002B
          :: OVER #3+PICK #2+ ; infarg? case     * 60035

over;pick(s+3);1+(s):
          :: OVER #3+PICK #1+ ;                  * 60058
          argum ;                                * 60071

* refs (3): 5FE1A 5FEA1 60161
OBJ_6007B:
        :: Π'ct Π'ep Π'pp ABND RDROP FALSE ;     * 6007B

* refs (10): 5B325 5B384 5B3E8 5B442 5B555 5B5AF ...
OBJ_600A3:
        :: #1+DUP #1+SWAP BEGIN OVER PICK OBJ_5FF73 ITE OBJ_6029A DROP * 600A3
          SWAP#1- DUPUNROT #2= UNTIL SWAPDROP#1- ; * 600D5

* refs (7): 28BB9 28BDC 5FE79 60A04 60A36 73042 ...
{}_600F3:
        { }                                      * 600F3

* refs (1): 5FE6F
OBJ_600FD:
        :: Π'ep OBJ_5FFD6 Π'ep OVER ' Π'ep STO SWAPOVER#- COLA OBJ_60254 * 600FD
        ;                                        * 60134

* refs (1): 5FE7E
OBJ_60139:
        :: Π'ep PICK                             * 60139
          :: idntlamcase DROP                    * 60148
            DROPRDROP COLA OBJ_6007B             * 60157
          ;                                      * 60166
          Π'ep DUP #1+ ' Π'ep STO BINT1 COLA OBJ_60254 * 6016B
        ;                                        * 60198

* refs (1): 5FE88
OBJ_6019D:
        :: 2DUPSWAP INCOMPDROP OBJ_601B6 ;       * 6019D

* refs (1): 601AC
OBJ_601B6:
        CON(5)  (*)+5                            * 601B6  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 601BB
        R0=A.F  A                                * 601C2
        GOSBVL  POP#                             * 601C8
        R1=A.F  A                                * 601CF
        GOSBVL  POP#                             * 601D5
        R2=A.F  A                                * 601DC
        GOSBVL  SAVPTR                           * 601E2
        D1=D1+  5                                * 601E9
        A=R1.F  A                                * 601EC
        GOSUB   SUB_60236                        * 601F2
        CD1EX                                    * 601F6
        A=A+C   A                                * 601F9
        D0=A                                     * 601FB
        D1=C                                     * 601FE
        A=R2.F  A                                * 60201
        GOSUB   SUB_60236                        * 60207
        CD1EX                                    * 6020B
        C=C+A   A                                * 6020E
        D1=C                                     * 60210
        C=R0.F  A                                * 60213
        GOSUBL  SUB_5FCA3                        * 60219
        GONC    L_60240                          * 6021F
        GOSBVL  GETPTR                           * 60222
        LC(5)   FALSE                            * 60229
        A=C     A                                * 60230
        PC=(A)                                   * 60232

* refs (3): 601F2 60207 60389
SUB_60236:
        C=A     A                                * 60236
        A=A+A   A                                * 60238
        A=A+A   A                                * 6023A
        A=A+C   A                                * 6023C
        RTN                                      * 6023E
L_60240:
        GOSBVL  GETPTR                           * 60240
        LC(5)   TRUE                             * 60247
        A=C     A                                * 6024E
        PC=(A)                                   * 60250
        RPL

* refs (2): 6012F 60193
OBJ_60254:
        :: TWO{}N Π'pp #1+ DUPUNROT #1+PICK STOLAM ' Π'pp STO OBJ_5FEFB * 60254
          UNTIL OBJ_5FE2E ;                      * 6028B

* refs (1): 600CB
OBJ_6029A:
        :: undo DROP INCOMPDROP 4PICK OBJ_602BD ; * 6029A

* refs (1): 602B3
OBJ_602BD:
        CON(5)  (*)+5                            * 602BD  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 602C2
        R0=A.F  A                                * 602C9
        GOSBVL  POP#                             * 602CF
        R1=A.F  A                                * 602D6
        GOSBVL  POP#                             * 602DC
        R2=A.F  A                                * 602E3
        GOSBVL  POP#                             * 602E9
        R3=A.F  A                                * 602F0
        C=R1.F  A                                * 602F6
        D=D-C   A                                * 602FC
        GONC    L_60328                          * 602FE
        GOSBVL  SAVPTR                           * 60301
        GOSBVL  GARBAGECOL                       * 60308  inline data follows
        GOSBVL  GETPTR                           * 6030F
        C=R1.F  A                                * 60316
        D=D-C   A                                * 6031C
        GONC    L_60328                          * 6031E
        GOVLNG  DOMEMERR                         * 60321
L_60328:
        D=D+1   A                                * 60328
        GOSBVL  SAVPTR                           * 6032A
        C=R1.F  A                                * 60331
        GOSUB   SUB_603BF                        * 60337
        R4=C.F  A                                * 6033B
        AD1EX                                    * 60341
        D0=A                                     * 60344
        A=A-C   A                                * 60347
        A=A+CON A,5                              * 60349
        D1=(5)  DSKTOP                           * 6034F
        DAT1=A  A                                * 60356
        D1=A                                     * 60359
        C=R0.F  A                                * 6035C
        C=C-1   A                                * 60362
        C=C-1   A                                * 60364
        GOSUB   SUB_603BF                        * 60366
        GOSBVL  MOVEDOWN                         * 6036A
        C=R0.F  A                                * 60371
        A=R2.F  A                                * 60377
        A=A-C   A                                * 6037D
        C=R3.F  A                                * 6037F
        A=A+1   A                                * 60385
        A=A+C   A                                * 60387
        GOSUB   SUB_60236                        * 60389
        CD0EX                                    * 6038D
        C=C+A   A                                * 60390
        D0=C                                     * 60392
        C=R4.F  A                                * 60395
        GOSBVL  MOVEDOWN                         * 6039B
        C=R3.F  A                                * 603A2
        A=R1.F  A                                * 603A8
        A=A+C   A                                * 603AE
        A=A-1   A                                * 603B0
        R0=A.F  A                                * 603B2
        GOVLNG  PUSH#LOOP                        * 603B8

* refs (2): 60337 60366
SUB_603BF:
        A=C     A                                * 603BF
        C=C+C   A                                * 603C1
        C=C+C   A                                * 603C3
        C=C+A   A                                * 603C5
        RTN                                      * 603C7
        RPL

* refs (2): 60B6C 60DA1
OBJ_603C9:
        :: BEGIN Π'sur Π'cts #=case              * 603C9

* refs (1): 6068F
match'(ex,li)~4:
          :: NDROP RDROP ;                       * 603E2
          Π'sun OVER #<case                      * 603F6

* refs (3): 60455 604F5 60590
OBJ_60405:
          :: OBJ_60487 Π'sur OBJ_6045F Π'sun AGAIN ; * 60405
          DUPTWO Π'sur DUPTEMPENV OBJ_5FDB7 case OBJ_604AF * 60428
          3DROP ABND COLA OBJ_60405              * 60446
        ;                                        * 6045A

* refs (2): 60414 606D0
OBJ_6045F:
        :: 'R DUP undo DROP #1+SWAP STOLAM ;     * 6045F

* refs (1): 6040A
OBJ_60487:
        :: 'R DUP undo DROP #1-SWAP STOLAM ;     * 60487

* refs (1): 60441
OBJ_604AF:
        :: ROTROT2DROP Π'sur #- ' Π'mlg STO OBJ_60E3C Π'ckd EVAL NOTcase * 604AF

* refs (1): 60522
OBJ_604E6:
          :: ABND COLA OBJ_60405                 * 604E6
          ;                                      * 604FA
          OBJ_60E3C Π'rhs EXPLODE OBJ_600A3 Π'sur Π'mlg OBJ_60DB5 OBJ_604E6 * 604FF
          DUP 4PICK SWAP#- ' Π'mlg STO OBJ_5ED82 get1 Π'mlg #+OVER #2+UNROLL * 60527
          BINT0 ' Π'sun STO TRUE ' Π'reg STO ABND COLA OBJ_60405 * 6055E
        ;                                        * 60595

* refs (1): 60A90
match'(ex,li)~5:
        :: Π'prd EXPLODE OBJ_600A3 IMPLODE symcomp ' Π'prp STO DUPTEMPENV * 6059A
          DUP#2+PICK OVER#+ #2+ ' NULLLAM CACHE Π'prp COMPEVAL CK1NOLASTWD ' * 605CC
          Π'prp STO ' NULLLAM DUMP ABND ABND DROP Π'prp DUPTYPEREAL? ITE * 605FE
          %0<> DROPFALSE                         * 60635
        ;                                        * 6063F

* refs (1): 60B71
match'(ex,li)~1:
        :: Π'sur Π'cts #1+ ' Π'sur STOLAM #1+ ' Π'cts STOLAM BEGIN Π'sur * 60644
          Π'cts #=case match'(ex,li)~4           * 60685
          DUPTWO Π'sur DUPTEMPENV OBJ_5FDB7 case match'(ex,li)~2 * 60694
          3DROP ABND COLA OBJ_606CB              * 606B2
        ;                                        * 606C6

* refs (2): 606C1 6072A
OBJ_606CB:
        :: OBJ_6045F Π'sur AGAIN ;               * 606CB

* refs (1): 606AD
match'(ex,li)~2:
        :: ROTROT2DROP Π'sur #- ' Π'mlg STOLAM OBJ_60E3C Π'ckd EVAL NOTcase * 606E4

* refs (1): 60757
OBJ_6071B:
          :: ABND COLA OBJ_606CB                 * 6071B
          ;                                      * 6072F
          OBJ_60E3C Π'rhs EXPLODE OBJ_600A3 Π'sur Π'mlg OBJ_60DB5 OBJ_6071B * 60734
          2DUP#+ ' Π'sur STOLAM DUP 4PICKSWAP #- ' Π'mlg STOLAM OBJ_5ED82 * 6075C
          get1 Π'mlg #+OVER #2+UNROLL Π'sur Π'mlg #+ ' Π'sur STOLAM Π'cts * 60793
          Π'mlg #+ ' Π'cts STOLAM TRUE ' Π'reg STOLAM ABND AGAIN ; * 607CA

* refs (4): 608A6 608B0 60C36 60C40
OBJ_60806:
        {                                        * 60806

* refs (6): 6057C 607ED 608D8 60B7B 60C98 60DAB
Π'reg:
          LAM 'reg                               * 6080B

* refs (17): 603D3 6040F 6042D 604B9 60513 60649 ...
Π'sur:
          LAM 'sur                               * 6081A

* refs (8): 603D8 6064E 60671 60685 607C5 607D9 ...
Π'cts:
          LAM 'cts                               * 60829

* refs (5): 603F6 60419 60568 6095A 60D34
Π'sun:
          LAM 'sun                               * 60838

* refs (12): 604C8 60518 6053B 6054F 606FD 6074D ...
Π'mlg:
          LAM 'mlg                               * 60847

* refs (4): 604D7 6070C 608F6 60AE5
Π'ckd:
          LAM 'ckd                               * 60856

* refs (3): 6059F 608E7 60AFE
Π'prd:
          LAM 'prd                               * 60865

* refs (4): 605BD 605EA 605FE 60626
Π'prp:
          LAM 'prp                               * 60874

* refs (7): 5B52D 5B5E1 5B640 60504 60739 60905 ...
Π'rhs:
          LAM 'rhs }                             * 60883

* refs (1): 60A9F
match'(ex,li)~6:
        :: ?SKIP TrueTrue                        * 60897
          OBJ_60806 INCOMPDROP OBJ_60806 BIND match'(ex,li)~7 ; * 608A6

* refs (1): 608BA
match'(ex,li)~7:
        ::                                       * 608C4

* refs (1): 60D02
OBJ_608C9:
          :: FALSE ' Π'reg STO ' Π'prd STO ' Π'ckd STO ' Π'rhs STO ?ROMPTR> * 608C9
            EXPLODE ;                            * 60914
          DUP#2+PICK OVER#+ #2+ ' Π'sur STO DUP#2+ ' Π'cts STO BINT1 ' Π'sun * 6091E
          STO BINT0 ' Π'mlg STO ;                * 6095F

* refs (1): 60AA4
match'(ex,li)~8:
        :: dup pshzer BEGIN #1-SWAP OBJ_5FF73 ITE psh1& DROP * 6097D
          #0=UNTIL DROP ;                        * 609AA

* refs (2): 60AE0 60B08
match'(ex,li)~9:
        :: BEGIN pullrev OBJ_5FF73 ITE match'(ex,li)~10 DROP * 609B9
          #0=UNTIL DROP ;                        * 609DC

* refs (1): 609D2
match'(ex,li)~10:
        :: DUP FIRST@LAM NOTcase SETNONEXTERR    * 609EB
          {}_600F3 EQ caseDROP OVER#0=           * 60A04
          caseDROP OVER                          * 60A18
          #3+ OBJ_5F5AD ITE                      * 60A22
          :: {}_600F3 SWAP STOLAM ; DROP         * 60A31
        ;                                        * 60A4F

* refs (1): 60B5D
match'(ex,li)~3:
        :: DUP BINT4 BINT3 RPITE get1 EXPLODE    * 60A54
          psh DROPDUP IT                         * 60A77
          :: ' match'(ex,li)~5 3UNROLL ;         * 60A86
          match'(ex,li)~6 match'(ex,li)~8 PTR addt: NULLLAM NULL{} OVER * 60A9F
          NDUPN psh get1 DROP DOBIND Π'rhs EXPLODE match'(ex,li)~9 Π'ckd * 60ABD
          TRUE EQ ?SKIP                          * 60AEA
          :: Π'prd EXPLODE match'(ex,li)~9 ;     * 60AF9
        ;                                        * 60B12

* refs (2): 1FABF 1FAD3
match'(ex,li):
        :: INNERCOMP DUP #2= OVER #3= OR ?SKIP SETSIZEERR * 60B17
          DUP dvarlsBIND nmetasyms 1GETABND #3= match'(ex,li)~3 'R ITE * 60B44
          OBJ_603C9 match'(ex,li)~1              * 60B6C
          ABND Π'reg ITE %1 %0_2A2B4             * 60B76
          ABND pshm1 IMPLODE SWAPDROPSWAP ;      * 60B8F

        :: OBJ_5FF73 NOTcase EQUALNOTcase        * 60BA8
          2DROP                                  * 60BBC
          COLASKIP ;                             * 60BC1

* refs (1): 5B357
OBJ_60BCB:
        :: BINT5 NEXTCOMPOB DROP ?ROMPTR@        * 60BCB

{'patternls,'compos,'varls}:
          {                                      * 60BE4

Π'patternls:
            LAM 'patternls                       * 60BE9

Π'compos:
            LAM 'compos                          * 60C04

Π'varls:
            LAM 'varls }                         * 60C19
          BIND OBJ_60806 INCOMPDROP OBJ_60806 BIND BEGIN * 60C31

Π'patternls_60C4F:
          LAM 'patternls                         * 60C4F

Π'compos_60C6A:
          LAM 'compos NEXTCOMPOB ITE OBJ_60CBB DROPTRUE * 60C6A
          UNTIL Π'reg ABND ABND NOT ?SKIP RDROP  * 60C93
        ;                                        * 60CB6

* refs (1): 60C89
OBJ_60CBB:
        :: SWAP '                                * 60CBB

Π'compos_60CCA:
          LAM 'compos STOLAM SWAPDROP ?ROMPTR@ INNERCOMP #2= IT TrueTrue * 60CCA
          OBJ_608C9 DUP#2+PICK 2DUPSWAP #< casedrop * 60D02

dropB;false_60D1B:
          :: NDROP FALSE ;                       * 60D1B
          ' Π'sun STOLAM DUP#2+ DUP ' Π'cts STO #1+ ' Π'sur STOLAM BINT0 ' * 60D2F
          Π'mlg STO                              * 60D75

Π'varls_60D7F:
          LAM 'varls INNERCOMP #2/ DOBIND OBJ_603C9 ABND Π'reg ; * 60D7F

* refs (2): 6051D 60752
OBJ_60DB5:
        :: DUPONE #>case SKIP                    * 60DB5
          4PICK idntlamcase                      * 60DC9
          :: drop;dq SKIP ;                      * 60DD3
          DROP 3PICK #4+PICK #3+ 3PICK #=case SKIP * 60DE7
          3PICK3PICK #+ #3+ OBJ_5F5AD NOTcase SKIP * 60E0A
          2DROP NDROP COLACOLA ;                 * 60E28

* refs (4): 604D2 604FF 60707 60734
OBJ_60E3C:
        :: 'R DUP EVAL DUPTYPEROMP? NOTcase SWAPDROP * 60E3C
          ?ROMPTR@ DUPROT STOLAM ;               * 60E5F

* refs (20): 5B942 5BA4B 5BB7C 824CE 82664 82740 ...
* The pattern variables &1..&4 of an integration table, unbound: { NULL{} NULL{} NULL{} NULL{} '&1 '&2 '&3 '&4 }
IntgPatVars:
        { NULL{} NULL{} NULL{} NULL{}            * 60E73

* refs (162): 5B50A 5B951 5B979 5B9A1 5B9D3 5B9E2 ...
Π&1:
          LAM &1                                 * 60E8C

* refs (10): 5B9A6 5BA00 5BA14 5BA5F 5BAA0 5BAB9 ...
Π&2:
          LAM &2                                 * 60E97

Π&3:
          LAM &3                                 * 60EA2

Π&4:
          LAM &4 }                               * 60EAD

* ->
* refs (37): 14627 148C5 148CF 149E2 1510B 15115 ...
RSWAP:
        CON(5)  (*)+5                            * 60EBD  primitive code object
        ASSEMBLE
        C=B     A                                * 60EC2
        CD0EX                                    * 60EC4
        RSTK=C                                   * 60EC7
        D0=D0-  5                                * 60EC9
        A=DAT0  A                                * 60ECC
        D0=D0-  5                                * 60ECF
        C=DAT0  A                                * 60ED2
        DAT0=A  A                                * 60ED5
        D0=D0+  5                                * 60ED8
        DAT0=C  A                                * 60EDB
        C=RSTK                                   * 60EDE
        D0=C                                     * 60EE0
        GOTO    L_60F91                          * 60EE3

* 1 2 3 -> 2 1 3
* refs (103): 0909D 15559 173C9 1773E 1788D 180AB ...
ROTSWAP:
        CON(5)  (*)+5                            * 60EE7  primitive code object
        D1=D1+  5                                * 60EEC
        A=DAT1  A                                * 60EEF
        D1=D1+  5                                * 60EF2
        C=DAT1  A                                * 60EF5
        DAT1=A  A                                * 60EF8
        D1=D1-  5                                * 60EFB
        DAT1=C  A                                * 60EFE
L_60F01:
        D1=D1-  5                                * 60F01
        A=DAT0  A                                * 60F04
        D0=D0+  5                                * 60F07
        PC=(A)                                   * 60F0A

* 1 2 3 -> 3 2
* refs (28): 0F0C5 1D139 1D24E 1D276 1D834 205F1 ...
ROTDROPSWAP:
        CON(5)  (*)+5                            * 60F0E  primitive code object
        A=DAT1  A                                * 60F13
        D1=D1+  10                               * 60F16
        DAT1=A  A                                * 60F19
        D=D+1   A                                * 60F1C
        GONC    L_60F01                          * 60F1E  always taken

* 1 2 3 -> 2 3
* refs (123): 08FEE 092C1 09352 0F37B 172AC 17793 ...
ROTDROP:
        CON(5)  (*)+5                            * 60F21  primitive code object
        D=D+1   A                                * 60F26
        C=DAT1  10                               * 60F28
        D1=D1+  5                                * 60F2C
        GOTO    L_6139A                          * 60F2F

* 1 2 3 -> 3 2 1
* refs (74): 0522E 05309 0983B 1024D 15DDD 1A279 ...
SWAPROT:
        CON(5)  (*)+5                            * 60F33  primitive code object
        A=DAT1  A                                * 60F38
        D1=D1+  10                               * 60F3B
        C=DAT1  A                                * 60F3E
        DAT1=A  A                                * 60F41
        D1=D1-  10                               * 60F44
        GOTO    L_610ED                          * 60F47

* 1 2 3 ->
* refs (98): 0C227 1DA7A 200D8 21579 218C1 28D80 ...
3DROP:
        CON(5)  (*)+5                            * 60F4B  primitive code object
        GOTO    3DROP~1                          * 60F50

* 1..7 ->
* refs (8): 3EFAA 4547A 454CA 4559C 455B5 91A3B ...
7DROP:
        CON(5)  (*)+5                            * 60F54  primitive code object
        D1=D1+  15                               * 60F59
        D=D+1   A                                * 60F5C
L_60F5E:
        D=D+1   A                                * 60F5E
L_60F60:
        D=D+1   A                                * 60F60
        GOTO    4DropLoop                        * 60F62

* 1..6 ->
* refs (9): 2248C 4CD25 4CD48 689CC 68B25 68E81 ...
6DROP:
        CON(5)  (*)+5                            * 60F66  primitive code object
        D1=D1+  10                               * 60F6B
        GOTO    L_60F5E                          * 60F6E

* 1..5 ->
* refs (25): 17671 17784 239D4 285BC 3037F 45637 ...
5DROP:
        CON(5)  (*)+5                            * 60F72  primitive code object
        D1=D1+  5                                * 60F77
        GOTO    L_60F60                          * 60F7A

* 1..4 ->
* refs (48): 1002E 1039C 21898 246F9 2471C 274BD ...
4DROP:
        CON(5)  (*)+5                            * 60F7E  primitive code object

* Pop 4, Loop
* refs (3): 3168B 60F62 60F7E
4DropLoop:
        D1=D1+  5                                * 60F83
        D=D+1   A                                * 60F86
3DROP~1:
        D1=D1+  15                               * 60F88
L_60F8B:
        D=D+1   A                                * 60F8B
L_60F8D:
        D=D+1   A                                * 60F8D
        D=D+1   A                                * 60F8F
L_60F91:
        A=DAT0  A                                * 60F91
        D0=D0+  5                                * 60F94
        PC=(A)                                   * 60F97

* 1 2 -> 2
* refs (403): 08C7C 08C9A 0934D 097D9 09822 0F475 ...
SWAPDROP:
        CON(5)  (*)+5                            * 60F9B  primitive code object
        A=DAT1  A                                * 60FA0
        D1=D1+  5                                * 60FA3
        D=D+1   A                                * 60FA6
        GOTO    L_6102F                          * 60FA8

* 1 2 3 -> 3 1 2
* refs (438): 08F94 08FF3 09357 093E3 0EF6D 0F457 ...
3UNROLL:
        CON(5)  (*)+5                            * 60FAC  primitive code object
        A=DAT1  A                                * 60FB1
        D1=D1+  5                                * 60FB4
        GOTO    L_6138D                          * 60FB7

* 1 2 3 4 -> 2 3 4 1
* refs (286): 090A2 0B67E 0C654 0C6EF 0E200 126EE ...
4ROLL:
        CON(5)  (*)+5                            * 60FBB  primitive code object
        A=DAT1  15                               * 60FC0
        D1=D1+  15                               * 60FC4
        C=DAT1  A                                * 60FC7
        D1=D1-  10                               * 60FCA
        DAT1=A  15                               * 60FCD
        D1=D1-  5                                * 60FD1
        GOTO    L_610ED                          * 60FD4

* 1 2 3 4 5 -> 2 3 4 5 1
* refs (215): 0F385 103F1 103F6 1054A 1054F 126F8 ...
5ROLL:
        CON(5)  (*)+5                            * 60FD8  primitive code object
        C=DAT1  A                                * 60FDD
        RSTK=C                                   * 60FE0
        D1=D1+  5                                * 60FE2
        C=DAT1  15                               * 60FE5
        D1=D1+  15                               * 60FE9
        A=DAT1  A                                * 60FEC
        D1=D1-  10                               * 60FEF
        DAT1=C  15                               * 60FF2
        D1=D1-  5                                * 60FF6
        C=RSTK                                   * 60FF9
        DAT1=C  A                                * 60FFB
        GOTO    L_6102C                          * 60FFE

* 1..6 -> 2..6 1
* refs (105): 0AAD0 0F6CF 16FB1 174D2 1756D 1757C ...
6ROLL:
        CON(5)  (*)+5                            * 61002  primitive code object
        C=DAT1  10                               * 61007
        R0=C                                     * 6100B
        D1=D1+  10                               * 6100E
        C=DAT1  15                               * 61011
        D1=D1+  15                               * 61015
        A=DAT1  A                                * 61018
        D1=D1-  10                               * 6101B
        DAT1=C  15                               * 6101E
        D1=D1-  10                               * 61022
        C=R0                                     * 61025
        DAT1=C  10                               * 61028
L_6102C:
        D1=D1-  5                                * 6102C
L_6102F:
        DAT1=A  A                                * 6102F
        A=DAT0  A                                * 61032
        D0=D0+  5                                * 61035
        PC=(A)                                   * 61038

* 1..8 -> 2..8 1
* refs (38): 29543 296A6 46080 484A9 4F62E 51053 ...
8ROLL:
        CON(5)  (*)+5                            * 6103C  primitive code object
        C=DAT1  15                               * 61041
        R0=C                                     * 61045
        D1=D1+  15                               * 61048
        C=DAT1  15                               * 6104B
        R1=C                                     * 6104F
        D1=D1+  15                               * 61052
        C=DAT1  A                                * 61055
        D1=D1+  5                                * 61058
        A=DAT1  A                                * 6105B
        DAT1=C  A                                * 6105E
        D1=D1-  15                               * 61061
        C=R1                                     * 61064
        GOTO    L_61087                          * 61067

* 1..7 -> 2..7 1
* refs (51): 16CA2 17581 2247D 25B6F 25B74 284D2 ...
7ROLL:
        CON(5)  (*)+5                            * 6106B  primitive code object
        C=DAT1  15                               * 61070
        R0=C                                     * 61074
        D1=D1+  15                               * 61077
        C=DAT1  15                               * 6107A
        D1=D1+  15                               * 6107E
        A=DAT1  A                                * 61081
        D1=D1-  10                               * 61084
L_61087:
        DAT1=C  15                               * 61087
        D1=D1-  15                               * 6108B
        C=R0                                     * 6108E
        DAT1=C  15                               * 61091
        GOTO    L_6102C                          * 61095

* 1 2 3 -> 3 1 2 3
* refs (15): 08FA3 26167 2C8F0 3B622 4360D 4FD68 ...
DUP4UNROLL:
        CON(5)  DupAndThen                       * 61099  code object: the address of its machine code

* 1 2 3 4 -> 4 1 2 3
* refs (169): 0DEC0 0E5FE 0E603 0E612 0E621 0E6F7 ...
4UNROLL:
        CON(5)  (*)+5                            * 6109E  primitive code object
        A=DAT1  A                                * 610A3
        D1=D1+  5                                * 610A6
        C=DAT1  15                               * 610A9
        D1=D1+  10                               * 610AD
        DAT1=A  A                                * 610B0
        D1=D1-  15                               * 610B3
        DAT1=C  15                               * 610B6
        A=DAT0  A                                * 610BA
        D0=D0+  5                                * 610BD
        PC=(A)                                   * 610C0

* 1 2 3 4 5 -> 5 1 2 3 4
* refs (129): 08FB2 08FB7 090AC 092A3 092A8 0F38F ...
5UNROLL:
        CON(5)  (*)+5                            * 610C4  primitive code object
        A=DAT1  A                                * 610C9
        D1=D1+  5                                * 610CC
        C=DAT1  A                                * 610CF
        RSTK=C                                   * 610D2
        D1=D1+  5                                * 610D4
        C=DAT1  15                               * 610D7
        D1=D1+  10                               * 610DB
        DAT1=A  A                                * 610DE
        D1=D1-  15                               * 610E1
        DAT1=C  15                               * 610E4
        D1=D1-  5                                * 610E8
        C=RSTK                                   * 610EB
L_610ED:
        DAT1=C  A                                * 610ED
        A=DAT0  A                                * 610F0
        D0=D0+  5                                * 610F3
        PC=(A)                                   * 610F6

* 1..6 -> 6 1..5
* refs (39): 1777F 221AE 221B3 251F1 285B7 28C86 ...
6UNROLL:
        CON(5)  (*)+5                            * 610FA  primitive code object
        A=DAT1  A                                * 610FF
        D1=D1+  5                                * 61102
        C=DAT1  10                               * 61105
        R0=C                                     * 61109
        D1=D1+  10                               * 6110C
        C=DAT1  15                               * 6110F
        D1=D1+  10                               * 61113
        DAT1=A  A                                * 61116
        D1=D1-  15                               * 61119
        DAT1=C  15                               * 6111C
        D1=D1-  10                               * 61120
        C=R0                                     * 61123
        GOTO    L_6139A                          * 61126

* 1 2 3 -> 3
* refs (96): 098B3 16135 1620C 16289 16C1F 16EE9 ...
ROTROT2DROP:
        CON(5)  (*)+5                            * 6112A  primitive code object
        A=DAT1  A                                * 6112F
        D1=D1+  10                               * 61132
        DAT1=A  A                                * 61135
        GOTO    L_60F8D                          * 61138

* 1 2 3 4 -> 4
* refs (18): 0B606 27FD0 2F2ED 406BB 406F2 49673 ...
4UNROLL3DROP:
        CON(5)  (*)+5                            * 6113C  primitive code object
        A=DAT1  A                                * 61141
        D1=D1+  15                               * 61144
        DAT1=A  A                                * 61147
        GOTO    L_60F8B                          * 6114A

* ->
* refs (32): 146EF 1492E 14B9F 14DD7 1779D 17ECA ...
2RDROP:
        CON(5)  (*)+5                            * 6114E  primitive code object
        LC(5)   portnotaverr                     * 61153
        B=B-C   A                                * 6115A
        GOTO    L_60F8D                          * 6115C

* ->
* refs (9): 14D78 17CE7 5CE3D 5CE74 5CEAB 5CEE2 ...
3RDROP:
        CON(5)  (*)+5                            * 61160  primitive code object
        LC(5)   #0000F                           * 61165
        B=B-C   A                                * 6116C
        GOTO    L_60F8B                          * 6116E

* 1..n-m #n #m -> 1..n-m 1
* refs (1): 67C7B
#-PICK:
        CON(5)  (*)+5                            * 61172  primitive code object
        GOSBVL  POP2#                            * 61177
        A=A-C   A                                * 6117E
        GOTO    L_61192                          * 61180

* 1..n+m #n #m -> 1..n+m 1
* refs (2): 104E1 8BB0F
#+PICK:
        CON(5)  (*)+5                            * 61184  primitive code object
        GOSBVL  POP2#                            * 61189
        A=A+C   A                                * 61190
L_61192:
        D1=D1-  5                                * 61192
        D=D-1   A                                * 61195
        CD1EX                                    * 61197
        GOTO    L_611CB                          * 6119A

* ob&meta -> ob&meta ob
* refs (12): 318C2 59039 59F5F 5AD2B 5B19A 5FFEA ...
DUP#1+PICK:
        CON(5)  DupAndThen                       * 6119E  code object: the address of its machine code

* 1..n #n-1 -> 1..n 1
* refs (7): 5AF83 5FE10 6026D 6AEDD 6C2B2 6C4AB ...
#1+PICK:
        CON(5)  (*)+5                            * 611A3  primitive code object
        GOSUB   SUB_611B0                        * 611A8
        GOTO    L_611C9                          * 611AC

* refs (5): 611A8 611C3 611D7 611E6 618AD
SUB_611B0:
        C=DAT1  A                                * 611B0
        CD1EX                                    * 611B3
        D1=D1+  5                                * 611B6
        A=DAT1  A                                * 611B9
        RTN                                      * 611BC

* 1..n #n-2 -> 1..n 1
* refs (18): 10838 4CAE6 584BC 5852F 5AE02 5B0AA ...
#2+PICK:
        CON(5)  (*)+5                            * 611BE  primitive code object
        GOSUB   SUB_611B0                        * 611C3
L_611C7:
        A=A+1   A                                * 611C7
L_611C9:
        A=A+1   A                                * 611C9
L_611CB:
        GOVLNG  L_032F3                          * 611CB

* 1..n #n-3 -> 1..n 1
* refs (17): 10B03 29674 5584B 57694 584E4 584EE ...
#3+PICK:
        CON(5)  (*)+5                            * 611D2  primitive code object
        GOSUB   SUB_611B0                        * 611D7
        A=A+1   A                                * 611DB
        GOTO    L_611C7                          * 611DD

* 1..n #n-4 -> 1..n 1
* refs (4): 5B1B8 5F620 60DF1 D1DE1
#4+PICK:
        CON(5)  (*)+5                            * 611E1  primitive code object
        GOSUB   SUB_611B0                        * 611E6
        A=A+1   A                                * 611EA
        A=A+1   A                                * 611EC
        GOTO    L_611C7                          * 611EE
L_611F2:
        GOSUB   SafGarbD-1~jump                  * 611F2
        GONC    L_61208                          * 611F6  always taken

* 1 2 -> 1 2 2 1
* refs (29): 3F40B 406B1 40EB5 43BC1 45D43 46E96 ...
2DUPSWAP:
        CON(5)  DupAndThen                       * 611F9  code object: the address of its machine code

* 1 2 3 -> 1 2 3 1
* refs (471): 09868 098A4 0F380 0F706 103D3 10469 ...
3PICK:
        CON(5)  (*)+5                            * 611FE  primitive code object
        D=D-1   A                                * 61203
        GOC     L_611F2                          * 61205
L_61208:
        D1=D1+  10                               * 61208
        A=DAT1  A                                * 6120B
        D1=D1-  15                               * 6120E
        GOTO    L_6102F                          * 61211
L_61215:
        GOSUB   SafGarbD-1~jump                  * 61215
        GONC    L_61226                          * 61219  always taken

* 1 2 3 4 -> 1 2 3 4 1
* refs (396): 0F6CA 10347 10635 10649 13B74 1487F ...
4PICK:
        CON(5)  (*)+5                            * 6121C  primitive code object
        D=D-1   A                                * 61221
        GOC     L_61215                          * 61223
L_61226:
        D1=D1+  15                               * 61226
        A=DAT1  A                                * 61229
        D1=D1-  15                               * 6122C
        GOTO    L_6102C                          * 6122F
L_61233:
        GOSUB   SafGarbD-1~jump                  * 61233
        GONC    L_61244                          * 61237  always taken

* 1 2 3 4 5 -> 1 2 3 4 5 1
* refs (246): 103BA 103CE 104A0 10513 10527 10559 ...
5PICK:
        CON(5)  (*)+5                            * 6123A  primitive code object
        D=D-1   A                                * 6123F
        GOC     L_61233                          * 61241
L_61244:
        D1=D1+  15                               * 61244
        D1=D1+  5                                * 61247
        A=DAT1  A                                * 6124A
        D1=D1-  15                               * 6124D
        D1=D1-  10                               * 61250
        GOTO    L_6102F                          * 61253
L_61257:
        GOSUB   SafGarbD-1~jump                  * 61257
        GONC    L_61268                          * 6125B  always taken

* 1..6 -> 1..6 1
* refs (179): 1037E 104D7 10626 16D45 1710D 17658 ...
6PICK:
        CON(5)  (*)+5                            * 6125E  primitive code object
        D=D-1   A                                * 61263
        GOC     L_61257                          * 61265
L_61268:
        D1=D1+  15                               * 61268
        D1=D1+  10                               * 6126B
        A=DAT1  A                                * 6126E
        D1=D1-  15                               * 61271
        D1=D1-  15                               * 61274
        GOTO    L_6102F                          * 61277
L_6127B:
        GOSUB   SafGarbD-1~jump                  * 6127B
        GONC    L_6128C                          * 6127F  always taken

* 1..7 -> 1..7 1
* refs (104): 104E6 33913 33F2A 3653E 3698A 453CB ...
7PICK:
        CON(5)  (*)+5                            * 61282  primitive code object
        D=D-1   A                                * 61287
        GOC     L_6127B                          * 61289
L_6128C:
        D1=D1+  15                               * 6128C
        D1=D1+  15                               * 6128F
        A=DAT1  A                                * 61292
        D1=D1-  15                               * 61295
        D1=D1-  15                               * 61298
        D1=D1-  5                                * 6129B
        GOTO    L_6102F                          * 6129E
L_612A2:
        GOSUB   SafGarbD-1~jump                  * 612A2
        GONC    L_612B3                          * 612A6  always taken

* 1..8 -> 1..8 1
* refs (83): 1760D 17743 29534 36561 45344 4AD1F ...
8PICK:
        CON(5)  (*)+5                            * 612A9  primitive code object
        D=D-1   A                                * 612AE
        GOC     L_612A2                          * 612B0
L_612B3:
        D1=D1+  15                               * 612B3
        D1=D1+  15                               * 612B6
        D1=D1+  5                                * 612B9
        A=DAT1  A                                * 612BC
        D1=D1-  15                               * 612BF
        D1=D1-  15                               * 612C2
        D1=D1-  10                               * 612C5
        GOTO    L_6102F                          * 612C8

* 1..n-m #n #m -> 2..n-m 1
* refs (5): 1042D 1043C 10608 10662 106A8
#-ROLL:
        CON(5)  (*)+5                            * 612CC  primitive code object
        GOSBVL  POP2#                            * 612D1
        A=A-C   A                                * 612D8
        GOTO    L_612EC                          * 612DA

* 1..n+m #n #m -> 2..n+m 1
* refs (4): 1061C 1063F 106B7 10AEF
#+ROLL:
        CON(5)  (*)+5                            * 612DE  primitive code object
        GOSBVL  POP2#                            * 612E3
        A=A+C   A                                * 612EA
L_612EC:
        GOVLNG  L_03330                          * 612EC

* ob 1..n #n -> 1..n ob
* refs (7): 05318 0E49B 20E66 24221 39D74 4CB18 ...
#1+ROLL:
        CON(5)  (*)+5                            * 612F3  primitive code object
        GOSBVL  POP#                             * 612F8
        A=A+1   A                                * 612FF
        GOTO    L_612EC                          * 61301

* ob meta -> meta ob
* refs (34): 05238 05242 0524C 052DA 05322 0982C ...
get1:
        CON(5)  (*)+5                            * 61305  primitive code object
        GOSUBL  SUB_62278                        * 6130A
        A=A+1   A                                * 61310
        A=A+1   A                                * 61312
        GOTO    L_612EC                          * 61314

* a b 1..n #n -> b 1..n a
* refs (4): 1DC23 32034 41AD8 9F616
#2+ROLL:
        CON(5)  (*)+5                            * 61318  primitive code object
        GOSBVL  POP#                             * 6131D
        A=A+1   A                                * 61324
        A=A+1   A                                * 61326
        GOTO    L_612EC                          * 61328

* 1..n-m #n #m -> n-m 1..n+m-1
* refs (4): 1041E 10595 105B8 10671
#-UNROLL:
        CON(5)  (*)+5                            * 6132C  primitive code object
        GOSBVL  POP2#                            * 61331
        A=A-C   A                                * 61338
        GOTO    L_6134C                          * 6133A

* 1..n+m #n #m -> n+m 1..n+m-1
* refs (3): 10630 106CB 10B12
#+UNROLL:
        CON(5)  (*)+5                            * 6133E  primitive code object
        GOSBVL  POP2#                            * 61343
        A=A+C   A                                * 6134A
L_6134C:
        GOVLNG  L_033A9                          * 6134C

* ob 1..n #n -> n ob 1..n-1
* refs (4): 3203E 4CB36 68C29 B88F0
#1+UNROLL:
        CON(5)  (*)+5                            * 61353  primitive code object
        GOSBVL  POP#                             * 61358
        A=A+1   A                                * 6135F
        GOTO    L_6134C                          * 61361

* a b 1..n #n -> n a b 1..n-1
* refs (16): 10132 1064E 1DC41 282AA 54846 56E5A ...
#2+UNROLL:
        CON(5)  (*)+5                            * 61365  primitive code object
        GOSBVL  POP#                             * 6136A
        A=A+1   A                                * 61371
        A=A+1   A                                * 61373
        GOTO    L_6134C                          * 61375
L_61379:
        GOSUB   SafGarbD-1~jump                  * 61379
        GONC    L_6138A                          * 6137D  always taken

* 1 2 -> 2 1 2
* refs (151): 08E38 0F566 10128 110B3 148D4 14B2C ...
DUPUNROT:
        CON(5)  (*)+5                            * 61380  primitive code object
        D=D-1   A                                * 61385
        GOC     L_61379                          * 61387
L_6138A:
        A=DAT1  A                                * 6138A
L_6138D:
        C=DAT1  10                               * 6138D
        D1=D1+  5                                * 61391
        DAT1=A  A                                * 61394
        D1=D1-  10                               * 61397
L_6139A:
        DAT1=C  10                               * 6139A
        A=DAT0  A                                * 6139E
        D0=D0+  5                                * 613A1
        PC=(A)                                   * 613A4

* refs (15): 611F2 61215 61233 61257 6127B 612A2 ...
SafGarbD-1~jump:
        GOVLNG  SafGarbD-1                       * 613A8
L_613AF:
        GOSUB   SafGarbD-1~jump                  * 613AF
        GONC    L_613C0                          * 613B3  always taken

* -> ob
* refs (370): 09043 0C749 0F89B 10923 109EB 10A63 ...
1GETLAM:
        CON(5)  (*)+5                            * 613B6  primitive code object
        D=D-1   A                                * 613BB
        GOC     L_613AF                          * 613BD
L_613C0:
        AD0EX                                    * 613C0
        D0=(5)  TEMPENV                          * 613C3
        C=DAT0  A                                * 613CA
        D0=C                                     * 613CD
L_613D0:
        D0=D0+  15                               * 613D0
        C=DAT0  A                                * 613D3
        D0=A                                     * 613D6
        D1=D1-  5                                * 613D9
        GOTO    L_610ED                          * 613DC
L_613E0:
        GOSUB   SafGarbD-1~jump                  * 613E0
        GONC    L_613F1                          * 613E4  always taken

* -> ob
* refs (324): 0C9B8 0F896 0F8CD 0F9E0 10900 1DC2D ...
2GETLAM:
        CON(5)  (*)+5                            * 613E7  primitive code object
        D=D-1   A                                * 613EC
        GOC     L_613E0                          * 613EE
L_613F1:
        AD0EX                                    * 613F1
        D0=(5)  TEMPENV                          * 613F4
        C=DAT0  A                                * 613FB
        D0=C                                     * 613FE
        D0=D0+  10                               * 61401
        GONC    L_613D0                          * 61404
L_61407:
        GOSUB   SafGarbD-1~jump                  * 61407
        GONC    L_61418                          * 6140B  always taken

* -> ob
* refs (233): 0F990 1D1F9 1DFF8 1E02A 24CFD 2564B ...
3GETLAM:
        CON(5)  (*)+5                            * 6140E  primitive code object
        D=D-1   A                                * 61413
        GOC     L_61407                          * 61415
L_61418:
        AD0EX                                    * 61418
        D0=(5)  TEMPENV                          * 6141B
        C=DAT0  A                                * 61422
        D0=C                                     * 61425
        D0=D0+  10                               * 61428
        D0=D0+  10                               * 6142B
        GONC    L_613D0                          * 6142E
L_61431:
        GOSUB   SafGarbD-1~jump                  * 61431
        GONC    L_61442                          * 61435  always taken

* -> ob
* refs (230): 0F995 1E02F 27B6B 27C42 29502 2FC09 ...
4GETLAM:
        CON(5)  (*)+5                            * 61438  primitive code object
        D=D-1   A                                * 6143D
        GOC     L_61431                          * 6143F
L_61442:
        AD0EX                                    * 61442
        D0=(5)  TEMPENV                          * 61445
        C=DAT0  A                                * 6144C
        D0=C                                     * 6144F
        D0=D0+  15                               * 61452
        D0=D0+  15                               * 61455
        GOTO    L_613D0                          * 61458

* -> ob
* refs (195): 19CD6 19CF5 19F14 19F37 1A07F 27BDE ...
5GETLAM:
        CON(5)  (*)+5                            * 6145C  primitive code object
        LC(5)   #00037                           * 61461
        GOTO    L_61589                          * 61468

* -> ob
* refs (147): 27C1A 33D19 342E3 452F9 45317 46CCF ...
6GETLAM:
        CON(5)  (*)+5                            * 6146C  primitive code object
        LC(5)   #00041                           * 61471
        GOTO    L_61589                          * 61478

* -> ob
* refs (145): 27C47 33C5B 33CE7 3405B 342D9 46C2A ...
7GETLAM:
        CON(5)  (*)+5                            * 6147C  primitive code object
        LC(5)   #0004B                           * 61481
        GOTO    L_61589                          * 61488

* -> ob
* refs (145): 19AFD 273C3 27E63 28405 470D0 47102 ...
8GETLAM:
        CON(5)  (*)+5                            * 6148C  primitive code object
        LC(5)   #00055                           * 61491
        GOTO    L_61589                          * 61498

* -> ob
* refs (95): 28400 454D9 4550B 46D2E 4CBF4 4FE7B ...
9GETLAM:
        CON(5)  (*)+5                            * 6149C  primitive code object
        LC(5)   #0005F                           * 614A1
        GOTO    L_61589                          * 614A8

* -> ob
* refs (81): 283FB 452B8 452EF 4530D 46CD4 4783F ...
10GETLAM:
        CON(5)  (*)+5                            * 614AC  primitive code object
        LC(5)   #00069                           * 614B1
        GOTO    L_61589                          * 614B8

* -> ob
* refs (63): 19B0C 283F6 4829C 4A919 4B846 4B9AE ...
11GETLAM:
        CON(5)  (*)+5                            * 614BC  primitive code object
        LC(5)   #00073                           * 614C1
        GOTO    L_61589                          * 614C8

* -> ob
* refs (73): 0C9BD 482EC 48323 48346 4837D 483E6 ...
12GETLAM:
        CON(5)  (*)+5                            * 614CC  primitive code object
        LC(5)   #0007D                           * 614D1
        GOTO    L_61589                          * 614D8

* -> ob
* refs (51): 19FAC 481FC 48215 4D745 4DD9B 4DEC7 ...
13GETLAM:
        CON(5)  (*)+5                            * 614DC  primitive code object
        LC(5)   #00087                           * 614E1
        GOTO    L_61589                          * 614E8

* -> ob
* refs (68): 470D5 4844F 48468 4DE0E 4DEBD 6A398 ...
14GETLAM:
        CON(5)  (*)+5                            * 614EC  primitive code object
        LC(5)   #00091                           * 614F1
        GOTO    L_61589                          * 614F8

* -> ob
* refs (91): 0C645 0C6A9 0C6E0 457C1 45913 46213 ...
15GETLAM:
        CON(5)  (*)+5                            * 614FC  primitive code object
        LC(5)   #0009B                           * 61501
        GOTO    L_61589                          * 61508

* -> ob
* refs (48): 0CA1C 4D22C 4D9A2 50D82 50DB9 51030 ...
16GETLAM:
        CON(5)  (*)+5                            * 6150C  primitive code object
        LC(5)   #000A5                           * 61511
        GOTO    L_61589                          * 61518

* -> ob
* refs (38): 4BB25 4BCAB 4BD2D 4C31E 4C4DB 6CB4D ...
17GETLAM:
        CON(5)  (*)+5                            * 6151C  primitive code object
        LC(5)   #000AF                           * 61521
        GOTO    L_61589                          * 61528

* -> ob
* refs (57): 48A2B 4B4FF 4B6ED 4BB7F 4BE81 4C549 ...
18GETLAM:
        CON(5)  (*)+5                            * 6152C  primitive code object
        LC(5)   #000B9                           * 61531
        GOTO    L_61589                          * 61538

* -> ob
* refs (16): 489F9 48CDD 4BB34 4BC15 4C116 4C1D4 ...
19GETLAM:
        CON(5)  (*)+5                            * 6153C  primitive code object
        LC(5)   #000C3                           * 61541
        GOTO    L_61589                          * 61548

* -> ob
* refs (40): 48AA8 4C233 4C26A 4C463 8D7B7 8DB9D ...
20GETLAM:
        CON(5)  (*)+5                            * 6154C  primitive code object
        LC(5)   #000CD                           * 61551
        GOTO    L_61589                          * 61558

* -> ob
* refs (44): 0C64F 0C6EA 457CB 4591D 4621D 48AE4 ...
21GETLAM:
        CON(5)  (*)+5                            * 6155C  primitive code object
        LC(5)   #000D7                           * 61561
        GOTO    L_61589                          * 61568

* refs (25): 4D7D1 6A12C 6CCFE 6CFD3 6D01E 6E915 ...
22Lget:
        CON(5)  (*)+5                            * 6156C  primitive code object
        LC(5)   #000E1                           * 61571
        GOTO    L_61589                          * 61578
L_6157C:
        R0=C                                     * 6157C
        GOSUB   SafGarbD-1~jump                  * 6157F
        C=R0                                     * 61583
        GONC    L_6158E                          * 61586
L_61589:
        D=D-1   A                                * 61589
        GOC     L_6157C                          * 6158B
L_6158E:
        A=C     A                                * 6158E
        CD0EX                                    * 61590
        RSTK=C                                   * 61593
        D0=(5)  TEMPENV                          * 61595
        C=DAT0  A                                * 6159C
        C=C+A   A                                * 6159F
        D0=C                                     * 615A1
        A=DAT0  A                                * 615A4
        D1=D1-  5                                * 615A7
        DAT1=A  A                                * 615AA
L_615AD:
        C=RSTK                                   * 615AD
        D0=C                                     * 615AF
        A=DAT0  A                                * 615B2
        D0=D0+  5                                * 615B5
        PC=(A)                                   * 615B8
L_615BC:
        A=C     A                                * 615BC
        CD0EX                                    * 615BE
        RSTK=C                                   * 615C1
        D0=(5)  TEMPENV                          * 615C3
        C=DAT0  A                                * 615CA
        C=C+A   A                                * 615CD
        D0=C                                     * 615CF
        A=DAT1  A                                * 615D2
        D1=D1+  5                                * 615D5
        D=D+1   A                                * 615D8
        DAT0=A  A                                * 615DA
        GONC    L_615AD                          * 615DD  always taken

* ob ->
* refs (61): 1DA2F 1DA57 1DAE3 1DB15 1DB1F 1DFCB ...
1PUTLAM:
        CON(5)  (*)+5                            * 615E0  primitive code object
        LC(5)   #0000F                           * 615E5
        GOTO    L_615BC                          * 615EC

* ob ->
* refs (53): 0C951 0F9B3 1DFA8 27B3E 29D52 43ABD ...
2PUTLAM:
        CON(5)  (*)+5                            * 615F0  primitive code object
        LC(5)   #00019                           * 615F5
        GOTO    L_615BC                          * 615FC

* ob ->
* refs (56): 0C942 27B66 27BC0 43A63 43B30 43BE4 ...
3PUTLAM:
        CON(5)  (*)+5                            * 61600  primitive code object
        LC(5)   #00023                           * 61605
        GOTO    L_615BC                          * 6160C

* ob -> ob
* refs (5): 27B2A 484D1 4DA21 4DD5F 68D0F
DUP4PUTLAM:
        CON(5)  DupAndThen                       * 61610  code object: the address of its machine code

* ob ->
* refs (55): 0F99F 19FCA 2951B 29688 335E4 336B1 ...
4PUTLAM:
        CON(5)  (*)+5                            * 61615  primitive code object
        LC(5)   #0002D                           * 6161A
        GOTO    L_615BC                          * 61621

* ob ->
* refs (36): 19ABE 27B25 49220 5191A 570D6 68D0A ...
5PUTLAM:
        CON(5)  (*)+5                            * 61625  primitive code object
        LC(5)   #00037                           * 6162A
        GOTO    L_615BC                          * 61631

* ob ->
* refs (37): 19F5B 27B1B 48FAE 51924 570D1 68D00 ...
6PUTLAM:
        CON(5)  (*)+5                            * 61635  primitive code object
        LC(5)   #00041                           * 6163A
        GOTO    L_615BC                          * 61641

* ob ->
* refs (41): 27B39 46C6B 48FA9 49FCE 4D227 4EE7E ...
7PUTLAM:
        CON(5)  (*)+5                            * 61645  primitive code object
        LC(5)   #0004B                           * 6164A
        GOTO    L_615BC                          * 61651

* ob ->
* refs (38): 19AB4 28414 46C66 472A9 48DE2 49FC9 ...
8PUTLAM:
        CON(5)  (*)+5                            * 61655  primitive code object
        LC(5)   #00055                           * 6165A
        GOTO    L_615BC                          * 61661

* ob ->
* refs (25): 28419 50208 5191F 570CC 6A195 6B871 ...
9PUTLAM:
        CON(5)  (*)+5                            * 61665  primitive code object
        LC(5)   #0005F                           * 6166A
        GOTO    L_615BC                          * 61671

* ob ->
* refs (25): 2841E 5022B 51929 570C7 69DAC 6A1C7 ...
10PUTLAM:
        CON(5)  (*)+5                            * 61675  primitive code object
        LC(5)   #00069                           * 6167A
        GOTO    L_615BC                          * 61681

* ob ->
* refs (34): 28423 4A8A1 4E4E2 4E550 6A08C 6A1EF ...
11PUTLAM:
        CON(5)  (*)+5                            * 61685  primitive code object
        LC(5)   #00073                           * 6168A
        GOTO    L_615BC                          * 61691

* ob ->
* refs (20): 0C94C 4C5E9 4E4C4 6A0AA 6B844 6CBE8 ...
12PUTLAM:
        CON(5)  (*)+5                            * 61695  primitive code object
        LC(5)   #0007D                           * 6169A
        GOTO    L_615BC                          * 616A1

* ob ->
* refs (18): 4D1F5 6A4BA 6B849 6E9A6 8D505 8E7E2 ...
13PUTLAM:
        CON(5)  (*)+5                            * 616A5  primitive code object
        LC(5)   #00087                           * 616AA
        GOTO    L_615BC                          * 616B1

* ob ->
* refs (12): 4D1EB 6A20D 6B83A 6E7BC 6EF0A 6EFDC ...
14PUTLAM:
        CON(5)  (*)+5                            * 616B5  primitive code object
        LC(5)   #00091                           * 616BA
        GOTO    L_615BC                          * 616C1

* ob ->
* refs (31): 488D7 4A8CE 4BD14 4BD46 4C341 570C2 ...
15PUTLAM:
        CON(5)  (*)+5                            * 616C5  primitive code object
        LC(5)   #0009B                           * 616CA
        GOTO    L_615BC                          * 616D1

* ob ->
* refs (21): 0CA0D 47120 4717A 488E1 4D254 4E6B8 ...
16PUTLAM:
        CON(5)  (*)+5                            * 616D5  primitive code object
        LC(5)   #000A5                           * 616DA
        GOTO    L_615BC                          * 616E1

* ob ->
* refs (15): 488DC 4A8D3 6B7A4 6CB2F 6CB61 8BFB1 ...
17PUTLAM:
        CON(5)  (*)+5                            * 616E5  primitive code object
        LC(5)   #000AF                           * 616EA
        GOTO    L_615BC                          * 616F1

* ob ->
* refs (26): 4A8E7 686CA 6875B 69346 697A7 69DCF ...
18PUTLAM:
        CON(5)  (*)+5                            * 616F5  primitive code object
        LC(5)   #000B9                           * 616FA
        GOTO    L_615BC                          * 61701

* ob ->
* refs (11): 4BA03 4BC42 69C55 6B7AE 6BFD3 6FFF3 ...
19PUTLAM:
        CON(5)  (*)+5                            * 61705  primitive code object
        LC(5)   #000C3                           * 6170A
        GOTO    L_615BC                          * 61711

* ob ->
* refs (7): 4A9A0 4D231 570BD 8E286 8EF46 8F44C ...
20PUTLAM:
        CON(5)  (*)+5                            * 61715  primitive code object
        LC(5)   #000CD                           * 6171A
        GOTO    L_615BC                          * 61721

* ob ->
* refs (7): 4A9A5 4D23B 570DB 8E30F 8F3CD 8F4EE ...
21PUTLAM:
        CON(5)  (*)+5                            * 61725  primitive code object
        LC(5)   #000D7                           * 6172A
        GOTO    L_615BC                          * 61731

* ob ->
* refs (12): 4D29A 6A0E6 6D634 6E6F9 8E0D1 8E27C ...
22PUTLAM:
        CON(5)  (*)+5                            * 61735  primitive code object
        LC(5)   #000E1                           * 6173A
        GOTO    L_615BC                          * 61741

* ->
* refs (4): 56B6E 60432 605C7 6069E
DUPTEMPENV:
        CON(5)  (*)+5                            * 61745  primitive code object
        GOSBVL  SAVPTR                           * 6174A
        ST=0    10                               * 61751
L_61754:
        D0=(5)  TEMPENV                          * 61754
        A=DAT0  A                                * 6175B
        D0=A                                     * 6175E
        A=DAT0  A                                * 61761
        B=A     A                                * 61764
        D1=(5)  RSKTOP                           * 61766
        C=DAT1  A                                * 6176D
        D1=(5)  DSKTOP                           * 61770
        A=DAT1  A                                * 61777
        A=A-B   A                                * 6177A
        ?C<A    A                                * 6177C
        GOYES   L_6178C                          * 6177F
        GOSBVL  St10Gb                           * 61781
        GOTO    L_61754                          * 61788
L_6178C:
        DAT1=A  A                                * 6178C
        D1=A                                     * 6178F
        C=A     A                                * 61792
        A=A+B   A                                * 61794
        AD0EX                                    * 61796
        C=A-C   A                                * 61799
        GOSBVL  MOVEDOWN                         * 6179B
        AD1EX                                    * 617A2
        A=A-B   A                                * 617A5
        D1=(5)  TEMPENV                          * 617A7
        DAT1=A  A                                * 617AE
        D1=A                                     * 617B1
        D1=D1+  5                                * 617B4
        C=0     A                                * 617B7
        DAT1=C  A                                * 617B9
        D1=(5)  EDITLINE                         * 617BC
        A=DAT1  A                                * 617C3
        A=A-B   A                                * 617C6
        DAT1=A  A                                * 617C8
        GOSBVL  ADJMEM                           * 617CB
        GOLONG  L_61F88                          * 617D2

* #n -> #n ob lam F -> #n T
* refs (2): 56723 56778
GETLAMPAIR:
        CON(5)  (*)+5                            * 617D8  primitive code object
        C=DAT1  A                                * 617DD
        CD1EX                                    * 617E0
        RSTK=C                                   * 617E3
        D1=D1+  5                                * 617E5
        A=DAT1  A                                * 617E8
        D1=(5)  TEMPENV                          * 617EB
        C=DAT1  A                                * 617F2
        D1=C                                     * 617F5
        C=DAT1  A                                * 617F8
        ?C>A    A                                * 617FB
        GOYES   L_6180B                          * 617FE
        C=RSTK                                   * 61800
        D1=C                                     * 61802
        GOLONG  PushTLoop                        * 61805
L_6180B:
        CD1EX                                    * 6180B
        A=A+C   A                                * 6180E
        LC(5)   #00002                           * 61810
        D=D-C   A                                * 61817
        GONC    L_61853                          * 61819
        D=D+C   A                                * 6181C
        R0=A                                     * 6181E
        C=RSTK                                   * 61821
        D1=C                                     * 61823
        GOSBVL  SAVPTR                           * 61826
        GOSUBL  GARBAGECOL~jump                  * 6182D
        GOSUBL  GETPTR~jump_9                    * 61833
        LC(5)   #00002                           * 61839
        D=D-C   A                                * 61840
        GONC    L_6184B                          * 61842
        D=D+C   A                                * 61845
        GOTO    L_61DBD                          * 61847
L_6184B:
        CD1EX                                    * 6184B
        RSTK=C                                   * 6184E
        A=R0                                     * 61850
L_61853:
        D1=A                                     * 61853
        A=DAT1  10                               * 61856
        C=RSTK                                   * 6185A
        D1=C                                     * 6185C
        D1=D1-  10                               * 6185F
        DAT1=A  10                               * 61862
        GOLONG  PushFLoop                        * 61866

* #m #n -> :: <ob1> ; #m #n -> :: <ob2> <rest> ;
* refs (50): 24BBF 275BC 27995 2C620 2D5CD 2D640 ...
#=case:
        CON(5)  (*)+5                            * 6186C  primitive code object
        GOSBVL  POP2#                            * 61871
        GOTO    L_61943                          * 61878

* #m #n -> :: #m <ob1> ; #m #n -> :: #m <ob2> <rest> ;
* refs (6): 57A1B 5E08F 5F2F8 9107C 92FCF D0334
OVER#=case:
        CON(5)  (*)+5                            * 6187C  primitive code object
        GOSBVL  POP2#                            * 61881
        D1=D1-  5                                * 61888
        D=D-1   A                                * 6188B
        GOTO    L_61943                          * 6188D

* #0 -> :: #0 <ob1> ; # -> :: # <ob2> <rest> ;
* refs (40): 021FB 1940C 1DB8D 1DCA5 213A2 27558 ...
DUP#0=case:
        CON(5)  DupAndThen                       * 61891  code object: the address of its machine code

* #0 -> :: <ob1> ; # -> :: <ob2> <rest> ;
* refs (63): 14438 1467C 15F0A 2753A 276DE 2770B ...
#0=case:
        CON(5)  (*)+5                            * 61896  primitive code object
        GOSBVL  POP#                             * 6189B
        A=A-1   A                                * 618A2
        GOTO    L_6199C                          * 618A4

* #0 -> :: <ob1> ; # -> :: # <ob2> <rest> ;
* refs (13): 16E85 2192C 4262E 69978 6AFF5 6B147 ...
DUP#0=csedrp:
        CON(5)  (*)+5                            * 618A8  primitive code object
        GOSUB   SUB_611B0                        * 618AD
        D1=C                                     * 618B1
        C=0     A                                * 618B4
        GOTO    L_618CA                          * 618B6

* ob1 ob1 -> :: <ob1> ; ob1 ob2 -> :: ob1 <ob2> <rest> ;
* refs (39): 0C62C 0C63B 0C6C7 0C6D6 0F4CF 10A04 ...
EQcasedrop:
        CON(5)  (*)+5                            * 618BA  primitive code object
        A=DAT1  A                                * 618BF
        D1=D1+  5                                * 618C2
        D=D+1   A                                * 618C5
        C=DAT1  A                                * 618C7
L_618CA:
        ?C=A    A                                * 618CA
        GOYES   L_61907                          * 618CD
        GOTO    L_619A6                          * 618CF

* #m #n -> :: <ob1> ; #m #n -> :: #m <ob2> <rest> ;
* refs (135): 09057 0E589 0E5B7 14074 1471C 19D0E ...
#=casedrop:
        CON(5)  (*)+5                            * 618D3  primitive code object
        GOSBVL  POP2#                            * 618D8
        D1=D1-  5                                * 618DF
        D=D-1   A                                * 618E2
        GOTO    L_618CA                          * 618E4

* ob T -> :: ob <ob2> <rest> ; ob F -> :: <ob1> ;
* refs (108): 09818 0C21D 0C695 0C72B 0F0BB 110A9 ...
NOTcasedrop:
        CON(5)  (*)+5                            * 618E8  primitive code object
        GOSUB   popflag                          * 618ED
        GONC    L_61907                          * 618F1
        GOC     L_61903                          * 618F4

* ob T -> :: <ob1> ; ob F -> :: ob <ob2> <rest> ;
* refs (160): 0E561 0E57A 0E733 0EAEB 0EBC1 1090F ...
casedrop:
        CON(5)  (*)+5                            * 618F7  primitive code object
        GOSUB   popflag                          * 618FC
        GOC     L_61907                          * 61900
L_61903:
        GOTO    L_619A6                          * 61903
L_61907:
        D1=D1+  5                                * 61907
        D=D+1   A                                * 6190A
        GOTO    L_6199F                          * 6190C

* ob1 ob2 T -> :: ob1 ob2 <ob2> <rest> ; ob1 ob2 F -> :: <ob1> ;
* refs (17): 0C20E 16E99 1A0A9 4BADF 6B2FF 6B6E1 ...
NOTcase2drop:
        CON(5)  (*)+5                            * 61910  primitive code object
        GOSUB   popflag                          * 61915
        GOC     L_61903                          * 61919
        GONC    L_6192B                          * 6191C

* ob1 ob2 T -> :: <ob1> ; ob1 ob2 F -> :: ob1 ob2 <ob2> <rest> ;
* refs (72): 17266 19F2D 19F4C 1A075 1A7A1 29476 ...
case2drop:
        CON(5)  (*)+5                            * 6191F  primitive code object
        GOSUB   popflag                          * 61924
        GONC    L_61903                          * 61928
L_6192B:
        D1=D1+  5                                * 6192B
        D=D+1   A                                * 6192E
        GONC    L_61907                          * 61930  always taken

* ob1 ob1 -> :: ob1 <ob1> ; ob1 ob2 -> :: ob1 <ob2> <rest> ;
* refs (7): 0F48E 169BE 169CD 41796 478AD 4C71A ...
EQcase:
        CON(5)  (*)+5                            * 61933  primitive code object
        A=DAT1  A                                * 61938
        D1=D1+  5                                * 6193B
        D=D+1   A                                * 6193E
        C=DAT1  A                                * 61940
L_61943:
        ?C=A    A                                * 61943
        GOYES   L_6199F                          * 61946
        GONC    L_619A6                          * 61948

* ob T -> :: ; ob F -> :: ob <ob1> <rest> ;
* refs (91): 10941 145F5 1809C 18150 18715 18C68 ...
caseDROP:
        CON(5)  (*)+5                            * 6194B  primitive code object
        GOSUB   popflag                          * 61950
        GONC    L_6196C                          * 61954
L_61957:
        D1=D1+  5                                * 61957
        D=D+1   A                                * 6195A
        GOTO    SEMILOOP                         * 6195C

* ob T -> :: ob <ob1> <rest> ; ob F -> :: ;
* refs (54): 14556 17ED9 17FA2 180F6 18559 2152D ...
NOTcaseDROP:
        CON(5)  (*)+5                            * 61960  primitive code object
        GOSUB   popflag                          * 61965
        GONC    L_61957                          * 61969
L_6196C:
        GOTO    L_61A4E                          * 6196C

* ob1 ob2 T -> :: ; ob1 ob2 F -> :: ob1 ob2 <ob1> <rest> ;
* refs (24): 0F42A 0FBEC 0FCAF 107F7 10883 479B1 ...
case2DROP:
        CON(5)  (*)+5                            * 61970  primitive code object
        GOSUB   popflag                          * 61975
        GONC    L_6196C                          * 61979
L_6197C:
        D1=D1+  5                                * 6197C
        D=D+1   A                                * 6197F
        GONC    L_61957                          * 61981  always taken

* ob1 ob2 T -> :: ob1 ob2 <ob1> <rest> ; ob1 ob2 F -> :: ;
* refs (22): 0941A 21D0D 34056 3FC2D 40EA6 42552 ...
NOTcase2DROP:
        CON(5)  (*)+5                            * 61984  primitive code object
        GOSUB   popflag                          * 61989
        GOC     L_6196C                          * 6198D
        GONC    L_6197C                          * 61990

* T -> :: <ob1> ; F -> :: <ob2> <rest> ;
* refs (697): 048B3 048C2 048DB 08FFD 09285 092DA ...
case:
        CON(5)  (*)+5                            * 61993  primitive code object
L_61998:
        GOSUB   popflag                          * 61998
L_6199C:
        GONC    L_619A6                          * 6199C
L_6199F:
        GOVLNG  L_06FD6                          * 6199F
L_619A6:
        GOVLNG  L_07152                          * 619A6

* T -> :: <ob2> <rest> ; F -> :: <ob1> ;
* refs (519): 092B7 0937A 09845 0989A 0C686 0C785 ...
NOTcase:
        CON(5)  (*)+5                            * 619AD  primitive code object
L_619B2:
        GOSUB   popflag                          * 619B2
        GOC     L_619A6                          * 619B6
        GONC    L_6199F                          * 619B9

* T -> :: <ob1> <rest> ; F -> :: <ob2> <rest> ;
* refs (447): 02228 0BB1C 0C83E 0C933 0CAE1 0DD21 ...
IT:
        CON(5)  (*)+5                            * 619BC  primitive code object
        GOSUB   popflag                          * 619C1
        GONC    L_619A6                          * 619C5
        GOC     L_619D6                          * 619C8

* ->
* refs (112): 0C76C 0F277 0F29F 0F2C2 0F2E5 0F308 ...
GOTO:
        CON(5)  (*)+5                            * 619CB  primitive code object
L_619D0:
        A=DAT0  A                                * 619D0
        D0=A                                     * 619D3
L_619D6:
        A=DAT0  A                                * 619D6
        D0=D0+  5                                * 619D9
        PC=(A)                                   * 619DC

* flag ->
* refs (70): 0F24F 0F25E 0F9BD 14695 14889 14A23 ...
?GOTO:
        CON(5)  (*)+5                            * 619E0  primitive code object
        GOSUB   popflag                          * 619E5
        GOC     L_619D0                          * 619E9
L_619EC:
        D0=D0+  5                                * 619EC
        GOTO    L_61A4E                          * 619EF

* flag ->
* refs (25): 0F231 0F986 0FF11 14A7D 16DE0 2DE4B ...
NOT?GOTO:
        CON(5)  (*)+5                            * 619F3  primitive code object
        GOSUB   popflag                          * 619F8
        GOC     L_619EC                          * 619FC
        GONC    L_619D0                          * 619FF

* Pop to A.A, if TRUE then set carry
* refs (23): 31647 31656 618ED 618FC 61915 61924 ...
popflag:
        A=DAT1  A                                * 61A02
        D1=D1+  5                                * 61A05
        D=D+1   A                                * 61A08
        LC(5)   TRUE                             * 61A0A
        ?C=A    A                                * 61A11
        RTNYES                                   * 61A14
        RTN                                      * 61A16

* #0 -> :: ; #  -> :: <ob1> <rest> ;
* refs (12): 2E04F 3F912 4C08C 6C922 8E290 9414B ...
#0=?SEMI:
        CON(5)  (*)+5                            * 61A18  primitive code object
        GOSBVL  POP#                             * 61A1D
        ?A=0    A                                * 61A24
        GOYES   SEMILOOP                         * 61A27
        GONC    L_61A4E                          * 61A29

* T -> :: <ob1> <rest> ; F -> :: ;
* refs (193): 09460 0C816 0C861 0F227 0F245 0FE76 ...
NOT?SEMI:
        CON(5)  (*)+5                            * 61A2C  primitive code object
        GOSUB   popflag                          * 61A31
        GONC    SEMILOOP                         * 61A35
        GOC     L_61A4E                          * 61A38

* T -> :: ; F -> :: <ob1> <rest> ;
* refs (328): 041B6 106E9 108FB 109C8 10A36 10ACC ...
?SEMI:
        CON(5)  (*)+5                            * 61A3B  primitive code object
        GOSUB   popflag                          * 61A40
        GONC    L_61A4E                          * 61A44

* ->
* refs (3): 6195C 61A24 61A35
SEMILOOP:
        GOVLNG  SEMILOOP~1                       * 61A47
L_61A4E:
        A=DAT0  A                                * 61A4E
        D0=D0+  5                                * 61A51
        PC=(A)                                   * 61A54

* ob T -> :: <ob2> <rest> ; ob F -> :: ob <ob1> <rest> ;
* refs (3): 16D63 41C57 9D689
ITE_DROP:
        CON(5)  (*)+5                            * 61A58  primitive code object
        GOSUB   popflag                          * 61A5D
        GONC    L_61A4E                          * 61A61
        D1=D1+  5                                * 61A64
        D=D+1   A                                * 61A67
        GOTO    L_619A6                          * 61A69

* Returns and evals first obj in previous stream.
* refs (29): 1F76C 1F8C5 217BD 510A3 56D8D 57392 ...
COLA_EVAL:
        CON(5)  (*)+5                            * 61A6D  primitive code object
        ABEX    A                                * 61A72
        AD0EX                                    * 61A74
        D0=D0-  5                                * 61A77
        A=DAT0  A                                * 61A7A
        AD0EX                                    * 61A7D
        B=A     A                                * 61A80
        A=DAT1  A                                * 61A82
        D1=D1+  5                                * 61A85
        D=D+1   A                                * 61A88
        PC=(A)                                   * 61A8A

* T ob1 ob2 -> :: ob1 ; F ob1 ob2 -> :: ob2 ;
* refs (5): 08CC2 0BC65 57F41 5834F 63830
COLARPITE:
        CON(5)  (*)+5                            * 61A8E  primitive code object
        A=B     A                                * 61A93
        D0=A                                     * 61A95
        D0=D0-  5                                * 61A98
        A=DAT0  A                                * 61A9B
        AD0EX                                    * 61A9E
        B=A     A                                * 61AA1
        C=DAT1  A                                * 61AA3
        RSTK=C                                   * 61AA6
        D1=D1+  5                                * 61AA8
        C=DAT1  A                                * 61AAB
        RSTK=C                                   * 61AAE
        D1=D1+  5                                * 61AB0
        A=DAT1  A                                * 61AB3
        D1=D1+  5                                * 61AB6
        LC(5)   #00004                           * 61AB9
        D=D+C   A                                * 61AC0
        LC(5)   TRUE                             * 61AC2
        ?C=A    A                                * 61AC9
        GOYES   L_61AD0                          * 61ACC
L_61ACE:
        C=RSTK                                   * 61ACE
L_61AD0:
        C=RSTK                                   * 61AD0
        A=C     A                                * 61AD2
        PC=(A)                                   * 61AD4

* T -> :: <ob1> <ob3> <rest> ; F -> :: <ob2> <rest> ;
* refs (682): 04D73 09325 09784 09872 0C66D 0C708 ...
ITE:
        CON(5)  (*)+5                            * 61AD8  primitive code object
        CD0EX                                    * 61ADD
        D0=C                                     * 61AE0
        RSTK=C                                   * 61AE3
        GOTO    L_61B02                          * 61AE5

* Return to composite and ITE there.
* refs (9): 62C37 63E6B 63E7F 63E93 63EA7 63EBB ...
2'RCOLARPITE:
        CON(5)  (*)+5                            * 61AE9  primitive code object
        A=B     A                                * 61AEE
        D0=A                                     * 61AF0
        D0=D0-  5                                * 61AF3
        C=DAT0  A                                * 61AF6
        RSTK=C                                   * 61AF9
        CD0EX                                    * 61AFB
        B=C     A                                * 61AFE
        D=D+1   A                                * 61B00
L_61B02:
        GOSBVL  SKIPOB                           * 61B02
        CD0EX                                    * 61B09
        RSTK=C                                   * 61B0C
        D0=C                                     * 61B0E
        GOSBVL  SKIPOB                           * 61B11
        GOSUB   popflag                          * 61B18
        GONC    L_61B21                          * 61B1C
        C=RSTK                                   * 61B1F
L_61B21:
        C=RSTK                                   * 61B21
L_61B23:
        RSTK=C                                   * 61B23
        CD0EX                                    * 61B25
        A=DAT0  A                                * 61B28
        D0=A                                     * 61B2B
        A=DAT0  A                                * 61B2E
        CD0EX                                    * 61B31
        RSTK=C                                   * 61B34
        LC(5)   PRLG                             * 61B36
        ?C#A    A                                * 61B3D
        GOYES   L_61AD0                          * 61B40
        GONC    L_61ACE                          * 61B42

* ->
* refs (3): 1DDDD 1DDF1 1DDFB
2@REVAL:
        CON(5)  (*)+5                            * 61B45  primitive code object
        LC(5)   #FFFF6                           * 61B4A
        GOTO    L_61B61                          * 61B51

* ->
* refs (2): 2E6A0 3657F
3@REVAL:
        CON(5)  (*)+5                            * 61B55  primitive code object
        LC(5)   #FFFF1                           * 61B5A
L_61B61:
        C=C+B   A                                * 61B61
        CD0EX                                    * 61B63
        A=DAT0  A                                * 61B66
        D0=C                                     * 61B69
        C=A     A                                * 61B6C
        GOTO    L_61B23                          * 61B6E

* ob T -> :: ob <ob1> <rest> ; ob F -> :: <ob1> <rest> ;
* refs (2): 0BCE3 2FC22
NOT?DROP:
        CON(5)  (*)+5                            * 61B72  primitive code object
        GOSUBL  popflag                          * 61B77
        GOC     L_61B85                          * 61B7D
        D1=D1+  5                                * 61B80
        D=D+1   A                                * 61B83
L_61B85:
        GOTO    L_61A4E                          * 61B85

* -> ob T -> F
* refs (15): 0F222 0F240 0F981 0FE71 145A6 14A14 ...
ticR:
        CON(5)  (*)+5                            * 61B89  primitive code object
        D=D-1   A                                * 61B8E
        GONC    L_61B99                          * 61B90
        GOSUBL  SafGarbD-1~jump                  * 61B93
L_61B99:
        C=B     A                                * 61B99
        CD0EX                                    * 61B9B
        RSTK=C                                   * 61B9E
        D0=D0-  5                                * 61BA0
        C=DAT0  A                                * 61BA3
        RSTK=C                                   * 61BA6
        D1=D1-  5                                * 61BA8
        DAT1=C  A                                * 61BAB
        D0=C                                     * 61BAE
        A=DAT0  A                                * 61BB1
        LC(5)   SEMI                             * 61BB4
        ?C=A    A                                * 61BBB
        GOYES   L_61C05                          * 61BBE
        D0=A                                     * 61BC0
        A=DAT0  A                                * 61BC3
        LC(5)   PRLG                             * 61BC6
        ?C=A    A                                * 61BCD
        GOYES   L_61BE3                          * 61BD0
        AD0EX                                    * 61BD2
        DAT1=A  A                                * 61BD5
        C=RSTK                                   * 61BD8
        D0=C                                     * 61BDA
        D0=D0+  5                                * 61BDD
        GONC    L_61BEF                          * 61BE0
L_61BE3:
        C=RSTK                                   * 61BE3
        D0=C                                     * 61BE5
        GOSBVL  SKIPOB                           * 61BE8
L_61BEF:
        A=B     A                                * 61BEF
        AD0EX                                    * 61BF1
        D0=D0-  5                                * 61BF4
        DAT0=A  A                                * 61BF7
        C=RSTK                                   * 61BFA
        D0=C                                     * 61BFC
        GOLONG  PushTLoop                        * 61BFF
L_61C05:
        A=B     A                                * 61C05
        D0=A                                     * 61C07
        D0=D0-  5                                * 61C0A
        C=RSTK                                   * 61C0D
        C=RSTK                                   * 61C0F
        CD0EX                                    * 61C11
        B=C     A                                * 61C14
        GOLONG  OverWrFLoop                      * 61C16

* hxs #nibs -> hxs'
* refs (8): 0EDF0 15E9C 17F54 24CDA 24D34 298C3 ...
EXPAND:
        CON(5)  (*)+5                            * 61C1C  primitive code object
        GOSUBL  POP#~jump_4                      * 61C21
        GOSBVL  SAVPTR                           * 61C27
        B=A     A                                * 61C2E
        C=DAT1  A                                * 61C30
        CD1EX                                    * 61C33
        D1=D1+  5                                * 61C36
        A=DAT1  A                                * 61C39
        B=B+A   A                                * 61C3C
        CD1EX                                    * 61C3E
        RSTK=C                                   * 61C41
        C=B     A                                * 61C43
        P=      4                                * 61C45
        C+P+1                                    * 61C47
        RSTK=C                                   * 61C4A
        ST=0    10                               * 61C4C
L_61C4F:
        C=RSTK                                   * 61C4F
        RSTK=C                                   * 61C51
        GOSBVL  CREATETEMP                       * 61C53
        GONC    L_61C99                          * 61C5A
        ?ST=0   10                               * 61C5D
        GOYES   L_61C70                          * 61C60
        C=RSTK                                   * 61C62
        C=RSTK                                   * 61C64
        GOSUBL  GETPTR~jump_9                    * 61C66
        GOTO    L_61DBD                          * 61C6C
L_61C70:
        ST=1    10                               * 61C70
        GOSUBL  GARBAGECOL~jump                  * 61C73
        GOSUBL  GETPTR~jump_9                    * 61C79
        C=RSTK                                   * 61C7F
        A=C     A                                * 61C81
        C=RSTK                                   * 61C83
        C=DAT1  A                                * 61C85
        P=      4                                * 61C88
        C+P+1                                    * 61C8A
        P=      0                                * 61C8D
        RSTK=C                                   * 61C8F
        C=A     A                                * 61C91
        RSTK=C                                   * 61C93
        GOTO    L_61C4F                          * 61C95
L_61C99:
        C=RSTK                                   * 61C99
        B=C     A                                * 61C9B
        C=RSTK                                   * 61C9D
        CD0EX                                    * 61C9F
        RSTK=C                                   * 61CA2
        CD1EX                                    * 61CA4
        C=DAT0  A                                * 61CA7
        P=      4                                * 61CAA
        C+P+1                                    * 61CAC
        D=C     A                                * 61CAF
        D0=D0-  5                                * 61CB1
        GOSBVL  MOVEDOWN                         * 61CB4
        C=RSTK                                   * 61CBB
        CD0EX                                    * 61CBD
        C=B     A                                * 61CC0
        CD0EX                                    * 61CC2
        D0=D0-  5                                * 61CC5
        CD0EX                                    * 61CC8
        D0=D0+  5                                * 61CCB
        DAT0=C  A                                * 61CCE
        D0=D0-  5                                * 61CD1
        C=B     A                                * 61CD4
        C=C-D   A                                * 61CD6
        GOSBVL  WIPEOUT                          * 61CD8
        AD0EX                                    * 61CDF
        GOVLNG  GPOverWrALp                      * 61CE2

* obn..ob1 #n lam ->
* refs (9): 17D5F 46B9D 50D6E 605E5 84E40 8D799 ...
CACHE:
        CON(5)  (*)+5                            * 61CE9  primitive code object
        A=DAT1  A                                * 61CEE
        R2=A.F  A                                * 61CF1
        D1=D1+  5                                * 61CF7
        D=D+1   A                                * 61CFA
        GOSUBL  POP#~jump_4                      * 61CFC
        GOSBVL  SAVPTR                           * 61D02
        C=A     A                                * 61D09
        ST=1    1                                * 61D0B
        GOSUB   SUB_61D86                        * 61D0E
        A=DAT1  A                                * 61D12
        C=R0                                     * 61D15
        A=A-C   A                                * 61D18
        DAT1=A  A                                * 61D1A
        GOSUBL  GETPTR~jump_9                    * 61D1D
        C=R1                                     * 61D23
        A=C     A                                * 61D26
        A=A+A   A                                * 61D28
        A=A+A   A                                * 61D2A
        A=A+C   A                                * 61D2C
        CD1EX                                    * 61D2E
        C=C+A   A                                * 61D31
        D1=C                                     * 61D33
        GOTO    L_61A4E                          * 61D36
        RPL

* refs (4): 14E8B 17D5A 61D4D 61F9E
SAVELAM:
        LAM ""                                   * 61D3A

* ->
* refs (4): 143CA 38660 40D11 C63E8
SAVESTACK:
        CON(5)  (*)+5                            * 61D41  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 61D46
        LC(5)   SAVELAM                          * 61D4D
        R2=C                                     * 61D54
        LC(5)   EDITLINE                         * 61D57
        CD1EX                                    * 61D5E
        A=DAT1  A                                * 61D61
        D1=C                                     * 61D64
        C=A-C   A                                * 61D67
        GOSBVL  DIV5                             * 61D69
        C=C-1   A                                * 61D70
        ST=0    1                                * 61D72
        GOSUB   SUB_61D86                        * 61D75
        D0=D0+  5                                * 61D79
        AD0EX                                    * 61D7C
        DAT1=A  A                                * 61D7F
        GOTO    L_61F88                          * 61D82

* refs (2): 61D0E 61D75
SUB_61D86:
        R1=C                                     * 61D86
        ST=0    10                               * 61D89
L_61D8C:
        C=C+1   A                                * 61D8C
        C=C+1   A                                * 61D8E
        B=C     A                                * 61D90
        C=C+C   A                                * 61D92
        C=C+C   A                                * 61D94
        B=B+C   A                                * 61D96
        B=B+B   A                                * 61D98
        GOSBVL  ROOM                             * 61D9A
        ?B<=C   A                                * 61DA1
        GOYES   L_61DF3                          * 61DA4
        ?ST=0   10                               * 61DA6
        GOYES   L_61DC4                          * 61DA9
        GOSUBL  GETPTR~jump_9                    * 61DAB
        ?ST=1   1                                * 61DB1
        GOYES   L_61DBD                          * 61DB4
        GOVLNG  L_10F2D                          * 61DB6
L_61DBD:
        GOVLNG  DOMEMERR                         * 61DBD
L_61DC4:
        A=R2.F  A                                * 61DC4
        D0=(5)  OSAVE                            * 61DCA
        DAT0=A  A                                * 61DD1
        GOSUBL  GARBAGECOL~jump                  * 61DD4
        ST=1    10                               * 61DDA
        D0=(5)  OSAVE                            * 61DDD
        A=DAT0  A                                * 61DE4
        R2=A.F  A                                * 61DE7
        C=R1                                     * 61DED
        GONC    L_61D8C                          * 61DF0
L_61DF3:
        C=B     A                                * 61DF3
        R0=C                                     * 61DF5
        D0=(5)  TEMPENV                          * 61DF8
        C=DAT0  A                                * 61DFF
        GOSUBL  D0=DSKTOP                        * 61E02
        C=C-A   A                                * 61E08
        A=A-B   A                                * 61E0A
        D1=A                                     * 61E0C
        B=A     A                                * 61E0F
        GOSBVL  MOVEDOWN                         * 61E11
        C=R0                                     * 61E18
        P=      5                                * 61E1B
        LC(5)   #00000                           * 61E1D
        P=      0                                * 61E24
        DAT1=C  10                               * 61E26
        D0=(5)  DSKTOP                           * 61E2A
        A=B     A                                * 61E31
        DAT0=A  A                                * 61E33
        D0=(5)  TEMPENV                          * 61E36
        AD1EX                                    * 61E3D
        DAT0=A  A                                * 61E40
        D1=A                                     * 61E43
        GOSBVL  ADJMEM                           * 61E46
        A=B     A                                * 61E4D
        D0=A                                     * 61E4F
        D1=D1+  10                               * 61E52
        C=R2                                     * 61E55
        DAT1=C  A                                * 61E58
        CSL     W                                * 61E5B
        CSL     W                                * 61E5E
        CSL     W                                * 61E61
        CSL     W                                * 61E64
        CSL     W                                * 61E67
        A=R1                                     * 61E6A
        C=A     A                                * 61E6D
        D1=D1+  5                                * 61E6F
        A=A-1   A                                * 61E72
        GOC     L_61E9B                          * 61E74
        DAT1=C  10                               * 61E77
        D1=D1+  10                               * 61E7B
        A=A-1   A                                * 61E7E
        GOC     L_61E95                          * 61E80
L_61E83:
        C=DAT0  A                                * 61E83
        DAT1=C  10                               * 61E86
        D1=D1+  10                               * 61E8A
        D0=D0+  5                                * 61E8D
        A=A-1   A                                * 61E90
        GONC    L_61E83                          * 61E92
L_61E95:
        C=DAT0  A                                * 61E95
        D0=D0+  5                                * 61E98
L_61E9B:
        DAT1=C  A                                * 61E9B
        D1=(5)  EDITLINE                         * 61E9E
        RTN                                      * 61EA5

* NULLLAM -> ob1..obn #n
* refs (2): 60612 84E63
DUMP:
        CON(5)  (*)+5                            * 61EA7  primitive code object
        ST=1    1                                * 61EAC
        A=DAT1  A                                * 61EAF
        D1=D1+  5                                * 61EB2
        D=D+1   A                                * 61EB5
        GOSBVL  SAVPTR                           * 61EB7
        C=A     A                                * 61EBE
L_61EC0:
        RSTK=C                                   * 61EC0
        GOSUBL  GARBAGECOL~jump                  * 61EC2
        C=RSTK                                   * 61EC8
        D=C     A                                * 61ECA
        D0=(5)  TEMPENV                          * 61ECC
        C=DAT0  A                                * 61ED3
        D0=C                                     * 61ED6
        A=0     M                                * 61ED9
L_61EDC:
        A=DAT0  A                                * 61EDC
        C=C+A   A                                * 61EDF
        B=C     A                                * 61EE1
        D0=D0+  10                               * 61EE3
        C=DAT0  A                                * 61EE6
        ?D=C    A                                * 61EE9
        GOYES   L_61EF6                          * 61EEC
        C=B     A                                * 61EEE
        D0=C                                     * 61EF0
        GONC    L_61EDC                          * 61EF3
L_61EF6:
        ASRB                                     * 61EF6
        LC(5)   #00005                           * 61EF9
        A=A-C   A                                * 61F00
        D1=(5)  RSKTOP                           * 61F02
        C=DAT1  A                                * 61F09
        B=C     A                                * 61F0C
        D1=(5)  DSKTOP                           * 61F0E
        ?ST=1   1                                * 61F15
        GOYES   L_61F21                          * 61F18
        D1=(5)  EDITLINE                         * 61F1A
L_61F21:
        C=DAT1  A                                * 61F21
        RSTK=C                                   * 61F24
        C=C-B   A                                * 61F26
        ?C>=A   A                                * 61F28
        GOYES   L_61F33                          * 61F2B
        GOLONG  L_61DBD                          * 61F2D
L_61F33:
        C=RSTK                                   * 61F33
        C=C-A   A                                * 61F35
        D1=(5)  DSKTOP                           * 61F37
        ?ST=0   1                                * 61F3E
        GOYES   L_61F4C                          * 61F41
        CD1EX                                    * 61F43
        D1=D1+  5                                * 61F46
        CD1EX                                    * 61F49
L_61F4C:
        DAT1=C  A                                * 61F4C
        D1=C                                     * 61F4F
        D0=D0+  5                                * 61F52
        A=DAT0  A                                * 61F55
        B=A     A                                * 61F58
        D0=D0+  10                               * 61F5A
        A=A-1   A                                * 61F5D
        GOC     L_61F73                          * 61F5F
L_61F62:
        C=DAT0  A                                * 61F62
        DAT1=C  A                                * 61F65
        D0=D0+  10                               * 61F68
        D1=D1+  5                                * 61F6B
        A=A-1   A                                * 61F6E
        GONC    L_61F62                          * 61F70
L_61F73:
        GOSBVL  ADJMEM                           * 61F73
        ?ST=0   1                                * 61F7A
        GOYES   L_61F88                          * 61F7D
        A=B     A                                * 61F7F
        GOVLNG  PUSH#ALOOP                       * 61F81
L_61F88:
        GOVLNG  GETPTRLOOP                       * 61F88

* refs (1): 3DE59
OBJ_61F8F:
        CON(5)  (*)+5                            * 61F8F  primitive code object
        GOSBVL  SAVPTR                           * 61F94
        ST=0    1                                * 61F9B
        LC(5)   SAVELAM                          * 61F9E
        GOTO    L_61EC0                          * 61FA5

* ob -> ob flag
* refs (9): 16AB3 1CDD9 24DC0 269C2 26A87 270C0 ...
DUPROM-WORD?:
        CON(5)  (*)+5                            * 61FA9  primitive code object
        GOSUB   SAVPTR~jump_20                   * 61FAE
        GOTO    L_61FC7                          * 61FB2

* ob -> flag
* refs (4): 16E44 2FE0C 41502 72A02
ROM-WORD?:
        CON(5)  (*)+5                            * 61FB6  primitive code object
        D1=D1+  5                                * 61FBB
        D=D+1   A                                * 61FBE
        GOSUB   SAVPTR~jump_20                   * 61FC0
        D1=D1-  5                                * 61FC4
L_61FC7:
        GOSUB   Rom-Word?                        * 61FC7
        GOTO    GPPushT/FLp                      * 61FCB

* refs (2): 15C66 61FC7
Rom-Word?:
        A=DAT1  A                                * 61FCF
        LC(5)   CMOS                             * 61FD2
        ?C>A    A                                * 61FD9
        GOYES   L_61FE2                          * 61FDC
        GOTO    L_61FFF                          * 61FDE
L_61FE2:
        C=A     A                                * 61FE2
        RSTK=C                                   * 61FE4
        A=A-CON A,11                             * 61FE6
        GOSBVL  SUB_07ED8                        * 61FEC
        C=RSTK                                   * 61FF3
        CAEX    A                                * 61FF5
        GOC     L_61FFF                          * 61FF7
        ?C=A    A                                * 61FFA
        RTNYES                                   * 61FFD
L_61FFF:
        RTNCC                                    * 61FFF

* 1 2 3 4 -> 3 4 1 2
* refs (70): 1732E 17392 1F28E 1F2AC 2CAAD 2EB0A ...
2SWAP:
        CON(5)  (*)+5                            * 62001  primitive code object
        A=DAT1  10                               * 62006
        D1=D1+  10                               * 6200A
        C=DAT1  10                               * 6200D
        DAT1=A  10                               * 62011
        D1=D1-  10                               * 62015
        DAT1=C  10                               * 62018
        GOTO    L_62544                          * 6201C

* ob -> ob flag
* refs (11): 0F259 0FE94 35029 42D0F 68A26 6BE75 ...
DUPTYPECHAR?:
        CON(5)  DupAndThen                       * 62020  code object: the address of its machine code

* ob -> flag
* refs (4): 9A51C 9C28C 9C4A3 9CD6D
TYPECHAR?:
        CON(5)  (*)+5                            * 62025  primitive code object
        LC(5)   DOCHAR                           * 6202A
        GOTO    L_6205B                          * 62031

* ob -> ob flag
* refs (35): 10001 147C6 1538E 153F2 15491 154AF ...
DUPTYPEIDNT?:
        CON(5)  DupAndThen                       * 62035  code object: the address of its machine code

* ob -> flag
* refs (16): 0F1CD 27A4E 27F49 49C68 49DC6 4AA9A ...
TYPEIDNT?:
        CON(5)  (*)+5                            * 6203A  primitive code object
        LC(5)   DOIDNT                           * 6203F
        GOTO    L_6205B                          * 62046

* ob -> ob flag
* refs (22): 0FE49 0FF3E 0FFC5 1004C 10092 15540 ...
DUPTYPEEXT?:
        CON(5)  DupAndThen                       * 6204A  code object: the address of its machine code

* ob -> flag
* refs (11): 0F1F0 1006F 489FE 49252 49C86 4AC20 ...
TYPEEXT?:
        CON(5)  (*)+5                            * 6204F  primitive code object
        LC(5)   DOEXT                            * 62054
L_6205B:
        RSTK=C                                   * 6205B
        C=DAT1  A                                * 6205D
        CD1EX                                    * 62060
L_62063:
        A=DAT1  A                                * 62063
        D1=C                                     * 62066
        C=RSTK                                   * 62069
        ?C=A    A                                * 6206B
        GOYES   OverWrTLoop                      * 6206E
        GONC    OverWrFLoop                      * 62070

* <REF>GETPTR , OverWr TRUE/FALSE, Loop
GPOverWrT/FL:
        GONC    GPOverWrFLp                      * 62073

* <REF>GETPTR , OverWr TRUE, Loop
* refs (2): 304E9 30908
GPOverWrTLp:
        GOSBVL  GETPTR                           * 62076

* refs (1): 51B69
OverWrF/TLp:
        GOC     OverWrFLoop                      * 6207D

* OverWr TRUE, Loop 
* refs (4): 3F137 6206B 6209D 62108
OverWrTLoop:
        P=      0                                * 62080
        LC(5)   TRUE                             * 62082
        DAT1=C  A                                * 62089
        A=DAT0  A                                * 6208C
        D0=D0+  5                                * 6208F
        PC=(A)                                   * 62092

* <REF>GETPTR , OverWr FALSE, Loop
* refs (4): 17B7A 30538 62073 72CFA
GPOverWrFLp:
        GOSBVL  GETPTR                           * 62096

* OverWr TRUE/FALSE, Loop
* refs (1): 34A4F
OverWrT/FLp:
        GOC     OverWrTLoop                      * 6209D

* OverWr FALSE, Loop
* refs (5): 3511F 61C16 62070 6207D 62111
OverWrFLoop:
        P=      0                                * 620A0
        LC(5)   FALSE                            * 620A2
        DAT1=C  A                                * 620A9
        A=DAT0  A                                * 620AC
        D0=D0+  5                                * 620AF
        PC=(A)                                   * 620B2

* <REF>GETPTR , Push TRUE/FALSE, Loop
* refs (4): 3525D 42ABD 61FCB 628CB
GPPushT/FLp:
        GONC    GPPushFLoop                      * 620B6

* <REF>GETPTR , Push TRUE, Loop
* refs (4): 30722 309DD 3147F 6415F
GPPushTLoop:
        GOSBVL  GETPTR                           * 620B9

* Push FALSE (CRY)/TRUE, Loop
* refs (2): 9E2DE CF0BA
PushF/TLoop:
        GOC     PushFLoop                        * 620C0

* Push TRUE, Loop
* refs (25): 0476D 0E2FB 0E7E9 0EA43 14E9E 17A63 ...
PushTLoop:
        P=      0                                * 620C3
        LC(5)   TRUE                             * 620C5
        A=C     A                                * 620CC
        PC=(A)                                   * 620CE

* <REF>GETPTR , Push FALSE, Loop
* refs (4): 1114F 306A6 620B6 64166
GPPushFLoop:
        GOSBVL  GETPTR                           * 620D2

* Push TRUE (CRY)/FALSE, Loop
* refs (15): 08D43 0CB0F 1152C 13E7E 179C9 2EC7D ...
PushT/FLoop:
        GOC     PushTLoop                        * 620D9

* Push FALSE, Loop
* refs (20): 04777 0E2F4 0E7F0 14E97 1823B 18671 ...
PushFLoop:
        P=      0                                * 620DC
        LC(5)   FALSE                            * 620DE
        A=C     A                                * 620E5
        PC=(A)                                   * 620E7

* # #' -> # flag
* refs (20): 04D6E 27648 36629 36714 37B8F 584C1 ...
OVER#=:
        CON(5)  (*)+5                            * 620EB  primitive code object
        GOSUBL  POP2#~jump_2                     * 620F0
        D=D-1   A                                * 620F6
        D1=D1-  5                                * 620F8
        ?C=A    A                                * 620FB
        GOYES   PushTLoop                        * 620FE
        GONC    PushFLoop                        * 62100

* ob -> T
* refs (25): 0C7E9 0DDDF 15084 17432 2D5D2 2F379 ...
DROPTRUE:
        CON(5)  (*)+5                            * 62103  primitive code object
        GOTO    OverWrTLoop                      * 62108

* ob -> F
* refs (77): 0C213 0DC59 0F1EB 1001F 144A2 169D7 ...
DROPFALSE:
        CON(5)  (*)+5                            * 6210C  primitive code object
        GOTO    OverWrFLoop                      * 62111

* ob -> ob flag
* refs (4): 62A07 62A39 D1FA4 D2004
DUPTYPELAM?:
        CON(5)  DupAndThen                       * 62115  code object: the address of its machine code

* ob -> flag
* refs (13): 14A1E 14A78 16F5C 21E32 27A58 2E7B3 ...
TYPELAM?:
        CON(5)  (*)+5                            * 6211A  primitive code object
        LC(5)   DOLAM                            * 6211F
        GOTO    L_6205B                          * 62126

* ob -> ob flag
* refs (32): 1A007 40049 40071 4009E 4E92E 4E94C ...
DUPTYPEBINT?:
        CON(5)  DupAndThen                       * 6212A  code object: the address of its machine code

* ob -> flag
* refs (17): 092CB 0C74E 293E5 2FB6E 48DF1 49289 ...
TYPEBINT?:
        CON(5)  (*)+5                            * 6212F  primitive code object
        LC(5)   DOBINT                           * 62134
        GOTO    L_6205B                          * 6213B

* ob -> ob flag
DUPTYPEHSTR?:
        CON(5)  DupAndThen                       * 6213F  code object: the address of its machine code

* ob -> flag
* refs (9): 4AA19 4B7E2 4C65C 4C6CA 4C6D4 51541 ...
TYPEHSTR?:
        CON(5)  (*)+5                            * 62144  primitive code object
        LC(5)   DOHSTR                           * 62149
        GOTO    L_6205B                          * 62150

* ob -> ob flag
* refs (41): 0F24A 0FEEE 10239 10752 14097 2E664 ...
DUPTYPECSTR?:
        CON(5)  DupAndThen                       * 62154  code object: the address of its machine code

* ob -> flag
* refs (15): 0DF75 10A31 10AC7 10BD7 2F7AE 2F876 ...
TYPECSTR?:
        CON(5)  (*)+5                            * 62159  primitive code object
        LC(5)   DOCSTR                           * 6215E
        GOTO    L_6205B                          * 62165

* ob -> ob flag
* refs (73): 0C690 0F22C 0FF1B 0FFA2 1DB65 1DF67 ...
DUPTYPEREAL?:
        CON(5)  DupAndThen                       * 62169  code object: the address of its machine code

* ob -> flag
* refs (38): 1554A 174E6 1871F 1E016 1F7EE 1F7F8 ...
TYPEREAL?:
        CON(5)  (*)+5                            * 6216E  primitive code object
        LC(5)   DOREAL                           * 62173
        GOTO    L_6205B                          * 6217A

* ob -> ob flag
* refs (8): 0C726 4504C 450CE 458A2 45F76 45F8A ...
DUPTYPECMP?:
        CON(5)  DupAndThen                       * 6217E  code object: the address of its machine code

* ob -> flag
* refs (19): 16A2C 33D50 45164 451B9 465C7 48F68 ...
TYPECMP?:
        CON(5)  (*)+5                            * 62183  primitive code object
        LC(5)   DOCMP                            * 62188
        GOTO    L_6205B                          * 6218F

* ob -> ob flag
* refs (6): 193C6 4C580 63DA8 8D085 8D12A B4DB4
DUPTYPEARRY?:
        CON(5)  DupAndThen                       * 62193  code object: the address of its machine code

* ob -> flag
* refs (5): 16A40 36304 CC4DC CC55A CC5BE
TYPEARRAY?:
        CON(5)  (*)+5                            * 62198  primitive code object
        LC(5)   DOARRY                           * 6219D
        GOTO    L_6205B                          * 621A4

* ob -> ob flag
* refs (10): 10010 3A6B3 60E50 62B24 68AB7 6ACC1 ...
DUPTYPEROMP?:
        CON(5)  DupAndThen                       * 621A8  code object: the address of its machine code

* ob -> flag
* refs (4): 27BE8 58E4F 62A8E 68F08
TYPEROMP?:
        CON(5)  (*)+5                            * 621AD  primitive code object
        LC(5)   DOROMP                           * 621B2
        GOTO    L_6205B                          * 621B9

* ob -> ob flag
* refs (11): 093BB 09813 147E4 17AE0 185A9 20C3F ...
DUPTYPERRP?:
        CON(5)  DupAndThen                       * 621BD  code object: the address of its machine code

* ob -> flag
* refs (11): 17252 18079 18100 184FF 18563 35437 ...
TYPERRP?:
        CON(5)  (*)+5                            * 621C2  primitive code object
        LC(5)   DORRP                            * 621C7
        GOTO    L_6205B                          * 621CE

* ob -> ob flag
* refs (19): 28B6E 34E67 49C5E 4AC07 4BCBA 5050F ...
DUPTYPESYMB?:
        CON(5)  DupAndThen                       * 621D2  code object: the address of its machine code

* ob -> flag
* refs (4): 354CD 4DADA 546DE 5A117
TYPESYMB?:
        CON(5)  (*)+5                            * 621D7  primitive code object
        LC(5)   DOSYMB                           * 621DC
        GOTO    L_6205B                          * 621E3

* ob -> ob flag
* refs (21): 1478F 15160 2593E 271D9 354C3 3F072 ...
DUPTYPECOL?:
        CON(5)  DupAndThen                       * 621E7  code object: the address of its machine code

* ob -> flag
* refs (4): 147F8 16ABD 4088C B9C54
TYPECOL?:
        CON(5)  (*)+5                            * 621EC  primitive code object
        LC(5)   DOCOL                            * 621F1
        GOTO    L_6205B                          * 621F8

* ob -> ob flag
* refs (4): 31D83 8BB14 C0B81 DCBE7
DUPTYPEGROB?:
        CON(5)  DupAndThen                       * 621FC  code object: the address of its machine code

* ob -> flag
* refs (4): 31A61 4DC21 4ED16 DD23B
TYPEGROB?:
        CON(5)  (*)+5                            * 62201  primitive code object
        LC(5)   DOGROB                           * 62206
        GOTO    L_6205B                          * 6220D

* ob -> ob flag
* refs (75): 14B31 15228 15246 15304 17441 19448 ...
DUPTYPELIST?:
        CON(5)  DupAndThen                       * 62211  code object: the address of its machine code

* ob -> flag
* refs (18): 09375 1531D 16C7A 1725C 34E4E 34FBB ...
TYPELIST?:
        CON(5)  (*)+5                            * 62216  primitive code object
        LC(5)   DOLIST                           * 6221B
        GOTO    L_6205B                          * 62222

* ob -> ob flag
DUPTYPETAG?:
        CON(5)  DupAndThen                       * 62226  code object: the address of its machine code

* ob -> flag
* refs (1): 6477F
TYPETAGGED?:
        CON(5)  (*)+5                            * 6222B  primitive code object
        LC(5)   DOTAG                            * 62230
        GOTO    L_6205B                          * 62237

* ob -> flag
* refs (28): 17865 194C5 1CDBB 1DCCD 35E5E 35F3A ...
TYPERARRY?:
        CON(5)  (*)+5                            * 6223B  primitive code object
        LC(5)   DOREAL                           * 62240
L_62247:
        RSTK=C                                   * 62247
        C=DAT1  A                                * 62249
        CD1EX                                    * 6224C
        D1=D1+  10                               * 6224F
        GOTO    L_62063                          * 62252

* ob -> flag
* refs (4): 194E3 363AE 8F195 8F309
TYPECARRY?:
        CON(5)  (*)+5                            * 62256  primitive code object
        LC(5)   DOCMP                            * 6225B
        GOTO    L_62247                          * 62262

* # -> # flag
* refs (76): 09320 0B6AB 0E72E 106E4 108F6 127C0 ...
DUP#0=:
        CON(5)  (*)+5                            * 62266  primitive code object
        GOSUB   SUB_62278                        * 6226B
L_6226F:
        ?A=0    A                                * 6226F
        GOYES   L_62274                          * 62272
L_62274:
        GOTO    PushT/FLoop                      * 62274

* refs (5): 6130A 6226B 622CA 622D9 626FC
SUB_62278:
        C=DAT1  A                                * 62278
        CD1EX                                    * 6227B
        D1=D1+  5                                * 6227E
        A=DAT1  A                                * 62281
        D1=C                                     * 62284
        RTN                                      * 62287

* # -> flag
* refs (25): 16EC1 17176 17491 28F1A 33120 368B8 ...
#3=:
        CON(5)  (*)+5                            * 62289  primitive code object
        GOSUB   POP#~jump_4                      * 6228E
        A=A-1   A                                * 62292
L_62294:
        A=A-1   A                                * 62294
        GOTO    L_622B0                          * 62296

* # -> flag
* refs (31): 1523C 368C2 3F92B 3F96C 3F9A8 467B6 ...
#2=:
        CON(5)  (*)+5                            * 6229A  primitive code object
        GOSUB   POP#~jump_4                      * 6229F
        GOTO    L_62294                          * 622A3

* # -> flag
* refs (86): 093A7 0C668 152C3 1DD65 20C17 29458 ...
#1=:
        CON(5)  (*)+5                            * 622A7  primitive code object
        GOSUB   POP#~jump_4                      * 622AC
L_622B0:
        A=A-1   A                                * 622B0
        GOTO    L_6226F                          * 622B2

* # -> flag
* refs (20): 0C762 108D3 17BB3 1DB79 28B87 39CB6 ...
#1<>:
        CON(5)  (*)+5                            * 622B6  primitive code object
        GOSUB   POP#~jump_4                      * 622BB
        A=A-1   A                                * 622BF
        GOTO    L_622DD                          * 622C1

* # -> # flag
* refs (28): 16EA3 25264 252D7 290C3 33111 3F7BE ...
DUP#1=:
        CON(5)  (*)+5                            * 622C5  primitive code object
        GOSUB   SUB_62278                        * 622CA
        A=A-1   A                                * 622CE
        GOTO    L_6226F                          * 622D0

* # -> # flag
* refs (21): 1088D 1D31D 2B278 42F85 42FBC 42FEE ...
DUP#0<>:
        CON(5)  (*)+5                            * 622D4  primitive code object
        GOSUB   SUB_62278                        * 622D9
L_622DD:
        ?A#0    A                                * 622DD
        GOYES   L_62274                          * 622E0
        GONC    L_62274                          * 622E2
        RPL

* $ $' -> $'+$
* refs (22): 148E3 14A00 14A91 16D68 17950 2D997 ...
!insert$:
        :: ERRSET                                * 622E5

* $ $' -> $'+$
* refs (23): 0D33F 0F321 15612 1ACCA 2632E 414D0 ...
SWAP&$:
          :: SWAP &$ ; ERRTRAP !!append$? ;      * 622EF

* $ $' -> $+$'
* refs (2): 62308 6238A
!!append$?:
        :: INTEMNOTREF? ROTSWAP case             * 62312
          :: INTEMNOTREF? NOTcase !!insert$      * 62326
            OVERLEN$ OVERLEN$ #> case !!insert$  * 6233A
            SWAP !!append$ ;                     * 62353
          CKREF SWAP !!append$ ;                 * 62362

* $ $' -> $+$'
* refs (47): 04283 148E8 14A05 14A96 14ABE 14B45 ...
!append$:
        :: ERRSET &$ ERRTRAP !!append$? ;        * 62376

* $ $' -> $'+$
* refs (9): 15D88 15DE7 15E5B 15EC4 161AD 161C6 ...
!!insert$:
        CON(5)  (*)+5                            * 62394  primitive code object
        ASSEMBLE
        ST=1    3                                * 62399
        GOTO    L_623A8                          * 6239C

* $ $' -> $+$'
* refs (14): 15D6A 15DE2 15E79 15ECE 2D979 2D983 ...
!!append$:
        CON(5)  (*)+5                            * 623A0  primitive code object
        ST=0    3                                * 623A5
L_623A8:
        GOSBVL  SAVPTR                           * 623A8
        ST=0    10                               * 623AF
        A=DAT1  A                                * 623B2
        D1=A                                     * 623B5
        D1=D1+  5                                * 623B8
        A=DAT1  A                                * 623BB
        LC(5)   #00005                           * 623BE
        C=A-C   A                                * 623C5
        ?C=0    A                                * 623C7
        GOYES   L_623F9                          * 623CA
L_623CC:
        D=C     A                                * 623CC
        GOSBVL  ROOM                             * 623CE
        DCEX    A                                * 623D5
        ?D>=C   A                                * 623D7
        GOYES   L_623FD                          * 623DA
        ?ST=1   10                               * 623DC
        GOYES   L_623EF                          * 623DF
        RSTK=C                                   * 623E1
        GOSUB   GARBAGECOL~jump                  * 623E3
        ST=1    10                               * 623E7
        C=RSTK                                   * 623EA
        GONC    L_623CC                          * 623EC
L_623EF:
        GOSUB   GETPTR~jump_9                    * 623EF
        GOLONG  L_61DBD                          * 623F3
L_623F9:
        GOTO    L_62467                          * 623F9
L_623FD:
        GOSUBL  D0=DSKTOP                        * 623FD
        D0=D0+  5                                * 62403
        A=DAT0  A                                * 62406
        B=A     A                                * 62409
        D0=A                                     * 6240B
        D0=D0+  5                                * 6240E
        A=C     A                                * 62411
        C=DAT0  A                                * 62413
        D=C     A                                * 62416
        C=C+A   A                                * 62418
        DAT0=C  A                                * 6241A
        CD0EX                                    * 6241D
        C=C+D   A                                * 62420
        D0=C                                     * 62422
        C=DAT0  A                                * 62425
        C=C+A   A                                * 62428
        DAT0=C  A                                * 6242A
        R0=A                                     * 6242D
        C=A     A                                * 62430
        ?ST=0   3                                * 62432
        GOYES   L_6243F                          * 62435
        A=B     A                                * 62437
        D0=A                                     * 62439
        D0=D0+  10                               * 6243C
L_6243F:
        AD0EX                                    * 6243F
        GOSBVL  MOVERSU                          * 62442
        A=B     A                                * 62449
        D1=A                                     * 6244B
        GOSUBL  D0=DSKTOP                        * 6244E
        A=DAT0  A                                * 62454
        D0=A                                     * 62457
        D0=D0+  10                               * 6245A
        C=R0                                     * 6245D
        GOSBVL  MOVEDOWN                         * 62460
L_62467:
        GOSUB   GETPTR~jump_9                    * 62467
        D1=D1+  5                                * 6246B
        D=D+1   A                                * 6246E
        GOTO    L_62544                          * 62470

* ->
* refs (2): 2376D 5EA0E
'RSAVEWORD:
        CON(5)  (*)+5                            * 62474  primitive code object
        AD0EX                                    * 62479
        C=B     A                                * 6247C
        D0=C                                     * 6247E
        D0=D0-  5                                * 62481
        C=DAT0  A                                * 62484
        C=C-CON A,10                             * 62487
        D0=(5)  LASTROMWDOB                      * 6248D
        DAT0=C  A                                * 62494
        D0=A                                     * 62497
        GOTO    L_62544                          * 6249A

* refs (10): 61C21 61CFC 6228E 6229F 622AC 622BB ...
POP#~jump_4:
        GOVLNG  POP#                             * 6249E

* refs (5): 6182D 61C73 61DD4 61EC2 623E3
GARBAGECOL~jump:
        GOVLNG  GARBAGECOL                       * 624A5

* refs (7): 61833 61C66 61C79 61D1D 61DAB 623EF ...
GETPTR~jump_9:
        GOVLNG  GETPTR                           * 624AC

* refs (11): 61FAE 61FC0 62704 627C3 627E2 628A0 ...
SAVPTR~jump_20:
        GOVLNG  SAVPTR                           * 624B3

* # #' -> #''
* refs (52): 140D8 1430A 15CE8 3A062 3A15C 3A5AA ...
#MIN:
        CON(5)  (*)+5                            * 624BA  primitive code object
        ST=0    1                                * 624BF
        GOTO    L_624CE                          * 624C2

* # #' -> #''
* refs (20): 43BCB 4415B 44D22 666AB 666BA 66992 ...
#MAX:
        CON(5)  (*)+5                            * 624C6  primitive code object
        ST=1    1                                * 624CB
L_624CE:
        GOSBVL  POP#                             * 624CE
        R0=A                                     * 624D5
        GOSBVL  POP#                             * 624D8
        GOSBVL  SAVPTR                           * 624DF
        C=R0                                     * 624E6
        ?C<A    A                                * 624E9
        GOYES   L_624F0                          * 624EC
        CAEX    A                                * 624EE
L_624F0:
        ?ST=1   1                                * 624F0
        GOYES   L_62504                          * 624F3
        A=C     A                                * 624F5
        GOTO    L_62504                          * 624F7

* # #' -> (#-#')/2
* refs (2): 4CF19 4CF28
#-#2/:
        CON(5)  (*)+5                            * 624FB  primitive code object
        GOSUB   #-#2/~1                          * 62500
L_62504:
        GOVLNG  PUSH#ALOOP                       * 62504

* refs (1): 62500
#-#2/~1:
        GOSBVL  POP#                             * 6250B
        R0=A.F  A                                * 62512
        GOSBVL  POP#                             * 62518
        GOSBVL  SAVPTR                           * 6251F
        C=R0.F  A                                * 62526
        A=A-C   A                                * 6252C
        ASRB.F  A                                * 6252E
        RTN                                      * 62533

* ob -> #0
* refs (22): 1411E 172ED 45DBB 46CE8 46D42 49AB5 ...
DROPZERO:
        CON(5)  (*)+5                            * 62535  primitive code object
        LC(5)   BINT0                            * 6253A
        DAT1=C  A                                * 62541
L_62544:
        A=DAT0  A                                * 62544
        D0=D0+  5                                * 62547
        PC=(A)                                   * 6254A

* ob ob -> #0 #0
* refs (1): 0F97C
2DROP00:
        CON(5)  (*)+5                            * 6254E  primitive code object
        LC(5)   BINT0                            * 62553
        DAT1=C  A                                * 6255A
        D1=D1+  5                                * 6255D
        DAT1=C  A                                * 62560
        D1=D1-  5                                * 62563
        GOTO    L_62544                          * 62566

* # -> #+3
* refs (59): 09804 0B5ED 10379 103A1 10496 10504 ...
#3+:
        CON(5)  (*)+5                            * 6256A  primitive code object
        LC(5)   #00003                           * 6256F
        GOTO    L_62636                          * 62576

* # -> #+4
* refs (17): 1034C 10955 27A2B 43A95 43B62 43BF3 ...
#4+:
        CON(5)  (*)+5                            * 6257A  primitive code object
        LC(5)   #00004                           * 6257F
        GOTO    L_62636                          * 62586

* # -> #+5
* refs (14): 0901B 104F0 2F432 3F59D 41102 41D4C ...
#5+:
        CON(5)  (*)+5                            * 6258A  primitive code object
        LC(5)   #00005                           * 6258F
        GOTO    L_62636                          * 62596

* # -> #+6
* refs (11): 65B73 66412 675E9 675FD 6D3DE 6D751 ...
#6+:
        CON(5)  (*)+5                            * 6259A  primitive code object
        LC(5)   #00006                           * 6259F
        GOTO    L_62636                          * 625A6

* # -> #+7
* refs (10): BB668 BB6A0 BBA2E BBA43 BBFA1 BBFCA ...
#7+:
        CON(5)  (*)+5                            * 625AA  primitive code object
        LC(5)   #00007                           * 625AF
        GOTO    L_62636                          * 625B6

* # -> #+8
* refs (12): 0E01A 0E105 1275C 65B41 6D936 8E992 ...
#8+:
        CON(5)  (*)+5                            * 625BA  primitive code object
        LC(5)   #00008                           * 625BF
        GOTO    L_62636                          * 625C6

* # -> #+9
* refs (8): 65ADD 65F08 66110 66133 D9192 D92F2 ...
#9+:
        CON(5)  (*)+5                            * 625CA  primitive code object
        LC(5)   #00009                           * 625CF
        GOTO    L_62636                          * 625D6

* # -> #+10
* refs (3): CE62A D9173 D9383
#10+:
        CON(5)  (*)+5                            * 625DA  primitive code object
        LC(5)   portnotaverr                     * 625DF
        GOTO    L_62636                          * 625E6

* # -> #+12
* refs (16): 6CFE2 6D8C8 8D988 8DAD3 8E8FF 8E941 ...
#12+:
        CON(5)  (*)+5                            * 625EA  primitive code object
        LC(5)   #0000C                           * 625EF
        GOTO    L_62636                          * 625F6

* # -> #-3
* refs (35): 102BB 10446 105DB 10621 1068F 106BC ...
#3-:
        CON(5)  (*)+5                            * 625FA  primitive code object
        LC(5)   #FFFFD                           * 625FF
        GOTO    L_62636                          * 62606

* # -> #-4
* refs (20): 1040F 105A9 32066 33049 43BD0 43C6B ...
#4-:
        CON(5)  (*)+5                            * 6260A  primitive code object
        LC(5)   #FFFFC                           * 6260F
        GOTO    L_62636                          * 62616

* # -> #-5
* refs (9): 10C09 64177 660A2 6C2F8 6D968 6DAD5 ...
#5-:
        CON(5)  (*)+5                            * 6261A  primitive code object
        LC(5)   #FFFFB                           * 6261F
        GOTO    L_62636                          * 62626

* # -> #-6
* refs (6): 41D29 65C63 D1394 D1C67 D7D0D D7DFE
#6-:
        CON(5)  (*)+5                            * 6262A  primitive code object
        LC(5)   #FFFFA                           * 6262F
L_62636:
        RSTK=C                                   * 62636
        GOSBVL  POP#                             * 62638
        GOSBVL  SAVPTR                           * 6263F
        C=RSTK                                   * 62646
        A=A+C   A                                * 62648
        GOTO    L_6266D                          * 6264A

* # -> #*10
* refs (5): 13B7E 2E2D2 3A5B4 4420F D87E2
#10*:
        CON(5)  (*)+5                            * 6264E  primitive code object
        GOSBVL  POP#                             * 62653
        GOSBVL  SAVPTR                           * 6265A
        C=A     A                                * 62661
        A=A+A   A                                * 62663
        A=A+A   A                                * 62665
        A=A+A   A                                * 62667
        C=C+C   A                                * 62669
L_6266B:
        A=A+C   A                                * 6266B
L_6266D:
        GOVLNG  PUSH#ALOOP                       * 6266D

* # -> #*8
* refs (10): 7CEC8 8DB25 8DEBA 8E97E 986F9 D0A2B ...
#8*:
        CON(5)  (*)+5                            * 62674  primitive code object
        GOSBVL  POP#                             * 62679
        GOSBVL  SAVPTR                           * 62680
        A=A+A   A                                * 62687
        A=A+A   A                                * 62689
        A=A+A   A                                * 6268B
        GOTO    L_6266D                          * 6268D

* # -> #*6
* refs (7): 13B6F 2F501 41157 416F6 41D24 44200 ...
#6*:
        CON(5)  (*)+5                            * 62691  primitive code object
        GOSBVL  POP#                             * 62696
        GOSBVL  SAVPTR                           * 6269D
        A=A+A   A                                * 626A4
        C=A     A                                * 626A6
        A=A+A   A                                * 626A8
        GOTO    L_6266B                          * 626AA

* Skips 5 objects, then does COLA.
5skipcola:
        CON(5)  (*)+5                            * 626AE  primitive code object
        GOSBVL  SKIPOB                           * 626B3
        GOSBVL  SKIPOB                           * 626BA
3skipcola~1:
        GOSBVL  SKIPOB                           * 626C1
2skipcola~1:
        GOSBVL  SKIPOB                           * 626C8
skipcola~1:
        GOSBVL  SKIPOB                           * 626CF
        GOLONG  L_6199F                          * 626D6

* Does 3SKIP, then COLA.
3skipcola:
        CON(5)  (*)+5                            * 626DC  primitive code object
        GOTO    3skipcola~1                      * 626E1

* Does 2SKIP, then COLA.
* refs (2): 27D28 69A4F
2skipcola:
        CON(5)  (*)+5                            * 626E5  primitive code object
        GOTO    2skipcola~1                      * 626EA

* Does SKIP, then COLA.
* refs (5): 283CE 545E6 54DAD 54E9A 5DFD0
skipcola:
        CON(5)  (*)+5                            * 626EE  primitive code object
        GOTO    skipcola~1                       * 626F3

* # -> # #+2
* refs (21): 0E4E8 0E4F2 219AE 2D960 5AD0D 5D5BF ...
DUP#2+:
        CON(5)  (*)+5                            * 626F7  primitive code object
        GOSUB   SUB_62278                        * 626FC
        A=A+1   A                                * 62700
        A=A+1   A                                * 62702
L_62704:
        GOSUB   SAVPTR~jump_20                   * 62704
        GOTO    L_627CE                          * 62708

* 1 2 3 -> 2 1
* refs (33): 09007 093F7 10441 17329 1DACF 1F457 ...
DROPSWAP:
        CON(5)  (*)+5                            * 6270C  primitive code object
        D=D+1   A                                * 62711
        C=DAT1  10                               * 62713
        D1=D1+  10                               * 62717
        C=DAT1  A                                * 6271A
        D1=D1-  5                                * 6271D
        GOLONG  L_6139A                          * 62720

* 1 2 3 -> 2
* refs (43): 102B1 16E53 16FE3 291E4 2F6AF 2F795 ...
DROPSWAPDROP:
        CON(5)  (*)+5                            * 62726  primitive code object
        D=D+1   A                                * 6272B
        D=D+1   A                                * 6272D
        D1=D1+  5                                * 6272F
        A=DAT1  A                                * 62732
        D1=D1+  5                                * 62735
        GOLONG  L_6102F                          * 62738
L_6273E:
        GOSUBL  SafGarbD-1~jump                  * 6273E
        GONC    L_62751                          * 62744  always taken

* 1 2 -> 2 1 1
* refs (53): 0D30E 0E1E2 0E1EC 1561C 16C75 177D9 ...
SWAPDUP:
        CON(5)  (*)+5                            * 62747  primitive code object
        D=D-1   A                                * 6274C
        GOC     L_6273E                          * 6274E
L_62751:
        A=DAT1  A                                * 62751
        D1=D1+  5                                * 62754
        C=DAT1  A                                * 62757
        DAT1=A  A                                * 6275A
L_6275D:
        D1=D1-  5                                * 6275D
        DAT1=C  A                                * 62760
        D1=D1-  5                                * 62763
        GOLONG  L_610ED                          * 62766
L_6276C:
        GOSUBL  SafGarbD-1~jump                  * 6276C
        GONC    L_6277F                          * 62772  always taken

* 1 2 3 -> 2 3 1 1
* refs (14): 092C6 0E466 17374 366E7 6FAEB 72341 ...
ROTDUP:
        CON(5)  (*)+5                            * 62775  primitive code object
        D=D-1   A                                * 6277A
        GOC     L_6276C                          * 6277C
L_6277F:
        A=DAT1  10                               * 6277F
        D1=D1+  10                               * 62783
        C=DAT1  A                                * 62786
        D1=D1-  5                                * 62789
        DAT1=A  10                               * 6278C
        GOTO    L_6275D                          * 62790

* # #' -> #'-#
* refs (31): 277DD 27EAE 29561 430FC 4E9EC 4EB8B ...
SWAP#-:
        CON(5)  (*)+5                            * 62794  primitive code object
        GOSUBL  POP2#~jump_2                     * 62799
        CAEX    A                                * 6279F
        A=A-C   A                                * 627A1
        GOTO    L_62704                          * 627A3

* 1 2 -> 1 1
* refs (39): 10432 10833 127CF 147EE 14A19 1F7AD ...
DROPDUP:
        CON(5)  (*)+5                            * 627A7  primitive code object
        D1=D1+  5                                * 627AC
        A=DAT1  A                                * 627AF
        D1=D1-  5                                * 627B2
        GOLONG  L_6102F                          * 627B5

* $ -> $ #
* refs (35): 12775 16266 178BF 225FA 244AB 25637 ...
DUPLEN$:
        CON(5)  (*)+5                            * 627BB  primitive code object
        A=DAT1  A                                * 627C0
        GOSUB   SAVPTR~jump_20                   * 627C3
        GOSBVL  SUB_120CC                        * 627C7
L_627CE:
        GOVLNG  PUSH#ALOOP                       * 627CE

* # #' -> #+#' #+#'
* refs (7): 8E988 905C5 93E6B 940E7 94367 958A6 ...
#+DUP:
        CON(5)  (*)+5                            * 627D5  primitive code object
        GOSUBL  POP2#~jump_2                     * 627DA
        A=A+C   A                                * 627E0
L_627E2:
        GOSUBL  SAVPTR~jump_20                   * 627E2
        R0=A                                     * 627E8

* <REF>GETPTR , Push R0 & A as #, Loop
Push2#aLoop:
        R1=A.F  A                                * 627EB
        GOVLNG  Push2#Loop                       * 627F1

* # #' -> #-#' #-#'
* refs (6): 152BE 4CCA8 6D33E 6EE1F D0057 D1DDC
#-DUP:
        CON(5)  (*)+5                            * 627F8  primitive code object
        GOSUBL  POP2#~jump_2                     * 627FD
        A=A-C   A                                * 62803
        GOTO    L_627E2                          * 62805

* # -> #+1 #+1
* refs (26): 05313 109DC 10A27 17117 254CA 437FC ...
#1+DUP:
        CON(5)  (*)+5                            * 62809  primitive code object
        GOSUBL  POP#~jump_4                      * 6280E
        A=A+1   A                                * 62814
        GOTO    L_627E2                          * 62816

* # -> #-1 #-1
* refs (15): 296AB 2D7B7 4AB80 4AC7A 4C9CE 5F99B ...
#1-DUP:
        CON(5)  (*)+5                            * 6281A  primitive code object
        GOSUB   POP#~jump_4                      * 6281F
        A=A-1   A                                * 62823
        GOTO    L_627E2                          * 62825

* refs (9): 620F0 62799 627DA 627FD 628A6 628C0 ...
POP2#~jump_2:
        GOVLNG  POP2#                            * 62829

* 1 2 -> 2 2
* refs (12): 0F1AF 147F3 1F898 25095 3694E 4952D ...
SWAPDROPDUP:
        CON(5)  (*)+5                            * 62830  primitive code object
        A=DAT1  A                                * 62835
        D1=D1+  5                                * 62838
        DAT1=A  A                                * 6283B
        D1=D1-  5                                * 6283E
        A=DAT0  A                                * 62841
        D0=D0+  5                                * 62844
        PC=(A)                                   * 62847

* 1 2 3 -> 3 1
* refs (18): 16F39 197D2 280B6 35487 3648F 48EA5 ...
SWAPDROPSWAP:
        CON(5)  (*)+5                            * 6284B  primitive code object
        D=D+1   A                                * 62850
        C=DAT1  A                                * 62852
        D1=D1+  10                               * 62855
        A=DAT1  A                                * 62858
        DAT1=C  A                                * 6285B
        GOLONG  L_6102C                          * 6285E

* 1 2 3 4 -> 2 3 4
* refs (34): 1D506 25081 2546B 25470 25510 25920 ...
4ROLLDROP:
        CON(5)  (*)+5                            * 62864  primitive code object
L_62869:
        D=D+1   A                                * 62869
        A=DAT1  15                               * 6286B
        D1=D1+  5                                * 6286F
        DAT1=A  15                               * 62872
        A=DAT0  A                                * 62876
        D0=D0+  5                                * 62879
        PC=(A)                                   * 6287C

* 1 2 3 4 5 -> 2 3 4 5
* refs (20): 16F70 173C4 25ADE 2C6C0 3659D 365A2 ...
5ROLLDROP:
        CON(5)  (*)+5                            * 62880  primitive code object
        D1=D1+  15                               * 62885
        A=DAT1  A                                * 62888
        D1=D1+  5                                * 6288B
        DAT1=A  A                                * 6288E
        D1=D1-  5                                * 62891
        D1=D1-  15                               * 62894
        GOTO    L_62869                          * 62897

* # #' -> # #' flag
* refs (12): 18C63 3A0AD 4111B 46CF2 46D4C 4DC8A ...
2DUP#<:
        CON(5)  (*)+5                            * 6289B  primitive code object
        GOSUBL  SAVPTR~jump_20                   * 628A0
        GOSUBL  POP2#~jump_2                     * 628A6
        ?C>A    A                                * 628AC
        GOYES   L_628CB                          * 628AF
        GOTO    L_628CB                          * 628B1

* # #' -> # #' flag
* refs (23): 3A152 43BB2 6A28F 6A4BF 6A5AF 7CF22 ...
2DUP#=:
        CON(5)  (*)+5                            * 628B5  primitive code object
        GOSUBL  SAVPTR~jump_20                   * 628BA
        GOSUBL  POP2#~jump_2                     * 628C0
        ?C=A    A                                * 628C6
        GOYES   L_628CB                          * 628C9
L_628CB:
        GOLONG  GPPushT/FLp                      * 628CB

* # #' -> # #' flag
* refs (24): 10333 10487 25AE8 33E5C 3A148 3B61D ...
2DUP#>:
        CON(5)  (*)+5                            * 628D1  primitive code object
        GOSUBL  SAVPTR~jump_20                   * 628D6
        GOSUBL  POP2#~jump_2                     * 628DC
        ?C<A    A                                * 628E2
        GOYES   L_628CB                          * 628E5
        GOTO    L_628CB                          * 628E7

* # -> # #+1
* refs (40): 0F99A 272AA 27C5B 35083 36575 3A50F ...
DUP#1+:
        CON(5)  (*)+5                            * 628EB  primitive code object
        GOSUBL  SAVPTR~jump_20                   * 628F0
        GOSUBL  POP#~jump_4                      * 628F6
        A=A+1   A                                * 628FC
L_628FE:
        GOLONG  L_6266D                          * 628FE

* # ob -> ob #+1
* refs (84): 08E42 0F12E 10720 10784 107BB 10829 ...
SWAP#1+:
        CON(5)  (*)+5                            * 62904  primitive code object
        A=DAT1  A                                * 62909
        D1=D1+  5                                * 6290C
        D=D+1   A                                * 6290F
        GOSUBL  SAVPTR~jump_20                   * 62911
        C=DAT1  A                                * 62917
        DAT1=A  A                                * 6291A
        CD1EX                                    * 6291D
        D1=D1+  5                                * 62920
        A=DAT1  A                                * 62923
        D1=C                                     * 62926
        A=A+1   A                                * 62929
        GOTO    L_628FE                          * 6292B

* # -> # #-1
* refs (28): 1F484 1F605 41143 5961E 65D37 6602F ...
DUP#1-:
        CON(5)  (*)+5                            * 6292F  primitive code object
        GOSUBL  SAVPTR~jump_20                   * 62934
        GOSUBL  POP#~jump_4                      * 6293A
        A=A-1   A                                * 62940
        GOTO    L_628FE                          * 62942

* ob -> #1
* refs (25): 27643 416E7 43C4D 4B77E 4B7A6 4D9C0 ...
DROPONE:
        CON(5)  (*)+5                            * 62946  primitive code object
        LC(5)   BINT1                            * 6294B
        GOLONG  L_610ED                          * 62952

* ->
* refs (18): 2156A 24A7E 275D0 283C9 56ABA 57BE0 ...
RDROPCOLA:
        CON(5)  (*)+5                            * 62958  primitive code object
        LC(5)   #00005                           * 6295D
        B=B-C   A                                * 62964
L_62966:
        GOVLNG  L_06FD6                          * 62966

* Drops rest of current stream does COLA in the above one.
* refs (10): 0BE05 21E64 237E9 26338 2858F 5EA95 ...
COLACOLA:
        CON(5)  (*)+5                            * 6296D  primitive code object
        ABEX    A                                * 62972
        AD0EX                                    * 62974
        D0=D0-  5                                * 62977
        A=DAT0  A                                * 6297A
        AD0EX                                    * 6297D
        B=A     A                                * 62980
        GOTO    L_62966                          * 62982

* T -> :: <ob1> ; F -> :: <ob2> <rest> ;
* refs (26): 21642 5F131 5F14A 5F195 5F1B3 5F1FE ...
COLAcase:
        CON(5)  (*)+5                            * 62986  primitive code object
        ABEX    A                                * 6298B
        AD0EX                                    * 6298D
        D0=D0-  5                                * 62990
        A=DAT0  A                                * 62993
        AD0EX                                    * 62996
        B=A     A                                * 62999
        GOLONG  L_61998                          * 6299B

* T -> :: <ob2> <rest> ; F -> :: <ob1> ;
* refs (6): 1B708 2920C 63DE9 63DFD 63E11 63E25
COLANOTcase:
        CON(5)  (*)+5                            * 629A1  primitive code object
        ABEX    A                                * 629A6
        AD0EX                                    * 629A8
        D0=D0-  5                                * 629AB
        A=DAT0  A                                * 629AE
        AD0EX                                    * 629B1
        B=A     A                                * 629B4
        GOLONG  L_619B2                          * 629B6
        RPL

* f1 f2 -> :: <ob1> ; f1 f2 -> :: <ob2> <rest> ;
* refs (22): 16284 1942F 1F3B3 39B99 3AFB6 4B24C ...
ORcase:
        :: OR COLAcase ;                         * 629BC

* ob -> :: ob <ob2> ; -> :: ob <ob3> <rest> ;
* refs (8): 10207 10991 14780 3512B 5AD53 5B1A4 ...
REQcase:
        :: 'R COLA EQcase                        * 629D0
        ;                                        * 629E4

* ob -> <ob2> ; -> <ob3> <rest> ;
* refs (52): 0F286 0F2AE 0F2D1 0F2F4 0FEA3 0FEB2 ...
REQcasedrop:
        :: 'R COLA EQcasedrop                    * 629E9
        ;                                        * 629FD

* ob id/lam ->
* refs (3): 1852C 1956A 1D73D
SAFESTO:
        :: DUPTYPELAM? case STO                  * 62A02
          SWAP ?>ROMPTR SWAP STO ;               * 62A16

* id/lam -> id/lam ob T -> id/lam F
* refs (12): 147D5 153AC 15401 31D5B 3540A 4149F ...
DUPSAFE@:
        CON(5)  DupAndThen                       * 62A2F  code object: the address of its machine code

* id/lam -> ob T -> F
* refs (33): 1000B 15133 15621 18545 1CE5A 20B86 ...
SAFE@:
        :: DUPTYPELAM? case DRPExitAtLOOP        * 62A34
          DRPExitAtLOOP NOTcaseFALSE ?ROMPTR>    * 62A48
          TRUE ;                                 * 62A57

* ob -> ob'
* refs (4): 08F8F 216AB 2F199 62A1B
?>ROMPTR:
        :: DUPROM-WORD? NOT?SEMI                 * 62A61
          DUPTYPECOL? case PTR>ROMPTR            * 62A70
        ;                                        * 62A7F

* ob -> ob'
* refs (8): 093B6 1874C 30730 6090F 62A52 8550A ...
?ROMPTR>:
        :: DUP TYPEROMP? NOT?SEMI                * 62A84
          DUP ROMPTR@ NOT?SEMI                   * 62A98
          INHARDROM? NOTcaseDROP SWAPDROP        * 62AA7
        ;                                        * 62AB6

* refs (1): 16E6C
MACRODCMP:
        :: DUP OBJ_2699F NOTcase                 * 62ABB
          :: PALPTRDCMP NOTcaseFALSE failed      * 62ACF
          ;                                      * 62AE3
          DUP MACRODCMP~1 SWAP PALPTRDCMP ROTSWAP TRUE ; * 62AE8

* ob1 ob2 -> F
* refs (13): 27E8B 2FE1B 3FBD8 4498F 46842 4F1B5 ...
2DROPFALSE:
        :: 2DROP FALSE ;                         * 62B0B

* refs (11): 1484D 14C1C 16158 16F02 388EA 40A01 ...
PALPTRDCMP:
        :: DUPTYPEROMP? case palrompdcmp         * 62B1F
          DUPROM-WORD? NOTcaseFALSE PTR>ID       * 62B33
          ITE ID>$ NULL$                         * 62B42
          TRUE ;                                 * 62B51

* romptr -> $ T
* refs (1): 62B2E
palrompdcmp:
        :: ->str(xn) TRUE ;                      * 62B5B

* # -> #
* refs (26): 1F924 21C33 3F497 42CC9 56746 58E31 ...
#0=UNTIL:
        :: DUP#0= COLA UNTIL                     * 62B6F
        ;                                        * 62B83

* comp -> obn..ob1
* refs (74): 05ED8 0DCFE 0E1DD 0EB36 2EA45 2F28E ...
INCOMPDROP:
        :: INNERCOMP DROP ;                      * 62B88

* comp #i -> ob
* refs (161): 0DF70 0E155 0EAC8 156FE 1A02F 1D8B1 ...
NTHCOMPDROP:
        :: NTHELCOMP DROP ;                      * 62B9C

* $ -> $'
* refs (23): 15D51 15D83 15E42 15EBA 161A8 1628E ...
APPEND_SPACE:
        :: SPACE$ !append$ ;                     * 62BB0

* 1..7 -> 7 1..6
* refs (39): 0F394 0F399 0F6DE 0F6E3 1766C 1777A ...
7UNROLL:
        :: BINT7 UNROLL ;                        * 62BC4

* -> ob
* refs (84): 8A324 8A33E 8BDF1 9046A 9047F 9094F ...
RESOROMP:
        :: 'R ROMPTR@ DROP ;                     * 62BD8

* % -> %*10
* refs (5): 2EDFA 3200C 320FD 41D65 41E1E
%10*:
        :: %10 %* ;                              * 62BF1

* id/lam -> id/lam ob T -> id/lam F
* refs (5): 02F51 08C6D 2101A 24631 2E5C4
DUP@:
        :: DUP DRPExitAtLOOP ;                   * 62C05

* ROMPTR -> ROMPTR ob T -> ROMPTR F
* refs (4): 29207 5F41F 68ADA 84EAE
DUPROMPTR@:
        :: DUP ROMPTR@ ;                         * 62C19

* #m #n -> :: <ob1> <ob3> <rest> ; #m #n -> :: <ob2> <rest> ;
* refs (14): 1DA70 1F82F 2C49B 33A49 43A72 43B3F ...
#=ITE:
        :: #= 2'RCOLARPITE ;                     * 62C2D

* comp -> obn..ob1 #n #n
* refs (15): 0E552 16996 1DC14 1F395 1F594 2E682 ...
INNERDUP:
        :: INNERCOMP DUP ;                       * 62C41

* flag1 flag2 -> flag
* refs (21): 08FBC 092D5 0935C 0DFA7 16AC2 21959 ...
NOTAND:
        :: NOT AND ;                             * 62C55

* ob1 ob2 -> ob2' ob1
* refs (15): 05ABD 064C7 0DE6B 0E706 0E779 188C8 ...
TOTEMPSWAP:
        :: TOTEMPOB SWAP ;                       * 62C69

* 1 2 3 -> 2 3 1 3 1
* refs (5): 0B60B 2618A 4CAEB 51AE4 CD063
ROT2DUP:
        :: ROT 2DUP ;                            * 62C7D

* flag1 ob flag2 -> ob flag
* refs (4): 092B2 0DF9D 21038 8BB19
ROTAND:
        :: ROT AND ;                             * 62C91

* 1 2 3 -> 2 3 1 3
* refs (36): 08FCB 0908E 10C63 2C437 37AA4 41DE7 ...
ROTOVER:
        :: ROT OVER ;                            * 62CA5

* ob -> ob ob ob
* refs (52): 103B0 10509 1D045 24217 285A3 2EA74 ...
DUPDUP:
        :: DUP DUP ;                             * 62CB9

* 1 2 -> 1 2 1 1
* refs (13): 155EA 1724D 23EC0 254BB 27A49 39C39 ...
OVERDUP:
        :: OVER DUP ;                            * 62CCD

* % -> # #
* refs (10): 2130D 214AE 2C9F4 320E9 32102 3F4C9 ...
COERCEDUP:
        :: COERCE DUP ;                          * 62CE1

* 1 2 3 -> 3 1 2 1
* refs (7): 10ABD 16EEE 2F2D4 362FF 52A25 595FB ...
UNROTDUP:
        :: 3UNROLL DUP ;                         * 62CF5

* 1 2 3 4 -> 4 1 2 3 3
* refs (3): 17108 45254 CD07C
4UNROLLDUP:
        :: 4UNROLL DUP ;                         * 62D09

* comp #i -> ob ob
* refs (8): 2DC61 50F9C 9AB16 9AEF3 9AF9E 9B0A3 ...
NTHCOMDDUP:
        :: NTHCOMPDROP DUP ;                     * 62D1D

* 1 2 -> 1 1 2
* refs (24): 0936B 15513 161E9 22491 224A0 319DA ...
OVERSWAP:
        :: OVER SWAP ;                           * 62D31

* 1..n #n -> 2..n-1 1 n
* refs (4): 0E4ED 41B0F 49CEF 9AD79
ROLLSWAP:
        :: ROLL SWAP ;                           * 62D45

* ob -> $ ob
* refs (9): 14100 15CC0 2DE05 2FEBA 42D91 6B21E ...
NULL$SWAP:
        :: NULL$ SWAP ;                          * 62D59

* ob $ # #' -> $' ob
* refs (4): 1280B 256DA 3A193 6B925
SUB$SWAP:
        :: SUB$ SWAP ;                           * 62D6D

* % %' -> %max %min
* refs (11): 33026 3336E 4774A 4784E 47A1F 47A47 ...
%MAXorder:
        :: 2DUP %> ?SEMI                         * 62D81
          SWAP ;                                 * 62D95

* ob1 ob2 T -> :: ob1 ob2 <ob1> <rest> ; ob1 ob2 F -> :: ob2 ob1 <ob1> <rest> ;
* refs (5): 36309 3B627 3EE33 4CC2B 52953
?SKIPSWAP:
        :: ?SEMI                                 * 62D9F
          SWAP ;                                 * 62DA9

* ob -> 1lamob ob
* refs (11): 1D1FE 1E034 1F84D 1F8AC 2D4FE 330D0 ...
1ABNDSWAP:
        :: 1GETLAM ABND SWAP ;                   * 62DB3

* # ob #' -> #'+# ob
* refs (15): 66DB7 7D03A 7D09E 902A8 9057F 91C7F ...
ROT#+SWAP:
        :: ROT #+ SWAP ;                         * 62DCC

* # ob1 ob2 #' -> # ob1 #'+# ob2
* refs (3): 4E4EC 4E537 4F7AF
4PICK#+SWAP:
        :: 4PICK #+ SWAP ;                       * 62DE5

* ob # #' -> #+#' ob
* refs (14): 0E0BF 0E0C9 0E0E7 0E0F1 0E114 0E11E ...
#+SWAP:
        :: #+ SWAP ;                             * 62DFE

* ob # #' -> #-#' ob
* refs (10): 40B97 4E31F 693FA 6A514 8DE2B 8F127 ...
#-SWAP:
        :: #- SWAP ;                             * 62E12

* ob # -> #+1 ob
* refs (14): 3F782 5A7CE 5E6A2 5F500 600AD 60478 ...
#1+SWAP:
        :: #1+ SWAP ;                            * 62E26

* ob -> #0 ob
* refs (34): 147AD 14C85 1736F 1F390 21977 27C29 ...
ZEROSWAP:
        :: BINT0 SWAP ;                          * 62E3A

* # -> 1 #-1
* refs (3): 6325E 6B363 9AB4E
#1-1SWAP:
        :: #1- BINT1 SWAP ;                      * 62E4E

* ob -> #1 ob
* refs (22): 127ED 149CE 24A23 2943A 2C3A6 39C2A ...
ONESWAP:
        :: BINT1 SWAP ;                          * 62E67

* ob % -> # ob
* refs (7): 14199 194FC 19501 25B79 4CC53 4F205 ...
COERCESWAP:
        :: COERCE SWAP ;                         * 62E7B

* ob % -> %% ob
* refs (10): 2B461 2B466 4ACD4 4AD24 4AD6F 4AE19 ...
%>%%SWAP:
        :: %>%% SWAP ;                           * 62E8F

* ob %% %%' -> %%+%%' ob
* refs (17): 0F733 0FFE3 10CB3 2CB16 4AD83 4F33B ...
%%*SWAP:
        :: %%* SWAP ;                            * 62EA3

* ob1 ob2 ob3 -> ob3 T
* refs (4): 093F2 2FE2F 2FE48 3FB01
XYZ>ZTRUE:
        :: ROTROT2DROP TRUE ;                    * 62EB7

* 1 2 3 4 -> 2 3 1 4
* refs (25): 16F9D 41C61 4529F 4539E 453C1 45443 ...
4ROLLSWAP:
        :: 4ROLL SWAP ;                          * 62ECB

* 1 2 3 -> 1 2 1 3
* refs (23): 31D17 44DB8 47B0A 4862A 48689 4879C ...
3PICKSWAP:
        :: 3PICK SWAP ;                          * 62EDF

* 1 2 3 4 -> 1 2 3 1 4
* refs (5): 2CAC1 4F359 60775 66D8F CB8C4
4PICKSWAP:
        :: 4PICK SWAP ;                          * 62EF3

* ob -> 1lamob ob
* refs (4): 1F83E 555D5 56D0B 86565
1GETSWAP:
        :: 1GETLAM SWAP ;                        * 62F07

* ob1 ob2 T -> :: ob2 ob1 <ob1> <rest> ; ob1 ob2 F -> :: ob1 ob2 <ob1> <rest> ;
* refs (3): 22FA4 4DC8F 4DCAD
?SWAP:
        :: NOT?SEMI                              * 62F1B
          SWAP ;                                 * 62F25

* ob $ $' -> $+$' ob
* refs (7): 15450 16CC5 16D40 17806 4972B 9F7F5 ...
!append$SWAP:
        :: !append$ SWAP ;                       * 62F2F

* ob1 ob2 T -> :: ob2 <ob1> <rest> ; ob1 ob2 F -> :: ob1 <ob1> <rest> ;
* refs (10): 0FB83 0FBA1 1786A 2A6EB 2A704 2A71D ...
NOT?SWAPDROP:
        :: ?SKIP SWAP                            * 62F43
          DROP ;                                 * 62F52

* ob1 ob2 T -> :: ob1 <ob1> <rest> ; ob1 ob2 F -> :: ob2 <ob1> <rest> ;
* refs (1): 1A4B2
?SWAPDROP:
        :: IT SWAP                               * 62F5C
          DROP ;                                 * 62F6B

* ob meta ->
* refs (10): 24BFE 293FE 34F5C 34FA7 44048 5A167 ...
#1+NDROP:
        :: NDROP DROP ;                          * 62F75

* 1..n #n -> 2..n
* refs (15): 0E4FC 10586 262AC 44089 5104E 5146E ...
ROLLDROP:
        :: ROLL DROP ;                           * 62F89

* [2D] -> #m #n
* refs (6): 2C310 2C3B0 2C432 2C602 4C8E0 4CBC2
MDIMSDROP:
        :: MDIMS DROP ;                          * 62F9D

* 1 2 -> 2 2 1
* refs (22): 140D3 1D9D0 20994 209FF 353B5 36EAC ...
DUPROT:
        :: DUP ROT ;                             * 62FB1

* 1 2 3 4 -> 2 3 1
* refs (2): 2F2A7 4F845
DROPROT:
        :: DROP ROT ;                            * 62FC5

* ob ob' # -> ob' #-1 ob
* refs (7): 5F46F 5F4B5 90DC3 92358 92515 927D1 ...
#1-ROT:
        :: #1- ROT ;                             * 62FD9

* ob ob' %% %%' -> ob' %%+%%' ob
* refs (11): 33F4D 33FE8 521C5 525E4 5261B 96CC8 ...
%%*ROT:
        :: %%* ROT ;                             * 62FED

* 1 2 3 4 -> 2 4 1 3
* refs (20): 10C27 10C40 161F3 2C86E 34092 3545A ...
4ROLLROT:
        :: 4ROLL ROT ;                           * 63001

* 1 2 3 4 -> 4 3 2 1
* refs (8): 4CA41 4E91A 4F147 4F1BA 4F1FB 4F746 ...
4UNROLLROT:
        :: 4UNROLL ROT ;                         * 63015
