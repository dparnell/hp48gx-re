* HP 48GX ROM revision R, #EDBBA-#F0DBF: Library part 0E2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #EDBBA in the original ROM).
        RPL

* ROMPTR 0E2 018
* refs (1): E3857
ROMP_0E2_018:
        {                                        * EDBBA
          ROMPTR  0E2 006                        * EDBBF
          #       4                              * EDBCA  4
          {                                      * EDBD4
            {                                    * EDBD9
              {                                  * EDBDE
                BINT1                            * EDBE3
                $       "P=P0+ρ*g*h"             * EDBE8
                $       "P=P0+ρ*\01g\09h"        * EDC06
              }                                  * EDC26
              {                                  * EDC2B
                $       "I\0AB\1E"               * EDC30
                #       5                        * EDC42  5
                #       4                        * EDC4C  4
                $       "\03\03\023"             * EDC56
              }                                  * EDC68
              ROMPTR  0E2 03B                    * EDC6D
            }                                    * EDC78
            {                                    * EDC7D
              {                                  * EDC82
                BINT3                            * EDC87
                BINT10                           * EDC8C
                {                                * EDC91
                  $       "ΔP/ρ+(v2\0C-v1\0C)/2+\0Ag*Δy=0" * EDC96
                  $       "ΔP/ρ+v2\0C\101-(A2/\0AA1)\0C)/2+g*Δy=0" * EDCD0
                  $       "ΔP/ρ+v1\0C\10(A1/A2)\0C-\0A1)/2+g*Δy=0" * EDD16
                  $       "ΔP=P\0BP1"            * EDD5C
                  $       "Δy=y\0By1"            * EDD74
                  $       "M=ρ*Q"                * EDD8C
                  $       "Q=A\08v2"             * EDDA0
                  $       "Q=A1*v1"              * EDDB6
                  $       "A1\0Eπ*D1\0C)/4"      * EDDCE
                  $       "A2\0Eπ*D2\0C)/4"      * EDDEE
                }                                * EDE0E
                {                                * EDE13
                  $       "ΔP/ρ+(v2\0C-v1\0C)/2+\01g\09Δy=0" * EDE18
                  $       "ΔP/ρ+v2\0C\101-(A2/A1)\0C)/2+\01g\09Δy=0" * EDE52
                  $       "ΔP/ρ+v1\0C\10(A1/A2)\0C-1)/2+\01g\09Δy=0" * EDE98
                  CHR_D                          * EDEDE
                  CHR_D                          * EDEE3
                  CHR_D                          * EDEE8
                  CHR_D                          * EDEED
                  CHR_D                          * EDEF2
                  CHR_D                          * EDEF7
                  CHR_D                          * EDEFC
                }                                * EDF01
              }                                  * EDF06
              {                                  * EDF0B
                $       "VUTSRQPONMLK\1EJ\10"    * EDF10
                #       9                        * EDF38  9
                #       F                        * EDF42  15
                $       "\03\03\03\02\02\02\09\09\11\11\18\183?@" * EDF4C
              }                                  * EDF74
              ROMPTR  0E2 03C                    * EDF79
            }                                    * EDF84
            {                                    * EDF89
              {                                  * EDF8E
                BINT3                            * EDF93
                BINT10                           * EDF98
                {                                * EDF9D
                  $       "M\10ΔP/ρ+(v2\0C-v1\0C)/\0A2+g*Δy+hL)=W" * EDFA2
                  $       "M\10ΔP/ρ+v2\0C\101-(A2/\0AA1)\0C)/2+g*Δy+hL)=W" * EDFE8
                  $       "M\10ΔP/ρ+v1\0C\10(A1/A2)\0A\0C-1)/2+g*Δy+hL)=W" * EE03A
                  $       "ΔP=P\0BP1"            * EE08C
                  $       "Δy=y\0By1"            * EE0A4
                  $       "M=ρ*Q"                * EE0BC
                  $       "Q=A\08v2"             * EE0D0
                  $       "Q=A1*v1"              * EE0E6
                  $       "A1\0Eπ*D1\0C)/4"      * EE0FE
                  $       "A2\0Eπ*D2\0C)/4"      * EE11E
                }                                * EE13E
                {                                * EE143
                  $       "M\10ΔP/ρ+(v2\0C-v1\0C)/2+\01g\09Δy+hL)=W" * EE148
                  $       "M\10ΔP/ρ+v2\0C\101-(A2/A1)\0C)/2+\01g\09Δy+hL)=W" * EE18E
                  $       "M\10ΔP/ρ+v1\0C\10(A1/A2)\0C-1)/2+\01g\09Δy+hL)=W" * EE1E0
                  CHR_D                          * EE232
                  CHR_D                          * EE237
                  CHR_D                          * EE23C
                  CHR_D                          * EE241
                  CHR_D                          * EE246
                  CHR_D                          * EE24B
                  CHR_D                          * EE250
                }                                * EE255
              }                                  * EE25A
              {                                  * EE25F
                $       "VUTSRQPONMLK\1EJ\10XW"  * EE264
                #       18                       * EE290  24
                #       11                       * EE29A  17
                $       "\03\03\03\02\02\02\09\09\11\11\18\183?@A<" * EE2A4
              }                                  * EE2D0
              ROMPTR  0E2 03D                    * EE2D5
            }                                    * EE2E0
            {                                    * EE2E5
              {                                  * EE2EA
                BINT3                            * EE2EF
                BINT8                            * EE2F4
                {                                * EE2F9
                  $       "ρ\10π*D\0C/4\09vavg*\0A(ΔP/ρ+g*Δy+vavg\0C*\0A(\08f\10L/D)+ΣK/2\0F=W" * EE2FE
                  $       "ΔP=P\0BP1"            * EE36A
                  $       "Δy=y\0By1"            * EE382
                  $       "M=ρ*Q"                * EE39A
                  $       "Q=A*vavg"             * EE3AE
                  $       "A\0Eπ*D\0C)/4"        * EE3C8
                  $       "Re=D*vavg*ρ/µ"        * EE3E4
                  $       "n=µ/ρ"                * EE408
                }                                * EE41C
                {                                * EE421
                  $       "ρ\10π*D\0C/4\09vavg\10ΔP/ρ+\01g\09Δy+vavg\0C\10\08FANNING(ε/D;D*vavg*ρ/µ\09(L/D)+ΣK/2\0F=W" * EE426
                  CHR_D                          * EE4B8
                  CHR_D                          * EE4BD
                  CHR_D                          * EE4C2
                  CHR_D                          * EE4C7
                  CHR_D                          * EE4CC
                  CHR_D                          * EE4D1
                  CHR_D                          * EE4D6
                }                                * EE4DB
              }                                  * EE4E0
              {                                  * EE4E5
                $       "VUTSRQ]\03\\\08\0C[\1EZCJ\10WY" * EE4EA
                #       29                       * EE51A  41
                #       13                       * EE524  19
                $       "\03\03\03\02\02\02\09\11\18\02\18\013=>?@<\01" * EE52E
              }                                  * EE55E
              ROMPTR  0E2 03E                    * EE563
            }                                    * EE56E
          }                                      * EE573
        }                                        * EE578

