* HP 48GX ROM revision R, #F0DC0-#F3F3B: Library part 0E2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #F0DC0 in the original ROM).
        RPL

* ROMPTR 0E2 01E
* refs (1): E3857
ROMP_0E2_01E:
        {                                        * F0DC0
          ROMPTR  0E2 00C                        * F0DC5
          #       6                              * F0DD0  6
          {                                      * F0DDA
            {                                    * F0DDF
              {                                  * F0DE4
                BINT0                            * F0DE9
                $       "n1*\05θ1)=n\08\05θ2)\0A" * F0DEE
              }                                  * F0E16
              {                                  * F0E1B
                $       "■ΩΠΔ"                   * F0E20
                #       7                        * F0E32  7
                #       4                        * F0E3C  4
                $       "\01\0144"               * F0E46
              }                                  * F0E58
              ROMPTR  0E2 04C                    * F0E5D
            }                                    * F0E68
            {                                    * F0E6D
              {                                  * F0E72
                BINT0                            * F0E77
                $       "\05θc)=n1/n2"           * F0E7C
              }                                  * F0E9A
              {                                  * F0E9F
                $       "■Ω∞"                    * F0EA4
                #       B                        * F0EB4  11
                #       3                        * F0EBE  3
                $       "\01\014"                * F0EC8
              }                                  * F0ED8
              ROMPTR  0E2 04D                    * F0EDD
            }                                    * F0EE8
            {                                    * F0EED
              {                                  * F0EF2
                BINT3                            * F0EF7
                BINT2                            * F0EFC
                {                                * F0F01
                  $       "TAN(θB)=n2/n1"        * F0F06
                  $       "θB+θ2=90"             * F0F2A
                }                                * F0F44
                {                                * F0F49
                  CHR_D                          * F0F4E
                  $       "θB+θ2=\01angl)/2"     * F0F53
                }                                * F0F79
              }                                  * F0F7E
              {                                  * F0F83
                $       "■Ω\A0Δ"                 * F0F88
                #       E                        * F0F9A  14
                #       4                        * F0FA4  4
                $       "\01\0144"               * F0FAE
              }                                  * F0FC0
              ROMPTR  0E2 04E                    * F0FC5
            }                                    * F0FD0
            {                                    * F0FD5
              {                                  * F0FDA
                BINT2                            * F0FDF
                BINT3                            * F0FE4
                {                                * F0FE9
                  $       "1/u+1/v=1/f"          * F0FEE
                  $       "f=1/\08r"             * F100E
                  $       "m=-v/u"               * F1024
                }                                * F103A
              }                                  * F103F
              {                                  * F1044
                $       "¡c.\06d"                * F1049
                #       12                       * F105D  18
                #       5                        * F1067  5
                $       "\18\18\18\18\01"        * F1071
              }                                  * F1085
              ROMPTR  0E2 04F                    * F108A
            }                                    * F1095
            {                                    * F109A
              {                                  * F109F
                BINT0                            * F10A4
                $       "n1/u+n2/v\0En\0Bn1)/r"  * F10A9
              }                                  * F10D5
              {                                  * F10DA
                $       "¡c\06■Ω"                * F10DF
                #       17                       * F10F3  23
                #       5                        * F10FD  5
                $       "\18\18\18\01\01"        * F1107
              }                                  * F111B
              ROMPTR  0E2 050                    * F1120
            }                                    * F112B
            {                                    * F1130
              {                                  * F1135
                BINT2                            * F113A
                BINT3                            * F113F
                {                                * F1144
                  $       "1/u+1/v=1/f"          * F1149
                  $       "1/f\0En-1\09(1/r1-1/r2)\0A" * F1169
                  $       "m=-v/u"               * F119B
                }                                * F11B1
              }                                  * F11B6
              {                                  * F11BB
                $       "¡c.£¢Cd"                * F11C0
                #       1C                       * F11D8  28
                #       7                        * F11E2  7
                $       "\18\18\18\18\18\01\01"  * F11EC
              }                                  * F1204
              ROMPTR  0E2 051                    * F1209
            }                                    * F1214
          }                                      * F1219
        }                                        * F121E

