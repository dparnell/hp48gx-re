* HP 48GX ROM revision R, #D49CE-#D79FC: Input forms: error handling, menus, redisplay, then one routine for each message with its default action, and the key tables
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~IFMenuRow2 ~IFMenuRow1 IFValueOK? IFUpKey IFTypesMsg IFTypesMenu IFTypesList IFTypeOK? IFTypeKey IFToggle IFTitleGrob IFTitle$
* Follows on from the previous file (at #D49CE in the original ROM).

* Library 0B0: The input form engine behind DoInputForm: its menus, keys, display, validation, and the messages sent to the form's and the fields' handlers.
LIB0B0:
        CON(3)  #0B0                             * D49CE  library number
        REL(5)  LIB0B0.hash                      * D49D1  hash table
        CON(5)  0                                * D49D6  message table
        REL(5)  LIB0B0.link                      * D49DB  link table
        CON(5)  0                                * D49E0  config
        RPL

* ROMPTR 0B0 000
* refs (1): D49CE
* Error handler of the key loop: an alarm error or a real error shows the message in an alert, and the form carries on.
IFErrHandler:
        :: RestartMenu ERROR@ BINT0 #=casedrop ErrResetEdit * D49E5
          #CAlarmErr #=case ERRJMP               * D4A03
          LastRomWd> ERROR@ ErrResetEdit MakeMessage(proc,s) CHR_Newline >T$ * D4A12
          SWAP&$ TOADISP REDISPHBUFF XLIB DoAlert ; * D4A30

* ROMPTR 0B0 001
* refs (1): D49CE
* Display area 1: redraws the title unless a key is waiting.
IFDispDA1:
        :: KEYINBUFFER? case SetDA1Bad           * D4A4F
          TOADISP XLIB IFDispTitle SetDA1Valid ; * D4A63

* ROMPTR 0B0 002
* refs (1): D49CE
* Display area 2a: redraws the labels and fields unless a key is waiting.
IFDispDA2a:
        :: KEYINBUFFER? case SetDA2aBad          * D4A7D
          TOADISP XLIB IFDispLabels SetDA2aValid ; * D4A91

* ROMPTR 0B0 003
* refs (1): D49CE
* Draws the fields still marked for redisplay, stopping when a key is waiting or ATTN is pressed.
IFDispPending:
        :: KEYINBUFFER? ?SEMI                    * D4AAB
          EDITPARTS BINT1 #> ?SEMI               * D4ABA
          9GETLAM 14GETLAM #1+_ONE_DO            * D4ACE
          :: ATTN? ?SEMI                         * D4ADD
            KEYINBUFFER? ?SEMI                   * D4AEC
            DUP INDEX@ #1+ NTHCOMPDROP ?SKIP     * D4AF6
            :: INDEX@ XLIB IFEDispField ;        * D4B0F
          ;                                      * D4B29
          LOOP DROP ;                            * D4B2E

* ROMPTR 0B0 004
* refs (1): D49CE
* The default menu of two rows: EDIT, CHOOS, the check key, CANCEL and OK, then RESET, CALC, TYPES, CANCEL and OK. The EDIT, CHOOS and check labels show only for a field of that kind.
IFMenuAll:
        :: NoExitAction                          * D4B3D
          {                                      * D4B47
            {                                    * D4B4C
              :: TakeOver 5GETLAM XLIB IFText? ITE $ "EDIT" NULL$ * D4B51
              ;                                  * D4B87
              :: TakeOver XLIB DoKeyEdit ; }     * D4B8C
            {                                    * D4BAB
              :: TakeOver 5GETLAM XLIB IFChoose? ITE $ "CHOOS" NULL$ * D4BB0
              ;                                  * D4BE8
              :: TakeOver XLIB IFKeyCHOOS ; }    * D4BED
            {                                    * D4C0C
              :: TakeOver 5GETLAM XLIB IFCheck? ITE XLIB ~grobCheckKey NULL$ * D4C11
              ;                                  * D4C40
              :: TakeOver XLIB IFKeyCheck ; }    * D4C45
            NullMenuKey                          * D4C64
            { $ "(AN(L"                          * D4C69
              :: TakeOver XLIB DoKeyCancel ; }   * D4C82
            { $ "OK"                             * D4CA1
              :: TakeOver XLIB DoKeyOK ; }       * D4CB4
            { $ "RESET"                          * D4CD3
              :: TakeOver XLIB IFKeyRESET ; }    * D4CEC
            {                                    * D4D0B
              :: TakeOver 5GETLAM XLIB IFText? ITE $ "CALC" NULL$ * D4D10
              ;                                  * D4D46
              :: TakeOver XLIB IFKeyCALC ; }     * D4D4B
            {                                    * D4D6A
              :: TakeOver 5GETLAM XLIB IFText? ITE $ "TYPES" NULL$ * D4D6F
              ;                                  * D4DA7
              :: TakeOver XLIB IFKeyTYPES ; }    * D4DAC
            NullMenuKey                          * D4DCB
            { $ "(AN(L"                          * D4DD0
              :: TakeOver XLIB DoKeyCancel ; }   * D4DE9
            { $ "OK"                             * D4E08
              :: TakeOver XLIB DoKeyOK ; }       * D4E1B
          }                                      * D4E3A
        ;                                        * D4E3F

* ROMPTR 0B0 005
* refs (1): D49CE
~IFMenuRow1:
        {                                        * D4E44
          {                                      * D4E49
            :: TakeOver 5GETLAM XLIB IFText? ITE $ "EDIT" NULL$ * D4E4E
            ;                                    * D4E84
            :: TakeOver XLIB DoKeyEdit ; }       * D4E89
          {                                      * D4EA8
            :: TakeOver 5GETLAM XLIB IFChoose? ITE $ "CHOOS" NULL$ * D4EAD
            ;                                    * D4EE5
            :: TakeOver XLIB IFKeyCHOOS ; }      * D4EEA
          {                                      * D4F09
            :: TakeOver 5GETLAM XLIB IFCheck? ITE XLIB ~grobCheckKey NULL$ * D4F0E
            ;                                    * D4F3D
            :: TakeOver XLIB IFKeyCheck ; }      * D4F42
        }                                        * D4F61

* ROMPTR 0B0 006
* refs (1): D49CE
~IFMenuRow2:
        {                                        * D4F66
          { $ "RESET"                            * D4F6B
            :: TakeOver XLIB IFKeyRESET ; }      * D4F84
          {                                      * D4FA3
            :: TakeOver 5GETLAM XLIB IFText? ITE $ "CALC" NULL$ * D4FA8
            ;                                    * D4FDE
            :: TakeOver XLIB IFKeyCALC ; }       * D4FE3
          {                                      * D5002
            :: TakeOver 5GETLAM XLIB IFText? ITE $ "TYPES" NULL$ * D5007
            ;                                    * D503F
            :: TakeOver XLIB IFKeyTYPES ; }      * D5044
          NullMenuKey                            * D5063
          { $ "(AN(L"                            * D5068
            :: TakeOver XLIB DoKeyCancel ; }     * D5081
          { $ "OK"                               * D50A0
            :: TakeOver XLIB DoKeyOK ; }         * D50B3
        }                                        * D50D2

* ROMPTR 0B0 007
* refs (1): D49CE
* The menu while a field is edited: CANCEL, OK, the skip and delete keys, insert and ↑STK.
IFEditMenu:
        :: NoExitAction                          * D50D7
          { NullMenuKey NullMenuKey NullMenuKey NullMenuKey * D50E1
            { $ "(AN(L"                          * D50FA
              :: TakeOver XLIB DoKeyCancel ; }   * D5113
            { $ "OK"                             * D5132
              :: TakeOver XLIB DoKeyOK ; }       * D5145
            <SkipKey >SkipKey <DelKey >DelKey TogInsertKey * D5164
            { $ "↑STK"                           * D517D
              :: TakeOver UStackDepth #0=case DoBadKey * D5194
                IStack ;                         * D51AD
            }                                    * D51B7
          }                                      * D51BC
        ;                                        * D51C1

* ROMPTR 0B0 008
* refs (1): D49CE
* The keys of the edit menu, for a field's own menu to be appended to.
IFEditMenuRow:
        {                                        * D51C6
          { $ "(AN(L"                            * D51CB
            :: TakeOver XLIB DoKeyCancel ; }     * D51E4
          { $ "OK"                               * D5203
            :: TakeOver XLIB DoKeyOK ; }         * D5216
          <SkipKey >SkipKey <DelKey >DelKey TogInsertKey * D5235
          { $ "↑STK"                             * D524E
            :: TakeOver UStackDepth #0=case DoBadKey * D5265
              IStack ;                           * D527E
          }                                      * D5288
        }                                        * D528D

* ROMPTR 0B0 009
* refs (1): D49CE
* Message 15: the form's menu. Else the default menu; message 16 may give keys for the first row, in which case the list is built from them and the two rows.
IFGetMenu:
        :: BINT15 ~13GETLAM;EVAL ?SEMI           * D5292
          XLIB IFExtraKeys NOTcase               * D52A6
          :: ' XLIB IFMenuAll ;                  * D52B6
          ' NoExitAction XLIB ~IFMenuRow1 ROT &COMP XLIB ~IFMenuRow2 &COMP * D52D0
          BINT2 ::N ;                            * D52FF

* ROMPTR 0B0 00A
* refs (1): D49CE
* Message 16: keys to add to the menu. Default FALSE.
IFExtraKeys:
        :: BINT16 ~13GETLAM;EVAL ?SEMI           * D530E
          FALSE ;                                * D5322

* ROMPTR 0B0 00B
* refs (1): D49CE
* Sends message 17 to the form.
IFMsg17:
        :: BINT17 ~13GETLAM;EVAL DROP ;          * D532C

* ROMPTR 0B0 00C
* refs (1): D49CE
* Message 4: draws all labels and fields. With a multi-line edit in progress it draws only the prompt.
IFDispLabels:
        :: BINT4 ~13GETLAM;EVAL ?SEMI            * D5345
          EDITPARTS BINT1 #> case XLIB IFDispPrompt1 * D5359
          XLIB IFFirst# HARDBUFF BINT0 BINT7 GROB! 14GETLAM #1+_ONE_DO * D5378
          INDEX@ KEYINBUFFER? ATTN? OR ITE XLIB IFMarkPending * D53A1
          XLIB IFEDispField                      * D53C5
          LOOP ;                                 * D53D0

* ROMPTR 0B0 00D
* refs (1): D49CE
* Draws the prompt of the current field.
IFDispPrompt1:
        :: FALSE 5GETLAM XLIB IFDispHelp ;       * D53DA

* ROMPTR 0B0 00E
* refs (1): D49CE
* Message 5: makes the grob of the labels, which the form then keeps.
IFLabelsGrob:
        :: BINT5 ~13GETLAM;EVAL ?SEMI            * D53F9
          BINT39 BINT131 MAKEGROB 15GETLAM #1+_ONE_DO INDEX@ * D540D
          XLIB IFDispLabel LOOP TRUE ;           * D542B

* ROMPTR 0B0 00F
* refs (1): D49CE
* Message 1: draws the title at the top of the display.
IFDispTitle:
        :: BINT1 ~13GETLAM;EVAL ?SEMI            * D5445
          XLIB IFTitleGrob HARDBUFF ZEROZERO GROB! ; * D5459

* ROMPTR 0B0 010
* refs (1): D49CE
* Message 2: -> grob: the title bar.
IFTitleGrob:
        :: BINT2 ~13GETLAM;EVAL ?SEMI            * D5478
          XLIB IFTitle$ XLIB TitleBar$>Grob ;    * D548C

* ROMPTR 0B0 011
* refs (1): D49CE
* Message 3: -> $|grob: the form's title.
IFTitle$:
        :: BINT3 ~13GETLAM;EVAL ?SEMI            * D54A7
          XLIB IFTitle@ ;                        * D54BB

* ROMPTR 0B0 012
* refs (1): D49CE
* Message 6: #label grob -> grob: draws one label.
IFDispLabel:
        :: BINT6 ~13GETLAM;EVAL ?SEMI            * D54CB
          DUP XLIB IFLblText@ $>grob 3PICK ROT XLIB IFLblXY@ 3PICK HARDBUFF * D54DF
          EQUAL ?SKIP                            * D5513
          :: BINT7 #- ;                          * D551D
          GROB! ;                                * D5531

* ROMPTR 0B0 013
* refs (1): D49CE
IFEDispField:
        :: BINT7 IFECallFieldMH ?SEMI            * D553B
          4GETLAM DUP XLIB IFFieldGrob OVER 5GETLAM #= IT INVGROB * D554F
          HARDBUFF ROT XLIB IFFldXY@ GROB! ;     * D557D

* ROMPTR 0B0 014
* refs (1): D49CE
* Message 21: inverts the current field, for entering it.
IFFieldOn:
        :: DA2aBad? caseDROP BINT21              * D559C
          IFECallFieldMH ?SEMI                   * D55B0
          4GETLAM XLIB IFInvField ;              * D55BA

* ROMPTR 0B0 015
* refs (1): D49CE
* Message 22: inverts the current field back, for leaving it.
IFFieldOff:
        :: DA2aBad? caseDROP BINT22              * D55CF
          IFECallFieldMH ?SEMI                   * D55E3
          4GETLAM XLIB IFInvField ;              * D55ED

* ROMPTR 0B0 016
* refs (1): D49CE
* #field -> : inverts the box of a field in the display.
IFInvField:
        :: DUP XLIB IFFldXY@ 2DUP 2DUP 7ROLL XLIB IFFldWH@ ROT #+ 3UNROLL #+ * D5602
          SWAP HARDBUFF 5UNROLL SUBGROB INVGROB HARDBUFF 4ROLL 4ROLL GROB! ; * D5645

* ROMPTR 0B0 017
* refs (1): D49CE
* Message 11: flag -> : draws the field's help line, above the edit line while editing.
IFDispHelp:
        :: BINT11 IFECallFieldMH ?SEMI           * D5677
          4GETLAM XLIB IFHelpGrob HARDBUFF BINT1 4ROLL ITE * D568B
          :: BINT50 XLIB ~BINT46;BINT10;BLANKIT ; * D56AF
          :: BINT8 XLIB IFClearHelp ;            * D56C9
          GROB! ;                                * D56E3

* ROMPTR 0B0 018
* refs (1): D49CE
* Message 12: #field -> grob: the help line.
IFHelpGrob:
        :: BINT12 IFECallFieldMH ?SEMI           * D56ED
          4GETLAM XLIB IFHelp$ $>grob ;          * D5701

* ROMPTR 0B0 019
* refs (1): D49CE
* Message 13: #field -> $: the help text.
IFHelp$:
        :: BINT13 IFECallFieldMH ?SEMI           * D571B
          4GETLAM XLIB IFFldHelp@ ;              * D572F

* ROMPTR 0B0 01A
* refs (1): D49CE
* Message 31: RESET key: offers the choices of IFResetList and runs the one chosen.
IFKeyReset:
        :: BINT31 IFECallFieldMH ?SEMI           * D5744
          NULL$ 4GETLAM XLIB IFResetList XLIB ~ChooseSimple NOTcase * D5758
          SetDA123NoCh                           * D577D
          EVAL ;                                 * D5782

* ROMPTR 0B0 01B
* refs (1): D49CE
* Message 32: #field -> {}: the choices, "Reset value" or "Delete value", and "Reset all".
IFResetList:
        :: BINT32 IFECallFieldMH ?SEMI           * D578C
          4GETLAM XLIB IFReset@ ITE              * D57A0
          :: DROP                                * D57B5
            { # B903 XLIB IFResetCur } ;         * D57BF  "Reset value"
          { # B904 XLIB IFResetCur }             * D57E3  "Delete value"
          { # B905 XLIB IFResetAllKey } TWO{}N ; * D5802  "Reset all"

* ROMPTR 0B0 01C
* refs (1): D49CE
* Resets the current field and redraws it.
IFResetCur:
        :: 5GETLAM DUP XLIB IFResetField XLIB IFEDispField SetDA123NoCh ; * D582B

* ROMPTR 0B0 01D
* refs (1): D49CE
* "Reset all": resets every field and redraws.
IFResetAllKey:
        :: XLIB IFResetAll                       * D585A
          :: SetDA1NoCh SetDA3NoCh ; ;           * D586A

* ROMPTR 0B0 01E
* refs (1): D49CE
* Message 34: resets every field, then moves to the first field if the current one is not allowed.
IFResetAll:
        :: BINT34 ~13GETLAM;EVAL ?SEMI           * D5883
          14GETLAM #1+_ONE_DO INDEX@ XLIB IFResetField LOOP 5GETLAM * D5897
          XLIB IFFieldOK? ?SEMI                  * D58BB
          XLIB IFFirstField# XLIB IFSetField ;   * D58CB

* ROMPTR 0B0 01F
* refs (1): D49CE
* Message 33: #field -> : gives a field back its reset value.
IFResetField:
        :: BINT33 IFECallFieldMH ?SEMI           * D58E6
          4GETLAM DUP DUP XLIB IFFldReset@ SWAP XLIB ~sFldVal * D58FA
          XLIB ~BINT47;IFECallFieldMH;DROP ;     * D5924

* ROMPTR 0B0 020
* refs (1): D49CE
* Message 14: -> #field: the field to start on. Default 1.
IFFirstField#:
        :: BINT14 ~13GETLAM;EVAL ?SEMI           * D5934
          BINT1 ;                                * D5948

* ROMPTR 0B0 021
* refs (1): D49CE
* #field -> : sends message 19 on leaving a field, except when there was none.
IFExitField:
        :: DUP MINUSONE #=case DROP              * D5952
          BINT19 IFECallFieldMH DROP ;           * D596B

* ROMPTR 0B0 022
* refs (1): D49CE
~BINT20;IFECallFieldMH;DROP:
        :: BINT20 IFECallFieldMH DROP ;          * D597F

* ROMPTR 0B0 023
* refs (1): D49CE
* Message 55: #field -> flag: may the cursor go to this field? Default TRUE.
IFFieldOK?:
        :: BINT55 IFECallFieldMH ?SEMI           * D5998
          TRUE ;                                 * D59AC

* ROMPTR 0B0 024
* refs (1): D49CE
* Message 54: -> #field: where to go after a field is entered. Default the next one.
IFAfterEnter:
        :: BINT54 IFECallFieldMH ?SEMI           * D59B6
          4GETLAM XLIB IFNextField ;             * D59CA

* ROMPTR 0B0 025
* refs (1): D49CE
* Message 52: #field -> #next: the next allowed field, wrapping to the first.
IFNextField:
        :: BINT52 IFECallFieldMH ?SEMI           * D59DF
          4GETLAM BEGIN XLIB IFNext# ?SKIP BINT1 * D59F3
          DUP XLIB IFFieldOK? UNTIL ;            * D5A12

* ROMPTR 0B0 026
* refs (1): D49CE
* Message 53: #field -> #prev: the previous allowed field, wrapping to the last.
IFPrevField:
        :: BINT53 IFECallFieldMH ?SEMI           * D5A2C
          4GETLAM BEGIN XLIB IFPrev# ?SKIP 14GETLAM * D5A40
          DUP XLIB IFFieldOK? UNTIL ;            * D5A5F

* ROMPTR 0B0 027
* refs (1): D49CE
* Message 48: #field -> #below: the allowed field on the next row down, keeping as near as it can to the column.
IFFieldBelow:
        :: BINT48 IFECallFieldMH ?SEMI           * D5A79
          4GETLAM DUP XLIB IFFldXY@ SWAP 3UNROLL OVER BEGIN * D5A8D
          :: BEGIN XLIB IFNext# ?SKIP BINT1      * D5AB6
            DUP XLIB IFFieldOK? UNTIL DUP 4PICK #=case FalseTrue * D5AD5
            DUP XLIB IFFldXY@ SWAPDROP 3PICK #<> case TrueTrue * D5AFE
            FALSE ;                              * D5B27
          UNTIL ROTDROP ROTDROP NOTcase SWAPDROP * D5B31
          DUP XLIB IFFldXY@ SWAPDROPSWAP DUP BEGIN * D5B4A
          :: DUP XLIB IFFldXY@ 5PICK #<> case2drop TRUE * D5B69
            ROTDROP OVER XLIB IFFldWH@ DROP #1-+ 4PICK #< NOT ; * D5B92
          NOT WHILE                              * D5BC5
          :: DUP BEGIN XLIB IFNext# ?SKIP BINT1  * D5BCF
            DUP XLIB IFFieldOK? UNTIL ;          * D5BF3
          REPEAT ROTROT2DROP ;                   * D5C0D

* ROMPTR 0B0 028
* refs (1): D49CE
* Message 49: #field -> #above: the allowed field on the row above.
IFFieldAbove:
        :: BINT49 IFECallFieldMH ?SEMI           * D5C1C
          4GETLAM DUP XLIB IFFldXY@ SWAP 3UNROLL OVER BEGIN * D5C30
          :: BEGIN XLIB IFPrev# ?SKIP 14GETLAM   * D5C59
            DUP XLIB IFFieldOK? UNTIL DUP 4PICK #=case FalseTrue * D5C78
            DUP XLIB IFFldXY@ SWAPDROP 3PICK #<> case TrueTrue * D5CA1
            FALSE ;                              * D5CCA
          UNTIL ROTDROP ROTDROP NOTcase SWAPDROP * D5CD4
          DUP XLIB IFFldXY@ SWAPDROPSWAP DUP BEGIN * D5CED
          :: DUP XLIB IFFldXY@ 5PICK #<> case2drop TRUE * D5D0C
            ROTDROP 4PICK #> NOT ;               * D5D35
          NOT WHILE                              * D5D4E
          :: DUP BEGIN XLIB IFPrev# ?SKIP 14GETLAM * D5D58
            DUP XLIB IFFieldOK? UNTIL ;          * D5D7C
          REPEAT ROTROT2DROP ;                   * D5D96

* ROMPTR 0B0 029
* refs (1): D49CE
* Message 50: -> #field: the last allowed field.
IFLastField:
        :: BINT50 IFECallFieldMH ?SEMI           * D5DA5
          14GETLAM BEGIN DUP XLIB IFFieldOK? NOT WHILE * D5DB9
          :: XLIB IFPrev# DROP ; REPEAT ;        * D5DDD

* ROMPTR 0B0 02A
* refs (1): D49CE
* Message 51: -> #field: the first allowed field.
IFFirstField:
        :: BINT51 IFECallFieldMH ?SEMI           * D5E01
          BINT1 BEGIN DUP XLIB IFFieldOK? NOT WHILE * D5E15
          :: XLIB IFNext# DROP ; REPEAT ;        * D5E39

* ROMPTR 0B0 02B
* refs (1): D49CE
* Message 40: #field -> {} #position: a field's choices and the place of the current value among them.
IFChoices:
        :: BINT40 IFECallFieldMH ?SEMI           * D5E5D
          4GETLAM DUP XLIB IFCycle? NOTcasedrop  * D5E71
          :: NULL{} BINT0 ;                      * D5E8B
          DUP XLIB IFChoices@ XLIB IFFindChoice ; * D5E9F

* ROMPTR 0B0 02C
* refs (1): D49CE
* Message 23: starts editing the field: from its decompiled value, or with quotes for an algebraic field, or empty.
IFStartEdit:
        :: BINT23 IFECallFieldMH ?SEMI           * D5EBF
          4GETLAM DUP XLIB IFHasValue? ITE       * D5ED3
          :: SWAPDROP AdjEdModes EDITDECOMP$ BINT1 ; * D5EED
          :: XLIB IFAlg? ITE                     * D5F0B
            :: SetAlgEntry $ "''" BINT2 ;        * D5F20
            :: ClrAlgEntry NULL$ BINT1 ;         * D5F42
          ;                                      * D5F5B
          InitEdLine SWAP EditString SetCursPos(s) EDITPARTS BINT1 #> ITE * D5F60
          SetDA1NoCh                             * D5F88
          :: SetDA1NoCh SetDA2aNoCh ;            * D5F8D
        ;                                        * D5FA1

* ROMPTR 0B0 02D
* refs (1): D49CE
* Message 42: -> menu: the menu while a field is edited. Message 43 may give extra keys.
IFEditFldMenu:
        :: BINT42 IFECallFieldMH ?SEMI           * D5FA6
          4GETLAM XLIB IFEditKeys NOTcase        * D5FBA
          :: ' XLIB IFEditMenu ;                 * D5FCF
          ' NoExitAction SWAP XLIB IFEditMenuRow &COMP BINT2 ::N ; * D5FE9

* ROMPTR 0B0 02E
* refs (1): D49CE
* Message 43: keys to add to the edit menu. Default FALSE.
IFEditKeys:
        :: BINT43 IFECallFieldMH ?SEMI           * D6017
          FALSE ;                                * D602B

* ROMPTR 0B0 02F
* refs (1): D49CE
* Message 26: CHOOS key: runs the choose box and stores and draws the result.
IFKeyChoose:
        :: BINT26 IFECallFieldMH ?SEMI           * D6035
          4GETLAM XLIB IFChoose NOT?SEMI         * D6049
          4GETLAM DUPUNROT XLIB ~sFldVal DUP     * D605E
          XLIB ~BINT47;IFECallFieldMH;DROP XLIB IFEDispField ; * D6078

* ROMPTR 0B0 030
* refs (1): D49CE
* Message 37: -> ob TRUE | FALSE: runs the choose box of the field. A field of type 16 gets its value from a variable browser instead.
IFChoose:
        :: BINT37 IFECallFieldMH ?SEMI           * D6093
          4GETLAM DUP XLIB IFFilter? case        * D60A7
          :: FALSE SWAP XLIB IFFilterArgs XLIB BrowseMem SetDA123NoCh ; * D60C1
          XLIB IFChoices OVER NULL{} EQUAL case2drop * D60F0
          :: DoBadKey FALSE ;                    * D610F
          DUP#0= IT DROPONE                      * D6123
          4GETLAM XLIB IFFldMH@ NULL$ 4GETLAM XLIB IFChDec@ 5ROLL 5ROLL * D6132
          XLIB ~Choose SetDA123NoCh NOTcase FALSE * D6161
          TRUE ;                                 * D617B

* ROMPTR 0B0 031
* refs (1): D49CE
* Message 27: flips a check field.
IFToggle:
        :: BINT27 IFECallFieldMH ?SEMI           * D6185
          4GETLAM DUP XLIB ~gFldVal NOT OVER XLIB ~sFldVal * D6199
          XLIB ~BINT47;IFECallFieldMH;DROP ;     * D61C3

* ROMPTR 0B0 032
* refs (1): D49CE
* Message 35: TYPES key: shows the field's allowed types in a choose box and starts editing with the delimiters of the one chosen. NEW goes to an empty command line.
IFKeyTypes:
        :: BINT35 IFECallFieldMH ?SEMI           * D61D3
          ' XLIB IFTypesMsg ?ROMPTR@ 4GETLAM XLIB IFFldMH@ >TCOMP BINT17 * D61E7
          4GETLAM XLIB IFTypesList DUPLENCOMP #1= ITE # B907 # B906 * D6216  "Valid object type:"  "Valid object types:"
          3UNROLL BINT1 XLIB ~Choose DUP BINT0 EQ NOTcase * D6249
          :: IT DROP                             * D6272
            SetDA123NoCh ;                       * D6281
          DROP EDITPARTS BINT1 #> SWAP XLIB NTHEval2 InitEdLine EditString * D628B
          SetPrgmEntry IT SetAlgEntry            * D62B9
          SetCursPos(s) SetDA2bBad case          * D62C8
          :: SetDA1NoCh SetDA3NoCh ;             * D62D7
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * D62EB

* ROMPTR 0B0 033
* refs (1): D49CE
* Handler of the TYPES choose box: message 83 gives its menu.
IFTypesMsg:
        ::                                       * D6309
          { BINT83                               * D630E
            :: ' XLIB IFTypesMenu ; }            * D6318
          EQLookup case                          * D6337
          :: EVAL TRUE ;                         * D6341
        ;                                        * D6355

* ROMPTR 0B0 034
* refs (1): D49CE
* The menu of the TYPES choose box: NEW and OK.
IFTypesMenu:
        :: NoExitAction                          * D635A
          {                                      * D6364
            { $ "NEW"                            * D6369
              :: TakeOver XLIB DoCKeyOK DROPZERO ; } * D637E
            NullMenuKey NullMenuKey NullMenuKey NullMenuKey * D63A2
            { $ "OK"                             * D63B6
              :: TakeOver XLIB DoCKeyOK ; }      * D63C9
          }                                      * D63E8
        ;                                        * D63ED

* ROMPTR 0B0 035
* refs (1): D49CE
* Message 36: -> {}: turns the field's allowed types into choices: the text of each and its cursor offset, algebraic flag and delimiters. A field with no list allows any object.
IFTypesList:
        :: BINT36 IFECallFieldMH ?SEMI           * D63F2
          4GETLAM XLIB IFTypes@ ?SKIP            * D6406
          { MINUSONE }                           * D641B
          DUPNULLCOMP? casedrop NULL{}           * D642A
          DUPLENCOMP 2NULLLAM{} BIND 1GETLAM #1+_ONE_DO 2GETLAM INDEX@ * D6439
          NTHCOMPDROP                            * D645C
          { MINUSONE                             * D6461
            { # B908                             * D646B  "Any object"
              :: BINT1 FALSE NULL$ ; }           * D647A
            BINT0                                * D6498
            { # B909                             * D649D  "Real number"
              :: BINT1 FALSE NULL$ ; }           * D64AC
            BINT1                                * D64CA
            { # B90A                             * D64CF  "(Complex num)"
              :: BINT2 FALSE $ "()" ; }          * D64DE
            BINT2                                * D6505
            { # B90B                             * D650A  ""String""
              :: BINT2 FALSE $ "\"\"" ; }        * D6519
            BINT3                                * D6540
            { # B90C                             * D6545  "[ Real array ]"
              :: BINT2 FALSE $ "[]" ; }          * D6554
            BINT4                                * D657B
            { # B90D                             * D6580  "[(Cmpl array)]"
              :: BINT3 FALSE $ "[()]" ; }        * D658F
            BINT5                                * D65BA
            { # B90E                             * D65BF  "{ List }"
              :: BINT2 FALSE $ "{}" ; }          * D65CE
            BINT6                                * D65F5
            { # B90F                             * D65FA  "Name"
              :: BINT1 FALSE NULL$ ; }           * D6609
            BINT8                                * D6627
            { # B910                             * D662C  "« Program »"
              :: BINT3 FALSE $ "« »" ; }         * D663B
            BINT9                                * D6664
            { # B911                             * D6669  "'Algebraic'"
              :: BINT2 TRUE $ "''" ; }           * D6678
            BINT10                               * D669F
            { # B912                             * D66A4  "# Binary int"
              :: BINT2 FALSE $ "#" ; }           * D66B3
            BINT13                               * D66D8
            { # B913                             * D66DD  "_Unit object"
              :: BINT1 FALSE $ "_" ; }           * D66EC
          }                                      * D6711
          EQLookup DROP LOOP 1GETABND {}N ;      * D6716

* ROMPTR 0B0 036
* refs (1): D49CE
* Message 28: may the form be cancelled? Default TRUE.
IFCancel?:
        :: BINT28 ~13GETLAM;EVAL ?SEMI           * D6734
          TRUE ;                                 * D6748

* ROMPTR 0B0 037
* refs (1): D49CE
* Message 29: may the form close with OK? Default TRUE.
IFOK?:
        :: BINT29 ~13GETLAM;EVAL ?SEMI           * D6752
          TRUE ;                                 * D6766

* ROMPTR 0B0 038
* refs (1): D49CE
* Message 30: CALC key: runs StackUI so the user can work out a value, with the field's value on the stack, and stores the object left on the stack.
IFKeyCalc:
        :: BINT30 IFECallFieldMH ?SEMI           * D6770
          4GETLAM XLIB IFHasValue? DROP XLIB IFTitleGrob 5GETLAM * D6784
          XLIB IFFldHelp@ ' XLIB StackUIMenu FALSE ' LAM 'IF STOLAM * D67A9
          XLIB StackUI TRUE ' LAM 'IF STOLAM NOTcase * D67E0
          :: DEPTH #0=case AtUserStack           * D680C
            5GETLAM XLIB IFHasValue? NOTcase AtUserStack * D6820
            OVER EQUAL IT DROP                   * D683A
            AtUserStack ;                        * D684E
          1LAMBIND AtUserStack 1GETABND 5GETLAM XLIB IFValidate NOTcase * D6858
          :: EVAL IFRedrawAll ;                  * D687C
          5GETLAM XLIB ~BINT47;IFECallFieldMH;DROP ; * D6890

* ROMPTR 0B0 039
* refs (1): D49CE
* Message 44: ends an edit: parses the command line. A parse error goes to IFSyntaxErr, and an empty line deletes the value. Validates the value, stores it and moves to the next field.
IFEnterEdit:
        :: 5GETLAM BINT44 IFECallFieldMH ?SEMI   * D68A5
          EDITPARTS #>1 NOT XLIB IFMsg24 Parse.1 NOTcase XLIB IFSyntaxErr * D68BE
          PTR NULL:: EQUALcasedrop XLIB IFEditEmpty * D68ED
          XLIB IFMsg25 XLIB IFEditObj 5GETLAM XLIB IFValidate NOTcase * D6902
          :: SWAPDROP EVAL ;                     * D692D
          5GETLAM XLIB ~BINT47;IFECallFieldMH;DROP * D6941
          XLIB ~8GETLAM;7GETLAM;StartMenu NOTcase * D6951
          :: 5GETLAM XLIB IFAfterEnter XLIB IFSetField SetDA1NoCh ; * D6961
          5GETLAM XLIB IFEDispField XLIB IFEnterNext * D698B
          :: SetDA1NoCh SetDA2aNoCh ; ;          * D69A6

* ROMPTR 0B0 03A
* refs (1): D49CE
* Marks the bad token and shows Syntax Error.
IFSyntaxErr:
        :: DispBadToken SetPrgmEntry DROP #SyntaxErr ClrDA2bEdit * D69BF
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; XLIB DoAlert SetDA2bTemp * D69DD
          SetDA2bEdit ;                          * D6A06

* ROMPTR 0B0 03B
* refs (1): D49CE
* An empty edit line: the field gets its reset value.
IFEditEmpty:
        :: 5GETLAM DUP XLIB IFResetField XLIB ~8GETLAM;7GETLAM;StartMenu * D6A10
          SWAP NOTcasedrop SetDA1NoCh            * D6A35
          XLIB IFEDispField                      * D6A44
          :: SetDA1NoCh SetDA2aNoCh ; ;          * D6A4F

* ROMPTR 0B0 03C
* refs (1): D49CE
* ob -> ob': turns the parser's result into a value: a secondary 'x' becomes its contents, any other into text.
IFEditObj:
        :: DUPTYPECOL? NOT?SEMI                  * D6A68
          DUP CARCOMP ' x' EQUAL case            * D6A77
          :: BINT2 NTHCOMPDROP ;                 * D6A95
          DO>STR ;                               * D6AA9

* ROMPTR 0B0 03D
* refs (1): D49CE
* Message 38: moves a choose field on to its next choice.
IFCycle:
        :: 5GETLAM BINT38 IFECallFieldMH ?SEMI   * D6AB3
          SetDA123NoCh 4GETLAM DUP XLIB IFChoices OVER NULL{} EQUAL case * D6ACC
          3DROP                                  * D6AFA
          #1+ 2DUP SWAP LENCOMP #> IT DROPONE    * D6AFF
          NTHCOMPDROP OVER XLIB ~sFldVal DUP     * D6B22
          XLIB ~BINT47;IFECallFieldMH;DROP XLIB IFEDispField ; * D6B3C

* ROMPTR 0B0 03E
* refs (1): D49CE
* Message 39: chr -> : moves a choose field to the next choice that starts with the letter.
IFLetterKey:
        :: 5GETLAM BINT39 IFECallFieldMH ?SEMI   * D6B57
          4GETLAM DUP XLIB IFChoices OVER LENCOMP ' * D6B70
          :: SWAP NTHCOMPROM@ ; 4ROLL >HCOMP DUP 4UNROLL SWAP ROT #1+ 5PICK * D6B94
          XLIB IFFldDec@ SWAP 7ROLL XLIB IFFindNext NOTcase2drop DoBadKey * D6BD0
          SWAP EVAL OVER XLIB ~sFldVal DUP XLIB ~BINT47;IFECallFieldMH;DROP * D6BFA
          XLIB IFEDispField SetDA123NoCh ;       * D6C24

* ROMPTR 0B0 03F
* refs (1): D49CE
* Sends message 24 to the current field.
IFMsg24:
        :: 5GETLAM BINT24 IFECallFieldMH DROP ;  * D6C39

* ROMPTR 0B0 040
* refs (1): D49CE
* Sends message 25 to the current field.
IFMsg25:
        :: 5GETLAM BINT25 IFECallFieldMH DROP ;  * D6C57

* ROMPTR 0B0 041
* refs (1): D49CE
~BINT47;IFECallFieldMH;DROP:
        :: BINT47 IFECallFieldMH DROP ;          * D6C75

* ROMPTR 0B0 042
* refs (1): D49CE
* Message 45: ob #field -> flag: is the object's type allowed?
IFTypeOK?:
        :: BINT45 IFECallFieldMH ?SEMI           * D6C8E
          4GETLAM XLIB IFTypes@ NOTcasedrop TRUE * D6CA2
          SWAP XEQTYPE COERCE SWAPDROP EQUALPOSCOMP #0<> ; * D6CBC

* ROMPTR 0B0 043
* refs (1): D49CE
* Message 46: ob -> flag: is the value allowed? Default TRUE.
IFValueOK?:
        :: BINT46 IFECallFieldMH ?SEMI           * D6CDF
          DROP TRUE ;                            * D6CF3

* ROMPTR 0B0 044
* refs (1): D49CE
* Message 9: #field -> grob: the picture of a field: a check box, or the text in the width of the field, cut with "...".
IFFieldGrob:
        :: BINT9 IFECallFieldMH ?SEMI            * D6D02
          4GETLAM DUP XLIB IFCheck? case         * D6D16
          :: DUP XLIB IFMarkDone XLIB ~gFldVal ITE XLIB IFCheckOn * D6D30
            XLIB IFCheckOff                      * D6D60
            TOTEMPOB ;                           * D6D6B
          DUP XLIB IFField$ SWAP XLIB IFFldWH@ ROTDUP LEN$ BINT6 #* 4PICK * D6D75
          DUPUNROT #<ITE DROP                    * D6DAE
          :: BINT6 #/ SWAPDROP 1_#1-SUB$ CHR_... >T$ ; $>GROB 3UNROLL SWAP * D6DBD
          MAKEGROB DUPUNROT ONEONE GROB! ;       * D6DF4

* ROMPTR 0B0 045
* refs (1): D49CE
* Message 10: #field -> $: the text of a field. With a key waiting it doesn't decompile the value, and gives a bullet.
IFField$:
        :: KEYINBUFFER? case                     * D6E0D
          :: DUP XLIB IFMarkPending XLIB IFNoVal? ITE NULL$ _chr(31)_ * D6E1C
          ;                                      * D6E4B
          DUP XLIB IFMarkDone BINT10 IFECallFieldMH ?SEMI * D6E50
          4GETLAM DUP XLIB ~gFldVal SWAP XLIB IFFldDec@ XLIB IFDecomp ; * D6E6F

* ROMPTR 0B0 046
* refs (1): D49CE
* Message 41: #field -> ob TRUE | FALSE.
IFHasValue?:
        :: BINT41 IFECallFieldMH ?SEMI           * D6EA4
          4GETLAM XLIB IFVal@ ;                  * D6EB8

* ROMPTR 0B0 047
* refs (1): D49CE
* Left-shifted keys. +/- edits, ENTER opens the EquationWriter. Menu keys and shifts pass through. In an edit, keys go to the editor. Otherwise a key with a text object types it, and a choose field looks for the letter.
IFKeysLS:
        ::                                       * D6ECD
          { BINT26 XLIB DoKeyEdit BINT7 DoBadKey } #=Lookup caseTRUE * D6ED2
          EditExstCase                           * D6F00
          XLIB IFEdKeysLS                        * D6F05
          { BINT17 DoBadKey BINT25 XLIB IFKeyEqw } #=Lookup caseTRUE BINT2 * D6F10
          OVER BINT7 #<case ~Key>StdKeyOb;TRUE   * D6F43
          { BINT12 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case * D6F57
          ~Key>StdKeyOb;TRUE                     * D6F84
          2DUP Key>U/SKeyOb ~';MenuMaker;CkSecoType SWAPDROP case2drop * D6F89
          'DoBadKeyT                             * D6FA2
          5GETLAM DUP XLIB IFText? casedrop OBJ_19F0F * D6FA7
          XLIB IFCycle? NOTcase2drop 'DoBadKeyT  * D6FC6
          XLIB IFKeyChar ;                       * D6FDB

* ROMPTR 0B0 048
* refs (1): D49CE
* Right-shifted keys. The arrows go to the edges of the form, ENTER opens the MatrixWriter, and +/- is CHOOS.
IFKeysRS:
        ::                                       * D6FEB
          { BINT7 DoBadKey } #=Lookup caseTRUE EditExstCase * D6FF0
          XLIB IFEdKeysRS                        * D7013
          { BINT11 XLIB IFGoFirst BINT17 XLIB IFGoLast BINT16 * D701E
            XLIB IFGoRowStart BINT18 XLIB IFGoRowEnd BINT25 XLIB IFKeyMatrix * D7048
            BINT26 XLIB IFKeyCHOOS }             * D7073
          #=Lookup caseTRUE BINT3                * D7088
          OVER BINT7 #<case ~Key>StdKeyOb;TRUE   * D7097
          { BINT45 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case * D70AB
          ~Key>StdKeyOb;TRUE                     * D70D8
          2DUP Key>U/SKeyOb ~';MenuMaker;CkSecoType SWAPDROP case2drop * D70DD
          'DoBadKeyT                             * D70F6
          5GETLAM DUP XLIB IFText? casedrop OBJ_19F0F * D70FB
          XLIB IFCycle? NOTcase2drop 'DoBadKeyT  * D711A
          XLIB IFKeyChar ;                       * D712F

* ROMPTR 0B0 049
* refs (1): D49CE
* Alpha keys: ENTER is OK, and ON is CANCEL.
IFKeysAlpha:
        ::                                       * D713F
          { BINT25 XLIB DoKeyOK BINT45 XLIB DoKeyCancel } #=Lookup caseTRUE * D7144
          EditExstCase                           * D7178
          XLIB IFEdKeysAlpha BINT4               * D717D
          { BINT30 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case * D718D
          ~Key>StdKeyOb;TRUE                     * D71BA
          2DUP Key>U/SKeyOb ~';MenuMaker;CkSecoType SWAPDROP case2drop * D71BF
          'DoBadKeyT                             * D71D8
          5GETLAM DUP XLIB IFText? casedrop OBJ_19F0F * D71DD
          XLIB IFCycle? NOTcase2drop 'DoBadKeyT  * D71FC
          XLIB IFKeyChar ;                       * D7211

* ROMPTR 0B0 04A
* refs (1): D49CE
* Left-shifted alpha keys.
IFKeysLSAlpha:
        :: EditExstCase XLIB IFEdKeysLSAlpha BINT5 * D7221
          { BINT30 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case * D723B
          ~Key>StdKeyOb;TRUE                     * D7268
          2DUP Key>U/SKeyOb ~';MenuMaker;CkSecoType SWAPDROP case2drop * D726D
          'DoBadKeyT                             * D7286
          5GETLAM DUP XLIB IFText? casedrop OBJ_19F0F * D728B
          XLIB IFCycle? NOTcase2drop 'DoBadKeyT  * D72AA
          XLIB IFKeyChar ;                       * D72BF

* ROMPTR 0B0 04B
* refs (1): D49CE
* Right-shifted alpha keys.
IFKeysRSAlpha:
        :: EditExstCase XLIB IFEdKeysRSAlpha BINT6 * D72CF
          { BINT45 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case * D72E9
          ~Key>StdKeyOb;TRUE                     * D7316
          2DUP Key>U/SKeyOb ~';MenuMaker;CkSecoType SWAPDROP case2drop * D731B
          'DoBadKeyT                             * D7334
          5GETLAM DUP XLIB IFText? casedrop OBJ_19F0F * D7339
          XLIB IFCycle? NOTcase2drop 'DoBadKeyT  * D7358
          XLIB IFKeyChar ;                       * D736D

* ROMPTR 0B0 04C
* refs (1): D49CE
* A key that starts an edit: runs the key's object, and then if it began an edit line starts program entry mode, unless the line starts with a delimiter.
IFTypeKey:
        :: TakeOver 6GETLAM DoKeyOb NoEditLine? ?SEMI * D737D
          6GETLAM DUP MINUSONE #= caseDROP $ "'#[«\"{:" * D739B
          EDITLINE$ CAR$ BINT1 POS$ #0<> caseDROP Lock? * D73CC
          InitEd&Modes SetPrgmEntry KeyN_QUOTE IT LockAlpha * D73EF
          DoKeyOb ;                              * D7408

* ROMPTR 0B0 04D
* refs (1): D49CE
* Runs a left-shifted key in the editor.
IFEdKeysLS:
        :: BINT2 COLA OBJ_19F0F                  * D7412
        ;                                        * D7426

* ROMPTR 0B0 04E
* refs (1): D49CE
* Runs a right-shifted key in the editor.
IFEdKeysRS:
        :: BINT3 COLA OBJ_19F0F                  * D742B
        ;                                        * D743F

* ROMPTR 0B0 04F
* refs (1): D49CE
* Runs an alpha key in the editor.
IFEdKeysAlpha:
        :: BINT4 COLA OBJ_19F0F                  * D7444
        ;                                        * D7458

* ROMPTR 0B0 050
* refs (1): D49CE
* Runs a left-shifted alpha key in the editor.
IFEdKeysLSAlpha:
        :: BINT5 COLA OBJ_19F0F                  * D745D
        ;                                        * D7471

* ROMPTR 0B0 051
* refs (1): D49CE
* Runs a right-shifted alpha key in the editor.
IFEdKeysRSAlpha:
        :: BINT6 COLA OBJ_19F0F                  * D7476
        ;                                        * D748A

* ROMPTR 0B0 052
* refs (1): D49CE
* #key #plane -> ob TRUE: turns a key into the action of looking for its letter.
IFKeyChar:
        :: Key>U/SKeyOb DUPTYPECHAR? case XLIB IFLetterAction * D748F
          DUPTYPECSTR? case                      * D74AE
          :: XLIB BBFirstAlnum XLIB IFLetterAction ; * D74B8
          DROP 'DoBadKeyT ;                      * D74D8

* ROMPTR 0B0 053
* refs (1): D49CE
* chr -> ob TRUE: builds the key's action: IFLetterKey on that letter.
IFLetterAction:
        :: ' TakeOver SWAP BINT2 ::N ' XLIB IFLetterKey >TCOMP TRUE ; * D74E7

* ROMPTR 0B0 054
* refs (1): D49CE
* Left-shifted ENTER: edits the value in the EquationWriter and stores the result in the field.
IFKeyEqw:
        :: ComLine?:(bip;q) 5GETLAM XLIB IFText? NOTcase DoBadKey * D7524
          NULL{} InitMenu DEPTH 1LAMBIND EqwNew DEPTH 1GETABND * D7548
          XLIB ~8GETLAM;7GETLAM;StartMenu #> NOT?SEMI * D756B
          5GETLAM XLIB IFValidate NOTcase EVAL   * D7580
          5GETLAM XLIB ~BINT47;IFECallFieldMH;DROP ; * D759A

* ROMPTR 0B0 055
* refs (1): D49CE
* Right-shifted ENTER: edits the value in the MatrixWriter and stores the result in the field.
IFKeyMatrix:
        :: ComLine?:(bip;q) 5GETLAM XLIB IFText? NOTcase DoBadKey * D75AF
          DEPTH 1LAMBIND DoNewMatrix DEPTH 1GETABND #> NOT?SEMI * D75D3
          5GETLAM XLIB IFValidate NOTcase EVAL   * D75F6
          5GETLAM XLIB ~BINT47;IFECallFieldMH;DROP ; * D7610

* ROMPTR 0B0 056
* refs (1): D49CE
DoKeyEdit:
        :: TakeOver EditExstCase                 * D7625
          :: XLIB IFStartEditMenu                * D7634
            :: SetDA1NoCh SetDA2aNoCh SetDA2bNoCh ; ; * D7644
          5GETLAM DUP XLIB IFText? NOTcasedrop DoBadKey * D7662
* EDIT starts the edit.
          XLIB IFStartEdit MINUSONE 6PUTLAM ;    * D7681

* ROMPTR 0B0 057
* refs (1): D49CE
* CHOOS key.
IFKeyCHOOS:
        :: ComLine?:(bip;q) 5GETLAM DUP XLIB IFChoose? NOTcasedrop DoBadKey * D769B
          XLIB IFKeyChoose ;                     * D76C4

* ROMPTR 0B0 058
* refs (1): D49CE
* Check key: flips the field and draws its box.
IFKeyCheck:
        :: ComLine?:(bip;q) 5GETLAM DUP XLIB IFCheck? NOTcasedrop DoBadKey * D76D4
          DUP XLIB IFToggle DUP XLIB ~gFldVal ITE XLIB IFCheckOnInv * D76FD
          XLIB IFCheckOffInv                     * D772D
          HARDBUFF ROT XLIB IFFldXY@ GROB! SetDA123NoCh ; * D7738

* ROMPTR 0B0 059
* refs (1): D49CE
DoKeyCancel:
        :: TakeOver EditExstCase                 * D775C
          :: EDITPARTS BINT1 #> ITE SetDA1NoCh   * D776B
            :: SetDA1NoCh SetDA2aNoCh ;          * D7789
            XLIB ~8GETLAM;7GETLAM;StartMenu KeyN_ON ; * D779D
          DAsBad? case SetDA123NoCh              * D77B2
          XLIB IFCancel? NOTcase SetDA123NoCh    * D77C1
          FALSE TRUE 11PUTLAM ;                  * D77D6

* ROMPTR 0B0 05A
* refs (1): D49CE
DoKeyOK:
        :: TakeOver EditExstCase XLIB IFEnterEdit XLIB IFOK? NOTcase * D77EA
          SetDA123NoCh                           * D7814
          XLIB GetFieldVals TRUE TRUE 11PUTLAM BINT56 ~13GETLAM;EVAL DROP ; * D7819

* ROMPTR 0B0 05B
* refs (1): D49CE
* RESET key.
IFKeyRESET:
        :: ComLine?:(bip;q) 5GETLAM XLIB IFKeyReset ; * D7847

* ROMPTR 0B0 05C
* refs (1): D49CE
* CALC key.
IFKeyCALC:
        :: ComLine?:(bip;q) 5GETLAM DUP XLIB IFText? NOTcasedrop DoBadKey * D7866
          XLIB IFKeyCalc ;                       * D788F

* ROMPTR 0B0 05D
* refs (1): D49CE
* TYPES key.
IFKeyTYPES:
        :: ComLine?:(bip;q) 5GETLAM DUP XLIB IFText? NOTcasedrop DoBadKey * D789F
          XLIB IFKeyTypes ;                      * D78C8

* ROMPTR 0B0 05E
* refs (1): D49CE
* Up arrow: a line up in an edit, else moves to the field above.
IFUpKey:
        :: TakeOver NoEditLine? case XLIB IFGoAbove * D78D8
          EDITPARTS #1=case DoBadKey             * D78F7
          KeyN_UP ;                              * D7906

* ROMPTR 0B0 05F
* refs (1): D49CE
* Down arrow: a line down in an edit, else moves to the field below.
IFDownKey:
        :: TakeOver NoEditLine? case XLIB IFGoBelow * D7910
          EDITPARTS #1=case DoBadKey             * D792F
          KeyN_DOWN ;                            * D793E

* ROMPTR 0B0 060
* refs (1): D49CE
* Moves to the first field.
IFGoFirst:
        :: TakeOver 5GETLAM XLIB IFFirstField XLIB IFGoTo ; * D7948

* ROMPTR 0B0 061
* refs (1): D49CE
* Moves to the last field.
IFGoLast:
        :: TakeOver 5GETLAM XLIB IFLastField XLIB IFGoTo ; * D7972

* ROMPTR 0B0 062
* refs (1): D49CE
* Moves left to the start of the row.
IFGoRowStart:
        :: TakeOver 5GETLAM DUP BEGIN XLIB IFPrevField 2DUP #> WHILE * D799C
          :: SWAPDROP DUP ; REPEAT DROP XLIB IFGoTo ; * D79CF
