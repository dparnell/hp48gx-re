* HP 48GX ROM revision R, #B7B7D-#BA575: Library part 0B5
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #B7B7D in the original ROM).
        RPL

* ROMPTR 0B5 0D8
* refs (1): B4B39
ROMP_0B5_0D8:
        ::                                       * B7B7D
          BINT2                                  * B7B82
          NTHCOMPDROP                            * B7B87
          DUP                                    * B7B8C
          MINUSONE                               * B7B91
          EQUAL                                  * B7B96
          casedrop                               * B7B9B
          NULL$                                  * B7BA0
        ;                                        * B7BA5

* ROMPTR 0B5 0D9
* refs (1): B4B39
ROMP_0B5_0D9:
        ::                                       * B7BAA
          CARCOMP                                * B7BAF
          Ticks>TOD                              * B7BB4
          ROMPTR  0B5 0A4                        * B7BB9
        ;                                        * B7BC4

* ROMPTR 0B5 0DA
* refs (1): B4B39
ROMP_0B5_0DA:
        ::                                       * B7BC9
          CARCOMP                                * B7BCE
          Ticks>Date                             * B7BD3
          ROMPTR  0B5 0A7                        * B7BD8
        ;                                        * B7BE3

* ROMPTR 0B5 0DB
* refs (1): B4B39
ROMP_0B5_0DB:
        ::                                       * B7BE8
          ::                                     * B7BED
            CARCOMP                              * B7BF2
            Ticks>Rpt                            * B7BF7
            ROMPTR  0B5 0C8                      * B7BFC
            OVER                                 * B7C07
            %<=                                  * B7C0C
            case                                 * B7C11
            ::                                   * B7C16
              ROMPTR  0B5 0C8                    * B7C1B
              %/                                 * B7C26
              BINT1                              * B7C2B
            ;                                    * B7C30
            ROMPTR  0B5 0CA                      * B7C35
            OVER                                 * B7C40
            %<=                                  * B7C45
            case                                 * B7C4A
            ::                                   * B7C4F
              ROMPTR  0B5 0CA                    * B7C54
              %/                                 * B7C5F
              BINT2                              * B7C64
            ;                                    * B7C69
            ROMPTR  0B5 0CC                      * B7C6E
            OVER                                 * B7C79
            %<=                                  * B7C7E
            case                                 * B7C83
            ::                                   * B7C88
              ROMPTR  0B5 0CC                    * B7C8D
              %/                                 * B7C98
              BINT3                              * B7C9D
            ;                                    * B7CA2
            ROMPTR  0B5 0CE                      * B7CA7
            OVER                                 * B7CB2
            %<=                                  * B7CB7
            case                                 * B7CBC
            ::                                   * B7CC1
              ROMPTR  0B5 0CE                    * B7CC6
              %/                                 * B7CD1
              BINT4                              * B7CD6
            ;                                    * B7CDB
            ROMPTR  0B5 0D0                      * B7CE0
            %/                                   * B7CEB
            BINT5                                * B7CF0
          ;                                      * B7CF5
          ROMPTR  0B5 0C6                        * B7CFA
          SWAP                                   * B7D05
          NTHCOMPDROP                            * B7D0A
        ;                                        * B7D0F

* ROMPTR 0B5 0DC
* refs (1): B4B39
ROMP_0B5_0DC:
        ::                                       * B7D14
          ALARMS@                                * B7D19
          NTHOF                                  * B7D1E
          DUP#0=csDROP                           * B7D23
          UNCOERCE                               * B7D28
          DELALARM                               * B7D2D
        ;                                        * B7D32

* ROMPTR 0B5 0DD
* refs (1): B4B39
ROMP_0B5_0DD:
        ::                                       * B7D37
          Exist@äDAT?                            * B7D3C
          NOTcase                                * B7D41
          MINUSONE                               * B7D46
          OBJ_2D252                              * B7D4B
        ;                                        * B7D50

* ROMPTR 0B5 0DE
* refs (1): B4B39
ROMP_0B5_0DE:
        ::                                       * B7D55
          ROMPTR  0B5 011                        * B7D5A
          STATCLST                               * B7D65
          å-                                     * B7D6A
        ;                                        * B7D6F

* ROMPTR 0B5 0DF
* refs (1): B4B39
ROMP_0B5_0DF:
        ::                                       * B7D74
          ChkReakäPAR                            * B7D79
          5UNROLL                                * B7D7E
          4DROP                                  * B7D83
          {                                      * B7D88
            xLINFIT                              * B7D8D
            ROMPTR  0B5 0F6                      * B7D92
            xLOGFIT                              * B7D9D
            ROMPTR  0B5 0F7                      * B7DA2
            xEXPFIT                              * B7DAD
            ROMPTR  0B5 0F8                      * B7DB2
            xPWRFIT                              * B7DBD
            ROMPTR  0B5 0F9                      * B7DC2
            xBESTFIT                             * B7DCD
            ROMPTR  0B5 0FA                      * B7DD2
          }                                      * B7DDD
          EQLookup                               * B7DE2
          DROP                                   * B7DE7
        ;                                        * B7DEC

* ROMPTR 0B5 0E0
* refs (1): B4B39
ROMP_0B5_0E0:
        ::                                       * B7DF1
          ChkReakäPAR                            * B7DF6
          3DROP                                  * B7DFB
        ;                                        * B7E00

* ROMPTR 0B5 0E1
* refs (1): B4B39
ROMP_0B5_0E1:
        ::                                       * B7E05
          STATCOL                                * B7E0A
        ;                                        * B7E0F

* ROMPTR 0B5 0E2
* refs (1): B4B39
ROMP_0B5_0E2:
        ::                                       * B7E14
          DROP                                   * B7E19
          OBJ_2C9EF                              * B7E1E
          ColumnMEAN                             * B7E23
        ;                                        * B7E28

* ROMPTR 0B5 0E3
* refs (1): B4B39
ROMP_0B5_0E3:
        ::                                       * B7E2D
          SWAP                                   * B7E32
          OBJ_2C9EF                              * B7E37
          ROT                                    * B7E3C
          ITE                                    * B7E41
          ColumnTDEV                             * B7E46
          OBJ_2CD27                              * B7E4B
        ;                                        * B7E50

* ROMPTR 0B5 0E4
* refs (1): B4B39
ROMP_0B5_0E4:
        ::                                       * B7E55
          SWAP                                   * B7E5A
          OBJ_2C9EF                              * B7E5F
          ROT                                    * B7E64
          ITE                                    * B7E69
          ColumnVAR                              * B7E6E
          OBJ_2CD1B                              * B7E73
        ;                                        * B7E78

* ROMPTR 0B5 0E5
* refs (1): B4B39
ROMP_0B5_0E5:
        ::                                       * B7E7D
          DROP                                   * B7E82
          OBJ_2C9EF                              * B7E87
          ColumnTOT                              * B7E8C
        ;                                        * B7E91

* ROMPTR 0B5 0E6
* refs (1): B4B39
ROMP_0B5_0E6:
        ::                                       * B7E96
          DROP                                   * B7E9B
          OBJ_2C9EF                              * B7EA0
          ColumnMAX                              * B7EA5
        ;                                        * B7EAA

* ROMPTR 0B5 0E7
* refs (1): B4B39
ROMP_0B5_0E7:
        ::                                       * B7EAF
          DROP                                   * B7EB4
          OBJ_2C9EF                              * B7EB9
          ColumnMIN                              * B7EBE
        ;                                        * B7EC3

* ROMPTR 0B5 0E8
* refs (1): B4B39
ROMP_0B5_0E8:
        ::                                       * B7EC8
          4ROLLDROP                              * B7ECD
          SWAP                                   * B7ED2
          bins(3r)                               * B7ED7
        ;                                        * B7EDC

* ROMPTR 0B5 0E9
* refs (1): B4B39
ROMP_0B5_0E9:
        ::                                       * B7EE1
          OBJ_48BBB                              * B7EE6
          STATCORR                               * B7EEB
          STATCOV                                * B7EF0
        ;                                        * B7EF5

* ROMPTR 0B5 0EA
* refs (1): B4B39
ROMP_0B5_0EA:
        ::                                       * B7EFA
          STATPREDX                              * B7EFF
        ;                                        * B7F04

* ROMPTR 0B5 0EB
* refs (1): B4B39
ROMP_0B5_0EB:
        ::                                       * B7F09
          STATPREDY                              * B7F0E
        ;                                        * B7F13

* ROMPTR 0B5 0EC
* refs (1): B4B39
ROMP_0B5_0EC:
        ::                                       * B7F18
          STATX                                  * B7F1D
        ;                                        * B7F22

* ROMPTR 0B5 0ED
* refs (1): B4B39
ROMP_0B5_0ED:
        ::                                       * B7F27
          STATY                                  * B7F2C
        ;                                        * B7F31

* ROMPTR 0B5 0EE
* refs (1): B4B39
ROMP_0B5_0EE:
        ::                                       * B7F36
          STATXX                                 * B7F3B
        ;                                        * B7F40

* ROMPTR 0B5 0EF
* refs (1): B4B39
ROMP_0B5_0EF:
        ::                                       * B7F45
          STATYY                                 * B7F4A
        ;                                        * B7F4F

* ROMPTR 0B5 0F0
* refs (1): B4B39
ROMP_0B5_0F0:
        ::                                       * B7F54
          STATXY                                 * B7F59
        ;                                        * B7F5E

* ROMPTR 0B5 0F1
* refs (1): B4B39
ROMP_0B5_0F1:
        ::                                       * B7F63
          STATN                                  * B7F68
        ;                                        * B7F6D

* ROMPTR 0B5 0F2
* refs (1): B4B39
ROMP_0B5_0F2:
        {                                        * B7F72
          ROMPTR  0B5 0F3                        * B7F77
          ROMPTR  0B5 0F4                        * B7F82
        }                                        * B7F8D

* ROMPTR 0B5 0F3
* refs (1): B4B39
ROMP_0B5_0F3:
        {                                        * B7F92
          #       BB17                           * B7F97  47895
          TRUE                                   * B7FA1
        }                                        * B7FA6

* ROMPTR 0B5 0F4
* refs (1): B4B39
ROMP_0B5_0F4:
        {                                        * B7FAB
          #       BB18                           * B7FB0  47896
          FALSE                                  * B7FBA
        }                                        * B7FBF

* ROMPTR 0B5 0F5
* refs (1): B4B39
ROMP_0B5_0F5:
        {                                        * B7FC4
          ROMPTR  0B5 0F6                        * B7FC9
          ROMPTR  0B5 0F7                        * B7FD4
          ROMPTR  0B5 0F8                        * B7FDF
          ROMPTR  0B5 0F9                        * B7FEA
          ROMPTR  0B5 0FA                        * B7FF5
        }                                        * B8000

* ROMPTR 0B5 0F6
* refs (1): B4B39
ROMP_0B5_0F6:
        {                                        * B8005
          #       BB3B                           * B800A  47931
          xLINFIT                                * B8014
        }                                        * B8019

* ROMPTR 0B5 0F7
* refs (1): B4B39
ROMP_0B5_0F7:
        {                                        * B801E
          #       BB3C                           * B8023  47932
          xLOGFIT                                * B802D
        }                                        * B8032

* ROMPTR 0B5 0F8
* refs (1): B4B39
ROMP_0B5_0F8:
        {                                        * B8037
          #       BB3D                           * B803C  47933
          xEXPFIT                                * B8046
        }                                        * B804B

* ROMPTR 0B5 0F9
* refs (1): B4B39
ROMP_0B5_0F9:
        {                                        * B8050
          #       BB3E                           * B8055  47934
          xPWRFIT                                * B805F
        }                                        * B8064

* ROMPTR 0B5 0FA
* refs (1): B4B39
ROMP_0B5_0FA:
        {                                        * B8069
          #       BB3F                           * B806E  47935
          xBESTFIT                               * B8078
        }                                        * B807D

* ROMPTR 0B5 0FB
* refs (1): B4B39
ROMP_0B5_0FB:
        ::                                       * B8082
          ROMPTR  0B5 0FE                        * B8087

