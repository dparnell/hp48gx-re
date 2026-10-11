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
        ::                                       * A244E
          ROMPTR  0B0 0AB                        * A2453
          {                                      * A245E
            {                                    * A2463
              #       BF01                       * A2468  48897
              ROMPTR  0B4 001                    * A2472
            }                                    * A247D
            {                                    * A2482
              #       BF02                       * A2487  48898
              ROMPTR  0B4 017                    * A2491
            }                                    * A249C
            {                                    * A24A1
              #       BF03                       * A24A6  48899
              ROMPTR  0B4 02C                    * A24B0
            }                                    * A24BB
            {                                    * A24C0
              #       BF04                       * A24C5  48900
              ROMPTR  0B4 033                    * A24CF
            }                                    * A24DA
            {                                    * A24DF
              #       BF05                       * A24E4  48901
              ROMPTR  0B4 038                    * A24EE
            }                                    * A24F9
          }                                      * A24FE
          ROMPTR  0B0 0A9                        * A2503
        ;                                        * A250E

* ROMPTR 0B4 001
* refs (1): A2437
ROMP_0B4_001:
        ::                                       * A2513
          MINUSONE                               * A2518
          BINT1                                  * A251D
          MINUSONE                               * A2522
          MINUSONE                               * A2527
          'NOP                                   * A252C
          BINT1                                  * A2531
          {                                      * A2536
            LAM     'V                           * A253B
            LAM     'P                           * A2546
            LAM     'p                           * A2551
            LAM     'I                           * A255C
            LAM     'IE                          * A2567
            LAM     'IX                          * A2574
          }                                      * A2581
          BIND                                   * A2586
          BEGIN                                  * A258B
          LAM     'P                             * A2590
          MINUSONE                               * A259B
          #=ITE                                  * A25A0
          ::                                     * A25A5
            BINT1                                * A25AA
            '                                    * A25AF
            LAM     'P                           * A25B4
            STOLAM                               * A25BF
            MINUSONE                             * A25C4
          ;                                      * A25C9
          ROMPTR  0B5 000                        * A25CE
          ROMPTR  0B4 002                        * A25D9
          LAM     'V                             * A25E4
          LENCOMP                                * A25EF
          BINT12                                 * A25F4
          #/                                     * A25F9
          SWAP                                   * A25FE
          #0<>                                   * A2603
          IT                                     * A2608
          #1+                                    * A260D
          BINT1                                  * A2612
          #MAX                                   * A2617
          '                                      * A261C
          LAM     'p                             * A2621
          STOLAM                                 * A262C
          DoInputForm                            * A2631
          LAM     'IX                            * A2636
          #0<>                                   * A2643
          IT                                     * A2648
          ::                                     * A264D
            NOT?SEMI                             * A2652
            ROMPTR  0B4 016                      * A2657
          ;                                      * A2662
          LAM     'IX                            * A2667
          #0=                                    * A2674
          WHILE                                  * A2679
          ::                                     * A267E
            BINT2                                * A2683
            '                                    * A2688
            LAM     'IX                          * A268D
            STOLAM                               * A269A
          ;                                      * A269F
          REPEAT                                 * A26A4
          '                                      * A26A9
          LAM     'IE                            * A26AE
          undo                                   * A26BB
          DROP                                   * A26C0
          ABND                                   * A26C5
          EVAL                                   * A26CA
        ;                                        * A26CF

* ROMPTR 0B4 002
* refs (1): A2437
ROMP_0B4_002:
        ::                                       * A26D4
          LAM     'V                             * A26D9
          MINUSONE                               * A26E4
          EQUAL                                  * A26E9
          IT                                     * A26EE
          ::                                     * A26F3
            DUP                                  * A26F8
            ROMPTR  0B5 002                      * A26FD
            '                                    * A2708
            LAM     'V                           * A270D
            STOLAM                               * A2718
          ;                                      * A271D
          LAM     'V                             * A2722
          ROMPTR  0B4 012                        * A272D
          DUPNULL{}?                             * A2738
          ITE                                    * A273D
          ::                                     * A2742
            DROP                                 * A2747
            ROMPTR  0B4 003                      * A274C
            BINT1                                * A2757
            {}N                                  * A275C
            ROMPTR  0B4 004                      * A2761
            BINT1                                * A276C
            {}N                                  * A2771
          ;                                      * A2776
          ::                                     * A277B
            ROMPTR  0B4 014                      * A2780
            BINT2                                * A278B
            OVER                                 * A2790
            LENCOMP                              * A2795
            BINT3                                * A279A
            #/                                   * A279F
            SWAP                                 * A27A4
            #0<>                                 * A27A9
            IT                                   * A27AE
            #1+                                  * A27B3
            BINT1                                * A27B8
            ROMPTR  0B1 01E                      * A27BD
            SWAP                                 * A27C8
            ROMPTR  0B4 003                      * A27CD
            >HCOMP                               * A27D8
            ROMPTR  0B4 004                      * A27DD
            ROT                                  * A27E8
            INNERCOMP                            * A27ED
            DUP                                  * A27F2
            1LAMBIND                             * A27F7
            ZERO_DO                              * A27FC
            ISTOP@                               * A2801
            ROLL                                 * A2806
            OBJ_38345                            * A280B
            ROMPTR  0B4 1F9                      * A2810
            >HCOMP                               * A281B
            {                                    * A2820
              BINT1                              * A2825
              {                                  * A282A
                BINT0                            * A282F
                BINT1                            * A2834
                BINT13                           * A2839
                BINT5                            * A283E
              }                                  * A2843
              BINT4                              * A2848
              #       BF07                       * A284D  48903
              MINUSONE                           * A2857
              MINUSONE                           * A285C
            }                                    * A2861
            &COMP                                * A2866
            LOOP                                 * A286B
            1GETABND                             * A2870
            #1+                                  * A2875
            {}N                                  * A287A
          ;                                      * A287F
          OBJ_38345                              * A2884
          ROMPTR  0B4 005                        * A2889
          #       BF06                           * A2894  48902
          MINUSONE                               * A289E
          6ROLL                                  * A28A3
          LAM     'V                             * A28A8
          DUPNULL{}?                             * A28B3
          ITE                                    * A28B8
          DROPZERO                               * A28BD
          ::                                     * A28C2
            ROMPTR  0B4 014                      * A28C7
            INNERCOMP                            * A28D2
            DUP                                  * A28D7
            1LAMBIND                             * A28DC
            ZERO_DO                              * A28E1
            ISTOP@                               * A28E6
            ROLL                                 * A28EB
            ROMPTR  0B5 005                      * A28F0
            ?SKIP                                * A28FB
            MINUSONE                             * A2900
            LOOP                                 * A2905
            1GETABND                             * A290A
          ;                                      * A290F
          #1+                                    * A2914
          {}N                                    * A2919
          ROMPTR  0B1 022                        * A291E
        ;                                        * A2929

* ROMPTR 0B4 003
* refs (1): A2437
ROMP_0B4_003:
        {                                        * A292E
          #       BF08                           * A2933  48904
          BINT1                                  * A293D
          BINT10                                 * A2942
        }                                        * A2947

* ROMPTR 0B4 004
* refs (1): A2437
ROMP_0B4_004:
        {                                        * A294C
          ROMPTR  0B4 007                        * A2951
          BINT13                                 * A295C
          BINT8                                  * A2961
          BINT115                                * A2966
          BINT9                                  * A296B
          BINT23                                 * A2970
          {                                      * A2975
            BINT9                                * A297A
            BINT8                                * A297F
            BINT6                                * A2984
            BINT5                                * A2989
          }                                      * A298E
          ::                                     * A2993
            ROMPTR  0B5 02B                      * A2998
            BINT4                                * A29A3
            ROMPTR  0B0 074                      * A29A8
          ;                                      * A29B3
          #       BF09                           * A29B8  48905
          #       BF0A                           * A29C2  48906
          MINUSONE                               * A29CC
        }                                        * A29D1

* ROMPTR 0B4 005
* refs (1): A2437
ROMP_0B4_005:
        ::                                       * A29D6
          {                                      * A29DB
            BINT16                               * A29E0
            ::                                   * A29E5
              ROMPTR  0B4 006                    * A29EA
              TRUE                               * A29F5
            ;                                    * A29FA
            BINT14                               * A29FF
            ::                                   * A2A04
              LAM     'IX                        * A2A09
              14GETLAM                           * A2A16
              #MIN                               * A2A1B
            ;                                    * A2A20
          }                                      * A2A25
          EQLookup                               * A2A2A
          case                                   * A2A2F
          ::                                     * A2A34
            EVAL                                 * A2A39
            TRUE                                 * A2A3E
          ;                                      * A2A43
          DROPFALSE                              * A2A48
        ;                                        * A2A4D

* ROMPTR 0B4 006
* refs (1): A2437
ROMP_0B4_006:
        {                                        * A2A52
          {                                      * A2A57
            ::                                   * A2A5C
              TakeOver                           * A2A61
              ROMPTR  0B4 013                    * A2A66
              LAM     'P                         * A2A71
              LAM     'p                         * A2A7C
              #<>                                * A2A87
              AND                                * A2A8C
              ITE                                * A2A91
              ::                                 * A2A96
                PTR     DirLabel:                * A2A9B
                $       "MORE"                   * A2AA0
              ;                                  * A2AB2
              ::                                 * A2AB7
                PTR     DirLabel:                * A2ABC
                $       "VARS"                   * A2AC1
              ;                                  * A2AD3
            ;                                    * A2AD8
            ROMPTR  0B4 00B                      * A2ADD
          }                                      * A2AE8
          {                                      * A2AED
            ::                                   * A2AF2
              TakeOver                           * A2AF7
              LAM     'I                         * A2AFC
              MINUSONE                           * A2B07
              EQUAL                              * A2B0C
              ITE                                * A2B11
              NULL$                              * A2B16
              $       "INFO"                     * A2B1B
            ;                                    * A2B2D
            ROMPTR  0B4 00F                      * A2B32
          }                                      * A2B3D
          {                                      * A2B42
            ::                                   * A2B47
              TakeOver                           * A2B4C
              5GETLAM                            * A2B51
              #>1                                * A2B56
              ITE                                * A2B5B
              $       "SOLVE"                    * A2B60
              $       "EXPR="                    * A2B74
            ;                                    * A2B88
            ROMPTR  0B4 010                      * A2B8D
          }                                      * A2B98
        }                                        * A2B9D

