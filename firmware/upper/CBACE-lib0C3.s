* HP 48GX ROM revision R, #CBACE-#CCA9E: Library part 0C3
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #CBACE in the original ROM).

LIB0C3:
        CON(3)  #0C3                             * CBACE  library number
        REL(5)  LIB0C3.hash                      * CBAD1  hash table
        CON(5)  0                                * CBAD6  message table
        REL(5)  LIB0C3.link                      * CBADB  link table
        CON(5)  0                                * CBAE0  config
        RPL

* ROMPTR 0C3 000
* refs (1): CBACE
ROMP_0C3_000:
        ::                                       * CBAE5
          CKREF                                  * CBAEA
          DUP                                    * CBAEF
          TYPERARRY?                             * CBAF4
          SWAP                                   * CBAF9
          RESOROMP                               * CBAFE
          ROMPTR  0C3 001                        * CBB03
          3UNROLL                                * CBB0E
          ONE_DO_ARRY                            * CBB13
          3PICK                                  * CBB18
          EVAL                                   * CBB1D
          3PICK                                  * CBB22
          ?SKIP                                  * CBB27
          ::                                     * CBB2C
            4PICK                                * CBB31
            EVAL                                 * CBB36
            %>C%                                 * CBB3B
          ;                                      * CBB40
          INDEX@                                 * CBB45
          PUTEL                                  * CBB4A
          NextInArray                            * CBB4F
          ROTROT2DROP                            * CBB54
        ;                                        * CBB59

* ROMPTR 0C3 001
* refs (1): CBACE
ROMP_0C3_001:
        ::                                       * CBB5E
          %RAN                                   * CBB63
          %10                                    * CBB68
          %*                                     * CBB6D
          %FLOOR                                 * CBB72
          %RAN                                   * CBB77
          %.5                                    * CBB7C
          %>=                                    * CBB81
          ?SKIP                                  * CBB86
          %CHS                                   * CBB8B
        ;                                        * CBB90

* ROMPTR 0C3 002
* refs (1): CBACE
ROMP_0C3_002:
        ::                                       * CBB95
          COERCE2                                * CBB9A
          OVER#0=                                * CBB9F
          OVER#0=                                * CBBA4
          ORcase                                 * CBBA9
          SETSIZEERR                             * CBBAE
          3PICK                                  * CBBB3
          MDIMS                                  * CBBB8
          IT                                     * CBBBD
          DROP                                   * CBBC2
          ROMPTR  0C3 003                        * CBBC7
        ;                                        * CBBD2

* ROMPTR 0C3 003
* refs (1): CBACE
ROMP_0C3_003:
        ::                                       * CBBD7
          2DUP#>                                 * CBBDC
          caseSIZEERR                            * CBBE1
          3PICK                                  * CBBE6
          #<                                     * CBBEB
          caseSIZEERR                            * CBBF0
          2DUP#=                                 * CBBF5
          case2DROP                              * CBBFA
          rot;NewobIfNotFree                     * CBBFF
          3UNROLL                                * CBC04
          SWAPROWS                               * CBC09
          2DROP                                  * CBC0E
        ;                                        * CBC13

* ROMPTR 0C3 004
* refs (1): CBACE
ROMP_0C3_004:
        ::                                       * CBC18
          COERCE2                                * CBC1D
          OVER#0=                                * CBC22
          OVER#0=                                * CBC27
          ORcase                                 * CBC2C
          SETSIZEERR                             * CBC31
          3PICK                                  * CBC36
          MDIMS                                  * CBC3B
          NOTcase                                * CBC40
          ROMPTR  0C3 003                        * CBC45
          SWAPDROP                               * CBC50
          2DUP#>                                 * CBC55
          caseSIZEERR                            * CBC5A
          3PICK                                  * CBC5F
          #<                                     * CBC64
          caseSIZEERR                            * CBC69
          2DUP#=                                 * CBC6E
          case2DROP                              * CBC73
          rot;NewobIfNotFree                     * CBC78
          @trn!(ar)                              * CBC7D
          3UNROLL                                * CBC82
          SWAPROWS                               * CBC87
          2DROP                                  * CBC8C
          @trn!(ar)                              * CBC91
        ;                                        * CBC96

