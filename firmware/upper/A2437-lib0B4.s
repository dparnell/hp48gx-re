* HP 48GX ROM revision R, #A2437-#A54DA: Library 0B4: the Solve applications (equation, differential equation, polynomial, linear system, TVM and amortization) and the start of Plot
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: TVMSolveKey_A4E71 TVMSetVals TVMMenu TVMMH TVMGetVals TVMForm TVMFieldMH SolveVarLabels SolvePolySymb SolvePolySolve SolvePolyMenu SolvePolyMH
* Follows on from the previous file (at #A2437 in the original ROM).

* Library 0B4: Built-in applications as input forms: Solve (equation, differential equation, polynomial, linear system, TVM), Plot and its options, Symbolic, Time and alarms, Statistics, I/O, Modes with the flag browser, and the Memory browser. Library 0B5 holds the code behind them
LIB0B4:
        CON(3)  #0B4                             * A2437  library number
        REL(5)  LIB0B4.hash                      * A243A  hash table
        CON(5)  0                                * A243F  message table
        REL(5)  LIB0B4.link                      * A2444  link table
        CON(5)  0                                * A2449  config
        RPL

* ROMPTR 0B4 000
* refs (1): A2437
* -> : the SOLVE key: the choose box of solver applications (equation, differential equation, polynomial, linear system, finance)
SolveApp:
        :: XLIB IFNotInForm                      * A244E
          {                                      * A245E
            { # BF01 XLIB SolveEqApp }           * A2463  "Solve equation "
            { # BF02 XLIB SolveDiffForm }        * A2482  "Solve diff eq "
            { # BF03 XLIB SolvePolyForm }        * A24A1  "Solve poly "
            { # BF04 XLIB SolveLinForm }         * A24C0  "Solve lin sys "
            { # BF05 XLIB TVMForm } }            * A24DF  "Solve finance "
          XLIB IFTypeChoose ;                    * A2503

* ROMPTR 0B4 001
* refs (1): A2437
* -> : Solve Equation. LAMs: V list of variables on show (-1 = not read yet), P current page (-1 = first pass), p pages, I last result for INFO, IE what to run on leaving (default NOP, PlotApp after PLOT), IX 0 = rebuild the form. The loop rebuilds the form whenever its fields change: a new equation, another page, another variable order
SolveEqApp:
        :: MINUSONE BINT1 MINUSONE MINUSONE 'NOP BINT1 * A2513
          { LAM 'V LAM 'P LAM 'p LAM 'I LAM 'IE LAM 'IX } BIND BEGIN LAM 'P * A2536
          MINUSONE #=ITE                         * A259B
          :: BINT1 ' LAM 'P STOLAM MINUSONE ; XLIB SlvGetEQ * A25A5
          XLIB SolveEqFields                     * A25D9
* 12 variables to a page
          LAM 'V LENCOMP BINT12 #/ SWAP #0<> IT #1+ * A25E4
          BINT1 #MAX ' LAM 'p STOLAM DoInputForm LAM 'IX #0<> IT * A2612
          :: NOT?SEMI                            * A264D
            XLIB SolveEqStore ;                  * A2657
          LAM 'IX #0= WHILE                      * A2667
* Leaving: run the object in LAM IE after dropping the LAMs
          :: BINT2 ' LAM 'IX STOLAM ; REPEAT ' LAM 'IE undo DROP ABND EVAL ; * A267E

* ROMPTR 0B4 002
* refs (1): A2437
* -> label and field definitions: the "Eq:" field, then for the current page one label and field per variable
SolveEqFields:
        :: LAM 'V MINUSONE EQUAL IT              * A26D4
          :: DUP XLIB SlvEqVars ' LAM 'V STOLAM ; * A26F3
          LAM 'V XLIB SolveVarLabels DUPNULL{}? ITE * A2722
          :: DROP XLIB SolveEqLabel BINT1 {}N XLIB SolveEqField BINT1 {}N ; * A2742
          :: XLIB SolveEqPage BINT2 OVER LENCOMP BINT3 #/ SWAP #0<> IT #1+ * A277B
            BINT1 XLIB InformLayout SWAP XLIB SolveEqLabel >HCOMP * A27B8
            XLIB SolveEqField ROT INNERCOMP DUP 1LAMBIND ZERO_DO ISTOP@ ROLL * A27DD
            'RROMPTR@ XLIB SolveVarMH >HCOMP     * A280B
            { BINT1                              * A2820
              { BINT0 BINT1 BINT13 BINT5 } BINT4 # BF07 MINUSONE MINUSONE } * A282A  "Enter value or press SOLVE"
            &COMP LOOP 1GETABND #1+ {}N ;        * A2866
          'RROMPTR@ XLIB SolveEqMH # BF06 MINUSONE 6ROLL LAM 'V DUPNULL{}? * A2884  "Solve Equation"
          ITE DROPZERO                           * A28B8
          :: XLIB SolveEqPage INNERCOMP DUP 1LAMBIND ZERO_DO ISTOP@ ROLL * A28C2
            XLIB ~SAFE@ ?SKIP MINUSONE           * A28F0
            LOOP 1GETABND ;                      * A2905
          #1+ {}N XLIB InformArgs ;              * A2914

* ROMPTR 0B4 003
* refs (1): A2437
* Label definition: "Eq:"
SolveEqLabel:
        { # BF08 BINT1 BINT10 }                  * A292E  "Eq:"

* ROMPTR 0B4 004
* refs (1): A2437
* Field definition: the equation
SolveEqField:
        { XLIB SolveEqFieldMH BINT13 BINT8 BINT115 BINT9 BINT23 * A294C
          { BINT9 BINT8 BINT6 BINT5 }            * A2975
          :: XLIB FirstEq BINT4 XLIB IFDecomp ; # BF09 # BF0A MINUSONE } * A2993  "Enter function to solve"  "Funcs in"

* ROMPTR 0B4 005
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu, 14 the first field
SolveEqMH:
        ::                                       * A29D6
          { BINT16                               * A29DB
            :: XLIB SolveEqMenu TRUE ; BINT14    * A29E5
            :: LAM 'IX 14GETLAM #MIN ; }         * A2A04
          EQLookup case                          * A2A2A
          :: EVAL TRUE ;                         * A2A34
          DROPFALSE ;                            * A2A48

* ROMPTR 0B4 006
* refs (1): A2437
* Menu keys: VARS (MORE while pages remain), INFO once a variable was solved, SOLVE on a variable field or EXPR= on the equation field
SolveEqMenu:
        {                                        * A2A52
          {                                      * A2A57
            :: TakeOver XLIB SolveEqPaged? LAM 'P LAM 'p #<> AND ITE * A2A5C
              :: PTR DirLabel: $ "MORE" ;        * A2A96
              :: PTR DirLabel: $ "VARS" ;        * A2AB7
            ;                                    * A2AD8
            XLIB SolveEqVarsKey }                * A2ADD
          {                                      * A2AED
            :: TakeOver LAM 'I MINUSONE EQUAL ITE NULL$ $ "INFO" * A2AF2
            ;                                    * A2B2D
            XLIB SolveEqInfo }                   * A2B32
          {                                      * A2B42
            :: TakeOver 5GETLAM #>1 ITE $ "SOLVE" $ "EXPR=" * A2B47
            ;                                    * A2B88
            XLIB SolveEqSolve }                  * A2B8D
        }                                        * A2B9D

* ROMPTR 0B4 007
* refs (1): A2437
* #msg -> ... flag: message handler of the equation field: 47 (value changed) redisplays it and rebuilds the form for the new variables
SolveEqFieldMH:
        ::                                       * A2BA2
          { BINT47                               * A2BA7
            :: 4GETLAM XLIB IFEDispField MINUSONE 4GETLAM XLIB ~gFldVal * A2BB1
              MINUSONE EQUAL ITE MINUSONE BINT1  * A2BDB
              XLIB SolveEqRebuild ;              * A2BF4
          }                                      * A2C04
          EQLookup case                          * A2C09
          :: EVAL TRUE ;                         * A2C13
          XLIB SolveEqKeyMH ;                    * A2C27

* ROMPTR 0B4 008
* refs (1): A2437
* #msg -> ... flag: message handler for keys (8), shared by the fields
SolveEqKeyMH:
        :: BINT8 #<>case FALSE                   * A2C37
          XLIB SolveEqKey ;                      * A2C4B

* ROMPTR 0B4 009
* refs (1): A2437
* #key #plane -> ...: intercepts the key that runs PlotApp while the form is up
SolveEqKey:
        :: EditExstCase FALSE 2DUP Key>U/SKeyOb ' XLIB PlotApp EQUAL * A2C5B
          NOTcaseFALSE 2DROP                     * A2C89
          ' XLIB SolveEqToPlot TrueTrue ;        * A2C93

* ROMPTR 0B4 00A
* refs (1): A2437
* -> flag: the PLOT key: saves the fields and leaves, with PlotApp as what runs next
SolveEqToPlot:
        :: TakeOver ' XLIB PlotApp ' LAM 'IE STOLAM XLIB SolveEqSave TRUE * A2CAD
          11PUTLAM FALSE ;                       * A2CEE

* ROMPTR 0B4 00B
* refs (1): A2437
* -> : VARS/MORE key: next page, or the variable order form
SolveEqVarsKey:
        :: TakeOver XLIB SolveEqPaged? LAM 'P LAM 'p #<> AND case * A2CFD
          XLIB SolveEqNextPage                   * A2D37
          XLIB SolveEqOrderForm ;                * A2D42

* ROMPTR 0B4 00C
* refs (1): A2437
* -> : "Solver Variable Order": a one-field form with a list of variables, which then become the order on show
SolveEqOrderForm:
        :: # BF0C BINT1 BINT19 'RROMPTR@ XLIB SolveEqOrderMH BINT7 BINT26 * A2D52  "Variables:"
          # 79 BINT9 BINT5                       * A2D85
          { BINT5 BINT6 } BINT4 # BF0D MINUSONE BINT4 BINT1 XLIB ~gFldVal * A2D99  "Enter order of vars to display"
          XLIB SlvEqVars LAM 'V BINT1 DUP 'DROPFALSE # BF0B BINT1 * A2DD6  "Solver Variable Order"
          XLIB ~gFldVal                          * A2E0A
          { LAM 'F } BIND DoInputForm ABND NOT?SEMI * A2E15
          DUPTYPELIST? ?SKIP ONE{}N              * A2E3E
          DUPINCOMP ZERO_DO TYPEIDNT? NcaseTYPEERR LOOP * A2E4D
          BINT1 XLIB SolveEqRebuild ;            * A2E66

* ROMPTR 0B4 00D
* refs (1): A2437
* #msg -> ... flag: choose box of the order field: 40 gives the variables, 61 turns on check marks
SolveEqOrderMH:
        ::                                       * A2E7B
          { BINT40                               * A2E80
            :: LAM 'F XLIB SlvEqVars BINT1 ; BINT61 TRUE } * A2E8A
          EQLookup case                          * A2EBE
          :: EVAL TRUE ;                         * A2EC8
          DROPFALSE ;                            * A2EDC

* ROMPTR 0B4 00E
* refs (1): A2437
* -> : shows the next page of variables, wrapping to the first, and moves to the first variable
SolveEqNextPage:
        :: LAM 'V LAM 'P #1+ LAM 'p OVER #< IT DROPONE * A2EE6
          XLIB SolveEqRebuild 14GETLAM #1<> IT   * A2F25
          :: BINT2 XLIB IFSetField ;             * A2F3F
        ;                                        * A2F59

* ROMPTR 0B4 00F
* refs (1): A2437
* -> : INFO key: a message box with the last result, from LAM I
SolveEqInfo:
        :: TakeOver LAM 'I DUP MINUSONE EQUAL casedrop DoBadKey * A2F5E
          INCOMPDROP ROT BINT4 XLIB IFDecomp $ ": " &$ ROT BINT4 * A2F8C
          XLIB IFDecomp &$ CHR_Newline >T$ SWAP&$ BINT15 BINT2 MINUSONE ' * A2FC3
          XLIB ~MsgBoxMenu XLIB ~DoMsgBox DROP SetDA123NoCh ; * A2FF6

* ROMPTR 0B4 010
* refs (1): A2437
* -> : SOLVE/EXPR= key. On the equation field it evaluates it, tagged Left and Right for an equation or Expr otherwise. On a variable field it solves for that variable, stores the value and keeps the solver's result in LAM I
SolveEqSolve:
        :: TakeOver XLIB SolveEqSave 5GETLAM #1= case * A301B
          :: BINT1 XLIB ~gFldVal XLIB SlvEvalEq ITE * A303F
            :: SWAP SolveEqSolve~1 msg>TAG SWAP SolveEqSolve~2 msg>TAG ; * A3064
            :: SolveEqSolve~3 msg>TAG ;          * A308C
            AtUserStack SetDA123NoCh ;           * A30A0
          LAM 'V XLIB SolveEqPage 5GETLAM #1- NTHCOMPDROP XLIB MWStoreItems * A30AF
          1LAMBIND XLIB SlvSolveVar 1GETABND XLIB MWStoreItems EQUAL IT * A30DF
          :: SetDA1NoCh SetDA2aNoCh ;            * A3109
          LAM 'V XLIB SolveEqPage 5GETLAM #1- NTHCOMPDROP DUP XLIB ~SAFE@ * A311D
          ?SKIP %0_2A2B4                         * A3152
          2DUP SWAP ID>TAG 3UNROLL DUP 5GETLAM XLIB ~sFldVal 5ROLL BINT3 {}N * A315C
          ' LAM 'I STOLAM SWAP NOTcasedrop ERROROUT * A3194
          AtUserStack 5GETLAM XLIB IFMarkPending ; * A31B8

* ROMPTR 0B4 011
* refs (1): A2437
* {vars} #page -> : saves the fields, sets LAM V and P, and ends the form so that SolveEqApp rebuilds it
SolveEqRebuild:
        :: XLIB SolveEqSave ' LAM 'P STOLAM ' LAM 'V STOLAM BINT0 ' LAM 'IX * A31D2
          STOLAM TRUE 11PUTLAM ;                 * A3223

* ROMPTR 0B4 012
* refs (1): A2437
* {ids} -> {$}: makes the field labels "NAME:"
SolveVarLabels:
        :: DUPNULL{}? ?SEMI                      * A3237
          INNERCOMP DUP 1LAMBIND ZERO_DO ISTOP@ ROLL ID>$ PTR CHR_: >T$ LOOP * A3246
          1GETABND {}N ;                         * A3278

* ROMPTR 0B4 013
* refs (1): A2437
* -> flag: more than 12 variables?
SolveEqPaged?:
        :: LAM 'V LENCOMP BINT12 #> ;            * A3287

* ROMPTR 0B4 014
* refs (1): A2437
* {vars} -> {vars on the current page}: the 12 of page LAM P
SolveEqPage:
        :: BINT12 DUP LAM 'P #1- #* #1+ SWAP #1- OVER #+ 3PICK LENCOMP #MIN * A32AB
          SUBCOMP ;                              * A32F7

* ROMPTR 0B4 015
* refs (1): A2437
* -> : reads all fields and stores them with SolveEqStore
SolveEqSave:
        :: XLIB GetFieldVals XLIB SolveEqStore ; * A3301

* ROMPTR 0B4 016
* refs (1): A2437
* eq values... -> : stores the page's values into their variables (skipping fields left empty, -1) and the equation into EQ
SolveEqStore:
        :: LAM 'V DUPNULL{}? casedrop XLIB SlvPutEQ * A3321
          XLIB SolveEqPage DUP LENCOMP #1+_ONE_DO * A3346
          :: ISTOP-INDEX #1+ ROLL DUP MINUSONE EQUAL caseDROP OVER * A3360
            INDEX@ NTHCOMPDROP XLIB SlvStoVar ;  * A338D
          LOOP DROP XLIB SlvPutEQ ;              * A33A7

* ROMPTR 0B4 017
* refs (1): A2437
* -> : "Solve y'(t)=f(t,y)". Fields: 1 f (non-stiff), 2 f (stiff, narrower), 3 ∂f∂y, 4 ∂f∂t, 5 Indep, 6 Init, 7 Final, 8 Soln, 9 Init, 10 Final, 11 Tol, 12 Step, 13 Stiff. On leaving, the object in LAM DE runs
SolveDiffForm:
        :: # BF0F BINT1 BINT10 # BF10 BINT37 BINT10 # BF11 BINT85 BINT10 * A33C1  "f:"  "∂f∂y:"  "∂f∂t:"
          # BF12 BINT1 BINT19 # BF13 BINT40 BINT19 # BF14 BINT85 BINT19 * A3402  "Indep:"  "Init:"  "Final:"
          # BF15 BINT1 BINT28 # BF13 BINT40 BINT28 # BF14 BINT85 BINT28 * A343E  "Soln:"  "Init:"  "Final:"
          # BF16 BINT1 BINT37 # BF17 BINT52 BINT37 # BF18 BINT113 BINT37 * A347A  "Tol:"  "Step:"  "Stiff"
          'RROMPTR@ XLIB SolveDiffF1MH BINT25 BINT8 # 67 BINT9 BINT23 * A34B6
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BF19 # BF0A MINUSONE * A34E4  "Enter function of INDEP and SOLN"  "Funcs in"
          MINUSONE MINUSONE 'RROMPTR@ XLIB SolveDiffF2MH BINT10 BINT8 BINT25 * A3525
          BINT9 BINT23                           * A354E
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BF19 # BF0A MINUSONE * A3558  "Enter function of INDEP and SOLN"  "Funcs in"
          MINUSONE MINUSONE 'RROMPTR@ XLIB SolveDiffF2MH BINT58 BINT8 BINT25 * A3599
          BINT9 BINT23                           * A35C2
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BF1A # BF0A MINUSONE * A35CC  "Enter derivative w.r.t. SOLN"  "Funcs in"
          MINUSONE MINUSONE 'RROMPTR@ XLIB SolveDiffF2MH # 6A BINT8 BINT25 * A360D
          BINT9 BINT23                           * A363B
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BF1B # BF0A MINUSONE * A3645  "Enter derivative w.r.t. INDEP"  "Funcs in"
          MINUSONE MINUSONE 'RROMPTR@ XLIB SolveDiffKeyMH BINT25 BINT17 * A3686
          BINT13 BINT9 BINT1                     * A36AA
          { BINT6 } BINT4 # BF1C MINUSONE MINUSONE 'IDX MINUSONE 'RROMPTR@ * A36B9  "Enter independent var name"
          XLIB SolveDiffKeyMH BINT58 BINT17 BINT25 BINT9 BINT1 * A36F0
          { BINT0 } BINT4 # BF1D MINUSONE MINUSONE %0_2A2B4 MINUSONE * A3714  "Enter initial indep var value"
          'RROMPTR@ XLIB SolveDiffKeyMH # 6A BINT17 BINT25 BINT9 BINT1 * A3746
          { BINT0 } BINT4 # BF1E MINUSONE MINUSONE % 6.5E0 MINUSONE * A3774  "Enter final indep var value"
          'RROMPTR@ XLIB SolveDiffKeyMH BINT25 BINT26 BINT13 BINT9 BINT1 * A37B6
          { BINT6 } BINT4 # BF1F MINUSONE MINUSONE ' ID Y MINUSONE 'RROMPTR@ * A37DF  "Enter solution var name"
          XLIB SolveDiffKeyMH BINT58 BINT26 BINT25 BINT9 BINT1 * A381F
          { BINT0 BINT3 } BINT4 # BF20 MINUSONE MINUSONE %0_2A2B4 MINUSONE * A3843  "Enter initial solution var value"
          'RROMPTR@ XLIB SolveDiffResMH # 6A BINT26 BINT25 BINT9 BINT1 * A387A
          { BINT0 BINT3 } BINT4 # BF21 MINUSONE MINUSONE MINUSONE MINUSONE * A38A8  "Press SOLVE for final soln value"
          'RROMPTR@ XLIB SolveDiffKeyMH BINT16 BINT35 BINT31 BINT9 BINT1 * A38DF
          { BINT0 } BINT4 # BF22 MINUSONE MINUSONE % 1E-4 MINUSONE 'RROMPTR@ * A3908  "Enter absolute error tolerance"
          XLIB SolveDiffStepMH # 49 BINT35 BINT25 BINT9 BINT1 * A394F
          { BINT0 } 'RROMPTR@ XLIB IFDflt$ # BF23 MINUSONE MINUSONE BINT0 * A3978  "Enter initial step size"
          MINUSONE 'RROMPTR@ XLIB SolveDiffStiffMH # 6A BINT35 BINT6 BINT9 * A39B0
          BINT32 MINUSONE MINUSONE # BF24 MINUSONE MINUSONE FALSE MINUSONE * A39DE  "Calculate stiff differential?"
          BINT12 BINT13 'RROMPTR@ XLIB SolveDiffMH # BF0E XLIB GetFirstEq * A3A0B  "Solve y'(t)=f(t,y)"
          XLIB GetDeq3 CHECKPVARS INCOMPDROP 4UNROLL3DROP ROTDROPROTDROP * A3A3A
          OVER 1get(li)? ROT XLIB PltIndepRngT 4PICK 1get(li)? 5PICK * A3A59
          XLIB DeqInitVal 6ROLL XLIB DeqTol MINUSONE SWAP BINT0 BINT9 PICK * A3A82
          MINUSONE EQUAL NOT BINT13 XLIB IFSetHelps 'NOP * A3AB6
          { LAM 'DE } BIND DoInputForm IT XLIB SolveDiffStore * A3ADA
          ' LAM 'DE undo DROP ABND EVAL ;        * A3B0B

* ROMPTR 0B4 018
* refs (1): A2437
* #msg -> ... flag: form message handler: 14 first field (depends on Stiff), 16 the menu, 5 the labels
SolveDiffMH:
        ::                                       * A3B36
          { BINT14                               * A3B3B
            :: BINT13 XLIB ~gFldVal ITE BINT2 BINT1 * A3B45
            ;                                    * A3B69
            BINT16                               * A3B6E
            :: XLIB SolveDiffMenu TRUE ; BINT5 XLIB SolveDiffLabels } * A3B73
          EQLookup case                          * A3BA2
          :: EVAL TRUE ;                         * A3BAC
          DROPFALSE ;                            * A3BC0

* ROMPTR 0B4 019
* refs (1): A2437
* Menu keys: INIT+ and SOLVE
SolveDiffMenu:
        { NullMenuKey                            * A3BCA
          { $ "INIT+" XLIB SolveDiffInit+ }      * A3BD4
          { $ "SOLVE" XLIB SolveDiffSolve } }    * A3BFD

* ROMPTR 0B4 01A
* refs (1): A2437
* #msg -> ... flag: message handler for keys (8), shared by the form's fields
SolveDiffKeyMH:
        :: BINT8 #<>case FALSE                   * A3C2B
          XLIB SolveDiffKey ;                    * A3C3F

* ROMPTR 0B4 01B
* refs (1): A2437
* #key #plane -> ...: intercepts the key that runs PlotApp
SolveDiffKey:
        :: EditExstCase FALSE 2DUP Key>U/SKeyOb ' XLIB PlotApp EQUAL * A3C4F
          NOTcaseFALSE 2DROP                     * A3C7D
          ' XLIB SolveDiffToPlot TrueTrue ;      * A3C87

* ROMPTR 0B4 01C
* refs (1): A2437
* -> flag: the PLOT key: saves the fields and leaves, with PlotApp next
SolveDiffToPlot:
        :: TakeOver ' XLIB PlotApp ' LAM 'DE STOLAM XLIB GetFieldVals * A3CA1
          XLIB SolveDiffStore TRUE 11PUTLAM FALSE ; * A3CDD

* ROMPTR 0B4 01D
* refs (1): A2437
* -> : INIT+ key: makes the final values the initial ones, to continue the solution from there
SolveDiffInit+:
        :: TakeOver BINT10 XLIB ~gFldVal MINUSONE EQUAL caseDoBadKey BINT7 * A3CFC
          XLIB ~gFldVal BINT6 XLIB ~sFldVal BINT10 XLIB ~gFldVal BINT9 * A3D2A
          XLIB ~sFldVal BINT6 XLIB IFMarkPending BINT9 XLIB IFMarkPending * A3D5A
          SetDA123NoCh ;                         * A3D85

* ROMPTR 0B4 01E
* refs (1): A2437
* -> : SOLVE key: runs the non-stiff or the stiff solver with the field values, shows the solution in Final and leaves Tolerance and Solution tagged on the stack
SolveDiffSolve:
        :: TakeOver XLIB GetFieldVals XLIB SolveDiffStore XLIB GetFieldVals * A3D8F
          4ROLL DROP SWAP DUP BINT0 EQUAL IT DROP%0b * A3DBA
          SWAP ITE                               * A3DE2
          :: BINT11 ROLL DROP XLIB DeqSolveRRK ; * A3DEC
          :: 8ROLL DROP 8ROLL DROP 8ROLL DROP XLIB DeqSolveRKF ; * A3E10
          2DUP BINT10 XLIB ~sFldVal BINT10 XLIB IFMarkPending BINT11 * A3E43
          XLIB ~sFldVal BINT11 XLIB IFMarkPending SWAP # BF26 msg>TAG SWAP * A3E6D  "Tolerance"
          # BF27 msg>TAG AtUserStack SetDA123NoCh ; * A3EA1  "Solution"

* ROMPTR 0B4 01F
* refs (1): A2437
* -> grob FALSE: message 5: draws the labels, the ∂f labels only when Stiff is on
SolveDiffLabels:
        :: BINT39 BINT131 MAKEGROB BINT1 XLIB IFDispLabel 15GETLAM #1+ * A3EBF
          XLIB SolveDiffStiff? ITE BINT2 BINT4   * A3EED
          DO INDEX@ XLIB IFDispLabel LOOP FALSE ; * A3F07

* ROMPTR 0B4 020
* refs (1): A2437
* #msg -> ... flag: non-stiff f field: hidden while Stiff is on
SolveDiffF1MH:
        :: BINT7 #=casedrop XLIB SolveDiffStiff? * A3F2B
          BINT55 OVER #<>case XLIB SolveDiffEditMH * A3F45
          DROP XLIB SolveDiffStiff? NOT TRUE ;   * A3F5F

* ROMPTR 0B4 021
* refs (1): A2437
* #msg -> ... flag: fields of stiff mode (f, ∂f∂y, ∂f∂t): hidden unless Stiff is on
SolveDiffF2MH:
        :: BINT7 #=casedrop                      * A3F7E
          :: XLIB SolveDiffStiff? NOT ;          * A3F8D
          BINT55 OVER #<>case XLIB SolveDiffEditMH * A3FA7
          DROP XLIB SolveDiffStiff? TRUE ;       * A3FC1

* ROMPTR 0B4 022
* refs (1): A2437
* #msg -> ... flag: 43 gives the editor menu keys with the variable names
SolveDiffEditMH:
        :: BINT43 OVER #<>case XLIB SolveDiffKeyMH * A3FDB
          DROP XLIB SolveDiffEditKeys TrueTrue ; * A3FFA

* ROMPTR 0B4 023
* refs (1): A2437
* -> {keys}: editor menu with the Soln and Indep names as keys
SolveDiffEditKeys:
        ::                                       * A4014
          { NullMenuKey NullMenuKey } BINT8 XLIB ~gFldVal >HCOMP BINT5 * A4019
          XLIB ~gFldVal >HCOMP ;                 * A4047

* ROMPTR 0B4 024
* refs (1): A2437
* #msg -> ... flag: the result field Final: text entered in it is dropped
SolveDiffResMH:
        :: BINT44 OVER #<>case XLIB SolveDiffKeyMH * A405C
          DROP XLIB IFEditDrop TRUE ;            * A407B

* ROMPTR 0B4 025
* refs (1): A2437
* -> : message 44 (OK in the editor) of a result field: closes the editor without using the text
IFEditDrop:
        :: EDITPARTS BINT1 #> InitEd&Modes XLIB ~8GETLAM;7GETLAM;StartMenu * A4095
          ITE SetDA1NoCh                         * A40B9
          :: SetDA1NoCh SetDA2aNoCh ;            * A40C3
        ;                                        * A40D7

* ROMPTR 0B4 026
* refs (1): A2437
* #msg -> ... flag: Step field: 41 gives the value to edit
SolveDiffStepMH:
        :: BINT41 OVER #<>case XLIB SolveDiffKeyMH * A40DC
          DROP XLIB IFEditDflt0 TRUE ;           * A40FB

* ROMPTR 0B4 027
* refs (1): A2437
* #msg -> ... flag: Stiff check field: 47 moves f to the field now shown and redraws the row
SolveDiffStiffMH:
        :: BINT47 OVER #<>case XLIB SolveDiffKeyMH * A4115
          DROP XLIB SolveDiffMoveF XLIB SolveDiffStiffDisp TRUE ; * A4134

* ROMPTR 0B4 028
* refs (1): A2437
* -> : copies f from the field just hidden to the field now shown
SolveDiffMoveF:
        :: XLIB SolveDiffStiff? DUP ITE BINT1 BINT2 * A4159
          XLIB ~gFldVal SWAP ITE BINT2 BINT1     * A417D
          XLIB ~sFldVal ;                        * A419C

* ROMPTR 0B4 029
* refs (1): A2437
* -> : blanks the row of f fields and redraws what Stiff now shows
SolveDiffStiffDisp:
        :: XLIB SolveDiffStiff? ITE              * A41AC
          :: BINT5 BINT2 BINT4 BINT1 ;           * A41C1
          :: BINT2 BINT1 2DUP ;                  * A41DF
          HARDBUFF 3UNROLL BINT8 BINT9 BLANKIT DO INDEX@ XLIB IFDispLabel * A41F8
          LOOP DROP DO INDEX@ XLIB IFMarkPending LOOP ; * A4226

* ROMPTR 0B4 02A
* refs (1): A2437
* -> flag: value of the Stiff field
SolveDiffStiff?:
        :: BINT13 XLIB ~gFldVal ;                * A424F

* ROMPTR 0B4 02B
* refs (1): A2437
* -> ob TRUE: value to edit for the current field: 0 when it shows its default
IFEditDflt0:
        :: 4GETLAM XLIB ~gFldVal DUPTYPEBINT? NOTcase TRUE * A4269
          DROP%0b TRUE ;                         * A428D

* ROMPTR 0B4 02C
* refs (1): A2437
* -> : "Solve an·x^n+...+a1·x+a0": coefficients and roots, each computed from the other
SolvePolyForm:
        :: # BF29 BINT1 BINT10 # BF2A BINT1 BINT28 'RROMPTR@ XLIB IFArrayMH * A429C  "Coefficients [ an   a1 a0 ]:"  "Roots:"
          BINT7 BINT17 # 79 BINT9 BINT1          * A42D9
          { BINT3 BINT4 } BINT4 # BF2B MINUSONE MINUSONE MINUSONE DUP * A42F7  "Enter coefficients or press SOLVE"
          'RROMPTR@ XLIB IFArrayMH BINT7 BINT35 # 79 BINT9 BINT1 * A432E
          { BINT3 BINT4 } BINT4 # BF2C MINUSONE MINUSONE MINUSONE DUP BINT2 * A435C  "Enter roots or press SOLVE"
          DUP 'RROMPTR@ XLIB SolvePolyMH # BF28 DoInputForm case2DROP ; * A4398  "Solve an·x^n+ +a1·x+a0"

* ROMPTR 0B4 02D
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
SolvePolyMH:
        :: BINT16 #<>case FALSE                  * A43C6
          XLIB SolvePolyMenu TrueTrue ;          * A43DA

* ROMPTR 0B4 02E
* refs (1): A2437
* Menu keys: SYMB and SOLVE
SolvePolyMenu:
        { NullMenuKey                            * A43EF
          { $ "SYMB" XLIB SolvePolySymb }        * A43F9
          { $ "SOLVE" XLIB SolvePolySolve } }    * A4420

* ROMPTR 0B4 02F
* refs (1): A2437
* -> : SYMB key: the polynomial as an algebraic on the stack, from the current field
SolvePolySymb:
        :: TakeOver 5GETLAM #1= ITE              * A444E
          :: BINT1 XLIB ~gFldVal XLIB PolyCoef>Sym ; * A4467
          :: BINT2 XLIB ~gFldVal XLIB PolyRoots>Sym ; * A448C
          AtUserStack SetDA123NoCh ;             * A44B1

* ROMPTR 0B4 030
* refs (1): A2437
* -> : SOLVE key: on Coefficients computes them from the roots, on Roots the reverse, and leaves the result tagged on the stack
SolvePolySolve:
        :: TakeOver 5GETLAM #1= ITE              * A44C0
          :: BINT2 XLIB ~gFldVal XLIB PolyRoots>Coef DUP BINT1 XLIB ~sFldVal * A44D9
            # BF2D ;                             * A450E  "Coefficients"
          :: BINT1 XLIB ~gFldVal XLIB PolyCoef>Roots DUP BINT2 XLIB ~sFldVal * A451D
            # BF2E ;                             * A4552  "Roots"
          5GETLAM XLIB IFMarkPending msg>TAG AtUserStack SetDA123NoCh ; * A4561

* ROMPTR 0B4 031
* refs (1): A2437
* #msg -> ... flag: field holding an array: 23 (EDIT) edits it with IFEditArray
IFArrayMH:
        :: BINT23 #<>case FALSE                  * A4585
          XLIB IFEditArray TRUE ;                * A4599

* ROMPTR 0B4 032
* refs (1): A2437
* -> : edits the current field's array in the MatrixWriter and stores the result if it was not cancelled
IFEditArray:
        :: 4GETLAM XLIB IFVal@ XLIB IFEditMatrix NOT?SEMI * A45AE
          4GETLAM XLIB ~sFldVal ;                * A45D3

* ROMPTR 0B4 033
* refs (1): A2437
* -> : "Solve System A·X=B"
SolveLinForm:
        :: # BF30 BINT1 BINT10 # BF31 BINT1 BINT19 # BF32 BINT1 BINT28 * A45E8  "A:"  "B:"  "X:"
          'RROMPTR@ XLIB SolveLinFieldMH BINT10 BINT8 BINT115 BINT9 BINT21 * A4629
          { BINT3 BINT4 } BINT4 # BF33 # BE1A MINUSONE MINUSONE DUP * A4652  "Enter coefficients matrix A"  "Arrays in"
          'RROMPTR@ XLIB IFArrayMH BINT10 BINT17 BINT115 BINT9 BINT21 * A468E
          { BINT3 BINT4 } BINT4 # BF34 # BE1A MINUSONE MINUSONE DUP * A46B7  "Enter constants or press SOLVE"  "Arrays in"
          'RROMPTR@ XLIB IFArrayMH BINT10 BINT26 BINT115 BINT9 BINT21 * A46F3
          { BINT3 BINT4 } BINT4 # BF35 # BE1A MINUSONE MINUSONE DUP BINT3 * A471C  "Enter solutions or press SOLVE"  "Arrays in"
          DUP 'RROMPTR@ XLIB SolveLinMH # BF2F DoInputForm case 3DROP * A475D  "Solve System A·X=B"
        ;                                        * A478B

* ROMPTR 0B4 034
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
SolveLinMH:
        :: BINT16 #<>case FALSE                  * A4790
          XLIB SolveLinMenu TrueTrue ;           * A47A4

* ROMPTR 0B4 035
* refs (1): A2437
* Menu keys: SOLVE, which shows on the B and X fields only
SolveLinMenu:
        { NullMenuKey NullMenuKey                * A47B9
          {                                      * A47C8
            :: TakeOver 5GETLAM #>1 ITE $ "SOLVE" NULL$ * A47CD
            ;                                    * A47FF
            XLIB SolveLinSolve }                 * A4804
        }                                        * A4814

* ROMPTR 0B4 036
* refs (1): A2437
* -> : SOLVE key: on B computes the constants from A and X, on X solves for X; the result is stored in the field and left tagged on the stack
SolveLinSolve:
        :: TakeOver 5GETLAM DUP #1= casedrop DoBadKey * A4819
          BINT1 XLIB ~gFldVal SWAP #2= ITE       * A483C
          :: BINT3 XLIB ~gFldVal XLIB ~MAT* DUP BINT2 XLIB ~sFldVal BINT2 * A485B
            XLIB IFMarkPending # BF36 ;          * A4895  "Constants"
          :: BINT2 XLIB ~gFldVal XLIB SysSolveAxB DUP BINT3 XLIB ~sFldVal * A48AF
            BINT3 XLIB IFMarkPending # BF37 ;    * A48E4  "Solutions"
          msg>TAG AtUserStack SetDA123NoCh ;     * A4903

* ROMPTR 0B4 037
* refs (1): A2437
* #msg -> ... flag: field A: 19 and 20 (around moving between fields) ask for the menu to be redrawn, since SOLVE depends on the field
SolveLinFieldMH:
        ::                                       * A4917
          { BINT20 SetDA3Bad BINT19 SetDA3Bad } EQLookup case * A491C
          :: EVAL TRUE ;                         * A4944
          XLIB IFArrayMH ;                       * A4958

* ROMPTR 0B4 038
* refs (1): A2437
* -> : "Time Value of Money": N, I%YR, PV, PMT, P/YR, FV, and payments at BEGIN or END. The fields hold the TVM variables, stored when the form ends
TVMForm:
        :: # BF38 BINT1 BINT10 # BF39 BINT61 BINT10 # BF3A BINT1 BINT19 * A4968  "N:"  "I%YR:"  "PV:"
          # BF3B BINT1 BINT28 # BF3C # 58 BINT28 # BF3D BINT1 BINT37 * A49A9  "PMT:"  "P/YR:"  "FV:"
          'DROPFALSE BINT19 BINT8 BINT25 BINT9 BINT1 * A49EA
          { BINT0 } BINT4 # BF3E MINUSONE MINUSONE %0_2A2B4 MINUSONE * A4A08  "Enter no. of payments or SOLVE"
          'DROPFALSE BINT79 BINT8 BINT37 BINT9 BINT1 * A4A3A
          { BINT0 } BINT4 # BF3F MINUSONE MINUSONE %0_2A2B4 MINUSONE * A4A58  "Enter yearly int rate or SOLVE"
          'DROPFALSE BINT19 BINT17 BINT79 BINT9 BINT1 * A4A8A
          { BINT0 } 'RROMPTR@ XLIB TvmFldFmt # BF40 MINUSONE MINUSONE * A4AA8  "Enter present value or SOLVE"
          %0_2A2B4 MINUSONE 'DROPFALSE BINT19 BINT26 BINT61 BINT9 BINT1 * A4ADB
          { BINT0 } 'RROMPTR@ XLIB TvmFldFmt # BF41 MINUSONE MINUSONE * A4B03  "Enter payment amount or SOLVE"
          %0_2A2B4 MINUSONE 'RROMPTR@ XLIB TVMFieldMH # 6D BINT26 BINT19 * A4B36
          BINT9 BINT1                            * A4B64
          { BINT0 } BINT4 # BF42 MINUSONE MINUSONE %12 MINUSONE 'DROPFALSE * A4B6E  "Enter no. of payments per year"
          BINT19 BINT35 BINT79 BINT9 BINT1       * A4BA5
          { BINT0 } 'RROMPTR@ XLIB TvmFldFmt # BF43 MINUSONE MINUSONE * A4BBE  "Enter future value or SOLVE"
          %0_2A2B4 MINUSONE 'DROPFALSE # 6D BINT35 BINT19 BINT9 BINT12 * A4BF1
          MINUSONE BINT33 # BF44 XLIB TvmBegEndItems BINT17 XLIB TvmItemEnd * A4C1E  "Choose when payments are made"
          MINUSONE BINT6 BINT7 'RROMPTR@ XLIB TVMMH # BF45 XLIB TVMGetVals * A4C4D  "Time Value of Money"
          BINT7 XLIB IFSetHelps DoInputForm NOT?SEMI * A4C81
          XLIB TVMSetVals ;                      * A4C9B

* ROMPTR 0B4 039
* refs (1): A2437
* -> N I%YR PV PMT P/YR FV end: current TVM values
TVMGetVals:
        :: XLIB TvmGetN XLIB TvmGetI%YR XLIB TvmGetPV XLIB TvmGetPMT * A4CAB
          XLIB TvmGetPYR XLIB TvmGetFV XLIB TvmGetBegEnd ; * A4CDC

* ROMPTR 0B4 03A
* refs (1): A2437
* N I%YR PV PMT P/YR FV end -> : stores the TVM values
TVMSetVals:
        :: XLIB TvmPutBegEnd XLIB TvmPutFV XLIB TvmPutPYR XLIB TvmPutPMT * A4D02
          XLIB TvmPutPV XLIB TvmPutI%YR XLIB TvmPutN ; * A4D33

* ROMPTR 0B4 03B
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
TVMMH:
        :: BINT16 #<>case FALSE                  * A4D59
          XLIB TVMMenu TrueTrue ;                * A4D6D

* ROMPTR 0B4 03C
* refs (1): A2437
* Menu keys: AMOR and SOLVE (not on P/YR or the payment timing field)
TVMMenu:
        { NullMenuKey                            * A4D82
          {                                      * A4D8C
            :: PTR DirLabel: $ "AMOR" ;          * A4D91
            :: TakeOver XLIB GetFieldVals XLIB TVMSetVals XLIB AmortForm * A4DB2
              XLIB TvmGetPV BINT3 XLIB ~sFldVal ; * A4DDD
          }                                      * A4DFD
          {                                      * A4E02
            :: TakeOver 5GETLAM DUP BINT5 #< SWAP BINT6 #= OR ITE $ "SOLVE" * A4E07
              NULL$                              * A4E52
            ;                                    * A4E57
            XLIB TVMSolveKey_A4E71 }             * A4E5C
        }                                        * A4E6C

* ROMPTR 0B4 03D
* refs (1): A2437
* -> : SOLVE key: stores the fields and solves for the current field, which it updates, leaving the value tagged on the stack
TVMSolveKey_A4E71:
        :: TakeOver 5GETLAM DUP BINT5 #= SWAP BINT7 #= OR casedrop DoBadKey * A4E71
          XLIB GetFieldVals XLIB TVMSetVals      * A4EAD
          {                                      * A4EC3
            :: XLIB TvmSolveN # BF46 ;           * A4EC8  "N"
            :: XLIB TvmSolveI%YR # BF47 ;        * A4EE7  "I%/YR"
            :: XLIB TvmSolvePV # BF48 ;          * A4F06  "PV"
            :: XLIB TvmSolvePMT # BF49 ; NOP     * A4F25  "PMT"
            :: XLIB TvmSolveFV # BF4A ; }        * A4F49  "FV"
          5GETLAM NTHCOMPDROP EVAL OVER 5GETLAM XLIB ~sFldVal 5GETLAM * A4F6D
          XLIB IFMarkPending msg>TAG AtUserStack SetDA123NoCh ; * A4F96

* ROMPTR 0B4 03E
* refs (1): A2437
* #msg -> ... flag: P/YR field: 19 and 20 (around moving between fields) ask for the menu to be redrawn, since SOLVE depends on the field
TVMFieldMH:
        ::                                       * A4FB5
          { BINT20 SetDA3Bad BINT19 SetDA3Bad } EQLookup case * A4FBA
          :: EVAL TRUE ;                         * A4FE2
          DROPFALSE ;                            * A4FF6

* ROMPTR 0B4 03F
* refs (1): A2437
* -> : "Amortize": payments to amortize, then Principal, Interest and Balance as results
AmortForm:
        :: # BF4F BINT1 BINT10 # BF50 BINT1 BINT19 # BF51 BINT1 BINT28 * A5000  "Payments:"  "Principal:"  "Interest:"
          # BF52 BINT1 BINT37 'DROPFALSE BINT43 BINT8 BINT25 BINT9 BINT1 * A5041  "Balance:"
          { BINT0 } BINT4 # BF53 MINUSONE MINUSONE XLIB TvmGetPYR DUP * A5073  "Enter no. of payments to amort"
          'RROMPTR@ XLIB AmortResMH BINT43 BINT17 BINT79 BINT9 BINT1 * A50AB
          { BINT0 } 'RROMPTR@ XLIB TvmFldFmt NULL$ MINUSONE MINUSONE * A50D4
          MINUSONE MINUSONE 'RROMPTR@ XLIB AmortResMH BINT43 BINT26 BINT79 * A5102
          BINT9 BINT1                            * A512B
          { BINT0 } 'RROMPTR@ XLIB TvmFldFmt NULL$ MINUSONE MINUSONE * A5135
          MINUSONE MINUSONE 'RROMPTR@ XLIB AmortResMH BINT43 BINT35 BINT79 * A5163
          BINT9 BINT1                            * A518C
          { BINT0 } 'RROMPTR@ XLIB TvmFldFmt NULL$ MINUSONE MINUSONE * A5196
          MINUSONE MINUSONE BINT4 DUP 'RROMPTR@ XLIB AmortMH # BF4E * A51C4  "Amortize"
          DoInputForm case 4DROP                 * A51F2
        ;                                        * A5201

* ROMPTR 0B4 040
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
AmortMH:
        :: BINT16 #<>case FALSE                  * A5206
          XLIB AmortMenu TrueTrue ;              * A521A

* ROMPTR 0B4 041
* refs (1): A2437
* Menu keys: B→PV and AMOR
AmortMenu:
        { NullMenuKey                            * A522F
          { $ "B→PV" XLIB AmortB>PV }            * A5239
          { $ "AMOR" XLIB AmortCalc } }          * A5260

* ROMPTR 0B4 042
* refs (1): A2437
* -> : B→PV key: the balance becomes the present value, to amortize the next payments
AmortB>PV:
        :: TakeOver BINT4 XLIB ~gFldVal XLIB TvmPutPV SetDA123NoCh ; * A528C

* ROMPTR 0B4 043
* refs (1): A2437
* -> : AMOR key: fills in and tags Principal, Interest and Balance for the number of payments
AmortCalc:
        :: TakeOver BINT1 XLIB ~gFldVal XLIB TvmAmort ROTDUP BINT2 * A52BB
          XLIB ~sFldVal BINT2 XLIB IFMarkPending # BF54 msg>TAG ROTDUP BINT3 * A52EA  "Principal"
          XLIB ~sFldVal BINT3 XLIB IFMarkPending # BF55 msg>TAG ROTDUP BINT4 * A531E  "Interest"
          XLIB ~sFldVal BINT4 XLIB IFMarkPending # BF56 msg>TAG AtUserStack * A5352  "Balance"
          SetDA123NoCh ;                         * A5381

* ROMPTR 0B4 044
* refs (1): A2437
* #msg -> ... flag: result fields: text entered in them is dropped
AmortResMH:
        :: BINT44 #<>case FALSE                  * A538B
          XLIB IFEditDrop TRUE ;                 * A539F

* ROMPTR 0B4 045
* refs (1): A2437
* -> : the PLOT key: the plot form for the current plot type. LAMs: PE1 and PE3 values that have no field in the current form (first dependent variable, animation or 3D data), PE2 what runs on leaving (default NOP), PX 0 to rebuild the form after the type changed, else the field to return to (-1 = none)
PlotApp:
        :: XLIB IFNotInForm MINUSONE 'NOP FALSE MINUSONE * A53B4
          { LAM 'PE1 LAM 'PE2 LAM 'PE3 LAM 'PX } BIND BEGIN XLIB PlotFormFor * A53D8
          DoInputForm LAM 'PX #0<> IT            * A5431
          :: NOT?SEMI                            * A544D
            XLIB PlotFormStore 2DROP ;           * A5457
          LAM 'PX #0= WHILE                      * A546C
* Leaving: run the object in LAM PE2 after dropping the LAMs
          :: BINT1 ' LAM 'PX STOLAM ; REPEAT ' LAM 'PE2 undo DROP ABND EVAL ; * A5483