* ROMPTR 0B4 007
* refs (1): A2437
ROMP_0B4_007:
        ::                                       * A2BA2
          {                                      * A2BA7
            BINT47                               * A2BAC
            ::                                   * A2BB1
              4GETLAM                            * A2BB6
              ROMPTR  0B0 013                    * A2BBB  IFEDispField
              MINUSONE                           * A2BC6
              4GETLAM                            * A2BCB
              ROMPTR  0B0 0C5                    * A2BD0  ~gFldVal
              MINUSONE                           * A2BDB
              EQUAL                              * A2BE0
              ITE                                * A2BE5
              MINUSONE                           * A2BEA
              BINT1                              * A2BEF
              ROMPTR  0B4 011                    * A2BF4
            ;                                    * A2BFF
          }                                      * A2C04
          EQLookup                               * A2C09
          case                                   * A2C0E
          ::                                     * A2C13
            EVAL                                 * A2C18
            TRUE                                 * A2C1D
          ;                                      * A2C22
          ROMPTR  0B4 008                        * A2C27
        ;                                        * A2C32

* ROMPTR 0B4 008
* refs (1): A2437
ROMP_0B4_008:
        ::                                       * A2C37
          BINT8                                  * A2C3C
          #<>case                                * A2C41
          FALSE                                  * A2C46
          ROMPTR  0B4 009                        * A2C4B
        ;                                        * A2C56

* ROMPTR 0B4 009
* refs (1): A2437
ROMP_0B4_009:
        ::                                       * A2C5B
          EditExstCase                           * A2C60
          FALSE                                  * A2C65
          2DUP                                   * A2C6A
          Key>U/SKeyOb                           * A2C6F
          '                                      * A2C74
          ROMPTR  0B4 045                        * A2C79
          EQUAL                                  * A2C84
          NOTcaseFALSE                           * A2C89
          2DROP                                  * A2C8E
          '                                      * A2C93
          ROMPTR  0B4 00A                        * A2C98
          TrueTrue                               * A2CA3
        ;                                        * A2CA8

* ROMPTR 0B4 00A
* refs (1): A2437
ROMP_0B4_00A:
        ::                                       * A2CAD
          TakeOver                               * A2CB2
          '                                      * A2CB7
          ROMPTR  0B4 045                        * A2CBC
          '                                      * A2CC7
          LAM     'IE                            * A2CCC
          STOLAM                                 * A2CD9
          ROMPTR  0B4 015                        * A2CDE
          TRUE                                   * A2CE9
          11PUTLAM                               * A2CEE
          FALSE                                  * A2CF3
        ;                                        * A2CF8

* ROMPTR 0B4 00B
* refs (1): A2437
ROMP_0B4_00B:
        ::                                       * A2CFD
          TakeOver                               * A2D02
          ROMPTR  0B4 013                        * A2D07
          LAM     'P                             * A2D12
          LAM     'p                             * A2D1D
          #<>                                    * A2D28
          AND                                    * A2D2D
          case                                   * A2D32
          ROMPTR  0B4 00E                        * A2D37
          ROMPTR  0B4 00C                        * A2D42
        ;                                        * A2D4D

* ROMPTR 0B4 00C
* refs (1): A2437
ROMP_0B4_00C:
        ::                                       * A2D52
          #       BF0C                           * A2D57  48908
          BINT1                                  * A2D61
          BINT19                                 * A2D66
          OBJ_38345                              * A2D6B
          ROMPTR  0B4 00D                        * A2D70
          BINT7                                  * A2D7B
          BINT26                                 * A2D80
          #       79                             * A2D85  121
          BINT9                                  * A2D8F
          BINT5                                  * A2D94
          {                                      * A2D99
            BINT5                                * A2D9E
            BINT6                                * A2DA3
          }                                      * A2DA8
          BINT4                                  * A2DAD
          #       BF0D                           * A2DB2  48909
          MINUSONE                               * A2DBC
          BINT4                                  * A2DC1
          BINT1                                  * A2DC6
          ROMPTR  0B0 0C5                        * A2DCB  ~gFldVal
          ROMPTR  0B5 002                        * A2DD6
          LAM     'V                             * A2DE1
          BINT1                                  * A2DEC
          DUP                                    * A2DF1
          'DROPFALSE                             * A2DF6
          #       BF0B                           * A2DFB  48907
          BINT1                                  * A2E05
          ROMPTR  0B0 0C5                        * A2E0A  ~gFldVal
          {                                      * A2E15
            LAM     'F                           * A2E1A
          }                                      * A2E25
          BIND                                   * A2E2A
          DoInputForm                            * A2E2F
          ABND                                   * A2E34
          NOT?SEMI                               * A2E39
          DUPTYPELIST?                           * A2E3E
          ?SKIP                                  * A2E43
          ONE{}N                                 * A2E48
          DUPINCOMP                              * A2E4D
          ZERO_DO                                * A2E52
          TYPEIDNT?                              * A2E57
          NcaseTYPEERR                           * A2E5C
          LOOP                                   * A2E61
          BINT1                                  * A2E66
          ROMPTR  0B4 011                        * A2E6B
        ;                                        * A2E76

* ROMPTR 0B4 00D
* refs (1): A2437
ROMP_0B4_00D:
        ::                                       * A2E7B
          {                                      * A2E80
            BINT40                               * A2E85
            ::                                   * A2E8A
              LAM     'F                         * A2E8F
              ROMPTR  0B5 002                    * A2E9A
              BINT1                              * A2EA5
            ;                                    * A2EAA
            BINT61                               * A2EAF
            TRUE                                 * A2EB4
          }                                      * A2EB9
          EQLookup                               * A2EBE
          case                                   * A2EC3
          ::                                     * A2EC8
            EVAL                                 * A2ECD
            TRUE                                 * A2ED2
          ;                                      * A2ED7
          DROPFALSE                              * A2EDC
        ;                                        * A2EE1

* ROMPTR 0B4 00E
* refs (1): A2437
ROMP_0B4_00E:
        ::                                       * A2EE6
          LAM     'V                             * A2EEB
          LAM     'P                             * A2EF6
          #1+                                    * A2F01
          LAM     'p                             * A2F06
          OVER                                   * A2F11
          #<                                     * A2F16
          IT                                     * A2F1B
          DROPONE                                * A2F20
          ROMPTR  0B4 011                        * A2F25
          14GETLAM                               * A2F30
          #1<>                                   * A2F35
          IT                                     * A2F3A
          ::                                     * A2F3F
            BINT2                                * A2F44
            ROMPTR  0B0 06B                      * A2F49
          ;                                      * A2F54
        ;                                        * A2F59

* ROMPTR 0B4 00F
* refs (1): A2437
ROMP_0B4_00F:
        ::                                       * A2F5E
          TakeOver                               * A2F63
          LAM     'I                             * A2F68
          DUP                                    * A2F73
          MINUSONE                               * A2F78
          EQUAL                                  * A2F7D
          casedrop                               * A2F82
          DoBadKey                               * A2F87
          INCOMPDROP                             * A2F8C
          ROT                                    * A2F91
          BINT4                                  * A2F96
          ROMPTR  0B0 074                        * A2F9B
          $       ": "                           * A2FA6
          &$                                     * A2FB4
          ROT                                    * A2FB9
          BINT4                                  * A2FBE
          ROMPTR  0B0 074                        * A2FC3
          &$                                     * A2FCE
          CHR_Newline                            * A2FD3
          >T$                                    * A2FD8
          SWAP&$                                 * A2FDD
          BINT15                                 * A2FE2
          BINT2                                  * A2FE7
          MINUSONE                               * A2FEC
          '                                      * A2FF1
          ROMPTR  0B1 002                        * A2FF6  ~MsgBoxMenu
          ROMPTR  0B1 000                        * A3001  ~DoMsgBox
          DROP                                   * A300C
          SetDA123NoCh                           * A3011
        ;                                        * A3016