* ROMPTR 0E2 019
* refs (1): E3857
ROMP_0E2_019:
        {                                        * EE57D
          ROMPTR  0E2 007                        * EE582
          #       8                              * EE58D  8
          {                                      * EE597
            {                                    * EE59C
              {                                  * EE5A1
                BINT2                            * EE5A6
                BINT8                            * EE5AB
                {                                * EE5B0
                  $       "F=m*a"                * EE5B5
                  $       "Ki=1/\08m*vi\0C"      * EE5C9
                  $       "Kf=1/\08m*vf\0C"      * EE5E9
                  $       "W=F*x"                * EE609
                  $       "W=Kf-Ki"              * EE61D
                  $       "P=F*v"                * EE635
                  $       "Pavg=W/t"             * EE649
                  $       "vf=vi+a*t"            * EE663
                }                                * EE67F
              }                                  * EE684
              {                                  * EE689
                $       "d\11cba\0E:\15`_îîW\0A^" * EE68E
                #       9                        * EE6B6  9
                #       D                        * EE6C0  13
                $       "\08%\09\09\09\02\17\0BBBB<<" * EE6CA
              }                                  * EE6EE
              ROMPTR  0E2 02A                    * EE6F3
            }                                    * EE6FE
            {                                    * EE703
              {                                  * EE708
                BINT3                            * EE70D
                BINT12                           * EE712
                {                                * EE717
                  $       "τ=I*α"                * EE71C
                  $       "Ki=1/\08I*ωi\0C"      * EE730
                  $       "Kf=1/\08I*ωf\0C"      * EE750
                  $       "W=τ*θ"                * EE770
                  $       "W=Kf-Ki"              * EE784
                  $       "P=τ*ω"                * EE79C
                  $       "Pavg=W/t"             * EE7B0
                  $       "ωf=ωi+α*t"            * EE7CA
                  $       "at=α*r"               * EE7E6
                  $       "ω=\08π*N"             * EE7FC
                  $       "ωi=\08π*Ni"           * EE812
                  $       "ωf=\08π*Nf"           * EE82C
                }                                * EE846
                {                                * EE84B
                  $       "τ=I*α/\01\06)"        * EE850
                  $       "Ki=1/\08I*ωi\0C/\01\06)\0C" * EE86C
                  $       "Kf=1/\08I*ωf\0C/\01\06)\0C" * EE896
                  $       "W=τ*θ/\01\06)"        * EE8C0
                  CHR_D                          * EE8DC
                  $       "P=τ*ω/\01\06)"        * EE8E1
                  CHR_D                          * EE8FD
                  CHR_D                          * EE902
                  $       "at=α*r/\01\06)"       * EE907
                  $       "ω=\01\07π\09N"        * EE925
                  $       "ωi=\01\07π\09Ni"      * EE93D
                  $       "ωf=\01\07π\09Nf"      * EE959
                }                                * EE975
              }                                  * EE97A
              {                                  * EE97F
                $       "\04k/ji\12:h`_îîW\0A^îîîg\06Efe" * EE984
                #       16                       * EE9BC  22
                #       12                       * EE9C6  18
                $       "$&''')5\"BBB<<%\18EEE"  * EE9D0
              }                                  * EE9FE
              ROMPTR  0E2 02A                    * EEA03
            }                                    * EEA0E
            {                                    * EEA13
              {                                  * EEA18
                BINT3                            * EEA1D
                BINT4                            * EEA22
                {                                * EEA27
                  $       "F=m*ω\0C*r"           * EEA2C
                  $       "ω=v/r"                * EEA46
                  $       "ar=v\0C/r"            * EEA5A
                  $       "ω=\08π*N"             * EEA72
                }                                * EEA88
                {                                * EEA8D
                  $       "F=m*ω\0C*r/\01\06)\0C" * EEA92
                  $       "ω=\01\06\09v/r"       * EEAB6
                  CHR_D                          * EEAD0
                  $       "ω=\01\07π\09N"        * EEAD5
                }                                * EEAED
              }                                  * EEAF2
              {                                  * EEAF7
                $       "d\06cl/\15E"            * EEAFC
                #       28                       * EEB14  40
                #       7                        * EEB1E  7
                $       "\08\18\09%'\0BE"        * EEB28
              }                                  * EEB40
              ROMPTR  0E2 02A                    * EEB45
            }                                    * EEB50
            {                                    * EEB55
              {                                  * EEB5A
                BINT2                            * EEB5F
                BINT2                            * EEB64
                {                                * EEB69
                  $       "F=-k*x"               * EEB6E
                  $       "W=-1/\08k*x\0C"       * EEB84
                }                                * EEBA2
              }                                  * EEBA7
              {                                  * EEBAC
                $       "m\0E\15W"               * EEBB1
                #       2F                       * EEBC3  47
                #       4                        * EEBCD  4
                $       "-\18\0BB"               * EEBD7
              }                                  * EEBE9
              ROMPTR  0E2 03F                    * EEBEE
            }                                    * EEBF9
            {                                    * EEBFE
              {                                  * EEC03
                BINT2                            * EEC08
                BINT2                            * EEC0D
                {                                * EEC12
                  $       "v1f\0Em1-m2)\0Dm1+m2\09\0Av1i" * EEC17
                  $       "v2f\0E\08m1)\0Dm1+m2\09\0Av1i" * EEC4B
                }                                * EEC7B
              }                                  * EEC80
              {                                  * EEC85
                $       "rqpon"                  * EEC8A
                #       33                       * EEC9E  51
                #       5                        * EECA8  5
                $       "\08\08\09\09\09"        * EECB2
              }                                  * EECC6
              ROMPTR  0E2 040                    * EECCB
            }                                    * EECD6
            {                                    * EECDB
              {                                  * EECE0
                BINT0                            * EECE5
                $       "F=Cd\10(ρ*v\0C)/2\09A"  * EECEA
              }                                  * EED12
              {                                  * EED17
                $       "s\1E\03c\15"            * EED1C
                #       38                       * EED30  56
                #       5                        * EED3A  5
                $       "\013\11\09\0B"          * EED44
              }                                  * EED58
              ROMPTR  0E2 02A                    * EED5D
            }                                    * EED68
            {                                    * EED6D
              {                                  * EED72
                BINT1                            * EED77
                $       "F=G\10(m1*m2)/r\0C)"    * EED7C
                $       "F=\01G\09((m1*m2)/r\0C)" * EEDA4
              }                                  * EEDD0
              {                                  * EEDD5
                $       "rq\06\15"               * EEDDA
                #       3D                       * EEDEC  61
                #       4                        * EEDF6  4
                $       "\08\08C\0B"             * EEE00
              }                                  * EEE12
              ROMPTR  0E2 02A                    * EEE17
            }                                    * EEE22
            {                                    * EEE27
              {                                  * EEE2C
                BINT1                            * EEE31
                $       "E=m*c\0C"               * EEE36
                $       "E=m*\01c)\0C"           * EEE4C
              }                                  * EEE66
              {                                  * EEE6B
                $       "d\05"                   * EEE70
                #       41                       * EEE7E  65
                #       2                        * EEE88  2
                $       "\08B"                   * EEE92
              }                                  * EEEA0
              ROMPTR  0E2 02A                    * EEEA5
            }                                    * EEEB0
          }                                      * EEEB5
        }                                        * EEEBA

