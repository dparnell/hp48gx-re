* HP 48GX ROM revision R, #D9A51-#DCA81: CMD, the CHARS form with its keys and menu, pictures of the character pages and the table of key sequences
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: CharCursor DoCMD DoCHARS CharUpKey CharUp CharTop CharRowStart CharRowEnd CharRightKey CharRight CharPgUp CharPgLast
* Follows on from the previous file (at #D9A51 in the original ROM).

* Library 0B2: The CHARS application, a map of the 256 characters with the key for each, built as an input form, and the CMD list of recent command lines.
LIB0B2:
        CON(3)  #0B2                             * D9A51  library number
        REL(5)  LIB0B2.hash                      * D9A54  hash table
        CON(5)  0                                * D9A59  message table
        REL(5)  LIB0B2.link                      * D9A5E  link table
        CON(5)  0                                * D9A63  config
        RPL

* ROMPTR 0B2 000
* refs (1): D9A51
* CMD key: offers the last four command lines in a choose box and puts the one chosen in the editor.
DoCMD:
        :: TakeOver ' DROPFALSE NULL$ BINT1 ClrHistLevel BINT4 ZERO_DO * D9A68
          GetLastEdit ?SKIP NULL$                * D9A95
          LOOP BINT4 {}N BINT1 XLIB ~Choose NOTcase SetDA123NoCh * D9AA4
          InitEdLine EditString SetDA13NoCh ;    * D9ACD

* ROMPTR 0B2 001
* refs (1): D9A51
* CHARS key: runs the character map and types the characters echoed from it into the command line.
DoCHARS:
        :: TakeOver XLIB CharMap DUPNULL$? caseDROP Echo$NoChr00 * D9AE1
        ;                                        * D9B05

* ROMPTR 0B2 002
* refs (1): D9A51
* -> $: runs the character map, saving the state of the editor and its modes and restoring them afterwards. Returns the characters echoed. Locals: 1C the first character of the page, CF the offset of the cursor in the page, EC the characters echoed.
CharMap:
        :: BINT128 BINT0 NULL$                   * D9B0A
          { LAM '1C LAM 'CF LAM 'EC } BIND EditLExists? EDITLINE$ CURSOR@ * D9B1E
          INSERT? PrgmEntry? AlgEntry? MinusMo BINT7 XLIB ~nNullBind * D9B63
          InitEd&Modes XLIB CharMapForm DoInputForm IT DROP * D9B87
          8GETLAM IT                             * D9BA6
          :: 7GETLAM EditString 6GETLAM #1+ SetCursPos(s) ; * D9BB0
          5GETLAM ?SKIP REPLACE_MODE             * D9BD3
          4GETLAM IT SetPrgmEntry                * D9BE2
          3GETLAM IT SetAlgEntry                 * D9BF1
          2GETLAM IT MinusMo_539A0               * D9C00
          ABND LAM 'EC ABND ;                    * D9C0F

* ROMPTR 0B2 003
* refs (1): D9A51
* The arguments of DoInputForm for the character map: no fields, with the title "Characters".
CharMapForm:
        :: 'RROMPTR@ XLIB CharMapKeys BINT0 BINT0 BINT7 BINT9 BINT0 MINUSONE * D9C2B
          MINUSONE NULL$ MINUSONE MINUSONE MINUSONE DUP BINT0 BINT1 * D9C5E
          'RROMPTR@ XLIB CharMapMsg # B998 ;     * D9C86  "Characters "

* ROMPTR 0B2 004
* refs (1): D9A51
* The form's message handler. Message 5 makes the blank work grob, 15 gives the menu, and 2 the title.
CharMapMsg:
        ::                                       * D9CA5
          { BINT5                                * D9CAA
            :: BINT39 BINT131 MAKEGROB TRUE ; BINT15 * D9CB4
            :: ' XLIB CharMapMenu ; BINT2 XLIB CharMapTitle } * D9CD7
          EQLookup case                          * D9D06
          :: EVAL TRUE ;                         * D9D10
          DROPFALSE ;                            * D9D24

* ROMPTR 0B2 005
* refs (1): D9A51
* -> grob: the title with the page's range, such as "Characters 0-63".
CharMapTitle:
        :: XLIB IFTitle@ LAM '1C DUP #>$ CHR_- >T$ SWAP BINT63 #+ #>$ &$ &$ * D9D2E
          XLIB TitleBar$>Grob ;                  * D9D7D

* ROMPTR 0B2 006
* refs (1): D9A51
* Message handler for the display: 8 handles a key, 7 draws the page, and 11 shows the cursor's character.
CharMapKeys:
        ::                                       * D9D8D
          { BINT8                                * D9D92
            :: 2DUP XLIB CharMapKeyTbl ITE       * D9D9C
              :: 3UNROLL 2DROP TrueTrue ; FALSE  * D9DB6
            ;                                    * D9DD4
          }                                      * D9DD9
          EQLookup case EVAL                     * D9DDE
          { BINT7 XLIB CharMapPage BINT11        * D9DED
            :: DROP XLIB CharMapInfo ; }         * D9E07
          EQLookup case                          * D9E26
          :: EVAL TRUE ;                         * D9E30
          DROPFALSE ;                            * D9E44

* ROMPTR 0B2 007
* refs (1): D9A51
* Draws the current page of 64 characters and the cursor.
CharMapPage:
        ::                                       * D9E4E
          { XLIB CharPage0 XLIB CharPage1 XLIB CharPage2 XLIB CharPage3 } * D9E53
          LAM '1C BINT64 #/ SWAPDROP #1+ NTHCOMPROM@ HARDBUFF BINT9 BINT8 * D9E89
          BINT46 BINT2 BLANKIT GROB! SetDA2aValid BINT1 XLIB IFMarkDone * D9EBE
          LAM 'CF ROMPTR 0B2 020 ;               * D9EE7

* ROMPTR 0B2 008
* refs (1): D9A51
* Shows the bottom line: the character, "Num:" and its code, "Key:" and how to type it.
CharMapInfo:
        :: LAM '1C LAM 'CF #+ DUP #>$ $>grob SWAP #1+ XLIB CharKeyTbl * D9F04
          GETATELN DROP XLIB CharKey>Grob # B99A JstGetTHEMESG $>grob # B999 * D9F4C  "Num:"  "Key:"
          JstGetTHEMESG $>grob BINT48 BINT8 BLANKIT HARDBUFF BINT1 BINT50 * D9F7F
          GROB! HARDBUFF # 63 BINT50 GROB! HARDBUFF BINT19 BINT50 GROB! * D9FA7
          HARDBUFF # 77 BINT50 GROB! ;           * D9FD9

* ROMPTR 0B2 009
* refs (1): D9A51
* $ -> grob: draws a key sequence from the table. Character codes 1 to 9 stand for the small pictures of shift, alpha and other keys.
CharKey>Grob:
        :: DUPNULL$? casedrop                    * D9FF7
          :: # B99B JstGetTHEMESG $>grob ;       * DA006  "(none)"
          BINT6 BINT40 MAKEGROB BINT0 ROT DUPLEN$ #1+_ONE_DO DUP INDEX@ DUP * DA024
          SUB$ DUP CAR$ CHR># DUP BINT9 #> ITE   * DA056
          :: DROP $>grob ;                       * DA07E
          :: SWAPDROP                            * DA092
            { XLIB CharIcons XLIB CharKey>Grob~1 XLIB CharKey>Grob~2 * DA09C
              XLIB CharKey>Grob~3 XLIB CharKey>Grob~4 XLIB CharKey>Grob~5 * DA0C2
              XLIB CharKey>Grob~6 XLIB CharKey>Grob~7 XLIB CharKey>Grob~8 } * DA0E3
            SWAP NTHCOMPROM@ ;                   * DA109
          DUP 5PICK 5PICK BINT0 GROB! GROBDIMw ROT #+ SWAP LOOP 2DROP ; * DA118

* ROMPTR 0B2 00A
* refs (1): D9A51
* #key #plane -> ... : sends a key to the table for its shift plane.
CharMapKeyTbl:
        :: BINT1 #=casedrop XLIB CharMapPlain    * DA154
          BINT2 #=casedrop XLIB CharMapLS        * DA16E
          BINT3 #=casedrop XLIB CharMapRS        * DA183
          2DROP 'DoBadKeyT ;                     * DA198

* ROMPTR 0B2 00B
* refs (1): D9A51
* Unshifted keys: the arrows move the cursor, menu keys pass through, and ENTER, ON, NXT and the shifts have their normal effect. Others are bad keys.
CharMapPlain:
        ::                                       * DA1A7
          { BINT17 XLIB CharDownKey BINT11 XLIB CharUpKey BINT16 * DA1AC
            XLIB CharLeftKey BINT18 XLIB CharRightKey } * DA1D6
          #=Lookup caseTRUE DUP#<7               * DA1F6
          casedrop FALSE                         * DA205
          { BINT25 BINT45 BINT12 BINT35 BINT40 } SWAP #=POSCOMP #0<> * DA20F
          caseFALSE 'DoBadKeyT                   * DA241
        ;                                        * DA24B

* ROMPTR 0B2 00C
* refs (1): D9A51
* Left-shifted keys: only the menu keys and shifts work.
CharMapLS:
        :: DUP#<7 casedrop FALSE                 * DA250
          { BINT12 BINT35 BINT40 } SWAP #=POSCOMP #0<> caseFALSE 'DoBadKeyT * DA264
        ;                                        * DA296

* ROMPTR 0B2 00D
* refs (1): D9A51
* Right-shifted keys: the arrows go to the edge of the page.
CharMapRS:
        ::                                       * DA29B
          { BINT17 XLIB CharBottom BINT11 XLIB CharTop BINT16 * DA2A0
            XLIB CharRowStart BINT18 XLIB CharRowEnd } * DA2CA
          #=Lookup caseTRUE DUP#<7               * DA2EA
          casedrop FALSE                         * DA2F9
          { BINT45 BINT35 BINT40 } SWAP #=POSCOMP #0<> caseFALSE 'DoBadKeyT * DA303
        ;                                        * DA335

* ROMPTR 0B2 00E
* refs (1): D9A51
* Down arrow, with key repeat.
CharDownKey:
        :: TakeOver REPEATERCH BINT17 XLIB CharDown * DA33A
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * DA359

* ROMPTR 0B2 00F
* refs (1): D9A51
* Moves down a row, wrapping to the top.
CharDown:
        :: LAM 'CF DUP BINT16 #/ #1+ DUP BINT3 #> IT * DA377
          :: DROP BINT0 ;                        * DA3B1
          BINT16 #* #+ DUP ' LAM 'CF STOLAM SWAP XLIB CharCursor * DA3C5
          ROMPTR 0B2 020 ;                       * DA400

* ROMPTR 0B2 010
* refs (1): D9A51
* Right-shifted down arrow: goes to the bottom row.
CharBottom:
        :: TakeOver LAM 'CF DUP BINT16 #/ BINT3 #= case2drop SetDA123NoCh * DA410
          BINT48 #+ DUP ' LAM 'CF STOLAM SWAP XLIB CharCursor ROMPTR 0B2 020 * DA44A
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * DA48B

* ROMPTR 0B2 011
* refs (1): D9A51
* Up arrow, with key repeat.
CharUpKey:
        :: TakeOver REPEATERCH BINT11 XLIB CharUp * DA4A9
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * DA4C8

* ROMPTR 0B2 012
* refs (1): D9A51
* Moves up a row, wrapping to the bottom.
CharUp:
        :: LAM 'CF DUP BINT16 #/ DUP#0= IT       * DA4E6
          :: DROP BINT4 ;                        * DA511
          #1- BINT16 #* #+ DUP ' LAM 'CF STOLAM SWAP XLIB CharCursor * DA525
          ROMPTR 0B2 020 ;                       * DA565

* ROMPTR 0B2 013
* refs (1): D9A51
* Right-shifted up arrow: goes to the top row.
CharTop:
        :: TakeOver LAM 'CF DUP BINT16 #/ #0= case2drop SetDA123NoCh * DA575
          DUP ' LAM 'CF STOLAM SWAP XLIB CharCursor ROMPTR 0B2 020 * DA5AA
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * DA5E1

* ROMPTR 0B2 014
* refs (1): D9A51
* Right arrow, with key repeat.
CharRightKey:
        :: TakeOver REPEATERCH BINT18 XLIB CharRight * DA5FF
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * DA61E

* ROMPTR 0B2 015
* refs (1): D9A51
* Moves right, wrapping to the first character of the page.
CharRight:
        :: LAM 'CF DUP #1+ DUP BINT63 #> IT DROPZERO * DA63C
          DUP ' LAM 'CF STOLAM SWAP XLIB CharCursor ROMPTR 0B2 020 ; * DA671

* ROMPTR 0B2 016
* refs (1): D9A51
* Right-shifted right arrow: goes to the end of the row.
CharRowEnd:
        :: TakeOver LAM 'CF DUP BINT16 #/ SWAP BINT15 #= case2drop * DA6AD
          SetDA123NoCh                           * DA6E7
          BINT16 #* BINT15 #+ DUP ' LAM 'CF STOLAM SWAP XLIB CharCursor * DA6EC
          ROMPTR 0B2 020                         * DA72C
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * DA737

* ROMPTR 0B2 017
* refs (1): D9A51
* Left arrow, with key repeat.
CharLeftKey:
        :: TakeOver REPEATERCH BINT16 XLIB CharLeft * DA755
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * DA774

* ROMPTR 0B2 018
* refs (1): D9A51
* Moves left, wrapping to the last character of the page.
CharLeft:
        :: LAM 'CF DUP DUP#0= IT                 * DA792
          :: DROP BINT64 ;                       * DA7B3
          #1- DUP ' LAM 'CF STOLAM SWAP XLIB CharCursor ROMPTR 0B2 020 ; * DA7C7

* ROMPTR 0B2 019
* refs (1): D9A51
* Right-shifted left arrow: goes to the start of the row.
CharRowStart:
        :: TakeOver LAM 'CF DUP BINT16 #/ SWAP #0= case2drop SetDA123NoCh * DA808
          BINT16 #* DUP ' LAM 'CF STOLAM SWAP XLIB CharCursor ROMPTR 0B2 020 * DA842
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * DA883

* ROMPTR 0B2 01A
* refs (1): D9A51
* The menu: -64, +64, ECHO, CANCEL and OK.
CharMapMenu:
        :: NoExitAction                          * DA8A1
          { NullMenuKey NullMenuKey NullMenuKey  * DA8AB
            { $ "-64"                            * DA8BF
              { XLIB CharPgDown DoBadKey XLIB CharPgFirst } } * DA8D4
            { $ "+64"                            * DA8FE
              { XLIB CharPgUp DoBadKey XLIB CharPgLast } } * DA913
            { $ "ECHO" XLIB CharEcho } NullMenuKey NullMenuKey NullMenuKey * DA93D
            NullMenuKey                          * DA973
            { $ "(AN(L" XLIB DoKeyCancel }       * DA978
            { $ "OK" XLIB DoKeyOK } }            * DA9A1
        ;                                        * DA9C9

* ROMPTR 0B2 01B
* refs (1): D9A51
* -64: previous page, wrapping to the last.
CharPgDown:
        :: TakeOver LAM '1C DUP#0= IT            * DA9CE
          :: DROP REALOBOB ;                     * DA9EF
          BINT64 #- ' LAM '1C STOLAM SetDA3NoCh ; * DAA03

* ROMPTR 0B2 01C
* refs (1): D9A51
* Left-shifted -64: the first page.
CharPgFirst:
        :: TakeOver LAM '1C #0=case SetDA123NoCh * DAA2E
          BINT0 ' LAM '1C STOLAM SetDA3NoCh ;    * DAA4F

* ROMPTR 0B2 01D
* refs (1): D9A51
* +64: next page, wrapping to the first.
CharPgUp:
        :: TakeOver LAM '1C BINT64 #+ DUP REALOBOB #= IT DROPZERO * DAA75
          ' LAM '1C STOLAM SetDA3NoCh ;          * DAAAF

* ROMPTR 0B2 01E
* refs (1): D9A51
* Left-shifted +64: the last page.
CharPgLast:
        :: TakeOver LAM '1C BINTC0h #=case SetDA123NoCh * DAAD0
          BINTC0h ' LAM '1C STOLAM SetDA3NoCh ;  * DAAF6

* ROMPTR 0B2 01F
* refs (1): D9A51
* ECHO: adds the character at the cursor to the string. Character 0 can't be echoed, and gives an alert.
CharEcho:
        :: TakeOver SetDA123NoCh LAM 'CF DUP XLIB CharCursor LAM 'EC OVER * DAB1C
          LAM '1C #+ DUP#0= ITE                  * DAB5A
          :: 2DROP #_102 XLIB DoAlert ;          * DAB76
          :: #>CHR >T$ ' LAM 'EC STOLAM ;        * DAB95
          ROMPTR 0B2 020 ;                       * DABC0

* ROMPTR 0B2 021
* refs (2): D9A51 D9A51
* #offset -> : inverts one cell of the page, at the character's position in the grid of 16 by 4.
CharCursor:
        :: DA2aBad? caseDROP BINT16              * DABD0
          #/ SWAP BINT7 #* BINT10 #+ #1- SWAP BINT10 #* BINT8 #+ 2DUP 2DUP * DABE4
          SWAP BINT7 #+ SWAP BINT10 #+ HARDBUFF 5UNROLL SUBGROB INVGROB * DAC2A
          HARDBUFF 4ROLL 4ROLL GROB! ;           * DAC5C

* ROMPTR 0B2 022
* refs (1): D9A51
* The nine small key pictures that CharKey>Grob uses start here.
CharIcons:
        GROB    "images/DAC75-CharIcons.png"     * DAC75  7 x 6

* ROMPTR 0B2 023
* refs (1): D9A51
CharKey>Grob~1:
        GROB    "images/DAC95.png"               * DAC95  7 x 6

* ROMPTR 0B2 024
* refs (1): D9A51
CharKey>Grob~2:
        GROB    "images/DACB5.png"               * DACB5  8 x 5

* ROMPTR 0B2 025
* refs (1): D9A51
CharKey>Grob~3:
        GROB    "images/DACD3.png"               * DACD3  7 x 5

* ROMPTR 0B2 026
* refs (1): D9A51
CharKey>Grob~4:
        GROB    "images/DACF1.png"               * DACF1  8 x 5

* ROMPTR 0B2 027
* refs (1): D9A51
CharKey>Grob~5:
        GROB    "images/DAD0F.png"               * DAD0F  6 x 5

* ROMPTR 0B2 028
* refs (1): D9A51
CharKey>Grob~6:
        GROB    "images/DAD2D.png"               * DAD2D  6 x 5

* ROMPTR 0B2 029
* refs (1): D9A51
CharKey>Grob~7:
        GROB    "images/DAD4B.png"               * DAD4B  6 x 5

* ROMPTR 0B2 02A
* refs (1): D9A51
CharKey>Grob~8:
        GROB    "images/DAD69.png"               * DAD69  6 x 5

* ROMPTR 0B2 02B
* refs (1): D9A51
* Picture of characters 0 to 63.
CharPage0:
        GROB    "images/DAD87-CharPage0.png"     * DAD87  112 x 40

* ROMPTR 0B2 02C
* refs (1): D9A51
* Picture of characters 64 to 127.
CharPage1:
        GROB    "images/DB1FB-CharPage1.png"     * DB1FB  112 x 40

* ROMPTR 0B2 02D
* refs (1): D9A51
* Picture of characters 128 to 191.
CharPage2:
        GROB    "images/DB66F-CharPage2.png"     * DB66F  112 x 40

* ROMPTR 0B2 02E
* refs (1): D9A51
* Picture of characters 192 to 255.
CharPage3:
        GROB    "images/DBAE3-CharPage3.png"     * DBAE3  112 x 40

* ROMPTR 0B2 02F
* refs (1): D9A51
* Array of 256 strings: the keys that type each character, using codes 1 to 9 for key pictures. Characters with no key have an empty string.
CharKeyTbl:
        CON(5)  DOARRY                           * DBF57  array 256
        LENGTH                                   * DBF5C  length, to #DCA1E
        CON(5)  DOCSTR                           * DBF61  element type
        CON(5)  1                                * DBF66  dimensions
        CON(5)  256                              * DBF6B
        $BODY   ""                               * DBF70  1
        $BODY   ""                               * DBF75  2
        $BODY   ""                               * DBF7A  3
        $BODY   ""                               * DBF7F  4
        $BODY   ""                               * DBF84  5
        $BODY   ""                               * DBF89  6
        $BODY   ""                               * DBF8E  7
        $BODY   ""                               * DBF93  8
        $BODY   ""                               * DBF98  9
        $BODY   ""                               * DBF9D  10
        $BODY   "\02."                           * DBFA2  11
        $BODY   ""                               * DBFAB  12
        $BODY   ""                               * DBFB0  13
        $BODY   ""                               * DBFB5  14
        $BODY   ""                               * DBFBA  15
        $BODY   ""                               * DBFBF  16
        $BODY   ""                               * DBFC4  17
        $BODY   ""                               * DBFC9  18
        $BODY   ""                               * DBFCE  19
        $BODY   ""                               * DBFD3  20
        $BODY   ""                               * DBFD8  21
        $BODY   ""                               * DBFDD  22
        $BODY   ""                               * DBFE2  23
        $BODY   ""                               * DBFE7  24
        $BODY   ""                               * DBFEC  25
        $BODY   ""                               * DBFF1  26
        $BODY   ""                               * DBFF6  27
        $BODY   ""                               * DBFFB  28
        $BODY   ""                               * DC000  29
        $BODY   ""                               * DC005  30
        $BODY   ""                               * DC00A  31
        $BODY   ""                               * DC00F  32
        $BODY   "[SPC]"                          * DC014  33
        $BODY   "α\01[DEL]"                      * DC023  34
        $BODY   "α\02\08"                        * DC036  35
        $BODY   "\02\06"                         * DC041  36
        $BODY   "α\014"                          * DC04A  37
        $BODY   "α\02U"                          * DC055  38
        $BODY   "α\01[ENTER]"                    * DC060  39
        $BODY   "α\02'"                          * DC077  40
        $BODY   "\01\06"                         * DC082  41
        $BODY   "\01\06"                         * DC08B  42
        $BODY   "α\07"                           * DC094  43
        $BODY   "α\09"                           * DC09D  44
        $BODY   "\01. or ."                      * DC0A6  45
        $BODY   "α\08"                           * DC0B9  46
        $BODY   ". (FM.)"                        * DC0C2  47
        $BODY   "α\06"                           * DC0D5  48
        $BODY   "0"                              * DC0DE  49
        $BODY   "1"                              * DC0E5  50
        $BODY   "2"                              * DC0EC  51
        $BODY   "3"                              * DC0F3  52
        $BODY   "4"                              * DC0FA  53
        $BODY   "5"                              * DC101  54
        $BODY   "6"                              * DC108  55
        $BODY   "7"                              * DC10F  56
        $BODY   "8"                              * DC116  57
        $BODY   "9"                              * DC11D  58
        $BODY   "α\02\09"                        * DC124  59
        $BODY   "\01. (FM,)"                     * DC12F  60
        $BODY   "α\012"                          * DC144  61
        $BODY   "α\010"                          * DC14F  62
        $BODY   "α\022"                          * DC15A  63
        $BODY   "α\01\04"                        * DC165  64
        $BODY   "α\02[ENTER]"                    * DC170  65
        $BODY   "αA"                             * DC187  66
        $BODY   "αB"                             * DC190  67
        $BODY   "αC"                             * DC199  68
        $BODY   "αD"                             * DC1A2  69
        $BODY   "αE"                             * DC1AB  70
        $BODY   "αF"                             * DC1B4  71
        $BODY   "αG"                             * DC1BD  72
        $BODY   "αH"                             * DC1C6  73
        $BODY   "αI"                             * DC1CF  74
        $BODY   "αJ"                             * DC1D8  75
        $BODY   "αK"                             * DC1E1  76
        $BODY   "αL"                             * DC1EA  77
        $BODY   "αM"                             * DC1F3  78
        $BODY   "αN"                             * DC1FC  79
        $BODY   "αO"                             * DC205  80
        $BODY   "αP"                             * DC20E  81
        $BODY   "αQ"                             * DC217  82
        $BODY   "αR"                             * DC220  83
        $BODY   "αS"                             * DC229  84
        $BODY   "αT"                             * DC232  85
        $BODY   "αU"                             * DC23B  86
        $BODY   "αV"                             * DC244  87
        $BODY   "αW"                             * DC24D  88
        $BODY   "αX"                             * DC256  89
        $BODY   "αY"                             * DC25F  90
        $BODY   "αZ"                             * DC268  91
        $BODY   "\01\07"                         * DC271  92
        $BODY   ""                               * DC27A  93
        $BODY   "\01\07"                         * DC27F  94
        $BODY   "\05"                            * DC288  95
        $BODY   "\02\07"                         * DC28F  96
        $BODY   ""                               * DC298  97
        $BODY   "α\01A"                          * DC29D  98
        $BODY   "α\01B"                          * DC2A8  99
        $BODY   "α\01C"                          * DC2B3  100
        $BODY   "α\01D"                          * DC2BE  101
        $BODY   "α\01E"                          * DC2C9  102
        $BODY   "α\01F"                          * DC2D4  103
        $BODY   "α\01G"                          * DC2DF  104
        $BODY   "α\01H"                          * DC2EA  105
        $BODY   "α\01I"                          * DC2F5  106
        $BODY   "α\01J"                          * DC300  107
        $BODY   "α\01K"                          * DC30B  108
        $BODY   "α\01L"                          * DC316  109
        $BODY   "α\01M"                          * DC321  110
        $BODY   "α\01N"                          * DC32C  111
        $BODY   "α\01O"                          * DC337  112
        $BODY   "α\01P"                          * DC342  113
        $BODY   "α\01Q"                          * DC34D  114
        $BODY   "α\01R"                          * DC358  115
        $BODY   "α\01S"                          * DC363  116
        $BODY   "α\01T"                          * DC36E  117
        $BODY   "α\01U"                          * DC379  118
        $BODY   "α\01V"                          * DC384  119
        $BODY   "α\01W"                          * DC38F  120
        $BODY   "α\01X"                          * DC39A  121
        $BODY   "α\01Y"                          * DC3A5  122
        $BODY   "α\01Z"                          * DC3B0  123
        $BODY   "\01\09"                         * DC3BB  124
        $BODY   "α\02J"                          * DC3C4  125
        $BODY   "\01\09"                         * DC3CF  126
        $BODY   "α\02V"                          * DC3D8  127
        $BODY   ""                               * DC3E3  128
        $BODY   "\02[SPC]"                       * DC3E8  129
        $BODY   "α\02X"                          * DC3F9  130
        $BODY   ""                               * DC404  131
        $BODY   "\03"                            * DC409  132
        $BODY   "\02[COS]"                       * DC410  133
        $BODY   "\02[TAN]"                       * DC421  134
        $BODY   ""                               * DC432  135
        $BODY   "\01[SPC]"                       * DC437  136
        $BODY   "\02[SIN]"                       * DC448  137
        $BODY   "α\013"                          * DC459  138
        $BODY   "α\023"                          * DC464  139
        $BODY   "α\021"                          * DC46F  140
        $BODY   "α\02A"                          * DC47A  141
        $BODY   "\020"                           * DC485  142
        $BODY   "α\02P"                          * DC48E  143
        $BODY   "α\02Q"                          * DC499  144
        $BODY   "α\02K"                          * DC4A4  145
        $BODY   "α\02G"                          * DC4AF  146
        $BODY   "α\02D"                          * DC4BA  147
        $BODY   "α\02E"                          * DC4C5  148
        $BODY   "α\02H"                          * DC4D0  149
        $BODY   "α\02F"                          * DC4DB  150
        $BODY   "α\02L"                          * DC4E6  151
        $BODY   "α\02R"                          * DC4F1  152
        $BODY   "α\02S"                          * DC4FC  153
        $BODY   "α\02T"                          * DC507  154
        $BODY   "α\02W"                          * DC512  155
        $BODY   "α\02C"                          * DC51D  156
        $BODY   "α\02Z"                          * DC528  157
        $BODY   "α\02O"                          * DC533  158
        $BODY   ""                               * DC53E  159
        $BODY   "α\02I"                          * DC543  160
        $BODY   ""                               * DC54E  161
        $BODY   "α\02[DEL]"                      * DC553  162
        $BODY   "α\024"                          * DC566  163
        $BODY   "α\015"                          * DC571  164
        $BODY   "α\016"                          * DC57C  165
        $BODY   "α\025"                          * DC587  166
        $BODY   ""                               * DC592  167
        $BODY   ""                               * DC597  168
        $BODY   ""                               * DC59C  169
        $BODY   ""                               * DC5A1  170
        $BODY   ""                               * DC5A6  171
        $BODY   "α\01\08"                        * DC5AB  172
        $BODY   ""                               * DC5B6  173
        $BODY   ""                               * DC5BB  174
        $BODY   ""                               * DC5C0  175
        $BODY   ""                               * DC5C5  176
        $BODY   "α\026"                          * DC5CA  177
        $BODY   "α\02Y"                          * DC5D5  178
        $BODY   ""                               * DC5E0  179
        $BODY   ""                               * DC5E5  180
        $BODY   ""                               * DC5EA  181
        $BODY   "α\02N"                          * DC5EF  182
        $BODY   ""                               * DC5FA  183
        $BODY   ""                               * DC5FF  184
        $BODY   ""                               * DC604  185
        $BODY   ""                               * DC609  186
        $BODY   ""                               * DC60E  187
        $BODY   "α\01\08"                        * DC613  188
        $BODY   ""                               * DC61E  189
        $BODY   ""                               * DC623  190
        $BODY   ""                               * DC628  191
        $BODY   "α\02\04"                        * DC62D  192
        $BODY   "αAα\017"                        * DC638  193
        $BODY   "αAα\027"                        * DC647  194
        $BODY   "αAα\018"                        * DC656  195
        $BODY   "αAα\028"                        * DC665  196
        $BODY   "αAα\019"                        * DC674  197
        $BODY   "αAα\029"                        * DC683  198
        $BODY   "αEα\029"                        * DC692  199
        $BODY   "αCα\029"                        * DC6A1  200
        $BODY   "αEα\017"                        * DC6B0  201
        $BODY   "αEα\027"                        * DC6BF  202
        $BODY   "αEα\018"                        * DC6CE  203
        $BODY   "αEα\019"                        * DC6DD  204
        $BODY   "αIα\017"                        * DC6EC  205
        $BODY   "αIα\027"                        * DC6FB  206
        $BODY   "αIα\018"                        * DC70A  207
        $BODY   "αIα\019"                        * DC719  208
        $BODY   "αDα\029"                        * DC728  209
        $BODY   "αNα\028"                        * DC737  210
        $BODY   "αOα\017"                        * DC746  211
        $BODY   "αOα\027"                        * DC755  212
        $BODY   "αOα\018"                        * DC764  213
        $BODY   "αOα\028"                        * DC773  214
        $BODY   "αOα\019"                        * DC782  215
        $BODY   ""                               * DC791  216
        $BODY   "αOα\029"                        * DC796  217
        $BODY   "αUα\017"                        * DC7A5  218
        $BODY   "αUα\027"                        * DC7B4  219
        $BODY   "αUα\018"                        * DC7C3  220
        $BODY   "αUα\019"                        * DC7D2  221
        $BODY   "αYα\027"                        * DC7E1  222
        $BODY   "αPα\029"                        * DC7F0  223
        $BODY   "α\02B"                          * DC7FF  224
        $BODY   "α\01Aα\017"                     * DC80A  225
        $BODY   "α\01Aα\027"                     * DC81B  226
        $BODY   "α\01Aα\018"                     * DC82C  227
        $BODY   "α\01Aα\028"                     * DC83D  228
        $BODY   "α\01Aα\019"                     * DC84E  229
        $BODY   "α\01Aα\029"                     * DC85F  230
        $BODY   "α\01Eα\029"                     * DC870  231
        $BODY   "α\01Cα\029"                     * DC881  232
        $BODY   "α\01Eα\017"                     * DC892  233
        $BODY   "α\01Eα\027"                     * DC8A3  234
        $BODY   "α\01Eα\018"                     * DC8B4  235
        $BODY   "α\01Eα\019"                     * DC8C5  236
        $BODY   "α\01Iα\017"                     * DC8D6  237
        $BODY   "α\01Iα\027"                     * DC8E7  238
        $BODY   "α\01Iα\018"                     * DC8F8  239
        $BODY   "α\01Iα\019"                     * DC909  240
        $BODY   "α\01Dα\029"                     * DC91A  241
        $BODY   "α\01Nα\028"                     * DC92B  242
        $BODY   "α\01Oα\017"                     * DC93C  243
        $BODY   "α\01Oα\027"                     * DC94D  244
        $BODY   "α\01Oα\018"                     * DC95E  245
        $BODY   "α\01Oα\028"                     * DC96F  246
        $BODY   "α\01Oα\019"                     * DC980  247
        $BODY   ""                               * DC991  248
        $BODY   "α\01Oα\029"                     * DC996  249
        $BODY   "α\01Uα\017"                     * DC9A7  250
        $BODY   "α\01Uα\027"                     * DC9B8  251
        $BODY   "α\01Uα\018"                     * DC9C9  252
        $BODY   "α\01Uα\019"                     * DC9DA  253
        $BODY   "α\01Yα\027"                     * DC9EB  254
        $BODY   "α\01Pα\029"                     * DC9FC  255
        $BODY   "α\01Yα\019"                     * DCA0D  256
        ENDLENGTH                                * DCA1E

LIB0B2.hash:
        CON(5)  DOHSTR                           * DCA1E  hash table of library 0B2
        LENGTH                                   * DCA23  length, to #DCA82
        CON(5)  0                                * DCA28  names of length 1
        CON(5)  0                                * DCA2D  names of length 2
        CON(5)  0                                * DCA32  names of length 3
        CON(5)  0                                * DCA37  names of length 4
        CON(5)  0                                * DCA3C  names of length 5
        CON(5)  0                                * DCA41  names of length 6
        CON(5)  0                                * DCA46  names of length 7
        CON(5)  0                                * DCA4B  names of length 8
        CON(5)  0                                * DCA50  names of length 9
        CON(5)  0                                * DCA55  names of length 10
        CON(5)  0                                * DCA5A  names of length 11
        CON(5)  0                                * DCA5F  names of length 12
        CON(5)  0                                * DCA64  names of length 13
        CON(5)  0                                * DCA69  names of length 14
        CON(5)  0                                * DCA6E  names of length 15
        CON(5)  0                                * DCA73  names of length 16
        REL(5)  LIB0B2.hash.L1                   * DCA78  end of the names
LIB0B2.hash.L1:
        CON(5)  0                                * DCA7D  command 000 has no name
