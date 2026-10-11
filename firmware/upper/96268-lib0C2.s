* HP 48GX ROM revision R, #96268-#98E01: Library part 0C2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #96268 in the original ROM).
        RPL

* ROMPTR 0C2 040
* refs (1): 90007
ROMP_0C2_040:
        ::                                       * 96268
          ROTOVER                                * 9626D
          OBJ_372EF                              * 96272
          SWAP3PICK                              * 96277
          3GETLAM                                * 9627C
          #+                                     * 96281
          OBJ_372EF                              * 96286
          SWAP                                   * 9628B
          5PICK                                  * 96290
          OBJ_372EF                              * 96295
          SWAP                                   * 9629A
          4UNROLL                                * 9629F
          3PICK                                  * 962A4
          %%ABS                                  * 962A9
          OVER                                   * 962AE
          %%ABS                                  * 962B3
          2DUP                                   * 962B8
          %%<                                    * 962BD
          DUP                                    * 962C2
          7UNROLL                                * 962C7
          ITE                                    * 962CC
          ::                                     * 962D1
            SWAP                                 * 962D6
            5ROLL                                * 962DB
            3UNROLL                              * 962E0
            4ROLL                                * 962E5
            5UNROLL                              * 962EA
            BINT2                                * 962EF
          ;                                      * 962F4
          BINT0                                  * 962F9
          5PICK                                  * 962FE
          %%ABS                                  * 96303
          DUPUNROT                               * 96308
          5PICK                                  * 9630D
          %%<=                                   * 96312
          ?SKIP                                  * 96317
          DROPONE                                * 9631C
          7UNROLL                                * 96321
          ::                                     * 96326
            4dropn;IU!                           * 9632B
            casedrop                             * 96330
            ::                                   * 96335
              %%1                                * 9633A
              %%0                                * 9633F
              2DUP                               * 96344
            ;                                    * 96349
            3PICKOVER                            * 9634E
            %%/                                  * 96353
            1+(rr)                               * 96358
            %%1                                  * 9635D
            EQUALcase                            * 96362
            ::                                   * 96367
              SWAPROT                            * 9636C
              3PICK3PICK                         * 96371
              %%1                                * 96376
              %%>                                * 9637B
              ITE                                * 96380
              ::                                 * 96385
                ROT                              * 9638A
                %%/                              * 9638F
                %%/                              * 96394
              ;                                  * 96399
              ::                                 * 9639E
                %%/                              * 963A3
                %%*                              * 963A8
              ;                                  * 963AD
              %%1                                * 963B2
              4PICK                              * 963B7
              6PICK                              * 963BC
              %%/                                * 963C1
              7PICK                              * 963C6
              7PICK                              * 963CB
              %%/                                * 963D0
              %%1                                * 963D5
            ;                                    * 963DA
            DROP                                 * 963DF
            2DUP                                 * 963E4
            %%-                                  * 963E9
            3PICK                                * 963EE
            %%/                                  * 963F3
            5PICK                                * 963F8
            7PICK                                * 963FD
            %%/                                  * 96402
            %%2                                  * 96407
            3PICK                                * 9640C
            %%-                                  * 96411
            OVERDUP                              * 96416
            %%*                                  * 9641B
            OVERDUP                              * 96420
            %%*                                  * 96425
            OVER                                 * 9642A
            %%+                                  * 9642F
            %%SQRT                               * 96434
            SWAP                                 * 96439
            5PICK                                * 9643E
            DUP                                  * 96443
            OBJ_3727E                            * 96448
            %%SQRT                               * 9644D
            2DUP                                 * 96452
            %%+                                  * 96457
            OBJ_37B30                            * 9645C
            8ROLL                                * 96461
            OVER                                 * 96466
            %%*                                  * 9646B
            8ROLL                                * 96470
            3PICK                                * 96475
            %%/                                  * 9647A
            7PICK                                * 9647F
            7ROLL                                * 96484
            7ROLL                                * 96489
            %%+                                  * 9648E
            %%/                                  * 96493
            6PICK                                * 96498
            8ROLL                                * 9649D
            7ROLL                                * 964A2
            %%+                                  * 964A7
            %%/                                  * 964AC
            %%+                                  * 964B1
            4PICK                                * 964B6
            1+(rr)                               * 964BB
            %%*                                  * 964C0
            %%4                                  * 964C5
            OVERDUP                              * 964CA
            OBJ_3727E                            * 964CF
            %%SQRT                               * 964D4
            %%2                                  * 964D9
            OVER                                 * 964DE
            %%/                                  * 964E3
            3UNROLL                              * 964E8
            %%/                                  * 964ED
            2DUP                                 * 964F2
            8ROLL                                * 964F7
            OBJ_3727E                            * 964FC
            6PICK                                * 96501
            %%/                                  * 96506
            7PICK                                * 9650B
            BINT10                               * 96510
            PICK                                 * 96515
            %%/                                  * 9651A
            3PICK                                * 9651F
            %%*                                  * 96524
            7ROLL                                * 96529
            %%/                                  * 9652E
            2SWAP                                * 96533
          ;                                      * 96538
          BINT11                                 * 9653D
          ROLL                                   * 96542
          IT                                     * 96547
          ::                                     * 9654C
            BINT9                                * 96551
            ROLL                                 * 96556
            7UNROLL                              * 9655B
            8ROLL                                * 96560
            9rolld                               * 96565
            4UNROLL                              * 9656A
            SWAPROT                              * 9656F
          ;                                      * 96574
          6ROLL                                  * 96579
          6ROLL                                  * 9657E
          BINT10                                 * 96583
          ROLL                                   * 96588
          DUP#0=                                 * 9658D
          ITE                                    * 96592
          ::                                     * 96597
            DROP                                 * 9659C
            4PICK                                * 965A1
            OBJ_36C2A                            * 965A6
            6PICK                                * 965AB
            OBJ_36C2A                            * 965B0
            BINT9                                * 965B5
            PICK                                 * 965BA
            OBJ_36C2A                            * 965BF
          ;                                      * 965C4
          ::                                     * 965C9
            #1=case                              * 965CE
            ::                                   * 965D3
              3PICK                              * 965D8
              OBJ_36C2A                          * 965DD
              6PICK                              * 965E2
              OBJ_36C2A                          * 965E7
              8PICK                              * 965EC
              OBJ_36C2A                          * 965F1
            ;                                    * 965F6
            3PICK                                * 965FB
            OBJ_36C2A                            * 96600
            5PICK                                * 96605
            OBJ_36C2A                            * 9660A
            7PICK                                * 9660F
            OBJ_36C2A                            * 96614
          ;                                      * 96619
          8ROLL                                  * 9661E
          DROP                                   * 96623
          7ROLL                                  * 96628
          OBJ_36BD5                              * 9662D
          7ROLL                                  * 96632
          OBJ_36BD5                              * 96637
          7ROLL                                  * 9663C
          SWAP                                   * 96641
          BINT9                                  * 96646
          PICK                                   * 9664B
          OBJ_37361                              * 96650
          SWAP                                   * 96655
          7PICK                                  * 9665A
          OBJ_37361                              * 9665F
          %%0                                    * 96664
          7PICK                                  * 96669
          3GETLAM                                * 9666E
          #+                                     * 96673
          OBJ_37361                              * 96678
          7UNROLL                                * 9667D
          BINT9                                  * 96682
          PICK                                   * 96687
          3UNROLL                                * 9668C
          6PICK                                  * 96691
          1GETLAM                                * 96696
          11GETLAM                               * 9669B
          EVAL                                   * 966A0
          6PICK                                  * 966A5
          3UNROLL                                * 966AA
          4ROLL                                  * 966AF
          2GETLAM                                * 966B4
          10GETLAM                               * 966B9
          EVAL                                   * 966BE
          #2-                                    * 966C3
        ;                                        * 966C8

* ROMPTR 0C2 041
* refs (1): 90007
ROMP_0C2_041:
        ::                                       * 966CD
          ROT                                    * 966D2
          3PICK                                  * 966D7
          OBJ_372EF                              * 966DC
          %%ABS                                  * 966E1
          %%1E-13                                * 966E6
          %%*                                    * 966EB
          SWAP                                   * 966F0
          4PICK                                  * 966F5
          3GETLAM                                * 966FA
          #1-+                                   * 966FF
          OBJ_372EF                              * 96704
          %%ABS                                  * 96709
          ROT                                    * 9670E
          %%<=                                   * 96713
          case                                   * 96718
          ::                                     * 9671D
            %%0                                  * 96722
            4PICK                                * 96727
            3GETLAM                              * 9672C
            #1-+                                 * 96731
            OBJ_37361                            * 96736
            3UNROLL                              * 9673B
            TRUE                                 * 96740
          ;                                      * 96745
          OVER                                   * 9674A
          OBJ_372EF                              * 9674F
          %%ABS                                  * 96754
          DUP                                    * 96759
          4PICK                                  * 9675E
          BEGIN                                  * 96763
          OBJ_357F0                              * 96768
          4ROLLOVER                              * 9676D
          3GETLAM                                * 96772
          #+                                     * 96777
          OBJ_372EF                              * 9677C
          %%ABS                                  * 96781
          DUP                                    * 96786
          6PICK                                  * 9678B
          %%3E-13                                * 96790
          %%*                                    * 96795
          %%<=                                   * 9679A
          casedrop                               * 9679F
          ::                                     * 967A4
            RDROP                                * 967A9
            OBJ_37B03                            * 967AE
            %%0                                  * 967B3
            ROT                                  * 967B8
            3GETLAM                              * 967BD
            #+                                   * 967C2
            OBJ_37361                            * 967C7
            3UNROLL                              * 967CC
            TRUE                                 * 967D1
          ;                                      * 967D6
          5ROLL                                  * 967DB
          DUPUNROT                               * 967E0
          %%+                                    * 967E5
          %%/                                    * 967EA
          SWAP3PICK                              * 967EF
          #1+                                    * 967F4
          OBJ_372EF                              * 967F9
          %%ABS                                  * 967FE
          ROT                                    * 96803
          %%*                                    * 96808
          4ROLLOVER                              * 9680D
          OBJ_37DA0                              * 96812
          4ROLL                                  * 96817
          #1+                                    * 9681C
          6PICK                                  * 96821
          OVER#=                                 * 96826
          UNTIL                                  * 9682B
          DROPSWAPDROP                           * 96830
          SWAP                                   * 96835
          4UNROLL                                * 9683A
          FALSE                                  * 9683F
        ;                                        * 96844

