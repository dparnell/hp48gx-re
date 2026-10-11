* HP 48GX ROM revision R, #E9E0F-#EDBB9: Library part 0E2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #E9E0F in the original ROM).
        ENDLENGTH                                * E9E0F

* ROMPTR 0E2 012
* refs (1): E3857
ROMP_0E2_012:
        CON(5)  DOARRY                           * E9E0F  array 29
        LENGTH                                   * E9E14  length, to #EA13B
        CON(5)  DOCSTR                           * E9E19  element type
        CON(5)  1                                * E9E1E  dimensions
        CON(5)  29                               * E9E23
        $BODY   "Transverse Waves"               * E9E28  1
        $BODY   "Longitudinal Waves"             * E9E4D  2
        $BODY   "Sound Waves"                    * E9E76  3
        $BODY   "amplitude"                      * E9E91  4
        $BODY   "angular frequency"              * E9EA8  5
        $BODY   "frequency"                      * E9ECF  6
        $BODY   "ang wave number"                * E9EE6  7
        $BODY   "wavelength"                     * E9F09  8
        $BODY   "position"                       * E9F22  9
        $BODY   "time"                           * E9F37  10
        $BODY   "displacement"                   * E9F44  11
        $BODY   "speed"                          * E9F61  12
        $BODY   "amplitude"                      * E9F70  13
        $BODY   "angular frequency"              * E9F87  14
        $BODY   "frequency"                      * E9FAE  15
        $BODY   "ang wave number"                * E9FC5  16
        $BODY   "wavelength"                     * E9FE8  17
        $BODY   "position"                       * EA001  18
        $BODY   "time"                           * EA016  19
        $BODY   "displacement"                   * EA023  20
        $BODY   "speed"                          * EA040  21
        $BODY   "amplitude"                      * EA04F  22
        $BODY   "angular frequency"              * EA066  23
        $BODY   "frequency"                      * EA08D  24
        $BODY   "bulk mod of elas"               * EA0A4  25
        $BODY   "density"                        * EA0C9  26
        $BODY   "speed of sound"                 * EA0DC  27
        $BODY   "sound intensity"                * EA0FD  28
        $BODY   "sound level"                    * EA120  29
        ENDLENGTH                                * EA13B
        RPL