* ROMPTR 0C3 005
* refs (1): CBACE
ROMP_0C3_005:
        ::                                       * CBC9B
          COERCE                                 * CBCA0
          DUP#0=                                 * CBCA5
          case                                   * CBCAA
          SETSIZEERR                             * CBCAF
          3PICK                                  * CBCB4
          MDIMS                                  * CBCB9
          ?SKIP                                  * CBCBE
          BINT1                                  * CBCC3
          3UNROLL                                * CBCC8
          OVER#<                                 * CBCCD
          caseSIZEERR                            * CBCD2
          ROT                                    * CBCD7
          4ROLL                                  * CBCDC
          OBJ_36395                              * CBCE1
          4UNROLL                                * CBCE6
          3UNROLL                                * CBCEB
          #1-                                    * CBCF0
          OVER                                   * CBCF5
          #*                                     * CBCFA
          SWAP                                   * CBCFF
          ZERO_DO                                * CBD04
          #1+                                    * CBD09
          DUPUNROT                               * CBD0E
          PULLLONGEL                             * CBD13
          4PICK                                  * CBD18
          L%*                                    * CBD1D
          3PICK                                  * CBD22
          PUTEL                                  * CBD27
          SWAP                                   * CBD2C
          NextInArray                            * CBD31
          DROPSWAPDROP                           * CBD36
        ;                                        * CBD3B

* ROMPTR 0C3 006
* refs (1): CBACE
ROMP_0C3_006:
        ::                                       * CBD40
          COERCE2                                * CBD45
          OVER#0=                                * CBD4A
          OVER#0=                                * CBD4F
          ORcase                                 * CBD54
          SETSIZEERR                             * CBD59
          4PICK                                  * CBD5E
          MDIMS                                  * CBD63
          ?SKIP                                  * CBD68
          BINT1                                  * CBD6D
          4UNROLL                                * CBD72
          3PICK                                  * CBD77
          OVER                                   * CBD7C
          #>                                     * CBD81
          caseSIZEERR                            * CBD86
          OVER#<                                 * CBD8B
          caseSIZEERR                            * CBD90
          4ROLL                                  * CBD95
          5ROLL                                  * CBD9A
          OBJ_36395                              * CBD9F
          5UNROLL                                * CBDA4
          4UNROLL                                * CBDA9
          #1-                                    * CBDAE
          3PICK                                  * CBDB3
          #*                                     * CBDB8
          3UNROLL                                * CBDBD
          #1-                                    * CBDC2
          OVER                                   * CBDC7
          #*                                     * CBDCC
          SWAP                                   * CBDD1
          ZERO_DO                                * CBDD6
          #1+                                    * CBDDB
          3UNROLL                                * CBDE0
          #1+                                    * CBDE5
          3UNROLL                                * CBDEA
          OVER                                   * CBDEF
          PULLLONGEL                             * CBDF4
          5PICK                                  * CBDF9
          L%*                                    * CBDFE
          SWAP                                   * CBE03
          4PICK                                  * CBE08
          PULLLONGEL                             * CBE0D
          ROT                                    * CBE12
          L%+                                    * CBE17
          4PICK                                  * CBE1C
          PUTEL                                  * CBE21
          3UNROLL                                * CBE26
          NextInArray                            * CBE2B
          2DROP                                  * CBE30
          SWAPDROP                               * CBE35
        ;                                        * CBE3A

* ROMPTR 0C3 007
* refs (1): CBACE
ROMP_0C3_007:
        ::                                       * CBE3F
          COERCE                                 * CBE44
          OVER                                   * CBE49
          MDIMS                                  * CBE4E
          NOTcase                                * CBE53
          ROMPTR  0C3 008                        * CBE58
          DUP                                    * CBE63
          BINT1                                  * CBE68
          {}N                                    * CBE6D
          5PICK                                  * CBE72
          OBJ_379F0                              * CBE77
          MAKEARRY                               * CBE7C
          5ROLL                                  * CBE81
          SWAP                                   * CBE86
          5PICK                                  * CBE8B
          FALSE                                  * CBE90
          ROMPTR  0C3 01B                        * CBE95
          4ROLL                                  * CBEA0
          #1-                                    * CBEA5
          4ROLL                                  * CBEAA
          TWO{}N                                 * CBEAF
          ROT                                    * CBEB4
          CKREF                                  * CBEB9
          4ROLL                                  * CBEBE
          ROMPTR  0C3 019                        * CBEC3
          SWAP                                   * CBECE
          MATREDIM                               * CBED3
          SWAP                                   * CBED8
        ;                                        * CBEDD

* ROMPTR 0C3 008
* refs (1): CBACE
ROMP_0C3_008:
        ::                                       * CBEE2
          2DUP#>                                 * CBEE7
          case                                   * CBEEC
          SETSIZEERR                             * CBEF1
          #1-                                    * CBEF6
          BINT1                                  * CBEFB
          {}N                                    * CBF00
          3UNROLL                                * CBF05
          DUPUNROT                               * CBF0A
          #0=                                    * CBF0F
          case                                   * CBF14
          SETSIZEERR                             * CBF19
          OVER                                   * CBF1E
          PULLEL                                 * CBF23
          4UNROLL                                * CBF28
          CKREF                                  * CBF2D
          SWAP                                   * CBF32
          ROMPTR  0C3 019                        * CBF37
          SWAP                                   * CBF42
          MATREDIM                               * CBF47
          SWAP                                   * CBF4C
        ;                                        * CBF51

