* HP 48GX ROM revision R, #CBACE-#CCA9E: Library part 0C3
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #CBACE in the original ROM).

LIB0C3:
        CON(3)  #0C3                             * CBACE  library number
        REL(5)  LIB0C3.hash                      * CBAD1  hash table
        CON(5)  0                                * CBAD6  message table
        REL(5)  LIB0C3.link                      * CBADB  link table
        CON(5)  0                                * CBAE0  config
        RPL

* ROMPTR 0C3 000
* refs (1): CBACE
ROMP_0C3_000:
        :: CKREF DUP TYPERARRY? SWAP RESOROMP ROMPTR 0C3 001 3UNROLL * CBAE5
          ONE_DO_ARRY 3PICK EVAL 3PICK ?SKIP     * CBB13
          :: 4PICK EVAL %>C% ;                   * CBB2C
          INDEX@ PUTEL NextInArray ROTROT2DROP ; * CBB45

* ROMPTR 0C3 001
* refs (1): CBACE
ROMP_0C3_001:
        :: %RAN %10 %* %FLOOR %RAN %.5 %>= ?SKIP %CHS * CBB5E
        ;                                        * CBB90

* ROMPTR 0C3 002
* refs (1): CBACE
RSWP~1:
        :: COERCE2 OVER#0= OVER#0= ORcase SETSIZEERR * CBB95
          3PICK MDIMS IT DROP                    * CBBB3
          ROMPTR 0C3 003 ;                       * CBBC7

* ROMPTR 0C3 003
* refs (1): CBACE
ROMP_0C3_003:
        :: 2DUP#> caseSIZEERR 3PICK              * CBBD7
          #< caseSIZEERR 2DUP#=                  * CBBEB
          case2DROP rot;NewobIfNotFree           * CBBFA
          3UNROLL SWAPROWS 2DROP ;               * CBC04

* ROMPTR 0C3 004
* refs (1): CBACE
CSWP~1:
        :: COERCE2 OVER#0= OVER#0= ORcase SETSIZEERR * CBC18
          3PICK MDIMS NOTcase ROMPTR 0C3 003     * CBC36
          SWAPDROP 2DUP#> caseSIZEERR 3PICK      * CBC50
          #< caseSIZEERR 2DUP#=                  * CBC64
          case2DROP rot;NewobIfNotFree           * CBC73
          @trn!(ar) 3UNROLL SWAPROWS 2DROP @trn!(ar) ; * CBC7D

* ROMPTR 0C3 005
* refs (1): CBACE
RCI~1:
        :: COERCE DUP#0= case SETSIZEERR         * CBC9B
          3PICK MDIMS ?SKIP BINT1                * CBCB4
          3UNROLL OVER#< caseSIZEERR ROT         * CBCC8
          4ROLL OBJ_36395 4UNROLL 3UNROLL #1- OVER #* SWAP ZERO_DO #1+ * CBCDC
          DUPUNROT PULLLONGEL 4PICK L%* 3PICK PUTEL SWAP NextInArray * CBD0E
          DROPSWAPDROP ;                         * CBD36

* ROMPTR 0C3 006
* refs (1): CBACE
RCIJ~1:
        :: COERCE2 OVER#0= OVER#0= ORcase SETSIZEERR * CBD40
          4PICK MDIMS ?SKIP BINT1                * CBD5E
          4UNROLL 3PICK OVER #> caseSIZEERR OVER#< * CBD72
          caseSIZEERR 4ROLL                      * CBD90
          5ROLL OBJ_36395 5UNROLL 4UNROLL #1- 3PICK #* 3UNROLL #1- OVER #* * CBD9A
          SWAP ZERO_DO #1+ 3UNROLL #1+ 3UNROLL OVER PULLLONGEL 5PICK L%* * CBDD1
          SWAP 4PICK PULLLONGEL ROT L%+ 4PICK PUTEL 3UNROLL NextInArray * CBE03
          2DROP SWAPDROP ;                       * CBE30

