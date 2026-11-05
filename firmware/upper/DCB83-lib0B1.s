* HP 48GX ROM revision R, #DCB83-#DE45E: Message box, the outer loop that lets the user work on the stack from a form, and INFORM
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: #Round-Down ~MsgBoxMenu ~DoMsgBox StackUISts StackUIOn StackUIOK StackUIMenuBack StackUIMenu StackUIKeys StackUIHdr1 StackUIHdr StackUIDisp
* Follows on from the previous file (at #DCB83 in the original ROM).

* Library 0B1: Message boxes, the MSGBOX and INFORM commands, and a small stack-browsing loop with a menu used by input forms.
LIB0B1:
        CON(3)  #0B1                             * DCB83  library number
        REL(5)  LIB0B1.hash                      * DCB86  hash table
        CON(5)  0                                * DCB8B  message table
        REL(5)  LIB0B1.link                      * DCB90  link table
        CON(5)  0                                * DCB95  config
        RPL

* ROMPTR 0B1 000
* refs (1): DCB83
~DoMsgBox:
        :: POLSaveUI ERRSET                      * DCB9A
          :: MINUSONE MINUSONE MINUSONE MINUSONE XLIB BBGetDAs FALSE BINT6 * DCBA9
            XLIB ~nNullBind 5ROLL DUPTYPEGROB? ?SKIP * DCBD7
            ~DUPTYPEBINT?;case;JstGetTHEMESG     * DCBF1
            5UNROLL                              * DCBF6
            5PICK 5PICK 5PICK XLIB MsgBoxLines DUP 7PUTLAM BINT28 SWAP BINT9 * DCBFB
            #* #7+ #2/ #- 6PUTLAM XLIB MsgBoxSave ' XLIB ~DoMsgBox~1 ' * DCC2E
            XLIB MsgBoxKeys TrueTrue 5ROLL ONEFALSE ' 2GETLAM 'ERRJMP * DCC67
            POLSetUI ClrDA1IsStat ClrDA2bEdit XLIB MsgBoxDraw ClrDA3OK * DCC90
            POLKeyUI XLIB MsgBoxRestore ClrDAsOK 3GETLAM XLIB BBSetDAs ABND ; * DCCAF
          ERRTRAP POLResUI&Err POLRestoreUI ;    * DCCDE

* ROMPTR 0B1 001
* refs (1): DCB83
* Display procedure of the message box: redraws the menu when it isn't valid.
~DoMsgBox~1:
        :: DA3OK? ?SKIP ?DispMenu                * DCCF2
          ClrDA3OK ;                             * DCD06

* ROMPTR 0B1 002
* refs (1): DCB83
~MsgBoxMenu:
        :: NoExitAction                          * DCD10
          { NullMenuKey NullMenuKey NullMenuKey NullMenuKey NullMenuKey * DCD1A
            { $ "OK"                             * DCD38
              :: TakeOver XLIB DoMKeyOK ; }      * DCD4B
          }                                      * DCD6A
        ;                                        * DCD6F

* ROMPTR 0B1 003
* refs (1): DCB83
* #key #plane -> ... : key handler of the message box: sends each shift plane to its own table.
MsgBoxKeys:
        :: BINT1 #=casedrop XLIB MsgBoxPlain     * DCD74
          BINT2 #=casedrop XLIB MsgBoxLS         * DCD8E
          BINT3 #=casedrop XLIB MsgBoxRS         * DCDA3
          BINT4 #=casedrop XLIB MsgBoxAlpha      * DCDB8
          2DROP 'DoBadKeyT ;                     * DCDCD

* ROMPTR 0B1 004
* refs (1): DCB83
* Unshifted keys: ENTER and ON close the box; menu keys, NXT and the shifts pass through; others are bad keys.
MsgBoxPlain:
        ::                                       * DCDDC
          { BINT25                               * DCDE1
            :: TakeOver XLIB DoMKeyOK ; BINT45   * DCDEB
            :: TakeOver XLIB DoMKeyOK ; }        * DCE0A
          #=Lookup caseTRUE DUP#<7               * DCE29
          casedrpfls BINT12                      * DCE38
          #=casedrpfls BINT35                    * DCE42
          #=casedrpfls BINT40                    * DCE4C
          #=casedrpfls DROP                      * DCE56
          'DoBadKeyT ;                           * DCE60

* ROMPTR 0B1 005
* refs (1): DCB83
* Left-shifted keys.
MsgBoxLS:
        :: DUP#<7 casedrpfls BINT12              * DCE6A
          #=casedrpfls BINT35                    * DCE7E
          #=casedrpfls DROP                      * DCE88
          'DoBadKeyT ;                           * DCE92

* ROMPTR 0B1 006
* refs (1): DCB83
* Right-shifted keys.
MsgBoxRS:
        :: BINT45 #=casedrpfls DUP#<7            * DCE9C
          casedrpfls BINT40                      * DCEB0
          #=casedrpfls DROP                      * DCEBA
          'DoBadKeyT ;                           * DCEC4

* ROMPTR 0B1 007
* refs (1): DCB83
* Alpha keys: ENTER and ON close the box.
MsgBoxAlpha:
        ::                                       * DCECE
          { BINT25                               * DCED3
            :: TakeOver XLIB DoMKeyOK ; BINT45   * DCEDD
            :: TakeOver XLIB DoMKeyOK ; }        * DCEFC
          #=Lookup caseTRUE BINT30               * DCF1B
          #=casedrpfls DROP                      * DCF2A
          'DoBadKeyT ;                           * DCF34

* ROMPTR 0B1 008
* refs (1): DCB83
* Draws the box in the size held in local 7, the optional picture at its left, and the text in up to five lines.
MsgBoxDraw:
        ::                                       * DCF3E
          { XLIB ChooseBox25 XLIB ChooseBox34 XLIB ChooseBox43 * DCF43  ~BBGetDefltHeight
            XLIB ChooseBox52 }                   * DCF69  ~$>grobOrGROB
          7GETLAM #1- NTHCOMPROM@ HARDBUFF BINT16 6GETLAM GROB! DUP MINUSONE * DCF79
          EQUAL ITE DROPZERO                     * DCFA6
          :: DUP HARDBUFF BINT19 6GETLAM #3+ GROB! GROBDIMw #5+ ; * DCFB5
          4UNROLL ROT BINT1 BINT5 ZERO_DO BINT4 NDUP XLIB MsgLine ITE * DCFE7
          :: 3UNROLL 4PICK 3UNROLL SUB$ $>GROB HARDBUFF BINT19 BINT8 PICK #+ * DD01A
            6GETLAM INDEX@ BINT9 #* #+ #4+ GROB! ; * DD051
          ExitAtLOOP                             * DD079
          LOOP 5DROP ;                           * DD07E

* ROMPTR 0B1 009
* refs (1): DCB83
DoMKeyOK:
        :: TRUE TRUE 2PUTLAM ;                   * DD08D

* ROMPTR 0B1 00A
* refs (1): DCB83
* $ #start #width -> ... #first #last #next TRUE | FALSE: finds the next line of a message. It breaks at a newline, or at the last space that fits. FALSE when the text is used up.
MsgLine:
        :: OVER LEN$ 2DUP #> case                * DD0A6
          :: 5DROP FALSE ;                       * DD0C4
          OVER 6ROLL #+ #1- OVER #MIN 4ROLL 4ROLL 2DUP CHR_Newline SWAP POS$ * DD0D8
          DUP 5PICK #1+ #> NOT OVER #0<> AND case * DD114
          :: 6UNROLL 5DROP DUP #1- SWAP #1+ TRUE ; * DD141
          DROP 4PICK 4PICK #> NOTcase            * DD16E
          :: 3DROP SWAPDROP DUP #1+ TRUE ;       * DD187
          SWAP CHR_Space 4PICK #1+ POS$REV SWAP 5ROLL #+ 4ROLL #MIN OVER #> * DD1AA
          ITE                                    * DD1E6
          :: DROP DUP #1+ ;                      * DD1EB
          :: SWAPDROP DUP #1- SWAP #1+ ;         * DD204
          TRUE ;                                 * DD227

* ROMPTR 0B1 00B
* refs (1): DCB83
* $|grob ... -> #lines: the number of lines the box needs, at least 2.
MsgBoxLines:
        :: 3PICK TYPEGROB? case2drop             * DD231
          :: GROBDIM DROP BINT9 #/ SWAP #0<> IT #1+ * DD245
          ;                                      * DD272
          BINT0 4UNROLL ROT BINT1 BINT5 ZERO_DO BINT4 NDUP XLIB MsgLine ITE * DD277
          :: 3UNROLL 2DROP 5ROLL #1+ 5UNROLL ; ExitAtLOOP * DD2AF
          LOOP 4DROP BINT2 #MAX ;                * DD2D7

* ROMPTR 0B1 00C
* refs (1): DCB83
* Saves what lies under the box: the part of the display and the menu.
MsgBoxSave:
        :: HARDBUFF BINT16 6GETLAM # 76 OVER 7GETLAM BINT9 #* #+ #7+ SUBGROB * DD2F0
          5PUTLAM HARDBUFF2 TOTEMPOB 4PUTLAM ;   * DD331

* ROMPTR 0B1 00D
* refs (1): DCB83
* Puts back the display and the menu under the box.
MsgBoxRestore:
        :: 5GETLAM HARDBUFF BINT16 6GETLAM GROB! 4GETLAM HARDBUFF2 ZEROZERO * DD34A
          GROB! ;                                * DD377

* ROMPTR 0B1 00E
* refs (1): DCB83
Ck&DoMsgBox:
        :: BINT15 BINT10 MINUSONE ' XLIB ~MsgBoxMenu XLIB ~DoMsgBox DROP ; * DD381

* ROMPTR 0B1 00F
* refs (1): DCB83
* ->: lets the user work on the stack and command line from inside a form, in an outer loop of its own, until CANCEL or OK. Called with a title in the locals.
StackUI:
        :: POLSaveUI ERRSET                      * DD3BA
          :: FALSE FALSE BINT5 XLIB ~nNullBind InitEd&Modes ' * DD3C9
            XLIB StackUIDisp ' XLIB StackUIKeys TrueFalse 4GETLAM ONEFALSE ' * DD3F2
            2GETLAM '                            * DD421
            :: SysErrorTrap AtUserStack ; POLSetUI ClrDAsOK AtUserStack * DD42B
            POLKeyUI ABND ;                      * DD44E
          ERRTRAP POLResUI&Err POLRestoreUI ClrDAsOK ; * DD45D

* ROMPTR 0B1 010
* refs (1): DCB83
* Display procedure of StackUI: redraws the stack, the edit line, the header and the menu as needed.
StackUIDisp:
        :: DA2aOK? DUP ITE SetDA2aTempF ClrDA2aTempF * DD476
          ?SKIP ?DispStack                       * DD494
          DA2aTempF? DA2bOK?NOTIT DispEditLine DA3OK? DUPUNROT NOTAND * DD49E
          XLIB ~MenuDef@;4GETLAM;EQUAL NOTAND IT SetDA1Bad * DD4BC
          ?SKIP ?DispMenu                        * DD4D6
          DA1OK? ?SKIP XLIB StackUIHdr           * DD4E0
          ClrDAsOK ;                             * DD4F5

* ROMPTR 0B1 011
* refs (1): DCB83
* Redraws the header unless a key is waiting.
StackUIHdr:
        :: KEYINBUFFER? NOTcase XLIB StackUIHdr1 * DD4FF
          SetDA1Bad ;                            * DD519

* ROMPTR 0B1 012
* refs (1): DCB83
* Draws the header: the status area, or the title and prompt in the two top lines. When the menu has changed from the form's menu it shows "Press [CONT] for menu" instead of the prompt.
StackUIHdr1:
        :: XLIB ~MenuDef@;4GETLAM;EQUAL 3GETLAM ANDcase DispStatus * DD523
          TOADISP DispStsBound 6GETLAM EVAL DUPTYPECSTR? IT * DD542
          XLIB TitleBar$>Grob                    * DD560
          HARDBUFF ZEROZERO BINT0 BINT7 BLANKIT GROB! * DD56B
          XLIB ~MenuDef@;4GETLAM;EQUAL ITE       * DD589
          :: 5GETLAM EVAL ;                      * DD599
          :: # B901 JstGetTHEMESG ;              * DD5AD  "Press [CONT] for menu"
          DUPTYPECSTR? ITE                       * DD5C6
          :: $>grob BINT1 BINT8 ;                * DD5D0
          :: BINT1 BINT7 ;                       * DD5E9
          HARDBUFF 3UNROLL BINT7 BINT7 BLANKIT GROB! SetDA1Valid ; * DD5FD

* ROMPTR 0B1 013
* refs (1): DCB83
~MenuDef@;4GETLAM;EQUAL:
        :: MenuDef@ 4GETLAM EQUAL ;              * DD625

* ROMPTR 0B1 014
* refs (1): DCB83
* The menu: STS, CANCEL and OK.
StackUIMenu:
        :: NoExitAction                          * DD63E
          {                                      * DD648
            {                                    * DD64D
              :: PTR Box/StdLbl: $ "STS" 3GETLAM ; XLIB StackUISts } * DD652
            NullMenuKey NullMenuKey NullMenuKey  * DD686
            { $ "(AN(L" XLIB StackUICancel }     * DD695
            { $ "OK" XLIB StackUIOK } }          * DD6BE
        ;                                        * DD6E6

* ROMPTR 0B1 015
* refs (1): DCB83
* Key handler: the ON key cancels, and left-shifted ON brings back the form's menu.
StackUIKeys:
        :: BINT1 #=casedrop XLIB StackUIOn       * DD6EB
          BINT2 #=casedrop XLIB StackUICont      * DD705
          BINT4 #=casedrop XLIB StackUIOn        * DD71A
          2DROPFALSE ;                           * DD72F

* ROMPTR 0B1 016
* refs (1): DCB83
* ON key unshifted: cancels.
StackUIOn:
        :: BINT45 ?CaseKeyDef XLIB StackUICancel DROPFALSE ; * DD739

* ROMPTR 0B1 017
* refs (1): DCB83
* Shifted ON key (CONT): restores the menu.
StackUICont:
        :: BINT45 ?CaseKeyDef XLIB StackUIMenuBack DROPFALSE ; * DD75D

* ROMPTR 0B1 018
* refs (1): DCB83
* Restores the menu that StackUI started with.
StackUIMenuBack:
        :: TakeOver 4GETLAM InitMenu SetDA2NoCh ; * DD781

* ROMPTR 0B1 019
* refs (1): DCB83
* STS key: switches the status area on or off.
StackUISts:
        :: TakeOver 3GETLAM NOT 3PUTLAM SetDA2NoCh ; * DD79F

* ROMPTR 0B1 01A
* refs (1): DCB83
* CANCEL: first clears the edit line or redisplay; otherwise leaves with FALSE.
StackUICancel:
        :: TakeOver EditLExists? DAsBad? ORcase KeyN_ON * DD7C2
          FALSE TRUE 2PUTLAM ;                   * DD7E0

* ROMPTR 0B1 01B
* refs (1): DCB83
* OK: enters the command line, or duplicates level 1 when there is none, and leaves with TRUE when the stack holds an object.
StackUIOK:
        :: TakeOver EditExstCase ~NoEdit?case;xDUP;EnterComLine DEPTH * DD7F4
          #0<> TRUE 2PUTLAM ;                    * DD80D

* ROMPTR 0B1 01C
* refs (1): DCB83
* INFORM: title {fields} format {reset} {init} -> {values} %1 | %0. Checks the arguments, turns the description of each field into the arguments of DoInputForm, and runs it.
INFORM~1:
        :: SuspendOK? NOTcase NOHALTERR          * DD821
          4PICK INNERCOMP DUP#0= caseSIZEERR DUP * DD835
          1LAMBIND ZERO_DO ISTOP@ ROLL DUPTYPELIST? IT * DD84E
          :: DUPNULLCOMP? casedrop MINUSONE      * DD86C
            CARCOMP ;                            * DD880
          DUPTYPECSTR? OVER MINUSONE EQUAL OR NOTcase SETTYPEERR * DD88A
          LOOP 1GETABND {}N BINT1 5ROLL INNERCOMP DUP BINT2 #> caseSIZEERR * DD8AD
          :: BINT0 #=casedrop                    * DD8DF
            :: BINT1 BINT3 ;                     * DD8EE
            #1=case                              * DD902
            :: CKREAL COERCE DUP#0= caseSIZEERR BINT3 * DD907
            ;                                    * DD925
            SWAP CKREAL COERCE DUP#0= caseSIZEERR SWAP * DD92A
            CKREAL COERCE ;                      * DD948
          SWAP BINT10 #MIN SWAP BINT20 #MIN XLIB InformLayout DUPNULLCOMP? * DD957
          caseSIZEERR 5ROLL                      * DD985
          SWAP INNERCOMP BINT1 OVER 2NULLLAM{} BIND ZERO_DO ISTOP@ ROLL * DD98F
          'DROPFALSE >HCOMP BINT1 BEGIN ISTOP@ #2+ PICK INDEX@ 2GETLAM #+ * DD9BC
          NTHCOMPDROP DUPTYPELIST? ITE DUPNULLCOMP? FALSE * DD9EE
          WHILE                                  * DDA07
          :: DROP 2GETLAM #1+ 2PUTLAM ; REPEAT   * DDA0C
          :: CK&DISPATCH0                        * DDA2F
            BINT3                                * DDA39  string
            :: DROP MINUSONE NULL$ ;             * DDA3E
            BINT5                                * DDA57  list
            :: DUPLENCOMP DUP BINT2 #< case2drop * DDA5C
              :: MINUSONE NULL$ ;                * DDA7A
              OVER BINT2 NTHCOMPDROP DUPTYPECSTR? NcaseTYPEERR 3UNROLL * DDA8E
              DUP #2= case2drop                  * DDAAC
              :: MINUSONE SWAP BINT131 XLIB $FitLeft DROP ; * DDABB
              BINT3 SWAP SUBCOMP XLIB INFORM~2 SWAP BINT131 XLIB $FitLeft * DDAE4
              DROP ;                             * DDB13
          ;                                      * DDB1D
          BINT4 SWAP MINUSONE DUP BINT6 {}N &COMP LOOP 1GETLAM {}N SWAPDROP * DDB22
          'DROPFALSE 6ROLL BINT131 #4- XLIB $FitLeft DROP 6ROLL DUPNULLCOMP? * DDB59
          ITE                                    * DDB87
          :: DROP MINUSONE ;                     * DDB8C
          :: INNERCOMP 1GETLAM OVER #<> caseSIZEERR ZERO_DO * DDBA0
            ISTOP@ ROLL DUP ' XLIB NOVAL EQUAL IT * DDBC3  ~xNOVAL
            :: DROP MINUSONE ;                   * DDBEC
            LOOP 1GETLAM {}N ;                   * DDC00
          6ROLL DUPNULLCOMP? ITE                 * DDC14
          :: DROP MINUSONE ;                     * DDC23
          :: INNERCOMP 1GETLAM OVER #<> caseSIZEERR ZERO_DO * DDC37
            ISTOP@ ROLL DUP ' XLIB NOVAL EQUAL IT * DDC5A  ~xNOVAL
            :: DROP MINUSONE ;                   * DDC83
            LOOP 1GETLAM {}N ;                   * DDC97
          XLIB InformArgs DoInputForm NOTcase    * DDCAB
          :: ABND %0_2A2B4 ;                     * DDCC0
          1GETLAM ZERO_DO ISTOP@ ROLL DUP MINUSONE EQUAL IT * DDCD4
          :: DROP ' XLIB NOVAL ;                 * DDCFC  ~xNOVAL
          LOOP 1GETABND {}N %1 ;                 * DDD1B

* ROMPTR 0B1 01D
* refs (1): DCB83
* Checks a list of allowed types for a field: each must be a type number that an input form can edit.
INFORM~2:
        :: INNERCOMP DUP 1LAMBIND ZERO_DO ISTOP@ ROLL CKREAL COERCE * DDD34
          { BINT0 BINT1 BINT2 BINT3 BINT4 BINT5 BINT6 BINT8 BINT9 BINT10 * DDD61
            BINT13 }                             * DDD98
          OVER #=POSCOMP #0= caseSIZEERR LOOP    * DDDA2
          1GETABND {}N ;                         * DDDBB

* ROMPTR 0B1 01E
* refs (1): DCB83
* {fields} #cols ... -> {positions}: lays out the fields of INFORM on the grid of columns and rows. The labels get a share of the width.
InformLayout:
        :: BINT6 #* 3NULLLAM{} BIND INNERCOMP NULL{} DUP ROT ZERO_DO * DDDCA
          ISTOP-INDEX #2+ ROLL DUPTYPELIST? IT CARCOMP * DDDFC
          DUP MINUSONE EQUAL ITE                 * DDE1A
          :: DROP DUPNULLCOMP? ?SEMI             * DDE2E
            DUPLENCOMP 2DUP NTHCOMPDROP DUP BINT2 NTHCOMPDROP * DDE42
            { BINT8 BINT17 BINT26 BINT35 } 3GETLAM INDEX@ 2GETLAM #/ * DDE60
            SWAPDROP #+ NTHELCOMP ?SKIP MINUSONE * DDE92
            #<> case2DROP BINT131                * DDEAB
            #2- 2GETLAM #/ SWAPDROP BINT6 #/ SWAPDROP BINT6 #* SWAP * DDEBA
            INCOMPDROP SWAP 5ROLL #+ SWAP BINT4 {}N SWAPROT PUTLIST ; * DDEEC
          :: BINT131 #2- 2GETLAM #1- BINT5 #* #-Floor0 2GETLAM #/ SWAPDROP * DDF1E
            DUP BINT5 #+ INDEX@ 2GETLAM #/ DROP #* #1+ BINT131 #2- #MIN 2DUP * DDF55
            #+ BINT7 #-Floor0 BINT2 #-Floor0 1GETLAM DUP#0<> ITE * DDF96
            :: 3PICK ROT XLIB #Round-Down ; DROP * DDFBE
            OVER 5PICK XLIB ~$>grob;GROBDIMw #+ BINT2 #+ 1GETLAM DUP#0<> ITE * DDFE2
            :: 4PICK ROT XLIB #Round-Up ; DROP   * DE015
            #MIN BINT131 #2- #MIN 2DUP SWAP #-Floor0 BINT2 #-Floor0 5ROLL * DE039
            SWAP XLIB $FitLeft DROP 4UNROLL ROT 3PICK #1-+ OVER #-Floor0 #1- * DE06B
            BINT6 #/ SWAPDROP BINT6 #* #1+ BINT9 ROT * DE0A3
            { BINT8 BINT17 BINT26 BINT35 } 3GETLAM INDEX@ 2GETLAM #/ * DE0CB
            SWAPDROP #+ DUP BINT4 #> case 7DROP  * DE0FD
            NTHCOMPDROP 2SWAP BINT4 {}N 4ROLLSWAP >TCOMP 3UNROLL * DE120
            { BINT10 BINT19 BINT28 BINT37 } 3GETLAM INDEX@ 2GETLAM #/ * DE143
            SWAPDROP #+ NTHCOMPDROP BINT3 {}N ROTSWAP >TCOMP SWAP ; * DE175
          LOOP ABND ;                            * DE1A2

* ROMPTR 0B1 020
* refs (2): DCB83 DCB83
* #x #step ... -> #: rounds down to the column grid.
#Round-Down:
        :: OVER #1-- 3PICK #/ SWAPDROP ROT #* #+ ; * DE1B1

* ROMPTR 0B1 021
* refs (1): DCB83
* #x #step ... -> #: rounds up to the column grid.
#Round-Up:
        :: OVER #1-- 3PICK #/ SWAP #0<> IT #1+   * DE1E3
          ROT #* #+ ;                            * DE210

* ROMPTR 0B1 022
* refs (1): DCB83
* -> ...: unpacks the labels and fields made by INFORM onto the stack in the order DoInputForm expects, adding the reset and initial values.
InformArgs:
        :: MINUSONE MINUSONE BINT8 XLIB ~nNullBind 9GETLAM INNERCOMP DUP * DE224
          3PUTLAM ZERO_DO ISTOP-INDEX INDEX@ #3* #+ ROLL INCOMPDROP LOOP * DE252
          8GETLAM INNERCOMP DUP 2PUTLAM ZERO_DO ISTOP-INDEX INDEX@ BINT13 #* * DE27F
          #+ ROLL INCOMPDROP 5GETLAM DUP MINUSONE EQUAL ?SKIP * DE2AC
          :: INDEX@ #1+ NTHCOMPDROP ;            * DE2D4
          4GETLAM DUP MINUSONE EQUAL ?SKIP       * DE2ED
          :: INDEX@ #1+ NTHCOMPDROP ;            * DE306
          LOOP 3GETLAM 2GETLAM 7GETLAM 6GETLAM ABND ; * DE31F

LIB0B1.hash:
        CON(5)  DOHSTR                           * DE342  hash table of library 0B1
        LENGTH                                   * DE347  length, to #DE3A6
        CON(5)  0                                * DE34C  names of length 1
        CON(5)  0                                * DE351  names of length 2
        CON(5)  0                                * DE356  names of length 3
        CON(5)  0                                * DE35B  names of length 4
        CON(5)  0                                * DE360  names of length 5
        CON(5)  0                                * DE365  names of length 6
        CON(5)  0                                * DE36A  names of length 7
        CON(5)  0                                * DE36F  names of length 8
        CON(5)  0                                * DE374  names of length 9
        CON(5)  0                                * DE379  names of length 10
        CON(5)  0                                * DE37E  names of length 11
        CON(5)  0                                * DE383  names of length 12
        CON(5)  0                                * DE388  names of length 13
        CON(5)  0                                * DE38D  names of length 14
        CON(5)  0                                * DE392  names of length 15
        CON(5)  0                                * DE397  names of length 16
        REL(5)  LIB0B1.hash.L1                   * DE39C  end of the names
LIB0B1.hash.L1:
        CON(5)  0                                * DE3A1  command 000 has no name
        ENDLENGTH                                * DE3A6

LIB0B1.link:
        CON(5)  DOHSTR                           * DE3A6  link table of library 0B1
        LENGTH                                   * DE3AB  length, to #DE45F
        REL(5)  ~DoMsgBox                        * DE3B0  000 ~DoMsgBox
        REL(5)  ~DoMsgBox~1                      * DE3B5  001 
        REL(5)  ~MsgBoxMenu                      * DE3BA  002 ~MsgBoxMenu
        REL(5)  MsgBoxKeys                       * DE3BF  003 
        REL(5)  MsgBoxPlain                      * DE3C4  004 
        REL(5)  MsgBoxLS                         * DE3C9  005 
        REL(5)  MsgBoxRS                         * DE3CE  006 
        REL(5)  MsgBoxAlpha                      * DE3D3  007 
        REL(5)  MsgBoxDraw                       * DE3D8  008 
        REL(5)  DoMKeyOK                         * DE3DD  009 DoMKeyOK
        REL(5)  MsgLine                          * DE3E2  00A 
        REL(5)  MsgBoxLines                      * DE3E7  00B 
        REL(5)  MsgBoxSave                       * DE3EC  00C 
        REL(5)  MsgBoxRestore                    * DE3F1  00D 
        REL(5)  Ck&DoMsgBox                      * DE3F6  00E Ck&DoMsgBox
        REL(5)  StackUI                          * DE3FB  00F 
        REL(5)  StackUIDisp                      * DE400  010 
        REL(5)  StackUIHdr                       * DE405  011 
        REL(5)  StackUIHdr1                      * DE40A  012 
        REL(5)  ~MenuDef@;4GETLAM;EQUAL          * DE40F  013 
        REL(5)  StackUIMenu                      * DE414  014 
        REL(5)  StackUIKeys                      * DE419  015 
        REL(5)  StackUIOn                        * DE41E  016 
        REL(5)  StackUICont                      * DE423  017 
        REL(5)  StackUIMenuBack                  * DE428  018 
        REL(5)  StackUISts                       * DE42D  019 
        REL(5)  StackUICancel                    * DE432  01A 
        REL(5)  StackUIOK                        * DE437  01B 
        REL(5)  INFORM~1                         * DE43C  01C 
        REL(5)  INFORM~2                         * DE441  01D 
        REL(5)  InformLayout                     * DE446  01E 
        REL(5)  #Round-Down                      * DE44B  01F 
        REL(5)  #Round-Down                      * DE450  020 
        REL(5)  #Round-Up                        * DE455  021 
        REL(5)  InformArgs                       * DE45A  022 
