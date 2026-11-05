* HP 48GX ROM revision R, #C78DB-#CA95A: Diff Eq plotting, Runge-Kutta-Fehlberg steps for scalars and vectors, adaptive step control and Rosenbrock steps
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: RRKorRKF RRKTrap RRKStep[] RRKStepSel RRKStep% RRKAccept RKFTrap RKFStep[] RKFStepSel RKFStep% RKFBindList DoRKF1
* Follows on from the previous file (at #C78DB in the original ROM).

* Library 0C1: Differential equation solvers: the commands RKF, RKFSTEP, RKFERR, RRK, RRKSTEP and RSBERR and the Diff Eq plot type, using Runge-Kutta-Fehlberg and Rosenbrock steps with adaptive step size. Also the angle factors used by unit conversion.
LIB0C1:
        CON(3)  #0C1                             * C78DB  library number
        REL(5)  LIB0C1.hash                      * C78DE  hash table
        CON(5)  0                                * C78E3  message table
        REL(5)  LIB0C1.link                      * C78E8  link table
        CON(5)  0                                * C78ED  config
        RPL

* ROMPTR 0C1 000
* refs (1): C78DB
* {list} ... -> : draws a Diff Eq plot, stepping with RKF. Binds the list's names, runs DEPlotRKF1 under an error trap and on the way out restores the stack depth and clears ATTN. The plotter calls it when no derivatives are given.
DEPlotRKF:
        :: DEPTH #5- 6PICK XLIB RKFBindList 5ROLLDROP ERRSET XLIB DEPlotRKF1 * C78F2
          ERRTRAP                                * C7926
          :: ERROR@ #0=?SEMI ERRJMP ; 5GETLAM RESETDEPTH ABND ATTNFLGCLR ; * C792B

* ROMPTR 0C1 001
* refs (1): C78DB
* Plot loop for RKF: after DEPlotInit, takes a step at a time to the end of the range, drawing a line from the last point to the new one. Runs backwards when the final T is below the current T.
DEPlotRKF1:
        :: XLIB DEPlotInit case ABND             * C795D
          ROT 3NULLLAM{} BIND 11GETLAM XLIB RKFStepSel 3GETLAM 2GETLAM ROT * C7977
          3PUTLAM RESOROMP XLIB DEStepCtl 11PUTLAM 8GETLAM 3PICK %> ?SKIP * C79A5
          :: 5GETLAM %%CHS 5PUTLAM %%CHS FALSE 12PUTLAM ; * C79D3
          SWAP BEGIN 5GETLAM                     * C79FB
          :: 4dropn;IU! caseDROP ROT             * C7A0A
            12GETLAM ITE ~2DUP;%%<;NOT?SWAPDROP %%MAX * C7A1E
            SWAP ;                               * C7A32
          8GETLAM 12GETLAM ITE OBJ_7CE00 OBJ_7CE32 * C7A3C
          11GETLAM EVAL LAM 'T @%_HERE DUP LAM 'W @[%]_HERE 10GETLAM 9GETLAM * C7A55
          2ArrEltOr% 13GETLAM 14GETLAM getypos SgnMag># SWAP 15GETLAM * C7A8E
          16GETLAM getxpos SgnMag># SWAP 6GETLAM 7GETLAM 2OVER DRAWLINE#3 * C7AB1
          7PUTLAM 6PUTLAM 8GETLAM OVER 12GETLAM ITE %<= %>= * C7AD9
          UNTIL 2DROP ABND ABND ;                * C7B01

* ROMPTR 0C1 002
* refs (1): C78DB
* Common start of a Diff Eq plot. Errors if the step limit is not positive, reads the plot range and PICT scale, binds 12 locals, checks the initial solution and works out the first step size from the tolerance. Returns TRUE when the initial T already equals the final T, so there is nothing to draw.
DEPlotInit:
        :: 3PICK %0> NOTcase SETSIZEERR          * C7B1A
          GETPMIN&MAX RclMaxStdPict PlotScales TRUE %0_2A2B4 BINT10 ROLL * C7B33
          BINT10 ROLL BINT9 ROLL %0_2A2B4 %0_2A2B4 BINT12 ROLL %ABS %>%% * C7B56
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM * C7B88
            NULLLAM NULLLAM NULLLAM NULLLAM }    * C7BB5
          BIND LAM 'T RclOr0>% DUP 2PUTLAM 4GETLAM %= caseTRUE LAM 'W * C7BCE
          RCLCRUNCH>%ARRY DUPTYPEREAL? ITE %1    * C7C07
          :: DUP ARSIZE UNCOERCE ;               * C7C1B
          6GETLAM C%>% 2DUP %MIN %0< case SETSIZEERR * C7C34
          %MAX %< case SETSIZEERR                * C7C57
          DUP 7PUTLAM LAM 'F SWAP TYPEREAL? ITE  * C7C6B
          :: CRUNCH>% %ABS %>%% ;                * C7C8F
          :: CRUNCH>RARRY ArryNorm% ;            * C7CA8
          5GETLAM SWAPDUP %%0= ITE               * C7CBC
          :: DROP 4GETLAM 2GETLAM %>%%- %%ABS ;  * C7CD0
          :: OVER %>%% SWAP%%/ %% 2E-1 %%^ %% 1E-499 %%MAX ; * C7CF3
          6GETLAM C%>% COERCE2 5PUTLAM 6PUTLAM 2GETLAM 7GETLAM 6GETLAM * C7D4A
          5GETLAM 2ArrEltOr% 9GETLAM 10GETLAM getypos SgnMag># 3PUTLAM * C7D72
          11GETLAM 12GETLAM getxpos SgnMag># 2GETLAM 3UNROLL 2PUTLAM FALSE ; * C7D95

