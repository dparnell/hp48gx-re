* HP 48GX ROM revision R, #DF08C-#E04FE: Library part 0BE
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #DF08C in the original ROM).
        ENDLENGTH                                * DF08C

        CON(5)  DOLIB                            * DF08C  library object
        LENGTH                                   * DF091  length, to #E04FF
        CON(2)  0                                * DF096  title length

LIB0BE:
        CON(3)  #0BE                             * DF098  library number
        REL(5)  LIB0BE.hash                      * DF09B  hash table
        REL(5)  ROMP_0BE_000                     * DF0A0  message table
        REL(5)  LIB0BE.link                      * DF0A5  link table
        CON(5)  0                                * DF0AA  config

* ROMPTR 0BE 000
* refs (1): DF098
ROMP_0BE_000:
        CON(5)  DOLNKARRY                        * DF0AF  linked array 119
        LENGTH                                   * DF0B4  length, to #E0488
        CON(5)  DOCSTR                           * DF0B9  element type
        CON(5)  1                                * DF0BE  dimensions
        CON(5)  119                              * DF0C3
        REL(5)  msg~BE01                         * DF0C8
        REL(5)  msg~BE02                         * DF0CD
        REL(5)  msg~BE03                         * DF0D2
        REL(5)  msg~BE04                         * DF0D7
        REL(5)  msg~BE05                         * DF0DC
        REL(5)  msg~BE06                         * DF0E1
        REL(5)  msg~BE07                         * DF0E6
        REL(5)  msg~BE08                         * DF0EB
        REL(5)  msg~BE09                         * DF0F0
        REL(5)  msg~BE0A                         * DF0F5
        REL(5)  msg~BE0B                         * DF0FA
        REL(5)  msg~BE0C                         * DF0FF
        REL(5)  msg~BE0D                         * DF104
        REL(5)  msg~BE0E                         * DF109
        REL(5)  msg~BE0F                         * DF10E
        REL(5)  msg~BE10                         * DF113
        REL(5)  msg~BE11                         * DF118
        REL(5)  msg~BE12                         * DF11D
        REL(5)  msg~BE13                         * DF122
        REL(5)  msg~BE14                         * DF127
        REL(5)  msg~BE15                         * DF12C
        REL(5)  msg~BE16                         * DF131
        REL(5)  msg~BE17                         * DF136
        REL(5)  msg~BE18                         * DF13B
        REL(5)  msg~BE19                         * DF140
        REL(5)  msg~BE1A                         * DF145
        REL(5)  msg~BE1B                         * DF14A
        REL(5)  msg~BE1C                         * DF14F
        REL(5)  msg~BE1D                         * DF154
        REL(5)  msg~BE1E                         * DF159
        REL(5)  msg~BE1F                         * DF15E
        REL(5)  msg~BE20                         * DF163
        REL(5)  msg~BE21                         * DF168
        REL(5)  msg~BE22                         * DF16D
        REL(5)  msg~BE23                         * DF172
        REL(5)  msg~BE24                         * DF177
        REL(5)  msg~BE25                         * DF17C
        REL(5)  msg~BE26                         * DF181
        REL(5)  msg~BE27                         * DF186
        REL(5)  msg~BE28                         * DF18B
        REL(5)  msg~BE29                         * DF190
        REL(5)  msg~BE2A                         * DF195
        REL(5)  msg~BE2B                         * DF19A
        REL(5)  msg~BE2C                         * DF19F
        REL(5)  msg~BE2D                         * DF1A4
        REL(5)  msg~BE2E                         * DF1A9
        REL(5)  msg~BE2F                         * DF1AE
        REL(5)  msg~BE30                         * DF1B3
        REL(5)  msg~BE31                         * DF1B8
        REL(5)  msg~BE32                         * DF1BD
        REL(5)  msg~BE33                         * DF1C2
        REL(5)  msg~BE34                         * DF1C7
        REL(5)  msg~BE35                         * DF1CC
        REL(5)  msg~BE36                         * DF1D1
        REL(5)  msg~BE37                         * DF1D6
        REL(5)  msg~BE38                         * DF1DB
        REL(5)  msg~BE39                         * DF1E0
        REL(5)  msg~BE3A                         * DF1E5
        REL(5)  msg~BE3B                         * DF1EA
        REL(5)  msg~BE3C                         * DF1EF
        REL(5)  msg~BE3D                         * DF1F4
        REL(5)  msg~BE3E                         * DF1F9
        REL(5)  msg~BE3F                         * DF1FE
        REL(5)  msg~BE40                         * DF203
        REL(5)  msg~BE41                         * DF208
        REL(5)  msg~BE42                         * DF20D
        REL(5)  msg~BE43                         * DF212
        REL(5)  msg~BE44                         * DF217
        REL(5)  msg~BE45                         * DF21C
        REL(5)  msg~BE46                         * DF221
        REL(5)  msg~BE47                         * DF226
        REL(5)  msg~BE48                         * DF22B
        REL(5)  msg~BE49                         * DF230
        REL(5)  msg~BE4A                         * DF235
        REL(5)  msg~BE4B                         * DF23A
        REL(5)  msg~BE4C                         * DF23F
        REL(5)  msg~BE4D                         * DF244
        REL(5)  msg~BE4E                         * DF249
        REL(5)  msg~BE4F                         * DF24E
        REL(5)  msg~BE50                         * DF253
        REL(5)  msg~BE51                         * DF258
        REL(5)  msg~BE52                         * DF25D
        REL(5)  msg~BE53                         * DF262
        REL(5)  msg~BE54                         * DF267
        REL(5)  msg~BE55                         * DF26C
        REL(5)  msg~BE56                         * DF271
        REL(5)  msg~BE57                         * DF276
        REL(5)  msg~BE58                         * DF27B
        REL(5)  msg~BE59                         * DF280
        REL(5)  msg~BE5A                         * DF285
        REL(5)  msg~BE5B                         * DF28A
        REL(5)  msg~BE5C                         * DF28F
        REL(5)  msg~BE5D                         * DF294
        REL(5)  msg~BE5E                         * DF299
        REL(5)  msg~BE5F                         * DF29E
        REL(5)  msg~BE60                         * DF2A3
        REL(5)  msg~BE61                         * DF2A8
        REL(5)  msg~BE62                         * DF2AD
        REL(5)  msg~BE63                         * DF2B2
        REL(5)  msg~BE64                         * DF2B7
        REL(5)  msg~BE65                         * DF2BC
        REL(5)  msg~BE66                         * DF2C1
        REL(5)  msg~BE67                         * DF2C6
        REL(5)  msg~BE68                         * DF2CB
        REL(5)  msg~BE69                         * DF2D0
        REL(5)  msg~BE6A                         * DF2D5
        REL(5)  msg~BE6B                         * DF2DA
        REL(5)  msg~BE6C                         * DF2DF
        REL(5)  msg~BE6D                         * DF2E4
        REL(5)  msg~BE6E                         * DF2E9
        REL(5)  msg~BE6F                         * DF2EE
        REL(5)  msg~BE70                         * DF2F3
        REL(5)  msg~BE71                         * DF2F8
        REL(5)  msg~BE72                         * DF2FD
        REL(5)  msg~BE73                         * DF302
        REL(5)  msg~BE74                         * DF307
        REL(5)  msg~BE75                         * DF30C
        REL(5)  msg~BE76                         * DF311
        REL(5)  msg~BE77                         * DF316