* ROMPTR 0E2 01A
* refs (1): E3857
ROMP_0E2_01A:
        {                                        * EEEBF
          ROMPTR  0E2 008                        * EEEC4
          #       8                              * EEECF  8
          {                                      * EEED9
            {                                    * EEEDE
              {                                  * EEEE3
                BINT3                            * EEEE8
                BINT2                            * EEEED
                {                                * EEEF2
                  $       "P*V=n*R*T"            * EEEF7
                  $       "m=n*MW"               * EEF13
                }                                * EEF29
                {                                * EEF2E
                  $       "P*V=n*\01R\09\02T)"   * EEF33
                  CHR_D                          * EEF55
                }                                * EEF5A
              }                                  * EEF5F
              {                                  * EEF64
                $       "\0A\14uCdt"             * EEF69
                #       9                        * EEF7F  9
                #       6                        * EEF89  6
                $       "\03(\1C\1B\08!"         * EEF93
              }                                  * EEFA9
              ROMPTR  0E2 02A                    * EEFAE
            }                                    * EEFB9
            {                                    * EEFBE
              {                                  * EEFC3
                BINT1                            * EEFC8
                $       "(Pf*Vf)/Tf\0EPi*Vi)/Ti\0A" * EEFCD
                $       "(Pf*Vf)/\02Tf)\0EPi*Vi)/\02Ti)" * EF001
              }                                  * EF03B
              {                                  * EF040
                $       "yx32wv"                 * EF045
                #       F                        * EF05B  15
                #       6                        * EF065  6
                $       "\03\03((\1C\1C"         * EF06F
              }                                  * EF085
              ROMPTR  0E2 02A                    * EF08A
            }                                    * EF095
            {                                    * EF09A
              {                                  * EF09F
                BINT3                            * EF0A4
                BINT2                            * EF0A9
                {                                * EF0AE
                  $       "W=n*R*T*LN(Vf/Vi)"    * EF0B3
                  $       "m=n*MW"               * EF0DF
                }                                * EF0F5
                {                                * EF0FA
                  $       "W=n*\01R\09\02T\09LN(\02Vf/Vi\0F" * EF0FF
                  CHR_D                          * EF131
                }                                * EF136
              }                                  * EF13B
              {                                  * EF140
                $       "32uCWîdt"               * EF145
                #       15                       * EF15F  21
                #       7                        * EF169  7
                $       "((\1C\1BB\08!"          * EF173
              }                                  * EF18B
              ROMPTR  0E2 02A                    * EF190
            }                                    * EF19B
            {                                    * EF1A0
              {                                  * EF1A5
                BINT3                            * EF1AA
                BINT2                            * EF1AF
                {                                * EF1B4
                  $       "Pf/Pi\0EVf/Vi)^-n"    * EF1B9
                  $       "Tf/Ti\0EPf/Pi)^\0A((n-1)/n)" * EF1E1
                }                                * EF219
                {                                * EF21E
                  $       "Pf/Pi\0E\02Vf/Vi\0F^-n" * EF223
                  $       "\02Tf)/\02Ti)\0E\02Pf/Pi\0F^((n-1)/n)" * EF24D
                }                                * EF28D
              }                                  * EF292
              {                                  * EF297
                $       "yx32wvC"                * EF29C
                #       1C                       * EF2B4  28
                #       7                        * EF2BE  7
                $       "\03\03((\1C\1C\01"      * EF2C8
              }                                  * EF2E0
              ROMPTR  0E2 02A                    * EF2E5
            }                                    * EF2F0
            {                                    * EF2F5
              {                                  * EF2FA
                BINT3                            * EF2FF
                BINT4                            * EF304
                {                                * EF309
                  $       "T/T0=2\0D2+(k-1\09M\0C)" * EF30E
                  $       "P/P0\0ET/T0)^(k\0Dk-1\0F\0A" * EF33A
                  $       "ρ/ρ0\0ET/T0)^(1\0Dk-1)\0A)" * EF36A
                  $       "A/At\0E1/M\09(2\0Dk+1\09\0A(1+(k-1)/\08M\0C\0F\0A^((k+1)\0D\08(k-1\0F)" * EF39C
                }                                * EF402
                {                                * EF407
                  $       "\02T)/\02T0)=2\0D2+(k-1\09M\0C)" * EF40C
                  $       "P/P0\0E\02T)/\02T0\0F^(k\0Dk-1\0F" * EF440
                  $       "ρ/ρ0\0E\02T)/\02T0\0F^(1\0Dk-1\0F" * EF474
                  $       "A/At\0E1/M\09\022\0Dk+1\09(1+(k-1)/\08M\0C\0F^((k+1)\0D\08(k-1\0F)" * EF4A8
                }                                * EF50A
              }                                  * EF50F
              {                                  * EF514
                $       "m\10I\0A|\1E{uz\03"     * EF519
                #       23                       * EF537  35
                #       A                        * EF541  10
                $       "\01\01\03\0333\1C\1C\11\11" * EF54B
              }                                  * EF569
              ROMPTR  0E2 041                    * EF56E
            }                                    * EF579
            {                                    * EF57E
              {                                  * EF583
                BINT3                            * EF588
                BINT2                            * EF58D
                {                                * EF592
                  $       "P*V=n*Z*R*T"          * EF597
                  $       "m=n*MW"               * EF5B7
                }                                * EF5CD
                {                                * EF5D2
                  $       "P*V=n*ZFACTOR(\02T)/\02Tc);P/Pc\09\01R\09\02T)" * EF5D7
                  CHR_D                          * EF625
                }                                * EF62A
              }                                  * EF62F
              {                                  * EF634
                $       "~\0A\14}uCdt"           * EF639
                #       2D                       * EF653  45
                #       8                        * EF65D  8
                $       "\03\03(\1D\1C\1B\08!"   * EF667
              }                                  * EF681
              ROMPTR  0E2 02A                    * EF686
            }                                    * EF691
            {                                    * EF696
              {                                  * EF69B
                BINT1                            * EF6A0
                $       "(Pf*Vf)\0DZf*Tf)=\0A(Pi*Vi)\0DZi*Ti)" * EF6A5
                $       "(Pf*Vf)\0DZFACTOR(\02Tf)/\02Tc);Pf/Pc\09\02Tf\0F\0EPi*Vi)\0DZFACTOR(\02Ti)/\02Tc);Pi/Pc\09\02Ti\0F" * EF6EB
              }                                  * EF785
              {                                  * EF78A
                $       "~yx32î}wv"              * EF78F
                #       35                       * EF7AB  53
                #       8                        * EF7B5  8
                $       "\03\03\03((\1D\1C\1C"   * EF7BF
              }                                  * EF7D9
              ROMPTR  0E2 02A                    * EF7DE
            }                                    * EF7E9
            {                                    * EF7EE
              {                                  * EF7F3
                BINT3                            * EF7F8
                BINT4                            * EF7FD
                {                                * EF802
                  $       "P\0En*MW*vrms\0C)\0D3*V)\0A" * EF807
                  $       "vrms=√((3*R*T)/MW)"   * EF837
                  $       "λ=1\0D√(2\09π\10(n*NA)/\0AV\09d\0C)" * EF865
                  $       "m=n*MW"               * EF89D
                }                                * EF8B3
                {                                * EF8B8
                  CHR_D                          * EF8BD
                  $       "vrms=√(\02(3*\01R\09\02T\0F/MW\0F" * EF8C2
                  $       "λ=1\0D√(2\09π\10(n*\01NA\0F/V\09d\0C)" * EF8F6
                  CHR_D                          * EF92E
                }                                * EF933
              }                                  * EF938
              {                                  * EF93D
                $       "\0A\14uCt∡?\7Fd"        * EF942
                #       3D                       * EF95E  61
                #       9                        * EF968  9
                $       "\03(\1C\1B!\09  \08"    * EF972
              }                                  * EF98E
              ROMPTR  0E2 02A                    * EF993
            }                                    * EF99E
          }                                      * EF9A3
        }                                        * EF9A8

