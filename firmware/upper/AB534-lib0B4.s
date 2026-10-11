* HP 48GX ROM revision R, #AB534-#AE565: Library part 0B4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #AB534 in the original ROM).
        RPL

* ROMPTR 0B4 108
* refs (1): A2437
ROMP_0B4_108:
        ::                                       * AB534
          '                                      * AB539
          LAM     'PE3                           * AB53E
          STOLAM                                 * AB54D
          ROMPTR  0B5 085                        * AB552
          ROMPTR  0B5 083                        * AB55D
          ROMPTR  0B5 081                        * AB568
        ;                                        * AB573

* ROMPTR 0B4 109
* refs (1): A2437
ROMP_0B4_109:
        ::                                       * AB578
          ROMPTR  0B4 0ED                        * AB57D
          ROMPTR  0B4 0EE                        * AB588
          ROMPTR  0B4 0EF                        * AB593
          ROMPTR  0B4 0F0                        * AB59E
          #       BE56                           * AB5A9  48726
          BINT1                                  * AB5B3
          BINT28                                 * AB5B8
          #       BE57                           * AB5BD  48727
          BINT67                                 * AB5C7
          BINT28                                 * AB5CC
          #       BE58                           * AB5D1  48728
          BINT1                                  * AB5DB
          BINT37                                 * AB5E0
          #       BE59                           * AB5E5  48729
          BINT67                                 * AB5EF
          BINT37                                 * AB5F4
          ROMPTR  0B4 0F1                        * AB5F9
          ROMPTR  0B4 0F2                        * AB604
          ROMPTR  0B4 0F3                        * AB60F
          ROMPTR  0B4 0F4                        * AB61A
          OBJ_38345                              * AB625
          ROMPTR  0B4 0B0                        * AB62A
          BINT31                                 * AB635
          BINT26                                 * AB63A
          BINT31                                 * AB63F
          BINT9                                  * AB644
          BINT1                                  * AB649
          {                                      * AB64E
            BINT0                                * AB653
          }                                      * AB658
          BINT4                                  * AB65D
          #       BE5A                           * AB662  48730
          MINUSONE                               * AB66C
          MINUSONE                               * AB671
          %-1                                    * AB676
          MINUSONE                               * AB67B
          OBJ_38345                              * AB680
          ROMPTR  0B4 0B0                        * AB685
          BINT97                                 * AB690
          BINT26                                 * AB695
          BINT31                                 * AB69A
          BINT9                                  * AB69F
          BINT1                                  * AB6A4
          {                                      * AB6A9
            BINT0                                * AB6AE
          }                                      * AB6B3
          BINT4                                  * AB6B8
          #       BE5B                           * AB6BD  48731
          MINUSONE                               * AB6C7
          MINUSONE                               * AB6CC
          %1                                     * AB6D1
          MINUSONE                               * AB6D6
          OBJ_38345                              * AB6DB
          ROMPTR  0B4 0B0                        * AB6E0
          BINT31                                 * AB6EB
          BINT35                                 * AB6F0
          BINT31                                 * AB6F5
          BINT9                                  * AB6FA
          BINT1                                  * AB6FF
          {                                      * AB704
            BINT0                                * AB709
          }                                      * AB70E
          BINT4                                  * AB713
          #       BE5C                           * AB718  48732
          MINUSONE                               * AB722
          MINUSONE                               * AB727
          %-1                                    * AB72C
          MINUSONE                               * AB731
          OBJ_38345                              * AB736
          ROMPTR  0B4 0B0                        * AB73B
          BINT97                                 * AB746
          BINT35                                 * AB74B
          BINT31                                 * AB750
          BINT9                                  * AB755
          BINT1                                  * AB75A
          {                                      * AB75F
            BINT0                                * AB764
          }                                      * AB769
          BINT4                                  * AB76E
          #       BE5D                           * AB773  48733
          MINUSONE                               * AB77D
          MINUSONE                               * AB782
          %1                                     * AB787
          MINUSONE                               * AB78C
          BINT8                                  * AB791
          DUP                                    * AB796
          'DROPFALSE                             * AB79B
          #       BE23                           * AB7A0  48675

* ROMPTR 0B4 10A
* refs (1): A2437
ROMP_0B4_10A:
          ::                                     * AB7AA
            ROMPTR  0B5 080                      * AB7AF
            ROMPTR  0B5 082                      * AB7BA
            ROMPTR  0B5 088                      * AB7C5
            ROMPTR  0B5 08A                      * AB7D0
          ;                                      * AB7DB
          BINT8                                  * AB7E0
          ROMPTR  0B0 0AA                        * AB7E5
        ;                                        * AB7F0

* ROMPTR 0B4 10B
* refs (1): A2437
ROMP_0B4_10B:
        ::                                       * AB7F5
          ROMPTR  0B5 08B                        * AB7FA
          ROMPTR  0B5 089                        * AB805
          ROMPTR  0B5 083                        * AB810
          ROMPTR  0B5 081                        * AB81B
        ;                                        * AB826

* ROMPTR 0B4 10C
* refs (1): A2437
ROMP_0B4_10C:
        ::                                       * AB82B
          ROMPTR  0B4 0F8                        * AB830
          ROMPTR  0B4 0FE                        * AB83B
          BINT9                                  * AB846
          DUP                                    * AB84B
          OBJ_38345                              * AB850
          ROMPTR  0B4 10D                        * AB855
          #       BE23                           * AB860  48675
          ROMPTR  0B4 104                        * AB86A
          BINT9                                  * AB875
          ROMPTR  0B0 0AA                        * AB87A
        ;                                        * AB885

* ROMPTR 0B4 10D
* refs (1): A2437
ROMP_0B4_10D:
        ::                                       * AB88A
          BINT16                                 * AB88F
          #<>case                                * AB894
          FALSE                                  * AB899
          ROMPTR  0B4 10E                        * AB89E
          TrueTrue                               * AB8A9
        ;                                        * AB8AE

* ROMPTR 0B4 10E
* refs (1): A2437
ROMP_0B4_10E:
        {                                        * AB8B3
          {                                      * AB8B8
            ::                                   * AB8BD
              PTR     DirLabel:                  * AB8C2
              $       "XX,YY"                    * AB8C7
            ;                                    * AB8DB
            ROMPTR  0B4 10F                      * AB8E0
          }                                      * AB8EB
          {                                      * AB8F0
            $       "(AN(L"                      * AB8F5
            ROMPTR  0B0 059                      * AB909  DoKeyCancel
          }                                      * AB914
          {                                      * AB919
            $       "OK"                         * AB91E
            ROMPTR  0B0 05A                      * AB92C  DoKeyOK
          }                                      * AB937
        }                                        * AB93C

* ROMPTR 0B4 10F
* refs (1): A2437
ROMP_0B4_10F:
        ::                                       * AB941
          TakeOver                               * AB946
          ROMPTR  0B0 0C8                        * AB94B  GetFieldVals
          ROMPTR  0B4 062                        * AB956
          ROMPTR  0B4 110                        * AB961
          GETPTYPE                               * AB96C
          1LAMBIND                               * AB971
          DoInputForm                            * AB976
          1GETABND                               * AB97B
          PUTPTYPE                               * AB980
          NOT?SEMI                               * AB985
          ROMPTR  0B4 112                        * AB98A
          ROMPTR  0B4 061                        * AB995
          ROMPTR  0B0 0D8                        * AB9A0
        ;                                        * AB9AB

* ROMPTR 0B4 110
* refs (1): A2437
ROMP_0B4_110:
        ::                                       * AB9B0
          #       BE56                           * AB9B5  48726
          BINT1                                  * AB9BF
          BINT19                                 * AB9C4
          #       BE57                           * AB9C9  48727
          BINT67                                 * AB9D3
          BINT19                                 * AB9D8
          #       BE58                           * AB9DD  48728
          BINT1                                  * AB9E7
          BINT28                                 * AB9EC
          #       BE59                           * AB9F1  48729
          BINT67                                 * AB9FB
          BINT28                                 * ABA00
          'DROPFALSE                             * ABA05
          BINT31                                 * ABA0A
          BINT17                                 * ABA0F
          BINT31                                 * ABA14
          BINT9                                  * ABA19
          BINT1                                  * ABA1E
          {                                      * ABA23
            BINT0                                * ABA28
          }                                      * ABA2D
          BINT4                                  * ABA32
          #       BE5A                           * ABA37  48730
          MINUSONE                               * ABA41
          MINUSONE                               * ABA46
          %-1                                    * ABA4B
          MINUSONE                               * ABA50
          'DROPFALSE                             * ABA55
          BINT97                                 * ABA5A
          BINT17                                 * ABA5F
          BINT31                                 * ABA64
          BINT9                                  * ABA69
          BINT1                                  * ABA6E
          {                                      * ABA73
            BINT0                                * ABA78
          }                                      * ABA7D
          BINT4                                  * ABA82
          #       BE5B                           * ABA87  48731
          MINUSONE                               * ABA91
          MINUSONE                               * ABA96
          %1                                     * ABA9B
          MINUSONE                               * ABAA0
          'DROPFALSE                             * ABAA5
          BINT31                                 * ABAAA
          BINT26                                 * ABAAF
          BINT31                                 * ABAB4
          BINT9                                  * ABAB9
          BINT1                                  * ABABE
          {                                      * ABAC3
            BINT0                                * ABAC8
          }                                      * ABACD
          BINT4                                  * ABAD2
          #       BE5C                           * ABAD7  48732
          MINUSONE                               * ABAE1
          MINUSONE                               * ABAE6
          %-1                                    * ABAEB
          MINUSONE                               * ABAF0
          'DROPFALSE                             * ABAF5
          BINT97                                 * ABAFA
          BINT26                                 * ABAFF
          BINT31                                 * ABB04
          BINT9                                  * ABB09
          BINT1                                  * ABB0E
          {                                      * ABB13
            BINT0                                * ABB18
          }                                      * ABB1D
          BINT4                                  * ABB22
          #       BE5D                           * ABB27  48733
          MINUSONE                               * ABB31
          MINUSONE                               * ABB36
          %1                                     * ABB3B
          MINUSONE                               * ABB40
          BINT4                                  * ABB45
          DUP                                    * ABB4A
          'DROPFALSE                             * ABB4F
          #       BE5E                           * ABB54  48734