* ROMPTR 0B5 0FC
* refs (1): B4B39
ROMP_0B5_0FC:
          ::                                     * B8092
            ROMPTR  0B5 11E                      * B8097
            BINT6                                * B80A2
            {}N                                  * B80A7
            DUP                                  * B80AC
            BINT33                               * B80B1
            TestSysFlag                          * B80B6
            BINT35                               * B80BB
            TestSysFlag                          * B80C0
            3NULLLAM{}                           * B80C5
            BIND                                 * B80CA
            INCOMPDROP                           * B80CF
            SWAPDROP                             * B80D4
            %3                                   * B80D9
            SWAP                                 * B80DE
            6->list;StoInIPAR                    * B80E3
            BINT33                               * B80E8
            SetSysFlag                           * B80ED
            BINT35                               * B80F2
            SetSysFlag                           * B80F7
          ;                                      * B80FC
          ERRSET                                 * B8101
          ::                                     * B8106
            DUPTYPELIST?                         * B810B
            ITE                                  * B8110
            SENDLIST                             * B8115
            SENDNAME                             * B811A
          ;                                      * B811F
          ERRTRAP                                * B8124
          ::                                     * B8129
            ROMPTR  0B5 0FD                      * B812E
            ERRJMP                               * B8139
          ;                                      * B813E

* ROMPTR 0B5 0FD
* refs (1): B4B39
ROMP_0B5_0FD:
          ::                                     * B8143
            1GETLAM                              * B8148
            BINT35                               * B814D
            ROMPTR  0B5 11B                      * B8152
            2GETLAM                              * B815D
            BINT33                               * B8162
            ROMPTR  0B5 11B                      * B8167
            3GETLAM                              * B8172
            StoIOPAR                             * B8177
            ABND                                 * B817C
          ;                                      * B8181
        ;                                        * B8186

* ROMPTR 0B5 0FE
* refs (1): B4B39
ROMP_0B5_0FE:
        ::                                       * B818B
          MINUSONE                               * B8190
          OVER                                   * B8195
          EQUAL                                  * B819A
          casedrop                               * B819F
          ROMPTR  0E7 007                        * B81A4
        ;                                        * B81AF

* ROMPTR 0B5 0FF
* refs (1): B4B39
ROMP_0B5_0FF:
        ::                                       * B81B4
          ROMPTR  0B5 0FC                        * B81B9
          ERRSET                                 * B81C4
          ::                                     * B81C9
            NULL$TEMP                            * B81CE
            DORECN                               * B81D3
          ;                                      * B81D8
          ERRTRAP                                * B81DD
          ::                                     * B81E2
            ROMPTR  0B5 0FD                      * B81E7
            ERRJMP                               * B81F2
          ;                                      * B81F7
          ROMPTR  0B5 0FD                        * B81FC
        ;                                        * B8207

* ROMPTR 0B5 100
* refs (1): B4B39
ROMP_0B5_100:
        ::                                       * B820C
          BINT34                                 * B8211
          TestSysFlag                            * B8216
          ITE                                    * B821B
          ROMPTR  0B5 121                        * B8220
          ROMPTR  0B5 120                        * B822B
        ;                                        * B8236

* ROMPTR 0B5 101
* refs (1): B4B39
ROMP_0B5_101:
        ::                                       * B823B
          ROMPTR  0B0 09A                        * B8240
          DUP                                    * B824B
          ?SKIP                                  * B8250
          ::                                     * B8255
            BINT33                               * B825A
            ClrSysFlag                           * B825F
          ;                                      * B8264
          NOT                                    * B8269
          BINT34                                 * B826E
          ROMPTR  0B5 11B                        * B8273
        ;                                        * B827E

* ROMPTR 0B5 102
* refs (1): B4B39
ROMP_0B5_102:
        ::                                       * B8283
          ROMPTR  0B5 0FE                        * B8288
          DODELAY                                * B8293
        ;                                        * B8298

* ROMPTR 0B5 103
* refs (1): B4B39
ROMP_0B5_103:
        ::                                       * B829D
          ROMPTR  0B5 11C                        * B82A2
          #3-                                    * B82AD
          NDROP                                  * B82B2
          SWAPDROP                               * B82B7
          DUPTYPEREAL?                           * B82BC
          NOTcasedrop                            * B82C1
          %80                                    * B82C6
          SWAP                                   * B82CB
          DUPTYPEREAL?                           * B82D0
          NOTcasedrop                            * B82D5
          %1.8                                   * B82DA
          SWAP                                   * B82DF
        ;                                        * B82E4

* ROMPTR 0B5 104
* refs (1): B4B39
ROMP_0B5_104:
        ::                                       * B82E9
          BINT38                                 * B82EE
          TestSysFlag                            * B82F3
          NOT                                    * B82F8
        ;                                        * B82FD

* ROMPTR 0B5 105
* refs (1): B4B39
ROMP_0B5_105:
        ::                                       * B8302
          NOT                                    * B8307
          BINT38                                 * B830C
          ROMPTR  0B5 11B                        * B8311
        ;                                        * B831C

* ROMPTR 0B5 106
* refs (1): B4B39
ROMP_0B5_106:
        ::                                       * B8321
          ROMPTR  0B5 0FE                        * B8326
          DUP                                    * B8331
          %1                                     * B8336
          %>=                                    * B833B
          ?SKIP                                  * B8340
          ::                                     * B8345
            DROP                                 * B834A
            %80                                  * B834F
          ;                                      * B8354
          ROMPTR  0B5 11C                        * B8359
          DUP#1-                                 * B8364
          ROLLDROP                               * B8369
          DUP#1+                                 * B836E
          ROLL                                   * B8373
          OBJ_6DCE7                              * B8378
          UNROLL                                 * B837D
          {}N                                    * B8382
          StoPRTPAR                              * B8387
        ;                                        * B838C

* ROMPTR 0B5 107
* refs (1): B4B39
ROMP_0B5_107:
        ::                                       * B8391
          DUP                                    * B8396
          MINUSONE                               * B839B
          EQUAL                                  * B83A0
          casedrop                               * B83A5
          DOCR                                   * B83AA
          pr1                                    * B83AF
          DROP                                   * B83B4
        ;                                        * B83B9

* ROMPTR 0B5 108
* refs (1): B4B39
ROMP_0B5_108:
        ::                                       * B83BE
          BINT33                                 * B83C3
          TestSysFlag                            * B83C8
          ITE                                    * B83CD
          ROMPTR  0B5 120                        * B83D2
          ROMPTR  0B5 121                        * B83DD
        ;                                        * B83E8

* ROMPTR 0B5 109
* refs (1): B4B39
ROMP_0B5_109:
        ::                                       * B83ED
          ROMPTR  0B0 09A                        * B83F2
          BINT33                                 * B83FD
          ROMPTR  0B5 11B                        * B8402
        ;                                        * B840D

* ROMPTR 0B5 10A
* refs (1): B4B39
ROMP_0B5_10A:
        ::                                       * B8412
          ROMPTR  0B5 12C                        * B8417
          BINT35                                 * B8422
          TestSysFlag                            * B8427
          ITE                                    * B842C
          BINT2                                  * B8431
          BINT1                                  * B8436
          NTHCOMPDROP                            * B843B
        ;                                        * B8440

* ROMPTR 0B5 10B
* refs (1): B4B39
ROMP_0B5_10B:
        ::                                       * B8445
          ROMPTR  0B0 09A                        * B844A
          NOT                                    * B8455
          BINT35                                 * B845A
          ROMPTR  0B5 11B                        * B845F
        ;                                        * B846A

* ROMPTR 0B5 10C
* refs (1): B4B39
ROMP_0B5_10C:
        ::                                       * B846F
          ROMPTR  0B5 11E                        * B8474
          ROMPTR  0B5 12F                        * B847F
          SWAP                                   * B848A
          DUPTYPEREAL?                           * B848F
          ITE                                    * B8494
          COERCE                                 * B8499
          DROPONE                                * B849E
          DUP                                    * B84A3
          BINT3                                  * B84A8
          #>                                     * B84AD
          IT                                     * B84B2
          DROPONE                                * B84B7
          #1+                                    * B84BC
          NTHCOMPDROP                            * B84C1
          ROMPTR  0B5 134                        * B84C6
          ROT                                    * B84D1
          ::                                     * B84D6
            DUPTYPEREAL?                         * B84DB
            NOTcasedrop                          * B84E0
            BINT3                                * B84E5
            OBJ_2ED74                            * B84EA
            NOTcasedrop                          * B84EF
            BINT3                                * B84F4
            COERCE                               * B84F9
          ;                                      * B84FE
          NTHCOMPDROP                            * B8503
          OBJ_37B03                              * B8508
          4ROLL                                  * B850D
          ::                                     * B8512
            DUPTYPEREAL?                         * B8517
            NOTcasedrop                          * B851C
            %9600                                * B8521
            %IP>#                                * B8526
            s=okBaud?                            * B852B
            NOTcasedrop                          * B8530
            %9600                                * B8535
            UNCOERCE                             * B853A
          ;                                      * B853F
          ROMPTR  0B5 126                        * B8544
          5ROLL                                  * B854F
          ::                                     * B8554
            DUPTYPEREAL?                         * B8559
            NOTcasedrop                          * B855E
            BINT1                                * B8563
            %IP>#                                * B8568
            DUP                                  * B856D
            BINT4                                * B8572
            #>case                               * B8577
            DROPONE                              * B857C
            #1+                                  * B8581
          ;                                      * B8586
          NTHCOMPDROP                            * B858B
        ;                                        * B8590

* ROMPTR 0B5 10D
* refs (1): B4B39
ROMP_0B5_10D:
        ::                                       * B8595
          ROMPTR  0B0 09A                        * B859A
          4ROLL                                  * B85A5
          ROMPTR  0B0 09A                        * B85AA
          4UNROLL                                * B85B5
          ROMPTR  0B5 11E                        * B85BA
          DROP                                   * B85C5
          7UNROLL                                * B85CA
          OBJ_37B03                              * B85CF
          6ROLL                                  * B85D4
          DUPTYPEBINT?                           * B85D9
          ITE                                    * B85DE
          ::                                     * B85E3
            DROP                                 * B85E8
            5ROLL                                * B85ED
          ;                                      * B85F2
          ::                                     * B85F7
            6ROLL                                * B85FC
            DROP                                 * B8601
            ROMPTR  0B0 099                      * B8606
          ;                                      * B8611
          6ROLL                                  * B8616
          6->list;StoInIPAR                      * B861B
        ;                                        * B8620

* ROMPTR 0B5 10E
* refs (1): B4B39
ROMP_0B5_10E:
        ::                                       * B8625
          BINT36                                 * B862A
          TestSysFlag                            * B862F
        ;                                        * B8634

* ROMPTR 0B5 10F
* refs (1): B4B39
ROMP_0B5_10F:
        ::                                       * B8639
          BINT36                                 * B863E
          ROMPTR  0B5 11B                        * B8643
        ;                                        * B864E

* ROMPTR 0B5 110
* refs (1): B4B39
ROMP_0B5_110:
        ::                                       * B8653
          $       "DIR /W"                       * B8658
          $       "C"                            * B866E
          ROMPTR  0B5 115                        * B867A
          '                                      * B8685
          CODE                                   * B868A  143 nibbles
            GOSBVL  POP#                         * B8694
            GOSBVL  SAVPTR                       * B869B
            C=0     A                            * B86A2
            R0=C                                 * B86A4
            GOSBVL  GetStrLenStk                 * B86A7
            ?C<A    A                            * B86AE
            GOYES   L_B86E5                      * B86B1
            D=C     A                            * B86B3
            A=A-1   A                            * B86B5
            B=A     A                            * B86B7
            CD1EX                                * B86B9
            A=A+A   A                            * B86BC
            C=C+A   A                            * B86BE
            D1=C                                 * B86C0
            ST=0    4                            * B86C3
L_B86C6:
            GOSUB   SUB_B86EE                    * B86C6
            GOC     L_B86C6                      * B86CA
            C=B     A                            * B86CD
            R0=C                                 * B86CF
L_B86D2:
            GOSUB   SUB_B86EE                    * B86D2
            GONC    L_B86D2                      * B86D6
            C=B     A                            * B86D9
            R1=C                                 * B86DB
            GOVLNG  Push2#Loop                   * B86DE
