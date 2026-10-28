* HP 48GX ROM revision R, #EDBBA-#F0DBF: Library part 0E2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #EDBBA in the original ROM).
        RPL

* ROMPTR 0E2 018
* refs (1): E3857
ROMP_0E2_018:
        { ROMPTR 0E2 006 # 4                     * EDBBA
          {                                      * EDBD4
            {                                    * EDBD9
              { BINT1 $ "P=P0+ρ*g*h" $ "P=P0+ρ*\01g\09h" } * EDBDE
              { $ "I\0AB\1E" # 5 # 4 $ "\03\03\023" } ROMPTR 0E2 03B } * EDC2B
            {                                    * EDC7D
              { BINT3 BINT10                     * EDC82
                { $ "ΔP/ρ+(v2\0C-v1\0C)/2+\0Ag*Δy=0" * EDC91
                  $ "ΔP/ρ+v2\0C\101-(A2/\0AA1)\0C)/2+g*Δy=0" * EDCD0
                  $ "ΔP/ρ+v1\0C\10(A1/A2)\0C-\0A1)/2+g*Δy=0" $ "ΔP=P\0BP1" * EDD16
                  $ "Δy=y\0By1" $ "M=ρ*Q" $ "Q=A\08v2" $ "Q=A1*v1" * EDD74
                  $ "A1\0Eπ*D1\0C)/4" $ "A2\0Eπ*D2\0C)/4" } * EDDCE
                { $ "ΔP/ρ+(v2\0C-v1\0C)/2+\01g\09Δy=0" * EDE13
                  $ "ΔP/ρ+v2\0C\101-(A2/A1)\0C)/2+\01g\09Δy=0" * EDE52
                  $ "ΔP/ρ+v1\0C\10(A1/A2)\0C-1)/2+\01g\09Δy=0" CHR_D CHR_D * EDE98
                  CHR_D CHR_D CHR_D CHR_D CHR_D } * EDEE8
              }                                  * EDF06
              { $ "VUTSRQPONMLK\1EJ\10" # 9 # F  * EDF0B
                $ "\03\03\03\02\02\02\09\09\11\11\18\183?@" } * EDF4C
              ROMPTR 0E2 03C }                   * EDF79
            {                                    * EDF89
              { BINT3 BINT10                     * EDF8E
                { $ "M\10ΔP/ρ+(v2\0C-v1\0C)/\0A2+g*Δy+hL)=W" * EDF9D
                  $ "M\10ΔP/ρ+v2\0C\101-(A2/\0AA1)\0C)/2+g*Δy+hL)=W" * EDFE8
                  $ "M\10ΔP/ρ+v1\0C\10(A1/A2)\0A\0C-1)/2+g*Δy+hL)=W" * EE03A
                  $ "ΔP=P\0BP1" $ "Δy=y\0By1" $ "M=ρ*Q" $ "Q=A\08v2" * EE08C
                  $ "Q=A1*v1" $ "A1\0Eπ*D1\0C)/4" $ "A2\0Eπ*D2\0C)/4" } * EE0E6
                { $ "M\10ΔP/ρ+(v2\0C-v1\0C)/2+\01g\09Δy+hL)=W" * EE143
                  $ "M\10ΔP/ρ+v2\0C\101-(A2/A1)\0C)/2+\01g\09Δy+hL)=W" * EE18E
                  $ "M\10ΔP/ρ+v1\0C\10(A1/A2)\0C-1)/2+\01g\09Δy+hL)=W" CHR_D * EE1E0
                  CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D } * EE237
              }                                  * EE25A
              { $ "VUTSRQPONMLK\1EJ\10XW" # 18 # 11 * EE25F
                $ "\03\03\03\02\02\02\09\09\11\11\18\183?@A<" } * EE2A4
              ROMPTR 0E2 03D }                   * EE2D5
            {                                    * EE2E5
              { BINT3 BINT8                      * EE2EA
                {                                * EE2F9
                  $ "ρ\10π*D\0C/4\09vavg*\0A(ΔP/ρ+g*Δy+vavg\0C*\0A(\08f\10L/D)+ΣK/2\0F=W" * EE2FE
                  $ "ΔP=P\0BP1" $ "Δy=y\0By1" $ "M=ρ*Q" $ "Q=A*vavg" * EE36A
                  $ "A\0Eπ*D\0C)/4" $ "Re=D*vavg*ρ/µ" $ "n=µ/ρ" } * EE3C8
                {                                * EE421
                  $ "ρ\10π*D\0C/4\09vavg\10ΔP/ρ+\01g\09Δy+vavg\0C\10\08FANNING(ε/D;D*vavg*ρ/µ\09(L/D)+ΣK/2\0F=W" * EE426
                  CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D } * EE4B8
              }                                  * EE4E0
              { $ "VUTSRQ]\03\\\08\0C[\1EZCJ\10WY" # 29 # 13 * EE4E5
                $ "\03\03\03\02\02\02\09\11\18\02\18\013=>?@<\01" } * EE52E
              ROMPTR 0E2 03E }                   * EE563
          }                                      * EE573
        }                                        * EE578

* ROMPTR 0E2 019
* refs (1): E3857
ROMP_0E2_019:
        { ROMPTR 0E2 007 # 8                     * EE57D
          {                                      * EE597
            {                                    * EE59C
              { BINT2 BINT8                      * EE5A1
                { $ "F=m*a" $ "Ki=1/\08m*vi\0C" $ "Kf=1/\08m*vf\0C" * EE5B0
                  $ "W=F*x" $ "W=Kf-Ki" $ "P=F*v" $ "Pavg=W/t" $ "vf=vi+a*t" } * EE609
              }                                  * EE684
              { $ "d\11cba\0E:\15`_îîW\0A^" # 9 # D * EE689
                $ "\08%\09\09\09\02\17\0BBBB<<" } * EE6CA
              ROMPTR 0E2 02A }                   * EE6F3
            {                                    * EE703
              { BINT3 BINT12                     * EE708
                { $ "τ=I*α" $ "Ki=1/\08I*ωi\0C" $ "Kf=1/\08I*ωf\0C" * EE717
                  $ "W=τ*θ" $ "W=Kf-Ki" $ "P=τ*ω" $ "Pavg=W/t" $ "ωf=ωi+α*t" * EE770
                  $ "at=α*r" $ "ω=\08π*N" $ "ωi=\08π*Ni" $ "ωf=\08π*Nf" } * EE7E6
                { $ "τ=I*α/\01\06)" $ "Ki=1/\08I*ωi\0C/\01\06)\0C" * EE84B
                  $ "Kf=1/\08I*ωf\0C/\01\06)\0C" $ "W=τ*θ/\01\06)" CHR_D * EE896
                  $ "P=τ*ω/\01\06)" CHR_D CHR_D $ "at=α*r/\01\06)" * EE8E1
                  $ "ω=\01\07π\09N" $ "ωi=\01\07π\09Ni" $ "ωf=\01\07π\09Nf" } * EE925
              }                                  * EE97A
              { $ "\04k/ji\12:h`_îîW\0A^îîîg\06Efe" # 16 # 12 * EE97F
                $ "$&''')5\"BBB<<%\18EEE" }      * EE9D0
              ROMPTR 0E2 02A }                   * EEA03
            {                                    * EEA13
              { BINT3 BINT4                      * EEA18
                { $ "F=m*ω\0C*r" $ "ω=v/r" $ "ar=v\0C/r" $ "ω=\08π*N" } * EEA27
                { $ "F=m*ω\0C*r/\01\06)\0C" $ "ω=\01\06\09v/r" CHR_D * EEA8D
                  $ "ω=\01\07π\09N" }            * EEAD5
              }                                  * EEAF2
              { $ "d\06cl/\15E" # 28 # 7 $ "\08\18\09%'\0BE" } * EEAF7
              ROMPTR 0E2 02A }                   * EEB45
            {                                    * EEB55
              { BINT2 BINT2                      * EEB5A
                { $ "F=-k*x" $ "W=-1/\08k*x\0C" } } * EEB69
              { $ "m\0E\15W" # 2F # 4 $ "-\18\0BB" } ROMPTR 0E2 03F } * EEBAC
            {                                    * EEBFE
              { BINT2 BINT2                      * EEC03
                { $ "v1f\0Em1-m2)\0Dm1+m2\09\0Av1i" * EEC12
                  $ "v2f\0E\08m1)\0Dm1+m2\09\0Av1i" } * EEC4B
              }                                  * EEC80
              { $ "rqpon" # 33 # 5 $ "\08\08\09\09\09" } ROMPTR 0E2 040 } * EEC85
            {                                    * EECDB
              { BINT0 $ "F=Cd\10(ρ*v\0C)/2\09A" } * EECE0
              { $ "s\1E\03c\15" # 38 # 5 $ "\013\11\09\0B" } ROMPTR 0E2 02A } * EED17
            {                                    * EED6D
              { BINT1 $ "F=G\10(m1*m2)/r\0C)" $ "F=\01G\09((m1*m2)/r\0C)" } * EED72
              { $ "rq\06\15" # 3D # 4 $ "\08\08C\0B" } ROMPTR 0E2 02A } * EEDD5
            {                                    * EEE27
              { BINT1 $ "E=m*c\0C" $ "E=m*\01c)\0C" } * EEE2C
              { $ "d\05" # 41 # 2 $ "\08B" } ROMPTR 0E2 02A } * EEE6B
          }                                      * EEEB5
        }                                        * EEEBA

* ROMPTR 0E2 01A
* refs (1): E3857
ROMP_0E2_01A:
        { ROMPTR 0E2 008 # 8                     * EEEBF
          {                                      * EEED9
            {                                    * EEEDE
              { BINT3 BINT2                      * EEEE3
                { $ "P*V=n*R*T" $ "m=n*MW" }     * EEEF2
                { $ "P*V=n*\01R\09\02T)" CHR_D } } * EEF2E
              { $ "\0A\14uCdt" # 9 # 6 $ "\03(\1C\1B\08!" } ROMPTR 0E2 02A } * EEF64
            {                                    * EEFBE
              { BINT1 $ "(Pf*Vf)/Tf\0EPi*Vi)/Ti\0A" * EEFC3
                $ "(Pf*Vf)/\02Tf)\0EPi*Vi)/\02Ti)" } * EF001
              { $ "yx32wv" # F # 6 $ "\03\03((\1C\1C" } ROMPTR 0E2 02A } * EF040
            {                                    * EF09A
              { BINT3 BINT2                      * EF09F
                { $ "W=n*R*T*LN(Vf/Vi)" $ "m=n*MW" } * EF0AE
                { $ "W=n*\01R\09\02T\09LN(\02Vf/Vi\0F" CHR_D } } * EF0FA
              { $ "32uCWîdt" # 15 # 7 $ "((\1C\1BB\08!" } ROMPTR 0E2 02A } * EF140
            {                                    * EF1A0
              { BINT3 BINT2                      * EF1A5
                { $ "Pf/Pi\0EVf/Vi)^-n" $ "Tf/Ti\0EPf/Pi)^\0A((n-1)/n)" } * EF1B4
                { $ "Pf/Pi\0E\02Vf/Vi\0F^-n"     * EF21E
                  $ "\02Tf)/\02Ti)\0E\02Pf/Pi\0F^((n-1)/n)" } * EF24D
              }                                  * EF292
              { $ "yx32wvC" # 1C # 7 $ "\03\03((\1C\1C\01" } ROMPTR 0E2 02A } * EF297
            {                                    * EF2F5
              { BINT3 BINT4                      * EF2FA
                { $ "T/T0=2\0D2+(k-1\09M\0C)"    * EF309
                  $ "P/P0\0ET/T0)^(k\0Dk-1\0F\0A" * EF33A
                  $ "ρ/ρ0\0ET/T0)^(1\0Dk-1)\0A)" * EF36A
                  $ "A/At\0E1/M\09(2\0Dk+1\09\0A(1+(k-1)/\08M\0C\0F\0A^((k+1)\0D\08(k-1\0F)" } * EF39C
                { $ "\02T)/\02T0)=2\0D2+(k-1\09M\0C)" * EF407
                  $ "P/P0\0E\02T)/\02T0\0F^(k\0Dk-1\0F" * EF440
                  $ "ρ/ρ0\0E\02T)/\02T0\0F^(1\0Dk-1\0F" * EF474
                  $ "A/At\0E1/M\09\022\0Dk+1\09(1+(k-1)/\08M\0C\0F^((k+1)\0D\08(k-1\0F)" } * EF4A8
              }                                  * EF50F
              { $ "m\10I\0A|\1E{uz\03" # 23 # A  * EF514
                $ "\01\01\03\0333\1C\1C\11\11" } * EF54B
              ROMPTR 0E2 041 }                   * EF56E
            {                                    * EF57E
              { BINT3 BINT2                      * EF583
                { $ "P*V=n*Z*R*T" $ "m=n*MW" }   * EF592
                { $ "P*V=n*ZFACTOR(\02T)/\02Tc);P/Pc\09\01R\09\02T)" CHR_D } } * EF5D2
              { $ "~\0A\14}uCdt" # 2D # 8 $ "\03\03(\1D\1C\1B\08!" } * EF634
              ROMPTR 0E2 02A }                   * EF686
            {                                    * EF696
              { BINT1 $ "(Pf*Vf)\0DZf*Tf)=\0A(Pi*Vi)\0DZi*Ti)" * EF69B
                $ "(Pf*Vf)\0DZFACTOR(\02Tf)/\02Tc);Pf/Pc\09\02Tf\0F\0EPi*Vi)\0DZFACTOR(\02Ti)/\02Tc);Pi/Pc\09\02Ti\0F" } * EF6EB
              { $ "~yx32î}wv" # 35 # 8 $ "\03\03\03((\1D\1C\1C" } * EF78A
              ROMPTR 0E2 02A }                   * EF7DE
            {                                    * EF7EE
              { BINT3 BINT4                      * EF7F3
                { $ "P\0En*MW*vrms\0C)\0D3*V)\0A" $ "vrms=√((3*R*T)/MW)" * EF802
                  $ "λ=1\0D√(2\09π\10(n*NA)/\0AV\09d\0C)" $ "m=n*MW" } * EF865
                { CHR_D $ "vrms=√(\02(3*\01R\09\02T\0F/MW\0F" * EF8B8
                  $ "λ=1\0D√(2\09π\10(n*\01NA\0F/V\09d\0C)" CHR_D } * EF8F6
              }                                  * EF938
              { $ "\0A\14uCt∡?\7Fd" # 3D # 9 $ "\03(\1C\1B!\09  \08" } * EF93D
              ROMPTR 0E2 02A }                   * EF993
          }                                      * EF9A3
        }                                        * EF9A8

* ROMPTR 0E2 01B
* refs (1): E3857
ROMP_0E2_01B:
        { ROMPTR 0E2 009 # 6                     * EF9AD
          {                                      * EF9C7
            {                                    * EF9CC
              { BINT3 BINT2                      * EF9D1
                { $ "Q=m*c*ΔT" $ "Q=m*c\10Tf-Ti)" } * EF9E0
                { CHR_D $ "Q=m*c*TDELTA(Tf;Ti)" } } * EFA26
              { $ "āwvd\0BJ" # 7 # 6 $ "\1C\1C\1C\086\1E" } ROMPTR 0E2 02A } * EFA6A
            {                                    * EFAC4
              { BINT3 BINT2                      * EFAC9
                { $ "δ=α*L*ΔT" $ "δ=α*L\10Tf-Ti)" } * EFAD8
                { CHR_D $ "δ=α*L*TDELTA(Tf;Ti)" } } * EFB1E
              { $ "āwv\08k∇" # D # 6 $ "\1C\1C\1C\02:\18" } ROMPTR 0E2 042 } * EFB62
            {                                    * EFBBC
              { BINT3 BINT2                      * EFBC1
                { $ "q=k*A/L*ΔT" $ "q=k*A/L\10Th-Tc)" } * EFBD0
                { CHR_D $ "q=k*A/L*TDELTA(Th;Tc)" } } * EFC1E
              { $ "ā√}\03\08m6" # 13 # 7 $ "\1C\1C\1C/\1897" } * EFC66
              ROMPTR 0E2 043 }                   * EFCB4
            {                                    * EFCC4
              { BINT3 BINT2                      * EFCC9
                { $ "q=h*A*ΔT" $ "q=h*A\10Th-Tc)" } * EFCD8
                { CHR_D $ "q=h*A*TDELTA(Th;Tc)" } } * EFD1E
              { $ "ā√}\03B6" # 1A # 6 $ "\1C\1C\1C/87" } ROMPTR 0E2 044 } * EFD62
            {                                    * EFDBC
              { BINT3 BINT4                      * EFDC1
                { $ "q=A*ΔT\0D1/h1+L1/k1+\0AL2/k2+L3/k3+1/h3)" * EFDD0
                  $ "U=q\0DA*ΔT)"                * EFE27
                  $ "q=A\10Th-Tc)\0D1/h1+\0AL1/k1+L2/k2+L3/k3+\0A1/h3)" * EFE43
                  $ "U=q\0DA\10Th-Tc\0F" }       * EFE9F
                { CHR_D CHR_D                    * EFEC6
                  $ "q=A*TDELTA(Th;Tc)\0D1/h1+L1/k1+L2/k2+L3/k3+1/h3)" * EFED5
                  $ "U=q\0DA*TDELTA(Th;Tc\0F" }  * EFF3B
              }                                  * EFF70
              { $ "ā√}\03≥≤('∂π▶Σ∫6" # 20 # E $ "\1C\1C\1C/88\18\18\1899987" } * EFF75
              ROMPTR 0E2 045 }                   * EFFDF
            {                                    * EFFEF
              { BINT3 BINT5                      * EFFF4
                { $ "eb=σ*T^4" $ "f=F0λ(λ2;T)-F0λ(λ1;T)\0A" $ "eb12=f*eb" * F0003
                  $ "λmax*T=c3" $ "q=eb*A" }     * F0074
                { $ "eb=\01σ\09\02T)^4" $ "f=ABS(F0λ(λ2;T)-F0λ(λ1;T\0F" * F00AB
                  CHR_D $ "λmax*\02T)=\01c3)" CHR_D } * F010C
              }                                  * F013F
              { $ "u↓←→.α≠\036" # 2E # 9 $ "\1C;++\01;+/7" } ROMPTR 0E2 046 } * F0144
          }                                      * F01AA
        }                                        * F01AF

* ROMPTR 0E2 01C
* refs (1): E3857
ROMP_0E2_01C:
        { ROMPTR 0E2 00A # 4                     * F01B4
          {                                      * F01CE
            {                                    * F01D3
              { BINT1 $ "B\0Eµ0*µr*I)\0D\08π*r)" * F01D8
                $ "B=\03r<rw;(\01µ0\09µr*I*r)\0D\08π*rw\0C);(\01µ0\09µr*I)\0D\08π*r\0F" } * F020C
              { $ "D\06γ\04↑" # 5 # 5 $ "\01\18\18\0D*" } ROMPTR 0E2 047 } * F0275
            {                                    * F02CB
              { BINT1 $ "Fba\0Eµ0*µr*L*Ib*Ia)/\0A(\08π*d)" * F02D0
                $ "Fba\0E\01µ0\09µr*L*Ib*Ia)\0D\08π*d)" } * F0318
              { $ "D\08?ηεδ" # A # 6 $ "\01\18\18\0D\0D\0B" } ROMPTR 0E2 048 } * F0359
            {                                    * F03B3
              { BINT1 $ "B=µ0*µr*I*n" $ "B=\01µ0\09µr*I*n" } * F03B8
              { $ "DC\04↑" # 10 # 4 $ "\01\19\0D*" } ROMPTR 0E2 049 } * F0409
            {                                    * F045B
              { BINT1 $ "B\0Eµ0*µr*I*N)\0D\08π\09\0A(2\0Dro+ri\0F" * F0460
                $ "B\0E\01µ0\09µr*I*N)\0D\08π\09(2\0Dro+ri\0F" } * F04A8
              { $ "DEA@\04↑" # 14 # 6 $ "\01\01\18\18\0D*" } ROMPTR 0E2 04A } * F04EB
          }                                      * F0545
        }                                        * F054A

* ROMPTR 0E2 01D
* refs (1): E3857
ROMP_0E2_01D:
        { ROMPTR 0E2 00B # 7                     * F054F
          {                                      * F0569
            {                                    * F056E
              { BINT2 BINT4                      * F0573
                { $ "x=x0+v0*t+1/\08a*t\0C" $ "x=x0+v*t-1/\08a*t\0C" * F0582
                  $ "x=x0+1/\08(v0+v\09t" $ "v=v0+a*t" } * F05DD
              }                                  * F0624
              { $ "λ\0Eθc\11:" # 8 # 6 $ "\02\02\09\09%\17" } ROMPTR 0E2 02A } * F0629
            {                                    * F0683
              { BINT3 BINT4                      * F0688
                { $ "y=y0+v0*t-1/\08g*t\0C" $ "y=y0+v*t+1/\08g*t\0C" * F0697
                  $ "v\0C=v0\0C-\08g\10y-y0)" $ "v=v0-g*t" } * F06F2
                { $ "y=y0+v0*t-1/\08\01g\09t\0C" * F0739
                  $ "y=y0+v*t+1/\08\01g\09t\0C"  * F076C
                  $ "v\0C=v0\0C-\08\01g\09(y-y0)" $ "v=v0-\01g\09t" } * F0798
              }                                  * F07E5
              { $ "ρ\0Dθc:" # E # 5 $ "\02\02\09\09\17" } ROMPTR 0E2 02A } * F07EA
            {                                    * F0840
              { BINT3 BINT5                      * F0845
                { $ "x=x0+v0*\04θ0\09t" $ "y=y0+v0*\05θ0\09t-\0A1/\08g*t\0C" * F0854
                  $ "vx=v0*\04θ0)" $ "vy=v0*\05θ0)-g*t" * F08B3
                  $ "R=v0\0C/g*\05\08θ0)" }      * F08F7
                { CHR_D $ "y=y0+v0*\05θ0\09t-1/\08\01g\09t\0C" CHR_D * F0920
                  $ "vy=v0*\05θ0)-\01g\09t" $ "R=v0\0C/\01g\09\05\08θ0)" } * F0965
              }                                  * F09B8
              { $ "λ\0Eρ\0Dωîθτσ:\19" # 13 # A   * F09BD
                $ "\02\02\02\024\09\09\09\17\02" } * F09F6
              ROMPTR 0E2 04B }                   * F0A19
            {                                    * F0A29
              { BINT2 BINT4                      * F0A2E
                { $ "θ=θ0+ω0*t+1/\08α*t\0C" $ "θ=θ0+ω*t-1/\08α*t\0C" * F0A3D
                  $ "θ=θ0+1/\08(ω0+ω\09t" $ "ω=ω0+α*t" } * F0A98
              }                                  * F0ADF
              { $ "ω\12>/k:" # 1D # 6 $ "))''&5" } ROMPTR 0E2 02A } * F0AE4
            {                                    * F0B3E
              { BINT3 BINT3                      * F0B43
                { $ "ω=v/r" $ "ar=v\0C/r" $ "ω=\08π*N" } * F0B52
                { $ "ω=\01\06\09v/r" CHR_D $ "ω=\01\07π\09N" } } * F0B9E
              { $ "\06cl/E" # 23 # 5 $ "\18\09%'E" } ROMPTR 0E2 02A } * F0BE4
            {                                    * F0C3A
              { BINT1 $ "v=√((\08m*g)\0DCd*ρ*A\0F\0A" * F0C3F
                $ "v=√(\02(\08m*\01g\0F\0DCd*ρ*A\0F)" } * F0C79
              { $ "s\1E\03dc" # 28 # 5 $ "\013\11\08\09" } ROMPTR 0E2 02A } * F0CB2
            {                                    * F0D08
              { BINT1 $ "v=√((\08G*M)/R)" $ "v=√(\02(\08\01G\09M)/R\0F" } * F0D0D
              { $ "\10\19c" # 2D # 3 $ "\08C\09" } ROMPTR 0E2 02A } * F0D68
          }                                      * F0DB6
        }                                        * F0DBB