* ROMPTR 0B4 111
* refs (1): A2437
ROMP_0B4_111:
          ::                                     * ABB5E
            ROMPTR  0B5 088                      * ABB63
            ROMPTR  0B5 08A                      * ABB6E
          ;                                      * ABB79
          BINT4                                  * ABB7E
          ROMPTR  0B0 0AA                        * ABB83
        ;                                        * ABB8E

* ROMPTR 0B4 112
* refs (1): A2437
ROMP_0B4_112:
        ::                                       * ABB93
          ROMPTR  0B5 08B                        * ABB98
          ROMPTR  0B5 089                        * ABBA3
        ;                                        * ABBAE

* ROMPTR 0B4 113
* refs (1): A2437
ROMP_0B4_113:
        ::                                       * ABBB3
          ROMPTR  0B0 0AB                        * ABBB8
          {                                      * ABBC3
            {                                    * ABBC8
              #       BD01                       * ABBCD  48385
              ROMPTR  0B4 114                    * ABBD7
            }                                    * ABBE2
            {                                    * ABBE7
              #       BD02                       * ABBEC  48386
              ROMPTR  0B4 122                    * ABBF6
            }                                    * ABC01
            {                                    * ABC06
              #       BD03                       * ABC0B  48387
              ROMPTR  0B4 12B                    * ABC15
            }                                    * ABC20
            {                                    * ABC25
              #       BD04                       * ABC2A  48388
              ROMPTR  0B4 12D                    * ABC34
            }                                    * ABC3F
            {                                    * ABC44
              #       BD05                       * ABC49  48389
              ROMPTR  0B4 130                    * ABC53
            }                                    * ABC5E
            {                                    * ABC63
              #       BD06                       * ABC68  48390
              ROMPTR  0B4 131                    * ABC72
            }                                    * ABC7D
          }                                      * ABC82
          ROMPTR  0B0 0A9                        * ABC87
        ;                                        * ABC92

* ROMPTR 0B4 114
* refs (1): A2437
ROMP_0B4_114:
        ::                                       * ABC97

* ROMPTR 0B4 115
* refs (1): A2437
ROMP_0B4_115:
          ::                                     * ABC9C
            #       BD08                         * ABCA1  48392
            BINT1                                * ABCAB
            BINT10                               * ABCB0
          ;                                      * ABCB5

* ROMPTR 0B4 116
* refs (1): A2437
ROMP_0B4_116:
          ::                                     * ABCBA
            #       BD09                         * ABCBF  48393
            BINT1                                * ABCC9
            BINT19                               * ABCCE
          ;                                      * ABCD3
          #       BE24                           * ABCD8  48676
          BINT52                                 * ABCE2
          BINT19                                 * ABCE7
          #       BE25                           * ABCEC  48677
          #       5E                             * ABCF6  94
          BINT19                                 * ABD00

* ROMPTR 0B4 117
* refs (1): A2437
ROMP_0B4_117:
          ::                                     * ABD05
            #       BD0A                         * ABD0A  48394
            BINT1                                * ABD14
            BINT28                               * ABD19
          ;                                      * ABD1E
          #       B917                           * ABD23  47383
          BINT1                                  * ABD2D
          BINT37                                 * ABD32

* ROMPTR 0B4 118
* refs (1): A2437
ROMP_0B4_118:
          ::                                     * ABD37
            'DROPFALSE                           * ABD3C
            BINT22                               * ABD41
            BINT8                                * ABD46
            BINT97                               * ABD4B
            BINT9                                * ABD50
            BINT23                               * ABD55
            {                                    * ABD5A
              BINT9                              * ABD5F
              BINT6                              * ABD64
            }                                    * ABD69
            BINT4                                * ABD6E
            #       BD0B                         * ABD73  48395
            #       BF0A                         * ABD7D  48906
            MINUSONE                             * ABD87
            MINUSONE                             * ABD8C
            ROMPTR  0B5 092                      * ABD91
          ;                                      * ABD9C

* ROMPTR 0B4 119
* refs (1): A2437
ROMP_0B4_119:
          ::                                     * ABDA1
            'DROPFALSE                           * ABDA6
            BINT22                               * ABDAB
            BINT17                               * ABDB0
            BINT25                               * ABDB5
            BINT9                                * ABDBA
            BINT1                                * ABDBF
            {                                    * ABDC4
              BINT6                              * ABDC9
            }                                    * ABDCE
            BINT4                                * ABDD3
            #       BD0C                         * ABDD8  48396
            MINUSONE                             * ABDE2
            MINUSONE                             * ABDE7
            MINUSONE                             * ABDEC
            MINUSONE                             * ABDF1
          ;                                      * ABDF6
          'DROPFALSE                             * ABDFB
          BINT64                                 * ABE00
          BINT17                                 * ABE05
          BINT25                                 * ABE0A
          BINT9                                  * ABE0F
          BINT3                                  * ABE14
          {                                      * ABE19
            BINT0                                * ABE1E
            BINT6                                * ABE23
            BINT9                                * ABE28
          }                                      * ABE2D
          BINT4                                  * ABE32
          #       BD0D                           * ABE37  48397
          MINUSONE                               * ABE41
          MINUSONE                               * ABE46
          MINUSONE                               * ABE4B
          MINUSONE                               * ABE50
          'DROPFALSE                             * ABE55
          #       6A                             * ABE5A  106
          BINT17                                 * ABE64
          BINT25                                 * ABE69
          BINT9                                  * ABE6E
          BINT3                                  * ABE73
          {                                      * ABE78
            BINT0                                * ABE7D
            BINT6                                * ABE82
            BINT9                                * ABE87
          }                                      * ABE8C
          BINT4                                  * ABE91
          #       BD0E                           * ABE96  48398
          MINUSONE                               * ABEA0
          MINUSONE                               * ABEA5
          MINUSONE                               * ABEAA
          MINUSONE                               * ABEAF
          OBJ_38345                              * ABEB4
          ROMPTR  0B4 11C                        * ABEB9
          BINT28                                 * ABEC4
          BINT26                                 * ABEC9
          BINT49                                 * ABECE
          BINT9                                  * ABED3
          BINT12                                 * ABED8
          MINUSONE                               * ABEDD
          BINT17                                 * ABEE2
          #       BD0F                           * ABEE7  48399
          ROMPTR  0B5 0A0                        * ABEF1
          BINT17                                 * ABEFC
          ROMPTR  0B5 0A1                        * ABF01
          ROMPTR  0B5 094                        * ABF0C
          ITE                                    * ABF17
          ROMPTR  0B5 0A1                        * ABF1C
          ROMPTR  0B5 0A2                        * ABF27
          OBJ_38345                              * ABF32
          ROMPTR  0B4 11D                        * ABF37
          BINT61                                 * ABF42
          BINT35                                 * ABF47
          BINT19                                 * ABF4C
          BINT9                                  * ABF51
          BINT12                                 * ABF56
          MINUSONE                               * ABF5B
          BINT33                                 * ABF60
          #       BD10                           * ABF65  48400
          ROMPTR  0B5 143                        * ABF6F
          BINT17                                 * ABF7A
          ROMPTR  0B5 144                        * ABF7F
          ROMPTR  0B5 138                        * ABF8A
          OBJ_38345                              * ABF95
          ROMPTR  0B4 11E                        * ABF9A
          BINT85                                 * ABFA5
          BINT35                                 * ABFAA
          BINT13                                 * ABFAF
          BINT9                                  * ABFB4
          BINT13                                 * ABFB9
          {                                      * ABFBE
            BINT0                                * ABFC3
          }                                      * ABFC8
          BINT4                                  * ABFCD
          #       B91E                           * ABFD2  47390
          ROMPTR  0B5 148                        * ABFDC
          BINT4                                  * ABFE7
          %0_2A2B4                               * ABFEC
          BINT13                                 * ABFF1
          ROLL                                   * ABFF6
          BINT6                                  * ABFFB
          BINT7                                  * AC000
          OBJ_38345                              * AC005
          ROMPTR  0B4 11A                        * AC00A
          #       BD07                           * AC015  48391
          DoInputForm                            * AC01F
          NOT?SEMI                               * AC024
          7PICK                                  * AC029
          ROMPTR  0B5 093                        * AC02E
          ROT                                    * AC039
          ROMPTR  0B0 099                        * AC03E
          3UNROLL                                * AC049
          3PICK                                  * AC04E
          ITE                                    * AC053
          ::                                     * AC058
            COERCE                               * AC05D
            SWAP                                 * AC062
            ROMPTR  0B0 09D                      * AC067
          ;                                      * AC072
          2DROP                                  * AC077
          ROMPTR  0B5 097                        * AC07C
        ;                                        * AC087

* ROMPTR 0B4 11A
* refs (1): A2437
ROMP_0B4_11A:
        ::                                       * AC08C
          ROMPTR  0B0 0AD                        * AC091
          {                                      * AC09C
            BINT1                                * AC0A1
            BINT2                                * AC0A6
            BINT3                                * AC0AB
            BINT4                                * AC0B0
          }                                      * AC0B5
          BINT5                                  * AC0BA
          #<>case                                * AC0BF
          FALSE                                  * AC0C4
          ROMPTR  0B4 11B                        * AC0C9
          TRUE                                   * AC0D4
        ;                                        * AC0D9

* ROMPTR 0B4 11B
* refs (1): A2437
ROMP_0B4_11B:
        ::                                       * AC0DE
          BINT39                                 * AC0E3
          BINT131                                * AC0E8
          MAKEGROB                               * AC0ED
          BINT6                                  * AC0F2
          ONE_DO                                 * AC0F7
          INDEX@                                 * AC0FC
          ROMPTR  0B0 012                        * AC101
          LOOP                                   * AC10C
          ROMPTR  0B4 120                        * AC111
          NOTcaseFALSE                           * AC11C
          BINT6                                  * AC121
          ROMPTR  0B0 012                        * AC126
          FALSE                                  * AC131
        ;                                        * AC136

* ROMPTR 0B4 11C
* refs (1): A2437
ROMP_0B4_11C:
        ::                                       * AC13B
          BINT47                                 * AC140
          #<>case                                * AC145
          FALSE                                  * AC14A
          ROMPTR  0B4 11F                        * AC14F
          TRUE                                   * AC15A
        ;                                        * AC15F

