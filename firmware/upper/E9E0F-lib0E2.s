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
                { EQ$ "Pcr=π^2*E*A/(K*L/r)^2\0A" EQ$ "Pcr=π^2*E*I/(K*L)^2" * EBB38
                  EQ$ "σcr=Pcr/A" EQ$ "r=√(I/A)" } * EBB97
                { CHR_D CHR_D CHR_D EQ$ "r=√(UBASE(I/A))" } } * EBBD2
              { $ "\08\07\06\05\04\03\02\01" # B # 8 * EBC0C  variables L K r E I A Pcr σcr
                $ "\02\01\18\03\04\11\05\03" }   * EBC3F
              ROMPTR 0E2 02D }                   * EBC5E
            {                                    * EBC6E
              { BINT3 BINT2                      * EBC73
                {                                * EBC82
                  EQ$ "σmax=P/A*(1+ε*c/r^2*\0A(1/COS(K*L/(2*r)*√(P/\0A(E*A)))))" * EBC87
                  EQ$ "r=√(I/A)" }               * EBCE5
                {                                * EBD04
                  EQ$ "σmax=P/A*(1+ε*c/r^2*(1/COS(CONST(rad)*K*L/(2*r)*√(UBASE(P/(E*A))))))" * EBD09
                  EQ$ "r=√(UBASE(I/A))" }        * EBD67
              }                                  * EBD88
              { $ "\08\07\06\05\04\03\0C\0B\0A\09" # 13 # A * EBD8D  variables L K r E I A ε c P σmax
                $ "\02\01\18\03\04\11\18\18\05\03" } * EBDC4
              ROMPTR 0E2 02E }                   * EBDE7
            {                                    * EBDF7
              { BINT1                            * EBDFC
                EQ$ "y=P*(L-a)*x/(6*L*E*I)\0A*(x^2+(L-a)^2-L^2)-\0AM*x/(E*I)*(c-x^2/\0A(6*L)-L/3-c^2/(2*L))-\0Aw*x/(24*E*I)*(L^3+\0Ax^2*(x-2*L))" * EBE06
                EQ$ "y=IFTE(x≤a;P*(L-a)*x/(6*L*E*I)*(x^2+(L-a)^2-L^2);P*a*(L-x)/(6*L*E*I)*((L-x)^2+a^2-L^2))+IFTE(x≤c;-M*x/(E*I)*(c-x^2/(6*L)-L/3-c^2/(2*L));-M*x/(E*I)*((c^2+x^2)/(2*x)-x^2/(6*L)-L/3-c^2/(2*L)))-w*x/(24*E*I)*(L^3+x^2*(x-2*L))" } * EBECA
              ROMPTR 0E2 025 ROMPTR 0E2 02C }    * EC031
            {                                    * EC04C
              { BINT1                            * EC051
                EQ$ "θ=P*(L-a)/(6*L*E*I)*\0A(3*x^2+(L-a)^2-L^2)-\0AM/(E*I)*(c-x^2/(2*L)-\0AL/3-c^2/(2*L))-w/\0A(24*E*I)*(L^3+x^2*\0A(4*x-6*L))" * EC05B
                EQ$ "θ=CONST(rad)*(IFTE(x≤a;P*(L-a)/(6*L*E*I)*(3*x^2+(L-a)^2-L^2);-P*a/(6*L*E*I)*(3*(L-x)^2+a^2-L^2))+IFTE(x≤c;-M/(E*I)*(c-x^2/(2*L)-L/3-c^2/(2*L));-M/(E*I)*(x-x^2/(2*L)-L/3-c^2/(2*L)))-w/(24*E*I)*(L^3+x^2*(4*x-6*L)))" } * EC11F
              ROMPTR 0E2 026 ROMPTR 0E2 02C }    * EC26E
            {                                    * EC289
              { BINT1 EQ$ "Mx=P*(L-a)*x/L+M*x/L+\0Aw*x/2*(L-x)" * EC28E
                EQ$ "Mx=IFTE(x≤a;P*(L-a)*x/L;P*a*(L-x)/L)+IFTE(x≤c;M*x/L;-M*(L-x)/L)+w*x/2*(L-x)" } * EC2DE
              ROMPTR 0E2 027 ROMPTR 0E2 02C }    * EC369
            {                                    * EC384
              { BINT1 EQ$ "V=P*(L-a)/L+M/L+w/2*\0A(L-2*x)" * EC389
                EQ$ "V=IFTE(x≤a;P*(L-a)/L;-P*a/L)+M/L+w/2*(L-2*x)" } * EC3CF
              { $ "\08\11\0A\10\0Fî\0E\14" # 39 # 7 * EC428  variables L a P M w - x V
                $ "\02\02\05\06\07\02\05" }      * EC45B
              ROMPTR 0E2 02C }                   * EC478
            {                                    * EC488
              { BINT1                            * EC48D
                EQ$ "y=P*x^2/(6*E*I)*\0A(x-3*a)+M*x^2/(2*E*I)-\0Aw*x^2/(24*E*I)*(6*\0AL^2-4*L*x+x^2)" * EC497
                EQ$ "y=IFTE(x≤a;P*x^2/(6*E*I)*(x-3*a);P*a^2/(6*E*I)*(a-3*x))+IFTE(x≤c;M*x^2/(2*E*I);M*c/(2*E*I)*(2*x-c))-w*x^2/(24*E*I)*(6*L^2-4*L*x+x^2)" } * EC51D
              ROMPTR 0E2 025 ROMPTR 0E2 02B }    * EC5FC
            {                                    * EC617
              { BINT1                            * EC61C
                EQ$ "θ=P*x/(2*E*I)*(x-2*a)\0A+M*x/(E*I)-w*x/(6*E*\0AI)*(3*L^2-3*L*x+x^2)" * EC626
                EQ$ "θ=CONST(rad)*(IFTE(x≤a;P*x/(2*E*I)*(x-2*a);-P*a^2/(2*E*I))+IFTE(x≤c;M*x/(E*I);M*c/(E*I))-w*x/(6*E*I)*(3*L^2-3*L*x+x^2))" } * EC69C
              ROMPTR 0E2 026 ROMPTR 0E2 02B }    * EC759
            {                                    * EC774
              { BINT1 EQ$ "Mx=P*(x-a)+M-w/2*\0A(L^2-2*L*x+x^2)" * EC779
                EQ$ "Mx=IFTE(x≤a;P*(x-a);0)+IFTE(x≤c;M;0)-w/2*(L^2-2*L*x+x^2)" } * EC7C5
              ROMPTR 0E2 027 ROMPTR 0E2 02B }    * EC82A
            {                                    * EC845
              { BINT1 EQ$ "V=P+w*(L-x)" EQ$ "V=IFTE(x≤a;P;0)+w*(L-x)" } * EC84A
              { $ "\08\11\0A\0F\0E\14" # 40 # 6 $ "\02\02\05\07\02\05" } * EC8A5  variables L a P w x V
              ROMPTR 0E2 02B }                   * EC8EF
          }                                      * EC8FF
        }                                        * EC904

