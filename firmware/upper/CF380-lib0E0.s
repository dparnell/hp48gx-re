* HP 48GX ROM revision R, #CF380-#D1361: The browser: stores and recalls for its 16 locals, key handlers, list movement, search by letter, and drawing of rows, scroll arrows and the view of a long item
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~BRoutput ~BRbrowse ~BRStoC1 ~BRRclCurRow ~BRRclC1 BRinverse BRdone BRY0@ BRY0! BRViewItem BRUpKey BRUp1
* Follows on from the previous file (at #CF380 in the original ROM).
        ENDLENGTH                                * CF380

        CON(5)  DOLIB                            * CF380  library object
        LENGTH                                   * CF385  length, to #D1362
        CON(2)  0                                * CF38A  title length

* Library 0E0: The full-screen list browser behind the Equation Library and Constants Library catalogs: scrolling, paging, a menu, search by first letter and viewing of long items.
LIB0E0:
        CON(3)  #0E0                             * CF38C  library number
        REL(5)  LIB0E0.hash                      * CF38F  hash table
        CON(5)  0                                * CF394  message table
        REL(5)  LIB0E0.link                      * CF399  link table
        CON(5)  0                                * CF39E  config
        RPL

* ROMPTR 0E0 000
* refs (1): CF38C
* # -> : stores BR1, the item at the top of the window.
BRTop!:
        :: ' LAM 'BR1 STO ;                      * CF3A3

* ROMPTR 0E0 001
* refs (1): CF38C
* # -> : stores BR2, the item at the bottom of the window.
BRBot!:
        :: ' LAM 'BR2 STO ;                      * CF3C6

* ROMPTR 0E0 002
* refs (1): CF38C
* # -> : stores BR3, the current item.
BRCur!:
        :: ' LAM 'BR3 STO ;                      * CF3E9

* ROMPTR 0E0 003
* refs (1): CF38C
* $ -> : stores BR5, the data that the item procedure reads.
~BRStoC1:
        :: ' LAM 'BR5 STO ;                      * CF40C

* ROMPTR 0E0 004
* refs (1): CF38C
* # -> : stores BR6, the number of items.
BRCount!:
        :: ' LAM 'BR6 STO ;                      * CF42F

* ROMPTR 0E0 005
* refs (1): CF38C
* # -> : stores BR12, the bottom pixel row of the highlight bar.
BRHiBot!:
        :: ' LAM 'BR12 STO ;                     * CF452

* ROMPTR 0E0 006
* refs (1): CF38C
* # -> : stores BR14, the top pixel row of the highlight bar.
BRHiTop!:
        :: ' LAM 'BR14 STO ;                     * CF477

* ROMPTR 0E0 007
* refs (1): CF38C
* # -> : stores BR16, the pixel row of the first line: 0, or 8 under a title.
BRY0!:
        :: ' LAM 'BR16 STO ;                     * CF49C

* ROMPTR 0E0 008
* refs (1): CF38C
* flag -> : stores BR20, which ends the key loop.
BRExit!:
        :: ' LAM 'BR20 STO ;                     * CF4C1

* ROMPTR 0E0 009
* refs (1): CF38C
* {} -> : stores BR21, the actions for ENTER and ON.
BRActions!:
        :: ' LAM 'BR21 STO ;                     * CF4E6

* ROMPTR 0E0 00A
* refs (1): CF38C
* ob -> : stores BR22, the procedure that gives the text of an item.
BRItemProc!:
        :: ' LAM 'BR22 STO ;                     * CF50B

* ROMPTR 0E0 00B
* refs (1): CF38C
* chr -> : stores BR24, the last letter searched for, or 0.
BRLastChar!:
        :: ' LAM 'BR24 STO ;                     * CF530

* ROMPTR 0E0 00C
* refs (1): CF38C
* chr -> : stores BR25, the letter being searched for.
BRChar!:
        :: ' LAM 'BR25 STO ;                     * CF555

* ROMPTR 0E0 00D
* refs (1): CF38C
* # -> : stores BR26, the number of lines in the window.
BRRows!:
        :: ' LAM 'BR26 STO ;                     * CF57A

* ROMPTR 0E0 00E
* refs (1): CF38C
* {} -> : stores BR27, a list giving the first item for each letter, or an empty list.
BRIndex!:
        :: ' LAM 'BR27 STO ;                     * CF59F

* ROMPTR 0E0 00F
* refs (1): CF38C
* # -> : stores BR28, the number of menu keys.
BRMenuLen!:
        :: ' LAM 'BR28 STO ;                     * CF5C4

* ROMPTR 0E0 010
* refs (1): CF38C
* Runs the browser: clears the display, binds the locals, draws the title, items and highlight, and runs the parameterized outer loop until BRExit is set.
~BRbrowse:
        :: CLCD10 UnLockAlpha XLIB BRInit XLIB BRDispItems XLIB BRinverse * CF5E9
          ClrDAsOK RESOROMP XLIB BRDispMenu RESOROMP XLIB BRKeys TrueTrue * CF619
          5ROLL ONEFALSE' LAM 'BR20 'ERRJMP POLSetUI POLKeyUI ABND ClrDAsOK ; * CF643

* ROMPTR 0E0 011
* refs (1): CF38C
* Display procedure of the key loop: redraws the menu when it isn't valid.
BRDispMenu:
        :: DA3OK? ?SKIP                          * CF67C
          :: DispMenu SetDA3Valid ;              * CF68B
        ;                                        * CF69F

* ROMPTR 0E0 012
* refs (1): CF38C
* -> #top #current: the state of the browser for the caller, typically to reopen it at the same place.
~BRoutput:
        :: XLIB BRTop@ XLIB ~BRRclCurRow ;       * CF6A4

* ROMPTR 0E0 013
* refs (1): CF38C
* Asks the key loop to stop.
BRdone:
        :: SetKeysNS TRUE XLIB BRExit! ;         * CF6C4

* ROMPTR 0E0 014
* refs (1): CF38C
* Binds BR1 to BR28 and works out the window from the title: seven lines, or six under a title, or fewer for a short list. Draws the title and places the highlight.
BRInit:
        :: 8PICK LENCOMP BINT0 BINT9 NDUPN DROP  * CF6E3
          {                                      * CF706

* ROMPTR 0E0 015
* refs (1): CF38C
* -> {}: BR21.
BRActions@:
            LAM 'BR21                            * CF70B

* ROMPTR 0E0 016
* refs (1): CF38C
* -> #: BR1.
BRTop@:
            LAM 'BR1                             * CF71C

* ROMPTR 0E0 017
* refs (1): CF38C
~BRRclCurRow:
            LAM 'BR3                             * CF72B

* ROMPTR 0E0 018
* refs (1): CF38C
~BRRclC1:
            LAM 'BR5                             * CF73A

* ROMPTR 0E0 019
* refs (1): CF38C
* -> ob: BR22, the item procedure.
BRGetItem~1:
            LAM 'BR22                            * CF749

* ROMPTR 0E0 01A
* refs (1): CF38C
* -> {}: BR27.
BRIndex@:
            LAM 'BR27                            * CF75A

* ROMPTR 0E0 01B
* refs (1): CF38C
* -> #: BR28.
BRMenuLen@:
            LAM 'BR28                            * CF76B

* ROMPTR 0E0 01C
* refs (1): CF38C
* -> #: BR2.
BRBot@:
            LAM 'BR2                             * CF77C

* ROMPTR 0E0 01D
* refs (1): CF38C
* -> #: BR6.
BRCount@:
            LAM 'BR6                             * CF78B

* ROMPTR 0E0 01E
* refs (1): CF38C
* -> #: BR12.
BRHiBot@:
            LAM 'BR12                            * CF79A

* ROMPTR 0E0 01F
* refs (1): CF38C
* -> #: BR14.
BRHiTop@:
            LAM 'BR14                            * CF7AB

* ROMPTR 0E0 020
* refs (1): CF38C
* -> #: BR16.
BRY0@:
            LAM 'BR16                            * CF7BC

* ROMPTR 0E0 021
* refs (1): CF38C
* -> flag: BR20.
BRExit@:
            LAM 'BR20                            * CF7CD

* ROMPTR 0E0 022
* refs (1): CF38C
* -> chr: BR24.
BRLastChar@:
            LAM 'BR24                            * CF7DE

* ROMPTR 0E0 023
* refs (1): CF38C
* -> chr: BR25.
BRChar@:
            LAM 'BR25                            * CF7EF

* ROMPTR 0E0 024
* refs (1): CF38C
* -> #: BR26.
BRRows@:
            LAM 'BR26 }                          * CF800
          BIND DUPNULL$? ITE DROPZERO            * CF816
          :: XLIB BRTitle BINT8 ;                * CF82A
          DUP XLIB BRY0! XLIB ~BRRclC1 BINT0 XLIB BRGetItem~1 EVAL DUP * CF844
          XLIB BRCount! SWAP #0=ITE BINT7 BINT6 OVER #MIN DUP XLIB BRRows! * CF879
          XLIB BRTop@ #1-+ #MIN XLIB BRBot! FALSE XLIB BRExit! * CF8B2
          XLIB ~BRRclCurRow XLIB BRHiRows ;      * CF8E2

* ROMPTR 0E0 025
* refs (1): CF38C
* #key #plane -> ... : key handler: sends each shift plane to its own table.
BRKeys:
        :: BINT1 #=casedrop XLIB BRKeysPlain     * CF8FD
          BINT2 #=casedrop XLIB BRKeysLS         * CF917
          BINT3 #=casedrop XLIB BRKeysRS         * CF92C
          BINT4 #=casedrop XLIB BRKeysAlpha      * CF941
          BINT5 #=casedrop XLIB BRKeysLSAlpha    * CF956
          DROP XLIB BRKeysRSAlpha ;              * CF96B

* ROMPTR 0E0 026
* refs (1): CF38C
* Unshifted keys: up and down arrows, NXT, ENTER and ON. Menu keys pass through, the shifts do nothing, and any other key searches by letter.
BRKeysPlain:
        :: BINT11 ?CaseRomptr@ XLIB BRUpKey BINT12 ?CaseRomptr@ * CF980
          XLIB BRNextMenu BINT17 ?CaseRomptr@ XLIB BRDownKey BINT25 * CF9A4
          ?CaseRomptr@ XLIB BREnter BINT45 ?CaseRomptr@ XLIB BRCancel BINT30 * CF9C9
          #=casedrpfls BINT35                    * CF9F3
          #=casedrpfls BINT40                    * CF9FD
          #=casedrpfls DUP                       * CFA07
          BINT7 #< casedrpfls BINT1              * CFA11
          XLIB BRKeyChar ;                       * CFA25

* ROMPTR 0E0 027
* refs (1): CF38C
* Left-shifted keys: page up and down, previous menu row and viewing the item with ENTER.
BRKeysLS:
        :: BINT11 ?CaseRomptr@ XLIB BRPageUp BINT12 ?CaseRomptr@ * CFA35
          XLIB BRPrevMenu BINT17 ?CaseRomptr@ XLIB BRPageDown BINT25 * CFA59
          ?CaseRomptr@ XLIB BRViewItem BINT35 #=casedrpfls BINT40 * CFA7E
          #=casedrpfls BINT2                     * CFA9D
          XLIB BRKeyChar ;                       * CFAA7

* ROMPTR 0E0 028
* refs (1): CF38C
* Right-shifted keys: first and last item, first menu row and viewing the item with ENTER.
BRKeysRS:
        :: BINT11 ?CaseRomptr@ XLIB BRFirst BINT12 ?CaseRomptr@ * CFAB7
          XLIB BRFirstMenu BINT17 ?CaseRomptr@ XLIB BRLast BINT25 * CFADB
          ?CaseRomptr@ XLIB BRViewItem BINT35 #=casedrpfls BINT40 * CFB00
          #=casedrpfls BINT45                    * CFB1F
          #=casedrpfls BINT3                     * CFB29
          XLIB BRKeyChar ;                       * CFB33

* ROMPTR 0E0 029
* refs (1): CF38C
* Alpha keys: ENTER and ON act as usual; others search by letter.
BRKeysAlpha:
        :: BINT25 ?CaseRomptr@ XLIB BREnter BINT45 ?CaseRomptr@ * CFB43
          XLIB BRCancel BINT30 #=casedrpfls BINT35 * CFB67
          #=casedrpfls BINT40                    * CFB81
          #=casedrpfls BINT4                     * CFB8B
          XLIB BRKeyChar ;                       * CFB95

* ROMPTR 0E0 02A
* refs (1): CF38C
* Left-shifted alpha keys.
BRKeysLSAlpha:
        :: BINT45 ?CaseRomptr@ XLIB BRCancel BINT25 ?CaseRomptr@ * CFBA5
          XLIB BREnter BINT35 #=casedrpfls BINT40 * CFBC9
          #=casedrpfls BINT5                     * CFBE3
          XLIB BRKeyChar ;                       * CFBED

* ROMPTR 0E0 02B
* refs (1): CF38C
* Right-shifted alpha keys.
BRKeysRSAlpha:
        :: BINT45 #=casedrpfls BINT25            * CFBFD
          ?CaseRomptr@ XLIB BREnter BINT35 #=casedrpfls BINT40 * CFC11
          #=casedrpfls BINT6                     * CFC30
          XLIB BRKeyChar ;                       * CFC3A

* ROMPTR 0E0 02C
* refs (1): CF38C
* #key #plane -> ob TRUE: turns a key into its character and returns the search as the key's action. A key with no character beeps.
BRKeyChar:
        :: Key>StdKeyOb DUPTYPECHAR? ITE         * CFC4A
          :: XLIB BRChar! RESOROMP XLIB BRSearch ; * CFC5E
          :: DROP 'DoBadKey ;                    * CFC83
          TRUE ;                                 * CFC97

* ROMPTR 0E0 02D
* refs (1): CF38C
* NXT: next menu row. A bad key if the menu has a single row.
BRNextMenu:
        :: TakeOver XLIB BRMenuLen@ BINT7 #< case DoBadKey * CFCA1
          BINT6 SetSomeRow DispMenu XLIB BRinverse XLIB BRDispItems * CFCCA
          XLIB BRinverse ;                       * CFCEF

* ROMPTR 0E0 02E
* refs (1): CF38C
* Left-shifted NXT: previous menu row.
BRPrevMenu:
        :: TakeOver XLIB BRMenuLen@ BINT7 #< case DoBadKey * CFCFF
          DoPrevRow DispMenu XLIB BRinverse XLIB BRDispItems XLIB BRinverse ; * CFD28

* ROMPTR 0E0 02F
* refs (1): CF38C
* Right-shifted NXT: first menu row.
BRFirstMenu:
        :: TakeOver XLIB BRMenuLen@ BINT7 #< case DoBadKey * CFD58
          DoFirstRow DispMenu XLIB BRinverse XLIB BRDispItems XLIB BRinverse ; * CFD81

* ROMPTR 0E0 030
* refs (1): CF38C
* Up arrow, with key repeat.
BRUpKey:
        :: TakeOver REPEATER BINT11 XLIB BRUp1 ; * CFDB1

* ROMPTR 0E0 031
* refs (1): CF38C
* Down arrow, with key repeat.
BRDownKey:
        :: TakeOver REPEATER BINT17 XLIB BRDown1 ; * CFDD5

* ROMPTR 0E0 032
* refs (1): CF38C
* Moves up one item, scrolling if needed. At the top it wraps to the last item.
BRUp1:
        :: XLIB ~BRRclCurRow #1-DUP #0=case      * CFDF9
          :: DROP XLIB BRLast ;                  * CFE13
          XLIB BRinverse DUP XLIB BRCur! DUP XLIB BRTop@ #< IT * CFE2D
          :: DUP XLIB BRTop! XLIB BRBot@ #1- XLIB BRBot! XLIB BRScrollDn DUP * CFE62
            XLIB BRDisp1 XLIB BRArrows ;         * CFEA2
          XLIB BRHiRows XLIB BRinverse ;         * CFEBD

* ROMPTR 0E0 033
* refs (1): CF38C
* Moves down one item, scrolling if needed. At the end it wraps to the first item.
BRDown1:
        :: XLIB ~BRRclCurRow DUP XLIB BRCount@ #= casedrop XLIB BRFirst * CFED8
          #1+ XLIB BRinverse DUP XLIB BRCur! DUP XLIB BRBot@ #> IT * CFF0D
          :: DUP XLIB BRBot! XLIB BRTop@ #1+ XLIB BRTop! XLIB BRScrollUp DUP * CFF47
            XLIB BRDisp1 XLIB BRArrows ;         * CFF87
          XLIB BRHiRows XLIB BRinverse ;         * CFFA2

* ROMPTR 0E0 034
* refs (1): CF38C
* Moves up a window of items, or to the top of the window first when the current item is inside it.
BRPageUp:
        :: TakeOver XLIB BRResetChar XLIB ~BRRclCurRow #1=case XLIB BRLast * CFFBD
          XLIB BRinverse XLIB BRTop@ DUP XLIB ~BRRclCurRow #<> ITE * CFFED
          XLIB BRCur!                            * D001D
          :: DUP XLIB BRRows@ #>ITE              * D0028
            :: DUP XLIB BRRows@ #-DUP XLIB BRTop! XLIB BRCur! #1- ; * D0042
            :: DROP ONEONE XLIB BRTop! XLIB BRCur! XLIB BRRows@ ; * D007C
            XLIB BRBot! XLIB BRDispItems ;       * D00B1
          XLIB BRSetHi ;                         * D00CC

* ROMPTR 0E0 035
* refs (1): CF38C
* Moves down a window of items, or to the bottom of the window first.
BRPageDown:
        :: TakeOver XLIB BRResetChar XLIB ~BRRclCurRow XLIB BRCount@ * D00DC
          #=casedrop XLIB BRFirst                * D0107
          XLIB BRinverse XLIB BRBot@ DUPUNROT #<> ITE XLIB BRCur! * D0117
          :: DUP XLIB BRRows@ #+ XLIB BRCount@ #<ITE * D0147
            :: XLIB BRRows@ OVER #+DUP XLIB BRCur! XLIB BRBot! #1+ ; * D0171
            :: DROP XLIB BRCount@ DUP XLIB BRBot! DUP XLIB BRCur! * D01AB
              XLIB BRRows@ #1-- ;                * D01E0
            XLIB BRTop! XLIB BRDispItems ;       * D01F5
          XLIB BRSetHi ;                         * D0210

* ROMPTR 0E0 036
* refs (1): CF38C
* Goes to the first item.
BRFirst:
        :: TakeOver XLIB BRResetChar XLIB BRTop@ #1= case * D0220
          :: XLIB ~BRRclCurRow BINT1 #=casedrop DoBadKey * D024A
            DROP BINT1 XLIB BRCur! XLIB BRMoveHi ; * D0269
          XLIB BRinverse BINT1 XLIB BRCur! BINT1 XLIB BRTop! XLIB BRRows@ * D028E
          XLIB BRBot! XLIB BRDispItems XLIB BRSetHi ; * D02C4

* ROMPTR 0E0 037
* refs (1): CF38C
* Goes to the last item.
BRLast:
        :: TakeOver XLIB BRResetChar XLIB BRCount@ XLIB BRBot@ OVER #= case * D02EA
          :: XLIB ~BRRclCurRow OVER#=case        * D0324
            :: DROP DoBadKey ;                   * D0339
            XLIB BRCur! XLIB BRMoveHi ;          * D034D
          XLIB BRinverse DUP XLIB BRCur! DUP XLIB BRRows@ #1-- XLIB BRTop! * D0368
          XLIB BRBot! XLIB BRDispItems XLIB BRSetHi ; * D03A3

* ROMPTR 0E0 038
* refs (1): CF38C
* ENTER: runs the first of the two actions.
BREnter:
        :: TakeOver XLIB BRResetChar XLIB BRActions@ CARCOMP COLA_EVAL ; * D03C9

* ROMPTR 0E0 039
* refs (1): CF38C
* ON: runs the second of the two actions.
BRCancel:
        :: TakeOver XLIB BRResetChar XLIB BRActions@ BINT2 NTHCOMPDROP * D03F8
          COLA_EVAL ;                            * D0422

* ROMPTR 0E0 03A
* refs (1): CF38C
* Search by letter: the same letter again looks for the next item, a new letter looks from the start.
BRSearch:
        :: TakeOver XLIB BRChar@ XLIB BRSameChar? ITE XLIB BRSearchNext * D042C
          XLIB BRSearchNew                       * D045C
        ;                                        * D0467

* ROMPTR 0E0 03B
* refs (1): CF38C
* chr -> : looks up the letter in the index when there is one, else searches the items after the current one and then from the start. Goes to the item if found, else beeps.
BRSearchNew:
        :: DUP CHR># DUP BINT64 #> SWAP BINT91 #< AND XLIB BRIndex@ NULL{} * D046C
          EQUALNOT ANDITE                        * D04AE
          :: DUP CHR># XLIB BRIndex@ SWAP BINT64 #- NTHCOMDDUP #0<> DUP * D04B8
            ?SKIP SWAPDROP                       * D04F0
          ;                                      * D04FA
          :: DUP XLIB ~BRRclCurRow #1+ XLIB BRFind DUP ?SKIP * D04FF
            :: DROPDUP BINT1 XLIB ~BRRclCurRow XLIB BRFindTo ; * D052E
          ;                                      * D0558
          case                                   * D055D
          :: XLIB BRGoTo XLIB BRChar>Last ;      * D0562
          DROP XLIB BRResetChar DoBadKey ;       * D0582

* ROMPTR 0E0 03C
* refs (1): CF38C
* chr -> #: finds the next item starting with the same letter, wrapping to the start.
BRSearchNext:
        :: DUP XLIB ~BRRclCurRow #1+ XLIB BRFind ?SKIP * D059C
          :: DUPONE XLIB BRFind DROP ;           * D05C6
          SWAPDROP XLIB BRGoTo ;                 * D05E5

* ROMPTR 0E0 03D
* refs (1): CF38C
* chr #from -> #item TRUE TRUE | FALSE TRUE: searches to the end of the list.
BRFind:
        :: XLIB BRCount@ XLIB BRFindTo ;         * D05FA

* ROMPTR 0E0 03E
* refs (1): CF38C
* chr #from #to -> #item TRUE TRUE | FALSE TRUE: compares the first character of each item.
BRFindTo:
        :: SWAP BEGIN 2DUPSWAP #>ITE             * D061A
          :: 3DROP FalseTrue ;                   * D0633
          :: DUP XLIB BRGetItem CAR$ 4PICK EQUAL ITE * D0647
            :: ROTROT2DROP TrueTrue ;            * D0670
            :: #1+ FALSE ;                       * D0684
          ;                                      * D0698
          UNTIL ;                                * D069D

* ROMPTR 0E0 03F
* refs (1): CF38C
* #item -> : goes to an item outside the window, redrawing the window around it.
BRGoFar:
        :: XLIB ~BRRclCurRow OVER#= XLIB BRTop@ 3PICK #= ANDcase DROP * D06A7
          XLIB BRCount@ 2DUPSWAP #- XLIB BRRows@ #1- DUPROT #>ITE * D06DB
          :: OVERSWAP #-SWAP ;                   * D070A
          :: SWAPDROP OVER DUPUNROT #+ ; XLIB BRinverse XLIB BRBot! * D071E
          XLIB BRTop! XLIB BRCur! XLIB BRDispItems XLIB BRSetHi ; * D0752

* ROMPTR 0E0 040
* refs (1): CF38C
* #item -> : goes to an item, within the window if it can.
BRGoTo:
        :: DUPDUP XLIB BRTop@ #< XLIB BRBot@ ROTSWAP #> ORcase XLIB BRGoFar * D0783
          XLIB BRCur! XLIB BRMoveHi ;            * D07C2

* ROMPTR 0E0 041
* refs (1): CF38C
* chr -> : remembers the letter searched for.
BRChar>Last:
        :: XLIB BRLastChar! ;                    * D07DD

* ROMPTR 0E0 042
* refs (1): CF38C
* Forgets the last letter and unlocks alpha.
BRResetChar:
        :: BINT0 XLIB BRLastChar! UnLockAlpha ;  * D07F2

* ROMPTR 0E0 043
* refs (1): CF38C
* chr -> chr flag: is this letter the same as the last one searched for?
BRSameChar?:
        :: DUP XLIB BRLastChar@ EQUAL ;          * D0811

* ROMPTR 0E0 044
* refs (1): CF38C
* $ -> : draws the title across the top line.
BRTitle:
        :: XLIB TitleBar$>Grob ZEROZERO ROT XYGROBDISP ; * D0830

* ROMPTR 0E0 045
* refs (1): CF38C
BRDispItems:
        :: RESOROMP XLIB BRGetItem RESOROMP XLIB BRDispRow XLIB BRBot@ #1+ * D0854
          XLIB BRTop@ DO INDEX@ DUP 4PICK EVAL 3PICK EVAL LOOP 2DROP * D0889
          XLIB BRArrows ;                        * D08C1

* ROMPTR 0E0 046
* refs (1): CF38C
* #item -> : draws one item from its text.
BRDisp1:
        :: DUP XLIB BRGetItem XLIB BRDispRow ;   * D08D1

* ROMPTR 0E0 047
* refs (1): CF38C
* #item $ -> : draws an item's line: a final newline goes, other newlines become spaces, and the text is cut with "..." or padded to 21 characters.
BRDispRow:
        :: DUPDUP LEN$ DUP#0= ITE 2DROP          * D08F6
          :: SUB$1# BINT10 #= IT                 * D0914
            :: BINT1 OVERLEN$ #1- SUB$ ;         * D092D
            CODE                                 * D094B  83 nibbles
              GOSBVL  SAVPTR                     * D0955
              A=DAT1  A                          * D095C
              D1=A                               * D095F
              D1=D1+  5                          * D0962
              C=0     M                          * D0965
              C=DAT1  A                          * D0968
              CSRB                               * D096B
              D=C     A                          * D096E
              D1=D1+  3                          * D0970
              LC(2)   #0A                        * D0973
              B=C     B                          * D0977
BRDispRow.loop1:
              D1=D1+  2                          * D097A
              D=D-1   A                          * D097D
              GOC     BRDispRow.L2               * D097F
              A=DAT1  B                          * D0982
              ?A#B    B                          * D0985
              GOYES   BRDispRow.loop1            * D0988
              LA(2)   #20                        * D098A
              DAT1=A  B                          * D0991
              GONC    BRDispRow.loop1            * D0994
BRDispRow.L2:
              GOSBVL  GETPTR                     * D0997
              A=DAT0  A                          * D099E
              D0=D0+  5                          * D09A1
              PC=(A)                             * D09A4
            ENDCODE                              * D09A8
          ;                                      * D09A8
          BINT21 OVERLEN$ 2DUP#< ITE             * D09AD
          :: DROP 1_#1-SUB$ CHR_... >T$ ;        * D09C1
          :: 2DUP#= ITE 2DROP                    * D09DF
            :: #- Blank$ &$ ;                    * D09F3
          ;                                      * D0A0C
          Hi$>GROB SWAP XLIB BRTop@ #- #8* XLIB BRY0@ #+ ONESWAP ROT * D0A11
          HiRowDisp ;                            * D0A4A

* ROMPTR 0E0 048
* refs (1): CF38C
* Draws the scroll arrows at the right edge: at the top if items lie above the window, at the bottom if items lie below.
BRArrows:
        :: # 7F DUP XLIB BRY0@ XLIB BRTop@ #1= ITE XLIB BRArrowOff * D0A54
          XLIB BRArrowUp                         * D0A93
          HiArrowDisp BINT48 XLIB BRBot@ XLIB BRCount@ #=ITE XLIB BRArrowOff * D0A9E
          XLIB BRArrowDn HiArrowDisp ;           * D0ACE

* ROMPTR 0E0 049
* refs (1): CF38C
BRinverse:
        :: HARDBUFF BINT0 XLIB BRHiTop@ 2DUP 5PICK 3UNROLL # 7F * D0AE3
          XLIB BRHiBot@ SUBGROB INVGROB 4UNROLL HiGROB! ; * D0B16

* ROMPTR 0E0 04A
* refs (1): CF38C
* Moves the window's lines down one line, in the display, and blanks the top line.
BRScrollDn:
        :: BINT1 XLIB BRLineXY HARDBUFF XLIB BRRows@ BINT2 #- BINT0 * D0B3A
          XLIB BRLineBox 3PICK 6UNROLL SUBGROB SWAP ZEROSWAP * D0B6E
          XLIB BRBlankLine XYGROBDISP HiGrobDisp ; * D0B92

* ROMPTR 0E0 04B
* refs (1): CF38C
* -> grob: a blank 127 x 8 line.
BRBlankLine:
        ::                                       * D0BAC
          GROB    "images/D0BB1.png"             * D0BB1  127 x 8
        ;                                        * D0CC5

* ROMPTR 0E0 04C
* refs (1): CF38C
* Moves the window's lines up one line, in the display, and blanks the last line.
BRScrollUp:
        :: BINT0 XLIB BRLineXY HARDBUFF XLIB BRRows@ #1- BINT1 * D0CCA
          XLIB BRLineBox DUP BINT7 #- 6UNROLL SUBGROB SWAP#1- ZEROSWAP * D0CF9
          XLIB BRBlankLine XYGROBDISP HiGrobDisp ; * D0D27

* ROMPTR 0E0 04D
* refs (1): CF38C
* Takes the highlight off the old line, and puts it on the current one.
BRMoveHi:
        :: XLIB BRinverse XLIB BRSetHi ;         * D0D41

* ROMPTR 0E0 04E
* refs (1): CF38C
* Works out the highlight's rows for the current item and draws it.
BRSetHi:
        :: XLIB ~BRRclCurRow XLIB BRHiRows XLIB BRinverse ; * D0D61

* ROMPTR 0E0 04F
* refs (1): CF38C
* #item -> : stores the pixel rows of the highlight bar for an item.
BRHiRows:
        :: XLIB BRTop@ #- #8* XLIB BRY0@ #+ DUP#0=ITE * D0D8C
          :: DUP #8+ ;                           * D0DBB
          :: DUP#1- SWAP #8+ ; XLIB BRHiBot! XLIB BRHiTop! ; * D0DCF

* ROMPTR 0E0 050
* refs (1): CF38C
* #line -> #0 #y: display position of a line of the window.
BRLineXY:
        :: #8* XLIB BRY0@ #+ ZEROSWAP ;          * D0E03

* ROMPTR 0E0 051
* refs (1): CF38C
* #line #n -> #x1 #y1 #x2 #y2: the box of n lines, for SUBGROB.
BRLineBox:
        :: #8* XLIB BRY0@ DUPUNROT #+ SWAPROT #1+ #8* #+ BINT0 3UNROLL # 7F * D0E27
          SWAP ;                                 * D0E6E

* ROMPTR 0E0 052
* refs (1): CF38C
* Left-shifted ENTER: shows a long item in full, wrapped to lines of 22 characters in the 5x7 font, until ON or ENTER. An item that fits on its line beeps.
BRViewItem:
        :: XLIB ~BRRclCurRow XLIB BRGetItem BINT21 OVERLEN$ #< NOTcase * D0E78
          :: DROP BINT70 INTEGER337 setbeep ;    * D0EA7
          XLIB BRinverse TURNMENUOFF BINT8 BINT56 BLANKIT * D0EC5
          :: BINT1 # 9A SUB$ DUP NEWLINE$ BINT1 POS$ DUP#0<> case * D0EE4
            :: BINT0 3UNROLL BEGIN DUP#0<> WHILE * D0F1B
              :: ROT#1+UNROT SWAPDUP ROT#1+ NEWLINE$ SWAP POS$ ; REPEAT * D0F39
              DROPSWAP ;                         * D0F66
            NULL$ ROT BEGIN DUPLEN$ BINT22 #> WHILE * D0F70
            :: DUPONE BINT22 SUB$ ROTSWAP &$ NEWLINE$&$ SWAP BINT23 OVERLEN$ * D0F93
              SUB$ ROT#1+UNROT ;                 * D0FC5
            REPEAT &$SWAP ;                      * D0FD4
          { BINT4 BINT4 BINT4 BINT3 BINT3 BINT2 BINT2 } SWAP#1+ NTHCOMPDROP * D0FE3
          BINT7 Disp5x7 BEGIN                    * D101A
          :: WaitForKey DROPDUP BINT45 #= SWAP BINT25 #= ORcase FALSE * D1029
            TRUE ;                               * D105B
          WHILE                                  * D1065
          :: DoBadKey ; REPEAT BINT8 BINT56 BLANKIT XLIB BRDispItems * D106A
          XLIB BRinverse TURNMENUON ;            * D1098

* ROMPTR 0E0 053
* refs (1): CF38C
BRGetItem:
        :: XLIB ~BRRclC1 SWAP XLIB BRGetItem~1 EVAL ; * D10AD

* ROMPTR 0E0 054
* refs (1): CF38C
* The 4 x 7 picture of the upwards scroll arrow.
BRArrowUp:
        GROB    "images/D10D7-BRArrowUp.png"     * D10D7  4 x 7

* ROMPTR 0E0 055
* refs (1): CF38C
* The 4 x 7 picture of the downwards scroll arrow.
BRArrowDn:
        GROB    "images/D10F9-BRArrowDn.png"     * D10F9  4 x 7

* ROMPTR 0E0 056
* refs (1): CF38C
* The 4 x 7 blank in place of a scroll arrow.
BRArrowOff:
        GROB    "images/D111B-BRArrowOff.png"    * D111B  4 x 7

LIB0E0.hash:
        CON(5)  DOHSTR                           * D113D  hash table of library 0E0
        LENGTH                                   * D1142  length, to #D11A1
        CON(5)  0                                * D1147  names of length 1
        CON(5)  0                                * D114C  names of length 2
        CON(5)  0                                * D1151  names of length 3
        CON(5)  0                                * D1156  names of length 4
        CON(5)  0                                * D115B  names of length 5
        CON(5)  0                                * D1160  names of length 6
        CON(5)  0                                * D1165  names of length 7
        CON(5)  0                                * D116A  names of length 8
        CON(5)  0                                * D116F  names of length 9
        CON(5)  0                                * D1174  names of length 10
        CON(5)  0                                * D1179  names of length 11
        CON(5)  0                                * D117E  names of length 12
        CON(5)  0                                * D1183  names of length 13
        CON(5)  0                                * D1188  names of length 14
        CON(5)  0                                * D118D  names of length 15
        CON(5)  0                                * D1192  names of length 16
        REL(5)  LIB0E0.hash.L1                   * D1197  end of the names
LIB0E0.hash.L1:
        CON(5)  0                                * D119C  command 000 has no name
        ENDLENGTH                                * D11A1

LIB0E0.link:
        CON(5)  DOHSTR                           * D11A1  link table of library 0E0
        LENGTH                                   * D11A6  length, to #D135E
        REL(5)  BRTop!                           * D11AB  000 
        REL(5)  BRBot!                           * D11B0  001 
        REL(5)  BRCur!                           * D11B5  002 
        REL(5)  ~BRStoC1                         * D11BA  003 ~BRStoC1
        REL(5)  BRCount!                         * D11BF  004 
        REL(5)  BRHiBot!                         * D11C4  005 
        REL(5)  BRHiTop!                         * D11C9  006 
        REL(5)  BRY0!                            * D11CE  007 
        REL(5)  BRExit!                          * D11D3  008 
        REL(5)  BRActions!                       * D11D8  009 
        REL(5)  BRItemProc!                      * D11DD  00A 
        REL(5)  BRLastChar!                      * D11E2  00B 
        REL(5)  BRChar!                          * D11E7  00C 
        REL(5)  BRRows!                          * D11EC  00D 
        REL(5)  BRIndex!                         * D11F1  00E 
        REL(5)  BRMenuLen!                       * D11F6  00F 
        REL(5)  ~BRbrowse                        * D11FB  010 ~BRbrowse
        REL(5)  BRDispMenu                       * D1200  011 
        REL(5)  ~BRoutput                        * D1205  012 ~BRoutput
        REL(5)  BRdone                           * D120A  013 BRdone
        REL(5)  BRInit                           * D120F  014 
        REL(5)  BRActions@                       * D1214  015 
        REL(5)  BRTop@                           * D1219  016 
        REL(5)  ~BRRclCurRow                     * D121E  017 ~BRRclCurRow
        REL(5)  ~BRRclC1                         * D1223  018 ~BRRclC1
        REL(5)  BRGetItem~1                      * D1228  019 
        REL(5)  BRIndex@                         * D122D  01A 
        REL(5)  BRMenuLen@                       * D1232  01B 
        REL(5)  BRBot@                           * D1237  01C 
        REL(5)  BRCount@                         * D123C  01D 
        REL(5)  BRHiBot@                         * D1241  01E 
        REL(5)  BRHiTop@                         * D1246  01F 
        REL(5)  BRY0@                            * D124B  020 
        REL(5)  BRExit@                          * D1250  021 
        REL(5)  BRLastChar@                      * D1255  022 
        REL(5)  BRChar@                          * D125A  023 
        REL(5)  BRRows@                          * D125F  024 
        REL(5)  BRKeys                           * D1264  025 
        REL(5)  BRKeysPlain                      * D1269  026 
        REL(5)  BRKeysLS                         * D126E  027 
        REL(5)  BRKeysRS                         * D1273  028 
        REL(5)  BRKeysAlpha                      * D1278  029 
        REL(5)  BRKeysLSAlpha                    * D127D  02A 
        REL(5)  BRKeysRSAlpha                    * D1282  02B 
        REL(5)  BRKeyChar                        * D1287  02C 
        REL(5)  BRNextMenu                       * D128C  02D 
        REL(5)  BRPrevMenu                       * D1291  02E 
        REL(5)  BRFirstMenu                      * D1296  02F 
        REL(5)  BRUpKey                          * D129B  030 
        REL(5)  BRDownKey                        * D12A0  031 
        REL(5)  BRUp1                            * D12A5  032 
        REL(5)  BRDown1                          * D12AA  033 
        REL(5)  BRPageUp                         * D12AF  034 
        REL(5)  BRPageDown                       * D12B4  035 
        REL(5)  BRFirst                          * D12B9  036 
        REL(5)  BRLast                           * D12BE  037 
        REL(5)  BREnter                          * D12C3  038 
        REL(5)  BRCancel                         * D12C8  039 
        REL(5)  BRSearch                         * D12CD  03A 
        REL(5)  BRSearchNew                      * D12D2  03B 
        REL(5)  BRSearchNext                     * D12D7  03C 
        REL(5)  BRFind                           * D12DC  03D 
        REL(5)  BRFindTo                         * D12E1  03E 
        REL(5)  BRGoFar                          * D12E6  03F 
        REL(5)  BRGoTo                           * D12EB  040 
        REL(5)  BRChar>Last                      * D12F0  041 
        REL(5)  BRResetChar                      * D12F5  042 
        REL(5)  BRSameChar?                      * D12FA  043 
        REL(5)  BRTitle                          * D12FF  044 
        REL(5)  BRDispItems                      * D1304  045 BRDispItems
        REL(5)  BRDisp1                          * D1309  046 
        REL(5)  BRDispRow                        * D130E  047 
        REL(5)  BRArrows                         * D1313  048 
        REL(5)  BRinverse                        * D1318  049 BRinverse
        REL(5)  BRScrollDn                       * D131D  04A 
        REL(5)  BRBlankLine                      * D1322  04B 
        REL(5)  BRScrollUp                       * D1327  04C 
        REL(5)  BRMoveHi                         * D132C  04D 
        REL(5)  BRSetHi                          * D1331  04E 
        REL(5)  BRHiRows                         * D1336  04F 
        REL(5)  BRLineXY                         * D133B  050 
        REL(5)  BRLineBox                        * D1340  051 
        REL(5)  BRViewItem                       * D1345  052 BRViewItem
        REL(5)  BRGetItem                        * D134A  053 BRGetItem
        REL(5)  BRArrowUp                        * D134F  054 
        REL(5)  BRArrowDn                        * D1354  055 
        REL(5)  BRArrowOff                       * D1359  056 
        ENDLENGTH                                * D135E
        BSS     4                                * D135E  zeros