* ROMPTR 0E2 013
* refs (1): E3857
ROMP_0E2_013:
        {                                        * EA13B
          CHR_D                                  * EA140
          UNIT                                   * EA145
            %0_2A2B4                             * EA14A
            $       "ft"                         * EA14F
            umEND                                * EA15D
          ;                                      * EA162
          UNIT                                   * EA167
            %0_2A2B4                             * EA16C
            $       "psi"                        * EA171
            umEND                                * EA181
          ;                                      * EA186
          UNIT                                   * EA18B
            %0_2A2B4                             * EA190
            $       "in"                         * EA195
            %4                                   * EA1A3
            um^                                  * EA1A8
            umEND                                * EA1AD
          ;                                      * EA1B2
          UNIT                                   * EA1B7
            %0_2A2B4                             * EA1BC
            $       "lbf"                        * EA1C1
            umEND                                * EA1D1
          ;                                      * EA1D6
          UNIT                                   * EA1DB
            %0_2A2B4                             * EA1E0
            $       "ft"                         * EA1E5
L_EA1F3:
            $       "lbf"                        * EA1F3
            um*                                  * EA203
            umEND                                * EA208
          ;                                      * EA20D
          UNIT                                   * EA212
            %0_2A2B4                             * EA217
            $       "lbf"                        * EA21C
            $       "ft"                         * EA22C
            um/                                  * EA23A
            umEND                                * EA23F
          ;                                      * EA244
          UNIT                                   * EA249
            %0_2A2B4                             * EA24E
            $       "lb"                         * EA253
            umEND                                * EA261
          ;                                      * EA266
          UNIT                                   * EA26B
            %0_2A2B4                             * EA270
            $       "ft"                         * EA275
            tok_s                                * EA283
            um/                                  * EA288
            umEND                                * EA28D
          ;                                      * EA292
          CHR_D                                  * EA297
          UNIT                                   * EA29C
            %0_2A2B4                             * EA2A1
            $       "lbf"                        * EA2A6
            umEND                                * EA2B6
          ;                                      * EA2BB
          CHR_D                                  * EA2C0
          CHR_D                                  * EA2C5
          CHR_D                                  * EA2CA
          CHR_D                                  * EA2CF
          UNIT                                   * EA2D4
            %0_2A2B4                             * EA2D9
            $       "Ω"                          * EA2DE
            $       "in"                         * EA2EA
            um*                                  * EA2F8
            umEND                                * EA2FD
          ;                                      * EA302
          UNIT                                   * EA307
            %0_2A2B4                             * EA30C
            $       "in"                         * EA311
            %2                                   * EA31F
            um^                                  * EA324
            umEND                                * EA329
          ;                                      * EA32E
          CHR_D                                  * EA333
          CHR_D                                  * EA338
          CHR_D                                  * EA33D
          UNIT                                   * EA342
            %0_2A2B4                             * EA347
            $       "r"                          * EA34C
            tok_s                                * EA358
            um/                                  * EA35D
            umEND                                * EA362
          ;                                      * EA367
          CHR_D                                  * EA36C
          CHR_D                                  * EA371
          UNIT                                   * EA376
            %0_2A2B4                             * EA37B
            $       "in"                         * EA380
            umEND                                * EA38E
          ;                                      * EA393
          UNIT                                   * EA398
            %0_2A2B4                             * EA39D
            tok1                                 * EA3A2
            $       "in"                         * EA3A7
            um/                                  * EA3B5
            umEND                                * EA3BA
          ;                                      * EA3BF
          UNIT                                   * EA3C4
            %0_2A2B4                             * EA3C9
            $       "ft"                         * EA3CE
            %3                                   * EA3DC
            um^                                  * EA3E1
            umEND                                * EA3E6
          ;                                      * EA3EB
          UNIT                                   * EA3F0
            %0_2A2B4                             * EA3F5
            $       "lbmol"                      * EA3FA
            umEND                                * EA40E
          ;                                      * EA413
          UNIT                                   * EA418
            %0_2A2B4                             * EA41D
            $       "°F"                         * EA422
            umEND                                * EA430
          ;                                      * EA435
          UNIT                                   * EA43A
            %0_2A2B4                             * EA43F
            $       "°R"                         * EA444
            umEND                                * EA452
          ;                                      * EA457
          UNIT                                   * EA45C
            %0_2A2B4                             * EA461
            $       "Btu"                        * EA466
            umEND                                * EA476
          ;                                      * EA47B
          UNIT                                   * EA480
            %0_2A2B4                             * EA485
            tok1                                 * EA48A
            $       "l"                          * EA48F
            um/                                  * EA49B
            umEND                                * EA4A0
          ;                                      * EA4A5
          UNIT                                   * EA4AA
            %0_2A2B4                             * EA4AF
            $       "Å"                          * EA4B4
            umEND                                * EA4C0
          ;                                      * EA4C5
          UNIT                                   * EA4CA
            %0_2A2B4                             * EA4CF
            $       "lb"                         * EA4D4
            $       "lbmol"                      * EA4E2
            um/                                  * EA4F6
            umEND                                * EA4FB
          ;                                      * EA500
          UNIT                                   * EA505
            %0_2A2B4                             * EA50A
            $       "ft"                         * EA50F
            $       "lbf"                        * EA51D
            um*                                  * EA52D
            umEND                                * EA532
          ;                                      * EA537
          UNIT                                   * EA53C
            %0_2A2B4                             * EA541
            $       "in"                         * EA546
            %3                                   * EA554
            um^                                  * EA559
            umEND                                * EA55E
          ;                                      * EA563
          UNIT                                   * EA568
            %0_2A2B4                             * EA56D
            $       "lb"                         * EA572
            $       "in"                         * EA580
            %2                                   * EA58E
            um^                                  * EA593
            um*                                  * EA598
            umEND                                * EA59D
          ;                                      * EA5A2
          UNIT                                   * EA5A7
            %0_2A2B4                             * EA5AC
            $       "ft"                         * EA5B1
            tok_s                                * EA5BF
            %2                                   * EA5C4
            um^                                  * EA5C9
            um/                                  * EA5CE
            umEND                                * EA5D3
          ;                                      * EA5D8
          UNIT                                   * EA5DD
            %0_2A2B4                             * EA5E2
            $       "r"                          * EA5E7
L_EA5F3:
            $       "min"                        * EA5F3
            %2                                   * EA603
            um^                                  * EA608
            um/                                  * EA60D
            umEND                                * EA612
          ;                                      * EA617
          UNIT                                   * EA61C
            %0_2A2B4                             * EA621
            $       "r"                          * EA626
            $       "min"                        * EA632
            um/                                  * EA642
            umEND                                * EA647
          ;                                      * EA64C
          UNIT                                   * EA651
            %0_2A2B4                             * EA656
            $       "ft"                         * EA65B
            %3                                   * EA669
            um^                                  * EA66E
            umEND                                * EA673
          ;                                      * EA678
          UNIT                                   * EA67D
            %0_2A2B4                             * EA682
            $       "°"                          * EA687
            umEND                                * EA693
          ;                                      * EA698
          CHR_D                                  * EA69D
          UNIT                                   * EA6A2
            %0_2A2B4                             * EA6A7
            $       "µ"                          * EA6AC
            umEND                                * EA6B8
          ;                                      * EA6BD
          UNIT                                   * EA6C2
            %0_2A2B4                             * EA6C7
            $       "lb"                         * EA6CC
            tok_s                                * EA6DA
            um/                                  * EA6DF
            umEND                                * EA6E4
          ;                                      * EA6E9
          UNIT                                   * EA6EE
            %0_2A2B4                             * EA6F3
            $       "lbf"                        * EA6F8
            $       "in"                         * EA708
            um/                                  * EA716
            umEND                                * EA71B
          ;                                      * EA720
          CHR_D                                  * EA725
          UNIT                                   * EA72A
            %0_2A2B4                             * EA72F
            $       "ft"                         * EA734
            %2                                   * EA742
            um^                                  * EA747
            umEND                                * EA74C
          ;                                      * EA751
          UNIT                                   * EA756
            %0_2A2B4                             * EA75B
            $       "r"                          * EA760
            $       "in"                         * EA76C
            um/                                  * EA77A
            umEND                                * EA77F
          ;                                      * EA784
          CHR_D                                  * EA789
          CHR_D                                  * EA78E
          UNIT                                   * EA793
            %0_2A2B4                             * EA798
            $       "lb"                         * EA79D
            $       "ft"                         * EA7AB
            %3                                   * EA7B9
            um^                                  * EA7BE
            um/                                  * EA7C3
            umEND                                * EA7C8
          ;                                      * EA7CD
          UNIT                                   * EA7D2
            %0_2A2B4                             * EA7D7
            $       "°"                          * EA7DC
            umEND                                * EA7E8
          ;                                      * EA7ED
          UNIT                                   * EA7F2
            %0_2A2B4                             * EA7F7
            $       "min"                        * EA7FC
            umEND                                * EA80C
          ;                                      * EA811
          UNIT                                   * EA816
            %0_2A2B4                             * EA81B
            $       "Btu"                        * EA820
            $       "lb"                         * EA830
            $       "°F"                         * EA83E
            um*                                  * EA84C
            um/                                  * EA851
            umEND                                * EA856
          ;                                      * EA85B
          UNIT                                   * EA860
            %0_2A2B4                             * EA865
            $       "Btu"                        * EA86A
            $       "h"                          * EA87A
            um/                                  * EA886
            umEND                                * EA88B
          ;                                      * EA890
          UNIT                                   * EA895
            %0_2A2B4                             * EA89A
            $       "Btu"                        * EA89F
            $       "h"                          * EA8AF
            $       "ft"                         * EA8BB
            %2                                   * EA8C9
            um^                                  * EA8CE
            um*                                  * EA8D3
            $       "°F"                         * EA8D8
            um*                                  * EA8E6
            um/                                  * EA8EB
            umEND                                * EA8F0
          ;                                      * EA8F5
          UNIT                                   * EA8FA
            %0_2A2B4                             * EA8FF
            $       "Btu"                        * EA904
            $       "h"                          * EA914
            $       "ft"                         * EA920
            um*                                  * EA92E
            $       "°F"                         * EA933
            um*                                  * EA941
            um/                                  * EA946
            umEND                                * EA94B
          ;                                      * EA950
          UNIT                                   * EA955
            %0_2A2B4                             * EA95A
            tok1                                 * EA95F
            $       "°F"                         * EA964
            um/                                  * EA972
            umEND                                * EA977
          ;                                      * EA97C
          UNIT                                   * EA981
            %0_2A2B4                             * EA986
            $       "Btu"                        * EA98B
            $       "h"                          * EA99B
            $       "ft"                         * EA9A7
            %2                                   * EA9B5
            um^                                  * EA9BA
            um*                                  * EA9BF
            um/                                  * EA9C4
            umEND                                * EA9C9
          ;                                      * EA9CE
          UNIT                                   * EA9D3
            %0_2A2B4                             * EA9D8
            $       "hp"                         * EA9DD
            umEND                                * EA9EB
          ;                                      * EA9F0
          UNIT                                   * EA9F5
L_EA9FA:
            %0_2A2B4                             * EA9FA
            $       "lbf"                        * EA9FF
            tok_s                                * EAA0F
            um*                                  * EAA14
            $       "ft"                         * EAA19
            %2                                   * EAA27
            um^                                  * EAA2C
            um/                                  * EAA31
            umEND                                * EAA36
          ;                                      * EAA3B
          UNIT                                   * EAA40
            %0_2A2B4                             * EAA45
            $       "ft"                         * EAA4A
            %2                                   * EAA58
            um^                                  * EAA5D
            tok_s                                * EAA62
            um/                                  * EAA67
            umEND                                * EAA6C
          ;                                      * EAA71
          UNIT                                   * EAA76
            %0_2A2B4                             * EAA7B
            $       "ft"                         * EAA80
            %3                                   * EAA8E
            um^                                  * EAA93
            $       "min"                        * EAA98
            um/                                  * EAAA8
            umEND                                * EAAAD
          ;                                      * EAAB2
          UNIT                                   * EAAB7
            %0_2A2B4                             * EAABC
            $       "lb"                         * EAAC1
            $       "min"                        * EAACF
            um/                                  * EAADF
            umEND                                * EAAE4
          ;                                      * EAAE9
          UNIT                                   * EAAEE
            %0_2A2B4                             * EAAF3
            $       "ft"                         * EAAF8
            %2                                   * EAB06
            um^                                  * EAB0B
            tok_s                                * EAB10
            %2                                   * EAB15
            um^                                  * EAB1A
            um/                                  * EAB1F
            umEND                                * EAB24
          ;                                      * EAB29
          UNIT                                   * EAB2E
            %0_2A2B4                             * EAB33
            $       "ft"                         * EAB38
            $       "lbf"                        * EAB46
            um*                                  * EAB56
            umEND                                * EAB5B
          ;                                      * EAB60
          UNIT                                   * EAB65
            %0_2A2B4                             * EAB6A
            $       "mi"                         * EAB6F
            umEND                                * EAB7D
          ;                                      * EAB82
          CHR_D                                  * EAB87
          UNIT                                   * EAB8C
            %0_2A2B4                             * EAB91
            $       "rpm"                        * EAB96
            umEND                                * EABA6
          ;                                      * EABAB
          CHR_D                                  * EABB0
          CHR_D                                  * EABB5
          CHR_D                                  * EABBA
          CHR_D                                  * EABBF
          CHR_D                                  * EABC4
          CHR_D                                  * EABC9
          CHR_D                                  * EABCE
          UNIT                                   * EABD3
            %0_2A2B4                             * EABD8
            $       "in"                         * EABDD
            tok_s                                * EABEB
            um/                                  * EABF0
            umEND                                * EABF5
          ;                                      * EABFA
          CHR_D                                  * EABFF
          CHR_D                                  * EAC04
          CHR_D                                  * EAC09
          CHR_D                                  * EAC0E
          CHR_D                                  * EAC13
          CHR_D                                  * EAC18
          CHR_D                                  * EAC1D
          CHR_D                                  * EAC22
        }                                        * EAC27