* ROMPTR 0E2 017
* refs (1): E3857
ROMP_0E2_017:
        { ROMPTR 0E2 005 # 17                    * EC909
          {                                      * EC923
            {                                    * EC928
              { BINT1 EQ$ "F=1/(4*π*ε0*εr)*\0A(q1*q2/r^2)" * EC92D
                EQ$ "F=1/(4*π*CONST(ε0)*εr)*(q1*q2/r^2)" } * EC973
              { $ "\18\17\06\16\15" # 18 # 5 $ "\0A\0A\18\01\0B" } * EC9B4  variables q1 q2 r εr F
              ROMPTR 0E2 02A }                   * EC9FA
            {                                    * ECA0A
              { BINT2 BINT4                      * ECA0F
                { EQ$ "V=I*R" EQ$ "P=V*I" EQ$ "P=I^2*R" EQ$ "P=V^2/R" } } * ECA1E
              { $ "\14\04\19\0A" # 1D # 4 $ "\0C\0D\0E\0F" } ROMPTR 0E2 02A } * ECA81  variables V I R P
            {                                    * ECAD3
              { BINT0 EQ$ "V1=V*(R1/(R1+R2))" }  * ECAD8
              { $ "\1C\1B\14\1A" # 21 # 4 $ "\0E\0E\0C\0C" } ROMPTR 0E2 02F } * ECB0D  variables R1 R2 V V1
            {                                    * ECB5F
              { BINT0 EQ$ "I1=I*(R2/(R1+R2))" }  * ECB64
              { $ "\1C\1B\04\1D" # 25 # 4 $ "\0E\0E\0D\0D" } ROMPTR 0E2 030 } * ECB99  variables R1 R2 I I1
            {                                    * ECBEB
              { BINT0 EQ$ "R=ρ*L/A" }            * ECBF0
              { $ "\1E\08\03\19" # 29 # 4 $ "\10\18\11\0E" } ROMPTR 0E2 02A } * ECC17  variables ρ L A R
            {                                    * ECC69
              { BINT2 BINT2                      * ECC6E
                { EQ$ "Rs=R1+R2" EQ$ "1/Rp=1/R1+1/R2" } } * ECC7D
              { $ "\1C\1B \1F" # 2D # 4 $ "\0E\0E\0E\0E" } ROMPTR 0E2 031 } * ECCCC  variables R1 R2 Rs Rp
            {                                    * ECD1E
              { BINT2 BINT2                      * ECD23
                { EQ$ "1/Cs=1/C1+1/C2" EQ$ "Cp=C1+C2" } } * ECD32
              { $ "$#\"!" # 31 # 4 $ "\12\12\12\12" } ROMPTR 0E2 032 } * ECD81  variables C1 C2 Cs Cp
            {                                    * ECDD3
              { BINT2 BINT2                      * ECDD8
                { EQ$ "Ls=L1+L2" EQ$ "1/Lp=1/L1+1/L2" } } * ECDE7
              { $ "('&%" # 35 # 4 $ "\13\13\13\13" } ROMPTR 0E2 033 } * ECE36  variables L1 L2 Ls Lp
            {                                    * ECE88
              { BINT0 EQ$ "E=C*V^2/2" }          * ECE8D
              { $ "\05)\14" # 39 # 3 $ "\14\12\0C" } ROMPTR 0E2 02A } * ECEB6  variables E C V
            {                                    * ECF04
              { BINT0 EQ$ "E=L*I^2/2" }          * ECF09
              { $ "\05\08\04" # 3C # 3 $ "\14\13\0D" } ROMPTR 0E2 02A } * ECF32  variables E L I
            {                                    * ECF80
              { BINT3 BINT5                      * ECF85
                { EQ$ "TAN(Øs)=(XL-XC)/R" EQ$ "TAN(Øp)=(1/XC-1/XL)/\0A(1/R)" * ECF94
                  EQ$ "XC=1/(ω*C)" EQ$ "XL=ω*L" EQ$ "ω=2*π*f" } * ECFFF
                { CHR_D CHR_D EQ$ "XC=CONST(rad)/(ω*C)" * ED04C
                  EQ$ "XL=ω*L/CONST(rad)" EQ$ "ω=CONST(twoπ)*f" } * ED07B
              }                                  * ED0B6
              { $ "/.)\08-,\19+*" # 3F # 9 $ "\15\16\12\13\0E\0E\0E44" } * ED0BB  variables ω f C L XC XL R Øs Øp
              ROMPTR 0E2 034 }                   * ED111
            {                                    * ED121
              { BINT2 BINT3                      * ED126
                { EQ$ "I=C*(ΔV/Δt)" EQ$ "ΔV=Vf-Vi" EQ$ "Δt=tf-ti" } } * ED135
              { $ ")54\04îî3210" # 48 # 8 $ "\12\0C.\0D\0C\0C.." } * ED196  variables C ΔV Δt I - - Vi Vf ti tf
              ROMPTR 0E2 02A }                   * ED1EC
            {                                    * ED1FC
              { BINT0 EQ$ "q=C*V" }              * ED201
              { $ ")\146" # 50 # 3 $ "\12\0C\0A" } ROMPTR 0E2 02A } * ED224  variables C V q
            {                                    * ED272
              { BINT2 BINT3                      * ED277
                { EQ$ "V=-L*(ΔI/Δt)" EQ$ "ΔI=If-Ii" EQ$ "Δt=tf-ti" } } * ED286
              { $ "\0894\14îî8710" # 53 # 8 $ "\13\0D.\0C\0D\0D.." } * ED2E9  variables L ΔI Δt V - - Ii If ti tf
              ROMPTR 0E2 02A }                   * ED33F
            {                                    * ED34F
              { BINT1 EQ$ "V=Vf-(Vf-Vi)*\0Ae^((-t)/(R*C))" * ED354
                EQ$ "V=Vf-(Vf-Vi)*EXP(UBASE((-t)/(R*C)))" } * ED39A
              { $ "32)\19:\14" # 5B # 6 $ "\0C\0C\12\0E.\0C" } * ED3DF  variables Vi Vf C R t V
              ROMPTR 0E2 035 }                   * ED429
            {                                    * ED439
              { BINT1 EQ$ "I=1/R*(Vf-(Vf-Vi)*e^\0A(-t*R/L))" * ED43E
                EQ$ "I=1/R*(Vf-(Vf-Vi)*EXP(UBASE(-t*R/L)))" } * ED488
              { $ "32\08\19:\04" # 61 # 6 $ "\0C\0C\13\0E.\0D" } * ED4D1  variables Vi Vf L R t I
              ROMPTR 0E2 036 }                   * ED51B
            {                                    * ED52B
              { BINT3 BINT4                      * ED530
                { EQ$ "ω0=1/√(L*C)" EQ$ "Qs=1/R*√(L/C)" EQ$ "Qp=R*√(C/L)" * ED53F
                  EQ$ "ω0=2*π*f0" }              * ED5A8
                { EQ$ "ω0=CONST(rad)/√(UBASE(L*C))" * ED5C7
                  EQ$ "Qs=1/R*√(UBASE(L/C))" EQ$ "Qp=R*√(UBASE(C/L))" * ED5F2
                  EQ$ "ω0=CONST(twoπ)*f0" }      * ED63A
              }                                  * ED65B
              { $ "\08)\19>=<;" # 67 # 7 $ "\13\12\0E\15\01\01\16" } * ED660  variables L C R ω0 Qs Qp f0
              ROMPTR 0E2 02A }                   * ED6AE
            {                                    * ED6BE
              { BINT1 EQ$ "C=(ε0*εr*A)/d" EQ$ "C=(CONST(ε0)*εr*A)/d" } * ED6C3
              { $ "\16\03?)" # 6E # 4 $ "\01\11\18\12" } ROMPTR 0E2 037 } * ED718  variables εr A d C
            {                                    * ED76A
              { BINT1 EQ$ "C=2*π*ε0*εr*L/\0ALN(ro/ri)" * ED76F
                EQ$ "C=2*π*CONST(ε0)*εr*L/LN(UBASE(ro/ri))" } * ED7B1
              { $ "\16A@\08)" # 72 # 5 $ "\01\18\18\18\12" } ROMPTR 0E2 038 } * ED7F0  variables εr ri ro L C
            {                                    * ED846
              { BINT1 EQ$ "L=µ0*µr*n^2*A*h" EQ$ "L=CONST(µ0)*µr*n^2*A*h" } * ED84B
              { $ "DC\03B\08" # 77 # 5 $ "\01\19\11\18\13" } ROMPTR 0E2 039 } * ED8A8  variables µr n A h L
            {                                    * ED8FE
              { BINT1 EQ$ "L=(µ0*µr*N^2*h)/(2*π)\0A*LN(ro/ri)" * ED903
                EQ$ "L=(CONST(µ0)*µr*N^2*h)/(2*π)*LN(UBASE(ro/ri))" } * ED94F
              { $ "DEBA@\08" # 7C # 6 $ "\01\01\18\18\18\13" } * ED996  variables µr N h ri ro L
              ROMPTR 0E2 03A }                   * ED9E0
            {                                    * ED9F0
              { BINT3 BINT2                      * ED9F5
                { EQ$ "V=Vmax*SIN(ω*t+Ø)" EQ$ "ω=2*π*f" } * EDA04
                { CHR_D EQ$ "ω=CONST(twoπ)*f" } } * EDA4A
              { $ "/.:GF\14" # 82 # 6 $ "\15\16\174\0C\0C" } ROMPTR 0E2 02A } * EDA76  variables ω f t Ø Vmax V
            {                                    * EDAD0
              { BINT3 BINT2                      * EDAD5
                { EQ$ "I=Imax*SIN(ω*t+Ø)" EQ$ "ω=2*π*f" } * EDAE4
                { CHR_D EQ$ "ω=CONST(twoπ)*f" } } * EDB2A
              { $ "/.:GH\04" # 88 # 6 $ "\15\16\174\0D\0D" } ROMPTR 0E2 02A } * EDB56  variables ω f t Ø Imax I
          }                                      * EDBB0
        }                                        * EDBB5
