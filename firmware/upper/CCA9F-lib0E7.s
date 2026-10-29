* HP 48GX ROM revision R, #CCA9F-#CF37F: Library part 0E7
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~UTVUNS1Arg ~UTTYPEEXT0?
* Follows on from the previous file (at #CCA9F in the original ROM).
        ENDLENGTH                                * CCA9F

        CON(5)  DOLIB                            * CCA9F  library object
        LENGTH                                   * CCAA4  length, to #CF380
        CON(2)  0                                * CCAA9  title length

LIB0E7:
        CON(3)  #0E7                             * CCAAB  library number
        REL(5)  LIB0E7.hash                      * CCAAE  hash table
        REL(5)  ROMP_0E7_014                     * CCAB3  message table
        REL(5)  LIB0E7.link                      * CCAB8  link table
        CON(5)  0                                * CCABD  config
        RPL

* ROMPTR 0E7 000
* refs (1): CCAAB
ZFACTOR~1:
        :: SWAP %1 UMCONV SWAP %1 UMCONV ROMPTR 0E7 001 ; * CCAC2

* ROMPTR 0E7 001
* refs (1): CCAAB
ROMP_0E7_001:
        :: OVER % 1.05E0 %< 3PICK %3 %>= ORcase ROMPTR 0E7 002 * CCAF5
          DUP %0> NOT OVER % 3E1 %>= ORcase ROMPTR 0E7 002 * CCB38
          % 6.4225133E-2 3PICK % 5.3530771E-1 %* % 6.1232032E-1 %- 4PICK DUP * CCB76
          %* 5PICK % 3.1506237E-1 %* % 1.0467099E0 %- % 5.7832729E-1 3PICK * CCBCE
          %/ %- % 6.8157001E-1 ROT %/ % 6.8446549E-1 6PICK % 2.7E-1 %* DUP * CCC26
          BINT9 PICK %/                          * CCC88
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM * CCC97
            NULLLAM }                            * CCCC4
          BIND BEGIN 1GETLAM DUP %* DUP 3GETLAM %* DUP %CHS %EXP OVER %1+ * CCCCE
          OVER %* 4GETLAM %* 6GETLAM %+ 1GETLAM %* 5GETLAM %+ 4PICK DUP %* * CCD0F
          7GETLAM %* %+ 1GETLAM %* 9GETLAM %+ 1GETLAM %* 2GETLAM %- 4UNROLL * CCD50
          %3 3PICK DUP %+ %- ROT %* %3 %+ %* 4GETLAM %* 6GETLAM %3 %* %+ %6 * CCD8C
          7GETLAM %* ROT %* 1GETLAM %* %+ 1GETLAM %* 5GETLAM DUP %+ %+ * CCDE1
          1GETLAM %* 9GETLAM %+ %/ DUP %ABS 1GETLAM %/ 1GETLAM ROT %- * CCE22
          1PUTLAM % 1E-10 %<= UNTIL 2GETLAM 9GETLAM %/ 1GETLAM %/ ABND ; * CCE5E

* ROMPTR 0E7 002
* refs (1): CCAAB
ROMP_0E7_002:
        :: # 304 ERRORSTO ERRJMP ;               * CCEA5

* ROMPTR 0E7 003
* refs (1): CCAAB
ROMP_0E7_003:
        :: SWAP %1 UMCONV SWAP %1 UMCONV ROMPTR 0E7 004 ; * CCEC3

* ROMPTR 0E7 004
* refs (1): CCAAB
ROMP_0E7_004:
        :: OVER %0< case ROMPTR 0E7 002          * CCEF6
          DUP %0< case ROMPTR 0E7 002            * CCF15
          DUP % 2.1E3 %<= ITE                    * CCF2F
          :: SWAPDROP % 1.6E1 SWAP %/ ;          * CCF53
          :: SWAP % 3.7E0 %/ % 1.2E1 3PICK %/ OVER %+ ROMPTR 0E7 005 * CCF81
            % -5.02E0 2DUP %* 5PICK %/ 4PICK %+ ROMPTR 0E7 005 DUPROT %* * CCFD9
            5ROLL %/ 4ROLL %+ ROMPTR 0E7 005 OVER 4PICK %= ITE 2DROP * CD021
            :: 3PICK ROT2DUP SWAP %- DUP %* 4UNROLLDUP %+ %- %+ %/ %- ; * CD059
            %1/ DUP %* % 1.6E1 %/ ;              * CD09F
        ;                                        * CD0CD

* ROMPTR 0E7 005
* refs (1): CCAAB
ROMP_0E7_005:
        :: DUP %0< case ROMPTR 0E7 002           * CD0D2
          %LOG ;                                 * CD0F1

* ROMPTR 0E7 006
* refs (1): CCAAB
TVMROOT~1~1:
        :: # 202 ERROROUT ;                      * CD0FB

* ROMPTR 0E7 007
* refs (1): CCAAB
ROMP_0E7_007:
        :: # 203 ERROROUT ;                      * CD114

* ROMPTR 0E7 008
* refs (1): CCAAB
DARCY~1:
        :: ROMPTR 0E7 003 %4 %* ;                * CD12D

* ROMPTR 0E7 009
* refs (1): CCAAB
DARCY~2:
        :: ROMPTR 0E7 004 %4 %* ;                * CD14C

* ROMPTR 0E7 00A
* refs (1): CCAAB
F0λ~1:
        :: SWAP                                  * CD16B
          UNIT %1 tok_m umEND ; UMCONV CARCOMP SWAP * CD175
          UNIT %1 $ "K" umEND ; UMCONV CARCOMP ROMPTR 0E7 00B ; * CD19D

