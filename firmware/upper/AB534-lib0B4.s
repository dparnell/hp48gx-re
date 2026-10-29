* HP 48GX ROM revision R, #AB534-#AE565: Library part 0B4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #AB534 in the original ROM).
        RPL

* ROMPTR 0B4 108
* refs (1): A2437
ROMP_0B4_108:
        :: ' LAM 'PE3 STOLAM ROMPTR 0B5 085 ROMPTR 0B5 083 ROMPTR 0B5 081 ; * AB534

* ROMPTR 0B4 109
* refs (1): A2437
ROMP_0B4_109:
        :: ROMPTR 0B4 0ED ROMPTR 0B4 0EE ROMPTR 0B4 0EF ROMPTR 0B4 0F0 * AB578
          # BE56 BINT1 BINT28 # BE57 BINT67 BINT28 # BE58 BINT1 BINT37 * AB5A9
          # BE59 BINT67 BINT37 ROMPTR 0B4 0F1 ROMPTR 0B4 0F2 ROMPTR 0B4 0F3 * AB5E5
          ROMPTR 0B4 0F4 'RROMPTR@ ROMPTR 0B4 0B0 BINT31 BINT26 BINT31 BINT9 * AB61A
          BINT1                                  * AB649
          { BINT0 } BINT4 # BE5A MINUSONE MINUSONE %-1 MINUSONE 'RROMPTR@ * AB64E
          ROMPTR 0B4 0B0 BINT97 BINT26 BINT31 BINT9 BINT1 * AB685
          { BINT0 } BINT4 # BE5B MINUSONE MINUSONE %1 MINUSONE 'RROMPTR@ * AB6A9
          ROMPTR 0B4 0B0 BINT31 BINT35 BINT31 BINT9 BINT1 * AB6E0
          { BINT0 } BINT4 # BE5C MINUSONE MINUSONE %-1 MINUSONE 'RROMPTR@ * AB704
          ROMPTR 0B4 0B0 BINT97 BINT35 BINT31 BINT9 BINT1 * AB73B
          { BINT0 } BINT4 # BE5D MINUSONE MINUSONE %1 MINUSONE BINT8 DUP * AB75F
          'DROPFALSE # BE23                      * AB79B

* ROMPTR 0B4 10A
* refs (1): A2437
ROMP_0B4_10A:
          :: ROMPTR 0B5 080 ROMPTR 0B5 082 ROMPTR 0B5 088 ROMPTR 0B5 08A ; * AB7AA
          BINT8 ROMPTR 0B0 0AA ;                 * AB7E0

* ROMPTR 0B4 10B
* refs (1): A2437
ROMP_0B4_10B:
        :: ROMPTR 0B5 08B ROMPTR 0B5 089 ROMPTR 0B5 083 ROMPTR 0B5 081 ; * AB7F5

* ROMPTR 0B4 10C
* refs (1): A2437
ROMP_0B4_10C:
        :: ROMPTR 0B4 0F8 ROMPTR 0B4 0FE BINT9 DUP 'RROMPTR@ ROMPTR 0B4 10D * AB82B
          # BE23 ROMPTR 0B4 104 BINT9 ROMPTR 0B0 0AA ; * AB860

* ROMPTR 0B4 10D
* refs (1): A2437
ROMP_0B4_10D:
        :: BINT16 #<>case FALSE                  * AB88A
          ROMPTR 0B4 10E TrueTrue ;              * AB89E

* ROMPTR 0B4 10E
* refs (1): A2437
ROMP_0B4_10E:
        {                                        * AB8B3
          {                                      * AB8B8
            :: PTR DirLabel: $ "XX,YY" ; ROMPTR 0B4 10F } * AB8BD
          { $ "(AN(L" ROMPTR 0B0 059 }           * AB8F0  DoKeyCancel
          { $ "OK" ROMPTR 0B0 05A } }            * AB919  DoKeyOK

* ROMPTR 0B4 10F
* refs (1): A2437
ROMP_0B4_10F:
        :: TakeOver ROMPTR 0B0 0C8 ROMPTR 0B4 062 ROMPTR 0B4 110 GETPTYPE * AB941  GetFieldVals
          1LAMBIND DoInputForm 1GETABND PUTPTYPE NOT?SEMI * AB971
          ROMPTR 0B4 112 ROMPTR 0B4 061 ROMPTR 0B0 0D8 ; * AB98A

* ROMPTR 0B4 110
* refs (1): A2437
ROMP_0B4_110:
        :: # BE56 BINT1 BINT19 # BE57 BINT67 BINT19 # BE58 BINT1 BINT28 * AB9B0
          # BE59 BINT67 BINT28 'DROPFALSE BINT31 BINT17 BINT31 BINT9 BINT1 * AB9F1
          { BINT0 } BINT4 # BE5A MINUSONE MINUSONE %-1 MINUSONE 'DROPFALSE * ABA23
          BINT97 BINT17 BINT31 BINT9 BINT1       * ABA5A
          { BINT0 } BINT4 # BE5B MINUSONE MINUSONE %1 MINUSONE 'DROPFALSE * ABA73
          BINT31 BINT26 BINT31 BINT9 BINT1       * ABAAA
          { BINT0 } BINT4 # BE5C MINUSONE MINUSONE %-1 MINUSONE 'DROPFALSE * ABAC3
          BINT97 BINT26 BINT31 BINT9 BINT1       * ABAFA
          { BINT0 } BINT4 # BE5D MINUSONE MINUSONE %1 MINUSONE BINT4 DUP * ABB13
          'DROPFALSE # BE5E                      * ABB4F

* ROMPTR 0B4 111
* refs (1): A2437
ROMP_0B4_111:
          :: ROMPTR 0B5 088 ROMPTR 0B5 08A ; BINT4 ROMPTR 0B0 0AA ; * ABB5E

