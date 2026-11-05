* HP 48GX ROM revision R, #CA95B-#CADC3: RRK command, argument check for the Rosenbrock commands, angle factors for units, library tables
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: UnitAngleFix Unit>AngleMode RRKBindList DoRRK1 DoRRK %DEGPERANG
* Follows on from the previous file (at #CA95B in the original ROM).
        RPL

* ROMPTR 0C1 01D
* refs (1): C78DB
* RRK: {list} xtol xTfinal -> {list} xtol, where xtol may be {xtol xh}. As DoRKF, with the choice of method.
DoRRK:
        :: DEPTH #3- 4PICK XLIB RRKBindList ROTDROP ERRSET XLIB DoRRK1 * CA95B
          ERRTRAP XLIB RRKTrap 1PUTLAM 7GETLAM RESETDEPTH 6GETLAM 1GETABND * CA98F
          ATTNFLGCLR ;                           * CA9B8

* ROMPTR 0C1 01E
* refs (1): C78DB
* Stepping loop of RRK: repeats RRKorRKF until T reaches the final T.
DoRRK1:
        :: XLIB DEStepArgs case ABND             * CA9C2
          %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 8ROLL * CA9DC
          8NULLLAM{} BIND LAM 'W RCLCRUNCH>%ARRY XLIB RRKStepSel 5PUTLAM * CA9FF
          4PUTLAM 3PUTLAM RESOROMP XLIB DEStepCtl 6PUTLAM 2GETLAM 8GETLAM * CAA29
          11GETLAM RESOROMP XLIB RRKorRKF 11PUTLAM OVER %%0> 12PUTLAM BEGIN * CAA52
          10GETLAM 12GETLAM ITE OBJ_7CE00 OBJ_7CE32 * CAA80
          SWAP 11GETLAM EVAL SWAP LAM 'T @%_HERE 10GETLAM OVER 12GETLAM ITE * CAA99
          %<= %>=                                * CAAD1
          UNTIL 3DROP 1GETABND ABND ;            * CAADB

* ROMPTR 0C1 01F
* refs (1): C78DB
* {T W F FW FT ...} x -> : checks that the list has at least five elements, of which the first two are names, and binds them as the locals T, W, F, FW and FT above two unnamed ones.
RRKBindList:
        :: DUPLENCOMP BINT5 #< case2drop SETSIZEERR * CAAF4
          DUPINCOMP BINT5 #- NDROP               * CAB12
          { NULLLAM NULLLAM LAM 'T LAM 'W LAM 'F LAM 'FW LAM 'FT } BIND * CAB26
          5GETLAM TYPEIDNT? NOTcase SETTYPEERR   * CAB7A
          4GETLAM TYPEIDNT? NOTcase SETTYPEERR   * CAB8E
        ;                                        * CABA2

* ROMPTR 0C1 020
* refs (1): C78DB
* dims dims' -> %%: for unit conversion when two dimension arrays differ. They may differ only in element 8, the angle, else Inconsistent Units. The result is %DEGPERANG, or its reciprocal, or its power, for that difference, so plain numbers and angles convert in the current mode.
UnitAngleFix:
        ::                                       * CABA7

* ROMPTR 0C1 021
* refs (1): C78DB
* -> %: degrees in one unit of the current angle mode: 1, 57.2957795130823 for radians, or .9 for grads.
%DEGPERANG:
          CODE                                   * CABAC  73 nibbles
            GOSBVL  SAVPTR                       * CABB6
            GOSBVL  GetAngleST                   * CABBD
            A=0     W                            * CABC4
            A=A-1   A                            * CABC7
            C=0     W                            * CABC9
            P=      14                           * CABCC
            LC(1)   #9                           * CABCE
            ?ST=1   4                            * CABD1
            GOYES   %DEGPERANG.L1                * CABD4
            A=A+1   A                            * CABD6
            LC(1)   #1                           * CABD8
            ?ST=0   9                            * CABDB
            GOYES   %DEGPERANG.L1                * CABDE
            A=A+1   A                            * CABE0
            P=      0                            * CABE2
            LC(15)  #572957795130823             * CABE4
%DEGPERANG.L1:
            B=C     W                            * CABF5
            GOVLNG  PUSH%.L9                     * CABF8
          ENDCODE                                * CABFF
          SWAPROT OBJ_0F756 BINT8 PULLEREALEL SWAP %0_2A2B4 BINT8 PUTREALEL * CABFF
          UDimNone EQUALNOTcase CONSTUNITERR     * CAC27
          %%1 EQUALcasedrop %%*                  * CAC36
          %%-1 EQUALcasedrop %%/                 * CAC45
          %%^ %%* ;                              * CAC54

* ROMPTR 0C1 022
* refs (1): C78DB
* %% dims -> %%: scales a value for a trigonometric function of a unit. An angle unit passes as it is; any other must be dimensionless, else Inconsistent Units, and is multiplied by %DEGPERANG.
Unit>AngleMode:
        :: UDimAngle SameDims? case2DROP DROP    * CAC63
          UDimNone EQUALNOTcase CONSTUNITERR     * CAC7C
          XLIB %DEGPERANG %%* ;                  * CAC8B

LIB0C1.hash:
        CON(5)  DOHSTR                           * CACA0  hash table of library 0C1
        LENGTH                                   * CACA5  length, to #CAD04
        CON(5)  0                                * CACAA  names of length 1
        CON(5)  0                                * CACAF  names of length 2
        CON(5)  0                                * CACB4  names of length 3
        CON(5)  0                                * CACB9  names of length 4
        CON(5)  0                                * CACBE  names of length 5
        CON(5)  0                                * CACC3  names of length 6
        CON(5)  0                                * CACC8  names of length 7
        CON(5)  0                                * CACCD  names of length 8
        CON(5)  0                                * CACD2  names of length 9
        CON(5)  0                                * CACD7  names of length 10
        CON(5)  0                                * CACDC  names of length 11
        CON(5)  0                                * CACE1  names of length 12
        CON(5)  0                                * CACE6  names of length 13
        CON(5)  0                                * CACEB  names of length 14
        CON(5)  0                                * CACF0  names of length 15
        CON(5)  0                                * CACF5  names of length 16
        REL(5)  LIB0C1.hash.L1                   * CACFA  end of the names
LIB0C1.hash.L1:
        CON(5)  0                                * CACFF  command 000 has no name
        ENDLENGTH                                * CAD04

LIB0C1.link:
        CON(5)  DOHSTR                           * CAD04  link table of library 0C1
        LENGTH                                   * CAD09  length, to #CADBD
        REL(5)  DEPlotRKF                        * CAD0E  000 
        REL(5)  DEPlotRKF1                       * CAD13  001 
        REL(5)  DEPlotInit                       * CAD18  002 
        REL(5)  DEPlotRRK                        * CAD1D  003 
        REL(5)  DEPlotRRK1                       * CAD22  004 
        REL(5)  RKFERR~1                         * CAD27  005 
        REL(5)  RKFTrap                          * CAD2C  006 
        REL(5)  RKFERR~2                         * CAD31  007 
        REL(5)  RKFStep%                         * CAD36  008 
        REL(5)  RKFStep[]                        * CAD3B  009 
        REL(5)  RKFSTEP~1                        * CAD40  00A 
        REL(5)  RKFSTEP~2                        * CAD45  00B 
        REL(5)  RKFStepSel                       * CAD4A  00C 
        REL(5)  DEStepCtl                        * CAD4F  00D 
        REL(5)  DoRKF                            * CAD54  00E 
        REL(5)  DoRKF1                           * CAD59  00F 
        REL(5)  DEStepArgs                       * CAD5E  010 
        REL(5)  RKFBindList                      * CAD63  011 
        REL(5)  DETolArg                         * CAD68  012 
        REL(5)  RSBERR~1                         * CAD6D  013 
        REL(5)  RRKTrap                          * CAD72  014 
        REL(5)  RSBERR~2                         * CAD77  015 
        REL(5)  RRKStep%                         * CAD7C  016 
        REL(5)  RRKStep[]                        * CAD81  017 
        REL(5)  RRKSTEP~1                        * CAD86  018 
        REL(5)  RRKSTEP~2                        * CAD8B  019 
        REL(5)  RRKStepSel                       * CAD90  01A 
        REL(5)  RRKorRKF                         * CAD95  01B 
        REL(5)  RRKAccept                        * CAD9A  01C 
        REL(5)  DoRRK                            * CAD9F  01D 
        REL(5)  DoRRK1                           * CADA4  01E 
        REL(5)  RRKBindList                      * CADA9  01F 
        REL(5)  UnitAngleFix                     * CADAE  020 
        REL(5)  %DEGPERANG                       * CADB3  021 
        REL(5)  Unit>AngleMode                   * CADB8  022 
        ENDLENGTH                                * CADBD
        ENDLENGTH                                * CADBD

        LENGTH                                   * CADBD  library object without its prolog (its place is the end of the link table before): length, to #CBAC7
        CON(2)  0                                * CADC2  no title
