* HP 48GX ROM revision R, #E384B-#E6DA4: Library header, subject names, text tables for Columns and Beams to Gases
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: EqTitle# EqTextGases EqTextForcesAndEnergy EqTextFluids EqTextElectricity EqTextColumnsAndBeams EqSubjects+2# EqSubjects# EqSubjectNames
* Follows on from the previous file (at #E384B in the original ROM).
        ENDLENGTH                                * E384B

        CON(5)  DOLIB                            * E384B  library object
        LENGTH                                   * E3850  length, to #FF959
        CON(2)  0                                * E3855  title length

* Library 0E2: The Equation Library's data: subjects, equation sets, descriptions of variables, default units in SI and English, and pictures. Its application is library 0E3.
LIB0E2:
        CON(3)  #0E2                             * E3857  library number
        REL(5)  LIB0E2.hash                      * E385A  hash table
        CON(5)  0                                * E385F  message table
        REL(5)  LIB0E2.link                      * E3864  link table
        CON(5)  0                                * E3869  config
        RPL

* Run on attaching the library: makes the library's ROM part of the search path.
        :: # E2 TOSRRP ;                         * E386E

LIB0E2.hash:
        CON(5)  DOHSTR                           * E3887  hash table of library 0E2
        LENGTH                                   * E388C  length, to #E38EB
        CON(5)  0                                * E3891  names of length 1
        CON(5)  0                                * E3896  names of length 2
        CON(5)  0                                * E389B  names of length 3
        CON(5)  0                                * E38A0  names of length 4
        CON(5)  0                                * E38A5  names of length 5
        CON(5)  0                                * E38AA  names of length 6
        CON(5)  0                                * E38AF  names of length 7
        CON(5)  0                                * E38B4  names of length 8
        CON(5)  0                                * E38B9  names of length 9
        CON(5)  0                                * E38BE  names of length 10
        CON(5)  0                                * E38C3  names of length 11
        CON(5)  0                                * E38C8  names of length 12
        CON(5)  0                                * E38CD  names of length 13
        CON(5)  0                                * E38D2  names of length 14
        CON(5)  0                                * E38D7  names of length 15
        CON(5)  0                                * E38DC  names of length 16
        REL(5)  LIB0E2.hash.L1                   * E38E1  end of the names
LIB0E2.hash.L1:
        CON(5)  0                                * E38E6  command 000 has no name
        ENDLENGTH                                * E38EB

LIB0E2.link:
        CON(5)  DOHSTR                           * E38EB  link table of library 0E2
        LENGTH                                   * E38F0  length, to #E3B07
        REL(5)  EqTitle#                         * E38F5  000 
        REL(5)  EqSubjects#                      * E38FA  001 
        REL(5)  EqSubjects+2#                    * E38FF  002 
        REL(5)  EqSubjectNames                   * E3904  003 
        REL(5)  EqTextColumnsAndBeams            * E3909  004 
        REL(5)  EqTextElectricity                * E390E  005 
        REL(5)  EqTextFluids                     * E3913  006 
        REL(5)  EqTextForcesAndEnergy            * E3918  007 
        REL(5)  EqTextGases                      * E391D  008 
        REL(5)  EqTextHeatTransfer               * E3922  009 
        REL(5)  EqTextMagnetism                  * E3927  00A 
        REL(5)  EqTextMotion                     * E392C  00B 
        REL(5)  EqTextOptics                     * E3931  00C 
        REL(5)  EqTextOscillations               * E3936  00D 
        REL(5)  EqTextPlaneGeometry              * E393B  00E 
        REL(5)  EqTextSolidGeometry              * E3940  00F 
        REL(5)  EqTextSolidStateDevices          * E3945  010 
        REL(5)  EqTextStressAnalysis             * E394A  011 
        REL(5)  EqTextWaves                      * E394F  012 
        REL(5)  EqUnitsEng                       * E3954  013 
        REL(5)  EqUnitsSI                        * E3959  014 
        REL(5)  EqSubjects                       * E395E  015 
        REL(5)  EqSubColumnsAndBeams             * E3963  016 
        REL(5)  EqSubElectricity                 * E3968  017 
        REL(5)  EqSubFluids                      * E396D  018 
        REL(5)  EqSubForcesAndEnergy             * E3972  019 
        REL(5)  EqSubGases                       * E3977  01A 
        REL(5)  EqSubHeatTransfer                * E397C  01B 
        REL(5)  EqSubMagnetism                   * E3981  01C 
        REL(5)  EqSubMotion                      * E3986  01D 
        REL(5)  EqSubOptics                      * E398B  01E 
        REL(5)  EqSubOscillations                * E3990  01F 
        REL(5)  EqSubPlaneGeometry               * E3995  020 
        REL(5)  EqSubSolidGeometry               * E399A  021 
        REL(5)  EqSubSolidStateDevices           * E399F  022 
        REL(5)  EqSubStressAnalysis              * E39A4  023 
        REL(5)  EqSubWaves                       * E39A9  024 
        REL(5)  EqVarsDeflect                    * E39AE  025 
        REL(5)  EqVarsSlope                      * E39B3  026 
        REL(5)  EqVarsMoment                     * E39B8  027 
        REL(5)  EqVarsSolid                      * E39BD  028 
        REL(5)  EqVarNames                       * E39C2  029 
        REL(5)  EqNoPic                          * E39C7  02A 
        REL(5)  EqPicCantilever                  * E39CC  02B 
        REL(5)  EqPicSimpleBeam                  * E39D1  02C 
        REL(5)  EqPicElasticBuckling             * E39D6  02D 
        REL(5)  EqPicEccentricColumns            * E39DB  02E 
        REL(5)  EqPicVoltageDivider              * E39E0  02F 
        REL(5)  EqPicCurrentDivider              * E39E5  030 
        REL(5)  EqPicSeriesAndParallelR          * E39EA  031 
        REL(5)  EqPicSeriesAndParallelC          * E39EF  032 
        REL(5)  EqPicSeriesAndParallelL          * E39F4  033 
        REL(5)  EqPicRLCCurrentDelay             * E39F9  034 
        REL(5)  EqPicRCTransient                 * E39FE  035 
        REL(5)  EqPicRLTransient                 * E3A03  036 
        REL(5)  EqPicPlateCapacitor              * E3A08  037 
        REL(5)  EqPicCylindricalCapacitor        * E3A0D  038 
        REL(5)  EqPicSolenoidInductance          * E3A12  039 
        REL(5)  EqPicToroidInductance            * E3A17  03A 
        REL(5)  EqPicPressureAtDepth             * E3A1C  03B 
        REL(5)  EqPicBernoulliEquation           * E3A21  03C 
        REL(5)  EqPicFlowWithLosses              * E3A26  03D 
        REL(5)  EqPicFlowInFullPipes             * E3A2B  03E 
        REL(5)  EqPicHookeSLaw                   * E3A30  03F 
        REL(5)  EqPic1DElasticCollisions         * E3A35  040 
        REL(5)  EqPicIsentropicFlow              * E3A3A  041 
        REL(5)  EqPicThermalExpansion            * E3A3F  042 
        REL(5)  EqPicConduction                  * E3A44  043 
        REL(5)  EqPicConvection                  * E3A49  044 
        REL(5)  EqPicConductionConvection        * E3A4E  045 
        REL(5)  EqPicBlackBodyRadiation          * E3A53  046 
        REL(5)  EqPicStraightWire                * E3A58  047 
        REL(5)  EqPicForceBetweenWires           * E3A5D  048 
        REL(5)  EqPicBFieldInSolenoid            * E3A62  049 
        REL(5)  EqPicBFieldInToroid              * E3A67  04A 
        REL(5)  EqPicProjectileMotion            * E3A6C  04B 
        REL(5)  EqPicLawOfRefraction             * E3A71  04C 
        REL(5)  EqPicCriticalAngle               * E3A76  04D 
        REL(5)  EqPicBrewsterSLaw                * E3A7B  04E 
        REL(5)  EqPicSphericalReflection         * E3A80  04F 
        REL(5)  EqPicSphericalRefraction         * E3A85  050 
        REL(5)  EqPicThinLens                    * E3A8A  051 
        REL(5)  EqPicSpring1                     * E3A8F  052 
        REL(5)  EqPicSpring2                     * E3A94  053 
        REL(5)  EqPicSpring3                     * E3A99  054 
        REL(5)  EqPicSimplePendulum              * E3A9E  055 
        REL(5)  EqPicConicalPendulum             * E3AA3  056 
        REL(5)  EqPicTorsionalPendulum           * E3AA8  057 
        REL(5)  EqPicCircle                      * E3AAD  058 
        REL(5)  EqPicEllipse                     * E3AB2  059 
        REL(5)  EqPicRectangle                   * E3AB7  05A 
        REL(5)  EqPicRegularPolygon              * E3ABC  05B 
        REL(5)  EqPicCircularRing                * E3AC1  05C 
        REL(5)  EqPicTriangle                    * E3AC6  05D 
        REL(5)  EqPicCone                        * E3ACB  05E 
        REL(5)  EqPicCylinder                    * E3AD0  05F 
        REL(5)  EqPicParallelepiped              * E3AD5  060 
        REL(5)  EqPicSphere                      * E3ADA  061 
        REL(5)  EqPicPNStepJunctions             * E3ADF  062 
        REL(5)  EqPicNMOSTransistors             * E3AE4  063 
        REL(5)  EqPicBipolarTransistors          * E3AE9  064 
        REL(5)  EqPicJFETs                       * E3AEE  065 
        REL(5)  EqPicNormalStress                * E3AF3  066 
        REL(5)  EqPicShearStress                 * E3AF8  067 
        REL(5)  EqPicStressOnAnElement           * E3AFD  068 
        REL(5)  EqPicMohrSCircle                 * E3B02  069 
        ENDLENGTH                                * E3B07

* ROMPTR 0E2 000
* refs (1): E3857
* # 16: the entry of the text table that holds the title "EQUATION LIBRARY".
EqTitle#:
        # 10                                     * E3B07  16

* ROMPTR 0E2 001
* refs (1): E3857
* # 15: the number of subjects.
EqSubjects#:
        # F                                      * E3B11  15

* ROMPTR 0E2 002
* refs (1): E3857
* # 17.
EqSubjects+2#:
        # 11                                     * E3B1B  17

* ROMPTR 0E2 003
* refs (1): E3857
* Array of strings: the names of the 15 subjects in catalog order, and the title of the application.
EqSubjectNames:
        CON(5)  DOARRY                           * E3B25  array 16
        LENGTH                                   * E3B2A  length, to #E3D00
        CON(5)  DOCSTR                           * E3B2F  element type
        CON(5)  1                                * E3B34  dimensions
        CON(5)  16                               * E3B39
        $BODY   "Columns and Beams"              * E3B3E  1
        $BODY   "Electricity"                    * E3B65  2
        $BODY   "Fluids"                         * E3B80  3
        $BODY   "Forces and Energy"              * E3B91  4
        $BODY   "Gases"                          * E3BB8  5
        $BODY   "Heat Transfer"                  * E3BC7  6
        $BODY   "Magnetism"                      * E3BE6  7
        $BODY   "Motion"                         * E3BFD  8
        $BODY   "Optics"                         * E3C0E  9
        $BODY   "Oscillations"                   * E3C1F  10
        $BODY   "Plane Geometry"                 * E3C3C  11
        $BODY   "Solid Geometry"                 * E3C5D  12
        $BODY   "Solid State Devices"            * E3C7E  13
        $BODY   "Stress Analysis"                * E3CA9  14
        $BODY   "Waves"                          * E3CCC  15
        $BODY   "EQUATION LIBRARY"               * E3CDB  16
        ENDLENGTH                                * E3D00

* ROMPTR 0E2 004
* refs (1): E3857
* Text of the subject Columns and Beams: first the titles of its equation sets, then the descriptions of its variables.
EqTextColumnsAndBeams:
        CON(5)  DOARRY                           * E3D00  array 69
        LENGTH                                   * E3D05  length, to #E45C6
        CON(5)  DOCSTR                           * E3D0A  element type
        CON(5)  1                                * E3D0F  dimensions
        CON(5)  69                               * E3D14
        $BODY   "Elastic Buckling"               * E3D19  1
        $BODY   "Eccentric Columns"              * E3D3E  2
        $BODY   "Simple Deflection"              * E3D65  3
        $BODY   "Simple Slope"                   * E3D8C  4
        $BODY   "Simple Moment"                  * E3DA9  5
        $BODY   "Simple Shear"                   * E3DC8  6
        $BODY   "Cantilever Deflection"          * E3DE5  7
        $BODY   "Cantilever Slope"               * E3E14  8
        $BODY   "Cantilever Moment"              * E3E39  9
        $BODY   "Cantilever Shear"               * E3E60  10
        $BODY   "length"                         * E3E85  11
        $BODY   "eff length factor"              * E3E96  12
        $BODY   "radius of gyration"             * E3EBD  13
        $BODY   "modulus of elas"                * E3EE6  14
        $BODY   "moment of inertia"              * E3F09  15
        $BODY   "area"                           * E3F30  16
        $BODY   "critical load"                  * E3F3D  17
        $BODY   "critical stress"                * E3F5C  18
        $BODY   "length"                         * E3F7F  19
        $BODY   "eff length factor"              * E3F90  20
        $BODY   "radius of gyration"             * E3FB7  21
        $BODY   "modulus of elas"                * E3FE0  22
        $BODY   "moment of inertia"              * E4003  23
        $BODY   "area"                           * E402A  24
        $BODY   "eccentricity"                   * E4037  25
        $BODY   "dist to edge fiber"             * E4054  26
        $BODY   "load"                           * E407D  27
        $BODY   "maximum stress"                 * E408A  28
        $BODY   "length"                         * E40AB  29
        $BODY   "modulus of elas"                * E40BC  30
        $BODY   "moment of inertia"              * E40DF  31
        $BODY   "dist to point load"             * E4106  32
        $BODY   "point load"                     * E412F  33
        $BODY   "dist to app moment"             * E4148  34
        $BODY   "applied moment"                 * E4171  35
        $BODY   "distributed load"               * E4192  36
        $BODY   "dist along beam"                * E41B7  37
        $BODY   "deflection"                     * E41DA  38
        $BODY   "length"                         * E41F3  39
        $BODY   "modulus of elas"                * E4204  40
        $BODY   "moment of inertia"              * E4227  41
        $BODY   "dist to point load"             * E424E  42
        $BODY   "point load"                     * E4277  43
        $BODY   "dist to app moment"             * E4290  44
        $BODY   "applied moment"                 * E42B9  45
        $BODY   "distributed load"               * E42DA  46
        $BODY   "dist along beam"                * E42FF  47
        $BODY   "slope"                          * E4322  48
        $BODY   "length"                         * E4331  49
        $BODY   "dist to point load"             * E4342  50
        $BODY   "point load"                     * E436B  51
        $BODY   "dist to app moment"             * E4384  52
        $BODY   "applied moment"                 * E43AD  53
        $BODY   "distributed load"               * E43CE  54
        $BODY   "dist along beam"                * E43F3  55
        $BODY   "internal moment"                * E4416  56
        $BODY   "length"                         * E4439  57
        $BODY   "dist to point load"             * E444A  58
        $BODY   "point load"                     * E4473  59
        $BODY   "applied moment"                 * E448C  60
        $BODY   "distributed load"               * E44AD  61
        $BODY   "dist along beam"                * E44D2  62
        $BODY   "shear force"                    * E44F5  63
        $BODY   "length"                         * E4510  64
        $BODY   "dist to point load"             * E4521  65
        $BODY   "point load"                     * E454A  66
        $BODY   "distributed load"               * E4563  67
        $BODY   "dist along beam"                * E4588  68
        $BODY   "shear force"                    * E45AB  69
        ENDLENGTH                                * E45C6

* ROMPTR 0E2 005
* refs (1): E3857
* Text of the subject Electricity: first the titles of its equation sets, then the descriptions of its variables.
EqTextElectricity:
        CON(5)  DOARRY                           * E45C6  array 141
        LENGTH                                   * E45CB  length, to #E5636
        CON(5)  DOCSTR                           * E45D0  element type
        CON(5)  1                                * E45D5  dimensions
        CON(5)  141                              * E45DA
        $BODY   "Coulomb's Law"                  * E45DF  1
        $BODY   "Ohm's Law and Power"            * E45FE  2
        $BODY   "Voltage Divider"                * E4629  3
        $BODY   "Current Divider"                * E464C  4
        $BODY   "Wire Resistance"                * E466F  5
        $BODY   "Series and Parallel R"          * E4692  6
        $BODY   "Series and Parallel C"          * E46C1  7
        $BODY   "Series and Parallel L"          * E46F0  8
        $BODY   "Capacitive Energy"              * E471F  9
        $BODY   "Inductive Energy"               * E4746  10
        $BODY   "RLC Current Delay"              * E476B  11
        $BODY   "DC Capacitor Current"           * E4792  12
        $BODY   "Capacitor Charge"               * E47BF  13
        $BODY   "DC Inductor Voltage"            * E47E4  14
        $BODY   "RC Transient"                   * E480F  15
        $BODY   "RL Transient"                   * E482C  16
        $BODY   "Resonant Frequency"             * E4849  17
        $BODY   "Plate Capacitor"                * E4872  18
        $BODY   "Cylindrical Capacitor"          * E4895  19
        $BODY   "Solenoid Inductance"            * E48C4  20
        $BODY   "Toroid Inductance"              * E48EF  21
        $BODY   "Sinusoidal Voltage"             * E4916  22
        $BODY   "Sinusoidal Current"             * E493F  23
        $BODY   "point 1 charge"                 * E4968  24
        $BODY   "point 2 charge"                 * E4989  25
        $BODY   "charge distance"                * E49AA  26
        $BODY   "rel permittivity"               * E49CD  27
        $BODY   "force"                          * E49F2  28
        $BODY   "voltage"                        * E4A01  29
        $BODY   "current"                        * E4A14  30
        $BODY   "resistance"                     * E4A27  31
        $BODY   "power"                          * E4A40  32
        $BODY   "resistance 1"                   * E4A4F  33
        $BODY   "resistance 2"                   * E4A6C  34
        $BODY   "total voltage"                  * E4A89  35
        $BODY   "voltage across R1"              * E4AA8  36
        $BODY   "resistance 1"                   * E4ACF  37
        $BODY   "resistance 2"                   * E4AEC  38
        $BODY   "total current"                  * E4B09  39
        $BODY   "current in R1"                  * E4B28  40
        $BODY   "resistivity"                    * E4B47  41
        $BODY   "length"                         * E4B62  42
        $BODY   "area"                           * E4B73  43
        $BODY   "resistance"                     * E4B80  44
        $BODY   "resistance 1"                   * E4B99  45
        $BODY   "resistance 2"                   * E4BB6  46
        $BODY   "series R"                       * E4BD3  47
        $BODY   "parallel R"                     * E4BE8  48
        $BODY   "capacitance 1"                  * E4C01  49
        $BODY   "capacitance 2"                  * E4C20  50
        $BODY   "series C"                       * E4C3F  51
        $BODY   "parallel C"                     * E4C54  52
        $BODY   "inductance 1"                   * E4C6D  53
        $BODY   "inductance 2"                   * E4C8A  54
        $BODY   "series L"                       * E4CA7  55
        $BODY   "parallel L"                     * E4CBC  56
        $BODY   "energy"                         * E4CD5  57
        $BODY   "capacitance"                    * E4CE6  58
        $BODY   "voltage"                        * E4D01  59
        $BODY   "energy"                         * E4D14  60
        $BODY   "inductance"                     * E4D25  61
        $BODY   "current"                        * E4D3E  62
        $BODY   "angular frequency"              * E4D51  63
        $BODY   "frequency"                      * E4D78  64
        $BODY   "capacitance"                    * E4D8F  65
        $BODY   "inductance"                     * E4DAA  66
        $BODY   "reactance of C"                 * E4DC3  67
        $BODY   "reactance of L"                 * E4DE4  68
        $BODY   "resistance"                     * E4E05  69
        $BODY   "series phase ∡"                 * E4E1E  70
        $BODY   "parallel phase ∡"               * E4E3F  71
        $BODY   "capacitance"                    * E4E64  72
        $BODY   "voltage change"                 * E4E7F  73
        $BODY   "time change"                    * E4EA0  74
        $BODY   "current"                        * E4EBB  75
        $BODY   "initial voltage"                * E4ECE  76
        $BODY   "final voltage"                  * E4EF1  77
        $BODY   "initial time"                   * E4F10  78
        $BODY   "final time"                     * E4F2D  79
        $BODY   "capacitance"                    * E4F46  80
        $BODY   "voltage"                        * E4F61  81
        $BODY   "charge"                         * E4F74  82
        $BODY   "inductance"                     * E4F85  83
        $BODY   "current change"                 * E4F9E  84
        $BODY   "time change"                    * E4FBF  85
        $BODY   "voltage"                        * E4FDA  86
        $BODY   "initial current"                * E4FED  87
        $BODY   "final current"                  * E5010  88
        $BODY   "initial time"                   * E502F  89
        $BODY   "final time"                     * E504C  90
        $BODY   "initial voltage"                * E5065  91
        $BODY   "final voltage"                  * E5088  92
        $BODY   "capacitance"                    * E50A7  93
        $BODY   "resistance"                     * E50C2  94
        $BODY   "time"                           * E50DB  95
        $BODY   "capacitor voltage"              * E50E8  96
        $BODY   "initial voltage"                * E510F  97
        $BODY   "final voltage"                  * E5132  98
        $BODY   "inductance"                     * E5151  99
        $BODY   "resistance"                     * E516A  100
        $BODY   "time"                           * E5183  101
        $BODY   "inductor current"               * E5190  102
        $BODY   "inductance"                     * E51B5  103
        $BODY   "capacitance"                    * E51CE  104
        $BODY   "resistance"                     * E51E9  105
        $BODY   "resonant ang freq"              * E5202  106
        $BODY   "series Q-factor"                * E5229  107
        $BODY   "parallel Q-factor"              * E524C  108
        $BODY   "resonant freq"                  * E5273  109
        $BODY   "rel permittivity"               * E5292  110
        $BODY   "plate area"                     * E52B7  111
        $BODY   "plate separation"               * E52D0  112
        $BODY   "capacitance"                    * E52F5  113
        $BODY   "rel permittivity"               * E5310  114
        $BODY   "inside radius"                  * E5335  115
        $BODY   "outside radius"                 * E5354  116
        $BODY   "length"                         * E5375  117
        $BODY   "capacitance"                    * E5386  118
        $BODY   "rel permeability"               * E53A1  119
        $BODY   "turns/unit length"              * E53C6  120
        $BODY   "cross-section area"             * E53ED  121
        $BODY   "length"                         * E5416  122
        $BODY   "inductance"                     * E5427  123
        $BODY   "rel permeability"               * E5440  124
        $BODY   "total turns"                    * E5465  125
        $BODY   "toroid thickness"               * E5480  126
        $BODY   "inside radius"                  * E54A5  127
        $BODY   "outside radius"                 * E54C4  128
        $BODY   "inductance"                     * E54E5  129
        $BODY   "angular frequency"              * E54FE  130
        $BODY   "frequency"                      * E5525  131
        $BODY   "time"                           * E553C  132
        $BODY   "phase angle"                    * E5549  133
        $BODY   "maximum voltage"                * E5564  134
        $BODY   "voltage"                        * E5587  135
        $BODY   "angular frequency"              * E559A  136
        $BODY   "frequency"                      * E55C1  137
        $BODY   "time"                           * E55D8  138
        $BODY   "phase angle"                    * E55E5  139
        $BODY   "maximum current"                * E5600  140
        $BODY   "current"                        * E5623  141
        ENDLENGTH                                * E5636

* ROMPTR 0E2 006
* refs (1): E3857
* Text of the subject Fluids: first the titles of its equation sets, then the descriptions of its variables.
EqTextFluids:
        CON(5)  DOARRY                           * E5636  array 59
        LENGTH                                   * E563B  length, to #E5D6C
        CON(5)  DOCSTR                           * E5640  element type
        CON(5)  1                                * E5645  dimensions
        CON(5)  59                               * E564A
        $BODY   "Pressure at Depth"              * E564F  1
        $BODY   "Bernoulli Equation"             * E5676  2
        $BODY   "Flow with Losses"               * E569F  3
        $BODY   "Flow in Full Pipes"             * E56C4  4
        $BODY   "reference press"                * E56ED  5
        $BODY   "pressure"                       * E5710  6
        $BODY   "depth"                          * E5725  7
        $BODY   "density"                        * E5734  8
        $BODY   "pressure change"                * E5747  9
        $BODY   "initial pressure"               * E576A  10
        $BODY   "final pressure"                 * E578F  11
        $BODY   "height change"                  * E57B0  12
        $BODY   "initial height"                 * E57CF  13
        $BODY   "final height"                   * E57F0  14
        $BODY   "initial velocity"               * E580D  15
        $BODY   "final velocity"                 * E5832  16
        $BODY   "initial area"                   * E5853  17
        $BODY   "final area"                     * E5870  18
        $BODY   "initial diameter"               * E5889  19
        $BODY   "final diameter"                 * E58AE  20
        $BODY   "density"                        * E58CF  21
        $BODY   "volume flow rate"               * E58E2  22
        $BODY   "mass flow rate"                 * E5907  23
        $BODY   "pressure change"                * E5928  24
        $BODY   "initial pressure"               * E594B  25
        $BODY   "final pressure"                 * E5970  26
        $BODY   "height change"                  * E5991  27
        $BODY   "initial height"                 * E59B0  28
        $BODY   "final height"                   * E59D1  29
        $BODY   "initial velocity"               * E59EE  30
        $BODY   "final velocity"                 * E5A13  31
        $BODY   "initial area"                   * E5A34  32
        $BODY   "final area"                     * E5A51  33
        $BODY   "initial diameter"               * E5A6A  34
        $BODY   "final diameter"                 * E5A8F  35
        $BODY   "density"                        * E5AB0  36
        $BODY   "volume flow rate"               * E5AC3  37
        $BODY   "mass flow rate"                 * E5AE8  38
        $BODY   "head loss"                      * E5B09  39
        $BODY   "power input"                    * E5B20  40
        $BODY   "pressure change"                * E5B3B  41
        $BODY   "initial pressure"               * E5B5E  42
        $BODY   "final pressure"                 * E5B83  43
        $BODY   "height change"                  * E5BA4  44
        $BODY   "initial height"                 * E5BC3  45
        $BODY   "final height"                   * E5BE4  46
        $BODY   "avg velocity"                   * E5C01  47
        $BODY   "area"                           * E5C1E  48
        $BODY   "diameter"                       * E5C2B  49
        $BODY   "length"                         * E5C40  50
        $BODY   "roughness"                      * E5C51  51
        $BODY   "tot fitting coefs"              * E5C68  52
        $BODY   "density"                        * E5C8F  53
        $BODY   "dynamic viscosity"              * E5CA2  54
        $BODY   "kinematic vis"                  * E5CC9  55
        $BODY   "volume flow rate"               * E5CE8  56
        $BODY   "mass flow rate"                 * E5D0D  57
        $BODY   "power input"                    * E5D2E  58
        $BODY   "Reynolds number"                * E5D49  59
        ENDLENGTH                                * E5D6C

* ROMPTR 0E2 007
* refs (1): E3857
* Text of the subject Forces and Energy: first the titles of its equation sets, then the descriptions of its variables.
EqTextForcesAndEnergy:
        CON(5)  DOARRY                           * E5D6C  array 66
        LENGTH                                   * E5D71  length, to #E6537
        CON(5)  DOCSTR                           * E5D76  element type
        CON(5)  1                                * E5D7B  dimensions
        CON(5)  66                               * E5D80
        $BODY   "Linear Mechanics"               * E5D85  1
        $BODY   "Angular Mechanics"              * E5DAA  2
        $BODY   "Centripetal Force"              * E5DD1  3
        $BODY   "Hooke's Law"                    * E5DF8  4
        $BODY   "1D Elastic Collisions"          * E5E13  5
        $BODY   "Drag Force"                     * E5E42  6
        $BODY   "Law of Gravitation"             * E5E5B  7
        $BODY   "Mass-Energy Relation"           * E5E84  8
        $BODY   "mass"                           * E5EB1  9
        $BODY   "acceleration"                   * E5EBE  10
        $BODY   "velocity"                       * E5EDB  11
        $BODY   "initial velocity"               * E5EF0  12
        $BODY   "final velocity"                 * E5F15  13
        $BODY   "displacement"                   * E5F36  14
        $BODY   "time"                           * E5F53  15
        $BODY   "force"                          * E5F60  16
        $BODY   "init kin energy"                * E5F6F  17
        $BODY   "final kin energy"               * E5F92  18
        $BODY   "work"                           * E5FB7  19
        $BODY   "instantaneous pwr"              * E5FC4  20
        $BODY   "average power"                  * E5FEB  21
        $BODY   "moment of inertia"              * E600A  22
        $BODY   "ang acceleration"               * E6031  23
        $BODY   "angular velocity"               * E6056  24
        $BODY   "init ang velocity"              * E607B  25
        $BODY   "final ang vel"                  * E60A2  26
        $BODY   "ang displacement"               * E60C1  27
        $BODY   "time"                           * E60E6  28
        $BODY   "torque"                         * E60F3  29
        $BODY   "init kin energy"                * E6104  30
        $BODY   "final kin energy"               * E6127  31
        $BODY   "work"                           * E614C  32
        $BODY   "instantaneous pwr"              * E6159  33
        $BODY   "average power"                  * E6180  34
        $BODY   "tangential accel"               * E619F  35
        $BODY   "rotational radius"              * E61C4  36
        $BODY   "rotational speed"               * E61EB  37
        $BODY   "initial rot speed"              * E6210  38
        $BODY   "final rot speed"                * E6237  39
        $BODY   "mass"                           * E625A  40
        $BODY   "radius"                         * E6267  41
        $BODY   "velocity"                       * E6278  42
        $BODY   "centripetal accel"              * E628D  43
        $BODY   "angular velocity"               * E62B4  44
        $BODY   "force"                          * E62D9  45
        $BODY   "rotational speed"               * E62E8  46
        $BODY   "spring constant"                * E630D  47
        $BODY   "displacement"                   * E6330  48
        $BODY   "spring force"                   * E634D  49
        $BODY   "work"                           * E636A  50
        $BODY   "object 1 mass"                  * E6377  51
        $BODY   "object 2 mass"                  * E6396  52
        $BODY   "obj 1 init vel"                 * E63B5  53
        $BODY   "obj 1 final vel"                * E63D6  54
        $BODY   "obj 2 final vel"                * E63F9  55
        $BODY   "drag coefficient"               * E641C  56
        $BODY   "fluid density"                  * E6441  57
        $BODY   "projected area"                 * E6460  58
        $BODY   "velocity"                       * E6481  59
        $BODY   "drag force"                     * E6496  60
        $BODY   "mass 1"                         * E64AF  61
        $BODY   "mass 2"                         * E64C0  62
        $BODY   "separation dist"                * E64D1  63
        $BODY   "attractive force"               * E64F4  64
        $BODY   "mass"                           * E6519  65
        $BODY   "energy"                         * E6526  66
        ENDLENGTH                                * E6537

* ROMPTR 0E2 008
* refs (1): E3857
* Text of the subject Gases: first the titles of its equation sets, then the descriptions of its variables.
EqTextGases:
        CON(5)  DOARRY                           * E6537  array 69
        LENGTH                                   * E653C  length, to #E6DA5
        CON(5)  DOCSTR                           * E6541  element type
        CON(5)  1                                * E6546  dimensions
        CON(5)  69                               * E654B
        $BODY   "Ideal Gas Law"                  * E6550  1
        $BODY   "Ideal Gas State Chg"            * E656F  2
        $BODY   "Isothermal Expansion"           * E659A  3
        $BODY   "Polytropic Processes"           * E65C7  4
        $BODY   "Isentropic Flow"                * E65F4  5
        $BODY   "Real Gas Law"                   * E6617  6
        $BODY   "Real Gas State Change"          * E6634  7
        $BODY   "Kinetic Theory"                 * E6663  8
        $BODY   "pressure"                       * E6684  9
        $BODY   "volume"                         * E6699  10
        $BODY   "temperature"                    * E66AA  11
        $BODY   "number of moles"                * E66C5  12
        $BODY   "mass"                           * E66E8  13
        $BODY   "molecular weight"               * E66F5  14
        $BODY   "initial pressure"               * E671A  15
        $BODY   "final pressure"                 * E673F  16
        $BODY   "initial volume"                 * E6760  17
        $BODY   "final volume"                   * E6781  18
        $BODY   "initial temp"                   * E679E  19
        $BODY   "final temperature"              * E67BB  20
        $BODY   "initial volume"                 * E67E2  21
        $BODY   "final volume"                   * E6803  22
        $BODY   "temperature"                    * E6820  23
        $BODY   "number of moles"                * E683B  24
        $BODY   "work"                           * E685E  25
        $BODY   "mass"                           * E686B  26
        $BODY   "molecular weight"               * E6878  27
        $BODY   "initial pressure"               * E689D  28
        $BODY   "final pressure"                 * E68C2  29
        $BODY   "initial volume"                 * E68E3  30
        $BODY   "final volume"                   * E6904  31
        $BODY   "initial temp"                   * E6921  32
        $BODY   "final temp"                     * E693E  33
        $BODY   "polytropic const"               * E6957  34
        $BODY   "specific ht ratio"              * E697C  35
        $BODY   "Mach number"                    * E69A3  36
        $BODY   "stagnation press"               * E69BE  37
        $BODY   "flow pressure"                  * E69E3  38
        $BODY   "stagnation dens"                * E6A02  39
        $BODY   "flow density"                   * E6A25  40
        $BODY   "stagnation temp"                * E6A42  41
        $BODY   "flow temperature"               * E6A65  42
        $BODY   "throat area"                    * E6A8A  43
        $BODY   "flow area"                      * E6AA5  44
        $BODY   "pseudocritical P"               * E6ABC  45
        $BODY   "pressure"                       * E6AE1  46
        $BODY   "volume"                         * E6AF6  47
        $BODY   "pseudocritical T"               * E6B07  48
        $BODY   "temperature"                    * E6B2C  49
        $BODY   "number of moles"                * E6B47  50
        $BODY   "mass"                           * E6B6A  51
        $BODY   "molecular weight"               * E6B77  52
        $BODY   "pseudocritical P"               * E6B9C  53
        $BODY   "initial pressure"               * E6BC1  54
        $BODY   "final pressure"                 * E6BE6  55
        $BODY   "initial volume"                 * E6C07  56
        $BODY   "final volume"                   * E6C28  57
        $BODY   "pseudocritical T"               * E6C45  58
        $BODY   "initial temp"                   * E6C6A  59
        $BODY   "final temperature"              * E6C87  60
        $BODY   "pressure"                       * E6CAE  61
        $BODY   "volume"                         * E6CC3  62
        $BODY   "temperature"                    * E6CD4  63
        $BODY   "number of moles"                * E6CEF  64
        $BODY   "molecular weight"               * E6D12  65
        $BODY   "rms speed"                      * E6D37  66
        $BODY   "molecular diameter"             * E6D4E  67
        $BODY   "mean free path"                 * E6D77  68
        $BODY   "mass"                           * E6D98  69