* ROMPTR 0C3 007
* refs (1): CBACE
ROW-~1:
        :: COERCE OVER MDIMS NOTcase ROMPTR 0C3 008 * CBE3F
          DUP BINT1 {}N 5PICK OBJ_379F0 MAKEARRY 5ROLL SWAP 5PICK FALSE * CBE63
          ROMPTR 0C3 01B 4ROLL #1- 4ROLL TWO{}N ROT CKREF 4ROLL * CBE95
          ROMPTR 0C3 019 SWAP MATREDIM SWAP ;    * CBEC3

* ROMPTR 0C3 008
* refs (1): CBACE
ROMP_0C3_008:
        :: 2DUP#> case SETSIZEERR                * CBEE2
          #1- BINT1 {}N 3UNROLL DUPUNROT #0= case SETSIZEERR * CBEF6
          OVER PULLEL 4UNROLL CKREF SWAP ROMPTR 0C3 019 SWAP MATREDIM SWAP ; * CBF1E

* ROMPTR 0C3 009
* refs (1): CBACE
COL-~1:
        :: COERCE OVER MDIMS NOTcase ROMPTR 0C3 008 * CBF56
          OVER BINT1 {}N 5PICK OBJ_379F0 MAKEARRY 5ROLL CKREF @trn!(ar) SWAP * CBF7A
          5PICK FALSE ROMPTR 0C3 01B ROT #1- 4ROLL TWO{}N ROT 4ROLL * CBFAC
          ROMPTR 0C3 019 SWAP MATREDIM @trn!(ar) SWAP ; * CBFDF

* ROMPTR 0C3 00A
* refs (1): CBACE
ROW+~1:
        :: COERCE 3PICK MDIMS NOTcase doerr501   * CC003
          4PICK MDIMS case ROMPTR 0C3 00B        * CC021
          OVER #<>case doerr501                  * CC03B
          SWAP#1+SWAP TWO{}N 2SWAP OBJ_36F74 2SWAP 4ROLLSWAP MATREDIM * CC04A
          ROMPTR 0C3 01A 3UNROLL TRUE ROMPTR 0C3 01B DROP ; * CC06D

* ROMPTR 0C3 00B
* refs (1): CBACE
ROW+~2:
        :: 3PICK #<>case doerr501                * CC097
          2OVER #1+ #> case SETSIZEERR           * CC0AB
          ROT#+SWAP TWO{}N 2SWAP OBJ_36F74 2SWAP 4ROLLSWAP MATREDIM ROT * CC0C4

* ROMPTR 0C3 00C
* refs (1): CBACE
COL+~3:
          :: RESOROMP ROMPTR 0C3 01A 4UNROLL RESOROMP ROMPTR 0C3 01B 4UNROLL * CC0EC
            DUP MDIMS DROP BINT1 {}N 3PICK OBJ_379F0 MAKEARRY SWAP * CC11B
            #1+_ONE_DO ISTOP@ INDEX@#- FALSE 7PICK EVAL 4PICK 4ROLL 7PICK * CC148
            EVAL 3UNROLL TRUE 7PICK EVAL ROTSWAP NextInArray 2DROP * CC175
            4UNROLL3DROP ;                       * CC19D
        ;                                        * CC1A7

* ROMPTR 0C3 00D
* refs (1): CBACE
COL+~1:
        :: COERCE 3PICK MDIMS NOTcase doerr501   * CC1AC
          4PICK MDIMS case ROMPTR 0C3 00E        * CC1CA
          3PICK #<>case doerr501                 * CC1E4
          #1+SWAP TWO{}N 2SWAP OBJ_36F74 2SWAP 4ROLL CKREF @trn!(ar) SWAP * CC1F3
          MATREDIM ROMPTR 0C3 01A 3UNROLL TRUE ROMPTR 0C3 01B DROP @trn!(ar) ; * CC220

* ROMPTR 0C3 00E
* refs (1): CBACE
COL+~2:
        :: SWAP4PICK #<>case doerr501            * CC254
          4PICK 3PICK #1+ #> case SETSIZEERR     * CC268
          #+SWAP TWO{}N 2SWAP OBJ_36F74 2SWAP 4ROLL CKREF @trn!(ar) SWAP * CC286
          MATREDIM ROT CKREF @trn!(ar) ROMPTR 0C3 00C @trn!(ar) ; * CC2B3