* ROMPTR 0B4 11D
* refs (1): A2437
ROMP_0B4_11D:
        ::                                       * AC164
          BINT7                                  * AC169
          #=casedrop                             * AC16E
          ::                                     * AC173
            ROMPTR  0B4 120                      * AC178
            NOT                                  * AC183
          ;                                      * AC188
          {                                      * AC18D
            BINT55                               * AC192
            ROMPTR  0B4 120                      * AC197
            BINT47                               * AC1A2
            ROMPTR  0B4 11F                      * AC1A7
          }                                      * AC1B2
          EQLookup                               * AC1B7
          case                                   * AC1BC
          ::                                     * AC1C1
            EVAL                                 * AC1C6
            TRUE                                 * AC1CB
          ;                                      * AC1D0
          DROPFALSE                              * AC1D5
        ;                                        * AC1DA

* ROMPTR 0B4 11E
* refs (1): A2437
ROMP_0B4_11E:
        ::                                       * AC1DF
          BINT7                                  * AC1E4
          #=casedrop                             * AC1E9
          ::                                     * AC1EE
            ROMPTR  0B4 120                      * AC1F3
            NOT                                  * AC1FE
            ROMPTR  0B4 121                      * AC203
            OR                                   * AC20E
          ;                                      * AC213
          BINT55                                 * AC218
          #<>case                                * AC21D
          FALSE                                  * AC222
          ROMPTR  0B4 120                        * AC227
          ROMPTR  0B4 121                        * AC232
          NOT                                    * AC23D
          AND                                    * AC242
          TRUE                                   * AC247
        ;                                        * AC24C

* ROMPTR 0B4 11F
* refs (1): A2437
ROMP_0B4_11F:
        ::                                       * AC251
          ROMPTR  0B4 120                        * AC256
          NOTcase                                * AC261
          ::                                     * AC266
            BINT35                               * AC26B
            BINT9                                * AC270
            BLANKIT                              * AC275
          ;                                      * AC27A
          HARDBUFF                               * AC27F
          BINT6                                  * AC284
          ROMPTR  0B0 012                        * AC289
          DROP                                   * AC294
          BINT6                                  * AC299
          ROMPTR  0B0 0A2                        * AC29E
          BINT7                                  * AC2A9
          ROMPTR  0B0 0A2                        * AC2AE
          ROMPTR  0B4 121                        * AC2B9
          NOT?SEMI                               * AC2C4
          HARDBUFF                               * AC2C9
          BINT85                                 * AC2CE
          BINT35                                 * AC2D3
          BINT97                                 * AC2D8
          BINT44                                 * AC2DD
          GROB!ZERO                              * AC2E2
          DROP                                   * AC2E7
        ;                                        * AC2EC

* ROMPTR 0B4 120
* refs (1): A2437
ROMP_0B4_120:
        ::                                       * AC2F1
          BINT5                                  * AC2F6
          ROMPTR  0B0 0C5                        * AC2FB  ~gFldVal
          ROMPTR  0B0 099                        * AC306
        ;                                        * AC311

* ROMPTR 0B4 121
* refs (1): A2437
ROMP_0B4_121:
        ::                                       * AC316
          BINT6                                  * AC31B
          ROMPTR  0B0 0C5                        * AC320  ~gFldVal
          OBJ_72AFA                              * AC32B
          ROMPTR  0B5 144                        * AC330
          OBJ_72AFA                              * AC33B
          EQUAL                                  * AC340
        ;                                        * AC345

* ROMPTR 0B4 122
* refs (1): A2437
ROMP_0B4_122:
        ::                                       * AC34A
          ROMPTR  0B4 115                        * AC34F
          ROMPTR  0B4 116                        * AC35A
          ROMPTR  0B4 117                        * AC365
          #       BD12                           * AC370  48402
          BINT1                                  * AC37A
          BINT37                                 * AC37F
          ROMPTR  0B4 118                        * AC384
          ROMPTR  0B4 119                        * AC38F
          OBJ_38345                              * AC39A
          ROMPTR  0B4 127                        * AC39F
          BINT28                                 * AC3AA
          BINT26                                 * AC3AF
          BINT49                                 * AC3B4
          BINT9                                  * AC3B9
          BINT12                                 * AC3BE
          MINUSONE                               * AC3C3
          BINT17                                 * AC3C8
          #       BD0F                           * AC3CD  48399
          ROMPTR  0B5 0A0                        * AC3D7
          BINT17                                 * AC3E2
          ROMPTR  0B5 0A1                        * AC3E7
          ROMPTR  0B5 094                        * AC3F2
          ITE                                    * AC3FD
          ROMPTR  0B5 0A1                        * AC402
          ROMPTR  0B5 0A2                        * AC40D
          OBJ_38345                              * AC418
          ROMPTR  0B4 129                        * AC41D
          BINT28                                 * AC428
          BINT35                                 * AC42D
          BINT49                                 * AC432
          BINT9                                  * AC437
          BINT1                                  * AC43C
          {                                      * AC441
            BINT0                                * AC446
            BINT6                                * AC44B
            BINT9                                * AC450
          }                                      * AC455
          BINT4                                  * AC45A
          #       BD13                           * AC45F  48403
          MINUSONE                               * AC469
          MINUSONE                               * AC46E
          MINUSONE                               * AC473
          MINUSONE                               * AC478
          BINT4                                  * AC47D
          DUP                                    * AC482
          OBJ_38345                              * AC487
          ROMPTR  0B4 123                        * AC48C
          #       BD11                           * AC497  48401
          DoInputForm                            * AC4A1
          NOT?SEMI                               * AC4A6
          4PICK                                  * AC4AB
          ROMPTR  0B5 093                        * AC4B0
          SWAP                                   * AC4BB
          ROMPTR  0B0 099                        * AC4C0
          ROMPTR  0B5 098                        * AC4CB
        ;                                        * AC4D6

* ROMPTR 0B4 123
* refs (1): A2437
ROMP_0B4_123:
        ::                                       * AC4DB
          ROMPTR  0B0 0AD                        * AC4E0
          {                                      * AC4EB
            BINT1                                * AC4F0
            BINT2                                * AC4F5
          }                                      * AC4FA
          {                                      * AC4FF
            BINT16                               * AC504
            ::                                   * AC509
              ROMPTR  0B4 124                    * AC50E
              TRUE                               * AC519
            ;                                    * AC51E
            BINT5                                * AC523
            ROMPTR  0B4 126                      * AC528
          }                                      * AC533
          EQLookup                               * AC538
          case                                   * AC53D
          ::                                     * AC542
            EVAL                                 * AC547
            TRUE                                 * AC54C
          ;                                      * AC551
          DROPFALSE                              * AC556
        ;                                        * AC55B

* ROMPTR 0B4 124
* refs (1): A2437
ROMP_0B4_124:
        {                                        * AC560
          {                                      * AC565
            $       "STEP"                       * AC56A
            ROMPTR  0B4 125                      * AC57C
          }                                      * AC587
          {                                      * AC58C
            $       "(AN(L"                      * AC591
            ROMPTR  0B0 059                      * AC5A5  DoKeyCancel
          }                                      * AC5B0
          {                                      * AC5B5
            $       "OK"                         * AC5BA
            ROMPTR  0B0 05A                      * AC5C8  DoKeyOK
          }                                      * AC5D3
        }                                        * AC5D8

* ROMPTR 0B4 125
* refs (1): A2437
ROMP_0B4_125:
        ::                                       * AC5DD
          TakeOver                               * AC5E2
          ROMPTR  0B0 0C8                        * AC5E7  GetFieldVals
          4PICK                                  * AC5F2
          ROMPTR  0B5 093                        * AC5F7
          SWAP                                   * AC602
          ROMPTR  0B0 099                        * AC607
          ROMPTR  0B5 099                        * AC612
          AtUserStack                            * AC61D
          ROMPTR  0B0 059                        * AC622  DoKeyCancel
        ;                                        * AC62D

* ROMPTR 0B4 126
* refs (1): A2437
ROMP_0B4_126:
        ::                                       * AC632
          BINT39                                 * AC637
          BINT131                                * AC63C
          MAKEGROB                               * AC641
          BINT4                                  * AC646
          ONE_DO                                 * AC64B
          INDEX@                                 * AC650
          ROMPTR  0B0 012                        * AC655
          LOOP                                   * AC660
          ROMPTR  0B4 12A                        * AC665
          NOTcaseFALSE                           * AC670
          BINT4                                  * AC675
          ROMPTR  0B0 012                        * AC67A
          FALSE                                  * AC685
        ;                                        * AC68A

* ROMPTR 0B4 127
* refs (1): A2437
ROMP_0B4_127:
        ::                                       * AC68F
          BINT47                                 * AC694
          #<>case                                * AC699
          FALSE                                  * AC69E
          ROMPTR  0B4 128                        * AC6A3
          TRUE                                   * AC6AE
        ;                                        * AC6B3

* ROMPTR 0B4 128
* refs (1): A2437
ROMP_0B4_128:
        ::                                       * AC6B8
          ROMPTR  0B4 12A                        * AC6BD
          NOTcase                                * AC6C8
          ::                                     * AC6CD
            BINT35                               * AC6D2
            BINT9                                * AC6D7
            BLANKIT                              * AC6DC
          ;                                      * AC6E1
          HARDBUFF                               * AC6E6
          BINT4                                  * AC6EB
          ROMPTR  0B0 012                        * AC6F0
          DROP                                   * AC6FB
          BINT4                                  * AC700
          ROMPTR  0B0 0A2                        * AC705
        ;                                        * AC710

* ROMPTR 0B4 129
* refs (1): A2437
ROMP_0B4_129:
        ::                                       * AC715
          BINT7                                  * AC71A
          #=casedrop                             * AC71F
          ::                                     * AC724
            ROMPTR  0B4 12A                      * AC729
            NOT                                  * AC734
          ;                                      * AC739
          BINT55                                 * AC73E
          #<>case                                * AC743
          FALSE                                  * AC748
          ROMPTR  0B4 12A                        * AC74D
          TRUE                                   * AC758
        ;                                        * AC75D

* ROMPTR 0B4 12A
* refs (1): A2437
ROMP_0B4_12A:
        ::                                       * AC762
          BINT3                                  * AC767
          ROMPTR  0B0 0C5                        * AC76C  ~gFldVal
          ROMPTR  0B0 099                        * AC777
        ;                                        * AC782

