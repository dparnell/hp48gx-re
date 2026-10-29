* HP 48GX ROM revision R, #CA95B-#CADC3: Library part 0C1
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #CA95B in the original ROM).
        RPL

* ROMPTR 0C1 01D
* refs (1): C78DB
ROMP_0C1_01D:
        :: DEPTH #3- 4PICK ROMPTR 0C1 01F ROTDROP ERRSET ROMPTR 0C1 01E * CA95B
          ERRTRAP ROMPTR 0C1 014 1PUTLAM 7GETLAM RESETDEPTH 6GETLAM 1GETABND * CA98F
          ATTNFLGCLR ;                           * CA9B8

* ROMPTR 0C1 01E
* refs (1): C78DB
ROMP_0C1_01E:
        :: ROMPTR 0C1 010 case ABND              * CA9C2
          %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 %0_2A2B4 8ROLL * CA9DC
          8NULLLAM{} BIND LAM 'W RCLCRUNCH>%ARRY ROMPTR 0C1 01A 5PUTLAM * CA9FF
          4PUTLAM 3PUTLAM RESOROMP ROMPTR 0C1 00D 6PUTLAM 2GETLAM 8GETLAM * CAA29
          11GETLAM RESOROMP ROMPTR 0C1 01B 11PUTLAM OVER %%0> 12PUTLAM BEGIN * CAA52
          10GETLAM 12GETLAM ITE OBJ_7CE00 OBJ_7CE32 * CAA80
          SWAP 11GETLAM EVAL SWAP LAM 'T OBJ_36DDF 10GETLAM OVER 12GETLAM * CAA99
          ITE %<= %>=                            * CAACC
          UNTIL 3DROP 1GETABND ABND ;            * CAADB

* ROMPTR 0C1 01F
* refs (1): C78DB
ROMP_0C1_01F:
        :: DUPLENCOMP BINT5 #< case2drop SETSIZEERR * CAAF4
          DUPINCOMP BINT5 #- NDROP               * CAB12
          { NULLLAM NULLLAM LAM 'T LAM 'W LAM 'F LAM 'FW LAM 'FT } BIND * CAB26
          5GETLAM TYPEIDNT? NOTcase SETTYPEERR   * CAB7A
          4GETLAM TYPEIDNT? NOTcase SETTYPEERR   * CAB8E
        ;                                        * CABA2

* ROMPTR 0C1 020
* refs (1): C78DB
ROMP_0C1_020:
        ::                                       * CABA7

* ROMPTR 0C1 021
* refs (1): C78DB
UMSIN~4:
          CODE                                   * CABAC  73 nibbles
            GOSBVL  SAVPTR                       * CABB6
            GOSBVL  GetAngleST                   * CABBD
            A=0     W                            * CABC4
            A=A-1   A                            * CABC7
            C=0     W                            * CABC9
            P=      14                           * CABCC
            LC(1)   #9                           * CABCE
            ?ST=1   4                            * CABD1
            GOYES   L_CABF5                      * CABD4
            A=A+1   A                            * CABD6
            LC(1)   #1                           * CABD8
            ?ST=0   9                            * CABDB
            GOYES   L_CABF5                      * CABDE
            A=A+1   A                            * CABE0
            P=      0                            * CABE2
            LC(15)  #572957795130823             * CABE4
L_CABF5:
            B=C     W                            * CABF5
            GOVLNG  L_2A235                      * CABF8
          ENDCODE                                * CABFF
          SWAPROT OBJ_0F756 BINT8 PULLEREALEL SWAP %0_2A2B4 BINT8 PUTREALEL * CABFF
          OBJ_3835E EQUALNOTcase CONSTUNITERR    * CAC27
          %%1 EQUALcasedrop %%*                  * CAC36
          %%-1 EQUALcasedrop %%/                 * CAC45
          %%^ %%* ;                              * CAC54

* ROMPTR 0C1 022
* refs (1): C78DB
UMSIN~2:
        :: UMSIN~3 OBJ_0FBFB case2DROP DROP      * CAC63
          OBJ_3835E EQUALNOTcase CONSTUNITERR    * CAC7C
          ROMPTR 0C1 021 %%* ;                   * CAC8B

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
        REL(5)  L_CACFF                          * CACFA  end of the names
L_CACFF:
        CON(5)  0                                * CACFF  command 000 has no name
        ENDLENGTH                                * CAD04

LIB0C1.link:
        CON(5)  DOHSTR                           * CAD04  link table of library 0C1
        LENGTH                                   * CAD09  length, to #CADBD
        REL(5)  ROMP_0C1_000                     * CAD0E  000 
        REL(5)  ROMP_0C1_001                     * CAD13  001 
        REL(5)  ROMP_0C1_002                     * CAD18  002 
        REL(5)  ROMP_0C1_003                     * CAD1D  003 
        REL(5)  ROMP_0C1_004                     * CAD22  004 
        REL(5)  RKFERR~1                         * CAD27  005 
        REL(5)  ROMP_0C1_006                     * CAD2C  006 
        REL(5)  RKFERR~2                         * CAD31  007 
        REL(5)  ROMP_0C1_008                     * CAD36  008 
        REL(5)  ROMP_0C1_009                     * CAD3B  009 
        REL(5)  RKFSTEP~1                        * CAD40  00A 
        REL(5)  RKFSTEP~2                        * CAD45  00B 
        REL(5)  ROMP_0C1_00C                     * CAD4A  00C 
        REL(5)  ROMP_0C1_00D                     * CAD4F  00D 
        REL(5)  ROMP_0C1_00E                     * CAD54  00E 
        REL(5)  ROMP_0C1_00F                     * CAD59  00F 
        REL(5)  ROMP_0C1_010                     * CAD5E  010 
        REL(5)  ROMP_0C1_011                     * CAD63  011 
        REL(5)  ROMP_0C1_012                     * CAD68  012 
        REL(5)  RSBERR~1                         * CAD6D  013 
        REL(5)  ROMP_0C1_014                     * CAD72  014 
        REL(5)  RSBERR~2                         * CAD77  015 
        REL(5)  ROMP_0C1_016                     * CAD7C  016 
        REL(5)  ROMP_0C1_017                     * CAD81  017 
        REL(5)  RRKSTEP~1                        * CAD86  018 
        REL(5)  RRKSTEP~2                        * CAD8B  019 
        REL(5)  ROMP_0C1_01A                     * CAD90  01A 
        REL(5)  ROMP_0C1_01B                     * CAD95  01B 
        REL(5)  ROMP_0C1_01C                     * CAD9A  01C 
        REL(5)  ROMP_0C1_01D                     * CAD9F  01D 
        REL(5)  ROMP_0C1_01E                     * CADA4  01E 
        REL(5)  ROMP_0C1_01F                     * CADA9  01F 
        REL(5)  ROMP_0C1_020                     * CADAE  020 
        REL(5)  UMSIN~4                          * CADB3  021 
        REL(5)  UMSIN~2                          * CADB8  022 
        ENDLENGTH                                * CADBD
        NIBHEX  A0D0000                          * CADBD  ...