* ROMPTR 0C2 042
* refs (1): 90007
ROMP_0C2_042:
        ::                                       * 96849
          ROTOVER                                * 9684E
          OBJ_372EF                              * 96853
          %%ABS                                  * 96858
          %%1E-13                                * 9685D
          %%*                                    * 96862
          SWAP3PICK                              * 96867
          3GETLAM                                * 9686C
          #+                                     * 96871
          OBJ_372EF                              * 96876
          %%ABS                                  * 9687B
          ROT                                    * 96880
          %%<=                                   * 96885
          case                                   * 9688A
          ::                                     * 9688F
            %%0                                  * 96894
            3PICK                                * 96899
            3GETLAM                              * 9689E
            #+                                   * 968A3
            OBJ_37361                            * 968A8
            3UNROLL                              * 968AD
            TRUE                                 * 968B2
          ;                                      * 968B7
          3PICK                                  * 968BC
          OBJ_372EF                              * 968C1
          %%ABS                                  * 968C6
          DUP                                    * 968CB
          5PICK                                  * 968D0
          BEGIN                                  * 968D5
          OBJ_357F0                              * 968DA
          #1-                                    * 968DF
          4ROLLOVER                              * 968E4
          3GETLAM                                * 968E9
          #+                                     * 968EE
          OBJ_372EF                              * 968F3
          %%ABS                                  * 968F8
          DUP                                    * 968FD
          6PICK                                  * 96902
          %%3E-13                                * 96907
          %%*                                    * 9690C
          %%<=                                   * 96911
          casedrop                               * 96916
          ::                                     * 9691B
            RDROP                                * 96920
            OBJ_37B03                            * 96925
            %%0                                  * 9692A
            ROT                                  * 9692F
            3GETLAM                              * 96934
            #+                                   * 96939
            OBJ_37361                            * 9693E
            3UNROLL                              * 96943
            TRUE                                 * 96948
          ;                                      * 9694D
          5ROLL                                  * 96952
          DUPUNROT                               * 96957
          %%+                                    * 9695C
          %%/                                    * 96961
          SWAP3PICK                              * 96966
          OBJ_372EF                              * 9696B
          %%ABS                                  * 96970
          ROT                                    * 96975
          %%*                                    * 9697A
          4ROLLOVER                              * 9697F
          OBJ_37DA0                              * 96984
          4ROLL                                  * 96989
          5PICK                                  * 9698E
          OVER#=                                 * 96993
          UNTIL                                  * 96998
          DROPSWAPDROP                           * 9699D
          SWAP                                   * 969A2
          4UNROLL                                * 969A7
          FALSE                                  * 969AC
        ;                                        * 969B1

* ROMPTR 0C2 043
* refs (1): 90007
ROMP_0C2_043:
        ::                                       * 969B6
          8GETLAM                                * 969BB
          %%/                                    * 969C0
          3GETLAM                                * 969C5
          UNCOERCE%%                             * 969CA
          %%*                                    * 969CF
          %%      1E-2                           * 969D4
          %%<=                                   * 969EE
          case                                   * 969F3
          %%0                                    * 969F8
          7GETLAM                                * 969FD
          ITE                                    * 96A02
          ::                                     * 96A07
            6GETLAM                              * 96A0C
            OBJ_372EF                            * 96A11
            %%ABS                                * 96A16
            OVER                                 * 96A1B
            5GETLAM                              * 96A20
            #1-                                  * 96A25
            OBJ_372EF                            * 96A2A
            SWAP                                 * 96A2F
            5GETLAM                              * 96A34
            3GETLAM                              * 96A39
            #1-+                                 * 96A3E
            OBJ_372EF                            * 96A43
            SWAP                                 * 96A48
            5GETLAM                              * 96A4D
            OBJ_372EF                            * 96A52
          ;                                      * 96A57
          ::                                     * 96A5C
            5GETLAM                              * 96A61
            OBJ_372EF                            * 96A66
            %%ABS                                * 96A6B
            OVER                                 * 96A70
            6GETLAM                              * 96A75
            OBJ_372EF                            * 96A7A
            SWAP                                 * 96A7F
            6GETLAM                              * 96A84
            3GETLAM                              * 96A89
            #+                                   * 96A8E
            OBJ_372EF                            * 96A93
            SWAP                                 * 96A98
            6GETLAM                              * 96A9D
            #1+                                  * 96AA2
            OBJ_372EF                            * 96AA7
          ;                                      * 96AAC
          SWAPDROP                               * 96AB1
          SWAP                                   * 96AB6
          %%ABS                                  * 96ABB
          ROT                                    * 96AC0
          %%ABS                                  * 96AC5
          ROT                                    * 96ACA
          %%ABS                                  * 96ACF
          2DUP                                   * 96AD4
          OBJ_37DA0                              * 96AD9
          3UNROLL                                * 96ADE
          ::                                     * 96AE3
            3PICK                                * 96AE8
            %%0=                                 * 96AED
            case2drop                            * 96AF2
            SWAPDROP                             * 96AF7
            %%MAX                                * 96AFC
            2DUP                                 * 96B01
            %%/                                  * 96B06
            1+(rr)                               * 96B0B
            OVER                                 * 96B10
            4PICK                                * 96B15
            %%-                                  * 96B1A
            3PICK                                * 96B1F
            %%/                                  * 96B24
            5ROLL                                * 96B29
            4ROLL                                * 96B2E
            %%/                                  * 96B33
            DUP                                  * 96B38
            %%*                                  * 96B3D
            ROTDUP                               * 96B42
            %%*                                  * 96B47
            OVER                                 * 96B4C
            %%+                                  * 96B51
            %%SQRT                               * 96B56
            SWAPROT                              * 96B5B
            DUP                                  * 96B60
            OBJ_3727E                            * 96B65
            %%SQRT                               * 96B6A
            %%+                                  * 96B6F
            %%/                                  * 96B74
            DUP                                  * 96B79
            %%+                                  * 96B7E
          ;                                      * 96B83
          OVER                                   * 96B88
          %%0=                                   * 96B8D
          case                                   * 96B92
          SWAPDROP                               * 96B97
          DUPROT                                 * 96B9C
          %%/                                    * 96BA1
          DUP                                    * 96BA6
          %%*                                    * 96BAB
          %%1E-14                                * 96BB0
          %%<                                    * 96BB5
          casedrop                               * 96BBA
          %%0                                    * 96BBF
        ;                                        * 96BC4

* ROMPTR 0C2 044
* refs (1): 90007
ROMP_0C2_044:
        ::                                       * 96BC9
          6GETLAM                                * 96BCE
          DUP                                    * 96BD3
          3GETLAM                                * 96BD8
          #+                                     * 96BDD
          4ROLL                                  * 96BE2
          3PICK                                  * 96BE7
          OBJ_372EF                              * 96BEC
          DUP                                    * 96BF1
          %%ABS                                  * 96BF6
          6PICK                                  * 96BFB
          %%-                                    * 96C00
          6ROLL                                  * 96C05
          3PICK                                  * 96C0A
          %%/                                    * 96C0F
          ROT                                    * 96C14
          OBJ_37AC2                              * 96C19
          %%+                                    * 96C1E
          %%*                                    * 96C23
          SWAP3PICK                              * 96C28
          OBJ_372EF                              * 96C2D
          ROTSWAP                                * 96C32
          BEGIN                                  * 96C37
          9GETLAM                                * 96C3C
          EVAL                                   * 96C41
          4ROLLSWAP                              * 96C46
          6PICK                                  * 96C4B
          6GETLAM                                * 96C50
          #>                                     * 96C55
          ITE                                    * 96C5A
          ::                                     * 96C5F
            5PICK                                * 96C64
            #1-                                  * 96C69
            OBJ_37361                            * 96C6E
          ;                                      * 96C73
          DROP                                   * 96C78
          5PICK                                  * 96C7D
          OBJ_372EF                              * 96C82
          SWAP                                   * 96C87
          5PICK                                  * 96C8C
          OBJ_372EF                              * 96C91
          DUPUNROT                               * 96C96
          6PICK                                  * 96C9B
          %%*                                    * 96CA0
          4PICK                                  * 96CA5
          6PICK                                  * 96CAA
          OBJ_372BC                              * 96CAF
          7PICK                                  * 96CB4
          OBJ_37361                              * 96CB9
          ROT                                    * 96CBE
          5PICK                                  * 96CC3
          %%*ROT                                 * 96CC8
          4PICK                                  * 96CCD
          OBJ_3727E                              * 96CD2
          SWAP                                   * 96CD7
          6PICK                                  * 96CDC
          #1+                                    * 96CE1
          OBJ_372EF                              * 96CE6
          DUPUNROT                               * 96CEB
          6PICK                                  * 96CF0
          %%*                                    * 96CF5
          8PICK                                  * 96CFA
          #1+                                    * 96CFF
          OBJ_37361                              * 96D04
          5UNROLL                                * 96D09
          3PICK                                  * 96D0E
          %%*                                    * 96D13
          BINT9                                  * 96D18
          PICK                                   * 96D1D
          5ROLL                                  * 96D22
          5ROLL                                  * 96D27
          8PICK                                  * 96D2C
          1GETLAM                                * 96D31
          11GETLAM                               * 96D36
          EVAL                                   * 96D3B
          9GETLAM                                * 96D40
          EVAL                                   * 96D45
          4ROLLSWAP                              * 96D4A
          6PICK                                  * 96D4F
          OBJ_37361                              * 96D54
          4PICK                                  * 96D59
          OBJ_372EF                              * 96D5E
          SWAP                                   * 96D63
          6PICK                                  * 96D68
          #1+                                    * 96D6D
          OBJ_372EF                              * 96D72
          DUPUNROT                               * 96D77
          6PICK                                  * 96D7C
          %%*                                    * 96D81
          4PICK                                  * 96D86
          6PICK                                  * 96D8B
          OBJ_372BC                              * 96D90
          8PICK                                  * 96D95
          #1+                                    * 96D9A
          OBJ_37361                              * 96D9F
          ROT                                    * 96DA4
          5PICK                                  * 96DA9
          %%*ROT                                 * 96DAE
          4PICK                                  * 96DB3
          OBJ_3727E                              * 96DB8
          6PICK                                  * 96DBD
          #1+                                    * 96DC2
          5GETLAM                                * 96DC7
          #=                                     * 96DCC
          ITE                                    * 96DD1
          ::                                     * 96DD6
            DUPUNROT                             * 96DDB
            6PICK                                * 96DE0
            OBJ_37361                            * 96DE5
            4UNROLL                              * 96DEA
            %%0                                  * 96DEF
          ;                                      * 96DF4
          ::                                     * 96DF9
            SWAP                                 * 96DFE
            5PICK                                * 96E03
            #1+                                  * 96E08
            OBJ_372EF                            * 96E0D
            DUPUNROT                             * 96E12
            6PICK                                * 96E17
            %%*                                  * 96E1C
            7PICK                                * 96E21
            #1+                                  * 96E26
            OBJ_37361                            * 96E2B
            5UNROLL                              * 96E30
            3PICK                                * 96E35
            %%*                                  * 96E3A
          ;                                      * 96E3F
          8PICK                                  * 96E44
          5ROLL                                  * 96E49
          5ROLL                                  * 96E4E
          8PICK                                  * 96E53
          2GETLAM                                * 96E58
          10GETLAM                               * 96E5D
          EVAL                                   * 96E62
          5ROLL                                  * 96E67
          #1+                                    * 96E6C
          5UNROLL                                * 96E71
          4ROLL                                  * 96E76
          #1+                                    * 96E7B
          4UNROLL                                * 96E80
          5PICK                                  * 96E85
          5GETLAM                                * 96E8A
          #=                                     * 96E8F
          UNTIL                                  * 96E94
          5ROLL                                  * 96E99
          2DROP                                  * 96E9E
          ROT                                    * 96EA3
          #1-                                    * 96EA8
          SWAP                                   * 96EAD
        ;                                        * 96EB2

