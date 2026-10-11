* HP 48GX ROM revision R, #C78DB-#CA95A: Library part 0C1
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #C78DB in the original ROM).

LIB0C1:
        CON(3)  #0C1                             * C78DB  library number
        REL(5)  LIB0C1.hash                      * C78DE  hash table
        CON(5)  0                                * C78E3  message table
        REL(5)  LIB0C1.link                      * C78E8  link table
        CON(5)  0                                * C78ED  config
        RPL

* ROMPTR 0C1 000
* refs (1): C78DB
ROMP_0C1_000:
        ::                                       * C78F2
          DEPTH                                  * C78F7
          #5-                                    * C78FC
          6PICK                                  * C7901
          ROMPTR  0C1 011                        * C7906
          5ROLLDROP                              * C7911
          ERRSET                                 * C7916
          ROMPTR  0C1 001                        * C791B
          ERRTRAP                                * C7926
          ::                                     * C792B
            ERROR@                               * C7930
            #0=?SEMI                             * C7935
            ERRJMP                               * C793A
          ;                                      * C793F
          5GETLAM                                * C7944
          RESETDEPTH                             * C7949
          ABND                                   * C794E
          ATTNFLGCLR                             * C7953
        ;                                        * C7958

* ROMPTR 0C1 001
* refs (1): C78DB
ROMP_0C1_001:
        ::                                       * C795D
          ROMPTR  0C1 002                        * C7962
          case                                   * C796D
          ABND                                   * C7972
          ROT                                    * C7977
          3NULLLAM{}                             * C797C
          BIND                                   * C7981
          11GETLAM                               * C7986
          ROMPTR  0C1 00C                        * C798B
          3GETLAM                                * C7996
          2GETLAM                                * C799B
          ROT                                    * C79A0
          3PUTLAM                                * C79A5
          RESOROMP                               * C79AA
          ROMPTR  0C1 00D                        * C79AF
          11PUTLAM                               * C79BA
          8GETLAM                                * C79BF
          3PICK                                  * C79C4
          %>                                     * C79C9
          ?SKIP                                  * C79CE
          ::                                     * C79D3
            5GETLAM                              * C79D8
            %%CHS                                * C79DD
            5PUTLAM                              * C79E2
            %%CHS                                * C79E7
            FALSE                                * C79EC
            12PUTLAM                             * C79F1
          ;                                      * C79F6
          SWAP                                   * C79FB
          BEGIN                                  * C7A00
          5GETLAM                                * C7A05
          ::                                     * C7A0A
            4dropn;IU!                           * C7A0F
            caseDROP                             * C7A14
            ROT                                  * C7A19
            12GETLAM                             * C7A1E
            ITE                                  * C7A23
            OBJ_37DA0                            * C7A28
            %%MAX                                * C7A2D
            SWAP                                 * C7A32
          ;                                      * C7A37
          8GETLAM                                * C7A3C
          12GETLAM                               * C7A41
          ITE                                    * C7A46
          OBJ_7CE00                              * C7A4B
          OBJ_7CE32                              * C7A50
          11GETLAM                               * C7A55
          EVAL                                   * C7A5A
          LAM     'T                             * C7A5F
          OBJ_36DDF                              * C7A6A
          DUP                                    * C7A6F
          LAM     'W                             * C7A74
          OBJ_36E5C                              * C7A7F
          10GETLAM                               * C7A84
          9GETLAM                                * C7A89
          OBJ_36EFC                              * C7A8E
          13GETLAM                               * C7A93
          14GETLAM                               * C7A98
          getypos                                * C7A9D
          OBJ_506C2                              * C7AA2
          SWAP                                   * C7AA7
          15GETLAM                               * C7AAC
          16GETLAM                               * C7AB1
          getxpos                                * C7AB6
          OBJ_506C2                              * C7ABB
          SWAP                                   * C7AC0
          6GETLAM                                * C7AC5
          7GETLAM                                * C7ACA
          2OVER                                  * C7ACF
          DRAWLINE#3                             * C7AD4
          7PUTLAM                                * C7AD9
          6PUTLAM                                * C7ADE
          8GETLAM                                * C7AE3
          OVER                                   * C7AE8
          12GETLAM                               * C7AED
          ITE                                    * C7AF2
          %<=                                    * C7AF7
          %>=                                    * C7AFC
          UNTIL                                  * C7B01
          2DROP                                  * C7B06
          ABND                                   * C7B0B
          ABND                                   * C7B10
        ;                                        * C7B15

* ROMPTR 0C1 002
* refs (1): C78DB
ROMP_0C1_002:
        ::                                       * C7B1A
          3PICK                                  * C7B1F
          %0>                                    * C7B24
          NOTcase                                * C7B29
          SETSIZEERR                             * C7B2E
          GETPMIN&MAX                            * C7B33
          RclMaxStdPict                          * C7B38
          OBJ_4F2CD                              * C7B3D
          TRUE                                   * C7B42
          %0_2A2B4                               * C7B47
          BINT10                                 * C7B4C
          ROLL                                   * C7B51
          BINT10                                 * C7B56
          ROLL                                   * C7B5B
          BINT9                                  * C7B60
          ROLL                                   * C7B65
          %0_2A2B4                               * C7B6A
          %0_2A2B4                               * C7B6F
          BINT12                                 * C7B74
          ROLL                                   * C7B79
          %ABS                                   * C7B7E
          %>%%                                   * C7B83
          {                                      * C7B88
            NULLLAM                              * C7B8D
            NULLLAM                              * C7B92
            NULLLAM                              * C7B97
            NULLLAM                              * C7B9C
            NULLLAM                              * C7BA1
            NULLLAM                              * C7BA6
            NULLLAM                              * C7BAB
            NULLLAM                              * C7BB0
            NULLLAM                              * C7BB5
            NULLLAM                              * C7BBA
            NULLLAM                              * C7BBF
            NULLLAM                              * C7BC4
          }                                      * C7BC9
          BIND                                   * C7BCE
          LAM     'T                             * C7BD3
          OBJ_36DCB                              * C7BDE
          DUP                                    * C7BE3
          2PUTLAM                                * C7BE8
          4GETLAM                                * C7BED
          %=                                     * C7BF2
          caseTRUE                               * C7BF7
          LAM     'W                             * C7BFC
          OBJ_36E43                              * C7C07
          DUPTYPEREAL?                           * C7C0C
          ITE                                    * C7C11
          %1                                     * C7C16
          ::                                     * C7C1B
            DUP                                  * C7C20
            ARSIZE                               * C7C25
            UNCOERCE                             * C7C2A
          ;                                      * C7C2F
          6GETLAM                                * C7C34
          C%>%                                   * C7C39
          2DUP                                   * C7C3E
          %MIN                                   * C7C43
          %0<                                    * C7C48
          case                                   * C7C4D
          SETSIZEERR                             * C7C52
          %MAX                                   * C7C57
          %<                                     * C7C5C
          case                                   * C7C61
          SETSIZEERR                             * C7C66
          DUP                                    * C7C6B
          7PUTLAM                                * C7C70
          LAM     'F                             * C7C75
          SWAP                                   * C7C80
          TYPEREAL?                              * C7C85
          ITE                                    * C7C8A
          ::                                     * C7C8F
            OBJ_36DB7                            * C7C94
            %ABS                                 * C7C99
            %>%%                                 * C7C9E
          ;                                      * C7CA3
          ::                                     * C7CA8
            OBJ_36E20                            * C7CAD
            OBJ_36912                            * C7CB2
          ;                                      * C7CB7
          5GETLAM                                * C7CBC
          SWAPDUP                                * C7CC1
          %%0=                                   * C7CC6
          ITE                                    * C7CCB
          ::                                     * C7CD0
            DROP                                 * C7CD5
            4GETLAM                              * C7CDA
            2GETLAM                              * C7CDF
            %>%%-                                * C7CE4
            %%ABS                                * C7CE9
          ;                                      * C7CEE
          ::                                     * C7CF3
            OVER                                 * C7CF8
            %>%%                                 * C7CFD
            SWAP%%/                              * C7D02
            %%      2E-1                         * C7D07
            %%^                                  * C7D21
            %%      1E-499                       * C7D26
            %%MAX                                * C7D40
          ;                                      * C7D45
          6GETLAM                                * C7D4A
          C%>%                                   * C7D4F
          COERCE2                                * C7D54
          5PUTLAM                                * C7D59
          6PUTLAM                                * C7D5E
          2GETLAM                                * C7D63
          7GETLAM                                * C7D68
          6GETLAM                                * C7D6D
          5GETLAM                                * C7D72
          OBJ_36EFC                              * C7D77
          9GETLAM                                * C7D7C
          10GETLAM                               * C7D81
          getypos                                * C7D86
          OBJ_506C2                              * C7D8B
          3PUTLAM                                * C7D90
          11GETLAM                               * C7D95
          12GETLAM                               * C7D9A
          getxpos                                * C7D9F
          OBJ_506C2                              * C7DA4
          2GETLAM                                * C7DA9
          3UNROLL                                * C7DAE
          2PUTLAM                                * C7DB3
          FALSE                                  * C7DB8
        ;                                        * C7DBD