* ROMPTR 0C3 009
* refs (1): CBACE
ROMP_0C3_009:
        ::                                       * CBF56
          COERCE                                 * CBF5B
          OVER                                   * CBF60
          MDIMS                                  * CBF65
          NOTcase                                * CBF6A
          ROMPTR  0C3 008                        * CBF6F
          OVER                                   * CBF7A
          BINT1                                  * CBF7F
          {}N                                    * CBF84
          5PICK                                  * CBF89
          OBJ_379F0                              * CBF8E
          MAKEARRY                               * CBF93
          5ROLL                                  * CBF98
          CKREF                                  * CBF9D
          @trn!(ar)                              * CBFA2
          SWAP                                   * CBFA7
          5PICK                                  * CBFAC
          FALSE                                  * CBFB1
          ROMPTR  0C3 01B                        * CBFB6
          ROT                                    * CBFC1
          #1-                                    * CBFC6
          4ROLL                                  * CBFCB
          TWO{}N                                 * CBFD0
          ROT                                    * CBFD5
          4ROLL                                  * CBFDA
          ROMPTR  0C3 019                        * CBFDF
          SWAP                                   * CBFEA
          MATREDIM                               * CBFEF
          @trn!(ar)                              * CBFF4
          SWAP                                   * CBFF9
        ;                                        * CBFFE

* ROMPTR 0C3 00A
* refs (1): CBACE
ROMP_0C3_00A:
        ::                                       * CC003
          COERCE                                 * CC008
          3PICK                                  * CC00D
          MDIMS                                  * CC012
          NOTcase                                * CC017
          doerr501                               * CC01C
          4PICK                                  * CC021
          MDIMS                                  * CC026
          case                                   * CC02B
          ROMPTR  0C3 00B                        * CC030
          OVER                                   * CC03B
          #<>case                                * CC040
          doerr501                               * CC045
          SWAP#1+SWAP                            * CC04A
          TWO{}N                                 * CC04F
          2SWAP                                  * CC054
          OBJ_36F74                              * CC059
          2SWAP                                  * CC05E
          4ROLLSWAP                              * CC063
          MATREDIM                               * CC068
          ROMPTR  0C3 01A                        * CC06D
          3UNROLL                                * CC078
          TRUE                                   * CC07D
          ROMPTR  0C3 01B                        * CC082
          DROP                                   * CC08D
        ;                                        * CC092

* ROMPTR 0C3 00B
* refs (1): CBACE
ROMP_0C3_00B:
        ::                                       * CC097
          3PICK                                  * CC09C
          #<>case                                * CC0A1
          doerr501                               * CC0A6
          2OVER                                  * CC0AB
          #1+                                    * CC0B0
          #>                                     * CC0B5
          case                                   * CC0BA
          SETSIZEERR                             * CC0BF
          ROT#+SWAP                              * CC0C4
          TWO{}N                                 * CC0C9
          2SWAP                                  * CC0CE
          OBJ_36F74                              * CC0D3
          2SWAP                                  * CC0D8
          4ROLLSWAP                              * CC0DD
          MATREDIM                               * CC0E2
          ROT                                    * CC0E7

* ROMPTR 0C3 00C
* refs (1): CBACE
ROMP_0C3_00C:
          ::                                     * CC0EC
            RESOROMP                             * CC0F1
            ROMPTR  0C3 01A                      * CC0F6
            4UNROLL                              * CC101
            RESOROMP                             * CC106
            ROMPTR  0C3 01B                      * CC10B
            4UNROLL                              * CC116
            DUP                                  * CC11B
            MDIMS                                * CC120
            DROP                                 * CC125
            BINT1                                * CC12A
            {}N                                  * CC12F
            3PICK                                * CC134
            OBJ_379F0                            * CC139
            MAKEARRY                             * CC13E
            SWAP                                 * CC143
            #1+_ONE_DO                           * CC148
            ISTOP@                               * CC14D
            INDEX@#-                             * CC152
            FALSE                                * CC157
            7PICK                                * CC15C
            EVAL                                 * CC161
            4PICK                                * CC166
            4ROLL                                * CC16B
            7PICK                                * CC170
            EVAL                                 * CC175
            3UNROLL                              * CC17A
            TRUE                                 * CC17F
            7PICK                                * CC184
            EVAL                                 * CC189
            ROTSWAP                              * CC18E
            NextInArray                          * CC193
            2DROP                                * CC198
            4UNROLL3DROP                         * CC19D
          ;                                      * CC1A2
        ;                                        * CC1A7

