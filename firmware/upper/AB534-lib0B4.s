* HP 48GX ROM revision R, #AB534-#AE565: Library 0B4: end of the 3D plot options, the Symbolic applications, and setting alarms and the time and date
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Time2Chars TimeMinMH Time2Digits TimeYearMH TimeSetMH TimeSetLabels TimeSetForm TimeSetFields TimeNextMonth TimeNextDay TimeMonthMH TimeMonthMDMH
* Follows on from the previous file (at #AB534 in the original ROM).
        RPL

* ROMPTR 0B4 108
* refs (1): A2437
* field values -> : stores them, keeping the animation check in LAM PE3
PlotOptSliceStore:
        :: ' LAM 'PE3 STOLAM XLIB VparZvol! XLIB VparYvol! XLIB VparXvol! ; * AB534

* ROMPTR 0B4 109
* refs (1): A2437
* -> form arguments: "Plot Options" for GRIDMAP, with the XX and YY ranges
PlotOptGridForm:
        :: XLIB PlotOptLblXLeft XLIB PlotOptLblXRight XLIB PlotOptLblYNear * AB578
          XLIB PlotOptLblYFar # BE56 BINT1 BINT28 # BE57 BINT67 BINT28 * AB59E  "XX-Left:"  "XX-Rght:"
          # BE58 BINT1 BINT37 # BE59 BINT67 BINT37 XLIB PlotOptFldXLeft * AB5D1  "YY-Near:"  "YY-Far:"
          XLIB PlotOptFldXRight XLIB PlotOptFldYNear XLIB PlotOptFldYFar * AB604
          'RROMPTR@ XLIB PlotOptFieldMH BINT31 BINT26 BINT31 BINT9 BINT1 * AB625
          { BINT0 } BINT4 # BE5A MINUSONE MINUSONE %-1 MINUSONE 'RROMPTR@ * AB64E  "Enter minimum XX range value"
          XLIB PlotOptFieldMH BINT97 BINT26 BINT31 BINT9 BINT1 * AB685
          { BINT0 } BINT4 # BE5B MINUSONE MINUSONE %1 MINUSONE 'RROMPTR@ * AB6A9  "Enter maximum XX range value"
          XLIB PlotOptFieldMH BINT31 BINT35 BINT31 BINT9 BINT1 * AB6E0
          { BINT0 } BINT4 # BE5C MINUSONE MINUSONE %-1 MINUSONE 'RROMPTR@ * AB704  "Enter minimum YY range value"
          XLIB PlotOptFieldMH BINT97 BINT35 BINT31 BINT9 BINT1 * AB73B
          { BINT0 } BINT4 # BE5D MINUSONE MINUSONE %1 MINUSONE BINT8 DUP * AB75F  "Enter maximum YY range value"
          'DROPFALSE # BE23                      * AB79B  "Plot Options"

* ROMPTR 0B4 10A
* refs (1): A2437
* -> field values
PlotOptGridVals:
          :: XLIB VparXvol@ XLIB VparYvol@ XLIB VparXXrng@ XLIB VparYYrng@ ; * AB7AA
          BINT8 XLIB IFSetHelps ;                * AB7E0

* ROMPTR 0B4 10B
* refs (1): A2437
* field values -> : stores them
PlotOptGridStore:
        :: XLIB VparYYrng! XLIB VparXXrng! XLIB VparYvol! XLIB VparXvol! ; * AB7F5

* ROMPTR 0B4 10C
* refs (1): A2437
* -> form arguments: "Plot Options" for PARSURFACE, with XX,YY on the menu
PlotOptPSurfForm:
        :: XLIB PlotOptLblsWire XLIB PlotOptFldsWire BINT9 DUP 'RROMPTR@ * AB82B
          XLIB PlotOptPSurfMH # BE23 XLIB PlotOptWireVals BINT9 * AB855  "Plot Options"
          XLIB IFSetHelps ;                      * AB87A

* ROMPTR 0B4 10D
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
PlotOptPSurfMH:
        :: BINT16 #<>case FALSE                  * AB88A
          XLIB PlotOptPSurfMenu TrueTrue ;       * AB89E

* ROMPTR 0B4 10E
* refs (1): A2437
* Menu keys: XX,YY, CANCL and OK
PlotOptPSurfMenu:
        {                                        * AB8B3
          {                                      * AB8B8
            :: PTR DirLabel: $ "XX,YY" ; XLIB PlotOptXXYYKey } * AB8BD
          { $ "(AN(L" XLIB DoKeyCancel }         * AB8F0
          { $ "OK" XLIB DoKeyOK } }              * AB919

* ROMPTR 0B4 10F
* refs (1): A2437
* -> : XX,YY key: stores the fields and runs PlotOptXXYYForm
PlotOptXXYYKey:
        :: TakeOver XLIB GetFieldVals XLIB PlotOptsStore * AB941
          XLIB PlotOptXXYYForm GETPTYPE 1LAMBIND DoInputForm 1GETABND * AB961
          PUTPTYPE NOT?SEMI                      * AB980
          XLIB PlotOptXXYYStore XLIB PlotOptsVals XLIB SetFieldVals ; * AB98A

* ROMPTR 0B4 110
* refs (1): A2437
* -> form arguments: "XX and YY Plot Options"
PlotOptXXYYForm:
        :: # BE56 BINT1 BINT19 # BE57 BINT67 BINT19 # BE58 BINT1 BINT28 * AB9B0  "XX-Left:"  "XX-Rght:"  "YY-Near:"
          # BE59 BINT67 BINT28 'DROPFALSE BINT31 BINT17 BINT31 BINT9 BINT1 * AB9F1  "YY-Far:"
          { BINT0 } BINT4 # BE5A MINUSONE MINUSONE %-1 MINUSONE 'DROPFALSE * ABA23  "Enter minimum XX range value"
          BINT97 BINT17 BINT31 BINT9 BINT1       * ABA5A
          { BINT0 } BINT4 # BE5B MINUSONE MINUSONE %1 MINUSONE 'DROPFALSE * ABA73  "Enter maximum XX range value"
          BINT31 BINT26 BINT31 BINT9 BINT1       * ABAAA
          { BINT0 } BINT4 # BE5C MINUSONE MINUSONE %-1 MINUSONE 'DROPFALSE * ABAC3  "Enter minimum YY range value"
          BINT97 BINT26 BINT31 BINT9 BINT1       * ABAFA
          { BINT0 } BINT4 # BE5D MINUSONE MINUSONE %1 MINUSONE BINT4 DUP * ABB13  "Enter maximum YY range value"
          'DROPFALSE # BE5E                      * ABB4F  "XX and YY Plot Options"

* ROMPTR 0B4 111
* refs (1): A2437
* -> field values
PlotOptXXYYVals:
          :: XLIB VparXXrng@ XLIB VparYYrng@ ; BINT4 XLIB IFSetHelps ; * ABB5E

* ROMPTR 0B4 112
* refs (1): A2437
* field values -> : stores them
PlotOptXXYYStore:
        :: XLIB VparYYrng! XLIB VparXXrng! ;     * ABB93

* ROMPTR 0B4 113
* refs (1): A2437
* -> : the SYMBOLIC key: the choose box of symbolic applications
SymbApp:
        :: XLIB IFNotInForm                      * ABBB3
          {                                      * ABBC3
            { # BD01 XLIB SymbIntegForm }        * ABBC8  "Integrate "
            { # BD02 XLIB SymbDiffForm }         * ABBE7  "Differentiate "
            { # BD03 XLIB SymbTaylorForm }       * ABC06  "Taylor poly "
            { # BD04 XLIB SymbIsolateForm }      * ABC25  "Isolate var "
            { # BD05 XLIB SymbQuadForm }         * ABC44  "Solve quad "
            { # BD06 XLIB SymbManipForm } }      * ABC63  "Manip expr "
          XLIB IFTypeChoose ;                    * ABC87

* ROMPTR 0B4 114
* refs (1): A2437
* -> : "Integrate". Fields: 1 Expr, 2 Var, 3 Lo, 4 Hi, 5 Result, 6 Number Format, 7 digits. Ends by computing the integral with the chosen settings
SymbIntegForm:
        ::                                       * ABC97

* ROMPTR 0B4 115
* refs (1): A2437
* Label "Expr:"
SymbLblExpr:
          :: # BD08 BINT1 BINT10 ;               * ABC9C  "Expr:"

* ROMPTR 0B4 116
* refs (1): A2437
* Label "Var:", with "Lo:" and "Hi:" after it in the Integrate form
SymbLblVar:
          :: # BD09 BINT1 BINT19 ; # BE24 BINT52 BINT19 # BE25 # 5E BINT19 * ABCBA  "Var:"  "Lo:"  "Hi:"

* ROMPTR 0B4 117
* refs (1): A2437
* Label "Result:", then "Number Format:"
SymbLblResult:
          :: # BD0A BINT1 BINT28 ; # B917 BINT1 BINT37 * ABD05  "Result:"  "Number Format:"

* ROMPTR 0B4 118
* refs (1): A2437
* Field: the expression, initially EXPR
SymbFldExpr:
          :: 'DROPFALSE BINT22 BINT8 BINT97 BINT9 BINT23 * ABD37
            { BINT9 BINT6 } BINT4 # BD0B # BF0A MINUSONE MINUSONE * ABD5A  "Enter expression"  "Funcs in"
            XLIB SymFGetExpr ;                   * ABD91

* ROMPTR 0B4 119
* refs (1): A2437
* Field: the variable
SymbFldVar:
          :: 'DROPFALSE BINT22 BINT17 BINT25 BINT9 BINT1 * ABDA1
            { BINT6 } BINT4 # BD0C MINUSONE MINUSONE MINUSONE MINUSONE ; * ABDC4  "Enter variable name"
          'DROPFALSE BINT64 BINT17 BINT25 BINT9 BINT3 * ABDFB
          { BINT0 BINT6 BINT9 } BINT4 # BD0D MINUSONE MINUSONE MINUSONE * ABE19  "Enter lower limit"
          MINUSONE 'DROPFALSE # 6A BINT17 BINT25 BINT9 BINT3 * ABE50
          { BINT0 BINT6 BINT9 } BINT4 # BD0E MINUSONE MINUSONE MINUSONE * ABE78  "Enter upper limit"
          MINUSONE 'RROMPTR@ XLIB SymbResultMH BINT28 BINT26 BINT49 BINT9 * ABEAF
          BINT12 MINUSONE BINT17 # BD0F XLIB SymFResultItems BINT17 * ABED8  "Choose result type"
          XLIB SymFItemSymb XLIB SymFSymbolic? ITE XLIB SymFItemSymb * ABF01
          XLIB SymFItemNum                       * ABF27
          'RROMPTR@ XLIB SymbFormatMH BINT61 BINT35 BINT19 BINT9 BINT12 * ABF32
          MINUSONE BINT33 # BD10 XLIB ModeFmtItems BINT17 XLIB ModeItemStd * ABF5B  "Choose disp format for accuracy"
          XLIB ModeNumFmt 'RROMPTR@ XLIB SymbDigitsMH BINT85 BINT35 BINT13 * ABF8A
          BINT9 BINT13                           * ABFB4
          { BINT0 } BINT4 # B91E XLIB ModeDigitItems BINT4 %0_2A2B4 BINT13 * ABFBE  "Enter decimal places to display"
          ROLL BINT6 BINT7 'RROMPTR@ XLIB SymbIntegMH # BD07 DoInputForm * ABFF6  "Integrate"
          NOT?SEMI                               * AC024
          7PICK XLIB SymFPutExpr ROT XLIB ~BINT2;NTHCOMPROM@ 3UNROLL 3PICK * AC029
          ITE                                    * AC053
          :: COERCE SWAP XLIB NTHEval3 ; 2DROP   * AC058
          XLIB SymFIntegrate ;                   * AC07C

* ROMPTR 0B4 11A
* refs (1): A2437
* #msg -> ... flag: form message handler: 29 (OK) requires fields 1 to 4 to be filled in; 5 the labels
SymbIntegMH:
        :: XLIB IFNeedValues                     * AC08C
          { BINT1 BINT2 BINT3 BINT4 } BINT5 #<>case FALSE * AC09C
          XLIB SymbIntegLabels TRUE ;            * AC0C9

* ROMPTR 0B4 11B
* refs (1): A2437
* -> grob FALSE: message 5: draws the labels, Number Format only for a numeric result
SymbIntegLabels:
        :: BINT39 BINT131 MAKEGROB BINT6 ONE_DO INDEX@ XLIB IFDispLabel LOOP * AC0DE
          XLIB SymbIntegNum? NOTcaseFALSE BINT6  * AC111
          XLIB IFDispLabel FALSE ;               * AC126

* ROMPTR 0B4 11C
* refs (1): A2437
* #msg -> ... flag: Result field: 47 shows or hides the fields that depend on it
SymbResultMH:
        :: BINT47 #<>case FALSE                  * AC13B
          XLIB SymbIntegDisp TRUE ;              * AC14F

* ROMPTR 0B4 11D
* refs (1): A2437
* #msg -> ... flag: Number Format field: hidden unless the result is numeric
SymbFormatMH:
        :: BINT7 #=casedrop                      * AC164
          :: XLIB SymbIntegNum? NOT ;            * AC173
          { BINT55 XLIB SymbIntegNum? BINT47 XLIB SymbIntegDisp } EQLookup * AC18D
          case                                   * AC1BC
          :: EVAL TRUE ;                         * AC1C1
          DROPFALSE ;                            * AC1D5

* ROMPTR 0B4 11E
* refs (1): A2437
* #msg -> ... flag: digits field: hidden unless the result is numeric and the format is not Standard
SymbDigitsMH:
        :: BINT7 #=casedrop                      * AC1DF
          :: XLIB SymbIntegNum? NOT XLIB SymbIntegStd? OR ; * AC1EE
          BINT55 #<>case FALSE                   * AC218
          XLIB SymbIntegNum? XLIB SymbIntegStd? NOT AND TRUE ; * AC227

* ROMPTR 0B4 11F
* refs (1): A2437
* -> : after a change in Result or Number Format: redraws or blanks the last row
SymbIntegDisp:
        :: XLIB SymbIntegNum? NOTcase            * AC251
          :: BINT35 BINT9 BLANKIT ;              * AC266
          HARDBUFF BINT6 XLIB IFDispLabel DROP BINT6 XLIB IFMarkPending * AC27F
          BINT7 XLIB IFMarkPending XLIB SymbIntegStd? NOT?SEMI * AC2A9
          HARDBUFF BINT85 BINT35 BINT97 BINT44 GROB!ZERO DROP ; * AC2C9

* ROMPTR 0B4 120
* refs (1): A2437
* -> flag: is the result type Numeric?
SymbIntegNum?:
        :: BINT5 XLIB ~gFldVal XLIB ~BINT2;NTHCOMPROM@ ; * AC2F1

* ROMPTR 0B4 121
* refs (1): A2437
* -> flag: is the number format Standard?
SymbIntegStd?:
        :: BINT6 XLIB ~gFldVal ?ROMPTR@ XLIB ModeItemStd ?ROMPTR@ EQUAL ; * AC316

* ROMPTR 0B4 122
* refs (1): A2437
* -> : "Differentiate". Fields: 1 Expr, 2 Var, 3 Result, 4 Value
SymbDiffForm:
        :: XLIB SymbLblExpr XLIB SymbLblVar XLIB SymbLblResult # BD12 BINT1 * AC34A  "Value:"
          BINT37 XLIB SymbFldExpr XLIB SymbFldVar 'RROMPTR@ * AC37F
          XLIB SymbDiffResMH BINT28 BINT26 BINT49 BINT9 BINT12 MINUSONE * AC39F
          BINT17 # BD0F XLIB SymFResultItems BINT17 XLIB SymFItemSymb * AC3C8  "Choose result type"
          XLIB SymFSymbolic? ITE XLIB SymFItemSymb XLIB SymFItemNum * AC3F2
          'RROMPTR@ XLIB SymbDiffValMH BINT28 BINT35 BINT49 BINT9 BINT1 * AC418
          { BINT0 BINT6 BINT9 } BINT4 # BD13 MINUSONE MINUSONE MINUSONE * AC441  "Enter variable value"
          MINUSONE BINT4 DUP 'RROMPTR@ XLIB SymbDiffMH # BD11 DoInputForm * AC478  "Differentiate"
          NOT?SEMI                               * AC4A6
          4PICK XLIB SymFPutExpr SWAP XLIB ~BINT2;NTHCOMPROM@ XLIB SymFDeriv ; * AC4AB

* ROMPTR 0B4 123
* refs (1): A2437
* #msg -> ... flag: form message handler: 29 (OK) requires fields 1 and 2 to be filled in; 16 the menu, 5 the labels
SymbDiffMH:
        :: XLIB IFNeedValues                     * AC4DB
          { BINT1 BINT2 }                        * AC4EB
          { BINT16                               * AC4FF
            :: XLIB SymbDiffMenu TRUE ; BINT5 XLIB SymbDiffLabels } * AC509
          EQLookup case                          * AC538
          :: EVAL TRUE ;                         * AC542
          DROPFALSE ;                            * AC556

* ROMPTR 0B4 124
* refs (1): A2437
* Menu keys: STEP, CANCL and OK
SymbDiffMenu:
        {                                        * AC560
          { $ "STEP" XLIB SymbDiffStep }         * AC565
          { $ "(AN(L" XLIB DoKeyCancel }         * AC58C
          { $ "OK" XLIB DoKeyOK } }              * AC5B5

* ROMPTR 0B4 125
* refs (1): A2437
* -> : STEP key: leaves one differentiation step on the stack and ends the form
SymbDiffStep:
        :: TakeOver XLIB GetFieldVals 4PICK XLIB SymFPutExpr SWAP * AC5DD
          XLIB ~BINT2;NTHCOMPROM@ XLIB SymFDerivStep AtUserStack * AC607
          XLIB DoKeyCancel ;                     * AC622

* ROMPTR 0B4 126
* refs (1): A2437
* -> grob FALSE: message 5: draws the labels, Value only for a numeric result
SymbDiffLabels:
        :: BINT39 BINT131 MAKEGROB BINT4 ONE_DO INDEX@ XLIB IFDispLabel LOOP * AC632
          XLIB SymbDiffNum? NOTcaseFALSE BINT4   * AC665
          XLIB IFDispLabel FALSE ;               * AC67A

* ROMPTR 0B4 127
* refs (1): A2437
* #msg -> ... flag: Result field: 47 shows or hides Value
SymbDiffResMH:
        :: BINT47 #<>case FALSE                  * AC68F
          XLIB SymbDiffDisp TRUE ;               * AC6A3

* ROMPTR 0B4 128
* refs (1): A2437
* -> : after a change in Result: redraws or blanks the last row
SymbDiffDisp:
        :: XLIB SymbDiffNum? NOTcase             * AC6B8
          :: BINT35 BINT9 BLANKIT ;              * AC6CD
          HARDBUFF BINT4 XLIB IFDispLabel DROP BINT4 XLIB IFMarkPending ; * AC6E6

* ROMPTR 0B4 129
* refs (1): A2437
* #msg -> ... flag: Value field: hidden unless the result is numeric
SymbDiffValMH:
        :: BINT7 #=casedrop                      * AC715
          :: XLIB SymbDiffNum? NOT ;             * AC724
          BINT55 #<>case FALSE                   * AC73E
          XLIB SymbDiffNum? TRUE ;               * AC74D

* ROMPTR 0B4 12A
* refs (1): A2437
* -> flag: is the result type Numeric?
SymbDiffNum?:
        :: BINT3 XLIB ~gFldVal XLIB ~BINT2;NTHCOMPROM@ ; * AC762

* ROMPTR 0B4 12B
* refs (1): A2437
* -> : "Taylor Polynomial": expression, variable, order and result type
SymbTaylorForm:
        :: XLIB SymbLblExpr XLIB SymbLblVar # BD16 BINT55 BINT19 * AC787  "Order:"
          XLIB SymbLblResult XLIB SymbFldExpr XLIB SymbFldVar 'DROPFALSE * AC7B6
          BINT79 BINT17 BINT19 BINT9 BINT1       * AC7DC
          { BINT0 } BINT4 # BD17 MINUSONE MINUSONE MINUSONE MINUSONE * AC7F5  "Enter Taylor polynomial order"

* ROMPTR 0B4 12C
* refs (1): A2437
* Field: result type, Symbolic or Numeric
SymbFldResult:
          :: 'DROPFALSE BINT28 BINT26 BINT49 BINT9 BINT12 MINUSONE BINT17 * AC827
            # BD0F XLIB SymFResultItems BINT17 XLIB SymFItemSymb * AC854  "Choose result type"
            XLIB SymFSymbolic? ITE XLIB SymFItemSymb XLIB SymFItemNum * AC879
          ;                                      * AC89F
          BINT4 DUP '                            * AC8A4
          :: XLIB IFNeedValues                   * AC8B3
            { BINT1 BINT2 BINT3 } DROPFALSE ;    * AC8C3
          # BD15 DoInputForm NOT?SEMI            * AC8E6  "Taylor Polynomial"
          4PICK XLIB SymFPutExpr XLIB ~BINT2;NTHCOMPROM@ XLIB SymFTaylor ; * AC8FA

* ROMPTR 0B4 12D
* refs (1): A2437
* -> : "Isolate a Variable"
SymbIsolateForm:
        :: XLIB SymbLblExpr XLIB SymbLblVar XLIB SymbLblResult * AC925

* ROMPTR 0B4 12E
* refs (1): A2437
* Label "Principal"
SymbLblPrincipal:
          :: # BD19 # 5C BINT28 ; XLIB SymbFldExpr XLIB SymbFldVar * AC94B  "Principal"
          XLIB SymbFldResult                     * AC984

* ROMPTR 0B4 12F
* refs (1): A2437
* Field: principal solution check, initially flag -1
SymbFldPrincipal:
          :: 'DROPFALSE BINT85 BINT26 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AC98F
            # BD1A MINUSONE MINUSONE FALSE XLIB SymFPrincipal? ; * AC9BC  "Get principal solution only?"
          BINT4 DUP '                            * AC9E5
          :: XLIB IFNeedValues                   * AC9F4
            { BINT1 BINT2 } DROPFALSE ;          * ACA04
          # BD18 DoInputForm NOT?SEMI            * ACA22  "Isolate a Variable"
          4PICK XLIB SymFPutExpr XLIB SymFPrincipal! XLIB ~BINT2;NTHCOMPROM@ * ACA36
          XLIB SymFIsol ;                        * ACA5C

* ROMPTR 0B4 130
* refs (1): A2437
* -> : "Solve Quadratic"
SymbQuadForm:
        :: XLIB SymbLblExpr XLIB SymbLblVar XLIB SymbLblResult * ACA6C
          XLIB SymbLblPrincipal XLIB SymbFldExpr XLIB SymbFldVar * ACA92
          XLIB SymbFldResult XLIB SymbFldPrincipal BINT4 DUP ' * ACAB3
          :: XLIB IFNeedValues                   * ACAD8
            { BINT1 BINT2 } DROPFALSE ;          * ACAE8
          # BD1B DoInputForm NOT?SEMI            * ACB06  "Solve Quadratic"
          4PICK XLIB SymFPutExpr XLIB SymFPrincipal! XLIB ~BINT2;NTHCOMPROM@ * ACB1A
          XLIB SymFQuad ;                        * ACB40

* ROMPTR 0B4 131
* refs (1): A2437
* -> : "Manipulate Expression": edits one expression with COLCT, EXPND and MATCH, and leaves the result on the stack
SymbManipForm:
        :: XLIB SymbLblExpr XLIB SymbFldExpr BINT1 DUP 'RROMPTR@ * ACB50
          XLIB SymbManipMH # BD1C DoInputForm NOT?SEMI * ACB7A  "Manipulate Expression"
          DUP XLIB SymFPutExpr DUP MINUSONE EQUAL IT DROP * ACB99
          AtUserStack ;                          * ACBC2

* ROMPTR 0B4 132
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
SymbManipMH:
        :: BINT16 #<>case FALSE                  * ACBCC
          XLIB SymbManipMenu TrueTrue ;          * ACBE0

* ROMPTR 0B4 133
* refs (1): A2437
* Menu keys: MATC, COLCT and EXPND
SymbManipMenu:
        {                                        * ACBF5
          {                                      * ACBFA
            :: PTR DirLabel: $ "MATC" ; XLIB SymbMatchForm } * ACBFF
          { $ "COLCT" XLIB SymbColctKey }        * ACC30
          { $ "EXPND" XLIB SymbExpndKey } }      * ACC59

* ROMPTR 0B4 134
* refs (1): A2437
* -> : COLCT key: replaces the expression by its COLCT
SymbColctKey:
        :: TakeOver BINT1 XLIB ~gFldVal XLIB SymFColct BINT1 XLIB ~sFldVal * ACC87
          SetDA123NoCh BINT1 XLIB IFMarkPending ; * ACCBC

* ROMPTR 0B4 135
* refs (1): A2437
* -> : EXPND key: replaces the expression by its EXPAN
SymbExpndKey:
        :: TakeOver BINT1 XLIB ~gFldVal XLIB SymFExpan BINT1 XLIB ~sFldVal * ACCD6
          SetDA123NoCh BINT1 XLIB IFMarkPending ; * ACD0B

* ROMPTR 0B4 136
* refs (1): A2437
* -> : MATC key: "Match Expression": pattern, replacement, subexpressions first and condition; the result replaces the expression
SymbMatchForm:
        :: TakeOver XLIB SymbLblExpr # BD1E BINT1 BINT19 # BD1F BINT1 BINT28 * ACD25  "Pattern:"  "Replacement:"
          # BD20 BINT8 BINT37 # BD21 BINT67 BINT37 XLIB SymbFldExpr DROP * ACD62  "Subexpr First"  "Cond:"
          BINT1 XLIB ~gFldVal 'DROPFALSE BINT55 BINT17 # 49 BINT9 BINT1 * ACD9A
          { BINT9 BINT6 BINT0 BINT1 } BINT4 # BD22 MINUSONE MINUSONE * ACDCD  "Enter pattern to search for"
          MINUSONE MINUSONE 'DROPFALSE BINT55 BINT26 # 49 BINT9 BINT1 * ACE04
          { BINT9 BINT6 BINT0 BINT1 } BINT4 # BD23 MINUSONE MINUSONE * ACE31  "Enter replacement object"
          MINUSONE MINUSONE 'DROPFALSE BINT1 BINT35 BINT6 BINT9 BINT32 * ACE68
          MINUSONE MINUSONE # BD24 MINUSONE MINUSONE FALSE DUP 'DROPFALSE * ACE90  "Search subexpressions first?"
          # 58 BINT35 BINT37 BINT9 BINT1         * ACEBD
          { BINT9 BINT6 BINT0 } BINT4 # BD25 MINUSONE MINUSONE MINUSONE * ACEDB  "Enter conditional expression"
          MINUSONE BINT5 DUP 'DROPFALSE # BD1D DoInputForm NOT?SEMI * ACF12  "Match Expression"
          XLIB SymFMatch BINT1 XLIB ~sFldVal ;   * ACF3A

* ROMPTR 0B4 137
* refs (1): A2437
* -> : the TIME key: the choose box of time applications
TimeApp:
        :: XLIB IFNotInForm                      * ACF5A
          {                                      * ACF6A
            { # BC01 XLIB AlarmBrowse }          * ACF6F  "Browse alarms "
            { # BC02 XLIB AlarmSet }             * ACF8E  "Set alarm "
            { # BC03 XLIB TimeSetForm } }        * ACFAD  "Set time, date "
          XLIB IFTypeChoose ;                    * ACFD1

* ROMPTR 0B4 138
* refs (1): A2437
* -> : "Set alarm": AlarmForm on a new alarm
AlarmSet:
        :: XLIB AlarmDfltFields XLIB AlarmForm DROP ; * ACFE1

* ROMPTR 0B4 139
* refs (1): A2437
* {fields} -> flag: "Set Alarm": runs the form on the 12 values of AlarmDfltFields and stores the alarm. FALSE if cancelled. Hour and date fields come in the order of the date format. The date labels for both formats are defined, and the handler draws the ones that apply
AlarmForm:
        :: # BC05 BINT1 BINT10                   * AD006  "Message:"

* ROMPTR 0B4 13A
* refs (1): A2437
* Label "Time:"
TimeLblTime:
          :: # BC06 BINT1 BINT19 ;               * AD01F  "Time:"

* ROMPTR 0B4 13B
* refs (1): A2437
* Label ":" before the minutes
TimeLblColon1:
          :: $ ":" BINT52 BINT19 ;               * AD03D

* ROMPTR 0B4 13C
* refs (1): A2437
* Label ":" before the seconds
TimeLblColon2:
          :: $ ":" BINT70 BINT19 ;               * AD05D

* ROMPTR 0B4 13D
* refs (1): A2437
* Label "Date:"
TimeLblDate:
          :: # BC07 BINT1 BINT28 ;               * AD07D  "Date:"

* ROMPTR 0B4 13E
* refs (1): A2437
* Label "Repeat:"
TimeLblRepeat:
          :: # BC08 BINT1 BINT37 ;               * AD09B  "Repeat:"

* ROMPTR 0B4 13F
* refs (1): A2437
* Label "/" of month/day/year
TimeLblSlash1:
          :: $ "/" BINT52 BINT28 ;               * AD0B9

* ROMPTR 0B4 140
* refs (1): A2437
* Label "/" of month/day/year
TimeLblSlash2:
          :: $ "/" BINT70 BINT28 ;               * AD0D9

* ROMPTR 0B4 141
* refs (1): A2437
* Label "." of day.month.year
TimeLblDot1:
          :: $ "." BINT52 BINT28 ;               * AD0F9

* ROMPTR 0B4 142
* refs (1): A2437
* Label "." of day.month.year
TimeLblDot2:
          :: $ "." BINT70 BINT28 ; 'DROPFALSE BINT37 BINT8 BINT91 BINT9 * AD119
          BINT1 MINUSONE BINT4 # BC09 MINUSONE MINUSONE MINUSONE MINUSONE * AD152  "Enter "message" or « action »"

* ROMPTR 0B4 143
* refs (1): A2437
* Field: hour
TimeFldHour:
          :: 'DROPFALSE BINT37 BINT17 BINT13 BINT9 BINT13 * AD17F
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 169 # BC0A XLIB TimHourItems * AD1A2  "Enter hour"
            'RROMPTR@ ROMPTR 0B4 169 %12 MINUSONE ; * AD1D6

* ROMPTR 0B4 144
* refs (1): A2437
* Field: minute
TimeFldMin:
          :: 'RROMPTR@ ROMPTR 0B4 150 BINT55 BINT17 BINT13 BINT9 BINT13 * AD1F5
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 167 # BC0B MINUSONE 'RROMPTR@ * AD223  "Enter minute"
            ROMPTR 0B4 167 %0_2A2B4 MINUSONE ;   * AD256

* ROMPTR 0B4 145
* refs (1): A2437
* Field: second
TimeFldSec:
          :: 'RROMPTR@ XLIB TimeMinMH # 49 BINT17 BINT13 BINT9 BINT13 * AD270
            { BINT0 } 'RROMPTR@ XLIB Time2Digits # BC0C MINUSONE 'RROMPTR@ * AD2A3  "Enter second"
            XLIB Time2Digits %0_2A2B4 MINUSONE ; * AD2D6

* ROMPTR 0B4 146
* refs (1): A2437
* Field: AM, PM or 24-hour
TimeFldAMPM:
          :: 'DROPFALSE # 5E BINT17 BINT31 BINT9 BINT12 MINUSONE BINT33 * AD2F0
            # BC0D XLIB TimAMPMItems BINT17 XLIB TimItemPM MINUSONE ; * AD322  "Choose AM, PM, or 24-hour time"

* ROMPTR 0B4 147
* refs (1): A2437
* Field: month in M/D/Y order
TimeFldMonthMD:
          :: 'RROMPTR@ XLIB TimeMonthMDMH BINT37 BINT26 BINT13 BINT9 BINT13 * AD351
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 16A # BC0E MINUSONE BINT17 %1 * AD37F  "Enter month"
            MINUSONE ;                           * AD3B7

* ROMPTR 0B4 148
* refs (1): A2437
* Field: day in M/D/Y order
TimeFldDayMD:
          :: 'RROMPTR@ XLIB TimeDayMDMH BINT55 BINT26 BINT13 BINT9 BINT13 * AD3C1
            { BINT0 } 'RROMPTR@ XLIB Time2Chars # BC0F MINUSONE BINT17 %1 * AD3EF  "Enter day"
            MINUSONE ;                           * AD427

* ROMPTR 0B4 149
* refs (1): A2437
* Field: day in D.M.Y order
TimeFldDayDM:
          :: 'RROMPTR@ XLIB TimeDayDMMH BINT37 BINT26 BINT13 BINT9 BINT13 * AD431
            { BINT0 } 'RROMPTR@ XLIB Time2Chars # BC0F MINUSONE BINT17 %1 * AD45F  "Enter day"
            MINUSONE ;                           * AD497

* ROMPTR 0B4 14A
* refs (1): A2437
* Field: month in D.M.Y order
TimeFldMonthDM:
          :: 'RROMPTR@ XLIB TimeMonthDMMH BINT55 BINT26 BINT13 BINT9 BINT13 * AD4A1
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 16A # BC0E MINUSONE BINT17 %1 * AD4CF  "Enter month"
            MINUSONE ;                           * AD507

* ROMPTR 0B4 14B
* refs (1): A2437
* Field: year
TimeFldYear:
          :: 'RROMPTR@ XLIB TimeYearMH # 49 BINT26 BINT13 BINT9 BINT13 * AD511
            { BINT0 } BINT4 # BC10 MINUSONE BINT4 % 9.3E1 MINUSONE ; * AD544  "Enter year"
          'RROMPTR@ XLIB AlarmRepeatMH BINT37 BINT35 BINT25 BINT9 BINT13 * AD58B
          { BINT0 } 'RROMPTR@ XLIB AlarmRepeat$ # BC11 XLIB AlmMultItems * AD5B4  "Enter alarm repeat multiple"
          BINT4 %0_2A2B4 MINUSONE 'RROMPTR@ XLIB AlarmUnitMH BINT64 BINT35 * AD5E8
          BINT43 BINT9 BINT12 MINUSONE 'RROMPTR@ XLIB AlarmUnit$ # BC12 * AD611  "Enter alarm repeat unit"
          XLIB AlmUnitItems BINT17 XLIB AlmUnitDay MINUSONE BINT10 BINT12 * AD63F
          'RROMPTR@ XLIB AlarmMH # BC04 # BF ROLL INNERCOMP XLIB IFSetHelps * AD669  "Set Alarm"
          DoInputForm NOTcaseFALSE XLIB AlarmFromFields * AD6A2
          TRUE ;                                 * AD6B7

* ROMPTR 0B4 14C
* refs (1): A2437
* -> {fields}: the 12 field values for a new alarm: no message, the time and date now, no repeat
AlarmDfltFields:
        :: MINUSONE XLIB TimNow SWAPDROP %0_2A2B4 SWAP XLIB TimToday 3UNROLL * AD6C1
          2DUP SWAP 5ROLL %0_2A2B4 XLIB AlmUnitWeek BINT12 {}N ; * AD6F5

* ROMPTR 0B4 14D
* refs (1): A2437
* field values -> : drops the month and day fields of the format not in use and stores the alarm
AlarmFromFields:
        :: XLIB TimeDMY? ITE                     * AD723
          :: 6ROLL DROP 6ROLL DROP 5ROLL 5ROLL 5UNROLL 4UNROLL ; * AD738
          :: 4ROLL DROP 4ROLL DROP ;             * AD76A
          XLIB TimStoAlarm ;                     * AD788

* ROMPTR 0B4 14E
* refs (1): A2437
* #msg -> ... flag: form message handler: 5 the labels
AlarmMH:
        :: BINT5 #<>case FALSE                   * AD798
          XLIB AlarmLabels TRUE ;                * AD7AC

* ROMPTR 0B4 14F
* refs (1): A2437
* -> grob FALSE: message 5: draws the labels, the date separators of the current format only
AlarmLabels:
        :: BINT39 BINT131 MAKEGROB BINT7 ONE_DO INDEX@ XLIB IFDispLabel LOOP * AD7C1
          XLIB TimeDMY? ITE                      * AD7F4
          :: BINT11 BINT9 ;                      * AD804
          :: BINT9 BINT7 ;                       * AD818
          DO INDEX@ XLIB IFDispLabel LOOP FALSE ; * AD82C

* ROMPTR 0B4 151
* refs (2): A2437 A2437
* #msg -> ... flag: minute and second fields: 40 gives the choose list and position. Commands 150 and 151 are this object
TimeMinMH:
        :: BINT40 #<>case FALSE                  * AD850
          XLIB TimMinItems 4GETLAM XLIB ~gFldVal COERCE #1+ BINT60 #MIN TRUE ; * AD864

* ROMPTR 0B4 152
* refs (1): A2437
* #msg -> ... flag: month in M/D/Y order: hidden in the other format; 47 copies the value to the month field of the other format
TimeMonthMDMH:
        :: BINT7 #=casedrop XLIB TimeDMY?        * AD89D
          { BINT55                               * AD8B7
            :: XLIB TimeDMY? NOT ; BINT47        * AD8C1
            :: 4GETLAM DUP XLIB ~gFldVal SWAP #3+ XLIB ~sFldVal ; } * AD8E0
          EQLookup case                          * AD919
          :: EVAL TRUE ;                         * AD923
          XLIB TimeMonthMH ;                     * AD937

* ROMPTR 0B4 153
* refs (1): A2437
* #msg -> ... flag: month in D.M.Y order: as TimeMonthMDMH
TimeMonthDMMH:
        :: BINT7 #=casedrop                      * AD947
          :: XLIB TimeDMY? NOT ;                 * AD956
          { BINT55 XLIB TimeDMY? BINT47          * AD970
            :: 4GETLAM DUP XLIB ~gFldVal SWAP #3- XLIB ~sFldVal ; } * AD98A
          EQLookup case                          * AD9C3
          :: EVAL TRUE ;                         * AD9CD
          XLIB TimeMonthMH ;                     * AD9E1

* ROMPTR 0B4 154
* refs (1): A2437
* #msg -> ... flag: month fields: 26 CHOOS, 38 next month, 40 choose list and position
TimeMonthMH:
        ::                                       * AD9F1
          { BINT26 XLIB TimeChooseFld BINT38 XLIB TimeNextMonth BINT40 * AD9F6
            :: XLIB TimMonthItems 4GETLAM XLIB ~gFldVal COERCE BINT1 #MAX * ADA20
              BINT12 #MIN ;                      * ADA4F
          }                                      * ADA5E
          EQLookup case                          * ADA63
          :: EVAL TRUE ;                         * ADA6D
          DROPFALSE ;                            * ADA81

* ROMPTR 0B4 155
* refs (1): A2437
* #msg -> ... flag: day in M/D/Y order: hidden in the other format; 47 copies the value to the other day field, 40 gives the days of the month
TimeDayMDMH:
        :: BINT7 #=casedrop XLIB TimeDMY?        * ADA8B
          { BINT55                               * ADAA5
            :: XLIB TimeDMY? NOT ; BINT47        * ADAAF
            :: 4GETLAM DUP XLIB ~gFldVal SWAP #1+ XLIB ~sFldVal ; BINT40 * ADACE
            :: 4GETLAM DUP DUP #1- XLIB ~gFldVal COERCE SWAP #3+ * ADB07
              XLIB ~gFldVal COERCE XLIB TimDayItems SWAP XLIB ~gFldVal * ADB3A
              COERCE BINT1 #MAX OVER LENCOMP #MIN ; * ADB65
          }                                      * ADB88
          EQLookup case                          * ADB8D
          :: EVAL TRUE ;                         * ADB97
          XLIB TimeDayMH ;                       * ADBAB

* ROMPTR 0B4 156
* refs (1): A2437
* #msg -> ... flag: day in D.M.Y order: as TimeDayMDMH
TimeDayDMMH:
        :: BINT7 #=casedrop                      * ADBBB
          :: XLIB TimeDMY? NOT ;                 * ADBCA
          { BINT55 XLIB TimeDMY? BINT47          * ADBE4
            :: 4GETLAM DUP XLIB ~gFldVal SWAP #1- XLIB ~sFldVal ; BINT40 * ADBFE
            :: 4GETLAM DUP DUP #1+ XLIB ~gFldVal COERCE SWAP #2+ * ADC37
              XLIB ~gFldVal COERCE XLIB TimDayItems SWAP XLIB ~gFldVal * ADC6A
              COERCE BINT1 #MAX OVER LENCOMP #MIN ; * ADC95
          }                                      * ADCB8
          EQLookup case                          * ADCBD
          :: EVAL TRUE ;                         * ADCC7
          XLIB TimeDayMH ;                       * ADCDB

* ROMPTR 0B4 157
* refs (1): A2437
* #msg -> ... flag: day fields: 26 CHOOS, 38 next day
TimeDayMH:
        ::                                       * ADCEB
          { BINT26 XLIB TimeChooseFld BINT38 XLIB TimeNextDay } EQLookup * ADCF0
          case                                   * ADD1F
          :: EVAL TRUE ;                         * ADD24
          DROPFALSE ;                            * ADD38

* ROMPTR 0B4 158
* refs (1): A2437
* #msg -> ... flag: year field: 40 gives a choose list of years
TimeYearMH:
        :: BINT40 #<>case FALSE                  * ADD42
          4GETLAM DUP XLIB ~gFldVal XLIB TimYearItems XLIB IFFindChoice TRUE ; * ADD56

* ROMPTR 0B4 159
* refs (1): A2437
* #msg -> ... flag: repeat count: 47 redraws the unit field, which depends on it
AlarmRepeatMH:
        :: BINT47 #<>case FALSE                  * ADD8B
          4GETLAM #1+ XLIB IFMarkPending TRUE ;  * ADD9F

* ROMPTR 0B4 15A
* refs (1): A2437
* #msg -> ... flag: repeat unit: enabled only when the alarm repeats
AlarmUnitMH:
        :: BINT55 #<>case FALSE                  * ADDBE
          XLIB AlarmRepeats? TRUE ;              * ADDD2

* ROMPTR 0B4 15B
* refs (1): A2437
* -> : "Set Time and Date"
TimeSetForm:
        :: XLIB TimeLblTime XLIB TimeLblColon1 XLIB TimeLblColon2 * ADDE7
          XLIB TimeLblDate XLIB TimeLblSlash1 XLIB TimeLblSlash2 $ " " * ADE0D
          BINT52 BINT28 $ " " BINT70 BINT28 XLIB TimeLblDot1 * ADE3A
          XLIB TimeLblDot2 XLIB TimeFldHour XLIB TimeFldMin XLIB TimeFldSec * ADE65
          XLIB TimeFldAMPM XLIB TimeFldMonthMD XLIB TimeFldDayMD * ADE91
          XLIB TimeFldDayDM XLIB TimeFldMonthDM XLIB TimeFldYear 'RROMPTR@ * ADEB2
          XLIB TimeFormatMH # 5E BINT26 BINT31 BINT9 BINT12 MINUSONE BINT33 * ADED8
          # BC14 XLIB TimDateFmtItems BINT17 XLIB TimItemMDY MINUSONE BINT10 * ADF0B  "Choose date display format"
          DUP 'RROMPTR@ XLIB TimeSetMH # BC13 XLIB TimeGetFields BINT10 * ADF3A  "Set Time and Date"
          XLIB IFSetHelps DoInputForm NOT?SEMI   * ADF69
          XLIB TimeSetFields ;                   * ADF7E

* ROMPTR 0B4 15C
* refs (1): A2437
* -> field values: the current time and date
TimeGetFields:
        :: XLIB TimNow XLIB TimToday 3UNROLL 2DUP SWAP 5ROLL * ADF8E
          XLIB TimDateFmt@ ;                     * ADFBD

* ROMPTR 0B4 15D
* refs (1): A2437
* field values -> : stores the date format, drops the fields of the other format, and sets the date and the time
TimeSetFields:
        :: XLIB TimDateFmt! XLIB TimeDMY? ITE    * ADFCD
          :: 4ROLL DROP 4ROLL DROP 3UNROLL SWAPROT ; ROTROT2DROP * ADFED
          XLIB TimSetDate DUP XLIB Tim24h! XLIB TimSetTime ; * AE01A

* ROMPTR 0B4 15E
* refs (1): A2437
* #msg -> ... flag: form message handler: 5 the labels
TimeSetMH:
        :: BINT5 #<>case FALSE                   * AE045
          XLIB TimeSetLabels TRUE ;              * AE059

* ROMPTR 0B4 15F
* refs (1): A2437
* -> grob FALSE: message 5: draws the labels, the date separators of the current format only
TimeSetLabels:
        :: BINT39 BINT131 MAKEGROB BINT5 ONE_DO INDEX@ XLIB IFDispLabel LOOP * AE06E
          XLIB TimeDMY? ITE                      * AE0A1
          :: BINT11 BINT9 ;                      * AE0B1
          :: BINT7 BINT5 ;                       * AE0C5
          DO INDEX@ XLIB IFDispLabel LOOP FALSE ; * AE0D9

* ROMPTR 0B4 160
* refs (1): A2437
* #msg -> ... flag: date format field: 47 applies the new format
TimeFormatMH:
        :: BINT47 #<>case FALSE                  * AE0FD
          XLIB TimeFormatChg TRUE ;              * AE111

* ROMPTR 0B4 161
* refs (1): A2437
* -> : sets flag -42 as the field says and redraws the date row in the new order
TimeFormatChg:
        :: BINT42 BINT10 XLIB ~gFldVal XLIB ~BINT3;NTHCOMPROM@ ITE * AE126
          SetSysFlag ClrSysFlag                  * AE150
          XLIB TimeDMY? ITE                      * AE15A
          :: BINT9 BINT7 BINT11 BINT7 ;          * AE16A
          :: BINT7 BINT5 BINT7 BINT5 ;           * AE188
          HARDBUFF 3UNROLL DO INDEX@ XLIB IFDispLabel LOOP DROP DO INDEX@ * AE1A6
          XLIB IFMarkPending LOOP ;              * AE1D9

* ROMPTR 0B4 162
* refs (1): A2437
* -> : CHOOS on a month or day field: stores the value from the list
TimeChooseFld:
        :: 4GETLAM XLIB IFChoose NOT?SEMI        * AE1EE
          XLIB ~BINT2;NTHCOMPROM@ 4GETLAM DUPUNROT XLIB ~sFldVal DUP * AE208
          XLIB ~BINT47;IFECallFieldMH;DROP XLIB IFEDispField ; * AE22D

* ROMPTR 0B4 163
* refs (1): A2437
* -> : +/- on a month field: the next month, wrapping 12 to 1
TimeNextMonth:
        :: 4GETLAM DUP XLIB ~gFldVal %1+ DUP %12 %> IT * AE248
          :: DROP %1 ;                           * AE27B
          OVER XLIB ~sFldVal DUP XLIB ~BINT47;IFECallFieldMH;DROP * AE28F
          XLIB IFEDispField SetDA123NoCh ;       * AE2AF

* ROMPTR 0B4 164
* refs (1): A2437
* -> : +/- on a day field: the next day, wrapping at the end of the month
TimeNextDay:
        :: 4GETLAM DUP XLIB ~gFldVal COERCE OVER #1- XLIB ~gFldVal COERCE * AE2C4
          3PICK #1+ XLIB ~gFldVal COERCE XLIB TimMonthDays SWAP #1+ DUPUNROT * AE2FD
          #< IT DROPONE                          * AE331
          UNCOERCE OVER XLIB ~sFldVal DUP XLIB ~BINT47;IFECallFieldMH;DROP * AE340
          XLIB IFEDispField SetDA123NoCh ;       * AE365

* ROMPTR 0B4 165
* refs (1): A2437
* -> flag: flag -42, date in day.month.year order?
TimeDMY?:
        :: BINT42 TestSysFlag ;                  * AE37A  flag -42: mm/dd/yy format / dd.mm.yy format

* ROMPTR 0B4 166
* refs (1): A2437
* -> flag: repeat count not 0?
AlarmRepeats?:
        :: BINT11 XLIB ~gFldVal %0<> ;           * AE38E

* ROMPTR 0B4 168
* refs (2): A2437 A2437
* % -> $: decompile with a leading 0 below 10, for minutes and seconds. Commands 167 and 168 are this object
Time2Digits:
        :: DUP BINT4 XLIB IFDecomp SWAP %9 %> ?SEMI * AE3AD
          CHR_0 >H$ ;                            * AE3DB

* ROMPTR 0B4 16B
* refs (3): A2437 A2437 A2437
* % -> $: decompile with a leading space below 10, for hours, months and days. Commands 169 to 16B are this object
Time2Chars:
        :: DUP BINT4 XLIB IFDecomp SWAP %9 %> ?SEMI * AE3EA
          CHR_Space >H$ ;                        * AE418

* ROMPTR 0B4 16C
* refs (1): A2437
* % -> $: repeat count, "None" for 0, right-aligned to 4 characters
AlarmRepeat$:
        :: DUP %0= casedrop                      * AE427
          :: # BC1C JstGetTHEMESG ;              * AE43B  "None"
          BINT4 XLIB IFDecomp DUPLEN$ BINT4 2DUP #< NOTcase2DROP SWAP#- * AE454
          Blank$ SWAP&$ ;                        * AE482

* ROMPTR 0B4 16D
* refs (1): A2437
* ob -> $: repeat unit, in the singular for a count of 1; empty without repeat
AlarmUnit$:
        :: XLIB AlarmRepeats? NOTcasedrop NULL$  * AE491
          4GETLAM #1- XLIB ~gFldVal %1 %= case   * AE4AB
          :: XLIB ~BINT1;NTHCOMPROM@ JstGetTHEMESG ; * AE4CF
          XLIB AlmUnitNames SWAP XLIB ~BINT2;NTHCOMPROM@ NTHCOMPDROP * AE4E9
          JstGetTHEMESG ;                        * AE509

* ROMPTR 0B4 16E
* refs (1): A2437
* -> : "Browse alarms": a Choose box of the alarm list
AlarmBrowse:
        :: TakeOver 'RROMPTR@ XLIB AlarmBrowseMH # BC3B 'RROMPTR@ * AE513  "Alarms"
          XLIB AlmLine NULL{} BINT1 XLIB ~Choose caseDROP ; * AE53C