* ROMPTR 0B4 010
* refs (1): A2437
ROMP_0B4_010:
        ::                                       * A301B
          TakeOver                               * A3020
          ROMPTR  0B4 015                        * A3025
          5GETLAM                                * A3030
          #1=                                    * A3035
          case                                   * A303A
          ::                                     * A303F
            BINT1                                * A3044
            ROMPTR  0B0 0C5                      * A3049  ~gFldVal
            ROMPTR  0B5 004                      * A3054
            ITE                                  * A305F
            ::                                   * A3064
              SWAP                               * A3069
              OBJ_158B9                          * A306E
              OBJ_15909                          * A3073
              SWAP                               * A3078
              OBJ_158DC                          * A307D
              OBJ_15909                          * A3082
            ;                                    * A3087
            ::                                   * A308C
              OBJ_158FF                          * A3091
              OBJ_15909                          * A3096
            ;                                    * A309B
            AtUserStack                          * A30A0
            SetDA123NoCh                         * A30A5
          ;                                      * A30AA
          LAM     'V                             * A30AF
          ROMPTR  0B4 014                        * A30BA
          5GETLAM                                * A30C5
          #1-                                    * A30CA
          NTHCOMPDROP                            * A30CF
          ROMPTR  0EA 02B                        * A30D4
          1LAMBIND                               * A30DF
          ROMPTR  0B5 003                        * A30E4
          1GETABND                               * A30EF
          ROMPTR  0EA 02B                        * A30F4
          EQUAL                                  * A30FF
          IT                                     * A3104
          ::                                     * A3109
            SetDA1NoCh                           * A310E
            SetDA2aNoCh                          * A3113
          ;                                      * A3118
          LAM     'V                             * A311D
          ROMPTR  0B4 014                        * A3128
          5GETLAM                                * A3133
          #1-                                    * A3138
          NTHCOMPDROP                            * A313D
          DUP                                    * A3142
          ROMPTR  0B5 005                        * A3147
          ?SKIP                                  * A3152
          %0_2A2B4                               * A3157
          2DUP                                   * A315C
          SWAP                                   * A3161
          ID>TAG                                 * A3166
          3UNROLL                                * A316B
          DUP                                    * A3170
          5GETLAM                                * A3175
          ROMPTR  0B0 0D5                        * A317A  ~sFldVal
          5ROLL                                  * A3185
          BINT3                                  * A318A
          {}N                                    * A318F
          '                                      * A3194
          LAM     'I                             * A3199
          STOLAM                                 * A31A4
          SWAP                                   * A31A9
          NOTcasedrop                            * A31AE
          ERROROUT                               * A31B3
          AtUserStack                            * A31B8
          5GETLAM                                * A31BD
          ROMPTR  0B0 0A2                        * A31C2
        ;                                        * A31CD

* ROMPTR 0B4 011
* refs (1): A2437
ROMP_0B4_011:
        ::                                       * A31D2
          ROMPTR  0B4 015                        * A31D7
          '                                      * A31E2
          LAM     'P                             * A31E7
          STOLAM                                 * A31F2
          '                                      * A31F7
          LAM     'V                             * A31FC
          STOLAM                                 * A3207
          BINT0                                  * A320C
          '                                      * A3211
          LAM     'IX                            * A3216
          STOLAM                                 * A3223
          TRUE                                   * A3228
          11PUTLAM                               * A322D
        ;                                        * A3232

* ROMPTR 0B4 012
* refs (1): A2437
ROMP_0B4_012:
        ::                                       * A3237
          DUPNULL{}?                             * A323C
          ?SEMI                                  * A3241
          INNERCOMP                              * A3246
          DUP                                    * A324B
          1LAMBIND                               * A3250
          ZERO_DO                                * A3255
          ISTOP@                                 * A325A
          ROLL                                   * A325F
          ID>$                                   * A3264
          PTR     CHR_:                          * A3269
          >T$                                    * A326E
          LOOP                                   * A3273
          1GETABND                               * A3278
          {}N                                    * A327D
        ;                                        * A3282

* ROMPTR 0B4 013
* refs (1): A2437
ROMP_0B4_013:
        ::                                       * A3287
          LAM     'V                             * A328C
          LENCOMP                                * A3297
          BINT12                                 * A329C
          #>                                     * A32A1
        ;                                        * A32A6

* ROMPTR 0B4 014
* refs (1): A2437
ROMP_0B4_014:
        ::                                       * A32AB
          BINT12                                 * A32B0
          DUP                                    * A32B5
          LAM     'P                             * A32BA
          #1-                                    * A32C5
          #*                                     * A32CA
          #1+                                    * A32CF
          SWAP                                   * A32D4
          #1-                                    * A32D9
          OVER                                   * A32DE
          #+                                     * A32E3
          3PICK                                  * A32E8
          LENCOMP                                * A32ED
          #MIN                                   * A32F2
          SUBCOMP                                * A32F7
        ;                                        * A32FC

* ROMPTR 0B4 015
* refs (1): A2437
ROMP_0B4_015:
        ::                                       * A3301
          ROMPTR  0B0 0C8                        * A3306  GetFieldVals
          ROMPTR  0B4 016                        * A3311
        ;                                        * A331C

* ROMPTR 0B4 016
* refs (1): A2437
ROMP_0B4_016:
        ::                                       * A3321
          LAM     'V                             * A3326
          DUPNULL{}?                             * A3331
          casedrop                               * A3336
          ROMPTR  0B5 001                        * A333B
          ROMPTR  0B4 014                        * A3346
          DUP                                    * A3351
          LENCOMP                                * A3356
          #1+_ONE_DO                             * A335B
          ::                                     * A3360
            ISTOP-INDEX                          * A3365
            #1+                                  * A336A
            ROLL                                 * A336F
            DUP                                  * A3374
            MINUSONE                             * A3379
            EQUAL                                * A337E
            caseDROP                             * A3383
            OVER                                 * A3388
            INDEX@                               * A338D
            NTHCOMPDROP                          * A3392
            ROMPTR  0B5 006                      * A3397
          ;                                      * A33A2
          LOOP                                   * A33A7
          DROP                                   * A33AC
          ROMPTR  0B5 001                        * A33B1
        ;                                        * A33BC