* ROMPTR 0C3 00D
* refs (1): CBACE
ROMP_0C3_00D:
        ::                                       * CC1AC
          COERCE                                 * CC1B1
          3PICK                                  * CC1B6
          MDIMS                                  * CC1BB
          NOTcase                                * CC1C0
          doerr501                               * CC1C5
          4PICK                                  * CC1CA
          MDIMS                                  * CC1CF
          case                                   * CC1D4
          ROMPTR  0C3 00E                        * CC1D9
          3PICK                                  * CC1E4
          #<>case                                * CC1E9
          doerr501                               * CC1EE
          #1+SWAP                                * CC1F3
          TWO{}N                                 * CC1F8
          2SWAP                                  * CC1FD
          OBJ_36F74                              * CC202
          2SWAP                                  * CC207
          4ROLL                                  * CC20C
          CKREF                                  * CC211
          @trn!(ar)                              * CC216
          SWAP                                   * CC21B
          MATREDIM                               * CC220
          ROMPTR  0C3 01A                        * CC225
          3UNROLL                                * CC230
          TRUE                                   * CC235
          ROMPTR  0C3 01B                        * CC23A
          DROP                                   * CC245
          @trn!(ar)                              * CC24A
        ;                                        * CC24F

* ROMPTR 0C3 00E
* refs (1): CBACE
ROMP_0C3_00E:
        ::                                       * CC254
          SWAP4PICK                              * CC259
          #<>case                                * CC25E
          doerr501                               * CC263
          4PICK                                  * CC268
          3PICK                                  * CC26D
          #1+                                    * CC272
          #>                                     * CC277
          case                                   * CC27C
          SETSIZEERR                             * CC281
          #+SWAP                                 * CC286
          TWO{}N                                 * CC28B
          2SWAP                                  * CC290
          OBJ_36F74                              * CC295
          2SWAP                                  * CC29A
          4ROLL                                  * CC29F
          CKREF                                  * CC2A4
          @trn!(ar)                              * CC2A9
          SWAP                                   * CC2AE
          MATREDIM                               * CC2B3
          ROT                                    * CC2B8
          CKREF                                  * CC2BD
          @trn!(ar)                              * CC2C2
          ROMPTR  0C3 00C                        * CC2C7
          @trn!(ar)                              * CC2D2
        ;                                        * CC2D7

* ROMPTR 0C3 00F
* refs (1): CBACE
ROMP_0C3_00F:
        ::                                       * CC2DC
          UNROTOVER                              * CC2E1
          TYPERARRY?                             * CC2E6
          ?SKIP                                  * CC2EB
          Re>C%                                  * CC2F0
          ROMPTR  0C3 011                        * CC2F5
        ;                                        * CC300

* ROMPTR 0C3 010
* refs (1): CBACE
ROMP_0C3_010:
        ::                                       * CC305
          ROTDUP                                 * CC30A
          TYPERARRY?                             * CC30F
          IT                                     * CC314
          r->c(ar)                               * CC319
          ROT                                    * CC31E
          ROMPTR  0C3 011                        * CC323
        ;                                        * CC32E

* ROMPTR 0C3 011
* refs (1): CBACE
ROMP_0C3_011:
        ::                                       * CC333
          ROT                                    * CC338
          COERCE                                 * CC33D
          3PICK                                  * CC342
          MDIMS                                  * CC347
          case                                   * CC34C
          doerr501                               * CC351
          #1+                                    * CC356
          BINT1                                  * CC35B
          {}N                                    * CC360
          4ROLLSWAP                              * CC365
          MATREDIM                               * CC36A
          ROMPTR  0C3 01A                        * CC36F
          3UNROLL                                * CC37A
          PUTEL                                  * CC37F
        ;                                        * CC384

* ROMPTR 0C3 012
* refs (1): CBACE
ROMP_0C3_012:
        ::                                       * CC389
          DUP                                    * CC38E
          MDIMS                                  * CC393
          NOTcase                                * CC398
          ROMPTR  0C3 013                        * CC39D
          BINT1                                  * CC3A8
          {}N                                    * CC3AD
          3PICK                                  * CC3B2
          OBJ_379F0                              * CC3B7
          MAKEARRY                               * CC3BC
          ROTSWAP                                * CC3C1
          BINT1                                  * CC3C6
          3UNROLL                                * CC3CB
          RESOROMP                               * CC3D0
          ROMPTR  0C3 01B                        * CC3D5
          4UNROLL                                * CC3E0
          BEGIN                                  * CC3E5
          3PICK                                  * CC3EA
          FALSE                                  * CC3EF
          6PICK                                  * CC3F4
          EVAL                                   * CC3F9
          ROT                                    * CC3FE
          5PICK                                  * CC403
          OVER                                   * CC408
          #>                                     * CC40D
          WHILE                                  * CC412
          ::                                     * CC417
            #1+                                  * CC41C
            3UNROLL                              * CC421
            5UNROLL                              * CC426
            5PICK                                * CC42B
            TOTEMPOB                             * CC430
            OBJ_357F0                            * CC435
          ;                                      * CC43A
          REPEAT                                 * CC43F
          DROPSWAPDROP                           * CC444
          SWAPDROPSWAP                           * CC449
          UNCOERCE                               * CC44E
        ;                                        * CC453

