* HP 48GX ROM revision R, #BD8E9-#BFFFF: Library 0B3: the last pre-drawn frames, the CHOOSE command's body, and the hash and link tables
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ChooseItem$ ~ChooseSimple sysCHOOSE ChooseBox51 ChooseBox42 ChooseBox33
* Follows on from the previous file (at #BD8E9 in the original ROM).
        RPL

* ROMPTR 0B3 060 sysCHOOSE
* refs (1): BA576
* Pre-drawn frame, 2 rows with a title. The third-party name sysCHOOSE belongs to command 063
ChooseBox33:
        GROB    "images/BD8E9-ChooseBox33.png"   * BD8E9  98 x 33

* ROMPTR 0B3 061
* refs (1): BA576
* Pre-drawn frame, 3 rows with a title
ChooseBox42:
        GROB    "images/BDC57-ChooseBox42.png"   * BDC57  98 x 42

* ROMPTR 0B3 062
* refs (1): BA576
* Pre-drawn frame, 4 rows with a title
ChooseBox51:
        GROB    "images/BE0AF-ChooseBox51.png"   * BE0AF  98 x 51

* ROMPTR 0B3 063
* refs (1): BA576
* $title {} %sel -> ob %1, or $title {} %sel -> %0: the CHOOSE command
sysCHOOSE:
        :: OVER NULLCOMP? caseSIZEERR COERCE     * BE5F1
          DUP 3PICK LENCOMP #> caseSIZEERR 'DROPFALSE * BE60A
          4ROLL BINT91 XLIB $FitLeft DROP ' XLIB ChooseItem$ 5ROLL 5ROLL * BE628
          XLIB ~Choose NOTcase %0_2A2B4          * BE65C
          :: DUPTYPELIST? NOT?SEMI               * BE671
            DUPLENCOMP BINT2 #< ?SEMI            * BE680
            XLIB ~BINT2;NTHCOMPROM@ ;            * BE694
          %1 ;                                   * BE6A4

* ROMPTR 0B3 065
* refs (2): BA576 BA576
* ob -> $: how CHOOSE shows an item: the first element of a list, or the object as text. Commands 064 and 065 are this object
ChooseItem$:
        :: DUPTYPELIST? IT                       * BE6AE
          :: DUPNULLCOMP? ?SEMI                  * BE6BD
            XLIB ~BINT1;NTHCOMPROM@ ;            * BE6CC
          DUPTYPECSTR? ?SEMI                     * BE6DC
          BINT4 XLIB IFDecomp ;                  * BE6E6

* ROMPTR 0B3 066
* refs (1): BA576
~ChooseSimple:
        :: ' DROPFALSE ROT BINT17 4ROLL BINT1 XLIB ~Choose NOTcaseFALSE * BE6FB
          XLIB ~BINT2;NTHCOMPROM@                * BE72E
          TRUE ;                                 * BE739

LIB0B3.hash:
        CON(5)  DOHSTR                           * BE743  hash table of library 0B3
        LENGTH                                   * BE748  length, to #BE7A7
        CON(5)  0                                * BE74D  names of length 1
        CON(5)  0                                * BE752  names of length 2
        CON(5)  0                                * BE757  names of length 3
        CON(5)  0                                * BE75C  names of length 4
        CON(5)  0                                * BE761  names of length 5
        CON(5)  0                                * BE766  names of length 6
        CON(5)  0                                * BE76B  names of length 7
        CON(5)  0                                * BE770  names of length 8
        CON(5)  0                                * BE775  names of length 9
        CON(5)  0                                * BE77A  names of length 10
        CON(5)  0                                * BE77F  names of length 11
        CON(5)  0                                * BE784  names of length 12
        CON(5)  0                                * BE789  names of length 13
        CON(5)  0                                * BE78E  names of length 14
        CON(5)  0                                * BE793  names of length 15
        CON(5)  0                                * BE798  names of length 16
        REL(5)  LIB0B3.hash.L1                   * BE79D  end of the names
LIB0B3.hash.L1:
        CON(5)  0                                * BE7A2  command 000 has no name
        ENDLENGTH                                * BE7A7

LIB0B3.link:
        CON(5)  DOHSTR                           * BE7A7  link table of library 0B3
        LENGTH                                   * BE7AC  length, to #BE9B4
        REL(5)  ~Choose                          * BE7B1  000 ~Choose
        REL(5)  BBDisplay                        * BE7B6  001 
        REL(5)  BBDispBackgr                     * BE7BB  002 
        REL(5)  BBDispPrompt                     * BE7C0  003 
        REL(5)  BBDispList                       * BE7C5  004 
        REL(5)  ~ChooseMenu0                     * BE7CA  005 ~ChooseMenu0
        REL(5)  ~ChooseMenu1                     * BE7CF  006 ~ChooseMenu1
        REL(5)  ~ChooseMenu2                     * BE7D4  007 ~ChooseMenu2
        REL(5)  BBKey                            * BE7D9  008 
        REL(5)  BBKeyPlain                       * BE7DE  009 
        REL(5)  BBKeyLeft                        * BE7E3  00A 
        REL(5)  BBKeyRight                       * BE7E8  00B 
        REL(5)  BBKeyAlpha                       * BE7ED  00C 
        REL(5)  BBKeyAlphaLeft                   * BE7F2  00D 
        REL(5)  BBKeyAlphaRight                  * BE7F7  00E 
        REL(5)  BBSeekKey                        * BE7FC  00F 
        REL(5)  BBSeekProg                       * BE801  010 
        REL(5)  BBSeekChr                        * BE806  011 
        REL(5)  BBChrUpper                       * BE80B  012 
        REL(5)  BBFirstAlnum                     * BE810  013 
        REL(5)  BBAlnum?                         * BE815  014 
        REL(5)  ~BBMoveTo                        * BE81A  015 ~BBMoveTo
        REL(5)  BBScrollUp1                      * BE81F  016 
        REL(5)  BBScrollDown1                    * BE824  017 
        REL(5)  BBMoveBar                        * BE829  018 
        REL(5)  ~BBRecalOff&Disp                 * BE82E  019 ~BBRecalOff&Disp
        REL(5)  BBUpKey                          * BE833  01A 
        REL(5)  BBStepUp                         * BE838  01B 
        REL(5)  BBDownKey                        * BE83D  01C 
        REL(5)  BBStepDown                       * BE842  01D 
        REL(5)  BBPageUpKey                      * BE847  01E 
        REL(5)  BBPageDownKey                    * BE84C  01F 
        REL(5)  BBTopKey                         * BE851  020 
        REL(5)  BBBottomKey                      * BE856  021 
        REL(5)  ~BBRunEntryProc                  * BE85B  022 ~BBRunEntryProc
        REL(5)  ~BBReReadPageSize                * BE860  023 ~BBReReadPageSize
        REL(5)  ~BBReReadHeight                  * BE865  024 ~BBReReadHeight
        REL(5)  ~BBReReadCoords                  * BE86A  025 ~BBReReadCoords
        REL(5)  ~BBReReadWidth                   * BE86F  026 ~BBReReadWidth
        REL(5)  BBReReadOffset                   * BE874  027 
        REL(5)  ~BBRunENTERAction                * BE879  028 ~BBRunENTERAction
        REL(5)  ~BBRunCanclAction                * BE87E  029 ~BBRunCanclAction
        REL(5)  DoCKeyCheck                      * BE883  02A DoCKeyCheck
        REL(5)  DoCKeyChAll                      * BE888  02B DoCKeyChAll
        REL(5)  DoCKeyUnChAll                    * BE88D  02C DoCKeyUnChAll
        REL(5)  DoCKeyCancel                     * BE892  02D DoCKeyCancel
        REL(5)  DoCKeyOK                         * BE897  02E DoCKeyOK
        REL(5)  ~BBReDrawBackgr                  * BE89C  02F ~BBReDrawBackgr
        REL(5)  LEDispPrompt                     * BE8A1  030 LEDispPrompt
        REL(5)  BBPromptGrob                     * BE8A6  031 
        REL(5)  BBPromptBig                      * BE8AB  032 
        REL(5)  BBPromptSmall                    * BE8B0  033 
        REL(5)  BBPrompt$                        * BE8B5  034 
        REL(5)  LEDispList                       * BE8BA  035 LEDispList
        REL(5)  LEDispItem                       * BE8BF  036 LEDispItem
        REL(5)  ~BBGetNGrob                      * BE8C4  037 ~BBGetNGrob
        REL(5)  ~BBGetNStr                       * BE8C9  038 ~BBGetNStr
        REL(5)  BBSaveScreen                     * BE8CE  039 
        REL(5)  BBRestScreen                     * BE8D3  03A 
        REL(5)  ~BBRereadChkEnbl                 * BE8D8  03B ~BBRereadChkEnbl
        REL(5)  ~BBRereadFullScr                 * BE8DD  03C ~BBRereadFullScr
        REL(5)  ~BReReadMenus                    * BE8E2  03D ~BReReadMenus
        REL(5)  ~BBReReadNElems                  * BE8E7  03E ~BBReReadNElems
        REL(5)  ~BBGetN                          * BE8EC  03F ~BBGetN
        REL(5)  BBChecks                         * BE8F1  040 
        REL(5)  BBStdBox?                        * BE8F6  041 
        REL(5)  BBDrawStdBox                     * BE8FB  042 
        REL(5)  BBPromptPos                      * BE900  043 
        REL(5)  BBAddTitle                       * BE905  044 
        REL(5)  BBSubTitle                       * BE90A  045 
        REL(5)  BBAddArrows                      * BE90F  046 
        REL(5)  BBSubArrows                      * BE914  047 
        REL(5)  BBScrolls?                       * BE919  048 
        REL(5)  BBClearPrompt                    * BE91E  049 
        REL(5)  BBSplitFocus                     * BE923  04A 
        REL(5)  ~BBIsChecked?                    * BE928  04B ~BBIsChecked?
        REL(5)  BBPromptLine                     * BE92D  04C 
        REL(5)  BBInvertRow                      * BE932  04D 
        REL(5)  BBInvertRow                      * BE937  04E 
        REL(5)  BBDispArrows                     * BE93C  04F 
        REL(5)  BBMoreAbove?                     * BE941  050 
        REL(5)  BBMoreBelow?                     * BE946  051 
        REL(5)  ~BBUpArrow                       * BE94B  052 ~BBUpArrow
        REL(5)  ~BBDownArrow                     * BE950  053 ~BBDownArrow
        REL(5)  ~BBSpace                         * BE955  054 ~BBSpace
        REL(5)  BBMsg                            * BE95A  055 
        REL(5)  BBHasTitle?                      * BE95F  056 
        REL(5)  BBGetDAs                         * BE964  057 
        REL(5)  BBSetDAs                         * BE969  058 
        REL(5)  ~BBPgDown                        * BE96E  059 ~BBPgDown
        REL(5)  ~BBPgUp                          * BE973  05A ~BBPgUp
        REL(5)  ~BBEmpty?                        * BE978  05B ~BBEmpty?
        REL(5)  ChooseBox25                      * BE97D  05C ~BBGetDefltHeight
        REL(5)  ChooseBox34                      * BE982  05D 
        REL(5)  ChooseBox43                      * BE987  05E 
        REL(5)  ChooseBox52                      * BE98C  05F ~$>grobOrGROB
        REL(5)  ChooseBox33                      * BE991  060 sysCHOOSE
        REL(5)  ChooseBox42                      * BE996  061 
        REL(5)  ChooseBox51                      * BE99B  062 
        REL(5)  sysCHOOSE                        * BE9A0  063 
        REL(5)  ChooseItem$                      * BE9A5  064 
        REL(5)  ChooseItem$                      * BE9AA  065 
        REL(5)  ~ChooseSimple                    * BE9AF  066 ~ChooseSimple
        ENDLENGTH                                * BE9B4
        ENDLENGTH                                * BE9B4
        FILLTO  #C0000                           * BE9B4  5708 zero nibbles: the next entry stays at #C0000
