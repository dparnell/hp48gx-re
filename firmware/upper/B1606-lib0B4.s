* HP 48GX ROM revision R, #B1606-#B4B31: Library part 0B4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #B1606 in the original ROM).
        RPL

* ROMPTR 0B4 1BC
* refs (1): A2437
ROMP_0B4_1BC:
        ::                                       * B1606
          { BINT40                               * B160B
            :: LAM 'RF ROMPTR 0B5 112 DUPNULLCOMP? ITE BINT0 BINT1 * B1615
            ;                                    * B1646
            BINT43                               * B164B
            :: ROMPTR 0B4 1BD TRUE ; }           * B1650
          EQLookup case                          * B166F
          :: EVAL TRUE ;                         * B1679
          DROPFALSE ;                            * B168D

* ROMPTR 0B4 1BD
* refs (1): A2437
ROMP_0B4_1BD:
        { $ "\\" NullMenuKey NullMenuKey NullMenuKey } * B1697

* ROMPTR 0B4 1BE
* refs (1): A2437
ROMP_0B4_1BE:
        :: BINT7 #=casedrop                      * B16BC
          :: ROMPTR 0B4 1A7 ROMPTR 0B4 1C0 NOT OR ; * B16CB
          BINT55 #<>case FALSE                   * B16F5
          ROMPTR 0B4 1A7 NOT ROMPTR 0B4 1C0 AND TRUE ; * B1704

* ROMPTR 0B4 1BF
* refs (1): A2437
ROMP_0B4_1BF:
        :: BINT7 #=casedrop                      * B172E
          :: ROMPTR 0B4 1C0 NOT ;                * B173D
          BINT55 #<>case FALSE                   * B1757
          ROMPTR 0B4 1C0 TRUE ;                  * B1766

* ROMPTR 0B4 1C0
* refs (1): A2437
ROMP_0B4_1C0:
        :: BINT2 ROMPTR 0B0 0C5 ROMPTR 0B0 099 ; * B177B  ~gFldVal

* ROMPTR 0B4 1C1
* refs (1): A2437
ROMP_0B4_1C1:
        :: ROMPTR 0B0 0AB # B917 BINT1 BINT10 # B918 BINT1 BINT19 # B919 * B17A0
          BINT1 BINT28 # B91A BINT8 BINT37 # B91B BINT50 BINT37 # B91C # 5C * B17E2
          BINT37 'RROMPTR@ ROMPTR 0B4 1C7 BINT61 BINT8 BINT19 BINT9 BINT12 * B1828
          MINUSONE BINT33 # B91D ROMPTR 0B5 143 BINT17 ROMPTR 0B5 144 * B1856
          MINUSONE 'RROMPTR@ ROMPTR 0B4 1C9 BINT85 BINT8 BINT13 BINT9 BINT13 * B1885
          { BINT0 } BINT4 # B91E ROMPTR 0B5 148 BINT4 %0_2A2B4 MINUSONE * B18B3
          'RROMPTR@ ROMPTR 0B4 1CA BINT61 BINT17 BINT43 BINT9 BINT12 * B18EB
          MINUSONE BINT17 # B91F ROMPTR 0B5 149 BINT17 ROMPTR 0B5 14A * B1914
          MINUSONE 'RROMPTR@ ROMPTR 0B4 1CA BINT61 BINT26 BINT67 BINT9 * B1943
          BINT12 MINUSONE BINT17 # B920 ROMPTR 0B5 14D BINT17 ROMPTR 0B5 14E * B196C
          MINUSONE 'RROMPTR@ ROMPTR 0B4 1CA BINT1 BINT35 BINT6 BINT9 BINT32 * B19A0
          MINUSONE MINUSONE # B921 MINUSONE MINUSONE TRUE MINUSONE 'RROMPTR@ * B19CE
          ROMPTR 0B4 1CA BINT43 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE * B19FB
          # B922 MINUSONE MINUSONE FALSE MINUSONE 'RROMPTR@ ROMPTR 0B4 1CA * B1A29
          BINT85 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE # B923 MINUSONE * B1A57
          MINUSONE FALSE MINUSONE BINT6 BINT7 'RROMPTR@ ROMPTR 0B4 1C4 * B1A89
          # B916 ROMPTR 0B4 1C2 BINT7 ROMPTR 0B0 0AA DoInputForm NOT?SEMI * B1AB2
          ROMPTR 0B4 1C3 ;                       * B1AE1

* ROMPTR 0B4 1C2
* refs (1): A2437
ROMP_0B4_1C2:
        :: ROMPTR 0B5 138 ROMPTR 0B5 13A ROMPTR 0B5 13B ROMPTR 0B5 13C * B1AF1
          ROMPTR 0B5 13E ROMPTR 0B5 140 ;        * B1B22

* ROMPTR 0B4 1C3
* refs (1): A2437
ROMP_0B4_1C3:
        :: ROMPTR 0B5 141 ROMPTR 0B5 13F ROMPTR 0B5 13D ROMPTR 0B0 09C * B1B3D
          ROMPTR 0B0 09D COERCE SWAP ROMPTR 0B0 09D ; * B1B6E

* ROMPTR 0B4 1C4
* refs (1): A2437
ROMP_0B4_1C4:
        :: BINT16 #<>case FALSE                  * B1B93
          ROMPTR 0B4 1C5 TrueTrue ;              * B1BA7

* ROMPTR 0B4 1C5
* refs (1): A2437
ROMP_0B4_1C5:
        {                                        * B1BBC
          {                                      * B1BC1
            :: PTR DirLabel: $ "FLAG" ; ROMPTR 0B4 1C6 } * B1BC6
          { $ "(AN(L" ROMPTR 0B0 059 }           * B1BF7  DoKeyCancel
          { $ "OK" ROMPTR 0B0 05A } }            * B1C20  DoKeyOK

* ROMPTR 0B4 1C6
* refs (1): A2437
ROMP_0B4_1C6:
        :: TakeOver ROMPTR 0B0 0C8 ROMPTR 0B4 1C3 ROMPTR 0B4 1CF NOTcase * B1C48  GetFieldVals
          SetDA123NoCh                           * B1C78
          ROMPTR 0B4 1C2 ROMPTR 0B0 0D8          * B1C7D
          :: SetDA1NoCh SetDA2bNoCh SetDA3NoCh ; ; * B1C93

* ROMPTR 0B4 1C7
* refs (1): A2437
ROMP_0B4_1C7:
        :: BINT47 OVER #<>case ROMPTR 0B4 1CA    * B1CB1
          DROP ROMPTR 0B4 1C8 TRUE ;             * B1CD0

* ROMPTR 0B4 1C8
* refs (1): A2437
ROMP_0B4_1C8:
        :: ROMPTR 0B4 1CE case                   * B1CEA
          :: HARDBUFF BINT85 BINT8 BINT97 BINT17 GROB!ZERO DROP ; * B1CFF
          HARDBUFF BINT2 ROMPTR 0B0 012 DROP BINT2 ROMPTR 0B0 0A2 ; * B1D2C

* ROMPTR 0B4 1C9
* refs (1): A2437
ROMP_0B4_1C9:
        :: BINT7 #=casedrop ROMPTR 0B4 1CE       * B1D5B
          BINT55 OVER #<>case ROMPTR 0B4 1CA     * B1D75
          DROP ROMPTR 0B4 1CE NOT TRUE ;         * B1D8F

* ROMPTR 0B4 1CA
* refs (1): A2437
ROMP_0B4_1CA:
        :: BINT8 #<>case FALSE                   * B1DAE
          ROMPTR 0B4 1CB ;                       * B1DC2

* ROMPTR 0B4 1CB
* refs (1): A2437
ROMP_0B4_1CB:
        :: EditExstCase FALSE 2DUP Key>U/SKeyOb  * B1DD2
          { ROMP_0A2_006                         * B1DEB
            :: TakeOver BINT3 ROMPTR 0B4 1CC ; ROMP_0A3_006 * B1DF5
            :: TakeOver BINT4 ROMPTR 0B4 1CD ; } * B1E19
          ' EQUAL SWAP Lookup NOTcase DROPFALSE  * B1E3D
          ROTROT2DROP TrueTrue ;                 * B1E5B

* ROMPTR 0B4 1CC
* refs (1): A2437
ROMP_0B4_1CC:
        :: DUP ROMPTR 0B0 0C5 ?ROMPTR@ ' ROMPTR 0B5 14B ?ROMPTR@ EQUAL ITE * B1E6A  ~gFldVal
          :: BINT18 SysITE                       * B1EA3
            :: ' ROMPTR 0B5 14C ;                * B1EB2
            :: ' ROMPTR 0B5 14A ; ;              * B1ECC
          :: ' ROMPTR 0B5 14B ;                  * B1EEB
          OVER ROMPTR 0B0 0D5 ROMPTR 0B0 0A2 SetDA123NoCh ; * B1F05  ~sFldVal

* ROMPTR 0B4 1CD
* refs (1): A2437
ROMP_0B4_1CD:
        :: DUP ROMPTR 0B0 0C5 ?ROMPTR@ ' ROMPTR 0B5 14E ?ROMPTR@ EQUAL ITE * B1F2A  ~gFldVal
          :: BINT15 SysITE                       * B1F63
            :: ' ROMPTR 0B5 150 ;                * B1F72
            :: ' ROMPTR 0B5 14F ; ;              * B1F8C
          :: ' ROMPTR 0B5 14E ;                  * B1FAB
          OVER ROMPTR 0B0 0D5 ROMPTR 0B0 0A2 SetDA123NoCh ; * B1FC5  ~sFldVal