* ROMPTR 0C1 003
* refs (1): C78DB
ROMP_0C1_003:
        ::                                       * C7DC2
          DEPTH                                  * C7DC7
          #5-                                    * C7DCC
          6PICK                                  * C7DD1
          ROMPTR  0C1 01F                        * C7DD6
          5ROLLDROP                              * C7DE1
          ERRSET                                 * C7DE6
          ROMPTR  0C1 004                        * C7DEB
          ERRTRAP                                * C7DF6
          ::                                     * C7DFB
            ERROR@                               * C7E00
            #0=?SEMI                             * C7E05
            ERRJMP                               * C7E0A
          ;                                      * C7E0F
          7GETLAM                                * C7E14
          RESETDEPTH                             * C7E19
          ABND                                   * C7E1E
          ATTNFLGCLR                             * C7E23
        ;                                        * C7E28

* ROMPTR 0C1 004
* refs (1): C78DB
ROMP_0C1_004:
        ::                                       * C7E2D
          ROMPTR  0C1 002                        * C7E32
          case                                   * C7E3D
          ABND                                   * C7E42
          %0_2A2B4                               * C7E47
          %0_2A2B4                               * C7E4C
          %0_2A2B4                               * C7E51
          %0_2A2B4                               * C7E56
          %0_2A2B4                               * C7E5B
          8ROLL                                  * C7E60
          8NULLLAM{}                             * C7E65
          BIND                                   * C7E6A
          16GETLAM                               * C7E6F
          ROMPTR  0C1 01A                        * C7E74
          5PUTLAM                                * C7E7F
          4PUTLAM                                * C7E84
          3PUTLAM                                * C7E89
          RESOROMP                               * C7E8E
          ROMPTR  0C1 00D                        * C7E93
          6PUTLAM                                * C7E9E
          2GETLAM                                * C7EA3
          8GETLAM                                * C7EA8
          7GETLAM                                * C7EAD
          RESOROMP                               * C7EB2
          ROMPTR  0C1 01B                        * C7EB7
          16PUTLAM                               * C7EC2
          13GETLAM                               * C7EC7
          3PICK                                  * C7ECC
          %>                                     * C7ED1
          ?SKIP                                  * C7ED6
          ::                                     * C7EDB
            10GETLAM                             * C7EE0
            %%CHS                                * C7EE5
            10PUTLAM                             * C7EEA
            %%CHS                                * C7EEF
            FALSE                                * C7EF4
            17PUTLAM                             * C7EF9
          ;                                      * C7EFE
          SWAP                                   * C7F03
          BEGIN                                  * C7F08
          10GETLAM                               * C7F0D
          ::                                     * C7F12
            4dropn;IU!                           * C7F17
            caseDROP                             * C7F1C
            ROT                                  * C7F21
            17GETLAM                             * C7F26
            ITE                                  * C7F2B
            OBJ_37DA0                            * C7F30
            %%MAX                                * C7F35
            SWAP                                 * C7F3A
          ;                                      * C7F3F
          13GETLAM                               * C7F44
          17GETLAM                               * C7F49
          ITE                                    * C7F4E
          OBJ_7CE00                              * C7F53
          OBJ_7CE32                              * C7F58
          SWAP                                   * C7F5D
          16GETLAM                               * C7F62
          EVAL                                   * C7F67
          SWAP                                   * C7F6C
          LAM     'T                             * C7F71
          OBJ_36DDF                              * C7F7C
          DUP                                    * C7F81
          LAM     'W                             * C7F86
          OBJ_36E5C                              * C7F91
          15GETLAM                               * C7F96
          14GETLAM                               * C7F9B
          OBJ_36EFC                              * C7FA0
          18GETLAM                               * C7FA5
          19GETLAM                               * C7FAA
          getypos                                * C7FAF
          OBJ_506C2                              * C7FB4
          SWAP                                   * C7FB9
          20GETLAM                               * C7FBE
          21GETLAM                               * C7FC3
          getxpos                                * C7FC8
          OBJ_506C2                              * C7FCD
          SWAP                                   * C7FD2
          11GETLAM                               * C7FD7
          12GETLAM                               * C7FDC
          2OVER                                  * C7FE1
          DRAWLINE#3                             * C7FE6
          12PUTLAM                               * C7FEB
          11PUTLAM                               * C7FF0
          13GETLAM                               * C7FF5
          OVER                                   * C7FFA
          17GETLAM                               * C7FFF
          ITE                                    * C8004
          %<=                                    * C8009
          %>=                                    * C800E
          UNTIL                                  * C8013
          3DROP                                  * C8018
          ABND                                   * C801D
          ABND                                   * C8022
        ;                                        * C8027

* ROMPTR 0C1 005
* refs (1): C78DB
ROMP_0C1_005:
        ::                                       * C802C
          DEPTH                                  * C8031
          #2-                                    * C8036
          3PICK                                  * C803B
          ROMPTR  0C1 011                        * C8040
          SWAPDROP                               * C804B
          %>%%                                   * C8050
          ERRSET                                 * C8055
          ROMPTR  0C1 007                        * C805A
          ERRTRAP                                * C8065
          ROMPTR  0C1 006                        * C806A
          1PUTLAM                                * C8075
          2PUTLAM                                * C807A
          3PUTLAM                                * C807F
          5GETLAM                                * C8084
          RESETDEPTH                             * C8089
          4GETLAM                                * C808E
          3GETLAM                                * C8093
          %%>%                                   * C8098
          2GETLAM                                * C809D
          OBJ_3798C                              * C80A2
          ITE                                    * C80A7
          %%>%                                   * C80AC
          OBJ_7CDD3                              * C80B1
          1GETABND                               * C80B6
          OBJ_3798C                              * C80BB
          ITE                                    * C80C0
          %%>%                                   * C80C5
          OBJ_7CDD3                              * C80CA
          ATTNFLGCLR                             * C80CF
        ;                                        * C80D4

* ROMPTR 0C1 006
* refs (1): C78DB
ROMP_0C1_006:
        ::                                       * C80D9
          ATTNFLGCLR                             * C80DE
          5GETLAM                                * C80E3
          RESETDEPTH                             * C80E8
          ERRJMP                                 * C80ED
        ;                                        * C80F2

* ROMPTR 0C1 007
* refs (1): C78DB
ROMP_0C1_007:
        ::                                       * C80F7
          %0_2A2B4                               * C80FC
          %0_2A2B4                               * C8101
          ROT                                    * C8106
          %0_2A2B4                               * C810B
          %0_2A2B4                               * C8110
          %0_2A2B4                               * C8115
          %0_2A2B4                               * C811A
          %0_2A2B4                               * C811F
          8NULLLAM{}                             * C8124
          BIND                                   * C8129
          LAM     'T                             * C812E
          OBJ_36DCB                              * C8139
          8PUTLAM                                * C813E
          LAM     'W                             * C8143
          OBJ_36E43                              * C814E
          DUP                                    * C8153
          7PUTLAM                                * C8158
          ROMPTR  0C1 00C                        * C815D
          EVAL                                   * C8168
          ABND                                   * C816D
        ;                                        * C8172

