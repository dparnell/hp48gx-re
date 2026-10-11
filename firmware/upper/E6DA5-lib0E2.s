* HP 48GX ROM revision R, #E6DA5-#E9E0E: Library part 0E2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #E6DA5 in the original ROM).
        ENDLENGTH                                * E6DA5

* ROMPTR 0E2 009
* refs (1): E3857
ROMP_0E2_009:
        CON(5)  DOARRY                           * E6DA5  array 54
        LENGTH                                   * E6DAA  length, to #E746A
        CON(5)  DOCSTR                           * E6DAF  element type
        CON(5)  1                                * E6DB4  dimensions
        CON(5)  54                               * E6DB9
        $BODY   "Heat Capacity"                  * E6DBE  1
        $BODY   "Thermal Expansion"              * E6DDD  2
        $BODY   "Conduction"                     * E6E04  3
        $BODY   "Convection"                     * E6E1D  4
        $BODY   "Conduction+Convection"          * E6E36  5
        $BODY   "Black Body Radiation"           * E6E65  6
        $BODY   "temp difference"                * E6E92  7
        $BODY   "initial temp"                   * E6EB5  8
        $BODY   "final temperature"              * E6ED2  9
        $BODY   "mass"                           * E6EF9  10
        $BODY   "specific heat"                  * E6F06  11
        $BODY   "heat capacity"                  * E6F25  12
        $BODY   "temp difference"                * E6F44  13
        $BODY   "initial temp"                   * E6F67  14
        $BODY   "final temperature"              * E6F84  15
        $BODY   "length"                         * E6FAB  16
        $BODY   "expansion coeff"                * E6FBC  17
        $BODY   "elongation"                     * E6FDF  18
        $BODY   "temp difference"                * E6FF8  19
        $BODY   "hot temperature"                * E701B  20
        $BODY   "cold temperature"               * E703E  21
        $BODY   "area"                           * E7063  22
        $BODY   "length"                         * E7070  23
        $BODY   "conductivity"                   * E7081  24
        $BODY   "heat transfer rate"             * E709E  25
        $BODY   "temp difference"                * E70C7  26
        $BODY   "hot temperature"                * E70EA  27
        $BODY   "cold temperature"               * E710D  28
        $BODY   "area"                           * E7132  29
        $BODY   "convective coeff"               * E713F  30
        $BODY   "heat transfer rate"             * E7164  31
        $BODY   "temp difference"                * E718D  32
        $BODY   "hot temperature"                * E71B0  33
        $BODY   "cold temperature"               * E71D3  34
        $BODY   "area"                           * E71F8  35
        $BODY   "convective coef 1"              * E7205  36
        $BODY   "convective coef 3"              * E722C  37
        $BODY   "length 1"                       * E7253  38
        $BODY   "length 2"                       * E7268  39
        $BODY   "length 3"                       * E727D  40
        $BODY   "conductivity 1"                 * E7292  41
        $BODY   "conductivity 2"                 * E72B3  42
        $BODY   "conductivity 3"                 * E72D4  43
        $BODY   "overall ht tx coef"             * E72F5  44
        $BODY   "heat transfer rate"             * E731E  45
        $BODY   "temperature"                    * E7347  46
        $BODY   "emissive power"                 * E7362  47
        $BODY   "lower wavelen lim"              * E7383  48
        $BODY   "upper wavelen lim"              * E73AA  49
        $BODY   "eb frac in {λ1,λ2}"             * E73D1  50
        $BODY   "eb in {λ1,λ2}"                  * E73FA  51
        $BODY   "λ of max eb"                    * E7419  52
        $BODY   "area"                           * E7434  53
        $BODY   "heat transfer rate"             * E7441  54
        ENDLENGTH                                * E746A