* ROMPTR 0C2 045
* refs (1): 90007
ROMP_0C2_045:
        ::                                       * 96EB7
          5GETLAM                                * 96EBC
          DUP                                    * 96EC1
          3GETLAM                                * 96EC6
          #1-+                                   * 96ECB
          4ROLL                                  * 96ED0
          3PICK                                  * 96ED5
          OBJ_372EF                              * 96EDA
          DUP                                    * 96EDF
          %%ABS                                  * 96EE4
          6PICK                                  * 96EE9
          %%-                                    * 96EEE
          6ROLL                                  * 96EF3
          3PICK                                  * 96EF8
          %%/                                    * 96EFD
          ROT                                    * 96F02
          OBJ_37AC2                              * 96F07
          %%+                                    * 96F0C
          %%*                                    * 96F11
          SWAP3PICK                              * 96F16
          OBJ_372EF                              * 96F1B
          ROTSWAP                                * 96F20
          BEGIN                                  * 96F25
          9GETLAM                                * 96F2A
          EVAL                                   * 96F2F
          4ROLLSWAP                              * 96F34
          6PICK                                  * 96F39
          5GETLAM                                * 96F3E
          #<                                     * 96F43
          ITE                                    * 96F48
          ::                                     * 96F4D
            5PICK                                * 96F52
            #1+                                  * 96F57
            OBJ_37361                            * 96F5C
          ;                                      * 96F61
          DROP                                   * 96F66
          5PICK                                  * 96F6B
          OBJ_372EF                              * 96F70
          SWAP                                   * 96F75
          5PICK                                  * 96F7A
          OBJ_372EF                              * 96F7F
          DUPUNROT                               * 96F84
          6PICK                                  * 96F89
          %%*                                    * 96F8E
          4PICK                                  * 96F93
          6PICK                                  * 96F98
          OBJ_372BC                              * 96F9D
          7PICK                                  * 96FA2
          OBJ_37361                              * 96FA7
          ROT                                    * 96FAC
          5PICK                                  * 96FB1
          %%*ROT                                 * 96FB6
          4PICK                                  * 96FBB
          OBJ_3727E                              * 96FC0
          SWAP                                   * 96FC5
          6PICK                                  * 96FCA
          #1-                                    * 96FCF
          OBJ_372EF                              * 96FD4
          DUPUNROT                               * 96FD9
          6PICK                                  * 96FDE
          %%*                                    * 96FE3
          8PICK                                  * 96FE8
          #1-                                    * 96FED
          OBJ_37361                              * 96FF2
          5UNROLL                                * 96FF7
          3PICK                                  * 96FFC
          %%*                                    * 97001
          8PICK                                  * 97006
          5ROLL                                  * 9700B
          5ROLL                                  * 97010
          %%CHS                                  * 97015
          8PICK                                  * 9701A
          #1-                                    * 9701F
          2GETLAM                                * 97024
          10GETLAM                               * 97029
          EVAL                                   * 9702E
          9GETLAM                                * 97033
          EVAL                                   * 97038
          4ROLLSWAP                              * 9703D
          6PICK                                  * 97042
          OBJ_37361                              * 97047
          4PICK                                  * 9704C
          OBJ_372EF                              * 97051
          SWAP                                   * 97056
          6PICK                                  * 9705B
          #1-                                    * 97060
          OBJ_372EF                              * 97065
          DUPUNROT                               * 9706A
          6PICK                                  * 9706F
          %%*                                    * 97074
          4PICK                                  * 97079
          6PICK                                  * 9707E
          OBJ_372BC                              * 97083
          8PICK                                  * 97088
          #1-                                    * 9708D
          OBJ_37361                              * 97092
          ROT                                    * 97097
          5PICK                                  * 9709C
          %%*ROT                                 * 970A1
          4PICK                                  * 970A6
          OBJ_3727E                              * 970AB
          6PICK                                  * 970B0
          6GETLAM                                * 970B5
          #1+                                    * 970BA
          #=                                     * 970BF
          ITE                                    * 970C4
          ::                                     * 970C9
            DUPUNROT                             * 970CE
            6PICK                                * 970D3
            OBJ_37361                            * 970D8
            4UNROLL                              * 970DD
            %%0                                  * 970E2
          ;                                      * 970E7
          ::                                     * 970EC
            SWAP                                 * 970F1
            5PICK                                * 970F6
            #1-                                  * 970FB
            OBJ_372EF                            * 97100
            DUPUNROT                             * 97105
            6PICK                                * 9710A
            %%*                                  * 9710F
            7PICK                                * 97114
            #1-                                  * 97119
            OBJ_37361                            * 9711E
            5UNROLL                              * 97123
            3PICK                                * 97128
            %%*                                  * 9712D
          ;                                      * 97132
          BINT9                                  * 97137
          PICK                                   * 9713C
          5ROLL                                  * 97141
          5ROLL                                  * 97146
          %%CHS                                  * 9714B
          8PICK                                  * 97150
          #1-                                    * 97155
          1GETLAM                                * 9715A
          11GETLAM                               * 9715F
          EVAL                                   * 97164
          5ROLL                                  * 97169
          #1-                                    * 9716E
          5UNROLL                                * 97173
          4ROLL                                  * 97178
          #1-                                    * 9717D
          4UNROLL                                * 97182
          5PICK                                  * 97187
          6GETLAM                                * 9718C
          #=                                     * 97191
          UNTIL                                  * 97196
          5ROLL                                  * 9719B
          2DROP                                  * 971A0
          ROT                                    * 971A5
          #1+SWAP                                * 971AA
        ;                                        * 971AF

* ROMPTR 0C2 046
* refs (1): 90007
ROMP_0C2_046:
        ::                                       * 971B4
          %%1                                    * 971B9
          %%1                                    * 971BE
          %%0                                    * 971C3
          6GETLAM                                * 971C8
          DUP                                    * 971CD
          3GETLAM                                * 971D2
          #+                                     * 971D7
          BEGIN                                  * 971DC
          6ROLL                                  * 971E1
          OVER                                   * 971E6
          OBJ_372EF                              * 971EB
          SWAP                                   * 971F0
          4PICK                                  * 971F5
          OBJ_372EF                              * 971FA
          8ROLL                                  * 971FF
          %%*ROT                                 * 97204
          9GETLAM                                * 97209
          EVAL                                   * 9720E
          4ROLL                                  * 97213
          7ROLL                                  * 97218
          7PICK                                  * 9721D
          6GETLAM                                * 97222
          #>                                     * 97227
          ITE                                    * 9722C
          ::                                     * 97231
            3PICK                                * 97236
            %%*                                  * 9723B
            6PICK                                * 97240
            #1-                                  * 97245
            OBJ_37361                            * 9724A
          ;                                      * 9724F
          DROP                                   * 97254
          6PICK                                  * 97259
          #1+                                    * 9725E
          OBJ_372EF                              * 97263
          4PICK                                  * 97268
          %%*                                    * 9726D
          ROT                                    * 97272
          8ROLL                                  * 97277
          %%*SWAP                                * 9727C
          9GETLAM                                * 97281
          EVAL                                   * 97286
          4ROLLSWAP                              * 9728B
          8PICK                                  * 97290
          OBJ_37361                              * 97295
          BINT9                                  * 9729A
          PICK                                   * 9729F
          6PICK                                  * 972A4
          6ROLL                                  * 972A9
          BINT9                                  * 972AE
          PICK                                   * 972B3
          1GETLAM                                * 972B8
          11GETLAM                               * 972BD
          EVAL                                   * 972C2
          7PICK                                  * 972C7
          2OVER                                  * 972CC
          BINT9                                  * 972D1
          PICK                                   * 972D6
          2GETLAM                                * 972DB
          10GETLAM                               * 972E0
          EVAL                                   * 972E5
          6UNROLL                                * 972EA
          5ROLL                                  * 972EF
          #1+                                    * 972F4
          5ROLL                                  * 972F9
          #1+                                    * 972FE
          OVER                                   * 97303
          5GETLAM                                * 97308
          #=                                     * 9730D
          UNTIL                                  * 97312
          #1-                                    * 97317
        ;                                        * 9731C

* ROMPTR 0C2 047
* refs (1): 90007
ROMP_0C2_047:
        ::                                       * 97321
          %%1                                    * 97326
          %%1                                    * 9732B
          %%0                                    * 97330
          5GETLAM                                * 97335
          DUP                                    * 9733A
          3GETLAM                                * 9733F
          #1-+                                   * 97344
          BEGIN                                  * 97349
          6ROLL                                  * 9734E
          OVER                                   * 97353
          OBJ_372EF                              * 97358
          SWAP                                   * 9735D
          4PICK                                  * 97362
          OBJ_372EF                              * 97367
          8ROLL                                  * 9736C
          %%*ROT                                 * 97371
          9GETLAM                                * 97376
          EVAL                                   * 9737B
          4ROLL                                  * 97380
          7ROLL                                  * 97385
          7PICK                                  * 9738A
          5GETLAM                                * 9738F
          #<                                     * 97394
          ITE                                    * 97399
          ::                                     * 9739E
            3PICK                                * 973A3
            %%*                                  * 973A8
            6PICK                                * 973AD
            #1+                                  * 973B2
            OBJ_37361                            * 973B7
          ;                                      * 973BC
          DROP                                   * 973C1
          6PICK                                  * 973C6
          #1-                                    * 973CB
          OBJ_372EF                              * 973D0
          4PICK                                  * 973D5
          %%*                                    * 973DA
          ROT                                    * 973DF
          8ROLL                                  * 973E4
          %%*SWAP                                * 973E9
          9GETLAM                                * 973EE
          EVAL                                   * 973F3
          4ROLLSWAP                              * 973F8
          8PICK                                  * 973FD
          OBJ_37361                              * 97402
          8PICK                                  * 97407
          6PICK                                  * 9740C
          6ROLL                                  * 97411
          %%CHS                                  * 97416
          BINT9                                  * 9741B
          PICK                                   * 97420
          #1-                                    * 97425
          2GETLAM                                * 9742A
          10GETLAM                               * 9742F
          EVAL                                   * 97434
          8PICK                                  * 97439
          2OVER                                  * 9743E
          %%CHS                                  * 97443
          BINT9                                  * 97448
          PICK                                   * 9744D
          #1-                                    * 97452
          1GETLAM                                * 97457
          11GETLAM                               * 9745C
          EVAL                                   * 97461
          6UNROLL                                * 97466
          5ROLL                                  * 9746B
          #1-                                    * 97470
          5ROLL                                  * 97475
          #1-                                    * 9747A
          OVER                                   * 9747F
          6GETLAM                                * 97484
          #=                                     * 97489
          UNTIL                                  * 9748E
          #1+                                    * 97493
        ;                                        * 97498