* ROMPTR 0B4 017
* refs (1): A2437
ROMP_0B4_017:
        ::                                       * A33C1
          #       BF0F                           * A33C6  48911
          BINT1                                  * A33D0
          BINT10                                 * A33D5
          #       BF10                           * A33DA  48912
          BINT37                                 * A33E4
          BINT10                                 * A33E9
          #       BF11                           * A33EE  48913
          BINT85                                 * A33F8
          BINT10                                 * A33FD
          #       BF12                           * A3402  48914
          BINT1                                  * A340C
          BINT19                                 * A3411
          #       BF13                           * A3416  48915
          BINT40                                 * A3420
          BINT19                                 * A3425
          #       BF14                           * A342A  48916
          BINT85                                 * A3434
          BINT19                                 * A3439
          #       BF15                           * A343E  48917
          BINT1                                  * A3448
          BINT28                                 * A344D
          #       BF13                           * A3452  48915
          BINT40                                 * A345C
          BINT28                                 * A3461
          #       BF14                           * A3466  48916
          BINT85                                 * A3470
          BINT28                                 * A3475
          #       BF16                           * A347A  48918
          BINT1                                  * A3484
          BINT37                                 * A3489
          #       BF17                           * A348E  48919
          BINT52                                 * A3498
          BINT37                                 * A349D
          #       BF18                           * A34A2  48920
          BINT113                                * A34AC
          BINT37                                 * A34B1
          OBJ_38345                              * A34B6
          ROMPTR  0B4 020                        * A34BB
          BINT25                                 * A34C6
          BINT8                                  * A34CB
          #       67                             * A34D0  103
          BINT9                                  * A34DA
          BINT23                                 * A34DF
          {                                      * A34E4
            BINT9                                * A34E9
            BINT8                                * A34EE
            BINT6                                * A34F3
            BINT0                                * A34F8
            BINT3                                * A34FD
          }                                      * A3502
          BINT4                                  * A3507
          #       BF19                           * A350C  48921
          #       BF0A                           * A3516  48906
          MINUSONE                               * A3520
          MINUSONE                               * A3525
          MINUSONE                               * A352A
          OBJ_38345                              * A352F
          ROMPTR  0B4 021                        * A3534
          BINT10                                 * A353F
          BINT8                                  * A3544
          BINT25                                 * A3549
          BINT9                                  * A354E
          BINT23                                 * A3553
          {                                      * A3558
            BINT9                                * A355D
            BINT8                                * A3562
            BINT6                                * A3567
            BINT0                                * A356C
            BINT3                                * A3571
          }                                      * A3576
          BINT4                                  * A357B
          #       BF19                           * A3580  48921
          #       BF0A                           * A358A  48906
          MINUSONE                               * A3594
          MINUSONE                               * A3599
          MINUSONE                               * A359E
          OBJ_38345                              * A35A3
          ROMPTR  0B4 021                        * A35A8
          BINT58                                 * A35B3
          BINT8                                  * A35B8
          BINT25                                 * A35BD
          BINT9                                  * A35C2
          BINT23                                 * A35C7
          {                                      * A35CC
            BINT9                                * A35D1
            BINT8                                * A35D6
            BINT6                                * A35DB
            BINT0                                * A35E0
            BINT3                                * A35E5
          }                                      * A35EA
          BINT4                                  * A35EF
          #       BF1A                           * A35F4  48922
          #       BF0A                           * A35FE  48906
          MINUSONE                               * A3608
          MINUSONE                               * A360D
          MINUSONE                               * A3612
          OBJ_38345                              * A3617
          ROMPTR  0B4 021                        * A361C
          #       6A                             * A3627  106
          BINT8                                  * A3631
          BINT25                                 * A3636
          BINT9                                  * A363B
          BINT23                                 * A3640
          {                                      * A3645
            BINT9                                * A364A
            BINT8                                * A364F
            BINT6                                * A3654
            BINT0                                * A3659
            BINT3                                * A365E
          }                                      * A3663
          BINT4                                  * A3668
          #       BF1B                           * A366D  48923
          #       BF0A                           * A3677  48906
          MINUSONE                               * A3681
          MINUSONE                               * A3686
          MINUSONE                               * A368B
          OBJ_38345                              * A3690
          ROMPTR  0B4 01A                        * A3695
          BINT25                                 * A36A0
          BINT17                                 * A36A5
          BINT13                                 * A36AA
          BINT9                                  * A36AF
          BINT1                                  * A36B4
          {                                      * A36B9
            BINT6                                * A36BE
          }                                      * A36C3
          BINT4                                  * A36C8
          #       BF1C                           * A36CD  48924
          MINUSONE                               * A36D7
          MINUSONE                               * A36DC
          'IDX                                   * A36E1
          MINUSONE                               * A36E6
          OBJ_38345                              * A36EB
          ROMPTR  0B4 01A                        * A36F0
          BINT58                                 * A36FB
          BINT17                                 * A3700
          BINT25                                 * A3705
          BINT9                                  * A370A
          BINT1                                  * A370F
          {                                      * A3714
            BINT0                                * A3719
          }                                      * A371E
          BINT4                                  * A3723
          #       BF1D                           * A3728  48925
          MINUSONE                               * A3732
          MINUSONE                               * A3737
          %0_2A2B4                               * A373C
          MINUSONE                               * A3741
          OBJ_38345                              * A3746
          ROMPTR  0B4 01A                        * A374B
          #       6A                             * A3756  106
          BINT17                                 * A3760
          BINT25                                 * A3765
          BINT9                                  * A376A
          BINT1                                  * A376F
          {                                      * A3774
            BINT0                                * A3779
          }                                      * A377E
          BINT4                                  * A3783
          #       BF1E                           * A3788  48926
          MINUSONE                               * A3792
          MINUSONE                               * A3797
          %       6.5E0                          * A379C
          MINUSONE                               * A37B1
          OBJ_38345                              * A37B6
          ROMPTR  0B4 01A                        * A37BB
          BINT25                                 * A37C6
          BINT26                                 * A37CB
          BINT13                                 * A37D0
          BINT9                                  * A37D5
          BINT1                                  * A37DA
          {                                      * A37DF
            BINT6                                * A37E4
          }                                      * A37E9
          BINT4                                  * A37EE
          #       BF1F                           * A37F3  48927
          MINUSONE                               * A37FD
          MINUSONE                               * A3802
          '                                      * A3807
          ID      Y                              * A380C
          MINUSONE                               * A3815
          OBJ_38345                              * A381A
          ROMPTR  0B4 01A                        * A381F
          BINT58                                 * A382A
          BINT26                                 * A382F
          BINT25                                 * A3834
          BINT9                                  * A3839
          BINT1                                  * A383E
          {                                      * A3843
            BINT0                                * A3848
            BINT3                                * A384D
          }                                      * A3852
          BINT4                                  * A3857
          #       BF20                           * A385C  48928
          MINUSONE                               * A3866
          MINUSONE                               * A386B
          %0_2A2B4                               * A3870
          MINUSONE                               * A3875
          OBJ_38345                              * A387A
          ROMPTR  0B4 024                        * A387F
          #       6A                             * A388A  106
          BINT26                                 * A3894
          BINT25                                 * A3899
          BINT9                                  * A389E
          BINT1                                  * A38A3
          {                                      * A38A8
            BINT0                                * A38AD
            BINT3                                * A38B2
          }                                      * A38B7
          BINT4                                  * A38BC
          #       BF21                           * A38C1  48929
          MINUSONE                               * A38CB
          MINUSONE                               * A38D0
          MINUSONE                               * A38D5
          MINUSONE                               * A38DA
          OBJ_38345                              * A38DF
          ROMPTR  0B4 01A                        * A38E4
          BINT16                                 * A38EF
          BINT35                                 * A38F4
          BINT31                                 * A38F9
          BINT9                                  * A38FE
          BINT1                                  * A3903
          {                                      * A3908
            BINT0                                * A390D
          }                                      * A3912
          BINT4                                  * A3917
          #       BF22                           * A391C  48930
          MINUSONE                               * A3926
          MINUSONE                               * A392B
          %       1E-4                           * A3930
          MINUSONE                               * A3945
          OBJ_38345                              * A394A
          ROMPTR  0B4 026                        * A394F
          #       49                             * A395A  73
          BINT35                                 * A3964
          BINT25                                 * A3969
          BINT9                                  * A396E
          BINT1                                  * A3973
          {                                      * A3978
            BINT0                                * A397D
          }                                      * A3982
          OBJ_38345                              * A3987
          ROMPTR  0B4 0E0                        * A398C
          #       BF23                           * A3997  48931
          MINUSONE                               * A39A1
          MINUSONE                               * A39A6
          BINT0                                  * A39AB
          MINUSONE                               * A39B0
          OBJ_38345                              * A39B5
          ROMPTR  0B4 027                        * A39BA
          #       6A                             * A39C5  106
          BINT35                                 * A39CF
          BINT6                                  * A39D4
          BINT9                                  * A39D9
          BINT32                                 * A39DE
          MINUSONE                               * A39E3
          MINUSONE                               * A39E8
          #       BF24                           * A39ED  48932
          MINUSONE                               * A39F7
          MINUSONE                               * A39FC
          FALSE                                  * A3A01
          MINUSONE                               * A3A06
          BINT12                                 * A3A0B
          BINT13                                 * A3A10
          OBJ_38345                              * A3A15
          ROMPTR  0B4 018                        * A3A1A
          #       BF0E                           * A3A25  48910
          ROMPTR  0B5 02A                        * A3A2F
          ROMPTR  0B5 02C                        * A3A3A
          CHECKPVARS                             * A3A45
          INCOMPDROP                             * A3A4A
          4UNROLL3DROP                           * A3A4F
          OBJ_37B03                              * A3A54
          OVER                                   * A3A59
          1get(li)?                              * A3A5E
          ROT                                    * A3A63
          ROMPTR  0B5 032                        * A3A68
          4PICK                                  * A3A73
          1get(li)?                              * A3A78
          5PICK                                  * A3A7D
          ROMPTR  0B5 064                        * A3A82
          6ROLL                                  * A3A8D
          ROMPTR  0B5 068                        * A3A92
          MINUSONE                               * A3A9D
          SWAP                                   * A3AA2
          BINT0                                  * A3AA7
          BINT9                                  * A3AAC
          PICK                                   * A3AB1
          MINUSONE                               * A3AB6
          EQUAL                                  * A3ABB
          NOT                                    * A3AC0
          BINT13                                 * A3AC5
          ROMPTR  0B0 0AA                        * A3ACA
          'NOP                                   * A3AD5
          {                                      * A3ADA
            LAM     'DE                          * A3ADF
          }                                      * A3AEC
          BIND                                   * A3AF1
          DoInputForm                            * A3AF6
          IT                                     * A3AFB
          ROMPTR  0B4 1F8                        * A3B00
          '                                      * A3B0B
          LAM     'DE                            * A3B10
          undo                                   * A3B1D
          DROP                                   * A3B22
          ABND                                   * A3B27
          EVAL                                   * A3B2C
        ;                                        * A3B31

* ROMPTR 0B4 018
* refs (1): A2437
ROMP_0B4_018:
        ::                                       * A3B36
          {                                      * A3B3B
            BINT14                               * A3B40
            ::                                   * A3B45
              BINT13                             * A3B4A
              ROMPTR  0B0 0C5                    * A3B4F  ~gFldVal
              ITE                                * A3B5A
              BINT2                              * A3B5F
              BINT1                              * A3B64
            ;                                    * A3B69
            BINT16                               * A3B6E
            ::                                   * A3B73
              ROMPTR  0B4 019                    * A3B78
              TRUE                               * A3B83
            ;                                    * A3B88
            BINT5                                * A3B8D
            ROMPTR  0B4 01F                      * A3B92
          }                                      * A3B9D
          EQLookup                               * A3BA2
          case                                   * A3BA7
          ::                                     * A3BAC
            EVAL                                 * A3BB1
            TRUE                                 * A3BB6
          ;                                      * A3BBB
          DROPFALSE                              * A3BC0
        ;                                        * A3BC5

* ROMPTR 0B4 019
* refs (1): A2437
ROMP_0B4_019:
        {                                        * A3BCA
          NullMenuKey                            * A3BCF
          {                                      * A3BD4
            $       "INIT+"                      * A3BD9
            ROMPTR  0B4 01D                      * A3BED
          }                                      * A3BF8
          {                                      * A3BFD
            $       "SOLVE"                      * A3C02
            ROMPTR  0B4 01E                      * A3C16
          }                                      * A3C21
        }                                        * A3C26

* ROMPTR 0B4 01A
* refs (1): A2437
ROMP_0B4_01A:
        ::                                       * A3C2B
          BINT8                                  * A3C30
          #<>case                                * A3C35
          FALSE                                  * A3C3A
          ROMPTR  0B4 01B                        * A3C3F
        ;                                        * A3C4A

* ROMPTR 0B4 01B
* refs (1): A2437
ROMP_0B4_01B:
        ::                                       * A3C4F
          EditExstCase                           * A3C54
          FALSE                                  * A3C59
          2DUP                                   * A3C5E
          Key>U/SKeyOb                           * A3C63
          '                                      * A3C68
          ROMPTR  0B4 045                        * A3C6D
          EQUAL                                  * A3C78
          NOTcaseFALSE                           * A3C7D
          2DROP                                  * A3C82
          '                                      * A3C87
          ROMPTR  0B4 01C                        * A3C8C
          TrueTrue                               * A3C97
        ;                                        * A3C9C

* ROMPTR 0B4 01C
* refs (1): A2437
ROMP_0B4_01C:
        ::                                       * A3CA1
          TakeOver                               * A3CA6
          '                                      * A3CAB
          ROMPTR  0B4 045                        * A3CB0
          '                                      * A3CBB
          LAM     'DE                            * A3CC0
          STOLAM                                 * A3CCD
          ROMPTR  0B0 0C8                        * A3CD2  GetFieldVals
          ROMPTR  0B4 1F8                        * A3CDD
          TRUE                                   * A3CE8
          11PUTLAM                               * A3CED
          FALSE                                  * A3CF2
        ;                                        * A3CF7

* ROMPTR 0B4 01D
* refs (1): A2437
ROMP_0B4_01D:
        ::                                       * A3CFC
          TakeOver                               * A3D01
          BINT10                                 * A3D06
          ROMPTR  0B0 0C5                        * A3D0B  ~gFldVal
          MINUSONE                               * A3D16
          EQUAL                                  * A3D1B
          caseDoBadKey                           * A3D20
          BINT7                                  * A3D25
          ROMPTR  0B0 0C5                        * A3D2A  ~gFldVal
          BINT6                                  * A3D35
          ROMPTR  0B0 0D5                        * A3D3A  ~sFldVal
          BINT10                                 * A3D45
          ROMPTR  0B0 0C5                        * A3D4A  ~gFldVal
          BINT9                                  * A3D55
          ROMPTR  0B0 0D5                        * A3D5A  ~sFldVal
          BINT6                                  * A3D65
          ROMPTR  0B0 0A2                        * A3D6A
          BINT9                                  * A3D75
          ROMPTR  0B0 0A2                        * A3D7A
          SetDA123NoCh                           * A3D85
        ;                                        * A3D8A