* ROMPTR 0E2 00A
* refs (1): E3857
ROMP_0E2_00A:
        CON(5)  DOARRY                           * E746A  array 25
        LENGTH                                   * E746F  length, to #E778E
        CON(5)  DOCSTR                           * E7474  element type
        CON(5)  1                                * E7479  dimensions
        CON(5)  25                               * E747E
        $BODY   "Straight Wire"                  * E7483  1
        $BODY   "Force Between Wires"            * E74A2  2
        $BODY   "B Field in Solenoid"            * E74CD  3
        $BODY   "B Field in Toroid"              * E74F8  4
        $BODY   "rel permeability"               * E751F  5
        $BODY   "radius"                         * E7544  6
        $BODY   "wire radius"                    * E7555  7
        $BODY   "current"                        * E7570  8
        $BODY   "magnetic field"                 * E7583  9
        $BODY   "rel permeability"               * E75A4  10
        $BODY   "length"                         * E75C9  11
        $BODY   "separation dist"                * E75DA  12
        $BODY   "current in wire b"              * E75FD  13
        $BODY   "current in wire a"              * E7624  14
        $BODY   "force"                          * E764B  15
        $BODY   "rel permeability"               * E765A  16
        $BODY   "turns/unit length"              * E767F  17
        $BODY   "current"                        * E76A6  18
        $BODY   "magnetic field"                 * E76B9  19
        $BODY   "rel permeability"               * E76DA  20
        $BODY   "total turns"                    * E76FF  21
        $BODY   "inside radius"                  * E771A  22
        $BODY   "outside radius"                 * E7739  23
        $BODY   "current"                        * E775A  24
        $BODY   "magnetic field"                 * E776D  25
        ENDLENGTH                                * E778E

* ROMPTR 0E2 00B
* refs (1): E3857
ROMP_0E2_00B:
        CON(5)  DOARRY                           * E778E  array 47
        LENGTH                                   * E7793  length, to #E7D84
        CON(5)  DOCSTR                           * E7798  element type
        CON(5)  1                                * E779D  dimensions
        CON(5)  47                               * E77A2
        $BODY   "Linear Motion"                  * E77A7  1
        $BODY   "Object in Free Fall"            * E77C6  2
        $BODY   "Projectile Motion"              * E77F1  3
        $BODY   "Angular Motion"                 * E7818  4
        $BODY   "Circular Motion"                * E7839  5
        $BODY   "Terminal Velocity"              * E785C  6
        $BODY   "Escape Velocity"                * E7883  7
        $BODY   "initial position"               * E78A6  8
        $BODY   "final position"                 * E78CB  9
        $BODY   "initial velocity"               * E78EC  10
        $BODY   "final velocity"                 * E7911  11
        $BODY   "acceleration"                   * E7932  12
        $BODY   "time"                           * E794F  13
        $BODY   "initial height"                 * E795C  14
        $BODY   "final height"                   * E797D  15
        $BODY   "initial velocity"               * E799A  16
        $BODY   "final velocity"                 * E79BF  17
        $BODY   "time"                           * E79E0  18
        $BODY   "init x-position"                * E79ED  19
        $BODY   "final x-position"               * E7A10  20
        $BODY   "init y-position"                * E7A35  21
        $BODY   "final y-position"               * E7A58  22
        $BODY   "initial angle"                  * E7A7D  23
        $BODY   "initial velocity"               * E7A9C  24
        $BODY   "x-velocity"                     * E7AC1  25
        $BODY   "y-velocity"                     * E7ADA  26
        $BODY   "time"                           * E7AF3  27
        $BODY   "horizontal range"               * E7B00  28
        $BODY   "init ang position"              * E7B25  29
        $BODY   "final ang position"             * E7B4C  30
        $BODY   "init ang velocity"              * E7B75  31
        $BODY   "final ang velocity"             * E7B9C  32
        $BODY   "ang acceleration"               * E7BC5  33
        $BODY   "time"                           * E7BEA  34
        $BODY   "radius"                         * E7BF7  35
        $BODY   "velocity"                       * E7C08  36
        $BODY   "centripetal accel"              * E7C1D  37
        $BODY   "angular velocity"               * E7C44  38
        $BODY   "rotational speed"               * E7C69  39
        $BODY   "drag coefficient"               * E7C8E  40
        $BODY   "fluid density"                  * E7CB3  41
        $BODY   "projected area"                 * E7CD2  42
        $BODY   "mass"                           * E7CF3  43
        $BODY   "terminal velocity"              * E7D00  44
        $BODY   "planet mass"                    * E7D27  45
        $BODY   "planet radius"                  * E7D42  46
        $BODY   "escape velocity"                * E7D61  47
        ENDLENGTH                                * E7D84

