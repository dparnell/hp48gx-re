* HP 48GX ROM revision R, #A54DB-#A8520: Library part 0B4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #A54DB in the original ROM).
        RPL

* ROMPTR 0B4 046
* refs (1): A2437
ROMP_0B4_046:
        ::                                       * A54DB
          GETPTYPE                               * A54E0
          {                                      * A54E5
            xFUNCTION                            * A54EA
            ROMPTR  0B4 049                      * A54EF
            POLAR                                * A54FA
            ROMPTR  0B4 049                      * A54FF
            xCONIC                               * A550A
            ROMPTR  0B4 068                      * A550F
            xTRUTH                               * A551A
            ROMPTR  0B4 06D                      * A551F
            xPARAMETRIC                          * A552A
            ROMPTR  0B4 070                      * A552F
            ROMPTR  0AB 00E                      * A553A  DIFFEQ
            ROMPTR  0B4 071                      * A5545
            xHISTOGRAM                           * A5550
            ROMPTR  0B4 07D                      * A5555
            xBAR                                 * A5560
            ROMPTR  0B4 088                      * A5565
            xSCATTER                             * A5570
            ROMPTR  0B4 08B                      * A5575
            ROMPTR  0AB 00C                      * A5580  SLOPEFIELD
            ROMPTR  0B4 0E6                      * A558B
            ROMPTR  0AB 008                      * A5596  WIREFRAME
            ROMPTR  0B4 0E6                      * A55A1
            ROMPTR  0AB 00D                      * A55AC  PCONTOUR
            ROMPTR  0B4 0E6                      * A55B7
            ROMPTR  0AB 00B                      * A55C2  YSLICE
            ROMPTR  0B4 0E6                      * A55CD
            ROMPTR  0AB 00A                      * A55D8  GRIDMAP
            ROMPTR  0B4 0E6                      * A55E3
            ROMPTR  0AB 009                      * A55EE  PARSURFACE
            ROMPTR  0B4 0E6                      * A55F9
          }                                      * A5604
          ROMPTR  0B5 07B                        * A5609
          NcaseSIZEERR                           * A5614
          EVAL                                   * A5619
        ;                                        * A561E

* ROMPTR 0B4 047
* refs (1): A2437
ROMP_0B4_047:
        ::                                       * A5623
          GETPTYPE                               * A5628
          {                                      * A562D
            xFUNCTION                            * A5632
            ROMPTR  0B4 05A                      * A5637
            POLAR                                * A5642
            ROMPTR  0B4 05A                      * A5647
            xCONIC                               * A5652
            ROMPTR  0B4 06A                      * A5657
            xTRUTH                               * A5662
            ROMPTR  0B4 06A                      * A5667
            xPARAMETRIC                          * A5672
            ROMPTR  0B4 05A                      * A5677
            ROMPTR  0AB 00E                      * A5682  DIFFEQ
            ROMPTR  0B4 072                      * A568D
            xHISTOGRAM                           * A5698
            ROMPTR  0B4 082                      * A569D
            xBAR                                 * A56A8
            ROMPTR  0B4 082                      * A56AD
            xSCATTER                             * A56B8
            ROMPTR  0B4 08C                      * A56BD
            ROMPTR  0AB 00C                      * A56C8  SLOPEFIELD
            ROMPTR  0B4 0E7                      * A56D3
            ROMPTR  0AB 008                      * A56DE  WIREFRAME
            ROMPTR  0B4 0E7                      * A56E9
            ROMPTR  0AB 00D                      * A56F4  PCONTOUR
            ROMPTR  0B4 0E7                      * A56FF
            ROMPTR  0AB 00B                      * A570A  YSLICE
            ROMPTR  0B4 0E7                      * A5715
            ROMPTR  0AB 00A                      * A5720  GRIDMAP
            ROMPTR  0B4 0E7                      * A572B
            ROMPTR  0AB 009                      * A5736  PARSURFACE
            ROMPTR  0B4 0E7                      * A5741
          }                                      * A574C
          ROMPTR  0B5 07B                        * A5751
          NcaseSIZEERR                           * A575C
          EVAL                                   * A5761
        ;                                        * A5766

* ROMPTR 0B4 048
* refs (1): A2437
ROMP_0B4_048:
        ::                                       * A576B
          PICK                                   * A5770
          {                                      * A5775
            ROMPTR  0B5 051                      * A577A
            ROMPTR  0B4 05B                      * A5785
            ROMPTR  0B5 052                      * A5790
            ROMPTR  0B4 05B                      * A579B
            ROMPTR  0B5 053                      * A57A6
            ROMPTR  0B4 06C                      * A57B1
            ROMPTR  0B5 054                      * A57BC
            ROMPTR  0B4 06F                      * A57C7
            ROMPTR  0B5 055                      * A57D2
            ROMPTR  0B4 05B                      * A57DD
            ROMPTR  0B5 056                      * A57E8
            ROMPTR  0B4 073                      * A57F3
            ROMPTR  0B5 057                      * A57FE
            ROMPTR  0B4 083                      * A5809
            ROMPTR  0B5 058                      * A5814
            ROMPTR  0B4 083                      * A581F
            ROMPTR  0B5 059                      * A582A
            ROMPTR  0B4 08D                      * A5835
            ROMPTR  0B5 05A                      * A5840
            ROMPTR  0B4 0E8                      * A584B
            ROMPTR  0B5 05B                      * A5856
            ROMPTR  0B4 0E8                      * A5861
            ROMPTR  0B5 05C                      * A586C
            ROMPTR  0B4 0E8                      * A5877
            ROMPTR  0B5 05D                      * A5882
            ROMPTR  0B4 0E8                      * A588D
            ROMPTR  0B5 05E                      * A5898
            ROMPTR  0B4 0E8                      * A58A3
            ROMPTR  0B5 05F                      * A58AE
            ROMPTR  0B4 0E8                      * A58B9
          }                                      * A58C4
          ROMPTR  0B5 07B                        * A58C9
          NcaseSIZEERR                           * A58D4
          EVAL                                   * A58D9
        ;                                        * A58DE

* ROMPTR 0B4 049
* refs (1): A2437
ROMP_0B4_049:
        ::                                       * A58E3

* ROMPTR 0B4 04A
* refs (1): A2437
ROMP_0B4_04A:
          ::                                     * A58E8
            #       BE02                         * A58ED  48642
            BINT1                                * A58F7
            BINT10                               * A58FC
          ;                                      * A5901

* ROMPTR 0B4 04B
* refs (1): A2437
ROMP_0B4_04B:
          ::                                     * A5906
            #       BE03                         * A590B  48643
            BINT91                               * A5915
            BINT10                               * A591A
          ;                                      * A591F

* ROMPTR 0B4 04C
* refs (1): A2437
ROMP_0B4_04C:
          ::                                     * A5924
            #       BF08                         * A5929  48904
            BINT1                                * A5933
            BINT19                               * A5938
          ;                                      * A593D

* ROMPTR 0B4 04D
* refs (1): A2437
ROMP_0B4_04D:
          ::                                     * A5942
            #       BF12                         * A5947  48914
            BINT1                                * A5951
            BINT28                               * A5956
          ;                                      * A595B

* ROMPTR 0B4 04E
* refs (1): A2437
ROMP_0B4_04E:
          ::                                     * A5960
            #       BE04                         * A5965  48644
            BINT49                               * A596F
            BINT28                               * A5974
          ;                                      * A5979

* ROMPTR 0B4 04F
* refs (1): A2437
ROMP_0B4_04F:
          ::                                     * A597E
            #       BE05                         * A5983  48645
            BINT8                                * A598D
            BINT37                               * A5992
          ;                                      * A5997

* ROMPTR 0B4 050
* refs (1): A2437
ROMP_0B4_050:
          ::                                     * A599C
            #       BE06                         * A59A1  48646
            BINT49                               * A59AB
            BINT37                               * A59B0
          ;                                      * A59B5

* ROMPTR 0B4 051
* refs (1): A2437
ROMP_0B4_051:
          ::                                     * A59BA
            OBJ_38345                            * A59BF
            ROMPTR  0B4 065                      * A59C4
            BINT25                               * A59CF
            BINT8                                * A59D4
            BINT61                               * A59D9
            BINT9                                * A59DE
            BINT12                               * A59E3
            MINUSONE                             * A59E8
            BINT17                               * A59ED
            #       BE07                         * A59F2  48647
            ROMPTR  0B5 050                      * A59FC
            BINT17                               * A5A07
            ROMPTR  0B5 051                      * A5A0C
            MINUSONE                             * A5A17
          ;                                      * A5A1C

* ROMPTR 0B4 052
* refs (1): A2437
ROMP_0B4_052:
          ::                                     * A5A21
            OBJ_38345                            * A5A26
            ROMPTR  0B4 067                      * A5A2B
            BINT100                              * A5A36
            BINT8                                * A5A3B
            BINT25                               * A5A40
            BINT9                                * A5A45
            BINT12                               * A5A4A
            MINUSONE                             * A5A4F
            BINT33                               * A5A54
            #       BE08                         * A5A59  48648
            ROMPTR  0B5 149                      * A5A63
            BINT17                               * A5A6E
            ROMPTR  0B5 14A                      * A5A73
            MINUSONE                             * A5A7E
          ;                                      * A5A83

* ROMPTR 0B4 053
* refs (1): A2437
ROMP_0B4_053:
          ::                                     * A5A88
            OBJ_38345                            * A5A8D
            ROMPTR  0B4 066                      * A5A92
            BINT25                               * A5A9D
            BINT17                               * A5AA2
            #       67                           * A5AA7  103
            BINT9                                * A5AB1
            BINT23                               * A5AB6
            {                                    * A5ABB
              BINT9                              * A5AC0
              BINT8                              * A5AC5
              BINT6                              * A5ACA
              BINT0                              * A5ACF
              BINT5                              * A5AD4
            }                                    * A5AD9
            BINT4                                * A5ADE
            #       BE09                         * A5AE3  48649
            {                                    * A5AED
              #       BF0A                       * A5AF2  48906
              TRUE                               * A5AFC
            }                                    * A5B01
            MINUSONE                             * A5B06
            MINUSONE                             * A5B0B
            MINUSONE                             * A5B10
          ;                                      * A5B15

