* HP 48GX ROM revision R, #8D27C-#8FFFF: Library part 0EA
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #8D27C in the original ROM).
        ENDLENGTH                                * 8D27C

        CON(5)  DOLIB                            * 8D27C  library object
        LENGTH                                   * 8D281  length, to #8FFB5
        CON(2)  0                                * 8D286  title length

LIB0EA:
        CON(3)  #0EA                             * 8D288  library number
        REL(5)  LIB0EA.hash                      * 8D28B  hash table
        CON(5)  0                                * 8D290  message table
        REL(5)  LIB0EA.link                      * 8D295  link table
        CON(5)  0                                * 8D29A  config
        RPL

* ROMPTR 0EA 000
* refs (1): 8D288
ROMP_0EA_000:
        :: TakeOver DAsBad? ?SEMI                * 8D29F
          EDITPARTS #>1 ?SKIP                    * 8D2B3

* ROMPTR 0EA 001
* refs (1): 8D288
ROMP_0EA_001:
          :: SetDA1NoCh SetDA2aNoCh ;            * 8D2C2
          InitEd&Modes OBJ_40CC3 ;               * 8D2D6

* ROMPTR 0EA 002
* refs (1): 8D288
ROMP_0EA_002:
        :: TakeOver DAsBad? ?SEMI                * 8D2E5
          17GETLAM #0=?SKIP                      * 8D2F9
          :: GetMat/Vec CK1NOLASTWD DROP ; 16GETLAM #0=?SKIP FALSE TRUE * 8D303
          3PUTLAM InitEd&Modes ;                 * 8D330

* ROMPTR 0EA 003
* refs (1): 8D288
ROMP_0EA_003:
        :: BindMatVars AtUserStack ' ROMPTR 0EA 008 ' OBJ_44948 TrueFalse ' * 8D33F
          ROMPTR 0EA 048 ONEFALSE ' 3GETLAM 'ERRJMP POLSetUI CLCD10 ClrDAsOK * 8D372
          ERRSET POLKeyUI ERRTRAP                * 8D3A0

* ROMPTR 0EA 004
* refs (1): 8D288
ROMP_0EA_004:
          :: DropSysObs OBJ_18295 17GETLAM #0=?SKIP GetMat/Vec AtUserStack * 8D3AF
            TRUE 3PUTLAM ERRJMP ;                * 8D3D2
          ABND ;                                 * 8D3E6

* ROMPTR 0EA 005
* refs (1): 8D288
ROMP_0EA_005:
        :: OBJ_68972 OBJ_6BBFE DROP ;            * 8D3F0

* ROMPTR 0EA 006
* refs (1): 8D288
DoNewMatrix~1:
        :: POLSaveUI ERRSET                      * 8D409
          :: ROMPTR 0EA 052 ROMPTR 0EA 003 ; ERRTRAP POLResUI&Err * 8D418
          POLRestoreUI ClrDAsOK ;                * 8D442

* ROMPTR 0EA 007
* refs (1): 8D288
ROMP_0EA_007:
        :: EditExstCase                          * 8D451
          :: BINT25 ?CaseKeyDef ROMPTR 0EA 028 BINT45 ?CaseKeyDef * 8D45B
            ROMPTR 0EA 000 DROPFALSE ;           * 8D47F
          BINT25 ?CaseKeyDef ROMPTR 0EA 033 BINT45 ?CaseKeyDef * 8D494
          ROMPTR 0EA 002 DROPFALSE ;             * 8D4B3

* ROMPTR 0EA 008
* refs (1): 8D288
ROMP_0EA_008:
        :: SetPrgmEntry                          * 8D4C8

* ROMPTR 0EA 009
* refs (1): 8D288
ROMP_0EA_009:
          :: ROMPTR 0EA 015 5GETLAM 7GETLAM #- #= ?SEMI * 8D4D2
            9GETLAM DUP 13PUTLAM ROMPTR 0EA 018 #+ 11PUTLAM ROMPTR 0EA 045 ; * 8D4FB
          TOADISP RCLSYSF 15GETLAM EQUALNOT DA1OK? NOT DA2aOK? DA2aLess1OK? * 8D52F
          ClrNewEditL ORNOT OR OR IT             * 8D557
          :: EDITPARTS #>1 ITE                   * 8D570
            :: DispStatus BlankDA2a ;            * 8D584
            :: ROMPTR 0EA 00E ROMPTR 0EA 023     * 8D598

* ROMPTR 0EA 00A
* refs (1): 8D288
ROMP_0EA_00A:
              :: 13GETLAM ROMPTR 0EA 018 OVER#+ ROMPTR 0EA 014 ; * 8D5B3
              ROMPTR 0EA 011 ROMPTR 0EA 044 ;    * 8D5DD
            SetDA1Valid SetDA2aValid ;           * 8D5F8
          RCLSYSF 15GETLAM EQUAL DA2bOK? AND ?SKIP * 8D607
          :: EditLExists? case DispEditLine      * 8D625

* ROMPTR 0EA 00B
* refs (1): 8D288
ROMP_0EA_00B:
            :: TOADISP 8GETLAM ROMPTR 0EA 020 CHR "-" >T$ 9GETLAM * 8D639
              ROMPTR 0EA 021 &$ PTR CHR_: >T$ APPEND_SPACE 22Lget 8GETLAM * 8D664
              9GETLAM ROMPTR 0EA 01E DUPTYPECSTR? ?SKIP * 8D68D
              :: ~setStdWid;COLA;stkdecomp$w OVERLEN$ BINT22 SWAP#- 2DUPSWAP * 8D6A7
                LEN$ #<ITE                       * 8D6C5
                :: 1_#1-SUB$ CHR_... >T$ ; DROP ; * 8D6CF
              &$ BigDisp1(st) ;                  * 8D6F2
            SetDA2bValid ;                       * 8D701
          DA3OK? ?SKIP ?DispMenu                 * 8D70B
          RCLSYSF 15PUTLAM ClrDAsOK ;            * 8D71A

* ROMPTR 0EA 00C
* refs (1): 8D288
ROMP_0EA_00C:
        CODE                                     * 8D72E  77 nibbles
          LC(5)   #80702                         * 8D738
          CD0EX                                  * 8D73F
          RSTK=C                                 * 8D742
          C=DAT0  A                              * 8D744
          D0=C                                   * 8D747
          D0=D0+  15                             * 8D74A
          LC(5)   BINT0                          * 8D74D
          DAT0=C  A                              * 8D754
          LC(2)   #14                            * 8D757
L_8D75B:
          D0=D0+  10                             * 8D75B
          A=DAT1  A                              * 8D75E
          D1=D1+  5                              * 8D761
          DAT0=A  A                              * 8D764
          C=C-1   B                              * 8D767
          GONC    L_8D75B                        * 8D76A
          C=RSTK                                 * 8D76D
          D0=C                                   * 8D76F
          LC(5)   #00016                         * 8D772
          D=D+C   A                              * 8D779
          A=DAT0  A                              * 8D77B
          D0=D0+  5                              * 8D77E
          PC=(A)                                 * 8D781
        ENDCODE                                  * 8D785