* ROMPTR 0E2 014
* refs (1): E3857
ROMP_0E2_014:
        {                                        * EAC2C
          %1                                     * EAC31
          UNIT                                   * EAC36
            %0_2A2B4                             * EAC3B
            tok_m                                * EAC40
            umEND                                * EAC45
          ;                                      * EAC4A
          UNIT                                   * EAC4F
            %0_2A2B4                             * EAC54
            CHR_k                                * EAC59
            $       "Pa"                         * EAC5E
            umP                                  * EAC6C
            umEND                                * EAC71
          ;                                      * EAC76
          UNIT                                   * EAC7B
            %0_2A2B4                             * EAC80
            CHR_m                                * EAC85
            tok_m                                * EAC8A
            umP                                  * EAC8F
            %4                                   * EAC94
            um^                                  * EAC99
            umEND                                * EAC9E
          ;                                      * EACA3
          UNIT                                   * EACA8
            %0_2A2B4                             * EACAD
            CHR_k                                * EACB2
            $       "N"                          * EACB7
            umP                                  * EACC3
            umEND                                * EACC8
          ;                                      * EACCD
          UNIT                                   * EACD2
            %0_2A2B4                             * EACD7
            CHR_k                                * EACDC
            $       "N"                          * EACE1
            umP                                  * EACED
            tok_m                                * EACF2
            um*                                  * EACF7
            umEND                                * EACFC
          ;                                      * EAD01
          UNIT                                   * EAD06
            %0_2A2B4                             * EAD0B
            CHR_k                                * EAD10
            $       "N"                          * EAD15
            umP                                  * EAD21
            tok_m                                * EAD26
            um/                                  * EAD2B
            umEND                                * EAD30
          ;                                      * EAD35
          UNIT                                   * EAD3A
            %0_2A2B4                             * EAD3F
            CHR_k                                * EAD44
            tok_g                                * EAD49
            umP                                  * EAD4E
            umEND                                * EAD53
          ;                                      * EAD58
          UNIT                                   * EAD5D
            %0_2A2B4                             * EAD62
            tok_m                                * EAD67
            tok_s                                * EAD6C
            um/                                  * EAD71
            umEND                                * EAD76
          ;                                      * EAD7B
          UNIT                                   * EAD80
            %0_2A2B4                             * EAD85
            $       "C"                          * EAD8A
            umEND                                * EAD96
          ;                                      * EAD9B
          UNIT                                   * EADA0
            %0_2A2B4                             * EADA5
            $       "N"                          * EADAA
            umEND                                * EADB6
          ;                                      * EADBB
          UNIT                                   * EADC0
            %0_2A2B4                             * EADC5
            $       "V"                          * EADCA
            umEND                                * EADD6
          ;                                      * EADDB
          UNIT                                   * EADE0
            %0_2A2B4                             * EADE5
            $       "A"                          * EADEA
            umEND                                * EADF6
          ;                                      * EADFB
          UNIT                                   * EAE00
            %0_2A2B4                             * EAE05
            $       "Ω"                          * EAE0A
            umEND                                * EAE16
          ;                                      * EAE1B
          UNIT                                   * EAE20
            %0_2A2B4                             * EAE25
            $       "W"                          * EAE2A
            umEND                                * EAE36
          ;                                      * EAE3B
          UNIT                                   * EAE40
            %0_2A2B4                             * EAE45
            $       "Ω"                          * EAE4A
            CHR_c                                * EAE56
            tok_m                                * EAE5B
            umP                                  * EAE60
            um*                                  * EAE65
            umEND                                * EAE6A
          ;                                      * EAE6F
          UNIT                                   * EAE74
            %0_2A2B4                             * EAE79
            CHR_c                                * EAE7E
            tok_m                                * EAE83
            umP                                  * EAE88
            %2                                   * EAE8D
            um^                                  * EAE92
            umEND                                * EAE97
          ;                                      * EAE9C
          UNIT                                   * EAEA1
            %0_2A2B4                             * EAEA6
            CHR     "µ"                          * EAEAB
            $       "F"                          * EAEB2
            umP                                  * EAEBE
            umEND                                * EAEC3
          ;                                      * EAEC8
          UNIT                                   * EAECD
            %0_2A2B4                             * EAED2
            CHR_m                                * EAED7
            $       "H"                          * EAEDC
            umP                                  * EAEE8
            umEND                                * EAEED
          ;                                      * EAEF2
          UNIT                                   * EAEF7
            %0_2A2B4                             * EAEFC
            $       "J"                          * EAF01
            umEND                                * EAF0D
          ;                                      * EAF12
          UNIT                                   * EAF17
            %0_2A2B4                             * EAF1C
            $       "r"                          * EAF21
            tok_s                                * EAF2D
            um/                                  * EAF32
            umEND                                * EAF37
          ;                                      * EAF3C
          UNIT                                   * EAF41
            %0_2A2B4                             * EAF46
            $       "Hz"                         * EAF4B
            umEND                                * EAF59
          ;                                      * EAF5E
          UNIT                                   * EAF63
            %0_2A2B4                             * EAF68
            tok_s                                * EAF6D
            umEND                                * EAF72
          ;                                      * EAF77
          UNIT                                   * EAF7C
            %0_2A2B4                             * EAF81
            CHR_c                                * EAF86
            tok_m                                * EAF8B
            umP                                  * EAF90
            umEND                                * EAF95
          ;                                      * EAF9A
          UNIT                                   * EAF9F
            %0_2A2B4                             * EAFA4
            tok1                                 * EAFA9
            CHR_c                                * EAFAE
            tok_m                                * EAFB3
            umP                                  * EAFB8
            um/                                  * EAFBD
            umEND                                * EAFC2
          ;                                      * EAFC7
          UNIT                                   * EAFCC
            %0_2A2B4                             * EAFD1
            tok_m                                * EAFD6
            %3                                   * EAFDB
            um^                                  * EAFE0
            umEND                                * EAFE5
          ;                                      * EAFEA
          UNIT                                   * EAFEF
            %0_2A2B4                             * EAFF4
            $       "gmol"                       * EAFF9
            umEND                                * EB00B
          ;                                      * EB010
          UNIT                                   * EB015
            %0_2A2B4                             * EB01A
            $       "°C"                         * EB01F
            umEND                                * EB02D
          ;                                      * EB032
          UNIT                                   * EB037
            %0_2A2B4                             * EB03C
            $       "K"                          * EB041
            umEND                                * EB04D
          ;                                      * EB052
          UNIT                                   * EB057
            %0_2A2B4                             * EB05C
            CHR_k                                * EB061
            $       "J"                          * EB066
            umP                                  * EB072
            umEND                                * EB077
          ;                                      * EB07C
          UNIT                                   * EB081
            %0_2A2B4                             * EB086
            tok1                                 * EB08B
            $       "l"                          * EB090
            um/                                  * EB09C
            umEND                                * EB0A1
          ;                                      * EB0A6
          UNIT                                   * EB0AB
            %0_2A2B4                             * EB0B0
            CHR_n                                * EB0B5
            tok_m                                * EB0BA
            umP                                  * EB0BF
            umEND                                * EB0C4
          ;                                      * EB0C9
          UNIT                                   * EB0CE
            %0_2A2B4                             * EB0D3
            tok_g                                * EB0D8
            $       "gmol"                       * EB0DD
            um/                                  * EB0EF
            umEND                                * EB0F4
          ;                                      * EB0F9
          UNIT                                   * EB0FE
            %0_2A2B4                             * EB103
            $       "N"                          * EB108
            tok_m                                * EB114
            um*                                  * EB119
            umEND                                * EB11E
          ;                                      * EB123
          UNIT                                   * EB128
            %0_2A2B4                             * EB12D
            CHR_c                                * EB132
            tok_m                                * EB137
            umP                                  * EB13C
            %3                                   * EB141
            um^                                  * EB146
            umEND                                * EB14B
          ;                                      * EB150
          UNIT                                   * EB155
            %0_2A2B4                             * EB15A
            CHR_k                                * EB15F
            tok_g                                * EB164
            umP                                  * EB169
            tok_m                                * EB16E
            %2                                   * EB173
            um^                                  * EB178
            um*                                  * EB17D
            umEND                                * EB182
          ;                                      * EB187
          UNIT                                   * EB18C
            %0_2A2B4                             * EB191
            tok_m                                * EB196
            tok_s                                * EB19B
            %2                                   * EB1A0
            um^                                  * EB1A5
            um/                                  * EB1AA
            umEND                                * EB1AF
          ;                                      * EB1B4
          UNIT                                   * EB1B9
            %0_2A2B4                             * EB1BE
            $       "r"                          * EB1C3
            tok_s                                * EB1CF
            %2                                   * EB1D4
            um^                                  * EB1D9
            um/                                  * EB1DE
            umEND                                * EB1E3
          ;                                      * EB1E8
          UNIT                                   * EB1ED
            %0_2A2B4                             * EB1F2
            $       "r"                          * EB1F7
            tok_s                                * EB203
            um/                                  * EB208
            umEND                                * EB20D
          ;                                      * EB212
          UNIT                                   * EB217
            %0_2A2B4                             * EB21C
            $       "l"                          * EB221
            umEND                                * EB22D
          ;                                      * EB232
          UNIT                                   * EB237
            %0_2A2B4                             * EB23C
            $       "r"                          * EB241
            umEND                                * EB24D
          ;                                      * EB252
          UNIT                                   * EB257
            %0_2A2B4                             * EB25C
            $       "T"                          * EB261
            umEND                                * EB26D
          ;                                      * EB272
          UNIT                                   * EB277
            %0_2A2B4                             * EB27C
            CHR_n                                * EB281
            tok_m                                * EB286
            umP                                  * EB28B
            umEND                                * EB290
          ;                                      * EB295
          UNIT                                   * EB29A
            %0_2A2B4                             * EB29F
            CHR_k                                * EB2A4
            tok_g                                * EB2A9
            umP                                  * EB2AE
            tok_s                                * EB2B3
            um/                                  * EB2B8
            umEND                                * EB2BD
          ;                                      * EB2C2
          UNIT                                   * EB2C7
            %0_2A2B4                             * EB2CC
            $       "N"                          * EB2D1
            tok_m                                * EB2DD
            um/                                  * EB2E2
            umEND                                * EB2E7
          ;                                      * EB2EC
          UNIT                                   * EB2F1
            %0_2A2B4                             * EB2F6
            CHR     "µ"                          * EB2FB
            $       "s"                          * EB302
            umP                                  * EB30E
            umEND                                * EB313
          ;                                      * EB318
          UNIT                                   * EB31D
            %0_2A2B4                             * EB322
            tok_m                                * EB327
            %2                                   * EB32C
            um^                                  * EB331
            umEND                                * EB336
          ;                                      * EB33B
          UNIT                                   * EB340
            %0_2A2B4                             * EB345
            $       "r"                          * EB34A
            CHR_c                                * EB356
            tok_m                                * EB35B
            umP                                  * EB360
            um/                                  * EB365
            umEND                                * EB36A
          ;                                      * EB36F
          UNIT                                   * EB374
            %0_2A2B4                             * EB379
            $       "W"                          * EB37E
            tok_m                                * EB38A
            %2                                   * EB38F
            um^                                  * EB394
            um/                                  * EB399
            umEND                                * EB39E
          ;                                      * EB3A3
          UNIT                                   * EB3A8
            %0_2A2B4                             * EB3AD
            $       "dB"                         * EB3B2
            umEND                                * EB3C0
          ;                                      * EB3C5
          UNIT                                   * EB3CA
            %0_2A2B4                             * EB3CF
            CHR_k                                * EB3D4
            tok_g                                * EB3D9
            umP                                  * EB3DE
            tok_m                                * EB3E3
            %3                                   * EB3E8
            um^                                  * EB3ED
            um/                                  * EB3F2
            umEND                                * EB3F7
          ;                                      * EB3FC
          UNIT                                   * EB401
            %0_2A2B4                             * EB406
            $       "°"                          * EB40B
            umEND                                * EB417
          ;                                      * EB41C
          UNIT                                   * EB421
            %0_2A2B4                             * EB426
            tok_s                                * EB42B
            umEND                                * EB430
          ;                                      * EB435
          UNIT                                   * EB43A
            %0_2A2B4                             * EB43F
            CHR_k                                * EB444
            $       "J"                          * EB449
            umP                                  * EB455
            CHR_k                                * EB45A
            tok_g                                * EB45F
            umP                                  * EB464
            $       "K"                          * EB469
            um*                                  * EB475
            um/                                  * EB47A
            umEND                                * EB47F
          ;                                      * EB484
          UNIT                                   * EB489
            %0_2A2B4                             * EB48E
            $       "W"                          * EB493
            umEND                                * EB49F
          ;                                      * EB4A4
          UNIT                                   * EB4A9
            %0_2A2B4                             * EB4AE
            $       "W"                          * EB4B3
            tok_m                                * EB4BF
            %2                                   * EB4C4
            um^                                  * EB4C9
            $       "K"                          * EB4CE
            um*                                  * EB4DA
            um/                                  * EB4DF
            umEND                                * EB4E4
          ;                                      * EB4E9
          UNIT                                   * EB4EE
            %0_2A2B4                             * EB4F3
            $       "W"                          * EB4F8
            tok_m                                * EB504
            $       "K"                          * EB509
            um*                                  * EB515
            um/                                  * EB51A
            umEND                                * EB51F
          ;                                      * EB524
          UNIT                                   * EB529
            %0_2A2B4                             * EB52E
            tok1                                 * EB533
            $       "°C"                         * EB538
            um/                                  * EB546
            umEND                                * EB54B
          ;                                      * EB550
          UNIT                                   * EB555
            %0_2A2B4                             * EB55A
            $       "W"                          * EB55F
            tok_m                                * EB56B
            %2                                   * EB570
            um^                                  * EB575
            um/                                  * EB57A
            umEND                                * EB57F
          ;                                      * EB584
          UNIT                                   * EB589
            %0_2A2B4                             * EB58E
            $       "W"                          * EB593
            umEND                                * EB59F
          ;                                      * EB5A4
          UNIT                                   * EB5A9
            %0_2A2B4                             * EB5AE
            $       "Pa"                         * EB5B3
            tok_s                                * EB5C1
            um*                                  * EB5C6
            umEND                                * EB5CB
          ;                                      * EB5D0
          UNIT                                   * EB5D5
            %0_2A2B4                             * EB5DA
            tok_m                                * EB5DF
            %2                                   * EB5E4
            um^                                  * EB5E9
            tok_s                                * EB5EE
            um/                                  * EB5F3
            umEND                                * EB5F8
          ;                                      * EB5FD
          UNIT                                   * EB602
            %0_2A2B4                             * EB607
            tok_m                                * EB60C
            %3                                   * EB611
            um^                                  * EB616
            tok_s                                * EB61B
            um/                                  * EB620
            umEND                                * EB625
          ;                                      * EB62A
          UNIT                                   * EB62F
            %0_2A2B4                             * EB634
            CHR_k                                * EB639
            $       "g"                          * EB63E
            umP                                  * EB64A
            tok_s                                * EB64F
            um/                                  * EB654
            umEND                                * EB659
          ;                                      * EB65E
          UNIT                                   * EB663
            %0_2A2B4                             * EB668
            tok_m                                * EB66D
            %2                                   * EB672
            um^                                  * EB677
            tok_s                                * EB67C
            %2                                   * EB681
            um^                                  * EB686
            um/                                  * EB68B
            umEND                                * EB690
          ;                                      * EB695
          UNIT                                   * EB69A
            %0_2A2B4                             * EB69F
            $       "J"                          * EB6A4
            umEND                                * EB6B0
          ;                                      * EB6B5
          UNIT                                   * EB6BA
            %0_2A2B4                             * EB6BF
            CHR_k                                * EB6C4
            tok_m                                * EB6C9
            umP                                  * EB6CE
            umEND                                * EB6D3
          ;                                      * EB6D8
          UNIT                                   * EB6DD
            %0_2A2B4                             * EB6E2
            CHR_c                                * EB6E7
            tok_m                                * EB6EC
            umP                                  * EB6F1
            %2                                   * EB6F6
            um^                                  * EB6FB
            umEND                                * EB700
          ;                                      * EB705
          UNIT                                   * EB70A
            %0_2A2B4                             * EB70F
            $       "Hz"                         * EB714
            umEND                                * EB722
          ;                                      * EB727
          UNIT                                   * EB72C
            %0_2A2B4                             * EB731
            $       "°C"                         * EB736
            umEND                                * EB744
          ;                                      * EB749
          UNIT                                   * EB74E
            %0_2A2B4                             * EB753
            $       "A"                          * EB758
            CHR_c                                * EB764
            tok_m                                * EB769
            umP                                  * EB76E
            %2                                   * EB773
            um^                                  * EB778
            um/                                  * EB77D
            umEND                                * EB782
          ;                                      * EB787
          UNIT                                   * EB78C
            %0_2A2B4                             * EB791
            CHR_m                                * EB796
            $       "A"                          * EB79B
            umP                                  * EB7A7
            umEND                                * EB7AC
          ;                                      * EB7B1
          UNIT                                   * EB7B6
            %0_2A2B4                             * EB7BB
            CHR_m                                * EB7C0
            $       "A"                          * EB7C5
            umP                                  * EB7D1
            $       "V"                          * EB7D6
            um/                                  * EB7E2
            umEND                                * EB7E7
          ;                                      * EB7EC
          UNIT                                   * EB7F1
            %0_2A2B4                             * EB7F6
            tok1                                 * EB7FB
            $       "V"                          * EB800
            um/                                  * EB80C
            umEND                                * EB811
          ;                                      * EB816
          UNIT                                   * EB81B
            %0_2A2B4                             * EB820
            CHR_n                                * EB825
            $       "A"                          * EB82A
            umP                                  * EB836
            umEND                                * EB83B
          ;                                      * EB840
          UNIT                                   * EB845
            %0_2A2B4                             * EB84A
            $       "S"                          * EB84F
            umEND                                * EB85B
          ;                                      * EB860
          UNIT                                   * EB865
            %0_2A2B4                             * EB86A
            CHR_c                                * EB86F
            tok_m                                * EB874
            umP                                  * EB879
            tok_s                                * EB87E
            um/                                  * EB883
            umEND                                * EB888
          ;                                      * EB88D
          UNIT                                   * EB892
            %0_2A2B4                             * EB897
            $       "Å"                          * EB89C
            umEND                                * EB8A8
          ;                                      * EB8AD
          UNIT                                   * EB8B2
            %0_2A2B4                             * EB8B7
            tok1                                 * EB8BC
            CHR_c                                * EB8C1
            tok_m                                * EB8C6
            umP                                  * EB8CB
            %3                                   * EB8D0
            um^                                  * EB8D5
            um/                                  * EB8DA
            umEND                                * EB8DF
          ;                                      * EB8E4
          UNIT                                   * EB8E9
            %0_2A2B4                             * EB8EE
            CHR     "µ"                          * EB8F3
            $       "A"                          * EB8FA
            umP                                  * EB906
            CHR_c                                * EB90B
            tok_m                                * EB910
            umP                                  * EB915
            %2                                   * EB91A
            um^                                  * EB91F
            um/                                  * EB924
            umEND                                * EB929
          ;                                      * EB92E
          UNIT                                   * EB933
            %0_2A2B4                             * EB938
            $       "µ"                          * EB93D
            umEND                                * EB949
          ;                                      * EB94E
          UNIT                                   * EB953
            %0_2A2B4                             * EB958
            CHR_p                                * EB95D
            $       "F"                          * EB962
            umP                                  * EB96E
            CHR_c                                * EB973
            tok_m                                * EB978
            umP                                  * EB97D
            %2                                   * EB982
            um^                                  * EB987
            um/                                  * EB98C
            umEND                                * EB991
          ;                                      * EB996
          UNIT                                   * EB99B
            %0_2A2B4                             * EB9A0
            $       "V"                          * EB9A5
            CHR_c                                * EB9B1
            tok_m                                * EB9B6
            umP                                  * EB9BB
            um/                                  * EB9C0
            umEND                                * EB9C5
          ;                                      * EB9CA
          UNIT                                   * EB9CF
            %0_2A2B4                             * EB9D4
            CHR_c                                * EB9D9
            tok_m                                * EB9DE
            umP                                  * EB9E3
            %2                                   * EB9E8
            um^                                  * EB9ED
            $       "V"                          * EB9F2
            tok_s                                * EB9FE
            um*                                  * EBA03
            um/                                  * EBA08
            umEND                                * EBA0D
          ;                                      * EBA12
          UNIT                                   * EBA17
            %0_2A2B4                             * EBA1C
            $       "V"                          * EBA21
            %       5E-1                         * EBA2D
            um^                                  * EBA42
            umEND                                * EBA47
          ;                                      * EBA4C
        }                                        * EBA51

