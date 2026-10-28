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
        { CHR_D                                  * EA13B
          UNIT %0_2A2B4 $ "ft" umEND ;           * EA145
          UNIT %0_2A2B4 $ "psi" umEND ;          * EA167
          UNIT %0_2A2B4 $ "in" %4 um^ umEND ;    * EA18B
          UNIT %0_2A2B4 $ "lbf" umEND ;          * EA1B7
          UNIT %0_2A2B4 $ "ft"                   * EA1DB
L_EA1F3:
            $ "lbf" um* umEND ;                  * EA1F3
          UNIT %0_2A2B4 $ "lbf" $ "ft" um/ umEND ; * EA212
          UNIT %0_2A2B4 $ "lb" umEND ;           * EA249
          UNIT %0_2A2B4 $ "ft" tok_s um/ umEND ; CHR_D * EA26B
          UNIT %0_2A2B4 $ "lbf" umEND ; CHR_D CHR_D CHR_D CHR_D * EA29C
          UNIT %0_2A2B4 $ "Ω" $ "in" um* umEND ; * EA2D4
          UNIT %0_2A2B4 $ "in" %2 um^ umEND ; CHR_D CHR_D CHR_D * EA307
          UNIT %0_2A2B4 $ "r" tok_s um/ umEND ; CHR_D CHR_D * EA342
          UNIT %0_2A2B4 $ "in" umEND ;           * EA376
          UNIT %0_2A2B4 tok1 $ "in" um/ umEND ;  * EA398
          UNIT %0_2A2B4 $ "ft" %3 um^ umEND ;    * EA3C4
          UNIT %0_2A2B4 $ "lbmol" umEND ;        * EA3F0
          UNIT %0_2A2B4 $ "°F" umEND ;           * EA418
          UNIT %0_2A2B4 $ "°R" umEND ;           * EA43A
          UNIT %0_2A2B4 $ "Btu" umEND ;          * EA45C
          UNIT %0_2A2B4 tok1 $ "l" um/ umEND ;   * EA480
          UNIT %0_2A2B4 $ "Å" umEND ;            * EA4AA
          UNIT %0_2A2B4 $ "lb" $ "lbmol" um/ umEND ; * EA4CA
          UNIT %0_2A2B4 $ "ft" $ "lbf" um* umEND ; * EA505
          UNIT %0_2A2B4 $ "in" %3 um^ umEND ;    * EA53C
          UNIT %0_2A2B4 $ "lb" $ "in" %2 um^ um* umEND ; * EA568
          UNIT %0_2A2B4 $ "ft" tok_s %2 um^ um/ umEND ; * EA5A7
          UNIT %0_2A2B4 $ "r"                    * EA5DD
L_EA5F3:
            $ "min" %2 um^ um/ umEND ;           * EA5F3
          UNIT %0_2A2B4 $ "r" $ "min" um/ umEND ; * EA61C
          UNIT %0_2A2B4 $ "ft" %3 um^ umEND ;    * EA651
          UNIT %0_2A2B4 $ "°" umEND ; CHR_D      * EA67D
          UNIT %0_2A2B4 $ "µ" umEND ;            * EA6A2
          UNIT %0_2A2B4 $ "lb" tok_s um/ umEND ; * EA6C2
          UNIT %0_2A2B4 $ "lbf" $ "in" um/ umEND ; CHR_D * EA6EE
          UNIT %0_2A2B4 $ "ft" %2 um^ umEND ;    * EA72A
          UNIT %0_2A2B4 $ "r" $ "in" um/ umEND ; CHR_D CHR_D * EA756
          UNIT %0_2A2B4 $ "lb" $ "ft" %3 um^ um/ umEND ; * EA793
          UNIT %0_2A2B4 $ "°" umEND ;            * EA7D2
          UNIT %0_2A2B4 $ "min" umEND ;          * EA7F2
          UNIT %0_2A2B4 $ "Btu" $ "lb" $ "°F" um* um/ umEND ; * EA816
          UNIT %0_2A2B4 $ "Btu" $ "h" um/ umEND ; * EA860
          UNIT %0_2A2B4 $ "Btu" $ "h" $ "ft" %2 um^ um* $ "°F" um* um/ umEND ; * EA895
          UNIT %0_2A2B4 $ "Btu" $ "h" $ "ft" um* $ "°F" um* um/ umEND ; * EA8FA
          UNIT %0_2A2B4 tok1 $ "°F" um/ umEND ;  * EA955
          UNIT %0_2A2B4 $ "Btu" $ "h" $ "ft" %2 um^ um* um/ umEND ; * EA981
          UNIT %0_2A2B4 $ "hp" umEND ;           * EA9D3
          UNIT                                   * EA9F5
L_EA9FA:
            %0_2A2B4 $ "lbf" tok_s um* $ "ft" %2 um^ um/ umEND ; * EA9FA
          UNIT %0_2A2B4 $ "ft" %2 um^ tok_s um/ umEND ; * EAA40
          UNIT %0_2A2B4 $ "ft" %3 um^ $ "min" um/ umEND ; * EAA76
          UNIT %0_2A2B4 $ "lb" $ "min" um/ umEND ; * EAAB7
          UNIT %0_2A2B4 $ "ft" %2 um^ tok_s %2 um^ um/ umEND ; * EAAEE
          UNIT %0_2A2B4 $ "ft" $ "lbf" um* umEND ; * EAB2E
          UNIT %0_2A2B4 $ "mi" umEND ; CHR_D     * EAB65
          UNIT %0_2A2B4 $ "rpm" umEND ; CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D * EAB8C
          CHR_D                                  * EABCE
          UNIT %0_2A2B4 $ "in" tok_s um/ umEND ; CHR_D CHR_D CHR_D CHR_D * EABD3
          CHR_D CHR_D CHR_D CHR_D }              * EAC13