* ROMPTR 0EA 00D
* refs (1): 8D288
BindMatVars~1:
        :: BINT21 ' NULLLAM CACHE BINT0 1PUTLAM ; * 8D785

* ROMPTR 0EA 00E
* refs (1): 8D288
ROMP_0EA_00E:
        :: TOADISP 20GETLAM ROMPTR 0EA 020 ROMPTR 0EA 022 CHR "·" >T$ * 8D7AD
          21GETLAM ROMPTR 0EA 021 ROMPTR 0EA 022 &$ $>grob BINT0 BINT0 2DUP * 8D7DE
          HARDBUFF 3UNROLL BINT22 BINT6 GROB!ZERO 3UNROLL GROB! ; * 8D812

* ROMPTR 0EA 00F
* refs (1): 8D288
DoOldMatrix~1:
        :: POLSaveUI ERRSET                      * 8D83A
          :: InitOldMat ROMPTR 0EA 003 ; ERRTRAP POLResUI&Err POLRestoreUI * 8D849
          ClrDAsOK ;                             * 8D872

* ROMPTR 0EA 010
* refs (1): 8D288
InitOldMat~1:
        :: ROMPTR 0EA 053 DUP DIMLIMITS INNER#1= ITE * 8D87C
          :: BINT1 2DUPSWAP 5ROLL 3UNROLL TWO{}N MATREDIM 3UNROLL BINT1 ; * 8D8A0
          :: SWAP BINT0 ;                        * 8D8D2
          BINT1 2OVER #* BINT1 ROMPTR 0EA 054 ;  * 8D8E6

* ROMPTR 0EA 012
* refs (2): 8D288 8D288
ROMP_0EA_012:
        :: TOADISP HARDBUFF 7GETLAM 6GETLAM 5GETLAM 4GETLAM SUBGROB INVGROB * 8D90A
          HARDBUFF 7GETLAM 6GETLAM GROB! ;       * 8D937

* ROMPTR 0EA 013
* refs (1): 8D288
ROMP_0EA_013:
        :: TOADISP ROMPTR 0EA 015 3UNROLL #1+SWAP DO DUPINDEX@ 13GETLAM #- * 8D950
          #* #12+ 2DUP#+ INDEX@ ROMPTR 0EA 021 ROMPTR 0EA 022 $>grob INVGROB * 8D983
          ROMPTR 0EA 016 #1- BINT0 6ROLL INDEX@ 13GETLAM #= IT * 8D9B7
          :: BINT10 #+ ;                         * 8D9E5
          6ROLL OVER#- BINT6 SWAP MAKEGROB INVGROB HARDBUFF ROT BINT0 GROB! * 8D9F9
          GROB! LOOP DROP ;                      * 8DA2B

* ROMPTR 0EA 014
* refs (1): 8D288
ROMP_0EA_014:
        :: 2DUP ROMPTR 0EA 013 ROMPTR 0EA 017 ;  * 8DA3F

* ROMPTR 0EA 015
* refs (1): 8D288
ROMP_0EA_015:
        :: OBJ_44B9B #6* ;                       * 8DA64

* ROMPTR 0EA 016
* refs (1): 8D288
ROMP_0EA_016:
        :: HARDBUFF OVER GROBDIMw 4PICK SWAP#- ; * 8DA78

* ROMPTR 0EA 017
* refs (1): 8D288
ROMP_0EA_017:
        :: TOADISP ROMPTR 0EA 015 3UNROLL #1+SWAP DO DUPINDEX@ 13GETLAM #- * 8DA9B
          #* #12+ 2DUP#+ 10GETLAM #1+ 12GETLAM DO INDEX@ JINDEX@ * 8DACE
          ROMPTR 0EA 025 $>GROB ROMPTR 0EA 016 INDEX@ 12GETLAM #- #8* #6+ * 8DAFB
          7PICK BINT8 SWAP MAKEGROB 7PICK HARDBUFF SWAP4PICK GROB! GROB! * 8DB2F
          LOOP 2DROP LOOP DROP ;                 * 8DB5C

* ROMPTR 0EA 018
* refs (1): 8D288
ROMP_0EA_018:
        :: BINT20 OBJ_44B9B #/ SWAPDROP#1- ;     * 8DB75

* ROMPTR 0EA 019
* refs (1): 8D288
ROMP_0EA_019:
        :: TakeOver 20GETLAM #0= caseDoBadKey BINT1 * 8DB93
          8PUTLAM 12GETLAM #1= NOTcase ROMPTR 0EA 040 * 8DBB1
          ROMPTR 0EA 012 ROMPTR 0EA 046 ROMPTR 0EA 047 ; * 8DBD0

* ROMPTR 0EA 01A
* refs (1): 8D288
ROMP_0EA_01A:
        :: TakeOver 20GETLAM DUP#0= caseDrpBadKy 8PUTLAM * 8DBF6
          20GETLAM 10GETLAM #>case ROMPTR 0EA 040 * 8DC14
          ROMPTR 0EA 012 ROMPTR 0EA 046 ROMPTR 0EA 047 ; * 8DC2E

* ROMPTR 0EA 01B
* refs (1): 8D288
ROMP_0EA_01B:
        :: TakeOver 21GETLAM #0= caseDoBadKey BINT1 * 8DC54
          9PUTLAM 13GETLAM #1= NOTcase ROMPTR 0EA 040 * 8DC72
          ROMPTR 0EA 012 ROMPTR 0EA 045 ROMPTR 0EA 047 ; * 8DC91

* ROMPTR 0EA 01C
* refs (1): 8D288
ROMP_0EA_01C:
        :: TakeOver 21GETLAM DUP#0= caseDrpBadKy 9PUTLAM * 8DCB7
          21GETLAM 11GETLAM #>case ROMPTR 0EA 040 * 8DCD5
          ROMPTR 0EA 012 ROMPTR 0EA 045 ROMPTR 0EA 047 ; * 8DCEF

* ROMPTR 0EA 01D
* refs (1): 8D288
ROMP_0EA_01D:
        :: TakeOver SetDA3NoCh REPEATER BINT18 ROMPTR 0EA 06D ; * 8DD15

* ROMPTR 0EA 01E
* refs (1): 8D288
ROMP_0EA_01E:
        :: 2DUP 21GETLAM #> SWAP 20GETLAM #> ORcase * 8DD3E

* ROMPTR 0EA 01F
* refs (1): 8D288
ROMP_0EA_01F:
          :: 3DROP NULL$ ;                       * 8DD66
          18GETLAM #0=case GetElt                * 8DD7A
          2DUP ROMPTR 0EA 03B 17GETLAM #>ITE ROMPTR 0EA 01F GetElt ; * 8DD89

* ROMPTR 0EA 021
* refs (2): 8D288 8D288
ROMP_0EA_021:
        :: NULL$SWAP BEGIN BINT10 #/ SWAP BINT48 #+ #>CHR ROTSWAP >H$ * 8DDB8
          SWAPDUP #0= UNTIL DROP ;               * 8DDEF

* ROMPTR 0EA 022
* refs (1): 8D288
ROMP_0EA_022:
        :: DUPLEN$ DUP BINT4 #<case DROP         * 8DE08
          DUPTWO #-SWAP SUB$ ;                   * 8DE26