* ROMPTR 0C3 013
* refs (1): CBACE
ROMP_0C3_013:
        ::                                       * CC458
          #1+_ONE_DO                             * CC45D
          INDEX@                                 * CC462
          PULLEL                                 * CC467
          SWAP                                   * CC46C
          NextInArray                            * CC471
          ARSIZE                                 * CC476
          UNCOERCE                               * CC47B
        ;                                        * CC480

* ROMPTR 0C3 014
* refs (1): CBACE
ROMP_0C3_014:
        ::                                       * CC485
          DUP                                    * CC48A
          MDIMS                                  * CC48F
          NOTcase                                * CC494
          ROMPTR  0C3 013                        * CC499
          2DROP                                  * CC4A4
          CKREF                                  * CC4A9
          @trn!(ar)                              * CC4AE
          ROMPTR  0C3 012                        * CC4B3
        ;                                        * CC4BE

* ROMPTR 0C3 015
* refs (1): CBACE
ROMP_0C3_015:
        ::                                       * CC4C3
          DUP#0=                                 * CC4C8
          case                                   * CC4CD
          SETSIZEERR                             * CC4D2
          OVER                                   * CC4D7
          TYPEARRAY?                             * CC4DC
          NOTcase                                * CC4E1
          ::                                     * CC4E6
            UNCOERCE                             * CC4EB
            XEQ>VECTOR                           * CC4F0
          ;                                      * CC4F5
          DUP                                    * CC4FA
          3PICK                                  * CC4FF
          MDIMS                                  * CC504
          case                                   * CC509
          doerr501                               * CC50E
          TWO{}N                                 * CC513
          3PICK                                  * CC518
          OBJ_379F0                              * CC51D
          MAKEARRY                               * CC522
          RESOROMP                               * CC527
          ROMPTR  0C3 01B                        * CC52C
          SWAP                                   * CC537
          3PICK                                  * CC53C
          #1+_ONE_DO                             * CC541
          ISTOP@                                 * CC546
          INDEX@#-                               * CC54B
          #3+PICK                                * CC550
          DUP                                    * CC555
          TYPEARRAY?                             * CC55A
          NOTcase                                * CC55F
          SETTYPEERR                             * CC564
          OBJ_36F74                              * CC569
          INDEX@                                 * CC56E
          TRUE                                   * CC573
          5PICK                                  * CC578
          EVAL                                   * CC57D
          DROP                                   * CC582
          NextInArray                            * CC587
          SWAPDROP                               * CC58C
          OVER                                   * CC591
          #2+UNROLL                              * CC596
          NDROP                                  * CC59B
        ;                                        * CC5A0

* ROMPTR 0C3 016
* refs (1): CBACE
ROMP_0C3_016:
        ::                                       * CC5A5
          DUP#0=                                 * CC5AA
          case                                   * CC5AF
          SETSIZEERR                             * CC5B4
          OVER                                   * CC5B9
          TYPEARRAY?                             * CC5BE
          NOTcase                                * CC5C3
          ::                                     * CC5C8
            UNCOERCE                             * CC5CD
            XEQ>VECTOR                           * CC5D2
          ;                                      * CC5D7
          ROMPTR  0C3 015                        * CC5DC
          @trn!(ar)                              * CC5E7
        ;                                        * CC5EC

* ROMPTR 0C3 017
* refs (1): CBACE
ROMP_0C3_017:
        ::                                       * CC5F1
          DUP                                    * CC5F6
          MDIMS                                  * CC5FB
          NOTcase                                * CC600
          doerr501                               * CC605
          DUP#1+                                 * CC60A
          3UNROLL                                * CC60F
          #MIN                                   * CC614
          DUP                                    * CC619
          BINT1                                  * CC61E
          {}N                                    * CC623
          4PICK                                  * CC628
          OBJ_379F0                              * CC62D
          MAKEARRY                               * CC632
          BINT1                                  * CC637
          5ROLL                                  * CC63C
          4ROLL                                  * CC641
          #1+_ONE_DO                             * CC646
          OVER                                   * CC64B
          PULLEL                                 * CC650
          4ROLLSWAP                              * CC655
          INDEX@                                 * CC65A
          PUTEL                                  * CC65F
          ROT                                    * CC664
          4PICK#+                                * CC669
          ROT                                    * CC66E
          NextInArray                            * CC673
          4ROLL                                  * CC678
          3DROP                                  * CC67D
        ;                                        * CC682

