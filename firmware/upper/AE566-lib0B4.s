* HP 48GX ROM revision R, #AE566-#B1605: Library part 0B4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #AE566 in the original ROM).
        RPL

* ROMPTR 0B4 16F
* refs (1): A2437
ROMP_0B4_16F:
        ::                                       * AE566
          {                                      * AE56B
            BINT60                               * AE570
            TRUE                                 * AE575
            BINT62                               * AE57A
            ROMPTR  0B5 0D5                      * AE57F
            OBJ_64C34                            * AE58A
            ROMPTR  0B5 0D6                      * AE58F
            BINT81                               * AE59A
            ROMPTR  0B4 170                      * AE59F
            BINT83                               * AE5AA
            ::                                   * AE5AF
              '                                  * AE5B4
              ROMPTR  0B4 171                    * AE5B9
            ;                                    * AE5C4
            BINT96                               * AE5C9
            ::                                   * AE5CE
              ROMPTR  0B3 03E                    * AE5D3  ~BBReReadNElems
              TRUE                               * AE5DE
            ;                                    * AE5E3
          }                                      * AE5E8
          EQLookup                               * AE5ED
          case                                   * AE5F2
          ::                                     * AE5F7
            EVAL                                 * AE5FC
            TRUE                                 * AE601
          ;                                      * AE606
          DROPFALSE                              * AE60B
        ;                                        * AE610

* ROMPTR 0B4 170
* refs (1): A2437
ROMP_0B4_170:
        ::                                       * AE615
          ROMPTR  0B3 038                        * AE61A  ~BBGetNStr
          DUP                                    * AE625
          _chr(31)_                              * AE62A
          EQUAL                                  * AE62F
          ITE                                    * AE634
          ::                                     * AE639
            NULL$                                * AE63E
            DUP                                  * AE643
          ;                                      * AE648
          ::                                     * AE64D
            DUP                                  * AE652
            BINT1                                * AE657
            BINT3                                * AE65C
            SUB$                                 * AE661
            OVER                                 * AE666
            BINT5                                * AE66B
            BINT24                               * AE670
            SUB$                                 * AE675
            ROT                                  * AE67A
            BINT26                               * AE67F
            OVERLEN$                             * AE684
            SUB$                                 * AE689
          ;                                      * AE68E
          7GETLAM                                * AE693
          8GETLAM                                * AE698
          MAKEGROB                               * AE69D
          4ROLL                                  * AE6A2
          $>grob                                 * AE6A7
          OVER                                   * AE6AC
          BINT1                                  * AE6B1
          BINT2                                  * AE6B6
          GROB!                                  * AE6BB
          ROT                                    * AE6C0
          $>grob                                 * AE6C5
          OVER                                   * AE6CA
          BINT19                                 * AE6CF
          BINT2                                  * AE6D4
          GROB!                                  * AE6D9
          SWAP                                   * AE6DE
          DUPLEN$                                * AE6E3
          BINT5                                  * AE6E8
          8GETLAM                                * AE6ED
          BINT131                                * AE6F2
          #<>                                    * AE6F7
          IT                                     * AE6FC
          #1-                                    * AE701
          DUPUNROT                               * AE706
          #>ITE                                  * AE70B
          ::                                     * AE710
            1_#1-SUB$                            * AE715
            CHR_...                              * AE71A
            >T$                                  * AE71F
          ;                                      * AE724
          DROP                                   * AE729
          $>GROB                                 * AE72E
          OVER                                   * AE733
          BINT100                                * AE738
          BINT1                                  * AE73D
          GROB!                                  * AE742
        ;                                        * AE747

* ROMPTR 0B4 171
* refs (1): A2437
ROMP_0B4_171:
        ::                                       * AE74C
          NoExitAction                           * AE751
          {                                      * AE756
            {                                    * AE75B
              ::                                 * AE760
                TakeOver                         * AE765
                12GETLAM                         * AE76A
                #0<>                             * AE76F
                ITE                              * AE774
                ::                               * AE779
                  PTR     DirLabel:              * AE77E
                  $       "EDIT"                 * AE783
                ;                                * AE795
                NULL$                            * AE79A
              ;                                  * AE79F
              ROMPTR  0B4 172                    * AE7A4
            }                                    * AE7AF
            {                                    * AE7B4
              ::                                 * AE7B9
                PTR     DirLabel:                * AE7BE
                $       "NEW"                    * AE7C3
              ;                                  * AE7D3
              ROMPTR  0B4 173                    * AE7D8
            }                                    * AE7E3
            {                                    * AE7E8
              ::                                 * AE7ED
                TakeOver                         * AE7F2
                12GETLAM                         * AE7F7
                #0<>                             * AE7FC
                ITE                              * AE801
                $       "PURG"                   * AE806
                NULL$                            * AE818
              ;                                  * AE81D
              ROMPTR  0B4 174                    * AE822
            }                                    * AE82D
            NullMenuKey                          * AE832
            NullMenuKey                          * AE837
            {                                    * AE83C
              $       "OK"                       * AE841
              ROMPTR  0B3 02E                    * AE84F  DoCKeyOK
            }                                    * AE85A
          }                                      * AE85F
        ;                                        * AE864

* ROMPTR 0B4 172
* refs (1): A2437
ROMP_0B4_172:
        ::                                       * AE869
          TakeOver                               * AE86E
          12GETLAM                               * AE873
          #0=case                                * AE878
          DoBadKey                               * AE87D
          18GETLAM                               * AE882
          ROMPTR  0B3 03F                        * AE887  ~BBGetN
          1LAMBIND                               * AE892
          1GETLAM                                * AE897
          ROMPTR  0B5 0D8                        * AE89C
          1GETLAM                                * AE8A7
          ROMPTR  0B5 0D9                        * AE8AC
          1GETLAM                                * AE8B7
          ROMPTR  0B5 0DA                        * AE8BC
          3UNROLL                                * AE8C7
          2DUP                                   * AE8CC
          SWAP                                   * AE8D1
          5ROLL                                  * AE8D6
          1GETLAM                                * AE8DB
          ROMPTR  0B5 0DB                        * AE8E0
          BINT12                                 * AE8EB
          {}N                                    * AE8F0
          ROMPTR  0B4 139                        * AE8F5
          NOT?SEMI                               * AE900
          1GETABND                               * AE905
          ROMPTR  0B5 0DC                        * AE90A
          ROMPTR  0B3 03E                        * AE915  ~BBReReadNElems
          ROMPTR  0B3 026                        * AE920  ~BBReReadWidth
          18GETLAM                               * AE92B
          12GETLAM                               * AE930
          #MIN                                   * AE935
          BINT1                                  * AE93A
          #MAX                                   * AE93F
          18PUTLAM                               * AE944
          FALSE                                  * AE949
          ROMPTR  0B3 019                        * AE94E  ~BBRecalOff&Disp
        ;                                        * AE959

* ROMPTR 0B4 173
* refs (1): A2437
ROMP_0B4_173:
        ::                                       * AE95E
          TakeOver                               * AE963
          ROMPTR  0B4 14C                        * AE968
          ROMPTR  0B4 139                        * AE973
          NOT?SEMI                               * AE97E
          ROMPTR  0B3 03E                        * AE983  ~BBReReadNElems
          ROMPTR  0B3 026                        * AE98E  ~BBReReadWidth
          18GETLAM                               * AE999
          12GETLAM                               * AE99E
          #MIN                                   * AE9A3
          BINT1                                  * AE9A8
          #MAX                                   * AE9AD
          18PUTLAM                               * AE9B2
          FALSE                                  * AE9B7
          ROMPTR  0B3 019                        * AE9BC  ~BBRecalOff&Disp
        ;                                        * AE9C7

* ROMPTR 0B4 174
* refs (1): A2437
ROMP_0B4_174:
        ::                                       * AE9CC
          TakeOver                               * AE9D1
          12GETLAM                               * AE9D6
          #0=case                                * AE9DB
          DoBadKey                               * AE9E0
          18GETLAM                               * AE9E5
          ROMPTR  0B3 03F                        * AE9EA  ~BBGetN
          ROMPTR  0B5 0DC                        * AE9F5
          ROMPTR  0B3 03E                        * AEA00  ~BBReReadNElems
          ROMPTR  0B3 026                        * AEA0B  ~BBReReadWidth
          18GETLAM                               * AEA16
          12GETLAM                               * AEA1B
          #MIN                                   * AEA20
          BINT1                                  * AEA25
          #MAX                                   * AEA2A
          18PUTLAM                               * AEA2F
          FALSE                                  * AEA34
          ROMPTR  0B3 019                        * AEA39  ~BBRecalOff&Disp
        ;                                        * AEA44

* ROMPTR 0B4 175
* refs (1): A2437
ROMP_0B4_175:
        ::                                       * AEA49
          ROMPTR  0B0 0AB                        * AEA4E
          {                                      * AEA59
            {                                    * AEA5E
              #       BB01                       * AEA63  47873
              ROMPTR  0B4 176                    * AEA6D
            }                                    * AEA78
            {                                    * AEA7D
              #       BB02                       * AEA82  47874
              ROMPTR  0B4 17D                    * AEA8C
            }                                    * AEA97
            {                                    * AEA9C
              #       BB03                       * AEAA1  47875
              ROMPTR  0B4 17F                    * AEAAB
            }                                    * AEAB6
            {                                    * AEABB
              #       BB04                       * AEAC0  47876
              ROMPTR  0B4 18F                    * AEACA
            }                                    * AEAD5
          }                                      * AEADA
          ROMPTR  0B0 0A9                        * AEADF
        ;                                        * AEAEA

* ROMPTR 0B4 176
* refs (1): A2437
ROMP_0B4_176:
        ::                                       * AEAEF

* ROMPTR 0B4 177
* refs (1): A2437
ROMP_0B4_177:
          ::                                     * AEAF4
            #       BB06                         * AEAF9  47878
            BINT1                                * AEB03
            BINT10                               * AEB08
          ;                                      * AEB0D

