* HP 48GX ROM revision R, #8998E-#8C9F5: Library 0F1: drawing of WIREFRAME, GRIDMAP, PARSURFACE, YSLICE, SLOPEFIELD and PCONTOUR plots, VPAR reading, trace input and output tags, then the FUNCTION and CONIC plot types
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PlotEvalEQ YSliceShowY YSliceSetup YSliceRestore YSliceNoFrames YSliceFrames YSliceDraw WireSetup WirePt WireNext WireInit WireDraw
* Follows on from the previous file (at #8998E in the original ROM).
        ENDLENGTH                                * 8998E
        ENDLENGTH                                * 8998E

        CON(5)  DOLIB                            * 8998E  library object
        LENGTH                                   * 89993  length, to #8D27C
        CON(2)  0                                * 89998  title length

* Library 0F1: Plot types: the FUNCTION..BAR commands with their information lists, the drawing code of the 3D and field plots (WIREFRAME, PARSURFACE, GRIDMAP, YSLICE, SLOPEFIELD, PCONTOUR), and VPAR handling
LIB0F1:
        CON(3)  #0F1                             * 8999A  library number
        REL(5)  LIB0F1.hash                      * 8999D  hash table
        CON(5)  0                                * 899A2  message table
        REL(5)  LIB0F1.link                      * 899A7  link table
        CON(5)  0                                * 899AC  config

LIB0F1.hash:
        CON(5)  DOHSTR                           * 899B1  hash table of library 0F1
        LENGTH                                   * 899B6  length, to #89BC7
        CON(5)  0                                * 899BB  names of length 1
        CON(5)  0                                * 899C0  names of length 2
        REL(5)  H0F1.BAR                         * 899C5  names of length 3
        CON(5)  0                                * 899CA  names of length 4
        REL(5)  H0F1.CONIC                       * 899CF  names of length 5
        CON(5)  0                                * 899D4  names of length 6
        REL(5)  H0F1.SCATTER                     * 899D9  names of length 7
        REL(5)  H0F1.FUNCTION                    * 899DE  names of length 8
        REL(5)  H0F1.HISTOGRAM                   * 899E3  names of length 9
        REL(5)  H0F1.PARAMETRIC                  * 899E8  names of length 10
        CON(5)  0                                * 899ED  names of length 11
        CON(5)  0                                * 899F2  names of length 12
        CON(5)  0                                * 899F7  names of length 13
        CON(5)  0                                * 899FC  names of length 14
        CON(5)  0                                * 89A01  names of length 15
        CON(5)  0                                * 89A06  names of length 16
        REL(5)  H0F1.PARAMETRIC.L1               * 89A0B  end of the names
H0F1.BAR:
        CON(2)  3                                * 89A10
        NIBASC  "BAR"                            * 89A12
        CON(3)  #03A                             * 89A18  command
H0F1.CONIC:
        CON(2)  5                                * 89A1B
        NIBASC  "CONIC"                          * 89A1D
        CON(3)  #034                             * 89A27  command
H0F1.POLAR:
        CON(2)  5                                * 89A2A
        NIBASC  "POLAR"                          * 89A2C
        CON(3)  #035                             * 89A36  command
H0F1.TRUTH:
        CON(2)  5                                * 89A39
        NIBASC  "TRUTH"                          * 89A3B
        CON(3)  #037                             * 89A45  command
H0F1.SCATTER:
        CON(2)  7                                * 89A48
        NIBASC  "SCATTER"                        * 89A4A
        CON(3)  #038                             * 89A58  command
H0F1.FUNCTION:
        CON(2)  8                                * 89A5B
        NIBASC  "FUNCTION"                       * 89A5D
        CON(3)  #033                             * 89A6D  command
H0F1.HISTOGRAM:
        CON(2)  9                                * 89A70
        NIBASC  "HISTOGRAM"                      * 89A72
        CON(3)  #039                             * 89A84  command
H0F1.PARAMETRIC:
        CON(2)  10                               * 89A87
        NIBASC  "PARAMETRIC"                     * 89A89
        CON(3)  #036                             * 89A9D  command
H0F1.PARAMETRIC.L1:
        CON(5)  0                                * 89AA0  command 000 has no name
        CON(5)  0                                * 89AA5  command 001 has no name
        CON(5)  0                                * 89AAA  command 002 has no name
        CON(5)  0                                * 89AAF  command 003 has no name
        CON(5)  0                                * 89AB4  command 004 has no name
        CON(5)  0                                * 89AB9  command 005 has no name
        CON(5)  0                                * 89ABE  command 006 has no name
        CON(5)  0                                * 89AC3  command 007 has no name
        CON(5)  0                                * 89AC8  command 008 has no name
        CON(5)  0                                * 89ACD  command 009 has no name
        CON(5)  0                                * 89AD2  command 00A has no name
        CON(5)  0                                * 89AD7  command 00B has no name
        CON(5)  0                                * 89ADC  command 00C has no name
        CON(5)  0                                * 89AE1  command 00D has no name
        CON(5)  0                                * 89AE6  command 00E has no name
        CON(5)  0                                * 89AEB  command 00F has no name
        CON(5)  0                                * 89AF0  command 010 has no name
        CON(5)  0                                * 89AF5  command 011 has no name
        CON(5)  0                                * 89AFA  command 012 has no name
        CON(5)  0                                * 89AFF  command 013 has no name
        CON(5)  0                                * 89B04  command 014 has no name
        CON(5)  0                                * 89B09  command 015 has no name
        CON(5)  0                                * 89B0E  command 016 has no name
        CON(5)  0                                * 89B13  command 017 has no name
        CON(5)  0                                * 89B18  command 018 has no name
        CON(5)  0                                * 89B1D  command 019 has no name
        CON(5)  0                                * 89B22  command 01A has no name
        CON(5)  0                                * 89B27  command 01B has no name
        CON(5)  0                                * 89B2C  command 01C has no name
        CON(5)  0                                * 89B31  command 01D has no name
        CON(5)  0                                * 89B36  command 01E has no name
        CON(5)  0                                * 89B3B  command 01F has no name
        CON(5)  0                                * 89B40  command 020 has no name
        CON(5)  0                                * 89B45  command 021 has no name
        CON(5)  0                                * 89B4A  command 022 has no name
        CON(5)  0                                * 89B4F  command 023 has no name
        CON(5)  0                                * 89B54  command 024 has no name
        CON(5)  0                                * 89B59  command 025 has no name
        CON(5)  0                                * 89B5E  command 026 has no name
        CON(5)  0                                * 89B63  command 027 has no name
        CON(5)  0                                * 89B68  command 028 has no name
        CON(5)  0                                * 89B6D  command 029 has no name
        CON(5)  0                                * 89B72  command 02A has no name
        CON(5)  0                                * 89B77  command 02B has no name
        CON(5)  0                                * 89B7C  command 02C has no name
        CON(5)  0                                * 89B81  command 02D has no name
        CON(5)  0                                * 89B86  command 02E has no name
        CON(5)  0                                * 89B8B  command 02F has no name
        CON(5)  0                                * 89B90  command 030 has no name
        CON(5)  0                                * 89B95  command 031 has no name
        CON(5)  0                                * 89B9A  command 032 has no name
        CON(5)  (*)-H0F1.FUNCTION                * 89B9F  name of command 033
        CON(5)  (*)-H0F1.CONIC                   * 89BA4  name of command 034
        CON(5)  (*)-H0F1.POLAR                   * 89BA9  name of command 035
        CON(5)  (*)-H0F1.PARAMETRIC              * 89BAE  name of command 036
        CON(5)  (*)-H0F1.TRUTH                   * 89BB3  name of command 037
        CON(5)  (*)-H0F1.SCATTER                 * 89BB8  name of command 038
        CON(5)  (*)-H0F1.HISTOGRAM               * 89BBD  name of command 039
        CON(5)  (*)-H0F1.BAR                     * 89BC2  name of command 03A
        ENDLENGTH                                * 89BC7

LIB0F1.link:
        CON(5)  DOHSTR                           * 89BC7  link table of library 0F1
        LENGTH                                   * 89BCC  length, to #89D1B
        REL(5)  VPARProject                      * 89BD1  000 
        REL(5)  VPARBounds                       * 89BD6  001 
        REL(5)  WireDraw                         * 89BDB  002 
        REL(5)  Plot3DLams                       * 89BE0  003 
        REL(5)  WireSetup                        * 89BE5  004 
        REL(5)  WireInit                         * 89BEA  005 
        REL(5)  Plot3DBegin                      * 89BEF  006 
        REL(5)  Plot3DRestore                    * 89BF4  007 
        REL(5)  WirePt                           * 89BF9  008 
        REL(5)  WireNext                         * 89BFE  009 
        REL(5)  RclVPAR                          * 89C03  00A 
        REL(5)  Plot3DVars                       * 89C08  00B 
        REL(5)  GridDraw                         * 89C0D  00C 
        REL(5)  GridSurfDraw                     * 89C12  00D 
        REL(5)  GridSurfSetup                    * 89C17  00E 
        REL(5)  GridRestore                      * 89C1C  00F 
        REL(5)  ParSurfDraw                      * 89C21  010 
        REL(5)  ParSurfEq                        * 89C26  011 
        REL(5)  ParSurfRestore                   * 89C2B  012 
        REL(5)  YSliceDraw                       * 89C30  013 
        REL(5)  YSliceSetup                      * 89C35  014 
        REL(5)  YSliceRestore                    * 89C3A  015 
        REL(5)  YSliceFrames                     * 89C3F  016 
        REL(5)  YSliceNoFrames                   * 89C44  017 
        REL(5)  YSliceShowY                      * 89C49  018 
        REL(5)  SlopeDraw                        * 89C4E  019 
        REL(5)  SlopeVPAR                        * 89C53  01A 
        REL(5)  SlopeFieldDraw                   * 89C58  01B 
        REL(5)  SlopeSetup                       * 89C5D  01C 
        REL(5)  SlopeRun                         * 89C62  01D 
        REL(5)  SlopePurge                       * 89C67  01E 
        REL(5)  SlopeRestore                     * 89C6C  01F 
        REL(5)  PContourDraw                     * 89C71  020 
        REL(5)  PContourEq                       * 89C76  021 
        REL(5)  PContourQuote                    * 89C7B  022 
        REL(5)  SlopeSeg                         * 89C80  023 
        REL(5)  LamN@                            * 89C85  024 
        REL(5)  LamN!                            * 89C8A  025 
        REL(5)  Plot3DMenu                       * 89C8F  026 
        REL(5)  PlotEvalChk                      * 89C94  027 
        REL(5)  PlotIOShow                       * 89C99  028 
        REL(5)  PlotTagOutput                    * 89C9E  029 
        REL(5)  ROMP_0F1_02A                     * 89CA3  02A 
        REL(5)  PlotTagInput                     * 89CA8  02B 
        REL(5)  PlotIOStack                      * 89CAD  02C 
        REL(5)  PlotEvalEQ                       * 89CB2  02D 
        REL(5)  PlotEvalEQ                       * 89CB7  02E 
        REL(5)  PlotEvalEQ                       * 89CBC  02F 
        REL(5)  PlotEvalEQ                       * 89CC1  030 
        REL(5)  PlotEvalSurf                     * 89CC6  031 
        REL(5)  PlotEvalOldEq                    * 89CCB  032 
        REL(5)  FUNCTION                         * 89CD0  033 FUNCTION
        REL(5)  CONIC                            * 89CD5  034 CONIC
        REL(5)  POLAR_8C9FD                      * 89CDA  035 POLAR
        REL(5)  PARAMETRIC                       * 89CDF  036 PARAMETRIC
        REL(5)  TRUTH                            * 89CE4  037 TRUTH
        REL(5)  SCATTER                          * 89CE9  038 SCATTER
        REL(5)  HISTOGRAM                        * 89CEE  039 HISTOGRAM
        REL(5)  BAR                              * 89CF3  03A BAR
        REL(5)  PTYPE>PINFO~1                    * 89CF8  03B 
        REL(5)  ChkPut('PPAR',li,s)~1            * 89CFD  03C 
        REL(5)  CHECKPVARS~3                     * 89D02  03D 
        REL(5)  PlotEnvOK                        * 89D07  03E 
        REL(5)  PlotEnvAbort                     * 89D0C  03F 
        REL(5)  PlotEnvExit                      * 89D11  040 
        REL(5)  EXPR>~1~romptr~1                 * 89D16  041 
        ENDLENGTH                                * 89D1B
        RPL

* ROMPTR 0F1 000
* refs (1): 8999A
* %min %max %x %y -> %min' %max': projects a point on the view plane through the eye (Ue, Ye) and widens the running range by it. On the eye's own plane it gives +-MAXR
VPARProject:
        :: SWAP LAM 'Ue %- SWAP LAM 'Ye %- DUP %0= ITE * 89D1B
          :: DROP %SGN %MAXREAL %* ;             * 89D5D
          :: %/ LAM 'Ue %+ ;                     * 89D7B
          SWAP OVER %MAX ROT ROT %MIN SWAP ;     * 89D9C

* ROMPTR 0F1 001
* refs (1): 8999A
* -> VPAR values, xmin xmax ymin ymax: reads VPAR and projects the view volume's corners to find the plot range
VPARBounds:
        :: XLIB RclVPAR BINT15 NDUP 5PICK 5PICK ' NULLLAM BINT15 NDUPN ' * 89DC4
          LAM 'Ue ' LAM 'Ye ROT #2+ {}N BIND %MAXREAL DUP %CHS 17GETLAM * 89E01
          15GETLAM XLIB VPARProject 17GETLAM 14GETLAM XLIB VPARProject * 89E48
          16GETLAM 15GETLAM XLIB VPARProject 16GETLAM 14GETLAM * 89E6D
          XLIB VPARProject 5GETLAM 2PUTLAM %MAXREAL DUP %CHS 13GETLAM * 89E8C
          15GETLAM XLIB VPARProject 13GETLAM 14GETLAM XLIB VPARProject * 89EB5
          12GETLAM 15GETLAM XLIB VPARProject 12GETLAM 14GETLAM * 89EDA
          XLIB VPARProject ABND ;                * 89EF9

* ROMPTR 0F1 002
* refs (1): 8999A
* Draws a WIREFRAME plot: the entry named in its plot-type list
WireDraw:
        :: XLIB VPARBounds XLIB Plot3DVars       * 89F0E

* ROMPTR 0F1 003
* refs (1): 8999A
* The local names bound for a VPAR-based plot: the 15 VPAR values, the 4 ranges, and the saved EQ, variables and PPAR
Plot3DLams:
          { LAM 'Xleft LAM 'Xright LAM 'Ynear LAM 'Yfar LAM 'Zlow LAM 'Zhigh * 89F29
            LAM 'XXleft LAM 'XXright LAM 'YYlow LAM 'YYhigh LAM 'Xe LAM 'Ye * 89F9E
            LAM 'Ze LAM 'Nx LAM 'Ny LAM 'xmin LAM 'xmax LAM 'ymin LAM 'ymax * 8A00C
            LAM 'oldeq LAM 'EQ LAM 'indepvar LAM 'dependvar LAM 'PPAR * 8A077
            LAM 'units }                         * 8A0DC
          BIND ERRSET                            * 8A0F4
          ::                                     * 8A0FE

* ROMPTR 0F1 004
* refs (1): 8999A
* -> : sets up a WIREFRAME as a parametric plot: PTYPE PARAMETRIC with variable 'XV, and EQ replaced by the perspective projection of the point as a complex number
WireSetup:
            :: 'IDPARAMETER PUTPTYPE LAM 'xmin LAM 'xmax xrng(2r) LAM 'ymin * 8A103
              LAM 'ymax yrng(2r) ' ID 'XV %0_2A2B4 LAM 'Nx %1- BINT3 {}N * 8A14A
              PUTINDEPLIST LAM 'Xright LAM 'Xleft %- LAM 'Nx %1- %/ ' ID 'XV * 8A193
              ' x* LAM 'Xleft BINT4 Cr x+ LAM 'indepvar CREATE LAM 'indepvar * 8A1EE
              LAM 'Xe                            * 8A251
              { x- LAM 'u x/ x+ } INNERCOMP 6PICK 3UNROLL #3+ LAM 'EQ SINNER * 8A25E
              top& LAM 'Ze                       * 8A2A8
              { x- LAM 'u x/ x+ } INNERCOMP 6PICK 3UNROLL #2+ top& * 8A2BA
              PTR addt2: C%i x* Cr x+ DUP DOSTOE ; * 8A2F7
            SINNER RESOROMP XLIB WirePt SWAP#1+ SYMBN RESOROMP XLIB WireNext * 8A31F
            ' PlotEval BINT2 ::N                 * 8A34E

* ROMPTR 0F1 005
* refs (1): 8999A
* Binds the WIREFRAME line state: the y step, the array of the previous line's points (csbar) and its index
WireInit:
            :: %1 res(r) LAM 'Yfar LAM 'dependvar CREATE LAM 'Yfar * 8A362
              LAM 'Ynear OVER %- LAM 'Ny %1- %/ SWAP LAM 'Ye %- LAM 'Nx * 8A3B3
              COERCE DUP BINT1 {}N C%0 MAKEARRY BINT1 TRUE BINT0 * 8A40B
              { LAM 'Ystp LAM 'u LAM 'cssz LAM 'csbar LAM 'csindex * 8A438
                LAM 'fscsbar LAM 'oldpt }        * 8A494
              BIND ;                             * 8A4C3
            ' PlotParamLine %1                   * 8A4CD

* ROMPTR 0F1 006
* refs (1): 8999A
* %res ... -> : common start of drawing: shows PICT, runs PLOTPREP and keeps the drawing routines in the plot environment's locals
Plot3DBegin:
            :: GDISPCENTER TURNMENUOFF PLOTPREP 18GETLAM #4- 18PUTLAM 3DROP * 8A4DC
              4PUTLAM 3PUTLAM ' 15GETLAM ' GETXPOS ' 1PUTLAM ' ' 6ROLL 6ROLL * 8A504
              BINT1 3GETLAM BINT8 ::N 2PUTLAM ;  * 8A540
            MakeIndep ERRSET                     * 8A55E
            :: LAM 'Ny COERCE BINT0 DO BINT1 LastPtArrays DROP PlotLoop * 8A568
              15GETLAM 17GETLAM NEWINDEP LAM 'Ystp LAM 'dependvar * 8A59D
              'EvalNoCK:_sup xSTO+ LAM 'Ystp ' LAM 'u 'EvalNoCK:_sup xSTO+ * 8A5D8
              FALSE ' LAM 'fscsbar STO LOOP ;    * 8A60D
            ERRTRAP                              * 8A63D
            :: ERROR@ #0= ?SEMI                  * 8A642
              PurgePlotVars ERRJMP ;             * 8A656
            PurgePlotVars 18GETLAM RESETDEPTH ABND ABND ABND ; * 8A665
          ERRTRAP ~'R;EVAL;ERRJMP                * 8A688

* ROMPTR 0F1 007
* refs (1): 8999A
* Purges the temporary variables and restores EQ and PPAR after a plot
Plot3DRestore:
          :: LAM 'indepvar ?PURGE_HERE LAM 'dependvar ?PURGE_HERE LAM 'oldeq * 8A692
            DOSTOE LAM 'PPAR ' ID PPAR STOAPPLDATA ; * 8A6E8
          ABND ;                                 * 8A71C

* ROMPTR 0F1 008
* refs (1): 8999A
* ob -> C%: a point of the current WIREFRAME line. Stores it in csbar and joins it to the same point of the previous line, except on the first line
WirePt:
        :: CK1NOLASTWD                           * 8A726
          :: CK&DISPATCH0                        * 8A730
            BINT2 NOP                            * 8A73A  complex
            BINT1                                * 8A744  real
            :: %0_2A2B4 %>C% ;                   * 8A749
            BINT10                               * 8A75D  name|local|algebraic
            :: RDROP cknumdsptch1 NOP XLIB WirePt ; * 8A762
          ;                                      * 8A786
          LAM 'csindex LAM 'fscsbar ?SKIP        * 8A78B
          :: LAM 'oldpt DUP                      * 8A7BE
            CON(5)  DOCMP                        * 8A7DB  DOCMP
            NIBHEX  FFF0000000000000FFF0000000000000 * 8A7E0  not a canonical number (a zero mantissa with exponent FFF), so written as nibbles
            EQUAL caseDROP 3PICK                 * 8A800
            line(2c) ;                           * 8A80F
          2DUP LAM 'csbar 3UNROLL PUTEL 2DROP ;  * 8A819

* ROMPTR 0F1 009
* refs (1): 8999A
* Advances csindex in csbar, wrapping at the end, and keeps the old point in oldpt; a slot holding the "no point" complex marks a gap
WireNext:
        :: LAM 'csbar                            * 8A845
          CON(5)  DOCMP                          * 8A85D  DOCMP
          NIBHEX  FFF0000000000000FFF0000000000000 * 8A862  not a canonical number (a zero mantissa with exponent FFF), so written as nibbles
          LAM 'csindex #1+ LAM 'cssz 2DUP #> ITE #- DROP * 8A882
          DUP ' LAM 'csindex STOLAM DUP LAM 'csbar GETATELN DROP ' * 8A8C8
          LAM 'oldpt STOLAM PUTEL DROP ;         * 8A915

* ROMPTR 0F1 00A
* refs (1): 8999A
* -> 15 reals: recalls VPAR, or makes the default one. Checks for a list of 15 reals, orders the five low/high pairs, keeps the eye at least 1 in front of the view volume, and makes Nx and Ny at least 2
RclVPAR:
        :: ' ID VPAR RclPlotVar? NOTcase         * 8A93C
          :: XLIB VparDefaults INCOMPDROP ;      * 8A95F
          DUPTYPELIST? NOTcase SETTYPEERR        * 8A979
          INNERCOMP BINT15 #= NOTcase SETSIZEERR * 8A988
          BINT15 BINT0 DO BINT15 ROLL DUPTYPEREAL? NOTcase SETTYPEERR * 8A9A1
          LOOP BINT5 BINT0 DO BINT15 ROLL BINT15 ROLL 2DUP %< ?SKIP SWAP * 8A9C9
          LOOP BINT15 ROLL BINT15 ROLL BINT10 PICK 2DUP SWAP %- %1 %< ITE * 8AA05
          :: SWAPDROP %1- ; DROP                 * 8AA46
          BINT15 ROLL BINT2 BINT0 DO BINT15 ROLL DUP %2 %< IT * 8AA5F
          :: DROP %2 ;                           * 8AA96
          LOOP ;                                 * 8AAAA

* ROMPTR 0F1 00B
* refs (1): 8999A
* Checks PPAR and EQ for a 3D plot (Nonexistent EQ otherwise) and gets the independent and dependent variable names, using the equation's variables when they are the same
Plot3DVars:
        :: CHECKPVARS DUP BINT3 NTHCOMPDROP DUPTYPELIST? ?CARCOMP OVER BINT7 * 8AAB4
          NTHCOMPDROP DUPTYPELIST? ?CARCOMP 'EQ SAFE@_HERE ?SKIP NOEQERR * 8AAE1
          2DUP EQUAL 4PICK 3PICK EQUALOR ?SKIP   * 8AB04
          :: DROP DORCLE ;                       * 8AB22
          DUPDUP EqList? ?CARCOMP EqRHS 5UNROLL 5UNROLL ROT %1 4PICK * 8AB36
          SAFE@_HERE NOT?SEMI                    * 8AB63
          DUPTYPEEXT? NOTcaseDROP UM>U           * 8AB6D
        ;                                        * 8AB7C

* ROMPTR 0F1 00C
* refs (1): 8999A
* Draws a GRIDMAP plot
GridDraw:
        :: FALSE                                 * 8AB81

* ROMPTR 0F1 00D
* refs (1): 8999A
* flag -> : draws GRIDMAP (FALSE) or PARSURFACE (TRUE), under an error trap that restores the settings
GridSurfDraw:
          :: Plot3DBind ERRSET                   * 8AB8B
            ::                                   * 8AB9A

* ROMPTR 0F1 00E
* refs (1): 8999A
* flag -> : picks the range, then makes one parametric plot of 'TTT that visits every grid point: the expressions built here turn 'TTT into the x and y of the grid
GridSurfSetup:
              :: ITE                             * 8AB9F
                :: LAM 'xmin LAM 'xmax LAM 'ymin LAM 'ymax ; * 8ABA9
                :: LAM 'Xleft LAM 'Xright LAM 'Ynear LAM 'Yfar ; * 8ABF7
                yrng(2r) xrng(2r) 'IDPARAMETER PUTPTYPE LAM 'XXleft * 8AC4D
                LAM 'XXright %- LAM 'YYhigh LAM 'YYlow %- LAM 'Nx LAM 'Ny %* * 8AC76
                DUP %1/ %1 SWAP %- DUP ' ID 'TTT ' x* %.5 6PICK %/ ' x+ * 8ACDE
                BINT5 SYMBN                      * 8AD33
                { LAM 'dx LAM 'dy LAM 'nxny LAM 'cc2 LAM 'cc3 } BIND * 8AD3D
                LAM 'XXright LAM 'dx %1 LAM 'Nx %1- %1/ %+ %* %.5 %-1 * 8AD95
                LAM 'Ny BINT5 LAM 'cc3           * 8ADE9
                SYMBOL x* xIP x^ %-.5 ; 2SINNERtop& top& LAM 'Ny SWAP#1+ * 8AE0A
                LAM 'cc3                         * 8AE44
                SYMBOL x* xFP x+ x* x+ x* x+ ; 2SINNERtop& top& %.5 LAM 'dx * 8AE53
                LAM 'Nx %1- %/ %* SWAP#1+ Cr x- LAM 'indepvar CREATE * 8AE9C
                LAM 'YYlow LAM 'dy LAM 'Ny %1- %/ LAM 'Ny BINT3 LAM 'cc3 * 8AEE5
                SYMBOL x* xIP x* x+ ; 2SINNERtop& top& SYMBN LAM 'dependvar * 8AF3D
                CREATE LAM 'XXright LAM 'dx LAM 'Nx %1- %/ LAM 'Nx BINT3 * 8AF85
                LAM 'cc3                         * 8AFD7
                SYMBOL x* xIP x* x+ ; 2SINNERtop& top& SYMBN ' LAM 'xmin STO * 8AFE6
                LAM 'YYlow LAM 'dy %1 LAM 'Ny %1- %1/ %+ %* %.5 %-1 LAM 'Nx * 8B02E
                BINT5 LAM 'cc3                   * 8B08B
                SYMBOL x* xIP x^ %-.5 ; 2SINNERtop& top& LAM 'Nx SWAP#1+ * 8B09F
                LAM 'cc3                         * 8B0D9
                SYMBOL x* xFP x+ x* x+ x* x+ ; 2SINNERtop& top& %.5 LAM 'dy * 8B0E8
                LAM 'Ny %1- %/ %* SWAP#1+ Cr x- ' LAM 'ymin STO LAM 'nxny * 8B131
                %1- %1/ ABND DUP res(r) ' ID 'TTT %0_2A2B4 %1 BINT3 {}N * 8B188
                PUTINDEPLIST DORCLE ' PlotEval ' PlotParamLine 4ROLL * 8B1C9
                XLIB Plot3DBegin MakeIndep DORCLE ; * 8B1EC
              DROP ERRSET                        * 8B206
              :: BINT1 LastPtArrays DROP PlotLoop 15GETLAM 17GETLAM NEWINDEP * 8B210
                LAM 'xmin LAM 'indepvar STO LAM 'ymin LAM 'dependvar STO * 8B238
                ~BINT1;ClrLastPt PlotLoop ;      * 8B298
              ERRTRAP                            * 8B2A7
              :: ERROR@ #0= ?SEMI                * 8B2AC
                PurgePlotVars ERRJMP ;           * 8B2C0
              PurgePlotVars 18GETLAM RESETDEPTH ABND ABND ; * 8B2CF
            ERRTRAP ~'R;EVAL;ERRJMP              * 8B2ED

* ROMPTR 0F1 00F
* refs (1): 8999A
* Purges the temporary variables and restores EQ and PPAR after GRIDMAP or PARSURFACE
GridRestore:
            :: LAM 'indepvar ?PURGE_HERE LAM 'dependvar ?PURGE_HERE * 8B2F7
              LAM 'oldeq DOSTOE LAM 'PPAR ' ID PPAR STOAPPLDATA ; * 8B33A
            ABND ;                               * 8B381
        ;                                        * 8B38B

* ROMPTR 0F1 010
* refs (1): 8999A
* Draws a PARSURFACE plot
ParSurfDraw:
        ::                                       * 8B390

* ROMPTR 0F1 011
* refs (1): 8999A
* -> ob: takes EQ as a list of three expressions and makes the complex projection of the surface point onto the view plane
ParSurfEq:
          :: XLIB VparEye@ DORCLE DUP TYPELIST? ?SKIP SETTYPEERR * 8B395
            DUP INNERCOMP #3= ?SKIP ARGNUMERR    * 8B3BE
            BINT3 nmetasyms                      * 8B3D7
            { LAM 'xe LAM 'ye LAM 'ze LAM 'eeq LAM 'xp LAM 'yp LAM 'zp } * 8B3E1
            BIND LAM 'zp SINNER LAM 'ze SWAP#1+ meta- LAM 'yp SINNER top& * 8B448
            LAM 'ye SWAP#1+ meta- meta/ LAM 'ze SWAP#1+ meta+ ' xi SWAP#1+ * 8B48D
            meta* LAM 'xp SINNER top& LAM 'xe SWAP#1+ meta- LAM 'yp SINNER * 8B4CF
            top& LAM 'ye SWAP#1+ meta- meta/ LAM 'xe SWAP#1+ meta+ Cr x+ ; * 8B514
          ERRSET                                 * 8B55B
          :: DOSTOE TRUE XLIB GridSurfDraw ; ERRTRAP ~'R;EVAL;ERRJMP * 8B560

* ROMPTR 0F1 012
* refs (1): 8999A
* Restores EQ after PARSURFACE
ParSurfRestore:
          :: LAM 'eeq DOSTOE ; ABND ;            * 8B589

* ROMPTR 0F1 013
* refs (1): 8999A
* Draws a YSLICE plot: one FUNCTION plot per y value, keeping each frame
YSliceDraw:
        :: Plot3DBind ERRSET                     * 8B5B1
          ::                                     * 8B5C0

* ROMPTR 0F1 014
* refs (1): 8999A
* -> : sets up a slice as a FUNCTION plot and binds the array of frames ('Ystp and the Ny locals after it)
YSliceSetup:
            :: 'IDFUNCTION PUTPTYPE LAM 'Xleft LAM 'Xright xrng(2r) * 8B5C5
              LAM 'Zlow LAM 'Zhigh yrng(2r) LAM 'indepvar PUTINDEP * 8B601
              LAM 'Xright LAM 'Xleft %- LAM 'Nx %1- %/ res(r) LAM 'EQ DUP * 8B648
              DOSTOE ' PlotEval LAM 'Yfar LAM 'Ynear OVER %- LAM 'Ny %1- %/ * 8B6A3
              SWAP LAM 'dependvar CREATE LAM 'Ny COERCE NULLHXS SWAP NDUPN * 8B6F7
              get1 ' NULLLAM 3PICK NDUPN ' LAM '#ny ' LAM 'Ystp ROT #2+ * 8B73D
              DOBIND ' PlotFcnPt %0_2A2B4 XLIB Plot3DBegin GETRES GetRes * 8B78A
              4PUTLAM MakeIndep DORCLE ;         * 8B7B3
            DROP ERRSET                          * 8B7C7
            :: LAM '#ny #2+ BINT1 ' LAM '#ny STOLAM BINT2 DO DOERASE BINT1 * 8B7D1
              LastPtArrays DROP PlotLoop GBUFF TOTEMPOB INDEX@ ' LAM 'Ystp * 8B81C
              XLIB LamN! INDEX@ ' LAM '#ny STOLAM 15GETLAM 17GETLAM NEWINDEP * 8B850
              LAM 'Ystp LAM 'dependvar 'EvalNoCK:_sup xSTO+ LOOP ; * 8B888
            ERRTRAP                              * 8B8C8
            :: ERROR@ BINT2 #< ?SEMI             * 8B8CD
              PurgePlotVars ERRJMP ;             * 8B8E6
            PurgePlotVars 18GETLAM RESETDEPTH ABND ABND LAM '#ny #1- DUP #0= * 8B8F5
            ?SKIP                                * 8B92C
            :: #3+ BINT3 DO INDEX@ GETLAM LOOP LAM '#ny #1- ; * 8B931
            UNCOERCE CK0NOLASTWD ABND ;          * 8B96D
          ERRTRAP ~'R;EVAL;ERRJMP                * 8B981

* ROMPTR 0F1 015
* refs (1): 8999A
* Purges the y variable and restores EQ and PPAR after YSLICE
YSliceRestore:
          :: LAM 'dependvar ?PURGE_HERE LAM 'oldeq DOSTOE LAM 'PPAR ' * 8B98B
            ID PPAR STOAPPLDATA ;                * 8B9DE
          ABND XLIB AnimateDefault ;             * 8B9F7

* ROMPTR 0F1 016
* refs (1): 8999A
* Takes the frames left on the stack by an earlier YSLICE back into the locals, when the stack holds them, so that the plot need not be drawn again
YSliceFrames:
        :: BINT18 PICK DUP dvarlsBIND #0=case XLIB YSliceNoFrames * 8BA0C
          DEPTH DUP 1GETLAM #< casedrop XLIB YSliceNoFrames * 8BA35
          1GETLAM #- #1+ DUP 1PUTLAM PICK DUPTYPEREAL? NOTcasedrop * 8BA59
          XLIB YSliceNoFrames                    * 8BA81
          COERCE LAM '#ny #MIN BINT19 PICK #1- #MIN BINT0 #=casedrop * 8BA8C
          XLIB YSliceNoFrames                    * 8BAC3
          DUP ' LAM '#ny STOLAM TRUE SWAP #2+ BINT2 DO INDEX@ 1GETLAM #+PICK * 8BACE
          DUPTYPEGROB? ROTAND SWAP INDEX@ ' LAM 'Ystp XLIB LamN! LOOP ITE * 8BB14
          :: GBUFF 1GETABND LAM '#ny #+ #1+PICK ZEROZERO ChkRepl(2go,2s) * 8BB53
            DROP CROSS_HAIRS ;                   * 8BB85

* ROMPTR 0F1 017
* refs (1): 8999A
* -> : no frames to take back: clears the count
YSliceNoFrames:
          :: BINT0 ' LAM '#ny STOLAM ABND ;      * 8BB94
        ;                                        * 8BBC1

* ROMPTR 0F1 018
* refs (1): 8999A
* -> : shows the frame for the value of the y variable
YSliceShowY:
        :: LAM 'dependvar DRPExitAtLOOP NOT?SEMI * 8BBC6
          DUPTYPEREAL? NOTcase DROP              * 8BBF0
          LAM 'Ynear %- LAM 'Ystp %ABS %/ DUP %0< caseDROP COERCE * 8BBFF
          #1+ OVER #3= ITE #1+ #1-               * 8BC46
          LAM '#ny #MIN DUP#0= caseDROP #1+      * 8BC64
          ' LAM 'Ystp XLIB LamN@ DROP GBUFF SWAP ZEROZERO ChkRepl(2go,2s) * 8BC87
          DROP CROSS_HAIRS ;                     * 8BCC1

* ROMPTR 0F1 019
* refs (1): 8999A
* Draws a SLOPEFIELD plot
SlopeDraw:
        ::                                       * 8BCD0

* ROMPTR 0F1 01A
* refs (1): 8999A
* Reads VPAR for a SLOPEFIELD plot: range from the volume, and the ranges set from it
SlopeVPAR:
          :: XLIB VPARBounds BINT4 ZERO_DO BINT19 PICK LOOP yrng(2r) * 8BCD5
            xrng(2r) XLIB Plot3DVars ;           * 8BD03

* ROMPTR 0F1 01B
* refs (1): 8999A
* Draws a field of short segments, for SLOPEFIELD and PCONTOUR
SlopeFieldDraw:
          :: XLIB Plot3DLams BIND ERRSET         * 8BD18
            ::                                   * 8BD32

* ROMPTR 0F1 01C
* refs (1): 8999A
* Sets the plot ranges, the variables and the grid steps hstp, vstp and the largest half-segment hofs, vofs (0.4 of a cell)
SlopeSetup:
              :: LAM 'Xleft LAM 'Xright xrng(2r) LAM 'Ynear LAM 'Yfar * 8BD37
                yrng(2r) LAM 'indepvar PUTINDEP LAM 'dependvar depnd(gn) * 8BD8D
                LAM 'EQ DUP DOSTOE ' PlotEval RESOROMP XLIB SlopeSeg % 4E-1 * 8BDD0
                LAM 'Xright LAM 'Xleft %- LAM 'Nx %/ DUP res(r) OVER OVER %* * 8BE16
                LAM 'Yfar LAM 'Ynear %- LAM 'Ny %/ 4ROLL OVER %* * 8BE6E
                { LAM 'hstp LAM 'hofs LAM 'vstp LAM 'vofs } BIND LAM 'hstp * 8BEB8
                XLIB Plot3DBegin LAM 'Yfar LAM 'vstp %.5 %* %- * 8BF1C
                LAM 'dependvar CREATE ;          * 8BF58
              ERRSET                             * 8BF7D
              ::                                 * 8BF82

* ROMPTR 0F1 01D
* refs (1): 8999A
* Evaluates EQ at every grid point, column by column
SlopeRun:
                :: 17GETLAM LAM 'hstp %.5 %* %+ 17PUTLAM MakeIndep * 8BF87
                  LAM 'indepvar LAM 'dependvar ' xi ' x* ' x+ BINT5 ::N ; * 8BFBB
                DROP ERRSET                      * 8C01C
                :: LAM 'Ny COERCE BINT0 DO PlotLoop 15GETLAM 17GETLAM * 8C026
                  NEWINDEP LAM 'dependvar LAM 'vstp 'EvalNoCK:_sup xSTO- * 8C056
                  LOOP ;                         * 8C091
                ERRTRAP                          * 8C09B
                :: ERROR@ #0= ?SEMI              * 8C0A0
                  PurgePlotVars ERRJMP ;         * 8C0B4
                PurgePlotVars 18GETLAM RESETDEPTH ; * 8C0C3
              ERRTRAP ~'R;EVAL;ERRJMP            * 8C0D7

* ROMPTR 0F1 01E
* refs (1): 8999A
* Purges the dependent variable after a field plot
SlopePurge:
              :: LAM 'dependvar ?PURGE_HERE ; ABND ABND ABND ; * 8C0E1
            ERRTRAP ~'R;EVAL;ERRJMP              * 8C11F

* ROMPTR 0F1 01F
* refs (1): 8999A
* Restores EQ and PPAR after a field plot
SlopeRestore:
            :: LAM 'oldeq DOSTOE LAM 'PPAR ' ID PPAR STOAPPLDATA ; ABND ; * 8C129
        ;                                        * 8C17F

* ROMPTR 0F1 020
* refs (1): 8999A
* Draws a PCONTOUR plot: a slope field of the curves of constant EQ
PContourDraw:
        ::                                       * 8C184

* ROMPTR 0F1 021
* refs (1): 8999A
* Makes the program << DERIV DERIV -> dx dy 'IFTE(dy==0,MAXR,-dx/dy)' >>: the slope of the level curve through a point
PContourEq:
          :: XLIB VPARBounds XLIB Plot3DVars     * 8C189
            { x<< DERIV DERIV xALG-> LAM 'dx LAM 'dy * 8C1A4
              SYMBOL LAM 'dy %0_2A2B4 x==        * 8C1D7
                SYMBOL xMAXR ;                   * 8C1F3
                SYMBOL LAM 'dx xNEG LAM 'dy x/ ; xIFTE ; * 8C202
              x>> }                              * 8C23A
            INNERCOMP BINT14 ROLL DUP BINT10 UNROLL BINT8 UNROLL BINT15 PICK * 8C244

* ROMPTR 0F1 022
* refs (1): 8999A
* ob -> a secondary that gives 'ob' in quotes, for PContourEq
PContourQuote:
            :: ' x' SWAP ' xENDTIC BINT3 ::N ; BINT10 UNROLL BINT15 PICK * 8C276
            XLIB PContourQuote BINT8 UNROLL #4+ ::N BINT5 UNROLL ; * 8C2B7
          XLIB SlopeFieldDraw ;                  * 8C2E5

* ROMPTR 0F1 023
* refs (1): 8999A
* % -> : draws one segment of the given slope, centred on the current point and clipped to hofs and vofs
SlopeSeg:
        :: DROP DUPTYPEREAL? NOTcase DROP        * 8C2F5
          DUP LAM 'hofs %* %ABS LAM 'vofs %> ITE * 8C30E
          :: LAM 'vofs DUP ROT %/ SWAP ;         * 8C349
          :: LAM 'hofs DUP ROT %* ;              * 8C378
          %>C% LAM 'indepvar EVAL LAM 'dependvar EVAL %>C% SWAP 2DUP C%C-C * 8C3A2
          3UNROLL C%C+C line(2c) ;               * 8C3F9

* ROMPTR 0F1 024
* refs (1): 8999A
* #n lam -> ob TRUE | FALSE: recalls the local bound n places after lam, without searching by name
LamN@:
        CODE                                     * 8C40D  148 nibbles
          GOSBVL  SAVPTR                         * 8C417
          C=DAT1  A                              * 8C41E
          D1=D1+  5                              * 8C421
          A=DAT1  A                              * 8C424
          D1=A                                   * 8C427
          D1=D1+  5                              * 8C42A
          A=DAT1  A                              * 8C42D
          R3=A.F  A                              * 8C430
          D1=C                                   * 8C436
          D1=D1+  5                              * 8C439
          CD1EX                                  * 8C43C
          R0=C.F  A                              * 8C43F
          GOSBVL  LrclR0A                        * 8C445
          GONC    LamN@.L1                       * 8C44C
          GOSBVL  GETPTR                         * 8C44F
          D1=D1+  10                             * 8C456
          D=D+CON A,2                            * 8C459
          LC(5)   FALSE                          * 8C45F
          A=C     A                              * 8C466
          PC=(A)                                 * 8C468
LamN@.L1:
          A=R3.F  A                              * 8C46C
          A=A+A   A                              * 8C472
          C=A     A                              * 8C474
          A=A+A   A                              * 8C476
          A=A+A   A                              * 8C478
          A=A+C   A                              * 8C47A
          CD0EX                                  * 8C47C
          C=C+A   A                              * 8C47F
          D0=C                                   * 8C481
          A=DAT0  A                              * 8C484
          GOSBVL  GETPTR                         * 8C487
          D1=D1+  5                              * 8C48E
          DAT1=A  A                              * 8C491
          D1=D1-  5                              * 8C494
          LC(5)   TRUE                           * 8C497
          DAT1=C  A                              * 8C49E
          A=DAT0  A                              * 8C4A1
          D0=D0+  5                              * 8C4A4
          PC=(A)                                 * 8C4A7
        ENDCODE                                  * 8C4AB

* ROMPTR 0F1 025
* refs (1): 8999A
* ob #n lam -> : stores into the local bound n places after lam
LamN!:
        CODE                                     * 8C4AB  134 nibbles
          D1=D1+  15                             * 8C4B5
          D=D+CON A,3                            * 8C4B8
          GOSBVL  SAVPTR                         * 8C4BE
          D1=D1-  5                              * 8C4C5
          C=DAT1  A                              * 8C4C8
          R2=C.F  A                              * 8C4CB
          D1=D1-  10                             * 8C4D1
          C=DAT1  A                              * 8C4D4
          D1=D1+  5                              * 8C4D7
          A=DAT1  A                              * 8C4DA
          D1=A                                   * 8C4DD
          D1=D1+  5                              * 8C4E0
          A=DAT1  A                              * 8C4E3
          R3=A.F  A                              * 8C4E6
          D1=C                                   * 8C4EC
          D1=D1+  5                              * 8C4EF
          CD1EX                                  * 8C4F2
          R0=C.F  A                              * 8C4F5
          GOSBVL  LrclR0A                        * 8C4FB
          GONC    LamN!.L1                       * 8C502
          GOSBVL  GETPTR                         * 8C505
          GOVLNG  DoErrULN                       * 8C50C
LamN!.L1:
          A=R3.F  A                              * 8C513
          A=A+A   A                              * 8C519
          C=A     A                              * 8C51B
          A=A+A   A                              * 8C51D
          A=A+A   A                              * 8C51F
          A=A+C   A                              * 8C521
          CD0EX                                  * 8C523
          C=C+A   A                              * 8C526
          D0=C                                   * 8C528
          A=R2.F  A                              * 8C52B
          DAT0=A  A                              * 8C531
          GOVLNG  GETPTRLOOP                     * 8C534
        ENDCODE                                  * 8C53B

* ROMPTR 0F1 026
* refs (1): 8999A
* -> { }: the menu keys of the 3D plots
Plot3DMenu:
        :: NoExitAction                          * 8C53B
          { OBJ_73503 OBJ_73365 OBJ_73388 OBJ_73503 OBJ_73447 OBJ_73495 } ; * 8C545

* ROMPTR 0F1 027
* refs (1): 8999A
* ob -> ob': evaluates with EVALCRUNCH and gives an error if nothing comes back
PlotEvalChk:
        :: DEPTH dvarlsBIND EVALCRUNCH DEPTH 1GETABND #< case Message60E * 8C572
        ;                                        * 8C59F

* ROMPTR 0F1 028
* refs (1): 8999A
* Runs the next object in the caller's stream, tags the result as output (or the variables as "INPUT") and shows it in the top of the display. Used by a 3D plot's trace keys
PlotIOShow:
        :: 'R 16GETLAM #1= ITE                   * 8C5A4

* ROMPTR 0F1 029
* refs (1): 8999A
* ob -> :OUTPUT:value: evaluates the point
PlotTagOutput:
          :: EVAL $ "OUTPUT" >TAG ;              * 8C5BD

* ROMPTR 0F1 02A
* refs (1): 8999A
ROMP_0F1_02A:
          :: BINT3 16PUTLAM                      * 8C5E7

* ROMPTR 0F1 02B
* refs (1): 8999A
* ob -> :INPUT:{ x y }: evaluates the two variables
PlotTagInput:
            :: DROP LAM 'dependvar XLIB PlotEvalChk dvarlsBIND LAM 'indepvar * 8C5F6
              XLIB PlotEvalChk 1GETABND BINT2 {}N $ "INPUT" >TAG ; * 8C644
          ;                                      * 8C67C
          BINT130 SWAP BINT32 %>CoordGrob CLEARMENU HARDBUFF2 BINT0 BINT2 * 8C681
          GROB! RDROP ;                          * 8C6A9

* ROMPTR 0F1 02C
* refs (1): 8999A
* As PlotIOShow, leaving the tagged object on the stack
PlotIOStack:
        :: 'R 16GETLAM #1= ITE XLIB PlotTagOutput XLIB PlotTagInput * 8C6B8
        ;                                        * 8C6E7

* ROMPTR 0F1 030
* refs (4): 8999A 8999A 8999A 8999A
* -> ob: evaluates EQ
PlotEvalEQ:
        :: LAM 'EQ XLIB PlotEvalChk ;            * 8C6EC

* ROMPTR 0F1 031
* refs (1): 8999A
* -> { x y z }: evaluates the three expressions of a PARSURFACE equation
PlotEvalSurf:
        :: LAM 'eeq BINT3 NTHCOMPDROP XLIB PlotEvalChk DUPDUP {'dv,'op,'nm} * 8C70E
          BIND LAM 'eeq BINT2 NTHCOMPDROP XLIB PlotEvalChk 2PUTLAM LAM 'eeq * 8C741
          CARCOMP XLIB PlotEvalChk 2GETLAM 1GETABND BINT3 {}N ; * 8C77E

* ROMPTR 0F1 032
* refs (1): 8999A
* -> ob: evaluates the saved equation's right side, for PCONTOUR
PlotEvalOldEq:
        :: LAM 'oldeq DUP EqList? IT CARCOMP     * 8C7A7
          DUP ALGeq? IT GETRHS                   * 8C7D3
          XLIB PlotEvalChk ;                     * 8C7E7

* ROMPTR 0F1 033
* refs (1): 8999A
        CON(1)  12                               * 8C7F7  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8C7F8  library
        CON(3)  #033                             * 8C7FB  command
* The object after a plot-type command is its information list, read through PTYPE>PINFO: drawing routine, axis setup, trace entries, evaluator, point plotter, step, and the environment routines
FUNCTION:
        :: CK0 'IDFUNCTION PUTPTYPE ;            * 8C7FE

        { FALSE DrawFunction NOP TRUE            * 8C817
          { ShowCoordsXY OBJ_73BEF OBJ_737F1     * 8C830
            { OBJ_73DE8 OBJ_73A8F }              * 8C844
            :: BINT25 GETLAM PTR NULL:: EQUALcasedrop Message60E * 8C858
              15GETLAM SWAP %>C% ;               * 8C876
          }                                      * 8C88A
          TRUE ~';PlotEval                       * 8C88F
          :: BINT31 TestSysFlag ITE              * 8C899  flag -31: Connect points / Plot points only
            :: ' PlotFcnDot ;                    * 8C8AD
            :: ' PlotFcnPt ;                     * 8C8C1
          ;                                      * 8C8D5
          :: %%1 10GETLAM %%/>% ; FALSE FALSE TRUE OBJ_73211 OBJ_73270 * 8C8DA
          XLIB PlotEnvAbort PictMenu }           * 8C90C

* ROMPTR 0F1 034
* refs (1): 8999A
        CON(1)  12                               * 8C921  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8C922  library
        CON(3)  #034                             * 8C925  command
CONIC:
        :: CK0 'IDCONIC PUTPTYPE ;               * 8C928

        { FALSE DrawConic NOP TRUE NULL{} FALSE ~';PlotEval * 8C941
          :: BINT31 TestSysFlag ITE              * 8C969  flag -31: Connect points / Plot points only
            :: ' PlotFcnDot ;                    * 8C97D
            :: ' PlotFcnPt ;                     * 8C991
          ;                                      * 8C9A5
          :: %%1 10GETLAM %%/>% ; FALSE FALSE TRUE OBJ_73211 OBJ_73270 * 8C9AA
          XLIB PlotEnvAbort PictMenuBare AutoScaleSq } * 8C9DC