* ROMPTR 0E2 01F
* refs (1): E3857
ROMP_0E2_01F:
        {                                        * F1223
          ROMPTR  0E2 00D                        * F1228
          #       5                              * F1233  5
          {                                      * F123D
            {                                    * F1242
              {                                  * F1247
                BINT3                            * F124C
                BINT3                            * F1251
                {                                * F1256
                  $       "ω=√(k/m)"             * F125B
                  $       "T=\08π/ω"             * F1275
                  $       "ω=\08π*f"             * F128B
                }                                * F12A1
                {                                * F12A6
                  $       "ω=\01\06\09√(\02k/m\0F" * F12AB
                  $       "T=\01\07π)/ω"         * F12CD
                  $       "ω=\01\07π\09f"        * F12E7
                }                                * F12FF
              }                                  * F1304
              {                                  * F1309
                $       "mdu/."                  * F130E
                #       6                        * F1322  6
                #       5                        * F132C  5
                $       "-\08\17\15\16"          * F1336
              }                                  * F134A
              {                                  * F134F
                ROMPTR  0E2 052                  * F1354
                ROMPTR  0E2 053                  * F135F
                ROMPTR  0E2 054                  * F136A
                ROMPTR  0E2 053                  * F1375
              }                                  * F1380
            }                                    * F1385
            {                                    * F138A
              {                                  * F138F
                BINT3                            * F1394
                BINT3                            * F1399
                {                                * F139E
                  $       "ω=√(g/L)"             * F13A3
                  $       "T=\08π/ω"             * F13BD
                  $       "ω=\08π*f"             * F13D3
                }                                * F13E9
                {                                * F13EE
                  $       "ω=\01\06\09√(\02\01g)/L\0F" * F13F3
                  $       "T=\01\07π)/ω"         * F1419
                  $       "ω=\01\07π\09f"        * F1433
                }                                * F144B
              }                                  * F1450
              {                                  * F1455
                $       "\08u/."                 * F145A
                #       B                        * F146C  11
                #       4                        * F1476  4
                $       "\18\17\15\16"           * F1480
              }                                  * F1492
              ROMPTR  0E2 055                    * F1497
            }                                    * F14A2
            {                                    * F14A7
              {                                  * F14AC
                BINT3                            * F14B1
                BINT4                            * F14B6
                {                                * F14BB
                  $       "ω=√(g/h)"             * F14C0
                  $       "h=L*\04θ)"            * F14DA
                  $       "T=\08π/ω"             * F14F2
                  $       "ω=\08π*f"             * F1508
                }                                * F151E
                {                                * F1523
                  $       "ω=\01\06\09√(\02\01g)/h\0F" * F1528
                  CHR_D                          * F154E
                  $       "T=\01\07π)/ω"         * F1553
                  $       "ω=\01\07π\09f"        * F156D
                }                                * F1585
              }                                  * F158A
              {                                  * F158F
                $       "\08B\12u/."             * F1594
                #       F                        * F15AA  15
                #       6                        * F15B4  6
                $       "\18\184\17\15\16"       * F15BE
              }                                  * F15D4
              ROMPTR  0E2 056                    * F15D9
            }                                    * F15E4
            {                                    * F15E9
              {                                  * F15EE
                BINT3                            * F15F3
                BINT3                            * F15F8
                {                                * F15FD
                  $       "ω=√((G*J)\0DL*I\0F"   * F1602
                  $       "T=\08π/ω"             * F1628
                  $       "ω=\08π*f"             * F163E
                }                                * F1654
                {                                * F1659
                  $       "ω=\01\06\09√(\02(G*J)\0DL*I\0F)" * F165E
                  $       "T=\01\07π)/ω"         * F168E
                  $       "ω=\01\07π\09f"        * F16A8
                }                                * F16C0
              }                                  * F16C5
              {                                  * F16CA
                $       "¥¤\08\04uî/."           * F16CF
                #       15                       * F16E9  21
                #       7                        * F16F3  7
                $       "\03\04\18$\17\15\16"    * F16FD
              }                                  * F1715
              ROMPTR  0E2 057                    * F171A
            }                                    * F1725
            {                                    * F172A
              {                                  * F172F
                BINT3                            * F1734
                BINT4                            * F1739
                {                                * F173E
                  $       "x=xm*\04ω*t+Ø)"       * F1743
                  $       "v=-ω*xm*\05ω*t+Ø)"    * F1765
                  $       "a=-ω\0C*xm*\04ω*t+Ø)" * F178D
                  $       "ω=\08π*f"             * F17B7
                }                                * F17CD
                {                                * F17D2
                  CHR_D                          * F17D7
                  $       "v=-ω*xm*\05ω*t+Ø)/\01\06)" * F17DC
                  $       "a=-ω\0C*xm*\04ω*t+Ø)/\01\06)\0C" * F180C
                  $       "ω=\01\07π\09f"        * F1840
                }                                * F1858
              }                                  * F185D
              {                                  * F1862
                $       "¦/.G:î\0Ec\11"          * F1867
                #       1C                       * F1883  28
                #       8                        * F188D  8
                $       "\18\15\164\17\18\09%"   * F1897
              }                                  * F18B1
              ROMPTR  0E2 02A                    * F18B6
            }                                    * F18C1
          }                                      * F18C6
        }                                        * F18CB

