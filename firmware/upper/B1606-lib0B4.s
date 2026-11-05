* HP 48GX ROM revision R, #B1606-#B4B31: Library 0B4: end of Transfer, Calculator Modes, the system flag browser, the Memory variable browser, and the library's hash and link tables
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: FlagBrowseGrob SolveVarMH SolveDiffStore PlotKeyAngle ModesVals ModesStore ModesStd? ModesMenu ModesMH ModesKey ModesFmtMH ModesFmtDisp
* Follows on from the previous file (at #B1606 in the original ROM).
        RPL

* ROMPTR 0B4 1BC
* refs (1): A2437
* #msg -> ... flag: its Name field: 40 the directories, 43 editor keys
IOXferCDMH:
        ::                                       * B1606
          { BINT40                               * B160B
            :: LAM 'RF XLIB SrvDirs DUPNULLCOMP? ITE BINT0 BINT1 * B1615
            ;                                    * B1646
            BINT43                               * B164B
            :: XLIB IOXferCDKeys TRUE ; }        * B1650
          EQLookup case                          * B166F
          :: EVAL TRUE ;                         * B1679
          DROPFALSE ;                            * B168D

* ROMPTR 0B4 1BD
* refs (1): A2437
* Editor keys with a backslash
IOXferCDKeys:
        { $ "\\" NullMenuKey NullMenuKey NullMenuKey } * B1697

* ROMPTR 0B4 1BE
* refs (1): A2437
* #msg -> ... flag: a field used with Kermit on the wire only
IOXferParityMH:
        :: BINT7 #=casedrop                      * B16BC
          :: XLIB IOPortIR? XLIB IOXferKermit? NOT OR ; * B16CB
          BINT55 #<>case FALSE                   * B16F5
          XLIB IOPortIR? NOT XLIB IOXferKermit? AND TRUE ; * B1704

* ROMPTR 0B4 1BF
* refs (1): A2437
* #msg -> ... flag: a field used with Kermit only
IOXferKermitMH:
        :: BINT7 #=casedrop                      * B172E
          :: XLIB IOXferKermit? NOT ;            * B173D
          BINT55 #<>case FALSE                   * B1757
          XLIB IOXferKermit? TRUE ;              * B1766

* ROMPTR 0B4 1C0
* refs (1): A2437
* -> flag: is Type on Kermit?
IOXferKermit?:
        :: BINT2 XLIB ~gFldVal XLIB ~BINT2;NTHCOMPROM@ ; * B177B

* ROMPTR 0B4 1C1
* refs (1): A2437
* -> : the MODES key: "Calculator Modes": number format, angle measure, coordinate system, beep, clock and fraction mark
ModesApp:
        :: XLIB IFNotInForm # B917 BINT1 BINT10 # B918 BINT1 BINT19 # B919 * B17A0  "Number Format:"  "Angle Measure:"  "Coord System:"
          BINT1 BINT28 # B91A BINT8 BINT37 # B91B BINT50 BINT37 # B91C # 5C * B17E2  "Beep"  "Clock"  "FM,"
          BINT37 'RROMPTR@ XLIB ModesFmtMH BINT61 BINT8 BINT19 BINT9 BINT12 * B1828
          MINUSONE BINT33 # B91D XLIB ModeFmtItems BINT17 XLIB ModeItemStd * B1856  "Choose number display format"
          MINUSONE 'RROMPTR@ XLIB ModesDigitsMH BINT85 BINT8 BINT13 BINT9 * B1885
          BINT13                                 * B18AE
          { BINT0 } BINT4 # B91E XLIB ModeDigitItems BINT4 %0_2A2B4 MINUSONE * B18B3  "Enter decimal places to display"
          'RROMPTR@ XLIB ModesFieldMH BINT61 BINT17 BINT43 BINT9 BINT12 * B18EB
          MINUSONE BINT17 # B91F XLIB ModeAngleItems BINT17 XLIB ModeItemDeg * B1914  "Choose angle measure"
          MINUSONE 'RROMPTR@ XLIB ModesFieldMH BINT61 BINT26 BINT67 BINT9 * B1943
          BINT12 MINUSONE BINT17 # B920 XLIB ModeCoordItems BINT17 * B196C  "Choose coordinate system"
          XLIB ModeItemRect MINUSONE 'RROMPTR@ XLIB ModesFieldMH BINT1 * B1995
          BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE # B921 MINUSONE * B19BA  "Enable standard beep?"
          MINUSONE TRUE MINUSONE 'RROMPTR@ XLIB ModesFieldMH BINT43 BINT35 * B19E7
          BINT6 BINT9 BINT32 MINUSONE MINUSONE # B922 MINUSONE MINUSONE * B1A10  "Display ticking clock?"
          FALSE MINUSONE 'RROMPTR@ XLIB ModesFieldMH BINT85 BINT35 BINT6 * B1A3D
          BINT9 BINT32 MINUSONE MINUSONE # B923 MINUSONE MINUSONE FALSE * B1A66  "Use comma as fraction mark?"
          MINUSONE BINT6 BINT7 'RROMPTR@ XLIB ModesMH # B916 XLIB ModesVals * B1A93  "Calculator Modes"
          BINT7 XLIB IFSetHelps DoInputForm NOT?SEMI * B1AC7
          XLIB ModesStore ;                      * B1AE1

* ROMPTR 0B4 1C2
* refs (1): A2437
* -> field values: from the flags
ModesVals:
        :: XLIB ModeNumFmt XLIB ModeAngle XLIB ModeCoord XLIB ModeBeep? * B1AF1
          XLIB ModeClock? XLIB ModeFM,? ;        * B1B22

* ROMPTR 0B4 1C3
* refs (1): A2437
* field values -> : sets the flags
ModesStore:
        :: XLIB ModeFM,! XLIB ModeClock! XLIB ModeBeep! XLIB NTHEval2 * B1B3D
          XLIB NTHEval3 COERCE SWAP XLIB NTHEval3 ; * B1B6E

* ROMPTR 0B4 1C4
* refs (1): A2437
* #msg -> ... flag: form message handler: 16 the menu
ModesMH:
        :: BINT16 #<>case FALSE                  * B1B93
          XLIB ModesMenu TrueTrue ;              * B1BA7

* ROMPTR 0B4 1C5
* refs (1): A2437
* Menu keys: FLAG, CANCL and OK
ModesMenu:
        {                                        * B1BBC
          {                                      * B1BC1
            :: PTR DirLabel: $ "FLAG" ; XLIB ModesFlagKey } * B1BC6
          { $ "(AN(L" XLIB DoKeyCancel }         * B1BF7
          { $ "OK" XLIB DoKeyOK } }              * B1C20

* ROMPTR 0B4 1C6
* refs (1): A2437
* -> : FLAG key: stores the fields, runs the flag browser and reads the fields again
ModesFlagKey:
        :: TakeOver XLIB GetFieldVals XLIB ModesStore XLIB FlagBrowse * B1C48
          NOTcase SetDA123NoCh                   * B1C73
          XLIB ModesVals XLIB SetFieldVals       * B1C7D
          :: SetDA1NoCh SetDA2bNoCh SetDA3NoCh ; ; * B1C93

* ROMPTR 0B4 1C7
* refs (1): A2437
* #msg -> ... flag: Number Format field: 47 shows or hides the digits
ModesFmtMH:
        :: BINT47 OVER #<>case XLIB ModesFieldMH * B1CB1
          DROP XLIB ModesFmtDisp TRUE ;          * B1CD0

* ROMPTR 0B4 1C8
* refs (1): A2437
* -> : blanks the digits field or redraws it
ModesFmtDisp:
        :: XLIB ModesStd? case                   * B1CEA
          :: HARDBUFF BINT85 BINT8 BINT97 BINT17 GROB!ZERO DROP ; * B1CFF
          HARDBUFF BINT2 XLIB IFDispLabel DROP BINT2 XLIB IFMarkPending ; * B1D2C

* ROMPTR 0B4 1C9
* refs (1): A2437
* #msg -> ... flag: digits field: hidden in Standard format
ModesDigitsMH:
        :: BINT7 #=casedrop XLIB ModesStd?       * B1D5B
          BINT55 OVER #<>case XLIB ModesFieldMH  * B1D75
          DROP XLIB ModesStd? NOT TRUE ;         * B1D8F

* ROMPTR 0B4 1CA
* refs (1): A2437
* #msg -> ... flag: default for the form's fields: 8 keys
ModesFieldMH:
        :: BINT8 #<>case FALSE                   * B1DAE
          XLIB ModesKey ;                        * B1DC2

* ROMPTR 0B4 1CB
* refs (1): A2437
* #key #plane -> ...: keys in the form: RAD and POLAR change the angle measure and the coordinate system, as they do outside it
ModesKey:
        :: EditExstCase FALSE 2DUP Key>U/SKeyOb  * B1DD2
          { KeyLS_MTH                            * B1DEB
            :: TakeOver BINT3 XLIB ModesCycleAngle ; KeyRS_MTH * B1DF5
            :: TakeOver BINT4 XLIB ModesCycleCoord ; } * B1E19
          ' EQUAL SWAP Lookup NOTcase DROPFALSE  * B1E3D
          ROTROT2DROP TrueTrue ;                 * B1E5B

* ROMPTR 0B4 1CC
* refs (1): A2437
* #field -> : RAD key: Radians, or back from Radians to Degrees or Grads as flag -18 says
ModesCycleAngle:
        :: DUP XLIB ~gFldVal ?ROMPTR@ ' XLIB ModeItemRad ?ROMPTR@ EQUAL ITE * B1E6A
          :: BINT18 SysITE                       * B1EA3  flag -18: angle mode
            :: ' XLIB ModeItemGrad ;             * B1EB2
            :: ' XLIB ModeItemDeg ; ;            * B1ECC
          :: ' XLIB ModeItemRad ;                * B1EEB
          OVER XLIB ~sFldVal XLIB IFMarkPending SetDA123NoCh ; * B1F05

* ROMPTR 0B4 1CD
* refs (1): A2437
* #field -> : POLAR key: Rectangular, or back from it to Polar or Spherical as flag -15 says
ModesCycleCoord:
        :: DUP XLIB ~gFldVal ?ROMPTR@ ' XLIB ModeItemRect ?ROMPTR@ EQUAL ITE * B1F2A
          :: BINT15 SysITE                       * B1F63  flag -15: coordinate system
            :: ' XLIB ModeItemSph ;              * B1F72
            :: ' XLIB ModeItemCyl ; ;            * B1F8C
          :: ' XLIB ModeItemRect ;               * B1FAB
          OVER XLIB ~sFldVal XLIB IFMarkPending SetDA123NoCh ; * B1FC5

* ROMPTR 0B4 1CE
* refs (1): A2437
* -> flag: is the number format Standard?
ModesStd?:
        :: BINT1 XLIB ~gFldVal ?ROMPTR@ XLIB ModeItemStd ?ROMPTR@ EQUAL ; * B1FEA

* ROMPTR 0B4 1CF
* refs (1): A2437
* -> flag: "System Flags": a Choose box of the flags, and sets the changed ones on OK. LAM F holds the flags changed so far: pairs of number and value. FALSE if cancelled or nothing changed
FlagBrowse:
        :: TakeOver NULL{}                       * B201E
          { LAM 'F } BIND 'RROMPTR@ XLIB FlagBrowseMH # B935 'RROMPTR@ * B202D  "System Flags"
          XLIB FlagBrwText NULL{} BINT1 XLIB ~Choose NOTcase * B2066
          :: ABND FALSE ;                        * B208B
          DROP LAM 'F ABND DUPLENCOMP #0= casedrop FALSE * B209F
          INNERCOMP #2/ ZERO_DO ISTOP-INDEX #2* ROLL ISTOP-INDEX #2* ROLL * B20C8
          ITE SetSysFlag ClrSysFlag              * B20F5
          LOOP TRUE ;                            * B2104

* ROMPTR 0B4 1D0
* refs (1): A2437
* #msg -> ... flag: Choose message handler: full screen, element count and access, how each line looks, the menu
FlagBrowseMH:
        ::                                       * B2113
          { BINT60 TRUE BINT62 XLIB FlagBrwCount BINT80 XLIB FlagBrw# BINT81 * B2118
            XLIB FlagBrowseGrob BINT83           * B214C
            :: ' XLIB FlagBrowseMenu ; }         * B215C
          EQLookup case                          * B217B
          :: EVAL TRUE ;                         * B2185
          DROPFALSE ;                            * B2199

* ROMPTR 0B4 1D2
* refs (2): A2437 A2437
* # -> grob: draws one flag line: mark, number and text. Commands 1D1 and 1D2 are this object
FlagBrowseGrob:
        :: XLIB FlagBrw# DUP XLIB FlagState SWAP KEYINBUFFER? ITE * B21A3
          :: DROPNULL$ _chr(31)_ SetDA2bBad ;    * B21D2
          :: XLIB FlagBrwText DUP BINT1 BINT2 SUB$ SWAP BINT4 OVERLEN$ SUB$ ; * B21EB
          $>GROB SWAP $>grob 7GETLAM 8GETLAM MAKEGROB 4ROLL IT * B2228
          :: XLIB IFCheckGrob1 OVER ZEROZERO GROB! ; * B2250
          DUPUNROT BINT7 BINT2 GROB! DUPUNROT BINT20 BINT1 GROB! ; * B2274

* ROMPTR 0B4 1D3
* refs (1): A2437
* -> menu: check, CANCL and OK
FlagBrowseMenu:
        :: NoExitAction                          * B22A1
          { NullMenuKey NullMenuKey              * B22AB
            {                                    * B22BA
              :: TakeOver XLIB ~grobCheckKey ; XLIB FlagBrowseChk } * B22BF
            NullMenuKey                          * B22E9
            { $ "(AN(L" XLIB DoCKeyCancel }      * B22EE
            { $ "OK" XLIB DoCKeyOK } }           * B2317
        ;                                        * B233F

* ROMPTR 0B4 1D4
* refs (1): A2437
* -> : check key: toggles the highlighted flag and redraws its line
FlagBrowseChk:
        :: TakeOver 18GETLAM XLIB ~BBGetN DUP XLIB FlagState NOT SWAP * B2344
          XLIB FlagChange 18GETLAM 6GETLAM XLIB LEDispItem SetDA123NoCh ; * B2378

* ROMPTR 0B4 1D5
* refs (1): A2437
* #flag -> flag: state of a flag, as changed in LAM F if it is, otherwise as set
FlagState:
        :: LAM 'F #=Lookup ?SEMI                 * B23A2
          TestSysFlag ;                          * B23BC

* ROMPTR 0B4 1D6
* refs (1): A2437
* flag #flag -> : records a new state in LAM F
FlagChange:
        :: LAM 'F OVER ' #= POSCOMP DUP#0= casedrop * B23C6
          :: SWAP TWO{}N LAM 'F SWAP &COMP ' LAM 'F STO ; * B23F4
          SWAPDROP #1+ LAM 'F PUTLIST ' LAM 'F STO ; * B2432

* ROMPTR 0B4 1D7
* refs (1): A2437
* -> : the MEMORY key: the variable browser, full screen with its full menu
MemApp:
        :: XLIB IFNotInForm TRUE # B982 TRUE MINUSONE TRUE XLIB BrowseMem * B2466  "Objects in"
          caseDROP ;                             * B249F

* ROMPTR 0B4 1D8
* refs (1): A2437
* flag-full $title flag-checks flag-recall {types} (the last two swapped on the stack) -> ob TRUE or FALSE: browses the variables of the given types (-1 = all) in a Choose box, for the MEMORY key and for an input form's CHOOS. LAMs: V full screen, P title, p check marks, R return contents rather than names, O types, B and E first and last of the elements cached in the Choose list
BrowseMem:
        :: SWAP DUPTYPELIST? ?SKIP ONE{}N        * B24A9
          ZEROZERO                               * B24C2
          { LAM 'V LAM 'P LAM 'p LAM 'R LAM 'O LAM 'B LAM 'E } BIND * B24C7
          'RROMPTR@ XLIB BrowseMH SPACE$ 'RROMPTR@ XLIB VarBrwLine NULL{} * B2523
          BINT1 XLIB ~Choose NOTcase             * B254D
          :: ABND FALSE ;                        * B2562
          LAM 'R ABND NOTcase                    * B2576
          :: DUPTYPELIST? NOTcaseTRUE DUPLENCOMP * B258B
            #1<> caseTRUE INCOMPDROP             * B259F
            TRUE ;                               * B25AE
          DUPTYPELIST? ?SKIP ONE{}N              * B25B8
          INNERCOMP DUP 1LAMBIND ZERO_DO ISTOP@ ROLL XEQRCL LOOP 1GETABND * B25C7
          DUP#1= ITE DROP {}N                    * B25F4
          TRUE ;                                 * B2608

* ROMPTR 0B4 1D9
* refs (1): A2437
* #msg -> ... flag: Choose message handler: element access, title, element count, full screen, check marks, menu, page size
BrowseMH:
        ::                                       * B2612
          { BINT80 XLIB BrowseGetN BINT70 XLIB BrowseTitle BINT62 * B2617
            :: LAM 'O XLIB VarBrwCount ; BINT60 LAM 'V BINT61 LAM 'p BINT83 * B2641
            :: 14GETLAM ITE                      * B2686
              :: ' XLIB BrowseMenuFull ;         * B2695
              :: ' XLIB BrowseMenuChoose ;       * B26AF
            ;                                    * B26C9
            BINT57                               * B26CE
            :: 14GETLAM ITE BINT6 BINT5          * B26D3
              #1- ;                              * B26EC
          }                                      * B26F6
          EQLookup case                          * B26FB
          :: EVAL TRUE ;                         * B2705
          DROPFALSE ;                            * B2719

* ROMPTR 0B4 1DA
* refs (1): A2437
* -> $: title: the current path, shortened to fit
BrowseTitle:
        :: LAM 'P ~DUPTYPEBINT?;case;JstGetTHEMESG PATHDIR * B2723
          XLIB Decomp1Std 8GETLAM XLIB BBAddArrows 3PICK * B273D
          XLIB ~$>grob;GROBDIMw #- BINT12 #- 14GETLAM ITE BINT8 BINT0 * B275D
          #- XLIB $FitRight ITE SPACE$ $ " { "   * B278B
          SWAP&$ &$ ;                            * B27B5

* ROMPTR 0B4 1DB
* refs (1): A2437
* #first #last ::filter -> elements: walks the current directory and collects the variables first to last that pass the filter
BrowseGetVars:
        :: 2SWAP SWAP ZEROZERO 6UNROLL 3UNROLL BINT6 CONTEXT@ LastNonNull * B27C4
          NOTcase                                * B27F1
          :: 7DROP BINT0 ;                       * B27F6
          BEGIN                                  * B280A
          :: ?ATTNQUIT DUPUNROT RAM-WORDNAME 5PICK EVAL ITE * B280F
            :: 6ROLL #1+ 6UNROLL 6PICK BINT9 PICK #< caseDROP 6PICK * B2832
              8PICK #> NOTcase psh1&rev          * B2864
              2DROP RDROP FALSE ;                * B2878
            DROP                                 * B288C
            SWAP PrevNonNull ;                   * B2891
          NOT_UNTIL 6DROP ;                      * B28A0

* ROMPTR 0B4 1DC
* refs (1): A2437
* -> menu: for an input form: CHOOS, check, NEW, CANCL and OK
BrowseMenuChoose:
        :: NoExitAction                          * B28AF
          { NullMenuKey                          * B28B9
            { $ "CHOOS" XLIB BrowseCDKey }       * B28C3
            {                                    * B28EC
              :: TakeOver XLIB ~BBEmpty? 16GETLAM NOT OR ITE NULL$ * B28F1
                XLIB ~grobCheckKey               * B291F
              ;                                  * B292A
              { XLIB DoCKeyCheck XLIB DoCKeyChAll XLIB DoCKeyUnChAll } } * B292F
            {                                    * B295F
              :: PTR DirLabel: $ "NEW" ; XLIB BrowseNewKey } * B2964
            { $ "(AN(L" XLIB DoCKeyCancel }      * B2993
            { $ "OK" XLIB DoCKeyOK } }           * B29BC
        ;                                        * B29E4

* ROMPTR 0B4 1DD
* refs (1): A2437
* -> menu: for the MEMORY key: EDIT, CHOOS, check, NEW, COPY, MOVE, RCL, PURG, SIZE, CANCL and OK
BrowseMenuFull:
        :: NoExitAction                          * B29E9
          {                                      * B29F3
            {                                    * B29F8
              :: TakeOver XLIB ~BBEmpty? ITE NULL$ * B29FD
                :: PTR DirLabel: $ "EDIT" ;      * B2A1C
              ;                                  * B2A3D
              XLIB BrowseEditKey }               * B2A42
            { $ "CHOOS" XLIB BrowseCDKey }       * B2A52
            {                                    * B2A7B
              :: TakeOver XLIB ~BBEmpty? 16GETLAM NOT OR ITE NULL$ * B2A80
                XLIB ~grobCheckKey               * B2AAE
              ;                                  * B2AB9
              { XLIB DoCKeyCheck XLIB DoCKeyChAll XLIB DoCKeyUnChAll } } * B2ABE
            {                                    * B2AEE
              :: PTR DirLabel: $ "NEW" ; XLIB BrowseNewKey } * B2AF3
            {                                    * B2B22
              :: TakeOver XLIB ~BBEmpty? ITE NULL$ * B2B27
                :: PTR DirLabel: $ "COPY" ;      * B2B46
              ;                                  * B2B67
              XLIB BrowseCopyKey }               * B2B6C
            {                                    * B2B7C
              :: TakeOver XLIB ~BBEmpty? ITE NULL$ * B2B81
                :: PTR DirLabel: $ "MOVE" ;      * B2BA0
              ;                                  * B2BC1
              XLIB BrowseMoveKey }               * B2BC6
            {                                    * B2BD6
              :: TakeOver XLIB ~BBEmpty? ITE NULL$ $ "RCL" * B2BDB
              ;                                  * B2C0A
              XLIB BrowseRclKey }                * B2C0F
            {                                    * B2C1F
              :: TakeOver XLIB ~BBEmpty? ITE NULL$ $ "PURG" * B2C24
              ;                                  * B2C55
              XLIB BrowsePurgeKey }              * B2C5A
            { $ "SIZE" XLIB BrowseSizeKey } NullMenuKey * B2C6A
            { $ "(AN(L" XLIB DoCKeyCancel }      * B2C96
            { $ "OK" XLIB DoCKeyOK } }           * B2CBF
        ;                                        * B2CE7

* ROMPTR 0B4 1DE
* refs (1): A2437
* -> : EDIT key: runs BrowseEditForm on the highlighted variable
BrowseEditKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * B2CEC
          18GETLAM XLIB ~BBGetN XLIB BrowseEditForm DROP ; * B2D0B

* ROMPTR 0B4 1DF
* refs (1): A2437
* id -> flag: "Edit Variable": stores the new object
BrowseEditForm:
        :: 1LAMBIND # B984 BINT1 BINT19 'DROPFALSE BINT31 BINT17 BINT97 * B2D30  "Object:"
          BINT9 BINT21 MINUSONE BINT4 # B985 # B986 MINUSONE 1GETLAM XEQRCL * B2D62  "Enter new object"  "Obs in"
          DUP ONEONE 'DROPFALSE # B983 DoInputForm NOTcase * B2D99  "Edit Variable"
          :: ABND FALSE ;                        * B2DBC
          1GETABND XLIB VarStoFld TRUE ;         * B2DD0

* ROMPTR 0B4 1E0
* refs (1): A2437
* -> : CHOOS key: changes to the directory chosen with BrowseCDChoose
BrowseCDKey:
        :: TakeOver XLIB BrowseCDChoose NOT?SEMI * B2DEA
          COMPEVAL 0LASTOWDOB! ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM * B2E04
          XLIB ~BBReReadNElems XLIB ~BBReReadWidth BINT1 12GETLAM #MIN * B2E3D
          18PUTLAM FALSE XLIB ~BBRecalOff&Disp NULL{} 15PUTLAM IFRedrawAll ; * B2E62

* ROMPTR 0B4 1E1
* refs (1): A2437
* -> {path} TRUE or FALSE: a Choose box of the directory tree. LAMs: TD current element, TN its number, DC count
BrowseCDChoose:
        :: 'RROMPTR@ XLIB BrowseCDMH # B987 'RROMPTR@ XLIB DirBrwLine NULL{} * B2E8B  "Directories:"
          XLIB DirBrwPos OVER 4UNROLL            * B2EBF
          { LAM 'TD LAM 'TN LAM 'DC } BIND XLIB ~Choose ABND SetDA123NoCh * B2ED4
          NOTcaseFALSE NULL{}                    * B2F1F
          SWAP                                   * B2F29
          :: GOTO BrowseCDChoose~1 ; TRUE ;      * B2F2E

* ROMPTR 0B4 1E2
* refs (1): A2437
* #msg -> ... flag: Choose message handler of the tree
BrowseCDMH:
        ::                                       * B2F4C
          { BINT80 XLIB BrowseCDElem BINT62 LAM 'DC } EQLookup case * B2F51
          :: EVAL TRUE ;                         * B2F87
          DROPFALSE ;                            * B2F9B

* ROMPTR 0B4 1E3
* refs (1): A2437
* # -> ob: element #, walking the tree from the last element asked for
BrowseCDElem:
        :: LAM 'TN #=casedrop                    * B2FA5
          :: ' LAM 'TD undo DROP ;               * B2FBC
          DUP#1= case                            * B2FE2
          :: ' LAM 'TN STOLAM BINT0 XLIB DirBrwNext DUP ' LAM 'TD STOLAM ; * B2FEC
          ' LAM 'TD undo DROP SWAP LAM 'TN OVER ' LAM 'TN STOLAM 2DUP #> ITE * B3039
          :: #- XLIB DirBrwPrev ;                * B3092
          :: SWAP#- XLIB DirBrwNext ;            * B30AC
          DUP ' LAM 'TD STOLAM ;                 * B30C6

* ROMPTR 0B4 1E4
* refs (1): A2437
* # -> ob: element # of the variable list, reading the next page into the cache if it is outside LAM B to E
BrowseGetN:
        :: DUP LAM 'B #< OVER LAM 'E #> OR IT    * B30E7
          :: DUPDUP 11GETLAM #+ #1- 12GETLAM #MIN 2DUP ' LAM 'E STOLAM ' * B3120
            LAM 'B STOLAM LAM 'O ' XLIB VarBrwType? 4ROLL 4ROLL * B3162
            XLIB BrowseGetVars {}N 19PUTLAM ;    * B3197
          LAM 'B #- #1+ 19GETLAM SWAP NTHCOMPROM@ * B31B1
          ~DUPTYPEBINT?;case;JstGetTHEMESG ;     * B31D5

* ROMPTR 0B4 1E5
* refs (1): A2437
* -> : NEW key: runs BrowseNewForm and rereads the list
BrowseNewKey:
        :: TakeOver XLIB BrowseNewForm NOT?SEMI  * B31DF
          ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM XLIB ~BBReReadNElems * B31F9
          XLIB ~BBReReadWidth BINT1 18PUTLAM FALSE XLIB ~BBRecalOff&Disp * B3233
          NULL{} 15PUTLAM ;                      * B3258

* ROMPTR 0B4 1E6
* refs (1): A2437
* -> flag: "New Variable": object, name and a check to create a directory instead
BrowseNewForm:
        :: # B984 BINT1 BINT10 # B989 BINT1 BINT19 # B98A BINT8 BINT28 * B3267  "Object:"  "Name:"  "Directory"
          'RROMPTR@ XLIB BrowseNewObjMH BINT31 BINT8 BINT97 BINT9 BINT21 * B32A8
          MINUSONE BINT4 # B985 # B986 MINUSONE MINUSONE MINUSONE 'DROPFALSE * B32D1  "Enter new object"  "Obs in"
          BINT31 BINT17 BINT49 BINT9 BINT1       * B3303
          { BINT6 } BINT4 # B98B MINUSONE MINUSONE MINUSONE MINUSONE * B331C  "Enter variable name"
          'RROMPTR@ XLIB BrowseNewDirMH BINT1 BINT26 BINT6 BINT9 BINT32 * B334E
          MINUSONE MINUSONE # B98C MINUSONE MINUSONE FALSE FALSE BINT3 DUP * B3377  "Create a new directory?"
          'RROMPTR@ XLIB BrowseNewMH # B988 14GETLAM ?SKIP * B33A9  "New Variable"
          :: HARDBUFF TOTEMPOB 1LAMBIND ;        * B33CD
          DoInputForm 14GETLAM ?SKIP             * B33E6
          :: 1GETABND HARDBUFF ZEROZERO GROB! ;  * B33F5
          NOTcaseFALSE case                      * B3413
          :: SWAPDROP XLIB VarCrDir TRUE ;       * B341D
          XLIB VarStoFld TRUE ;                  * B343C

* ROMPTR 0B4 1E7
* refs (1): A2437
* #msg -> ... flag: form message handler: 5 the labels
BrowseNewMH:
        :: BINT5 #<>case FALSE                   * B3451
          XLIB BrowseNewLabels TRUE ;            * B3465

* ROMPTR 0B4 1E8
* refs (1): A2437
* -> grob FALSE: message 5: the Object label only without Directory, the Directory label only without an object
BrowseNewLabels:
        :: BINT39 BINT131 MAKEGROB XLIB BrowseNewDir? ?SKIP * B347A
          :: BINT1 XLIB IFDispLabel ;            * B349E
          BINT2 XLIB IFDispLabel BINT1 XLIB IFNoVal? IT * B34B8
          :: BINT3 XLIB IFDispLabel ;            * B34DD
          FALSE ;                                * B34F7

* ROMPTR 0B4 1E9
* refs (1): A2437
* #msg -> ... flag: Object field: hidden with Directory on
BrowseNewObjMH:
        :: BINT7 #=casedrop XLIB BrowseNewDir?   * B3501
          { BINT55                               * B351B
            :: XLIB BrowseNewDir? NOT ; BINT47 XLIB BrowseNewDisp } * B3525
          EQLookup case                          * B3554
          :: EVAL TRUE ;                         * B355E
          DROPFALSE ;                            * B3572

* ROMPTR 0B4 1EA
* refs (1): A2437
* #msg -> ... flag: Directory field: hidden once the Object field has a value
BrowseNewDirMH:
        :: BINT7 #=casedrop                      * B357C
          :: BINT1 XLIB IFNoVal? NOT ;           * B358B
          { BINT55                               * B35AA
            :: BINT1 XLIB IFNoVal? ; BINT47 XLIB BrowseNewDisp } * B35B4
          EQLookup case                          * B35E3
          :: EVAL TRUE ;                         * B35ED
          DROPFALSE ;                            * B3601

* ROMPTR 0B4 1EB
* refs (1): A2437
* -> : after a change: blanks the row that no longer applies or redraws both
BrowseNewDisp:
        :: XLIB BrowseNewDir? case               * B360B
          :: BINT8 BINT9 BLANKIT ;               * B3620
          BINT1 XLIB IFNoVal? NOTcase            * B3639
          :: BINT26 BINT9 BLANKIT ;              * B364E
          HARDBUFF BINT1 XLIB IFDispLabel DROP BINT1 XLIB IFMarkPending * B3667
          HARDBUFF BINT3 XLIB IFDispLabel DROP BINT3 XLIB IFMarkPending ; * B3691

* ROMPTR 0B4 1EC
* refs (1): A2437
* -> flag: value of the Directory field
BrowseNewDir?:
        :: BINT3 XLIB ~gFldVal ;                 * B36C0

* ROMPTR 0B4 1ED
* refs (1): A2437
* -> : RCL key: recalls the checked variables, or the highlighted one
BrowseRclKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * B36DA
          15GETLAM DUPNULLCOMP? IT               * B36F9
          :: DROP 18GETLAM ONE{}N ;              * B3708
          INNERCOMP ZERO_DO ISTOP@ ROLL XLIB ~BBGetN XEQRCL LOOP * B3721
          SetDA123NoCh ;                         * B374A

* ROMPTR 0B4 1EE
* refs (1): A2437
* -> : COPY key: runs BrowseCopyForm on the checked variables, or the highlighted one
BrowseCopyKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * B3754
          15GETLAM DUPNULLCOMP? IT               * B3773
          :: DROP 18GETLAM ONE{}N ;              * B3782
          DUPLENCOMP #1= ITE                     * B379B
          :: INCOMPDROP XLIB ~BBGetN ;           * B37AA
          :: INNERCOMP ZERO_DO ISTOP@ ROLL XLIB ~BBGetN LOOP 15GETLAM * B37C4
            LENCOMP {}N ;                        * B37F2
          XLIB BrowseCopyForm NOT?SEMI           * B3801
          ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM XLIB ~BBReReadNElems * B3811
          XLIB ~BBReReadWidth BINT1 18PUTLAM FALSE XLIB ~BBRecalOff&Disp * B384B
          NULL{} 15PUTLAM ;                      * B3870

* ROMPTR 0B4 1EF
* refs (1): A2437
* names -> flag: "Copy Variable(s)"
BrowseCopyForm:
        :: # B989 BINT1 BINT19 # B98E BINT1 BINT28 'DROPFALSE BINT37 BINT17 * B387F  "Name:"  "Copy To:"
          BINT91 BINT9 BINT1                     * B38BB
          { BINT6 BINT5 } BINT4 # B98D MINUSONE MINUSONE MINUSONE BINT19 * B38CA  "Enter names of vars to copy"
          ROLL                                   * B3901

* ROMPTR 0B4 1F0
* refs (1): A2437
* Field: where to copy or move to
BrowseFldDest:
          :: 'RROMPTR@ XLIB BrowseDestMH BINT37 BINT26 BINT91 BINT9 BINT5 * B3906
            { BINT6 BINT5 } BINT4 MINUSONE MINUSONE MINUSONE MINUSONE * B3934
            MINUSONE ;                           * B3961
          BINT2 DUP 'RROMPTR@ XLIB BrowseCopyMH # B98F DoInputForm * B396B  "Copy Variable(s)"
          NOTcaseFALSE XLIB CopyVars             * B3994
          TRUE ;                                 * B39A4

* ROMPTR 0B4 1F1
* refs (1): A2437
* #msg -> ... flag: form message handler: 14 first field is 2
BrowseCopyMH:
        :: BINT14 #<>case FALSE                  * B39AE
          BINT2 TRUE ;                           * B39C2

* ROMPTR 0B4 1F2
* refs (1): A2437
* #msg -> ... flag: destination field: 37 picks a directory, 13 the help line for one or several variables
BrowseDestMH:
        ::                                       * B39D1
          { BINT37 XLIB BrowseCDChoose BINT13    * B39D6
            :: BINT1 XLIB ~gFldVal TYPELIST? ITE # B990 # B991 * B39F0  "Enter directory path"  "Enter var name or directory path"
              ~DUPTYPEBINT?;case;JstGetTHEMESG ; * B3A23
          }                                      * B3A2D
          EQLookup case                          * B3A32
          :: EVAL TRUE ;                         * B3A3C
          DROPFALSE ;                            * B3A50

* ROMPTR 0B4 1F3
* refs (1): A2437
* -> : MOVE key: runs BrowseMoveForm on the checked variables, or the highlighted one
BrowseMoveKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * B3A5A
          15GETLAM DUPNULLCOMP? IT               * B3A79
          :: DROP 18GETLAM ONE{}N ;              * B3A88
          DUPLENCOMP #1= ITE                     * B3AA1
          :: INCOMPDROP XLIB ~BBGetN ;           * B3AB0
          :: INNERCOMP ZERO_DO ISTOP@ ROLL XLIB ~BBGetN LOOP 15GETLAM * B3ACA
            LENCOMP {}N ;                        * B3AF8
          XLIB BrowseMoveForm NOT?SEMI           * B3B07
          ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM XLIB ~BBReReadNElems * B3B17
          XLIB ~BBReReadWidth BINT1 18PUTLAM FALSE XLIB ~BBRecalOff&Disp * B3B51
          NULL{} 15PUTLAM ;                      * B3B76

* ROMPTR 0B4 1F4
* refs (1): A2437
* names -> flag: "Move Variable(s)"
BrowseMoveForm:
        :: # B989 BINT1 BINT19 # B992 BINT1 BINT28 'DROPFALSE BINT37 BINT17 * B3B85  "Name:"  "Move To:"
          BINT91 BINT9 BINT1                     * B3BC1
          { BINT6 BINT5 } BINT4 # B993 MINUSONE MINUSONE MINUSONE BINT19 * B3BD0  "Enter names of vars to move"
          ROLL XLIB BrowseFldDest BINT2 DUP 'RROMPTR@ XLIB BrowseMoveMH * B3C07
          # B994 DoInputForm NOTcaseFALSE XLIB MoveVars * B3C31  "Move Variable(s)"
          TRUE ;                                 * B3C50

* ROMPTR 0B4 1F5
* refs (1): A2437
* #msg -> ... flag: form message handler: 14 first field is 2
BrowseMoveMH:
        :: BINT14 #<>case FALSE                  * B3C5A
          BINT2 TRUE ;                           * B3C6E

* ROMPTR 0B4 1F6
* refs (1): A2437
* -> : PURG key: purges the checked variables, or the highlighted one
BrowsePurgeKey:
        :: TakeOver XLIB ~BBEmpty? case DoBadKey * B3C7D
          15GETLAM DUPNULLCOMP? IT               * B3C9C
          :: DROP 18GETLAM ONE{}N ;              * B3CAB
          DUPLENCOMP #1= ITE                     * B3CC4
          :: INCOMPDROP XLIB ~BBGetN ;           * B3CD3
          :: INNERCOMP ZERO_DO ISTOP@ ROLL XLIB ~BBGetN LOOP 15GETLAM * B3CED
            LENCOMP {}N ;                        * B3D1B
          XLIB VarPurge ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM * B3D2A
          XLIB ~BBReReadNElems XLIB ~BBReReadWidth 18GETLAM 12GETLAM #MIN * B3D64
          18PUTLAM FALSE XLIB ~BBRecalOff&Disp NULL{} 15PUTLAM ; * B3D89

* ROMPTR 0B4 1F7
* refs (1): A2437
* -> : SIZE key: a message box with the size of the chosen variables and the memory available
BrowseSizeKey:
        :: TakeOver XLIB ~BBEmpty? ITE NULL$     * B3DAD
          :: 15GETLAM DUPNULLCOMP? IT            * B3DCC
            :: DROP 18GETLAM ONE{}N ;            * B3DE0
            DUPLENCOMP #1= ITE                   * B3DF9
            :: INCOMPDROP XLIB ~BBGetN ;         * B3E08
            :: INNERCOMP ZERO_DO ISTOP@ ROLL XLIB ~BBGetN LOOP 15GETLAM * B3E22
              LENCOMP {}N ;                      * B3E50
            DUPTYPELIST? ITE                     * B3E5F
            :: DUPLENCOMP #>$ # B995 JstGetTHEMESG &$ ; * B3E69  " Vars:"
            :: DUP ID>$ PTR CHR_: >T$ ;          * B3E91
            $ "\0A  " &$ SWAP XLIB VarBytes #>$ &$ # B997 JstGetTHEMESG &$ * B3EAF  " bytes"
            CHR_Newline >T$ ;                    * B3EF2
          # B996 JstGetTHEMESG &$ $ "\0A  " &$ XLIB FreeMem# #>$ &$ # B997 * B3F01  "Mem Available:"  " bytes"
          JstGetTHEMESG &$ BINT15 BINT15 MINUSONE ' XLIB ~MsgBoxMenu * B3F49
          XLIB ~DoMsgBox DROP SetDA123NoCh ;     * B3F72

* ROMPTR 0B4 1F8
* refs (1): A2437
* field values -> : stores the differential equation as the plot's: EQ, the variables and ranges, as PlotDiffStore
SolveDiffStore:
        :: 9rolld DROP XLIB DeqPutTol DROP XLIB DeqPutInit XLIB PltPutDepend * B3F8C
          XLIB PltPutIndepRng XLIB PltPutIndep ITE * B3FC1
          :: XLIB PutDeq3 DROP ;                 * B3FDC
          :: 3DROP XLIB PutEQ ;                  * B3FF6
        ;                                        * B4010

* ROMPTR 0B4 1F9
* refs (1): A2437
* #msg -> ... flag: a variable field of Solve Equation: 25 (new value entered) gives a plain real the old value's units
SolveVarMH:
        :: BINT25 OVER #<>case XLIB SolveEqKeyMH * B4015
          DROP 4GETLAM XLIB ~gFldVal DUPTYPEEXT? 3PICK TYPEREAL? ANDNOTcase * B4034
          DROPTRUE                               * B405D
          UM>U TRUE ;                            * B4062

* ROMPTR 0B4 1FA
* refs (1): A2437
* -> : RAD key in the plot form: changes the angle field, if the plot type has one
PlotKeyAngle:
        :: TakeOver XLIB ModeAngleItems BINT2 XLIB ~gFldVal ' * B4071
          :: ?ROMPTR@ SWAP ?ROMPTR@ EQUAL ; POSCOMP #0=case DoBadKey * B409B
          BINT2 XLIB ModesCycleAngle ;           * B40C8

LIB0B4.hash:
        CON(5)  DOHSTR                           * B40DD  hash table of library 0B4
        LENGTH                                   * B40E2  length, to #B4141
        CON(5)  0                                * B40E7  names of length 1
        CON(5)  0                                * B40EC  names of length 2
        CON(5)  0                                * B40F1  names of length 3
        CON(5)  0                                * B40F6  names of length 4
        CON(5)  0                                * B40FB  names of length 5
        CON(5)  0                                * B4100  names of length 6
        CON(5)  0                                * B4105  names of length 7
        CON(5)  0                                * B410A  names of length 8
        CON(5)  0                                * B410F  names of length 9
        CON(5)  0                                * B4114  names of length 10
        CON(5)  0                                * B4119  names of length 11
        CON(5)  0                                * B411E  names of length 12
        CON(5)  0                                * B4123  names of length 13
        CON(5)  0                                * B4128  names of length 14
        CON(5)  0                                * B412D  names of length 15
        CON(5)  0                                * B4132  names of length 16
        REL(5)  LIB0B4.hash.L1                   * B4137  end of the names
LIB0B4.hash.L1:
        CON(5)  0                                * B413C  command 000 has no name
        ENDLENGTH                                * B4141

LIB0B4.link:
        CON(5)  DOHSTR                           * B4141  link table of library 0B4
        LENGTH                                   * B4146  length, to #B4B32
        REL(5)  SolveApp                         * B414B  000 
        REL(5)  SolveEqApp                       * B4150  001 
        REL(5)  SolveEqFields                    * B4155  002 
        REL(5)  SolveEqLabel                     * B415A  003 
        REL(5)  SolveEqField                     * B415F  004 
        REL(5)  SolveEqMH                        * B4164  005 
        REL(5)  SolveEqMenu                      * B4169  006 
        REL(5)  SolveEqFieldMH                   * B416E  007 
        REL(5)  SolveEqKeyMH                     * B4173  008 
        REL(5)  SolveEqKey                       * B4178  009 
        REL(5)  SolveEqToPlot                    * B417D  00A 
        REL(5)  SolveEqVarsKey                   * B4182  00B 
        REL(5)  SolveEqOrderForm                 * B4187  00C 
        REL(5)  SolveEqOrderMH                   * B418C  00D 
        REL(5)  SolveEqNextPage                  * B4191  00E 
        REL(5)  SolveEqInfo                      * B4196  00F 
        REL(5)  SolveEqSolve                     * B419B  010 
        REL(5)  SolveEqRebuild                   * B41A0  011 
        REL(5)  SolveVarLabels                   * B41A5  012 
        REL(5)  SolveEqPaged?                    * B41AA  013 
        REL(5)  SolveEqPage                      * B41AF  014 
        REL(5)  SolveEqSave                      * B41B4  015 
        REL(5)  SolveEqStore                     * B41B9  016 
        REL(5)  SolveDiffForm                    * B41BE  017 
        REL(5)  SolveDiffMH                      * B41C3  018 
        REL(5)  SolveDiffMenu                    * B41C8  019 
        REL(5)  SolveDiffKeyMH                   * B41CD  01A 
        REL(5)  SolveDiffKey                     * B41D2  01B 
        REL(5)  SolveDiffToPlot                  * B41D7  01C 
        REL(5)  SolveDiffInit+                   * B41DC  01D 
        REL(5)  SolveDiffSolve                   * B41E1  01E 
        REL(5)  SolveDiffLabels                  * B41E6  01F 
        REL(5)  SolveDiffF1MH                    * B41EB  020 
        REL(5)  SolveDiffF2MH                    * B41F0  021 
        REL(5)  SolveDiffEditMH                  * B41F5  022 
        REL(5)  SolveDiffEditKeys                * B41FA  023 
        REL(5)  SolveDiffResMH                   * B41FF  024 
        REL(5)  IFEditDrop                       * B4204  025 
        REL(5)  SolveDiffStepMH                  * B4209  026 
        REL(5)  SolveDiffStiffMH                 * B420E  027 
        REL(5)  SolveDiffMoveF                   * B4213  028 
        REL(5)  SolveDiffStiffDisp               * B4218  029 
        REL(5)  SolveDiffStiff?                  * B421D  02A 
        REL(5)  IFEditDflt0                      * B4222  02B 
        REL(5)  SolvePolyForm                    * B4227  02C 
        REL(5)  SolvePolyMH                      * B422C  02D 
        REL(5)  SolvePolyMenu                    * B4231  02E 
        REL(5)  SolvePolySymb                    * B4236  02F 
        REL(5)  SolvePolySolve                   * B423B  030 
        REL(5)  IFArrayMH                        * B4240  031 
        REL(5)  IFEditArray                      * B4245  032 
        REL(5)  SolveLinForm                     * B424A  033 
        REL(5)  SolveLinMH                       * B424F  034 
        REL(5)  SolveLinMenu                     * B4254  035 
        REL(5)  SolveLinSolve                    * B4259  036 
        REL(5)  SolveLinFieldMH                  * B425E  037 
        REL(5)  TVMForm                          * B4263  038 
        REL(5)  TVMGetVals                       * B4268  039 
        REL(5)  TVMSetVals                       * B426D  03A 
        REL(5)  TVMMH                            * B4272  03B 
        REL(5)  TVMMenu                          * B4277  03C 
        REL(5)  TVMSolveKey_A4E71                * B427C  03D 
        REL(5)  TVMFieldMH                       * B4281  03E 
        REL(5)  AmortForm                        * B4286  03F 
        REL(5)  AmortMH                          * B428B  040 
        REL(5)  AmortMenu                        * B4290  041 
        REL(5)  AmortB>PV                        * B4295  042 
        REL(5)  AmortCalc                        * B429A  043 
        REL(5)  AmortResMH                       * B429F  044 
        REL(5)  PlotApp                          * B42A4  045 
        REL(5)  PlotFormFor                      * B42A9  046 
        REL(5)  PlotFormVals                     * B42AE  047 
        REL(5)  PlotFormStore                    * B42B3  048 
        REL(5)  PlotFuncForm                     * B42B8  049 
        REL(5)  PlotLblType                      * B42BD  04A 
        REL(5)  PlotLblAngle                     * B42C2  04B 
        REL(5)  PlotLblEq                        * B42C7  04C 
        REL(5)  PlotLblIndep                     * B42CC  04D 
        REL(5)  PlotLblHView                     * B42D1  04E 
        REL(5)  PlotLblAuto                      * B42D6  04F 
        REL(5)  PlotLblVView                     * B42DB  050 
        REL(5)  PlotFldType                      * B42E0  051 
        REL(5)  PlotFldAngle                     * B42E5  052 
        REL(5)  PlotFldEq                        * B42EA  053 
        REL(5)  PlotFldIndep                     * B42EF  054 
        REL(5)  PlotFldHLo                       * B42F4  055 
        REL(5)  PlotFldHHi                       * B42F9  056 
        REL(5)  PlotFldAuto                      * B42FE  057 
        REL(5)  PlotFldVLo                       * B4303  058 
        REL(5)  PlotFldVHi                       * B4308  059 
        REL(5)  PlotFuncVals                     * B430D  05A 
        REL(5)  PlotFuncStore                    * B4312  05B 
        REL(5)  PlotFormMH                       * B4317  05C 
        REL(5)  PlotMenu                         * B431C  05D 
        REL(5)  PlotAutoMH                       * B4321  05E 
        REL(5)  PlotOptsKey                      * B4326  05F 
        REL(5)  PlotOptsFor                      * B432B  060 
        REL(5)  PlotOptsVals                     * B4330  061 
        REL(5)  PlotOptsStore                    * B4335  062 
        REL(5)  PlotEraseKey                     * B433A  063 
        REL(5)  PlotDrawKey                      * B433F  064 
        REL(5)  PlotTypeMH                       * B4344  065 
        REL(5)  PlotEqMH                         * B4349  066 
        REL(5)  PlotFieldMH                      * B434E  067 
        REL(5)  PlotConicForm                    * B4353  068 
        REL(5)  PlotFldConicEq                   * B4358  069 
        REL(5)  PlotConicVals                    * B435D  06A 
        REL(5)  PlotConicEqMH                    * B4362  06B 
        REL(5)  PlotConicStore                   * B4367  06C 
        REL(5)  PlotTruthForm                    * B436C  06D 
        REL(5)  PlotTruthStore                   * B4371  06E 
        REL(5)  PlotTruthStore                   * B4376  06F 
        REL(5)  PlotParamForm                    * B437B  070 
        REL(5)  PlotDiffForm                     * B4380  071 
        REL(5)  PlotDiffVals                     * B4385  072 
        REL(5)  PlotDiffStore                    * B438A  073 
        REL(5)  PlotDiffMH                       * B438F  074 
        REL(5)  PlotDiffLabels                   * B4394  075 
        REL(5)  PlotDiffF1MH                     * B4399  076 
        REL(5)  PlotDiffF2MH                     * B439E  077 
        REL(5)  PlotDiffEditMH                   * B43A3  078 
        REL(5)  PlotDiffStiffMH                  * B43A8  079 
        REL(5)  PlotDiffMoveF                    * B43AD  07A 
        REL(5)  PlotDiffStiffDisp                * B43B2  07B 
        REL(5)  PlotDiffStiff?                   * B43B7  07C 
        REL(5)  PlotHistoForm                    * B43BC  07D 
        REL(5)  PlotLblsStat                     * B43C1  07E 
        REL(5)  PlotLblDat                       * B43C6  07F 
        REL(5)  PlotFldDat                       * B43CB  080 
        REL(5)  PlotFldCol                       * B43D0  081 
        REL(5)  PlotStatVals                     * B43D5  082 
        REL(5)  PlotStatStore                    * B43DA  083 
        REL(5)  PlotStatMH                       * B43DF  084 
        REL(5)  PlotDatMH                        * B43E4  085 
        REL(5)  PlotHistoWidMH                   * B43E9  086 
        REL(5)  PlotHistoDfltWid                 * B43EE  087 
        REL(5)  PlotBarForm                      * B43F3  088 
        REL(5)  PlotBarWidMH                     * B43F8  089 
        REL(5)  PlotBarDfltWid                   * B43FD  08A 
        REL(5)  PlotScatForm                     * B4402  08B 
        REL(5)  PlotScatVals                     * B4407  08C 
        REL(5)  PlotScatStore                    * B440C  08D 
        REL(5)  PlotOptFuncForm                  * B4411  08E 
        REL(5)  PlotOptLbls                      * B4416  08F 
        REL(5)  PlotOptLblIndep                  * B441B  090 
        REL(5)  PlotOptLblLo                     * B4420  091 
        REL(5)  PlotOptLblHi                     * B4425  092 
        REL(5)  PlotOptLblAxes                   * B442A  093 
        REL(5)  PlotOptLblSimult                 * B442F  094 
        REL(5)  PlotOptLblConnect                * B4434  095 
        REL(5)  PlotOptLblStep                   * B4439  096 
        REL(5)  PlotOptLblPixels                 * B443E  097 
        REL(5)  PlotOptLblHTick                  * B4443  098 
        REL(5)  PlotOptLblVTick                  * B4448  099 
        REL(5)  PlotOptLblPixels2                * B444D  09A 
        REL(5)  PlotOptFldIndep                  * B4452  09B 
        REL(5)  PlotOptFldLo                     * B4457  09C 
        REL(5)  PlotOptFldHi                     * B445C  09D 
        REL(5)  PlotOptFldAxes                   * B4461  09E 
        REL(5)  PlotOptFldConnect                * B4466  09F 
        REL(5)  PlotOptFldSimult                 * B446B  0A0 
        REL(5)  PlotOptFldStep                   * B4470  0A1 
        REL(5)  PlotOptFldStepPix                * B4475  0A2 
        REL(5)  PlotOptFldHTick                  * B447A  0A3 
        REL(5)  PlotOptFldVTick                  * B447F  0A4 
        REL(5)  PlotOptFldTickPix                * B4484  0A5 
        REL(5)  PlotOptFuncVals                  * B4489  0A6 
        REL(5)  PlotOptFuncStore                 * B448E  0A7 
        REL(5)  PlotOptLoMH                      * B4493  0A8 
        REL(5)  PlotOptDfltLo                    * B4498  0A9 
        REL(5)  PlotOptLoChg                     * B449D  0AA 
        REL(5)  PlotOptHiMH                      * B44A2  0AB 
        REL(5)  PlotOptDfltHi                    * B44A7  0AC 
        REL(5)  PlotOptHiChg                     * B44AC  0AD 
        REL(5)  PlotOptStepMH                    * B44B1  0AE 
        REL(5)  PlotOptDfltStep                  * B44B6  0AF 
        REL(5)  PlotOptFieldMH                   * B44BB  0B0 
        REL(5)  PlotOptPolarForm                 * B44C0  0B1 
        REL(5)  PlotOptPolarVals                 * B44C5  0B2 
        REL(5)  PlotOptPolarStore                * B44CA  0B3 
        REL(5)  PlotOptPolarHiMH                 * B44CF  0B4 
        REL(5)  PlotOptPolarStepMH               * B44D4  0B5 
        REL(5)  PlotOptPolarDfltStep             * B44D9  0B6 
        REL(5)  PlotOptParamForm                 * B44DE  0B7 
        REL(5)  PlotOptParamStepMH               * B44E3  0B8 
        REL(5)  PlotOptParamDfltStep             * B44E8  0B9 
        REL(5)  PlotOptConicForm                 * B44ED  0BA 
        REL(5)  PlotOptConicVals                 * B44F2  0BB 
        REL(5)  PlotOptConicStore                * B44F7  0BC 
        REL(5)  PlotOptTruthForm                 * B44FC  0BD 
        REL(5)  PlotOptTruthVals                 * B4501  0BE 
        REL(5)  PlotOptTruthStore                * B4506  0BF 
        REL(5)  PlotOptDepLoMH                   * B450B  0C0 
        REL(5)  PlotOptDfltDepLo                 * B4510  0C1 
        REL(5)  PlotOptDepLoChg                  * B4515  0C2 
        REL(5)  PlotOptDepHiMH                   * B451A  0C3 
        REL(5)  PlotOptDfltDepHi                 * B451F  0C4 
        REL(5)  PlotOptDepHiChg                  * B4524  0C5 
        REL(5)  PlotOptDiffForm                  * B4529  0C6 
        REL(5)  PlotOptDiffVals                  * B452E  0C7 
        REL(5)  PlotOptDiffStore                 * B4533  0C8 
        REL(5)  PlotOptDiffStepMH                * B4538  0C9 
        REL(5)  PlotOptDfltDiffStep              * B453D  0CA 
        REL(5)  PlotOptDiffVarMH                 * B4542  0CB 
        REL(5)  PlotOptDiffVarList               * B4547  0CC 
        REL(5)  PlotOptDiffVar$                  * B454C  0CD 
        REL(5)  PlotOptStatForm                  * B4551  0CE 
        REL(5)  PlotOptStatVals                  * B4556  0CF 
        REL(5)  PlotOptStatStore                 * B455B  0D0 
        REL(5)  PlotZoomForm                     * B4560  0D1 
        REL(5)  PlotTypeChoose                   * B4565  0D2 
        REL(5)  PlotTypeNext                     * B456A  0D3 
        REL(5)  PlotTypeSeek                     * B456F  0D4 
        REL(5)  PlotTypeReset                    * B4574  0D5 
        REL(5)  PlotVViewDisp                    * B4579  0D6 
        REL(5)  PlotKey                          * B457E  0D7 
        REL(5)  PlotPictKey                      * B4583  0D8 
        REL(5)  PlotSolveKey                     * B4588  0D9 
        REL(5)  PlotToSolveEq                    * B458D  0DA 
        REL(5)  PlotToSolveDiff                  * B4592  0DB 
        REL(5)  PlotResetMenu                    * B4597  0DC 
        REL(5)  PlotResetAll                     * B459C  0DD 
        REL(5)  PlotOptResetMenu                 * B45A1  0DE 
        REL(5)  PlotOptResetAll                  * B45A6  0DF 
        REL(5)  IFDflt$                          * B45AB  0E0 
        REL(5)  PlotVLo$                         * B45B0  0E1 
        REL(5)  PlotVHi$                         * B45B5  0E2 
        REL(5)  PlotEditKeys                     * B45BA  0E3 
        REL(5)  PlotConicEditKeys                * B45BF  0E4 
        REL(5)  PlotFirstField                   * B45C4  0E5 
        REL(5)  Plot3DForm                       * B45C9  0E6 
        REL(5)  Plot3DVals                       * B45CE  0E7 
        REL(5)  Plot3DStore                      * B45D3  0E8 
        REL(5)  Plot3DMH                         * B45D8  0E9 
        REL(5)  Plot3DEqMH                       * B45DD  0EA 
        REL(5)  PlotEditKeys2                    * B45E2  0EB 
        REL(5)  PlotOptViewForm                  * B45E7  0EC 
        REL(5)  PlotOptLblXLeft                  * B45EC  0ED 
        REL(5)  PlotOptLblXRight                 * B45F1  0EE 
        REL(5)  PlotOptLblYNear                  * B45F6  0EF 
        REL(5)  PlotOptLblYFar                   * B45FB  0F0 
        REL(5)  PlotOptFldXLeft                  * B4600  0F1 
        REL(5)  PlotOptFldXRight                 * B4605  0F2 
        REL(5)  PlotOptFldYNear                  * B460A  0F3 
        REL(5)  PlotOptFldYFar                   * B460F  0F4 
        REL(5)  PlotOptViewVals                  * B4614  0F5 
        REL(5)  PlotOptViewStore                 * B4619  0F6 
        REL(5)  PlotOptWireForm                  * B461E  0F7 
        REL(5)  PlotOptLblsWire                  * B4623  0F8 
        REL(5)  PlotOptLblZLow                   * B4628  0F9 
        REL(5)  PlotOptLblZHigh                  * B462D  0FA 
        REL(5)  PlotOptLblXE                     * B4632  0FB 
        REL(5)  PlotOptLblYE                     * B4637  0FC 
        REL(5)  PlotOptLblZE                     * B463C  0FD 
        REL(5)  PlotOptFldsWire                  * B4641  0FE 
        REL(5)  PlotOptFldZLow                   * B4646  0FF 
        REL(5)  PlotOptFldZHigh                  * B464B  100 
        REL(5)  PlotOptFldXE                     * B4650  101 
        REL(5)  PlotOptFldYE                     * B4655  102 
        REL(5)  PlotOptFldZE                     * B465A  103 
        REL(5)  PlotOptWireVals                  * B465F  104 
        REL(5)  PlotOptWireStore                 * B4664  105 
        REL(5)  PlotOptSliceForm                 * B4669  106 
        REL(5)  PlotOptSliceVals                 * B466E  107 
        REL(5)  PlotOptSliceStore                * B4673  108 
        REL(5)  PlotOptGridForm                  * B4678  109 
        REL(5)  PlotOptGridVals                  * B467D  10A 
        REL(5)  PlotOptGridStore                 * B4682  10B 
        REL(5)  PlotOptPSurfForm                 * B4687  10C 
        REL(5)  PlotOptPSurfMH                   * B468C  10D 
        REL(5)  PlotOptPSurfMenu                 * B4691  10E 
        REL(5)  PlotOptXXYYKey                   * B4696  10F 
        REL(5)  PlotOptXXYYForm                  * B469B  110 
        REL(5)  PlotOptXXYYVals                  * B46A0  111 
        REL(5)  PlotOptXXYYStore                 * B46A5  112 
        REL(5)  SymbApp                          * B46AA  113 
        REL(5)  SymbIntegForm                    * B46AF  114 
        REL(5)  SymbLblExpr                      * B46B4  115 
        REL(5)  SymbLblVar                       * B46B9  116 
        REL(5)  SymbLblResult                    * B46BE  117 
        REL(5)  SymbFldExpr                      * B46C3  118 
        REL(5)  SymbFldVar                       * B46C8  119 
        REL(5)  SymbIntegMH                      * B46CD  11A 
        REL(5)  SymbIntegLabels                  * B46D2  11B 
        REL(5)  SymbResultMH                     * B46D7  11C 
        REL(5)  SymbFormatMH                     * B46DC  11D 
        REL(5)  SymbDigitsMH                     * B46E1  11E 
        REL(5)  SymbIntegDisp                    * B46E6  11F 
        REL(5)  SymbIntegNum?                    * B46EB  120 
        REL(5)  SymbIntegStd?                    * B46F0  121 
        REL(5)  SymbDiffForm                     * B46F5  122 
        REL(5)  SymbDiffMH                       * B46FA  123 
        REL(5)  SymbDiffMenu                     * B46FF  124 
        REL(5)  SymbDiffStep                     * B4704  125 
        REL(5)  SymbDiffLabels                   * B4709  126 
        REL(5)  SymbDiffResMH                    * B470E  127 
        REL(5)  SymbDiffDisp                     * B4713  128 
        REL(5)  SymbDiffValMH                    * B4718  129 
        REL(5)  SymbDiffNum?                     * B471D  12A 
        REL(5)  SymbTaylorForm                   * B4722  12B 
        REL(5)  SymbFldResult                    * B4727  12C 
        REL(5)  SymbIsolateForm                  * B472C  12D 
        REL(5)  SymbLblPrincipal                 * B4731  12E 
        REL(5)  SymbFldPrincipal                 * B4736  12F 
        REL(5)  SymbQuadForm                     * B473B  130 
        REL(5)  SymbManipForm                    * B4740  131 
        REL(5)  SymbManipMH                      * B4745  132 
        REL(5)  SymbManipMenu                    * B474A  133 
        REL(5)  SymbColctKey                     * B474F  134 
        REL(5)  SymbExpndKey                     * B4754  135 
        REL(5)  SymbMatchForm                    * B4759  136 
        REL(5)  TimeApp                          * B475E  137 
        REL(5)  AlarmSet                         * B4763  138 
        REL(5)  AlarmForm                        * B4768  139 
        REL(5)  TimeLblTime                      * B476D  13A 
        REL(5)  TimeLblColon1                    * B4772  13B 
        REL(5)  TimeLblColon2                    * B4777  13C 
        REL(5)  TimeLblDate                      * B477C  13D 
        REL(5)  TimeLblRepeat                    * B4781  13E 
        REL(5)  TimeLblSlash1                    * B4786  13F 
        REL(5)  TimeLblSlash2                    * B478B  140 
        REL(5)  TimeLblDot1                      * B4790  141 
        REL(5)  TimeLblDot2                      * B4795  142 
        REL(5)  TimeFldHour                      * B479A  143 
        REL(5)  TimeFldMin                       * B479F  144 
        REL(5)  TimeFldSec                       * B47A4  145 
        REL(5)  TimeFldAMPM                      * B47A9  146 
        REL(5)  TimeFldMonthMD                   * B47AE  147 
        REL(5)  TimeFldDayMD                     * B47B3  148 
        REL(5)  TimeFldDayDM                     * B47B8  149 
        REL(5)  TimeFldMonthDM                   * B47BD  14A 
        REL(5)  TimeFldYear                      * B47C2  14B 
        REL(5)  AlarmDfltFields                  * B47C7  14C 
        REL(5)  AlarmFromFields                  * B47CC  14D 
        REL(5)  AlarmMH                          * B47D1  14E 
        REL(5)  AlarmLabels                      * B47D6  14F 
        REL(5)  TimeMinMH                        * B47DB  150 
        REL(5)  TimeMinMH                        * B47E0  151 
        REL(5)  TimeMonthMDMH                    * B47E5  152 
        REL(5)  TimeMonthDMMH                    * B47EA  153 
        REL(5)  TimeMonthMH                      * B47EF  154 
        REL(5)  TimeDayMDMH                      * B47F4  155 
        REL(5)  TimeDayDMMH                      * B47F9  156 
        REL(5)  TimeDayMH                        * B47FE  157 
        REL(5)  TimeYearMH                       * B4803  158 
        REL(5)  AlarmRepeatMH                    * B4808  159 
        REL(5)  AlarmUnitMH                      * B480D  15A 
        REL(5)  TimeSetForm                      * B4812  15B 
        REL(5)  TimeGetFields                    * B4817  15C 
        REL(5)  TimeSetFields                    * B481C  15D 
        REL(5)  TimeSetMH                        * B4821  15E 
        REL(5)  TimeSetLabels                    * B4826  15F 
        REL(5)  TimeFormatMH                     * B482B  160 
        REL(5)  TimeFormatChg                    * B4830  161 
        REL(5)  TimeChooseFld                    * B4835  162 
        REL(5)  TimeNextMonth                    * B483A  163 
        REL(5)  TimeNextDay                      * B483F  164 
        REL(5)  TimeDMY?                         * B4844  165 
        REL(5)  AlarmRepeats?                    * B4849  166 
        REL(5)  Time2Digits                      * B484E  167 
        REL(5)  Time2Digits                      * B4853  168 
        REL(5)  Time2Chars                       * B4858  169 
        REL(5)  Time2Chars                       * B485D  16A 
        REL(5)  Time2Chars                       * B4862  16B 
        REL(5)  AlarmRepeat$                     * B4867  16C 
        REL(5)  AlarmUnit$                       * B486C  16D 
        REL(5)  AlarmBrowse                      * B4871  16E 
        REL(5)  AlarmBrowseMH                    * B4876  16F 
        REL(5)  AlarmBrowseGrob                  * B487B  170 
        REL(5)  AlarmBrowseMenu                  * B4880  171 
        REL(5)  AlarmBrowseEdit                  * B4885  172 
        REL(5)  AlarmBrowseNew                   * B488A  173 
        REL(5)  AlarmBrowsePurge                 * B488F  174 
        REL(5)  StatApp                          * B4894  175 
        REL(5)  StatSingleForm                   * B4899  176 
        REL(5)  StatLblDat                       * B489E  177 
        REL(5)  StatLblCol                       * B48A3  178 
        REL(5)  StatFldDat                       * B48A8  179 
        REL(5)  StatFldCol                       * B48AD  17A 
        REL(5)  StatSingleArgs                   * B48B2  17B 
        REL(5)  StatSingleCalc                   * B48B7  17C 
        REL(5)  StatFreqForm                     * B48BC  17D 
        REL(5)  StatFreqArgs                     * B48C1  17E 
        REL(5)  StatFitForm                      * B48C6  17F 
        REL(5)  StatLblXCol                      * B48CB  180 
        REL(5)  StatLblYCol                      * B48D0  181 
        REL(5)  StatLblModel                     * B48D5  182 
        REL(5)  StatFldDat2                      * B48DA  183 
        REL(5)  StatFldXYCol                     * B48DF  184 
        REL(5)  StatFldModel                     * B48E4  185 
        REL(5)  StatFitArgs                      * B48E9  186 
        REL(5)  StatFitMH                        * B48EE  187 
        REL(5)  StatFitMenu                      * B48F3  188 
        REL(5)  StatPredKey                      * B48F8  189 
        REL(5)  StatFitVals                      * B48FD  18A 
        REL(5)  StatPredForm                     * B4902  18B 
        REL(5)  StatPredMH                       * B4907  18C 
        REL(5)  StatPredMenu                     * B490C  18D 
        REL(5)  StatPredCalc                     * B4911  18E 
        REL(5)  StatSumForm                      * B4916  18F 
        REL(5)  StatSumArgs                      * B491B  190 
        REL(5)  StatSumCalc                      * B4920  191 
        REL(5)  IOApp                            * B4925  192 
        REL(5)  IOSendForm                       * B492A  193 
        REL(5)  IOSendMH                         * B492F  194 
        REL(5)  IOSendMenu                       * B4934  195 
        REL(5)  IOSendKey                        * B4939  196 
        REL(5)  IOPrintForm                      * B493E  197 
        REL(5)  IOLblPort                        * B4943  198 
        REL(5)  IOLblXlat                        * B4948  199 
        REL(5)  IOLblBaud                        * B494D  19A 
        REL(5)  IOLblParity                      * B4952  19B 
        REL(5)  IOFldBaud                        * B4957  19C 
        REL(5)  IOPrintVals                      * B495C  19D 
        REL(5)  IOPrintStore                     * B4961  19E 
        REL(5)  IOPrintMH                        * B4966  19F 
        REL(5)  IOPrintMenu                      * B496B  1A0 
        REL(5)  IOPrintKey                       * B4970  1A1 
        REL(5)  IOPrintLabels                    * B4975  1A2 
        REL(5)  IOPrintPortMH                    * B497A  1A3 
        REL(5)  IOPrintPortDisp                  * B497F  1A4 
        REL(5)  IOPrintIRMH                      * B4984  1A5 
        REL(5)  IOPrintWireMH                    * B4989  1A6 
        REL(5)  IOPortIR?                        * B498E  1A7 
        REL(5)  IOXferForm                       * B4993  1A8 
        REL(5)  IOXferVals                       * B4998  1A9 
        REL(5)  IOXferStore                      * B499D  1AA 
        REL(5)  IOXferMH                         * B49A2  1AB 
        REL(5)  IOXferMenu                       * B49A7  1AC 
        REL(5)  IOXferRecvKey                    * B49AC  1AD 
        REL(5)  IOXferGetKey                     * B49B1  1AE 
        REL(5)  IOXferSendKey                    * B49B6  1AF 
        REL(5)  IOXferLabels                     * B49BB  1B0 
        REL(5)  IOXferPortMH                     * B49C0  1B1 
        REL(5)  IOXferTypeMH                     * B49C5  1B2 
        REL(5)  IOXferDisp                       * B49CA  1B3 
        REL(5)  IOXferNameMH                     * B49CF  1B4 
        REL(5)  IOXferChoose                     * B49D4  1B5 
        REL(5)  IOXferLocal                      * B49D9  1B6 
        REL(5)  IOXferRemote                     * B49DE  1B7 
        REL(5)  IOXferRemoteMH                   * B49E3  1B8 
        REL(5)  IOXferRemoteTitle                * B49E8  1B9 
        REL(5)  IOXferRemoteMenu                 * B49ED  1BA 
        REL(5)  IOXferRemoteCD                   * B49F2  1BB 
        REL(5)  IOXferCDMH                       * B49F7  1BC 
        REL(5)  IOXferCDKeys                     * B49FC  1BD 
        REL(5)  IOXferParityMH                   * B4A01  1BE 
        REL(5)  IOXferKermitMH                   * B4A06  1BF 
        REL(5)  IOXferKermit?                    * B4A0B  1C0 
        REL(5)  ModesApp                         * B4A10  1C1 
        REL(5)  ModesVals                        * B4A15  1C2 
        REL(5)  ModesStore                       * B4A1A  1C3 
        REL(5)  ModesMH                          * B4A1F  1C4 
        REL(5)  ModesMenu                        * B4A24  1C5 
        REL(5)  ModesFlagKey                     * B4A29  1C6 
        REL(5)  ModesFmtMH                       * B4A2E  1C7 
        REL(5)  ModesFmtDisp                     * B4A33  1C8 
        REL(5)  ModesDigitsMH                    * B4A38  1C9 
        REL(5)  ModesFieldMH                     * B4A3D  1CA 
        REL(5)  ModesKey                         * B4A42  1CB 
        REL(5)  ModesCycleAngle                  * B4A47  1CC 
        REL(5)  ModesCycleCoord                  * B4A4C  1CD 
        REL(5)  ModesStd?                        * B4A51  1CE 
        REL(5)  FlagBrowse                       * B4A56  1CF 
        REL(5)  FlagBrowseMH                     * B4A5B  1D0 
        REL(5)  FlagBrowseGrob                   * B4A60  1D1 
        REL(5)  FlagBrowseGrob                   * B4A65  1D2 
        REL(5)  FlagBrowseMenu                   * B4A6A  1D3 
        REL(5)  FlagBrowseChk                    * B4A6F  1D4 
        REL(5)  FlagState                        * B4A74  1D5 
        REL(5)  FlagChange                       * B4A79  1D6 
        REL(5)  MemApp                           * B4A7E  1D7 
        REL(5)  BrowseMem                        * B4A83  1D8 
        REL(5)  BrowseMH                         * B4A88  1D9 
        REL(5)  BrowseTitle                      * B4A8D  1DA 
        REL(5)  BrowseGetVars                    * B4A92  1DB 
        REL(5)  BrowseMenuChoose                 * B4A97  1DC 
        REL(5)  BrowseMenuFull                   * B4A9C  1DD 
        REL(5)  BrowseEditKey                    * B4AA1  1DE 
        REL(5)  BrowseEditForm                   * B4AA6  1DF 
        REL(5)  BrowseCDKey                      * B4AAB  1E0 
        REL(5)  BrowseCDChoose                   * B4AB0  1E1 
        REL(5)  BrowseCDMH                       * B4AB5  1E2 
        REL(5)  BrowseCDElem                     * B4ABA  1E3 
        REL(5)  BrowseGetN                       * B4ABF  1E4 
        REL(5)  BrowseNewKey                     * B4AC4  1E5 
        REL(5)  BrowseNewForm                    * B4AC9  1E6 
        REL(5)  BrowseNewMH                      * B4ACE  1E7 
        REL(5)  BrowseNewLabels                  * B4AD3  1E8 
        REL(5)  BrowseNewObjMH                   * B4AD8  1E9 
        REL(5)  BrowseNewDirMH                   * B4ADD  1EA 
        REL(5)  BrowseNewDisp                    * B4AE2  1EB 
        REL(5)  BrowseNewDir?                    * B4AE7  1EC 
        REL(5)  BrowseRclKey                     * B4AEC  1ED 
        REL(5)  BrowseCopyKey                    * B4AF1  1EE 
        REL(5)  BrowseCopyForm                   * B4AF6  1EF 
        REL(5)  BrowseFldDest                    * B4AFB  1F0 
        REL(5)  BrowseCopyMH                     * B4B00  1F1 
        REL(5)  BrowseDestMH                     * B4B05  1F2 
        REL(5)  BrowseMoveKey                    * B4B0A  1F3 
        REL(5)  BrowseMoveForm                   * B4B0F  1F4 
        REL(5)  BrowseMoveMH                     * B4B14  1F5 
        REL(5)  BrowsePurgeKey                   * B4B19  1F6 
        REL(5)  BrowseSizeKey                    * B4B1E  1F7 
        REL(5)  SolveDiffStore                   * B4B23  1F8 
        REL(5)  SolveVarMH                       * B4B28  1F9 
        REL(5)  PlotKeyAngle                     * B4B2D  1FA 