* ROMPTR 0B4 178
* refs (1): A2437
ROMP_0B4_178:
          ::                                     * AEB12
            #       BE17                         * AEB17  48663
            BINT97                               * AEB21
            BINT10                               * AEB26
          ;                                      * AEB2B
          #       BB07                           * AEB30  47879
          BINT1                                  * AEB3A
          BINT19                                 * AEB3F
          #       BB08                           * AEB44  47880
          BINT14                                 * AEB4E
          BINT28                                 * AEB53
          #       BB09                           * AEB58  47881
          BINT56                                 * AEB62
          BINT28                                 * AEB67
          #       BB0A                           * AEB6C  47882
          BINT98                                 * AEB76
          BINT28                                 * AEB7B
          #       BB0B                           * AEB80  47883
          BINT14                                 * AEB8A
          BINT37                                 * AEB8F
          #       BB0C                           * AEB94  47884
          BINT56                                 * AEB9E
          BINT37                                 * AEBA3
          #       BB0D                           * AEBA8  47885
          BINT98                                 * AEBB2
          BINT37                                 * AEBB7

* ROMPTR 0B4 179
* refs (1): A2437
ROMP_0B4_179:
          ::                                     * AEBBC
            OBJ_38345                            * AEBC1
            ROMPTR  0B4 031                      * AEBC6
            BINT22                               * AEBD1
            BINT8                                * AEBD6
            BINT67                               * AEBDB
            BINT9                                * AEBE0
            BINT21                               * AEBE5
            {                                    * AEBEA
              BINT3                              * AEBEF
            }                                    * AEBF4
            BINT4                                * AEBF9
            #       BB0E                         * AEBFE  47886
            #       BE1A                         * AEC08  48666
            MINUSONE                             * AEC12
            MINUSONE                             * AEC17
            ROMPTR  0B5 0DD                      * AEC1C
          ;                                      * AEC27

* ROMPTR 0B4 17A
* refs (1): A2437
ROMP_0B4_17A:
          ::                                     * AEC2C
            'DROPFALSE                           * AEC31
            BINT115                              * AEC36
            BINT8                                * AEC3B
            BINT13                               * AEC40
            BINT9                                * AEC45
            BINT1                                * AEC4A
            {                                    * AEC4F
              BINT0                              * AEC54
            }                                    * AEC59
            BINT4                                * AEC5E
            #       BB0F                         * AEC63  47887
            MINUSONE                             * AEC6D
            MINUSONE                             * AEC72
            %1                                   * AEC77
            ROMPTR  0B5 0E0                      * AEC7C
            DROP                                 * AEC87
          ;                                      * AEC8C
          'DROPFALSE                             * AEC91
          BINT22                                 * AEC96
          BINT17                                 * AEC9B
          BINT61                                 * AECA0
          BINT9                                  * AECA5
          BINT12                                 * AECAA
          MINUSONE                               * AECAF
          BINT17                                 * AECB4
          #       BB10                           * AECB9  47888
          ROMPTR  0B5 0F2                        * AECC3
          BINT17                                 * AECCE
          ROMPTR  0B5 0F3                        * AECD3
          DUP                                    * AECDE
          'DROPFALSE                             * AECE3
          BINT7                                  * AECE8
          BINT26                                 * AECED
          BINT6                                  * AECF2
          BINT9                                  * AECF7
          BINT32                                 * AECFC
          MINUSONE                               * AED01
          MINUSONE                               * AED06
          #       BB11                           * AED0B  47889
          MINUSONE                               * AED15
          MINUSONE                               * AED1A
          FALSE                                  * AED1F
          DUP                                    * AED24
          'DROPFALSE                             * AED29
          BINT49                                 * AED2E
          BINT26                                 * AED33
          BINT6                                  * AED38
          BINT9                                  * AED3D
          BINT32                                 * AED42
          MINUSONE                               * AED47
          MINUSONE                               * AED4C
          #       BB12                           * AED51  47890
          MINUSONE                               * AED5B
          MINUSONE                               * AED60
          FALSE                                  * AED65
          DUP                                    * AED6A
          'DROPFALSE                             * AED6F
          BINT91                                 * AED74
          BINT26                                 * AED79
          BINT6                                  * AED7E
          BINT9                                  * AED83
          BINT32                                 * AED88
          MINUSONE                               * AED8D
          MINUSONE                               * AED92
          #       BB13                           * AED97  47891
          MINUSONE                               * AEDA1
          MINUSONE                               * AEDA6
          FALSE                                  * AEDAB
          DUP                                    * AEDB0
          'DROPFALSE                             * AEDB5
          BINT7                                  * AEDBA
          BINT35                                 * AEDBF
          BINT6                                  * AEDC4
          BINT9                                  * AEDC9
          BINT32                                 * AEDCE
          MINUSONE                               * AEDD3
          MINUSONE                               * AEDD8
          #       BB14                           * AEDDD  47892
          MINUSONE                               * AEDE7
          MINUSONE                               * AEDEC
          FALSE                                  * AEDF1
          DUP                                    * AEDF6
          'DROPFALSE                             * AEDFB
          BINT49                                 * AEE00
          BINT35                                 * AEE05
          BINT6                                  * AEE0A
          BINT9                                  * AEE0F
          BINT32                                 * AEE14
          MINUSONE                               * AEE19
          MINUSONE                               * AEE1E
          #       BB15                           * AEE23  47893
          MINUSONE                               * AEE2D
          MINUSONE                               * AEE32
          FALSE                                  * AEE37
          DUP                                    * AEE3C
          'DROPFALSE                             * AEE41
          BINT91                                 * AEE46
          BINT35                                 * AEE4B
          BINT6                                  * AEE50
          BINT9                                  * AEE55
          BINT32                                 * AEE5A
          MINUSONE                               * AEE5F
          MINUSONE                               * AEE64
          #       BB16                           * AEE69  47894
          MINUSONE                               * AEE73
          MINUSONE                               * AEE78
          FALSE                                  * AEE7D
          DUP                                    * AEE82
          BINT9                                  * AEE87
          DUP                                    * AEE8C
          'DROPFALSE                             * AEE91
          #       BB05                           * AEE96  47877
          DoInputForm                            * AEEA0
          NOT?SEMI                               * AEEA5
          ROMPTR  0B4 17B                        * AEEAA
          ROMPTR  0B4 17C                        * AEEB5
        ;                                        * AEEC0

* ROMPTR 0B4 17B
* refs (1): A2437
ROMP_0B4_17B:
        ::                                       * AEEC5
          8PICK                                  * AEECA
          ROMPTR  0B5 0E0                        * AEECF
          SWAPDROP                               * AEEDA
          ROMPTR  0B5 0E1                        * AEEDF
          BINT9                                  * AEEEA
          ROLL                                   * AEEEF
          ROMPTR  0B5 0DE                        * AEEF4
          7ROLL                                  * AEEFF
          ROMPTR  0B0 099                        * AEF04
          7UNROLL                                * AEF0F
        ;                                        * AEF14

* ROMPTR 0B4 17C
* refs (1): A2437
ROMP_0B4_17C:
        ::                                       * AEF19
          {                                      * AEF1E
            NULLLAM                              * AEF23
            NULLLAM                              * AEF28
            NULLLAM                              * AEF2D
            NULLLAM                              * AEF32
            NULLLAM                              * AEF37
            NULLLAM                              * AEF3C
            NULLLAM                              * AEF41
            NULLLAM                              * AEF46
          }                                      * AEF4B
          BIND                                   * AEF50
          6GETLAM                                * AEF55
          IT                                     * AEF5A
          ::                                     * AEF5F
            8GETLAM                              * AEF64
            7GETLAM                              * AEF69
            ROMPTR  0B5 0E2                      * AEF6E
            #       BB08                         * AEF79  47880
            OBJ_15909                            * AEF83
          ;                                      * AEF88
          5GETLAM                                * AEF8D
          IT                                     * AEF92
          ::                                     * AEF97
            8GETLAM                              * AEF9C
            7GETLAM                              * AEFA1
            ROMPTR  0B5 0E3                      * AEFA6
            #       BB09                         * AEFB1  47881
            OBJ_15909                            * AEFBB
          ;                                      * AEFC0
          4GETLAM                                * AEFC5
          IT                                     * AEFCA
          ::                                     * AEFCF
            8GETLAM                              * AEFD4
            7GETLAM                              * AEFD9
            ROMPTR  0B5 0E4                      * AEFDE
            #       BB0A                         * AEFE9  47882
            OBJ_15909                            * AEFF3
          ;                                      * AEFF8
          3GETLAM                                * AEFFD
          IT                                     * AF002
          ::                                     * AF007
            8GETLAM                              * AF00C
            7GETLAM                              * AF011
            ROMPTR  0B5 0E5                      * AF016
            #       BB0B                         * AF021  47883
            OBJ_15909                            * AF02B
          ;                                      * AF030
          2GETLAM                                * AF035
          IT                                     * AF03A
          ::                                     * AF03F
            8GETLAM                              * AF044
            7GETLAM                              * AF049
            ROMPTR  0B5 0E6                      * AF04E
            #       BB0C                         * AF059  47884
            OBJ_15909                            * AF063
          ;                                      * AF068
          1GETLAM                                * AF06D
          IT                                     * AF072
          ::                                     * AF077
            8GETLAM                              * AF07C
            7GETLAM                              * AF081
            ROMPTR  0B5 0E7                      * AF086
            #       BB0D                         * AF091  47885
            OBJ_15909                            * AF09B
          ;                                      * AF0A0
          ABND                                   * AF0A5
        ;                                        * AF0AA