* ROMPTR 0B4 054
* refs (1): A2437
ROMP_0B4_054:
          ::                                     * A5B1A
            OBJ_38345                            * A5B1F
            ROMPTR  0B4 067                      * A5B24
            BINT25                               * A5B2F
            BINT26                               * A5B34
            BINT13                               * A5B39
            BINT9                                * A5B3E
            BINT1                                * A5B43
            {                                    * A5B48
              BINT6                              * A5B4D
            }                                    * A5B52
            BINT4                                * A5B57
            #       BF1C                         * A5B5C  48924
            MINUSONE                             * A5B66
            MINUSONE                             * A5B6B
            'IDX                                 * A5B70
            MINUSONE                             * A5B75
          ;                                      * A5B7A

* ROMPTR 0B4 055
* refs (1): A2437
ROMP_0B4_055:
          ::                                     * A5B7F
            OBJ_38345                            * A5B84
            ROMPTR  0B4 067                      * A5B89
            #       4C                           * A5B94  76
            BINT26                               * A5B9E
            BINT25                               * A5BA3
            BINT9                                * A5BA8
            BINT1                                * A5BAD
            {                                    * A5BB2
              BINT0                              * A5BB7
            }                                    * A5BBC
            BINT4                                * A5BC1
            #       BE0A                         * A5BC6  48650
            MINUSONE                             * A5BD0
            MINUSONE                             * A5BD5
            %       -6.5E0                       * A5BDA
            MINUSONE                             * A5BEF
          ;                                      * A5BF4

* ROMPTR 0B4 056
* refs (1): A2437
ROMP_0B4_056:
          ::                                     * A5BF9
            OBJ_38345                            * A5BFE
            ROMPTR  0B4 067                      * A5C03
            #       6A                           * A5C0E  106
            BINT26                               * A5C18
            BINT25                               * A5C1D
            BINT9                                * A5C22
            BINT1                                * A5C27
            {                                    * A5C2C
              BINT0                              * A5C31
            }                                    * A5C36
            BINT4                                * A5C3B
            #       BE0B                         * A5C40  48651
            MINUSONE                             * A5C4A
            MINUSONE                             * A5C4F
            %       6.5E0                        * A5C54
            MINUSONE                             * A5C69
          ;                                      * A5C6E

* ROMPTR 0B4 057
* refs (1): A2437
ROMP_0B4_057:
          ::                                     * A5C73
            OBJ_38345                            * A5C78
            ROMPTR  0B4 05E                      * A5C7D
            BINT1                                * A5C88
            BINT35                               * A5C8D
            BINT6                                * A5C92
            BINT9                                * A5C97
            BINT32                               * A5C9C
            MINUSONE                             * A5CA1
            MINUSONE                             * A5CA6
            #       BE0C                         * A5CAB  48652
            MINUSONE                             * A5CB5
            MINUSONE                             * A5CBA
            FALSE                                * A5CBF
            MINUSONE                             * A5CC4
          ;                                      * A5CC9

* ROMPTR 0B4 058
* refs (1): A2437
ROMP_0B4_058:
          ::                                     * A5CCE
            OBJ_38345                            * A5CD3
            ROMPTR  0B4 067                      * A5CD8
            #       4C                           * A5CE3  76
            BINT35                               * A5CED
            BINT25                               * A5CF2
            BINT9                                * A5CF7
            BINT1                                * A5CFC
            {                                    * A5D01
              BINT0                              * A5D06
            }                                    * A5D0B
            OBJ_38345                            * A5D10
            ROMPTR  0B4 0E1                      * A5D15
            #       BE0D                         * A5D20  48653
            MINUSONE                             * A5D2A
            MINUSONE                             * A5D2F
            %       -3.1E0                       * A5D34
            MINUSONE                             * A5D49
          ;                                      * A5D4E

* ROMPTR 0B4 059
* refs (1): A2437
ROMP_0B4_059:
          ::                                     * A5D53
            OBJ_38345                            * A5D58
            ROMPTR  0B4 067                      * A5D5D
            #       6A                           * A5D68  106
            BINT35                               * A5D72
            BINT25                               * A5D77
            BINT9                                * A5D7C
            BINT1                                * A5D81
            {                                    * A5D86
              BINT0                              * A5D8B
            }                                    * A5D90
            OBJ_38345                            * A5D95
            ROMPTR  0B4 0E2                      * A5D9A
            #       BE0E                         * A5DA5  48654
            MINUSONE                             * A5DAF
            MINUSONE                             * A5DB4
            %       3.2E0                        * A5DB9
            MINUSONE                             * A5DCE
          ;                                      * A5DD3
          BINT7                                  * A5DD8
          BINT9                                  * A5DDD
          OBJ_38345                              * A5DE2
          ROMPTR  0B4 05C                        * A5DE7
          #       BE01                           * A5DF2  48641

* ROMPTR 0B4 05A
* refs (1): A2437
ROMP_0B4_05A:
          ::                                     * A5DFC
            ROMPTR  0B5 13A                      * A5E01
            ROMPTR  0B5 028                      * A5E0C
            CHECKPVARS                           * A5E17
            INCOMPDROP                           * A5E1C
            DROP                                 * A5E21
            ROMPTR  0B5 04F                      * A5E26
            8UNROLL                              * A5E31
            2DROP                                * A5E36
            1get(li)?                            * A5E3B
            SWAPROT                              * A5E40
            C%>%                                 * A5E45
            ROT                                  * A5E4A
            C%>%                                 * A5E4F
            ROTSWAP                              * A5E54
            FALSE                                * A5E59
            3UNROLL                              * A5E5E
          ;                                      * A5E63
          BINT9                                  * A5E68
          ROMPTR  0B0 0AA                        * A5E6D
        ;                                        * A5E78

* ROMPTR 0B4 05B
* refs (1): A2437
ROMP_0B4_05B:
        ::                                       * A5E7D
          yrng(2r)                               * A5E82
          7UNROLL                                * A5E87
          xrng(2r)                               * A5E8C
          ROMPTR  0B5 02F                        * A5E91
          ROMPTR  0B5 029                        * A5E9C
          ROMPTR  0B0 09D                        * A5EA7
          ROMPTR  0B0 09C                        * A5EB2
          FALSE                                  * A5EBD
          SWAP                                   * A5EC2
        ;                                        * A5EC7

* ROMPTR 0B4 05C
* refs (1): A2437
ROMP_0B4_05C:
        ::                                       * A5ECC
          {                                      * A5ED1
            BINT16                               * A5ED6
            ::                                   * A5EDB
              ROMPTR  0B4 05D                    * A5EE0
              TRUE                               * A5EEB
            ;                                    * A5EF0
            BINT14                               * A5EF5
            ::                                   * A5EFA
              BINT3                              * A5EFF
              ROMPTR  0B4 0E5                    * A5F04
            ;                                    * A5F0F
            BINT56                               * A5F14
            ::                                   * A5F19
              14GETLAM                           * A5F1E
              SWAP                               * A5F23
            ;                                    * A5F28
          }                                      * A5F2D
          EQLookup                               * A5F32
          case                                   * A5F37
          ::                                     * A5F3C
            EVAL                                 * A5F41
            TRUE                                 * A5F46
          ;                                      * A5F4B
          DROPFALSE                              * A5F50
        ;                                        * A5F55

* ROMPTR 0B4 05D
* refs (1): A2437
ROMP_0B4_05D:
        {                                        * A5F5A
          {                                      * A5F5F
            ::                                   * A5F64
              PTR     DirLabel:                  * A5F69
              $       "OPTS"                     * A5F6E
            ;                                    * A5F80
            ROMPTR  0B4 05F                      * A5F85
          }                                      * A5F90
          {                                      * A5F95
            $       "ERASE"                      * A5F9A
            ROMPTR  0B4 063                      * A5FAE
          }                                      * A5FB9
          {                                      * A5FBE
            $       "DRAW"                       * A5FC3
            ROMPTR  0B4 064                      * A5FD5
          }                                      * A5FE0
        }                                        * A5FE5

* ROMPTR 0B4 05E
* refs (1): A2437
ROMP_0B4_05E:
        ::                                       * A5FEA
          BINT47                                 * A5FEF
          OVER                                   * A5FF4
          #<>case                                * A5FF9
          ROMPTR  0B4 067                        * A5FFE
          DROP                                   * A6009
          ROMPTR  0B4 0D6                        * A600E
          TRUE                                   * A6019
        ;                                        * A601E

* ROMPTR 0B4 05F
* refs (1): A2437
ROMP_0B4_05F:
        ::                                       * A6023
          TakeOver                               * A6028
          ROMPTR  0B0 0C8                        * A602D  GetFieldVals
          14GETLAM                               * A6038
          ROMPTR  0B4 048                        * A603D
          2DROP                                  * A6048
          ROMPTR  0B4 060                        * A604D
          GETPTYPE                               * A6058
          1LAMBIND                               * A605D
          DoInputForm                            * A6062
          1GETABND                               * A6067
          PUTPTYPE                               * A606C
          MINUSONE                               * A6071
          '                                      * A6076
          LAM     'PX                            * A607B
          STOLAM                                 * A6088
          ROMPTR  0B0 020                        * A608D
          ROMPTR  0B0 06B                        * A6098
          NOT?SEMI                               * A60A3
          ROMPTR  0B4 062                        * A60A8
          ROMPTR  0B4 047                        * A60B3
          ROMPTR  0B0 0D8                        * A60BE
        ;                                        * A60C9