* ROMPTR 0E2 015
* refs (1): E3857
ROMP_0E2_015:
        {                                        * EBA56
          ROMPTR  0E2 016                        * EBA5B
          ROMPTR  0E2 017                        * EBA66
          ROMPTR  0E2 018                        * EBA71
          ROMPTR  0E2 019                        * EBA7C
          ROMPTR  0E2 01A                        * EBA87
          ROMPTR  0E2 01B                        * EBA92
          ROMPTR  0E2 01C                        * EBA9D
          ROMPTR  0E2 01D                        * EBAA8
          ROMPTR  0E2 01E                        * EBAB3
          ROMPTR  0E2 01F                        * EBABE
          ROMPTR  0E2 020                        * EBAC9
          ROMPTR  0E2 021                        * EBAD4
          ROMPTR  0E2 022                        * EBADF
          ROMPTR  0E2 023                        * EBAEA
          ROMPTR  0E2 024                        * EBAF5
        }                                        * EBB00

* ROMPTR 0E2 016
* refs (1): E3857
ROMP_0E2_016:
        {                                        * EBB05
          ROMPTR  0E2 004                        * EBB0A
          #       A                              * EBB15  10
          {                                      * EBB1F
            {                                    * EBB24
              {                                  * EBB29
                BINT3                            * EBB2E
                BINT4                            * EBB33
                {                                * EBB38
                  $       "Pcr=π\0C*E*A\0DK*L/r)\0C\0A" * EBB3D
                  $       "Pcr=π\0C*E*I\0DK*L)\0C" * EBB6D
                  $       "σcr=Pcr/A"            * EBB97
                  $       "r=√(I/A)"             * EBBB3
                }                                * EBBCD
                {                                * EBBD2
                  CHR_D                          * EBBD7
                  CHR_D                          * EBBDC
                  CHR_D                          * EBBE1
                  $       "r=√(\02I/A\0F"        * EBBE6
                }                                * EBC02
              }                                  * EBC07
              {                                  * EBC0C
                $       "\08\07\06\05\04\03\02\01" * EBC11
                #       B                        * EBC2B  11
                #       8                        * EBC35  8
                $       "\02\01\18\03\04\11\05\03" * EBC3F
              }                                  * EBC59
              ROMPTR  0E2 02D                    * EBC5E
            }                                    * EBC69
            {                                    * EBC6E
              {                                  * EBC73
                BINT3                            * EBC78
                BINT2                            * EBC7D
                {                                * EBC82
                  $       "σmax=P/A\101+ε*c/r\0C*\0A(1/\04K*L\0D\08r\09√(P/\0A(E*A\0F\0F)" * EBC87
                  $       "r=√(I/A)"             * EBCE5
                }                                * EBCFF
                {                                * EBD04
                  $       "σmax=P/A\101+ε*c/r\0C\101/\04\01\06\09K*L\0D\08r\09√(\02P\0DE*A\0F\0F\0F" * EBD09
                  $       "r=√(\02I/A\0F"        * EBD67
                }                                * EBD83
              }                                  * EBD88
              {                                  * EBD8D
                $       "\08\07\06\05\04\03\0C\0B\0A\09" * EBD92
                #       13                       * EBDB0  19
                #       A                        * EBDBA  10
                $       "\02\01\18\03\04\11\18\18\05\03" * EBDC4
              }                                  * EBDE2
              ROMPTR  0E2 02E                    * EBDE7
            }                                    * EBDF2
            {                                    * EBDF7
              {                                  * EBDFC
                BINT1                            * EBE01
                $       "y=P\10L-a\09x\0D6*L*E*I)\0A\10x\0C+(L-a)\0C-L\0C)-\0AM*x\0DE*I\09(c-x\0C/\0A(6*L)-L/3-c\0C\0D\08L\0F-\0Aw*x\0D24*E*I\09(L^3+\0Ax\0C\10x-\08L\0F" * EBE06
                $       "y=\03x≤a;P\10L-a\09x\0D6*L*E*I\09(x\0C+(L-a)\0C-L\0C);P*a\10L-x)\0D6*L*E*I\09((L-x)\0C+a\0C-L\0C\0F+\03x≤c;-M*x\0DE*I\09(c-x\0C\0D6*L)-L/3-c\0C\0D\08L\0F;-M*x\0DE*I\09((c\0C+x\0C)\0D\08x)-x\0C\0D6*L)-L/3-c\0C\0D\08L\0F)-w*x\0D24*E*I\09(L^3+x\0C\10x-\08L\0F" * EBECA
              }                                  * EC02C
              ROMPTR  0E2 025                    * EC031
              ROMPTR  0E2 02C                    * EC03C
            }                                    * EC047
            {                                    * EC04C
              {                                  * EC051
                BINT1                            * EC056
                $       "θ=P\10L-a)\0D6*L*E*I\09\0A(3*x\0C+(L-a)\0C-L\0C)-\0AM\0DE*I\09(c-x\0C\0D\08L)-\0AL/3-c\0C\0D\08L\0F-w/\0A(24*E*I\09(L^3+x\0C*\0A(4*x-6*L\0F" * EC05B
                $       "θ=\01\06\09(\03x≤a;P\10L-a)\0D6*L*E*I\09(3*x\0C+(L-a)\0C-L\0C);-P*a\0D6*L*E*I\09(3\10L-x)\0C+a\0C-L\0C\0F+\03x≤c;-M\0DE*I\09(c-x\0C\0D\08L)-L/3-c\0C\0D\08L\0F;-M\0DE*I\09(x-x\0C\0D\08L)-L/3-c\0C\0D\08L\0F)-w\0D24*E*I\09(L^3+x\0C\104*x-6*L\0F)" * EC11F
              }                                  * EC269
              ROMPTR  0E2 026                    * EC26E
              ROMPTR  0E2 02C                    * EC279
            }                                    * EC284
            {                                    * EC289
              {                                  * EC28E
                BINT1                            * EC293
                $       "Mx=P\10L-a\09x/L+M*x/L+\0Aw*x/\08(L-x)" * EC298
                $       "Mx=\03x≤a;P\10L-a\09x/L;P*a\10L-x)/L)+\03x≤c;M*x/L;-M\10L-x)/L)+w*x/\08(L-x)" * EC2DE
              }                                  * EC364
              ROMPTR  0E2 027                    * EC369
              ROMPTR  0E2 02C                    * EC374
            }                                    * EC37F
            {                                    * EC384
              {                                  * EC389
                BINT1                            * EC38E
                $       "V=P\10L-a)/L+M/L+w/\08\0A(L-\08x)" * EC393
                $       "V=\03x≤a;P\10L-a)/L;-P*a/L)+M/L+w/\08(L-\08x)" * EC3CF
              }                                  * EC423
              {                                  * EC428
                $       "\08\11\0A\10\0Fî\0E\14" * EC42D
                #       39                       * EC447  57
                #       7                        * EC451  7
                $       "\02\02\05\06\07\02\05"  * EC45B
              }                                  * EC473
              ROMPTR  0E2 02C                    * EC478
            }                                    * EC483
            {                                    * EC488
              {                                  * EC48D
                BINT1                            * EC492
                $       "y=P*x\0C\0D6*E*I\09\0A(x-3*a)+M*x\0C\0D\08E*I)-\0Aw*x\0C\0D24*E*I\09(6*\0AL\0C-4*L*x+x\0C)" * EC497
                $       "y=\03x≤a;P*x\0C\0D6*E*I\09(x-3*a);P*a\0C\0D6*E*I\09(a-3*x\0F+\03x≤c;M*x\0C\0D\08E*I);M*c\0D\08E*I\09(\08x-c\0F-w*x\0C\0D24*E*I\09(6*L\0C-4*L*x+x\0C)" * EC51D
              }                                  * EC5F7
              ROMPTR  0E2 025                    * EC5FC
              ROMPTR  0E2 02B                    * EC607
            }                                    * EC612
            {                                    * EC617
              {                                  * EC61C
                BINT1                            * EC621
                $       "θ=P*x\0D\08E*I\09(x-\08a)\0A+M*x\0DE*I)-w*x\0D6*E*\0AI\09(3*L\0C-3*L*x+x\0C)" * EC626
                $       "θ=\01\06\09(\03x≤a;P*x\0D\08E*I\09(x-\08a);-P*a\0C\0D\08E*I\0F+\03x≤c;M*x\0DE*I);M*c\0DE*I\0F-w*x\0D6*E*I\09(3*L\0C-3*L*x+x\0C\0F" * EC69C
              }                                  * EC754
              ROMPTR  0E2 026                    * EC759
              ROMPTR  0E2 02B                    * EC764
            }                                    * EC76F
            {                                    * EC774
              {                                  * EC779
                BINT1                            * EC77E
                $       "Mx=P\10x-a)+M-w/\08\0A(L\0C-\08L*x+x\0C)" * EC783
                $       "Mx=\03x≤a;P\10x-a);0)+\03x≤c;M;0)-w/\08(L\0C-\08L*x+x\0C)" * EC7C5
              }                                  * EC825
              ROMPTR  0E2 027                    * EC82A
              ROMPTR  0E2 02B                    * EC835
            }                                    * EC840
            {                                    * EC845
              {                                  * EC84A
                BINT1                            * EC84F
                $       "V=P+w\10L-x)"           * EC854
                $       "V=\03x≤a;P;0)+w\10L-x)" * EC872
              }                                  * EC8A0
              {                                  * EC8A5
                $       "\08\11\0A\0F\0E\14"     * EC8AA
                #       40                       * EC8C0  64
                #       6                        * EC8CA  6
                $       "\02\02\05\07\02\05"     * EC8D4
              }                                  * EC8EA
              ROMPTR  0E2 02B                    * EC8EF
            }                                    * EC8FA
          }                                      * EC8FF
        }                                        * EC904