* ROMPTR 0B4 01E
* refs (1): A2437
ROMP_0B4_01E:
        ::                                       * A3D8F
          TakeOver                               * A3D94
          ROMPTR  0B0 0C8                        * A3D99  GetFieldVals
          ROMPTR  0B4 1F8                        * A3DA4
          ROMPTR  0B0 0C8                        * A3DAF  GetFieldVals
          4ROLL                                  * A3DBA
          DROP                                   * A3DBF
          SWAP                                   * A3DC4
          DUP                                    * A3DC9
          BINT0                                  * A3DCE
          EQUAL                                  * A3DD3
          IT                                     * A3DD8
          OBJ_56B87                              * A3DDD
          SWAP                                   * A3DE2
          ITE                                    * A3DE7
          ::                                     * A3DEC
            BINT11                               * A3DF1
            ROLL                                 * A3DF6
            DROP                                 * A3DFB
            ROMPTR  0B5 067                      * A3E00
          ;                                      * A3E0B
          ::                                     * A3E10
            8ROLL                                * A3E15
            DROP                                 * A3E1A
            8ROLL                                * A3E1F
            DROP                                 * A3E24
            8ROLL                                * A3E29
            DROP                                 * A3E2E
            ROMPTR  0B5 066                      * A3E33
          ;                                      * A3E3E
          2DUP                                   * A3E43
          BINT10                                 * A3E48
          ROMPTR  0B0 0D5                        * A3E4D  ~sFldVal
          BINT10                                 * A3E58
          ROMPTR  0B0 0A2                        * A3E5D
          BINT11                                 * A3E68
          ROMPTR  0B0 0D5                        * A3E6D  ~sFldVal
          BINT11                                 * A3E78
          ROMPTR  0B0 0A2                        * A3E7D
          SWAP                                   * A3E88
          #       BF26                           * A3E8D  48934
          OBJ_15909                              * A3E97
          SWAP                                   * A3E9C
          #       BF27                           * A3EA1  48935
          OBJ_15909                              * A3EAB
          AtUserStack                            * A3EB0
          SetDA123NoCh                           * A3EB5
        ;                                        * A3EBA

* ROMPTR 0B4 01F
* refs (1): A2437
ROMP_0B4_01F:
        ::                                       * A3EBF
          BINT39                                 * A3EC4
          BINT131                                * A3EC9
          MAKEGROB                               * A3ECE
          BINT1                                  * A3ED3
          ROMPTR  0B0 012                        * A3ED8
          15GETLAM                               * A3EE3
          #1+                                    * A3EE8
          ROMPTR  0B4 02A                        * A3EED
          ITE                                    * A3EF8
          BINT2                                  * A3EFD
          BINT4                                  * A3F02
          DO                                     * A3F07
          INDEX@                                 * A3F0C
          ROMPTR  0B0 012                        * A3F11
          LOOP                                   * A3F1C
          FALSE                                  * A3F21
        ;                                        * A3F26

* ROMPTR 0B4 020
* refs (1): A2437
ROMP_0B4_020:
        ::                                       * A3F2B
          BINT7                                  * A3F30
          #=casedrop                             * A3F35
          ROMPTR  0B4 02A                        * A3F3A
          BINT55                                 * A3F45
          OVER                                   * A3F4A
          #<>case                                * A3F4F
          ROMPTR  0B4 022                        * A3F54
          DROP                                   * A3F5F
          ROMPTR  0B4 02A                        * A3F64
          NOT                                    * A3F6F
          TRUE                                   * A3F74
        ;                                        * A3F79

* ROMPTR 0B4 021
* refs (1): A2437
ROMP_0B4_021:
        ::                                       * A3F7E
          BINT7                                  * A3F83
          #=casedrop                             * A3F88
          ::                                     * A3F8D
            ROMPTR  0B4 02A                      * A3F92
            NOT                                  * A3F9D
          ;                                      * A3FA2
          BINT55                                 * A3FA7
          OVER                                   * A3FAC
          #<>case                                * A3FB1
          ROMPTR  0B4 022                        * A3FB6
          DROP                                   * A3FC1
          ROMPTR  0B4 02A                        * A3FC6
          TRUE                                   * A3FD1
        ;                                        * A3FD6

* ROMPTR 0B4 022
* refs (1): A2437
ROMP_0B4_022:
        ::                                       * A3FDB
          BINT43                                 * A3FE0
          OVER                                   * A3FE5
          #<>case                                * A3FEA
          ROMPTR  0B4 01A                        * A3FEF
          DROP                                   * A3FFA
          ROMPTR  0B4 023                        * A3FFF
          TrueTrue                               * A400A
        ;                                        * A400F

* ROMPTR 0B4 023
* refs (1): A2437
ROMP_0B4_023:
        ::                                       * A4014
          {                                      * A4019
            NullMenuKey                          * A401E
            NullMenuKey                          * A4023
          }                                      * A4028
          BINT8                                  * A402D
          ROMPTR  0B0 0C5                        * A4032  ~gFldVal
          >HCOMP                                 * A403D
          BINT5                                  * A4042
          ROMPTR  0B0 0C5                        * A4047  ~gFldVal
          >HCOMP                                 * A4052
        ;                                        * A4057

* ROMPTR 0B4 024
* refs (1): A2437
ROMP_0B4_024:
        ::                                       * A405C
          BINT44                                 * A4061
          OVER                                   * A4066
          #<>case                                * A406B
          ROMPTR  0B4 01A                        * A4070
          DROP                                   * A407B
          ROMPTR  0B4 025                        * A4080
          TRUE                                   * A408B
        ;                                        * A4090

* ROMPTR 0B4 025
* refs (1): A2437
ROMP_0B4_025:
        ::                                       * A4095
          EDITPARTS                              * A409A
          BINT1                                  * A409F
          #>                                     * A40A4
          InitEd&Modes                           * A40A9
          ROMPTR  0B0 0A7                        * A40AE
          ITE                                    * A40B9
          SetDA1NoCh                             * A40BE
          ::                                     * A40C3
            SetDA1NoCh                           * A40C8
            SetDA2aNoCh                          * A40CD
          ;                                      * A40D2
        ;                                        * A40D7

* ROMPTR 0B4 026
* refs (1): A2437
ROMP_0B4_026:
        ::                                       * A40DC
          BINT41                                 * A40E1
          OVER                                   * A40E6
          #<>case                                * A40EB
          ROMPTR  0B4 01A                        * A40F0
          DROP                                   * A40FB
          ROMPTR  0B4 02B                        * A4100
          TRUE                                   * A410B
        ;                                        * A4110

* ROMPTR 0B4 027
* refs (1): A2437
ROMP_0B4_027:
        ::                                       * A4115
          BINT47                                 * A411A
          OVER                                   * A411F
          #<>case                                * A4124
          ROMPTR  0B4 01A                        * A4129
          DROP                                   * A4134
          ROMPTR  0B4 028                        * A4139
          ROMPTR  0B4 029                        * A4144
          TRUE                                   * A414F
        ;                                        * A4154

* ROMPTR 0B4 028
* refs (1): A2437
ROMP_0B4_028:
        ::                                       * A4159
          ROMPTR  0B4 02A                        * A415E
          DUP                                    * A4169
          ITE                                    * A416E
          BINT1                                  * A4173
          BINT2                                  * A4178
          ROMPTR  0B0 0C5                        * A417D  ~gFldVal
          SWAP                                   * A4188
          ITE                                    * A418D
          BINT2                                  * A4192
          BINT1                                  * A4197
          ROMPTR  0B0 0D5                        * A419C  ~sFldVal
        ;                                        * A41A7

* ROMPTR 0B4 029
* refs (1): A2437
ROMP_0B4_029:
        ::                                       * A41AC
          ROMPTR  0B4 02A                        * A41B1
          ITE                                    * A41BC
          ::                                     * A41C1
            BINT5                                * A41C6
            BINT2                                * A41CB
            BINT4                                * A41D0
            BINT1                                * A41D5
          ;                                      * A41DA
          ::                                     * A41DF
            BINT2                                * A41E4
            BINT1                                * A41E9
            2DUP                                 * A41EE
          ;                                      * A41F3
          HARDBUFF                               * A41F8
          3UNROLL                                * A41FD
          BINT8                                  * A4202
          BINT9                                  * A4207
          BLANKIT                                * A420C
          DO                                     * A4211
          INDEX@                                 * A4216
          ROMPTR  0B0 012                        * A421B
          LOOP                                   * A4226
          DROP                                   * A422B
          DO                                     * A4230
          INDEX@                                 * A4235
          ROMPTR  0B0 0A2                        * A423A
          LOOP                                   * A4245
        ;                                        * A424A

* ROMPTR 0B4 02A
* refs (1): A2437
ROMP_0B4_02A:
        ::                                       * A424F
          BINT13                                 * A4254
          ROMPTR  0B0 0C5                        * A4259  ~gFldVal
        ;                                        * A4264

* ROMPTR 0B4 02B
* refs (1): A2437
ROMP_0B4_02B:
        ::                                       * A4269
          4GETLAM                                * A426E
          ROMPTR  0B0 0C5                        * A4273  ~gFldVal
          DUPTYPEBINT?                           * A427E
          NOTcase                                * A4283
          TRUE                                   * A4288
          OBJ_56B87                              * A428D
          TRUE                                   * A4292
        ;                                        * A4297