* ROMPTR 0B4 060
* refs (1): A2437
ROMP_0B4_060:
        ::                                       * A60CE
          GETPTYPE                               * A60D3
          {                                      * A60D8
            xFUNCTION                            * A60DD
            ROMPTR  0B4 08E                      * A60E2
            POLAR                                * A60ED
            ROMPTR  0B4 0B1                      * A60F2
            xPARAMETRIC                          * A60FD
            ROMPTR  0B4 0B7                      * A6102
            xCONIC                               * A610D
            ROMPTR  0B4 0BA                      * A6112
            xTRUTH                               * A611D
            ROMPTR  0B4 0BD                      * A6122
            ROMPTR  0AB 00E                      * A612D  DIFFEQ
            ROMPTR  0B4 0C6                      * A6138
            xHISTOGRAM                           * A6143
            ROMPTR  0B4 0CE                      * A6148
            xBAR                                 * A6153
            ROMPTR  0B4 0CE                      * A6158
            xSCATTER                             * A6163
            ROMPTR  0B4 0CE                      * A6168
            ROMPTR  0AB 00C                      * A6173  SLOPEFIELD
            ROMPTR  0B4 0EC                      * A617E
            ROMPTR  0AB 008                      * A6189  WIREFRAME
            ROMPTR  0B4 0F7                      * A6194
            ROMPTR  0AB 00D                      * A619F  PCONTOUR
            ROMPTR  0B4 0EC                      * A61AA
            ROMPTR  0AB 00B                      * A61B5  YSLICE
            ROMPTR  0B4 106                      * A61C0
            ROMPTR  0AB 00A                      * A61CB  GRIDMAP
            ROMPTR  0B4 109                      * A61D6
            ROMPTR  0AB 009                      * A61E1  PARSURFACE
            ROMPTR  0B4 10C                      * A61EC
          }                                      * A61F7
          ROMPTR  0B5 07B                        * A61FC
          NcaseSIZEERR                           * A6207
          EVAL                                   * A620C
        ;                                        * A6211

* ROMPTR 0B4 061
* refs (1): A2437
ROMP_0B4_061:
        ::                                       * A6216
          GETPTYPE                               * A621B
          {                                      * A6220
            xFUNCTION                            * A6225
            ROMPTR  0B4 0A6                      * A622A
            POLAR                                * A6235
            ROMPTR  0B4 0B2                      * A623A
            xPARAMETRIC                          * A6245
            ROMPTR  0B4 0A6                      * A624A
            xCONIC                               * A6255
            ROMPTR  0B4 0BB                      * A625A
            xTRUTH                               * A6265
            ROMPTR  0B4 0BE                      * A626A
            ROMPTR  0AB 00E                      * A6275  DIFFEQ
            ROMPTR  0B4 0C7                      * A6280
            xHISTOGRAM                           * A628B
            ROMPTR  0B4 0CF                      * A6290
            xBAR                                 * A629B
            ROMPTR  0B4 0CF                      * A62A0
            xSCATTER                             * A62AB
            ROMPTR  0B4 0CF                      * A62B0
            ROMPTR  0AB 00C                      * A62BB  SLOPEFIELD
            ROMPTR  0B4 0F5                      * A62C6
            ROMPTR  0AB 008                      * A62D1  WIREFRAME
            ROMPTR  0B4 104                      * A62DC
            ROMPTR  0AB 00D                      * A62E7  PCONTOUR
            ROMPTR  0B4 0F5                      * A62F2
            ROMPTR  0AB 00B                      * A62FD  YSLICE
            ROMPTR  0B4 107                      * A6308
            ROMPTR  0AB 00A                      * A6313  GRIDMAP
            ROMPTR  0B4 10A                      * A631E
            ROMPTR  0AB 009                      * A6329  PARSURFACE
            ROMPTR  0B4 104                      * A6334
          }                                      * A633F
          ROMPTR  0B5 07B                        * A6344
          NcaseSIZEERR                           * A634F
          EVAL                                   * A6354
        ;                                        * A6359

* ROMPTR 0B4 062
* refs (1): A2437
ROMP_0B4_062:
        ::                                       * A635E
          GETPTYPE                               * A6363
          {                                      * A6368
            xFUNCTION                            * A636D
            ROMPTR  0B4 0A7                      * A6372
            POLAR                                * A637D
            ROMPTR  0B4 0B3                      * A6382
            xPARAMETRIC                          * A638D
            ROMPTR  0B4 0A7                      * A6392
            xCONIC                               * A639D
            ROMPTR  0B4 0BC                      * A63A2
            xTRUTH                               * A63AD
            ROMPTR  0B4 0BF                      * A63B2
            ROMPTR  0AB 00E                      * A63BD  DIFFEQ
            ROMPTR  0B4 0C8                      * A63C8
            xHISTOGRAM                           * A63D3
            ROMPTR  0B4 0D0                      * A63D8
            xBAR                                 * A63E3
            ROMPTR  0B4 0D0                      * A63E8
            xSCATTER                             * A63F3
            ROMPTR  0B4 0D0                      * A63F8
            ROMPTR  0AB 00C                      * A6403  SLOPEFIELD
            ROMPTR  0B4 0F6                      * A640E
            ROMPTR  0AB 008                      * A6419  WIREFRAME
            ROMPTR  0B4 105                      * A6424
            ROMPTR  0AB 00D                      * A642F  PCONTOUR
            ROMPTR  0B4 0F6                      * A643A
            ROMPTR  0AB 00B                      * A6445  YSLICE
            ROMPTR  0B4 108                      * A6450
            ROMPTR  0AB 00A                      * A645B  GRIDMAP
            ROMPTR  0B4 10B                      * A6466
            ROMPTR  0AB 009                      * A6471  PARSURFACE
            ROMPTR  0B4 105                      * A647C
          }                                      * A6487
          ROMPTR  0B5 07B                        * A648C
          NcaseSIZEERR                           * A6497
          EVAL                                   * A649C
        ;                                        * A64A1

* ROMPTR 0B4 063
* refs (1): A2437
ROMP_0B4_063:
        ::                                       * A64A6
          TakeOver                               * A64AB
          ROMPTR  0B5 078                        * A64B0
          SetDA123NoCh                           * A64BB
        ;                                        * A64C0

* ROMPTR 0B4 064
* refs (1): A2437
ROMP_0B4_064:
        ::                                       * A64C5
          TakeOver                               * A64CA
          ROMPTR  0B0 0C8                        * A64CF  GetFieldVals
          14GETLAM                               * A64DA
          ROMPTR  0B4 048                        * A64DF
          GETPTYPE                               * A64EA
          1LAMBIND                               * A64EF
          ROMPTR  0B5 079                        * A64F4
          1GETABND                               * A64FF
          PUTPTYPE                               * A6504
          MINUSONE                               * A6509
          '                                      * A650E
          LAM     'PX                            * A6513
          STOLAM                                 * A6520
          ROMPTR  0B0 020                        * A6525
          ROMPTR  0B0 06B                        * A6530
          ROMPTR  0B4 047                        * A653B
          ROMPTR  0B0 0D8                        * A6546
        ;                                        * A6551

* ROMPTR 0B4 065
* refs (1): A2437
ROMP_0B4_065:
        ::                                       * A6556
          {                                      * A655B
            BINT33                               * A6560
            ROMPTR  0B4 0D5                      * A6565
            BINT26                               * A6570
            ROMPTR  0B4 0D2                      * A6575
            BINT38                               * A6580
            ROMPTR  0B4 0D3                      * A6585
            BINT39                               * A6590
            ROMPTR  0B4 0D4                      * A6595
          }                                      * A65A0
          EQLookup                               * A65A5
          case                                   * A65AA
          ::                                     * A65AF
            EVAL                                 * A65B4
            TRUE                                 * A65B9
          ;                                      * A65BE
          ROMPTR  0B4 067                        * A65C3
        ;                                        * A65CE

* ROMPTR 0B4 066
* refs (1): A2437
ROMP_0B4_066:
        ::                                       * A65D3
          BINT43                                 * A65D8
          OVER                                   * A65DD
          #<>case                                * A65E2
          ROMPTR  0B4 067                        * A65E7
          DROP                                   * A65F2
          BINT4                                  * A65F7
          ROMPTR  0B4 0E3                        * A65FC
          TrueTrue                               * A6607
        ;                                        * A660C

* ROMPTR 0B4 067
* refs (1): A2437
ROMP_0B4_067:
        ::                                       * A6611
          BINT8                                  * A6616
          #=casedrop                             * A661B
          ROMPTR  0B4 0D7                        * A6620
          BINT32                                 * A662B
          #<>case                                * A6630
          FALSE                                  * A6635
          ROMPTR  0B4 0DC                        * A663A
          TRUE                                   * A6645
        ;                                        * A664A

* ROMPTR 0B4 068
* refs (1): A2437
ROMP_0B4_068:
        ::                                       * A664F
          ROMPTR  0B4 04A                        * A6654
          ROMPTR  0B4 04B                        * A665F
          ROMPTR  0B4 04C                        * A666A
          ROMPTR  0B4 04D                        * A6675
          ROMPTR  0B4 04E                        * A6680
          ROMPTR  0B4 050                        * A668B
          ROMPTR  0B4 051                        * A6696
          ROMPTR  0B4 052                        * A66A1

* ROMPTR 0B4 069
* refs (1): A2437
ROMP_0B4_069:
          ::                                     * A66AC
            OBJ_38345                            * A66B1
            ROMPTR  0B4 06B                      * A66B6
            BINT25                               * A66C1
            BINT17                               * A66C6
            #       67                           * A66CB  103
            BINT9                                * A66D5
            BINT23                               * A66DA
            {                                    * A66DF
              BINT9                              * A66E4
              BINT8                              * A66E9
              BINT6                              * A66EE
              BINT0                              * A66F3
              BINT5                              * A66F8
            }                                    * A66FD
            BINT4                                * A6702
            #       BE09                         * A6707  48649
            {                                    * A6711
              #       BF0A                       * A6716  48906
              TRUE                               * A6720
            }                                    * A6725
            MINUSONE                             * A672A
            MINUSONE                             * A672F
            MINUSONE                             * A6734
          ;                                      * A6739
          ROMPTR  0B4 054                        * A673E
          ROMPTR  0B4 055                        * A6749
          ROMPTR  0B4 056                        * A6754
          ROMPTR  0B4 058                        * A675F
          ROMPTR  0B4 059                        * A676A
          BINT6                                  * A6775
          BINT8                                  * A677A
          OBJ_38345                              * A677F
          ROMPTR  0B4 05C                        * A6784
          #       BE01                           * A678F  48641