L_B86E5:
            A=0     A                            * B86E5
            GOVLNG  PUSH#ALOOP                   * B86E7

* refs (2): B86C6 B86D2
SUB_B86EE:
            D=D-1   A                            * B86EE
            GOC     L_B86E5                      * B86F0
            B=B+1   A                            * B86F3
            A=DAT1  B                            * B86F5
            D1=D1+  2                            * B86F8
            LC(2)   #20                          * B86FB
            ?C=A    B                            * B86FF
            GOYES   L_B871C                      * B8702
            LC(2)   #09                          * B8704
            ?C=A    B                            * B8708
            GOYES   L_B871C                      * B870B
            C=C+1   A                            * B870D
            ST=1    4                            * B870F
            ?C=A    B                            * B8712
            RTNYES                               * B8715
            ST=0    4                            * B8717
            RTNCC                                * B871A
L_B871C:
            ?ST=1   4                            * B871C
            GOYES   L_B86E5                      * B871F
            RTNSC                                * B8721
          ENDCODE                                * B8723
          2NULLLAM{}                             * B8723
          BIND                                   * B8728
          2GETLAM                                * B872D
          $       ":\\"                          * B8732
          BINT1                                  * B8740
          POS$                                   * B8745
          DUP#0=csedrp                           * B874A
          ::                                     * B874F
            NULL$                                * B8754
            NULL{}                               * B8759
            ABND                                 * B875E
          ;                                      * B8763
          #1-                                    * B8768
          2GETLAM                                * B876D
          NEWLINE$                               * B8772
          3PICK                                  * B8777
          POS$                                   * B877C
          DUP#0=case                             * B8781
          ::                                     * B8786
            2DROP                                * B878B
            NULL$                                * B8790
            NULL{}                               * B8795
            ABND                                 * B879A
          ;                                      * B879F
          DUPUNROT                               * B87A4
          2GETLAM                                * B87A9
          3UNROLL                                * B87AE
          #1-SUB$                                * B87B3
          BINT0                                  * B87B8
          ROT                                    * B87BD
          BEGIN                                  * B87C2
          2GETLAM                                * B87C7
          SWAP                                   * B87CC
          1GETLAM                                * B87D1
          EVAL                                   * B87D6
          DUP#0<>                                * B87DB
          WHILE                                  * B87E0
          ::                                     * B87E5
            DUP4UNROLL                           * B87EA
            #1-SUB$                              * B87EF
            DUP                                  * B87F4
            $       "$KERMIT$.TMP"               * B87F9
            EQUAL                                * B881B
            ITE                                  * B8820
            DROP                                 * B8825
            ::                                   * B882A
              ROT#1+                             * B882F
              ROT                                * B8834
            ;                                    * B8839
          ;                                      * B883E
          REPEAT                                 * B8843
          2DROP                                  * B8848
          {}N                                    * B884D
          ABND                                   * B8852
        ;                                        * B8857

* ROMPTR 0B5 111
* refs (1): B4B39
ROMP_0B5_111:
        ::                                       * B885C
          '                                      * B8861
          NOT                                    * B8866
          ROMPTR  0B5 113                        * B886B
        ;                                        * B8876

* ROMPTR 0B5 112
* refs (1): B4B39
ROMP_0B5_112:
        ::                                       * B887B
          '                                      * B8880
          NOP                                    * B8885
          ROMPTR  0B5 113                        * B888A
        ;                                        * B8895

* ROMPTR 0B5 113
* refs (1): B4B39
ROMP_0B5_113:
        ::                                       * B889A
          SWAP                                   * B889F
          DUPNULL{}?                             * B88A4
          case                                   * B88A9
          SWAPDROP                               * B88AE
          INNERDUP                               * B88B3
          ZERO_DO                                * B88B8
          SWAP                                   * B88BD
          ROMPTR  0B5 114                        * B88C2
          SWAPDROP                               * B88CD
          3PICK                                  * B88D2
          #3+PICK                                * B88D7
          EVAL                                   * B88DC
          ITE                                    * B88E1
          ::                                     * B88E6
            OVER                                 * B88EB
            #1+UNROLL                            * B88F0
          ;                                      * B88F5
          ::                                     * B88FA
            DROP                                 * B88FF
            #1-                                  * B8904
          ;                                      * B8909
          LOOP                                   * B890E
          {}N                                    * B8913
          SWAPDROP                               * B8918
        ;                                        * B891D

