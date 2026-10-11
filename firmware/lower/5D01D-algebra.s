* HP 48GX ROM revision R, #5D01D-#6001B: Symbolic algebra
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: psh top& pshtop& #1-SWAP SWAPDROP#1- pshm1 addt: NOTcaseFALSE rot dup unrot larg
* Follows on from the previous file (at #5D01D in the original ROM).
        RPL

* refs (2): 5CFFA 5D00E
OBJ_5D01D:
        ::                                       * 5D01D
          'R                                     * 5D022
          RDROP                                  * 5D027
          dvarlsBIND                             * 5D02C
          BEGIN                                  * 5D031
          ::                                     * 5D036
            1GETLAM                              * 5D03B
            EVAL                                 * 5D040
          ;                                      * 5D045
          BINT1                                  * 5D04A
          OBJ_69B30                              * 5D04F
          OBJ_69B30                              * 5D054
          PICK                                   * 5D059
          #0<>                                   * 5D05E
          WHILE                                  * 5D063
          ::                                     * 5D068
            top&                                 * 5D06D
            psh                                  * 5D072
            DUP                                  * 5D077
            #2+                                  * 5D07C
            BINT1                                * 5D081
            splitdown                            * 5D086
            DROP                                 * 5D08B
            #1-                                  * 5D090
            tailpsh                              * 5D095
            rotswap                              * 5D09A
            top&                                 * 5D09F
            larg                                 * 5D0A4
          ;                                      * 5D0A9
          REPEAT                                 * 5D0AE
          ABND                                   * 5D0B3
          RDROP                                  * 5D0B8
        ;                                        * 5D0BD

* meta -> meta'
* refs (6): 5ACD1 5D176 83919 840A3 841E3 844B3
forceadd:
        ::                                       * 5D0C2
          M1st+case                              * 5D0C7
          OBJ_5D167                              * 5D0CC
          M1st-case                              * 5D0D1
          OBJ_5D0EA                              * 5D0D6
          M1stNEGcase                            * 5D0DB
          OBJ_5D10D                              * 5D0E0
        ;                                        * 5D0E5

* refs (2): 5D0D6 5D130
OBJ_5D0EA:
        ::                                       * 5D0EA
          SWAPDROP#1-                            * 5D0EF
          metaneg                                * 5D0F4
          OBJ_5CD02                              * 5D0F9
          COLA                                   * 5D0FE
          OBJ_5D167                              * 5D103
        ;                                        * 5D108

* refs (1): 5D0E0
OBJ_5D10D:
        ::                                       * 5D10D
          3PICK                                  * 5D112
          REQcasedrop                            * 5D117
          x+                                     * 5D11C
          ::                                     * 5D121
            OBJ_5CC58                            * 5D126
            COLA                                 * 5D12B
            OBJ_5D0EA                            * 5D130
          ;                                      * 5D135
          REQcasedrop                            * 5D13A
          x-                                     * 5D13F
          ::                                     * 5D144
            OBJ_5CC71                            * 5D149
            COLA                                 * 5D14E
            OBJ_5D167                            * 5D153
          ;                                      * 5D158
          DROP                                   * 5D15D
        ;                                        * 5D162

* refs (3): 5D0CC 5D103 5D153
OBJ_5D167:
        ::                                       * 5D167
          SWAPDROP#1-                            * 5D16C
          larg                                   * 5D171
          forceadd                               * 5D176
          OVER'                                  * 5D17B
          x+                                     * 5D180
          EQIT                                   * 5D185
          ::                                     * 5D18A
            plDRPpZparg                          * 5D18F
            meta+                                * 5D194
            pshtop&                              * 5D199
          ;                                      * 5D19E
          top&                                   * 5D1A3
          OBJ_5CD02                              * 5D1A8
        ;                                        * 5D1AD

* refs (5): 5D261 839BE 840B2 84355 844A9
OBJ_5D1B2:
        ::                                       * 5D1B2
          M1st+case                              * 5D1B7
          OBJ_5D257                              * 5D1BC
          M1st-case                              * 5D1C1
          OBJ_5D234                              * 5D1C6
          M1stNEGcase                            * 5D1CB
          OBJ_5D1DA                              * 5D1D0
        ;                                        * 5D1D5

* refs (1): 5D1D0
OBJ_5D1DA:
        ::                                       * 5D1DA
          3PICK                                  * 5D1DF
          REQcasedrop                            * 5D1E4
          x+                                     * 5D1E9
          ::                                     * 5D1EE
            OBJ_5CC58                            * 5D1F3
            COLA                                 * 5D1F8
            OBJ_5D234                            * 5D1FD
          ;                                      * 5D202
          REQcasedrop                            * 5D207
          x-                                     * 5D20C
          ::                                     * 5D211
            OBJ_5CC71                            * 5D216
            COLA                                 * 5D21B
            OBJ_5D257                            * 5D220
          ;                                      * 5D225
          DROP                                   * 5D22A
        ;                                        * 5D22F

* refs (2): 5D1C6 5D1FD
OBJ_5D234:
        ::                                       * 5D234
          SWAPDROP#1-                            * 5D239
          metaneg                                * 5D23E
          OBJ_5CD02                              * 5D243
          COLA                                   * 5D248
          OBJ_5D257                              * 5D24D
        ;                                        * 5D252

* refs (3): 5D1BC 5D220 5D24D
OBJ_5D257:
        ::                                       * 5D257
          plDRPpZparg                            * 5D25C
          OBJ_5D1B2                              * 5D261
          OVER'                                  * 5D266
          x+                                     * 5D26B
          EQIT                                   * 5D270
          ::                                     * 5D275
            SWAPDROP#1-                          * 5D27A
            pshtop&                              * 5D27F
            meta+                                * 5D284
            pshzer                               * 5D289
          ;                                      * 5D28E
          pshtop&                                * 5D293
          OBJ_5CD02                              * 5D298
        ;                                        * 5D29D

* refs (1): 5D7AE
OBJ_5D2A2:
        ::                                       * 5D2A2
          SWAPDROP#1-                            * 5D2A7
          metaneg                                * 5D2AC
          OBJ_5CD02                              * 5D2B1
          COLA                                   * 5D2B6
          ROMPTR  0F0 055                        * 5D2BB
        ;                                        * 5D2C6

* refs (2): 840A8 844B8
OBJ_5D2CB:
        ::                                       * 5D2CB
          M1st+case                              * 5D2D0
          ::                                     * 5D2D5
            #1-SWAP                              * 5D2DA
            pshm1                                * 5D2DF
            pshzerpsharg                         * 5D2E4
            unrot                                * 5D2E9
          ;                                      * 5D2EE
          pshzer                                 * 5D2F3
          pshzer                                 * 5D2F8
        ;                                        * 5D2FD

* refs (2): 840B7 844C2
OBJ_5D302:
        ::                                       * 5D302
          M1st+case                              * 5D307
          ::                                     * 5D30C
            #1-SWAP                              * 5D311
            pshm1                                * 5D316
            pshzerpsharg                         * 5D31B
            rotswap                              * 5D320
          ;                                      * 5D325
          pshzer                                 * 5D32A
          pshzer                                 * 5D32F
        ;                                        * 5D334

* refs (5): 5D3ED 838EC 840F8 8429C 8454E
OBJ_5D339:
        ::                                       * 5D339
          M1st*case                              * 5D33E
          OBJ_5D3DE                              * 5D343
          M1st/case                              * 5D348
          OBJ_5D361                              * 5D34D
          M1stINVcase                            * 5D352
          OBJ_5D384                              * 5D357
        ;                                        * 5D35C

* refs (2): 5D34D 5D3A7
OBJ_5D361:
        ::                                       * 5D361
          SWAPDROP#1-                            * 5D366
          metainv                                * 5D36B
          addt*                                  * 5D370
          COLA                                   * 5D375
          OBJ_5D3DE                              * 5D37A
        ;                                        * 5D37F

* refs (1): 5D357
OBJ_5D384:
        ::                                       * 5D384
          3PICK                                  * 5D389
          REQcasedrop                            * 5D38E
          x*                                     * 5D393
          ::                                     * 5D398
            OBJ_5CCBC                            * 5D39D
            COLA                                 * 5D3A2
            OBJ_5D361                            * 5D3A7
          ;                                      * 5D3AC
          REQcasedrop                            * 5D3B1
          x/                                     * 5D3B6
          ::                                     * 5D3BB
            OBJ_5CCD5                            * 5D3C0
            COLA                                 * 5D3C5
            OBJ_5D3DE                            * 5D3CA
          ;                                      * 5D3CF
          DROP                                   * 5D3D4
        ;                                        * 5D3D9

* refs (3): 5D343 5D37A 5D3CA
OBJ_5D3DE:
        ::                                       * 5D3DE
          SWAPDROP#1-                            * 5D3E3
          larg                                   * 5D3E8
          OBJ_5D339                              * 5D3ED
          OVER'                                  * 5D3F2
          x*                                     * 5D3F7
          EQIT                                   * 5D3FC
          ::                                     * 5D401
            plDRPpZparg                          * 5D406
            meta*                                * 5D40B
            pshtop&                              * 5D410
          ;                                      * 5D415
          top&                                   * 5D41A
          addt*                                  * 5D41F
        ;                                        * 5D424

* refs (5): 5D4D8 83987 84107 8440E 84544
OBJ_5D429:
        ::                                       * 5D429
          M1st*case                              * 5D42E
          OBJ_5D4CE                              * 5D433
          M1st/case                              * 5D438
          OBJ_5D4AB                              * 5D43D
          M1stINVcase                            * 5D442
          OBJ_5D451                              * 5D447
        ;                                        * 5D44C

* refs (1): 5D447
OBJ_5D451:
        ::                                       * 5D451
          3PICK                                  * 5D456
          REQcasedrop                            * 5D45B
          x*                                     * 5D460
          ::                                     * 5D465
            OBJ_5CCBC                            * 5D46A
            COLA                                 * 5D46F
            OBJ_5D4AB                            * 5D474
          ;                                      * 5D479
          REQcasedrop                            * 5D47E
          x/                                     * 5D483
          ::                                     * 5D488
            OBJ_5CCD5                            * 5D48D
            COLA                                 * 5D492
            OBJ_5D4CE                            * 5D497
          ;                                      * 5D49C
          DROP                                   * 5D4A1
        ;                                        * 5D4A6

* refs (2): 5D43D 5D474
OBJ_5D4AB:
        ::                                       * 5D4AB
          SWAPDROP#1-                            * 5D4B0
          metainv                                * 5D4B5
          addt*                                  * 5D4BA
          COLA                                   * 5D4BF
          OBJ_5D4CE                              * 5D4C4
        ;                                        * 5D4C9

* refs (3): 5D433 5D497 5D4C4
OBJ_5D4CE:
        ::                                       * 5D4CE
          plDRPpZparg                            * 5D4D3
          OBJ_5D429                              * 5D4D8
          OVER'                                  * 5D4DD
          x*                                     * 5D4E2
          EQIT                                   * 5D4E7
          ::                                     * 5D4EC
            SWAPDROP#1-                          * 5D4F1
            pshtop&                              * 5D4F6
            meta*                                * 5D4FB
            pshzer                               * 5D500
          ;                                      * 5D505
          pshtop&                                * 5D50A
          addt*                                  * 5D50F
        ;                                        * 5D514

* refs (1): 5D809
OBJ_5D519:
        ::                                       * 5D519
          SWAPDROP#1-                            * 5D51E
          metainv                                * 5D523
          addt*                                  * 5D528
          COLA                                   * 5D52D
          ROMPTR  0F0 056                        * 5D532
        ;                                        * 5D53D

* refs (2): 840FD 84553
OBJ_5D542:
        ::                                       * 5D542
          M1st*case                              * 5D547
          ::                                     * 5D54C
            #1-SWAP                              * 5D551
            pshm1                                * 5D556
            pshzerpsharg                         * 5D55B
            unrot                                * 5D560
          ;                                      * 5D565
          pshzer                                 * 5D56A
          pshzer                                 * 5D56F
        ;                                        * 5D574

* refs (2): 8410C 8455D
OBJ_5D579:
        ::                                       * 5D579
          M1st*case                              * 5D57E
          ::                                     * 5D583
            #1-SWAP                              * 5D588
            pshm1                                * 5D58D
            pshzerpsharg                         * 5D592
            rotswap                              * 5D597
          ;                                      * 5D59C
          pshzer                                 * 5D5A1
          pshzer                                 * 5D5A6
        ;                                        * 5D5AB

* refs (3): 5D6EA 5D75D 5D877
OBJ_5D5B0:
        ::                                       * 5D5B0
          DUP#0=case                             * 5D5B5
          FALSE                                  * 5D5BA
          DUP#2+                                 * 5D5BF
          BINT1                                  * 5D5C4
          BEGIN                                  * 5D5C9
          splitdown                              * 5D5CE
          OVER                                   * 5D5D3
          #2+PICK                                * 5D5D8
          1GETLAM                                * 5D5DD
          EQcasedrop                             * 5D5E2
          OBJ_5D62D                              * 5D5E7
          2GETLAM                                * 5D5EC
          EQcasedrop                             * 5D5F1
          OBJ_5D62D                              * 5D5F6
          REQcasedrop                            * 5D5FB
          x=                                     * 5D600
          OBJ_5D62D                              * 5D605
          2DROP                                  * 5D60A
          BINT2                                  * 5D60F
          #=casedrop                             * 5D614
          RDROPFALSE                             * 5D619
          BINT1                                  * 5D61E
          AGAIN                                  * 5D623
        ;                                        * 5D628

* refs (3): 5D5E7 5D5F6 5D605
OBJ_5D62D:
        ::                                       * 5D62D
          3GETLAM                                * 5D632
          #=casedrop                             * 5D637
          COLATRUE                               * 5D63C
          DROP                                   * 5D641
          BINT2                                  * 5D646
          #=casedrop                             * 5D64B
          RDROPFALSE                             * 5D650
          BINT1                                  * 5D655
          AGAIN                                  * 5D65A
        ;                                        * 5D65F

* refs (2): 5D7BD 5D818
OBJ_5D664:
        ::                                       * 5D664
          BINT1                                  * 5D669
          'R'R                                   * 5D66E

* refs (4): 5D730 5D86D 5D935 5DA0C
OBJ_5D673:
          ::                                     * 5D673
            {                                    * 5D678

Π'which:
              LAM     'which                     * 5D67D

Π'op1:
              LAM     'op1                       * 5D690

Π'op2:
              LAM     'op2                       * 5D69F
            }                                    * 5D6AE
            BIND                                 * 5D6B3
          ;                                      * 5D6B8
          3PICK                                  * 5D6BD
          2GETLAM                                * 5D6C2
          EQcasedrop                             * 5D6C7
          pullpsh1&                              * 5D6CC
          1GETLAM                                * 5D6D1
          EQcasedrop                             * 5D6D6
          pullpsh1&                              * 5D6DB
          DROP                                   * 5D6E0
          psh                                    * 5D6E5
          OBJ_5D5B0                              * 5D6EA
          NOTcase                                * 5D6EF

swapB;B2[n]=>B1[1]:
          ::                                     * 5D6F4
            psh                                  * 5D6F9
            pullpsh1&                            * 5D6FE
          ;                                      * 5D703
          #1-                                    * 5D708
          tailpsh                                * 5D70D
          rotswap                                * 5D712
          top&                                   * 5D717
        ;                                        * 5D71C

* refs (2): 84152 8417A
OBJ_5D721:
        ::                                       * 5D721
          BINT2                                  * 5D726
          'R'R                                   * 5D72B
          OBJ_5D673                              * 5D730
          pargop                                 * 5D735
          2GETLAM                                * 5D73A
          MEQ1stcase                             * 5D73F
          overev&                                * 5D744
          1GETLAM                                * 5D749
          MEQ1stcase                             * 5D74E
          overev&                                * 5D753
          rot                                    * 5D758
          OBJ_5D5B0                              * 5D75D
          NOTcase                                * 5D762
          psh&                                   * 5D767
          SWAP#1+                                * 5D76C
          overev&                                * 5D771
          #1-SWAP                                * 5D776
          #1-                                    * 5D77B
          tailpsh                                * 5D780
          rotswap                                * 5D785
          top&                                   * 5D78A
        ;                                        * 5D78F

* refs (2): 5C6A5 5C6AF
OBJ_5D794:
        ::                                       * 5D794

* refs (1): 84148
OBJ_5D799:
          ::                                     * 5D799
            M1st+case                            * 5D79E
            ROMPTR  0F0 055                      * 5D7A3
            OBJ_5D2A2                            * 5D7AE
          ;                                      * 5D7B3
          rotswap                                * 5D7B8
          OBJ_5D664                              * 5D7BD
          x+                                     * 5D7C2
          x-                                     * 5D7C7

* refs (3): 5D827 84161 84189
OBJ_5D7CC:
          ::                                     * 5D7CC
            ABND                                 * 5D7D1
            rotswap                              * 5D7D6
            top&                                 * 5D7DB
            larg                                 * 5D7E0
          ;                                      * 5D7E5
        ;                                        * 5D7EA

* refs (2): 5C6B9 5C6C3
OBJ_5D7EF:
        ::                                       * 5D7EF

* refs (1): 84170
OBJ_5D7F4:
          ::                                     * 5D7F4
            M1st*case                            * 5D7F9
            ROMPTR  0F0 056                      * 5D7FE
            OBJ_5D519                            * 5D809
          ;                                      * 5D80E
          rotswap                                * 5D813
          OBJ_5D664                              * 5D818
          x*                                     * 5D81D
          x/                                     * 5D822
          OBJ_5D7CC                              * 5D827
        ;                                        * 5D82C

* refs (2): 84198 84251
OBJ_5D831:
        ::                                       * 5D831
          BINT2                                  * 5D836
          COLA                                   * 5D83B
          OBJ_5D863                              * 5D840
        ;                                        * 5D845

* refs (2): 8430A 843C3
OBJ_5D84A:
        ::                                       * 5D84A
          BINT1                                  * 5D84F
          COLA                                   * 5D854
          OBJ_5D863                              * 5D859
        ;                                        * 5D85E

* refs (2): 5D840 5D859
OBJ_5D863:
        ::                                       * 5D863
          'R'R                                   * 5D868
          OBJ_5D673                              * 5D86D
          rot                                    * 5D872
          OBJ_5D5B0                              * 5D877
          ABND                                   * 5D87C
          NOTcase                                * 5D881
          ::                                     * 5D886
            unrot                                * 5D88B
            FALSE                                * 5D890
          ;                                      * 5D895
          #1-                                    * 5D89A
          tailpsh                                * 5D89F
          psh                                    * 5D8A4
          over&                                  * 5D8A9
          over&                                  * 5D8AE
          psh                                    * 5D8B3
          larg                                   * 5D8B8
          TRUE                                   * 5D8BD
        ;                                        * 5D8C2

* refs (2): 841CF 84288
OBJ_5D8C7:
        ::                                       * 5D8C7
          RDUP                                   * 5D8CC
          'R'R                                   * 5D8D1
          RDROP                                  * 5D8D6
          4PICK                                  * 5D8DB
          EQ                                     * 5D8E0
          SWAP                                   * 5D8E5
          4PICK                                  * 5D8EA
          EQ                                     * 5D8EF
          SWAP                                   * 5D8F4
          OR                                     * 5D8F9
          case                                   * 5D8FE
          OBJ_5D926                              * 5D903
          RDROP                                  * 5D908
          1GETABND                               * 5D90D
          SWAP#1+                                * 5D912
          top&                                   * 5D917
          larg&                                  * 5D91C
        ;                                        * 5D921

* refs (1): 5D903
OBJ_5D926:
        ::                                       * 5D926
          BINT0                                  * 5D92B
          'R'R                                   * 5D930
          OBJ_5D673                              * 5D935
          pshzer                                 * 5D93A
          pshzer                                 * 5D93F
          BEGIN                                  * 5D944
          1GETLAM                                * 5D949
          3PICK                                  * 5D94E
          EQ                                     * 5D953
          2GETLAM                                * 5D958
          4PICK                                  * 5D95D
          EQ                                     * 5D962
          OR                                     * 5D967
          WHILE                                  * 5D96C
          ::                                     * 5D971
            overev&                              * 5D976
            pargop                               * 5D97B
          ;                                      * 5D980
          REPEAT                                 * 5D985
          pshtop&                                * 5D98A
          ABND                                   * 5D98F
        ;                                        * 5D994

* refs (2): 84341 843FA
OBJ_5D999:
        ::                                       * 5D999
          RDUP                                   * 5D99E
          'R'R                                   * 5D9A3
          RDROP                                  * 5D9A8
          4PICK                                  * 5D9AD
          EQ                                     * 5D9B2
          SWAP                                   * 5D9B7
          4PICK                                  * 5D9BC
          EQ                                     * 5D9C1
          SWAP                                   * 5D9C6
          OR                                     * 5D9CB
          case                                   * 5D9D0
          OBJ_5D9FD                              * 5D9D5
          psh                                    * 5D9DA
          RDROP                                  * 5D9DF
          1GETABND                               * 5D9E4
          SWAP#1+                                * 5D9E9
          top&                                   * 5D9EE
          larg&                                  * 5D9F3
        ;                                        * 5D9F8

* refs (1): 5D9D5
OBJ_5D9FD:
        ::                                       * 5D9FD
          BINT0                                  * 5DA02
          'R'R                                   * 5DA07
          OBJ_5D673                              * 5DA0C
          pshzer                                 * 5DA11
          pshzer                                 * 5DA16
          BEGIN                                  * 5DA1B
          1GETLAM                                * 5DA20
          3PICK                                  * 5DA25
          EQ                                     * 5DA2A
          2GETLAM                                * 5DA2F
          4PICK                                  * 5DA34
          EQ                                     * 5DA39
          OR                                     * 5DA3E
          WHILE                                  * 5DA43
          ::                                     * 5DA48
            overev&                              * 5DA4D
            #1-SWAP                              * 5DA52
            pshm1                                * 5DA57
          ;                                      * 5DA5C
          REPEAT                                 * 5DA61
          pshtop&                                * 5DA66
          ABND                                   * 5DA6B
        ;                                        * 5DA70

* refs (2): 841FC 8422E
OBJ_5DA75:
        ::                                       * 5DA75
          1GETLAM                                * 5DA7A
          '                                      * 5DA7F
          x+                                     * 5DA84
          EQ                                     * 5DA89
          ?SKIP                                  * 5DA8E
          [X]=>[NEG(X)]!                         * 5DA93
          pshtop&                                * 5DA98
          pargop                                 * 5DA9D
          meta+                                  * 5DAA2
          overev&                                * 5DAA7
          psh                                    * 5DAAC
          1GETABND                               * 5DAB1
          '                                      * 5DAB6
          x+                                     * 5DABB
          EQ                                     * 5DAC0
          ?SKIP                                  * 5DAC5
          addtNEG                                * 5DACA
        ;                                        * 5DACF

* refs (2): 842B5 842E7
OBJ_5DAD4:
        ::                                       * 5DAD4
          1GETLAM                                * 5DAD9
          '                                      * 5DADE
          x*                                     * 5DAE3
          EQ                                     * 5DAE8
          ?SKIP                                  * 5DAED
          [X]=>[INV(X)]!                         * 5DAF2
          pshtop&                                * 5DAF7
          pargop                                 * 5DAFC
          meta*                                  * 5DB01
          overev&                                * 5DB06
          psh                                    * 5DB0B
          1GETABND                               * 5DB10
          '                                      * 5DB15
          x*                                     * 5DB1A
          EQ                                     * 5DB1F
          ?SKIP                                  * 5DB24
          addtINV                                * 5DB29
        ;                                        * 5DB2E

* refs (2): 841AC 84265
OBJ_5DB33:
        ::                                       * 5DB33
          pargop                                 * 5DB38
          psh                                    * 5DB3D
          4roll                                  * 5DB42
          top&                                   * 5DB47
          unrot                                  * 5DB4C
        ;                                        * 5DB51

* refs (2): 8436E 843B4
OBJ_5DB56:
        ::                                       * 5DB56
          1GETABND                               * 5DB5B
          '                                      * 5DB60
          x+                                     * 5DB65
          EQ                                     * 5DB6A
          ?SKIP                                  * 5DB6F
          [X]=>[NEG(X)]!                         * 5DB74
          rot                                    * 5DB79
          dup                                    * 5DB7E
          rotswap                                * 5DB83
          BEGIN                                  * 5DB88
          DUP#0<>WHILE                           * 5DB8D
          ::                                     * 5DB92
            OVER                                 * 5DB97
            '                                    * 5DB9C
            x-                                   * 5DBA1
            EQ                                   * 5DBA6
            IT                                   * 5DBAB
            ::                                   * 5DBB0
              psh                                * 5DBB5
              [X]=>[NEG(X)]!                     * 5DBBA
              psh                                * 5DBBF
            ;                                    * 5DBC4
            SWAPDROP#1-                          * 5DBC9
          ;                                      * 5DBCE
          REPEAT                                 * 5DBD3
          DROP                                   * 5DBD8
          meta+                                  * 5DBDD
          psh                                    * 5DBE2
          over&                                  * 5DBE7
          over&                                  * 5DBEC
          rot                                    * 5DBF1
          top&                                   * 5DBF6
          psh                                    * 5DBFB
          larg                                   * 5DC00
        ;                                        * 5DC05

* refs (2): 84427 8446D
OBJ_5DC0A:
        ::                                       * 5DC0A
          1GETABND                               * 5DC0F
          '                                      * 5DC14
          x*                                     * 5DC19
          EQ                                     * 5DC1E
          ?SKIP                                  * 5DC23
          [X]=>[INV(X)]!                         * 5DC28
          rot                                    * 5DC2D
          dup                                    * 5DC32
          rotswap                                * 5DC37
          BEGIN                                  * 5DC3C
          DUP#0<>WHILE                           * 5DC41
          ::                                     * 5DC46
            OVER                                 * 5DC4B
            '                                    * 5DC50
            x/                                   * 5DC55
            EQ                                   * 5DC5A
            IT                                   * 5DC5F
            ::                                   * 5DC64
              psh                                * 5DC69
              [X]=>[INV(X)]!                     * 5DC6E
              psh                                * 5DC73
            ;                                    * 5DC78
            SWAPDROP#1-                          * 5DC7D
          ;                                      * 5DC82
          REPEAT                                 * 5DC87
          DROP                                   * 5DC8C
          meta*                                  * 5DC91
          psh                                    * 5DC96
          over&                                  * 5DC9B
          over&                                  * 5DCA0
          rot                                    * 5DCA5
          top&                                   * 5DCAA
          psh                                    * 5DCAF
          larg                                   * 5DCB4
        ;                                        * 5DCB9

* refs (2): 8431E 843D7
OBJ_5DCBE:
        ::                                       * 5DCBE
          #1-SWAP                                * 5DCC3
          BINT1                                  * 5DCC8
          4roll                                  * 5DCCD
          top&                                   * 5DCD2
          unrot                                  * 5DCD7
          larg                                   * 5DCDC
          over&                                  * 5DCE1
        ;                                        * 5DCE6

* refs (1): 5C835
OBJ_5DCEB:
        ::                                       * 5DCEB
          ROMPTR  0F0 062                        * 5DCF0
          rot                                    * 5DCFB
          top&                                   * 5DD00
          overev&                                * 5DD05
          top&                                   * 5DD0A
          meta-                                  * 5DD0F
        ;                                        * 5DD14

* refs (1): 5C83F
OBJ_5DD19:
        ::                                       * 5DD19
          ROMPTR  0F0 062                        * 5DD1E
          overev&                                * 5DD29
          top&                                   * 5DD2E
          pshtop&                                * 5DD33
          meta+                                  * 5DD38
        ;                                        * 5DD3D

* refs (3): 847F1 84869 84A99
{2,^,-,û,I}:
        {                                        * 5DD42
          %2                                     * 5DD47
          x^                                     * 5DD4C
          x-                                     * 5DD51
          xSQRT                                  * 5DD56
          xi                                     * 5DD5B
        }                                        * 5DD60

* meta1 meta2 -> meta1&ob meta2&ob
* refs (2): 846CF 84724
2psh1&rev::
        ::                                       * 5DD65
          'R                                     * 5DD6A
          SWAP#1+                                * 5DD6F
          OVER                                   * 5DD74
          psh1&rev                               * 5DD79
        ;                                        * 5DD7E

* refs (3): 5DDA6 8467A 846A7
Addi*[_]:
        ::                                       * 5DD83
          PTR     addt2:                         * 5DD88
          xi                                     * 5DD8D
          x*                                     * 5DD92
        ;                                        * 5DD97

* refs (3): 846C0 84715 84760
Addã180/*i[_]:
        ::                                       * 5DD9C
          Addã180/*[_]                           * 5DDA1
          Addi*[_]                               * 5DDA6
        ;                                        * 5DDAB

* refs (1): 5DDA1
Addã180/*[_]:
        ::                                       * 5DDB0
          RAD?                                   * 5DDB5
          ?SEMI                                  * 5DDBA
          PTR     addt:                          * 5DDBF
          xPI                                    * 5DDC4
          DEG?                                   * 5DDC9
          %180                                   * 5DDCE
          %200                                   * 5DDD3
          RPITE                                  * 5DDD8
          SWAP#1+                                * 5DDDD
          PTR     addt2:                         * 5DDE2
          x/                                     * 5DDE7
          x*                                     * 5DDEC
        ;                                        * 5DDF1

* refs (7): 84675 84823 848A0 84936 8494A 8498B ...
Add180ã/*[_]:
        ::                                       * 5DDF6
          RAD?                                   * 5DDFB
          ?SEMI                                  * 5DE00
          DEG?                                   * 5DE05
          %180                                   * 5DE0A
          %200                                   * 5DE0F
          RPITE                                  * 5DE14
          SWAP#1+                                * 5DE19

{PI,/,*}:
          {                                      * 5DE1E
            xPI                                  * 5DE23
            x/                                   * 5DE28
            x*                                   * 5DE2D
          }                                      * 5DE32
          INNERtop&                              * 5DE37
        ;                                        * 5DE3C

* -> T
* refs (3): 5D63C 634ED B978E
COLATRUE:
        ::                                       * 5DE41
          TRUE                                   * 5DE46
          RDROP                                  * 5DE4B
        ;                                        * 5DE50

* -> F
* refs (6): 2F646 5AD26 5D619 5D650 5FB53 635A6
RDROPFALSE:
        ::                                       * 5DE55
          FALSE                                  * 5DE5A
          RDROP                                  * 5DE5F
        ;                                        * 5DE64
        BSS     20                               * 5DE69

* 1..n #n -> n..1 #n
* refs (4): 45119 465B3 9FDBF C1E92
reversym:
        ::                                       * 5DE7D
          DUP#0=                                 * 5DE82
          ?SEMI                                  * 5DE87
          pshzer                                 * 5DE8C
          DUP#0_DO                               * 5DE91
          pullrev1&                              * 5DE96
          LOOP                                   * 5DE9B
          DROP                                   * 5DEA0
        ;                                        * 5DEA5

* refs (1): 58F85
dup;ex?:
        ::                                       * 5DEAA
          DUPTYPESYMB?                           * 5DEAF
        ;                                        * 5DEB4

* refs (1): 1F762
OBJ_5DEB9:
        ::                                       * 5DEB9
          OBJ_5DEEB                              * 5DEBE
          ARGNUMERR                              * 5DEC3
          INVFUNCERR                             * 5DEC8
        ;                                        * 5DECD

        ::                                       * 5DED2
          OBJ_5DEF7                              * 5DED7
          ARGNUMERR                              * 5DEDC
          INVFUNCERR                             * 5DEE1
        ;                                        * 5DEE6

* refs (1): 5DEBE
OBJ_5DEEB:
        CON(5)  (*)+5                            * 5DEEB  primitive code object
        ASSEMBLE
        ST=1    2                                * 5DEF0
        GOTO    L_5DEFF                          * 5DEF3

* refs (3): 56DDD 58E90 5DED7
OBJ_5DEF7:
        CON(5)  (*)+5                            * 5DEF7  primitive code object
        ST=0    2                                * 5DEFC
L_5DEFF:
        C=DAT1  A                                * 5DEFF
        CD1EX                                    * 5DF02
        RSTK=C                                   * 5DF05
        A=DAT1  15                               * 5DF07
        P=      10                               * 5DF0B
        LC(5)   xALG->                           * 5DF0D
        P=      5                                * 5DF14
        LC(5)   x<<                              * 5DF16
        P=      0                                * 5DF1D
        LC(5)   DOCOL                            * 5DF1F
        P=      14                               * 5DF26
        ?C=A    WP                               * 5DF28
        GOYES   L_5DF4A                          * 5DF2B
        ?ST=1   2                                * 5DF2D
        GOYES   L_5DF36                          * 5DF30
        GOTO    L_5DFC9                          * 5DF32
L_5DF36:
        P=      10                               * 5DF36
        LC(5)   xRPN->                           * 5DF38
        P=      14                               * 5DF3F
        ?C=A    WP                               * 5DF41
        GOYES   L_5DF4A                          * 5DF44
        GOTO    L_5DFC9                          * 5DF46
L_5DF4A:
        P=      0                                * 5DF4A
        C=0     A                                * 5DF4C
        R0=C                                     * 5DF4E
        D1=D1+  15                               * 5DF51
L_5DF54:
        A=DAT1  A                                * 5DF54
        LC(5)   DOSYMB                           * 5DF57
        ?C=A    A                                * 5DF5E
        GOYES   L_5DFDD                          * 5DF61
        LC(5)   x<<                              * 5DF63
        ?C=A    A                                * 5DF6A
        GOYES   L_5DFDD                          * 5DF6D
        LC(5)   DOLAM                            * 5DF6F
        ?C#A    A                                * 5DF76
        GOYES   L_5DF9B                          * 5DF79
        A=R0                                     * 5DF7B
        A=A+1   A                                * 5DF7E
        R0=A                                     * 5DF80
        A=0     A                                * 5DF83
        D1=D1+  5                                * 5DF85
        A=DAT1  B                                * 5DF88
        A=A+A   A                                * 5DF8B
        D1=D1+  2                                * 5DF8D
        CD1EX                                    * 5DF90
        C=C+A   A                                * 5DF93
        D1=C                                     * 5DF95
        GONC    L_5DF54                          * 5DF98
L_5DF9B:
        D1=D1+  5                                * 5DF9B
        AD1EX                                    * 5DF9E
        C=DAT1  A                                * 5DFA1
        D1=(5)  DOSYMB                           * 5DFA4
        AD1EX                                    * 5DFAB
        ?C=A    A                                * 5DFAE
        GOYES   L_5DFFB                          * 5DFB1
        A=R0                                     * 5DFB3
        A=A+1   A                                * 5DFB6
        R0=A                                     * 5DFB8
        A=C     A                                * 5DFBB
        LC(5)   DOLAM                            * 5DFBD
        ?C=A    A                                * 5DFC4
        GOYES   L_5DF54                          * 5DFC7
L_5DFC9:
        C=RSTK                                   * 5DFC9
        D1=C                                     * 5DFCB
L_5DFCE:
        P=      0                                * 5DFCE
        LC(5)   skipcola                         * 5DFD0
        A=C     A                                * 5DFD7
        PC=(A)                                   * 5DFD9
L_5DFDD:
        ?ST=1   2                                * 5DFDD
        GOYES   L_5DFFB                          * 5DFE0
        CD0EX                                    * 5DFE2
        CD1EX                                    * 5DFE5
        CD0EX                                    * 5DFE8
        GOSBVL  SKIPOB                           * 5DFEB
        CD0EX                                    * 5DFF2
        CD1EX                                    * 5DFF5
        CD0EX                                    * 5DFF8
L_5DFFB:
        P=      0                                * 5DFFB
        A=DAT1  10                               * 5DFFD
        C=RSTK                                   * 5E001
        D1=C                                     * 5E003
        ?ST=1   2                                * 5E006
        GOYES   L_5E024                          * 5E009
        P=      5                                * 5E00B
        LC(5)   SEMI                             * 5E00D
        P=      0                                * 5E014
        LC(5)   x>>                              * 5E016
        P=      9                                * 5E01D
        ?C#A    WP                               * 5E01F
        GOYES   L_5DFCE                          * 5E022
L_5E024:
        P=      0                                * 5E024
        LC(5)   TEMPENV                          * 5E026
        CD1EX                                    * 5E02D
        A=DAT1  A                                * 5E030
        D1=A                                     * 5E033
        D1=D1+  15                               * 5E036
        A=DAT1  A                                * 5E039
        D1=A                                     * 5E03C
        D1=D1+  5                                * 5E03F
        A=DAT1  A                                * 5E042
        D1=C                                     * 5E045
        C=R0                                     * 5E048
        ?C#A    A                                * 5E04B
        GOYES   L_5E05A                          * 5E04E
        LC(5)   OBJ_22F3B                        * 5E050
        GONC    L_5E061                          * 5E057
L_5E05A:
        LC(5)   COLA                             * 5E05A
L_5E061:
        A=C     A                                * 5E061
        PC=(A)                                   * 5E063
        RPL

* sym -> meta ob -> ob #1
* refs (24): 1F547 1F8D4 2812E 547BF 54986 54E02 ...
SINNER:
        ::                                       * 5E067
          DUPTYPESYMB?                           * 5E06C
          ITE                                    * 5E071
          INNERCOMP                              * 5E076
          BINT1                                  * 5E07B
        ;                                        * 5E080

* meta -> ob
* refs (22): 1CF4C 1CF56 1CF65 1F54C 1F91A 27652 ...
CKSYMBN:
        ::                                       * 5E085
          BINT1                                  * 5E08A
          OVER#=case                             * 5E08F
          DROPSYM                                * 5E094
          SYMBN                                  * 5E099
        ;                                        * 5E09E

* ob1..obn #n -> sym
* refs (3): 0F133 27657 282C3
PSYMBN:
        ::                                       * 5E0A3
          ERRSET                                 * 5E0A8
          SYMBN                                  * 5E0AD
          ERRTRAP                                * 5E0B2
          OBJ_5E0C1                              * 5E0B7
        ;                                        * 5E0BC

* refs (1): 5E0B7
OBJ_5E0C1:
        ::                                       * 5E0C1
          NULLSYMB                               * 5E0C6
          COLA                                   * 5E0CB
          prepend(_,s,cp)                        * 5E0D0
        ;                                        * 5E0D5

* ob1..obn #n -> {}
* refs (7): 216C9 23EF7 24212 24AB0 24D5C 252FF ...
P{}N:
        ::                                       * 5E0DA
          ERRSET                                 * 5E0DF
          {}N                                    * 5E0E4
          ERRTRAP                                * 5E0E9
          OBJ_5E0F8                              * 5E0EE
        ;                                        * 5E0F3

* refs (1): 5E0EE
OBJ_5E0F8:
        ::                                       * 5E0F8
          NULL{}                                 * 5E0FD
          COLA                                   * 5E102
          prepend(_,s,cp)                        * 5E107
        ;                                        * 5E10C

* ob1..obn #n -> seco
* refs (3): 252A5 252BE 252E6
P::N:
        ::                                       * 5E111
          ERRSET                                 * 5E116
          ::N                                    * 5E11B
          ERRTRAP                                * 5E120
          OBJ_5E12F                              * 5E125
        ;                                        * 5E12A

* refs (1): 5E125
OBJ_5E12F:
        ::                                       * 5E12F
          PTR     NULL::                         * 5E134
          COLA                                   * 5E139
          prepend(_,s,cp)                        * 5E13E
        ;                                        * 5E143

* refs (3): 5E0D0 5E107 5E13E
prepend(_,s,cp):
        ::                                       * 5E148
          ERRORCLR                               * 5E14D
          OVER                                   * 5E152
          #0=case                                * 5E157
          SWAPDROP                               * 5E15C
          TOTEMPSWAP                             * 5E161
          ZERO_DO                                * 5E166
          SWAP                                   * 5E16B
          prepend(cp,_)                          * 5E170
          LOOP                                   * 5E175
        ;                                        * 5E17A

* refs (1): 5E170
prepend(cp,_):
        ::                                       * 5E17F
          FREEINTEMP?                            * 5E184
          NOTcase                                * 5E189
          OBJ_5E1B1                              * 5E18E
          >TOPTEMP                               * 5E193
          SWAP                                   * 5E198
          >TOPTEMP                               * 5E19D
          SWAP                                   * 5E1A2
          OBJ_5E1E3                              * 5E1A7
        ;                                        * 5E1AC

* refs (1): 5E18E
OBJ_5E1B1:
        ::                                       * 5E1B1
          INHARDROM?                             * 5E1B6
          case                                   * 5E1BB
          OBJ_5E29C                              * 5E1C0
          TOTEMPOB                               * 5E1C5
          SWAP                                   * 5E1CA
          >TOPTEMP                               * 5E1CF
          SWAP                                   * 5E1D4
          OBJ_5E1E3                              * 5E1D9
        ;                                        * 5E1DE

* refs (2): 5E1A7 5E1D9
OBJ_5E1E3:
        CON(5)  (*)+5                            * 5E1E3  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 5E1E8
        D=D+1   A                                * 5E1EB
        GOSBVL  SAVPTR                           * 5E1ED
        A=DAT1  A                                * 5E1F4
        D0=A                                     * 5E1F7
        A=A+CON A,5                              * 5E1FA
        DAT1=A  A                                * 5E200
        A=DAT0  A                                * 5E203
        R0=A.F  A                                * 5E206
        D0=D0-  6                                * 5E20C
        A=DAT0  A                                * 5E20F
        A=A-CON A,6                              * 5E212
        R1=A.F  A                                * 5E218
        D0=D0+  6                                * 5E21E
        CD0EX                                    * 5E221
        D0=C                                     * 5E224
        R2=C.F  A                                * 5E227
        GOSBVL  SKIPOB                           * 5E22D
        A=DAT0  A                                * 5E234
        C=R1.F  A                                * 5E237
        A=A+C   A                                * 5E23D
        DAT0=A  A                                * 5E23F
        A=R2.F  A                                * 5E242
        A=A+CON A,5                              * 5E248
        LC(5)   #0000B                           * 5E24E
        GOSBVL  MOVERSD                          * 5E255
        A=R1.F  A                                * 5E25C
        ABEX    A                                * 5E262
        A=A-B   A                                * 5E264
        LC(5)   #00005                           * 5E266
        GOSBVL  MOVERSU                          * 5E26D
        A=B     A                                * 5E274
        D0=A                                     * 5E276
        C=R0.F  A                                * 5E279
        DAT0=C  A                                * 5E27F
        LC(5)   DSKTOP                           * 5E282
        CD0EX                                    * 5E289
        A=DAT0  A                                * 5E28C
        D0=A                                     * 5E28F
        DAT0=C  A                                * 5E292
        GOVLNG  GETPTRLOOP                       * 5E295

* refs (1): 5E1C0
OBJ_5E29C:
        CON(5)  (*)+5                            * 5E29C  primitive code object
        A=DAT1  A                                * 5E2A1
        R0=A.F  A                                * 5E2A4
        D1=D1+  5                                * 5E2AA
        D=D+1   A                                * 5E2AD
        GOSBVL  SAVPTR                           * 5E2AF
        A=DAT1  A                                * 5E2B6
        A=A+CON A,5                              * 5E2B9
        LC(5)   #00005                           * 5E2BF
        GOSBVL  MOVERSU                          * 5E2C6
        C=B     A                                * 5E2CD
        D0=C                                     * 5E2CF
        C=R0.F  A                                * 5E2D2
        DAT0=C  A                                * 5E2D8
        D0=D0-  5                                * 5E2DB
        GOSBVL  SKIPOB                           * 5E2DE
        C=DAT0  A                                * 5E2E5
        C=C+CON A,5                              * 5E2E8
        DAT0=C  A                                * 5E2EE
        GOVLNG  GETPTRLOOP                       * 5E2F1
        RPL

* ob1 ob2 -> meta
* refs (8): 85D3B 85D8B 8AE28 8AE80 8AF5B 8B004 ...
2SINNERtop&:
        ::                                       * 5E2F8
          2SINNER                                * 5E2FD
          top&                                   * 5E302
        ;                                        * 5E307

* ob1 ob2 -> meta1 meta2
* refs (5): 55832 5595E 5E2FD 86957 869C5
2SINNER:
        ::                                       * 5E30C
          SWAP                                   * 5E311
          SINNER                                 * 5E316
          get1                                   * 5E31B
          SINNER                                 * 5E320
        ;                                        * 5E325

* meta -> meta'
* refs (4): 1F72B 5AC18 70077 72FB6
SINNERMETA:
        ::                                       * 5E32A
          BINT0                                  * 5E32F
          DUPUNROT                               * 5E334
          DO                                     * 5E339
          get1                                   * 5E33E
          SINNER                                 * 5E343
          psh                                    * 5E348
          top&                                   * 5E34D
          LOOP                                   * 5E352
        ;                                        * 5E357

* meta -> meta meta
* refs (62): 1F6F9 28075 28250 558D2 56EFA 5704F ...
dup:
        ::                                       * 5E35C
          DUP#1+                                 * 5E361
          NDUP                                   * 5E366
        ;                                        * 5E36B

* ob #n -> ob..ob #n ob #0 -> #0
* refs (18): 19A2F 272BE 28B64 4A883 4C9C9 58068 ...
NDUPN:
        ::                                       * 5E370
          DUP#0=case                             * 5E375
          SWAPDROP                               * 5E37A
          DUP                                    * 5E37F
          #1-                                    * 5E384
          DUP#0=case                             * 5E389
          DROP                                   * 5E38E
          ZERO_DO                                * 5E393
          OVER                                   * 5E398
          SWAP                                   * 5E39D
          LOOP                                   * 5E3A2
        ;                                        * 5E3A7

* meta1 meta2 meta3 -> meta1&meta3 meta2
* refs (20): 24BC9 29462 2947B 2948A 5AB5F 5AB8C ...
psh&:
        ::                                       * 5E3AC
          psh                                    * 5E3B1
          over&                                  * 5E3B6
        ;                                        * 5E3BB

* meta1 meta2 meta3 -> meta1&meta2 meta3
* refs (42): 24B5C 27AA3 29700 547A1 57A84 57CC1 ...
over&:
        ::                                       * 5E3C0
          get1                                   * 5E3C5
          2DUP#+                                 * 5E3CA
          #3+                                    * 5E3CF
          ROLL                                   * 5E3D4
          #+OVER                                 * 5E3D9
          #2+UNROLL                              * 5E3DE
        ;                                        * 5E3E3

* meta ob -> ob #1 meta
* refs (74): 0B697 1CF51 1F461 1F906 21BB6 24D52 ...
pshm1:
        ::                                       * 5E3E8
          OVER#2+UNROL                           * 5E3ED
          BINT1                                  * 5E3F2
          OVER#2+UNROL                           * 5E3F7
        ;                                        * 5E3FC

* meta ob -> ob&meta
* refs (1): 1F4CF
psh1top&:
        ::                                       * 5E401
          OVER#2+UNROL                           * 5E406
          #1+                                    * 5E40B
        ;                                        * 5E410

* meta1 meta2 -> meta1&meta2
* refs (177): 1F466 24271 24D57 24DED 27C56 27C60 ...
top&:
        CON(5)  (*)+5                            * 5E415  primitive code object
        ASSEMBLE
        D1=D1+  10                               * 5E41A
        D=D+1   A                                * 5E41D
        D=D+1   A                                * 5E41F
        GOSBVL  SAVPTR                           * 5E421
        D1=D1-  10                               * 5E428
        C=DAT1  A                                * 5E42B
        CD1EX                                    * 5E42E
        D1=D1+  5                                * 5E431
        A=DAT1  A                                * 5E434
        D1=C                                     * 5E437
        R0=A                                     * 5E43A
        A=A+1   A                                * 5E43D
        C=A     A                                * 5E43F
        C=C+C   A                                * 5E441
        C=C+C   A                                * 5E443
        C=C+A   A                                * 5E445
        AD1EX                                    * 5E447
        A=A+C   A                                * 5E44A
        D1=A                                     * 5E44C
        D0=A                                     * 5E44F
        A=DAT0  A                                * 5E452
        AD0EX                                    * 5E455
        D0=D0+  5                                * 5E458
        A=DAT0  A                                * 5E45B
        R1=A                                     * 5E45E
        AD1EX                                    * 5E461
        D1=A                                     * 5E464
        D0=A                                     * 5E467
        D1=D1+  5                                * 5E46A
        GOSBVL  MOVEUP                           * 5E46D
        A=R0                                     * 5E474
        C=R1                                     * 5E477
        C=C+A   A                                * 5E47A
        R0=C                                     * 5E47C
        GOSBVL  PUSH#                            * 5E47F
        A=DAT0  A                                * 5E486
        D0=D0+  5                                * 5E489
        PC=(A)                                   * 5E48C
        RPL

* meta1 meta2 meta3 -> meta1&meta2&meta3
* refs (6): 582FA 7DC4A 85F11 8632B 863C6 86650
2top&:
        ::                                       * 5E490
          top&                                   * 5E495
          COLA                                   * 5E49A
          top&                                   * 5E49F
        ;                                        * 5E4A4

* ob # -> #-1 ob
* refs (111): 0B6BA 105D6 1F493 1F4A7 1F712 21B93 ...
#1-SWAP:
        ::                                       * 5E4A9
          #1-                                    * 5E4AE
          SWAP                                   * 5E4B3
        ;                                        * 5E4B8

* ob&meta -> meta ob
* refs (15): 0221E 097FA 0B6A1 1F443 1F60F 28DEE ...
pullrev:
        ::                                       * 5E4BD
          #1-                                    * 5E4C2
          get1                                   * 5E4C7
        ;                                        * 5E4CC

* meta1 meta2 -> meta2&meta1
* refs (124): 1F730 296F1 55986 56110 561EC 56200 ...
pshtop&:
        ::                                       * 5E4D1
          psh                                    * 5E4D6
          COLA                                   * 5E4DB
          top&                                   * 5E4E0
        ;                                        * 5E4E5

* meta1 meta2&ob -> ob&meta1 meta2
* refs (24): 1F3C2 24DE8 29005 548B4 57C7B 58A52 ...
pullpsh1&:
        ::                                       * 5E4EA
          #1-                                    * 5E4EF
          SWAPCOLA                               * 5E4F4
          psh1&                                  * 5E4F9
        ;                                        * 5E4FE

* meta1 meta2&ob -> meta1&ob meta2
* refs (11): 27AF8 27F85 57E35 57E62 586ED 587F0 ...
pullrev1&:
        ::                                       * 5E503
          #1-                                    * 5E508
          SWAPCOLA                               * 5E50D
          psh1&rev                               * 5E512
        ;                                        * 5E517

* meta -> meta&ob
* refs (74): 23ABF 23ACE 23EB1 28EBB 54644 548E1 ...
addt::
        ::                                       * 5E51C
          'R                                     * 5E521
          SWAP#1+                                * 5E526
        ;                                        * 5E52B

* meta -> meta&ob1&ob2
* refs (42): 28255 28269 57838 57CE4 582FF 58A7F ...
addt2::
        ::                                       * 5E530
          'R'R                                   * 5E535
          ROT                                    * 5E53A
          #2+                                    * 5E53F
        ;                                        * 5E544

* meta1 meta2 -> meta1&ob meta2
* refs (6): 58809 58831 5887C 588EF 58944 589A3
psh1&rev::
        ::                                       * 5E549
          'R                                     * 5E54E
          COLA                                   * 5E553
          psh1&rev                               * 5E558
        ;                                        * 5E55D

* meta1 meta2 -> meta1&ob1&ob2 meta2
* refs (1): 589F3
psh1&rev2::
        ::                                       * 5E562
          'R                                     * 5E567
          psh1&rev                               * 5E56C
          'R                                     * 5E571
          COLA                                   * 5E576
          psh1&rev                               * 5E57B
        ;                                        * 5E580

* obn..ob1 #n comp -> obm..ob1 #m
* refs (44): 281EC 56C68 56CC7 59084 59937 5AB50 ...
INNERtop&:
        ::                                       * 5E585
          INNERCOMP                              * 5E58A
          COLA                                   * 5E58F
          top&                                   * 5E594
        ;                                        * 5E599

* meta&ob -> meta&ob'
* refs (5): 5BCC6 5BCF3 83C0D 83E4C 83EB5
repl::
        ::                                       * 5E59E
          SWAPDROP                               * 5E5A3
          'R                                     * 5E5A8
          SWAP                                   * 5E5AD
        ;                                        * 5E5B2

* ROMPTR -> ob F -> ROMPTR T ob -> ob T
* refs (7): 1F677 54AB5 56DA1 58E63 58F5D 59171 ...
ROMPTR@NOT:
        ::                                       * 5E5B7
          CK&DISPATCH0                           * 5E5BC
          BINT6                                  * 5E5C1
          SAFE@NOT                               * 5E5C6
          BINT7                                  * 5E5CB
          LISTRCL                                * 5E5D0
          BINT15                                 * 5E5D5
          UnKnown(xn)?                           * 5E5DA
          BINT0                                  * 5E5DF
          TRUE                                   * 5E5E4
        ;                                        * 5E5E9

* id -> ob F -> T
* refs (1): 5E5C6
SAFE@NOT:
        ::                                       * 5E5EE
          OBJ_5E62A                              * 5E5F3
          SAFE@                                  * 5E5F8
        ;                                        * 5E5FD

* {path id} -> ob -> lam T
* refs (1): 5E5D0
LISTRCL:
        ::                                       * 5E602
          OBJ_5E62A                              * 5E607
          undo                                   * 5E60C
        ;                                        * 5E611

* refs (1): 5E5DA
UnKnown(xn)?:
        ::                                       * 5E616
          OBJ_5E62A                              * 5E61B
          ROMPTR@                                * 5E620
        ;                                        * 5E625

* refs (3): 5E5F3 5E607 5E61B
OBJ_5E62A:
        ::                                       * 5E62A
          DUP                                    * 5E62F
          'R                                     * 5E634
          EVAL                                   * 5E639
          NOTcaseTRUE                            * 5E63E
          SWAPDROP                               * 5E643
          FALSE                                  * 5E648
        ;                                        * 5E64D

* ob -> ob'
* refs (54): 1CFD5 1F206 1F45C 1F4AC 1F4CA 1F58A ...
symcomp:
        ::                                       * 5E652
          DUPTYPESYMB?                           * 5E657
          ?SKIP                                  * 5E65C

* ob1..obn #n -> symb
* refs (1): 594EF
ONESYMBN:
          ::                                     * 5E661
            BINT1                                * 5E666
            SYMBN                                * 5E66B
          ;                                      * 5E670
        ;                                        * 5E675

* meta -> #0 meta
* refs (45): 1F47F 1F90B 21BCA 245A0 27396 28FBA ...
pshzer:
        ::                                       * 5E67A
          BINT0                                  * 5E67F
          OVER#2+UNROL                           * 5E684
        ;                                        * 5E689

* meta -> M_last&op M_rest
* refs (25): 5A441 5B6F9 5BC08 5BC26 5CA1E 5CA37 ...
pargop:
        ::                                       * 5E68E
          #1-SWAP                                * 5E693
          OBJ_5E889                              * 5E698
          ROT                                    * 5E69D
          #1+SWAP                                * 5E6A2
          DUP#0=case                             * 5E6A7
          psh                                    * 5E6AC
          BINT1                                  * 5E6B1
          #=casedrop                             * 5E6B6

* meta&ob -> ob #1 meta
pullpshm1:
          ::                                     * 5E6BB
            #1-SWAP                              * 5E6C0
            pshm1                                * 5E6C5
          ;                                      * 5E6CA
          #1-                                    * 5E6CF
          BINT3                                  * 5E6D4
          SWAP                                   * 5E6D9
          splitup                                * 5E6DE
          #1-                                    * 5E6E3
          tailpsh                                * 5E6E8
        ;                                        * 5E6ED

* meta1 meta2 -> meta1&M_last M_rest
* refs (8): 28246 57031 57E8F 580E5 58675 586DE ...
parg&:
        ::                                       * 5E6F2
          pshzerpsharg                           * 5E6F7
          overev&                                * 5E6FC
        ;                                        * 5E701

* meta1 meta2 ob -> ob&meta1 meta2
* refs (47): 0B6A6 1F4A2 1F4B6 1F91F 21C2E 24258 ...
psh1&:
        CON(5)  (*)+5                            * 5E706  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 5E70B
        C=DAT1  A                                * 5E712
        RSTK=C                                   * 5E715
        CD1EX                                    * 5E717
        RSTK=C                                   * 5E71A
        D1=C                                     * 5E71C
        D1=D1+  5                                * 5E71F
        C=DAT1  A                                * 5E722
        CD1EX                                    * 5E725
        D1=D1+  5                                * 5E728
        D0=C                                     * 5E72B
        C=DAT1  A                                * 5E72E
        C=C+1   A                                * 5E731
        A=C     A                                * 5E733
        C=C+C   A                                * 5E735
        C=C+C   A                                * 5E737
        C=C+A   A                                * 5E739
        R1=C                                     * 5E73B
        AD0EX                                    * 5E73E
        D0=A                                     * 5E741
        C=C+A   A                                * 5E744
        D1=C                                     * 5E746
        C=DAT1  A                                * 5E749
        CD1EX                                    * 5E74C
        D1=D1+  5                                * 5E74F
        A=DAT1  A                                * 5E752
        D1=C                                     * 5E755
        A=A+1   A                                * 5E758
        R0=A                                     * 5E75A
        C=A     A                                * 5E75D
        A=A+A   A                                * 5E75F
        A=A+A   A                                * 5E761
        A=A+C   A                                * 5E763
        C=RSTK                                   * 5E765
        D1=C                                     * 5E767
        C=R1                                     * 5E76A
        C=C+A   A                                * 5E76D
        GOSBVL  MOVEDOWN                         * 5E76F
        C=RSTK                                   * 5E776
        DAT1=C  A                                * 5E778
        GOSBVL  PUSH#                            * 5E77B
        A=DAT1  A                                * 5E782
        D1=D1+  5                                * 5E785
        D=D+1   A                                * 5E788
        AD1EX                                    * 5E78A
        C=R1                                     * 5E78D
        C=C+A   A                                * 5E790
        CD1EX                                    * 5E792
        DAT1=C  A                                * 5E795
        D1=A                                     * 5E798
        A=DAT0  A                                * 5E79B
        D0=D0+  5                                * 5E79E
        PC=(A)                                   * 5E7A1

* meta1 meta2 ob -> ob&meta1 meta2
* refs (46): 294B7 29511 29570 3F48D 3F5D9 450D8 ...
psh1&rev:
        CON(5)  (*)+5                            * 5E7A5  primitive code object
        GOSBVL  SAVPTR                           * 5E7AA
        C=DAT1  A                                * 5E7B1
        RSTK=C                                   * 5E7B4
        CD1EX                                    * 5E7B6
        RSTK=C                                   * 5E7B9
        D1=C                                     * 5E7BB
        D1=D1+  5                                * 5E7BE
        C=DAT1  A                                * 5E7C1
        CD1EX                                    * 5E7C4
        D1=D1+  5                                * 5E7C7
        D0=C                                     * 5E7CA
        C=DAT1  A                                * 5E7CD
        C=C+1   A                                * 5E7D0
        A=C     A                                * 5E7D2
        C=C+C   A                                * 5E7D4
        C=C+C   A                                * 5E7D6
        C=C+A   A                                * 5E7D8
        R1=C                                     * 5E7DA
        AD0EX                                    * 5E7DD
        D0=A                                     * 5E7E0
        C=C+A   A                                * 5E7E3
        D1=C                                     * 5E7E5
        C=DAT1  A                                * 5E7E8
        CD1EX                                    * 5E7EB
        D1=D1+  5                                * 5E7EE
        A=DAT1  A                                * 5E7F1
        D1=C                                     * 5E7F4
        A=A+1   A                                * 5E7F7
        R0=A                                     * 5E7F9
        C=RSTK                                   * 5E7FC
        D1=C                                     * 5E7FE
        LC(5)   #00005                           * 5E801
        A=R1                                     * 5E808
        C=C+A   A                                * 5E80B
        GOSBVL  MOVEDOWN                         * 5E80D
        C=RSTK                                   * 5E814
        DAT1=C  A                                * 5E816
        GOSBVL  PUSH#                            * 5E819
        A=DAT1  A                                * 5E820
        D1=D1+  5                                * 5E823
        D=D+1   A                                * 5E826
        AD1EX                                    * 5E828
        C=R1                                     * 5E82B
        C=C+A   A                                * 5E82E
        CD1EX                                    * 5E830
        DAT1=C  A                                * 5E833
        D1=A                                     * 5E836
        A=DAT0  A                                * 5E839
        D0=D0+  5                                * 5E83C
        PC=(A)                                   * 5E83F
        RPL

* meta1 meta2 meta3 -> meta2&meta1 meta3
* refs (18): 5494A 57CC6 5CBE0 5CBE5 5D744 5D753 ...
overev&:
        ::                                       * 5E843
          rotswap                                * 5E848
          over&                                  * 5E84D
        ;                                        * 5E852

* meta1 meta2 meta3 -> meta2 meta1 meta3
* refs (34): 27FD5 28995 58031 58269 586BB 58AC5 ...
rotswap:
        ::                                       * 5E857
          rot                                    * 5E85C
          COLA                                   * 5E861
          psh                                    * 5E866
        ;                                        * 5E86B

* meta1 meta2 meta3 meta4 -> meta2 meta1 meta3 meta4
4rollunrot:
        ::                                       * 5E870
          4roll                                  * 5E875
          COLA                                   * 5E87A
          unrot                                  * 5E87F
        ;                                        * 5E884

* refs (1): 5E698
OBJ_5E889:
        ::                                       * 5E889
          nonopcase                              * 5E88E
          BINT0                                  * 5E893
          REQcase                                * 5E898
          xFCNAPPLY                              * 5E89D

* refs (1): 21A12
3pick;2+(s):
          ::                                     * 5E8A2
            3PICK                                * 5E8A7
            #2+                                  * 5E8AC
          ;                                      * 5E8B1
          infarg?                                * 5E8B6
          case                                   * 5E8BB

* refs (3): 6D299 8F145 8F2AF
3pick;1+(s):
          ::                                     * 5E8C0
            3PICK                                * 5E8C5
            #1+                                  * 5E8CA
          ;                                      * 5E8CF
          argum                                  * 5E8D4
        ;                                        * 5E8D9

* seco -> seco #args
* refs (3): 54B87 5E8D4 60071
argum:
        ::                                       * 5E8DE
          TRUE                                   * 5E8E3
          OBJ_5E8F2                              * 5E8E8
        ;                                        * 5E8ED

* refs (1): 5E8E8
OBJ_5E8F2:
        CON(5)  (*)+5                            * 5E8F2  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 5E8F7
        C=DAT1  A                                * 5E8FA
        CD1EX                                    * 5E8FD
        D1=D1+  5                                * 5E900
        A=DAT1  A                                * 5E903
        D1=C                                     * 5E906
        C=0     S                                * 5E909
        LC(5)   CK0                              * 5E90C
        ?C=A    A                                * 5E913
        GOYES   L_5E957                          * 5E916
        LC(5)   CK1&Dispatch                     * 5E918
        C=C+1   S                                * 5E91F
        ?C=A    A                                * 5E922
        GOYES   L_5E957                          * 5E925
        LC(5)   CK2&Dispatch                     * 5E927
        C=C+1   S                                * 5E92E
        ?C=A    A                                * 5E931
        GOYES   L_5E957                          * 5E934
        LC(5)   CK3&Dispatch                     * 5E936
        C=C+1   S                                * 5E93D
        ?C=A    A                                * 5E940
        GOYES   L_5E957                          * 5E943
        LC(5)   CK4&Dispatch                     * 5E945
        C=C+1   S                                * 5E94C
        ?C=A    A                                * 5E94F
        GOYES   L_5E957                          * 5E952
        C=C+1   S                                * 5E954
L_5E957:
        C=0     A                                * 5E957
        P=C     15                               * 5E959
        CPEX    0                                * 5E95D
        C=C+C   A                                * 5E961
        A=C     A                                * 5E963
        A=A+A   A                                * 5E965
        A=A+A   A                                * 5E967
        A=A+C   A                                * 5E969
        LC(5)   BINT0                            * 5E96B
        C=C+A   A                                * 5E972
        D1=D1-  5                                * 5E974
        DAT1=C  A                                * 5E977
        A=DAT0  A                                * 5E97A
        D0=D0+  5                                * 5E97D
        PC=(A)                                   * 5E980
        RPL

* seco -> :: seco <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (7): 5736A 58D3E 58DF5 59FD7 5E88E 5F334 ...
nonopcase:
        ::                                       * 5E984
          CK&DISPATCH0                           * 5E989
          BINT8                                  * 5E98E
          SKIP                                   * 5E993
          BINT0                                  * 5E998
          COLA                                   * 5E99D
        ;                                        * 5E9A2

* seco -> seco flag
* refs (10): 548A0 54B5F 56D5B 59FE1 5B6B8 5E8B6 ...
infarg?:
        CON(5)  (*)+5                            * 5E9A7  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 5E9AC
        CD1EX                                    * 5E9AF
        D1=D1+  5                                * 5E9B2
        A=DAT1  A                                * 5E9B5
        D1=C                                     * 5E9B8
        LC(5)   CKINFARGS                        * 5E9BB
        ?C#A    A                                * 5E9C2
        GOYES   L_5E9D4                          * 5E9C5
        LC(5)   TRUE                             * 5E9C7
        A=C     A                                * 5E9CE
        PC=(A)                                   * 5E9D0
L_5E9D4:
        LC(5)   FALSE                            * 5E9D4
        A=C     A                                * 5E9DB
        PC=(A)                                   * 5E9DD
        RPL

* refs (3): 573D3 5F451 5F6D4
OBJ_5E9E1:
        ::                                       * 5E9E1
          OBJ_26BED                              * 5E9E6
          NOTcase                                * 5E9EB
          SETROMPERR                             * 5E9F0
          ROTROT2DROP                            * 5E9F5
          MINUSONE                               * 5E9FA
          #=                                     * 5E9FF
        ;                                        * 5EA04

* ->
* refs (5): 1F3F8 1F5CA 28526 5E9BB 5F850
CKINFARGS:
        ::                                       * 5EA09
          'RSAVEWORD                             * 5EA0E
          ::                                     * 5EA13
            DEPTH                                * 5EA18
            OVER                                 * 5EA1D
            #1+                                  * 5EA22
            #<case                               * 5EA27
            SETSTACKERR                          * 5EA2C
            OBJ_5EA40                            * 5EA31
          ;                                      * 5EA36
        ;                                        * 5EA3B

* refs (1): 5EA31
OBJ_5EA40:
        ::                                       * 5EA40
          dup                                    * 5EA45
          P{}N                                   * 5EA4A
          OVER                                   * 5EA4F
          #2+                                    * 5EA54
          UNROLL                                 * 5EA59
          NDROP                                  * 5EA5E
          CK1NOLASTWD                            * 5EA63
          INNERCOMP                              * 5EA68
        ;                                        * 5EA6D

* refs (5): 54CE0 54D17 54D3A 54D5D 54D80
OBJ_5EA72:
        ::                                       * 5EA72
          NOTCONST?                              * 5EA77
          NOTcase                                * 5EA7C
          COLA                                   * 5EA81
          NOTNUM?                                * 5EA86
          case                                   * 5EA8B
          SKIP                                   * 5EA90
          COLACOLA                               * 5EA95
        ;                                        * 5EA9A

* meta -> M_last M_rest
* refs (49): 28241 54E34 562AA 57C80 57F55 586C0 ...
pshzerpsharg:
        ::                                       * 5EA9F
          BINT2                                  * 5EAA4
          BINT1                                  * 5EAA9
          splitup                                * 5EAAE
          #1-                                    * 5EAB3
          tailpsh                                * 5EAB8
        ;                                        * 5EABD

* meta -> M_rest M_last
* refs (55): 1F915 28070 2808E 282BE 28990 54936 ...
larg:
        ::                                       * 5EAC2
          BINT2                                  * 5EAC7
          BINT1                                  * 5EACC
          splitup                                * 5EAD1
          #2-                                    * 5EAD6
          2DUP                                   * 5EADB
          #-                                     * 5EAE0
          ROTDROP                                * 5EAE5
          OVER#2+UNROL                           * 5EAEA
        ;                                        * 5EAEF

* ob # -> #-1
* refs (110): 1011E 1F8E3 28007 28089 28192 281FB ...
SWAPDROP#1-:
        ::                                       * 5EAF4
          SWAPDROP                               * 5EAF9
          #1-                                    * 5EAFE
        ;                                        * 5EB03

* refs (3): 57BCC 57C17 57C44
delB[1-2]:
        ::                                       * 5EB08
          #2-                                    * 5EB0D
          ROTROT2DROP                            * 5EB12
        ;                                        * 5EB17

* meta1 meta2 -> meta2 meta1
* refs (206): 0F7A6 0F7FB 0F832 0F85A 0F8C3 0F8DC ...
psh:
        CON(5)  (*)+5                            * 5EB1C  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 5EB21
        AD1EX                                    * 5EB28
        D0=A                                     * 5EB2B
        D1=A                                     * 5EB2E
        C=0     A                                * 5EB31
        GOSUB   SUB_5EC10                        * 5EB33
        CAEX    A                                * 5EB37
        D=C     A                                * 5EB39
        CAEX    A                                * 5EB3B
        GOSUB   SUB_5EC10                        * 5EB3D
        B=A     A                                * 5EB41
        GOSUB   SUB_5EC41                        * 5EB43
        GOSBVL  GETPTR                           * 5EB47
        A=DAT0  A                                * 5EB4E
        D0=D0+  5                                * 5EB51
        PC=(A)                                   * 5EB54

* meta1 meta2 meta3 -> meta2 meta3 meta1
* refs (62): 0F7F1 0F800 0F9F4 0FA03 0FA08 21BF7 ...
rot:
        CON(5)  (*)+5                            * 5EB58  primitive code object
        A=0     A                                * 5EB5D
        A=A+1   A                                * 5EB5F
        C=0     A                                * 5EB61
        NOP4                                     * 5EB63
L_5EB67:
        R0=A.F  A                                * 5EB67
        R1=C.F  A                                * 5EB6D
        GOSBVL  SAVPTR                           * 5EB73
        AD1EX                                    * 5EB7A
        D1=A                                     * 5EB7D
        D0=A                                     * 5EB80
        C=0     A                                * 5EB83
        B=0     A                                * 5EB85
        D=0     A                                * 5EB87
L_5EB89:
        GOSUB   SUB_5EC10                        * 5EB89
        CAEX    A                                * 5EB8D
        D=D+C   A                                * 5EB8F
        CAEX    A                                * 5EB91
        CR0EX.F A                                * 5EB93
        C=C-1   A                                * 5EB99
        CR0EX.F A                                * 5EB9B
        GONC    L_5EB89                          * 5EBA1
L_5EBA4:
        GOSUB   SUB_5EC10                        * 5EBA4
        B=B+A   A                                * 5EBA8
        CR1EX.F A                                * 5EBAA
        C=C-1   A                                * 5EBB0
        CR1EX.F A                                * 5EBB2
        GONC    L_5EBA4                          * 5EBB8
        GOSUB   SUB_5EC41                        * 5EBBB
        GOVLNG  GETPTRLOOP                       * 5EBBF

* meta1 meta2 meta3 meta4 -> meta2 meta3 meta4 meta1
* refs (21): 57FD2 5820A 5B0FF 5B2E9 5DB42 5DCCD ...
4roll:
        CON(5)  (*)+5                            * 5EBC6  primitive code object
        LA(5)   #00002                           * 5EBCB
        C=0     A                                * 5EBD5
        GOTO    L_5EB67                          * 5EBD7

* meta1 meta2 meta3 -> meta3 meta1 meta2
* refs (57): 21C24 2425D 296FB 548EB 558A0 562AF ...
unrot:
        CON(5)  (*)+5                            * 5EBDB  primitive code object
        A=0     A                                * 5EBE0
        C=0     A                                * 5EBE2
        C=C+1   A                                * 5EBE4
        GOTO    L_5EB67                          * 5EBE6

* meta1 meta2 meta3 meta4 -> meta4 meta1 meta2 meta3
* refs (7): 5492C 58009 5802C 58241 58264 84229 ...
4unroll:
        CON(5)  (*)+5                            * 5EBEA  primitive code object
        A=0     A                                * 5EBEF
        LC(5)   #00002                           * 5EBF1
        GOTO    L_5EB67                          * 5EBF8

* META1..METAn+1 #n -> META2..METAn+1 META1
* refs (4): 2943F 296B5 843A5 8445E
N+1roll:
        CON(5)  (*)+5                            * 5EBFC  primitive code object
        GOSBVL  POP#                             * 5EC01
        A=A-1   A                                * 5EC08
        C=0     A                                * 5EC0A
        GOTO    L_5EB67                          * 5EC0C

* refs (4): 5EB33 5EB3D 5EB89 5EBA4
SUB_5EC10:
        RSTK=C                                   * 5EC10
        A=DAT1  A                                * 5EC12
        AD1EX                                    * 5EC15
        D1=D1+  5                                * 5EC18
        C=DAT1  A                                * 5EC1B
        D1=A                                     * 5EC1E
        C=C+1   A                                * 5EC21
        A=C     A                                * 5EC23
        C=RSTK                                   * 5EC25
        C=C+A   A                                * 5EC27
        RSTK=C                                   * 5EC29
        C=A     A                                * 5EC2B
        C=C+C   A                                * 5EC2D
        C=C+C   A                                * 5EC2F
        C=C+A   A                                * 5EC31
        AD1EX                                    * 5EC33
        A=A+C   A                                * 5EC36
        AD1EX                                    * 5EC38
        A=C     A                                * 5EC3B
        C=RSTK                                   * 5EC3D
        RTN                                      * 5EC3F

* refs (2): 5EB43 5EBBB
SUB_5EC41:
        R0=C                                     * 5EC41
        CD1EX                                    * 5EC44
        R1=C                                     * 5EC47
        D1=(5)  leeway                           * 5EC4A
        A=DAT1  A                                * 5EC51
        D1=A                                     * 5EC54
        D1=D1+  5                                * 5EC57
        A=DAT1  A                                * 5EC5A
        D1=D1+  15                               * 5EC5D
        A=A-CON A,15                             * 5EC60
        C=D     A                                * 5EC66
        ?B>=C   A                                * 5EC68
        GOYES   L_5EC7F                          * 5EC6B
        ?A>=B   A                                * 5EC6D
        GOYES   L_5ECAB                          * 5EC70
L_5EC72:
        C=R1                                     * 5EC72
        D1=C                                     * 5EC75
        C=R0                                     * 5EC78
        GOTO    L_5ECDD                          * 5EC7B
L_5EC7F:
        ?C>A    A                                * 5EC7F
        GOYES   L_5EC72                          * 5EC82
        GOSUB   SUB_5ECA4                        * 5EC84
        CD0EX                                    * 5EC88
        D0=C                                     * 5EC8B
        C=C-D   A                                * 5EC8E
        CD1EX                                    * 5EC90
        RSTK=C                                   * 5EC93
        C=B     A                                * 5EC95
        GOSUB   SUB_5ECA4                        * 5EC97
        C=RSTK                                   * 5EC9B
        C=C-D   A                                * 5EC9D
        CD0EX                                    * 5EC9F
        C=D     A                                * 5ECA2

* refs (3): 5EC84 5EC97 5ECB5
SUB_5ECA4:
        GOVLNG  MOVEDOWN                         * 5ECA4
L_5ECAB:
        CD0EX                                    * 5ECAB
        C=C+D   A                                * 5ECAE
        D0=C                                     * 5ECB0
        C=B     A                                * 5ECB3
        GOSUB   SUB_5ECA4                        * 5ECB5
        CD1EX                                    * 5ECB9
        RSTK=C                                   * 5ECBC
        CD0EX                                    * 5ECBE
        D1=C                                     * 5ECC1
        C=C-B   A                                * 5ECC4
        D0=C                                     * 5ECC6
        C=D     A                                * 5ECC9
        GOSUB   SUB_5ECD6                        * 5ECCB
        C=RSTK                                   * 5ECCF
        CD0EX                                    * 5ECD1
        C=B     A                                * 5ECD4

* refs (1): 5ECCB
SUB_5ECD6:
        GOVLNG  MOVEUP                           * 5ECD6
L_5ECDD:
        C=C-1   A                                * 5ECDD
        RSTK=C                                   * 5ECDF
L_5ECE1:
        A=DAT0  A                                * 5ECE1
        C=0     A                                * 5ECE4
        DAT0=C  A                                * 5ECE6
L_5ECE9:
        AD0EX                                    * 5ECE9
        C=B     A                                * 5ECEC
        C=C+A   A                                * 5ECEE
        GOC     L_5ECFE                          * 5ECF0
        AD1EX                                    * 5ECF3
        ?C<A    A                                * 5ECF6
        GOYES   L_5ED21                          * 5ECF9
        AD1EX                                    * 5ECFB
L_5ECFE:
        C=D     A                                * 5ECFE
        A=A-C   A                                * 5ED00
        AD0EX                                    * 5ED02
        C=DAT0  A                                * 5ED05
        DAT0=A  A                                * 5ED08
        A=C     A                                * 5ED0B
        C=RSTK                                   * 5ED0D
        C=C-1   A                                * 5ED0F
        RTNC                                     * 5ED11
        RSTK=C                                   * 5ED14
        ?A#0    A                                * 5ED16
        GOYES   L_5ECE9                          * 5ED19
        D0=D0+  5                                * 5ED1B
        GONC    L_5ECE1                          * 5ED1E
L_5ED21:
        D1=A                                     * 5ED21
        A=C     A                                * 5ED24
        AD0EX                                    * 5ED26
        C=DAT0  A                                * 5ED29
        DAT0=A  A                                * 5ED2C
        A=C     A                                * 5ED2F
        C=RSTK                                   * 5ED31
        C=C-1   A                                * 5ED33
        RTNC                                     * 5ED35
        RSTK=C                                   * 5ED38
        ?A#0    A                                * 5ED3A
        GOYES   L_5ECE9                          * 5ED3D
        D0=D0+  5                                * 5ED3F
        GONC    L_5ECE1                          * 5ED42

* meta1..meta5 -> meta2..meta5 meta1
* refs (4): 57FFF 58022 58237 5825A
5roll:
        B=B-1   S                                * 5ED45
        B=B+1   A                                * 5ED48
        LA(5)   #00003                           * 5ED4A
        C=0     A                                * 5ED54
        GOTO    L_5EB67                          * 5ED56

* meta1..meta5 -> meta5 meta1..meta4
* refs (4): 840C6 8411B 843AF 84468
5unroll:
        CON(5)  (*)+5                            * 5ED5A  primitive code object
        A=0     A                                * 5ED5F
        LC(5)   #00003                           * 5ED61
        GOTO    L_5EB67                          * 5ED68

* META1..METAn+1 #n -> METAn+1 META1..METAn
N+1unroll:
        CON(5)  (*)+5                            * 5ED6C  primitive code object
        GOSBVL  POP#                             * 5ED71
        C=A     A                                * 5ED78
        A=0     A                                * 5ED7A
        C=C-1   A                                * 5ED7C
        GOTO    L_5EB67                          * 5ED7E
        RPL

* refs (2): 60545 6078E
OBJ_5ED82:
        ::                                       * 5ED82
          3PICK3PICK                             * 5ED87
          #+                                     * 5ED8C
          #2+UNROLL                              * 5ED91
          #1-                                    * 5ED96
          OVER#2+UNROL                           * 5ED9B
          rot                                    * 5EDA0
          NDROP                                  * 5EDA5
          psh                                    * 5EDAA
          get1                                   * 5EDAF
          2DROP                                  * 5EDB4
        ;                                        * 5EDB9
        ASSEMBLE

* refs (1): 5EE01
SUB_5EDBE:
        C=DAT1  A                                * 5EDBE
        CD1EX                                    * 5EDC1
        A=DAT1  A                                * 5EDC4
        D1=C                                     * 5EDC7
        LC(5)   DOREAL                           * 5EDCA
        ?C=A    A                                * 5EDD1
        RTNYES                                   * 5EDD4
        NIBHEX  34                               * 5EDD6  C

(2.280296843E2:8,-3.0002280220:
        CON(5)  DOCMP                            * 5EDD8  DOCMP
        NIBHEX  8A200348E9208A20034A0A208A200031 * 5EDDD  ¨.0∫■.¨.0¤..¨...
        NIBHEX  0EE5                             * 5EDFD  à^
        GOSUB   SUB_5EDBE                        * 5EE01
        GOC     L_5EE0C                          * 5EE05
        GOTO    doskip                           * 5EE08
L_5EE0C:
        GOTO    docola                           * 5EE0C

* Meta&NEG -> Meta COLA Meta -> Meta SKIP Meta&(%<0) -> Meta&ABS(%) COLA
* refs (11): 55341 5537D 553AA 553D7 561C4 5621E ...
M-1stcasechs:
        CON(5)  (*)+5                            * 5EE10  primitive code object
        A=DAT1  A                                * 5EE15
        AD1EX                                    * 5EE18
        D1=D1+  5                                * 5EE1B
        C=DAT1  A                                * 5EE1E
        D1=A                                     * 5EE21
        ?C#0    A                                * 5EE24
        GOYES   L_5EE2D                          * 5EE27
        GOTO    L_5EED7                          * 5EE29
L_5EE2D:
        D1=D1+  5                                * 5EE2D
        A=DAT1  A                                * 5EE30
        LC(5)   xNEG                             * 5EE33
        ?C=A    A                                * 5EE3A
        GOYES   L_5EEA7                          * 5EE3D
        LC(5)   DOREAL                           * 5EE3F
        CD1EX                                    * 5EE46
        AD1EX                                    * 5EE49
        RSTK=C                                   * 5EE4C
        C=DAT1  A                                * 5EE4E
        ?C#A    A                                * 5EE51
        GOYES   L_5EE9C                          * 5EE54
        D1=D1+  5                                * 5EE56
        A=DAT1  W                                * 5EE59
        ?A=0    S                                * 5EE5D
        GOYES   L_5EE9C                          * 5EE60
        A=0     S                                * 5EE62
        C=RSTK                                   * 5EE65
        D1=C                                     * 5EE67
        D1=D1-  5                                * 5EE6A
        C=DAT1  A                                * 5EE6D
        D1=D1+  5                                * 5EE70
        DAT1=C  A                                * 5EE73
        D=D+1   A                                * 5EE76
        GOSBVL  SAVPTR                           * 5EE78
        GOSBVL  PUSH%                            * 5EE7F
        A=DAT1  A                                * 5EE86
        D1=D1+  5                                * 5EE89
        C=DAT1  A                                * 5EE8C
        DAT1=A  A                                * 5EE8F
        D1=D1-  5                                * 5EE92
        DAT1=C  A                                * 5EE95
        GOTO    docola                           * 5EE98
L_5EE9C:
        C=RSTK                                   * 5EE9C
        D1=C                                     * 5EE9E
        D1=D1-  5                                * 5EEA1
        GONC    L_5EED7                          * 5EEA4
L_5EEA7:
        D1=D1-  5                                * 5EEA7
        A=DAT1  A                                * 5EEAA
        AD1EX                                    * 5EEAD
        D1=D1+  5                                * 5EEB0
        C=DAT1  A                                * 5EEB3
        D1=A                                     * 5EEB6
        D1=D1+  10                               * 5EEB9
        D=D+1   A                                * 5EEBC
        D=D+1   A                                * 5EEBE
        C=C-1   A                                * 5EEC0
        R0=C                                     * 5EEC2
        GOSBVL  SAVPTR                           * 5EEC5
        GOSBVL  PUSH#                            * 5EECC
        GOTO    docola                           * 5EED3
L_5EED7:
        GOTO    doskip                           * 5EED7

* %<0 -> :: % <ob1> ; ob -> :: ob <ob2> <rest> ;
REALNEGcase:
        CON(5)  (*)+5                            * 5EEDB  primitive code object
        C=DAT1  A                                * 5EEE0
        CD1EX                                    * 5EEE3
        A=DAT1  A                                * 5EEE6
        CD1EX                                    * 5EEE9
        RSTK=C                                   * 5EEEC
        NIBHEX  34                               * 5EEEE  C

-7.14717317057E-372:
        CON(5)  DOREAL                           * 5EEF0  DOREAL
        NIBHEX  8A6FD0713717417E                 * 5EEF5  ¨ö..sq.ç
        C=DAT1  S                                * 5EF05
        D1=C                                     * 5EF09
        ?C=0    S                                * 5EF0C
        GOYES   L_5EED7                          * 5EF0F
        GOTO    docola                           * 5EF11
        RPL

* meta&ob -> ob=nob ? case
* refs (40): 1CF38 27FFD 2800C 2801B 2802A 28039 ...
AEQ1stcase:
        ::                                       * 5EF15
          'R                                     * 5EF1A
          COLA                                   * 5EF1F
          MEQ1stcase                             * 5EF24
        ;                                        * 5EF29

* Meta&+ ? case
* refs (18): 27508 57C49 57E4E 5885E 58A3E 58B62 ...
M1st+case:
        CON(5)  (*)+5                            * 5EF2E  primitive code object
        ASSEMBLE
        LC(5)   x+                               * 5EF33
        D1=D1+  5                                * 5EF3A
        GOTO    L_5EFE6                          * 5EF3D

* Meta&- ? case
* refs (7): 274EA 57C53 587BE 58868 5B23A 5D0D1 ...
M1st-case:
        CON(5)  (*)+5                            * 5EF41  primitive code object
        LC(5)   x-                               * 5EF46
        D1=D1+  5                                * 5EF4D
        GOTO    L_5EFE6                          * 5EF50

* Meta&* ? case
* refs (17): 57E58 58643 5891C 58A48 58BC6 58BEE ...
M1st*case:
        CON(5)  (*)+5                            * 5EF54  primitive code object
        LC(5)   x*                               * 5EF59
        D1=D1+  5                                * 5EF60
        GOTO    L_5EFE6                          * 5EF63

* Meta&/ ? case
* refs (7): 587C8 58926 5B72B 5D348 5D438 83A40 ...
M1st/case:
        CON(5)  (*)+5                            * 5EF67  primitive code object
        LC(5)   x/                               * 5EF6C
        D1=D1+  5                                * 5EF73
        GOTO    L_5EFE6                          * 5EF76

* Meta&NEG ? case
* refs (6): 27FF3 555C6 587D2 58872 5D0DB 5D1CB
M1stNEGcase:
        CON(5)  (*)+5                            * 5EF7A  primitive code object
        LC(5)   xNEG                             * 5EF7F
        D1=D1+  5                                * 5EF86
        GOTO    L_5EFE6                          * 5EF89

* Meta&INV ? case
* refs (8): 587DC 58930 5B735 5BC44 5BCBC 5BCE9 ...
M1stINVcase:
        CON(5)  (*)+5                            * 5EF8D  primitive code object
        LC(5)   xINV                             * 5EF92
        D1=D1+  5                                * 5EF99
        GOTO    L_5EFE6                          * 5EF9C

* Meta&^ ? case
* refs (4): 5561B 57B68 58625 5893A
M1st^case:
        CON(5)  (*)+5                            * 5EFA0  primitive code object
        LC(5)   x^                               * 5EFA5
        D1=D1+  5                                * 5EFAC
        GOTO    L_5EFE6                          * 5EFAF

* Meta&SQ ? case
* refs (1): 587E6
M1stSQcase:
        CON(5)  (*)+5                            * 5EFB3  primitive code object
        LC(5)   xSQ                              * 5EFB8
        D1=D1+  5                                * 5EFBF
        GOTO    L_5EFE6                          * 5EFC2

* Meta&FNCAPPLY ? case
* refs (7): 1F8D9 20E14 57B06 58DD7 59FB4 5B6A9 ...
M1stFNCcase:
        CON(5)  (*)+5                            * 5EFC6  primitive code object
        LC(5)   xFCNAPPLY                        * 5EFCB
        D1=D1+  5                                * 5EFD2
        GOTO    L_5EFE6                          * 5EFD5

* meta&ob1 ob2 -> ob1=ob2 ? case
* refs (10): 55418 55436 554DB 5559E 555BC 583A9 ...
MEQ1stcase:
        CON(5)  (*)+5                            * 5EFD9  primitive code object
        D=D+1   A                                * 5EFDE
        C=DAT1  A                                * 5EFE0
        D1=D1+  10                               * 5EFE3
L_5EFE6:
        A=DAT1  A                                * 5EFE6
        D1=D1-  5                                * 5EFE9
        ?C=A    A                                * 5EFEC
        GOYES   L_5EFF5                          * 5EFEF
L_5EFF1:
        GOTO    doskip                           * 5EFF1
L_5EFF5:
        GOTO    docola                           * 5EFF5

* meta1&ob1 meta2&ob2 ob3 ->
* refs (1): 5F057
MEQopscase:
        CON(5)  (*)+5                            * 5EFF9  primitive code object
        A=DAT1  A                                * 5EFFE
        D1=D1+  10                               * 5F001
        D=D+1   A                                * 5F004
        C=DAT1  A                                * 5F006
        D1=D1-  5                                * 5F009
        ?C#A    A                                * 5F00C
        GOYES   L_5EFF1                          * 5F00F
        RSTK=C                                   * 5F011
        C=DAT1  A                                * 5F013
        CD1EX                                    * 5F016
        D1=D1+  5                                * 5F019
        A=DAT1  A                                * 5F01C
        A=A+1   A                                * 5F01F
        A=A+1   A                                * 5F021
        D1=A                                     * 5F023
        A=A+A   A                                * 5F026
        A=A+A   A                                * 5F028
        CD1EX                                    * 5F02A
        A=A+C   A                                * 5F02D
        CD1EX                                    * 5F02F
        A=A+C   A                                * 5F032
        D1=A                                     * 5F034
        A=DAT1  A                                * 5F037
        D1=C                                     * 5F03A
        C=RSTK                                   * 5F03D
        ?C=A    A                                * 5F03F
        GOYES   L_5EFF5                          * 5F042
        GOTO    L_5EFF1                          * 5F044
        RPL

* meta1&ob1 meta2&ob2
* refs (1): 561CE
AEQopscase:
        ::                                       * 5F048
          'R                                     * 5F04D
          COLA                                   * 5F052
          MEQopscase                             * 5F057
        ;                                        * 5F05C

* meta&ob -> ob is id lam ? case
* refs (1): 58DE1
Mid1stcase:
        CON(5)  (*)+5                            * 5F061  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 5F066
        C=DAT1  A                                * 5F069
        CD1EX                                    * 5F06C
        A=DAT1  A                                * 5F06F
        CD1EX                                    * 5F072
        D1=D1-  5                                * 5F075
        LC(5)   DOIDNT                           * 5F078
        ?C=A    A                                * 5F07F
        GOYES   docola                           * 5F082
        LC(5)   DOLAM                            * 5F084
        ?C=A    A                                * 5F08B
        GOYES   docola                           * 5F08E

* Exit to rpl SKIP
* refs (7): 251AB 255A8 25624 58B10 5EE08 5EED7 ...
doskip:
        LC(5)   SKIP                             * 5F090
        A=C     A                                * 5F097
        PC=(A)                                   * 5F099

* Exit to rpl COLA
* refs (11): 251B4 255B6 2562B 58B07 5EE0C 5EE98 ...
docola:
        LC(5)   COLA                             * 5F09D
        A=C     A                                * 5F0A4
        PC=(A)                                   * 5F0A6
        RPL

* id -> :: id <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (1): 24E6A
idntcase:
        ::                                       * 5F0AA
          CK&DISPATCH0                           * 5F0AF
          BINT6                                  * 5F0B4
          COLA                                   * 5F0B9
          BINT0                                  * 5F0BE
          SKIP                                   * 5F0C3
        ;                                        * 5F0C8

* id/lam -> :: id <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (7): 212DB 58F6C 59043 6014D 60DCE 852DD ...
idntlamcase:
        ::                                       * 5F0CD
          CK&DISPATCH0                           * 5F0D2
          BINT6                                  * 5F0D7
          COLA                                   * 5F0DC
          BINT7                                  * 5F0E1
          COLA                                   * 5F0E6
          BINT0                                  * 5F0EB
          SKIP                                   * 5F0F0
        ;                                        * 5F0F5

* 0 -> :: 0 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (12): 5633B 56363 5639A 563E5 56435 56467 ...
num0=case:
        ::                                       * 5F0FA
          CK&DISPATCH0                           * 5F0FF
          BINT1                                  * 5F104
          %0=case                                * 5F109
          BINT2                                  * 5F10E
          C%0=case                               * 5F113
          BINT0                                  * 5F118
          SKIP                                   * 5F11D
        ;                                        * 5F122

* %0 -> :: %0 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (4): 0FE0D 51E69 5A72F 5F109
%0=case:
        ::                                       * 5F127
          DUP%0=                                 * 5F12C
          COLAcase                               * 5F131
        ;                                        * 5F136

* C%0 -> :: C%0 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (4): 51E1E 51ECD 522C4 5F113
C%0=case:
        ::                                       * 5F13B
          DUP                                    * 5F140
          C%0=                                   * 5F145
          COLAcase                               * 5F14A
        ;                                        * 5F14F

* 1 -> :: 1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (9): 56304 563A4 563EF 564A8 5659D 565D9 ...
num1=case:
        ::                                       * 5F154
          CK&DISPATCH0                           * 5F159
          BINT1                                  * 5F15E
          %1=case                                * 5F163
          BINT2                                  * 5F168
          C%1=case                               * 5F16D
          BINT0                                  * 5F172
          SKIP                                   * 5F177
        ;                                        * 5F17C

* %1 -> :: %1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (2): 594B8 5F163
%1=case:
        ::                                       * 5F181
          DUP                                    * 5F186
          %1                                     * 5F18B
          %=                                     * 5F190
          COLAcase                               * 5F195
        ;                                        * 5F19A

* C%1 -> :: C%1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (1): 5F16D
C%1=case:
        ::                                       * 5F19F
          DUP                                    * 5F1A4
          C%1                                    * 5F1A9
          EQUAL                                  * 5F1AE
          COLAcase                               * 5F1B3
        ;                                        * 5F1B8

* 2 -> :: 2 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (3): 564CB 57BD6 86DBC
num2=case:
        ::                                       * 5F1BD
          CK&DISPATCH0                           * 5F1C2
          BINT1                                  * 5F1C7
          %2=case                                * 5F1CC
          BINT2                                  * 5F1D1
          C%2=case                               * 5F1D6
          BINT0                                  * 5F1DB
          SKIP                                   * 5F1E0
        ;                                        * 5F1E5

* %2 -> :: %2 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (2): 594C2 5F1CC
%2=case:
        ::                                       * 5F1EA
          DUP                                    * 5F1EF
          %2                                     * 5F1F4
          %=                                     * 5F1F9
          COLAcase                               * 5F1FE
        ;                                        * 5F203

* C%2 -> :: C%2 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (1): 5F1D6
C%2=case:
        ::                                       * 5F208
          DUP                                    * 5F20D
          C%>%                                   * 5F212
          %0=                                    * 5F217
          SWAP                                   * 5F21C
          %2                                     * 5F221
          %=                                     * 5F226
          AND                                    * 5F22B
          COLAcase                               * 5F230
        ;                                        * 5F235

* -1 -> :: -1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (5): 563AE 5640D 564B2 565A7 565E3
num-1=case:
        ::                                       * 5F23A
          CK&DISPATCH0                           * 5F23F
          BINT1                                  * 5F244
          %-1=case                               * 5F249
          BINT2                                  * 5F24E
          C%-1=case                              * 5F253
          BINT0                                  * 5F258
          SKIP                                   * 5F25D
        ;                                        * 5F262

* %-1 -> :: %-1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (3): 48ABC 4C27E 5F249
%-1=case:
        ::                                       * 5F267
          DUP                                    * 5F26C
          %-1                                    * 5F271
          %=                                     * 5F276
          COLAcase                               * 5F27B
        ;                                        * 5F280

* C%-1 -> :: C%-1 <ob1> ; ob -> ob <ob2> <rest> ;
* refs (1): 5F253
C%-1=case:
        ::                                       * 5F285
          DUP                                    * 5F28A
          C%-1                                   * 5F28F
          EQUAL                                  * 5F294
          COLAcase                               * 5F299
        ;                                        * 5F29E

* ob -> meta
* refs (33): 1CFDA 28098 280AC 546F2 56705 56B19 ...
EXPLODE:
        ::                                       * 5F2A3
          ZEROSWAP                               * 5F2A8
          SINNER                                 * 5F2AD
          BEGIN                                  * 5F2B2
          DUP#0<>WHILE                           * 5F2B7
          ::                                     * 5F2BC
            #1-SWAP                              * 5F2C1
            DUPTYPESYMB?                         * 5F2C6
            ITE                                  * 5F2CB
            INNERtop&                            * 5F2D0
            psh1&                                * 5F2D5
          ;                                      * 5F2DA
          REPEAT                                 * 5F2DF
          DROP                                   * 5F2E4
        ;                                        * 5F2E9

* meta -> ob
* refs (19): 2809D 280B1 28124 56755 57A20 57A34 ...
IMPLODE:
        ::                                       * 5F2EE
          BINT1                                  * 5F2F3
          OVER#=case                             * 5F2F8
          DROPSYM                                * 5F2FD
          pshzer                                 * 5F302
          OBJ_5F31B                              * 5F307
          DROP                                   * 5F30C
          CKSYMBN                                * 5F311
        ;                                        * 5F316

* refs (1): 5F307
OBJ_5F31B:
        ::                                       * 5F31B
          BEGIN                                  * 5F320
          pullrev                                * 5F325
          OBJ_5F537                              * 5F32A
          OBJ_5F571                              * 5F32F
          nonopcase                              * 5F334
          OBJ_5F370                              * 5F339
          DUP                                    * 5F33E
          M1stFNCcase                            * 5F343
          OBJ_5F3D4                              * 5F348
          OBJ_26F7A                              * 5F34D
          case                                   * 5F352
          OBJ_5F4F6                              * 5F357
          DROP                                   * 5F35C
          psh1&rev                               * 5F361
          #0=UNTIL                               * 5F366
        ;                                        * 5F36B

* refs (1): 5F339
OBJ_5F370:
        ::                                       * 5F370
          psh1&rev                               * 5F375
          #0=UNTIL                               * 5F37A
        ;                                        * 5F37F

* ob1 ob2 -> ob
* refs (3): 54819 5E094 5F2FD
DROPSYM:
        ::                                       * 5F384
          DROP                                   * 5F389
          CK&DISPATCH0                           * 5F38E
          BINT6                                  * 5F393
          NOP                                    * 5F398
          BINT7                                  * 5F39D
          NOP                                    * 5F3A2
          BINT1                                  * 5F3A7
          NOP                                    * 5F3AC
          BINT2                                  * 5F3B1
          NOP                                    * 5F3B6
          BINT14                                 * 5F3BB
          NOP                                    * 5F3C0
          BINT0                                  * 5F3C5
          symcomp                                * 5F3CA
        ;                                        * 5F3CF

* refs (1): 5F348
OBJ_5F3D4:
        ::                                       * 5F3D4
          2DROP                                  * 5F3D9
          psh                                    * 5F3DE
          ROT                                    * 5F3E3
          symcomp                                * 5F3E8
          DUP4UNROLL                             * 5F3ED
          CARCOMP                                * 5F3F2
          NOTROMPcase                            * 5F3F7

* refs (1): 5F43D
OBJ_5F3FC:
          ::                                     * 5F3FC
            DROP                                 * 5F401
            PTR     addt:                        * 5F406
            xFCNAPPLY                            * 5F40B
            psh                                  * 5F410
            #0=UNTIL                             * 5F415
          ;                                      * 5F41A
          DUPROMPTR@                             * 5F41F
          ?SKIP                                  * 5F424
          SETROMPERR                             * 5F429
          DROP                                   * 5F42E
          OBJ_26F7A                              * 5F433
          NOTcase                                * 5F438
          OBJ_5F3FC                              * 5F43D
          CARCOMP                                * 5F442
          4PICK                                  * 5F447
          CARCOMP                                * 5F44C
          OBJ_5E9E1                              * 5F451
          NOTcase                                * 5F456
          OBJ_5F4A6                              * 5F45B
          4ROLLSWAP                              * 5F460
          4UNROLL                                * 5F465
          psh1&rev                               * 5F46A
          #1-ROT                                 * 5F46F
          EVAL                                   * 5F474
          #1+DUP                                 * 5F479
          #2+PICK                                * 5F47E
          3UNROLL                                * 5F483
          PTR     addt:                          * 5F488
          xFCNAPPLY                              * 5F48D
          psh                                    * 5F492
          SWAPDROP#1-                            * 5F497
          #0=UNTIL                               * 5F49C
        ;                                        * 5F4A1

* refs (1): 5F45B
OBJ_5F4A6:
        ::                                       * 5F4A6
          SWAPROT                                * 5F4AB
          psh1&rev                               * 5F4B0
          #1-ROT                                 * 5F4B5
          psh1&rev                               * 5F4BA
          #1-SWAP                                * 5F4BF
          EVAL                                   * 5F4C4
          psh                                    * 5F4C9
          #1-SWAP                                * 5F4CE
          psh1&rev                               * 5F4D3
          pullrev1&                              * 5F4D8
          '                                      * 5F4DD
          xFCNAPPLY                              * 5F4E2
          psh1&rev                               * 5F4E7
          #0=UNTIL                               * 5F4EC
        ;                                        * 5F4F1

* refs (1): 5F357
OBJ_5F4F6:
        ::                                       * 5F4F6
          ROT                                    * 5F4FB
          #1+SWAP                                * 5F500
          psh1&rev                               * 5F505
          psh                                    * 5F50A
          #1-SWAP                                * 5F50F
          CARCOMP                                * 5F514
          EVAL                                   * 5F519
          psh                                    * 5F51E
          #1-SWAP                                * 5F523
          psh1&rev                               * 5F528
          #0=UNTIL                               * 5F52D
        ;                                        * 5F532

* refs (1): 5F32A
OBJ_5F537:
        CON(5)  (*)+5                            * 5F537  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 5F53C
        LC(5)   ROMP_002_105                     * 5F53F
        ?C=A    A                                * 5F546
        GOYES   L_5F564                          * 5F549
        LC(5)   ROMP_002_106                     * 5F54B
        ?C=A    A                                * 5F552
        GOYES   L_5F564                          * 5F555
L_5F557:
        LC(5)   SKIP                             * 5F557
        A=C     A                                * 5F55E
        PC=(A)                                   * 5F560
L_5F564:
        LC(5)   COLA                             * 5F564
        A=C     A                                * 5F56B
        PC=(A)                                   * 5F56D
        RPL

* refs (1): 5F32F
OBJ_5F571:
        ::                                       * 5F571
          psh1&rev                               * 5F576
          psh                                    * 5F57B
          OVER                                   * 5F580
          '                                      * 5F585
          ROMP_002_105                           * 5F58A
          EQITE                                  * 5F58F
          OBJ_2818D                              * 5F594
          OBJ_281F6                              * 5F599
          psh                                    * 5F59E
          #0=UNTIL                               * 5F5A3
        ;                                        * 5F5A8

* refs (5): 590E3 59F7D 60A27 60E19 6B15B
OBJ_5F5AD:
        ::                                       * 5F5AD
          BINT1                                  * 5F5B2
          splitdown                              * 5F5B7
          OVER                                   * 5F5BC
          #2+PICK                                * 5F5C1
          REQcasedrop                            * 5F5C6
          xFCNAPPLY                              * 5F5CB
          OBJ_5F63E                              * 5F5D0
          DUP                                    * 5F5D5
          OBJ_26F7A                              * 5F5DA
          NOTcase                                * 5F5DF

* ob1..ob4 -> F
4DROPFALSE:
          ::                                     * 5F5E4
            4DROP                                * 5F5E9
            FALSE                                * 5F5EE
          ;                                      * 5F5F3
          BINT2                                  * 5F5F8
          NTHCOMPDROP                            * 5F5FD
          SWAP                                   * 5F602
          infarg?                                * 5F607
          SWAPDROP                               * 5F60C
          IT                                     * 5F611
          ::                                     * 5F616
            3PICK                                * 5F61B
            #4+PICK                              * 5F620
            SWAP                                 * 5F625
          ;                                      * 5F62A
          EVAL                                   * 5F62F
          SWAPDROP                               * 5F634
        ;                                        * 5F639

* refs (1): 5F5D0
OBJ_5F63E:
        ::                                       * 5F63E
          OVER                                   * 5F643
          #3+PICK                                * 5F648
          2DUP                                   * 5F64D
          #>case                                 * 5F652

* ob1 ob2 ob3 -> T
3DROPTRUE:
          ::                                     * 5F657
            3DROP                                * 5F65C
            TRUE                                 * 5F661
          ;                                      * 5F666
          3PICK                                  * 5F66B
          #5+                                    * 5F670
          PICK                                   * 5F675
          NOTROMPcase                            * 5F67A

4dropn;false:
          ::                                     * 5F67F
            4DROP                                * 5F684
            FALSE                                * 5F689
          ;                                      * 5F68E
          ?OKINALG                               * 5F693
          NOTcase                                * 5F698
          SETROMPERR                             * 5F69D
          DUP                                    * 5F6A2
          OBJ_26F7A                              * 5F6A7
          NOTcase                                * 5F6AC

* ob1..ob5 -> F
* refs (1): 2FDF8
5DROPFALSE:
          ::                                     * 5F6B1
            5DROP                                * 5F6B6
            FALSE                                * 5F6BB
          ;                                      * 5F6C0
          BINT2                                  * 5F6C5
          NTHCOMPDROP                            * 5F6CA
          SWAP                                   * 5F6CF
          OBJ_5E9E1                              * 5F6D4
          ?SKIP                                  * 5F6D9
          SWAPDROP                               * 5F6DE
          EVAL                                   * 5F6E3
          SWAPDROP                               * 5F6E8
        ;                                        * 5F6ED
        ASSEMBLE

* refs (23): 54E84 57B51 5BE5B 5BE86 5BED3 5BF58 ...
SUB_5F6F2:
        LC(5)   L_5F7E0                          * 5F6F2

* refs (5): 5C699 5C6E5 5C749 5C851 5C929
SUB_5F6F9:
        R4=C.F  A                                * 5F6F9
        GOSBVL  SAVPTR                           * 5F6FF
        C=RSTK                                   * 5F706
        D0=C                                     * 5F708
        D1=D1+  5                                * 5F70B
        CD1EX                                    * 5F70E
        R2=C.F  A                                * 5F711
L_5F717:
        C=R2.F  A                                * 5F717
        D1=C                                     * 5F71D
        C=DAT0  A                                * 5F720
        D0=D0+  5                                * 5F723
        C=C+1   P                                * 5F726
        GOC     L_5F78E                          * 5F729
        C=C-1   P                                * 5F72C
L_5F72F:
        ?C#0    A                                * 5F72F
        GOYES   L_5F738                          * 5F732
        GOTO    L_5F7C2                          * 5F734
L_5F738:
        C=C-1   P                                * 5F738
        GOC     L_5F79F                          * 5F73B
        CPEX    0                                * 5F73E
        CSR     A                                * 5F742
        D=C     A                                * 5F744
        C=0     A                                * 5F746
        CPEX    0                                * 5F748
        A=C     A                                * 5F74C
        A=A+A   A                                * 5F74E
        A=A+A   A                                * 5F750
        A=A+C   A                                * 5F752
        C=R4.F  A                                * 5F754
        C=C+A   A                                * 5F75A
        CD0EX                                    * 5F75C
        A=DAT0  A                                * 5F75F
        CD0EX                                    * 5F762
        C=DAT1  A                                * 5F765
        ?C=A    A                                * 5F768
        GOYES   L_5F785                          * 5F76B
        A=DAT0  A                                * 5F76D
        D0=D0+  5                                * 5F770
        LC(5)   DOROMP                           * 5F773
        ?C#A    A                                * 5F77A
        GOYES   L_5F717                          * 5F77D
        D0=D0+  6                                * 5F77F
        GONC    L_5F717                          * 5F782
L_5F785:
        D1=D1+  5                                * 5F785
        C=D     A                                * 5F788
        GOTO    L_5F72F                          * 5F78A
L_5F78E:
        GOSBVL  GETPTR                           * 5F78E
        A=DAT0  A                                * 5F795
        D0=D0+  5                                * 5F798
        PC=(A)                                   * 5F79B
L_5F79F:
        A=0     A                                * 5F79F
L_5F7A1:
        A=A+1   A                                * 5F7A1
        CSR     A                                * 5F7A3
        ?C=0    P                                * 5F7A5
        GOYES   L_5F7A1                          * 5F7A8
        RSTK=C                                   * 5F7AA
        R1=A.F  A                                * 5F7AC
        R0=A.F  A                                * 5F7B2
        GOSUB   L_5F821                          * 5F7B8
        C=RSTK                                   * 5F7BC
        GOTO    L_5F72F                          * 5F7BE
L_5F7C2:
        CD0EX                                    * 5F7C2
        RSTK=C                                   * 5F7C5
        GOSBVL  GETPTR                           * 5F7C7
        C=RSTK                                   * 5F7CE
        D0=(5)  COLA                             * 5F7D0
        CD0EX                                    * 5F7D7
        A=C     A                                * 5F7DA
        PC=(A)                                   * 5F7DC

L_5F7E0:
        CON(5)  x+                               * 5F7E0  address (the code jumps or points through it)

        CON(5)  x-                               * 5F7E5  address (the code jumps or points through it)

        CON(5)  x*                               * 5F7EA  address (the code jumps or points through it)

        CON(5)  x/                               * 5F7EF  address (the code jumps or points through it)

        CON(5)  x^                               * 5F7F4  address (the code jumps or points through it)

        CON(5)  xNEG                             * 5F7F9  address (the code jumps or points through it)

        CON(5)  xINV                             * 5F7FE  address (the code jumps or points through it)

        CON(5)  xEXP                             * 5F803  address (the code jumps or points through it)

        CON(5)  xALOG                            * 5F808  address (the code jumps or points through it)

        CON(5)  xLN                              * 5F80D  address (the code jumps or points through it)

        CON(5)  xLOG                             * 5F812  address (the code jumps or points through it)

        CON(5)  xPI                              * 5F817  address (the code jumps or points through it)

        CON(5)  %2                               * 5F81C  address (the code jumps or points through it)
L_5F821:
        ST=1    4                                * 5F821
L_5F824:
        ST=0    5                                * 5F824
        A=DAT1  A                                * 5F827
        LC(5)   xFCNAPPLY                        * 5F82A
        ?C=A    A                                * 5F831
        GOYES   L_5F88E                          * 5F834
        AD1EX                                    * 5F836
        B=A     A                                * 5F839
        A=DAT1  A                                * 5F83B
        LC(5)   DOCOL                            * 5F83E
        ?C#A    A                                * 5F845
        GOYES   L_5F875                          * 5F848
        D1=D1+  5                                * 5F84A
        A=DAT1  A                                * 5F84D
        LC(5)   CKINFARGS                        * 5F850
        ?C=A    A                                * 5F857
        GOYES   L_5F886                          * 5F85A
        D1=(5)  L_5F908                          * 5F85C
        P=P-1                                    * 5F863
L_5F865:
        P=P+1                                    * 5F865
        C=DAT1  A                                * 5F867
        D1=D1+  5                                * 5F86A
        ?C#A    A                                * 5F86D
        GOYES   L_5F865                          * 5F870
        GONC    L_5F877                          * 5F872
L_5F875:
        P=      0                                * 5F875
L_5F877:
        C=0     A                                * 5F877
        CPEX    0                                * 5F879
        A=B     A                                * 5F87D
        D1=A                                     * 5F87F
        GOTO    L_5F8AC                          * 5F882
L_5F886:
        ST=1    5                                * 5F886
        A=B     A                                * 5F889
        D1=A                                     * 5F88B
L_5F88E:
        D1=D1+  5                                * 5F88E
        A=DAT1  A                                * 5F891
        AD1EX                                    * 5F894
        D1=D1+  5                                * 5F897
        C=DAT1  A                                * 5F89A
        D1=A                                     * 5F89D
        D1=D1-  5                                * 5F8A0
        C=C+1   A                                * 5F8A3
        ?ST=1   5                                * 5F8A5
        GOYES   L_5F8AC                          * 5F8A8
        C=C+1   A                                * 5F8AA
L_5F8AC:
        ?ST=0   4                                * 5F8AC
        GOYES   L_5F8DB                          * 5F8AF
        D1=D1+  5                                * 5F8B1
        A=R0.F  A                                * 5F8B4
        A=A+1   A                                * 5F8BA
        R0=A.F  A                                * 5F8BC
        A=R1.F  A                                * 5F8C2
        A=A+C   A                                * 5F8C8
        A=A-1   A                                * 5F8CA
        R1=A.F  A                                * 5F8CC
        ?A=0    A                                * 5F8D2
        RTNYES                                   * 5F8D5
        GOTO    L_5F821                          * 5F8D7
L_5F8DB:
        A=R1.F  A                                * 5F8DB
        ?C>=A   A                                * 5F8E1
        RTNYES                                   * 5F8E4
        A=A-C   A                                * 5F8E6
        A=A+1   A                                * 5F8E8
        R1=A.F  A                                * 5F8EA

* refs (1): 5F977
SUB_5F8F0:
        ST=0    4                                * 5F8F0
        A=R0.F  A                                * 5F8F3
        A=A-1   A                                * 5F8F9
        R0=A.F  A                                * 5F8FB
        D1=D1-  5                                * 5F901
        GOTO    L_5F824                          * 5F904

L_5F908:
        CON(5)  CK0                              * 5F908  address (the code jumps or points through it)

        CON(5)  CK1&Dispatch                     * 5F90D  address (the code jumps or points through it)

        CON(5)  CK2&Dispatch                     * 5F912  address (the code jumps or points through it)

        CON(5)  CK3&Dispatch                     * 5F917  address (the code jumps or points through it)

        CON(5)  CK4&Dispatch                     * 5F91C  address (the code jumps or points through it)

        CON(5)  CK5&Dispatch                     * 5F921  address (the code jumps or points through it)

* meta #n #m -> meta #level
* refs (4): 5905C 5E6DE 5EAAE 5EAD1
splitup:
        CON(5)  (*)+5                            * 5F926  primitive code object
        GOSUB   SUB_5F93A                        * 5F92B
        GOSUB   L_5F821                          * 5F92F
        GOVLNG  PUSH#LOOP                        * 5F933

* refs (2): 5F92B 5F973
SUB_5F93A:
        GOSBVL  POP2#                            * 5F93A
        R0=A.F  A                                * 5F941
        R1=C.F  A                                * 5F947
        GOSBVL  SAVPTR                           * 5F94D
        A=R0.F  A                                * 5F954
        A=A-1   A                                * 5F95A
        C=A     A                                * 5F95C
        A=A+A   A                                * 5F95E
        A=A+A   A                                * 5F960
        A=A+C   A                                * 5F962
        CD1EX                                    * 5F964
        C=C+A   A                                * 5F967
        D1=C                                     * 5F969
        RTN                                      * 5F96C

* meta #n #m -> meta #lowlevel #args+1
* refs (6): 5ADF8 5B21C 5D086 5D5CE 5F5B7 69F29
splitdown:
        CON(5)  (*)+5                            * 5F96E  primitive code object
        GOSUB   SUB_5F93A                        * 5F973
        GOSUB   SUB_5F8F0                        * 5F977
        C=C-A   A                                * 5F97B
        C=C+1   A                                * 5F97D
        R1=C.F  A                                * 5F97F
        GOSBVL  PUSH2#                           * 5F985
        A=DAT0  A                                * 5F98C
        D0=D0+  5                                * 5F98F
        PC=(A)                                   * 5F992
        RPL

* meta #n -> meta1 meta2
* refs (15): 5AEC5 5B028 5B14A 5B24E 5B2A3 5B87F ...
tailpsh:
        ::                                       * 5F996
          #1-DUP                                 * 5F99B
          3UNROLL                                * 5F9A0
          #-OVER                                 * 5F9A5
          #2+UNROLL                              * 5F9AA
          psh                                    * 5F9AF
        ;                                        * 5F9B4

* refs (3): 35144 68DB9 6DEA0
->StrExpr(_):
        ::                                       * 5F9B9
          CK&DISPATCH1                           * 5F9BE
          BINT1                                  * 5F9C3
          OBJ_35264                              * 5F9C8
          BINT2                                  * 5F9CD
          ->StdStr(c)                            * 5F9D2
          BINT6                                  * 5F9D7
          ID>$                                   * 5F9DC
          BINT7                                  * 5F9E1
          ID>$                                   * 5F9E6
          BINT14                                 * 5F9EB
          UNIT>$                                 * 5F9F0
          BINT0                                  * 5F9F5
          ->StrOp(_)                             * 5F9FA
        ;                                        * 5F9FF

* refs (2): 40675 5F9FA
->StrOp(_):
        ::                                       * 5FA04
          REQcasedrop                            * 5FA09
          xNEG                                   * 5FA0E
          tok-                                   * 5FA13
          PALPTRDCMP                             * 5FA18
          ?SEMIDROP                              * 5FA1D
          tokUNKNOWN                             * 5FA22
        ;                                        * 5FA27

* refs (1): 1CFDF
OBJ_5FA2C:
        ::                                       * 5FA2C
          #1-SWAP                                * 5FA31
          ::                                     * 5FA36
            REQcasedrop                          * 5FA3B
            xFCNAPPLY                            * 5FA40

* meta&ob1&ob2 -> meta ob1
pulldroppull:
            ::                                   * 5FA45
              SWAPDROP#1-                        * 5FA4A
              #1-SWAP                            * 5FA4F
            ;                                    * 5FA54
            infarg?                              * 5FA59
            case                                 * 5FA5E

* meta&ob1 ob2 -> meta ob2
revpulldrop:
            ::                                   * 5FA63
              3UNROLL                            * 5FA68
              SWAPDROP#1-                        * 5FA6D
              SWAP                               * 5FA72
            ;                                    * 5FA77
          ;                                      * 5FA7C
          pshm1                                  * 5FA81
          BEGIN                                  * 5FA86
          DUP#0<>WHILE                           * 5FA8B
          ::                                     * 5FA90
            larg                                 * 5FA95
            IMPLODE                              * 5FA9A
            psh1&                                * 5FA9F
          ;                                      * 5FAA4
          REPEAT                                 * 5FAA9
          DROP                                   * 5FAAE
          #1-SWAP                                * 5FAB3
          CK&DISPATCH0                           * 5FAB8
          BINT15                                 * 5FABD
          OBJ_7DF92                              * 5FAC2
          BINT8                                  * 5FAC7
          OBJ_5FAE0                              * 5FACC
          BINT0                                  * 5FAD1
          TRUE                                   * 5FAD6
        ;                                        * 5FADB

* refs (2): 5FACC 8D25A
OBJ_5FAE0:
        ::                                       * 5FAE0
          DUP                                    * 5FAE5
          OBJ_26F7A                              * 5FAEA
          IT                                     * 5FAEF
          ::                                     * 5FAF4
            BINT3                                * 5FAF9
            NTHELCOMP                            * 5FAFE
            case                                 * 5FB03

eval;tq:
            ::                                   * 5FB08
              EVAL                               * 5FB0D
              RDROP                              * 5FB12
              TRUE                               * 5FB17
            ;                                    * 5FB1C
            DUP                                  * 5FB21
          ;                                      * 5FB26
          DROP                                   * 5FB2B
          PALPTRDCMP                             * 5FB30
          NOTcaseFALSE                           * 5FB35
          $>ID                                   * 5FB3A
          COMPILEID                              * 5FB3F
        ;                                        * 5FB44

* T -> :: <ob1> <rest> ; F -> F
* refs (71): 09302 09398 0C7DA 0C7E4 0DFE3 0F3F8 ...
NOTcaseFALSE:
        ::                                       * 5FB49
          NOTcase                                * 5FB4E
          RDROPFALSE                             * 5FB53
        ;                                        * 5FB58

* refs (5): 2453C 245E1 246C2 24E4C 27EDB
~;eval;q:
        ::                                       * 5FB5D
          'R                                     * 5FB62
          EVAL                                   * 5FB67
          RDROP                                  * 5FB6C
        ;                                        * 5FB71

* # ob ob' -> #+1 ob ob'
* refs (19): 275E4 27760 278AA 27981 279D6 27F8F ...
ROT#1+UNROT:
        CON(5)  (*)+5                            * 5FB76  primitive code object
        ASSEMBLE
        D1=D1+  10                               * 5FB7B
        C=DAT1  A                                * 5FB7E
        CD1EX                                    * 5FB81
        D1=D1+  5                                * 5FB84
        A=DAT1  A                                * 5FB87
        D1=C                                     * 5FB8A
        A=A+1   A                                * 5FB8D
        LC(5)   #0002B                           * 5FB8F
        ?C<A    A                                * 5FB96
        GOYES   L_5FBBA                          * 5FB99
        GOSUB   SUB_5FBDC                        * 5FB9B
        A=A+A   A                                * 5FB9F
        LC(5)   BINT0                            * 5FBA1
        A=A+C   A                                * 5FBA8
L_5FBAA:
        DAT1=A  A                                * 5FBAA
        D1=D1-  10                               * 5FBAD
        A=DAT0  A                                * 5FBB0
        D0=D0+  5                                * 5FBB3
        PC=(A)                                   * 5FBB6
L_5FBBA:
        R0=A.F  A                                * 5FBBA
        D1=D1-  10                               * 5FBC0
        GOSBVL  SAVPTR                           * 5FBC3
        GOSBVL  PUSH#                            * 5FBCA
        A=DAT1  A                                * 5FBD1
        D=D+1   A                                * 5FBD4
        D1=D1+  15                               * 5FBD6
        GONC    L_5FBAA                          * 5FBD9

* refs (2): 5FB9B 5FBFC
SUB_5FBDC:
        C=A     A                                * 5FBDC
        A=A+A   A                                * 5FBDE
        A=A+A   A                                * 5FBE0
        A=A+C   A                                * 5FBE2
        RTN                                      * 5FBE4

* #0 M -> COLA ob M -> SKIP
* refs (4): 57F05 57F69 5815B 581A1
pick1#0=case:
        CON(5)  (*)+5                            * 5FBE6  primitive code object
        C=DAT1  A                                * 5FBEB
        CD1EX                                    * 5FBEE
        D1=D1+  5                                * 5FBF1
        A=DAT1  A                                * 5FBF4
        D1=C                                     * 5FBF7
        A=A+1   A                                * 5FBFA
        GOSUB   SUB_5FBDC                        * 5FBFC
        CD1EX                                    * 5FC00
        A=A+C   A                                * 5FC03
        D1=A                                     * 5FC05
        A=DAT1  A                                * 5FC08
        D1=A                                     * 5FC0B
        D1=D1+  5                                * 5FC0E
        A=DAT1  A                                * 5FC11
        D1=C                                     * 5FC14
        ?A=0    A                                * 5FC17
        GOYES   L_5FC20                          * 5FC1A
        GOTO    L_5F557                          * 5FC1C
L_5FC20:
        GOTO    L_5F564                          * 5FC20
        RPL

* n..1 #n -> n..1 #n n+1
* refs (9): 10AE0 572DE 59F50 605CC 6091E 60D07 ...
DUP#2+PICK:
        ::                                       * 5FC24
          DUP                                    * 5FC29
          #2+PICK                                * 5FC2E
        ;                                        * 5FC33

* meta -> %1 #1 meta
* refs (1): 86687
%1pshm1:
        ::                                       * 5FC38
          %1                                     * 5FC3D
          pshm1                                  * 5FC42
        ;                                        * 5FC47

* refs (1): 1F3C7
B2(n)<='B1(1)':
        ::                                       * 5FC4C
          #1-SWAP                                * 5FC51
          symcomp                                * 5FC56
          psh1&                                  * 5FC5B
        ;                                        * 5FC60

* refs (1): 83F00
OBJ_5FC65:
        ::                                       * 5FC65
          pargop                                 * 5FC6A
          ROMPTR  0F0 04B                        * 5FC6F
          psh                                    * 5FC7A
          #1-SWAP                                * 5FC7F
          pshm1                                  * 5FC84
          ROMPTR  0F0 04B                        * 5FC89
          pshtop&                                * 5FC94
          top&                                   * 5FC99
        ;                                        * 5FC9E
        ASSEMBLE

* refs (1): 60219
SUB_5FCA3:
        C=C-1   A                                * 5FCA3
        R0=C.F  A                                * 5FCA5
L_5FCAB:
        A=DAT0  A                                * 5FCAB
        C=DAT1  A                                * 5FCAE
        ?C#A    A                                * 5FCB1
        GOYES   L_5FCBA                          * 5FCB4
        GOTO    L_5FD76                          * 5FCB6
L_5FCBA:
        AD0EX                                    * 5FCBA
        R1=A.F  A                                * 5FCBD
        CD1EX                                    * 5FCC3
        R2=C.F  A                                * 5FCC6
        A=DAT0  A                                * 5FCCC
        C=DAT1  A                                * 5FCCF
        ?C#A    A                                * 5FCD2
        GOYES   L_5FCFA                          * 5FCD5
        CD1EX                                    * 5FCD7
        R3=C.F  A                                * 5FCDA
        AD0EX                                    * 5FCE0
        GOSUB   SUB_5FCFC                        * 5FCE3
        B=A     A                                * 5FCE7
        CR3EX.F A                                * 5FCE9
        A=C     A                                * 5FCEF
        GOSUB   SUB_5FCFC                        * 5FCF1
        ?A=B    A                                * 5FCF5
        GOYES   L_5FD13                          * 5FCF8
L_5FCFA:
        RTNSC                                    * 5FCFA

* refs (2): 5FCE3 5FCF1
SUB_5FCFC:
        D0=A                                     * 5FCFC
        D1=A                                     * 5FCFF
        GOSBVL  SKIPOB                           * 5FD02
        AD0EX                                    * 5FD09
        CD1EX                                    * 5FD0C
        A=A-C   A                                * 5FD0F
        RTN                                      * 5FD11
L_5FD13:
        D1=C                                     * 5FD13
        A=R3.F  A                                * 5FD16
        D0=A                                     * 5FD1C
        C=B     A                                * 5FD1F
        P=C     0                                * 5FD21
        CSR     A                                * 5FD25
        B=C     A                                * 5FD27
        B=B-1   A                                * 5FD29
        GOC     L_5FD46                          * 5FD2B
L_5FD2E:
        A=DAT0  W                                * 5FD2E
        C=DAT1  W                                * 5FD32
        D0=D0+  16                               * 5FD36
        D1=D1+  16                               * 5FD39
        ?C#A    W                                * 5FD3C
        GOYES   L_5FD58                          * 5FD3F
        B=B-1   A                                * 5FD41
        GONC    L_5FD2E                          * 5FD43
L_5FD46:
        P=P-1                                    * 5FD46
        GOC     L_5FD5E                          * 5FD48
        A=DAT0  WP                               * 5FD4B
        C=DAT1  WP                               * 5FD4F
        ?C=A    WP                               * 5FD53
        GOYES   L_5FD5E                          * 5FD56
L_5FD58:
        P=      0                                * 5FD58
        GOTO    L_5FCFA                          * 5FD5A
L_5FD5E:
        P=      0                                * 5FD5E
        BSL     A                                * 5FD60
        AD0EX                                    * 5FD62
        A=A-B   A                                * 5FD65
        D0=A                                     * 5FD67
        CD1EX                                    * 5FD6A
        C=C-B   A                                * 5FD6D
        D1=C                                     * 5FD6F
        GOTO    L_5FD88                          * 5FD72
L_5FD76:
        AD0EX                                    * 5FD76
        R1=A.F  A                                * 5FD79
        CD1EX                                    * 5FD7F
        R2=C.F  A                                * 5FD82
L_5FD88:
        A=R0.F  A                                * 5FD88
        A=A-1   A                                * 5FD8E
        GOC     L_5FDB5                          * 5FD90
        R0=A.F  A                                * 5FD93
        A=R1.F  A                                * 5FD99
        D0=A                                     * 5FD9F
        D0=D0+  5                                * 5FDA2
        C=R2.F  A                                * 5FDA5
        D1=C                                     * 5FDAB
        D1=D1+  5                                * 5FDAE
        GOTO    L_5FCAB                          * 5FDB1
L_5FDB5:
        RTNCC                                    * 5FDB5
        RPL

* refs (2): 60437 606A3
OBJ_5FDB7:
        ::                                       * 5FDB7

{'ct,'pp,'ep}:
          {                                      * 5FDBC

* refs (4): 5FE33 5FF00 5FF0F 60080
Π'ct:
            LAM     'ct                          * 5FDC1

* refs (9): 5FDF7 5FE38 5FECE 5FEDD 5FF28 5FF37 ...
Π'pp:
            LAM     'pp                          * 5FDCE

* refs (13): 5FE0B 5FE3D 5FE83 5FEC4 5FF41 5FF50 ...
Π'ep:
            LAM     'ep                          * 5FDDB
          }                                      * 5FDE8
          BIND                                   * 5FDED
          BEGIN                                  * 5FDF2
          Π'pp                                   * 5FDF7
          PICK                                   * 5FDFC
          OBJ_5FF5F                              * 5FE01
          OBJ_5FE56                              * 5FE06
          Π'ep                                   * 5FE0B
          #1+PICK                                * 5FE10
          EQUALNOTcase                           * 5FE15
          OBJ_6007B                              * 5FE1A
          OBJ_5FF23                              * 5FE1F
          OBJ_5FEFB                              * 5FE24
          UNTIL                                  * 5FE29

* refs (2): 5FEF1 60290
OBJ_5FE2E:
          ::                                     * 5FE2E
            Π'ct                                 * 5FE33
            Π'pp                                 * 5FE38
            Π'ep                                 * 5FE3D
            ABND                                 * 5FE42
            TRUE                                 * 5FE47
          ;                                      * 5FE4C
        ;                                        * 5FE51

* refs (1): 5FE06
OBJ_5FE56:
        ::                                       * 5FE56
          undo                                   * 5FE5B
          DROP                                   * 5FE60
          REQcasedrop                            * 5FE65
          NULL{}                                 * 5FE6A
          OBJ_600FD                              * 5FE6F
          REQcasedrop                            * 5FE74
          {}_600F3                               * 5FE79
          OBJ_60139                              * 5FE7E
          Π'ep                                   * 5FE83
          OBJ_6019D                              * 5FE88
          NOTcase                                * 5FE8D
          ::                                     * 5FE92
            2DROP                                * 5FE97
            COLA                                 * 5FE9C
            OBJ_6007B                            * 5FEA1
          ;                                      * 5FEA6
          SWAP                                   * 5FEAB
          BINT2                                  * 5FEB0
          NTHCOMPDROP                            * 5FEB5
          #+                                     * 5FEBA
          '                                      * 5FEBF
          Π'ep                                   * 5FEC4
          STO                                    * 5FEC9
          Π'pp                                   * 5FECE
          #1+                                    * 5FED3
          '                                      * 5FED8
          Π'pp                                   * 5FEDD
          STO                                    * 5FEE2
          OBJ_5FEFB                              * 5FEE7
          UNTIL                                  * 5FEEC
          OBJ_5FE2E                              * 5FEF1
        ;                                        * 5FEF6

* refs (3): 5FE24 5FEE7 60286
OBJ_5FEFB:
        ::                                       * 5FEFB
          Π'ct                                   * 5FF00
          #1-DUP                                 * 5FF05
          '                                      * 5FF0A
          Π'ct                                   * 5FF0F
          STO                                    * 5FF14
          #0=                                    * 5FF19
        ;                                        * 5FF1E

* refs (1): 5FE1F
OBJ_5FF23:
        ::                                       * 5FF23
          Π'pp                                   * 5FF28
          #1+                                    * 5FF2D
          '                                      * 5FF32
          Π'pp                                   * 5FF37
          STO                                    * 5FF3C
          Π'ep                                   * 5FF41
          #1+                                    * 5FF46
          '                                      * 5FF4B
          Π'ep                                   * 5FF50
          STO                                    * 5FF55
        ;                                        * 5FF5A

* refs (1): 5FE01
OBJ_5FF5F:
        ::                                       * 5FF5F
          OBJ_5FF73                              * 5FF64
          COLAcase                               * 5FF69
        ;                                        * 5FF6E

* refs (5): 5FF64 600C1 60996 609C8 60BAD
OBJ_5FF73:
        CON(5)  (*)+5                            * 5FF73  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 5FF78
        CD1EX                                    * 5FF7B
        RSTK=C                                   * 5FF7E
        A=DAT1  A                                * 5FF80
        LC(5)   DOIDNT                           * 5FF83
        ?C=A    A                                * 5FF8A
        GOYES   L_5FFAE                          * 5FF8D
        LC(5)   DOLAM                            * 5FF8F
        ?C=A    A                                * 5FF96
        GOYES   L_5FFAE                          * 5FF99
L_5FF9B:
        LA(5)   FALSE                            * 5FF9B
L_5FFA5:
        C=RSTK                                   * 5FFA5
        D1=C                                     * 5FFA7
        PC=(A)                                   * 5FFAA
L_5FFAE:
        D1=D1+  5                                * 5FFAE
        A=DAT1  B                                * 5FFB1
        A=A-1   B                                * 5FFB4
        GOC     L_5FF9B                          * 5FFB7
        D1=D1+  2                                * 5FFBA
        A=DAT1  B                                * 5FFBD
        LC(2)   #26                              * 5FFC0
        ?C#A    B                                * 5FFC4
        GOYES   L_5FF9B                          * 5FFC7
        LA(5)   TRUE                             * 5FFC9
        GONC    L_5FFA5                          * 5FFD3
        RPL

* refs (1): 60107
OBJ_5FFD6:
        ::                                       * 5FFD6
          BINT1                                  * 5FFDB
          SWAP#1+                                * 5FFE0
          BEGIN                                  * 5FFE5
          DUP#1+PICK                             * 5FFEA
          OBJ_6001C                              * 5FFEF
          SWAPDROP                               * 5FFF4
          ROT#+                                  * 5FFF9
          #1-                                    * 5FFFE
          SWAP#1+                                * 60003
          OVER#0=                                * 60008
          UNTIL                                  * 6000D
          SWAPDROP#1-                            * 60012
        ;                                        * 60017