* ROMPTR 0C2 048
* refs (1): 90007
ROMP_0C2_048:
        ::                                       * 9749D
          OBJ_357F0                              * 974A2
          5PICK                                  * 974A7
          case                                   * 974AC
          5DROP                                  * 974B1
          4PICK                                  * 974B6
          %%1                                    * 974BB
          EQUAL                                  * 974C0
          4PICK                                  * 974C5
          %%0=                                   * 974CA
          ANDcase                                * 974CF
          5DROP                                  * 974D4
          5ROLL                                  * 974D9
          3UNROLL                                * 974DE
          ZERO_DO                                * 974E3
          DUPUNROT                               * 974E8
          OBJ_372EF                              * 974ED
          SWAP3PICK                              * 974F2
          #1+                                    * 974F7
          OBJ_372EF                              * 974FC
          DUPUNROT                               * 97501
          6PICK                                  * 97506
          L%*                                    * 9750B
          4PICK                                  * 97510
          8PICK                                  * 97515
          L%*                                    * 9751A
          L%+                                    * 9751F
          5PICK                                  * 97524
          OBJ_37361                              * 97529
          SWAP                                   * 9752E
          6PICK                                  * 97533
          L%*                                    * 97538
          ROT                                    * 9753D
          5PICK                                  * 97542
          L%*                                    * 97547
          L%-                                    * 9754C
          3PICK                                  * 97551
          #1+                                    * 97556
          OBJ_37361                              * 9755B
          SWAP                                   * 97560
          ISTOP@                                 * 97565
          #+                                     * 9756A
          NextInArray                            * 9756F
          4DROP                                  * 97574
        ;                                        * 97579

* ROMPTR 0C2 049
* refs (1): 90007
ROMP_0C2_049:
        ::                                       * 9757E
          OBJ_357F0                              * 97583
          5PICK                                  * 97588
          case                                   * 9758D
          5DROP                                  * 97592
          4PICK                                  * 97597
          %%1                                    * 9759C
          EQUAL                                  * 975A1
          4PICK                                  * 975A6
          %%0=                                   * 975AB
          ANDcase                                * 975B0
          5DROP                                  * 975B5
          5ROLL                                  * 975BA
          SWAPROT                                * 975BF
          #1-                                    * 975C4
          OVER                                   * 975C9
          #*                                     * 975CE
          #1+SWAP                                * 975D3
          ZERO_DO                                * 975D8
          DUPUNROT                               * 975DD
          OBJ_372EF                              * 975E2
          SWAP3PICK                              * 975E7
          ISTOP@                                 * 975EC
          #+                                     * 975F1
          OBJ_372EF                              * 975F6
          DUPUNROT                               * 975FB
          6PICK                                  * 97600
          L%*                                    * 97605
          4PICK                                  * 9760A
          8PICK                                  * 9760F
          L%*                                    * 97614
          L%+                                    * 97619
          5PICK                                  * 9761E
          OBJ_37361                              * 97623
          SWAP                                   * 97628
          6PICK                                  * 9762D
          L%*                                    * 97632
          ROT                                    * 97637
          5PICK                                  * 9763C
          L%*                                    * 97641
          L%-                                    * 97646
          3PICK                                  * 9764B
          ISTOP@                                 * 97650
          #+                                     * 97655
          OBJ_37361                              * 9765A
          SWAP#1+                                * 9765F
          NextInArray                            * 97664
          4DROP                                  * 97669
        ;                                        * 9766E

* ROMPTR 0C2 04A
* refs (1): 90007
ROMP_0C2_04A:
        ::                                       * 97673
          3GETLAM                                * 97678
          #1+_ONE_DO                             * 9767D
          INDEX@                                 * 97682
          DUPUNROT                               * 97687
          OBJ_372EF                              * 9768C
          DUP                                    * 97691
          %%0>=                                  * 97696
          ITE                                    * 9769B
          DROPSWAPDROP                           * 976A0
          ::                                     * 976A5
            %%CHS                                * 976AA
            3PICK                                * 976AF
            OBJ_37361                            * 976B4
            4PICK                                * 976B9
            case                                 * 976BE
            SWAPDROP                             * 976C3
            4ROLLROT                             * 976C8
            1GETLAM                              * 976CD
            #*                                   * 976D2
            #1+                                  * 976D7
            DUP                                  * 976DC
            1GETLAM                              * 976E1
            #-                                   * 976E6
            DO                                   * 976EB
            INDEX@                               * 976F0
            OBJ_372EF                            * 976F5
            C%%CHS                               * 976FA
            INDEX@                               * 976FF
            OBJ_37361                            * 97704
            NextInArray                          * 97709
            3UNROLL                              * 9770E
          ;                                      * 97713
          NextInArray                            * 97718
          3GETLAM                                * 9771D
          #1=                                    * 97722
          ?SEMI                                  * 97727
          3GETLAM                                * 9772C
          BEGIN                                  * 97731
          BINT1                                  * 97736
          ROT                                    * 9773B
          BINT1                                  * 97740
          OBJ_372EF                              * 97745
          SWAP                                   * 9774A
          4PICK                                  * 9774F
          #1+                                    * 97754
          BINT2                                  * 97759
          DO                                     * 9775E
          INDEX@                                 * 97763
          OBJ_372EF                              * 97768
          3PICKOVER                              * 9776D
          %%<                                    * 97772
          ITE                                    * 97777
          DROP                                   * 9777C
          ::                                     * 97781
            OBJ_37B03                            * 97786
            INDEX@                               * 9778B
            SWAPROT                              * 97790
          ;                                      * 97795
          NextInArray                            * 9779A
          2OVER                                  * 9779F
          #=                                     * 977A4
          ITE                                    * 977A9
          ::                                     * 977AE
            4UNROLL                              * 977B3
            2DROP                                * 977B8
          ;                                      * 977BD
          ::                                     * 977C2
            4PICK                                * 977C7
            OBJ_372EF                            * 977CC
            4PICK                                * 977D1
            OBJ_37361                            * 977D6
            SWAP                                 * 977DB
            4PICK                                * 977E0
            OBJ_37361                            * 977E5
            5UNROLL                              * 977EA
            3PICK                                * 977EF
            ?SKIP                                * 977F4
            OBJ_375A7                            * 977F9
            ROT                                  * 977FE
            5UNROLL                              * 97803
            3PICK                                * 97808
            ?SKIP                                * 9780D
            SWAPCOLUMNS                          * 97812
            DROP                                 * 97817
            SWAP                                 * 9781C
            4UNROLL                              * 97821
          ;                                      * 97826
          #1-                                    * 9782B
          DUP#1=                                 * 97830
          UNTIL                                  * 97835
          DROP                                   * 9783A
        ;                                        * 9783F

* ROMPTR 0C2 04B
* refs (1): 90007
ROMP_0C2_04B:
        ::                                       * 97844
          ONEONE                                 * 97849
          ONEONE                                 * 9784E
          ONEONE                                 * 97853
          ONEONE                                 * 97858
          RESOROMP                               * 9785D
          ROMPTR  0C2 049                        * 97862
          RESOROMP                               * 9786D
          ROMPTR  0C2 048                        * 97872
          RESOROMP                               * 9787D
          ROMPTR  0C2 03E                        * 97882
          BINT1                                  * 9788D
          RESOROMP                               * 97892
          ROMPTR  0C2 03D                        * 97897
          RESOROMP                               * 978A2
          ROMPTR  0C2 03C                        * 978A7
          RESOROMP                               * 978B2
          ROMPTR  0C2 008                        * 978B7
          RESOROMP                               * 978C2
          ROMPTR  0C2 03B                        * 978C7
          BINT17                                 * 978D2
          ROLL                                   * 978D7
          BINT18                                 * 978DC
          ROLL                                   * 978E1
          BINT18                                 * 978E6
          '                                      * 978EB
          NULLLAM                                * 978F0
          CACHE                                  * 978F5
          3GETLAM                                * 978FA
          2GETLAM                                * 978FF
          OVER                                   * 97904
          1PUTLAM                                * 97909
          #MIN                                   * 9790E
          3PUTLAM                                * 97913
        ;                                        * 97918

* ROMPTR 0C2 04C
* refs (1): 90007
ROMP_0C2_04C:
        ::                                       * 9791D
          sqmat(ar)?                             * 97922
          %%0                                    * 97927
          BINT1                                  * 9792C
          ROT                                    * 97931
          #1+_ONE_DO                             * 97936
          ROTOVER                                * 9793B
          PULLLONGEL                             * 97940
          4ROLL                                  * 97945
          L%+                                    * 9794A
          ROT                                    * 9794F
          ISTOP@                                 * 97954
          #+                                     * 97959
          NextInArray                            * 9795E
          DROPSWAPDROP                           * 97963
          ToNorm(nb)                             * 97968
        ;                                        * 9796D