* ROMPTR 0B4 06A
* refs (1): A2437
ROMP_0B4_06A:
          ::                                     * A6799
            ROMPTR  0B5 13A                      * A679E
            ROMPTR  0B5 028                      * A67A9
            CHECKPVARS                           * A67B4
            INCOMPDROP                           * A67B9
            1get(li)?                            * A67BE
            '                                    * A67C3
            LAM     'PE1                         * A67C8
            STOLAM                               * A67D7
            ROMPTR  0B5 04F                      * A67DC
            8UNROLL                              * A67E7
            2DROP                                * A67EC
            1get(li)?                            * A67F1
            SWAPROT                              * A67F6
            C%>%                                 * A67FB
            ROT                                  * A6800
            C%>%                                 * A6805
            ROTSWAP                              * A680A
          ;                                      * A680F
          BINT8                                  * A6814
          ROMPTR  0B0 0AA                        * A6819
        ;                                        * A6824

* ROMPTR 0B4 06B
* refs (1): A2437
ROMP_0B4_06B:
        ::                                       * A6829
          BINT43                                 * A682E
          OVER                                   * A6833
          #<>case                                * A6838
          ROMPTR  0B4 067                        * A683D
          DROP                                   * A6848
          BINT4                                  * A684D
          ROMPTR  0B4 0E4                        * A6852
          TrueTrue                               * A685D
        ;                                        * A6862

* ROMPTR 0B4 06C
* refs (1): A2437
ROMP_0B4_06C:
        ::                                       * A6867
          yrng(2r)                               * A686C
          xrng(2r)                               * A6871
          ROMPTR  0B5 02F                        * A6876
          ROMPTR  0B5 029                        * A6881
          ROMPTR  0B0 09D                        * A688C
          ROMPTR  0B0 09C                        * A6897
          FALSE                                  * A68A2
          FALSE                                  * A68A7
        ;                                        * A68AC

* ROMPTR 0B4 06D
* refs (1): A2437
ROMP_0B4_06D:
        ::                                       * A68B1
          ROMPTR  0B4 04A                        * A68B6
          ROMPTR  0B4 04B                        * A68C1
          ROMPTR  0B4 04C                        * A68CC
          ROMPTR  0B4 04D                        * A68D7
          ROMPTR  0B4 04E                        * A68E2
          ROMPTR  0B4 050                        * A68ED
          ROMPTR  0B4 051                        * A68F8
          ROMPTR  0B4 052                        * A6903
          ROMPTR  0B4 069                        * A690E
          ROMPTR  0B4 054                        * A6919
          ROMPTR  0B4 055                        * A6924
          ROMPTR  0B4 056                        * A692F
          ROMPTR  0B4 058                        * A693A
          ROMPTR  0B4 059                        * A6945
          BINT6                                  * A6950
          BINT8                                  * A6955
          OBJ_38345                              * A695A
          ROMPTR  0B4 05C                        * A695F
          #       BE01                           * A696A  48641
          ROMPTR  0B4 06A                        * A6974
          BINT8                                  * A697F
          ROMPTR  0B0 0AA                        * A6984
        ;                                        * A698F

* ROMPTR 0B4 06F
* refs (2): A2437 A2437
ROMP_0B4_06F:
        ::                                       * A6994
          yrng(2r)                               * A6999
          xrng(2r)                               * A699E
          ROMPTR  0B5 02F                        * A69A3
          ROMPTR  0B5 029                        * A69AE
          ROMPTR  0B0 09D                        * A69B9
          ROMPTR  0B0 09C                        * A69C4
          FALSE                                  * A69CF
          FALSE                                  * A69D4
        ;                                        * A69D9

* ROMPTR 0B4 070
* refs (1): A2437
ROMP_0B4_070:
        ::                                       * A69DE
          ROMPTR  0B4 04A                        * A69E3
          ROMPTR  0B4 04B                        * A69EE
          ROMPTR  0B4 04C                        * A69F9
          ROMPTR  0B4 04D                        * A6A04
          ROMPTR  0B4 04E                        * A6A0F
          ROMPTR  0B4 04F                        * A6A1A
          ROMPTR  0B4 050                        * A6A25
          ROMPTR  0B4 051                        * A6A30
          ROMPTR  0B4 052                        * A6A3B
          OBJ_38345                              * A6A46
          ROMPTR  0B4 066                        * A6A4B
          BINT25                                 * A6A56
          BINT17                                 * A6A5B
          #       67                             * A6A60  103
          BINT9                                  * A6A6A
          BINT23                                 * A6A6F
          {                                      * A6A74
            BINT9                                * A6A79
            BINT8                                * A6A7E
            BINT6                                * A6A83
            BINT0                                * A6A88
            BINT5                                * A6A8D
          }                                      * A6A92
          BINT4                                  * A6A97
          #       BE10                           * A6A9C  48656
          {                                      * A6AA6
            #       BF0A                         * A6AAB  48906
            TRUE                                 * A6AB5
          }                                      * A6ABA
          MINUSONE                               * A6ABF
          MINUSONE                               * A6AC4
          MINUSONE                               * A6AC9
          ROMPTR  0B4 054                        * A6ACE
          ROMPTR  0B4 055                        * A6AD9
          ROMPTR  0B4 056                        * A6AE4
          ROMPTR  0B4 057                        * A6AEF
          ROMPTR  0B4 058                        * A6AFA
          ROMPTR  0B4 059                        * A6B05
          BINT7                                  * A6B10
          BINT9                                  * A6B15
          OBJ_38345                              * A6B1A
          ROMPTR  0B4 05C                        * A6B1F
          #       BE0F                           * A6B2A  48655
          ROMPTR  0B4 05A                        * A6B34
          BINT9                                  * A6B3F
          ROMPTR  0B0 0AA                        * A6B44
        ;                                        * A6B4F

* ROMPTR 0B4 071
* refs (1): A2437
ROMP_0B4_071:
        ::                                       * A6B54
          ROMPTR  0B4 04A                        * A6B59
          ROMPTR  0B4 04B                        * A6B64
          ROMPTR  0B4 04D                        * A6B6F
          #       BF13                           * A6B7A  48915
          BINT40                                 * A6B84
          BINT28                                 * A6B89
          #       BF14                           * A6B8E  48916
          BINT85                                 * A6B98
          BINT28                                 * A6B9D
          #       BF15                           * A6BA2  48917
          BINT1                                  * A6BAC
          BINT37                                 * A6BB1
          #       BF13                           * A6BB6  48915
          BINT40                                 * A6BC0
          BINT37                                 * A6BC5
          #       BF18                           * A6BCA  48920
          #       5C                             * A6BD4  92
          BINT37                                 * A6BDE
          #       BF0F                           * A6BE3  48911
          BINT1                                  * A6BED
          BINT19                                 * A6BF2
          #       BF10                           * A6BF7  48912
          BINT37                                 * A6C01
          BINT19                                 * A6C06
          #       BF11                           * A6C0B  48913
          BINT85                                 * A6C15
          BINT19                                 * A6C1A
          ROMPTR  0B4 051                        * A6C1F
          ROMPTR  0B4 052                        * A6C2A
          OBJ_38345                              * A6C35
          ROMPTR  0B4 076                        * A6C3A
          BINT25                                 * A6C45
          BINT17                                 * A6C4A
          #       67                             * A6C4F  103
          BINT9                                  * A6C59
          BINT23                                 * A6C5E
          {                                      * A6C63
            BINT9                                * A6C68
            BINT8                                * A6C6D
            BINT6                                * A6C72
            BINT0                                * A6C77
            BINT3                                * A6C7C
          }                                      * A6C81
          BINT4                                  * A6C86
          #       BE12                           * A6C8B  48658
          #       BF0A                           * A6C95  48906
          MINUSONE                               * A6C9F
          MINUSONE                               * A6CA4
          MINUSONE                               * A6CA9
          OBJ_38345                              * A6CAE
          ROMPTR  0B4 077                        * A6CB3
          BINT10                                 * A6CBE
          BINT17                                 * A6CC3
          BINT25                                 * A6CC8
          BINT9                                  * A6CCD
          BINT23                                 * A6CD2
          {                                      * A6CD7
            BINT9                                * A6CDC
            BINT8                                * A6CE1
            BINT6                                * A6CE6
            BINT0                                * A6CEB
            BINT3                                * A6CF0
          }                                      * A6CF5
          BINT4                                  * A6CFA
          #       BE12                           * A6CFF  48658
          #       BF0A                           * A6D09  48906
          MINUSONE                               * A6D13
          MINUSONE                               * A6D18
          MINUSONE                               * A6D1D
          OBJ_38345                              * A6D22
          ROMPTR  0B4 077                        * A6D27
          BINT58                                 * A6D32
          BINT17                                 * A6D37
          BINT25                                 * A6D3C
          BINT9                                  * A6D41
          BINT23                                 * A6D46
          {                                      * A6D4B
            BINT9                                * A6D50
            BINT8                                * A6D55
            BINT6                                * A6D5A
            BINT0                                * A6D5F
            BINT3                                * A6D64
          }                                      * A6D69
          BINT4                                  * A6D6E
          #       BE13                           * A6D73  48659
          #       BF0A                           * A6D7D  48906
          MINUSONE                               * A6D87
          MINUSONE                               * A6D8C
          MINUSONE                               * A6D91
          OBJ_38345                              * A6D96
          ROMPTR  0B4 077                        * A6D9B
          #       6A                             * A6DA6  106
          BINT17                                 * A6DB0
          BINT25                                 * A6DB5
          BINT9                                  * A6DBA
          BINT23                                 * A6DBF
          {                                      * A6DC4
            BINT9                                * A6DC9
            BINT8                                * A6DCE
            BINT6                                * A6DD3
            BINT0                                * A6DD8
            BINT3                                * A6DDD
          }                                      * A6DE2
          BINT4                                  * A6DE7
          #       BE14                           * A6DEC  48660
          #       BF0A                           * A6DF6  48906
          MINUSONE                               * A6E00
          MINUSONE                               * A6E05
          MINUSONE                               * A6E0A
          ROMPTR  0B4 054                        * A6E0F
          OBJ_38345                              * A6E1A
          ROMPTR  0B4 067                        * A6E1F
          BINT58                                 * A6E2A
          BINT26                                 * A6E2F
          BINT25                                 * A6E34
          BINT9                                  * A6E39
          BINT1                                  * A6E3E
          {                                      * A6E43
            BINT0                                * A6E48
          }                                      * A6E4D
          BINT4                                  * A6E52
          #       BF1D                           * A6E57  48925
          MINUSONE                               * A6E61
          MINUSONE                               * A6E66
          %0_2A2B4                               * A6E6B
          MINUSONE                               * A6E70
          OBJ_38345                              * A6E75
          ROMPTR  0B4 067                        * A6E7A
          #       6A                             * A6E85  106
          BINT26                                 * A6E8F
          BINT25                                 * A6E94
          BINT9                                  * A6E99
          BINT1                                  * A6E9E
          {                                      * A6EA3
            BINT0                                * A6EA8
          }                                      * A6EAD
          BINT4                                  * A6EB2
          #       BF1E                           * A6EB7  48926
          MINUSONE                               * A6EC1
          MINUSONE                               * A6EC6
          %       6.5E0                          * A6ECB
          MINUSONE                               * A6EE0
          OBJ_38345                              * A6EE5
          ROMPTR  0B4 067                        * A6EEA
          BINT25                                 * A6EF5
          BINT35                                 * A6EFA
          BINT13                                 * A6EFF
          BINT9                                  * A6F04
          BINT1                                  * A6F09
          {                                      * A6F0E
            BINT6                                * A6F13
          }                                      * A6F18
          BINT4                                  * A6F1D
          #       BF1F                           * A6F22  48927
          MINUSONE                               * A6F2C
          MINUSONE                               * A6F31
          '                                      * A6F36
          ID      Y                              * A6F3B
          MINUSONE                               * A6F44
          OBJ_38345                              * A6F49
          ROMPTR  0B4 067                        * A6F4E
          BINT58                                 * A6F59
          BINT35                                 * A6F5E
          BINT25                                 * A6F63
          BINT9                                  * A6F68
          BINT1                                  * A6F6D
          {                                      * A6F72
            BINT0                                * A6F77
            BINT3                                * A6F7C
          }                                      * A6F81
          BINT4                                  * A6F86
          #       BF20                           * A6F8B  48928
          MINUSONE                               * A6F95
          MINUSONE                               * A6F9A
          %0_2A2B4                               * A6F9F
          MINUSONE                               * A6FA4
          OBJ_38345                              * A6FA9
          ROMPTR  0B4 079                        * A6FAE
          BINT85                                 * A6FB9
          BINT35                                 * A6FBE
          BINT6                                  * A6FC3
          BINT9                                  * A6FC8
          BINT32                                 * A6FCD
          MINUSONE                               * A6FD2
          MINUSONE                               * A6FD7
          #       BE15                           * A6FDC  48661
          MINUSONE                               * A6FE6
          MINUSONE                               * A6FEB
          FALSE                                  * A6FF0
          MINUSONE                               * A6FF5
          BINT11                                 * A6FFA
          BINT12                                 * A6FFF
          OBJ_38345                              * A7004
          ROMPTR  0B4 074                        * A7009
          #       BE11                           * A7014  48657

