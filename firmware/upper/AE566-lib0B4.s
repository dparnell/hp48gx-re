* HP 48GX ROM revision R, #AE566-#B1605: Library 0B4: the alarm browser, the Statistics applications, and I/O (send, print, transfer)
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: StatSumForm StatSumCalc StatSumArgs StatSingleForm StatSingleCalc StatSingleArgs StatPredMenu StatPredMH StatPredKey StatPredForm StatPredCalc StatLblYCol
* Follows on from the previous file (at #AE566 in the original ROM).
        RPL

* ROMPTR 0B4 16F
* refs (1): A2437
* #msg -> ... flag: Choose message handler: full screen, element count and access, how each line looks, the menu
AlarmBrowseMH:
        ::                                       * AE566
          { BINT60 TRUE BINT62 XLIB AlmCount BINT80 XLIB AlmGet BINT81 * AE56B
            XLIB AlarmBrowseGrob BINT83          * AE59F
            :: ' XLIB AlarmBrowseMenu ; BINT96   * AE5AF
            :: XLIB ~BBReReadNElems TRUE ; }     * AE5CE
          EQLookup case                          * AE5ED
          :: EVAL TRUE ;                         * AE5F7
          DROPFALSE ;                            * AE60B

* ROMPTR 0B4 170
* refs (1): A2437
* # -> grob: draws one alarm line: date, time and message
AlarmBrowseGrob:
        :: XLIB ~BBGetNStr DUP _chr(31)_ EQUAL ITE * AE615
          :: NULL$ DUP ;                         * AE639
          :: DUP BINT1 BINT3 SUB$ OVER BINT5 BINT24 SUB$ ROT BINT26 OVERLEN$ * AE64D
            SUB$ ;                               * AE689
          7GETLAM 8GETLAM MAKEGROB 4ROLL $>grob OVER BINT1 BINT2 GROB! ROT * AE693
          $>grob OVER BINT19 BINT2 GROB! SWAP DUPLEN$ BINT5 8GETLAM BINT131 * AE6C5
          #<> IT #1-                             * AE6F7
          DUPUNROT #>ITE                         * AE706
          :: 1_#1-SUB$ CHR_... >T$ ; DROP $>GROB OVER BINT100 BINT1 GROB! ; * AE710

* ROMPTR 0B4 171
* refs (1): A2437
* -> menu: EDIT, NEW, PURG and OK
AlarmBrowseMenu:
        :: NoExitAction                          * AE74C
          {                                      * AE756
            {                                    * AE75B
              :: TakeOver 12GETLAM #0<> ITE      * AE760
                :: PTR DirLabel: $ "EDIT" ; NULL$ * AE779
              ;                                  * AE79F
              XLIB AlarmBrowseEdit }             * AE7A4
            {                                    * AE7B4
              :: PTR DirLabel: $ "NEW" ; XLIB AlarmBrowseNew } * AE7B9
            {                                    * AE7E8
              :: TakeOver 12GETLAM #0<> ITE $ "PURG" NULL$ * AE7ED
              ;                                  * AE81D
              XLIB AlarmBrowsePurge }            * AE822
            NullMenuKey NullMenuKey              * AE832
            { $ "OK" XLIB DoCKeyOK } }           * AE83C
        ;                                        * AE864

* ROMPTR 0B4 172
* refs (1): A2437
* -> : EDIT key: runs AlarmForm on the highlighted alarm and replaces it
AlarmBrowseEdit:
        :: TakeOver 12GETLAM #0=case DoBadKey    * AE869
          18GETLAM XLIB ~BBGetN 1LAMBIND 1GETLAM XLIB AlmMsg 1GETLAM * AE882
          XLIB AlmTime 1GETLAM XLIB AlmDate 3UNROLL 2DUP SWAP 5ROLL 1GETLAM * AE8AC
          XLIB AlmRepeat BINT12 {}N XLIB AlarmForm NOT?SEMI * AE8E0
          1GETABND XLIB AlmDelete XLIB ~BBReReadNElems XLIB ~BBReReadWidth * AE905
          18GETLAM 12GETLAM #MIN BINT1 #MAX 18PUTLAM FALSE * AE92B
          XLIB ~BBRecalOff&Disp ;                * AE94E

* ROMPTR 0B4 173
* refs (1): A2437
* -> : NEW key: runs AlarmForm on a new alarm
AlarmBrowseNew:
        :: TakeOver XLIB AlarmDfltFields XLIB AlarmForm NOT?SEMI * AE95E
          XLIB ~BBReReadNElems XLIB ~BBReReadWidth 18GETLAM 12GETLAM #MIN * AE983
          BINT1 #MAX 18PUTLAM FALSE XLIB ~BBRecalOff&Disp ; * AE9A8

* ROMPTR 0B4 174
* refs (1): A2437
* -> : PURG key: deletes the highlighted alarm
AlarmBrowsePurge:
        :: TakeOver 12GETLAM #0=case DoBadKey    * AE9CC
          18GETLAM XLIB ~BBGetN XLIB AlmDelete XLIB ~BBReReadNElems * AE9E5
          XLIB ~BBReReadWidth 18GETLAM 12GETLAM #MIN BINT1 #MAX 18PUTLAM * AEA0B
          FALSE XLIB ~BBRecalOff&Disp ;          * AEA34

* ROMPTR 0B4 175
* refs (1): A2437
* -> : the STAT key: the choose box of statistics applications
StatApp:
        :: XLIB IFNotInForm                      * AEA49
          {                                      * AEA59
            { # BB01 XLIB StatSingleForm }       * AEA5E  "Single-var "
            { # BB02 XLIB StatFreqForm }         * AEA7D  "Frequencies "
            { # BB03 XLIB StatFitForm }          * AEA9C  "Fit data "
            { # BB04 XLIB StatSumForm } }        * AEABB  "Summary stats "
          XLIB IFTypeChoose ;                    * AEADF

* ROMPTR 0B4 176
* refs (1): A2437
* -> : "Single-Variable Statistics": ΣDAT, column, sample or population, and checks for the values to compute
StatSingleForm:
        ::                                       * AEAEF

* ROMPTR 0B4 177
* refs (1): A2437
* Label "ΣDAT:"
StatLblDat:
          :: # BB06 BINT1 BINT10 ;               * AEAF4  "ΣDAT:"

* ROMPTR 0B4 178
* refs (1): A2437
* Label "Col:"
StatLblCol:
          :: # BE17 BINT97 BINT10 ; # BB07 BINT1 BINT19 # BB08 BINT14 BINT28 * AEB12  "Col:"  "Type:"  "Mean"
          # BB09 BINT56 BINT28 # BB0A BINT98 BINT28 # BB0B BINT14 BINT37 * AEB58  "Std Dev"  "Variance"  "Total"
          # BB0C BINT56 BINT37 # BB0D BINT98 BINT37 * AEB94  "Maximum"  "Minimum"

* ROMPTR 0B4 179
* refs (1): A2437
* Field: the statistics data, initially ΣDAT
StatFldDat:
          :: 'RROMPTR@ XLIB IFArrayMH BINT22 BINT8 BINT67 BINT9 BINT21 * AEBBC
            { BINT3 } BINT4 # BB0E # BE1A MINUSONE MINUSONE XLIB StatGetDAT2 ; * AEBEA  "Enter statistical data"  "Arrays in"

* ROMPTR 0B4 17A
* refs (1): A2437
* Field: the variable column, initially XCOL
StatFldCol:
          :: 'DROPFALSE BINT115 BINT8 BINT13 BINT9 BINT1 * AEC2C
            { BINT0 } BINT4 # BB0F MINUSONE MINUSONE %1 XLIB StatGetCols * AEC4F  "Enter variable column"
            DROP ;                               * AEC87
          'DROPFALSE BINT22 BINT17 BINT61 BINT9 BINT12 MINUSONE BINT17 * AEC91
          # BB10 XLIB StatTypeItems BINT17 XLIB StatItemSample DUP * AECB9  "Choose statistics type"
          'DROPFALSE BINT7 BINT26 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AECE3
          # BB11 MINUSONE MINUSONE FALSE DUP 'DROPFALSE BINT49 BINT26 BINT6 * AED0B  "Calculate mean?"
          BINT9 BINT32 MINUSONE MINUSONE # BB12 MINUSONE MINUSONE FALSE DUP * AED3D  "Calculate standard deviation?"
          'DROPFALSE BINT91 BINT26 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AED6F
          # BB13 MINUSONE MINUSONE FALSE DUP 'DROPFALSE BINT7 BINT35 BINT6 * AED97  "Calculate variance?"
          BINT9 BINT32 MINUSONE MINUSONE # BB14 MINUSONE MINUSONE FALSE DUP * AEDC9  "Calculate column total?"
          'DROPFALSE BINT49 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AEDFB
          # BB15 MINUSONE MINUSONE FALSE DUP 'DROPFALSE BINT91 BINT35 BINT6 * AEE23  "Calculate column maximum?"
          BINT9 BINT32 MINUSONE MINUSONE # BB16 MINUSONE MINUSONE FALSE DUP * AEE55  "Calculate column minimum?"
          BINT9 DUP 'DROPFALSE # BB05 DoInputForm NOT?SEMI * AEE87  "Single-Variable Statistics"
          XLIB StatSingleArgs XLIB StatSingleCalc ; * AEEAA

* ROMPTR 0B4 17B
* refs (1): A2437
* field values -> ...: stores the column and ΣDAT and leaves the checks
StatSingleArgs:
        :: 8PICK XLIB StatGetCols SWAPDROP XLIB ~STATCOL BINT9 ROLL * AEEC5
          XLIB StatPutDAT2 7ROLL XLIB ~BINT2;NTHCOMPROM@ 7UNROLL ; * AEEF4

* ROMPTR 0B4 17C
* refs (1): A2437
* 6 flags -> results: leaves each value that was asked for, tagged
StatSingleCalc:
        ::                                       * AEF19
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM } * AEF1E
          BIND 6GETLAM IT                        * AEF50
          :: 8GETLAM 7GETLAM XLIB StatFldMean # BB08 msg>TAG ; * AEF5F  "Mean"
          5GETLAM IT                             * AEF8D
          :: 8GETLAM 7GETLAM XLIB StatFldSDev # BB09 msg>TAG ; * AEF97  "Std Dev"
          4GETLAM IT                             * AEFC5
          :: 8GETLAM 7GETLAM XLIB StatFldVar # BB0A msg>TAG ; * AEFCF  "Variance"
          3GETLAM IT                             * AEFFD
          :: 8GETLAM 7GETLAM XLIB StatFldTotal # BB0B msg>TAG ; * AF007  "Total"
          2GETLAM IT                             * AF035
          :: 8GETLAM 7GETLAM XLIB StatFldMax # BB0C msg>TAG ; * AF03F  "Maximum"
          1GETLAM IT                             * AF06D
          :: 8GETLAM 7GETLAM XLIB StatFldMin # BB0D msg>TAG ; * AF077  "Minimum"
          ABND ;                                 * AF0A5

* ROMPTR 0B4 17D
* refs (1): A2437
* -> : "Frequencies": ΣDAT, column, first bin, bin count and width; ends by running BINS
StatFreqForm:
        :: XLIB StatLblDat XLIB StatLblCol # BB1A BINT1 BINT19 # BB1B BINT1 * AF0AF  "X-Min:"  "Bin Count:"
          BINT28 # BB1C BINT64 BINT28 XLIB StatFldDat XLIB StatFldCol * AF0ED  "Bin Width:"
          'DROPFALSE BINT40 BINT17 BINT49 BINT9 BINT1 * AF11C
          { BINT0 } BINT4 # BB1D MINUSONE MINUSONE % -6.5E0 DUP 'DROPFALSE * AF13A  "Enter minimum first bin X value"
          BINT40 BINT26 BINT13 BINT9 BINT1       * AF181
          { BINT0 } BINT4 # BB1E MINUSONE MINUSONE %13 DUP 'DROPFALSE # 67 * AF19A  "Enter number of bins"
          BINT26 BINT25 BINT9 BINT1              * AF1DB
          { BINT0 } BINT4 # BB1F MINUSONE MINUSONE %1 DUP BINT5 DUP * AF1EF  "Enter bin width"
          'DROPFALSE # BB19 DoInputForm NOT?SEMI * AF22B  "Frequencies"
          XLIB StatFreqArgs XLIB StatBins ;      * AF244

* ROMPTR 0B4 17E
* refs (1): A2437
* field values -> ...: stores the column and ΣDAT
StatFreqArgs:
        :: 5ROLL XLIB StatPutDAT2 4PICK XLIB StatGetCols SWAPDROP * AF25F
          XLIB ~STATCOL ;                        * AF289

* ROMPTR 0B4 17F
* refs (1): A2437
* -> : "Fit Data": ΣDAT, X and Y columns and model; ends with correlation and covariance tagged on the stack
StatFitForm:
        :: XLIB StatLblDat                       * AF299

* ROMPTR 0B4 180
* refs (1): A2437
* Label "X-Col:"
StatLblXCol:
          :: # BB21 BINT1 BINT19 ;               * AF2A9  "X-Col:"

* ROMPTR 0B4 181
* refs (1): A2437
* Label "Y-Col:"
StatLblYCol:
          :: # BB22 BINT49 BINT19 ;              * AF2C7  "Y-Col:"

* ROMPTR 0B4 182
* refs (1): A2437
* Label "Model:"
StatLblModel:
          :: # BB23 BINT1 BINT28 ;               * AF2E5  "Model:"

* ROMPTR 0B4 183
* refs (1): A2437
* Field: the statistics data, for the two-column forms
StatFldDat2:
          :: 'RROMPTR@ XLIB IFArrayMH BINT28 BINT8 # 67 BINT9 BINT21 * AF303
            { BINT3 } BINT4 # BB0E # BE1A MINUSONE MINUSONE XLIB StatGetDAT2 ; * AF336  "Enter statistical data"  "Arrays in"

* ROMPTR 0B4 184
* refs (1): A2437
* Fields: the X and the Y column
StatFldXYCol:
          :: 'DROPFALSE BINT28 BINT17 BINT13 BINT9 BINT1 * AF378
            { BINT0 } BINT4 # BB24 MINUSONE MINUSONE %1 XLIB StatGetCols * AF39B  "Enter indep column number"
            'DROPFALSE # 49 BINT17 BINT13 BINT9 BINT1 * AF3D3
            { BINT0 } BINT4 # BB25 MINUSONE MINUSONE %2 BINT13 ROLL ; * AF3F6  "Enter dependent column number"

* ROMPTR 0B4 185
* refs (1): A2437
* Field: the statistical model
StatFldModel:
          :: 'DROPFALSE BINT28 BINT26 BINT91 BINT9 BINT12 MINUSONE BINT17 * AF432
            # BB26 XLIB StatFitItems BINT17 XLIB StatItemLin XLIB StatGetFit ; * AF45F  "Choose statistical model"
          BINT4 DUP 'RROMPTR@ XLIB StatFitMH # BB20 DoInputForm NOT?SEMI * AF494  "Fit Data"
          XLIB StatFitArgs XLIB StatFitResults SWAP # BB27 msg>TAG SWAP * AF4C2  "Correlation"
          # BB28 msg>TAG ;                       * AF4F1  "Covariance"

* ROMPTR 0B4 186
* refs (1): A2437
* field values -> : stores the columns, ΣDAT and the model
StatFitArgs:
        :: 4UNROLL XLIB ~STATCOL XLIB StatPutDAT2 XLIB NTHEval2 0LASTOWDOB! ; * AF505

* ROMPTR 0B4 187
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
StatFitMH:
        :: BINT16 #<>case FALSE                  * AF53A
          XLIB StatFitMenu TrueTrue ;            * AF54E

* ROMPTR 0B4 188
* refs (1): A2437
* Menu keys: PRED, CANCL and OK
StatFitMenu:
        {                                        * AF563
          {                                      * AF568
            :: PTR DirLabel: $ "PRED" ; XLIB StatPredKey } * AF56D
          { $ "(AN(L" XLIB DoKeyCancel }         * AF59E
          { $ "OK" XLIB DoKeyOK } }              * AF5C7

* ROMPTR 0B4 189
* refs (1): A2437
* -> : PRED key: stores the fields, runs StatPredForm, and reads the fields back
StatPredKey:
        :: TakeOver XLIB GetFieldVals XLIB StatFitArgs XLIB StatPredForm * AF5EF
          XLIB StatFitVals XLIB SetFieldVals ;   * AF61A

* ROMPTR 0B4 18A
* refs (1): A2437
* -> field values: ΣDAT, columns and model
StatFitVals:
        :: XLIB StatGetDAT2 XLIB StatGetCols XLIB StatGetFit ; * AF635

* ROMPTR 0B4 18B
* refs (1): A2437
* -> : "Predict Values"
StatPredForm:
        :: XLIB StatLblDat XLIB StatLblXCol XLIB StatLblYCol * AF660
          XLIB StatLblModel # BF32 BINT1 BINT37 # BB2A BINT67 BINT37 * AF686  "X:"  "Y:"
          XLIB StatFldDat2 XLIB StatFldXYCol XLIB StatFldModel 'DROPFALSE * AF6B9
          BINT10 BINT35 BINT49 BINT9 BINT1       * AF6DF
          { BINT0 } BINT4 # BB2B MINUSONE MINUSONE MINUSONE DUP 'DROPFALSE * AF6F8  "Enter indep value or press PRED"
          # 4C BINT35 BINT49 BINT9 BINT1         * AF72F
          { BINT0 } BINT4 # BB2C MINUSONE MINUSONE MINUSONE DUP BINT6 DUP * AF74D  "Enter dep value or press PRED"
          'RROMPTR@ XLIB StatPredMH # BB29 DoInputForm NOT?SEMI * AF789  "Predict Values"
          2DROP XLIB StatFitArgs ;               * AF7AD

* ROMPTR 0B4 18C
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
StatPredMH:
        :: BINT16 #<>case FALSE                  * AF7C2
          XLIB StatPredMenu TrueTrue ;           * AF7D6

* ROMPTR 0B4 18D
* refs (1): A2437
* Menu keys: PRED
StatPredMenu:
        { NullMenuKey NullMenuKey                * AF7EB
          { $ "PRED" XLIB StatPredCalc } }       * AF7FA

* ROMPTR 0B4 18E
* refs (1): A2437
* -> : PRED key: fits the model and on X or Y computes the field from the other
StatPredCalc:
        :: TakeOver 5GETLAM BINT5 #< caseDoBadKey XLIB GetFieldVals * AF826
          2DROP XLIB StatFitArgs STATLR 2DROP 5GETLAM * AF84F
          { BINT5                                * AF86E
            :: BINT6 XLIB ~gFldVal XLIB ~STATPREDX BINT5 XLIB ~sFldVal BINT5 * AF878
              XLIB IFMarkPending ;               * AF8AD
            BINT6                                * AF8BD
            :: BINT5 XLIB ~gFldVal XLIB ~STATPREDY BINT6 XLIB ~sFldVal BINT6 * AF8C2
              XLIB IFMarkPending ;               * AF8F7
          }                                      * AF907
          EQLookup DROP EVAL SetDA123NoCh ;      * AF90C

* ROMPTR 0B4 18F
* refs (1): A2437
* -> : "Summary Statistics": ΣDAT, columns, and checks for the sums to compute
StatSumForm:
        :: XLIB StatLblDat XLIB StatLblXCol XLIB StatLblYCol # BB2E BINT1 * AF925  "Calculate:"
          BINT28 # BB2F BINT11 BINT37 # BB30 BINT29 BINT37 # BB31 BINT50 * AF95A  "ΣX"  "ΣY"  "ΣX2"
          BINT37 # BB32 # 47 BINT37 # BB33 # 5F BINT37 # BB34 # 77 BINT37 * AF996  "ΣY2"  "ΣXY"  "NΣ"
          XLIB StatFldDat2 XLIB StatFldXYCol 'DROPFALSE BINT4 BINT35 BINT6 * AF9E6
          BINT9 BINT32 MINUSONE MINUSONE # BB35 MINUSONE MINUSONE FALSE DUP * AFA10  "Calculate sum of X column?"
          'DROPFALSE BINT22 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AFA42
          # BB36 MINUSONE MINUSONE FALSE DUP 'DROPFALSE BINT43 BINT35 BINT6 * AFA6A  "Calculate sum of Y column?"
          BINT9 BINT32 MINUSONE MINUSONE # BB37 MINUSONE MINUSONE FALSE DUP * AFA9C  "Calculate sum of squares of X?"
          'DROPFALSE BINT64 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AFACE
          # BB38 MINUSONE MINUSONE FALSE DUP 'DROPFALSE # 58 BINT35 BINT6 * AFAF6  "Calculate sum of squares of Y?"
          BINT9 BINT32 MINUSONE MINUSONE # BB39 MINUSONE MINUSONE FALSE DUP * AFB2D  "Calculate sum of products?"
          'DROPFALSE BINT112 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AFB5F
          # BB3A MINUSONE MINUSONE FALSE DUP BINT10 BINT9 'DROPFALSE # BB2D * AFB87  "Calculate number of data points?"  "Summary Statistics"
          DoInputForm NOT?SEMI                   * AFBBE
          XLIB StatSumArgs XLIB StatSumCalc ;    * AFBC8

* ROMPTR 0B4 190
* refs (1): A2437
* field values -> 6 flags: stores the columns and ΣDAT
StatSumArgs:
        :: 8ROLL 8ROLL XLIB ~STATCOL 7ROLL XLIB StatPutDAT2 ; * AFBE3

* ROMPTR 0B4 191
* refs (1): A2437
* 6 flags -> results: leaves each sum that was asked for, tagged
StatSumCalc:
        ::                                       * AFC12
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM } BIND 6GETLAM * AFC17
          IT                                     * AFC49
          :: XLIB ~STATX # BB2F msg>TAG ;        * AFC4E  "ΣX"
          5GETLAM IT                             * AFC72
          :: XLIB ~STATY # BB30 msg>TAG ;        * AFC7C  "ΣY"
          4GETLAM IT                             * AFCA0
          :: XLIB ~STATXX # BB31 msg>TAG ;       * AFCAA  "ΣX2"
          3GETLAM IT                             * AFCCE
          :: XLIB ~STATYY # BB32 msg>TAG ;       * AFCD8  "ΣY2"
          2GETLAM IT                             * AFCFC
          :: XLIB ~STATXY # BB33 msg>TAG ;       * AFD06  "ΣXY"
          1GETLAM IT                             * AFD2A
          :: XLIB ~STATN # BB34 msg>TAG ;        * AFD34  "NΣ"
          ABND ;                                 * AFD58

* ROMPTR 0B4 192
* refs (1): A2437
* -> : the I/O key: the choose box of input and output applications
IOApp:
        :: XLIB IFNotInForm                      * AFD62
          {                                      * AFD72
            { # BA01 XLIB IOSendForm }           * AFD77  "Send to HP 48 "
            { # BA02 XLIB XferGetHP48 }          * AFD96  "Get from HP 48"
            { # BA03 DOPRLCD }                   * AFDB5  "Print display"
            { # BA04 XLIB IOPrintForm }          * AFDCE  "Print "
            { # BA05 XLIB IOXferForm }           * AFDED  "Transfer "
            { # BA06 DOSERVER } }                * AFE0C  "Start Server"
          XLIB IFTypeChoose ;                    * AFE2A

* ROMPTR 0B4 193
* refs (1): A2437
* -> : "Send to HP 48": the variables to send
IOSendForm:
        :: # B989 BINT1 BINT19 'DROPFALSE BINT25 BINT17 # 67 BINT9 BINT21 * AFE3A  "Name:"
          { BINT6 BINT5 } BINT4 # BA07           * AFE76  "Enter names of vars to send"
          { # BA08 TRUE MINUSONE FALSE } MINUSONE MINUSONE MINUSONE ONEONE * AFE99  "Vars in"
          'RROMPTR@ XLIB IOSendMH # BA09 DoInputForm caseDROP ; * AFED0  "Send to HP 48"

* ROMPTR 0B4 194
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
IOSendMH:
        :: BINT16 #<>case FALSE                  * AFEF9
          XLIB IOSendMenu TrueTrue ;             * AFF0D

* ROMPTR 0B4 195
* refs (1): A2437
* Menu keys: SEND
IOSendMenu:
        { NullMenuKey NullMenuKey                * AFF22
          { $ "SEND" XLIB IOSendKey } }          * AFF31

* ROMPTR 0B4 196
* refs (1): A2437
* -> : SEND key: sends the names in the field by Kermit
IOSendKey:
        :: TakeOver BINT1 XLIB ~gFldVal XLIB XferSendHP48 ; * AFF5D

* ROMPTR 0B4 197
* refs (1): A2437
* -> : "Print": what to print and the printer's settings, where wire settings show only with Port on Wire
IOPrintForm:
        ::                                       * AFF87

* ROMPTR 0B4 198
* refs (1): A2437
* Label "Port:"
IOLblPort:
          :: # BA0A BINT1 BINT10 ; # B984 BINT1 BINT19 # BA0B BINT8 BINT28 * AFF8C  "Port:"  "Object:"  "Dbl-Space"
          # BA0C BINT52 BINT28                   * AFFD2  "Delay:"

* ROMPTR 0B4 199
* refs (1): A2437
* Label "Xlat:"
IOLblXlat:
          :: # BA0D BINT49 BINT28 ; # BA0E # 6E BINT28 * AFFE6  "Xlat:"  "Linef"

* ROMPTR 0B4 19A
* refs (1): A2437
* Label "Baud:"
IOLblBaud:
          :: # BA0F BINT1 BINT37 ;               * B001D  "Baud:"

* ROMPTR 0B4 19B
* refs (1): A2437
* Label "Parity:"
IOLblParity:
          :: # BA10 BINT49 BINT37 ; # BA11 # 67 BINT37 'RROMPTR@ * B003B  "Parity:"  "Len:"
          XLIB IOPrintPortMH BINT31 BINT8 BINT49 BINT9 BINT12 MINUSONE * B0077
          BINT17 # BA12 XLIB IOPortItems BINT17 XLIB IOItemIR MINUSONE * B00A0  "Choose print port"
          'DROPFALSE BINT31 BINT17 BINT97 BINT9 BINT21 MINUSONE BINT4 # BA13 * B00CF  "Enter object(s) to print"
          { # B986 TRUE } MINUSONE MINUSONE MINUSONE 'DROPFALSE BINT1 BINT26 * B0101  "Obs in"
          BINT6 BINT9 BINT32 MINUSONE MINUSONE # BA14 MINUSONE MINUSONE * B0138  "Print extra space between lines?"
          FALSE MINUSONE 'RROMPTR@ XLIB IOPrintIRMH # 4C BINT26 BINT19 BINT9 * B0165
          BINT1                                  * B0198
          { BINT0 } BINT4 # BA15 MINUSONE MINUSONE %1.8 MINUSONE 'RROMPTR@ * B019D  "Enter delay between lines"
          XLIB IOPrintWireMH # 49 BINT26 BINT25 BINT9 BINT12 MINUSONE BINT33 * B01D4
          # BA16 XLIB IOTransItems BINT17 XLIB IOTransNewl MINUSONE * B0207  "Choose character translations"
          'DROPFALSE # 67 BINT26 BINT6 BINT9 BINT32 MINUSONE MINUSONE # BA17 * B0231  "Print linefeed between lines?"
          MINUSONE MINUSONE TRUE MINUSONE        * B0268

* ROMPTR 0B4 19C
* refs (1): A2437
* Field: baud rate
IOFldBaud:
          :: 'RROMPTR@ XLIB IOPrintWireMH BINT19 BINT35 BINT25 BINT9 BINT12 * B027C
            MINUSONE BINT4 # BA18 XLIB IOBaudItems BINT4 %9600 MINUSONE ; * B02AA  "Choose baud rate"
          'RROMPTR@ XLIB IOPrintWireMH # 49 BINT35 BINT25 BINT9 BINT12 * B02DD
          MINUSONE BINT33 # BA19 XLIB IOParityItems BINT17 XLIB IOItemNone * B030B  "Choose parity"
          MINUSONE 'RROMPTR@ XLIB IOPrintWireMH # 76 BINT35 BINT13 BINT9 * B033A
          BINT1                                  * B0368
          { BINT0 } BINT4 # BA1A MINUSONE MINUSONE %80 MINUSONE BINT9 DUP * B036D  "Enter printer line length"
          'RROMPTR@ XLIB IOPrintMH # BA1B XLIB IOPrintVals BINT9 * B03A9  "Print"
          XLIB IFSetHelps DoInputForm NOT?SEMI   * B03D3
          XLIB IOPrintStore ;                    * B03E8

* ROMPTR 0B4 19D
* refs (1): A2437
* -> field values: from the flags and I/O settings
IOPrintVals:
        :: XLIB PrtGetPort MINUSONE BINT37 TestSysFlag XLIB PrtGetDelayWidth * B03F8  flag -37: Single-space prnt / Double-space prnt
          XLIB IOGetFields XLIB PrtLinefeed? 4ROLLDROP 3UNROLL 5ROLL ; * B0422

* ROMPTR 0B4 19E
* refs (1): A2437
* field values -> : stores the settings
IOPrintStore:
        :: XLIB PrtPutWidth ROT XLIB PrtLinefeed! MINUSONE 3UNROLL * B044C
          XLIB IOPutFields XLIB PrtPutDelay BINT37 XLIB FlagPut DROP * B0476
          XLIB PrtPutPort ;                      * B04A1

* ROMPTR 0B4 19F
* refs (1): A2437
* #msg -> ... flag: form message handler: 14 first field is 2, 16 the menu, 5 the labels
IOPrintMH:
        ::                                       * B04B1
          { BINT14 BINT2 BINT16                  * B04B6
            :: XLIB IOPrintMenu TRUE ; BINT5 XLIB IOPrintLabels } * B04CA
          EQLookup case                          * B04F9
          :: EVAL TRUE ;                         * B0503
          DROPFALSE ;                            * B0517

* ROMPTR 0B4 1A0
* refs (1): A2437
* Menu keys: PRINT
IOPrintMenu:
        { NullMenuKey NullMenuKey                * B0521
          { $ "PRINT" XLIB IOPrintKey } }        * B0530

* ROMPTR 0B4 1A1
* refs (1): A2437
* -> : PRINT key: stores the settings and prints the Object field
IOPrintKey:
        :: TakeOver XLIB GetFieldVals XLIB IOPrintStore BINT2 XLIB ~gFldVal * B055E
          XLIB PrtObj ;                          * B058E

* ROMPTR 0B4 1A2
* refs (1): A2437
* -> grob FALSE: message 5: draws the labels for the current port
IOPrintLabels:
        :: BINT39 BINT131 MAKEGROB BINT4 ONE_DO INDEX@ XLIB IFDispLabel LOOP * B059E
          XLIB IOPortIR? ITE                     * B05D1
          :: BINT4 XLIB IFDispLabel BINT6 XLIB IFDispLabel ; * B05E1
          :: BINT10 BINT5 DO INDEX@ XLIB IFDispLabel LOOP ; * B060B
          FALSE ;                                * B0639

* ROMPTR 0B4 1A3
* refs (1): A2437
* #msg -> ... flag: Port field: 47 changes the lower rows of the form
IOPrintPortMH:
        :: BINT47 #<>case FALSE                  * B0643
          XLIB IOPrintPortDisp TRUE ;            * B0657

* ROMPTR 0B4 1A4
* refs (1): A2437
* -> : after a port change: blanks and redraws the rows that depend on the port
IOPrintPortDisp:
        :: BINT26 BINT18 BLANKIT HARDBUFF BINT3 XLIB IFDispLabel BINT3 * B066C
          XLIB IFMarkPending XLIB IOPortIR? ITE  * B069A
          :: BINT4 XLIB IFDispLabel BINT4 XLIB IFMarkPending BINT6 * B06B5
            XLIB IFDispLabel BINT6 XLIB IFMarkPending ; * B06DF
          :: BINT10 BINT5 DO INDEX@ XLIB IFDispLabel INDEX@ * B06FF
            XLIB IFMarkPending LOOP ;            * B0728
          DROP ;                                 * B073D

* ROMPTR 0B4 1A5
* refs (1): A2437
* #msg -> ... flag: a field used with infrared only (Delay)
IOPrintIRMH:
        :: BINT7 #=casedrop                      * B0747
          :: XLIB IOPortIR? NOT ;                * B0756
          BINT55 #<>case FALSE                   * B0770
          XLIB IOPortIR? TRUE ;                  * B077F

* ROMPTR 0B4 1A6
* refs (1): A2437
* #msg -> ... flag: a field used with the wire only
IOPrintWireMH:
        :: BINT7 #=casedrop XLIB IOPortIR?       * B0794
          BINT55 #<>case FALSE                   * B07AE
          XLIB IOPortIR? NOT TRUE ;              * B07BD

* ROMPTR 0B4 1A7
* refs (1): A2437
* -> flag: is field 1 on Infrared?
IOPortIR?:
        :: BINT1 XLIB ~gFldVal XLIB ~BINT3;NTHCOMPROM@ ; * B07D7

* ROMPTR 0B4 1A8
* refs (1): A2437
* -> : "Transfer": port, type, names and format, for Kermit and XModem
IOXferForm:
        :: XLIB IOLblPort # BA1C BINT70 BINT10 # B989 BINT1 BINT19 # BA1D * B07FC  "Type:"  "Name:"  "OvrW"
          # 6E BINT37 # BA1E BINT1 BINT28 XLIB IOLblXlat # BA1F # 67 BINT28 * B083E  "Fmt:"  "Chk:"
          XLIB IOLblBaud XLIB IOLblParity 'RROMPTR@ XLIB IOXferPortMH BINT25 * B0885
          BINT8 BINT25 BINT9 BINT12 MINUSONE BINT33 # BA20 XLIB IOPortItems * B08B0  "Choose transfer port"
          BINT17 XLIB IOItemWire MINUSONE 'RROMPTR@ XLIB IOXferTypeMH BINT91 * B08E3
          BINT8 BINT37 BINT9 BINT12 MINUSONE BINT17 # BA21 * B090D  "Choose type of transfer"
          XLIB XferProtoItems BINT17 XLIB XferItemKermit MINUSONE 'RROMPTR@ * B0935
          XLIB IOXferNameMH BINT25 BINT17 # 67 BINT9 BINT21 * B095A
          { BINT6 BINT5 } BINT4 # BA22           * B0983  "Enter names of vars to transfer"
          { # BA08 TRUE MINUSONE FALSE } MINUSONE MINUSONE MINUSONE * B09A6  "Vars in"
          'RROMPTR@ XLIB IOXferKermitMH BINT19 BINT26 BINT19 BINT9 BINT12 * B09D8
          MINUSONE BINT33 # BA23 XLIB XferFmtItems BINT17 XLIB XferItemASCII * B0A01  "Choose transfer format"
          MINUSONE 'RROMPTR@ XLIB IOXferKermitMH # 49 BINT26 BINT25 BINT9 * B0A30
          BINT12 MINUSONE BINT33 # BA16 XLIB IOTransItems BINT17 * B0A5E  "Choose character translations"
          XLIB IOTransNewl MINUSONE 'RROMPTR@ XLIB IOXferKermitMH # 79 * B0A87
          BINT26 BINT7 BINT9 BINT12 MINUSONE BINT36 # BA24 XLIB IOCksumItems * B0AB1  "Choose checksum type"
          BINT17 XLIB IOCksum3 MINUSONE XLIB IOFldBaud 'RROMPTR@ * B0AE4
          XLIB IOXferParityMH # 49 BINT35 BINT25 BINT9 BINT12 MINUSONE * B0B09
          BINT33 # BA19 XLIB IOParityItems BINT17 XLIB IOItemNone MINUSONE * B0B37  "Choose parity"
          'DROPFALSE # 67 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE # BA25 * B0B66  "Overwrite existing variables?"
          MINUSONE MINUSONE FALSE MINUSONE BINT9 DUP 'RROMPTR@ XLIB IOXferMH * B0B9D
          # BA26 XLIB IOXferVals BINT9 XLIB IFSetHelps DoInputForm NOT?SEMI * B0BCB  "Transfer"
          XLIB IOXferStore ;                     * B0BFA

* ROMPTR 0B4 1A9
* refs (1): A2437
* -> field values: from the flags and I/O settings
IOXferVals:
        :: XLIB XferGetPort XLIB XferItemKermit MINUSONE XLIB XferGetFormat * B0C0A
          XLIB IOGetFields XLIB XferOverwrite? ; * B0C35

* ROMPTR 0B4 1AA
* refs (1): A2437
* field values -> : stores the settings
IOXferStore:
        :: XLIB XferOverwrite! XLIB IOPutFields XLIB XferPutFormat 2DROP * B0C50
          XLIB XferPutPort ;                     * B0C7B

* ROMPTR 0B4 1AB
* refs (1): A2437
* #msg -> ... flag: form message handler: 14 first field is 3, 16 the menu, 5 the labels
IOXferMH:
        ::                                       * B0C8B
          { BINT14 BINT3 BINT16                  * B0C90
            :: XLIB IOXferMenu TRUE ; BINT5 XLIB IOXferLabels } * B0CA4
          EQLookup case                          * B0CD3
          :: EVAL TRUE ;                         * B0CDD
          DROPFALSE ;                            * B0CF1

* ROMPTR 0B4 1AC
* refs (1): A2437
* Menu keys: RECV (Kermit), KGET or XRECV, SEND or XSEN
IOXferMenu:
        {                                        * B0CFB
          {                                      * B0D00
            :: TakeOver XLIB IOXferKermit? ITE $ "RECV" NULL$ * B0D05
            ;                                    * B0D36
            XLIB IOXferRecvKey }                 * B0D3B
          {                                      * B0D4B
            :: TakeOver XLIB IOXferKermit? ITE $ "KGET" $ "XRECV" * B0D50
            ;                                    * B0D90
            XLIB IOXferGetKey }                  * B0D95
          {                                      * B0DA5
            :: TakeOver XLIB IOXferKermit? ITE $ "SEND" $ "XSEN" * B0DAA
            ;                                    * B0DE8
            XLIB IOXferSendKey }                 * B0DED
        }                                        * B0DFD

* ROMPTR 0B4 1AD
* refs (1): A2437
* -> : RECV key: Kermit receive
IOXferRecvKey:
        :: TakeOver XLIB IOXferKermit? NOTcase DoBadKey * B0E02
          XLIB GetFieldVals XLIB IOXferStore XLIB XferRecv ; * B0E21

* ROMPTR 0B4 1AE
* refs (1): A2437
* -> : KGET or XRECV key: asks the other side for the named object(s)
IOXferGetKey:
        :: TakeOver XLIB GetFieldVals XLIB IOXferStore BINT3 XLIB ~gFldVal * B0E47
          XLIB IOXferKermit? ITE XLIB XferGet    * B0E77
          :: TRUE XLIB XferXModem ;              * B0E92
        ;                                        * B0EAC

* ROMPTR 0B4 1AF
* refs (1): A2437
* -> : SEND or XSEN key: sends the named object(s)
IOXferSendKey:
        :: TakeOver XLIB GetFieldVals XLIB IOXferStore BINT3 XLIB ~gFldVal * B0EB1
          XLIB IOXferKermit? ITE XLIB XferSend   * B0EE1
          :: FALSE XLIB XferXModem ;             * B0EFC
        ;                                        * B0F16

* ROMPTR 0B4 1B0
* refs (1): A2437
* -> grob FALSE: message 5: draws the labels for the current port and protocol
IOXferLabels:
        :: BINT39 BINT131 MAKEGROB BINT5 ONE_DO INDEX@ XLIB IFDispLabel LOOP * B0F1B
          XLIB IOXferKermit? case                * B0F4E
          :: BINT8 BINT5 DO INDEX@ XLIB IFDispLabel LOOP XLIB IOPortIR? * B0F5E
            caseFALSE BINT10                     * B0F92
            BINT8 DO INDEX@ XLIB IFDispLabel LOOP FALSE ; * B0F9C
          XLIB IOPortIR? caseFALSE BINT8         * B0FC5
          XLIB IFDispLabel FALSE ;               * B0FDA

* ROMPTR 0B4 1B1
* refs (1): A2437
* #msg -> ... flag: Port field: 47 changes the lower rows
IOXferPortMH:
        :: BINT47 #<>case FALSE                  * B0FEF
          XLIB IOXferDisp TRUE ;                 * B1003

* ROMPTR 0B4 1B2
* refs (1): A2437
* #msg -> ... flag: Type field: 47 changes the lower rows and the menu
IOXferTypeMH:
        :: BINT47 #<>case FALSE                  * B1018
          XLIB IOXferDisp SetDA3Bad TRUE ;       * B102C

* ROMPTR 0B4 1B3
* refs (1): A2437
* -> : after a port or type change: blanks and redraws the rows that depend on them
IOXferDisp:
        :: BINT26 BINT18 BLANKIT HARDBUFF BINT4 XLIB IFDispLabel BINT9 * B1046
          XLIB IFMarkPending XLIB IOXferKermit? case * B1074
          :: BINT8 BINT5 DO INDEX@ XLIB IFDispLabel INDEX@ #1- * B108F
            XLIB IFMarkPending LOOP XLIB IOPortIR? caseDROP BINT10 * B10BD
            BINT8 DO INDEX@ XLIB IFDispLabel INDEX@ #1- XLIB IFMarkPending * B10E2
            LOOP DROP ;                          * B1111
          XLIB IOPortIR? caseDROP BINT8          * B1120
          XLIB IFDispLabel BINT7 XLIB IFMarkPending DROP ; * B1135

* ROMPTR 0B4 1B4
* refs (1): A2437
* #msg -> ... flag: Name field: 37 (CHOOS) with Kermit first asks where to choose from
IOXferNameMH:
        :: BINT37 #<>case FALSE                  * B115A
          XLIB IOXferKermit? NOTcaseFALSE XLIB IOXferChoose * B116E
          TRUE ;                                 * B1189

* ROMPTR 0B4 1B5
* refs (1): A2437
* -> flag: choose box of "Local vars" or "Remote PC files"
IOXferChoose:
        :: NULL$                                 * B1193
          {                                      * B119D
            { # BA27 XLIB IOXferLocal }          * B11A2  "Local vars"
            { # BA28 XLIB IOXferRemote } }       * B11C1  "Remote PC files"
          XLIB ~ChooseSimple SetDA123NoCh NOTcaseFALSE EVAL * B11E5
        ;                                        * B11FF

* ROMPTR 0B4 1B6
* refs (1): A2437
* -> flag: chooses from local variables through BrowseMem
IOXferLocal:
        :: 4GETLAM FALSE SWAP XLIB IFFilterArgs XLIB BrowseMem SetDA123NoCh ; * B1204

* ROMPTR 0B4 1B7
* refs (1): A2437
* -> flag: chooses from the remote directory: stores the settings, reads it through Kermit and shows it in a Choose box. LAMs: RD directory, RF files
IOXferRemote:
        :: XLIB GetFieldVals XLIB IOXferStore XLIB SrvDir * B1238
          { LAM 'RD LAM 'RF } BIND 'RROMPTR@ XLIB IOXferRemoteMH SPACE$ * B125E
          BINT1 LAM 'RF XLIB SrvFiles BINT1 XLIB ~Choose ABND SetDA123NoCh ; * B129C

* ROMPTR 0B4 1B8
* refs (1): A2437
* #msg -> ... flag: Choose message handler: title, check marks, menu
IOXferRemoteMH:
        ::                                       * B12D8
          { BINT70 XLIB IOXferRemoteTitle BINT61 TRUE BINT83 * B12DD
            :: ' XLIB IOXferRemoteMenu ; }       * B1301
          EQLookup case                          * B1320
          :: EVAL TRUE ;                         * B132A
          DROPFALSE ;                            * B133E

* ROMPTR 0B4 1B9
* refs (1): A2437
* -> $: title "Files in " with the directory, shortened to fit
IOXferRemoteTitle:
        :: # BA29 JstGetTHEMESG LAM 'RD 8GETLAM XLIB BBAddArrows 3PICK * B1348  "Files in "
          XLIB ~$>grob;GROBDIMw #- XLIB $FitRight DROP &$ ; * B137E

* ROMPTR 0B4 1BA
* refs (1): A2437
* -> menu: CHOOS, check, CANCL and OK
IOXferRemoteMenu:
        :: NoExitAction                          * B13A8
          { NullMenuKey                          * B13B2
            {                                    * B13BC
              :: PTR DirLabel: $ "CHOOS" ; XLIB IOXferRemoteCD } * B13C1
            {                                    * B13F4
              :: TakeOver XLIB ~BBEmpty? ITE NULL$ XLIB ~grobCheckKey * B13F9
              ;                                  * B1423
              XLIB DoCKeyCheck }                 * B1428
            NullMenuKey                          * B1438
            { $ "(AN(L" XLIB DoCKeyCancel }      * B143D
            { $ "OK" XLIB DoCKeyOK } }           * B1466
        ;                                        * B148E

* ROMPTR 0B4 1BB
* refs (1): A2437
* -> : CHOOS key: "Choose Remote Directory", then reads the new directory
IOXferRemoteCD:
        :: TakeOver # B989 BINT1 BINT19 'RROMPTR@ XLIB IOXferCDMH BINT25 * B1493  "Name:"
          BINT17 # 67 BINT9 BINT5                * B14C6
          { BINT2 } BINT4 # BA2A MINUSONE BINT1 MINUSONE LAM 'RD ONEONE * B14DF  "Enter name of dir to change to"
          'DROPFALSE # BA2B HARDBUFF TOTEMPOB 1LAMBIND DoInputForm 1GETABND * B151E  "Choose Remote Directory"
          HARDBUFF ZEROZERO GROB! NOT?SEMI       * B1546
          XLIB SrvCd XLIB SrvDir SWAP ' LAM 'RD STOLAM DUP ' LAM 'RF STOLAM * B155A
          XLIB SrvFiles 19PUTLAM XLIB ~BBReReadNElems XLIB ~BBReReadWidth * B15A8
          BINT1 12GETLAM #MIN 18PUTLAM FALSE XLIB ~BBRecalOff&Disp NULL{} * B15CE
          15PUTLAM IFRedrawAll ;                 * B15F7