* ROMPTR 0B4 112
* refs (1): A2437
ROMP_0B4_112:
        :: ROMPTR 0B5 08B ROMPTR 0B5 089 ;       * ABB93

* ROMPTR 0B4 113
* refs (1): A2437
ROMP_0B4_113:
        :: ROMPTR 0B0 0AB                        * ABBB3
          {                                      * ABBC3
            { # BD01 ROMPTR 0B4 114 }            * ABBC8
            { # BD02 ROMPTR 0B4 122 }            * ABBE7
            { # BD03 ROMPTR 0B4 12B }            * ABC06
            { # BD04 ROMPTR 0B4 12D }            * ABC25
            { # BD05 ROMPTR 0B4 130 }            * ABC44
            { # BD06 ROMPTR 0B4 131 } }          * ABC63
          ROMPTR 0B0 0A9 ;                       * ABC87

* ROMPTR 0B4 114
* refs (1): A2437
ROMP_0B4_114:
        ::                                       * ABC97

* ROMPTR 0B4 115
* refs (1): A2437
ROMP_0B4_115:
          :: # BD08 BINT1 BINT10 ;               * ABC9C

* ROMPTR 0B4 116
* refs (1): A2437
ROMP_0B4_116:
          :: # BD09 BINT1 BINT19 ; # BE24 BINT52 BINT19 # BE25 # 5E BINT19 * ABCBA

* ROMPTR 0B4 117
* refs (1): A2437
ROMP_0B4_117:
          :: # BD0A BINT1 BINT28 ; # B917 BINT1 BINT37 * ABD05

* ROMPTR 0B4 118
* refs (1): A2437
ROMP_0B4_118:
          :: 'DROPFALSE BINT22 BINT8 BINT97 BINT9 BINT23 * ABD37
            { BINT9 BINT6 } BINT4 # BD0B # BF0A MINUSONE MINUSONE * ABD5A
            ROMPTR 0B5 092 ;                     * ABD91

* ROMPTR 0B4 119
* refs (1): A2437
ROMP_0B4_119:
          :: 'DROPFALSE BINT22 BINT17 BINT25 BINT9 BINT1 * ABDA1
            { BINT6 } BINT4 # BD0C MINUSONE MINUSONE MINUSONE MINUSONE ; * ABDC4
          'DROPFALSE BINT64 BINT17 BINT25 BINT9 BINT3 * ABDFB
          { BINT0 BINT6 BINT9 } BINT4 # BD0D MINUSONE MINUSONE MINUSONE * ABE19
          MINUSONE 'DROPFALSE # 6A BINT17 BINT25 BINT9 BINT3 * ABE50
          { BINT0 BINT6 BINT9 } BINT4 # BD0E MINUSONE MINUSONE MINUSONE * ABE78
          MINUSONE 'RROMPTR@ ROMPTR 0B4 11C BINT28 BINT26 BINT49 BINT9 * ABEAF
          BINT12 MINUSONE BINT17 # BD0F ROMPTR 0B5 0A0 BINT17 ROMPTR 0B5 0A1 * ABED8
          ROMPTR 0B5 094 ITE ROMPTR 0B5 0A1 ROMPTR 0B5 0A2 * ABF0C
          'RROMPTR@ ROMPTR 0B4 11D BINT61 BINT35 BINT19 BINT9 BINT12 * ABF32
          MINUSONE BINT33 # BD10 ROMPTR 0B5 143 BINT17 ROMPTR 0B5 144 * ABF5B
          ROMPTR 0B5 138 'RROMPTR@ ROMPTR 0B4 11E BINT85 BINT35 BINT13 BINT9 * ABF8A
          BINT13                                 * ABFB9
          { BINT0 } BINT4 # B91E ROMPTR 0B5 148 BINT4 %0_2A2B4 BINT13 ROLL * ABFBE
          BINT6 BINT7 'RROMPTR@ ROMPTR 0B4 11A # BD07 DoInputForm NOT?SEMI * ABFFB
          7PICK ROMPTR 0B5 093 ROT ROMPTR 0B0 099 3UNROLL 3PICK ITE * AC029
          :: COERCE SWAP ROMPTR 0B0 09D ; 2DROP  * AC058
          ROMPTR 0B5 097 ;                       * AC07C

* ROMPTR 0B4 11A
* refs (1): A2437
ROMP_0B4_11A:
        :: ROMPTR 0B0 0AD                        * AC08C
          { BINT1 BINT2 BINT3 BINT4 } BINT5 #<>case FALSE * AC09C
          ROMPTR 0B4 11B TRUE ;                  * AC0C9

* ROMPTR 0B4 11B
* refs (1): A2437
ROMP_0B4_11B:
        :: BINT39 BINT131 MAKEGROB BINT6 ONE_DO INDEX@ ROMPTR 0B0 012 LOOP * AC0DE
          ROMPTR 0B4 120 NOTcaseFALSE BINT6      * AC111
          ROMPTR 0B0 012 FALSE ;                 * AC126

* ROMPTR 0B4 11C
* refs (1): A2437
ROMP_0B4_11C:
        :: BINT47 #<>case FALSE                  * AC13B
          ROMPTR 0B4 11F TRUE ;                  * AC14F

* ROMPTR 0B4 11D
* refs (1): A2437
ROMP_0B4_11D:
        :: BINT7 #=casedrop                      * AC164
          :: ROMPTR 0B4 120 NOT ;                * AC173
          { BINT55 ROMPTR 0B4 120 BINT47 ROMPTR 0B4 11F } EQLookup case * AC18D
          :: EVAL TRUE ;                         * AC1C1
          DROPFALSE ;                            * AC1D5

* ROMPTR 0B4 11E
* refs (1): A2437
ROMP_0B4_11E:
        :: BINT7 #=casedrop                      * AC1DF
          :: ROMPTR 0B4 120 NOT ROMPTR 0B4 121 OR ; * AC1EE
          BINT55 #<>case FALSE                   * AC218
          ROMPTR 0B4 120 ROMPTR 0B4 121 NOT AND TRUE ; * AC227

* ROMPTR 0B4 11F
* refs (1): A2437
ROMP_0B4_11F:
        :: ROMPTR 0B4 120 NOTcase                * AC251
          :: BINT35 BINT9 BLANKIT ;              * AC266
          HARDBUFF BINT6 ROMPTR 0B0 012 DROP BINT6 ROMPTR 0B0 0A2 BINT7 * AC27F
          ROMPTR 0B0 0A2 ROMPTR 0B4 121 NOT?SEMI * AC2AE
          HARDBUFF BINT85 BINT35 BINT97 BINT44 GROB!ZERO DROP ; * AC2C9

* ROMPTR 0B4 120
* refs (1): A2437
ROMP_0B4_120:
        :: BINT5 ROMPTR 0B0 0C5 ROMPTR 0B0 099 ; * AC2F1  ~gFldVal

* ROMPTR 0B4 121
* refs (1): A2437
ROMP_0B4_121:
        :: BINT6 ROMPTR 0B0 0C5 ?ROMPTR@ ROMPTR 0B5 144 ?ROMPTR@ EQUAL ; * AC316  ~gFldVal

* ROMPTR 0B4 122
* refs (1): A2437
ROMP_0B4_122:
        :: ROMPTR 0B4 115 ROMPTR 0B4 116 ROMPTR 0B4 117 # BD12 BINT1 BINT37 * AC34A
          ROMPTR 0B4 118 ROMPTR 0B4 119 'RROMPTR@ ROMPTR 0B4 127 BINT28 * AC384
          BINT26 BINT49 BINT9 BINT12 MINUSONE BINT17 # BD0F ROMPTR 0B5 0A0 * AC3AF
          BINT17 ROMPTR 0B5 0A1 ROMPTR 0B5 094 ITE ROMPTR 0B5 0A1 * AC3E2
          ROMPTR 0B5 0A2                         * AC40D
          'RROMPTR@ ROMPTR 0B4 129 BINT28 BINT35 BINT49 BINT9 BINT1 * AC418
          { BINT0 BINT6 BINT9 } BINT4 # BD13 MINUSONE MINUSONE MINUSONE * AC441
          MINUSONE BINT4 DUP 'RROMPTR@ ROMPTR 0B4 123 # BD11 DoInputForm * AC478
          NOT?SEMI                               * AC4A6
          4PICK ROMPTR 0B5 093 SWAP ROMPTR 0B0 099 ROMPTR 0B5 098 ; * AC4AB

* ROMPTR 0B4 123
* refs (1): A2437
ROMP_0B4_123:
        :: ROMPTR 0B0 0AD                        * AC4DB
          { BINT1 BINT2 }                        * AC4EB
          { BINT16                               * AC4FF
            :: ROMPTR 0B4 124 TRUE ; BINT5 ROMPTR 0B4 126 } * AC509
          EQLookup case                          * AC538
          :: EVAL TRUE ;                         * AC542
          DROPFALSE ;                            * AC556

* ROMPTR 0B4 124
* refs (1): A2437
ROMP_0B4_124:
        {                                        * AC560
          { $ "STEP" ROMPTR 0B4 125 }            * AC565
          { $ "(AN(L" ROMPTR 0B0 059 }           * AC58C  DoKeyCancel
          { $ "OK" ROMPTR 0B0 05A } }            * AC5B5  DoKeyOK

* ROMPTR 0B4 125
* refs (1): A2437
ROMP_0B4_125:
        :: TakeOver ROMPTR 0B0 0C8 4PICK ROMPTR 0B5 093 SWAP ROMPTR 0B0 099 * AC5DD  GetFieldVals
          ROMPTR 0B5 099 AtUserStack ROMPTR 0B0 059 ; * AC612  DoKeyCancel

* ROMPTR 0B4 126
* refs (1): A2437
ROMP_0B4_126:
        :: BINT39 BINT131 MAKEGROB BINT4 ONE_DO INDEX@ ROMPTR 0B0 012 LOOP * AC632
          ROMPTR 0B4 12A NOTcaseFALSE BINT4      * AC665
          ROMPTR 0B0 012 FALSE ;                 * AC67A

* ROMPTR 0B4 127
* refs (1): A2437
ROMP_0B4_127:
        :: BINT47 #<>case FALSE                  * AC68F
          ROMPTR 0B4 128 TRUE ;                  * AC6A3

* ROMPTR 0B4 128
* refs (1): A2437
ROMP_0B4_128:
        :: ROMPTR 0B4 12A NOTcase                * AC6B8
          :: BINT35 BINT9 BLANKIT ;              * AC6CD
          HARDBUFF BINT4 ROMPTR 0B0 012 DROP BINT4 ROMPTR 0B0 0A2 ; * AC6E6

* ROMPTR 0B4 129
* refs (1): A2437
ROMP_0B4_129:
        :: BINT7 #=casedrop                      * AC715
          :: ROMPTR 0B4 12A NOT ;                * AC724
          BINT55 #<>case FALSE                   * AC73E
          ROMPTR 0B4 12A TRUE ;                  * AC74D

* ROMPTR 0B4 12A
* refs (1): A2437
ROMP_0B4_12A:
        :: BINT3 ROMPTR 0B0 0C5 ROMPTR 0B0 099 ; * AC762  ~gFldVal

* ROMPTR 0B4 12B
* refs (1): A2437
ROMP_0B4_12B:
        :: ROMPTR 0B4 115 ROMPTR 0B4 116 # BD16 BINT55 BINT19 ROMPTR 0B4 117 * AC787
          ROMPTR 0B4 118 ROMPTR 0B4 119 'DROPFALSE BINT79 BINT17 BINT19 * AC7C1
          BINT9 BINT1                            * AC7EB
          { BINT0 } BINT4 # BD17 MINUSONE MINUSONE MINUSONE MINUSONE * AC7F5

* ROMPTR 0B4 12C
* refs (1): A2437
ROMP_0B4_12C:
          :: 'DROPFALSE BINT28 BINT26 BINT49 BINT9 BINT12 MINUSONE BINT17 * AC827
            # BD0F ROMPTR 0B5 0A0 BINT17 ROMPTR 0B5 0A1 ROMPTR 0B5 094 ITE * AC854
            ROMPTR 0B5 0A1 ROMPTR 0B5 0A2        * AC889
          ;                                      * AC89F
          BINT4 DUP '                            * AC8A4
          :: ROMPTR 0B0 0AD                      * AC8B3
            { BINT1 BINT2 BINT3 } DROPFALSE ;    * AC8C3
          # BD15 DoInputForm NOT?SEMI            * AC8E6
          4PICK ROMPTR 0B5 093 ROMPTR 0B0 099 ROMPTR 0B5 09A ; * AC8FA

* ROMPTR 0B4 12D
* refs (1): A2437
ROMP_0B4_12D:
        :: ROMPTR 0B4 115 ROMPTR 0B4 116 ROMPTR 0B4 117 * AC925

* ROMPTR 0B4 12E
* refs (1): A2437
ROMP_0B4_12E:
          :: # BD19 # 5C BINT28 ; ROMPTR 0B4 118 ROMPTR 0B4 119 * AC94B
          ROMPTR 0B4 12C                         * AC984

* ROMPTR 0B4 12F
* refs (1): A2437
ROMP_0B4_12F:
          :: 'DROPFALSE BINT85 BINT26 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AC98F
            # BD1A MINUSONE MINUSONE FALSE ROMPTR 0B5 095 ; * AC9BC
          BINT4 DUP '                            * AC9E5
          :: ROMPTR 0B0 0AD                      * AC9F4
            { BINT1 BINT2 } DROPFALSE ;          * ACA04
          # BD18 DoInputForm NOT?SEMI            * ACA22
          4PICK ROMPTR 0B5 093 ROMPTR 0B5 096 ROMPTR 0B0 099 ROMPTR 0B5 09B ; * ACA36

* ROMPTR 0B4 130
* refs (1): A2437
ROMP_0B4_130:
        :: ROMPTR 0B4 115 ROMPTR 0B4 116 ROMPTR 0B4 117 ROMPTR 0B4 12E * ACA6C
          ROMPTR 0B4 118 ROMPTR 0B4 119 ROMPTR 0B4 12C ROMPTR 0B4 12F BINT4 * ACA9D
          DUP '                                  * ACACE
          :: ROMPTR 0B0 0AD                      * ACAD8
            { BINT1 BINT2 } DROPFALSE ;          * ACAE8
          # BD1B DoInputForm NOT?SEMI            * ACB06
          4PICK ROMPTR 0B5 093 ROMPTR 0B5 096 ROMPTR 0B0 099 ROMPTR 0B5 09C ; * ACB1A

* ROMPTR 0B4 131
* refs (1): A2437
ROMP_0B4_131:
        :: ROMPTR 0B4 115 ROMPTR 0B4 118 BINT1 DUP 'RROMPTR@ ROMPTR 0B4 132 * ACB50
          # BD1C DoInputForm NOT?SEMI            * ACB85
          DUP ROMPTR 0B5 093 DUP MINUSONE EQUAL IT DROP * ACB99
          AtUserStack ;                          * ACBC2

* ROMPTR 0B4 132
* refs (1): A2437
ROMP_0B4_132:
        :: BINT16 #<>case FALSE                  * ACBCC
          ROMPTR 0B4 133 TrueTrue ;              * ACBE0

* ROMPTR 0B4 133
* refs (1): A2437
ROMP_0B4_133:
        {                                        * ACBF5
          {                                      * ACBFA
            :: PTR DirLabel: $ "MATC" ; ROMPTR 0B4 136 } * ACBFF
          { $ "COLCT" ROMPTR 0B4 134 }           * ACC30
          { $ "EXPND" ROMPTR 0B4 135 } }         * ACC59

* ROMPTR 0B4 134
* refs (1): A2437
ROMP_0B4_134:
        :: TakeOver BINT1 ROMPTR 0B0 0C5 ROMPTR 0B5 09D BINT1 * ACC87  ~gFldVal
          ROMPTR 0B0 0D5 SetDA123NoCh BINT1 ROMPTR 0B0 0A2 ; * ACCB1  ~sFldVal

* ROMPTR 0B4 135
* refs (1): A2437
ROMP_0B4_135:
        :: TakeOver BINT1 ROMPTR 0B0 0C5 ROMPTR 0B5 09E BINT1 * ACCD6  ~gFldVal
          ROMPTR 0B0 0D5 SetDA123NoCh BINT1 ROMPTR 0B0 0A2 ; * ACD00  ~sFldVal

* ROMPTR 0B4 136
* refs (1): A2437
ROMP_0B4_136:
        :: TakeOver ROMPTR 0B4 115 # BD1E BINT1 BINT19 # BD1F BINT1 BINT28 * ACD25
          # BD20 BINT8 BINT37 # BD21 BINT67 BINT37 ROMPTR 0B4 118 DROP BINT1 * ACD62
          ROMPTR 0B0 0C5 'DROPFALSE BINT55 BINT17 # 49 BINT9 BINT1 * ACD9F  ~gFldVal
          { BINT9 BINT6 BINT0 BINT1 } BINT4 # BD22 MINUSONE MINUSONE * ACDCD
          MINUSONE MINUSONE 'DROPFALSE BINT55 BINT26 # 49 BINT9 BINT1 * ACE04
          { BINT9 BINT6 BINT0 BINT1 } BINT4 # BD23 MINUSONE MINUSONE * ACE31
          MINUSONE MINUSONE 'DROPFALSE BINT1 BINT35 BINT6 BINT9 BINT32 * ACE68
          MINUSONE MINUSONE # BD24 MINUSONE MINUSONE FALSE DUP 'DROPFALSE * ACE90
          # 58 BINT35 BINT37 BINT9 BINT1         * ACEBD
          { BINT9 BINT6 BINT0 } BINT4 # BD25 MINUSONE MINUSONE MINUSONE * ACEDB
          MINUSONE BINT5 DUP 'DROPFALSE # BD1D DoInputForm NOT?SEMI * ACF12
          ROMPTR 0B5 09F BINT1 ROMPTR 0B0 0D5 ;  * ACF3A  ~sFldVal

* ROMPTR 0B4 137
* refs (1): A2437
ROMP_0B4_137:
        :: ROMPTR 0B0 0AB                        * ACF5A
          {                                      * ACF6A
            { # BC01 ROMPTR 0B4 16E }            * ACF6F
            { # BC02 ROMPTR 0B4 138 }            * ACF8E
            { # BC03 ROMPTR 0B4 15B } }          * ACFAD
          ROMPTR 0B0 0A9 ;                       * ACFD1

* ROMPTR 0B4 138
* refs (1): A2437
ROMP_0B4_138:
        :: ROMPTR 0B4 14C ROMPTR 0B4 139 DROP ;  * ACFE1

* ROMPTR 0B4 139
* refs (1): A2437
ROMP_0B4_139:
        :: # BC05 BINT1 BINT10                   * AD006

* ROMPTR 0B4 13A
* refs (1): A2437
ROMP_0B4_13A:
          :: # BC06 BINT1 BINT19 ;               * AD01F

* ROMPTR 0B4 13B
* refs (1): A2437
ROMP_0B4_13B:
          :: $ ":" BINT52 BINT19 ;               * AD03D

* ROMPTR 0B4 13C
* refs (1): A2437
ROMP_0B4_13C:
          :: $ ":" BINT70 BINT19 ;               * AD05D

* ROMPTR 0B4 13D
* refs (1): A2437
ROMP_0B4_13D:
          :: # BC07 BINT1 BINT28 ;               * AD07D

* ROMPTR 0B4 13E
* refs (1): A2437
ROMP_0B4_13E:
          :: # BC08 BINT1 BINT37 ;               * AD09B

* ROMPTR 0B4 13F
* refs (1): A2437
ROMP_0B4_13F:
          :: $ "/" BINT52 BINT28 ;               * AD0B9

* ROMPTR 0B4 140
* refs (1): A2437
ROMP_0B4_140:
          :: $ "/" BINT70 BINT28 ;               * AD0D9

* ROMPTR 0B4 141
* refs (1): A2437
ROMP_0B4_141:
          :: $ "." BINT52 BINT28 ;               * AD0F9

* ROMPTR 0B4 142
* refs (1): A2437
ROMP_0B4_142:
          :: $ "." BINT70 BINT28 ; 'DROPFALSE BINT37 BINT8 BINT91 BINT9 * AD119
          BINT1 MINUSONE BINT4 # BC09 MINUSONE MINUSONE MINUSONE MINUSONE * AD152

* ROMPTR 0B4 143
* refs (1): A2437
ROMP_0B4_143:
          :: 'DROPFALSE BINT37 BINT17 BINT13 BINT9 BINT13 * AD17F
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 169 # BC0A ROMPTR 0B5 0B4 * AD1A2
            'RROMPTR@ ROMPTR 0B4 169 %12 MINUSONE ; * AD1D6

* ROMPTR 0B4 144
* refs (1): A2437
ROMP_0B4_144:
          :: 'RROMPTR@ ROMPTR 0B4 150 BINT55 BINT17 BINT13 BINT9 BINT13 * AD1F5
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 167 # BC0B MINUSONE 'RROMPTR@ * AD223
            ROMPTR 0B4 167 %0_2A2B4 MINUSONE ;   * AD256

* ROMPTR 0B4 145
* refs (1): A2437
ROMP_0B4_145:
          :: 'RROMPTR@ ROMPTR 0B4 151 # 49 BINT17 BINT13 BINT9 BINT13 * AD270
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 168 # BC0C MINUSONE 'RROMPTR@ * AD2A3
            ROMPTR 0B4 168 %0_2A2B4 MINUSONE ;   * AD2D6

* ROMPTR 0B4 146
* refs (1): A2437
ROMP_0B4_146:
          :: 'DROPFALSE # 5E BINT17 BINT31 BINT9 BINT12 MINUSONE BINT33 * AD2F0
            # BC0D ROMPTR 0B5 0B5 BINT17 ROMPTR 0B5 0B7 MINUSONE ; * AD322

* ROMPTR 0B4 147
* refs (1): A2437
ROMP_0B4_147:
          :: 'RROMPTR@ ROMPTR 0B4 152 BINT37 BINT26 BINT13 BINT9 BINT13 * AD351
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 16A # BC0E MINUSONE BINT17 %1 * AD37F
            MINUSONE ;                           * AD3B7

* ROMPTR 0B4 148
* refs (1): A2437
ROMP_0B4_148:
          :: 'RROMPTR@ ROMPTR 0B4 155 BINT55 BINT26 BINT13 BINT9 BINT13 * AD3C1
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 16B # BC0F MINUSONE BINT17 %1 * AD3EF
            MINUSONE ;                           * AD427

* ROMPTR 0B4 149
* refs (1): A2437
ROMP_0B4_149:
          :: 'RROMPTR@ ROMPTR 0B4 156 BINT37 BINT26 BINT13 BINT9 BINT13 * AD431
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 16B # BC0F MINUSONE BINT17 %1 * AD45F
            MINUSONE ;                           * AD497

* ROMPTR 0B4 14A
* refs (1): A2437
ROMP_0B4_14A:
          :: 'RROMPTR@ ROMPTR 0B4 153 BINT55 BINT26 BINT13 BINT9 BINT13 * AD4A1
            { BINT0 } 'RROMPTR@ ROMPTR 0B4 16A # BC0E MINUSONE BINT17 %1 * AD4CF
            MINUSONE ;                           * AD507

* ROMPTR 0B4 14B
* refs (1): A2437
ROMP_0B4_14B:
          :: 'RROMPTR@ ROMPTR 0B4 158 # 49 BINT26 BINT13 BINT9 BINT13 * AD511
            { BINT0 } BINT4 # BC10 MINUSONE BINT4 % 9.3E1 MINUSONE ; * AD544
          'RROMPTR@ ROMPTR 0B4 159 BINT37 BINT35 BINT25 BINT9 BINT13 * AD58B
          { BINT0 } 'RROMPTR@ ROMPTR 0B4 16C # BC11 ROMPTR 0B5 0B3 BINT4 * AD5B4
          %0_2A2B4 MINUSONE 'RROMPTR@ ROMPTR 0B4 15A BINT64 BINT35 BINT43 * AD5ED
          BINT9 BINT12 MINUSONE 'RROMPTR@ ROMPTR 0B4 16D # BC12 * AD616
          ROMPTR 0B5 0C6 BINT17 ROMPTR 0B5 0C9 MINUSONE BINT10 BINT12 * AD63F
          'RROMPTR@ ROMPTR 0B4 14E # BC04 # BF ROLL INNERCOMP ROMPTR 0B0 0AA * AD669
          DoInputForm NOTcaseFALSE ROMPTR 0B4 14D * AD6A2
          TRUE ;                                 * AD6B7

* ROMPTR 0B4 14C
* refs (1): A2437
ROMP_0B4_14C:
        :: MINUSONE ROMPTR 0B5 0A3 SWAPDROP %0_2A2B4 SWAP ROMPTR 0B5 0A6 * AD6C1
          3UNROLL 2DUP SWAP 5ROLL %0_2A2B4 ROMPTR 0B5 0C7 BINT12 {}N ; * AD6F0

* ROMPTR 0B4 14D
* refs (1): A2437
ROMP_0B4_14D:
        :: ROMPTR 0B4 165 ITE                    * AD723
          :: 6ROLL DROP 6ROLL DROP 5ROLL 5ROLL 5UNROLL 4UNROLL ; * AD738
          :: 4ROLL DROP 4ROLL DROP ;             * AD76A
          ROMPTR 0B5 0AC ;                       * AD788

* ROMPTR 0B4 14E
* refs (1): A2437
ROMP_0B4_14E:
        :: BINT5 #<>case FALSE                   * AD798
          ROMPTR 0B4 14F TRUE ;                  * AD7AC

* ROMPTR 0B4 14F
* refs (1): A2437
ROMP_0B4_14F:
        :: BINT39 BINT131 MAKEGROB BINT7 ONE_DO INDEX@ ROMPTR 0B0 012 LOOP * AD7C1
          ROMPTR 0B4 165 ITE                     * AD7F4
          :: BINT11 BINT9 ;                      * AD804
          :: BINT9 BINT7 ;                       * AD818
          DO INDEX@ ROMPTR 0B0 012 LOOP FALSE ;  * AD82C

* ROMPTR 0B4 151
* refs (2): A2437 A2437
ROMP_0B4_151:
        :: BINT40 #<>case FALSE                  * AD850
          ROMPTR 0B5 0B2 4GETLAM ROMPTR 0B0 0C5 COERCE #1+ BINT60 #MIN TRUE ; * AD864  ~gFldVal

* ROMPTR 0B4 152
* refs (1): A2437
ROMP_0B4_152:
        :: BINT7 #=casedrop ROMPTR 0B4 165       * AD89D
          { BINT55                               * AD8B7
            :: ROMPTR 0B4 165 NOT ; BINT47       * AD8C1
            :: 4GETLAM DUP ROMPTR 0B0 0C5 SWAP #3+ * AD8E0  ~gFldVal
              ROMPTR 0B0 0D5 ;                   * AD904  ~sFldVal
          }                                      * AD914
          EQLookup case                          * AD919
          :: EVAL TRUE ;                         * AD923
          ROMPTR 0B4 154 ;                       * AD937

* ROMPTR 0B4 153
* refs (1): A2437
ROMP_0B4_153:
        :: BINT7 #=casedrop                      * AD947
          :: ROMPTR 0B4 165 NOT ;                * AD956
          { BINT55 ROMPTR 0B4 165 BINT47         * AD970
            :: 4GETLAM DUP ROMPTR 0B0 0C5 SWAP #3- * AD98A  ~gFldVal
              ROMPTR 0B0 0D5 ;                   * AD9AE  ~sFldVal
          }                                      * AD9BE
          EQLookup case                          * AD9C3
          :: EVAL TRUE ;                         * AD9CD
          ROMPTR 0B4 154 ;                       * AD9E1

* ROMPTR 0B4 154
* refs (1): A2437
ROMP_0B4_154:
        ::                                       * AD9F1
          { BINT26 ROMPTR 0B4 162 BINT38 ROMPTR 0B4 163 BINT40 * AD9F6
            :: ROMPTR 0B5 0B9 4GETLAM ROMPTR 0B0 0C5 COERCE BINT1 #MAX * ADA20  ~gFldVal
              BINT12 #MIN ;                      * ADA4F
          }                                      * ADA5E
          EQLookup case                          * ADA63
          :: EVAL TRUE ;                         * ADA6D
          DROPFALSE ;                            * ADA81

* ROMPTR 0B4 155
* refs (1): A2437
ROMP_0B4_155:
        :: BINT7 #=casedrop ROMPTR 0B4 165       * ADA8B
          { BINT55                               * ADAA5
            :: ROMPTR 0B4 165 NOT ; BINT47       * ADAAF
            :: 4GETLAM DUP ROMPTR 0B0 0C5 SWAP #1+ * ADACE  ~gFldVal
              ROMPTR 0B0 0D5 ;                   * ADAF2  ~sFldVal
            BINT40                               * ADB02
            :: 4GETLAM DUP DUP #1- ROMPTR 0B0 0C5 COERCE SWAP #3+ * ADB07  ~gFldVal
              ROMPTR 0B0 0C5 COERCE ROMPTR 0B5 0B0 SWAP * ADB3A  ~gFldVal
              ROMPTR 0B0 0C5 COERCE BINT1 #MAX OVER LENCOMP #MIN ; * ADB5A  ~gFldVal
          }                                      * ADB88
          EQLookup case                          * ADB8D
          :: EVAL TRUE ;                         * ADB97
          ROMPTR 0B4 157 ;                       * ADBAB

* ROMPTR 0B4 156
* refs (1): A2437
ROMP_0B4_156:
        :: BINT7 #=casedrop                      * ADBBB
          :: ROMPTR 0B4 165 NOT ;                * ADBCA
          { BINT55 ROMPTR 0B4 165 BINT47         * ADBE4
            :: 4GETLAM DUP ROMPTR 0B0 0C5 SWAP #1- * ADBFE  ~gFldVal
              ROMPTR 0B0 0D5 ;                   * ADC22  ~sFldVal
            BINT40                               * ADC32
            :: 4GETLAM DUP DUP #1+ ROMPTR 0B0 0C5 COERCE SWAP #2+ * ADC37  ~gFldVal
              ROMPTR 0B0 0C5 COERCE ROMPTR 0B5 0B0 SWAP * ADC6A  ~gFldVal
              ROMPTR 0B0 0C5 COERCE BINT1 #MAX OVER LENCOMP #MIN ; * ADC8A  ~gFldVal
          }                                      * ADCB8
          EQLookup case                          * ADCBD
          :: EVAL TRUE ;                         * ADCC7
          ROMPTR 0B4 157 ;                       * ADCDB

* ROMPTR 0B4 157
* refs (1): A2437
ROMP_0B4_157:
        ::                                       * ADCEB
          { BINT26 ROMPTR 0B4 162 BINT38 ROMPTR 0B4 164 } EQLookup case * ADCF0
          :: EVAL TRUE ;                         * ADD24
          DROPFALSE ;                            * ADD38

* ROMPTR 0B4 158
* refs (1): A2437
ROMP_0B4_158:
        :: BINT40 #<>case FALSE                  * ADD42
          4GETLAM DUP ROMPTR 0B0 0C5 ROMPTR 0B5 0B1 ROMPTR 0B0 06D TRUE ; * ADD56  ~gFldVal

* ROMPTR 0B4 159
* refs (1): A2437
ROMP_0B4_159:
        :: BINT47 #<>case FALSE                  * ADD8B
          4GETLAM #1+ ROMPTR 0B0 0A2 TRUE ;      * ADD9F

* ROMPTR 0B4 15A
* refs (1): A2437
ROMP_0B4_15A:
        :: BINT55 #<>case FALSE                  * ADDBE
          ROMPTR 0B4 166 TRUE ;                  * ADDD2

* ROMPTR 0B4 15B
* refs (1): A2437
ROMP_0B4_15B:
        :: ROMPTR 0B4 13A ROMPTR 0B4 13B ROMPTR 0B4 13C ROMPTR 0B4 13D * ADDE7
          ROMPTR 0B4 13F ROMPTR 0B4 140 $ " " BINT52 BINT28 $ " " BINT70 * ADE18
          BINT28 ROMPTR 0B4 141 ROMPTR 0B4 142 ROMPTR 0B4 143 ROMPTR 0B4 144 * ADE55
          ROMPTR 0B4 145 ROMPTR 0B4 146 ROMPTR 0B4 147 ROMPTR 0B4 148 * ADE86
          ROMPTR 0B4 149 ROMPTR 0B4 14A ROMPTR 0B4 14B 'RROMPTR@ * ADEB2
          ROMPTR 0B4 160 # 5E BINT26 BINT31 BINT9 BINT12 MINUSONE BINT33 * ADED8
          # BC14 ROMPTR 0B5 0D2 BINT17 ROMPTR 0B5 0D3 MINUSONE BINT10 DUP * ADF0B
          'RROMPTR@ ROMPTR 0B4 15E # BC13 ROMPTR 0B4 15C BINT10 * ADF3F
          ROMPTR 0B0 0AA DoInputForm NOT?SEMI    * ADF69
          ROMPTR 0B4 15D ;                       * ADF7E

* ROMPTR 0B4 15C
* refs (1): A2437
ROMP_0B4_15C:
        :: ROMPTR 0B5 0A3 ROMPTR 0B5 0A6 3UNROLL 2DUP SWAP 5ROLL * ADF8E
          ROMPTR 0B5 0AE ;                       * ADFBD

* ROMPTR 0B4 15D
* refs (1): A2437
ROMP_0B4_15D:
        :: ROMPTR 0B5 0AF ROMPTR 0B4 165 ITE     * ADFCD
          :: 4ROLL DROP 4ROLL DROP 3UNROLL SWAPROT ; ROTROT2DROP * ADFED
          ROMPTR 0B5 0A8 DUP ROMPTR 0B5 0AD ROMPTR 0B5 0A5 ; * AE01A

* ROMPTR 0B4 15E
* refs (1): A2437
ROMP_0B4_15E:
        :: BINT5 #<>case FALSE                   * AE045
          ROMPTR 0B4 15F TRUE ;                  * AE059

* ROMPTR 0B4 15F
* refs (1): A2437
ROMP_0B4_15F:
        :: BINT39 BINT131 MAKEGROB BINT5 ONE_DO INDEX@ ROMPTR 0B0 012 LOOP * AE06E
          ROMPTR 0B4 165 ITE                     * AE0A1
          :: BINT11 BINT9 ;                      * AE0B1
          :: BINT7 BINT5 ;                       * AE0C5
          DO INDEX@ ROMPTR 0B0 012 LOOP FALSE ;  * AE0D9

* ROMPTR 0B4 160
* refs (1): A2437
ROMP_0B4_160:
        :: BINT47 #<>case FALSE                  * AE0FD
          ROMPTR 0B4 161 TRUE ;                  * AE111

* ROMPTR 0B4 161
* refs (1): A2437
ROMP_0B4_161:
        :: BINT42 BINT10 ROMPTR 0B0 0C5 ROMPTR 0B0 09A ITE SetSysFlag * AE126  ~gFldVal
          ClrSysFlag                             * AE155
          ROMPTR 0B4 165 ITE                     * AE15A
          :: BINT9 BINT7 BINT11 BINT7 ;          * AE16A
          :: BINT7 BINT5 BINT7 BINT5 ;           * AE188
          HARDBUFF 3UNROLL DO INDEX@ ROMPTR 0B0 012 LOOP DROP DO INDEX@ * AE1A6
          ROMPTR 0B0 0A2 LOOP ;                  * AE1D9

* ROMPTR 0B4 162
* refs (1): A2437
ROMP_0B4_162:
        :: 4GETLAM ROMPTR 0B0 030 NOT?SEMI       * AE1EE
          ROMPTR 0B0 099 4GETLAM DUPUNROT ROMPTR 0B0 0D5 DUP ROMPTR 0B0 041 * AE208  ~sFldVal
          ROMPTR 0B0 013 ;                       * AE238  IFEDispField

* ROMPTR 0B4 163
* refs (1): A2437
ROMP_0B4_163:
        :: 4GETLAM DUP ROMPTR 0B0 0C5 %1+ DUP %12 %> IT * AE248  ~gFldVal
          :: DROP %1 ;                           * AE27B
          OVER ROMPTR 0B0 0D5 DUP ROMPTR 0B0 041 * AE28F  ~sFldVal
          ROMPTR 0B0 013 SetDA123NoCh ;          * AE2AF  IFEDispField

* ROMPTR 0B4 164
* refs (1): A2437
ROMP_0B4_164:
        :: 4GETLAM DUP ROMPTR 0B0 0C5 COERCE OVER #1- * AE2C4  ~gFldVal
          ROMPTR 0B0 0C5 COERCE 3PICK #1+        * AE2ED  ~gFldVal
          ROMPTR 0B0 0C5 COERCE ROMPTR 0B5 0A9 SWAP #1+ DUPUNROT #< IT * AE307  ~gFldVal
          DROPONE                                * AE33B
          UNCOERCE OVER ROMPTR 0B0 0D5 DUP ROMPTR 0B0 041 * AE340  ~sFldVal
          ROMPTR 0B0 013 SetDA123NoCh ;          * AE365  IFEDispField

* ROMPTR 0B4 165
* refs (1): A2437
ROMP_0B4_165:
        :: BINT42 TestSysFlag ;                  * AE37A

* ROMPTR 0B4 166
* refs (1): A2437
ROMP_0B4_166:
        :: BINT11 ROMPTR 0B0 0C5 %0<> ;          * AE38E  ~gFldVal

* ROMPTR 0B4 168
* refs (2): A2437 A2437
ROMP_0B4_168:
        :: DUP BINT4 ROMPTR 0B0 074 SWAP %9 %> ?SEMI * AE3AD
          CHR_0 >H$ ;                            * AE3DB

* ROMPTR 0B4 16B
* refs (3): A2437 A2437 A2437
ROMP_0B4_16B:
        :: DUP BINT4 ROMPTR 0B0 074 SWAP %9 %> ?SEMI * AE3EA
          CHR_Space >H$ ;                        * AE418

* ROMPTR 0B4 16C
* refs (1): A2437
ROMP_0B4_16C:
        :: DUP %0= casedrop                      * AE427
          :: # BC1C JstGetTHEMESG ;              * AE43B
          BINT4 ROMPTR 0B0 074 DUPLEN$ BINT4 2DUP #< NOTcase2DROP SWAP#- * AE454
          Blank$ SWAP&$ ;                        * AE482

* ROMPTR 0B4 16D
* refs (1): A2437
ROMP_0B4_16D:
        :: ROMPTR 0B4 166 NOTcasedrop NULL$      * AE491
          4GETLAM #1- ROMPTR 0B0 0C5 %1 %= case  * AE4AB  ~gFldVal
          :: ROMPTR 0B0 098 JstGetTHEMESG ;      * AE4CF
          ROMPTR 0B5 0D1 SWAP ROMPTR 0B0 099 NTHCOMPDROP JstGetTHEMESG ; * AE4E9

* ROMPTR 0B4 16E
* refs (1): A2437
ROMP_0B4_16E:
        :: TakeOver 'RROMPTR@ ROMPTR 0B4 16F # BC3B 'RROMPTR@ ROMPTR 0B5 0D7 * AE513
          NULL{} BINT1 ROMPTR 0B3 000 caseDROP ; * AE547  ~Choose