* ROMPTR 0C3 00F
* refs (1): CBACE
ROMP_0C3_00F:
        :: UNROTOVER TYPERARRY? ?SKIP Re>C%      * CC2DC
          ROMPTR 0C3 011 ;                       * CC2F5

* ROMPTR 0C3 010
* refs (1): CBACE
ROMP_0C3_010:
        :: ROTDUP TYPERARRY? IT r->c(ar)         * CC305
          ROT ROMPTR 0C3 011 ;                   * CC31E

* ROMPTR 0C3 011
* refs (1): CBACE
ROMP_0C3_011:
        :: ROT COERCE 3PICK MDIMS case doerr501  * CC333
          #1+ BINT1 {}N 4ROLLSWAP MATREDIM ROMPTR 0C3 01A 3UNROLL PUTEL ; * CC356

* ROMPTR 0C3 012
* refs (1): CBACE
ROMP_0C3_012:
        :: DUP MDIMS NOTcase ROMPTR 0C3 013      * CC389
          BINT1 {}N 3PICK OBJ_379F0 MAKEARRY ROTSWAP BINT1 3UNROLL RESOROMP * CC3A8
          ROMPTR 0C3 01B 4UNROLL BEGIN 3PICK FALSE 6PICK EVAL ROT 5PICK OVER * CC3D5
          #> WHILE                               * CC40D
          :: #1+ 3UNROLL 5UNROLL 5PICK TOTEMPOB CkATTNQUIT ; REPEAT * CC417
          DROPSWAPDROP SWAPDROPSWAP UNCOERCE ;   * CC444

* ROMPTR 0C3 013
* refs (1): CBACE
ROMP_0C3_013:
        :: #1+_ONE_DO INDEX@ PULLEL SWAP NextInArray ARSIZE UNCOERCE ; * CC458

* ROMPTR 0C3 014
* refs (1): CBACE
→COL~1:
        :: DUP MDIMS NOTcase ROMPTR 0C3 013      * CC485
          2DROP CKREF @trn!(ar) ROMPTR 0C3 012 ; * CC4A4

* ROMPTR 0C3 015
* refs (1): CBACE
ROMP_0C3_015:
        :: DUP#0= case SETSIZEERR                * CC4C3
          OVER TYPEARRAY? NOTcase                * CC4D7
          :: UNCOERCE XEQ>VECTOR ;               * CC4E6
          DUP 3PICK MDIMS case doerr501          * CC4FA
          TWO{}N 3PICK OBJ_379F0 MAKEARRY RESOROMP ROMPTR 0C3 01B SWAP 3PICK * CC513
          #1+_ONE_DO ISTOP@ INDEX@#- #3+PICK DUP TYPEARRAY? NOTcase * CC541
          SETTYPEERR                             * CC564
          OBJ_36F74 INDEX@ TRUE 5PICK EVAL DROP NextInArray SWAPDROP OVER * CC569
          #2+UNROLL NDROP ;                      * CC596

* ROMPTR 0C3 016
* refs (1): CBACE
COL→~1:
        :: DUP#0= case SETSIZEERR                * CC5A5
          OVER TYPEARRAY? NOTcase                * CC5B9
          :: UNCOERCE XEQ>VECTOR ;               * CC5C8
          ROMPTR 0C3 015 @trn!(ar) ;             * CC5DC

* ROMPTR 0C3 017
* refs (1): CBACE
→DIAG~1:
        :: DUP MDIMS NOTcase doerr501            * CC5F1
          DUP#1+ 3UNROLL #MIN DUP BINT1 {}N 4PICK OBJ_379F0 MAKEARRY BINT1 * CC60A
          5ROLL 4ROLL #1+_ONE_DO OVER PULLEL 4ROLLSWAP INDEX@ PUTEL ROT * CC63C
          4PICK#+ ROT NextInArray 4ROLL 3DROP ;  * CC669

* ROMPTR 0C3 018
* refs (1): CBACE
ROMP_0C3_018:
        :: OVERARSIZE OVER INNERCOMP #2= NOTcase SETSIZEERR * CC687
          DUPUNROT #MIN ROT #MIN SWAP#1+ 4UNROLL SWAP 3PICK OBJ_379F0 * CC6AA
          MAKEARRY BINT1 ROT #1+_ONE_DO ROT INDEX@ PULLEL 4ROLL SWAP4PICK * CC6D7
          PUTEL ROT 4PICK#+ NextInArray DROP ROTROT2DROP ; * CC704

