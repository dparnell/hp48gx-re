* HP 48GX ROM revision R, #CA95B-#CADC3: Library part 0C1
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #CA95B in the original ROM).
        RPL

* ROMPTR 0C1 01D
* refs (1): C78DB
ROMP_0C1_01D:
        ::                                       * CA95B
          DEPTH                                  * CA960
          #3-                                    * CA965
          4PICK                                  * CA96A
          ROMPTR  0C1 01F                        * CA96F
          ROTDROP                                * CA97A
          ERRSET                                 * CA97F
          ROMPTR  0C1 01E                        * CA984
          ERRTRAP                                * CA98F
          ROMPTR  0C1 014                        * CA994
          1PUTLAM                                * CA99F
          7GETLAM                                * CA9A4
          RESETDEPTH                             * CA9A9
          6GETLAM                                * CA9AE
          1GETABND                               * CA9B3
          ATTNFLGCLR                             * CA9B8
        ;                                        * CA9BD

* ROMPTR 0C1 01E
* refs (1): C78DB
ROMP_0C1_01E:
        ::                                       * CA9C2
          ROMPTR  0C1 010                        * CA9C7
          case                                   * CA9D2
          ABND                                   * CA9D7
          %0_2A2B4                               * CA9DC
          %0_2A2B4                               * CA9E1
          %0_2A2B4                               * CA9E6
          %0_2A2B4                               * CA9EB
          %0_2A2B4                               * CA9F0
          %0_2A2B4                               * CA9F5
          8ROLL                                  * CA9FA
          8NULLLAM{}                             * CA9FF
          BIND                                   * CAA04
          LAM     'W                             * CAA09
          OBJ_36E43                              * CAA14
          ROMPTR  0C1 01A                        * CAA19
          5PUTLAM                                * CAA24
          4PUTLAM                                * CAA29
          3PUTLAM                                * CAA2E
          RESOROMP                               * CAA33
          ROMPTR  0C1 00D                        * CAA38
          6PUTLAM                                * CAA43
          2GETLAM                                * CAA48
          8GETLAM                                * CAA4D
          11GETLAM                               * CAA52
          RESOROMP                               * CAA57
          ROMPTR  0C1 01B                        * CAA5C
          11PUTLAM                               * CAA67
          OVER                                   * CAA6C
          %%0>                                   * CAA71
          12PUTLAM                               * CAA76
          BEGIN                                  * CAA7B
          10GETLAM                               * CAA80
          12GETLAM                               * CAA85
          ITE                                    * CAA8A
          OBJ_7CE00                              * CAA8F
          OBJ_7CE32                              * CAA94
          SWAP                                   * CAA99
          11GETLAM                               * CAA9E
          EVAL                                   * CAAA3
          SWAP                                   * CAAA8
          LAM     'T                             * CAAAD
          OBJ_36DDF                              * CAAB8
          10GETLAM                               * CAABD
          OVER                                   * CAAC2
          12GETLAM                               * CAAC7
          ITE                                    * CAACC
          %<=                                    * CAAD1
          %>=                                    * CAAD6
          UNTIL                                  * CAADB
          3DROP                                  * CAAE0
          1GETABND                               * CAAE5
          ABND                                   * CAAEA
        ;                                        * CAAEF

* ROMPTR 0C1 01F
* refs (1): C78DB
ROMP_0C1_01F:
        ::                                       * CAAF4
          DUPLENCOMP                             * CAAF9
          BINT5                                  * CAAFE
          #<                                     * CAB03
          case2drop                              * CAB08
          SETSIZEERR                             * CAB0D
          DUPINCOMP                              * CAB12
          BINT5                                  * CAB17
          #-                                     * CAB1C
          NDROP                                  * CAB21
          {                                      * CAB26
            NULLLAM                              * CAB2B
            NULLLAM                              * CAB30
            LAM     'T                           * CAB35
            LAM     'W                           * CAB40
            LAM     'F                           * CAB4B
            LAM     'FW                          * CAB56
            LAM     'FT                          * CAB63
          }                                      * CAB70
          BIND                                   * CAB75
          5GETLAM                                * CAB7A
          TYPEIDNT?                              * CAB7F
          NOTcase                                * CAB84
          SETTYPEERR                             * CAB89
          4GETLAM                                * CAB8E
          TYPEIDNT?                              * CAB93
          NOTcase                                * CAB98
          SETTYPEERR                             * CAB9D
        ;                                        * CABA2