* ROMPTR 0C1 008
* refs (1): C78DB
ROMP_0C1_008:
        ::                                       * C8177
          LAM     'F                             * C817C
          OBJ_36DB7                              * C8187
          %>%%                                   * C818C
          1PUTLAM                                * C8191
          8GETLAM                                * C8196
          ::                                     * C819B
            DUP%0=                               * C81A0
            casedrop                             * C81A5
            %%      1.3E-498                     * C81AA
            %ABS                                 * C81C4
            %       1.3E-10                      * C81C9
            _*(2r);r=>rr                         * C81DE
          ;                                      * C81E3
          6GETLAM                                * C81E8
          %%ABS                                  * C81ED
          %%>=                                   * C81F2
          case                                   * C81F7
          ::                                     * C81FC
            6GETLAM                              * C8201
            1GETLAM                              * C8206
            OVER                                 * C820B
            %%*                                  * C8210
            %%0                                  * C8215
          ;                                      * C821A
          8GETLAM                                * C821F
          %%      2.5E-1                         * C8224
          6GETLAM                                * C823E
          OBJ_37247                              * C8243
          LAM     'T                             * C8248
          OBJ_36EBB                              * C8253
          7GETLAM                                * C8258
          1GETLAM                                * C825D
          %%      2.5E-1                         * C8262
          %%*                                    * C827C
          6GETLAM                                * C8281
          OBJ_37247                              * C8286
          LAM     'W                             * C828B
          OBJ_36EBB                              * C8296
          LAM     'F                             * C829B
          OBJ_36DB7                              * C82A6
          %>%%                                   * C82AB
          2PUTLAM                                * C82B0
          8GETLAM                                * C82B5
          %%      3.75E-1                        * C82BA
          6GETLAM                                * C82D4
          OBJ_37247                              * C82D9
          LAM     'T                             * C82DE
          OBJ_36EBB                              * C82E9
          7GETLAM                                * C82EE
          1GETLAM                                * C82F3
          %%      9.375E-2                       * C82F8
          %%*                                    * C8312
          2GETLAM                                * C8317
          %%      2.8125E-1                      * C831C
          OBJ_3727E                              * C8336
          6GETLAM                                * C833B
          OBJ_37247                              * C8340
          LAM     'W                             * C8345
          OBJ_36EBB                              * C8350
          LAM     'F                             * C8355
          OBJ_36DB7                              * C8360
          %>%%                                   * C8365
          3PUTLAM                                * C836A
          8GETLAM                                * C836F
          %%      9.23076923076923E-1            * C8374
          6GETLAM                                * C838E
          OBJ_37247                              * C8393
          LAM     'T                             * C8398
          OBJ_36EBB                              * C83A3
          7GETLAM                                * C83A8
          3GETLAM                                * C83AD
          %%      3.32089212562585E0             * C83B2
          %%*                                    * C83CC
          2GETLAM                                * C83D1
          %%      3.27719617660446E0             * C83D6
          OBJ_372BC                              * C83F0
          1GETLAM                                * C83F5
          %%      8.7938097405553E-1             * C83FA
          OBJ_3727E                              * C8414
          6GETLAM                                * C8419
          OBJ_37247                              * C841E
          LAM     'W                             * C8423
          OBJ_36EBB                              * C842E
          LAM     'F                             * C8433
          OBJ_36DB7                              * C843E
          %>%%                                   * C8443
          4PUTLAM                                * C8448
          8GETLAM                                * C844D
          %>%%                                   * C8452
          6GETLAM                                * C8457
          OBJ_37223                              * C845C
          LAM     'T                             * C8461
          OBJ_36EBB                              * C846C
          7GETLAM                                * C8471
          3GETLAM                                * C8476
          %%      7.17348927875244E0             * C847B
          %%*                                    * C8495
          2GETLAM                                * C849A
          %%      8E0                            * C849F
          OBJ_372BC                              * C84B9
          1GETLAM                                * C84BE
          %%      2.03240740740741E0             * C84C3
          %%*                                    * C84DD
          4GETLAM                                * C84E2
          %%      2.05896686159844E-1            * C84E7
          OBJ_372BC                              * C8501
          %%+                                    * C8506
          6GETLAM                                * C850B
          OBJ_37247                              * C8510
          LAM     'W                             * C8515
          OBJ_36EBB                              * C8520
          LAM     'F                             * C8525
          OBJ_36DB7                              * C8530
          %>%%                                   * C8535
          5PUTLAM                                * C853A
          8GETLAM                                * C853F
          %%.5                                   * C8544
          6GETLAM                                * C8549
          OBJ_37247                              * C854E
          LAM     'T                             * C8553
          OBJ_36EBB                              * C855E
          7GETLAM                                * C8563
          2GETLAM                                * C8568
          %%2                                    * C856D
          %%*                                    * C8572
          3GETLAM                                * C8577
          %%      1.38167641325536E0             * C857C
          OBJ_372BC                              * C8596
          4GETLAM                                * C859B
          %%      4.52972709551657E-1            * C85A0
          %%*                                    * C85BA
          5GETLAM                                * C85BF
          %%      2.75E-1                        * C85C4
          OBJ_372BC                              * C85DE
          1GETLAM                                * C85E3
          %%      2.96296296296296E-1            * C85E8
          OBJ_372BC                              * C8602
          %%+                                    * C8607
          6GETLAM                                * C860C
          OBJ_37247                              * C8611
          LAM     'W                             * C8616
          OBJ_36EBB                              * C8621
          LAM     'F                             * C8626
          OBJ_36DB7                              * C8631
          %>%%                                   * C8636
          2PUTLAM                                * C863B
          8GETLAM                                * C8640
          LAM     'T                             * C8645
          OBJ_36EBB                              * C8650
          7GETLAM                                * C8655
          LAM     'W                             * C865A
          OBJ_36EBB                              * C8665
          6GETLAM                                * C866A
          4GETLAM                                * C866F
          %%      5.06131490342017E-1            * C8674
          %%*                                    * C868E
          5GETLAM                                * C8693
          %%      1.8E-1                         * C8698
          OBJ_372BC                              * C86B2
          1GETLAM                                * C86B7
          %%      1.18518518518519E-1            * C86BC
          OBJ_3727E                              * C86D6
          3GETLAM                                * C86DB
          %%      5.18986354775828E-1            * C86E0
          %%*                                    * C86FA
          2GETLAM                                * C86FF
          %%      3.63636363636364E-2            * C8704
          OBJ_3727E                              * C871E
          %%+                                    * C8723
          OVER                                   * C8728
          %%*                                    * C872D
          5GETLAM                                * C8732
          %%      2E-2                           * C8737
          %%*                                    * C8751
          4GETLAM                                * C8756
          %%      2.91998936735779E-2            * C875B
          OBJ_372BC                              * C8775
          1GETLAM                                * C877A
          %%      2.77777777777777E-3            * C877F
          OBJ_3727E                              * C8799
          2GETLAM                                * C879E
          %%      3.63636363636364E-2            * C87A3
          %%*                                    * C87BD
          3GETLAM                                * C87C2
          %%      2.99415204678363E-2            * C87C7
          OBJ_372BC                              * C87E1
          %%+                                    * C87E6
          3PICK                                  * C87EB
          %%*                                    * C87F0
        ;                                        * C87F5