* ROMPTR 0E2 00C
* refs (1): E3857
ROMP_0E2_00C:
        CON(5)  DOARRY                           * E7D84  array 34
        LENGTH                                   * E7D89  length, to #E8273
        CON(5)  DOCSTR                           * E7D8E  element type
        CON(5)  1                                * E7D93  dimensions
        CON(5)  34                               * E7D98
        $BODY   "Law of Refraction"              * E7D9D  1
        $BODY   "Critical Angle"                 * E7DC4  2
        $BODY   "Brewster's Law"                 * E7DE5  3
        $BODY   "Spherical Reflection"           * E7E06  4
        $BODY   "Spherical Refraction"           * E7E33  5
        $BODY   "Thin Lens"                      * E7E60  6
        $BODY   "index of refrac 1"              * E7E77  7
        $BODY   "index of refrac 2"              * E7E9E  8
        $BODY   "∡ of incidence"                 * E7EC5  9
        $BODY   "∡ of refraction"                * E7EE6  10
        $BODY   "index of refrac 1"              * E7F09  11
        $BODY   "index of refrac 2"              * E7F30  12
        $BODY   "critical angle"                 * E7F57  13
        $BODY   "index of refrac 1"              * E7F78  14
        $BODY   "index of refrac 2"              * E7F9F  15
        $BODY   "Brewster angle"                 * E7FC6  16
        $BODY   "∡ of refraction"                * E7FE7  17
        $BODY   "distance to object"             * E800A  18
        $BODY   "distance to image"              * E8033  19
        $BODY   "focal length"                   * E805A  20
        $BODY   "curvature radius"               * E8077  21
        $BODY   "magnification"                  * E809C  22
        $BODY   "distance to object"             * E80BB  23
        $BODY   "distance to image"              * E80E4  24
        $BODY   "curvature radius"               * E810B  25
        $BODY   "index of refrac 1"              * E8130  26
        $BODY   "index of refrac 2"              * E8157  27
        $BODY   "distance to object"             * E817E  28
        $BODY   "distance to image"              * E81A7  29
        $BODY   "focal length"                   * E81CE  30
        $BODY   "curvature rad 1"                * E81EB  31
        $BODY   "curvature rad 2"                * E820E  32
        $BODY   "index of refrac"                * E8231  33
        $BODY   "magnification"                  * E8254  34
        ENDLENGTH                                * E8273

* ROMPTR 0E2 00D
* refs (1): E3857
ROMP_0E2_00D:
        CON(5)  DOARRY                           * E8273  array 35
        LENGTH                                   * E8278  length, to #E8655
        CON(5)  DOCSTR                           * E827D  element type
        CON(5)  1                                * E8282  dimensions
        CON(5)  35                               * E8287
        $BODY   "Mass-Spring System"             * E828C  1
        $BODY   "Simple Pendulum"                * E82B5  2
        $BODY   "Conical Pendulum"               * E82D8  3
        $BODY   "Torsional Pendulum"             * E82FD  4
        $BODY   "Simple Harmonic"                * E8326  5
        $BODY   "spring constant"                * E8349  6
        $BODY   "mass"                           * E836C  7
        $BODY   "period"                         * E8379  8
        $BODY   "angular frequency"              * E838A  9
        $BODY   "frequency"                      * E83B1  10
        $BODY   "length"                         * E83C8  11
        $BODY   "period"                         * E83D9  12
        $BODY   "angular frequency"              * E83EA  13
        $BODY   "frequency"                      * E8411  14
        $BODY   "length"                         * E8428  15
        $BODY   "height"                         * E8439  16
        $BODY   "cone angle"                     * E844A  17
        $BODY   "period"                         * E8463  18
        $BODY   "angular frequency"              * E8474  19
        $BODY   "frequency"                      * E849B  20
        $BODY   "shear mod of elas"              * E84B2  21
        $BODY   "polar mom of inert"             * E84D9  22
        $BODY   "length"                         * E8502  23
        $BODY   "moment of inertia"              * E8513  24
        $BODY   "period"                         * E853A  25
        $BODY   "angular frequency"              * E854B  26
        $BODY   "frequency"                      * E8572  27
        $BODY   "amplitude"                      * E8589  28
        $BODY   "angular frequency"              * E85A0  29
        $BODY   "frequency"                      * E85C7  30
        $BODY   "phase angle"                    * E85DE  31
        $BODY   "time"                           * E85F9  32
        $BODY   "displacement"                   * E8606  33
        $BODY   "velocity"                       * E8623  34
        $BODY   "acceleration"                   * E8638  35
        ENDLENGTH                                * E8655

