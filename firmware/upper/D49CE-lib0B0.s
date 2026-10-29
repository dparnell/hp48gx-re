* HP 48GX ROM revision R, #D49CE-#D79FC: Library part 0B0
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~IFMenuRow2 ~IFMenuRow1 IFEDispField DoKeyOK DoKeyEdit DoKeyCancel
* Follows on from the previous file (at #D49CE in the original ROM).

LIB0B0:
        CON(3)  #0B0                             * D49CE  library number
        REL(5)  LIB0B0.hash                      * D49D1  hash table
        CON(5)  0                                * D49D6  message table
        REL(5)  LIB0B0.link                      * D49DB  link table
        CON(5)  0                                * D49E0  config
        RPL

* ROMPTR 0B0 000
* refs (1): D49CE
ROMP_0B0_000:
        :: OBJ_387BE ERROR@ BINT0 #=casedrop OBJ_3881D * D49E5
          #CAlarmErr #=case ERRJMP               * D4A03
          OBJ_18802 ERROR@ OBJ_3881D MakeMessage(proc,s) CHR_Newline >T$ * D4A12
          SWAP&$ TOADISP REDISPHBUFF ROMPTR 0B0 091 ; * D4A30  DoAlert

* ROMPTR 0B0 001
* refs (1): D49CE
DoInputForm~1~2:
        :: KEYINBUFFER? case SetDA1Bad           * D4A4F
          TOADISP ROMPTR 0B0 00F SetDA1Valid ;   * D4A63

* ROMPTR 0B0 002
* refs (1): D49CE
DoInputForm~1~3:
        :: KEYINBUFFER? case SetDA2aBad          * D4A7D
          TOADISP ROMPTR 0B0 00C SetDA2aValid ;  * D4A91

* ROMPTR 0B0 003
* refs (1): D49CE
DoInputForm~1~4:
        :: KEYINBUFFER? ?SEMI                    * D4AAB
          EDITPARTS BINT1 #> ?SEMI               * D4ABA
          9GETLAM 14GETLAM #1+_ONE_DO            * D4ACE
          :: ATTN? ?SEMI                         * D4ADD
            KEYINBUFFER? ?SEMI                   * D4AEC
            DUP INDEX@ #1+ NTHCOMPDROP ?SKIP     * D4AF6
            :: INDEX@ ROMPTR 0B0 013 ;           * D4B0F  IFEDispField
          ;                                      * D4B29
          LOOP DROP ;                            * D4B2E

* ROMPTR 0B0 004
* refs (1): D49CE
DoInputForm~3~2:
        :: NoExitAction                          * D4B3D
          {                                      * D4B47
            {                                    * D4B4C
              :: TakeOver 5GETLAM ROMPTR 0B0 088 ITE $ "EDIT" NULL$ * D4B51
              ;                                  * D4B87
              :: TakeOver ROMPTR 0B0 056 ; }     * D4B8C  DoKeyEdit
            {                                    * D4BAB
              :: TakeOver 5GETLAM ROMPTR 0B0 08A ITE $ "CHOOS" NULL$ * D4BB0
              ;                                  * D4BE8
              :: TakeOver ROMPTR 0B0 057 ; }     * D4BED
            {                                    * D4C0C
              :: TakeOver 5GETLAM ROMPTR 0B0 08D ITE ROMPTR 0B0 086 NULL$ * D4C11  ~grobCheckKey
              ;                                  * D4C40
              :: TakeOver ROMPTR 0B0 058 ; }     * D4C45
            NullMenuKey                          * D4C64
            { $ "(AN(L"                          * D4C69
              :: TakeOver ROMPTR 0B0 059 ; }     * D4C82  DoKeyCancel
            { $ "OK"                             * D4CA1
              :: TakeOver ROMPTR 0B0 05A ; }     * D4CB4  DoKeyOK
            { $ "RESET"                          * D4CD3
              :: TakeOver ROMPTR 0B0 05B ; }     * D4CEC
            {                                    * D4D0B
              :: TakeOver 5GETLAM ROMPTR 0B0 088 ITE $ "CALC" NULL$ * D4D10
              ;                                  * D4D46
              :: TakeOver ROMPTR 0B0 05C ; }     * D4D4B
            {                                    * D4D6A
              :: TakeOver 5GETLAM ROMPTR 0B0 088 ITE $ "TYPES" NULL$ * D4D6F
              ;                                  * D4DA7
              :: TakeOver ROMPTR 0B0 05D ; }     * D4DAC
            NullMenuKey                          * D4DCB
            { $ "(AN(L"                          * D4DD0
              :: TakeOver ROMPTR 0B0 059 ; }     * D4DE9  DoKeyCancel
            { $ "OK"                             * D4E08
              :: TakeOver ROMPTR 0B0 05A ; }     * D4E1B  DoKeyOK
          }                                      * D4E3A
        ;                                        * D4E3F

* ROMPTR 0B0 005
* refs (1): D49CE
~IFMenuRow1:
        {                                        * D4E44
          {                                      * D4E49
            :: TakeOver 5GETLAM ROMPTR 0B0 088 ITE $ "EDIT" NULL$ * D4E4E
            ;                                    * D4E84
            :: TakeOver ROMPTR 0B0 056 ; }       * D4E89  DoKeyEdit
          {                                      * D4EA8
            :: TakeOver 5GETLAM ROMPTR 0B0 08A ITE $ "CHOOS" NULL$ * D4EAD
            ;                                    * D4EE5
            :: TakeOver ROMPTR 0B0 057 ; }       * D4EEA
          {                                      * D4F09
            :: TakeOver 5GETLAM ROMPTR 0B0 08D ITE ROMPTR 0B0 086 NULL$ * D4F0E  ~grobCheckKey
            ;                                    * D4F3D
            :: TakeOver ROMPTR 0B0 058 ; }       * D4F42
        }                                        * D4F61

* ROMPTR 0B0 006
* refs (1): D49CE
~IFMenuRow2:
        {                                        * D4F66
          { $ "RESET"                            * D4F6B
            :: TakeOver ROMPTR 0B0 05B ; }       * D4F84
          {                                      * D4FA3
            :: TakeOver 5GETLAM ROMPTR 0B0 088 ITE $ "CALC" NULL$ * D4FA8
            ;                                    * D4FDE
            :: TakeOver ROMPTR 0B0 05C ; }       * D4FE3
          {                                      * D5002
            :: TakeOver 5GETLAM ROMPTR 0B0 088 ITE $ "TYPES" NULL$ * D5007
            ;                                    * D503F
            :: TakeOver ROMPTR 0B0 05D ; }       * D5044
          NullMenuKey                            * D5063
          { $ "(AN(L"                            * D5068
            :: TakeOver ROMPTR 0B0 059 ; }       * D5081  DoKeyCancel
          { $ "OK"                               * D50A0
            :: TakeOver ROMPTR 0B0 05A ; }       * D50B3  DoKeyOK
        }                                        * D50D2

* ROMPTR 0B0 007
* refs (1): D49CE
ROMP_0B0_007:
        :: NoExitAction                          * D50D7
          { NullMenuKey NullMenuKey NullMenuKey NullMenuKey * D50E1
            { $ "(AN(L"                          * D50FA
              :: TakeOver ROMPTR 0B0 059 ; }     * D5113  DoKeyCancel
            { $ "OK"                             * D5132
              :: TakeOver ROMPTR 0B0 05A ; }     * D5145  DoKeyOK
            <SkipKey >SkipKey <DelKey >DelKey TogInsertKey * D5164
            { $ "↑STK"                           * D517D
              :: TakeOver UStackDepth #0=case DoBadKey * D5194
                OBJ_4365D ;                      * D51AD
            }                                    * D51B7
          }                                      * D51BC
        ;                                        * D51C1

* ROMPTR 0B0 008
* refs (1): D49CE
ROMP_0B0_008:
        {                                        * D51C6
          { $ "(AN(L"                            * D51CB
            :: TakeOver ROMPTR 0B0 059 ; }       * D51E4  DoKeyCancel
          { $ "OK"                               * D5203
            :: TakeOver ROMPTR 0B0 05A ; }       * D5216  DoKeyOK
          <SkipKey >SkipKey <DelKey >DelKey TogInsertKey * D5235
          { $ "↑STK"                             * D524E
            :: TakeOver UStackDepth #0=case DoBadKey * D5265
              OBJ_4365D ;                        * D527E
          }                                      * D5288
        }                                        * D528D

* ROMPTR 0B0 009
* refs (1): D49CE
DoInputForm~3:
        :: BINT15 OBJ_19FA7 ?SEMI                * D5292
          ROMPTR 0B0 00A NOTcase                 * D52A6
          :: ' ROMPTR 0B0 004 ;                  * D52B6
          ' NoExitAction ROMPTR 0B0 005 ROT &COMP * D52D0  ~IFMenuRow1
          ROMPTR 0B0 006 &COMP BINT2 ::N ;       * D52EF  ~IFMenuRow2

* ROMPTR 0B0 00A
* refs (1): D49CE
DoInputForm~3~1:
        :: BINT16 OBJ_19FA7 ?SEMI                * D530E
          FALSE ;                                * D5322

* ROMPTR 0B0 00B
* refs (1): D49CE
DoInputForm~4:
        :: BINT17 OBJ_19FA7 DROP ;               * D532C

* ROMPTR 0B0 00C
* refs (1): D49CE
DoInputForm~1~3~1:
        :: BINT4 OBJ_19FA7 ?SEMI                 * D5345
          EDITPARTS BINT1 #> case ROMPTR 0B0 00D * D5359
          ROMPTR 0B0 097 HARDBUFF BINT0 BINT7 GROB! 14GETLAM #1+_ONE_DO * D5378
          INDEX@ KEYINBUFFER? ATTN? OR ITE ROMPTR 0B0 0A2 ROMPTR 0B0 013 * D53A1  IFEDispField
          LOOP ;                                 * D53D0

* ROMPTR 0B0 00D
* refs (1): D49CE
DoInputForm~1~3~1~1:
        :: FALSE 5GETLAM ROMPTR 0B0 017 ;        * D53DA

* ROMPTR 0B0 00E
* refs (1): D49CE
DoInputForm~1~3~1~2~1:
        :: BINT5 OBJ_19FA7 ?SEMI                 * D53F9
          BINT39 BINT131 MAKEGROB 15GETLAM #1+_ONE_DO INDEX@ ROMPTR 0B0 012 * D540D
          LOOP TRUE ;                            * D5436

* ROMPTR 0B0 00F
* refs (1): D49CE
DoInputForm~1~2~1:
        :: BINT1 OBJ_19FA7 ?SEMI                 * D5445
          ROMPTR 0B0 010 HARDBUFF ZEROZERO GROB! ; * D5459

* ROMPTR 0B0 010
* refs (1): D49CE
ROMP_0B0_010:
        :: BINT2 OBJ_19FA7 ?SEMI                 * D5478
          ROMPTR 0B0 011 ROMPTR 0B0 0A5 ;        * D548C

* ROMPTR 0B0 011
* refs (1): D49CE
ROMP_0B0_011:
        :: BINT3 OBJ_19FA7 ?SEMI                 * D54A7
          ROMPTR 0B0 0AE ;                       * D54BB

* ROMPTR 0B0 012
* refs (1): D49CE
ROMP_0B0_012:
        :: BINT6 OBJ_19FA7 ?SEMI                 * D54CB
          DUP ROMPTR 0B0 0B0 $>grob 3PICK ROT ROMPTR 0B0 0B3 3PICK HARDBUFF * D54DF
          EQUAL ?SKIP                            * D5513
          :: BINT7 #- ;                          * D551D
          GROB! ;                                * D5531

* ROMPTR 0B0 013
* refs (1): D49CE
IFEDispField:
        :: BINT7 IFECallFieldMH ?SEMI            * D553B
          4GETLAM DUP ROMPTR 0B0 044 OVER 5GETLAM #= IT INVGROB * D554F
          HARDBUFF ROT ROMPTR 0B0 0C6 GROB! ;    * D557D

* ROMPTR 0B0 014
* refs (1): D49CE
ROMP_0B0_014:
        :: DA2aBad? caseDROP BINT21              * D559C
          IFECallFieldMH ?SEMI                   * D55B0
          4GETLAM ROMPTR 0B0 016 ;               * D55BA

* ROMPTR 0B0 015
* refs (1): D49CE
ROMP_0B0_015:
        :: DA2aBad? caseDROP BINT22              * D55CF
          IFECallFieldMH ?SEMI                   * D55E3
          4GETLAM ROMPTR 0B0 016 ;               * D55ED

* ROMPTR 0B0 016
* refs (1): D49CE
ROMP_0B0_016:
        :: DUP ROMPTR 0B0 0C6 2DUP 2DUP 7ROLL ROMPTR 0B0 0C7 ROT #+ 3UNROLL * D5602
          #+ SWAP HARDBUFF 5UNROLL SUBGROB INVGROB HARDBUFF 4ROLL 4ROLL * D5640
          GROB! ;                                * D566D

* ROMPTR 0B0 017
* refs (1): D49CE
ROMP_0B0_017:
        :: BINT11 IFECallFieldMH ?SEMI           * D5677
          4GETLAM ROMPTR 0B0 018 HARDBUFF BINT1 4ROLL ITE * D568B
          :: BINT50 ROMPTR 0B0 094 ;             * D56AF
          :: BINT8 ROMPTR 0B0 093 ;              * D56C9
          GROB! ;                                * D56E3

* ROMPTR 0B0 018
* refs (1): D49CE
ROMP_0B0_018:
        :: BINT12 IFECallFieldMH ?SEMI           * D56ED
          4GETLAM ROMPTR 0B0 019 $>grob ;        * D5701

* ROMPTR 0B0 019
* refs (1): D49CE
ROMP_0B0_019:
        :: BINT13 IFECallFieldMH ?SEMI           * D571B
          4GETLAM ROMPTR 0B0 0C1 ;               * D572F

* ROMPTR 0B0 01A
* refs (1): D49CE
ROMP_0B0_01A:
        :: BINT31 IFECallFieldMH ?SEMI           * D5744
          NULL$ 4GETLAM ROMPTR 0B0 01B ROMPTR 0B3 066 NOTcase SetDA123NoCh * D5758  ~ChooseSimple
          EVAL ;                                 * D5782

* ROMPTR 0B0 01B
* refs (1): D49CE
ROMP_0B0_01B:
        :: BINT32 IFECallFieldMH ?SEMI           * D578C
          4GETLAM ROMPTR 0B0 07D ITE             * D57A0
          :: DROP                                * D57B5
            { # B903 ROMPTR 0B0 01C } ;          * D57BF
          { # B904 ROMPTR 0B0 01C }              * D57E3
          { # B905 ROMPTR 0B0 01D } TWO{}N ;     * D5802

* ROMPTR 0B0 01C
* refs (1): D49CE
ROMP_0B0_01C:
        :: 5GETLAM DUP ROMPTR 0B0 01F ROMPTR 0B0 013 SetDA123NoCh ; * D582B  IFEDispField

* ROMPTR 0B0 01D
* refs (1): D49CE
ROMP_0B0_01D:
        :: ROMPTR 0B0 01E                        * D585A
          :: SetDA1NoCh SetDA3NoCh ; ;           * D586A

* ROMPTR 0B0 01E
* refs (1): D49CE
ROMP_0B0_01E:
        :: BINT34 OBJ_19FA7 ?SEMI                * D5883
          14GETLAM #1+_ONE_DO INDEX@ ROMPTR 0B0 01F LOOP 5GETLAM * D5897
          ROMPTR 0B0 023 ?SEMI                   * D58BB
          ROMPTR 0B0 020 ROMPTR 0B0 06B ;        * D58CB

* ROMPTR 0B0 01F
* refs (1): D49CE
ROMP_0B0_01F:
        :: BINT33 IFECallFieldMH ?SEMI           * D58E6
          4GETLAM DUP DUP ROMPTR 0B0 0C4 SWAP ROMPTR 0B0 0D5 ROMPTR 0B0 041 ; * D58FA  ~sFldVal

* ROMPTR 0B0 020
* refs (1): D49CE
ROMP_0B0_020:
        :: BINT14 OBJ_19FA7 ?SEMI                * D5934
          BINT1 ;                                * D5948

* ROMPTR 0B0 021
* refs (1): D49CE
ROMP_0B0_021:
        :: DUP MINUSONE #=case DROP              * D5952
          BINT19 IFECallFieldMH DROP ;           * D596B

* ROMPTR 0B0 022
* refs (1): D49CE
ROMP_0B0_022:
        :: BINT20 IFECallFieldMH DROP ;          * D597F

* ROMPTR 0B0 023
* refs (1): D49CE
ROMP_0B0_023:
        :: BINT55 IFECallFieldMH ?SEMI           * D5998
          TRUE ;                                 * D59AC

* ROMPTR 0B0 024
* refs (1): D49CE
ROMP_0B0_024:
        :: BINT54 IFECallFieldMH ?SEMI           * D59B6
          4GETLAM ROMPTR 0B0 025 ;               * D59CA

* ROMPTR 0B0 025
* refs (1): D49CE
ROMP_0B0_025:
        :: BINT52 IFECallFieldMH ?SEMI           * D59DF
          4GETLAM BEGIN ROMPTR 0B0 072 ?SKIP BINT1 * D59F3
          DUP ROMPTR 0B0 023 UNTIL ;             * D5A12

* ROMPTR 0B0 026
* refs (1): D49CE
ROMP_0B0_026:
        :: BINT53 IFECallFieldMH ?SEMI           * D5A2C
          4GETLAM BEGIN ROMPTR 0B0 073 ?SKIP 14GETLAM * D5A40
          DUP ROMPTR 0B0 023 UNTIL ;             * D5A5F

* ROMPTR 0B0 027
* refs (1): D49CE
ROMP_0B0_027:
        :: BINT48 IFECallFieldMH ?SEMI           * D5A79
          4GETLAM DUP ROMPTR 0B0 0C6 SWAP 3UNROLL OVER BEGIN * D5A8D
          :: BEGIN ROMPTR 0B0 072 ?SKIP BINT1    * D5AB6
            DUP ROMPTR 0B0 023 UNTIL DUP 4PICK #=case FalseTrue * D5AD5
            DUP ROMPTR 0B0 0C6 SWAPDROP 3PICK #<> case TrueTrue * D5AFE
            FALSE ;                              * D5B27
          UNTIL ROTDROP ROTDROP NOTcase SWAPDROP * D5B31
          DUP ROMPTR 0B0 0C6 SWAPDROPSWAP DUP BEGIN * D5B4A
          :: DUP ROMPTR 0B0 0C6 5PICK #<> case2drop TRUE * D5B69
            ROTDROP OVER ROMPTR 0B0 0C7 DROP #1-+ 4PICK #< NOT ; * D5B92
          NOT WHILE                              * D5BC5
          :: DUP BEGIN ROMPTR 0B0 072 ?SKIP BINT1 * D5BCF
            DUP ROMPTR 0B0 023 UNTIL ;           * D5BF3
          REPEAT ROTROT2DROP ;                   * D5C0D

* ROMPTR 0B0 028
* refs (1): D49CE
ROMP_0B0_028:
        :: BINT49 IFECallFieldMH ?SEMI           * D5C1C
          4GETLAM DUP ROMPTR 0B0 0C6 SWAP 3UNROLL OVER BEGIN * D5C30
          :: BEGIN ROMPTR 0B0 073 ?SKIP 14GETLAM * D5C59
            DUP ROMPTR 0B0 023 UNTIL DUP 4PICK #=case FalseTrue * D5C78
            DUP ROMPTR 0B0 0C6 SWAPDROP 3PICK #<> case TrueTrue * D5CA1
            FALSE ;                              * D5CCA
          UNTIL ROTDROP ROTDROP NOTcase SWAPDROP * D5CD4
          DUP ROMPTR 0B0 0C6 SWAPDROPSWAP DUP BEGIN * D5CED
          :: DUP ROMPTR 0B0 0C6 5PICK #<> case2drop TRUE * D5D0C
            ROTDROP 4PICK #> NOT ;               * D5D35
          NOT WHILE                              * D5D4E
          :: DUP BEGIN ROMPTR 0B0 073 ?SKIP 14GETLAM * D5D58
            DUP ROMPTR 0B0 023 UNTIL ;           * D5D7C
          REPEAT ROTROT2DROP ;                   * D5D96

* ROMPTR 0B0 029
* refs (1): D49CE
DoInputForm~2~3~4~1:
        :: BINT50 IFECallFieldMH ?SEMI           * D5DA5
          14GETLAM BEGIN DUP ROMPTR 0B0 023 NOT WHILE * D5DB9
          :: ROMPTR 0B0 073 DROP ; REPEAT ;      * D5DDD

* ROMPTR 0B0 02A
* refs (1): D49CE
DoInputForm~2~3~3~1:
        :: BINT51 IFECallFieldMH ?SEMI           * D5E01
          BINT1 BEGIN DUP ROMPTR 0B0 023 NOT WHILE * D5E15
          :: ROMPTR 0B0 072 DROP ; REPEAT ;      * D5E39

* ROMPTR 0B0 02B
* refs (1): D49CE
ROMP_0B0_02B:
        :: BINT40 IFECallFieldMH ?SEMI           * D5E5D
          4GETLAM DUP ROMPTR 0B0 08B NOTcasedrop * D5E71
          :: NULL{} BINT0 ;                      * D5E8B
          DUP ROMPTR 0B0 07B ROMPTR 0B0 06D ;    * D5E9F

* ROMPTR 0B0 02C
* refs (1): D49CE
DoKeyEdit~1:
        :: BINT23 IFECallFieldMH ?SEMI           * D5EBF
          4GETLAM DUP ROMPTR 0B0 046 ITE         * D5ED3
          :: SWAPDROP AdjEdModes EDITDECOMP$ BINT1 ; * D5EED
          :: ROMPTR 0B0 089 ITE                  * D5F0B
            :: SetAlgEntry $ "''" BINT2 ;        * D5F20
            :: ClrAlgEntry NULL$ BINT1 ;         * D5F42
          ;                                      * D5F5B
          InitEdLine SWAP EditString SetCursPos(s) EDITPARTS BINT1 #> ITE * D5F60
          SetDA1NoCh                             * D5F88
          :: SetDA1NoCh SetDA2aNoCh ;            * D5F8D
        ;                                        * D5FA1

* ROMPTR 0B0 02D
* refs (1): D49CE
ROMP_0B0_02D:
        :: BINT42 IFECallFieldMH ?SEMI           * D5FA6
          4GETLAM ROMPTR 0B0 02E NOTcase         * D5FBA
          :: ' ROMPTR 0B0 007 ;                  * D5FCF
          ' NoExitAction SWAP ROMPTR 0B0 008 &COMP BINT2 ::N ; * D5FE9

* ROMPTR 0B0 02E
* refs (1): D49CE
ROMP_0B0_02E:
        :: BINT43 IFECallFieldMH ?SEMI           * D6017
          FALSE ;                                * D602B

* ROMPTR 0B0 02F
* refs (1): D49CE
ROMP_0B0_02F:
        :: BINT26 IFECallFieldMH ?SEMI           * D6035
          4GETLAM ROMPTR 0B0 030 NOT?SEMI        * D6049
          4GETLAM DUPUNROT ROMPTR 0B0 0D5 DUP ROMPTR 0B0 041 * D605E  ~sFldVal
          ROMPTR 0B0 013 ;                       * D6083  IFEDispField

* ROMPTR 0B0 030
* refs (1): D49CE
ROMP_0B0_030:
        :: BINT37 IFECallFieldMH ?SEMI           * D6093
          4GETLAM DUP ROMPTR 0B0 08C case        * D60A7
          :: FALSE SWAP ROMPTR 0B0 077 ROMPTR 0B4 1D8 SetDA123NoCh ; * D60C1
          ROMPTR 0B0 02B OVER NULL{} EQUAL case2drop * D60F0
          :: DoBadKey FALSE ;                    * D610F
          DUP#0= IT DROPONE                      * D6123
          4GETLAM ROMPTR 0B0 0B9 NULL$ 4GETLAM ROMPTR 0B0 07C 5ROLL 5ROLL * D6132
          ROMPTR 0B3 000 SetDA123NoCh NOTcase FALSE * D6161  ~Choose
          TRUE ;                                 * D617B

* ROMPTR 0B0 031
* refs (1): D49CE
ROMP_0B0_031:
        :: BINT27 IFECallFieldMH ?SEMI           * D6185
          4GETLAM DUP ROMPTR 0B0 0C5 NOT OVER    * D6199  ~gFldVal
          ROMPTR 0B0 0D5 ROMPTR 0B0 041 ;        * D61B8  ~sFldVal

* ROMPTR 0B0 032
* refs (1): D49CE
ROMP_0B0_032:
        :: BINT35 IFECallFieldMH ?SEMI           * D61D3
          ' ROMPTR 0B0 033 ?ROMPTR@ 4GETLAM ROMPTR 0B0 0B9 >TCOMP BINT17 * D61E7
          4GETLAM ROMPTR 0B0 035 DUPLENCOMP #1= ITE # B907 # B906 * D6216
          3UNROLL BINT1 ROMPTR 0B3 000 DUP BINT0 EQ NOTcase * D6249  ~Choose
          :: IT DROP                             * D6272
            SetDA123NoCh ;                       * D6281
          DROP EDITPARTS BINT1 #> SWAP ROMPTR 0B0 09C InitEdLine EditString * D628B
          SetPrgmEntry IT SetAlgEntry            * D62B9
          SetCursPos(s) SetDA2bBad case          * D62C8
          :: SetDA1NoCh SetDA3NoCh ;             * D62D7
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ; * D62EB

* ROMPTR 0B0 033
* refs (1): D49CE
ROMP_0B0_033:
        ::                                       * D6309
          { BINT83                               * D630E
            :: ' ROMPTR 0B0 034 ; }              * D6318
          EQLookup case                          * D6337
          :: EVAL TRUE ;                         * D6341
        ;                                        * D6355

* ROMPTR 0B0 034
* refs (1): D49CE
ROMP_0B0_034:
        :: NoExitAction                          * D635A
          {                                      * D6364
            { $ "NEW"                            * D6369
              :: TakeOver ROMPTR 0B3 02E DROPZERO ; } * D637E  DoCKeyOK
            NullMenuKey NullMenuKey NullMenuKey NullMenuKey * D63A2
            { $ "OK"                             * D63B6
              :: TakeOver ROMPTR 0B3 02E ; }     * D63C9  DoCKeyOK
          }                                      * D63E8
        ;                                        * D63ED

* ROMPTR 0B0 035
* refs (1): D49CE
ROMP_0B0_035:
        :: BINT36 IFECallFieldMH ?SEMI           * D63F2
          4GETLAM ROMPTR 0B0 07A ?SKIP           * D6406
          { MINUSONE }                           * D641B
          DUPNULLCOMP? casedrop NULL{}           * D642A
          DUPLENCOMP 2NULLLAM{} BIND 1GETLAM #1+_ONE_DO 2GETLAM INDEX@ * D6439
          NTHCOMPDROP                            * D645C
          { MINUSONE                             * D6461
            { # B908                             * D646B
              :: BINT1 FALSE NULL$ ; }           * D647A
            BINT0                                * D6498
            { # B909                             * D649D
              :: BINT1 FALSE NULL$ ; }           * D64AC
            BINT1                                * D64CA
            { # B90A                             * D64CF
              :: BINT2 FALSE $ "()" ; }          * D64DE
            BINT2                                * D6505
            { # B90B                             * D650A
              :: BINT2 FALSE $ "\"\"" ; }        * D6519
            BINT3                                * D6540
            { # B90C                             * D6545
              :: BINT2 FALSE $ "[]" ; }          * D6554
            BINT4                                * D657B
            { # B90D                             * D6580
              :: BINT3 FALSE $ "[()]" ; }        * D658F
            BINT5                                * D65BA
            { # B90E                             * D65BF
              :: BINT2 FALSE $ "{}" ; }          * D65CE
            BINT6                                * D65F5
            { # B90F                             * D65FA
              :: BINT1 FALSE NULL$ ; }           * D6609
            BINT8                                * D6627
            { # B910                             * D662C
              :: BINT3 FALSE $ "« »" ; }         * D663B
            BINT9                                * D6664
            { # B911                             * D6669
              :: BINT2 TRUE $ "''" ; }           * D6678
            BINT10                               * D669F
            { # B912                             * D66A4
              :: BINT2 FALSE $ "#" ; }           * D66B3
            BINT13                               * D66D8
            { # B913                             * D66DD
              :: BINT1 FALSE $ "_" ; }           * D66EC
          }                                      * D6711
          EQLookup DROP LOOP 1GETABND {}N ;      * D6716

* ROMPTR 0B0 036
* refs (1): D49CE
DoKeyCancel~1:
        :: BINT28 OBJ_19FA7 ?SEMI                * D6734
          TRUE ;                                 * D6748

* ROMPTR 0B0 037
* refs (1): D49CE
DoKeyOK~1:
        :: BINT29 OBJ_19FA7 ?SEMI                * D6752
          TRUE ;                                 * D6766

* ROMPTR 0B0 038
* refs (1): D49CE
ROMP_0B0_038:
        :: BINT30 IFECallFieldMH ?SEMI           * D6770
          4GETLAM ROMPTR 0B0 046 DROP ROMPTR 0B0 010 5GETLAM ROMPTR 0B0 0C1 * D6784
          ' ROMPTR 0B1 014 FALSE ' LAM 'IF STOLAM ROMPTR 0B1 00F TRUE ' * D67B4
          LAM 'IF STOLAM NOTcase                 * D67F5
          :: DEPTH #0=case AtUserStack           * D680C
            5GETLAM ROMPTR 0B0 046 NOTcase AtUserStack * D6820
            OVER EQUAL IT DROP                   * D683A
            AtUserStack ;                        * D684E
          1LAMBIND AtUserStack 1GETABND 5GETLAM ROMPTR 0B0 096 NOTcase * D6858
          :: EVAL OBJ_1A03E ;                    * D687C
          5GETLAM ROMPTR 0B0 041 ;               * D6890

* ROMPTR 0B0 039
* refs (1): D49CE
DoKeyOK~2:
        :: 5GETLAM BINT44 IFECallFieldMH ?SEMI   * D68A5
          EDITPARTS #>1 NOT ROMPTR 0B0 03F Parse.1 NOTcase ROMPTR 0B0 03A * D68BE
          PTR NULL:: EQUALcasedrop ROMPTR 0B0 03B * D68ED
          ROMPTR 0B0 040 ROMPTR 0B0 03C 5GETLAM ROMPTR 0B0 096 NOTcase * D6902
          :: SWAPDROP EVAL ;                     * D692D
          5GETLAM ROMPTR 0B0 041 ROMPTR 0B0 0A7 NOTcase * D6941
          :: 5GETLAM ROMPTR 0B0 024 ROMPTR 0B0 06B SetDA1NoCh ; * D6961
          5GETLAM ROMPTR 0B0 013 ROMPTR 0B0 06C  * D698B  IFEDispField
          :: SetDA1NoCh SetDA2aNoCh ; ;          * D69A6

* ROMPTR 0B0 03A
* refs (1): D49CE
DoKeyOK~2~1:
        :: DispBadToken SetPrgmEntry DROP #SyntaxErr ClrDA2bEdit * D69BF
          :: SetDA1NoCh SetDA2aNoCh SetDA3NoCh ; ROMPTR 0B0 091 SetDA2bTemp * D69DD  DoAlert
          SetDA2bEdit ;                          * D6A06

* ROMPTR 0B0 03B
* refs (1): D49CE
DoKeyOK~2~2:
        :: 5GETLAM DUP ROMPTR 0B0 01F ROMPTR 0B0 0A7 SWAP NOTcasedrop * D6A10
          SetDA1NoCh                             * D6A3F
          ROMPTR 0B0 013                         * D6A44  IFEDispField
          :: SetDA1NoCh SetDA2aNoCh ; ;          * D6A4F

* ROMPTR 0B0 03C
* refs (1): D49CE
DoKeyOK~2~3:
        :: DUPTYPECOL? NOT?SEMI                  * D6A68
          DUP CARCOMP ' x' EQUAL case            * D6A77
          :: BINT2 NTHCOMPDROP ;                 * D6A95
          DO>STR ;                               * D6AA9

* ROMPTR 0B0 03D
* refs (1): D49CE
DoInputForm~2~1~7~1:
        :: 5GETLAM BINT38 IFECallFieldMH ?SEMI   * D6AB3
          SetDA123NoCh 4GETLAM DUP ROMPTR 0B0 02B OVER NULL{} EQUAL case * D6ACC
          3DROP                                  * D6AFA
          #1+ 2DUP SWAP LENCOMP #> IT DROPONE    * D6AFF
          NTHCOMPDROP OVER ROMPTR 0B0 0D5 DUP ROMPTR 0B0 041 * D6B22  ~sFldVal
          ROMPTR 0B0 013 ;                       * D6B47  IFEDispField

* ROMPTR 0B0 03E
* refs (1): D49CE
ROMP_0B0_03E:
        :: 5GETLAM BINT39 IFECallFieldMH ?SEMI   * D6B57
          4GETLAM DUP ROMPTR 0B0 02B OVER LENCOMP ' * D6B70
          :: SWAP OBJ_1A01B ; 4ROLL >HCOMP DUP 4UNROLL SWAP ROT #1+ 5PICK * D6B94
          ROMPTR 0B0 0C0 SWAP 7ROLL ROMPTR 0B0 09E NOTcase2drop DoBadKey * D6BD0
          SWAP EVAL OVER ROMPTR 0B0 0D5 DUP ROMPTR 0B0 041 * D6BFA  ~sFldVal
          ROMPTR 0B0 013 SetDA123NoCh ;          * D6C24  IFEDispField

* ROMPTR 0B0 03F
* refs (1): D49CE
DoKeyOK~2~4:
        :: 5GETLAM BINT24 IFECallFieldMH DROP ;  * D6C39

* ROMPTR 0B0 040
* refs (1): D49CE
DoKeyOK~2~5:
        :: 5GETLAM BINT25 IFECallFieldMH DROP ;  * D6C57

* ROMPTR 0B0 041
* refs (1): D49CE
ROMP_0B0_041:
        :: BINT47 IFECallFieldMH DROP ;          * D6C75

* ROMPTR 0B0 042
* refs (1): D49CE
ROMP_0B0_042:
        :: BINT45 IFECallFieldMH ?SEMI           * D6C8E
          4GETLAM ROMPTR 0B0 07A NOTcasedrop TRUE * D6CA2
          SWAP XEQTYPE COERCE SWAPDROP EQUALPOSCOMP #0<> ; * D6CBC

* ROMPTR 0B0 043
* refs (1): D49CE
ROMP_0B0_043:
        :: BINT46 IFECallFieldMH ?SEMI           * D6CDF
          DROP TRUE ;                            * D6CF3

* ROMPTR 0B0 044
* refs (1): D49CE
IFEDispField~1:
        :: BINT9 IFECallFieldMH ?SEMI            * D6D02
          4GETLAM DUP ROMPTR 0B0 08D case        * D6D16
          :: DUP ROMPTR 0B0 0A1 ROMPTR 0B0 0C5 ITE ROMPTR 0B0 07F * D6D30  ~gFldVal
            ROMPTR 0B0 082                       * D6D60
            TOTEMPOB ;                           * D6D6B
          DUP ROMPTR 0B0 045 SWAP ROMPTR 0B0 0C7 ROTDUP LEN$ BINT6 #* 4PICK * D6D75
          DUPUNROT #<ITE DROP                    * D6DAE
          :: BINT6 #/ SWAPDROP 1_#1-SUB$ CHR_... >T$ ; $>GROB 3UNROLL SWAP * D6DBD
          MAKEGROB DUPUNROT ONEONE GROB! ;       * D6DF4

* ROMPTR 0B0 045
* refs (1): D49CE
IFEDispField~1~1:
        :: KEYINBUFFER? case                     * D6E0D
          :: DUP ROMPTR 0B0 0A2 ROMPTR 0B0 079 ITE NULL$ _chr(31)_ * D6E1C
          ;                                      * D6E4B
          DUP ROMPTR 0B0 0A1 BINT10 IFECallFieldMH ?SEMI * D6E50
          4GETLAM DUP ROMPTR 0B0 0C5 SWAP ROMPTR 0B0 0C0 ROMPTR 0B0 074 ; * D6E6F  ~gFldVal

* ROMPTR 0B0 046
* refs (1): D49CE
ROMP_0B0_046:
        :: BINT41 IFECallFieldMH ?SEMI           * D6EA4
          4GETLAM ROMPTR 0B0 078 ;               * D6EB8

* ROMPTR 0B0 047
* refs (1): D49CE
DoInputForm~2~2:
        ::                                       * D6ECD
          { BINT26 ROMPTR 0B0 056 BINT7 DoBadKey } #=Lookup caseTRUE * D6ED2  DoKeyEdit
          EditExstCase                           * D6F00
          ROMPTR 0B0 04D                         * D6F05
          { BINT17 DoBadKey BINT25 ROMPTR 0B0 054 } #=Lookup caseTRUE BINT2 * D6F10
          OVER BINT7 #<case OBJ_19F93            * D6F43
          { BINT12 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case OBJ_19F93 * D6F57
          2DUP Key>U/SKeyOb OBJ_4080F SWAPDROP case2drop 'DoBadKeyT * D6F89
          5GETLAM DUP ROMPTR 0B0 088 casedrop OBJ_19F0F * D6FA7
          ROMPTR 0B0 08B NOTcase2drop 'DoBadKeyT * D6FC6
          ROMPTR 0B0 052 ;                       * D6FDB

* ROMPTR 0B0 048
* refs (1): D49CE
DoInputForm~2~3:
        ::                                       * D6FEB
          { BINT7 DoBadKey } #=Lookup caseTRUE EditExstCase * D6FF0
          ROMPTR 0B0 04E                         * D7013
          { BINT11 ROMPTR 0B0 060 BINT17 ROMPTR 0B0 061 BINT16 * D701E
            ROMPTR 0B0 062 BINT18 ROMPTR 0B0 063 BINT25 ROMPTR 0B0 055 * D7048
            BINT26 ROMPTR 0B0 057 }              * D7073
          #=Lookup caseTRUE BINT3                * D7088
          OVER BINT7 #<case OBJ_19F93            * D7097
          { BINT45 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case OBJ_19F93 * D70AB
          2DUP Key>U/SKeyOb OBJ_4080F SWAPDROP case2drop 'DoBadKeyT * D70DD
          5GETLAM DUP ROMPTR 0B0 088 casedrop OBJ_19F0F * D70FB
          ROMPTR 0B0 08B NOTcase2drop 'DoBadKeyT * D711A
          ROMPTR 0B0 052 ;                       * D712F

* ROMPTR 0B0 049
* refs (1): D49CE
DoInputForm~2~4:
        ::                                       * D713F
          { BINT25 ROMPTR 0B0 05A BINT45         * D7144  DoKeyOK
            ROMPTR 0B0 059 }                     * D715E  DoKeyCancel
          #=Lookup caseTRUE EditExstCase         * D716E
          ROMPTR 0B0 04F BINT4                   * D717D
          { BINT30 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case OBJ_19F93 * D718D
          2DUP Key>U/SKeyOb OBJ_4080F SWAPDROP case2drop 'DoBadKeyT * D71BF
          5GETLAM DUP ROMPTR 0B0 088 casedrop OBJ_19F0F * D71DD
          ROMPTR 0B0 08B NOTcase2drop 'DoBadKeyT * D71FC
          ROMPTR 0B0 052 ;                       * D7211

* ROMPTR 0B0 04A
* refs (1): D49CE
DoInputForm~2~5:
        :: EditExstCase ROMPTR 0B0 050 BINT5     * D7221
          { BINT30 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case OBJ_19F93 * D723B
          2DUP Key>U/SKeyOb OBJ_4080F SWAPDROP case2drop 'DoBadKeyT * D726D
          5GETLAM DUP ROMPTR 0B0 088 casedrop OBJ_19F0F * D728B
          ROMPTR 0B0 08B NOTcase2drop 'DoBadKeyT * D72AA
          ROMPTR 0B0 052 ;                       * D72BF

* ROMPTR 0B0 04B
* refs (1): D49CE
DoInputForm~2~6:
        :: EditExstCase ROMPTR 0B0 051 BINT6     * D72CF
          { BINT45 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case OBJ_19F93 * D72E9
          2DUP Key>U/SKeyOb OBJ_4080F SWAPDROP case2drop 'DoBadKeyT * D731B
          5GETLAM DUP ROMPTR 0B0 088 casedrop OBJ_19F0F * D7339
          ROMPTR 0B0 08B NOTcase2drop 'DoBadKeyT * D7358
          ROMPTR 0B0 052 ;                       * D736D

* ROMPTR 0B0 04C
* refs (1): D49CE
ROMP_0B0_04C:
        :: TakeOver 6GETLAM DoKeyOb NoEditLine? ?SEMI * D737D
          6GETLAM DUP MINUSONE #= caseDROP $ "'#[«\"{:" * D739B
          EDITLINE$ CAR$ BINT1 POS$ #0<> caseDROP Lock? * D73CC
          InitEd&Modes SetPrgmEntry ROMP_0A1_00C IT LockAlpha * D73EF
          DoKeyOb ;                              * D7408

* ROMPTR 0B0 04D
* refs (1): D49CE
DoInputForm~2~2~1:
        :: BINT2 COLA OBJ_19F0F                  * D7412
        ;                                        * D7426

* ROMPTR 0B0 04E
* refs (1): D49CE
DoInputForm~2~3~1:
        :: BINT3 COLA OBJ_19F0F                  * D742B
        ;                                        * D743F

* ROMPTR 0B0 04F
* refs (1): D49CE
DoInputForm~2~4~1:
        :: BINT4 COLA OBJ_19F0F                  * D7444
        ;                                        * D7458

* ROMPTR 0B0 050
* refs (1): D49CE
DoInputForm~2~5~1:
        :: BINT5 COLA OBJ_19F0F                  * D745D
        ;                                        * D7471

* ROMPTR 0B0 051
* refs (1): D49CE
DoInputForm~2~6~1:
        :: BINT6 COLA OBJ_19F0F                  * D7476
        ;                                        * D748A

* ROMPTR 0B0 052
* refs (1): D49CE
ROMP_0B0_052:
        :: Key>U/SKeyOb DUPTYPECHAR? case ROMPTR 0B0 053 * D748F
          DUPTYPECSTR? case                      * D74AE
          :: ROMPTR 0B3 013 ROMPTR 0B0 053 ;     * D74B8
          DROP 'DoBadKeyT ;                      * D74D8

* ROMPTR 0B0 053
* refs (1): D49CE
ROMP_0B0_053:
        :: ' TakeOver SWAP BINT2 ::N ' ROMPTR 0B0 03E >TCOMP TRUE ; * D74E7

* ROMPTR 0B0 054
* refs (1): D49CE
DoInputForm~2~2~2:
        :: ComLine?:(bip;q) 5GETLAM ROMPTR 0B0 088 NOTcase DoBadKey * D7524
          NULL{} InitMenu DEPTH 1LAMBIND OBJ_6B48E DEPTH 1GETABND * D7548
          ROMPTR 0B0 0A7 #> NOT?SEMI             * D756B
          5GETLAM ROMPTR 0B0 096 NOTcase EVAL    * D7580
          5GETLAM ROMPTR 0B0 041 ;               * D759A

* ROMPTR 0B0 055
* refs (1): D49CE
DoInputForm~2~3~2:
        :: ComLine?:(bip;q) 5GETLAM ROMPTR 0B0 088 NOTcase DoBadKey * D75AF
          DEPTH 1LAMBIND DoNewMatrix DEPTH 1GETABND #> NOT?SEMI * D75D3
          5GETLAM ROMPTR 0B0 096 NOTcase EVAL    * D75F6
          5GETLAM ROMPTR 0B0 041 ;               * D7610

* ROMPTR 0B0 056
* refs (1): D49CE
DoKeyEdit:
        :: TakeOver EditExstCase                 * D7625
          :: ROMPTR 0B0 0A8                      * D7634
            :: SetDA1NoCh SetDA2aNoCh SetDA2bNoCh ; ; * D7644
          5GETLAM DUP ROMPTR 0B0 088 NOTcasedrop DoBadKey * D7662
          ROMPTR 0B0 02C MINUSONE 6PUTLAM ;      * D7681

* ROMPTR 0B0 057
* refs (1): D49CE
ROMP_0B0_057:
        :: ComLine?:(bip;q) 5GETLAM DUP ROMPTR 0B0 08A NOTcasedrop DoBadKey * D769B
          ROMPTR 0B0 02F ;                       * D76C4

* ROMPTR 0B0 058
* refs (1): D49CE
ROMP_0B0_058:
        :: ComLine?:(bip;q) 5GETLAM DUP ROMPTR 0B0 08D NOTcasedrop DoBadKey * D76D4
          DUP ROMPTR 0B0 031 DUP ROMPTR 0B0 0C5 ITE ROMPTR 0B0 081 * D76FD  ~gFldVal
          ROMPTR 0B0 083                         * D772D
          HARDBUFF ROT ROMPTR 0B0 0C6 GROB! SetDA123NoCh ; * D7738

* ROMPTR 0B0 059
* refs (1): D49CE
DoKeyCancel:
        :: TakeOver EditExstCase                 * D775C
          :: EDITPARTS BINT1 #> ITE SetDA1NoCh   * D776B
            :: SetDA1NoCh SetDA2aNoCh ;          * D7789
            ROMPTR 0B0 0A7 ROMP_0A1_02C ;        * D779D
          DAsBad? case SetDA123NoCh              * D77B2
          ROMPTR 0B0 036 NOTcase SetDA123NoCh    * D77C1
          FALSE TRUE 11PUTLAM ;                  * D77D6

* ROMPTR 0B0 05A
* refs (1): D49CE
DoKeyOK:
        :: TakeOver EditExstCase ROMPTR 0B0 039 ROMPTR 0B0 037 NOTcase * D77EA
          SetDA123NoCh                           * D7814
          ROMPTR 0B0 0C8 TRUE TRUE 11PUTLAM BINT56 OBJ_19FA7 DROP ; * D7819  GetFieldVals

* ROMPTR 0B0 05B
* refs (1): D49CE
ROMP_0B0_05B:
        :: ComLine?:(bip;q) 5GETLAM ROMPTR 0B0 01A ; * D7847

* ROMPTR 0B0 05C
* refs (1): D49CE
ROMP_0B0_05C:
        :: ComLine?:(bip;q) 5GETLAM DUP ROMPTR 0B0 088 NOTcasedrop DoBadKey * D7866
          ROMPTR 0B0 038 ;                       * D788F

* ROMPTR 0B0 05D
* refs (1): D49CE
ROMP_0B0_05D:
        :: ComLine?:(bip;q) 5GETLAM DUP ROMPTR 0B0 088 NOTcasedrop DoBadKey * D789F
          ROMPTR 0B0 032 ;                       * D78C8

* ROMPTR 0B0 05E
* refs (1): D49CE
DoInputForm~2~1~3:
        :: TakeOver NoEditLine? case ROMPTR 0B0 064 * D78D8
          EDITPARTS #1=case DoBadKey             * D78F7
          ROMP_0A1_00A ;                         * D7906

* ROMPTR 0B0 05F
* refs (1): D49CE
DoInputForm~2~1~4:
        :: TakeOver NoEditLine? case ROMPTR 0B0 065 * D7910
          EDITPARTS #1=case DoBadKey             * D792F
          ROMP_0A1_010 ;                         * D793E

* ROMPTR 0B0 060
* refs (1): D49CE
DoInputForm~2~3~3:
        :: TakeOver 5GETLAM ROMPTR 0B0 02A ROMPTR 0B0 095 ; * D7948

* ROMPTR 0B0 061
* refs (1): D49CE
DoInputForm~2~3~4:
        :: TakeOver 5GETLAM ROMPTR 0B0 029 ROMPTR 0B0 095 ; * D7972

* ROMPTR 0B0 062
* refs (1): D49CE
DoInputForm~2~3~5:
        :: TakeOver 5GETLAM DUP BEGIN ROMPTR 0B0 026 2DUP #> WHILE * D799C
          :: SWAPDROP DUP ; REPEAT DROP ROMPTR 0B0 095 ; * D79CF
