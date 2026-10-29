* HP 48GX ROM revision R, #D1362-#D4805: Library part 0E8
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~INTEMPOB?
* Follows on from the previous file (at #D1362 in the original ROM).
        ENDLENGTH                                * D1362

        CON(5)  DOLIB                            * D1362  library object
        LENGTH                                   * D1367  length, to #D49C7
        CON(2)  0                                * D136C  title length

LIB0E8:
        CON(3)  #0E8                             * D136E  library number
        REL(5)  LIB0E8.hash                      * D1371  hash table
        CON(5)  0                                * D1376  message table
        REL(5)  LIB0E8.link                      * D137B  link table
        CON(5)  0                                * D1380  config
        RPL

* ROMPTR 0E8 000
* refs (1): D136E
SEQ~1:
        :: RCLSYSF DEPTH #6- 2NULLLAM{} BIND ERRSET * D1385
          :: DOSTD % 6.4E1 XEQSTWS ROT DO>STR APPEND_SPACE ROT DO>STR &$ * D13A8
            $ " FOR " &$ ROT ID>$ &$ APPEND_SPACE ROT DO>STR &$ $ " EVAL " * D13EA
            &$ SWAPDUP %1 EQUAL ITE              * D143C
            :: DROP $ " NEXT" ;                  * D1455
            :: DO>STR &$ $ " STEP" ;             * D1478
            &$ ;                                 * D14A0
          ERRTRAP                                * D14AA
          :: 2GETLAM STOSYSF ERRJMP ; 2GETLAM STOSYSF DOSTR> DEPTH 1GETLAM * D14AF
          2DUP #>ITE                             * D14E1
          :: #- {}N ; 2DROP ABND ;               * D14EB

* ROMPTR 0E8 001
* refs (1): D136E
DOSUBS~1:
        :: ROMPTR 0E8 006 ROMPTR 0E8 003 ;       * D150E

* ROMPTR 0E8 002
* refs (1): D136E
DOSUBS~2:
        :: SWAP COERCE DUP#0=case SETSIZEERR     * D152E
          DEPTH BINT3 #<case SETSTACKERR         * D1547
          ROT STRIPTAGS DUPTYPELIST? NOTcase SETTYPEERR * D155B
          3UNROLL                                * D1574

* ROMPTR 0E8 003
* refs (1): D136E
ROMP_0E8_003:
          :: 3PICK LENCOMP 2DUP #>case doerr501  * D1579
            OVER #- #1+ 3UNROLL DEPTH #4- BINT1 3NULLLAM{} ' LAM 'mtup * D1597
            >HCOMP ' LAM 'ntup >TCOMP BIND >R 5GETLAM ZERO_DO ?ATTNQUIT * D15D5
            RSWAP RDUP 3GETLAM ZERO_DO RSWAP 'R RSWAP LOOP RDROP 'R DROP * D160E
            RSWAP 4GETLAM EVAL 1GETLAM #1+ 1PUTLAM LOOP RDROP DEPTH 2GETLAM * D1645
            2DUP #>ITE                           * D1677
            :: #- {}N ; 2DROP ABND ;             * D1681
        ;                                        * D16A4

* ROMPTR 0E8 004
* refs (1): D136E
DOLIST~1:
        :: ' ROMPTR 0AB 06B                      * D16A9  DOLIST

* ROMPTR 0E8 005
* refs (1): D136E
DOSUBS~3:
          :: SWAP SAFE@ NOTcase SETNONEXTERR     * D16BE
            SWAP EVAL ;                          * D16D7
        ;                                        * D16E6

* ROMPTR 0E8 006
* refs (1): D136E
ROMP_0E8_006:
        :: ROMPTR 0E8 00E NOT?SEMI               * D16EB
          DROP DUP CARCOMP ' x<< EQ NOTcase ARGNUMERR * D1700
          DUPLENCOMP BINT3 #<>case ROMPTR 0E8 009 * D1728
          BINT2 NTHCOMPDROP DUPTYPEROMP? case ROMPTR 0E8 007 * D1742
          DUPTYPECOL? NOTcase ARGNUMERR          * D1761
          ROMPTR 0E8 00E case ARGNUMERR          * D1770
        ;                                        * D1785

* ROMPTR 0E8 007
* refs (1): D136E
ROMP_0E8_007:
        :: DUP OBJ_2699F case ARGNUMERR          * D178A
          ROMPTR@ NOTcase SETROMPERR             * D17A3
          DUPTYPECOL? NOTcase ARGNUMERR          * D17B2
          ROMPTR 0E8 00E case ARGNUMERR          * D17C1
        ;                                        * D17D6

* ROMPTR 0E8 008
* refs (1): D136E
DOLIST~2:
        :: ROMPTR 0E8 006 ROMPTR 0E8 00C ;       * D17DB

* ROMPTR 0E8 009
* refs (1): D136E
ROMP_0E8_009:
        :: DUP DUPLENCOMP BINT3 #<case INVFUNCERR * D17FB
          >R 'R ' x<< EQ NOTcase INVFUNCERR      * D1819
          'R DUP ' xALG-> EQ NOT SWAP ' xRPN-> EQ NOT AND case INVFUNCERR * D183C
          BINT0 BEGIN RSWAP 'R RSWAP TYPELAM? WHILE * D1882
          :: #1+ ; REPEAT RDROP ;                * D18A5

* ROMPTR 0E8 00A
* refs (1): D136E
DOLIST~3:
        :: ROMPTR 0E8 007 ROMPTR 0E8 00C ;       * D18C3

* ROMPTR 0E8 00B
* refs (1): D136E
DOLIST~4:
        :: SWAP COERCE DUP#0=case ARGNUMERR      * D18E3

* ROMPTR 0E8 00C
* refs (1): D136E
ROMP_0E8_00C:
          :: DEPTH #2- OVER #<case SETSTACKERR   * D18FC
            FALSE ROMPTR 0E8 00F ;               * D191A
        ;                                        * D192F

* ROMPTR 0E8 00D
* refs (1): D136E
ROMP_0E8_00D:
        ::                                       * D1934

* ROMPTR 0E8 00E
* refs (1): D136E
ROMP_0E8_00E:
          ::                                     * D1939
            { CK1&Dispatch                       * D193E
              CK2&Dispatch                       * D1948
              CK3&Dispatch                       * D194D
              CK4&Dispatch                       * D1952
              CK5&Dispatch                       * D1957
            }                                    * D195C
            OVER CARCOMP EQUALPOSCOMP DUP#0= ;   * D1961
          case ARGNUMERR                         * D197A
          TRUE ROMPTR 0E8 00F ;                  * D1984

* ROMPTR 0E8 00F
* refs (1): D136E
ROMP_0E8_00F:
        :: DUP NOTcase ROMPTR 0E8 010            * D1999
          OVER #2= NOTcase ROMPTR 0E8 010        * D19B3
          ROMPTR 0E8 011 ;                       * D19CD

* ROMPTR 0E8 010
* refs (1): D136E
ROMP_0E8_010:
        :: 4PICK STRIPTAGS DUPTYPELIST? NOTcase SETTYPEERR * D19DD
          LENCOMP DUP#0=case doerr501            * D19FB
          DEPTH #4- 4PICK #- 3NULLLAM{} 2NULLLAM{} &COMP BIND 4GETLAM #1<> * D1A0A
          IT                                     * D1A3C
          :: 4GETLAM #1+ BINT2 DO INDEX@ PICK STRIPTAGS DUPTYPELIST? NOTcase * D1A41
            SETTYPEERR                           * D1A73
            LENCOMP 2GETLAM #<>case doerr501     * D1A78
            LOOP 4GETLAM ZERO_DO STRIPTAGS 4GETLAM ROLL LOOP ; * D1A8C
          4GETLAM ZERO_DO 4GETLAM INDEX@ #- ROLL >R RSWAP LOOP 2GETLAM * D1AB4
          ZERO_DO ?ATTNQUIT 4GETLAM ZERO_DO 4GETLAM #2+ RROLL 'R RSWAP LOOP * D1AE6
          4GETLAM #1+ RROLL 5GETLAM 3GETLAM ITE EvalNoCK EVAL * D1B18
          LOOP 4GETLAM ZERO_DO RSWAP RDROP LOOP DEPTH 1GETLAM 2DUP #>ITE * D1B40
          :: #- {}N ; 2DROP ABND ;               * D1B72

* ROMPTR 0E8 011
* refs (1): D136E
ROMP_0E8_011:
        :: 5ROLL STRIPTAGS 5ROLL STRIPTAGS CK&DISPATCH0 * D1B95
          BINT85                                 * D1BB3  list list
          :: 5UNROLL 5UNROLL ROMPTR 0E8 010 ;    * D1BB8
          OBJ_64C34 ROMPTR 0E8 012               * D1BD7  list any
          BINT5 ROMPTR 0E8 013                   * D1BE7  list
        ;                                        * D1BF7

* ROMPTR 0E8 012
* refs (1): D136E
ROMP_0E8_012:
        :: 5UNROLL 5UNROLL FALSE ROMPTR 0E8 014 ; * D1BFC

* ROMPTR 0E8 013
* refs (1): D136E
ROMP_0E8_013:
        :: 5UNROLL 4UNROLL TRUE ROMPTR 0E8 014 ; * D1C20

* ROMPTR 0E8 014
* refs (1): D136E
ROMP_0E8_014:
        :: ROTDROP 5PICK LENCOMP DUP#0=case doerr501 * D1C44
          DEPTH #6- 3NULLLAM{} 3NULLLAM{} &COMP BIND >R 2GETLAM ZERO_DO * D1C62
          ?ATTNQUIT RSWAP 'R RSWAP 6GETLAM 3GETLAM IT SWAP * D1C8F
          5GETLAM 4GETLAM ITE EvalNoCK EVAL      * D1CB7
          LOOP RDROP DEPTH 1GETLAM 2DUP #>ITE    * D1CD0
          :: #- {}N ; 2DROP ABND ;               * D1CEE

* ROMPTR 0E8 015
* refs (1): D136E
ADD~1:
        :: ' x+ BINT2 TRUE ROMPTR 0E8 00F ;      * D1D11

* ROMPTR 0E8 016
* refs (1): D136E
SORT~1:
        ::                                       * D1D3A
          :: ROMPTR 0E8 01C                      * D1D3F
            :: SWAP dup;#nm? ITE FalseFalse TrueTrue * D1D4F
              4ROLL 3NULLLAM{} BIND 2GETLAM IT ROMPTR 0E8 017 * D1D6D
              1GETLAM #1+_ONE_DO 1GETLAM ROLL BINT0 INDEX@ BEGIN ?ATTNQUIT * D1D91
              2DUP SWAP#- #2/ DUP#0<> WHILE      * D1DB9
              :: OVERSWAP #-DUP #4+PICK 5PICK    * D1DD2
                CODE                             * D1DEB  20 nibbles
                  C=PC                           * D1DF5
                  LA(5)   #0006B                 * D1DF9
                  A=A+C   A                      * D1E03
                  PC=(A)                         * D1E05
                ENDCODE                          * D1E09
                %1 %= ITE ROTDROPSWAP SWAPDROP   * D1E09
              ;                                  * D1E22
              REPEAT DROPSWAPDROP UNROLL LOOP 2GETLAM IT ROMPTR 0E8 019 * D1E27
              1GETABND ;                         * D1E50
            COLA ;                               * D1E5A
          :: CK&DISPATCH1                        * D1E64
            BINT17                               * D1E6E  real real
            CODE                                 * D1E73  20 nibbles
              D0=D0+  5                          * D1E7D
              D0=D0+  5                          * D1E80
              LA(5)   %>                         * D1E83
              PC=(A)                             * D1E8D
            ENDCODE                              * D1E91
            BINT51                               * D1E91
            $>$? # BB                            * D1E96
            HXS>HXS # EE                         * D1EA5
            UM>? # E1                            * D1EB4
            UM>? # 1E                            * D1EC3
            UM>? # 66                            * D1ED2
            :: ID>$ SWAP ID>$ SWAP $>$? ;        * D1EE1
            # 77                                 * D1F04  local local
            :: ID>$ SWAP ID>$ SWAP $>$? ;        * D1F0E
            BINT85                               * D1F31  list list
            :: DUPLENCOMP #0=case SETSIZEERR     * D1F36
              CARCOMP SWAP DUPLENCOMP #0=case SETSIZEERR * D1F4A
              CARCOMP SWAP COLA                  * D1F63
              CODE                               * D1F72  20 nibbles
                C=PC                             * D1F7C
                LA(5)   #FFEE4                   * D1F80
                A=A+C   A                        * D1F8A
                PC=(A)                           * D1F8C
              ENDCODE                            * D1F90
            ;                                    * D1F90
          ;                                      * D1F95
        ;                                        * D1F9A

* ROMPTR 0E8 017
* refs (1): D136E
SORT~1~1:
        :: DUPTYPELAM? case ROMPTR 0E8 018       * D1F9F
          1GETLAM ZERO_DO DUPTYPEIDNT? NOTcase SETTYPEERR * D1FB9
          ID>$ 1GETLAM ROLL LOOP ;               * D1FD2

* ROMPTR 0E8 018
* refs (1): D136E
SORT~1~1~1:
        :: FALSE 3PUTLAM 1GETLAM ZERO_DO DUPTYPELAM? NOTcase SETTYPEERR * D1FEB
          LAM>ID ID>$ 1GETLAM ROLL LOOP ;        * D2013

* ROMPTR 0E8 019
* refs (1): D136E
SORT~1~2:
        :: 3GETLAM NOTcase ROMPTR 0E8 01A        * D2031
          1GETLAM ZERO_DO $>ID 1GETLAM ROLL LOOP ; * D204B

* ROMPTR 0E8 01A
* refs (1): D136E
SORT~1~2~1:
        :: 1GETLAM ZERO_DO $>ID ID>LAM 1GETLAM ROLL LOOP ; * D206E

* ROMPTR 0E8 01B
* refs (1): D136E
ROMP_0E8_01B:
        :: 'R NOTNUM? SETNUM ERRSET ITE          * D209B
          :: EVAL ERRTRAP cf(-3);error CLRNUM ;  * D20B9
          :: EVAL ERRTRAP sf(-3);error SETNUM ;  * D20D7
        ;                                        * D20F5

* ROMPTR 0E8 01C
* refs (1): D136E
ROMP_0E8_01C:
        :: ROMPTR 0E8 01E NOTcase ROMPTR 0E8 01D * D20FA  ~INTEMPOB?
          ID '{} StoHiddenVar ' ID '{} RclHiddenVar DROP ERRSET * D211A
          :: INNERCOMP RSWAP 'R RSWAP EVAL ; ERRTRAP * D214D
          :: ' ID '{} PuHiddenVar ERRJMP ; ' ID '{} PuHiddenVar {}N ; * D2175

* ROMPTR 0E8 01D
* refs (1): D136E
ROMP_0E8_01D:
        :: INNERCOMP 'REVAL {}N ;                * D21BC

* ROMPTR 0E8 01E
* refs (1): D136E
~INTEMPOB?:
        CODE                                     * D21D5  62 nibbles
          A=DAT1  A                              * D21DF
          CD0EX                                  * D21E2
          RSTK=C                                 * D21E5
          D0=(5)  #806E9                         * D21E7
          C=DAT0  A                              * D21EE
          ?C>A    A                              * D21F1
          GOYES   L_D2205                        * D21F4
          D0=(5)  #806EE                         * D21F6
          C=DAT0  A                              * D21FD
          ?C>A    A                              * D2200
          GOYES   L_D2211                        * D2203
L_D2205:
          C=RSTK                                 * D2205
          D0=C                                   * D2207
          GOVLNG  PushFLoop                      * D220A
L_D2211:
          C=RSTK                                 * D2211
          D0=C                                   * D2213
          GOVLNG  PushTLoop                      * D2216
        ENDCODE                                  * D221D

* ROMPTR 0E8 01F
* refs (1): D136E
xSUB~1:
        :: CK&DISPATCH1                          * D221D
          # 455 ROMPTR 0E8 026                   * D2227  array list list
          # 411 ROMPTR 0E8 028                   * D223C  array real real
          # 415 ROMPTR 0E8 025                   * D2251  array real list
          # 451 ROMPTR 0E8 024                   * D2266  array list real
          # 855 sub(PICT,2c)                     * D227B  program list list
          # 822 sub(PICT,2c)                     * D228A  program complex complex
          TAGGEDANY                              * D2299  tagged any
          :: STRIPTAGSl2 STRIPTAGS 'EvalNoCK:_sup xSUB ; * D229E
          BINT13                                 * D22BC  tagged
          :: STRIPTAGS 'EvalNoCK:_sup xSUB ;     * D22C1
        ;                                        * D22DA

* ROMPTR 0E8 020
* refs (1): D136E
xREPL~1:
        :: CK&DISPATCH1                          * D22DF
          # 454 ROMPTR 0E8 022                   * D22E9  array list array
          # 414 ROMPTR 0E8 021                   * D22FE  array real array
          # 85C repl(PICT,c,go)                  * D2313  program list grob
          # 82C repl(PICT,c,go)                  * D2322  program complex grob
          TAGGEDANY                              * D2331  tagged any
          :: STRIPTAGSl2 STRIPTAGS 'EvalNoCK:_sup xREPL ; * D2336
          BINT13                                 * D2354  tagged
          :: STRIPTAGS 'EvalNoCK:_sup xREPL ;    * D2359
        ;                                        * D2372

* ROMPTR 0E8 021
* refs (1): D136E
xREPL~1~1:
        :: 3UNROLL COERCE OVER ROMPTR 0E8 02B ROMPTR 0E8 023 ; * D2377

* ROMPTR 0E8 022
* refs (1): D136E
xREPL~1~2:
        :: ROT OBJ_1DF30 4GETLAM 3GETLAM 1GETABND INNERCOMP BINT2 #<>case * D23A6
          SETSIZEERR                             * D23D3
          COERCE2 ROMPTR 0E8 023 ;               * D23D8

* ROMPTR 0E8 023
* refs (1): D136E
ROMP_0E8_023:
        :: 2DUP #* #0=case SETSIZEERR            * D23ED
          ROT TOTEMPOB 3UNROLL 3PICK ROMPTR 0E8 02A 8PICK ROMPTR 0E8 02A ROT * D2406
          7PICK XOR case SETTYPEERR              * D243A
          BINT9 PICK 3PICK #+ #1- 6PICK #>case SETSIZEERR * D244E
          8PICK OVER #+ #1- 5PICK #>case SETSIZEERR * D2476
          4NULLLAM{} 3NULLLAM{} 2NULLLAM{} &COMP &COMP BIND 2GETLAM 3GETLAM * D2499
          ITE BINT30 BINT25                      * D24C1
          9GETLAM #1- 4GETLAM #* 8GETLAM #1- #+ 6GETLAM #* 7GETLAM ITE * D24D0
          BINT30 BINT25                          * D2507
          #+ 4GETLAM 1GETLAM #- 6GETLAM #* 1GETLAM 6GETLAM #* BINT0 ABND * D2511
          ROMPTR 0E8 029 ;                       * D2548

* ROMPTR 0E8 024
* refs (1): D136E
xSUB~1~1:
        :: SWAP                                  * D2558

* ROMPTR 0E8 025
* refs (1): D136E
xSUB~1~2:
          :: 3UNROLL OBJ_1DF30 4GETLAM 3GETLAM 1GETABND INNERCOMP BINT2 * D2562
            #<>case SETSIZEERR                   * D258A
            COERCE2 ROT COERCE 4PICK ROMPTR 0E8 02B ROMPTR 0E8 027 ; * D2594
        ;                                        * D25C3

* ROMPTR 0E8 026
* refs (1): D136E
xSUB~1~3:
        :: ROT OBJ_1DF30 4GETLAM 3GETLAM 1GETABND OBJ_1DF30 4GETLAM 3GETLAM * D25C8
          1GETABND INNERCOMP BINT2 #<>case SETSIZEERR * D25F5
          COERCE2 ROT INNERCOMP BINT2 #<>case SETSIZEERR * D260E
          COERCE2 ROMPTR 0E8 027 ;               * D262C

* ROMPTR 0E8 027
* refs (1): D136E
ROMP_0E8_027:
        :: ROT 2DUP #> IT SWAP                   * D2641
          OVER #0=case SETSIZEERR                * D265F
          2SWAP 2DUP #> IT SWAP                  * D266E
          OVER #0=case SETSIZEERR                * D2687
          5PICK ROMPTR 0E8 02A 4NULLLAM{} BIND 2GETLAM OVER #<case * D2696
          SETSIZEERR                             * D26BF
          1GETLAM 4PICK #<case SETSIZEERR        * D26C4
          OVER #- #1+ 2SWAP OVER #- #1+ 4GETLAM ITE * D26D8
          :: 3PICKOVER BINT2 ; DUPONE            * D2705
          {}N 6PICK TYPERARRY? ITE %0_2A2B4 C%0  * D271E
          MAKEARRY 5UNROLL 4ROLL #1- 1GETLAM #* ROT #+ #1- 3GETLAM #* * D273C
          4GETLAM ITE BINT30 BINT25              * D2773
          DUP ROT#+ SWAP 1GETLAM 3GETLAM #* BINT0 5ROLL 3GETLAM #* ROT OVER * D2787
          #- ABND ROMPTR 0E8 029 ;               * D27C3

* ROMPTR 0E8 028
* refs (1): D136E
xSUB~1~4:
        :: COERCE2 3PICK ROMPTR 0E8 02B ROT 4PICK ROMPTR 0E8 02B * D27DD
          ROMPTR 0E8 027 ;                       * D280C

* ROMPTR 0E8 029
* refs (1): D136E
ROMP_0E8_029:
        CODE                                     * D281C  168 nibbles
          GOSBVL  POP2#                          * D2826
          R4=A.F  A                              * D282D
          R3=C.F  A                              * D2833
          GOSBVL  POP2#                          * D2839
          R2=A.F  A                              * D2840
          R1=C.F  A                              * D2846
          GOSBVL  SAVPTR                         * D284C
          GOSBVL  POP2#                          * D2853
          B=A     A                              * D285A
          B=B-1   A                              * D285C
          D1=D1+  5                              * D285E
          A=DAT1  A                              * D2861
          A=A+C   A                              * D2864
          D0=A                                   * D2866
          D1=D1-  5                              * D2869
          A=DAT1  A                              * D286C
          C=R2.F  A                              * D286F
          A=A+C   A                              * D2875
          D1=A                                   * D2877
L_D287A:
          C=R4.F  A                              * D287A
          GOSBVL  MOVEDOWN                       * D2880
          B=B-1   A                              * D2887
          GOC     L_D28AB                        * D2889
          C=R3.F  A                              * D288C
          AD0EX                                  * D2892
          A=A+C   A                              * D2895
          D0=A                                   * D2897
          C=R1.F  A                              * D289A
          AD1EX                                  * D28A0
          A=A+C   A                              * D28A3
          D1=A                                   * D28A5
          GONC    L_D287A                        * D28A8
L_D28AB:
          GOSBVL  GETPTR                         * D28AB
          D1=D1+  10                             * D28B2
          C=DAT1  A                              * D28B5
          D1=D1+  5                              * D28B8
          DAT1=C  A                              * D28BB
          D=D+1   A                              * D28BE
          D=D+1   A                              * D28C0
          D=D+1   A                              * D28C2
          A=DAT0  A                              * D28C4
          D0=D0+  5                              * D28C7
          PC=(A)                                 * D28CA
        ENDCODE                                  * D28CE

* ROMPTR 0E8 02A
* refs (1): D136E
ROMP_0E8_02A:
        :: DUP TYPERARRY? ITE BINT16 BINT32      * D28CE
          SWAP MDIMS DUP ITE ROT BINT1           * D28EC
          3UNROLL 4UNROLL ;                      * D290A

* ROMPTR 0E8 02B
* refs (1): D136E
ROMP_0E8_02B:
        :: MDIMS NOTcasedrop ONESWAP             * D2919
          SWAPDROP DUPUNROT #/ OVER#0= case SWAPDROPSWAP * D292D
          #1+ ROTDROPSWAP ;                      * D294B

* ROMPTR 0E8 02C
* refs (1): D136E
ROMP_0E8_02C:
        :: HOMEDIR ' ID EXAMPLES DUP SAFE@ NOTcaseDROP TYPERRP? * D295A
          case XEQPGDIR                          * D2994
          PURGE ;                                * D299E

* ROMPTR 0E8 02D
* refs (1): D136E
TEACH~1:
        :: ROMPTR 0E8 02C ' ID EXAMPLES DUP CREATEDIR EVAL ' * D29A8
          :: x<< xHOME x' ID EXAMPLES xENDTIC xPGDIR x>> ; ' ID PURGEX * D29E8
          XEQSTOID ' ROMPTR 0E8 02E ?ROMPTR@ ' ID %TILE XEQSTOID ' ID EQNS * D2A3F
          DUP CREATEDIR EVAL $ "6\0Dx\0C-9)+4\0D6+x-x\0C)+2\0Dx\0C+5*x+6)" * D2A88
          ROMPTR 0E3 028 ' ID RATFUNC XEQSTOID $ "4*\05X)" ROMPTR 0E3 028 ' * D2ADB
          ID FOUR XEQSTOID $ "3*\05X)" ROMPTR 0E3 028 ' ID THREE XEQSTOID * D2B29
          $ "2*\05X)" ROMPTR 0E3 028 ' ID TWO XEQSTOID $ "\05X)" * D2B77
          ROMPTR 0E3 028 ' ID ONE XEQSTOID UPDIR ' ID PLOTS DUP CREATEDIR * D2BBD
          EVAL ' ROMPTR 0E8 03A ?ROMPTR@ ' ID XSIN ' ROMPTR 0E8 039 ?ROMPTR@ * D2C04
          ' ID ELLIP ' ROMPTR 0E8 038 ?ROMPTR@ ' ID LISSA ' ROMPTR 0E8 037 * D2C47
          ?ROMPTR@ ' ID ROSE ' ROMPTR 0E8 036 ?ROMPTR@ ' ID PTRN ' * D2C98
          ROMPTR 0E8 035 ?ROMPTR@ ' ID DEQ ' ROMPTR 0E8 034 ?ROMPTR@ ' * D2CDF
          ID SPFLD ' ROMPTR 0E8 033 ?ROMPTR@ ' ID PSCN ' ROMPTR 0E8 032 * D2D1B
          ?ROMPTR@ ' ID GRID ' ROMPTR 0E8 031 ?ROMPTR@ ' ID PSUR ' * D2D65
          ROMPTR 0E8 030 ?ROMPTR@ ' ID WIRE ' ROMPTR 0E8 02F ?ROMPTR@ ' * D2DAC
          ID SLICE BINT12 ZERO_DO XEQSTOID LOOP UPDIR ' ID PRGS DUP * D2DEA
          CREATEDIR EVAL ' ROMPTR 0E8 03B ?ROMPTR@ ' ID →RPN XEQSTOID ' * D2E2D
          ROMPTR 0E8 03C ?ROMPTR@ ' ID APLY XEQSTOID ' ROMPTR 0E8 03D * D2E6A
          ?ROMPTR@ ' ID FIBON XEQSTOID ' ROMPTR 0E8 03E ?ROMPTR@ ' ID MEDIAN * D2EA3
          XEQSTOID HOMEDIR ClrDAsOK ;            * D2EF0

* ROMPTR 0E8 02E
* refs (1): D136E
TEACH~1~1:
        :: x<< xSWAP ROMPTR 0AB 06E xDUP xSIZE %1 x+ xROT % 1E2 x/ x* xRPN-> * D2F04  SORT
          LAM p x<< xDUP LAM p xFLOOR xGET xSWAP LAM p xCEIL xGET x+ %2 x/ * D2F5B
          x>>ABND x>> ;                          * D2FA8

* ROMPTR 0E8 02F
* refs (1): D136E
TEACH~1~2:
        :: x<< xRAD                              * D2FB7
          { xPICT ID PPAR ID VPAR } xPURGE ROMPTR 0AB 00B * D2FC6  YSLICE
          SYMBOL ID X %3 x^ ID Y x* ID X ID Y %3 x^ x* x- ; xSTEQ % -5E-1 * D3003
          % 5E-1 ROMPTR 0AB 002 xDRAW x>> ;      * D306E  ZVOL

* ROMPTR 0E8 030
* refs (1): D136E
TEACH~1~3:
        :: x<<                                   * D309D
          { xPICT ID PPAR ID VPAR } xPURGE ROMPTR 0AB 008 * D30A7  WIREFRAME
          SYMBOL ID X %3 x^ ID Y x* ID X ID Y %3 x^ x* x- ; xSTEQ % 1.2E1 * D30E4
          ROMPTR 0AB 006 % 1.2E1                 * D314F  NUMX
          ROMPTR 0AB 007 % -4E-1 % 4E-1          * D316F  NUMY
          ROMPTR 0AB 002 %0_2A2B4 %-2 %1         * D31A4  ZVOL
          ROMPTR 0AB 005 xDRAW xGRAPH x>> ;      * D31BE  EYEPT

* ROMPTR 0E8 031
* refs (1): D136E
TEACH~1~4:
        :: x<< xRAD                              * D31DD
          { xPICT ID PPAR ID VPAR } xPURGE ROMPTR 0AB 009 * D31EC  PARSURFACE
          {                                      * D3229
            SYMBOL ID X ID Y xCOS x* ;           * D322E
            SYMBOL ID X ID Y xSIN x* ; ID X }    * D3254
          xSTEQ % 1.6E1 ROMPTR 0AB 006 % 1.6E1   * D3288  NUMX
          ROMPTR 0AB 007 % -3.14159E0 % 3.14159E0 xDUP2 xDUP2 %4 xDUPN * D32C2  NUMY
          ROMPTR 0AB 000                         * D330B  XVOL
          ROMPTR 0AB 001                         * D3316  YVOL
          ROMPTR 0AB 002                         * D3321  ZVOL
          ROMPTR 0AB 003                         * D332C  XXRNG
          ROMPTR 0AB 004 %0_2A2B4 % -4.2E0 %0_2A2B4 * D3337  YYRNG
          ROMPTR 0AB 005 xDRAW xGRAPH x>> ;      * D3361  EYEPT

* ROMPTR 0E8 032
* refs (1): D136E
TEACH~1~5:
        :: x<< xRAD                              * D3380
          { xPICT ID PPAR ID VPAR } xPURGE ROMPTR 0AB 00A * D338F  GRIDMAP
          SYMBOL ID X ID Y xi x* x+ xSIN ; xSTEQ xDRAW xGRAPH x>> ; * D33CC

* ROMPTR 0E8 033
* refs (1): D136E
TEACH~1~6:
        :: x<< xRAD                              * D3415
          { xPICT ID PPAR ID VPAR } xPURGE ROMPTR 0AB 00D * D3424  PCONTOUR
          SYMBOL ID X %2 x^ %1 x- ID Y %2 x^ %1 x- x/ ; xSTEQ % 1.6E1 * D3461
          ROMPTR 0AB 006 %16                     * D34C4  NUMX
          ROMPTR 0AB 007 %-2 %2                  * D34D4  NUMY
          ROMPTR 0AB 000 %-2 %2                  * D34E9  XVOL
          ROMPTR 0AB 001 xDRAW xGRAPH x>> ;      * D34FE  YVOL

* ROMPTR 0E8 034
* refs (1): D136E
TEACH~1~7:
        :: x<< xRAD                              * D351D
          { xPICT ID PPAR ID VPAR } xPURGE ROMPTR 0AB 00C * D352C  SLOPEFIELD
          SYMBOL ID X %2 x^ %1 x- ID Y %2 x^ %1 x- x/ ; xSTEQ % 1.6E1 * D3569
          ROMPTR 0AB 006 %16                     * D35CC  NUMX
          ROMPTR 0AB 007 %-2 %2                  * D35DC  NUMY
          ROMPTR 0AB 000 %-2 %2                  * D35F1  XVOL
          ROMPTR 0AB 001 xDRAW xGRAPH x>> ;      * D3606  YVOL

* ROMPTR 0E8 035
* refs (1): D136E
TEACH~1~8:
        :: x<< xSILENT'                          * D3625
          :: x<< ID Y xOBJ> xDROP ID T %5 x* xCOS % 1.2E1 x* xROT % 4.9E1 x* * D3634
            x- %2 x>ARRY x>> ;                   * D36A2
          xSTEQ xRAD                             * D36BB
          { xPICT ID PPAR } xPURGE ROMPTR 0AB 00E %-2 %2 xXRNG %-8 %8 xYRNG * D36C5  DIFFEQ
          { ID T %0_2A2B4 %PI } xINDEP           * D3711
          { ID Y                                 * D3733
            CON(5)  DOARRY                       * D3741  array 2
            LENGTH                               * D3746  length, to #D377A
            CON(5)  DOREAL                       * D374B  element type
            CON(5)  1                            * D3750  dimensions
            CON(5)  2                            * D3755
            %BODY   0E0                          * D375A
            %BODY   0E0                          * D376A
        ENDLENGTH                                * D377A
            % 1E-3 }                             * D377A
          xDEPND                                 * D3794
          { C% 0E0 0E0 $ "1" $ "2" } xAXES % 5E-2 xRES xDRAX xDRAW xGRAPH * D3799
          x>> ;                                  * D380E

* ROMPTR 0E8 036
* refs (1): D136E
TEACH~1~9:
        :: x<< xRAD                              * D3818
          { xPICT ID PPAR } xPURGE ROMPTR 0F1 037 * D3827  TRUTH
          SYMBOL ID X %2 x^ ID Y %3 x^ x+ %4 xMOD %2 x< ; xSTEQ xDRAX xDRAW * D3855
          xGRAPH x>> ;                           * D38AD

* ROMPTR 0E8 037
* refs (1): D136E
TEACH~1~10:
        :: x<< xRAD                              * D38BC
          { xPICT ID PPAR } xPURGE ROMPTR 0F1 035 ID θ xINDEP * D38CB  POLAR
          SYMBOL %2 %4 ID θ x* xCOS x* ; xSTEQ xDRAX xDRAW xGRAPH x>> ; * D3907

* ROMPTR 0E8 038
* refs (1): D136E
TEACH~1~11:
        :: x<<                                   * D3951
          { xPICT ID PPAR } xPURGE xRAD ROMPTR 0F1 036 * D395B  PARAMETRIC
          { ID T %0_2A2B4 % 6.5E0 } xINDEP       * D398E
          SYMBOL %3 %3 ID T x* xSIN x* xi %2 x* %4 ID T x* xSIN x* x+ ; * D39C0
          xSTEQ xDRAX xDRAW xGRAPH x>> ;         * D3A1D

* ROMPTR 0E8 039
* refs (1): D136E
TEACH~1~12:
        :: x<<                                   * D3A3B
          { xPICT ID PPAR } xPURGE ROMPTR 0F1 034 % 1E-2 xRES * D3A45  CONIC
          { ID X %-2 %2 } xINDEP                 * D3A8D
          SYMBOL %5 ID X %2 x^ x* %3 ID Y %2 x^ x* x+ % 1.8E1 x- ; xSTEQ * D3AAF
          xDRAX xDRAW xGRAPH x>> ;               * D3B17

* ROMPTR 0E8 03A
* refs (1): D136E
TEACH~1~13:
        :: x<< xRAD                              * D3B30
          { xPICT ID PPAR } xPURGE               * D3B3F
          SYMBOL ID X %2 ID X x* xSIN x+ ; xSTEQ xDRAX xDRAW xGRAPH x>> ; * D3B62

* ROMPTR 0E8 03B
* refs (1): D136E
TEACH~1~14:
        :: x<< xOBJ> xIF xOVER xTHEN             * D3BB0
          :: xRPN-> LAM n LAM f x<< %1 LAM n xSTARTVAR LAM i xIF xDUP xTYPE * D3BCE
            %9 xSAME xTHEN ID →RPN xIFEND LAM n xROLLD xNEXT xIF xDUP xTYPE * D3C1A
            %5 x#? xTHEN                         * D3C5F
            :: %1 x>LIST ; xIFEND xIF LAM n %1 x> xTHEN * D3C6E
            :: %2 LAM n xSTART x+ xNEXT ; xIFEND LAM f x+ x>>ABND ; * D3CA4
          xELSE                                  * D3CE8
          :: %1 x>LIST xSWAP xDROP ; xIFEND x>> ; * D3CED

* ROMPTR 0E8 03C
* refs (1): D136E
TEACH~1~15:
        :: x<< xRPN-> LAM a LAM p x<< %1 xCF LAM a xDUP xSIZE xDUP xSIZE xIF * D3D1A
          %1 x== xTHEN                           * D3D6C
          :: %1 xSF %1 x+ xSWAP xOBJ> xOBJ> xDROP %1 x+ xROLL ; xELSE * D3D7B
          :: xDROP2 LAM a xOBJ> ; xIFEND xDUP xOBJ> xDROP x* xSWAP xOVER %2 * D3DC1
          x+ xROLLD x>LIST %1 LAM p ROMPTR 0AB 063 xOBJ> %1 x+ xROLL xIFERR * D3E06  DOSUBS
          :: xIF %1 xFS? xTHEN                   * D3E47
            :: xOBJ> xDROP x>LIST ; xIFEND x>ARRY ; * D3E60
          xERRTHEN                               * D3E88
          :: xOBJ> xIF %1 xFC?C xTHEN xDROP xIFEND xRPN-> LAM n LAM m x<< %1 * D3E8D
            LAM n xSTARTVAR LAM i LAM m x>LIST   * D3ED6
            SYMBOL LAM m LAM n LAM i x- x* LAM i x+ ; xEVAL xROLLD xNEXT * D3EFB
            LAM n x>LIST x>>ABND ;               * D3F47
          xIFEND %1 xCF x>>ABND x>> ;            * D3F5F

* ROMPTR 0E8 03D
* refs (1): D136E
TEACH~1~16:
        :: x<< xIF ID n %1 x<=? xTHEN ID n xELSE * D3F7D
          :: %0_2A2B4 %1 %2 ID n xSTART xDUP xROT x+ xNEXT xDROP ; xIFEND * D3FB2
          x>> ;                                  * D3FF7

* ROMPTR 0E8 03E
* refs (1): D136E
TEACH~1~17:
        :: x<< xRCLSIGMA xDUP xSIZE xOBJ> xDROP xRPN-> LAM s LAM n LAM m x<< * D4001
          x' ID ΣDAT xENDTIC xTRN %1 LAM m xSTARTVAR LAM j xSIGMA- xOBJ> * D4049
          xDROP LAM n x>LIST % 5E1 ID %TILE LAM j xROLLD xNEXT LAM m x>ARRY * D408D
          LAM s xSTOSIGMA x>>ABND x>> ;          * D40E7

* ROMPTR 0E8 03F
* refs (1): D136E
ATICK~1:
        :: DUP OBJ_4C64D NcaseTYPEERR RclAx*s    * D4104
          :: DUPTYPECMP? case                    * D411D
            :: SWAP TWO{}N ;                     * D412C
            INNERCOMP DUP#1= casedrop            * D4140
            :: SWAP TWO{}N ;                     * D414F
            DUP #2= casedrop                     * D4163
            :: DUPTYPECSTR? case                 * D4172
              :: C%0 4UNROLL BINT4 {}N ;         * D4181
              DROP SWAP TWO{}N ;                 * D419F
            BINT4 #= IT ROTDROP                  * D41B3
            4ROLL 3UNROLL BINT4 {}N ;            * D41C7
          ax*s(c) ;                              * D41E0

* ROMPTR 0E8 040
* refs (1): D136E
XSEND~1:
        :: FALSE ROMPTR 0E8 042 ;                * D41EA

* ROMPTR 0E8 041
* refs (1): D136E
XRECV~1:
        :: TRUE ROMPTR 0E8 042 ;                 * D4204

* ROMPTR 0E8 042
* refs (1): D136E
ROMP_0E8_042:
        :: DOOPENIO ITE                          * D421E
          :: dup;RclInVars(gn)? IT               * D422D
            :: DROP BINT36 TestSysFlag NOTcase   * D423C
              :: # 13C ERROROUT ;                * D4255
            ;                                    * D426E
            GARBAGE MEM                          * D4273
            CODE                                 * D427D  794 nibbles
              GOSBVL  SAVPTR                     * D4287
              GOSBVL  POP#                       * D428E
              ASRB.F  A                          * D4295
              LC(5)   #007D0                     * D429A
              C=A-C   A                          * D42A1
              GONC    L_D42AD                    * D42A3
              GOVLNG  GPMEMERR                   * D42A6
L_D42AD:
              R1=C                               * D42AD
              GOSBVL  MAKE$                      * D42B0
              GOSBVL  DisableIntr                * D42B7
              LC(3)   #A01                       * D42BE
              R2=C                               * D42C3
              ST=0    8                          * D42C6
              ST=1    3                          * D42C9
              ST=1    6                          * D42CC
L_D42CF:
              A=R2                               * D42CF
              A=A-1   XS                         * D42D2
              GOC     L_D4328                    * D42D5
              R2=A                               * D42D8
              ?ST=1   8                          * D42DB
              GOYES   L_D4342                    * D42DE
              LC(2)   #15                        * D42E0
L_D42E4:
              GOSUB   SUB_D454E                  * D42E4
              CD0EX                              * D42E8
              D0=C                               * D42EB
              R3=C                               * D42EE
              ST=0    2                          * D42F1
L_D42F4:
              ST=0    1                          * D42F4
              LC(5)   #14000                     * D42F7
              GOSUB   SUB_D446F                  * D42FE
              GOC     L_D42CF                    * D4302
              C=0     A                          * D4305
              LC(2)   #7F                        * D4307
              D=C     A                          * D430B
              LC(2)   #01                        * D430D
              ?C=A    B                          * D4311
              GOYES   L_D4353                    * D4314
              LC(2)   #04                        * D4316
              ?C=A    B                          * D431A
              GOYES   L_D4333                    * D431D
              LC(2)   #18                        * D431F
              ?C#A    B                          * D4323
              GOYES   L_D42F4                    * D4326
L_D4328:
              LC(5)   xferfailerr                * D4328
L_D432F:
              GOTO    L_D4405                    * D432F
L_D4333:
              LC(2)   #06                        * D4333
              GOSUB   SUB_D454E                  * D4337
              ST=0    3                          * D433B
              GOTO    L_D440F                    * D433E
L_D4342:
              GOTO    L_D43FE                    * D4342
L_D4346:
              C=RSTK                             * D4346
L_D4348:
              GOSUB   SUB_D4468                  * D4348
              GONC    L_D4348                    * D434C
L_D434F:
              GOTO    L_D42CF                    * D434F
L_D4353:
              GOSUB   SUB_D4468                  * D4353
              GOC     L_D4348                    * D4357
              C=A     A                          * D435A
              A=R2                               * D435C
              ?C=A    B                          * D435F
              GOYES   L_D436E                    * D4362
              A=A-1   A                          * D4364
              ?C#A    B                          * D4366
              GOYES   L_D4348                    * D4369
              ST=1    2                          * D436B
L_D436E:
              RSTK=C                             * D436E
              GOSUB   SUB_D4468                  * D4370
              GOC     L_D4346                    * D4374
              A=-A-1  B                          * D4377
              C=RSTK                             * D437A
              ?C#A    B                          * D437C
              GOYES   L_D4348                    * D437F
              B=0     A                          * D4381
L_D4383:
              C=R1                               * D4383
              C=C-1   A                          * D4386
              R1=C                               * D4388
              C=0     A                          * D438B
              LC(1)   #1                         * D438D
              GOC     L_D432F                    * D4390
              GOSUB   SUB_D4468                  * D4393
              GOC     L_D43B8                    * D4397
              DAT0=A  B                          * D439A
              D0=D0+  2                          * D439D
              B=B+A   A                          * D43A0
              D=D-1   A                          * D43A2
              GONC    L_D4383                    * D43A4
              GOSUB   SUB_D4468                  * D43A7
              GOC     L_D43B8                    * D43AB
              ?ST=1   8                          * D43AE
              GOYES   L_D43FE                    * D43B1
              ?A=B    B                          * D43B3
              GOYES   L_D43BB                    * D43B6
L_D43B8:
              ST=1    1                          * D43B8
L_D43BB:
              ?ST=1   1                          * D43BB
              GOYES   L_D43C5                    * D43BE
              ?ST=0   2                          * D43C0
              GOYES   L_D43E6                    * D43C3
L_D43C5:
              C=R3                               * D43C5
              D0=C                               * D43C8
              A=R1                               * D43CB
              C=0     A                          * D43CE
              LC(2)   #7F                        * D43D0
              A=A+C   A                          * D43D4
              C=D     A                          * D43D6
              A=A-C   A                          * D43D8
              R1=A                               * D43DA
              ?ST=0   1                          * D43DD
              GOYES   L_D43F6                    * D43E0
              GOTO    L_D434F                    * D43E2
L_D43E6:
              C=R2                               * D43E6
              C=C+1   B                          * D43E9
              P=      2                          * D43EC
              LC(1)   #9                         * D43EE
              P=      0                          * D43F1
              R2=C                               * D43F3
L_D43F6:
              LC(2)   #06                        * D43F6
              GOTO    L_D42E4                    * D43FA
L_D43FE:
              LC(5)   intrptderr                 * D43FE
L_D4405:
              R4=C                               * D4405
              GOSUB   SUB_D4457                  * D4408
L_D440C:
              ST=1    3                          * D440C
L_D440F:
              GOSBVL  Shrink$                    * D440F
              D1=(5)  ANNCTRL2                   * D4416
              C=DAT1  1                          * D441D
              CBIT=0  1                          * D4421
              DAT1=C  1                          * D4426
              GOSBVL  AllowIntr                  * D442A
              GOSBVL  GETPTR                     * D4431
              A=R0                               * D4438
              DAT1=A  A                          * D443B
              C=R4                               * D443E
L_D4441:
              ?ST=1   3                          * D4441
              GOYES   L_D444D                    * D4444
              GOVLNG  PushTLoop                  * D4446
L_D444D:
              R0=C                               * D444D
              GOVLNG  Push#FLoop                 * D4450

* refs (2): D4408 D4782
SUB_D4457:
              LC(3)   #218                       * D4457
L_D445C:
              GOSUB   SUB_D44FB                  * D445C
              C=C-1   XS                         * D4460
              GONC    L_D445C                    * D4463
              RTN                                * D4466

* refs (5): D4348 D4353 D4370 D4393 D43A7
SUB_D4468:
              LC(5)   #02000                     * D4468

* refs (4): D42FE D449E D44E6 D4662
SUB_D446F:
              D1=(5)  TIMER2                     * D446F
              A=DAT1  A                          * D4476
              A=A-C   A                          * D4479
L_D447B:
              D1=(2)  #11                        * D447B
              C=DAT1  1                          * D447F
              ?CBIT=1 0                          * D4483
              GOYES   L_D44C2                    * D4488
              GOSBVL  OnKeyDown?                 * D448A
              GONC    L_D44A1                    * D4491
              ST=1    8                          * D4494
              LC(5)   #00800                     * D4497
              GOC     SUB_D446F                  * D449E
L_D44A1:
              D1=(2)  #38                        * D44A1
              C=DAT1  A                          * D44A5
              ?C#A    A                          * D44A8
              GOYES   L_D447B                    * D44AB
              LC(5)   timeouterr                 * D44AD
              ?ST=0   8                          * D44B4
              RTNYES                             * D44B7

* refs (1): D4786
SUB_D44B9:
              LC(5)   intrptderr                 * D44B9
              RTNSC                              * D44C0
L_D44C2:
              ?CBIT=0 2                          * D44C2
              GOYES   L_D44D4                    * D44C7
              ST=1    1                          * D44C9
              D1=(2)  #13                        * D44CC
              DAT1=A  1                          * D44D0
L_D44D4:
              D1=(2)  #14                        * D44D4
              A=0     A                          * D44D8
              A=DAT1  B                          * D44DA
              RTNCC                              * D44DD

* refs (2): D4735 D47A5
SUB_D44DF:
              LC(5)   #1E000                     * D44DF
              GOTO    SUB_D446F                  * D44E6

* refs (2): D467B D46C1
SUB_D44EA:
              LC(2)   #01                        * D44EA
              GOSUB   SUB_D44FB                  * D44EE
              C=R2                               * D44F2
              GOSUB   SUB_D44FB                  * D44F5
              C=-C-1  A                          * D44F9

* refs (7): D445C D44EE D44F5 D454E D468B D46EF ...
SUB_D44FB:
              RSTK=C                             * D44FB
              LC(5)   #09C40                     * D44FD
              A=C     A                          * D4504
              D1=(5)  NOP1MASK18                 * D4506
L_D450D:
              C=DAT1  1                          * D450D
              ?CBIT=0 0                          * D4511
              GOYES   L_D4543                    * D4516
              GOSBVL  OnKeyDown?                 * D4518
              GONC    L_D4525                    * D451F
              ST=1    8                          * D4522
L_D4525:
              A=A-1   A                          * D4525
              GONC    L_D450D                    * D4527
              C=RSTK                             * D452A
              ?ST=0   6                          * D452C
              GOYES   L_D453F                    * D452F
              LC(5)   xferfailerr                * D4531
              R4=C                               * D4538
              GOTO    L_D440C                    * D453B
L_D453F:
              GOTO    L_D47C6                    * D453F
L_D4543:
              D1=(2)  #16                        * D4543
              C=RSTK                             * D4547
              DAT1=C  B                          * D4549
              RTN                                * D454C

* refs (4): D42E4 D4337 D472C D479C
SUB_D454E:
              GOSUB   SUB_D44FB                  * D454E
              D1=(5)  ANNCTRL2                   * D4552
              C=DAT1  1                          * D4559
              A=C     A                          * D455D
              CBIT=0  1                          * D455F
              ?ABIT=1 1                          * D4564
              GOYES   L_D4570                    * D4569
              CBIT=1  1                          * D456B
L_D4570:
              DAT1=C  1                          * D4570
              D1=(5)  IRC                        * D4574
              C=DAT1  B                          * D457B
              ?CBIT=0 2                          * D457E
              RTNYES                             * D4583
              AD0EX                              * D4585
              GOSBVL  WaitTbz0                   * D4588
              D0=D0+  2                          * D458F
              C=DAT0  B                          * D4592
              D0=D0-  1                          * D4595
              DAT0=C  1                          * D4598
              D0=A                               * D459C
              RTN                                * D459F
            ENDCODE                              * D45A1
            ITE                                  * D45A1
            :: OBJ_30607 SWAP OBJ_2157E ;        * D45A6
            :: SWAPROT OBJ_2157E ERROROUT ;      * D45BF
          ;                                      * D45D8
          :: SAFE@ NOTcase SETNONEXTERR          * D45DD
            CODE                                 * D45F1  503 nibbles
              GOSBVL  PopASavptr                 * D45FB
              D0=A                               * D4602
              R0=A                               * D4605
              GOSBVL  SAFESKIPOB                 * D4608
              LC(5)   #00203                     * D460F
              GOC     L_D4666                    * D4616
              CD0EX                              * D4619
              A=R0                               * D461C
              C=C-A   A                          * D461F
              C=C+1   A                          * D4621
              CSRB.F  A                          * D4623
              R1=C                               * D4628
              LC(3)   #901                       * D462B
              R2=C                               * D4630
              GOSBVL  SUB_72245                  * D4633
              C=DAT1  M                          * D463A
              CSL     W                          * D463E
              LC(4)   #5048                      * D4641
              R4=C                               * D4647
              GOSBVL  DisableIntr                * D464A
              C=0     A                          * D4651
              ST=C                               * D4653
              ST=1    3                          * D4655
              ST=1    7                          * D4658
L_D465B:
              LC(5)   #78000                     * D465B
              GOSUB   SUB_D446F                  * D4662
L_D4666:
              GOC     L_D46B4                    * D4666
              LC(2)   #18                        * D4669
              ?C=A    B                          * D466D
              GOYES   L_D46AD                    * D4670
              LC(2)   #15                        * D4672
              ?C#A    B                          * D4676
              GOYES   L_D465B                    * D4679
L_D467B:
              GOSUB   SUB_D44EA                  * D467B
              C=0     A                          * D467F
              LC(1)   #7                         * D4681
              D=C     A                          * D4684
              C=R4                               * D4686
              B=0     A                          * D4689
L_D468B:
              GOSUB   SUB_D44FB                  * D468B
              B=B+C   B                          * D468F
              CSR     W                          * D4692
              CSR     W                          * D4695
              D=D-1   A                          * D4698
              GONC    L_D468B                    * D469A
              A=R0                               * D469D
              D0=A                               * D46A0
              C=0     A                          * D46A3
              LC(2)   #78                        * D46A5
              GOTO    L_D46CD                    * D46A9
L_D46AD:
              LC(5)   intrptderr                 * D46AD
L_D46B4:
              ST=1    3                          * D46B4
              GOTO    L_D47CD                    * D46B7
L_D46BB:
              A=R0                               * D46BB
              D0=A                               * D46BE
              GOSUB   SUB_D44EA                  * D46C1
              B=0     A                          * D46C5
              C=0     A                          * D46C7
              LC(2)   #80                        * D46C9
L_D46CD:
              A=R1                               * D46CD
              A=A-C   A                          * D46D0
              GONC    L_D46DF                    * D46D2
              C=C+A   A                          * D46D5
              A=-A    A                          * D46D7
              ASL     A                          * D46D9
              ASL     A                          * D46DB
              C=C+A   A                          * D46DD
L_D46DF:
              R3=C                               * D46DF
              C=C-1   B                          * D46E2
              D=C     A                          * D46E5
L_D46E7:
              C=DAT0  B                          * D46E7
              D0=D0+  2                          * D46EA
              B=B+C   A                          * D46ED
              GOSUB   SUB_D44FB                  * D46EF
              D=D-1   B                          * D46F3
              GONC    L_D46E7                    * D46F6
              DSR     A                          * D46F9
              DSR     A                          * D46FB
              GOC     L_D4724                    * D46FD
L_D4700:
              C=R2                               * D4700
              C=C-1   XS                         * D4703
              R2=C                               * D4706
              GOC     L_D471A                    * D4709
              ?ST=1   8                          * D470C
              GOYES   L_D4782                    * D470F
              ?ST=0   7                          * D4711
              GOYES   L_D46BB                    * D4714
              GOTO    L_D467B                    * D4716
L_D471A:
              GOTO    L_D47C6                    * D471A
L_D471E:
              C=0     A                          * D471E
              GOSUB   SUB_D44FB                  * D4720
L_D4724:
              D=D-1   B                          * D4724
              GONC    L_D471E                    * D4727
              C=B     A                          * D472A
              GOSUB   SUB_D454E                  * D472C
              ?ST=1   8                          * D4730
              GOYES   L_D4782                    * D4733
              GOSUB   SUB_D44DF                  * D4735
L_D4739:
              GOC     L_D4700                    * D4739
              LC(2)   #18                        * D473C
              ?C=A    B                          * D4740
              GOYES   L_D471A                    * D4743
              LC(2)   #06                        * D4745
              ?C#A    B                          * D4749
              GOYES   L_D4739                    * D474C
              ST=0    7                          * D474E
              AD0EX                              * D4751
              R0=A                               * D4754
              D0=A                               * D4757
              C=R2                               * D475A
              C=C+1   A                          * D475D
              P=      2                          * D475F
              LC(1)   #9                         * D4761
              P=      0                          * D4764
              R2=C                               * D4766
              A=R1                               * D4769
              C=R3                               * D476C
              B=0     A                          * D476F
              B=C     B                          * D4771
              A=A-B   A                          * D4774
              R1=A                               * D4776
              ?A=0    A                          * D4779
              GOYES   L_D47E3                    * D477C
              GOTO    L_D46BB                    * D477E
L_D4782:
              GOSUB   SUB_D4457                  * D4782
              GOSUB   SUB_D44B9                  * D4786
              GOTO    L_D47CD                    * D478A
L_D478E:
              C=R2                               * D478E
              C=C-1   XS                         * D4791
              GOC     L_D47C6                    * D4794
L_D4797:
              R2=C                               * D4797
              C=D     A                          * D479A
              GOSUB   SUB_D454E                  * D479C
              ?ST=1   8                          * D47A0
              GOYES   L_D47C6                    * D47A3
              GOSUB   SUB_D44DF                  * D47A5
              GOC     L_D478E                    * D47A9
              LC(2)   #18                        * D47AC
              ?C=A    B                          * D47B0
              GOYES   L_D47C6                    * D47B3
              LC(2)   #06                        * D47B5
              ?C#A    B                          * D47B9
              GOYES   L_D478E                    * D47BC
              ?ST=1   8                          * D47BE
              GOYES   L_D47C6                    * D47C1
              ST=0    3                          * D47C3
L_D47C6:
              LC(5)   xferfailerr                * D47C6
L_D47CD:
              GOSBVL  AllowIntr                  * D47CD
              A=C     A                          * D47D4
              GOSBVL  GETPTR                     * D47D6
              C=A     A                          * D47DD
              GOTO    L_D4441                    * D47DF
L_D47E3:
              LC(2)   #04                        * D47E3
              D=C     A                          * D47E7
              LC(3)   #500                       * D47E9
              GOTO    L_D4797                    * D47EE
            ENDCODE                              * D47F2
            NOTcase ERROROUT                     * D47F2
          ;                                      * D47FC
        ;                                        * D4801