msg~BE01:
        $BODY   "Plot"                           * DF31B  1
msg~BE02:
        $BODY   "Type:"                          * DF328  2
msg~BE03:
        $BODY   "∡:"                             * DF337  3
msg~BE04:
        $BODY   "H-View:"                        * DF340  4
msg~BE05:
        $BODY   "Autoscale"                      * DF353  5
msg~BE06:
        $BODY   "V-View:"                        * DF36A  6
msg~BE07:
        $BODY   "Choose type of plot"            * DF37D  7
msg~BE08:
        $BODY   "Choose angle measure"           * DF3A8  8
msg~BE09:
        $BODY   "Enter function(s) to plot"      * DF3D5  9
msg~BE0A:
        $BODY   "Enter minimum horizontal value" * DF40C  10
msg~BE0B:
        $BODY   "Enter maximum horizontal value" * DF44D  11
msg~BE0C:
        $BODY   "Autoscale vertical plot range?" * DF48E  12
msg~BE0D:
        $BODY   "Enter minimum vertical value"   * DF4CF  13
msg~BE0E:
        $BODY   "Enter maximum vertical value"   * DF50C  14
msg~BE0F:
        $BODY   "Plot (x(t), y(t))"              * DF549  15
msg~BE10:
        $BODY   "Enter complex-valued func(s)"   * DF570  16
msg~BE11:
        $BODY   "Plot y'(t)=f(t,y)"              * DF5AD  17
msg~BE12:
        $BODY   "Enter function of INDEP and SOLN" * DF5D4  18
msg~BE13:
        $BODY   "Enter derivative w.r.t. SOLN"   * DF619  19
msg~BE14:
        $BODY   "Enter derivative w.r.t. INDEP"  * DF656  20
msg~BE15:
        $BODY   "Use Stiff diff eq solver?"      * DF695  21
msg~BE16:
        $BODY   "ΣDat:"                          * DF6CC  22
msg~BE17:
        $BODY   "Col:"                           * DF6DB  23
msg~BE18:
        $BODY   "Wid:"                           * DF6E8  24