* ROMPTR 0C3 019
* refs (1): CBACE
ROMP_0C3_019:
        CODE                                     * CC727  192 nibbles
          GOSBVL  POP#                           * CC731
          ?A=0    A                              * CC738
          GOYES   L_CC77E                        * CC73B
          GOSBVL  SAVPTR                         * CC73D
          C=DAT1  A                              * CC744
          D1=C                                   * CC747
          D1=D1+  10                             * CC74A
          C=DAT1  A                              * CC74D
          D=C     A                              * CC750
          ST=0    0                              * CC752
          LC(5)   DOREAL                         * CC755
          ?D=C    A                              * CC75C
          GOYES   L_CC764                        * CC75F
          ST=1    0                              * CC761
L_CC764:
          D1=D1+  5                              * CC764
          C=DAT1  A                              * CC767
          D=C     A                              * CC76A
          D1=D1+  5                              * CC76C
          C=DAT1  A                              * CC76F
          ?C>=A   A                              * CC772
          GOYES   L_CC78B                        * CC775
          GOSBVL  GETPTR                         * CC777
L_CC77E:
          LC(5)   SETSIZEERR                     * CC77E
          A=C     A                              * CC785
          PC=(A)                                 * CC787
L_CC78B:
          C=C-1   A                              * CC78B
          ?C#0    A                              * CC78D
          GOYES   L_CC799                        * CC790
          GOVLNG  L_370AD                        * CC792
L_CC799:
          C=C+1   A                              * CC799
          C=C-A   A                              * CC79B
          DCEX    A                              * CC79D
          B=C     A                              * CC79F
          D1=D1+  5                              * CC7A1
          B=B-1   A                              * CC7A4
          ?B=0    A                              * CC7A6
          GOYES   L_CC7B1                        * CC7A9
          C=DAT1  A                              * CC7AB
          D1=D1+  5                              * CC7AE
L_CC7B1:
          CSL     A                              * CC7B1
          ?ST=0   0                              * CC7B3
          GOYES   L_CC7BA                        * CC7B6
          C=C+C   A                              * CC7B8
L_CC7BA:
          R0=C                                   * CC7BA
          GOSBVL  L_35790                        * CC7BD
          C=B     A                              * CC7C4
          R1=C                                   * CC7C6
          C=R0                                   * CC7C9
          D=C     A                              * CC7CC
          C=A     A                              * CC7CE
          GOSBVL  L_35790                        * CC7D0
          AD1EX                                  * CC7D7
          A=A+B   A                              * CC7DA
          D0=A                                   * CC7DC
          C=R0                                   * CC7DF
          A=A-C   A                              * CC7E2
          D1=A                                   * CC7E4
          C=R1                                   * CC7E7
          GOVLNG  L_372D9                        * CC7EA
        ENDCODE                                  * CC7F1

* ROMPTR 0C3 01A
* refs (1): CBACE
ROMP_0C3_01A:
        CODE                                     * CC7F1  178 nibbles
          GOSBVL  SAVPTR                         * CC7FB
          C=DAT1  A                              * CC802
          CD1EX                                  * CC805
          D0=C                                   * CC808
          D0=D0+  5                              * CC80B
          A=DAT0  A                              * CC80E
          D0=A                                   * CC811
          D0=D0+  5                              * CC814
          A=DAT0  A                              * CC817
          D1=D1+  5                              * CC81A
          C=DAT1  A                              * CC81D
          AD1EX                                  * CC820
          C=C+A   A                              * CC823
          AD1EX                                  * CC825
          D0=C                                   * CC828
          D1=D1+  5                              * CC82B
          C=DAT1  A                              * CC82E
          D=C     A                              * CC831
          ST=0    0                              * CC833
          LC(5)   DOREAL                         * CC836
          ?D=C    A                              * CC83D
          GOYES   L_CC845                        * CC840
          ST=1    0                              * CC842