* ROMPTR 0EA 023
* refs (1): 8D288
ROMP_0EA_023:
        :: 12GETLAM 10GETLAM ROMPTR 0EA 024 ;    * 8DE3A

* ROMPTR 0EA 024
* refs (1): 8D288
ROMP_0EA_024:
        :: TOADISP #1+SWAP DO INDEX@ ROMPTR 0EA 020 ROMPTR 0EA 022 $>grob * 8DE59
          INVGROB HARDBUFF OVER GROBDIMw BINT12 SWAP#- INDEX@ 12GETLAM #- * 8DE8D
          #8* BINT8 #+ BINT8 BINT12 MAKEGROB INVGROB HARDBUFF BINT0 4PICK * 8DEBA
          BINT2 #- GROB! GROB! LOOP ;            * 8DEEC

* ROMPTR 0EA 025
* refs (1): 8D288
ROMP_0EA_025:
        :: 22Lget 3UNROLL ROMPTR 0EA 01E DUPTYPECSTR? ?SEMI * 8DF0A
          DECOMP$ CHR_Space >H$ OBJ_44B9B 2DUPSWAP LEN$ #<case * 8DF2E
          :: 1_#1-SUB$ CHR_... >T$ ;             * 8DF51
          DROP ;                                 * 8DF6A

* ROMPTR 0EA 026
* refs (1): 8D288
ROMP_0EA_026:
        :: TakeOver SetDA3NoCh REPEATER BINT17 ROMPTR 0EA 069 ; * 8DF74

* ROMPTR 0EA 027
* refs (1): 8D288
Blank$~1:
        :: NULL$SWAP DUP#0=csDROP ZERO_DO CHR_Space >H$ LOOP ; * 8DF9D

* ROMPTR 0EA 028
* refs (1): 8D288
ROMP_0EA_028:
        :: TakeOver DEPTH 1PUTLAM EDITPARTS #>1 ITE ROMPTR 0EA 03A * 8DFC5

* ROMPTR 0EA 029
* refs (1): 8D288
ROMP_0EA_029:
          :: BINT0 14PUTLAM ;                    * 8DFF3
          ROMPTR 0EA 02B 2PUTLAM                 * 8E007

* ROMPTR 0EA 02A
* refs (1): 8D288
ROMP_0EA_02A:
          :: OBJ_40ABB NOT?SEMI                  * 8E017
            InitEd&Modes EVAL AtUserStack ;      * 8E026

* ROMPTR 0EA 02B
* refs (1): 8D288
ROMP_0EA_02B:
          :: HARDBUFF OCRC SWAPDROP ; 2GETLAM EQUAL ?SKIP ROMPTR 0EA 03A * 8E03A
          DEPTH 1GETLAM 2DUP#> NOTcase2DROP #-   * 8E06D
          22Lget TYPELIST? IT                    * 8E086
          :: DUP#1+PICK                          * 8E095
            { BINT1 BINT1 } SWAP TYPECMP? ITE C%0 %0_2A2B4 * 8E09F
            MAKEARRY 22PUTLAM ;                  * 8E0CC
          22Lget TYPERARRY? ITE ROMPTR 0EA 02E ROMPTR 0EA 035 * 8E0DB
          ROMPTR 0EA 030                         * 8E100

* ROMPTR 0EA 02C
* refs (1): 8D288
ROMP_0EA_02C:
          :: 14GETLAM ROMPTR 0EA 029 BINT0 EQcasedrop NOP * 8E10B
            BINT1 EQcasedrop                     * 8E12F

* ROMPTR 0EA 02D
* refs (1): 8D288
ROMP_0EA_02D:
            :: TOADISP 8GETLAM 9GETLAM ROMPTR 0EA 03E $>GROB HARDBUFF * 8E139
              7GETLAM 6GETLAM GROB! ;            * 8E162
            BINT2 EQ case                        * 8E176
            :: ROMPTR 0EA 041 ROMPTR 0EA 023 ROMPTR 0EA 00A ; * 8E185
          ;                                      * 8E1B0
          ROMPTR 0EA 00E ROMPTR 0EA 00B ROMPTR 0EA 011 SetDA12NoCh ; * 8E1B5

* ROMPTR 0EA 02E
* refs (1): 8D288
ROMP_0EA_02E:
        :: DUP#0_DO INDEX@ #2+PICK TYPEREAL? ?SKIP * 8E1E0

* ROMPTR 0EA 02F
* refs (1): 8D288
ROMP_0EA_02F:
          :: DROP # 502 JstGetTHEMESG DO$EXIT ;  * 8E1FE
          LOOP ;                                 * 8E221

* ROMPTR 0EA 030
* refs (1): 8D288
ROMP_0EA_030:
        :: ROMPTR 0EA 012 ZERO_DO 8GETLAM 20GETLAM #> IT * 8E22B
          :: 22Lget 8GETLAM 21GETLAM DUP#0=IT DROPONE TWO{}N MATREDIM * 8E254
            22PUTLAM 8GETLAM 20PUTLAM ENTRWISE@ #0=?SEMI 21GETLAM #1= ?SEMI * 8E27C
            ROMPTR 0EA 031 ROMPTR 0EA 03A ;      * 8E2A4
          9GETLAM 21GETLAM #> IT                 * 8E2BF
          :: 22Lget MATTRN 9GETLAM 20GETLAM DUP#0=IT DROPONE TWO{}N MATREDIM * 8E2D3
            MATTRN 22PUTLAM 9GETLAM 21PUTLAM ENTRWISE@ #1= ?SEMI * 8E300
            20GETLAM #1= ?SEMI                   * 8E323

* ROMPTR 0EA 031
* refs (1): 8D288
ROMP_0EA_031:
            :: 20GETLAM 21GETLAM #* 17PUTLAM ; ROMPTR 0EA 03A ; * 8E332
          ISTOP-INDEX ROLL 8GETLAM 9GETLAM RowElt# 22Lget ERRSET BANGARRY * 8E360
          ERRTRAP                                * 8E388
          :: DropSysObs ISTOP-INDEX UNROLL ERRJMP ; 22PUTLAM AtUserStack * 8E38D

* ROMPTR 0EA 032
* refs (1): 8D288
ROMP_0EA_032:
          :: 14GETLAM #0= NOT?SEMI               * 8E3B5
            BINT1 14PUTLAM ;                     * 8E3C9
          8GETLAM 9GETLAM ROMPTR 0EA 03B 17GETLAM 2DUP #>ITE * 8E3D8
          :: #1+ OVER#= ?SKIP ROMPTR 0EA 03A     * 8E3FC
            17PUTLAM ;                           * 8E41B
          2DROP ROMPTR 0EA 02C ROMPTR 0EA 03F LOOP ; * 8E425

* ROMPTR 0EA 033
* refs (1): 8D288
ROMP_0EA_033:
        :: TakeOver 17GETLAM #0=case DoBadKey    * 8E44A
          GetMat/Vec 16GETLAM #0=?SKIP TRUE TRUE 3PUTLAM InitEd&Modes ; * 8E463