* ROMPTR 0C1 009
* refs (1): C78DB
ROMP_0C1_009:
        ::                                       * C87FA
          LAM     'F                             * C87FF
          OBJ_36E20                              * C880A
          7GETLAM                                * C880F
          OBJ_3706E                              * C8814
          OBJ_7CD79                              * C8819
          1PUTLAM                                * C881E
          8GETLAM                                * C8823
          ::                                     * C8828
            DUP%0=                               * C882D
            casedrop                             * C8832
            %%      1.3E-498                     * C8837
            %ABS                                 * C8851
            %       1.3E-10                      * C8856
            _*(2r);r=>rr                         * C886B
          ;                                      * C8870
          6GETLAM                                * C8875
          %%ABS                                  * C887A
          %%>=                                   * C887F
          case                                   * C8884
          ::                                     * C8889
            6GETLAM                              * C888E
            1GETLAM                              * C8893
            OVER                                 * C8898
            OBJ_370C1                            * C889D
            %%0                                  * C88A2
          ;                                      * C88A7
          8GETLAM                                * C88AC
          %%      2.5E-1                         * C88B1
          6GETLAM                                * C88CB
          OBJ_37247                              * C88D0
          LAM     'T                             * C88D5
          OBJ_36EBB                              * C88E0
          7GETLAM                                * C88E5
          TOTEMPOB                               * C88EA
          1GETLAM                                * C88EF
          TOTEMPOB                               * C88F4
          6GETLAM                                * C88F9
          %%      2.5E-1                         * C88FE
          %%*                                    * C8918
          OBJ_370C1                              * C891D
          OBJ_7D6DE                              * C8922
          LAM     'W                             * C8927
          OBJ_36EE3                              * C8932
          LAM     'F                             * C8937
          OBJ_36E20                              * C8942
          7GETLAM                                * C8947
          OBJ_3706E                              * C894C
          OBJ_7CD79                              * C8951
          2PUTLAM                                * C8956
          8GETLAM                                * C895B
          %%      3.75E-1                        * C8960
          6GETLAM                                * C897A
          OBJ_37247                              * C897F
          LAM     'T                             * C8984
          OBJ_36EBB                              * C898F
          7GETLAM                                * C8994
          TOTEMPOB                               * C8999
          1GETLAM                                * C899E
          TOTEMPOB                               * C89A3
          %%      9.375E-2                       * C89A8
          OBJ_370C1                              * C89C2
          2GETLAM                                * C89C7
          %%      2.8125E-1                      * C89CC
          OBJ_37167                              * C89E6
          6GETLAM                                * C89EB
          OBJ_370C1                              * C89F0
          OBJ_7D6DE                              * C89F5
          LAM     'W                             * C89FA
          OBJ_36EE3                              * C8A05
          LAM     'F                             * C8A0A
          OBJ_36E20                              * C8A15
          7GETLAM                                * C8A1A
          OBJ_3706E                              * C8A1F
          OBJ_7CD79                              * C8A24
          3PUTLAM                                * C8A29
          8GETLAM                                * C8A2E
          %%      9.23076923076923E-1            * C8A33
          6GETLAM                                * C8A4D
          OBJ_37247                              * C8A52
          LAM     'T                             * C8A57
          OBJ_36EBB                              * C8A62
          7GETLAM                                * C8A67
          TOTEMPOB                               * C8A6C
          3GETLAM                                * C8A71
          TOTEMPOB                               * C8A76
          %%      3.32089212562585E0             * C8A7B
          OBJ_370C1                              * C8A95
          2GETLAM                                * C8A9A
          %%      -3.27719617660446E0            * C8A9F
          OBJ_37167                              * C8AB9
          1GETLAM                                * C8ABE
          %%      8.7938097405553E-1             * C8AC3
          OBJ_37167                              * C8ADD
          6GETLAM                                * C8AE2
          OBJ_370C1                              * C8AE7
          OBJ_7D6DE                              * C8AEC
          LAM     'W                             * C8AF1
          OBJ_36EE3                              * C8AFC
          LAM     'F                             * C8B01
          OBJ_36E20                              * C8B0C
          7GETLAM                                * C8B11
          OBJ_3706E                              * C8B16
          OBJ_7CD79                              * C8B1B
          4PUTLAM                                * C8B20
          8GETLAM                                * C8B25
          %>%%                                   * C8B2A
          6GETLAM                                * C8B2F
          OBJ_37223                              * C8B34
          LAM     'T                             * C8B39
          OBJ_36EBB                              * C8B44
          7GETLAM                                * C8B49
          TOTEMPOB                               * C8B4E
          3GETLAM                                * C8B53
          TOTEMPOB                               * C8B58
          %%      7.17348927875244E0             * C8B5D
          OBJ_370C1                              * C8B77
          2GETLAM                                * C8B7C
          %%      -8E0                           * C8B81
          OBJ_37167                              * C8B9B
          1GETLAM                                * C8BA0
          TOTEMPOB                               * C8BA5
          %%      2.03240740740741E0             * C8BAA
          OBJ_370C1                              * C8BC4
          4GETLAM                                * C8BC9
          %%      -2.05896686159844E-1           * C8BCE
          OBJ_37167                              * C8BE8
          %%1                                    * C8BED
          OBJ_37167                              * C8BF2
          6GETLAM                                * C8BF7
          OBJ_370C1                              * C8BFC
          OBJ_7D6DE                              * C8C01
          LAM     'W                             * C8C06
          OBJ_36EE3                              * C8C11
          LAM     'F                             * C8C16
          OBJ_36E20                              * C8C21
          7GETLAM                                * C8C26
          OBJ_3706E                              * C8C2B
          OBJ_7CD79                              * C8C30
          5PUTLAM                                * C8C35
          8GETLAM                                * C8C3A
          %%.5                                   * C8C3F
          6GETLAM                                * C8C44
          OBJ_37247                              * C8C49
          LAM     'T                             * C8C4E
          OBJ_36EBB                              * C8C59
          7GETLAM                                * C8C5E
          TOTEMPOB                               * C8C63
          2GETLAM                                * C8C68
          %%2                                    * C8C6D
          OBJ_370C1                              * C8C72
          3GETLAM                                * C8C77
          %%      -1.38167641325536E0            * C8C7C
          OBJ_37167                              * C8C96
          4GETLAM                                * C8C9B
          TOTEMPOB                               * C8CA0
          %%      4.52972709551657E-1            * C8CA5
          OBJ_370C1                              * C8CBF
          5GETLAM                                * C8CC4
          %%      -2.75E-1                       * C8CC9
          OBJ_37167                              * C8CE3
          1GETLAM                                * C8CE8
          %%      -2.96296296296296E-1           * C8CED
          OBJ_37167                              * C8D07
          %%1                                    * C8D0C
          OBJ_37167                              * C8D11
          6GETLAM                                * C8D16
          OBJ_370C1                              * C8D1B
          OBJ_7D6DE                              * C8D20
          LAM     'W                             * C8D25
          OBJ_36EE3                              * C8D30
          LAM     'F                             * C8D35
          OBJ_36E20                              * C8D40
          7GETLAM                                * C8D45
          OBJ_3706E                              * C8D4A
          OBJ_7CD79                              * C8D4F
          2PUTLAM                                * C8D54
          8GETLAM                                * C8D59
          LAM     'T                             * C8D5E
          OBJ_36EBB                              * C8D69
          7GETLAM                                * C8D6E
          LAM     'W                             * C8D73
          OBJ_36EE3                              * C8D7E
          6GETLAM                                * C8D83
          4GETLAM                                * C8D88
          TOTEMPOB                               * C8D8D
          %%      5.06131490342017E-1            * C8D92
          OBJ_370C1                              * C8DAC
          5GETLAM                                * C8DB1
          %%      -1.8E-1                        * C8DB6
          OBJ_37167                              * C8DD0
          1GETLAM                                * C8DD5
          %%      1.18518518518519E-1            * C8DDA
          OBJ_37167                              * C8DF4
          2GETLAM                                * C8DF9
          %%      3.63636363636364E-2            * C8DFE
          OBJ_370C1                              * C8E18
          TOTEMPOB                               * C8E1D
          3GETLAM                                * C8E22
          %%      5.18986354775828E-1            * C8E27
          OBJ_37167                              * C8E41
          %%1                                    * C8E46
          OBJ_37167                              * C8E4B
          OVER                                   * C8E50
          OBJ_370C1                              * C8E55
          5GETLAM                                * C8E5A
          %%      2E-2                           * C8E5F
          OBJ_370C1                              * C8E79
          4GETLAM                                * C8E7E
          %%      -2.91998936735779E-2           * C8E83
          OBJ_37167                              * C8E9D
          1GETLAM                                * C8EA2
          %%      2.77777777777777E-3            * C8EA7
          OBJ_37167                              * C8EC1
          2GETLAM                                * C8EC6
          3GETLAM                                * C8ECB
          %%      -2.99415204678363E-2           * C8ED0
          OBJ_37167                              * C8EEA
          %%1                                    * C8EEF
          OBJ_37167                              * C8EF4
          3PICK                                  * C8EF9
          OBJ_370C1                              * C8EFE
        ;                                        * C8F03

* ROMPTR 0C1 00A
* refs (1): C78DB
ROMP_0C1_00A:
        ::                                       * C8F08
          DEPTH                                  * C8F0D
          #3-                                    * C8F12
          4PICK                                  * C8F17
          ROMPTR  0C1 011                        * C8F1C
          ROTDROP                                * C8F27
          %>%%                                   * C8F2C
          ERRSET                                 * C8F31
          ROMPTR  0C1 00B                        * C8F36
          ERRTRAP                                * C8F41
          ROMPTR  0C1 006                        * C8F46
          1PUTLAM                                * C8F51
          2PUTLAM                                * C8F56
          5GETLAM                                * C8F5B
          RESETDEPTH                             * C8F60
          4GETLAM                                * C8F65
          2GETLAM                                * C8F6A
          1GETABND                               * C8F6F
          %%>%                                   * C8F74
          ATTNFLGCLR                             * C8F79
        ;                                        * C8F7E

* ROMPTR 0C1 00B
* refs (1): C78DB
ROMP_0C1_00B:
        ::                                       * C8F83
          OVER                                   * C8F88
          %0>                                    * C8F8D
          NOTcase                                * C8F92
          SETSIZEERR                             * C8F97
          %0_2A2B4                               * C8F9C
          SWAPROT                                * C8FA1
          3NULLLAM{}                             * C8FA6
          BIND                                   * C8FAB
          LAM     'W                             * C8FB0
          OBJ_36E43                              * C8FBB
          ROMPTR  0C1 00C                        * C8FC0
          3PUTLAM                                * C8FCB
          2GETLAM                                * C8FD0
          ROMPTR  0C1 00D                        * C8FD5
          1GETABND                               * C8FE0
          SWAP                                   * C8FE5
        ;                                        * C8FEA

* ROMPTR 0C1 00C
* refs (1): C78DB
ROMP_0C1_00C:
        ::                                       * C8FEF
          DUP                                    * C8FF4
          TYPERARRY?                             * C8FF9
          NOTcasedrop                            * C8FFE
          ::                                     * C9003
            RESOROMP                             * C9008
            ROMPTR  0C1 008                      * C900D
          ;                                      * C9018
          MDIMS                                  * C901D
          case                                   * C9022
          doerr501                               * C9027
          DROP                                   * C902C
          RESOROMP                               * C9031
          ROMPTR  0C1 009                        * C9036
        ;                                        * C9041