* ROMPTR 0E2 014
* refs (1): E3857
ROMP_0E2_014:
        { %1                                     * EAC2C
          UNIT %0_2A2B4 tok_m umEND ;            * EAC36
          UNIT %0_2A2B4 CHR_k $ "Pa" umP umEND ; * EAC4F
          UNIT %0_2A2B4 CHR_m tok_m umP %4 um^ umEND ; * EAC7B
          UNIT %0_2A2B4 CHR_k $ "N" umP umEND ;  * EACA8
          UNIT %0_2A2B4 CHR_k $ "N" umP tok_m um* umEND ; * EACD2
          UNIT %0_2A2B4 CHR_k $ "N" umP tok_m um/ umEND ; * EAD06
          UNIT %0_2A2B4 CHR_k tok_g umP umEND ;  * EAD3A
          UNIT %0_2A2B4 tok_m tok_s um/ umEND ;  * EAD5D
          UNIT %0_2A2B4 $ "C" umEND ;            * EAD80
          UNIT %0_2A2B4 $ "N" umEND ;            * EADA0
          UNIT %0_2A2B4 $ "V" umEND ;            * EADC0
          UNIT %0_2A2B4 $ "A" umEND ;            * EADE0
          UNIT %0_2A2B4 $ "Ω" umEND ;            * EAE00
          UNIT %0_2A2B4 $ "W" umEND ;            * EAE20
          UNIT %0_2A2B4 $ "Ω" CHR_c tok_m umP um* umEND ; * EAE40
          UNIT %0_2A2B4 CHR_c tok_m umP %2 um^ umEND ; * EAE74
          UNIT %0_2A2B4 CHR "µ" $ "F" umP umEND ; * EAEA1
          UNIT %0_2A2B4 CHR_m $ "H" umP umEND ;  * EAECD
          UNIT %0_2A2B4 $ "J" umEND ;            * EAEF7
          UNIT %0_2A2B4 $ "r" tok_s um/ umEND ;  * EAF17
          UNIT %0_2A2B4 $ "Hz" umEND ;           * EAF41
          UNIT %0_2A2B4 tok_s umEND ;            * EAF63
          UNIT %0_2A2B4 CHR_c tok_m umP umEND ;  * EAF7C
          UNIT %0_2A2B4 tok1 CHR_c tok_m umP um/ umEND ; * EAF9F
          UNIT %0_2A2B4 tok_m %3 um^ umEND ;     * EAFCC
          UNIT %0_2A2B4 $ "gmol" umEND ;         * EAFEF
          UNIT %0_2A2B4 $ "°C" umEND ;           * EB015
          UNIT %0_2A2B4 $ "K" umEND ;            * EB037
          UNIT %0_2A2B4 CHR_k $ "J" umP umEND ;  * EB057
          UNIT %0_2A2B4 tok1 $ "l" um/ umEND ;   * EB081
          UNIT %0_2A2B4 CHR_n tok_m umP umEND ;  * EB0AB
          UNIT %0_2A2B4 tok_g $ "gmol" um/ umEND ; * EB0CE
          UNIT %0_2A2B4 $ "N" tok_m um* umEND ;  * EB0FE
          UNIT %0_2A2B4 CHR_c tok_m umP %3 um^ umEND ; * EB128
          UNIT %0_2A2B4 CHR_k tok_g umP tok_m %2 um^ um* umEND ; * EB155
          UNIT %0_2A2B4 tok_m tok_s %2 um^ um/ umEND ; * EB18C
          UNIT %0_2A2B4 $ "r" tok_s %2 um^ um/ umEND ; * EB1B9
          UNIT %0_2A2B4 $ "r" tok_s um/ umEND ;  * EB1ED
          UNIT %0_2A2B4 $ "l" umEND ;            * EB217
          UNIT %0_2A2B4 $ "r" umEND ;            * EB237
          UNIT %0_2A2B4 $ "T" umEND ;            * EB257
          UNIT %0_2A2B4 CHR_n tok_m umP umEND ;  * EB277
          UNIT %0_2A2B4 CHR_k tok_g umP tok_s um/ umEND ; * EB29A
          UNIT %0_2A2B4 $ "N" tok_m um/ umEND ;  * EB2C7
          UNIT %0_2A2B4 CHR "µ" $ "s" umP umEND ; * EB2F1
          UNIT %0_2A2B4 tok_m %2 um^ umEND ;     * EB31D
          UNIT %0_2A2B4 $ "r" CHR_c tok_m umP um/ umEND ; * EB340
          UNIT %0_2A2B4 $ "W" tok_m %2 um^ um/ umEND ; * EB374
          UNIT %0_2A2B4 $ "dB" umEND ;           * EB3A8
          UNIT %0_2A2B4 CHR_k tok_g umP tok_m %3 um^ um/ umEND ; * EB3CA
          UNIT %0_2A2B4 $ "°" umEND ;            * EB401
          UNIT %0_2A2B4 tok_s umEND ;            * EB421
          UNIT %0_2A2B4 CHR_k $ "J" umP CHR_k tok_g umP $ "K" um* um/ umEND ; * EB43A
          UNIT %0_2A2B4 $ "W" umEND ;            * EB489
          UNIT %0_2A2B4 $ "W" tok_m %2 um^ $ "K" um* um/ umEND ; * EB4A9
          UNIT %0_2A2B4 $ "W" tok_m $ "K" um* um/ umEND ; * EB4EE
          UNIT %0_2A2B4 tok1 $ "°C" um/ umEND ;  * EB529
          UNIT %0_2A2B4 $ "W" tok_m %2 um^ um/ umEND ; * EB555
          UNIT %0_2A2B4 $ "W" umEND ;            * EB589
          UNIT %0_2A2B4 $ "Pa" tok_s um* umEND ; * EB5A9
          UNIT %0_2A2B4 tok_m %2 um^ tok_s um/ umEND ; * EB5D5
          UNIT %0_2A2B4 tok_m %3 um^ tok_s um/ umEND ; * EB602
          UNIT %0_2A2B4 CHR_k $ "g" umP tok_s um/ umEND ; * EB62F
          UNIT %0_2A2B4 tok_m %2 um^ tok_s %2 um^ um/ umEND ; * EB663
          UNIT %0_2A2B4 $ "J" umEND ;            * EB69A
          UNIT %0_2A2B4 CHR_k tok_m umP umEND ;  * EB6BA
          UNIT %0_2A2B4 CHR_c tok_m umP %2 um^ umEND ; * EB6DD
          UNIT %0_2A2B4 $ "Hz" umEND ;           * EB70A
          UNIT %0_2A2B4 $ "°C" umEND ;           * EB72C
          UNIT %0_2A2B4 $ "A" CHR_c tok_m umP %2 um^ um/ umEND ; * EB74E
          UNIT %0_2A2B4 CHR_m $ "A" umP umEND ;  * EB78C
          UNIT %0_2A2B4 CHR_m $ "A" umP $ "V" um/ umEND ; * EB7B6
          UNIT %0_2A2B4 tok1 $ "V" um/ umEND ;   * EB7F1
          UNIT %0_2A2B4 CHR_n $ "A" umP umEND ;  * EB81B
          UNIT %0_2A2B4 $ "S" umEND ;            * EB845
          UNIT %0_2A2B4 CHR_c tok_m umP tok_s um/ umEND ; * EB865
          UNIT %0_2A2B4 $ "Å" umEND ;            * EB892
          UNIT %0_2A2B4 tok1 CHR_c tok_m umP %3 um^ um/ umEND ; * EB8B2
          UNIT %0_2A2B4 CHR "µ" $ "A" umP CHR_c tok_m umP %2 um^ um/ umEND ; * EB8E9
          UNIT %0_2A2B4 $ "µ" umEND ;            * EB933
          UNIT %0_2A2B4 CHR_p $ "F" umP CHR_c tok_m umP %2 um^ um/ umEND ; * EB953
          UNIT %0_2A2B4 $ "V" CHR_c tok_m umP um/ umEND ; * EB99B
          UNIT %0_2A2B4 CHR_c tok_m umP %2 um^ $ "V" tok_s um* um/ umEND ; * EB9CF
          UNIT %0_2A2B4 $ "V" % 5E-1 um^ umEND ; } * EBA17

