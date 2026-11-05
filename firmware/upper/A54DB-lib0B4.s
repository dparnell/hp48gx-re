* HP 48GX ROM revision R, #A54DB-#A8520: Library 0B4: the Plot form for each plot type, its keys and fields, and the options forms for 2D plots
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PlotTruthStore PlotTypeMH PlotTruthForm PlotStatVals PlotStatStore PlotStatMH PlotScatVals PlotScatStore PlotScatForm PlotParamForm PlotOptsVals PlotOptsStore
* Follows on from the previous file (at #A54DB in the original ROM).
        RPL

* ROMPTR 0B4 046
* refs (1): A2437
* -> form arguments: runs the builder of the plot form for the current PTYPE
PlotFormFor:
        :: GETPTYPE                              * A54DB
          { xFUNCTION XLIB PlotFuncForm POLAR XLIB PlotFuncForm xCONIC * A54E5
            XLIB PlotConicForm xTRUTH XLIB PlotTruthForm xPARAMETRIC * A550F
            XLIB PlotParamForm XLIB DIFFEQ XLIB PlotDiffForm xHISTOGRAM * A552F
            XLIB PlotHistoForm xBAR XLIB PlotBarForm xSCATTER * A5555
            XLIB PlotScatForm XLIB SLOPEFIELD XLIB Plot3DForm XLIB WIREFRAME * A5575
            XLIB Plot3DForm XLIB PCONTOUR XLIB Plot3DForm XLIB YSLICE * A55A1
            XLIB Plot3DForm XLIB GRIDMAP XLIB Plot3DForm XLIB PARSURFACE * A55CD
            XLIB Plot3DForm }                    * A55F9
          XLIB RompLookup NcaseSIZEERR EVAL      * A5609
        ;                                        * A561E

* ROMPTR 0B4 047
* refs (1): A2437
* -> field values: reads the form's values, by PTYPE
PlotFormVals:
        :: GETPTYPE                              * A5623
          { xFUNCTION XLIB PlotFuncVals POLAR XLIB PlotFuncVals xCONIC * A562D
            XLIB PlotConicVals xTRUTH XLIB PlotConicVals xPARAMETRIC * A5657
            XLIB PlotFuncVals XLIB DIFFEQ XLIB PlotDiffVals xHISTOGRAM * A5677
            XLIB PlotStatVals xBAR XLIB PlotStatVals xSCATTER * A569D
            XLIB PlotScatVals XLIB SLOPEFIELD XLIB Plot3DVals XLIB WIREFRAME * A56BD
            XLIB Plot3DVals XLIB PCONTOUR XLIB Plot3DVals XLIB YSLICE * A56E9
            XLIB Plot3DVals XLIB GRIDMAP XLIB Plot3DVals XLIB PARSURFACE * A5715
            XLIB Plot3DVals }                    * A5741
          XLIB RompLookup NcaseSIZEERR EVAL      * A5751
        ;                                        * A5766

* ROMPTR 0B4 048
* refs (1): A2437
* field values #fields -> ob ob: stores the form's values by the plot type in field 1, found #fields down the stack. The caller drops the two objects left
PlotFormStore:
        :: PICK                                  * A576B
          { XLIB PltItemFUNCTION XLIB PlotFuncStore XLIB PltItemPOLAR * A5775
            XLIB PlotFuncStore XLIB PltItemCONIC XLIB PlotConicStore * A579B
            XLIB PltItemTRUTH XLIB PlotTruthStore XLIB PltItemPARAMETRIC * A57BC
            XLIB PlotFuncStore XLIB PltItemDIFFEQ XLIB PlotDiffStore * A57DD
            XLIB PltItemHISTOGRAM XLIB PlotStatStore XLIB PltItemBAR * A57FE
            XLIB PlotStatStore XLIB PltItemSCATTER XLIB PlotScatStore * A581F
            XLIB PltItemSLOPEFIELD XLIB Plot3DStore XLIB PltItemWIREFRAME * A5840
            XLIB Plot3DStore XLIB PltItemPCONTOUR XLIB Plot3DStore * A5861
            XLIB PltItemYSLICE XLIB Plot3DStore XLIB PltItemGRIDMAP * A5882
            XLIB Plot3DStore XLIB PltItemPARSURFACE XLIB Plot3DStore } * A58A3
          XLIB RompLookup NcaseSIZEERR EVAL      * A58C9
        ;                                        * A58DE

* ROMPTR 0B4 049
* refs (1): A2437
* -> form arguments: the form for FUNCTION and POLAR
PlotFuncForm:
        ::                                       * A58E3

* ROMPTR 0B4 04A
* refs (1): A2437
* Label "Type:"
PlotLblType:
          :: # BE02 BINT1 BINT10 ;               * A58E8  "Type:"

* ROMPTR 0B4 04B
* refs (1): A2437
* Label "∡:"
PlotLblAngle:
          :: # BE03 BINT91 BINT10 ;              * A5906  "∡:"

* ROMPTR 0B4 04C
* refs (1): A2437
* Label "Eq:"
PlotLblEq:
          :: # BF08 BINT1 BINT19 ;               * A5924  "Eq:"

* ROMPTR 0B4 04D
* refs (1): A2437
* Label "Indep:"
PlotLblIndep:
          :: # BF12 BINT1 BINT28 ;               * A5942  "Indep:"

* ROMPTR 0B4 04E
* refs (1): A2437
* Label "H-View:"
PlotLblHView:
          :: # BE04 BINT49 BINT28 ;              * A5960  "H-View:"

* ROMPTR 0B4 04F
* refs (1): A2437
* Label "Autoscale"
PlotLblAuto:
          :: # BE05 BINT8 BINT37 ;               * A597E  "Autoscale"

* ROMPTR 0B4 050
* refs (1): A2437
* Label "V-View:"
PlotLblVView:
          :: # BE06 BINT49 BINT37 ;              * A599C  "V-View:"

* ROMPTR 0B4 051
* refs (1): A2437
* Field: plot type, a choose list
PlotFldType:
          :: 'RROMPTR@ XLIB PlotTypeMH BINT25 BINT8 BINT61 BINT9 BINT12 * A59BA
            MINUSONE BINT17 # BE07 XLIB PltPtypeItems BINT17 * A59E8  "Choose type of plot"
            XLIB PltItemFUNCTION MINUSONE ;      * A5A0C

* ROMPTR 0B4 052
* refs (1): A2437
* Field: angle measure
PlotFldAngle:
          :: 'RROMPTR@ XLIB PlotFieldMH BINT100 BINT8 BINT25 BINT9 BINT12 * A5A21
            MINUSONE BINT33 # BE08 XLIB ModeAngleItems BINT17 * A5A4F  "Choose angle measure"
            XLIB ModeItemDeg MINUSONE ;          * A5A73

* ROMPTR 0B4 053
* refs (1): A2437
* Field: the function(s) to plot
PlotFldEq:
          :: 'RROMPTR@ XLIB PlotEqMH BINT25 BINT17 # 67 BINT9 BINT23 * A5A88
            { BINT9 BINT8 BINT6 BINT0 BINT5 } BINT4 # BE09 * A5ABB  "Enter function(s) to plot"
            { # BF0A TRUE } MINUSONE MINUSONE MINUSONE ; * A5AED  "Funcs in"

* ROMPTR 0B4 054
* refs (1): A2437
* Field: independent variable
PlotFldIndep:
          :: 'RROMPTR@ XLIB PlotFieldMH BINT25 BINT26 BINT13 BINT9 BINT1 * A5B1A
            { BINT6 } BINT4 # BF1C MINUSONE MINUSONE 'IDX MINUSONE ; * A5B48  "Enter independent var name"

* ROMPTR 0B4 055
* refs (1): A2437
* Field: minimum horizontal value
PlotFldHLo:
          :: 'RROMPTR@ XLIB PlotFieldMH # 4C BINT26 BINT25 BINT9 BINT1 * A5B7F
            { BINT0 } BINT4 # BE0A MINUSONE MINUSONE % -6.5E0 MINUSONE ; * A5BB2  "Enter minimum horizontal value"

* ROMPTR 0B4 056
* refs (1): A2437
* Field: maximum horizontal value
PlotFldHHi:
          :: 'RROMPTR@ XLIB PlotFieldMH # 6A BINT26 BINT25 BINT9 BINT1 * A5BF9
            { BINT0 } BINT4 # BE0B MINUSONE MINUSONE % 6.5E0 MINUSONE ; * A5C2C  "Enter maximum horizontal value"

* ROMPTR 0B4 057
* refs (1): A2437
* Field: autoscale check
PlotFldAuto:
          :: 'RROMPTR@ XLIB PlotAutoMH BINT1 BINT35 BINT6 BINT9 BINT32 * A5C73
            MINUSONE MINUSONE # BE0C MINUSONE MINUSONE FALSE MINUSONE ; * A5CA1  "Autoscale vertical plot range?"

* ROMPTR 0B4 058
* refs (1): A2437
* Field: minimum vertical value; shows Auto with autoscale on
PlotFldVLo:
          :: 'RROMPTR@ XLIB PlotFieldMH # 4C BINT35 BINT25 BINT9 BINT1 * A5CCE
            { BINT0 } 'RROMPTR@ XLIB PlotVLo$ # BE0D MINUSONE MINUSONE * A5D01  "Enter minimum vertical value"
            % -3.1E0 MINUSONE ;                  * A5D34

* ROMPTR 0B4 059
* refs (1): A2437
* Field: maximum vertical value; blank with autoscale on
PlotFldVHi:
          :: 'RROMPTR@ XLIB PlotFieldMH # 6A BINT35 BINT25 BINT9 BINT1 * A5D53
            { BINT0 } 'RROMPTR@ XLIB PlotVHi$ # BE0E MINUSONE MINUSONE * A5D86  "Enter maximum vertical value"
            % 3.2E0 MINUSONE ;                   * A5DB9
          BINT7 BINT9 'RROMPTR@ XLIB PlotFormMH # BE01 * A5DD8  "Plot"

* ROMPTR 0B4 05A
* refs (1): A2437
* -> field values: from EQ, the angle mode and PPAR
PlotFuncVals:
          :: XLIB ModeAngle XLIB GetEQ CHECKPVARS INCOMPDROP DROP * A5DFC
            XLIB PltPtypeItem 8UNROLL 2DROP 1get(li)? SWAPROT C%>% ROT C%>% * A5E26
            ROTSWAP FALSE 3UNROLL ;              * A5E54
          BINT9 XLIB IFSetHelps ;                * A5E68

* ROMPTR 0B4 05B
* refs (1): A2437
* field values -> : stores the ranges, angle mode and EQ
PlotFuncStore:
        :: yrng(2r) 7UNROLL xrng(2r) XLIB PltPutIndep XLIB PutEQ * A5E7D
          XLIB NTHEval3 XLIB NTHEval2 FALSE SWAP ; * A5EA7

* ROMPTR 0B4 05C
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu, 14 the first field, 56 (form accepted) pushes the number of fields for PlotFormStore
PlotFormMH:
        ::                                       * A5ECC
          { BINT16                               * A5ED1
            :: XLIB PlotMenu TRUE ; BINT14       * A5EDB
            :: BINT3 XLIB PlotFirstField ; BINT56 * A5EFA
            :: 14GETLAM SWAP ; }                 * A5F19
          EQLookup case                          * A5F32
          :: EVAL TRUE ;                         * A5F3C
          DROPFALSE ;                            * A5F50

* ROMPTR 0B4 05D
* refs (1): A2437
* Menu keys: OPTS, ERASE and DRAW
PlotMenu:
        {                                        * A5F5A
          {                                      * A5F5F
            :: PTR DirLabel: $ "OPTS" ; XLIB PlotOptsKey } * A5F64
          { $ "ERASE" XLIB PlotEraseKey }        * A5F95
          { $ "DRAW" XLIB PlotDrawKey } }        * A5FBE

* ROMPTR 0B4 05E
* refs (1): A2437
* #msg -> ... flag: Autoscale check: 47 redraws the V-View fields, which change with it
PlotAutoMH:
        :: BINT47 OVER #<>case XLIB PlotFieldMH  * A5FEA
          DROP XLIB PlotVViewDisp TRUE ;         * A6009

* ROMPTR 0B4 05F
* refs (1): A2437
* -> : OPTS key: stores the fields, runs the options form for the plot type, then shows the fields again
PlotOptsKey:
        :: TakeOver XLIB GetFieldVals 14GETLAM XLIB PlotFormStore 2DROP * A6023
          XLIB PlotOptsFor GETPTYPE 1LAMBIND DoInputForm 1GETABND PUTPTYPE * A604D
          MINUSONE ' LAM 'PX STOLAM XLIB IFFirstField# XLIB IFSetField * A6071
          NOT?SEMI                               * A60A3
          XLIB PlotOptsStore XLIB PlotFormVals XLIB SetFieldVals ; * A60A8

* ROMPTR 0B4 060
* refs (1): A2437
* -> form arguments: the options form for the current PTYPE
PlotOptsFor:
        :: GETPTYPE                              * A60CE
          { xFUNCTION XLIB PlotOptFuncForm POLAR XLIB PlotOptPolarForm * A60D8
            xPARAMETRIC XLIB PlotOptParamForm xCONIC XLIB PlotOptConicForm * A60FD
            xTRUTH XLIB PlotOptTruthForm XLIB DIFFEQ XLIB PlotOptDiffForm * A611D
            xHISTOGRAM XLIB PlotOptStatForm xBAR XLIB PlotOptStatForm * A6143
            xSCATTER XLIB PlotOptStatForm XLIB SLOPEFIELD * A6163
            XLIB PlotOptViewForm XLIB WIREFRAME XLIB PlotOptWireForm * A617E
            XLIB PCONTOUR XLIB PlotOptViewForm XLIB YSLICE * A619F
            XLIB PlotOptSliceForm XLIB GRIDMAP XLIB PlotOptGridForm * A61C0
            XLIB PARSURFACE XLIB PlotOptPSurfForm } * A61E1
          XLIB RompLookup NcaseSIZEERR EVAL      * A61FC
        ;                                        * A6211

* ROMPTR 0B4 061
* refs (1): A2437
* -> field values: reads the options, by PTYPE
PlotOptsVals:
        :: GETPTYPE                              * A6216
          { xFUNCTION XLIB PlotOptFuncVals POLAR XLIB PlotOptPolarVals * A6220
            xPARAMETRIC XLIB PlotOptFuncVals xCONIC XLIB PlotOptConicVals * A6245
            xTRUTH XLIB PlotOptTruthVals XLIB DIFFEQ XLIB PlotOptDiffVals * A6265
            xHISTOGRAM XLIB PlotOptStatVals xBAR XLIB PlotOptStatVals * A628B
            xSCATTER XLIB PlotOptStatVals XLIB SLOPEFIELD * A62AB
            XLIB PlotOptViewVals XLIB WIREFRAME XLIB PlotOptWireVals * A62C6
            XLIB PCONTOUR XLIB PlotOptViewVals XLIB YSLICE * A62E7
            XLIB PlotOptSliceVals XLIB GRIDMAP XLIB PlotOptGridVals * A6308
            XLIB PARSURFACE XLIB PlotOptWireVals } * A6329
          XLIB RompLookup NcaseSIZEERR EVAL      * A6344
        ;                                        * A6359

* ROMPTR 0B4 062
* refs (1): A2437
* field values -> : stores the options, by PTYPE
PlotOptsStore:
        :: GETPTYPE                              * A635E
          { xFUNCTION XLIB PlotOptFuncStore POLAR XLIB PlotOptPolarStore * A6368
            xPARAMETRIC XLIB PlotOptFuncStore xCONIC XLIB PlotOptConicStore * A638D
            xTRUTH XLIB PlotOptTruthStore XLIB DIFFEQ XLIB PlotOptDiffStore * A63AD
            xHISTOGRAM XLIB PlotOptStatStore xBAR XLIB PlotOptStatStore * A63D3
            xSCATTER XLIB PlotOptStatStore XLIB SLOPEFIELD * A63F3
            XLIB PlotOptViewStore XLIB WIREFRAME XLIB PlotOptWireStore * A640E
            XLIB PCONTOUR XLIB PlotOptViewStore XLIB YSLICE * A642F
            XLIB PlotOptSliceStore XLIB GRIDMAP XLIB PlotOptGridStore * A6450
            XLIB PARSURFACE XLIB PlotOptWireStore } * A6471
          XLIB RompLookup NcaseSIZEERR EVAL      * A648C
        ;                                        * A64A1

* ROMPTR 0B4 063
* refs (1): A2437
* -> : ERASE key: clears PICT
PlotEraseKey:
        :: TakeOver XLIB ~DOERASE SetDA123NoCh ; * A64A6

* ROMPTR 0B4 064
* refs (1): A2437
* -> : DRAW key: stores the fields, draws and shows PICT, then returns to the form with its fields read again, in case the plot changed them
PlotDrawKey:
        :: TakeOver XLIB GetFieldVals 14GETLAM XLIB PlotFormStore GETPTYPE * A64C5
          1LAMBIND XLIB PltDraw 1GETABND PUTPTYPE MINUSONE ' LAM 'PX STOLAM * A64EF
          XLIB IFFirstField# XLIB IFSetField XLIB PlotFormVals * A6525
          XLIB SetFieldVals ;                    * A6546

* ROMPTR 0B4 065
* refs (1): A2437
* #msg -> ... flag: Type field: 33 (reset), 26 (CHOOS), 38 (next value) and 39 (letter key) go to the PlotType routines, which rebuild the form
PlotTypeMH:
        ::                                       * A6556
          { BINT33 XLIB PlotTypeReset BINT26 XLIB PlotTypeChoose BINT38 * A655B
            XLIB PlotTypeNext BINT39 XLIB PlotTypeSeek } * A6585
          EQLookup case                          * A65A5
          :: EVAL TRUE ;                         * A65AF
          XLIB PlotFieldMH ;                     * A65C3

* ROMPTR 0B4 066
* refs (1): A2437
* #msg -> ... flag: Eq field: 43 gives the editor keys
PlotEqMH:
        :: BINT43 OVER #<>case XLIB PlotFieldMH  * A65D3
          DROP BINT4 XLIB PlotEditKeys TrueTrue ; * A65F2

* ROMPTR 0B4 067
* refs (1): A2437
* #msg -> ... flag: default for the form's fields: 8 keys, 32 the RESET choices
PlotFieldMH:
        :: BINT8 #=casedrop XLIB PlotKey         * A6611
          BINT32 #<>case FALSE                   * A662B
          XLIB PlotResetMenu TRUE ;              * A663A

* ROMPTR 0B4 068
* refs (1): A2437
* -> form arguments: the form for CONIC
PlotConicForm:
        :: XLIB PlotLblType XLIB PlotLblAngle XLIB PlotLblEq * A664F
          XLIB PlotLblIndep XLIB PlotLblHView XLIB PlotLblVView * A6675
          XLIB PlotFldType XLIB PlotFldAngle     * A6696

* ROMPTR 0B4 069
* refs (1): A2437
* Field: the conic's equation, with the editor keys of PlotConicEqMH
PlotFldConicEq:
          :: 'RROMPTR@ XLIB PlotConicEqMH BINT25 BINT17 # 67 BINT9 BINT23 * A66AC
            { BINT9 BINT8 BINT6 BINT0 BINT5 } BINT4 # BE09 * A66DF  "Enter function(s) to plot"
            { # BF0A TRUE } MINUSONE MINUSONE MINUSONE ; * A6711  "Funcs in"
          XLIB PlotFldIndep XLIB PlotFldHLo XLIB PlotFldHHi XLIB PlotFldVLo * A673E
          XLIB PlotFldVHi BINT6 BINT8 'RROMPTR@ XLIB PlotFormMH # BE01 * A676A  "Plot"

* ROMPTR 0B4 06A
* refs (1): A2437
* -> field values: as PlotFuncVals, also keeping the first dependent variable in LAM PE1
PlotConicVals:
          :: XLIB ModeAngle XLIB GetEQ CHECKPVARS INCOMPDROP 1get(li)? ' * A6799
            LAM 'PE1 STOLAM XLIB PltPtypeItem 8UNROLL 2DROP 1get(li)? * A67C8
            SWAPROT C%>% ROT C%>% ROTSWAP ;      * A67F6
          BINT8 XLIB IFSetHelps ;                * A6814

* ROMPTR 0B4 06B
* refs (1): A2437
* #msg -> ... flag: Eq field: 43 gives editor keys with both variables
PlotConicEqMH:
        :: BINT43 OVER #<>case XLIB PlotFieldMH  * A6829
          DROP BINT4 XLIB PlotConicEditKeys TrueTrue ; * A6848

* ROMPTR 0B4 06C
* refs (1): A2437
* field values -> : stores the ranges, angle mode and EQ
PlotConicStore:
        :: yrng(2r) xrng(2r) XLIB PltPutIndep XLIB PutEQ XLIB NTHEval3 * A6867
          XLIB NTHEval2 FALSE FALSE ;            * A6897

* ROMPTR 0B4 06D
* refs (1): A2437
* -> form arguments: the form for TRUTH
PlotTruthForm:
        :: XLIB PlotLblType XLIB PlotLblAngle XLIB PlotLblEq * A68B1
          XLIB PlotLblIndep XLIB PlotLblHView XLIB PlotLblVView * A68D7
          XLIB PlotFldType XLIB PlotFldAngle XLIB PlotFldConicEq * A68F8
          XLIB PlotFldIndep XLIB PlotFldHLo XLIB PlotFldHHi XLIB PlotFldVLo * A6919
          XLIB PlotFldVHi BINT6 BINT8 'RROMPTR@ XLIB PlotFormMH # BE01 * A6945  "Plot"
          XLIB PlotConicVals BINT8 XLIB IFSetHelps ; * A6974

* ROMPTR 0B4 06F
* refs (2): A2437 A2437
* field values -> : stores the ranges, angle mode and EQ. Commands 06E and 06F are this object
PlotTruthStore:
        :: yrng(2r) xrng(2r) XLIB PltPutIndep XLIB PutEQ XLIB NTHEval3 * A6994
          XLIB NTHEval2 FALSE FALSE ;            * A69C4

* ROMPTR 0B4 070
* refs (1): A2437
* -> form arguments: the form for PARAMETRIC
PlotParamForm:
        :: XLIB PlotLblType XLIB PlotLblAngle XLIB PlotLblEq * A69DE
          XLIB PlotLblIndep XLIB PlotLblHView XLIB PlotLblAuto * A6A04
          XLIB PlotLblVView XLIB PlotFldType XLIB PlotFldAngle 'RROMPTR@ * A6A25
          XLIB PlotEqMH BINT25 BINT17 # 67 BINT9 BINT23 * A6A4B
          { BINT9 BINT8 BINT6 BINT0 BINT5 } BINT4 # BE10 * A6A74  "Enter complex-valued func(s)"
          { # BF0A TRUE } MINUSONE MINUSONE MINUSONE XLIB PlotFldIndep * A6AA6  "Funcs in"
          XLIB PlotFldHLo XLIB PlotFldHHi XLIB PlotFldAuto XLIB PlotFldVLo * A6AD9
          XLIB PlotFldVHi BINT7 BINT9 'RROMPTR@ XLIB PlotFormMH # BE0F * A6B05  "Plot (x(t), y(t))"
          XLIB PlotFuncVals BINT9 XLIB IFSetHelps ; * A6B34

* ROMPTR 0B4 071
* refs (1): A2437
* -> form arguments: the form for DIFFEQ, with the same fields as SolveDiffForm where they apply
PlotDiffForm:
        :: XLIB PlotLblType XLIB PlotLblAngle XLIB PlotLblIndep # BF13 * A6B54  "Init:"
          BINT40 BINT28 # BF14 BINT85 BINT28 # BF15 BINT1 BINT37 # BF13 * A6B84  "Final:"  "Soln:"  "Init:"
          BINT40 BINT37 # BF18 # 5C BINT37 # BF0F BINT1 BINT19 # BF10 BINT37 * A6BC0  "Stiff"  "f:"  "∂f∂y:"
          BINT19 # BF11 BINT85 BINT19 XLIB PlotFldType XLIB PlotFldAngle * A6C06  "∂f∂t:"
          'RROMPTR@ XLIB PlotDiffF1MH BINT25 BINT17 # 67 BINT9 BINT23 * A6C35
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BE12 # BF0A MINUSONE * A6C63  "Enter function of INDEP and SOLN"  "Funcs in"
          MINUSONE MINUSONE 'RROMPTR@ XLIB PlotDiffF2MH BINT10 BINT17 BINT25 * A6CA4
          BINT9 BINT23                           * A6CCD
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BE12 # BF0A MINUSONE * A6CD7  "Enter function of INDEP and SOLN"  "Funcs in"
          MINUSONE MINUSONE 'RROMPTR@ XLIB PlotDiffF2MH BINT58 BINT17 BINT25 * A6D18
          BINT9 BINT23                           * A6D41
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BE13 # BF0A MINUSONE * A6D4B  "Enter derivative w.r.t. SOLN"  "Funcs in"
          MINUSONE MINUSONE 'RROMPTR@ XLIB PlotDiffF2MH # 6A BINT17 BINT25 * A6D8C
          BINT9 BINT23                           * A6DBA
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BE14 # BF0A MINUSONE * A6DC4  "Enter derivative w.r.t. INDEP"  "Funcs in"
          MINUSONE MINUSONE XLIB PlotFldIndep 'RROMPTR@ XLIB PlotFieldMH * A6E05
          BINT58 BINT26 BINT25 BINT9 BINT1       * A6E2A
          { BINT0 } BINT4 # BF1D MINUSONE MINUSONE %0_2A2B4 MINUSONE * A6E43  "Enter initial indep var value"
          'RROMPTR@ XLIB PlotFieldMH # 6A BINT26 BINT25 BINT9 BINT1 * A6E75
          { BINT0 } BINT4 # BF1E MINUSONE MINUSONE % 6.5E0 MINUSONE * A6EA3  "Enter final indep var value"
          'RROMPTR@ XLIB PlotFieldMH BINT25 BINT35 BINT13 BINT9 BINT1 * A6EE5
          { BINT6 } BINT4 # BF1F MINUSONE MINUSONE ' ID Y MINUSONE 'RROMPTR@ * A6F0E  "Enter solution var name"
          XLIB PlotFieldMH BINT58 BINT35 BINT25 BINT9 BINT1 * A6F4E
          { BINT0 BINT3 } BINT4 # BF20 MINUSONE MINUSONE %0_2A2B4 MINUSONE * A6F72  "Enter initial solution var value"
          'RROMPTR@ XLIB PlotDiffStiffMH BINT85 BINT35 BINT6 BINT9 BINT32 * A6FA9
          MINUSONE MINUSONE # BE15 MINUSONE MINUSONE FALSE MINUSONE BINT11 * A6FD2  "Use Stiff diff eq solver?"
          BINT12 'RROMPTR@ XLIB PlotDiffMH # BE11 * A6FFF  "Plot y'(t)=f(t,y)"

* ROMPTR 0B4 072
* refs (1): A2437
* -> field values
PlotDiffVals:
          :: XLIB ModeAngle XLIB GetFirstEq XLIB GetDeq3 CHECKPVARS * A701E
            INCOMPDROP ROTDROPROTDROP 4ROLLDROP 4ROLLDROP 3UNROLL * A7049
            XLIB PltPtypeItem 8UNROLL DUP 1get(li)? 3UNROLL * A7062
            XLIB PltIndepRngT ROT DUP 1get(li)? SWAP XLIB DeqInitVal 6PICK * A7081
            MINUSONE EQUAL NOT ;                 * A70B0
          BINT12 XLIB IFSetHelps ;               * A70C4

* ROMPTR 0B4 073
* refs (1): A2437
* field values -> : stores the plot's differential equation
PlotDiffStore:
        :: 6UNROLL XLIB DeqPutInit XLIB PltPutDepend XLIB PltPutIndepRng * A70D9
          XLIB PltPutIndep ITE                   * A7104
          :: XLIB PutDeq3 DROP ;                 * A7114
          :: 3DROP XLIB PutEQ ;                  * A712E
          XLIB NTHEval3 XLIB NTHEval2 FALSE FALSE ; * A7148

* ROMPTR 0B4 074
* refs (1): A2437
* #msg -> ... flag: form message handler: 5 labels, 14 first field; otherwise PlotFormMH's
PlotDiffMH:
        ::                                       * A716D
          { BINT5 XLIB PlotDiffLabels BINT14     * A7172
            :: XLIB PlotDiffStiff? ITE BINT4 BINT3 * A718C
              XLIB PlotFirstField ;              * A71AB
            BINT56                               * A71BB
            :: 14GETLAM SWAP ; }                 * A71C0
          EQLookup case                          * A71D9
          :: EVAL TRUE ;                         * A71E3
          XLIB PlotFormMH ;                      * A71F7

* ROMPTR 0B4 075
* refs (1): A2437
* -> grob FALSE: message 5: draws the labels, the ∂f labels only when Stiff is on
PlotDiffLabels:
        :: BINT39 BINT131 MAKEGROB BINT10 ONE_DO INDEX@ XLIB IFDispLabel * A7207
          LOOP XLIB PlotDiffStiff? NOTcaseFALSE BINT12 * A7235
          BINT10 DO INDEX@ XLIB IFDispLabel LOOP FALSE ; * A724F

* ROMPTR 0B4 076
* refs (1): A2437
* #msg -> ... flag: non-stiff f field: hidden while Stiff is on
PlotDiffF1MH:
        :: BINT7 #=casedrop XLIB PlotDiffStiff?  * A7278
          BINT55 OVER #<>case XLIB PlotDiffEditMH * A7292
          DROP XLIB PlotDiffStiff? NOT TRUE ;    * A72AC

* ROMPTR 0B4 077
* refs (1): A2437
* #msg -> ... flag: fields of stiff mode: hidden unless Stiff is on
PlotDiffF2MH:
        :: BINT7 #=casedrop                      * A72CB
          :: XLIB PlotDiffStiff? NOT ;           * A72DA
          BINT55 OVER #<>case XLIB PlotDiffEditMH * A72F4
          DROP XLIB PlotDiffStiff? TRUE ;        * A730E

* ROMPTR 0B4 078
* refs (1): A2437
* #msg -> ... flag: 43 gives editor keys with the variable names
PlotDiffEditMH:
        :: BINT43 OVER #<>case XLIB PlotFieldMH  * A7328
          DROP BINT7 BINT10 XLIB PlotEditKeys2 TrueTrue ; * A7347

* ROMPTR 0B4 079
* refs (1): A2437
* #msg -> ... flag: Stiff check: 47 moves f to the field now shown and redraws the row
PlotDiffStiffMH:
        :: BINT47 OVER #<>case XLIB PlotFieldMH  * A736B
          DROP XLIB PlotDiffMoveF XLIB PlotDiffStiffDisp TRUE ; * A738A

* ROMPTR 0B4 07A
* refs (1): A2437
* -> : copies f from the field just hidden to the field now shown
PlotDiffMoveF:
        :: XLIB PlotDiffStiff? DUP ITE BINT3 BINT4 * A73AF
          XLIB ~gFldVal SWAP ITE BINT4 BINT3     * A73D3
          XLIB ~sFldVal ;                        * A73F2

* ROMPTR 0B4 07B
* refs (1): A2437
* -> : blanks the row of f fields and redraws what Stiff now shows
PlotDiffStiffDisp:
        :: XLIB PlotDiffStiff? ITE               * A7402
          :: BINT7 BINT4 BINT12 BINT9 ;          * A7417
          :: BINT4 BINT3 BINT10 BINT9 ;          * A7435
          HARDBUFF 3UNROLL BINT17 BINT9 BLANKIT DO INDEX@ XLIB IFDispLabel * A7453
          LOOP DROP DO INDEX@ XLIB IFMarkPending LOOP ; * A7481

* ROMPTR 0B4 07C
* refs (1): A2437
* -> flag: value of the Stiff field
PlotDiffStiff?:
        :: BINT12 XLIB ~gFldVal ;                * A74AA

* ROMPTR 0B4 07D
* refs (1): A2437
* -> form arguments: the form for HISTOGRAM
PlotHistoForm:
        ::                                       * A74C4

* ROMPTR 0B4 07E
* refs (1): A2437
* Labels of the HISTOGRAM and BAR forms
PlotLblsStat:
          :: XLIB PlotLblType                    * A74C9

* ROMPTR 0B4 07F
* refs (1): A2437
* Label "ΣDat:"
PlotLblDat:
            :: # BE16 BINT1 BINT19 ; # BE17 BINT91 BINT19 # BE18 BINT1 * A74D9  "ΣDat:"  "Col:"  "Wid:"
            BINT28 XLIB PlotLblHView XLIB PlotLblAuto XLIB PlotLblVView ; * A751A
          XLIB PlotFldType                       * A7545

* ROMPTR 0B4 080
* refs (1): A2437
* Field: the statistics data
PlotFldDat:
          :: 'RROMPTR@ XLIB PlotDatMH BINT25 BINT17 BINT61 BINT9 BINT21 * A7550
            { BINT3 } BINT4 # BE19 # BE1A MINUSONE MINUSONE MINUSONE ; * A757E  "Enter data to plot"  "Arrays in"

* ROMPTR 0B4 081
* refs (1): A2437
* Field: column to plot
PlotFldCol:
          :: 'RROMPTR@ XLIB PlotFieldMH # 6A BINT17 BINT13 BINT9 BINT1 * A75BA
            { BINT0 } BINT4 # BE1B MINUSONE MINUSONE %1 MINUSONE ; * A75ED  "Enter column to plot"
          'RROMPTR@ XLIB PlotHistoWidMH BINT19 BINT26 BINT25 BINT9 BINT1 * A7624
          { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE1C MINUSONE MINUSONE BINT0 * A764D  "Enter bar width"
          MINUSONE XLIB PlotFldHLo XLIB PlotFldHHi XLIB PlotFldAuto * A7685
          XLIB PlotFldVLo XLIB PlotFldVHi BINT7 BINT9 'RROMPTR@ * A76AB
          XLIB PlotStatMH # BE01                 * A76D0  "Plot"

* ROMPTR 0B4 082
* refs (1): A2437
* -> field values: HISTOGRAM and BAR, from ΣDAT, ΣPAR and PPAR
PlotStatVals:
          :: XLIB StatGetDAT STATGETXCOL CHECKPVARS INCOMPDROP DROP * A76E5
            XLIB PltPtypeItem 8UNROLL DROP XLIB PltRes>Fld DROP 4UNROLL DROP * A7709
            C%>% ROT C%>% 3UNROLL 4UNROLL FALSE 3UNROLL ; * A7738
          BINT9 XLIB IFSetHelps ;                * A7760

* ROMPTR 0B4 083
* refs (1): A2437
* field values -> : HISTOGRAM and BAR: stores ranges, column and ΣDAT
PlotStatStore:
        :: yrng(2r) 7UNROLL xrng(2r) XLIB PltPutResNum STATXCOL * A7775
          XLIB StatPutDAT XLIB NTHEval2 FALSE SWAP ; * A7799

* ROMPTR 0B4 084
* refs (1): A2437
* #msg -> ... flag: form message handler of the statistics plots
PlotStatMH:
        ::                                       * A77BE
          { BINT16                               * A77C3
            :: XLIB PlotMenu TRUE ; BINT14       * A77CD
            :: BINT2 XLIB PlotFirstField ; BINT56 * A77EC
            :: 14GETLAM SWAP ; }                 * A780B
          EQLookup case                          * A7824
          :: EVAL TRUE ;                         * A782E
          DROPFALSE ;                            * A7842

* ROMPTR 0B4 085
* refs (1): A2437
* #msg -> ... flag: ΣDat field: 23 edits it in the MatrixWriter
PlotDatMH:
        :: BINT23 OVER #<>case XLIB PlotFieldMH  * A784C
          DROP XLIB IFEditArray TRUE ;           * A786B

* ROMPTR 0B4 086
* refs (1): A2437
* #msg -> ... flag: Wid field of HISTOGRAM: 41 gives the value to edit
PlotHistoWidMH:
        :: BINT41 OVER #<>case XLIB PlotFieldMH  * A7885
          DROP XLIB PlotHistoDfltWid TRUE ;      * A78A4

* ROMPTR 0B4 087
* refs (1): A2437
* -> ob TRUE: value to edit; where the field shows Dflt, the horizontal range over 13
PlotHistoDfltWid:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A78BE
          DROP BINT5 XLIB ~gFldVal BINT6 XLIB ~gFldVal XLIB PltDefWidth TRUE ; * A78E2

* ROMPTR 0B4 088
* refs (1): A2437
* -> form arguments: the form for BAR
PlotBarForm:
        :: XLIB PlotLblsStat XLIB PlotFldType XLIB PlotFldDat * A791C
          XLIB PlotFldCol 'RROMPTR@ XLIB PlotBarWidMH BINT19 BINT26 BINT25 * A7942
          BINT9 BINT1                            * A796C
          { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE1C MINUSONE MINUSONE BINT0 * A7976  "Enter bar width"
          MINUSONE XLIB PlotFldHLo XLIB PlotFldHHi XLIB PlotFldAuto * A79AE
          XLIB PlotFldVLo XLIB PlotFldVHi BINT7 BINT9 'RROMPTR@ * A79D4
          XLIB PlotStatMH # BE01 XLIB PlotStatVals BINT9 XLIB IFSetHelps ; * A79F9  "Plot"

* ROMPTR 0B4 089
* refs (1): A2437
* #msg -> ... flag: Wid field of BAR: 41 gives the value to edit
PlotBarWidMH:
        :: BINT41 OVER #<>case XLIB PlotFieldMH  * A7A2E
          DROP XLIB PlotBarDfltWid TRUE ;        * A7A4D

* ROMPTR 0B4 08A
* refs (1): A2437
* -> ob TRUE: value to edit; 1 where the field shows Dflt
PlotBarDfltWid:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A7A67
          DROP %1 TRUE ;                         * A7A8B

* ROMPTR 0B4 08B
* refs (1): A2437
* -> form arguments: the form for SCATTER
PlotScatForm:
        :: XLIB PlotLblType XLIB PlotLblDat # BE1D BINT79 BINT19 * A7A9F  "Cols:"
          XLIB PlotLblHView XLIB PlotLblAuto XLIB PlotLblVView * A7ACE
          XLIB PlotFldType 'RROMPTR@ XLIB PlotDatMH BINT25 BINT17 BINT49 * A7AEF
          BINT9 BINT21                           * A7B19
          { BINT3 } BINT4 # BE19 # BE1A MINUSONE MINUSONE MINUSONE 'RROMPTR@ * A7B23  "Enter data to plot"  "Arrays in"
          XLIB PlotFieldMH BINT100 BINT17 BINT13 BINT9 BINT1 * A7B5F
          { BINT0 } BINT4 # BE1E MINUSONE MINUSONE %1 MINUSONE 'RROMPTR@ * A7B83  "Enter col to use for horizontal"
          XLIB PlotFieldMH # 76 BINT17 BINT13 BINT9 BINT1 * A7BBA
          { BINT0 } BINT4 # BE1F MINUSONE MINUSONE %2 MINUSONE * A7BE3  "Enter col to use for vertical"
          XLIB PlotFldHLo XLIB PlotFldHHi XLIB PlotFldAuto XLIB PlotFldVLo * A7C15
          XLIB PlotFldVHi BINT6 BINT9 'RROMPTR@ XLIB PlotStatMH # BE01 * A7C41  "Plot"

* ROMPTR 0B4 08C
* refs (1): A2437
* -> field values
PlotScatVals:
          :: XLIB StatGetDAT STATGETXCOL STATGETYCOL CHECKPVARS INCOMPDROP * A7C70
            DROP 4UNROLL3DROP XLIB PltPtypeItem 6UNROLL C%>% ROT C%>% * A7C94
            3UNROLL 4UNROLL FALSE 3UNROLL ;      * A7CBD
          BINT9 XLIB IFSetHelps ;                * A7CD6

* ROMPTR 0B4 08D
* refs (1): A2437
* field values -> : stores ranges, both columns and ΣDAT
PlotScatStore:
        :: yrng(2r) 7UNROLL xrng(2r) STATYCOL STATXCOL XLIB StatPutDAT * A7CEB
          XLIB NTHEval2 FALSE SWAP ;             * A7D14

* ROMPTR 0B4 08E
* refs (1): A2437
* -> form arguments: "Plot Options" for FUNCTION
PlotOptFuncForm:
        ::                                       * A7D2E

* ROMPTR 0B4 08F
* refs (1): A2437
* Labels of the options forms for FUNCTION, POLAR and PARAMETRIC
PlotOptLbls:
          ::                                     * A7D33

* ROMPTR 0B4 090
* refs (1): A2437
* Label "Indep:"
PlotOptLblIndep:
            :: # BF12 BINT1 BINT10 ;             * A7D38  "Indep:"

* ROMPTR 0B4 091
* refs (1): A2437
* Label "Lo:"
PlotOptLblLo:
            :: # BE24 BINT43 BINT10 ;            * A7D56  "Lo:"

* ROMPTR 0B4 092
* refs (1): A2437
* Label "Hi:"
PlotOptLblHi:
            :: # BE25 BINT91 BINT10 ;            * A7D74  "Hi:"

* ROMPTR 0B4 093
* refs (1): A2437
* Label "Axes"
PlotOptLblAxes:
            :: # BE26 BINT8 BINT19 ;             * A7D92  "Axes"

* ROMPTR 0B4 094
* refs (1): A2437
* Label "Simult"
PlotOptLblSimult:
            :: # BE27 BINT98 BINT19 ;            * A7DB0  "Simult"

* ROMPTR 0B4 095
* refs (1): A2437
* Label "Connect"
PlotOptLblConnect:
            :: # BE28 BINT50 BINT19 ;            * A7DCE  "Connect"

* ROMPTR 0B4 096
* refs (1): A2437
* Label "Step:"
PlotOptLblStep:
            :: # BF17 BINT1 BINT28 ;             * A7DEC  "Step:"

* ROMPTR 0B4 097
* refs (1): A2437
* Label "Pixels", next to Step
PlotOptLblPixels:
            :: # BE29 BINT62 BINT28 ;            * A7E0A  "Pixels"

* ROMPTR 0B4 098
* refs (1): A2437
* Label "H-Tick:"
PlotOptLblHTick:
            :: # BE2A BINT1 BINT37 ;             * A7E28  "H-Tick:"

* ROMPTR 0B4 099
* refs (1): A2437
* Label "V-Tick:"
PlotOptLblVTick:
            :: # BE2B BINT49 BINT37 ;            * A7E46  "V-Tick:"

* ROMPTR 0B4 09A
* refs (1): A2437
* Label "Pixels", next to the ticks
PlotOptLblPixels2:
            :: # BE29 # 6B BINT37 ; ;            * A7E64  "Pixels"

* ROMPTR 0B4 09B
* refs (1): A2437
* Field: independent variable
PlotOptFldIndep:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT25 BINT8 BINT13 BINT9 BINT1 * A7E8C
            { BINT6 } BINT4 # BF1C MINUSONE MINUSONE 'IDX MINUSONE ; * A7EBA  "Enter independent var name"

* ROMPTR 0B4 09C
* refs (1): A2437
* Field: minimum independent value; shows Dflt when not set
PlotOptFldLo:
          :: 'RROMPTR@ XLIB PlotOptLoMH BINT55 BINT8 BINT31 BINT9 BINT1 * A7EF1
            { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE2C MINUSONE MINUSONE BINT0 * A7F1F  "Enter minimum indep var value"
            MINUSONE ;                           * A7F57

* ROMPTR 0B4 09D
* refs (1): A2437
* Field: maximum independent value; shows Dflt when not set
PlotOptFldHi:
          :: 'RROMPTR@ XLIB PlotOptHiMH BINT100 BINT8 BINT31 BINT9 BINT1 * A7F61
            { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE2D MINUSONE MINUSONE BINT0 * A7F8F  "Enter maximum indep var value"
            MINUSONE ;                           * A7FC7

* ROMPTR 0B4 09E
* refs (1): A2437
* Field: draw axes check
PlotOptFldAxes:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT1 BINT17 BINT6 BINT9 BINT32 * A7FD1
            MINUSONE MINUSONE # BE2E MINUSONE MINUSONE TRUE MINUSONE ; * A7FFF  "Draw axes before plotting?"

* ROMPTR 0B4 09F
* refs (1): A2437
* Field: connect points check
PlotOptFldConnect:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT43 BINT17 BINT6 BINT9 BINT32 * A802C
            MINUSONE MINUSONE # BE2F MINUSONE MINUSONE TRUE MINUSONE ; * A805A  "Connect plot points?"

* ROMPTR 0B4 0A0
* refs (1): A2437
* Field: simultaneous plotting check
PlotOptFldSimult:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT91 BINT17 BINT6 BINT9 BINT32 * A8087
            MINUSONE MINUSONE # BE30 MINUSONE MINUSONE FALSE MINUSONE ; * A80B5  "Plot functions simultaneously?"

* ROMPTR 0B4 0A1
* refs (1): A2437
* Field: independent variable step; shows Dflt when not set
PlotOptFldStep:
          :: 'RROMPTR@ XLIB PlotOptStepMH BINT25 BINT26 BINT25 BINT9 BINT1 * A80E2
            { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BE31 MINUSONE MINUSONE BINT0 * A8110  "Enter indep var increment"
            MINUSONE ;                           * A8148

* ROMPTR 0B4 0A2
* refs (1): A2437
* Field: step in pixels check
PlotOptFldStepPix:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT55 BINT26 BINT6 BINT9 BINT32 * A8152
            MINUSONE MINUSONE # BE32 MINUSONE MINUSONE FALSE MINUSONE ; * A8180  "Indep step units are pixels?"

* ROMPTR 0B4 0A3
* refs (1): A2437
* Field: horizontal tick spacing
PlotOptFldHTick:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT28 BINT35 BINT13 BINT9 BINT1 * A81AD
            { BINT0 } BINT4 # BE33 MINUSONE MINUSONE %10 MINUSONE ; * A81DB  "Enter horizontal tick spacing"

* ROMPTR 0B4 0A4
* refs (1): A2437
* Field: vertical tick spacing
PlotOptFldVTick:
          :: 'RROMPTR@ XLIB PlotOptFieldMH # 4C BINT35 BINT13 BINT9 BINT1 * A8212
            { BINT0 } BINT4 # BE34 MINUSONE MINUSONE %10 MINUSONE ; * A8245  "Enter vertical tick spacing"

* ROMPTR 0B4 0A5
* refs (1): A2437
* Field: ticks in pixels check
PlotOptFldTickPix:
          :: 'RROMPTR@ XLIB PlotOptFieldMH BINT100 BINT35 BINT6 BINT9 BINT32 * A827C
            MINUSONE MINUSONE # BE35 MINUSONE MINUSONE TRUE MINUSONE ; * A82AA  "Tick spacing units are pixels?"
          BINT11 DUP 'DROPFALSE # BE23           * A82D7  "Plot Options"

* ROMPTR 0B4 0A6
* refs (1): A2437
* -> field values
PlotOptFuncVals:
          :: XLIB PltAxes? XLIB PltConnect? XLIB PltSimult? CHECKPVARS * A82F0
            INCOMPDROP 2DROP 5UNROLL ROTDROPROTDROP SWAPDUP 1get(li)? * A831B
            7UNROLL XLIB PltIndepRng 7UNROLL 7UNROLL XLIB PltRes>Fld ROT * A8339
            XLIB PltTicks>Fld ;                  * A8363
          BINT11 XLIB IFSetHelps ;               * A8373

* ROMPTR 0B4 0A7
* refs (1): A2437
* field values -> : stores them
PlotOptFuncStore:
        :: XLIB PltPutTicks XLIB PltPutRes XLIB PltSimult! XLIB PltConnect! * A8388
          XLIB PltAxes! ROMPTR 0B5 033 XLIB PltPutIndep ; * A83B9

* ROMPTR 0B4 0A8
* refs (1): A2437
* #msg -> ... flag: Lo field: 41 value to edit, 47 keeps Lo and Hi either both set or both default
PlotOptLoMH:
        ::                                       * A83DF
          { BINT41 XLIB PlotOptDfltLo BINT47 XLIB PlotOptLoChg } EQLookup * A83E4
          case                                   * A8413
          :: EVAL TRUE ;                         * A8418
          XLIB PlotOptFieldMH ;                  * A842C

* ROMPTR 0B4 0A9
* refs (1): A2437
* -> ob TRUE: value to edit; the current lower range where the field shows Dflt
PlotOptDfltLo:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A843C
          DROP XLIB PltHView DROP TRUE ;         * A8460

* ROMPTR 0B4 0AA
* refs (1): A2437
* -> : Lo changed: back to default takes Hi with it; a value when Hi is default fills Hi in from the range
PlotOptLoChg:
        :: 4GETLAM DUP XLIB ~gFldVal TYPEBINT? case * A847F
          :: #1+ BINT0 OVER XLIB ~sFldVal XLIB IFMarkPending ; * A84A3
          #1+ DUP XLIB ~gFldVal TYPEBINT? NOTcaseDROP XLIB PltHView * A84D2
          SWAPDROP OVER XLIB ~sFldVal XLIB IFMarkPending ; * A84FC