* ROMPTR 0C3 018
* refs (1): CBACE
ROMP_0C3_018:
        ::                                       * CC687
          OVERARSIZE                             * CC68C
          OVER                                   * CC691
          INNERCOMP                              * CC696
          #2=                                    * CC69B
          NOTcase                                * CC6A0
          SETSIZEERR                             * CC6A5
          DUPUNROT                               * CC6AA
          #MIN                                   * CC6AF
          ROT                                    * CC6B4
          #MIN                                   * CC6B9
          SWAP#1+                                * CC6BE
          4UNROLL                                * CC6C3
          SWAP                                   * CC6C8
          3PICK                                  * CC6CD
          OBJ_379F0                              * CC6D2
          MAKEARRY                               * CC6D7
          BINT1                                  * CC6DC
          ROT                                    * CC6E1
          #1+_ONE_DO                             * CC6E6
          ROT                                    * CC6EB
          INDEX@                                 * CC6F0
          PULLEL                                 * CC6F5
          4ROLL                                  * CC6FA
          SWAP4PICK                              * CC6FF
          PUTEL                                  * CC704
          ROT                                    * CC709
          4PICK#+                                * CC70E
          NextInArray                            * CC713
          DROP                                   * CC718
          ROTROT2DROP                            * CC71D
        ;                                        * CC722

* ROMPTR 0C3 019
* refs (1): CBACE
ROMP_0C3_019:
        CODE                                     * CC727  192 nibbles
          GOSBVL  POP#                           * CC731
          ?A=0    A                              * CC738
          GOYES   L_CC77E                        * CC73B
          GOSBVL  SAVPTR                         * CC73D
          C=DAT1  A                              * CC744
          D1=C                                   * CC747
          D1=D1+  10                             * CC74A
          C=DAT1  A                              * CC74D
          D=C     A                              * CC750
          ST=0    0                              * CC752
          LC(5)   DOREAL                         * CC755
          ?D=C    A                              * CC75C
          GOYES   L_CC764                        * CC75F
          ST=1    0                              * CC761
L_CC764:
          D1=D1+  5                              * CC764
          C=DAT1  A                              * CC767
          D=C     A                              * CC76A
          D1=D1+  5                              * CC76C
          C=DAT1  A                              * CC76F
          ?C>=A   A                              * CC772
          GOYES   L_CC78B                        * CC775
          GOSBVL  GETPTR                         * CC777
L_CC77E:
          LC(5)   SETSIZEERR                     * CC77E
          A=C     A                              * CC785
          PC=(A)                                 * CC787
L_CC78B:
          C=C-1   A                              * CC78B
          ?C#0    A                              * CC78D
          GOYES   L_CC799                        * CC790
          GOVLNG  L_370AD                        * CC792
L_CC799:
          C=C+1   A                              * CC799
          C=C-A   A                              * CC79B
          DCEX    A                              * CC79D
          B=C     A                              * CC79F
          D1=D1+  5                              * CC7A1
          B=B-1   A                              * CC7A4
          ?B=0    A                              * CC7A6
          GOYES   L_CC7B1                        * CC7A9
          C=DAT1  A                              * CC7AB
          D1=D1+  5                              * CC7AE
L_CC7B1:
          CSL     A                              * CC7B1
          ?ST=0   0                              * CC7B3
          GOYES   L_CC7BA                        * CC7B6
          C=C+C   A                              * CC7B8
L_CC7BA:
          R0=C                                   * CC7BA
          GOSBVL  L_35790                        * CC7BD
          C=B     A                              * CC7C4
          R1=C                                   * CC7C6
          C=R0                                   * CC7C9
          D=C     A                              * CC7CC
          C=A     A                              * CC7CE
          GOSBVL  L_35790                        * CC7D0
          AD1EX                                  * CC7D7
          A=A+B   A                              * CC7DA
          D0=A                                   * CC7DC
          C=R0                                   * CC7DF
          A=A-C   A                              * CC7E2
          D1=A                                   * CC7E4
          C=R1                                   * CC7E7
          GOVLNG  L_372D9                        * CC7EA
        ENDCODE                                  * CC7F1

