* HP 48GX ROM revision R, #D79FD-#D9A50: Library part 0B0
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~sFldVal ~nNullBind ~grobCheckKey ~grobAlertIcon ~gFldVal GetFieldVals DoAlert
* Follows on from the previous file (at #D79FD in the original ROM).
        RPL

* ROMPTR 0B0 063
* refs (1): D49CE
DoInputForm~26:
        :: TakeOver 5GETLAM DUP BEGIN ROMPTR 0B0 025 2DUP #< WHILE * D79FD
          :: SWAPDROP DUP ; REPEAT DROP ROMPTR 0B0 095 ; * D7A30

* ROMPTR 0B0 064
* refs (1): D49CE
ROMP_0B0_064:
        :: TakeOver REPEATERCH BINT11            * D7A5E
          :: 5GETLAM ROMPTR 0B0 028 ROMPTR 0B0 095 ; ; * D7A72

* ROMPTR 0B0 065
* refs (1): D49CE
ROMP_0B0_065:
        :: TakeOver REPEATERCH BINT17            * D7A9C
          :: 5GETLAM ROMPTR 0B0 027 ROMPTR 0B0 095 ; ; * D7AB0

* ROMPTR 0B0 066
* refs (1): D49CE
DoInputForm~27:
        :: TakeOver REPEATERCH BINT18 ROMPTR 0B0 067 ; * D7ADA

* ROMPTR 0B0 067
* refs (1): D49CE
DoInputForm~28:
        :: 5GETLAM ROMPTR 0B0 025 ROMPTR 0B0 095 ; * D7AFE

* ROMPTR 0B0 068
* refs (1): D49CE
DoInputForm~29:
        :: TakeOver REPEATERCH BINT16 ROMPTR 0B0 069 ; * D7B23

* ROMPTR 0B0 069
* refs (1): D49CE
DoInputForm~30:
        :: 5GETLAM ROMPTR 0B0 026 ROMPTR 0B0 095 ; * D7B47

* ROMPTR 0B0 06A
* refs (1): D49CE
DoInputForm~31:
        :: TakeOver 5GETLAM DUP ROMPTR 0B0 08D casedrop ROMPTR 0B0 058 * D7B6C
          ROMPTR 0B0 08B NOTcase DoBadKey        * D7B9B
          REPEATERCH BINT26 ROMPTR 0B0 03D ;     * D7BB0

* ROMPTR 0B0 06B
* refs (1): D49CE
ROMP_0B0_06B:
        :: 5GETLAM 2DUP #=case 2DROP             * D7BCA
          2DUP ROMPTR 0B0 021 DUP 5PUTLAM ROMPTR 0B0 022 ROMPTR 0B0 0A6 ; * D7BE3

* ROMPTR 0B0 06C
* refs (1): D49CE
DoKeyOK~8:
        :: 5GETLAM DUP ROMPTR 0B0 024 2DUP #=case 2DROP * D7C18
          DUP ROMPTR 0B0 06B SWAP ROMPTR 0B0 014 ROMPTR 0B0 015 ; * D7C41

* ROMPTR 0B0 06D
* refs (1): D49CE
ROMP_0B0_06D:
        :: DUPROT ROMPTR 0B0 078 NOTcasedrop BINT0 * D7C71
          DUP4UNROLL '                           * D7C90
          :: ?ROMPTR@ SWAP ?ROMPTR@ EQUAL ; POSCOMP DUP#0<> case ROTDROP * D7C9A
          DROPSWAP >HCOMP BINT1 ;                * D7CCC

* ROMPTR 0B0 06E
* refs (1): D49CE
~MenuDef@;8GETLAM;EQUAL:
        :: MenuDef@ 8GETLAM EQUAL ;              * D7CE0

* ROMPTR 0B0 06F
* refs (1): D49CE
ROMP_0B0_06F:
        :: BINT0 3UNROLL DUP #6- BINT0 4PICK LEN$ #1+_ONE_DO 4PICK INDEX@ * D7CF9
          DUP SUB$ ROMPTR 0B0 071 #+ 2DUP #< IT  * D7D30
          :: 5PICK #0<> ?SEMI                    * D7D59
            5ROLLDROP INDEX@ #1- 5UNROLL ;       * D7D6D
          DUP 4PICK #> IT ExitAtLOOP             * D7D86
          LOOP SWAPDROP #< NOTcase               * D7D9F
          :: SWAPDROP TRUE ;                     * D7DB3
          BINT1 ROT SUB$ CHR_... >T$ FALSE ;     * D7DC7

* ROMPTR 0B0 070
* refs (1): D49CE
ROMP_0B0_070:
        :: BINT0 3UNROLL DUP #6- BINT0 4PICK LEN$ ZERO_DO 4PICK ISTOP-INDEX * D7DEA
          DUP SUB$ ROMPTR 0B0 071 #+ 2DUP #< IT  * D7E21
          :: 5PICK #0<> ?SEMI                    * D7E4A
            5ROLLDROP ISTOP-INDEX #1+ 5UNROLL ;  * D7E5E
          DUP 4PICK #> IT ExitAtLOOP             * D7E77
          LOOP SWAPDROP #< NOTcase               * D7E90
          :: SWAPDROP TRUE ;                     * D7EA4
          DUPUNROT LEN$ SUB$ CHR_... >H$ FALSE ; * D7EB8

* ROMPTR 0B0 071
* refs (1): D49CE
~$>grob;GROBDIMw:
        :: $>grob GROBDIMw ;                     * D7EDB

* ROMPTR 0B0 072
* refs (1): D49CE
ROMP_0B0_072:
        :: DUP MINUSONE #= IT DROPZERO           * D7EEF
          #1+ DUP 14GETLAM #>ITE DROPFALSE TRUE ; * D7F0D

* ROMPTR 0B0 073
* refs (1): D49CE
ROMP_0B0_073:
        :: DUP MINUSONE #=ITE                    * D7F30
          :: DROP 14GETLAM ; #1- DUP#0=ITE DROPFALSE TRUE ; * D7F44

* ROMPTR 0B0 074
* refs (1): D49CE
ROMP_0B0_074:
        :: DUPTYPEBINT? NOTcase EVAL             * D7F71
          SWAP                                   * D7F85
          :: OVER BINT16 #AND #0<> case          * D7F8A
            :: BINT1 OBJ_1A01B ;                 * D7FA8
            OVER BINT32 #AND #0<> case           * D7FBC
            :: BINT2 OBJ_1A01B ;                 * D7FD5
          ;                                      * D7FE9
          DUP MINUSONE EQUAL case2drop NULL$     * D7FEE
          ~DUPTYPEBINT?;case;JstGetTHEMESG       * D8007
          :: OVER BINT1 #AND #0<> case DUP       * D800C
            OVER BINT4 #AND #0<> case            * D802F
            :: DUP ROMPTR 0B0 075 ;              * D8048
            OVER BINT2 #AND #0<> case            * D8062
            :: DUP ROMPTR 0B0 076 ;              * D807B
          ;                                      * D8095
          3PICK BINT8 #AND #0<> IT               * D809A
          :: ONEONE SUB$ ;                       * D80B3
          ROTROT2DROP ;                          * D80C7

* ROMPTR 0B0 075
* refs (1): D49CE
ROMP_0B0_075:
        :: savefmt1 ERRSET ROMPTR 0B0 076 ERRTRAP * D80D1
          :: rstfmt1 ERRJMP ; rstfmt1 ;          * D80F0

* ROMPTR 0B0 076
* refs (1): D49CE
ROMP_0B0_076:
        :: DUPTYPEIDNT? case DECOMP$             * D810E
          BINT23 !DcompWidth 1stkdecomp$w ;      * D8122

* ROMPTR 0B0 077
* refs (1): D49CE
ROMP_0B0_077:
        :: DUP ROMPTR 0B0 0C2 DUPTYPELIST? NOTcase * D8136
          :: FALSE ROT ROMPTR 0B0 0BF TRUE ;     * D8155
          INNERCOMP BINT2 #=case                 * D8179
          :: ROT ROMPTR 0B0 0BF TRUE ;           * D8188
          5ROLL DROP ;                           * D81A7

* ROMPTR 0B0 078
* refs (1): D49CE
ROMP_0B0_078:
        :: ROMPTR 0B0 0C5 DUP MINUSONE EQUALNOTcase TRUE * D81B6  ~gFldVal
          DROPFALSE ;                            * D81DA

* ROMPTR 0B0 079
* refs (1): D49CE
ROMP_0B0_079:
        :: ROMPTR 0B0 0C5 MINUSONE EQUAL ;       * D81E4  ~gFldVal

* ROMPTR 0B0 07A
* refs (1): D49CE
ROMP_0B0_07A:
        :: ROMPTR 0B0 0BF MINUSONE #=casedrop FALSE * D8203
          TRUE ;                                 * D8222

* ROMPTR 0B0 07B
* refs (1): D49CE
ROMP_0B0_07B:
        :: ROMPTR 0B0 0C2 ;                      * D822C

* ROMPTR 0B0 07C
* refs (1): D49CE
ROMP_0B0_07C:
        :: ROMPTR 0B0 0C3 ;                      * D8241

* ROMPTR 0B0 07D
* refs (1): D49CE
ROMP_0B0_07D:
        :: ROMPTR 0B0 0C4 DUP MINUSONE EQUALcase DROPFALSE * D8256
          TRUE ;                                 * D827A

* ROMPTR 0B0 07E
* refs (1): D49CE
ROMP_0B0_07E:
        GROB    "images/D8284.png"               * D8284  6 x 9

* ROMPTR 0B0 07F
* refs (1): D49CE
IFEDispField~3:
        GROB    "images/D82AA.png"               * D82AA  6 x 9

* ROMPTR 0B0 080
* refs (1): D49CE
DoCKeyCheck~1:
        GROB    "images/D82D0.png"               * D82D0  6 x 9

* ROMPTR 0B0 081
* refs (1): D49CE
ROMP_0B0_081:
        GROB    "images/D82F6.png"               * D82F6  6 x 9

* ROMPTR 0B0 082
* refs (1): D49CE
IFEDispField~4:
        GROB    "images/D831C.png"               * D831C  6 x 9

* ROMPTR 0B0 083
* refs (1): D49CE
ROMP_0B0_083:
        GROB    "images/D8342.png"               * D8342  6 x 9

* ROMPTR 0B0 084
* refs (1): D49CE
DoCKeyCheck~2:
        GROB    "images/D8368.png"               * D8368  6 x 9

* ROMPTR 0B0 085
* refs (1): D49CE
~grobAlertIcon:
        GROB    "images/D838E-_grobAlertIcon.png" * D838E  9 x 9

* ROMPTR 0B0 086
* refs (1): D49CE
~grobCheckKey:
        GROB    "images/D83C6-_grobCheckKey.png" * D83C6  21 x 8

* ROMPTR 0B0 087
* refs (1): D49CE
ROMP_0B0_087:
        GROBW   "images/D840A.png" 131           * D840A  131 x 7; the padding (gray) is not zero

* ROMPTR 0B0 088
* refs (1): D49CE
ROMP_0B0_088:
        :: ROMPTR 0B0 0BE BINT1 #AND #0<> ;      * D850C

* ROMPTR 0B0 089
* refs (1): D49CE
ROMP_0B0_089:
        :: ROMPTR 0B0 0BE BINT2 #AND #0<> ;      * D8530

* ROMPTR 0B0 08A
* refs (1): D49CE
ROMP_0B0_08A:
        :: ROMPTR 0B0 0BE BINT4 #AND #0<> ;      * D8554

* ROMPTR 0B0 08B
* refs (1): D49CE
ROMP_0B0_08B:
        :: ROMPTR 0B0 0BE BINT8 #AND #0<> ;      * D8578

* ROMPTR 0B0 08C
* refs (1): D49CE
ROMP_0B0_08C:
        :: ROMPTR 0B0 0BE BINT16 #AND #0<> ;     * D859C

* ROMPTR 0B0 08D
* refs (1): D49CE
ROMP_0B0_08D:
        :: ROMPTR 0B0 0BE BINT32 #= ;            * D85C0

* ROMPTR 0B0 08E
* refs (1): D49CE
ROMP_0B0_08E:
        :: EDITDECOMP$ InitEdLine EditString OBJ_3A030 SetPrgmEntry * D85DF
          SetDA2bValid # B914 ' ROMPTR 0B0 08F ROMPTR 0B0 092 OBJ_1A03E case * D85FD
          SetDA2bEdit                            * D8631
          5GETLAM ROMPTR 0B0 032 SetDA2bEdit ;   * D8636

* ROMPTR 0B0 08F
* refs (1): D49CE
ROMP_0B0_08F:
        :: NoExitAction                          * D8650
          {                                      * D865A
            { $ "TYPES"                          * D865F
              :: TakeOver ROMPTR 0B1 009 DROPFALSE ; } * D8678  DoMKeyOK
            NullMenuKey NullMenuKey NullMenuKey NullMenuKey * D869C
            { $ "OK"                             * D86B0
              :: TakeOver ROMPTR 0B1 009 ; }     * D86C3  DoMKeyOK
          }                                      * D86E2
        ;                                        * D86E7

* ROMPTR 0B0 090
* refs (1): D49CE
ROMP_0B0_090:
        :: EDITDECOMP$ InitEdLine EditString OBJ_3A030 SetPrgmEntry * D86EC
          SetDA2bValid # B915 ROMPTR 0B0 091 SetDA2bEdit OBJ_1A03E ; * D870A  DoAlert

* ROMPTR 0B0 091
* refs (1): D49CE
DoAlert:
        :: BINT13 BINT5 ROMPTR 0B0 085 '         * D8733  ~grobAlertIcon
          ROMPTR 0B1 002 ERRBEEP                 * D8752  ~MsgBoxMenu
          ROMPTR 0B1 000 DROP SetDA123NoCh ;     * D8762  ~DoMsgBox

* ROMPTR 0B0 092
* refs (1): D49CE
ROMP_0B0_092:
        :: BINT13 BINT5 ROMPTR 0B0 085 4ROLL ERRBEEP * D877C  ~grobAlertIcon
          ROMPTR 0B1 000 SetDA123NoCh ;          * D87A0  ~DoMsgBox

* ROMPTR 0B0 093
* refs (1): D49CE
ROMP_0B0_093:
        :: BINT7 BINT39 EDITPARTS BINT4 #MIN BINT1 #MAX #1- #10* #- BLANKIT ; * D87B5

* ROMPTR 0B0 094
* refs (1): D49CE
~BINT46;BINT10;BLANKIT:
        :: BINT46 BINT10 BLANKIT ;               * D87F6

* ROMPTR 0B0 095
* refs (1): D49CE
ROMP_0B0_095:
        ::                                       * D880F
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; 5GETLAM 2DUP #= case2drop * D8814
          SetDA2bNoCh                            * D8841
          OVER ROMPTR 0B0 06B ROMPTR 0B0 014 ROMPTR 0B0 015 ; * D8846

* ROMPTR 0B0 096
* refs (1): D49CE
ROMP_0B0_096:
        :: 2DUP ROMPTR 0B0 042 NOTcasedrop       * D8871
          :: ' ' SWAP ' ROMPTR 0B0 08E BINT3 ::N FALSE ; * D888B
          2DUP ROMPTR 0B0 043 NOTcasedrop        * D88C3
          :: ' ' SWAP ' ROMPTR 0B0 090 BINT3 ::N FALSE ; * D88D8
          ROMPTR 0B0 0D5 TRUE ;                  * D8910  ~sFldVal

* ROMPTR 0B0 097
* refs (1): D49CE
DoInputForm~32:
        :: 10GETLAM DUP MINUSONE EQUAL NOT?SEMI  * D8925
          DROP ROMPTR 0B0 00E NOT?SEMI           * D8943
          DUP 10PUTLAM ;                         * D8958

* ROMPTR 0B0 098
* refs (1): D49CE
ROMP_0B0_098:
        :: BINT1 OBJ_1A01B ;                     * D8967

* ROMPTR 0B0 099
* refs (1): D49CE
ROMP_0B0_099:
        :: BINT2 OBJ_1A01B ;                     * D897B

* ROMPTR 0B0 09A
* refs (1): D49CE
ROMP_0B0_09A:
        :: BINT3 OBJ_1A01B ;                     * D898F

* ROMPTR 0B0 09B
* refs (1): D49CE
ROMP_0B0_09B:
        :: ROMPTR 0B0 098 EVAL ;                 * D89A3

* ROMPTR 0B0 09C
* refs (1): D49CE
ROMP_0B0_09C:
        :: ROMPTR 0B0 099 EVAL ;                 * D89BD

* ROMPTR 0B0 09D
* refs (1): D49CE
ROMP_0B0_09D:
        :: ROMPTR 0B0 09A EVAL ;                 * D89D7

* ROMPTR 0B0 09E
* refs (1): D49CE
ROMP_0B0_09E:
        :: 4PICK #0=case                         * D89F1
          :: 5DROP FALSE ;                       * D8A00
          ROMPTR 0B3 012 5ROLL SWAP FALSE 3UNROLL 6PICK #1+ 5PICK 2DUP #> * D8A14
          ITE                                    * D8A4C
          :: DO INDEX@ 3PICK EVAL 6PICK ROMPTR 0B0 074 ROMPTR 0B3 013 * D8A51
            ROMPTR 0B3 012 OVER EQUAL IT         * D8A85
            :: DROP INDEX@ ROTDROP TRUE 3UNROLL ExitAtLOOP ; * D8A9F
            LOOP ;                               * D8AC7
          2DROP                                  * D8AD1
          3PICK case                             * D8AD6
          :: 6UNROLL 5DROP TRUE ;                * D8AE0
          4PICK BINT1 2DUP #> ITE                * D8AF9
          :: DO INDEX@ 3PICK EVAL 6PICK ROMPTR 0B0 074 ROMPTR 0B3 013 * D8B12
            ROMPTR 0B3 012 OVER EQUAL IT         * D8B46
            :: DROP INDEX@ ROTDROP TRUE 3UNROLL ExitAtLOOP ; * D8B60
            LOOP ;                               * D8B88
          2DROP                                  * D8B92
          ROT case                               * D8B97
          :: 5UNROLL 4DROP TRUE ;                * D8BA1
          5DROP FALSE ;                          * D8BBA

* ROMPTR 0B0 09F
* refs (1): D49CE
ROMP_0B0_09F:
        :: 9GETLAM SWAP #1+ NTHCOMPDROP NOT ;    * D8BC9

* ROMPTR 0B0 0A0
* refs (1): D49CE
~9GETLAM;CARCOMP;NOT:
        :: 9GETLAM CARCOMP NOT ;                 * D8BEC

* ROMPTR 0B0 0A1
* refs (1): D49CE
ROMP_0B0_0A1:
        :: TRUE SWAP #1+ 9GETLAM PUTLIST DUP INCOMPDROP 14GETLAM #1- DUP#0<> * D8C05
          ITE                                    * D8C3C
          :: ZERO_DO AND LOOP ; DROP             * D8C41
          SWAPDROP BINT1 ROT PUTLIST 9PUTLAM ;   * D8C5F

* ROMPTR 0B0 0A2
* refs (1): D49CE
ROMP_0B0_0A2:
        :: FALSE SWAP #1+ 9GETLAM PUTLIST FALSE BINT1 ROT PUTLIST 9PUTLAM ; * D8C7D

* ROMPTR 0B0 0A3
* refs (1): D49CE
DoInputForm~33:
        :: TRUE 14GETLAM #1+_ONE_DO DUP LOOP 14GETLAM #1+ {}N 9PUTLAM ; * D8CB9

* ROMPTR 0B0 0A4
* refs (1): D49CE
ROMP_0B0_0A4:
        :: FALSE 14GETLAM #1+_ONE_DO DUP LOOP 14GETLAM #1+ {}N 9PUTLAM ; * D8CF0

* ROMPTR 0B0 0A5
* refs (1): D49CE
ROMP_0B0_0A5:
        :: $>grob BINT7 OVER GROBDIMw #3+ MAKEGROB SWAP OVER BINT2 BINT1 * D8D27
          GROB! ROMPTR 0B0 087 TOTEMPOB DUP 3UNROLL BINT65 3PICK GROBDIMw * D8D5E
          #2/ #- BINT0 GROB! ;                   * D8D8C

* ROMPTR 0B0 0A6
* refs (1): D49CE
ROMP_0B0_0A6:
        :: DUP MINUSONE #= case2drop             * D8DA5
          :: SetThisRow SetDA3Bad ;              * D8DBE
          ROMPTR 0B0 0BE BINT37 #AND SWAP ROMPTR 0B0 0BE BINT37 #AND #= * D8DD2
          ?SEMI                                  * D8E06
          SetThisRow SetDA3Bad ;                 * D8E0B

* ROMPTR 0B0 0A7
* refs (1): D49CE
~8GETLAM;7GETLAM;StartMenu:
        :: 8GETLAM 7GETLAM StartMenu ;           * D8E1A

* ROMPTR 0B0 0A8
* refs (1): D49CE
ROMP_0B0_0A8:
        :: MenuRow@ 7PUTLAM 5GETLAM ROMPTR 0B0 02D BINT1 StartMenu ; * D8E33

* ROMPTR 0B0 0A9
* refs (1): D49CE
ROMP_0B0_0A9:
        :: ' DROPFALSE NULL$ BINT17 4ROLL BINT1 ROMPTR 0B3 000 NOT?SEMI * D8E61  ~Choose
          ROMPTR 0B0 09C ;                       * D8E94

* ROMPTR 0B0 0AA
* refs (1): D49CE
ROMP_0B0_0AA:
        :: ZERO_DO ISTOP-INDEX #1- BINT13 #* #4+ ISTOP-INDEX #+ DUP #2+ ROLL * D8EA4
          DROP ISTOP-INDEX #1+ ROLL SWAP UNROLL LOOP ; * D8EE0

* ROMPTR 0B0 0AB
* refs (1): D49CE
ROMP_0B0_0AB:
        :: ROMPTR 0B0 0AC NOT?SEMI               * D8F08
          RDROP COLA DoBadKey                    * D8F1D
        ;                                        * D8F2C

* ROMPTR 0B0 0AC
* refs (1): D49CE
ROMP_0B0_0AC:
        :: ' LAM 'IF undo NOTcaseFALSE ;         * D8F31

* ROMPTR 0B0 0AD
* refs (1): D49CE
ROMP_0B0_0AD:
        :: 'R OVER BINT29 #<> caseDROP DUPTYPELIST? * D8F57
          ?SKIP ONE{}N                           * D8F7A
          INNERCOMP ZERO_DO ISTOP-INDEX ROLL DUP ROMPTR 0B0 079 case * D8F84
          :: ROMPTR 0B0 06B SETSIZEERR ;         * D8FAD
          DROP LOOP ;                            * D8FC7

* ROMPTR 0B0 0AE
* refs (1): D49CE
ROMP_0B0_0AE:
        :: 12GETLAM ~DUPTYPEBINT?;case;JstGetTHEMESG ; * D8FD6

* ROMPTR 0B0 0AF
* refs (1): D49CE
~#3*;3GETLAM;SWAP#-:
        :: #3* 3GETLAM SWAP#- ;                  * D8FEA

* ROMPTR 0B0 0B0
* refs (1): D49CE
ROMP_0B0_0B0:
        :: ROMPTR 0B0 0AF #2+ GETLAM ~DUPTYPEBINT?;case;JstGetTHEMESG ; * D9003

* ROMPTR 0B0 0B1
* refs (1): D49CE
ROMP_0B0_0B1:
        :: ROMPTR 0B0 0AF #1+ GETLAM ;           * D9027

* ROMPTR 0B0 0B2
* refs (1): D49CE
ROMP_0B0_0B2:
        :: ROMPTR 0B0 0AF GETLAM ;               * D9046

* ROMPTR 0B0 0B3
* refs (1): D49CE
ROMP_0B0_0B3:
        :: ROMPTR 0B0 0AF #1+ ROMPTR 0B0 0D9 ;   * D9060

* ROMPTR 0B0 0B4
* refs (1): D49CE
ROMP_0B0_0B4:
        :: ROMPTR 0B0 0AF #2+ PUTLAM ;           * D9085

* ROMPTR 0B0 0B5
* refs (1): D49CE
ROMP_0B0_0B5:
        :: ROMPTR 0B0 0AF #1+ PUTLAM ;           * D90A4

* ROMPTR 0B0 0B6
* refs (1): D49CE
ROMP_0B0_0B6:
        :: ROMPTR 0B0 0AF PUTLAM ;               * D90C3

* ROMPTR 0B0 0B7
* refs (1): D49CE
ROMP_0B0_0B7:
        :: ROMPTR 0B0 0AF #1+ ROMPTR 0B0 0DA ;   * D90DD

* ROMPTR 0B0 0B8
* refs (1): D49CE
ROMP_0B0_0B8:
        :: BINT13 #* 2GETLAM SWAP#- ;            * D9102

* ROMPTR 0B0 0B9
* refs (1): D49CE
ROMP_0B0_0B9:
        :: ROMPTR 0B0 0B8 #12+ GETLAM ;          * D9120

* ROMPTR 0B0 0BA
* refs (1): D49CE
ROMP_0B0_0BA:
        :: ROMPTR 0B0 0B8 BINT11 #+ GETLAM ;     * D913F

* ROMPTR 0B0 0BB
* refs (1): D49CE
ROMP_0B0_0BB:
        :: ROMPTR 0B0 0B8 #10+ GETLAM ;          * D9163

* ROMPTR 0B0 0BC
* refs (1): D49CE
ROMP_0B0_0BC:
        :: ROMPTR 0B0 0B8 #9+ GETLAM ;           * D9182

* ROMPTR 0B0 0BD
* refs (1): D49CE
ROMP_0B0_0BD:
        :: ROMPTR 0B0 0B8 #8+ GETLAM ;           * D91A1

* ROMPTR 0B0 0BE
* refs (1): D49CE
ROMP_0B0_0BE:
        :: ROMPTR 0B0 0B8 #7+ GETLAM ;           * D91C0

* ROMPTR 0B0 0BF
* refs (1): D49CE
ROMP_0B0_0BF:
        :: ROMPTR 0B0 0B8 #6+ GETLAM ;           * D91DF

* ROMPTR 0B0 0C0
* refs (1): D49CE
ROMP_0B0_0C0:
        :: ROMPTR 0B0 0B8 #5+ GETLAM ;           * D91FE

* ROMPTR 0B0 0C1
* refs (1): D49CE
ROMP_0B0_0C1:
        :: ROMPTR 0B0 0B8 #4+ GETLAM ~DUPTYPEBINT?;case;JstGetTHEMESG ; * D921D

* ROMPTR 0B0 0C2
* refs (1): D49CE
ROMP_0B0_0C2:
        :: ROMPTR 0B0 0B8 #3+ GETLAM ;           * D9241

* ROMPTR 0B0 0C3
* refs (1): D49CE
ROMP_0B0_0C3:
        :: ROMPTR 0B0 0B8 #2+ GETLAM ;           * D9260

* ROMPTR 0B0 0C4
* refs (1): D49CE
ROMP_0B0_0C4:
        :: ROMPTR 0B0 0B8 #1+ GETLAM ;           * D927F

* ROMPTR 0B0 0C5
* refs (1): D49CE
~gFldVal:
        :: ROMPTR 0B0 0B8 GETLAM ;               * D929E

* ROMPTR 0B0 0C6
* refs (1): D49CE
ROMP_0B0_0C6:
        :: ROMPTR 0B0 0B8 BINT11 #+ ROMPTR 0B0 0D9 ; * D92B8

* ROMPTR 0B0 0C7
* refs (1): D49CE
ROMP_0B0_0C7:
        :: ROMPTR 0B0 0B8 #9+ ROMPTR 0B0 0D9 ;   * D92E2

* ROMPTR 0B0 0C8
* refs (1): D49CE
GetFieldVals:
        :: 14GETLAM #1+_ONE_DO INDEX@ ROMPTR 0B0 0C5 LOOP ; * D9307  ~gFldVal

* ROMPTR 0B0 0C9
* refs (1): D49CE
ROMP_0B0_0C9:
        :: ROMPTR 0B0 0B8 #12+ PUTLAM ;          * D9330

* ROMPTR 0B0 0CA
* refs (1): D49CE
ROMP_0B0_0CA:
        :: ROMPTR 0B0 0B8 BINT11 #+ PUTLAM ;     * D934F

* ROMPTR 0B0 0CB
* refs (1): D49CE
ROMP_0B0_0CB:
        :: ROMPTR 0B0 0B8 #10+ PUTLAM ;          * D9373

* ROMPTR 0B0 0CC
* refs (1): D49CE
ROMP_0B0_0CC:
        :: ROMPTR 0B0 0B8 #9+ PUTLAM ;           * D9392

* ROMPTR 0B0 0CD
* refs (1): D49CE
ROMP_0B0_0CD:
        :: ROMPTR 0B0 0B8 #8+ PUTLAM ;           * D93B1

* ROMPTR 0B0 0CE
* refs (1): D49CE
ROMP_0B0_0CE:
        :: ROMPTR 0B0 0B8 #7+ PUTLAM ;           * D93D0

* ROMPTR 0B0 0CF
* refs (1): D49CE
ROMP_0B0_0CF:
        :: ROMPTR 0B0 0B8 #6+ PUTLAM ;           * D93EF

* ROMPTR 0B0 0D0
* refs (1): D49CE
ROMP_0B0_0D0:
        :: ROMPTR 0B0 0B8 #5+ PUTLAM ;           * D940E

* ROMPTR 0B0 0D1
* refs (1): D49CE
ROMP_0B0_0D1:
        :: ROMPTR 0B0 0B8 #4+ PUTLAM ;           * D942D

* ROMPTR 0B0 0D2
* refs (1): D49CE
ROMP_0B0_0D2:
        :: ROMPTR 0B0 0B8 #3+ PUTLAM ;           * D944C

* ROMPTR 0B0 0D3
* refs (1): D49CE
ROMP_0B0_0D3:
        :: ROMPTR 0B0 0B8 #2+ PUTLAM ;           * D946B

* ROMPTR 0B0 0D4
* refs (1): D49CE
ROMP_0B0_0D4:
        :: ROMPTR 0B0 0B8 #1+ PUTLAM ;           * D948A

* ROMPTR 0B0 0D5
* refs (1): D49CE
~sFldVal:
        :: ROMPTR 0B0 0B8 PUTLAM ;               * D94A9

* ROMPTR 0B0 0D6
* refs (1): D49CE
ROMP_0B0_0D6:
        :: ROMPTR 0B0 0B8 BINT11 #+ ROMPTR 0B0 0DA ; * D94C3

* ROMPTR 0B0 0D7
* refs (1): D49CE
ROMP_0B0_0D7:
        :: ROMPTR 0B0 0B8 #9+ ROMPTR 0B0 0DA ;   * D94ED

* ROMPTR 0B0 0D8
* refs (1): D49CE
ROMP_0B0_0D8:
        :: 14GETLAM ZERO_DO ISTOP-INDEX ROMPTR 0B0 0D5 LOOP ; * D9512  ~sFldVal

* ROMPTR 0B0 0D9
* refs (1): D49CE
ROMP_0B0_0D9:
        :: DUP GETLAM SWAP#1- GETLAM ;           * D953B

* ROMPTR 0B0 0DA
* refs (1): D49CE
ROMP_0B0_0DA:
        :: ROTOVER PUTLAM #1- PUTLAM ;           * D9559

* ROMPTR 0B0 0DB
* refs (1): D49CE
~nNullBind:
        :: ' NULLLAM CACHE ;                     * D9577

LIB0B0.hash:
        CON(5)  DOHSTR                           * D9590  hash table of library 0B0
        LENGTH                                   * D9595  length, to #D95F4
        CON(5)  0                                * D959A  names of length 1
        CON(5)  0                                * D959F  names of length 2
        CON(5)  0                                * D95A4  names of length 3
        CON(5)  0                                * D95A9  names of length 4
        CON(5)  0                                * D95AE  names of length 5
        CON(5)  0                                * D95B3  names of length 6
        CON(5)  0                                * D95B8  names of length 7
        CON(5)  0                                * D95BD  names of length 8
        CON(5)  0                                * D95C2  names of length 9
        CON(5)  0                                * D95C7  names of length 10
        CON(5)  0                                * D95CC  names of length 11
        CON(5)  0                                * D95D1  names of length 12
        CON(5)  0                                * D95D6  names of length 13
        CON(5)  0                                * D95DB  names of length 14
        CON(5)  0                                * D95E0  names of length 15
        CON(5)  0                                * D95E5  names of length 16
        REL(5)  L_D95EF                          * D95EA  end of the names
L_D95EF:
        CON(5)  0                                * D95EF  command 000 has no name
        ENDLENGTH                                * D95F4

LIB0B0.link:
        CON(5)  DOHSTR                           * D95F4  link table of library 0B0
        LENGTH                                   * D95F9  length, to #D9A4A
        REL(5)  ROMP_0B0_000                     * D95FE  000 
        REL(5)  DoInputForm~6                    * D9603  001 
        REL(5)  DoInputForm~7                    * D9608  002 
        REL(5)  DoInputForm~8                    * D960D  003 
        REL(5)  DoInputForm~34                   * D9612  004 
        REL(5)  ~IFMenuRow1                      * D9617  005 ~IFMenuRow1
        REL(5)  ~IFMenuRow2                      * D961C  006 ~IFMenuRow2
        REL(5)  ROMP_0B0_007                     * D9621  007 
        REL(5)  ROMP_0B0_008                     * D9626  008 
        REL(5)  DoInputForm~9                    * D962B  009 
        REL(5)  DoInputForm~10                   * D9630  00A 
        REL(5)  DoInputForm~40                   * D9635  00B 
        REL(5)  DoInputForm~11                   * D963A  00C 
        REL(5)  DoInputForm~12                   * D963F  00D 
        REL(5)  DoInputForm~35                   * D9644  00E 
        REL(5)  DoInputForm~13                   * D9649  00F 
        REL(5)  ROMP_0B0_010                     * D964E  010 
        REL(5)  ROMP_0B0_011                     * D9653  011 
        REL(5)  ROMP_0B0_012                     * D9658  012 
        REL(5)  IFEDispField                     * D965D  013 IFEDispField
        REL(5)  ROMP_0B0_014                     * D9662  014 
        REL(5)  ROMP_0B0_015                     * D9667  015 
        REL(5)  ROMP_0B0_016                     * D966C  016 
        REL(5)  ROMP_0B0_017                     * D9671  017 
        REL(5)  ROMP_0B0_018                     * D9676  018 
        REL(5)  ROMP_0B0_019                     * D967B  019 
        REL(5)  ROMP_0B0_01A                     * D9680  01A 
        REL(5)  ROMP_0B0_01B                     * D9685  01B 
        REL(5)  ROMP_0B0_01C                     * D968A  01C 
        REL(5)  ROMP_0B0_01D                     * D968F  01D 
        REL(5)  ROMP_0B0_01E                     * D9694  01E 
        REL(5)  ROMP_0B0_01F                     * D9699  01F 
        REL(5)  ROMP_0B0_020                     * D969E  020 
        REL(5)  ROMP_0B0_021                     * D96A3  021 
        REL(5)  ~BINT20;IFECallFieldMH;DROP      * D96A8  022 
        REL(5)  ROMP_0B0_023                     * D96AD  023 
        REL(5)  ROMP_0B0_024                     * D96B2  024 
        REL(5)  ROMP_0B0_025                     * D96B7  025 
        REL(5)  ROMP_0B0_026                     * D96BC  026 
        REL(5)  ROMP_0B0_027                     * D96C1  027 
        REL(5)  ROMP_0B0_028                     * D96C6  028 
        REL(5)  DoInputForm~36                   * D96CB  029 
        REL(5)  DoInputForm~37                   * D96D0  02A 
        REL(5)  ROMP_0B0_02B                     * D96D5  02B 
        REL(5)  DoKeyEdit~1                      * D96DA  02C 
        REL(5)  ROMP_0B0_02D                     * D96DF  02D 
        REL(5)  ROMP_0B0_02E                     * D96E4  02E 
        REL(5)  ROMP_0B0_02F                     * D96E9  02F 
        REL(5)  ROMP_0B0_030                     * D96EE  030 
        REL(5)  ROMP_0B0_031                     * D96F3  031 
        REL(5)  ROMP_0B0_032                     * D96F8  032 
        REL(5)  ROMP_0B0_033                     * D96FD  033 
        REL(5)  ROMP_0B0_034                     * D9702  034 
        REL(5)  ROMP_0B0_035                     * D9707  035 
        REL(5)  DoKeyCancel~1                    * D970C  036 
        REL(5)  DoKeyOK~1                        * D9711  037 
        REL(5)  ROMP_0B0_038                     * D9716  038 
        REL(5)  DoKeyOK~2                        * D971B  039 
        REL(5)  DoKeyOK~3                        * D9720  03A 
        REL(5)  DoKeyOK~4                        * D9725  03B 
        REL(5)  DoKeyOK~5                        * D972A  03C 
        REL(5)  DoInputForm~38                   * D972F  03D 
        REL(5)  ROMP_0B0_03E                     * D9734  03E 
        REL(5)  DoKeyOK~6                        * D9739  03F 
        REL(5)  DoKeyOK~7                        * D973E  040 
        REL(5)  ~BINT47;IFECallFieldMH;DROP      * D9743  041 
        REL(5)  ROMP_0B0_042                     * D9748  042 
        REL(5)  ROMP_0B0_043                     * D974D  043 
        REL(5)  IFEDispField~1                   * D9752  044 
        REL(5)  IFEDispField~2                   * D9757  045 
        REL(5)  ROMP_0B0_046                     * D975C  046 
        REL(5)  DoInputForm~14                   * D9761  047 
        REL(5)  DoInputForm~15                   * D9766  048 
        REL(5)  DoInputForm~16                   * D976B  049 
        REL(5)  DoInputForm~17                   * D9770  04A 
        REL(5)  DoInputForm~18                   * D9775  04B 
        REL(5)  ROMP_0B0_04C                     * D977A  04C 
        REL(5)  DoInputForm~41                   * D977F  04D 
        REL(5)  DoInputForm~42                   * D9784  04E 
        REL(5)  DoInputForm~43                   * D9789  04F 
        REL(5)  DoInputForm~44                   * D978E  050 
        REL(5)  DoInputForm~45                   * D9793  051 
        REL(5)  ROMP_0B0_052                     * D9798  052 
        REL(5)  ROMP_0B0_053                     * D979D  053 
        REL(5)  DoInputForm~19                   * D97A2  054 
        REL(5)  DoInputForm~20                   * D97A7  055 
        REL(5)  DoKeyEdit                        * D97AC  056 DoKeyEdit
        REL(5)  ROMP_0B0_057                     * D97B1  057 
        REL(5)  ROMP_0B0_058                     * D97B6  058 
        REL(5)  DoKeyCancel                      * D97BB  059 DoKeyCancel
        REL(5)  DoKeyOK                          * D97C0  05A DoKeyOK
        REL(5)  ROMP_0B0_05B                     * D97C5  05B 
        REL(5)  ROMP_0B0_05C                     * D97CA  05C 
        REL(5)  ROMP_0B0_05D                     * D97CF  05D 
        REL(5)  DoInputForm~21                   * D97D4  05E 
        REL(5)  DoInputForm~22                   * D97D9  05F 
        REL(5)  DoInputForm~23                   * D97DE  060 
        REL(5)  DoInputForm~24                   * D97E3  061 
        REL(5)  DoInputForm~25                   * D97E8  062 
        REL(5)  DoInputForm~26                   * D97ED  063 
        REL(5)  ROMP_0B0_064                     * D97F2  064 
        REL(5)  ROMP_0B0_065                     * D97F7  065 
        REL(5)  DoInputForm~27                   * D97FC  066 
        REL(5)  DoInputForm~28                   * D9801  067 
        REL(5)  DoInputForm~29                   * D9806  068 
        REL(5)  DoInputForm~30                   * D980B  069 
        REL(5)  DoInputForm~31                   * D9810  06A 
        REL(5)  ROMP_0B0_06B                     * D9815  06B 
        REL(5)  DoKeyOK~8                        * D981A  06C 
        REL(5)  ROMP_0B0_06D                     * D981F  06D 
        REL(5)  ~MenuDef@;8GETLAM;EQUAL          * D9824  06E 
        REL(5)  ROMP_0B0_06F                     * D9829  06F 
        REL(5)  ROMP_0B0_070                     * D982E  070 
        REL(5)  ~$>grob;GROBDIMw                 * D9833  071 
        REL(5)  ROMP_0B0_072                     * D9838  072 
        REL(5)  ROMP_0B0_073                     * D983D  073 
        REL(5)  ROMP_0B0_074                     * D9842  074 
        REL(5)  ROMP_0B0_075                     * D9847  075 
        REL(5)  ROMP_0B0_076                     * D984C  076 
        REL(5)  ROMP_0B0_077                     * D9851  077 
        REL(5)  ROMP_0B0_078                     * D9856  078 
        REL(5)  ROMP_0B0_079                     * D985B  079 
        REL(5)  ROMP_0B0_07A                     * D9860  07A 
        REL(5)  ROMP_0B0_07B                     * D9865  07B 
        REL(5)  ROMP_0B0_07C                     * D986A  07C 
        REL(5)  ROMP_0B0_07D                     * D986F  07D 
        REL(5)  ROMP_0B0_07E                     * D9874  07E 
        REL(5)  IFEDispField~3                   * D9879  07F 
        REL(5)  DoCKeyCheck~1                    * D987E  080 
        REL(5)  ROMP_0B0_081                     * D9883  081 
        REL(5)  IFEDispField~4                   * D9888  082 
        REL(5)  ROMP_0B0_083                     * D988D  083 
        REL(5)  DoCKeyCheck~2                    * D9892  084 
        REL(5)  ~grobAlertIcon                   * D9897  085 ~grobAlertIcon
        REL(5)  ~grobCheckKey                    * D989C  086 ~grobCheckKey
        REL(5)  ROMP_0B0_087                     * D98A1  087 
        REL(5)  ROMP_0B0_088                     * D98A6  088 
        REL(5)  ROMP_0B0_089                     * D98AB  089 
        REL(5)  ROMP_0B0_08A                     * D98B0  08A 
        REL(5)  ROMP_0B0_08B                     * D98B5  08B 
        REL(5)  ROMP_0B0_08C                     * D98BA  08C 
        REL(5)  ROMP_0B0_08D                     * D98BF  08D 
        REL(5)  ROMP_0B0_08E                     * D98C4  08E 
        REL(5)  ROMP_0B0_08F                     * D98C9  08F 
        REL(5)  ROMP_0B0_090                     * D98CE  090 
        REL(5)  DoAlert                          * D98D3  091 DoAlert
        REL(5)  ROMP_0B0_092                     * D98D8  092 
        REL(5)  ROMP_0B0_093                     * D98DD  093 
        REL(5)  ~BINT46;BINT10;BLANKIT           * D98E2  094 
        REL(5)  ROMP_0B0_095                     * D98E7  095 
        REL(5)  ROMP_0B0_096                     * D98EC  096 
        REL(5)  DoInputForm~32                   * D98F1  097 
        REL(5)  ROMP_0B0_098                     * D98F6  098 
        REL(5)  ROMP_0B0_099                     * D98FB  099 
        REL(5)  ROMP_0B0_09A                     * D9900  09A 
        REL(5)  ROMP_0B0_09B                     * D9905  09B 
        REL(5)  ROMP_0B0_09C                     * D990A  09C 
        REL(5)  ROMP_0B0_09D                     * D990F  09D 
        REL(5)  ROMP_0B0_09E                     * D9914  09E 
        REL(5)  ROMP_0B0_09F                     * D9919  09F 
        REL(5)  ~9GETLAM;CARCOMP;NOT             * D991E  0A0 
        REL(5)  ROMP_0B0_0A1                     * D9923  0A1 
        REL(5)  ROMP_0B0_0A2                     * D9928  0A2 
        REL(5)  DoInputForm~33                   * D992D  0A3 
        REL(5)  ROMP_0B0_0A4                     * D9932  0A4 
        REL(5)  ROMP_0B0_0A5                     * D9937  0A5 
        REL(5)  ROMP_0B0_0A6                     * D993C  0A6 
        REL(5)  ~8GETLAM;7GETLAM;StartMenu       * D9941  0A7 
        REL(5)  ROMP_0B0_0A8                     * D9946  0A8 
        REL(5)  ROMP_0B0_0A9                     * D994B  0A9 
        REL(5)  ROMP_0B0_0AA                     * D9950  0AA 
        REL(5)  ROMP_0B0_0AB                     * D9955  0AB 
        REL(5)  ROMP_0B0_0AC                     * D995A  0AC 
        REL(5)  ROMP_0B0_0AD                     * D995F  0AD 
        REL(5)  ROMP_0B0_0AE                     * D9964  0AE 
        REL(5)  ~#3*;3GETLAM;SWAP#-              * D9969  0AF 
        REL(5)  ROMP_0B0_0B0                     * D996E  0B0 
        REL(5)  ROMP_0B0_0B1                     * D9973  0B1 
        REL(5)  ROMP_0B0_0B2                     * D9978  0B2 
        REL(5)  ROMP_0B0_0B3                     * D997D  0B3 
        REL(5)  ROMP_0B0_0B4                     * D9982  0B4 
        REL(5)  ROMP_0B0_0B5                     * D9987  0B5 
        REL(5)  ROMP_0B0_0B6                     * D998C  0B6 
        REL(5)  ROMP_0B0_0B7                     * D9991  0B7 
        REL(5)  ROMP_0B0_0B8                     * D9996  0B8 
        REL(5)  ROMP_0B0_0B9                     * D999B  0B9 
        REL(5)  ROMP_0B0_0BA                     * D99A0  0BA 
        REL(5)  ROMP_0B0_0BB                     * D99A5  0BB 
        REL(5)  ROMP_0B0_0BC                     * D99AA  0BC 
        REL(5)  ROMP_0B0_0BD                     * D99AF  0BD 
        REL(5)  ROMP_0B0_0BE                     * D99B4  0BE 
        REL(5)  ROMP_0B0_0BF                     * D99B9  0BF 
        REL(5)  ROMP_0B0_0C0                     * D99BE  0C0 
        REL(5)  ROMP_0B0_0C1                     * D99C3  0C1 
        REL(5)  ROMP_0B0_0C2                     * D99C8  0C2 
        REL(5)  ROMP_0B0_0C3                     * D99CD  0C3 
        REL(5)  ROMP_0B0_0C4                     * D99D2  0C4 
        REL(5)  ~gFldVal                         * D99D7  0C5 ~gFldVal
        REL(5)  ROMP_0B0_0C6                     * D99DC  0C6 
        REL(5)  ROMP_0B0_0C7                     * D99E1  0C7 
        REL(5)  GetFieldVals                     * D99E6  0C8 GetFieldVals
        REL(5)  ROMP_0B0_0C9                     * D99EB  0C9 
        REL(5)  ROMP_0B0_0CA                     * D99F0  0CA 
        REL(5)  ROMP_0B0_0CB                     * D99F5  0CB 
        REL(5)  ROMP_0B0_0CC                     * D99FA  0CC 
        REL(5)  ROMP_0B0_0CD                     * D99FF  0CD 
        REL(5)  ROMP_0B0_0CE                     * D9A04  0CE 
        REL(5)  ROMP_0B0_0CF                     * D9A09  0CF 
        REL(5)  ROMP_0B0_0D0                     * D9A0E  0D0 
        REL(5)  ROMP_0B0_0D1                     * D9A13  0D1 
        REL(5)  ROMP_0B0_0D2                     * D9A18  0D2 
        REL(5)  ROMP_0B0_0D3                     * D9A1D  0D3 
        REL(5)  ROMP_0B0_0D4                     * D9A22  0D4 
        REL(5)  ~sFldVal                         * D9A27  0D5 ~sFldVal
        REL(5)  ROMP_0B0_0D6                     * D9A2C  0D6 
        REL(5)  ROMP_0B0_0D7                     * D9A31  0D7 
        REL(5)  ROMP_0B0_0D8                     * D9A36  0D8 
        REL(5)  ROMP_0B0_0D9                     * D9A3B  0D9 
        REL(5)  ROMP_0B0_0DA                     * D9A40  0DA 
        REL(5)  ~nNullBind                       * D9A45  0DB ~nNullBind
        ENDLENGTH                                * D9A4A
        NIBHEX  2313000                          * D9A4A  21.
