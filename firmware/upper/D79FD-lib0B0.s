* HP 48GX ROM revision R, #D79FD-#D9A50: Library part 0B0
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~sFldVal ~nNullBind ~grobCheckKey ~grobAlertIcon ~gFldVal GetFieldVals DoAlert
* Follows on from the previous file (at #D79FD in the original ROM).
        RPL

* ROMPTR 0B0 063
* refs (1): D49CE
ROMP_0B0_063:
        ::                                       * D79FD
          TakeOver                               * D7A02
          5GETLAM                                * D7A07
          DUP                                    * D7A0C
          BEGIN                                  * D7A11
          ROMPTR  0B0 025                        * D7A16
          2DUP                                   * D7A21
          #<                                     * D7A26
          WHILE                                  * D7A2B
          ::                                     * D7A30
            SWAPDROP                             * D7A35
            DUP                                  * D7A3A
          ;                                      * D7A3F
          REPEAT                                 * D7A44
          DROP                                   * D7A49
          ROMPTR  0B0 095                        * D7A4E
        ;                                        * D7A59

* ROMPTR 0B0 064
* refs (1): D49CE
ROMP_0B0_064:
        ::                                       * D7A5E
          TakeOver                               * D7A63
          REPEATERCH                             * D7A68
          BINT11                                 * D7A6D
          ::                                     * D7A72
            5GETLAM                              * D7A77
            ROMPTR  0B0 028                      * D7A7C
            ROMPTR  0B0 095                      * D7A87
          ;                                      * D7A92
        ;                                        * D7A97

* ROMPTR 0B0 065
* refs (1): D49CE
ROMP_0B0_065:
        ::                                       * D7A9C
          TakeOver                               * D7AA1
          REPEATERCH                             * D7AA6
          BINT17                                 * D7AAB
          ::                                     * D7AB0
            5GETLAM                              * D7AB5
            ROMPTR  0B0 027                      * D7ABA
            ROMPTR  0B0 095                      * D7AC5
          ;                                      * D7AD0
        ;                                        * D7AD5

* ROMPTR 0B0 066
* refs (1): D49CE
ROMP_0B0_066:
        ::                                       * D7ADA
          TakeOver                               * D7ADF
          REPEATERCH                             * D7AE4
          BINT18                                 * D7AE9
          ROMPTR  0B0 067                        * D7AEE
        ;                                        * D7AF9

* ROMPTR 0B0 067
* refs (1): D49CE
ROMP_0B0_067:
        ::                                       * D7AFE
          5GETLAM                                * D7B03
          ROMPTR  0B0 025                        * D7B08
          ROMPTR  0B0 095                        * D7B13
        ;                                        * D7B1E

* ROMPTR 0B0 068
* refs (1): D49CE
ROMP_0B0_068:
        ::                                       * D7B23
          TakeOver                               * D7B28
          REPEATERCH                             * D7B2D
          BINT16                                 * D7B32
          ROMPTR  0B0 069                        * D7B37
        ;                                        * D7B42

* ROMPTR 0B0 069
* refs (1): D49CE
ROMP_0B0_069:
        ::                                       * D7B47
          5GETLAM                                * D7B4C
          ROMPTR  0B0 026                        * D7B51
          ROMPTR  0B0 095                        * D7B5C
        ;                                        * D7B67

* ROMPTR 0B0 06A
* refs (1): D49CE
ROMP_0B0_06A:
        ::                                       * D7B6C
          TakeOver                               * D7B71
          5GETLAM                                * D7B76
          DUP                                    * D7B7B
          ROMPTR  0B0 08D                        * D7B80
          casedrop                               * D7B8B
          ROMPTR  0B0 058                        * D7B90
          ROMPTR  0B0 08B                        * D7B9B
          NOTcase                                * D7BA6
          DoBadKey                               * D7BAB
          REPEATERCH                             * D7BB0
          BINT26                                 * D7BB5
          ROMPTR  0B0 03D                        * D7BBA
        ;                                        * D7BC5

* ROMPTR 0B0 06B
* refs (1): D49CE
ROMP_0B0_06B:
        ::                                       * D7BCA
          5GETLAM                                * D7BCF
          2DUP                                   * D7BD4
          #=case                                 * D7BD9
          2DROP                                  * D7BDE
          2DUP                                   * D7BE3
          ROMPTR  0B0 021                        * D7BE8
          DUP                                    * D7BF3
          5PUTLAM                                * D7BF8
          ROMPTR  0B0 022                        * D7BFD
          ROMPTR  0B0 0A6                        * D7C08
        ;                                        * D7C13

* ROMPTR 0B0 06C
* refs (1): D49CE
ROMP_0B0_06C:
        ::                                       * D7C18
          5GETLAM                                * D7C1D
          DUP                                    * D7C22
          ROMPTR  0B0 024                        * D7C27
          2DUP                                   * D7C32
          #=case                                 * D7C37
          2DROP                                  * D7C3C
          DUP                                    * D7C41
          ROMPTR  0B0 06B                        * D7C46
          SWAP                                   * D7C51
          ROMPTR  0B0 014                        * D7C56
          ROMPTR  0B0 015                        * D7C61
        ;                                        * D7C6C

* ROMPTR 0B0 06D
* refs (1): D49CE
ROMP_0B0_06D:
        ::                                       * D7C71
          DUPROT                                 * D7C76
          ROMPTR  0B0 078                        * D7C7B
          NOTcasedrop                            * D7C86
          BINT0                                  * D7C8B
          DUP4UNROLL                             * D7C90
          '                                      * D7C95
          ::                                     * D7C9A
            OBJ_72AFA                            * D7C9F
            SWAP                                 * D7CA4
            OBJ_72AFA                            * D7CA9
            EQUAL                                * D7CAE
          ;                                      * D7CB3
          POSCOMP                                * D7CB8
          DUP#0<>                                * D7CBD
          case                                   * D7CC2
          ROTDROP                                * D7CC7
          DROPSWAP                               * D7CCC
          >HCOMP                                 * D7CD1
          BINT1                                  * D7CD6
        ;                                        * D7CDB

* ROMPTR 0B0 06E
* refs (1): D49CE
ROMP_0B0_06E:
        ::                                       * D7CE0
          MenuDef@                               * D7CE5
          8GETLAM                                * D7CEA
          EQUAL                                  * D7CEF
        ;                                        * D7CF4

* ROMPTR 0B0 06F
* refs (1): D49CE
ROMP_0B0_06F:
        ::                                       * D7CF9
          BINT0                                  * D7CFE
          3UNROLL                                * D7D03
          DUP                                    * D7D08
          #6-                                    * D7D0D
          BINT0                                  * D7D12
          4PICK                                  * D7D17
          LEN$                                   * D7D1C
          #1+_ONE_DO                             * D7D21
          4PICK                                  * D7D26
          INDEX@                                 * D7D2B
          DUP                                    * D7D30
          SUB$                                   * D7D35
          ROMPTR  0B0 071                        * D7D3A
          #+                                     * D7D45
          2DUP                                   * D7D4A
          #<                                     * D7D4F
          IT                                     * D7D54
          ::                                     * D7D59
            5PICK                                * D7D5E
            #0<>                                 * D7D63
            ?SEMI                                * D7D68
            5ROLLDROP                            * D7D6D
            INDEX@                               * D7D72
            #1-                                  * D7D77
            5UNROLL                              * D7D7C
          ;                                      * D7D81
          DUP                                    * D7D86
          4PICK                                  * D7D8B
          #>                                     * D7D90
          IT                                     * D7D95
          ExitAtLOOP                             * D7D9A
          LOOP                                   * D7D9F
          SWAPDROP                               * D7DA4
          #<                                     * D7DA9
          NOTcase                                * D7DAE
          ::                                     * D7DB3
            SWAPDROP                             * D7DB8
            TRUE                                 * D7DBD
          ;                                      * D7DC2
          BINT1                                  * D7DC7
          ROT                                    * D7DCC
          SUB$                                   * D7DD1
          CHR_...                                * D7DD6
          >T$                                    * D7DDB
          FALSE                                  * D7DE0
        ;                                        * D7DE5

* ROMPTR 0B0 070
* refs (1): D49CE
ROMP_0B0_070:
        ::                                       * D7DEA
          BINT0                                  * D7DEF
          3UNROLL                                * D7DF4
          DUP                                    * D7DF9
          #6-                                    * D7DFE
          BINT0                                  * D7E03
          4PICK                                  * D7E08
          LEN$                                   * D7E0D
          ZERO_DO                                * D7E12
          4PICK                                  * D7E17
          ISTOP-INDEX                            * D7E1C
          DUP                                    * D7E21
          SUB$                                   * D7E26
          ROMPTR  0B0 071                        * D7E2B
          #+                                     * D7E36
          2DUP                                   * D7E3B
          #<                                     * D7E40
          IT                                     * D7E45
          ::                                     * D7E4A
            5PICK                                * D7E4F
            #0<>                                 * D7E54
            ?SEMI                                * D7E59
            5ROLLDROP                            * D7E5E
            ISTOP-INDEX                          * D7E63
            #1+                                  * D7E68
            5UNROLL                              * D7E6D
          ;                                      * D7E72
          DUP                                    * D7E77
          4PICK                                  * D7E7C
          #>                                     * D7E81
          IT                                     * D7E86
          ExitAtLOOP                             * D7E8B
          LOOP                                   * D7E90
          SWAPDROP                               * D7E95
          #<                                     * D7E9A
          NOTcase                                * D7E9F
          ::                                     * D7EA4
            SWAPDROP                             * D7EA9
            TRUE                                 * D7EAE
          ;                                      * D7EB3
          DUPUNROT                               * D7EB8
          LEN$                                   * D7EBD
          SUB$                                   * D7EC2
          CHR_...                                * D7EC7
          >H$                                    * D7ECC
          FALSE                                  * D7ED1
        ;                                        * D7ED6

* ROMPTR 0B0 071
* refs (1): D49CE
ROMP_0B0_071:
        ::                                       * D7EDB
          $>grob                                 * D7EE0
          GROBDIMw                               * D7EE5
        ;                                        * D7EEA

* ROMPTR 0B0 072
* refs (1): D49CE
ROMP_0B0_072:
        ::                                       * D7EEF
          DUP                                    * D7EF4
          MINUSONE                               * D7EF9
          #=                                     * D7EFE
          IT                                     * D7F03
          DROPZERO                               * D7F08
          #1+                                    * D7F0D
          DUP                                    * D7F12
          14GETLAM                               * D7F17
          #>ITE                                  * D7F1C
          DROPFALSE                              * D7F21
          TRUE                                   * D7F26
        ;                                        * D7F2B

* ROMPTR 0B0 073
* refs (1): D49CE
ROMP_0B0_073:
        ::                                       * D7F30
          DUP                                    * D7F35
          MINUSONE                               * D7F3A
          #=ITE                                  * D7F3F
          ::                                     * D7F44
            DROP                                 * D7F49
            14GETLAM                             * D7F4E
          ;                                      * D7F53
          #1-                                    * D7F58
          DUP#0=ITE                              * D7F5D
          DROPFALSE                              * D7F62
          TRUE                                   * D7F67
        ;                                        * D7F6C

* ROMPTR 0B0 074
* refs (1): D49CE
ROMP_0B0_074:
        ::                                       * D7F71
          DUPTYPEBINT?                           * D7F76
          NOTcase                                * D7F7B
          EVAL                                   * D7F80
          SWAP                                   * D7F85
          ::                                     * D7F8A
            OVER                                 * D7F8F
            BINT16                               * D7F94
            #AND                                 * D7F99
            #0<>                                 * D7F9E
            case                                 * D7FA3
            ::                                   * D7FA8
              BINT1                              * D7FAD
              OBJ_1A01B                          * D7FB2
            ;                                    * D7FB7
            OVER                                 * D7FBC
            BINT32                               * D7FC1
            #AND                                 * D7FC6
            #0<>                                 * D7FCB
            case                                 * D7FD0
            ::                                   * D7FD5
              BINT2                              * D7FDA
              OBJ_1A01B                          * D7FDF
            ;                                    * D7FE4
          ;                                      * D7FE9
          DUP                                    * D7FEE
          MINUSONE                               * D7FF3
          EQUAL                                  * D7FF8
          case2drop                              * D7FFD
          NULL$                                  * D8002
          OBJ_1A002                              * D8007
          ::                                     * D800C
            OVER                                 * D8011
            BINT1                                * D8016
            #AND                                 * D801B
            #0<>                                 * D8020
            case                                 * D8025
            DUP                                  * D802A
            OVER                                 * D802F
            BINT4                                * D8034
            #AND                                 * D8039
            #0<>                                 * D803E
            case                                 * D8043
            ::                                   * D8048
              DUP                                * D804D
              ROMPTR  0B0 075                    * D8052
            ;                                    * D805D
            OVER                                 * D8062
            BINT2                                * D8067
            #AND                                 * D806C
            #0<>                                 * D8071
            case                                 * D8076
            ::                                   * D807B
              DUP                                * D8080
              ROMPTR  0B0 076                    * D8085
            ;                                    * D8090
          ;                                      * D8095
          3PICK                                  * D809A
          BINT8                                  * D809F
          #AND                                   * D80A4
          #0<>                                   * D80A9
          IT                                     * D80AE
          ::                                     * D80B3
            ONEONE                               * D80B8
            SUB$                                 * D80BD
          ;                                      * D80C2
          ROTROT2DROP                            * D80C7
        ;                                        * D80CC

* ROMPTR 0B0 075
* refs (1): D49CE
ROMP_0B0_075:
        ::                                       * D80D1
          savefmt1                               * D80D6
          ERRSET                                 * D80DB
          ROMPTR  0B0 076                        * D80E0
          ERRTRAP                                * D80EB
          ::                                     * D80F0
            rstfmt1                              * D80F5
            ERRJMP                               * D80FA
          ;                                      * D80FF
          rstfmt1                                * D8104
        ;                                        * D8109

* ROMPTR 0B0 076
* refs (1): D49CE
ROMP_0B0_076:
        ::                                       * D810E
          DUPTYPEIDNT?                           * D8113
          case                                   * D8118
          DECOMP$                                * D811D
          BINT23                                 * D8122
          !DcompWidth                            * D8127
          1stkdecomp$w                           * D812C
        ;                                        * D8131

* ROMPTR 0B0 077
* refs (1): D49CE
ROMP_0B0_077:
        ::                                       * D8136
          DUP                                    * D813B
          ROMPTR  0B0 0C2                        * D8140
          DUPTYPELIST?                           * D814B
          NOTcase                                * D8150
          ::                                     * D8155
            FALSE                                * D815A
            ROT                                  * D815F
            ROMPTR  0B0 0BF                      * D8164
            TRUE                                 * D816F
          ;                                      * D8174
          INNERCOMP                              * D8179
          BINT2                                  * D817E
          #=case                                 * D8183
          ::                                     * D8188
            ROT                                  * D818D
            ROMPTR  0B0 0BF                      * D8192
            TRUE                                 * D819D
          ;                                      * D81A2
          5ROLL                                  * D81A7
          DROP                                   * D81AC
        ;                                        * D81B1

* ROMPTR 0B0 078
* refs (1): D49CE
ROMP_0B0_078:
        ::                                       * D81B6
          ROMPTR  0B0 0C5                        * D81BB  ~gFldVal
          DUP                                    * D81C6
          MINUSONE                               * D81CB
          EQUALNOTcase                           * D81D0
          TRUE                                   * D81D5
          DROPFALSE                              * D81DA
        ;                                        * D81DF

* ROMPTR 0B0 079
* refs (1): D49CE
ROMP_0B0_079:
        ::                                       * D81E4
          ROMPTR  0B0 0C5                        * D81E9  ~gFldVal
          MINUSONE                               * D81F4
          EQUAL                                  * D81F9
        ;                                        * D81FE

* ROMPTR 0B0 07A
* refs (1): D49CE
ROMP_0B0_07A:
        ::                                       * D8203
          ROMPTR  0B0 0BF                        * D8208
          MINUSONE                               * D8213
          #=casedrop                             * D8218
          FALSE                                  * D821D
          TRUE                                   * D8222
        ;                                        * D8227

* ROMPTR 0B0 07B
* refs (1): D49CE
ROMP_0B0_07B:
        ::                                       * D822C
          ROMPTR  0B0 0C2                        * D8231
        ;                                        * D823C

* ROMPTR 0B0 07C
* refs (1): D49CE
ROMP_0B0_07C:
        ::                                       * D8241
          ROMPTR  0B0 0C3                        * D8246
        ;                                        * D8251

* ROMPTR 0B0 07D
* refs (1): D49CE
ROMP_0B0_07D:
        ::                                       * D8256
          ROMPTR  0B0 0C4                        * D825B
          DUP                                    * D8266
          MINUSONE                               * D826B
          EQUALcase                              * D8270
          DROPFALSE                              * D8275
          TRUE                                   * D827A
        ;                                        * D827F

* ROMPTR 0B0 07E
* refs (1): D49CE
ROMP_0B0_07E:
        GROB    "images/D8284.png"               * D8284  6 x 9

* ROMPTR 0B0 07F
* refs (1): D49CE
ROMP_0B0_07F:
        GROB    "images/D82AA.png"               * D82AA  6 x 9

* ROMPTR 0B0 080
* refs (1): D49CE
ROMP_0B0_080:
        GROB    "images/D82D0.png"               * D82D0  6 x 9

* ROMPTR 0B0 081
* refs (1): D49CE
ROMP_0B0_081:
        GROB    "images/D82F6.png"               * D82F6  6 x 9

* ROMPTR 0B0 082
* refs (1): D49CE
ROMP_0B0_082:
        GROB    "images/D831C.png"               * D831C  6 x 9

* ROMPTR 0B0 083
* refs (1): D49CE
ROMP_0B0_083:
        GROB    "images/D8342.png"               * D8342  6 x 9

* ROMPTR 0B0 084
* refs (1): D49CE
ROMP_0B0_084:
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
        CON(5)  DOGROB                           * D840A  DOGROB
        LENGTH                                   * D840F  length, to #D850C
        NIBHEX  70000380005555555555555555555555 * D8414  ..0..UUUUUUUUUUU
        NIBHEX  555555555555AAAAAAAAAAAAAAAAAAAA * D8434  UUUUUUªªªªªªªªªª
        NIBHEX  AAAAAAAAAAAAA2555555555555555555 * D8454  ªªªªªª*UUUUUUUUU
        NIBHEX  5555555555555555AAAAAAAAAAAAAAAA * D8474  UUUUUUUUªªªªªªªª
        NIBHEX  AAAAAAAAAAAAAAAAA255555555555555 * D8494  ªªªªªªªª*UUUUUUU
        NIBHEX  55555555555555555555AAAAAAAAAAAA * D84B4  UUUUUUUUUUªªªªªª
        NIBHEX  AAAAAAAAAAAAAAAAAAAAA25555555555 * D84D4  ªªªªªªªªªª*UUUUU
        NIBHEX  555555555555555555555555         * D84F4  UUUUUUUUUUUU
        ENDLENGTH                                * D850C

* ROMPTR 0B0 088
* refs (1): D49CE
ROMP_0B0_088:
        ::                                       * D850C
          ROMPTR  0B0 0BE                        * D8511
          BINT1                                  * D851C
          #AND                                   * D8521
          #0<>                                   * D8526
        ;                                        * D852B

* ROMPTR 0B0 089
* refs (1): D49CE
ROMP_0B0_089:
        ::                                       * D8530
          ROMPTR  0B0 0BE                        * D8535
          BINT2                                  * D8540
          #AND                                   * D8545
          #0<>                                   * D854A
        ;                                        * D854F

* ROMPTR 0B0 08A
* refs (1): D49CE
ROMP_0B0_08A:
        ::                                       * D8554
          ROMPTR  0B0 0BE                        * D8559
          BINT4                                  * D8564
          #AND                                   * D8569
          #0<>                                   * D856E
        ;                                        * D8573

* ROMPTR 0B0 08B
* refs (1): D49CE
ROMP_0B0_08B:
        ::                                       * D8578
          ROMPTR  0B0 0BE                        * D857D
          BINT8                                  * D8588
          #AND                                   * D858D
          #0<>                                   * D8592
        ;                                        * D8597

* ROMPTR 0B0 08C
* refs (1): D49CE
ROMP_0B0_08C:
        ::                                       * D859C
          ROMPTR  0B0 0BE                        * D85A1
          BINT16                                 * D85AC
          #AND                                   * D85B1
          #0<>                                   * D85B6
        ;                                        * D85BB

* ROMPTR 0B0 08D
* refs (1): D49CE
ROMP_0B0_08D:
        ::                                       * D85C0
          ROMPTR  0B0 0BE                        * D85C5
          BINT32                                 * D85D0
          #=                                     * D85D5
        ;                                        * D85DA

* ROMPTR 0B0 08E
* refs (1): D49CE
ROMP_0B0_08E:
        ::                                       * D85DF
          EDITDECOMP$                            * D85E4
          InitEdLine                             * D85E9
          EditString                             * D85EE
          OBJ_3A030                              * D85F3
          SetPrgmEntry                           * D85F8
          SetDA2bValid                           * D85FD
          #       B914                           * D8602  47380
          '                                      * D860C
          ROMPTR  0B0 08F                        * D8611
          ROMPTR  0B0 092                        * D861C
          OBJ_1A03E                              * D8627
          case                                   * D862C
          SetDA2bEdit                            * D8631
          5GETLAM                                * D8636
          ROMPTR  0B0 032                        * D863B
          SetDA2bEdit                            * D8646
        ;                                        * D864B

* ROMPTR 0B0 08F
* refs (1): D49CE
ROMP_0B0_08F:
        ::                                       * D8650
          NoExitAction                           * D8655
          {                                      * D865A
            {                                    * D865F
              $       "TYPES"                    * D8664
              ::                                 * D8678
                TakeOver                         * D867D
                ROMPTR  0B1 009                  * D8682  DoMKeyOK
                DROPFALSE                        * D868D
              ;                                  * D8692
            }                                    * D8697
            NullMenuKey                          * D869C
            NullMenuKey                          * D86A1
            NullMenuKey                          * D86A6
            NullMenuKey                          * D86AB
            {                                    * D86B0
              $       "OK"                       * D86B5
              ::                                 * D86C3
                TakeOver                         * D86C8
                ROMPTR  0B1 009                  * D86CD  DoMKeyOK
              ;                                  * D86D8
            }                                    * D86DD
          }                                      * D86E2
        ;                                        * D86E7

* ROMPTR 0B0 090
* refs (1): D49CE
ROMP_0B0_090:
        ::                                       * D86EC
          EDITDECOMP$                            * D86F1
          InitEdLine                             * D86F6
          EditString                             * D86FB
          OBJ_3A030                              * D8700
          SetPrgmEntry                           * D8705
          SetDA2bValid                           * D870A
          #       B915                           * D870F  47381
          ROMPTR  0B0 091                        * D8719  DoAlert
          SetDA2bEdit                            * D8724
          OBJ_1A03E                              * D8729
        ;                                        * D872E

* ROMPTR 0B0 091
* refs (1): D49CE
DoAlert:
        ::                                       * D8733
          BINT13                                 * D8738
          BINT5                                  * D873D
          ROMPTR  0B0 085                        * D8742  ~grobAlertIcon
          '                                      * D874D
          ROMPTR  0B1 002                        * D8752  ~MsgBoxMenu
          ERRBEEP                                * D875D
          ROMPTR  0B1 000                        * D8762  ~DoMsgBox
          DROP                                   * D876D
          SetDA123NoCh                           * D8772
        ;                                        * D8777

* ROMPTR 0B0 092
* refs (1): D49CE
ROMP_0B0_092:
        ::                                       * D877C
          BINT13                                 * D8781
          BINT5                                  * D8786
          ROMPTR  0B0 085                        * D878B  ~grobAlertIcon
          4ROLL                                  * D8796
          ERRBEEP                                * D879B
          ROMPTR  0B1 000                        * D87A0  ~DoMsgBox
          SetDA123NoCh                           * D87AB
        ;                                        * D87B0

* ROMPTR 0B0 093
* refs (1): D49CE
ROMP_0B0_093:
        ::                                       * D87B5
          BINT7                                  * D87BA
          BINT39                                 * D87BF
          EDITPARTS                              * D87C4
          BINT4                                  * D87C9
          #MIN                                   * D87CE
          BINT1                                  * D87D3
          #MAX                                   * D87D8
          #1-                                    * D87DD
          #10*                                   * D87E2
          #-                                     * D87E7
          BLANKIT                                * D87EC
        ;                                        * D87F1

* ROMPTR 0B0 094
* refs (1): D49CE
ROMP_0B0_094:
        ::                                       * D87F6
          BINT46                                 * D87FB
          BINT10                                 * D8800
          BLANKIT                                * D8805
        ;                                        * D880A

* ROMPTR 0B0 095
* refs (1): D49CE
ROMP_0B0_095:
        ::                                       * D880F
          ::                                     * D8814
            SetDA1NoCh                           * D8819
            SetDA2aNoCh                          * D881E
            SetDA3NoCh                           * D8823
          ;                                      * D8828
          5GETLAM                                * D882D
          2DUP                                   * D8832
          #=                                     * D8837
          case2drop                              * D883C
          SetDA2bNoCh                            * D8841
          OVER                                   * D8846
          ROMPTR  0B0 06B                        * D884B
          ROMPTR  0B0 014                        * D8856
          ROMPTR  0B0 015                        * D8861
        ;                                        * D886C

* ROMPTR 0B0 096
* refs (1): D49CE
ROMP_0B0_096:
        ::                                       * D8871
          2DUP                                   * D8876
          ROMPTR  0B0 042                        * D887B
          NOTcasedrop                            * D8886
          ::                                     * D888B
            '                                    * D8890
            '                                    * D8895
            SWAP                                 * D889A
            '                                    * D889F
            ROMPTR  0B0 08E                      * D88A4
            BINT3                                * D88AF
            ::N                                  * D88B4
            FALSE                                * D88B9
          ;                                      * D88BE
          2DUP                                   * D88C3
          ROMPTR  0B0 043                        * D88C8
          NOTcasedrop                            * D88D3
          ::                                     * D88D8
            '                                    * D88DD
            '                                    * D88E2
            SWAP                                 * D88E7
            '                                    * D88EC
            ROMPTR  0B0 090                      * D88F1
            BINT3                                * D88FC
            ::N                                  * D8901
            FALSE                                * D8906
          ;                                      * D890B
          ROMPTR  0B0 0D5                        * D8910  ~sFldVal
          TRUE                                   * D891B
        ;                                        * D8920

* ROMPTR 0B0 097
* refs (1): D49CE
ROMP_0B0_097:
        ::                                       * D8925
          10GETLAM                               * D892A
          DUP                                    * D892F
          MINUSONE                               * D8934
          EQUAL                                  * D8939
          NOT?SEMI                               * D893E
          DROP                                   * D8943
          ROMPTR  0B0 00E                        * D8948
          NOT?SEMI                               * D8953
          DUP                                    * D8958
          10PUTLAM                               * D895D
        ;                                        * D8962

* ROMPTR 0B0 098
* refs (1): D49CE
ROMP_0B0_098:
        ::                                       * D8967
          BINT1                                  * D896C
          OBJ_1A01B                              * D8971
        ;                                        * D8976

* ROMPTR 0B0 099
* refs (1): D49CE
ROMP_0B0_099:
        ::                                       * D897B
          BINT2                                  * D8980
          OBJ_1A01B                              * D8985
        ;                                        * D898A

* ROMPTR 0B0 09A
* refs (1): D49CE
ROMP_0B0_09A:
        ::                                       * D898F
          BINT3                                  * D8994
          OBJ_1A01B                              * D8999
        ;                                        * D899E

* ROMPTR 0B0 09B
* refs (1): D49CE
ROMP_0B0_09B:
        ::                                       * D89A3
          ROMPTR  0B0 098                        * D89A8
          EVAL                                   * D89B3
        ;                                        * D89B8

* ROMPTR 0B0 09C
* refs (1): D49CE
ROMP_0B0_09C:
        ::                                       * D89BD
          ROMPTR  0B0 099                        * D89C2
          EVAL                                   * D89CD
        ;                                        * D89D2

* ROMPTR 0B0 09D
* refs (1): D49CE
ROMP_0B0_09D:
        ::                                       * D89D7
          ROMPTR  0B0 09A                        * D89DC
          EVAL                                   * D89E7
        ;                                        * D89EC

* ROMPTR 0B0 09E
* refs (1): D49CE
ROMP_0B0_09E:
        ::                                       * D89F1
          4PICK                                  * D89F6
          #0=case                                * D89FB
          ::                                     * D8A00
            5DROP                                * D8A05
            FALSE                                * D8A0A
          ;                                      * D8A0F
          ROMPTR  0B3 012                        * D8A14
          5ROLL                                  * D8A1F
          SWAP                                   * D8A24
          FALSE                                  * D8A29
          3UNROLL                                * D8A2E
          6PICK                                  * D8A33
          #1+                                    * D8A38
          5PICK                                  * D8A3D
          2DUP                                   * D8A42
          #>                                     * D8A47
          ITE                                    * D8A4C
          ::                                     * D8A51
            DO                                   * D8A56
            INDEX@                               * D8A5B
            3PICK                                * D8A60
            EVAL                                 * D8A65
            6PICK                                * D8A6A
            ROMPTR  0B0 074                      * D8A6F
            ROMPTR  0B3 013                      * D8A7A
            ROMPTR  0B3 012                      * D8A85
            OVER                                 * D8A90
            EQUAL                                * D8A95
            IT                                   * D8A9A
            ::                                   * D8A9F
              DROP                               * D8AA4
              INDEX@                             * D8AA9
              ROTDROP                            * D8AAE
              TRUE                               * D8AB3
              3UNROLL                            * D8AB8
              ExitAtLOOP                         * D8ABD
            ;                                    * D8AC2
            LOOP                                 * D8AC7
          ;                                      * D8ACC
          2DROP                                  * D8AD1
          3PICK                                  * D8AD6
          case                                   * D8ADB
          ::                                     * D8AE0
            6UNROLL                              * D8AE5
            5DROP                                * D8AEA
            TRUE                                 * D8AEF
          ;                                      * D8AF4
          4PICK                                  * D8AF9
          BINT1                                  * D8AFE
          2DUP                                   * D8B03
          #>                                     * D8B08
          ITE                                    * D8B0D
          ::                                     * D8B12
            DO                                   * D8B17
            INDEX@                               * D8B1C
            3PICK                                * D8B21
            EVAL                                 * D8B26
            6PICK                                * D8B2B
            ROMPTR  0B0 074                      * D8B30
            ROMPTR  0B3 013                      * D8B3B
            ROMPTR  0B3 012                      * D8B46
            OVER                                 * D8B51
            EQUAL                                * D8B56
            IT                                   * D8B5B
            ::                                   * D8B60
              DROP                               * D8B65
              INDEX@                             * D8B6A
              ROTDROP                            * D8B6F
              TRUE                               * D8B74
              3UNROLL                            * D8B79
              ExitAtLOOP                         * D8B7E
            ;                                    * D8B83
            LOOP                                 * D8B88
          ;                                      * D8B8D
          2DROP                                  * D8B92
          ROT                                    * D8B97
          case                                   * D8B9C
          ::                                     * D8BA1
            5UNROLL                              * D8BA6
            4DROP                                * D8BAB
            TRUE                                 * D8BB0
          ;                                      * D8BB5
          5DROP                                  * D8BBA
          FALSE                                  * D8BBF
        ;                                        * D8BC4

* ROMPTR 0B0 09F
* refs (1): D49CE
ROMP_0B0_09F:
        ::                                       * D8BC9
          9GETLAM                                * D8BCE
          SWAP                                   * D8BD3
          #1+                                    * D8BD8
          NTHCOMPDROP                            * D8BDD
          NOT                                    * D8BE2
        ;                                        * D8BE7

* ROMPTR 0B0 0A0
* refs (1): D49CE
ROMP_0B0_0A0:
        ::                                       * D8BEC
          9GETLAM                                * D8BF1
          CARCOMP                                * D8BF6
          NOT                                    * D8BFB
        ;                                        * D8C00

* ROMPTR 0B0 0A1
* refs (1): D49CE
ROMP_0B0_0A1:
        ::                                       * D8C05
          TRUE                                   * D8C0A
          SWAP                                   * D8C0F
          #1+                                    * D8C14
          9GETLAM                                * D8C19
          PUTLIST                                * D8C1E
          DUP                                    * D8C23
          INCOMPDROP                             * D8C28
          14GETLAM                               * D8C2D
          #1-                                    * D8C32
          DUP#0<>                                * D8C37
          ITE                                    * D8C3C
          ::                                     * D8C41
            ZERO_DO                              * D8C46
            AND                                  * D8C4B
            LOOP                                 * D8C50
          ;                                      * D8C55
          DROP                                   * D8C5A
          SWAPDROP                               * D8C5F
          BINT1                                  * D8C64
          ROT                                    * D8C69
          PUTLIST                                * D8C6E
          9PUTLAM                                * D8C73
        ;                                        * D8C78

* ROMPTR 0B0 0A2
* refs (1): D49CE
ROMP_0B0_0A2:
        ::                                       * D8C7D
          FALSE                                  * D8C82
          SWAP                                   * D8C87
          #1+                                    * D8C8C
          9GETLAM                                * D8C91
          PUTLIST                                * D8C96
          FALSE                                  * D8C9B
          BINT1                                  * D8CA0
          ROT                                    * D8CA5
          PUTLIST                                * D8CAA
          9PUTLAM                                * D8CAF
        ;                                        * D8CB4

* ROMPTR 0B0 0A3
* refs (1): D49CE
ROMP_0B0_0A3:
        ::                                       * D8CB9
          TRUE                                   * D8CBE
          14GETLAM                               * D8CC3
          #1+_ONE_DO                             * D8CC8
          DUP                                    * D8CCD
          LOOP                                   * D8CD2
          14GETLAM                               * D8CD7
          #1+                                    * D8CDC
          {}N                                    * D8CE1
          9PUTLAM                                * D8CE6
        ;                                        * D8CEB

* ROMPTR 0B0 0A4
* refs (1): D49CE
ROMP_0B0_0A4:
        ::                                       * D8CF0
          FALSE                                  * D8CF5
          14GETLAM                               * D8CFA
          #1+_ONE_DO                             * D8CFF
          DUP                                    * D8D04
          LOOP                                   * D8D09
          14GETLAM                               * D8D0E
          #1+                                    * D8D13
          {}N                                    * D8D18
          9PUTLAM                                * D8D1D
        ;                                        * D8D22

* ROMPTR 0B0 0A5
* refs (1): D49CE
ROMP_0B0_0A5:
        ::                                       * D8D27
          $>grob                                 * D8D2C
          BINT7                                  * D8D31
          OVER                                   * D8D36
          GROBDIMw                               * D8D3B
          #3+                                    * D8D40
          MAKEGROB                               * D8D45
          SWAP                                   * D8D4A
          OVER                                   * D8D4F
          BINT2                                  * D8D54
          BINT1                                  * D8D59
          GROB!                                  * D8D5E
          ROMPTR  0B0 087                        * D8D63
          TOTEMPOB                               * D8D6E
          DUP                                    * D8D73
          3UNROLL                                * D8D78
          BINT65                                 * D8D7D
          3PICK                                  * D8D82
          GROBDIMw                               * D8D87
          #2/                                    * D8D8C
          #-                                     * D8D91
          BINT0                                  * D8D96
          GROB!                                  * D8D9B
        ;                                        * D8DA0

* ROMPTR 0B0 0A6
* refs (1): D49CE
ROMP_0B0_0A6:
        ::                                       * D8DA5
          DUP                                    * D8DAA
          MINUSONE                               * D8DAF
          #=                                     * D8DB4
          case2drop                              * D8DB9
          ::                                     * D8DBE
            SetThisRow                           * D8DC3
            SetDA3Bad                            * D8DC8
          ;                                      * D8DCD
          ROMPTR  0B0 0BE                        * D8DD2
          BINT37                                 * D8DDD
          #AND                                   * D8DE2
          SWAP                                   * D8DE7
          ROMPTR  0B0 0BE                        * D8DEC
          BINT37                                 * D8DF7
          #AND                                   * D8DFC
          #=                                     * D8E01
          ?SEMI                                  * D8E06
          SetThisRow                             * D8E0B
          SetDA3Bad                              * D8E10
        ;                                        * D8E15

* ROMPTR 0B0 0A7
* refs (1): D49CE
ROMP_0B0_0A7:
        ::                                       * D8E1A
          8GETLAM                                * D8E1F
          7GETLAM                                * D8E24
          StartMenu                              * D8E29
        ;                                        * D8E2E

* ROMPTR 0B0 0A8
* refs (1): D49CE
ROMP_0B0_0A8:
        ::                                       * D8E33
          MenuRow@                               * D8E38
          7PUTLAM                                * D8E3D
          5GETLAM                                * D8E42
          ROMPTR  0B0 02D                        * D8E47
          BINT1                                  * D8E52
          StartMenu                              * D8E57
        ;                                        * D8E5C

* ROMPTR 0B0 0A9
* refs (1): D49CE
ROMP_0B0_0A9:
        ::                                       * D8E61
          '                                      * D8E66
          DROPFALSE                              * D8E6B
          NULL$                                  * D8E70
          BINT17                                 * D8E75
          4ROLL                                  * D8E7A
          BINT1                                  * D8E7F
          ROMPTR  0B3 000                        * D8E84  ~Choose
          NOT?SEMI                               * D8E8F
          ROMPTR  0B0 09C                        * D8E94
        ;                                        * D8E9F

* ROMPTR 0B0 0AA
* refs (1): D49CE
ROMP_0B0_0AA:
        ::                                       * D8EA4
          ZERO_DO                                * D8EA9
          ISTOP-INDEX                            * D8EAE
          #1-                                    * D8EB3
          BINT13                                 * D8EB8
          #*                                     * D8EBD
          #4+                                    * D8EC2
          ISTOP-INDEX                            * D8EC7
          #+                                     * D8ECC
          DUP                                    * D8ED1
          #2+                                    * D8ED6
          ROLL                                   * D8EDB
          DROP                                   * D8EE0
          ISTOP-INDEX                            * D8EE5
          #1+                                    * D8EEA
          ROLL                                   * D8EEF
          SWAP                                   * D8EF4
          UNROLL                                 * D8EF9
          LOOP                                   * D8EFE
        ;                                        * D8F03

* ROMPTR 0B0 0AB
* refs (1): D49CE
ROMP_0B0_0AB:
        ::                                       * D8F08
          ROMPTR  0B0 0AC                        * D8F0D
          NOT?SEMI                               * D8F18
          RDROP                                  * D8F1D
          COLA                                   * D8F22
          DoBadKey                               * D8F27
        ;                                        * D8F2C

* ROMPTR 0B0 0AC
* refs (1): D49CE
ROMP_0B0_0AC:
        ::                                       * D8F31
          '                                      * D8F36
          LAM     'IF                            * D8F3B
          undo                                   * D8F48
          NOTcaseFALSE                           * D8F4D
        ;                                        * D8F52

* ROMPTR 0B0 0AD
* refs (1): D49CE
ROMP_0B0_0AD:
        ::                                       * D8F57
          'R                                     * D8F5C
          OVER                                   * D8F61
          BINT29                                 * D8F66
          #<>                                    * D8F6B
          caseDROP                               * D8F70
          DUPTYPELIST?                           * D8F75
          ?SKIP                                  * D8F7A
          ONE{}N                                 * D8F7F
          INNERCOMP                              * D8F84
          ZERO_DO                                * D8F89
          ISTOP-INDEX                            * D8F8E
          ROLL                                   * D8F93
          DUP                                    * D8F98
          ROMPTR  0B0 079                        * D8F9D
          case                                   * D8FA8
          ::                                     * D8FAD
            ROMPTR  0B0 06B                      * D8FB2
            SETSIZEERR                           * D8FBD
          ;                                      * D8FC2
          DROP                                   * D8FC7
          LOOP                                   * D8FCC
        ;                                        * D8FD1

* ROMPTR 0B0 0AE
* refs (1): D49CE
ROMP_0B0_0AE:
        ::                                       * D8FD6
          12GETLAM                               * D8FDB
          OBJ_1A002                              * D8FE0
        ;                                        * D8FE5

* ROMPTR 0B0 0AF
* refs (1): D49CE
ROMP_0B0_0AF:
        ::                                       * D8FEA
          OBJ_6819D                              * D8FEF
          3GETLAM                                * D8FF4
          SWAP#-                                 * D8FF9
        ;                                        * D8FFE

* ROMPTR 0B0 0B0
* refs (1): D49CE
ROMP_0B0_0B0:
        ::                                       * D9003
          ROMPTR  0B0 0AF                        * D9008
          #2+                                    * D9013
          GETLAM                                 * D9018
          OBJ_1A002                              * D901D
        ;                                        * D9022

* ROMPTR 0B0 0B1
* refs (1): D49CE
ROMP_0B0_0B1:
        ::                                       * D9027
          ROMPTR  0B0 0AF                        * D902C
          #1+                                    * D9037
          GETLAM                                 * D903C
        ;                                        * D9041

* ROMPTR 0B0 0B2
* refs (1): D49CE
ROMP_0B0_0B2:
        ::                                       * D9046
          ROMPTR  0B0 0AF                        * D904B
          GETLAM                                 * D9056
        ;                                        * D905B

* ROMPTR 0B0 0B3
* refs (1): D49CE
ROMP_0B0_0B3:
        ::                                       * D9060
          ROMPTR  0B0 0AF                        * D9065
          #1+                                    * D9070
          ROMPTR  0B0 0D9                        * D9075
        ;                                        * D9080

* ROMPTR 0B0 0B4
* refs (1): D49CE
ROMP_0B0_0B4:
        ::                                       * D9085
          ROMPTR  0B0 0AF                        * D908A
          #2+                                    * D9095
          PUTLAM                                 * D909A
        ;                                        * D909F

* ROMPTR 0B0 0B5
* refs (1): D49CE
ROMP_0B0_0B5:
        ::                                       * D90A4
          ROMPTR  0B0 0AF                        * D90A9
          #1+                                    * D90B4
          PUTLAM                                 * D90B9
        ;                                        * D90BE

* ROMPTR 0B0 0B6
* refs (1): D49CE
ROMP_0B0_0B6:
        ::                                       * D90C3
          ROMPTR  0B0 0AF                        * D90C8
          PUTLAM                                 * D90D3
        ;                                        * D90D8

* ROMPTR 0B0 0B7
* refs (1): D49CE
ROMP_0B0_0B7:
        ::                                       * D90DD
          ROMPTR  0B0 0AF                        * D90E2
          #1+                                    * D90ED
          ROMPTR  0B0 0DA                        * D90F2
        ;                                        * D90FD

* ROMPTR 0B0 0B8
* refs (1): D49CE
ROMP_0B0_0B8:
        ::                                       * D9102
          BINT13                                 * D9107
          #*                                     * D910C
          2GETLAM                                * D9111
          SWAP#-                                 * D9116
        ;                                        * D911B

* ROMPTR 0B0 0B9
* refs (1): D49CE
ROMP_0B0_0B9:
        ::                                       * D9120
          ROMPTR  0B0 0B8                        * D9125
          #12+                                   * D9130
          GETLAM                                 * D9135
        ;                                        * D913A

* ROMPTR 0B0 0BA
* refs (1): D49CE
ROMP_0B0_0BA:
        ::                                       * D913F
          ROMPTR  0B0 0B8                        * D9144
          BINT11                                 * D914F
          #+                                     * D9154
          GETLAM                                 * D9159
        ;                                        * D915E

* ROMPTR 0B0 0BB
* refs (1): D49CE
ROMP_0B0_0BB:
        ::                                       * D9163
          ROMPTR  0B0 0B8                        * D9168
          #10+                                   * D9173
          GETLAM                                 * D9178
        ;                                        * D917D

* ROMPTR 0B0 0BC
* refs (1): D49CE
ROMP_0B0_0BC:
        ::                                       * D9182
          ROMPTR  0B0 0B8                        * D9187
          #9+                                    * D9192
          GETLAM                                 * D9197
        ;                                        * D919C

* ROMPTR 0B0 0BD
* refs (1): D49CE
ROMP_0B0_0BD:
        ::                                       * D91A1
          ROMPTR  0B0 0B8                        * D91A6
          #8+                                    * D91B1
          GETLAM                                 * D91B6
        ;                                        * D91BB

* ROMPTR 0B0 0BE
* refs (1): D49CE
ROMP_0B0_0BE:
        ::                                       * D91C0
          ROMPTR  0B0 0B8                        * D91C5
          #7+                                    * D91D0
          GETLAM                                 * D91D5
        ;                                        * D91DA

* ROMPTR 0B0 0BF
* refs (1): D49CE
ROMP_0B0_0BF:
        ::                                       * D91DF
          ROMPTR  0B0 0B8                        * D91E4
          #6+                                    * D91EF
          GETLAM                                 * D91F4
        ;                                        * D91F9

* ROMPTR 0B0 0C0
* refs (1): D49CE
ROMP_0B0_0C0:
        ::                                       * D91FE
          ROMPTR  0B0 0B8                        * D9203
          #5+                                    * D920E
          GETLAM                                 * D9213
        ;                                        * D9218

* ROMPTR 0B0 0C1
* refs (1): D49CE
ROMP_0B0_0C1:
        ::                                       * D921D
          ROMPTR  0B0 0B8                        * D9222
          #4+                                    * D922D
          GETLAM                                 * D9232
          OBJ_1A002                              * D9237
        ;                                        * D923C

* ROMPTR 0B0 0C2
* refs (1): D49CE
ROMP_0B0_0C2:
        ::                                       * D9241
          ROMPTR  0B0 0B8                        * D9246
          #3+                                    * D9251
          GETLAM                                 * D9256
        ;                                        * D925B

* ROMPTR 0B0 0C3
* refs (1): D49CE
ROMP_0B0_0C3:
        ::                                       * D9260
          ROMPTR  0B0 0B8                        * D9265
          #2+                                    * D9270
          GETLAM                                 * D9275
        ;                                        * D927A

* ROMPTR 0B0 0C4
* refs (1): D49CE
ROMP_0B0_0C4:
        ::                                       * D927F
          ROMPTR  0B0 0B8                        * D9284
          #1+                                    * D928F
          GETLAM                                 * D9294
        ;                                        * D9299

* ROMPTR 0B0 0C5
* refs (1): D49CE
~gFldVal:
        ::                                       * D929E
          ROMPTR  0B0 0B8                        * D92A3
          GETLAM                                 * D92AE
        ;                                        * D92B3

* ROMPTR 0B0 0C6
* refs (1): D49CE
ROMP_0B0_0C6:
        ::                                       * D92B8
          ROMPTR  0B0 0B8                        * D92BD
          BINT11                                 * D92C8
          #+                                     * D92CD
          ROMPTR  0B0 0D9                        * D92D2
        ;                                        * D92DD

* ROMPTR 0B0 0C7
* refs (1): D49CE
ROMP_0B0_0C7:
        ::                                       * D92E2
          ROMPTR  0B0 0B8                        * D92E7
          #9+                                    * D92F2
          ROMPTR  0B0 0D9                        * D92F7
        ;                                        * D9302

* ROMPTR 0B0 0C8
* refs (1): D49CE
GetFieldVals:
        ::                                       * D9307
          14GETLAM                               * D930C
          #1+_ONE_DO                             * D9311
          INDEX@                                 * D9316
          ROMPTR  0B0 0C5                        * D931B  ~gFldVal
          LOOP                                   * D9326
        ;                                        * D932B

* ROMPTR 0B0 0C9
* refs (1): D49CE
ROMP_0B0_0C9:
        ::                                       * D9330
          ROMPTR  0B0 0B8                        * D9335
          #12+                                   * D9340
          PUTLAM                                 * D9345
        ;                                        * D934A

* ROMPTR 0B0 0CA
* refs (1): D49CE
ROMP_0B0_0CA:
        ::                                       * D934F
          ROMPTR  0B0 0B8                        * D9354
          BINT11                                 * D935F
          #+                                     * D9364
          PUTLAM                                 * D9369
        ;                                        * D936E

* ROMPTR 0B0 0CB
* refs (1): D49CE
ROMP_0B0_0CB:
        ::                                       * D9373
          ROMPTR  0B0 0B8                        * D9378
          #10+                                   * D9383
          PUTLAM                                 * D9388
        ;                                        * D938D

* ROMPTR 0B0 0CC
* refs (1): D49CE
ROMP_0B0_0CC:
        ::                                       * D9392
          ROMPTR  0B0 0B8                        * D9397
          #9+                                    * D93A2
          PUTLAM                                 * D93A7
        ;                                        * D93AC

* ROMPTR 0B0 0CD
* refs (1): D49CE
ROMP_0B0_0CD:
        ::                                       * D93B1
          ROMPTR  0B0 0B8                        * D93B6
          #8+                                    * D93C1
          PUTLAM                                 * D93C6
        ;                                        * D93CB

* ROMPTR 0B0 0CE
* refs (1): D49CE
ROMP_0B0_0CE:
        ::                                       * D93D0
          ROMPTR  0B0 0B8                        * D93D5
          #7+                                    * D93E0
          PUTLAM                                 * D93E5
        ;                                        * D93EA

* ROMPTR 0B0 0CF
* refs (1): D49CE
ROMP_0B0_0CF:
        ::                                       * D93EF
          ROMPTR  0B0 0B8                        * D93F4
          #6+                                    * D93FF
          PUTLAM                                 * D9404
        ;                                        * D9409

* ROMPTR 0B0 0D0
* refs (1): D49CE
ROMP_0B0_0D0:
        ::                                       * D940E
          ROMPTR  0B0 0B8                        * D9413
          #5+                                    * D941E
          PUTLAM                                 * D9423
        ;                                        * D9428

* ROMPTR 0B0 0D1
* refs (1): D49CE
ROMP_0B0_0D1:
        ::                                       * D942D
          ROMPTR  0B0 0B8                        * D9432
          #4+                                    * D943D
          PUTLAM                                 * D9442
        ;                                        * D9447

* ROMPTR 0B0 0D2
* refs (1): D49CE
ROMP_0B0_0D2:
        ::                                       * D944C
          ROMPTR  0B0 0B8                        * D9451
          #3+                                    * D945C
          PUTLAM                                 * D9461
        ;                                        * D9466

* ROMPTR 0B0 0D3
* refs (1): D49CE
ROMP_0B0_0D3:
        ::                                       * D946B
          ROMPTR  0B0 0B8                        * D9470
          #2+                                    * D947B
          PUTLAM                                 * D9480
        ;                                        * D9485

* ROMPTR 0B0 0D4
* refs (1): D49CE
ROMP_0B0_0D4:
        ::                                       * D948A
          ROMPTR  0B0 0B8                        * D948F
          #1+                                    * D949A
          PUTLAM                                 * D949F
        ;                                        * D94A4

* ROMPTR 0B0 0D5
* refs (1): D49CE
~sFldVal:
        ::                                       * D94A9
          ROMPTR  0B0 0B8                        * D94AE
          PUTLAM                                 * D94B9
        ;                                        * D94BE

* ROMPTR 0B0 0D6
* refs (1): D49CE
ROMP_0B0_0D6:
        ::                                       * D94C3
          ROMPTR  0B0 0B8                        * D94C8
          BINT11                                 * D94D3
          #+                                     * D94D8
          ROMPTR  0B0 0DA                        * D94DD
        ;                                        * D94E8

* ROMPTR 0B0 0D7
* refs (1): D49CE
ROMP_0B0_0D7:
        ::                                       * D94ED
          ROMPTR  0B0 0B8                        * D94F2
          #9+                                    * D94FD
          ROMPTR  0B0 0DA                        * D9502
        ;                                        * D950D

* ROMPTR 0B0 0D8
* refs (1): D49CE
ROMP_0B0_0D8:
        ::                                       * D9512
          14GETLAM                               * D9517
          ZERO_DO                                * D951C
          ISTOP-INDEX                            * D9521
          ROMPTR  0B0 0D5                        * D9526  ~sFldVal
          LOOP                                   * D9531
        ;                                        * D9536

* ROMPTR 0B0 0D9
* refs (1): D49CE
ROMP_0B0_0D9:
        ::                                       * D953B
          DUP                                    * D9540
          GETLAM                                 * D9545
          SWAP#1-                                * D954A
          GETLAM                                 * D954F
        ;                                        * D9554

* ROMPTR 0B0 0DA
* refs (1): D49CE
ROMP_0B0_0DA:
        ::                                       * D9559
          ROTOVER                                * D955E
          PUTLAM                                 * D9563
          #1-                                    * D9568
          PUTLAM                                 * D956D
        ;                                        * D9572

* ROMPTR 0B0 0DB
* refs (1): D49CE
~nNullBind:
        ::                                       * D9577
          '                                      * D957C
          NULLLAM                                * D9581
          CACHE                                  * D9586
        ;                                        * D958B

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
        REL(5)  ROMP_0B0_001                     * D9603  001 
        REL(5)  ROMP_0B0_002                     * D9608  002 
        REL(5)  ROMP_0B0_003                     * D960D  003 
        REL(5)  ROMP_0B0_004                     * D9612  004 
        REL(5)  ~IFMenuRow1                      * D9617  005 ~IFMenuRow1
        REL(5)  ~IFMenuRow2                      * D961C  006 ~IFMenuRow2
        REL(5)  ROMP_0B0_007                     * D9621  007 
        REL(5)  ROMP_0B0_008                     * D9626  008 
        REL(5)  ROMP_0B0_009                     * D962B  009 
        REL(5)  ROMP_0B0_00A                     * D9630  00A 
        REL(5)  ROMP_0B0_00B                     * D9635  00B 
        REL(5)  ROMP_0B0_00C                     * D963A  00C 
        REL(5)  ROMP_0B0_00D                     * D963F  00D 
        REL(5)  ROMP_0B0_00E                     * D9644  00E 
        REL(5)  ROMP_0B0_00F                     * D9649  00F 
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
        REL(5)  ROMP_0B0_022                     * D96A8  022 
        REL(5)  ROMP_0B0_023                     * D96AD  023 
        REL(5)  ROMP_0B0_024                     * D96B2  024 
        REL(5)  ROMP_0B0_025                     * D96B7  025 
        REL(5)  ROMP_0B0_026                     * D96BC  026 
        REL(5)  ROMP_0B0_027                     * D96C1  027 
        REL(5)  ROMP_0B0_028                     * D96C6  028 
        REL(5)  ROMP_0B0_029                     * D96CB  029 
        REL(5)  ROMP_0B0_02A                     * D96D0  02A 
        REL(5)  ROMP_0B0_02B                     * D96D5  02B 
        REL(5)  ROMP_0B0_02C                     * D96DA  02C 
        REL(5)  ROMP_0B0_02D                     * D96DF  02D 
        REL(5)  ROMP_0B0_02E                     * D96E4  02E 
        REL(5)  ROMP_0B0_02F                     * D96E9  02F 
        REL(5)  ROMP_0B0_030                     * D96EE  030 
        REL(5)  ROMP_0B0_031                     * D96F3  031 
        REL(5)  ROMP_0B0_032                     * D96F8  032 
        REL(5)  ROMP_0B0_033                     * D96FD  033 
        REL(5)  ROMP_0B0_034                     * D9702  034 
        REL(5)  ROMP_0B0_035                     * D9707  035 
        REL(5)  ROMP_0B0_036                     * D970C  036 
        REL(5)  ROMP_0B0_037                     * D9711  037 
        REL(5)  ROMP_0B0_038                     * D9716  038 
        REL(5)  ROMP_0B0_039                     * D971B  039 
        REL(5)  ROMP_0B0_03A                     * D9720  03A 
        REL(5)  ROMP_0B0_03B                     * D9725  03B 
        REL(5)  ROMP_0B0_03C                     * D972A  03C 
        REL(5)  ROMP_0B0_03D                     * D972F  03D 
        REL(5)  ROMP_0B0_03E                     * D9734  03E 
        REL(5)  ROMP_0B0_03F                     * D9739  03F 
        REL(5)  ROMP_0B0_040                     * D973E  040 
        REL(5)  ROMP_0B0_041                     * D9743  041 
        REL(5)  ROMP_0B0_042                     * D9748  042 
        REL(5)  ROMP_0B0_043                     * D974D  043 
        REL(5)  ROMP_0B0_044                     * D9752  044 
        REL(5)  ROMP_0B0_045                     * D9757  045 
        REL(5)  ROMP_0B0_046                     * D975C  046 
        REL(5)  ROMP_0B0_047                     * D9761  047 
        REL(5)  ROMP_0B0_048                     * D9766  048 
        REL(5)  ROMP_0B0_049                     * D976B  049 
        REL(5)  ROMP_0B0_04A                     * D9770  04A 
        REL(5)  ROMP_0B0_04B                     * D9775  04B 
        REL(5)  ROMP_0B0_04C                     * D977A  04C 
        REL(5)  ROMP_0B0_04D                     * D977F  04D 
        REL(5)  ROMP_0B0_04E                     * D9784  04E 
        REL(5)  ROMP_0B0_04F                     * D9789  04F 
        REL(5)  ROMP_0B0_050                     * D978E  050 
        REL(5)  ROMP_0B0_051                     * D9793  051 
        REL(5)  ROMP_0B0_052                     * D9798  052 
        REL(5)  ROMP_0B0_053                     * D979D  053 
        REL(5)  ROMP_0B0_054                     * D97A2  054 
        REL(5)  ROMP_0B0_055                     * D97A7  055 
        REL(5)  DoKeyEdit                        * D97AC  056 DoKeyEdit
        REL(5)  ROMP_0B0_057                     * D97B1  057 
        REL(5)  ROMP_0B0_058                     * D97B6  058 
        REL(5)  DoKeyCancel                      * D97BB  059 DoKeyCancel
        REL(5)  DoKeyOK                          * D97C0  05A DoKeyOK
        REL(5)  ROMP_0B0_05B                     * D97C5  05B 
        REL(5)  ROMP_0B0_05C                     * D97CA  05C 
        REL(5)  ROMP_0B0_05D                     * D97CF  05D 
        REL(5)  ROMP_0B0_05E                     * D97D4  05E 
        REL(5)  ROMP_0B0_05F                     * D97D9  05F 
        REL(5)  ROMP_0B0_060                     * D97DE  060 
        REL(5)  ROMP_0B0_061                     * D97E3  061 
        REL(5)  ROMP_0B0_062                     * D97E8  062 
        REL(5)  ROMP_0B0_063                     * D97ED  063 
        REL(5)  ROMP_0B0_064                     * D97F2  064 
        REL(5)  ROMP_0B0_065                     * D97F7  065 
        REL(5)  ROMP_0B0_066                     * D97FC  066 
        REL(5)  ROMP_0B0_067                     * D9801  067 
        REL(5)  ROMP_0B0_068                     * D9806  068 
        REL(5)  ROMP_0B0_069                     * D980B  069 
        REL(5)  ROMP_0B0_06A                     * D9810  06A 
        REL(5)  ROMP_0B0_06B                     * D9815  06B 
        REL(5)  ROMP_0B0_06C                     * D981A  06C 
        REL(5)  ROMP_0B0_06D                     * D981F  06D 
        REL(5)  ROMP_0B0_06E                     * D9824  06E 
        REL(5)  ROMP_0B0_06F                     * D9829  06F 
        REL(5)  ROMP_0B0_070                     * D982E  070 
        REL(5)  ROMP_0B0_071                     * D9833  071 
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
        REL(5)  ROMP_0B0_07F                     * D9879  07F 
        REL(5)  ROMP_0B0_080                     * D987E  080 
        REL(5)  ROMP_0B0_081                     * D9883  081 
        REL(5)  ROMP_0B0_082                     * D9888  082 
        REL(5)  ROMP_0B0_083                     * D988D  083 
        REL(5)  ROMP_0B0_084                     * D9892  084 
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
        REL(5)  ROMP_0B0_094                     * D98E2  094 
        REL(5)  ROMP_0B0_095                     * D98E7  095 
        REL(5)  ROMP_0B0_096                     * D98EC  096 
        REL(5)  ROMP_0B0_097                     * D98F1  097 
        REL(5)  ROMP_0B0_098                     * D98F6  098 
        REL(5)  ROMP_0B0_099                     * D98FB  099 
        REL(5)  ROMP_0B0_09A                     * D9900  09A 
        REL(5)  ROMP_0B0_09B                     * D9905  09B 
        REL(5)  ROMP_0B0_09C                     * D990A  09C 
        REL(5)  ROMP_0B0_09D                     * D990F  09D 
        REL(5)  ROMP_0B0_09E                     * D9914  09E 
        REL(5)  ROMP_0B0_09F                     * D9919  09F 
        REL(5)  ROMP_0B0_0A0                     * D991E  0A0 
        REL(5)  ROMP_0B0_0A1                     * D9923  0A1 
        REL(5)  ROMP_0B0_0A2                     * D9928  0A2 
        REL(5)  ROMP_0B0_0A3                     * D992D  0A3 
        REL(5)  ROMP_0B0_0A4                     * D9932  0A4 
        REL(5)  ROMP_0B0_0A5                     * D9937  0A5 
        REL(5)  ROMP_0B0_0A6                     * D993C  0A6 
        REL(5)  ROMP_0B0_0A7                     * D9941  0A7 
        REL(5)  ROMP_0B0_0A8                     * D9946  0A8 
        REL(5)  ROMP_0B0_0A9                     * D994B  0A9 
        REL(5)  ROMP_0B0_0AA                     * D9950  0AA 
        REL(5)  ROMP_0B0_0AB                     * D9955  0AB 
        REL(5)  ROMP_0B0_0AC                     * D995A  0AC 
        REL(5)  ROMP_0B0_0AD                     * D995F  0AD 
        REL(5)  ROMP_0B0_0AE                     * D9964  0AE 
        REL(5)  ROMP_0B0_0AF                     * D9969  0AF 
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