* ROMPTR 0C2 04D
* refs (1): 90007
ROMP_0C2_04D:
        ::                                       * 97972
          sqmat(ar)?                             * 97977
          OVER                                   * 9797C
          OBJ_36912                              * 97981
          3UNROLL                                * 97986
          3PICK                                  * 9798B
          %%0=                                   * 97990
          case                                   * 97995
          SETIVLERR                              * 9799A
          DUP#1=                                 * 9799F
          case                                   * 979A4
          ::                                     * 979A9
            3DROP                                * 979AE
            %1                                   * 979B3
          ;                                      * 979B8
          SWAP                                   * 979BD
          ROMPTR  0C2 059                        * 979C2
          SWAP                                   * 979CD
          OBJ_7CD79                              * 979D2
          ROT                                    * 979D7
          OBJ_7CEA5                              * 979DC
          4ROLL                                  * 979E1
          3UNROLL                                * 979E6
          ROMPTR  0C2 052                        * 979EB
          =0?(nb)                                * 979F6
          IT                                     * 979FB
          OBJ_5203A                              * 97A00
          RESOROMP                               * 97A05
          ROMPTR  0C2 04F                        * 97A0A
          RESOROMP                               * 97A15
          ROMPTR  0C2 058                        * 97A1A
          BINT4                                  * 97A25
          BINT1                                  * 97A2A
          %%0                                    * 97A2F
          2GETLAM                                * 97A34
          1GETABND                               * 97A39
          {                                      * 97A3E
            NULLLAM                              * 97A43
            NULLLAM                              * 97A48
            NULLLAM                              * 97A4D
            NULLLAM                              * 97A52
            NULLLAM                              * 97A57
            NULLLAM                              * 97A5C
            NULLLAM                              * 97A61
          }                                      * 97A66
          BIND                                   * 97A6B
          2GETLAM                                * 97A70
          BINT1                                  * 97A75
          {}N                                    * 97A7A
          OVER                                   * 97A7F
          OBJ_37A4F                              * 97A84
          2GETLAM                                * 97A89
          UNCOERCE%%                             * 97A8E
          L%/                                    * 97A93
          MAKEARRY                               * 97A98
          BINT1                                  * 97A9D
          OBJ_7D11B                              * 97AA2
          ROTDROP                                * 97AA7
          OBJ_7CE64                              * 97AAC
          3PUTLAM                                * 97AB1
          6GETLAM                                * 97AB6
          EVAL                                   * 97ABB
          2GETLAM                                * 97AC0
          7GETLAM                                * 97AC5
          EVAL                                   * 97ACA
          4PUTLAM                                * 97ACF
          BEGIN                                  * 97AD4
          5GETLAM                                * 97AD9
          #1-DUP                                 * 97ADE
          5PUTLAM                                * 97AE3
          #0=                                    * 97AE8
          case                                   * 97AED
          ROMPTR  0C2 04E                        * 97AF2
          DUP                                    * 97AFD
          OBJ_37A0E                              * 97B02
          OVER                                   * 97B07
          OBJ_37A4F                              * 97B0C
          4GETLAM                                * 97B11
          4ROLL                                  * 97B16
          2GETLAM                                * 97B1B
          #1+_ONE_DO                             * 97B20
          INDEX@                                 * 97B25
          3PICK                                  * 97B2A
          OVER#=                                 * 97B2F
          ITE                                    * 97B34
          4PICK                                  * 97B39
          5PICK                                  * 97B3E
          SWAP                                   * 97B43
          OBJ_37361                              * 97B48
          NextInArray                            * 97B4D
          4UNROLL3DROP                           * 97B52
          BINT1                                  * 97B57
          OBJ_7D11B                              * 97B5C
          ROTDROP                                * 97B61
          OBJ_7CE64                              * 97B66
          3GETLAM                                * 97B6B
          OVER                                   * 97B70
          3PUTLAM                                * 97B75
          %%<=                                   * 97B7A
          case                                   * 97B7F
          ROMPTR  0C2 04E                        * 97B84
          6GETLAM                                * 97B8F
          EVAL                                   * 97B94
          2GETLAM                                * 97B99
          7GETLAM                                * 97B9E
          EVAL                                   * 97BA3
          4GETLAM                                * 97BA8
          2DUP#=                                 * 97BAD
          case2drop                              * 97BB2
          ROMPTR  0C2 04E                        * 97BB7
          OVER                                   * 97BC2
          4PUTLAM                                * 97BC7
          ROTSWAP                                * 97BCC
          OBJ_372EF                              * 97BD1
          OBJ_37D69                              * 97BD6
          %%>%                                   * 97BDB
          SWAPROT                                * 97BE0
          OBJ_372EF                              * 97BE5
          %%ABS                                  * 97BEA
          %%>%                                   * 97BEF
          ROT                                    * 97BF4
          %=                                     * 97BF9
          UNTIL                                  * 97BFE

* ROMPTR 0C2 04E
* refs (1): 90007
ROMP_0C2_04E:
          ::                                     * 97C03
            RDROP                                * 97C08
            2GETLAM                              * 97C0D
            #1-                                  * 97C12
            UNCOERCE%%                           * 97C17
            OVER                                 * 97C1C
            OBJ_37A4F                            * 97C21
            OVER                                 * 97C26
            L%*                                  * 97C2B
            2GETLAM                              * 97C30
            #1+_ONE_DO                           * 97C35
            ROT                                  * 97C3A
            3PICK3PICK                           * 97C3F
            L%/                                  * 97C44
            INDEX@                               * 97C49
            OBJ_37361                            * 97C4E
            ROT                                  * 97C53
            1+(rr)                               * 97C58
            ROT                                  * 97C5D
            B%NEG                                * 97C62
            NextInArray                          * 97C67
            2DROP                                * 97C6C
            BINT1                                * 97C71
            OBJ_7D11B                            * 97C76
            ROTROT2DROP                          * 97C7B
            OBJ_7CE64                            * 97C80
            %%      6.66666666666667E-1          * 97C85
            %%*                                  * 97C9F
            2GETLAM                              * 97CA4
            UNCOERCE%%                           * 97CA9
            %%/                                  * 97CAE
            3GETLAM                              * 97CB3
            ABND                                 * 97CB8
            2DUP                                 * 97CBD
            %%>                                  * 97CC2
            ITE                                  * 97CC7
            DROPSWAPDROP                         * 97CCC
            ROTROT2DROP                          * 97CD1
            %%*                                  * 97CD6
            %%>%                                 * 97CDB
          ;                                      * 97CE0
        ;                                        * 97CE5

* ROMPTR 0C2 04F
* refs (1): 90007
ROMP_0C2_04F:
        ::                                       * 97CEA
          BINT1                                  * 97CEF
          %%0                                    * 97CF4
          ROT                                    * 97CF9
          #1+_ONE_DO                             * 97CFE
          ROT                                    * 97D03
          INDEX@                                 * 97D08
          OBJ_372EF                              * 97D0D
          %%ABS                                  * 97D12
          ROT                                    * 97D17
          2DUP                                   * 97D1C
          %%>                                    * 97D21
          ITE                                    * 97D26
          ::                                     * 97D2B
            DROP                                 * 97D30
            ROTDROP                              * 97D35
            INDEX@                               * 97D3A
            SWAP                                 * 97D3F
          ;                                      * 97D44
          ::                                     * 97D49
            SWAPDROP                             * 97D4E
            ROTSWAP                              * 97D53
          ;                                      * 97D58
          NextInArray                            * 97D5D
          DROP                                   * 97D62
        ;                                        * 97D67

* ROMPTR 0C2 050
* refs (1): 90007
ROMP_0C2_050:
        ::                                       * 97D6C
          sqmat(ar)?                             * 97D71
          SWAP                                   * 97D76
          CKREF                                  * 97D7B
          OBJ_7CD7E                              * 97D80
          ROT                                    * 97D85
          OBJ_7CEA5                              * 97D8A
          2DROP                                  * 97D8F
          OBJ_7CDE2                              * 97D94
          DUP                                    * 97D99
          TOTEMPOB                               * 97D9E
          DUP                                    * 97DA3
          OBJ_37A31                              * 97DA8
          OVER                                   * 97DAD
          OBJ_379F0                              * 97DB2
          2SWAP                                  * 97DB7
          BINT1                                  * 97DBC
          2GETLAM                                * 97DC1
          #1+_ONE_DO                             * 97DC6
          2GETLAM                                * 97DCB
          #1+_ONE_DO                             * 97DD0
          JINDEX@                                * 97DD5
          INDEX@                                 * 97DDA
          2DUP#<                                 * 97DDF
          ITE                                    * 97DE4
          ::                                     * 97DE9
            2DROP                                * 97DEE
            ROT                                  * 97DF3
            4PICK                                * 97DF8
            3PICK                                * 97DFD
            PUTEL                                * 97E02
            3UNROLL                              * 97E07
          ;                                      * 97E0C
          ::                                     * 97E11
            #=                                   * 97E16
            ITE                                  * 97E1B
            5PICK                                * 97E20
            4PICK                                * 97E25
            ROTSWAP                              * 97E2A
            3PICK                                * 97E2F
            PUTEL                                * 97E34
            SWAP                                 * 97E39
          ;                                      * 97E3E
          #1+                                    * 97E43
          NextInArray                            * 97E48
          LOOP                                   * 97E4D
          DROP                                   * 97E52
          OBJ_37B03                              * 97E57
          DUP%0CON                               * 97E5C
          @idn!(ar)                              * 97E61
          2GETLAM                                * 97E66
          ONE_DO                                 * 97E6B
          INDEX@                                 * 97E70
          1GETLAM                                * 97E75
          OBJ_36FDB                              * 97E7A
          2DUP#=                                 * 97E7F
          ?SKIP                                  * 97E84
          SWAPROWS                               * 97E89
          2DROP                                  * 97E8E
          NextInArray                            * 97E93
          ABND                                   * 97E98
        ;                                        * 97E9D

* ROMPTR 0C2 051
* refs (1): 90007
ROMP_0C2_051:
        ::                                       * 97EA2
          sqmat(ar)?                             * 97EA7
          DUP#1=                                 * 97EAC
          case                                   * 97EB1
          ::                                     * 97EB6
            PULLEL                               * 97EBB
            SWAPDROP                             * 97EC0
          ;                                      * 97EC5
          DUP                                    * 97ECA
          #2=                                    * 97ECF
          case                                   * 97ED4
          OBJ_36A53                              * 97ED9
          SWAP                                   * 97EDE
          ROMPTR  0C2 059                        * 97EE3
          SWAP                                   * 97EEE
          OBJ_7CD79                              * 97EF3
          ROT                                    * 97EF8
          OBJ_7CEA5                              * 97EFD
          ABND                                   * 97F02
          ROTDROP                                * 97F07
          ROMPTR  0C2 052                        * 97F0C
          ToNorm(nb)                             * 97F17
        ;                                        * 97F1C

* ROMPTR 0C2 052
* refs (1): 90007
ROMP_0C2_052:
        ::                                       * 97F21
          OBJ_37898                              * 97F26
          OBJ_3798C                              * 97F2B
          case                                   * 97F30
          ::                                     * 97F35
            SWAP                                 * 97F3A
            ROMPTR  0C2 05A                      * 97F3F
          ;                                      * 97F4A
          C%%>%%                                 * 97F4F
          DUP                                    * 97F54
          %%COSDEG                               * 97F59
          SWAP                                   * 97F5E
          %%SINDEG                               * 97F63
          UNROTOVER                              * 97F68
          %%*UNROT                               * 97F6D
          %%*                                    * 97F72
          RESOROMP                               * 97F77
          ROMPTR  0C2 05A                        * 97F7C
          ROT                                    * 97F87
          4PICK                                  * 97F8C
          3PICK                                  * 97F91
          EVAL                                   * 97F96
          4UNROLL                                * 97F9B
          ROTSWAP                                * 97FA0
          EVAL                                   * 97FA5
          %%>C%%                                 * 97FAA
        ;                                        * 97FAF

* ROMPTR 0C2 053
* refs (1): 90007
ROMP_0C2_053:
        ::                                       * 97FB4
          OBJ_36AD3                              * 97FB9
          SWAP                                   * 97FBE
          OBJ_36B14                              * 97FC3
          ROMPTR  0C2 054                        * 97FC8
        ;                                        * 97FD3

