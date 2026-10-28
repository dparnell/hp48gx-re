* HP 48GX ROM revision R, #99FE9-#9CFFC: Library part 0E3
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #99FE9 in the original ROM).
        ENDLENGTH                                * 99FE9

        CON(5)  DOLIB                            * 99FE9  library object
        LENGTH                                   * 99FEE  length, to #9DA13
        CON(2)  0                                * 99FF3  title length

LIB0E3:
        CON(3)  #0E3                             * 99FF5  library number
        REL(5)  LIB0E3.hash                      * 99FF8  hash table
        REL(5)  ROMP_0E3_06D                     * 99FFD  message table
        REL(5)  LIB0E3.link                      * 9A002  link table
        CON(5)  0                                * 9A007  config
        RPL

* ROMPTR 0E3 000
* refs (1): 99FF5
ROMP_0E3_000:
        :: ' LAM 'EL1 STO ;                      * 9A00C

* ROMPTR 0E3 001
* refs (1): 99FF5
ROMP_0E3_001:
        :: ' LAM 'EL2 STO ;                      * 9A02F

* ROMPTR 0E3 002
* refs (1): 99FF5
ROMP_0E3_002:
        :: ' LAM 'EL3 STO ;                      * 9A052

* ROMPTR 0E3 003
* refs (1): 99FF5
ROMP_0E3_003:
        :: ' LAM 'EL4 STO ;                      * 9A075

* ROMPTR 0E3 004
* refs (1): 99FF5
ROMP_0E3_004:
        :: ' LAM 'EL5 STO ;                      * 9A098

* ROMPTR 0E3 005
* refs (1): 99FF5
ROMP_0E3_005:
        :: ' LAM 'EL6 STO ;                      * 9A0BB

* ROMPTR 0E3 006
* refs (1): 99FF5
ROMP_0E3_006:
        :: ' LAM 'EL7 STO ;                      * 9A0DE

* ROMPTR 0E3 007
* refs (1): 99FF5
ROMP_0E3_007:
        :: ' LAM 'EL8 STO ;                      * 9A101

* ROMPTR 0E3 008
* refs (1): 99FF5
ROMP_0E3_008:
        :: ' LAM 'EL9 STO ;                      * 9A124

* ROMPTR 0E3 009
* refs (1): 99FF5
ROMP_0E3_009:
        :: ' LAM 'EL10 STO ;                     * 9A147

* ROMPTR 0E3 00A
* refs (1): 99FF5
ROMP_0E3_00A:
        :: ' LAM 'EL11 STO ;                     * 9A16C

* ROMPTR 0E3 00B
* refs (1): 99FF5
ROMP_0E3_00B:
        :: ' LAM 'EL12 STO ;                     * 9A191

