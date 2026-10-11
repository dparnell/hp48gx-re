* HP 48GX ROM revision R, #8501B-#86FE3: Library part 0F0
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #8501B in the original ROM).
        RPL

* ROMPTR 0F0 07A
* refs (1): 82007
ROMP_0F0_07A:
        ::                                       * 8501B
          '                                      * 85020
          xWHERE                                 * 85025
          psh1&                                  * 8502A
          OBJ_5A0C2                              * 8502F
          psh                                    * 85034
          DUP                                    * 85039
          {}N                                    * 8503E
          '                                      * 85043
          OBJ_5A0FE                              * 85048
          BINT3                                  * 8504D
          ::N                                    * 85052
          SWAPDROP                               * 85057
          COLA_EVAL                              * 8505C
        ;                                        * 85061

* ROMPTR 0F0 07B
* refs (1): 82007
ROMP_0F0_07B:
        ::                                       * 85066
          SWAPINCOMP                             * 8506B
          BINT0                                  * 85070
          rot                                    * 85075
          DUP#0_DO                               * 8507A
          pullpsh1&                              * 8507F
          unrot                                  * 85084
          psh                                    * 85089
          #1-SWAP                                * 8508E
          symcomp                                * 85093
          psh1&                                  * 85098
          unrot                                  * 8509D
          psh                                    * 850A2
          LOOP                                   * 850A7
          DROP                                   * 850AC
          top&                                   * 850B1
          #1+DUP                                 * 850B6
          #1+                                    * 850BB
          Cr                                     * 850C0
          xWHERE                                 * 850C5
        ;                                        * 850CA

* ROMPTR 0F0 07C
* refs (1): 82007
ROMP_0F0_07C:
        ::                                       * 850CF
          #2-                                    * 850D4
          3UNROLL                                * 850D9
          BINT2                                  * 850DE
          unrot                                  * 850E3
          BINT2                                  * 850E8
          SWAP#1+                                * 850ED
          OBJ_5A0C2                              * 850F2
          SWAPDROP#1-                            * 850F7
          psh                                    * 850FC
          #1+DUP                                 * 85101
          dup                                    * 85106
          PTR     addt:                          * 8510B
          xWHERE                                 * 85110
          rot                                    * 85115
          pullrev                                * 8511A
          psh1&                                  * 8511F
          metaROTDUP                             * 85124
          over&                                  * 85129
          psh                                    * 8512E
          PTR     addt:                          * 85133
          xWHERE                                 * 85138
          psh&                                   * 8513D
          SWAPDROP#1-                            * 85142
          rot                                    * 85147
          #1-SWAP                                * 8514C
          psh1&rev                               * 85151
          psh                                    * 85156
          OBJ_5A1A3                              * 8515B
          pshm1                                  * 85160
          #1+DUP                                 * 85165
          {}N                                    * 8516A
          psh1&rev                               * 8516F
          psh                                    * 85174
          PTR     addt2:                         * 85179
          uncrunch                               * 8517E
          OBJ_5A0FE                              * 85183
          pshtop&                                * 85188
          top&                                   * 8518D
          Cr                                     * 85192
          xINTEGRAL                              * 85197
          COLA                                   * 8519C
          COMPEVAL                               * 851A1
        ;                                        * 851A6

* ROMPTR 0F0 07D
* refs (1): 82007
ROMP_0F0_07D:
        ::                                       * 851AB
          pullrev                                * 851B0
          SWAP#1+                                * 851B5
          #2-                                    * 851BA
          3UNROLL                                * 851BF
          BINT2                                  * 851C4
          unrot                                  * 851C9
          BINT2                                  * 851CE
          SWAP#1+                                * 851D3
          OBJ_5A0C2                              * 851D8
          SWAPDROP#1-                            * 851DD
          psh                                    * 851E2
          #1+DUP                                 * 851E7
          dup                                    * 851EC
          PTR     addt:                          * 851F1
          xWHERE                                 * 851F6
          rot                                    * 851FB
          pullrev                                * 85200
          psh1&                                  * 85205
          metaROTDUP                             * 8520A
          over&                                  * 8520F
          psh                                    * 85214
          PTR     addt:                          * 85219
          xWHERE                                 * 8521E
          psh&                                   * 85223
          SWAPDROP#1-                            * 85228
          rot                                    * 8522D
          #1-SWAP                                * 85232
          psh1&rev                               * 85237
          psh                                    * 8523C
          OBJ_5A1A3                              * 85241
          pshm1                                  * 85246
          #1+DUP                                 * 8524B
          {}N                                    * 85250
          psh1&rev                               * 85255
          psh                                    * 8525A
          PTR     addt2:                         * 8525F
          uncrunch                               * 85264
          OBJ_5A0FE                              * 85269
          pshtop&                                * 8526E
          top&                                   * 85273
          #1-SWAP                                * 85278
          pshm1                                  * 8527D
          top&                                   * 85282
          Cr                                     * 85287
          ä                                      * 8528C
          COLA                                   * 85291
          COMPEVAL                               * 85296
        ;                                        * 8529B

* ROMPTR 0F0 07E
* refs (1): 82007
ROMP_0F0_07E:
        ::                                       * 852A0
          ROMPTR  0F0 07F                        * 852A5
          case                                   * 852B0
          ::                                     * 852B5
            'R                                   * 852BA
            sto(bk,nm,s)                         * 852BF
          ;                                      * 852C4
          RDROPCOLA                              * 852C9
          OBJ_2157E                              * 852CE
        ;                                        * 852D3

* ROMPTR 0F0 07F
* refs (1): 82007
ROMP_0F0_07F:
        ::                                       * 852D8
          idntlamcase                            * 852DD
          ::                                     * 852E2
            SWAP                                 * 852E7
            CK&DISPATCH0                         * 852EC
            #8F_64D2E                            * 852F1
            OBJ_2160B                            * 852F6
            backup                               * 852FB
            OBJ_2160B                            * 85300
            BINT0                                * 85305
            ::                                   * 8530A
              RSWAP                              * 8530F
              RDUP                               * 85314
              'R                                 * 85319
              RDROP                              * 8531E
              RSWAP                              * 85323
              #0=case                            * 85328
              ::                                 * 8532D
                OVERSWAP                         * 85332
                DoBkpName(_);true                * 85337
                ROTSWAP                          * 8533C
              ;                                  * 85341
              SWAPTRUE                           * 85346
            ;                                    * 8534B
          ;                                      * 85350
          dup;r?:dq/sk                           * 85355
          ::                                     * 8535A
            SWAP                                 * 8535F
            CK&DISPATCH0                         * 85364
            #8F_64D2E                            * 85369
            OBJ_2160B                            * 8536E
            BINT0                                * 85373
            swap;false                           * 85378
          ;                                      * 8537D
          swap;false                             * 85382
        ;                                        * 85387

* ROMPTR 0F0 080
* refs (1): 82007
ROMP_0F0_080:
        ::                                       * 8538C
          COERCEDUP                              * 85391
          BINT33                                 * 85396
          #>case                                 * 8539B
          SETPORTNOTAV                           * 853A0
          OVER                                   * 853A5
          ::                                     * 853AA
            DNOTBAKcase                          * 853AF
            LIB>#                                * 853B4
            BAKNAME                              * 853B9
          ;                                      * 853BE
          DROP                                   * 853C3
          SWAP                                   * 853C8
          sto(bk,nm,s)                           * 853CD
        ;                                        * 853D2

* ROMPTR 0F0 081
* refs (1): 82007
ROMP_0F0_081:
        ::                                       * 853D7
          SWAP                                   * 853DC
          TAG>                                   * 853E1
          tok&                                   * 853E6
          tok=casedrop                           * 853EB
          ::                                     * 853F0
            ROMPTR  0F0 082                      * 853F5
            MINUSONE                             * 85400
          ;                                      * 85405
          palparse                               * 8540A
          ITE                                    * 8540F
          ::                                     * 85414
            DUPTYPEREAL?                         * 85419
            NOTcase                              * 8541E
            DROPSWAPDROP                         * 85423
            COERCEDUP                            * 85428
            BINT33                               * 8542D
            #>case                               * 85432
            DROPSWAPDROP                         * 85437
            '                                    * 8543C
            ROMPTR  0F0 082                      * 85441
            SWAP                                 * 8544C
            BINT2                                * 85451
            ::N                                  * 85456
            RDROPCOLA                            * 8545B
            EVAL                                 * 85460
          ;                                      * 85465
          ::                                     * 8546A
            3DROP                                * 8546F
            SWAPDROP                             * 85474
          ;                                      * 85479
          COLA                                   * 8547E
          OBJ_2178B                              * 85483
        ;                                        * 85488

