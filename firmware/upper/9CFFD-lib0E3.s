* HP 48GX ROM revision R, #9CFFD-#9DA12: Library 0E3: the Equation Library's picture viewer, ~PCunpack, SOLVEQN and the library's messages
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~PCunpack ViewPrev ViewCancel PicSto2 PicSto1 PicShiftKey PicMenu PicLam2 PicLam1 PicKeys PicKey PicEnter
* Follows on from the previous file (at #9CFFD in the original ROM).
        RPL

* ROMPTR 0E3 05C
* refs (1): 99FF5
* ON: runs the second action of the keys list
ViewCancel:
        :: TakeOver XLIB ViewLam2 BINT2 NTHCOMPDROP COLA_EVAL ; * 9CFFD

* ROMPTR 0E3 05D
* refs (1): 99FF5
* Up arrow: runs the third action of the keys list
ViewPrev:
        :: TakeOver XLIB ViewLam2 BINT3 NTHCOMPDROP COLA_EVAL ; * 9D026

* ROMPTR 0E3 05E
* refs (1): 99FF5
* ob -> : stores into PC1, the picture viewer's done flag
PicSto1:
        :: ' LAM 'PC1 STO ;                      * 9D04F

* ROMPTR 0E3 05F
* refs (1): 99FF5
* ob -> : stores into PC2, the keys list
PicSto2:
        :: ' LAM 'PC2 STO ;                      * 9D072

* ROMPTR 0E3 060
* refs (1): 99FF5
* keys menu pic -> : shows the picture and runs the picture viewer's key loop. A list of frames is played through 20 times as an animation; the empty marker shows "No Picture Available"
ELShowPic:
        :: SWAP FALSE                            * 9D095
          {                                      * 9D0A4

* ROMPTR 0E3 061
* refs (1): 99FF5
* -> ob: recalls PC2
PicLam2:
            LAM 'PC2                             * 9D0A9

* ROMPTR 0E3 062
* refs (1): 99FF5
* -> ob: recalls PC1
PicLam1:
            LAM 'PC1 }                           * 9D0B8
          BIND CLCD10 DUP XLIB EqNoPic EQITE     * 9D0CC
          :: DROP BINT0 BINT36 # E304 JstGetTHEMESG $>GROB XYGROBDISP BINT0 * 9D0EB  "No Picture Available"
            BINT21 XLIB ELLam3 CARCOMP EVAL XLIB ELLam5 SWAP GETATELN DROP * 9D11D
            PTR CHR_: >T$ $>GROB XYGROBDISP ;    * 9D151
          :: DUP LENCOMP DUP BINT3 #= ITE        * 9D16A
            :: DROP INCOMPDROP XLIB ~PCunpack XYGROBDISP ; * 9D18D
            :: SWAP BINT21 BINT1 DO OVER #1+ BINT1 DO DUP INDEX@ NTHCOMPDROP * 9D1B1
              EVAL INCOMPDROP XLIB ~PCunpack XYGROBDISP SLOW SLOW SLOW SLOW * 9D1ED
              LOOP LOOP 2DROP ;                  * 9D21B
          ;                                      * 9D22F
          ClrDAsOK ' XLIB PicMenu RESOROMP XLIB PicKeys TRUE TRUE 5ROLL * 9D234
          BINT1 FALSE ' LAM 'PC1 ' ERRJMP POLSetUI POLKeyUI ABND ClrDAsOK ; * 9D268

* ROMPTR 0E3 063
* refs (1): 99FF5
* packed -> grob: unpacks a picture. Each control byte has bit 7 set for a run (one repeated byte) or clear for a literal count. Data nibbles follow, so the stream need not be byte aligned
~PCunpack:
        CODE                                     * 9D2A9  241 nibbles
          GOSBVL  SAVPTR                         * 9D2B3
          A=DAT1  A                              * 9D2BA
          D1=A                                   * 9D2BD
          D1=D1+  5                              * 9D2C0
          A=DAT1  A                              * 9D2C3
          A=A-CON A,9                            * 9D2C6
          R2=A                                   * 9D2CC
          D1=D1+  5                              * 9D2CF
          C=0     A                              * 9D2D2
          C=DAT1  B                              * 9D2D4
          R1=C                                   * 9D2D7
          D1=D1+  2                              * 9D2DA
          A=0     A                              * 9D2DD
          A=DAT1  B                              * 9D2DF
          R0=A                                   * 9D2E2
          D1=D1+  2                              * 9D2E5
          CD1EX                                  * 9D2E8
          RSTK=C                                 * 9D2EB
          GOSBVL  makegrob                       * 9D2ED
          C=RSTK                                 * 9D2F4
          CD0EX                                  * 9D2F6
          D1=C                                   * 9D2F9
          C=C-CON A,15                           * 9D2FC
          C=C-CON A,5                            * 9D302
          R0=C                                   * 9D308
          A=R2                                   * 9D30B
          B=A     A                              * 9D30E
          A=0     A                              * 9D310
~PCunpack.loop1:
          A=0     S                              * 9D312
~PCunpack.loop2:
          B=B-1   A                              * 9D315
          GOC     ~PCunpack.L6                   * 9D317
          A=DAT0  B                              * 9D31A
          B=B-1   A                              * 9D31D
          B=B-1   A                              * 9D31F
          D0=D0+  2                              * 9D321
          ?ABIT=0 7                              * 9D324
          GOYES   ~PCunpack.L7                   * 9D329
          ABIT=0  7                              * 9D32B
          C=DAT0  1                              * 9D330
          ?A=0    S                              * 9D334
          GOYES   ~PCunpack.L3                   * 9D337
          DAT1=C  B                              * 9D339
          D1=D1+  2                              * 9D33C
          A=A-1   B                              * 9D33F
          GOC     ~PCunpack.loop1                * 9D342
~PCunpack.L3:
          CSL     B                              * 9D345
          C=DAT0  1                              * 9D348
          D0=D0+  1                              * 9D34C
~PCunpack.loop4:
          A=A-1   B                              * 9D34F
          GOC     ~PCunpack.loop5                * 9D352
          DAT1=C  B                              * 9D355
          D1=D1+  2                              * 9D358
          A=A-1   B                              * 9D35B
          GONC    ~PCunpack.loop4                * 9D35E
          GOC     ~PCunpack.loop1                * 9D361
~PCunpack.loop5:
          A=0     S                              * 9D364
          A=A-1   S                              * 9D367
          GOC     ~PCunpack.loop2                * 9D36A
~PCunpack.L6:
          P=      0                              * 9D36D
          GOVLNG  GPOverWrR0Lp                   * 9D36F
~PCunpack.L7:
          B=B-A   A                              * 9D376
          ?A#0    S                              * 9D378
          GOYES   ~PCunpack.L9                   * 9D37B
~PCunpack.loop8:
          C=DAT0  1                              * 9D37D
          D0=D0+  1                              * 9D381
          CSL     B                              * 9D384
          A=A-1   B                              * 9D387
          GOC     ~PCunpack.loop5                * 9D38A
~PCunpack.L9:
          C=DAT0  1                              * 9D38D
          D0=D0+  1                              * 9D391
          DAT1=C  B                              * 9D394
          D1=D1+  2                              * 9D397
          A=A-1   B                              * 9D39A
          GONC    ~PCunpack.loop8                * 9D39D
          GOTO    ~PCunpack.loop1                * 9D3A0
        ENDCODE                                  * 9D3A4

* ROMPTR 0E3 064
* refs (1): 99FF5
* Display routine: redraws the menu when needed
PicMenu:
        :: DA3OK? ?SKIP                          * 9D3A4
          :: DispMenu SetDA3Valid ;              * 9D3B3
        ;                                        * 9D3C7

* ROMPTR 0E3 065
* refs (1): 99FF5
* Sets the done flag PC1
PicDone:
        :: TRUE XLIB PicSto1 ;                   * 9D3CC

* ROMPTR 0E3 066
* refs (1): 99FF5
* Hard keys of the picture viewer, by plane
PicKeys:
        :: BINT1 #=casedrop XLIB PicKey          * 9D3E6
          BINT3 #=casedrop XLIB PicShiftKey      * 9D400
          2DROP 'DoBadKeyT ;                     * 9D415

* ROMPTR 0E3 067
* refs (1): 99FF5
* Unshifted keys: ENTER and ON
PicKey:
        :: BINT25 ?CaseRomptr@ XLIB PicEnter BINT45 ?CaseRomptr@ * 9D424
          XLIB PicCancel BINT40 #=casedrop FALSE * 9D448
          BINT7 #<case FALSE                     * 9D462
          'DoBadKeyT ;                           * 9D471

* ROMPTR 0E3 068
* refs (1): 99FF5
* Right-shifted keys: passes key 40 and ON through
PicShiftKey:
        :: BINT40 #=casedrpfls BINT45            * 9D47B
          #=casedrpfls DROP                      * 9D48F
          'DoBadKeyT ;                           * 9D499

* ROMPTR 0E3 069
* refs (1): 99FF5
* ENTER: runs the first action of the keys list
PicEnter:
        :: TakeOver XLIB PicLam2 CARCOMP COLA_EVAL ; * 9D4A3

* ROMPTR 0E3 06A
* refs (1): 99FF5
* ON: runs the second action of the keys list
PicCancel:
        :: TakeOver XLIB PicLam2 BINT2 NTHCOMPDROP COLA_EVAL ; * 9D4C7

* ROMPTR 0E3 06B
* refs (1): 99FF5
* Menu key →PICT: copies the display to PICT
Pic->PICT:
        :: KILLGDISP # 40 # 83 MAKEGROB GROB>GDISP HARDBUFF TOTEMPOB GBUFF * 9D4F0
          ZEROZERO GROB! ;                       * 9D527

* ROMPTR 0E3 06C
* refs (1): 99FF5
* %subject %title %showpic -> : SOLVEQN: picks the set, makes the variables, copies its picture to PICT unless the last argument is 0, and starts the solver. Bad Argument on numbers out of range
SOLVEQN~1:
        :: 3UNROLL COERCESWAP COERCE XLIB EqSubjects SWAP NTHELCOMP NOTcase * 9D536
          XLIB BadValueErr                       * 9D564
          EVAL INCOMPDROP 4PICK NTHELCOMP NOTcase XLIB BadValueErr * 9D56F
          SWAPDROP DUP 4UNROLL 4UNROLL EVAL GETATELN DROP 4UNROLL ROT %0= * 9D593
          ITE DROP                               * 9D5C5
          :: KILLGDISP # 40 # 83 MAKEGROB GROB>GDISP BINT3 NTHCOMPDROP EVAL * 9D5CF
            DUP XLIB EqNoPic EQITE               * 9D606
            :: # E304 JstGetTHEMESG $>GROB GBUFF BINT0 BINT36 GROB! DROP * 9D61B  "No Picture Available"
              OVER PTR CHR_: >T$ $>GROB GBUFF BINT0 BINT21 ; * 9D64D
            :: DUPLENCOMP DUP #3= ITE_DROP       * 9D675
              :: NTHCOMPDROP EVAL ; INCOMPDROP XLIB ~PCunpack GBUFF 2SWAP ; * 9D68E
            GROB! ;                              * 9D6C1
          XLIB ELRunSolver COLA_EVAL ;           * 9D6CB

* ROMPTR 0E3 06D
* refs (1): 99FF5
* Message table of library 0E3
ELMessages:
        CON(5)  DOARRY                           * 9D6E0  array 4
        LENGTH                                   * 9D6E5  length, to #9D77B
        CON(5)  DOCSTR                           * 9D6EA  element type
        CON(5)  1                                * 9D6EF  dimensions
        CON(5)  4                                * 9D6F4
        $BODY   "Starting Solver"                * 9D6F9  1
        $BODY   " OF "                           * 9D71C  2
        $BODY   "Keyword Conflict"               * 9D729  3
        $BODY   "No Picture Available"           * 9D74E  4
        ENDLENGTH                                * 9D77B

LIB0E3.hash:
        CON(5)  DOHSTR                           * 9D77B  hash table of library 0E3
        LENGTH                                   * 9D780  length, to #9D7DF
        CON(5)  0                                * 9D785  names of length 1
        CON(5)  0                                * 9D78A  names of length 2
        CON(5)  0                                * 9D78F  names of length 3
        CON(5)  0                                * 9D794  names of length 4
        CON(5)  0                                * 9D799  names of length 5
        CON(5)  0                                * 9D79E  names of length 6
        CON(5)  0                                * 9D7A3  names of length 7
        CON(5)  0                                * 9D7A8  names of length 8
        CON(5)  0                                * 9D7AD  names of length 9
        CON(5)  0                                * 9D7B2  names of length 10
        CON(5)  0                                * 9D7B7  names of length 11
        CON(5)  0                                * 9D7BC  names of length 12
        CON(5)  0                                * 9D7C1  names of length 13
        CON(5)  0                                * 9D7C6  names of length 14
        CON(5)  0                                * 9D7CB  names of length 15
        CON(5)  0                                * 9D7D0  names of length 16
        REL(5)  LIB0E3.hash.L1                   * 9D7D5  end of the names
LIB0E3.hash.L1:
        CON(5)  0                                * 9D7DA  command 000 has no name
        ENDLENGTH                                * 9D7DF

LIB0E3.link:
        CON(5)  DOHSTR                           * 9D7DF  link table of library 0E3
        LENGTH                                   * 9D7E4  length, to #9DA0F
        REL(5)  ELSto1                           * 9D7E9  000 
        REL(5)  ELSto2                           * 9D7EE  001 
        REL(5)  ELSto3                           * 9D7F3  002 
        REL(5)  ELSto4                           * 9D7F8  003 
        REL(5)  ELSto5                           * 9D7FD  004 
        REL(5)  ELSto6                           * 9D802  005 
        REL(5)  ELSto7                           * 9D807  006 
        REL(5)  ELSto8                           * 9D80C  007 
        REL(5)  ELSto9                           * 9D811  008 
        REL(5)  ELSto10                          * 9D816  009 
        REL(5)  ELSto11                          * 9D81B  00A 
        REL(5)  ELSto12                          * 9D820  00B 
        REL(5)  EQNLIB~1                         * 9D825  00C 
        REL(5)  ELLam1                           * 9D82A  00D 
        REL(5)  ELLam2                           * 9D82F  00E 
        REL(5)  ELLam3                           * 9D834  00F 
        REL(5)  ELLam4                           * 9D839  010 
        REL(5)  ELLam5                           * 9D83E  011 
        REL(5)  ELLam6                           * 9D843  012 
        REL(5)  ELLam7                           * 9D848  013 
        REL(5)  ELLam8                           * 9D84D  014 
        REL(5)  ELLam9                           * 9D852  015 
        REL(5)  ELLam10                          * 9D857  016 
        REL(5)  ELLam11                          * 9D85C  017 
        REL(5)  ELLam12                          * 9D861  018 
        REL(5)  ELSubjects                       * 9D866  019 
        REL(5)  ELListItem                       * 9D86B  01A 
        REL(5)  ELVarItem                        * 9D870  01B 
        REL(5)  ELVarName                        * 9D875  01C 
        REL(5)  ELSubjMenu                       * 9D87A  01D 
        REL(5)  ELSubjKeys                       * 9D87F  01E 
        REL(5)  ELQuit                           * 9D884  01F 
        REL(5)  ELOpenSubj                       * 9D889  020 
        REL(5)  ELTitles                         * 9D88E  021 
        REL(5)  ELTitleMenu                      * 9D893  022 
        REL(5)  ELTitleKeys                      * 9D898  023 
        REL(5)  ELOpenTitle                      * 9D89D  024 
        REL(5)  ELTitle->STK                     * 9D8A2  025 
        REL(5)  ELTitleSolve                     * 9D8A7  026 
        REL(5)  ELSetEqs                         * 9D8AC  027 
        REL(5)  ELParse                          * 9D8B1  028 
        REL(5)  ELTextScreen                     * 9D8B6  029 
        REL(5)  ELSymbScreen                     * 9D8BB  02A 
        REL(5)  ELEqSetup                        * 9D8C0  02B 
        REL(5)  ELVarsScreen                     * 9D8C5  02C 
        REL(5)  ELPicScreen                      * 9D8CA  02D 
        REL(5)  ELEqMenu                         * 9D8CF  02E 
        REL(5)  ELTextMenu                       * 9D8D4  02F 
        REL(5)  ELEq->STK                        * 9D8D9  030 
        REL(5)  ELNextEq                         * 9D8DE  031 
        REL(5)  ELPrevEq                         * 9D8E3  032 
        REL(5)  ELTextKeys                       * 9D8E8  033 
        REL(5)  ELEqKeys                         * 9D8ED  034 
        REL(5)  ELVarsMenu                       * 9D8F2  035 
        REL(5)  ELVarsKeys                       * 9D8F7  036 
        REL(5)  ELVarsToEq                       * 9D8FC  037 
        REL(5)  ELVarsAgain                      * 9D901  038 
        REL(5)  ELVarsToPic                      * 9D906  039 
        REL(5)  ELPicMenu                        * 9D90B  03A 
        REL(5)  ELPicKeys                        * 9D910  03B 
        REL(5)  ELExitEq                         * 9D915  03C 
        REL(5)  ELSolve                          * 9D91A  03D 
        REL(5)  ELToEq                           * 9D91F  03E 
        REL(5)  ELToVars                         * 9D924  03F 
        REL(5)  ELBrowseVars                     * 9D929  040 
        REL(5)  ELToPic                          * 9D92E  041 
        REL(5)  EL->VARS                         * 9D933  042 
        REL(5)  ELPrepVars                       * 9D938  043 
        REL(5)  ELPurgeVars                      * 9D93D  044 
        REL(5)  ELStartSolver                    * 9D942  045 
        REL(5)  ELRunSolver                      * 9D947  046 
        REL(5)  ELLeaveBrowser                   * 9D94C  047 
        REL(5)  ELDone                           * 9D951  048 
        REL(5)  ELBrowse                         * 9D956  049 
        REL(5)  ELBrowseWith                     * 9D95B  04A 
        REL(5)  ELExpand                         * 9D960  04B 
        REL(5)  ViewSto1                         * 9D965  04C 
        REL(5)  ViewSto2                         * 9D96A  04D 
        REL(5)  ViewBegin                        * 9D96F  04E 
        REL(5)  ViewLam2                         * 9D974  04F 
        REL(5)  ViewLam1                         * 9D979  050 
        REL(5)  ViewSymb                         * 9D97E  051 
        REL(5)  ViewText                         * 9D983  052 
        REL(5)  ViewTitle                        * 9D988  053 
        REL(5)  ViewMenu                         * 9D98D  054 
        REL(5)  ViewDone                         * 9D992  055 
        REL(5)  ViewKeysSymb                     * 9D997  056 
        REL(5)  ViewKeysText                     * 9D99C  057 
        REL(5)  ViewTextKey                      * 9D9A1  058 
        REL(5)  ViewSymbKey                      * 9D9A6  059 
        REL(5)  ViewShiftKey                     * 9D9AB  05A 
        REL(5)  ViewEnter                        * 9D9B0  05B 
        REL(5)  ViewCancel                       * 9D9B5  05C 
        REL(5)  ViewPrev                         * 9D9BA  05D 
        REL(5)  PicSto1                          * 9D9BF  05E 
        REL(5)  PicSto2                          * 9D9C4  05F 
        REL(5)  ELShowPic                        * 9D9C9  060 
        REL(5)  PicLam2                          * 9D9CE  061 
        REL(5)  PicLam1                          * 9D9D3  062 
        REL(5)  ~PCunpack                        * 9D9D8  063 ~PCunpack
        REL(5)  PicMenu                          * 9D9DD  064 
        REL(5)  PicDone                          * 9D9E2  065 
        REL(5)  PicKeys                          * 9D9E7  066 
        REL(5)  PicKey                           * 9D9EC  067 
        REL(5)  PicShiftKey                      * 9D9F1  068 
        REL(5)  PicEnter                         * 9D9F6  069 
        REL(5)  PicCancel                        * 9D9FB  06A 
        REL(5)  Pic->PICT                        * 9DA00  06B 
        REL(5)  SOLVEQN~1                        * 9DA05  06C 
        REL(5)  ELMessages                       * 9DA0A  06D 
        ENDLENGTH                                * 9DA0F
        BSS     4                                * 9DA0F  zeros
