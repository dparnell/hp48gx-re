* HP 48GX ROM revision R, #A8521-#AB533: Library 0B4: Plot options for 2D plots, Zoom Factors, plot type handling and reset, and the forms for 3D plots
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PlotZoomForm PlotVViewDisp PlotVLo$ PlotVHi$ PlotTypeSeek PlotTypeReset PlotTypeNext PlotTypeChoose PlotToSolveEq PlotToSolveDiff PlotSolveKey PlotResetMenu
* Follows on from the previous file (at #A8521 in the original ROM).
        RPL

* ROMPTR 0B4 0AB
* refs (1): A2437
* #msg -> ... flag: Hi field: as PlotOptLoMH
PlotOptHiMH:
        ::                                       * A8521
          { BINT41 XLIB PlotOptDfltHi BINT47 XLIB PlotOptHiChg } EQLookup * A8526
          case                                   * A8555
          :: EVAL TRUE ;                         * A855A
          XLIB PlotOptFieldMH ;                  * A856E

* ROMPTR 0B4 0AC
* refs (1): A2437
* -> ob TRUE: value to edit; the current upper range where the field shows Dflt
PlotOptDfltHi:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A857E
          DROP XLIB PltHView SWAPDROP TRUE ;     * A85A2

* ROMPTR 0B4 0AD
* refs (1): A2437
* -> : Hi changed: back to default takes Lo with it; a value when Lo is default fills Lo in from the range
PlotOptHiChg:
        :: 4GETLAM DUP XLIB ~gFldVal TYPEBINT? case * A85C1
          :: #1- BINT0 OVER XLIB ~sFldVal XLIB IFMarkPending ; * A85E5
          #1- DUP XLIB ~gFldVal TYPEBINT? NOTcaseDROP XLIB PltHView * A8614
          DROP OVER XLIB ~sFldVal XLIB IFMarkPending ; * A863E

* ROMPTR 0B4 0AE
* refs (1): A2437
* #msg -> ... flag: Step field: 41 gives the value to edit
PlotOptStepMH:
        :: BINT41 OVER #<>case XLIB PlotOptFieldMH * A8663
          DROP XLIB PlotOptDfltStep TRUE ;       * A8682

* ROMPTR 0B4 0AF
* refs (1): A2437
* -> ob TRUE: value to edit; the default step, from the range, where the field shows Dflt
PlotOptDfltStep:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A869C
          DROP XLIB PltHView 4GETLAM #1+ XLIB ~gFldVal XLIB PltPixelStep * A86C0
          TRUE ;                                 * A86F0

* ROMPTR 0B4 0B0
* refs (1): A2437
* #msg -> ... flag: default for options fields: 32 the RESET choices
PlotOptFieldMH:
        :: BINT32 #<>case FALSE                  * A86FA
          XLIB PlotOptResetMenu TRUE ;           * A870E

* ROMPTR 0B4 0B1
* refs (1): A2437
* -> form arguments: "Plot Options" for POLAR
PlotOptPolarForm:
        :: XLIB PlotOptLbls XLIB PlotOptFldIndep 'RROMPTR@ * A8723
          XLIB PlotOptFieldMH BINT55 BINT8 BINT31 BINT9 BINT1 * A8743
          { BINT0 } BINT4 # BE2C MINUSONE MINUSONE %0_2A2B4 MINUSONE * A8767  "Enter minimum indep var value"
          'RROMPTR@ XLIB PlotOptPolarHiMH BINT100 BINT8 BINT31 BINT9 BINT1 * A8799
          { BINT0 } BINT4 # BE2D MINUSONE MINUSONE %0_2A2B4 MINUSONE * A87C2  "Enter maximum indep var value"
          XLIB PlotOptFldAxes XLIB PlotOptFldConnect XLIB PlotOptFldSimult * A87F4
          'RROMPTR@ XLIB PlotOptPolarStepMH BINT25 BINT26 BINT25 BINT9 BINT1 * A8815
          { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE31 MINUSONE MINUSONE BINT0 * A883E  "Enter indep var increment"
          MINUSONE XLIB PlotOptFldStepPix XLIB PlotOptFldHTick * A8876
          XLIB PlotOptFldVTick XLIB PlotOptFldTickPix BINT11 DUP 'DROPFALSE * A8891
          # BE23                                 * A88B6  48675  "Plot Options"

* ROMPTR 0B4 0B2
* refs (1): A2437
* -> field values
PlotOptPolarVals:
          :: XLIB PltAxes? XLIB PltConnect? XLIB PltSimult? CHECKPVARS * A88C0
            INCOMPDROP 2DROP 5UNROLL ROTDROPROTDROP SWAPDUP 1get(li)? * A88EB
            7UNROLL XLIB PltIndepRngRev 7UNROLL 7UNROLL XLIB PltRes>Fld ROT * A8909
            XLIB PltTicks>Fld ;                  * A8933
          BINT11 XLIB IFSetHelps ;               * A8943

* ROMPTR 0B4 0B3
* refs (1): A2437
* field values -> : stores them
PlotOptPolarStore:
        :: XLIB PltPutTicks XLIB PltPutRes XLIB PltSimult! XLIB PltConnect! * A8958
          XLIB PltAxes! ROMPTR 0B5 034 XLIB PltPutIndep ; * A8989

* ROMPTR 0B4 0B4
* refs (1): A2437
* #msg -> ... flag: Hi field of POLAR: 33 (reset) sets it to one revolution in the current angle mode
PlotOptPolarHiMH:
        :: BINT33 OVER #<>case XLIB PlotOptFieldMH * A89AF
          DROP 1REV 4GETLAM DUPUNROT XLIB ~sFldVal * A89CE
          XLIB ~BINT47;IFECallFieldMH;DROP TRUE ; * A89ED

* ROMPTR 0B4 0B5
* refs (1): A2437
* #msg -> ... flag: Step field of POLAR: 41 gives the value to edit
PlotOptPolarStepMH:
        :: BINT41 OVER #<>case XLIB PlotOptFieldMH * A8A02
          DROP XLIB PlotOptPolarDfltStep TRUE ;  * A8A21

* ROMPTR 0B4 0B6
* refs (1): A2437
* -> ob TRUE: value to edit; the default angle step where the field shows Dflt
PlotOptPolarDfltStep:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A8A3B
          DROP BINT2 XLIB ~gFldVal BINT3 XLIB ~gFldVal 4GETLAM #1+ * A8A5F
          XLIB ~gFldVal XLIB PltDefStepPolar TRUE ; * A8A8E

* ROMPTR 0B4 0B7
* refs (1): A2437
* -> form arguments: "Plot Options" for PARAMETRIC
PlotOptParamForm:
        :: XLIB PlotOptLbls XLIB PlotOptFldIndep XLIB PlotOptFldLo * A8AAE
          XLIB PlotOptFldHi XLIB PlotOptFldAxes XLIB PlotOptFldConnect * A8AD4
          XLIB PlotOptFldSimult 'RROMPTR@ XLIB PlotOptParamStepMH BINT25 * A8AF5
          BINT26 BINT25 BINT9 BINT1              * A8B15
          { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE31 MINUSONE MINUSONE BINT0 * A8B29  "Enter indep var increment"
          MINUSONE XLIB PlotOptFldStepPix XLIB PlotOptFldHTick * A8B61
          XLIB PlotOptFldVTick XLIB PlotOptFldTickPix BINT11 DUP 'DROPFALSE * A8B7C
          # BE23 XLIB PlotOptFuncVals BINT11 XLIB IFSetHelps ; * A8BA1  "Plot Options"

* ROMPTR 0B4 0B8
* refs (1): A2437
* #msg -> ... flag: Step field of PARAMETRIC and CONIC: 41 gives the value to edit
PlotOptParamStepMH:
        :: BINT41 OVER #<>case XLIB PlotOptFieldMH * A8BCB
          DROP XLIB PlotOptParamDfltStep TRUE ;  * A8BEA

* ROMPTR 0B4 0B9
* refs (1): A2437
* -> ob TRUE: value to edit; the default step where the field shows Dflt
PlotOptParamDfltStep:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A8C04
          DROP BINT2 XLIB ~gFldVal BINT3 XLIB ~gFldVal 4GETLAM #1+ * A8C28
          XLIB ~gFldVal XLIB PltDefStep TRUE ;   * A8C57

* ROMPTR 0B4 0BA
* refs (1): A2437
* -> form arguments: "Plot Options" for CONIC, adding the dependent variable
PlotOptConicForm:
        :: XLIB PlotOptLblIndep XLIB PlotOptLblLo XLIB PlotOptLblHi * A8C77
          XLIB PlotOptLblAxes XLIB PlotOptLblConnect # BE36 BINT91 BINT19 * A8C9D  "Depnd:"
          XLIB PlotOptLblStep XLIB PlotOptLblPixels XLIB PlotOptLblHTick * A8CC7
          XLIB PlotOptLblVTick XLIB PlotOptLblPixels2 XLIB PlotOptFldIndep * A8CE8
          XLIB PlotOptFldLo XLIB PlotOptFldHi XLIB PlotOptFldAxes * A8D09
          XLIB PlotOptFldConnect 'RROMPTR@ XLIB PlotOptFieldMH BINT115 * A8D2A
          BINT17 BINT13 BINT9 BINT1              * A8D4A
          { BINT6 } BINT4 # BE37 MINUSONE MINUSONE ' ID Y MINUSONE 'RROMPTR@ * A8D5E  "Enter dependent var name"
          XLIB PlotOptParamStepMH BINT25 BINT26 BINT25 BINT9 BINT1 * A8D9E
          { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE31 MINUSONE MINUSONE BINT0 * A8DC2  "Enter indep var increment"
          MINUSONE XLIB PlotOptFldStepPix XLIB PlotOptFldHTick * A8DFA
          XLIB PlotOptFldVTick XLIB PlotOptFldTickPix BINT11 DUP 'DROPFALSE * A8E15
          # BE23                                 * A8E3A  48675  "Plot Options"

* ROMPTR 0B4 0BB
* refs (1): A2437
* -> field values
PlotOptConicVals:
          :: CHECKPVARS INCOMPDROP 1get(li)? SWAPDROP 5ROLLDROP 5ROLLDROP * A8E44
            4ROLL DUP 1get(li)? 5UNROLL XLIB PltIndepRng 5UNROLL 5UNROLL * A8E67
            XLIB PltAxes? 4UNROLL XLIB PltConnect? 4UNROLL SWAPROT * A8E90
            XLIB PltRes>Fld ROT XLIB PltTicks>Fld ; * A8EB5
          BINT11 XLIB IFSetHelps ;               * A8ED5

* ROMPTR 0B4 0BC
* refs (1): A2437
* field values -> : stores them
PlotOptConicStore:
        :: XLIB PltPutTicks XLIB PltPutRes XLIB PltPutDepend * A8EEA
          XLIB PltConnect! XLIB PltAxes! ROMPTR 0B5 033 XLIB PltPutIndep ; * A8F10

* ROMPTR 0B4 0BD
* refs (1): A2437
* -> form arguments: "Plot Options" for TRUTH, with ranges for both variables
PlotOptTruthForm:
        :: XLIB PlotOptLblIndep XLIB PlotOptLblLo XLIB PlotOptLblHi # BE36 * A8F41  "Depnd:"
          BINT1 BINT19 # BE24 BINT43 BINT19 # BE25 BINT91 BINT19 * A8F71  "Lo:"  "Hi:"
          XLIB PlotOptLblStep XLIB PlotOptLblPixels # BE26 BINT98 BINT28 * A8FA3  "Axes"
          XLIB PlotOptLblHTick XLIB PlotOptLblVTick XLIB PlotOptLblPixels2 * A8FCD
          XLIB PlotOptFldIndep XLIB PlotOptFldLo XLIB PlotOptFldHi 'RROMPTR@ * A8FEE
          XLIB PlotOptFieldMH BINT25 BINT17 BINT13 BINT9 BINT1 * A9014
          { BINT6 } BINT4 # BE37 MINUSONE MINUSONE ' ID Y MINUSONE 'RROMPTR@ * A9038  "Enter dependent var name"
          XLIB PlotOptDepLoMH BINT55 BINT17 BINT31 BINT9 BINT1 * A9078
          { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE38 MINUSONE MINUSONE BINT0 * A909C  "Enter minimum dep var value"
          MINUSONE 'RROMPTR@ XLIB PlotOptDepHiMH BINT100 BINT17 BINT31 BINT9 * A90D4
          BINT1                                  * A90FD
          { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE39 MINUSONE MINUSONE BINT0 * A9102  "Enter maximum dep var value"
          MINUSONE XLIB PlotOptFldStep XLIB PlotOptFldStepPix 'RROMPTR@ * A913A
          XLIB PlotOptFieldMH BINT91 BINT26 BINT6 BINT9 BINT32 MINUSONE * A915A
          MINUSONE # BE2E MINUSONE MINUSONE TRUE MINUSONE * A9183  "Draw axes before plotting?"
          XLIB PlotOptFldHTick XLIB PlotOptFldVTick XLIB PlotOptFldTickPix * A91A6
          BINT12 DUP 'DROPFALSE # BE23           * A91C7  "Plot Options"

* ROMPTR 0B4 0BE
* refs (1): A2437
* -> field values
PlotOptTruthVals:
          :: CHECKPVARS INCOMPDROP SWAPDROP 5ROLLDROP 5ROLLDROP 4ROLL DUP * A91E0
            1get(li)? 4UNROLL XLIB PltIndepRng 2SWAP DUP 1get(li)? 3UNROLL * A9208
            XLIB PltDepRng 8ROLL XLIB PltRes>Fld 5ROLL XLIB PltTicks>Fld * A9231
            XLIB PltAxes? 4UNROLL ;              * A925C
          BINT12 XLIB IFSetHelps ;               * A9271

* ROMPTR 0B4 0BF
* refs (1): A2437
* field values -> : stores them
PlotOptTruthStore:
        :: XLIB PltPutTicks XLIB PltAxes! XLIB PltPutRes XLIB PltPutDepRng * A9286
          XLIB PltPutDepend ROMPTR 0B5 033 XLIB PltPutIndep ; * A92B7

* ROMPTR 0B4 0C0
* refs (1): A2437
* #msg -> ... flag: dependent Lo field: as PlotOptLoMH
PlotOptDepLoMH:
        ::                                       * A92DD
          { BINT41 XLIB PlotOptDfltDepLo BINT47 XLIB PlotOptDepLoChg } * A92E2
          EQLookup case                          * A930C
          :: EVAL TRUE ;                         * A9316
          XLIB PlotOptFieldMH ;                  * A932A

* ROMPTR 0B4 0C1
* refs (1): A2437
* -> ob TRUE: value to edit; the lower range where the field shows Dflt
PlotOptDfltDepLo:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A933A
          DROP XLIB PltVView DROP TRUE ;         * A935E

* ROMPTR 0B4 0C2
* refs (1): A2437
* -> : keeps dependent Lo and Hi both set or both default
PlotOptDepLoChg:
        :: 4GETLAM DUP XLIB ~gFldVal TYPEBINT? case * A937D
          :: #1+ BINT0 OVER XLIB ~sFldVal XLIB IFMarkPending ; * A93A1
          #1+ DUP XLIB ~gFldVal TYPEBINT? NOTcaseDROP XLIB PltVView * A93D0
          SWAPDROP OVER XLIB ~sFldVal XLIB IFMarkPending ; * A93FA

* ROMPTR 0B4 0C3
* refs (1): A2437
* #msg -> ... flag: dependent Hi field: as PlotOptHiMH
PlotOptDepHiMH:
        ::                                       * A941F
          { BINT41 XLIB PlotOptDfltDepHi BINT47 XLIB PlotOptDepHiChg } * A9424
          EQLookup case                          * A944E
          :: EVAL TRUE ;                         * A9458
          XLIB PlotOptFieldMH ;                  * A946C

* ROMPTR 0B4 0C4
* refs (1): A2437
* -> ob TRUE: value to edit; the upper range where the field shows Dflt
PlotOptDfltDepHi:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A947C
          DROP XLIB PltVView SWAPDROP TRUE ;     * A94A0

* ROMPTR 0B4 0C5
* refs (1): A2437
* -> : keeps dependent Lo and Hi both set or both default
PlotOptDepHiChg:
        :: 4GETLAM DUP XLIB ~gFldVal TYPEBINT? case * A94BF
          :: #1- BINT0 OVER XLIB ~sFldVal XLIB IFMarkPending ; * A94E3
          #1- DUP XLIB ~gFldVal TYPEBINT? NOTcaseDROP XLIB PltVView * A9512
          DROP OVER XLIB ~sFldVal XLIB IFMarkPending ; * A953C

* ROMPTR 0B4 0C6
* refs (1): A2437
* -> form arguments: "Plot Options" for DIFFEQ: tolerance, step, axes, and what the H and V axes show
PlotOptDiffForm:
        :: # BF16 BINT1 BINT10 # BF17 BINT49 BINT10 # BE26 BINT113 BINT10 * A9561  "Tol:"  "Step:"  "Axes"
          # BE3A BINT1 BINT19 # BE04 BINT49 BINT19 # BE3B BINT1 BINT28 * A95A2  "H-Var:"  "H-View:"  "V-Var:"
          # BE06 BINT49 BINT28 XLIB PlotOptLblHTick XLIB PlotOptLblVTick * A95DE  "V-View:"
          XLIB PlotOptLblPixels2 'RROMPTR@ XLIB PlotOptFieldMH BINT16 BINT8 * A9608
          BINT31 BINT9 BINT1                     * A962D
          { BINT0 } BINT4 # BF22 MINUSONE MINUSONE % 1E-4 MINUSONE 'RROMPTR@ * A963C  "Enter absolute error tolerance"
          XLIB PlotOptDiffStepMH BINT70 BINT8 BINT25 BINT9 BINT1 * A9683
          { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE3C MINUSONE MINUSONE BINT0 * A96A7  "Enter max indep var increment"
          MINUSONE 'RROMPTR@ XLIB PlotOptFieldMH # 6A BINT8 BINT6 BINT9 * A96DF
          BINT32 MINUSONE MINUSONE # BE2E MINUSONE MINUSONE TRUE MINUSONE * A970D  "Draw axes before plotting?"
          'RROMPTR@ XLIB PlotOptDiffVarMH BINT28 BINT17 BINT13 BINT9 BINT12 * A973A
          MINUSONE BINT4 # BE3D MINUSONE 'RROMPTR@ XLIB PlotOptDiffVar$ * A9763  "Choose horizontal variable"
          %0_2A2B4 MINUSONE 'RROMPTR@ XLIB PlotOptFieldMH # 4C BINT17 BINT25 * A978C
          BINT9 BINT1                            * A97BA
          { BINT0 } BINT4 # BE0A MINUSONE MINUSONE % -6.5E0 MINUSONE * A97C4  "Enter minimum horizontal value"
          'RROMPTR@ XLIB PlotOptFieldMH # 6A BINT17 BINT25 BINT9 BINT1 * A9806
          { BINT0 } BINT4 # BE0B MINUSONE MINUSONE % 6.5E0 MINUSONE * A9834  "Enter maximum horizontal value"
          'RROMPTR@ XLIB PlotOptDiffVarMH BINT28 BINT26 BINT13 BINT9 BINT12 * A9876
          MINUSONE BINT4 # BE3E MINUSONE 'RROMPTR@ XLIB PlotOptDiffVar$ %1 * A989F  "Choose vertical variable"
          MINUSONE 'RROMPTR@ XLIB PlotOptFieldMH # 4C BINT26 BINT25 BINT9 * A98CD
          BINT1                                  * A98FB
          { BINT0 } BINT4 # BE0D MINUSONE MINUSONE % -3.1E0 MINUSONE * A9900  "Enter minimum vertical value"
          'RROMPTR@ XLIB PlotOptFieldMH # 6A BINT26 BINT25 BINT9 BINT1 * A9942
          { BINT0 } BINT4 # BE0E MINUSONE MINUSONE % 3.2E0 MINUSONE * A9970  "Enter maximum vertical value"
          XLIB PlotOptFldHTick XLIB PlotOptFldVTick XLIB PlotOptFldTickPix * A99B2
          BINT10 BINT12 'DROPFALSE # BE23        * A99D3  "Plot Options"

* ROMPTR 0B4 0C7
* refs (1): A2437
* -> field values
PlotOptDiffVals:
          :: XLIB DeqGetPlotVars CHECKPVARS INCOMPDROP XLIB DeqTol 9rolld * A99EC
            DROPSWAP ROTDROP XLIB PltRes>Fld DROP 6UNROLL XLIB PltAxes? * A9A16
            6UNROLL ROT C%>% 4ROLL C%>% ROTSWAP 6ROLL 3UNROLL 6ROLL * A9A40
            XLIB PltTicks>Fld ;                  * A9A6D
          BINT12 XLIB IFSetHelps ;               * A9A7D

* ROMPTR 0B4 0C8
* refs (1): A2437
* field values -> : stores them
PlotOptDiffStore:
        :: XLIB PltPutTicks yrng(2r) 4ROLL SWAP XLIB DeqPutPlotVars xrng(2r) * A9A92
          XLIB PltAxes! XLIB PltPutResNum XLIB DeqPutTol ; * A9AC1

* ROMPTR 0B4 0C9
* refs (1): A2437
* #msg -> ... flag: Step field of DIFFEQ: 41 gives the value to edit
PlotOptDiffStepMH:
        :: BINT41 OVER #<>case XLIB PlotOptFieldMH * A9AE7
          DROP XLIB PlotOptDfltDiffStep TRUE ;   * A9B06

* ROMPTR 0B4 0CA
* refs (1): A2437
* -> ob TRUE: value to edit; 0 where the field shows Dflt
PlotOptDfltDiffStep:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A9B20
          DROP%0b TRUE ;                         * A9B44

* ROMPTR 0B4 0CB
* refs (1): A2437
* #msg -> ... flag: H-Var and V-Var fields: 40 gives their choose list
PlotOptDiffVarMH:
        :: BINT40 OVER #<>case XLIB PlotOptFieldMH * A9B53
          DROP XLIB PlotOptDiffVarList TRUE ;    * A9B72

* ROMPTR 0B4 0CC
* refs (1): A2437
* -> {%} # : the choices 0, 1, ... n, one per solution element, and the current position
PlotOptDiffVarList:
        :: RclDepnd XLIB DeqInitVal DUPTYPEREAL? ITE * A9B8C
          :: DROP                                * A9BAB
            { %0_2A2B4 %1 } ;                    * A9BB5
          :: MDIMS IT DROP                       * A9BCE
            DUP 1LAMBIND #1+ ZERO_DO INDEX@ UNCOERCE LOOP 1GETABND #1+ {}N ; * A9BE2
          4GETLAM XLIB ~gFldVal COERCE #1+ ;     * A9C19

* ROMPTR 0B4 0CD
* refs (1): A2437
* % -> $: shows a choice: "0 INDEP", "1 SOLN", or "n SOLN(n)" when the solution is a vector
PlotOptDiffVar$:
        :: DUP%0= casedrop                       * A9C38
          :: # BE3F JstGetTHEMESG ;              * A9C47  "0 INDEP"
          RclDepnd XLIB DeqInitVal TYPEREAL? casedrop * A9C60
          :: # BE40 JstGetTHEMESG ;              * A9C7A  "1 SOLN"
          BINT4 XLIB IFDecomp DUP # BE41 JstGetTHEMESG &$ SWAP&$ * A9C93  " SOLN("
          CHR_RightPar >T$ ;                     * A9CC1

* ROMPTR 0B4 0CE
* refs (1): A2437
* -> form arguments: "Plot Options" for HISTOGRAM, BAR and SCATTER: axes and ticks
PlotOptStatForm:
        :: XLIB PlotOptLblAxes # BE2A BINT1 BINT28 # BE2B BINT49 BINT28 * A9CD0  "H-Tick:"  "V-Tick:"
          # BE29 # 6B BINT28 XLIB PlotOptFldAxes 'RROMPTR@ * A9D08  "Pixels"
          XLIB PlotOptFieldMH BINT28 BINT26 BINT13 BINT9 BINT1 * A9D31
          { BINT0 } BINT4 # BE33 MINUSONE MINUSONE %10 MINUSONE 'RROMPTR@ * A9D55  "Enter horizontal tick spacing"
          XLIB PlotOptFieldMH # 4C BINT26 BINT13 BINT9 BINT1 * A9D8C
          { BINT0 } BINT4 # BE34 MINUSONE MINUSONE %10 MINUSONE 'RROMPTR@ * A9DB5  "Enter vertical tick spacing"
          XLIB PlotOptFieldMH BINT100 BINT26 BINT6 BINT9 BINT32 MINUSONE * A9DEC
          MINUSONE # BE35 MINUSONE MINUSONE TRUE MINUSONE BINT4 DUP * A9E15  "Tick spacing units are pixels?"
          'DROPFALSE # BE23                      * A9E42  "Plot Options"

* ROMPTR 0B4 0CF
* refs (1): A2437
* -> field values
PlotOptStatVals:
          :: XLIB PltAxes? RclAx*s XLIB PltTicks>Fld ; BINT4 XLIB IFSetHelps ; * A9E51

* ROMPTR 0B4 0D0
* refs (1): A2437
* field values -> : stores them
PlotOptStatStore:
        :: XLIB PltPutTicks XLIB PltAxes! ;      * A9E8B

* ROMPTR 0B4 0D1
* refs (1): A2437
* -> : "Zoom Factors", from PICTURE's ZOOM menu
PlotZoomForm:
        :: # BE60 BINT1 BINT10 # BE61 BINT1 BINT19 # BE62 BINT8 BINT28 * A9EAB  "H-Factor:"  "V-Factor:"  "Recenter at Crosshairs"
          'DROPFALSE BINT37 BINT8 BINT25 BINT9 BINT1 * A9EEC
          { BINT0 } BINT4 # BE63 MINUSONE MINUSONE %4 MINUSONE 'DROPFALSE * A9F0A  "Enter horizontal zoom factor"
          BINT37 BINT17 BINT25 BINT9 BINT1       * A9F41
          { BINT0 } BINT4 # BE64 MINUSONE MINUSONE %4 MINUSONE 'DROPFALSE * A9F5A  "Enter vertical zoom factor"
          BINT1 BINT26 BINT6 BINT9 BINT32 MINUSONE MINUSONE # BE65 MINUSONE * A9F91  "Recenter plot at crosshairs?"
          MINUSONE TRUE MINUSONE BINT3 DUP 'DROPFALSE # BE5F XLIB PltGetZoom * A9FC3  "Zoom Factors"
          BINT3 XLIB IFSetHelps DoInputForm NOT?SEMI * A9FF6
          XLIB PltPutZoom ;                      * AA010

* ROMPTR 0B4 0D2
* refs (1): A2437
* -> : Type field CHOOS: if the type changes, stores the fields under the old type and rebuilds the form for the new one
PlotTypeChoose:
        :: 4GETLAM XLIB IFChoose NOT?SEMI        * AA020
          ?ROMPTR@ DUP 4GETLAM XLIB ~gFldVal ?ROMPTR@ EQUAL caseDROP * AA03A
          XLIB GetFieldVals                      * AA063
          14GETLAM XLIB PlotFormStore 2DROP DUP XLIB NTHEval2 BINT1 * AA06E
          XLIB ~sFldVal BINT1 XLIB IFEDispField BINT0 ' LAM 'PX STOLAM TRUE * AA098
          11PUTLAM ;                             * AA0D4

* ROMPTR 0B4 0D3
* refs (1): A2437
* -> : Type field +/-: the next type, with the same rebuild
PlotTypeNext:
        :: 4GETLAM XLIB IFChoices OVER NULL{} EQUAL case2DROP #1+ * AA0DE
          2DUP SWAP LENCOMP #> IT DROPONE        * AA10C
          NTHCOMPDROP XLIB GetFieldVals 14GETLAM XLIB PlotFormStore 2DROP * AA12A
          DUP XLIB NTHEval2 BINT1 XLIB ~sFldVal BINT1 XLIB IFEDispField * AA14F
          BINT0 ' LAM 'PX STOLAM TRUE 11PUTLAM ; * AA17F

* ROMPTR 0B4 0D4
* refs (1): A2437
* -> : Type field letter key: the next type starting with that letter, with the same rebuild
PlotTypeSeek:
        :: 4GETLAM XLIB IFChoices OVER LENCOMP ' * AA1AA
          :: SWAP NTHCOMPROM@ ; 4ROLL >HCOMP DUP 4UNROLL SWAP ROT #1+ * AA1CE
          4GETLAM XLIB IFFldDec@ SWAP 6ROLL XLIB IFFindNext NOTcasedrop * AA205
          DoBadKey                               * AA22F
          SWAP EVAL XLIB GetFieldVals 14GETLAM XLIB PlotFormStore 2DROP DUP * AA234
          XLIB NTHEval2 BINT1 XLIB ~sFldVal BINT1 XLIB IFEDispField BINT0 ' * AA263
          LAM 'PX STOLAM TRUE 11PUTLAM ;         * AA298

* ROMPTR 0B4 0D5
* refs (1): A2437
* -> : Type field reset: back to the first type, with the same rebuild
PlotTypeReset:
        :: XLIB GetFieldVals 14GETLAM XLIB PlotFormStore 2DROP BINT1 * AA2B9
          XLIB IFFldReset@ DUP XLIB NTHEval2 BINT1 XLIB ~sFldVal BINT1 * AA2E3
          XLIB IFEDispField BINT0 ' LAM 'PX STOLAM TRUE 11PUTLAM ; * AA313

* ROMPTR 0B4 0D6
* refs (1): A2437
* -> : redraws the two fields after the current one
PlotVViewDisp:
        :: 4GETLAM #1+ DUP XLIB IFMarkPending #1+ XLIB IFMarkPending ; * AA349

* ROMPTR 0B4 0D7
* refs (1): A2437
* #key #plane -> ...: keys in the form: RAD changes the angle, PICTURE shows PICT, SOLVE goes over to the solver
PlotKey:
        :: EditExstCase FALSE 2DUP Key>U/SKeyOb  * AA37D
          { KeyLS_MTH XLIB PlotKeyAngle XLIB xGRAPH XLIB PlotPictKey * AA396  PICTURE
            XLIB SolveApp XLIB PlotSolveKey }    * AA3C1
          ' EQUAL SWAP Lookup NOTcase DROPFALSE  * AA3DC
          ROTROT2DROP TrueTrue ;                 * AA3FA

* ROMPTR 0B4 0D8
* refs (1): A2437
* -> : PICTURE key: stores the fields, shows PICT, and returns to the form
PlotPictKey:
        :: TakeOver XLIB GetFieldVals 14GETLAM XLIB PlotFormStore 2DROP * AA409
          GETPTYPE 1LAMBIND GraphEnter 1GETABND PUTPTYPE MINUSONE ' LAM 'PX * AA433
          STOLAM XLIB IFFirstField# XLIB IFSetField XLIB PlotFormVals * AA463
          XLIB SetFieldVals ;                    * AA489

* ROMPTR 0B4 0D9
* refs (1): A2437
* -> : SOLVE key inside PLOT: choose box of the two solvers that share the plot's EQ
PlotSolveKey:
        :: TakeOver                              * AA499
          {                                      * AA4A3
            { # BF01 XLIB PlotToSolveEq }        * AA4A8  "Solve equation "
            { # BF02 XLIB PlotToSolveDiff } }    * AA4C7  "Solve diff eq "
          XLIB IFTypeChoose ;                    * AA4EB

* ROMPTR 0B4 0DA
* refs (1): A2437
* -> flag: leaves PLOT with SolveEqApp to run next
PlotToSolveEq:
        :: ' XLIB SolveEqApp ' LAM 'PE2 STOLAM XLIB GetFieldVals 14GETLAM * AA4FB
          XLIB PlotFormStore 2DROP TRUE 11PUTLAM FALSE ; * AA539

* ROMPTR 0B4 0DB
* refs (1): A2437
* -> flag: leaves PLOT with SolveDiffForm to run next
PlotToSolveDiff:
        :: ' XLIB SolveDiffForm ' LAM 'PE2 STOLAM XLIB GetFieldVals 14GETLAM * AA55D
          XLIB PlotFormStore 2DROP TRUE 11PUTLAM FALSE ; * AA59B

* ROMPTR 0B4 0DC
* refs (1): A2437
* ob -> {choices}: message 32: Reset or Delete value, and Reset plot
PlotResetMenu:
        :: 4GETLAM XLIB IFReset@ ITE             * AA5BF
          :: DROP                                * AA5D9
            { # B903 XLIB IFResetCur } ;         * AA5E3  "Reset value"
          { # B904 XLIB IFResetCur }             * AA607  "Delete value"
          { # BE66 XLIB PlotResetAll } BINT2 {}N ; * AA626  "Reset plot"

* ROMPTR 0B4 0DD
* refs (1): A2437
* -> : "Reset plot": stores the fields, resets the plot settings and reads the fields again
PlotResetAll:
        :: XLIB GetFieldVals 14GETLAM XLIB PlotFormStore 2DROP XLIB PltReset * AA654
          XLIB PlotFormVals XLIB SetFieldVals SetDA123NoCh XLIB IFAllPending ; * AA684

* ROMPTR 0B4 0DE
* refs (1): A2437
* ob -> {choices}: message 32 of the options forms
PlotOptResetMenu:
        :: 4GETLAM XLIB IFReset@ ITE             * AA6AF
          :: DROP                                * AA6C9
            { # B903 XLIB IFResetCur } ;         * AA6D3  "Reset value"
          { # B904 XLIB IFResetCur }             * AA6F7  "Delete value"
          { # BE66 XLIB PlotOptResetAll } BINT2 {}N ; * AA716  "Reset plot"

* ROMPTR 0B4 0DF
* refs (1): A2437
* -> : "Reset plot" in the options forms
PlotOptResetAll:
        :: XLIB GetFieldVals XLIB PlotOptsStore XLIB PltReset * AA744
          XLIB PlotOptsVals XLIB SetFieldVals SetDA123NoCh XLIB IFAllPending ; * AA76A

* ROMPTR 0B4 0E0
* refs (1): A2437
* ob -> $: field decompile: "Dflt" for a value that is a bint, otherwise the value
IFDflt$:
        :: DUPTYPEBINT? casedrop                 * AA795
          :: # BE67 JstGetTHEMESG ;              * AA7A4  "Dflt"
          BINT4 XLIB IFDecomp ;                  * AA7BD

* ROMPTR 0B4 0E1
* refs (1): A2437
* ob -> $: V-View low: "Auto" with the Autoscale field before it on
PlotVLo$:
        :: 4GETLAM #1- XLIB ~gFldVal casedrop    * AA7D2
          :: # BE68 JstGetTHEMESG ;              * AA7F1  "Auto"
          BINT4 XLIB IFDecomp ;                  * AA80A

* ROMPTR 0B4 0E2
* refs (1): A2437
* ob -> $: V-View high: blank with the Autoscale field two before it on
PlotVHi$:
        :: 4GETLAM #2- XLIB ~gFldVal casedrop NULL$ * AA81F
          BINT4 XLIB IFDecomp ;                  * AA843

* ROMPTR 0B4 0E3
* refs (1): A2437
* #field -> {keys}: editor menu with the variable in #field as a key
PlotEditKeys:
        ::                                       * AA858
          { NullMenuKey NullMenuKey NullMenuKey } SWAP XLIB ~gFldVal >HCOMP ; * AA85D

* ROMPTR 0B4 0E4
* refs (1): A2437
* #field -> {keys}: editor menu with the variable in LAM PE1 and the one in #field
PlotConicEditKeys:
        ::                                       * AA890
          { NullMenuKey NullMenuKey } LAM 'PE1 >HCOMP SWAP XLIB ~gFldVal * AA895
          >HCOMP ;                               * AA8CD

* ROMPTR 0B4 0E5
* refs (1): A2437
* #dflt -> #field: the first field: LAM PX, or #dflt if it is -1
PlotFirstField:
        :: LAM 'PX DUP MINUSONE #= ITE DROP SWAPDROP * AA8D7
        ;                                        * AA907

* ROMPTR 0B4 0E6
* refs (1): A2437
* -> form arguments: the form for SLOPEFIELD and the 3D types
Plot3DForm:
        :: XLIB PlotLblType XLIB PlotLblAngle XLIB PlotLblEq * AA90C
          XLIB PlotLblIndep # BE20 BINT67 BINT28 # BE36 BINT1 BINT37 # BE20 * AA932  "Steps:"  "Depnd:"  "Steps:"
          BINT67 BINT37 XLIB PlotFldType XLIB PlotFldAngle 'RROMPTR@ * AA96F
          XLIB Plot3DEqMH BINT25 BINT17 # 67 BINT9 BINT23 * AA994
          { BINT9 BINT8 BINT6 BINT0 BINT5 } BINT4 # BE09 * AA9BD  "Enter function(s) to plot"
          { # BF0A TRUE } MINUSONE MINUSONE MINUSONE 'RROMPTR@ * AA9EF  "Funcs in"
          XLIB PlotFieldMH BINT25 BINT26 BINT37 BINT9 BINT1 * AAA1C
          { BINT6 } BINT4 # BF1C MINUSONE MINUSONE ' ID X MINUSONE 'RROMPTR@ * AAA40  "Enter independent var name"
          XLIB PlotFieldMH BINT91 BINT26 BINT37 BINT9 BINT1 * AAA80
          { BINT0 } BINT4 # BE21 MINUSONE MINUSONE %10 MINUSONE 'RROMPTR@ * AAAA4  "Enter indep var sample count"
          XLIB PlotFieldMH BINT25 BINT35 BINT37 BINT9 BINT1 * AAADB
          { BINT6 } BINT4 # BE37 MINUSONE MINUSONE ' ID Y MINUSONE 'RROMPTR@ * AAAFF  "Enter dependent var name"
          XLIB PlotFieldMH BINT91 BINT35 BINT37 BINT9 BINT1 * AAB3F
          { BINT0 } BINT4 # BE22 MINUSONE MINUSONE %8 MINUSONE BINT7 DUP * AAB63  "Enter dep var sample count"
          'RROMPTR@ XLIB Plot3DMH # BE01         * AAB9F  "Plot"

* ROMPTR 0B4 0E7
* refs (1): A2437
* -> field values
Plot3DVals:
          :: XLIB ModeAngle XLIB GetEQ CHECKPVARS INCOMPDROP ROTDROPROTDROP * AABB9
            1get(li)? 5UNROLL XLIB PltPtypeItem 7UNROLL 1get(li)? 4UNROLL * AABE3
            2DROP XLIB VparNumX@ SWAP XLIB VparNumY@ ; * AAC07
          BINT7 XLIB IFSetHelps ;                * AAC2C

* ROMPTR 0B4 0E8
* refs (1): A2437
* field values -> : stores them
Plot3DStore:
        :: XLIB VparNumY! XLIB PltPutDepend XLIB VparNumX! XLIB PltPutIndep * AAC41
          XLIB PutEQ XLIB NTHEval3 XLIB NTHEval2 LAM 'PE3 FALSE ; * AAC72

* ROMPTR 0B4 0E9
* refs (1): A2437
* #msg -> ... flag: form message handler of the 3D plots
Plot3DMH:
        ::                                       * AACAC
          { BINT16                               * AACB1
            :: XLIB PlotMenu TRUE ; BINT14       * AACBB
            :: BINT3 XLIB PlotFirstField ; BINT56 * AACDA
            :: 14GETLAM SWAP ; }                 * AACF9
          EQLookup case                          * AAD12
          :: EVAL TRUE ;                         * AAD1C
          DROPFALSE ;                            * AAD30

* ROMPTR 0B4 0EA
* refs (1): A2437
* #msg -> ... flag: Eq field: 43 gives editor keys with both variables
Plot3DEqMH:
        :: DUP BINT43 #<>case XLIB PlotFieldMH   * AAD3A
          DROP BINT4 BINT6 XLIB PlotEditKeys2 TrueTrue ; * AAD59

* ROMPTR 0B4 0EB
* refs (1): A2437
* #field #field -> {keys}: editor menu with the variables of the two fields
PlotEditKeys2:
        ::                                       * AAD7D
          { NullMenuKey NullMenuKey } SWAP XLIB ~gFldVal >HCOMP SWAP * AAD82
          XLIB ~gFldVal >HCOMP ;                 * AADB0

* ROMPTR 0B4 0EC
* refs (1): A2437
* -> form arguments: "Plot Options" for SLOPEFIELD and PCONTOUR: X and Y ranges
PlotOptViewForm:
        ::                                       * AADC5

* ROMPTR 0B4 0ED
* refs (1): A2437
* Label "X-Left:"
PlotOptLblXLeft:
          :: # BE42 BINT1 BINT10 ;               * AADCA  "X-Left:"

* ROMPTR 0B4 0EE
* refs (1): A2437
* Label "X-Right:"
PlotOptLblXRight:
          :: # BE43 BINT67 BINT10 ;              * AADE8  "X-Right:"

* ROMPTR 0B4 0EF
* refs (1): A2437
* Label "Y-Near:"
PlotOptLblYNear:
          :: # BE44 BINT1 BINT19 ;               * AAE06  "Y-Near:"

* ROMPTR 0B4 0F0
* refs (1): A2437
* Label "Y-Far:"
PlotOptLblYFar:
          :: # BE45 BINT67 BINT19 ;              * AAE24  "Y-Far:"

* ROMPTR 0B4 0F1
* refs (1): A2437
* Field: minimum X of the view volume
PlotOptFldXLeft:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT31 BINT8 BINT31 BINT9 BINT1 * AAE42
            { BINT0 } BINT4 # BE48 MINUSONE MINUSONE %-1 MINUSONE ; * AAE70  "Enter minimum X view-volume val"

* ROMPTR 0B4 0F2
* refs (1): A2437
* Field: maximum X of the view volume
PlotOptFldXRight:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT97 BINT8 BINT31 BINT9 BINT1 * AAEA7
            { BINT0 } BINT4 # BE49 MINUSONE MINUSONE %1 MINUSONE ; * AAED5  "Enter maximum X view-volume val"

* ROMPTR 0B4 0F3
* refs (1): A2437
* Field: minimum Y of the view volume
PlotOptFldYNear:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT31 BINT17 BINT31 BINT9 BINT1 * AAF0C
            { BINT0 } BINT4 # BE4A MINUSONE MINUSONE %-1 MINUSONE ; * AAF3A  "Enter minimum Y view-volume val"

* ROMPTR 0B4 0F4
* refs (1): A2437
* Field: maximum Y of the view volume
PlotOptFldYFar:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT97 BINT17 BINT31 BINT9 BINT1 * AAF71
            { BINT0 } BINT4 # BE4B MINUSONE MINUSONE %1 MINUSONE ; * AAF9F  "Enter maximum Y view-volume val"
          BINT4 DUP 'DROPFALSE # BE23            * AAFD6  "Plot Options"

* ROMPTR 0B4 0F5
* refs (1): A2437
* -> field values
PlotOptViewVals:
          :: XLIB VparXvol@ XLIB VparYvol@ ; BINT4 XLIB IFSetHelps ; * AAFEF

* ROMPTR 0B4 0F6
* refs (1): A2437
* field values -> : stores them
PlotOptViewStore:
        :: XLIB VparYvol! XLIB VparXvol! ;       * AB024

* ROMPTR 0B4 0F7
* refs (1): A2437
* -> form arguments: "Plot Options" for WIREFRAME: view volume and eyepoint
PlotOptWireForm:
        ::                                       * AB044

* ROMPTR 0B4 0F8
* refs (1): A2437
* Labels of the view volume and eyepoint forms
PlotOptLblsWire:
          :: XLIB PlotOptLblXLeft XLIB PlotOptLblXRight XLIB PlotOptLblYNear * AB049
            XLIB PlotOptLblYFar                  * AB06F

* ROMPTR 0B4 0F9
* refs (1): A2437
* Label "Z-Low:"
PlotOptLblZLow:
            :: # BE46 BINT1 BINT28 ;             * AB07A  "Z-Low:"

* ROMPTR 0B4 0FA
* refs (1): A2437
* Label "Z-High:"
PlotOptLblZHigh:
            :: # BE47 BINT67 BINT28 ;            * AB098  "Z-High:"

* ROMPTR 0B4 0FB
* refs (1): A2437
* Label "XE:"
PlotOptLblXE:
            :: # BE4E BINT1 BINT37 ;             * AB0B6  "XE:"

* ROMPTR 0B4 0FC
* refs (1): A2437
* Label "YE:"
PlotOptLblYE:
            :: # BE4F BINT43 BINT37 ;            * AB0D4  "YE:"

* ROMPTR 0B4 0FD
* refs (1): A2437
* Label "ZE:"
PlotOptLblZE:
            :: # BE50 BINT85 BINT37 ; ;          * AB0F2  "ZE:"

* ROMPTR 0B4 0FE
* refs (1): A2437
* Fields of the view volume and eyepoint forms
PlotOptFldsWire:
          :: XLIB PlotOptFldXLeft XLIB PlotOptFldXRight XLIB PlotOptFldYNear * AB115
            XLIB PlotOptFldYFar                  * AB13B

* ROMPTR 0B4 0FF
* refs (1): A2437
* Field: minimum Z of the view volume
PlotOptFldZLow:
            :: 'RROMPTR@ XLIB PlotOptFieldMH BINT31 BINT26 BINT31 BINT9 * AB146
              BINT1                              * AB16F
              { BINT0 } BINT4 # BE4C MINUSONE MINUSONE %-1 MINUSONE ; * AB174  "Enter minimum Z view-volume val"

* ROMPTR 0B4 100
* refs (1): A2437
* Field: maximum Z of the view volume
PlotOptFldZHigh:
            :: 'RROMPTR@ XLIB PlotOptFieldMH BINT97 BINT26 BINT31 BINT9 * AB1AB
              BINT1                              * AB1D4
              { BINT0 } BINT4 # BE4D MINUSONE MINUSONE %1 MINUSONE ; * AB1D9  "Enter maximum Z view-volume val"

* ROMPTR 0B4 101
* refs (1): A2437
* Field: X eyepoint coordinate
PlotOptFldXE:
            :: 'RROMPTR@ XLIB PlotOptFieldMH BINT13 BINT35 BINT25 BINT9 * AB210
              BINT1                              * AB239
              { BINT0 } BINT4 # BE51 MINUSONE MINUSONE %0_2A2B4 MINUSONE ; * AB23E  "Enter X eyepoint coordinate"

* ROMPTR 0B4 102
* refs (1): A2437
* Field: Y eyepoint coordinate
PlotOptFldYE:
            :: 'RROMPTR@ XLIB PlotOptFieldMH BINT55 BINT35 BINT25 BINT9 * AB275
              BINT1                              * AB29E
              { BINT0 } BINT4 # BE52 MINUSONE MINUSONE %-3 MINUSONE ; * AB2A3  "Enter Y eyepoint coordinate"

* ROMPTR 0B4 103
* refs (1): A2437
* Field: Z eyepoint coordinate
PlotOptFldZE:
            :: 'RROMPTR@ XLIB PlotOptFieldMH BINT97 BINT35 BINT25 BINT9 * AB2DA
              BINT1                              * AB303
              { BINT0 } BINT4 # BE53 MINUSONE MINUSONE %0_2A2B4 MINUSONE ; * AB308  "Enter Z eyepoint coordinate"
          ;                                      * AB33F
          BINT9 DUP 'DROPFALSE # BE23            * AB344  "Plot Options"

* ROMPTR 0B4 104
* refs (1): A2437
* -> field values
PlotOptWireVals:
          :: XLIB VparXvol@ XLIB VparYvol@ XLIB VparZvol@ XLIB VparEye@ ; * AB35D
          BINT9 XLIB IFSetHelps ;                * AB393

* ROMPTR 0B4 105
* refs (1): A2437
* field values -> : stores them
PlotOptWireStore:
        :: XLIB VparEye! XLIB VparZvol! XLIB VparYvol! XLIB VparXvol! ; * AB3A8

* ROMPTR 0B4 106
* refs (1): A2437
* -> form arguments: "Plot Options" for YSLICE, with Save Animation
PlotOptSliceForm:
        :: XLIB PlotOptLblXLeft XLIB PlotOptLblXRight XLIB PlotOptLblYNear * AB3DE
          XLIB PlotOptLblYFar XLIB PlotOptLblZLow XLIB PlotOptLblZHigh * AB404
          # BE54 BINT8 BINT37 XLIB PlotOptFldXLeft XLIB PlotOptFldXRight * AB425  "Save Animation"
          XLIB PlotOptFldYNear XLIB PlotOptFldYFar XLIB PlotOptFldZLow * AB44F
          XLIB PlotOptFldZHigh 'RROMPTR@ XLIB PlotOptFieldMH BINT1 BINT35 * AB470
          BINT6 BINT9 BINT32 MINUSONE MINUSONE # BE55 MINUSONE MINUSONE * AB495  "Save animation data after plot?"
          FALSE MINUSONE BINT7 DUP 'DROPFALSE # BE23 * AB4C2  "Plot Options"

* ROMPTR 0B4 107
* refs (1): A2437
* -> field values
PlotOptSliceVals:
          :: XLIB VparXvol@ XLIB VparYvol@ XLIB VparZvol@ LAM 'PE3 ; BINT7 * AB4E5
          XLIB IFSetHelps ;                      * AB524