* ROMPTR 0E2 020
* refs (1): E3857
ROMP_0E2_020:
        {                                        * F18D0
          ROMPTR  0E2 00E                        * F18D5
          #       6                              * F18E0  6
          {                                      * F18EA
            {                                    * F18EF
              {                                  * F18F4
                BINT2                            * F18F9
                BINT5                            * F18FE
                {                                * F1903
                  $       "A=π*r\0C"             * F1908
                  $       "C=\08π*r"             * F191E
                  $       "I\0Eπ*r^4)/4"         * F1934
                  $       "J\0Eπ*r^4)/2"         * F1952
                  $       "Id=I+A*d\0C"          * F1970
                }                                * F198C
              }                                  * F1991
              {                                  * F1996
                $       "\06\03)îîî\04¤?§"       * F199B
                #       7                        * F19B9  7
                #       7                        * F19C3  7
                $       "\18\11\18\04\04\18\04"  * F19CD
              }                                  * F19E5
              ROMPTR  0E2 058                    * F19EA
            }                                    * F19F5
            {                                    * F19FA
              {                                  * F19FF
                BINT2                            * F1A04
                BINT5                            * F1A09
                {                                * F1A0E
                  $       "A=π*b*h"              * F1A13
                  $       "C=\08π*√((b\0C+h\0C)/2)" * F1A2B
                  $       "I\0Eπ*b*h^3)/4"       * F1A57
                  $       "J\0E(π*b*h)/4*\0A(b\0C+h\0C\0F" * F1A79
                  $       "Id=I+A*d\0C"          * F1AAB
                }                                * F1AC7
              }                                  * F1ACC
              {                                  * F1AD1
                $       "¨B\03)îî\04¤?§"         * F1AD6
                #       E                        * F1AF4  14
                #       8                        * F1AFE  8
                $       "\18\18\11\18\04\04\18\04" * F1B08
              }                                  * F1B22
              ROMPTR  0E2 059                    * F1B27
            }                                    * F1B32
            {                                    * F1B37
              {                                  * F1B3C
                BINT2                            * F1B41
                BINT5                            * F1B46
                {                                * F1B4B
                  $       "A=b*h"                * F1B50
                  $       "P=\08b+\08h"          * F1B64
                  $       "I\0Eb*h^3)/12"        * F1B7C
                  $       "J\0Eb*h)/1\08(b\0C+h\0C)" * F1B9C
                  $       "Id=I+A*d\0C"          * F1BC6
                }                                * F1BE2
              }                                  * F1BE7
              {                                  * F1BEC
                $       "¨B\03\0Aîî\04¤?§"       * F1BF1
                #       16                       * F1C0F  22
                #       8                        * F1C19  8
                $       "\18\18\11\18\04\04\18\04" * F1C23
              }                                  * F1C3D
              ROMPTR  0E2 05A                    * F1C42
            }                                    * F1C4D
            {                                    * F1C52
              {                                  * F1C57
                BINT3                            * F1C5C
                BINT6                            * F1C61
                {                                * F1C66
                  $       "A\0E1/4*n*L\0C)/\0ATAN(180/n)" * F1C6B
                  $       "P=n*L"                * F1CA3
                  $       "rs\0EL/2)/TAN(180/n)" * F1CB7
                  $       "rv\0EL/2)/\05180/n)"  * F1CE5
                  $       "θ\0En-2)/n*180"       * F1D0D
                  $       "ß=360/n"              * F1D2F
                }                                * F1D47
                {                                * F1D4C
                  $       "A\0E1/4*n*L\0C)/TAN(\01angl)/n)" * F1D51
                  CHR_D                          * F1D8D
                  $       "rs\0EL/2)/TAN(\01angl)/n)" * F1D92
                  $       "rv\0EL/2)/\05\01angl)/n)" * F1DC6
                  $       "θ\0En-2)/n*\01angl)"  * F1DF4
                  $       "ß=\08\01angl)/n"      * F1E1C
                }                                * F1E3C
              }                                  * F1E41
              {                                  * F1E46
                $       "C\08«ª\03\0A\12©"       * F1E4B
                #       1E                       * F1E65  30
                #       8                        * F1E6F  8
                $       "\01\18\18\18\11\1844"   * F1E79
              }                                  * F1E93
              ROMPTR  0E2 05B                    * F1E98
            }                                    * F1EA3
            {                                    * F1EA8
              {                                  * F1EAD
                BINT2                            * F1EB2
                BINT4                            * F1EB7
                {                                * F1EBC
                  $       "A=π\10ro\0C-ri\0C)"   * F1EC1
                  $       "I=π/4\10ro^4-ri^4)"   * F1EE3
                  $       "J=π/\08(ro^4-ri^4)"   * F1F0D
                  $       "Id=I+A*d\0C"          * F1F37
                }                                * F1F53
              }                                  * F1F58
              {                                  * F1F5D
                $       "A@\03îîî\04¤?§"         * F1F62
                #       26                       * F1F80  38
                #       7                        * F1F8A  7
                $       "\18\18\11\04\04\18\04"  * F1F94
              }                                  * F1FAC
              ROMPTR  0E2 05C                    * F1FB1
            }                                    * F1FBC
            {                                    * F1FC1
              {                                  * F1FC6
                BINT2                            * F1FCB
                BINT6                            * F1FD0
                {                                * F1FD5
                  $       "A\0Eb*h)/2"           * F1FDA
                  $       "P=b+√(v\0C+h\0C)+\0A√((b-v)\0C+h\0C)" * F1FF4
                  $       "Ix\0Eb*h^3)/36"       * F2032
                  $       "Iy\0Eb*h)/36*\0A(b\0C-b*v+v\0C)" * F2054
                  $       "J\0Eb*h)/36*\0A(h\0C+b\0C-b*v+v\0C)" * F208C
                  $       "Id=Ix+A*d\0C"         * F20C8
                }                                * F20E6
              }                                  * F20EB
              {                                  * F20F0
                $       "¨Bc\03\0Aî\AD¬¤?§"      * F20F5
                #       2D                       * F2115  45
                #       A                        * F211F  10
                $       "\18\18\18\11\18\04\04\04\18\04" * F2129
              }                                  * F2147
              ROMPTR  0E2 05D                    * F214C
            }                                    * F2157
          }                                      * F215C
        }                                        * F2161