* ROMPTR 0C1 003
* refs (1): C78DB
* {list} ... -> : as DEPlotRKF, for a list with the derivatives FW and FT, stepping with the method chosen by RRKorRKF.
DEPlotRRK:
        :: DEPTH #5- 6PICK XLIB RRKBindList 5ROLLDROP ERRSET XLIB DEPlotRRK1 * C7DC2
          ERRTRAP                                * C7DF6
          :: ERROR@ #0=?SEMI ERRJMP ; 7GETLAM RESETDEPTH ABND ATTNFLGCLR ; * C7DFB

* ROMPTR 0C1 004
* refs (1): C78DB
* Plot loop for the stiff case: as DEPlotRKF1, carrying the last method used from step to step.
DEPlotRRK1:
        :: XLIB DEPlotInit case ABND             * C7E2D
          %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 8ROLL 8NULLLAM{} BIND * C7E47
          16GETLAM XLIB RRKStepSel 5PUTLAM 4PUTLAM 3PUTLAM RESOROMP * C7E6F
          XLIB DEStepCtl 6PUTLAM 2GETLAM 8GETLAM 7GETLAM RESOROMP * C7E93
          XLIB RRKorRKF 16PUTLAM 13GETLAM 3PICK %> ?SKIP * C7EB7
          :: 10GETLAM %%CHS 10PUTLAM %%CHS FALSE 17PUTLAM ; * C7EDB
          SWAP BEGIN 10GETLAM                    * C7F03
          :: 4dropn;IU! caseDROP ROT             * C7F12
            17GETLAM ITE ~2DUP;%%<;NOT?SWAPDROP %%MAX * C7F26
            SWAP ;                               * C7F3A
          13GETLAM 17GETLAM ITE OBJ_7CE00 OBJ_7CE32 * C7F44
          SWAP 16GETLAM EVAL SWAP LAM 'T @%_HERE DUP LAM 'W @[%]_HERE * C7F5D
          15GETLAM 14GETLAM 2ArrEltOr% 18GETLAM 19GETLAM getypos SgnMag># * C7F96
          SWAP 20GETLAM 21GETLAM getxpos SgnMag># SWAP 11GETLAM 12GETLAM * C7FB9
          2OVER DRAWLINE#3 12PUTLAM 11PUTLAM 13GETLAM OVER 17GETLAM ITE %<= * C7FE1
          %>=                                    * C800E
          UNTIL 3DROP ABND ABND ;                * C8013

* ROMPTR 0C1 005
* refs (1): C78DB
* RKFERR: {list} xh -> {list} xh ydelta xerror. One RKF step of size h, leaving T and the solution unchanged.
RKFERR~1:
        :: DEPTH #2- 3PICK XLIB RKFBindList SWAPDROP %>%% ERRSET * C802C
          XLIB RKFERR~2 ERRTRAP XLIB RKFTrap 1PUTLAM 2PUTLAM 3PUTLAM 5GETLAM * C805A
          RESETDEPTH 4GETLAM 3GETLAM %%>% 2GETLAM DUPTYPEEREL? ITE %%>% * C8089
          OBJ_7CDD3                              * C80B1
          1GETABND DUPTYPEEREL? ITE %%>% OBJ_7CDD3 * C80B6
          ATTNFLGCLR ;                           * C80CF

* ROMPTR 0C1 006
* refs (1): C78DB
* Error handler of RKF, RKFERR and RKFSTEP: clears ATTN, restores the stack depth saved in local 5 and passes the error on.
RKFTrap:
        :: ATTNFLGCLR 5GETLAM RESETDEPTH ERRJMP ; * C80D9

* ROMPTR 0C1 007
* refs (1): C78DB
* Binds the step's locals, recalls T and the solution W, and runs one trial step through RKFStepSel.
RKFERR~2:
        :: %0_2A2B4 %0_2A2B4 ROT %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 * C80F7
          %0_2A2B4 8NULLLAM{} BIND LAM 'T RclOr0>% 8PUTLAM LAM 'W * C811F
          RCLCRUNCH>%ARRY DUP 7PUTLAM XLIB RKFStepSel EVAL ABND ; * C814E