* ROMPTR 0C1 00D
* refs (1): C78DB
ROMP_0C1_00D:
        ::                                       * C9046
          %%5                                    * C904B
          2PUTLAM                                * C9050
          %0_2A2B4                               * C9055
          %0_2A2B4                               * C905A
          ROT                                    * C905F
          %0_2A2B4                               * C9064
          %0_2A2B4                               * C9069
          %0_2A2B4                               * C906E
          %0_2A2B4                               * C9073
          %0_2A2B4                               * C9078
          8NULLLAM{}                             * C907D
          BIND                                   * C9082
          LAM     'T                             * C9087
          OBJ_36DCB                              * C9092
          8PUTLAM                                * C9097
          LAM     'W                             * C909C
          OBJ_36E43                              * C90A7
          7PUTLAM                                * C90AC
          BEGIN                                  * C90B1
          12GETLAM                               * C90B6
          EVAL                                   * C90BB
          OBJ_36F56                              * C90C0
          10GETLAM                               * C90C5
          %>%%                                   * C90CA
          %%/                                    * C90CF
          DUP                                    * C90D4
          %%1                                    * C90D9
          %%>                                    * C90DE
          WHILE                                  * C90E3
          ::                                     * C90E8
            SWAPDROP                             * C90ED
            11GETLAM                             * C90F2
            %%5                                  * C90F7
            EQUAL                                * C90FC
            ITE                                  * C9101
            ::                                   * C9106
              %%1                                * C910B
              11PUTLAM                           * C9110
              %%      2E-1                       * C9115
              %%^                                * C912F
              %%      9E-1                       * C9134
              SWAP%%/                            * C914E
              %%.1                               * C9153
              %%MAX                              * C9158
            ;                                    * C915D
            ::                                   * C9162
              DROP                               * C9167
              %%      2E-1                       * C916C
            ;                                    * C9186
            %%*                                  * C918B
            6PUTLAM                              * C9190
          ;                                      * C9195
          REPEAT                                 * C919A
          ABND                                   * C919F
          2GETLAM                                * C91A4
          OVER                                   * C91A9
          %%0=                                   * C91AE
          ITE                                    * C91B3
          SWAPDROP                               * C91B8
          ::                                     * C91BD
            %%      9E-1                         * C91C2
            ROT                                  * C91DC
            %%      2E-1                         * C91E1
            %%^                                  * C91FB
            %%/                                  * C9200
            OBJ_37DA0                            * C9205
          ;                                      * C920A
          3PICK                                  * C920F
          %%*                                    * C9214
          2PUTLAM                                * C9219
          LAM     'W                             * C921E
          OBJ_36D5D                              * C9229
          LAM     'T                             * C922E
          OBJ_36D26                              * C9239
          2GETLAM                                * C923E
        ;                                        * C9243

* ROMPTR 0C1 00E
* refs (1): C78DB
ROMP_0C1_00E:
        ::                                       * C9248
          DEPTH                                  * C924D
          #3-                                    * C9252
          4PICK                                  * C9257
          ROMPTR  0C1 011                        * C925C
          ROTDROP                                * C9267
          ERRSET                                 * C926C
          ROMPTR  0C1 00F                        * C9271
          ERRTRAP                                * C927C
          ROMPTR  0C1 006                        * C9281
          1PUTLAM                                * C928C
          5GETLAM                                * C9291
          RESETDEPTH                             * C9296
          4GETLAM                                * C929B
          1GETABND                               * C92A0
          ATTNFLGCLR                             * C92A5
        ;                                        * C92AA

* ROMPTR 0C1 00F
* refs (1): C78DB
ROMP_0C1_00F:
        ::                                       * C92AF
          ROMPTR  0C1 010                        * C92B4
          case                                   * C92BF
          ABND                                   * C92C4
          %0_2A2B4                               * C92C9
          SWAPROT                                * C92CE
          3NULLLAM{}                             * C92D3
          BIND                                   * C92D8
          LAM     'W                             * C92DD
          OBJ_36E43                              * C92E8
          ROMPTR  0C1 00C                        * C92ED
          3PUTLAM                                * C92F8
          2GETLAM                                * C92FD
          6GETLAM                                * C9302
          RESOROMP                               * C9307
          ROMPTR  0C1 00D                        * C930C
          6PUTLAM                                * C9317
          OVER                                   * C931C
          %%0>                                   * C9321
          7PUTLAM                                * C9326
          BEGIN                                  * C932B
          5GETLAM                                * C9330
          7GETLAM                                * C9335
          ITE                                    * C933A
          OBJ_7CE00                              * C933F
          OBJ_7CE32                              * C9344
          6GETLAM                                * C9349
          EVAL                                   * C934E
          LAM     'T                             * C9353
          OBJ_36DDF                              * C935E
          5GETLAM                                * C9363
          OVER                                   * C9368
          7GETLAM                                * C936D
          ITE                                    * C9372
          %<=                                    * C9377
          %>=                                    * C937C
          UNTIL                                  * C9381
          2DROP                                  * C9386
          1GETABND                               * C938B
          ABND                                   * C9390
        ;                                        * C9395

* ROMPTR 0C1 010
* refs (1): C78DB
ROMP_0C1_010:
        ::                                       * C939A
          DUP                                    * C939F
          3NULLLAM{}                             * C93A4
          BIND                                   * C93A9
          3GETLAM                                * C93AE
          ROMPTR  0C1 012                        * C93B3
          OVER                                   * C93BE
          %0>                                    * C93C3
          NOTcase                                * C93C8
          SETSIZEERR                             * C93CD
          2PUTLAM                                * C93D2
          3PUTLAM                                * C93D7
          LAM     'T                             * C93DC
          OBJ_36DCB                              * C93E7
          3GETLAM                                * C93EC
          SWAP                                   * C93F1
          1GETLAM                                * C93F6
          OVER                                   * C93FB
          %=                                     * C9400
          casedrop                               * C9405
          TRUE                                   * C940A
          2GETLAM                                * C940F
          SWAP                                   * C9414
          2PUTLAM                                * C9419
          %ABS                                   * C941E
          DUP%0=                                 * C9423
          ITE                                    * C9428
          ::                                     * C942D
            2DROP                                * C9432
            LAM     'W                           * C9437
            OBJ_36E43                            * C9442
            LAM     'F                           * C9447
            SWAP                                 * C9452
            TYPEREAL?                            * C9457
            ITE                                  * C945C
            ::                                   * C9461
              OBJ_36DB7                          * C9466
              %ABS                               * C946B
              %>%%                               * C9470
            ;                                    * C9475
            ::                                   * C947A
              OBJ_36E20                          * C947F
              OBJ_36912                          * C9484
            ;                                    * C9489
            3GETLAM                              * C948E
            SWAPDUP                              * C9493
            %%0=                                 * C9498
            casedrop                             * C949D
            ::                                   * C94A2
              1GETLAM                            * C94A7
              2GETLAM                            * C94AC
              %>%%-                              * C94B1
              %%ABS                              * C94B6
            ;                                    * C94BB
            OVER                                 * C94C0
            %>%%                                 * C94C5
            SWAP%%/                              * C94CA
            %%      2E-1                         * C94CF
            %%^                                  * C94E9
            %%      1E-499                       * C94EE
            %%MAX                                * C9508
          ;                                      * C950D
          %>%%                                   * C9512
          2GETLAM                                * C9517
          1GETLAM                                * C951C
          %<                                     * C9521
          ?SKIP                                  * C9526
          %%CHS                                  * C952B
          FALSE                                  * C9530
        ;                                        * C9535

* ROMPTR 0C1 011
* refs (1): C78DB
ROMP_0C1_011:
        ::                                       * C953A
          DUPLENCOMP                             * C953F
          BINT3                                  * C9544
          #<                                     * C9549
          case2drop                              * C954E
          SETSIZEERR                             * C9553
          DUPINCOMP                              * C9558
          BINT3                                  * C955D
          #-                                     * C9562
          NDROP                                  * C9567
          {                                      * C956C
            NULLLAM                              * C9571
            NULLLAM                              * C9576
            LAM     'T                           * C957B
            LAM     'W                           * C9586
            LAM     'F                           * C9591
          }                                      * C959C
          BIND                                   * C95A1
          3GETLAM                                * C95A6
          TYPEIDNT?                              * C95AB
          NOTcase                                * C95B0
          SETTYPEERR                             * C95B5
          2GETLAM                                * C95BA
          TYPEIDNT?                              * C95BF
          NOTcase                                * C95C4
          SETTYPEERR                             * C95C9
        ;                                        * C95CE

* ROMPTR 0C1 012
* refs (1): C78DB
ROMP_0C1_012:
        ::                                       * C95D3
          DUPTYPEREAL?                           * C95D8
          case                                   * C95DD
          %0_2A2B4                               * C95E2
          DUPNULLCOMP?                           * C95E7
          case                                   * C95EC
          SETSIZEERR                             * C95F1
          DUPDUP                                 * C95F6
          OBJ_1DF30                              * C95FB
          1GETLAM                                * C9600
          ABND                                   * C9605
          DUP                                    * C960A
          BINT1                                  * C960F
          NTHCOMPDROP                            * C9614
          SWAP                                   * C9619
          BINT2                                  * C961E
          NTHELCOMP                              * C9623
          ?SEMI                                  * C9628
          %0_2A2B4                               * C962D
        ;                                        * C9632