* ROMPTR 0B4 17D
* refs (1): A2437
ROMP_0B4_17D:
        ::                                       * AF0AF
          ROMPTR  0B4 177                        * AF0B4
          ROMPTR  0B4 178                        * AF0BF
          #       BB1A                           * AF0CA  47898
          BINT1                                  * AF0D4
          BINT19                                 * AF0D9
          #       BB1B                           * AF0DE  47899
          BINT1                                  * AF0E8
          BINT28                                 * AF0ED
          #       BB1C                           * AF0F2  47900
          BINT64                                 * AF0FC
          BINT28                                 * AF101
          ROMPTR  0B4 179                        * AF106
          ROMPTR  0B4 17A                        * AF111
          'DROPFALSE                             * AF11C
          BINT40                                 * AF121
          BINT17                                 * AF126
          BINT49                                 * AF12B
          BINT9                                  * AF130
          BINT1                                  * AF135
          {                                      * AF13A
            BINT0                                * AF13F
          }                                      * AF144
          BINT4                                  * AF149
          #       BB1D                           * AF14E  47901
          MINUSONE                               * AF158
          MINUSONE                               * AF15D
          %       -6.5E0                         * AF162
          DUP                                    * AF177
          'DROPFALSE                             * AF17C
          BINT40                                 * AF181
          BINT26                                 * AF186
          BINT13                                 * AF18B
          BINT9                                  * AF190
          BINT1                                  * AF195
          {                                      * AF19A
            BINT0                                * AF19F
          }                                      * AF1A4
          BINT4                                  * AF1A9
          #       BB1E                           * AF1AE  47902
          MINUSONE                               * AF1B8
          MINUSONE                               * AF1BD
          %13                                    * AF1C2
          DUP                                    * AF1C7
          'DROPFALSE                             * AF1CC
          #       67                             * AF1D1  103
          BINT26                                 * AF1DB
          BINT25                                 * AF1E0
          BINT9                                  * AF1E5
          BINT1                                  * AF1EA
          {                                      * AF1EF
            BINT0                                * AF1F4
          }                                      * AF1F9
          BINT4                                  * AF1FE
          #       BB1F                           * AF203  47903
          MINUSONE                               * AF20D
          MINUSONE                               * AF212
          %1                                     * AF217
          DUP                                    * AF21C
          BINT5                                  * AF221
          DUP                                    * AF226
          'DROPFALSE                             * AF22B
          #       BB19                           * AF230  47897
          DoInputForm                            * AF23A
          NOT?SEMI                               * AF23F
          ROMPTR  0B4 17E                        * AF244
          ROMPTR  0B5 0E8                        * AF24F
        ;                                        * AF25A

* ROMPTR 0B4 17E
* refs (1): A2437
ROMP_0B4_17E:
        ::                                       * AF25F
          5ROLL                                  * AF264
          ROMPTR  0B5 0DE                        * AF269
          4PICK                                  * AF274
          ROMPTR  0B5 0E0                        * AF279
          SWAPDROP                               * AF284
          ROMPTR  0B5 0E1                        * AF289
        ;                                        * AF294

* ROMPTR 0B4 17F
* refs (1): A2437
ROMP_0B4_17F:
        ::                                       * AF299
          ROMPTR  0B4 177                        * AF29E

* ROMPTR 0B4 180
* refs (1): A2437
ROMP_0B4_180:
          ::                                     * AF2A9
            #       BB21                         * AF2AE  47905
            BINT1                                * AF2B8
            BINT19                               * AF2BD
          ;                                      * AF2C2

* ROMPTR 0B4 181
* refs (1): A2437
ROMP_0B4_181:
          ::                                     * AF2C7
            #       BB22                         * AF2CC  47906
            BINT49                               * AF2D6
            BINT19                               * AF2DB
          ;                                      * AF2E0

* ROMPTR 0B4 182
* refs (1): A2437
ROMP_0B4_182:
          ::                                     * AF2E5
            #       BB23                         * AF2EA  47907
            BINT1                                * AF2F4
            BINT28                               * AF2F9
          ;                                      * AF2FE

* ROMPTR 0B4 183
* refs (1): A2437
ROMP_0B4_183:
          ::                                     * AF303
            OBJ_38345                            * AF308
            ROMPTR  0B4 031                      * AF30D
            BINT28                               * AF318
            BINT8                                * AF31D
            #       67                           * AF322  103
            BINT9                                * AF32C
            BINT21                               * AF331
            {                                    * AF336
              BINT3                              * AF33B
            }                                    * AF340
            BINT4                                * AF345
            #       BB0E                         * AF34A  47886
            #       BE1A                         * AF354  48666
            MINUSONE                             * AF35E
            MINUSONE                             * AF363
            ROMPTR  0B5 0DD                      * AF368
          ;                                      * AF373

* ROMPTR 0B4 184
* refs (1): A2437
ROMP_0B4_184:
          ::                                     * AF378
            'DROPFALSE                           * AF37D
            BINT28                               * AF382
            BINT17                               * AF387
            BINT13                               * AF38C
            BINT9                                * AF391
            BINT1                                * AF396
            {                                    * AF39B
              BINT0                              * AF3A0
            }                                    * AF3A5
            BINT4                                * AF3AA
            #       BB24                         * AF3AF  47908
            MINUSONE                             * AF3B9
            MINUSONE                             * AF3BE
            %1                                   * AF3C3
            ROMPTR  0B5 0E0                      * AF3C8
            'DROPFALSE                           * AF3D3
            #       49                           * AF3D8  73
            BINT17                               * AF3E2
            BINT13                               * AF3E7
            BINT9                                * AF3EC
            BINT1                                * AF3F1
            {                                    * AF3F6
              BINT0                              * AF3FB
            }                                    * AF400
            BINT4                                * AF405
            #       BB25                         * AF40A  47909
            MINUSONE                             * AF414
            MINUSONE                             * AF419
            %2                                   * AF41E
            BINT13                               * AF423
            ROLL                                 * AF428
          ;                                      * AF42D

* ROMPTR 0B4 185
* refs (1): A2437
ROMP_0B4_185:
          ::                                     * AF432
            'DROPFALSE                           * AF437
            BINT28                               * AF43C
            BINT26                               * AF441
            BINT91                               * AF446
            BINT9                                * AF44B
            BINT12                               * AF450
            MINUSONE                             * AF455
            BINT17                               * AF45A
            #       BB26                         * AF45F  47910
            ROMPTR  0B5 0F5                      * AF469
            BINT17                               * AF474
            ROMPTR  0B5 0F6                      * AF479
            ROMPTR  0B5 0DF                      * AF484
          ;                                      * AF48F
          BINT4                                  * AF494
          DUP                                    * AF499
          OBJ_38345                              * AF49E
          ROMPTR  0B4 187                        * AF4A3
          #       BB20                           * AF4AE  47904
          DoInputForm                            * AF4B8
          NOT?SEMI                               * AF4BD
          ROMPTR  0B4 186                        * AF4C2
          ROMPTR  0B5 0E9                        * AF4CD
          SWAP                                   * AF4D8
          #       BB27                           * AF4DD  47911
          OBJ_15909                              * AF4E7
          SWAP                                   * AF4EC
          #       BB28                           * AF4F1  47912
          OBJ_15909                              * AF4FB
        ;                                        * AF500

* ROMPTR 0B4 186
* refs (1): A2437
ROMP_0B4_186:
        ::                                       * AF505
          4UNROLL                                * AF50A
          ROMPTR  0B5 0E1                        * AF50F
          ROMPTR  0B5 0DE                        * AF51A
          ROMPTR  0B0 09C                        * AF525
          0LASTOWDOB!                            * AF530
        ;                                        * AF535

* ROMPTR 0B4 187
* refs (1): A2437
ROMP_0B4_187:
        ::                                       * AF53A
          BINT16                                 * AF53F
          #<>case                                * AF544
          FALSE                                  * AF549
          ROMPTR  0B4 188                        * AF54E
          TrueTrue                               * AF559
        ;                                        * AF55E

* ROMPTR 0B4 188
* refs (1): A2437
ROMP_0B4_188:
        {                                        * AF563
          {                                      * AF568
            ::                                   * AF56D
              PTR     DirLabel:                  * AF572
              $       "PRED"                     * AF577
            ;                                    * AF589
            ROMPTR  0B4 189                      * AF58E
          }                                      * AF599
          {                                      * AF59E
            $       "(AN(L"                      * AF5A3
            ROMPTR  0B0 059                      * AF5B7  DoKeyCancel
          }                                      * AF5C2
          {                                      * AF5C7
            $       "OK"                         * AF5CC
            ROMPTR  0B0 05A                      * AF5DA  DoKeyOK
          }                                      * AF5E5
        }                                        * AF5EA

* ROMPTR 0B4 189
* refs (1): A2437
ROMP_0B4_189:
        ::                                       * AF5EF
          TakeOver                               * AF5F4
          ROMPTR  0B0 0C8                        * AF5F9  GetFieldVals
          ROMPTR  0B4 186                        * AF604
          ROMPTR  0B4 18B                        * AF60F
          ROMPTR  0B4 18A                        * AF61A
          ROMPTR  0B0 0D8                        * AF625
        ;                                        * AF630

* ROMPTR 0B4 18A
* refs (1): A2437
ROMP_0B4_18A:
        ::                                       * AF635
          ROMPTR  0B5 0DD                        * AF63A
          ROMPTR  0B5 0E0                        * AF645
          ROMPTR  0B5 0DF                        * AF650
        ;                                        * AF65B

* ROMPTR 0B4 18B
* refs (1): A2437
ROMP_0B4_18B:
        ::                                       * AF660
          ROMPTR  0B4 177                        * AF665
          ROMPTR  0B4 180                        * AF670
          ROMPTR  0B4 181                        * AF67B
          ROMPTR  0B4 182                        * AF686
          #       BF32                           * AF691  48946
          BINT1                                  * AF69B
          BINT37                                 * AF6A0
          #       BB2A                           * AF6A5  47914
          BINT67                                 * AF6AF
          BINT37                                 * AF6B4
          ROMPTR  0B4 183                        * AF6B9
          ROMPTR  0B4 184                        * AF6C4
          ROMPTR  0B4 185                        * AF6CF
          'DROPFALSE                             * AF6DA
          BINT10                                 * AF6DF
          BINT35                                 * AF6E4
          BINT49                                 * AF6E9
          BINT9                                  * AF6EE
          BINT1                                  * AF6F3
          {                                      * AF6F8
            BINT0                                * AF6FD
          }                                      * AF702
          BINT4                                  * AF707
          #       BB2B                           * AF70C  47915
          MINUSONE                               * AF716
          MINUSONE                               * AF71B
          MINUSONE                               * AF720
          DUP                                    * AF725
          'DROPFALSE                             * AF72A
          #       4C                             * AF72F  76
          BINT35                                 * AF739
          BINT49                                 * AF73E
          BINT9                                  * AF743
          BINT1                                  * AF748
          {                                      * AF74D
            BINT0                                * AF752
          }                                      * AF757
          BINT4                                  * AF75C
          #       BB2C                           * AF761  47916
          MINUSONE                               * AF76B
          MINUSONE                               * AF770
          MINUSONE                               * AF775
          DUP                                    * AF77A
          BINT6                                  * AF77F
          DUP                                    * AF784
          OBJ_38345                              * AF789
          ROMPTR  0B4 18C                        * AF78E
          #       BB29                           * AF799  47913
          DoInputForm                            * AF7A3
          NOT?SEMI                               * AF7A8
          2DROP                                  * AF7AD
          ROMPTR  0B4 186                        * AF7B2
        ;                                        * AF7BD