* ROMPTR 0B4 02C
* refs (1): A2437
ROMP_0B4_02C:
        ::                                       * A429C
          #       BF29                           * A42A1  48937
          BINT1                                  * A42AB
          BINT10                                 * A42B0
          #       BF2A                           * A42B5  48938
          BINT1                                  * A42BF
          BINT28                                 * A42C4
          OBJ_38345                              * A42C9
          ROMPTR  0B4 031                        * A42CE
          BINT7                                  * A42D9
          BINT17                                 * A42DE
          #       79                             * A42E3  121
          BINT9                                  * A42ED
          BINT1                                  * A42F2
          {                                      * A42F7
            BINT3                                * A42FC
            BINT4                                * A4301
          }                                      * A4306
          BINT4                                  * A430B
          #       BF2B                           * A4310  48939
          MINUSONE                               * A431A
          MINUSONE                               * A431F
          MINUSONE                               * A4324
          DUP                                    * A4329
          OBJ_38345                              * A432E
          ROMPTR  0B4 031                        * A4333
          BINT7                                  * A433E
          BINT35                                 * A4343
          #       79                             * A4348  121
          BINT9                                  * A4352
          BINT1                                  * A4357
          {                                      * A435C
            BINT3                                * A4361
            BINT4                                * A4366
          }                                      * A436B
          BINT4                                  * A4370
          #       BF2C                           * A4375  48940
          MINUSONE                               * A437F
          MINUSONE                               * A4384
          MINUSONE                               * A4389
          DUP                                    * A438E
          BINT2                                  * A4393
          DUP                                    * A4398
          OBJ_38345                              * A439D
          ROMPTR  0B4 02D                        * A43A2
          #       BF28                           * A43AD  48936
          DoInputForm                            * A43B7
          case2DROP                              * A43BC
        ;                                        * A43C1

* ROMPTR 0B4 02D
* refs (1): A2437
ROMP_0B4_02D:
        ::                                       * A43C6
          BINT16                                 * A43CB
          #<>case                                * A43D0
          FALSE                                  * A43D5
          ROMPTR  0B4 02E                        * A43DA
          TrueTrue                               * A43E5
        ;                                        * A43EA

* ROMPTR 0B4 02E
* refs (1): A2437
ROMP_0B4_02E:
        {                                        * A43EF
          NullMenuKey                            * A43F4
          {                                      * A43F9
            $       "SYMB"                       * A43FE
            ROMPTR  0B4 02F                      * A4410
          }                                      * A441B
          {                                      * A4420
            $       "SOLVE"                      * A4425
            ROMPTR  0B4 030                      * A4439
          }                                      * A4444
        }                                        * A4449

* ROMPTR 0B4 02F
* refs (1): A2437
ROMP_0B4_02F:
        ::                                       * A444E
          TakeOver                               * A4453
          5GETLAM                                * A4458
          #1=                                    * A445D
          ITE                                    * A4462
          ::                                     * A4467
            BINT1                                * A446C
            ROMPTR  0B0 0C5                      * A4471  ~gFldVal
            ROMPTR  0B5 007                      * A447C
          ;                                      * A4487
          ::                                     * A448C
            BINT2                                * A4491
            ROMPTR  0B0 0C5                      * A4496  ~gFldVal
            ROMPTR  0B5 009                      * A44A1
          ;                                      * A44AC
          AtUserStack                            * A44B1
          SetDA123NoCh                           * A44B6
        ;                                        * A44BB

* ROMPTR 0B4 030
* refs (1): A2437
ROMP_0B4_030:
        ::                                       * A44C0
          TakeOver                               * A44C5
          5GETLAM                                * A44CA
          #1=                                    * A44CF
          ITE                                    * A44D4
          ::                                     * A44D9
            BINT2                                * A44DE
            ROMPTR  0B0 0C5                      * A44E3  ~gFldVal
            ROMPTR  0B5 00A                      * A44EE
            DUP                                  * A44F9
            BINT1                                * A44FE
            ROMPTR  0B0 0D5                      * A4503  ~sFldVal
            #       BF2D                         * A450E  48941
          ;                                      * A4518
          ::                                     * A451D
            BINT1                                * A4522
            ROMPTR  0B0 0C5                      * A4527  ~gFldVal
            ROMPTR  0B5 00B                      * A4532
            DUP                                  * A453D
            BINT2                                * A4542
            ROMPTR  0B0 0D5                      * A4547  ~sFldVal
            #       BF2E                         * A4552  48942
          ;                                      * A455C
          5GETLAM                                * A4561
          ROMPTR  0B0 0A2                        * A4566
          OBJ_15909                              * A4571
          AtUserStack                            * A4576
          SetDA123NoCh                           * A457B
        ;                                        * A4580

* ROMPTR 0B4 031
* refs (1): A2437
ROMP_0B4_031:
        ::                                       * A4585
          BINT23                                 * A458A
          #<>case                                * A458F
          FALSE                                  * A4594
          ROMPTR  0B4 032                        * A4599
          TRUE                                   * A45A4
        ;                                        * A45A9

* ROMPTR 0B4 032
* refs (1): A2437
ROMP_0B4_032:
        ::                                       * A45AE
          4GETLAM                                * A45B3
          ROMPTR  0B0 078                        * A45B8
          ROMPTR  0B5 00C                        * A45C3
          NOT?SEMI                               * A45CE
          4GETLAM                                * A45D3
          ROMPTR  0B0 0D5                        * A45D8  ~sFldVal
        ;                                        * A45E3

* ROMPTR 0B4 033
* refs (1): A2437
ROMP_0B4_033:
        ::                                       * A45E8
          #       BF30                           * A45ED  48944
          BINT1                                  * A45F7
          BINT10                                 * A45FC
          #       BF31                           * A4601  48945
          BINT1                                  * A460B
          BINT19                                 * A4610
          #       BF32                           * A4615  48946
          BINT1                                  * A461F
          BINT28                                 * A4624
          OBJ_38345                              * A4629
          ROMPTR  0B4 037                        * A462E
          BINT10                                 * A4639
          BINT8                                  * A463E
          BINT115                                * A4643
          BINT9                                  * A4648
          BINT21                                 * A464D
          {                                      * A4652
            BINT3                                * A4657
            BINT4                                * A465C
          }                                      * A4661
          BINT4                                  * A4666
          #       BF33                           * A466B  48947
          #       BE1A                           * A4675  48666
          MINUSONE                               * A467F
          MINUSONE                               * A4684
          DUP                                    * A4689
          OBJ_38345                              * A468E
          ROMPTR  0B4 031                        * A4693
          BINT10                                 * A469E
          BINT17                                 * A46A3
          BINT115                                * A46A8
          BINT9                                  * A46AD
          BINT21                                 * A46B2
          {                                      * A46B7
            BINT3                                * A46BC
            BINT4                                * A46C1
          }                                      * A46C6
          BINT4                                  * A46CB
          #       BF34                           * A46D0  48948
          #       BE1A                           * A46DA  48666
          MINUSONE                               * A46E4
          MINUSONE                               * A46E9
          DUP                                    * A46EE
          OBJ_38345                              * A46F3
          ROMPTR  0B4 031                        * A46F8
          BINT10                                 * A4703
          BINT26                                 * A4708
          BINT115                                * A470D
          BINT9                                  * A4712
          BINT21                                 * A4717
          {                                      * A471C
            BINT3                                * A4721
            BINT4                                * A4726
          }                                      * A472B
          BINT4                                  * A4730
          #       BF35                           * A4735  48949
          #       BE1A                           * A473F  48666
          MINUSONE                               * A4749
          MINUSONE                               * A474E
          DUP                                    * A4753
          BINT3                                  * A4758
          DUP                                    * A475D
          OBJ_38345                              * A4762
          ROMPTR  0B4 034                        * A4767
          #       BF2F                           * A4772  48943
          DoInputForm                            * A477C
          case                                   * A4781
          3DROP                                  * A4786
        ;                                        * A478B

* ROMPTR 0B4 034
* refs (1): A2437
ROMP_0B4_034:
        ::                                       * A4790
          BINT16                                 * A4795
          #<>case                                * A479A
          FALSE                                  * A479F
          ROMPTR  0B4 035                        * A47A4
          TrueTrue                               * A47AF
        ;                                        * A47B4

* ROMPTR 0B4 035
* refs (1): A2437
ROMP_0B4_035:
        {                                        * A47B9
          NullMenuKey                            * A47BE
          NullMenuKey                            * A47C3
          {                                      * A47C8
            ::                                   * A47CD
              TakeOver                           * A47D2
              5GETLAM                            * A47D7
              #>1                                * A47DC
              ITE                                * A47E1
              $       "SOLVE"                    * A47E6
              NULL$                              * A47FA
            ;                                    * A47FF
            ROMPTR  0B4 036                      * A4804
          }                                      * A480F
        }                                        * A4814

* ROMPTR 0B4 036
* refs (1): A2437
ROMP_0B4_036:
        ::                                       * A4819
          TakeOver                               * A481E
          5GETLAM                                * A4823
          DUP                                    * A4828
          #1=                                    * A482D
          casedrop                               * A4832
          DoBadKey                               * A4837
          BINT1                                  * A483C
          ROMPTR  0B0 0C5                        * A4841  ~gFldVal
          SWAP                                   * A484C
          #2=                                    * A4851
          ITE                                    * A4856
          ::                                     * A485B
            BINT3                                * A4860
            ROMPTR  0B0 0C5                      * A4865  ~gFldVal
            ROMPTR  0B5 00E                      * A4870
            DUP                                  * A487B
            BINT2                                * A4880
            ROMPTR  0B0 0D5                      * A4885  ~sFldVal
            BINT2                                * A4890
            ROMPTR  0B0 0A2                      * A4895
            #       BF36                         * A48A0  48950
          ;                                      * A48AA
          ::                                     * A48AF
            BINT2                                * A48B4
            ROMPTR  0B0 0C5                      * A48B9  ~gFldVal
            ROMPTR  0B5 00D                      * A48C4
            DUP                                  * A48CF
            BINT3                                * A48D4
            ROMPTR  0B0 0D5                      * A48D9  ~sFldVal
            BINT3                                * A48E4
            ROMPTR  0B0 0A2                      * A48E9
            #       BF37                         * A48F4  48951
          ;                                      * A48FE
          OBJ_15909                              * A4903
          AtUserStack                            * A4908
          SetDA123NoCh                           * A490D
        ;                                        * A4912