* ROMPTR 0F0 082
* refs (1): 82007
ROMP_0F0_082:
        ::                                       * 8548D
          SWAP                                   * 85492
          IT                                     * 85497
          ::                                     * 8549C
            dup;ListOfNames?:dq/sk               * 854A1
            ::                                   * 854A6
              RDROP                              * 854AB
              COLA                               * 854B0
              OBJ_217A9                          * 854B5
            ;                                    * 854BA
          ;                                      * 854BF
          idntlamcase                            * 854C4
          OBJ_217A9                              * 854C9
          dup;r?:dq/sk                           * 854CE
          ::                                     * 854D3
            COERCE                               * 854D8
            COLA                                 * 854DD
            OBJ_217A9                            * 854E2
          ;                                      * 854E7
          RDROPCOLA                              * 854EC
          OBJ_2178B                              * 854F1
        ;                                        * 854F6

* ROMPTR 0F0 083
* refs (1): 82007
ROMP_0F0_083:
        ::                                       * 854FB
          NOTcase                                * 85500
          SETNONEXTERR                           * 85505
          ?ROMPTR>                               * 8550A
          DNOTBAKcase                            * 8550F
          NOP                                    * 85514
          BAK>OB                                 * 85519
          ?ROMPTR>                               * 8551E
        ;                                        * 85523

* ROMPTR 0F0 084
* refs (1): 82007
ROMP_0F0_084:
        ::                                       * 85528
          ?ACCPTR>                               * 8552D
          DUP                                    * 85532
          BAK>OB                                 * 85537
          TYPERRP?                               * 8553C
          NcaseTYPEERR                           * 85541
          OBJ_09730                              * 85546
          OBJ_72AD7                              * 8554B
          ERRSET                                 * 85550
          ::                                     * 85555
            NULLID                               * 8555A
            CREATE                               * 8555F
          ;                                      * 85564
          ERRTRAP                                * 85569
          DOAPWL                                 * 8556E
          OBJ_09699                              * 85573
          DOAPWL                                 * 85578
        ;                                        * 8557D

* ROMPTR 0F0 085
* refs (1): 82007
ROMP_0F0_085:
        ::                                       * 85582
          DUPTYPECSTR?                           * 85587
          ?SKIP                                  * 8558C
          ID>$                                   * 85591
          InitIOEnv                              * 85596
          KERMOPEN                               * 8559B
          CHR_F                                  * 855A0
          CHOOSE_INIT                            * 855A5
          '                                      * 855AA
          ID      HOMEDIR                        * 855AF
          ERRSET                                 * 855C4
          HomeInBkp(nm)                          * 855C9
          ERRTRAP                                * 855CE
          OBJ_2E772                              * 855D3
          3UNROLL                                * 855D8
          OBJ_70039                              * 855DD
          ERRSET                                 * 855E2
          OBJ_2EF2D                              * 855E7
          ERRTRAP                                * 855EC
          ::                                     * 855F1
            OBJ_09699                            * 855F6
            OBJ_70048                            * 855FB
            InitEnab                             * 85600
            OBJ_42309                            * 85605
            caseERRJMP                           * 8560A
            OBJ_2E763                            * 8560F
          ;                                      * 85614
          ABND                                   * 85619
          OBJ_09699                              * 8561E
          OBJ_70048                              * 85623
          InitEnab                               * 85628
          AllowPrlcdCl                           * 8562D
          NOTcase                                * 85632
          OBJ_2EFC8                              * 85637
        ;                                        * 8563C

* ROMPTR 0F0 086
* refs (1): 82007
ROMP_0F0_086:
        ::                                       * 85641
          COERCEDUP                              * 85646
          #1<>                                   * 8564B
          case                                   * 85650
          SETPORTNOTAV                           * 85655
          DUP                                    * 8565A
          PORTSTATUS                             * 8565F
          2DROP                                  * 85664
          AND                                    * 85669
          ANDNOTcase                             * 8566E
          SETPORTNOTAV                           * 85673
          SWAPINCOMP                             * 85678
          DUP#0=case                             * 8567D
          OBJ_0B5D4                              * 85682
          pshzer                                 * 85687
          BEGIN                                  * 8568C
          #1-SWAP                                * 85691
          ::                                     * 85696
            CK&DISPATCH1                         * 8569B
            BINT6                                * 856A0
            NOP                                  * 856A5
            BINT7                                * 856AA
            NOP                                  * 856AF
            BINT1                                * 856B4
            COERCE                               * 856B9
          ;                                      * 856BE
          psh1&                                  * 856C3
          #0=UNTIL                               * 856C8
          psh                                    * 856CD
          BEGIN                                  * 856D2
          OBJ_21B8E                              * 856D7
          over&                                  * 856DC
          #0=UNTIL                               * 856E1
          drop;dq                                * 856E6
          OBJ_0B5D4                              * 856EB
        ;                                        * 856F0

* ROMPTR 0F0 087
* refs (1): 82007
ROMP_0F0_087:
        ::                                       * 856F5
          ROMPART                                * 856FA
          NOTcase                                * 856FF
          BINT0                                  * 85704
          BINT0                                  * 85709
          SWAPDUP                                * 8570E
          TYPELIST?                              * 85713
          ITE                                    * 85718
          INNERCOMP                              * 8571D
          BINT1                                  * 85722
          BEGIN                                  * 85727
          #1-SWAP                                * 8572C
          ::                                     * 85731
            DUP                                  * 85736
            OBJ_0806D                            * 8573B
            NOTcaseDROP                          * 85740
            DUP                                  * 85745
            OBJ_72B22                            * 8574A
            MINUSONE                             * 8574F
            #=                                   * 85754
            case2DROP                            * 85759
            OVER                                 * 8575E
            ROMPARTNAME                          * 85763
            ITE                                  * 85768
            ID>$                                 * 8576D
            NULL$                                * 85772
            ROT                                  * 85777
            UNCOERCE                             * 8577C
            ROT                                  * 85781
            BINT3                                * 85786
            psh                                  * 8578B
            over&                                * 85790
          ;                                      * 85795
          #0=UNTIL                               * 8579A
          DROP                                   * 8579F
        ;                                        * 857A4

* ROMPTR 0F0 088
* refs (1): 82007
ROMP_0F0_088:
        ::                                       * 857A9
          MINUSONE                               * 857AE
          EQcasedrop                             * 857B3
          ROMPTR  0F0 08B                        * 857B8
          OVER                                   * 857C3
          TYPELIST?                              * 857C8
          COLAITE                                * 857CD
          ROMPTR  0F0 08A                        * 857D2
          ROMPTR  0F0 089                        * 857DD
        ;                                        * 857E8

* ROMPTR 0F0 089
* refs (1): 82007
ROMP_0F0_089:
        ::                                       * 857ED
          DUP#0=                                 * 857F2
          ITE                                    * 857F7
          ::                                     * 857FC
            DROP                                 * 85801
            RclBkp0(nm)?                         * 85806
          ;                                      * 8580B
          RclBkp12(nm,s)?                        * 85810
          ROMPTR  0F0 083                        * 85815
        ;                                        * 85820

* ROMPTR 0F0 08A
* refs (1): 82007
ROMP_0F0_08A:
        ::                                       * 85825
          OVER                                   * 8582A
          dvarlsBIND                             * 8582F
          SWAP                                   * 85834
          CARCOMP                                * 85839
          SWAP                                   * 8583E
          ROMPTR  0F0 089                        * 85843
          1GETABND                               * 8584E
          DUPLENCOMP                             * 85853
          #1=                                    * 85858
          caseDROP                               * 8585D
          rcl(di,li)?                            * 85862
          ROMPTR  0F0 083                        * 85867
        ;                                        * 85872

