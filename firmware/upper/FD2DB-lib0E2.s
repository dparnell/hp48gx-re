* HP 48GX ROM revision R, #FD2DB-#FFFFF: Equation Library: pictures for Solid Geometry and Stress Analysis, the end of the ROM
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: EqPicStressOnAnElement EqPicSphere EqPicShearStress EqPicParallelepiped EqPicPNStepJunctions EqPicNormalStress EqPicNMOSTransistors EqPicMohrSCircle EqPicJFETs EqPicCylinder EqPicCone EqPicBipolarTransistors
* Follows on from the previous file (at #FD2DB in the original ROM).
        RPL

* ROMPTR 0E2 05E
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set Cone.
EqPicCone:
        { BINT40 BINT5                           * FD2DB
          PCGROB  "images/FD2EA-packed.png"      * FD2EA  80 x 46, packed
        }                                        * FD5DB

* ROMPTR 0E2 05F
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set Cylinder.
EqPicCylinder:
        { BINT40 BINT3                           * FD5E0
          PCGROB  "images/FD5EF-packed.png"      * FD5EF  80 x 49, packed
        }                                        * FD916

* ROMPTR 0E2 060
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set Parallelepiped.
EqPicParallelepiped:
        { BINT16 BINT3                           * FD91B
          PCGROB  "images/FD92A-packed.png"      * FD92A  104 x 49, packed
        }                                        * FDD27

* ROMPTR 0E2 061
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set Sphere.
EqPicSphere:
        { BINT48 BINT6                           * FDD2C
          PCGROB  "images/FDD3B-packed.png"      * FDD3B  72 x 43, packed
        }                                        * FDFD7

* ROMPTR 0E2 062
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set PN Step Junctions.
EqPicPNStepJunctions:
        { BINT8 BINT7                            * FDFDC
          PCGROB  "images/FDFEB-packed.png"      * FDFEB  112 x 42, packed
        }                                        * FE304

* ROMPTR 0E2 063
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set NMOS Transistors.
EqPicNMOSTransistors:
        { BINT32 BINT5                           * FE309
          PCGROB  "images/FE318-packed.png"      * FE318  72 x 44, packed
        }                                        * FE5A0

* ROMPTR 0E2 064
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set Bipolar Transistors.
EqPicBipolarTransistors:
        { BINT16 BINT9                           * FE5A5
          PCGROB  "images/FE5B4-packed.png"      * FE5B4  104 x 37, packed
        }                                        * FE8DD

* ROMPTR 0E2 065
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set JFETs.
EqPicJFETs:
        { BINT16 BINT4                           * FE8E2
          PCGROB  "images/FE8F1-packed.png"      * FE8F1  96 x 48, packed
        }                                        * FEC77

* ROMPTR 0E2 066
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set Normal Stress.
EqPicNormalStress:
        { BINT24 BINT16                          * FEC7C
          PCGROB  "images/FEC8B-packed.png"      * FEC8B  88 x 24, packed
        }                                        * FEE11

* ROMPTR 0E2 067
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set Shear Stress.
EqPicShearStress:
        { BINT32 BINT13                          * FEE16
          PCGROB  "images/FEE25-packed.png"      * FEE25  72 x 34, packed
        }                                        * FF06B

* ROMPTR 0E2 068
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set Stress on an Element.
EqPicStressOnAnElement:
        { BINT8 BINT5                            * FF070
          PCGROB  "images/FF07F-packed.png"      * FF07F  112 x 47, packed
        }                                        * FF4C6

* ROMPTR 0E2 069
* refs (1): E3857
* { #x #y grob }: position and packed picture for the set Mohr's Circle.
EqPicMohrSCircle:
        { BINT0 BINT1                            * FF4CB
          PCGROB  "images/FF4DA-packed.png"      * FF4DA  120 x 53, packed
        }                                        * FF950
        BSS     4                                * FF955  zeros
        ENDLENGTH                                * FF959
        FILLTO  #FFFFC                           * FF959  1699 zero nibbles: the next entry stays at #FFFFC

        CRC                                      * FFFFC  self-test CRC correction (computed by the assembler)