* ROMPTR 0B4 18C
* refs (1): A2437
ROMP_0B4_18C:
        ::                                       * AF7C2
          BINT16                                 * AF7C7
          #<>case                                * AF7CC
          FALSE                                  * AF7D1
          ROMPTR  0B4 18D                        * AF7D6
          TrueTrue                               * AF7E1
        ;                                        * AF7E6

* ROMPTR 0B4 18D
* refs (1): A2437
ROMP_0B4_18D:
        {                                        * AF7EB
          NullMenuKey                            * AF7F0
          NullMenuKey                            * AF7F5
          {                                      * AF7FA
            $       "PRED"                       * AF7FF
            ROMPTR  0B4 18E                      * AF811
          }                                      * AF81C
        }                                        * AF821

* ROMPTR 0B4 18E
* refs (1): A2437
ROMP_0B4_18E:
        ::                                       * AF826
          TakeOver                               * AF82B
          5GETLAM                                * AF830
          BINT5                                  * AF835
          #<                                     * AF83A
          caseDoBadKey                           * AF83F
          ROMPTR  0B0 0C8                        * AF844  GetFieldVals
          2DROP                                  * AF84F
          ROMPTR  0B4 186                        * AF854
          STATLR                                 * AF85F
          2DROP                                  * AF864
          5GETLAM                                * AF869
          {                                      * AF86E
            BINT5                                * AF873
            ::                                   * AF878
              BINT6                              * AF87D
              ROMPTR  0B0 0C5                    * AF882  ~gFldVal
              ROMPTR  0B5 0EA                    * AF88D
              BINT5                              * AF898
              ROMPTR  0B0 0D5                    * AF89D  ~sFldVal
              BINT5                              * AF8A8
              ROMPTR  0B0 0A2                    * AF8AD
            ;                                    * AF8B8
            BINT6                                * AF8BD
            ::                                   * AF8C2
              BINT5                              * AF8C7
              ROMPTR  0B0 0C5                    * AF8CC  ~gFldVal
              ROMPTR  0B5 0EB                    * AF8D7
              BINT6                              * AF8E2
              ROMPTR  0B0 0D5                    * AF8E7  ~sFldVal
              BINT6                              * AF8F2
              ROMPTR  0B0 0A2                    * AF8F7
            ;                                    * AF902
          }                                      * AF907
          EQLookup                               * AF90C
          DROP                                   * AF911
          EVAL                                   * AF916
          SetDA123NoCh                           * AF91B
        ;                                        * AF920

* ROMPTR 0B4 18F
* refs (1): A2437
ROMP_0B4_18F:
        ::                                       * AF925
          ROMPTR  0B4 177                        * AF92A
          ROMPTR  0B4 180                        * AF935
          ROMPTR  0B4 181                        * AF940
          #       BB2E                           * AF94B  47918
          BINT1                                  * AF955
          BINT28                                 * AF95A
          #       BB2F                           * AF95F  47919
          BINT11                                 * AF969
          BINT37                                 * AF96E
          #       BB30                           * AF973  47920
          BINT29                                 * AF97D
          BINT37                                 * AF982
          #       BB31                           * AF987  47921
          BINT50                                 * AF991
          BINT37                                 * AF996
          #       BB32                           * AF99B  47922
          #       47                             * AF9A5  71
          BINT37                                 * AF9AF
          #       BB33                           * AF9B4  47923
          #       5F                             * AF9BE  95
          BINT37                                 * AF9C8
          #       BB34                           * AF9CD  47924
          #       77                             * AF9D7  119
          BINT37                                 * AF9E1
          ROMPTR  0B4 183                        * AF9E6
          ROMPTR  0B4 184                        * AF9F1
          'DROPFALSE                             * AF9FC
          BINT4                                  * AFA01
          BINT35                                 * AFA06
          BINT6                                  * AFA0B
          BINT9                                  * AFA10
          BINT32                                 * AFA15
          MINUSONE                               * AFA1A
          MINUSONE                               * AFA1F
          #       BB35                           * AFA24  47925
          MINUSONE                               * AFA2E
          MINUSONE                               * AFA33
          FALSE                                  * AFA38
          DUP                                    * AFA3D
          'DROPFALSE                             * AFA42
          BINT22                                 * AFA47
          BINT35                                 * AFA4C
          BINT6                                  * AFA51
          BINT9                                  * AFA56
          BINT32                                 * AFA5B
          MINUSONE                               * AFA60
          MINUSONE                               * AFA65
          #       BB36                           * AFA6A  47926
          MINUSONE                               * AFA74
          MINUSONE                               * AFA79
          FALSE                                  * AFA7E
          DUP                                    * AFA83
          'DROPFALSE                             * AFA88
          BINT43                                 * AFA8D
          BINT35                                 * AFA92
          BINT6                                  * AFA97
          BINT9                                  * AFA9C
          BINT32                                 * AFAA1
          MINUSONE                               * AFAA6
          MINUSONE                               * AFAAB
          #       BB37                           * AFAB0  47927
          MINUSONE                               * AFABA
          MINUSONE                               * AFABF
          FALSE                                  * AFAC4
          DUP                                    * AFAC9
          'DROPFALSE                             * AFACE
          BINT64                                 * AFAD3
          BINT35                                 * AFAD8
          BINT6                                  * AFADD
          BINT9                                  * AFAE2
          BINT32                                 * AFAE7
          MINUSONE                               * AFAEC
          MINUSONE                               * AFAF1
          #       BB38                           * AFAF6  47928
          MINUSONE                               * AFB00
          MINUSONE                               * AFB05
          FALSE                                  * AFB0A
          DUP                                    * AFB0F
          'DROPFALSE                             * AFB14
          #       58                             * AFB19  88
          BINT35                                 * AFB23
          BINT6                                  * AFB28
          BINT9                                  * AFB2D
          BINT32                                 * AFB32
          MINUSONE                               * AFB37
          MINUSONE                               * AFB3C
          #       BB39                           * AFB41  47929
          MINUSONE                               * AFB4B
          MINUSONE                               * AFB50
          FALSE                                  * AFB55
          DUP                                    * AFB5A
          'DROPFALSE                             * AFB5F
          BINT112                                * AFB64
          BINT35                                 * AFB69
          BINT6                                  * AFB6E
          BINT9                                  * AFB73
          BINT32                                 * AFB78
          MINUSONE                               * AFB7D
          MINUSONE                               * AFB82
          #       BB3A                           * AFB87  47930
          MINUSONE                               * AFB91
          MINUSONE                               * AFB96
          FALSE                                  * AFB9B
          DUP                                    * AFBA0
          BINT10                                 * AFBA5
          BINT9                                  * AFBAA
          'DROPFALSE                             * AFBAF
          #       BB2D                           * AFBB4  47917
          DoInputForm                            * AFBBE
          NOT?SEMI                               * AFBC3
          ROMPTR  0B4 190                        * AFBC8
          ROMPTR  0B4 191                        * AFBD3
        ;                                        * AFBDE

* ROMPTR 0B4 190
* refs (1): A2437
ROMP_0B4_190:
        ::                                       * AFBE3
          8ROLL                                  * AFBE8
          8ROLL                                  * AFBED
          ROMPTR  0B5 0E1                        * AFBF2
          7ROLL                                  * AFBFD
          ROMPTR  0B5 0DE                        * AFC02
        ;                                        * AFC0D

* ROMPTR 0B4 191
* refs (1): A2437
ROMP_0B4_191:
        ::                                       * AFC12
          {                                      * AFC17
            NULLLAM                              * AFC1C
            NULLLAM                              * AFC21
            NULLLAM                              * AFC26
            NULLLAM                              * AFC2B
            NULLLAM                              * AFC30
            NULLLAM                              * AFC35
          }                                      * AFC3A
          BIND                                   * AFC3F
          6GETLAM                                * AFC44
          IT                                     * AFC49
          ::                                     * AFC4E
            ROMPTR  0B5 0EC                      * AFC53
            #       BB2F                         * AFC5E  47919
            OBJ_15909                            * AFC68
          ;                                      * AFC6D
          5GETLAM                                * AFC72
          IT                                     * AFC77
          ::                                     * AFC7C
            ROMPTR  0B5 0ED                      * AFC81
            #       BB30                         * AFC8C  47920
            OBJ_15909                            * AFC96
          ;                                      * AFC9B
          4GETLAM                                * AFCA0
          IT                                     * AFCA5
          ::                                     * AFCAA
            ROMPTR  0B5 0EE                      * AFCAF
            #       BB31                         * AFCBA  47921
            OBJ_15909                            * AFCC4
          ;                                      * AFCC9
          3GETLAM                                * AFCCE
          IT                                     * AFCD3
          ::                                     * AFCD8
            ROMPTR  0B5 0EF                      * AFCDD
            #       BB32                         * AFCE8  47922
            OBJ_15909                            * AFCF2
          ;                                      * AFCF7
          2GETLAM                                * AFCFC
          IT                                     * AFD01
          ::                                     * AFD06
            ROMPTR  0B5 0F0                      * AFD0B
            #       BB33                         * AFD16  47923
            OBJ_15909                            * AFD20
          ;                                      * AFD25
          1GETLAM                                * AFD2A
          IT                                     * AFD2F
          ::                                     * AFD34
            ROMPTR  0B5 0F1                      * AFD39
            #       BB34                         * AFD44  47924
            OBJ_15909                            * AFD4E
          ;                                      * AFD53
          ABND                                   * AFD58
        ;                                        * AFD5D