* ROMPTR 0C1 013
* refs (1): C78DB
ROMP_0C1_013:
        ::                                       * C9637
          DEPTH                                  * C963C
          #2-                                    * C9641
          3PICK                                  * C9646
          ROMPTR  0C1 01F                        * C964B
          SWAPDROP                               * C9656
          %>%%                                   * C965B
          ERRSET                                 * C9660
          ROMPTR  0C1 015                        * C9665
          ERRTRAP                                * C9670
          ROMPTR  0C1 014                        * C9675
          1PUTLAM                                * C9680
          2PUTLAM                                * C9685
          3PUTLAM                                * C968A
          7GETLAM                                * C968F
          RESETDEPTH                             * C9694
          6GETLAM                                * C9699
          3GETLAM                                * C969E
          %%>%                                   * C96A3
          2GETLAM                                * C96A8
          OBJ_3798C                              * C96AD
          ITE                                    * C96B2
          %%>%                                   * C96B7
          OBJ_7CDD3                              * C96BC
          1GETABND                               * C96C1
          OBJ_3798C                              * C96C6
          ITE                                    * C96CB
          %%>%                                   * C96D0
          OBJ_7CDD3                              * C96D5
          ATTNFLGCLR                             * C96DA
        ;                                        * C96DF

* ROMPTR 0C1 014
* refs (1): C78DB
ROMP_0C1_014:
        ::                                       * C96E4
          ATTNFLGCLR                             * C96E9
          7GETLAM                                * C96EE
          RESETDEPTH                             * C96F3
          ERRJMP                                 * C96F8
        ;                                        * C96FD

* ROMPTR 0C1 015
* refs (1): C78DB
ROMP_0C1_015:
        ::                                       * C9702
          %0_2A2B4                               * C9707
          %0_2A2B4                               * C970C
          ROT                                    * C9711
          %0_2A2B4                               * C9716
          %0_2A2B4                               * C971B
          %0_2A2B4                               * C9720
          %0_2A2B4                               * C9725
          %0_2A2B4                               * C972A
          8NULLLAM{}                             * C972F
          BIND                                   * C9734
          LAM     'T                             * C9739
          OBJ_36DCB                              * C9744
          8PUTLAM                                * C9749
          LAM     'W                             * C974E
          OBJ_36E43                              * C9759
          DUP                                    * C975E
          7PUTLAM                                * C9763
          TYPERARRY?                             * C9768
          ITE                                    * C976D
          ::                                     * C9772
            7GETLAM                              * C9777
            MDIMS                                * C977C
            case                                 * C9781
            doerr501                             * C9786
            5PUTLAM                              * C978B
            ROMPTR  0C1 017                      * C9790
          ;                                      * C979B
          ROMPTR  0C1 016                        * C97A0
          ABND                                   * C97AB
        ;                                        * C97B0

* ROMPTR 0C1 016
* refs (1): C78DB
ROMP_0C1_016:
        ::                                       * C97B5
          8GETLAM                                * C97BA
          ::                                     * C97BF
            DUP%0=                               * C97C4
            casedrop                             * C97C9
            %%      2.5E-499                     * C97CE
            %ABS                                 * C97E8
            %       2.5E-11                      * C97ED
            _*(2r);r=>rr                         * C9802
          ;                                      * C9807
          6GETLAM                                * C980C
          %%ABS                                  * C9811
          %%>=                                   * C9816
          case                                   * C981B
          ROMPTR  0C1 008                        * C9820
          LAM     'FW                            * C982B
          OBJ_36DB7                              * C9838
          %>%%                                   * C983D
          6GETLAM                                * C9842
          %%*                                    * C9847
          OBJ_37B30                              * C984C
          %%1                                    * C9851
          SWAP                                   * C9856
          %%-                                    * C985B
          4dropn;IU!                             * C9860
          IT                                     * C9865
          ::                                     * C986A
            DROP                                 * C986F
            %%1E-14                              * C9874
          ;                                      * C9879
          5PUTLAM                                * C987E
          LAM     'FT                            * C9883
          OBJ_36DB7                              * C9890
          %>%%                                   * C9895
          6GETLAM                                * C989A
          %%*                                    * C989F
          OBJ_37B30                              * C98A4
          4PUTLAM                                * C98A9
          LAM     'F                             * C98AE
          OBJ_36DB7                              * C98B9
          %>%%                                   * C98BE
          4GETLAM                                * C98C3
          %%+                                    * C98C8
          5GETLAM                                * C98CD
          %%/                                    * C98D2
          1PUTLAM                                * C98D7
          8GETLAM                                * C98DC
          %>%%                                   * C98E1
          6GETLAM                                * C98E6
          OBJ_37223                              * C98EB
          LAM     'T                             * C98F0
          OBJ_36EBB                              * C98FB
          7GETLAM                                * C9900
          6GETLAM                                * C9905
          1GETLAM                                * C990A
          OBJ_37247                              * C990F
          LAM     'W                             * C9914
          OBJ_36EBB                              * C991F
          LAM     'F                             * C9924
          OBJ_36DB7                              * C992F
          %>%%                                   * C9934
          1GETLAM                                * C9939
          %%4                                    * C993E
          OBJ_372BC                              * C9943
          4GETLAM                                * C9948
          %%3                                    * C994D
          OBJ_372BC                              * C9952
          5GETLAM                                * C9957
          %%/                                    * C995C
          2PUTLAM                                * C9961
          8GETLAM                                * C9966
          6GETLAM                                * C996B
          %%      6E-1                           * C9970
          OBJ_37247                              * C998A
          LAM     'T                             * C998F
          OBJ_36EBB                              * C999A
          7GETLAM                                * C999F
          1GETLAM                                * C99A4
          %%      9.6E-1                         * C99A9
          %%*                                    * C99C3
          2GETLAM                                * C99C8
          %%      1.2E-1                         * C99CD
          OBJ_3727E                              * C99E7
          6GETLAM                                * C99EC
          OBJ_37247                              * C99F1
          LAM     'W                             * C99F6
          OBJ_36EBB                              * C9A01
          LAM     'F                             * C9A06
          OBJ_36DB7                              * C9A11
          %>%%                                   * C9A16
          DUP                                    * C9A1B
          1GETLAM                                * C9A20
          %%      7.44E0                         * C9A25
          OBJ_3727E                              * C9A3F
          2GETLAM                                * C9A44
          %%      1.2E0                          * C9A49
          OBJ_3727E                              * C9A63
          4GETLAM                                * C9A68
          %%      4.84E0                         * C9A6D
          OBJ_3727E                              * C9A87
          5GETLAM                                * C9A8C
          %%/                                    * C9A91
          3PUTLAM                                * C9A96
          1GETLAM                                * C9A9B
          %%      -4.48E-1                       * C9AA0
          OBJ_3727E                              * C9ABA
          2GETLAM                                * C9ABF
          %%      -2.16E-1                       * C9AC4
          OBJ_3727E                              * C9ADE
          3GETLAM                                * C9AE3
          %%      -2E-1                          * C9AE8
          OBJ_3727E                              * C9B02
          4GETLAM                                * C9B07
          %%      2.32E-1                        * C9B0C
          OBJ_3727E                              * C9B26
          5GETLAM                                * C9B2B
          %%/                                    * C9B30
          4PUTLAM                                * C9B35
          8GETLAM                                * C9B3A
          LAM     'T                             * C9B3F
          OBJ_36EBB                              * C9B4A
          7GETLAM                                * C9B4F
          LAM     'W                             * C9B54
          OBJ_36EBB                              * C9B5F
          6GETLAM                                * C9B64
          3GETLAM                                * C9B69
          %%      1.15740740740741E-1            * C9B6E
          %%*                                    * C9B88
          2GETLAM                                * C9B8D
          %%      2.5E-1                         * C9B92
          OBJ_3727E                              * C9BAC
          4GETLAM                                * C9BB1
          %%      5.78703703703704E-1            * C9BB6
          OBJ_3727E                              * C9BD0
          1GETLAM                                * C9BD5
          %%      1.05555555555556E0             * C9BDA
          OBJ_3727E                              * C9BF4
          OVER                                   * C9BF9
          %%*                                    * C9BFE
          2GETLAM                                * C9C03
          %%      9.72222222222222E-2            * C9C08
          %%*                                    * C9C22
          1GETLAM                                * C9C27
          %%      1.57407407407407E-1            * C9C2C
          OBJ_3727E                              * C9C46
          4GETLAM                                * C9C4B
          %%      5.78703703703704E-1            * C9C50
          OBJ_3727E                              * C9C6A
          3PICK                                  * C9C6F
          %%*                                    * C9C74
        ;                                        * C9C79

