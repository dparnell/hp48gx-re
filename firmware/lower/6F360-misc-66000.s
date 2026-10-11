* HP 48GX ROM revision R, #6F360-#70038: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: rot;not(?);3rolld
* Follows on from the previous file (at #6F360 in the original ROM).
        RPL

* refs (2): 6E35C 6F29D
OBJ_6F360:
        ::                                       * 6F360
          OVER                                   * 6F365

* refs (8): 65E81 65EA9 6657F 6F1CB 6F2F2 6F338 ...
OBJ_6F36A:
          ::                                     * 6F36A
            OBJ_67E64                            * 6F36F
            OBJ_679C5                            * 6F374
          ;                                      * 6F379
          OBJ_6D1C7                              * 6F37E
          3PICK                                  * 6F383
          ::                                     * 6F388
            OBJ_67E64                            * 6F38D
            OBJ_68F7B                            * 6F392
            DROP                                 * 6F397
            OBJ_6ECF8                            * 6F39C
            NOT                                  * 6F3A1
          ;                                      * 6F3A6
          OVER                                   * 6F3AB
          NOTAND                                 * 6F3B0
          case                                   * 6F3B5
          3DROP                                  * 6F3BA
          3PICK                                  * 6F3BF

* refs (3): 6F32E 6F50E 6F54F
OBJ_6F3C4:
          ::                                     * 6F3C4
            DUP                                  * 6F3C9
            OBJ_67E54                            * 6F3CE
            INNERCOMP                            * 6F3D3
            ROT                                  * 6F3D8
            #1-UNROT                             * 6F3DD
            {}N                                  * 6F3E2
            OBJ_67F31                            * 6F3E7
          ;                                      * 6F3EC
          SWAPDROP                               * 6F3F1
          case                                   * 6F3F6
          OBJ_6F41E                              * 6F3FB
          GOTO                                   * 6F400
          L_6F338                                * 6F405
        ;                                        * 6F40A

* refs (1): 4B8C8
OBJ_6F40F:
        ::                                       * 6F40F
          7GETLAM                                * 6F414
          casedrop                               * 6F419

* refs (6): 6F130 6F162 6F1DA 6F306 6F3FB 6F496
OBJ_6F41E:
          ::                                     * 6F41E
            OBJ_6F36A                            * 6F423
L_6F428:
            DUP                                  * 6F428

* refs (9): 65D87 65EE5 661C9 66593 665AC 6B7E0 ...
OBJ_6F42D:
            ::                                   * 6F42D
              OBJ_673BB                          * 6F432
              DUP#0=csedrp                       * 6F437
              OBJ_25BFB                          * 6F43C
              #1=case                            * 6F441
              OBJ_66FB1                          * 6F446
              OBJ_66E7F                          * 6F44B
            ;                                    * 6F450
            OBJ_44DFE                            * 6F455
            ZEROSWAP                             * 6F45A
            OBJ_68593                            * 6F45F
          ;                                      * 6F464
          DUPUNROT                               * 6F469

* refs (4): 65E22 6F2C0 6F310 6F54A
OBJ_6F46E:
          ::                                     * 6F46E
            OVERSWAP                             * 6F473
            #2-                                  * 6F478
            OBJ_67F0B                            * 6F47D
          ;                                      * 6F482
          SWAP                                   * 6F487
          BINT4                                  * 6F48C
          #<>case                                * 6F491
          OBJ_6F41E                              * 6F496
          OBJ_67E64                              * 6F49B
          OBJ_65D14                              * 6F4A0
          GOTO                                   * 6F4A5
          L_6F428                                * 6F4AA
        ;                                        * 6F4AF

* refs (1): 6E3ED
OBJ_6F4B4:
        ::                                       * 6F4B4
          OVER                                   * 6F4B9
          OBJ_6F36A                              * 6F4BE
          OBJ_679C5                              * 6F4C3
          OBJ_67416                              * 6F4C8
          BEGIN                                  * 6F4CD
          OBJ_678D6                              * 6F4D2
          3PICK                                  * 6F4D7
          OVER#=                                 * 6F4DC
          NOT_WHILE                              * 6F4E1
          SWAPDROP                               * 6F4E6
          REPEAT                                 * 6F4EB
          DROPSWAPDROP                           * 6F4F0
          OBJ_67987                              * 6F4F5
          OBJ_6ECF8                              * 6F4FA
          case                                   * 6F4FF
          ::                                     * 6F504
            UNROTOVER                            * 6F509
            OBJ_6F3C4                            * 6F50E
            #2+                                  * 6F513
            OBJ_67F0B                            * 6F518
            OBJ_6D523                            * 6F51D
            OBJ_678D6                            * 6F522
            SWAP                                 * 6F527
            OBJ_67BFC                            * 6F52C
          ;                                      * 6F531
          DROP                                   * 6F536
          7GETLAM                                * 6F53B
          NOTcase                                * 6F540
          ::                                     * 6F545
            OBJ_6F46E                            * 6F54A
            OBJ_6F3C4                            * 6F54F
          ;                                      * 6F554
          DROPDUP                                * 6F559
          OBJ_67E54                              * 6F55E
          INNERCOMP                              * 6F563
          ROT                                    * 6F568
          DUPTWO                                 * 6F56D
          #/                                     * 6F572
          DROP                                   * 6F577
          #-                                     * 6F57C
          3UNROLL                                * 6F581
          {}N                                    * 6F586
          OBJ_67F31                              * 6F58B
        ;                                        * 6F590

* refs (8): 0C75D 46191 6F815 6F860 6F905 6F923 ...
OBJ_6F595:
        ::                                       * 6F595
          TakeOver                               * 6F59A
          OBJ_461CD                              * 6F59F

* refs (1): 69ECA
OBJ_6F5A4:
          ::                                     * 6F5A4
            'EL                                  * 6F5A9
            NOTcase                              * 6F5AE

* refs (1): 6ACDF
OBJ_6F5B3:
            ::                                   * 6F5B3
              'NG                                * 6F5B8
              INCOMPDROP                         * 6F5BD
              ROT                                * 6F5C2
              XYGROBDISP                         * 6F5C7
            ;                                    * 6F5CC
            OBJ_6B0CF                            * 6F5D1
            OBJ_6ACF3                            * 6F5D6
          ;                                      * 6F5DB
          'LB                                    * 6F5E0

* refs (4): 6F838 6F955 6FA1D 6FA4F
OBJ_6F5E5:
          ::                                     * 6F5E5
            OBJ_678D6                            * 6F5EA
            DUP#0=                               * 6F5EF
          ;                                      * 6F5F4
          NOTcase                                * 6F5F9
          OBJ_679D7                              * 6F5FE
          drop;q_58A0C                           * 6F603

* refs (5): 461AA 6F82E 6F842 6F879 6F946
OBJ_6F608:
          ::                                     * 6F608
            OBJ_25C23                            * 6F60D
            DoBadKey                             * 6F612
          ;                                      * 6F617
        ;                                        * 6F61C

* refs (6): 461A0 6F6F3 6F824 6F86F 6F93C 6F96E
OBJ_6F621:
        ::                                       * 6F621
          3PICK                                  * 6F626
          OBJ_678DB                              * 6F62B
          OBJ_679D7                              * 6F630
          4UNROLL                                * 6F635
          ROTOVER                                * 6F63A
          4PICK                                  * 6F63F
          OBJ_6F9D2                              * 6F644
          NOTcase2drop                           * 6F649
          2DROPFALSE                             * 6F64E
          SWAPDROP                               * 6F653
          BEGIN                                  * 6F658
          OBJ_679EA                              * 6F65D
          OVER                                   * 6F662
          OBJ_67B17                              * 6F667
          #0<>                                   * 6F66C
          AND                                    * 6F671
          NOT_WHILE                              * 6F676
          ::                                     * 6F67B
            OBJ_679EA                            * 6F680
            ITE                                  * 6F685
            ::                                   * 6F68A
              2DUPSWAP                           * 6F68F
              ITE                                * 6F694
              OBJ_6798C                          * 6F699
              OBJ_679A1                          * 6F69E
              DUP#0<>                            * 6F6A3
              case                               * 6F6A8
              SWAPDROP                           * 6F6AD
              DROP                               * 6F6B2
              OBJ_678D6                          * 6F6B7
              OBJ_679D7                          * 6F6BC
              5ROLL                              * 6F6C1
              #=?SKIP                            * 6F6C6

rot;not(?);3rolld:
              ::                                 * 6F6CB
                ROT                              * 6F6D0
                NOT                              * 6F6D5
                3UNROLL                          * 6F6DA
              ;                                  * 6F6DF
              3RDROP                             * 6F6E4
              3UNROLL                            * 6F6E9
              COLA                               * 6F6EE
              OBJ_6F621                          * 6F6F3
            ;                                    * 6F6F8
            OBJ_6F71B                            * 6F6FD
          ;                                      * 6F702
          REPEAT                                 * 6F707
          4UNROLL3DROP                           * 6F70C
          TRUE                                   * 6F711
        ;                                        * 6F716

* refs (1): 6F6FD
OBJ_6F71B:
        ::                                       * 6F71B
          OBJ_679D2                              * 6F720
          5PICK                                  * 6F725
          #=                                     * 6F72A
          4PICK                                  * 6F72F
          ?SKIP                                  * 6F734
          NOT                                    * 6F739
          case                                   * 6F73E
          ::                                     * 6F743
            OVER                                 * 6F748
            case                                 * 6F74D
            OBJ_679B3                            * 6F752
            OBJ_679C5                            * 6F757
          ;                                      * 6F75C
          ZEROSWAP                               * 6F761
          OBJ_679B3                              * 6F766
          DUP                                    * 6F76B
          BEGIN                                  * 6F770
          OBJ_67B12                              * 6F775
          DUP                                    * 6F77A
          OBJ_66BAD                              * 6F77F
          ITE                                    * 6F784
          ::                                     * 6F789
            DUP                                  * 6F78E
            OBJ_6EE65                            * 6F793
            casedrop                             * 6F798
            BINT0                                * 6F79D
          ;                                      * 6F7A2
          DROPZERO                               * 6F7A7
          4PICKOVER                              * 6F7AC
          #<ITE                                  * 6F7B1
          ::                                     * 6F7B6
            4ROLLDROP                            * 6F7BB
            3UNROLL                              * 6F7C0
            SWAPDROPDUP                          * 6F7C5
          ;                                      * 6F7CA
          DROP                                   * 6F7CF
          OBJ_6FEE1                              * 6F7D4
          SWAP                                   * 6F7D9
          #0=                                    * 6F7DE
          NOT?SEMI                               * 6F7E3
          BEGIN                                  * 6F7E8
          OBJ_679EA                              * 6F7ED
          WHILE                                  * 6F7F2
          ::                                     * 6F7F7
            OBJ_6798C                            * 6F7FC
          ;                                      * 6F801
          REPEAT                                 * 6F806
        ;                                        * 6F80B

* refs (1): 4B4A5
OBJ_6F810:
        ::                                       * 6F810
          OBJ_6F595                              * 6F815
L_6F81A:
          #1=                                    * 6F81A
          FALSE                                  * 6F81F
          OBJ_6F621                              * 6F824
          NOTcase                                * 6F829
          OBJ_6F608                              * 6F82E
          OBJ_6F883                              * 6F833
          OBJ_6F5E5                              * 6F838
          casedrop                               * 6F83D
          OBJ_6F608                              * 6F842
          OBJ_679D7                              * 6F847
          GOTO                                   * 6F84C
          L_6F81A                                * 6F851
        ;                                        * 6F856

* refs (1): 4B4C3
OBJ_6F85B:
        ::                                       * 6F85B
          OBJ_6F595                              * 6F860
          #1<>                                   * 6F865
          TRUE                                   * 6F86A
L_6F86F:
          OBJ_6F621                              * 6F86F
          NOTcase                                * 6F874
          OBJ_6F608                              * 6F879

* refs (1): 6F98C
OBJ_6F87E:
          ::                                     * 6F87E

* refs (2): 461AF 6F833
OBJ_6F883:
            ::                                   * 6F883
              DUP                                * 6F888
              OBJ_6AAB9                          * 6F88D
              NOT?GOTO                           * 6F892
              L_6F8D8                            * 6F897
              OBJ_67B12                          * 6F89C
              OBJ_6B381                          * 6F8A1
              OBJ_6AC80                          * 6F8A6

* refs (1): 689E0
OBJ_6F8AB:
              ::                                 * 6F8AB
                DUP                              * 6F8B0
                OBJ_2846E                        * 6F8B5
                EQ                               * 6F8BA
                SWAP                             * 6F8BF
                OBJ_2845A                        * 6F8C4
                EQOR                             * 6F8C9
              ;                                  * 6F8CE
              NOT?SEMI                           * 6F8D3
L_6F8D8:
              RDROP                              * 6F8D8
              OBJ_6FACC                          * 6F8DD
            ;                                    * 6F8E2
            OBJ_67B17                            * 6F8E7
            OBJ_6B39F                            * 6F8EC
            OBJ_6FACC                            * 6F8F1
          ;                                      * 6F8F6
        ;                                        * 6F8FB

        ::                                       * 6F900
          OBJ_6F595                              * 6F905
          TRUE                                   * 6F90A
          GOTO                                   * 6F90F
          L_6F92D                                * 6F914
        ;                                        * 6F919

        ::                                       * 6F91E
          OBJ_6F595                              * 6F923
          FALSE                                  * 6F928
L_6F92D:
          3UNROLL                                * 6F92D
          #1<>                                   * 6F932
          3PICK                                  * 6F937
          OBJ_6F621                              * 6F93C
          NOTcasedrop                            * 6F941
          OBJ_6F608                              * 6F946
          BEGIN                                  * 6F94B
          DUP                                    * 6F950
          OBJ_6F5E5                              * 6F955
          case2drpfls                            * 6F95A
          OBJ_679D7                              * 6F95F
          #1<>                                   * 6F964
          4PICK                                  * 6F969
          OBJ_6F621                              * 6F96E
          DUP                                    * 6F973
          IT                                     * 6F978
          ROTDROP                                * 6F97D
          NOT_UNTIL                              * 6F982
          SWAPDROP                               * 6F987
          OBJ_6F87E                              * 6F98C
        ;                                        * 6F991

        ::                                       * 6F996
          OBJ_6F595                              * 6F99B
          2DROP                                  * 6F9A0
          OBJ_67D0F                              * 6F9A5
          OBJ_6FACC                              * 6F9AA
        ;                                        * 6F9AF

        ::                                       * 6F9B4
          OBJ_6F595                              * 6F9B9
          2DROP                                  * 6F9BE
          OBJ_67D1B                              * 6F9C3
          OBJ_6FACC                              * 6F9C8
        ;                                        * 6F9CD

* refs (2): 6F644 6FAC2
OBJ_6F9D2:
        ::                                       * 6F9D2
          DUP4UNROLL                             * 6F9D7
          IT                                     * 6F9DC
          ::                                     * 6F9E1
            2DUP                                 * 6F9E6
            ITE                                  * 6F9EB
            OBJ_6798C                            * 6F9F0
            OBJ_679A1                            * 6F9F5
            DUP#0=csDROP                         * 6F9FA
            SWAPDROP                             * 6F9FF
            ROTDROP                              * 6FA04
            TRUE                                 * 6FA09
            RDROP                                * 6FA0E
          ;                                      * 6FA13
          SWAP                                   * 6FA18
          OBJ_6F5E5                              * 6FA1D
          casedrop                               * 6FA22
          ::                                     * 6FA27
            ROTROT2DROP                          * 6FA2C
            FALSE                                * 6FA31
          ;                                      * 6FA36
          OBJ_679D2                              * 6FA3B
          SWAP                                   * 6FA40
          BEGIN                                  * 6FA45
          ::                                     * 6FA4A
            OBJ_6F5E5                            * 6FA4F
            case                                 * 6FA54
            FalseTrue                            * 6FA59
            OBJ_679D2                            * 6FA5E
            4PICK                                * 6FA63
            8PICK                                * 6FA68
            ITE                                  * 6FA6D
            #=                                   * 6FA72
            #<>                                  * 6FA77
            case                                 * 6FA7C
            TrueTrue                             * 6FA81
            drop(2);false                        * 6FA86
          ;                                      * 6FA8B
          UNTIL                                  * 6FA90
          SWAPDROP                               * 6FA95
          ROTDROP                                * 6FA9A
          5ROLLDROP                              * 6FA9F
          4ROLLSWAP                              * 6FAA4
          NOTcase2drop                           * 6FAA9
          FALSE                                  * 6FAAE
          ROTDROP                                * 6FAB3
          TRUE                                   * 6FAB8
          COLA                                   * 6FABD
          OBJ_6F9D2                              * 6FAC2
        ;                                        * 6FAC7

* refs (5): 25C2D 6F8DD 6F8F1 6F9AA 6F9C8
OBJ_6FACC:
        ::                                       * 6FACC
          DUP                                    * 6FAD1
          ROMPTR  0EA 03C                        * 6FAD6
          'LB                                    * 6FAE1
          OBJ_67AEF                              * 6FAE6
          ROTDUP                                 * 6FAEB
          OBJ_67C6C                              * 6FAF0
          OBJ_44E3F                              * 6FAF5
          EQITE                                  * 6FAFA
          ::                                     * 6FAFF
            SWAPDROPSWAP                         * 6FB04
            #3-                                  * 6FB09
            SWAP                                 * 6FB0E
            OBJ_679A1                            * 6FB13
            OBJ_67A8B                            * 6FB18
            #1-                                  * 6FB1D
            OBJ_66FD5                            * 6FB22
            3UNROLL                              * 6FB27
            BINT4                                * 6FB2C
            BINT5                                * 6FB31
          ;                                      * 6FB36
          ::                                     * 6FB3B
            DUP                                  * 6FB40
            OBJ_67ABC                            * 6FB45
            2DUP                                 * 6FB4A
            #2=                                  * 6FB4F
            case                                 * 6FB54
            ::                                   * 6FB59
              4UNROLL3DROP                       * 6FB5E
              BINT3                              * 6FB63
              SWAP2DUP                           * 6FB68
              MAKEGROB                           * 6FB6D
              INVGROB                            * 6FB72
              BINT1                              * 6FB77
              3PICK                              * 6FB7C
              #2-                                * 6FB81
              OBJ_6FBD1                          * 6FB86
              ROT                                * 6FB8B
              #1-UNROT                           * 6FB90
            ;                                    * 6FB95
            #2=                                  * 6FB9A
            case                                 * 6FB9F
            ::                                   * 6FBA4
              ROTROT2DROP                        * 6FBA9
              BINT3                              * 6FBAE
              2DUP                               * 6FBB3
              MAKEGROB                           * 6FBB8
              INVGROB                            * 6FBBD
              3PICK                              * 6FBC2
              #2-                                * 6FBC7
              BINT1                              * 6FBCC

* refs (1): 6FB86
OBJ_6FBD1:
              ::                                 * 6FBD1
                MAKEGROB                         * 6FBD6
                OVER                             * 6FBDB
                ONEONE                           * 6FBE0
                GROB!                            * 6FBE5
                5UNROLL                          * 6FBEA
              ;                                  * 6FBEF
            ;                                    * 6FBF4
            SWAPROT                              * 6FBF9
            OBJ_67C6C                            * 6FBFE
            TOTEMPOB                             * 6FC03
            INVGROB                              * 6FC08
            5UNROLL                              * 6FC0D
          ;                                      * 6FC12
          4PICK#+                                * 6FC17
          SWAP                                   * 6FC1C
          3PICK#+                                * 6FC21
          'LE                                    * 6FC26
          5PICK                                  * 6FC2B
          #>ITE                                  * 6FC30
          ::                                     * 6FC35
            4PICK                                * 6FC3A
            ROMPTR  0EA 03C                      * 6FC3F
            'LE                                  * 6FC4A
          ;                                      * 6FC4F
          ::                                     * 6FC54
            'LE                                  * 6FC59
            BINT131                              * 6FC5E
            #+                                   * 6FC63
            3PICKSWAP                            * 6FC68
            2DUP#>                               * 6FC6D
            NOTcase2DROP                         * 6FC72
            #-                                   * 6FC77
            'LE                                  * 6FC7C
            #+                                   * 6FC81
            ROMPTR  0EA 03C                      * 6FC86
            'LE                                  * 6FC91
          ;                                      * 6FC96
          'TE                                    * 6FC9B
          4PICK                                  * 6FCA0
          #>ITE                                  * 6FCA5
          ::                                     * 6FCAA
            3PICK                                * 6FCAF
            #1-DUP                               * 6FCB4
            OBJ_66BAD                            * 6FCB9
            IT                                   * 6FCBE
            DROPZERO                             * 6FCC3
            ROMPTR  0EA 03C                      * 6FCC8
            'TE                                  * 6FCD3
          ;                                      * 6FCD8
          ::                                     * 6FCDD
            DUP                                  * 6FCE2
            'TE                                  * 6FCE7
            RclRowMenu                           * 6FCEC
            #+                                   * 6FCF1
            2DUP#>                               * 6FCF6
            NOTcase2DROP                         * 6FCFB
            #-                                   * 6FD00
            #1-                                  * 6FD05
            'TE                                  * 6FD0A
            #+                                   * 6FD0F
            ROMPTR  0EA 03C                      * 6FD14
            'TE                                  * 6FD1F
          ;                                      * 6FD24
          'TE                                    * 6FD29
          'LE                                    * 6FD2E
          WINDOWXY                               * 6FD33
          4PICK                                  * 6FD38
          4UNROLL                                * 6FD3D
          3PICK                                  * 6FD42
          5UNROLL                                * 6FD47
          HARDBUFF                               * 6FD4C
          5UNROLL                                * 6FD51
          SUBGROB                                * 6FD56
          3PICK3PICK                             * 6FD5B
          THREE{}N                               * 6FD60
          ROMPTR  0EA 03C                        * 6FD65
          'NG                                    * 6FD70
          ROT                                    * 6FD75
          XYGROBDISP                             * 6FD7A
        ;                                        * 6FD7F
        NIBHEX  0                                * 6FD84

* refs (3): 65C9F 661B5 6E3F2
OBJ_6FD85:
        CON(5)  (*)+5                            * 6FD85  primitive code object
        ASSEMBLE
        LC(5)   BINT2                            * 6FD8A
L_6FD91:
        A=DAT1  A                                * 6FD91
        ?C=A    A                                * 6FD94
        GOYES   L_6FDA6                          * 6FD97
        LC(5)   SKIP                             * 6FD99
L_6FDA0:
        A=C     A                                * 6FDA0
        PC=(A)                                   * 6FDA2
L_6FDA6:
        D1=D1+  5                                * 6FDA6
        D=D+1   A                                * 6FDA9
        LC(5)   COLA                             * 6FDAB
        GOTO    L_6FDA0                          * 6FDB2

* refs (7): 65CA9 661D8 6E17C 6E19A 6E393 6E3CA ...
OBJ_6FDB6:
        CON(5)  (*)+5                            * 6FDB6  primitive code object
        LC(5)   BINT4                            * 6FDBB
        GOTO    L_6FD91                          * 6FDC2

* refs (7): 44C50 65CB3 661E2 6D48D 6E1A4 6E39D ...
OBJ_6FDC6:
        CON(5)  (*)+5                            * 6FDC6  primitive code object
        LC(5)   BINT6                            * 6FDCB
        GOTO    L_6FD91                          * 6FDD2

* refs (3): 6A888 6A8A6 6A8B5
OBJ_6FDD6:
        CON(5)  (*)+5                            * 6FDD6  primitive code object
        ST=1    0                                * 6FDDB
        GOTO    L_6FDEA                          * 6FDDE

* refs (1): 6E32A
OBJ_6FDE2:
        CON(5)  (*)+5                            * 6FDE2  primitive code object
        ST=0    0                                * 6FDE7
L_6FDEA:
        C=DAT0  A                                * 6FDEA
        D0=D0+  5                                * 6FDED
        RSTK=C                                   * 6FDF0
        GOSBVL  POP#                             * 6FDF2
        GOSBVL  SAVPTR                           * 6FDF9
        B=A     B                                * 6FE00
        C=RSTK                                   * 6FE03
        D1=C                                     * 6FE05
        C=DAT1  B                                * 6FE08
        C=C-1   B                                * 6FE0B
        D1=D1+  2                                * 6FE0E
L_6FE11:
        A=DAT1  B                                * 6FE11
        ?A=B    B                                * 6FE14
        GOYES   L_6FE3B                          * 6FE17
        D1=D1+  7                                * 6FE19
        C=C-1   B                                * 6FE1C
        GONC    L_6FE11                          * 6FE1F
        ?ST=1   0                                * 6FE22
        GOYES   L_6FE2E                          * 6FE25
        GOVLNG  GETPTRFALSE                      * 6FE27
L_6FE2E:
        LA(5)   DoBadKey                         * 6FE2E
        GOC     L_6FE41                          * 6FE38
L_6FE3B:
        D1=D1+  2                                * 6FE3B
        A=DAT1  A                                * 6FE3E
L_6FE41:
        GOSBVL  GETPTR                           * 6FE41
        D1=D1-  5                                * 6FE48
        DAT1=A  A                                * 6FE4B
        D=D-1   A                                * 6FE4E
        LC(5)   TRUE                             * 6FE50
        D1=D1-  5                                * 6FE57
        DAT1=C  A                                * 6FE5A
        D=D-1   A                                * 6FE5D
        A=DAT0  A                                * 6FE5F
        D0=D0+  5                                * 6FE62
        PC=(A)                                   * 6FE65
        RPL

* refs (1): 684C9
OBJ_6FE69:
        ::                                       * 6FE69
          DUP                                    * 6FE6E

* refs (1): 684B6
OBJ_6FE73:
          ::                                     * 6FE73

* refs (2): 6850A 68528
OBJ_6FE78:
            ::                                   * 6FE78
              OBJ_67B12                          * 6FE7D
              OBJ_66BAD                          * 6FE82
              case                               * 6FE87

* refs (1): 6FED7
OBJ_6FE8C:
              ::                                 * 6FE8C
                OBJ_67B17                        * 6FE91
                OBJ_6B381                        * 6FE96
                OBJ_6AC80                        * 6FE9B
              ;                                  * 6FEA0
              OBJ_678D6                          * 6FEA5
              OBJ_679B3                          * 6FEAA
              BEGIN                              * 6FEAF
              OBJ_67B12                          * 6FEB4
              #1+                                * 6FEB9
              OBJ_66BAD                          * 6FEBE
              case                               * 6FEC3
              ::                                 * 6FEC8
                SWAPDROP                         * 6FECD
                RDROP                            * 6FED2
                OBJ_6FE8C                        * 6FED7
              ;                                  * 6FEDC

* refs (6): 66700 6684C 669AB 68FF8 6F7D4 6FF45
OBJ_6FEE1:
              ::                                 * 6FEE1
                OBJ_67969                        * 6FEE6
                COLA                             * 6FEEB
                NOT_UNTIL                        * 6FEF0
              ;                                  * 6FEF5
              OBJ_672E6                          * 6FEFA
              DUP                                * 6FEFF
              OBJ_67E64                          * 6FF04
              BEGIN                              * 6FF09
              OBJ_679B3                          * 6FF0E
              BEGIN                              * 6FF13
              3PICK                              * 6FF18
              OVER#=                             * 6FF1D
              case                               * 6FF22
              ::                                 * 6FF27
                2RDROP                           * 6FF2C
                DROPSWAPDROP                     * 6FF31
                OBJ_67E54                        * 6FF36
                OBJ_6EF6E                        * 6FF3B
              ;                                  * 6FF40
              OBJ_6FEE1                          * 6FF45
              #1-DUP                             * 6FF4A
              OBJ_67E64                          * 6FF4F
              AGAIN                              * 6FF54
            ;                                    * 6FF59
            OBJ_2708E                            * 6FF5E
            DROP                                 * 6FF63
            BINT4                                * 6FF68
            NTHCOMPDROP                          * 6FF6D
          ;                                      * 6FF72
          EVAL                                   * 6FF77
        ;                                        * 6FF7C
        ASSEMBLE
L_6FF81:
        A=A-1   S                                * 6FF81
        RTNC                                     * 6FF84
        A=A-1   S                                * 6FF87
        RTNC                                     * 6FF8A
        P=      15                               * 6FF8D
        LC(1)   #7                               * 6FF8F
        P=      0                                * 6FF92
        A=A-C   S                                * 6FF94
        GOC     L_6FFB5                          * 6FF97
        D1=(5)  #8084F                           * 6FF9A
        A=DAT1  1                                * 6FFA1
        ?ABIT=0 2                                * 6FFA5
        GOYES   L_6FFAF                          * 6FFAA
        A=A-1   S                                * 6FFAC
L_6FFAF:
        A=A-1   S                                * 6FFAF
        RTNC                                     * 6FFB2
L_6FFB5:
        RTNCC                                    * 6FFB5
        RPL

* refs (1): 4C5DF
OBJ_6FFB7:
        ::                                       * 6FFB7
          9GETLAM                                * 6FFBC

* refs (1): 7001B
OBJ_6FFC1:
          ::                                     * 6FFC1
            %%1                                  * 6FFC6
            SWAP                                 * 6FFCB
            %%/                                  * 6FFD0
            DUP                                  * 6FFD5
            %%2                                  * 6FFDA
            %%/                                  * 6FFDF
            2%%>%                                * 6FFE4
            SWAP                                 * 6FFE9
          ;                                      * 6FFEE
          19PUTLAM                               * 6FFF3
        ;                                        * 6FFF8

* refs (2): 4B7AB 4D1B4
OBJ_6FFFD:
        ::                                       * 6FFFD
          OBJ_4A874                              * 70002
          11GETLAM                               * 70007
          OBJ_731DF                              * 7000C
          NOT?SEMI                               * 70011
          10GETLAM                               * 70016
          OBJ_6FFC1                              * 7001B
          DROP                                   * 70020
          16GETLAM                               * 70025
          %+                                     * 7002A
          16PUTLAM                               * 7002F
        ;                                        * 70034