* ROMPTR 0B4 192
* refs (1): A2437
ROMP_0B4_192:
        ::                                       * AFD62
          ROMPTR  0B0 0AB                        * AFD67
          {                                      * AFD72
            {                                    * AFD77
              #       BA01                       * AFD7C  47617
              ROMPTR  0B4 193                    * AFD86
            }                                    * AFD91
            {                                    * AFD96
              #       BA02                       * AFD9B  47618
              ROMPTR  0B5 0FF                    * AFDA5
            }                                    * AFDB0
            {                                    * AFDB5
              #       BA03                       * AFDBA  47619
              DOPRLCD                            * AFDC4
            }                                    * AFDC9
            {                                    * AFDCE
              #       BA04                       * AFDD3  47620
              ROMPTR  0B4 197                    * AFDDD
            }                                    * AFDE8
            {                                    * AFDED
              #       BA05                       * AFDF2  47621
              ROMPTR  0B4 1A8                    * AFDFC
            }                                    * AFE07
            {                                    * AFE0C
              #       BA06                       * AFE11  47622
              DOSERVER                           * AFE1B
            }                                    * AFE20
          }                                      * AFE25
          ROMPTR  0B0 0A9                        * AFE2A
        ;                                        * AFE35

* ROMPTR 0B4 193
* refs (1): A2437
ROMP_0B4_193:
        ::                                       * AFE3A
          #       B989                           * AFE3F  47497
          BINT1                                  * AFE49
          BINT19                                 * AFE4E
          'DROPFALSE                             * AFE53
          BINT25                                 * AFE58
          BINT17                                 * AFE5D
          #       67                             * AFE62  103
          BINT9                                  * AFE6C
          BINT21                                 * AFE71
          {                                      * AFE76
            BINT6                                * AFE7B
            BINT5                                * AFE80
          }                                      * AFE85
          BINT4                                  * AFE8A
          #       BA07                           * AFE8F  47623
          {                                      * AFE99
            #       BA08                         * AFE9E  47624
            TRUE                                 * AFEA8
            MINUSONE                             * AFEAD
            FALSE                                * AFEB2
          }                                      * AFEB7
          MINUSONE                               * AFEBC
          MINUSONE                               * AFEC1
          MINUSONE                               * AFEC6
          ONEONE                                 * AFECB
          OBJ_38345                              * AFED0
          ROMPTR  0B4 194                        * AFED5
          #       BA09                           * AFEE0  47625
          DoInputForm                            * AFEEA
          caseDROP                               * AFEEF
        ;                                        * AFEF4

* ROMPTR 0B4 194
* refs (1): A2437
ROMP_0B4_194:
        ::                                       * AFEF9
          BINT16                                 * AFEFE
          #<>case                                * AFF03
          FALSE                                  * AFF08
          ROMPTR  0B4 195                        * AFF0D
          TrueTrue                               * AFF18
        ;                                        * AFF1D

* ROMPTR 0B4 195
* refs (1): A2437
ROMP_0B4_195:
        {                                        * AFF22
          NullMenuKey                            * AFF27
          NullMenuKey                            * AFF2C
          {                                      * AFF31
            $       "SEND"                       * AFF36
            ROMPTR  0B4 196                      * AFF48
          }                                      * AFF53
        }                                        * AFF58

* ROMPTR 0B4 196
* refs (1): A2437
ROMP_0B4_196:
        ::                                       * AFF5D
          TakeOver                               * AFF62
          BINT1                                  * AFF67
          ROMPTR  0B0 0C5                        * AFF6C  ~gFldVal
          ROMPTR  0B5 0FB                        * AFF77
        ;                                        * AFF82

* ROMPTR 0B4 197
* refs (1): A2437
ROMP_0B4_197:
        ::                                       * AFF87

* ROMPTR 0B4 198
* refs (1): A2437
ROMP_0B4_198:
          ::                                     * AFF8C
            #       BA0A                         * AFF91  47626
            BINT1                                * AFF9B
            BINT10                               * AFFA0
          ;                                      * AFFA5
          #       B984                           * AFFAA  47492
          BINT1                                  * AFFB4
          BINT19                                 * AFFB9
          #       BA0B                           * AFFBE  47627
          BINT8                                  * AFFC8
          BINT28                                 * AFFCD
          #       BA0C                           * AFFD2  47628
          BINT52                                 * AFFDC
          BINT28                                 * AFFE1

* ROMPTR 0B4 199
* refs (1): A2437
ROMP_0B4_199:
          ::                                     * AFFE6
            #       BA0D                         * AFFEB  47629
            BINT49                               * AFFF5
            BINT28                               * AFFFA
          ;                                      * AFFFF
          #       BA0E                           * B0004  47630
          #       6E                             * B000E  110
          BINT28                                 * B0018

* ROMPTR 0B4 19A
* refs (1): A2437
ROMP_0B4_19A:
          ::                                     * B001D
            #       BA0F                         * B0022  47631
            BINT1                                * B002C
            BINT37                               * B0031
          ;                                      * B0036

* ROMPTR 0B4 19B
* refs (1): A2437
ROMP_0B4_19B:
          ::                                     * B003B
            #       BA10                         * B0040  47632
            BINT49                               * B004A
            BINT37                               * B004F
          ;                                      * B0054
          #       BA11                           * B0059  47633
          #       67                             * B0063  103
          BINT37                                 * B006D
          OBJ_38345                              * B0072
          ROMPTR  0B4 1A3                        * B0077
          BINT31                                 * B0082
          BINT8                                  * B0087
          BINT49                                 * B008C
          BINT9                                  * B0091
          BINT12                                 * B0096
          MINUSONE                               * B009B
          BINT17                                 * B00A0
          #       BA12                           * B00A5  47634
          ROMPTR  0B5 11F                        * B00AF
          BINT17                                 * B00BA
          ROMPTR  0B5 120                        * B00BF
          MINUSONE                               * B00CA
          'DROPFALSE                             * B00CF
          BINT31                                 * B00D4
          BINT17                                 * B00D9
          BINT97                                 * B00DE
          BINT9                                  * B00E3
          BINT21                                 * B00E8
          MINUSONE                               * B00ED
          BINT4                                  * B00F2
          #       BA13                           * B00F7  47635
          {                                      * B0101
            #       B986                         * B0106  47494
            TRUE                                 * B0110
          }                                      * B0115
          MINUSONE                               * B011A
          MINUSONE                               * B011F
          MINUSONE                               * B0124
          'DROPFALSE                             * B0129
          BINT1                                  * B012E
          BINT26                                 * B0133
          BINT6                                  * B0138
          BINT9                                  * B013D
          BINT32                                 * B0142
          MINUSONE                               * B0147
          MINUSONE                               * B014C
          #       BA14                           * B0151  47636
          MINUSONE                               * B015B
          MINUSONE                               * B0160
          FALSE                                  * B0165
          MINUSONE                               * B016A
          OBJ_38345                              * B016F
          ROMPTR  0B4 1A5                        * B0174
          #       4C                             * B017F  76
          BINT26                                 * B0189
          BINT19                                 * B018E
          BINT9                                  * B0193
          BINT1                                  * B0198
          {                                      * B019D
            BINT0                                * B01A2
          }                                      * B01A7
          BINT4                                  * B01AC
          #       BA15                           * B01B1  47637
          MINUSONE                               * B01BB
          MINUSONE                               * B01C0
          %1.8                                   * B01C5
          MINUSONE                               * B01CA
          OBJ_38345                              * B01CF
          ROMPTR  0B4 1A6                        * B01D4
          #       49                             * B01DF  73
          BINT26                                 * B01E9
          BINT25                                 * B01EE
          BINT9                                  * B01F3
          BINT12                                 * B01F8
          MINUSONE                               * B01FD
          BINT33                                 * B0202
          #       BA16                           * B0207  47638
          ROMPTR  0B5 12F                        * B0211
          BINT17                                 * B021C
          ROMPTR  0B5 131                        * B0221
          MINUSONE                               * B022C
          'DROPFALSE                             * B0231
          #       67                             * B0236  103
          BINT26                                 * B0240
          BINT6                                  * B0245
          BINT9                                  * B024A
          BINT32                                 * B024F
          MINUSONE                               * B0254
          MINUSONE                               * B0259
          #       BA17                           * B025E  47639
          MINUSONE                               * B0268
          MINUSONE                               * B026D
          TRUE                                   * B0272
          MINUSONE                               * B0277

* ROMPTR 0B4 19C
* refs (1): A2437
ROMP_0B4_19C:
          ::                                     * B027C
            OBJ_38345                            * B0281
            ROMPTR  0B4 1A6                      * B0286
            BINT19                               * B0291
            BINT35                               * B0296
            BINT25                               * B029B
            BINT9                                * B02A0
            BINT12                               * B02A5
            MINUSONE                             * B02AA
            BINT4                                * B02AF
            #       BA18                         * B02B4  47640
            ROMPTR  0B5 125                      * B02BE
            BINT4                                * B02C9
            %9600                                * B02CE
            MINUSONE                             * B02D3
          ;                                      * B02D8
          OBJ_38345                              * B02DD
          ROMPTR  0B4 1A6                        * B02E2
          #       49                             * B02ED  73
          BINT35                                 * B02F7
          BINT25                                 * B02FC
          BINT9                                  * B0301
          BINT12                                 * B0306
          MINUSONE                               * B030B
          BINT33                                 * B0310
          #       BA19                           * B0315  47641
          ROMPTR  0B5 126                        * B031F
          BINT17                                 * B032A
          ROMPTR  0B5 127                        * B032F
          MINUSONE                               * B033A
          OBJ_38345                              * B033F
          ROMPTR  0B4 1A6                        * B0344
          #       76                             * B034F  118
          BINT35                                 * B0359
          BINT13                                 * B035E
          BINT9                                  * B0363
          BINT1                                  * B0368
          {                                      * B036D
            BINT0                                * B0372
          }                                      * B0377
          BINT4                                  * B037C
          #       BA1A                           * B0381  47642
          MINUSONE                               * B038B
          MINUSONE                               * B0390
          %80                                    * B0395
          MINUSONE                               * B039A
          BINT9                                  * B039F
          DUP                                    * B03A4
          OBJ_38345                              * B03A9
          ROMPTR  0B4 19F                        * B03AE
          #       BA1B                           * B03B9  47643
          ROMPTR  0B4 19D                        * B03C3
          BINT9                                  * B03CE
          ROMPTR  0B0 0AA                        * B03D3
          DoInputForm                            * B03DE
          NOT?SEMI                               * B03E3
          ROMPTR  0B4 19E                        * B03E8
        ;                                        * B03F3