* ROMPTR 0E2 00E
* refs (1): E3857
ROMP_0E2_00E:
        CON(5)  DOARRY                           * E8655  array 54
        LENGTH                                   * E865A  length, to #E8CC8
        CON(5)  DOCSTR                           * E865F  element type
        CON(5)  1                                * E8664  dimensions
        CON(5)  54                               * E8669
        $BODY   "Circle"                         * E866E  1
        $BODY   "Ellipse"                        * E867F  2
        $BODY   "Rectangle"                      * E8692  3
        $BODY   "Regular Polygon"                * E86A9  4
        $BODY   "Circular Ring"                  * E86CC  5
        $BODY   "Triangle"                       * E86EB  6
        $BODY   "radius"                         * E8700  7
        $BODY   "area"                           * E8711  8
        $BODY   "circumference"                  * E871E  9
        $BODY   "x,y-mom of inertia"             * E873D  10
        $BODY   "polar mom of inert"             * E8766  11
        $BODY   "parallel axis dist"             * E878F  12
        $BODY   "mom of inert at d"              * E87B8  13
        $BODY   "major semiaxis"                 * E87DF  14
        $BODY   "minor semiaxis"                 * E8800  15
        $BODY   "area"                           * E8821  16
        $BODY   "circumference"                  * E882E  17
        $BODY   "x-mom of inertia"               * E884D  18
        $BODY   "polar mom of inert"             * E8872  19
        $BODY   "parallel axis dist"             * E889B  20
        $BODY   "mom of inert at d"              * E88C4  21
        $BODY   "base"                           * E88EB  22
        $BODY   "height"                         * E88F8  23
        $BODY   "area"                           * E8909  24
        $BODY   "perimeter"                      * E8916  25
        $BODY   "x-mom of inertia"               * E892D  26
        $BODY   "polar mom of inert"             * E8952  27
        $BODY   "parallel axis dist"             * E897B  28
        $BODY   "mom of inert at d"              * E89A4  29
        $BODY   "number of sides"                * E89CB  30
        $BODY   "side length"                    * E89EE  31
        $BODY   "distance to side"               * E8A09  32
        $BODY   "dist to vertex"                 * E8A2E  33
        $BODY   "area"                           * E8A4F  34
        $BODY   "perimeter"                      * E8A5C  35
        $BODY   "vertex angle"                   * E8A73  36
        $BODY   "central angle"                  * E8A90  37
        $BODY   "inside radius"                  * E8AAF  38
        $BODY   "outside radius"                 * E8ACE  39
        $BODY   "area"                           * E8AEF  40
        $BODY   "x-mom of inertia"               * E8AFC  41
        $BODY   "polar mom of inert"             * E8B21  42
        $BODY   "parallel axis dist"             * E8B4A  43
        $BODY   "mom of inert at d"              * E8B73  44
        $BODY   "base"                           * E8B9A  45
        $BODY   "height"                         * E8BA7  46
        $BODY   "distance to vertex"             * E8BB8  47
        $BODY   "area"                           * E8BE1  48
        $BODY   "perimeter"                      * E8BEE  49
        $BODY   "x-mom of inertia"               * E8C05  50
        $BODY   "y-mom of inertia"               * E8C2A  51
        $BODY   "polar mom of inert"             * E8C4F  52
        $BODY   "parallel axis dist"             * E8C78  53
        $BODY   "mom of inert at d"              * E8CA1  54
        ENDLENGTH                                * E8CC8

