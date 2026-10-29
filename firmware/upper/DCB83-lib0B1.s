* HP 48GX ROM revision R, #DCB83-#DE45E: Library part 0B1
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~MsgBoxMenu ~DoMsgBox DoMKeyOK Ck&DoMsgBox
* Follows on from the previous file (at #DCB83 in the original ROM).

LIB0B1:
        CON(3)  #0B1                             * DCB83  library number
        REL(5)  LIB0B1.hash                      * DCB86  hash table
        CON(5)  0                                * DCB8B  message table
        REL(5)  LIB0B1.link                      * DCB90  link table
        CON(5)  0                                * DCB95  config
        RPL

* ROMPTR 0B1 000
* refs (1): DCB83
~DoMsgBox:
        :: POLSaveUI ERRSET                      * DCB9A
          :: MINUSONE MINUSONE MINUSONE MINUSONE ROMPTR 0B3 057 FALSE BINT6 * DCBA9
            ROMPTR 0B0 0DB 5ROLL DUPTYPEGROB? ?SKIP OBJ_1A002 * DCBD7  ~nNullBind
            5UNROLL 5PICK 5PICK 5PICK ROMPTR 0B1 00B DUP 7PUTLAM BINT28 SWAP * DCBF6
            BINT9 #* #7+ #2/ #- 6PUTLAM ROMPTR 0B1 00C ' ROMPTR 0B1 001 ' * DCC29
            ROMPTR 0B1 003 TrueTrue 5ROLL ONEFALSE ' 2GETLAM 'ERRJMP * DCC67
            POLSetUI ClrDA1IsStat ClrDA2bEdit ROMPTR 0B1 008 ClrDA3OK * DCC90
            POLKeyUI ROMPTR 0B1 00D ClrDAsOK 3GETLAM ROMPTR 0B3 058 ABND ; * DCCAF
          ERRTRAP POLResUI&Err POLRestoreUI ;    * DCCDE

* ROMPTR 0B1 001
* refs (1): DCB83
~DoMsgBox~1:
        :: DA3OK? ?SKIP ?DispMenu                * DCCF2
          ClrDA3OK ;                             * DCD06

* ROMPTR 0B1 002
* refs (1): DCB83
~MsgBoxMenu:
        :: NoExitAction                          * DCD10
          { NullMenuKey NullMenuKey NullMenuKey NullMenuKey NullMenuKey * DCD1A
            { $ "OK"                             * DCD38
              :: TakeOver ROMPTR 0B1 009 ; }     * DCD4B  DoMKeyOK
          }                                      * DCD6A
        ;                                        * DCD6F

* ROMPTR 0B1 003
* refs (1): DCB83
~DoMsgBox~2:
        :: BINT1 #=casedrop ROMPTR 0B1 004       * DCD74
          BINT2 #=casedrop ROMPTR 0B1 005        * DCD8E
          BINT3 #=casedrop ROMPTR 0B1 006        * DCDA3
          BINT4 #=casedrop ROMPTR 0B1 007        * DCDB8
          2DROP 'DoBadKeyT ;                     * DCDCD

* ROMPTR 0B1 004
* refs (1): DCB83
~DoMsgBox~2~1:
        ::                                       * DCDDC
          { BINT25                               * DCDE1
            :: TakeOver ROMPTR 0B1 009 ; BINT45  * DCDEB  DoMKeyOK
            :: TakeOver ROMPTR 0B1 009 ; }       * DCE0A  DoMKeyOK
          OBJ_19FE4 caseTRUE DUP#<7              * DCE29
          casedrpfls BINT12                      * DCE38
          #=casedrpfls BINT35                    * DCE42
          #=casedrpfls BINT40                    * DCE4C
          #=casedrpfls DROP                      * DCE56
          'DoBadKeyT ;                           * DCE60

* ROMPTR 0B1 005
* refs (1): DCB83
~DoMsgBox~2~2:
        :: DUP#<7 casedrpfls BINT12              * DCE6A
          #=casedrpfls BINT35                    * DCE7E
          #=casedrpfls DROP                      * DCE88
          'DoBadKeyT ;                           * DCE92

* ROMPTR 0B1 006
* refs (1): DCB83
~DoMsgBox~2~3:
        :: BINT45 #=casedrpfls DUP#<7            * DCE9C
          casedrpfls BINT40                      * DCEB0
          #=casedrpfls DROP                      * DCEBA
          'DoBadKeyT ;                           * DCEC4

* ROMPTR 0B1 007
* refs (1): DCB83
~DoMsgBox~2~4:
        ::                                       * DCECE
          { BINT25                               * DCED3
            :: TakeOver ROMPTR 0B1 009 ; BINT45  * DCEDD  DoMKeyOK
            :: TakeOver ROMPTR 0B1 009 ; }       * DCEFC  DoMKeyOK
          OBJ_19FE4 caseTRUE BINT30              * DCF1B
          #=casedrpfls DROP                      * DCF2A
          'DoBadKeyT ;                           * DCF34

* ROMPTR 0B1 008
* refs (1): DCB83
~DoMsgBox~3:
        ::                                       * DCF3E
          { ROMPTR 0B3 05C ROMPTR 0B3 05D ROMPTR 0B3 05E * DCF43  ~BBGetDefltHeight
            ROMPTR 0B3 05F }                     * DCF69  ~$>grobOrGROB
          7GETLAM #1- OBJ_1A01B HARDBUFF BINT16 6GETLAM GROB! DUP MINUSONE * DCF79
          EQUAL ITE DROPZERO                     * DCFA6
          :: DUP HARDBUFF BINT19 6GETLAM #3+ GROB! GROBDIMw #5+ ; * DCFB5
          4UNROLL ROT BINT1 BINT5 ZERO_DO BINT4 NDUP ROMPTR 0B1 00A ITE * DCFE7
          :: 3UNROLL 4PICK 3UNROLL SUB$ $>GROB HARDBUFF BINT19 BINT8 PICK #+ * DD01A
            6GETLAM INDEX@ BINT9 #* #+ #4+ GROB! ; * DD051
          ExitAtLOOP                             * DD079
          LOOP 5DROP ;                           * DD07E

* ROMPTR 0B1 009
* refs (1): DCB83
DoMKeyOK:
        :: TRUE TRUE 2PUTLAM ;                   * DD08D

* ROMPTR 0B1 00A
* refs (1): DCB83
ROMP_0B1_00A:
        :: OVER LEN$ 2DUP #> case                * DD0A6
          :: 5DROP FALSE ;                       * DD0C4
          OVER 6ROLL #+ #1- OVER #MIN 4ROLL 4ROLL 2DUP CHR_Newline SWAP POS$ * DD0D8
          DUP 5PICK #1+ #> NOT OVER #0<> AND case * DD114
          :: 6UNROLL 5DROP DUP #1- SWAP #1+ TRUE ; * DD141
          DROP 4PICK 4PICK #> NOTcase            * DD16E
          :: 3DROP SWAPDROP DUP #1+ TRUE ;       * DD187
          SWAP CHR_Space 4PICK #1+ POS$REV SWAP 5ROLL #+ 4ROLL #MIN OVER #> * DD1AA
          ITE                                    * DD1E6
          :: DROP DUP #1+ ;                      * DD1EB
          :: SWAPDROP DUP #1- SWAP #1+ ;         * DD204
          TRUE ;                                 * DD227

* ROMPTR 0B1 00B
* refs (1): DCB83
~DoMsgBox~4:
        :: 3PICK TYPEGROB? case2drop             * DD231
          :: GROBDIM DROP BINT9 #/ SWAP #0<> IT #1+ * DD245
          ;                                      * DD272
          BINT0 4UNROLL ROT BINT1 BINT5 ZERO_DO BINT4 NDUP ROMPTR 0B1 00A * DD277
          ITE                                    * DD2AA
          :: 3UNROLL 2DROP 5ROLL #1+ 5UNROLL ; ExitAtLOOP * DD2AF
          LOOP 4DROP BINT2 #MAX ;                * DD2D7

* ROMPTR 0B1 00C
* refs (1): DCB83
~DoMsgBox~5:
        :: HARDBUFF BINT16 6GETLAM # 76 OVER 7GETLAM BINT9 #* #+ #7+ SUBGROB * DD2F0
          5PUTLAM HARDBUFF2 TOTEMPOB 4PUTLAM ;   * DD331

* ROMPTR 0B1 00D
* refs (1): DCB83
~DoMsgBox~6:
        :: 5GETLAM HARDBUFF BINT16 6GETLAM GROB! 4GETLAM HARDBUFF2 ZEROZERO * DD34A
          GROB! ;                                * DD377

* ROMPTR 0B1 00E
* refs (1): DCB83
Ck&DoMsgBox:
        :: BINT15 BINT10 MINUSONE ' ROMPTR 0B1 002 * DD381  ~MsgBoxMenu
          ROMPTR 0B1 000 DROP ;                  * DD3A5  ~DoMsgBox

* ROMPTR 0B1 00F
* refs (1): DCB83
ROMP_0B1_00F:
        :: POLSaveUI ERRSET                      * DD3BA
          :: FALSE FALSE BINT5 ROMPTR 0B0 0DB InitEd&Modes ' ROMPTR 0B1 010 * DD3C9  ~nNullBind
            ' ROMPTR 0B1 015 TrueFalse 4GETLAM ONEFALSE ' 2GETLAM ' * DD3FD
            :: SysErrorTrap AtUserStack ; POLSetUI ClrDAsOK AtUserStack * DD42B
            POLKeyUI ABND ;                      * DD44E
          ERRTRAP POLResUI&Err POLRestoreUI ClrDAsOK ; * DD45D

* ROMPTR 0B1 010
* refs (1): DCB83
ROMP_0B1_010:
        :: DA2aOK? DUP ITE SetDA2aTempF ClrDA2aTempF * DD476
          ?SKIP ?DispStack                       * DD494
          DA2aTempF? DA2bOK?NOTIT DispEditLine DA3OK? DUPUNROT NOTAND * DD49E
          ROMPTR 0B1 013 NOTAND IT SetDA1Bad     * DD4BC
          ?SKIP ?DispMenu                        * DD4D6
          DA1OK? ?SKIP ROMPTR 0B1 011            * DD4E0
          ClrDAsOK ;                             * DD4F5

* ROMPTR 0B1 011
* refs (1): DCB83
ROMP_0B1_011:
        :: KEYINBUFFER? NOTcase ROMPTR 0B1 012   * DD4FF
          SetDA1Bad ;                            * DD519

* ROMPTR 0B1 012
* refs (1): DCB83
ROMP_0B1_012:
        :: ROMPTR 0B1 013 3GETLAM ANDcase DispStatus * DD523
          TOADISP DispStsBound 6GETLAM EVAL DUPTYPECSTR? IT ROMPTR 0B0 0A5 * DD542
          HARDBUFF ZEROZERO BINT0 BINT7 BLANKIT GROB! ROMPTR 0B1 013 ITE * DD56B
          :: 5GETLAM EVAL ;                      * DD599
          :: # B901 JstGetTHEMESG ;              * DD5AD
          DUPTYPECSTR? ITE                       * DD5C6
          :: $>grob BINT1 BINT8 ;                * DD5D0
          :: BINT1 BINT7 ;                       * DD5E9
          HARDBUFF 3UNROLL BINT7 BINT7 BLANKIT GROB! SetDA1Valid ; * DD5FD

* ROMPTR 0B1 013
* refs (1): DCB83
ROMP_0B1_013:
        :: MenuDef@ 4GETLAM EQUAL ;              * DD625

* ROMPTR 0B1 014
* refs (1): DCB83
ROMP_0B1_014:
        :: NoExitAction                          * DD63E
          {                                      * DD648
            {                                    * DD64D
              :: PTR Box/StdLbl: $ "STS" 3GETLAM ; ROMPTR 0B1 019 } * DD652
            NullMenuKey NullMenuKey NullMenuKey  * DD686
            { $ "(AN(L" ROMPTR 0B1 01A }         * DD695
            { $ "OK" ROMPTR 0B1 01B } }          * DD6BE
        ;                                        * DD6E6

* ROMPTR 0B1 015
* refs (1): DCB83
ROMP_0B1_015:
        :: BINT1 #=casedrop ROMPTR 0B1 016       * DD6EB
          BINT2 #=casedrop ROMPTR 0B1 017        * DD705
          BINT4 #=casedrop ROMPTR 0B1 016        * DD71A
          2DROPFALSE ;                           * DD72F

* ROMPTR 0B1 016
* refs (1): DCB83
ROMP_0B1_016:
        :: BINT45 ?CaseKeyDef ROMPTR 0B1 01A DROPFALSE ; * DD739

* ROMPTR 0B1 017
* refs (1): DCB83
ROMP_0B1_017:
        :: BINT45 ?CaseKeyDef ROMPTR 0B1 018 DROPFALSE ; * DD75D

* ROMPTR 0B1 018
* refs (1): DCB83
ROMP_0B1_018:
        :: TakeOver 4GETLAM InitMenu SetDA2NoCh ; * DD781

* ROMPTR 0B1 019
* refs (1): DCB83
ROMP_0B1_019:
        :: TakeOver 3GETLAM NOT 3PUTLAM SetDA2NoCh ; * DD79F

* ROMPTR 0B1 01A
* refs (1): DCB83
ROMP_0B1_01A:
        :: TakeOver EditLExists? DAsBad? ORcase ROMP_0A1_02C * DD7C2
          FALSE TRUE 2PUTLAM ;                   * DD7E0

* ROMPTR 0B1 01B
* refs (1): DCB83
ROMP_0B1_01B:
        :: TakeOver EditExstCase ROMP_0A1_018 DEPTH #0<> TRUE 2PUTLAM ; * DD7F4

* ROMPTR 0B1 01C
* refs (1): DCB83
INFORM~1:
        :: SuspendOK? NOTcase NOHALTERR          * DD821
          4PICK INNERCOMP DUP#0= caseSIZEERR DUP * DD835
          1LAMBIND ZERO_DO ISTOP@ ROLL DUPTYPELIST? IT * DD84E
          :: DUPNULLCOMP? casedrop MINUSONE      * DD86C
            CARCOMP ;                            * DD880
          DUPTYPECSTR? OVER MINUSONE EQUAL OR NOTcase SETTYPEERR * DD88A
          LOOP 1GETABND {}N BINT1 5ROLL INNERCOMP DUP BINT2 #> caseSIZEERR * DD8AD
          :: BINT0 #=casedrop                    * DD8DF
            :: BINT1 BINT3 ;                     * DD8EE
            #1=case                              * DD902
            :: CKREAL COERCE DUP#0= caseSIZEERR BINT3 * DD907
            ;                                    * DD925
            SWAP CKREAL COERCE DUP#0= caseSIZEERR SWAP * DD92A
            CKREAL COERCE ;                      * DD948
          SWAP BINT10 #MIN SWAP BINT20 #MIN ROMPTR 0B1 01E DUPNULLCOMP? * DD957
          caseSIZEERR 5ROLL                      * DD985
          SWAP INNERCOMP BINT1 OVER 2NULLLAM{} BIND ZERO_DO ISTOP@ ROLL * DD98F
          'DROPFALSE >HCOMP BINT1 BEGIN ISTOP@ #2+ PICK INDEX@ 2GETLAM #+ * DD9BC
          NTHCOMPDROP DUPTYPELIST? ITE DUPNULLCOMP? FALSE * DD9EE
          WHILE                                  * DDA07
          :: DROP 2GETLAM #1+ 2PUTLAM ; REPEAT   * DDA0C
          :: CK&DISPATCH0                        * DDA2F
            BINT3                                * DDA39  string
            :: DROP MINUSONE NULL$ ;             * DDA3E
            BINT5                                * DDA57  list
            :: DUPLENCOMP DUP BINT2 #< case2drop * DDA5C
              :: MINUSONE NULL$ ;                * DDA7A
              OVER BINT2 NTHCOMPDROP DUPTYPECSTR? NcaseTYPEERR 3UNROLL * DDA8E
              DUP #2= case2drop                  * DDAAC
              :: MINUSONE SWAP BINT131 ROMPTR 0B0 06F DROP ; * DDABB
              BINT3 SWAP SUBCOMP ROMPTR 0B1 01D SWAP BINT131 ROMPTR 0B0 06F * DDAE4
              DROP ;                             * DDB13
          ;                                      * DDB1D
          BINT4 SWAP MINUSONE DUP BINT6 {}N &COMP LOOP 1GETLAM {}N SWAPDROP * DDB22
          'DROPFALSE 6ROLL BINT131 #4- ROMPTR 0B0 06F DROP 6ROLL * DDB59
          DUPNULLCOMP? ITE                       * DDB82
          :: DROP MINUSONE ;                     * DDB8C
          :: INNERCOMP 1GETLAM OVER #<> caseSIZEERR ZERO_DO * DDBA0
            ISTOP@ ROLL DUP ' ROMPTR 0AB 05B EQUAL IT * DDBC3  ~xNOVAL
            :: DROP MINUSONE ;                   * DDBEC
            LOOP 1GETLAM {}N ;                   * DDC00
          6ROLL DUPNULLCOMP? ITE                 * DDC14
          :: DROP MINUSONE ;                     * DDC23
          :: INNERCOMP 1GETLAM OVER #<> caseSIZEERR ZERO_DO * DDC37
            ISTOP@ ROLL DUP ' ROMPTR 0AB 05B EQUAL IT * DDC5A  ~xNOVAL
            :: DROP MINUSONE ;                   * DDC83
            LOOP 1GETLAM {}N ;                   * DDC97
          ROMPTR 0B1 022 DoInputForm NOTcase     * DDCAB
          :: ABND %0_2A2B4 ;                     * DDCC0
          1GETLAM ZERO_DO ISTOP@ ROLL DUP MINUSONE EQUAL IT * DDCD4
          :: DROP ' ROMPTR 0AB 05B ;             * DDCFC  ~xNOVAL
          LOOP 1GETABND {}N %1 ;                 * DDD1B

* ROMPTR 0B1 01D
* refs (1): DCB83
INFORM~1~1:
        :: INNERCOMP DUP 1LAMBIND ZERO_DO ISTOP@ ROLL CKREAL COERCE * DDD34
          { BINT0 BINT1 BINT2 BINT3 BINT4 BINT5 BINT6 BINT8 BINT9 BINT10 * DDD61
            BINT13 }                             * DDD98
          OVER #=POSCOMP #0= caseSIZEERR LOOP    * DDDA2
          1GETABND {}N ;                         * DDDBB

* ROMPTR 0B1 01E
* refs (1): DCB83
ROMP_0B1_01E:
        :: BINT6 #* 3NULLLAM{} BIND INNERCOMP NULL{} DUP ROT ZERO_DO * DDDCA
          ISTOP-INDEX #2+ ROLL DUPTYPELIST? IT CARCOMP * DDDFC
          DUP MINUSONE EQUAL ITE                 * DDE1A
          :: DROP DUPNULLCOMP? ?SEMI             * DDE2E
            DUPLENCOMP 2DUP NTHCOMPDROP DUP BINT2 NTHCOMPDROP * DDE42
            { BINT8 BINT17 BINT26 BINT35 } 3GETLAM INDEX@ 2GETLAM #/ * DDE60
            SWAPDROP #+ NTHELCOMP ?SKIP MINUSONE * DDE92
            #<> case2DROP BINT131                * DDEAB
            #2- 2GETLAM #/ SWAPDROP BINT6 #/ SWAPDROP BINT6 #* SWAP * DDEBA
            INCOMPDROP SWAP 5ROLL #+ SWAP BINT4 {}N SWAPROT PUTLIST ; * DDEEC
          :: BINT131 #2- 2GETLAM #1- BINT5 #* OBJ_6C339 2GETLAM #/ SWAPDROP * DDF1E
            DUP BINT5 #+ INDEX@ 2GETLAM #/ DROP #* #1+ BINT131 #2- #MIN 2DUP * DDF55
            #+ BINT7 OBJ_6C339 BINT2 OBJ_6C339 1GETLAM DUP#0<> ITE * DDF96
            :: 3PICK ROT ROMPTR 0B1 020 ; DROP   * DDFBE
            OVER 5PICK ROMPTR 0B0 071 #+ BINT2 #+ 1GETLAM DUP#0<> ITE * DDFE2
            :: 4PICK ROT ROMPTR 0B1 021 ; DROP   * DE015
            #MIN BINT131 #2- #MIN 2DUP SWAP OBJ_6C339 BINT2 OBJ_6C339 5ROLL * DE039
            SWAP ROMPTR 0B0 06F DROP 4UNROLL ROT 3PICK #1-+ OVER OBJ_6C339 * DE06B
            #1- BINT6 #/ SWAPDROP BINT6 #* #1+ BINT9 ROT * DE09E
            { BINT8 BINT17 BINT26 BINT35 } 3GETLAM INDEX@ 2GETLAM #/ * DE0CB
            SWAPDROP #+ DUP BINT4 #> case 7DROP  * DE0FD
            NTHCOMPDROP 2SWAP BINT4 {}N 4ROLLSWAP >TCOMP 3UNROLL * DE120
            { BINT10 BINT19 BINT28 BINT37 } 3GETLAM INDEX@ 2GETLAM #/ * DE143
            SWAPDROP #+ NTHCOMPDROP BINT3 {}N ROTSWAP >TCOMP SWAP ; * DE175
          LOOP ABND ;                            * DE1A2

* ROMPTR 0B1 020
* refs (2): DCB83 DCB83
ROMP_0B1_020:
        :: OVER #1-- 3PICK #/ SWAPDROP ROT #* #+ ; * DE1B1

* ROMPTR 0B1 021
* refs (1): DCB83
ROMP_0B1_021:
        :: OVER #1-- 3PICK #/ SWAP #0<> IT #1+   * DE1E3
          ROT #* #+ ;                            * DE210

* ROMPTR 0B1 022
* refs (1): DCB83
ROMP_0B1_022:
        :: MINUSONE MINUSONE BINT8 ROMPTR 0B0 0DB 9GETLAM INNERCOMP DUP * DE224  ~nNullBind
          3PUTLAM ZERO_DO ISTOP-INDEX INDEX@ OBJ_6819D #+ ROLL INCOMPDROP * DE252
          LOOP 8GETLAM INNERCOMP DUP 2PUTLAM ZERO_DO ISTOP-INDEX INDEX@ * DE27A
          BINT13 #* #+ ROLL INCOMPDROP 5GETLAM DUP MINUSONE EQUAL ?SKIP * DE2A2
          :: INDEX@ #1+ NTHCOMPDROP ;            * DE2D4
          4GETLAM DUP MINUSONE EQUAL ?SKIP       * DE2ED
          :: INDEX@ #1+ NTHCOMPDROP ;            * DE306
          LOOP 3GETLAM 2GETLAM 7GETLAM 6GETLAM ABND ; * DE31F

LIB0B1.hash:
        CON(5)  DOHSTR                           * DE342  hash table of library 0B1
        LENGTH                                   * DE347  length, to #DE3A6
        CON(5)  0                                * DE34C  names of length 1
        CON(5)  0                                * DE351  names of length 2
        CON(5)  0                                * DE356  names of length 3
        CON(5)  0                                * DE35B  names of length 4
        CON(5)  0                                * DE360  names of length 5
        CON(5)  0                                * DE365  names of length 6
        CON(5)  0                                * DE36A  names of length 7
        CON(5)  0                                * DE36F  names of length 8
        CON(5)  0                                * DE374  names of length 9
        CON(5)  0                                * DE379  names of length 10
        CON(5)  0                                * DE37E  names of length 11
        CON(5)  0                                * DE383  names of length 12
        CON(5)  0                                * DE388  names of length 13
        CON(5)  0                                * DE38D  names of length 14
        CON(5)  0                                * DE392  names of length 15
        CON(5)  0                                * DE397  names of length 16
        REL(5)  L_DE3A1                          * DE39C  end of the names
L_DE3A1:
        CON(5)  0                                * DE3A1  command 000 has no name
        ENDLENGTH                                * DE3A6

LIB0B1.link:
        CON(5)  DOHSTR                           * DE3A6  link table of library 0B1
        LENGTH                                   * DE3AB  length, to #DE45F
        REL(5)  ~DoMsgBox                        * DE3B0  000 ~DoMsgBox
        REL(5)  ~DoMsgBox~1                      * DE3B5  001 
        REL(5)  ~MsgBoxMenu                      * DE3BA  002 ~MsgBoxMenu
        REL(5)  ~DoMsgBox~2                      * DE3BF  003 
        REL(5)  ~DoMsgBox~2~1                    * DE3C4  004 
        REL(5)  ~DoMsgBox~2~2                    * DE3C9  005 
        REL(5)  ~DoMsgBox~2~3                    * DE3CE  006 
        REL(5)  ~DoMsgBox~2~4                    * DE3D3  007 
        REL(5)  ~DoMsgBox~3                      * DE3D8  008 
        REL(5)  DoMKeyOK                         * DE3DD  009 DoMKeyOK
        REL(5)  ROMP_0B1_00A                     * DE3E2  00A 
        REL(5)  ~DoMsgBox~4                      * DE3E7  00B 
        REL(5)  ~DoMsgBox~5                      * DE3EC  00C 
        REL(5)  ~DoMsgBox~6                      * DE3F1  00D 
        REL(5)  Ck&DoMsgBox                      * DE3F6  00E Ck&DoMsgBox
        REL(5)  ROMP_0B1_00F                     * DE3FB  00F 
        REL(5)  ROMP_0B1_010                     * DE400  010 
        REL(5)  ROMP_0B1_011                     * DE405  011 
        REL(5)  ROMP_0B1_012                     * DE40A  012 
        REL(5)  ROMP_0B1_013                     * DE40F  013 
        REL(5)  ROMP_0B1_014                     * DE414  014 
        REL(5)  ROMP_0B1_015                     * DE419  015 
        REL(5)  ROMP_0B1_016                     * DE41E  016 
        REL(5)  ROMP_0B1_017                     * DE423  017 
        REL(5)  ROMP_0B1_018                     * DE428  018 
        REL(5)  ROMP_0B1_019                     * DE42D  019 
        REL(5)  ROMP_0B1_01A                     * DE432  01A 
        REL(5)  ROMP_0B1_01B                     * DE437  01B 
        REL(5)  INFORM~1                         * DE43C  01C 
        REL(5)  INFORM~1~1                       * DE441  01D 
        REL(5)  ROMP_0B1_01E                     * DE446  01E 
        REL(5)  ROMP_0B1_020                     * DE44B  01F 
        REL(5)  ROMP_0B1_020                     * DE450  020 
        REL(5)  ROMP_0B1_021                     * DE455  021 
        REL(5)  ROMP_0B1_022                     * DE45A  022 