* ROMPTR 0E2 021
* refs (1): E3857
ROMP_0E2_021:
        {                                        * F2166
          ROMPTR  0E2 00F                        * F216B
          #       4                              * F2176  4
          {                                      * F2180
            {                                    * F2185
              {                                  * F218A
                BINT2                            * F218F
                BINT5                            * F2194
                {                                * F2199
                  $       "V\0Eπ/3\09r\0C*h"     * F219E
                  $       "A=π*r\0C+π*r*\0A√(r\0C+h\0C)" * F21BC
                  $       "Ixx\0E3/20\09m*r\0C+\0A(3/80\09m*h\0C" * F21EE
                  $       "Izz\0E3/10\09m*r\0C"  * F222A
                  $       "Id=Ixx+m*d\0C"        * F224E
                }                                * F226E
              }                                  * F2273
              ROMPTR  0E2 028                    * F2278
              ROMPTR  0E2 05E                    * F2283
            }                                    * F228E
            {                                    * F2293
              {                                  * F2298
                BINT2                            * F229D
                BINT5                            * F22A2
                {                                * F22A7
                  $       "V=π*r\0C*h"           * F22AC
                  $       "A=\08π*r\0C+\08π*r*h" * F22C6
                  $       "Ixx\0E1/4\09m*r\0C+\0A(1/12\09m*h\0C" * F22EC
                  $       "Izz\0E1/2\09m*r\0C"   * F2326
                  $       "Id=Ixx+m*d\0C"        * F2348
                }                                * F2368
              }                                  * F236D
              ROMPTR  0E2 028                    * F2372
              ROMPTR  0E2 05F                    * F237D
            }                                    * F2388
            {                                    * F238D
              {                                  * F2392
                BINT2                            * F2397
                BINT4                            * F239C
                {                                * F23A1
                  $       "V=b*h*t"              * F23A6
                  $       "A=\08(b*h+b*t+h*t)"   * F23BE
                  $       "I\0E1/12\09m\10h\0C+t\0C)" * F23E8
                  $       "Id=I+m*d\0C"          * F2410
                }                                * F242C
              }                                  * F2431
              {                                  * F2436
                $       "¨B:\14\03îd\04?§"       * F243B
                #       E                        * F2459  14
                #       9                        * F2463  9
                $       "\18\18\18#\11\08$\18$"  * F246D
              }                                  * F2489
              ROMPTR  0E2 060                    * F248E
            }                                    * F2499
            {                                    * F249E
              {                                  * F24A3
                BINT2                            * F24A8
                BINT4                            * F24AD
                {                                * F24B2
                  $       "V\0E4/3\09π*r^3"      * F24B7
                  $       "A=4*π*r\0C"           * F24D7
                  $       "I\0E2/5\09m*r\0C"     * F24F1
                  $       "Id=I+m*d\0C"          * F250F
                }                                * F252B
              }                                  * F2530
              {                                  * F2535
                $       "\06\14\03îîîd\04?§"     * F253A
                #       17                       * F2558  23
                #       7                        * F2562  7
                $       "\18#\11\08$\18$"        * F256C
              }                                  * F2584
              ROMPTR  0E2 061                    * F2589
            }                                    * F2594
          }                                      * F2599
        }                                        * F259E

