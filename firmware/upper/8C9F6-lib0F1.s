* HP 48GX ROM revision R, #8C9F6-#8D27B: Library part 0F1
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: TRUTH SCATTER POLAR_8C9FD PARAMETRIC HISTOGRAM BAR
* Follows on from the previous file (at #8C9F6 in the original ROM).

* ROMPTR 0F1 035 POLAR
* refs (1): 8999A
        CON(1)  12                               * 8C9F6  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8C9F7  library
        CON(3)  #035                             * 8C9FA  command
        RPL
POLAR_8C9FD:
        ::                                       * 8C9FD
          CK0                                    * 8CA02
          'IDPOLAR                               * 8CA07
          PUTPTYPE                               * 8CA0C
        ;                                        * 8CA11

        {                                        * 8CA16
          FALSE                                  * 8CA1B
          OBJ_4BA0D                              * 8CA20
          NOP                                    * 8CA25
          TRUE                                   * 8CA2A
          {                                      * 8CA2F
            OBJ_47116                            * 8CA34
            OBJ_0C622                            * 8CA39
            OBJ_737F1                            * 8CA3E
            {                                    * 8CA43
              OBJ_73DE8                          * 8CA48
              OBJ_73A8F                          * 8CA4D
            }                                    * 8CA52
            ::                                   * 8CA57
              BINT25                             * 8CA5C
              GETLAM                             * 8CA61
              PTR     NULL::                     * 8CA66
              EQUALcasedrop                      * 8CA6B
              Message60E                         * 8CA70
              15GETLAM                           * 8CA75
              SWAP                               * 8CA7A
              %>C%                               * 8CA7F
            ;                                    * 8CA84
          }                                      * 8CA89
          FALSE                                  * 8CA8E
          OBJ_4B6C5                              * 8CA93
          ::                                     * 8CA98
            BINT31                               * 8CA9D
            TestSysFlag                          * 8CAA2
            ITE                                  * 8CAA7
            ::                                   * 8CAAC
              '                                  * 8CAB1
              OBJ_4CE0B                          * 8CAB6
            ;                                    * 8CABB
            ::                                   * 8CAC0
              '                                  * 8CAC5
              OBJ_4C34B                          * 8CACA
            ;                                    * 8CACF
          ;                                      * 8CAD4
          ::                                     * 8CAD9
            RAD?                                 * 8CADE
            ITE                                  * 8CAE3
            %       3.49065850399E-2             * 8CAE8
            %2                                   * 8CAFD
          ;                                      * 8CB02
          FALSE                                  * 8CB07
          FALSE                                  * 8CB0C
          FALSE                                  * 8CB11
          OBJ_73211                              * 8CB16
          OBJ_73270                              * 8CB1B
          ROMPTR  0F1 03F                        * 8CB20
          OBJ_73526                              * 8CB2B
          OBJ_48DCE                              * 8CB30
        }                                        * 8CB35

* ROMPTR 0F1 036
* refs (1): 8999A
        CON(1)  12                               * 8CB3A  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CB3B  library
        CON(3)  #036                             * 8CB3E  command
PARAMETRIC:
        ::                                       * 8CB41
          CK0                                    * 8CB46
          'IDPARAMETER                           * 8CB4B
          PUTPTYPE                               * 8CB50
        ;                                        * 8CB55

        {                                        * 8CB5A
          FALSE                                  * 8CB5F
          OBJ_4BE9F                              * 8CB64
          NOP                                    * 8CB69
          TRUE                                   * 8CB6E
          {                                      * 8CB73
            OBJ_47170                            * 8CB78
            OBJ_0C6BD                            * 8CB7D
            OBJ_737F1                            * 8CB82
            {                                    * 8CB87
              OBJ_73D84                          * 8CB8C
              OBJ_73A35                          * 8CB91
            }                                    * 8CB96
            ::                                   * 8CB9B
              BINT25                             * 8CBA0
              GETLAM                             * 8CBA5
              PTR     NULL::                     * 8CBAA
              EQUALcasedrop                      * 8CBAF
              Message60E                         * 8CBB4
              15GETLAM                           * 8CBB9
              SWAP                               * 8CBBE
              TWO{}N                             * 8CBC3
            ;                                    * 8CBC8
          }                                      * 8CBCD
          FALSE                                  * 8CBD2
          OBJ_4B6C5                              * 8CBD7
          ::                                     * 8CBDC
            BINT31                               * 8CBE1
            TestSysFlag                          * 8CBE6
            ITE                                  * 8CBEB
            ::                                   * 8CBF0
              '                                  * 8CBF5
              OBJ_4CE0B                          * 8CBFA
            ;                                    * 8CBFF
            ::                                   * 8CC04
              '                                  * 8CC09
              OBJ_4C34B                          * 8CC0E
            ;                                    * 8CC13
          ;                                      * 8CC18
          ::                                     * 8CC1D
            16GETLAM                             * 8CC22
            15GETLAM                             * 8CC27
            %-                                   * 8CC2C
            BINT130                              * 8CC31
            UNCOERCE                             * 8CC36
            %/                                   * 8CC3B
          ;                                      * 8CC40
          FALSE                                  * 8CC45
          FALSE                                  * 8CC4A
          FALSE                                  * 8CC4F
          OBJ_73211                              * 8CC54
          OBJ_73270                              * 8CC59
          ROMPTR  0F1 03F                        * 8CC5E
          OBJ_73526                              * 8CC69
          OBJ_48DCE                              * 8CC6E
        }                                        * 8CC73

* ROMPTR 0F1 037
* refs (1): 8999A
        CON(1)  12                               * 8CC78  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CC79  library
        CON(3)  #037                             * 8CC7C  command
TRUTH:
        ::                                       * 8CC7F
          CK0                                    * 8CC84
          'IDTRUTH                               * 8CC89
          PUTPTYPE                               * 8CC8E
        ;                                        * 8CC93

        {                                        * 8CC98
          FALSE                                  * 8CC9D
          OBJ_4C4B8                              * 8CCA2
          NOP                                    * 8CCA7
          TRUE                                   * 8CCAC
          NULL{}                                 * 8CCB1
          FALSE                                  * 8CCB6
          OBJ_4B6C5                              * 8CCBB
          ::                                     * 8CCC0
            BINT31                               * 8CCC5
            TestSysFlag                          * 8CCCA
            ITE                                  * 8CCCF
            ::                                   * 8CCD4
              '                                  * 8CCD9
              OBJ_4CE0B                          * 8CCDE
            ;                                    * 8CCE3
            ::                                   * 8CCE8
              '                                  * 8CCED
              OBJ_4C34B                          * 8CCF2
            ;                                    * 8CCF7
          ;                                      * 8CCFC
          ::                                     * 8CD01
            %%1                                  * 8CD06
            10GETLAM                             * 8CD0B
            %%/>%                                * 8CD10
          ;                                      * 8CD15
          FALSE                                  * 8CD1A
          TRUE                                   * 8CD1F
          TRUE                                   * 8CD24
          OBJ_73211                              * 8CD29
          OBJ_73270                              * 8CD2E
          ROMPTR  0F1 03F                        * 8CD33
          OBJ_73594                              * 8CD3E
          NOP                                    * 8CD43
        }                                        * 8CD48

* ROMPTR 0F1 038
* refs (1): 8999A
        CON(1)  12                               * 8CD4D  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CD4E  library
        CON(3)  #038                             * 8CD51  command
SCATTER:
        ::                                       * 8CD54
          CK0                                    * 8CD59
          'IDSCATTER                             * 8CD5E
          PUTPTYPE                               * 8CD63
        ;                                        * 8CD68

        {                                        * 8CD6D
          FALSE                                  * 8CD72
          ::                                     * 8CD77
            DROP                                 * 8CD7C
            OBJ_4C8D1                            * 8CD81
          ;                                      * 8CD86
          NOP                                    * 8CD8B
          TRUE                                   * 8CD90
          NULL{}                                 * 8CD95
          TRUE                                   * 8CD9A
          OBJ_4B6C5                              * 8CD9F
          ::                                     * 8CDA4
            BINT31                               * 8CDA9
            TestSysFlag                          * 8CDAE
            ITE                                  * 8CDB3
            ::                                   * 8CDB8
              '                                  * 8CDBD
              OBJ_4CE0B                          * 8CDC2
            ;                                    * 8CDC7
            ::                                   * 8CDCC
              '                                  * 8CDD1
              OBJ_4C34B                          * 8CDD6
            ;                                    * 8CDDB
          ;                                      * 8CDE0
          ::                                     * 8CDE5
            %%1                                  * 8CDEA
            10GETLAM                             * 8CDEF
            %%/>%                                * 8CDF4
          ;                                      * 8CDF9
          TRUE                                   * 8CDFE
          FALSE                                  * 8CE03
          FALSE                                  * 8CE08
          OBJ_73211                              * 8CE0D
          OBJ_73270                              * 8CE12
          ROMPTR  0F1 03F                        * 8CE17
          OBJ_7355D                              * 8CE22
          OBJ_48E28                              * 8CE27
        }                                        * 8CE2C

* ROMPTR 0F1 039
* refs (1): 8999A
        CON(1)  12                               * 8CE31  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CE32  library
        CON(3)  #039                             * 8CE35  command
HISTOGRAM:
        ::                                       * 8CE38
          CK0                                    * 8CE3D
          'IDHISTOGRAM                           * 8CE42
          PUTPTYPE                               * 8CE47
        ;                                        * 8CE4C

        {                                        * 8CE51
          FALSE                                  * 8CE56
          ::                                     * 8CE5B
            DROP                                 * 8CE60
            OBJ_4D993                            * 8CE65
          ;                                      * 8CE6A
          NOP                                    * 8CE6F
          TRUE                                   * 8CE74
          NULL{}                                 * 8CE79
          FALSE                                  * 8CE7E
          OBJ_4B6C5                              * 8CE83
          ::                                     * 8CE88
            BINT31                               * 8CE8D
            TestSysFlag                          * 8CE92
            ITE                                  * 8CE97
            ::                                   * 8CE9C
              '                                  * 8CEA1
              OBJ_4CE0B                          * 8CEA6
            ;                                    * 8CEAB
            ::                                   * 8CEB0
              '                                  * 8CEB5
              OBJ_4C34B                          * 8CEBA
            ;                                    * 8CEBF
          ;                                      * 8CEC4
          ::                                     * 8CEC9
            16GETLAM                             * 8CECE
            15GETLAM                             * 8CED3
            %-                                   * 8CED8
            %13                                  * 8CEDD
            %/                                   * 8CEE2
          ;                                      * 8CEE7
          FALSE                                  * 8CEEC
          FALSE                                  * 8CEF1
          FALSE                                  * 8CEF6
          OBJ_73211                              * 8CEFB
          OBJ_73270                              * 8CF00
          ROMPTR  0F1 03F                        * 8CF05
          OBJ_73594                              * 8CF10
          OBJ_48E8C                              * 8CF15
        }                                        * 8CF1A

* ROMPTR 0F1 03A
* refs (1): 8999A
        CON(1)  12                               * 8CF1F  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CF20  library
        CON(3)  #03A                             * 8CF23  command
BAR:
        ::                                       * 8CF26
          CK0                                    * 8CF2B
          'IDBAR                                 * 8CF30
          PUTPTYPE                               * 8CF35
        ;                                        * 8CF3A

        {                                        * 8CF3F
          FALSE                                  * 8CF44
          ::                                     * 8CF49
            DROP                                 * 8CF4E
            OBJ_4D9CF                            * 8CF53
          ;                                      * 8CF58
          NOP                                    * 8CF5D
          TRUE                                   * 8CF62
          NULL{}                                 * 8CF67
          FALSE                                  * 8CF6C
          OBJ_4B6C5                              * 8CF71
          ::                                     * 8CF76
            BINT31                               * 8CF7B
            TestSysFlag                          * 8CF80
            ITE                                  * 8CF85
            ::                                   * 8CF8A
              '                                  * 8CF8F
              OBJ_4CE0B                          * 8CF94
            ;                                    * 8CF99
            ::                                   * 8CF9E
              '                                  * 8CFA3
              OBJ_4C34B                          * 8CFA8
            ;                                    * 8CFAD
          ;                                      * 8CFB2
          %1                                     * 8CFB7
          FALSE                                  * 8CFBC
          FALSE                                  * 8CFC1
          FALSE                                  * 8CFC6
          OBJ_73211                              * 8CFCB
          OBJ_73270                              * 8CFD0
          ROMPTR  0F1 03F                        * 8CFD5
          OBJ_73594                              * 8CFE0
          OBJ_48ECD                              * 8CFE5
        }                                        * 8CFEA

* ROMPTR 0F1 03B
* refs (1): 8999A
ROMP_0F1_03B:
        ::                                       * 8CFEF
          SWAP                                   * 8CFF4
          OBJ_2708E                              * 8CFF9
          NOTcasedrop                            * 8CFFE
          DROPFALSE                              * 8D003
          SWAP                                   * 8D008
          NTHELCOMP                              * 8D00D
        ;                                        * 8D012

* ROMPTR 0F1 03C
* refs (1): 8999A
ROMP_0F1_03C:
        ::                                       * 8D017
          SWAPINCOMP                             * 8D01C
          DUP                                    * 8D021
          #1=case                                * 8D026
          OBJ_4B392                              * 8D02B
          DUPTWO                                 * 8D030
          #=case                                 * 8D035
          OBJ_4B3E2                              * 8D03A
          #3=                                    * 8D03F
          NcaseTYPEERR                           * 8D044
          DUPTYPEREAL?                           * 8D049
          3PICK                                  * 8D04E
          TYPEREAL?                              * 8D053
          DUP                                    * 8D058
          ?SKIP                                  * 8D05D
          ::                                     * 8D062
            DROP                                 * 8D067
            5PICK                                * 8D06C
            BINT7                                * 8D071
            #=                                   * 8D076
            NcaseTYPEERR                         * 8D07B
            3PICK                                * 8D080
            DUPTYPEARRY?                         * 8D085
            NcaseTYPEERR                         * 8D08A
            DIMLIMITS                            * 8D08F
            LENCOMP                              * 8D094
            #1=                                  * 8D099
            NcaseTYPEERR                         * 8D09E
            BINT1                                * 8D0A3
            4PICK                                * 8D0A8
            GETATELN                             * 8D0AD
            DROP                                 * 8D0B2
            TYPEREAL?                            * 8D0B7
          ;                                      * 8D0BC
          5PICK                                  * 8D0C1
          TYPEIDNT?                              * 8D0C6
          AND                                    * 8D0CB
          AND                                    * 8D0D0
          NcaseTYPEERR                           * 8D0D5
          THREE{}N                               * 8D0DA
          BINT8                                  * 8D0DF
          ROT#-                                  * 8D0E4
          PutBackPPAR(_,s)                       * 8D0E9
        ;                                        * 8D0EE

* ROMPTR 0F1 03D
* refs (1): 8999A
ROMP_0F1_03D:
        ::                                       * 8D0F3
          DUPTYPELIST?                           * 8D0F8
          IT                                     * 8D0FD
          ::                                     * 8D102
            INNERCOMP                            * 8D107
            #3=                                  * 8D10C
            OBJ_514C3                            * 8D111
            TYPEREAL?                            * 8D116
            OBJ_514C3                            * 8D11B
            DUPTYPEREAL?                         * 8D120
            caseDROP                             * 8D125
            DUPTYPEARRY?                         * 8D12A
            OBJ_514C3                            * 8D12F
            DUP                                  * 8D134
            DIMLIMITS                            * 8D139
            LENCOMP                              * 8D13E
            #1=                                  * 8D143
            OBJ_514C3                            * 8D148
            ONESWAP                              * 8D14D
            GETATELN                             * 8D152
            DROP                                 * 8D157
            TYPEREAL?                            * 8D15C
            OBJ_514C3                            * 8D161
          ;                                      * 8D166
          TYPEIDNT?                              * 8D16B
          OBJ_514C3                              * 8D170
        ;                                        * 8D175

* ROMPTR 0F1 03E
* refs (1): 8999A
ROMP_0F1_03E:
        ::                                       * 8D17A
          OBJ_46B54                              * 8D17F
          1PUTLAM                                * 8D184
          18GETLAM                               * 8D189
          '                                      * 8D18E
          Π'SAVEDDEPTH                           * 8D193
          STO                                    * 8D198
          OBJ_4C314                              * 8D19D
          TRUE'                                  * 8D1A2
          LAM     'EnvOK                         * 8D1A7
          STOLAM                                 * 8D1BA
          DispMenu                               * 8D1BF
        ;                                        * 8D1C4

* ROMPTR 0F1 03F
* refs (1): 8999A
ROMP_0F1_03F:
        ::                                       * 8D1C9
          OBJ_73230                              * 8D1CE
          ERRJMP                                 * 8D1D3
          INDEPVAR                               * 8D1D8
          ?PURGE_HERE                            * 8D1DD
          BINT0                                  * 8D1E2
          '                                      * 8D1E7
          Π'PlotEnv_50D3E                        * 8D1EC
          STO                                    * 8D1F1
          OBJ_4E6C7                              * 8D1F6
          ERRJMP                                 * 8D1FB
        ;                                        * 8D200

* ROMPTR 0F1 040
* refs (1): 8999A
ROMP_0F1_040:
        ::                                       * 8D205
          OBJ_735EE                              * 8D20A
          IT                                     * 8D20F
          OBJ_48305                              * 8D214
          OBJ_4E6C7                              * 8D219
          INDEPVAR                               * 8D21E
          ?PURGE_HERE                            * 8D223
          ABND                                   * 8D228
          ABND                                   * 8D22D
        ;                                        * 8D232

* ROMPTR 0F1 041
* refs (1): 8999A
ROMP_0F1_041:
        ::                                       * 8D237
          DUP                                    * 8D23C
          RPTRACC                                * 8D241
          NOTcaseFALSE                           * 8D246
          OBJ_72BD2                              * 8D24B
          TYPECOL                                * 8D250
          #=case                                 * 8D255
          OBJ_5FAE0                              * 8D25A
          PALPTRDCMP                             * 8D25F
          NOTcaseFALSE                           * 8D264
          $>ID                                   * 8D269
          COMPILEID                              * 8D26E
        ;                                        * 8D273
        NIBHEX  0000                             * 8D278  ..
