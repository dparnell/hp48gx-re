* HP 48GX ROM revision R, #90000-#93078: Library 0C2: eigenvalues: EGV, EGVL, SCHUR and SRAD, Householder reduction to Hessenberg form, QR iteration for real and complex matrices, and eigenvector back-substitution
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: VecMaxAbs QRSweepReal QRSweepCmplx QRStd2x2 QRShiftReal QRShiftCmplx QRRotate2 QRReflect3 QRReflect2 QRRealSchur QRIsolated QRFindSmall

        ORG     #90000

        LENGTH                                   * 90000  library object without its prolog (at the window's start): length, to #98DDD
        CON(2)  0                                * 90005  no title

* Library 0C2: Numerical linear algebra in extended reals: EGV, EGVL, SCHUR, SRAD, SVD, SVL, SNRM, RANK, COND, TRACE, QR, LQ, LU, LSQ, RREF, DET, matrix inverse and division
LIB0C2:
        CON(3)  #0C2                             * 90007  library number
        REL(5)  LIB0C2.hash                      * 9000A  hash table
        CON(5)  0                                * 9000F  message table
        REL(5)  LIB0C2.link                      * 90014  link table
        CON(5)  0                                * 90019  config
        RPL

* ROMPTR 0C2 000
* refs (1): 90007
* [A] -> %: SRAD, the spectral radius: the largest eigenvalue modulus
SRAD~1:
        :: XLIB EigenVals 1GETABND               * 9001E

* ROMPTR 0C2 001
* refs (1): 90007
* [%%] #n -> %%: largest absolute value among the elements
VecMaxAbs:
          :: %%0 3UNROLL #1+_ONE_DO INDEX@ PULL%%EL B%ABS ROT %%MAX SWAP * 90033
            NextInArray ;                        * 90065
          DROP %%>% ;                            * 9006F

* ROMPTR 0C2 002
* refs (1): 90007
* [A] -> [eigenvalues]: EGVL
EGVL~1:
        :: XLIB EigenVals ABND XLIB %%>Array ;   * 9007E

* ROMPTR 0C2 003
* refs (1): 90007
* [A] -> [%%evals]: balances, reduces to Hessenberg form and runs the QR iteration, without eigenvectors; leaves the locals bound
EigenVals:
        :: XLIB EigenBind 1GETLAM BINT1 {}N ((0,0)) MAKEARRY TRUE ROT * 900A3
          XLIB Array>%% SWAPDROP XLIB BalancePermute XLIB BalanceScale * 900D6
          4UNROLL XLIB Hessenberg DUP prefix(ar) TYPEEREL #= ITE * 900FC
          XLIB QRRealSchur XLIB QRCmplxSchur     * 90125
          2DROP SWAPDROP ;                       * 9013B

* ROMPTR 0C2 004
* refs (1): 90007
* [A] -> [vectors] [values]: EGV: as EigenVals with the transformations kept, then back-substitution, balancing undone and normalised vectors
EGV~1:
        :: XLIB EigenBind 1GETLAM BINT1 {}N ((0,0)) MAKEARRY SWAP ((0,0)) * 9014A
          1GETLAM XLIB %%Identity SWAP XLIB Array>%% SWAPDROP * 9017D
          XLIB BalancePermute XLIB BalanceScale 4UNROLL XLIB Hessenberg DUP * 901A2
          prefix(ar) TYPEEREL #= ITE             * 901CD
          :: XLIB QRRealSchur XLIB EGV~2 ;       * 901E1
          :: XLIB QRCmplxSchur XLIB EGV~5 ;      * 90201
          DROP ROTSWAP 3GETLAM 2GETLAM #= ?SKIP  * 90221
          :: 1GETLAM 2GETLAM #1- #* #1+ SWAP 3GETLAM #1+ 2GETLAM DO INDEX@ * 9023F
            4PICK HXS3@ SWAPDROP OBJ_0F656 OVER#= ITE * 9027B
            :: DROP 1GETLAM ROT#+SWAP ;          * 90299
            ::                                   * 902B2
              CODE                               * 902B7  87 nibbles
                GOSBVL  POP#                     * 902C1
                GOSBVL  SAVPTR                   * 902C8
                GOSBVL  Hex>%%                   * 902CF
                LC(16)  #9204800000000003        * 902D6
                GOSBVL  SPLTAC                   * 902E8
                GOSBVL  RADDF                    * 902EF
                C=0     W                        * 902F6
                C=C+1   A                        * 902F9
                D=0     W                        * 902FB
                P=      14                       * 902FE
                D=D+1   P                        * 90300
                GOSBVL  XYEX                     * 90303
                GOSBVL  aY^X                     * 9030A
                GOVLNG  PUSH%.L9                 * 90311
              ENDCODE                            * 90318
              3UNROLL 1GETLAM #1+_ONE_DO OVER PULL%%EL 4PICK L%* 3PICK * 90318
              PUT%%EL SWAP#1+SWAP NextInArray ROTDROP ; * 90340
            LOOP SWAPDROP ;                      * 90359
          XLIB BalanceUndo 1GETABND DUP XLIB EGV~4 XLIB %%>Array SWAP * 90368
          XLIB %%>Array ;                        * 90398

* ROMPTR 0C2 005
* refs (1): 90007
* [A] -> [Q] [T]: SCHUR: the same reduction and iteration, keeping Q; complex matrices give a triangular T
SCHUR~1:
        :: XLIB EigenBind TRUE SWAP ((0,0)) 1GETLAM XLIB %%Identity SWAP * 903A8
          OBJ_7CD79 XLIB BalancePermute 4UNROLL XLIB Hessenberg DUP * 903DC
          prefix(ar) TYPEEREL #= ITE XLIB QRRealSchur XLIB QRCmplxSchur * 90401
          ROTDROP 3UNROLL XLIB BalanceUndo ABND XLIB %%>Array SWAP * 9042B
          XLIB %%>Array ;                        * 90455

* ROMPTR 0C2 006
* refs (1): 90007
* Reduces rows 3GETLAM to 2GETLAM of the matrix to upper Hessenberg form by Householder reflections, then clears the part below the subdiagonal
Hessenberg:
        :: RESOROMP XLIB HessReflect 5PUTLAM RESOROMP XLIB HouseApply * 90465
          6PUTLAM 2GETLAM DUP 1GETLAM #1+ #* 3GETLAM 3PICK #- BEGIN DUP #>1 * 9048F
          WHILE                                  * 904CB
          :: 4ROLL 5GETLAM EVAL 4ROLL #1+ 4ROLL 1GETLAM #+#1+ 4ROLL #1- * 904D0
            CkATTNQUIT ;                         * 90507
          REPEAT 3DROP 3GETLAM 2GETLAM #- BINT2 #< ?SEMI * 90511
          2GETLAM 1GETLAM #1+ #* 3GETLAM #1- 2GETLAM DO DUPROT 3GETLAM * 90539
          INDEX@ #1+ DO 1GETLAM ROT#+SWAP %%0 3PICK PUT%%EL NextInArray * 9056B
          SWAPDROPSWAP 1GETLAM #+#1+ LOOP DROP ; * 90598

* ROMPTR 0C2 007
* refs (1): 90007
* One column of Hessenberg: makes the reflector from the column, applies it to the rest from both sides
HessReflect:
        :: 3PICK 1GETLAM #+DUP 4PICK #1- Dot%%1Stride L%RE SWAP 4PICK * 905B6
          PULL%%EL DUP dup;cc? 5PICK %%0= AND case2drop SWAPDROP * 905E8
          OVER L%ABSSQ 5ROLL %%+ %%SQRT 4UNROLL %%>=0?ROTCHS 3PICK L%- * 90610
          DUPUNROT 6PICK PUT%%EL UNROTOVER 7UNROLL L%* 6GETLAM EVAL SWAP * 9063D
          L%CONJ SWAP 5PICK #1+ 3GETLAM ZERO_DO DUPUNROT 6PICK 6PICK * 9066A
          Dot%%1Arr 4PICK L%/ SWAP 6PICK 4PICK 7PICK ZERO_DO ROT 3PICK * 90697
          PULL%%EL L%CONJ 5PICK L%* SWAP3PICK PULL%%EL ROT L%+ 3PICK PUT%%EL * 906C9
          ROT 1GETLAM #+ ROT#1+ NextInArray 2DROP SWAPDROPSWAP 1GETLAM #+ * 906FB
          LOOP DROP 7PICK case                   * 90728
          :: SWAPDROP 5ROLL 4PICK PUT%%EL ;      * 9073C
          7PICK SWAP 2GETLAM 1GETLAM #* 7PICK #+#1+ 3GETLAM 2GETLAM DO * 9075A
          3UNROLL 3PICK 7PICK 7PICK Dot%%2Arr 5PICK L%/ 3UNROLL 7PICK 5PICK * 9078C
          8PICK ZERO_DO ROT 3PICK PULL%%EL L%CONJ 6PICK L%* 5ROLL 4PICK * 907BE
          PULL%%EL ROT L%+ 4PICK PUT%%EL SWAP4ROLL 1GETLAM #+ 4ROLL #1+ * 907F0
          NextInArray 2DROP 2SWAP DROP 1GETLAM #+ LOOP DROP ROTROT2DROP * 90822
          5ROLL 4PICK PUT%%EL ;                  * 9084F

* ROMPTR 0C2 008
* refs (1): 90007
* Applies a Householder reflector to the remaining columns; used by the Hessenberg and bidiagonal reductions
HouseApply:
        :: 4PICK ROT 1GETLAM 7PICK DO SWAP#1+SWAP 5PICK 3PICK 6PICK * 90863
          Dot%%1Stride 4PICK L%/ SWAP 6PICK 4PICK 7PICK ZERO_DO ROT 3PICK * 90895
          PULL%%EL 5PICK L%* SWAP3PICK PULL%%EL ROT L%+ 3PICK PUT%%EL * 908C7
          1GETLAM 4ROLLOVER #+ 4ROLLROT #+ NextInArray 2DROP SWAPDROP LOOP * 908F4
          SWAPDROP ;                             * 90921

* ROMPTR 0C2 009
* refs (1): 90007
* Double-shift QR iteration on a real Hessenberg matrix: works down from the last row and deflates one or two eigenvalues at a time. The steps are kept in locals 5 to 14 as resolved ROM pointers, to avoid looking them up in the loop
QRRealSchur:
        :: XLIB QRIsolated 2GETLAM 3GETLAM #= ?SEMI * 9092B
          RESOROMP XLIB QRSweepReal 5PUTLAM RESOROMP XLIB QRFindSmall * 9094F
          6PUTLAM RESOROMP XLIB QRShiftReal 7PUTLAM RESOROMP XLIB QRReflect3 * 90974
          8PUTLAM RESOROMP XLIB QRApply3 9PUTLAM RESOROMP XLIB QRReflect2 * 9099E
          10PUTLAM RESOROMP XLIB QRApply2 11PUTLAM RESOROMP XLIB QRDeflate2 * 909C8
          12PUTLAM RESOROMP XLIB QRStd2x2 13PUTLAM RESOROMP XLIB QRRotate2 * 909F2
          14PUTLAM 3GETLAM BEGIN CkATTNQUIT 5GETLAM EVAL 12GETLAM EVAL #1- * 90A1C
          DUP 2GETLAM #< UNTIL DROP ;            * 90A49

* ROMPTR 0C2 00A
* refs (1): 90007
* Copies the eigenvalues that balancing isolated (outside rows 2GETLAM to 3GETLAM) from the diagonal
QRIsolated:
        :: 3PICK ?SEMI                           * 90A67
          BINT1 1GETLAM #1+_ONE_DO INDEX@ 2GETLAM OVER #> SWAP 3GETLAM #> * 90A76
          ORNOT 2GETLAM 3GETLAM #< AND ?SKIP     * 90AA8
          :: DUPUNROT PULL%%EL 5PICK SWAP INDEX@ PUT%%EL DROPSWAP ; * 90AC6
          ISTOP@ #+ NextInArray DROP ;           * 90AF3

* ROMPTR 0C2 00B
* refs (1): 90007
* Iterates double-shift sweeps until the bottom of the active block splits off
QRSweepReal:
        :: 2GETLAM DUP#2+ 3PICK #> ?SEMI         * 90B0C
          BINT1 4PUTLAM ROT BEGIN 6GETLAM EVAL 3PICK3PICK #1+ #> WHILE * 90B2A
          :: %%0 15PUTLAM %%0 16PUTLAM %%0 17PUTLAM 7GETLAM EVAL DUPUNROT * 90B5C
            DUP#1- 1GETLAM #1+ #* BEGIN 8GETLAM EVAL SWAP#1+SWAP 1GETLAM * 90B8E
            #+#1+ 6PICK 3PICK #1+ #= UNTIL 10GETLAM EVAL 2DROP SWAPDROP * 90BBB
            4GETLAM #1+ 4PUTLAM ;                * 90BED
          REPEAT 3UNROLL ;                       * 90C01

* ROMPTR 0C2 00C
* refs (1): 90007
* Looks up from the bottom for a subdiagonal element below 1E-13 of its neighbours, and sets it to 0
QRFindSmall:
        :: 3PICK DUP#1- 1GETLAM #1+ #* BEGIN CkATTNQUIT ROTOVER PULL%%EL DUP * 90C10
          =0?(nb) case                           * 90C47
          :: RDROP DROPSWAPDROP ROTDROP ;        * 90C51
          SWAP3PICK 1GETLAM #- PULL%%EL B%ABS1 SWAP 4PICK #1+ PULL%%EL * 90C6A
          B%ABS1 ROT %%+ DUP %%0> ?SKIP          * 90C97
          :: DROP 5PICK #1- 1GETLAM #1+ #* #1+ 5PICK 7PICK #1-- 1GETLAM OVER * 90CB5
            #* 3PICK#+ 3UNROLL %%0 5ROLL ROT 4PICK#+ 4ROLL DO %%0 4PICK * 90CF6
            INDEX@ DO SWAPINDEX@ PULL%%EL B%ABS ROT %%+ 1GETLAM +LOOP ROT * 90D2D
            %%MAX SWAP NextInArray ROTDROPSWAP ; * 90D5F
          %%1E-13 %%* ROT B%ABS1 %%>= case       * 90D78
          :: RDROP %%0 3PICK PUT%%EL SWAPDROP ROTDROP ; * 90D96
          ROT #1-ROT 1GETLAM #-#1- OVER5PICK #= UNTIL 2DROP ; * 90DBE

* ROMPTR 0C2 00D
* refs (1): 90007
* Forms the double shift and finds the row to start the sweep. Every fifth sweep uses the exceptional shift (0.75 and -0.4375)
QRShiftReal:
        :: 3PICK #1- 1GETLAM #1+ #* DUPUNROT 4GETLAM BINT5 #= ITE * 90DEB
          :: PULL%%EL %%ABS SWAP3PICK 1GETLAM #-#1- PULL%%EL %%ABS ROT %%+ * 90E22
            DUP %% 7.5E-1 %%* DUPROT DUP %%* %% -4.375E-1 %%* 4ROLL BINT0 * 90E54
            4PUTLAM ;                            * 90EB0
          :: #1+ PULL%%EL SWAP3PICK 1GETLAM #- PULL%%EL SWAP 4PICK PULL%%EL * 90EBA
            SWAP 5PICK 1GETLAM #1-- PULL%%EL ROT %%*SWAP ; * 90EEC
          7PICK #1- 6ROLL 1GETLAM #-#1- BEGIN CkATTNQUIT SWAP#1-SWAP ROTOVER * 90F14
          1GETLAM #- PULL%%EL SWAP3PICK PULL%%EL SWAP 4PICK 1GETLAM #1-- * 90F41
          PULL%%EL BINT9 PICK 5PICK %%- BINT9 PICK 6PICK %%- 2DUP %%* BINT10 * 90F6E
          PICK %%- 6ROLL %%/ 4ROLL %%+ 4ROLL 6PICK #1+ PULL%%EL DUP 7PICK * 90FAA
          %%- 5ROLL %%- 5ROLL %%- ROT 6PICK 1GETLAM #+#1+ PULL%%EL 5PICK * 90FE6
          %%ABS 4PICK %%ABS %%+ OVER %%ABS %%+ DUPUNROT %%/ 17PUTLAM ROTOVER * 9101D
          %%/ 16PUTLAM 4ROLLSWAP %%/ 15PUTLAM 5ROLL BINT9 PICK OVER#=case * 91054
          :: RDROP DROP 7UNROLL 6DROP OVER ;     * 91081
          5ROLL 1GETLAM #-#1- ROTOVER 1GETLAM #- PULL%%EL %%ABS 5ROLL %%ABS * 910A4
          %%+ 5ROLL %%ABS %%+ 15GETLAM %%ABS %%* SWAP3PICK PULL%%EL %%ABS * 910D6
          16GETLAM %%ABS 17GETLAM %%ABS %%+ %%* SWAP 5UNROLL SWAP %%1E-13 * 91108
          %%* %%<= UNTIL DROP ROTDROPROTDROP ROTDROP ; * 9113A

* ROMPTR 0C2 00E
* refs (1): 90007
* One step of the real sweep: a three-element reflector
QRReflect3:
        :: 4PICK 3PICK #< ITE                    * 9115D
          :: ROTOVER PULL%%EL 15PUTLAM OVER 1GETLAM #+ PULL%%EL 16PUTLAM * 91176
            OVER 1GETLAM #2* #+ PULL%%EL 17PUTLAM ; * 911A3
          ROT                                    * 911C6
          15GETLAM 16GETLAM %%SQR 17GETLAM DUP %%+* %%SQRT 15GETLAM * 911CB
          ~%%0<;?SEMI;%%CHS 15GETLAM OVER %%- DUP 15PUTLAM OVER %%* 3UNROLL * 911F3
          6PICK 6PICK #< ITE                     * 91220
          :: 4PICK PUT%%EL %%0 4PICK 1GETLAM #+ PUT%%EL %%0 4PICK 1GETLAM * 91234
            #2* #+ PUT%%EL ;                     * 9126B
          :: 7PICK 7PICK #= caseDROP SWAP        * 9127F
            4PICK PULL%%EL 15GETLAM 4ROLL %%/ 1+(rr) %%* 4PICK PUT%%EL ; * 9129D
          3PICK 1GETLAM #1+ 6PICK DO #1+ DUPUNROT PULL%%EL 3PICK 1GETLAM #+ * 912CF
          ROTOVER PULL%%EL SWAPROT 1GETLAM #+ PULL%%EL DUPUNROT 17GETLAM %%* * 91306
          4PICK 16GETLAM %%+* 5PICK 15GETLAM %%+* 7PICK %%/ SWAP 5ROLL 3PICK * 91333
          15GETLAM %%+* 6PICK PUT%%EL 4ROLL 3PICK 16GETLAM %%+* 5PICK * 9136A
          1GETLAM #+ PUT%%EL 3UNROLL 17GETLAM %%+* 3PICK 1GETLAM #2* #+ * 91397
          PUT%%EL SWAP NextInArray DROP 4PICK 8PICK OVER #3+ #MIN BINT0 * 913C9
          9GETLAM EVAL 4UNROLL 8PICK caseDROP 8PICK * 913FB
          2GETLAM #1- 1GETLAM #* 5PICK #+ 3GETLAM #1+ 2GETLAM 9GETLAM EVAL * 91419
          2DROP ;                                * 91450

* ROMPTR 0C2 00F
* refs (1): 90007
* Applies a three-element reflector to a range of columns or rows
QRApply3:
        :: DO DUPUNROT PULL%%EL SWAP3PICK #1+ PULL%%EL SWAP 4PICK #2+ * 9145A
          PULL%%EL DUPUNROT 17GETLAM L%* 4PICK 16GETLAM L%* L%+ 5PICK * 9148C
          15GETLAM L%* L%+ 7PICK L%/ SWAP 5ROLL 3PICK 15GETLAM L%* L%+ 6PICK * 914B9
          PUT%%EL 4ROLL 3PICK 16GETLAM L%* L%+ 5PICK #1+ PUT%%EL 3UNROLL * 914F5
          17GETLAM L%* L%+ 3PICK #2+ PUT%%EL SWAP 1GETLAM #+ NextInArray * 91527
          DROP ;                                 * 91559

* ROMPTR 0C2 010
* refs (1): 90007
* One step of the complex sweep: a two-element reflector
QRReflect2:
        :: 4PICK 3PICK #< ITE                    * 91563
          :: ROTOVER PULL%%EL 15PUTLAM OVER 1GETLAM #+ PULL%%EL 16PUTLAM ; * 9157C
          ROT                                    * 915AE
          15GETLAM L%ABSSQ 16GETLAM L%ABSSQ %%+ %%SQRT 15GETLAM L%RE * 915B3
          ~%%0<;?SEMI;%%CHS 15GETLAM OVER L%- DUP 15PUTLAM OVER L%* 3UNROLL * 915DB
          6PICK 6PICK #< ITE                     * 91608
          :: 4PICK PUT%%EL %%0 4PICK 1GETLAM #+ PUT%%EL ; * 9161C
          :: 7PICK 7PICK #= caseDROP SWAP        * 91649
            4PICK PULL%%EL 15GETLAM L%CONJ 4ROLL L%/ %%1 L%+ L%* 4PICK * 91667
            PUT%%EL ;                            * 91699
          3PICK 1GETLAM #1+ 6PICK DO #1+ DUPUNROT PULL%%EL SWAP3PICK 1GETLAM * 916A3
          #+ PULL%%EL DUPUNROT 16GETLAM L%CONJ L%* 4PICK 15GETLAM L%CONJ L%* * 916D5
          L%+ 6PICK L%/ SWAP 4ROLL 3PICK 15GETLAM L%* L%+ 5PICK PUT%%EL * 91707
          3UNROLL 16GETLAM L%* L%+ 3PICK 1GETLAM #+ PUT%%EL SWAP NextInArray * 9173E
          DROP SWAP L%CONJ SWAP 4PICK 8PICK OVER #2+ #MIN BINT0 11GETLAM * 91770
          EVAL 4UNROLL 8PICK caseDROP 8PICK      * 917A7
          2GETLAM #1- 1GETLAM #* 5PICK #+ 3GETLAM #1+ 2GETLAM 11GETLAM EVAL * 917C0
          2DROP ;                                * 917F7

* ROMPTR 0C2 011
* refs (1): 90007
* Applies a two-element reflector to a range of columns or rows
QRApply2:
        :: DO DUPUNROT PULL%%EL SWAP3PICK #1+ PULL%%EL DUPUNROT 16GETLAM L%* * 91801
          4PICK 15GETLAM L%* L%+ 6PICK L%/ SWAP 4ROLL 3PICK 15GETLAM L%CONJ * 91833
          L%* L%+ 5PICK PUT%%EL 3UNROLL 16GETLAM L%CONJ L%* L%+ 3PICK #1+ * 9186A
          PUT%%EL SWAP 1GETLAM #+ NextInArray DROP ; * 918A1

* ROMPTR 0C2 012
* refs (1): 90007
* Takes a split-off block of one or two rows: stores its eigenvalues and rotates a 2x2 block to standard form
QRDeflate2:
        :: 2DUP #=case                           * 918C4
          :: 3PICK 3PICK #1- 1GETLAM #* 4PICK#+ PULL%%EL 7PICK SWAP 5ROLL * 918D3
            PUT%%EL 2DROP ;                      * 9190A
          SWAPDROPDUP 1GETLAM #1+ #* 3PICKOVER 1GETLAM #- PULL%%EL SWAP3PICK * 91919
          #1+ 1GETLAM #- PULL%%EL SWAP 4PICK PULL%%EL SWAP 5PICK #1+ * 91946
          PULL%%EL SWAPDROP 13GETLAM EVAL OVER %%0= ITE 4PICKOVER * 91978
          :: 3PICK3PICK %%* %%ABS %%SQRT 2DUP %%>C%% 3PICK ROT %%CHS %%>C%% ; * 919A0
          BINT13 PICK ROT BINT11 PICK PUT%%EL SWAP BINT10 PICK #1+ PUT%%EL * 919DC
          DROP 6PICK %%1 EQUAL 6PICK %%0= AND case 7DROP * 91A13
          BINT9 PICK SWAP 8PICK #1+ PUT%%EL SWAP 7PICK PUT%%EL SWAP 6PICK * 91A40
          1GETLAM #1-- PUT%%EL SWAP 5PICK 1GETLAM #- PUT%%EL DROP ROT 4PICK * 91A77
          #1+ 1GETLAM #=?SKIP                    * 91AAE
          :: #2+ 5PICK 1GETLAM 6PICK #-#1- ZERO_DO OVER 1GETLAM #- PULL%%EL * 91ABD
            SWAP3PICK PULL%%EL DUPUNROT 6PICK L%* 4PICK 8PICK L%* L%+ 5PICK * 91AF4
            1GETLAM #- PUT%%EL SWAP 6PICK L%* ROT 5PICK L%* L%- 3PICK * 91B26
            PUT%%EL SWAP#1+SWAP NextInArray DROP ; * 91B5D
          DROP 3PICK #1=?SKIP                    * 91B76
          :: 3PICK 5PICK OVER BINT1 14GETLAM EVAL ; 5PICK case2DROP 1GETLAM * 91B85
          2GETLAM #1- #* 4PICK#+ 6PICK 3GETLAM #1+ 2GETLAM 14GETLAM EVAL * 91BBC
          2DROP ;                                * 91BEE

* ROMPTR 0C2 013
* refs (1): 90007
* Applies the 2x2 rotation of QRDeflate2 to a range
QRRotate2:
        :: DO OVER PULL%%EL SWAP3PICK #1+ PULL%%EL DUPUNROT 6PICK L%* 4PICK * 91BF8
          8PICK L%* L%+ 5PICK PUT%%EL SWAP 6PICK L%* ROT 5PICK L%* L%- 3PICK * 91C2F
          #1+ PUT%%EL 1GETLAM ROT#+SWAP NextInArray 2DROP ; * 91C70

* ROMPTR 0C2 014
* refs (1): 90007
* a b c d -> ...: gives the rotation that brings a real 2x2 block to standard form, with equal diagonal when its eigenvalues are complex
QRStd2x2:
        :: %%1 5UNROLL %%0 5UNROLL OVER %%0= ?SEMI * 91C93
          3PICK %%0= case                        * 91CBB
          :: 5ROLL 6UNROLL 4UNROLL %%CHS SWAPROT ; * 91CCA
          4PICKOVER EQUAL 4PICK %%SGN1 4PICK %%SGN1 EQUALNOT OVER AND * 91CED
          caseDROP                               * 91D1A
          :: caseFALSE 6ROLL                     * 91D1F
            6ROLL 2DROP 4PICKOVER %%- 2OVER %%+ 2DUP%%R OVER %%ABS OVER %%/ * 91D2E
            1+(rr) %%/2 %%SQRT 4ROLL %%/2 ROT 3PICK %%* %%/ %%CHS ROT %%SGN1 * 91D65
            %%* 6PICK 3PICK %%* 6PICK 3PICK %%+* 6ROLL 4PICK %%* 7ROLL 4PICK * 91DA1
            %%-* 2SWAP 6PICK 3PICK %%* 6PICK 3PICK %%+* 6ROLL 4PICK %%* * 91DDD
            7ROLL 4PICK %%-* 2SWAP 6PICK 3PICK %%* 5PICK 3PICK %%+* 5ROLL * 91E14
            4PICK %%* 7ROLL 4PICK %%-* 2SWAP 6PICK 3PICK %%* 6PICK 3PICK * 91E4B
            %%+* 6ROLL 4PICK %%* 7ROLL 4PICK %%-* 6ROLL %%+ DUP %%/2 ROT * 91E82
            6ROLL 3PICK 5ROLL %%ABS %%1E-13 %%* 3PICK %%ABS OVER %%> ?SKIP * 91EBE
            :: ROTDROP %%0 3UNROLL ;             * 91EF5
            4PICK %%ABS %%< ?SKIP                * 91F0E
            :: ROTDROP %%0 3UNROLL ;             * 91F22
            OVER %%0= caseTRUE 3PICK             * 91F3B
            %%0= case                            * 91F4F
            :: 5ROLL %%CHS 6UNROLL SWAP %%CHS 3UNROLL TRUE ; * 91F59
            3PICK %%SGN1 3PICK %%SGN1 EQUALNOT ; * 91F86
          ?SEMI                                  * 91FA4
          DROP OVER %%ABS %%SQRT OVER %%ABS %%SQRT 2DUP %%* 4PICK %%SGN1 %%* * 91FA9
          6ROLL 2DUP %%+ 7UNROLL SWAP %%- 5UNROLL 2OVER %%+ %%ABS %%1/ * 91FE5
          %%SQRT 5ROLL 5ROLL %%- 5UNROLL %%0 5UNROLL DUPUNROT %%*UNROT %%* * 9201C
          8PICK OVER %%* 8PICK 4PICK %%-* 8ROLL ROT %%* 8ROLL 4ROLL %%+* * 9204E
          6UNROLL 6UNROLL ;                      * 9208A

* ROMPTR 0C2 015
* refs (1): 90007
* Eigenvectors of a real quasi-triangular matrix: back-substitution, last column first, one real eigenvalue or complex pair at a time
EGV~2:
        :: 1GETLAM #1= ?SEMI                     * 92099
          1GETLAM BINT1 {}N %%0 MAKEARRY 4PUTLAM #TWO#TWO TWO{}N %%0 * 920AD
          MAKEARRY 5PUTLAM #TWO#ONE {}N %%0 MAKEARRY 6PUTLAM 1GETLAM BINT1 * 920DA
          {}N ((0,0)) MAKEARRY 7PUTLAM #TWO#TWO TWO{}N ((0,0)) MAKEARRY * 92107
          8PUTLAM #TWO#ONE {}N ((0,0)) MAKEARRY 9PUTLAM RESOROMP * 9212F
          XLIB EigvecReal 10PUTLAM RESOROMP XLIB EGV~3 11PUTLAM RESOROMP * 92152
          XLIB EigvecRow 12PUTLAM 1GETLAM DUPDUP #* BEGIN CkATTNQUIT * 9217C
          3PICKOVER #1- PULL%%EL SWAPDROP %%0= ITE 10GETLAM 11GETLAM * 921A5
          EVAL OVER BINT2 #< UNTIL 2DROP ;       * 921CD

* ROMPTR 0C2 016
* refs (1): 90007
* Back-substitution for a real eigenvalue. A zero pivot is replaced by 1E-14 of the eigenvalue's size
EigvecReal:
        :: DUP 4ROLLOVER PULL%%EL DUP B%ABS1 %%1E-14 %%* %%1E-514 %%MAX * 921F0
          13PUTLAM 3UNROLL 4GETLAM 6PICK DUP ONE_DO ROTOVER PULL%%EL B%NEG * 92222
          4ROLLSWAP INDEX@ PUT%%EL ROT 1GETLAM #+ NextInArray DROP %%1 7PICK * 9224F
          PUT%%EL 6PICK #1- BEGIN CkATTNQUIT 4ROLL 1GETLAM #-#1- 4ROLL 3PICK * 92281
          :: #1= caseTRUE OVER#1-                * 922B3
            PULL%%EL =0?(nb) ;                   * 922C7
          ITE                                    * 922D6
          :: OVER PULL%%EL 6PICK L%- DUP B%ABS1 13GETLAM %%< IT * 922DB
            :: DROP 13GETLAM ;                   * 9230D
            5ROLL 5PICK PULL%%EL ROT L%/ 5PICK PUT%%EL BINT1 ; * 92321
          :: ROT #1-ROT 1GETLAM #-#1- ROTOVER PULL%%EL 6PICK %%- 5GETLAM * 9234E
            OVER BINT1 PUT%%EL SWAP BINT4 PUT%%EL SWAP3PICK #1+ PULL%%EL * 92380
            ROTSWAP BINT2 PUT%%EL SWAP3PICK 1GETLAM #+ PULL%%EL ROTSWAP * 923AD
            BINT3 PUT%%EL 5ROLL 5PICK PULL%%EL 6GETLAM SWAPONE PUT%%EL SWAP * 923D5
            6PICK #1+ PULL%%EL ROTSWAP BINT2 PUT%%EL ROT BINT2 LUFactor * 92402
            2DROP SWAPONE LUSolve ABND BINT1 PULL%%EL ROTSWAP 6PICK PUT%%EL * 9242F
            SWAP BINT2 PULL%%EL SWAPDROP 5PICK #1+ PUT%%EL BINT2 ; * 9245C
          12GETLAM EVAL 4ROLL #1- DUP#0= UNTIL DROP ROTDROPROTDROP 5PICK * 92489
          BINT1 1GETLAM ZERO_DO SWAPROT 3PICK BINT1 8PICK Dot%%2Arr ROTSWAP * 924B6
          4PICK 8PICK #1-+ PUT%%EL ROT 1GETLAM #+ NextInArray 3DROP ROT * 924E3
          #1-ROT 1GETLAM #-#1- ;                 * 92515

* ROMPTR 0C2 017
* refs (1): 90007
* One row of the back-substitution
EigvecRow:
        :: 5PICK #1= caseDROP 3UNROLL            * 92529
          5PICK DUP ONE_DO SWAPINDEX@ PULL%%EL 4ROLLROT 4PICK 8PICK 7PICK * 92542
          Dot%%2Arr 4ROLLSWAP L%- INDEX@ PUT%%EL ROT 1GETLAM #+ NextInArray * 9256F
          DROP ROTDROP ;                         * 9259C

* ROMPTR 0C2 018
* refs (1): 90007
* Back-substitution for a complex pair of eigenvalues; the vectors are complex
EGV~3:
        :: SWAP#1-SWAP 1GETLAM #-#1- DUP 4ROLLOVER PULL%%EL SWAP3PICK #1+ * 925AB
          PULL%%EL SWAP 4PICK 1GETLAM #+ PULL%%EL SWAP 4UNROLL 2DUP %%* * 925D8
          %%ABS %%SQRT 4ROLLOVER %%>C%% 6UNROLL 3PICK %%ABS 3PICK %%ABS %%>= * 9260A
          ITE                                    * 9263C
          :: C%%1 ROTDROPSWAP ROT %%/ %%0 SWAP %%>C%% ; * 92641
          :: ROTDROPSWAP %%/ %%CHS %%0 %%>C%% %%0 %%1 %%>C%% ; * 9266E
          7GETLAM ROT 8PICK PUT%%EL SWAP 7PICK #1+ PUT%%EL 6PICK #1= ?SKIP * 926A0
          :: 6PICK DUP ONE_DO 3UNROLL 3PICK 8PICK BINT2 Dot%%2Arr B%NEG * 926D7
            INDEX@ PUT%%EL ROT 1GETLAM #+ NextInArray DROP 6PICK #1- BEGIN * 92709
            CkATTNQUIT 4ROLL 1GETLAM #-#1- 4ROLL 3PICK * 9273B
            :: #1= caseTRUE OVER#1-              * 92759
              PULL%%EL %%0= ;                    * 9276D
            ITE                                  * 9277C
            :: OVER PULL%%EL 6PICK L%- 5ROLL 5PICK PULL%%EL ROT L%/ 5PICK * 92781
              PUT%%EL BINT1 ;                    * 927B8
            :: ROT #1-ROT 1GETLAM #-#1- ROTOVER PULL%%EL 6PICK L%- 8GETLAM * 927C7
              OVER BINT1 PUT%%EL SWAP BINT4 PUT%%EL SWAP3PICK #1+ PULL%%EL * 927F9
              ROTSWAP BINT2 PUT%%EL SWAP3PICK 1GETLAM #+ PULL%%EL ROTSWAP * 92826
              BINT3 PUT%%EL 5ROLL 5PICK PULL%%EL SWAP 6PICK #1+ PULL%%EL * 9284E
              4ROLL BINT2 LUFactor DROP =0?(nb) ITE * 9287B
              :: DROP %%1E-14 L%/ ROT %%1E-14 L%/ ; * 92899
              :: 12GETLAM ROT BINT2 PUT%%EL 4ROLL BINT1 PUT%%EL BINT1 * 928C1
                LUSolve BINT2 PULL%%EL SWAPONE PULL%%EL SWAPDROP ; * 928EE
              ABND ROTSWAP 6PICK PUT%%EL SWAP 5PICK #1+ PUT%%EL BINT2 ; * 92911
            12GETLAM EVAL 4ROLL #1- DUP#0= UNTIL DROP ; * 92943
          ROTDROPROTDROP 5PICK BINT1 1GETLAM ZERO_DO SWAPROT 3PICK BINT1 * 9296B
          8PICK #1+ Dot%%2Arr ROTOVER 5PICK BINT9 PICK #1-+ PUT%%EL SWAP * 92993
          L%CONJ 4PICK 8PICK #+ PUT%%EL ROT 1GETLAM #+ NextInArray 3DROP ROT * 929C5
          #1-ROT 1GETLAM #-#1- ;                 * 929FC

* ROMPTR 0C2 019
* refs (1): 90007
* Normalises each eigenvector: divides by its norm and turns the largest element real
EGV~4:
        :: ROTOVER #1+_ONE_DO ((0,0)) %%0 ROT INDEX@ 6PICK ZERO_DO DUPUNROT * 92A10
          PULL%%EL DUP L%ABSSQ 5PICK OVER %%>= ?SKIP * 92A42
          :: 2SWAP 6ROLL 6ROLL ;                 * 92A65
          2DROP SWAP 5PICK #+ NextInArray DROP OVER %%0= 4PICK C%%1 EQUAL OR * 92A7E
          ?SKIP                                  * 92ABA
          :: ROT C%%CONJ 3UNROLL INDEX@ 6PICK ZERO_DO DUPUNROT PULL%%EL * 92ABF
            5PICK C%%C*C 4PICK C%%C/R 3PICK PUT%%EL SWAP 5PICK #+ * 92AEC
            NextInArray DROP ;                   * 92B19
          ROTROT2DROP LOOP ROTROT2DROP ;         * 92B28

* ROMPTR 0C2 01A
* refs (1): 90007
* Single-shift QR iteration on a complex Hessenberg matrix
QRCmplxSchur:
        :: XLIB QRIsolated 2GETLAM 3GETLAM #= ?SEMI * 92B3C
          RESOROMP XLIB QRSweepCmplx 5PUTLAM RESOROMP XLIB QRFindSmall * 92B60
          6PUTLAM RESOROMP XLIB QRShiftCmplx 7PUTLAM RESOROMP * 92B85
          XLIB QRReflect2 10PUTLAM RESOROMP XLIB QRApply2 11PUTLAM 3GETLAM * 92BA4
          BEGIN CkATTNQUIT 5GETLAM EVAL 4PICK ?SKIP * 92BCE
          :: DUPUNROT #1- 1GETLAM #* 3PICK#+ PULL%%EL 5PICK SWAP 4PICK * 92BEC
            PUT%%EL DROPSWAP ;                   * 92C1E
          #1- DUP 2GETLAM #< UNTIL DROP ;        * 92C2D

* ROMPTR 0C2 01B
* refs (1): 90007
* Iterates single-shift sweeps until the bottom of the active block splits off
QRSweepCmplx:
        :: 2GETLAM 2DUP#= caseDROP BINT1         * 92C50
          4PUTLAM ROT BEGIN 6GETLAM EVAL 3PICK3PICK #> WHILE * 92C69
          :: %%0 15PUTLAM %%0 16PUTLAM %%0 17PUTLAM 7GETLAM EVAL DUPUNROT * 92C91
            DUP#1- 1GETLAM #1+ #* BEGIN 10GETLAM EVAL SWAP#1+SWAP 1GETLAM * 92CC3
            #+#1+ 6PICK 3PICK #= UNTIL 2DROP SWAPDROP 4GETLAM #1+ 4PUTLAM ; * 92CF0
          REPEAT SWAPDROPSWAP ;                  * 92D27

* ROMPTR 0C2 01C
* refs (1): 90007
* Forms the single shift and finds the row to start the sweep. Every fifth sweep uses an exceptional shift
QRShiftCmplx:
        :: 3PICK #1- 1GETLAM #1+ #* DUPUNROT 4GETLAM BINT5 #= ITE * 92D36
          :: PULL%%EL B%ABS1 SWAP3PICK 1GETLAM #-#1- DUP#0= ITE DROPSWAP * 92D6D
            :: PULL%%EL B%ABS1 ROT %%+ ;         * 92D9A
            SWAP BINT0 4PUTLAM ;                 * 92DB8
          :: #1+ PULL%%EL SWAP3PICK PULL%%EL SWAP 4PICK 1GETLAM #1-- * 92DCC
            PULL%%EL ROT C%%C*C DUP C%%0= ITE DROP * 92DF9
            :: SWAP 4PICK 1GETLAM #- PULL%%EL 4PICK C%%C-C %%.5 C%%C*R * 92E1C
              DUPDUP C%%C*C 4PICK C%%C+C         * 92E4E
              :: DUP C%%0= ?SEMI                 * 92E62
                C%%>%% 2DUP%%R 3PICK %%ABS %%+ %%/2 %%SQRT DUPDUP %%+ * 92E76
                ROTSWAP %%/ ROT %%0>= case %%>C%% * 92EA3
                DUP %%ABS 3UNROLL ~%%0>=;?SEMI;%%CHS %%>C%% ; * 92EC1
              OVER C%%>%% 3PICK C%%>%% ROT %%*UNROT %%+* %%0>= ?SKIP C%%CHS * 92EDF
              C%%C+C ROTSWAP C%%C/C ROTSWAP C%%C-C SWAP ; * 92F11
          ;                                      * 92F34
          5PICK 4ROLL BEGIN CkATTNQUIT SWAP#1-SWAP ROTOVER 1GETLAM #- * 92F39
          PULL%%EL SWAP3PICK #1+ PULL%%EL SWAP 4PICK PULL%%EL 4PICK 8PICK * 92F61
          L%- OVER B%ABS1 OVER B%ABS1 %%+ DUPUNROT L%/ 15PUTLAM L%/ 16PUTLAM * 92F8E
          5ROLL 7PICK OVER#=case                 * 92FC5
          :: RDROP DROP 5UNROLL 4DROP OVER ;     * 92FD4
          5ROLL 1GETLAM #-#1- 5ROLL B%ABS1 5ROLL B%ABS1 %%+ 15GETLAM B%ABS1 * 92FF7
          %%* %%1E-13 %%* 4ROLL 3PICK PULL%%EL 16GETLAM L%* B%ABS SWAP * 93029
          5UNROLL %%>= UNTIL DROP ROTDROP ;      * 9305B