* ROMPTR 0B4 19D
* refs (1): A2437
ROMP_0B4_19D:
        ::                                       * B03F8
          ROMPTR  0B5 100                        * B03FD
          MINUSONE                               * B0408
          BINT37                                 * B040D
          TestSysFlag                            * B0412
          ROMPTR  0B5 103                        * B0417
          ROMPTR  0B5 10C                        * B0422
          ROMPTR  0B5 104                        * B042D
          4ROLLDROP                              * B0438
          3UNROLL                                * B043D
          5ROLL                                  * B0442
        ;                                        * B0447

* ROMPTR 0B4 19E
* refs (1): A2437
ROMP_0B4_19E:
        ::                                       * B044C
          ROMPTR  0B5 106                        * B0451
          ROT                                    * B045C
          ROMPTR  0B5 105                        * B0461
          MINUSONE                               * B046C
          3UNROLL                                * B0471
          ROMPTR  0B5 10D                        * B0476
          ROMPTR  0B5 102                        * B0481
          BINT37                                 * B048C
          ROMPTR  0B5 11B                        * B0491
          DROP                                   * B049C
          ROMPTR  0B5 101                        * B04A1
        ;                                        * B04AC

* ROMPTR 0B4 19F
* refs (1): A2437
ROMP_0B4_19F:
        ::                                       * B04B1
          {                                      * B04B6
            BINT14                               * B04BB
            BINT2                                * B04C0
            BINT16                               * B04C5
            ::                                   * B04CA
              ROMPTR  0B4 1A0                    * B04CF
              TRUE                               * B04DA
            ;                                    * B04DF
            BINT5                                * B04E4
            ROMPTR  0B4 1A2                      * B04E9
          }                                      * B04F4
          EQLookup                               * B04F9
          case                                   * B04FE
          ::                                     * B0503
            EVAL                                 * B0508
            TRUE                                 * B050D
          ;                                      * B0512
          DROPFALSE                              * B0517
        ;                                        * B051C

* ROMPTR 0B4 1A0
* refs (1): A2437
ROMP_0B4_1A0:
        {                                        * B0521
          NullMenuKey                            * B0526
          NullMenuKey                            * B052B
          {                                      * B0530
            $       "PRINT"                      * B0535
            ROMPTR  0B4 1A1                      * B0549
          }                                      * B0554
        }                                        * B0559

* ROMPTR 0B4 1A1
* refs (1): A2437
ROMP_0B4_1A1:
        ::                                       * B055E
          TakeOver                               * B0563
          ROMPTR  0B0 0C8                        * B0568  GetFieldVals
          ROMPTR  0B4 19E                        * B0573
          BINT2                                  * B057E
          ROMPTR  0B0 0C5                        * B0583  ~gFldVal
          ROMPTR  0B5 107                        * B058E
        ;                                        * B0599

* ROMPTR 0B4 1A2
* refs (1): A2437
ROMP_0B4_1A2:
        ::                                       * B059E
          BINT39                                 * B05A3
          BINT131                                * B05A8
          MAKEGROB                               * B05AD
          BINT4                                  * B05B2
          ONE_DO                                 * B05B7
          INDEX@                                 * B05BC
          ROMPTR  0B0 012                        * B05C1
          LOOP                                   * B05CC
          ROMPTR  0B4 1A7                        * B05D1
          ITE                                    * B05DC
          ::                                     * B05E1
            BINT4                                * B05E6
            ROMPTR  0B0 012                      * B05EB
            BINT6                                * B05F6
            ROMPTR  0B0 012                      * B05FB
          ;                                      * B0606
          ::                                     * B060B
            BINT10                               * B0610
            BINT5                                * B0615
            DO                                   * B061A
            INDEX@                               * B061F
            ROMPTR  0B0 012                      * B0624
            LOOP                                 * B062F
          ;                                      * B0634
          FALSE                                  * B0639
        ;                                        * B063E

* ROMPTR 0B4 1A3
* refs (1): A2437
ROMP_0B4_1A3:
        ::                                       * B0643
          BINT47                                 * B0648
          #<>case                                * B064D
          FALSE                                  * B0652
          ROMPTR  0B4 1A4                        * B0657
          TRUE                                   * B0662
        ;                                        * B0667

* ROMPTR 0B4 1A4
* refs (1): A2437
ROMP_0B4_1A4:
        ::                                       * B066C
          BINT26                                 * B0671
          BINT18                                 * B0676
          BLANKIT                                * B067B
          HARDBUFF                               * B0680
          BINT3                                  * B0685
          ROMPTR  0B0 012                        * B068A
          BINT3                                  * B0695
          ROMPTR  0B0 0A2                        * B069A
          ROMPTR  0B4 1A7                        * B06A5
          ITE                                    * B06B0
          ::                                     * B06B5
            BINT4                                * B06BA
            ROMPTR  0B0 012                      * B06BF
            BINT4                                * B06CA
            ROMPTR  0B0 0A2                      * B06CF
            BINT6                                * B06DA
            ROMPTR  0B0 012                      * B06DF
            BINT6                                * B06EA
            ROMPTR  0B0 0A2                      * B06EF
          ;                                      * B06FA
          ::                                     * B06FF
            BINT10                               * B0704
            BINT5                                * B0709
            DO                                   * B070E
            INDEX@                               * B0713
            ROMPTR  0B0 012                      * B0718
            INDEX@                               * B0723
            ROMPTR  0B0 0A2                      * B0728
            LOOP                                 * B0733
          ;                                      * B0738
          DROP                                   * B073D
        ;                                        * B0742

* ROMPTR 0B4 1A5
* refs (1): A2437
ROMP_0B4_1A5:
        ::                                       * B0747
          BINT7                                  * B074C
          #=casedrop                             * B0751
          ::                                     * B0756
            ROMPTR  0B4 1A7                      * B075B
            NOT                                  * B0766
          ;                                      * B076B
          BINT55                                 * B0770
          #<>case                                * B0775
          FALSE                                  * B077A
          ROMPTR  0B4 1A7                        * B077F
          TRUE                                   * B078A
        ;                                        * B078F

* ROMPTR 0B4 1A6
* refs (1): A2437
ROMP_0B4_1A6:
        ::                                       * B0794
          BINT7                                  * B0799
          #=casedrop                             * B079E
          ROMPTR  0B4 1A7                        * B07A3
          BINT55                                 * B07AE
          #<>case                                * B07B3
          FALSE                                  * B07B8
          ROMPTR  0B4 1A7                        * B07BD
          NOT                                    * B07C8
          TRUE                                   * B07CD
        ;                                        * B07D2

* ROMPTR 0B4 1A7
* refs (1): A2437
ROMP_0B4_1A7:
        ::                                       * B07D7
          BINT1                                  * B07DC
          ROMPTR  0B0 0C5                        * B07E1  ~gFldVal
          ROMPTR  0B0 09A                        * B07EC
        ;                                        * B07F7