* ROMPTR 0C2 054
* refs (1): 90007
ROMP_0C2_054:
        ::                                       * 97FD8
          SWAP                                   * 97FDD
          ROMPTR  0C2 059                        * 97FE2
          SWAP                                   * 97FED
          OBJ_7CD79                              * 97FF2
          5ROLL                                  * 97FF7
          OBJ_7CEA5                              * 97FFC
          4ROLL                                  * 98001
          3UNROLL                                * 98006
          ROMPTR  0C2 052                        * 9800B
          =0?(nb)                                * 98016
          IT                                     * 9801B
          OBJ_5203A                              * 98020
          SWAP                                   * 98025
          OBJ_7CD7E                              * 9802A
          ROTSWAP                                * 9802F
          4ROLL                                  * 98034
          OBJ_7D0CB                              * 98039
          ABND                                   * 9803E
          OBJ_7CDE2                              * 98043
        ;                                        * 98048

* ROMPTR 0C2 055
* refs (1): 90007
ROMP_0C2_055:
        ::                                       * 9804D
          sqmat(ar)?                             * 98052
          SWAP                                   * 98057
          CKREF                                  * 9805C
          ROMPTR  0C2 056                        * 98061
        ;                                        * 9806C

* ROMPTR 0C2 056
* refs (1): 90007
ROMP_0C2_056:
        ::                                       * 98071
          ROMPTR  0C2 059                        * 98076
          SWAP                                   * 98081
          OBJ_7CD7E                              * 98086
          4ROLL                                  * 9808B
          OBJ_7CEA5                              * 98090
          5ROLL                                  * 98095
          3UNROLL                                * 9809A
          ROMPTR  0C2 052                        * 9809F
          =0?(nb)                                * 980AA
          IT                                     * 980AF
          OBJ_5203A                              * 980B4
          ROMPTR  0C2 057                        * 980B9
          ABND                                   * 980C4
          OBJ_7CDE2                              * 980C9
        ;                                        * 980CE

* ROMPTR 0C2 057
* refs (1): 90007
ROMP_0C2_057:
        ::                                       * 980D3
          ONESWAP                                * 980D8
          2GETLAM                                * 980DD
          #1+_ONE_DO                             * 980E2
          INDEX@                                 * 980E7
          1GETLAM                                * 980EC
          TRUE                                   * 980F1
          OBJ_7D3CB                              * 980F6
          3PICK                                  * 980FB
          BINT1                                  * 98100
          4ROLL                                  * 98105
          INDEX@                                 * 9810A
          #1+_ONE_DO                             * 9810F
          JINDEX@                                * 98114
          INDEX@#-                               * 98119
          DUP#0=                                 * 9811E
          ITE                                    * 98123
          ::                                     * 98128
            DROPDUP                              * 9812D
            OBJ_37A4F                            * 98132
          ;                                      * 98137
          ::                                     * 9813C
            2OVER                                * 98141
            ROT                                  * 98146
            OBJ_7C855                            * 9814B
            B%NEG                                * 98150
          ;                                      * 98155
          5PICK                                  * 9815A
          L%/                                    * 9815F
          4PICK                                  * 98164
          OBJ_37361                              * 98169
          ROT#1+                                 * 9816E
          ROT                                    * 98173
          2GETLAM                                * 98178
          OBJ_36FB0                              * 9817D
          ROT                                    * 98182
          NextInArray                            * 98187
          4UNROLL3DROP                           * 9818C
          2GETLAM                                * 98191
          ROT#+SWAP                              * 98196
          LOOP                                   * 9819B
          SWAPDROP                               * 981A0
          2GETLAM                                * 981A5
          DUP#1=                                 * 981AA
          caseDROP                               * 981AF
          DUP#1-                                 * 981B4
          #*                                     * 981B9
          SWAP                                   * 981BE
          2GETLAM                                * 981C3
          ONE_DO                                 * 981C8
          OVERDUP                                * 981CD
          ROT                                    * 981D2
          2GETLAM                                * 981D7
          INDEX@#-                               * 981DC
          #1+_ONE_DO                             * 981E1
          OVER                                   * 981E6
          4PICK                                  * 981EB
          2GETLAM                                * 981F0
          #+                                     * 981F5
          INDEX@                                 * 981FA
          #1-                                    * 981FF
          OBJ_7C855                              * 98204
          SWAP                                   * 98209
          4PICK                                  * 9820E
          OBJ_372EF                              * 98213
          ROT                                    * 98218
          L%+                                    * 9821D
          B%NEG                                  * 98222
          4PICK                                  * 98227
          OBJ_37361                              * 9822C
          2GETLAM                                * 98231
          4ROLLOVER                              * 98236
          #-                                     * 9823B
          4ROLLROT                               * 98240
          OBJ_36FC4                              * 98245
          ROT                                    * 9824A
          NextInArray                            * 9824F
          ROTROT2DROP                            * 98254
          SWAP                                   * 98259
          2GETLAM                                * 9825E
          OBJ_36FC4                              * 98263
          SWAP                                   * 98268
          LOOP                                   * 9826D
          SWAPDROP                               * 98272
          ONESWAP                                * 98277
          2GETLAM                                * 9827C
          ONE_DO                                 * 98281
          INDEX@                                 * 98286
          3PICKOVER                              * 9828B
          #+                                     * 98290
          3UNROLL                                * 98295
          ZERO_DO                                * 9829A
          OVER                                   * 9829F
          2GETLAM                                * 982A4
          5PICK                                  * 982A9
          OVER                                   * 982AE
          #+SWAP                                 * 982B3
          JINDEX@                                * 982B8
          #-                                     * 982BD
          OBJ_7C855                              * 982C2
          SWAP                                   * 982C7
          4PICK                                  * 982CC
          OBJ_372EF                              * 982D1
          ROT                                    * 982D6
          L%+                                    * 982DB
          4PICK                                  * 982E0
          OBJ_37361                              * 982E5
          ROT#1+UNROT                            * 982EA
          NextInArray                            * 982EF
          SWAPDROP                               * 982F4
          2GETLAM                                * 982F9
          3PICKOVER                              * 982FE
          #+                                     * 98303
          3UNROLL                                * 98308
          #1+                                    * 9830D
          INDEX@                                 * 98312
          #1+                                    * 98317
          DO                                     * 9831C
          3PICK3PICK                             * 98321
          2GETLAM                                * 98326
          INDEX@                                 * 9832B
          #1--                                   * 98330
          OBJ_7C855                              * 98335
          4PICK                                  * 9833A
          OBJ_37361                              * 9833F
          SWAP                                   * 98344
          2GETLAM                                * 98349
          OBJ_36FB0                              * 9834E
          SWAP                                   * 98353
          ROT#1+UNROT                            * 98358
          NextInArray                            * 9835D
          SWAPDROP                               * 98362
          LOOP                                   * 98367
          SWAPDROP                               * 9836C
          2GETLAM                                * 98371
          BEGIN                                  * 98376
          #1-                                    * 9837B
          DUP#0<>                                * 98380
          WHILE                                  * 98385
          ::                                     * 9838A
            1GETLAM                              * 9838F
            OBJ_36FDB                            * 98394
            2DUP#=                               * 98399
            ?SKIP                                * 9839E
            OBJ_375A7                            * 983A3
            DROP                                 * 983A8
            OBJ_357F0                            * 983AD
          ;                                      * 983B2
          REPEAT                                 * 983B7
          DROP                                   * 983BC
        ;                                        * 983C1

* ROMPTR 0C2 058
* refs (1): 90007
ROMP_0C2_058:
        ::                                       * 983C6
          2GETLAM                                * 983CB
          #1+_ONE_DO                             * 983D0
          INDEX@                                 * 983D5
          OBJ_372EF                              * 983DA
          OBJ_37A72                              * 983DF
          INDEX@                                 * 983E4
          OBJ_37361                              * 983E9
          NextInArray                            * 983EE
          ::                                     * 983F3
            2GETLAM                              * 983F8
            DUP                                  * 983FD
            #1=                                  * 98402
            caseDROP                             * 98407
            #1+                                  * 9840C
            BINT2                                * 98411
            DO                                   * 98416
            INDEX@                               * 9841B
            BINT1                                * 98420
            INDEX@                               * 98425
            #1-                                  * 9842A
            OBJ_7CAA4                            * 9842F
            SWAP                                 * 98434
            INDEX@                               * 98439
            OBJ_372EF                            * 9843E
            ROT                                  * 98443
            L%-                                  * 98448
            INDEX@                               * 9844D
            OBJ_37361                            * 98452
            LOOP                                 * 98457
          ;                                      * 9845C
          2GETLAM                                * 98461
          DUP#1+                                 * 98466
          #*                                     * 9846B
          2GETLAM                                * 98470
          2SWAP                                  * 98475
          2GETLAM                                * 9847A
          ZERO_DO                                * 9847F
          SWAP                                   * 98484
          2GETLAM                                * 98489
          INDEX@#-                               * 9848E
          1GETLAM                                * 98493
          TRUE                                   * 98498
          OBJ_7D3CB                              * 9849D
          OBJ_37D87                              * 984A2
          SWAPROT                                * 984A7
          5PICK                                  * 984AC
          5PICK                                  * 984B1
          #1+                                    * 984B6
          INDEX@                                 * 984BB
          OBJ_7CAA4                              * 984C0
          SWAP                                   * 984C5
          5PICK                                  * 984CA
          OBJ_372EF                              * 984CF
          ROT                                    * 984D4
          L%-                                    * 984D9
          4ROLL                                  * 984DE
          L%/                                    * 984E3
          4PICK                                  * 984E8
          OBJ_37361                              * 984ED
          4ROLL                                  * 984F2
          2GETLAM                                * 984F7
          OBJ_36FC4                              * 984FC
          4ROLL                                  * 98501
          #1-                                    * 98506
          2SWAP                                  * 9850B
          LOOP                                   * 98510
          OBJ_37B03                              * 98515
        ;                                        * 9851A

* ROMPTR 0C2 059
* refs (1): 90007
ROMP_0C2_059:
        ::                                       * 9851F
          BINT54                                 * 98524
          TestSysFlag                            * 98529
          case                                   * 9852E
          %%0                                    * 98533
          CODE                                   * 98538  220 nibbles
            GOSBVL  SAVPTR                       * 98542
            C=DAT1  A                            * 98549
            D1=C                                 * 9854C
            D1=D1+  10                           * 9854F
            C=DAT1  A                            * 98552
            D=C     A                            * 98555
            D1=D1+  10                           * 98557
            A=DAT1  A                            * 9855A
            R0=A                                 * 9855D
            LC(5)   DOREAL                       * 98560
            ?D=C    A                            * 98567
            GOYES   L_9856E                      * 9856A
            A=A+A   A                            * 9856C
L_9856E:
            C=R0                                 * 9856E
            D=C     A                            * 98571
            LC(5)   #0004F                       * 98573
            ?D<C    A                            * 9857A
            GOYES   L_98589                      * 9857D
            A=0     W                            * 9857F
            B=0     W                            * 98582
            GOTO    L_98617                      * 98585
L_98589:
            C=A     A                            * 98589
            GOSBVL  L_35790                      * 9858B
            C=B     A                            * 98592
            D1=D1+  10                           * 98594
            C=C-1   A                            * 98597
            RSTK=C                               * 98599
            LC(5)   #99999                       * 9859B
            D=C     A                            * 985A2