* ROMPTR 0E2 01B
* refs (1): E3857
ROMP_0E2_01B:
        {                                        * EF9AD
          ROMPTR  0E2 009                        * EF9B2
          #       6                              * EF9BD  6
          {                                      * EF9C7
            {                                    * EF9CC
              {                                  * EF9D1
                BINT3                            * EF9D6
                BINT2                            * EF9DB
                {                                * EF9E0
                  $       "Q=m*c*ΔT"             * EF9E5
                  $       "Q=m*c\10Tf-Ti)"       * EF9FF
                }                                * EFA21
                {                                * EFA26
                  CHR_D                          * EFA2B
                  $       "Q=m*c*TDELTA(Tf;Ti)"  * EFA30
                }                                * EFA60
              }                                  * EFA65
              {                                  * EFA6A
                $       "āwvd\0BJ"               * EFA6F
                #       7                        * EFA85  7
                #       6                        * EFA8F  6
                $       "\1C\1C\1C\086\1E"       * EFA99
              }                                  * EFAAF
              ROMPTR  0E2 02A                    * EFAB4
            }                                    * EFABF
            {                                    * EFAC4
              {                                  * EFAC9
                BINT3                            * EFACE
                BINT2                            * EFAD3
                {                                * EFAD8
                  $       "δ=α*L*ΔT"             * EFADD
                  $       "δ=α*L\10Tf-Ti)"       * EFAF7
                }                                * EFB19
                {                                * EFB1E
                  CHR_D                          * EFB23
                  $       "δ=α*L*TDELTA(Tf;Ti)"  * EFB28
                }                                * EFB58
              }                                  * EFB5D
              {                                  * EFB62
                $       "āwv\08k∇"               * EFB67
                #       D                        * EFB7D  13
                #       6                        * EFB87  6
                $       "\1C\1C\1C\02:\18"       * EFB91
              }                                  * EFBA7
              ROMPTR  0E2 042                    * EFBAC
            }                                    * EFBB7
            {                                    * EFBBC
              {                                  * EFBC1
                BINT3                            * EFBC6
                BINT2                            * EFBCB
                {                                * EFBD0
                  $       "q=k*A/L*ΔT"           * EFBD5
                  $       "q=k*A/L\10Th-Tc)"     * EFBF3
                }                                * EFC19
                {                                * EFC1E
                  CHR_D                          * EFC23
                  $       "q=k*A/L*TDELTA(Th;Tc)" * EFC28
                }                                * EFC5C
              }                                  * EFC61
              {                                  * EFC66
                $       "ā√}\03\08m6"            * EFC6B
                #       13                       * EFC83  19
                #       7                        * EFC8D  7
                $       "\1C\1C\1C/\1897"        * EFC97
              }                                  * EFCAF
              ROMPTR  0E2 043                    * EFCB4
            }                                    * EFCBF
            {                                    * EFCC4
              {                                  * EFCC9
                BINT3                            * EFCCE
                BINT2                            * EFCD3
                {                                * EFCD8
                  $       "q=h*A*ΔT"             * EFCDD
                  $       "q=h*A\10Th-Tc)"       * EFCF7
                }                                * EFD19
                {                                * EFD1E
                  CHR_D                          * EFD23
                  $       "q=h*A*TDELTA(Th;Tc)"  * EFD28
                }                                * EFD58
              }                                  * EFD5D
              {                                  * EFD62
                $       "ā√}\03B6"               * EFD67
                #       1A                       * EFD7D  26
                #       6                        * EFD87  6
                $       "\1C\1C\1C/87"           * EFD91
              }                                  * EFDA7
              ROMPTR  0E2 044                    * EFDAC
            }                                    * EFDB7
            {                                    * EFDBC
              {                                  * EFDC1
                BINT3                            * EFDC6
                BINT4                            * EFDCB
                {                                * EFDD0
                  $       "q=A*ΔT\0D1/h1+L1/k1+\0AL2/k2+L3/k3+1/h3)" * EFDD5
                  $       "U=q\0DA*ΔT)"          * EFE27
                  $       "q=A\10Th-Tc)\0D1/h1+\0AL1/k1+L2/k2+L3/k3+\0A1/h3)" * EFE43
                  $       "U=q\0DA\10Th-Tc\0F"   * EFE9F
                }                                * EFEC1
                {                                * EFEC6
                  CHR_D                          * EFECB
                  CHR_D                          * EFED0
                  $       "q=A*TDELTA(Th;Tc)\0D1/h1+L1/k1+L2/k2+L3/k3+1/h3)" * EFED5
                  $       "U=q\0DA*TDELTA(Th;Tc\0F" * EFF3B
                }                                * EFF6B
              }                                  * EFF70
              {                                  * EFF75
                $       "ā√}\03≥≤('∂π▶Σ∫6"       * EFF7A
                #       20                       * EFFA0  32
                #       E                        * EFFAA  14
                $       "\1C\1C\1C/88\18\18\1899987" * EFFB4
              }                                  * EFFDA
              ROMPTR  0E2 045                    * EFFDF
            }                                    * EFFEA
            {                                    * EFFEF
              {                                  * EFFF4
                BINT3                            * EFFF9
                BINT5                            * EFFFE
                {                                * F0003
                  $       "eb=σ*T^4"             * F0008
                  $       "f=F0λ(λ2;T)-F0λ(λ1;T)\0A" * F0022
                  $       "eb12=f*eb"            * F0058
                  $       "λmax*T=c3"            * F0074
                  $       "q=eb*A"               * F0090
                }                                * F00A6
                {                                * F00AB
                  $       "eb=\01σ\09\02T)^4"    * F00B0
                  $       "f=ABS(F0λ(λ2;T)-F0λ(λ1;T\0F" * F00D0
                  CHR_D                          * F010C
                  $       "λmax*\02T)=\01c3)"    * F0111
                  CHR_D                          * F0135
                }                                * F013A
              }                                  * F013F
              {                                  * F0144
                $       "u↓←→.α≠\036"            * F0149
                #       2E                       * F0165  46
                #       9                        * F016F  9
                $       "\1C;++\01;+/7"          * F0179
              }                                  * F0195
              ROMPTR  0E2 046                    * F019A
            }                                    * F01A5
          }                                      * F01AA
        }                                        * F01AF

