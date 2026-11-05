* HP 48GX ROM revision R, #A07E9-#A2436: Library 0E1: the Constants Library: browser, tables of 39 constants, and CONST
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ConstValue ConstSI ConstNames ConstMessages ConstENGL
* Follows on from the previous file (at #A07E9 in the original ROM).
        ENDLENGTH                                * A07E9

        CON(5)  DOLIB                            * A07E9  library object
        LENGTH                                   * A07EE  length, to #A2430
        CON(2)  0                                * A07F3  title length

* Library 0E1: The Constants Library: CONLIB's browser, CONST, and the tables of names, SI and English values and descriptions
LIB0E1:
        CON(3)  #0E1                             * A07F5  library number
        REL(5)  LIB0E1.hash                      * A07F8  hash table
        REL(5)  ConstMessages                    * A07FD  message table
        REL(5)  LIB0E1.link                      * A0802  link table
        CON(5)  0                                * A0807  config
        RPL

* ROMPTR 0E1 000
* refs (1): A07F5
* CONLIB: browses the constants, with local CLFlag: TRUE to show values, FALSE to show descriptions
CONLIB~1:
        :: RECLAIMDISP POLSaveUI ERRSET          * A080C
          :: ClrDA1IsStat FALSE                  * A0820
            { LAM CLFlag } BIND XLIB CONLIB~2 # E128 JstGetTHEMESG TOTEMPOB * A082F  "CONSTANTS LIBRARY"
            XLIB CONLIB~3 ONEONE XLIB ConstNames RESOROMP XLIB CONLIB~4 * A0870
            NULL{} XLIB ~BRbrowse ABND ClrDAsOK ; * A089B
          ERRTRAP POLResUI&Err POLRestoreUI ;    * A08BA

* ROMPTR 0E1 001
* refs (1): A07F5
* The browser's menu: SI ENGL UNITS VALUE →STK QUIT. Flags: user flag 60 clear for SI, set for English; user flag 61 set to leave out units
CONLIB~2:
        {                                        * A08CE
          {                                      * A08D3
            :: TakeOver $ "SI" BINT60 TestUserFlag NOT Box/StdLabel ; * A08D8
            :: TakeOver BINT60 TestUserFlag case * A0909
              :: BINT60 ClrUserFlag LAM CLFlag IT * A0922
                :: XLIB BRinverse XLIB BRDispItems XLIB BRinverse ; * A0949
                DispMenu ;                       * A0974
            ;                                    * A097E
          }                                      * A0983
          {                                      * A0988
            :: TakeOver $ "ENGL" BINT60 TestUserFlag Box/StdLabel ; * A098D
            :: TakeOver BINT60 TestUserFlag NOTcase * A09BD
              :: BINT60 SetUserFlag LAM CLFlag IT * A09D6
                :: XLIB BRinverse XLIB BRDispItems XLIB BRinverse ; * A09FD
                DispMenu ;                       * A0A28
            ;                                    * A0A32
          }                                      * A0A37
          {                                      * A0A3C
            :: TakeOver $ "UNITS" BINT61 TestUserFlag NOT Box/StdLabel ; * A0A41
            :: TakeOver BINT61 DUP UserITE ClrUserFlag SetUserFlag * A0A78
              LAM CLFlag IT                      * A0A9B
              :: XLIB BRinverse XLIB BRDispItems XLIB BRinverse ; * A0AB3
              DispMenu ;                         * A0ADE
          }                                      * A0AE8
          {                                      * A0AED
            :: TakeOver $ "VALUE" LAM CLFlag Box/StdLabel ; * A0AF2
            :: TakeOver LAM CLFlag ITE FALSE TRUE * A0B2D
              ' LAM CLFlag STO XLIB BRinverse XLIB BRDispItems * A0B59
              XLIB BRinverse DispMenu ;          * A0B8C
          }                                      * A0BA1
          { $ "→STK"                             * A0BA6
            :: TakeOver XLIB CONLIB~5 AtUserStack ; } * A0BBD
          { $ "QUIT"                             * A0BE1
            :: TakeOver XLIB BRdone ; }          * A0BF8
        }                                        * A0C17

* ROMPTR 0E1 002
* refs (1): A07F5
* ENTER and ON actions of the browser
CONLIB~3:
        { XLIB BRViewItem XLIB BRdone }          * A0C1C

* ROMPTR 0E1 003
* refs (1): A07F5
* #i list -> $: the browser's text: "name: value" or "name: description". With i = 0 gives the number of constants
CONLIB~4:
        :: DUP#0= case2drop # 27                 * A0C3C
          DUPUNROT NTHCOMPDROP $ ": " &$ SWAP LAM CLFlag ITE * A0C55
          :: XLIB ConstValue DUPTYPEEXT? ITE     * A0C8F
            :: DO>STR BINT2 OVERLEN$ #1- SUB$ ; DO>STR * A0CA9
          ;                                      * A0CD1
          :: # E100 #+ JstGetTHEMESG ;           * A0CD6
          &$ ;                                   * A0CF4

* ROMPTR 0E1 004
* refs (1): A07F5
* -> :name:value: →STK: the current constant, tagged
CONLIB~5:
        :: XLIB ~BRRclCurRow DUP XLIB ConstValue XLIB ConstNames ROT * A0CFE
          NTHCOMPDROP >TAG ;                     * A0D2E

* ROMPTR 0E1 005
* refs (1): A07F5
* List of the constants' names, in table order
ConstNames:
        { $ "NA" $ "k" $ "Vm" $ "R" $ "StdT" $ "StdP" $ "σ" $ "c" $ "ε0" * A0D3D
          $ "µ0" $ "g" $ "G" $ "h" $ "hbar" $ "q" $ "me" $ "qme" $ "mp" * A0DC0
          $ "mpme" $ "α" $ "Ø" $ "F" $ "R∞" $ "a0" $ "µB" $ "µN" $ "λ0" * A0E3C
          $ "f0" $ "λc" $ "rad" $ "twoπ" $ "angl" $ "c3" $ "kq" $ "ε0q" * A0EB8
          $ "qε0" $ "εsi" $ "εox" $ "I0" }       * A0F34

* ROMPTR 0E1 006
* refs (1): A07F5
* English values. The character D in a slot means the constant has no English form, and the SI value is used
ConstENGL:
        { CHR_D                                  * A0F77
          UNIT % 7.270063E-27 $ "Btu" $ "°R" um/ umEND ; * A0F81
          UNIT % 3.590394E2 $ "ft" %3 um^ $ "lbmol" um/ umEND ; * A0FC8
          UNIT % 1.073164E1 $ "psi" $ "ft" %3 um^ um* $ "lbmol" $ "°R" um* * A101D
            um/ umEND ;                          * A108B
          UNIT % 4.9167E2 $ "°R" umEND ;         * A109A
          UNIT % 1.46959E1 $ "psi" umEND ;       * A10CC
          UNIT % 1.71234E-9 $ "Btu" $ "h" $ "ft" %2 um^ um* $ "°R" %4 um^ * A1100
            um* um/ umEND ;                      * A116B
          UNIT % 9.83571056E8 $ "ft" tok_s um/ umEND ; CHR_D CHR_D * A117F
          UNIT % 3.2174E1 $ "ft" tok_s %2 um^ um/ umEND ; * A11C5
          UNIT % 3.32208E-11 $ "lbf" $ "ft" %2 um^ um* $ "lb" %2 um^ um/ * A120B
            umEND ;                              * A126F
          UNIT % 1.7445299E-40 $ "Btu" $ "h" um* umEND ; * A1279
          UNIT % 2.77650562E-41 $ "Btu" $ "h" um* umEND ; CHR_D CHR_D CHR_D * A12BE
          CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D CHR_D * A1312
          UNIT % 1.2398425E4 $ "Å" umEND ; CHR_D * A133F
          UNIT % 2.42631058E-2 $ "Å" umEND ; CHR_D CHR_D CHR_D * A1374
          UNIT % 5.215961E3 $ "µ" $ "°R" um* umEND ; CHR_D CHR_D CHR_D CHR_D * A13B3
          CHR_D CHR_D }                          * A140A

* ROMPTR 0E1 007
* refs (1): A07F5
* SI values, as unit objects or plain reals
ConstSI:
        {                                        * A1419
          UNIT % 6.0221367E23 tok1 $ "gmol" um/ umEND ; * A141E
          UNIT % 1.380658E-23 $ "J" $ "K" um/ umEND ; * A145E
          UNIT % 2.24141E1 $ "l" $ "gmol" um/ umEND ; * A149F
          UNIT % 8.31451E0 $ "J" $ "gmol" $ "K" um* um/ umEND ; * A14E6
          UNIT % 2.7315E2 $ "K" umEND ;          * A153E
          UNIT % 1.01325E2 CHR_k $ "Pa" umP umEND ; * A156E
          UNIT % 5.67051E-8 $ "W" tok_m %2 um^ $ "K" %4 um^ um* um/ umEND ; * A15AA
          UNIT % 2.99792458E8 tok_m tok_s um/ umEND ; * A1609
          UNIT % 8.85418781761E-12 $ "F" tok_m um/ umEND ; * A163C
          UNIT % 1.25663706144E-6 $ "H" tok_m um/ umEND ; * A1676
          UNIT % 9.80665E0 tok_m tok_s %2 um^ um/ umEND ; * A16B0
          UNIT % 6.67259E-11 tok_m %3 um^ tok_s %2 um^ CHR_k tok_g umP um* * A16ED
            um/ umEND ;                          * A1739
          UNIT % 6.6260755E-34 $ "J" tok_s um* umEND ; * A1748
          UNIT % 1.05457266E-34 $ "J" tok_s um* umEND ; * A1782
          UNIT % 1.60217733E-19 $ "C" umEND ;    * A17BC
          UNIT % 9.1093897E-31 CHR_k tok_g umP umEND ; * A17EC
          UNIT % 1.75881962E11 $ "C" CHR_k tok_g umP um/ umEND ; * A181F
          UNIT % 1.6726231E-27 CHR_k tok_g umP umEND ; % 1.836152701E3 * A1863
          % 7.29735308E-3                        * A18AB
          UNIT % 2.06783461E-15 $ "Wb" umEND ;   * A18C0
          UNIT % 9.6485309E4 $ "C" $ "gmol" um/ umEND ; * A18F2
          UNIT % 1.0973731534E7 tok1 tok_m um/ umEND ; * A1939
          UNIT % 5.29177249E-2 CHR_n tok_m umP umEND ; * A196C
          UNIT % 9.2740154E-24 $ "J" $ "T" um/ umEND ; * A199F
          UNIT % 5.0507866E-27 $ "J" $ "T" um/ umEND ; * A19E0
          UNIT % 1.2398425E3 CHR_n tok_m umP umEND ; * A1A21
          UNIT % 2.4179883E14 $ "Hz" umEND ;     * A1A54
          UNIT % 2.42631058E-3 CHR_n tok_m umP umEND ; * A1A86
          UNIT %1 $ "r" umEND ;                  * A1AB9
          UNIT % 6.28318530718E0 $ "r" umEND ;   * A1AD9
          UNIT % 1.8E2 $ "°" umEND ;             * A1B09
          UNIT % 2.897756E-3 tok_m $ "K" um* umEND ; * A1B39
          UNIT % 8.617386E-5 $ "J" $ "K" $ "C" um* um/ umEND ; * A1B73
          UNIT % 5.52634696E7 $ "F" tok_m $ "C" um* um/ umEND ; * A1BC5
          UNIT % 1.4185979E-30 $ "F" $ "C" um* tok_m um/ umEND ; % 1.19E1 * A1C10
          % 3.9E0                                * A1C70
          UNIT % 1E-12 $ "W" tok_m %2 um^ um/ umEND ; } * A1C85

* ROMPTR 0E1 008
* refs (1): A07F5
* 'name' -> value: CONST. A user variable called constname overrides the table. Error "Undefined Constant" for an unknown name
CONST~1:
        :: EDITDECOMP$ BINT2 OVERLEN$ #1- SUB$ DUP XLIB ConstNames NTHOF DUP * A1CCE
          #0=case XLIB CONST~2                   * A1D06
          SWAP $ "const" SWAP&$ $>ID SAFE@ ITE   * A1D16
          :: SWAPDROP DUPTYPEEXT? BINT61 TestUserFlag AND ?CARCOMP ; * A1D43
          XLIB ConstValue                        * A1D6B
        ;                                        * A1D76

* ROMPTR 0E1 009
* refs (1): A07F5
* #i -> value: constant i by flags: SI or English (user flag 60), units or not (user flag 61). Without units, angl (32) follows the angle mode: 180 in degrees, pi in radians, 200 in grads
ConstValue:
        :: DUP BINT60 UserITE                    * A1D7B
          :: XLIB ConstENGL OVER NTHCOMPDROP DUPTYPECHAR? IT * A1D8F
            :: XLIB ConstSI ROT NTHCOMPDROP ;    * A1DB3
            SWAPDROP ;                           * A1DD2
          :: XLIB ConstSI SWAP NTHCOMPDROP ; BINT61 UserITE * A1DDC
          :: DUPTYPEEXT? ?CARCOMP SWAP # 20 #= IT * A1E05
            :: BINT17 SysITE                     * A1E2D  flag -17: angle mode
              :: DROP %PI ;                      * A1E3C
              :: BINT18 TestSysFlag IT           * A1E50  flag -18: angle mode
                :: DROP % 2E2 ;                  * A1E64
              ;                                  * A1E88
            ;                                    * A1E8D
          ;                                      * A1E92
          SWAPDROP ;                             * A1E97

* ROMPTR 0E1 00A
* refs (1): A07F5
* Error "Undefined Constant"
CONST~2:
        :: # E129 ERROROUT ;                     * A1EA1  "Undefined Constant"

* ROMPTR 0E1 00B
* refs (1): A07F5
* Message table of library 0E1: the descriptions of the constants, then two more strings
ConstMessages:
        CON(5)  DOARRY                           * A1EBA  array 41
        LENGTH                                   * A1EBF  length, to #A2382
        CON(5)  DOCSTR                           * A1EC4  element type
        CON(5)  1                                * A1EC9  dimensions
        CON(5)  41                               * A1ECE
        $BODY   "Avogadro's number"              * A1ED3  1
        $BODY   "Boltzmann"                      * A1EFA  2
        $BODY   "molar volume"                   * A1F11  3
        $BODY   "universal gas"                  * A1F2E  4
        $BODY   "std temperature"                * A1F4D  5
        $BODY   "std pressure"                   * A1F70  6
        $BODY   "Stefan-Boltzmann"               * A1F8D  7
        $BODY   "speed of light"                 * A1FB2  8
        $BODY   "permittivity"                   * A1FD3  9
        $BODY   "permeability"                   * A1FF0  10
        $BODY   "accel of gravity"               * A200D  11
        $BODY   "gravitation"                    * A2032  12
        $BODY   "Planck's"                       * A204D  13
        $BODY   "Dirac's"                        * A2062  14
        $BODY   "electronic charge"              * A2075  15
        $BODY   "electron mass"                  * A209C  16
        $BODY   "q/me ratio"                     * A20BB  17
        $BODY   "proton mass"                    * A20D4  18
        $BODY   "mp/me ratio"                    * A20EF  19
        $BODY   "fine structure"                 * A210A  20
        $BODY   "mag flux quantum"               * A212B  21
        $BODY   "Faraday"                        * A2150  22
        $BODY   "Rydberg"                        * A2163  23
        $BODY   "Bohr radius"                    * A2176  24
        $BODY   "Bohr magneton"                  * A2191  25
        $BODY   "nuclear magneton"               * A21B0  26
        $BODY   "photon wavelength"              * A21D5  27
        $BODY   "photon frequency"               * A21FC  28
        $BODY   "Compton wavelen"                * A2221  29
        $BODY   "1 radian"                       * A2244  30
        $BODY   "2π radians"                     * A2259  31
        $BODY   "∡ in trig mode"                 * A2272  32
        $BODY   "Wien's"                         * A2293  33
        $BODY   "k/q"                            * A22A4  34
        $BODY   "ε0/q"                           * A22AF  35
        $BODY   "q*ε0"                           * A22BC  36
        $BODY   "dielectric const"               * A22C9  37
        $BODY   "SiO2 dielec cons"               * A22EE  38
        $BODY   "ref intensity"                  * A2313  39
        $BODY   "CONSTANTS LIBRARY"              * A2332  40
        $BODY   "Undefined Constant"             * A2359  41
        ENDLENGTH                                * A2382

LIB0E1.hash:
        CON(5)  DOHSTR                           * A2382  hash table of library 0E1
        LENGTH                                   * A2387  length, to #A23E6
        CON(5)  0                                * A238C  names of length 1
        CON(5)  0                                * A2391  names of length 2
        CON(5)  0                                * A2396  names of length 3
        CON(5)  0                                * A239B  names of length 4
        CON(5)  0                                * A23A0  names of length 5
        CON(5)  0                                * A23A5  names of length 6
        CON(5)  0                                * A23AA  names of length 7
        CON(5)  0                                * A23AF  names of length 8
        CON(5)  0                                * A23B4  names of length 9
        CON(5)  0                                * A23B9  names of length 10
        CON(5)  0                                * A23BE  names of length 11
        CON(5)  0                                * A23C3  names of length 12
        CON(5)  0                                * A23C8  names of length 13
        CON(5)  0                                * A23CD  names of length 14
        CON(5)  0                                * A23D2  names of length 15
        CON(5)  0                                * A23D7  names of length 16
        REL(5)  LIB0E1.hash.L1                   * A23DC  end of the names
LIB0E1.hash.L1:
        CON(5)  0                                * A23E1  command 000 has no name
        ENDLENGTH                                * A23E6

LIB0E1.link:
        CON(5)  DOHSTR                           * A23E6  link table of library 0E1
        LENGTH                                   * A23EB  length, to #A242C
        REL(5)  CONLIB~1                         * A23F0  000 
        REL(5)  CONLIB~2                         * A23F5  001 
        REL(5)  CONLIB~3                         * A23FA  002 
        REL(5)  CONLIB~4                         * A23FF  003 
        REL(5)  CONLIB~5                         * A2404  004 
        REL(5)  ConstNames                       * A2409  005 
        REL(5)  ConstENGL                        * A240E  006 
        REL(5)  ConstSI                          * A2413  007 
        REL(5)  CONST~1                          * A2418  008 
        REL(5)  ConstValue                       * A241D  009 
        REL(5)  CONST~2                          * A2422  00A 
        REL(5)  ConstMessages                    * A2427  00B 
        ENDLENGTH                                * A242C
        BSS     4                                * A242C  zeros
        ENDLENGTH                                * A2430

        LENGTH                                   * A2430  library object without its prolog (its place is the end of the link table before): length, to #B4B32
        CON(2)  0                                * A2435  no title
