* HP 48GX ROM revision R, #CCA9F-#CF37F: ZFACTOR, FANNING, DARCY, F0λ, SIDENS, TDELTA and TINC, shared argument errors, then MINEHUNT with its messages and pictures
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: SymFcn1 ~UTVUNS1Arg ~UTTYPEEXT0? UndefResultErr SymFcnSS SymFcnSN SymFcnNS SymFcn2 MHWinGrob MHWin MHUpRight MHUpLeft
* Follows on from the previous file (at #CCA9F in the original ROM).
        ENDLENGTH                                * CCA9F
        ENDLENGTH                                * CCA9F

        CON(5)  DOLIB                            * CCA9F  library object
        LENGTH                                   * CCAA4  length, to #CF380
        CON(2)  0                                * CCAA9  title length

* Library 0E7: Support for the Equation Library: the functions ZFACTOR, FANNING, DARCY, F0λ, SIDENS, TDELTA and TINC with their symbolic forms, and the game MINEHUNT.
LIB0E7:
        CON(3)  #0E7                             * CCAAB  library number
        REL(5)  LIB0E7.hash                      * CCAAE  hash table
        REL(5)  MHMessages                       * CCAB3  message table
        REL(5)  LIB0E7.link                      * CCAB8  link table
        CON(5)  0                                * CCABD  config
        RPL

* ROMPTR 0E7 000
* refs (1): CCAAB
* ZFACTOR: xTr yPr -> z, taking units or numbers. Strips units and calls %ZFACTOR.
ZFACTOR~1:
        :: SWAP %1 UMCONV SWAP %1 UMCONV XLIB %ZFACTOR ; * CCAC2

* ROMPTR 0E7 001
* refs (1): CCAAB
* %Tr %Pr -> %z: gas compressibility factor from reduced temperature and pressure. Solves the state equation for the reduced density by Newton's method to 1E-10. Undefined for Tr below 1.05 or from 3 upwards in the first check, or for Pr outside (0,30).
%ZFACTOR:
        :: OVER % 1.05E0 %< 3PICK %3 %>= ORcase XLIB UndefResultErr * CCAF5
          DUP %0> NOT OVER % 3E1 %>= ORcase XLIB UndefResultErr * CCB38
          % 6.4225133E-2 3PICK % 5.3530771E-1 %* % 6.1232032E-1 %- 4PICK DUP * CCB76
          %* 5PICK % 3.1506237E-1 %* % 1.0467099E0 %- % 5.7832729E-1 3PICK * CCBCE
          %/ %- % 6.8157001E-1 ROT %/ % 6.8446549E-1 6PICK % 2.7E-1 %* DUP * CCC26
          BINT9 PICK %/                          * CCC88
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM * CCC97
            NULLLAM }                            * CCCC4
          BIND BEGIN 1GETLAM DUP %* DUP 3GETLAM %* DUP %CHS %EXP OVER %1+ * CCCCE
          OVER %* 4GETLAM %* 6GETLAM %+ 1GETLAM %* 5GETLAM %+ 4PICK DUP %* * CCD0F
          7GETLAM %* %+ 1GETLAM %* 9GETLAM %+ 1GETLAM %* 2GETLAM %- 4UNROLL * CCD50
          %3 3PICK DUP %+ %- ROT %* %3 %+ %* 4GETLAM %* 6GETLAM %3 %* %+ %6 * CCD8C
          7GETLAM %* ROT %* 1GETLAM %* %+ 1GETLAM %* 5GETLAM DUP %+ %+ * CCDE1
          1GETLAM %* 9GETLAM %+ %/ DUP %ABS 1GETLAM %/ 1GETLAM ROT %- * CCE22
          1PUTLAM % 1E-10 %<= UNTIL 2GETLAM 9GETLAM %/ 1GETLAM %/ ABND ; * CCE5E

* ROMPTR 0E7 002
* refs (1): CCAAB
* Errors with Undefined Result.
UndefResultErr:
        :: # 304 ERRORSTO ERRJMP ;               * CCEA5  "Undefined Result"

* ROMPTR 0E7 003
* refs (1): CCAAB
* FANNING: x/D Re -> f, taking units or numbers. Strips units and calls %FANNING.
FANNINGUnits:
        :: SWAP %1 UMCONV SWAP %1 UMCONV XLIB %FANNING ; * CCEC3

* ROMPTR 0E7 004
* refs (1): CCAAB
* %x/D %Re -> %f: Fanning friction factor. Below Re 2100 it is the laminar 16/Re. Above, it runs three fixed-point steps of the Colebrook equation and improves them with an Aitken step. A negative argument is Undefined Result.
%FANNING:
        :: OVER %0< case XLIB UndefResultErr     * CCEF6
          DUP %0< case XLIB UndefResultErr       * CCF15
          DUP % 2.1E3 %<= ITE                    * CCF2F
          :: SWAPDROP % 1.6E1 SWAP %/ ;          * CCF53
          :: SWAP % 3.7E0 %/ % 1.2E1 3PICK %/ OVER %+ XLIB %LOGpos % -5.02E0 * CCF81
            2DUP %* 5PICK %/ 4PICK %+ XLIB %LOGpos DUPROT %* 5ROLL %/ 4ROLL * CCFEE
            %+ XLIB %LOGpos OVER 4PICK %= ITE 2DROP * CD030
            :: 3PICK ROT2DUP SWAP %- DUP %* 4UNROLLDUP %+ %- %+ %/ %- ; * CD059
            %1/ DUP %* % 1.6E1 %/ ;              * CD09F
        ;                                        * CD0CD

* ROMPTR 0E7 005
* refs (1): CCAAB
* % -> %: LOG, with Undefined Result for a negative argument.
%LOGpos:
        :: DUP %0< case XLIB UndefResultErr      * CD0D2
          %LOG ;                                 * CD0F1

* ROMPTR 0E7 006
* refs (1): CCAAB
* Errors with Bad Argument Type.
BadTypeErr:
        :: # 202 ERROROUT ;                      * CD0FB  "Bad Argument Type"

