* HP 48GX ROM revision R, #9DA13-#A07E8: Library 0E4: the Multiple-Equation Solver: the Mpar variable, the solver menu, solving by chaining single equations, the results browser, and the user commands
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: MESMessages ~MESRclEqn MESVars MESVarPos MESVarFlag MESUserVars MESTnf MESTitle MESTarget MESStoTnf MESStoTarget MESStoRnflg
* Follows on from the previous file (at #9DA13 in the original ROM).
        ENDLENGTH                                * 9DA13

        CON(5)  DOLIB                            * 9DA13  library object
        LENGTH                                   * 9DA18  length, to #A07E9
        CON(2)  0                                * 9DA1D  title length

* Library 0E4: The Multiple-Equation Solver: MINIT, MITM, MSOLVR, MUSER, MCALC, MROOT, its menu and its search for equations it can solve
LIB0E4:
        CON(3)  #0E4                             * 9DA1F  library number
        REL(5)  LIB0E4.hash                      * 9DA22  hash table
        REL(5)  MESMessages                      * 9DA27  message table
        REL(5)  LIB0E4.link                      * 9DA2C  link table
        CON(5)  0                                * 9DA31  config
        RPL

* ROMPTR 0E4 000
* refs (1): 9DA1F
* ob -> : stores into local 'PC3
MESStoPC3:
        :: ' LAM 'PC3 STO ;                      * 9DA36

* ROMPTR 0E4 001
* refs (1): 9DA1F
* ob -> : stores into local 'PC2
MESStoPC2:
        :: ' LAM 'PC2 STO ;                      * 9DA59

* ROMPTR 0E4 002
* refs (1): 9DA1F
* ob -> : stores into local 'PC1
MESStoPC1:
        :: ' LAM 'PC1 STO ;                      * 9DA7C

* ROMPTR 0E4 003
* refs (1): 9DA1F
* ob -> : stores the name being solved for, or "Int" when interrupted
MESStoTarget:
        :: ' LAM MSTargetId STO ;                * 9DA9F

* ROMPTR 0E4 004
* refs (1): 9DA1F
* list -> : stores the list of variables found
MESStoFnl:
        :: ' LAM MSFnl STO ;                     * 9DACE

* ROMPTR 0E4 005
* refs (1): 9DA1F
* # -> : stores the number of variables to find
MESStoNumVar:
        :: ' LAM MSNumVar STO ;                  * 9DAF3

* ROMPTR 0E4 006
* refs (1): 9DA1F
* # -> : stores the count of variables found
MESStoNf:
        :: ' LAM MSnf STO ;                      * 9DB1E

* ROMPTR 0E4 007
* refs (1): 9DA1F
* # -> : stores the count of variables found, kept for the final test
MESStoTnf:
        :: ' LAM MStnf STO ;                     * 9DB41

* ROMPTR 0E4 008
* refs (1): 9DA1F
* flag -> : stores whether the result flags have been reset in this search
MESStoRnflg:
        :: ' LAM MSRnflg STO ;                   * 9DB66

* ROMPTR 0E4 009
* refs (1): 9DA1F
* # -> : stores the search mode
MESStoMflg:
        :: ' LAM MSMflg STO ;                    * 9DB8F

* ROMPTR 0E4 00A
* refs (1): 9DA1F
* # -> : stores the count of variables found in this pass
MESStoNftp:
        :: ' LAM MSnftp STO ;                    * 9DBB6

* ROMPTR 0E4 00B
* refs (1): 9DA1F
* set -> : starts the solver from an Equation Library set: makes Mpar, stores the equations in EQ and shows the menu
MESStart:
        :: DUPDUP LENCOMP NTHCOMPDROP LENCOMP BINT0 SWAP NDUPN {}N >TCOMP * 9DBDD
          SWAP >TCOMP NULL{} >TCOMP DUP XLIB MESStoMpar DUPLENCOMP #4- * 9DC0F
          ONESWAP SUBCOMP ' ID EQ XEQSTOID ' XLIB MESMenu ' InitMenu ; * 9DC3D

* ROMPTR 0E4 00C
* refs (1): 9DA1F
* -> {}: the solver's menu: the variables, ALL, and MUSER and MCALC unless user flag 63 is set. Shows the title
MESMenu:
        :: ' ID Mpar SAFE@ NOTcase XLIB MESErrMpar * 9DC7B
          OCRC SWAPDROP ' DROP ' XLIB MESReview BINT3 ::N ReviewKey! ' * 9DCA9
          XLIB MESLabel LabelDef! ' XLIB MESKey MenuKeyNS! ' XLIB MESKeyLS * 9DCE1
          MenuKeyLS! ' XLIB MESKeyRS MenuKeyRS! XLIB MESVars BINT6 #/ DROP * 9DD16
          BINT6 SWAP#- DUPONE #<> ITE            * 9DD4A
          :: ONE_DO NULL$ >TCOMP LOOP ; DROP     * 9DD63
          $ "ALL" >TCOMP BINT63 TestUserFlag ?SKIP * 9DD86
          :: INNERCOMP ' XLIB MUSER ' XLIB MCALC NULL$ DUP 2DUP 7ROLL #6+ * 9DDAA
            {}N ;                                * 9DDED
          GDISPON? ?SEMI                         * 9DDF7
          ZEROZERO XLIB MESTitle Clr16 XLIB TitleBar$>Grob XYGROBDISP * 9DE01
          SetDA1Temp ;                           * 9DE26

* ROMPTR 0E4 00D
* refs (1): 9DA1F
* ob -> grob: draws a menu label for a variable by its flags: bit 0 user-defined, bit 1 computed. Remakes the menu if Mpar has changed
MESLabel:
        :: ERRSET                                * 9DE30
          :: ' ID Mpar SAFE@ NOT IT ERRJMP       * 9DE3A
            OCRC SWAPDROP                        * 9DE67
            CODE                                 * 9DE71  14 nibbles
              LC(5)   #807C5                     * 9DE7B
              GOVLNG  SysPtr@                    * 9DE82
            ENDCODE                              * 9DE89
            CARCOMP EQUAL NOT IT                 * 9DE89
            :: XLIB ~MESRclEqn DROP ' XLIB MESMenu InitMenu DROP BINT1 GETDF ; * 9DE9D
          ;                                      * 9DEDB
          ERRTRAP                                * 9DEE0
          :: %3 InitMenu% DROP BINT1 GETDF ; dIDNTNcase * 9DEE5
          :: DUP NULL$ EQUAL ITE MakeInvLabel    * 9DF0D
            :: DUP $ "VECTR" EQUAL ITE MakeDirLabel MakeStdLabel * 9DF2B
            ;                                    * 9DF5D
            Grob>Menu ;                          * 9DF62
          DUP XLIB MESVarFlag SWAP ID>$ OVER BINT2 #AND #0<> ITE * 9DF6C
          :: SWAP BINT1 #AND #0<> ITE MakeBoxLabel * 9DF9F
            :: BINT14 BINT10                     * 9DFC2
              GROBW   "images/9DFD1.png" 21      * 9DFD1  21 x 8; the padding (gray) is not zero
              HiMakeLabel ;                      * 9E015
          ;                                      * 9E01F
          :: SWAP BINT1 #AND #0<> ITE MakeStdLabel MakeInvLabel * 9E024
          ;                                      * 9E04C
          Grob>Menu ;                            * 9E051

* ROMPTR 0E4 00E
* refs (1): 9DA1F
* id -> #: position of the name in the variable list, 0 if absent
MESVarPos:
        :: XLIB MESVars DROPSWAP EQUALPOSCOMP ;  * 9E05B

* ROMPTR 0E4 00F
* refs (1): 9DA1F
* id -> #flag: the flags of a variable
MESVarFlag:
        :: XLIB ~MESRclEqn DUP DUPLENCOMP DUP 3UNROLL #3- NTHCOMPDROP 4ROLL * 9E07A
          EQUALPOSCOMP 3UNROLL #2- NTHCOMPDROP SWAP NTHCOMPDROP ; * 9E0AD

* ROMPTR 0E4 010
* refs (1): 9DA1F
* id #flag -> : sets the flags of a variable in Mpar
MESSetFlag:
        :: SWAP XLIB MESVarPos XLIB MESFlags PUTLIST XLIB ~MESRclEqn * 9E0D0
          DUPLENCOMP #2- SWAP PUTLIST XLIB MESStoMpar ; * 9E100

* ROMPTR 0E4 011
* refs (1): 9DA1F
* list -> : wraps the list as library data with tag #E4, stores it in Mpar, and refreshes the review key when the solver menu is up
MESStoMpar:
        :: # E4 SWAP TWO{}N DUP OSIZE            * 9E124
          CODE                                   * 9E147  71 nibbles
            GOSBVL  POP#                         * 9E151
            R1=A.F  A                            * 9E158
            GOSBVL  SAVPTR                       * 9E15E
            A=DAT1  A                            * 9E165
            D1=A                                 * 9E168
            LC(5)   DOEXT0                       * 9E16B
            DAT1=C  A                            * 9E172
            D1=D1+  5                            * 9E175
            C=R1.F  A                            * 9E178
            C=C-CON A,5                          * 9E17E
            DAT1=C  A                            * 9E184
            GOSBVL  GETPTR                       * 9E187
            A=DAT0  A                            * 9E18E
            D0=D0+  5                            * 9E191
            PC=(A)                               * 9E194
          ENDCODE                                * 9E198
          DUP ' ID Mpar XEQSTOID                 * 9E198
          CODE                                   * 9E1B6  14 nibbles
            LC(5)   #807C5                       * 9E1C0
            GOVLNG  SysPtr@                      * 9E1C7
          ENDCODE                                * 9E1CE
          DUPTYPECOL? NOTcasedrop DROP           * 9E1CE
          BINT3 NTHELCOMP NOTcase DROP           * 9E1DD
          ' XLIB MESReview EQUAL NOTcase DROP    * 9E1F1
          OCRC SWAPDROP ' DROP ' XLIB MESReview BINT3 ::N ReviewKey! ; * 9E210

* ROMPTR 0E4 012
* refs (1): 9DA1F
* -> {}: recalls Mpar, checks that it is library data of this library, and gives its list: the equations, then the variable list, the flags, the title and the results. Error "Invalid Mpar" otherwise
~MESRclEqn:
        :: ' ID Mpar SAFE@ NOTcase XLIB MESErrMpar * 9E248
          TOTEMPOB DUP XLIB ~UTTYPEEXT0? NOTcasedrop XLIB MESErrMpar * 9E276
          CODE                                   * 9E29B  64 nibbles
            C=DAT1  A                            * 9E2A5
            CD1EX                                * 9E2A8
            RSTK=C                               * 9E2AB
            D1=D1+  10                           * 9E2AD
            A=DAT1  A                            * 9E2B0
            LC(5)   #000E4                       * 9E2B3
            ?C#A    A                            * 9E2BA
            GOYES   ~MESRclEqn.L1                * 9E2BD
            D1=D1-  10                           * 9E2BF
            LC(5)   DOLIST                       * 9E2C2
            DAT1=C  A                            * 9E2C9
            D1=D1+  5                            * 9E2CC
            LC(5)   DOBINT                       * 9E2CF
            DAT1=C  A                            * 9E2D6
~MESRclEqn.L1:
            C=RSTK                               * 9E2D9
            D1=C                                 * 9E2DB
            GOVLNG  PushF/TLoop                  * 9E2DE
          ENDCODE                                * 9E2E5
          NOTcasedrop XLIB MESErrMpar            * 9E2E5
          INCOMPDROP SWAPDROP ;                  * 9E2F5

* ROMPTR 0E4 013
* refs (1): 9DA1F
* -> {vars} #n: the variable list and its length
MESVars:
        :: XLIB ~MESRclEqn DUPLENCOMP #3- NTHCOMPDROP DUPLENCOMP ; * 9E304

* ROMPTR 0E4 014
* refs (1): 9DA1F
* -> {eqs} #n: the equations and their number
MESEqns:
        :: XLIB ~MESRclEqn DUPLENCOMP #4- ONESWAP 3UNROLL 3PICK SUBCOMP SWAP ; * 9E32D

* ROMPTR 0E4 015
* refs (1): 9DA1F
* -> $: the title
MESTitle:
        :: XLIB ~MESRclEqn DUPLENCOMP #1- NTHCOMPDROP ; * 9E365

* ROMPTR 0E4 016
* refs (1): 9DA1F
* -> {}: the list of { id eq# } pairs of the solution found so far
MESResults:
        :: XLIB ~MESRclEqn DUPLENCOMP NTHCOMPDROP ; * 9E389

* ROMPTR 0E4 017
* refs (1): 9DA1F
* {} -> : stores that list into Mpar
MESStoResults:
        :: XLIB ~MESRclEqn DUPLENCOMP SWAP PUTLIST XLIB MESStoMpar ; * 9E3A8

* ROMPTR 0E4 018
* refs (1): 9DA1F
* -> {}: the flags of all variables
MESFlags:
        :: XLIB ~MESRclEqn DUPLENCOMP #2- NTHCOMPDROP ; * 9E3D7

* ROMPTR 0E4 019
* refs (1): 9DA1F
* {} -> : stores the flags into Mpar
MESStoFlags:
        :: XLIB ~MESRclEqn DUPLENCOMP #2- SWAP PUTLIST XLIB MESStoMpar ; * 9E3FB

* ROMPTR 0E4 01A
* refs (1): 9DA1F
* Review key: shows the title and the values of the six menu keys
MESReview:
        :: BlankDA12 XLIB MESTitle DISPSTATUS2 BINT7 ONE_DO INDEX@ DUP * 9E42F
          GETPROC >Review$ INDEX@ #1+ DISPN LOOP SetDA12Temp SetDA3NoCh ; * 9E45D
        ROMPBODY 0AB 06F                         * 9E48A  MSOLVR

* ROMPTR 0E4 01B
* refs (1): 9DA1F
* Unshifted menu key. A variable stores or recalls by the usual name key; ALL clears the flags
MESKey:
        :: ERRSET XLIB ~MESRclEqn ERRTRAP        * 9E490
          :: DROP DoBadKey RDROP ; DROP DUPTYPECSTR? case * 9E4AA
          :: ImmedEntry? NOTcase StdMenuKeyNS    * 9E4D2
            DUP $ "ALL" EQUALcasedrp             * 9E4E6
            :: XLIB MESClrUser XLIB MESClrFound ; * 9E500
            DROP DoBadKey ;                      * 9E520
          ImmedEntry? NOTcase StdMenuKeyNS       * 9E52F
          DUPTYPEROMP? case StdMenuKeyNS         * 9E53E
          ' XLIB MESStoKey DoNameKeyLRS ;        * 9E54D

* ROMPTR 0E4 01C
* refs (1): 9DA1F
* ob id -> : stores a value through a menu key: keeps the unit, shows the value, marks the variable user-defined and clears the computed flags
MESStoKey:
        :: CK2NOLASTWD STRIPTAGSl2 XLIB MESChkCircular DUPSAFE@ IT KeepUnit * 9E567
          2DUP XEQStoKey DUPROT PromptIdUtil DISPSTATUS2 SetDA1Valid BINT1 * 9E590
          XLIB MESSetFlag XLIB MESClrFound ;     * 9E5B3

* ROMPTR 0E4 01D
* refs (1): 9DA1F
* Clears the user-defined bit of all variables
MESClrUser:
        :: BINT0 XLIB MESFlags INNERDUP ZERO_DO #1-SWAP BINT2 #AND psh1& * 9E5CE
          LOOP DROP {}N XLIB MESStoFlags ;       * 9E601

* ROMPTR 0E4 01E
* refs (1): 9DA1F
* Clears the computed bit of all variables and empties the result list
MESClrFound:
        :: BINT0 XLIB MESFlags INNERDUP ZERO_DO #1-SWAP BINT1 #AND psh1& * 9E620
          LOOP DROP {}N XLIB MESStoFlags NULL{} XLIB MESStoResults ; * 9E653

* ROMPTR 0E4 01F
* refs (1): 9DA1F
* {vars} -> : marks each user-defined variable in the list as used in the solution (flags 3)
MESMarkUsed:
        :: INNERDUP ZERO_DO #1-SWAP DUP XLIB MESVarFlag BINT1 EQUAL ITE * 9E682
          :: BINT3 XLIB MESSetFlag ; DROP        * 9E6B5
          LOOP DROP ;                            * 9E6D4

* ROMPTR 0E4 020
* refs (1): 9DA1F
* ob id -> ob id: Circular Reference error if the object contains the name of a variable of the set
MESChkCircular:
        :: OVER XLIB MESVars DROP matchob? casedrop * 9E6E3
          :: CK1NOLASTWD SETCIRCERR ERRJMP ;     * 9E707
          DROP ;                                 * 9E720
        ROMPBODY 0AB 06F                         * 9E72A  MSOLVR

* ROMPTR 0E4 021
* refs (1): 9DA1F
* Right-shifted menu key. On ALL: the results browser. On a variable: toggles user-defined under user flag 63, otherwise recalls
MESKeyRS:
        :: ERRSET XLIB ~MESRclEqn ERRTRAP        * 9E730
          :: DROP DoBadKey RDROP ; DROP DUPTYPECSTR? case * 9E74A
          :: ImmedEntry? NOTcase StdMenuKeyNS    * 9E772
            DUP $ "ALL" EQUALcase XLIB MESBrowse * 9E786
            DROP DoBadKey ;                      * 9E7AB
          BINT63 TestUserFlag NOTcase DoNameKeyRS * 9E7BA
          DUP XLIB MESVarFlag DUP BINT1 #AND #0<> ITE * 9E7CE
          :: BINT2 #AND ;                        * 9E7F7
          :: BINT1 #+ ;                          * 9E80B
          XLIB MESSetFlag XLIB MESClrFound ;     * 9E81F

* ROMPTR 0E4 022
* refs (1): 9DA1F
* Solves for all unknowns. Error "All Variables Known" if there are none
MESSolveAll:
        :: SWAP XLIB MESUserVars DUP LENCOMP XLIB MESVars SWAPDROP 2DUP#= * 9E83A
          casedrop                               * 9E86E
          :: 4DROP XLIB MESErrKnown ;            * 9E873
          BINT1 ZEROFALSE BINT1 BINT9 ROLL XLIB MESSearch ; * 9E88D
        ROMPBODY 0AB 074                         * 9E8B6  MROOT

* ROMPTR 0E4 023
* refs (1): 9DA1F
* Left-shifted menu key: solves for this variable, or for all on ALL
MESKeyLS:
        :: ERRSET XLIB ~MESRclEqn ERRTRAP        * 9E8BC
          :: DROP DoBadKey RDROP ; DROP DUPTYPECSTR? case * 9E8D6
          :: ImmedEntry? NOTcase StdMenuKeyNS    * 9E8FE
            DUP $ "ALL" EQUALcase                * 9E912
            :: TRUE XLIB MESSolveAll ;           * 9E92C
            DROP DoBadKey ;                      * 9E946
          DUPTYPEIDNT? ImmedEntry? ANDNOTcase StdMenuKeyNS * 9E955
          { LAM temp } BIND CK0NOLASTWD LAM temp ABND TRUE' XLIB MESSolveVar * 9E969
          COLA_EVAL ;                            * 9E9B0

* ROMPTR 0E4 024
* refs (1): 9DA1F
* id flag -> : solves for one variable
MESSolveVar:
        :: SWAP XLIB MESUserVars OVER XLIB MESDropVar DUPLENCOMP * 9E9BA
          XLIB MESVars SWAPDROP BINT1 ZEROFALSE BINT0 BINT9 ROLL * 9E9E4
          XLIB MESSearch ;                       * 9EA0D

* ROMPTR 0E4 025
* refs (1): 9DA1F
* Binds the search locals and runs the search: repeated passes over the equations, solving any that has one unknown, until the target is found or a pass finds nothing. Shows "Searching"; error "Too Many Unknowns" when stuck
MESSearch:
        :: RDROP DUP IT                          * 9EA1D
          :: BlankDA12 # E408 JstGetTHEMESG DISPROW1 ; * 9EA31  "Searching"
          ERRSET                                 * 9EA54
          ::                                     * 9EA59
            {                                    * 9EA5E

* ROMPTR 0E4 026
* refs (1): 9DA1F
* -> ob: recalls local MSTargetId
MESTarget:
              LAM MSTargetId                     * 9EA63

* ROMPTR 0E4 027
* refs (1): 9DA1F
* -> {}: recalls local MSFnl
MESFnl:
              LAM MSFnl                          * 9EA7E

* ROMPTR 0E4 028
* refs (1): 9DA1F
* -> #: recalls local MSnf
MESNf:
              LAM MSnf                           * 9EA8F

* ROMPTR 0E4 029
* refs (1): 9DA1F
* -> #: recalls local MSNumVar
MESNumVar:
              LAM MSNumVar                       * 9EA9E

* ROMPTR 0E4 02A
* refs (1): 9DA1F
* -> #: recalls local MSnftp
MESNftp:
              LAM MSnftp                         * 9EAB5

* ROMPTR 0E4 02B
* refs (1): 9DA1F
* -> #: recalls local MStnf
MESTnf:
              LAM MStnf                          * 9EAC8

* ROMPTR 0E4 02C
* refs (1): 9DA1F
* -> flag: recalls local MSRnflg
MESRnflg:
              LAM MSRnflg                        * 9EAD9

* ROMPTR 0E4 02D
* refs (1): 9DA1F
* -> #: recalls local MSMflg
MESMflg:
              LAM MSMflg                         * 9EAEE

* ROMPTR 0E4 02E
* refs (1): 9DA1F
* -> flag: recalls local MSMsgFlg: TRUE to show progress
MESMsgFlg:
              LAM MSMsgFlg }                     * 9EB01
            BIND NULL{} XLIB MESStoResults XLIB MESMflg BINT1 EQUAL ?SKIP * 9EB1D
            :: XLIB MESEqns SWAPDROP #1+_ONE_DO INDEX@ XLIB MESEqVars * 9EB4C
              XLIB MESFnl XLIB MESOneUnknown IT  * 9EB76
              :: DUP XLIB MESTarget EQUAL ITE    * 9EB91
                :: XLIB MESSolveEq BINT0 ISTOPSTO BINT0 XLIB MESStoNftp * 9EBB0
                  BINT1 XLIB MESStoTnf NOTcase   * 9EBDA
                  :: XLIB MESMsgFlg IT SetDA1Temp * 9EBEF
                    $ "Int" XLIB MESStoTarget ;  * 9EC09
                  XLIB MESMsgFlg ITE ID>TAG DROP * 9EC29
                ;                                * 9EC43
                DROP                             * 9EC48
              ;                                  * 9EC4D
              LOOP ;                             * 9EC52
            BEGIN XLIB MESNftp BINT0 #> WHILE    * 9EC5C
            :: BINT0 XLIB MESStoNftp XLIB MESEqns SWAPDROP #1+_ONE_DO * 9EC7B
              XLIB MESMsgFlg IT                  * 9ECA5
              :: # E408 JstGetTHEMESG DISPROW1 ; * 9ECB5  "Searching"
              INDEX@ XLIB MESEqVars XLIB MESFnl XLIB MESOneUnknown IT * 9ECD3
              :: XLIB MESSolveEq NOTcase         * 9ECFE
                :: BINT0 ISTOPSTO BINT0 XLIB MESStoNftp BINT1 XLIB MESStoTnf * 9ED13
                  XLIB MESMsgFlg IT SetDA1Temp   * 9ED42
                  $ "Int" XLIB MESStoTarget ;    * 9ED57
                DUP XLIB MESTarget EQUAL XLIB MESMflg BINT0 EQUAL ANDcase * 9ED77
                :: XLIB MESMsgFlg ITE ID>TAG DROP * 9EDA6
                  BINT0 ISTOPSTO BINT0 XLIB MESStoNftp XLIB MESTnf #1+ * 9EDC5
                  XLIB MESStoTnf ;               * 9EDEF
                SWAPDROP XLIB MESFnl SWAP >TCOMP XLIB MESStoFnl XLIB MESNf * 9EDFF
                #1+DUP XLIB MESStoNf XLIB MESTnf #1+ XLIB MESStoTnf * 9EE2F
                XLIB MESNftp #1+ XLIB MESStoNftp XLIB MESNumVar #=case * 9EE5A
                :: BINT0 ISTOPSTO ;              * 9EE85
              ;                                  * 9EE99
              LOOP ;                             * 9EE9E
            REPEAT XLIB MESTarget $ "Int" EQUAL case * 9EEA8
            :: XLIB MESMsgFlg ABND NOT ?SEMI     * 9EED2
              FLUSHKEYS ATTNFLGCLR # A03 GETTHEMESG APPprompt1! SetDA1Temp ; * 9EEF1  "Interrupted"
            XLIB MESMflg BINT0 EQUAL case        * 9EF19
            :: XLIB MESTarget XLIB MESVarFlag BINT2 #<>case * 9EF33
              :: XLIB MESMsgFlg ?SKIP XLIB MESTarget * 9EF58
                ABND CK0NOLASTWD XLIB MESErrUnknowns ; * 9EF78
              ABND ;                             * 9EF92
            XLIB MESTnf ABND #0=case XLIB MESErrUnknowns * 9EF9C
          ;                                      * 9EFBC
          ERRTRAP                                * 9EFC1
          :: ERROR@ #0= IT                       * 9EFC6
            :: ATTN# ERRORSTO ;                  * 9EFDA
            ERRJMP ;                             * 9EFEE
        ;                                        * 9EFF8

* ROMPTR 0E4 02F
* refs (1): 9DA1F
* id -> id TRUE | FALSE: solves the equation of this loop index for the name: shows "Solving for ...", runs SYMBNUMSOLVE, shows the outcome, stores the result and flags. FALSE after an interrupt
MESSolveEq:
        :: XLIB MESRnflg ?SKIP XLIB MESClrFound  * 9EFFD
          TRUE XLIB MESStoRnflg DUP ID>$ # E407 JstGetTHEMESG SWAP&$ * 9F01D  "Solving for "
          XLIB MESMsgFlg ITE DISPROW1 DROP       * 9F04B
          ' ID Mpar SAFE@ DROP OCRC SWAPDROP     * 9F065
          { nohalt NULLLAM } BIND XLIB ~MESRclEqn INDEX@ NTHCOMPDROP * 9F08D
          DUPTYPESYMB? IT                        * 9F0BB
          :: nohalt BINT1 {}N uncrunch XEQSHOWLS DUPTYPESYMB? IT SYMCOLCT * 9F0C5
            ' ID Mpar SAFE@ NOTcase XLIB MESErrMpar * 9F0F2
            OCRC SWAPDROP 1GETLAM EQUAL NOTcase XLIB MESErrMpar * 9F11B
          ;                                      * 9F13F
          nohalt DUP SAFE@ ?SKIP %0_2A2B4        * 9F144
          SYMBNUMSOLVE                           * 9F15D
          { NULLLAM NULLLAM } BIND CK0NOLASTWD 2GETLAM 1GETLAM ABND ?SKIP * 9F162
          ERROROUT                               * 9F194
          ' ID Mpar SAFE@ NOTcase XLIB MESErrMpar * 9F199
          OCRC SWAPDROP 1GETLAM EQUAL NOTcase XLIB MESErrMpar * 9F1C2
          DUP ATTN# #=case ERROROUT              * 9F1E6
          GETTHEMESG SWAP nohalt ABND DUPDUP SAFE@ ITE PromptIdUtil * 9F1FA
          :: ID>$ $ ": Undefined" !append$ ;     * 9F222
          XLIB MESMsgFlg ITE                     * 9F256
          :: DISPROW2 ROT DISPROW3 ;             * 9F266
          :: DROP ROTDROP ;                      * 9F27F
          DUPINDEX@ TWO{}N XLIB MESResults SWAP >TCOMP XLIB MESStoResults * 9F293
          2DUP XEQSTOID DUP BINT2 XLIB MESSetFlag INDEX@ XLIB MESEqVars * 9F2BD
          XLIB MESMarkUsed TRUE ;                * 9F2EC

* ROMPTR 0E4 030
* refs (1): 9DA1F
* Error "Too Many Unknowns"
MESErrUnknowns:
        :: # E404 ERROROUT ;                     * 9F301  "Too Many Unknowns"

* ROMPTR 0E4 031
* refs (1): 9DA1F
* Error "Invalid Mpar"
MESErrMpar:
        :: # E401 ERROROUT ;                     * 9F31A  "Invalid Mpar"

* ROMPTR 0E4 032
* refs (1): 9DA1F
* Error "Illegal During MROOT"
MESErrMROOT:
        :: # E406 ERROROUT ;                     * 9F333  "Illegal During MROOT"

* ROMPTR 0E4 033
* refs (1): 9DA1F
* Error "All Variables Known"
MESErrKnown:
        :: # E405 ERROROUT ;                     * 9F34C  "All Variables Known"

* ROMPTR 0E4 034
* refs (1): 9DA1F
* Error "Single Equation"
MINIT~2:
        :: # E402 ERROROUT ;                     * 9F365  "Single Equation"

* ROMPTR 0E4 035
* refs (1): 9DA1F
* Error "EQ Invalid for MINIT"
MINIT~3:
        :: # E403 ERROROUT ;                     * 9F37E  "EQ Invalid for MINIT"

* ROMPTR 0E4 036
* refs (1): 9DA1F
* {vars} {found} -> id TRUE | FALSE: the single variable of the list that is neither found nor stored; FALSE if there are none or several
MESOneUnknown:
        :: ZEROZERO 2SWAP OVER LENCOMP DUP#0=case * 9F397
          :: 5DROP FALSE ;                       * 9F3B5
          #1+_ONE_DO OVER INDEX@ NTHCOMDDUP 3PICKSWAP EQUALPOSCOMP #0=ITE * 9F3C9
          :: DROP 4ROLLDROP INDEX@ 4UNROLL ROT #1+ 3UNROLL ; * 9F3EC
          :: SAFE@ caseDROP 4ROLLDROP            * 9F419
            INDEX@ 4UNROLL ROT #1+ 3UNROLL ;     * 9F42D
          LOOP DROPSWAP #1=case                  * 9F44B
          :: SWAP NTHCOMPDROP TRUE ;             * 9F45A
          2DROPFALSE ;                           * 9F473

* ROMPTR 0E4 037
* refs (1): 9DA1F
* #eq -> {vars}: the variables of an equation
MESEqVars:
        :: XLIB ~MESRclEqn SWAP NTHCOMPDROP NULL{} * 9F47D
          { LAM vlist } BIND XLIB MESCollectVars LAM vlist ABND ; * 9F49C

* ROMPTR 0E4 038
* refs (1): 9DA1F
* ob -> : adds the names in the object to local vlist, going into both branches of IFTE
MESCollectVars:
        :: INNERCOMP ZERO_DO                     * 9F4E2
          :: DUPTYPEIDNT? case                   * 9F4F1
            :: LAM vlist SWAP apndvarlst ' LAM vlist STO ; * 9F500
            ' xIFTE EQUAL NOT?SEMI               * 9F540
            XLIB MESCollectVars XLIB MESCollectVars ZEROZERO ; * 9F554
          LOOP ;                                 * 9F574

* ROMPTR 0E4 039
* refs (1): 9DA1F
* flag -> {vars}: the variables with the user-defined bit set
MESUserVars:
        :: XLIB MESVars DROP ZEROSWAP INNERCOMP DUP#0_DO #1-SWAP DUP * 9F57E
          XLIB MESVarFlag BINT1 #AND #0<> ITE psh1& DROP * 9F5AC
          LOOP DROP {}N ;                        * 9F5D5

* ROMPTR 0E4 03A
* refs (1): 9DA1F
* {vars} id -> {vars}': removes the name from the list
MESDropVar:
        :: OVERSWAP EQUALPOSCOMP DUP#0=case DROP * 9F5E9
          SWAPINCOMP get1 OVERSWAP #- #2+ROLL DROP #1-{}N ; * 9F602

* ROMPTR 0E4 03B
* refs (1): 9DA1F
* Shows the solution browser, with VALUE, EQNS, PRINT and EXIT; Bad key if there are no results
MESBrowse:
        :: RDROP DROP XLIB MESResults LENCOMP #0= case DoBadKey * 9F62A
          POLSaveUI ERRSET                       * 9F658
          :: TRUE FALSE                          * 9F662
            {                                    * 9F671

* ROMPTR 0E4 03C
* refs (1): 9DA1F
* -> flag: recalls local 'PC2: TRUE to show values, FALSE to show equations
MESLamPC2:
              LAM 'PC2                           * 9F676

* ROMPTR 0E4 03D
* refs (1): 9DA1F
* -> ob: recalls local 'PC1
MESLamPC1:
              LAM 'PC1 }                         * 9F685
            BIND ClrDAsOK ClrDA1IsStat XLIB MESBrowseMenu XLIB MESTitle * 9F699
            XLIB MESBrowseKeys ONEONE XLIB MESResults RESOROMP * 9F6BE
            XLIB MESBrowseItem NULL{} XLIB ~BRbrowse ABND ; * 9F6DE
          ERRTRAP POLResUI&Err POLRestoreUI ClrDAsOK ; * 9F703

* ROMPTR 0E4 03E
* refs (1): 9DA1F
* #i {results} -> $: the browser's text for an entry: "name: value" or "name: equation"
MESBrowseItem:
        :: DUP#0=case                            * 9F71C
          :: DROP LENCOMP ;                      * 9F726
          NTHCOMPDROP INCOMPDROP XLIB MESLamPC2 ITE * 9F73A
          :: DROP DUPSAFE@ NOTcase               * 9F754
            :: ID>$ $ ": Undefined" !append$ ;   * 9F768
            DUP DO>STR SWAP TYPEEXT? IT          * 9F79C
            :: CDR$ BINT1 OVER LEN$ #1- SUB$ ;   * 9F7B5
            SWAP ID>$ $ ": " !append$SWAP !append$ ; * 9F7DD
          :: SWAP ID>$ $ ": " &$SWAP XLIB ~MESRclEqn SWAP NTHCOMPDROP DO>STR * 9F804
            &$ ;                                 * 9F840
        ;                                        * 9F84A

* ROMPTR 0E4 03F
* refs (1): 9DA1F
* Menu key PRINT: prints the title, and each variable with the equation it came from
MESPrint:
        :: CK0NOLASTWD ERRSET                    * 9F84F
          :: SetEcma94 XLIB MESTitle PRINT XLIB MESResults DUP BINT0 * 9F85E
            XLIB MESBrowseItem #1+ ONE_DO NULL$ PRINT DUP INDEX@ NTHCOMPDROP * 9F88D
            INCOMPDROP DROP DUPSAFE@ ITE         * 9F8BB
            :: DUP EDITDECOMP$ SWAP TYPEEXT? IT  * 9F8CF
              :: CDR$ BINT1 OVER LEN$ #1- SUB$ ; * 9F8ED
              SWAP ID>$ $ ": " !append$SWAP !append$ ; * 9F915
            :: ID>$ $ ": Undefined" !append$ ;   * 9F93C
            PRINT DUP INDEX@ NTHCOMPDROP INCOMPDROP SWAPDROP XLIB ~MESRclEqn * 9F970
            SWAP NTHCOMPDROP DECOMP$ PRINT LOOP NULL$ PRINT DROP ; * 9F999
          ERRTRAP DropSysObs ;                   * 9F9C6

* ROMPTR 0E4 040
* refs (1): 9DA1F
* The browser's menu: VALUE EQNS PRINT EXIT
MESBrowseMenu:
        {                                        * 9F9D5
          {                                      * 9F9DA
            :: TakeOver $ "VALUE" XLIB MESLamPC2 Box/StdLabel ; * 9F9DF
            :: TakeOver XLIB MESLamPC2 ?SKIP     * 9FA12
              :: TRUE XLIB MESStoPC2 XLIB BRinverse XLIB BRDispItems * 9FA2C
                XLIB BRinverse DispMenu ;        * 9FA57
            ;                                    * 9FA6C
          }                                      * 9FA71
          {                                      * 9FA76
            :: TakeOver $ "EQNS" XLIB MESLamPC2 NOT Box/StdLabel ; * 9FA7B
            :: TakeOver XLIB MESLamPC2 IT        * 9FAB1
              :: FALSE XLIB MESStoPC2 XLIB BRinverse XLIB BRDispItems * 9FACB
                XLIB BRinverse DispMenu ;        * 9FAF6
            ;                                    * 9FB0B
          }                                      * 9FB10
          { $ "PRINT"                            * 9FB15
            :: TakeOver XLIB MESPrint ; }        * 9FB2E
          NullMenuKey NullMenuKey                * 9FB4D
          { $ "EXIT"                             * 9FB57
            :: TakeOver XLIB BRdone ; }          * 9FB6E
        }                                        * 9FB8D

* ROMPTR 0E4 041
* refs (1): 9DA1F
* ENTER and ON actions of the browser
MESBrowseKeys:
        { XLIB BRViewItem XLIB BRdone }          * 9FB92

* ROMPTR 0E4 042
* refs (1): 9DA1F
* MINIT: makes Mpar from the list in EQ. Each entry may be an algebraic, program or a name of one, through at most two levels. Errors "Single Equation" and "EQ Invalid for MINIT"; Mpar may not itself be a variable
MINIT~1:
        :: NULL{} DORCLE DUP EqList? NOTcase2drop XLIB MINIT~2 * 9FBB2
          LENCOMP DUP #1= IT XLIB MINIT~2        * 9FBDB
          #1+_ONE_DO DORCLE INDEX@ NTHCOMPDROP   * 9FBFA
          :: DUPTYPESYMB? ?SEMI                  * 9FC0E
            DUPTYPECOL? ?SEMI                    * 9FC1D
            DUPTYPEIDNT? NOTcasedrop XLIB MINIT~3 * 9FC27
            SAFE@ NOTcasedrop XLIB MINIT~3       * 9FC3C
            DUPTYPESYMB? ?SEMI                   * 9FC51
            DUPTYPECOL? ?SEMI                    * 9FC5B
            DUPTYPELIST? NOTcasedrop XLIB MINIT~3 * 9FC65
            CARCOMP DUPTYPESYMB? ?SEMI           * 9FC7A
            DUPTYPECOL? ?SEMI                    * 9FC89
            DUPTYPEIDNT? NOTcasedrop XLIB MINIT~3 * 9FC93
            SAFE@ NOTcasedrop XLIB MINIT~3       * 9FCA8
            DUPTYPESYMB? ?SEMI                   * 9FCBD
            DUPTYPECOL? ?SEMI                    * 9FCC7
            DUPTYPELIST? NOTcasedrop XLIB MINIT~3 * 9FCD1
            CARCOMP DUPTYPESYMB? ?SEMI           * 9FCE6
            DUPTYPECOL? NOTcasedrop XLIB MINIT~3 * 9FCF5
          ;                                      * 9FD0A
          INTEMNOTREF? ?SKIP TOTEMPOB            * 9FD0F
          >TCOMP LOOP DUP INNERCOMP NULL{}       * 9FD1E
          { LAM vlist } BIND BINT0 DO XLIB MESCollectVars LOOP LAM vlist * 9FD37
          ABND DUP ' ID Mpar EQUALPOSCOMP #0<> case XLIB MINIT~3 * 9FD82
          INNERCOMP reversym DUP BINT2 #< case XLIB MINIT~3 * 9FDBA
          {}N >TCOMP $ "EQ" SWAP DUPDUP LENCOMP NTHCOMPDROP LENCOMP BINT0 * 9FDE3
          SWAP NDUPN {}N >TCOMP SWAP >TCOMP NULL{} >TCOMP XLIB MESStoMpar * 9FE19
          CODE                                   * 9FE4C  14 nibbles
            LC(5)   #807C5                       * 9FE56
            GOVLNG  SysPtr@                      * 9FE5D
          ENDCODE                                * 9FE64
          DUPTYPECOL? NOTcase DROP               * 9FE64
          BINT3 NTHELCOMP NOT ?SEMI              * 9FE73
          ' XLIB MESReview EQUAL NOT ?SEMI       * 9FE87
          ' XLIB MESMenu InitMenu ;              * 9FEA6

* ROMPTR 0E4 043
* refs (1): 9DA1F
* $title {vars} -> : MITM: changes the title and the order of the variables in the menu; each must be in Mpar and all must be listed. Bad Argument otherwise
MITM~1:
        :: XLIB MESVars DROP OVER LENCOMP #1+_ONE_DO 2DUPSWAP INDEX@ * 9FEC0
          NTHCOMPDROP EQUALPOSCOMP #0= IT        * 9FEEE
          :: OVER INDEX@ NTHCOMPDROP NULL$ EQUAL ?SEMI * 9FF02
            XLIB BadValueErr ;                   * 9FF25
          LOOP SWAP OVER LENCOMP #1+_ONE_DO 2DUPSWAP INDEX@ NTHCOMPDROP * 9FF35
          EQUALPOSCOMP #0= IT                    * 9FF5D
          :: OVER INDEX@ NTHCOMPDROP NULL$ EQUAL ?SEMI * 9FF6C
            XLIB BadValueErr ;                   * 9FF8F
          LOOP SWAPDROP NULL{}                   * 9FF9F
          { LAM vlist } BIND DUP XLIB MESCollectVars LAM vlist ABND * 9FFAE
          INNERCOMP DUP #2+ PICK SWAP ZERO_DO SWAP XLIB MESDropVar LOOP * 9FFF4
          DUPLENCOMP #0= ITE DROP                * A0027
          :: INNERCOMP ZERO_DO NULL$ EQUAL ?SKIP XLIB BadValueErr * A003B
            LOOP ;                               * A0064
          SWAP DUPTYPECSTR? NOTcase XLIB BadValueErr * A006E
          NULL{} 3PICK LENCOMP #1+_ONE_DO 3PICK INDEX@ NTHCOMPDROP DUP NULL$ * A0088
          EQUAL ITE DROPZERO XLIB MESVarFlag     * A00B5
          >TCOMP LOOP SWAP NULL{} BINT4 {}N XLIB ~MESRclEqn DUP LENCOMP * A00CF
          ONESWAP #4- SUBCOMP SWAP &COMP XLIB MESStoMpar * A0102
          CODE                                   * A0126  14 nibbles
            LC(5)   #807C5                       * A0130
            GOVLNG  SysPtr@                      * A0137
          ENDCODE                                * A013E
          DUPTYPECOL? NOTcase DROP               * A013E
          BINT3 NTHELCOMP NOT ?SEMI              * A014D
          ' XLIB MESReview EQUAL NOT ?SEMI       * A0161
          ' XLIB MESMenu InitMenu ;              * A0180

* ROMPTR 0E4 044
* refs (1): 9DA1F
* id -> : MUSER on a name: marks it user-defined
MUSER~1:
        :: XLIB MESNotInMROOT XLIB MESClrFound BINT1 XLIB MESFlagName ; * A019A

* ROMPTR 0E4 045
* refs (1): 9DA1F
* id -> : MCALC on a name: marks it not user-defined
MCALC~1:
        :: XLIB MESNotInMROOT XLIB MESClrFound BINT0 XLIB MESFlagName ; * A01CA

* ROMPTR 0E4 046
* refs (1): 9DA1F
* {ids} -> : MUSER on a list
MUSER~2:
        :: XLIB MESNotInMROOT DUPNULL{}? case XLIB BadValueErr * A01FA
          BINT1 XLIB MESFlagList ;               * A021F

* ROMPTR 0E4 047
* refs (1): 9DA1F
* {ids} -> : MCALC on a list
MCALC~2:
        :: XLIB MESNotInMROOT DUPNULL{}? case XLIB BadValueErr * A0234
          BINT0 XLIB MESFlagList ;               * A0259

* ROMPTR 0E4 048
* refs (1): 9DA1F
* {ids} #flag -> : sets all the names in the list
MESFlagList:
        :: XLIB MESClrFound OVER DUPLENCOMP #1+_ONE_DO DUPINDEX@ NTHCOMPDROP * A026E
          dIDNTNcase XLIB BadValueErr            * A0297
          3PICK XLIB MESFlagName LOOP 3DROP ;    * A02A7

* ROMPTR 0E4 049
* refs (1): 9DA1F
* id #flag -> : sets a name, Bad Argument if it is not in Mpar
MESFlagName:
        :: OVER XLIB MESVarPos #0=case XLIB BadValueErr * A02C6
          XLIB MESSetFlag ;                      * A02EB

* ROMPTR 0E4 04A
* refs (1): 9DA1F
* "ALL" -> : MUSER on all variables
MUSER~3:
        :: XLIB MESNotInMROOT $ "ALL" EQUALNOTcase XLIB BadValueErr * A02FB
          BINT1 XLIB MESFlagAll ;                * A032B

* ROMPTR 0E4 04B
* refs (1): 9DA1F
* "ALL" -> : MCALC on all variables
MCALC~3:
        :: XLIB MESNotInMROOT $ "ALL" EQUALNOTcase XLIB BadValueErr * A0340
          BINT0 XLIB MESFlagAll ;                * A0370

* ROMPTR 0E4 04C
* refs (1): 9DA1F
* #flag -> : sets all variables
MESFlagAll:
        :: XLIB MESFlags LENCOMP DUP#1- ZERO_DO OVERSWAP LOOP {}N * A0385
          XLIB MESStoFlags ;                     * A03B3

* ROMPTR 0E4 04D
* refs (1): 9DA1F
* id -> : MROOT for a name
MROOT~1:
        :: XLIB MESNotInMROOT DUP XLIB MESVarPos #0=case XLIB BadValueErr * A03C3
          FALSE' XLIB MESSolveVar COLA_EVAL ;    * A03F3

* ROMPTR 0E4 04E
* refs (1): 9DA1F
* "ALL" -> : MROOT for all
MROOT~2:
        :: XLIB MESNotInMROOT DUP $ "ALL" EQUALNOTcase XLIB BadValueErr * A040D
          FALSE' XLIB MESSolveAll COLA_EVAL ;    * A0442

* ROMPTR 0E4 04F
* refs (1): 9DA1F
* Error "Illegal During MROOT" while the search locals are bound
MESNotInMROOT:
        :: ERRSET                                * A045C
          :: XLIB MESMsgFlg DROP TRUE ; ERRTRAP FALSE IT XLIB MESErrMROOT * A0466
        ;                                        * A049F

* ROMPTR 0E4 051
* refs (2): 9DA1F 9DA1F
* Message table of library 0E4
MESMessages:
        CON(5)  DOARRY                           * A04A4  array 8
        LENGTH                                   * A04A9  length, to #A05DD
        CON(5)  DOCSTR                           * A04AE  element type
        CON(5)  1                                * A04B3  dimensions
        CON(5)  8                                * A04B8
        $BODY   "Invalid Mpar"                   * A04BD  1
        $BODY   "Single Equation"                * A04DA  2
        $BODY   "EQ Invalid for MINIT"           * A04FD  3
        $BODY   "Too Many Unknowns"              * A052A  4
        $BODY   "All Variables Known"            * A0551  5
        $BODY   "Illegal During MROOT"           * A057C  6
        $BODY   "Solving for "                   * A05A9  7
        $BODY   "Searching"                      * A05C6  8
        ENDLENGTH                                * A05DD

LIB0E4.hash:
        CON(5)  DOHSTR                           * A05DD  hash table of library 0E4
        LENGTH                                   * A05E2  length, to #A0641
        CON(5)  0                                * A05E7  names of length 1
        CON(5)  0                                * A05EC  names of length 2
        CON(5)  0                                * A05F1  names of length 3
        CON(5)  0                                * A05F6  names of length 4
        CON(5)  0                                * A05FB  names of length 5
        CON(5)  0                                * A0600  names of length 6
        CON(5)  0                                * A0605  names of length 7
        CON(5)  0                                * A060A  names of length 8
        CON(5)  0                                * A060F  names of length 9
        CON(5)  0                                * A0614  names of length 10
        CON(5)  0                                * A0619  names of length 11
        CON(5)  0                                * A061E  names of length 12
        CON(5)  0                                * A0623  names of length 13
        CON(5)  0                                * A0628  names of length 14
        CON(5)  0                                * A062D  names of length 15
        CON(5)  0                                * A0632  names of length 16
        REL(5)  LIB0E4.hash.L1                   * A0637  end of the names
LIB0E4.hash.L1:
        CON(5)  0                                * A063C  command 000 has no name
        ENDLENGTH                                * A0641

LIB0E4.link:
        CON(5)  DOHSTR                           * A0641  link table of library 0E4
        LENGTH                                   * A0646  length, to #A07E5
        REL(5)  MESStoPC3                        * A064B  000 
        REL(5)  MESStoPC2                        * A0650  001 
        REL(5)  MESStoPC1                        * A0655  002 
        REL(5)  MESStoTarget                     * A065A  003 
        REL(5)  MESStoFnl                        * A065F  004 
        REL(5)  MESStoNumVar                     * A0664  005 
        REL(5)  MESStoNf                         * A0669  006 
        REL(5)  MESStoTnf                        * A066E  007 
        REL(5)  MESStoRnflg                      * A0673  008 
        REL(5)  MESStoMflg                       * A0678  009 
        REL(5)  MESStoNftp                       * A067D  00A 
        REL(5)  MESStart                         * A0682  00B 
        REL(5)  MESMenu                          * A0687  00C 
        REL(5)  MESLabel                         * A068C  00D 
        REL(5)  MESVarPos                        * A0691  00E 
        REL(5)  MESVarFlag                       * A0696  00F 
        REL(5)  MESSetFlag                       * A069B  010 
        REL(5)  MESStoMpar                       * A06A0  011 
        REL(5)  ~MESRclEqn                       * A06A5  012 ~MESRclEqn
        REL(5)  MESVars                          * A06AA  013 
        REL(5)  MESEqns                          * A06AF  014 
        REL(5)  MESTitle                         * A06B4  015 
        REL(5)  MESResults                       * A06B9  016 
        REL(5)  MESStoResults                    * A06BE  017 
        REL(5)  MESFlags                         * A06C3  018 
        REL(5)  MESStoFlags                      * A06C8  019 
        REL(5)  MESReview                        * A06CD  01A 
        REL(5)  MESKey                           * A06D2  01B 
        REL(5)  MESStoKey                        * A06D7  01C 
        REL(5)  MESClrUser                       * A06DC  01D 
        REL(5)  MESClrFound                      * A06E1  01E 
        REL(5)  MESMarkUsed                      * A06E6  01F 
        REL(5)  MESChkCircular                   * A06EB  020 
        REL(5)  MESKeyRS                         * A06F0  021 
        REL(5)  MESSolveAll                      * A06F5  022 
        REL(5)  MESKeyLS                         * A06FA  023 
        REL(5)  MESSolveVar                      * A06FF  024 
        REL(5)  MESSearch                        * A0704  025 
        REL(5)  MESTarget                        * A0709  026 
        REL(5)  MESFnl                           * A070E  027 
        REL(5)  MESNf                            * A0713  028 
        REL(5)  MESNumVar                        * A0718  029 
        REL(5)  MESNftp                          * A071D  02A 
        REL(5)  MESTnf                           * A0722  02B 
        REL(5)  MESRnflg                         * A0727  02C 
        REL(5)  MESMflg                          * A072C  02D 
        REL(5)  MESMsgFlg                        * A0731  02E 
        REL(5)  MESSolveEq                       * A0736  02F 
        REL(5)  MESErrUnknowns                   * A073B  030 
        REL(5)  MESErrMpar                       * A0740  031 
        REL(5)  MESErrMROOT                      * A0745  032 
        REL(5)  MESErrKnown                      * A074A  033 
        REL(5)  MINIT~2                          * A074F  034 
        REL(5)  MINIT~3                          * A0754  035 
        REL(5)  MESOneUnknown                    * A0759  036 
        REL(5)  MESEqVars                        * A075E  037 
        REL(5)  MESCollectVars                   * A0763  038 
        REL(5)  MESUserVars                      * A0768  039 
        REL(5)  MESDropVar                       * A076D  03A 
        REL(5)  MESBrowse                        * A0772  03B 
        REL(5)  MESLamPC2                        * A0777  03C 
        REL(5)  MESLamPC1                        * A077C  03D 
        REL(5)  MESBrowseItem                    * A0781  03E 
        REL(5)  MESPrint                         * A0786  03F 
        REL(5)  MESBrowseMenu                    * A078B  040 
        REL(5)  MESBrowseKeys                    * A0790  041 
        REL(5)  MINIT~1                          * A0795  042 
        REL(5)  MITM~1                           * A079A  043 
        REL(5)  MUSER~1                          * A079F  044 
        REL(5)  MCALC~1                          * A07A4  045 
        REL(5)  MUSER~2                          * A07A9  046 
        REL(5)  MCALC~2                          * A07AE  047 
        REL(5)  MESFlagList                      * A07B3  048 
        REL(5)  MESFlagName                      * A07B8  049 
        REL(5)  MUSER~3                          * A07BD  04A 
        REL(5)  MCALC~3                          * A07C2  04B 
        REL(5)  MESFlagAll                       * A07C7  04C 
        REL(5)  MROOT~1                          * A07CC  04D 
        REL(5)  MROOT~2                          * A07D1  04E 
        REL(5)  MESNotInMROOT                    * A07D6  04F 
        REL(5)  MESMessages                      * A07DB  050 
        REL(5)  MESMessages                      * A07E0  051 
        ENDLENGTH                                * A07E5
        BSS     4                                * A07E5  zeros
