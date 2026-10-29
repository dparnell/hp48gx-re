* HP 48GX ROM revision R, #A2437-#A54DA: Library part 0B4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #A2437 in the original ROM).

LIB0B4:
        CON(3)  #0B4                             * A2437  library number
        REL(5)  LIB0B4.hash                      * A243A  hash table
        CON(5)  0                                * A243F  message table
        REL(5)  LIB0B4.link                      * A2444  link table
        CON(5)  0                                * A2449  config
        RPL

* ROMPTR 0B4 000
* refs (1): A2437
ROMP_0B4_000:
        :: ROMPTR 0B0 0AB                        * A244E
          {                                      * A245E
            { # BF01 ROMPTR 0B4 001 }            * A2463
            { # BF02 ROMPTR 0B4 017 }            * A2482
            { # BF03 ROMPTR 0B4 02C }            * A24A1
            { # BF04 ROMPTR 0B4 033 }            * A24C0
            { # BF05 ROMPTR 0B4 038 } }          * A24DF
          ROMPTR 0B0 0A9 ;                       * A2503

* ROMPTR 0B4 001
* refs (1): A2437
ROMP_0B4_001:
        :: MINUSONE BINT1 MINUSONE MINUSONE 'NOP BINT1 * A2513
          { LAM 'V LAM 'P LAM 'p LAM 'I LAM 'IE LAM 'IX } BIND BEGIN LAM 'P * A2536
          MINUSONE #=ITE                         * A259B
          :: BINT1 ' LAM 'P STOLAM MINUSONE ; ROMPTR 0B5 000 ROMPTR 0B4 002 * A25A5
          LAM 'V LENCOMP BINT12 #/ SWAP #0<> IT #1+ * A25E4
          BINT1 #MAX ' LAM 'p STOLAM DoInputForm LAM 'IX #0<> IT * A2612
          :: NOT?SEMI                            * A264D
            ROMPTR 0B4 016 ;                     * A2657
          LAM 'IX #0= WHILE                      * A2667
          :: BINT2 ' LAM 'IX STOLAM ; REPEAT ' LAM 'IE undo DROP ABND EVAL ; * A267E

* ROMPTR 0B4 002
* refs (1): A2437
ROMP_0B4_002:
        :: LAM 'V MINUSONE EQUAL IT              * A26D4
          :: DUP ROMPTR 0B5 002 ' LAM 'V STOLAM ; * A26F3
          LAM 'V ROMPTR 0B4 012 DUPNULL{}? ITE   * A2722
          :: DROP ROMPTR 0B4 003 BINT1 {}N ROMPTR 0B4 004 BINT1 {}N ; * A2742
          :: ROMPTR 0B4 014 BINT2 OVER LENCOMP BINT3 #/ SWAP #0<> IT #1+ * A277B
            BINT1 ROMPTR 0B1 01E SWAP ROMPTR 0B4 003 >HCOMP ROMPTR 0B4 004 * A27B8
            ROT INNERCOMP DUP 1LAMBIND ZERO_DO ISTOP@ ROLL 'RROMPTR@ * A27E8
            ROMPTR 0B4 1F9 >HCOMP                * A2810
            { BINT1                              * A2820
              { BINT0 BINT1 BINT13 BINT5 } BINT4 # BF07 MINUSONE MINUSONE } * A282A
            &COMP LOOP 1GETABND #1+ {}N ;        * A2866
          'RROMPTR@ ROMPTR 0B4 005 # BF06 MINUSONE 6ROLL LAM 'V DUPNULL{}? * A2884
          ITE DROPZERO                           * A28B8
          :: ROMPTR 0B4 014 INNERCOMP DUP 1LAMBIND ZERO_DO ISTOP@ ROLL * A28C2
            ROMPTR 0B5 005 ?SKIP MINUSONE        * A28F0
            LOOP 1GETABND ;                      * A2905
          #1+ {}N ROMPTR 0B1 022 ;               * A2914

* ROMPTR 0B4 003
* refs (1): A2437
ROMP_0B4_003:
        { # BF08 BINT1 BINT10 }                  * A292E

* ROMPTR 0B4 004
* refs (1): A2437
ROMP_0B4_004:
        { ROMPTR 0B4 007 BINT13 BINT8 BINT115 BINT9 BINT23 * A294C
          { BINT9 BINT8 BINT6 BINT5 }            * A2975
          :: ROMPTR 0B5 02B BINT4 ROMPTR 0B0 074 ; # BF09 # BF0A MINUSONE } * A2993

* ROMPTR 0B4 005
* refs (1): A2437
ROMP_0B4_005:
        ::                                       * A29D6
          { BINT16                               * A29DB
            :: ROMPTR 0B4 006 TRUE ; BINT14      * A29E5
            :: LAM 'IX 14GETLAM #MIN ; }         * A2A04
          EQLookup case                          * A2A2A
          :: EVAL TRUE ;                         * A2A34
          DROPFALSE ;                            * A2A48

* ROMPTR 0B4 006
* refs (1): A2437
ROMP_0B4_006:
        {                                        * A2A52
          {                                      * A2A57
            :: TakeOver ROMPTR 0B4 013 LAM 'P LAM 'p #<> AND ITE * A2A5C
              :: PTR DirLabel: $ "MORE" ;        * A2A96
              :: PTR DirLabel: $ "VARS" ;        * A2AB7
            ;                                    * A2AD8
            ROMPTR 0B4 00B }                     * A2ADD
          {                                      * A2AED
            :: TakeOver LAM 'I MINUSONE EQUAL ITE NULL$ $ "INFO" * A2AF2
            ;                                    * A2B2D
            ROMPTR 0B4 00F }                     * A2B32
          {                                      * A2B42
            :: TakeOver 5GETLAM #>1 ITE $ "SOLVE" $ "EXPR=" * A2B47
            ;                                    * A2B88
            ROMPTR 0B4 010 }                     * A2B8D
        }                                        * A2B9D

* ROMPTR 0B4 007
* refs (1): A2437
ROMP_0B4_007:
        ::                                       * A2BA2
          { BINT47                               * A2BA7
            :: 4GETLAM ROMPTR 0B0 013 MINUSONE 4GETLAM * A2BB1  IFEDispField
              ROMPTR 0B0 0C5 MINUSONE EQUAL ITE MINUSONE BINT1 * A2BD0  ~gFldVal
              ROMPTR 0B4 011 ;                   * A2BF4
          }                                      * A2C04
          EQLookup case                          * A2C09
          :: EVAL TRUE ;                         * A2C13
          ROMPTR 0B4 008 ;                       * A2C27

* ROMPTR 0B4 008
* refs (1): A2437
ROMP_0B4_008:
        :: BINT8 #<>case FALSE                   * A2C37
          ROMPTR 0B4 009 ;                       * A2C4B

* ROMPTR 0B4 009
* refs (1): A2437
ROMP_0B4_009:
        :: EditExstCase FALSE 2DUP Key>U/SKeyOb ' ROMPTR 0B4 045 EQUAL * A2C5B
          NOTcaseFALSE 2DROP                     * A2C89
          ' ROMPTR 0B4 00A TrueTrue ;            * A2C93

* ROMPTR 0B4 00A
* refs (1): A2437
ROMP_0B4_00A:
        :: TakeOver ' ROMPTR 0B4 045 ' LAM 'IE STOLAM ROMPTR 0B4 015 TRUE * A2CAD
          11PUTLAM FALSE ;                       * A2CEE

* ROMPTR 0B4 00B
* refs (1): A2437
ROMP_0B4_00B:
        :: TakeOver ROMPTR 0B4 013 LAM 'P LAM 'p #<> AND case ROMPTR 0B4 00E * A2CFD
          ROMPTR 0B4 00C ;                       * A2D42

* ROMPTR 0B4 00C
* refs (1): A2437
ROMP_0B4_00C:
        :: # BF0C BINT1 BINT19 'RROMPTR@ ROMPTR 0B4 00D BINT7 BINT26 # 79 * A2D52
          BINT9 BINT5                            * A2D8F
          { BINT5 BINT6 } BINT4 # BF0D MINUSONE BINT4 BINT1 ROMPTR 0B0 0C5 * A2D99  ~gFldVal
          ROMPTR 0B5 002 LAM 'V BINT1 DUP 'DROPFALSE # BF0B BINT1 * A2DD6
          ROMPTR 0B0 0C5                         * A2E0A  ~gFldVal
          { LAM 'F } BIND DoInputForm ABND NOT?SEMI * A2E15
          DUPTYPELIST? ?SKIP ONE{}N              * A2E3E
          DUPINCOMP ZERO_DO TYPEIDNT? NcaseTYPEERR LOOP * A2E4D
          BINT1 ROMPTR 0B4 011 ;                 * A2E66

* ROMPTR 0B4 00D
* refs (1): A2437
ROMP_0B4_00D:
        ::                                       * A2E7B
          { BINT40                               * A2E80
            :: LAM 'F ROMPTR 0B5 002 BINT1 ; BINT61 TRUE } * A2E8A
          EQLookup case                          * A2EBE
          :: EVAL TRUE ;                         * A2EC8
          DROPFALSE ;                            * A2EDC

* ROMPTR 0B4 00E
* refs (1): A2437
ROMP_0B4_00E:
        :: LAM 'V LAM 'P #1+ LAM 'p OVER #< IT DROPONE * A2EE6
          ROMPTR 0B4 011 14GETLAM #1<> IT        * A2F25
          :: BINT2 ROMPTR 0B0 06B ;              * A2F3F
        ;                                        * A2F59

* ROMPTR 0B4 00F
* refs (1): A2437
ROMP_0B4_00F:
        :: TakeOver LAM 'I DUP MINUSONE EQUAL casedrop DoBadKey * A2F5E
          INCOMPDROP ROT BINT4 ROMPTR 0B0 074 $ ": " &$ ROT BINT4 * A2F8C
          ROMPTR 0B0 074 &$ CHR_Newline >T$ SWAP&$ BINT15 BINT2 MINUSONE ' * A2FC3
          ROMPTR 0B1 002                         * A2FF6  ~MsgBoxMenu
          ROMPTR 0B1 000 DROP SetDA123NoCh ;     * A3001  ~DoMsgBox

* ROMPTR 0B4 010
* refs (1): A2437
ROMP_0B4_010:
        :: TakeOver ROMPTR 0B4 015 5GETLAM #1= case * A301B
          :: BINT1 ROMPTR 0B0 0C5 ROMPTR 0B5 004 ITE * A303F  ~gFldVal
            :: SWAP OBJ_158B9 msg>TAG SWAP OBJ_158DC msg>TAG ; * A3064
            :: OBJ_158FF msg>TAG ;               * A308C
            AtUserStack SetDA123NoCh ;           * A30A0
          LAM 'V ROMPTR 0B4 014 5GETLAM #1- NTHCOMPDROP ROMPTR 0EA 02B * A30AF
          1LAMBIND ROMPTR 0B5 003 1GETABND ROMPTR 0EA 02B EQUAL IT * A30DF
          :: SetDA1NoCh SetDA2aNoCh ;            * A3109
          LAM 'V ROMPTR 0B4 014 5GETLAM #1- NTHCOMPDROP DUP ROMPTR 0B5 005 * A311D
          ?SKIP %0_2A2B4                         * A3152
          2DUP SWAP ID>TAG 3UNROLL DUP 5GETLAM ROMPTR 0B0 0D5 5ROLL BINT3 * A315C  ~sFldVal
          {}N ' LAM 'I STOLAM SWAP NOTcasedrop ERROROUT * A318F
          AtUserStack 5GETLAM ROMPTR 0B0 0A2 ;   * A31B8

* ROMPTR 0B4 011
* refs (1): A2437
ROMP_0B4_011:
        :: ROMPTR 0B4 015 ' LAM 'P STOLAM ' LAM 'V STOLAM BINT0 ' LAM 'IX * A31D2
          STOLAM TRUE 11PUTLAM ;                 * A3223

* ROMPTR 0B4 012
* refs (1): A2437
ROMP_0B4_012:
        :: DUPNULL{}? ?SEMI                      * A3237
          INNERCOMP DUP 1LAMBIND ZERO_DO ISTOP@ ROLL ID>$ PTR CHR_: >T$ LOOP * A3246
          1GETABND {}N ;                         * A3278

* ROMPTR 0B4 013
* refs (1): A2437
ROMP_0B4_013:
        :: LAM 'V LENCOMP BINT12 #> ;            * A3287

* ROMPTR 0B4 014
* refs (1): A2437
ROMP_0B4_014:
        :: BINT12 DUP LAM 'P #1- #* #1+ SWAP #1- OVER #+ 3PICK LENCOMP #MIN * A32AB
          SUBCOMP ;                              * A32F7

* ROMPTR 0B4 015
* refs (1): A2437
ROMP_0B4_015:
        :: ROMPTR 0B0 0C8 ROMPTR 0B4 016 ;       * A3301  GetFieldVals

* ROMPTR 0B4 016
* refs (1): A2437
ROMP_0B4_016:
        :: LAM 'V DUPNULL{}? casedrop ROMPTR 0B5 001 * A3321
          ROMPTR 0B4 014 DUP LENCOMP #1+_ONE_DO  * A3346
          :: ISTOP-INDEX #1+ ROLL DUP MINUSONE EQUAL caseDROP OVER * A3360
            INDEX@ NTHCOMPDROP ROMPTR 0B5 006 ;  * A338D
          LOOP DROP ROMPTR 0B5 001 ;             * A33A7

* ROMPTR 0B4 017
* refs (1): A2437
ROMP_0B4_017:
        :: # BF0F BINT1 BINT10 # BF10 BINT37 BINT10 # BF11 BINT85 BINT10 * A33C1
          # BF12 BINT1 BINT19 # BF13 BINT40 BINT19 # BF14 BINT85 BINT19 * A3402
          # BF15 BINT1 BINT28 # BF13 BINT40 BINT28 # BF14 BINT85 BINT28 * A343E
          # BF16 BINT1 BINT37 # BF17 BINT52 BINT37 # BF18 BINT113 BINT37 * A347A
          'RROMPTR@ ROMPTR 0B4 020 BINT25 BINT8 # 67 BINT9 BINT23 * A34B6
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BF19 # BF0A MINUSONE * A34E4
          MINUSONE MINUSONE 'RROMPTR@ ROMPTR 0B4 021 BINT10 BINT8 BINT25 * A3525
          BINT9 BINT23                           * A354E
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BF19 # BF0A MINUSONE * A3558
          MINUSONE MINUSONE 'RROMPTR@ ROMPTR 0B4 021 BINT58 BINT8 BINT25 * A3599
          BINT9 BINT23                           * A35C2
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BF1A # BF0A MINUSONE * A35CC
          MINUSONE MINUSONE 'RROMPTR@ ROMPTR 0B4 021 # 6A BINT8 BINT25 BINT9 * A360D
          BINT23                                 * A3640
          { BINT9 BINT8 BINT6 BINT0 BINT3 } BINT4 # BF1B # BF0A MINUSONE * A3645
          MINUSONE MINUSONE 'RROMPTR@ ROMPTR 0B4 01A BINT25 BINT17 BINT13 * A3686
          BINT9 BINT1                            * A36AF
          { BINT6 } BINT4 # BF1C MINUSONE MINUSONE 'IDX MINUSONE 'RROMPTR@ * A36B9
          ROMPTR 0B4 01A BINT58 BINT17 BINT25 BINT9 BINT1 * A36F0
          { BINT0 } BINT4 # BF1D MINUSONE MINUSONE %0_2A2B4 MINUSONE * A3714
          'RROMPTR@ ROMPTR 0B4 01A # 6A BINT17 BINT25 BINT9 BINT1 * A3746
          { BINT0 } BINT4 # BF1E MINUSONE MINUSONE % 6.5E0 MINUSONE * A3774
          'RROMPTR@ ROMPTR 0B4 01A BINT25 BINT26 BINT13 BINT9 BINT1 * A37B6
          { BINT6 } BINT4 # BF1F MINUSONE MINUSONE ' ID Y MINUSONE 'RROMPTR@ * A37DF
          ROMPTR 0B4 01A BINT58 BINT26 BINT25 BINT9 BINT1 * A381F
          { BINT0 BINT3 } BINT4 # BF20 MINUSONE MINUSONE %0_2A2B4 MINUSONE * A3843
          'RROMPTR@ ROMPTR 0B4 024 # 6A BINT26 BINT25 BINT9 BINT1 * A387A
          { BINT0 BINT3 } BINT4 # BF21 MINUSONE MINUSONE MINUSONE MINUSONE * A38A8
          'RROMPTR@ ROMPTR 0B4 01A BINT16 BINT35 BINT31 BINT9 BINT1 * A38DF
          { BINT0 } BINT4 # BF22 MINUSONE MINUSONE % 1E-4 MINUSONE 'RROMPTR@ * A3908
          ROMPTR 0B4 026 # 49 BINT35 BINT25 BINT9 BINT1 * A394F
          { BINT0 } 'RROMPTR@ ROMPTR 0B4 0E0 # BF23 MINUSONE MINUSONE BINT0 * A3978
          MINUSONE 'RROMPTR@ ROMPTR 0B4 027 # 6A BINT35 BINT6 BINT9 BINT32 * A39B0
          MINUSONE MINUSONE # BF24 MINUSONE MINUSONE FALSE MINUSONE BINT12 * A39E3
          BINT13 'RROMPTR@ ROMPTR 0B4 018 # BF0E ROMPTR 0B5 02A * A3A10
          ROMPTR 0B5 02C CHECKPVARS INCOMPDROP 4UNROLL3DROP OBJ_37B03 OVER * A3A3A
          1get(li)? ROT ROMPTR 0B5 032 4PICK 1get(li)? 5PICK ROMPTR 0B5 064 * A3A5E
          6ROLL ROMPTR 0B5 068 MINUSONE SWAP BINT0 BINT9 PICK MINUSONE EQUAL * A3A8D
          NOT BINT13 ROMPTR 0B0 0AA 'NOP         * A3AC0
          { LAM 'DE } BIND DoInputForm IT ROMPTR 0B4 1F8 * A3ADA
          ' LAM 'DE undo DROP ABND EVAL ;        * A3B0B

* ROMPTR 0B4 018
* refs (1): A2437
ROMP_0B4_018:
        ::                                       * A3B36
          { BINT14                               * A3B3B
            :: BINT13 ROMPTR 0B0 0C5 ITE BINT2 BINT1 * A3B45  ~gFldVal
            ;                                    * A3B69
            BINT16                               * A3B6E
            :: ROMPTR 0B4 019 TRUE ; BINT5 ROMPTR 0B4 01F } * A3B73
          EQLookup case                          * A3BA2
          :: EVAL TRUE ;                         * A3BAC
          DROPFALSE ;                            * A3BC0

* ROMPTR 0B4 019
* refs (1): A2437
ROMP_0B4_019:
        { NullMenuKey                            * A3BCA
          { $ "INIT+" ROMPTR 0B4 01D }           * A3BD4
          { $ "SOLVE" ROMPTR 0B4 01E } }         * A3BFD

* ROMPTR 0B4 01A
* refs (1): A2437
ROMP_0B4_01A:
        :: BINT8 #<>case FALSE                   * A3C2B
          ROMPTR 0B4 01B ;                       * A3C3F

* ROMPTR 0B4 01B
* refs (1): A2437
ROMP_0B4_01B:
        :: EditExstCase FALSE 2DUP Key>U/SKeyOb ' ROMPTR 0B4 045 EQUAL * A3C4F
          NOTcaseFALSE 2DROP                     * A3C7D
          ' ROMPTR 0B4 01C TrueTrue ;            * A3C87

* ROMPTR 0B4 01C
* refs (1): A2437
ROMP_0B4_01C:
        :: TakeOver ' ROMPTR 0B4 045 ' LAM 'DE STOLAM ROMPTR 0B0 0C8 * A3CA1  GetFieldVals
          ROMPTR 0B4 1F8 TRUE 11PUTLAM FALSE ;   * A3CDD

* ROMPTR 0B4 01D
* refs (1): A2437
ROMP_0B4_01D:
        :: TakeOver BINT10 ROMPTR 0B0 0C5 MINUSONE EQUAL caseDoBadKey BINT7 * A3CFC  ~gFldVal
          ROMPTR 0B0 0C5 BINT6                   * A3D2A  ~gFldVal
          ROMPTR 0B0 0D5 BINT10                  * A3D3A  ~sFldVal
          ROMPTR 0B0 0C5 BINT9                   * A3D4A  ~gFldVal
          ROMPTR 0B0 0D5 BINT6 ROMPTR 0B0 0A2 BINT9 ROMPTR 0B0 0A2 * A3D5A  ~sFldVal
          SetDA123NoCh ;                         * A3D85

* ROMPTR 0B4 01E
* refs (1): A2437
ROMP_0B4_01E:
        :: TakeOver ROMPTR 0B0 0C8 ROMPTR 0B4 1F8 * A3D8F  GetFieldVals
          ROMPTR 0B0 0C8 4ROLL DROP SWAP DUP BINT0 EQUAL IT OBJ_56B87 * A3DAF  GetFieldVals
          SWAP ITE                               * A3DE2
          :: BINT11 ROLL DROP ROMPTR 0B5 067 ;   * A3DEC
          :: 8ROLL DROP 8ROLL DROP 8ROLL DROP ROMPTR 0B5 066 ; * A3E10
          2DUP BINT10 ROMPTR 0B0 0D5 BINT10 ROMPTR 0B0 0A2 BINT11 * A3E43  ~sFldVal
          ROMPTR 0B0 0D5 BINT11 ROMPTR 0B0 0A2 SWAP # BF26 msg>TAG SWAP * A3E6D  ~sFldVal
          # BF27 msg>TAG AtUserStack SetDA123NoCh ; * A3EA1

* ROMPTR 0B4 01F
* refs (1): A2437
ROMP_0B4_01F:
        :: BINT39 BINT131 MAKEGROB BINT1 ROMPTR 0B0 012 15GETLAM #1+ * A3EBF
          ROMPTR 0B4 02A ITE BINT2 BINT4         * A3EED
          DO INDEX@ ROMPTR 0B0 012 LOOP FALSE ;  * A3F07

* ROMPTR 0B4 020
* refs (1): A2437
ROMP_0B4_020:
        :: BINT7 #=casedrop ROMPTR 0B4 02A       * A3F2B
          BINT55 OVER #<>case ROMPTR 0B4 022     * A3F45
          DROP ROMPTR 0B4 02A NOT TRUE ;         * A3F5F

* ROMPTR 0B4 021
* refs (1): A2437
ROMP_0B4_021:
        :: BINT7 #=casedrop                      * A3F7E
          :: ROMPTR 0B4 02A NOT ;                * A3F8D
          BINT55 OVER #<>case ROMPTR 0B4 022     * A3FA7
          DROP ROMPTR 0B4 02A TRUE ;             * A3FC1

* ROMPTR 0B4 022
* refs (1): A2437
ROMP_0B4_022:
        :: BINT43 OVER #<>case ROMPTR 0B4 01A    * A3FDB
          DROP ROMPTR 0B4 023 TrueTrue ;         * A3FFA

* ROMPTR 0B4 023
* refs (1): A2437
ROMP_0B4_023:
        ::                                       * A4014
          { NullMenuKey NullMenuKey } BINT8 ROMPTR 0B0 0C5 >HCOMP BINT5 * A4019  ~gFldVal
          ROMPTR 0B0 0C5 >HCOMP ;                * A4047  ~gFldVal

* ROMPTR 0B4 024
* refs (1): A2437
ROMP_0B4_024:
        :: BINT44 OVER #<>case ROMPTR 0B4 01A    * A405C
          DROP ROMPTR 0B4 025 TRUE ;             * A407B

* ROMPTR 0B4 025
* refs (1): A2437
ROMP_0B4_025:
        :: EDITPARTS BINT1 #> InitEd&Modes ROMPTR 0B0 0A7 ITE SetDA1NoCh * A4095
          :: SetDA1NoCh SetDA2aNoCh ;            * A40C3
        ;                                        * A40D7

* ROMPTR 0B4 026
* refs (1): A2437
ROMP_0B4_026:
        :: BINT41 OVER #<>case ROMPTR 0B4 01A    * A40DC
          DROP ROMPTR 0B4 02B TRUE ;             * A40FB

* ROMPTR 0B4 027
* refs (1): A2437
ROMP_0B4_027:
        :: BINT47 OVER #<>case ROMPTR 0B4 01A    * A4115
          DROP ROMPTR 0B4 028 ROMPTR 0B4 029 TRUE ; * A4134

* ROMPTR 0B4 028
* refs (1): A2437
ROMP_0B4_028:
        :: ROMPTR 0B4 02A DUP ITE BINT1 BINT2    * A4159
          ROMPTR 0B0 0C5 SWAP ITE BINT2 BINT1    * A417D  ~gFldVal
          ROMPTR 0B0 0D5 ;                       * A419C  ~sFldVal

* ROMPTR 0B4 029
* refs (1): A2437
ROMP_0B4_029:
        :: ROMPTR 0B4 02A ITE                    * A41AC
          :: BINT5 BINT2 BINT4 BINT1 ;           * A41C1
          :: BINT2 BINT1 2DUP ;                  * A41DF
          HARDBUFF 3UNROLL BINT8 BINT9 BLANKIT DO INDEX@ ROMPTR 0B0 012 LOOP * A41F8
          DROP DO INDEX@ ROMPTR 0B0 0A2 LOOP ;   * A422B

* ROMPTR 0B4 02A
* refs (1): A2437
ROMP_0B4_02A:
        :: BINT13 ROMPTR 0B0 0C5 ;               * A424F  ~gFldVal

* ROMPTR 0B4 02B
* refs (1): A2437
ROMP_0B4_02B:
        :: 4GETLAM ROMPTR 0B0 0C5 DUPTYPEBINT? NOTcase TRUE * A4269  ~gFldVal
          OBJ_56B87 TRUE ;                       * A428D

* ROMPTR 0B4 02C
* refs (1): A2437
ROMP_0B4_02C:
        :: # BF29 BINT1 BINT10 # BF2A BINT1 BINT28 'RROMPTR@ ROMPTR 0B4 031 * A429C
          BINT7 BINT17 # 79 BINT9 BINT1          * A42D9
          { BINT3 BINT4 } BINT4 # BF2B MINUSONE MINUSONE MINUSONE DUP * A42F7
          'RROMPTR@ ROMPTR 0B4 031 BINT7 BINT35 # 79 BINT9 BINT1 * A432E
          { BINT3 BINT4 } BINT4 # BF2C MINUSONE MINUSONE MINUSONE DUP BINT2 * A435C
          DUP 'RROMPTR@ ROMPTR 0B4 02D # BF28 DoInputForm case2DROP ; * A4398

* ROMPTR 0B4 02D
* refs (1): A2437
ROMP_0B4_02D:
        :: BINT16 #<>case FALSE                  * A43C6
          ROMPTR 0B4 02E TrueTrue ;              * A43DA

* ROMPTR 0B4 02E
* refs (1): A2437
ROMP_0B4_02E:
        { NullMenuKey                            * A43EF
          { $ "SYMB" ROMPTR 0B4 02F }            * A43F9
          { $ "SOLVE" ROMPTR 0B4 030 } }         * A4420

* ROMPTR 0B4 02F
* refs (1): A2437
ROMP_0B4_02F:
        :: TakeOver 5GETLAM #1= ITE              * A444E
          :: BINT1 ROMPTR 0B0 0C5 ROMPTR 0B5 007 ; * A4467  ~gFldVal
          :: BINT2 ROMPTR 0B0 0C5 ROMPTR 0B5 009 ; * A448C  ~gFldVal
          AtUserStack SetDA123NoCh ;             * A44B1

* ROMPTR 0B4 030
* refs (1): A2437
ROMP_0B4_030:
        :: TakeOver 5GETLAM #1= ITE              * A44C0
          :: BINT2 ROMPTR 0B0 0C5 ROMPTR 0B5 00A DUP BINT1 * A44D9  ~gFldVal
            ROMPTR 0B0 0D5 # BF2D ;              * A4503  ~sFldVal
          :: BINT1 ROMPTR 0B0 0C5 ROMPTR 0B5 00B DUP BINT2 * A451D  ~gFldVal
            ROMPTR 0B0 0D5 # BF2E ;              * A4547  ~sFldVal
          5GETLAM ROMPTR 0B0 0A2 msg>TAG AtUserStack SetDA123NoCh ; * A4561

* ROMPTR 0B4 031
* refs (1): A2437
ROMP_0B4_031:
        :: BINT23 #<>case FALSE                  * A4585
          ROMPTR 0B4 032 TRUE ;                  * A4599

* ROMPTR 0B4 032
* refs (1): A2437
ROMP_0B4_032:
        :: 4GETLAM ROMPTR 0B0 078 ROMPTR 0B5 00C NOT?SEMI * A45AE
          4GETLAM ROMPTR 0B0 0D5 ;               * A45D3  ~sFldVal

* ROMPTR 0B4 033
* refs (1): A2437
ROMP_0B4_033:
        :: # BF30 BINT1 BINT10 # BF31 BINT1 BINT19 # BF32 BINT1 BINT28 * A45E8
          'RROMPTR@ ROMPTR 0B4 037 BINT10 BINT8 BINT115 BINT9 BINT21 * A4629
          { BINT3 BINT4 } BINT4 # BF33 # BE1A MINUSONE MINUSONE DUP * A4652
          'RROMPTR@ ROMPTR 0B4 031 BINT10 BINT17 BINT115 BINT9 BINT21 * A468E
          { BINT3 BINT4 } BINT4 # BF34 # BE1A MINUSONE MINUSONE DUP * A46B7
          'RROMPTR@ ROMPTR 0B4 031 BINT10 BINT26 BINT115 BINT9 BINT21 * A46F3
          { BINT3 BINT4 } BINT4 # BF35 # BE1A MINUSONE MINUSONE DUP BINT3 * A471C
          DUP 'RROMPTR@ ROMPTR 0B4 034 # BF2F DoInputForm case 3DROP * A475D
        ;                                        * A478B

* ROMPTR 0B4 034
* refs (1): A2437
ROMP_0B4_034:
        :: BINT16 #<>case FALSE                  * A4790
          ROMPTR 0B4 035 TrueTrue ;              * A47A4

* ROMPTR 0B4 035
* refs (1): A2437
ROMP_0B4_035:
        { NullMenuKey NullMenuKey                * A47B9
          {                                      * A47C8
            :: TakeOver 5GETLAM #>1 ITE $ "SOLVE" NULL$ * A47CD
            ;                                    * A47FF
            ROMPTR 0B4 036 }                     * A4804
        }                                        * A4814

* ROMPTR 0B4 036
* refs (1): A2437
ROMP_0B4_036:
        :: TakeOver 5GETLAM DUP #1= casedrop DoBadKey * A4819
          BINT1 ROMPTR 0B0 0C5 SWAP #2= ITE      * A483C  ~gFldVal
          :: BINT3 ROMPTR 0B0 0C5 ROMPTR 0B5 00E DUP BINT2 * A485B  ~gFldVal
            ROMPTR 0B0 0D5 BINT2 ROMPTR 0B0 0A2 # BF36 ; * A4885  ~sFldVal
          :: BINT2 ROMPTR 0B0 0C5 ROMPTR 0B5 00D DUP BINT3 * A48AF  ~gFldVal
            ROMPTR 0B0 0D5 BINT3 ROMPTR 0B0 0A2 # BF37 ; * A48D9  ~sFldVal
          msg>TAG AtUserStack SetDA123NoCh ;     * A4903

* ROMPTR 0B4 037
* refs (1): A2437
ROMP_0B4_037:
        ::                                       * A4917
          { BINT20 SetDA3Bad BINT19 SetDA3Bad } EQLookup case * A491C
          :: EVAL TRUE ;                         * A4944
          ROMPTR 0B4 031 ;                       * A4958

* ROMPTR 0B4 038
* refs (1): A2437
ROMP_0B4_038:
        :: # BF38 BINT1 BINT10 # BF39 BINT61 BINT10 # BF3A BINT1 BINT19 * A4968
          # BF3B BINT1 BINT28 # BF3C # 58 BINT28 # BF3D BINT1 BINT37 * A49A9
          'DROPFALSE BINT19 BINT8 BINT25 BINT9 BINT1 * A49EA
          { BINT0 } BINT4 # BF3E MINUSONE MINUSONE %0_2A2B4 MINUSONE * A4A08
          'DROPFALSE BINT79 BINT8 BINT37 BINT9 BINT1 * A4A3A
          { BINT0 } BINT4 # BF3F MINUSONE MINUSONE %0_2A2B4 MINUSONE * A4A58
          'DROPFALSE BINT19 BINT17 BINT79 BINT9 BINT1 * A4A8A
          { BINT0 } 'RROMPTR@ ROMPTR 0B5 024 # BF40 MINUSONE MINUSONE * A4AA8
          %0_2A2B4 MINUSONE 'DROPFALSE BINT19 BINT26 BINT61 BINT9 BINT1 * A4ADB
          { BINT0 } 'RROMPTR@ ROMPTR 0B5 024 # BF41 MINUSONE MINUSONE * A4B03
          %0_2A2B4 MINUSONE 'RROMPTR@ ROMPTR 0B4 03E # 6D BINT26 BINT19 * A4B36
          BINT9 BINT1                            * A4B64
          { BINT0 } BINT4 # BF42 MINUSONE MINUSONE %12 MINUSONE 'DROPFALSE * A4B6E
          BINT19 BINT35 BINT79 BINT9 BINT1       * A4BA5
          { BINT0 } 'RROMPTR@ ROMPTR 0B5 024 # BF43 MINUSONE MINUSONE * A4BBE
          %0_2A2B4 MINUSONE 'DROPFALSE # 6D BINT35 BINT19 BINT9 BINT12 * A4BF1
          MINUSONE BINT33 # BF44 ROMPTR 0B5 025 BINT17 ROMPTR 0B5 027 * A4C1E
          MINUSONE BINT6 BINT7 'RROMPTR@ ROMPTR 0B4 03B # BF45 * A4C4D
          ROMPTR 0B4 039 BINT7 ROMPTR 0B0 0AA DoInputForm NOT?SEMI * A4C76
          ROMPTR 0B4 03A ;                       * A4C9B

* ROMPTR 0B4 039
* refs (1): A2437
ROMP_0B4_039:
        :: ROMPTR 0B5 00F ROMPTR 0B5 012 ROMPTR 0B5 014 ROMPTR 0B5 016 * A4CAB
          ROMPTR 0B5 01A ROMPTR 0B5 018 ROMPTR 0B5 01C ; * A4CDC

* ROMPTR 0B4 03A
* refs (1): A2437
ROMP_0B4_03A:
        :: ROMPTR 0B5 01D ROMPTR 0B5 019 ROMPTR 0B5 01B ROMPTR 0B5 017 * A4D02
          ROMPTR 0B5 015 ROMPTR 0B5 013 ROMPTR 0B5 010 ; * A4D33

* ROMPTR 0B4 03B
* refs (1): A2437
ROMP_0B4_03B:
        :: BINT16 #<>case FALSE                  * A4D59
          ROMPTR 0B4 03C TrueTrue ;              * A4D6D

* ROMPTR 0B4 03C
* refs (1): A2437
ROMP_0B4_03C:
        { NullMenuKey                            * A4D82
          {                                      * A4D8C
            :: PTR DirLabel: $ "AMOR" ;          * A4D91
            :: TakeOver ROMPTR 0B0 0C8 ROMPTR 0B4 03A ROMPTR 0B4 03F * A4DB2  GetFieldVals
              ROMPTR 0B5 014 BINT3 ROMPTR 0B0 0D5 ; * A4DDD  ~sFldVal
          }                                      * A4DFD
          {                                      * A4E02
            :: TakeOver 5GETLAM DUP BINT5 #< SWAP BINT6 #= OR ITE $ "SOLVE" * A4E07
              NULL$                              * A4E52
            ;                                    * A4E57
            ROMPTR 0B4 03D }                     * A4E5C
        }                                        * A4E6C

* ROMPTR 0B4 03D
* refs (1): A2437
ROMP_0B4_03D:
        :: TakeOver 5GETLAM DUP BINT5 #= SWAP BINT7 #= OR casedrop DoBadKey * A4E71
          ROMPTR 0B0 0C8 ROMPTR 0B4 03A          * A4EAD  GetFieldVals
          {                                      * A4EC3
            :: ROMPTR 0B5 01E # BF46 ;           * A4EC8
            :: ROMPTR 0B5 01F # BF47 ;           * A4EE7
            :: ROMPTR 0B5 020 # BF48 ;           * A4F06
            :: ROMPTR 0B5 021 # BF49 ; NOP       * A4F25
            :: ROMPTR 0B5 022 # BF4A ; }         * A4F49
          5GETLAM NTHCOMPDROP EVAL OVER 5GETLAM ROMPTR 0B0 0D5 5GETLAM * A4F6D  ~sFldVal
          ROMPTR 0B0 0A2 msg>TAG AtUserStack SetDA123NoCh ; * A4F96

* ROMPTR 0B4 03E
* refs (1): A2437
ROMP_0B4_03E:
        ::                                       * A4FB5
          { BINT20 SetDA3Bad BINT19 SetDA3Bad } EQLookup case * A4FBA
          :: EVAL TRUE ;                         * A4FE2
          DROPFALSE ;                            * A4FF6

* ROMPTR 0B4 03F
* refs (1): A2437
ROMP_0B4_03F:
        :: # BF4F BINT1 BINT10 # BF50 BINT1 BINT19 # BF51 BINT1 BINT28 * A5000
          # BF52 BINT1 BINT37 'DROPFALSE BINT43 BINT8 BINT25 BINT9 BINT1 * A5041
          { BINT0 } BINT4 # BF53 MINUSONE MINUSONE ROMPTR 0B5 01A DUP * A5073
          'RROMPTR@ ROMPTR 0B4 044 BINT43 BINT17 BINT79 BINT9 BINT1 * A50AB
          { BINT0 } 'RROMPTR@ ROMPTR 0B5 024 NULL$ MINUSONE MINUSONE * A50D4
          MINUSONE MINUSONE 'RROMPTR@ ROMPTR 0B4 044 BINT43 BINT26 BINT79 * A5102
          BINT9 BINT1                            * A512B
          { BINT0 } 'RROMPTR@ ROMPTR 0B5 024 NULL$ MINUSONE MINUSONE * A5135
          MINUSONE MINUSONE 'RROMPTR@ ROMPTR 0B4 044 BINT43 BINT35 BINT79 * A5163
          BINT9 BINT1                            * A518C
          { BINT0 } 'RROMPTR@ ROMPTR 0B5 024 NULL$ MINUSONE MINUSONE * A5196
          MINUSONE MINUSONE BINT4 DUP 'RROMPTR@ ROMPTR 0B4 040 # BF4E * A51C4
          DoInputForm case 4DROP                 * A51F2
        ;                                        * A5201

* ROMPTR 0B4 040
* refs (1): A2437
ROMP_0B4_040:
        :: BINT16 #<>case FALSE                  * A5206
          ROMPTR 0B4 041 TrueTrue ;              * A521A

* ROMPTR 0B4 041
* refs (1): A2437
ROMP_0B4_041:
        { NullMenuKey                            * A522F
          { $ "B→PV" ROMPTR 0B4 042 }            * A5239
          { $ "AMOR" ROMPTR 0B4 043 } }          * A5260

* ROMPTR 0B4 042
* refs (1): A2437
ROMP_0B4_042:
        :: TakeOver BINT4 ROMPTR 0B0 0C5 ROMPTR 0B5 015 SetDA123NoCh ; * A528C  ~gFldVal

* ROMPTR 0B4 043
* refs (1): A2437
ROMP_0B4_043:
        :: TakeOver BINT1 ROMPTR 0B0 0C5 ROMPTR 0B5 023 ROTDUP BINT2 * A52BB  ~gFldVal
          ROMPTR 0B0 0D5 BINT2 ROMPTR 0B0 0A2 # BF54 msg>TAG ROTDUP BINT3 * A52EA  ~sFldVal
          ROMPTR 0B0 0D5 BINT3 ROMPTR 0B0 0A2 # BF55 msg>TAG ROTDUP BINT4 * A531E  ~sFldVal
          ROMPTR 0B0 0D5 BINT4 ROMPTR 0B0 0A2 # BF56 msg>TAG AtUserStack * A5352  ~sFldVal
          SetDA123NoCh ;                         * A5381

* ROMPTR 0B4 044
* refs (1): A2437
ROMP_0B4_044:
        :: BINT44 #<>case FALSE                  * A538B
          ROMPTR 0B4 025 TRUE ;                  * A539F

* ROMPTR 0B4 045
* refs (1): A2437
ROMP_0B4_045:
        :: ROMPTR 0B0 0AB MINUSONE 'NOP FALSE MINUSONE * A53B4
          { LAM 'PE1 LAM 'PE2 LAM 'PE3 LAM 'PX } BIND BEGIN ROMPTR 0B4 046 * A53D8
          DoInputForm LAM 'PX #0<> IT            * A5431
          :: NOT?SEMI                            * A544D
            ROMPTR 0B4 048 2DROP ;               * A5457
          LAM 'PX #0= WHILE                      * A546C
          :: BINT1 ' LAM 'PX STOLAM ; REPEAT ' LAM 'PE2 undo DROP ABND EVAL ; * A5483