* ROMPTR 0F0 08B
* refs (1): 82007
ROMP_0F0_08B:
        ::                                       * 85877
          BINT34                                 * 8587C
          {                                      * 85881
            LAM     'portn                       * 85886
          }                                      * 85899
          BIND                                   * 8589E
          BEGIN                                  * 858A3
          LAM     'portn                         * 858A8
          #1-                                    * 858BB
          DUP                                    * 858C0
          '                                      * 858C5
          LAM     'portn                         * 858CA
          STO                                    * 858DD
          X@                                     * 858E2
          casedrop                               * 858E7
          ::                                     * 858EC
            LAM     'portn                       * 858F1
            ABND                                 * 85904
            RDROPCOLA                            * 85909
            ROMPTR  0F0 088                      * 8590E
          ;                                      * 85919
          LAM     'portn                         * 8591E
          #0=                                    * 85931
          UNTIL                                  * 85936
          ABND                                   * 8593B
          '                                      * 85940
          xRCL                                   * 85945
          COLA                                   * 8594A
          EvalNoCK                               * 8594F
        ;                                        * 85954

* ROMPTR 0F0 08C
* refs (1): 82007
ROMP_0F0_08C:
        ::                                       * 85959
          MINUSONE                               * 8595E
          EQcasedrop                             * 85963
          ROMPTR  0F0 08D                        * 85968
          ROMPTR  0F0 091                        * 85973
          COLA                                   * 8597E
          EVAL                                   * 85983
        ;                                        * 85988

* ROMPTR 0F0 08D
* refs (1): 82007
ROMP_0F0_08D:
        ::                                       * 8598D
          BINT34                                 * 85992
          {                                      * 85997
            LAM     'portn                       * 8599C
          }                                      * 859AF
          BIND                                   * 859B4
          BEGIN                                  * 859B9
          LAM     'portn                         * 859BE
          #1-                                    * 859D1
          DUP                                    * 859D6
          '                                      * 859DB
          LAM     'portn                         * 859E0
          STO                                    * 859F3
          X@                                     * 859F8
          casedrop                               * 859FD
          ::                                     * 85A02
            LAM     'portn                       * 85A07
            ABND                                 * 85A1A
            RDROPCOLA                            * 85A1F
            ROMPTR  0F0 08C                      * 85A24
          ;                                      * 85A2F
          LAM     'portn                         * 85A34
          #0=                                    * 85A47
          UNTIL                                  * 85A4C
          ABND                                   * 85A51
          '                                      * 85A56
          xEVAL                                  * 85A5B
          COLA                                   * 85A60
          EvalNoCK                               * 85A65
        ;                                        * 85A6A

* ROMPTR 0F0 08E
* refs (1): 82007
ROMP_0F0_08E:
        ::                                       * 85A6F
          MINUSONE                               * 85A74
          EQcasedrop                             * 85A79
          ROMPTR  0F0 08F                        * 85A7E
          DUP#0=                                 * 85A89
          ITE                                    * 85A8E
          ::                                     * 85A93
            DROP                                 * 85A98
            PurgeBkp0(nm)                        * 85A9D
          ;                                      * 85AA2
          PurgeBkp12(nm,s)                       * 85AA7
        ;                                        * 85AAC

* ROMPTR 0F0 08F
* refs (1): 82007
ROMP_0F0_08F:
        ::                                       * 85AB1
          BINT34                                 * 85AB6
          {                                      * 85ABB
            LAM     'portn                       * 85AC0
          }                                      * 85AD3
          BIND                                   * 85AD8
          BEGIN                                  * 85ADD
          LAM     'portn                         * 85AE2
          #1-                                    * 85AF5
          DUP                                    * 85AFA
          '                                      * 85AFF
          LAM     'portn                         * 85B04
          STO                                    * 85B17
          X@                                     * 85B1C
          casedrop                               * 85B21
          ::                                     * 85B26
            LAM     'portn                       * 85B2B
            ABND                                 * 85B3E
            RDROPCOLA                            * 85B43
            ROMPTR  0F0 08E                      * 85B48
          ;                                      * 85B53
          LAM     'portn                         * 85B58
          #0=                                    * 85B6B
          UNTIL                                  * 85B70
          ABND                                   * 85B75
          '                                      * 85B7A
          xPURGE                                 * 85B7F
          COLA                                   * 85B84
          EvalNoCK                               * 85B89
        ;                                        * 85B8E

* ROMPTR 0F0 090
* refs (1): 82007
ROMP_0F0_090:
        ::                                       * 85B93
          pshzer                                 * 85B98
          BEGIN                                  * 85B9D
          #1-SWAP                                * 85BA2
          OBJ_72B22                              * 85BA7
          DUP                                    * 85BAC
          MINUSONE                               * 85BB1
          #=                                     * 85BB6
          ITE                                    * 85BBB
          ::                                     * 85BC0
            DROP                                 * 85BC5
            SWAPDROP#1-                          * 85BCA
            SWAPDROP#1-                          * 85BCF
          ;                                      * 85BD4
          ::                                     * 85BD9
            UNCOERCE                             * 85BDE
            psh1&                                * 85BE3
            pullpsh1&                            * 85BE8
            pullpsh1&                            * 85BED
          ;                                      * 85BF2
          #0=UNTIL                               * 85BF7
          DROP                                   * 85BFC
        ;                                        * 85C01

* ROMPTR 0F0 091
* refs (1): 82007
ROMP_0F0_091:
        ::                                       * 85C06
          ROMPTR  0F0 088                        * 85C0B
          ::                                     * 85C16
            CODE                                 * 85C1B  14 nibbles
              LC(5)   DOEXT1                     * 85C25
              GOVLNG  L_27270                    * 85C2C
            ENDCODE                              * 85C33
            SKIP                                 * 85C33
            OBJ_71BB6                            * 85C38
            NOP                                  * 85C3D
            TOTEMPOB                             * 85C42
            DUP                                  * 85C47
            BAKNAME                              * 85C4C
            DROP                                 * 85C51
            CODE                                 * 85C56  73 nibbles
              C=DAT1  A                          * 85C60
              D1=D1+  5                          * 85C63
              D=D+1   A                          * 85C66
              CD1EX                              * 85C68
              D1=D1+  5                          * 85C6B
              A=0     A                          * 85C6E
              A=DAT1  B                          * 85C70
              ?A=0    A                          * 85C73
              GOYES   L_85C7A                    * 85C76
              A=A+1   A                          * 85C78
L_85C7A:
              A=A+1   A                          * 85C7A
              A=A+A   A                          * 85C7C
              D1=C                               * 85C7E
              A=A+CON A,10                       * 85C81
              C=DAT1  A                          * 85C87
              CD1EX                              * 85C8A
              RSTK=C                             * 85C8D
              D1=D1+  5                          * 85C8F
              C=DAT1  A                          * 85C92
              C=C+A   A                          * 85C95
              DAT1=C  A                          * 85C97
              C=RSTK                             * 85C9A
              D1=C                               * 85C9C
              A=DAT0  A                          * 85C9F
              D0=D0+  5                          * 85CA2
              PC=(A)                             * 85CA5
            ENDCODE                              * 85CA9
          ;                                      * 85CA9
          ?ACCPTR>                               * 85CAE
          TRUE                                   * 85CB3
          ROMPTR  0F0 083                        * 85CB8
        ;                                        * 85CC3

* ROMPTR 0F0 092
* refs (1): 82007
ROMP_0F0_092:
        ::                                       * 85CC8
          CK2NOLASTWD                            * 85CCD
          BINT2                                  * 85CD2
          nmetasyms                              * 85CD7
          SWAP                                   * 85CDC
          symcomp                                * 85CE1
          SWAPcompSWAP                           * 85CE6
          ChkExpr1Name                           * 85CEB
          SWAP                                   * 85CF0
          BINT2                                  * 85CF5
          Cr                                     * 85CFA
          xDER                                   * 85CFF
        ;                                        * 85D04