* ROMPTR 0C1 020
* refs (1): C78DB
ROMP_0C1_020:
        ::                                       * CABA7

* ROMPTR 0C1 021
* refs (1): C78DB
ROMP_0C1_021:
          CODE                                   * CABAC  73 nibbles
            GOSBVL  SAVPTR                       * CABB6
            GOSBVL  SUB_2AEF6                    * CABBD
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
          SWAPROT                                * CABFF
          OBJ_0F756                              * CAC04
          BINT8                                  * CAC09
          PULLEREALEL                            * CAC0E
          SWAP                                   * CAC13
          %0_2A2B4                               * CAC18
          BINT8                                  * CAC1D
          PUTREALEL                              * CAC22
          OBJ_3835E                              * CAC27
          EQUALNOTcase                           * CAC2C
          CONSTUNITERR                           * CAC31
          %%1                                    * CAC36
          EQUALcasedrop                          * CAC3B
          %%*                                    * CAC40
          %%-1                                   * CAC45
          EQUALcasedrop                          * CAC4A
          %%/                                    * CAC4F
          %%^                                    * CAC54
          %%*                                    * CAC59
        ;                                        * CAC5E

* ROMPTR 0C1 022
* refs (1): C78DB
ROMP_0C1_022:
        ::                                       * CAC63
          OBJ_384D0                              * CAC68
          OBJ_0FBFB                              * CAC6D
          case2DROP                              * CAC72
          DROP                                   * CAC77
          OBJ_3835E                              * CAC7C
          EQUALNOTcase                           * CAC81
          CONSTUNITERR                           * CAC86
          ROMPTR  0C1 021                        * CAC8B
          %%*                                    * CAC96
        ;                                        * CAC9B

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
        REL(5)  ROMP_0C1_005                     * CAD27  005 
        REL(5)  ROMP_0C1_006                     * CAD2C  006 
        REL(5)  ROMP_0C1_007                     * CAD31  007 
        REL(5)  ROMP_0C1_008                     * CAD36  008 
        REL(5)  ROMP_0C1_009                     * CAD3B  009 
        REL(5)  ROMP_0C1_00A                     * CAD40  00A 
        REL(5)  ROMP_0C1_00B                     * CAD45  00B 
        REL(5)  ROMP_0C1_00C                     * CAD4A  00C 
        REL(5)  ROMP_0C1_00D                     * CAD4F  00D 
        REL(5)  ROMP_0C1_00E                     * CAD54  00E 
        REL(5)  ROMP_0C1_00F                     * CAD59  00F 
        REL(5)  ROMP_0C1_010                     * CAD5E  010 
        REL(5)  ROMP_0C1_011                     * CAD63  011 
        REL(5)  ROMP_0C1_012                     * CAD68  012 
        REL(5)  ROMP_0C1_013                     * CAD6D  013 
        REL(5)  ROMP_0C1_014                     * CAD72  014 
        REL(5)  ROMP_0C1_015                     * CAD77  015 
        REL(5)  ROMP_0C1_016                     * CAD7C  016 
        REL(5)  ROMP_0C1_017                     * CAD81  017 
        REL(5)  ROMP_0C1_018                     * CAD86  018 
        REL(5)  ROMP_0C1_019                     * CAD8B  019 
        REL(5)  ROMP_0C1_01A                     * CAD90  01A 
        REL(5)  ROMP_0C1_01B                     * CAD95  01B 
        REL(5)  ROMP_0C1_01C                     * CAD9A  01C 
        REL(5)  ROMP_0C1_01D                     * CAD9F  01D 
        REL(5)  ROMP_0C1_01E                     * CADA4  01E 
        REL(5)  ROMP_0C1_01F                     * CADA9  01F 
        REL(5)  ROMP_0C1_020                     * CADAE  020 
        REL(5)  ROMP_0C1_021                     * CADB3  021 
        REL(5)  ROMP_0C1_022                     * CADB8  022 
        ENDLENGTH                                * CADBD
        NIBHEX  A0D0000                          * CADBD  ...