* ROMPTR 0B4 072
* refs (1): A2437
ROMP_0B4_072:
          ::                                     * A701E
            ROMPTR  0B5 13A                      * A7023
            ROMPTR  0B5 02A                      * A702E
            ROMPTR  0B5 02C                      * A7039
            CHECKPVARS                           * A7044
            INCOMPDROP                           * A7049
            OBJ_37B03                            * A704E
            4ROLLDROP                            * A7053
            4ROLLDROP                            * A7058
            3UNROLL                              * A705D
            ROMPTR  0B5 04F                      * A7062
            8UNROLL                              * A706D
            DUP                                  * A7072
            1get(li)?                            * A7077
            3UNROLL                              * A707C
            ROMPTR  0B5 032                      * A7081
            ROT                                  * A708C
            DUP                                  * A7091
            1get(li)?                            * A7096
            SWAP                                 * A709B
            ROMPTR  0B5 064                      * A70A0
            6PICK                                * A70AB
            MINUSONE                             * A70B0
            EQUAL                                * A70B5
            NOT                                  * A70BA
          ;                                      * A70BF
          BINT12                                 * A70C4
          ROMPTR  0B0 0AA                        * A70C9
        ;                                        * A70D4

* ROMPTR 0B4 073
* refs (1): A2437
ROMP_0B4_073:
        ::                                       * A70D9
          6UNROLL                                * A70DE
          ROMPTR  0B5 065                        * A70E3
          ROMPTR  0B5 039                        * A70EE
          ROMPTR  0B5 035                        * A70F9
          ROMPTR  0B5 02F                        * A7104
          ITE                                    * A710F
          ::                                     * A7114
            ROMPTR  0B5 02D                      * A7119
            DROP                                 * A7124
          ;                                      * A7129
          ::                                     * A712E
            3DROP                                * A7133
            ROMPTR  0B5 029                      * A7138
          ;                                      * A7143
          ROMPTR  0B0 09D                        * A7148
          ROMPTR  0B0 09C                        * A7153
          FALSE                                  * A715E
          FALSE                                  * A7163
        ;                                        * A7168

* ROMPTR 0B4 074
* refs (1): A2437
ROMP_0B4_074:
        ::                                       * A716D
          {                                      * A7172
            BINT5                                * A7177
            ROMPTR  0B4 075                      * A717C
            BINT14                               * A7187
            ::                                   * A718C
              ROMPTR  0B4 07C                    * A7191
              ITE                                * A719C
              BINT4                              * A71A1
              BINT3                              * A71A6
              ROMPTR  0B4 0E5                    * A71AB
            ;                                    * A71B6
            BINT56                               * A71BB
            ::                                   * A71C0
              14GETLAM                           * A71C5
              SWAP                               * A71CA
            ;                                    * A71CF
          }                                      * A71D4
          EQLookup                               * A71D9
          case                                   * A71DE
          ::                                     * A71E3
            EVAL                                 * A71E8
            TRUE                                 * A71ED
          ;                                      * A71F2
          ROMPTR  0B4 05C                        * A71F7
        ;                                        * A7202

* ROMPTR 0B4 075
* refs (1): A2437
ROMP_0B4_075:
        ::                                       * A7207
          BINT39                                 * A720C
          BINT131                                * A7211
          MAKEGROB                               * A7216
          BINT10                                 * A721B
          ONE_DO                                 * A7220
          INDEX@                                 * A7225
          ROMPTR  0B0 012                        * A722A
          LOOP                                   * A7235
          ROMPTR  0B4 07C                        * A723A
          NOTcaseFALSE                           * A7245
          BINT12                                 * A724A
          BINT10                                 * A724F
          DO                                     * A7254
          INDEX@                                 * A7259
          ROMPTR  0B0 012                        * A725E
          LOOP                                   * A7269
          FALSE                                  * A726E
        ;                                        * A7273

* ROMPTR 0B4 076
* refs (1): A2437
ROMP_0B4_076:
        ::                                       * A7278
          BINT7                                  * A727D
          #=casedrop                             * A7282
          ROMPTR  0B4 07C                        * A7287
          BINT55                                 * A7292
          OVER                                   * A7297
          #<>case                                * A729C
          ROMPTR  0B4 078                        * A72A1
          DROP                                   * A72AC
          ROMPTR  0B4 07C                        * A72B1
          NOT                                    * A72BC
          TRUE                                   * A72C1
        ;                                        * A72C6

* ROMPTR 0B4 077
* refs (1): A2437
ROMP_0B4_077:
        ::                                       * A72CB
          BINT7                                  * A72D0
          #=casedrop                             * A72D5
          ::                                     * A72DA
            ROMPTR  0B4 07C                      * A72DF
            NOT                                  * A72EA
          ;                                      * A72EF
          BINT55                                 * A72F4
          OVER                                   * A72F9
          #<>case                                * A72FE
          ROMPTR  0B4 078                        * A7303
          DROP                                   * A730E
          ROMPTR  0B4 07C                        * A7313
          TRUE                                   * A731E
        ;                                        * A7323

* ROMPTR 0B4 078
* refs (1): A2437
ROMP_0B4_078:
        ::                                       * A7328
          BINT43                                 * A732D
          OVER                                   * A7332
          #<>case                                * A7337
          ROMPTR  0B4 067                        * A733C
          DROP                                   * A7347
          BINT7                                  * A734C
          BINT10                                 * A7351
          ROMPTR  0B4 0EB                        * A7356
          TrueTrue                               * A7361
        ;                                        * A7366

* ROMPTR 0B4 079
* refs (1): A2437
ROMP_0B4_079:
        ::                                       * A736B
          BINT47                                 * A7370
          OVER                                   * A7375
          #<>case                                * A737A
          ROMPTR  0B4 067                        * A737F
          DROP                                   * A738A
          ROMPTR  0B4 07A                        * A738F
          ROMPTR  0B4 07B                        * A739A
          TRUE                                   * A73A5
        ;                                        * A73AA

* ROMPTR 0B4 07A
* refs (1): A2437
ROMP_0B4_07A:
        ::                                       * A73AF
          ROMPTR  0B4 07C                        * A73B4
          DUP                                    * A73BF
          ITE                                    * A73C4
          BINT3                                  * A73C9
          BINT4                                  * A73CE
          ROMPTR  0B0 0C5                        * A73D3  ~gFldVal
          SWAP                                   * A73DE
          ITE                                    * A73E3
          BINT4                                  * A73E8
          BINT3                                  * A73ED
          ROMPTR  0B0 0D5                        * A73F2  ~sFldVal
        ;                                        * A73FD