* ROMPTR 0B4 12B
* refs (1): A2437
ROMP_0B4_12B:
        ::                                       * AC787
          ROMPTR  0B4 115                        * AC78C
          ROMPTR  0B4 116                        * AC797
          #       BD16                           * AC7A2  48406
          BINT55                                 * AC7AC
          BINT19                                 * AC7B1
          ROMPTR  0B4 117                        * AC7B6
          ROMPTR  0B4 118                        * AC7C1
          ROMPTR  0B4 119                        * AC7CC
          'DROPFALSE                             * AC7D7
          BINT79                                 * AC7DC
          BINT17                                 * AC7E1
          BINT19                                 * AC7E6
          BINT9                                  * AC7EB
          BINT1                                  * AC7F0
          {                                      * AC7F5
            BINT0                                * AC7FA
          }                                      * AC7FF
          BINT4                                  * AC804
          #       BD17                           * AC809  48407
          MINUSONE                               * AC813
          MINUSONE                               * AC818
          MINUSONE                               * AC81D
          MINUSONE                               * AC822

* ROMPTR 0B4 12C
* refs (1): A2437
ROMP_0B4_12C:
          ::                                     * AC827
            'DROPFALSE                           * AC82C
            BINT28                               * AC831
            BINT26                               * AC836
            BINT49                               * AC83B
            BINT9                                * AC840
            BINT12                               * AC845
            MINUSONE                             * AC84A
            BINT17                               * AC84F
            #       BD0F                         * AC854  48399
            ROMPTR  0B5 0A0                      * AC85E
            BINT17                               * AC869
            ROMPTR  0B5 0A1                      * AC86E
            ROMPTR  0B5 094                      * AC879
            ITE                                  * AC884
            ROMPTR  0B5 0A1                      * AC889
            ROMPTR  0B5 0A2                      * AC894
          ;                                      * AC89F
          BINT4                                  * AC8A4
          DUP                                    * AC8A9
          '                                      * AC8AE
          ::                                     * AC8B3
            ROMPTR  0B0 0AD                      * AC8B8
            {                                    * AC8C3
              BINT1                              * AC8C8
              BINT2                              * AC8CD
              BINT3                              * AC8D2
            }                                    * AC8D7
            DROPFALSE                            * AC8DC
          ;                                      * AC8E1
          #       BD15                           * AC8E6  48405
          DoInputForm                            * AC8F0
          NOT?SEMI                               * AC8F5
          4PICK                                  * AC8FA
          ROMPTR  0B5 093                        * AC8FF
          ROMPTR  0B0 099                        * AC90A
          ROMPTR  0B5 09A                        * AC915
        ;                                        * AC920

* ROMPTR 0B4 12D
* refs (1): A2437
ROMP_0B4_12D:
        ::                                       * AC925
          ROMPTR  0B4 115                        * AC92A
          ROMPTR  0B4 116                        * AC935
          ROMPTR  0B4 117                        * AC940

* ROMPTR 0B4 12E
* refs (1): A2437
ROMP_0B4_12E:
          ::                                     * AC94B
            #       BD19                         * AC950  48409
            #       5C                           * AC95A  92
            BINT28                               * AC964
          ;                                      * AC969
          ROMPTR  0B4 118                        * AC96E
          ROMPTR  0B4 119                        * AC979
          ROMPTR  0B4 12C                        * AC984

* ROMPTR 0B4 12F
* refs (1): A2437
ROMP_0B4_12F:
          ::                                     * AC98F
            'DROPFALSE                           * AC994
            BINT85                               * AC999
            BINT26                               * AC99E
            BINT6                                * AC9A3
            BINT9                                * AC9A8
            BINT32                               * AC9AD
            MINUSONE                             * AC9B2
            MINUSONE                             * AC9B7
            #       BD1A                         * AC9BC  48410
            MINUSONE                             * AC9C6
            MINUSONE                             * AC9CB
            FALSE                                * AC9D0
            ROMPTR  0B5 095                      * AC9D5
          ;                                      * AC9E0
          BINT4                                  * AC9E5
          DUP                                    * AC9EA
          '                                      * AC9EF
          ::                                     * AC9F4
            ROMPTR  0B0 0AD                      * AC9F9
            {                                    * ACA04
              BINT1                              * ACA09
              BINT2                              * ACA0E
            }                                    * ACA13
            DROPFALSE                            * ACA18
          ;                                      * ACA1D
          #       BD18                           * ACA22  48408
          DoInputForm                            * ACA2C
          NOT?SEMI                               * ACA31
          4PICK                                  * ACA36
          ROMPTR  0B5 093                        * ACA3B
          ROMPTR  0B5 096                        * ACA46
          ROMPTR  0B0 099                        * ACA51
          ROMPTR  0B5 09B                        * ACA5C
        ;                                        * ACA67

* ROMPTR 0B4 130
* refs (1): A2437
ROMP_0B4_130:
        ::                                       * ACA6C
          ROMPTR  0B4 115                        * ACA71
          ROMPTR  0B4 116                        * ACA7C
          ROMPTR  0B4 117                        * ACA87
          ROMPTR  0B4 12E                        * ACA92
          ROMPTR  0B4 118                        * ACA9D
          ROMPTR  0B4 119                        * ACAA8
          ROMPTR  0B4 12C                        * ACAB3
          ROMPTR  0B4 12F                        * ACABE
          BINT4                                  * ACAC9
          DUP                                    * ACACE
          '                                      * ACAD3
          ::                                     * ACAD8
            ROMPTR  0B0 0AD                      * ACADD
            {                                    * ACAE8
              BINT1                              * ACAED
              BINT2                              * ACAF2
            }                                    * ACAF7
            DROPFALSE                            * ACAFC
          ;                                      * ACB01
          #       BD1B                           * ACB06  48411
          DoInputForm                            * ACB10
          NOT?SEMI                               * ACB15
          4PICK                                  * ACB1A
          ROMPTR  0B5 093                        * ACB1F
          ROMPTR  0B5 096                        * ACB2A
          ROMPTR  0B0 099                        * ACB35
          ROMPTR  0B5 09C                        * ACB40
        ;                                        * ACB4B

* ROMPTR 0B4 131
* refs (1): A2437
ROMP_0B4_131:
        ::                                       * ACB50
          ROMPTR  0B4 115                        * ACB55
          ROMPTR  0B4 118                        * ACB60
          BINT1                                  * ACB6B
          DUP                                    * ACB70
          OBJ_38345                              * ACB75
          ROMPTR  0B4 132                        * ACB7A
          #       BD1C                           * ACB85  48412
          DoInputForm                            * ACB8F
          NOT?SEMI                               * ACB94
          DUP                                    * ACB99
          ROMPTR  0B5 093                        * ACB9E
          DUP                                    * ACBA9
          MINUSONE                               * ACBAE
          EQUAL                                  * ACBB3
          IT                                     * ACBB8
          DROP                                   * ACBBD
          AtUserStack                            * ACBC2
        ;                                        * ACBC7

* ROMPTR 0B4 132
* refs (1): A2437
ROMP_0B4_132:
        ::                                       * ACBCC
          BINT16                                 * ACBD1
          #<>case                                * ACBD6
          FALSE                                  * ACBDB
          ROMPTR  0B4 133                        * ACBE0
          TrueTrue                               * ACBEB
        ;                                        * ACBF0

* ROMPTR 0B4 133
* refs (1): A2437
ROMP_0B4_133:
        {                                        * ACBF5
          {                                      * ACBFA
            ::                                   * ACBFF
              PTR     DirLabel:                  * ACC04
              $       "MATC"                     * ACC09
            ;                                    * ACC1B
            ROMPTR  0B4 136                      * ACC20
          }                                      * ACC2B
          {                                      * ACC30
            $       "COLCT"                      * ACC35
            ROMPTR  0B4 134                      * ACC49
          }                                      * ACC54
          {                                      * ACC59
            $       "EXPND"                      * ACC5E
            ROMPTR  0B4 135                      * ACC72
          }                                      * ACC7D
        }                                        * ACC82

* ROMPTR 0B4 134
* refs (1): A2437
ROMP_0B4_134:
        ::                                       * ACC87
          TakeOver                               * ACC8C
          BINT1                                  * ACC91
          ROMPTR  0B0 0C5                        * ACC96  ~gFldVal
          ROMPTR  0B5 09D                        * ACCA1
          BINT1                                  * ACCAC
          ROMPTR  0B0 0D5                        * ACCB1  ~sFldVal
          SetDA123NoCh                           * ACCBC
          BINT1                                  * ACCC1
          ROMPTR  0B0 0A2                        * ACCC6
        ;                                        * ACCD1

* ROMPTR 0B4 135
* refs (1): A2437
ROMP_0B4_135:
        ::                                       * ACCD6
          TakeOver                               * ACCDB
          BINT1                                  * ACCE0
          ROMPTR  0B0 0C5                        * ACCE5  ~gFldVal
          ROMPTR  0B5 09E                        * ACCF0
          BINT1                                  * ACCFB
          ROMPTR  0B0 0D5                        * ACD00  ~sFldVal
          SetDA123NoCh                           * ACD0B
          BINT1                                  * ACD10
          ROMPTR  0B0 0A2                        * ACD15
        ;                                        * ACD20