* ROMPTR 0C3 01A
* refs (1): CBACE
ROMP_0C3_01A:
        CODE                                     * CC7F1  178 nibbles
          GOSBVL  SAVPTR                         * CC7FB
          C=DAT1  A                              * CC802
          CD1EX                                  * CC805
          D0=C                                   * CC808
          D0=D0+  5                              * CC80B
          A=DAT0  A                              * CC80E
          D0=A                                   * CC811
          D0=D0+  5                              * CC814
          A=DAT0  A                              * CC817
          D1=D1+  5                              * CC81A
          C=DAT1  A                              * CC81D
          AD1EX                                  * CC820
          C=C+A   A                              * CC823
          AD1EX                                  * CC825
          D0=C                                   * CC828
          D1=D1+  5                              * CC82B
          C=DAT1  A                              * CC82E
          D=C     A                              * CC831
          ST=0    0                              * CC833
          LC(5)   DOREAL                         * CC836
          ?D=C    A                              * CC83D
          GOYES   L_CC845                        * CC840
          ST=1    0                              * CC842
L_CC845:
          D1=D1+  5                              * CC845
          C=DAT1  A                              * CC848
          D=C     A                              * CC84B
          D1=D1+  5                              * CC84D
          C=DAT1  A                              * CC850
          ?A=0    A                              * CC853
          GOYES   L_CC85D                        * CC856
          ?C>=A   A                              * CC858
          GOYES   L_CC871                        * CC85B
L_CC85D:
          GOSBVL  GETPTR                         * CC85D
          LC(5)   SETSIZEERR                     * CC864
          A=C     A                              * CC86B
          PC=(A)                                 * CC86D
L_CC871:
          C=C-A   A                              * CC871
          DCEX    A                              * CC873
          B=C     A                              * CC875
          D1=D1+  5                              * CC877
          B=B-1   A                              * CC87A
          ?B=0    A                              * CC87C
          GOYES   L_CC887                        * CC87F
          C=DAT1  A                              * CC881
          D1=D1+  5                              * CC884
L_CC887:
          CSL     A                              * CC887
          ?ST=0   0                              * CC889
          GOYES   L_CC890                        * CC88C
          C=C+C   A                              * CC88E
L_CC890:
          A=C     A                              * CC890
          GOSBVL  L_35790                        * CC892
          CD0EX                                  * CC899
          D1=C                                   * CC89C
          C=C-A   A                              * CC89F
          D0=C                                   * CC8A1
          C=B     A                              * CC8A4
          GOVLNG  L_372E4                        * CC8A6
        ENDCODE                                  * CC8AD

* ROMPTR 0C3 01B
* refs (1): CBACE
ROMP_0C3_01B:
        CODE                                     * CC8AD  238 nibbles
          ST=1    1                              * CC8B7
          GOSBVL  popflag                        * CC8BA
          GOC     L_CC8C7                        * CC8C1
          ST=0    1                              * CC8C4
L_CC8C7:
          GOSBVL  POP#                           * CC8C7
          ?A#0    A                              * CC8CE
          GOYES   L_CC8D7                        * CC8D1
          GOTO    L_CC950                        * CC8D3
L_CC8D7:
          GOSBVL  SAVPTR                         * CC8D7
          C=DAT1  A                              * CC8DE
          D0=C                                   * CC8E1
          D0=D0+  10                             * CC8E4
          C=DAT0  A                              * CC8E7
          D=C     A                              * CC8EA
          ST=0    0                              * CC8EC
          LC(5)   DOREAL                         * CC8EF
          ?D=C    A                              * CC8F6
          GOYES   L_CC8FE                        * CC8F9
          ST=1    0                              * CC8FB
L_CC8FE:
          D0=D0+  5                              * CC8FE
          C=DAT0  A                              * CC901
          C=C-1   A                              * CC904
          ?C=0    A                              * CC906
          GOYES   L_CC912                        * CC909
L_CC90B:
          GOVLNG  L_370AD                        * CC90B
L_CC912:
          D0=D0+  5                              * CC912
          C=DAT0  A                              * CC915
          R1=C                                   * CC918
          D0=D0+  5                              * CC91B
          CSL     A                              * CC91E
          ?ST=0   0                              * CC920
          GOYES   L_CC927                        * CC923
          C=C+C   A                              * CC925
L_CC927:
          R0=C                                   * CC927
          D1=D1+  5                              * CC92A
          C=DAT1  A                              * CC92D
          D1=C                                   * CC930
          D1=D1+  10                             * CC933
          D1=D1+  5                              * CC936
          C=DAT1  A                              * CC939
          D=C     A                              * CC93C
          D1=D1+  5                              * CC93E
          C=DAT1  A                              * CC941
          ?C>=A   A                              * CC944
          GOYES   L_CC95D                        * CC947
          GOSBVL  GETPTR                         * CC949