* ROMPTR 0E2 015
* refs (1): E3857
ROMP_0E2_015:
        { ROMPTR 0E2 016 ROMPTR 0E2 017 ROMPTR 0E2 018 ROMPTR 0E2 019 * EBA56
          ROMPTR 0E2 01A ROMPTR 0E2 01B ROMPTR 0E2 01C ROMPTR 0E2 01D * EBA87
          ROMPTR 0E2 01E ROMPTR 0E2 01F ROMPTR 0E2 020 ROMPTR 0E2 021 * EBAB3
          ROMPTR 0E2 022 ROMPTR 0E2 023 ROMPTR 0E2 024 } * EBADF

* ROMPTR 0E2 016
* refs (1): E3857
ROMP_0E2_016:
        { ROMPTR 0E2 004 # A                     * EBB05
          {                                      * EBB1F
            {                                    * EBB24
              { BINT3 BINT4                      * EBB29
                { $ "Pcr=π\0C*E*A\0DK*L/r)\0C\0A" $ "Pcr=π\0C*E*I\0DK*L)\0C" * EBB38
                  $ "σcr=Pcr/A" $ "r=√(I/A)" }   * EBB97
                { CHR_D CHR_D CHR_D $ "r=√(\02I/A\0F" } } * EBBD2
              { $ "\08\07\06\05\04\03\02\01" # B # 8 * EBC0C
                $ "\02\01\18\03\04\11\05\03" }   * EBC3F
              ROMPTR 0E2 02D }                   * EBC5E
            {                                    * EBC6E
              { BINT3 BINT2                      * EBC73
                {                                * EBC82
                  $ "σmax=P/A\101+ε*c/r\0C*\0A(1/\04K*L\0D\08r\09√(P/\0A(E*A\0F\0F)" * EBC87
                  $ "r=√(I/A)" }                 * EBCE5
                {                                * EBD04
                  $ "σmax=P/A\101+ε*c/r\0C\101/\04\01\06\09K*L\0D\08r\09√(\02P\0DE*A\0F\0F\0F" * EBD09
                  $ "r=√(\02I/A\0F" }            * EBD67
              }                                  * EBD88
              { $ "\08\07\06\05\04\03\0C\0B\0A\09" # 13 # A * EBD8D
                $ "\02\01\18\03\04\11\18\18\05\03" } * EBDC4
              ROMPTR 0E2 02E }                   * EBDE7
            {                                    * EBDF7
              { BINT1                            * EBDFC
                $ "y=P\10L-a\09x\0D6*L*E*I)\0A\10x\0C+(L-a)\0C-L\0C)-\0AM*x\0DE*I\09(c-x\0C/\0A(6*L)-L/3-c\0C\0D\08L\0F-\0Aw*x\0D24*E*I\09(L^3+\0Ax\0C\10x-\08L\0F" * EBE06
                $ "y=\03x≤a;P\10L-a\09x\0D6*L*E*I\09(x\0C+(L-a)\0C-L\0C);P*a\10L-x)\0D6*L*E*I\09((L-x)\0C+a\0C-L\0C\0F+\03x≤c;-M*x\0DE*I\09(c-x\0C\0D6*L)-L/3-c\0C\0D\08L\0F;-M*x\0DE*I\09((c\0C+x\0C)\0D\08x)-x\0C\0D6*L)-L/3-c\0C\0D\08L\0F)-w*x\0D24*E*I\09(L^3+x\0C\10x-\08L\0F" } * EBECA
              ROMPTR 0E2 025 ROMPTR 0E2 02C }    * EC031
            {                                    * EC04C
              { BINT1                            * EC051
                $ "θ=P\10L-a)\0D6*L*E*I\09\0A(3*x\0C+(L-a)\0C-L\0C)-\0AM\0DE*I\09(c-x\0C\0D\08L)-\0AL/3-c\0C\0D\08L\0F-w/\0A(24*E*I\09(L^3+x\0C*\0A(4*x-6*L\0F" * EC05B
                $ "θ=\01\06\09(\03x≤a;P\10L-a)\0D6*L*E*I\09(3*x\0C+(L-a)\0C-L\0C);-P*a\0D6*L*E*I\09(3\10L-x)\0C+a\0C-L\0C\0F+\03x≤c;-M\0DE*I\09(c-x\0C\0D\08L)-L/3-c\0C\0D\08L\0F;-M\0DE*I\09(x-x\0C\0D\08L)-L/3-c\0C\0D\08L\0F)-w\0D24*E*I\09(L^3+x\0C\104*x-6*L\0F)" } * EC11F
              ROMPTR 0E2 026 ROMPTR 0E2 02C }    * EC26E
            {                                    * EC289
              { BINT1 $ "Mx=P\10L-a\09x/L+M*x/L+\0Aw*x/\08(L-x)" * EC28E
                $ "Mx=\03x≤a;P\10L-a\09x/L;P*a\10L-x)/L)+\03x≤c;M*x/L;-M\10L-x)/L)+w*x/\08(L-x)" } * EC2DE
              ROMPTR 0E2 027 ROMPTR 0E2 02C }    * EC369
            {                                    * EC384
              { BINT1 $ "V=P\10L-a)/L+M/L+w/\08\0A(L-\08x)" * EC389
                $ "V=\03x≤a;P\10L-a)/L;-P*a/L)+M/L+w/\08(L-\08x)" } * EC3CF
              { $ "\08\11\0A\10\0Fî\0E\14" # 39 # 7 * EC428
                $ "\02\02\05\06\07\02\05" }      * EC45B
              ROMPTR 0E2 02C }                   * EC478
            {                                    * EC488
              { BINT1                            * EC48D
                $ "y=P*x\0C\0D6*E*I\09\0A(x-3*a)+M*x\0C\0D\08E*I)-\0Aw*x\0C\0D24*E*I\09(6*\0AL\0C-4*L*x+x\0C)" * EC497
                $ "y=\03x≤a;P*x\0C\0D6*E*I\09(x-3*a);P*a\0C\0D6*E*I\09(a-3*x\0F+\03x≤c;M*x\0C\0D\08E*I);M*c\0D\08E*I\09(\08x-c\0F-w*x\0C\0D24*E*I\09(6*L\0C-4*L*x+x\0C)" } * EC51D
              ROMPTR 0E2 025 ROMPTR 0E2 02B }    * EC5FC
            {                                    * EC617
              { BINT1                            * EC61C
                $ "θ=P*x\0D\08E*I\09(x-\08a)\0A+M*x\0DE*I)-w*x\0D6*E*\0AI\09(3*L\0C-3*L*x+x\0C)" * EC626
                $ "θ=\01\06\09(\03x≤a;P*x\0D\08E*I\09(x-\08a);-P*a\0C\0D\08E*I\0F+\03x≤c;M*x\0DE*I);M*c\0DE*I\0F-w*x\0D6*E*I\09(3*L\0C-3*L*x+x\0C\0F" } * EC69C
              ROMPTR 0E2 026 ROMPTR 0E2 02B }    * EC759
            {                                    * EC774
              { BINT1 $ "Mx=P\10x-a)+M-w/\08\0A(L\0C-\08L*x+x\0C)" * EC779
                $ "Mx=\03x≤a;P\10x-a);0)+\03x≤c;M;0)-w/\08(L\0C-\08L*x+x\0C)" } * EC7C5
              ROMPTR 0E2 027 ROMPTR 0E2 02B }    * EC82A
            {                                    * EC845
              { BINT1 $ "V=P+w\10L-x)" $ "V=\03x≤a;P;0)+w\10L-x)" } * EC84A
              { $ "\08\11\0A\0F\0E\14" # 40 # 6 $ "\02\02\05\07\02\05" } * EC8A5
              ROMPTR 0E2 02B }                   * EC8EF
          }                                      * EC8FF
        }                                        * EC904

* ROMPTR 0E2 017
* refs (1): E3857
ROMP_0E2_017:
        { ROMPTR 0E2 005 # 17                    * EC909
          {                                      * EC923
            {                                    * EC928
              { BINT1 $ "F=1\0D4*π*ε0*εr\09\0A(q1*q2/r\0C)" * EC92D
                $ "F=1\0D4*π*\01ε0\09εr\09(q1*q2/r\0C)" } * EC973
              { $ "\18\17\06\16\15" # 18 # 5 $ "\0A\0A\18\01\0B" } * EC9B4
              ROMPTR 0E2 02A }                   * EC9FA
            {                                    * ECA0A
              { BINT2 BINT4                      * ECA0F
                { $ "V=I*R" $ "P=V*I" $ "P=I\0C*R" $ "P=V\0C/R" } } * ECA1E
              { $ "\14\04\19\0A" # 1D # 4 $ "\0C\0D\0E\0F" } ROMPTR 0E2 02A } * ECA81
            {                                    * ECAD3
              { BINT0 $ "V1=V\10R1\0DR1+R2\0F" } * ECAD8
              { $ "\1C\1B\14\1A" # 21 # 4 $ "\0E\0E\0C\0C" } ROMPTR 0E2 02F } * ECB0D
            {                                    * ECB5F
              { BINT0 $ "I1=I\10R2\0DR1+R2\0F" } * ECB64
              { $ "\1C\1B\04\1D" # 25 # 4 $ "\0E\0E\0D\0D" } ROMPTR 0E2 030 } * ECB99
            {                                    * ECBEB
              { BINT0 $ "R=ρ*L/A" }              * ECBF0
              { $ "\1E\08\03\19" # 29 # 4 $ "\10\18\11\0E" } ROMPTR 0E2 02A } * ECC17
            {                                    * ECC69
              { BINT2 BINT2                      * ECC6E
                { $ "Rs=R1+R2" $ "1/Rp=1/R1+1/R2" } } * ECC7D
              { $ "\1C\1B \1F" # 2D # 4 $ "\0E\0E\0E\0E" } ROMPTR 0E2 031 } * ECCCC
            {                                    * ECD1E
              { BINT2 BINT2                      * ECD23
                { $ "1/Cs=1/C1+1/C2" $ "Cp=C1+C2" } } * ECD32
              { $ "$#\"!" # 31 # 4 $ "\12\12\12\12" } ROMPTR 0E2 032 } * ECD81
            {                                    * ECDD3
              { BINT2 BINT2                      * ECDD8
                { $ "Ls=L1+L2" $ "1/Lp=1/L1+1/L2" } } * ECDE7
              { $ "('&%" # 35 # 4 $ "\13\13\13\13" } ROMPTR 0E2 033 } * ECE36
            {                                    * ECE88
              { BINT0 $ "E=C*V\0C/2" }           * ECE8D
              { $ "\05)\14" # 39 # 3 $ "\14\12\0C" } ROMPTR 0E2 02A } * ECEB6
            {                                    * ECF04
              { BINT0 $ "E=L*I\0C/2" }           * ECF09
              { $ "\05\08\04" # 3C # 3 $ "\14\13\0D" } ROMPTR 0E2 02A } * ECF32
            {                                    * ECF80
              { BINT3 BINT5                      * ECF85
                { $ "TAN(Øs)\0EXL-XC)/R" $ "TAN(Øp)\0E1/XC-1/XL)/\0A(1/R)" * ECF94
                  $ "XC=1\0Dω*C)" $ "XL=ω*L" $ "ω=\08π*f" } * ECFFF
                { CHR_D CHR_D $ "XC=\01\06)\0Dω*C)" $ "XL=ω*L/\01\06)" * ED04C
                  $ "ω=\01\07π\09f" }            * ED099
              }                                  * ED0B6
              { $ "/.)\08-,\19+*" # 3F # 9 $ "\15\16\12\13\0E\0E\0E44" } * ED0BB
              ROMPTR 0E2 034 }                   * ED111
            {                                    * ED121
              { BINT2 BINT3                      * ED126
                { $ "I=C\10ΔV/Δt)" $ "ΔV=Vf-Vi" $ "Δt=tf-ti" } } * ED135
              { $ ")54\04îî3210" # 48 # 8 $ "\12\0C.\0D\0C\0C.." } * ED196
              ROMPTR 0E2 02A }                   * ED1EC
            {                                    * ED1FC
              { BINT0 $ "q=C*V" }                * ED201
              { $ ")\146" # 50 # 3 $ "\12\0C\0A" } ROMPTR 0E2 02A } * ED224
            {                                    * ED272
              { BINT2 BINT3                      * ED277
                { $ "V=-L\10ΔI/Δt)" $ "ΔI=If-Ii" $ "Δt=tf-ti" } } * ED286
              { $ "\0894\14îî8710" # 53 # 8 $ "\13\0D.\0C\0D\0D.." } * ED2E9
              ROMPTR 0E2 02A }                   * ED33F
            {                                    * ED34F
              { BINT1 $ "V=Vf-(Vf-Vi\09\0Ae^((-t)\0DR*C\0F" * ED354
                $ "V=Vf-(Vf-Vi\09EXP(\02(-t)\0DR*C\0F)" } * ED39A
              { $ "32)\19:\14" # 5B # 6 $ "\0C\0C\12\0E.\0C" } * ED3DF
              ROMPTR 0E2 035 }                   * ED429
            {                                    * ED439
              { BINT1 $ "I=1/R\10Vf-(Vf-Vi\09e^\0A(-t*R/L\0F" * ED43E
                $ "I=1/R\10Vf-(Vf-Vi\09EXP(\02-t*R/L\0F)" } * ED488
              { $ "32\08\19:\04" # 61 # 6 $ "\0C\0C\13\0E.\0D" } * ED4D1
              ROMPTR 0E2 036 }                   * ED51B
            {                                    * ED52B
              { BINT3 BINT4                      * ED530
                { $ "ω0=1/√(L*C)" $ "Qs=1/R*√(L/C)" $ "Qp=R*√(C/L)" * ED53F
                  $ "ω0=\08π*f0" }               * ED5A8
                { $ "ω0=\01\06)/√(\02L*C\0F" $ "Qs=1/R*√(\02L/C\0F" * ED5C7
                  $ "Qp=R*√(\02C/L\0F" $ "ω0=\01\07π\09f0" } * ED618
              }                                  * ED65B
              { $ "\08)\19>=<;" # 67 # 7 $ "\13\12\0E\15\01\01\16" } * ED660
              ROMPTR 0E2 02A }                   * ED6AE
            {                                    * ED6BE
              { BINT1 $ "C\0Eε0*εr*A)/d" $ "C\0E\01ε0\09εr*A)/d" } * ED6C3
              { $ "\16\03?)" # 6E # 4 $ "\01\11\18\12" } ROMPTR 0E2 037 } * ED718
            {                                    * ED76A
              { BINT1 $ "C=\08π*ε0*εr*L/\0ALN(ro/ri)" * ED76F
                $ "C=\08π*\01ε0\09εr*L/LN(\02ro/ri\0F" } * ED7B1
              { $ "\16A@\08)" # 72 # 5 $ "\01\18\18\18\12" } ROMPTR 0E2 038 } * ED7F0
            {                                    * ED846
              { BINT1 $ "L=µ0*µr*n\0C*A*h" $ "L=\01µ0\09µr*n\0C*A*h" } * ED84B
              { $ "DC\03B\08" # 77 # 5 $ "\01\19\11\18\13" } ROMPTR 0E2 039 } * ED8A8
            {                                    * ED8FE
              { BINT1 $ "L\0Eµ0*µr*N\0C*h)\0D\08π)\0A*LN(ro/ri)" * ED903
                $ "L\0E\01µ0\09µr*N\0C*h)\0D\08π\09LN(\02ro/ri\0F" } * ED94F
              { $ "DEBA@\08" # 7C # 6 $ "\01\01\18\18\18\13" } * ED996
              ROMPTR 0E2 03A }                   * ED9E0
            {                                    * ED9F0
              { BINT3 BINT2                      * ED9F5
                { $ "V=Vmax*\05ω*t+Ø)" $ "ω=\08π*f" } * EDA04
                { CHR_D $ "ω=\01\07π\09f" } }    * EDA4A
              { $ "/.:GF\14" # 82 # 6 $ "\15\16\174\0C\0C" } ROMPTR 0E2 02A } * EDA76
            {                                    * EDAD0
              { BINT3 BINT2                      * EDAD5
                { $ "I=Imax*\05ω*t+Ø)" $ "ω=\08π*f" } * EDAE4
                { CHR_D $ "ω=\01\07π\09f" } }    * EDB2A
              { $ "/.:GH\04" # 88 # 6 $ "\15\16\174\0D\0D" } ROMPTR 0E2 02A } * EDB56
          }                                      * EDBB0
        }                                        * EDBB5