* ROMPTR 0E2 022
* refs (1): E3857
ROMP_0E2_022:
        {                                        * F25A3
          ROMPTR  0E2 010                        * F25A8
          #       4                              * F25B3  4
          {                                      * F25BD
            {                                    * F25C2
              {                                  * F25C7
                BINT3                            * F25CC
                BINT8                            * F25D1
                {                                * F25D6
                  $       "Vbi\0Ek*T)/q*LN((NA*\0AND)/ni\0C)" * F25DB
                  $       "xd=√((\08εsi*ε0)/q*\0A(Vbi-Va\09(1/NA+1/ND\0F" * F261B
                  $       "Cj\0Eεsi*ε0)/xd"      * F266F
                  $       "Emax=\08(Vbi-Va)/xd"  * F2693
                  $       "BV\0Eεsi*ε0*E1\0C)/\0A(\08q\09(1/NA+1/ND)" * F26BF
                  $       "J=Js\10e^((q*Va)/\0A(k*T\0F-1)" * F2707
                  $       "Aj\0EW+\08ΔW\09(L+\08ΔL)+\0Aπ\10W+L+\08ΔW+\08ΔL\09xj+\0A\08π*xj\0C" * F2741
                  $       "I=J*Aj"               * F279F
                }                                * F27B5
                {                                * F27BA
                  $       "Vbi=\01kq\09\02T\09LN(\02NA*ND/SIDENS(T)\0C\0F" * F27BF
                  $       "xd=√(\02\08\01εsi\09\01ε0q\09(Vbi-Va\09(1/NA+1/ND\0F)" * F2809
                  $       "Cj=\01εsi\09\01ε0)/xd" * F285D
                  CHR_D                          * F2885
                  $       "BV\0E\01εsi\09\01ε0q\09E1\0C)/\08(1/NA+1/ND)" * F288A
                  $       "J=Js\10EXP(\02Va\0D\01kq\09\02T\0F\0F-1)" * F28D0
                  CHR_D                          * F290A
                  CHR_D                          * F290F
                }                                * F2914
              }                                  * F2919
              {                                  * F291E
                $       "½¼u»º¹W¸\08·¶µ¤´³\04²î±°" * F2923
                #       5                        * F2955  5
                #       13                       * F295F  19
                $       "OOFP\0CSQQQQQQGDRH\0CS\0C" * F2969
              }                                  * F2999
              ROMPTR  0E2 062                    * F299E
            }                                    * F29A9
            {                                    * F29AE
              {                                  * F29B3
                BINT3                            * F29B8
                BINT10                           * F29BD
                {                                * F29C2
                  $       "We=W-\08ΔW"           * F29C7
                  $       "Le=L-\08ΔL"           * F29E1
                  $       "Cox\0Eεox*ε0)/tox"    * F29FB
                  $       "IDS=Cox*µn\10We/Le\09\0A((VGS-Vt\09VDS-VDS\0C/2)\0A\101+λ*VDS)" * F2A23
                  $       "γ=√(\08εsi*ε0*q*NA)/\0ACox" * F2A8D
                  $       "Vt=Vt0+γ\10√(\08ABS(Øp)\0A+ABS(VBS\0F-√(\08ABS(Øp)\0A\0F" * F2AC3
                  $       "Øp=-k*T/q*LN(NA/ni)"  * F2B21
                  $       "gds=IDS*λ"            * F2B51
                  $       "gm=√(Cox*µn\10We/Le\09\0A(1+λ*VDS\09\08IDS)" * F2B6D
                  $       "VDsat=VGS-Vt"         * F2BB9
                }                                * F2BDB
                {                                * F2BE0
                  CHR_D                          * F2BE5
                  CHR_D                          * F2BEA
                  $       "Cox\0E\01εox\09\01ε0\0F/tox" * F2BEF
                  $       "IDS=\03VGS<Vt;0;\03VDS≤VGS-Vt;Cox*µn\10We/Le\09((VGS-Vt\09VDS-VDS\0C/2\09(1+λ*VDS);(Cox*µn/2\09(We/Le\09(VGS-Vt)\0C\101+λ*VDS\0F)" * F2C1B
                  $       "γ\0C\0E\08\01εsi\09\01qε0\09NA)/Cox\0C" * F2CF7
                  $       "Vt=Vt0+√(\02γ\0C\104*ABS(Øp)+ABS(VBS)-\08√(\02(\08ABS(Øp)+ABS(VBS\0F*\08ABS(Øp\0F\0F\0F" * F2D2D
                  $       "Øp=-\01kq\09\02T\09LN(\02NA/SIDENS(T\0F)" * F2DB9
                  CHR_D                          * F2DFB
                  $       "gm=\03VGS<Vt;0;\03VDS≤VGS-Vt;Cox*µn\10We/Le\09VDS\101+λ*VDS);√(\02Cox*µn\10We/Le\09(1+λ*VDS\09\08IDS\0F\0F" * F2E00
                  CHR_D                          * F2EAE
                }                                * F2EB3
              }                                  * F2EB8
              {                                  * F2EBD
                $       "ÌË¼*ÊuÉÈÇÆÅÄW¸\08·ÃÂÁÀ¿¾\7F" * F2EC2
                #       18                       * F2EFA  24
                #       17                       * F2F04  23
                $       "NRO\0CTF\0CU\0C\0C\0C\0CQQQQQQHL\0CIJ" * F2F0E
              }                                  * F2F46
              ROMPTR  0E2 063                    * F2F4B
            }                                    * F2F56
            {                                    * F2F5B
              {                                  * F2F60
                BINT3                            * F2F65
                BINT8                            * F2F6A
                {                                * F2F6F
                  $       "IE=-IES\10e^((q*VBE)/\0A(k*T\0F-1)+αR*ICS*\0A(e^((q*VBC)\0Dk*T\0F-1)" * F2F74
                  $       "IC=-ICS\10e^((q*VBC)/\0A(k*T\0F-1)+αF*IES*\0A(e^((q*VBE)\0Dk*T\0F-1)" * F2FEE
                  $       "IS=αF*IES"            * F3068
                  $       "IS=αR*ICS"            * F3084
                  $       "IB+IE+IC=0"           * F30A0
                  $       "ICO=ICS\101-αF*αR)"   * F30BE
                  $       "ICEO=ICO\0D1-αF)"     * F30E8
L_F310E:
                  $       "VCEsat\0Ek*T)/q*LN((1+\0AIC/IB\101-αR\0F\0DαR\101-\0AIC/IB\10(1-αF)/αF\0F\0F" * F310E
                }                                * F3188
                {                                * F318D
                  $       "IE=-IES\10EXP(\02VBE\0D\01kq\09\02T\0F\0F-1)+αR*ICS\10EXP(\02VBC\0D\01kq\09\02T\0F\0F-1)" * F3192
                  $       "IC=-ICS\10EXP(\02VBC\0D\01kq\09\02T\0F\0F-1)+αF*IES\10EXP(\02VBE\0D\01kq\09\02T\0F\0F-1)" * F320C
                  CHR_D                          * F3286
                  CHR_D                          * F328B
                  CHR_D                          * F3290
                  CHR_D                          * F3295
                  CHR_D                          * F329A
                  $       "VCEsat=\03\02IC/IB\09((1-αF)/αF)≥1;0;\01kq\09\02T\09LN((1+\02IC/IB\09(1-αR\0F\0DαR\101-\02IC/IB\09((1-αF)/αF\0F\0F)" * F329F
                }                                * F334F
              }                                  * F3354
              {                                  * F3359
                $       "ÙØ×uÖÕÔÓÒÑÐîÏÎÍ"        * F335E
                #       2F                       * F3386  47
                #       E                        * F3390  14
                $       "KKKF\01\01HHHKK\0C\0C\0C" * F339A
              }                                  * F33C0
              ROMPTR  0E2 064                    * F33C5
            }                                    * F33D0
            {                                    * F33D5
              {                                  * F33DA
                BINT3                            * F33DF
                BINT7                            * F33E4
                {                                * F33E9
                  $       "Vbi\0Ek*T)/q*LN(ND/ni)\0A" * F33EE
                  $       "xdmax=√((\08εsi*ε0)/\0A(q*ND\09(Vbi-VGS+VDS\0F" * F3422
                  $       "G0=q*ND*µn\10a*W/L)"  * F3478
                  $       "ID=G0\10VDS-2/3*√(\0A(\08εsi*ε0)\0Dq*ND*a\0C\0F\0A\10(Vbi-VGS+VDS)^(3/2)-\0A(Vbi-VGS)^(3/2\0F)" * F34A4
                  $       "VDsat\0Eq*ND*a\0C)/\0A(\08εsi*ε0)-(Vbi-VGS)" * F3542
                  $       "Vt=Vbi-q*ND*a\0C/\0A(\08εsi*ε0)" * F3592
                  $       "gm=G0\101-√(\08εsi*ε0/\0A(q*ND*a\0C\09(Vbi-VGS\0F)\0A" * F35CE
                }                                * F3626
                {                                * F362B
                  $       "Vbi=\01kq\09\02T\09LN(\02ND/SIDENS(T\0F)" * F3630
                  $       "xdmax=√(\02(\08\01εsi\09\01ε0q\0F/ND\10Vbi-VGS+VDS\0F)" * F3672
                  $       "G0=\01q\09ND*µn\10a*W/L)" * F36C8
                  $       "ID=\03xdmax<a;G0\10VDS-2/3\10√(\02(\08\01εsi\09\01ε0q\0F\0DND*a\0C\09(Vbi-VGS+VDS)^3\0F-√(\02(\08\01εsi\09\01ε0q\0F\0DND*a\0C\09(Vbi-VGS)^3\0F\0F;G0\10ND*a\0C\0D6*\01εsi\09\01ε0q\0F-(Vbi-VGS\09(1-2/3*√(\02(\08\01εsi\09\01ε0q)\0DND*a\0C\0F\10Vbi-VGS\0F\0F\0F" * F36F6
                  $       "VDsat\0END*a\0C)\0D\08\01εsi\09\01ε0q\0F-(Vbi-VGS)" * F3852
                  $       "Vt=Vbi-ND*a\0C\0D\08\01εsi\09\01ε0q\0F" * F38A0
                  $       "gm=G0\101-√(\02(\08\01εsi\09\01ε0q\0F\0DND*a\0C\09(Vbi-VGS\0F\0F" * F38DA
                }                                * F3934
              }                                  * F3939
              {                                  * F393E
                $       "½W\11\08ÊîÇÆÄ²¿ÜuÛÚ¾"   * F3943
                #       3D                       * F396D  61
                #       F                        * F3977  15
                $       "OQQQT\0C\0C\0C\0C\0CHFLQI" * F3981
              }                                  * F39A9
              ROMPTR  0E2 065                    * F39AE
            }                                    * F39B9
          }                                      * F39BE
        }                                        * F39C3

