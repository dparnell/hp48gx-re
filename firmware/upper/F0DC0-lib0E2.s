* HP 48GX ROM revision R, #F0DC0-#F3F3B: Library part 0E2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #F0DC0 in the original ROM).
        RPL

* ROMPTR 0E2 01E
* refs (1): E3857
ROMP_0E2_01E:
        { ROMPTR 0E2 00C # 6                     * F0DC0
          {                                      * F0DDA
            {                                    * F0DDF
              { BINT0 EQ$ "n1*SIN(θ1)=n2*SIN(θ2)\0A" } * F0DE4
              { $ "■ΩΠΔ" # 7 # 4 $ "\01\0144" } ROMPTR 0E2 04C } * F0E1B  variables n1 n2 θ1 θ2
            {                                    * F0E6D
              { BINT0 EQ$ "SIN(θc)=n1/n2" }      * F0E72
              { $ "■Ω∞" # B # 3 $ "\01\014" } ROMPTR 0E2 04D } * F0E9F  variables n1 n2 θc
            {                                    * F0EED
              { BINT3 BINT2                      * F0EF2
                { EQ$ "TAN(θB)=n2/n1" EQ$ "θB+θ2=90" } * F0F01
                { CHR_D EQ$ "θB+θ2=CONST(angl)/2" } } * F0F49
              { $ "■Ω\A0Δ" # E # 4 $ "\01\0144" } ROMPTR 0E2 04E } * F0F83  variables n1 n2 θB θ2
            {                                    * F0FD5
              { BINT2 BINT3                      * F0FDA
                { EQ$ "1/u+1/v=1/f" EQ$ "f=1/2*r" EQ$ "m=-v/u" } } * F0FE9
              { $ "¡c.\06d" # 12 # 5 $ "\18\18\18\18\01" } ROMPTR 0E2 04F } * F1044  variables u v f r m
            {                                    * F109A
              { BINT0 EQ$ "n1/u+n2/v=(n2-n1)/r" } * F109F
              { $ "¡c\06■Ω" # 17 # 5 $ "\18\18\18\01\01" } ROMPTR 0E2 050 } * F10DA  variables u v r n1 n2
            {                                    * F1130
              { BINT2 BINT3                      * F1135
                { EQ$ "1/u+1/v=1/f" EQ$ "1/f=(n-1)*(1/r1-1/r2)\0A" * F1144
                  EQ$ "m=-v/u" }                 * F119B
              }                                  * F11B6
              { $ "¡c.£¢Cd" # 1C # 7 $ "\18\18\18\18\18\01\01" } * F11BB  variables u v f r1 r2 n m
              ROMPTR 0E2 051 }                   * F1209
          }                                      * F1219
        }                                        * F121E

* ROMPTR 0E2 01F
* refs (1): E3857
ROMP_0E2_01F:
        { ROMPTR 0E2 00D # 5                     * F1223
          {                                      * F123D
            {                                    * F1242
              { BINT3 BINT3                      * F1247
                { EQ$ "ω=√(k/m)" EQ$ "T=2*π/ω" EQ$ "ω=2*π*f" } * F1256
                { EQ$ "ω=CONST(rad)*√(UBASE(k/m))" EQ$ "T=CONST(twoπ)/ω" * F12A6
                  EQ$ "ω=CONST(twoπ)*f" }        * F12E7
              }                                  * F1304
              { $ "mdu/." # 6 # 5 $ "-\08\17\15\16" } * F1309  variables k m T ω f
              { ROMPTR 0E2 052 ROMPTR 0E2 053 ROMPTR 0E2 054 ROMPTR 0E2 053 } } * F134F
            {                                    * F138A
              { BINT3 BINT3                      * F138F
                { EQ$ "ω=√(g/L)" EQ$ "T=2*π/ω" EQ$ "ω=2*π*f" } * F139E
                { EQ$ "ω=CONST(rad)*√(UBASE(CONST(g)/L))" * F13EE
                  EQ$ "T=CONST(twoπ)/ω" EQ$ "ω=CONST(twoπ)*f" } * F1419
              }                                  * F1450
              { $ "\08u/." # B # 4 $ "\18\17\15\16" } ROMPTR 0E2 055 } * F1455  variables L T ω f
            {                                    * F14A7
              { BINT3 BINT4                      * F14AC
                { EQ$ "ω=√(g/h)" EQ$ "h=L*COS(θ)" EQ$ "T=2*π/ω" * F14BB
                  EQ$ "ω=2*π*f" }                * F1508
                { EQ$ "ω=CONST(rad)*√(UBASE(CONST(g)/h))" CHR_D * F1523
                  EQ$ "T=CONST(twoπ)/ω" EQ$ "ω=CONST(twoπ)*f" } * F1553
              }                                  * F158A
              { $ "\08B\12u/." # F # 6 $ "\18\184\17\15\16" } ROMPTR 0E2 056 } * F158F  variables L h θ T ω f
            {                                    * F15E9
              { BINT3 BINT3                      * F15EE
                { EQ$ "ω=√((G*J)/(L*I))" EQ$ "T=2*π/ω" EQ$ "ω=2*π*f" } * F15FD
                { EQ$ "ω=CONST(rad)*√(UBASE((G*J)/(L*I)))" * F1659
                  EQ$ "T=CONST(twoπ)/ω" EQ$ "ω=CONST(twoπ)*f" } * F168E
              }                                  * F16C5
              { $ "¥¤\08\04uî/." # 15 # 7 $ "\03\04\18$\17\15\16" } * F16CA  variables G J L I T - ω f
              ROMPTR 0E2 057 }                   * F171A
            {                                    * F172A
              { BINT3 BINT4                      * F172F
                { EQ$ "x=xm*COS(ω*t+Ø)" EQ$ "v=-ω*xm*SIN(ω*t+Ø)" * F173E
                  EQ$ "a=-ω^2*xm*COS(ω*t+Ø)" EQ$ "ω=2*π*f" } * F178D
                { CHR_D EQ$ "v=-ω*xm*SIN(ω*t+Ø)/CONST(rad)" * F17D2
                  EQ$ "a=-ω^2*xm*COS(ω*t+Ø)/CONST(rad)^2" * F180C
                  EQ$ "ω=CONST(twoπ)*f" }        * F1840
              }                                  * F185D
              { $ "¦/.G:î\0Ec\11" # 1C # 8 $ "\18\15\164\17\18\09%" } * F1862  variables xm ω f Ø t - x v a
              ROMPTR 0E2 02A }                   * F18B6
          }                                      * F18C6
        }                                        * F18CB

* ROMPTR 0E2 020
* refs (1): E3857
ROMP_0E2_020:
        { ROMPTR 0E2 00E # 6                     * F18D0
          {                                      * F18EA
            {                                    * F18EF
              { BINT2 BINT5                      * F18F4
                { EQ$ "A=π*r^2" EQ$ "C=2*π*r" EQ$ "I=(π*r^4)/4" * F1903
                  EQ$ "J=(π*r^4)/2" EQ$ "Id=I+A*d^2" } * F1952
              }                                  * F1991
              { $ "\06\03)îîî\04¤?§" # 7 # 7 $ "\18\11\18\04\04\18\04" } * F1996  variables r A C - - - I J d Id
              ROMPTR 0E2 058 }                   * F19EA
            {                                    * F19FA
              { BINT2 BINT5                      * F19FF
                { EQ$ "A=π*b*h" EQ$ "C=2*π*√((b^2+h^2)/2)" * F1A0E
                  EQ$ "I=(π*b*h^3)/4" EQ$ "J=((π*b*h)/4*\0A(b^2+h^2))" * F1A57
                  EQ$ "Id=I+A*d^2" }             * F1AAB
              }                                  * F1ACC
              { $ "¨B\03)îî\04¤?§" # E # 8 $ "\18\18\11\18\04\04\18\04" } * F1AD1  variables b h A C - - I J d Id
              ROMPTR 0E2 059 }                   * F1B27
            {                                    * F1B37
              { BINT2 BINT5                      * F1B3C
                { EQ$ "A=b*h" EQ$ "P=2*b+2*h" EQ$ "I=(b*h^3)/12" * F1B4B
                  EQ$ "J=(b*h)/12*(b^2+h^2)" EQ$ "Id=I+A*d^2" } * F1B9C
              }                                  * F1BE7
              { $ "¨B\03\0Aîî\04¤?§" # 16 # 8 $ "\18\18\11\18\04\04\18\04" } * F1BEC  variables b h A P - - I J d Id
              ROMPTR 0E2 05A }                   * F1C42
            {                                    * F1C52
              { BINT3 BINT6                      * F1C57
                { EQ$ "A=(1/4*n*L^2)/\0ATAN(180/n)" EQ$ "P=n*L" * F1C66
                  EQ$ "rs=(L/2)/TAN(180/n)" EQ$ "rv=(L/2)/SIN(180/n)" * F1CB7
                  EQ$ "θ=(n-2)/n*180" EQ$ "ß=360/n" } * F1D0D
                { EQ$ "A=(1/4*n*L^2)/TAN(CONST(angl)/n)" CHR_D * F1D4C
                  EQ$ "rs=(L/2)/TAN(CONST(angl)/n)" * F1D92
                  EQ$ "rv=(L/2)/SIN(CONST(angl)/n)" * F1DC6
                  EQ$ "θ=(n-2)/n*CONST(angl)" EQ$ "ß=2*CONST(angl)/n" } * F1DF4
              }                                  * F1E41
              { $ "C\08«ª\03\0A\12©" # 1E # 8 $ "\01\18\18\18\11\1844" } * F1E46  variables n L rs rv A P θ ß
              ROMPTR 0E2 05B }                   * F1E98
            {                                    * F1EA8
              { BINT2 BINT4                      * F1EAD
                { EQ$ "A=π*(ro^2-ri^2)" EQ$ "I=π/4*(ro^4-ri^4)" * F1EBC
                  EQ$ "J=π/2*(ro^4-ri^4)" EQ$ "Id=I+A*d^2" } * F1F0D
              }                                  * F1F58
              { $ "A@\03îîî\04¤?§" # 26 # 7 $ "\18\18\11\04\04\18\04" } * F1F5D  variables ri ro A - - - I J d Id
              ROMPTR 0E2 05C }                   * F1FB1
            {                                    * F1FC1
              { BINT2 BINT6                      * F1FC6
                { EQ$ "A=(b*h)/2" EQ$ "P=b+√(v^2+h^2)+\0A√((b-v)^2+h^2)" * F1FD5
                  EQ$ "Ix=(b*h^3)/36" EQ$ "Iy=(b*h)/36*\0A(b^2-b*v+v^2)" * F2032
                  EQ$ "J=(b*h)/36*\0A(h^2+b^2-b*v+v^2)" EQ$ "Id=Ix+A*d^2" } * F208C
              }                                  * F20EB
              { $ "¨Bc\03\0Aî\AD¬¤?§" # 2D # A   * F20F0  variables b h v A P - Ix Iy J d Id
                $ "\18\18\18\11\18\04\04\04\18\04" } * F2129
              ROMPTR 0E2 05D }                   * F214C
          }                                      * F215C
        }                                        * F2161

* ROMPTR 0E2 021
* refs (1): E3857
ROMP_0E2_021:
        { ROMPTR 0E2 00F # 4                     * F2166
          {                                      * F2180
            {                                    * F2185
              { BINT2 BINT5                      * F218A
                { EQ$ "V=(π/3)*r^2*h" EQ$ "A=π*r^2+π*r*\0A√(r^2+h^2)" * F2199
                  EQ$ "Ixx=(3/20)*m*r^2+\0A(3/80)*m*h^2" * F21EE
                  EQ$ "Izz=(3/10)*m*r^2" EQ$ "Id=Ixx+m*d^2" } * F222A
              }                                  * F2273
              ROMPTR 0E2 028 ROMPTR 0E2 05E }    * F2278
            {                                    * F2293
              { BINT2 BINT5                      * F2298
                { EQ$ "V=π*r^2*h" EQ$ "A=2*π*r^2+2*π*r*h" * F22A7
                  EQ$ "Ixx=(1/4)*m*r^2+\0A(1/12)*m*h^2" * F22EC
                  EQ$ "Izz=(1/2)*m*r^2" EQ$ "Id=Ixx+m*d^2" } * F2326
              }                                  * F236D
              ROMPTR 0E2 028 ROMPTR 0E2 05F }    * F2372
            {                                    * F238D
              { BINT2 BINT4                      * F2392
                { EQ$ "V=b*h*t" EQ$ "A=2*(b*h+b*t+h*t)" * F23A1
                  EQ$ "I=(1/12)*m*(h^2+t^2)" EQ$ "Id=I+m*d^2" } * F23E8
              }                                  * F2431
              { $ "¨B:\14\03îd\04?§" # E # 9 $ "\18\18\18#\11\08$\18$" } * F2436  variables b h t V A - m I d Id
              ROMPTR 0E2 060 }                   * F248E
            {                                    * F249E
              { BINT2 BINT4                      * F24A3
                { EQ$ "V=(4/3)*π*r^3" EQ$ "A=4*π*r^2" EQ$ "I=(2/5)*m*r^2" * F24B2
                  EQ$ "Id=I+m*d^2" }             * F250F
              }                                  * F2530
              { $ "\06\14\03îîîd\04?§" # 17 # 7 $ "\18#\11\08$\18$" } * F2535  variables r V A - - - m I d Id
              ROMPTR 0E2 061 }                   * F2589
          }                                      * F2599
        }                                        * F259E

* ROMPTR 0E2 022
* refs (1): E3857
ROMP_0E2_022:
        { ROMPTR 0E2 010 # 4                     * F25A3
          {                                      * F25BD
            {                                    * F25C2
              { BINT3 BINT8                      * F25C7
                { EQ$ "Vbi=(k*T)/q*LN((NA*\0AND)/ni^2)" * F25D6
                  EQ$ "xd=√((2*εsi*ε0)/q*\0A(Vbi-Va)*(1/NA+1/ND))" * F261B
                  EQ$ "Cj=(εsi*ε0)/xd" EQ$ "Emax=2*(Vbi-Va)/xd" * F266F
                  EQ$ "BV=(εsi*ε0*E1^2)/\0A(2*q)*(1/NA+1/ND)" * F26BF
                  EQ$ "J=Js*(e^((q*Va)/\0A(k*T))-1)" * F2707
                  EQ$ "Aj=(W+2*ΔW)*(L+2*ΔL)+\0Aπ*(W+L+2*ΔW+2*ΔL)*xj+\0A2*π*xj^2" * F2741
                  EQ$ "I=J*Aj" }                 * F279F
                { EQ$ "Vbi=CONST(kq)*UBASE(T)*LN(UBASE(NA*ND/SIDENS(T)^2))" * F27BA
                  EQ$ "xd=√(UBASE(2*CONST(εsi)*CONST(ε0q)*(Vbi-Va)*(1/NA+1/ND)))" * F2809
                  EQ$ "Cj=CONST(εsi)*CONST(ε0)/xd" CHR_D * F285D
                  EQ$ "BV=(CONST(εsi)*CONST(ε0q)*E1^2)/2*(1/NA+1/ND)" * F288A
                  EQ$ "J=Js*(EXP(UBASE(Va/(CONST(kq)*UBASE(T))))-1)" CHR_D * F28D0
                  CHR_D }                        * F290F
              }                                  * F2919
              { $ "½¼u»º¹W¸\08·¶µ¤´³\04²î±°" # 5 # 13 * F291E  variables ND NA T Js Va E1 W ΔW L ΔL xj xd J Aj Cj I Vbi - Emax BV
                $ "OOFP\0CSQQQQQQGDRH\0CS\0C" }  * F2969
              ROMPTR 0E2 062 }                   * F299E
            {                                    * F29AE
              { BINT3 BINT10                     * F29B3
                { EQ$ "We=W-2*ΔW" EQ$ "Le=L-2*ΔL" EQ$ "Cox=(εox*ε0)/tox" * F29C2
                  EQ$ "IDS=Cox*µn*(We/Le)*\0A((VGS-Vt)*VDS-VDS^2/2)\0A*(1+λ*VDS)" * F2A23
                  EQ$ "γ=√(2*εsi*ε0*q*NA)/\0ACox" * F2A8D
                  EQ$ "Vt=Vt0+γ*(√(2*ABS(Øp)\0A+ABS(VBS))-√(2*ABS(Øp)\0A))" * F2AC3
                  EQ$ "Øp=-k*T/q*LN(NA/ni)" EQ$ "gds=IDS*λ" * F2B21
                  EQ$ "gm=√(Cox*µn*(We/Le)*\0A(1+λ*VDS)*2*IDS)" * F2B6D
                  EQ$ "VDsat=VGS-Vt" }           * F2BB9
                { CHR_D CHR_D EQ$ "Cox=(CONST(εox)*CONST(ε0))/tox" * F2BE0
                  EQ$ "IDS=IFTE(VGS<Vt;0;IFTE(VDS≤VGS-Vt;Cox*µn*(We/Le)*((VGS-Vt)*VDS-VDS^2/2)*(1+λ*VDS);(Cox*µn/2)*(We/Le)*(VGS-Vt)^2*(1+λ*VDS)))" * F2C1B
                  EQ$ "γ^2=(2*CONST(εsi)*CONST(qε0)*NA)/Cox^2" * F2CF7
                  EQ$ "Vt=Vt0+√(UBASE(γ^2*(4*ABS(Øp)+ABS(VBS)-2*√(UBASE((2*ABS(Øp)+ABS(VBS))*2*ABS(Øp))))))" * F2D2D
                  EQ$ "Øp=-CONST(kq)*UBASE(T)*LN(UBASE(NA/SIDENS(T)))" CHR_D * F2DB9
                  EQ$ "gm=IFTE(VGS<Vt;0;IFTE(VDS≤VGS-Vt;Cox*µn*(We/Le)*VDS*(1+λ*VDS);√(UBASE(Cox*µn*(We/Le)*(1+λ*VDS)*2*IDS))))" * F2E00
                  CHR_D }                        * F2EAE
              }                                  * F2EB8
              { $ "ÌË¼*ÊuÉÈÇÆÅÄW¸\08·ÃÂÁÀ¿¾\7F" # 18 # 17 * F2EBD  variables tox Cox NA Øp µn T Vt0 γ Vt VGS VBS VDS W ΔW L ΔL We Le IDS gds VDsat gm λ
                $ "NRO\0CTF\0CU\0C\0C\0C\0CQQQQQQHL\0CIJ" } * F2F0E
              ROMPTR 0E2 063 }                   * F2F4B
            {                                    * F2F5B
              { BINT3 BINT8                      * F2F60
                {                                * F2F6F
                  EQ$ "IE=-IES*(e^((q*VBE)/\0A(k*T))-1)+αR*ICS*\0A(e^((q*VBC)/(k*T))-1)" * F2F74
                  EQ$ "IC=-ICS*(e^((q*VBC)/\0A(k*T))-1)+αF*IES*\0A(e^((q*VBE)/(k*T))-1)" * F2FEE
                  EQ$ "IS=αF*IES" EQ$ "IS=αR*ICS" EQ$ "IB+IE+IC=0" * F3068
                  EQ$ "ICO=ICS*(1-αF*αR)" EQ$ "ICEO=ICO/(1-αF)" * F30BE
L_F310E:
                  EQ$ "VCEsat=(k*T)/q*LN((1+\0AIC/IB*(1-αR))/(αR*(1-\0AIC/IB*((1-αF)/αF))))" } * F310E
                {                                * F318D
                  EQ$ "IE=-IES*(EXP(UBASE(VBE/(CONST(kq)*UBASE(T))))-1)+αR*ICS*(EXP(UBASE(VBC/(CONST(kq)*UBASE(T))))-1)" * F3192
                  EQ$ "IC=-ICS*(EXP(UBASE(VBC/(CONST(kq)*UBASE(T))))-1)+αF*IES*(EXP(UBASE(VBE/(CONST(kq)*UBASE(T))))-1)" * F320C
                  CHR_D CHR_D CHR_D CHR_D CHR_D  * F3286
                  EQ$ "VCEsat=IFTE(UBASE(IC/IB)*((1-αF)/αF)≥1;0;CONST(kq)*UBASE(T)*LN((1+UBASE(IC/IB)*(1-αR))/(αR*(1-UBASE(IC/IB)*((1-αF)/αF)))))" } * F329F
              }                                  * F3354
              { $ "ÙØ×uÖÕÔÓÒÑÐîÏÎÍ" # 2F # E $ "KKKF\01\01HHHKK\0C\0C\0C" } * F3359  variables IS IES ICS T αF αR IE IC IB ICO ICEO - VCEsat VBC VBE
              ROMPTR 0E2 064 }                   * F33C5
            {                                    * F33D5
              { BINT3 BINT7                      * F33DA
                { EQ$ "Vbi=(k*T)/q*LN(ND/ni)\0A" * F33E9
                  EQ$ "xdmax=√((2*εsi*ε0)/\0A(q*ND)*(Vbi-VGS+VDS))" * F3422
                  EQ$ "G0=q*ND*µn*(a*W/L)"       * F3478
                  EQ$ "ID=G0*(VDS-2/3*√(\0A(2*εsi*ε0)/(q*ND*a^2))\0A*((Vbi-VGS+VDS)^(3/2)-\0A(Vbi-VGS)^(3/2)))" * F34A4
                  EQ$ "VDsat=(q*ND*a^2)/\0A(2*εsi*ε0)-(Vbi-VGS)" * F3542
                  EQ$ "Vt=Vbi-q*ND*a^2/\0A(2*εsi*ε0)" * F3592
                  EQ$ "gm=G0*(1-√(2*εsi*ε0/\0A(q*ND*a^2)*(Vbi-VGS)))\0A" } * F35CE
                { EQ$ "Vbi=CONST(kq)*UBASE(T)*LN(UBASE(ND/SIDENS(T)))" * F362B
                  EQ$ "xdmax=√(UBASE((2*CONST(εsi)*CONST(ε0q))/ND*(Vbi-VGS+VDS)))" * F3672
                  EQ$ "G0=CONST(q)*ND*µn*(a*W/L)" * F36C8
                  EQ$ "ID=IFTE(xdmax<a;G0*(VDS-2/3*(√(UBASE((2*CONST(εsi)*CONST(ε0q))/(ND*a^2)*(Vbi-VGS+VDS)^3))-√(UBASE((2*CONST(εsi)*CONST(ε0q))/(ND*a^2)*(Vbi-VGS)^3))));G0*(ND*a^2/(6*CONST(εsi)*CONST(ε0q))-(Vbi-VGS)*(1-2/3*√(UBASE((2*CONST(εsi)*CONST(ε0q)/(ND*a^2))*(Vbi-VGS))))))" * F36F6
                  EQ$ "VDsat=(ND*a^2)/(2*CONST(εsi)*CONST(ε0q))-(Vbi-VGS)" * F3852
                  EQ$ "Vt=Vbi-ND*a^2/(2*CONST(εsi)*CONST(ε0q))" * F38A0
                  EQ$ "gm=G0*(1-√(UBASE((2*CONST(εsi)*CONST(ε0q))/(ND*a^2)*(Vbi-VGS))))" } * F38DA
              }                                  * F3939
              { $ "½W\11\08ÊîÇÆÄ²¿ÜuÛÚ¾" # 3D # F * F393E  variables ND W a L µn - Vt VGS VDS Vbi VDsat ID T G0 xdmax gm
                $ "OQQQT\0C\0C\0C\0C\0CHFLQI" }  * F3981
              ROMPTR 0E2 065 }                   * F39AE
          }                                      * F39BE
        }                                        * F39C3

* ROMPTR 0E2 023
* refs (1): E3857
ROMP_0E2_023:
        { ROMPTR 0E2 011 # 4                     * F39C8
          {                                      * F39E2
            {                                    * F39E7
              { BINT2 BINT3                      * F39EC
                { EQ$ "σ=E*ε" EQ$ "ε=δ/L" EQ$ "σ=P/A" } } * F39FB
              { $ "\0A\08\03\05îî∇\0CÝ" # 5 # 7 $ "\05\02\11\03\18\01\03" } * F3A46  variables P L A E - - δ ε σ
              ROMPTR 0E2 066 }                   * F3A98
            {                                    * F3AA8
              { BINT3 BINT3                      * F3AAD
                { EQ$ "τ=G*γ" EQ$ "γ=(r*Ø)/L" EQ$ "τ=(T*r)/J" } * F3ABC
                { EQ$ "τ=G*γ/CONST(rad)" CHR_D CHR_D } } * F3B0E
              { $ "u\08\06¤¥îGÈh" # C # 8 $ "\"\02\18\04\0344\03" } * F3B43  variables T L r J G - Ø γ τ
              ROMPTR 0E2 067 }                   * F3B97
            {                                    * F3BA7
              { BINT2 BINT3                      * F3BAC
                { EQ$ "σx1=(σx+σy)/2+\0A(σx-σy)/2*COS(2*θ)+\0Aτxy*SIN(2*θ)" * F3BBB
                  EQ$ "σx1+σy1=σx+σy"            * F3C14
                  EQ$ "τx1y1=-((σx-σy)/2)*\0ASIN(2*θ)+τxy*COS(2*θ)" } * F3C38
              }                                  * F3C87
              { $ "ãâá\12îîàßÞ" # 14 # 7 $ "\03\03\034\03\03\03" } * F3C8C  variables σx σy τxy θ - - σx1 σy1 τx1y1
              ROMPTR 0E2 068 }                   * F3CDE
            {                                    * F3CEE
              { BINT3 BINT7                      * F3CF3
                { EQ$ "σ1=(σx+σy)/2+√\0A(((σx-σy)/2)^2+τxy^2)" * F3D02
                  EQ$ "σ1+σ2=σx+σy"              * F3D53
                  EQ$ "SIN(2*θp1)=τxy/√\0A(((σx-σy)/2)^2+τxy^2)" * F3D73
                  EQ$ "θp2=θp1+90" EQ$ "τmax=(σ1-σ2)/2" EQ$ "θs=θp1-45" * F3DBD
                  EQ$ "σavg=(σx+σy)/2" }         * F3E1B
                { CHR_D CHR_D CHR_D EQ$ "θp2=θp1+CONST(angl)/2" CHR_D * F3E44
                  EQ$ "θs=θp1-CONST(angl)/4" CHR_D } * F3E87
              }                                  * F3EB9
              { $ "ãâáîîîêéèçîîæåä" # 1B # A $ "\03\03\03\034\034\034\03" } * F3EBE  variables σx σy τxy - - - σ1 θp1 σ2 θp2 - - τmax θs σavg
              ROMPTR 0E2 069 }                   * F3F22
          }                                      * F3F32
        }                                        * F3F37