L_CC845:
          D1=D1+  5                              * CC845
          C=DAT1  A                              * CC848
          D=C     A                              * CC84B
          D1=D1+  5                              * CC84D
          C=DAT1  A                              * CC850
          ?A=0    A                              * CC853
          GOYES   L_CC85D                        * CC856
          ?C>=A   A                              * CC858
          GOYES   L_CC871                        * CC85B
L_CC85D:
          GOSBVL  GETPTR                         * CC85D
          LC(5)   SETSIZEERR                     * CC864
          A=C     A                              * CC86B
          PC=(A)                                 * CC86D
L_CC871:
          C=C-A   A                              * CC871
          DCEX    A                              * CC873
          B=C     A                              * CC875
          D1=D1+  5                              * CC877
          B=B-1   A                              * CC87A
          ?B=0    A                              * CC87C
          GOYES   L_CC887                        * CC87F
          C=DAT1  A                              * CC881
          D1=D1+  5                              * CC884
L_CC887:
          CSL     A                              * CC887
          ?ST=0   0                              * CC889
          GOYES   L_CC890                        * CC88C
          C=C+C   A                              * CC88E
L_CC890:
          A=C     A                              * CC890
          GOSBVL  L_35790                        * CC892
          CD0EX                                  * CC899
          D1=C                                   * CC89C
          C=C-A   A                              * CC89F
          D0=C                                   * CC8A1
          C=B     A                              * CC8A4
          GOVLNG  L_372E4                        * CC8A6
        ENDCODE                                  * CC8AD

* ROMPTR 0C3 01B
* refs (1): CBACE
ROMP_0C3_01B:
        CODE                                     * CC8AD  238 nibbles
          ST=1    1                              * CC8B7
          GOSBVL  popflag                        * CC8BA
          GOC     L_CC8C7                        * CC8C1
          ST=0    1                              * CC8C4
L_CC8C7:
          GOSBVL  POP#                           * CC8C7
          ?A#0    A                              * CC8CE
          GOYES   L_CC8D7                        * CC8D1
          GOTO    L_CC950                        * CC8D3
L_CC8D7:
          GOSBVL  SAVPTR                         * CC8D7
          C=DAT1  A                              * CC8DE
          D0=C                                   * CC8E1
          D0=D0+  10                             * CC8E4
          C=DAT0  A                              * CC8E7
          D=C     A                              * CC8EA
          ST=0    0                              * CC8EC
          LC(5)   DOREAL                         * CC8EF
          ?D=C    A                              * CC8F6
          GOYES   L_CC8FE                        * CC8F9
          ST=1    0                              * CC8FB
L_CC8FE:
          D0=D0+  5                              * CC8FE
          C=DAT0  A                              * CC901
          C=C-1   A                              * CC904
          ?C=0    A                              * CC906
          GOYES   L_CC912                        * CC909
L_CC90B:
          GOVLNG  L_370AD                        * CC90B
L_CC912:
          D0=D0+  5                              * CC912
          C=DAT0  A                              * CC915
          R1=C                                   * CC918
          D0=D0+  5                              * CC91B
          CSL     A                              * CC91E
          ?ST=0   0                              * CC920
          GOYES   L_CC927                        * CC923
          C=C+C   A                              * CC925
L_CC927:
          R0=C                                   * CC927
          D1=D1+  5                              * CC92A
          C=DAT1  A                              * CC92D
          D1=C                                   * CC930
          D1=D1+  10                             * CC933
          D1=D1+  5                              * CC936
          C=DAT1  A                              * CC939
          D=C     A                              * CC93C
          D1=D1+  5                              * CC93E
          C=DAT1  A                              * CC941
          ?C>=A   A                              * CC944
          GOYES   L_CC95D                        * CC947
          GOSBVL  GETPTR                         * CC949
L_CC950:
          LC(5)   SETSIZEERR                     * CC950
          A=C     A                              * CC957
          PC=(A)                                 * CC959
L_CC95D:
          C=D     A                              * CC95D
          D1=D1+  5                              * CC95F
          D=D-1   A                              * CC962
          ?D=0    A                              * CC964
          GOYES   L_CC96F                        * CC967
          C=DAT1  A                              * CC969
          D1=D1+  5                              * CC96C