* ROMPTR 0B4 1A8
* refs (1): A2437
ROMP_0B4_1A8:
        ::                                       * B07FC
          ROMPTR  0B4 198                        * B0801
          #       BA1C                           * B080C  47644
          BINT70                                 * B0816
          BINT10                                 * B081B
          #       B989                           * B0820  47497
          BINT1                                  * B082A
          BINT19                                 * B082F
          #       BA1D                           * B0834  47645
          #       6E                             * B083E  110
          BINT37                                 * B0848
          #       BA1E                           * B084D  47646
          BINT1                                  * B0857
          BINT28                                 * B085C
          ROMPTR  0B4 199                        * B0861
          #       BA1F                           * B086C  47647
          #       67                             * B0876  103
          BINT28                                 * B0880
          ROMPTR  0B4 19A                        * B0885
          ROMPTR  0B4 19B                        * B0890
          OBJ_38345                              * B089B
          ROMPTR  0B4 1B1                        * B08A0
          BINT25                                 * B08AB
          BINT8                                  * B08B0
          BINT25                                 * B08B5
          BINT9                                  * B08BA
          BINT12                                 * B08BF
          MINUSONE                               * B08C4
          BINT33                                 * B08C9
          #       BA20                           * B08CE  47648
          ROMPTR  0B5 11F                        * B08D8
          BINT17                                 * B08E3
          ROMPTR  0B5 121                        * B08E8
          MINUSONE                               * B08F3
          OBJ_38345                              * B08F8
          ROMPTR  0B4 1B2                        * B08FD
          BINT91                                 * B0908
          BINT8                                  * B090D
          BINT37                                 * B0912
          BINT9                                  * B0917
          BINT12                                 * B091C
          MINUSONE                               * B0921
          BINT17                                 * B0926
          #       BA21                           * B092B  47649
          ROMPTR  0B5 122                        * B0935
          BINT17                                 * B0940
          ROMPTR  0B5 123                        * B0945
          MINUSONE                               * B0950
          OBJ_38345                              * B0955
          ROMPTR  0B4 1B4                        * B095A
          BINT25                                 * B0965
          BINT17                                 * B096A
          #       67                             * B096F  103
          BINT9                                  * B0979
          BINT21                                 * B097E
          {                                      * B0983
            BINT6                                * B0988
            BINT5                                * B098D
          }                                      * B0992
          BINT4                                  * B0997
          #       BA22                           * B099C  47650
          {                                      * B09A6
            #       BA08                         * B09AB  47624
            TRUE                                 * B09B5
            MINUSONE                             * B09BA
            FALSE                                * B09BF
          }                                      * B09C4
          MINUSONE                               * B09C9
          MINUSONE                               * B09CE
          MINUSONE                               * B09D3
          OBJ_38345                              * B09D8
          ROMPTR  0B4 1BF                        * B09DD
          BINT19                                 * B09E8
          BINT26                                 * B09ED
          BINT19                                 * B09F2
          BINT9                                  * B09F7
          BINT12                                 * B09FC
          MINUSONE                               * B0A01
          BINT33                                 * B0A06
          #       BA23                           * B0A0B  47651
          ROMPTR  0B5 12C                        * B0A15
          BINT17                                 * B0A20
          ROMPTR  0B5 12D                        * B0A25
          MINUSONE                               * B0A30
          OBJ_38345                              * B0A35
          ROMPTR  0B4 1BF                        * B0A3A
          #       49                             * B0A45  73
          BINT26                                 * B0A4F
          BINT25                                 * B0A54
          BINT9                                  * B0A59
          BINT12                                 * B0A5E
          MINUSONE                               * B0A63
          BINT33                                 * B0A68
          #       BA16                           * B0A6D  47638
          ROMPTR  0B5 12F                        * B0A77
          BINT17                                 * B0A82
          ROMPTR  0B5 131                        * B0A87
          MINUSONE                               * B0A92
          OBJ_38345                              * B0A97
          ROMPTR  0B4 1BF                        * B0A9C
          #       79                             * B0AA7  121
          BINT26                                 * B0AB1
          BINT7                                  * B0AB6
          BINT9                                  * B0ABB
          BINT12                                 * B0AC0
          MINUSONE                               * B0AC5
          BINT36                                 * B0ACA
          #       BA24                           * B0ACF  47652
          ROMPTR  0B5 134                        * B0AD9
          BINT17                                 * B0AE4
          ROMPTR  0B5 137                        * B0AE9
          MINUSONE                               * B0AF4
          ROMPTR  0B4 19C                        * B0AF9
          OBJ_38345                              * B0B04
          ROMPTR  0B4 1BE                        * B0B09
          #       49                             * B0B14  73
          BINT35                                 * B0B1E
          BINT25                                 * B0B23
          BINT9                                  * B0B28
          BINT12                                 * B0B2D
          MINUSONE                               * B0B32
          BINT33                                 * B0B37
          #       BA19                           * B0B3C  47641
          ROMPTR  0B5 126                        * B0B46
          BINT17                                 * B0B51
          ROMPTR  0B5 127                        * B0B56
          MINUSONE                               * B0B61
          'DROPFALSE                             * B0B66
          #       67                             * B0B6B  103
          BINT35                                 * B0B75
          BINT6                                  * B0B7A
          BINT9                                  * B0B7F
          BINT32                                 * B0B84
          MINUSONE                               * B0B89
          MINUSONE                               * B0B8E
          #       BA25                           * B0B93  47653
          MINUSONE                               * B0B9D
          MINUSONE                               * B0BA2
          FALSE                                  * B0BA7
          MINUSONE                               * B0BAC
          BINT9                                  * B0BB1
          DUP                                    * B0BB6
          OBJ_38345                              * B0BBB
          ROMPTR  0B4 1AB                        * B0BC0
          #       BA26                           * B0BCB  47654
          ROMPTR  0B4 1A9                        * B0BD5
          BINT9                                  * B0BE0
          ROMPTR  0B0 0AA                        * B0BE5
          DoInputForm                            * B0BF0
          NOT?SEMI                               * B0BF5
          ROMPTR  0B4 1AA                        * B0BFA
        ;                                        * B0C05

* ROMPTR 0B4 1A9
* refs (1): A2437
ROMP_0B4_1A9:
        ::                                       * B0C0A
          ROMPTR  0B5 108                        * B0C0F
          ROMPTR  0B5 123                        * B0C1A
          MINUSONE                               * B0C25
          ROMPTR  0B5 10A                        * B0C2A
          ROMPTR  0B5 10C                        * B0C35
          ROMPTR  0B5 10E                        * B0C40
        ;                                        * B0C4B

* ROMPTR 0B4 1AA
* refs (1): A2437
ROMP_0B4_1AA:
        ::                                       * B0C50
          ROMPTR  0B5 10F                        * B0C55
          ROMPTR  0B5 10D                        * B0C60
          ROMPTR  0B5 10B                        * B0C6B
          2DROP                                  * B0C76
          ROMPTR  0B5 109                        * B0C7B
        ;                                        * B0C86

* ROMPTR 0B4 1AB
* refs (1): A2437
ROMP_0B4_1AB:
        ::                                       * B0C8B
          {                                      * B0C90
            BINT14                               * B0C95
            BINT3                                * B0C9A
            BINT16                               * B0C9F
            ::                                   * B0CA4
              ROMPTR  0B4 1AC                    * B0CA9
              TRUE                               * B0CB4
            ;                                    * B0CB9
            BINT5                                * B0CBE
            ROMPTR  0B4 1B0                      * B0CC3
          }                                      * B0CCE
          EQLookup                               * B0CD3
          case                                   * B0CD8
          ::                                     * B0CDD
            EVAL                                 * B0CE2
            TRUE                                 * B0CE7
          ;                                      * B0CEC
          DROPFALSE                              * B0CF1
        ;                                        * B0CF6

* ROMPTR 0B4 1AC
* refs (1): A2437
ROMP_0B4_1AC:
        {                                        * B0CFB
          {                                      * B0D00
            ::                                   * B0D05
              TakeOver                           * B0D0A
              ROMPTR  0B4 1C0                    * B0D0F
              ITE                                * B0D1A
              $       "RECV"                     * B0D1F
              NULL$                              * B0D31
            ;                                    * B0D36
            ROMPTR  0B4 1AD                      * B0D3B
          }                                      * B0D46
          {                                      * B0D4B
            ::                                   * B0D50
              TakeOver                           * B0D55
              ROMPTR  0B4 1C0                    * B0D5A
              ITE                                * B0D65
              $       "KGET"                     * B0D6A
              $       "XRECV"                    * B0D7C
            ;                                    * B0D90
            ROMPTR  0B4 1AE                      * B0D95
          }                                      * B0DA0
          {                                      * B0DA5
            ::                                   * B0DAA
              TakeOver                           * B0DAF
              ROMPTR  0B4 1C0                    * B0DB4
              ITE                                * B0DBF
              $       "SEND"                     * B0DC4
              $       "XSEN"                     * B0DD6
            ;                                    * B0DE8
            ROMPTR  0B4 1AF                      * B0DED
          }                                      * B0DF8
        }                                        * B0DFD

* ROMPTR 0B4 1AD
* refs (1): A2437
ROMP_0B4_1AD:
        ::                                       * B0E02
          TakeOver                               * B0E07
          ROMPTR  0B4 1C0                        * B0E0C
          NOTcase                                * B0E17
          DoBadKey                               * B0E1C
          ROMPTR  0B0 0C8                        * B0E21  GetFieldVals
          ROMPTR  0B4 1AA                        * B0E2C
          ROMPTR  0B5 118                        * B0E37
        ;                                        * B0E42

* ROMPTR 0B4 1AE
* refs (1): A2437
ROMP_0B4_1AE:
        ::                                       * B0E47
          TakeOver                               * B0E4C
          ROMPTR  0B0 0C8                        * B0E51  GetFieldVals
          ROMPTR  0B4 1AA                        * B0E5C
          BINT3                                  * B0E67
          ROMPTR  0B0 0C5                        * B0E6C  ~gFldVal
          ROMPTR  0B4 1C0                        * B0E77
          ITE                                    * B0E82
          ROMPTR  0B5 117                        * B0E87
          ::                                     * B0E92
            TRUE                                 * B0E97
            ROMPTR  0B5 119                      * B0E9C
          ;                                      * B0EA7
        ;                                        * B0EAC

* ROMPTR 0B4 1AF
* refs (1): A2437
ROMP_0B4_1AF:
        ::                                       * B0EB1
          TakeOver                               * B0EB6
          ROMPTR  0B0 0C8                        * B0EBB  GetFieldVals
          ROMPTR  0B4 1AA                        * B0EC6
          BINT3                                  * B0ED1
          ROMPTR  0B0 0C5                        * B0ED6  ~gFldVal
          ROMPTR  0B4 1C0                        * B0EE1
          ITE                                    * B0EEC
          ROMPTR  0B5 11A                        * B0EF1
          ::                                     * B0EFC
            FALSE                                * B0F01
            ROMPTR  0B5 119                      * B0F06
          ;                                      * B0F11
        ;                                        * B0F16

* ROMPTR 0B4 1B0
* refs (1): A2437
ROMP_0B4_1B0:
        ::                                       * B0F1B
          BINT39                                 * B0F20
          BINT131                                * B0F25
          MAKEGROB                               * B0F2A
          BINT5                                  * B0F2F
          ONE_DO                                 * B0F34
          INDEX@                                 * B0F39
          ROMPTR  0B0 012                        * B0F3E
          LOOP                                   * B0F49
          ROMPTR  0B4 1C0                        * B0F4E
          case                                   * B0F59
          ::                                     * B0F5E
            BINT8                                * B0F63
            BINT5                                * B0F68
            DO                                   * B0F6D
            INDEX@                               * B0F72
            ROMPTR  0B0 012                      * B0F77
            LOOP                                 * B0F82
            ROMPTR  0B4 1A7                      * B0F87
            caseFALSE                            * B0F92
            BINT10                               * B0F97
            BINT8                                * B0F9C
            DO                                   * B0FA1
            INDEX@                               * B0FA6
            ROMPTR  0B0 012                      * B0FAB
            LOOP                                 * B0FB6
            FALSE                                * B0FBB
          ;                                      * B0FC0
          ROMPTR  0B4 1A7                        * B0FC5
          caseFALSE                              * B0FD0
          BINT8                                  * B0FD5
          ROMPTR  0B0 012                        * B0FDA
          FALSE                                  * B0FE5
        ;                                        * B0FEA