* ROMPTR 0E2 01C
* refs (1): E3857
ROMP_0E2_01C:
        {                                        * F01B4
          ROMPTR  0E2 00A                        * F01B9
          #       4                              * F01C4  4
          {                                      * F01CE
            {                                    * F01D3
              {                                  * F01D8
                BINT1                            * F01DD
                $       "B\0Eµ0*µr*I)\0D\08π*r)" * F01E2
                $       "B=\03r<rw;(\01µ0\09µr*I*r)\0D\08π*rw\0C);(\01µ0\09µr*I)\0D\08π*r\0F" * F020C
              }                                  * F0270
              {                                  * F0275
                $       "D\06γ\04↑"              * F027A
                #       5                        * F028E  5
                #       5                        * F0298  5
                $       "\01\18\18\0D*"          * F02A2
              }                                  * F02B6
              ROMPTR  0E2 047                    * F02BB
            }                                    * F02C6
            {                                    * F02CB
              {                                  * F02D0
                BINT1                            * F02D5
                $       "Fba\0Eµ0*µr*L*Ib*Ia)/\0A(\08π*d)" * F02DA
                $       "Fba\0E\01µ0\09µr*L*Ib*Ia)\0D\08π*d)" * F0318
              }                                  * F0354
              {                                  * F0359
                $       "D\08?ηεδ"               * F035E
                #       A                        * F0374  10
                #       6                        * F037E  6
                $       "\01\18\18\0D\0D\0B"     * F0388
              }                                  * F039E
              ROMPTR  0E2 048                    * F03A3
            }                                    * F03AE
            {                                    * F03B3
              {                                  * F03B8
                BINT1                            * F03BD
                $       "B=µ0*µr*I*n"            * F03C2
                $       "B=\01µ0\09µr*I*n"       * F03E2
              }                                  * F0404
              {                                  * F0409
                $       "DC\04↑"                 * F040E
                #       10                       * F0420  16
                #       4                        * F042A  4
                $       "\01\19\0D*"             * F0434
              }                                  * F0446
              ROMPTR  0E2 049                    * F044B
            }                                    * F0456
            {                                    * F045B
              {                                  * F0460
                BINT1                            * F0465
                $       "B\0Eµ0*µr*I*N)\0D\08π\09\0A(2\0Dro+ri\0F" * F046A
                $       "B\0E\01µ0\09µr*I*N)\0D\08π\09(2\0Dro+ri\0F" * F04A8
              }                                  * F04E6
              {                                  * F04EB
                $       "DEA@\04↑"               * F04F0
                #       14                       * F0506  20
                #       6                        * F0510  6
                $       "\01\01\18\18\0D*"       * F051A
              }                                  * F0530
              ROMPTR  0E2 04A                    * F0535
            }                                    * F0540
          }                                      * F0545
        }                                        * F054A