* ROMPTR 0E2 023
* refs (1): E3857
ROMP_0E2_023:
        {                                        * F39C8
          ROMPTR  0E2 011                        * F39CD
          #       4                              * F39D8  4
          {                                      * F39E2
            {                                    * F39E7
              {                                  * F39EC
                BINT2                            * F39F1
                BINT3                            * F39F6
                {                                * F39FB
                  $       "σ=E*ε"                * F3A00
                  $       "ε=δ/L"                * F3A14
                  $       "σ=P/A"                * F3A28
                }                                * F3A3C
              }                                  * F3A41
              {                                  * F3A46
                $       "\0A\08\03\05îî∇\0CÝ"    * F3A4B
                #       5                        * F3A67  5
                #       7                        * F3A71  7
                $       "\05\02\11\03\18\01\03"  * F3A7B
              }                                  * F3A93
              ROMPTR  0E2 066                    * F3A98
            }                                    * F3AA3
            {                                    * F3AA8
              {                                  * F3AAD
                BINT3                            * F3AB2
                BINT3                            * F3AB7
                {                                * F3ABC
                  $       "τ=G*γ"                * F3AC1
                  $       "γ\0Er*Ø)/L"           * F3AD5
                  $       "τ\0ET*r)/J"           * F3AEF
                }                                * F3B09
                {                                * F3B0E
                  $       "τ=G*γ/\01\06)"        * F3B13
                  CHR_D                          * F3B2F
                  CHR_D                          * F3B34
                }                                * F3B39
              }                                  * F3B3E
              {                                  * F3B43
                $       "u\08\06¤¥îGÈh"          * F3B48
                #       C                        * F3B64  12
                #       8                        * F3B6E  8
                $       "\"\02\18\04\0344\03"    * F3B78
              }                                  * F3B92
              ROMPTR  0E2 067                    * F3B97
            }                                    * F3BA2
            {                                    * F3BA7
              {                                  * F3BAC
                BINT2                            * F3BB1
                BINT3                            * F3BB6
                {                                * F3BBB
                  $       "σx1\0Eσx+σy)/2+\0A(σx-σy)/\08\04\08θ)+\0Aτxy*\05\08θ)" * F3BC0
                  $       "σx1+σy1=σx+σy"        * F3C14
                  $       "τx1y1=-((σx-σy)/2\09\0A\05\08θ)+τxy*\04\08θ)" * F3C38
                }                                * F3C82
              }                                  * F3C87
              {                                  * F3C8C
                $       "ãâá\12îîàßÞ"            * F3C91
                #       14                       * F3CAD  20
                #       7                        * F3CB7  7
                $       "\03\03\034\03\03\03"    * F3CC1
              }                                  * F3CD9
              ROMPTR  0E2 068                    * F3CDE
            }                                    * F3CE9
            {                                    * F3CEE
              {                                  * F3CF3
                BINT3                            * F3CF8
                BINT7                            * F3CFD
                {                                * F3D02
                  $       "σ1\0Eσx+σy)/2+√\0A(((σx-σy)/2)\0C+τxy\0C)" * F3D07
                  $       "σ1+σ2=σx+σy"          * F3D53
                  $       "\05\08θp1)=τxy/√\0A(((σx-σy)/2)\0C+τxy\0C)" * F3D73
                  $       "θp2=θp1+90"           * F3DBD
                  $       "τmax\0Eσ1-σ2)/2"      * F3DDB
                  $       "θs=θp1-45"            * F3DFF
                  $       "σavg\0Eσx+σy)/2"      * F3E1B
                }                                * F3E3F
                {                                * F3E44
                  CHR_D                          * F3E49
                  CHR_D                          * F3E4E
                  CHR_D                          * F3E53
                  $       "θp2=θp1+\01angl)/2"   * F3E58
                  CHR_D                          * F3E82
                  $       "θs=θp1-\01angl)/4"    * F3E87
                  CHR_D                          * F3EAF
                }                                * F3EB4
              }                                  * F3EB9
              {                                  * F3EBE
                $       "ãâáîîîêéèçîîæåä"        * F3EC3
                #       1B                       * F3EEB  27
                #       A                        * F3EF5  10
                $       "\03\03\03\034\034\034\03" * F3EFF
              }                                  * F3F1D
              ROMPTR  0E2 069                    * F3F22
            }                                    * F3F2D
          }                                      * F3F32
        }                                        * F3F37
