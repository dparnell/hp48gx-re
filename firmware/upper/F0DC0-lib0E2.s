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
              { BINT0 $ "n1*\05θ1)=n\08\05θ2)\0A" } * F0DE4
              { $ "■ΩΠΔ" # 7 # 4 $ "\01\0144" } ROMPTR 0E2 04C } * F0E1B
            {                                    * F0E6D
              { BINT0 $ "\05θc)=n1/n2" }         * F0E72
              { $ "■Ω∞" # B # 3 $ "\01\014" } ROMPTR 0E2 04D } * F0E9F
            {                                    * F0EED
              { BINT3 BINT2                      * F0EF2
                { $ "TAN(θB)=n2/n1" $ "θB+θ2=90" } * F0F01
                { CHR_D $ "θB+θ2=\01angl)/2" } } * F0F49
              { $ "■Ω\A0Δ" # E # 4 $ "\01\0144" } ROMPTR 0E2 04E } * F0F83
            {                                    * F0FD5
              { BINT2 BINT3                      * F0FDA
                { $ "1/u+1/v=1/f" $ "f=1/\08r" $ "m=-v/u" } } * F0FE9
              { $ "¡c.\06d" # 12 # 5 $ "\18\18\18\18\01" } ROMPTR 0E2 04F } * F1044
            {                                    * F109A
              { BINT0 $ "n1/u+n2/v\0En\0Bn1)/r" } * F109F
              { $ "¡c\06■Ω" # 17 # 5 $ "\18\18\18\01\01" } ROMPTR 0E2 050 } * F10DA
            {                                    * F1130
              { BINT2 BINT3                      * F1135
                { $ "1/u+1/v=1/f" $ "1/f\0En-1\09(1/r1-1/r2)\0A" $ "m=-v/u" } } * F1144
              { $ "¡c.£¢Cd" # 1C # 7 $ "\18\18\18\18\18\01\01" } * F11BB
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
                { $ "ω=√(k/m)" $ "T=\08π/ω" $ "ω=\08π*f" } * F1256
                { $ "ω=\01\06\09√(\02k/m\0F" $ "T=\01\07π)/ω" * F12A6
                  $ "ω=\01\07π\09f" }            * F12E7
              }                                  * F1304
              { $ "mdu/." # 6 # 5 $ "-\08\17\15\16" } * F1309
              { ROMPTR 0E2 052 ROMPTR 0E2 053 ROMPTR 0E2 054 ROMPTR 0E2 053 } } * F134F
            {                                    * F138A
              { BINT3 BINT3                      * F138F
                { $ "ω=√(g/L)" $ "T=\08π/ω" $ "ω=\08π*f" } * F139E
                { $ "ω=\01\06\09√(\02\01g)/L\0F" $ "T=\01\07π)/ω" * F13EE
                  $ "ω=\01\07π\09f" }            * F1433
              }                                  * F1450
              { $ "\08u/." # B # 4 $ "\18\17\15\16" } ROMPTR 0E2 055 } * F1455
            {                                    * F14A7
              { BINT3 BINT4                      * F14AC
                { $ "ω=√(g/h)" $ "h=L*\04θ)" $ "T=\08π/ω" $ "ω=\08π*f" } * F14BB
                { $ "ω=\01\06\09√(\02\01g)/h\0F" CHR_D $ "T=\01\07π)/ω" * F1523
                  $ "ω=\01\07π\09f" }            * F156D
              }                                  * F158A
              { $ "\08B\12u/." # F # 6 $ "\18\184\17\15\16" } ROMPTR 0E2 056 } * F158F
            {                                    * F15E9
              { BINT3 BINT3                      * F15EE
                { $ "ω=√((G*J)\0DL*I\0F" $ "T=\08π/ω" $ "ω=\08π*f" } * F15FD
                { $ "ω=\01\06\09√(\02(G*J)\0DL*I\0F)" $ "T=\01\07π)/ω" * F1659
                  $ "ω=\01\07π\09f" }            * F16A8
              }                                  * F16C5
              { $ "¥¤\08\04uî/." # 15 # 7 $ "\03\04\18$\17\15\16" } * F16CA
              ROMPTR 0E2 057 }                   * F171A
            {                                    * F172A
              { BINT3 BINT4                      * F172F
                { $ "x=xm*\04ω*t+Ø)" $ "v=-ω*xm*\05ω*t+Ø)" * F173E
                  $ "a=-ω\0C*xm*\04ω*t+Ø)" $ "ω=\08π*f" } * F178D
                { CHR_D $ "v=-ω*xm*\05ω*t+Ø)/\01\06)" * F17D2
                  $ "a=-ω\0C*xm*\04ω*t+Ø)/\01\06)\0C" $ "ω=\01\07π\09f" } * F180C
              }                                  * F185D
              { $ "¦/.G:î\0Ec\11" # 1C # 8 $ "\18\15\164\17\18\09%" } * F1862
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
                { $ "A=π*r\0C" $ "C=\08π*r" $ "I\0Eπ*r^4)/4" * F1903
                  $ "J\0Eπ*r^4)/2" $ "Id=I+A*d\0C" } * F1952
              }                                  * F1991
              { $ "\06\03)îîî\04¤?§" # 7 # 7 $ "\18\11\18\04\04\18\04" } * F1996
              ROMPTR 0E2 058 }                   * F19EA
            {                                    * F19FA
              { BINT2 BINT5                      * F19FF
                { $ "A=π*b*h" $ "C=\08π*√((b\0C+h\0C)/2)" $ "I\0Eπ*b*h^3)/4" * F1A0E
                  $ "J\0E(π*b*h)/4*\0A(b\0C+h\0C\0F" $ "Id=I+A*d\0C" } * F1A79
              }                                  * F1ACC
              { $ "¨B\03)îî\04¤?§" # E # 8 $ "\18\18\11\18\04\04\18\04" } * F1AD1
              ROMPTR 0E2 059 }                   * F1B27
            {                                    * F1B37
              { BINT2 BINT5                      * F1B3C
                { $ "A=b*h" $ "P=\08b+\08h" $ "I\0Eb*h^3)/12" * F1B4B
                  $ "J\0Eb*h)/1\08(b\0C+h\0C)" $ "Id=I+A*d\0C" } * F1B9C
              }                                  * F1BE7
              { $ "¨B\03\0Aîî\04¤?§" # 16 # 8 $ "\18\18\11\18\04\04\18\04" } * F1BEC
              ROMPTR 0E2 05A }                   * F1C42
            {                                    * F1C52
              { BINT3 BINT6                      * F1C57
                { $ "A\0E1/4*n*L\0C)/\0ATAN(180/n)" $ "P=n*L" * F1C66
                  $ "rs\0EL/2)/TAN(180/n)" $ "rv\0EL/2)/\05180/n)" * F1CB7
                  $ "θ\0En-2)/n*180" $ "ß=360/n" } * F1D0D
                { $ "A\0E1/4*n*L\0C)/TAN(\01angl)/n)" CHR_D * F1D4C
                  $ "rs\0EL/2)/TAN(\01angl)/n)" $ "rv\0EL/2)/\05\01angl)/n)" * F1D92
                  $ "θ\0En-2)/n*\01angl)" $ "ß=\08\01angl)/n" } * F1DF4
              }                                  * F1E41
              { $ "C\08«ª\03\0A\12©" # 1E # 8 $ "\01\18\18\18\11\1844" } * F1E46
              ROMPTR 0E2 05B }                   * F1E98
            {                                    * F1EA8
              { BINT2 BINT4                      * F1EAD
                { $ "A=π\10ro\0C-ri\0C)" $ "I=π/4\10ro^4-ri^4)" * F1EBC
                  $ "J=π/\08(ro^4-ri^4)" $ "Id=I+A*d\0C" } * F1F0D
              }                                  * F1F58
              { $ "A@\03îîî\04¤?§" # 26 # 7 $ "\18\18\11\04\04\18\04" } * F1F5D
              ROMPTR 0E2 05C }                   * F1FB1
            {                                    * F1FC1
              { BINT2 BINT6                      * F1FC6
                { $ "A\0Eb*h)/2" $ "P=b+√(v\0C+h\0C)+\0A√((b-v)\0C+h\0C)" * F1FD5
                  $ "Ix\0Eb*h^3)/36" $ "Iy\0Eb*h)/36*\0A(b\0C-b*v+v\0C)" * F2032
                  $ "J\0Eb*h)/36*\0A(h\0C+b\0C-b*v+v\0C)" $ "Id=Ix+A*d\0C" } * F208C
              }                                  * F20EB
              { $ "¨Bc\03\0Aî\AD¬¤?§" # 2D # A   * F20F0
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
                { $ "V\0Eπ/3\09r\0C*h" $ "A=π*r\0C+π*r*\0A√(r\0C+h\0C)" * F2199
                  $ "Ixx\0E3/20\09m*r\0C+\0A(3/80\09m*h\0C" * F21EE
                  $ "Izz\0E3/10\09m*r\0C" $ "Id=Ixx+m*d\0C" } * F222A
              }                                  * F2273
              ROMPTR 0E2 028 ROMPTR 0E2 05E }    * F2278
            {                                    * F2293
              { BINT2 BINT5                      * F2298
                { $ "V=π*r\0C*h" $ "A=\08π*r\0C+\08π*r*h" * F22A7
                  $ "Ixx\0E1/4\09m*r\0C+\0A(1/12\09m*h\0C" * F22EC
                  $ "Izz\0E1/2\09m*r\0C" $ "Id=Ixx+m*d\0C" } * F2326
              }                                  * F236D
              ROMPTR 0E2 028 ROMPTR 0E2 05F }    * F2372
            {                                    * F238D
              { BINT2 BINT4                      * F2392
                { $ "V=b*h*t" $ "A=\08(b*h+b*t+h*t)" * F23A1
                  $ "I\0E1/12\09m\10h\0C+t\0C)" $ "Id=I+m*d\0C" } * F23E8
              }                                  * F2431
              { $ "¨B:\14\03îd\04?§" # E # 9 $ "\18\18\18#\11\08$\18$" } * F2436
              ROMPTR 0E2 060 }                   * F248E
            {                                    * F249E
              { BINT2 BINT4                      * F24A3
                { $ "V\0E4/3\09π*r^3" $ "A=4*π*r\0C" $ "I\0E2/5\09m*r\0C" * F24B2
                  $ "Id=I+m*d\0C" }              * F250F
              }                                  * F2530
              { $ "\06\14\03îîîd\04?§" # 17 # 7 $ "\18#\11\08$\18$" } * F2535
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
                { $ "Vbi\0Ek*T)/q*LN((NA*\0AND)/ni\0C)" * F25D6
                  $ "xd=√((\08εsi*ε0)/q*\0A(Vbi-Va\09(1/NA+1/ND\0F" * F261B
                  $ "Cj\0Eεsi*ε0)/xd" $ "Emax=\08(Vbi-Va)/xd" * F266F
                  $ "BV\0Eεsi*ε0*E1\0C)/\0A(\08q\09(1/NA+1/ND)" * F26BF
                  $ "J=Js\10e^((q*Va)/\0A(k*T\0F-1)" * F2707
                  $ "Aj\0EW+\08ΔW\09(L+\08ΔL)+\0Aπ\10W+L+\08ΔW+\08ΔL\09xj+\0A\08π*xj\0C" * F2741
                  $ "I=J*Aj" }                   * F279F
                { $ "Vbi=\01kq\09\02T\09LN(\02NA*ND/SIDENS(T)\0C\0F" * F27BA
                  $ "xd=√(\02\08\01εsi\09\01ε0q\09(Vbi-Va\09(1/NA+1/ND\0F)" * F2809
                  $ "Cj=\01εsi\09\01ε0)/xd" CHR_D * F285D
                  $ "BV\0E\01εsi\09\01ε0q\09E1\0C)/\08(1/NA+1/ND)" * F288A
                  $ "J=Js\10EXP(\02Va\0D\01kq\09\02T\0F\0F-1)" CHR_D CHR_D } * F28D0
              }                                  * F2919
              { $ "½¼u»º¹W¸\08·¶µ¤´³\04²î±°" # 5 # 13 * F291E
                $ "OOFP\0CSQQQQQQGDRH\0CS\0C" }  * F2969
              ROMPTR 0E2 062 }                   * F299E
            {                                    * F29AE
              { BINT3 BINT10                     * F29B3
                { $ "We=W-\08ΔW" $ "Le=L-\08ΔL" $ "Cox\0Eεox*ε0)/tox" * F29C2
                  $ "IDS=Cox*µn\10We/Le\09\0A((VGS-Vt\09VDS-VDS\0C/2)\0A\101+λ*VDS)" * F2A23
                  $ "γ=√(\08εsi*ε0*q*NA)/\0ACox" * F2A8D
                  $ "Vt=Vt0+γ\10√(\08ABS(Øp)\0A+ABS(VBS\0F-√(\08ABS(Øp)\0A\0F" * F2AC3
                  $ "Øp=-k*T/q*LN(NA/ni)" $ "gds=IDS*λ" * F2B21
                  $ "gm=√(Cox*µn\10We/Le\09\0A(1+λ*VDS\09\08IDS)" * F2B6D
                  $ "VDsat=VGS-Vt" }             * F2BB9
                { CHR_D CHR_D $ "Cox\0E\01εox\09\01ε0\0F/tox" * F2BE0
                  $ "IDS=\03VGS<Vt;0;\03VDS≤VGS-Vt;Cox*µn\10We/Le\09((VGS-Vt\09VDS-VDS\0C/2\09(1+λ*VDS);(Cox*µn/2\09(We/Le\09(VGS-Vt)\0C\101+λ*VDS\0F)" * F2C1B
                  $ "γ\0C\0E\08\01εsi\09\01qε0\09NA)/Cox\0C" * F2CF7
                  $ "Vt=Vt0+√(\02γ\0C\104*ABS(Øp)+ABS(VBS)-\08√(\02(\08ABS(Øp)+ABS(VBS\0F*\08ABS(Øp\0F\0F\0F" * F2D2D
                  $ "Øp=-\01kq\09\02T\09LN(\02NA/SIDENS(T\0F)" CHR_D * F2DB9
                  $ "gm=\03VGS<Vt;0;\03VDS≤VGS-Vt;Cox*µn\10We/Le\09VDS\101+λ*VDS);√(\02Cox*µn\10We/Le\09(1+λ*VDS\09\08IDS\0F\0F" * F2E00
                  CHR_D }                        * F2EAE
              }                                  * F2EB8
              { $ "ÌË¼*ÊuÉÈÇÆÅÄW¸\08·ÃÂÁÀ¿¾\7F" # 18 # 17 * F2EBD
                $ "NRO\0CTF\0CU\0C\0C\0C\0CQQQQQQHL\0CIJ" } * F2F0E
              ROMPTR 0E2 063 }                   * F2F4B
            {                                    * F2F5B
              { BINT3 BINT8                      * F2F60
                {                                * F2F6F
                  $ "IE=-IES\10e^((q*VBE)/\0A(k*T\0F-1)+αR*ICS*\0A(e^((q*VBC)\0Dk*T\0F-1)" * F2F74
                  $ "IC=-ICS\10e^((q*VBC)/\0A(k*T\0F-1)+αF*IES*\0A(e^((q*VBE)\0Dk*T\0F-1)" * F2FEE
                  $ "IS=αF*IES" $ "IS=αR*ICS" $ "IB+IE+IC=0" * F3068
                  $ "ICO=ICS\101-αF*αR)" $ "ICEO=ICO\0D1-αF)" * F30BE
L_F310E:
                  $ "VCEsat\0Ek*T)/q*LN((1+\0AIC/IB\101-αR\0F\0DαR\101-\0AIC/IB\10(1-αF)/αF\0F\0F" } * F310E
                {                                * F318D
                  $ "IE=-IES\10EXP(\02VBE\0D\01kq\09\02T\0F\0F-1)+αR*ICS\10EXP(\02VBC\0D\01kq\09\02T\0F\0F-1)" * F3192
                  $ "IC=-ICS\10EXP(\02VBC\0D\01kq\09\02T\0F\0F-1)+αF*IES\10EXP(\02VBE\0D\01kq\09\02T\0F\0F-1)" * F320C
                  CHR_D CHR_D CHR_D CHR_D CHR_D  * F3286
                  $ "VCEsat=\03\02IC/IB\09((1-αF)/αF)≥1;0;\01kq\09\02T\09LN((1+\02IC/IB\09(1-αR\0F\0DαR\101-\02IC/IB\09((1-αF)/αF\0F\0F)" } * F329F
              }                                  * F3354
              { $ "ÙØ×uÖÕÔÓÒÑÐîÏÎÍ" # 2F # E $ "KKKF\01\01HHHKK\0C\0C\0C" } * F3359
              ROMPTR 0E2 064 }                   * F33C5
            {                                    * F33D5
              { BINT3 BINT7                      * F33DA
                { $ "Vbi\0Ek*T)/q*LN(ND/ni)\0A"  * F33E9
                  $ "xdmax=√((\08εsi*ε0)/\0A(q*ND\09(Vbi-VGS+VDS\0F" * F3422
                  $ "G0=q*ND*µn\10a*W/L)"        * F3478
                  $ "ID=G0\10VDS-2/3*√(\0A(\08εsi*ε0)\0Dq*ND*a\0C\0F\0A\10(Vbi-VGS+VDS)^(3/2)-\0A(Vbi-VGS)^(3/2\0F)" * F34A4
                  $ "VDsat\0Eq*ND*a\0C)/\0A(\08εsi*ε0)-(Vbi-VGS)" * F3542
                  $ "Vt=Vbi-q*ND*a\0C/\0A(\08εsi*ε0)" * F3592
                  $ "gm=G0\101-√(\08εsi*ε0/\0A(q*ND*a\0C\09(Vbi-VGS\0F)\0A" } * F35CE
                { $ "Vbi=\01kq\09\02T\09LN(\02ND/SIDENS(T\0F)" * F362B
                  $ "xdmax=√(\02(\08\01εsi\09\01ε0q\0F/ND\10Vbi-VGS+VDS\0F)" * F3672
                  $ "G0=\01q\09ND*µn\10a*W/L)"   * F36C8
                  $ "ID=\03xdmax<a;G0\10VDS-2/3\10√(\02(\08\01εsi\09\01ε0q\0F\0DND*a\0C\09(Vbi-VGS+VDS)^3\0F-√(\02(\08\01εsi\09\01ε0q\0F\0DND*a\0C\09(Vbi-VGS)^3\0F\0F;G0\10ND*a\0C\0D6*\01εsi\09\01ε0q\0F-(Vbi-VGS\09(1-2/3*√(\02(\08\01εsi\09\01ε0q)\0DND*a\0C\0F\10Vbi-VGS\0F\0F\0F" * F36F6
                  $ "VDsat\0END*a\0C)\0D\08\01εsi\09\01ε0q\0F-(Vbi-VGS)" * F3852
                  $ "Vt=Vbi-ND*a\0C\0D\08\01εsi\09\01ε0q\0F" * F38A0
                  $ "gm=G0\101-√(\02(\08\01εsi\09\01ε0q\0F\0DND*a\0C\09(Vbi-VGS\0F\0F" } * F38DA
              }                                  * F3939
              { $ "½W\11\08ÊîÇÆÄ²¿ÜuÛÚ¾" # 3D # F * F393E
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
                { $ "σ=E*ε" $ "ε=δ/L" $ "σ=P/A" } } * F39FB
              { $ "\0A\08\03\05îî∇\0CÝ" # 5 # 7 $ "\05\02\11\03\18\01\03" } * F3A46
              ROMPTR 0E2 066 }                   * F3A98
            {                                    * F3AA8
              { BINT3 BINT3                      * F3AAD
                { $ "τ=G*γ" $ "γ\0Er*Ø)/L" $ "τ\0ET*r)/J" } * F3ABC
                { $ "τ=G*γ/\01\06)" CHR_D CHR_D } } * F3B0E
              { $ "u\08\06¤¥îGÈh" # C # 8 $ "\"\02\18\04\0344\03" } * F3B43
              ROMPTR 0E2 067 }                   * F3B97
            {                                    * F3BA7
              { BINT2 BINT3                      * F3BAC
                { $ "σx1\0Eσx+σy)/2+\0A(σx-σy)/\08\04\08θ)+\0Aτxy*\05\08θ)" * F3BBB
                  $ "σx1+σy1=σx+σy"              * F3C14
                  $ "τx1y1=-((σx-σy)/2\09\0A\05\08θ)+τxy*\04\08θ)" } * F3C38
              }                                  * F3C87
              { $ "ãâá\12îîàßÞ" # 14 # 7 $ "\03\03\034\03\03\03" } * F3C8C
              ROMPTR 0E2 068 }                   * F3CDE
            {                                    * F3CEE
              { BINT3 BINT7                      * F3CF3
                { $ "σ1\0Eσx+σy)/2+√\0A(((σx-σy)/2)\0C+τxy\0C)" * F3D02
                  $ "σ1+σ2=σx+σy"                * F3D53
                  $ "\05\08θp1)=τxy/√\0A(((σx-σy)/2)\0C+τxy\0C)" * F3D73
                  $ "θp2=θp1+90" $ "τmax\0Eσ1-σ2)/2" $ "θs=θp1-45" * F3DBD
                  $ "σavg\0Eσx+σy)/2" }          * F3E1B
                { CHR_D CHR_D CHR_D $ "θp2=θp1+\01angl)/2" CHR_D * F3E44
                  $ "θs=θp1-\01angl)/4" CHR_D }  * F3E87
              }                                  * F3EB9
              { $ "ãâáîîîêéèçîîæåä" # 1B # A $ "\03\03\03\034\034\034\03" } * F3EBE
              ROMPTR 0E2 069 }                   * F3F22
          }                                      * F3F32
        }                                        * F3F37