* ROMPTR 0E7 00B
* refs (1): CCAAB
ROMP_0E7_00B:
        :: OVER %0< case ROMPTR 0E7 002          * CD1D7
          DUP %0< case ROMPTR 0E7 002            * CD1F6
          %* DUP %0= casedrop %0_2A2B4           * CD210
          % 1.438769E-2 SWAP %/ DUP %2 %< ITE    * CD229
          :: DUPDUP %* 2DUP DUP % -7.51563251563E-8 %* % 3.67430922986E-6 %+ * CD25C
            OVER %* % -1.98412698413E-4 %+ OVER %* % 1.66666666667E-2 %+ %* * CD2A9
            SWAP % -1.25E-1 %* %+ % 3.33333333333E-1 %+ 3UNROLL %* %* * CD2F6
            % 1.5398973382E-1 %* %1 SWAP %- ;    * CD343
          :: %0_2A2B4 SWAP %0_2A2B4 BEGIN %1+ DUP 3PICK %* DUP %3 %+ OVER %* * CD371
            %6 %+ OVER %* %6 %+ SWAP %CHS %EXP 3PICK DUP %* DUP %* %/ %* * CD3B7
            4PICK %+ 4ROLLOVER %<> WHILE         * CD407
            :: 3UNROLL ; REPEAT ROTROT2DROP % 1.5398973382E-1 %* ; * CD420
        ;                                        * CD458

* ROMPTR 0E7 00C
* refs (1): CCAAB
ROMP_0E7_00C:
        :: DUP %0_2A2B4 %<= IT ROMPTR 0E7 002    * CD45D
          DUP % 1.685E3 %>= IT ROMPTR 0E7 002    * CD481
          % 4.73E-4 OVER DUP %* %* OVER % 6.36E2 %+ %/ % 1.17E0 %- %2 %/ * CD4B0
          % 8.617386E-5 %/ OVER %/ %EXP % 7.2756517951E15 %* SWAP % 1.5E0 %^ * CD521
          %* ;                                   * CD583

* ROMPTR 0E7 00D
* refs (1): CCAAB
SIDENS~1:
        ::                                       * CD58D
          UNIT %1 $ "K" umEND ; UMCONV CARCOMP ROMPTR 0E7 00C * CD592
          UNIT %1 tok1 CHR_c tok_m umP %3 um^ um/ umEND ; SWAP Unbr>U ; * CD5C7

* ROMPTR 0E7 00E
* refs (1): CCAAB
TDELTA~1:
        :: SWAP DUPROT U>NCQ 4ROLL U>NCQ ROT 6UNROLL ROT puretemp? NOTcase * CD60D
          ROMPTR 0E7 010                         * CD644
          TempConv %%- %%>% Unbr>U ;             * CD64F

* ROMPTR 0E7 00F
* refs (1): CCAAB
TINC~1:
        :: SWAP DUPROT U>NCQ 4ROLL U>NCQ ROT 6UNROLL ROT puretemp? NOTcase * CD668
          ROMPTR 0E7 010                         * CD69F
          2DROP DUP cfC EQUAL SWAP %%1 EQUALOR ITE * CD6AA
          :: DUP cfC EQUAL SWAP %%1 EQUALOR ?SKIP * CD6D2
            :: cfF %%* ;                         * CD6FA
          ;                                      * CD70E
          :: DUP cfC EQUAL SWAP %%1 EQUALOR IT   * CD713
            :: cfF %%/ ;                         * CD73B
          ;                                      * CD74F
          %%+ %%>% Unbr>U ;                      * CD754

* ROMPTR 0E7 010
* refs (1): CCAAB
ROMP_0E7_010:
        :: # B02 ERROROUT ;                      * CD768

* ROMPTR 0E7 011
* refs (1): CCAAB
~UTVUNS1Arg:
        { ROMPTR 0E7 012 ROMPTR 0E7 013 }        * CD781

* ROMPTR 0E7 012
* refs (1): CCAAB
~UTVUNS1Arg~1:
        :: SWAPcompSWAP ;                        * CD7A1

* ROMPTR 0E7 013
* refs (1): CCAAB
~UTVUNS1Arg~2:
        :: DROPTRUE ;                            * CD7B0

* ROMPTR 0E7 014
* refs (1): CCAAB
ROMP_0E7_014:
        CON(5)  DOARRY                           * CD7BF  array 6
        LENGTH                                   * CD7C4  length, to #CD864
        CON(5)  DOCSTR                           * CD7C9  element type
        CON(5)  1                                * CD7CE  dimensions
        CON(5)  6                                * CD7D3
        $BODY   "NEAR "                          * CD7D8  1
        $BODY   " MINE  "                        * CD7E7  2
        $BODY   " MINES  "                       * CD7FA  3
        $BODY   "  SCORE: "                      * CD80F  4
        $BODY   "YOU MADE IT!!"                  * CD826  5
        $BODY   "YOU BLEW UP!!"                  * CD845  6
        ENDLENGTH                                * CD864

* ROMPTR 0E7 015
* refs (1): CCAAB
ZFACTOR~2:
        :: nscknum2 ROMPTR 0E7 02A ROMPTR 0AB 076 ; * CD864  ZFACTOR

* ROMPTR 0E7 016
* refs (1): CCAAB
ZFACTOR~3:
        :: sncknum2 ROMPTR 0E7 02B ROMPTR 0AB 076 ; * CD889  ZFACTOR

