* HP 48GX ROM revision R, #D79FD-#D9A50: Input forms: field movement, decompiling a value, pictures, alerts, validation, and access to the locals of labels and fields
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~sFldVal ~nNullBind ~grobCheckKey ~grobAlertIcon ~gFldVal TitleBar$>Grob SetFieldVals PUT2LAM NTHEval3 NTHEval2 NTHEval1 InForm?
* Follows on from the previous file (at #D79FD in the original ROM).
        RPL

* ROMPTR 0B0 063
* refs (1): D49CE
* Moves right to the end of the row.
IFGoRowEnd:
        :: TakeOver 5GETLAM DUP BEGIN XLIB IFNextField 2DUP #< WHILE * D79FD
          :: SWAPDROP DUP ; REPEAT DROP XLIB IFGoTo ; * D7A30

* ROMPTR 0B0 064
* refs (1): D49CE
* Up arrow, with key repeat.
IFGoAbove:
        :: TakeOver REPEATERCH BINT11            * D7A5E
          :: 5GETLAM XLIB IFFieldAbove XLIB IFGoTo ; ; * D7A72

* ROMPTR 0B0 065
* refs (1): D49CE
* Down arrow, with key repeat.
IFGoBelow:
        :: TakeOver REPEATERCH BINT17            * D7A9C
          :: 5GETLAM XLIB IFFieldBelow XLIB IFGoTo ; ; * D7AB0

* ROMPTR 0B0 066
* refs (1): D49CE
* Right arrow, with key repeat.
IFRightKey:
        :: TakeOver REPEATERCH BINT18 XLIB IFGoNext ; * D7ADA

* ROMPTR 0B0 067
* refs (1): D49CE
* Moves to the next field.
IFGoNext:
        :: 5GETLAM XLIB IFNextField XLIB IFGoTo ; * D7AFE

* ROMPTR 0B0 068
* refs (1): D49CE
* Left arrow, with key repeat.
IFLeftKey:
        :: TakeOver REPEATERCH BINT16 XLIB IFGoPrev ; * D7B23

* ROMPTR 0B0 069
* refs (1): D49CE
* Moves to the previous field.
IFGoPrev:
        :: 5GETLAM XLIB IFPrevField XLIB IFGoTo ; * D7B47

* ROMPTR 0B0 06A
* refs (1): D49CE
* +/-: flips a check field, or moves a choose field to its next choice.
IFPlusMinus:
        :: TakeOver 5GETLAM DUP XLIB IFCheck? casedrop XLIB IFKeyCheck * D7B6C
          XLIB IFCycle? NOTcase DoBadKey         * D7B9B
          REPEATERCH BINT26 XLIB IFCycle ;       * D7BB0

* ROMPTR 0B0 06B
* refs (1): D49CE
* #field -> : makes a field the current one, sending the exit and enter messages, and rebuilds the menu row if the new field's kind is different.
IFSetField:
        :: 5GETLAM 2DUP #=case 2DROP             * D7BCA
          2DUP XLIB IFExitField DUP 5PUTLAM XLIB ~BINT20;IFECallFieldMH;DROP * D7BE3
          XLIB IFMenuForField ;                  * D7C08

* ROMPTR 0B0 06C
* refs (1): D49CE
* After a field is entered: moves on, redrawing the highlight.
IFEnterNext:
        :: 5GETLAM DUP XLIB IFAfterEnter 2DUP #=case 2DROP * D7C18
          DUP XLIB IFSetField SWAP XLIB IFFieldOn XLIB IFFieldOff ; * D7C41

* ROMPTR 0B0 06D
* refs (1): D49CE
* {} ob -> {} #pos: finds the object in the choices. Not found, it is added at the front.
IFFindChoice:
        :: DUPROT XLIB IFVal@ NOTcasedrop BINT0  * D7C71
          DUP4UNROLL '                           * D7C90
          :: ?ROMPTR@ SWAP ?ROMPTR@ EQUAL ; POSCOMP DUP#0<> case ROTDROP * D7C9A
          DROPSWAP >HCOMP BINT1 ;                * D7CCC

* ROMPTR 0B0 06E
* refs (1): D49CE
~MenuDef@;8GETLAM;EQUAL:
        :: MenuDef@ 8GETLAM EQUAL ;              * D7CE0

* ROMPTR 0B0 06F
* refs (1): D49CE
* $ #width -> $' flag: cuts the string to fit the width in pixels, keeping the start and adding "...". flag is TRUE if it fitted.
$FitLeft:
        :: BINT0 3UNROLL DUP #6- BINT0 4PICK LEN$ #1+_ONE_DO 4PICK INDEX@ * D7CF9
          DUP SUB$ XLIB ~$>grob;GROBDIMw #+ 2DUP #< IT * D7D30
          :: 5PICK #0<> ?SEMI                    * D7D59
            5ROLLDROP INDEX@ #1- 5UNROLL ;       * D7D6D
          DUP 4PICK #> IT ExitAtLOOP             * D7D86
          LOOP SWAPDROP #< NOTcase               * D7D9F
          :: SWAPDROP TRUE ;                     * D7DB3
          BINT1 ROT SUB$ CHR_... >T$ FALSE ;     * D7DC7

* ROMPTR 0B0 070
* refs (1): D49CE
* $ #width -> $' flag: cuts the string to fit the width in pixels, keeping the end with "..." in front.
$FitRight:
        :: BINT0 3UNROLL DUP #6- BINT0 4PICK LEN$ ZERO_DO 4PICK ISTOP-INDEX * D7DEA
          DUP SUB$ XLIB ~$>grob;GROBDIMw #+ 2DUP #< IT * D7E21
          :: 5PICK #0<> ?SEMI                    * D7E4A
            5ROLLDROP ISTOP-INDEX #1+ 5UNROLL ;  * D7E5E
          DUP 4PICK #> IT ExitAtLOOP             * D7E77
          LOOP SWAPDROP #< NOTcase               * D7E90
          :: SWAPDROP TRUE ;                     * D7EA4
          DUPUNROT LEN$ SUB$ CHR_... >H$ FALSE ; * D7EB8

* ROMPTR 0B0 071
* refs (1): D49CE
~$>grob;GROBDIMw:
        :: $>grob GROBDIMw ;                     * D7EDB

* ROMPTR 0B0 072
* refs (1): D49CE
* #field -> #next TRUE | FALSE: next field number, FALSE at the end.
IFNext#:
        :: DUP MINUSONE #= IT DROPZERO           * D7EEF
          #1+ DUP 14GETLAM #>ITE DROPFALSE TRUE ; * D7F0D

* ROMPTR 0B0 073
* refs (1): D49CE
* #field -> #prev TRUE | FALSE: previous field number, FALSE at the start.
IFPrev#:
        :: DUP MINUSONE #=ITE                    * D7F30
          :: DROP 14GETLAM ; #1- DUP#0=ITE DROPFALSE TRUE ; * D7F44

* ROMPTR 0B0 074
* refs (1): D49CE
* ob #dec -> $: decompiles a value according to the field's decompile code: 1 for none, 2 in the current format, 4 in standard format, 8 for its first character, 16 or 32 first taking element 1 or 2 of a list. A code that isn't a number is a program to run.
IFDecomp:
        :: DUPTYPEBINT? NOTcase EVAL             * D7F71
          SWAP                                   * D7F85
          :: OVER BINT16 #AND #0<> case          * D7F8A
            :: BINT1 NTHCOMPROM@ ;               * D7FA8
            OVER BINT32 #AND #0<> case           * D7FBC
            :: BINT2 NTHCOMPROM@ ;               * D7FD5
          ;                                      * D7FE9
          DUP MINUSONE EQUAL case2drop NULL$     * D7FEE
          ~DUPTYPEBINT?;case;JstGetTHEMESG       * D8007
          :: OVER BINT1 #AND #0<> case DUP       * D800C
            OVER BINT4 #AND #0<> case            * D802F
            :: DUP XLIB Decomp1Std ;             * D8048
            OVER BINT2 #AND #0<> case            * D8062
            :: DUP XLIB Decomp1Line ;            * D807B
          ;                                      * D8095
          3PICK BINT8 #AND #0<> IT               * D809A
          :: ONEONE SUB$ ;                       * D80B3
          ROTROT2DROP ;                          * D80C7

* ROMPTR 0B0 075
* refs (1): D49CE
* ob -> $: decompiles with STD format, restoring the format even after an error.
Decomp1Std:
        :: savefmt1 ERRSET XLIB Decomp1Line ERRTRAP * D80D1
          :: rstfmt1 ERRJMP ; rstfmt1 ;          * D80F0

* ROMPTR 0B0 076
* refs (1): D49CE
* ob -> $: decompiles to fit 23 characters; a name gives its text.
Decomp1Line:
        :: DUPTYPEIDNT? case DECOMP$             * D810E
          BINT23 !DcompWidth 1stkdecomp$w ;      * D8122

* ROMPTR 0B0 077
* refs (1): D49CE
* #field -> ...: the arguments for the variable browser of a type 16 field.
IFFilterArgs:
        :: DUP XLIB IFFldChoices@ DUPTYPELIST? NOTcase * D8136
          :: FALSE ROT XLIB IFFldTypes@ TRUE ;   * D8155
          INNERCOMP BINT2 #=case                 * D8179
          :: ROT XLIB IFFldTypes@ TRUE ;         * D8188
          5ROLL DROP ;                           * D81A7

* ROMPTR 0B0 078
* refs (1): D49CE
* #field -> ob TRUE | FALSE: the field's value, FALSE when it has none.
IFVal@:
        :: XLIB ~gFldVal DUP MINUSONE EQUALNOTcase TRUE * D81B6
          DROPFALSE ;                            * D81DA

* ROMPTR 0B0 079
* refs (1): D49CE
* #field -> flag: has the field no value?
IFNoVal?:
        :: XLIB ~gFldVal MINUSONE EQUAL ;        * D81E4

* ROMPTR 0B0 07A
* refs (1): D49CE
* #field -> {} TRUE | FALSE: the list of allowed types, FALSE when any is.
IFTypes@:
        :: XLIB IFFldTypes@ MINUSONE #=casedrop FALSE * D8203
          TRUE ;                                 * D8222

* ROMPTR 0B0 07B
* refs (1): D49CE
* #field -> {}: the field's choices.
IFChoices@:
        :: XLIB IFFldChoices@ ;                  * D822C

* ROMPTR 0B0 07C
* refs (1): D49CE
* #field -> #: how to show the field's choices.
IFChDec@:
        :: XLIB IFFldChDec@ ;                    * D8241

* ROMPTR 0B0 07D
* refs (1): D49CE
* #field -> ob TRUE | FALSE: the reset value, FALSE when there is none.
IFReset@:
        :: XLIB IFFldReset@ DUP MINUSONE EQUALcase DROPFALSE * D8256
          TRUE ;                                 * D827A

* ROMPTR 0B0 07E
* refs (1): D49CE
* A 6 x 9 check box.
IFCheckGrob1:
        GROB    "images/D8284-IFCheckGrob1.png"  * D8284  6 x 9

* ROMPTR 0B0 07F
* refs (1): D49CE
* Picture of a check field that is set.
IFCheckOn:
        GROB    "images/D82AA-IFCheckOn.png"     * D82AA  6 x 9

* ROMPTR 0B0 080
* refs (1): D49CE
* A 6 x 9 check box.
IFCheckGrob2:
        GROB    "images/D82D0-IFCheckGrob2.png"  * D82D0  6 x 9

* ROMPTR 0B0 081
* refs (1): D49CE
* Inverted picture of a set check field.
IFCheckOnInv:
        GROB    "images/D82F6-IFCheckOnInv.png"  * D82F6  6 x 9

* ROMPTR 0B0 082
* refs (1): D49CE
* Picture of a check field that is clear.
IFCheckOff:
        GROB    "images/D831C-IFCheckOff.png"    * D831C  6 x 9

* ROMPTR 0B0 083
* refs (1): D49CE
* Inverted picture of a clear check field.
IFCheckOffInv:
        GROB    "images/D8342-IFCheckOffInv.png" * D8342  6 x 9

* ROMPTR 0B0 084
* refs (1): D49CE
* A 6 x 9 check box.
IFCheckGrob3:
        GROB    "images/D8368-IFCheckGrob3.png"  * D8368  6 x 9

* ROMPTR 0B0 085
* refs (1): D49CE
~grobAlertIcon:
        GROB    "images/D838E-_grobAlertIcon.png" * D838E  9 x 9

* ROMPTR 0B0 086
* refs (1): D49CE
~grobCheckKey:
        GROB    "images/D83C6-_grobCheckKey.png" * D83C6  21 x 8

* ROMPTR 0B0 087
* refs (1): D49CE
* The 131 x 7 background of a title line.
IFTitleBar:
        GROBW   "images/D840A-IFTitleBar.png" 131 * D840A  131 x 7; the padding (gray) is not zero

* ROMPTR 0B0 088
* refs (1): D49CE
* #field -> flag: type bit 1: can be edited.
IFText?:
        :: XLIB IFFldType@ BINT1 #AND #0<> ;     * D850C

* ROMPTR 0B0 089
* refs (1): D49CE
* #field -> flag: type bit 2: the edit starts in algebraic mode.
IFAlg?:
        :: XLIB IFFldType@ BINT2 #AND #0<> ;     * D8530

* ROMPTR 0B0 08A
* refs (1): D49CE
* #field -> flag: type bit 4: has a choose box.
IFChoose?:
        :: XLIB IFFldType@ BINT4 #AND #0<> ;     * D8554

* ROMPTR 0B0 08B
* refs (1): D49CE
* #field -> flag: type bit 8: choices can be cycled.
IFCycle?:
        :: XLIB IFFldType@ BINT8 #AND #0<> ;     * D8578

* ROMPTR 0B0 08C
* refs (1): D49CE
* #field -> flag: type bit 16: chooses with the variable browser.
IFFilter?:
        :: XLIB IFFldType@ BINT16 #AND #0<> ;    * D859C

* ROMPTR 0B0 08D
* refs (1): D49CE
* #field -> flag: is it a check field, type 32?
IFCheck?:
        :: XLIB IFFldType@ BINT32 #= ;           * D85C0

* ROMPTR 0B0 08E
* refs (1): D49CE
* ob -> : shows "Invalid object type" with the value in the edit line. The TYPES key of the alert goes to the form's types.
IFBadType:
        :: EDITDECOMP$ InitEdLine EditString DispEditRows SetPrgmEntry * D85DF
          SetDA2bValid # B914 ' XLIB IFBadTypeMenu XLIB AlertMenu * D85FD  "Invalid object type"
          IFRedrawAll case SetDA2bEdit           * D8627
          5GETLAM XLIB IFKeyTypes SetDA2bEdit ;  * D8636

* ROMPTR 0B0 08F
* refs (1): D49CE
* The menu of that alert: TYPES and OK.
IFBadTypeMenu:
        :: NoExitAction                          * D8650
          {                                      * D865A
            { $ "TYPES"                          * D865F
              :: TakeOver XLIB DoMKeyOK DROPFALSE ; } * D8678
            NullMenuKey NullMenuKey NullMenuKey NullMenuKey * D869C
            { $ "OK"                             * D86B0
              :: TakeOver XLIB DoMKeyOK ; }      * D86C3
          }                                      * D86E2
        ;                                        * D86E7

* ROMPTR 0B0 090
* refs (1): D49CE
* ob -> : shows "Invalid object value" with the value in the edit line.
IFBadValue:
        :: EDITDECOMP$ InitEdLine EditString DispEditRows SetPrgmEntry * D86EC
          SetDA2bValid # B915 XLIB DoAlert SetDA2bEdit IFRedrawAll ; * D870A  "Invalid object value"

* ROMPTR 0B0 091
* refs (1): D49CE
DoAlert:
        :: BINT13 BINT5 XLIB ~grobAlertIcon ' XLIB ~MsgBoxMenu ERRBEEP * D8733
          XLIB ~DoMsgBox DROP SetDA123NoCh ;     * D8762

* ROMPTR 0B0 092
* refs (1): D49CE
* $ menu -> flag: as DoAlert, with its own menu; returns the flag of the message box.
AlertMenu:
        :: BINT13 BINT5 XLIB ~grobAlertIcon 4ROLL ERRBEEP XLIB ~DoMsgBox * D877C
          SetDA123NoCh ;                         * D87AB

* ROMPTR 0B0 093
* refs (1): D49CE
* Blanks the help area, whose height follows the lines in the edit.
IFClearHelp:
        :: BINT7 BINT39 EDITPARTS BINT4 #MIN BINT1 #MAX #1- #10* #- BLANKIT ; * D87B5

* ROMPTR 0B0 094
* refs (1): D49CE
~BINT46;BINT10;BLANKIT:
        :: BINT46 BINT10 BLANKIT ;               * D87F6

* ROMPTR 0B0 095
* refs (1): D49CE
* #field -> : moves to a field and turns the highlight over to it.
IFGoTo:
        ::                                       * D880F
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; 5GETLAM 2DUP #= case2drop * D8814
          SetDA2bNoCh                            * D8841
          OVER XLIB IFSetField XLIB IFFieldOn XLIB IFFieldOff ; * D8846

* ROMPTR 0B0 096
* refs (1): D49CE
* ob #field -> TRUE | ob' FALSE: checks type and value, and stores the value. On failure it leaves an action for the alert.
IFValidate:
        :: 2DUP XLIB IFTypeOK? NOTcasedrop       * D8871
          :: ' ' SWAP ' XLIB IFBadType BINT3 ::N FALSE ; * D888B
          2DUP XLIB IFValueOK? NOTcasedrop       * D88C3
          :: ' ' SWAP ' XLIB IFBadValue BINT3 ::N FALSE ; * D88D8
          XLIB ~sFldVal TRUE ;                   * D8910

* ROMPTR 0B0 097
* refs (1): D49CE
* Finds the first field for display, once.
IFFirst#:
        :: 10GETLAM DUP MINUSONE EQUAL NOT?SEMI  * D8925
          DROP XLIB IFLabelsGrob NOT?SEMI        * D8943
          DUP 10PUTLAM ;                         * D8958

* ROMPTR 0B0 098
* refs (1): D49CE
~BINT1;NTHCOMPROM@:
        :: BINT1 NTHCOMPROM@ ;                   * D8967

* ROMPTR 0B0 099
* refs (1): D49CE
~BINT2;NTHCOMPROM@:
        :: BINT2 NTHCOMPROM@ ;                   * D897B

* ROMPTR 0B0 09A
* refs (1): D49CE
~BINT3;NTHCOMPROM@:
        :: BINT3 NTHCOMPROM@ ;                   * D898F

* ROMPTR 0B0 09B
* refs (1): D49CE
* {} -> ...: evaluates element 1 of the list.
NTHEval1:
        :: XLIB ~BINT1;NTHCOMPROM@ EVAL ;        * D89A3

* ROMPTR 0B0 09C
* refs (1): D49CE
* {} -> ...: evaluates element 2 of the list.
NTHEval2:
        :: XLIB ~BINT2;NTHCOMPROM@ EVAL ;        * D89BD

* ROMPTR 0B0 09D
* refs (1): D49CE
* {} -> ...: evaluates element 3 of the list.
NTHEval3:
        :: XLIB ~BINT3;NTHCOMPROM@ EVAL ;        * D89D7

* ROMPTR 0B0 09E
* refs (1): D49CE
* $ #... -> #n TRUE | FALSE: search for the next choice that starts with a letter, with wrapping to the start of the list.
IFFindNext:
        :: 4PICK #0=case                         * D89F1
          :: 5DROP FALSE ;                       * D8A00
          XLIB BBChrUpper 5ROLL SWAP FALSE 3UNROLL 6PICK #1+ 5PICK 2DUP #> * D8A14
          ITE                                    * D8A4C
          :: DO INDEX@ 3PICK EVAL 6PICK XLIB IFDecomp XLIB BBFirstAlnum * D8A51
            XLIB BBChrUpper OVER EQUAL IT        * D8A85
            :: DROP INDEX@ ROTDROP TRUE 3UNROLL ExitAtLOOP ; * D8A9F
            LOOP ;                               * D8AC7
          2DROP                                  * D8AD1
          3PICK case                             * D8AD6
          :: 6UNROLL 5DROP TRUE ;                * D8AE0
          4PICK BINT1 2DUP #> ITE                * D8AF9
          :: DO INDEX@ 3PICK EVAL 6PICK XLIB IFDecomp XLIB BBFirstAlnum * D8B12
            XLIB BBChrUpper OVER EQUAL IT        * D8B46
            :: DROP INDEX@ ROTDROP TRUE 3UNROLL ExitAtLOOP ; * D8B60
            LOOP ;                               * D8B88
          2DROP                                  * D8B92
          ROT case                               * D8B97
          :: 5UNROLL 4DROP TRUE ;                * D8BA1
          5DROP FALSE ;                          * D8BBA

* ROMPTR 0B0 09F
* refs (1): D49CE
* #field -> flag: does the field still need drawing?
IFDone?:
        :: 9GETLAM SWAP #1+ NTHCOMPDROP NOT ;    * D8BC9

* ROMPTR 0B0 0A0
* refs (1): D49CE
~9GETLAM;CARCOMP;NOT:
        :: 9GETLAM CARCOMP NOT ;                 * D8BEC

* ROMPTR 0B0 0A1
* refs (1): D49CE
* #field -> : marks the field as drawn.
IFMarkDone:
        :: TRUE SWAP #1+ 9GETLAM PUTLIST DUP INCOMPDROP 14GETLAM #1- DUP#0<> * D8C05
          ITE                                    * D8C3C
          :: ZERO_DO AND LOOP ; DROP             * D8C41
          SWAPDROP BINT1 ROT PUTLIST 9PUTLAM ;   * D8C5F

* ROMPTR 0B0 0A2
* refs (1): D49CE
* #field -> : marks the field as to be drawn.
IFMarkPending:
        :: FALSE SWAP #1+ 9GETLAM PUTLIST FALSE BINT1 ROT PUTLIST 9PUTLAM ; * D8C7D

* ROMPTR 0B0 0A3
* refs (1): D49CE
* Marks all fields as drawn.
IFAllDone:
        :: TRUE 14GETLAM #1+_ONE_DO DUP LOOP 14GETLAM #1+ {}N 9PUTLAM ; * D8CB9

* ROMPTR 0B0 0A4
* refs (1): D49CE
* Marks all fields as to be drawn.
IFAllPending:
        :: FALSE 14GETLAM #1+_ONE_DO DUP LOOP 14GETLAM #1+ {}N 9PUTLAM ; * D8CF0

* ROMPTR 0B0 0A5
* refs (1): D49CE
* $ -> grob: draws a title on the title bar, centred. Library 0B2, the browser and the choose box use it as well.
TitleBar$>Grob:
        :: $>grob BINT7 OVER GROBDIMw #3+ MAKEGROB SWAP OVER BINT2 BINT1 * D8D27
          GROB! XLIB IFTitleBar TOTEMPOB DUP 3UNROLL BINT65 3PICK GROBDIMw * D8D5E
          #2/ #- BINT0 GROB! ;                   * D8D8C

* ROMPTR 0B0 0A6
* refs (1): D49CE
* #old #new -> : rebuilds the menu row if the two fields differ in kind.
IFMenuForField:
        :: DUP MINUSONE #= case2drop             * D8DA5
          :: SetThisRow SetDA3Bad ;              * D8DBE
          XLIB IFFldType@ BINT37 #AND SWAP XLIB IFFldType@ BINT37 #AND #= * D8DD2
          ?SEMI                                  * D8E06
          SetThisRow SetDA3Bad ;                 * D8E0B

* ROMPTR 0B0 0A7
* refs (1): D49CE
~8GETLAM;7GETLAM;StartMenu:
        :: 8GETLAM 7GETLAM StartMenu ;           * D8E1A

* ROMPTR 0B0 0A8
* refs (1): D49CE
* Remembers the menu row and shows the edit menu.
IFStartEditMenu:
        :: MenuRow@ 7PUTLAM 5GETLAM XLIB IFEditFldMenu BINT1 StartMenu ; * D8E33

* ROMPTR 0B0 0A9
* refs (1): D49CE
* {} -> : shows the list of types and takes the first choice.
IFTypeChoose:
        :: ' DROPFALSE NULL$ BINT17 4ROLL BINT1 XLIB ~Choose NOT?SEMI * D8E61
          XLIB NTHEval2 ;                        * D8E94

* ROMPTR 0B0 0AA
* refs (1): D49CE
* h1 ... hn #n -> : with the fields of a form on the stack below, replaces the help text of the first n fields from the top. The forms build their help messages this way.
IFSetHelps:
        :: ZERO_DO ISTOP-INDEX #1- BINT13 #* #4+ ISTOP-INDEX #+ DUP #2+ ROLL * D8EA4
          DROP ISTOP-INDEX #1+ ROLL SWAP UNROLL LOOP ; * D8EE0

* ROMPTR 0B0 0AB
* refs (1): D49CE
* Inside an input form, beeps and abandons the caller: for commands not allowed there.
IFNotInForm:
        :: XLIB InForm? NOT?SEMI                 * D8F08
          RDROP COLA DoBadKey                    * D8F1D
        ;                                        * D8F2C

* ROMPTR 0B0 0AC
* refs (1): D49CE
* -> flag: is an input form running? Reads the local IF.
InForm?:
        :: ' LAM 'IF undo NOTcaseFALSE ;         * D8F31

* ROMPTR 0B0 0AD
* refs (1): D49CE
* A prefix for a form handler. The next object in the stream is a list of fields. On message 29 (OK), moves to the first of them with no value and errors with Bad Argument Value, so OK fails.
IFNeedValues:
        :: 'R OVER BINT29 #<> caseDROP DUPTYPELIST? * D8F57
          ?SKIP ONE{}N                           * D8F7A
          INNERCOMP ZERO_DO ISTOP-INDEX ROLL DUP XLIB IFNoVal? case * D8F84
          :: XLIB IFSetField SETSIZEERR ;        * D8FAD
          DROP LOOP ;                            * D8FC7

* ROMPTR 0B0 0AE
* refs (1): D49CE
* -> $|grob: the form's title.
IFTitle@:
        :: 12GETLAM ~DUPTYPEBINT?;case;JstGetTHEMESG ; * D8FD6

* ROMPTR 0B0 0AF
* refs (1): D49CE
* #label -> #: number of the first local of a label. A label has three locals: y, x and text.
IFLblBase:
        :: #3* 3GETLAM SWAP#- ;                  * D8FEA

* ROMPTR 0B0 0B0
* refs (1): D49CE
* #label -> $.
IFLblText@:
        :: XLIB IFLblBase #2+ GETLAM ~DUPTYPEBINT?;case;JstGetTHEMESG ; * D9003

* ROMPTR 0B0 0B1
* refs (1): D49CE
* #label -> #x.
IFLblX@:
        :: XLIB IFLblBase #1+ GETLAM ;           * D9027

* ROMPTR 0B0 0B2
* refs (1): D49CE
* #label -> #y.
IFLblY@:
        :: XLIB IFLblBase GETLAM ;               * D9046

* ROMPTR 0B0 0B3
* refs (1): D49CE
* #label -> #x #y.
IFLblXY@:
        :: XLIB IFLblBase #1+ XLIB GET2LAM ;     * D9060

* ROMPTR 0B0 0B4
* refs (1): D49CE
* $ #label -> .
IFLblText!:
        :: XLIB IFLblBase #2+ PUTLAM ;           * D9085

* ROMPTR 0B0 0B5
* refs (1): D49CE
* #x #label -> .
IFLblX!:
        :: XLIB IFLblBase #1+ PUTLAM ;           * D90A4

* ROMPTR 0B0 0B6
* refs (1): D49CE
* #y #label -> .
IFLblY!:
        :: XLIB IFLblBase PUTLAM ;               * D90C3

* ROMPTR 0B0 0B7
* refs (1): D49CE
* #x #y #label -> .
IFLblXY!:
        :: XLIB IFLblBase #1+ XLIB PUT2LAM ;     * D90DD

* ROMPTR 0B0 0B8
* refs (1): D49CE
* #field -> #: number of the first local of a field. A field has 13: value, reset value, choose decompile, choices, help, decompile, allowed types, type, height, width, y, x and message handler.
IFFldBase:
        :: BINT13 #* 2GETLAM SWAP#- ;            * D9102

* ROMPTR 0B0 0B9
* refs (1): D49CE
* #field -> ob: the message handler.
IFFldMH@:
        :: XLIB IFFldBase #12+ GETLAM ;          * D9120

* ROMPTR 0B0 0BA
* refs (1): D49CE
* #field -> #x.
IFFldX@:
        :: XLIB IFFldBase BINT11 #+ GETLAM ;     * D913F

* ROMPTR 0B0 0BB
* refs (1): D49CE
* #field -> #y.
IFFldY@:
        :: XLIB IFFldBase #10+ GETLAM ;          * D9163

* ROMPTR 0B0 0BC
* refs (1): D49CE
* #field -> #w.
IFFldW@:
        :: XLIB IFFldBase #9+ GETLAM ;           * D9182

* ROMPTR 0B0 0BD
* refs (1): D49CE
* #field -> #h.
IFFldH@:
        :: XLIB IFFldBase #8+ GETLAM ;           * D91A1

* ROMPTR 0B0 0BE
* refs (1): D49CE
* #field -> #: the type bits.
IFFldType@:
        :: XLIB IFFldBase #7+ GETLAM ;           * D91C0

* ROMPTR 0B0 0BF
* refs (1): D49CE
* #field -> {}: the allowed object types.
IFFldTypes@:
        :: XLIB IFFldBase #6+ GETLAM ;           * D91DF

* ROMPTR 0B0 0C0
* refs (1): D49CE
* #field -> #: the decompile code.
IFFldDec@:
        :: XLIB IFFldBase #5+ GETLAM ;           * D91FE

* ROMPTR 0B0 0C1
* refs (1): D49CE
* #field -> $.
IFFldHelp@:
        :: XLIB IFFldBase #4+ GETLAM ~DUPTYPEBINT?;case;JstGetTHEMESG ; * D921D

* ROMPTR 0B0 0C2
* refs (1): D49CE
* #field -> {}.
IFFldChoices@:
        :: XLIB IFFldBase #3+ GETLAM ;           * D9241

* ROMPTR 0B0 0C3
* refs (1): D49CE
* #field -> #: the decompile code for the choices.
IFFldChDec@:
        :: XLIB IFFldBase #2+ GETLAM ;           * D9260

* ROMPTR 0B0 0C4
* refs (1): D49CE
* #field -> ob.
IFFldReset@:
        :: XLIB IFFldBase #1+ GETLAM ;           * D927F

* ROMPTR 0B0 0C5
* refs (1): D49CE
~gFldVal:
        :: XLIB IFFldBase GETLAM ;               * D929E

* ROMPTR 0B0 0C6
* refs (1): D49CE
* #field -> #x #y.
IFFldXY@:
        :: XLIB IFFldBase BINT11 #+ XLIB GET2LAM ; * D92B8

* ROMPTR 0B0 0C7
* refs (1): D49CE
* #field -> #w #h.
IFFldWH@:
        :: XLIB IFFldBase #9+ XLIB GET2LAM ;     * D92E2

* ROMPTR 0B0 0C8
* refs (1): D49CE
GetFieldVals:
        :: 14GETLAM #1+_ONE_DO INDEX@ XLIB ~gFldVal LOOP ; * D9307

* ROMPTR 0B0 0C9
* refs (1): D49CE
* ob #field -> .
IFFldMH!:
        :: XLIB IFFldBase #12+ PUTLAM ;          * D9330

* ROMPTR 0B0 0CA
* refs (1): D49CE
* #x #field -> .
IFFldX!:
        :: XLIB IFFldBase BINT11 #+ PUTLAM ;     * D934F

* ROMPTR 0B0 0CB
* refs (1): D49CE
* #y #field -> .
IFFldY!:
        :: XLIB IFFldBase #10+ PUTLAM ;          * D9373

* ROMPTR 0B0 0CC
* refs (1): D49CE
* #w #field -> .
IFFldW!:
        :: XLIB IFFldBase #9+ PUTLAM ;           * D9392

* ROMPTR 0B0 0CD
* refs (1): D49CE
* #h #field -> .
IFFldH!:
        :: XLIB IFFldBase #8+ PUTLAM ;           * D93B1

* ROMPTR 0B0 0CE
* refs (1): D49CE
* # #field -> .
IFFldType!:
        :: XLIB IFFldBase #7+ PUTLAM ;           * D93D0

* ROMPTR 0B0 0CF
* refs (1): D49CE
* {} #field -> .
IFFldTypes!:
        :: XLIB IFFldBase #6+ PUTLAM ;           * D93EF

* ROMPTR 0B0 0D0
* refs (1): D49CE
* # #field -> .
IFFldDec!:
        :: XLIB IFFldBase #5+ PUTLAM ;           * D940E

* ROMPTR 0B0 0D1
* refs (1): D49CE
* $ #field -> .
IFFldHelp!:
        :: XLIB IFFldBase #4+ PUTLAM ;           * D942D

* ROMPTR 0B0 0D2
* refs (1): D49CE
* {} #field -> .
IFFldChoices!:
        :: XLIB IFFldBase #3+ PUTLAM ;           * D944C

* ROMPTR 0B0 0D3
* refs (1): D49CE
* # #field -> .
IFFldChDec!:
        :: XLIB IFFldBase #2+ PUTLAM ;           * D946B

* ROMPTR 0B0 0D4
* refs (1): D49CE
* ob #field -> .
IFFldReset!:
        :: XLIB IFFldBase #1+ PUTLAM ;           * D948A

* ROMPTR 0B0 0D5
* refs (1): D49CE
~sFldVal:
        :: XLIB IFFldBase PUTLAM ;               * D94A9

* ROMPTR 0B0 0D6
* refs (1): D49CE
* #x #y #field -> .
IFFldXY!:
        :: XLIB IFFldBase BINT11 #+ XLIB PUT2LAM ; * D94C3

* ROMPTR 0B0 0D7
* refs (1): D49CE
* #w #h #field -> .
IFFldWH!:
        :: XLIB IFFldBase #9+ XLIB PUT2LAM ;     * D94ED

* ROMPTR 0B0 0D8
* refs (1): D49CE
* ob1 ... obn -> : stores the values of all fields.
SetFieldVals:
        :: 14GETLAM ZERO_DO ISTOP-INDEX XLIB ~sFldVal LOOP ; * D9512

* ROMPTR 0B0 0D9
* refs (1): D49CE
* #n -> ob_n ob_n-1: recalls two neighbouring locals.
GET2LAM:
        :: DUP GETLAM SWAP#1- GETLAM ;           * D953B

* ROMPTR 0B0 0DA
* refs (1): D49CE
* ob_n ob_n-1 #n -> : stores two neighbouring locals.
PUT2LAM:
        :: ROTOVER PUTLAM #1- PUTLAM ;           * D9559

* ROMPTR 0B0 0DB
* refs (1): D49CE
~nNullBind:
        :: ' NULLLAM CACHE ;                     * D9577

LIB0B0.hash:
        CON(5)  DOHSTR                           * D9590  hash table of library 0B0
        LENGTH                                   * D9595  length, to #D95F4
        CON(5)  0                                * D959A  names of length 1
        CON(5)  0                                * D959F  names of length 2
        CON(5)  0                                * D95A4  names of length 3
        CON(5)  0                                * D95A9  names of length 4
        CON(5)  0                                * D95AE  names of length 5
        CON(5)  0                                * D95B3  names of length 6
        CON(5)  0                                * D95B8  names of length 7
        CON(5)  0                                * D95BD  names of length 8
        CON(5)  0                                * D95C2  names of length 9
        CON(5)  0                                * D95C7  names of length 10
        CON(5)  0                                * D95CC  names of length 11
        CON(5)  0                                * D95D1  names of length 12
        CON(5)  0                                * D95D6  names of length 13
        CON(5)  0                                * D95DB  names of length 14
        CON(5)  0                                * D95E0  names of length 15
        CON(5)  0                                * D95E5  names of length 16
        REL(5)  LIB0B0.hash.L1                   * D95EA  end of the names
LIB0B0.hash.L1:
        CON(5)  0                                * D95EF  command 000 has no name
        ENDLENGTH                                * D95F4

LIB0B0.link:
        CON(5)  DOHSTR                           * D95F4  link table of library 0B0
        LENGTH                                   * D95F9  length, to #D9A4A
        REL(5)  IFErrHandler                     * D95FE  000 
        REL(5)  IFDispDA1                        * D9603  001 
        REL(5)  IFDispDA2a                       * D9608  002 
        REL(5)  IFDispPending                    * D960D  003 
        REL(5)  IFMenuAll                        * D9612  004 
        REL(5)  ~IFMenuRow1                      * D9617  005 ~IFMenuRow1
        REL(5)  ~IFMenuRow2                      * D961C  006 ~IFMenuRow2
        REL(5)  IFEditMenu                       * D9621  007 
        REL(5)  IFEditMenuRow                    * D9626  008 
        REL(5)  IFGetMenu                        * D962B  009 
        REL(5)  IFExtraKeys                      * D9630  00A 
        REL(5)  IFMsg17                          * D9635  00B 
        REL(5)  IFDispLabels                     * D963A  00C 
        REL(5)  IFDispPrompt1                    * D963F  00D 
        REL(5)  IFLabelsGrob                     * D9644  00E 
        REL(5)  IFDispTitle                      * D9649  00F 
        REL(5)  IFTitleGrob                      * D964E  010 
        REL(5)  IFTitle$                         * D9653  011 
        REL(5)  IFDispLabel                      * D9658  012 
        REL(5)  IFEDispField                     * D965D  013 IFEDispField
        REL(5)  IFFieldOn                        * D9662  014 
        REL(5)  IFFieldOff                       * D9667  015 
        REL(5)  IFInvField                       * D966C  016 
        REL(5)  IFDispHelp                       * D9671  017 
        REL(5)  IFHelpGrob                       * D9676  018 
        REL(5)  IFHelp$                          * D967B  019 
        REL(5)  IFKeyReset                       * D9680  01A 
        REL(5)  IFResetList                      * D9685  01B 
        REL(5)  IFResetCur                       * D968A  01C 
        REL(5)  IFResetAllKey                    * D968F  01D 
        REL(5)  IFResetAll                       * D9694  01E 
        REL(5)  IFResetField                     * D9699  01F 
        REL(5)  IFFirstField#                    * D969E  020 
        REL(5)  IFExitField                      * D96A3  021 
        REL(5)  ~BINT20;IFECallFieldMH;DROP      * D96A8  022 
        REL(5)  IFFieldOK?                       * D96AD  023 
        REL(5)  IFAfterEnter                     * D96B2  024 
        REL(5)  IFNextField                      * D96B7  025 
        REL(5)  IFPrevField                      * D96BC  026 
        REL(5)  IFFieldBelow                     * D96C1  027 
        REL(5)  IFFieldAbove                     * D96C6  028 
        REL(5)  IFLastField                      * D96CB  029 
        REL(5)  IFFirstField                     * D96D0  02A 
        REL(5)  IFChoices                        * D96D5  02B 
        REL(5)  IFStartEdit                      * D96DA  02C 
        REL(5)  IFEditFldMenu                    * D96DF  02D 
        REL(5)  IFEditKeys                       * D96E4  02E 
        REL(5)  IFKeyChoose                      * D96E9  02F 
        REL(5)  IFChoose                         * D96EE  030 
        REL(5)  IFToggle                         * D96F3  031 
        REL(5)  IFKeyTypes                       * D96F8  032 
        REL(5)  IFTypesMsg                       * D96FD  033 
        REL(5)  IFTypesMenu                      * D9702  034 
        REL(5)  IFTypesList                      * D9707  035 
        REL(5)  IFCancel?                        * D970C  036 
        REL(5)  IFOK?                            * D9711  037 
        REL(5)  IFKeyCalc                        * D9716  038 
        REL(5)  IFEnterEdit                      * D971B  039 
        REL(5)  IFSyntaxErr                      * D9720  03A 
        REL(5)  IFEditEmpty                      * D9725  03B 
        REL(5)  IFEditObj                        * D972A  03C 
        REL(5)  IFCycle                          * D972F  03D 
        REL(5)  IFLetterKey                      * D9734  03E 
        REL(5)  IFMsg24                          * D9739  03F 
        REL(5)  IFMsg25                          * D973E  040 
        REL(5)  ~BINT47;IFECallFieldMH;DROP      * D9743  041 
        REL(5)  IFTypeOK?                        * D9748  042 
        REL(5)  IFValueOK?                       * D974D  043 
        REL(5)  IFFieldGrob                      * D9752  044 
        REL(5)  IFField$                         * D9757  045 
        REL(5)  IFHasValue?                      * D975C  046 
        REL(5)  IFKeysLS                         * D9761  047 
        REL(5)  IFKeysRS                         * D9766  048 
        REL(5)  IFKeysAlpha                      * D976B  049 
        REL(5)  IFKeysLSAlpha                    * D9770  04A 
        REL(5)  IFKeysRSAlpha                    * D9775  04B 
        REL(5)  IFTypeKey                        * D977A  04C 
        REL(5)  IFEdKeysLS                       * D977F  04D 
        REL(5)  IFEdKeysRS                       * D9784  04E 
        REL(5)  IFEdKeysAlpha                    * D9789  04F 
        REL(5)  IFEdKeysLSAlpha                  * D978E  050 
        REL(5)  IFEdKeysRSAlpha                  * D9793  051 
        REL(5)  IFKeyChar                        * D9798  052 
        REL(5)  IFLetterAction                   * D979D  053 
        REL(5)  IFKeyEqw                         * D97A2  054 
        REL(5)  IFKeyMatrix                      * D97A7  055 
        REL(5)  DoKeyEdit                        * D97AC  056 DoKeyEdit
        REL(5)  IFKeyCHOOS                       * D97B1  057 
        REL(5)  IFKeyCheck                       * D97B6  058 
        REL(5)  DoKeyCancel                      * D97BB  059 DoKeyCancel
        REL(5)  DoKeyOK                          * D97C0  05A DoKeyOK
        REL(5)  IFKeyRESET                       * D97C5  05B 
        REL(5)  IFKeyCALC                        * D97CA  05C 
        REL(5)  IFKeyTYPES                       * D97CF  05D 
        REL(5)  IFUpKey                          * D97D4  05E 
        REL(5)  IFDownKey                        * D97D9  05F 
        REL(5)  IFGoFirst                        * D97DE  060 
        REL(5)  IFGoLast                         * D97E3  061 
        REL(5)  IFGoRowStart                     * D97E8  062 
        REL(5)  IFGoRowEnd                       * D97ED  063 
        REL(5)  IFGoAbove                        * D97F2  064 
        REL(5)  IFGoBelow                        * D97F7  065 
        REL(5)  IFRightKey                       * D97FC  066 
        REL(5)  IFGoNext                         * D9801  067 
        REL(5)  IFLeftKey                        * D9806  068 
        REL(5)  IFGoPrev                         * D980B  069 
        REL(5)  IFPlusMinus                      * D9810  06A 
        REL(5)  IFSetField                       * D9815  06B 
        REL(5)  IFEnterNext                      * D981A  06C 
        REL(5)  IFFindChoice                     * D981F  06D 
        REL(5)  ~MenuDef@;8GETLAM;EQUAL          * D9824  06E 
        REL(5)  $FitLeft                         * D9829  06F 
        REL(5)  $FitRight                        * D982E  070 
        REL(5)  ~$>grob;GROBDIMw                 * D9833  071 
        REL(5)  IFNext#                          * D9838  072 
        REL(5)  IFPrev#                          * D983D  073 
        REL(5)  IFDecomp                         * D9842  074 
        REL(5)  Decomp1Std                       * D9847  075 
        REL(5)  Decomp1Line                      * D984C  076 
        REL(5)  IFFilterArgs                     * D9851  077 
        REL(5)  IFVal@                           * D9856  078 
        REL(5)  IFNoVal?                         * D985B  079 
        REL(5)  IFTypes@                         * D9860  07A 
        REL(5)  IFChoices@                       * D9865  07B 
        REL(5)  IFChDec@                         * D986A  07C 
        REL(5)  IFReset@                         * D986F  07D 
        REL(5)  IFCheckGrob1                     * D9874  07E 
        REL(5)  IFCheckOn                        * D9879  07F 
        REL(5)  IFCheckGrob2                     * D987E  080 
        REL(5)  IFCheckOnInv                     * D9883  081 
        REL(5)  IFCheckOff                       * D9888  082 
        REL(5)  IFCheckOffInv                    * D988D  083 
        REL(5)  IFCheckGrob3                     * D9892  084 
        REL(5)  ~grobAlertIcon                   * D9897  085 ~grobAlertIcon
        REL(5)  ~grobCheckKey                    * D989C  086 ~grobCheckKey
        REL(5)  IFTitleBar                       * D98A1  087 
        REL(5)  IFText?                          * D98A6  088 
        REL(5)  IFAlg?                           * D98AB  089 
        REL(5)  IFChoose?                        * D98B0  08A 
        REL(5)  IFCycle?                         * D98B5  08B 
        REL(5)  IFFilter?                        * D98BA  08C 
        REL(5)  IFCheck?                         * D98BF  08D 
        REL(5)  IFBadType                        * D98C4  08E 
        REL(5)  IFBadTypeMenu                    * D98C9  08F 
        REL(5)  IFBadValue                       * D98CE  090 
        REL(5)  DoAlert                          * D98D3  091 DoAlert
        REL(5)  AlertMenu                        * D98D8  092 
        REL(5)  IFClearHelp                      * D98DD  093 
        REL(5)  ~BINT46;BINT10;BLANKIT           * D98E2  094 
        REL(5)  IFGoTo                           * D98E7  095 
        REL(5)  IFValidate                       * D98EC  096 
        REL(5)  IFFirst#                         * D98F1  097 
        REL(5)  ~BINT1;NTHCOMPROM@               * D98F6  098 
        REL(5)  ~BINT2;NTHCOMPROM@               * D98FB  099 
        REL(5)  ~BINT3;NTHCOMPROM@               * D9900  09A 
        REL(5)  NTHEval1                         * D9905  09B 
        REL(5)  NTHEval2                         * D990A  09C 
        REL(5)  NTHEval3                         * D990F  09D 
        REL(5)  IFFindNext                       * D9914  09E 
        REL(5)  IFDone?                          * D9919  09F 
        REL(5)  ~9GETLAM;CARCOMP;NOT             * D991E  0A0 
        REL(5)  IFMarkDone                       * D9923  0A1 
        REL(5)  IFMarkPending                    * D9928  0A2 
        REL(5)  IFAllDone                        * D992D  0A3 
        REL(5)  IFAllPending                     * D9932  0A4 
        REL(5)  TitleBar$>Grob                   * D9937  0A5 
        REL(5)  IFMenuForField                   * D993C  0A6 
        REL(5)  ~8GETLAM;7GETLAM;StartMenu       * D9941  0A7 
        REL(5)  IFStartEditMenu                  * D9946  0A8 
        REL(5)  IFTypeChoose                     * D994B  0A9 
        REL(5)  IFSetHelps                       * D9950  0AA 
        REL(5)  IFNotInForm                      * D9955  0AB 
        REL(5)  InForm?                          * D995A  0AC 
        REL(5)  IFNeedValues                     * D995F  0AD 
        REL(5)  IFTitle@                         * D9964  0AE 
        REL(5)  IFLblBase                        * D9969  0AF 
        REL(5)  IFLblText@                       * D996E  0B0 
        REL(5)  IFLblX@                          * D9973  0B1 
        REL(5)  IFLblY@                          * D9978  0B2 
        REL(5)  IFLblXY@                         * D997D  0B3 
        REL(5)  IFLblText!                       * D9982  0B4 
        REL(5)  IFLblX!                          * D9987  0B5 
        REL(5)  IFLblY!                          * D998C  0B6 
        REL(5)  IFLblXY!                         * D9991  0B7 
        REL(5)  IFFldBase                        * D9996  0B8 
        REL(5)  IFFldMH@                         * D999B  0B9 
        REL(5)  IFFldX@                          * D99A0  0BA 
        REL(5)  IFFldY@                          * D99A5  0BB 
        REL(5)  IFFldW@                          * D99AA  0BC 
        REL(5)  IFFldH@                          * D99AF  0BD 
        REL(5)  IFFldType@                       * D99B4  0BE 
        REL(5)  IFFldTypes@                      * D99B9  0BF 
        REL(5)  IFFldDec@                        * D99BE  0C0 
        REL(5)  IFFldHelp@                       * D99C3  0C1 
        REL(5)  IFFldChoices@                    * D99C8  0C2 
        REL(5)  IFFldChDec@                      * D99CD  0C3 
        REL(5)  IFFldReset@                      * D99D2  0C4 
        REL(5)  ~gFldVal                         * D99D7  0C5 ~gFldVal
        REL(5)  IFFldXY@                         * D99DC  0C6 
        REL(5)  IFFldWH@                         * D99E1  0C7 
        REL(5)  GetFieldVals                     * D99E6  0C8 GetFieldVals
        REL(5)  IFFldMH!                         * D99EB  0C9 
        REL(5)  IFFldX!                          * D99F0  0CA 
        REL(5)  IFFldY!                          * D99F5  0CB 
        REL(5)  IFFldW!                          * D99FA  0CC 
        REL(5)  IFFldH!                          * D99FF  0CD 
        REL(5)  IFFldType!                       * D9A04  0CE 
        REL(5)  IFFldTypes!                      * D9A09  0CF 
        REL(5)  IFFldDec!                        * D9A0E  0D0 
        REL(5)  IFFldHelp!                       * D9A13  0D1 
        REL(5)  IFFldChoices!                    * D9A18  0D2 
        REL(5)  IFFldChDec!                      * D9A1D  0D3 
        REL(5)  IFFldReset!                      * D9A22  0D4 
        REL(5)  ~sFldVal                         * D9A27  0D5 ~sFldVal
        REL(5)  IFFldXY!                         * D9A2C  0D6 
        REL(5)  IFFldWH!                         * D9A31  0D7 
        REL(5)  SetFieldVals                     * D9A36  0D8 
        REL(5)  GET2LAM                          * D9A3B  0D9 
        REL(5)  PUT2LAM                          * D9A40  0DA 
        REL(5)  ~nNullBind                       * D9A45  0DB ~nNullBind
        ENDLENGTH                                * D9A4A
        ENDLENGTH                                * D9A4A

        LENGTH                                   * D9A4A  library object without its prolog (its place is the end of the link table before): length, to #DCB7C
        CON(2)  0                                * D9A4F  no title