msg~BE19:
        $BODY   "Enter data to plot"             * DF6F5  25
msg~BE1A:
        $BODY   "Arrays in"                      * DF71E  26
msg~BE1B:
        $BODY   "Enter column to plot"           * DF735  27
msg~BE1C:
        $BODY   "Enter bar width"                * DF762  28
msg~BE1D:
        $BODY   "Cols:"                          * DF785  29
msg~BE1E:
        $BODY   "Enter col to use for horizontal" * DF794  30
msg~BE1F:
        $BODY   "Enter col to use for vertical"  * DF7D7  31
msg~BE20:
        $BODY   "Steps:"                         * DF816  32
msg~BE21:
        $BODY   "Enter indep var sample count"   * DF827  33
msg~BE22:
        $BODY   "Enter dep var sample count"     * DF864  34
msg~BE23:
        $BODY   "Plot Options"                   * DF89D  35
msg~BE24:
        $BODY   "Lo:"                            * DF8BA  36
msg~BE25:
        $BODY   "Hi:"                            * DF8C5  37
msg~BE26:
        $BODY   "Axes"                           * DF8D0  38
msg~BE27:
        $BODY   "Simult"                         * DF8DD  39
msg~BE28:
        $BODY   "Connect"                        * DF8EE  40
msg~BE29:
        $BODY   "Pixels"                         * DF901  41
msg~BE2A:
        $BODY   "H-Tick:"                        * DF912  42
msg~BE2B:
        $BODY   "V-Tick:"                        * DF925  43
msg~BE2C:
        $BODY   "Enter minimum indep var value"  * DF938  44
msg~BE2D:
        $BODY   "Enter maximum indep var value"  * DF977  45
msg~BE2E:
        $BODY   "Draw axes before plotting?"     * DF9B6  46
msg~BE2F:
        $BODY   "Connect plot points?"           * DF9EF  47
msg~BE30:
        $BODY   "Plot functions simultaneously?" * DFA1C  48
msg~BE31:
        $BODY   "Enter indep var increment"      * DFA5D  49
msg~BE32:
        $BODY   "Indep step units are pixels?"   * DFA94  50
msg~BE33:
        $BODY   "Enter horizontal tick spacing"  * DFAD1  51
msg~BE34:
        $BODY   "Enter vertical tick spacing"    * DFB10  52
msg~BE35:
        $BODY   "Tick spacing units are pixels?" * DFB4B  53
msg~BE36:
        $BODY   "Depnd:"                         * DFB8C  54
msg~BE37:
        $BODY   "Enter dependent var name"       * DFB9D  55
msg~BE38:
        $BODY   "Enter minimum dep var value"    * DFBD2  56
msg~BE39:
        $BODY   "Enter maximum dep var value"    * DFC0D  57
msg~BE3A:
        $BODY   "H-Var:"                         * DFC48  58
msg~BE3B:
        $BODY   "V-Var:"                         * DFC59  59
msg~BE3C:
        $BODY   "Enter max indep var increment"  * DFC6A  60
msg~BE3D:
        $BODY   "Choose horizontal variable"     * DFCA9  61
msg~BE3E:
        $BODY   "Choose vertical variable"       * DFCE2  62
msg~BE3F:
        $BODY   "0 INDEP"                        * DFD17  63
msg~BE40:
        $BODY   "1 SOLN"                         * DFD2A  64
msg~BE41:
        $BODY   " SOLN("                         * DFD3B  65
msg~BE42:
        $BODY   "X-Left:"                        * DFD4C  66
msg~BE43:
        $BODY   "X-Right:"                       * DFD5F  67
msg~BE44:
        $BODY   "Y-Near:"                        * DFD74  68
msg~BE45:
        $BODY   "Y-Far:"                         * DFD87  69
msg~BE46:
        $BODY   "Z-Low:"                         * DFD98  70
msg~BE47:
        $BODY   "Z-High:"                        * DFDA9  71
msg~BE48:
        $BODY   "Enter minimum X view-volume val" * DFDBC  72
msg~BE49:
        $BODY   "Enter maximum X view-volume val" * DFDFF  73
msg~BE4A:
        $BODY   "Enter minimum Y view-volume val" * DFE42  74
msg~BE4B:
        $BODY   "Enter maximum Y view-volume val" * DFE85  75
msg~BE4C:
        $BODY   "Enter minimum Z view-volume val" * DFEC8  76
msg~BE4D:
        $BODY   "Enter maximum Z view-volume val" * DFF0B  77
msg~BE4E:
        $BODY   "XE:"                            * DFF4E  78
msg~BE4F:
        $BODY   "YE:"                            * DFF59  79
msg~BE50:
        $BODY   "ZE:"                            * DFF64  80