* ROMPTR 0E2 01D
* refs (1): E3857
ROMP_0E2_01D:
        {                                        * F054F
          ROMPTR  0E2 00B                        * F0554
          #       7                              * F055F  7
          {                                      * F0569
            {                                    * F056E
              {                                  * F0573
                BINT2                            * F0578
                BINT4                            * F057D
                {                                * F0582
                  $       "x=x0+v0*t+1/\08a*t\0C" * F0587
                  $       "x=x0+v*t-1/\08a*t\0C" * F05B3
                  $       "x=x0+1/\08(v0+v\09t"  * F05DD
                  $       "v=v0+a*t"             * F0605
                }                                * F061F
              }                                  * F0624
              {                                  * F0629
                $       "λ\0Eθc\11:"             * F062E
                #       8                        * F0644  8
                #       6                        * F064E  6
                $       "\02\02\09\09%\17"       * F0658
              }                                  * F066E
              ROMPTR  0E2 02A                    * F0673
            }                                    * F067E
            {                                    * F0683
              {                                  * F0688
                BINT3                            * F068D
                BINT4                            * F0692
                {                                * F0697
                  $       "y=y0+v0*t-1/\08g*t\0C" * F069C
                  $       "y=y0+v*t+1/\08g*t\0C" * F06C8
                  $       "v\0C=v0\0C-\08g\10y-y0)" * F06F2
                  $       "v=v0-g*t"             * F071A
                }                                * F0734
                {                                * F0739
                  $       "y=y0+v0*t-1/\08\01g\09t\0C" * F073E
                  $       "y=y0+v*t+1/\08\01g\09t\0C" * F076C
                  $       "v\0C=v0\0C-\08\01g\09(y-y0)" * F0798
                  $       "v=v0-\01g\09t"        * F07C4
                }                                * F07E0
              }                                  * F07E5
              {                                  * F07EA
                $       "ρ\0Dθc:"                * F07EF
                #       E                        * F0803  14
                #       5                        * F080D  5
                $       "\02\02\09\09\17"        * F0817
              }                                  * F082B
              ROMPTR  0E2 02A                    * F0830
            }                                    * F083B
            {                                    * F0840
              {                                  * F0845
                BINT3                            * F084A
                BINT5                            * F084F
                {                                * F0854
                  $       "x=x0+v0*\04θ0\09t"    * F0859
                  $       "y=y0+v0*\05θ0\09t-\0A1/\08g*t\0C" * F087D
                  $       "vx=v0*\04θ0)"         * F08B3
                  $       "vy=v0*\05θ0)-g*t"     * F08D1
                  $       "R=v0\0C/g*\05\08θ0)"  * F08F7
                }                                * F091B
                {                                * F0920
                  CHR_D                          * F0925
                  $       "y=y0+v0*\05θ0\09t-1/\08\01g\09t\0C" * F092A
                  CHR_D                          * F0960
                  $       "vy=v0*\05θ0)-\01g\09t" * F0965
                  $       "R=v0\0C/\01g\09\05\08θ0)" * F098D
                }                                * F09B3
              }                                  * F09B8
              {                                  * F09BD
                $       "λ\0Eρ\0Dωîθτσ:\19"      * F09C2
                #       13                       * F09E2  19
                #       A                        * F09EC  10
                $       "\02\02\02\024\09\09\09\17\02" * F09F6
              }                                  * F0A14
              ROMPTR  0E2 04B                    * F0A19
            }                                    * F0A24
            {                                    * F0A29
              {                                  * F0A2E
                BINT2                            * F0A33
                BINT4                            * F0A38
                {                                * F0A3D
                  $       "θ=θ0+ω0*t+1/\08α*t\0C" * F0A42
                  $       "θ=θ0+ω*t-1/\08α*t\0C" * F0A6E
                  $       "θ=θ0+1/\08(ω0+ω\09t"  * F0A98
                  $       "ω=ω0+α*t"             * F0AC0
                }                                * F0ADA
              }                                  * F0ADF
              {                                  * F0AE4
                $       "ω\12>/k:"               * F0AE9
                #       1D                       * F0AFF  29
                #       6                        * F0B09  6
                $       "))''&5"                 * F0B13
              }                                  * F0B29
              ROMPTR  0E2 02A                    * F0B2E
            }                                    * F0B39
            {                                    * F0B3E
              {                                  * F0B43
                BINT3                            * F0B48
                BINT3                            * F0B4D
                {                                * F0B52
                  $       "ω=v/r"                * F0B57
                  $       "ar=v\0C/r"            * F0B6B
                  $       "ω=\08π*N"             * F0B83
                }                                * F0B99
                {                                * F0B9E
                  $       "ω=\01\06\09v/r"       * F0BA3
                  CHR_D                          * F0BBD
                  $       "ω=\01\07π\09N"        * F0BC2
                }                                * F0BDA
              }                                  * F0BDF
              {                                  * F0BE4
                $       "\06cl/E"                * F0BE9
                #       23                       * F0BFD  35
                #       5                        * F0C07  5
                $       "\18\09%'E"              * F0C11
              }                                  * F0C25
              ROMPTR  0E2 02A                    * F0C2A
            }                                    * F0C35
            {                                    * F0C3A
              {                                  * F0C3F
                BINT1                            * F0C44
                $       "v=√((\08m*g)\0DCd*ρ*A\0F\0A" * F0C49
                $       "v=√(\02(\08m*\01g\0F\0DCd*ρ*A\0F)" * F0C79
              }                                  * F0CAD
              {                                  * F0CB2
                $       "s\1E\03dc"              * F0CB7
                #       28                       * F0CCB  40
                #       5                        * F0CD5  5
                $       "\013\11\08\09"          * F0CDF
              }                                  * F0CF3
              ROMPTR  0E2 02A                    * F0CF8
            }                                    * F0D03
            {                                    * F0D08
              {                                  * F0D0D
                BINT1                            * F0D12
                $       "v=√((\08G*M)/R)"        * F0D17
                $       "v=√(\02(\08\01G\09M)/R\0F" * F0D3B
              }                                  * F0D63
              {                                  * F0D68
                $       "\10\19c"                * F0D6D
                #       2D                       * F0D7D  45
                #       3                        * F0D87  3
                $       "\08C\09"                * F0D91
              }                                  * F0DA1
              ROMPTR  0E2 02A                    * F0DA6
            }                                    * F0DB1
          }                                      * F0DB6
        }                                        * F0DBB