* ROMPTR 0E7 007
* refs (1): CCAAB
* Errors with Bad Argument Value.
BadValueErr:
        :: # 203 ERROROUT ;                      * CD114  "Bad Argument Value"

* ROMPTR 0E7 008
* refs (1): CCAAB
* DARCY: x/D Re -> f, with units: four times the Fanning factor.
DARCY~1:
        :: XLIB FANNINGUnits %4 %* ;             * CD12D

* ROMPTR 0E7 009
* refs (1): CCAAB
* DARCY for reals: four times %FANNING.
DARCY~2:
        :: XLIB %FANNING %4 %* ;                 * CD14C

* ROMPTR 0E7 00A
* refs (1): CCAAB
* F0λ: lambda T -> f, with units. Converts to metres and kelvin and calls %F0λ.
F0λ~1:
        :: SWAP                                  * CD16B
          UNIT %1 tok_m umEND ; UMCONV CARCOMP SWAP * CD175
          UNIT %1 $ "K" umEND ; UMCONV CARCOMP XLIB %F0λ ; * CD19D

* ROMPTR 0E7 00B
* refs (1): CCAAB
* %lambda %T -> %f: fraction of black-body emissive power from wavelength 0 to lambda. Takes x = c2/(lambda*T). Below 2 it uses a power series, otherwise the exponential sum, run until it stops changing. The factor 15/pi^4 is 1.5398973382E-1.
%F0λ:
        :: OVER %0< case XLIB UndefResultErr     * CD1D7
          DUP %0< case XLIB UndefResultErr       * CD1F6
          %* DUP %0= casedrop %0_2A2B4           * CD210
          % 1.438769E-2 SWAP %/ DUP %2 %< ITE    * CD229
          :: DUPDUP %* 2DUP DUP % -7.51563251563E-8 %* % 3.67430922986E-6 %+ * CD25C
            OVER %* % -1.98412698413E-4 %+ OVER %* % 1.66666666667E-2 %+ %* * CD2A9
            SWAP % -1.25E-1 %* %+ % 3.33333333333E-1 %+ 3UNROLL %* %* * CD2F6
            % 1.5398973382E-1 %* %1 SWAP %- ;    * CD343
          :: %0_2A2B4 SWAP %0_2A2B4 BEGIN %1+ DUP 3PICK %* DUP %3 %+ OVER %* * CD371
            %6 %+ OVER %* %6 %+ SWAP %CHS %EXP 3PICK DUP %* DUP %* %/ %* * CD3B7
            4PICK %+ 4ROLLOVER %<> WHILE         * CD407
            :: 3UNROLL ; REPEAT ROTROT2DROP % 1.5398973382E-1 %* ; * CD420
        ;                                        * CD458

* ROMPTR 0E7 00C
* refs (1): CCAAB
* %T -> %n: intrinsic carrier density of silicon at T kelvin. Undefined outside 0 < T < 1685, its melting point. The band gap comes from 1.17-4.73E-4*T^2/(T+636).
%SIDENS:
        :: DUP %0_2A2B4 %<= IT XLIB UndefResultErr * CD45D
          DUP % 1.685E3 %>= IT XLIB UndefResultErr * CD481
          % 4.73E-4 OVER DUP %* %* OVER % 6.36E2 %+ %/ % 1.17E0 %- %2 %/ * CD4B0
          % 8.617386E-5 %/ OVER %/ %EXP % 7.2756517951E15 %* SWAP % 1.5E0 %^ * CD521
          %* ;                                   * CD583

* ROMPTR 0E7 00D
* refs (1): CCAAB
* SIDENS: x -> n: for a temperature with units, gives the density in 1/cm^3.
SIDENS~1:
        ::                                       * CD58D
          UNIT %1 $ "K" umEND ; UMCONV CARCOMP XLIB %SIDENS * CD592
          UNIT %1 tok1 CHR_c tok_m umP %3 um^ um/ umEND ; SWAP Unbr>U ; * CD5C7

* ROMPTR 0E7 00E
* refs (1): CCAAB
* TDELTA: T1 T2 -> difference, with units. Both must be pure temperatures. The result has the unit of T1.
TDELTA~1:
        :: SWAP DUPROT U>NCQ 4ROLL U>NCQ ROT 6UNROLL ROT puretemp? NOTcase * CD60D
          XLIB InconsUnitsErr                    * CD644
          TempConv %%- %%>% Unbr>U ;             * CD64F

* ROMPTR 0E7 00F
* refs (1): CCAAB
* TINC: T dT -> sum, with units. Scales dT between the kelvin and Rankine sizes of degree as the two units need.
TINC~1:
        :: SWAP DUPROT U>NCQ 4ROLL U>NCQ ROT 6UNROLL ROT puretemp? NOTcase * CD668
          XLIB InconsUnitsErr                    * CD69F
          2DROP DUP cfC EQUAL SWAP %%1 EQUALOR ITE * CD6AA
          :: DUP cfC EQUAL SWAP %%1 EQUALOR ?SKIP * CD6D2
            :: cfF %%* ;                         * CD6FA
          ;                                      * CD70E
          :: DUP cfC EQUAL SWAP %%1 EQUALOR IT   * CD713
            :: cfF %%/ ;                         * CD73B
          ;                                      * CD74F
          %%+ %%>% Unbr>U ;                      * CD754

* ROMPTR 0E7 010
* refs (1): CCAAB
* Errors with Inconsistent Units.
InconsUnitsErr:
        :: # B02 ERROROUT ;                      * CD768  "Inconsistent Units"

* ROMPTR 0E7 011
* refs (1): CCAAB
* The two symbolic handlers that commands of one argument share, for the argument and for the empty case.
~UTVUNS1Arg:
        { XLIB ~SWAPcompSWAP XLIB ~DROPTRUE }    * CD781

* ROMPTR 0E7 012
* refs (1): CCAAB
~SWAPcompSWAP:
        :: SWAPcompSWAP ;                        * CD7A1