msg~BE51:
        $BODY   "Enter X eyepoint coordinate"    * DFF6F  81
msg~BE52:
        $BODY   "Enter Y eyepoint coordinate"    * DFFAA  82
msg~BE53:
        $BODY   "Enter Z eyepoint coordinate"    * DFFE5  83
msg~BE54:
        $BODY   "Save Animation"                 * E0020  84
msg~BE55:
        $BODY   "Save animation data after plot?" * E0041  85
msg~BE56:
        $BODY   "XX-Left:"                       * E0084  86
msg~BE57:
        $BODY   "XX-Rght:"                       * E0099  87
msg~BE58:
        $BODY   "YY-Near:"                       * E00AE  88
msg~BE59:
        $BODY   "YY-Far:"                        * E00C3  89
msg~BE5A:
        $BODY   "Enter minimum XX range value"   * E00D6  90
msg~BE5B:
        $BODY   "Enter maximum XX range value"   * E0113  91
msg~BE5C:
        $BODY   "Enter minimum YY range value"   * E0150  92
msg~BE5D:
        $BODY   "Enter maximum YY range value"   * E018D  93
msg~BE5E:
        $BODY   "XX and YY Plot Options"         * E01CA  94
msg~BE5F:
        $BODY   "Zoom Factors"                   * E01FB  95
msg~BE60:
        $BODY   "H-Factor:"                      * E0218  96
msg~BE61:
        $BODY   "V-Factor:"                      * E022F  97
msg~BE62:
        $BODY   "Recenter at Crosshairs"         * E0246  98
msg~BE63:
        $BODY   "Enter horizontal zoom factor"   * E0277  99
msg~BE64:
        $BODY   "Enter vertical zoom factor"     * E02B4  100
msg~BE65:
        $BODY   "Recenter plot at crosshairs?"   * E02ED  101
msg~BE66:
        $BODY   "Reset plot"                     * E032A  102
msg~BE67:
        $BODY   "Dflt"                           * E0343  103
msg~BE68:
        $BODY   "Auto"                           * E0350  104
msg~BE69:
        $BODY   "Function"                       * E035D  105
msg~BE6A:
        $BODY   "Polar"                          * E0372  106
msg~BE6B:
        $BODY   "Conic"                          * E0381  107
msg~BE6C:
        $BODY   "Truth"                          * E0390  108
msg~BE6D:
        $BODY   "Parametric"                     * E039F  109
msg~BE6E:
        $BODY   "Diff Eq"                        * E03B8  110
msg~BE6F:
        $BODY   "Histogram"                      * E03CB  111
msg~BE70:
        $BODY   "Bar"                            * E03E2  112
msg~BE71:
        $BODY   "Scatter"                        * E03ED  113
msg~BE72:
        $BODY   "Slopefield"                     * E0400  114
msg~BE73:
        $BODY   "Wireframe"                      * E0419  115
msg~BE74:
        $BODY   "Ps-Contour"                     * E0430  116
msg~BE75:
        $BODY   "Y-Slice"                        * E0449  117
msg~BE76:
        $BODY   "Gridmap"                        * E045C  118
msg~BE77:
        $BODY   "Pr-Surface"                     * E046F  119
        ENDLENGTH                                * E0488

LIB0BE.hash:
        CON(5)  DOHSTR                           * E0488  hash table of library 0BE
        LENGTH                                   * E048D  length, to #E04EC
        CON(5)  0                                * E0492  names of length 1
        CON(5)  0                                * E0497  names of length 2
        CON(5)  0                                * E049C  names of length 3
        CON(5)  0                                * E04A1  names of length 4
        CON(5)  0                                * E04A6  names of length 5
        CON(5)  0                                * E04AB  names of length 6
        CON(5)  0                                * E04B0  names of length 7
        CON(5)  0                                * E04B5  names of length 8
        CON(5)  0                                * E04BA  names of length 9
        CON(5)  0                                * E04BF  names of length 10
        CON(5)  0                                * E04C4  names of length 11
        CON(5)  0                                * E04C9  names of length 12
        CON(5)  0                                * E04CE  names of length 13
        CON(5)  0                                * E04D3  names of length 14
        CON(5)  0                                * E04D8  names of length 15
        CON(5)  0                                * E04DD  names of length 16
        REL(5)  L_E04E7                          * E04E2  end of the names
L_E04E7:
        CON(5)  0                                * E04E7  command 000 has no name
        ENDLENGTH                                * E04EC

LIB0BE.link:
        CON(5)  DOHSTR                           * E04EC  link table of library 0BE
        LENGTH                                   * E04F1  length, to #E04FB
        REL(5)  ROMP_0BE_000                     * E04F6  000 
        ENDLENGTH                                * E04FB
        BSS     4                                * E04FB  zeros