* ROMPTR 0B4 1CE
* refs (1): A2437
ROMP_0B4_1CE:
        :: BINT1 ROMPTR 0B0 0C5 ?ROMPTR@ ROMPTR 0B5 144 ?ROMPTR@ EQUAL ; * B1FEA  ~gFldVal

* ROMPTR 0B4 1CF
* refs (1): A2437
ROMP_0B4_1CF:
        :: TakeOver NULL{}                       * B201E
          { LAM 'F } BIND 'RROMPTR@ ROMPTR 0B4 1D0 # B935 'RROMPTR@ * B202D
          ROMPTR 0B5 157 NULL{} BINT1 ROMPTR 0B3 000 NOTcase * B2066  ~Choose
          :: ABND FALSE ;                        * B208B
          DROP LAM 'F ABND DUPLENCOMP #0= casedrop FALSE * B209F
          INNERCOMP #2/ ZERO_DO ISTOP-INDEX #2* ROLL ISTOP-INDEX #2* ROLL * B20C8
          ITE SetSysFlag ClrSysFlag              * B20F5
          LOOP TRUE ;                            * B2104

* ROMPTR 0B4 1D0
* refs (1): A2437
ROMP_0B4_1D0:
        ::                                       * B2113
          { BINT60 TRUE BINT62 ROMPTR 0B5 155 BINT80 ROMPTR 0B5 156 BINT81 * B2118
            ROMPTR 0B4 1D2 BINT83                * B214C
            :: ' ROMPTR 0B4 1D3 ; }              * B215C
          EQLookup case                          * B217B
          :: EVAL TRUE ;                         * B2185
          DROPFALSE ;                            * B2199

* ROMPTR 0B4 1D2
* refs (2): A2437 A2437
ROMP_0B4_1D2:
        :: ROMPTR 0B5 156 DUP ROMPTR 0B4 1D5 SWAP KEYINBUFFER? ITE * B21A3
          :: DROPNULL$ _chr(31)_ SetDA2bBad ;    * B21D2
          :: ROMPTR 0B5 157 DUP BINT1 BINT2 SUB$ SWAP BINT4 OVERLEN$ SUB$ ; * B21EB
          $>GROB SWAP $>grob 7GETLAM 8GETLAM MAKEGROB 4ROLL IT * B2228
          :: ROMPTR 0B0 07E OVER ZEROZERO GROB! ; * B2250
          DUPUNROT BINT7 BINT2 GROB! DUPUNROT BINT20 BINT1 GROB! ; * B2274

* ROMPTR 0B4 1D3
* refs (1): A2437
ROMP_0B4_1D3:
        :: NoExitAction                          * B22A1
          { NullMenuKey NullMenuKey              * B22AB
            {                                    * B22BA
              :: TakeOver ROMPTR 0B0 086 ; ROMPTR 0B4 1D4 } * B22BF  ~grobCheckKey
            NullMenuKey                          * B22E9
            { $ "(AN(L" ROMPTR 0B3 02D }         * B22EE  DoCKeyCancel
            { $ "OK" ROMPTR 0B3 02E } }          * B2317  DoCKeyOK
        ;                                        * B233F

* ROMPTR 0B4 1D4
* refs (1): A2437
ROMP_0B4_1D4:
        :: TakeOver 18GETLAM ROMPTR 0B3 03F DUP ROMPTR 0B4 1D5 NOT SWAP * B2344  ~BBGetN
          ROMPTR 0B4 1D6 18GETLAM 6GETLAM ROMPTR 0B3 036 SetDA123NoCh ; * B2378  LEDispItem

* ROMPTR 0B4 1D5
* refs (1): A2437
ROMP_0B4_1D5:
        :: LAM 'F #=Lookup ?SEMI                 * B23A2
          TestSysFlag ;                          * B23BC

* ROMPTR 0B4 1D6
* refs (1): A2437
ROMP_0B4_1D6:
        :: LAM 'F OVER ' #= POSCOMP DUP#0= casedrop * B23C6
          :: SWAP TWO{}N LAM 'F SWAP &COMP ' LAM 'F STO ; * B23F4
          SWAPDROP #1+ LAM 'F PUTLIST ' LAM 'F STO ; * B2432

* ROMPTR 0B4 1D7
* refs (1): A2437
ROMP_0B4_1D7:
        :: ROMPTR 0B0 0AB TRUE # B982 TRUE MINUSONE TRUE ROMPTR 0B4 1D8 * B2466
          caseDROP ;                             * B249F

* ROMPTR 0B4 1D8
* refs (1): A2437
ROMP_0B4_1D8:
        :: SWAP DUPTYPELIST? ?SKIP ONE{}N        * B24A9
          ZEROZERO                               * B24C2
          { LAM 'V LAM 'P LAM 'p LAM 'R LAM 'O LAM 'B LAM 'E } BIND * B24C7
          'RROMPTR@ ROMPTR 0B4 1D9 SPACE$ 'RROMPTR@ ROMPTR 0B5 15D NULL{} * B2523
          BINT1 ROMPTR 0B3 000 NOTcase           * B254D  ~Choose
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
ROMP_0B4_1D9:
        ::                                       * B2612
          { BINT80 ROMPTR 0B4 1E4 BINT70 ROMPTR 0B4 1DA BINT62 * B2617
            :: LAM 'O ROMPTR 0B5 159 ; BINT60 LAM 'V BINT61 LAM 'p BINT83 * B2641
            :: 14GETLAM ITE                      * B2686
              :: ' ROMPTR 0B4 1DD ;              * B2695
              :: ' ROMPTR 0B4 1DC ;              * B26AF
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
ROMP_0B4_1DA:
        :: LAM 'P ~DUPTYPEBINT?;case;JstGetTHEMESG PATHDIR * B2723
          ROMPTR 0B0 075 8GETLAM ROMPTR 0B3 046 3PICK ROMPTR 0B0 071 #- * B273D
          BINT12 #- 14GETLAM ITE BINT8 BINT0     * B276D
          #- ROMPTR 0B0 070 ITE SPACE$ $ " { "   * B278B
          SWAP&$ &$ ;                            * B27B5

* ROMPTR 0B4 1DB
* refs (1): A2437
ROMP_0B4_1DB:
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
ROMP_0B4_1DC:
        :: NoExitAction                          * B28AF
          { NullMenuKey                          * B28B9
            { $ "CHOOS" ROMPTR 0B4 1E0 }         * B28C3
            {                                    * B28EC
              :: TakeOver ROMPTR 0B3 05B 16GETLAM NOT OR ITE NULL$ * B28F1  ~BBEmpty?
                ROMPTR 0B0 086                   * B291F  ~grobCheckKey
              ;                                  * B292A
              { ROMPTR 0B3 02A                   * B292F  DoCKeyCheck
                ROMPTR 0B3 02B                   * B293F  DoCKeyChAll
                ROMPTR 0B3 02C }                 * B294A  DoCKeyUnChAll
            }                                    * B295A
            {                                    * B295F
              :: PTR DirLabel: $ "NEW" ; ROMPTR 0B4 1E5 } * B2964
            { $ "(AN(L" ROMPTR 0B3 02D }         * B2993  DoCKeyCancel
            { $ "OK" ROMPTR 0B3 02E } }          * B29BC  DoCKeyOK
        ;                                        * B29E4

* ROMPTR 0B4 1DD
* refs (1): A2437
ROMP_0B4_1DD:
        :: NoExitAction                          * B29E9
          {                                      * B29F3
            {                                    * B29F8
              :: TakeOver ROMPTR 0B3 05B ITE NULL$ * B29FD  ~BBEmpty?
                :: PTR DirLabel: $ "EDIT" ;      * B2A1C
              ;                                  * B2A3D
              ROMPTR 0B4 1DE }                   * B2A42
            { $ "CHOOS" ROMPTR 0B4 1E0 }         * B2A52
            {                                    * B2A7B
              :: TakeOver ROMPTR 0B3 05B 16GETLAM NOT OR ITE NULL$ * B2A80  ~BBEmpty?
                ROMPTR 0B0 086                   * B2AAE  ~grobCheckKey
              ;                                  * B2AB9
              { ROMPTR 0B3 02A                   * B2ABE  DoCKeyCheck
                ROMPTR 0B3 02B                   * B2ACE  DoCKeyChAll
                ROMPTR 0B3 02C }                 * B2AD9  DoCKeyUnChAll
            }                                    * B2AE9
            {                                    * B2AEE
              :: PTR DirLabel: $ "NEW" ; ROMPTR 0B4 1E5 } * B2AF3
            {                                    * B2B22
              :: TakeOver ROMPTR 0B3 05B ITE NULL$ * B2B27  ~BBEmpty?
                :: PTR DirLabel: $ "COPY" ;      * B2B46
              ;                                  * B2B67
              ROMPTR 0B4 1EE }                   * B2B6C
            {                                    * B2B7C
              :: TakeOver ROMPTR 0B3 05B ITE NULL$ * B2B81  ~BBEmpty?
                :: PTR DirLabel: $ "MOVE" ;      * B2BA0
              ;                                  * B2BC1
              ROMPTR 0B4 1F3 }                   * B2BC6
            {                                    * B2BD6
              :: TakeOver ROMPTR 0B3 05B ITE NULL$ $ "RCL" * B2BDB  ~BBEmpty?
              ;                                  * B2C0A
              ROMPTR 0B4 1ED }                   * B2C0F
            {                                    * B2C1F
              :: TakeOver ROMPTR 0B3 05B ITE NULL$ $ "PURG" * B2C24  ~BBEmpty?
              ;                                  * B2C55
              ROMPTR 0B4 1F6 }                   * B2C5A
            { $ "SIZE" ROMPTR 0B4 1F7 } NullMenuKey * B2C6A
            { $ "(AN(L" ROMPTR 0B3 02D }         * B2C96  DoCKeyCancel
            { $ "OK" ROMPTR 0B3 02E } }          * B2CBF  DoCKeyOK
        ;                                        * B2CE7

* ROMPTR 0B4 1DE
* refs (1): A2437
ROMP_0B4_1DE:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * B2CEC  ~BBEmpty?
          18GETLAM ROMPTR 0B3 03F ROMPTR 0B4 1DF DROP ; * B2D0B  ~BBGetN

* ROMPTR 0B4 1DF
* refs (1): A2437
ROMP_0B4_1DF:
        :: 1LAMBIND # B984 BINT1 BINT19 'DROPFALSE BINT31 BINT17 BINT97 * B2D30
          BINT9 BINT21 MINUSONE BINT4 # B985 # B986 MINUSONE 1GETLAM XEQRCL * B2D62
          DUP ONEONE 'DROPFALSE # B983 DoInputForm NOTcase * B2D99
          :: ABND FALSE ;                        * B2DBC
          1GETABND ROMPTR 0B5 15C TRUE ;         * B2DD0

* ROMPTR 0B4 1E0
* refs (1): A2437
ROMP_0B4_1E0:
        :: TakeOver ROMPTR 0B4 1E1 NOT?SEMI      * B2DEA
          COMPEVAL 0LASTOWDOB! ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM * B2E04
          ROMPTR 0B3 03E                         * B2E3D  ~BBReReadNElems
          ROMPTR 0B3 026 BINT1 12GETLAM #MIN 18PUTLAM FALSE * B2E48  ~BBReReadWidth
          ROMPTR 0B3 019 NULL{} 15PUTLAM OBJ_1A03E ; * B2E6C  ~BBRecalOff&Disp

* ROMPTR 0B4 1E1
* refs (1): A2437
ROMP_0B4_1E1:
        :: 'RROMPTR@ ROMPTR 0B4 1E2 # B987 'RROMPTR@ ROMPTR 0B5 163 NULL{} * B2E8B
          ROMPTR 0B5 15E OVER 4UNROLL            * B2EBF
          { LAM 'TD LAM 'TN LAM 'DC } BIND ROMPTR 0B3 000 ABND SetDA123NoCh * B2ED4  ~Choose
          NOTcaseFALSE NULL{}                    * B2F1F
          SWAP                                   * B2F29
          :: GOTO L_1849B ; TRUE ;               * B2F2E

* ROMPTR 0B4 1E2
* refs (1): A2437
ROMP_0B4_1E2:
        ::                                       * B2F4C
          { BINT80 ROMPTR 0B4 1E3 BINT62 LAM 'DC } EQLookup case * B2F51
          :: EVAL TRUE ;                         * B2F87
          DROPFALSE ;                            * B2F9B

* ROMPTR 0B4 1E3
* refs (1): A2437
ROMP_0B4_1E3:
        :: LAM 'TN #=casedrop                    * B2FA5
          :: ' LAM 'TD undo DROP ;               * B2FBC
          DUP#1= case                            * B2FE2
          :: ' LAM 'TN STOLAM BINT0 ROMPTR 0B5 161 DUP ' LAM 'TD STOLAM ; * B2FEC
          ' LAM 'TD undo DROP SWAP LAM 'TN OVER ' LAM 'TN STOLAM 2DUP #> ITE * B3039
          :: #- ROMPTR 0B5 15F ;                 * B3092
          :: SWAP#- ROMPTR 0B5 161 ;             * B30AC
          DUP ' LAM 'TD STOLAM ;                 * B30C6

* ROMPTR 0B4 1E4
* refs (1): A2437
ROMP_0B4_1E4:
        :: DUP LAM 'B #< OVER LAM 'E #> OR IT    * B30E7
          :: DUPDUP 11GETLAM #+ #1- 12GETLAM #MIN 2DUP ' LAM 'E STOLAM ' * B3120
            LAM 'B STOLAM LAM 'O ' ROMPTR 0B5 15A 4ROLL 4ROLL ROMPTR 0B4 1DB * B3162
            {}N 19PUTLAM ;                       * B31A2
          LAM 'B #- #1+ 19GETLAM SWAP NTHCOMPROM@ * B31B1
          ~DUPTYPEBINT?;case;JstGetTHEMESG ;     * B31D5

* ROMPTR 0B4 1E5
* refs (1): A2437
ROMP_0B4_1E5:
        :: TakeOver ROMPTR 0B4 1E6 NOT?SEMI      * B31DF
          ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM ROMPTR 0B3 03E * B31F9  ~BBReReadNElems
          ROMPTR 0B3 026 BINT1 18PUTLAM FALSE    * B3233  ~BBReReadWidth
          ROMPTR 0B3 019 NULL{} 15PUTLAM ;       * B324D  ~BBRecalOff&Disp

* ROMPTR 0B4 1E6
* refs (1): A2437
ROMP_0B4_1E6:
        :: # B984 BINT1 BINT10 # B989 BINT1 BINT19 # B98A BINT8 BINT28 * B3267
          'RROMPTR@ ROMPTR 0B4 1E9 BINT31 BINT8 BINT97 BINT9 BINT21 MINUSONE * B32A8
          BINT4 # B985 # B986 MINUSONE MINUSONE MINUSONE 'DROPFALSE BINT31 * B32D6
          BINT17 BINT49 BINT9 BINT1              * B3308
          { BINT6 } BINT4 # B98B MINUSONE MINUSONE MINUSONE MINUSONE * B331C
          'RROMPTR@ ROMPTR 0B4 1EA BINT1 BINT26 BINT6 BINT9 BINT32 MINUSONE * B334E
          MINUSONE # B98C MINUSONE MINUSONE FALSE FALSE BINT3 DUP 'RROMPTR@ * B337C
          ROMPTR 0B4 1E7 # B988 14GETLAM ?SKIP   * B33AE
          :: HARDBUFF TOTEMPOB 1LAMBIND ;        * B33CD
          DoInputForm 14GETLAM ?SKIP             * B33E6
          :: 1GETABND HARDBUFF ZEROZERO GROB! ;  * B33F5
          NOTcaseFALSE case                      * B3413
          :: SWAPDROP ROMPTR 0B5 162 TRUE ;      * B341D
          ROMPTR 0B5 15C TRUE ;                  * B343C

* ROMPTR 0B4 1E7
* refs (1): A2437
ROMP_0B4_1E7:
        :: BINT5 #<>case FALSE                   * B3451
          ROMPTR 0B4 1E8 TRUE ;                  * B3465

* ROMPTR 0B4 1E8
* refs (1): A2437
ROMP_0B4_1E8:
        :: BINT39 BINT131 MAKEGROB ROMPTR 0B4 1EC ?SKIP * B347A
          :: BINT1 ROMPTR 0B0 012 ;              * B349E
          BINT2 ROMPTR 0B0 012 BINT1 ROMPTR 0B0 079 IT * B34B8
          :: BINT3 ROMPTR 0B0 012 ;              * B34DD
          FALSE ;                                * B34F7

* ROMPTR 0B4 1E9
* refs (1): A2437
ROMP_0B4_1E9:
        :: BINT7 #=casedrop ROMPTR 0B4 1EC       * B3501
          { BINT55                               * B351B
            :: ROMPTR 0B4 1EC NOT ; BINT47 ROMPTR 0B4 1EB } * B3525
          EQLookup case                          * B3554
          :: EVAL TRUE ;                         * B355E
          DROPFALSE ;                            * B3572

* ROMPTR 0B4 1EA
* refs (1): A2437
ROMP_0B4_1EA:
        :: BINT7 #=casedrop                      * B357C
          :: BINT1 ROMPTR 0B0 079 NOT ;          * B358B
          { BINT55                               * B35AA
            :: BINT1 ROMPTR 0B0 079 ; BINT47 ROMPTR 0B4 1EB } * B35B4
          EQLookup case                          * B35E3
          :: EVAL TRUE ;                         * B35ED
          DROPFALSE ;                            * B3601

* ROMPTR 0B4 1EB
* refs (1): A2437
ROMP_0B4_1EB:
        :: ROMPTR 0B4 1EC case                   * B360B
          :: BINT8 BINT9 BLANKIT ;               * B3620
          BINT1 ROMPTR 0B0 079 NOTcase           * B3639
          :: BINT26 BINT9 BLANKIT ;              * B364E
          HARDBUFF BINT1 ROMPTR 0B0 012 DROP BINT1 ROMPTR 0B0 0A2 HARDBUFF * B3667
          BINT3 ROMPTR 0B0 012 DROP BINT3 ROMPTR 0B0 0A2 ; * B3696

* ROMPTR 0B4 1EC
* refs (1): A2437
ROMP_0B4_1EC:
        :: BINT3 ROMPTR 0B0 0C5 ;                * B36C0  ~gFldVal

* ROMPTR 0B4 1ED
* refs (1): A2437
ROMP_0B4_1ED:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * B36DA  ~BBEmpty?
          15GETLAM DUPNULLCOMP? IT               * B36F9
          :: DROP 18GETLAM ONE{}N ;              * B3708
          INNERCOMP ZERO_DO ISTOP@ ROLL ROMPTR 0B3 03F XEQRCL LOOP * B3721  ~BBGetN
          SetDA123NoCh ;                         * B374A

* ROMPTR 0B4 1EE
* refs (1): A2437
ROMP_0B4_1EE:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * B3754  ~BBEmpty?
          15GETLAM DUPNULLCOMP? IT               * B3773
          :: DROP 18GETLAM ONE{}N ;              * B3782
          DUPLENCOMP #1= ITE                     * B379B
          :: INCOMPDROP ROMPTR 0B3 03F ;         * B37AA  ~BBGetN
          :: INNERCOMP ZERO_DO ISTOP@ ROLL ROMPTR 0B3 03F LOOP 15GETLAM * B37C4  ~BBGetN
            LENCOMP {}N ;                        * B37F2
          ROMPTR 0B4 1EF NOT?SEMI                * B3801
          ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM ROMPTR 0B3 03E * B3811  ~BBReReadNElems
          ROMPTR 0B3 026 BINT1 18PUTLAM FALSE    * B384B  ~BBReReadWidth
          ROMPTR 0B3 019 NULL{} 15PUTLAM ;       * B3865  ~BBRecalOff&Disp

* ROMPTR 0B4 1EF
* refs (1): A2437
ROMP_0B4_1EF:
        :: # B989 BINT1 BINT19 # B98E BINT1 BINT28 'DROPFALSE BINT37 BINT17 * B387F
          BINT91 BINT9 BINT1                     * B38BB
          { BINT6 BINT5 } BINT4 # B98D MINUSONE MINUSONE MINUSONE BINT19 * B38CA
          ROLL                                   * B3901

* ROMPTR 0B4 1F0
* refs (1): A2437
ROMP_0B4_1F0:
          :: 'RROMPTR@ ROMPTR 0B4 1F2 BINT37 BINT26 BINT91 BINT9 BINT5 * B3906
            { BINT6 BINT5 } BINT4 MINUSONE MINUSONE MINUSONE MINUSONE * B3934
            MINUSONE ;                           * B3961
          BINT2 DUP 'RROMPTR@ ROMPTR 0B4 1F1 # B98F DoInputForm NOTcaseFALSE * B396B
          ROMPTR 0B5 164                         * B3999
          TRUE ;                                 * B39A4

* ROMPTR 0B4 1F1
* refs (1): A2437
ROMP_0B4_1F1:
        :: BINT14 #<>case FALSE                  * B39AE
          BINT2 TRUE ;                           * B39C2

* ROMPTR 0B4 1F2
* refs (1): A2437
ROMP_0B4_1F2:
        ::                                       * B39D1
          { BINT37 ROMPTR 0B4 1E1 BINT13         * B39D6
            :: BINT1 ROMPTR 0B0 0C5 TYPELIST? ITE # B990 # B991 * B39F0  ~gFldVal
              ~DUPTYPEBINT?;case;JstGetTHEMESG ; * B3A23
          }                                      * B3A2D
          EQLookup case                          * B3A32
          :: EVAL TRUE ;                         * B3A3C
          DROPFALSE ;                            * B3A50

* ROMPTR 0B4 1F3
* refs (1): A2437
ROMP_0B4_1F3:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * B3A5A  ~BBEmpty?
          15GETLAM DUPNULLCOMP? IT               * B3A79
          :: DROP 18GETLAM ONE{}N ;              * B3A88
          DUPLENCOMP #1= ITE                     * B3AA1
          :: INCOMPDROP ROMPTR 0B3 03F ;         * B3AB0  ~BBGetN
          :: INNERCOMP ZERO_DO ISTOP@ ROLL ROMPTR 0B3 03F LOOP 15GETLAM * B3ACA  ~BBGetN
            LENCOMP {}N ;                        * B3AF8
          ROMPTR 0B4 1F4 NOT?SEMI                * B3B07
          ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM ROMPTR 0B3 03E * B3B17  ~BBReReadNElems
          ROMPTR 0B3 026 BINT1 18PUTLAM FALSE    * B3B51  ~BBReReadWidth
          ROMPTR 0B3 019 NULL{} 15PUTLAM ;       * B3B6B  ~BBRecalOff&Disp

* ROMPTR 0B4 1F4
* refs (1): A2437
ROMP_0B4_1F4:
        :: # B989 BINT1 BINT19 # B992 BINT1 BINT28 'DROPFALSE BINT37 BINT17 * B3B85
          BINT91 BINT9 BINT1                     * B3BC1
          { BINT6 BINT5 } BINT4 # B993 MINUSONE MINUSONE MINUSONE BINT19 * B3BD0
          ROLL ROMPTR 0B4 1F0 BINT2 DUP 'RROMPTR@ ROMPTR 0B4 1F5 # B994 * B3C07
          DoInputForm NOTcaseFALSE ROMPTR 0B5 167 * B3C3B
          TRUE ;                                 * B3C50

* ROMPTR 0B4 1F5
* refs (1): A2437
ROMP_0B4_1F5:
        :: BINT14 #<>case FALSE                  * B3C5A
          BINT2 TRUE ;                           * B3C6E

* ROMPTR 0B4 1F6
* refs (1): A2437
ROMP_0B4_1F6:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * B3C7D  ~BBEmpty?
          15GETLAM DUPNULLCOMP? IT               * B3C9C
          :: DROP 18GETLAM ONE{}N ;              * B3CAB
          DUPLENCOMP #1= ITE                     * B3CC4
          :: INCOMPDROP ROMPTR 0B3 03F ;         * B3CD3  ~BBGetN
          :: INNERCOMP ZERO_DO ISTOP@ ROLL ROMPTR 0B3 03F LOOP 15GETLAM * B3CED  ~BBGetN
            LENCOMP {}N ;                        * B3D1B
          ROMPTR 0B5 168 ZEROZERO ' LAM 'B STOLAM ' LAM 'E STOLAM * B3D2A
          ROMPTR 0B3 03E                         * B3D64  ~BBReReadNElems
          ROMPTR 0B3 026 18GETLAM 12GETLAM #MIN 18PUTLAM FALSE * B3D6F  ~BBReReadWidth
          ROMPTR 0B3 019 NULL{} 15PUTLAM ;       * B3D93  ~BBRecalOff&Disp

* ROMPTR 0B4 1F7
* refs (1): A2437
ROMP_0B4_1F7:
        :: TakeOver ROMPTR 0B3 05B ITE NULL$     * B3DAD  ~BBEmpty?
          :: 15GETLAM DUPNULLCOMP? IT            * B3DCC
            :: DROP 18GETLAM ONE{}N ;            * B3DE0
            DUPLENCOMP #1= ITE                   * B3DF9
            :: INCOMPDROP ROMPTR 0B3 03F ;       * B3E08  ~BBGetN
            :: INNERCOMP ZERO_DO ISTOP@ ROLL ROMPTR 0B3 03F LOOP 15GETLAM * B3E22  ~BBGetN
              LENCOMP {}N ;                      * B3E50
            DUPTYPELIST? ITE                     * B3E5F
            :: DUPLENCOMP #>$ # B995 JstGetTHEMESG &$ ; * B3E69
            :: DUP ID>$ PTR CHR_: >T$ ;          * B3E91
            $ "\0A  " &$ SWAP ROMPTR 0B5 169 #>$ &$ # B997 JstGetTHEMESG &$ * B3EAF
            CHR_Newline >T$ ;                    * B3EF2
          # B996 JstGetTHEMESG &$ $ "\0A  " &$ ROMPTR 0B5 16A #>$ &$ # B997 * B3F01
          JstGetTHEMESG &$ BINT15 BINT15 MINUSONE ' ROMPTR 0B1 002 * B3F49  ~MsgBoxMenu
          ROMPTR 0B1 000 DROP SetDA123NoCh ;     * B3F72  ~DoMsgBox

* ROMPTR 0B4 1F8
* refs (1): A2437
ROMP_0B4_1F8:
        :: 9rolld DROP ROMPTR 0B5 069 DROP ROMPTR 0B5 065 ROMPTR 0B5 039 * B3F8C
          ROMPTR 0B5 035 ROMPTR 0B5 02F ITE      * B3FC1
          :: ROMPTR 0B5 02D DROP ;               * B3FDC
          :: 3DROP ROMPTR 0B5 029 ;              * B3FF6
        ;                                        * B4010

* ROMPTR 0B4 1F9
* refs (1): A2437
ROMP_0B4_1F9:
        :: BINT25 OVER #<>case ROMPTR 0B4 008    * B4015
          DROP 4GETLAM ROMPTR 0B0 0C5 DUPTYPEEXT? 3PICK TYPEREAL? ANDNOTcase * B4034  ~gFldVal
          DROPTRUE                               * B405D
          UM>U TRUE ;                            * B4062

* ROMPTR 0B4 1FA
* refs (1): A2437
ROMP_0B4_1FA:
        :: TakeOver ROMPTR 0B5 149 BINT2 ROMPTR 0B0 0C5 ' * B4071  ~gFldVal
          :: ?ROMPTR@ SWAP ?ROMPTR@ EQUAL ; POSCOMP #0=case DoBadKey * B409B
          BINT2 ROMPTR 0B4 1CC ;                 * B40C8

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
        REL(5)  L_B413C                          * B4137  end of the names
L_B413C:
        CON(5)  0                                * B413C  command 000 has no name
        ENDLENGTH                                * B4141

LIB0B4.link:
        CON(5)  DOHSTR                           * B4141  link table of library 0B4
        LENGTH                                   * B4146  length, to #B4B32
        REL(5)  ROMP_0B4_000                     * B414B  000 
        REL(5)  ROMP_0B4_001                     * B4150  001 
        REL(5)  ROMP_0B4_002                     * B4155  002 
        REL(5)  ROMP_0B4_003                     * B415A  003 
        REL(5)  ROMP_0B4_004                     * B415F  004 
        REL(5)  ROMP_0B4_005                     * B4164  005 
        REL(5)  ROMP_0B4_006                     * B4169  006 
        REL(5)  ROMP_0B4_007                     * B416E  007 
        REL(5)  ROMP_0B4_008                     * B4173  008 
        REL(5)  ROMP_0B4_009                     * B4178  009 
        REL(5)  ROMP_0B4_00A                     * B417D  00A 
        REL(5)  ROMP_0B4_00B                     * B4182  00B 
        REL(5)  ROMP_0B4_00C                     * B4187  00C 
        REL(5)  ROMP_0B4_00D                     * B418C  00D 
        REL(5)  ROMP_0B4_00E                     * B4191  00E 
        REL(5)  ROMP_0B4_00F                     * B4196  00F 
        REL(5)  ROMP_0B4_010                     * B419B  010 
        REL(5)  ROMP_0B4_011                     * B41A0  011 
        REL(5)  ROMP_0B4_012                     * B41A5  012 
        REL(5)  ROMP_0B4_013                     * B41AA  013 
        REL(5)  ROMP_0B4_014                     * B41AF  014 
        REL(5)  ROMP_0B4_015                     * B41B4  015 
        REL(5)  ROMP_0B4_016                     * B41B9  016 
        REL(5)  ROMP_0B4_017                     * B41BE  017 
        REL(5)  ROMP_0B4_018                     * B41C3  018 
        REL(5)  ROMP_0B4_019                     * B41C8  019 
        REL(5)  ROMP_0B4_01A                     * B41CD  01A 
        REL(5)  ROMP_0B4_01B                     * B41D2  01B 
        REL(5)  ROMP_0B4_01C                     * B41D7  01C 
        REL(5)  ROMP_0B4_01D                     * B41DC  01D 
        REL(5)  ROMP_0B4_01E                     * B41E1  01E 
        REL(5)  ROMP_0B4_01F                     * B41E6  01F 
        REL(5)  ROMP_0B4_020                     * B41EB  020 
        REL(5)  ROMP_0B4_021                     * B41F0  021 
        REL(5)  ROMP_0B4_022                     * B41F5  022 
        REL(5)  ROMP_0B4_023                     * B41FA  023 
        REL(5)  ROMP_0B4_024                     * B41FF  024 
        REL(5)  ROMP_0B4_025                     * B4204  025 
        REL(5)  ROMP_0B4_026                     * B4209  026 
        REL(5)  ROMP_0B4_027                     * B420E  027 
        REL(5)  ROMP_0B4_028                     * B4213  028 
        REL(5)  ROMP_0B4_029                     * B4218  029 
        REL(5)  ROMP_0B4_02A                     * B421D  02A 
        REL(5)  ROMP_0B4_02B                     * B4222  02B 
        REL(5)  ROMP_0B4_02C                     * B4227  02C 
        REL(5)  ROMP_0B4_02D                     * B422C  02D 
        REL(5)  ROMP_0B4_02E                     * B4231  02E 
        REL(5)  ROMP_0B4_02F                     * B4236  02F 
        REL(5)  ROMP_0B4_030                     * B423B  030 
        REL(5)  ROMP_0B4_031                     * B4240  031 
        REL(5)  ROMP_0B4_032                     * B4245  032 
        REL(5)  ROMP_0B4_033                     * B424A  033 
        REL(5)  ROMP_0B4_034                     * B424F  034 
        REL(5)  ROMP_0B4_035                     * B4254  035 
        REL(5)  ROMP_0B4_036                     * B4259  036 
        REL(5)  ROMP_0B4_037                     * B425E  037 
        REL(5)  ROMP_0B4_038                     * B4263  038 
        REL(5)  ROMP_0B4_039                     * B4268  039 
        REL(5)  ROMP_0B4_03A                     * B426D  03A 
        REL(5)  ROMP_0B4_03B                     * B4272  03B 
        REL(5)  ROMP_0B4_03C                     * B4277  03C 
        REL(5)  ROMP_0B4_03D                     * B427C  03D 
        REL(5)  ROMP_0B4_03E                     * B4281  03E 
        REL(5)  ROMP_0B4_03F                     * B4286  03F 
        REL(5)  ROMP_0B4_040                     * B428B  040 
        REL(5)  ROMP_0B4_041                     * B4290  041 
        REL(5)  ROMP_0B4_042                     * B4295  042 
        REL(5)  ROMP_0B4_043                     * B429A  043 
        REL(5)  ROMP_0B4_044                     * B429F  044 
        REL(5)  ROMP_0B4_045                     * B42A4  045 
        REL(5)  ROMP_0B4_046                     * B42A9  046 
        REL(5)  ROMP_0B4_047                     * B42AE  047 
        REL(5)  ROMP_0B4_048                     * B42B3  048 
        REL(5)  ROMP_0B4_049                     * B42B8  049 
        REL(5)  ROMP_0B4_04A                     * B42BD  04A 
        REL(5)  ROMP_0B4_04B                     * B42C2  04B 
        REL(5)  ROMP_0B4_04C                     * B42C7  04C 
        REL(5)  ROMP_0B4_04D                     * B42CC  04D 
        REL(5)  ROMP_0B4_04E                     * B42D1  04E 
        REL(5)  ROMP_0B4_04F                     * B42D6  04F 
        REL(5)  ROMP_0B4_050                     * B42DB  050 
        REL(5)  ROMP_0B4_051                     * B42E0  051 
        REL(5)  ROMP_0B4_052                     * B42E5  052 
        REL(5)  ROMP_0B4_053                     * B42EA  053 
        REL(5)  ROMP_0B4_054                     * B42EF  054 
        REL(5)  ROMP_0B4_055                     * B42F4  055 
        REL(5)  ROMP_0B4_056                     * B42F9  056 
        REL(5)  ROMP_0B4_057                     * B42FE  057 
        REL(5)  ROMP_0B4_058                     * B4303  058 
        REL(5)  ROMP_0B4_059                     * B4308  059 
        REL(5)  ROMP_0B4_05A                     * B430D  05A 
        REL(5)  ROMP_0B4_05B                     * B4312  05B 
        REL(5)  ROMP_0B4_05C                     * B4317  05C 
        REL(5)  ROMP_0B4_05D                     * B431C  05D 
        REL(5)  ROMP_0B4_05E                     * B4321  05E 
        REL(5)  ROMP_0B4_05F                     * B4326  05F 
        REL(5)  ROMP_0B4_060                     * B432B  060 
        REL(5)  ROMP_0B4_061                     * B4330  061 
        REL(5)  ROMP_0B4_062                     * B4335  062 
        REL(5)  ROMP_0B4_063                     * B433A  063 
        REL(5)  ROMP_0B4_064                     * B433F  064 
        REL(5)  ROMP_0B4_065                     * B4344  065 
        REL(5)  ROMP_0B4_066                     * B4349  066 
        REL(5)  ROMP_0B4_067                     * B434E  067 
        REL(5)  ROMP_0B4_068                     * B4353  068 
        REL(5)  ROMP_0B4_069                     * B4358  069 
        REL(5)  ROMP_0B4_06A                     * B435D  06A 
        REL(5)  ROMP_0B4_06B                     * B4362  06B 
        REL(5)  ROMP_0B4_06C                     * B4367  06C 
        REL(5)  ROMP_0B4_06D                     * B436C  06D 
        REL(5)  ROMP_0B4_06F                     * B4371  06E 
        REL(5)  ROMP_0B4_06F                     * B4376  06F 
        REL(5)  ROMP_0B4_070                     * B437B  070 
        REL(5)  ROMP_0B4_071                     * B4380  071 
        REL(5)  ROMP_0B4_072                     * B4385  072 
        REL(5)  ROMP_0B4_073                     * B438A  073 
        REL(5)  ROMP_0B4_074                     * B438F  074 
        REL(5)  ROMP_0B4_075                     * B4394  075 
        REL(5)  ROMP_0B4_076                     * B4399  076 
        REL(5)  ROMP_0B4_077                     * B439E  077 
        REL(5)  ROMP_0B4_078                     * B43A3  078 
        REL(5)  ROMP_0B4_079                     * B43A8  079 
        REL(5)  ROMP_0B4_07A                     * B43AD  07A 
        REL(5)  ROMP_0B4_07B                     * B43B2  07B 
        REL(5)  ROMP_0B4_07C                     * B43B7  07C 
        REL(5)  ROMP_0B4_07D                     * B43BC  07D 
        REL(5)  ROMP_0B4_07E                     * B43C1  07E 
        REL(5)  ROMP_0B4_07F                     * B43C6  07F 
        REL(5)  ROMP_0B4_080                     * B43CB  080 
        REL(5)  ROMP_0B4_081                     * B43D0  081 
        REL(5)  ROMP_0B4_082                     * B43D5  082 
        REL(5)  ROMP_0B4_083                     * B43DA  083 
        REL(5)  ROMP_0B4_084                     * B43DF  084 
        REL(5)  ROMP_0B4_085                     * B43E4  085 
        REL(5)  ROMP_0B4_086                     * B43E9  086 
        REL(5)  ROMP_0B4_087                     * B43EE  087 
        REL(5)  ROMP_0B4_088                     * B43F3  088 
        REL(5)  ROMP_0B4_089                     * B43F8  089 
        REL(5)  ROMP_0B4_08A                     * B43FD  08A 
        REL(5)  ROMP_0B4_08B                     * B4402  08B 
        REL(5)  ROMP_0B4_08C                     * B4407  08C 
        REL(5)  ROMP_0B4_08D                     * B440C  08D 
        REL(5)  ROMP_0B4_08E                     * B4411  08E 
        REL(5)  ROMP_0B4_08F                     * B4416  08F 
        REL(5)  ROMP_0B4_090                     * B441B  090 
        REL(5)  ROMP_0B4_091                     * B4420  091 
        REL(5)  ROMP_0B4_092                     * B4425  092 
        REL(5)  ROMP_0B4_093                     * B442A  093 
        REL(5)  ROMP_0B4_094                     * B442F  094 
        REL(5)  ROMP_0B4_095                     * B4434  095 
        REL(5)  ROMP_0B4_096                     * B4439  096 
        REL(5)  ROMP_0B4_097                     * B443E  097 
        REL(5)  ROMP_0B4_098                     * B4443  098 
        REL(5)  ROMP_0B4_099                     * B4448  099 
        REL(5)  ROMP_0B4_09A                     * B444D  09A 
        REL(5)  ROMP_0B4_09B                     * B4452  09B 
        REL(5)  ROMP_0B4_09C                     * B4457  09C 
        REL(5)  ROMP_0B4_09D                     * B445C  09D 
        REL(5)  ROMP_0B4_09E                     * B4461  09E 
        REL(5)  ROMP_0B4_09F                     * B4466  09F 
        REL(5)  ROMP_0B4_0A0                     * B446B  0A0 
        REL(5)  ROMP_0B4_0A1                     * B4470  0A1 
        REL(5)  ROMP_0B4_0A2                     * B4475  0A2 
        REL(5)  ROMP_0B4_0A3                     * B447A  0A3 
        REL(5)  ROMP_0B4_0A4                     * B447F  0A4 
        REL(5)  ROMP_0B4_0A5                     * B4484  0A5 
        REL(5)  ROMP_0B4_0A6                     * B4489  0A6 
        REL(5)  ROMP_0B4_0A7                     * B448E  0A7 
        REL(5)  ROMP_0B4_0A8                     * B4493  0A8 
        REL(5)  ROMP_0B4_0A9                     * B4498  0A9 
        REL(5)  ROMP_0B4_0AA                     * B449D  0AA 
        REL(5)  ROMP_0B4_0AB                     * B44A2  0AB 
        REL(5)  ROMP_0B4_0AC                     * B44A7  0AC 
        REL(5)  ROMP_0B4_0AD                     * B44AC  0AD 
        REL(5)  ROMP_0B4_0AE                     * B44B1  0AE 
        REL(5)  ROMP_0B4_0AF                     * B44B6  0AF 
        REL(5)  ROMP_0B4_0B0                     * B44BB  0B0 
        REL(5)  ROMP_0B4_0B1                     * B44C0  0B1 
        REL(5)  ROMP_0B4_0B2                     * B44C5  0B2 
        REL(5)  ROMP_0B4_0B3                     * B44CA  0B3 
        REL(5)  ROMP_0B4_0B4                     * B44CF  0B4 
        REL(5)  ROMP_0B4_0B5                     * B44D4  0B5 
        REL(5)  ROMP_0B4_0B6                     * B44D9  0B6 
        REL(5)  ROMP_0B4_0B7                     * B44DE  0B7 
        REL(5)  ROMP_0B4_0B8                     * B44E3  0B8 
        REL(5)  ROMP_0B4_0B9                     * B44E8  0B9 
        REL(5)  ROMP_0B4_0BA                     * B44ED  0BA 
        REL(5)  ROMP_0B4_0BB                     * B44F2  0BB 
        REL(5)  ROMP_0B4_0BC                     * B44F7  0BC 
        REL(5)  ROMP_0B4_0BD                     * B44FC  0BD 
        REL(5)  ROMP_0B4_0BE                     * B4501  0BE 
        REL(5)  ROMP_0B4_0BF                     * B4506  0BF 
        REL(5)  ROMP_0B4_0C0                     * B450B  0C0 
        REL(5)  ROMP_0B4_0C1                     * B4510  0C1 
        REL(5)  ROMP_0B4_0C2                     * B4515  0C2 
        REL(5)  ROMP_0B4_0C3                     * B451A  0C3 
        REL(5)  ROMP_0B4_0C4                     * B451F  0C4 
        REL(5)  ROMP_0B4_0C5                     * B4524  0C5 
        REL(5)  ROMP_0B4_0C6                     * B4529  0C6 
        REL(5)  ROMP_0B4_0C7                     * B452E  0C7 
        REL(5)  ROMP_0B4_0C8                     * B4533  0C8 
        REL(5)  ROMP_0B4_0C9                     * B4538  0C9 
        REL(5)  ROMP_0B4_0CA                     * B453D  0CA 
        REL(5)  ROMP_0B4_0CB                     * B4542  0CB 
        REL(5)  ROMP_0B4_0CC                     * B4547  0CC 
        REL(5)  ROMP_0B4_0CD                     * B454C  0CD 
        REL(5)  ROMP_0B4_0CE                     * B4551  0CE 
        REL(5)  ROMP_0B4_0CF                     * B4556  0CF 
        REL(5)  ROMP_0B4_0D0                     * B455B  0D0 
        REL(5)  ROMP_0B4_0D1                     * B4560  0D1 
        REL(5)  ROMP_0B4_0D2                     * B4565  0D2 
        REL(5)  ROMP_0B4_0D3                     * B456A  0D3 
        REL(5)  ROMP_0B4_0D4                     * B456F  0D4 
        REL(5)  ROMP_0B4_0D5                     * B4574  0D5 
        REL(5)  ROMP_0B4_0D6                     * B4579  0D6 
        REL(5)  ROMP_0B4_0D7                     * B457E  0D7 
        REL(5)  ROMP_0B4_0D8                     * B4583  0D8 
        REL(5)  ROMP_0B4_0D9                     * B4588  0D9 
        REL(5)  ROMP_0B4_0DA                     * B458D  0DA 
        REL(5)  ROMP_0B4_0DB                     * B4592  0DB 
        REL(5)  ROMP_0B4_0DC                     * B4597  0DC 
        REL(5)  ROMP_0B4_0DD                     * B459C  0DD 
        REL(5)  ROMP_0B4_0DE                     * B45A1  0DE 
        REL(5)  ROMP_0B4_0DF                     * B45A6  0DF 
        REL(5)  ROMP_0B4_0E0                     * B45AB  0E0 
        REL(5)  ROMP_0B4_0E1                     * B45B0  0E1 
        REL(5)  ROMP_0B4_0E2                     * B45B5  0E2 
        REL(5)  ROMP_0B4_0E3                     * B45BA  0E3 
        REL(5)  ROMP_0B4_0E4                     * B45BF  0E4 
        REL(5)  ROMP_0B4_0E5                     * B45C4  0E5 
        REL(5)  ROMP_0B4_0E6                     * B45C9  0E6 
        REL(5)  ROMP_0B4_0E7                     * B45CE  0E7 
        REL(5)  ROMP_0B4_0E8                     * B45D3  0E8 
        REL(5)  ROMP_0B4_0E9                     * B45D8  0E9 
        REL(5)  ROMP_0B4_0EA                     * B45DD  0EA 
        REL(5)  ROMP_0B4_0EB                     * B45E2  0EB 
        REL(5)  ROMP_0B4_0EC                     * B45E7  0EC 
        REL(5)  ROMP_0B4_0ED                     * B45EC  0ED 
        REL(5)  ROMP_0B4_0EE                     * B45F1  0EE 
        REL(5)  ROMP_0B4_0EF                     * B45F6  0EF 
        REL(5)  ROMP_0B4_0F0                     * B45FB  0F0 
        REL(5)  ROMP_0B4_0F1                     * B4600  0F1 
        REL(5)  ROMP_0B4_0F2                     * B4605  0F2 
        REL(5)  ROMP_0B4_0F3                     * B460A  0F3 
        REL(5)  ROMP_0B4_0F4                     * B460F  0F4 
        REL(5)  ROMP_0B4_0F5                     * B4614  0F5 
        REL(5)  ROMP_0B4_0F6                     * B4619  0F6 
        REL(5)  ROMP_0B4_0F7                     * B461E  0F7 
        REL(5)  ROMP_0B4_0F8                     * B4623  0F8 
        REL(5)  ROMP_0B4_0F9                     * B4628  0F9 
        REL(5)  ROMP_0B4_0FA                     * B462D  0FA 
        REL(5)  ROMP_0B4_0FB                     * B4632  0FB 
        REL(5)  ROMP_0B4_0FC                     * B4637  0FC 
        REL(5)  ROMP_0B4_0FD                     * B463C  0FD 
        REL(5)  ROMP_0B4_0FE                     * B4641  0FE 
        REL(5)  ROMP_0B4_0FF                     * B4646  0FF 
        REL(5)  ROMP_0B4_100                     * B464B  100 
        REL(5)  ROMP_0B4_101                     * B4650  101 
        REL(5)  ROMP_0B4_102                     * B4655  102 
        REL(5)  ROMP_0B4_103                     * B465A  103 
        REL(5)  ROMP_0B4_104                     * B465F  104 
        REL(5)  ROMP_0B4_105                     * B4664  105 
        REL(5)  ROMP_0B4_106                     * B4669  106 
        REL(5)  ROMP_0B4_107                     * B466E  107 
        REL(5)  ROMP_0B4_108                     * B4673  108 
        REL(5)  ROMP_0B4_109                     * B4678  109 
        REL(5)  ROMP_0B4_10A                     * B467D  10A 
        REL(5)  ROMP_0B4_10B                     * B4682  10B 
        REL(5)  ROMP_0B4_10C                     * B4687  10C 
        REL(5)  ROMP_0B4_10D                     * B468C  10D 
        REL(5)  ROMP_0B4_10E                     * B4691  10E 
        REL(5)  ROMP_0B4_10F                     * B4696  10F 
        REL(5)  ROMP_0B4_110                     * B469B  110 
        REL(5)  ROMP_0B4_111                     * B46A0  111 
        REL(5)  ROMP_0B4_112                     * B46A5  112 
        REL(5)  ROMP_0B4_113                     * B46AA  113 
        REL(5)  ROMP_0B4_114                     * B46AF  114 
        REL(5)  ROMP_0B4_115                     * B46B4  115 
        REL(5)  ROMP_0B4_116                     * B46B9  116 
        REL(5)  ROMP_0B4_117                     * B46BE  117 
        REL(5)  ROMP_0B4_118                     * B46C3  118 
        REL(5)  ROMP_0B4_119                     * B46C8  119 
        REL(5)  ROMP_0B4_11A                     * B46CD  11A 
        REL(5)  ROMP_0B4_11B                     * B46D2  11B 
        REL(5)  ROMP_0B4_11C                     * B46D7  11C 
        REL(5)  ROMP_0B4_11D                     * B46DC  11D 
        REL(5)  ROMP_0B4_11E                     * B46E1  11E 
        REL(5)  ROMP_0B4_11F                     * B46E6  11F 
        REL(5)  ROMP_0B4_120                     * B46EB  120 
        REL(5)  ROMP_0B4_121                     * B46F0  121 
        REL(5)  ROMP_0B4_122                     * B46F5  122 
        REL(5)  ROMP_0B4_123                     * B46FA  123 
        REL(5)  ROMP_0B4_124                     * B46FF  124 
        REL(5)  ROMP_0B4_125                     * B4704  125 
        REL(5)  ROMP_0B4_126                     * B4709  126 
        REL(5)  ROMP_0B4_127                     * B470E  127 
        REL(5)  ROMP_0B4_128                     * B4713  128 
        REL(5)  ROMP_0B4_129                     * B4718  129 
        REL(5)  ROMP_0B4_12A                     * B471D  12A 
        REL(5)  ROMP_0B4_12B                     * B4722  12B 
        REL(5)  ROMP_0B4_12C                     * B4727  12C 
        REL(5)  ROMP_0B4_12D                     * B472C  12D 
        REL(5)  ROMP_0B4_12E                     * B4731  12E 
        REL(5)  ROMP_0B4_12F                     * B4736  12F 
        REL(5)  ROMP_0B4_130                     * B473B  130 
        REL(5)  ROMP_0B4_131                     * B4740  131 
        REL(5)  ROMP_0B4_132                     * B4745  132 
        REL(5)  ROMP_0B4_133                     * B474A  133 
        REL(5)  ROMP_0B4_134                     * B474F  134 
        REL(5)  ROMP_0B4_135                     * B4754  135 
        REL(5)  ROMP_0B4_136                     * B4759  136 
        REL(5)  ROMP_0B4_137                     * B475E  137 
        REL(5)  ROMP_0B4_138                     * B4763  138 
        REL(5)  ROMP_0B4_139                     * B4768  139 
        REL(5)  ROMP_0B4_13A                     * B476D  13A 
        REL(5)  ROMP_0B4_13B                     * B4772  13B 
        REL(5)  ROMP_0B4_13C                     * B4777  13C 
        REL(5)  ROMP_0B4_13D                     * B477C  13D 
        REL(5)  ROMP_0B4_13E                     * B4781  13E 
        REL(5)  ROMP_0B4_13F                     * B4786  13F 
        REL(5)  ROMP_0B4_140                     * B478B  140 
        REL(5)  ROMP_0B4_141                     * B4790  141 
        REL(5)  ROMP_0B4_142                     * B4795  142 
        REL(5)  ROMP_0B4_143                     * B479A  143 
        REL(5)  ROMP_0B4_144                     * B479F  144 
        REL(5)  ROMP_0B4_145                     * B47A4  145 
        REL(5)  ROMP_0B4_146                     * B47A9  146 
        REL(5)  ROMP_0B4_147                     * B47AE  147 
        REL(5)  ROMP_0B4_148                     * B47B3  148 
        REL(5)  ROMP_0B4_149                     * B47B8  149 
        REL(5)  ROMP_0B4_14A                     * B47BD  14A 
        REL(5)  ROMP_0B4_14B                     * B47C2  14B 
        REL(5)  ROMP_0B4_14C                     * B47C7  14C 
        REL(5)  ROMP_0B4_14D                     * B47CC  14D 
        REL(5)  ROMP_0B4_14E                     * B47D1  14E 
        REL(5)  ROMP_0B4_14F                     * B47D6  14F 
        REL(5)  ROMP_0B4_151                     * B47DB  150 
        REL(5)  ROMP_0B4_151                     * B47E0  151 
        REL(5)  ROMP_0B4_152                     * B47E5  152 
        REL(5)  ROMP_0B4_153                     * B47EA  153 
        REL(5)  ROMP_0B4_154                     * B47EF  154 
        REL(5)  ROMP_0B4_155                     * B47F4  155 
        REL(5)  ROMP_0B4_156                     * B47F9  156 
        REL(5)  ROMP_0B4_157                     * B47FE  157 
        REL(5)  ROMP_0B4_158                     * B4803  158 
        REL(5)  ROMP_0B4_159                     * B4808  159 
        REL(5)  ROMP_0B4_15A                     * B480D  15A 
        REL(5)  ROMP_0B4_15B                     * B4812  15B 
        REL(5)  ROMP_0B4_15C                     * B4817  15C 
        REL(5)  ROMP_0B4_15D                     * B481C  15D 
        REL(5)  ROMP_0B4_15E                     * B4821  15E 
        REL(5)  ROMP_0B4_15F                     * B4826  15F 
        REL(5)  ROMP_0B4_160                     * B482B  160 
        REL(5)  ROMP_0B4_161                     * B4830  161 
        REL(5)  ROMP_0B4_162                     * B4835  162 
        REL(5)  ROMP_0B4_163                     * B483A  163 
        REL(5)  ROMP_0B4_164                     * B483F  164 
        REL(5)  ~BINT42;TestSysFlag              * B4844  165 
        REL(5)  ROMP_0B4_166                     * B4849  166 
        REL(5)  ROMP_0B4_168                     * B484E  167 
        REL(5)  ROMP_0B4_168                     * B4853  168 
        REL(5)  ROMP_0B4_16B                     * B4858  169 
        REL(5)  ROMP_0B4_16B                     * B485D  16A 
        REL(5)  ROMP_0B4_16B                     * B4862  16B 
        REL(5)  ROMP_0B4_16C                     * B4867  16C 
        REL(5)  ROMP_0B4_16D                     * B486C  16D 
        REL(5)  ROMP_0B4_16E                     * B4871  16E 
        REL(5)  ROMP_0B4_16F                     * B4876  16F 
        REL(5)  ROMP_0B4_170                     * B487B  170 
        REL(5)  ROMP_0B4_171                     * B4880  171 
        REL(5)  ROMP_0B4_172                     * B4885  172 
        REL(5)  ROMP_0B4_173                     * B488A  173 
        REL(5)  ROMP_0B4_174                     * B488F  174 
        REL(5)  ROMP_0B4_175                     * B4894  175 
        REL(5)  ROMP_0B4_176                     * B4899  176 
        REL(5)  ROMP_0B4_177                     * B489E  177 
        REL(5)  ROMP_0B4_178                     * B48A3  178 
        REL(5)  ROMP_0B4_179                     * B48A8  179 
        REL(5)  ROMP_0B4_17A                     * B48AD  17A 
        REL(5)  ROMP_0B4_17B                     * B48B2  17B 
        REL(5)  ROMP_0B4_17C                     * B48B7  17C 
        REL(5)  ROMP_0B4_17D                     * B48BC  17D 
        REL(5)  ROMP_0B4_17E                     * B48C1  17E 
        REL(5)  ROMP_0B4_17F                     * B48C6  17F 
        REL(5)  ROMP_0B4_180                     * B48CB  180 
        REL(5)  ROMP_0B4_181                     * B48D0  181 
        REL(5)  ROMP_0B4_182                     * B48D5  182 
        REL(5)  ROMP_0B4_183                     * B48DA  183 
        REL(5)  ROMP_0B4_184                     * B48DF  184 
        REL(5)  ROMP_0B4_185                     * B48E4  185 
        REL(5)  ROMP_0B4_186                     * B48E9  186 
        REL(5)  ROMP_0B4_187                     * B48EE  187 
        REL(5)  ROMP_0B4_188                     * B48F3  188 
        REL(5)  ROMP_0B4_189                     * B48F8  189 
        REL(5)  ROMP_0B4_18A                     * B48FD  18A 
        REL(5)  ROMP_0B4_18B                     * B4902  18B 
        REL(5)  ROMP_0B4_18C                     * B4907  18C 
        REL(5)  ROMP_0B4_18D                     * B490C  18D 
        REL(5)  ROMP_0B4_18E                     * B4911  18E 
        REL(5)  ROMP_0B4_18F                     * B4916  18F 
        REL(5)  ROMP_0B4_190                     * B491B  190 
        REL(5)  ROMP_0B4_191                     * B4920  191 
        REL(5)  ROMP_0B4_192                     * B4925  192 
        REL(5)  ROMP_0B4_193                     * B492A  193 
        REL(5)  ROMP_0B4_194                     * B492F  194 
        REL(5)  ROMP_0B4_195                     * B4934  195 
        REL(5)  ROMP_0B4_196                     * B4939  196 
        REL(5)  ROMP_0B4_197                     * B493E  197 
        REL(5)  ROMP_0B4_198                     * B4943  198 
        REL(5)  ROMP_0B4_199                     * B4948  199 
        REL(5)  ROMP_0B4_19A                     * B494D  19A 
        REL(5)  ROMP_0B4_19B                     * B4952  19B 
        REL(5)  ROMP_0B4_19C                     * B4957  19C 
        REL(5)  ROMP_0B4_19D                     * B495C  19D 
        REL(5)  ROMP_0B4_19E                     * B4961  19E 
        REL(5)  ROMP_0B4_19F                     * B4966  19F 
        REL(5)  ROMP_0B4_1A0                     * B496B  1A0 
        REL(5)  ROMP_0B4_1A1                     * B4970  1A1 
        REL(5)  ROMP_0B4_1A2                     * B4975  1A2 
        REL(5)  ROMP_0B4_1A3                     * B497A  1A3 
        REL(5)  ROMP_0B4_1A4                     * B497F  1A4 
        REL(5)  ROMP_0B4_1A5                     * B4984  1A5 
        REL(5)  ROMP_0B4_1A6                     * B4989  1A6 
        REL(5)  ROMP_0B4_1A7                     * B498E  1A7 
        REL(5)  ROMP_0B4_1A8                     * B4993  1A8 
        REL(5)  ROMP_0B4_1A9                     * B4998  1A9 
        REL(5)  ROMP_0B4_1AA                     * B499D  1AA 
        REL(5)  ROMP_0B4_1AB                     * B49A2  1AB 
        REL(5)  ROMP_0B4_1AC                     * B49A7  1AC 
        REL(5)  ROMP_0B4_1AD                     * B49AC  1AD 
        REL(5)  ROMP_0B4_1AE                     * B49B1  1AE 
        REL(5)  ROMP_0B4_1AF                     * B49B6  1AF 
        REL(5)  ROMP_0B4_1B0                     * B49BB  1B0 
        REL(5)  ROMP_0B4_1B1                     * B49C0  1B1 
        REL(5)  ROMP_0B4_1B2                     * B49C5  1B2 
        REL(5)  ROMP_0B4_1B3                     * B49CA  1B3 
        REL(5)  ROMP_0B4_1B4                     * B49CF  1B4 
        REL(5)  ROMP_0B4_1B5                     * B49D4  1B5 
        REL(5)  ROMP_0B4_1B6                     * B49D9  1B6 
        REL(5)  ROMP_0B4_1B7                     * B49DE  1B7 
        REL(5)  ROMP_0B4_1B8                     * B49E3  1B8 
        REL(5)  ROMP_0B4_1B9                     * B49E8  1B9 
        REL(5)  ROMP_0B4_1BA                     * B49ED  1BA 
        REL(5)  ROMP_0B4_1BB                     * B49F2  1BB 
        REL(5)  ROMP_0B4_1BC                     * B49F7  1BC 
        REL(5)  ROMP_0B4_1BD                     * B49FC  1BD 
        REL(5)  ROMP_0B4_1BE                     * B4A01  1BE 
        REL(5)  ROMP_0B4_1BF                     * B4A06  1BF 
        REL(5)  ROMP_0B4_1C0                     * B4A0B  1C0 
        REL(5)  ROMP_0B4_1C1                     * B4A10  1C1 
        REL(5)  ROMP_0B4_1C2                     * B4A15  1C2 
        REL(5)  ROMP_0B4_1C3                     * B4A1A  1C3 
        REL(5)  ROMP_0B4_1C4                     * B4A1F  1C4 
        REL(5)  ROMP_0B4_1C5                     * B4A24  1C5 
        REL(5)  ROMP_0B4_1C6                     * B4A29  1C6 
        REL(5)  ROMP_0B4_1C7                     * B4A2E  1C7 
        REL(5)  ROMP_0B4_1C8                     * B4A33  1C8 
        REL(5)  ROMP_0B4_1C9                     * B4A38  1C9 
        REL(5)  ROMP_0B4_1CA                     * B4A3D  1CA 
        REL(5)  ROMP_0B4_1CB                     * B4A42  1CB 
        REL(5)  ROMP_0B4_1CC                     * B4A47  1CC 
        REL(5)  ROMP_0B4_1CD                     * B4A4C  1CD 
        REL(5)  ROMP_0B4_1CE                     * B4A51  1CE 
        REL(5)  ROMP_0B4_1CF                     * B4A56  1CF 
        REL(5)  ROMP_0B4_1D0                     * B4A5B  1D0 
        REL(5)  ROMP_0B4_1D2                     * B4A60  1D1 
        REL(5)  ROMP_0B4_1D2                     * B4A65  1D2 
        REL(5)  ROMP_0B4_1D3                     * B4A6A  1D3 
        REL(5)  ROMP_0B4_1D4                     * B4A6F  1D4 
        REL(5)  ROMP_0B4_1D5                     * B4A74  1D5 
        REL(5)  ROMP_0B4_1D6                     * B4A79  1D6 
        REL(5)  ROMP_0B4_1D7                     * B4A7E  1D7 
        REL(5)  ROMP_0B4_1D8                     * B4A83  1D8 
        REL(5)  ROMP_0B4_1D9                     * B4A88  1D9 
        REL(5)  ROMP_0B4_1DA                     * B4A8D  1DA 
        REL(5)  ROMP_0B4_1DB                     * B4A92  1DB 
        REL(5)  ROMP_0B4_1DC                     * B4A97  1DC 
        REL(5)  ROMP_0B4_1DD                     * B4A9C  1DD 
        REL(5)  ROMP_0B4_1DE                     * B4AA1  1DE 
        REL(5)  ROMP_0B4_1DF                     * B4AA6  1DF 
        REL(5)  ROMP_0B4_1E0                     * B4AAB  1E0 
        REL(5)  ROMP_0B4_1E1                     * B4AB0  1E1 
        REL(5)  ROMP_0B4_1E2                     * B4AB5  1E2 
        REL(5)  ROMP_0B4_1E3                     * B4ABA  1E3 
        REL(5)  ROMP_0B4_1E4                     * B4ABF  1E4 
        REL(5)  ROMP_0B4_1E5                     * B4AC4  1E5 
        REL(5)  ROMP_0B4_1E6                     * B4AC9  1E6 
        REL(5)  ROMP_0B4_1E7                     * B4ACE  1E7 
        REL(5)  ROMP_0B4_1E8                     * B4AD3  1E8 
        REL(5)  ROMP_0B4_1E9                     * B4AD8  1E9 
        REL(5)  ROMP_0B4_1EA                     * B4ADD  1EA 
        REL(5)  ROMP_0B4_1EB                     * B4AE2  1EB 
        REL(5)  ROMP_0B4_1EC                     * B4AE7  1EC 
        REL(5)  ROMP_0B4_1ED                     * B4AEC  1ED 
        REL(5)  ROMP_0B4_1EE                     * B4AF1  1EE 
        REL(5)  ROMP_0B4_1EF                     * B4AF6  1EF 
        REL(5)  ROMP_0B4_1F0                     * B4AFB  1F0 
        REL(5)  ROMP_0B4_1F1                     * B4B00  1F1 
        REL(5)  ROMP_0B4_1F2                     * B4B05  1F2 
        REL(5)  ROMP_0B4_1F3                     * B4B0A  1F3 
        REL(5)  ROMP_0B4_1F4                     * B4B0F  1F4 
        REL(5)  ROMP_0B4_1F5                     * B4B14  1F5 
        REL(5)  ROMP_0B4_1F6                     * B4B19  1F6 
        REL(5)  ROMP_0B4_1F7                     * B4B1E  1F7 
        REL(5)  ROMP_0B4_1F8                     * B4B23  1F8 
        REL(5)  ROMP_0B4_1F9                     * B4B28  1F9 
        REL(5)  ROMP_0B4_1FA                     * B4B2D  1FA 