L_CC96F:
          CAEX    A                              * CC96F
          D=C     A                              * CC971
          D=D-1   A                              * CC973
          C=R1                                   * CC975
          ?C=A    A                              * CC978
          GOYES   L_CC981                        * CC97B
          GOTO    L_CC90B                        * CC97D
L_CC981:
          C=R0                                   * CC981
          GOSBVL  L_35790                        * CC984
          AD1EX                                  * CC98B
          A=A+B   A                              * CC98E
          ?ST=1   1                              * CC990
          GOYES   L_CC998                        * CC993
          AD0EX                                  * CC995
L_CC998:
          D1=A                                   * CC998
          C=R0                                   * CC99B
          GOVLNG  L_372D9                        * CC99E
        ENDCODE                                  * CC9A5

LIB0C3.hash:
        CON(5)  DOHSTR                           * CC9A5  hash table of library 0C3
        LENGTH                                   * CC9AA  length, to #CCA09
        CON(5)  0                                * CC9AF  names of length 1
        CON(5)  0                                * CC9B4  names of length 2
        CON(5)  0                                * CC9B9  names of length 3
        CON(5)  0                                * CC9BE  names of length 4
        CON(5)  0                                * CC9C3  names of length 5
        CON(5)  0                                * CC9C8  names of length 6
        CON(5)  0                                * CC9CD  names of length 7
        CON(5)  0                                * CC9D2  names of length 8
        CON(5)  0                                * CC9D7  names of length 9
        CON(5)  0                                * CC9DC  names of length 10
        CON(5)  0                                * CC9E1  names of length 11
        CON(5)  0                                * CC9E6  names of length 12
        CON(5)  0                                * CC9EB  names of length 13
        CON(5)  0                                * CC9F0  names of length 14
        CON(5)  0                                * CC9F5  names of length 15
        CON(5)  0                                * CC9FA  names of length 16
        REL(5)  L_CCA04                          * CC9FF  end of the names
L_CCA04:
        CON(5)  0                                * CCA04  command 000 has no name
        ENDLENGTH                                * CCA09

LIB0C3.link:
        CON(5)  DOHSTR                           * CCA09  link table of library 0C3
        LENGTH                                   * CCA0E  length, to #CCA9F
        REL(5)  ROMP_0C3_000                     * CCA13  000 
        REL(5)  ROMP_0C3_001                     * CCA18  001 
        REL(5)  RSWP~1                           * CCA1D  002 
        REL(5)  ROMP_0C3_003                     * CCA22  003 
        REL(5)  CSWP~1                           * CCA27  004 
        REL(5)  RCI~1                            * CCA2C  005 
        REL(5)  RCIJ~1                           * CCA31  006 
        REL(5)  ROW-~1                           * CCA36  007 
        REL(5)  ROMP_0C3_008                     * CCA3B  008 
        REL(5)  COL-~1                           * CCA40  009 
        REL(5)  ROW+~1                           * CCA45  00A 
        REL(5)  ROW+~2                           * CCA4A  00B 
        REL(5)  COL+~3                           * CCA4F  00C 
        REL(5)  COL+~1                           * CCA54  00D 
        REL(5)  COL+~2                           * CCA59  00E 
        REL(5)  ROMP_0C3_00F                     * CCA5E  00F 
        REL(5)  ROMP_0C3_010                     * CCA63  010 
        REL(5)  ROMP_0C3_011                     * CCA68  011 
        REL(5)  ROMP_0C3_012                     * CCA6D  012 
        REL(5)  ROMP_0C3_013                     * CCA72  013 
        REL(5)  →COL~1                           * CCA77  014 
        REL(5)  ROMP_0C3_015                     * CCA7C  015 
        REL(5)  COL→~1                           * CCA81  016 
        REL(5)  →DIAG~1                          * CCA86  017 
        REL(5)  ROMP_0C3_018                     * CCA8B  018 
        REL(5)  ROMP_0C3_019                     * CCA90  019 
        REL(5)  ROMP_0C3_01A                     * CCA95  01A 
        REL(5)  ROMP_0C3_01B                     * CCA9A  01B 
