* HP 48GX ROM revision R, #FD2DB-#FFFFF: Library part 0E2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #FD2DB in the original ROM).
        RPL

* ROMPTR 0E2 05E
* refs (1): E3857
ROMP_0E2_05E:
        { BINT40 BINT5 PCGROB "images/FD2EA-packed.png" } * FD2DB  80 x 46, packed

* ROMPTR 0E2 05F
* refs (1): E3857
ROMP_0E2_05F:
        { BINT40 BINT3 PCGROB "images/FD5EF-packed.png" } * FD5E0  80 x 49, packed

* ROMPTR 0E2 060
* refs (1): E3857
ROMP_0E2_060:
        { BINT16 BINT3 PCGROB "images/FD92A-packed.png" } * FD91B  104 x 49, packed

* ROMPTR 0E2 061
* refs (1): E3857
ROMP_0E2_061:
        { BINT48 BINT6                           * FDD2C
L_FDD3B:
          PCGROB "images/FDD3B-packed.png" }     * FDD3B  72 x 43, packed

* ROMPTR 0E2 062
* refs (1): E3857
ROMP_0E2_062:
        { BINT8 BINT7 PCGROB "images/FDFEB-packed.png" } * FDFDC  112 x 42, packed

* ROMPTR 0E2 063
* refs (1): E3857
ROMP_0E2_063:
        { BINT32 BINT5 PCGROB "images/FE318-packed.png" } * FE309  72 x 44, packed

* ROMPTR 0E2 064
* refs (1): E3857
ROMP_0E2_064:
        { BINT16 BINT9 PCGROB "images/FE5B4-packed.png" } * FE5A5  104 x 37, packed

* ROMPTR 0E2 065
* refs (1): E3857
ROMP_0E2_065:
        { BINT16 BINT4 PCGROB "images/FE8F1-packed.png" } * FE8E2  96 x 48, packed

* ROMPTR 0E2 066
* refs (1): E3857
ROMP_0E2_066:
        { BINT24 BINT16 PCGROB "images/FEC8B-packed.png" } * FEC7C  88 x 24, packed

* ROMPTR 0E2 067
* refs (1): E3857
ROMP_0E2_067:
        { BINT32 BINT13 PCGROB "images/FEE25-packed.png" } * FEE16  72 x 34, packed

* ROMPTR 0E2 068
* refs (1): E3857
ROMP_0E2_068:
        { BINT8 BINT5 PCGROB "images/FF07F-packed.png" } * FF070  112 x 47, packed

* ROMPTR 0E2 069
* refs (1): E3857
ROMP_0E2_069:
        { BINT0 BINT1 PCGROB "images/FF4DA-packed.png" } * FF4CB  120 x 53, packed
        BSS     4                                * FF955
        ENDLENGTH                                * FF959
        FILLTO  #FFFFC                           * FF959  1699 zero nibbles: the next entry stays at #FFFFC

L_FFFFC:
        CRC                                      * FFFFC  self-test CRC correction (computed by the assembler)
