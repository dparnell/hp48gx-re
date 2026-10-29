* HP 48GX ROM revision R, #FD2DB-#FFFFF: Library part 0E2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #FD2DB in the original ROM).
        RPL

* ROMPTR 0E2 05E
* refs (1): E3857
ROMP_0E2_05E:
        { BINT40 BINT5                           * FD2DB
          PCGROB  "images/FD2EA-packed.png"      * FD2EA  80 x 46, packed
        }                                        * FD5DB

* ROMPTR 0E2 05F
* refs (1): E3857
ROMP_0E2_05F:
        { BINT40 BINT3                           * FD5E0
          PCGROB  "images/FD5EF-packed.png"      * FD5EF  80 x 49, packed
        }                                        * FD916

* ROMPTR 0E2 060
* refs (1): E3857
ROMP_0E2_060:
        { BINT16 BINT3                           * FD91B
          PCGROB  "images/FD92A-packed.png"      * FD92A  104 x 49, packed
        }                                        * FDD27

* ROMPTR 0E2 061
* refs (1): E3857
ROMP_0E2_061:
        { BINT48 BINT6                           * FDD2C
L_FDD3B:
          PCGROB  "images/FDD3B-packed.png"      * FDD3B  72 x 43, packed
        }                                        * FDFD7

* ROMPTR 0E2 062
* refs (1): E3857
ROMP_0E2_062:
        { BINT8 BINT7                            * FDFDC
          PCGROB  "images/FDFEB-packed.png"      * FDFEB  112 x 42, packed
        }                                        * FE304

* ROMPTR 0E2 063
* refs (1): E3857
ROMP_0E2_063:
        { BINT32 BINT5                           * FE309
          PCGROB  "images/FE318-packed.png"      * FE318  72 x 44, packed
        }                                        * FE5A0

* ROMPTR 0E2 064
* refs (1): E3857
ROMP_0E2_064:
        { BINT16 BINT9                           * FE5A5
          PCGROB  "images/FE5B4-packed.png"      * FE5B4  104 x 37, packed
        }                                        * FE8DD

* ROMPTR 0E2 065
* refs (1): E3857
ROMP_0E2_065:
        { BINT16 BINT4                           * FE8E2
          PCGROB  "images/FE8F1-packed.png"      * FE8F1  96 x 48, packed
        }                                        * FEC77

* ROMPTR 0E2 066
* refs (1): E3857
ROMP_0E2_066:
        { BINT24 BINT16                          * FEC7C
          PCGROB  "images/FEC8B-packed.png"      * FEC8B  88 x 24, packed
        }                                        * FEE11

* ROMPTR 0E2 067
* refs (1): E3857
ROMP_0E2_067:
        { BINT32 BINT13                          * FEE16
          PCGROB  "images/FEE25-packed.png"      * FEE25  72 x 34, packed
        }                                        * FF06B

* ROMPTR 0E2 068
* refs (1): E3857
ROMP_0E2_068:
        { BINT8 BINT5                            * FF070
          PCGROB  "images/FF07F-packed.png"      * FF07F  112 x 47, packed
        }                                        * FF4C6

* ROMPTR 0E2 069
* refs (1): E3857
ROMP_0E2_069:
        { BINT0 BINT1                            * FF4CB
          PCGROB  "images/FF4DA-packed.png"      * FF4DA  120 x 53, packed
        }                                        * FF950
        BSS     4                                * FF955  zeros
        ENDLENGTH                                * FF959
        FILLTO  #FFFFC                           * FF959  1699 zero nibbles: the next entry stays at #FFFFC

L_FFFFC:
        CRC                                      * FFFFC  self-test CRC correction (computed by the assembler)