* ROMPTR 0C1 008
* refs (1): C78DB
* Fehlberg 4(5) trial step for a real W, with h in local 6, t in local 8 and w in local 7. The six stages run at t, t+h/4, t+3h/8, t+12h/13, t+h and t+h/2, storing T and W for each evaluation of the expression F. Leaves the increment and the error estimate as extended reals. A step too small to change t gives an increment from the slope and an error of zero.
RKFStep%:
        :: LAM 'F CRUNCH>% %>%% 1PUTLAM 8GETLAM  * C8177
          :: DUP%0= casedrop %% 1.3E-498         * C819B
            %ABS % 1.3E-10 _*(2r);r=>rr ;        * C81C4
          6GETLAM %%ABS %%>= case                * C81E8
          :: 6GETLAM 1GETLAM OVER %%* %%0 ;      * C81FC
          8GETLAM %% 2.5E-1 6GETLAM %+%%* LAM 'T KeepVarUnit 7GETLAM 1GETLAM * C821F
          %% 2.5E-1 %%* 6GETLAM %+%%* LAM 'W KeepVarUnit LAM 'F CRUNCH>% * C8262
          %>%% 2PUTLAM 8GETLAM %% 3.75E-1 6GETLAM %+%%* LAM 'T KeepVarUnit * C82AB
          7GETLAM 1GETLAM %% 9.375E-2 %%* 2GETLAM %% 2.8125E-1 %%+* 6GETLAM * C82EE
          %+%%* LAM 'W KeepVarUnit LAM 'F CRUNCH>% %>%% 3PUTLAM 8GETLAM * C8340
          %% 9.23076923076923E-1 6GETLAM %+%%* LAM 'T KeepVarUnit 7GETLAM * C8374
          3GETLAM %% 3.32089212562585E0 %%* 2GETLAM %% 3.27719617660446E0 * C83AD
          %%-* 1GETLAM %% 8.7938097405553E-1 %%+* 6GETLAM %+%%* LAM 'W * C83F0
          KeepVarUnit LAM 'F CRUNCH>% %>%% 4PUTLAM 8GETLAM %>%% 6GETLAM * C842E
          %%+>% LAM 'T KeepVarUnit 7GETLAM 3GETLAM %% 7.17348927875244E0 %%* * C845C
          2GETLAM %% 8E0 %%-* 1GETLAM %% 2.03240740740741E0 %%* 4GETLAM * C849A
          %% 2.05896686159844E-1 %%-* %%+ 6GETLAM %+%%* LAM 'W KeepVarUnit * C84E7
          LAM 'F CRUNCH>% %>%% 5PUTLAM 8GETLAM %%.5 6GETLAM %+%%* LAM 'T * C8525
          KeepVarUnit 7GETLAM 2GETLAM %%2 %%* 3GETLAM %% 1.38167641325536E0 * C855E
          %%-* 4GETLAM %% 4.52972709551657E-1 %%* 5GETLAM %% 2.75E-1 %%-* * C8596
          1GETLAM %% 2.96296296296296E-1 %%-* %%+ 6GETLAM %+%%* LAM 'W * C85E3
          KeepVarUnit LAM 'F CRUNCH>% %>%% 2PUTLAM 8GETLAM LAM 'T * C8621
          KeepVarUnit 7GETLAM LAM 'W KeepVarUnit 6GETLAM 4GETLAM * C8650
          %% 5.06131490342017E-1 %%* 5GETLAM %% 1.8E-1 %%-* 1GETLAM * C8674
          %% 1.18518518518519E-1 %%+* 3GETLAM %% 5.18986354775828E-1 %%* * C86BC
          2GETLAM %% 3.63636363636364E-2 %%+* %%+ OVER %%* 5GETLAM %% 2E-2 * C86FF
          %%* 4GETLAM %% 2.91998936735779E-2 %%-* 1GETLAM * C8751
          %% 2.77777777777777E-3 %%+* 2GETLAM %% 3.63636363636364E-2 %%* * C877F
          3GETLAM %% 2.99415204678363E-2 %%-* %%+ 3PICK %%* ; * C87C2