* ROMPTR 0E2 00F
* refs (1): E3857
ROMP_0E2_00F:
        CON(5)  DOARRY                           * E8CC8  array 29
        LENGTH                                   * E8CCD  length, to #E8FD2
        CON(5)  DOCSTR                           * E8CD2  element type
        CON(5)  1                                * E8CD7  dimensions
        CON(5)  29                               * E8CDC
        $BODY   "Cone"                           * E8CE1  1
        $BODY   "Cylinder"                       * E8CEE  2
        $BODY   "Parallelepiped"                 * E8D03  3
        $BODY   "Sphere"                         * E8D24  4
        $BODY   "radius"                         * E8D35  5
        $BODY   "height"                         * E8D46  6
        $BODY   "volume"                         * E8D57  7
        $BODY   "surface area"                   * E8D68  8
        $BODY   "mass"                           * E8D85  9
        $BODY   "x-mom of inertia"               * E8D92  10
        $BODY   "z-mom of inertia"               * E8DB7  11
        $BODY   "parallel axis dist"             * E8DDC  12
        $BODY   "mom of inert at d"              * E8E05  13
        $BODY   "base"                           * E8E2C  14
        $BODY   "height"                         * E8E39  15
        $BODY   "thickness"                      * E8E4A  16
        $BODY   "volume"                         * E8E61  17
        $BODY   "surface area"                   * E8E72  18
        $BODY   "mass"                           * E8E8F  19
        $BODY   "x-mom of inertia"               * E8E9C  20
        $BODY   "parallel axis dist"             * E8EC1  21
        $BODY   "mom of inert at d"              * E8EEA  22
        $BODY   "radius"                         * E8F11  23
        $BODY   "volume"                         * E8F22  24
        $BODY   "surface area"                   * E8F33  25
        $BODY   "mass"                           * E8F50  26
        $BODY   "x-mom of inertia"               * E8F5D  27
        $BODY   "parallel axis dist"             * E8F82  28
        $BODY   "mom of inert at d"              * E8FAB  29
        ENDLENGTH                                * E8FD2

* ROMPTR 0E2 010
* refs (1): E3857
ROMP_0E2_010:
        CON(5)  DOARRY                           * E8FD2  array 75
        LENGTH                                   * E8FD7  length, to #E99DE
        CON(5)  DOCSTR                           * E8FDC  element type
        CON(5)  1                                * E8FE1  dimensions
        CON(5)  75                               * E8FE6
        $BODY   "PN Step Junctions"              * E8FEB  1
        $BODY   "NMOS Transistors"               * E9012  2
        $BODY   "Bipolar Transistors"            * E9037  3
        $BODY   "JFETs"                          * E9062  4
        $BODY   "N-side doping"                  * E9071  5
        $BODY   "P-side doping"                  * E9090  6
        $BODY   "temperature"                    * E90AF  7
        $BODY   "sat I density"                  * E90CA  8
        $BODY   "applied voltage"                * E90E9  9
        $BODY   "BV field factor"                * E910C  10
        $BODY   "drawn mask width"               * E912F  11
        $BODY   "width adjustment"               * E9154  12
        $BODY   "drawn mask length"              * E9179  13
        $BODY   "length adjustment"              * E91A0  14
        $BODY   "junction depth"                 * E91C7  15
        $BODY   "depl region width"              * E91E8  16
        $BODY   "current density"                * E920F  17
        $BODY   "eff junction area"              * E9232  18
        $BODY   "junction cap/area"              * E9259  19
        $BODY   "diode current"                  * E9280  20
        $BODY   "built-in voltage"               * E929F  21
        $BODY   "max elec field"                 * E92C4  22
        $BODY   "breakdown voltage"              * E92E5  23
        $BODY   "gate ox thckness"               * E930C  24
        $BODY   "oxide cap/area"                 * E9331  25
        $BODY   "substrate doping"               * E9352  26
        $BODY   "Fermi potential"                * E9377  27
        $BODY   "electron mobility"              * E939A  28
        $BODY   "temperature"                    * E93C1  29
        $BODY   "Vt for VBS=0"                   * E93DC  30
        $BODY   "body factor"                    * E93F9  31
        $BODY   "threshold voltage"              * E9414  32
        $BODY   "applied gate V"                 * E943B  33
        $BODY   "substrate V"                    * E945C  34
        $BODY   "applied drain V"                * E9477  35
        $BODY   "drawn width"                    * E949A  36
        $BODY   "width contraction"              * E94B5  37
        $BODY   "drawn gate length"              * E94DC  38
        $BODY   "chnl encroachment"              * E9503  39
        $BODY   "effective width"                * E952A  40
        $BODY   "effective length"               * E954D  41
        $BODY   "drain current"                  * E9572  42
        $BODY   "output condctnce"               * E9591  43
        $BODY   "saturation V"                   * E95B6  44
        $BODY   "transconductance"               * E95D3  45
        $BODY   "modulation param"               * E95F8  46
        $BODY   "transistor sat I"               * E961D  47
        $BODY   "EB saturation I"                * E9642  48
        $BODY   "CB saturation I"                * E9665  49
        $BODY   "temperature"                    * E9688  50
        $BODY   "forward α"                      * E96A3  51
        $BODY   "reverse α"                      * E96BA  52
        $BODY   "total emitter I"                * E96D1  53
        $BODY   "total collector I"              * E96F4  54
        $BODY   "total base I"                   * E971B  55
        $BODY   "IC (EB jn open)"                * E9738  56
        $BODY   "IC (CB jn open)"                * E975B  57
        $BODY   "CE sat V"                       * E977E  58
        $BODY   "base collector V"               * E9793  59
        $BODY   "base emitter V"                 * E97B8  60
        $BODY   "N-channel doping"               * E97D9  61
        $BODY   "channel width"                  * E97FE  62
        $BODY   "channel thickness"              * E981D  63
        $BODY   "channel length"                 * E9844  64
        $BODY   "electron mobility"              * E9865  65
        $BODY   "threshold voltage"              * E988C  66
        $BODY   "applied gate V"                 * E98B3  67
        $BODY   "applied drain V"                * E98D4  68
        $BODY   "built-in voltage"               * E98F7  69
        $BODY   "saturation V"                   * E991C  70
        $BODY   "drain current"                  * E9939  71
        $BODY   "temperature"                    * E9958  72
        $BODY   "chnl conductance"               * E9973  73
        $BODY   "depl layer wid"                 * E9998  74
        $BODY   "transconductance"               * E99B9  75
        ENDLENGTH                                * E99DE