L_CC950:
          LC(5)   SETSIZEERR                     * CC950
          A=C     A                              * CC957
          PC=(A)                                 * CC959
L_CC95D:
          C=D     A                              * CC95D
          D1=D1+  5                              * CC95F
          D=D-1   A                              * CC962
          ?D=0    A                              * CC964
          GOYES   L_CC96F                        * CC967
          C=DAT1  A                              * CC969
          D1=D1+  5                              * CC96C
L_CC96F:
          CAEX    A                              * CC96F
          D=C     A                              * CC971
          D=D-1   A                              * CC973
          C=R1                                   * CC975
          ?C=A    A                              * CC978
          GOYES   L_CC981                        * CC97B
          GOTO    L_CC90B                        * CC97D
L_CC981:
          C=R0                                   * CC981
          GOSBVL  L_35790                        * CC984
          AD1EX                                  * CC98B
          A=A+B   A                              * CC98E
          ?ST=1   1                              * CC990
          GOYES   L_CC998                        * CC993
          AD0EX                                  * CC995
L_CC998:
          D1=A                                   * CC998
          C=R0                                   * CC99B
          GOVLNG  L_372D9                        * CC99E
        ENDCODE                                  * CC9A5

LIB0C3.hash:
        CON(5)  DOHSTR                           * CC9A5  hash table of library 0C3
        LENGTH                                   * CC9AA  length, to #CCA09
        CON(5)  0                                * CC9AF  names of length 1
        CON(5)  0                                * CC9B4  names of length 2
        CON(5)  0                                * CC9B9  names of length 3
        CON(5)  0                                * CC9BE  names of length 4
        CON(5)  0                                * CC9C3  names of length 5
        CON(5)  0                                * CC9C8  names of length 6
        CON(5)  0                                * CC9CD  names of length 7
        CON(5)  0                                * CC9D2  names of length 8
        CON(5)  0                                * CC9D7  names of length 9
        CON(5)  0                                * CC9DC  names of length 10
        CON(5)  0                                * CC9E1  names of length 11
        CON(5)  0                                * CC9E6  names of length 12
        CON(5)  0                                * CC9EB  names of length 13
        CON(5)  0                                * CC9F0  names of length 14
        CON(5)  0                                * CC9F5  names of length 15
        CON(5)  0                                * CC9FA  names of length 16
        REL(5)  L_CCA04                          * CC9FF  end of the names
L_CCA04:
        CON(5)  0                                * CCA04  command 000 has no name
        ENDLENGTH                                * CCA09

LIB0C3.link:
        CON(5)  DOHSTR                           * CCA09  link table of library 0C3
        LENGTH                                   * CCA0E  length, to #CCA9F
        REL(5)  ROMP_0C3_000                     * CCA13  000 
        REL(5)  ROMP_0C3_001                     * CCA18  001 
        REL(5)  ROMP_0C3_002                     * CCA1D  002 
        REL(5)  ROMP_0C3_003                     * CCA22  003 
        REL(5)  ROMP_0C3_004                     * CCA27  004 
        REL(5)  ROMP_0C3_005                     * CCA2C  005 
        REL(5)  ROMP_0C3_006                     * CCA31  006 
        REL(5)  ROMP_0C3_007                     * CCA36  007 
        REL(5)  ROMP_0C3_008                     * CCA3B  008 
        REL(5)  ROMP_0C3_009                     * CCA40  009 
        REL(5)  ROMP_0C3_00A                     * CCA45  00A 
        REL(5)  ROMP_0C3_00B                     * CCA4A  00B 
        REL(5)  ROMP_0C3_00C                     * CCA4F  00C 
        REL(5)  ROMP_0C3_00D                     * CCA54  00D 
        REL(5)  ROMP_0C3_00E                     * CCA59  00E 
        REL(5)  ROMP_0C3_00F                     * CCA5E  00F 
        REL(5)  ROMP_0C3_010                     * CCA63  010 
        REL(5)  ROMP_0C3_011                     * CCA68  011 
        REL(5)  ROMP_0C3_012                     * CCA6D  012 
        REL(5)  ROMP_0C3_013                     * CCA72  013 
        REL(5)  ROMP_0C3_014                     * CCA77  014 
        REL(5)  ROMP_0C3_015                     * CCA7C  015 
        REL(5)  ROMP_0C3_016                     * CCA81  016 
        REL(5)  ROMP_0C3_017                     * CCA86  017 
        REL(5)  ROMP_0C3_018                     * CCA8B  018 
        REL(5)  ROMP_0C3_019                     * CCA90  019 
        REL(5)  ROMP_0C3_01A                     * CCA95  01A 
        REL(5)  ROMP_0C3_01B                     * CCA9A  01B 
