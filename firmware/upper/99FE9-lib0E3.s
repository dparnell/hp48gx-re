* HP 48GX ROM revision R, #99FE9-#9CFFC: Library 0E3: the Equation Library browser: its locals, subject and title screens, menus, starting the solver, and the equation viewer
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ViewTitle ViewTextKey ViewText ViewSymbKey ViewSymb ViewSto2 ViewSto1 ViewShiftKey ViewMenu ViewLam2 ViewLam1 ViewKeysText
* Follows on from the previous file (at #99FE9 in the original ROM).
        ENDLENGTH                                * 99FE9
        ENDLENGTH                                * 99FE9

        CON(5)  DOLIB                            * 99FE9  library object
        LENGTH                                   * 99FEE  length, to #9DA13
        CON(2)  0                                * 99FF3  title length

* Library 0E3: The Equation Library browser (EQNLIB, SOLVEQN): subjects, titles, equation and variable views, pictures, and the unpacking of its equations and pictures
LIB0E3:
        CON(3)  #0E3                             * 99FF5  library number
        REL(5)  LIB0E3.hash                      * 99FF8  hash table
        REL(5)  ELMessages                       * 99FFD  message table
        REL(5)  LIB0E3.link                      * 9A002  link table
        CON(5)  0                                * 9A007  config
        RPL

* ROMPTR 0E3 000
* refs (1): 99FF5
* ob -> : stores into local EL1 of the Equation Library browser
ELSto1:
        :: ' LAM 'EL1 STO ;                      * 9A00C

* ROMPTR 0E3 001
* refs (1): 99FF5
* ob -> : stores into local EL2 of the Equation Library browser
ELSto2:
        :: ' LAM 'EL2 STO ;                      * 9A02F

* ROMPTR 0E3 002
* refs (1): 99FF5
* ob -> : stores into local EL3 of the Equation Library browser
ELSto3:
        :: ' LAM 'EL3 STO ;                      * 9A052

* ROMPTR 0E3 003
* refs (1): 99FF5
* ob -> : stores into local EL4 of the Equation Library browser
ELSto4:
        :: ' LAM 'EL4 STO ;                      * 9A075

* ROMPTR 0E3 004
* refs (1): 99FF5
* ob -> : stores into local EL5 of the Equation Library browser
ELSto5:
        :: ' LAM 'EL5 STO ;                      * 9A098

* ROMPTR 0E3 005
* refs (1): 99FF5
* ob -> : stores into local EL6 of the Equation Library browser
ELSto6:
        :: ' LAM 'EL6 STO ;                      * 9A0BB

* ROMPTR 0E3 006
* refs (1): 99FF5
* ob -> : stores into local EL7 of the Equation Library browser
ELSto7:
        :: ' LAM 'EL7 STO ;                      * 9A0DE

* ROMPTR 0E3 007
* refs (1): 99FF5
* ob -> : stores into local EL8 of the Equation Library browser
ELSto8:
        :: ' LAM 'EL8 STO ;                      * 9A101

* ROMPTR 0E3 008
* refs (1): 99FF5
* ob -> : stores into local EL9 of the Equation Library browser
ELSto9:
        :: ' LAM 'EL9 STO ;                      * 9A124

* ROMPTR 0E3 009
* refs (1): 99FF5
* ob -> : stores into local EL10 of the Equation Library browser
ELSto10:
        :: ' LAM 'EL10 STO ;                     * 9A147

* ROMPTR 0E3 00A
* refs (1): 99FF5
* ob -> : stores into local EL11 of the Equation Library browser
ELSto11:
        :: ' LAM 'EL11 STO ;                     * 9A16C

* ROMPTR 0E3 00B
* refs (1): 99FF5
* ob -> : stores into local EL12 of the Equation Library browser
ELSto12:
        :: ' LAM 'EL12 STO ;                     * 9A191

* ROMPTR 0E3 00C
* refs (1): 99FF5
* EQNLIB: binds the 12 EL locals and runs screens until the done flag EL1 is set. Each screen returns the next one to run. Locals: EL1 done, EL2 and EL3 the subject and its data, EL4 the title and its data, EL5 and EL6 the title list position, EL7 and EL8 the subject list position, EL9 and EL10 the equation list position, EL11 the equation number, EL12 the number of equations
EQNLIB~1:
        :: RECLAIMDISP POLSaveUI ERRSET          * 9A1B6
          :: FALSE ZEROZERO BINT0 ONEONE ONEONE ONEONE ZEROZERO * 9A1CA
            {                                    * 9A1F2

* ROMPTR 0E3 00D
* refs (1): 99FF5
* -> ob: recalls local EL1: the local name is itself the object run
ELLam1:
              LAM 'EL1                           * 9A1F7

* ROMPTR 0E3 00E
* refs (1): 99FF5
* -> ob: recalls local EL2: the local name is itself the object run
ELLam2:
              LAM 'EL2                           * 9A206

* ROMPTR 0E3 00F
* refs (1): 99FF5
* -> ob: recalls local EL3: the local name is itself the object run
ELLam3:
              LAM 'EL3                           * 9A215

* ROMPTR 0E3 010
* refs (1): 99FF5
* -> ob: recalls local EL4: the local name is itself the object run
ELLam4:
              LAM 'EL4                           * 9A224

* ROMPTR 0E3 011
* refs (1): 99FF5
* -> ob: recalls local EL5: the local name is itself the object run
ELLam5:
              LAM 'EL5                           * 9A233

* ROMPTR 0E3 012
* refs (1): 99FF5
* -> ob: recalls local EL6: the local name is itself the object run
ELLam6:
              LAM 'EL6                           * 9A242

* ROMPTR 0E3 013
* refs (1): 99FF5
* -> ob: recalls local EL7: the local name is itself the object run
ELLam7:
              LAM 'EL7                           * 9A251

* ROMPTR 0E3 014
* refs (1): 99FF5
* -> ob: recalls local EL8: the local name is itself the object run
ELLam8:
              LAM 'EL8                           * 9A260

* ROMPTR 0E3 015
* refs (1): 99FF5
* -> ob: recalls local EL9: the local name is itself the object run
ELLam9:
              LAM 'EL9                           * 9A26F

* ROMPTR 0E3 016
* refs (1): 99FF5
* -> ob: recalls local EL10: the local name is itself the object run
ELLam10:
              LAM 'EL10                          * 9A27E

* ROMPTR 0E3 017
* refs (1): 99FF5
* -> ob: recalls local EL11: the local name is itself the object run
ELLam11:
              LAM 'EL11                          * 9A28F

* ROMPTR 0E3 018
* refs (1): 99FF5
* -> ob: recalls local EL12: the local name is itself the object run
ELLam12:
              LAM 'EL12 }                        * 9A2A0
            BIND ClrDA1IsStat ' XLIB ELSubjects BEGIN XLIB ELLam1 NOT WHILE * 9A2B6
            :: EVAL ; REPEAT ABND ClrDAsOK ;     * 9A2EA
          ERRTRAP POLResUI&Err POLRestoreUI COLA_EVAL ; * 9A30D

* ROMPTR 0E3 019
* refs (1): 99FF5
* The first screen: browses the list of subjects
ELSubjects:
        :: XLIB ELSubjMenu XLIB ELSubjKeys XLIB ELLam8 XLIB ELLam7 * 9A326
          XLIB EqTitle# ' XLIB EqSubjectNames rGETATELN DROP TOTEMPOB * 9A357
          XLIB EqSubjectNames XLIB EqSubjects# TWO{}N XLIB ELBrowse ; * 9A381

* ROMPTR 0E3 01A
* refs (1): 99FF5
* #i list -> $: the browser's text for an item of a subject or title list
ELListItem:
        :: BINT0 #=casedrop                      * 9A3AC
          :: BINT2 NTHCOMPDROP ;                 * 9A3BB
          SWAP CARCOMP GETATELN DROP ;           * 9A3CF

* ROMPTR 0E3 01B
* refs (1): 99FF5
* #i list -> $: the browser's text for a variable: its name with its description, or with its unit (SI or ENGL by flag -60), or - with UNITS off (flag -61)
ELVarItem:
        :: DUP#0=ITE                             * 9A3E8
          :: DROP BINT4 NTHCOMPDROP ;            * 9A3F2
          :: MenuRow@ BINT1 #= case              * 9A40B
            :: SWAP INCOMPDROP DROP DROP 4ROLLSWAP OVER #1-+ SWAPROT * 9A424
              XLIB ELVarName ID>$ $ ":\0A" &$ SWAPROT GETATELN DROP &$ ; * 9A451
            BINT61 UserITE                       * 9A48D
            :: SWAP BINT2 NTHCOMPDROP XLIB ELVarName ID>$ $ ": -" &$ ; * 9A497
            :: SWAP INCOMPDROP ROTROT2DROP ROTDROP 3PICK SUB$1# BINT60 * 9A4D5
              UserITE                            * 9A4FD
              :: XLIB EqUnitsEng OVER NTHCOMPDROP TYPECHAR? ITE * 9A502
                XLIB EqUnitsSI XLIB EqUnitsEng   * 9A526
              ;                                  * 9A53C
              XLIB EqUnitsSI SWAP NTHCOMPDROP EDITDECOMP$ DUP $ "1" EQUAL * 9A541
              ITE                                * 9A571
              :: DROP $ "-" ;                    * 9A576
              :: BINT4 OVERLEN$ #1- SUB$ ;       * 9A591
              3UNROLL XLIB ELVarName ID>$ $ ":\0A" &$ SWAP&$ ; * 9A5AF
          ;                                      * 9A5E1
        ;                                        * 9A5E6

* ROMPTR 0E3 01C
* refs (1): 99FF5
* #i $names -> id: picks the i-th name out of a set's string of variable codes. The code object skips #EE delimiters; the id comes from the name table ROMPTR 0E2 029
ELVarName:
        ::                                       * 9A5EB
          CODE                                   * 9A5F0  70 nibbles
            C=DAT1  A                            * 9A5FA
            D1=D1+  5                            * 9A5FD
            D=D+1   A                            * 9A600
            RSTK=C                               * 9A602
            GOSBVL  POP#                         * 9A604
            GOSBVL  SAVPTR                       * 9A60B
            A=A-1   A                            * 9A612
            C=RSTK                               * 9A614
            D1=C                                 * 9A616
            D1=D1+  8                            * 9A619
            LC(5)   #000EE                       * 9A61C
            D=C     B                            * 9A623
ELVarName.loop1:
            D1=D1+  2                            * 9A626
            C=DAT1  B                            * 9A629
            ?D=C    B                            * 9A62C
            GOYES   ELVarName.loop1              * 9A62F
            A=A-1   A                            * 9A631
            GONC    ELVarName.loop1              * 9A633
            R0=C                                 * 9A636
            GOVLNG  PUSH#LOOP                    * 9A639
          ENDCODE                                * 9A640
          ' XLIB EqVarNames rGETATELN DROP TOTEMPOB ; * 9A640

* ROMPTR 0E3 01D
* refs (1): 99FF5
* The menu of the subject screen: SI ENGL UNITS QUIT
ELSubjMenu:
        {                                        * 9A664
          {                                      * 9A669
            :: TakeOver $ "SI" BINT60 TestUserFlag NOT Box/StdLabel ; * 9A66E
            :: TakeOver BINT60 ClrUserFlag DispMenu ; } * 9A69F
          {                                      * 9A6C2
            :: TakeOver $ "ENGL" BINT60 TestUserFlag Box/StdLabel ; * 9A6C7
            :: TakeOver BINT60 SetUserFlag DispMenu ; } * 9A6F7
          {                                      * 9A71A
            :: TakeOver $ "UNITS" BINT61 TestUserFlag NOT Box/StdLabel ; * 9A71F
            :: TakeOver BINT61 DUP UserITE ClrUserFlag SetUserFlag DispMenu ; } * 9A756
          NullMenuKey NullMenuKey                * 9A788
          { $ "QUIT"                             * 9A792
            :: TakeOver XLIB ELQuit ; }          * 9A7A9
        }                                        * 9A7C8

* ROMPTR 0E3 01E
* refs (1): 99FF5
* ENTER and ON actions of the subject screen
ELSubjKeys:
        { XLIB ELOpenSubj XLIB ELQuit }          * 9A7CD

* ROMPTR 0E3 01F
* refs (1): 99FF5
* Leaves the Equation Library: sets the done flag
ELQuit:
        :: XLIB BRdone XLIB ELDone 'NOP ;        * 9A7ED

* ROMPTR 0E3 020
* refs (1): 99FF5
* ENTER on a subject: goes to the title screen
ELOpenSubj:
        :: XLIB ELLeaveBrowser ' XLIB ELTitles ; * 9A812

* ROMPTR 0E3 021
* refs (1): 99FF5
* The title screen: browses the titles of the subject
ELTitles:
        :: SWAP XLIB ELSto8 DUP XLIB ELSto7 XLIB ELTitleMenu * 9A837
          XLIB ELTitleKeys ONEONE 5ROLL DUP ' XLIB EqSubjectNames rGETATELN * 9A867
          DROP TOTEMPOB DUP XLIB ELSto2 XLIB EqSubjects ROT NTHCOMPDROP EVAL * 9A896
          DUP XLIB ELSto3 DUPTWO NTHCOMPDROP SWAP CARCOMP EVAL SWAP TWO{}N * 9A8CA
          XLIB ELBrowse ;                        * 9A8FD

* ROMPTR 0E3 022
* refs (1): 99FF5
* The menu of the title screen: SOLV EQN VARS PIC →STK EXIT
ELTitleMenu:
        {                                        * 9A90D
          { $ "SOLV"                             * 9A912
            :: TakeOver XLIB ELLeaveBrowser ' XLIB ELTitleSolve ; } * 9A929
          { $ "EQN"                              * 9A958
            :: TakeOver XLIB ELLeaveBrowser ' XLIB ELSymbScreen ; } * 9A96D
          { $ "VARS"                             * 9A99C
            :: TakeOver XLIB ELLeaveBrowser ' XLIB ELVarsScreen ; } * 9A9B3
          { $ "PIC"                              * 9A9E2
            :: TakeOver XLIB ELLeaveBrowser ' XLIB ELPicScreen ; } * 9A9F7
          { $ "→STK"                             * 9AA26
            :: TakeOver XLIB ELTitle->STK ; }    * 9AA3D
          { $ "EXIT"                             * 9AA5C
            :: TakeOver XLIB BRdone ' XLIB ELSubjects ; } * 9AA73
        }                                        * 9AAA2

* ROMPTR 0E3 023
* refs (1): 99FF5
* ENTER and ON actions of the title screen
ELTitleKeys:
        { XLIB ELOpenTitle XLIB ELQuit }         * 9AAA7

* ROMPTR 0E3 024
* refs (1): 99FF5
* ENTER on a title: goes to the equation screen
ELOpenTitle:
        :: XLIB ELLeaveBrowser ' XLIB ELTextScreen ; * 9AAC7

* ROMPTR 0E3 025
* refs (1): 99FF5
* Menu key →STK on the title screen: puts the title's equations on the stack
ELTitle->STK:
        :: XLIB ~BRRclCurRow XLIB ELLam3 BINT3 NTHCOMPDROP SWAP NTHCOMDDUP * 9AAEC
          CARCOMP CARCOMP SWAP XLIB ELSetEqs SWAP #>1 IT * 9AB1B
          :: DUPLENCOMP #1-1SWAP SUBCOMP ;       * 9AB44
          AtUserStack ;                          * 9AB5D

* ROMPTR 0E3 026
* refs (1): 99FF5
* Menu key SOLV on the title screen: starts the solver with the title's equations
ELTitleSolve:
        :: SWAPDROP XLIB ELLam3 DUP CARCOMP EVAL 3PICKSWAP GETATELN DROP * 9AB67
          3UNROLL BINT3 NTHCOMPDROP SWAP NTHCOMPDROP XLIB ELDone * 9AB9A
          XLIB ELStartSolver ;                   * 9ABBE

* ROMPTR 0E3 027
* refs (1): 99FF5
* set -> { 'eq' ... } { names }: parses the equations of a set and lists its variable names. Name z is left out
ELSetEqs:
        :: DUPTWO NTHCOMPDROP EVAL CARCOMP DUPLEN$ DUP #1+_ONE_DO OVER * 9ABCE
          INDEX@ SUB$1# ' XLIB EqVarNames rGETATELN DROP TOTEMPOB DUP ID z * 9ABFB
          EQUAL IT                               * 9AC32
          :: DROP NULL$ ;                        * 9AC3C
          3UNROLL LOOP SWAPDROP {}N SWAP CARCOMP DUP CARCOMP DUPTWO #<ITE * 9AC50
          :: #2+ NTHCOMPDROP XLIB ELParse SWAP TWO{}N ; * 9AC82
          :: BINT2 #=ITE                         * 9ACAB
            :: BINT3 NTHCOMPDROP NULL{} SWAP ;   * 9ACBA
            :: INNERCOMP DROP ROTDROP ROTDROP ; ZEROSWAP INNERDUP ZERO_DO * 9ACD8
            #1-SWAP DUPTYPECHAR? IT              * 9AD05
            :: DROP DUP #2+PICK OVER #+ #3+PICK OVER #1+ NTHCOMPDROP ; * 9AD14
            XLIB ELParse psh1& LOOP DROP DUP#2+ ROLLDROP #1+ DUP#1+ ROLLSWAP * 9AD4B
            {}N ;                                * 9AD7E
        ;                                        * 9AD88

* ROMPTR 0E3 028
* refs (1): 99FF5
* $ -> ob: expands a packed equation and parses it. A failed parse gives 'Keyword-Conflict' and shows "Keyword Conflict", to be seen if a user variable hides a name
ELParse:
        :: XLIB ELExpand palparse ?SEMI          * 9AD8D
          3DROP ERROR@ BINT1 #= caseERRJMP       * 9ADA7
          SYMBOL ID Keyword ID Conflict x- ;     * 9ADC0
          # E303 JstGetTHEMESG DISPROW1 NULL$ DISPROW2 ERRBEEP ; * 9ADFB  "Keyword Conflict"

* ROMPTR 0E3 029
* refs (1): 99FF5
* The equation screen in text form
ELTextScreen:
        :: XLIB ELEqSetup XLIB ELTextMenu XLIB ELTextKeys ROT XLIB ViewText ; * 9AE23

* ROMPTR 0E3 02A
* refs (1): 99FF5
* The equation screen in EquationWriter form
ELSymbScreen:
        :: XLIB ELEqSetup XLIB ELEqMenu XLIB ELEqKeys ROT XLIB ViewSymb ; * 9AE5E

* ROMPTR 0E3 02B
* refs (1): 99FF5
* Sets the locals for the current title's first equation
ELEqSetup:
        :: ONEONE XLIB ELSto10 XLIB ELSto9 SWAP XLIB ELSto6 DUP XLIB ELSto5 * 9AE99
          XLIB ELLam3 BINT3 NTHCOMPDROP SWAP NTHCOMDDUP XLIB ELSto4 DUP * 9AED9
          CARCOMP CARCOMP XLIB ELSto12 BINT1 XLIB ELSto11 CARCOMP ; * 9AF08

* ROMPTR 0E3 02C
* refs (1): 99FF5
* The variables screen, from the title screen
ELVarsScreen:
        :: SWAP XLIB ELSto6 DUP XLIB ELSto5 XLIB ELLam3 DUP CARCOMP * 9AF37
          DUP4UNROLL 3PICKSWAP EVAL GETATELN DROP SWAP BINT3 NTHCOMPDROP ROT * 9AF71
          NTHCOMDDUP XLIB ELSto4 DUP CARCOMP CARCOMP XLIB ELSto12 BINT1 * 9AF9E
          XLIB ELSto11 BINT2 NTHCOMPDROP EVAL BINT1 3UNROLL BINT1 4UNROLL * 9AFCD
          XLIB ELVarsMenu 5UNROLL XLIB ELVarsKeys 5UNROLL 7ROLL EVAL SWAP * 9AFFB
          INCOMPDROP BINT5 {}N XLIB ELBrowseWith ; * 9B02A

* ROMPTR 0E3 02D
* refs (1): 99FF5
* The picture screen, from the title screen
ELPicScreen:
        :: ONEONE XLIB ELSto10 XLIB ELSto9 SWAP XLIB ELSto6 DUP XLIB ELSto5 * 9B049
          XLIB ELLam3 BINT3 NTHCOMPDROP SWAP NTHCOMDDUP XLIB ELSto4 DUP * 9B089
          CARCOMP CARCOMP XLIB ELSto12 BINT1 XLIB ELSto11 BINT3 NTHCOMPDROP * 9B0B8
          EVAL XLIB ELPicMenu XLIB ELPicKeys ROT XLIB ELShowPic ; * 9B0E7

* ROMPTR 0E3 02E
* refs (1): 99FF5
* -> { }: the menu of the equation screen: SOLV EQN VARS PIC →STK EXIT; with more than one equation, NXEQ replaces EQN
ELEqMenu:
        :: XLIB ELLam12 BINT2 #<ITE              * 9B117
          {                                      * 9B131
            { $ "SOLV"                           * 9B136
              :: TakeOver XLIB ViewDone ' XLIB ELSolve ; } * 9B14D
            { $ "EQN"                            * 9B17C
              :: TakeOver XLIB ViewDone ' XLIB ELToEq ; } * 9B191
            { $ "VARS"                           * 9B1C0
              :: TakeOver XLIB ViewDone ' XLIB ELToVars ; } * 9B1D7
            { $ "PIC"                            * 9B206
              :: TakeOver XLIB ViewDone ' XLIB ELToPic ; } * 9B21B
            { $ "→STK"                           * 9B24A
              :: TakeOver XLIB ELEq->STK ; }     * 9B261
            { $ "EXIT"                           * 9B280
              :: TakeOver XLIB ViewDone ' XLIB ELExitEq ; } * 9B297
          }                                      * 9B2C6
          {                                      * 9B2CB
            { $ "SOLV"                           * 9B2D0
              :: TakeOver XLIB ViewDone ' XLIB ELSolve ; } * 9B2E7
            { $ "NXEQ"                           * 9B316
              :: TakeOver XLIB ViewDone XLIB ELNextEq DROP' XLIB ELToEq ; } * 9B32D
            { $ "VARS"                           * 9B367
              :: TakeOver XLIB ViewDone ' XLIB ELToVars ; } * 9B37E
            { $ "PIC"                            * 9B3AD
              :: TakeOver XLIB ViewDone ' XLIB ELToPic ; } * 9B3C2
            { $ "→STK"                           * 9B3F1
              :: TakeOver XLIB ELEq->STK ; }     * 9B408
            { $ "EXIT"                           * 9B427
              :: TakeOver XLIB ViewDone ' XLIB ELExitEq ; } * 9B43E
          }                                      * 9B46D
        ;                                        * 9B472

* ROMPTR 0E3 02F
* refs (1): 99FF5
* The menu of the text form: SOLV EQN VARS PIC →STK EXIT
ELTextMenu:
        {                                        * 9B477
          { $ "SOLV"                             * 9B47C
            :: TakeOver XLIB ViewDone ' XLIB ELSolve ; } * 9B493
          { $ "EQN"                              * 9B4C2
            :: TakeOver XLIB ViewDone ' XLIB ELToEq ; } * 9B4D7
          { $ "VARS"                             * 9B506
            :: TakeOver XLIB ViewDone ' XLIB ELToVars ; } * 9B51D
          { $ "PIC"                              * 9B54C
            :: TakeOver XLIB ViewDone ' XLIB ELToPic ; } * 9B561
          { $ "→STK"                             * 9B590
            :: TakeOver XLIB ELEq->STK ; }       * 9B5A7
          { $ "EXIT"                             * 9B5C6
            :: TakeOver XLIB ViewDone ' XLIB ELExitEq ; } * 9B5DD
        }                                        * 9B60C

* ROMPTR 0E3 030
* refs (1): 99FF5
* Menu key →STK on the equation and variable screens: puts the equations on the stack
ELEq->STK:
        :: XLIB ELLam4 DUP CARCOMP CARCOMP SWAP XLIB ELSetEqs SWAP #>1 IT * 9B611
          :: DUPLENCOMP #1- ONESWAP SUBCOMP ;    * 9B64F
          AtUserStack ;                          * 9B66D

* ROMPTR 0E3 031
* refs (1): 99FF5
* Moves to the next equation, wrapping round
ELNextEq:
        :: XLIB ELLam4 CARCOMP DUP CARCOMP #>1 IT * 9B677
          :: DUPTWO NTHCOMPDROP XLIB ELLam11 #1+SWAP OVER#< IT DROPONE * 9B6A0
            XLIB ELSto11 ;                       * 9B6CE
        ;                                        * 9B6DE

* ROMPTR 0E3 032
* refs (1): 99FF5
* Moves to the previous equation, wrapping round
ELPrevEq:
        :: XLIB ELLam4 CARCOMP DUP CARCOMP #>1 IT * 9B6E3
          :: DUPTWO NTHCOMPDROP XLIB ELLam11 #1- DUP #0= ITE DROP SWAPDROP * 9B70C
            XLIB ELSto11 ;                       * 9B744
        ;                                        * 9B754

* ROMPTR 0E3 033
* refs (1): 99FF5
* ENTER and ON actions of the text form, with the next and previous equation
ELTextKeys:
        {                                        * 9B759
          :: XLIB ViewDone XLIB ELTextMenu XLIB ELTextKeys XLIB ELNextEq ' * 9B75E
            XLIB ViewText ;                      * 9B794
          :: XLIB ViewDone XLIB ELDone 'NOP ;    * 9B7A4
          :: XLIB ViewDone XLIB ELTextMenu XLIB ELTextKeys XLIB ELPrevEq ' * 9B7C9
            XLIB ViewText ;                      * 9B7FF
        }                                        * 9B80F

* ROMPTR 0E3 034
* refs (1): 99FF5
* ENTER and ON actions of the EquationWriter form
ELEqKeys:
        {                                        * 9B814
          :: XLIB ViewDone XLIB ELTextMenu XLIB ELTextKeys XLIB ELLam4 * 9B819
            CARCOMP ' XLIB ViewText ;            * 9B84A
          :: XLIB ViewDone XLIB ELDone 'NOP ; }  * 9B864

* ROMPTR 0E3 035
* refs (1): 99FF5
* The two-page menu of the variables screen: SOLV EQN VARS PIC →STK EXIT, SI ENGL UNITS →VARS PURG EXIT
ELVarsMenu:
        {                                        * 9B88E
          { $ "SOLV"                             * 9B893
            :: TakeOver XLIB BRdone ' XLIB ELSolve ; } * 9B8AA
          { $ "EQN"                              * 9B8D9
            :: TakeOver XLIB ELLeaveBrowser ' XLIB ELVarsToEq ; } * 9B8EE
          { $ "VARS"                             * 9B91D
            :: TakeOver XLIB BRdone ' XLIB ELVarsAgain ; } * 9B934
          { $ "PIC"                              * 9B963
            :: TakeOver XLIB ELLeaveBrowser ' XLIB ELVarsToPic ; } * 9B978
          { $ "→STK"                             * 9B9A7
            :: TakeOver XLIB ELEq->STK ; }       * 9B9BE
          { $ "EXIT"                             * 9B9DD
            :: TakeOver XLIB BRdone ' XLIB ELExitEq ; } * 9B9F4
          {                                      * 9BA23
            :: TakeOver $ "SI" BINT60 TestUserFlag NOT Box/StdLabel ; * 9BA28
            :: TakeOver BINT60 TestUserFlag case * 9BA59
              :: BINT60 ClrUserFlag XLIB BRinverse XLIB BRDispItems * 9BA72
                XLIB BRinverse DispMenu ;        * 9BA97
            ;                                    * 9BAAC
          }                                      * 9BAB1
          {                                      * 9BAB6
            :: TakeOver $ "ENGL" BINT60 TestUserFlag Box/StdLabel ; * 9BABB
            :: TakeOver BINT60 TestUserFlag NOTcase * 9BAEB
              :: BINT60 SetUserFlag XLIB BRinverse XLIB BRDispItems * 9BB04
                XLIB BRinverse DispMenu ;        * 9BB29
            ;                                    * 9BB3E
          }                                      * 9BB43
          {                                      * 9BB48
            :: TakeOver $ "UNITS" BINT61 TestUserFlag NOT Box/StdLabel ; * 9BB4D
            :: TakeOver BINT61 DUP UserITE ClrUserFlag SetUserFlag * 9BB84
              XLIB BRinverse XLIB BRDispItems XLIB BRinverse DispMenu ; * 9BBA7
          }                                      * 9BBD2
          { $ "→VARS"                            * 9BBD7
            :: TakeOver XLIB ELLam4 XLIB EL->VARS ; } * 9BBF0
          { $ "PURG"                             * 9BC1A
            :: TakeOver XLIB ELLam4 XLIB ELPurgeVars ; } * 9BC31
          { $ "EXIT"                             * 9BC5B
            :: TakeOver XLIB BRdone ' XLIB ELExitEq ; } * 9BC72
        }                                        * 9BCA1

* ROMPTR 0E3 036
* refs (1): 99FF5
* ENTER and ON actions of the variables screen
ELVarsKeys:
        {                                        * 9BCA6
          :: XLIB BRdone XLIB ELTextMenu XLIB ELTextKeys XLIB ELLam4 CARCOMP * 9BCAB
            ' XLIB ViewText ;                    * 9BCE1
          XLIB ELQuit }                          * 9BCF6

* ROMPTR 0E3 037
* refs (1): 99FF5
* From the variables screen to the equation screen
ELVarsToEq:
        :: XLIB ELSto9 XLIB ELSto10 XLIB ELToEq ; * 9BD06

* ROMPTR 0E3 038
* refs (1): 99FF5
* Shows the variables screen at its first entry
ELVarsAgain:
        :: XLIB ELVarsMenu XLIB ELVarsKeys ONEONE XLIB ELBrowseVars ; * 9BD31

* ROMPTR 0E3 039
* refs (1): 99FF5
* From the variables screen to the picture
ELVarsToPic:
        :: XLIB ELSto9 XLIB ELSto10 XLIB ELToPic ; * 9BD61

* ROMPTR 0E3 03A
* refs (1): 99FF5
* The menu of the picture screen: SOLV EQN VARS PIC →PICT EXIT
ELPicMenu:
        {                                        * 9BD8C
          { $ "SOLV"                             * 9BD91
            :: TakeOver XLIB PicDone ' XLIB ELSolve ; } * 9BDA8
          { $ "EQN"                              * 9BDD7
            :: TakeOver XLIB PicDone ' XLIB ELToEq ; } * 9BDEC
          { $ "VARS"                             * 9BE1B
            :: TakeOver XLIB PicDone ' XLIB ELToVars ; } * 9BE32
          { $ "PIC"                              * 9BE61
            :: TakeOver XLIB PicDone ' XLIB ELToPic ; } * 9BE76
          { $ "→PICT"                            * 9BEA5
            :: TakeOver XLIB Pic->PICT ; }       * 9BEBE
          { $ "EXIT"                             * 9BEDD
            :: TakeOver XLIB PicDone ' XLIB ELExitEq ; } * 9BEF4
        }                                        * 9BF23

* ROMPTR 0E3 03B
* refs (1): 99FF5
* ENTER and ON actions of the picture screen
ELPicKeys:
        {                                        * 9BF28
          :: XLIB PicDone XLIB ELTextMenu XLIB ELTextKeys XLIB ELLam4 * 9BF2D
            CARCOMP ' XLIB ViewText ;            * 9BF5E
          :: XLIB PicDone XLIB ELDone 'NOP ; }   * 9BF78

* ROMPTR 0E3 03C
* refs (1): 99FF5
* Menu key EXIT: back to the title screen, at the title that was showing
ELExitEq:
        :: XLIB ELTitleMenu XLIB ELTitleKeys XLIB ELLam6 XLIB ELLam5 * 9BFA2
          XLIB ELLam2 XLIB ELLam3 DUPTWO NTHCOMPDROP SWAP CARCOMP EVAL SWAP * 9BFD3
          TWO{}N XLIB ELBrowse ;                 * 9C007

* ROMPTR 0E3 03D
* refs (1): 99FF5
* Menu key SOLV on the other screens: starts the solver
ELSolve:
        :: XLIB ELLam4 XLIB ELLam5 XLIB ELLam3 CARCOMP EVAL GETATELN * 9C01C
          DROPSWAP XLIB ELDone XLIB ELStartSolver ; * 9C051

* ROMPTR 0E3 03E
* refs (1): 99FF5
* Goes to the equation screen
ELToEq:
        :: XLIB ELEqMenu XLIB ELEqKeys XLIB ELLam4 CARCOMP XLIB ViewSymb ; * 9C071

* ROMPTR 0E3 03F
* refs (1): 99FF5
* Goes to the variables screen, at the saved position
ELToVars:
        :: XLIB ELVarsMenu XLIB ELVarsKeys XLIB ELLam10 XLIB ELLam9 * 9C0AC
          XLIB ELBrowseVars ;                    * 9C0DD

* ROMPTR 0E3 040
* refs (1): 99FF5
* Browses the variables of the current set
ELBrowseVars:
        :: XLIB ELLam5 XLIB ELLam3 CARCOMP EVAL DUP 3UNROLL GETATELN DROP * 9C0ED
          SWAP XLIB ELLam4 BINT2 NTHCOMPDROP EVAL INCOMPDROP BINT5 {}N * 9C126
          XLIB ELBrowseWith ;                    * 9C154

* ROMPTR 0E3 041
* refs (1): 99FF5
* Goes to the picture screen
ELToPic:
        :: XLIB ELPicMenu XLIB ELPicKeys XLIB ELLam4 BINT3 NTHCOMPDROP EVAL * 9C164
          XLIB ELShowPic ;                       * 9C199

* ROMPTR 0E3 042
* refs (1): 99FF5
* set -> : menu key →VARS: gives each variable of the set its default value (0 without units, or the unit in the SI or ENGL table), changing an existing value only to match units
EL->VARS:
        :: BINT2 NTHCOMPDROP EVAL INCOMPDROP ROTROT2DROP DUPLEN$ #1+ ONE_DO * 9C1A9
          INDEX@ 3PICK XLIB ELVarName BINT61 UserITE * 9C1D6
          :: DUPSAFE@ ITE                        * 9C1F5
            :: DUPTYPEEXT? case                  * 9C204
              :: CARCOMP SWAP XEQSTOID ;         * 9C213
              2DROP ;                            * 9C22C
            :: %0_2A2B4 SWAP XEQSTOID ;          * 9C236
          ;                                      * 9C24F
          :: OVER INDEX@ SUB$1# BINT60 UserITE   * 9C254
            :: XLIB EqUnitsEng OVER NTHCOMPDROP TYPECHAR? ITE XLIB EqUnitsSI * 9C272
              XLIB EqUnitsEng                    * 9C2A1
            ;                                    * 9C2AC
            XLIB EqUnitsSI SWAP NTHCOMPDROP SWAPDUP SAFE@ ITE * 9C2B1
            :: DUPTYPEREAL? DUP 3PICK TYPEEXT? OR NOTcase * 9C2D5
              :: 2DROP XEQSTOID ;                * 9C2F8
              4PICK TYPEREAL? ANDcase 3DROP      * 9C30C
              DUPTYPEREAL? case                  * 9C320
              :: ROT UMU> SWAPDROP UM>U SWAP XEQSTOID ; * 9C32A
              3PICK TYPEREAL? ITE                * 9C352
              :: ROTDROP CARCOMP SWAP XEQSTOID ; * 9C361
              :: CARCOMP ROT UM>U SWAP XEQSTOID ; * 9C37F
            ;                                    * 9C3A2
            XEQSTOID                             * 9C3A7
          ;                                      * 9C3AC
          LOOP 2DROP ;                           * 9C3B1

* ROMPTR 0E3 043
* refs (1): 99FF5
* set -> : as EL->VARS for starting the solver: creates missing variables and keeps existing values, converting units when they differ
ELPrepVars:
        :: BINT2 NTHCOMPDROP EVAL INCOMPDROP ROTROT2DROP DUPLEN$ #1+ ONE_DO * 9C3C0
          INDEX@ 3PICK XLIB ELVarName BINT61 UserITE * 9C3ED
          :: DUPSAFE@ ITE                        * 9C40C
            :: DUPTYPEEXT? case                  * 9C41B
              :: CARCOMP SWAP XEQSTOID ;         * 9C42A
              2DROP ;                            * 9C443
            :: %0_2A2B4 SWAP XEQSTOID ;          * 9C44D
          ;                                      * 9C466
          :: OVER INDEX@ SUB$1# BINT60 UserITE   * 9C46B
            :: XLIB EqUnitsEng OVER NTHCOMPDROP TYPECHAR? ITE XLIB EqUnitsSI * 9C489
              XLIB EqUnitsEng                    * 9C4B8
            ;                                    * 9C4C3
            XLIB EqUnitsSI SWAP NTHCOMPDROP SWAPDUP SAFE@ ITE * 9C4C8
            :: DUPTYPEREAL? DUP 3PICK TYPEEXT? OR NOTcase 4DROP * 9C4EC
              4PICK TYPEREAL? ANDcase 3DROP      * 9C514
              DUPTYPEREAL? case                  * 9C528
              :: ROT UMU> SWAPDROP UM>U SWAP XEQSTOID ; * 9C532
              3PICK TYPEREAL? ITE                * 9C55A
              :: ROTDROP CARCOMP SWAP XEQSTOID ; * 9C569
              :: U>NCQ SWAPDROP 4PICK U>NCQ ROTROT2DROP EQUAL ITE 3DROP * 9C587
                :: %%>% ROT UM>U SWAP XEQSTOID ; * 9C5B4
              ;                                  * 9C5D7
            ;                                    * 9C5DC
            XEQSTOID                             * 9C5E1
          ;                                      * 9C5E6
          LOOP 2DROP ;                           * 9C5EB

* ROMPTR 0E3 044
* refs (1): 99FF5
* set -> : menu key PURG: purges the set's variables
ELPurgeVars:
        :: BINT2 NTHCOMPDROP EVAL INCOMPDROP ROTROT2DROP DUPLEN$ #1+ ONE_DO * 9C5FA
          INDEX@ 3PICK XLIB ELVarName PURGE LOOP 2DROP ; * 9C627

* ROMPTR 0E3 045
* refs (1): 99FF5
* Shows "Starting Solver" and goes to ELRunSolver
ELStartSolver:
        :: CLEARLCD # E301 JstGetTHEMESG DISPROW4 SetDA1Valid * 9C650  "Starting Solver"
          XLIB ELRunSolver ;                     * 9C673

* ROMPTR 0E3 046
* refs (1): 99FF5
* set -> : stores the equation in EQ and starts the solver menu; a set of several equations goes to the Multiple-Equation Solver instead
ELRunSolver:
        :: DUP XLIB ELPrepVars DUP XLIB ELSetEqs SWAP CARCOMP CARCOMP BINT2 * 9C683
          #< NOTcase XLIB MESStart               * 9C6BC
          ' ID EQ XEQSTOID DROP ' DoSolvrMenu ;  * 9C6D1

* ROMPTR 0E3 047
* refs (1): 99FF5
* Takes the output of the browser and ends it
ELLeaveBrowser:
        :: XLIB ~BRoutput XLIB BRdone ;          * 9C6FA

* ROMPTR 0E3 048
* refs (1): 99FF5
* Sets the done flag EL1
ELDone:
        :: TRUE XLIB ELSto1 ;                    * 9C71A

* ROMPTR 0E3 049
* refs (1): 99FF5
* Runs the browser with ELListItem
ELBrowse:
        :: SWAP 5UNROLL RESOROMP XLIB ELListItem NULL{} XLIB ~BRbrowse ; * 9C734

* ROMPTR 0E3 04A
* refs (1): 99FF5
* Runs the browser with ELVarItem
ELBrowseWith:
        :: SWAP 5UNROLL RESOROMP XLIB ELVarItem NULL{} XLIB ~BRbrowse ; * 9C768

* ROMPTR 0E3 04B
* refs (1): 99FF5
* $ -> $': expands the packed text of an equation, in quotes. Codes below #11 stand for CONST( UBASE( IFTE( COS( SIN( rad two 2* )* newline 2- ^2 /( =( )) *(
ELExpand:
        CODE                                     * 9C79C  579 nibbles
          GOSBVL  SAVPTR                         * 9C7A6
          A=0     W                              * 9C7AD
          A=DAT1  A                              * 9C7B0
          LC(5)   #00005                         * 9C7B3
          A=A+C   A                              * 9C7BA
          D1=A                                   * 9C7BC
          A=DAT1  A                              * 9C7BF
          A=A-C   A                              * 9C7C2
          D1=D1+  5                              * 9C7C4
          ASRB                                   * 9C7C7
          C=A     A                              * 9C7CA
          C=C-1   A                              * 9C7CC
          R4=C                                   * 9C7CE
          D=C     A                              * 9C7D1
          LC(5)   #00002                         * 9C7D3
          B=C     A                              * 9C7DA
ELExpand.loop1:
          C=DAT1  B                              * 9C7DC
          LA(2)   #10                            * 9C7DF
          ?C>A    B                              * 9C7E6
          GOYES   ELExpand.L2                    * 9C7E9
          P=C     0                              * 9C7EB
          LC(16)  #5543322110111111              * 9C7EF
          P=C     0                              * 9C801
          C=0     A                              * 9C805
          CPEX    0                              * 9C807
          B=B+C   A                              * 9C80B
ELExpand.L2:
          B=B+1   A                              * 9C80D
          D1=D1+  2                              * 9C80F
          D=D-1   A                              * 9C812
          GONC    ELExpand.loop1                 * 9C814
          B=B+B   A                              * 9C817
          LC(5)   #00005                         * 9C819
          BCEX    A                              * 9C820
          C=C+B   A                              * 9C822
          R0=C                                   * 9C824
          C=C+B   A                              * 9C827
          GOSBVL  GETTEMP                        * 9C829
          AD0EX                                  * 9C830
          D0=A                                   * 9C833
          LC(5)   DOCSTR                         * 9C836
          DAT0=C  A                              * 9C83D
          D0=D0+  5                              * 9C840
          C=R0                                   * 9C843
          DAT0=C  A                              * 9C846
          GOSBVL  GETPTR                         * 9C849
          C=DAT1  A                              * 9C850
          D0=C                                   * 9C853
          D0=D0+  10                             * 9C856
          DAT1=A  A                              * 9C859
          D1=A                                   * 9C85C
          D1=D1+  10                             * 9C85F
          LC(2)   #27                            * 9C862
          DAT1=C  B                              * 9C866
          D1=D1+  2                              * 9C869
          C=R4                                   * 9C86C
          D=C     A                              * 9C86F
          LC(2)   #11                            * 9C871
          B=C     B                              * 9C875
ELExpand.loop3:
          A=DAT0  B                              * 9C878
          ?A<B    B                              * 9C87B
          GOYES   ELExpand.L4                    * 9C87E
          DAT1=A  B                              * 9C880
          D1=D1+  2                              * 9C883
          GOTO    ELExpand.L25                   * 9C886
ELExpand.L4:
          A=A-1   B                              * 9C88A
          A=A-1   B                              * 9C88D
          GONC    ELExpand.L6                    * 9C890
          LC(12)  #2854534E4F43                  * 9C893
ELExpand.loop5:
          DAT1=C  12                             * 9C8A1
          D1=D1+  12                             * 9C8A5
          GOTO    ELExpand.L25                   * 9C8A8
ELExpand.L6:
          A=A-1   B                              * 9C8AC
          GONC    ELExpand.L7                    * 9C8AF
          LC(12)  #284553414255                  * 9C8B2
          GOC     ELExpand.loop5                 * 9C8C0
ELExpand.L7:
          A=A-1   B                              * 9C8C3
          GONC    ELExpand.L8                    * 9C8C6
          LC(10)  #2845544649                    * 9C8C9
          DAT1=C  10                             * 9C8D5
          D1=D1+  10                             * 9C8D9
          GOTO    ELExpand.L25                   * 9C8DC
ELExpand.L8:
          A=A-1   B                              * 9C8E0
          GONC    ELExpand.L10                   * 9C8E3
          LC(8)   #28534F43                      * 9C8E6
ELExpand.loop9:
          DAT1=C  8                              * 9C8F0
          D1=D1+  8                              * 9C8F4
          GOTO    ELExpand.L25                   * 9C8F7
ELExpand.L10:
          A=A-1   B                              * 9C8FB
          GONC    ELExpand.L11                   * 9C8FE
          LC(8)   #284E4953                      * 9C901
          GOC     ELExpand.loop9                 * 9C90B
ELExpand.L11:
          A=A-1   B                              * 9C90E
          GONC    ELExpand.L13                   * 9C911
          LC(6)   #646172                        * 9C914
ELExpand.loop12:
          DAT1=C  6                              * 9C91C
          D1=D1+  6                              * 9C920
          GONC    ELExpand.L20                   * 9C923
ELExpand.L13:
          A=A-1   B                              * 9C926
          GONC    ELExpand.L14                   * 9C929
          LC(6)   #6F7774                        * 9C92C
          GOC     ELExpand.loop12                * 9C934
ELExpand.L14:
          A=A-1   B                              * 9C937
          GONC    ELExpand.L15                   * 9C93A
          LC(4)   #2A32                          * 9C93D
          GOC     ELExpand.loop19                * 9C943
ELExpand.L15:
          A=A-1   B                              * 9C946
          GONC    ELExpand.L16                   * 9C949
          LC(4)   #2A29                          * 9C94C
          GOC     ELExpand.loop19                * 9C952
ELExpand.L16:
          A=A-1   B                              * 9C955
          GONC    ELExpand.L17                   * 9C958
          LC(2)   #0A                            * 9C95B
          DAT1=C  B                              * 9C95F
          D1=D1+  2                              * 9C962
          GOTO    ELExpand.L25                   * 9C965
ELExpand.L17:
          A=A-1   B                              * 9C969
          GONC    ELExpand.L18                   * 9C96C
          LC(4)   #2D32                          * 9C96F
          GOC     ELExpand.loop19                * 9C975
ELExpand.L18:
          A=A-1   B                              * 9C978
          GONC    ELExpand.L21                   * 9C97B
          LC(4)   #325E                          * 9C97E
ELExpand.loop19:
          DAT1=C  4                              * 9C984
          D1=D1+  4                              * 9C988
ELExpand.L20:
          GOTO    ELExpand.L25                   * 9C98B
ELExpand.L21:
          A=A-1   B                              * 9C98F
          GONC    ELExpand.L22                   * 9C992
          LC(4)   #282F                          * 9C995
          GOC     ELExpand.loop19                * 9C99B
ELExpand.L22:
          A=A-1   B                              * 9C99E
          GONC    ELExpand.L23                   * 9C9A1
          LC(4)   #283D                          * 9C9A4
          GOC     ELExpand.loop19                * 9C9AA
ELExpand.L23:
          A=A-1   B                              * 9C9AD
          GONC    ELExpand.L24                   * 9C9B0
          LC(4)   #2929                          * 9C9B3
          GOC     ELExpand.loop19                * 9C9B9
ELExpand.L24:
          LC(4)   #282A                          * 9C9BC
          GONC    ELExpand.loop19                * 9C9C2
ELExpand.L25:
          D0=D0+  2                              * 9C9C5
          D=D-1   A                              * 9C9C8
          GOC     ELExpand.L26                   * 9C9CA
          GOTO    ELExpand.loop3                 * 9C9CD
ELExpand.L26:
          LC(2)   #27                            * 9C9D1
          DAT1=C  B                              * 9C9D5
          GOSBVL  GETPTR                         * 9C9D8
          A=DAT0  A                              * 9C9DF
          D0=D0+  5                              * 9C9E2
          PC=(A)                                 * 9C9E5
        ENDCODE                                  * 9C9E9

* ROMPTR 0E3 04C
* refs (1): 99FF5
* ob -> : stores into EN1, the equation viewer's done flag
ViewSto1:
        :: ' LAM 'EN1 STO ;                      * 9C9E9

* ROMPTR 0E3 04D
* refs (1): 99FF5
* ob -> : stores into EN2, the viewer's keys list
ViewSto2:
        :: ' LAM 'EN2 STO ;                      * 9CA0C

* ROMPTR 0E3 04E
* refs (1): 99FF5
* keys menu handler set -> ...: binds EN1 and EN2 and sets up the viewer's parameterised outer loop
ViewBegin:
        :: SWAP FALSE                            * 9CA2F
          {                                      * 9CA3E

* ROMPTR 0E3 04F
* refs (1): 99FF5
* -> ob: recalls EN2
ViewLam2:
            LAM 'EN2                             * 9CA43

* ROMPTR 0E3 050
* refs (1): 99FF5
* -> ob: recalls EN1
ViewLam1:
            LAM 'EN1 }                           * 9CA52
          BIND CLCD10 DUPDUP CARCOMP BINT2 #<ITE * 9CA66
          :: BINT2 NTHCOMPDROP SWAPDROP BINT1 ;  * 9CA84
          :: BINT2 NTHCOMPDROP SWAP BINT3 NTHCOMPDROP XLIB ELLam11 * 9CAA2
            NTHCOMPDROP SWAP ;                   * 9CACB
          DUP 5UNROLL XLIB ViewTitle 3UNROLL ClrDAsOK RESOROMP XLIB ViewMenu * 9CADA
          SWAP TrueTrue 5ROLL ONEFALSE' LAM 'EN1 ' ERRJMP POLSetUI ; * 9CB09

* ROMPTR 0E3 051
* refs (1): 99FF5
* Shows the current equation with the EquationWriter's display, scrollable
ViewSymb:
        :: ERRSET                                * 9CB40
          :: RESOROMP XLIB ViewKeysSymb 3UNROLL XLIB ViewBegin XLIB ELParse * 9CB4A
            Symb>HBuff XLIB ViewTitle POLKeyUI RECLAIMDISP ClrDAsOK ; * 9CB7A
          ERRTRAP ERRJMP ;                       * 9CB9E

* ROMPTR 0E3 052
* refs (1): 99FF5
* Shows the current equation as text, in the largest font it fits
ViewText:
        :: ERRSET                                * 9CBAD
          :: RESOROMP XLIB ViewKeysText 3UNROLL XLIB ViewBegin SWAPDROP * 9CBB7
            XLIB ELExpand ZEROOVER BEGIN DUP $ "\0A" BINT1 POS$ DUP#0<> * 9CBE1
            WHILE                                * 9CC16
            :: ROT#1+UNROT #1+ OVERLEN$ SUB$ ; REPEAT 2DROP #1+ * 9CC1B
            { BINT4 BINT4 BINT3 BINT3 BINT2 BINT2 } SWAP NTHCOMPDROP BINT7 * 9CC48
            Disp5x7 POLKeyUI ClrDAsOK ;          * 9CC7F
          ERRTRAP ERRJMP ;                       * 9CC93

* ROMPTR 0E3 053
* refs (1): 99FF5
* Draws the title line, such as "2 OF 5", and * for an equation that belongs to a set solved together
ViewTitle:
        :: DUP#1= ITE DROPNULL$                  * 9CCA2
          :: UNCOERCE XLIB ELLam11 UNCOERCE EDITDECOMP$ # E302 JstGetTHEMESG * 9CCB6  " OF "
            &$SWAP EDITDECOMP$ &$ ;              * 9CCE4
          XLIB ELLam12 DUP#1= ITE                * 9CCF8
          :: DROP $ " *" &$ ;                    * 9CD0D
          :: #3= IT                              * 9CD2F
            :: XLIB ELLam4 CARCOMP BINT4 NTHCOMPDROP XLIB ELLam11 * 9CD3E
              NTHCOMPDROP TYPECHAR? ?SKIP        * 9CD68
              :: $ " *" &$ ;                     * 9CD77
            ;                                    * 9CD94
          ;                                      * 9CD99
          $>grob ZEROZERO ROT XYGROBDISP ;       * 9CD9E

* ROMPTR 0E3 054
* refs (1): 99FF5
* Display routine: redraws the menu when needed
ViewMenu:
        :: DA3OK? ?SKIP                          * 9CDB7
          :: DispMenu SetDA3Valid ;              * 9CDC6
        ;                                        * 9CDDA

* ROMPTR 0E3 055
* refs (1): 99FF5
* Sets the done flag EN1
ViewDone:
        :: TRUE XLIB ViewSto1 ;                  * 9CDDF

* ROMPTR 0E3 056
* refs (1): 99FF5
* Hard keys of ViewSymb, by plane
ViewKeysSymb:
        :: BINT1 #=casedrop XLIB ViewSymbKey     * 9CDF9
          BINT3 #=casedrop XLIB ViewShiftKey     * 9CE13
          2DROP 'DoBadKeyT ;                     * 9CE28

* ROMPTR 0E3 057
* refs (1): 99FF5
* Hard keys of ViewText, by plane
ViewKeysText:
        :: BINT1 #=casedrop XLIB ViewTextKey     * 9CE37
          BINT3 #=casedrop XLIB ViewShiftKey     * 9CE51
          2DROP 'DoBadKeyT ;                     * 9CE66

* ROMPTR 0E3 058
* refs (1): 99FF5
* Unshifted keys of ViewText: up, down, ENTER and ON
ViewTextKey:
        :: BINT11 ?CaseRomptr@ XLIB ViewPrev BINT17 ?CaseRomptr@ * 9CE75
          XLIB ViewEnter BINT40 #=casedrpfls BINT25 * 9CE99
          ?CaseRomptr@ XLIB ViewEnter BINT45 ?CaseRomptr@ XLIB ViewCancel * 9CEB3
          BINT7 #<case FALSE                     * 9CED8
          'DoBadKeyT ;                           * 9CEE7

* ROMPTR 0E3 059
* refs (1): 99FF5
* Unshifted keys of ViewSymb: arrows scroll
ViewSymbKey:
        :: BINT11 ?CaseKeyDef SCROLLUP BINT17 ?CaseKeyDef SCROLLDOWN BINT16 * 9CEF1
          ?CaseKeyDef SCROLLLEFT BINT18 ?CaseKeyDef SCROLLRIGHT BINT40 * 9CF19
          #=casedrpfls BINT25                    * 9CF37
          ?CaseRomptr@ XLIB ViewEnter BINT45 ?CaseRomptr@ XLIB ViewCancel * 9CF41
          BINT7 #<case FALSE                     * 9CF66
          'DoBadKeyT ;                           * 9CF75

* ROMPTR 0E3 05A
* refs (1): 99FF5
* Right-shifted keys: arrows jump to the edges
ViewShiftKey:
        :: BINT11 ?CaseKeyDef JUMPTOP BINT17 ?CaseKeyDef JUMPBOT BINT16 * 9CF7F
          ?CaseKeyDef JUMPLEFT BINT18 ?CaseKeyDef JUMPRIGHT BINT45 * 9CFA7
          #=casedrpfls DROP                      * 9CFC5
          'DoBadKeyT ;                           * 9CFCF

* ROMPTR 0E3 05B
* refs (1): 99FF5
* ENTER: runs the first action of the keys list
ViewEnter:
        :: TakeOver XLIB ViewLam2 CARCOMP COLA_EVAL ; * 9CFD9