* ROMPTR 0E2 011
* refs (1): E3857
ROMP_0E2_011:
        CON(5)  DOARRY                           * E99DE  array 36
        LENGTH                                   * E99E3  length, to #E9E0F
        CON(5)  DOCSTR                           * E99E8  element type
        CON(5)  1                                * E99ED  dimensions
        CON(5)  36                               * E99F2
        $BODY   "Normal Stress"                  * E99F7  1
        $BODY   "Shear Stress"                   * E9A16  2
        $BODY   "Stress on an Element"           * E9A33  3
        $BODY   "Mohr's Circle"                  * E9A60  4
        $BODY   "load"                           * E9A7F  5
        $BODY   "length"                         * E9A8C  6
        $BODY   "area"                           * E9A9D  7
        $BODY   "modulus of elas"                * E9AAA  8
        $BODY   "elongation"                     * E9ACD  9
        $BODY   "normal strain"                  * E9AE6  10
        $BODY   "normal stress"                  * E9B05  11
        $BODY   "torque"                         * E9B24  12
        $BODY   "length"                         * E9B35  13
        $BODY   "radius"                         * E9B46  14
        $BODY   "polar mom of inert"             * E9B57  15
        $BODY   "shear mod of elas"              * E9B80  16
        $BODY   "angle of twist"                 * E9BA7  17
        $BODY   "shear strain"                   * E9BC8  18
        $BODY   "shear stress"                   * E9BE5  19
        $BODY   "normal x-stress"                * E9C02  20
        $BODY   "normal y-stress"                * E9C25  21
        $BODY   "shear stress"                   * E9C48  22
        $BODY   "rotation angle"                 * E9C65  23
        $BODY   "rotated σx"                     * E9C86  24
        $BODY   "rotated σy"                     * E9C9F  25
        $BODY   "rotated τxy"                    * E9CB8  26
        $BODY   "normal x-stress"                * E9CD3  27
        $BODY   "normal y-stress"                * E9CF6  28
        $BODY   "shear stress"                   * E9D19  29
        $BODY   "max principal σ"                * E9D36  30
        $BODY   "∡ to σ1 plane"                  * E9D59  31
        $BODY   "min principal σ"                * E9D78  32
        $BODY   "∡ to σ2 plane"                  * E9D9B  33
        $BODY   "max τ"                          * E9DBA  34
        $BODY   "∡ to τmax plane"                * E9DC9  35
        $BODY   "σ on τmax plane"                * E9DEC  36