* ROMPTR 0EA 034
* refs (1): 8D288
GetMat/Vec~1:
        :: 20GETLAM #1= 19GETLAM #1= ANDITE      * 8E48B
          :: ERRSET                              * 8E4A9
            :: 22Lget DUP DIMLIMITS OBJ_6F261 ONE{}N MATREDIM ; ERRTRAP * 8E4B3
            :: DropSysObs 22Lget ; ;             * 8E4E0
          22Lget ;                               * 8E4F9

* ROMPTR 0EA 035
* refs (1): 8D288
ROMP_0EA_035:
        :: DUP#0_DO INDEX@ #2+PICK DUPTYPEREAL? ITE * 8E503
          :: Re>C% INDEX@ #3+ ROLLDROP INDEX@ #2+UNROLL ; * 8E521
          :: TYPECMP? ?SKIP ROMPTR 0EA 02F       * 8E549
          ;                                      * 8E563
          LOOP ;                                 * 8E568

* ROMPTR 0EA 036
* refs (1): 8D288
ROMP_0EA_036:
        :: 9GETLAM 21GETLAM #<>case ROMPTR 0EA 06F * 8E572
          18GETLAM #0=case ROMPTR 0EA 06F        * 8E591
          BINT1 9PUTLAM 8GETLAM #1+ 8PUTLAM ROMPTR 0EA 03A ; * 8E5A6

* ROMPTR 0EA 037
* refs (1): 8D288
ROMP_0EA_037:
        :: TakeOver SetDA3NoCh REPEATER BINT16 ROMPTR 0EA 06C ; * 8E5CF

* ROMPTR 0EA 038
* refs (1): 8D288
RowElt#~1:
        :: SWAP#1- 21GETLAM #* #+ ;              * 8E5F8

* ROMPTR 0EA 039
* refs (1): 8D288
ROMP_0EA_039:
        :: 8GETLAM 20GETLAM #<>case ROMPTR 0EA 06B * 8E616
          18GETLAM #0=case ROMPTR 0EA 06B        * 8E635
          BINT1 8PUTLAM 9GETLAM #1+ 9PUTLAM      * 8E64A

* ROMPTR 0EA 03A
* refs (1): 8D288
ROMP_0EA_03A:
          :: BINT2 14PUTLAM ; ;                  * 8E663

* ROMPTR 0EA 03B
* refs (1): 8D288
ROMP_0EA_03B:
        :: ENTRWISE@ #2= case2drop               * 8E67C
          :: 21GETLAM 20GETLAM #* ;              * 8E690
          ENTRWISE@ #0=ITE                       * 8E6A9
          :: SWAP 21GETLAM ; 20GETLAM SWAP#1- #* #+ ; * 8E6B3

* ROMPTR 0EA 03C
* refs (1): 8D288
~'R;STO:
        :: 'R STO ;                              * 8E6E0

* ROMPTR 0EA 03D
* refs (1): 8D288
~RowElt#;PULLEL;SWAPDROP:
        :: RowElt# PULLEL SWAPDROP ;             * 8E6F4

* ROMPTR 0EA 03E
* refs (1): 8D288
ROMP_0EA_03E:
        :: 22Lget 3UNROLL GetElt DECOMP$ CHR_Space >H$ OBJ_44B9B OVERLEN$ * 8E70D
          2DUP #<case                            * 8E73A
          :: DROP 1_#1-SUB$ CHR_... >T$ ;        * 8E744
          #- Blank$ SWAP&$ ;                     * 8E762

* ROMPTR 0EA 03F
* refs (1): 8D288
ROMP_0EA_03F:
        :: ENTRWISE@ #0=case ROMPTR 0EA 036      * 8E776
          ENTRWISE@ #1=case ROMPTR 0EA 039       * 8E790
        ;                                        * 8E7A5

* ROMPTR 0EA 040
* refs (1): 8D288
ROMP_0EA_040:
        :: ROMPTR 0EA 012                        * 8E7AA

* ROMPTR 0EA 041
* refs (1): 8D288
ROMP_0EA_041:
          ::                                     * 8E7BA

* ROMPTR 0EA 042
* refs (1): 8D288
ROMP_0EA_042:
            :: 9GETLAM DUP 13GETLAM #<case       * 8E7BF
              :: DUP 13PUTLAM ROMPTR 0EA 018 #+ 11PUTLAM ; * 8E7D8
              DUP 11GETLAM #>case                * 8E801
              :: DUP 11PUTLAM ROMPTR 0EA 018 #- 13PUTLAM ; * 8E810
              DROP ;                             * 8E839

* ROMPTR 0EA 043
* refs (1): 8D288
ROMP_0EA_043:
            :: 8GETLAM DUP 12GETLAM #<case       * 8E843
              :: DUP 12PUTLAM #4+ 10PUTLAM ;     * 8E85C
              DUP 10GETLAM #>case                * 8E87A
              :: DUP 10PUTLAM #4- 12PUTLAM ;     * 8E889
              DROP ;                             * 8E8A7
            ROMPTR 0EA 045 ROMPTR 0EA 046 ;      * 8E8B1
          SetDA3NoCh ;                           * 8E8CC

* ROMPTR 0EA 044
* refs (1): 8D288
ROMP_0EA_044:
        :: HARDBUFF 11GETLAM 13GETLAM #1-- ROMPTR 0EA 015 #* #12+ BINT0 * 8E8D6
          BINT131 BINT46 GROB!ZERODRP ;          * 8E909

* ROMPTR 0EA 045
* refs (1): 8D288
ROMP_0EA_045:
        :: 9GETLAM 13GETLAM #- ROMPTR 0EA 015 #* #12+ DUP 7PUTLAM * 8E91D
          ROMPTR 0EA 015 #+ 5PUTLAM ;            * 8E950

* ROMPTR 0EA 046
* refs (1): 8D288
ROMP_0EA_046:
        :: 8GETLAM 12GETLAM #- #8* BINT6 #+DUP 6PUTLAM #8+ 4PUTLAM ; * 8E96A

* ROMPTR 0EA 047
* refs (1): 8D288
ROMP_0EA_047:
        :: ROMPTR 0EA 00B ROMPTR 0EA 011 SetDA123NoCh ; * 8E9A1

* ROMPTR 0EA 048
* refs (1): 8D288
ROMP_0EA_048:
        :: NoExitAction                          * 8E9C6
          {                                      * 8E9D0
            { $ "EDIT" ROMPTR 0EA 05A }          * 8E9D5
            { ROMPTR 0EA 04C ROMPTR 0EA 050 }    * 8E9FC
            { $ "←WID" ROMPTR 0EA 05C }          * 8EA1C
            { $ "WID→" ROMPTR 0EA 062 }          * 8EA43
            { ROMPTR 0EA 04A ROMPTR 0EA 04D }    * 8EA6A
            { ROMPTR 0EA 04B ROMPTR 0EA 04E }    * 8EA8A
            { $ "+ROW" ROMPTR 0EA 060 }          * 8EAAA
            { $ "-ROW" ROMPTR 0EA 056 }          * 8EAD1
            { $ "+COL" ROMPTR 0EA 061 }          * 8EAF8
            { $ "-COL" ROMPTR 0EA 05F }          * 8EB1F
            { $ "→STK" ROMPTR 0EA 049 }          * 8EB46
            { $ "↑STK" OBJ_4365D } }             * 8EB6D
        ;                                        * 8EB93