* ROMPTR 0F0 093
* refs (1): 82007
ROMP_0F0_093:
        ::                                       * 85D09
          CK4NOLASTWD                            * 85D0E
          BINT4                                  * 85D13
          nmetasyms                              * 85D18
          symcomp                                * 85D1D
          SWAPcompSWAP                           * 85D22
          ChkExpr1Name                           * 85D27
          BINT2                                  * 85D2C
          5ROLL                                  * 85D31
          5ROLL                                  * 85D36
          2SINNERtop&                            * 85D3B
          pshtop&                                * 85D40
          Cr                                     * 85D45
          xINTEGRAL                              * 85D4A
        ;                                        * 85D4F

* ROMPTR 0F0 094
* refs (1): 82007
ROMP_0F0_094:
        ::                                       * 85D54
          CK4NOLASTWD                            * 85D59
          BINT4                                  * 85D5E
          nmetasyms                              * 85D63
          symcomp                                * 85D68
          4ROLL                                  * 85D6D
          symcomp                                * 85D72
          ChkExpr1Name                           * 85D77
          SWAP                                   * 85D7C
          4ROLL                                  * 85D81
          4ROLL                                  * 85D86
          2SINNERtop&                            * 85D8B
          get1                                   * 85D90
          SWAP#1+                                * 85D95
          #1+                                    * 85D9A
          Cr                                     * 85D9F
          ä                                      * 85DA4
        ;                                        * 85DA9

* ROMPTR 0F0 095
* refs (1): 82007
ROMP_0F0_095:
        ::                                       * 85DAE
          CK3NOLASTWD                            * 85DB3
          BINT3                                  * 85DB8
          nmetasyms                              * 85DBD
          3PICK                                  * 85DC2
          TYPEREAL?                              * 85DC7
          ITE                                    * 85DCC
          ::                                     * 85DD1
            ROT                                  * 85DD6
            %0<>                                 * 85DDB
            ?SKIP                                * 85DE0
            SWAP                                 * 85DE5
            DROP                                 * 85DEA
          ;                                      * 85DEF
          xIFTE                                  * 85DF4
        ;                                        * 85DF9

* ROMPTR 0F0 096
* refs (1): 82007
ROMP_0F0_096:
        ::                                       * 85DFE
          CK1NOLASTWD                            * 85E03
          BINT1                                  * 85E08
          nmetasyms                              * 85E0D
          symcomp                                * 85E12
          BINT1                                  * 85E17
          Cr                                     * 85E1C
          xQUOTE                                 * 85E21
        ;                                        * 85E26