* ROMPTR 0E2 017
* refs (1): E3857
ROMP_0E2_017:
        {                                        * EC909
          ROMPTR  0E2 005                        * EC90E
          #       17                             * EC919  23
          {                                      * EC923
            {                                    * EC928
              {                                  * EC92D
                BINT1                            * EC932
                $       "F=1\0D4*π*ε0*εr\09\0A(q1*q2/r\0C)" * EC937
                $       "F=1\0D4*π*\01ε0\09εr\09(q1*q2/r\0C)" * EC973
              }                                  * EC9AF
              {                                  * EC9B4
                $       "\18\17\06\16\15"        * EC9B9
                #       18                       * EC9CD  24
                #       5                        * EC9D7  5
                $       "\0A\0A\18\01\0B"        * EC9E1
              }                                  * EC9F5
              ROMPTR  0E2 02A                    * EC9FA
            }                                    * ECA05
            {                                    * ECA0A
              {                                  * ECA0F
                BINT2                            * ECA14
                BINT4                            * ECA19
                {                                * ECA1E
                  $       "V=I*R"                * ECA23
                  $       "P=V*I"                * ECA37
                  $       "P=I\0C*R"             * ECA4B
                  $       "P=V\0C/R"             * ECA61
                }                                * ECA77
              }                                  * ECA7C
              {                                  * ECA81
                $       "\14\04\19\0A"           * ECA86
                #       1D                       * ECA98  29
                #       4                        * ECAA2  4
                $       "\0C\0D\0E\0F"           * ECAAC
              }                                  * ECABE
              ROMPTR  0E2 02A                    * ECAC3
            }                                    * ECACE
            {                                    * ECAD3
              {                                  * ECAD8
                BINT0                            * ECADD
                $       "V1=V\10R1\0DR1+R2\0F"   * ECAE2
              }                                  * ECB08
              {                                  * ECB0D
                $       "\1C\1B\14\1A"           * ECB12
                #       21                       * ECB24  33
                #       4                        * ECB2E  4
                $       "\0E\0E\0C\0C"           * ECB38
              }                                  * ECB4A
              ROMPTR  0E2 02F                    * ECB4F
            }                                    * ECB5A
            {                                    * ECB5F
              {                                  * ECB64
                BINT0                            * ECB69
                $       "I1=I\10R2\0DR1+R2\0F"   * ECB6E
              }                                  * ECB94
              {                                  * ECB99
                $       "\1C\1B\04\1D"           * ECB9E
                #       25                       * ECBB0  37
                #       4                        * ECBBA  4
                $       "\0E\0E\0D\0D"           * ECBC4
              }                                  * ECBD6
              ROMPTR  0E2 030                    * ECBDB
            }                                    * ECBE6
            {                                    * ECBEB
              {                                  * ECBF0
                BINT0                            * ECBF5
                $       "R=ρ*L/A"                * ECBFA
              }                                  * ECC12
              {                                  * ECC17
                $       "\1E\08\03\19"           * ECC1C
                #       29                       * ECC2E  41
                #       4                        * ECC38  4
                $       "\10\18\11\0E"           * ECC42
              }                                  * ECC54
              ROMPTR  0E2 02A                    * ECC59
            }                                    * ECC64
            {                                    * ECC69
              {                                  * ECC6E
                BINT2                            * ECC73
                BINT2                            * ECC78
                {                                * ECC7D
                  $       "Rs=R1+R2"             * ECC82
                  $       "1/Rp=1/R1+1/R2"       * ECC9C
                }                                * ECCC2
              }                                  * ECCC7
              {                                  * ECCCC
                $       "\1C\1B \1F"             * ECCD1
                #       2D                       * ECCE3  45
                #       4                        * ECCED  4
                $       "\0E\0E\0E\0E"           * ECCF7
              }                                  * ECD09
              ROMPTR  0E2 031                    * ECD0E
            }                                    * ECD19
            {                                    * ECD1E
              {                                  * ECD23
                BINT2                            * ECD28
                BINT2                            * ECD2D
                {                                * ECD32
                  $       "1/Cs=1/C1+1/C2"       * ECD37
                  $       "Cp=C1+C2"             * ECD5D
                }                                * ECD77
              }                                  * ECD7C
              {                                  * ECD81
                $       "$#\"!"                  * ECD86
                #       31                       * ECD98  49
                #       4                        * ECDA2  4
                $       "\12\12\12\12"           * ECDAC
              }                                  * ECDBE
              ROMPTR  0E2 032                    * ECDC3
            }                                    * ECDCE
            {                                    * ECDD3
              {                                  * ECDD8
                BINT2                            * ECDDD
                BINT2                            * ECDE2
                {                                * ECDE7
                  $       "Ls=L1+L2"             * ECDEC
                  $       "1/Lp=1/L1+1/L2"       * ECE06
                }                                * ECE2C
              }                                  * ECE31
              {                                  * ECE36
                $       "('&%"                   * ECE3B
                #       35                       * ECE4D  53
                #       4                        * ECE57  4
                $       "\13\13\13\13"           * ECE61
              }                                  * ECE73
              ROMPTR  0E2 033                    * ECE78
            }                                    * ECE83
            {                                    * ECE88
              {                                  * ECE8D
                BINT0                            * ECE92
                $       "E=C*V\0C/2"             * ECE97
              }                                  * ECEB1
              {                                  * ECEB6
                $       "\05)\14"                * ECEBB
                #       39                       * ECECB  57
                #       3                        * ECED5  3
                $       "\14\12\0C"              * ECEDF
              }                                  * ECEEF
              ROMPTR  0E2 02A                    * ECEF4
            }                                    * ECEFF
            {                                    * ECF04
              {                                  * ECF09
                BINT0                            * ECF0E
                $       "E=L*I\0C/2"             * ECF13
              }                                  * ECF2D
              {                                  * ECF32
                $       "\05\08\04"              * ECF37
                #       3C                       * ECF47  60
                #       3                        * ECF51  3
                $       "\14\13\0D"              * ECF5B
              }                                  * ECF6B
              ROMPTR  0E2 02A                    * ECF70
            }                                    * ECF7B
            {                                    * ECF80
              {                                  * ECF85
                BINT3                            * ECF8A
                BINT5                            * ECF8F
                {                                * ECF94
                  $       "TAN(Øs)\0EXL-XC)/R"   * ECF99
                  $       "TAN(Øp)\0E1/XC-1/XL)/\0A(1/R)" * ECFC3
                  $       "XC=1\0Dω*C)"          * ECFFF
                  $       "XL=ω*L"               * ED01B
                  $       "ω=\08π*f"             * ED031
                }                                * ED047
                {                                * ED04C
                  CHR_D                          * ED051
                  CHR_D                          * ED056
                  $       "XC=\01\06)\0Dω*C)"    * ED05B
                  $       "XL=ω*L/\01\06)"       * ED07B
                  $       "ω=\01\07π\09f"        * ED099
                }                                * ED0B1
              }                                  * ED0B6
              {                                  * ED0BB
                $       "/.)\08-,\19+*"          * ED0C0
                #       3F                       * ED0DC  63
                #       9                        * ED0E6  9
                $       "\15\16\12\13\0E\0E\0E44" * ED0F0
              }                                  * ED10C
              ROMPTR  0E2 034                    * ED111
            }                                    * ED11C
            {                                    * ED121
              {                                  * ED126
                BINT2                            * ED12B
                BINT3                            * ED130
                {                                * ED135
                  $       "I=C\10ΔV/Δt)"         * ED13A
                  $       "ΔV=Vf-Vi"             * ED158
                  $       "Δt=tf-ti"             * ED172
                }                                * ED18C
              }                                  * ED191
              {                                  * ED196
                $       ")54\04îî3210"           * ED19B
                #       48                       * ED1B9  72
                #       8                        * ED1C3  8
                $       "\12\0C.\0D\0C\0C.."     * ED1CD
              }                                  * ED1E7
              ROMPTR  0E2 02A                    * ED1EC
            }                                    * ED1F7
            {                                    * ED1FC
              {                                  * ED201
                BINT0                            * ED206
                $       "q=C*V"                  * ED20B
              }                                  * ED21F
              {                                  * ED224
                $       ")\146"                  * ED229
                #       50                       * ED239  80
                #       3                        * ED243  3
                $       "\12\0C\0A"              * ED24D
              }                                  * ED25D
              ROMPTR  0E2 02A                    * ED262
            }                                    * ED26D
            {                                    * ED272
              {                                  * ED277
                BINT2                            * ED27C
                BINT3                            * ED281
                {                                * ED286
                  $       "V=-L\10ΔI/Δt)"        * ED28B
                  $       "ΔI=If-Ii"             * ED2AB
                  $       "Δt=tf-ti"             * ED2C5
                }                                * ED2DF
              }                                  * ED2E4
              {                                  * ED2E9
                $       "\0894\14îî8710"         * ED2EE
                #       53                       * ED30C  83
                #       8                        * ED316  8
                $       "\13\0D.\0C\0D\0D.."     * ED320
              }                                  * ED33A
              ROMPTR  0E2 02A                    * ED33F
            }                                    * ED34A
            {                                    * ED34F
              {                                  * ED354
                BINT1                            * ED359
                $       "V=Vf-(Vf-Vi\09\0Ae^((-t)\0DR*C\0F" * ED35E
                $       "V=Vf-(Vf-Vi\09EXP(\02(-t)\0DR*C\0F)" * ED39A
              }                                  * ED3DA
              {                                  * ED3DF
                $       "32)\19:\14"             * ED3E4
                #       5B                       * ED3FA  91
                #       6                        * ED404  6
                $       "\0C\0C\12\0E.\0C"       * ED40E
              }                                  * ED424
              ROMPTR  0E2 035                    * ED429
            }                                    * ED434
            {                                    * ED439
              {                                  * ED43E
                BINT1                            * ED443
                $       "I=1/R\10Vf-(Vf-Vi\09e^\0A(-t*R/L\0F" * ED448
                $       "I=1/R\10Vf-(Vf-Vi\09EXP(\02-t*R/L\0F)" * ED488
              }                                  * ED4CC
              {                                  * ED4D1
                $       "32\08\19:\04"           * ED4D6
                #       61                       * ED4EC  97
                #       6                        * ED4F6  6
                $       "\0C\0C\13\0E.\0D"       * ED500
              }                                  * ED516
              ROMPTR  0E2 036                    * ED51B
            }                                    * ED526
            {                                    * ED52B
              {                                  * ED530
                BINT3                            * ED535
                BINT4                            * ED53A
                {                                * ED53F
                  $       "ω0=1/√(L*C)"          * ED544
                  $       "Qs=1/R*√(L/C)"        * ED564
                  $       "Qp=R*√(C/L)"          * ED588
                  $       "ω0=\08π*f0"           * ED5A8
                }                                * ED5C2
                {                                * ED5C7
                  $       "ω0=\01\06)/√(\02L*C\0F" * ED5CC
                  $       "Qs=1/R*√(\02L/C\0F"   * ED5F2
                  $       "Qp=R*√(\02C/L\0F"     * ED618
                  $       "ω0=\01\07π\09f0"      * ED63A
                }                                * ED656
              }                                  * ED65B
              {                                  * ED660
                $       "\08)\19>=<;"            * ED665
                #       67                       * ED67D  103
                #       7                        * ED687  7
                $       "\13\12\0E\15\01\01\16"  * ED691
              }                                  * ED6A9
              ROMPTR  0E2 02A                    * ED6AE
            }                                    * ED6B9
            {                                    * ED6BE
              {                                  * ED6C3
                BINT1                            * ED6C8
                $       "C\0Eε0*εr*A)/d"         * ED6CD
                $       "C\0E\01ε0\09εr*A)/d"    * ED6EF
              }                                  * ED713
              {                                  * ED718
                $       "\16\03?)"               * ED71D
                #       6E                       * ED72F  110
                #       4                        * ED739  4
                $       "\01\11\18\12"           * ED743
              }                                  * ED755
              ROMPTR  0E2 037                    * ED75A
            }                                    * ED765
            {                                    * ED76A
              {                                  * ED76F
                BINT1                            * ED774
                $       "C=\08π*ε0*εr*L/\0ALN(ro/ri)" * ED779
                $       "C=\08π*\01ε0\09εr*L/LN(\02ro/ri\0F" * ED7B1
              }                                  * ED7EB
              {                                  * ED7F0
                $       "\16A@\08)"              * ED7F5
                #       72                       * ED809  114
                #       5                        * ED813  5
                $       "\01\18\18\18\12"        * ED81D
              }                                  * ED831
              ROMPTR  0E2 038                    * ED836
            }                                    * ED841
            {                                    * ED846
              {                                  * ED84B
                BINT1                            * ED850
                $       "L=µ0*µr*n\0C*A*h"       * ED855
                $       "L=\01µ0\09µr*n\0C*A*h"  * ED87B
              }                                  * ED8A3
              {                                  * ED8A8
                $       "DC\03B\08"              * ED8AD
                #       77                       * ED8C1  119
                #       5                        * ED8CB  5
                $       "\01\19\11\18\13"        * ED8D5
              }                                  * ED8E9
              ROMPTR  0E2 039                    * ED8EE
            }                                    * ED8F9
            {                                    * ED8FE
              {                                  * ED903
                BINT1                            * ED908
                $       "L\0Eµ0*µr*N\0C*h)\0D\08π)\0A*LN(ro/ri)" * ED90D
                $       "L\0E\01µ0\09µr*N\0C*h)\0D\08π\09LN(\02ro/ri\0F" * ED94F
              }                                  * ED991
              {                                  * ED996
                $       "DEBA@\08"               * ED99B
                #       7C                       * ED9B1  124
                #       6                        * ED9BB  6
                $       "\01\01\18\18\18\13"     * ED9C5
              }                                  * ED9DB
              ROMPTR  0E2 03A                    * ED9E0
            }                                    * ED9EB
            {                                    * ED9F0
              {                                  * ED9F5
                BINT3                            * ED9FA
                BINT2                            * ED9FF
                {                                * EDA04
                  $       "V=Vmax*\05ω*t+Ø)"     * EDA09
                  $       "ω=\08π*f"             * EDA2F
                }                                * EDA45
                {                                * EDA4A
                  CHR_D                          * EDA4F
                  $       "ω=\01\07π\09f"        * EDA54
                }                                * EDA6C
              }                                  * EDA71
              {                                  * EDA76
                $       "/.:GF\14"               * EDA7B
                #       82                       * EDA91  130
                #       6                        * EDA9B  6
                $       "\15\16\174\0C\0C"       * EDAA5
              }                                  * EDABB
              ROMPTR  0E2 02A                    * EDAC0
            }                                    * EDACB
            {                                    * EDAD0
              {                                  * EDAD5
                BINT3                            * EDADA
                BINT2                            * EDADF
                {                                * EDAE4
                  $       "I=Imax*\05ω*t+Ø)"     * EDAE9
                  $       "ω=\08π*f"             * EDB0F
                }                                * EDB25
                {                                * EDB2A
                  CHR_D                          * EDB2F
                  $       "ω=\01\07π\09f"        * EDB34
                }                                * EDB4C
              }                                  * EDB51
              {                                  * EDB56
                $       "/.:GH\04"               * EDB5B
                #       88                       * EDB71  136
                #       6                        * EDB7B  6
                $       "\15\16\174\0D\0D"       * EDB85
              }                                  * EDB9B
              ROMPTR  0E2 02A                    * EDBA0
            }                                    * EDBAB
          }                                      * EDBB0
        }                                        * EDBB5