* ROMPTR 0EA 049
* refs (1): 8D288
ROMP_0EA_049:
        :: ComLine?:(bip;q) 22Lget 8GETLAM 9GETLAM ROMPTR 0EA 01E * 8EB98
          SetDA123NoCh DUPTYPECSTR? caseDrpBadKy AtUserStack * 8EBBC
        ;                                        * 8EBD0

* ROMPTR 0EA 04A
* refs (1): 8D288
ROMP_0EA_04A:
        :: TakeOver $ "GO→" ENTRWISE@ #0= Box/StdLabel ; * 8EBD5

* ROMPTR 0EA 04B
* refs (1): 8D288
ROMP_0EA_04B:
        :: TakeOver $ "GO↓" ENTRWISE@ #1= Box/StdLabel ; * 8EC03

* ROMPTR 0EA 04C
* refs (1): 8D288
ROMP_0EA_04C:
        :: TakeOver $ "VEC" 19GETLAM #1= Box/StdLabel ; * 8EC31

* ROMPTR 0EA 04D
* refs (1): 8D288
ROMP_0EA_04D:
        :: TakeOver ENTRWISE@ #0=ITE BINT2 BINT0 OBJ_44BCB ROMPTR 0EA 04F ; * 8EC5F

* ROMPTR 0EA 04E
* refs (1): 8D288
ROMP_0EA_04E:
        :: TakeOver ENTRWISE@ #1= ITE BINT2 BINT1 * 8EC92
          OBJ_44BCB ROMPTR 0EA 04F ;             * 8ECB5

* ROMPTR 0EA 04F
* refs (1): 8D288
ROMP_0EA_04F:
        :: 20GETLAM 21GETLAM #* DUP#0= ?SKIP     * 8ECCA
          :: BINT1 18PUTLAM ;                    * 8ECE8
          17GETLAM OVER#< case                   * 8ECFC
          :: 17PUTLAM ROMPTR 0EA 040 ;           * 8ED0B
          DROP SetDA12NoCh ;                     * 8ED25

* ROMPTR 0EA 050
* refs (1): 8D288
ROMP_0EA_050:
        :: TakeOver 19GETLAM #0=ITE BINT1 BINT0 19PUTLAM SetDA12NoCh ; * 8ED34

* ROMPTR 0EA 051
* refs (1): 8D288
ROMP_0EA_051:
        :: 16GETLAM 19GETLAM                     * 8ED61

* ROMPTR 0EA 052
* refs (1): 8D288
DoNewMatrix~2:
          ::                                     * 8ED70

* ROMPTR 0EA 053
* refs (1): 8D288
InitOldMat~2:
            :: OBJ_44B9B #0= NOT?SEMI            * 8ED75
              BINT5 OBJ_44BAB ;                  * 8ED89
            NULL{} OBJ_6D909 Push3Zeros          * 8ED98

* ROMPTR 0EA 054
* refs (1): 8D288
InitOldMat~3:
            :: RCLSYSF BINT0 ONEONE ROMPTR 0EA 018 3PICK#+ BINT5 ONEONE * 8EDA7
              BINT12 BINT6 ROMPTR 0EA 015 #12+ BINT14 FALSE BINT0 ; * 8EDD5
          ;                                      * 8EE03
          ROMPTR 0EA 00C 19PUTLAM 16PUTLAM ;     * 8EE08

* ROMPTR 0EA 055
* refs (1): 8D288
ROMP_0EA_055:
        :: TakeOver SetDA3NoCh REPEATER BINT11 ROMPTR 0EA 067 ; * 8EE22

* ROMPTR 0EA 056
* refs (1): 8D288
ROMP_0EA_056:
        :: ComLine?:(bip;q) 8GETLAM 20GETLAM #>case DoBadKey * 8EE4B
          # 503 JstGetTHEMESG BigDisp1(st) 20GETLAM #1=case ROMPTR 0EA 051 * 8EE69
          22Lget 8GETLAM 20GETLAM #=?SKIP        * 8EE92

* ROMPTR 0EA 057
* refs (1): 8D288
CopyRowsUp~1:
          :: 20GETLAM #1+ 8GETLAM #1+ DO INDEX@ SWAP 21GETLAM #1+_ONE_DO * 8EEA6
            2DUPSWAP INDEX@ GetElt 3PICK #1- INDEX@ RowElt# ROT BANGARRY * 8EED8
            ?ATTNQUIT LOOP SWAPDROP LOOP ;       * 8EF05
          20GETLAM #1- 21GETLAM TWO{}N MATREDIM 22PUTLAM 20GETLAM #1- * 8EF1E
          20PUTLAM ROMPTR 0EA 031 ROMPTR 0EA 040 ; * 8EF46

* ROMPTR 0EA 058
* refs (1): 8D288
ROMP_0EA_058:
        :: ROMPTR 0EA 012 9GETLAM 13GETLAM #- ROMPTR 0EA 015 #* #12+ DUP * 8EF66
          7PUTLAM ROMPTR 0EA 015 #+ 5PUTLAM ROMPTR 0EA 00A ROMPTR 0EA 044 * 8EF9F
          ROMPTR 0EA 00E ROMPTR 0EA 047 ;        * 8EFCF

* ROMPTR 0EA 059
* refs (1): 8D288
CopyColsLeft~1:
        :: 21GETLAM #1+ 9GETLAM #1+ DO INDEX@ SWAP 20GETLAM #1+_ONE_DO * 8EFEA
          2DUPSWAP INDEX@ SWAP GetElt 3PICK #1- INDEX@ SWAP RowElt# ROT * 8F01C
          BANGARRY ?ATTNQUIT LOOP SWAPDROP LOOP ; * 8F04E

* ROMPTR 0EA 05A
* refs (1): 8D288
ROMP_0EA_05A:
        :: ComLine?:(bip;q) 8GETLAM 9GETLAM ROMPTR 0EA 03B 17GETLAM #> * 8F06C
          8GETLAM 20GETLAM #> 9GETLAM 21GETLAM #> OR OR ITE NULL$ * 8F095
          :: 22Lget 8GETLAM 9GETLAM ROMPTR 0EA 01E EDITDECOMP$ ; * 8F0C7
          InitEd&Modes EditString ;              * 8F0F0

* ROMPTR 0EA 05B
* refs (1): 8D288
CopyRowsDown~1:
        :: 20GETLAM #1+ 8GETLAM #- ONE_DO 20GETLAM INDEX@ #-SWAP 21GETLAM * 8F0FF
          #1+_ONE_DO 2DUPSWAP INDEX@ GetElt 3pick;1+(s) INDEX@ RowElt# ROT * 8F131
          BANGARRY ?ATTNQUIT LOOP SWAPDROP LOOP 8GETLAM SWAP 21GETLAM * 8F159
          #1+_ONE_DO OVERINDEX@ RowElt# OVER TYPECARRY? ITE C%0 %0_2A2B4 * 8F181
          SWAPROT BANGARRY ?ATTNQUIT LOOP SWAPDROP ; * 8F1A9