* ROMPTR 0E7 017
* refs (1): CCAAB
ZFACTOR~4:
        :: sscknum2 ROMPTR 0E7 02C ROMPTR 0AB 076 ; * CD8AE  ZFACTOR

* ROMPTR 0E7 018
* refs (1): CCAAB
FANNING~1:
        :: nscknum2 ROMPTR 0E7 02A ROMPTR 0AB 077 ; * CD8D3  FANNING

* ROMPTR 0E7 019
* refs (1): CCAAB
FANNING~2:
        :: sncknum2 ROMPTR 0E7 02B ROMPTR 0AB 077 ; * CD8F8  FANNING

* ROMPTR 0E7 01A
* refs (1): CCAAB
FANNING~3:
        :: sscknum2 ROMPTR 0E7 02C ROMPTR 0AB 077 ; * CD91D  FANNING

* ROMPTR 0E7 01B
* refs (1): CCAAB
DARCY~3:
        :: nscknum2 ROMPTR 0E7 02A ROMPTR 0AB 078 ; * CD942  DARCY

* ROMPTR 0E7 01C
* refs (1): CCAAB
DARCY~4:
        :: sncknum2 ROMPTR 0E7 02B ROMPTR 0AB 078 ; * CD967  DARCY

* ROMPTR 0E7 01D
* refs (1): CCAAB
DARCY~5:
        :: sscknum2 ROMPTR 0E7 02C ROMPTR 0AB 078 ; * CD98C  DARCY

* ROMPTR 0E7 01E
* refs (1): CCAAB
F0λ~2:
        :: nscknum2 ROMPTR 0E7 02A ROMPTR 0AB 079 ; * CD9B1  F0λ

* ROMPTR 0E7 01F
* refs (1): CCAAB
F0λ~3:
        :: sncknum2 ROMPTR 0E7 02B ROMPTR 0AB 079 ; * CD9D6  F0λ

* ROMPTR 0E7 020
* refs (1): CCAAB
F0λ~4:
        :: sscknum2 ROMPTR 0E7 02C ROMPTR 0AB 079 ; * CD9FB  F0λ

* ROMPTR 0E7 021
* refs (1): CCAAB
TDELTA~2:
        :: nscknum2 ROMPTR 0E7 02A ROMPTR 0AB 07B ; * CDA20  TDELTA

* ROMPTR 0E7 022
* refs (1): CCAAB
TDELTA~3:
        :: sncknum2 ROMPTR 0E7 02B ROMPTR 0AB 07B ; * CDA45  TDELTA

* ROMPTR 0E7 023
* refs (1): CCAAB
TDELTA~4:
        :: sscknum2 ROMPTR 0E7 02C ROMPTR 0AB 07B ; * CDA6A  TDELTA

* ROMPTR 0E7 024
* refs (1): CCAAB
TINC~2:
        :: nscknum2 ROMPTR 0E7 02A ROMPTR 0AB 07C ; * CDA8F  TINC

* ROMPTR 0E7 025
* refs (1): CCAAB
TINC~3:
        :: sncknum2 ROMPTR 0E7 02B ROMPTR 0AB 07C ; * CDAB4  TINC

* ROMPTR 0E7 026
* refs (1): CCAAB
TINC~4:
        :: sscknum2 ROMPTR 0E7 02C ROMPTR 0AB 07C ; * CDAD9  TINC

* ROMPTR 0E7 027
* refs (1): CCAAB
SIDENS~2:
        :: cknumdsptch1 ROMPTR 0E7 028 ROMPTR 0AB 07A ; * CDAFE  SIDENS

* ROMPTR 0E7 029
* refs (2): CCAAB CCAAB
ROMP_0E7_029:
        :: 1GETLAM symcomp BINT1 ' xFCNAPPLY 4ROLL #3+ ; * CDB23

* ROMPTR 0E7 02A
* refs (1): CCAAB
ROMP_0E7_02A:
        :: 3GETLAM BINT1 pshtop& ROMPTR 0E7 02D ; * CDB50

* ROMPTR 0E7 02B
* refs (1): CCAAB
ROMP_0E7_02B:
        :: 3GETLAM BINT1 top& ROMPTR 0E7 02D ;   * CDB74

* ROMPTR 0E7 02C
* refs (1): CCAAB
ROMP_0E7_02C:
        :: top& ROMPTR 0E7 02D ;                 * CDB98

* ROMPTR 0E7 02D
* refs (1): CCAAB
ROMP_0E7_02D:
        :: 1GETLAM symcomp BINT2 ' xFCNAPPLY 4ROLL #3+ ; * CDBB2

* ROMPTR 0E7 02E
* refs (1): CCAAB
ROMP_0E7_02E:
        :: ' LAM 'MF1 STO ;                      * CDBDF

* ROMPTR 0E7 02F
* refs (1): CCAAB
ROMP_0E7_02F:
        :: ' LAM 'MF2 STO ;                      * CDC02

* ROMPTR 0E7 030
* refs (1): CCAAB
ROMP_0E7_030:
        :: ' LAM 'MF3 STO ;                      * CDC25

* ROMPTR 0E7 031
* refs (1): CCAAB
ROMP_0E7_031:
        :: ' LAM 'MF4 STO ;                      * CDC48

* ROMPTR 0E7 032
* refs (1): CCAAB
ROMP_0E7_032:
        :: ' LAM 'MF5 STO ;                      * CDC6B

