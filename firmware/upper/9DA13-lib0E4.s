* HP 48GX ROM revision R, #9DA13-#A07E8: Library part 0E4
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~MESRclEqn
* Follows on from the previous file (at #9DA13 in the original ROM).
        ENDLENGTH                                * 9DA13

        CON(5)  DOLIB                            * 9DA13  library object
        LENGTH                                   * 9DA18  length, to #A07E9
        CON(2)  0                                * 9DA1D  title length

LIB0E4:
        CON(3)  #0E4                             * 9DA1F  library number
        REL(5)  LIB0E4.hash                      * 9DA22  hash table
        REL(5)  ROMP_0E4_051                     * 9DA27  message table
        REL(5)  LIB0E4.link                      * 9DA2C  link table
        CON(5)  0                                * 9DA31  config
        RPL

* ROMPTR 0E4 000
* refs (1): 9DA1F
ROMP_0E4_000:
        :: ' LAM 'PC3 STO ;                      * 9DA36

* ROMPTR 0E4 001
* refs (1): 9DA1F
ROMP_0E4_001:
        :: ' LAM 'PC2 STO ;                      * 9DA59

* ROMPTR 0E4 002
* refs (1): 9DA1F
ROMP_0E4_002:
        :: ' LAM 'PC1 STO ;                      * 9DA7C

* ROMPTR 0E4 003
* refs (1): 9DA1F
ROMP_0E4_003:
        :: ' LAM MSTargetId STO ;                * 9DA9F

* ROMPTR 0E4 004
* refs (1): 9DA1F
ROMP_0E4_004:
        :: ' LAM MSFnl STO ;                     * 9DACE

* ROMPTR 0E4 005
* refs (1): 9DA1F
ROMP_0E4_005:
        :: ' LAM MSNumVar STO ;                  * 9DAF3

* ROMPTR 0E4 006
* refs (1): 9DA1F
ROMP_0E4_006:
        :: ' LAM MSnf STO ;                      * 9DB1E

* ROMPTR 0E4 007
* refs (1): 9DA1F
ROMP_0E4_007:
        :: ' LAM MStnf STO ;                     * 9DB41

* ROMPTR 0E4 008
* refs (1): 9DA1F
ROMP_0E4_008:
        :: ' LAM MSRnflg STO ;                   * 9DB66

* ROMPTR 0E4 009
* refs (1): 9DA1F
ROMP_0E4_009:
        :: ' LAM MSMflg STO ;                    * 9DB8F

* ROMPTR 0E4 00A
* refs (1): 9DA1F
ROMP_0E4_00A:
        :: ' LAM MSnftp STO ;                    * 9DBB6

* ROMPTR 0E4 00B
* refs (1): 9DA1F
ROMP_0E4_00B:
        :: DUPDUP LENCOMP NTHCOMPDROP LENCOMP BINT0 SWAP NDUPN {}N >TCOMP * 9DBDD
          SWAP >TCOMP NULL{} >TCOMP DUP ROMPTR 0E4 011 DUPLENCOMP #4- * 9DC0F
          ONESWAP SUBCOMP ' ID EQ XEQSTOID ' ROMPTR 0E4 00C ' InitMenu ; * 9DC3D

* ROMPTR 0E4 00C
* refs (1): 9DA1F
ROMP_0E4_00C:
        :: ' ID Mpar SAFE@ NOTcase ROMPTR 0E4 031 * 9DC7B
          OCRC SWAPDROP ' DROP ' ROMPTR 0E4 01A BINT3 ::N ReviewKey! ' * 9DCA9
          ROMPTR 0E4 00D LabelDef! ' ROMPTR 0E4 01B MenuKeyNS! ' * 9DCE1
          ROMPTR 0E4 023 MenuKeyLS! ' ROMPTR 0E4 021 MenuKeyRS! * 9DD0B
          ROMPTR 0E4 013 BINT6 #/ DROP BINT6 SWAP#- DUPONE #<> ITE * 9DD30
          :: ONE_DO NULL$ >TCOMP LOOP ; DROP     * 9DD63
          $ "ALL" >TCOMP BINT63 TestUserFlag ?SKIP * 9DD86
          :: INNERCOMP ' ROMPTR 0AB 072 '        * 9DDAA  MUSER
            ROMPTR 0AB 073 NULL$ DUP 2DUP 7ROLL #6+ {}N ; * 9DDC9  MCALC
          GDISPON? ?SEMI                         * 9DDF7
          ZEROZERO ROMPTR 0E4 015 Clr16 ROMPTR 0B0 0A5 XYGROBDISP SetDA1Temp ; * 9DE01

* ROMPTR 0E4 00D
* refs (1): 9DA1F
ROMP_0E4_00D:
        :: ERRSET                                * 9DE30
          :: ' ID Mpar SAFE@ NOT IT ERRJMP       * 9DE3A
            OCRC SWAPDROP                        * 9DE67
            CODE                                 * 9DE71  14 nibbles
              LC(5)   #807C5                     * 9DE7B
              GOVLNG  SysPtr@                    * 9DE82
            ENDCODE                              * 9DE89
            CARCOMP EQUAL NOT IT                 * 9DE89
            :: ROMPTR 0E4 012 DROP ' ROMPTR 0E4 00C InitMenu DROP BINT1 * 9DE9D  ~MESRclEqn
              GETDF ;                            * 9DED1
          ;                                      * 9DEDB
          ERRTRAP                                * 9DEE0
          :: %3 InitMenu% DROP BINT1 GETDF ; dIDNTNcase * 9DEE5
          :: DUP NULL$ EQUAL ITE MakeInvLabel    * 9DF0D
            :: DUP $ "VECTR" EQUAL ITE MakeDirLabel MakeStdLabel * 9DF2B
            ;                                    * 9DF5D
            Grob>Menu ;                          * 9DF62
          DUP ROMPTR 0E4 00F SWAP ID>$ OVER BINT2 #AND #0<> ITE * 9DF6C
          :: SWAP BINT1 #AND #0<> ITE MakeBoxLabel * 9DF9F
            :: BINT14 BINT10                     * 9DFC2
              CON(5)  DOGROB                     * 9DFD1  DOGROB
              LENGTH                             * 9DFD6  length, to #9E015
              NIBHEX  8000051000FFFFFF1000011000011000 * 9DFDB  ..P..ÿÿÿ........
              NIBHEX  E11000E11000E1100001FFFFFF * 9DFFB  ..........ÿÿÿ
        ENDLENGTH                                * 9E015
              MakeLabel ;                        * 9E015
          ;                                      * 9E01F
          :: SWAP BINT1 #AND #0<> ITE MakeStdLabel MakeInvLabel * 9E024
          ;                                      * 9E04C
          Grob>Menu ;                            * 9E051

* ROMPTR 0E4 00E
* refs (1): 9DA1F
ROMP_0E4_00E:
        :: ROMPTR 0E4 013 DROPSWAP EQUALPOSCOMP ; * 9E05B

* ROMPTR 0E4 00F
* refs (1): 9DA1F
ROMP_0E4_00F:
        :: ROMPTR 0E4 012 DUP DUPLENCOMP DUP 3UNROLL #3- NTHCOMPDROP 4ROLL * 9E07A  ~MESRclEqn
          EQUALPOSCOMP 3UNROLL #2- NTHCOMPDROP SWAP NTHCOMPDROP ; * 9E0AD

* ROMPTR 0E4 010
* refs (1): 9DA1F
ROMP_0E4_010:
        :: SWAP ROMPTR 0E4 00E ROMPTR 0E4 018 PUTLIST ROMPTR 0E4 012 * 9E0D0  ~MESRclEqn
          DUPLENCOMP #2- SWAP PUTLIST ROMPTR 0E4 011 ; * 9E100

* ROMPTR 0E4 011
* refs (1): 9DA1F
ROMP_0E4_011:
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
          ' ROMPTR 0E4 01A EQUAL NOTcase DROP    * 9E1F1
          OCRC SWAPDROP ' DROP ' ROMPTR 0E4 01A BINT3 ::N ReviewKey! ; * 9E210

* ROMPTR 0E4 012
* refs (1): 9DA1F
~MESRclEqn:
        :: ' ID Mpar SAFE@ NOTcase ROMPTR 0E4 031 * 9E248
          TOTEMPOB DUP ROMPTR 0E7 058 NOTcasedrop ROMPTR 0E4 031 * 9E276  ~UTTYPEEXT0?
          CODE                                   * 9E29B  64 nibbles
            C=DAT1  A                            * 9E2A5
            CD1EX                                * 9E2A8
            RSTK=C                               * 9E2AB
            D1=D1+  10                           * 9E2AD
            A=DAT1  A                            * 9E2B0
            LC(5)   #000E4                       * 9E2B3
            ?C#A    A                            * 9E2BA
            GOYES   L_9E2D9                      * 9E2BD
            D1=D1-  10                           * 9E2BF
            LC(5)   DOLIST                       * 9E2C2
            DAT1=C  A                            * 9E2C9
            D1=D1+  5                            * 9E2CC
            LC(5)   DOBINT                       * 9E2CF
            DAT1=C  A                            * 9E2D6
L_9E2D9:
            C=RSTK                               * 9E2D9
            D1=C                                 * 9E2DB
            GOVLNG  PushF/TLoop                  * 9E2DE
          ENDCODE                                * 9E2E5
          NOTcasedrop ROMPTR 0E4 031             * 9E2E5
          INCOMPDROP SWAPDROP ;                  * 9E2F5

* ROMPTR 0E4 013
* refs (1): 9DA1F
ROMP_0E4_013:
        :: ROMPTR 0E4 012 DUPLENCOMP #3- NTHCOMPDROP DUPLENCOMP ; * 9E304  ~MESRclEqn

* ROMPTR 0E4 014
* refs (1): 9DA1F
ROMP_0E4_014:
        :: ROMPTR 0E4 012 DUPLENCOMP #4- ONESWAP 3UNROLL 3PICK SUBCOMP SWAP ; * 9E32D  ~MESRclEqn

* ROMPTR 0E4 015
* refs (1): 9DA1F
ROMP_0E4_015:
        :: ROMPTR 0E4 012 DUPLENCOMP #1- NTHCOMPDROP ; * 9E365  ~MESRclEqn

* ROMPTR 0E4 016
* refs (1): 9DA1F
ROMP_0E4_016:
        :: ROMPTR 0E4 012 DUPLENCOMP NTHCOMPDROP ; * 9E389  ~MESRclEqn

* ROMPTR 0E4 017
* refs (1): 9DA1F
ROMP_0E4_017:
        :: ROMPTR 0E4 012 DUPLENCOMP SWAP PUTLIST ROMPTR 0E4 011 ; * 9E3A8  ~MESRclEqn

* ROMPTR 0E4 018
* refs (1): 9DA1F
ROMP_0E4_018:
        :: ROMPTR 0E4 012 DUPLENCOMP #2- NTHCOMPDROP ; * 9E3D7  ~MESRclEqn

* ROMPTR 0E4 019
* refs (1): 9DA1F
ROMP_0E4_019:
        :: ROMPTR 0E4 012 DUPLENCOMP #2- SWAP PUTLIST ROMPTR 0E4 011 ; * 9E3FB  ~MESRclEqn

* ROMPTR 0E4 01A
* refs (1): 9DA1F
ROMP_0E4_01A:
        :: BlankDA12 ROMPTR 0E4 015 DISPSTATUS2 BINT7 ONE_DO INDEX@ DUP * 9E42F
          GETPROC >Review$ INDEX@ #1+ DISPN LOOP SetDA12Temp SetDA3NoCh ; * 9E45D
        NIBHEX  BA0F60                           * 9E48A  «ð.

* ROMPTR 0E4 01B
* refs (1): 9DA1F
ROMP_0E4_01B:
        :: ERRSET ROMPTR 0E4 012 ERRTRAP         * 9E490  ~MESRclEqn
          :: DROP DoBadKey RDROP ; DROP DUPTYPECSTR? case * 9E4AA
          :: ImmedEntry? NOTcase StdMenuKeyNS    * 9E4D2
            DUP $ "ALL" EQUALcasedrp             * 9E4E6
            :: ROMPTR 0E4 01D ROMPTR 0E4 01E ;   * 9E500
            DROP DoBadKey ;                      * 9E520
          ImmedEntry? NOTcase StdMenuKeyNS       * 9E52F
          DUPTYPEROMP? case StdMenuKeyNS         * 9E53E
          ' ROMPTR 0E4 01C DoNameKeyLRS ;        * 9E54D

* ROMPTR 0E4 01C
* refs (1): 9DA1F
ROMP_0E4_01C:
        :: CK2NOLASTWD STRIPTAGSl2 ROMPTR 0E4 020 DUPSAFE@ IT KeepUnit * 9E567
          2DUP XEQStoKey DUPROT PromptIdUtil DISPSTATUS2 SetDA1Valid BINT1 * 9E590
          ROMPTR 0E4 010 ROMPTR 0E4 01E ;        * 9E5B3

* ROMPTR 0E4 01D
* refs (1): 9DA1F
ROMP_0E4_01D:
        :: BINT0 ROMPTR 0E4 018 INNERDUP ZERO_DO #1-SWAP BINT2 #AND psh1& * 9E5CE
          LOOP DROP {}N ROMPTR 0E4 019 ;         * 9E601

* ROMPTR 0E4 01E
* refs (1): 9DA1F
ROMP_0E4_01E:
        :: BINT0 ROMPTR 0E4 018 INNERDUP ZERO_DO #1-SWAP BINT1 #AND psh1& * 9E620
          LOOP DROP {}N ROMPTR 0E4 019 NULL{} ROMPTR 0E4 017 ; * 9E653

* ROMPTR 0E4 01F
* refs (1): 9DA1F
ROMP_0E4_01F:
        :: INNERDUP ZERO_DO #1-SWAP DUP ROMPTR 0E4 00F BINT1 EQUAL ITE * 9E682
          :: BINT3 ROMPTR 0E4 010 ; DROP         * 9E6B5
          LOOP DROP ;                            * 9E6D4

* ROMPTR 0E4 020
* refs (1): 9DA1F
ROMP_0E4_020:
        :: OVER ROMPTR 0E4 013 DROP matchob? casedrop * 9E6E3
          :: CK1NOLASTWD SETCIRCERR ERRJMP ;     * 9E707
          DROP ;                                 * 9E720
        NIBHEX  BA0F60                           * 9E72A  «ð.

* ROMPTR 0E4 021
* refs (1): 9DA1F
ROMP_0E4_021:
        :: ERRSET ROMPTR 0E4 012 ERRTRAP         * 9E730  ~MESRclEqn
          :: DROP DoBadKey RDROP ; DROP DUPTYPECSTR? case * 9E74A
          :: ImmedEntry? NOTcase StdMenuKeyNS    * 9E772
            DUP $ "ALL" EQUALcase ROMPTR 0E4 03B * 9E786
            DROP DoBadKey ;                      * 9E7AB
          BINT63 TestUserFlag NOTcase DoNameKeyRS * 9E7BA
          DUP ROMPTR 0E4 00F DUP BINT1 #AND #0<> ITE * 9E7CE
          :: BINT2 #AND ;                        * 9E7F7
          :: BINT1 #+ ;                          * 9E80B
          ROMPTR 0E4 010 ROMPTR 0E4 01E ;        * 9E81F

* ROMPTR 0E4 022
* refs (1): 9DA1F
ROMP_0E4_022:
        :: SWAP ROMPTR 0E4 039 DUP LENCOMP ROMPTR 0E4 013 SWAPDROP 2DUP#= * 9E83A
          casedrop                               * 9E86E
          :: 4DROP ROMPTR 0E4 033 ;              * 9E873
          BINT1 ZEROFALSE BINT1 BINT9 ROLL ROMPTR 0E4 025 ; * 9E88D
        NIBHEX  BA0470                           * 9E8B6  «@.

* ROMPTR 0E4 023
* refs (1): 9DA1F
ROMP_0E4_023:
        :: ERRSET ROMPTR 0E4 012 ERRTRAP         * 9E8BC  ~MESRclEqn
          :: DROP DoBadKey RDROP ; DROP DUPTYPECSTR? case * 9E8D6
          :: ImmedEntry? NOTcase StdMenuKeyNS    * 9E8FE
            DUP $ "ALL" EQUALcase                * 9E912
            :: TRUE ROMPTR 0E4 022 ;             * 9E92C
            DROP DoBadKey ;                      * 9E946
          DUPTYPEIDNT? ImmedEntry? ANDNOTcase StdMenuKeyNS * 9E955
          { LAM temp } BIND CK0NOLASTWD LAM temp ABND TRUE' ROMPTR 0E4 024 * 9E969
          COLA_EVAL ;                            * 9E9B0

* ROMPTR 0E4 024
* refs (1): 9DA1F
ROMP_0E4_024:
        :: SWAP ROMPTR 0E4 039 OVER ROMPTR 0E4 03A DUPLENCOMP ROMPTR 0E4 013 * 9E9BA
          SWAPDROP BINT1 ZEROFALSE BINT0 BINT9 ROLL ROMPTR 0E4 025 ; * 9E9EF

* ROMPTR 0E4 025
* refs (1): 9DA1F
ROMP_0E4_025:
        :: RDROP DUP IT                          * 9EA1D
          :: BlankDA12 # E408 JstGetTHEMESG DISPROW1 ; * 9EA31
          ERRSET                                 * 9EA54
          ::                                     * 9EA59
            {                                    * 9EA5E

* ROMPTR 0E4 026
* refs (1): 9DA1F
ROMP_0E4_026:
              LAM MSTargetId                     * 9EA63

* ROMPTR 0E4 027
* refs (1): 9DA1F
ROMP_0E4_027:
              LAM MSFnl                          * 9EA7E

* ROMPTR 0E4 028
* refs (1): 9DA1F
ROMP_0E4_028:
              LAM MSnf                           * 9EA8F

* ROMPTR 0E4 029
* refs (1): 9DA1F
ROMP_0E4_029:
              LAM MSNumVar                       * 9EA9E

* ROMPTR 0E4 02A
* refs (1): 9DA1F
ROMP_0E4_02A:
              LAM MSnftp                         * 9EAB5

* ROMPTR 0E4 02B
* refs (1): 9DA1F
ROMP_0E4_02B:
              LAM MStnf                          * 9EAC8

* ROMPTR 0E4 02C
* refs (1): 9DA1F
ROMP_0E4_02C:
              LAM MSRnflg                        * 9EAD9

* ROMPTR 0E4 02D
* refs (1): 9DA1F
ROMP_0E4_02D:
              LAM MSMflg                         * 9EAEE

* ROMPTR 0E4 02E
* refs (1): 9DA1F
ROMP_0E4_02E:
              LAM MSMsgFlg }                     * 9EB01
            BIND NULL{} ROMPTR 0E4 017 ROMPTR 0E4 02D BINT1 EQUAL ?SKIP * 9EB1D
            :: ROMPTR 0E4 014 SWAPDROP #1+_ONE_DO INDEX@ ROMPTR 0E4 037 * 9EB4C
              ROMPTR 0E4 027 ROMPTR 0E4 036 IT   * 9EB76
              :: DUP ROMPTR 0E4 026 EQUAL ITE    * 9EB91
                :: ROMPTR 0E4 02F BINT0 ISTOPSTO BINT0 ROMPTR 0E4 00A BINT1 * 9EBB0
                  ROMPTR 0E4 007 NOTcase         * 9EBDF
                  :: ROMPTR 0E4 02E IT SetDA1Temp * 9EBEF
                    $ "Int" ROMPTR 0E4 003 ;     * 9EC09
                  ROMPTR 0E4 02E ITE ID>TAG DROP * 9EC29
                ;                                * 9EC43
                DROP                             * 9EC48
              ;                                  * 9EC4D
              LOOP ;                             * 9EC52
            BEGIN ROMPTR 0E4 02A BINT0 #> WHILE  * 9EC5C
            :: BINT0 ROMPTR 0E4 00A ROMPTR 0E4 014 SWAPDROP #1+_ONE_DO * 9EC7B
              ROMPTR 0E4 02E IT                  * 9ECA5
              :: # E408 JstGetTHEMESG DISPROW1 ; * 9ECB5
              INDEX@ ROMPTR 0E4 037 ROMPTR 0E4 027 ROMPTR 0E4 036 IT * 9ECD3
              :: ROMPTR 0E4 02F NOTcase          * 9ECFE
                :: BINT0 ISTOPSTO BINT0 ROMPTR 0E4 00A BINT1 ROMPTR 0E4 007 * 9ED13
                  ROMPTR 0E4 02E IT SetDA1Temp   * 9ED42
                  $ "Int" ROMPTR 0E4 003 ;       * 9ED57
                DUP ROMPTR 0E4 026 EQUAL ROMPTR 0E4 02D BINT0 EQUAL ANDcase * 9ED77
                :: ROMPTR 0E4 02E ITE ID>TAG DROP * 9EDA6
                  BINT0 ISTOPSTO BINT0 ROMPTR 0E4 00A ROMPTR 0E4 02B #1+ * 9EDC5
                  ROMPTR 0E4 007 ;               * 9EDEF
                SWAPDROP ROMPTR 0E4 027 SWAP >TCOMP ROMPTR 0E4 004 * 9EDFF
                ROMPTR 0E4 028 #1+DUP ROMPTR 0E4 006 ROMPTR 0E4 02B #1+ * 9EE24
                ROMPTR 0E4 007 ROMPTR 0E4 02A #1+ ROMPTR 0E4 00A * 9EE4F
                ROMPTR 0E4 029 #=case            * 9EE75
                :: BINT0 ISTOPSTO ;              * 9EE85
              ;                                  * 9EE99
              LOOP ;                             * 9EE9E
            REPEAT ROMPTR 0E4 026 $ "Int" EQUAL case * 9EEA8
            :: ROMPTR 0E4 02E ABND NOT ?SEMI     * 9EED2
              FLUSHKEYS ATTNFLGCLR # A03 GETTHEMESG APPprompt1! SetDA1Temp ; * 9EEF1
            ROMPTR 0E4 02D BINT0 EQUAL case      * 9EF19
            :: ROMPTR 0E4 026 ROMPTR 0E4 00F BINT2 #<>case * 9EF33
              :: ROMPTR 0E4 02E ?SKIP ROMPTR 0E4 026 * 9EF58
                ABND CK0NOLASTWD ROMPTR 0E4 030 ; * 9EF78
              ABND ;                             * 9EF92
            ROMPTR 0E4 02B ABND #0=case ROMPTR 0E4 030 * 9EF9C
          ;                                      * 9EFBC
          ERRTRAP                                * 9EFC1
          :: ERROR@ #0= IT                       * 9EFC6
            :: ATTN# ERRORSTO ;                  * 9EFDA
            ERRJMP ;                             * 9EFEE
        ;                                        * 9EFF8

* ROMPTR 0E4 02F
* refs (1): 9DA1F
ROMP_0E4_02F:
        :: ROMPTR 0E4 02C ?SKIP ROMPTR 0E4 01E   * 9EFFD
          TRUE ROMPTR 0E4 008 DUP ID>$ # E407 JstGetTHEMESG SWAP&$ * 9F01D
          ROMPTR 0E4 02E ITE DISPROW1 DROP       * 9F04B
          ' ID Mpar SAFE@ DROP OCRC SWAPDROP     * 9F065
          { nohalt NULLLAM } BIND ROMPTR 0E4 012 INDEX@ NTHCOMPDROP * 9F08D  ~MESRclEqn
          DUPTYPESYMB? IT                        * 9F0BB
          :: nohalt BINT1 {}N uncrunch XEQSHOWLS DUPTYPESYMB? IT SYMCOLCT * 9F0C5
            ' ID Mpar SAFE@ NOTcase ROMPTR 0E4 031 * 9F0F2
            OCRC SWAPDROP 1GETLAM EQUAL NOTcase ROMPTR 0E4 031 * 9F11B
          ;                                      * 9F13F
          nohalt DUP SAFE@ ?SKIP %0_2A2B4        * 9F144
          SYMBNUMSOLVE                           * 9F15D
          { NULLLAM NULLLAM } BIND CK0NOLASTWD 2GETLAM 1GETLAM ABND ?SKIP * 9F162
          ERROROUT                               * 9F194
          ' ID Mpar SAFE@ NOTcase ROMPTR 0E4 031 * 9F199
          OCRC SWAPDROP 1GETLAM EQUAL NOTcase ROMPTR 0E4 031 * 9F1C2
          DUP ATTN# #=case ERROROUT              * 9F1E6
          GETTHEMESG SWAP nohalt ABND DUPDUP SAFE@ ITE PromptIdUtil * 9F1FA
          :: ID>$ $ ": Undefined" !append$ ;     * 9F222
          ROMPTR 0E4 02E ITE                     * 9F256
          :: DISPROW2 ROT DISPROW3 ;             * 9F266
          :: DROP ROTDROP ;                      * 9F27F
          DUPINDEX@ TWO{}N ROMPTR 0E4 016 SWAP >TCOMP ROMPTR 0E4 017 2DUP * 9F293
          XEQSTOID DUP BINT2 ROMPTR 0E4 010 INDEX@ ROMPTR 0E4 037 * 9F2C2
          ROMPTR 0E4 01F TRUE ;                  * 9F2EC

* ROMPTR 0E4 030
* refs (1): 9DA1F
ROMP_0E4_030:
        :: # E404 ERROROUT ;                     * 9F301

* ROMPTR 0E4 031
* refs (1): 9DA1F
ROMP_0E4_031:
        :: # E401 ERROROUT ;                     * 9F31A

* ROMPTR 0E4 032
* refs (1): 9DA1F
ROMP_0E4_032:
        :: # E406 ERROROUT ;                     * 9F333

* ROMPTR 0E4 033
* refs (1): 9DA1F
ROMP_0E4_033:
        :: # E405 ERROROUT ;                     * 9F34C

* ROMPTR 0E4 034
* refs (1): 9DA1F
MINIT~1~1:
        :: # E402 ERROROUT ;                     * 9F365

* ROMPTR 0E4 035
* refs (1): 9DA1F
MINIT~1~2:
        :: # E403 ERROROUT ;                     * 9F37E

* ROMPTR 0E4 036
* refs (1): 9DA1F
ROMP_0E4_036:
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
ROMP_0E4_037:
        :: ROMPTR 0E4 012 SWAP NTHCOMPDROP NULL{} * 9F47D  ~MESRclEqn
          { LAM vlist } BIND ROMPTR 0E4 038 LAM vlist ABND ; * 9F49C

* ROMPTR 0E4 038
* refs (1): 9DA1F
ROMP_0E4_038:
        :: INNERCOMP ZERO_DO                     * 9F4E2
          :: DUPTYPEIDNT? case                   * 9F4F1
            :: LAM vlist SWAP apndvarlst ' LAM vlist STO ; * 9F500
            ' xIFTE EQUAL NOT?SEMI               * 9F540
            ROMPTR 0E4 038 ROMPTR 0E4 038 ZEROZERO ; * 9F554
          LOOP ;                                 * 9F574

* ROMPTR 0E4 039
* refs (1): 9DA1F
ROMP_0E4_039:
        :: ROMPTR 0E4 013 DROP ZEROSWAP INNERCOMP DUP#0_DO #1-SWAP DUP * 9F57E
          ROMPTR 0E4 00F BINT1 #AND #0<> ITE psh1& DROP * 9F5AC
          LOOP DROP {}N ;                        * 9F5D5

* ROMPTR 0E4 03A
* refs (1): 9DA1F
ROMP_0E4_03A:
        :: OVERSWAP EQUALPOSCOMP DUP#0=case DROP * 9F5E9
          SWAPINCOMP get1 OVERSWAP #- #2+ROLL DROP #1-{}N ; * 9F602

* ROMPTR 0E4 03B
* refs (1): 9DA1F
ROMP_0E4_03B:
        :: RDROP DROP ROMPTR 0E4 016 LENCOMP #0= case DoBadKey * 9F62A
          POLSaveUI ERRSET                       * 9F658
          :: TRUE FALSE                          * 9F662
            {                                    * 9F671

* ROMPTR 0E4 03C
* refs (1): 9DA1F
ROMP_0E4_03C:
              LAM 'PC2                           * 9F676

* ROMPTR 0E4 03D
* refs (1): 9DA1F
ROMP_0E4_03D:
              LAM 'PC1 }                         * 9F685
            BIND ClrDAsOK ClrDA1IsStat ROMPTR 0E4 040 ROMPTR 0E4 015 * 9F699
            ROMPTR 0E4 041 ONEONE ROMPTR 0E4 016 RESOROMP ROMPTR 0E4 03E * 9F6BE
            NULL{} ROMPTR 0E0 010 ABND ;         * 9F6E9  ~BRbrowse
          ERRTRAP POLResUI&Err POLRestoreUI ClrDAsOK ; * 9F703

* ROMPTR 0E4 03E
* refs (1): 9DA1F
ROMP_0E4_03E:
        :: DUP#0=case                            * 9F71C
          :: DROP LENCOMP ;                      * 9F726
          NTHCOMPDROP INCOMPDROP ROMPTR 0E4 03C ITE * 9F73A
          :: DROP DUPSAFE@ NOTcase               * 9F754
            :: ID>$ $ ": Undefined" !append$ ;   * 9F768
            DUP DO>STR SWAP TYPEEXT? IT          * 9F79C
            :: CDR$ BINT1 OVER LEN$ #1- SUB$ ;   * 9F7B5
            SWAP ID>$ $ ": " !append$SWAP !append$ ; * 9F7DD
          :: SWAP ID>$ $ ": " &$SWAP ROMPTR 0E4 012 SWAP NTHCOMPDROP DO>STR * 9F804  ~MESRclEqn
            &$ ;                                 * 9F840
        ;                                        * 9F84A

* ROMPTR 0E4 03F
* refs (1): 9DA1F
ROMP_0E4_03F:
        :: CK0NOLASTWD ERRSET                    * 9F84F
          :: SetEcma94 ROMPTR 0E4 015 PRINT ROMPTR 0E4 016 DUP BINT0 * 9F85E
            ROMPTR 0E4 03E #1+ ONE_DO NULL$ PRINT DUP INDEX@ NTHCOMPDROP * 9F88D
            INCOMPDROP DROP DUPSAFE@ ITE         * 9F8BB
            :: DUP EDITDECOMP$ SWAP TYPEEXT? IT  * 9F8CF
              :: CDR$ BINT1 OVER LEN$ #1- SUB$ ; * 9F8ED
              SWAP ID>$ $ ": " !append$SWAP !append$ ; * 9F915
            :: ID>$ $ ": Undefined" !append$ ;   * 9F93C
            PRINT DUP INDEX@ NTHCOMPDROP INCOMPDROP SWAPDROP ROMPTR 0E4 012 * 9F970  ~MESRclEqn
            SWAP NTHCOMPDROP DECOMP$ PRINT LOOP NULL$ PRINT DROP ; * 9F999
          ERRTRAP DropSysObs ;                   * 9F9C6

* ROMPTR 0E4 040
* refs (1): 9DA1F
ROMP_0E4_040:
        {                                        * 9F9D5
          {                                      * 9F9DA
            :: TakeOver $ "VALUE" ROMPTR 0E4 03C Box/StdLabel ; * 9F9DF
            :: TakeOver ROMPTR 0E4 03C ?SKIP     * 9FA12
              :: TRUE ROMPTR 0E4 001 ROMPTR 0E0 049 * 9FA2C  BRinverse
                ROMPTR 0E0 045                   * 9FA4C  BRDispItems
                ROMPTR 0E0 049 DispMenu ;        * 9FA57  BRinverse
            ;                                    * 9FA6C
          }                                      * 9FA71
          {                                      * 9FA76
            :: TakeOver $ "EQNS" ROMPTR 0E4 03C NOT Box/StdLabel ; * 9FA7B
            :: TakeOver ROMPTR 0E4 03C IT        * 9FAB1
              :: FALSE ROMPTR 0E4 001 ROMPTR 0E0 049 * 9FACB  BRinverse
                ROMPTR 0E0 045                   * 9FAEB  BRDispItems
                ROMPTR 0E0 049 DispMenu ;        * 9FAF6  BRinverse
            ;                                    * 9FB0B
          }                                      * 9FB10
          { $ "PRINT"                            * 9FB15
            :: TakeOver ROMPTR 0E4 03F ; }       * 9FB2E
          NullMenuKey NullMenuKey                * 9FB4D
          { $ "EXIT"                             * 9FB57
            :: TakeOver ROMPTR 0E0 013 ; }       * 9FB6E  BRdone
        }                                        * 9FB8D

* ROMPTR 0E4 041
* refs (1): 9DA1F
ROMP_0E4_041:
        { ROMPTR 0E0 052                         * 9FB92  BRViewItem
          ROMPTR 0E0 013 }                       * 9FBA2  BRdone

* ROMPTR 0E4 042
* refs (1): 9DA1F
MINIT~1:
        :: NULL{} DORCLE DUP EqList? NOTcase2drop ROMPTR 0E4 034 * 9FBB2
          LENCOMP DUP #1= IT ROMPTR 0E4 034      * 9FBDB
          #1+_ONE_DO DORCLE INDEX@ NTHCOMPDROP   * 9FBFA
          :: DUPTYPESYMB? ?SEMI                  * 9FC0E
            DUPTYPECOL? ?SEMI                    * 9FC1D
            DUPTYPEIDNT? NOTcasedrop ROMPTR 0E4 035 * 9FC27
            SAFE@ NOTcasedrop ROMPTR 0E4 035     * 9FC3C
            DUPTYPESYMB? ?SEMI                   * 9FC51
            DUPTYPECOL? ?SEMI                    * 9FC5B
            DUPTYPELIST? NOTcasedrop ROMPTR 0E4 035 * 9FC65
            CARCOMP DUPTYPESYMB? ?SEMI           * 9FC7A
            DUPTYPECOL? ?SEMI                    * 9FC89
            DUPTYPEIDNT? NOTcasedrop ROMPTR 0E4 035 * 9FC93
            SAFE@ NOTcasedrop ROMPTR 0E4 035     * 9FCA8
            DUPTYPESYMB? ?SEMI                   * 9FCBD
            DUPTYPECOL? ?SEMI                    * 9FCC7
            DUPTYPELIST? NOTcasedrop ROMPTR 0E4 035 * 9FCD1
            CARCOMP DUPTYPESYMB? ?SEMI           * 9FCE6
            DUPTYPECOL? NOTcasedrop ROMPTR 0E4 035 * 9FCF5
          ;                                      * 9FD0A
          INTEMNOTREF? ?SKIP TOTEMPOB            * 9FD0F
          >TCOMP LOOP DUP INNERCOMP NULL{}       * 9FD1E
          { LAM vlist } BIND BINT0 DO ROMPTR 0E4 038 LOOP LAM vlist ABND DUP * 9FD37
          ' ID Mpar EQUALPOSCOMP #0<> case ROMPTR 0E4 035 * 9FD8C
          INNERCOMP reversym DUP BINT2 #< case ROMPTR 0E4 035 * 9FDBA
          {}N >TCOMP $ "EQ" SWAP DUPDUP LENCOMP NTHCOMPDROP LENCOMP BINT0 * 9FDE3
          SWAP NDUPN {}N >TCOMP SWAP >TCOMP NULL{} >TCOMP ROMPTR 0E4 011 * 9FE19
          CODE                                   * 9FE4C  14 nibbles
            LC(5)   #807C5                       * 9FE56
            GOVLNG  SysPtr@                      * 9FE5D
          ENDCODE                                * 9FE64
          DUPTYPECOL? NOTcase DROP               * 9FE64
          BINT3 NTHELCOMP NOT ?SEMI              * 9FE73
          ' ROMPTR 0E4 01A EQUAL NOT ?SEMI       * 9FE87
          ' ROMPTR 0E4 00C InitMenu ;            * 9FEA6

* ROMPTR 0E4 043
* refs (1): 9DA1F
MITM~1:
        :: ROMPTR 0E4 013 DROP OVER LENCOMP #1+_ONE_DO 2DUPSWAP INDEX@ * 9FEC0
          NTHCOMPDROP EQUALPOSCOMP #0= IT        * 9FEEE
          :: OVER INDEX@ NTHCOMPDROP NULL$ EQUAL ?SEMI * 9FF02
            ROMPTR 0E7 007 ;                     * 9FF25
          LOOP SWAP OVER LENCOMP #1+_ONE_DO 2DUPSWAP INDEX@ NTHCOMPDROP * 9FF35
          EQUALPOSCOMP #0= IT                    * 9FF5D
          :: OVER INDEX@ NTHCOMPDROP NULL$ EQUAL ?SEMI * 9FF6C
            ROMPTR 0E7 007 ;                     * 9FF8F
          LOOP SWAPDROP NULL{}                   * 9FF9F
          { LAM vlist } BIND DUP ROMPTR 0E4 038 LAM vlist ABND INNERCOMP DUP * 9FFAE
          #2+ PICK SWAP ZERO_DO SWAP ROMPTR 0E4 03A LOOP DUPLENCOMP #0= ITE * 9FFFE
          DROP                                   * A0036
          :: INNERCOMP ZERO_DO NULL$ EQUAL ?SKIP ROMPTR 0E7 007 * A003B
            LOOP ;                               * A0064
          SWAP DUPTYPECSTR? NOTcase ROMPTR 0E7 007 * A006E
          NULL{} 3PICK LENCOMP #1+_ONE_DO 3PICK INDEX@ NTHCOMPDROP DUP NULL$ * A0088
          EQUAL ITE DROPZERO ROMPTR 0E4 00F      * A00B5
          >TCOMP LOOP SWAP NULL{} BINT4 {}N ROMPTR 0E4 012 DUP LENCOMP * A00CF  ~MESRclEqn
          ONESWAP #4- SUBCOMP SWAP &COMP ROMPTR 0E4 011 * A0102
          CODE                                   * A0126  14 nibbles
            LC(5)   #807C5                       * A0130
            GOVLNG  SysPtr@                      * A0137
          ENDCODE                                * A013E
          DUPTYPECOL? NOTcase DROP               * A013E
          BINT3 NTHELCOMP NOT ?SEMI              * A014D
          ' ROMPTR 0E4 01A EQUAL NOT ?SEMI       * A0161
          ' ROMPTR 0E4 00C InitMenu ;            * A0180

* ROMPTR 0E4 044
* refs (1): 9DA1F
MUSER~1:
        :: ROMPTR 0E4 04F ROMPTR 0E4 01E BINT1 ROMPTR 0E4 049 ; * A019A

* ROMPTR 0E4 045
* refs (1): 9DA1F
MCALC~1:
        :: ROMPTR 0E4 04F ROMPTR 0E4 01E BINT0 ROMPTR 0E4 049 ; * A01CA

* ROMPTR 0E4 046
* refs (1): 9DA1F
MUSER~2:
        :: ROMPTR 0E4 04F DUPNULL{}? case ROMPTR 0E7 007 * A01FA
          BINT1 ROMPTR 0E4 048 ;                 * A021F

* ROMPTR 0E4 047
* refs (1): 9DA1F
MCALC~2:
        :: ROMPTR 0E4 04F DUPNULL{}? case ROMPTR 0E7 007 * A0234
          BINT0 ROMPTR 0E4 048 ;                 * A0259

* ROMPTR 0E4 048
* refs (1): 9DA1F
ROMP_0E4_048:
        :: ROMPTR 0E4 01E OVER DUPLENCOMP #1+_ONE_DO DUPINDEX@ NTHCOMPDROP * A026E
          dIDNTNcase ROMPTR 0E7 007              * A0297
          3PICK ROMPTR 0E4 049 LOOP 3DROP ;      * A02A7

* ROMPTR 0E4 049
* refs (1): 9DA1F
ROMP_0E4_049:
        :: OVER ROMPTR 0E4 00E #0=case ROMPTR 0E7 007 * A02C6
          ROMPTR 0E4 010 ;                       * A02EB

* ROMPTR 0E4 04A
* refs (1): 9DA1F
MUSER~3:
        :: ROMPTR 0E4 04F $ "ALL" EQUALNOTcase ROMPTR 0E7 007 * A02FB
          BINT1 ROMPTR 0E4 04C ;                 * A032B

* ROMPTR 0E4 04B
* refs (1): 9DA1F
MCALC~3:
        :: ROMPTR 0E4 04F $ "ALL" EQUALNOTcase ROMPTR 0E7 007 * A0340
          BINT0 ROMPTR 0E4 04C ;                 * A0370

* ROMPTR 0E4 04C
* refs (1): 9DA1F
ROMP_0E4_04C:
        :: ROMPTR 0E4 018 LENCOMP DUP#1- ZERO_DO OVERSWAP LOOP {}N * A0385
          ROMPTR 0E4 019 ;                       * A03B3

* ROMPTR 0E4 04D
* refs (1): 9DA1F
MROOT~1:
        :: ROMPTR 0E4 04F DUP ROMPTR 0E4 00E #0=case ROMPTR 0E7 007 * A03C3
          FALSE' ROMPTR 0E4 024 COLA_EVAL ;      * A03F3

* ROMPTR 0E4 04E
* refs (1): 9DA1F
MROOT~2:
        :: ROMPTR 0E4 04F DUP $ "ALL" EQUALNOTcase ROMPTR 0E7 007 * A040D
          FALSE' ROMPTR 0E4 022 COLA_EVAL ;      * A0442

* ROMPTR 0E4 04F
* refs (1): 9DA1F
ROMP_0E4_04F:
        :: ERRSET                                * A045C
          :: ROMPTR 0E4 02E DROP TRUE ; ERRTRAP FALSE IT ROMPTR 0E4 032 * A0466
        ;                                        * A049F

* ROMPTR 0E4 051
* refs (2): 9DA1F 9DA1F
ROMP_0E4_051:
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
        REL(5)  L_A063C                          * A0637  end of the names
L_A063C:
        CON(5)  0                                * A063C  command 000 has no name
        ENDLENGTH                                * A0641

LIB0E4.link:
        CON(5)  DOHSTR                           * A0641  link table of library 0E4
        LENGTH                                   * A0646  length, to #A07E5
        REL(5)  ROMP_0E4_000                     * A064B  000 
        REL(5)  ROMP_0E4_001                     * A0650  001 
        REL(5)  ROMP_0E4_002                     * A0655  002 
        REL(5)  ROMP_0E4_003                     * A065A  003 
        REL(5)  ROMP_0E4_004                     * A065F  004 
        REL(5)  ROMP_0E4_005                     * A0664  005 
        REL(5)  ROMP_0E4_006                     * A0669  006 
        REL(5)  ROMP_0E4_007                     * A066E  007 
        REL(5)  ROMP_0E4_008                     * A0673  008 
        REL(5)  ROMP_0E4_009                     * A0678  009 
        REL(5)  ROMP_0E4_00A                     * A067D  00A 
        REL(5)  ROMP_0E4_00B                     * A0682  00B 
        REL(5)  ROMP_0E4_00C                     * A0687  00C 
        REL(5)  ROMP_0E4_00D                     * A068C  00D 
        REL(5)  ROMP_0E4_00E                     * A0691  00E 
        REL(5)  ROMP_0E4_00F                     * A0696  00F 
        REL(5)  ROMP_0E4_010                     * A069B  010 
        REL(5)  ROMP_0E4_011                     * A06A0  011 
        REL(5)  ~MESRclEqn                       * A06A5  012 ~MESRclEqn
        REL(5)  ROMP_0E4_013                     * A06AA  013 
        REL(5)  ROMP_0E4_014                     * A06AF  014 
        REL(5)  ROMP_0E4_015                     * A06B4  015 
        REL(5)  ROMP_0E4_016                     * A06B9  016 
        REL(5)  ROMP_0E4_017                     * A06BE  017 
        REL(5)  ROMP_0E4_018                     * A06C3  018 
        REL(5)  ROMP_0E4_019                     * A06C8  019 
        REL(5)  ROMP_0E4_01A                     * A06CD  01A 
        REL(5)  ROMP_0E4_01B                     * A06D2  01B 
        REL(5)  ROMP_0E4_01C                     * A06D7  01C 
        REL(5)  ROMP_0E4_01D                     * A06DC  01D 
        REL(5)  ROMP_0E4_01E                     * A06E1  01E 
        REL(5)  ROMP_0E4_01F                     * A06E6  01F 
        REL(5)  ROMP_0E4_020                     * A06EB  020 
        REL(5)  ROMP_0E4_021                     * A06F0  021 
        REL(5)  ROMP_0E4_022                     * A06F5  022 
        REL(5)  ROMP_0E4_023                     * A06FA  023 
        REL(5)  ROMP_0E4_024                     * A06FF  024 
        REL(5)  ROMP_0E4_025                     * A0704  025 
        REL(5)  ROMP_0E4_026                     * A0709  026 
        REL(5)  ROMP_0E4_027                     * A070E  027 
        REL(5)  ROMP_0E4_028                     * A0713  028 
        REL(5)  ROMP_0E4_029                     * A0718  029 
        REL(5)  ROMP_0E4_02A                     * A071D  02A 
        REL(5)  ROMP_0E4_02B                     * A0722  02B 
        REL(5)  ROMP_0E4_02C                     * A0727  02C 
        REL(5)  ROMP_0E4_02D                     * A072C  02D 
        REL(5)  ROMP_0E4_02E                     * A0731  02E 
        REL(5)  ROMP_0E4_02F                     * A0736  02F 
        REL(5)  ROMP_0E4_030                     * A073B  030 
        REL(5)  ROMP_0E4_031                     * A0740  031 
        REL(5)  ROMP_0E4_032                     * A0745  032 
        REL(5)  ROMP_0E4_033                     * A074A  033 
        REL(5)  MINIT~1~1                        * A074F  034 
        REL(5)  MINIT~1~2                        * A0754  035 
        REL(5)  ROMP_0E4_036                     * A0759  036 
        REL(5)  ROMP_0E4_037                     * A075E  037 
        REL(5)  ROMP_0E4_038                     * A0763  038 
        REL(5)  ROMP_0E4_039                     * A0768  039 
        REL(5)  ROMP_0E4_03A                     * A076D  03A 
        REL(5)  ROMP_0E4_03B                     * A0772  03B 
        REL(5)  ROMP_0E4_03C                     * A0777  03C 
        REL(5)  ROMP_0E4_03D                     * A077C  03D 
        REL(5)  ROMP_0E4_03E                     * A0781  03E 
        REL(5)  ROMP_0E4_03F                     * A0786  03F 
        REL(5)  ROMP_0E4_040                     * A078B  040 
        REL(5)  ROMP_0E4_041                     * A0790  041 
        REL(5)  MINIT~1                          * A0795  042 
        REL(5)  MITM~1                           * A079A  043 
        REL(5)  MUSER~1                          * A079F  044 
        REL(5)  MCALC~1                          * A07A4  045 
        REL(5)  MUSER~2                          * A07A9  046 
        REL(5)  MCALC~2                          * A07AE  047 
        REL(5)  ROMP_0E4_048                     * A07B3  048 
        REL(5)  ROMP_0E4_049                     * A07B8  049 
        REL(5)  MUSER~3                          * A07BD  04A 
        REL(5)  MCALC~3                          * A07C2  04B 
        REL(5)  ROMP_0E4_04C                     * A07C7  04C 
        REL(5)  MROOT~1                          * A07CC  04D 
        REL(5)  MROOT~2                          * A07D1  04E 
        REL(5)  ROMP_0E4_04F                     * A07D6  04F 
        REL(5)  ROMP_0E4_051                     * A07DB  050 
        REL(5)  ROMP_0E4_051                     * A07E0  051 
        ENDLENGTH                                * A07E5
        NIBHEX  0000                             * A07E5  ..