* ROMPTR 0E7 013
* refs (1): CCAAB
~DROPTRUE:
        :: DROPTRUE ;                            * CD7B0

* ROMPTR 0E7 014
* refs (1): CCAAB
* The messages of MINEHUNT, numbered E701 to E706.
MHMessages:
        CON(5)  DOARRY                           * CD7BF  array 6
        LENGTH                                   * CD7C4  length, to #CD864
        CON(5)  DOCSTR                           * CD7C9  element type
        CON(5)  1                                * CD7CE  dimensions
        CON(5)  6                                * CD7D3
        $BODY   "NEAR "                          * CD7D8  1
        $BODY   " MINE  "                        * CD7E7  2
        $BODY   " MINES  "                       * CD7FA  3
        $BODY   "  SCORE: "                      * CD80F  4
        $BODY   "YOU MADE IT!!"                  * CD826  5
        $BODY   "YOU BLEW UP!!"                  * CD845  6
        ENDLENGTH                                * CD864

* ROMPTR 0E7 015
* refs (1): CCAAB
* ZFACTOR, number and symbolic argument: builds the symbolic function call. The groups below do the same, three to a command: number and symbolic, symbolic and number, symbolic and symbolic.
ZFACTOR~2:
        :: nscknum2 XLIB SymFcnNS XLIB ZFACTOR ; * CD864

* ROMPTR 0E7 016
* refs (1): CCAAB
ZFACTOR~3:
        :: sncknum2 XLIB SymFcnSN XLIB ZFACTOR ; * CD889

* ROMPTR 0E7 017
* refs (1): CCAAB
ZFACTOR~4:
        :: sscknum2 XLIB SymFcnSS XLIB ZFACTOR ; * CD8AE

* ROMPTR 0E7 018
* refs (1): CCAAB
FANNING~1:
        :: nscknum2 XLIB SymFcnNS XLIB FANNING ; * CD8D3

* ROMPTR 0E7 019
* refs (1): CCAAB
FANNING~2:
        :: sncknum2 XLIB SymFcnSN XLIB FANNING ; * CD8F8

* ROMPTR 0E7 01A
* refs (1): CCAAB
FANNING~3:
        :: sscknum2 XLIB SymFcnSS XLIB FANNING ; * CD91D

* ROMPTR 0E7 01B
* refs (1): CCAAB
DARCY~3:
        :: nscknum2 XLIB SymFcnNS XLIB DARCY ;   * CD942

* ROMPTR 0E7 01C
* refs (1): CCAAB
DARCY~4:
        :: sncknum2 XLIB SymFcnSN XLIB DARCY ;   * CD967

* ROMPTR 0E7 01D
* refs (1): CCAAB
DARCY~5:
        :: sscknum2 XLIB SymFcnSS XLIB DARCY ;   * CD98C

* ROMPTR 0E7 01E
* refs (1): CCAAB
F0λ~2:
        :: nscknum2 XLIB SymFcnNS XLIB F0λ ;     * CD9B1

* ROMPTR 0E7 01F
* refs (1): CCAAB
F0λ~3:
        :: sncknum2 XLIB SymFcnSN XLIB F0λ ;     * CD9D6

* ROMPTR 0E7 020
* refs (1): CCAAB
F0λ~4:
        :: sscknum2 XLIB SymFcnSS XLIB F0λ ;     * CD9FB

* ROMPTR 0E7 021
* refs (1): CCAAB
TDELTA~2:
        :: nscknum2 XLIB SymFcnNS XLIB TDELTA ;  * CDA20

* ROMPTR 0E7 022
* refs (1): CCAAB
TDELTA~3:
        :: sncknum2 XLIB SymFcnSN XLIB TDELTA ;  * CDA45

* ROMPTR 0E7 023
* refs (1): CCAAB
TDELTA~4:
        :: sscknum2 XLIB SymFcnSS XLIB TDELTA ;  * CDA6A

* ROMPTR 0E7 024
* refs (1): CCAAB
TINC~2:
        :: nscknum2 XLIB SymFcnNS XLIB TINC ;    * CDA8F

* ROMPTR 0E7 025
* refs (1): CCAAB
TINC~3:
        :: sncknum2 XLIB SymFcnSN XLIB TINC ;    * CDAB4

* ROMPTR 0E7 026
* refs (1): CCAAB
TINC~4:
        :: sscknum2 XLIB SymFcnSS XLIB TINC ;    * CDAD9

* ROMPTR 0E7 027
* refs (1): CCAAB
SIDENS~2:
        :: cknumdsptch1 ROMPTR 0E7 028 XLIB SIDENS ; * CDAFE

* ROMPTR 0E7 029
* refs (2): CCAAB CCAAB
* Finishes a symbolic of a function of one argument: FCNAPPLY with the argument and the command in local 1.
SymFcn1:
        :: 1GETLAM symcomp BINT1 ' xFCNAPPLY 4ROLL #3+ ; * CDB23

* ROMPTR 0E7 02A
* refs (1): CCAAB
* The arguments of a two-argument function are a number and a symbolic: combines them and calls SymFcn2.
SymFcnNS:
        :: 3GETLAM BINT1 pshtop& XLIB SymFcn2 ;  * CDB50

* ROMPTR 0E7 02B
* refs (1): CCAAB
* The arguments are a symbolic and a number: combines them and calls SymFcn2.
SymFcnSN:
        :: 3GETLAM BINT1 top& XLIB SymFcn2 ;     * CDB74

* ROMPTR 0E7 02C
* refs (1): CCAAB
* Both arguments are symbolic: combines them and calls SymFcn2.
SymFcnSS:
        :: top& XLIB SymFcn2 ;                   * CDB98

* ROMPTR 0E7 02D
* refs (1): CCAAB
* Finishes a symbolic of a function of two arguments: FCNAPPLY with the arguments and the command in local 1.
SymFcn2:
        :: 1GETLAM symcomp BINT2 ' xFCNAPPLY 4ROLL #3+ ; * CDBB2