* ROMPTR 0E3 00C
* refs (1): 99FF5
ROMP_0E3_00C:
        :: RECLAIMDISP POLSaveUI ERRSET          * 9A1B6
          :: FALSE ZEROZERO BINT0 ONEONE ONEONE ONEONE ZEROZERO * 9A1CA
            {                                    * 9A1F2

* ROMPTR 0E3 00D
* refs (1): 99FF5
ROMP_0E3_00D:
              LAM 'EL1                           * 9A1F7

* ROMPTR 0E3 00E
* refs (1): 99FF5
ROMP_0E3_00E:
              LAM 'EL2                           * 9A206

* ROMPTR 0E3 00F
* refs (1): 99FF5
ROMP_0E3_00F:
              LAM 'EL3                           * 9A215

* ROMPTR 0E3 010
* refs (1): 99FF5
ROMP_0E3_010:
              LAM 'EL4                           * 9A224

* ROMPTR 0E3 011
* refs (1): 99FF5
ROMP_0E3_011:
              LAM 'EL5                           * 9A233

* ROMPTR 0E3 012
* refs (1): 99FF5
ROMP_0E3_012:
              LAM 'EL6                           * 9A242

* ROMPTR 0E3 013
* refs (1): 99FF5
ROMP_0E3_013:
              LAM 'EL7                           * 9A251

* ROMPTR 0E3 014
* refs (1): 99FF5
ROMP_0E3_014:
              LAM 'EL8                           * 9A260

* ROMPTR 0E3 015
* refs (1): 99FF5
ROMP_0E3_015:
              LAM 'EL9                           * 9A26F

* ROMPTR 0E3 016
* refs (1): 99FF5
ROMP_0E3_016:
              LAM 'EL10                          * 9A27E

* ROMPTR 0E3 017
* refs (1): 99FF5
ROMP_0E3_017:
              LAM 'EL11                          * 9A28F

* ROMPTR 0E3 018
* refs (1): 99FF5
ROMP_0E3_018:
              LAM 'EL12 }                        * 9A2A0
            BIND ClrDA1IsStat ' ROMPTR 0E3 019 BEGIN ROMPTR 0E3 00D NOT * 9A2B6
            WHILE                                * 9A2E5
            :: EVAL ; REPEAT ABND ClrDAsOK ;     * 9A2EA
          ERRTRAP POLResUI&Err POLRestoreUI COLA_EVAL ; * 9A30D

* ROMPTR 0E3 019
* refs (1): 99FF5
ROMP_0E3_019:
        :: ROMPTR 0E3 01D ROMPTR 0E3 01E ROMPTR 0E3 014 ROMPTR 0E3 013 * 9A326
          ROMPTR 0E2 000 ' ROMPTR 0E2 003 rGETATELN DROP TOTEMPOB * 9A357
          ROMPTR 0E2 003 ROMPTR 0E2 001 TWO{}N ROMPTR 0E3 049 ; * 9A381

* ROMPTR 0E3 01A
* refs (1): 99FF5
ROMP_0E3_01A:
        :: BINT0 #=casedrop                      * 9A3AC
          :: BINT2 NTHCOMPDROP ;                 * 9A3BB
          SWAP CARCOMP GETATELN DROP ;           * 9A3CF

* ROMPTR 0E3 01B
* refs (1): 99FF5
ROMP_0E3_01B:
        :: DUP#0=ITE                             * 9A3E8
          :: DROP BINT4 NTHCOMPDROP ;            * 9A3F2
          :: MenuRow@ BINT1 #= case              * 9A40B
            :: SWAP INCOMPDROP DROP DROP 4ROLLSWAP OVER #1-+ SWAPROT * 9A424
              ROMPTR 0E3 01C ID>$ $ ":\0A" &$ SWAPROT GETATELN DROP &$ ; * 9A451
            BINT61 UserITE                       * 9A48D
            :: SWAP BINT2 NTHCOMPDROP ROMPTR 0E3 01C ID>$ $ ": -" &$ ; * 9A497
            :: SWAP INCOMPDROP ROTROT2DROP ROTDROP 3PICK SUB$1# BINT60 * 9A4D5
              UserITE                            * 9A4FD
              :: ROMPTR 0E2 013 OVER NTHCOMPDROP TYPECHAR? ITE * 9A502
                ROMPTR 0E2 014 ROMPTR 0E2 013    * 9A526
              ;                                  * 9A53C
              ROMPTR 0E2 014 SWAP NTHCOMPDROP EDITDECOMP$ DUP $ "1" EQUAL * 9A541
              ITE                                * 9A571
              :: DROP $ "-" ;                    * 9A576
              :: BINT4 OVERLEN$ #1- SUB$ ;       * 9A591
              3UNROLL ROMPTR 0E3 01C ID>$ $ ":\0A" &$ SWAP&$ ; * 9A5AF
          ;                                      * 9A5E1
        ;                                        * 9A5E6

* ROMPTR 0E3 01C
* refs (1): 99FF5
ROMP_0E3_01C:
        ::                                       * 9A5EB
          CODE                                   * 9A5F0  70 nibbles
            C=DAT1  A                            * 9A5FA
            D1=D1+  5                            * 9A5FD
            D=D+1   A                            * 9A600
            RSTK=C                               * 9A602
            GOSBVL  POP#                         * 9A604
            GOSBVL  SAVPTR                       * 9A60B
            A=A-1   A                            * 9A612
            C=RSTK                               * 9A614
            D1=C                                 * 9A616
            D1=D1+  8                            * 9A619
            LC(5)   #000EE                       * 9A61C
            D=C     B                            * 9A623
L_9A626:
            D1=D1+  2                            * 9A626
            C=DAT1  B                            * 9A629
            ?D=C    B                            * 9A62C
            GOYES   L_9A626                      * 9A62F
            A=A-1   A                            * 9A631
            GONC    L_9A626                      * 9A633
            R0=C                                 * 9A636
            GOVLNG  PUSH#LOOP                    * 9A639
          ENDCODE                                * 9A640
          ' ROMPTR 0E2 029 rGETATELN DROP TOTEMPOB ; * 9A640

* ROMPTR 0E3 01D
* refs (1): 99FF5
ROMP_0E3_01D:
        {                                        * 9A664
          {                                      * 9A669
            :: TakeOver $ "SI" BINT60 TestUserFlag NOT Box/StdLabel ; * 9A66E
            :: TakeOver BINT60 ClrUserFlag DispMenu ; } * 9A69F
          {                                      * 9A6C2
            :: TakeOver $ "ENGL" BINT60 TestUserFlag Box/StdLabel ; * 9A6C7
            :: TakeOver BINT60 SetUserFlag DispMenu ; } * 9A6F7
          {                                      * 9A71A
            :: TakeOver $ "UNITS" BINT61 TestUserFlag NOT Box/StdLabel ; * 9A71F
            :: TakeOver BINT61 DUP UserITE ClrUserFlag SetUserFlag DispMenu ; } * 9A756
          NullMenuKey NullMenuKey                * 9A788
          { $ "QUIT"                             * 9A792
            :: TakeOver ROMPTR 0E3 01F ; }       * 9A7A9
        }                                        * 9A7C8

* ROMPTR 0E3 01E
* refs (1): 99FF5
ROMP_0E3_01E:
        { ROMPTR 0E3 020 ROMPTR 0E3 01F }        * 9A7CD

* ROMPTR 0E3 01F
* refs (1): 99FF5
ROMP_0E3_01F:
        :: ROMPTR 0E0 013 ROMPTR 0E3 048 'NOP ;  * 9A7ED  BRdone

* ROMPTR 0E3 020
* refs (1): 99FF5
ROMP_0E3_020:
        :: ROMPTR 0E3 047 ' ROMPTR 0E3 021 ;     * 9A812

* ROMPTR 0E3 021
* refs (1): 99FF5
ROMP_0E3_021:
        :: SWAP ROMPTR 0E3 007 DUP ROMPTR 0E3 006 ROMPTR 0E3 022 * 9A837
          ROMPTR 0E3 023 ONEONE 5ROLL DUP ' ROMPTR 0E2 003 rGETATELN DROP * 9A867
          TOTEMPOB DUP ROMPTR 0E3 001 ROMPTR 0E2 015 ROT NTHCOMPDROP EVAL * 9A89B
          DUP ROMPTR 0E3 002 DUPTWO NTHCOMPDROP SWAP CARCOMP EVAL SWAP * 9A8CA
          TWO{}N ROMPTR 0E3 049 ;                * 9A8F8

* ROMPTR 0E3 022
* refs (1): 99FF5
ROMP_0E3_022:
        {                                        * 9A90D
          { $ "SOLV"                             * 9A912
            :: TakeOver ROMPTR 0E3 047 ' ROMPTR 0E3 026 ; } * 9A929
          { $ "EQN"                              * 9A958
            :: TakeOver ROMPTR 0E3 047 ' ROMPTR 0E3 02A ; } * 9A96D
          { $ "VARS"                             * 9A99C
            :: TakeOver ROMPTR 0E3 047 ' ROMPTR 0E3 02C ; } * 9A9B3
          { $ "PIC"                              * 9A9E2
            :: TakeOver ROMPTR 0E3 047 ' ROMPTR 0E3 02D ; } * 9A9F7
          { $ "→STK"                             * 9AA26
            :: TakeOver ROMPTR 0E3 025 ; }       * 9AA3D
          { $ "EXIT"                             * 9AA5C
            :: TakeOver ROMPTR 0E0 013 ' ROMPTR 0E3 019 ; } * 9AA73  BRdone
        }                                        * 9AAA2

* ROMPTR 0E3 023
* refs (1): 99FF5
ROMP_0E3_023:
        { ROMPTR 0E3 024 ROMPTR 0E3 01F }        * 9AAA7

* ROMPTR 0E3 024
* refs (1): 99FF5
ROMP_0E3_024:
        :: ROMPTR 0E3 047 ' ROMPTR 0E3 029 ;     * 9AAC7

* ROMPTR 0E3 025
* refs (1): 99FF5
ROMP_0E3_025:
        :: ROMPTR 0E0 017 ROMPTR 0E3 00F BINT3 NTHCOMPDROP SWAP NTHCOMDDUP * 9AAEC  ~BRRclCurRow
          CARCOMP CARCOMP SWAP ROMPTR 0E3 027 SWAP #>1 IT * 9AB1B
          :: DUPLENCOMP #1-1SWAP SUBCOMP ;       * 9AB44
          AtUserStack ;                          * 9AB5D

* ROMPTR 0E3 026
* refs (1): 99FF5
ROMP_0E3_026:
        :: SWAPDROP ROMPTR 0E3 00F DUP CARCOMP EVAL 3PICKSWAP GETATELN DROP * 9AB67
          3UNROLL BINT3 NTHCOMPDROP SWAP NTHCOMPDROP ROMPTR 0E3 048 * 9AB9A
          ROMPTR 0E3 045 ;                       * 9ABBE

* ROMPTR 0E3 027
* refs (1): 99FF5
ROMP_0E3_027:
        :: DUPTWO NTHCOMPDROP EVAL CARCOMP DUPLEN$ DUP #1+_ONE_DO OVER * 9ABCE
          INDEX@ SUB$1# ' ROMPTR 0E2 029 rGETATELN DROP TOTEMPOB DUP ID z * 9ABFB
          EQUAL IT                               * 9AC32
          :: DROP NULL$ ;                        * 9AC3C
          3UNROLL LOOP SWAPDROP {}N SWAP CARCOMP DUP CARCOMP DUPTWO #<ITE * 9AC50
          :: #2+ NTHCOMPDROP ROMPTR 0E3 028 SWAP TWO{}N ; * 9AC82
          :: BINT2 #=ITE                         * 9ACAB
            :: BINT3 NTHCOMPDROP NULL{} SWAP ;   * 9ACBA
            :: INNERCOMP DROP ROTDROP ROTDROP ; ZEROSWAP INNERDUP ZERO_DO * 9ACD8
            #1-SWAP DUPTYPECHAR? IT              * 9AD05
            :: DROP DUP #2+PICK OVER #+ #3+PICK OVER #1+ NTHCOMPDROP ; * 9AD14
            ROMPTR 0E3 028 psh1& LOOP DROP DUP#2+ ROLLDROP #1+ DUP#1+ * 9AD4B
            ROLLSWAP {}N ;                       * 9AD79
        ;                                        * 9AD88

* ROMPTR 0E3 028
* refs (1): 99FF5
ROMP_0E3_028:
        :: ROMPTR 0E3 04B palparse ?SEMI         * 9AD8D
          3DROP ERROR@ BINT1 #= caseERRJMP       * 9ADA7
          SYMBOL ID Keyword ID Conflict x- ;     * 9ADC0
          # E303 JstGetTHEMESG DISPROW1 NULL$ DISPROW2 ERRBEEP ; * 9ADFB

* ROMPTR 0E3 029
* refs (1): 99FF5
ROMP_0E3_029:
        :: ROMPTR 0E3 02B ROMPTR 0E3 02F ROMPTR 0E3 033 ROT ROMPTR 0E3 052 ; * 9AE23

* ROMPTR 0E3 02A
* refs (1): 99FF5
ROMP_0E3_02A:
        :: ROMPTR 0E3 02B ROMPTR 0E3 02E ROMPTR 0E3 034 ROT ROMPTR 0E3 051 ; * 9AE5E

* ROMPTR 0E3 02B
* refs (1): 99FF5
ROMP_0E3_02B:
        :: ONEONE ROMPTR 0E3 009 ROMPTR 0E3 008 SWAP ROMPTR 0E3 005 DUP * 9AE99
          ROMPTR 0E3 004 ROMPTR 0E3 00F BINT3 NTHCOMPDROP SWAP NTHCOMDDUP * 9AECE
          ROMPTR 0E3 003 DUP CARCOMP CARCOMP ROMPTR 0E3 00B BINT1 * 9AEF8
          ROMPTR 0E3 00A CARCOMP ;               * 9AF22

* ROMPTR 0E3 02C
* refs (1): 99FF5
ROMP_0E3_02C:
        :: SWAP ROMPTR 0E3 005 DUP ROMPTR 0E3 004 ROMPTR 0E3 00F DUP CARCOMP * 9AF37
          DUP4UNROLL 3PICKSWAP EVAL GETATELN DROP SWAP BINT3 NTHCOMPDROP ROT * 9AF71
          NTHCOMDDUP ROMPTR 0E3 003 DUP CARCOMP CARCOMP ROMPTR 0E3 00B BINT1 * 9AF9E
          ROMPTR 0E3 00A BINT2 NTHCOMPDROP EVAL BINT1 3UNROLL BINT1 4UNROLL * 9AFCD
          ROMPTR 0E3 035 5UNROLL ROMPTR 0E3 036 5UNROLL 7ROLL EVAL SWAP * 9AFFB
          INCOMPDROP BINT5 {}N ROMPTR 0E3 04A ;  * 9B02A

* ROMPTR 0E3 02D
* refs (1): 99FF5
ROMP_0E3_02D:
        :: ONEONE ROMPTR 0E3 009 ROMPTR 0E3 008 SWAP ROMPTR 0E3 005 DUP * 9B049
          ROMPTR 0E3 004 ROMPTR 0E3 00F BINT3 NTHCOMPDROP SWAP NTHCOMDDUP * 9B07E
          ROMPTR 0E3 003 DUP CARCOMP CARCOMP ROMPTR 0E3 00B BINT1 * 9B0A8
          ROMPTR 0E3 00A BINT3 NTHCOMPDROP EVAL ROMPTR 0E3 03A * 9B0D2
          ROMPTR 0E3 03B ROT ROMPTR 0E3 060 ;    * 9B0F7

* ROMPTR 0E3 02E
* refs (1): 99FF5
ROMP_0E3_02E:
        :: ROMPTR 0E3 018 BINT2 #<ITE            * 9B117
          {                                      * 9B131
            { $ "SOLV"                           * 9B136
              :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03D ; } * 9B14D
            { $ "EQN"                            * 9B17C
              :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03E ; } * 9B191
            { $ "VARS"                           * 9B1C0
              :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03F ; } * 9B1D7
            { $ "PIC"                            * 9B206
              :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 041 ; } * 9B21B
            { $ "→STK"                           * 9B24A
              :: TakeOver ROMPTR 0E3 030 ; }     * 9B261
            { $ "EXIT"                           * 9B280
              :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03C ; } * 9B297
          }                                      * 9B2C6
          {                                      * 9B2CB
            { $ "SOLV"                           * 9B2D0
              :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03D ; } * 9B2E7
            { $ "NXEQ"                           * 9B316
              :: TakeOver ROMPTR 0E3 055 ROMPTR 0E3 031 DROP' ROMPTR 0E3 03E ; } * 9B32D
            { $ "VARS"                           * 9B367
              :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03F ; } * 9B37E
            { $ "PIC"                            * 9B3AD
              :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 041 ; } * 9B3C2
            { $ "→STK"                           * 9B3F1
              :: TakeOver ROMPTR 0E3 030 ; }     * 9B408
            { $ "EXIT"                           * 9B427
              :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03C ; } * 9B43E
          }                                      * 9B46D
        ;                                        * 9B472

* ROMPTR 0E3 02F
* refs (1): 99FF5
ROMP_0E3_02F:
        {                                        * 9B477
          { $ "SOLV"                             * 9B47C
            :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03D ; } * 9B493
          { $ "EQN"                              * 9B4C2
            :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03E ; } * 9B4D7
          { $ "VARS"                             * 9B506
            :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03F ; } * 9B51D
          { $ "PIC"                              * 9B54C
            :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 041 ; } * 9B561
          { $ "→STK"                             * 9B590
            :: TakeOver ROMPTR 0E3 030 ; }       * 9B5A7
          { $ "EXIT"                             * 9B5C6
            :: TakeOver ROMPTR 0E3 055 ' ROMPTR 0E3 03C ; } * 9B5DD
        }                                        * 9B60C

* ROMPTR 0E3 030
* refs (1): 99FF5
ROMP_0E3_030:
        :: ROMPTR 0E3 010 DUP CARCOMP CARCOMP SWAP ROMPTR 0E3 027 SWAP #>1 * 9B611
          IT                                     * 9B64A
          :: DUPLENCOMP #1- ONESWAP SUBCOMP ;    * 9B64F
          AtUserStack ;                          * 9B66D

* ROMPTR 0E3 031
* refs (1): 99FF5
ROMP_0E3_031:
        :: ROMPTR 0E3 010 CARCOMP DUP CARCOMP #>1 IT * 9B677
          :: DUPTWO NTHCOMPDROP ROMPTR 0E3 017 #1+SWAP OVER#< IT DROPONE * 9B6A0
            ROMPTR 0E3 00A ;                     * 9B6CE
        ;                                        * 9B6DE

* ROMPTR 0E3 032
* refs (1): 99FF5
ROMP_0E3_032:
        :: ROMPTR 0E3 010 CARCOMP DUP CARCOMP #>1 IT * 9B6E3
          :: DUPTWO NTHCOMPDROP ROMPTR 0E3 017 #1- DUP #0= ITE DROP SWAPDROP * 9B70C
            ROMPTR 0E3 00A ;                     * 9B744
        ;                                        * 9B754

* ROMPTR 0E3 033
* refs (1): 99FF5
ROMP_0E3_033:
        {                                        * 9B759
          :: ROMPTR 0E3 055 ROMPTR 0E3 02F ROMPTR 0E3 033 ROMPTR 0E3 031 ' * 9B75E
            ROMPTR 0E3 052 ;                     * 9B794
          :: ROMPTR 0E3 055 ROMPTR 0E3 048 'NOP ; * 9B7A4
          :: ROMPTR 0E3 055 ROMPTR 0E3 02F ROMPTR 0E3 033 ROMPTR 0E3 032 ' * 9B7C9
            ROMPTR 0E3 052 ;                     * 9B7FF
        }                                        * 9B80F

* ROMPTR 0E3 034
* refs (1): 99FF5
ROMP_0E3_034:
        {                                        * 9B814
          :: ROMPTR 0E3 055 ROMPTR 0E3 02F ROMPTR 0E3 033 ROMPTR 0E3 010 * 9B819
            CARCOMP ' ROMPTR 0E3 052 ;           * 9B84A
          :: ROMPTR 0E3 055 ROMPTR 0E3 048 'NOP ; } * 9B864

* ROMPTR 0E3 035
* refs (1): 99FF5
ROMP_0E3_035:
        {                                        * 9B88E
          { $ "SOLV"                             * 9B893
            :: TakeOver ROMPTR 0E0 013 ' ROMPTR 0E3 03D ; } * 9B8AA  BRdone
          { $ "EQN"                              * 9B8D9
            :: TakeOver ROMPTR 0E3 047 ' ROMPTR 0E3 037 ; } * 9B8EE
          { $ "VARS"                             * 9B91D
            :: TakeOver ROMPTR 0E0 013 ' ROMPTR 0E3 038 ; } * 9B934  BRdone
          { $ "PIC"                              * 9B963
            :: TakeOver ROMPTR 0E3 047 ' ROMPTR 0E3 039 ; } * 9B978
          { $ "→STK"                             * 9B9A7
            :: TakeOver ROMPTR 0E3 030 ; }       * 9B9BE
          { $ "EXIT"                             * 9B9DD
            :: TakeOver ROMPTR 0E0 013 ' ROMPTR 0E3 03C ; } * 9B9F4  BRdone
          {                                      * 9BA23
            :: TakeOver $ "SI" BINT60 TestUserFlag NOT Box/StdLabel ; * 9BA28
            :: TakeOver BINT60 TestUserFlag case * 9BA59
              :: BINT60 ClrUserFlag ROMPTR 0E0 049 * 9BA72  BRinverse
                ROMPTR 0E0 045                   * 9BA8C  BRDispItems
                ROMPTR 0E0 049 DispMenu ;        * 9BA97  BRinverse
            ;                                    * 9BAAC
          }                                      * 9BAB1
          {                                      * 9BAB6
            :: TakeOver $ "ENGL" BINT60 TestUserFlag Box/StdLabel ; * 9BABB
            :: TakeOver BINT60 TestUserFlag NOTcase * 9BAEB
              :: BINT60 SetUserFlag ROMPTR 0E0 049 * 9BB04  BRinverse
                ROMPTR 0E0 045                   * 9BB1E  BRDispItems
                ROMPTR 0E0 049 DispMenu ;        * 9BB29  BRinverse
            ;                                    * 9BB3E
          }                                      * 9BB43
          {                                      * 9BB48
            :: TakeOver $ "UNITS" BINT61 TestUserFlag NOT Box/StdLabel ; * 9BB4D
            :: TakeOver BINT61 DUP UserITE ClrUserFlag SetUserFlag * 9BB84
              ROMPTR 0E0 049                     * 9BBA7  BRinverse
              ROMPTR 0E0 045                     * 9BBB2  BRDispItems
              ROMPTR 0E0 049 DispMenu ;          * 9BBBD  BRinverse
          }                                      * 9BBD2
          { $ "→VARS"                            * 9BBD7
            :: TakeOver ROMPTR 0E3 010 ROMPTR 0E3 042 ; } * 9BBF0
          { $ "PURG"                             * 9BC1A
            :: TakeOver ROMPTR 0E3 010 ROMPTR 0E3 044 ; } * 9BC31
          { $ "EXIT"                             * 9BC5B
            :: TakeOver ROMPTR 0E0 013 ' ROMPTR 0E3 03C ; } * 9BC72  BRdone
        }                                        * 9BCA1

* ROMPTR 0E3 036
* refs (1): 99FF5
ROMP_0E3_036:
        {                                        * 9BCA6
          :: ROMPTR 0E0 013 ROMPTR 0E3 02F ROMPTR 0E3 033 ROMPTR 0E3 010 * 9BCAB  BRdone
            CARCOMP ' ROMPTR 0E3 052 ;           * 9BCDC
          ROMPTR 0E3 01F }                       * 9BCF6

* ROMPTR 0E3 037
* refs (1): 99FF5
ROMP_0E3_037:
        :: ROMPTR 0E3 008 ROMPTR 0E3 009 ROMPTR 0E3 03E ; * 9BD06

* ROMPTR 0E3 038
* refs (1): 99FF5
ROMP_0E3_038:
        :: ROMPTR 0E3 035 ROMPTR 0E3 036 ONEONE ROMPTR 0E3 040 ; * 9BD31

* ROMPTR 0E3 039
* refs (1): 99FF5
ROMP_0E3_039:
        :: ROMPTR 0E3 008 ROMPTR 0E3 009 ROMPTR 0E3 041 ; * 9BD61

* ROMPTR 0E3 03A
* refs (1): 99FF5
ROMP_0E3_03A:
        {                                        * 9BD8C
          { $ "SOLV"                             * 9BD91
            :: TakeOver ROMPTR 0E3 065 ' ROMPTR 0E3 03D ; } * 9BDA8
          { $ "EQN"                              * 9BDD7
            :: TakeOver ROMPTR 0E3 065 ' ROMPTR 0E3 03E ; } * 9BDEC
          { $ "VARS"                             * 9BE1B
            :: TakeOver ROMPTR 0E3 065 ' ROMPTR 0E3 03F ; } * 9BE32
          { $ "PIC"                              * 9BE61
            :: TakeOver ROMPTR 0E3 065 ' ROMPTR 0E3 041 ; } * 9BE76
          { $ "→PICT"                            * 9BEA5
            :: TakeOver ROMPTR 0E3 06B ; }       * 9BEBE
          { $ "EXIT"                             * 9BEDD
            :: TakeOver ROMPTR 0E3 065 ' ROMPTR 0E3 03C ; } * 9BEF4
        }                                        * 9BF23

* ROMPTR 0E3 03B
* refs (1): 99FF5
ROMP_0E3_03B:
        {                                        * 9BF28
          :: ROMPTR 0E3 065 ROMPTR 0E3 02F ROMPTR 0E3 033 ROMPTR 0E3 010 * 9BF2D
            CARCOMP ' ROMPTR 0E3 052 ;           * 9BF5E
          :: ROMPTR 0E3 065 ROMPTR 0E3 048 'NOP ; } * 9BF78

* ROMPTR 0E3 03C
* refs (1): 99FF5
ROMP_0E3_03C:
        :: ROMPTR 0E3 022 ROMPTR 0E3 023 ROMPTR 0E3 012 ROMPTR 0E3 011 * 9BFA2
          ROMPTR 0E3 00E ROMPTR 0E3 00F DUPTWO NTHCOMPDROP SWAP CARCOMP EVAL * 9BFD3
          SWAP TWO{}N ROMPTR 0E3 049 ;           * 9C002

* ROMPTR 0E3 03D
* refs (1): 99FF5
ROMP_0E3_03D:
        :: ROMPTR 0E3 010 ROMPTR 0E3 011 ROMPTR 0E3 00F CARCOMP EVAL * 9C01C
          GETATELN DROPSWAP ROMPTR 0E3 048 ROMPTR 0E3 045 ; * 9C04C

* ROMPTR 0E3 03E
* refs (1): 99FF5
ROMP_0E3_03E:
        :: ROMPTR 0E3 02E ROMPTR 0E3 034 ROMPTR 0E3 010 CARCOMP * 9C071
          ROMPTR 0E3 051 ;                       * 9C09C

* ROMPTR 0E3 03F
* refs (1): 99FF5
ROMP_0E3_03F:
        :: ROMPTR 0E3 035 ROMPTR 0E3 036 ROMPTR 0E3 016 ROMPTR 0E3 015 * 9C0AC
          ROMPTR 0E3 040 ;                       * 9C0DD

* ROMPTR 0E3 040
* refs (1): 99FF5
ROMP_0E3_040:
        :: ROMPTR 0E3 011 ROMPTR 0E3 00F CARCOMP EVAL DUP 3UNROLL GETATELN * 9C0ED
          DROP SWAP ROMPTR 0E3 010 BINT2 NTHCOMPDROP EVAL INCOMPDROP BINT5 * 9C121
          {}N ROMPTR 0E3 04A ;                   * 9C14F

* ROMPTR 0E3 041
* refs (1): 99FF5
ROMP_0E3_041:
        :: ROMPTR 0E3 03A ROMPTR 0E3 03B ROMPTR 0E3 010 BINT3 NTHCOMPDROP * 9C164
          EVAL ROMPTR 0E3 060 ;                  * 9C194

* ROMPTR 0E3 042
* refs (1): 99FF5
ROMP_0E3_042:
        :: BINT2 NTHCOMPDROP EVAL INCOMPDROP ROTROT2DROP DUPLEN$ #1+ ONE_DO * 9C1A9
          INDEX@ 3PICK ROMPTR 0E3 01C BINT61 UserITE * 9C1D6
          :: DUPSAFE@ ITE                        * 9C1F5
            :: DUPTYPEEXT? case                  * 9C204
              :: CARCOMP SWAP XEQSTOID ;         * 9C213
              2DROP ;                            * 9C22C
            :: %0_2A2B4 SWAP XEQSTOID ;          * 9C236
          ;                                      * 9C24F
          :: OVER INDEX@ SUB$1# BINT60 UserITE   * 9C254
            :: ROMPTR 0E2 013 OVER NTHCOMPDROP TYPECHAR? ITE ROMPTR 0E2 014 * 9C272
              ROMPTR 0E2 013                     * 9C2A1
            ;                                    * 9C2AC
            ROMPTR 0E2 014 SWAP NTHCOMPDROP SWAPDUP SAFE@ ITE * 9C2B1
            :: DUPTYPEREAL? DUP 3PICK TYPEEXT? OR NOTcase * 9C2D5
              :: 2DROP XEQSTOID ;                * 9C2F8
              4PICK TYPEREAL? ANDcase 3DROP      * 9C30C
              DUPTYPEREAL? case                  * 9C320
              :: ROT UMU> SWAPDROP UM>U SWAP XEQSTOID ; * 9C32A
              3PICK TYPEREAL? ITE                * 9C352
              :: ROTDROP CARCOMP SWAP XEQSTOID ; * 9C361
              :: CARCOMP ROT UM>U SWAP XEQSTOID ; * 9C37F
            ;                                    * 9C3A2
            XEQSTOID                             * 9C3A7
          ;                                      * 9C3AC
          LOOP 2DROP ;                           * 9C3B1

* ROMPTR 0E3 043
* refs (1): 99FF5
ROMP_0E3_043:
        :: BINT2 NTHCOMPDROP EVAL INCOMPDROP ROTROT2DROP DUPLEN$ #1+ ONE_DO * 9C3C0
          INDEX@ 3PICK ROMPTR 0E3 01C BINT61 UserITE * 9C3ED
          :: DUPSAFE@ ITE                        * 9C40C
            :: DUPTYPEEXT? case                  * 9C41B
              :: CARCOMP SWAP XEQSTOID ;         * 9C42A
              2DROP ;                            * 9C443
            :: %0_2A2B4 SWAP XEQSTOID ;          * 9C44D
          ;                                      * 9C466
          :: OVER INDEX@ SUB$1# BINT60 UserITE   * 9C46B
            :: ROMPTR 0E2 013 OVER NTHCOMPDROP TYPECHAR? ITE ROMPTR 0E2 014 * 9C489
              ROMPTR 0E2 013                     * 9C4B8
            ;                                    * 9C4C3
            ROMPTR 0E2 014 SWAP NTHCOMPDROP SWAPDUP SAFE@ ITE * 9C4C8
            :: DUPTYPEREAL? DUP 3PICK TYPEEXT? OR NOTcase 4DROP * 9C4EC
              4PICK TYPEREAL? ANDcase 3DROP      * 9C514
              DUPTYPEREAL? case                  * 9C528
              :: ROT UMU> SWAPDROP UM>U SWAP XEQSTOID ; * 9C532
              3PICK TYPEREAL? ITE                * 9C55A
              :: ROTDROP CARCOMP SWAP XEQSTOID ; * 9C569
              :: U>NCQ SWAPDROP 4PICK U>NCQ ROTROT2DROP EQUAL ITE 3DROP * 9C587
                :: %%>% ROT UM>U SWAP XEQSTOID ; * 9C5B4
              ;                                  * 9C5D7
            ;                                    * 9C5DC
            XEQSTOID                             * 9C5E1
          ;                                      * 9C5E6
          LOOP 2DROP ;                           * 9C5EB

* ROMPTR 0E3 044
* refs (1): 99FF5
ROMP_0E3_044:
        :: BINT2 NTHCOMPDROP EVAL INCOMPDROP ROTROT2DROP DUPLEN$ #1+ ONE_DO * 9C5FA
          INDEX@ 3PICK ROMPTR 0E3 01C PURGE LOOP 2DROP ; * 9C627

* ROMPTR 0E3 045
* refs (1): 99FF5
ROMP_0E3_045:
        :: CLEARLCD # E301 JstGetTHEMESG DISPROW4 SetDA1Valid ROMPTR 0E3 046 ; * 9C650

* ROMPTR 0E3 046
* refs (1): 99FF5
ROMP_0E3_046:
        :: DUP ROMPTR 0E3 043 DUP ROMPTR 0E3 027 SWAP CARCOMP CARCOMP BINT2 * 9C683
          #< NOTcase ROMPTR 0E4 00B              * 9C6BC
          ' ID EQ XEQSTOID DROP ' DoSolvrMenu ;  * 9C6D1

* ROMPTR 0E3 047
* refs (1): 99FF5
ROMP_0E3_047:
        :: ROMPTR 0E0 012                        * 9C6FA  ~BRoutput
          ROMPTR 0E0 013 ;                       * 9C70A  BRdone

* ROMPTR 0E3 048
* refs (1): 99FF5
ROMP_0E3_048:
        :: TRUE ROMPTR 0E3 000 ;                 * 9C71A

* ROMPTR 0E3 049
* refs (1): 99FF5
ROMP_0E3_049:
        :: SWAP 5UNROLL RESOROMP ROMPTR 0E3 01A NULL{} ROMPTR 0E0 010 ; * 9C734  ~BRbrowse

* ROMPTR 0E3 04A
* refs (1): 99FF5
ROMP_0E3_04A:
        :: SWAP 5UNROLL RESOROMP ROMPTR 0E3 01B NULL{} ROMPTR 0E0 010 ; * 9C768  ~BRbrowse

* ROMPTR 0E3 04B
* refs (1): 99FF5
ROMP_0E3_04B:
        CODE                                     * 9C79C  579 nibbles
          GOSBVL  SAVPTR                         * 9C7A6
          A=0     W                              * 9C7AD
          A=DAT1  A                              * 9C7B0
          LC(5)   #00005                         * 9C7B3
          A=A+C   A                              * 9C7BA
          D1=A                                   * 9C7BC
          A=DAT1  A                              * 9C7BF
          A=A-C   A                              * 9C7C2
          D1=D1+  5                              * 9C7C4
          ASRB                                   * 9C7C7
          C=A     A                              * 9C7CA
          C=C-1   A                              * 9C7CC
          R4=C                                   * 9C7CE
          D=C     A                              * 9C7D1
          LC(5)   #00002                         * 9C7D3
          B=C     A                              * 9C7DA
L_9C7DC:
          C=DAT1  B                              * 9C7DC
          LA(2)   #10                            * 9C7DF
          ?C>A    B                              * 9C7E6
          GOYES   L_9C80D                        * 9C7E9
          P=C     0                              * 9C7EB
          LC(16)  #5543322110111111              * 9C7EF
          P=C     0                              * 9C801
          C=0     A                              * 9C805
          CPEX    0                              * 9C807
          B=B+C   A                              * 9C80B
L_9C80D:
          B=B+1   A                              * 9C80D
          D1=D1+  2                              * 9C80F
          D=D-1   A                              * 9C812
          GONC    L_9C7DC                        * 9C814
          B=B+B   A                              * 9C817
          LC(5)   #00005                         * 9C819
          BCEX    A                              * 9C820
          C=C+B   A                              * 9C822
          R0=C                                   * 9C824
          C=C+B   A                              * 9C827
          GOSBVL  GETTEMP                        * 9C829
          AD0EX                                  * 9C830
          D0=A                                   * 9C833
          LC(5)   DOCSTR                         * 9C836
          DAT0=C  A                              * 9C83D
          D0=D0+  5                              * 9C840
          C=R0                                   * 9C843
          DAT0=C  A                              * 9C846
          GOSBVL  GETPTR                         * 9C849
          C=DAT1  A                              * 9C850
          D0=C                                   * 9C853
          D0=D0+  10                             * 9C856
          DAT1=A  A                              * 9C859
          D1=A                                   * 9C85C
          D1=D1+  10                             * 9C85F
          LC(2)   #27                            * 9C862
          DAT1=C  B                              * 9C866
          D1=D1+  2                              * 9C869
          C=R4                                   * 9C86C
          D=C     A                              * 9C86F
          LC(2)   #11                            * 9C871
          B=C     B                              * 9C875
L_9C878:
          A=DAT0  B                              * 9C878
          ?A<B    B                              * 9C87B
          GOYES   L_9C88A                        * 9C87E
          DAT1=A  B                              * 9C880
          D1=D1+  2                              * 9C883
          GOTO    L_9C9C5                        * 9C886
L_9C88A:
          A=A-1   B                              * 9C88A
          A=A-1   B                              * 9C88D
          GONC    L_9C8AC                        * 9C890
          LC(12)  #2854534E4F43                  * 9C893
L_9C8A1:
          DAT1=C  12                             * 9C8A1
          D1=D1+  12                             * 9C8A5
          GOTO    L_9C9C5                        * 9C8A8
L_9C8AC:
          A=A-1   B                              * 9C8AC
          GONC    L_9C8C3                        * 9C8AF
          LC(12)  #284553414255                  * 9C8B2
          GOC     L_9C8A1                        * 9C8C0
L_9C8C3:
          A=A-1   B                              * 9C8C3
          GONC    L_9C8E0                        * 9C8C6
          LC(10)  #2845544649                    * 9C8C9
          DAT1=C  10                             * 9C8D5
          D1=D1+  10                             * 9C8D9
          GOTO    L_9C9C5                        * 9C8DC
L_9C8E0:
          A=A-1   B                              * 9C8E0
          GONC    L_9C8FB                        * 9C8E3
          LC(8)   #28534F43                      * 9C8E6
L_9C8F0:
          DAT1=C  8                              * 9C8F0
          D1=D1+  8                              * 9C8F4
          GOTO    L_9C9C5                        * 9C8F7
L_9C8FB:
          A=A-1   B                              * 9C8FB
          GONC    L_9C90E                        * 9C8FE
          LC(8)   #284E4953                      * 9C901
          GOC     L_9C8F0                        * 9C90B
L_9C90E:
          A=A-1   B                              * 9C90E
          GONC    L_9C926                        * 9C911
          LC(6)   #646172                        * 9C914
L_9C91C:
          DAT1=C  6                              * 9C91C
          D1=D1+  6                              * 9C920
          GONC    L_9C98B                        * 9C923
L_9C926:
          A=A-1   B                              * 9C926
          GONC    L_9C937                        * 9C929
          LC(6)   #6F7774                        * 9C92C
          GOC     L_9C91C                        * 9C934
L_9C937:
          A=A-1   B                              * 9C937
          GONC    L_9C946                        * 9C93A
          LC(4)   #2A32                          * 9C93D
          GOC     L_9C984                        * 9C943
L_9C946:
          A=A-1   B                              * 9C946
          GONC    L_9C955                        * 9C949
          LC(4)   #2A29                          * 9C94C
          GOC     L_9C984                        * 9C952
L_9C955:
          A=A-1   B                              * 9C955
          GONC    L_9C969                        * 9C958
          LC(2)   #0A                            * 9C95B
          DAT1=C  B                              * 9C95F
          D1=D1+  2                              * 9C962
          GOTO    L_9C9C5                        * 9C965
L_9C969:
          A=A-1   B                              * 9C969
          GONC    L_9C978                        * 9C96C
          LC(4)   #2D32                          * 9C96F
          GOC     L_9C984                        * 9C975
L_9C978:
          A=A-1   B                              * 9C978
          GONC    L_9C98F                        * 9C97B
          LC(4)   #325E                          * 9C97E
L_9C984:
          DAT1=C  4                              * 9C984
          D1=D1+  4                              * 9C988
L_9C98B:
          GOTO    L_9C9C5                        * 9C98B
L_9C98F:
          A=A-1   B                              * 9C98F
          GONC    L_9C99E                        * 9C992
          LC(4)   #282F                          * 9C995
          GOC     L_9C984                        * 9C99B
L_9C99E:
          A=A-1   B                              * 9C99E
          GONC    L_9C9AD                        * 9C9A1
          LC(4)   #283D                          * 9C9A4
          GOC     L_9C984                        * 9C9AA
L_9C9AD:
          A=A-1   B                              * 9C9AD
          GONC    L_9C9BC                        * 9C9B0
          LC(4)   #2929                          * 9C9B3
          GOC     L_9C984                        * 9C9B9
L_9C9BC:
          LC(4)   #282A                          * 9C9BC
          GONC    L_9C984                        * 9C9C2
L_9C9C5:
          D0=D0+  2                              * 9C9C5
          D=D-1   A                              * 9C9C8
          GOC     L_9C9D1                        * 9C9CA
          GOTO    L_9C878                        * 9C9CD
L_9C9D1:
          LC(2)   #27                            * 9C9D1
          DAT1=C  B                              * 9C9D5
          GOSBVL  GETPTR                         * 9C9D8
          A=DAT0  A                              * 9C9DF
          D0=D0+  5                              * 9C9E2
          PC=(A)                                 * 9C9E5
        ENDCODE                                  * 9C9E9

* ROMPTR 0E3 04C
* refs (1): 99FF5
ROMP_0E3_04C:
        :: ' LAM 'EN1 STO ;                      * 9C9E9

* ROMPTR 0E3 04D
* refs (1): 99FF5
ROMP_0E3_04D:
        :: ' LAM 'EN2 STO ;                      * 9CA0C

* ROMPTR 0E3 04E
* refs (1): 99FF5
ROMP_0E3_04E:
        :: SWAP FALSE                            * 9CA2F
          {                                      * 9CA3E

* ROMPTR 0E3 04F
* refs (1): 99FF5
ROMP_0E3_04F:
            LAM 'EN2                             * 9CA43

* ROMPTR 0E3 050
* refs (1): 99FF5
ROMP_0E3_050:
            LAM 'EN1 }                           * 9CA52
          BIND CLCD10 DUPDUP CARCOMP BINT2 #<ITE * 9CA66
          :: BINT2 NTHCOMPDROP SWAPDROP BINT1 ;  * 9CA84
          :: BINT2 NTHCOMPDROP SWAP BINT3 NTHCOMPDROP ROMPTR 0E3 017 * 9CAA2
            NTHCOMPDROP SWAP ;                   * 9CACB
          DUP 5UNROLL ROMPTR 0E3 053 3UNROLL ClrDAsOK RESOROMP * 9CADA
          ROMPTR 0E3 054 SWAP TrueTrue 5ROLL ONEFALSE' LAM 'EN1 ' ERRJMP * 9CAFE
          POLSetUI ;                             * 9CB36

* ROMPTR 0E3 051
* refs (1): 99FF5
ROMP_0E3_051:
        :: ERRSET                                * 9CB40
          :: RESOROMP ROMPTR 0E3 056 3UNROLL ROMPTR 0E3 04E ROMPTR 0E3 028 * 9CB4A
            Symb>HBuff ROMPTR 0E3 053 POLKeyUI RECLAIMDISP ClrDAsOK ; * 9CB7A
          ERRTRAP ERRJMP ;                       * 9CB9E

* ROMPTR 0E3 052
* refs (1): 99FF5
ROMP_0E3_052:
        :: ERRSET                                * 9CBAD
          :: RESOROMP ROMPTR 0E3 057 3UNROLL ROMPTR 0E3 04E SWAPDROP * 9CBB7
            ROMPTR 0E3 04B ZEROOVER BEGIN DUP $ "\0A" BINT1 POS$ DUP#0<> * 9CBE1
            WHILE                                * 9CC16
            :: ROT#1+UNROT #1+ OVERLEN$ SUB$ ; REPEAT 2DROP #1+ * 9CC1B
            { BINT4 BINT4 BINT3 BINT3 BINT2 BINT2 } SWAP NTHCOMPDROP BINT7 * 9CC48
            Disp5x7 POLKeyUI ClrDAsOK ;          * 9CC7F
          ERRTRAP ERRJMP ;                       * 9CC93

* ROMPTR 0E3 053
* refs (1): 99FF5
ROMP_0E3_053:
        :: DUP#1= ITE DROPNULL$                  * 9CCA2
          :: UNCOERCE ROMPTR 0E3 017 UNCOERCE EDITDECOMP$ # E302 * 9CCB6
            JstGetTHEMESG &$SWAP EDITDECOMP$ &$ ; * 9CCDF
          ROMPTR 0E3 018 DUP#1= ITE              * 9CCF8
          :: DROP $ " *" &$ ;                    * 9CD0D
          :: #3= IT                              * 9CD2F
            :: ROMPTR 0E3 010 CARCOMP BINT4 NTHCOMPDROP ROMPTR 0E3 017 * 9CD3E
              NTHCOMPDROP TYPECHAR? ?SKIP        * 9CD68
              :: $ " *" &$ ;                     * 9CD77
            ;                                    * 9CD94
          ;                                      * 9CD99
          $>grob ZEROZERO ROT XYGROBDISP ;       * 9CD9E

* ROMPTR 0E3 054
* refs (1): 99FF5
ROMP_0E3_054:
        :: DA3OK? ?SKIP                          * 9CDB7
          :: DispMenu SetDA3Valid ;              * 9CDC6
        ;                                        * 9CDDA

* ROMPTR 0E3 055
* refs (1): 99FF5
ROMP_0E3_055:
        :: TRUE ROMPTR 0E3 04C ;                 * 9CDDF

* ROMPTR 0E3 056
* refs (1): 99FF5
ROMP_0E3_056:
        :: BINT1 #=casedrop ROMPTR 0E3 059       * 9CDF9
          BINT3 #=casedrop ROMPTR 0E3 05A        * 9CE13
          2DROP 'DoBadKeyT ;                     * 9CE28

* ROMPTR 0E3 057
* refs (1): 99FF5
ROMP_0E3_057:
        :: BINT1 #=casedrop ROMPTR 0E3 058       * 9CE37
          BINT3 #=casedrop ROMPTR 0E3 05A        * 9CE51
          2DROP 'DoBadKeyT ;                     * 9CE66

* ROMPTR 0E3 058
* refs (1): 99FF5
ROMP_0E3_058:
        :: BINT11 ?CaseRomptr@ ROMPTR 0E3 05D BINT17 ?CaseRomptr@ * 9CE75
          ROMPTR 0E3 05B BINT40 #=casedrpfls BINT25 * 9CE99
          ?CaseRomptr@ ROMPTR 0E3 05B BINT45 ?CaseRomptr@ ROMPTR 0E3 05C * 9CEB3
          BINT7 #<case FALSE                     * 9CED8
          'DoBadKeyT ;                           * 9CEE7

* ROMPTR 0E3 059
* refs (1): 99FF5
ROMP_0E3_059:
        :: BINT11 ?CaseKeyDef SCROLLUP BINT17 ?CaseKeyDef SCROLLDOWN BINT16 * 9CEF1
          ?CaseKeyDef SCROLLLEFT BINT18 ?CaseKeyDef SCROLLRIGHT BINT40 * 9CF19
          #=casedrpfls BINT25                    * 9CF37
          ?CaseRomptr@ ROMPTR 0E3 05B BINT45 ?CaseRomptr@ ROMPTR 0E3 05C * 9CF41
          BINT7 #<case FALSE                     * 9CF66
          'DoBadKeyT ;                           * 9CF75

* ROMPTR 0E3 05A
* refs (1): 99FF5
ROMP_0E3_05A:
        :: BINT11 ?CaseKeyDef JUMPTOP BINT17 ?CaseKeyDef JUMPBOT BINT16 * 9CF7F
          ?CaseKeyDef JUMPLEFT BINT18 ?CaseKeyDef JUMPRIGHT BINT45 * 9CFA7
          #=casedrpfls DROP                      * 9CFC5
          'DoBadKeyT ;                           * 9CFCF

* ROMPTR 0E3 05B
* refs (1): 99FF5
ROMP_0E3_05B:
        :: TakeOver ROMPTR 0E3 04F CARCOMP COLA_EVAL ; * 9CFD9