* ROMPTR 0B4 136
* refs (1): A2437
ROMP_0B4_136:
        ::                                       * ACD25
          TakeOver                               * ACD2A
          ROMPTR  0B4 115                        * ACD2F
          #       BD1E                           * ACD3A  48414
          BINT1                                  * ACD44
          BINT19                                 * ACD49
          #       BD1F                           * ACD4E  48415
          BINT1                                  * ACD58
          BINT28                                 * ACD5D
          #       BD20                           * ACD62  48416
          BINT8                                  * ACD6C
          BINT37                                 * ACD71
          #       BD21                           * ACD76  48417
          BINT67                                 * ACD80
          BINT37                                 * ACD85
          ROMPTR  0B4 118                        * ACD8A
          DROP                                   * ACD95
          BINT1                                  * ACD9A
          ROMPTR  0B0 0C5                        * ACD9F  ~gFldVal
          'DROPFALSE                             * ACDAA
          BINT55                                 * ACDAF
          BINT17                                 * ACDB4
          #       49                             * ACDB9  73
          BINT9                                  * ACDC3
          BINT1                                  * ACDC8
          {                                      * ACDCD
            BINT9                                * ACDD2
            BINT6                                * ACDD7
            BINT0                                * ACDDC
            BINT1                                * ACDE1
          }                                      * ACDE6
          BINT4                                  * ACDEB
          #       BD22                           * ACDF0  48418
          MINUSONE                               * ACDFA
          MINUSONE                               * ACDFF
          MINUSONE                               * ACE04
          MINUSONE                               * ACE09
          'DROPFALSE                             * ACE0E
          BINT55                                 * ACE13
          BINT26                                 * ACE18
          #       49                             * ACE1D  73
          BINT9                                  * ACE27
          BINT1                                  * ACE2C
          {                                      * ACE31
            BINT9                                * ACE36
            BINT6                                * ACE3B
            BINT0                                * ACE40
            BINT1                                * ACE45
          }                                      * ACE4A
          BINT4                                  * ACE4F
          #       BD23                           * ACE54  48419
          MINUSONE                               * ACE5E
          MINUSONE                               * ACE63
          MINUSONE                               * ACE68
          MINUSONE                               * ACE6D
          'DROPFALSE                             * ACE72
          BINT1                                  * ACE77
          BINT35                                 * ACE7C
          BINT6                                  * ACE81
          BINT9                                  * ACE86
          BINT32                                 * ACE8B
          MINUSONE                               * ACE90
          MINUSONE                               * ACE95
          #       BD24                           * ACE9A  48420
          MINUSONE                               * ACEA4
          MINUSONE                               * ACEA9
          FALSE                                  * ACEAE
          DUP                                    * ACEB3
          'DROPFALSE                             * ACEB8
          #       58                             * ACEBD  88
          BINT35                                 * ACEC7
          BINT37                                 * ACECC
          BINT9                                  * ACED1
          BINT1                                  * ACED6
          {                                      * ACEDB
            BINT9                                * ACEE0
            BINT6                                * ACEE5
            BINT0                                * ACEEA
          }                                      * ACEEF
          BINT4                                  * ACEF4
          #       BD25                           * ACEF9  48421
          MINUSONE                               * ACF03
          MINUSONE                               * ACF08
          MINUSONE                               * ACF0D
          MINUSONE                               * ACF12
          BINT5                                  * ACF17
          DUP                                    * ACF1C
          'DROPFALSE                             * ACF21
          #       BD1D                           * ACF26  48413
          DoInputForm                            * ACF30
          NOT?SEMI                               * ACF35
          ROMPTR  0B5 09F                        * ACF3A
          BINT1                                  * ACF45
          ROMPTR  0B0 0D5                        * ACF4A  ~sFldVal
        ;                                        * ACF55

* ROMPTR 0B4 137
* refs (1): A2437
ROMP_0B4_137:
        ::                                       * ACF5A
          ROMPTR  0B0 0AB                        * ACF5F
          {                                      * ACF6A
            {                                    * ACF6F
              #       BC01                       * ACF74  48129
              ROMPTR  0B4 16E                    * ACF7E
            }                                    * ACF89
            {                                    * ACF8E
              #       BC02                       * ACF93  48130
              ROMPTR  0B4 138                    * ACF9D
            }                                    * ACFA8
            {                                    * ACFAD
              #       BC03                       * ACFB2  48131
              ROMPTR  0B4 15B                    * ACFBC
            }                                    * ACFC7
          }                                      * ACFCC
          ROMPTR  0B0 0A9                        * ACFD1
        ;                                        * ACFDC

* ROMPTR 0B4 138
* refs (1): A2437
ROMP_0B4_138:
        ::                                       * ACFE1
          ROMPTR  0B4 14C                        * ACFE6
          ROMPTR  0B4 139                        * ACFF1
          DROP                                   * ACFFC
        ;                                        * AD001

* ROMPTR 0B4 139
* refs (1): A2437
ROMP_0B4_139:
        ::                                       * AD006
          #       BC05                           * AD00B  48133
          BINT1                                  * AD015
          BINT10                                 * AD01A

* ROMPTR 0B4 13A
* refs (1): A2437
ROMP_0B4_13A:
          ::                                     * AD01F
            #       BC06                         * AD024  48134
            BINT1                                * AD02E
            BINT19                               * AD033
          ;                                      * AD038

* ROMPTR 0B4 13B
* refs (1): A2437
ROMP_0B4_13B:
          ::                                     * AD03D
            $       ":"                          * AD042
            BINT52                               * AD04E
            BINT19                               * AD053
          ;                                      * AD058

* ROMPTR 0B4 13C
* refs (1): A2437
ROMP_0B4_13C:
          ::                                     * AD05D
            $       ":"                          * AD062
            BINT70                               * AD06E
            BINT19                               * AD073
          ;                                      * AD078

* ROMPTR 0B4 13D
* refs (1): A2437
ROMP_0B4_13D:
          ::                                     * AD07D
            #       BC07                         * AD082  48135
            BINT1                                * AD08C
            BINT28                               * AD091
          ;                                      * AD096

* ROMPTR 0B4 13E
* refs (1): A2437
ROMP_0B4_13E:
          ::                                     * AD09B
            #       BC08                         * AD0A0  48136
            BINT1                                * AD0AA
            BINT37                               * AD0AF
          ;                                      * AD0B4

* ROMPTR 0B4 13F
* refs (1): A2437
ROMP_0B4_13F:
          ::                                     * AD0B9
            $       "/"                          * AD0BE
            BINT52                               * AD0CA
            BINT28                               * AD0CF
          ;                                      * AD0D4

* ROMPTR 0B4 140
* refs (1): A2437
ROMP_0B4_140:
          ::                                     * AD0D9
            $       "/"                          * AD0DE
            BINT70                               * AD0EA
            BINT28                               * AD0EF
          ;                                      * AD0F4

* ROMPTR 0B4 141
* refs (1): A2437
ROMP_0B4_141:
          ::                                     * AD0F9
            $       "."                          * AD0FE
            BINT52                               * AD10A
            BINT28                               * AD10F
          ;                                      * AD114

* ROMPTR 0B4 142
* refs (1): A2437
ROMP_0B4_142:
          ::                                     * AD119
            $       "."                          * AD11E
            BINT70                               * AD12A
            BINT28                               * AD12F
          ;                                      * AD134
          'DROPFALSE                             * AD139
          BINT37                                 * AD13E
          BINT8                                  * AD143
          BINT91                                 * AD148
          BINT9                                  * AD14D
          BINT1                                  * AD152
          MINUSONE                               * AD157
          BINT4                                  * AD15C
          #       BC09                           * AD161  48137
          MINUSONE                               * AD16B
          MINUSONE                               * AD170
          MINUSONE                               * AD175
          MINUSONE                               * AD17A

* ROMPTR 0B4 143
* refs (1): A2437
ROMP_0B4_143:
          ::                                     * AD17F
            'DROPFALSE                           * AD184
            BINT37                               * AD189
            BINT17                               * AD18E
            BINT13                               * AD193
            BINT9                                * AD198
            BINT13                               * AD19D
            {                                    * AD1A2
              BINT0                              * AD1A7
            }                                    * AD1AC
            OBJ_38345                            * AD1B1
            ROMPTR  0B4 169                      * AD1B6
            #       BC0A                         * AD1C1  48138
            ROMPTR  0B5 0B4                      * AD1CB
            OBJ_38345                            * AD1D6
            ROMPTR  0B4 169                      * AD1DB
            %12                                  * AD1E6
            MINUSONE                             * AD1EB
          ;                                      * AD1F0

* ROMPTR 0B4 144
* refs (1): A2437
ROMP_0B4_144:
          ::                                     * AD1F5
            OBJ_38345                            * AD1FA
            ROMPTR  0B4 150                      * AD1FF
            BINT55                               * AD20A
            BINT17                               * AD20F
            BINT13                               * AD214
            BINT9                                * AD219
            BINT13                               * AD21E
            {                                    * AD223
              BINT0                              * AD228
            }                                    * AD22D
            OBJ_38345                            * AD232
            ROMPTR  0B4 167                      * AD237
            #       BC0B                         * AD242  48139
            MINUSONE                             * AD24C
            OBJ_38345                            * AD251
            ROMPTR  0B4 167                      * AD256
            %0_2A2B4                             * AD261
            MINUSONE                             * AD266
          ;                                      * AD26B

* ROMPTR 0B4 145
* refs (1): A2437
ROMP_0B4_145:
          ::                                     * AD270
            OBJ_38345                            * AD275
            ROMPTR  0B4 151                      * AD27A
            #       49                           * AD285  73
            BINT17                               * AD28F
            BINT13                               * AD294
            BINT9                                * AD299
            BINT13                               * AD29E
            {                                    * AD2A3
              BINT0                              * AD2A8
            }                                    * AD2AD
            OBJ_38345                            * AD2B2
            ROMPTR  0B4 168                      * AD2B7
            #       BC0C                         * AD2C2  48140
            MINUSONE                             * AD2CC
            OBJ_38345                            * AD2D1
            ROMPTR  0B4 168                      * AD2D6
            %0_2A2B4                             * AD2E1
            MINUSONE                             * AD2E6
          ;                                      * AD2EB

* ROMPTR 0B4 146
* refs (1): A2437
ROMP_0B4_146:
          ::                                     * AD2F0
            'DROPFALSE                           * AD2F5
            #       5E                           * AD2FA  94
            BINT17                               * AD304
            BINT31                               * AD309
            BINT9                                * AD30E
            BINT12                               * AD313
            MINUSONE                             * AD318
            BINT33                               * AD31D
            #       BC0D                         * AD322  48141
            ROMPTR  0B5 0B5                      * AD32C
            BINT17                               * AD337
            ROMPTR  0B5 0B7                      * AD33C
            MINUSONE                             * AD347
          ;                                      * AD34C

* ROMPTR 0B4 147
* refs (1): A2437
ROMP_0B4_147:
          ::                                     * AD351
            OBJ_38345                            * AD356
            ROMPTR  0B4 152                      * AD35B
            BINT37                               * AD366
            BINT26                               * AD36B
            BINT13                               * AD370
            BINT9                                * AD375
            BINT13                               * AD37A
            {                                    * AD37F
              BINT0                              * AD384
            }                                    * AD389
            OBJ_38345                            * AD38E
            ROMPTR  0B4 16A                      * AD393
            #       BC0E                         * AD39E  48142
            MINUSONE                             * AD3A8
            BINT17                               * AD3AD
            %1                                   * AD3B2
            MINUSONE                             * AD3B7
          ;                                      * AD3BC