* ROMPTR 0B5 114
* refs (1): B4B39
ROMP_0B5_114:
        ::                                       * B8922
          DUP                                    * B8927
          CAR$                                   * B892C
          CHR_[                                  * B8931
          EQUAL                                  * B8936
          SWAP                                   * B893B
          DUPLEN$                                * B8940
          2DUP                                   * B8945
          SUB$1#                                 * B894A
          #       5D                             * B894F  93
          #=                                     * B8959
          4ROLL                                  * B895E
          AND                                    * B8963
        ;                                        * B8968

* ROMPTR 0B5 115
* refs (1): B4B39
ROMP_0B5_115:
        ::                                       * B896D
          GetIOPAR                               * B8972
          RCLSYSF                                * B8977
          2NULLLAM{}                             * B897C
          BIND                                   * B8981
          BINT39                                 * B8986
          ERRSET                                 * B898B
          SetSysFlag                             * B8990
          %1                                     * B8995
          6->list;StoInIPAR                      * B899A
          %1                                     * B899F
          3UNROLL                                * B89A4
          DOPKT                                  * B89A9
          ERRTRAP                                * B89AE
          ::                                     * B89B3
            GetIOPAR                             * B89B8
            DROP                                 * B89BD
            2GETLAM                              * B89C2
            6->list;StoInIPAR                    * B89C7
            1GETABND                             * B89CC
            STOSYSF                              * B89D1
            ERRJMP                               * B89D6
          ;                                      * B89DB
          GetIOPAR                               * B89E0
          DROP                                   * B89E5
          2GETLAM                                * B89EA
          6->list;StoInIPAR                      * B89EF
          1GETABND                               * B89F4
          STOSYSF                                * B89F9
          DUPTYPECSTR?                           * B89FE
          ITE                                    * B8A03
          SWAPDROP                               * B8A08
          DROPNULL$                              * B8A0D
        ;                                        * B8A12

* ROMPTR 0B5 116
* refs (1): B4B39
ROMP_0B5_116:
        ::                                       * B8A17
          ROMPTR  0B5 114                        * B8A1C
          IT                                     * B8A27
          ::                                     * B8A2C
            SWAP                                 * B8A31
            BINT2                                * B8A36
            3PICK                                * B8A3B
            #1-SUB$                              * B8A40
            SWAP                                 * B8A45
            #2-                                  * B8A4A
          ;                                      * B8A4F
          BINT32                                 * B8A54
          #+                                     * B8A59
          #>CHR                                  * B8A5E
          >H$                                    * B8A63
          CHR_C                                  * B8A68
          >H$                                    * B8A6D
          $       "G"                            * B8A72
          ROMPTR  0B5 115                        * B8A7E
          DROP                                   * B8A89
        ;                                        * B8A8E

* ROMPTR 0B5 117
* refs (1): B4B39
ROMP_0B5_117:
        ::                                       * B8A93
          ROMPTR  0B5 0FE                        * B8A98
          DUPTYPELIST?                           * B8AA3
          ITE                                    * B8AA8
          kget(li)                               * B8AAD
          GETNAME                                * B8AB2
        ;                                        * B8AB7

* ROMPTR 0B5 118
* refs (1): B4B39
ROMP_0B5_118:
        ::                                       * B8ABC
          NULL$TEMP                              * B8AC1
          DORECN                                 * B8AC6
        ;                                        * B8ACB

* ROMPTR 0B5 119
* refs (1): B4B39
ROMP_0B5_119:
        ::                                       * B8AD0
          SWAP                                   * B8AD5
          ROMPTR  0B5 0FE                        * B8ADA
          SWAP                                   * B8AE5
          ITE                                    * B8AEA
          ROMPTR  0AB 05F                        * B8AEF  XRECV
          ROMPTR  0AB 05E                        * B8AFA  XSEND
          AtUserStack                            * B8B05
        ;                                        * B8B0A

* ROMPTR 0B5 11A
* refs (1): B4B39
ROMP_0B5_11A:
        ::                                       * B8B0F
          ROMPTR  0B5 0FE                        * B8B14
          DUPTYPELIST?                           * B8B1F
          ITE                                    * B8B24
          SENDLIST                               * B8B29
          SENDNAME                               * B8B2E
        ;                                        * B8B33

* ROMPTR 0B5 11B
* refs (1): B4B39
ROMP_0B5_11B:
        ::                                       * B8B38
          SWAP                                   * B8B3D
          ITE                                    * B8B42
          SetSysFlag                             * B8B47
          ClrSysFlag                             * B8B4C
        ;                                        * B8B51

* ROMPTR 0B5 11C
* refs (1): B4B39
ROMP_0B5_11C:
        ::                                       * B8B56
          '                                      * B8B5B
          ID      PRTPAR                         * B8B60
          Sys@                                   * B8B73
          NOTcase                                * B8B78
          Reset&BreakPRTPAR                      * B8B7D
          DUPTYPELIST?                           * B8B82
          NOTcasedrop                            * B8B87
          Reset&BreakPRTPAR                      * B8B8C
          INNERDUP                               * B8B91
          BINT3                                  * B8B96
          #>                                     * B8B9B
          NOTcase                                * B8BA0
          ::                                     * B8BA5
            NDROP                                * B8BAA
            Reset&BreakPRTPAR                    * B8BAF
          ;                                      * B8BB4
        ;                                        * B8BB9

* ROMPTR 0B5 11D
* refs (1): B4B39
ROMP_0B5_11D:
        ::                                       * B8BBE
          Reset&BreakPRTPAR                      * B8BC3
          DROP                                   * B8BC8
        ;                                        * B8BCD

* ROMPTR 0B5 11E
* refs (1): B4B39
ROMP_0B5_11E:
        ::                                       * B8BD2
          '                                      * B8BD7
          ID      IOPAR                          * B8BDC
          Sys@                                   * B8BED
          NOTcase                                * B8BF2
          ResetIOPAR&->                          * B8BF7
          DUPTYPELIST?                           * B8BFC
          NOTcasedrop                            * B8C01
          ResetIOPAR&->                          * B8C06
          DUPLENCOMP                             * B8C0B
          BINT6                                  * B8C10
          #<>                                    * B8C15
          casedrop                               * B8C1A
          ResetIOPAR&->                          * B8C1F
          INCOMPDROP                             * B8C24
        ;                                        * B8C29

* ROMPTR 0B5 11F
* refs (1): B4B39
ROMP_0B5_11F:
        {                                        * B8C2E
          ROMPTR  0B5 120                        * B8C33
          ROMPTR  0B5 121                        * B8C3E
        }                                        * B8C49

* ROMPTR 0B5 120
* refs (1): B4B39
ROMP_0B5_120:
        {                                        * B8C4E
          #       BA2C                           * B8C53  47660
          #       BA2D                           * B8C5D  47661
          TRUE                                   * B8C67
        }                                        * B8C6C

* ROMPTR 0B5 121
* refs (1): B4B39
ROMP_0B5_121:
        {                                        * B8C71
          #       BA2E                           * B8C76  47662
          #       BA2E                           * B8C80  47662
          FALSE                                  * B8C8A
        }                                        * B8C8F

* ROMPTR 0B5 122
* refs (1): B4B39
ROMP_0B5_122:
        {                                        * B8C94
          ROMPTR  0B5 123                        * B8C99
          ROMPTR  0B5 124                        * B8CA4
        }                                        * B8CAF

* ROMPTR 0B5 123
* refs (1): B4B39
ROMP_0B5_123:
        {                                        * B8CB4
          #       BA2F                           * B8CB9  47663
          TRUE                                   * B8CC3
        }                                        * B8CC8

* ROMPTR 0B5 124
* refs (1): B4B39
ROMP_0B5_124:
        {                                        * B8CCD
          #       BA30                           * B8CD2  47664
          FALSE                                  * B8CDC
        }                                        * B8CE1

* ROMPTR 0B5 125
* refs (1): B4B39
ROMP_0B5_125:
        {                                        * B8CE6
          %1200                                  * B8CEB
          %2400                                  * B8CF0
          %4800                                  * B8CF5
          %9600                                  * B8CFA
        }                                        * B8CFF

* ROMPTR 0B5 126
* refs (1): B4B39
ROMP_0B5_126:
        {                                        * B8D04
          ROMPTR  0B5 127                        * B8D09
          ROMPTR  0B5 128                        * B8D14
          ROMPTR  0B5 129                        * B8D1F
          ROMPTR  0B5 12A                        * B8D2A
          ROMPTR  0B5 12B                        * B8D35
        }                                        * B8D40

* ROMPTR 0B5 127
* refs (1): B4B39
ROMP_0B5_127:
        {                                        * B8D45
          #       BA3A                           * B8D4A  47674
          #       BA3A                           * B8D54  47674
          %0_2A2B4                               * B8D5E
        }                                        * B8D63

* ROMPTR 0B5 128
* refs (1): B4B39
ROMP_0B5_128:
        {                                        * B8D68
          #       BA31                           * B8D6D  47665
          #       BA31                           * B8D77  47665
          %1                                     * B8D81
        }                                        * B8D86

* ROMPTR 0B5 129
* refs (1): B4B39
ROMP_0B5_129:
        {                                        * B8D8B
          #       BA32                           * B8D90  47666
          #       BA32                           * B8D9A  47666
          %2                                     * B8DA4
        }                                        * B8DA9

* ROMPTR 0B5 12A
* refs (1): B4B39
ROMP_0B5_12A:
        {                                        * B8DAE
          #       BA33                           * B8DB3  47667
          #       BA33                           * B8DBD  47667
          %3                                     * B8DC7
        }                                        * B8DCC

* ROMPTR 0B5 12B
* refs (1): B4B39
ROMP_0B5_12B:
        {                                        * B8DD1
          #       BA34                           * B8DD6  47668
          #       BA35                           * B8DE0  47669
          %4                                     * B8DEA
        }                                        * B8DEF

* ROMPTR 0B5 12C
* refs (1): B4B39
ROMP_0B5_12C:
        {                                        * B8DF4
          ROMPTR  0B5 12D                        * B8DF9
          ROMPTR  0B5 12E                        * B8E04
        }                                        * B8E0F

* ROMPTR 0B5 12D
* refs (1): B4B39
ROMP_0B5_12D:
        {                                        * B8E14
          #       BA36                           * B8E19  47670
          #       BA37                           * B8E23  47671
          TRUE                                   * B8E2D
        }                                        * B8E32

* ROMPTR 0B5 12E
* refs (1): B4B39
ROMP_0B5_12E:
        {                                        * B8E37
          #       BA38                           * B8E3C  47672
          #       BA39                           * B8E46  47673
          FALSE                                  * B8E50
        }                                        * B8E55

* ROMPTR 0B5 12F
* refs (1): B4B39
ROMP_0B5_12F:
        {                                        * B8E5A
          ROMPTR  0B5 130                        * B8E5F
          ROMPTR  0B5 131                        * B8E6A
          ROMPTR  0B5 132                        * B8E75
          ROMPTR  0B5 133                        * B8E80
        }                                        * B8E8B

* ROMPTR 0B5 130
* refs (1): B4B39
ROMP_0B5_130:
        {                                        * B8E90
          #       BA3A                           * B8E95  47674
          #       BA3A                           * B8E9F  47674
          %0_2A2B4                               * B8EA9
        }                                        * B8EAE

* ROMPTR 0B5 131
* refs (1): B4B39
ROMP_0B5_131:
        {                                        * B8EB3
          #       BA3B                           * B8EB8  47675
          #       BA3C                           * B8EC2  47676
          %1                                     * B8ECC
        }                                        * B8ED1

* ROMPTR 0B5 132
* refs (1): B4B39
ROMP_0B5_132:
        {                                        * B8ED6
          #       BA3D                           * B8EDB  47677
          #       BA3E                           * B8EE5  47678
          %2                                     * B8EEF
        }                                        * B8EF4

* ROMPTR 0B5 133
* refs (1): B4B39
ROMP_0B5_133:
        {                                        * B8EF9
          #       BA40                           * B8EFE  47680
          #       BA3F                           * B8F08  47679
          %3                                     * B8F12
        }                                        * B8F17

* ROMPTR 0B5 134
* refs (1): B4B39
ROMP_0B5_134:
        {                                        * B8F1C
          ROMPTR  0B5 135                        * B8F21
          ROMPTR  0B5 136                        * B8F2C
          ROMPTR  0B5 137                        * B8F37
        }                                        * B8F42

* ROMPTR 0B5 135
* refs (1): B4B39
ROMP_0B5_135:
        {                                        * B8F47
          #       BA41                           * B8F4C  47681
          %1                                     * B8F56
        }                                        * B8F5B

* ROMPTR 0B5 136
* refs (1): B4B39
ROMP_0B5_136:
        {                                        * B8F60
          #       BA42                           * B8F65  47682
          %2                                     * B8F6F
        }                                        * B8F74

* ROMPTR 0B5 137
* refs (1): B4B39
ROMP_0B5_137:
        {                                        * B8F79
          #       BA43                           * B8F7E  47683
          %3                                     * B8F88
        }                                        * B8F8D

* ROMPTR 0B5 138
* refs (1): B4B39
ROMP_0B5_138:
        ::                                       * B8F92
          ROMPTR  0B5 143                        * B8F97
          NumbMode                               * B8FA2
          #1+                                    * B8FA7
          NTHCOMPDROP                            * B8FAC

* ROMPTR 0B5 139
* refs (1): B4B39
ROMP_0B5_139:
          CODE                                   * B8FB1  27 nibbles
            GOSBVL  SAVPTR                       * B8FBB
            A=0     A                            * B8FC2
            D0=(5)  #8084E                       * B8FC4
            A=DAT0  1                            * B8FCB
            GOVLNG  PUSH#ALOOP                   * B8FCF
          ENDCODE                                * B8FD6
          UNCOERCE                               * B8FD6
        ;                                        * B8FDB

* ROMPTR 0B5 13A
* refs (1): B4B39
ROMP_0B5_13A:
        ::                                       * B8FE0
          DEG?                                   * B8FE5
          case                                   * B8FEA
          ROMPTR  0B5 14A                        * B8FEF
          RAD?                                   * B8FFA
          case                                   * B8FFF
          ROMPTR  0B5 14B                        * B9004
          ROMPTR  0B5 14C                        * B900F
        ;                                        * B901A

* ROMPTR 0B5 13B
* refs (1): B4B39
ROMP_0B5_13B:
        ::                                       * B901F
          BINT16                                 * B9024
          TestSysFlag                            * B9029
          NOTcase                                * B902E
          ROMPTR  0B5 14E                        * B9033
          BINT15                                 * B903E
          TestSysFlag                            * B9043
          NOTcase                                * B9048
          ROMPTR  0B5 14F                        * B904D
          ROMPTR  0B5 150                        * B9058
        ;                                        * B9063

* ROMPTR 0B5 13C
* refs (1): B4B39
ROMP_0B5_13C:
        ::                                       * B9068
          BINT56                                 * B906D
          TestSysFlag                            * B9072
          NOT                                    * B9077
        ;                                        * B907C

* ROMPTR 0B5 13D
* refs (1): B4B39
ROMP_0B5_13D:
        ::                                       * B9081
          BINT56                                 * B9086
          SWAP                                   * B908B
          ITE                                    * B9090
          ClrSysFlag                             * B9095
          SetSysFlag                             * B909A
        ;                                        * B909F

* ROMPTR 0B5 13E
* refs (1): B4B39
ROMP_0B5_13E:
        ::                                       * B90A4
          BINT40                                 * B90A9
          TestSysFlag                            * B90AE
        ;                                        * B90B3

* ROMPTR 0B5 13F
* refs (1): B4B39
ROMP_0B5_13F:
        ::                                       * B90B8
          BINT40                                 * B90BD
          SWAP                                   * B90C2
          ITE                                    * B90C7
          SetSysFlag                             * B90CC
          ClrSysFlag                             * B90D1
        ;                                        * B90D6

* ROMPTR 0B5 140
* refs (1): B4B39
ROMP_0B5_140:
        ::                                       * B90DB
          BINT51                                 * B90E0
          TestSysFlag                            * B90E5
        ;                                        * B90EA

* ROMPTR 0B5 141
* refs (1): B4B39
ROMP_0B5_141:
        ::                                       * B90EF
          BINT51                                 * B90F4
          SWAP                                   * B90F9
          ITE                                    * B90FE
          SetSysFlag                             * B9103
          ClrSysFlag                             * B9108
        ;                                        * B910D

* ROMPTR 0B5 142
* refs (1): B4B39
ROMP_0B5_142:
        ::                                       * B9112
          ROMPTR  0B0 09A                        * B9117
          {                                      * B9122
            SETDEG                               * B9127
            xDEG                                 * B912C
            SETRAD                               * B9131
            xRAD                                 * B9136
            SETGRAD                              * B913B
            xGRAD                                * B9140
          }                                      * B9145
          EQLookup                               * B914A
          DROP                                   * B914F
          BINT1                                  * B9154
          ::N                                    * B9159
        ;                                        * B915E

* ROMPTR 0B5 143
* refs (1): B4B39
ROMP_0B5_143:
        {                                        * B9163
          ROMPTR  0B5 144                        * B9168
          ROMPTR  0B5 145                        * B9173
          ROMPTR  0B5 146                        * B917E
          ROMPTR  0B5 147                        * B9189
        }                                        * B9194

* ROMPTR 0B5 144
* refs (1): B4B39
ROMP_0B5_144:
        {                                        * B9199
          #       B924                           * B919E  47396
          #       B925                           * B91A8  47397
          ::                                     * B91B2
            DROP                                 * B91B7
            DOSTD                                * B91BC
          ;                                      * B91C1
        }                                        * B91C6

* ROMPTR 0B5 145
* refs (1): B4B39
ROMP_0B5_145:
        {                                        * B91CB
          #       B926                           * B91D0  47398
          #       B927                           * B91DA  47399
          DOFIX                                  * B91E4
        }                                        * B91E9

* ROMPTR 0B5 146
* refs (1): B4B39
ROMP_0B5_146:
        {                                        * B91EE
          #       B928                           * B91F3  47400
          #       B929                           * B91FD  47401
          DOSCI                                  * B9207
        }                                        * B920C

* ROMPTR 0B5 147
* refs (1): B4B39
ROMP_0B5_147:
        {                                        * B9211
          #       B92A                           * B9216  47402
          #       B92B                           * B9220  47403
          DOENG                                  * B922A
        }                                        * B922F

* ROMPTR 0B5 148
* refs (1): B4B39
ROMP_0B5_148:
        {                                        * B9234
          %0_2A2B4                               * B9239
          %1                                     * B923E
          %2                                     * B9243
          %3                                     * B9248
          %4                                     * B924D
          %5                                     * B9252
          %6                                     * B9257
          %7                                     * B925C
          %8                                     * B9261
          %9                                     * B9266
          %10                                    * B926B
          %11                                    * B9270
          %12                                    * B9275
        }                                        * B927A

* ROMPTR 0B5 149
* refs (1): B4B39
ROMP_0B5_149:
        {                                        * B927F
          ROMPTR  0B5 14A                        * B9284
          ROMPTR  0B5 14B                        * B928F
          ROMPTR  0B5 14C                        * B929A
        }                                        * B92A5

* ROMPTR 0B5 14A
* refs (1): B4B39
ROMP_0B5_14A:
        {                                        * B92AA
          #       B92C                           * B92AF  47404
          #       B92D                           * B92B9  47405
          SETDEG                                 * B92C3
        }                                        * B92C8

* ROMPTR 0B5 14B
* refs (1): B4B39
ROMP_0B5_14B:
        {                                        * B92CD
          #       B92E                           * B92D2  47406
          #       B92F                           * B92DC  47407
          SETRAD                                 * B92E6
        }                                        * B92EB

* ROMPTR 0B5 14C
* refs (1): B4B39
ROMP_0B5_14C:
        {                                        * B92F0
          #       B930                           * B92F5  47408
          #       B931                           * B92FF  47409
          SETGRAD                                * B9309
        }                                        * B930E

* ROMPTR 0B5 14D
* refs (1): B4B39
ROMP_0B5_14D:
        {                                        * B9313
          ROMPTR  0B5 14E                        * B9318
          ROMPTR  0B5 14F                        * B9323
          ROMPTR  0B5 150                        * B932E
        }                                        * B9339

* ROMPTR 0B5 14E
* refs (1): B4B39
ROMP_0B5_14E:
        {                                        * B933E
          #       B932                           * B9343  47410
          ROMPTR  0B5 151                        * B934D
        }                                        * B9358

* ROMPTR 0B5 14F
* refs (1): B4B39
ROMP_0B5_14F:
        {                                        * B935D
          #       B933                           * B9362  47411
          ROMPTR  0B5 152                        * B936C
        }                                        * B9377

* ROMPTR 0B5 150
* refs (1): B4B39
ROMP_0B5_150:
        {                                        * B937C
          #       B934                           * B9381  47412
          ROMPTR  0B5 153                        * B938B
        }                                        * B9396

* ROMPTR 0B5 151
* refs (1): B4B39
ROMP_0B5_151:
        ::                                       * B939B
          BINT16                                 * B93A0
          ClrSysFlag                             * B93A5
        ;                                        * B93AA

* ROMPTR 0B5 152
* refs (1): B4B39
ROMP_0B5_152:
        ::                                       * B93AF
          BINT15                                 * B93B4
          ClrSysFlag                             * B93B9
          BINT16                                 * B93BE
          SetSysFlag                             * B93C3
        ;                                        * B93C8

* ROMPTR 0B5 153
* refs (1): B4B39
ROMP_0B5_153:
        ::                                       * B93CD
          BINT15                                 * B93D2
          SetSysFlag                             * B93D7
          BINT16                                 * B93DC
          SetSysFlag                             * B93E1
        ;                                        * B93E6

* ROMPTR 0B5 154
* refs (1): B4B39
ROMP_0B5_154:
        $       "\01\02\03\0E\13\14\15\16\1B\1C\1D\1F !\"#$%&'()*+,3456789:;<=>?" * B93EB

* ROMPTR 0B5 155
* refs (1): B4B39
ROMP_0B5_155:
        #       26                               * B9441  38

* ROMPTR 0B5 156
* refs (1): B4B39
ROMP_0B5_156:
        ::                                       * B944B
          ROMPTR  0B5 154                        * B9450
          SWAP                                   * B945B
          SUB$1#                                 * B9460
        ;                                        * B9465

* ROMPTR 0B5 157
* refs (1): B4B39
ROMP_0B5_157:
        ::                                       * B946A
          DUP                                    * B946F
          ROMPTR  0B4 1D5                        * B9474
          ITE                                    * B947F
          #       B95C                           * B9484  47452
          #       B936                           * B948E  47414
          ROMPTR  0B5 154                        * B9498
          ROT                                    * B94A3
          #>CHR                                  * B94A8
          BINT1                                  * B94AD
          POS$                                   * B94B2
          #1-+                                   * B94B7
          JstGetTHEMESG                          * B94BC
        ;                                        * B94C1

* ROMPTR 0B5 158
* refs (1): B4B39
ROMP_0B5_158:
        ::                                       * B94C6
        ;                                        * B94CB

* ROMPTR 0B5 159
* refs (1): B4B39
ROMP_0B5_159:
        ::                                       * B94D0
          DUPTYPELIST?                           * B94D5
          ?SKIP                                  * B94DA
          ONE{}N                                 * B94DF
          '                                      * B94E4
          ROMPTR  0B5 15A                        * B94E9
          BINT1                                  * B94F4
          MINUSONE                               * B94F9
          ROMPTR  0B4 1DB                        * B94FE
          DUP                                    * B9509
          BINT1                                  * B950E
          psh                                    * B9513
          #1+                                    * B9518
          NDROP                                  * B951D
        ;                                        * B9522

* ROMPTR 0B5 15A
* refs (1): B4B39
ROMP_0B5_15A:
        ::                                       * B9527
          3PICK                                  * B952C
          ?ROMPTR>                               * B9531
          XEQTYPE                                * B9536
          COERCE                                 * B953B
          SWAPDROP                               * B9540
          5PICK                                  * B9545
          SWAP'                                  * B954A
          ::                                     * B954F
            DUP                                  * B9554
            MINUSONE                             * B9559
            #=                                   * B955E
            3PICK                                * B9563
            MINUSONE                             * B9568
            #=                                   * B956D
            OR                                   * B9572
            case2drop                            * B9577
            TRUE                                 * B957C
            #=                                   * B9581
          ;                                      * B9586
          POSCOMP                                * B958B
          #0<>                                   * B9590
        ;                                        * B9595

* ROMPTR 0B5 15C
* refs (2): B4B39 B4B39
ROMP_0B5_15C:
        ::                                       * B959A
          ROMPTR  0B5 0FE                        * B959F
          SWAP                                   * B95AA
          ROMPTR  0B5 0FE                        * B95AF
          SWAP                                   * B95BA
          STRIPTAGSl2                            * B95BF
          XEQSTOID                               * B95C4
        ;                                        * B95C9

* ROMPTR 0B5 15D
* refs (1): B4B39
ROMP_0B5_15D:
        ::                                       * B95CE
          DUP                                    * B95D3
          ID>$                                   * B95D8
          BINT59                                 * B95DD
          TestSysFlag                            * B95E2
          ITE                                    * B95E7
          SWAPDROP                               * B95EC
          ::                                     * B95F1
            $       ": "                         * B95F6
            &$                                   * B9604
            SWAP                                 * B9609
            XEQRCL                               * B960E
            ROMPTR  0B0 075                      * B9613
            &$                                   * B961E
          ;                                      * B9623
          BINT1                                  * B9628
          BINT23                                 * B962D
          SUB$                                   * B9632
        ;                                        * B9637

* ROMPTR 0B5 15E
* refs (1): B4B39
ROMP_0B5_15E:
        ::                                       * B963C
          CONTEXT@                               * B9641
          BINT0                                  * B9646
          ROMPTR  0B5 161                        * B964B
          MINUSONE                               * B9656
          ROMPTR  0B5 160                        * B965B
          DROP                                   * B9666
          ZEROSWAP                               * B966B
          #-                                     * B9670
          BINT0                                  * B9675
          ROT#-                                  * B967A
          SWAP                                   * B967F
        ;                                        * B9684

* ROMPTR 0B5 15F
* refs (1): B4B39
ROMP_0B5_15F:
        ::                                       * B9689
          ROMPTR  0B5 160                        * B968E
          ROTROT2DROP                            * B9699
        ;                                        * B969E

* ROMPTR 0B5 160
* refs (1): B4B39
ROMP_0B5_160:
        ::                                       * B96A3
          '                                      * B96A8
          ::                                     * B96AD
            BEGIN                                * B96B2
            ?ATTNQUIT                            * B96B7
            DUP                                  * B96BC
            MYRAMROMPAIR                         * B96C1
            ITE                                  * B96C6
            ::                                   * B96CB
              SWAP                               * B96D0
              PrevNonNull                        * B96D5
              ITE                                * B96DA
              FalseTrue                          * B96DF
              FALSE                              * B96E4
            ;                                    * B96E9
            TrueTrue                             * B96EE
            UNTIL                                * B96F3
          ;                                      * B96F8
          '                                      * B96FD
          ::                                     * B9702
            SWAPDROP                             * B9707
            SWAP#1-SWAP                          * B970C
            CONTEXT@                             * B9711
            OVER                                 * B9716
            EQ                                   * B971B
            IT                                   * B9720
            ::                                   * B9725
              ROTDROP                            * B972A
              OVERSWAP                           * B972F
            ;                                    * B9734
            OVER#0=                              * B9739
            NOT?SEMI                             * B973E
            2RDROP                               * B9743
            TRUE                                 * B9748
          ;                                      * B974D
          2SWAP                                  * B9752
          DUPUNROT                               * B9757
          SWAP                                   * B975C
          BEGIN                                  * B9761
          DUP                                    * B9766
          LastNonNull                            * B976B
          ::                                     * B9770
            ?SKIP                                * B9775
            ::                                   * B977A
              5PICK                              * B977F
              EVAL                               * B9784
              case                               * B9789
              COLATRUE                           * B978E
            ;                                    * B9793
            BEGIN                                * B9798
            ?ATTNQUIT                            * B979D
            DUPTYPERRP?                          * B97A2
            case                                 * B97A7
            ::                                   * B97AC
              5PICK                              * B97B1
              EVAL                               * B97B6
              FALSE                              * B97BB
              RDROP                              * B97C0
            ;                                    * B97C5
            PrevNonNull                          * B97CA
            ITE                                  * B97CF
            FALSE                                * B97D4
            ::                                   * B97D9
              5PICK                              * B97DE
              EVAL                               * B97E3
            ;                                    * B97E8
            UNTIL                                * B97ED
            TRUE                                 * B97F2
          ;                                      * B97F7
          UNTIL                                  * B97FC
          4ROLLDROP                              * B9801
          4ROLLDROP                              * B9806
        ;                                        * B980B

* ROMPTR 0B5 161
* refs (1): B4B39
ROMP_0B5_161:
        ::                                       * B9810
          DUP#0=csedrp                           * B9815
          ::                                     * B981A
            CODE                                 * B981F  23 nibbles
              LC(5)   #80711                     * B9829
              CD1EX                              * B9830
              A=DAT1  A                          * B9833
              D1=C                               * B9836
              GOVLNG  PUSHA                      * B9839
            ENDCODE                              * B9840
          ;                                      * B9840
          SWAP                                   * B9845
          BEGIN                                  * B984A
          DUP                                    * B984F
          MYRAMROMPAIR                           * B9854
          NOTcase                                * B9859
          SWAPDROP                               * B985E
          DUPUNROT                               * B9863
          LastNonNull                            * B9868
          DROP                                   * B986D
          BEGIN                                  * B9872
          ?ATTNQUIT                              * B9877
          2DUPEQ                                 * B987C
          ITE                                    * B9881
          FALSE                                  * B9886
          ::                                     * B988B
            DUPTYPERRP?                          * B9890
            NOTcaseTRUE                          * B9895
            ROTDROP                              * B989A
            DUPUNROT                             * B989F
            TRUE                                 * B98A4
          ;                                      * B98A9
          WHILE                                  * B98AE
          ::                                     * B98B3
            PrevNonNull                          * B98B8
            DROP                                 * B98BD
          ;                                      * B98C2
          REPEAT                                 * B98C7
          DROP                                   * B98CC
          MYRAMROMPAIR                           * B98D1
          DROPOVER                               * B98D6
          EQ                                     * B98DB
          BEGIN                                  * B98E0
          OVERSWAP                               * B98E5
          ITE                                    * B98EA
          DROPFALSE                              * B98EF
          LastNonNull                            * B98F4
          WHILE                                  * B98F9
          ::                                     * B98FE
            BINT0                                * B9903
            3UNROLL                              * B9908
            BEGIN                                * B990D
            DUPTYPERRP?                          * B9912
            IT                                   * B9917
            ::                                   * B991C
              SWAPDROPDUP                        * B9921
              ROT#1+UNROT                        * B9926
            ;                                    * B992B
            PrevNonNull                          * B9930
            NOT_UNTIL                            * B9935
            SWAP                                 * B993A
            #0=                                  * B993F
          ;                                      * B9944
          REPEAT                                 * B9949
          SWAP#1-SWAP                            * B994E
          OVER#0=                                * B9953
          UNTIL                                  * B9958
          SWAPDROP                               * B995D
        ;                                        * B9962

* ROMPTR 0B5 162
* refs (1): B4B39
ROMP_0B5_162:
        ::                                       * B9967
          ROMPTR  0B5 0FE                        * B996C
          CREATEDIR                              * B9977
        ;                                        * B997C

* ROMPTR 0B5 163
* refs (1): B4B39
ROMP_0B5_163:
        ::                                       * B9981
          BINT0                                  * B9986
          OVER                                   * B998B
          BEGIN                                  * B9990
          MYRAMROMPAIR                           * B9995
          NOT                                    * B999A
          DUP                                    * B999F
          ?SKIP                                  * B99A4
          ROT#1+UNROT                            * B99A9
          UNTIL                                  * B99AE
          SWAPDUP                                * B99B3
          SYSRRP?                                * B99B8
          case                                   * B99BD
          ::                                     * B99C2
            2DROP                                * B99C7
            $       "HOME"                       * B99CC
          ;                                      * B99DE
          RAM-WORDNAME                           * B99E3
          ID>$                                   * B99E8
          SWAP                                   * B99ED
          #2*                                    * B99F2
          Blank$                                 * B99F7
          !insert$                               * B99FC
          BINT1                                  * B9A01
          BINT23                                 * B9A06
          SUB$                                   * B9A0B
        ;                                        * B9A10

* ROMPTR 0B5 164
* refs (1): B4B39
ROMP_0B5_164:
        ::                                       * B9A15
          '                                      * B9A1A
          NOP                                    * B9A1F
          ROMPTR  0B5 165                        * B9A24
        ;                                        * B9A2F

* ROMPTR 0B5 165
* refs (1): B4B39
ROMP_0B5_165:
        ::                                       * B9A34
          SWAPROT                                * B9A39
          ROMPTR  0B5 0FE                        * B9A3E
          SWAP                                   * B9A49
          ROMPTR  0B5 0FE                        * B9A4E
          DUPTYPEIDNT?                           * B9A59
          IT                                     * B9A5E
          ::                                     * B9A63
            BINT1                                * B9A68
            {}N                                  * B9A6D
          ;                                      * B9A72
          DUPNULLCOMP?                           * B9A77
          caseSIZEERR                            * B9A7C
          ZEROZERO                               * B9A81
          5ROLL                                  * B9A86
          CONTEXT@                               * B9A8B
          4NULLLAM{}                             * B9A90
          BIND                                   * B9A95
          ERRSET                                 * B9A9A
          ::                                     * B9A9F
            INNERCOMP                            * B9AA4
            #1-SWAP                              * B9AA9
            OVER                                 * B9AAE
            #2+UNROLL                            * B9AB3
            DUP#0=ITE                            * B9AB8
            DROP                                 * B9ABD
            ::                                   * B9AC2
              ZERO_DO                            * B9AC7
              ISTOP-INDEX                        * B9ACC
              ROLL                               * B9AD1
              ROMPTR  0B5 166                    * B9AD6
              NOTcase                            * B9AE1
              ::                                 * B9AE6
                caseSIZEERR                      * B9AEB
                SETNONEXTERR                     * B9AF0
              ;                                  * B9AF5
              LOOP                               * B9AFA
            ;                                    * B9AFF
            ROMPTR  0B5 166                      * B9B04
            CONTEXT@                             * B9B0F
            3UNROLL                              * B9B14
            ITE                                  * B9B19
            ZEROSWAP                             * B9B1E
            ::                                   * B9B23
              DROP                               * B9B28
              SWAPROT                            * B9B2D
              DUPTYPELIST?                       * B9B32
              NOT?SEMI                           * B9B37
              DUPLENCOMP                         * B9B3C
              #1=                                * B9B41
              ?SEMI                              * B9B46
              ROTDROP                            * B9B4B
              SWAP2DUP                           * B9B50
              EQUALPOSCOMP                       * B9B55
              #0=?SKIP                           * B9B5A
              ::                                 * B9B5F
                #       13C                      * B9B64  316
                ERROROUT                         * B9B6E
              ;                                  * B9B73
              DUP                                * B9B78
              CREATEDIR                          * B9B7D
              XEQRCL                             * B9B82
              SWAP                               * B9B87
              ZEROSWAP                           * B9B8C
            ;                                    * B9B91
            DUPTYPELIST?                         * B9B96
            ITE                                  * B9B9B
            INNERCOMP                            * B9BA0
            BINT1                                * B9BA5
            DUP#0=csDROP                         * B9BAA
            ZERO_DO                              * B9BAF
            DUPTYPEIDNT?                         * B9BB4
            NcaseTYPEERR                         * B9BB9
            DUP                                  * B9BBE
            3PUTLAM                              * B9BC3
            1GETLAM                              * B9BC8
            CONTEXT!                             * B9BCD
            DUP                                  * B9BD2
            XEQRCL                               * B9BD7
            DUP                                  * B9BDC
            4PUTLAM                              * B9BE1
            2GETLAM                              * B9BE6
            EVAL                                 * B9BEB
            ERRSET                               * B9BF0
            ::                                   * B9BF5
              ISTOP-INDEX                        * B9BFA
              #3+PICK                            * B9BFF
              CONTEXT!                           * B9C04
              ISTOP-INDEX                        * B9C09
              #2+PICK                            * B9C0E
              DUP#0=ITE                          * B9C13
              DROPSWAP                           * B9C18
              ROTDROP                            * B9C1D
              STRIPTAGSl2                        * B9C22
              XEQSTOID                           * B9C27
            ;                                    * B9C2C
            ERRTRAP                              * B9C31
            ::                                   * B9C36
              1GETLAM                            * B9C3B
              CONTEXT!                           * B9C40
              4GETLAM                            * B9C45
              3GETLAM                            * B9C4A
              2GETLAM                            * B9C4F
              TYPECOL?                           * B9C54
              IT                                 * B9C59
              XEQSTOID                           * B9C5E
              ERRJMP                             * B9C63
            ;                                    * B9C68
            LOOP                                 * B9C6D
          ;                                      * B9C72
          ERRTRAP                                * B9C77
          ::                                     * B9C7C
            1GETABND                             * B9C81
            CONTEXT!                             * B9C86
            ERRJMP                               * B9C8B
          ;                                      * B9C90
          1GETABND                               * B9C95
          CONTEXT!                               * B9C9A
          2DROP                                  * B9C9F
        ;                                        * B9CA4

* ROMPTR 0B5 166
* refs (1): B4B39
ROMP_0B5_166:
        ::                                       * B9CA9
          DUPTYPEIDNT?                           * B9CAE
          case                                   * B9CB3
          ::                                     * B9CB8
            dup;RclInVars(gn)?                   * B9CBD
            NOTcase                              * B9CC2
            FalseFalse                           * B9CC7
            TYPERRP?                             * B9CCC
            NOTcase                              * B9CD1
            TrueFalse                            * B9CD6
            EVAL                                 * B9CDB
            TRUE                                 * B9CE0
          ;                                      * B9CE5
          '                                      * B9CEA
          xHOME                                  * B9CEF
          OVER                                   * B9CF4
          EQ                                     * B9CF9
          '                                      * B9CFE
          xUPDIR                                 * B9D03
          3PICK                                  * B9D08
          EQOR                                   * B9D0D
          NOTcase                                * B9D12
          SETTYPEERR                             * B9D17
          EvalNoCK                               * B9D1C
          TRUE                                   * B9D21
        ;                                        * B9D26

* ROMPTR 0B5 167
* refs (1): B4B39
ROMP_0B5_167:
        ::                                       * B9D2B
          '                                      * B9D30
          ::                                     * B9D35
            DUPTYPERRP?                          * B9D3A
            3PICKSWAP                            * B9D3F
            ITE                                  * B9D44
            DIRARGERR                            * B9D49
            ?PURGE_HERE                          * B9D4E
          ;                                      * B9D53
          ROMPTR  0B5 165                        * B9D58
        ;                                        * B9D63

* ROMPTR 0B5 168
* refs (1): B4B39
ROMP_0B5_168:
        ::                                       * B9D68
          DUPTYPEIDNT?                           * B9D6D
          case                                   * B9D72
          ?PURGE_HERE                            * B9D77
          purge(li)                              * B9D7C
        ;                                        * B9D81

* ROMPTR 0B5 169
* refs (1): B4B39
ROMP_0B5_169:
        ::                                       * B9D86
          DUPTYPELIST?                           * B9D8B
          ITE                                    * B9D90
          INNERCOMP                              * B9D95
          BINT1                                  * B9D9A
          ZEROSWAP                               * B9D9F
          DUP#0=csDROP                           * B9DA4
          ZERO_DO                                * B9DA9
          SWAP                                   * B9DAE
          VARSIZE                                * B9DB3
          SWAPDROP                               * B9DB8
          COERCE                                 * B9DBD
          #+                                     * B9DC2
          LOOP                                   * B9DC7
        ;                                        * B9DCC

* ROMPTR 0B5 16A
* refs (1): B4B39
ROMP_0B5_16A:
        ::                                       * B9DD1
          GARBAGE                                * B9DD6
          MEM                                    * B9DDB
          #2/                                    * B9DE0
        ;                                        * B9DE5

LIB0B5.hash:
        CON(5)  DOHSTR                           * B9DEA  hash table of library 0B5
        LENGTH                                   * B9DEF  length, to #B9E4E
        CON(5)  0                                * B9DF4  names of length 1
        CON(5)  0                                * B9DF9  names of length 2
        CON(5)  0                                * B9DFE  names of length 3
        CON(5)  0                                * B9E03  names of length 4
        CON(5)  0                                * B9E08  names of length 5
        CON(5)  0                                * B9E0D  names of length 6
        CON(5)  0                                * B9E12  names of length 7
        CON(5)  0                                * B9E17  names of length 8
        CON(5)  0                                * B9E1C  names of length 9
        CON(5)  0                                * B9E21  names of length 10
        CON(5)  0                                * B9E26  names of length 11
        CON(5)  0                                * B9E2B  names of length 12
        CON(5)  0                                * B9E30  names of length 13
        CON(5)  0                                * B9E35  names of length 14
        CON(5)  0                                * B9E3A  names of length 15
        CON(5)  0                                * B9E3F  names of length 16
        REL(5)  L_B9E49                          * B9E44  end of the names
L_B9E49:
        CON(5)  0                                * B9E49  command 000 has no name
        ENDLENGTH                                * B9E4E

LIB0B5.link:
        CON(5)  DOHSTR                           * B9E4E  link table of library 0B5
        LENGTH                                   * B9E53  length, to #BA56F
        REL(5)  ROMP_0B5_000                     * B9E58  000 
        REL(5)  ROMP_0B5_001                     * B9E5D  001 
        REL(5)  ROMP_0B5_002                     * B9E62  002 
        REL(5)  ROMP_0B5_003                     * B9E67  003 
        REL(5)  ROMP_0B5_004                     * B9E6C  004 
        REL(5)  ROMP_0B5_005                     * B9E71  005 
        REL(5)  ROMP_0B5_006                     * B9E76  006 
        REL(5)  ROMP_0B5_007                     * B9E7B  007 
        REL(5)  ROMP_0B5_008                     * B9E80  008 
        REL(5)  ROMP_0B5_009                     * B9E85  009 
        REL(5)  ROMP_0B5_00A                     * B9E8A  00A 
        REL(5)  ROMP_0B5_00B                     * B9E8F  00B 
        REL(5)  ROMP_0B5_00C                     * B9E94  00C 
        REL(5)  ROMP_0B5_00D                     * B9E99  00D 
        REL(5)  ROMP_0B5_00E                     * B9E9E  00E 
        REL(5)  ROMP_0B5_00F                     * B9EA3  00F 
        REL(5)  ROMP_0B5_010                     * B9EA8  010 
        REL(5)  ROMP_0B5_011                     * B9EAD  011 
        REL(5)  ROMP_0B5_012                     * B9EB2  012 
        REL(5)  ROMP_0B5_013                     * B9EB7  013 
        REL(5)  ROMP_0B5_014                     * B9EBC  014 
        REL(5)  ROMP_0B5_015                     * B9EC1  015 
        REL(5)  ROMP_0B5_016                     * B9EC6  016 
        REL(5)  ROMP_0B5_017                     * B9ECB  017 
        REL(5)  ROMP_0B5_018                     * B9ED0  018 
        REL(5)  ROMP_0B5_019                     * B9ED5  019 
        REL(5)  ROMP_0B5_01A                     * B9EDA  01A 
        REL(5)  ROMP_0B5_01B                     * B9EDF  01B 
        REL(5)  ROMP_0B5_01C                     * B9EE4  01C 
        REL(5)  ROMP_0B5_01D                     * B9EE9  01D 
        REL(5)  ROMP_0B5_01E                     * B9EEE  01E 
        REL(5)  ROMP_0B5_01F                     * B9EF3  01F 
        REL(5)  ROMP_0B5_020                     * B9EF8  020 
        REL(5)  ROMP_0B5_021                     * B9EFD  021 
        REL(5)  ROMP_0B5_022                     * B9F02  022 
        REL(5)  ROMP_0B5_023                     * B9F07  023 
        REL(5)  ROMP_0B5_024                     * B9F0C  024 
        REL(5)  ROMP_0B5_025                     * B9F11  025 
        REL(5)  ROMP_0B5_026                     * B9F16  026 
        REL(5)  ROMP_0B5_027                     * B9F1B  027 
        REL(5)  ROMP_0B5_028                     * B9F20  028 
        REL(5)  ROMP_0B5_029                     * B9F25  029 
        REL(5)  ROMP_0B5_02A                     * B9F2A  02A 
        REL(5)  ROMP_0B5_02B                     * B9F2F  02B 
        REL(5)  ROMP_0B5_02C                     * B9F34  02C 
        REL(5)  ROMP_0B5_02D                     * B9F39  02D 
        REL(5)  ROMP_0B5_02F                     * B9F3E  02E 
        REL(5)  ROMP_0B5_02F                     * B9F43  02F 
        REL(5)  ROMP_0B5_030                     * B9F48  030 
        REL(5)  ROMP_0B5_031                     * B9F4D  031 
        REL(5)  ROMP_0B5_032                     * B9F52  032 
        REL(5)  ROMP_0B5_035                     * B9F57  033 
        REL(5)  ROMP_0B5_035                     * B9F5C  034 
        REL(5)  ROMP_0B5_035                     * B9F61  035 
        REL(5)  ROMP_0B5_036                     * B9F66  036 
        REL(5)  ROMP_0B5_039                     * B9F6B  037 
        REL(5)  ROMP_0B5_039                     * B9F70  038 
        REL(5)  ROMP_0B5_039                     * B9F75  039 
        REL(5)  ROMP_0B5_03A                     * B9F7A  03A 
        REL(5)  ROMP_0B5_03B                     * B9F7F  03B 
        REL(5)  ROMP_0B5_03C                     * B9F84  03C 
        REL(5)  ROMP_0B5_03E                     * B9F89  03D 
        REL(5)  ROMP_0B5_03E                     * B9F8E  03E 
        REL(5)  ROMP_0B5_03F                     * B9F93  03F 
        REL(5)  ROMP_0B5_040                     * B9F98  040 
        REL(5)  ROMP_0B5_041                     * B9F9D  041 
        REL(5)  ROMP_0B5_042                     * B9FA2  042 
        REL(5)  ROMP_0B5_043                     * B9FA7  043 
        REL(5)  ROMP_0B5_045                     * B9FAC  044 
        REL(5)  ROMP_0B5_045                     * B9FB1  045 
        REL(5)  ROMP_0B5_047                     * B9FB6  046 
        REL(5)  ROMP_0B5_047                     * B9FBB  047 
        REL(5)  ROMP_0B5_049                     * B9FC0  048 
        REL(5)  ROMP_0B5_049                     * B9FC5  049 
        REL(5)  ROMP_0B5_04A                     * B9FCA  04A 
        REL(5)  ROMP_0B5_04F                     * B9FCF  04B 
        REL(5)  ROMP_0B5_04F                     * B9FD4  04C 
        REL(5)  ROMP_0B5_04F                     * B9FD9  04D 
        REL(5)  ROMP_0B5_04F                     * B9FDE  04E 
        REL(5)  ROMP_0B5_04F                     * B9FE3  04F 
        REL(5)  ROMP_0B5_050                     * B9FE8  050 
        REL(5)  ROMP_0B5_051                     * B9FED  051 
        REL(5)  ROMP_0B5_052                     * B9FF2  052 
        REL(5)  ROMP_0B5_053                     * B9FF7  053 
        REL(5)  ROMP_0B5_054                     * B9FFC  054 
        REL(5)  ROMP_0B5_055                     * BA001  055 
        REL(5)  ROMP_0B5_056                     * BA006  056 
        REL(5)  ROMP_0B5_057                     * BA00B  057 
        REL(5)  ROMP_0B5_058                     * BA010  058 
        REL(5)  ROMP_0B5_059                     * BA015  059 
        REL(5)  ROMP_0B5_05A                     * BA01A  05A 
        REL(5)  ROMP_0B5_05B                     * BA01F  05B 
        REL(5)  ROMP_0B5_05C                     * BA024  05C 
        REL(5)  ROMP_0B5_05D                     * BA029  05D 
        REL(5)  ROMP_0B5_05E                     * BA02E  05E 
        REL(5)  ROMP_0B5_05F                     * BA033  05F 
        REL(5)  ROMP_0B5_060                     * BA038  060 
        REL(5)  ROMP_0B5_061                     * BA03D  061 
        REL(5)  ROMP_0B5_062                     * BA042  062 
        REL(5)  ROMP_0B5_063                     * BA047  063 
        REL(5)  ROMP_0B5_064                     * BA04C  064 
        REL(5)  ROMP_0B5_065                     * BA051  065 
        REL(5)  ROMP_0B5_066                     * BA056  066 
        REL(5)  ROMP_0B5_067                     * BA05B  067 
        REL(5)  ROMP_0B5_068                     * BA060  068 
        REL(5)  ROMP_0B5_069                     * BA065  069 
        REL(5)  ROMP_0B5_06A                     * BA06A  06A 
        REL(5)  ROMP_0B5_06B                     * BA06F  06B 
        REL(5)  ROMP_0B5_06C                     * BA074  06C 
        REL(5)  ROMP_0B5_06D                     * BA079  06D 
        REL(5)  ROMP_0B5_06E                     * BA07E  06E 
        REL(5)  ROMP_0B5_06F                     * BA083  06F 
        REL(5)  ROMP_0B5_070                     * BA088  070 
        REL(5)  ROMP_0B5_071                     * BA08D  071 
        REL(5)  ROMP_0B5_072                     * BA092  072 
        REL(5)  ROMP_0B5_073                     * BA097  073 
        REL(5)  ROMP_0B5_074                     * BA09C  074 
        REL(5)  ROMP_0B5_075                     * BA0A1  075 
        REL(5)  ROMP_0B5_076                     * BA0A6  076 
        REL(5)  ROMP_0B5_077                     * BA0AB  077 
        REL(5)  ROMP_0B5_078                     * BA0B0  078 
        REL(5)  ROMP_0B5_079                     * BA0B5  079 
        REL(5)  ROMP_0B5_07A                     * BA0BA  07A 
        REL(5)  ROMP_0B5_07B                     * BA0BF  07B 
        REL(5)  ROMP_0B5_07C                     * BA0C4  07C 
        REL(5)  ROMP_0B5_07D                     * BA0C9  07D 
        REL(5)  ROMP_0B5_07E                     * BA0CE  07E 
        REL(5)  ROMP_0B5_07F                     * BA0D3  07F 
        REL(5)  ROMP_0B5_080                     * BA0D8  080 
        REL(5)  ROMP_0B5_081                     * BA0DD  081 
        REL(5)  ROMP_0B5_082                     * BA0E2  082 
        REL(5)  ROMP_0B5_083                     * BA0E7  083 
        REL(5)  ROMP_0B5_084                     * BA0EC  084 
        REL(5)  ROMP_0B5_085                     * BA0F1  085 
        REL(5)  ROMP_0B5_086                     * BA0F6  086 
        REL(5)  ROMP_0B5_087                     * BA0FB  087 
        REL(5)  ROMP_0B5_088                     * BA100  088 
        REL(5)  ROMP_0B5_089                     * BA105  089 
        REL(5)  ROMP_0B5_08A                     * BA10A  08A 
        REL(5)  ROMP_0B5_08B                     * BA10F  08B 
        REL(5)  ROMP_0B5_08C                     * BA114  08C 
        REL(5)  ROMP_0B5_08D                     * BA119  08D 
        REL(5)  ROMP_0B5_08E                     * BA11E  08E 
        REL(5)  ROMP_0B5_08F                     * BA123  08F 
        REL(5)  ROMP_0B5_090                     * BA128  090 
        REL(5)  ROMP_0B5_091                     * BA12D  091 
        REL(5)  ROMP_0B5_092                     * BA132  092 
        REL(5)  ROMP_0B5_093                     * BA137  093 
        REL(5)  ROMP_0B5_094                     * BA13C  094 
        REL(5)  ROMP_0B5_095                     * BA141  095 
        REL(5)  ROMP_0B5_096                     * BA146  096 
        REL(5)  ROMP_0B5_097                     * BA14B  097 
        REL(5)  ROMP_0B5_098                     * BA150  098 
        REL(5)  ROMP_0B5_099                     * BA155  099 
        REL(5)  ROMP_0B5_09A                     * BA15A  09A 
        REL(5)  ROMP_0B5_09B                     * BA15F  09B 
        REL(5)  ROMP_0B5_09C                     * BA164  09C 
        REL(5)  ROMP_0B5_09D                     * BA169  09D 
        REL(5)  ROMP_0B5_09E                     * BA16E  09E 
        REL(5)  ROMP_0B5_09F                     * BA173  09F 
        REL(5)  ROMP_0B5_0A0                     * BA178  0A0 
        REL(5)  ROMP_0B5_0A1                     * BA17D  0A1 
        REL(5)  ROMP_0B5_0A2                     * BA182  0A2 
        REL(5)  ROMP_0B5_0A3                     * BA187  0A3 
        REL(5)  ROMP_0B5_0A4                     * BA18C  0A4 
        REL(5)  ROMP_0B5_0A5                     * BA191  0A5 
        REL(5)  ROMP_0B5_0A6                     * BA196  0A6 
        REL(5)  ROMP_0B5_0A7                     * BA19B  0A7 
        REL(5)  ROMP_0B5_0A8                     * BA1A0  0A8 
        REL(5)  ROMP_0B5_0A9                     * BA1A5  0A9 
        REL(5)  ROMP_0B5_0AA                     * BA1AA  0AA 
        REL(5)  ROMP_0B5_0AB                     * BA1AF  0AB 
        REL(5)  ROMP_0B5_0AC                     * BA1B4  0AC 
        REL(5)  ROMP_0B5_0AD                     * BA1B9  0AD 
        REL(5)  ROMP_0B5_0AE                     * BA1BE  0AE 
        REL(5)  ROMP_0B5_0AF                     * BA1C3  0AF 
        REL(5)  ROMP_0B5_0B0                     * BA1C8  0B0 
        REL(5)  ROMP_0B5_0B1                     * BA1CD  0B1 
        REL(5)  ROMP_0B5_0B2                     * BA1D2  0B2 
        REL(5)  ROMP_0B5_0B3                     * BA1D7  0B3 
        REL(5)  ROMP_0B5_0B4                     * BA1DC  0B4 
        REL(5)  ROMP_0B5_0B5                     * BA1E1  0B5 
        REL(5)  ROMP_0B5_0B6                     * BA1E6  0B6 
        REL(5)  ROMP_0B5_0B7                     * BA1EB  0B7 
        REL(5)  ROMP_0B5_0B8                     * BA1F0  0B8 
        REL(5)  ROMP_0B5_0B9                     * BA1F5  0B9 
        REL(5)  ROMP_0B5_0BA                     * BA1FA  0BA 
        REL(5)  ROMP_0B5_0BB                     * BA1FF  0BB 
        REL(5)  ROMP_0B5_0BC                     * BA204  0BC 
        REL(5)  ROMP_0B5_0BD                     * BA209  0BD 
        REL(5)  ROMP_0B5_0BE                     * BA20E  0BE 
        REL(5)  ROMP_0B5_0BF                     * BA213  0BF 
        REL(5)  ROMP_0B5_0C0                     * BA218  0C0 
        REL(5)  ROMP_0B5_0C1                     * BA21D  0C1 
        REL(5)  ROMP_0B5_0C2                     * BA222  0C2 
        REL(5)  ROMP_0B5_0C3                     * BA227  0C3 
        REL(5)  ROMP_0B5_0C4                     * BA22C  0C4 
        REL(5)  ROMP_0B5_0C5                     * BA231  0C5 
        REL(5)  ROMP_0B5_0C6                     * BA236  0C6 
        REL(5)  ROMP_0B5_0C7                     * BA23B  0C7 
        REL(5)  ROMP_0B5_0C8                     * BA240  0C8 
        REL(5)  ROMP_0B5_0C9                     * BA245  0C9 
        REL(5)  ROMP_0B5_0CA                     * BA24A  0CA 
        REL(5)  ROMP_0B5_0CB                     * BA24F  0CB 
        REL(5)  ROMP_0B5_0CC                     * BA254  0CC 
        REL(5)  ROMP_0B5_0CD                     * BA259  0CD 
        REL(5)  ROMP_0B5_0CE                     * BA25E  0CE 
        REL(5)  ROMP_0B5_0CF                     * BA263  0CF 
        REL(5)  ROMP_0B5_0D0                     * BA268  0D0 
        REL(5)  ROMP_0B5_0D1                     * BA26D  0D1 
        REL(5)  ROMP_0B5_0D2                     * BA272  0D2 
        REL(5)  ROMP_0B5_0D3                     * BA277  0D3 
        REL(5)  ROMP_0B5_0D4                     * BA27C  0D4 
        REL(5)  ROMP_0B5_0D5                     * BA281  0D5 
        REL(5)  ROMP_0B5_0D6                     * BA286  0D6 
        REL(5)  ROMP_0B5_0D7                     * BA28B  0D7 
        REL(5)  ROMP_0B5_0D8                     * BA290  0D8 
        REL(5)  ROMP_0B5_0D9                     * BA295  0D9 
        REL(5)  ROMP_0B5_0DA                     * BA29A  0DA 
        REL(5)  ROMP_0B5_0DB                     * BA29F  0DB 
        REL(5)  ROMP_0B5_0DC                     * BA2A4  0DC 
        REL(5)  ROMP_0B5_0DD                     * BA2A9  0DD 
        REL(5)  ROMP_0B5_0DE                     * BA2AE  0DE 
        REL(5)  ROMP_0B5_0DF                     * BA2B3  0DF 
        REL(5)  ROMP_0B5_0E0                     * BA2B8  0E0 
        REL(5)  ROMP_0B5_0E1                     * BA2BD  0E1 
        REL(5)  ROMP_0B5_0E2                     * BA2C2  0E2 
        REL(5)  ROMP_0B5_0E3                     * BA2C7  0E3 
        REL(5)  ROMP_0B5_0E4                     * BA2CC  0E4 
        REL(5)  ROMP_0B5_0E5                     * BA2D1  0E5 
        REL(5)  ROMP_0B5_0E6                     * BA2D6  0E6 
        REL(5)  ROMP_0B5_0E7                     * BA2DB  0E7 
        REL(5)  ROMP_0B5_0E8                     * BA2E0  0E8 
        REL(5)  ROMP_0B5_0E9                     * BA2E5  0E9 
        REL(5)  ROMP_0B5_0EA                     * BA2EA  0EA 
        REL(5)  ROMP_0B5_0EB                     * BA2EF  0EB 
        REL(5)  ROMP_0B5_0EC                     * BA2F4  0EC 
        REL(5)  ROMP_0B5_0ED                     * BA2F9  0ED 
        REL(5)  ROMP_0B5_0EE                     * BA2FE  0EE 
        REL(5)  ROMP_0B5_0EF                     * BA303  0EF 
        REL(5)  ROMP_0B5_0F0                     * BA308  0F0 
        REL(5)  ROMP_0B5_0F1                     * BA30D  0F1 
        REL(5)  ROMP_0B5_0F2                     * BA312  0F2 
        REL(5)  ROMP_0B5_0F3                     * BA317  0F3 
        REL(5)  ROMP_0B5_0F4                     * BA31C  0F4 
        REL(5)  ROMP_0B5_0F5                     * BA321  0F5 
        REL(5)  ROMP_0B5_0F6                     * BA326  0F6 
        REL(5)  ROMP_0B5_0F7                     * BA32B  0F7 
        REL(5)  ROMP_0B5_0F8                     * BA330  0F8 
        REL(5)  ROMP_0B5_0F9                     * BA335  0F9 
        REL(5)  ROMP_0B5_0FA                     * BA33A  0FA 
        REL(5)  ROMP_0B5_0FB                     * BA33F  0FB 
        REL(5)  ROMP_0B5_0FC                     * BA344  0FC 
        REL(5)  ROMP_0B5_0FD                     * BA349  0FD 
        REL(5)  ROMP_0B5_0FE                     * BA34E  0FE 
        REL(5)  ROMP_0B5_0FF                     * BA353  0FF 
        REL(5)  ROMP_0B5_100                     * BA358  100 
        REL(5)  ROMP_0B5_101                     * BA35D  101 
        REL(5)  ROMP_0B5_102                     * BA362  102 
        REL(5)  ROMP_0B5_103                     * BA367  103 
        REL(5)  ROMP_0B5_104                     * BA36C  104 
        REL(5)  ROMP_0B5_105                     * BA371  105 
        REL(5)  ROMP_0B5_106                     * BA376  106 
        REL(5)  ROMP_0B5_107                     * BA37B  107 
        REL(5)  ROMP_0B5_108                     * BA380  108 
        REL(5)  ROMP_0B5_109                     * BA385  109 
        REL(5)  ROMP_0B5_10A                     * BA38A  10A 
        REL(5)  ROMP_0B5_10B                     * BA38F  10B 
        REL(5)  ROMP_0B5_10C                     * BA394  10C 
        REL(5)  ROMP_0B5_10D                     * BA399  10D 
        REL(5)  ROMP_0B5_10E                     * BA39E  10E 
        REL(5)  ROMP_0B5_10F                     * BA3A3  10F 
        REL(5)  ROMP_0B5_110                     * BA3A8  110 
        REL(5)  ROMP_0B5_111                     * BA3AD  111 
        REL(5)  ROMP_0B5_112                     * BA3B2  112 
        REL(5)  ROMP_0B5_113                     * BA3B7  113 
        REL(5)  ROMP_0B5_114                     * BA3BC  114 
        REL(5)  ROMP_0B5_115                     * BA3C1  115 
        REL(5)  ROMP_0B5_116                     * BA3C6  116 
        REL(5)  ROMP_0B5_117                     * BA3CB  117 
        REL(5)  ROMP_0B5_118                     * BA3D0  118 
        REL(5)  ROMP_0B5_119                     * BA3D5  119 
        REL(5)  ROMP_0B5_11A                     * BA3DA  11A 
        REL(5)  ROMP_0B5_11B                     * BA3DF  11B 
        REL(5)  ROMP_0B5_11C                     * BA3E4  11C 
        REL(5)  ROMP_0B5_11D                     * BA3E9  11D 
        REL(5)  ROMP_0B5_11E                     * BA3EE  11E 
        REL(5)  ROMP_0B5_11F                     * BA3F3  11F 
        REL(5)  ROMP_0B5_120                     * BA3F8  120 
        REL(5)  ROMP_0B5_121                     * BA3FD  121 
        REL(5)  ROMP_0B5_122                     * BA402  122 
        REL(5)  ROMP_0B5_123                     * BA407  123 
        REL(5)  ROMP_0B5_124                     * BA40C  124 
        REL(5)  ROMP_0B5_125                     * BA411  125 
        REL(5)  ROMP_0B5_126                     * BA416  126 
        REL(5)  ROMP_0B5_127                     * BA41B  127 
        REL(5)  ROMP_0B5_128                     * BA420  128 
        REL(5)  ROMP_0B5_129                     * BA425  129 
        REL(5)  ROMP_0B5_12A                     * BA42A  12A 
        REL(5)  ROMP_0B5_12B                     * BA42F  12B 
        REL(5)  ROMP_0B5_12C                     * BA434  12C 
        REL(5)  ROMP_0B5_12D                     * BA439  12D 
        REL(5)  ROMP_0B5_12E                     * BA43E  12E 
        REL(5)  ROMP_0B5_12F                     * BA443  12F 
        REL(5)  ROMP_0B5_130                     * BA448  130 
        REL(5)  ROMP_0B5_131                     * BA44D  131 
        REL(5)  ROMP_0B5_132                     * BA452  132 
        REL(5)  ROMP_0B5_133                     * BA457  133 
        REL(5)  ROMP_0B5_134                     * BA45C  134 
        REL(5)  ROMP_0B5_135                     * BA461  135 
        REL(5)  ROMP_0B5_136                     * BA466  136 
        REL(5)  ROMP_0B5_137                     * BA46B  137 
        REL(5)  ROMP_0B5_138                     * BA470  138 
        REL(5)  ROMP_0B5_139                     * BA475  139 
        REL(5)  ROMP_0B5_13A                     * BA47A  13A 
        REL(5)  ROMP_0B5_13B                     * BA47F  13B 
        REL(5)  ROMP_0B5_13C                     * BA484  13C 
        REL(5)  ROMP_0B5_13D                     * BA489  13D 
        REL(5)  ROMP_0B5_13E                     * BA48E  13E 
        REL(5)  ROMP_0B5_13F                     * BA493  13F 
        REL(5)  ROMP_0B5_140                     * BA498  140 
        REL(5)  ROMP_0B5_141                     * BA49D  141 
        REL(5)  ROMP_0B5_142                     * BA4A2  142 
        REL(5)  ROMP_0B5_143                     * BA4A7  143 
        REL(5)  ROMP_0B5_144                     * BA4AC  144 
        REL(5)  ROMP_0B5_145                     * BA4B1  145 
        REL(5)  ROMP_0B5_146                     * BA4B6  146 
        REL(5)  ROMP_0B5_147                     * BA4BB  147 
        REL(5)  ROMP_0B5_148                     * BA4C0  148 
        REL(5)  ROMP_0B5_149                     * BA4C5  149 
        REL(5)  ROMP_0B5_14A                     * BA4CA  14A 
        REL(5)  ROMP_0B5_14B                     * BA4CF  14B 
        REL(5)  ROMP_0B5_14C                     * BA4D4  14C 
        REL(5)  ROMP_0B5_14D                     * BA4D9  14D 
        REL(5)  ROMP_0B5_14E                     * BA4DE  14E 
        REL(5)  ROMP_0B5_14F                     * BA4E3  14F 
        REL(5)  ROMP_0B5_150                     * BA4E8  150 
        REL(5)  ROMP_0B5_151                     * BA4ED  151 
        REL(5)  ROMP_0B5_152                     * BA4F2  152 
        REL(5)  ROMP_0B5_153                     * BA4F7  153 
        REL(5)  ROMP_0B5_154                     * BA4FC  154 
        REL(5)  ROMP_0B5_155                     * BA501  155 
        REL(5)  ROMP_0B5_156                     * BA506  156 
        REL(5)  ROMP_0B5_157                     * BA50B  157 
        REL(5)  ROMP_0B5_158                     * BA510  158 
        REL(5)  ROMP_0B5_159                     * BA515  159 
        REL(5)  ROMP_0B5_15A                     * BA51A  15A 
        REL(5)  ROMP_0B5_15C                     * BA51F  15B 
        REL(5)  ROMP_0B5_15C                     * BA524  15C 
        REL(5)  ROMP_0B5_15D                     * BA529  15D 
        REL(5)  ROMP_0B5_15E                     * BA52E  15E 
        REL(5)  ROMP_0B5_15F                     * BA533  15F 
        REL(5)  ROMP_0B5_160                     * BA538  160 
        REL(5)  ROMP_0B5_161                     * BA53D  161 
        REL(5)  ROMP_0B5_162                     * BA542  162 
        REL(5)  ROMP_0B5_163                     * BA547  163 
        REL(5)  ROMP_0B5_164                     * BA54C  164 
        REL(5)  ROMP_0B5_165                     * BA551  165 
        REL(5)  ROMP_0B5_166                     * BA556  166 
        REL(5)  ROMP_0B5_167                     * BA55B  167 
        REL(5)  ROMP_0B5_168                     * BA560  168 
        REL(5)  ROMP_0B5_169                     * BA565  169 
        REL(5)  ROMP_0B5_16A                     * BA56A  16A 
        ENDLENGTH                                * BA56F
        NIBHEX  5444000                          * BA56F  ED.