* ROMPTR 0E7 02E
* refs (1): CCAAB
* flag -> : stores to MF1, which ends the game's key loop.
MHQuit!:
        :: ' LAM 'MF1 STO ;                      * CDBDF

* ROMPTR 0E7 02F
* refs (1): CCAAB
* # -> : stores the column, MF2, from 1 to 16.
MHCol!:
        :: ' LAM 'MF2 STO ;                      * CDC02

* ROMPTR 0E7 030
* refs (1): CCAAB
* # -> : stores the row, MF3, from 1 to 8.
MHRow!:
        :: ' LAM 'MF3 STO ;                      * CDC25

* ROMPTR 0E7 031
* refs (1): CCAAB
* $ -> : stores the field, MF4: one character for each of the 128 cells. 0 is unvisited, 1 a mine, 2 visited, 3 the mine that blew up.
MHField!:
        :: ' LAM 'MF4 STO ;                      * CDC48

* ROMPTR 0E7 032
* refs (1): CCAAB
* # -> : stores the score, MF5: the number of cells visited.
MHScore!:
        :: ' LAM 'MF5 STO ;                      * CDC6B

* ROMPTR 0E7 033
* refs (1): CCAAB
* MINEHUNT: saves the display state, binds the game's locals, resumes a saved game from MHpar or starts a new one, then runs the key loop under an error trap.
MINEHUNT~1:
        :: UnLockAlpha RECLAIMDISP POLSaveUI ERRSET * CDC8E
          :: ClrDA1IsStat BINT0                  * CDCA7
            $ "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" * CDCB6
            TOTEMPOB ONEONE FALSE                * CDDC0
            {                                    * CDDCF

* ROMPTR 0E7 034
* refs (1): CCAAB
* -> #: the score, local MF5.
MHScore@:
              LAM 'MF5                           * CDDD4

* ROMPTR 0E7 035
* refs (1): CCAAB
* -> $: the field, local MF4.
MHField@:
              LAM 'MF4                           * CDDE3

* ROMPTR 0E7 036
* refs (1): CCAAB
* -> #: the row, local MF3.
MHRow@:
              LAM 'MF3                           * CDDF2

* ROMPTR 0E7 037
* refs (1): CCAAB
* -> #: the column, local MF2.
MHCol@:
              LAM 'MF2                           * CDE01

* ROMPTR 0E7 038
* refs (1): CCAAB
* -> flag: local MF1.
MHQuit@:
              LAM 'MF1 }                         * CDE10
            BIND XLIB MHResume ITE               * CDE24
            :: INCOMPDROP XLIB MHField! XLIB MHScore! XLIB MHRow! * CDE39
              XLIB MHCol! HARDBUFF ZEROZERO TURNMENUOFF GROB! ; * CDE64
            :: BINT0 BINT1                       * CDE88

* ROMPTR 0E7 039
* refs (1): CCAAB
* Left side of the screen for a new game.
MHFrameL:
              PCGROB  "images/CDE97-packed.png"  * CDE97  16 x 63, packed
              XLIB ~PCunpack XYGROBDISP # 78 BINT1 * CDF81

* ROMPTR 0E7 03A
* refs (1): CCAAB
* Right side of the screen for a new game.
MHFrameR:
              PCGROB  "images/CDFA0-packed.png"  * CDFA0  16 x 63, packed
              XLIB ~PCunpack XYGROBDISP TURNMENUOFF BINT10 ONE_DO BINT9 * CE093
* Draws the grid: nine horizontal and seventeen vertical lines, with the goal in the bottom right cell.
              INDEX@ BINT1 #- BINT7 #* BINT7 #+ # 78 OVER LINEON LOOP BINT18 * CE0B7
              ONE_DO INDEX@ #1- BINT7 #* BINT9 #+ BINT7 OVER BINT63 LINEON * CE0F8
              LOOP XLIB MHGoalGrob HARDBUFF BINT115 BINT57 GROB! CLKTICKS * CE12F
* Seeds the random numbers from the clock. The number of mines comes from Nmines, 20 by default, 40 at most.
              HXS># UNCOERCE DORANDOMIZE XLIB MHField@ ' ID Nmines SAFE@ ITE * CE158
              :: DUPTYPEREAL? ITE                * CE194
                :: %ABS COERCE DUP # 40 #> IT    * CE1A3
                  :: DROP # 40 ;                 * CE1CB
                ;                                * CE1E4
                :: DROP BINT20 ;                 * CE1E9
              ;                                  * CE1FD
              BINT20                             * CE202
* Places the mines on free cells at random, never in the first cell or the last.
              #1+_ONE_DO BEGIN %RAN % 1.24E2 %* COERCE #2+ 2DUP SUB$1# * CE207
              BINT48 #<> WHILE                   * CE244
              :: DROP ; REPEAT BINT49 XLIB $PUTBYTE! LOOP XLIB MHField! ' * CE253
              ID Nmines SAFE@ NOT ?SEMI          * CE28C
* A negative Nmines shows the mines.
              DUPTYPEREAL? ITE                   * CE2AE
              :: % 0E0 %< IT XLIB MHShowMines    * CE2B8
              ;                                  * CE2E7
              DROP                               * CE2EC
            ;                                    * CE2F1
            XLIB MHEnterCell ' XLIB MHNearMsg RESOROMP XLIB MHKeys TrueTrue * CE2F6
            FALSE ZEROFALSE ' LAM 'MF1 'ERRJMP POLSetUI POLKeyUI ABND ; * CE326
          ERRTRAP POLResUI&Err POLRestoreUI ;    * CE35D

* ROMPTR 0E7 03B
* refs (1): CCAAB
* Reached the goal: shows "YOU MADE IT!!", draws the winner in the last cell, shows the mines and ends the game.
MHWin:
        :: # E705 JstGetTHEMESG XLIB MHShowMsg BINT16 BINT8 XLIB MHCell>XY * CE371  "YOU MADE IT!!"
          XLIB MHWinGrob XYGROBDISP XLIB MHShowMines SetDAsTemp XLIB MHEnd ; * CE3A5

* ROMPTR 0E7 03C
* refs (1): CCAAB
* Stepped on a mine: shows "YOU BLEW UP!!", draws the blown-up man, shows the mines and ends the game.
MHLose:
        :: # E706 JstGetTHEMESG XLIB MHShowMsg XLIB MHCell>XY * CE3D5  "YOU BLEW UP!!"
          XLIB MHMineGrob XYGROBDISP XLIB MHShowMines SetDAsTemp XLIB MHEnd ; * CE3FF

* ROMPTR 0E7 03D
* refs (1): CCAAB
* Draws a mine in every cell that holds one.
MHShowMines:
        :: BINT9 ONE_DO BINT17 ONE_DO INDEX@ JINDEX@ 2DUP XLIB MHCell@ * CE42F
          BINT49 #=ITE                           * CE462
          :: HARDBUFF 3UNROLL XLIB MHManGrob 4UNROLL XLIB MHCell>XY GROB! ; * CE46C
          2DROP LOOP LOOP ;                      * CE4A0

* ROMPTR 0E7 03E
* refs (1): CCAAB
* Counts the mines around the current cell and shows "NEAR n MINE(S)" with the score.
MHNearMsg:
        :: XLIB MHCol@ XLIB MHRow@ BINT0 3UNROLL DUPDUP BINT8 #<> IT #1+ * CE4B4
          #1+ SWAPDUP #1<> IT #1-                * CE4F2
          ROTDUP DUP BINT16 #<> IT #1+           * CE50B
          #1+ SWAPDUP #1<> IT #1-                * CE529
          DO ROT 3PICK3PICK DO JINDEX@ INDEX@ XLIB MHCell@ BINT49 #= IT #1+ * CE542
          LOOP 3UNROLL LOOP 2DROP # E701 JstGetTHEMESG SWAP DUP #1= ITE * CE57F  "NEAR "
          # E702 # E703                          * CE5B6  " MINE  "  " MINES  "
          JstGetTHEMESG SWAP #>$ SWAP &$ &$ XLIB MHShowMsg ; * CE5CA

* ROMPTR 0E7 03F
* refs (1): CCAAB
* #col #row -> #x #y: pixel position of a cell in the display.
MHCell>XY:
        :: BINT1 #- BINT7 #* #8+ SWAPONE #- BINT7 #* #10+ SWAP ; * CE5F8

* ROMPTR 0E7 040
* refs (1): CCAAB
* Blanks the current cell, which takes the man off it.
MHClearMan:
        :: XLIB MHCol@ XLIB MHRow@ XLIB MHCell>XY BINT6 BINT6 MAKEGROB * CE639
          INVGROB XYGROBDISP ;                   * CE66E

* ROMPTR 0E7 041
* refs (1): CCAAB
* Handles arrival at the current cell: a mine ends the game, a new cell adds one to the score and is marked visited. Then draws the man, and at row 8, column 16 the game is won.
MHEnterCell:
        :: XLIB MHCol@ XLIB MHRow@ 2DUP XLIB MHCell@ DUP BINT49 #= casedrop * CE67D
          :: 2DUP BINT51 XLIB MHCell! XLIB MHLose ; * CE6BC
          BINT48 #= IT                           * CE6E6
          :: XLIB MHScore+1 2DUP BINT50 XLIB MHCell! ; * CE6F5
          2DUP HARDBUFF 3UNROLL XLIB MHManGrob TOTEMPOB INVGROB 4UNROLL * CE71F
          XLIB MHCell>XY GROB! BINT8 #= SWAP BINT16 #= ANDcase XLIB MHWin * CE748
        ;                                        * CE781

* ROMPTR 0E7 042
* refs (1): CCAAB
* Adds one to the score.
MHScore+1:
        :: XLIB MHScore@ #1+ XLIB MHScore! ;     * CE786

* ROMPTR 0E7 043
* refs (1): CCAAB
* $ -> : shows the text with "  SCORE: n" appended, centred on the top line.
MHShowMsg:
        :: # E704 JstGetTHEMESG XLIB MHScore@ #>$ &$ &$ $>grob DUPGROBDIM * CE7AB  "  SCORE: "
          SWAPDROP DUP # 6D #> IT                * CE7E3
          :: DROP ZEROZERO # 6D BINT6 SUBGROB # 6D ; * CE801
          # 6D SWAP#- #2/ BINT11 #+ BINT0 ROT BINT6 # 6D MAKEGROB HARDBUFF * CE833
          BINT11 BINT0 GROB! XYGROBDISP ;        * CE874

* ROMPTR 0E7 044
* refs (1): CCAAB
* #key #plane -> ... : key handler of the game. Unshifted, the arrows and the digits 8, 4, 2, 6, 7, 9, 1 and 3 move; STO saves the game; ON quits; the shift keys do nothing.
MHKeys:
        :: BINT1 #=casedrop                      * CE88D
          :: BINT11 ?CaseRomptr@ XLIB MHUp BINT32 ?CaseRomptr@ XLIB MHUp * CE89C
            BINT16 ?CaseRomptr@ XLIB MHLeft BINT36 ?CaseRomptr@ XLIB MHLeft * CE8CB
            BINT17 ?CaseRomptr@ XLIB MHDown BINT42 ?CaseRomptr@ XLIB MHDown * CE8F5
            BINT18 ?CaseRomptr@ XLIB MHRight BINT38 ?CaseRomptr@ * CE91F
            XLIB MHRight BINT31 ?CaseRomptr@ XLIB MHUpLeft BINT33 * CE93E
            ?CaseRomptr@ XLIB MHUpRight BINT41 ?CaseRomptr@ XLIB MHDownLeft * CE963
            BINT43 ?CaseRomptr@ XLIB MHDownRight BINT14 ?CaseRomptr@ * CE988
            XLIB MHSave BINT35 #=casedrpfls BINT40 * CE9A7
            #=casedrpfls BINT45                  * CE9C1
            ?CaseRomptr@ XLIB MHKeyON DROP 'DoBadKeyT ; * CE9CB
          BINT3 #=casedrop                       * CE9EA
          :: BINT45 #=casedrpfls DROP            * CE9F4
            'DoBadKeyT ;                         * CEA08
          2DROP 'DoBadKeyT ;                     * CEA12

* ROMPTR 0E7 045
* refs (1): CCAAB
* ON key: quits, leaving the display to be redrawn.
MHKeyON:
        :: TakeOver ClrDAsOK XLIB MHEnd ;        * CEA21

* ROMPTR 0E7 046
* refs (1): CCAAB
* Moves up a row, unless on the top row.
MHUp:
        :: TakeOver XLIB MHClearMan XLIB MHRow@ #1- DUP#0= ITE * CEA40
          :: DROP DoBadKey ; XLIB MHRow!         * CEA6F
          XLIB MHEnterCell ;                     * CEA8E

* ROMPTR 0E7 047
* refs (1): CCAAB
* Moves left a column, unless in the first.
MHLeft:
        :: TakeOver XLIB MHClearMan XLIB MHCol@ #1- DUP#0= ITE * CEA9E
          :: DROP DoBadKey ; XLIB MHCol!         * CEACD
          XLIB MHEnterCell ;                     * CEAEC

* ROMPTR 0E7 048
* refs (1): CCAAB
* Moves down a row, unless on the bottom row.
MHDown:
        :: TakeOver XLIB MHClearMan XLIB MHRow@ #1+DUP BINT9 #=ITE * CEAFC
          :: DROP DoBadKey ; XLIB MHRow! XLIB MHEnterCell ; * CEB2B

* ROMPTR 0E7 049
* refs (1): CCAAB
* Moves diagonally up and left, unless at an edge.
MHUpLeft:
        :: TakeOver XLIB MHCol@ DUP #1= casedrop DoBadKey * CEB5A
          XLIB MHRow@ DUP #1= case2drop DoBadKey * CEB83
          XLIB MHClearMan #1- XLIB MHRow! #1- XLIB MHCol! XLIB MHEnterCell ; * CEBA2

* ROMPTR 0E7 04A
* refs (1): CCAAB
* Moves diagonally up and right, unless at an edge.
MHUpRight:
        :: TakeOver XLIB MHCol@ DUP BINT16 #= casedrop DoBadKey * CEBDD
          XLIB MHRow@ DUP #1= case2drop DoBadKey * CEC0B
          XLIB MHClearMan #1- XLIB MHRow! #1+ XLIB MHCol! XLIB MHEnterCell ; * CEC2A

* ROMPTR 0E7 04B
* refs (1): CCAAB
* Moves diagonally down and left, unless at an edge.
MHDownLeft:
        :: TakeOver XLIB MHCol@ DUP #1= casedrop DoBadKey * CEC65
          XLIB MHRow@ DUP BINT8 #= case2drop DoBadKey * CEC8E
          XLIB MHClearMan #1+ XLIB MHRow! #1- XLIB MHCol! XLIB MHEnterCell ; * CECB2

* ROMPTR 0E7 04C
* refs (1): CCAAB
* Moves diagonally down and right, unless at an edge.
MHDownRight:
        :: TakeOver XLIB MHCol@ DUP BINT16 #= casedrop DoBadKey * CECED
          XLIB MHRow@ DUP BINT8 #= case2drop DoBadKey * CED1B
          XLIB MHClearMan #1+ XLIB MHRow! #1+ XLIB MHCol! XLIB MHEnterCell ; * CED3F

* ROMPTR 0E7 04D
* refs (1): CCAAB
* Moves right a column, unless in the last.
MHRight:
        :: TakeOver XLIB MHClearMan XLIB MHCol@ #1+ DUP BINT17 #=ITE * CED7A
          :: DROP DoBadKey ; XLIB MHCol! XLIB MHEnterCell ; * CEDAE

* ROMPTR 0E7 04E
* refs (1): CCAAB
* Ends the game: sets the flag that stops the key loop.
MHEnd:
        :: TakeOver TRUE XLIB MHQuit! ;          * CEDDD

* ROMPTR 0E7 04F
* refs (1): CCAAB
* #col #row -> #char: the field's character for a cell.
MHCell@:
        :: #1- BINT16 #* #+ XLIB MHField@ SWAP SUB$1# ; * CEDFC

* ROMPTR 0E7 050
* refs (1): CCAAB
* #col #row #char -> : changes a cell of the field and stores the field.
MHCell!:
        :: 3UNROLL #1- BINT16 #* #+ XLIB MHField@ SWAPROT XLIB $PUTBYTE! * CEE2F
          XLIB MHField! ;                        * CEE68

* ROMPTR 0E7 051
* refs (1): CCAAB
* $ #pos #char -> $: overwrites one character of the string in place.
$PUTBYTE!:
        CODE                                     * CEE78  72 nibbles
          GOSBVL  POP#                           * CEE82
          R0=A                                   * CEE89
          GOSBVL  POP#                           * CEE8C
          R1=A                                   * CEE93
          GOSBVL  SAVPTR                         * CEE96
          A=DAT1  A                              * CEE9D
          LC(5)   #00008                         * CEEA0
          A=A+C   A                              * CEEA7
          C=R1                                   * CEEA9
          A=A+C   A                              * CEEAC
          A=A+C   A                              * CEEAE
          D1=A                                   * CEEB0
          C=R0                                   * CEEB3
          DAT1=C  B                              * CEEB6
          GOSBVL  GETPTR                         * CEEB9
          A=DAT0  A                              * CEEC0
          D0=D0+  5                              * CEEC3
          PC=(A)                                 * CEEC6
        ENDCODE                                  * CEECA

* ROMPTR 0E7 052
* refs (1): CCAAB
* The 6 x 6 picture of the man, which also marks a visited cell.
MHManGrob:
        GROB    "images/CEECA-MHManGrob.png"     * CEECA  6 x 6

* ROMPTR 0E7 053
* refs (1): CCAAB
* The 6 x 6 picture of the goal.
MHGoalGrob:
        GROB    "images/CEEEA-MHGoalGrob.png"    * CEEEA  6 x 6

* ROMPTR 0E7 054
* refs (1): CCAAB
* The 6 x 6 picture of the blown-up man.
MHMineGrob:
        GROB    "images/CEF0A-MHMineGrob.png"    * CEF0A  6 x 6

* ROMPTR 0E7 055
* refs (1): CCAAB
* The 6 x 6 picture of the winner.
MHWinGrob:
        GROB    "images/CEF2A-MHWinGrob.png"     * CEF2A  6 x 6

* ROMPTR 0E7 056
* refs (1): CCAAB
* STO key: packs the display, position, score and field into a list tagged with #E7, disguises the list as an external object, stores it in MHpar and quits.
MHSave:
        :: HARDBUFF XLIB MHCol@ XLIB MHRow@ XLIB MHScore@ XLIB MHField@ * CEF4A
          BINT5 {}N # E7 SWAP TWO{}N DUP OSIZE   * CEF80
* Rewrites the list's prolog to DOEXT0 with the object's size as a length field, so that the saved game can't be edited.
          CODE                                   * CEFA8  71 nibbles
            GOSBVL  POP#                         * CEFB2
            R1=A.F  A                            * CEFB9
            GOSBVL  SAVPTR                       * CEFBF
            A=DAT1  A                            * CEFC6
            D1=A                                 * CEFC9
            LC(5)   DOEXT0                       * CEFCC
            DAT1=C  A                            * CEFD3
            D1=D1+  5                            * CEFD6
            C=R1.F  A                            * CEFD9
            C=C-CON A,5                          * CEFDF
            DAT1=C  A                            * CEFE5
            GOSBVL  GETPTR                       * CEFE8
            A=DAT0  A                            * CEFEF
            D0=D0+  5                            * CEFF2
            PC=(A)                               * CEFF5
          ENDCODE                                * CEFF9
          ' ID MHpar XEQSTOID XLIB MHEnd ClrDAsOK ; * CEFF9

* ROMPTR 0E7 057
* refs (1): CCAAB
* -> {saved} TRUE | FALSE: reads MHpar. If it holds a game saved by MHSave, turns it back into a list, purges MHpar and returns it.
MHResume:
        :: ' ID MHpar SAFE@ DUP casedrop         * CF029
          :: TOTEMPOB DUP XLIB ~UTTYPEEXT0? NOTcasedrop FALSE * CF053
* Checks the tag #E7 and turns the object back into a list.
            CODE                                 * CF077  64 nibbles
              C=DAT1  A                          * CF081
              CD1EX                              * CF084
              RSTK=C                             * CF087
              D1=D1+  10                         * CF089
              A=DAT1  A                          * CF08C
              LC(5)   #000E7                     * CF08F
              ?C#A    A                          * CF096
              GOYES   MHResume.L1                * CF099
              D1=D1-  10                         * CF09B
              LC(5)   DOLIST                     * CF09E
              DAT1=C  A                          * CF0A5
              D1=D1+  5                          * CF0A8
              LC(5)   DOBINT                     * CF0AB
              DAT1=C  A                          * CF0B2
MHResume.L1:
              C=RSTK                             * CF0B5
              D1=C                               * CF0B7
              GOVLNG  PushF/TLoop                * CF0BA
            ENDCODE                              * CF0C1
            NOTcasedrop FALSE                    * CF0C1
            INCOMPDROP SWAPDROP TRUE ' ID MHpar PURGE ; * CF0CB
        ;                                        * CF0FA

* ROMPTR 0E7 058
* refs (1): CCAAB
~UTTYPEEXT0?:
        CODE                                     * CF0FF  72 nibbles
          LC(5)   DOEXT0                         * CF109
          RSTK=C                                 * CF110
          C=DAT1  A                              * CF112
          CD1EX                                  * CF115
          A=DAT1  A                              * CF118
          D1=C                                   * CF11B
          C=RSTK                                 * CF11E
          ?C=A    A                              * CF120
          GOYES   ~UTTYPEEXT0?.L1                * CF123
          P=      0                              * CF125
          LC(5)   FALSE                          * CF127
          DAT1=C  A                              * CF12E
          A=DAT0  A                              * CF131
          D0=D0+  5                              * CF134
          PC=(A)                                 * CF137
~UTTYPEEXT0?.L1:
          P=      0                              * CF13B
          LC(5)   TRUE                           * CF13D
          DAT1=C  A                              * CF144
          A=DAT0  A                              * CF147
          D0=D0+  5                              * CF14A
          PC=(A)                                 * CF14D
        ENDCODE                                  * CF151

LIB0E7.hash:
        CON(5)  DOHSTR                           * CF151  hash table of library 0E7
        LENGTH                                   * CF156  length, to #CF1B5
        CON(5)  0                                * CF15B  names of length 1
        CON(5)  0                                * CF160  names of length 2
        CON(5)  0                                * CF165  names of length 3
        CON(5)  0                                * CF16A  names of length 4
        CON(5)  0                                * CF16F  names of length 5
        CON(5)  0                                * CF174  names of length 6
        CON(5)  0                                * CF179  names of length 7
        CON(5)  0                                * CF17E  names of length 8
        CON(5)  0                                * CF183  names of length 9
        CON(5)  0                                * CF188  names of length 10
        CON(5)  0                                * CF18D  names of length 11
        CON(5)  0                                * CF192  names of length 12
        CON(5)  0                                * CF197  names of length 13
        CON(5)  0                                * CF19C  names of length 14
        CON(5)  0                                * CF1A1  names of length 15
        CON(5)  0                                * CF1A6  names of length 16
        REL(5)  LIB0E7.hash.L1                   * CF1AB  end of the names
LIB0E7.hash.L1:
        CON(5)  0                                * CF1B0  command 000 has no name
        ENDLENGTH                                * CF1B5

LIB0E7.link:
        CON(5)  DOHSTR                           * CF1B5  link table of library 0E7
        LENGTH                                   * CF1BA  length, to #CF37C
        REL(5)  ZFACTOR~1                        * CF1BF  000 
        REL(5)  %ZFACTOR                         * CF1C4  001 
        REL(5)  UndefResultErr                   * CF1C9  002 
        REL(5)  FANNINGUnits                     * CF1CE  003 
        REL(5)  %FANNING                         * CF1D3  004 
        REL(5)  %LOGpos                          * CF1D8  005 
        REL(5)  BadTypeErr                       * CF1DD  006 
        REL(5)  BadValueErr                      * CF1E2  007 
        REL(5)  DARCY~1                          * CF1E7  008 
        REL(5)  DARCY~2                          * CF1EC  009 
        REL(5)  F0λ~1                            * CF1F1  00A 
        REL(5)  %F0λ                             * CF1F6  00B 
        REL(5)  %SIDENS                          * CF1FB  00C 
        REL(5)  SIDENS~1                         * CF200  00D 
        REL(5)  TDELTA~1                         * CF205  00E 
        REL(5)  TINC~1                           * CF20A  00F 
        REL(5)  InconsUnitsErr                   * CF20F  010 
        REL(5)  ~UTVUNS1Arg                      * CF214  011 ~UTVUNS1Arg
        REL(5)  ~SWAPcompSWAP                    * CF219  012 
        REL(5)  ~DROPTRUE                        * CF21E  013 
        REL(5)  MHMessages                       * CF223  014 
        REL(5)  ZFACTOR~2                        * CF228  015 
        REL(5)  ZFACTOR~3                        * CF22D  016 
        REL(5)  ZFACTOR~4                        * CF232  017 
        REL(5)  FANNING~1                        * CF237  018 
        REL(5)  FANNING~2                        * CF23C  019 
        REL(5)  FANNING~3                        * CF241  01A 
        REL(5)  DARCY~3                          * CF246  01B 
        REL(5)  DARCY~4                          * CF24B  01C 
        REL(5)  DARCY~5                          * CF250  01D 
        REL(5)  F0λ~2                            * CF255  01E 
        REL(5)  F0λ~3                            * CF25A  01F 
        REL(5)  F0λ~4                            * CF25F  020 
        REL(5)  TDELTA~2                         * CF264  021 
        REL(5)  TDELTA~3                         * CF269  022 
        REL(5)  TDELTA~4                         * CF26E  023 
        REL(5)  TINC~2                           * CF273  024 
        REL(5)  TINC~3                           * CF278  025 
        REL(5)  TINC~4                           * CF27D  026 
        REL(5)  SIDENS~2                         * CF282  027 
        REL(5)  SymFcn1                          * CF287  028 
        REL(5)  SymFcn1                          * CF28C  029 
        REL(5)  SymFcnNS                         * CF291  02A 
        REL(5)  SymFcnSN                         * CF296  02B 
        REL(5)  SymFcnSS                         * CF29B  02C 
        REL(5)  SymFcn2                          * CF2A0  02D 
        REL(5)  MHQuit!                          * CF2A5  02E 
        REL(5)  MHCol!                           * CF2AA  02F 
        REL(5)  MHRow!                           * CF2AF  030 
        REL(5)  MHField!                         * CF2B4  031 
        REL(5)  MHScore!                         * CF2B9  032 
        REL(5)  MINEHUNT~1                       * CF2BE  033 
        REL(5)  MHScore@                         * CF2C3  034 
        REL(5)  MHField@                         * CF2C8  035 
        REL(5)  MHRow@                           * CF2CD  036 
        REL(5)  MHCol@                           * CF2D2  037 
        REL(5)  MHQuit@                          * CF2D7  038 
        REL(5)  MHFrameL                         * CF2DC  039 
        REL(5)  MHFrameR                         * CF2E1  03A 
        REL(5)  MHWin                            * CF2E6  03B 
        REL(5)  MHLose                           * CF2EB  03C 
        REL(5)  MHShowMines                      * CF2F0  03D 
        REL(5)  MHNearMsg                        * CF2F5  03E 
        REL(5)  MHCell>XY                        * CF2FA  03F 
        REL(5)  MHClearMan                       * CF2FF  040 
        REL(5)  MHEnterCell                      * CF304  041 
        REL(5)  MHScore+1                        * CF309  042 
        REL(5)  MHShowMsg                        * CF30E  043 
        REL(5)  MHKeys                           * CF313  044 
        REL(5)  MHKeyON                          * CF318  045 
        REL(5)  MHUp                             * CF31D  046 
        REL(5)  MHLeft                           * CF322  047 
        REL(5)  MHDown                           * CF327  048 
        REL(5)  MHUpLeft                         * CF32C  049 
        REL(5)  MHUpRight                        * CF331  04A 
        REL(5)  MHDownLeft                       * CF336  04B 
        REL(5)  MHDownRight                      * CF33B  04C 
        REL(5)  MHRight                          * CF340  04D 
        REL(5)  MHEnd                            * CF345  04E 
        REL(5)  MHCell@                          * CF34A  04F 
        REL(5)  MHCell!                          * CF34F  050 
        REL(5)  $PUTBYTE!                        * CF354  051 
        REL(5)  MHManGrob                        * CF359  052 
        REL(5)  MHGoalGrob                       * CF35E  053 
        REL(5)  MHMineGrob                       * CF363  054 
        REL(5)  MHWinGrob                        * CF368  055 
        REL(5)  MHSave                           * CF36D  056 
        REL(5)  MHResume                         * CF372  057 
        REL(5)  ~UTTYPEEXT0?                     * CF377  058 ~UTTYPEEXT0?
        ENDLENGTH                                * CF37C
        BSS     4                                * CF37C  zeros