* ROMPTR 0B4 037
* refs (1): A2437
ROMP_0B4_037:
        ::                                       * A4917
          {                                      * A491C
            BINT20                               * A4921
            SetDA3Bad                            * A4926
            BINT19                               * A492B
            SetDA3Bad                            * A4930
          }                                      * A4935
          EQLookup                               * A493A
          case                                   * A493F
          ::                                     * A4944
            EVAL                                 * A4949
            TRUE                                 * A494E
          ;                                      * A4953
          ROMPTR  0B4 031                        * A4958
        ;                                        * A4963

* ROMPTR 0B4 038
* refs (1): A2437
ROMP_0B4_038:
        ::                                       * A4968
          #       BF38                           * A496D  48952
          BINT1                                  * A4977
          BINT10                                 * A497C
          #       BF39                           * A4981  48953
          BINT61                                 * A498B
          BINT10                                 * A4990
          #       BF3A                           * A4995  48954
          BINT1                                  * A499F
          BINT19                                 * A49A4
          #       BF3B                           * A49A9  48955
          BINT1                                  * A49B3
          BINT28                                 * A49B8
          #       BF3C                           * A49BD  48956
          #       58                             * A49C7  88
          BINT28                                 * A49D1
          #       BF3D                           * A49D6  48957
          BINT1                                  * A49E0
          BINT37                                 * A49E5
          'DROPFALSE                             * A49EA
          BINT19                                 * A49EF
          BINT8                                  * A49F4
          BINT25                                 * A49F9
          BINT9                                  * A49FE
          BINT1                                  * A4A03
          {                                      * A4A08
            BINT0                                * A4A0D
          }                                      * A4A12
          BINT4                                  * A4A17
          #       BF3E                           * A4A1C  48958
          MINUSONE                               * A4A26
          MINUSONE                               * A4A2B
          %0_2A2B4                               * A4A30
          MINUSONE                               * A4A35
          'DROPFALSE                             * A4A3A
          BINT79                                 * A4A3F
          BINT8                                  * A4A44
          BINT37                                 * A4A49
          BINT9                                  * A4A4E
          BINT1                                  * A4A53
          {                                      * A4A58
            BINT0                                * A4A5D
          }                                      * A4A62
          BINT4                                  * A4A67
          #       BF3F                           * A4A6C  48959
          MINUSONE                               * A4A76
          MINUSONE                               * A4A7B
          %0_2A2B4                               * A4A80
          MINUSONE                               * A4A85
          'DROPFALSE                             * A4A8A
          BINT19                                 * A4A8F
          BINT17                                 * A4A94
          BINT79                                 * A4A99
          BINT9                                  * A4A9E
          BINT1                                  * A4AA3
          {                                      * A4AA8
            BINT0                                * A4AAD
          }                                      * A4AB2
          OBJ_38345                              * A4AB7
          ROMPTR  0B5 024                        * A4ABC
          #       BF40                           * A4AC7  48960
          MINUSONE                               * A4AD1
          MINUSONE                               * A4AD6
          %0_2A2B4                               * A4ADB
          MINUSONE                               * A4AE0
          'DROPFALSE                             * A4AE5
          BINT19                                 * A4AEA
          BINT26                                 * A4AEF
          BINT61                                 * A4AF4
          BINT9                                  * A4AF9
          BINT1                                  * A4AFE
          {                                      * A4B03
            BINT0                                * A4B08
          }                                      * A4B0D
          OBJ_38345                              * A4B12
          ROMPTR  0B5 024                        * A4B17
          #       BF41                           * A4B22  48961
          MINUSONE                               * A4B2C
          MINUSONE                               * A4B31
          %0_2A2B4                               * A4B36
          MINUSONE                               * A4B3B
          OBJ_38345                              * A4B40
          ROMPTR  0B4 03E                        * A4B45
          #       6D                             * A4B50  109
          BINT26                                 * A4B5A
          BINT19                                 * A4B5F
          BINT9                                  * A4B64
          BINT1                                  * A4B69
          {                                      * A4B6E
            BINT0                                * A4B73
          }                                      * A4B78
          BINT4                                  * A4B7D
          #       BF42                           * A4B82  48962
          MINUSONE                               * A4B8C
          MINUSONE                               * A4B91
          %12                                    * A4B96
          MINUSONE                               * A4B9B
          'DROPFALSE                             * A4BA0
          BINT19                                 * A4BA5
          BINT35                                 * A4BAA
          BINT79                                 * A4BAF
          BINT9                                  * A4BB4
          BINT1                                  * A4BB9
          {                                      * A4BBE
            BINT0                                * A4BC3
          }                                      * A4BC8
          OBJ_38345                              * A4BCD
          ROMPTR  0B5 024                        * A4BD2
          #       BF43                           * A4BDD  48963
          MINUSONE                               * A4BE7
          MINUSONE                               * A4BEC
          %0_2A2B4                               * A4BF1
          MINUSONE                               * A4BF6
          'DROPFALSE                             * A4BFB
          #       6D                             * A4C00  109
          BINT35                                 * A4C0A
          BINT19                                 * A4C0F
          BINT9                                  * A4C14
          BINT12                                 * A4C19
          MINUSONE                               * A4C1E
          BINT33                                 * A4C23
          #       BF44                           * A4C28  48964
          ROMPTR  0B5 025                        * A4C32
          BINT17                                 * A4C3D
          ROMPTR  0B5 027                        * A4C42
          MINUSONE                               * A4C4D
          BINT6                                  * A4C52
          BINT7                                  * A4C57
          OBJ_38345                              * A4C5C
          ROMPTR  0B4 03B                        * A4C61
          #       BF45                           * A4C6C  48965
          ROMPTR  0B4 039                        * A4C76
          BINT7                                  * A4C81
          ROMPTR  0B0 0AA                        * A4C86
          DoInputForm                            * A4C91
          NOT?SEMI                               * A4C96
          ROMPTR  0B4 03A                        * A4C9B
        ;                                        * A4CA6

* ROMPTR 0B4 039
* refs (1): A2437
ROMP_0B4_039:
        ::                                       * A4CAB
          ROMPTR  0B5 00F                        * A4CB0
          ROMPTR  0B5 012                        * A4CBB
          ROMPTR  0B5 014                        * A4CC6
          ROMPTR  0B5 016                        * A4CD1
          ROMPTR  0B5 01A                        * A4CDC
          ROMPTR  0B5 018                        * A4CE7
          ROMPTR  0B5 01C                        * A4CF2
        ;                                        * A4CFD

* ROMPTR 0B4 03A
* refs (1): A2437
ROMP_0B4_03A:
        ::                                       * A4D02
          ROMPTR  0B5 01D                        * A4D07
          ROMPTR  0B5 019                        * A4D12
          ROMPTR  0B5 01B                        * A4D1D
          ROMPTR  0B5 017                        * A4D28
          ROMPTR  0B5 015                        * A4D33
          ROMPTR  0B5 013                        * A4D3E
          ROMPTR  0B5 010                        * A4D49
        ;                                        * A4D54

* ROMPTR 0B4 03B
* refs (1): A2437
ROMP_0B4_03B:
        ::                                       * A4D59
          BINT16                                 * A4D5E
          #<>case                                * A4D63
          FALSE                                  * A4D68
          ROMPTR  0B4 03C                        * A4D6D
          TrueTrue                               * A4D78
        ;                                        * A4D7D

* ROMPTR 0B4 03C
* refs (1): A2437
ROMP_0B4_03C:
        {                                        * A4D82
          NullMenuKey                            * A4D87
          {                                      * A4D8C
            ::                                   * A4D91
              PTR     DirLabel:                  * A4D96
              $       "AMOR"                     * A4D9B
            ;                                    * A4DAD
            ::                                   * A4DB2
              TakeOver                           * A4DB7
              ROMPTR  0B0 0C8                    * A4DBC  GetFieldVals
              ROMPTR  0B4 03A                    * A4DC7
              ROMPTR  0B4 03F                    * A4DD2
              ROMPTR  0B5 014                    * A4DDD
              BINT3                              * A4DE8
              ROMPTR  0B0 0D5                    * A4DED  ~sFldVal
            ;                                    * A4DF8
          }                                      * A4DFD
          {                                      * A4E02
            ::                                   * A4E07
              TakeOver                           * A4E0C
              5GETLAM                            * A4E11
              DUP                                * A4E16
              BINT5                              * A4E1B
              #<                                 * A4E20
              SWAP                               * A4E25
              BINT6                              * A4E2A
              #=                                 * A4E2F
              OR                                 * A4E34
              ITE                                * A4E39
              $       "SOLVE"                    * A4E3E
              NULL$                              * A4E52
            ;                                    * A4E57
            ROMPTR  0B4 03D                      * A4E5C
          }                                      * A4E67
        }                                        * A4E6C