* ROMPTR 0B4 1B1
* refs (1): A2437
ROMP_0B4_1B1:
        ::                                       * B0FEF
          BINT47                                 * B0FF4
          #<>case                                * B0FF9
          FALSE                                  * B0FFE
          ROMPTR  0B4 1B3                        * B1003
          TRUE                                   * B100E
        ;                                        * B1013

* ROMPTR 0B4 1B2
* refs (1): A2437
ROMP_0B4_1B2:
        ::                                       * B1018
          BINT47                                 * B101D
          #<>case                                * B1022
          FALSE                                  * B1027
          ROMPTR  0B4 1B3                        * B102C
          SetDA3Bad                              * B1037
          TRUE                                   * B103C
        ;                                        * B1041

* ROMPTR 0B4 1B3
* refs (1): A2437
ROMP_0B4_1B3:
        ::                                       * B1046
          BINT26                                 * B104B
          BINT18                                 * B1050
          BLANKIT                                * B1055
          HARDBUFF                               * B105A
          BINT4                                  * B105F
          ROMPTR  0B0 012                        * B1064
          BINT9                                  * B106F
          ROMPTR  0B0 0A2                        * B1074
          ROMPTR  0B4 1C0                        * B107F
          case                                   * B108A
          ::                                     * B108F
            BINT8                                * B1094
            BINT5                                * B1099
            DO                                   * B109E
            INDEX@                               * B10A3
            ROMPTR  0B0 012                      * B10A8
            INDEX@                               * B10B3
            #1-                                  * B10B8
            ROMPTR  0B0 0A2                      * B10BD
            LOOP                                 * B10C8
            ROMPTR  0B4 1A7                      * B10CD
            caseDROP                             * B10D8
            BINT10                               * B10DD
            BINT8                                * B10E2
            DO                                   * B10E7
            INDEX@                               * B10EC
            ROMPTR  0B0 012                      * B10F1
            INDEX@                               * B10FC
            #1-                                  * B1101
            ROMPTR  0B0 0A2                      * B1106
            LOOP                                 * B1111
            DROP                                 * B1116
          ;                                      * B111B
          ROMPTR  0B4 1A7                        * B1120
          caseDROP                               * B112B
          BINT8                                  * B1130
          ROMPTR  0B0 012                        * B1135
          BINT7                                  * B1140
          ROMPTR  0B0 0A2                        * B1145
          DROP                                   * B1150
        ;                                        * B1155

* ROMPTR 0B4 1B4
* refs (1): A2437
ROMP_0B4_1B4:
        ::                                       * B115A
          BINT37                                 * B115F
          #<>case                                * B1164
          FALSE                                  * B1169
          ROMPTR  0B4 1C0                        * B116E
          NOTcaseFALSE                           * B1179
          ROMPTR  0B4 1B5                        * B117E
          TRUE                                   * B1189
        ;                                        * B118E

* ROMPTR 0B4 1B5
* refs (1): A2437
ROMP_0B4_1B5:
        ::                                       * B1193
          NULL$                                  * B1198
          {                                      * B119D
            {                                    * B11A2
              #       BA27                       * B11A7  47655
              ROMPTR  0B4 1B6                    * B11B1
            }                                    * B11BC
            {                                    * B11C1
              #       BA28                       * B11C6  47656
              ROMPTR  0B4 1B7                    * B11D0
            }                                    * B11DB
          }                                      * B11E0
          ROMPTR  0B3 066                        * B11E5  ~ChooseSimple
          SetDA123NoCh                           * B11F0
          NOTcaseFALSE                           * B11F5
          EVAL                                   * B11FA
        ;                                        * B11FF

* ROMPTR 0B4 1B6
* refs (1): A2437
ROMP_0B4_1B6:
        ::                                       * B1204
          4GETLAM                                * B1209
          FALSE                                  * B120E
          SWAP                                   * B1213
          ROMPTR  0B0 077                        * B1218
          ROMPTR  0B4 1D8                        * B1223
          SetDA123NoCh                           * B122E
        ;                                        * B1233

* ROMPTR 0B4 1B7
* refs (1): A2437
ROMP_0B4_1B7:
        ::                                       * B1238
          ROMPTR  0B0 0C8                        * B123D  GetFieldVals
          ROMPTR  0B4 1AA                        * B1248
          ROMPTR  0B5 110                        * B1253
          {                                      * B125E
            LAM     'RD                          * B1263
            LAM     'RF                          * B1270
          }                                      * B127D
          BIND                                   * B1282
          OBJ_38345                              * B1287
          ROMPTR  0B4 1B8                        * B128C
          SPACE$                                 * B1297
          BINT1                                  * B129C
          LAM     'RF                            * B12A1
          ROMPTR  0B5 111                        * B12AE
          BINT1                                  * B12B9
          ROMPTR  0B3 000                        * B12BE  ~Choose
          ABND                                   * B12C9
          SetDA123NoCh                           * B12CE
        ;                                        * B12D3

* ROMPTR 0B4 1B8
* refs (1): A2437
ROMP_0B4_1B8:
        ::                                       * B12D8
          {                                      * B12DD
            BINT70                               * B12E2
            ROMPTR  0B4 1B9                      * B12E7
            BINT61                               * B12F2
            TRUE                                 * B12F7
            BINT83                               * B12FC
            ::                                   * B1301
              '                                  * B1306
              ROMPTR  0B4 1BA                    * B130B
            ;                                    * B1316
          }                                      * B131B
          EQLookup                               * B1320
          case                                   * B1325
          ::                                     * B132A
            EVAL                                 * B132F
            TRUE                                 * B1334
          ;                                      * B1339
          DROPFALSE                              * B133E
        ;                                        * B1343

* ROMPTR 0B4 1B9
* refs (1): A2437
ROMP_0B4_1B9:
        ::                                       * B1348
          #       BA29                           * B134D  47657
          JstGetTHEMESG                          * B1357
          LAM     'RD                            * B135C
          8GETLAM                                * B1369
          ROMPTR  0B3 046                        * B136E
          3PICK                                  * B1379
          ROMPTR  0B0 071                        * B137E
          #-                                     * B1389
          ROMPTR  0B0 070                        * B138E
          DROP                                   * B1399
          &$                                     * B139E
        ;                                        * B13A3

* ROMPTR 0B4 1BA
* refs (1): A2437
ROMP_0B4_1BA:
        ::                                       * B13A8
          NoExitAction                           * B13AD
          {                                      * B13B2
            NullMenuKey                          * B13B7
            {                                    * B13BC
              ::                                 * B13C1
                PTR     DirLabel:                * B13C6
                $       "CHOOS"                  * B13CB
              ;                                  * B13DF
              ROMPTR  0B4 1BB                    * B13E4
            }                                    * B13EF
            {                                    * B13F4
              ::                                 * B13F9
                TakeOver                         * B13FE
                ROMPTR  0B3 05B                  * B1403  ~BBEmpty?
                ITE                              * B140E
                NULL$                            * B1413
                ROMPTR  0B0 086                  * B1418  ~grobCheckKey
              ;                                  * B1423
              ROMPTR  0B3 02A                    * B1428  DoCKeyCheck
            }                                    * B1433
            NullMenuKey                          * B1438
            {                                    * B143D
              $       "(AN(L"                    * B1442
              ROMPTR  0B3 02D                    * B1456  DoCKeyCancel
            }                                    * B1461
            {                                    * B1466
              $       "OK"                       * B146B
              ROMPTR  0B3 02E                    * B1479  DoCKeyOK
            }                                    * B1484
          }                                      * B1489
        ;                                        * B148E

* ROMPTR 0B4 1BB
* refs (1): A2437
ROMP_0B4_1BB:
        ::                                       * B1493
          TakeOver                               * B1498
          #       B989                           * B149D  47497
          BINT1                                  * B14A7
          BINT19                                 * B14AC
          OBJ_38345                              * B14B1
          ROMPTR  0B4 1BC                        * B14B6
          BINT25                                 * B14C1
          BINT17                                 * B14C6
          #       67                             * B14CB  103
          BINT9                                  * B14D5
          BINT5                                  * B14DA
          {                                      * B14DF
            BINT2                                * B14E4
          }                                      * B14E9
          BINT4                                  * B14EE
          #       BA2A                           * B14F3  47658
          MINUSONE                               * B14FD
          BINT1                                  * B1502
          MINUSONE                               * B1507
          LAM     'RD                            * B150C
          ONEONE                                 * B1519
          'DROPFALSE                             * B151E
          #       BA2B                           * B1523  47659
          HARDBUFF                               * B152D
          TOTEMPOB                               * B1532
          1LAMBIND                               * B1537
          DoInputForm                            * B153C
          1GETABND                               * B1541
          HARDBUFF                               * B1546
          ZEROZERO                               * B154B
          GROB!                                  * B1550
          NOT?SEMI                               * B1555
          ROMPTR  0B5 116                        * B155A
          ROMPTR  0B5 110                        * B1565
          SWAP                                   * B1570
          '                                      * B1575
          LAM     'RD                            * B157A
          STOLAM                                 * B1587
          DUP                                    * B158C
          '                                      * B1591
          LAM     'RF                            * B1596
          STOLAM                                 * B15A3
          ROMPTR  0B5 111                        * B15A8
          19PUTLAM                               * B15B3
          ROMPTR  0B3 03E                        * B15B8  ~BBReReadNElems
          ROMPTR  0B3 026                        * B15C3  ~BBReReadWidth
          BINT1                                  * B15CE
          12GETLAM                               * B15D3
          #MIN                                   * B15D8
          18PUTLAM                               * B15DD
          FALSE                                  * B15E2
          ROMPTR  0B3 019                        * B15E7  ~BBRecalOff&Disp
          NULL{}                                 * B15F2
          15PUTLAM                               * B15F7
          OBJ_1A03E                              * B15FC
        ;                                        * B1601
