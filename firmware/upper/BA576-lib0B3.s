* HP 48GX ROM revision R, #BA576-#BD8E8: Library 0B3: the Choose box: POL, keys, scrolling, messages, drawing and the pre-drawn frames
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: BBInvertRow ~ChooseMenu2 ~ChooseMenu1 ~ChooseMenu0 ~Choose ~BReReadMenus ~BBUpArrow ~BBSpace ~BBRunEntryProc ~BBRunENTERAction ~BBRunCanclAction ~BBRereadFullScr
* Follows on from the previous file (at #BA576 in the original ROM).

* Library 0B3: The Choose box: a browser of a list in a pop-up or full-screen box with its own POL, used by CHOOSE, input forms and the alarm, flag and variable browsers. It asks its handler first through numbered messages
LIB0B3:
        CON(3)  #0B3                             * BA576  library number
        REL(5)  LIB0B3.hash                      * BA579  hash table
        CON(5)  0                                * BA57E  message table
        REL(5)  LIB0B3.link                      * BA583  link table
        CON(5)  0                                * BA588  config
        RPL

* ROMPTR 0B3 000
* refs (1): BA576
~Choose:
        :: POLSaveUI ERRSET                      * BA58D
          :: DUP#0= ITE                          * BA59C
            :: DROPONE TRUE ; FALSE              * BA5AB
            MINUSONE BINT13 NDUPN DROP XLIB BBGetDAs FALSE BINT21 * BA5C4
            XLIB ~nNullBind XLIB ~BBRereadChkEnbl XLIB ~BBRereadFullScr * BA5ED
            XLIB ~BReReadMenus XLIB ~BBReReadNElems XLIB ~BBReReadHeight * BA60E
            XLIB ~BBReReadPageSize XLIB ~BBReReadWidth XLIB ~BBReReadCoords * BA62F
            XLIB BBSplitFocus XLIB BBReReadOffset XLIB BBSaveScreen * BA650
            XLIB ~BBRunEntryProc ' XLIB BBDisplay ' XLIB BBKey TrueTrue * BA671
            13GETLAM ONEFALSE ' 2GETLAM ' XLIB IFErrHandler POLSetUI * BA6A1
            ClrDAsOK POLKeyUI XLIB BBRestScreen ClrDAsOK 3GETLAM * BA6CA
            XLIB BBSetDAs ABND ;                 * BA6E9
          ERRTRAP POLResUI&Err POLRestoreUI ;    * BA6FE

* ROMPTR 0B3 001
* refs (1): BA576
* -> : POL display routine: redraws whatever the display flags mark as out of date
BBDisplay:
        :: DA1OK? ?SKIP XLIB BBDispBackgr        * BA712
          XLIB BBHasTitle? DA2aOK? NOT AND IT XLIB BBDispPrompt * BA72C
          DA3OK? ?SKIP ?DispMenu                 * BA756
          DA2bOK? ?SKIP XLIB BBDispList          * BA765
          ClrDAsOK ;                             * BA77A

* ROMPTR 0B3 002
* refs (1): BA576
* -> : redraws the box and marks the rest for drawing, unless a key is waiting
BBDispBackgr:
        :: KEYINBUFFER? case SetDA1Bad           * BA784
          XLIB ~BBReDrawBackgr SetDA1Valid SetDA2bBad XLIB BBHasTitle? IT * BA798
          SetDA2aBad                             * BA7BD
        ;                                        * BA7C2

* ROMPTR 0B3 003
* refs (1): BA576
* -> : redraws the title, unless a key is waiting
BBDispPrompt:
        :: KEYINBUFFER? case SetDA2aBad          * BA7C7
          XLIB LEDispPrompt SetDA2aValid ;       * BA7DB

* ROMPTR 0B3 004
* refs (1): BA576
* -> : redraws the items, unless a key is waiting
BBDispList:
        :: KEYINBUFFER? case SetDA2bBad          * BA7F0
          XLIB LEDispList KEYINBUFFER? ?SEMI     * BA804
          SetDA2bValid ;                         * BA819

* ROMPTR 0B3 005
* refs (1): BA576
~ChooseMenu0:
        :: NoExitAction                          * BA823
          { NullMenuKey NullMenuKey NullMenuKey NullMenuKey NullMenuKey * BA82D
            { $ "OK" XLIB DoCKeyOK } }           * BA84B
        ;                                        * BA873

* ROMPTR 0B3 006
* refs (1): BA576
~ChooseMenu1:
        :: NoExitAction                          * BA878
          { NullMenuKey NullMenuKey NullMenuKey NullMenuKey * BA882
            { $ "(AN(L" XLIB DoCKeyCancel }      * BA89B
            { $ "OK" XLIB DoCKeyOK } }           * BA8C4
        ;                                        * BA8EC

* ROMPTR 0B3 007
* refs (1): BA576
~ChooseMenu2:
        :: NoExitAction                          * BA8F1
          { NullMenuKey NullMenuKey              * BA8FB
            {                                    * BA90A
              :: TakeOver XLIB ~BBEmpty? ITE NULL$ XLIB ~grobCheckKey * BA90F
              ;                                  * BA939
              { XLIB DoCKeyCheck XLIB DoCKeyChAll XLIB DoCKeyUnChAll } } * BA93E
            NullMenuKey                          * BA96E
            { $ "(AN(L" XLIB DoCKeyCancel }      * BA973
            { $ "OK" XLIB DoCKeyOK } }           * BA99C
        ;                                        * BA9C4

* ROMPTR 0B3 008
* refs (1): BA576
* #key #plane -> ... flag: POL key handler: dispatches on the plane to the routines below
BBKey:
        :: BINT1 #=casedrop XLIB BBKeyPlain      * BA9C9
          BINT2 #=casedrop XLIB BBKeyLeft        * BA9E3
          BINT3 #=casedrop XLIB BBKeyRight       * BA9F8
          BINT4 #=casedrop XLIB BBKeyAlpha       * BAA0D
          BINT5 #=casedrop XLIB BBKeyAlphaLeft   * BAA22
          BINT6 #=casedrop XLIB BBKeyAlphaRight  * BAA37
        ;                                        * BAA4C

* ROMPTR 0B3 009
* refs (1): BA576
* #key -> ... flag: unshifted keys: up and down move, +/- checks, ENTER is OK, ON is Cancel, the menu keys and shifts go to the POL; others seek by letter
BBKeyPlain:
        ::                                       * BAA51
          { BINT11 XLIB BBUpKey BINT17 XLIB BBDownKey BINT26 * BAA56
            XLIB DoCKeyCheck BINT25 XLIB DoCKeyOK BINT45 XLIB DoCKeyCancel } * BAA80
          #=Lookup caseTRUE BINT30               * BAAB0
          #=casedrpfls DUP#<7                    * BAABF
          casedrpfls BINT12                      * BAAC9
          #=casedrpfls BINT35                    * BAAD3
          #=casedrpfls BINT40                    * BAADD
          #=casedrpfls BINT1                     * BAAE7
          XLIB BBSeekKey ;                       * BAAF1

* ROMPTR 0B3 00A
* refs (1): BA576
* #key -> ... flag: left-shifted keys: up and down move by a page
BBKeyLeft:
        ::                                       * BAB01
          { BINT11 XLIB BBPageUpKey BINT17 XLIB BBPageDownKey } #=Lookup * BAB06
          caseTRUE DUP#<7                        * BAB35
          casedrpfls BINT12                      * BAB3F
          #=casedrpfls BINT35                    * BAB49
          #=casedrpfls BINT40                    * BAB53
          #=casedrpfls BINT2                     * BAB5D
          XLIB BBSeekKey ;                       * BAB67

* ROMPTR 0B3 00B
* refs (1): BA576
* #key -> ... flag: right-shifted keys: up and down go to the ends of the list
BBKeyRight:
        ::                                       * BAB77
          { BINT11 XLIB BBTopKey BINT17 XLIB BBBottomKey } #=Lookup caseTRUE * BAB7C
          BINT45                                 * BABB0
          #=casedrpfls DUP#<7                    * BABB5
          casedrpfls BINT35                      * BABBF
          #=casedrpfls BINT40                    * BABC9
          #=casedrpfls BINT3                     * BABD3
          XLIB BBSeekKey ;                       * BABDD

* ROMPTR 0B3 00C
* refs (1): BA576
* #key -> ... flag: alpha keys
BBKeyAlpha:
        ::                                       * BABED
          { BINT25 XLIB DoCKeyOK BINT45 XLIB DoCKeyCancel } #=Lookup * BABF2
          caseTRUE BINT30                        * BAC21
          #=casedrpfls BINT35                    * BAC2B
          #=casedrpfls BINT40                    * BAC35
          #=casedrpfls BINT4                     * BAC3F
          XLIB BBSeekKey ;                       * BAC49

* ROMPTR 0B3 00D
* refs (1): BA576
* #key -> ... flag: alpha left-shifted keys
BBKeyAlphaLeft:
        :: BINT30 #=casedrpfls BINT35            * BAC59
          #=casedrpfls BINT40                    * BAC6D
          #=casedrpfls BINT5                     * BAC77
          XLIB BBSeekKey ;                       * BAC81

* ROMPTR 0B3 00E
* refs (1): BA576
* #key -> ... flag: alpha right-shifted keys
BBKeyAlphaRight:
        :: BINT35 #=casedrpfls BINT40            * BAC91
          #=casedrpfls BINT45                    * BACA5
          #=casedrpfls BINT6                     * BACAF
          XLIB BBSeekKey ;                       * BACB9

* ROMPTR 0B3 00F
* refs (1): BA576
* #key #plane -> ob TRUE: makes a key program from what the key types: seek the item starting with its character, or the bad key beep
BBSeekKey:
        :: Key>U/SKeyOb DUPTYPECHAR? case XLIB BBSeekProg * BACC9
          DUPTYPECSTR? case                      * BACE8
          :: XLIB BBFirstAlnum XLIB BBSeekProg ; * BACF2
          DROP 'DoBadKeyT ;                      * BAD12

* ROMPTR 0B3 010
* refs (1): BA576
* chr -> ob TRUE: builds the key program :: TakeOver chr BBSeekChr ;
BBSeekProg:
        :: ' TakeOver SWAP BINT2 ::N ' XLIB BBSeekChr >TCOMP TRUE ; * BAD21

* ROMPTR 0B3 011
* refs (1): BA576
* chr -> : moves to the next item after the current one that starts with chr
BBSeekChr:
        :: ' XLIB ~BBGetN 12GETLAM 20GETLAM 18GETLAM #1+ 5ROLL * BAD5E
          XLIB IFFindNext NOTcase DoBadKey       * BAD8C
          XLIB ~BBMoveTo ;                       * BADA1

* ROMPTR 0B3 012
* refs (1): BA576
* chr -> chr: converts a lowercase letter to upper case
BBChrUpper:
        :: DUP CHR># BINT97 OVER#> caseDROP BINT122 * BADB1
          OVER#< caseDROP SWAPDROP               * BADD4
          BINT32 #- #>CHR ;                      * BADE3

* ROMPTR 0B3 013
* refs (1): BA576
* $ -> chr: the first letter or digit of $; ":" if none
BBFirstAlnum:
        :: DUPNULL$? casedrop CHR_00             * BADF7
          FALSE SWAP DUPLEN$ #1+_ONE_DO DUP INDEX@ DUP SUB$ CAR$ DUP * BAE0B
          XLIB BBAlnum? ITE                      * BAE3D
          :: ROTROT2DROP TRUE SWAP ExitAtLOOP ; DROP * BAE4D
          LOOP SWAP ?SEMI                        * BAE70
          DROP PTR CHR_: ;                       * BAE7F

* ROMPTR 0B3 014
* refs (1): BA576
* chr -> flag: a digit or letter?
BBAlnum?:
        :: CHR># BINT48 OVER#> casedrop FALSE    * BAE8E
          BINT58 OVER#> casedrop TRUE            * BAEAC
          XLIB BBChrUpper BINT65 OVER#> casedrop FALSE * BAEC0
          BINT91 OVER#> casedrop TRUE            * BAEDF
          DROPFALSE ;                            * BAEF3

* ROMPTR 0B3 015
* refs (1): BA576
~BBMoveTo:
        :: SetDA12a3NCh 18GETLAM 2DUP #= case2drop SetDA123NoCh * BAEFD
          OVER 18PUTLAM 2DUP #> ITE              * BAF20
          :: #- DUP #1= 6GETLAM 11GETLAM #= AND casedrop XLIB BBScrollUp1 * BAF39
            6GETLAM #+ DUP 11GETLAM #> NOTcase   * BAF71
            :: 6GETLAM SWAP DUP 6PUTLAM XLIB BBMoveBar ; * BAF8F
            DROP TRUE XLIB ~BBRecalOff&Disp ;    * BAFB8
          :: SWAP #- DUP #1= 6GETLAM #1= AND casedrop XLIB BBScrollDown1 * BAFD2
            DUP 6GETLAM #< case                  * BB00A
            :: 6GETLAM DUPROT #- DUP 6PUTLAM XLIB BBMoveBar ; * BB01E
            DROP TRUE XLIB ~BBRecalOff&Disp ;    * BB04C
        ;                                        * BB066

* ROMPTR 0B3 016
* refs (1): BA576
* -> : moving down at the bottom of the box: moves the rows up one and draws the new row
BBScrollUp1:
        :: DA2bBad? ?SEMI                        * BB06B
          10GETLAM 9GETLAM 2DUP 7GETLAM #+ OVER 8GETLAM #+ OVER 11GETLAM #1- * BB07A
          7GETLAM #* #+ HARDBUFF 5UNROLL 6GETLAM XLIB BBInvertRow SUBGROB * BB0B1
          3UNROLL HARDBUFF 3UNROLL HiGROB! 18GETLAM 6GETLAM XLIB LEDispItem * BB0DF
          XLIB BBDispArrows SetDA2bNoCh ;        * BB108

* ROMPTR 0B3 017
* refs (1): BA576
* -> : moving up at the top of the box: moves the rows down one and draws the new row
BBScrollDown1:
        :: DA2bBad? ?SEMI                        * BB11D
          10GETLAM 9GETLAM 2DUP OVER 8GETLAM #+ OVER 11GETLAM #1- 7GETLAM #* * BB12C
          #+ HARDBUFF 5UNROLL 6GETLAM XLIB BBInvertRow SUBGROB 3UNROLL * BB163
          7GETLAM #+ HARDBUFF 3UNROLL HiGROB! 18GETLAM 6GETLAM XLIB LEDispItem * BB18C
          XLIB BBDispArrows SetDA2bNoCh ;        * BB1BA

* ROMPTR 0B3 018
* refs (1): BA576
* #old #new -> : moves the highlight within the box
BBMoveBar:
        :: 2DUP #= case2drop SetDA2bNoCh         * BB1CF
          SWAP XLIB BBInvertRow ROMPTR 0B3 04D SetDA2bNoCh ; * BB1E8

* ROMPTR 0B3 019
* refs (1): BA576
~BBRecalOff&Disp:
        :: XLIB ~BBEmpty? caseDROP 6GETLAM       * BB20D
          DUP 18GETLAM #MIN 6PUTLAM 12GETLAM 11GETLAM #MAX 18GETLAM #- * BB227
          11GETLAM DUPUNROT #MIN #- 6GETLAM #MAX 6PUTLAM SWAP NOTcaseDROP * BB254
          XLIB BBInvertRow                       * BB281
        ;                                        * BB28C

* ROMPTR 0B3 01A
* refs (1): BA576
* -> : up arrow, with repeat
BBUpKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * BB291
          XLIB ~BBPgUp REPEATERCH BINT11 XLIB BBStepUp SetDA123NoCh ; * BB2B0

* ROMPTR 0B3 01B
* refs (1): BA576
* -> : one element up, wrapping to the last
BBStepUp:
        :: 18GETLAM #1- DUP#0= IT                * BB2DA
          :: DROP 12GETLAM ;                     * BB2F3
          XLIB ~BBMoveTo DA2bOK? ?SKIP XLIB BBDispList * BB307
          ClrDA2bOK ;                            * BB327

* ROMPTR 0B3 01C
* refs (1): BA576
* -> : down arrow, with repeat
BBDownKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * BB331
          XLIB ~BBPgDown REPEATERCH BINT17 XLIB BBStepDown SetDA123NoCh ; * BB350

* ROMPTR 0B3 01D
* refs (1): BA576
* -> : one element down, wrapping to the first
BBStepDown:
        :: 18GETLAM #1+ DUP 12GETLAM #> IT       * BB37A
          :: DROP BINT1 ;                        * BB39D
          XLIB ~BBMoveTo DA2bOK? ?SKIP XLIB BBDispList * BB3B1
          ClrDA2bOK ;                            * BB3D1

* ROMPTR 0B3 01E
* refs (1): BA576
* -> : left-shift up: one page up
BBPageUpKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * BB3DB
          XLIB ~BBPgUp 18GETLAM DUP#1= casedrop DoBadKey * BB3FA
          11GETLAM 2DUP #>ITE #-                 * BB419
          :: 2DROP BINT1 ; XLIB ~BBMoveTo ;      * BB42D

* ROMPTR 0B3 01F
* refs (1): BA576
* -> : left-shift down: one page down
BBPageDownKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * BB451
          XLIB ~BBPgDown 12GETLAM 18GETLAM 2DUP #= case2drop DoBadKey * BB470
          11GETLAM #+ #MIN XLIB ~BBMoveTo ;      * BB499

* ROMPTR 0B3 020
* refs (1): BA576
* -> : right-shift up: the first element
BBTopKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * BB4B8
          BINT1 XLIB ~BBMoveTo ;                 * BB4D7

* ROMPTR 0B3 021
* refs (1): BA576
* -> : right-shift down: the last element
BBBottomKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * BB4EC
          12GETLAM XLIB ~BBMoveTo ;              * BB50B

* ROMPTR 0B3 022
* refs (1): BA576
~BBRunEntryProc:
        :: BINT85 XLIB BBMsg DROP ;              * BB520

* ROMPTR 0B3 023
* refs (1): BA576
~BBReReadPageSize:
        :: BINT57 XLIB BBMsg case 11PUTLAM       * BB53F
          14GETLAM case                          * BB55E
          :: BINT6 XLIB BBHasTitle? IT #1-       * BB568
            11PUTLAM ;                           * BB587
          BINT5 XLIB BBHasTitle? IT #1-          * BB591
          12GETLAM #MIN BINT2 #MAX 11PUTLAM ;    * BB5AB

* ROMPTR 0B3 024
* refs (1): BA576
~BBReReadHeight:
        :: BINT58 XLIB BBMsg ?SKIP BINT9         * BB5C9
          7PUTLAM ;                              * BB5E8

* ROMPTR 0B3 025
* refs (1): BA576
~BBReReadCoords:
        :: BINT63 XLIB BBMsg case                * BB5F2
          :: 9PUTLAM 10PUTLAM ;                  * BB60C
          14GETLAM case                          * BB620
          :: BINT0 10PUTLAM BINT0 XLIB BBAddTitle 9PUTLAM ; * BB62A
          BINT65 8GETLAM XLIB BBAddArrows #7+ #2/ #- #3+ 10PUTLAM BINT28 * BB653
          7GETLAM 11GETLAM #* XLIB BBAddTitle #7+ #2/ #- XLIB BBAddTitle #3+ * BB686
          9PUTLAM ;                              * BB6BF

* ROMPTR 0B3 026
* refs (1): BA576
~BBReReadWidth:
        :: BINT59 XLIB BBMsg case 8PUTLAM        * BB6C9
          14GETLAM ITE BINT131 BINT91            * BB6E8
          XLIB BBSubArrows 8PUTLAM ;             * BB6FC

* ROMPTR 0B3 027
* refs (1): BA576
* -> : message 64, or the highlight's row in the box, into LAM 6
BBReReadOffset:
        :: BINT64 XLIB BBMsg case 6PUTLAM        * BB711
          18GETLAM 11GETLAM #MIN 6PUTLAM ;       * BB730

* ROMPTR 0B3 028
* refs (1): BA576
~BBRunENTERAction:
        :: BINT96 XLIB BBMsg ?SEMI               * BB749
          TRUE ;                                 * BB763

* ROMPTR 0B3 029
* refs (1): BA576
~BBRunCanclAction:
        :: BINT91 XLIB BBMsg ?SEMI               * BB76D
          TRUE ;                                 * BB787

* ROMPTR 0B3 02A
* refs (1): BA576
DoCKeyCheck:
        :: TakeOver XLIB ~BBEmpty? 16GETLAM NOT ORcase DoBadKey * BB791
          18GETLAM XLIB BBChecks DA2aBad? ?SEMI  * BB7BA
          18GETLAM XLIB ~BBIsChecked? ITE XLIB IFCheckGrob2 * BB7D4
          XLIB IFCheckGrob3                      * BB7F4
          HARDBUFF 10GETLAM 6GETLAM #1- 7GETLAM #* 9GETLAM #+ GROB! * BB7FF
          SetDA123NoCh ;                         * BB82C

* ROMPTR 0B3 02B
* refs (1): BA576
DoCKeyChAll:
        :: TakeOver XLIB ~BBEmpty? 16GETLAM NOT ORcase DoBadKey * BB836
          BINT0 XLIB BBChecks SetDA12a3NCh ;     * BB85F

* ROMPTR 0B3 02C
* refs (1): BA576
DoCKeyUnChAll:
        :: TakeOver XLIB ~BBEmpty? 16GETLAM NOT ORcase DoBadKey * BB879
          MINUSONE XLIB BBChecks SetDA12a3NCh ;  * BB8A2

* ROMPTR 0B3 02D
* refs (1): BA576
DoCKeyCancel:
        :: TakeOver XLIB ~BBRunCanclAction NOTcase SetDA123NoCh * BB8BC
          FALSE TRUE 2PUTLAM ;                   * BB8DB

* ROMPTR 0B3 02E
* refs (1): BA576
DoCKeyOK:
        :: TakeOver XLIB ~BBRunENTERAction NOTcase SetDA123NoCh * BB8EF
          TRUE 2PUTLAM XLIB ~BBEmpty? caseFALSE 17GETLAM * BB90E
          caseFALSE 16GETLAM                     * BB92D
          NOTcase                                * BB937
          :: 18GETLAM XLIB ~BBGetN TRUE ;        * BB93C
          15GETLAM DUPNULLCOMP? casedrop         * BB95B
          :: 18GETLAM XLIB ~BBGetN ONE{}N TRUE ; * BB96A
          INNERCOMP DUP 13PUTLAM ZERO_DO ISTOP@ ROLL XLIB ~BBGetN LOOP * BB98E
          13GETLAM {}N TRUE ;                    * BB9BC

* ROMPTR 0B3 02F
* refs (1): BA576
~BBReDrawBackgr:
        :: BINT65 XLIB BBMsg ?SEMI               * BB9D0
          14GETLAM case BlankDA12                * BB9EA
          XLIB BBStdBox? case XLIB BBDrawStdBox  * BB9F9
          7GETLAM 11GETLAM #* XLIB BBAddTitle #7+ 8GETLAM XLIB BBAddArrows * BBA14
          #7+ MAKEGROB HARDBUFF 10GETLAM #3- 9GETLAM XLIB BBSubTitle #3- * BBA43
          HiBoxGROB! 10GETLAM #2- 9GETLAM XLIB BBSubTitle #2- OVER 8GETLAM * BBA71
          XLIB BBAddArrows #+ #3+ OVER 7GETLAM 11GETLAM #* #+ * BBA9F
          XLIB BBAddTitle #3+ 4PICK 4PICK 4PICKOVER LINEON OVER 4PICKOVER * BBACD
          4PICK LINEON 4PICKOVER 4PICKOVER LINEON 4PICKOVER OVER 6PICK * BBAFB
          LINEON OVER #1+ 4PICK #1+ OVER 4PICK #1+ LINEON 4ROLL #1+ SWAP #1+ * BBB23
          ROTOVER LINEON DROP ;                  * BBB64

* ROMPTR 0B3 030
* refs (1): BA576
LEDispPrompt:
        :: BINT66 XLIB BBMsg ?SEMI               * BBB78
          XLIB BBPromptGrob HARDBUFF XLIB BBPromptPos XLIB BBClearPrompt * BBB92
          HiGROB! 14GETLAM ?SEMI                 * BBBB8
          XLIB BBPromptLine ;                    * BBBC7

* ROMPTR 0B3 031
* refs (1): BA576
* -> grob: the title as a grob: message 67, else by size
BBPromptGrob:
        :: BINT67 XLIB BBMsg ?SEMI               * BBBD7
          14GETLAM ITE XLIB BBPromptBig XLIB BBPromptSmall * BBBF1
        ;                                        * BBC11

* ROMPTR 0B3 032
* refs (1): BA576
* -> grob: the title for a full-screen box: message 68
BBPromptBig:
        :: BINT68 XLIB BBMsg ?SEMI               * BBC16
          XLIB BBPrompt$ XLIB TitleBar$>Grob ;   * BBC30

* ROMPTR 0B3 033
* refs (1): BA576
* -> grob: the title for a pop-up box: message 69
BBPromptSmall:
        :: BINT69 XLIB BBMsg ?SEMI               * BBC4B
          XLIB BBPrompt$ Hi$>grob ;              * BBC65

* ROMPTR 0B3 034
* refs (1): BA576
* -> $: the title: message 70, or LAM 21 with message numbers looked up
BBPrompt$:
        :: BINT70 XLIB BBMsg ?SEMI               * BBC7A
          21GETLAM ~DUPTYPEBINT?;case;JstGetTHEMESG ; * BBC94

* ROMPTR 0B3 035
* refs (1): BA576
LEDispList:
        :: BINT74 XLIB BBMsg ?SEMI               * BBCA3
          XLIB ~BBEmpty? ?SEMI                   * BBCBD
          18GETLAM 6GETLAM #1-- 11GETLAM ZERO_DO DUP INDEX@ #+ DUP 12GETLAM * BBCCD
          #>ITE DROP                             * BBCFF
          :: INDEX@ #1+ XLIB LEDispItem ; LOOP DROP XLIB BBDispArrows ; * BBD09

* ROMPTR 0B3 036
* refs (1): BA576
LEDispItem:
        :: BINT79 XLIB BBMsg ?SEMI               * BBD42
          OVER XLIB ~BBGetNGrob ROT 18GETLAM #= 17GETLAM NOTAND IT INVGROB * BBD5C
          HARDBUFF 10GETLAM 4ROLL #1- 7GETLAM #* 9GETLAM #+ HiGROB! ; * BBD8F

* ROMPTR 0B3 037
* refs (1): BA576
~BBGetNGrob:
        :: BINT81 XLIB BBMsg ?SEMI               * BBDC1
          DUP XLIB ~BBGetNStr DUP LEN$ 8GETLAM 16GETLAM IT * BBDDB
          :: BINT7 #- ;                          * BBE04
          BINT6 #/ SWAPDROP DUPUNROT #>ITE       * BBE18
          :: 1_#1-SUB$ CHR_... >T$ ; DROP Hi$>GROB 7GETLAM 8GETLAM MAKEGROB * BBE31
          DUPUNROT 16GETLAM ITE BINT7 BINT1      * BBE63
          BINT1 HiIntoGrob 16GETLAM NOTcase SWAPDROP * BBE7C
          SWAP XLIB ~BBIsChecked? NOT?SEMI       * BBE95
          XLIB IFCheckGrob1 OVER ZEROZERO GROB! ; * BBEAA

* ROMPTR 0B3 038
* refs (1): BA576
~BBGetNStr:
        :: KEYINBUFFER? casedrop                 * BBEC9
          :: _chr(31)_ SetDA2bBad ;              * BBED8
          BINT82 XLIB BBMsg ?SEMI                * BBEEC
          XLIB ~BBGetN 20GETLAM XLIB IFDecomp ;  * BBF01

* ROMPTR 0B3 039
* refs (1): BA576
* -> : message 84, or saves what the box will cover and the menu grob
BBSaveScreen:
        :: BINT84 XLIB BBMsg ?SEMI               * BBF21
          HARDBUFF 14GETLAM ITE                  * BBF3B
          :: ZEROZERO BINT131 BINT56 ;           * BBF4A
          :: 10GETLAM #3- 9GETLAM XLIB BBSubTitle #3- OVER 8GETLAM * BBF63
            XLIB BBAddArrows #+ #7+ OVER 7GETLAM 11GETLAM #* #+ * BBF91
            XLIB BBAddTitle #7+ ;                * BBFBF
          SUBGROB 5PUTLAM HARDBUFF2 TOTEMPOB 4PUTLAM ; * BBFD4

* ROMPTR 0B3 03A
* refs (1): BA576
* -> : message 87, or restores what BBSaveScreen saved
BBRestScreen:
        :: BINT87 XLIB BBMsg ?SEMI               * BBFF2
          5GETLAM HARDBUFF 14GETLAM ITE ZEROZERO * BC00C
          :: 10GETLAM #3- 9GETLAM XLIB BBSubTitle #3- ; * BC025
          HiGROB! 4GETLAM HARDBUFF2 ZEROZERO GROB! ; * BC04E

* ROMPTR 0B3 03B
* refs (1): BA576
~BBRereadChkEnbl:
        :: BINT61 XLIB BBMsg ?SKIP FALSE         * BC06C
          16PUTLAM ;                             * BC08B

* ROMPTR 0B3 03C
* refs (1): BA576
~BBRereadFullScr:
        :: BINT60 XLIB BBMsg ?SKIP FALSE         * BC095
          14PUTLAM ;                             * BC0B4

* ROMPTR 0B3 03D
* refs (1): BA576
~BReReadMenus:
        :: BINT83 XLIB BBMsg case 13PUTLAM       * BC0BE
          17GETLAM case                          * BC0DD
          :: ' XLIB ~ChooseMenu0 13PUTLAM ;      * BC0E7
          16GETLAM ITE                           * BC106
          :: ' XLIB ~ChooseMenu2 ;               * BC110
          :: ' XLIB ~ChooseMenu1 ;               * BC12A
          13PUTLAM ;                             * BC144

* ROMPTR 0B3 03E
* refs (1): BA576
~BBReReadNElems:
        :: BINT62 XLIB BBMsg case 12PUTLAM       * BC14E
          19GETLAM LENCOMP 12PUTLAM ;            * BC16D

* ROMPTR 0B3 03F
* refs (1): BA576
~BBGetN:
        :: BINT80 XLIB BBMsg ?SEMI               * BC181
          19GETLAM SWAP NTHCOMPROM@ ~DUPTYPEBINT?;case;JstGetTHEMESG ; * BC19B

* ROMPTR 0B3 040
* refs (1): BA576
* # -> : message 86, or changes the checked list in LAM 15: 0 all, -1 none, otherwise toggles element #
BBChecks:
        :: BINT86 XLIB BBMsg ?SEMI               * BC1B4
          BINT0 #=casedrop                       * BC1CE
          :: 12GETLAM #1+_ONE_DO INDEX@ LOOP 12GETLAM {}N 15PUTLAM ; * BC1D8
          MINUSONE #=casedrop                    * BC205
          :: NULL{} 15PUTLAM ;                   * BC20F
          15GETLAM SWAP 2DUP #=POSCOMP DUP#0= ITE * BC223
          :: DROP >TCOMP ;                       * BC241
          :: SWAPDROPSWAP DUP BINT1 4PICK #1- SUBCOMP SWAPROT #1+ OVER * BC255
            LENCOMP SUBCOMP &COMP ;              * BC287
          15PUTLAM ;                             * BC29B

* ROMPTR 0B3 041
* refs (1): BA576
* -> flag: does a pre-drawn box frame fit this list? It must have the usual width and between 2 and 4 rows (5 without a title)
BBStdBox?:
        :: 8GETLAM XLIB BBAddArrows BINT91 #<> caseFALSE 11GETLAM * BC2A5
          7GETLAM #* BINT9 #/ SWAP #0<> casedrop FALSE * BC2CE
          DUP BINT1 #> BINT5 XLIB BBHasTitle? ?SKIP #1+ * BC2F6
          ROT #> AND ;                           * BC31F

* ROMPTR 0B3 042
* refs (1): BA576
* -> : draws the pre-drawn frame for this number of rows, title or not
BBDrawStdBox:
        ::                                       * BC333
          { XLIB ChooseBox25                     * BC338  ~BBGetDefltHeight
            XLIB ChooseBox33 XLIB ChooseBox34 XLIB ChooseBox42 * BC348  sysCHOOSE
            XLIB ChooseBox43 XLIB ChooseBox51 XLIB ChooseBox52 } * BC369  ~$>grobOrGROB
          11GETLAM 7GETLAM #* BINT9 #/ SWAPDROP #2- #2* #1+ XLIB BBHasTitle? * BC38F
          IT #1+                                 * BC3C7
          NTHCOMPROM@ HARDBUFF 10GETLAM #3- 9GETLAM XLIB BBSubTitle #3- * BC3D1
          HiBoxGROB! ;                           * BC3FA

* ROMPTR 0B3 043
* refs (1): BA576
* -> #x #y: where the title goes, 8 pixels over the first row
BBPromptPos:
        :: 10GETLAM 9GETLAM BINT8 #- ;           * BC404

* ROMPTR 0B3 044
* refs (1): BA576
* # -> #: adds 8 for the title row, if there is one
BBAddTitle:
        :: XLIB BBHasTitle? NOT?SEMI             * BC422
          BINT8 #+ ;                             * BC437

* ROMPTR 0B3 045
* refs (1): BA576
* # -> #: takes off 8 for the title row, if there is one
BBSubTitle:
        :: XLIB BBHasTitle? NOT?SEMI             * BC446
          BINT8 #- ;                             * BC45B

* ROMPTR 0B3 046
* refs (1): BA576
* # -> #: adds 6 for the arrow column, if the list is longer than the box
BBAddArrows:
        :: XLIB BBScrolls? NOT?SEMI              * BC46A
          BINT6 #+ ;                             * BC47F

* ROMPTR 0B3 047
* refs (1): BA576
* # -> #: takes off 6 for the arrow column, if the list is longer than the box
BBSubArrows:
        :: XLIB BBScrolls? NOT?SEMI              * BC48E
          BINT6 #- ;                             * BC4A3

* ROMPTR 0B3 048
* refs (1): BA576
* -> flag: more elements than rows?
BBScrolls?:
        :: 12GETLAM 11GETLAM #> ;                * BC4B2

* ROMPTR 0B3 049
* refs (1): BA576
* -> : blanks the title row
BBClearPrompt:
        :: BINT8 8GETLAM XLIB BBAddArrows MAKEGROB HARDBUFF XLIB BBPromptPos * BC4CB
          GROB! ;                                * BC4FA

* ROMPTR 0B3 04A
* refs (1): BA576
* -> : with check marks on, the focus argument may be {current checked...}: splits it into LAM 18 and LAM 15
BBSplitFocus:
        :: 16GETLAM NOT?SEMI                     * BC504
          18GETLAM DUPTYPEBINT? casedrop         * BC513
          :: NULL{} 15PUTLAM ;                   * BC522
          DUP CARCOMP 18PUTLAM CDRCOMP 15PUTLAM ; * BC536

* ROMPTR 0B3 04B
* refs (1): BA576
~BBIsChecked?:
        :: 15GETLAM SWAP #=POSCOMP #0<> ;        * BC554

* ROMPTR 0B3 04C
* refs (1): BA576
* -> : the line under the title
BBPromptLine:
        :: 10GETLAM 9GETLAM #2- OVER 8GETLAM XLIB BBAddArrows #1-+ OVER * BC572
          LINEON ;                               * BC5A5

* ROMPTR 0B3 04E
* refs (2): BA576 BA576
* # -> : inverts row #, unless the list is view-only or about to be redrawn. Commands 04D and 04E are this object
BBInvertRow:
        :: DA2bBad? caseDROP 17GETLAM            * BC5AF
          caseDROP 10GETLAM                      * BC5C3
          9GETLAM ROT #1- 7GETLAM #* #+ 2DUP OVER 8GETLAM #+ OVER 7GETLAM #+ * BC5CD
          HARDBUFF 5UNROLL SUBGROB INVGROB 3UNROLL HARDBUFF 3UNROLL HiGROB! ; * BC60E

* ROMPTR 0B3 04F
* refs (1): BA576
* -> : the up and down arrows at the right, where more elements lie that way
BBDispArrows:
        :: XLIB BBScrolls? NOT?SEMI              * BC63B
          XLIB BBMoreAbove? ITE XLIB ~BBUpArrow XLIB ~BBSpace * BC650
          HARDBUFF 10GETLAM 8GETLAM #+ #1+ DUP4UNROLL 9GETLAM #1+ HiGROB! * BC676
          XLIB BBMoreBelow? ITE XLIB ~BBDownArrow XLIB ~BBSpace * BC6A3
          HARDBUFF ROT 9GETLAM 11GETLAM #1- 7GETLAM #* #+ #1+ HiGROB! ; * BC6C9

* ROMPTR 0B3 050
* refs (1): BA576
* -> flag: are there elements above the box's first row?
BBMoreAbove?:
        :: 18GETLAM 6GETLAM #> ;                 * BC700

* ROMPTR 0B3 051
* refs (1): BA576
* -> flag: are there elements after the box's last row?
BBMoreBelow?:
        :: 12GETLAM 18GETLAM #- 11GETLAM 6GETLAM #- #> ; * BC719

* ROMPTR 0B3 052
* refs (1): BA576
~BBUpArrow:
        :: $ "↑" Hi$>GROB ;                      * BC746

* ROMPTR 0B3 053
* refs (1): BA576
~BBDownArrow:
        :: $ "↓" Hi$>GROB ;                      * BC761

* ROMPTR 0B3 054
* refs (1): BA576
~BBSpace:
        :: $ " " Hi$>GROB ;                      * BC77C

* ROMPTR 0B3 055
* refs (1): BA576
* #msg -> ... flag: sends a message to the handler in LAM 22
BBMsg:
        :: 22Lget EVAL ;                         * BC797

* ROMPTR 0B3 056
* refs (1): BA576
* -> flag: is there a title?
BBHasTitle?:
        :: 21GETLAM ~DUPTYPEBINT?;case;JstGetTHEMESG NULL$? * BC7AB
          NOT ;                                  * BC7BF

* ROMPTR 0B3 057
* refs (1): BA576
* -> {flags}: the six display area flags, saved when the box opens
BBGetDAs:
        :: DA1IsStat? DA2bEdit? DA1Bad? DA2aBad? DA2bBad? DA3Bad? BINT6 {}N ; * BC7C9

* ROMPTR 0B3 058
* refs (1): BA576
* {flags} -> : restores them
BBSetDAs:
        :: INCOMPDROP ITE SetDA3Bad ClrDA3Bad    * BC7FB
          ITE SetDA2bBad ClrDA2bBad              * BC814
          ITE SetDA2aBad ClrDA2aBad              * BC823
          ITE SetDA1Bad ClrDA1Bad                * BC832
          ITE SetDA2bEdit ClrDA2bEdit            * BC841
          ITE SetDA1IsStat ClrDA1IsStat          * BC850
        ;                                        * BC85F

* ROMPTR 0B3 059
* refs (1): BA576
~BBPgDown:
        :: 17GETLAM NOT?SEMI                     * BC864
          18GETLAM 11GETLAM 12GETLAM #MIN DUPUNROT 6GETLAM #- #+ 18PUTLAM * BC873
          6PUTLAM ;                              * BC8A0

* ROMPTR 0B3 05A
* refs (1): BA576
~BBPgUp:
        :: 17GETLAM NOT?SEMI                     * BC8AA
          18GETLAM 6GETLAM #1- #- 18PUTLAM BINT1 6PUTLAM ; * BC8B9

* ROMPTR 0B3 05B
* refs (1): BA576
~BBEmpty?:
        :: 12GETLAM #0= ;                        * BC8E1

* ROMPTR 0B3 05C ~BBGetDefltHeight
* refs (1): BA576
* Pre-drawn frame, 2 rows without a title. The third-party name BBGetDefltHeight was wrong: this is a grob
ChooseBox25:
        GROB    "images/BC8F5-ChooseBox25.png"   * BC8F5  98 x 25

* ROMPTR 0B3 05D
* refs (1): BA576
* Pre-drawn frame, 3 rows without a title
ChooseBox34:
        GROB    "images/BCB93-ChooseBox34.png"   * BCB93  98 x 34

* ROMPTR 0B3 05E
* refs (1): BA576
* Pre-drawn frame, 4 rows without a title
ChooseBox43:
        GROB    "images/BCF1B-ChooseBox43.png"   * BCF1B  98 x 43

* ROMPTR 0B3 05F ~$>grobOrGROB
* refs (1): BA576
* Pre-drawn frame, 5 rows without a title. The third-party name $>grobOrGROB was wrong: this is a grob
ChooseBox52:
        GROB    "images/BD38D-ChooseBox52.png"   * BD38D  98 x 52
