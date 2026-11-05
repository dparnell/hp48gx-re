* HP 48GX ROM revision R, #CBACE-#CCA9E: Row and column operations on arrays: the RPL commands, then row delete, row insert and row copy in machine code
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Vec-El DoROW> DoROW-> DoRANM DoDIAG-> ArSwapRows ArOpenRow ArInsRows ArInsElC ArInsEl% ArInsEl ArDelRow
* Follows on from the previous file (at #CBACE in the original ROM).

* Library 0C3: Matrix commands that rearrange arrays: RANM, RSWP, CSWP, RCI, RCIJ, ROW+, ROW-, COL+, COL-, ROW->, ->ROW, COL->, ->COL, ->DIAG, DIAG-> and three machine-code row movers.
LIB0C3:
        CON(3)  #0C3                             * CBACE  library number
        REL(5)  LIB0C3.hash                      * CBAD1  hash table
        CON(5)  0                                * CBAD6  message table
        REL(5)  LIB0C3.link                      * CBADB  link table
        CON(5)  0                                * CBAE0  config
        RPL

* ROMPTR 0C3 000
* refs (1): CBACE
* [] -> []: fills an array with random integers from -9 to 9. The array gives the size and type.
DoRANM:
        :: CKREF DUP TYPERARRY? SWAP RESOROMP XLIB %RANDIGIT 3UNROLL * CBAE5
          ONE_DO_ARRY 3PICK EVAL 3PICK ?SKIP     * CBB13
          :: 4PICK EVAL %>C% ;                   * CBB2C
          INDEX@ PUTEL NextInArray ROTROT2DROP ; * CBB45

* ROMPTR 0C3 001
* refs (1): CBACE
* -> %: a random integer from -9 to 9.
%RANDIGIT:
        :: %RAN %10 %* %FLOOR %RAN %.5 %>= ?SKIP %CHS * CBB5E
        ;                                        * CBB90

* ROMPTR 0C3 002
* refs (1): CBACE
* RSWP: [] %i %j -> []: swaps two rows; on a vector, two elements.
RSWP~1:
        :: COERCE2 OVER#0= OVER#0= ORcase SETSIZEERR * CBB95
          3PICK MDIMS IT DROP                    * CBBB3
          XLIB ArSwapRows ;                      * CBBC7

* ROMPTR 0C3 003
* refs (1): CBACE
* [] #i #j #rows -> []: range check and swap for RSWP, and for CSWP on a vector. Equal indices just give the array back.
ArSwapRows:
        :: 2DUP#> caseSIZEERR 3PICK              * CBBD7
          #< caseSIZEERR 2DUP#=                  * CBBEB
          case2DROP rot;NewobIfNotFree           * CBBFA
          3UNROLL SWAPROWS 2DROP ;               * CBC04

* ROMPTR 0C3 004
* refs (1): CBACE
* CSWP: [] %i %j -> []: swaps two columns, by swapping rows of the transpose.
CSWP~1:
        :: COERCE2 OVER#0= OVER#0= ORcase SETSIZEERR * CBC18
          3PICK MDIMS NOTcase XLIB ArSwapRows    * CBC36
          SWAPDROP 2DUP#> caseSIZEERR 3PICK      * CBC50
          #< caseSIZEERR 2DUP#=                  * CBC64
          case2DROP rot;NewobIfNotFree           * CBC73
          @trn!(ar) 3UNROLL SWAPROWS 2DROP @trn!(ar) ; * CBC7D

* ROMPTR 0C3 005
* refs (1): CBACE
* RCI: [] %c %n -> []: multiplies row n by c.
RCI~1:
        :: COERCE DUP#0= case SETSIZEERR         * CBC9B
          3PICK MDIMS ?SKIP BINT1                * CBCB4
          3UNROLL OVER#< caseSIZEERR ROT         * CBCC8
          4ROLL OBJ_36395 4UNROLL 3UNROLL #1- OVER #* SWAP ZERO_DO #1+ * CBCDC
          DUPUNROT PULLLONGEL 4PICK L%* 3PICK PUTEL SWAP NextInArray * CBD0E
          DROPSWAPDROP ;                         * CBD36

* ROMPTR 0C3 006
* refs (1): CBACE
* RCIJ: [] %c %i %j -> []: adds c times row i to row j.
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
* ROW-: [] %n -> []' [row]: removes row n, returning it as a vector.
ROW-~1:
        :: COERCE OVER MDIMS NOTcase XLIB Vec-El * CBE3F
          DUP BINT1 {}N 5PICK ArryZero MAKEARRY 5ROLL SWAP 5PICK FALSE * CBE63
          XLIB ArCopyRow 4ROLL #1- 4ROLL TWO{}N ROT CKREF 4ROLL * CBE95
          XLIB ArDelRow SWAP MATREDIM SWAP ;     * CBEC3

* ROMPTR 0C3 008
* refs (1): CBACE
* [] #n #size -> []' el: the vector case of ROW- and COL-: removes one element.
Vec-El:
        :: 2DUP#> case SETSIZEERR                * CBEE2
          #1- BINT1 {}N 3UNROLL DUPUNROT #0= case SETSIZEERR * CBEF6
          OVER PULLEL 4UNROLL CKREF SWAP XLIB ArDelRow SWAP MATREDIM SWAP ; * CBF1E

* ROMPTR 0C3 009
* refs (1): CBACE
* COL-: [] %n -> []' [column]: removes column n, by working on the transpose.
COL-~1:
        :: COERCE OVER MDIMS NOTcase XLIB Vec-El * CBF56
          OVER BINT1 {}N 5PICK ArryZero MAKEARRY 5ROLL CKREF @trn!(ar) SWAP * CBF7A
          5PICK FALSE XLIB ArCopyRow ROT #1- 4ROLL TWO{}N ROT 4ROLL * CBFAC
          XLIB ArDelRow SWAP MATREDIM @trn!(ar) SWAP ; * CBFDF

* ROMPTR 0C3 00A
* refs (1): CBACE
* ROW+: [] [row] %n -> []': inserts a row before row n.
ROW+~1:
        :: COERCE 3PICK MDIMS NOTcase doerr501   * CC003
          4PICK MDIMS case XLIB ROW+~2           * CC021
          OVER #<>case doerr501                  * CC03B
          SWAP#1+SWAP TWO{}N 2SWAP 2ArrySameType 2SWAP 4ROLLSWAP MATREDIM * CC04A
          XLIB ArOpenRow 3UNROLL TRUE XLIB ArCopyRow DROP ; * CC06D

* ROMPTR 0C3 00B
* refs (1): CBACE
* ROW+ on a vector.
ROW+~2:
        :: 3PICK #<>case doerr501                * CC097
          2OVER #1+ #> case SETSIZEERR           * CC0AB
          ROT#+SWAP TWO{}N 2SWAP 2ArrySameType 2SWAP 4ROLLSWAP MATREDIM ROT * CC0C4

* ROMPTR 0C3 00C
* refs (1): CBACE
* Inserts all the rows of an array into another at a position, row by row, using ArOpenRow and ArCopyRow.
ArInsRows:
          :: RESOROMP XLIB ArOpenRow 4UNROLL RESOROMP XLIB ArCopyRow 4UNROLL * CC0EC
            DUP MDIMS DROP BINT1 {}N 3PICK ArryZero MAKEARRY SWAP #1+_ONE_DO * CC11B
            ISTOP@ INDEX@#- FALSE 7PICK EVAL 4PICK 4ROLL 7PICK EVAL 3UNROLL * CC14D
            TRUE 7PICK EVAL ROTSWAP NextInArray 2DROP 4UNROLL3DROP ; * CC17F
        ;                                        * CC1A7

* ROMPTR 0C3 00D
* refs (1): CBACE
* COL+: [] [column] %n -> []': inserts a column before column n, by working on the transpose.
COL+~1:
        :: COERCE 3PICK MDIMS NOTcase doerr501   * CC1AC
          4PICK MDIMS case XLIB COL+~2           * CC1CA
          3PICK #<>case doerr501                 * CC1E4
          #1+SWAP TWO{}N 2SWAP 2ArrySameType 2SWAP 4ROLL CKREF @trn!(ar) * CC1F3
          SWAP MATREDIM XLIB ArOpenRow 3UNROLL TRUE XLIB ArCopyRow DROP * CC21B
          @trn!(ar) ;                            * CC24A

* ROMPTR 0C3 00E
* refs (1): CBACE
* COL+ on a vector.
COL+~2:
        :: SWAP4PICK #<>case doerr501            * CC254
          4PICK 3PICK #1+ #> case SETSIZEERR     * CC268
          #+SWAP TWO{}N 2SWAP 2ArrySameType 2SWAP 4ROLL CKREF @trn!(ar) SWAP * CC286
          MATREDIM ROT CKREF @trn!(ar) XLIB ArInsRows @trn!(ar) ; * CC2B3

* ROMPTR 0C3 00F
* refs (1): CBACE
* [] % %n -> []': ROW+ or COL+ of a real into a vector. A complex vector takes the real as complex.
ArInsEl%:
        :: UNROTOVER TYPERARRY? ?SKIP Re>C%      * CC2DC
          XLIB ArInsEl ;                         * CC2F5

* ROMPTR 0C3 010
* refs (1): CBACE
* [] C% %n -> []': ROW+ or COL+ of a complex number into a vector. A real vector becomes complex first.
ArInsElC:
        :: ROTDUP TYPERARRY? IT r->c(ar)         * CC305
          ROT XLIB ArInsEl ;                     * CC31E

* ROMPTR 0C3 011
* refs (1): CBACE
* Grows a vector by one element and stores the element at position n.
ArInsEl:
        :: ROT COERCE 3PICK MDIMS case doerr501  * CC333
          #1+ BINT1 {}N 4ROLLSWAP MATREDIM XLIB ArOpenRow 3UNROLL PUTEL ; * CC356

* ROMPTR 0C3 012
* refs (1): CBACE
* [] -> rows... %n: ->ROW: splits a matrix into its row vectors and their count, polling ATTN.
DoROW>:
        :: DUP MDIMS NOTcase XLIB Ar>Els         * CC389
          BINT1 {}N 3PICK ArryZero MAKEARRY ROTSWAP BINT1 3UNROLL RESOROMP * CC3A8
          XLIB ArCopyRow 4UNROLL BEGIN 3PICK FALSE 6PICK EVAL ROT 5PICK OVER * CC3D5
          #> WHILE                               * CC40D
          :: #1+ 3UNROLL 5UNROLL 5PICK TOTEMPOB CkATTNQUIT ; REPEAT * CC417
          DROPSWAPDROP SWAPDROPSWAP UNCOERCE ;   * CC444

* ROMPTR 0C3 013
* refs (1): CBACE
* [] #n -> el1 ... eln %n: splits a vector into its elements and their count.
Ar>Els:
        :: #1+_ONE_DO INDEX@ PULLEL SWAP NextInArray ARSIZE UNCOERCE ; * CC458

* ROMPTR 0C3 014
* refs (1): CBACE
* ->COL: [] -> columns... %n: as DoROW> on the transpose.
→COL~1:
        :: DUP MDIMS NOTcase XLIB Ar>Els         * CC485
          2DROP CKREF @trn!(ar) XLIB DoROW> ;    * CC4A4

* ROMPTR 0C3 015
* refs (1): CBACE
* v1 ... vn #n -> []: ROW->: builds a matrix from n row vectors, or a vector from reals. Errors on non-arrays.
DoROW->:
        :: DUP#0= case SETSIZEERR                * CC4C3
          OVER TYPEARRAY? NOTcase                * CC4D7
          :: UNCOERCE XEQ>VECTOR ;               * CC4E6
          DUP 3PICK MDIMS case doerr501          * CC4FA
          TWO{}N 3PICK ArryZero MAKEARRY RESOROMP XLIB ArCopyRow SWAP 3PICK * CC513
          #1+_ONE_DO ISTOP@ INDEX@#- #3+PICK DUP TYPEARRAY? NOTcase * CC541
          SETTYPEERR                             * CC564
          2ArrySameType INDEX@ TRUE 5PICK EVAL DROP NextInArray SWAPDROP * CC569
          OVER #2+UNROLL NDROP ;                 * CC591

* ROMPTR 0C3 016
* refs (1): CBACE
* COL->: v1 ... vn %n -> []: as DoROW-> and transposes.
COL→~1:
        :: DUP#0= case SETSIZEERR                * CC5A5
          OVER TYPEARRAY? NOTcase                * CC5B9
          :: UNCOERCE XEQ>VECTOR ;               * CC5C8
          XLIB DoROW-> @trn!(ar) ;               * CC5DC

* ROMPTR 0C3 017
* refs (1): CBACE
* ->DIAG: [] -> [diagonal]: extracts the main diagonal of a matrix into a vector.
→DIAG~1:
        :: DUP MDIMS NOTcase doerr501            * CC5F1
          DUP#1+ 3UNROLL #MIN DUP BINT1 {}N 4PICK ArryZero MAKEARRY BINT1 * CC60A
          5ROLL 4ROLL #1+_ONE_DO OVER PULLEL 4ROLLSWAP INDEX@ PUTEL ROT * CC63C
          4PICK#+ ROT NextInArray 4ROLL 3DROP ;  * CC669

* ROMPTR 0C3 018
* refs (1): CBACE
* [diagonal] {dims} -> []: DIAG->: builds a matrix of the given size with that diagonal.
DoDIAG->:
        :: OVERARSIZE OVER INNERCOMP #2= NOTcase SETSIZEERR * CC687
          DUPUNROT #MIN ROT #MIN SWAP#1+ 4UNROLL SWAP 3PICK ArryZero * CC6AA
          MAKEARRY BINT1 ROT #1+_ONE_DO ROT INDEX@ PULLEL 4ROLL SWAP4PICK * CC6D7
          PUTEL ROT 4PICK#+ NextInArray DROP ROTROT2DROP ; * CC704

* ROMPTR 0C3 019
* refs (1): CBACE
* [] #n -> []: closes up the row n of an array by moving the later rows down over it. The size in the header stays. n of 0 or beyond the end is Bad Argument Value; a dimension other than two or one goes to the array error.
ArDelRow:
        CODE                                     * CC727  192 nibbles
          GOSBVL  POP#                           * CC731
          ?A=0    A                              * CC738
          GOYES   ArDelRow.L2                    * CC73B
          GOSBVL  SAVPTR                         * CC73D
          C=DAT1  A                              * CC744
          D1=C                                   * CC747
          D1=D1+  10                             * CC74A
          C=DAT1  A                              * CC74D
          D=C     A                              * CC750
          ST=0    0                              * CC752
          LC(5)   DOREAL                         * CC755
          ?D=C    A                              * CC75C
          GOYES   ArDelRow.L1                    * CC75F
          ST=1    0                              * CC761
ArDelRow.L1:
          D1=D1+  5                              * CC764
          C=DAT1  A                              * CC767
          D=C     A                              * CC76A
          D1=D1+  5                              * CC76C
          C=DAT1  A                              * CC76F
          ?C>=A   A                              * CC772
          GOYES   ArDelRow.L3                    * CC775
          GOSBVL  GETPTR                         * CC777
ArDelRow.L2:
          LC(5)   SETSIZEERR                     * CC77E
          A=C     A                              * CC785
          PC=(A)                                 * CC787
ArDelRow.L3:
          C=C-1   A                              * CC78B
          ?C#0    A                              * CC78D
          GOYES   ArDelRow.L4                    * CC790
          GOVLNG  ChkVecMatDim.L1                * CC792
ArDelRow.L4:
          C=C+1   A                              * CC799
          C=C-A   A                              * CC79B
          DCEX    A                              * CC79D
          B=C     A                              * CC79F
          D1=D1+  5                              * CC7A1
          B=B-1   A                              * CC7A4
          ?B=0    A                              * CC7A6
          GOYES   ArDelRow.L5                    * CC7A9
          C=DAT1  A                              * CC7AB
          D1=D1+  5                              * CC7AE
ArDelRow.L5:
          CSL     A                              * CC7B1
          ?ST=0   0                              * CC7B3
          GOYES   ArDelRow.L6                    * CC7B6
          C=C+C   A                              * CC7B8
ArDelRow.L6:
          R0=C                                   * CC7BA
          GOSBVL  PUTCMPEL.L6                    * CC7BD
          C=B     A                              * CC7C4
          R1=C                                   * CC7C6
          C=R0                                   * CC7C9
          D=C     A                              * CC7CC
          C=A     A                              * CC7CE
          GOSBVL  PUTCMPEL.L6                    * CC7D0
          AD1EX                                  * CC7D7
          A=A+B   A                              * CC7DA
          D0=A                                   * CC7DC
          C=R0                                   * CC7DF
          A=A-C   A                              * CC7E2
          D1=A                                   * CC7E4
          C=R1                                   * CC7E7
          GOVLNG  MULTF~jump_2.L1                * CC7EA
        ENDCODE                                  * CC7F1

* ROMPTR 0C3 01A
* refs (1): CBACE
* [] #n -> []: makes room for row n by moving it and the later rows up, after the array has been enlarged with MATREDIM.
ArOpenRow:
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
          GOYES   ArOpenRow.L1                   * CC840
          ST=1    0                              * CC842
ArOpenRow.L1:
          D1=D1+  5                              * CC845
          C=DAT1  A                              * CC848
          D=C     A                              * CC84B
          D1=D1+  5                              * CC84D
          C=DAT1  A                              * CC850
          ?A=0    A                              * CC853
          GOYES   ArOpenRow.L2                   * CC856
          ?C>=A   A                              * CC858
          GOYES   ArOpenRow.L3                   * CC85B
ArOpenRow.L2:
          GOSBVL  GETPTR                         * CC85D
          LC(5)   SETSIZEERR                     * CC864
          A=C     A                              * CC86B
          PC=(A)                                 * CC86D
ArOpenRow.L3:
          C=C-A   A                              * CC871
          DCEX    A                              * CC873
          B=C     A                              * CC875
          D1=D1+  5                              * CC877
          B=B-1   A                              * CC87A
          ?B=0    A                              * CC87C
          GOYES   ArOpenRow.L4                   * CC87F
          C=DAT1  A                              * CC881
          D1=D1+  5                              * CC884
ArOpenRow.L4:
          CSL     A                              * CC887
          ?ST=0   0                              * CC889
          GOYES   ArOpenRow.L5                   * CC88C
          C=C+C   A                              * CC88E
ArOpenRow.L5:
          A=C     A                              * CC890
          GOSBVL  PUTCMPEL.L6                    * CC892
          CD0EX                                  * CC899
          D1=C                                   * CC89C
          C=C-A   A                              * CC89F
          D0=C                                   * CC8A1
          C=B     A                              * CC8A4
          GOVLNG  ArOpenRow~1                    * CC8A6
        ENDCODE                                  * CC8AD

* ROMPTR 0C3 01B
* refs (1): CBACE
* [] [row] #n flag -> ...: copies between a vector and row n of a matrix. flag FALSE copies the row out into the vector, TRUE copies the vector in.
ArCopyRow:
        CODE                                     * CC8AD  238 nibbles
          ST=1    1                              * CC8B7
          GOSBVL  popflag                        * CC8BA
          GOC     ArCopyRow.L1                   * CC8C1
          ST=0    1                              * CC8C4
ArCopyRow.L1:
          GOSBVL  POP#                           * CC8C7
          ?A#0    A                              * CC8CE
          GOYES   ArCopyRow.L2                   * CC8D1
          GOTO    ArCopyRow.L7                   * CC8D3
ArCopyRow.L2:
          GOSBVL  SAVPTR                         * CC8D7
          C=DAT1  A                              * CC8DE
          D0=C                                   * CC8E1
          D0=D0+  10                             * CC8E4
          C=DAT0  A                              * CC8E7
          D=C     A                              * CC8EA
          ST=0    0                              * CC8EC
          LC(5)   DOREAL                         * CC8EF
          ?D=C    A                              * CC8F6
          GOYES   ArCopyRow.L3                   * CC8F9
          ST=1    0                              * CC8FB
ArCopyRow.L3:
          D0=D0+  5                              * CC8FE
          C=DAT0  A                              * CC901
          C=C-1   A                              * CC904
          ?C=0    A                              * CC906
          GOYES   ArCopyRow.L5                   * CC909
ArCopyRow.loop4:
          GOVLNG  ChkVecMatDim.L1                * CC90B
ArCopyRow.L5:
          D0=D0+  5                              * CC912
          C=DAT0  A                              * CC915
          R1=C                                   * CC918
          D0=D0+  5                              * CC91B
          CSL     A                              * CC91E
          ?ST=0   0                              * CC920
          GOYES   ArCopyRow.L6                   * CC923
          C=C+C   A                              * CC925
ArCopyRow.L6:
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
          GOYES   ArCopyRow.L8                   * CC947
          GOSBVL  GETPTR                         * CC949
ArCopyRow.L7:
          LC(5)   SETSIZEERR                     * CC950
          A=C     A                              * CC957
          PC=(A)                                 * CC959
ArCopyRow.L8:
          C=D     A                              * CC95D
          D1=D1+  5                              * CC95F
          D=D-1   A                              * CC962
          ?D=0    A                              * CC964
          GOYES   ArCopyRow.L9                   * CC967
          C=DAT1  A                              * CC969
          D1=D1+  5                              * CC96C
ArCopyRow.L9:
          CAEX    A                              * CC96F
          D=C     A                              * CC971
          D=D-1   A                              * CC973
          C=R1                                   * CC975
          ?C=A    A                              * CC978
          GOYES   ArCopyRow.L10                  * CC97B
          GOTO    ArCopyRow.loop4                * CC97D
ArCopyRow.L10:
          C=R0                                   * CC981
          GOSBVL  PUTCMPEL.L6                    * CC984
          AD1EX                                  * CC98B
          A=A+B   A                              * CC98E
          ?ST=1   1                              * CC990
          GOYES   ArCopyRow.L11                  * CC993
          AD0EX                                  * CC995
ArCopyRow.L11:
          D1=A                                   * CC998
          C=R0                                   * CC99B
          GOVLNG  MULTF~jump_2.L1                * CC99E
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
        REL(5)  LIB0C3.hash.L1                   * CC9FF  end of the names
LIB0C3.hash.L1:
        CON(5)  0                                * CCA04  command 000 has no name
        ENDLENGTH                                * CCA09

LIB0C3.link:
        CON(5)  DOHSTR                           * CCA09  link table of library 0C3
        LENGTH                                   * CCA0E  length, to #CCA9F
        REL(5)  DoRANM                           * CCA13  000 
        REL(5)  %RANDIGIT                        * CCA18  001 
        REL(5)  RSWP~1                           * CCA1D  002 
        REL(5)  ArSwapRows                       * CCA22  003 
        REL(5)  CSWP~1                           * CCA27  004 
        REL(5)  RCI~1                            * CCA2C  005 
        REL(5)  RCIJ~1                           * CCA31  006 
        REL(5)  ROW-~1                           * CCA36  007 
        REL(5)  Vec-El                           * CCA3B  008 
        REL(5)  COL-~1                           * CCA40  009 
        REL(5)  ROW+~1                           * CCA45  00A 
        REL(5)  ROW+~2                           * CCA4A  00B 
        REL(5)  ArInsRows                        * CCA4F  00C 
        REL(5)  COL+~1                           * CCA54  00D 
        REL(5)  COL+~2                           * CCA59  00E 
        REL(5)  ArInsEl%                         * CCA5E  00F 
        REL(5)  ArInsElC                         * CCA63  010 
        REL(5)  ArInsEl                          * CCA68  011 
        REL(5)  DoROW>                           * CCA6D  012 
        REL(5)  Ar>Els                           * CCA72  013 
        REL(5)  →COL~1                           * CCA77  014 
        REL(5)  DoROW->                          * CCA7C  015 
        REL(5)  COL→~1                           * CCA81  016 
        REL(5)  →DIAG~1                          * CCA86  017 
        REL(5)  DoDIAG->                         * CCA8B  018 
        REL(5)  ArDelRow                         * CCA90  019 
        REL(5)  ArOpenRow                        * CCA95  01A 
        REL(5)  ArCopyRow                        * CCA9A  01B 