* ROMPTR 0B4 148
* refs (1): A2437
ROMP_0B4_148:
          ::                                     * AD3C1
            OBJ_38345                            * AD3C6
            ROMPTR  0B4 155                      * AD3CB
            BINT55                               * AD3D6
            BINT26                               * AD3DB
            BINT13                               * AD3E0
            BINT9                                * AD3E5
            BINT13                               * AD3EA
            {                                    * AD3EF
              BINT0                              * AD3F4
            }                                    * AD3F9
            OBJ_38345                            * AD3FE
            ROMPTR  0B4 16B                      * AD403
            #       BC0F                         * AD40E  48143
            MINUSONE                             * AD418
            BINT17                               * AD41D
            %1                                   * AD422
            MINUSONE                             * AD427
          ;                                      * AD42C

* ROMPTR 0B4 149
* refs (1): A2437
ROMP_0B4_149:
          ::                                     * AD431
            OBJ_38345                            * AD436
            ROMPTR  0B4 156                      * AD43B
            BINT37                               * AD446
            BINT26                               * AD44B
            BINT13                               * AD450
            BINT9                                * AD455
            BINT13                               * AD45A
            {                                    * AD45F
              BINT0                              * AD464
            }                                    * AD469
            OBJ_38345                            * AD46E
            ROMPTR  0B4 16B                      * AD473
            #       BC0F                         * AD47E  48143
            MINUSONE                             * AD488
            BINT17                               * AD48D
            %1                                   * AD492
            MINUSONE                             * AD497
          ;                                      * AD49C

* ROMPTR 0B4 14A
* refs (1): A2437
ROMP_0B4_14A:
          ::                                     * AD4A1
            OBJ_38345                            * AD4A6
            ROMPTR  0B4 153                      * AD4AB
            BINT55                               * AD4B6
            BINT26                               * AD4BB
            BINT13                               * AD4C0
            BINT9                                * AD4C5
            BINT13                               * AD4CA
            {                                    * AD4CF
              BINT0                              * AD4D4
            }                                    * AD4D9
            OBJ_38345                            * AD4DE
            ROMPTR  0B4 16A                      * AD4E3
            #       BC0E                         * AD4EE  48142
            MINUSONE                             * AD4F8
            BINT17                               * AD4FD
            %1                                   * AD502
            MINUSONE                             * AD507
          ;                                      * AD50C

* ROMPTR 0B4 14B
* refs (1): A2437
ROMP_0B4_14B:
          ::                                     * AD511
            OBJ_38345                            * AD516
            ROMPTR  0B4 158                      * AD51B
            #       49                           * AD526  73
            BINT26                               * AD530
            BINT13                               * AD535
            BINT9                                * AD53A
            BINT13                               * AD53F
            {                                    * AD544
              BINT0                              * AD549
            }                                    * AD54E
            BINT4                                * AD553
            #       BC10                         * AD558  48144
            MINUSONE                             * AD562
            BINT4                                * AD567
            %       9.3E1                        * AD56C
            MINUSONE                             * AD581
          ;                                      * AD586
          OBJ_38345                              * AD58B
          ROMPTR  0B4 159                        * AD590
          BINT37                                 * AD59B
          BINT35                                 * AD5A0
          BINT25                                 * AD5A5
          BINT9                                  * AD5AA
          BINT13                                 * AD5AF
          {                                      * AD5B4
            BINT0                                * AD5B9
          }                                      * AD5BE
          OBJ_38345                              * AD5C3
          ROMPTR  0B4 16C                        * AD5C8
          #       BC11                           * AD5D3  48145
          ROMPTR  0B5 0B3                        * AD5DD
          BINT4                                  * AD5E8
          %0_2A2B4                               * AD5ED
          MINUSONE                               * AD5F2
          OBJ_38345                              * AD5F7
          ROMPTR  0B4 15A                        * AD5FC
          BINT64                                 * AD607
          BINT35                                 * AD60C
          BINT43                                 * AD611
          BINT9                                  * AD616
          BINT12                                 * AD61B
          MINUSONE                               * AD620
          OBJ_38345                              * AD625
          ROMPTR  0B4 16D                        * AD62A
          #       BC12                           * AD635  48146
          ROMPTR  0B5 0C6                        * AD63F
          BINT17                                 * AD64A
          ROMPTR  0B5 0C9                        * AD64F
          MINUSONE                               * AD65A
          BINT10                                 * AD65F
          BINT12                                 * AD664
          OBJ_38345                              * AD669
          ROMPTR  0B4 14E                        * AD66E
          #       BC04                           * AD679  48132
          #       BF                             * AD683  191
          ROLL                                   * AD68D
          INNERCOMP                              * AD692
          ROMPTR  0B0 0AA                        * AD697
          DoInputForm                            * AD6A2
          NOTcaseFALSE                           * AD6A7
          ROMPTR  0B4 14D                        * AD6AC
          TRUE                                   * AD6B7
        ;                                        * AD6BC

* ROMPTR 0B4 14C
* refs (1): A2437
ROMP_0B4_14C:
        ::                                       * AD6C1
          MINUSONE                               * AD6C6
          ROMPTR  0B5 0A3                        * AD6CB
          SWAPDROP                               * AD6D6
          %0_2A2B4                               * AD6DB
          SWAP                                   * AD6E0
          ROMPTR  0B5 0A6                        * AD6E5
          3UNROLL                                * AD6F0
          2DUP                                   * AD6F5
          SWAP                                   * AD6FA
          5ROLL                                  * AD6FF
          %0_2A2B4                               * AD704
          ROMPTR  0B5 0C7                        * AD709
          BINT12                                 * AD714
          {}N                                    * AD719
        ;                                        * AD71E

* ROMPTR 0B4 14D
* refs (1): A2437
ROMP_0B4_14D:
        ::                                       * AD723
          ROMPTR  0B4 165                        * AD728
          ITE                                    * AD733
          ::                                     * AD738
            6ROLL                                * AD73D
            DROP                                 * AD742
            6ROLL                                * AD747
            DROP                                 * AD74C
            5ROLL                                * AD751
            5ROLL                                * AD756
            5UNROLL                              * AD75B
            4UNROLL                              * AD760
          ;                                      * AD765
          ::                                     * AD76A
            4ROLL                                * AD76F
            DROP                                 * AD774
            4ROLL                                * AD779
            DROP                                 * AD77E
          ;                                      * AD783
          ROMPTR  0B5 0AC                        * AD788
        ;                                        * AD793

* ROMPTR 0B4 14E
* refs (1): A2437
ROMP_0B4_14E:
        ::                                       * AD798
          BINT5                                  * AD79D
          #<>case                                * AD7A2
          FALSE                                  * AD7A7
          ROMPTR  0B4 14F                        * AD7AC
          TRUE                                   * AD7B7
        ;                                        * AD7BC

* ROMPTR 0B4 14F
* refs (1): A2437
ROMP_0B4_14F:
        ::                                       * AD7C1
          BINT39                                 * AD7C6
          BINT131                                * AD7CB
          MAKEGROB                               * AD7D0
          BINT7                                  * AD7D5
          ONE_DO                                 * AD7DA
          INDEX@                                 * AD7DF
          ROMPTR  0B0 012                        * AD7E4
          LOOP                                   * AD7EF
          ROMPTR  0B4 165                        * AD7F4
          ITE                                    * AD7FF
          ::                                     * AD804
            BINT11                               * AD809
            BINT9                                * AD80E
          ;                                      * AD813
          ::                                     * AD818
            BINT9                                * AD81D
            BINT7                                * AD822
          ;                                      * AD827
          DO                                     * AD82C
          INDEX@                                 * AD831
          ROMPTR  0B0 012                        * AD836
          LOOP                                   * AD841
          FALSE                                  * AD846
        ;                                        * AD84B

* ROMPTR 0B4 151
* refs (2): A2437 A2437
ROMP_0B4_151:
        ::                                       * AD850
          BINT40                                 * AD855
          #<>case                                * AD85A
          FALSE                                  * AD85F
          ROMPTR  0B5 0B2                        * AD864
          4GETLAM                                * AD86F
          ROMPTR  0B0 0C5                        * AD874  ~gFldVal
          COERCE                                 * AD87F
          #1+                                    * AD884
          BINT60                                 * AD889
          #MIN                                   * AD88E
          TRUE                                   * AD893
        ;                                        * AD898

* ROMPTR 0B4 152
* refs (1): A2437
ROMP_0B4_152:
        ::                                       * AD89D
          BINT7                                  * AD8A2
          #=casedrop                             * AD8A7
          ROMPTR  0B4 165                        * AD8AC
          {                                      * AD8B7
            BINT55                               * AD8BC
            ::                                   * AD8C1
              ROMPTR  0B4 165                    * AD8C6
              NOT                                * AD8D1
            ;                                    * AD8D6
            BINT47                               * AD8DB
            ::                                   * AD8E0
              4GETLAM                            * AD8E5
              DUP                                * AD8EA
              ROMPTR  0B0 0C5                    * AD8EF  ~gFldVal
              SWAP                               * AD8FA
              #3+                                * AD8FF
              ROMPTR  0B0 0D5                    * AD904  ~sFldVal
            ;                                    * AD90F
          }                                      * AD914
          EQLookup                               * AD919
          case                                   * AD91E
          ::                                     * AD923
            EVAL                                 * AD928
            TRUE                                 * AD92D
          ;                                      * AD932
          ROMPTR  0B4 154                        * AD937
        ;                                        * AD942

* ROMPTR 0B4 153
* refs (1): A2437
ROMP_0B4_153:
        ::                                       * AD947
          BINT7                                  * AD94C
          #=casedrop                             * AD951
          ::                                     * AD956
            ROMPTR  0B4 165                      * AD95B
            NOT                                  * AD966
          ;                                      * AD96B
          {                                      * AD970
            BINT55                               * AD975
            ROMPTR  0B4 165                      * AD97A
            BINT47                               * AD985
            ::                                   * AD98A
              4GETLAM                            * AD98F
              DUP                                * AD994
              ROMPTR  0B0 0C5                    * AD999  ~gFldVal
              SWAP                               * AD9A4
              #3-                                * AD9A9
              ROMPTR  0B0 0D5                    * AD9AE  ~sFldVal
            ;                                    * AD9B9
          }                                      * AD9BE
          EQLookup                               * AD9C3
          case                                   * AD9C8
          ::                                     * AD9CD
            EVAL                                 * AD9D2
            TRUE                                 * AD9D7
          ;                                      * AD9DC
          ROMPTR  0B4 154                        * AD9E1
        ;                                        * AD9EC