L_985A4:
            A=DAT1  W                            * 985A4
            ?A=0    M                            * 985A8
            GOYES   L_985D4                      * 985AB
            GOSBVL  SPLITA                       * 985AD
            P=      0                            * 985B4
            LC(5)   #50000                       * 985B6
            C=C+A   A                            * 985BD
            P=      13                           * 985BF
L_985C1:
            ?B=0    WP                           * 985C1
            GOYES   L_985CD                      * 985C4
            P=P-1                                * 985C6
            C=C-1   A                            * 985C8
            GONC    L_985C1                      * 985CA
L_985CD:
            ?D<=C   A                            * 985CD
            GOYES   L_985D4                      * 985D0
            D=C     A                            * 985D2
L_985D4:
            SETHEX                               * 985D4
            D1=D1+  16                           * 985D6
            C=RSTK                               * 985D9
            C=C-1   A                            * 985DB
            RSTK=C                               * 985DD
            GONC    L_985A4                      * 985DF
            SETDEC                               * 985E2
            P=      0                            * 985E4
            C=D     A                            * 985E6
            C=C+1   A                            * 985E8
            GOC     L_9860A                      * 985EA
            LC(5)   #50000                       * 985ED
            D=D-C   A                            * 985F4
            A=R0                                 * 985F6
            SETHEX                               * 985F9
            A=A-1   A                            * 985FB
            C=0     A                            * 985FD
L_985FF:
            SETDEC                               * 985FF
            C=C+D   A                            * 98601
            SETHEX                               * 98603
            A=A-1   A                            * 98605
            GONC    L_985FF                      * 98607
L_9860A:
            A=0     W                            * 9860A
            B=0     W                            * 9860D
            P=      14                           * 98610
            B=B+1   P                            * 98612
            A=C     A                            * 98615
L_98617:
            GOVLNG  L_37915                      * 98617
          ENDCODE                                * 9861E
        ;                                        * 9861E

* ROMPTR 0C2 05A
* refs (1): 90007
ROMP_0C2_05A:
        CODE                                     * 98623  127 nibbles
          HST=0   3                              * 9862D
          GOSBVL  SUB_2A0B1                      * 98630
          ?D#0    M                              * 98637
          GOYES   L_98654                        * 9863A
L_9863C:
          SETHEX                                 * 9863C
          GOSBVL  GETPTR                         * 9863E
          D1=D1-  5                              * 98645
          D=D-1   A                              * 98648
          A=DAT0  A                              * 9864A
          D0=D0+  5                              * 9864D
          PC=(A)                                 * 98650
L_98654:
          R0=C                                   * 98654
          P=      0                              * 98657
          LC(5)   #50000                         * 98659
          A=A+C   A                              * 98660
          R1=A                                   * 98662
          A=R0                                   * 98665
          A=A+C   A                              * 98668
          C=A     W                              * 9866A
          A=R1                                   * 9866D
          A=A-C   A                              * 98670
          GOC     L_98684                        * 98672
          LC(5)   #40000                         * 98675
          ?C<=A   A                              * 9867C
          GOYES   L_9863C                        * 9867F
          GONC    L_98690                        * 98681
L_98684:
          LC(5)   #60000                         * 98684
          ?C>=A   A                              * 9868B
          GOYES   L_9863C                        * 9868E
L_98690:
          ST=0    1                              * 98690
          ST=1    2                              * 98693
          C=0     S                              * 98696
          GOSBVL  SUB_2BF26                      * 98699
          C=R0                                   * 986A0
          A=A+C   A                              * 986A3
          GOVLNG  L_37915                        * 986A5
        ENDCODE                                  * 986AC

* ROMPTR 0C2 05B
* refs (1): 90007
ROMP_0C2_05B:
        ::                                       * 986AC
          BINT1                                  * 986B1
          OVER                                   * 986B6
          MDIMS                                  * 986BB
          NOTcase                                * 986C0
          doerr501                               * 986C5
          RESOROMP                               * 986CA
          ROMPTR  0C2 05C                        * 986CF
          RESOROMP                               * 986DA
          ROMPTR  0C2 05E                        * 986DF
          2NULLLAM{}                             * 986EA
          BIND                                   * 986EF
          DUP                                    * 986F4
          #8*                                    * 986F9
          !MAKEHXS                               * 986FE
          4NULLLAM{}                             * 98703
          BIND                                   * 98708
          CKREF                                  * 9870D
          OBJ_7CD7E                              * 98712
          1GETLAM                                * 98717
          OBJ_7D28D                              * 9871C
          ONESWAP                                * 98721
          2GETLAM                                * 98726
          #1+_ONE_DO                             * 9872B
          BINT54                                 * 98730
          TestSysFlag                            * 98735
          ITE                                    * 9873A
          %%0                                    * 9873F
          ::                                     * 98744
            1GETLAM                              * 98749
            2GETLAM                              * 9874E
            INDEX@                               * 98753
            6GETLAM                              * 98758
            EVAL                                 * 9875D
          ;                                      * 98762
          4GETLAM                                * 98767
          #1-                                    * 9876C
          OBJ_6819D                              * 98771
          5PICK                                  * 98776
          TYPERARRY?                             * 9877B
          ?SKIP                                  * 98780
          #2*                                    * 98785
          UNCOERCE%%                             * 9878A
          %%*                                    * 9878F
          SWAP                                   * 98794
          4GETLAM                                * 98799
          3GETLAM                                * 9879E
          #>                                     * 987A3
          ITE                                    * 987A8
          %%0                                    * 987AD
          ::                                     * 987B2
            4GETLAM                              * 987B7
            INDEX@                               * 987BC
            OBJ_376C1                            * 987C1
            2DUP#=                               * 987C6
            ?SKIP                                * 987CB
            SWAPCOLUMNS                          * 987D0
            2DROP                                * 987D5
            3PICK                                * 987DA
            OBJ_372EF                            * 987DF
          ;                                      * 987E4
          DUP                                    * 987E9
          B%ABS                                  * 987EE
          ROT                                    * 987F3
          4GETLAM                                * 987F8
          #1=?SKIP                               * 987FD
          ::                                     * 98802
            INDEX@                               * 98807
            SWAP                                 * 9880C
            4GETLAM                              * 98811
            ONE_DO                               * 98816
            7GETLAM                              * 9881B
            EVAL                                 * 98820
            2GETLAM                              * 98825
            ROT#+SWAP                            * 9882A
            NextInArray                          * 9882F
            SWAPDROP                             * 98834
          ;                                      * 98839
          4GETLAM                                * 9883E
          3GETLAM                                * 98843
          #<                                     * 98848
          IT                                     * 9884D
          ::                                     * 98852
            5PICK                                * 98857
            SWAP                                 * 9885C
            3GETLAM                              * 98861
            4GETLAM                              * 98866
            DO                                   * 9886B
            2GETLAM                              * 98870
            ROT#+SWAP                            * 98875
            7GETLAM                              * 9887A
            EVAL                                 * 9887F
            NextInArray                          * 98884
            SWAPDROP                             * 98889
          ;                                      * 9888E
          ROTDROP                                * 98893
          OVER                                   * 98898
          4ROLL                                  * 9889D
          %%>                                    * 988A2
          ITE                                    * 988A7
          ::                                     * 988AC
            SWAPDROP                             * 988B1
            4GETLAM                              * 988B6
            #1+                                  * 988BB
            4PUTLAM                              * 988C0
            2GETLAM                              * 988C5
            ROT#+SWAP                            * 988CA
          ;                                      * 988CF
          ::                                     * 988D4
            SWAP                                 * 988D9
            =0?(nb)                              * 988DE
            ?SEMI                                * 988E3
            %%0                                  * 988E8
            3PICK                                * 988ED
            OBJ_37361                            * 988F2
          ;                                      * 988F7
          SWAP#1+SWAP                            * 988FC
          NextInArray                            * 98901
          RESOROMP                               * 98906
          ROMPTR  0C2 05D                        * 9890B
          6PUTLAM                                * 98916
          SWAPDROP                               * 9891B
          BINT1                                  * 98920
          DUPUNROT                               * 98925
          4PUTLAM                                * 9892A
          2GETLAM                                * 9892F
          #1+_ONE_DO                             * 98934
          6GETLAM                                * 98939
          EVAL                                   * 9893E
          SWAP#1+SWAP                            * 98943
          NextInArray                            * 98948
          SWAPDROP                               * 9894D
          ABND                                   * 98952
          ABND                                   * 98957
          OBJ_7CDE2                              * 9895C
        ;                                        * 98961

* ROMPTR 0C2 05C
* refs (1): 90007
ROMP_0C2_05C:
        ::                                       * 98966
          OVER                                   * 9896B
          OBJ_372EF                              * 98970
          DUPUNROT                               * 98975
          B%ABS                                  * 9897A
          7PICK                                  * 9897F
          %%>                                    * 98984
          5PICK                                  * 98989
          8PICK                                  * 9898E
          %%<=                                   * 98993
          AND                                    * 98998
          ?SKIP                                  * 9899D
          ::                                     * 989A2
            %%0                                  * 989A7
            4PICK                                * 989AC
            OBJ_37361                            * 989B1
          ;                                      * 989B6
          4PICK                                  * 989BB
          7PICK                                  * 989C0
          %%<=                                   * 989C5
          2GETLAM                                * 989CA
          JINDEX@                                * 989CF
          #=                                     * 989D4
          OR                                     * 989D9
          case                                   * 989DE
          SWAPDROP                               * 989E3
          SWAP                                   * 989E8
          5PICK                                  * 989ED
          L%/                                    * 989F2
          SWAP                                   * 989F7
          7PICK                                  * 989FC
          4PICK                                  * 98A01
          ROT                                    * 98A06
          2GETLAM                                * 98A0B
          JINDEX@                                * 98A10
          DO                                     * 98A15
          ROT#1+                                 * 98A1A
          ROT#1+                                 * 98A1F
          ROT                                    * 98A24
          3PICK                                  * 98A29
          OBJ_372EF                              * 98A2E
          5PICK                                  * 98A33
          L%*                                    * 98A38
          SWAP3PICK                              * 98A3D
          OBJ_372EF                              * 98A42
          ROT                                    * 98A47
          L%-                                    * 98A4C
          3PICK                                  * 98A51
          OBJ_37361                              * 98A56
          NextInArray                            * 98A5B
          4UNROLL3DROP                           * 98A60
        ;                                        * 98A65

