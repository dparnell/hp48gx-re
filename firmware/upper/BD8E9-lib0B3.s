* HP 48GX ROM revision R, #BD8E9-#BFFFF: Library part 0B3
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~ChooseSimple sysCHOOSE
* Follows on from the previous file (at #BD8E9 in the original ROM).
        RPL

* ROMPTR 0B3 060
* refs (1): BA576
sysCHOOSE:
        GROB    "images/BD8E9-sysCHOOSE.png"     * BD8E9  98 x 33

* ROMPTR 0B3 061
* refs (1): BA576
ROMP_0B3_061:
        GROB    "images/BDC57.png"               * BDC57  98 x 42

* ROMPTR 0B3 062
* refs (1): BA576
ROMP_0B3_062:
        GROB    "images/BE0AF.png"               * BE0AF  98 x 51

* ROMPTR 0B3 063
* refs (1): BA576
ROMP_0B3_063:
        ::                                       * BE5F1
          OVER                                   * BE5F6
          NULLCOMP?                              * BE5FB
          caseSIZEERR                            * BE600
          COERCE                                 * BE605
          DUP                                    * BE60A
          3PICK                                  * BE60F
          LENCOMP                                * BE614
          #>                                     * BE619
          caseSIZEERR                            * BE61E
          'DROPFALSE                             * BE623
          4ROLL                                  * BE628
          BINT91                                 * BE62D
          ROMPTR  0B0 06F                        * BE632
          DROP                                   * BE63D
          '                                      * BE642
          ROMPTR  0B3 065                        * BE647
          5ROLL                                  * BE652
          5ROLL                                  * BE657
          ROMPTR  0B3 000                        * BE65C  ~Choose
          NOTcase                                * BE667
          %0_2A2B4                               * BE66C
          ::                                     * BE671
            DUPTYPELIST?                         * BE676
            NOT?SEMI                             * BE67B
            DUPLENCOMP                           * BE680
            BINT2                                * BE685
            #<                                   * BE68A
            ?SEMI                                * BE68F
            ROMPTR  0B0 099                      * BE694
          ;                                      * BE69F
          %1                                     * BE6A4
        ;                                        * BE6A9

* ROMPTR 0B3 065
* refs (2): BA576 BA576
ROMP_0B3_065:
        ::                                       * BE6AE
          DUPTYPELIST?                           * BE6B3
          IT                                     * BE6B8
          ::                                     * BE6BD
            DUPNULLCOMP?                         * BE6C2
            ?SEMI                                * BE6C7
            ROMPTR  0B0 098                      * BE6CC
          ;                                      * BE6D7
          DUPTYPECSTR?                           * BE6DC
          ?SEMI                                  * BE6E1
          BINT4                                  * BE6E6
          ROMPTR  0B0 074                        * BE6EB
        ;                                        * BE6F6

* ROMPTR 0B3 066
* refs (1): BA576
~ChooseSimple:
        ::                                       * BE6FB
          '                                      * BE700
          DROPFALSE                              * BE705
          ROT                                    * BE70A
          BINT17                                 * BE70F
          4ROLL                                  * BE714
          BINT1                                  * BE719
          ROMPTR  0B3 000                        * BE71E  ~Choose
          NOTcaseFALSE                           * BE729
          ROMPTR  0B0 099                        * BE72E
          TRUE                                   * BE739
        ;                                        * BE73E

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
        REL(5)  L_BE7A2                          * BE79D  end of the names
L_BE7A2:
        CON(5)  0                                * BE7A2  command 000 has no name
        ENDLENGTH                                * BE7A7

LIB0B3.link:
        CON(5)  DOHSTR                           * BE7A7  link table of library 0B3
        LENGTH                                   * BE7AC  length, to #BE9B4
        REL(5)  ~Choose                          * BE7B1  000 ~Choose
        REL(5)  ROMP_0B3_001                     * BE7B6  001 
        REL(5)  ROMP_0B3_002                     * BE7BB  002 
        REL(5)  ROMP_0B3_003                     * BE7C0  003 
        REL(5)  ROMP_0B3_004                     * BE7C5  004 
        REL(5)  ~ChooseMenu0                     * BE7CA  005 ~ChooseMenu0
        REL(5)  ~ChooseMenu1                     * BE7CF  006 ~ChooseMenu1
        REL(5)  ~ChooseMenu2                     * BE7D4  007 ~ChooseMenu2
        REL(5)  ROMP_0B3_008                     * BE7D9  008 
        REL(5)  ROMP_0B3_009                     * BE7DE  009 
        REL(5)  ROMP_0B3_00A                     * BE7E3  00A 
        REL(5)  ROMP_0B3_00B                     * BE7E8  00B 
        REL(5)  ROMP_0B3_00C                     * BE7ED  00C 
        REL(5)  ROMP_0B3_00D                     * BE7F2  00D 
        REL(5)  ROMP_0B3_00E                     * BE7F7  00E 
        REL(5)  ROMP_0B3_00F                     * BE7FC  00F 
        REL(5)  ROMP_0B3_010                     * BE801  010 
        REL(5)  ROMP_0B3_011                     * BE806  011 
        REL(5)  ROMP_0B3_012                     * BE80B  012 
        REL(5)  ROMP_0B3_013                     * BE810  013 
        REL(5)  ROMP_0B3_014                     * BE815  014 
        REL(5)  ~BBMoveTo                        * BE81A  015 ~BBMoveTo
        REL(5)  ROMP_0B3_016                     * BE81F  016 
        REL(5)  ROMP_0B3_017                     * BE824  017 
        REL(5)  ROMP_0B3_018                     * BE829  018 
        REL(5)  ~BBRecalOff&Disp                 * BE82E  019 ~BBRecalOff&Disp
        REL(5)  ROMP_0B3_01A                     * BE833  01A 
        REL(5)  ROMP_0B3_01B                     * BE838  01B 
        REL(5)  ROMP_0B3_01C                     * BE83D  01C 
        REL(5)  ROMP_0B3_01D                     * BE842  01D 
        REL(5)  ROMP_0B3_01E                     * BE847  01E 
        REL(5)  ROMP_0B3_01F                     * BE84C  01F 
        REL(5)  ROMP_0B3_020                     * BE851  020 
        REL(5)  ROMP_0B3_021                     * BE856  021 
        REL(5)  ~BBRunEntryProc                  * BE85B  022 ~BBRunEntryProc
        REL(5)  ~BBReReadPageSize                * BE860  023 ~BBReReadPageSize
        REL(5)  ~BBReReadHeight                  * BE865  024 ~BBReReadHeight
        REL(5)  ~BBReReadCoords                  * BE86A  025 ~BBReReadCoords
        REL(5)  ~BBReReadWidth                   * BE86F  026 ~BBReReadWidth
        REL(5)  ROMP_0B3_027                     * BE874  027 
        REL(5)  ~BBRunENTERAction                * BE879  028 ~BBRunENTERAction
        REL(5)  ~BBRunCanclAction                * BE87E  029 ~BBRunCanclAction
        REL(5)  DoCKeyCheck                      * BE883  02A DoCKeyCheck
        REL(5)  DoCKeyChAll                      * BE888  02B DoCKeyChAll
        REL(5)  DoCKeyUnChAll                    * BE88D  02C DoCKeyUnChAll
        REL(5)  DoCKeyCancel                     * BE892  02D DoCKeyCancel
        REL(5)  DoCKeyOK                         * BE897  02E DoCKeyOK
        REL(5)  ~BBReDrawBackgr                  * BE89C  02F ~BBReDrawBackgr
        REL(5)  LEDispPrompt                     * BE8A1  030 LEDispPrompt
        REL(5)  ROMP_0B3_031                     * BE8A6  031 
        REL(5)  ROMP_0B3_032                     * BE8AB  032 
        REL(5)  ROMP_0B3_033                     * BE8B0  033 
        REL(5)  ROMP_0B3_034                     * BE8B5  034 
        REL(5)  LEDispList                       * BE8BA  035 LEDispList
        REL(5)  LEDispItem                       * BE8BF  036 LEDispItem
        REL(5)  ~BBGetNGrob                      * BE8C4  037 ~BBGetNGrob
        REL(5)  ~BBGetNStr                       * BE8C9  038 ~BBGetNStr
        REL(5)  ROMP_0B3_039                     * BE8CE  039 
        REL(5)  ROMP_0B3_03A                     * BE8D3  03A 
        REL(5)  ~BBRereadChkEnbl                 * BE8D8  03B ~BBRereadChkEnbl
        REL(5)  ~BBRereadFullScr                 * BE8DD  03C ~BBRereadFullScr
        REL(5)  ~BReReadMenus                    * BE8E2  03D ~BReReadMenus
        REL(5)  ~BBReReadNElems                  * BE8E7  03E ~BBReReadNElems
        REL(5)  ~BBGetN                          * BE8EC  03F ~BBGetN
        REL(5)  ROMP_0B3_040                     * BE8F1  040 
        REL(5)  ROMP_0B3_041                     * BE8F6  041 
        REL(5)  ROMP_0B3_042                     * BE8FB  042 
        REL(5)  ROMP_0B3_043                     * BE900  043 
        REL(5)  ROMP_0B3_044                     * BE905  044 
        REL(5)  ROMP_0B3_045                     * BE90A  045 
        REL(5)  ROMP_0B3_046                     * BE90F  046 
        REL(5)  ROMP_0B3_047                     * BE914  047 
        REL(5)  ROMP_0B3_048                     * BE919  048 
        REL(5)  ROMP_0B3_049                     * BE91E  049 
        REL(5)  ROMP_0B3_04A                     * BE923  04A 
        REL(5)  ~BBIsChecked?                    * BE928  04B ~BBIsChecked?
        REL(5)  ROMP_0B3_04C                     * BE92D  04C 
        REL(5)  ROMP_0B3_04E                     * BE932  04D 
        REL(5)  ROMP_0B3_04E                     * BE937  04E 
        REL(5)  ROMP_0B3_04F                     * BE93C  04F 
        REL(5)  ROMP_0B3_050                     * BE941  050 
        REL(5)  ROMP_0B3_051                     * BE946  051 
        REL(5)  ~BBUpArrow                       * BE94B  052 ~BBUpArrow
        REL(5)  ~BBDownArrow                     * BE950  053 ~BBDownArrow
        REL(5)  ~BBSpace                         * BE955  054 ~BBSpace
        REL(5)  ROMP_0B3_055                     * BE95A  055 
        REL(5)  ROMP_0B3_056                     * BE95F  056 
        REL(5)  ROMP_0B3_057                     * BE964  057 
        REL(5)  ROMP_0B3_058                     * BE969  058 
        REL(5)  ~BBPgDown                        * BE96E  059 ~BBPgDown
        REL(5)  ~BBPgUp                          * BE973  05A ~BBPgUp
        REL(5)  ~BBEmpty?                        * BE978  05B ~BBEmpty?
        REL(5)  ~BBGetDefltHeight                * BE97D  05C ~BBGetDefltHeight
        REL(5)  ROMP_0B3_05D                     * BE982  05D 
        REL(5)  ROMP_0B3_05E                     * BE987  05E 
        REL(5)  ~$>grobOrGROB                    * BE98C  05F ~$>grobOrGROB
        REL(5)  sysCHOOSE                        * BE991  060 sysCHOOSE
        REL(5)  ROMP_0B3_061                     * BE996  061 
        REL(5)  ROMP_0B3_062                     * BE99B  062 
        REL(5)  ROMP_0B3_063                     * BE9A0  063 
        REL(5)  ROMP_0B3_065                     * BE9A5  064 
        REL(5)  ROMP_0B3_065                     * BE9AA  065 
        REL(5)  ~ChooseSimple                    * BE9AF  066 ~ChooseSimple
        ENDLENGTH                                * BE9B4
        FILLTO  #C0000                           * BE9B4  5708 zero nibbles: the next entry stays at #C0000