* ROMPTR 0B4 154
* refs (1): A2437
ROMP_0B4_154:
        ::                                       * AD9F1
          {                                      * AD9F6
            BINT26                               * AD9FB
            ROMPTR  0B4 162                      * ADA00
            BINT38                               * ADA0B
            ROMPTR  0B4 163                      * ADA10
            BINT40                               * ADA1B
            ::                                   * ADA20
              ROMPTR  0B5 0B9                    * ADA25
              4GETLAM                            * ADA30
              ROMPTR  0B0 0C5                    * ADA35  ~gFldVal
              COERCE                             * ADA40
              BINT1                              * ADA45
              #MAX                               * ADA4A
              BINT12                             * ADA4F
              #MIN                               * ADA54
            ;                                    * ADA59
          }                                      * ADA5E
          EQLookup                               * ADA63
          case                                   * ADA68
          ::                                     * ADA6D
            EVAL                                 * ADA72
            TRUE                                 * ADA77
          ;                                      * ADA7C
          DROPFALSE                              * ADA81
        ;                                        * ADA86

* ROMPTR 0B4 155
* refs (1): A2437
ROMP_0B4_155:
        ::                                       * ADA8B
          BINT7                                  * ADA90
          #=casedrop                             * ADA95
          ROMPTR  0B4 165                        * ADA9A
          {                                      * ADAA5
            BINT55                               * ADAAA
            ::                                   * ADAAF
              ROMPTR  0B4 165                    * ADAB4
              NOT                                * ADABF
            ;                                    * ADAC4
            BINT47                               * ADAC9
            ::                                   * ADACE
              4GETLAM                            * ADAD3
              DUP                                * ADAD8
              ROMPTR  0B0 0C5                    * ADADD  ~gFldVal
              SWAP                               * ADAE8
              #1+                                * ADAED
              ROMPTR  0B0 0D5                    * ADAF2  ~sFldVal
            ;                                    * ADAFD
            BINT40                               * ADB02
            ::                                   * ADB07
              4GETLAM                            * ADB0C
              DUP                                * ADB11
              DUP                                * ADB16
              #1-                                * ADB1B
              ROMPTR  0B0 0C5                    * ADB20  ~gFldVal
              COERCE                             * ADB2B
              SWAP                               * ADB30
              #3+                                * ADB35
              ROMPTR  0B0 0C5                    * ADB3A  ~gFldVal
              COERCE                             * ADB45
              ROMPTR  0B5 0B0                    * ADB4A
              SWAP                               * ADB55
              ROMPTR  0B0 0C5                    * ADB5A  ~gFldVal
              COERCE                             * ADB65
              BINT1                              * ADB6A
              #MAX                               * ADB6F
              OVER                               * ADB74
              LENCOMP                            * ADB79
              #MIN                               * ADB7E
            ;                                    * ADB83
          }                                      * ADB88
          EQLookup                               * ADB8D
          case                                   * ADB92
          ::                                     * ADB97
            EVAL                                 * ADB9C
            TRUE                                 * ADBA1
          ;                                      * ADBA6
          ROMPTR  0B4 157                        * ADBAB
        ;                                        * ADBB6

* ROMPTR 0B4 156
* refs (1): A2437
ROMP_0B4_156:
        ::                                       * ADBBB
          BINT7                                  * ADBC0
          #=casedrop                             * ADBC5
          ::                                     * ADBCA
            ROMPTR  0B4 165                      * ADBCF
            NOT                                  * ADBDA
          ;                                      * ADBDF
          {                                      * ADBE4
            BINT55                               * ADBE9
            ROMPTR  0B4 165                      * ADBEE
            BINT47                               * ADBF9
            ::                                   * ADBFE
              4GETLAM                            * ADC03
              DUP                                * ADC08
              ROMPTR  0B0 0C5                    * ADC0D  ~gFldVal
              SWAP                               * ADC18
              #1-                                * ADC1D
              ROMPTR  0B0 0D5                    * ADC22  ~sFldVal
            ;                                    * ADC2D
            BINT40                               * ADC32
            ::                                   * ADC37
              4GETLAM                            * ADC3C
              DUP                                * ADC41
              DUP                                * ADC46
              #1+                                * ADC4B
              ROMPTR  0B0 0C5                    * ADC50  ~gFldVal
              COERCE                             * ADC5B
              SWAP                               * ADC60
              #2+                                * ADC65
              ROMPTR  0B0 0C5                    * ADC6A  ~gFldVal
              COERCE                             * ADC75
              ROMPTR  0B5 0B0                    * ADC7A
              SWAP                               * ADC85
              ROMPTR  0B0 0C5                    * ADC8A  ~gFldVal
              COERCE                             * ADC95
              BINT1                              * ADC9A
              #MAX                               * ADC9F
              OVER                               * ADCA4
              LENCOMP                            * ADCA9
              #MIN                               * ADCAE
            ;                                    * ADCB3
          }                                      * ADCB8
          EQLookup                               * ADCBD
          case                                   * ADCC2
          ::                                     * ADCC7
            EVAL                                 * ADCCC
            TRUE                                 * ADCD1
          ;                                      * ADCD6
          ROMPTR  0B4 157                        * ADCDB
        ;                                        * ADCE6

* ROMPTR 0B4 157
* refs (1): A2437
ROMP_0B4_157:
        ::                                       * ADCEB
          {                                      * ADCF0
            BINT26                               * ADCF5
            ROMPTR  0B4 162                      * ADCFA
            BINT38                               * ADD05
            ROMPTR  0B4 164                      * ADD0A
          }                                      * ADD15
          EQLookup                               * ADD1A
          case                                   * ADD1F
          ::                                     * ADD24
            EVAL                                 * ADD29
            TRUE                                 * ADD2E
          ;                                      * ADD33
          DROPFALSE                              * ADD38
        ;                                        * ADD3D

* ROMPTR 0B4 158
* refs (1): A2437
ROMP_0B4_158:
        ::                                       * ADD42
          BINT40                                 * ADD47
          #<>case                                * ADD4C
          FALSE                                  * ADD51
          4GETLAM                                * ADD56
          DUP                                    * ADD5B
          ROMPTR  0B0 0C5                        * ADD60  ~gFldVal
          ROMPTR  0B5 0B1                        * ADD6B
          ROMPTR  0B0 06D                        * ADD76
          TRUE                                   * ADD81
        ;                                        * ADD86

* ROMPTR 0B4 159
* refs (1): A2437
ROMP_0B4_159:
        ::                                       * ADD8B
          BINT47                                 * ADD90
          #<>case                                * ADD95
          FALSE                                  * ADD9A
          4GETLAM                                * ADD9F
          #1+                                    * ADDA4
          ROMPTR  0B0 0A2                        * ADDA9
          TRUE                                   * ADDB4
        ;                                        * ADDB9

* ROMPTR 0B4 15A
* refs (1): A2437
ROMP_0B4_15A:
        ::                                       * ADDBE
          BINT55                                 * ADDC3
          #<>case                                * ADDC8
          FALSE                                  * ADDCD
          ROMPTR  0B4 166                        * ADDD2
          TRUE                                   * ADDDD
        ;                                        * ADDE2

* ROMPTR 0B4 15B
* refs (1): A2437
ROMP_0B4_15B:
        ::                                       * ADDE7
          ROMPTR  0B4 13A                        * ADDEC
          ROMPTR  0B4 13B                        * ADDF7
          ROMPTR  0B4 13C                        * ADE02
          ROMPTR  0B4 13D                        * ADE0D
          ROMPTR  0B4 13F                        * ADE18
          ROMPTR  0B4 140                        * ADE23
          $       " "                            * ADE2E
          BINT52                                 * ADE3A
          BINT28                                 * ADE3F
          $       " "                            * ADE44
          BINT70                                 * ADE50
          BINT28                                 * ADE55
          ROMPTR  0B4 141                        * ADE5A
          ROMPTR  0B4 142                        * ADE65
          ROMPTR  0B4 143                        * ADE70
          ROMPTR  0B4 144                        * ADE7B
          ROMPTR  0B4 145                        * ADE86
          ROMPTR  0B4 146                        * ADE91
          ROMPTR  0B4 147                        * ADE9C
          ROMPTR  0B4 148                        * ADEA7
          ROMPTR  0B4 149                        * ADEB2
          ROMPTR  0B4 14A                        * ADEBD
          ROMPTR  0B4 14B                        * ADEC8
          OBJ_38345                              * ADED3
          ROMPTR  0B4 160                        * ADED8
          #       5E                             * ADEE3  94
          BINT26                                 * ADEED
          BINT31                                 * ADEF2
          BINT9                                  * ADEF7
          BINT12                                 * ADEFC
          MINUSONE                               * ADF01
          BINT33                                 * ADF06
          #       BC14                           * ADF0B  48148
          ROMPTR  0B5 0D2                        * ADF15
          BINT17                                 * ADF20
          ROMPTR  0B5 0D3                        * ADF25
          MINUSONE                               * ADF30
          BINT10                                 * ADF35
          DUP                                    * ADF3A
          OBJ_38345                              * ADF3F
          ROMPTR  0B4 15E                        * ADF44
          #       BC13                           * ADF4F  48147
          ROMPTR  0B4 15C                        * ADF59
          BINT10                                 * ADF64
          ROMPTR  0B0 0AA                        * ADF69
          DoInputForm                            * ADF74
          NOT?SEMI                               * ADF79
          ROMPTR  0B4 15D                        * ADF7E
        ;                                        * ADF89

* ROMPTR 0B4 15C
* refs (1): A2437
ROMP_0B4_15C:
        ::                                       * ADF8E
          ROMPTR  0B5 0A3                        * ADF93
          ROMPTR  0B5 0A6                        * ADF9E
          3UNROLL                                * ADFA9
          2DUP                                   * ADFAE
          SWAP                                   * ADFB3
          5ROLL                                  * ADFB8
          ROMPTR  0B5 0AE                        * ADFBD
        ;                                        * ADFC8