* ROMPTR 0C2 05D
* refs (1): 90007
ROMP_0C2_05D:
        ::                                       * 98A6A
          4GETLAM                                * 98A6F
          3GETLAM                                * 98A74
          #>                                     * 98A79
          ?SEMI                                  * 98A7E
          OVER                                   * 98A83
          OBJ_372EF                              * 98A88
          SWAP                                   * 98A8D
          OVER                                   * 98A92
          =0?(nb)                                * 98A97
          case                                   * 98A9C
          SWAPDROP                               * 98AA1
          %%1                                    * 98AA6
          4PICK                                  * 98AAB
          OBJ_37361                              * 98AB0
          2GETLAM                                * 98AB5
          INDEX@                                 * 98ABA
          #=case                                 * 98ABF
          SWAPDROP                               * 98AC4
          3PICKSWAP                              * 98AC9
          2GETLAM                                * 98ACE
          INDEX@                                 * 98AD3
          DO                                     * 98AD8
          SWAP#1+SWAP                            * 98ADD
          OVER                                   * 98AE2
          OBJ_372EF                              * 98AE7
          4PICK                                  * 98AEC
          L%/                                    * 98AF1
          3PICK                                  * 98AF6
          OBJ_37361                              * 98AFB
          NextInArray                            * 98B00
          ROTROT2DROP                            * 98B05
          2GETLAM                                * 98B0A
          ROT#+SWAP                              * 98B0F
          4GETLAM                                * 98B14
          #1+                                    * 98B19
          4PUTLAM                                * 98B1E
        ;                                        * 98B23

* ROMPTR 0C2 05E
* refs (1): 90007
ROMP_0C2_05E:
        CODE                                     * 98B28  98 nibbles
          GOSBVL  POP2#                          * 98B32
          R1=C                                   * 98B39
          R2=A                                   * 98B3C
          A=DAT1  A                              * 98B3F
          D1=D1+  5                              * 98B42
          D=D+1   A                              * 98B45
          GOSBVL  SAVPTR                         * 98B47
          R0=A                                   * 98B4E
          A=R2                                   * 98B51
          B=A     A                              * 98B54
          A=A+A   A                              * 98B56
          A=A+B   A                              * 98B58
          C=R1                                   * 98B5A
          C=C-1   A                              * 98B5D
          D=C     A                              * 98B5F
          C=C+C   A                              * 98B61
          C=C+C   A                              * 98B63
          C=C+D   A                              * 98B65
          C=C+A   A                              * 98B67
          A=R0                                   * 98B69
          C=C+A   A                              * 98B6C
          D0=C                                   * 98B6E
          D0=D0+  10                             * 98B71
          A=DAT0  A                              * 98B74
          LC(5)   #49987                         * 98B77
          SETDEC                                 * 98B7E
          A=A+C   A                              * 98B80
          A=0     S                              * 98B82
          B=0     W                              * 98B85
          P=      14                             * 98B88
          B=B+1   P                              * 98B8A
          GOVLNG  L_37915                        * 98B8D
        ENDCODE                                  * 98B94

LIB0C2.hash:
        CON(5)  DOHSTR                           * 98B94  hash table of library 0C2
        LENGTH                                   * 98B99  length, to #98BF8
        CON(5)  0                                * 98B9E  names of length 1
        CON(5)  0                                * 98BA3  names of length 2
        CON(5)  0                                * 98BA8  names of length 3
        CON(5)  0                                * 98BAD  names of length 4
        CON(5)  0                                * 98BB2  names of length 5
        CON(5)  0                                * 98BB7  names of length 6
        CON(5)  0                                * 98BBC  names of length 7
        CON(5)  0                                * 98BC1  names of length 8
        CON(5)  0                                * 98BC6  names of length 9
        CON(5)  0                                * 98BCB  names of length 10
        CON(5)  0                                * 98BD0  names of length 11
        CON(5)  0                                * 98BD5  names of length 12
        CON(5)  0                                * 98BDA  names of length 13
        CON(5)  0                                * 98BDF  names of length 14
        CON(5)  0                                * 98BE4  names of length 15
        CON(5)  0                                * 98BE9  names of length 16
        REL(5)  L_98BF3                          * 98BEE  end of the names
L_98BF3:
        CON(5)  0                                * 98BF3  command 000 has no name
        ENDLENGTH                                * 98BF8

LIB0C2.link:
        CON(5)  DOHSTR                           * 98BF8  link table of library 0C2
        LENGTH                                   * 98BFD  length, to #98DDD
        REL(5)  ROMP_0C2_000                     * 98C02  000 
        REL(5)  ROMP_0C2_001                     * 98C07  001 
        REL(5)  ROMP_0C2_002                     * 98C0C  002 
        REL(5)  ROMP_0C2_003                     * 98C11  003 
        REL(5)  ROMP_0C2_004                     * 98C16  004 
        REL(5)  ROMP_0C2_005                     * 98C1B  005 
        REL(5)  ROMP_0C2_006                     * 98C20  006 
        REL(5)  ROMP_0C2_007                     * 98C25  007 
        REL(5)  ROMP_0C2_008                     * 98C2A  008 
        REL(5)  ROMP_0C2_009                     * 98C2F  009 
        REL(5)  ROMP_0C2_00A                     * 98C34  00A 
        REL(5)  ROMP_0C2_00B                     * 98C39  00B 
        REL(5)  ROMP_0C2_00C                     * 98C3E  00C 
        REL(5)  ROMP_0C2_00D                     * 98C43  00D 
        REL(5)  ROMP_0C2_00E                     * 98C48  00E 
        REL(5)  ROMP_0C2_00F                     * 98C4D  00F 
        REL(5)  ROMP_0C2_010                     * 98C52  010 
        REL(5)  ROMP_0C2_011                     * 98C57  011 
        REL(5)  ROMP_0C2_012                     * 98C5C  012 
        REL(5)  ROMP_0C2_013                     * 98C61  013 
        REL(5)  ROMP_0C2_014                     * 98C66  014 
        REL(5)  ROMP_0C2_015                     * 98C6B  015 
        REL(5)  ROMP_0C2_016                     * 98C70  016 
        REL(5)  ROMP_0C2_017                     * 98C75  017 
        REL(5)  ROMP_0C2_018                     * 98C7A  018 
        REL(5)  ROMP_0C2_019                     * 98C7F  019 
        REL(5)  ROMP_0C2_01A                     * 98C84  01A 
        REL(5)  ROMP_0C2_01B                     * 98C89  01B 
        REL(5)  ROMP_0C2_01C                     * 98C8E  01C 
        REL(5)  ROMP_0C2_01D                     * 98C93  01D 
        REL(5)  ROMP_0C2_01E                     * 98C98  01E 
        REL(5)  ROMP_0C2_01F                     * 98C9D  01F 
        REL(5)  ROMP_0C2_020                     * 98CA2  020 
        REL(5)  ROMP_0C2_021                     * 98CA7  021 
        REL(5)  ROMP_0C2_022                     * 98CAC  022 
        REL(5)  ROMP_0C2_023                     * 98CB1  023 
        REL(5)  ROMP_0C2_024                     * 98CB6  024 
        REL(5)  ROMP_0C2_025                     * 98CBB  025 
        REL(5)  ROMP_0C2_026                     * 98CC0  026 
        REL(5)  ROMP_0C2_027                     * 98CC5  027 
        REL(5)  ROMP_0C2_028                     * 98CCA  028 
        REL(5)  ROMP_0C2_029                     * 98CCF  029 
        REL(5)  ROMP_0C2_02A                     * 98CD4  02A 
        REL(5)  ROMP_0C2_02B                     * 98CD9  02B 
        REL(5)  ROMP_0C2_02C                     * 98CDE  02C 
        REL(5)  ROMP_0C2_02D                     * 98CE3  02D 
        REL(5)  ROMP_0C2_02E                     * 98CE8  02E 
        REL(5)  ROMP_0C2_02F                     * 98CED  02F 
        REL(5)  ROMP_0C2_030                     * 98CF2  030 
        REL(5)  ROMP_0C2_031                     * 98CF7  031 
        REL(5)  ROMP_0C2_032                     * 98CFC  032 
        REL(5)  ROMP_0C2_033                     * 98D01  033 
        REL(5)  ROMP_0C2_034                     * 98D06  034 
        REL(5)  ROMP_0C2_035                     * 98D0B  035 
        REL(5)  ROMP_0C2_036                     * 98D10  036 
        REL(5)  ROMP_0C2_037                     * 98D15  037 
        REL(5)  ROMP_0C2_038                     * 98D1A  038 
        REL(5)  ROMP_0C2_039                     * 98D1F  039 
        REL(5)  ROMP_0C2_03A                     * 98D24  03A 
        REL(5)  ROMP_0C2_03B                     * 98D29  03B 
        REL(5)  ROMP_0C2_03C                     * 98D2E  03C 
        REL(5)  ROMP_0C2_03D                     * 98D33  03D 
        REL(5)  ROMP_0C2_03E                     * 98D38  03E 
        REL(5)  ROMP_0C2_03F                     * 98D3D  03F 
        REL(5)  ROMP_0C2_040                     * 98D42  040 
        REL(5)  ROMP_0C2_041                     * 98D47  041 
        REL(5)  ROMP_0C2_042                     * 98D4C  042 
        REL(5)  ROMP_0C2_043                     * 98D51  043 
        REL(5)  ROMP_0C2_044                     * 98D56  044 
        REL(5)  ROMP_0C2_045                     * 98D5B  045 
        REL(5)  ROMP_0C2_046                     * 98D60  046 
        REL(5)  ROMP_0C2_047                     * 98D65  047 
        REL(5)  ROMP_0C2_048                     * 98D6A  048 
        REL(5)  ROMP_0C2_049                     * 98D6F  049 
        REL(5)  ROMP_0C2_04A                     * 98D74  04A 
        REL(5)  ROMP_0C2_04B                     * 98D79  04B 
        REL(5)  ROMP_0C2_04C                     * 98D7E  04C 
        REL(5)  ROMP_0C2_04D                     * 98D83  04D 
        REL(5)  ROMP_0C2_04E                     * 98D88  04E 
        REL(5)  ROMP_0C2_04F                     * 98D8D  04F 
        REL(5)  ROMP_0C2_050                     * 98D92  050 
        REL(5)  ROMP_0C2_051                     * 98D97  051 
        REL(5)  ROMP_0C2_052                     * 98D9C  052 
        REL(5)  ROMP_0C2_053                     * 98DA1  053 
        REL(5)  ROMP_0C2_054                     * 98DA6  054 
        REL(5)  ROMP_0C2_055                     * 98DAB  055 
        REL(5)  ROMP_0C2_056                     * 98DB0  056 
        REL(5)  ROMP_0C2_057                     * 98DB5  057 
        REL(5)  ROMP_0C2_058                     * 98DBA  058 
        REL(5)  ROMP_0C2_059                     * 98DBF  059 
        REL(5)  ROMP_0C2_05A                     * 98DC4  05A 
        REL(5)  ROMP_0C2_05B                     * 98DC9  05B 
        REL(5)  ROMP_0C2_05C                     * 98DCE  05C 
        REL(5)  ROMP_0C2_05D                     * 98DD3  05D 
        REL(5)  ROMP_0C2_05E                     * 98DD8  05E 
        ENDLENGTH                                * 98DDD
        NIBHEX  C0210E06494E4020202A36496E616E63 * 98DDD  ..à`ηä...¢cηæ.æ6
        NIBHEX  656E0                            * 98DFD  Væ