* ROMPTR 0EA 05C
* refs (1): 8D288
ROMP_0EA_05C:
        :: ComLine?:(bip;q) OBJ_44B9B BINT5 #<case DoBadKey * 8F1C7
          ROMPTR 0EA 018 DUP #2+                 * 8F1E5

* ROMPTR 0EA 05D
* refs (1): 8D288
ROMP_0EA_05D:
          :: BINT20 SWAP #/ SWAPDROP ; OBJ_44BAB #1+ 11GETLAM SWAP#- * 8F1FA
          DUP#0=IT                               * 8F22C
          :: #1+ 11GETLAM #1+ 11PUTLAM ; 13PUTLAM ROMPTR 0EA 058 ; * 8F231

* ROMPTR 0EA 05E
* refs (1): 8D288
CopyColsRght~1:
        :: 21GETLAM #1+ 9GETLAM #- ONE_DO 21GETLAM INDEX@ #-SWAP 20GETLAM * 8F264
          #1+_ONE_DO 2DUPSWAP INDEX@ SWAP GetElt 3pick;1+(s) INDEX@ SWAP * 8F296
          RowElt# ROT BANGARRY ?ATTNQUIT LOOP SWAPDROP LOOP 9GETLAM SWAP * 8F2BE
          20GETLAM #1+_ONE_DO OVERINDEX@ SWAP RowElt# OVER TYPECARRY? ITE * 8F2EB
          C%0 %0_2A2B4                           * 8F313
          SWAPROT BANGARRY ?ATTNQUIT LOOP SWAPDROP ; * 8F31D

* ROMPTR 0EA 05F
* refs (1): 8D288
ROMP_0EA_05F:
        :: ComLine?:(bip;q) 9GETLAM 21GETLAM #>case DoBadKey * 8F33B
          # 504 JstGetTHEMESG BigDisp1(st) 21GETLAM #1=case ROMPTR 0EA 051 * 8F359
          22Lget 9GETLAM 21GETLAM #=?SKIP CopyColsLeft MATTRN 21GETLAM #1- * 8F382
          20GETLAM TWO{}N MATREDIM MATTRN 22PUTLAM 21GETLAM #1- 21PUTLAM * 8F3AA
          ROMPTR 0EA 031 ROMPTR 0EA 040 ;        * 8F3D2

* ROMPTR 0EA 060
* refs (1): 8D288
ROMP_0EA_060:
        :: ComLine?:(bip;q) 20GETLAM #0= caseDoBadKey BINT1 * 8F3ED
          18PUTLAM # 505 JstGetTHEMESG BigDisp1(st) 22Lget 20GETLAM #1+ * 8F40B
          21GETLAM TWO{}N MATREDIM 20GETLAM #1+ 20PUTLAM 8GETLAM 20GETLAM * 8F433
          #=?SKIP CopyRowsDown 22PUTLAM ROMPTR 0EA 031 ROMPTR 0EA 040 ; * 8F45B

* ROMPTR 0EA 061
* refs (1): 8D288
ROMP_0EA_061:
        :: ComLine?:(bip;q) 21GETLAM #0= caseDoBadKey BINT1 * 8F485
          18PUTLAM # 506 JstGetTHEMESG BigDisp1(st) 22Lget MATTRN 21GETLAM * 8F4A3
          #1+ 20GETLAM TWO{}N MATREDIM MATTRN 21GETLAM #1+ 21PUTLAM 9GETLAM * 8F4CB
          21GETLAM #=?SKIP CopyColsRght 22PUTLAM ROMPTR 0EA 031 * 8F4F8
          ROMPTR 0EA 040 ;                       * 8F517

* ROMPTR 0EA 062
* refs (1): 8D288
ROMP_0EA_062:
        :: ComLine?:(bip;q) OBJ_44B9B BINT19 #>case DoBadKey * 8F527
          ROMPTR 0EA 018 DUP ROMPTR 0EA 05D OBJ_44BAB #1- 13GETLAM #+ * 8F545
          9GETLAM OVER#> IT                      * 8F574
          :: #1+ 13GETLAM #1+ 13PUTLAM ;         * 8F583
          11PUTLAM ROMPTR 0EA 058 ;              * 8F5A1

* ROMPTR 0EA 063
* refs (1): 8D288
ROMP_0EA_063:
        :: TakeOver ROMP_0A1_00C SetDA1NoCh ;    * 8F5B6

* ROMPTR 0EA 064
* refs (1): 8D288
ROMP_0EA_064:
        :: TakeOver ROMP_0A3_026 SetDA1NoCh ;    * 8F5CF

* ROMPTR 0EA 065
* refs (1): 8D288
ROMP_0EA_065:
        :: TakeOver ' ROMPTR 0EA 048 InitMenu ;  * 8F5E8

* ROMPTR 0EA 066
* refs (1): 8D288
ROMP_0EA_066:
        :: TakeOver OBJ_3D8C6 ;                  * 8F60C

* ROMPTR 0EA 067
* refs (1): 8D288
ROMP_0EA_067:
        :: 8GETLAM #1-DUP #0= caseDrpBadKy ROMPTR 0EA 012 * 8F620
          DUP 8PUTLAM DUP 12GETLAM #<ITE         * 8F644
          :: 12PUTLAM 10GETLAM #1- 10PUTLAM HARDBUFF BINT0 BINT6 * 8F65D

* ROMPTR 0EA 068
* refs (1): 8D288
ROMP_0EA_068:
            # 84 BINT38 SUBGROB HARDBUFF BINT0 BINT14 GROB! 12GETLAM DUP * 8F685
            ROMPTR 0EA 024 ROMPTR 0EA 015 11GETLAM #1+ 13GETLAM DO DUPINDEX@ * 8F6B7
            13GETLAM #- #* #12+ 2DUP#+ 12GETLAM INDEX@ ROMPTR 0EA 025 $>GROB * 8F6E6
            ROMPTR 0EA 016 BINT6 7PICK BINT8 SWAP MAKEGROB 7PICK HARDBUFF * 8F719
            SWAP BINT6 GROB! GROB! 2DROP LOOP DROP ; * 8F747
          :: DROP 6GETLAM DUP 4PUTLAM BINT8 #- 6PUTLAM ; ROMPTR 0EA 047 ; * 8F76F

* ROMPTR 0EA 069
* refs (1): 8D288
ROMP_0EA_069:
        :: 17GETLAM #0= 8GETLAM 20GETLAM #> OR caseDoBadKey ENTRWISE@ * 8F7AC
          #0= 18GETLAM #0= ANDcase               * 8F7D9
          :: ONEONE 20PUTLAM 9PUTLAM BINT2 8PUTLAM * 8F7ED

* ROMPTR 0EA 06A
* refs (1): 8D288
ROMP_0EA_06A:
            :: BINT1 18PUTLAM ROMPTR 0EA 040 ; ; * 8F80B
          ROMPTR 0EA 012                         * 8F82F