* ROMPTR 0C1 009
* refs (1): C78DB
* The same Fehlberg step as RKFStep% for a vector W, with the arithmetic done on extended real arrays.
RKFStep[]:
        :: LAM 'F CRUNCH>RARRY 7GETLAM ChkVecMatDim OBJ_7CD79 1PUTLAM * C87FA
          8GETLAM                                * C8823
          :: DUP%0= casedrop %% 1.3E-498         * C8828
            %ABS % 1.3E-10 _*(2r);r=>rr ;        * C8851
          6GETLAM %%ABS %%>= case                * C8875
          :: 6GETLAM 1GETLAM OVER L%ARRY*%% %%0 ; * C8889
          8GETLAM %% 2.5E-1 6GETLAM %+%%* LAM 'T KeepVarUnit 7GETLAM * C88AC
          TOTEMPOB 1GETLAM TOTEMPOB 6GETLAM %% 2.5E-1 %%* L%ARRY*%% * C88EA
          OBJ_7D6DE LAM 'W STO_HERE LAM 'F CRUNCH>RARRY 7GETLAM ChkVecMatDim * C8922
          OBJ_7CD79 2PUTLAM 8GETLAM %% 3.75E-1 6GETLAM %+%%* LAM 'T * C8951
          KeepVarUnit 7GETLAM TOTEMPOB 1GETLAM TOTEMPOB %% 9.375E-2 * C898F
          L%ARRY*%% 2GETLAM %% 2.8125E-1 [%%]AXPY 6GETLAM L%ARRY*%% * C89C2
          OBJ_7D6DE LAM 'W STO_HERE LAM 'F CRUNCH>RARRY 7GETLAM ChkVecMatDim * C89F5
          OBJ_7CD79 3PUTLAM 8GETLAM %% 9.23076923076923E-1 6GETLAM %+%%* * C8A24
          LAM 'T KeepVarUnit 7GETLAM TOTEMPOB 3GETLAM TOTEMPOB * C8A57
          %% 3.32089212562585E0 L%ARRY*%% 2GETLAM %% -3.27719617660446E0 * C8A7B
          [%%]AXPY 1GETLAM %% 8.7938097405553E-1 [%%]AXPY 6GETLAM L%ARRY*%% * C8AB9
          OBJ_7D6DE LAM 'W STO_HERE LAM 'F CRUNCH>RARRY 7GETLAM ChkVecMatDim * C8AEC
          OBJ_7CD79 4PUTLAM 8GETLAM %>%% 6GETLAM %%+>% LAM 'T KeepVarUnit * C8B1B
          7GETLAM TOTEMPOB 3GETLAM TOTEMPOB %% 7.17348927875244E0 L%ARRY*%% * C8B49
          2GETLAM %% -8E0 [%%]AXPY 1GETLAM TOTEMPOB %% 2.03240740740741E0 * C8B7C
          L%ARRY*%% 4GETLAM %% -2.05896686159844E-1 [%%]AXPY %%1 [%%]AXPY * C8BC4
          6GETLAM L%ARRY*%% OBJ_7D6DE LAM 'W STO_HERE LAM 'F CRUNCH>RARRY * C8BF7
          7GETLAM ChkVecMatDim OBJ_7CD79 5PUTLAM 8GETLAM %%.5 6GETLAM %+%%* * C8C26
          LAM 'T KeepVarUnit 7GETLAM TOTEMPOB 2GETLAM %%2 L%ARRY*%% 3GETLAM * C8C4E
          %% -1.38167641325536E0 [%%]AXPY 4GETLAM TOTEMPOB * C8C7C
          %% 4.52972709551657E-1 L%ARRY*%% 5GETLAM %% -2.75E-1 [%%]AXPY * C8CA5
          1GETLAM %% -2.96296296296296E-1 [%%]AXPY %%1 [%%]AXPY 6GETLAM * C8CE8
          L%ARRY*%% OBJ_7D6DE LAM 'W STO_HERE LAM 'F CRUNCH>RARRY 7GETLAM * C8D1B
          ChkVecMatDim OBJ_7CD79 2PUTLAM 8GETLAM LAM 'T KeepVarUnit 7GETLAM * C8D4A
          LAM 'W STO_HERE 6GETLAM 4GETLAM TOTEMPOB %% 5.06131490342017E-1 * C8D73
          L%ARRY*%% 5GETLAM %% -1.8E-1 [%%]AXPY 1GETLAM * C8DAC
          %% 1.18518518518519E-1 [%%]AXPY 2GETLAM %% 3.63636363636364E-2 * C8DDA
          L%ARRY*%% TOTEMPOB 3GETLAM %% 5.18986354775828E-1 [%%]AXPY %%1 * C8E18
          [%%]AXPY OVER L%ARRY*%% 5GETLAM %% 2E-2 L%ARRY*%% 4GETLAM * C8E4B
          %% -2.91998936735779E-2 [%%]AXPY 1GETLAM %% 2.77777777777777E-3 * C8E83
          [%%]AXPY 2GETLAM 3GETLAM %% -2.99415204678363E-2 [%%]AXPY %%1 * C8EC1
          [%%]AXPY 3PICK L%ARRY*%% ;             * C8EF4

* ROMPTR 0C1 00A
* refs (1): C78DB
* RKFSTEP: {list} xtol xh -> {list} xtol xhnext. One adaptive step, under an error trap.
RKFSTEP~1:
        :: DEPTH #3- 4PICK XLIB RKFBindList ROTDROP %>%% ERRSET * C8F08
          XLIB RKFSTEP~2 ERRTRAP XLIB RKFTrap 1PUTLAM 2PUTLAM 5GETLAM * C8F36
          RESETDEPTH 4GETLAM 2GETLAM 1GETABND %%>% ATTNFLGCLR ; * C8F60

* ROMPTR 0C1 00B
* refs (1): C78DB
* Errors if the step is not positive, then runs DEStepCtl once with the trial step chosen by RKFStepSel.
RKFSTEP~2:
        :: OVER %0> NOTcase SETSIZEERR           * C8F83
          %0_2A2B4 SWAPROT 3NULLLAM{} BIND LAM 'W RCLCRUNCH>%ARRY * C8F9C
          XLIB RKFStepSel 3PUTLAM 2GETLAM XLIB DEStepCtl 1GETABND SWAP ; * C8FC0

* ROMPTR 0C1 00C
* refs (1): C78DB
* w -> stepcode: picks RKFStep% for a real W, RKFStep[] for a vector, and errors (501, Invalid Dimension) on a matrix.
RKFStepSel:
        :: DUP TYPERARRY? NOTcasedrop            * C8FEF
          :: RESOROMP XLIB RKFStep% ;            * C9003
          MDIMS case doerr501                    * C901D
          DROP RESOROMP XLIB RKFStep[] ;         * C902C