* ROMPTR 0C1 017
* refs (1): C78DB
ROMP_0C1_017:
        ::                                       * C9C7E
          8GETLAM                                * C9C83
          ::                                     * C9C88
            DUP%0=                               * C9C8D
            casedrop                             * C9C92
            %%      2.5E-499                     * C9C97
            %ABS                                 * C9CB1
            %       2.5E-11                      * C9CB6
            _*(2r);r=>rr                         * C9CCB
          ;                                      * C9CD0
          6GETLAM                                * C9CD5
          %%ABS                                  * C9CDA
          %%>=                                   * C9CDF
          case                                   * C9CE4
          ROMPTR  0C1 009                        * C9CE9
          LAM     'FW                            * C9CF4
          OBJ_36E20                              * C9D01
          sqmat(ar)?                             * C9D06
          5GETLAM                                * C9D0B
          #=                                     * C9D10
          OBJ_37DE1                              * C9D15
          OBJ_7CD79                              * C9D1A
          6GETLAM                                * C9D1F
          %%      -5E-1                          * C9D24
          %%*                                    * C9D3E
          OBJ_370C1                              * C9D43
          5GETLAM                                * C9D48
          BINT1                                  * C9D4D
          3UNROLL                                * C9D52
          #1+_ONE_DO                             * C9D57
          OVER                                   * C9D5C
          OBJ_372EF                              * C9D61
          1+(rr)                                 * C9D66
          3PICK                                  * C9D6B
          OBJ_37361                              * C9D70
          SWAP                                   * C9D75
          ISTOP@                                 * C9D7A
          #+                                     * C9D7F
          SWAP                                   * C9D84
          LOOP                                   * C9D89
          SWAPDROP                               * C9D8E
          5GETLAM                                * C9D93
          OBJ_7CEA5                              * C9D98
          2DROP                                  * C9D9D
          8PUTLAM                                * C9DA2
          LAM     'FT                            * C9DA7
          OBJ_36E20                              * C9DB4
          10GETLAM                               * C9DB9
          OBJ_3706E                              * C9DBE
          OBJ_7CD79                              * C9DC3
          7PUTLAM                                * C9DC8
          LAM     'F                             * C9DCD
          OBJ_36E20                              * C9DD8
          10GETLAM                               * C9DDD
          OBJ_3706E                              * C9DE2
          OBJ_7CD79                              * C9DE7
          7GETLAM                                * C9DEC
          9GETLAM                                * C9DF1
          OBJ_37B30                              * C9DF6
          OBJ_37167                              * C9DFB
          8GETLAM                                * C9E00
          SWAP                                   * C9E05
          BINT1                                  * C9E0A
          OBJ_7D0CB                              * C9E0F
          4PUTLAM                                * C9E14
          11GETLAM                               * C9E19
          %>%%                                   * C9E1E
          9GETLAM                                * C9E23
          OBJ_37223                              * C9E28
          LAM     'T                             * C9E2D
          OBJ_36EBB                              * C9E38
          10GETLAM                               * C9E3D
          TOTEMPOB                               * C9E42
          4GETLAM                                * C9E47
          TOTEMPOB                               * C9E4C
          9GETLAM                                * C9E51
          OBJ_370C1                              * C9E56
          OBJ_7D6DE                              * C9E5B
          LAM     'W                             * C9E60
          OBJ_36EE3                              * C9E6B
          LAM     'F                             * C9E70
          OBJ_36E20                              * C9E7B
          10GETLAM                               * C9E80
          OBJ_3706E                              * C9E85
          OBJ_7CD79                              * C9E8A
          4GETLAM                                * C9E8F
          %%      -4E0                           * C9E94
          OBJ_37167                              * C9EAE
          7GETLAM                                * C9EB3
          9GETLAM                                * C9EB8
          %%      -1.5E0                         * C9EBD
          %%*                                    * C9ED7
          OBJ_37167                              * C9EDC
          8GETLAM                                * C9EE1
          SWAP                                   * C9EE6
          BINT1                                  * C9EEB
          OBJ_7D0CB                              * C9EF0
          5PUTLAM                                * C9EF5
          11GETLAM                               * C9EFA
          9GETLAM                                * C9EFF
          %%      6E-1                           * C9F04
          OBJ_37247                              * C9F1E
          LAM     'T                             * C9F23
          OBJ_36EBB                              * C9F2E
          10GETLAM                               * C9F33
          TOTEMPOB                               * C9F38
          4GETLAM                                * C9F3D
          TOTEMPOB                               * C9F42
          %%      9.6E-1                         * C9F47
          OBJ_370C1                              * C9F61
          5GETLAM                                * C9F66
          %%      1.2E-1                         * C9F6B
          OBJ_37167                              * C9F85
          9GETLAM                                * C9F8A
          OBJ_370C1                              * C9F8F
          OBJ_7D6DE                              * C9F94
          LAM     'W                             * C9F99
          OBJ_36EE3                              * C9FA4
          LAM     'F                             * C9FA9
          OBJ_36E20                              * C9FB4
          10GETLAM                               * C9FB9
          OBJ_3706E                              * C9FBE
          OBJ_7CD79                              * C9FC3
          DUP                                    * C9FC8
          TOTEMPOB                               * C9FCD
          4GETLAM                                * C9FD2
          %%      7.44E0                         * C9FD7
          OBJ_37167                              * C9FF1
          5GETLAM                                * C9FF6
          %%      1.2E0                          * C9FFB
          OBJ_37167                              * CA015
          7GETLAM                                * CA01A
          9GETLAM                                * CA01F
          %%      2.42E0                         * CA024
          %%*                                    * CA03E
          OBJ_37167                              * CA043
          8GETLAM                                * CA048
          SWAP                                   * CA04D
          BINT1                                  * CA052
          OBJ_7D0CB                              * CA057
          6PUTLAM                                * CA05C
          4GETLAM                                * CA061
          %%      -4.48E-1                       * CA066
          OBJ_37167                              * CA080
          5GETLAM                                * CA085
          %%      -2.16E-1                       * CA08A
          OBJ_37167                              * CA0A4
          6GETLAM                                * CA0A9
          %%      -2E-1                          * CA0AE
          OBJ_37167                              * CA0C8
          7GETLAM                                * CA0CD
          9GETLAM                                * CA0D2
          %%      1.16E-1                        * CA0D7
          %%*                                    * CA0F1
          OBJ_37167                              * CA0F6
          8GETLAM                                * CA0FB
          SWAP                                   * CA100
          BINT1                                  * CA105
          OBJ_7D0CB                              * CA10A
          7PUTLAM                                * CA10F
          ABND                                   * CA114
          8GETLAM                                * CA119
          LAM     'T                             * CA11E
          OBJ_36EBB                              * CA129
          7GETLAM                                * CA12E
          LAM     'W                             * CA133
          OBJ_36EE3                              * CA13E
          6GETLAM                                * CA143
          3GETLAM                                * CA148
          %%      1.15740740740741E-1            * CA14D
          OBJ_370C1                              * CA167
          2GETLAM                                * CA16C
          %%      2.5E-1                         * CA171
          OBJ_37167                              * CA18B
          4GETLAM                                * CA190
          %%      5.78703703703704E-1            * CA195
          OBJ_37167                              * CA1AF
          1GETLAM                                * CA1B4
          %%      1.05555555555556E0             * CA1B9
          OBJ_37167                              * CA1D3
          OVER                                   * CA1D8
          OBJ_370C1                              * CA1DD
          2GETLAM                                * CA1E2
          %%      9.72222222222222E-2            * CA1E7
          OBJ_370C1                              * CA201
          1GETLAM                                * CA206
          %%      1.57407407407407E-1            * CA20B
          OBJ_37167                              * CA225
          4GETLAM                                * CA22A
          %%      5.78703703703704E-1            * CA22F
          OBJ_37167                              * CA249
          3PICK                                  * CA24E
          OBJ_370C1                              * CA253
        ;                                        * CA258

* ROMPTR 0C1 018
* refs (1): C78DB
ROMP_0C1_018:
        ::                                       * CA25D
          DEPTH                                  * CA262
          #4-                                    * CA267
          5PICK                                  * CA26C
          ROMPTR  0C1 01F                        * CA271
          4ROLLDROP                              * CA27C
          SWAP                                   * CA281
          %>%%                                   * CA286
          SWAP                                   * CA28B
          ERRSET                                 * CA290
          ROMPTR  0C1 019                        * CA295
          ERRTRAP                                * CA2A0
          ROMPTR  0C1 014                        * CA2A5
          1PUTLAM                                * CA2B0
          2PUTLAM                                * CA2B5
          3PUTLAM                                * CA2BA
          7GETLAM                                * CA2BF
          RESETDEPTH                             * CA2C4
          6GETLAM                                * CA2C9
          3GETLAM                                * CA2CE
          2GETLAM                                * CA2D3
          %%>%                                   * CA2D8
          1GETABND                               * CA2DD
          ATTNFLGCLR                             * CA2E2
        ;                                        * CA2E7

