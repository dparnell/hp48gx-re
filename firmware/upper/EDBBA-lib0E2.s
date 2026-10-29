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
              { BINT1 EQ$ "P=P0+ρ*g*h" EQ$ "P=P0+ρ*CONST(g)*h" } * EDBDE
              { $ "I\0AB\1E" # 5 # 4 $ "\03\03\023" } ROMPTR 0E2 03B } * EDC2B  variables P0 P h ρ
            {                                    * EDC7D
              { BINT3 BINT10                     * EDC82
                { EQ$ "ΔP/ρ+(v2^2-v1^2)/2+\0Ag*Δy=0" * EDC91
                  EQ$ "ΔP/ρ+v2^2*(1-(A2/\0AA1)^2)/2+g*Δy=0" * EDCD0
                  EQ$ "ΔP/ρ+v1^2*((A1/A2)^2-\0A1)/2+g*Δy=0" EQ$ "ΔP=P2-P1" * EDD16
                  EQ$ "Δy=y2-y1" EQ$ "M=ρ*Q" EQ$ "Q=A2*v2" EQ$ "Q=A1*v1" * EDD74
                  EQ$ "A1=(π*D1^2)/4" EQ$ "A2=(π*D2^2)/4" } * EDDCE
                { EQ$ "ΔP/ρ+(v2^2-v1^2)/2+CONST(g)*Δy=0" * EDE13
                  EQ$ "ΔP/ρ+v2^2*(1-(A2/A1)^2)/2+CONST(g)*Δy=0" * EDE52
                  EQ$ "ΔP/ρ+v1^2*((A1/A2)^2-1)/2+CONST(g)*Δy=0" CHR_D CHR_D * EDE98
                  CHR_D CHR_D CHR_D CHR_D CHR_D } * EDEE8
              }                                  * EDF06
              { $ "VUTSRQPONMLK\1EJ\10" # 9 # F  * EDF0B  variables ΔP P1 P2 Δy y1 y2 v1 v2 A1 A2 D1 D2 ρ Q M
                $ "\03\03\03\02\02\02\09\09\11\11\18\183?@" } * EDF4C
              ROMPTR 0E2 03C }                   * EDF79
            {                                    * EDF89
              { BINT3 BINT10                     * EDF8E
                { EQ$ "M*(ΔP/ρ+(v2^2-v1^2)/\0A2+g*Δy+hL)=W" * EDF9D
                  EQ$ "M*(ΔP/ρ+v2^2*(1-(A2/\0AA1)^2)/2+g*Δy+hL)=W" * EDFE8
                  EQ$ "M*(ΔP/ρ+v1^2*((A1/A2)\0A^2-1)/2+g*Δy+hL)=W" * EE03A
                  EQ$ "ΔP=P2-P1" EQ$ "Δy=y2-y1" EQ$ "M=ρ*Q" EQ$ "Q=A2*v2" * EE08C
                  EQ$ "Q=A1*v1" EQ$ "A1=(π*D1^2)/4" EQ$ "A2=(π*D2^2)/4" } * EE0E6
                { EQ$ "M*(ΔP/ρ+(v2^2-v1^2)/2+CONST(g)*Δy+hL)=W" * EE143
                  EQ$ "M*(ΔP/ρ+v2^2*(1-(A2/A1)^2)/2+CONST(g)*Δy+hL)=W" * EE18E
                  EQ$ "M*(ΔP/ρ+v1^2*((A1/A2)^2-1)/2+CONST(g)*Δy+hL)=W" CHR_D * EE1E0
                  CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D } * EE237
              }                                  * EE25A
              { $ "VUTSRQPONMLK\1EJ\10XW" # 18 # 11 * EE25F  variables ΔP P1 P2 Δy y1 y2 v1 v2 A1 A2 D1 D2 ρ Q M hL W
                $ "\03\03\03\02\02\02\09\09\11\11\18\183?@A<" } * EE2A4
              ROMPTR 0E2 03D }                   * EE2D5
            {                                    * EE2E5
              { BINT3 BINT8                      * EE2EA
                {                                * EE2F9
                  EQ$ "ρ*(π*D^2/4)*vavg*\0A(ΔP/ρ+g*Δy+vavg^2*\0A(2*f*(L/D)+ΣK/2))=W" * EE2FE
                  EQ$ "ΔP=P2-P1" EQ$ "Δy=y2-y1" EQ$ "M=ρ*Q" EQ$ "Q=A*vavg" * EE36A
                  EQ$ "A=(π*D^2)/4" EQ$ "Re=D*vavg*ρ/µ" EQ$ "n=µ/ρ" } * EE3C8
                {                                * EE421
                  EQ$ "ρ*(π*D^2/4)*vavg*(ΔP/ρ+CONST(g)*Δy+vavg^2*(2*FANNING(ε/D;D*vavg*ρ/µ)*(L/D)+ΣK/2))=W" * EE426
                  CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D } * EE4B8
              }                                  * EE4E0
              { $ "VUTSRQ]\03\\\08\0C[\1EZCJ\10WY" # 29 # 13 * EE4E5  variables ΔP P1 P2 Δy y1 y2 vavg A D L ε ΣK ρ µ n Q M W Re
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
                { EQ$ "F=m*a" EQ$ "Ki=1/2*m*vi^2" EQ$ "Kf=1/2*m*vf^2" * EE5B0
                  EQ$ "W=F*x" EQ$ "W=Kf-Ki" EQ$ "P=F*v" EQ$ "Pavg=W/t" * EE609
                  EQ$ "vf=vi+a*t" }              * EE663
              }                                  * EE684
              { $ "d\11cba\0E:\15`_îîW\0A^" # 9 # D * EE689  variables m a v vi vf x t F Ki Kf - - W P Pavg
                $ "\08%\09\09\09\02\17\0BBBB<<" } * EE6CA
              ROMPTR 0E2 02A }                   * EE6F3
            {                                    * EE703
              { BINT3 BINT12                     * EE708
                { EQ$ "τ=I*α" EQ$ "Ki=1/2*I*ωi^2" EQ$ "Kf=1/2*I*ωf^2" * EE717
                  EQ$ "W=τ*θ" EQ$ "W=Kf-Ki" EQ$ "P=τ*ω" EQ$ "Pavg=W/t" * EE770
                  EQ$ "ωf=ωi+α*t" EQ$ "at=α*r" EQ$ "ω=2*π*N" EQ$ "ωi=2*π*Ni" * EE7CA
                  EQ$ "ωf=2*π*Nf" }              * EE82C
                { EQ$ "τ=I*α/CONST(rad)" EQ$ "Ki=1/2*I*ωi^2/CONST(rad)^2" * EE84B
                  EQ$ "Kf=1/2*I*ωf^2/CONST(rad)^2" EQ$ "W=τ*θ/CONST(rad)" * EE896
                  CHR_D EQ$ "P=τ*ω/CONST(rad)" CHR_D CHR_D * EE8DC
                  EQ$ "at=α*r/CONST(rad)" EQ$ "ω=CONST(twoπ)*N" * EE907
                  EQ$ "ωi=CONST(twoπ)*Ni" EQ$ "ωf=CONST(twoπ)*Nf" } * EE93D
              }                                  * EE97A
              { $ "\04k/ji\12:h`_îîW\0A^îîîg\06Efe" # 16 # 12 * EE97F  variables I α ω ωi ωf θ t τ Ki Kf - - W P Pavg - - - at r N Ni Nf
                $ "$&''')5\"BBB<<%\18EEE" }      * EE9D0
              ROMPTR 0E2 02A }                   * EEA03
            {                                    * EEA13
              { BINT3 BINT4                      * EEA18
                { EQ$ "F=m*ω^2*r" EQ$ "ω=v/r" EQ$ "ar=v^2/r" EQ$ "ω=2*π*N" } * EEA27
                { EQ$ "F=m*ω^2*r/CONST(rad)^2" EQ$ "ω=CONST(rad)*v/r" CHR_D * EEA8D
                  EQ$ "ω=CONST(twoπ)*N" }        * EEAD5
              }                                  * EEAF2
              { $ "d\06cl/\15E" # 28 # 7 $ "\08\18\09%'\0BE" } * EEAF7  variables m r v ar ω F N
              ROMPTR 0E2 02A }                   * EEB45
            {                                    * EEB55
              { BINT2 BINT2                      * EEB5A
                { EQ$ "F=-k*x" EQ$ "W=-1/2*k*x^2" } } * EEB69
              { $ "m\0E\15W" # 2F # 4 $ "-\18\0BB" } ROMPTR 0E2 03F } * EEBAC  variables k x F W
            {                                    * EEBFE
              { BINT2 BINT2                      * EEC03
                { EQ$ "v1f=(m1-m2)/(m1+m2)*\0Av1i" * EEC12
                  EQ$ "v2f=(2*m1)/(m1+m2)*\0Av1i" } * EEC4B
              }                                  * EEC80
              { $ "rqpon" # 33 # 5 $ "\08\08\09\09\09" } ROMPTR 0E2 040 } * EEC85  variables m1 m2 v1i v1f v2f
            {                                    * EECDB
              { BINT0 EQ$ "F=Cd*((ρ*v^2)/2)*A" } * EECE0
              { $ "s\1E\03c\15" # 38 # 5 $ "\013\11\09\0B" } ROMPTR 0E2 02A } * EED17  variables Cd ρ A v F
            {                                    * EED6D
              { BINT1 EQ$ "F=G*((m1*m2)/r^2)" EQ$ "F=CONST(G)*((m1*m2)/r^2)" } * EED72
              { $ "rq\06\15" # 3D # 4 $ "\08\08C\0B" } ROMPTR 0E2 02A } * EEDD5  variables m1 m2 r F
            {                                    * EEE27
              { BINT1 EQ$ "E=m*c^2" EQ$ "E=m*CONST(c)^2" } * EEE2C
              { $ "d\05" # 41 # 2 $ "\08B" } ROMPTR 0E2 02A } * EEE6B  variables m E
          }                                      * EEEB5
        }                                        * EEEBA

* ROMPTR 0E2 01A
* refs (1): E3857
ROMP_0E2_01A:
        { ROMPTR 0E2 008 # 8                     * EEEBF
          {                                      * EEED9
            {                                    * EEEDE
              { BINT3 BINT2                      * EEEE3
                { EQ$ "P*V=n*R*T" EQ$ "m=n*MW" } * EEEF2
                { EQ$ "P*V=n*CONST(R)*UBASE(T)" CHR_D } } * EEF2E
              { $ "\0A\14uCdt" # 9 # 6 $ "\03(\1C\1B\08!" } ROMPTR 0E2 02A } * EEF64  variables P V T n m MW
            {                                    * EEFBE
              { BINT1 EQ$ "(Pf*Vf)/Tf=(Pi*Vi)/Ti\0A" * EEFC3
                EQ$ "(Pf*Vf)/UBASE(Tf)=(Pi*Vi)/UBASE(Ti)" } * EF001
              { $ "yx32wv" # F # 6 $ "\03\03((\1C\1C" } ROMPTR 0E2 02A } * EF040  variables Pi Pf Vi Vf Ti Tf
            {                                    * EF09A
              { BINT3 BINT2                      * EF09F
                { EQ$ "W=n*R*T*LN(Vf/Vi)" EQ$ "m=n*MW" } * EF0AE
                { EQ$ "W=n*CONST(R)*UBASE(T)*LN(UBASE(Vf/Vi))" CHR_D } } * EF0FA
              { $ "32uCWîdt" # 15 # 7 $ "((\1C\1BB\08!" } ROMPTR 0E2 02A } * EF140  variables Vi Vf T n W - m MW
            {                                    * EF1A0
              { BINT3 BINT2                      * EF1A5
                { EQ$ "Pf/Pi=(Vf/Vi)^-n" EQ$ "Tf/Ti=(Pf/Pi)^\0A((n-1)/n)" } * EF1B4
                { EQ$ "Pf/Pi=(UBASE(Vf/Vi))^-n"  * EF21E
                  EQ$ "UBASE(Tf)/UBASE(Ti)=(UBASE(Pf/Pi))^((n-1)/n)" } * EF24D
              }                                  * EF292
              { $ "yx32wvC" # 1C # 7 $ "\03\03((\1C\1C\01" } ROMPTR 0E2 02A } * EF297  variables Pi Pf Vi Vf Ti Tf n
            {                                    * EF2F5
              { BINT3 BINT4                      * EF2FA
                { EQ$ "T/T0=2/(2+(k-1)*M^2)" EQ$ "P/P0=(T/T0)^(k/(k-1))\0A" * EF309
                  EQ$ "ρ/ρ0=(T/T0)^(1/(k-1)\0A)" * EF36A
                  EQ$ "A/At=(1/M)*(2/(k+1)*\0A(1+(k-1)/2*M^2))\0A^((k+1)/(2*(k-1)))" } * EF39C
                { EQ$ "UBASE(T)/UBASE(T0)=2/(2+(k-1)*M^2)" * EF407
                  EQ$ "P/P0=(UBASE(T)/UBASE(T0))^(k/(k-1))" * EF440
                  EQ$ "ρ/ρ0=(UBASE(T)/UBASE(T0))^(1/(k-1))" * EF474
                  EQ$ "A/At=(1/M)*UBASE(2/(k+1)*(1+(k-1)/2*M^2))^((k+1)/(2*(k-1)))" } * EF4A8
              }                                  * EF50F
              { $ "m\10I\0A|\1E{uz\03" # 23 # A  * EF514  variables k M P0 P ρ0 ρ T0 T At A
                $ "\01\01\03\0333\1C\1C\11\11" } * EF54B
              ROMPTR 0E2 041 }                   * EF56E
            {                                    * EF57E
              { BINT3 BINT2                      * EF583
                { EQ$ "P*V=n*Z*R*T" EQ$ "m=n*MW" } * EF592
                {                                * EF5D2
                  EQ$ "P*V=n*ZFACTOR(UBASE(T)/UBASE(Tc);P/Pc)*CONST(R)*UBASE(T)" * EF5D7
                  CHR_D }                        * EF625
              }                                  * EF62F
              { $ "~\0A\14}uCdt" # 2D # 8 $ "\03\03(\1D\1C\1B\08!" } * EF634  variables Pc P V Tc T n m MW
              ROMPTR 0E2 02A }                   * EF686
            {                                    * EF696
              { BINT1 EQ$ "(Pf*Vf)/(Zf*Tf)=\0A(Pi*Vi)/(Zi*Ti)" * EF69B
                EQ$ "(Pf*Vf)/(ZFACTOR(UBASE(Tf)/UBASE(Tc);Pf/Pc)*UBASE(Tf))=(Pi*Vi)/(ZFACTOR(UBASE(Ti)/UBASE(Tc);Pi/Pc)*UBASE(Ti))" } * EF6EB
              { $ "~yx32î}wv" # 35 # 8 $ "\03\03\03((\1D\1C\1C" } * EF78A  variables Pc Pi Pf Vi Vf - Tc Ti Tf
              ROMPTR 0E2 02A }                   * EF7DE
            {                                    * EF7EE
              { BINT3 BINT4                      * EF7F3
                { EQ$ "P=(n*MW*vrms^2)/(3*V)\0A" EQ$ "vrms=√((3*R*T)/MW)" * EF802
                  EQ$ "λ=1/(√(2)*π*((n*NA)/\0AV)*d^2)" EQ$ "m=n*MW" } * EF865
                { CHR_D EQ$ "vrms=√(UBASE((3*CONST(R)*UBASE(T))/MW))" * EF8B8
                  EQ$ "λ=1/(√(2)*π*((n*CONST(NA))/V)*d^2)" CHR_D } * EF8F6
              }                                  * EF938
              { $ "\0A\14uCt∡?\7Fd" # 3D # 9 $ "\03(\1C\1B!\09  \08" } * EF93D  variables P V T n MW vrms d λ m
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
                { EQ$ "Q=m*c*ΔT" EQ$ "Q=m*c*(Tf-Ti)" } * EF9E0
                { CHR_D EQ$ "Q=m*c*TDELTA(Tf;Ti)" } } * EFA26
              { $ "āwvd\0BJ" # 7 # 6 $ "\1C\1C\1C\086\1E" } ROMPTR 0E2 02A } * EFA6A  variables ΔT Ti Tf m c Q
            {                                    * EFAC4
              { BINT3 BINT2                      * EFAC9
                { EQ$ "δ=α*L*ΔT" EQ$ "δ=α*L*(Tf-Ti)" } * EFAD8
                { CHR_D EQ$ "δ=α*L*TDELTA(Tf;Ti)" } } * EFB1E
              { $ "āwv\08k∇" # D # 6 $ "\1C\1C\1C\02:\18" } ROMPTR 0E2 042 } * EFB62  variables ΔT Ti Tf L α δ
            {                                    * EFBBC
              { BINT3 BINT2                      * EFBC1
                { EQ$ "q=k*A/L*ΔT" EQ$ "q=k*A/L*(Th-Tc)" } * EFBD0
                { CHR_D EQ$ "q=k*A/L*TDELTA(Th;Tc)" } } * EFC1E
              { $ "ā√}\03\08m6" # 13 # 7 $ "\1C\1C\1C/\1897" } * EFC66  variables ΔT Th Tc A L k q
              ROMPTR 0E2 043 }                   * EFCB4
            {                                    * EFCC4
              { BINT3 BINT2                      * EFCC9
                { EQ$ "q=h*A*ΔT" EQ$ "q=h*A*(Th-Tc)" } * EFCD8
                { CHR_D EQ$ "q=h*A*TDELTA(Th;Tc)" } } * EFD1E
              { $ "ā√}\03B6" # 1A # 6 $ "\1C\1C\1C/87" } ROMPTR 0E2 044 } * EFD62  variables ΔT Th Tc A h q
            {                                    * EFDBC
              { BINT3 BINT4                      * EFDC1
                { EQ$ "q=A*ΔT/(1/h1+L1/k1+\0AL2/k2+L3/k3+1/h3)" * EFDD0
                  EQ$ "U=q/(A*ΔT)"               * EFE27
                  EQ$ "q=A*(Th-Tc)/(1/h1+\0AL1/k1+L2/k2+L3/k3+\0A1/h3)" * EFE43
                  EQ$ "U=q/(A*(Th-Tc))" }        * EFE9F
                { CHR_D CHR_D                    * EFEC6
                  EQ$ "q=A*TDELTA(Th;Tc)/(1/h1+L1/k1+L2/k2+L3/k3+1/h3)" * EFED5
                  EQ$ "U=q/(A*TDELTA(Th;Tc))" }  * EFF3B
              }                                  * EFF70
              { $ "ā√}\03≥≤('∂π▶Σ∫6" # 20 # E $ "\1C\1C\1C/88\18\18\1899987" } * EFF75  variables ΔT Th Tc A h1 h3 L1 L2 L3 k1 k2 k3 U q
              ROMPTR 0E2 045 }                   * EFFDF
            {                                    * EFFEF
              { BINT3 BINT5                      * EFFF4
                { EQ$ "eb=σ*T^4" EQ$ "f=F0λ(λ2;T)-F0λ(λ1;T)\0A" * F0003
                  EQ$ "eb12=f*eb" EQ$ "λmax*T=c3" EQ$ "q=eb*A" } * F0058
                { EQ$ "eb=CONST(σ)*UBASE(T)^4"   * F00AB
                  EQ$ "f=ABS(F0λ(λ2;T)-F0λ(λ1;T))" CHR_D * F00D0
                  EQ$ "λmax*UBASE(T)=CONST(c3)" CHR_D } * F0111
              }                                  * F013F
              { $ "u↓←→.α≠\036" # 2E # 9 $ "\1C;++\01;+/7" } ROMPTR 0E2 046 } * F0144  variables T eb λ1 λ2 f eb12 λmax A q
          }                                      * F01AA
        }                                        * F01AF

* ROMPTR 0E2 01C
* refs (1): E3857
ROMP_0E2_01C:
        { ROMPTR 0E2 00A # 4                     * F01B4
          {                                      * F01CE
            {                                    * F01D3
              { BINT1 EQ$ "B=(µ0*µr*I)/(2*π*r)"  * F01D8
                EQ$ "B=IFTE(r<rw;(CONST(µ0)*µr*I*r)/(2*π*rw^2);(CONST(µ0)*µr*I)/(2*π*r))" } * F020C
              { $ "D\06γ\04↑" # 5 # 5 $ "\01\18\18\0D*" } ROMPTR 0E2 047 } * F0275  variables µr r rw I B
            {                                    * F02CB
              { BINT1 EQ$ "Fba=(µ0*µr*L*Ib*Ia)/\0A(2*π*d)" * F02D0
                EQ$ "Fba=(CONST(µ0)*µr*L*Ib*Ia)/(2*π*d)" } * F0318
              { $ "D\08?ηεδ" # A # 6 $ "\01\18\18\0D\0D\0B" } ROMPTR 0E2 048 } * F0359  variables µr L d Ib Ia Fba
            {                                    * F03B3
              { BINT1 EQ$ "B=µ0*µr*I*n" EQ$ "B=CONST(µ0)*µr*I*n" } * F03B8
              { $ "DC\04↑" # 10 # 4 $ "\01\19\0D*" } ROMPTR 0E2 049 } * F0409  variables µr n I B
            {                                    * F045B
              { BINT1 EQ$ "B=(µ0*µr*I*N)/(2*π)*\0A(2/(ro+ri))" * F0460
                EQ$ "B=(CONST(µ0)*µr*I*N)/(2*π)*(2/(ro+ri))" } * F04A8
              { $ "DEA@\04↑" # 14 # 6 $ "\01\01\18\18\0D*" } ROMPTR 0E2 04A } * F04EB  variables µr N ri ro I B
          }                                      * F0545
        }                                        * F054A

* ROMPTR 0E2 01D
* refs (1): E3857
ROMP_0E2_01D:
        { ROMPTR 0E2 00B # 7                     * F054F
          {                                      * F0569
            {                                    * F056E
              { BINT2 BINT4                      * F0573
                { EQ$ "x=x0+v0*t+1/2*a*t^2" EQ$ "x=x0+v*t-1/2*a*t^2" * F0582
                  EQ$ "x=x0+1/2*(v0+v)*t" EQ$ "v=v0+a*t" } * F05DD
              }                                  * F0624
              { $ "λ\0Eθc\11:" # 8 # 6 $ "\02\02\09\09%\17" } ROMPTR 0E2 02A } * F0629  variables x0 x v0 v a t
            {                                    * F0683
              { BINT3 BINT4                      * F0688
                { EQ$ "y=y0+v0*t-1/2*g*t^2" EQ$ "y=y0+v*t+1/2*g*t^2" * F0697
                  EQ$ "v^2=v0^2-2*g*(y-y0)" EQ$ "v=v0-g*t" } * F06F2
                { EQ$ "y=y0+v0*t-1/2*CONST(g)*t^2" * F0739
                  EQ$ "y=y0+v*t+1/2*CONST(g)*t^2" * F076C
                  EQ$ "v^2=v0^2-2*CONST(g)*(y-y0)" EQ$ "v=v0-CONST(g)*t" } * F0798
              }                                  * F07E5
              { $ "ρ\0Dθc:" # E # 5 $ "\02\02\09\09\17" } ROMPTR 0E2 02A } * F07EA  variables y0 y v0 v t
            {                                    * F0840
              { BINT3 BINT5                      * F0845
                { EQ$ "x=x0+v0*COS(θ0)*t"        * F0854
                  EQ$ "y=y0+v0*SIN(θ0)*t-\0A1/2*g*t^2" EQ$ "vx=v0*COS(θ0)" * F087D
                  EQ$ "vy=v0*SIN(θ0)-g*t" EQ$ "R=v0^2/g*SIN(2*θ0)" } * F08D1
                { CHR_D EQ$ "y=y0+v0*SIN(θ0)*t-1/2*CONST(g)*t^2" CHR_D * F0920
                  EQ$ "vy=v0*SIN(θ0)-CONST(g)*t" * F0965
                  EQ$ "R=v0^2/CONST(g)*SIN(2*θ0)" } * F098D
              }                                  * F09B8
              { $ "λ\0Eρ\0Dωîθτσ:\19" # 13 # A   * F09BD  variables x0 x y0 y θ0 - v0 vx vy t R
                $ "\02\02\02\024\09\09\09\17\02" } * F09F6
              ROMPTR 0E2 04B }                   * F0A19
            {                                    * F0A29
              { BINT2 BINT4                      * F0A2E
                { EQ$ "θ=θ0+ω0*t+1/2*α*t^2" EQ$ "θ=θ0+ω*t-1/2*α*t^2" * F0A3D
                  EQ$ "θ=θ0+1/2*(ω0+ω)*t" EQ$ "ω=ω0+α*t" } * F0A98
              }                                  * F0ADF
              { $ "ω\12>/k:" # 1D # 6 $ "))''&5" } ROMPTR 0E2 02A } * F0AE4  variables θ0 θ ω0 ω α t
            {                                    * F0B3E
              { BINT3 BINT3                      * F0B43
                { EQ$ "ω=v/r" EQ$ "ar=v^2/r" EQ$ "ω=2*π*N" } * F0B52
                { EQ$ "ω=CONST(rad)*v/r" CHR_D EQ$ "ω=CONST(twoπ)*N" } } * F0B9E
              { $ "\06cl/E" # 23 # 5 $ "\18\09%'E" } ROMPTR 0E2 02A } * F0BE4  variables r v ar ω N
            {                                    * F0C3A
              { BINT1 EQ$ "v=√((2*m*g)/(Cd*ρ*A))\0A" * F0C3F
                EQ$ "v=√(UBASE((2*m*CONST(g))/(Cd*ρ*A)))" } * F0C79
              { $ "s\1E\03dc" # 28 # 5 $ "\013\11\08\09" } ROMPTR 0E2 02A } * F0CB2  variables Cd ρ A m v
            {                                    * F0D08
              { BINT1 EQ$ "v=√((2*G*M)/R)"       * F0D0D
                EQ$ "v=√(UBASE((2*CONST(G)*M)/R))" } * F0D3B
              { $ "\10\19c" # 2D # 3 $ "\08C\09" } ROMPTR 0E2 02A } * F0D68  variables M R v
          }                                      * F0DB6
        }                                        * F0DBB