* ROMPTR 0B4 03D
* refs (1): A2437
ROMP_0B4_03D:
        ::                                       * A4E71
          TakeOver                               * A4E76
          5GETLAM                                * A4E7B
          DUP                                    * A4E80
          BINT5                                  * A4E85
          #=                                     * A4E8A
          SWAP                                   * A4E8F
          BINT7                                  * A4E94
          #=                                     * A4E99
          OR                                     * A4E9E
          casedrop                               * A4EA3
          DoBadKey                               * A4EA8
          ROMPTR  0B0 0C8                        * A4EAD  GetFieldVals
          ROMPTR  0B4 03A                        * A4EB8
          {                                      * A4EC3
            ::                                   * A4EC8
              ROMPTR  0B5 01E                    * A4ECD
              #       BF46                       * A4ED8  48966
            ;                                    * A4EE2
            ::                                   * A4EE7
              ROMPTR  0B5 01F                    * A4EEC
              #       BF47                       * A4EF7  48967
            ;                                    * A4F01
            ::                                   * A4F06
              ROMPTR  0B5 020                    * A4F0B
              #       BF48                       * A4F16  48968
            ;                                    * A4F20
            ::                                   * A4F25
              ROMPTR  0B5 021                    * A4F2A
              #       BF49                       * A4F35  48969
            ;                                    * A4F3F
            NOP                                  * A4F44
            ::                                   * A4F49
              ROMPTR  0B5 022                    * A4F4E
              #       BF4A                       * A4F59  48970
            ;                                    * A4F63
          }                                      * A4F68
          5GETLAM                                * A4F6D
          NTHCOMPDROP                            * A4F72
          EVAL                                   * A4F77
          OVER                                   * A4F7C
          5GETLAM                                * A4F81
          ROMPTR  0B0 0D5                        * A4F86  ~sFldVal
          5GETLAM                                * A4F91
          ROMPTR  0B0 0A2                        * A4F96
          OBJ_15909                              * A4FA1
          AtUserStack                            * A4FA6
          SetDA123NoCh                           * A4FAB
        ;                                        * A4FB0

* ROMPTR 0B4 03E
* refs (1): A2437
ROMP_0B4_03E:
        ::                                       * A4FB5
          {                                      * A4FBA
            BINT20                               * A4FBF
            SetDA3Bad                            * A4FC4
            BINT19                               * A4FC9
            SetDA3Bad                            * A4FCE
          }                                      * A4FD3
          EQLookup                               * A4FD8
          case                                   * A4FDD
          ::                                     * A4FE2
            EVAL                                 * A4FE7
            TRUE                                 * A4FEC
          ;                                      * A4FF1
          DROPFALSE                              * A4FF6
        ;                                        * A4FFB

* ROMPTR 0B4 03F
* refs (1): A2437
ROMP_0B4_03F:
        ::                                       * A5000
          #       BF4F                           * A5005  48975
          BINT1                                  * A500F
          BINT10                                 * A5014
          #       BF50                           * A5019  48976
          BINT1                                  * A5023
          BINT19                                 * A5028
          #       BF51                           * A502D  48977
          BINT1                                  * A5037
          BINT28                                 * A503C
          #       BF52                           * A5041  48978
          BINT1                                  * A504B
          BINT37                                 * A5050
          'DROPFALSE                             * A5055
          BINT43                                 * A505A
          BINT8                                  * A505F
          BINT25                                 * A5064
          BINT9                                  * A5069
          BINT1                                  * A506E
          {                                      * A5073
            BINT0                                * A5078
          }                                      * A507D
          BINT4                                  * A5082
          #       BF53                           * A5087  48979
          MINUSONE                               * A5091
          MINUSONE                               * A5096
          ROMPTR  0B5 01A                        * A509B
          DUP                                    * A50A6
          OBJ_38345                              * A50AB
          ROMPTR  0B4 044                        * A50B0
          BINT43                                 * A50BB
          BINT17                                 * A50C0
          BINT79                                 * A50C5
          BINT9                                  * A50CA
          BINT1                                  * A50CF
          {                                      * A50D4
            BINT0                                * A50D9
          }                                      * A50DE
          OBJ_38345                              * A50E3
          ROMPTR  0B5 024                        * A50E8
          NULL$                                  * A50F3
          MINUSONE                               * A50F8
          MINUSONE                               * A50FD
          MINUSONE                               * A5102
          MINUSONE                               * A5107
          OBJ_38345                              * A510C
          ROMPTR  0B4 044                        * A5111
          BINT43                                 * A511C
          BINT26                                 * A5121
          BINT79                                 * A5126
          BINT9                                  * A512B
          BINT1                                  * A5130
          {                                      * A5135
            BINT0                                * A513A
          }                                      * A513F
          OBJ_38345                              * A5144
          ROMPTR  0B5 024                        * A5149
          NULL$                                  * A5154
          MINUSONE                               * A5159
          MINUSONE                               * A515E
          MINUSONE                               * A5163
          MINUSONE                               * A5168
          OBJ_38345                              * A516D
          ROMPTR  0B4 044                        * A5172
          BINT43                                 * A517D
          BINT35                                 * A5182
          BINT79                                 * A5187
          BINT9                                  * A518C
          BINT1                                  * A5191
          {                                      * A5196
            BINT0                                * A519B
          }                                      * A51A0
          OBJ_38345                              * A51A5
          ROMPTR  0B5 024                        * A51AA
          NULL$                                  * A51B5
          MINUSONE                               * A51BA
          MINUSONE                               * A51BF
          MINUSONE                               * A51C4
          MINUSONE                               * A51C9
          BINT4                                  * A51CE
          DUP                                    * A51D3
          OBJ_38345                              * A51D8
          ROMPTR  0B4 040                        * A51DD
          #       BF4E                           * A51E8  48974
          DoInputForm                            * A51F2
          case                                   * A51F7
          4DROP                                  * A51FC
        ;                                        * A5201

* ROMPTR 0B4 040
* refs (1): A2437
ROMP_0B4_040:
        ::                                       * A5206
          BINT16                                 * A520B
          #<>case                                * A5210
          FALSE                                  * A5215
          ROMPTR  0B4 041                        * A521A
          TrueTrue                               * A5225
        ;                                        * A522A

* ROMPTR 0B4 041
* refs (1): A2437
ROMP_0B4_041:
        {                                        * A522F
          NullMenuKey                            * A5234
          {                                      * A5239
            $       "B→PV"                       * A523E
            ROMPTR  0B4 042                      * A5250
          }                                      * A525B
          {                                      * A5260
            $       "AMOR"                       * A5265
            ROMPTR  0B4 043                      * A5277
          }                                      * A5282
        }                                        * A5287

* ROMPTR 0B4 042
* refs (1): A2437
ROMP_0B4_042:
        ::                                       * A528C
          TakeOver                               * A5291
          BINT4                                  * A5296
          ROMPTR  0B0 0C5                        * A529B  ~gFldVal
          ROMPTR  0B5 015                        * A52A6
          SetDA123NoCh                           * A52B1
        ;                                        * A52B6

* ROMPTR 0B4 043
* refs (1): A2437
ROMP_0B4_043:
        ::                                       * A52BB
          TakeOver                               * A52C0
          BINT1                                  * A52C5
          ROMPTR  0B0 0C5                        * A52CA  ~gFldVal
          ROMPTR  0B5 023                        * A52D5
          ROTDUP                                 * A52E0
          BINT2                                  * A52E5
          ROMPTR  0B0 0D5                        * A52EA  ~sFldVal
          BINT2                                  * A52F5
          ROMPTR  0B0 0A2                        * A52FA
          #       BF54                           * A5305  48980
          OBJ_15909                              * A530F
          ROTDUP                                 * A5314
          BINT3                                  * A5319
          ROMPTR  0B0 0D5                        * A531E  ~sFldVal
          BINT3                                  * A5329
          ROMPTR  0B0 0A2                        * A532E
          #       BF55                           * A5339  48981
          OBJ_15909                              * A5343
          ROTDUP                                 * A5348
          BINT4                                  * A534D
          ROMPTR  0B0 0D5                        * A5352  ~sFldVal
          BINT4                                  * A535D
          ROMPTR  0B0 0A2                        * A5362
          #       BF56                           * A536D  48982
          OBJ_15909                              * A5377
          AtUserStack                            * A537C
          SetDA123NoCh                           * A5381
        ;                                        * A5386

* ROMPTR 0B4 044
* refs (1): A2437
ROMP_0B4_044:
        ::                                       * A538B
          BINT44                                 * A5390
          #<>case                                * A5395
          FALSE                                  * A539A
          ROMPTR  0B4 025                        * A539F
          TRUE                                   * A53AA
        ;                                        * A53AF

* ROMPTR 0B4 045
* refs (1): A2437
ROMP_0B4_045:
        ::                                       * A53B4
          ROMPTR  0B0 0AB                        * A53B9
          MINUSONE                               * A53C4
          'NOP                                   * A53C9
          FALSE                                  * A53CE
          MINUSONE                               * A53D3
          {                                      * A53D8
            LAM     'PE1                         * A53DD
            LAM     'PE2                         * A53EC
            LAM     'PE3                         * A53FB
            LAM     'PX                          * A540A
          }                                      * A5417
          BIND                                   * A541C
          BEGIN                                  * A5421
          ROMPTR  0B4 046                        * A5426
          DoInputForm                            * A5431
          LAM     'PX                            * A5436
          #0<>                                   * A5443
          IT                                     * A5448
          ::                                     * A544D
            NOT?SEMI                             * A5452
            ROMPTR  0B4 048                      * A5457
            2DROP                                * A5462
          ;                                      * A5467
          LAM     'PX                            * A546C
          #0=                                    * A5479
          WHILE                                  * A547E
          ::                                     * A5483
            BINT1                                * A5488
            '                                    * A548D
            LAM     'PX                          * A5492
            STOLAM                               * A549F
          ;                                      * A54A4
          REPEAT                                 * A54A9
          '                                      * A54AE
          LAM     'PE2                           * A54B3
          undo                                   * A54C2
          DROP                                   * A54C7
          ABND                                   * A54CC
          EVAL                                   * A54D1
        ;                                        * A54D6