* ROMPTR 0C1 019
* refs (1): C78DB
ROMP_0C1_019:
        ::                                       * CA2EC
          3PICK                                  * CA2F1
          %0>                                    * CA2F6
          NOTcase                                * CA2FB
          SETSIZEERR                             * CA300
          %0_2A2B4                               * CA305
          %0_2A2B4                               * CA30A
          %0_2A2B4                               * CA30F
          %0_2A2B4                               * CA314
          %0_2A2B4                               * CA319
          6ROLL                                  * CA31E
          8ROLL                                  * CA323
          8NULLLAM{}                             * CA328
          BIND                                   * CA32D
          LAM     'W                             * CA332
          OBJ_36E43                              * CA33D
          ROMPTR  0C1 01A                        * CA342
          5PUTLAM                                * CA34D
          4PUTLAM                                * CA352
          3PUTLAM                                * CA357
          RESOROMP                               * CA35C
          ROMPTR  0C1 00D                        * CA361
          6PUTLAM                                * CA36C
          8GETLAM                                * CA371
          2GETLAM                                * CA376
          ROMPTR  0C1 01B                        * CA37B
          1GETABND                               * CA386
          3UNROLL                                * CA38B
        ;                                        * CA390

* ROMPTR 0C1 01A
* refs (1): C78DB
ROMP_0C1_01A:
        ::                                       * CA395
          DUP                                    * CA39A
          TYPERARRY?                             * CA39F
          NOTcasedrop                            * CA3A4
          ::                                     * CA3A9
            RESOROMP                             * CA3AE
            ROMPTR  0C1 008                      * CA3B3
            RESOROMP                             * CA3BE
            ROMPTR  0C1 016                      * CA3C3
            BINT0                                * CA3CE
          ;                                      * CA3D3
          MDIMS                                  * CA3D8
          case                                   * CA3DD
          doerr501                               * CA3E2
          RESOROMP                               * CA3E7
          ROMPTR  0C1 009                        * CA3EC
          RESOROMP                               * CA3F7
          ROMPTR  0C1 017                        * CA3FC
          ROT                                    * CA407
        ;                                        * CA40C

* ROMPTR 0C1 01B
* refs (1): C78DB
ROMP_0C1_01B:
        ::                                       * CA411
          2PUTLAM                                * CA416
          8PUTLAM                                * CA41B
          LAM     'FW                            * CA420
          5GETLAM                                * CA42D
          #0=                                    * CA432
          ITE                                    * CA437
          ::                                     * CA43C
            OBJ_36DB7                            * CA441
            %ABS                                 * CA446
            %>%%                                 * CA44B
          ;                                      * CA450
          ::                                     * CA455
            OBJ_36E20                            * CA45A
            OBJ_36912                            * CA45F
          ;                                      * CA464
          8GETLAM                                * CA469
          SWAP                                   * CA46E
          DUP                                    * CA473
          7PUTLAM                                * CA478
          OVER                                   * CA47D
          %%*                                    * CA482
          %%ABS                                  * CA487
          DUP                                    * CA48C
          8PUTLAM                                * CA491
          %%      2.4E0                          * CA496
          %%<=                                   * CA4B0
          case                                   * CA4B5
          ::                                     * CA4BA
            6GETLAM                              * CA4BF
            EVAL                                 * CA4C4
            %1                                   * CA4C9
          ;                                      * CA4CE
          2GETLAM                                * CA4D3
          %2                                     * CA4D8
          %=                                     * CA4DD
          ITE                                    * CA4E2
          ::                                     * CA4E7
            8GETLAM                              * CA4EC
            %%      2E11                         * CA4F1
            %%<=                                 * CA50B
            caseFALSE                            * CA510
            %%      2E11                         * CA515
            7GETLAM                              * CA52F
            %%/                                  * CA534
            SWAP                                 * CA539
            %%0>                                 * CA53E
            ?SKIP                                * CA543
            %%CHS                                * CA548
            FALSE                                * CA54D
          ;                                      * CA552
          ::                                     * CA557
            %%      2.4E0                        * CA55C
            7GETLAM                              * CA576
            %%/                                  * CA57B
            SWAP                                 * CA580
            %%0>                                 * CA585
            ?SKIP                                * CA58A
            %%CHS                                * CA58F
            8GETLAM                              * CA594
            %%      4.8E0                        * CA599
            %%<=                                 * CA5B3
            caseTRUE                             * CA5B8
            2GETLAM                              * CA5BD
            %1                                   * CA5C2
            %<>                                  * CA5C7
          ;                                      * CA5CC
          case                                   * CA5D1
          ::                                     * CA5D6
            6GETLAM                              * CA5DB
            EVAL                                 * CA5E0
            %1                                   * CA5E5
          ;                                      * CA5EA
          %0_2A2B4                               * CA5EF
          %0_2A2B4                               * CA5F4
          ROT                                    * CA5F9
          5GETLAM                                * CA5FE
          %0_2A2B4                               * CA603
          %0_2A2B4                               * CA608
          %0_2A2B4                               * CA60D
          %0_2A2B4                               * CA612
          8NULLLAM{}                             * CA617
          BIND                                   * CA61C
          LAM     'T                             * CA621
          OBJ_36DCB                              * CA62C
          8PUTLAM                                * CA631
          LAM     'W                             * CA636
          OBJ_36E43                              * CA641
          7PUTLAM                                * CA646
          13GETLAM                               * CA64B
          EVAL                                   * CA650
          OBJ_36F56                              * CA655
          10GETLAM                               * CA65A
          %>%%                                   * CA65F
          OVER                                   * CA664
          %%>=                                   * CA669
          case                                   * CA66E
          ROMPTR  0C1 01C                        * CA673
          2DROP                                  * CA67E
          OBJ_37B30                              * CA683
          16GETLAM                               * CA688
          OVER                                   * CA68D
          %%*                                    * CA692
          %%ABS                                  * CA697
          %%      2.4E0                          * CA69C
          %%<=                                   * CA6B6
          case                                   * CA6BB
          ::                                     * CA6C0
            ABND                                 * CA6C5
            6GETLAM                              * CA6CA
            EVAL                                 * CA6CF
            %1                                   * CA6D4
          ;                                      * CA6D9
          14GETLAM                               * CA6DE
          5PUTLAM                                * CA6E3
          13GETLAM                               * CA6E8
          EVAL                                   * CA6ED
          OBJ_36F56                              * CA6F2
          10GETLAM                               * CA6F7
          %>%%                                   * CA6FC
          OVER                                   * CA701
          %%>=                                   * CA706
          case                                   * CA70B
          ROMPTR  0C1 01C                        * CA710
          2DROP                                  * CA71B
          %%      2E-1                           * CA720
          %%*                                    * CA73A
          16GETLAM                               * CA73F
          OVER                                   * CA744
          %%*                                    * CA749
          %%ABS                                  * CA74E
          %%      2.4E0                          * CA753
          %%<=                                   * CA76D
          case                                   * CA772
          ::                                     * CA777
            ABND                                 * CA77C
            6GETLAM                              * CA781
            EVAL                                 * CA786
            %1                                   * CA78B
          ;                                      * CA790
          14GETLAM                               * CA795
          5PUTLAM                                * CA79A
          13GETLAM                               * CA79F
          EVAL                                   * CA7A4
          OBJ_36F56                              * CA7A9
          10GETLAM                               * CA7AE
          %>%%                                   * CA7B3
          OVER                                   * CA7B8
          %%>=                                   * CA7BD
          case                                   * CA7C2
          ROMPTR  0C1 01C                        * CA7C7
          ABND                                   * CA7D2
          2DROP                                  * CA7D7
          %%      2.4E0                          * CA7DC
          7GETLAM                                * CA7F6
          %%/                                    * CA7FB
          SWAP                                   * CA800
          %%0>                                   * CA805
          ?SKIP                                  * CA80A
          %%CHS                                  * CA80F
          6GETLAM                                * CA814
          EVAL                                   * CA819
          %1                                     * CA81E
        ;                                        * CA823

* ROMPTR 0C1 01C
* refs (1): C78DB
ROMP_0C1_01C:
        ::                                       * CA828
          ABND                                   * CA82D
          1GETLAM                                * CA832
          %>%%                                   * CA837
          %%/                                    * CA83C
          3PICK                                  * CA841
          7GETLAM                                * CA846
          %%*                                    * CA84B
          %%ABS                                  * CA850
          %%      2E-2                           * CA855
          %%*                                    * CA86F
          1+(rr)                                 * CA874
          %%      3.8E0                          * CA879
          SWAP%%/                                * CA893
          %%      1.2E0                          * CA898
          %%+                                    * CA8B2
          OVER                                   * CA8B7
          %%0=                                   * CA8BC
          ITE                                    * CA8C1
          SWAPDROP                               * CA8C6
          ::                                     * CA8CB
            %%      9E-1                         * CA8D0
            ROT                                  * CA8EA
            %%      2.5E-1                       * CA8EF
            %%^                                  * CA909
            %%/                                  * CA90E
            OBJ_37DA0                            * CA913
          ;                                      * CA918
          3PICK                                  * CA91D
          %%*                                    * CA922
          2PUTLAM                                * CA927
          LAM     'W                             * CA92C
          OBJ_36D5D                              * CA937
          LAM     'T                             * CA93C
          OBJ_36D26                              * CA947
          2GETLAM                                * CA94C
          %2                                     * CA951
        ;                                        * CA956