* ROMPTR 0EA 06B
* refs (1): 8D288
ROMP_0EA_06B:
          :: 8GETLAM #1+DUP 8PUTLAM DUP 10GETLAM #>case * 8F83A
            :: 10PUTLAM 12GETLAM #1+ 12PUTLAM HARDBUFF BINT0 BINT14 BINT131 * 8F85D
              BINT46 SUBGROB HARDBUFF BINT0 BINT6 GROB! 10GETLAM DUP * 8F88A
              ROMPTR 0EA 024 ROMPTR 0EA 015 11GETLAM #1+ 13GETLAM DO * 8F8B2
              DUPINDEX@ 13GETLAM #- #* #12+ 2DUP#+ 10GETLAM INDEX@ * 8F8DC
              ROMPTR 0EA 025 $>GROB ROMPTR 0EA 016 BINT38 7PICK BINT8 SWAP * 8F904
              MAKEGROB 7PICK HARDBUFF SWAP # 26 GROB! GROB! 2DROP LOOP DROP ; * 8F933
            DROP 4GETLAM DUP 6PUTLAM #8+ 4PUTLAM ; * 8F96F
          ROMPTR 0EA 047 ;                       * 8F992

* ROMPTR 0EA 06C
* refs (1): 8D288
ROMP_0EA_06C:
        :: 9GETLAM #1-DUP #0=case DropBadKey     * 8F9A2
          ROMPTR 0EA 012 DUP 9PUTLAM DUP 13GETLAM #<ITE * 8F9BB
          :: 13PUTLAM 11GETLAM #1- 11PUTLAM HARDBUFF BINT24 BINT0 11GETLAM * 8F9DF
            13GETLAM #- ROMPTR 0EA 015 #* #12+ BINT6 SUBGROB HARDBUFF * 8FA0C
            ROMPTR 0EA 015 BINT24 #+ BINT0 GROB! HARDBUFF BINT12 BINT6 * 8FA3A
            11GETLAM 13GETLAM #- ROMPTR 0EA 015 #* #12+ BINT46 SUBGROB * 8FA68
            HARDBUFF ROMPTR 0EA 015 #12+ BINT6 GROB! 13GETLAM DUP * 8FA96
            ROMPTR 0EA 014 ;                     * 8FABF
          :: DROP 7GETLAM DUP 5PUTLAM ROMPTR 0EA 015 #- 7PUTLAM ; * 8FACF
          ROMPTR 0EA 047 ;                       * 8FB02

* ROMPTR 0EA 06D
* refs (1): 8D288
ROMP_0EA_06D:
        :: 17GETLAM #0= 9GETLAM 21GETLAM #> OR caseDoBadKey ENTRWISE@ * 8FB12
          #1= 18GETLAM #0= ANDcase               * 8FB3F

* ROMPTR 0EA 06E
* refs (1): 8D288
ROMP_0EA_06E:
          :: ONEONE 21PUTLAM 8PUTLAM BINT2 9PUTLAM ROMPTR 0EA 06A ; * 8FB53
          ROMPTR 0EA 012                         * 8FB81

* ROMPTR 0EA 06F
* refs (1): 8D288
ROMP_0EA_06F:
          :: 9GETLAM #1+DUP 9PUTLAM DUP 11GETLAM #>case * 8FB8C
            :: 11PUTLAM 13GETLAM #1+ 13PUTLAM HARDBUFF ROMPTR 0EA 015 BINT24 * 8FBAF
              #+ BINT0 ROMPTR 0EA 068 BINT6 SUBGROB HARDBUFF BINT24 BINT0 * 8FBDD
              GROB! HARDBUFF ROMPTR 0EA 015 #12+ BINT6 BINT131 BINT46 * 8FC0B
              SUBGROB HARDBUFF BINT12 BINT6 GROB! 11GETLAM DUP * 8FC34
              ROMPTR 0EA 014 ;                   * 8FC57
            DROP 5GETLAM DUP 7PUTLAM ROMPTR 0EA 015 #+ 5PUTLAM ; * 8FC67
          ROMPTR 0EA 047 ;                       * 8FC95

* ROMPTR 0EA 070
* refs (1): 8D288
PINIT~1:
        :: BINT33 ONE_DO ?ATTNQUIT %0_2A2B4 ID 'tmp INDEX@ #>$ >TAG DUPUNROT * 8FCA5
          ERRSET                                 * 8FCE1
          :: sto(_,to) purge(to) ; ERRTRAP DropSysObs LOOP ; * 8FCE6

LIB0EA.hash:
        CON(5)  DOHSTR                           * 8FD0E  hash table of library 0EA
        LENGTH                                   * 8FD13  length, to #8FD72
        CON(5)  0                                * 8FD18  names of length 1
        CON(5)  0                                * 8FD1D  names of length 2
        CON(5)  0                                * 8FD22  names of length 3
        CON(5)  0                                * 8FD27  names of length 4
        CON(5)  0                                * 8FD2C  names of length 5
        CON(5)  0                                * 8FD31  names of length 6
        CON(5)  0                                * 8FD36  names of length 7
        CON(5)  0                                * 8FD3B  names of length 8
        CON(5)  0                                * 8FD40  names of length 9
        CON(5)  0                                * 8FD45  names of length 10
        CON(5)  0                                * 8FD4A  names of length 11
        CON(5)  0                                * 8FD4F  names of length 12
        CON(5)  0                                * 8FD54  names of length 13
        CON(5)  0                                * 8FD59  names of length 14
        CON(5)  0                                * 8FD5E  names of length 15
        CON(5)  0                                * 8FD63  names of length 16
        REL(5)  L_8FD6D                          * 8FD68  end of the names
L_8FD6D:
        CON(5)  0                                * 8FD6D  command 000 has no name
        ENDLENGTH                                * 8FD72