* ROMPTR 0B4 07B
* refs (1): A2437
ROMP_0B4_07B:
        ::                                       * A7402
          ROMPTR  0B4 07C                        * A7407
          ITE                                    * A7412
          ::                                     * A7417
            BINT7                                * A741C
            BINT4                                * A7421
            BINT12                               * A7426
            BINT9                                * A742B
          ;                                      * A7430
          ::                                     * A7435
            BINT4                                * A743A
            BINT3                                * A743F
            BINT10                               * A7444
            BINT9                                * A7449
          ;                                      * A744E
          HARDBUFF                               * A7453
          3UNROLL                                * A7458
          BINT17                                 * A745D
          BINT9                                  * A7462
          BLANKIT                                * A7467
          DO                                     * A746C
          INDEX@                                 * A7471
          ROMPTR  0B0 012                        * A7476
          LOOP                                   * A7481
          DROP                                   * A7486
          DO                                     * A748B
          INDEX@                                 * A7490
          ROMPTR  0B0 0A2                        * A7495
          LOOP                                   * A74A0
        ;                                        * A74A5

* ROMPTR 0B4 07C
* refs (1): A2437
ROMP_0B4_07C:
        ::                                       * A74AA
          BINT12                                 * A74AF
          ROMPTR  0B0 0C5                        * A74B4  ~gFldVal
        ;                                        * A74BF

* ROMPTR 0B4 07D
* refs (1): A2437
ROMP_0B4_07D:
        ::                                       * A74C4

* ROMPTR 0B4 07E
* refs (1): A2437
ROMP_0B4_07E:
          ::                                     * A74C9
            ROMPTR  0B4 04A                      * A74CE

* ROMPTR 0B4 07F
* refs (1): A2437
ROMP_0B4_07F:
            ::                                   * A74D9
              #       BE16                       * A74DE  48662
              BINT1                              * A74E8
              BINT19                             * A74ED
            ;                                    * A74F2
            #       BE17                         * A74F7  48663
            BINT91                               * A7501
            BINT19                               * A7506
            #       BE18                         * A750B  48664
            BINT1                                * A7515
            BINT28                               * A751A
            ROMPTR  0B4 04E                      * A751F
            ROMPTR  0B4 04F                      * A752A
            ROMPTR  0B4 050                      * A7535
          ;                                      * A7540
          ROMPTR  0B4 051                        * A7545

* ROMPTR 0B4 080
* refs (1): A2437
ROMP_0B4_080:
          ::                                     * A7550
            OBJ_38345                            * A7555
            ROMPTR  0B4 085                      * A755A
            BINT25                               * A7565
            BINT17                               * A756A
            BINT61                               * A756F
            BINT9                                * A7574
            BINT21                               * A7579
            {                                    * A757E
              BINT3                              * A7583
            }                                    * A7588
            BINT4                                * A758D
            #       BE19                         * A7592  48665
            #       BE1A                         * A759C  48666
            MINUSONE                             * A75A6
            MINUSONE                             * A75AB
            MINUSONE                             * A75B0
          ;                                      * A75B5

* ROMPTR 0B4 081
* refs (1): A2437
ROMP_0B4_081:
          ::                                     * A75BA
            OBJ_38345                            * A75BF
            ROMPTR  0B4 067                      * A75C4
            #       6A                           * A75CF  106
            BINT17                               * A75D9
            BINT13                               * A75DE
            BINT9                                * A75E3
            BINT1                                * A75E8
            {                                    * A75ED
              BINT0                              * A75F2
            }                                    * A75F7
            BINT4                                * A75FC
            #       BE1B                         * A7601  48667
            MINUSONE                             * A760B
            MINUSONE                             * A7610
            %1                                   * A7615
            MINUSONE                             * A761A
          ;                                      * A761F
          OBJ_38345                              * A7624
          ROMPTR  0B4 086                        * A7629
          BINT19                                 * A7634
          BINT26                                 * A7639
          BINT25                                 * A763E
          BINT9                                  * A7643
          BINT1                                  * A7648
          {                                      * A764D
            BINT0                                * A7652
          }                                      * A7657
          OBJ_38345                              * A765C
          ROMPTR  0B4 0E0                        * A7661
          #       BE1C                           * A766C  48668
          MINUSONE                               * A7676
          MINUSONE                               * A767B
          BINT0                                  * A7680
          MINUSONE                               * A7685
          ROMPTR  0B4 055                        * A768A
          ROMPTR  0B4 056                        * A7695
          ROMPTR  0B4 057                        * A76A0
          ROMPTR  0B4 058                        * A76AB
          ROMPTR  0B4 059                        * A76B6
          BINT7                                  * A76C1
          BINT9                                  * A76C6
          OBJ_38345                              * A76CB
          ROMPTR  0B4 084                        * A76D0
          #       BE01                           * A76DB  48641

* ROMPTR 0B4 082
* refs (1): A2437
ROMP_0B4_082:
          ::                                     * A76E5
            ROMPTR  0B5 049                      * A76EA
            STATGETXCOL                          * A76F5
            CHECKPVARS                           * A76FA
            INCOMPDROP                           * A76FF
            DROP                                 * A7704
            ROMPTR  0B5 04F                      * A7709
            8UNROLL                              * A7714
            DROP                                 * A7719
            ROMPTR  0B5 03E                      * A771E
            DROP                                 * A7729
            4UNROLL                              * A772E
            DROP                                 * A7733
            C%>%                                 * A7738
            ROT                                  * A773D
            C%>%                                 * A7742
            3UNROLL                              * A7747
            4UNROLL                              * A774C
            FALSE                                * A7751
            3UNROLL                              * A7756
          ;                                      * A775B
          BINT9                                  * A7760
          ROMPTR  0B0 0AA                        * A7765
        ;                                        * A7770

* ROMPTR 0B4 083
* refs (1): A2437
ROMP_0B4_083:
        ::                                       * A7775
          yrng(2r)                               * A777A
          7UNROLL                                * A777F
          xrng(2r)                               * A7784
          ROMPTR  0B5 045                        * A7789
          STATXCOL                               * A7794
          ROMPTR  0B5 04A                        * A7799
          ROMPTR  0B0 09C                        * A77A4
          FALSE                                  * A77AF
          SWAP                                   * A77B4
        ;                                        * A77B9

* ROMPTR 0B4 084
* refs (1): A2437
ROMP_0B4_084:
        ::                                       * A77BE
          {                                      * A77C3
            BINT16                               * A77C8
            ::                                   * A77CD
              ROMPTR  0B4 05D                    * A77D2
              TRUE                               * A77DD
            ;                                    * A77E2
            BINT14                               * A77E7
            ::                                   * A77EC
              BINT2                              * A77F1
              ROMPTR  0B4 0E5                    * A77F6
            ;                                    * A7801
            BINT56                               * A7806
            ::                                   * A780B
              14GETLAM                           * A7810
              SWAP                               * A7815
            ;                                    * A781A
          }                                      * A781F
          EQLookup                               * A7824
          case                                   * A7829
          ::                                     * A782E
            EVAL                                 * A7833
            TRUE                                 * A7838
          ;                                      * A783D
          DROPFALSE                              * A7842
        ;                                        * A7847

* ROMPTR 0B4 085
* refs (1): A2437
ROMP_0B4_085:
        ::                                       * A784C
          BINT23                                 * A7851
          OVER                                   * A7856
          #<>case                                * A785B
          ROMPTR  0B4 067                        * A7860
          DROP                                   * A786B
          ROMPTR  0B4 032                        * A7870
          TRUE                                   * A787B
        ;                                        * A7880

* ROMPTR 0B4 086
* refs (1): A2437
ROMP_0B4_086:
        ::                                       * A7885
          BINT41                                 * A788A
          OVER                                   * A788F
          #<>case                                * A7894
          ROMPTR  0B4 067                        * A7899
          DROP                                   * A78A4
          ROMPTR  0B4 087                        * A78A9
          TRUE                                   * A78B4
        ;                                        * A78B9

* ROMPTR 0B4 087
* refs (1): A2437
ROMP_0B4_087:
        ::                                       * A78BE
          4GETLAM                                * A78C3
          ROMPTR  0B0 0C5                        * A78C8  ~gFldVal
          DUPTYPEBINT?                           * A78D3
          NOTcase                                * A78D8
          TRUE                                   * A78DD
          DROP                                   * A78E2
          BINT5                                  * A78E7
          ROMPTR  0B0 0C5                        * A78EC  ~gFldVal
          BINT6                                  * A78F7
          ROMPTR  0B0 0C5                        * A78FC  ~gFldVal
          ROMPTR  0B5 047                        * A7907
          TRUE                                   * A7912
        ;                                        * A7917

* ROMPTR 0B4 088
* refs (1): A2437
ROMP_0B4_088:
        ::                                       * A791C
          ROMPTR  0B4 07E                        * A7921
          ROMPTR  0B4 051                        * A792C
          ROMPTR  0B4 080                        * A7937
          ROMPTR  0B4 081                        * A7942
          OBJ_38345                              * A794D
          ROMPTR  0B4 089                        * A7952
          BINT19                                 * A795D
          BINT26                                 * A7962
          BINT25                                 * A7967
          BINT9                                  * A796C
          BINT1                                  * A7971
          {                                      * A7976
            BINT0                                * A797B
          }                                      * A7980
          OBJ_38345                              * A7985
          ROMPTR  0B4 0E0                        * A798A
          #       BE1C                           * A7995  48668
          MINUSONE                               * A799F
          MINUSONE                               * A79A4
          BINT0                                  * A79A9
          MINUSONE                               * A79AE
          ROMPTR  0B4 055                        * A79B3
          ROMPTR  0B4 056                        * A79BE
          ROMPTR  0B4 057                        * A79C9
          ROMPTR  0B4 058                        * A79D4
          ROMPTR  0B4 059                        * A79DF
          BINT7                                  * A79EA
          BINT9                                  * A79EF
          OBJ_38345                              * A79F4
          ROMPTR  0B4 084                        * A79F9
          #       BE01                           * A7A04  48641
          ROMPTR  0B4 082                        * A7A0E
          BINT9                                  * A7A19
          ROMPTR  0B0 0AA                        * A7A1E
        ;                                        * A7A29

