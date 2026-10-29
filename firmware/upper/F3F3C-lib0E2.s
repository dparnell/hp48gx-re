* HP 48GX ROM revision R, #F3F3C-#F6FB7: Library part 0E2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #F3F3C in the original ROM).
        RPL

* ROMPTR 0E2 024
* refs (1): E3857
ROMP_0E2_024:
        { ROMPTR 0E2 012 # 3                     * F3F3C
          {                                      * F3F56
            {                                    * F3F5B
              { BINT3 BINT4                      * F3F60
                { EQ$ "y=ym*SIN(k*x-ω*t)" EQ$ "v=λ*f" EQ$ "k=(2*π)/λ" * F3F6F
                  EQ$ "ω=2*π*f" }                * F3FC6
                { CHR_D CHR_D EQ$ "k=CONST(twoπ)/λ" EQ$ "ω=CONST(twoπ)*f" } } * F3FE1
              { $ "ë/.m\7F\0E:\0Dc" # 4 # 9 $ "\18\15\160\18\18\17\18M" } * F402C  variables ym ω f k λ x t y v
              ROMPTR 0E2 02A }                   * F4082
            {                                    * F4092
              { BINT3 BINT4                      * F4097
                { EQ$ "s=sm*COS(k*x-ω*t)" EQ$ "v=λ*f" EQ$ "k=(2*π)/λ" * F40A6
                  EQ$ "ω=2*π*f" }                * F40FD
                { CHR_D CHR_D EQ$ "k=CONST(twoπ)/λ" EQ$ "ω=CONST(twoπ)*f" } } * F4118
              { $ "í/.m\7F\0E:ìc" # D # 9 $ "\18\15\160\02\18\17\18\09" } * F4163  variables sm ω f k λ x t s v
              ROMPTR 0E2 02A }                   * F41B9
            {                                    * F41C9
              { BINT3 BINT4                      * F41CE
                { EQ$ "v=√(B/ρ)" EQ$ "I=1/2*ρ*v*ω^2*sm^2" * F41DD
                  EQ$ "ß=10*LOG(I/I0)" EQ$ "ω=2*π*f" } * F4224
                { EQ$ "v=√(UBASE(B/ρ))"          * F4265
                  EQ$ "I=1/2*ρ*v*ω^2*sm^2/CONST(rad)^2" * F4286
                  EQ$ "ß=10*LOG(UBASE(I/CONST(I0)))" EQ$ "ω=CONST(twoπ)*f" } * F42B8
              }                                  * F4301
              { $ "í/.↑\1Eîc\04©" # 16 # 8 $ "\18\15\16\033\0912" } * F4306  variables sm ω f B ρ - v I ß
              ROMPTR 0E2 02A }                   * F435A
          }                                      * F436A
        }                                        * F436F

* ROMPTR 0E2 025
* refs (1): E3857
ROMP_0E2_025:
        { $ "\08\05\04îîî\11\0A\0B\10\0Fî\0E\0D" # 1D # A * F4374  variables L E I - - - a P c M w - x y
          $ "\02\03\04\02\05\02\06\07\02\18" }   * F43B3

* ROMPTR 0E2 026
* refs (1): E3857
ROMP_0E2_026:
        { $ "\08\05\04îîî\11\0A\0B\10\0Fî\0E\12" # 27 # A * F43D6  variables L E I - - - a P c M w - x θ
          $ "\02\03\04\02\05\02\06\07\02)" }     * F4415

* ROMPTR 0E2 027
* refs (1): E3857
ROMP_0E2_027:
        { $ "\08\11\0A\0B\10\0F\0E\13" # 31 # 8 $ "\02\02\05\02\06\07\02\06" } * F4438  variables L a P c M w x Mx

* ROMPTR 0E2 028
* refs (1): E3857
ROMP_0E2_028:
        { $ "\06B\14\03îîd¯®?§" # 5 # 9 $ "\18\18#\11\08$$\18$" } * F448A  variables r h V A - - m Ixx Izz d Id

* ROMPTR 0E2 029
* refs (1): E3857
ROMP_0E2_029:
        CON(5)  DOARRY                           * F44E4  array 238
        LENGTH                                   * F44E9  length, to #F4AA9
        CON(5)  DOIDNT                           * F44EE  element type
        CON(5)  1                                * F44F3  dimensions
        CON(5)  238                              * F44F8
        IDBODY  σcr                              * F44FD  1
        IDBODY  Pcr                              * F4505  2
        IDBODY  A                                * F450D  3
        IDBODY  I                                * F4511  4
        IDBODY  E                                * F4515  5
        IDBODY  r                                * F4519  6
        IDBODY  K                                * F451D  7
        IDBODY  L                                * F4521  8
        IDBODY  σmax                             * F4525  9
        IDBODY  P                                * F452F  10
        IDBODY  c                                * F4533  11
        IDBODY  ε                                * F4537  12
        IDBODY  y                                * F453B  13
        IDBODY  x                                * F453F  14
        IDBODY  w                                * F4543  15
        IDBODY  M                                * F4547  16
        IDBODY  a                                * F454B  17
        IDBODY  θ                                * F454F  18
        IDBODY  Mx                               * F4553  19
        IDBODY  V                                * F4559  20
        IDBODY  F                                * F455D  21
        IDBODY  εr                               * F4561  22
        IDBODY  q2                               * F4567  23
        IDBODY  q1                               * F456D  24
        IDBODY  R                                * F4573  25
        IDBODY  V1                               * F4577  26
        IDBODY  R2                               * F457D  27
        IDBODY  R1                               * F4583  28
        IDBODY  I1                               * F4589  29
        IDBODY  ρ                                * F458F  30
        IDBODY  Rp                               * F4593  31
        IDBODY  Rs                               * F4599  32
        IDBODY  Cp                               * F459F  33
        IDBODY  Cs                               * F45A5  34
        IDBODY  C2                               * F45AB  35
        IDBODY  C1                               * F45B1  36
        IDBODY  Lp                               * F45B7  37
        IDBODY  Ls                               * F45BD  38
        IDBODY  L2                               * F45C3  39
        IDBODY  L1                               * F45C9  40
        IDBODY  C                                * F45CF  41
        IDBODY  Øp                               * F45D3  42
        IDBODY  Øs                               * F45D9  43
        IDBODY  XL                               * F45DF  44
        IDBODY  XC                               * F45E5  45
        IDBODY  f                                * F45EB  46
        IDBODY  ω                                * F45EF  47
        IDBODY  tf                               * F45F3  48
        IDBODY  ti                               * F45F9  49
        IDBODY  Vf                               * F45FF  50
        IDBODY  Vi                               * F4605  51
        IDBODY  Δt                               * F460B  52
        IDBODY  ΔV                               * F4611  53
        IDBODY  q                                * F4617  54
        IDBODY  If                               * F461B  55
        IDBODY  Ii                               * F4621  56
        IDBODY  ΔI                               * F4627  57
        IDBODY  t                                * F462D  58
        IDBODY  f0                               * F4631  59
        IDBODY  Qp                               * F4637  60
        IDBODY  Qs                               * F463D  61
        IDBODY  ω0                               * F4643  62
        IDBODY  d                                * F4649  63
        IDBODY  ro                               * F464D  64
        IDBODY  ri                               * F4653  65
        IDBODY  h                                * F4659  66
        IDBODY  n                                * F465D  67
        IDBODY  µr                               * F4661  68
        IDBODY  N                                * F4667  69
        IDBODY  Vmax                             * F466B  70
        IDBODY  Ø                                * F4675  71
        IDBODY  Imax                             * F4679  72
        IDBODY  P0                               * F4683  73
        IDBODY  Q                                * F4689  74
        IDBODY  D2                               * F468D  75
        IDBODY  D1                               * F4693  76
        IDBODY  A2                               * F4699  77
        IDBODY  A1                               * F469F  78
        IDBODY  v2                               * F46A5  79
        IDBODY  v1                               * F46AB  80
        IDBODY  y2                               * F46B1  81
        IDBODY  y1                               * F46B7  82
        IDBODY  Δy                               * F46BD  83
        IDBODY  P2                               * F46C3  84
        IDBODY  P1                               * F46C9  85
        IDBODY  ΔP                               * F46CF  86
        IDBODY  W                                * F46D5  87
        IDBODY  hL                               * F46D9  88
        IDBODY  Re                               * F46DF  89
        IDBODY  µ                                * F46E5  90
        IDBODY  ΣK                               * F46E9  91
        IDBODY  D                                * F46EF  92
        IDBODY  vavg                             * F46F3  93
        IDBODY  Pavg                             * F46FD  94
        IDBODY  Kf                               * F4707  95
        IDBODY  Ki                               * F470D  96
        IDBODY  vf                               * F4713  97
        IDBODY  vi                               * F4719  98
        IDBODY  v                                * F471F  99
        IDBODY  m                                * F4723  100
        IDBODY  Nf                               * F4727  101
        IDBODY  Ni                               * F472D  102
        IDBODY  at                               * F4733  103
        IDBODY  τ                                * F4739  104
        IDBODY  ωf                               * F473D  105
        IDBODY  ωi                               * F4743  106
        IDBODY  α                                * F4749  107
        IDBODY  ar                               * F474D  108
        IDBODY  k                                * F4753  109
        IDBODY  v2f                              * F4757  110
        IDBODY  v1f                              * F475F  111
        IDBODY  v1i                              * F4767  112
        IDBODY  m2                               * F476F  113
        IDBODY  m1                               * F4775  114
        IDBODY  Cd                               * F477B  115
        IDBODY  MW                               * F4781  116
        IDBODY  T                                * F4787  117
        IDBODY  Tf                               * F478B  118
        IDBODY  Ti                               * F4791  119
        IDBODY  Pf                               * F4797  120
        IDBODY  Pi                               * F479D  121
        IDBODY  At                               * F47A3  122
        IDBODY  T0                               * F47A9  123
        IDBODY  ρ0                               * F47AF  124
        IDBODY  Tc                               * F47B5  125
        IDBODY  Pc                               * F47BB  126
        IDBODY  λ                                * F47C1  127
        IDBODY  vrms                             * F47C5  128
        IDBODY  ΔT                               * F47CF  129
        IDBODY  δ                                * F47D5  130
        IDBODY  Th                               * F47D9  131
        IDBODY  U                                * F47DF  132
        IDBODY  k3                               * F47E3  133
        IDBODY  k2                               * F47E9  134
        IDBODY  k1                               * F47EF  135
        IDBODY  L3                               * F47F5  136
        IDBODY  h3                               * F47FB  137
        IDBODY  h1                               * F4801  138
        IDBODY  λmax                             * F4807  139
        IDBODY  eb12                             * F4811  140
        IDBODY  λ2                               * F481B  141
        IDBODY  λ1                               * F4821  142
        IDBODY  eb                               * F4827  143
        IDBODY  B                                * F482D  144
        IDBODY  rw                               * F4831  145
        IDBODY  Fba                              * F4837  146
        IDBODY  Ia                               * F483F  147
        IDBODY  Ib                               * F4845  148
        IDBODY  v0                               * F484B  149
        IDBODY  x0                               * F4851  150
        IDBODY  y0                               * F4857  151
        IDBODY  vy                               * F485D  152
        IDBODY  vx                               * F4863  153
        IDBODY  θ0                               * F4869  154
        IDBODY  θ2                               * F486F  155
        IDBODY  θ1                               * F4875  156
        IDBODY  n2                               * F487B  157
        IDBODY  n1                               * F4881  158
        IDBODY  θc                               * F4887  159
        IDBODY  θB                               * F488D  160
        IDBODY  u                                * F4893  161
        IDBODY  r2                               * F4897  162
        IDBODY  r1                               * F489D  163
        IDBODY  J                                * F48A3  164
        IDBODY  G                                * F48A7  165
        IDBODY  xm                               * F48AB  166
        IDBODY  Id                               * F48B1  167
        IDBODY  b                                * F48B7  168
        IDBODY  ß                                * F48BB  169
        IDBODY  rv                               * F48BF  170
        IDBODY  rs                               * F48C5  171
        IDBODY  Iy                               * F48CB  172
        IDBODY  Ix                               * F48D1  173
        IDBODY  Izz                              * F48D7  174
        IDBODY  Ixx                              * F48DF  175
        IDBODY  BV                               * F48E7  176
        IDBODY  Emax                             * F48ED  177
        IDBODY  Vbi                              * F48F7  178
        IDBODY  Cj                               * F48FF  179
        IDBODY  Aj                               * F4905  180
        IDBODY  xd                               * F490B  181
        IDBODY  xj                               * F4911  182
        IDBODY  ΔL                               * F4917  183
        IDBODY  ΔW                               * F491D  184
        IDBODY  E1                               * F4923  185
        IDBODY  Va                               * F4929  186
        IDBODY  Js                               * F492F  187
        IDBODY  NA                               * F4935  188
        IDBODY  ND                               * F493B  189
        IDBODY  gm                               * F4941  190
        IDBODY  VDsat                            * F4947  191
        IDBODY  gds                              * F4953  192
        IDBODY  IDS                              * F495B  193
        IDBODY  Le                               * F4963  194
        IDBODY  We                               * F4969  195
        IDBODY  VDS                              * F496F  196
        IDBODY  VBS                              * F4977  197
        IDBODY  VGS                              * F497F  198
        IDBODY  Vt                               * F4987  199
        IDBODY  γ                                * F498D  200
        IDBODY  Vt0                              * F4991  201
        IDBODY  µn                               * F4999  202
        IDBODY  Cox                              * F499F  203
        IDBODY  tox                              * F49A7  204
        IDBODY  VBE                              * F49AF  205
        IDBODY  VBC                              * F49B7  206
        IDBODY  VCEsat                           * F49BF  207
        IDBODY  ICEO                             * F49CD  208
        IDBODY  ICO                              * F49D7  209
        IDBODY  IB                               * F49DF  210
        IDBODY  IC                               * F49E5  211
        IDBODY  IE                               * F49EB  212
        IDBODY  αR                               * F49F1  213
        IDBODY  αF                               * F49F7  214
        IDBODY  ICS                              * F49FD  215
        IDBODY  IES                              * F4A05  216
        IDBODY  IS                               * F4A0D  217
        IDBODY  xdmax                            * F4A13  218
        IDBODY  G0                               * F4A1F  219
        IDBODY  ID                               * F4A25  220
        IDBODY  σ                                * F4A2B  221
        IDBODY  τx1y1                            * F4A2F  222
        IDBODY  σy1                              * F4A3B  223
        IDBODY  σx1                              * F4A43  224
        IDBODY  τxy                              * F4A4B  225
        IDBODY  σy                               * F4A53  226
        IDBODY  σx                               * F4A59  227
        IDBODY  σavg                             * F4A5F  228
        IDBODY  θs                               * F4A69  229
        IDBODY  τmax                             * F4A6F  230
        IDBODY  θp2                              * F4A79  231
        IDBODY  σ2                               * F4A81  232
        IDBODY  θp1                              * F4A87  233
        IDBODY  σ1                               * F4A8F  234
        IDBODY  ym                               * F4A95  235
        IDBODY  s                                * F4A9B  236
        IDBODY  sm                               * F4A9F  237
        IDBODY  z                                * F4AA5  238
        ENDLENGTH                                * F4AA9

* ROMPTR 0E2 02A
* refs (1): E3857
ROMP_0E2_02A:
        :: NULL{} ;                              * F4AA9

* ROMPTR 0E2 02B
* refs (1): E3857
ROMP_0E2_02B:
        { BINT32 BINT3 PCGROB "images/F4AC7-packed.png" } * F4AB8  72 x 49, packed

* ROMPTR 0E2 02C
* refs (1): E3857
ROMP_0E2_02C:
        { BINT32 BINT3 PCGROB "images/F4DDE-packed.png" } * F4DCF  72 x 49, packed

* ROMPTR 0E2 02D
* refs (1): E3857
ROMP_0E2_02D:
        { BINT8 BINT2 PCGROB "images/F50DC-packed.png" } * F50CD  104 x 52, packed

* ROMPTR 0E2 02E
* refs (1): E3857
ROMP_0E2_02E:
        { BINT48 BINT5 PCGROB "images/F55B2-packed.png" } * F55A3  32 x 49, packed

* ROMPTR 0E2 02F
* refs (1): E3857
ROMP_0E2_02F:
        { BINT32 BINT8 PCGROB "images/F5759-packed.png" } * F574A  64 x 38, packed

* ROMPTR 0E2 030
* refs (1): E3857
ROMP_0E2_030:
        { BINT32 BINT9 PCGROB "images/F5945-packed.png" } * F5936  72 x 37, packed

* ROMPTR 0E2 031
* refs (1): E3857
ROMP_0E2_031:
        { BINT8 BINT5 PCGROB "images/F5B82-packed.png" } * F5B73  120 x 45, packed

* ROMPTR 0E2 032
* refs (1): E3857
ROMP_0E2_032:
        { BINT8 BINT3 PCGROB "images/F5F01-packed.png" } * F5EF2  120 x 49, packed

* ROMPTR 0E2 033
* refs (1): E3857
ROMP_0E2_033:
        { BINT8 BINT4 PCGROB "images/F629F-packed.png" } * F6290  120 x 45, packed

* ROMPTR 0E2 034
* refs (1): E3857
ROMP_0E2_034:
        { BINT16 BINT10 PCGROB "images/F660D-packed.png" } * F65FE  104 x 36, packed

* ROMPTR 0E2 035
* refs (1): E3857
ROMP_0E2_035:
        { BINT8 BINT8 PCGROB "images/F692A-packed.png" } * F691B  96 x 38, packed

* ROMPTR 0E2 036
* refs (1): E3857
ROMP_0E2_036:
        { BINT16 BINT8 PCGROB "images/F6BA4-packed.png" } * F6B95  88 x 38, packed

* ROMPTR 0E2 037
* refs (1): E3857
ROMP_0E2_037:
        { BINT24 BINT6 PCGROB "images/F6DC2-packed.png" } * F6DB3  72 x 44, packed