* ROMPTR 0E7 033
* refs (1): CCAAB
MINEHUNT~1:
        :: UnLockAlpha RECLAIMDISP POLSaveUI ERRSET * CDC8E
          :: ClrDA1IsStat BINT0                  * CDCA7
            $ "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" * CDCB6
            TOTEMPOB ONEONE FALSE                * CDDC0
            {                                    * CDDCF

* ROMPTR 0E7 034
* refs (1): CCAAB
ROMP_0E7_034:
              LAM 'MF5                           * CDDD4

* ROMPTR 0E7 035
* refs (1): CCAAB
ROMP_0E7_035:
              LAM 'MF4                           * CDDE3

* ROMPTR 0E7 036
* refs (1): CCAAB
ROMP_0E7_036:
              LAM 'MF3                           * CDDF2

* ROMPTR 0E7 037
* refs (1): CCAAB
ROMP_0E7_037:
              LAM 'MF2                           * CDE01

* ROMPTR 0E7 038
* refs (1): CCAAB
ROMP_0E7_038:
              LAM 'MF1 }                         * CDE10
            BIND ROMPTR 0E7 057 ITE              * CDE24
            :: INCOMPDROP ROMPTR 0E7 031 ROMPTR 0E7 032 ROMPTR 0E7 030 * CDE39
              ROMPTR 0E7 02F HARDBUFF ZEROZERO TURNMENUOFF GROB! ; * CDE64
            :: BINT0 BINT1                       * CDE88

* ROMPTR 0E7 039
* refs (1): CCAAB
ROMP_0E7_039:
              PCGROB  "images/CDE97-packed.png"  * CDE97  16 x 63, packed
              ROMPTR 0E3 063 XYGROBDISP # 78 BINT1 * CDF81  ~PCunpack

* ROMPTR 0E7 03A
* refs (1): CCAAB
ROMP_0E7_03A:
              PCGROB  "images/CDFA0-packed.png"  * CDFA0  16 x 63, packed
              ROMPTR 0E3 063 XYGROBDISP TURNMENUOFF BINT10 ONE_DO BINT9 * CE093  ~PCunpack
              INDEX@ BINT1 #- BINT7 #* BINT7 #+ # 78 OVER LINEON LOOP BINT18 * CE0B7
              ONE_DO INDEX@ #1- BINT7 #* BINT9 #+ BINT7 OVER BINT63 LINEON * CE0F8
              LOOP ROMPTR 0E7 053 HARDBUFF BINT115 BINT57 GROB! CLKTICKS * CE12F
              HXS># UNCOERCE DORANDOMIZE ROMPTR 0E7 035 ' ID Nmines SAFE@ * CE158
              ITE                                * CE18F
              :: DUPTYPEREAL? ITE                * CE194
                :: %ABS COERCE DUP # 40 #> IT    * CE1A3
                  :: DROP # 40 ;                 * CE1CB
                ;                                * CE1E4
                :: DROP BINT20 ;                 * CE1E9
              ;                                  * CE1FD
              BINT20                             * CE202
              #1+_ONE_DO BEGIN %RAN % 1.24E2 %* COERCE #2+ 2DUP SUB$1# * CE207
              BINT48 #<> WHILE                   * CE244
              :: DROP ; REPEAT BINT49 ROMPTR 0E7 051 LOOP ROMPTR 0E7 031 ' * CE253
              ID Nmines SAFE@ NOT ?SEMI          * CE28C
              DUPTYPEREAL? ITE                   * CE2AE
              :: % 0E0 %< IT ROMPTR 0E7 03D      * CE2B8
              ;                                  * CE2E7
              DROP                               * CE2EC
            ;                                    * CE2F1
            ROMPTR 0E7 041 ' ROMPTR 0E7 03E RESOROMP ROMPTR 0E7 044 TrueTrue * CE2F6
            FALSE ZEROFALSE ' LAM 'MF1 'ERRJMP POLSetUI POLKeyUI ABND ; * CE326
          ERRTRAP POLResUI&Err POLRestoreUI ;    * CE35D

* ROMPTR 0E7 03B
* refs (1): CCAAB
ROMP_0E7_03B:
        :: # E705 JstGetTHEMESG ROMPTR 0E7 043 BINT16 BINT8 ROMPTR 0E7 03F * CE371
          ROMPTR 0E7 055 XYGROBDISP ROMPTR 0E7 03D SetDAsTemp ROMPTR 0E7 04E ; * CE3A5

* ROMPTR 0E7 03C
* refs (1): CCAAB
ROMP_0E7_03C:
        :: # E706 JstGetTHEMESG ROMPTR 0E7 043 ROMPTR 0E7 03F ROMPTR 0E7 054 * CE3D5
          XYGROBDISP ROMPTR 0E7 03D SetDAsTemp ROMPTR 0E7 04E ; * CE40A

* ROMPTR 0E7 03D
* refs (1): CCAAB
ROMP_0E7_03D:
        :: BINT9 ONE_DO BINT17 ONE_DO INDEX@ JINDEX@ 2DUP ROMPTR 0E7 04F * CE42F
          BINT49 #=ITE                           * CE462
          :: HARDBUFF 3UNROLL ROMPTR 0E7 052 4UNROLL ROMPTR 0E7 03F GROB! ; * CE46C
          2DROP LOOP LOOP ;                      * CE4A0

* ROMPTR 0E7 03E
* refs (1): CCAAB
MINEHUNT~1~1:
        :: ROMPTR 0E7 037 ROMPTR 0E7 036 BINT0 3UNROLL DUPDUP BINT8 #<> IT * CE4B4
          #1+                                    * CE4ED
          #1+ SWAPDUP #1<> IT #1-                * CE4F2
          ROTDUP DUP BINT16 #<> IT #1+           * CE50B
          #1+ SWAPDUP #1<> IT #1-                * CE529
          DO ROT 3PICK3PICK DO JINDEX@ INDEX@ ROMPTR 0E7 04F BINT49 #= IT * CE542
          #1+                                    * CE57A
          LOOP 3UNROLL LOOP 2DROP # E701 JstGetTHEMESG SWAP DUP #1= ITE * CE57F
          # E702 # E703                          * CE5B6
          JstGetTHEMESG SWAP #>$ SWAP &$ &$ ROMPTR 0E7 043 ; * CE5CA

* ROMPTR 0E7 03F
* refs (1): CCAAB
ROMP_0E7_03F:
        :: BINT1 #- BINT7 #* #8+ SWAPONE #- BINT7 #* #10+ SWAP ; * CE5F8

* ROMPTR 0E7 040
* refs (1): CCAAB
ROMP_0E7_040:
        :: ROMPTR 0E7 037 ROMPTR 0E7 036 ROMPTR 0E7 03F BINT6 BINT6 MAKEGROB * CE639
          INVGROB XYGROBDISP ;                   * CE66E

* ROMPTR 0E7 041
* refs (1): CCAAB
ROMP_0E7_041:
        :: ROMPTR 0E7 037 ROMPTR 0E7 036 2DUP ROMPTR 0E7 04F DUP BINT49 #= * CE67D
          casedrop                               * CE6B7
          :: 2DUP BINT51 ROMPTR 0E7 050 ROMPTR 0E7 03C ; * CE6BC
          BINT48 #= IT                           * CE6E6
          :: ROMPTR 0E7 042 2DUP BINT50 ROMPTR 0E7 050 ; * CE6F5
          2DUP HARDBUFF 3UNROLL ROMPTR 0E7 052 TOTEMPOB INVGROB 4UNROLL * CE71F
          ROMPTR 0E7 03F GROB! BINT8 #= SWAP BINT16 #= ANDcase * CE748
          ROMPTR 0E7 03B                         * CE776
        ;                                        * CE781

* ROMPTR 0E7 042
* refs (1): CCAAB
ROMP_0E7_042:
        :: ROMPTR 0E7 034 #1+ ROMPTR 0E7 032 ;   * CE786

* ROMPTR 0E7 043
* refs (1): CCAAB
ROMP_0E7_043:
        :: # E704 JstGetTHEMESG ROMPTR 0E7 034 #>$ &$ &$ $>grob DUPGROBDIM * CE7AB
          SWAPDROP DUP # 6D #> IT                * CE7E3
          :: DROP ZEROZERO # 6D BINT6 SUBGROB # 6D ; * CE801
          # 6D SWAP#- #2/ BINT11 #+ BINT0 ROT BINT6 # 6D MAKEGROB HARDBUFF * CE833
          BINT11 BINT0 GROB! XYGROBDISP ;        * CE874

* ROMPTR 0E7 044
* refs (1): CCAAB
MINEHUNT~1~2:
        :: BINT1 #=casedrop                      * CE88D
          :: BINT11 ?CaseRomptr@ ROMPTR 0E7 046 BINT32 ?CaseRomptr@ * CE89C
            ROMPTR 0E7 046 BINT16 ?CaseRomptr@ ROMPTR 0E7 047 BINT36 * CE8C0
            ?CaseRomptr@ ROMPTR 0E7 047 BINT17 ?CaseRomptr@ ROMPTR 0E7 048 * CE8E5
            BINT42 ?CaseRomptr@ ROMPTR 0E7 048 BINT18 ?CaseRomptr@ * CE90A
            ROMPTR 0E7 04D BINT38 ?CaseRomptr@ ROMPTR 0E7 04D BINT31 * CE929
            ?CaseRomptr@ ROMPTR 0E7 049 BINT33 ?CaseRomptr@ ROMPTR 0E7 04A * CE94E
            BINT41 ?CaseRomptr@ ROMPTR 0E7 04B BINT43 ?CaseRomptr@ * CE973
            ROMPTR 0E7 04C BINT14 ?CaseRomptr@ ROMPTR 0E7 056 BINT35 * CE992
            #=casedrpfls BINT40                  * CE9B7
            #=casedrpfls BINT45                  * CE9C1
            ?CaseRomptr@ ROMPTR 0E7 045 DROP 'DoBadKeyT ; * CE9CB
          BINT3 #=casedrop                       * CE9EA
          :: BINT45 #=casedrpfls DROP            * CE9F4
            'DoBadKeyT ;                         * CEA08
          2DROP 'DoBadKeyT ;                     * CEA12

* ROMPTR 0E7 045
* refs (1): CCAAB
MINEHUNT~1~2~1:
        :: TakeOver ClrDAsOK ROMPTR 0E7 04E ;    * CEA21

* ROMPTR 0E7 046
* refs (1): CCAAB
MINEHUNT~1~2~2:
        :: TakeOver ROMPTR 0E7 040 ROMPTR 0E7 036 #1- DUP#0= ITE * CEA40
          :: DROP DoBadKey ; ROMPTR 0E7 030      * CEA6F
          ROMPTR 0E7 041 ;                       * CEA8E

* ROMPTR 0E7 047
* refs (1): CCAAB
MINEHUNT~1~2~3:
        :: TakeOver ROMPTR 0E7 040 ROMPTR 0E7 037 #1- DUP#0= ITE * CEA9E
          :: DROP DoBadKey ; ROMPTR 0E7 02F      * CEACD
          ROMPTR 0E7 041 ;                       * CEAEC

* ROMPTR 0E7 048
* refs (1): CCAAB
MINEHUNT~1~2~4:
        :: TakeOver ROMPTR 0E7 040 ROMPTR 0E7 036 #1+DUP BINT9 #=ITE * CEAFC
          :: DROP DoBadKey ; ROMPTR 0E7 030 ROMPTR 0E7 041 ; * CEB2B

* ROMPTR 0E7 049
* refs (1): CCAAB
MINEHUNT~1~2~5:
        :: TakeOver ROMPTR 0E7 037 DUP #1= casedrop DoBadKey * CEB5A
          ROMPTR 0E7 036 DUP #1= case2drop DoBadKey * CEB83
          ROMPTR 0E7 040 #1- ROMPTR 0E7 030 #1- ROMPTR 0E7 02F * CEBA2
          ROMPTR 0E7 041 ;                       * CEBCD

* ROMPTR 0E7 04A
* refs (1): CCAAB
MINEHUNT~1~2~6:
        :: TakeOver ROMPTR 0E7 037 DUP BINT16 #= casedrop DoBadKey * CEBDD
          ROMPTR 0E7 036 DUP #1= case2drop DoBadKey * CEC0B
          ROMPTR 0E7 040 #1- ROMPTR 0E7 030 #1+ ROMPTR 0E7 02F * CEC2A
          ROMPTR 0E7 041 ;                       * CEC55

* ROMPTR 0E7 04B
* refs (1): CCAAB
MINEHUNT~1~2~7:
        :: TakeOver ROMPTR 0E7 037 DUP #1= casedrop DoBadKey * CEC65
          ROMPTR 0E7 036 DUP BINT8 #= case2drop DoBadKey * CEC8E
          ROMPTR 0E7 040 #1+ ROMPTR 0E7 030 #1- ROMPTR 0E7 02F * CECB2
          ROMPTR 0E7 041 ;                       * CECDD

* ROMPTR 0E7 04C
* refs (1): CCAAB
MINEHUNT~1~2~8:
        :: TakeOver ROMPTR 0E7 037 DUP BINT16 #= casedrop DoBadKey * CECED
          ROMPTR 0E7 036 DUP BINT8 #= case2drop DoBadKey * CED1B
          ROMPTR 0E7 040 #1+ ROMPTR 0E7 030 #1+ ROMPTR 0E7 02F * CED3F
          ROMPTR 0E7 041 ;                       * CED6A

* ROMPTR 0E7 04D
* refs (1): CCAAB
MINEHUNT~1~2~9:
        :: TakeOver ROMPTR 0E7 040 ROMPTR 0E7 037 #1+ DUP BINT17 #=ITE * CED7A
          :: DROP DoBadKey ; ROMPTR 0E7 02F ROMPTR 0E7 041 ; * CEDAE

* ROMPTR 0E7 04E
* refs (1): CCAAB
ROMP_0E7_04E:
        :: TakeOver TRUE ROMPTR 0E7 02E ;        * CEDDD

* ROMPTR 0E7 04F
* refs (1): CCAAB
ROMP_0E7_04F:
        :: #1- BINT16 #* #+ ROMPTR 0E7 035 SWAP SUB$1# ; * CEDFC

* ROMPTR 0E7 050
* refs (1): CCAAB
ROMP_0E7_050:
        :: 3UNROLL #1- BINT16 #* #+ ROMPTR 0E7 035 SWAPROT ROMPTR 0E7 051 * CEE2F
          ROMPTR 0E7 031 ;                       * CEE68

* ROMPTR 0E7 051
* refs (1): CCAAB
ROMP_0E7_051:
        CODE                                     * CEE78  72 nibbles
          GOSBVL  POP#                           * CEE82
          R0=A                                   * CEE89
          GOSBVL  POP#                           * CEE8C
          R1=A                                   * CEE93
          GOSBVL  SAVPTR                         * CEE96
          A=DAT1  A                              * CEE9D
          LC(5)   #00008                         * CEEA0
          A=A+C   A                              * CEEA7
          C=R1                                   * CEEA9
          A=A+C   A                              * CEEAC
          A=A+C   A                              * CEEAE
          D1=A                                   * CEEB0
          C=R0                                   * CEEB3
          DAT1=C  B                              * CEEB6
          GOSBVL  GETPTR                         * CEEB9
          A=DAT0  A                              * CEEC0
          D0=D0+  5                              * CEEC3
          PC=(A)                                 * CEEC6
        ENDCODE                                  * CEECA

* ROMPTR 0E7 052
* refs (1): CCAAB
ROMP_0E7_052:
        GROB    "images/CEECA.png"               * CEECA  6 x 6

* ROMPTR 0E7 053
* refs (1): CCAAB
MINEHUNT~1~3:
        GROB    "images/CEEEA.png"               * CEEEA  6 x 6

* ROMPTR 0E7 054
* refs (1): CCAAB
ROMP_0E7_054:
        GROB    "images/CEF0A.png"               * CEF0A  6 x 6

* ROMPTR 0E7 055
* refs (1): CCAAB
ROMP_0E7_055:
        GROB    "images/CEF2A.png"               * CEF2A  6 x 6

* ROMPTR 0E7 056
* refs (1): CCAAB
MINEHUNT~1~2~10:
        :: HARDBUFF ROMPTR 0E7 037 ROMPTR 0E7 036 ROMPTR 0E7 034 * CEF4A
          ROMPTR 0E7 035 BINT5 {}N # E7 SWAP TWO{}N DUP OSIZE * CEF75
          CODE                                   * CEFA8  71 nibbles
            GOSBVL  POP#                         * CEFB2
            R1=A.F  A                            * CEFB9
            GOSBVL  SAVPTR                       * CEFBF
            A=DAT1  A                            * CEFC6
            D1=A                                 * CEFC9
            LC(5)   DOEXT0                       * CEFCC
            DAT1=C  A                            * CEFD3
            D1=D1+  5                            * CEFD6
            C=R1.F  A                            * CEFD9
            C=C-CON A,5                          * CEFDF
            DAT1=C  A                            * CEFE5
            GOSBVL  GETPTR                       * CEFE8
            A=DAT0  A                            * CEFEF
            D0=D0+  5                            * CEFF2
            PC=(A)                               * CEFF5
          ENDCODE                                * CEFF9
          ' ID MHpar XEQSTOID ROMPTR 0E7 04E ClrDAsOK ; * CEFF9

* ROMPTR 0E7 057
* refs (1): CCAAB
MINEHUNT~1~4:
        :: ' ID MHpar SAFE@ DUP casedrop         * CF029
          :: TOTEMPOB DUP ROMPTR 0E7 058 NOTcasedrop FALSE * CF053  ~UTTYPEEXT0?
            CODE                                 * CF077  64 nibbles
              C=DAT1  A                          * CF081
              CD1EX                              * CF084
              RSTK=C                             * CF087
              D1=D1+  10                         * CF089
              A=DAT1  A                          * CF08C
              LC(5)   #000E7                     * CF08F
              ?C#A    A                          * CF096
              GOYES   L_CF0B5                    * CF099
              D1=D1-  10                         * CF09B
              LC(5)   DOLIST                     * CF09E
              DAT1=C  A                          * CF0A5
              D1=D1+  5                          * CF0A8
              LC(5)   DOBINT                     * CF0AB
              DAT1=C  A                          * CF0B2
L_CF0B5:
              C=RSTK                             * CF0B5
              D1=C                               * CF0B7
              GOVLNG  PushF/TLoop                * CF0BA
            ENDCODE                              * CF0C1
            NOTcasedrop FALSE                    * CF0C1
            INCOMPDROP SWAPDROP TRUE ' ID MHpar PURGE ; * CF0CB
        ;                                        * CF0FA

* ROMPTR 0E7 058
* refs (1): CCAAB
~UTTYPEEXT0?:
        CODE                                     * CF0FF  72 nibbles
          LC(5)   DOEXT0                         * CF109
          RSTK=C                                 * CF110
          C=DAT1  A                              * CF112
          CD1EX                                  * CF115
          A=DAT1  A                              * CF118
          D1=C                                   * CF11B
          C=RSTK                                 * CF11E
          ?C=A    A                              * CF120
          GOYES   L_CF13B                        * CF123
          P=      0                              * CF125
          LC(5)   FALSE                          * CF127
          DAT1=C  A                              * CF12E
          A=DAT0  A                              * CF131
          D0=D0+  5                              * CF134
          PC=(A)                                 * CF137
L_CF13B:
          P=      0                              * CF13B
          LC(5)   TRUE                           * CF13D
          DAT1=C  A                              * CF144
          A=DAT0  A                              * CF147
          D0=D0+  5                              * CF14A
          PC=(A)                                 * CF14D
        ENDCODE                                  * CF151

LIB0E7.hash:
        CON(5)  DOHSTR                           * CF151  hash table of library 0E7
        LENGTH                                   * CF156  length, to #CF1B5
        CON(5)  0                                * CF15B  names of length 1
        CON(5)  0                                * CF160  names of length 2
        CON(5)  0                                * CF165  names of length 3
        CON(5)  0                                * CF16A  names of length 4
        CON(5)  0                                * CF16F  names of length 5
        CON(5)  0                                * CF174  names of length 6
        CON(5)  0                                * CF179  names of length 7
        CON(5)  0                                * CF17E  names of length 8
        CON(5)  0                                * CF183  names of length 9
        CON(5)  0                                * CF188  names of length 10
        CON(5)  0                                * CF18D  names of length 11
        CON(5)  0                                * CF192  names of length 12
        CON(5)  0                                * CF197  names of length 13
        CON(5)  0                                * CF19C  names of length 14
        CON(5)  0                                * CF1A1  names of length 15
        CON(5)  0                                * CF1A6  names of length 16
        REL(5)  L_CF1B0                          * CF1AB  end of the names
L_CF1B0:
        CON(5)  0                                * CF1B0  command 000 has no name
        ENDLENGTH                                * CF1B5

LIB0E7.link:
        CON(5)  DOHSTR                           * CF1B5  link table of library 0E7
        LENGTH                                   * CF1BA  length, to #CF37C
        REL(5)  ZFACTOR~1                        * CF1BF  000 
        REL(5)  ROMP_0E7_001                     * CF1C4  001 
        REL(5)  ROMP_0E7_002                     * CF1C9  002 
        REL(5)  ROMP_0E7_003                     * CF1CE  003 
        REL(5)  ROMP_0E7_004                     * CF1D3  004 
        REL(5)  ROMP_0E7_005                     * CF1D8  005 
        REL(5)  TVMROOT~1~1                      * CF1DD  006 
        REL(5)  ROMP_0E7_007                     * CF1E2  007 
        REL(5)  DARCY~1                          * CF1E7  008 
        REL(5)  DARCY~2                          * CF1EC  009 
        REL(5)  F0λ~1                            * CF1F1  00A 
        REL(5)  ROMP_0E7_00B                     * CF1F6  00B 
        REL(5)  ROMP_0E7_00C                     * CF1FB  00C 
        REL(5)  SIDENS~1                         * CF200  00D 
        REL(5)  TDELTA~1                         * CF205  00E 
        REL(5)  TINC~1                           * CF20A  00F 
        REL(5)  ROMP_0E7_010                     * CF20F  010 
        REL(5)  ~UTVUNS1Arg                      * CF214  011 ~UTVUNS1Arg
        REL(5)  ~UTVUNS1Arg~1                    * CF219  012 
        REL(5)  ~UTVUNS1Arg~2                    * CF21E  013 
        REL(5)  ROMP_0E7_014                     * CF223  014 
        REL(5)  ZFACTOR~2                        * CF228  015 
        REL(5)  ZFACTOR~3                        * CF22D  016 
        REL(5)  ZFACTOR~4                        * CF232  017 
        REL(5)  FANNING~1                        * CF237  018 
        REL(5)  FANNING~2                        * CF23C  019 
        REL(5)  FANNING~3                        * CF241  01A 
        REL(5)  DARCY~3                          * CF246  01B 
        REL(5)  DARCY~4                          * CF24B  01C 
        REL(5)  DARCY~5                          * CF250  01D 
        REL(5)  F0λ~2                            * CF255  01E 
        REL(5)  F0λ~3                            * CF25A  01F 
        REL(5)  F0λ~4                            * CF25F  020 
        REL(5)  TDELTA~2                         * CF264  021 
        REL(5)  TDELTA~3                         * CF269  022 
        REL(5)  TDELTA~4                         * CF26E  023 
        REL(5)  TINC~2                           * CF273  024 
        REL(5)  TINC~3                           * CF278  025 
        REL(5)  TINC~4                           * CF27D  026 
        REL(5)  SIDENS~2                         * CF282  027 
        REL(5)  ROMP_0E7_029                     * CF287  028 
        REL(5)  ROMP_0E7_029                     * CF28C  029 
        REL(5)  ROMP_0E7_02A                     * CF291  02A 
        REL(5)  ROMP_0E7_02B                     * CF296  02B 
        REL(5)  ROMP_0E7_02C                     * CF29B  02C 
        REL(5)  ROMP_0E7_02D                     * CF2A0  02D 
        REL(5)  ROMP_0E7_02E                     * CF2A5  02E 
        REL(5)  ROMP_0E7_02F                     * CF2AA  02F 
        REL(5)  ROMP_0E7_030                     * CF2AF  030 
        REL(5)  ROMP_0E7_031                     * CF2B4  031 
        REL(5)  ROMP_0E7_032                     * CF2B9  032 
        REL(5)  MINEHUNT~1                       * CF2BE  033 
        REL(5)  ROMP_0E7_034                     * CF2C3  034 
        REL(5)  ROMP_0E7_035                     * CF2C8  035 
        REL(5)  ROMP_0E7_036                     * CF2CD  036 
        REL(5)  ROMP_0E7_037                     * CF2D2  037 
        REL(5)  ROMP_0E7_038                     * CF2D7  038 
        REL(5)  ROMP_0E7_039                     * CF2DC  039 
        REL(5)  ROMP_0E7_03A                     * CF2E1  03A 
        REL(5)  ROMP_0E7_03B                     * CF2E6  03B 
        REL(5)  ROMP_0E7_03C                     * CF2EB  03C 
        REL(5)  ROMP_0E7_03D                     * CF2F0  03D 
        REL(5)  MINEHUNT~1~1                     * CF2F5  03E 
        REL(5)  ROMP_0E7_03F                     * CF2FA  03F 
        REL(5)  ROMP_0E7_040                     * CF2FF  040 
        REL(5)  ROMP_0E7_041                     * CF304  041 
        REL(5)  ROMP_0E7_042                     * CF309  042 
        REL(5)  ROMP_0E7_043                     * CF30E  043 
        REL(5)  MINEHUNT~1~2                     * CF313  044 
        REL(5)  MINEHUNT~1~2~1                   * CF318  045 
        REL(5)  MINEHUNT~1~2~2                   * CF31D  046 
        REL(5)  MINEHUNT~1~2~3                   * CF322  047 
        REL(5)  MINEHUNT~1~2~4                   * CF327  048 
        REL(5)  MINEHUNT~1~2~5                   * CF32C  049 
        REL(5)  MINEHUNT~1~2~6                   * CF331  04A 
        REL(5)  MINEHUNT~1~2~7                   * CF336  04B 
        REL(5)  MINEHUNT~1~2~8                   * CF33B  04C 
        REL(5)  MINEHUNT~1~2~9                   * CF340  04D 
        REL(5)  ROMP_0E7_04E                     * CF345  04E 
        REL(5)  ROMP_0E7_04F                     * CF34A  04F 
        REL(5)  ROMP_0E7_050                     * CF34F  050 
        REL(5)  ROMP_0E7_051                     * CF354  051 
        REL(5)  ROMP_0E7_052                     * CF359  052 
        REL(5)  MINEHUNT~1~3                     * CF35E  053 
        REL(5)  ROMP_0E7_054                     * CF363  054 
        REL(5)  ROMP_0E7_055                     * CF368  055 
        REL(5)  MINEHUNT~1~2~10                  * CF36D  056 
        REL(5)  MINEHUNT~1~4                     * CF372  057 
        REL(5)  ~UTTYPEEXT0?                     * CF377  058 ~UTTYPEEXT0?
        ENDLENGTH                                * CF37C
        NIBHEX  0000                             * CF37C  ..