* ROMPTR 0B4 089
* refs (1): A2437
ROMP_0B4_089:
        ::                                       * A7A2E
          BINT41                                 * A7A33
          OVER                                   * A7A38
          #<>case                                * A7A3D
          ROMPTR  0B4 067                        * A7A42
          DROP                                   * A7A4D
          ROMPTR  0B4 08A                        * A7A52
          TRUE                                   * A7A5D
        ;                                        * A7A62

* ROMPTR 0B4 08A
* refs (1): A2437
ROMP_0B4_08A:
        ::                                       * A7A67
          4GETLAM                                * A7A6C
          ROMPTR  0B0 0C5                        * A7A71  ~gFldVal
          DUPTYPEBINT?                           * A7A7C
          NOTcase                                * A7A81
          TRUE                                   * A7A86
          DROP                                   * A7A8B
          %1                                     * A7A90
          TRUE                                   * A7A95
        ;                                        * A7A9A

* ROMPTR 0B4 08B
* refs (1): A2437
ROMP_0B4_08B:
        ::                                       * A7A9F
          ROMPTR  0B4 04A                        * A7AA4
          ROMPTR  0B4 07F                        * A7AAF
          #       BE1D                           * A7ABA  48669
          BINT79                                 * A7AC4
          BINT19                                 * A7AC9
          ROMPTR  0B4 04E                        * A7ACE
          ROMPTR  0B4 04F                        * A7AD9
          ROMPTR  0B4 050                        * A7AE4
          ROMPTR  0B4 051                        * A7AEF
          OBJ_38345                              * A7AFA
          ROMPTR  0B4 085                        * A7AFF
          BINT25                                 * A7B0A
          BINT17                                 * A7B0F
          BINT49                                 * A7B14
          BINT9                                  * A7B19
          BINT21                                 * A7B1E
          {                                      * A7B23
            BINT3                                * A7B28
          }                                      * A7B2D
          BINT4                                  * A7B32
          #       BE19                           * A7B37  48665
          #       BE1A                           * A7B41  48666
          MINUSONE                               * A7B4B
          MINUSONE                               * A7B50
          MINUSONE                               * A7B55
          OBJ_38345                              * A7B5A
          ROMPTR  0B4 067                        * A7B5F
          BINT100                                * A7B6A
          BINT17                                 * A7B6F
          BINT13                                 * A7B74
          BINT9                                  * A7B79
          BINT1                                  * A7B7E
          {                                      * A7B83
            BINT0                                * A7B88
          }                                      * A7B8D
          BINT4                                  * A7B92
          #       BE1E                           * A7B97  48670
          MINUSONE                               * A7BA1
          MINUSONE                               * A7BA6
          %1                                     * A7BAB
          MINUSONE                               * A7BB0
          OBJ_38345                              * A7BB5
          ROMPTR  0B4 067                        * A7BBA
          #       76                             * A7BC5  118
          BINT17                                 * A7BCF
          BINT13                                 * A7BD4
          BINT9                                  * A7BD9
          BINT1                                  * A7BDE
          {                                      * A7BE3
            BINT0                                * A7BE8
          }                                      * A7BED
          BINT4                                  * A7BF2
          #       BE1F                           * A7BF7  48671
          MINUSONE                               * A7C01
          MINUSONE                               * A7C06
          %2                                     * A7C0B
          MINUSONE                               * A7C10
          ROMPTR  0B4 055                        * A7C15
          ROMPTR  0B4 056                        * A7C20
          ROMPTR  0B4 057                        * A7C2B
          ROMPTR  0B4 058                        * A7C36
          ROMPTR  0B4 059                        * A7C41
          BINT6                                  * A7C4C
          BINT9                                  * A7C51
          OBJ_38345                              * A7C56
          ROMPTR  0B4 084                        * A7C5B
          #       BE01                           * A7C66  48641

* ROMPTR 0B4 08C
* refs (1): A2437
ROMP_0B4_08C:
          ::                                     * A7C70
            ROMPTR  0B5 049                      * A7C75
            STATGETXCOL                          * A7C80
            STATGETYCOL                          * A7C85
            CHECKPVARS                           * A7C8A
            INCOMPDROP                           * A7C8F
            DROP                                 * A7C94
            4UNROLL3DROP                         * A7C99
            ROMPTR  0B5 04F                      * A7C9E
            6UNROLL                              * A7CA9
            C%>%                                 * A7CAE
            ROT                                  * A7CB3
            C%>%                                 * A7CB8
            3UNROLL                              * A7CBD
            4UNROLL                              * A7CC2
            FALSE                                * A7CC7
            3UNROLL                              * A7CCC
          ;                                      * A7CD1
          BINT9                                  * A7CD6
          ROMPTR  0B0 0AA                        * A7CDB
        ;                                        * A7CE6

* ROMPTR 0B4 08D
* refs (1): A2437
ROMP_0B4_08D:
        ::                                       * A7CEB
          yrng(2r)                               * A7CF0
          7UNROLL                                * A7CF5
          xrng(2r)                               * A7CFA
          STATYCOL                               * A7CFF
          STATXCOL                               * A7D04
          ROMPTR  0B5 04A                        * A7D09
          ROMPTR  0B0 09C                        * A7D14
          FALSE                                  * A7D1F
          SWAP                                   * A7D24
        ;                                        * A7D29

* ROMPTR 0B4 08E
* refs (1): A2437
ROMP_0B4_08E:
        ::                                       * A7D2E

* ROMPTR 0B4 08F
* refs (1): A2437
ROMP_0B4_08F:
          ::                                     * A7D33

* ROMPTR 0B4 090
* refs (1): A2437
ROMP_0B4_090:
            ::                                   * A7D38
              #       BF12                       * A7D3D  48914
              BINT1                              * A7D47
              BINT10                             * A7D4C
            ;                                    * A7D51

* ROMPTR 0B4 091
* refs (1): A2437
ROMP_0B4_091:
            ::                                   * A7D56
              #       BE24                       * A7D5B  48676
              BINT43                             * A7D65
              BINT10                             * A7D6A
            ;                                    * A7D6F

* ROMPTR 0B4 092
* refs (1): A2437
ROMP_0B4_092:
            ::                                   * A7D74
              #       BE25                       * A7D79  48677
              BINT91                             * A7D83
              BINT10                             * A7D88
            ;                                    * A7D8D

* ROMPTR 0B4 093
* refs (1): A2437
ROMP_0B4_093:
            ::                                   * A7D92
              #       BE26                       * A7D97  48678
              BINT8                              * A7DA1
              BINT19                             * A7DA6
            ;                                    * A7DAB

* ROMPTR 0B4 094
* refs (1): A2437
ROMP_0B4_094:
            ::                                   * A7DB0
              #       BE27                       * A7DB5  48679
              BINT98                             * A7DBF
              BINT19                             * A7DC4
            ;                                    * A7DC9

* ROMPTR 0B4 095
* refs (1): A2437
ROMP_0B4_095:
            ::                                   * A7DCE
              #       BE28                       * A7DD3  48680
              BINT50                             * A7DDD
              BINT19                             * A7DE2
            ;                                    * A7DE7

* ROMPTR 0B4 096
* refs (1): A2437
ROMP_0B4_096:
            ::                                   * A7DEC
              #       BF17                       * A7DF1  48919
              BINT1                              * A7DFB
              BINT28                             * A7E00
            ;                                    * A7E05

* ROMPTR 0B4 097
* refs (1): A2437
ROMP_0B4_097:
            ::                                   * A7E0A
              #       BE29                       * A7E0F  48681
              BINT62                             * A7E19
              BINT28                             * A7E1E
            ;                                    * A7E23

* ROMPTR 0B4 098
* refs (1): A2437
ROMP_0B4_098:
            ::                                   * A7E28
              #       BE2A                       * A7E2D  48682
              BINT1                              * A7E37
              BINT37                             * A7E3C
            ;                                    * A7E41

* ROMPTR 0B4 099
* refs (1): A2437
ROMP_0B4_099:
            ::                                   * A7E46
              #       BE2B                       * A7E4B  48683
              BINT49                             * A7E55
              BINT37                             * A7E5A
            ;                                    * A7E5F

* ROMPTR 0B4 09A
* refs (1): A2437
ROMP_0B4_09A:
            ::                                   * A7E64
              #       BE29                       * A7E69  48681
              #       6B                         * A7E73  107
              BINT37                             * A7E7D
            ;                                    * A7E82
          ;                                      * A7E87

* ROMPTR 0B4 09B
* refs (1): A2437
ROMP_0B4_09B:
          ::                                     * A7E8C
            OBJ_38345                            * A7E91
            ROMPTR  0B4 0B0                      * A7E96
            BINT25                               * A7EA1
            BINT8                                * A7EA6
            BINT13                               * A7EAB
            BINT9                                * A7EB0
            BINT1                                * A7EB5
            {                                    * A7EBA
              BINT6                              * A7EBF
            }                                    * A7EC4
            BINT4                                * A7EC9
            #       BF1C                         * A7ECE  48924
            MINUSONE                             * A7ED8
            MINUSONE                             * A7EDD
            'IDX                                 * A7EE2
            MINUSONE                             * A7EE7
          ;                                      * A7EEC

* ROMPTR 0B4 09C
* refs (1): A2437
ROMP_0B4_09C:
          ::                                     * A7EF1
            OBJ_38345                            * A7EF6
            ROMPTR  0B4 0A8                      * A7EFB
            BINT55                               * A7F06
            BINT8                                * A7F0B
            BINT31                               * A7F10
            BINT9                                * A7F15
            BINT1                                * A7F1A
            {                                    * A7F1F
              BINT0                              * A7F24
            }                                    * A7F29
            OBJ_38345                            * A7F2E
            ROMPTR  0B4 0E0                      * A7F33
            #       BE2C                         * A7F3E  48684
            MINUSONE                             * A7F48
            MINUSONE                             * A7F4D
            BINT0                                * A7F52
            MINUSONE                             * A7F57
          ;                                      * A7F5C