* ROMPTR 0C1 00D
* refs (1): C78DB
* stepcode -> hnext: adaptive step control. Runs the trial step and compares the error with the tolerance. While the error is too large it shrinks h by .9*(tol/err)^.2, no further than a tenth on the first failure, and by .2 after that. Then stores the new T and W and proposes the next step from the same formula, growing it by at most 5 times.
DEStepCtl:
        :: %%5 2PUTLAM %0_2A2B4 %0_2A2B4 ROT %0_2A2B4 %0_2A2B4 %0_2A2B4 * C9046
          %0_2A2B4 %0_2A2B4 8NULLLAM{} BIND LAM 'T RclOr0>% 8PUTLAM LAM 'W * C9073
          RCLCRUNCH>%ARRY 7PUTLAM BEGIN 12GETLAM EVAL L%ABS 10GETLAM %>%% * C90A7
          %%/ DUP %%1 %%> WHILE                  * C90CF
          :: SWAPDROP 11GETLAM %%5 EQUAL ITE     * C90E8
            :: %%1 11PUTLAM %% 2E-1 %%^ %% 9E-1 SWAP%%/ %%.1 %%MAX ; * C9106
            :: DROP %% 2E-1 ;                    * C9162
            %%* 6PUTLAM ;                        * C918B
          REPEAT ABND 2GETLAM OVER %%0= ITE SWAPDROP * C919A
          :: %% 9E-1 ROT %% 2E-1 %%^ %%/ ~2DUP;%%<;NOT?SWAPDROP ; * C91BD
          3PICK %%* 2PUTLAM LAM 'W VarAdd LAM 'T VarAdd% 2GETLAM ; * C920F

* ROMPTR 0C1 00E
* refs (1): C78DB
* RKF: {list} xtol xTfinal -> {list} xtol, where xtol may be {xtol xh}. Solves up to xTfinal under an error trap.
DoRKF:
        :: DEPTH #3- 4PICK XLIB RKFBindList ROTDROP ERRSET XLIB DoRKF1 * C9248
          ERRTRAP XLIB RKFTrap 1PUTLAM 5GETLAM RESETDEPTH 4GETLAM 1GETABND * C927C
          ATTNFLGCLR ;                           * C92A5

* ROMPTR 0C1 00F
* refs (1): C78DB
* Stepping loop of RKF: repeats DEStepCtl until T reaches the final T. Does nothing when T is already there.
DoRKF1:
        :: XLIB DEStepArgs case ABND             * C92AF
          %0_2A2B4 SWAPROT 3NULLLAM{} BIND LAM 'W RCLCRUNCH>%ARRY * C92C9
          XLIB RKFStepSel 3PUTLAM 2GETLAM 6GETLAM RESOROMP XLIB DEStepCtl * C92ED
          6PUTLAM OVER %%0> 7PUTLAM BEGIN 5GETLAM 7GETLAM ITE OBJ_7CE00 * C9317
          OBJ_7CE32                              * C9344
          6GETLAM EVAL LAM 'T @%_HERE 5GETLAM OVER 7GETLAM ITE %<= %>= * C9349
          UNTIL 2DROP 1GETABND ABND ;            * C9381

* ROMPTR 0C1 010
* refs (1): C78DB
* Reads the tolerance, optional first step and final T. Errors if the tolerance is not positive. Returns TRUE when T already equals the final T. With no step given, the first step comes from (tol/|F|)^.2; it takes the sign of the direction of travel.
DEStepArgs:
        :: DUP 3NULLLAM{} BIND 3GETLAM XLIB DETolArg OVER %0> NOTcase * C939A
          SETSIZEERR                             * C93CD
          2PUTLAM 3PUTLAM LAM 'T RclOr0>% 3GETLAM SWAP 1GETLAM OVER %= * C93D2
          casedrop TRUE                          * C9405
          2GETLAM SWAP 2PUTLAM %ABS DUP%0= ITE   * C940F
          :: 2DROP LAM 'W RCLCRUNCH>%ARRY LAM 'F SWAP TYPEREAL? ITE * C942D
            :: CRUNCH>% %ABS %>%% ;              * C9461
            :: CRUNCH>RARRY ArryNorm% ;          * C947A
            3GETLAM SWAPDUP %%0= casedrop        * C948E
            :: 1GETLAM 2GETLAM %>%%- %%ABS ;     * C94A2
            OVER %>%% SWAP%%/ %% 2E-1 %%^ %% 1E-499 %%MAX ; * C94C0
          %>%%                                   * C9512
          2GETLAM 1GETLAM %< ?SKIP %%CHS         * C9517
          FALSE ;                                * C9530