* ROMPTR 0F0 097
* refs (1): 82007
ROMP_0F0_097:
        ::                                       * 85E2B
          {'dvar}                                * 85E30
          BIND                                   * 85E35
          0LASTOWDOB!                            * 85E3A
          CK1NOLASTWD                            * 85E3F
          DEPTH                                  * 85E44
          1GETLAM                                * 85E49
          #>?SKIP                                * 85E4E
          SETSTACKERR                            * 85E53
          SINNER                                 * 85E58
          DROP                                   * 85E5D
          DUP                                    * 85E62
          CK&DISPATCH0                           * 85E67
          BINT6                                  * 85E6C
          OBJ_1F6E0                              * 85E71
          BINT7                                  * 85E76
          OBJ_1F6E0                              * 85E7B
          BINT15                                 * 85E80
          ::                                     * 85E85
            OBJ_1F870                            * 85E8A
            OBJ_26F34                            * 85E8F
            DROP                                 * 85E94
            COLA_EVAL                            * 85E99
          ;                                      * 85E9E
        ;                                        * 85EA3

* ROMPTR 0F0 098
* refs (1): 82007
ROMP_0F0_098:
        ::                                       * 85EA8
          OBJ_57022                              * 85EAD
          ::                                     * 85EB2
            psh                                  * 85EB7
            OBJ_56BEB                            * 85EBC
            top&Cr                               * 85EC1
            x*                                   * 85EC6
          ;                                      * 85ECB
          psh                                    * 85ED0
          MetaConcase                            * 85ED5
          ::                                     * 85EDA
            derprod1                             * 85EDF
            OBJ_56BFF                            * 85EE4
          ;                                      * 85EE9
          dup                                    * 85EEE
          metaROTDUP                             * 85EF3
          rot                                    * 85EF8
          derprod1                               * 85EFD
          unrot                                  * 85F02
          psh                                    * 85F07
          OBJ_56BEB                              * 85F0C
          2top&                                  * 85F11
          addt*                                  * 85F16
          Cr                                     * 85F1B
          x+                                     * 85F20
        ;                                        * 85F25

* ROMPTR 0F0 099
* refs (1): 82007
ROMP_0F0_099:
        ::                                       * 85F2A
          OBJ_57022                              * 85F2F
          ::                                     * 85F34
            NDROP                                * 85F39
            OBJ_56BEB                            * 85F3E
            SYMBN                                * 85F43
          ;                                      * 85F48
          OBJ_56D01                              * 85F4D
          psh                                    * 85F52
          MetaConcase                            * 85F57
          ::                                     * 85F5C
            NDROP                                * 85F61
            OBJ_56BFF                            * 85F66
          ;                                      * 85F6B
          OBJ_56D01                              * 85F70
          ABND                                   * 85F75
          top&Cr                                 * 85F7A
          x+                                     * 85F7F
        ;                                        * 85F84

* ROMPTR 0F0 09A
* refs (1): 82007
ROMP_0F0_09A:
        ::                                       * 85F89
          OBJ_57022                              * 85F8E
          ::                                     * 85F93
            NDROP                                * 85F98
            OBJ_56BEB                            * 85F9D
            Cr                                   * 85FA2
            xNEG                                 * 85FA7
          ;                                      * 85FAC
          OBJ_56D01                              * 85FB1
          psh                                    * 85FB6
          MetaConcase                            * 85FBB
          ::                                     * 85FC0
            NDROP                                * 85FC5
            OBJ_56BFF                            * 85FCA
          ;                                      * 85FCF
          OBJ_56D01                              * 85FD4
          ABND                                   * 85FD9
          top&Cr                                 * 85FDE
          x-                                     * 85FE3
        ;                                        * 85FE8

* ROMPTR 0F0 09B
* refs (1): 82007
ROMP_0F0_09B:
        ::                                       * 85FED
          OBJ_57022                              * 85FF2
          ::                                     * 85FF7
            derquot                              * 85FFC
            ABND                                 * 86001
            Cr                                   * 86006
            xNEG                                 * 8600B
          ;                                      * 86010
          psh                                    * 86015
          MetaConcase                            * 8601A
          ::                                     * 8601F
            derprod1                             * 86024
            drpmeta/                             * 86029
            OBJ_56BFF                            * 8602E
          ;                                      * 86033
          dup                                    * 86038
          metaROTDUP                             * 8603D
          rot                                    * 86042
          derprod1                               * 86047
          drpmeta/                               * 8604C
          unrot                                  * 86051
          derquot                                * 86056
          ABND                                   * 8605B
          top&Cr                                 * 86060
          x-                                     * 86065
        ;                                        * 8606A

* ROMPTR 0F0 09D
* refs (2): 82007 82007
ROMP_0F0_09D:
        ::                                       * 8606F
          OBJ_56CD1                              * 86074
          pshzerpsharg                           * 86079
          OBJ_56D01                              * 8607E
          psh                                    * 86083
          OBJ_56BEB                              * 86088
          top&Cr                                 * 8608D
          x=                                     * 86092
        ;                                        * 86097

* ROMPTR 0F0 09E
* refs (1): 82007
ROMP_0F0_09E:
        ::                                       * 8609C
          3PICK                                  * 860A1
          OVER                                   * 860A6
          CARCOMP                                * 860AB
          EQUALcase                              * 860B0
          easyabs                                * 860B5
          OBJ_57045                              * 860BA
          OBJ_56BEB                              * 860BF
          dup                                    * 860C4
          metaROTDUP                             * 860C9
          unrot                                  * 860CE
          PTR     addt2:                         * 860D3
          xCONJ                                  * 860D8
          x*                                     * 860DD
          top&                                   * 860E2
          unrot                                  * 860E7
          dup                                    * 860EC
          ROTUntop&                              * 860F1
          {                                      * 860F6
            xCONJ                                * 860FB
            x*                                   * 86100
            x+                                   * 86105
          }                                      * 8610A
          INNERtop&                              * 8610F
          pshtop&                                * 86114
          top&                                   * 86119
          {                                      * 8611E
            xABS                                 * 86123
            %2                                   * 86128
            x*                                   * 8612D
            x/                                   * 86132
          }                                      * 86137
          INNERtop&                              * 8613C
          SYMBN                                  * 86141
        ;                                        * 86146

* ROMPTR 0F0 09F
* refs (1): 82007
ROMP_0F0_09F:
        ::                                       * 8614B
          OBJ_57045                              * 86150
          psh                                    * 86155
          %1                                     * 8615A
          pshm1                                  * 8615F
          {                                      * 86164
            %2                                   * 86169
            x^                                   * 8616E
            x-                                   * 86173
            xSQRT                                * 86178
            xINV                                 * 8617D
            xNEG                                 * 86182
          }                                      * 86187
          INNERtop&                              * 8618C
          top&                                   * 86191
          OBJ_56BC3                              * 86196
        ;                                        * 8619B

* ROMPTR 0F0 0A0
* refs (1): 82007
ROMP_0F0_0A0:
        ::                                       * 861A0
          OBJ_57045                              * 861A5
          OBJ_56BEB                              * 861AA
          psh                                    * 861AF
          {                                      * 861B4
            %1                                   * 861B9
            x-                                   * 861BE
            xSQRT                                * 861C3
          }                                      * 861C8
          INNERtop&                              * 861CD
          dup                                    * 861D2
          ROTDROP                                * 861D7
          '                                      * 861DC
          x+                                     * 861E1
          3UNROLL                                * 861E6
          PTR     addt2:                         * 861EB
          x*                                     * 861F0
          x/                                     * 861F5
          top&                                   * 861FA
          top&                                   * 861FF
          SYMBN                                  * 86204
        ;                                        * 86209

* ROMPTR 0F0 0A1
* refs (1): 82007
ROMP_0F0_0A1:
        ::                                       * 8620E
          OBJ_57045                              * 86213
          OBJ_56BEB                              * 86218
          %10                                    * 8621D
          '                                      * 86222
          xLN                                    * 86227
          BINT2                                  * 8622C
          unrot                                  * 86231
          addt*                                  * 86236
          pshtop&                                * 8623B
          top&                                   * 86240
          PTR     addt2:                         * 86245
          xALOG                                  * 8624A
          x*                                     * 8624F
          SYMBN                                  * 86254
        ;                                        * 86259

* ROMPTR 0F0 0A2
* refs (1): 82007
ROMP_0F0_0A2:
        ::                                       * 8625E
          OBJ_57045                              * 86263
          OBJ_56BEB                              * 86268
          pshtop&                                * 8626D
          PTR     addt:                          * 86272
          x/                                     * 86277
          dup                                    * 8627C
          top&                                   * 86281
          {                                      * 86286
            xCONJ                                * 8628B
            x-                                   * 86290
            %2                                   * 86295
            xi                                   * 8629A
            x*                                   * 8629F
            x/                                   * 862A4
          }                                      * 862A9
          INNERtop&                              * 862AE
          OBJ_56C72                              * 862B3
          SYMBN                                  * 862B8
        ;                                        * 862BD

* ROMPTR 0F0 0A3
* refs (1): 82007
ROMP_0F0_0A3:
        ::                                       * 862C2
          OBJ_57045                              * 862C7
          %1                                     * 862CC
          pshm1                                  * 862D1
          {                                      * 862D6
            %2                                   * 862DB
            x^                                   * 862E0
            x-                                   * 862E5
            xSQRT                                * 862EA
            xINV                                 * 862EF
          }                                      * 862F4
          INNERtop&                              * 862F9
          top&                                   * 862FE
          OBJ_56BC3                              * 86303
        ;                                        * 86308

* ROMPTR 0F0 0A4
* refs (1): 82007
ROMP_0F0_0A4:
        ::                                       * 8630D
          OBJ_57045                              * 86312
          OBJ_56BEB                              * 86317
          psh                                    * 8631C
          %1                                     * 86321
          pshm1                                  * 86326
          2top&                                  * 8632B
          {                                      * 86330
            %2                                   * 86335
            x^                                   * 8633A
            x+                                   * 8633F
            xSQRT                                * 86344
            x/                                   * 86349
          }                                      * 8634E
          INNERtop&                              * 86353
          SYMBN                                  * 86358
        ;                                        * 8635D

* ROMPTR 0F0 0A5
* refs (1): 82007
ROMP_0F0_0A5:
        ::                                       * 86362
          OBJ_57045                              * 86367
          %1                                     * 8636C
          pshm1                                  * 86371
          {                                      * 86376
            %2                                   * 8637B
            x^                                   * 86380
            x+                                   * 86385
            xINV                                 * 8638A
          }                                      * 8638F
          INNERtop&                              * 86394
          top&                                   * 86399
          OBJ_56BC3                              * 8639E
        ;                                        * 863A3

* ROMPTR 0F0 0A6
* refs (1): 82007
ROMP_0F0_0A6:
        ::                                       * 863A8
          OBJ_57045                              * 863AD
          OBJ_56BEB                              * 863B2
          psh                                    * 863B7
          %1                                     * 863BC
          pshm1                                  * 863C1
          2top&                                  * 863C6
          {                                      * 863CB
            %2                                   * 863D0
            x^                                   * 863D5
            x-                                   * 863DA
            x/                                   * 863DF
          }                                      * 863E4
          INNERtop&                              * 863E9
          SYMBN                                  * 863EE
        ;                                        * 863F3

* ROMPTR 0F0 0A7
* refs (1): 82007
ROMP_0F0_0A7:
        ::                                       * 863F8
          OBJ_57045                              * 863FD
          PTR     addt2:                         * 86402
          xSIN                                   * 86407
          xNEG                                   * 8640C
          OBJ_56B9B                              * 86411
        ;                                        * 86416

* ROMPTR 0F0 0A8
* refs (1): 82007
ROMP_0F0_0A8:
        ::                                       * 8641B
          OBJ_57045                              * 86420
          OBJ_56BEB                              * 86425
          psh                                    * 8642A
          PTR     addt:                          * 8642F
          xSINH                                  * 86434
          pshtop&                                * 86439
          Cr                                     * 8643E
          x*                                     * 86443
        ;                                        * 86448

* ROMPTR 0F0 0A9
* refs (1): 82007
ROMP_0F0_0A9:
        ::                                       * 8644D
          OBJ_57045                              * 86452
          OBJ_56BEB                              * 86457
          pshtop&                                * 8645C
          PTR     addt2:                         * 86461
          xEXP                                   * 86466
          x*                                     * 8646B
          SYMBN                                  * 86470
        ;                                        * 86475

* ROMPTR 0F0 0AA
* refs (1): 82007
ROMP_0F0_0AA:
        ::                                       * 8647A
          OBJ_57045                              * 8647F
          OBJ_56BEB                              * 86484
          metaneg                                * 86489
          pshtop&                                * 8648E
          %2                                     * 86493
          SWAP#1+                                * 86498
          PTR     addt2:                         * 8649D
          x^                                     * 864A2
          x/                                     * 864A7
          SYMBN                                  * 864AC
        ;                                        * 864B1

* ROMPTR 0F0 0AB
* refs (1): 82007
ROMP_0F0_0AB:
        ::                                       * 864B6
          OBJ_57045                              * 864BB
          OBJ_56BEB                              * 864C0
          pshtop&                                * 864C5
          Cr                                     * 864CA
          x/                                     * 864CF
        ;                                        * 864D4

* ROMPTR 0F0 0AC
* refs (1): 82007
ROMP_0F0_0AC:
        ::                                       * 864D9
          OBJ_57045                              * 864DE
          OBJ_56BEB                              * 864E3
          pshtop&                                * 864E8
          {                                      * 864ED
            %1                                   * 864F2
            x+                                   * 864F7
            x/                                   * 864FC
          }                                      * 86501
          INNERtop&                              * 86506
          SYMBN                                  * 8650B
        ;                                        * 86510

* ROMPTR 0F0 0AD
* refs (1): 82007
ROMP_0F0_0AD:
        ::                                       * 86515
          OBJ_57045                              * 8651A
          OBJ_56BEB                              * 8651F
          pshtop&                                * 86524
          {                                      * 86529
            %10                                  * 8652E
            xLN                                  * 86533
            x*                                   * 86538
            x/                                   * 8653D
          }                                      * 86542
          INNERtop&                              * 86547
          SYMBN                                  * 8654C
        ;                                        * 86551

* ROMPTR 0F0 0AE
* refs (1): 82007
ROMP_0F0_0AE:
        ::                                       * 86556
          OBJ_56CD1                              * 8655B
          #1-SWAP                                * 86560
          1GETSWAP                               * 86565
          'xDER                                  * 8656A
          BINT3                                  * 8656F
          SYMBN                                  * 86574
          pshm1                                  * 86579
          #1-SWAP                                * 8657E
          1ABNDSWAP                              * 86583
          'xDER                                  * 86588
          BINT3                                  * 8658D
          SYMBN                                  * 86592
          SWAP#1+                                * 86597
          psh                                    * 8659C
          top&Cr                                 * 865A1
          xIFTE                                  * 865A6
        ;                                        * 865AB

* ROMPTR 0F0 0AF
* refs (1): 82007
ROMP_0F0_0AF:
        ::                                       * 865B0
          OBJ_57045                              * 865B5
          PTR     addt:                          * 865BA
          xCOS                                   * 865BF
          OBJ_56B9B                              * 865C4
        ;                                        * 865C9

* ROMPTR 0F0 0B0
* refs (1): 82007
ROMP_0F0_0B0:
        ::                                       * 865CE
          OBJ_57045                              * 865D3
          PTR     addt:                          * 865D8
          xCOSH                                  * 865DD
          psh                                    * 865E2
          OBJ_56BEB                              * 865E7
          top&Cr                                 * 865EC
          x*                                     * 865F1
        ;                                        * 865F6

* ROMPTR 0F0 0B1
* refs (1): 82007
ROMP_0F0_0B1:
        ::                                       * 865FB
          OBJ_57045                              * 86600
          %2                                     * 86605
          pshm1                                  * 8660A
          top&                                   * 8660F
          addt*                                  * 86614
          psh                                    * 86619
          OBJ_56BEB                              * 8661E
          top&Cr                                 * 86623
          x*                                     * 86628
        ;                                        * 8662D

* ROMPTR 0F0 0B2
* refs (1): 82007
ROMP_0F0_0B2:
        ::                                       * 86632
          OBJ_57045                              * 86637
          OBJ_56BEB                              * 8663C
          psh                                    * 86641
          %2                                     * 86646
          pshm1                                  * 8664B
          2top&                                  * 86650
          {                                      * 86655
            xSQRT                                * 8665A
            x*                                   * 8665F
            x/                                   * 86664
          }                                      * 86669
          INNERtop&                              * 8666E
          SYMBN                                  * 86673
        ;                                        * 86678

* ROMPTR 0F0 0B3
* refs (1): 82007
ROMP_0F0_0B3:
        ::                                       * 8667D
          OBJ_57045                              * 86682
          %1pshm1                                * 86687
          top&                                   * 8668C
          {                                      * 86691
            xTAN                                 * 86696
            %2                                   * 8669B
            x^                                   * 866A0
            x+                                   * 866A5
          }                                      * 866AA
          INNERtop&                              * 866AF
          OBJ_56B9B                              * 866B4
        ;                                        * 866B9

* ROMPTR 0F0 0B4
* refs (1): 82007
ROMP_0F0_0B4:
        ::                                       * 866BE
          OBJ_57045                              * 866C3
          OBJ_56BEB                              * 866C8
          pshtop&                                * 866CD
          {                                      * 866D2
            xCOSH                                * 866D7
            %2                                   * 866DC
            x^                                   * 866E1
            x/                                   * 866E6
          }                                      * 866EB
          INNERtop&                              * 866F0
          SYMBN                                  * 866F5
        ;                                        * 866FA

* ROMPTR 0F0 0B5
* refs (1): 82007
ROMP_0F0_0B5:
        ::                                       * 866FF
          OBJ_57022                              * 86704
          ::                                     * 86709
            D/D^Y                                * 8670E
            OBJ_56BFF                            * 86713
          ;                                      * 86718
          psh                                    * 8671D
          MetaConcase                            * 86722
          ::                                     * 86727
            D/D^X                                * 8672C
            OBJ_56BFF                            * 86731
          ;                                      * 86736
          dup                                    * 8673B
          metaROTDUP                             * 86740
          rot                                    * 86745
          D/D^X                                  * 8674A
          unrot                                  * 8674F
          D/D^Y                                  * 86754
          ABND                                   * 86759
          top&Cr                                 * 8675E
          x+                                     * 86763
        ;                                        * 86768

* ROMPTR 0F0 0B6
* refs (1): 82007
ROMP_0F0_0B6:
        ::                                       * 8676D
          psh                                    * 86772
          dup                                    * 86777
          OBJ_56D01                              * 8677C
          metaROTDUP                             * 86781
          roll2top&                              * 86786
          addt*                                  * 8678B
          over&                                  * 86790
          pshtop&                                * 86795
          {                                      * 8679A
            %1                                   * 8679F
            x-                                   * 867A4
            x^                                   * 867A9
            x*                                   * 867AE
          }                                      * 867B3
          INNERtop&                              * 867B8
        ;                                        * 867BD

* ROMPTR 0F0 0B7
* refs (1): 82007
ROMP_0F0_0B7:
        ::                                       * 867C2
          dup                                    * 867C7
          metaROTDUP                             * 867CC
          OBJ_56D01                              * 867D1
          rot                                    * 867D6
          PTR     addt:                          * 867DB
          xLN                                    * 867E0
          pshtop&                                * 867E5
          addt*                                  * 867EA
          over&                                  * 867EF
          pshtop&                                * 867F4
          PTR     addt2:                         * 867F9
          x^                                     * 867FE
          x*                                     * 86803
        ;                                        * 86808

* ROMPTR 0F0 0B8
* refs (1): 82007
ROMP_0F0_0B8:
        ::                                       * 8680D
          OBJ_56CD1                              * 86812
          DROP                                   * 86817
          SYMDERSTEP                             * 8681C
          SINNER                                 * 86821
          OBJ_56BEB                              * 86826
          SYMBN                                  * 8682B
        ;                                        * 86830

* ROMPTR 0F0 0B9
* refs (1): 82007
ROMP_0F0_0B9:
        ::                                       * 86835
          dvarlsBIND                             * 8683A
          OBJ_5A0C2                              * 8683F
          DROP                                   * 86844
          SYMBWHERE                              * 86849
          CK1NOLASTWD                            * 8684E
          BINT1                                  * 86853
          nmetasyms                              * 86858
          symcomp                                * 8685D
          1ABNDSWAP                              * 86862
          BINT2                                  * 86867
          Cr                                     * 8686C
          xDER                                   * 86871
        ;                                        * 86876

* ROMPTR 0F0 0BA
* refs (1): 82007
ROMP_0F0_0BA:
        ::                                       * 8687B
          dvarlsBIND                             * 86880
          dup                                    * 86885
          #2-                                    * 8688A
          3UNROLL                                * 8688F
          BINT2                                  * 86894
          psh                                    * 86899
          pshzerpsharg                           * 8689E
          NDROP                                  * 868A3
          dup                                    * 868A8
          PTR     addt2:                         * 868AD
          BINT3                                  * 868B2
          xWHERE                                 * 868B7
          1GETLAM                                * 868BC
          SWAP#1+                                * 868C1
          psh&                                   * 868C6
          top&                                   * 868CB
          PTR     addt2:                         * 868D0
          xDER                                   * 868D5
          x*                                     * 868DA
          psh                                    * 868DF
          dup                                    * 868E4
          #2-                                    * 868E9
          3UNROLL                                * 868EE
          BINT2                                  * 868F3
          psh                                    * 868F8
          larg                                   * 868FD
          NDROP                                  * 86902
          dup                                    * 86907
          PTR     addt2:                         * 8690C
          BINT3                                  * 86911
          xWHERE                                 * 86916
          1GETLAM                                * 8691B
          SWAP#1+                                * 86920
          psh&                                   * 86925
          top&                                   * 8692A
          PTR     addt2:                         * 8692F
          xDER                                   * 86934
          x*                                     * 86939
          PTR     addt:                          * 8693E
          x-                                     * 86943
          psh&                                   * 86948
          1GETABND                               * 8694D
          3PICK                                  * 86952
          2SINNER                                * 86957
          DROPSWAPDROP                           * 8695C
          EQUALcasedrop                          * 86961
          ::                                     * 86966
            NDROP                                * 8696B
            IMPLODE                              * 86970
          ;                                      * 86975
          4UNROLL                                * 8697A
          '                                      * 8697F
          xDER                                   * 86984
          3UNROLL                                * 86989
          #2+                                    * 8698E
          PTR     addt2:                         * 86993
          xINTEGRAL                              * 86998
          x+                                     * 8699D
          top&                                   * 869A2
          IMPLODE                                * 869A7
        ;                                        * 869AC

* ROMPTR 0F0 0BB
* refs (1): 82007
ROMP_0F0_0BB:
        ::                                       * 869B1
          OVER                                   * 869B6
          #2+PICK                                * 869BB
          OVER                                   * 869C0
          2SINNER                                * 869C5
          DROPSWAPDROP                           * 869CA
          EQUALcase                              * 869CF
          ::                                     * 869D4
            DROPNDROP                            * 869D9
            %0_2A2B4                             * 869DE
          ;                                      * 869E3
          ROT                                    * 869E8
          BINT2                                  * 869ED
          Cr                                     * 869F2
          xDER                                   * 869F7
          SWAP                                   * 869FC
          Cr                                     * 86A01
          ä                                      * 86A06
        ;                                        * 86A0B

* ROMPTR 0F0 0BC
* refs (1): 82007
ROMP_0F0_0BC:
        ::                                       * 86A10
          SWAP                                   * 86A15
          get1                                   * 86A1A
          4UNROLL                                * 86A1F
          SWAPROT                                * 86A24
          #1-UNROT                               * 86A29
          COLA                                   * 86A2E
          OBJ_56D1F                              * 86A33
        ;                                        * 86A38

* ROMPTR 0F0 0BD
* refs (1): 82007
ROMP_0F0_0BD:
        {                                        * 86A3D
          {RULES\<-T}                            * 86A42
          {RULES\T->}                            * 86A47
          {RULES\<-M}                            * 86A4C
          {RULES\M->}                            * 86A51
          {RULES\AF}                             * 86A56
          {RULES\<-->}                           * 86A5B
          {RULES\(<-}                            * 86A60
          {RULES\->)}                            * 86A65
          {RULES\<-A}                            * 86A6A
          {RULES\A->}                            * 86A6F
          {RULES\(())}                           * 86A74
          {RULES\-()}                            * 86A79
        }                                        * 86A7E

* ROMPTR 0F0 0BE
* refs (1): 82007
ROMP_0F0_0BE:
        {                                        * 86A83
          {RULES\<-T}                            * 86A88
          {RULES\T->}                            * 86A8D
          {RULES\<-M}                            * 86A92
          {RULES\M->}                            * 86A97
          {RULES\<-D}                            * 86A9C
          {RULES\D->}                            * 86AA1
          {RULES\(<-}                            * 86AA6
          {RULES\->)}                            * 86AAB
          {RULES\<-A}                            * 86AB0
          {RULES\A->}                            * 86AB5
          {RULES\<-->}                           * 86ABA
          {RULES\(())}                           * 86ABF
          {RULES\-()}                            * 86AC4
          {RULES\1/()}                           * 86AC9
          {RULES\L()}                            * 86ACE
        }                                        * 86AD3

* ROMPTR 0F0 0BF
* refs (1): 82007
ROMP_0F0_0BF:
        {                                        * 86AD8
          {RULES\1/()}                           * 86ADD
          {RULES\E()}                            * 86AE2
          {RULES\<-D}                            * 86AE7
          {RULES\D->}                            * 86AEC
          {RULES\<-A}                            * 86AF1
          {RULES\A->}                            * 86AF6
        }                                        * 86AFB

* ROMPTR 0F0 0C0
* refs (1): 82007
ROMP_0F0_0C0:
        {                                        * 86B00
          {RULES\1/()}                           * 86B05
          {RULES\E^}                             * 86B0A
          {RULES\->TRG}                          * 86B0F
          {RULES\D->}                            * 86B14
        }                                        * 86B19

* ROMPTR 0F0 0C1
* refs (1): 82007
ROMP_0F0_0C1:
        {                                        * 86B1E
          {RULES\-()}                            * 86B23
          {RULES\L*}                             * 86B28
          NullMenuKey                            * 86B2D
          {RULES\D->}                            * 86B32
        }                                        * 86B37

* ROMPTR 0F0 0C2
* refs (1): 82007
ROMP_0F0_0C2:
        {                                        * 86B3C
          {RULES\->()}                           * 86B41
        }                                        * 86B46

* ROMPTR 0F0 0C3
* refs (1): 82007
ROMP_0F0_0C3:
        {                                        * 86B4B
          {RULES\<-T}                            * 86B50
          {RULES\T->}                            * 86B55
        }                                        * 86B5A

* ROMPTR 0F0 0C4
* refs (1): 82007
ROMP_0F0_0C4:
        {                                        * 86B5F
          {RULES\->()}_59E81                     * 86B64
        }                                        * 86B69

* ROMPTR 0F0 0C5
* refs (1): 82007
ROMP_0F0_0C5:
        {                                        * 86B6E
          {RULES\->DEF}                          * 86B73
          {RULES\TRG*}                           * 86B78
        }                                        * 86B7D

* ROMPTR 0F0 0C6
* refs (1): 82007
ROMP_0F0_0C6:
        {                                        * 86B82
          {RULES\->DEF}                          * 86B87
        }                                        * 86B8C

* ROMPTR 0F0 0C7
* refs (1): 82007
ROMP_0F0_0C7:
        ::                                       * 86B91
          pshm1                                  * 86B96
          pshzerpsharg                           * 86B9B
          rot                                    * 86BA0
          DROP                                   * 86BA5
          OBJ_57676                              * 86BAA
          ITE                                    * 86BAF
          addtpsh                                * 86BB4
          psh1&rev                               * 86BB9
          rotswap                                * 86BBE
          top&                                   * 86BC3
          meta-                                  * 86BC8
          OBJ_5760D                              * 86BCD
        ;                                        * 86BD2

* ROMPTR 0F0 0C9
* refs (2): 82007 82007
ROMP_0F0_0C9:
        ::                                       * 86BD7
          pshm1                                  * 86BDC
          pshzerpsharg                           * 86BE1
          rot                                    * 86BE6
          DROP                                   * 86BEB
          OBJ_57676                              * 86BF0
          ITE                                    * 86BF5
          ::                                     * 86BFA
            SWAP#1+                              * 86BFF
            roll2top&                            * 86C04
            '                                    * 86C09
            x+                                   * 86C0E
          ;                                      * 86C13
          ::                                     * 86C18
            psh1&rev                             * 86C1D
            ROTUntop&                            * 86C22
            '                                    * 86C27
            x-                                   * 86C2C
          ;                                      * 86C31
          SWAP#1+                                * 86C36
          OBJ_5760D                              * 86C3B
        ;                                        * 86C40

* ROMPTR 0F0 0CA
* refs (1): 82007
ROMP_0F0_0CA:
        ::                                       * 86C45
          pshm1                                  * 86C4A
          pshzerpsharg                           * 86C4F
          rot                                    * 86C54
          DROP                                   * 86C59
          OBJ_57676                              * 86C5E
          ITE                                    * 86C63
          ::                                     * 86C68
            SWAP#1+                              * 86C6D
            roll2top&                            * 86C72
          ;                                      * 86C77
          ::                                     * 86C7C
            psh1&rev                             * 86C81
            rot                                  * 86C86
            pshtop&                              * 86C8B
          ;                                      * 86C90
          meta/                                  * 86C95
          OBJ_5760D                              * 86C9A
        ;                                        * 86C9F

* ROMPTR 0F0 0CB
* refs (1): 82007
ROMP_0F0_0CB:
        ::                                       * 86CA4
          pshm1                                  * 86CA9
          pshzerpsharg                           * 86CAE
          rot                                    * 86CB3
          DROP                                   * 86CB8
          OBJ_57676                              * 86CBD
          ITE                                    * 86CC2
          ::                                     * 86CC7
            SWAP#1+                              * 86CCC
            roll2top&                            * 86CD1
            '                                    * 86CD6
            x*                                   * 86CDB
          ;                                      * 86CE0
          ::                                     * 86CE5
            psh1&rev                             * 86CEA
            ROTUntop&                            * 86CEF
            '                                    * 86CF4
            x/                                   * 86CF9
          ;                                      * 86CFE
          SWAP#1+                                * 86D03
          OBJ_5760D                              * 86D08
        ;                                        * 86D0D

* ROMPTR 0F0 0CC
* refs (1): 82007
ROMP_0F0_0CC:
        ::                                       * 86D12
          pshm1                                  * 86D17
          pshzerpsharg                           * 86D1C
          rot                                    * 86D21
          DROP                                   * 86D26
          OBJ_57676                              * 86D2B
          case                                   * 86D30
          OBJ_5747D                              * 86D35
          psh1&rev                               * 86D3A
          rot                                    * 86D3F
          PTR     addt:                          * 86D44
          xLN                                    * 86D49
          PRSOL?                                 * 86D4E
          ?SKIP                                  * 86D53
          ::                                     * 86D58
            OBJ_57716                            * 86D5D
            OBJ_57874                            * 86D62
          ;                                      * 86D67
          pshtop&                                * 86D6C
          PTR     addt2:                         * 86D71
          xLN                                    * 86D76
          x/                                     * 86D7B
          OBJ_5760D                              * 86D80
        ;                                        * 86D85

* ROMPTR 0F0 0CD
* refs (1): 82007
ROMP_0F0_0CD:
        ::                                       * 86D8A
          addtpsh                                * 86D8F
          OVER                                   * 86D94
          num1=case                              * 86D99
          ::                                     * 86D9E
            DROPNDROP                            * 86DA3
            #1-SWAP                              * 86DA8
            COLA                                 * 86DAD
            OBJ_57324                            * 86DB2
          ;                                      * 86DB7
          num2=case                              * 86DBC
          ::                                     * 86DC1
            DROPNDROP                            * 86DC6
            psh                                  * 86DCB
            PTR     addt:                        * 86DD0
            xSQRT                                * 86DD5
            PRSOL?                               * 86DDA
            IT                                   * 86DDF
            OBJ_5760D                            * 86DE4
            OBJ_57856                            * 86DE9
            OBJ_5760D                            * 86DEE
          ;                                      * 86DF3
          DROP                                   * 86DF8
          rot                                    * 86DFD
          psh                                    * 86E02
          dup                                    * 86E07
          roll2top&                              * 86E0C
          PTR     addt2:                         * 86E11
          xINV                                   * 86E16
          x^                                     * 86E1B
          PRSOL?                                 * 86E20
          case                                   * 86E25
          ::                                     * 86E2A
            SWAPUnNDROP                          * 86E2F
            OBJ_5760D                            * 86E34
          ;                                      * 86E39
          OBJ_57716                              * 86E3E
          ROTUntop&                              * 86E43
          PTR     addt2:                         * 86E48
          x/                                     * 86E4D
          xEXP                                   * 86E52
          pshtop&                                * 86E57
          meta*                                  * 86E5C
          OBJ_5760D                              * 86E61
        ;                                        * 86E66

* ROMPTR 0F0 0CE
* refs (1): 82007
ROMP_0F0_0CE:
        ::                                       * 86E6B
          OBJ_57630                              * 86E70
          xLN                                    * 86E75
          OBJ_57716                              * 86E7A
          top&                                   * 86E7F
          meta+                                  * 86E84
          OBJ_5760D                              * 86E89
        ;                                        * 86E8E

* ROMPTR 0F0 0CF
* refs (1): 82007
ROMP_0F0_0CF:
        ::                                       * 86E93
          OBJ_57630                              * 86E98
          xASIN                                  * 86E9D
          OBJ_577C0                              * 86EA2
          OBJ_5781A                              * 86EA7
          OBJ_5760D                              * 86EAC
        ;                                        * 86EB1

* ROMPTR 0F0 0D0
* refs (1): 82007
ROMP_0F0_0D0:
        ::                                       * 86EB6
          OBJ_57630                              * 86EBB
          xACOS                                  * 86EC0
          OBJ_57856                              * 86EC5
          OBJ_57757                              * 86ECA
          OBJ_57874                              * 86ECF
          OBJ_5760D                              * 86ED4
        ;                                        * 86ED9

* ROMPTR 0F0 0D1
* refs (1): 82007
ROMP_0F0_0D1:
        ::                                       * 86EDE
          OBJ_57630                              * 86EE3
          xATAN                                  * 86EE8
          OBJ_577C0                              * 86EED
          OBJ_57874                              * 86EF2
          OBJ_5760D                              * 86EF7
        ;                                        * 86EFC

* ROMPTR 0F0 0D2
* refs (1): 82007
ROMP_0F0_0D2:
        ::                                       * 86F01
          OBJ_57630                              * 86F06
          xASINH                                 * 86F0B
          OBJ_576DF                              * 86F10
          OBJ_5781A                              * 86F15
          OBJ_5760D                              * 86F1A
        ;                                        * 86F1F

* ROMPTR 0F0 0D3
* refs (1): 82007
ROMP_0F0_0D3:
        ::                                       * 86F24
          OBJ_57630                              * 86F29
          xACOSH                                 * 86F2E
          OBJ_57856                              * 86F33
          OBJ_57716                              * 86F38
          OBJ_57874                              * 86F3D
          OBJ_5760D                              * 86F42
        ;                                        * 86F47

* ROMPTR 0F0 0D4
* refs (1): 82007
ROMP_0F0_0D4:
        ::                                       * 86F4C
          OBJ_57630                              * 86F51
          xATANH                                 * 86F56
          OBJ_576DF                              * 86F5B
          OBJ_57874                              * 86F60
          OBJ_5760D                              * 86F65
        ;                                        * 86F6A

* ROMPTR 0F0 0D5
* refs (1): 82007
ROMP_0F0_0D5:
        ::                                       * 86F6F
          OBJ_57630                              * 86F74
          xLOG                                   * 86F79
          OBJ_57716                              * 86F7E
          top&                                   * 86F83
          {                                      * 86F88
            %10                                  * 86F8D
            xLN                                  * 86F92
            x/                                   * 86F97
            x+                                   * 86F9C
          }                                      * 86FA1
          INNERtop&                              * 86FA6
          OBJ_5760D                              * 86FAB
        ;                                        * 86FB0

* ROMPTR 0F0 0D6
* refs (1): 82007
ROMP_0F0_0D6:
        ::                                       * 86FB5
          OBJ_57630                              * 86FBA
          xLNP1                                  * 86FBF
          OBJ_57716                              * 86FC4
          top&                                   * 86FC9
          meta+                                  * 86FCE
          OBJ_5760D                              * 86FD3
        ;                                        * 86FD8
        NIBHEX  1B92000                          * 86FDD  ±).