* ROMPTR 0B4 09D
* refs (1): A2437
ROMP_0B4_09D:
          ::                                     * A7F61
            OBJ_38345                            * A7F66
            ROMPTR  0B4 0AB                      * A7F6B
            BINT100                              * A7F76
            BINT8                                * A7F7B
            BINT31                               * A7F80
            BINT9                                * A7F85
            BINT1                                * A7F8A
            {                                    * A7F8F
              BINT0                              * A7F94
            }                                    * A7F99
            OBJ_38345                            * A7F9E
            ROMPTR  0B4 0E0                      * A7FA3
            #       BE2D                         * A7FAE  48685
            MINUSONE                             * A7FB8
            MINUSONE                             * A7FBD
            BINT0                                * A7FC2
            MINUSONE                             * A7FC7
          ;                                      * A7FCC

* ROMPTR 0B4 09E
* refs (1): A2437
ROMP_0B4_09E:
          ::                                     * A7FD1
            OBJ_38345                            * A7FD6
            ROMPTR  0B4 0B0                      * A7FDB
            BINT1                                * A7FE6
            BINT17                               * A7FEB
            BINT6                                * A7FF0
            BINT9                                * A7FF5
            BINT32                               * A7FFA
            MINUSONE                             * A7FFF
            MINUSONE                             * A8004
            #       BE2E                         * A8009  48686
            MINUSONE                             * A8013
            MINUSONE                             * A8018
            TRUE                                 * A801D
            MINUSONE                             * A8022
          ;                                      * A8027

* ROMPTR 0B4 09F
* refs (1): A2437
ROMP_0B4_09F:
          ::                                     * A802C
            OBJ_38345                            * A8031
            ROMPTR  0B4 0B0                      * A8036
            BINT43                               * A8041
            BINT17                               * A8046
            BINT6                                * A804B
            BINT9                                * A8050
            BINT32                               * A8055
            MINUSONE                             * A805A
            MINUSONE                             * A805F
            #       BE2F                         * A8064  48687
            MINUSONE                             * A806E
            MINUSONE                             * A8073
            TRUE                                 * A8078
            MINUSONE                             * A807D
          ;                                      * A8082

* ROMPTR 0B4 0A0
* refs (1): A2437
ROMP_0B4_0A0:
          ::                                     * A8087
            OBJ_38345                            * A808C
            ROMPTR  0B4 0B0                      * A8091
            BINT91                               * A809C
            BINT17                               * A80A1
            BINT6                                * A80A6
            BINT9                                * A80AB
            BINT32                               * A80B0
            MINUSONE                             * A80B5
            MINUSONE                             * A80BA
            #       BE30                         * A80BF  48688
            MINUSONE                             * A80C9
            MINUSONE                             * A80CE
            FALSE                                * A80D3
            MINUSONE                             * A80D8
          ;                                      * A80DD

* ROMPTR 0B4 0A1
* refs (1): A2437
ROMP_0B4_0A1:
          ::                                     * A80E2
            OBJ_38345                            * A80E7
            ROMPTR  0B4 0AE                      * A80EC
            BINT25                               * A80F7
            BINT26                               * A80FC
            BINT25                               * A8101
            BINT9                                * A8106
            BINT1                                * A810B
            {                                    * A8110
              BINT0                              * A8115
            }                                    * A811A
            OBJ_38345                            * A811F
            ROMPTR  0B4 0E0                      * A8124
            #       BE31                         * A812F  48689
            MINUSONE                             * A8139
            MINUSONE                             * A813E
            BINT0                                * A8143
            MINUSONE                             * A8148
          ;                                      * A814D

* ROMPTR 0B4 0A2
* refs (1): A2437
ROMP_0B4_0A2:
          ::                                     * A8152
            OBJ_38345                            * A8157
            ROMPTR  0B4 0B0                      * A815C
            BINT55                               * A8167
            BINT26                               * A816C
            BINT6                                * A8171
            BINT9                                * A8176
            BINT32                               * A817B
            MINUSONE                             * A8180
            MINUSONE                             * A8185
            #       BE32                         * A818A  48690
            MINUSONE                             * A8194
            MINUSONE                             * A8199
            FALSE                                * A819E
            MINUSONE                             * A81A3
          ;                                      * A81A8

* ROMPTR 0B4 0A3
* refs (1): A2437
ROMP_0B4_0A3:
          ::                                     * A81AD
            OBJ_38345                            * A81B2
            ROMPTR  0B4 0B0                      * A81B7
            BINT28                               * A81C2
            BINT35                               * A81C7
            BINT13                               * A81CC
            BINT9                                * A81D1
            BINT1                                * A81D6
            {                                    * A81DB
              BINT0                              * A81E0
            }                                    * A81E5
            BINT4                                * A81EA
            #       BE33                         * A81EF  48691
            MINUSONE                             * A81F9
            MINUSONE                             * A81FE
            %10                                  * A8203
            MINUSONE                             * A8208
          ;                                      * A820D

* ROMPTR 0B4 0A4
* refs (1): A2437
ROMP_0B4_0A4:
          ::                                     * A8212
            OBJ_38345                            * A8217
            ROMPTR  0B4 0B0                      * A821C
            #       4C                           * A8227  76
            BINT35                               * A8231
            BINT13                               * A8236
            BINT9                                * A823B
            BINT1                                * A8240
            {                                    * A8245
              BINT0                              * A824A
            }                                    * A824F
            BINT4                                * A8254
            #       BE34                         * A8259  48692
            MINUSONE                             * A8263
            MINUSONE                             * A8268
            %10                                  * A826D
            MINUSONE                             * A8272
          ;                                      * A8277

* ROMPTR 0B4 0A5
* refs (1): A2437
ROMP_0B4_0A5:
          ::                                     * A827C
            OBJ_38345                            * A8281
            ROMPTR  0B4 0B0                      * A8286
            BINT100                              * A8291
            BINT35                               * A8296
            BINT6                                * A829B
            BINT9                                * A82A0
            BINT32                               * A82A5
            MINUSONE                             * A82AA
            MINUSONE                             * A82AF
            #       BE35                         * A82B4  48693
            MINUSONE                             * A82BE
            MINUSONE                             * A82C3
            TRUE                                 * A82C8
            MINUSONE                             * A82CD
          ;                                      * A82D2
          BINT11                                 * A82D7
          DUP                                    * A82DC
          'DROPFALSE                             * A82E1
          #       BE23                           * A82E6  48675

* ROMPTR 0B4 0A6
* refs (1): A2437
ROMP_0B4_0A6:
          ::                                     * A82F0
            ROMPTR  0B5 070                      * A82F5
            ROMPTR  0B5 060                      * A8300
            ROMPTR  0B5 062                      * A830B
            CHECKPVARS                           * A8316
            INCOMPDROP                           * A831B
            2DROP                                * A8320
            5UNROLL                              * A8325
            OBJ_37B03                            * A832A
            SWAPDUP                              * A832F
            1get(li)?                            * A8334
            7UNROLL                              * A8339
            ROMPTR  0B5 030                      * A833E
            7UNROLL                              * A8349
            7UNROLL                              * A834E
            ROMPTR  0B5 03E                      * A8353
            ROT                                  * A835E
            ROMPTR  0B5 06A                      * A8363
          ;                                      * A836E
          BINT11                                 * A8373
          ROMPTR  0B0 0AA                        * A8378
        ;                                        * A8383

* ROMPTR 0B4 0A7
* refs (1): A2437
ROMP_0B4_0A7:
        ::                                       * A8388
          ROMPTR  0B5 06B                        * A838D
          ROMPTR  0B5 03F                        * A8398
          ROMPTR  0B5 063                        * A83A3
          ROMPTR  0B5 061                        * A83AE
          ROMPTR  0B5 071                        * A83B9
          ROMPTR  0B5 033                        * A83C4
          ROMPTR  0B5 02F                        * A83CF
        ;                                        * A83DA

* ROMPTR 0B4 0A8
* refs (1): A2437
ROMP_0B4_0A8:
        ::                                       * A83DF
          {                                      * A83E4
            BINT41                               * A83E9
            ROMPTR  0B4 0A9                      * A83EE
            BINT47                               * A83F9
            ROMPTR  0B4 0AA                      * A83FE
          }                                      * A8409
          EQLookup                               * A840E
          case                                   * A8413
          ::                                     * A8418
            EVAL                                 * A841D
            TRUE                                 * A8422
          ;                                      * A8427
          ROMPTR  0B4 0B0                        * A842C
        ;                                        * A8437

* ROMPTR 0B4 0A9
* refs (1): A2437
ROMP_0B4_0A9:
        ::                                       * A843C
          4GETLAM                                * A8441
          ROMPTR  0B0 0C5                        * A8446  ~gFldVal
          DUPTYPEBINT?                           * A8451
          NOTcase                                * A8456
          TRUE                                   * A845B
          DROP                                   * A8460
          ROMPTR  0B5 036                        * A8465
          DROP                                   * A8470
          TRUE                                   * A8475
        ;                                        * A847A

* ROMPTR 0B4 0AA
* refs (1): A2437
ROMP_0B4_0AA:
        ::                                       * A847F
          4GETLAM                                * A8484
          DUP                                    * A8489
          ROMPTR  0B0 0C5                        * A848E  ~gFldVal
          TYPEBINT?                              * A8499
          case                                   * A849E
          ::                                     * A84A3
            #1+                                  * A84A8
            BINT0                                * A84AD
            OVER                                 * A84B2
            ROMPTR  0B0 0D5                      * A84B7  ~sFldVal
            ROMPTR  0B0 0A2                      * A84C2
          ;                                      * A84CD
          #1+                                    * A84D2
          DUP                                    * A84D7
          ROMPTR  0B0 0C5                        * A84DC  ~gFldVal
          TYPEBINT?                              * A84E7
          NOTcaseDROP                            * A84EC
          ROMPTR  0B5 036                        * A84F1
          SWAPDROP                               * A84FC
          OVER                                   * A8501
          ROMPTR  0B0 0D5                        * A8506  ~sFldVal
          ROMPTR  0B0 0A2                        * A8511
        ;                                        * A851C