* ROMPTR 0C1 011
* refs (1): C78DB
* {T W F ...} x -> : checks that the list has at least three elements, of which the first two are names, and binds them as the locals T, W and F above two unnamed ones.
RKFBindList:
        :: DUPLENCOMP BINT3 #< case2drop SETSIZEERR * C953A
          DUPINCOMP BINT3 #- NDROP               * C9558
          { NULLLAM NULLLAM LAM 'T LAM 'W LAM 'F } BIND 3GETLAM TYPEIDNT? * C956C
          NOTcase SETTYPEERR                     * C95B0
          2GETLAM TYPEIDNT? NOTcase SETTYPEERR   * C95BA
        ;                                        * C95CE

* ROMPTR 0C1 012
* refs (1): C78DB
* xtol|{xtol xh} -> xtol xh: splits the tolerance argument. xh is 0 when it isn't given. An empty list is an error.
DETolArg:
        :: DUPTYPEREAL? case %0_2A2B4            * C95D3
          DUPNULLCOMP? case SETSIZEERR           * C95E7
          DUPDUP {}>%sBIND 1GETLAM ABND DUP BINT1 NTHCOMPDROP SWAP BINT2 * C95F6
          NTHELCOMP ?SEMI                        * C9623
          %0_2A2B4 ;                             * C962D

* ROMPTR 0C1 013
* refs (1): C78DB
* RSBERR: {list} xh -> {list} xh ydelta xerror. One Rosenbrock step of size h, leaving T and the solution unchanged.
RSBERR~1:
        :: DEPTH #2- 3PICK XLIB RRKBindList SWAPDROP %>%% ERRSET * C9637
          XLIB RSBERR~2 ERRTRAP XLIB RRKTrap 1PUTLAM 2PUTLAM 3PUTLAM 7GETLAM * C9665
          RESETDEPTH 6GETLAM 3GETLAM %%>% 2GETLAM DUPTYPEEREL? ITE %%>% * C9694
          OBJ_7CDD3                              * C96BC
          1GETABND DUPTYPEEREL? ITE %%>% OBJ_7CDD3 * C96C1
          ATTNFLGCLR ;                           * C96DA

* ROMPTR 0C1 014
* refs (1): C78DB
* Error handler of RRK, RRKSTEP and RSBERR: as RKFTrap, for the depth saved in local 7.
RRKTrap:
        :: ATTNFLGCLR 7GETLAM RESETDEPTH ERRJMP ; * C96E4

* ROMPTR 0C1 015
* refs (1): C78DB
* Binds the step's locals, recalls T and W and runs one Rosenbrock trial step: RRKStep[] for a vector, RRKStep% for a real.
RSBERR~2:
        :: %0_2A2B4 %0_2A2B4 ROT %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 * C9702
          %0_2A2B4 8NULLLAM{} BIND LAM 'T RclOr0>% 8PUTLAM LAM 'W * C972A
          RCLCRUNCH>%ARRY DUP 7PUTLAM TYPERARRY? ITE * C9759
          :: 7GETLAM MDIMS case doerr501         * C9772
            5PUTLAM XLIB RRKStep[] ;             * C978B
          XLIB RRKStep%                          * C97A0
          ABND ;                                 * C97AB

* ROMPTR 0C1 016
* refs (1): C78DB
* Rosenbrock trial step for a real W, using the derivatives FW and FT. Falls back on RKFStep% when h is too small to change t. Divides by 1-FW*h/2, taken as 1E-14 when that is zero.
RRKStep%:
        :: 8GETLAM                               * C97B5
          :: DUP%0= casedrop %% 2.5E-499         * C97BF
            %ABS % 2.5E-11 _*(2r);r=>rr ;        * C97E8
          6GETLAM %%ABS %%>= case XLIB RKFStep%  * C980C
          LAM 'FW CRUNCH>% %>%% 6GETLAM %%* %%/2 %%1 SWAP %%- 4dropn;IU! IT * C982B
          :: DROP %%1E-14 ;                      * C986A
          5PUTLAM LAM 'FT CRUNCH>% %>%% 6GETLAM %%* %%/2 4PUTLAM LAM 'F * C987E
          CRUNCH>% %>%% 4GETLAM %%+ 5GETLAM %%/ 1PUTLAM 8GETLAM %>%% 6GETLAM * C98B9
          %%+>% LAM 'T KeepVarUnit 7GETLAM 6GETLAM 1GETLAM %+%%* LAM 'W * C98EB
          KeepVarUnit LAM 'F CRUNCH>% %>%% 1GETLAM %%4 %%-* 4GETLAM %%3 %%-* * C991F
          5GETLAM %%/ 2PUTLAM 8GETLAM 6GETLAM %% 6E-1 %+%%* LAM 'T * C9957
          KeepVarUnit 7GETLAM 1GETLAM %% 9.6E-1 %%* 2GETLAM %% 1.2E-1 %%+* * C999A
          6GETLAM %+%%* LAM 'W KeepVarUnit LAM 'F CRUNCH>% %>%% DUP 1GETLAM * C99EC
          %% 7.44E0 %%+* 2GETLAM %% 1.2E0 %%+* 4GETLAM %% 4.84E0 %%+* * C9A25
          5GETLAM %%/ 3PUTLAM 1GETLAM %% -4.48E-1 %%+* 2GETLAM %% -2.16E-1 * C9A8C
          %%+* 3GETLAM %% -2E-1 %%+* 4GETLAM %% 2.32E-1 %%+* 5GETLAM %%/ * C9ADE
          4PUTLAM 8GETLAM LAM 'T KeepVarUnit 7GETLAM LAM 'W KeepVarUnit * C9B35
          6GETLAM 3GETLAM %% 1.15740740740741E-1 %%* 2GETLAM %% 2.5E-1 %%+* * C9B64
          4GETLAM %% 5.78703703703704E-1 %%+* 1GETLAM %% 1.05555555555556E0 * C9BB1
          %%+* OVER %%* 2GETLAM %% 9.72222222222222E-2 %%* 1GETLAM * C9BF4
          %% 1.57407407407407E-1 %%+* 4GETLAM %% 5.78703703703704E-1 %%+* * C9C2C
          3PICK %%* ;                            * C9C6F

* ROMPTR 0C1 017
* refs (1): C78DB
* The Rosenbrock step for a vector W. FW must be a square matrix of the size of W, else Invalid Dimension; each stage solves a linear system with it. Falls back on RKFStep[] when h is too small to change t.
RRKStep[]:
        :: 8GETLAM                               * C9C7E
          :: DUP%0= casedrop %% 2.5E-499         * C9C88
            %ABS % 2.5E-11 _*(2r);r=>rr ;        * C9CB1
          6GETLAM %%ABS %%>= case XLIB RKFStep[] * C9CD5
          LAM 'FW CRUNCH>RARRY sqmat(ar)? 5GETLAM #= NcaseDIMERR OBJ_7CD79 * C9CF4
          6GETLAM %% -5E-1 %%* L%ARRY*%% 5GETLAM BINT1 3UNROLL #1+_ONE_DO * C9D1F
          OVER PULL%%EL 1+(rr) 3PICK PUT%%EL SWAP ISTOP@ #+ SWAP LOOP * C9D5C
          SWAPDROP 5GETLAM LUFactor 2DROP 8PUTLAM LAM 'FT CRUNCH>RARRY * C9D8E
          10GETLAM ChkVecMatDim OBJ_7CD79 7PUTLAM LAM 'F CRUNCH>RARRY * C9DB9
          10GETLAM ChkVecMatDim OBJ_7CD79 7GETLAM 9GETLAM %%/2 [%%]AXPY * C9DDD
          8GETLAM SWAP BINT1 LUSolve 4PUTLAM 11GETLAM %>%% 9GETLAM %%+>% * C9E00
          LAM 'T KeepVarUnit 10GETLAM TOTEMPOB 4GETLAM TOTEMPOB 9GETLAM * C9E2D
          L%ARRY*%% OBJ_7D6DE LAM 'W STO_HERE LAM 'F CRUNCH>RARRY 10GETLAM * C9E56
          ChkVecMatDim OBJ_7CD79 4GETLAM %% -4E0 [%%]AXPY 7GETLAM 9GETLAM * C9E85
          %% -1.5E0 %%* [%%]AXPY 8GETLAM SWAP BINT1 LUSolve 5PUTLAM 11GETLAM * C9EBD
          9GETLAM %% 6E-1 %+%%* LAM 'T KeepVarUnit 10GETLAM TOTEMPOB 4GETLAM * C9EFF
          TOTEMPOB %% 9.6E-1 L%ARRY*%% 5GETLAM %% 1.2E-1 [%%]AXPY 9GETLAM * C9F42
          L%ARRY*%% OBJ_7D6DE LAM 'W STO_HERE LAM 'F CRUNCH>RARRY 10GETLAM * C9F8F
          ChkVecMatDim OBJ_7CD79 DUP TOTEMPOB 4GETLAM %% 7.44E0 [%%]AXPY * C9FBE
          5GETLAM %% 1.2E0 [%%]AXPY 7GETLAM 9GETLAM %% 2.42E0 %%* [%%]AXPY * C9FF6
          8GETLAM SWAP BINT1 LUSolve 6PUTLAM 4GETLAM %% -4.48E-1 [%%]AXPY * CA048
          5GETLAM %% -2.16E-1 [%%]AXPY 6GETLAM %% -2E-1 [%%]AXPY 7GETLAM * CA085
          9GETLAM %% 1.16E-1 %%* [%%]AXPY 8GETLAM SWAP BINT1 LUSolve 7PUTLAM * CA0D2
          ABND 8GETLAM LAM 'T KeepVarUnit 7GETLAM LAM 'W STO_HERE 6GETLAM * CA114
          3GETLAM %% 1.15740740740741E-1 L%ARRY*%% 2GETLAM %% 2.5E-1 * CA148
          [%%]AXPY 4GETLAM %% 5.78703703703704E-1 [%%]AXPY 1GETLAM * CA18B
          %% 1.05555555555556E0 [%%]AXPY OVER L%ARRY*%% 2GETLAM * CA1B9
          %% 9.72222222222222E-2 L%ARRY*%% 1GETLAM %% 1.57407407407407E-1 * CA1E7
          [%%]AXPY 4GETLAM %% 5.78703703703704E-1 [%%]AXPY 3PICK L%ARRY*%% ; * CA225

* ROMPTR 0C1 018
* refs (1): C78DB
* RRKSTEP: {list} xtol xh xlast -> {list} xtol xhnext xcurrent. One adaptive step by the better method. xlast and xcurrent are 1 for RKF and 2 for Rosenbrock.
RRKSTEP~1:
        :: DEPTH #4- 5PICK XLIB RRKBindList 4ROLLDROP SWAP %>%% SWAP ERRSET * CA25D
          XLIB RRKSTEP~2 ERRTRAP XLIB RRKTrap 1PUTLAM 2PUTLAM 3PUTLAM * CA295
          7GETLAM RESETDEPTH 6GETLAM 3GETLAM 2GETLAM %%>% 1GETABND * CA2BF
          ATTNFLGCLR ;                           * CA2E2

* ROMPTR 0C1 019
* refs (1): C78DB
* Errors if the step is not positive, binds the locals and runs RRKorRKF.
RRKSTEP~2:
        :: 3PICK %0> NOTcase SETSIZEERR          * CA2EC
          %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 6ROLL 8ROLL * CA305
          8NULLLAM{} BIND LAM 'W RCLCRUNCH>%ARRY XLIB RRKStepSel 5PUTLAM * CA328
          4PUTLAM 3PUTLAM RESOROMP XLIB DEStepCtl 6PUTLAM 8GETLAM 2GETLAM * CA352
          XLIB RRKorRKF 1GETABND 3UNROLL ;       * CA37B

* ROMPTR 0C1 01A
* refs (1): C78DB
* w -> rkfcode rrkcode n: picks the trial steps for a real or a vector. n is the size of W, 0 for a real. Errors on a matrix.
RRKStepSel:
        :: DUP TYPERARRY? NOTcasedrop            * CA395
          :: RESOROMP XLIB RKFStep% RESOROMP XLIB RRKStep% BINT0 ; * CA3A9
          MDIMS case doerr501                    * CA3D8
          RESOROMP XLIB RKFStep[] RESOROMP XLIB RRKStep[] ROT ; * CA3E7

* ROMPTR 0C1 01B
* refs (1): C78DB
* Chooses the method for one step, given the last method used. Tries Rosenbrock steps while their error meets the tolerance (RRKAccept), and otherwise takes an RKF step. Leaves the method used as a real, 1 for RKF.
RRKorRKF:
        :: 2PUTLAM 8PUTLAM LAM 'FW 5GETLAM #0= ITE * CA411
          :: CRUNCH>% %ABS %>%% ;                * CA43C
          :: CRUNCH>RARRY ArryNorm% ;            * CA455
          8GETLAM SWAP DUP 7PUTLAM OVER %%* %%ABS DUP 8PUTLAM %% 2.4E0 %%<= * CA469
          case                                   * CA4B5
          :: 6GETLAM EVAL %1 ;                   * CA4BA
          2GETLAM %2 %= ITE                      * CA4D3
          :: 8GETLAM %% 2E11 %%<= caseFALSE %% 2E11 * CA4E7
            7GETLAM %%/ SWAP %%0> ?SKIP %%CHS    * CA52F
            FALSE ;                              * CA54D
          :: %% 2.4E0 7GETLAM %%/ SWAP %%0> ?SKIP %%CHS * CA557
            8GETLAM %% 4.8E0 %%<= caseTRUE 2GETLAM * CA594
            %1 %<> ;                             * CA5C2
          case                                   * CA5D1
          :: 6GETLAM EVAL %1 ;                   * CA5D6
          %0_2A2B4 %0_2A2B4 ROT 5GETLAM %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 * CA5EF
          8NULLLAM{} BIND LAM 'T RclOr0>% 8PUTLAM LAM 'W RCLCRUNCH>%ARRY * CA617
          7PUTLAM 13GETLAM EVAL L%ABS 10GETLAM %>%% OVER %%>= case * CA646
          XLIB RRKAccept                         * CA673
          2DROP %%/2 16GETLAM OVER %%* %%ABS %% 2.4E0 %%<= case * CA67E
          :: ABND 6GETLAM EVAL %1 ;              * CA6C0
          14GETLAM 5PUTLAM 13GETLAM EVAL L%ABS 10GETLAM %>%% OVER %%>= case * CA6DE
          XLIB RRKAccept                         * CA710
          2DROP %% 2E-1 %%* 16GETLAM OVER %%* %%ABS %% 2.4E0 %%<= case * CA71B
          :: ABND 6GETLAM EVAL %1 ;              * CA777
          14GETLAM 5PUTLAM 13GETLAM EVAL L%ABS 10GETLAM %>%% OVER %%>= case * CA795
          XLIB RRKAccept                         * CA7C7
          ABND 2DROP %% 2.4E0 7GETLAM %%/ SWAP %%0> ?SKIP %%CHS * CA7D2
          6GETLAM EVAL %1 ;                      * CA814

* ROMPTR 0C1 01C
* refs (1): C78DB
* A Rosenbrock step met the tolerance: works out the next step from .9*(tol/err)^.25, stores the new T and W and returns the step with 2, the code for Rosenbrock.
RRKAccept:
        :: ABND 1GETLAM %>%% %%/ 3PICK 7GETLAM %%* %%ABS %% 2E-2 %%* 1+(rr) * CA828
          %% 3.8E0 SWAP%%/ %% 1.2E0 %%+ OVER %%0= ITE SWAPDROP * CA879
          :: %% 9E-1 ROT %% 2.5E-1 %%^ %%/ ~2DUP;%%<;NOT?SWAPDROP ; * CA8CB
          3PICK %%* 2PUTLAM LAM 'W VarAdd LAM 'T VarAdd% 2GETLAM %2 ; * CA91D