LIB0EA.link:
        CON(5)  DOHSTR                           * 8FD72  link table of library 0EA
        LENGTH                                   * 8FD77  length, to #8FFB1
        REL(5)  ROMP_0EA_000                     * 8FD7C  000 
        REL(5)  ROMP_0EA_001                     * 8FD81  001 
        REL(5)  ROMP_0EA_002                     * 8FD86  002 
        REL(5)  ROMP_0EA_003                     * 8FD8B  003 
        REL(5)  ROMP_0EA_004                     * 8FD90  004 
        REL(5)  ROMP_0EA_005                     * 8FD95  005 
        REL(5)  DoNewMatrix~1                    * 8FD9A  006 
        REL(5)  ROMP_0EA_007                     * 8FD9F  007 
        REL(5)  ROMP_0EA_008                     * 8FDA4  008 
        REL(5)  ROMP_0EA_009                     * 8FDA9  009 
        REL(5)  ROMP_0EA_00A                     * 8FDAE  00A 
        REL(5)  ROMP_0EA_00B                     * 8FDB3  00B 
        REL(5)  ROMP_0EA_00C                     * 8FDB8  00C 
        REL(5)  BindMatVars~1                    * 8FDBD  00D 
        REL(5)  ROMP_0EA_00E                     * 8FDC2  00E 
        REL(5)  DoOldMatrix~1                    * 8FDC7  00F 
        REL(5)  InitOldMat~1                     * 8FDCC  010 
        REL(5)  ROMP_0EA_012                     * 8FDD1  011 
        REL(5)  ROMP_0EA_012                     * 8FDD6  012 
        REL(5)  ROMP_0EA_013                     * 8FDDB  013 
        REL(5)  ROMP_0EA_014                     * 8FDE0  014 
        REL(5)  ROMP_0EA_015                     * 8FDE5  015 
        REL(5)  ROMP_0EA_016                     * 8FDEA  016 
        REL(5)  ROMP_0EA_017                     * 8FDEF  017 
        REL(5)  ROMP_0EA_018                     * 8FDF4  018 
        REL(5)  ROMP_0EA_019                     * 8FDF9  019 
        REL(5)  ROMP_0EA_01A                     * 8FDFE  01A 
        REL(5)  ROMP_0EA_01B                     * 8FE03  01B 
        REL(5)  ROMP_0EA_01C                     * 8FE08  01C 
        REL(5)  ROMP_0EA_01D                     * 8FE0D  01D 
        REL(5)  ROMP_0EA_01E                     * 8FE12  01E 
        REL(5)  ROMP_0EA_01F                     * 8FE17  01F 
        REL(5)  ROMP_0EA_021                     * 8FE1C  020 
        REL(5)  ROMP_0EA_021                     * 8FE21  021 
        REL(5)  ROMP_0EA_022                     * 8FE26  022 
        REL(5)  ROMP_0EA_023                     * 8FE2B  023 
        REL(5)  ROMP_0EA_024                     * 8FE30  024 
        REL(5)  ROMP_0EA_025                     * 8FE35  025 
        REL(5)  ROMP_0EA_026                     * 8FE3A  026 
        REL(5)  Blank$~1                         * 8FE3F  027 
        REL(5)  ROMP_0EA_028                     * 8FE44  028 
        REL(5)  ROMP_0EA_029                     * 8FE49  029 
        REL(5)  ROMP_0EA_02A                     * 8FE4E  02A 
        REL(5)  ROMP_0EA_02B                     * 8FE53  02B 
        REL(5)  ROMP_0EA_02C                     * 8FE58  02C 
        REL(5)  ROMP_0EA_02D                     * 8FE5D  02D 
        REL(5)  ROMP_0EA_02E                     * 8FE62  02E 
        REL(5)  ROMP_0EA_02F                     * 8FE67  02F 
        REL(5)  ROMP_0EA_030                     * 8FE6C  030 
        REL(5)  ROMP_0EA_031                     * 8FE71  031 
        REL(5)  ROMP_0EA_032                     * 8FE76  032 
        REL(5)  ROMP_0EA_033                     * 8FE7B  033 
        REL(5)  GetMat/Vec~1                     * 8FE80  034 
        REL(5)  ROMP_0EA_035                     * 8FE85  035 
        REL(5)  ROMP_0EA_036                     * 8FE8A  036 
        REL(5)  ROMP_0EA_037                     * 8FE8F  037 
        REL(5)  RowElt#~1                        * 8FE94  038 
        REL(5)  ROMP_0EA_039                     * 8FE99  039 
        REL(5)  ROMP_0EA_03A                     * 8FE9E  03A 
        REL(5)  ROMP_0EA_03B                     * 8FEA3  03B 
        REL(5)  ~'R;STO                          * 8FEA8  03C 
        REL(5)  ~RowElt#;PULLEL;SWAPDROP         * 8FEAD  03D 
        REL(5)  ROMP_0EA_03E                     * 8FEB2  03E 
        REL(5)  ROMP_0EA_03F                     * 8FEB7  03F 
        REL(5)  ROMP_0EA_040                     * 8FEBC  040 
        REL(5)  ROMP_0EA_041                     * 8FEC1  041 
        REL(5)  ROMP_0EA_042                     * 8FEC6  042 
        REL(5)  ROMP_0EA_043                     * 8FECB  043 
        REL(5)  ROMP_0EA_044                     * 8FED0  044 
        REL(5)  ROMP_0EA_045                     * 8FED5  045 
        REL(5)  ROMP_0EA_046                     * 8FEDA  046 
        REL(5)  ROMP_0EA_047                     * 8FEDF  047 
        REL(5)  ROMP_0EA_048                     * 8FEE4  048 
        REL(5)  ROMP_0EA_049                     * 8FEE9  049 
        REL(5)  ROMP_0EA_04A                     * 8FEEE  04A 
        REL(5)  ROMP_0EA_04B                     * 8FEF3  04B 
        REL(5)  ROMP_0EA_04C                     * 8FEF8  04C 
        REL(5)  ROMP_0EA_04D                     * 8FEFD  04D 
        REL(5)  ROMP_0EA_04E                     * 8FF02  04E 
        REL(5)  ROMP_0EA_04F                     * 8FF07  04F 
        REL(5)  ROMP_0EA_050                     * 8FF0C  050 
        REL(5)  ROMP_0EA_051                     * 8FF11  051 
        REL(5)  DoNewMatrix~2                    * 8FF16  052 
        REL(5)  InitOldMat~2                     * 8FF1B  053 
        REL(5)  InitOldMat~3                     * 8FF20  054 
        REL(5)  ROMP_0EA_055                     * 8FF25  055 
        REL(5)  ROMP_0EA_056                     * 8FF2A  056 
        REL(5)  CopyRowsUp~1                     * 8FF2F  057 
        REL(5)  ROMP_0EA_058                     * 8FF34  058 
        REL(5)  CopyColsLeft~1                   * 8FF39  059 
        REL(5)  ROMP_0EA_05A                     * 8FF3E  05A 
        REL(5)  CopyRowsDown~1                   * 8FF43  05B 
        REL(5)  ROMP_0EA_05C                     * 8FF48  05C 
        REL(5)  ROMP_0EA_05D                     * 8FF4D  05D 
        REL(5)  CopyColsRght~1                   * 8FF52  05E 
        REL(5)  ROMP_0EA_05F                     * 8FF57  05F 
        REL(5)  ROMP_0EA_060                     * 8FF5C  060 
        REL(5)  ROMP_0EA_061                     * 8FF61  061 
        REL(5)  ROMP_0EA_062                     * 8FF66  062 
        REL(5)  ROMP_0EA_063                     * 8FF6B  063 
        REL(5)  ROMP_0EA_064                     * 8FF70  064 
        REL(5)  ROMP_0EA_065                     * 8FF75  065 
        REL(5)  ROMP_0EA_066                     * 8FF7A  066 
        REL(5)  ROMP_0EA_067                     * 8FF7F  067 
        REL(5)  ROMP_0EA_068                     * 8FF84  068 
        REL(5)  ROMP_0EA_069                     * 8FF89  069 
        REL(5)  ROMP_0EA_06A                     * 8FF8E  06A 
        REL(5)  ROMP_0EA_06B                     * 8FF93  06B 
        REL(5)  ROMP_0EA_06C                     * 8FF98  06C 
        REL(5)  ROMP_0EA_06D                     * 8FF9D  06D 
        REL(5)  ROMP_0EA_06E                     * 8FFA2  06E 
        REL(5)  ROMP_0EA_06F                     * 8FFA7  06F 
        REL(5)  PINIT~1                          * 8FFAC  070 
        ENDLENGTH                                * 8FFB1
        BSS     4                                * 8FFB1
        ENDLENGTH                                * 8FFB5
        FILLTO  #90000                           * 8FFB5  75 zero nibbles: the next entry stays at #90000