* ROMPTR 0B4 15D
* refs (1): A2437
ROMP_0B4_15D:
        ::                                       * ADFCD
          ROMPTR  0B5 0AF                        * ADFD2
          ROMPTR  0B4 165                        * ADFDD
          ITE                                    * ADFE8
          ::                                     * ADFED
            4ROLL                                * ADFF2
            DROP                                 * ADFF7
            4ROLL                                * ADFFC
            DROP                                 * AE001
            3UNROLL                              * AE006
            SWAPROT                              * AE00B
          ;                                      * AE010
          ROTROT2DROP                            * AE015
          ROMPTR  0B5 0A8                        * AE01A
          DUP                                    * AE025
          ROMPTR  0B5 0AD                        * AE02A
          ROMPTR  0B5 0A5                        * AE035
        ;                                        * AE040

* ROMPTR 0B4 15E
* refs (1): A2437
ROMP_0B4_15E:
        ::                                       * AE045
          BINT5                                  * AE04A
          #<>case                                * AE04F
          FALSE                                  * AE054
          ROMPTR  0B4 15F                        * AE059
          TRUE                                   * AE064
        ;                                        * AE069

* ROMPTR 0B4 15F
* refs (1): A2437
ROMP_0B4_15F:
        ::                                       * AE06E
          BINT39                                 * AE073
          BINT131                                * AE078
          MAKEGROB                               * AE07D
          BINT5                                  * AE082
          ONE_DO                                 * AE087
          INDEX@                                 * AE08C
          ROMPTR  0B0 012                        * AE091
          LOOP                                   * AE09C
          ROMPTR  0B4 165                        * AE0A1
          ITE                                    * AE0AC
          ::                                     * AE0B1
            BINT11                               * AE0B6
            BINT9                                * AE0BB
          ;                                      * AE0C0
          ::                                     * AE0C5
            BINT7                                * AE0CA
            BINT5                                * AE0CF
          ;                                      * AE0D4
          DO                                     * AE0D9
          INDEX@                                 * AE0DE
          ROMPTR  0B0 012                        * AE0E3
          LOOP                                   * AE0EE
          FALSE                                  * AE0F3
        ;                                        * AE0F8

* ROMPTR 0B4 160
* refs (1): A2437
ROMP_0B4_160:
        ::                                       * AE0FD
          BINT47                                 * AE102
          #<>case                                * AE107
          FALSE                                  * AE10C
          ROMPTR  0B4 161                        * AE111
          TRUE                                   * AE11C
        ;                                        * AE121

* ROMPTR 0B4 161
* refs (1): A2437
ROMP_0B4_161:
        ::                                       * AE126
          BINT42                                 * AE12B
          BINT10                                 * AE130
          ROMPTR  0B0 0C5                        * AE135  ~gFldVal
          ROMPTR  0B0 09A                        * AE140
          ITE                                    * AE14B
          SetSysFlag                             * AE150
          ClrSysFlag                             * AE155
          ROMPTR  0B4 165                        * AE15A
          ITE                                    * AE165
          ::                                     * AE16A
            BINT9                                * AE16F
            BINT7                                * AE174
            BINT11                               * AE179
            BINT7                                * AE17E
          ;                                      * AE183
          ::                                     * AE188
            BINT7                                * AE18D
            BINT5                                * AE192
            BINT7                                * AE197
            BINT5                                * AE19C
          ;                                      * AE1A1
          HARDBUFF                               * AE1A6
          3UNROLL                                * AE1AB
          DO                                     * AE1B0
          INDEX@                                 * AE1B5
          ROMPTR  0B0 012                        * AE1BA
          LOOP                                   * AE1C5
          DROP                                   * AE1CA
          DO                                     * AE1CF
          INDEX@                                 * AE1D4
          ROMPTR  0B0 0A2                        * AE1D9
          LOOP                                   * AE1E4
        ;                                        * AE1E9

* ROMPTR 0B4 162
* refs (1): A2437
ROMP_0B4_162:
        ::                                       * AE1EE
          4GETLAM                                * AE1F3
          ROMPTR  0B0 030                        * AE1F8
          NOT?SEMI                               * AE203
          ROMPTR  0B0 099                        * AE208
          4GETLAM                                * AE213
          DUPUNROT                               * AE218
          ROMPTR  0B0 0D5                        * AE21D  ~sFldVal
          DUP                                    * AE228
          ROMPTR  0B0 041                        * AE22D
          ROMPTR  0B0 013                        * AE238  IFEDispField
        ;                                        * AE243

* ROMPTR 0B4 163
* refs (1): A2437
ROMP_0B4_163:
        ::                                       * AE248
          4GETLAM                                * AE24D
          DUP                                    * AE252
          ROMPTR  0B0 0C5                        * AE257  ~gFldVal
          %1+                                    * AE262
          DUP                                    * AE267
          %12                                    * AE26C
          %>                                     * AE271
          IT                                     * AE276
          ::                                     * AE27B
            DROP                                 * AE280
            %1                                   * AE285
          ;                                      * AE28A
          OVER                                   * AE28F
          ROMPTR  0B0 0D5                        * AE294  ~sFldVal
          DUP                                    * AE29F
          ROMPTR  0B0 041                        * AE2A4
          ROMPTR  0B0 013                        * AE2AF  IFEDispField
          SetDA123NoCh                           * AE2BA
        ;                                        * AE2BF

* ROMPTR 0B4 164
* refs (1): A2437
ROMP_0B4_164:
        ::                                       * AE2C4
          4GETLAM                                * AE2C9
          DUP                                    * AE2CE
          ROMPTR  0B0 0C5                        * AE2D3  ~gFldVal
          COERCE                                 * AE2DE
          OVER                                   * AE2E3
          #1-                                    * AE2E8
          ROMPTR  0B0 0C5                        * AE2ED  ~gFldVal
          COERCE                                 * AE2F8
          3PICK                                  * AE2FD
          #1+                                    * AE302
          ROMPTR  0B0 0C5                        * AE307  ~gFldVal
          COERCE                                 * AE312
          ROMPTR  0B5 0A9                        * AE317
          SWAP                                   * AE322
          #1+                                    * AE327
          DUPUNROT                               * AE32C
          #<                                     * AE331
          IT                                     * AE336
          DROPONE                                * AE33B
          UNCOERCE                               * AE340
          OVER                                   * AE345
          ROMPTR  0B0 0D5                        * AE34A  ~sFldVal
          DUP                                    * AE355
          ROMPTR  0B0 041                        * AE35A
          ROMPTR  0B0 013                        * AE365  IFEDispField
          SetDA123NoCh                           * AE370
        ;                                        * AE375

* ROMPTR 0B4 165
* refs (1): A2437
ROMP_0B4_165:
        ::                                       * AE37A
          BINT42                                 * AE37F
          TestSysFlag                            * AE384
        ;                                        * AE389

* ROMPTR 0B4 166
* refs (1): A2437
ROMP_0B4_166:
        ::                                       * AE38E
          BINT11                                 * AE393
          ROMPTR  0B0 0C5                        * AE398  ~gFldVal
          %0<>                                   * AE3A3
        ;                                        * AE3A8

* ROMPTR 0B4 168
* refs (2): A2437 A2437
ROMP_0B4_168:
        ::                                       * AE3AD
          DUP                                    * AE3B2
          BINT4                                  * AE3B7
          ROMPTR  0B0 074                        * AE3BC
          SWAP                                   * AE3C7
          %9                                     * AE3CC
          %>                                     * AE3D1
          ?SEMI                                  * AE3D6
          CHR_0                                  * AE3DB
          >H$                                    * AE3E0
        ;                                        * AE3E5

* ROMPTR 0B4 16B
* refs (3): A2437 A2437 A2437
ROMP_0B4_16B:
        ::                                       * AE3EA
          DUP                                    * AE3EF
          BINT4                                  * AE3F4
          ROMPTR  0B0 074                        * AE3F9
          SWAP                                   * AE404
          %9                                     * AE409
          %>                                     * AE40E
          ?SEMI                                  * AE413
          CHR_Space                              * AE418
          >H$                                    * AE41D
        ;                                        * AE422

* ROMPTR 0B4 16C
* refs (1): A2437
ROMP_0B4_16C:
        ::                                       * AE427
          DUP                                    * AE42C
          %0=                                    * AE431
          casedrop                               * AE436
          ::                                     * AE43B
            #       BC1C                         * AE440  48156
            JstGetTHEMESG                        * AE44A
          ;                                      * AE44F
          BINT4                                  * AE454
          ROMPTR  0B0 074                        * AE459
          DUPLEN$                                * AE464
          BINT4                                  * AE469
          2DUP                                   * AE46E
          #<                                     * AE473
          NOTcase2DROP                           * AE478
          SWAP#-                                 * AE47D
          Blank$                                 * AE482
          SWAP&$                                 * AE487
        ;                                        * AE48C

* ROMPTR 0B4 16D
* refs (1): A2437
ROMP_0B4_16D:
        ::                                       * AE491
          ROMPTR  0B4 166                        * AE496
          NOTcasedrop                            * AE4A1
          NULL$                                  * AE4A6
          4GETLAM                                * AE4AB
          #1-                                    * AE4B0
          ROMPTR  0B0 0C5                        * AE4B5  ~gFldVal
          %1                                     * AE4C0
          %=                                     * AE4C5
          case                                   * AE4CA
          ::                                     * AE4CF
            ROMPTR  0B0 098                      * AE4D4
            JstGetTHEMESG                        * AE4DF
          ;                                      * AE4E4
          ROMPTR  0B5 0D1                        * AE4E9
          SWAP                                   * AE4F4
          ROMPTR  0B0 099                        * AE4F9
          NTHCOMPDROP                            * AE504
          JstGetTHEMESG                          * AE509
        ;                                        * AE50E

* ROMPTR 0B4 16E
* refs (1): A2437
ROMP_0B4_16E:
        ::                                       * AE513
          TakeOver                               * AE518
          OBJ_38345                              * AE51D
          ROMPTR  0B4 16F                        * AE522
          #       BC3B                           * AE52D  48187
          OBJ_38345                              * AE537
          ROMPTR  0B5 0D7                        * AE53C
          NULL{}                                 * AE547
          BINT1                                  * AE54C
          ROMPTR  0B3 000                        * AE551  ~Choose
          caseDROP                               * AE55C
        ;                                        * AE561
