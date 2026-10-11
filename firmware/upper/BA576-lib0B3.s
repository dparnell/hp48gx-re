* HP 48GX ROM revision R, #BA576-#BD8E8: Library part 0B3
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~ChooseMenu2 ~ChooseMenu1 ~ChooseMenu0 ~Choose ~BReReadMenus ~BBUpArrow ~BBSpace ~BBRunEntryProc ~BBRunENTERAction ~BBRunCanclAction ~BBRereadFullScr ~BBRereadChkEnbl
* Follows on from the previous file (at #BA576 in the original ROM).

LIB0B3:
        CON(3)  #0B3                             * BA576  library number
        REL(5)  LIB0B3.hash                      * BA579  hash table
        CON(5)  0                                * BA57E  message table
        REL(5)  LIB0B3.link                      * BA583  link table
        CON(5)  0                                * BA588  config
        RPL

* ROMPTR 0B3 000
* refs (1): BA576
~Choose:
        ::                                       * BA58D
          POLSaveUI                              * BA592
          ERRSET                                 * BA597
          ::                                     * BA59C
            DUP#0=                               * BA5A1
            ITE                                  * BA5A6
            ::                                   * BA5AB
              DROPONE                            * BA5B0
              TRUE                               * BA5B5
            ;                                    * BA5BA
            FALSE                                * BA5BF
            MINUSONE                             * BA5C4
            BINT13                               * BA5C9
            NDUPN                                * BA5CE
            DROP                                 * BA5D3
            ROMPTR  0B3 057                      * BA5D8
            FALSE                                * BA5E3
            BINT21                               * BA5E8
            ROMPTR  0B0 0DB                      * BA5ED  ~nNullBind
            ROMPTR  0B3 03B                      * BA5F8  ~BBRereadChkEnbl
            ROMPTR  0B3 03C                      * BA603  ~BBRereadFullScr
            ROMPTR  0B3 03D                      * BA60E  ~BReReadMenus
            ROMPTR  0B3 03E                      * BA619  ~BBReReadNElems
            ROMPTR  0B3 024                      * BA624  ~BBReReadHeight
            ROMPTR  0B3 023                      * BA62F  ~BBReReadPageSize
            ROMPTR  0B3 026                      * BA63A  ~BBReReadWidth
            ROMPTR  0B3 025                      * BA645  ~BBReReadCoords
            ROMPTR  0B3 04A                      * BA650
            ROMPTR  0B3 027                      * BA65B
            ROMPTR  0B3 039                      * BA666
            ROMPTR  0B3 022                      * BA671  ~BBRunEntryProc
            '                                    * BA67C
            ROMPTR  0B3 001                      * BA681
            '                                    * BA68C
            ROMPTR  0B3 008                      * BA691
            TrueTrue                             * BA69C
            13GETLAM                             * BA6A1
            ONEFALSE                             * BA6A6
            '                                    * BA6AB
            2GETLAM                              * BA6B0
            '                                    * BA6B5
            ROMPTR  0B0 000                      * BA6BA
            POLSetUI                             * BA6C5
            ClrDAsOK                             * BA6CA
            POLKeyUI                             * BA6CF
            ROMPTR  0B3 03A                      * BA6D4
            ClrDAsOK                             * BA6DF
            3GETLAM                              * BA6E4
            ROMPTR  0B3 058                      * BA6E9
            ABND                                 * BA6F4
          ;                                      * BA6F9
          ERRTRAP                                * BA6FE
          POLResUI&Err                           * BA703
          POLRestoreUI                           * BA708
        ;                                        * BA70D

* ROMPTR 0B3 001
* refs (1): BA576
ROMP_0B3_001:
        ::                                       * BA712
          DA1OK?                                 * BA717
          ?SKIP                                  * BA71C
          ROMPTR  0B3 002                        * BA721
          ROMPTR  0B3 056                        * BA72C
          DA2aOK?                                * BA737
          NOT                                    * BA73C
          AND                                    * BA741
          IT                                     * BA746
          ROMPTR  0B3 003                        * BA74B
          DA3OK?                                 * BA756
          ?SKIP                                  * BA75B
          ?DispMenu                              * BA760
          DA2bOK?                                * BA765
          ?SKIP                                  * BA76A
          ROMPTR  0B3 004                        * BA76F
          ClrDAsOK                               * BA77A
        ;                                        * BA77F

* ROMPTR 0B3 002
* refs (1): BA576
ROMP_0B3_002:
        ::                                       * BA784
          KEYINBUFFER?                           * BA789
          case                                   * BA78E
          SetDA1Bad                              * BA793
          ROMPTR  0B3 02F                        * BA798  ~BBReDrawBackgr
          SetDA1Valid                            * BA7A3
          SetDA2bBad                             * BA7A8
          ROMPTR  0B3 056                        * BA7AD
          IT                                     * BA7B8
          SetDA2aBad                             * BA7BD
        ;                                        * BA7C2

* ROMPTR 0B3 003
* refs (1): BA576
ROMP_0B3_003:
        ::                                       * BA7C7
          KEYINBUFFER?                           * BA7CC
          case                                   * BA7D1
          SetDA2aBad                             * BA7D6
          ROMPTR  0B3 030                        * BA7DB  LEDispPrompt
          SetDA2aValid                           * BA7E6
        ;                                        * BA7EB

* ROMPTR 0B3 004
* refs (1): BA576
ROMP_0B3_004:
        ::                                       * BA7F0
          KEYINBUFFER?                           * BA7F5
          case                                   * BA7FA
          SetDA2bBad                             * BA7FF
          ROMPTR  0B3 035                        * BA804  LEDispList
          KEYINBUFFER?                           * BA80F
          ?SEMI                                  * BA814
          SetDA2bValid                           * BA819
        ;                                        * BA81E

* ROMPTR 0B3 005
* refs (1): BA576
~ChooseMenu0:
        ::                                       * BA823
          NoExitAction                           * BA828
          {                                      * BA82D
            NullMenuKey                          * BA832
            NullMenuKey                          * BA837
            NullMenuKey                          * BA83C
            NullMenuKey                          * BA841
            NullMenuKey                          * BA846
            {                                    * BA84B
              $       "OK"                       * BA850
              ROMPTR  0B3 02E                    * BA85E  DoCKeyOK
            }                                    * BA869
          }                                      * BA86E
        ;                                        * BA873

* ROMPTR 0B3 006
* refs (1): BA576
~ChooseMenu1:
        ::                                       * BA878
          NoExitAction                           * BA87D
          {                                      * BA882
            NullMenuKey                          * BA887
            NullMenuKey                          * BA88C
            NullMenuKey                          * BA891
            NullMenuKey                          * BA896
            {                                    * BA89B
              $       "(AN(L"                    * BA8A0
              ROMPTR  0B3 02D                    * BA8B4  DoCKeyCancel
            }                                    * BA8BF
            {                                    * BA8C4
              $       "OK"                       * BA8C9
              ROMPTR  0B3 02E                    * BA8D7  DoCKeyOK
            }                                    * BA8E2
          }                                      * BA8E7
        ;                                        * BA8EC

* ROMPTR 0B3 007
* refs (1): BA576
~ChooseMenu2:
        ::                                       * BA8F1
          NoExitAction                           * BA8F6
          {                                      * BA8FB
            NullMenuKey                          * BA900
            NullMenuKey                          * BA905
            {                                    * BA90A
              ::                                 * BA90F
                TakeOver                         * BA914
                ROMPTR  0B3 05B                  * BA919  ~BBEmpty?
                ITE                              * BA924
                NULL$                            * BA929
                ROMPTR  0B0 086                  * BA92E  ~grobCheckKey
              ;                                  * BA939
              {                                  * BA93E
                ROMPTR  0B3 02A                  * BA943  DoCKeyCheck
                ROMPTR  0B3 02B                  * BA94E  DoCKeyChAll
                ROMPTR  0B3 02C                  * BA959  DoCKeyUnChAll
              }                                  * BA964
            }                                    * BA969
            NullMenuKey                          * BA96E
            {                                    * BA973
              $       "(AN(L"                    * BA978
              ROMPTR  0B3 02D                    * BA98C  DoCKeyCancel
            }                                    * BA997
            {                                    * BA99C
              $       "OK"                       * BA9A1
              ROMPTR  0B3 02E                    * BA9AF  DoCKeyOK
            }                                    * BA9BA
          }                                      * BA9BF
        ;                                        * BA9C4

* ROMPTR 0B3 008
* refs (1): BA576
ROMP_0B3_008:
        ::                                       * BA9C9
          BINT1                                  * BA9CE
          #=casedrop                             * BA9D3
          ROMPTR  0B3 009                        * BA9D8
          BINT2                                  * BA9E3
          #=casedrop                             * BA9E8
          ROMPTR  0B3 00A                        * BA9ED
          BINT3                                  * BA9F8
          #=casedrop                             * BA9FD
          ROMPTR  0B3 00B                        * BAA02
          BINT4                                  * BAA0D
          #=casedrop                             * BAA12
          ROMPTR  0B3 00C                        * BAA17
          BINT5                                  * BAA22
          #=casedrop                             * BAA27
          ROMPTR  0B3 00D                        * BAA2C
          BINT6                                  * BAA37
          #=casedrop                             * BAA3C
          ROMPTR  0B3 00E                        * BAA41
        ;                                        * BAA4C

* ROMPTR 0B3 009
* refs (1): BA576
ROMP_0B3_009:
        ::                                       * BAA51
          {                                      * BAA56
            BINT11                               * BAA5B
            ROMPTR  0B3 01A                      * BAA60
            BINT17                               * BAA6B
            ROMPTR  0B3 01C                      * BAA70
            BINT26                               * BAA7B
            ROMPTR  0B3 02A                      * BAA80  DoCKeyCheck
            BINT25                               * BAA8B
            ROMPTR  0B3 02E                      * BAA90  DoCKeyOK
            BINT45                               * BAA9B
            ROMPTR  0B3 02D                      * BAAA0  DoCKeyCancel
          }                                      * BAAAB
          OBJ_19FE4                              * BAAB0
          caseTRUE                               * BAAB5
          BINT30                                 * BAABA
          #=casedrpfls                           * BAABF
          DUP#<7                                 * BAAC4
          casedrpfls                             * BAAC9
          BINT12                                 * BAACE
          #=casedrpfls                           * BAAD3
          BINT35                                 * BAAD8
          #=casedrpfls                           * BAADD
          BINT40                                 * BAAE2
          #=casedrpfls                           * BAAE7
          BINT1                                  * BAAEC
          ROMPTR  0B3 00F                        * BAAF1
        ;                                        * BAAFC

* ROMPTR 0B3 00A
* refs (1): BA576
ROMP_0B3_00A:
        ::                                       * BAB01
          {                                      * BAB06
            BINT11                               * BAB0B
            ROMPTR  0B3 01E                      * BAB10
            BINT17                               * BAB1B
            ROMPTR  0B3 01F                      * BAB20
          }                                      * BAB2B
          OBJ_19FE4                              * BAB30
          caseTRUE                               * BAB35
          DUP#<7                                 * BAB3A
          casedrpfls                             * BAB3F
          BINT12                                 * BAB44
          #=casedrpfls                           * BAB49
          BINT35                                 * BAB4E
          #=casedrpfls                           * BAB53
          BINT40                                 * BAB58
          #=casedrpfls                           * BAB5D
          BINT2                                  * BAB62
          ROMPTR  0B3 00F                        * BAB67
        ;                                        * BAB72

* ROMPTR 0B3 00B
* refs (1): BA576
ROMP_0B3_00B:
        ::                                       * BAB77
          {                                      * BAB7C
            BINT11                               * BAB81
            ROMPTR  0B3 020                      * BAB86
            BINT17                               * BAB91
            ROMPTR  0B3 021                      * BAB96
          }                                      * BABA1
          OBJ_19FE4                              * BABA6
          caseTRUE                               * BABAB
          BINT45                                 * BABB0
          #=casedrpfls                           * BABB5
          DUP#<7                                 * BABBA
          casedrpfls                             * BABBF
          BINT35                                 * BABC4
          #=casedrpfls                           * BABC9
          BINT40                                 * BABCE
          #=casedrpfls                           * BABD3
          BINT3                                  * BABD8
          ROMPTR  0B3 00F                        * BABDD
        ;                                        * BABE8

* ROMPTR 0B3 00C
* refs (1): BA576
ROMP_0B3_00C:
        ::                                       * BABED
          {                                      * BABF2
            BINT25                               * BABF7
            ROMPTR  0B3 02E                      * BABFC  DoCKeyOK
            BINT45                               * BAC07
            ROMPTR  0B3 02D                      * BAC0C  DoCKeyCancel
          }                                      * BAC17
          OBJ_19FE4                              * BAC1C
          caseTRUE                               * BAC21
          BINT30                                 * BAC26
          #=casedrpfls                           * BAC2B
          BINT35                                 * BAC30
          #=casedrpfls                           * BAC35
          BINT40                                 * BAC3A
          #=casedrpfls                           * BAC3F
          BINT4                                  * BAC44
          ROMPTR  0B3 00F                        * BAC49
        ;                                        * BAC54

* ROMPTR 0B3 00D
* refs (1): BA576
ROMP_0B3_00D:
        ::                                       * BAC59
          BINT30                                 * BAC5E
          #=casedrpfls                           * BAC63
          BINT35                                 * BAC68
          #=casedrpfls                           * BAC6D
          BINT40                                 * BAC72
          #=casedrpfls                           * BAC77
          BINT5                                  * BAC7C
          ROMPTR  0B3 00F                        * BAC81
        ;                                        * BAC8C

* ROMPTR 0B3 00E
* refs (1): BA576
ROMP_0B3_00E:
        ::                                       * BAC91
          BINT35                                 * BAC96
          #=casedrpfls                           * BAC9B
          BINT40                                 * BACA0
          #=casedrpfls                           * BACA5
          BINT45                                 * BACAA
          #=casedrpfls                           * BACAF
          BINT6                                  * BACB4
          ROMPTR  0B3 00F                        * BACB9
        ;                                        * BACC4

* ROMPTR 0B3 00F
* refs (1): BA576
ROMP_0B3_00F:
        ::                                       * BACC9
          Key>U/SKeyOb                           * BACCE
          DUPTYPECHAR?                           * BACD3
          case                                   * BACD8
          ROMPTR  0B3 010                        * BACDD
          DUPTYPECSTR?                           * BACE8
          case                                   * BACED
          ::                                     * BACF2
            ROMPTR  0B3 013                      * BACF7
            ROMPTR  0B3 010                      * BAD02
          ;                                      * BAD0D
          DROP                                   * BAD12
          'DoBadKeyT                             * BAD17
        ;                                        * BAD1C

* ROMPTR 0B3 010
* refs (1): BA576
ROMP_0B3_010:
        ::                                       * BAD21
          '                                      * BAD26
          TakeOver                               * BAD2B
          SWAP                                   * BAD30
          BINT2                                  * BAD35
          ::N                                    * BAD3A
          '                                      * BAD3F
          ROMPTR  0B3 011                        * BAD44
          >TCOMP                                 * BAD4F
          TRUE                                   * BAD54
        ;                                        * BAD59

* ROMPTR 0B3 011
* refs (1): BA576
ROMP_0B3_011:
        ::                                       * BAD5E
          '                                      * BAD63
          ROMPTR  0B3 03F                        * BAD68  ~BBGetN
          12GETLAM                               * BAD73
          20GETLAM                               * BAD78
          18GETLAM                               * BAD7D
          #1+                                    * BAD82
          5ROLL                                  * BAD87
          ROMPTR  0B0 09E                        * BAD8C
          NOTcase                                * BAD97
          DoBadKey                               * BAD9C
          ROMPTR  0B3 015                        * BADA1  ~BBMoveTo
        ;                                        * BADAC

* ROMPTR 0B3 012
* refs (1): BA576
ROMP_0B3_012:
        ::                                       * BADB1
          DUP                                    * BADB6
          CHR>#                                  * BADBB
          BINT97                                 * BADC0
          OVER#>                                 * BADC5
          caseDROP                               * BADCA
          BINT122                                * BADCF
          OVER#<                                 * BADD4
          caseDROP                               * BADD9
          SWAPDROP                               * BADDE
          BINT32                                 * BADE3
          #-                                     * BADE8
          #>CHR                                  * BADED
        ;                                        * BADF2

* ROMPTR 0B3 013
* refs (1): BA576
ROMP_0B3_013:
        ::                                       * BADF7
          DUPNULL$?                              * BADFC
          casedrop                               * BAE01
          CHR_00                                 * BAE06
          FALSE                                  * BAE0B
          SWAP                                   * BAE10
          DUPLEN$                                * BAE15
          #1+_ONE_DO                             * BAE1A
          DUP                                    * BAE1F
          INDEX@                                 * BAE24
          DUP                                    * BAE29
          SUB$                                   * BAE2E
          CAR$                                   * BAE33
          DUP                                    * BAE38
          ROMPTR  0B3 014                        * BAE3D
          ITE                                    * BAE48
          ::                                     * BAE4D
            ROTROT2DROP                          * BAE52
            TRUE                                 * BAE57
            SWAP                                 * BAE5C
            ExitAtLOOP                           * BAE61
          ;                                      * BAE66
          DROP                                   * BAE6B
          LOOP                                   * BAE70
          SWAP                                   * BAE75
          ?SEMI                                  * BAE7A
          DROP                                   * BAE7F
          PTR     CHR_:                          * BAE84
        ;                                        * BAE89

* ROMPTR 0B3 014
* refs (1): BA576
ROMP_0B3_014:
        ::                                       * BAE8E
          CHR>#                                  * BAE93
          BINT48                                 * BAE98
          OVER#>                                 * BAE9D
          casedrop                               * BAEA2
          FALSE                                  * BAEA7
          BINT58                                 * BAEAC
          OVER#>                                 * BAEB1
          casedrop                               * BAEB6
          TRUE                                   * BAEBB
          ROMPTR  0B3 012                        * BAEC0
          BINT65                                 * BAECB
          OVER#>                                 * BAED0
          casedrop                               * BAED5
          FALSE                                  * BAEDA
          BINT91                                 * BAEDF
          OVER#>                                 * BAEE4
          casedrop                               * BAEE9
          TRUE                                   * BAEEE
          DROPFALSE                              * BAEF3
        ;                                        * BAEF8

* ROMPTR 0B3 015
* refs (1): BA576
~BBMoveTo:
        ::                                       * BAEFD
          SetDA12a3NCh                           * BAF02
          18GETLAM                               * BAF07
          2DUP                                   * BAF0C
          #=                                     * BAF11
          case2drop                              * BAF16
          SetDA123NoCh                           * BAF1B
          OVER                                   * BAF20
          18PUTLAM                               * BAF25
          2DUP                                   * BAF2A
          #>                                     * BAF2F
          ITE                                    * BAF34
          ::                                     * BAF39
            #-                                   * BAF3E
            DUP                                  * BAF43
            #1=                                  * BAF48
            6GETLAM                              * BAF4D
            11GETLAM                             * BAF52
            #=                                   * BAF57
            AND                                  * BAF5C
            casedrop                             * BAF61
            ROMPTR  0B3 016                      * BAF66
            6GETLAM                              * BAF71
            #+                                   * BAF76
            DUP                                  * BAF7B
            11GETLAM                             * BAF80
            #>                                   * BAF85
            NOTcase                              * BAF8A
            ::                                   * BAF8F
              6GETLAM                            * BAF94
              SWAP                               * BAF99
              DUP                                * BAF9E
              6PUTLAM                            * BAFA3
              ROMPTR  0B3 018                    * BAFA8
            ;                                    * BAFB3
            DROP                                 * BAFB8
            TRUE                                 * BAFBD
            ROMPTR  0B3 019                      * BAFC2  ~BBRecalOff&Disp
          ;                                      * BAFCD
          ::                                     * BAFD2
            SWAP                                 * BAFD7
            #-                                   * BAFDC
            DUP                                  * BAFE1
            #1=                                  * BAFE6
            6GETLAM                              * BAFEB
            #1=                                  * BAFF0
            AND                                  * BAFF5
            casedrop                             * BAFFA
            ROMPTR  0B3 017                      * BAFFF
            DUP                                  * BB00A
            6GETLAM                              * BB00F
            #<                                   * BB014
            case                                 * BB019
            ::                                   * BB01E
              6GETLAM                            * BB023
              DUPROT                             * BB028
              #-                                 * BB02D
              DUP                                * BB032
              6PUTLAM                            * BB037
              ROMPTR  0B3 018                    * BB03C
            ;                                    * BB047
            DROP                                 * BB04C
            TRUE                                 * BB051
            ROMPTR  0B3 019                      * BB056  ~BBRecalOff&Disp
          ;                                      * BB061
        ;                                        * BB066

* ROMPTR 0B3 016
* refs (1): BA576
ROMP_0B3_016:
        ::                                       * BB06B
          DA2bBad?                               * BB070
          ?SEMI                                  * BB075
          10GETLAM                               * BB07A
          9GETLAM                                * BB07F
          2DUP                                   * BB084
          7GETLAM                                * BB089
          #+                                     * BB08E
          OVER                                   * BB093
          8GETLAM                                * BB098
          #+                                     * BB09D
          OVER                                   * BB0A2
          11GETLAM                               * BB0A7
          #1-                                    * BB0AC
          7GETLAM                                * BB0B1
          #*                                     * BB0B6
          #+                                     * BB0BB
          HARDBUFF                               * BB0C0
          5UNROLL                                * BB0C5
          6GETLAM                                * BB0CA
          ROMPTR  0B3 04E                        * BB0CF
          SUBGROB                                * BB0DA
          3UNROLL                                * BB0DF
          HARDBUFF                               * BB0E4
          3UNROLL                                * BB0E9
          GROB!                                  * BB0EE
          18GETLAM                               * BB0F3
          6GETLAM                                * BB0F8
          ROMPTR  0B3 036                        * BB0FD  LEDispItem
          ROMPTR  0B3 04F                        * BB108
          SetDA2bNoCh                            * BB113
        ;                                        * BB118

* ROMPTR 0B3 017
* refs (1): BA576
ROMP_0B3_017:
        ::                                       * BB11D
          DA2bBad?                               * BB122
          ?SEMI                                  * BB127
          10GETLAM                               * BB12C
          9GETLAM                                * BB131
          2DUP                                   * BB136
          OVER                                   * BB13B
          8GETLAM                                * BB140
          #+                                     * BB145
          OVER                                   * BB14A
          11GETLAM                               * BB14F
          #1-                                    * BB154
          7GETLAM                                * BB159
          #*                                     * BB15E
          #+                                     * BB163
          HARDBUFF                               * BB168
          5UNROLL                                * BB16D
          6GETLAM                                * BB172
          ROMPTR  0B3 04E                        * BB177
          SUBGROB                                * BB182
          3UNROLL                                * BB187
          7GETLAM                                * BB18C
          #+                                     * BB191
          HARDBUFF                               * BB196
          3UNROLL                                * BB19B
          GROB!                                  * BB1A0
          18GETLAM                               * BB1A5
          6GETLAM                                * BB1AA
          ROMPTR  0B3 036                        * BB1AF  LEDispItem
          ROMPTR  0B3 04F                        * BB1BA
          SetDA2bNoCh                            * BB1C5
        ;                                        * BB1CA

* ROMPTR 0B3 018
* refs (1): BA576
ROMP_0B3_018:
        ::                                       * BB1CF
          2DUP                                   * BB1D4
          #=                                     * BB1D9
          case2drop                              * BB1DE
          SetDA2bNoCh                            * BB1E3
          SWAP                                   * BB1E8
          ROMPTR  0B3 04E                        * BB1ED
          ROMPTR  0B3 04D                        * BB1F8
          SetDA2bNoCh                            * BB203
        ;                                        * BB208

* ROMPTR 0B3 019
* refs (1): BA576
~BBRecalOff&Disp:
        ::                                       * BB20D
          ROMPTR  0B3 05B                        * BB212  ~BBEmpty?
          caseDROP                               * BB21D
          6GETLAM                                * BB222
          DUP                                    * BB227
          18GETLAM                               * BB22C
          #MIN                                   * BB231
          6PUTLAM                                * BB236
          12GETLAM                               * BB23B
          11GETLAM                               * BB240
          #MAX                                   * BB245
          18GETLAM                               * BB24A
          #-                                     * BB24F
          11GETLAM                               * BB254
          DUPUNROT                               * BB259
          #MIN                                   * BB25E
          #-                                     * BB263
          6GETLAM                                * BB268
          #MAX                                   * BB26D
          6PUTLAM                                * BB272
          SWAP                                   * BB277
          NOTcaseDROP                            * BB27C
          ROMPTR  0B3 04E                        * BB281
        ;                                        * BB28C

* ROMPTR 0B3 01A
* refs (1): BA576
ROMP_0B3_01A:
        ::                                       * BB291
          TakeOver                               * BB296
          ROMPTR  0B3 05B                        * BB29B  ~BBEmpty?
          case                                   * BB2A6
          DoBadKey                               * BB2AB
          ROMPTR  0B3 05A                        * BB2B0  ~BBPgUp
          REPEATERCH                             * BB2BB
          BINT11                                 * BB2C0
          ROMPTR  0B3 01B                        * BB2C5
          SetDA123NoCh                           * BB2D0
        ;                                        * BB2D5

* ROMPTR 0B3 01B
* refs (1): BA576
ROMP_0B3_01B:
        ::                                       * BB2DA
          18GETLAM                               * BB2DF
          #1-                                    * BB2E4
          DUP#0=                                 * BB2E9
          IT                                     * BB2EE
          ::                                     * BB2F3
            DROP                                 * BB2F8
            12GETLAM                             * BB2FD
          ;                                      * BB302
          ROMPTR  0B3 015                        * BB307  ~BBMoveTo
          DA2bOK?                                * BB312
          ?SKIP                                  * BB317
          ROMPTR  0B3 004                        * BB31C
          ClrDA2bOK                              * BB327
        ;                                        * BB32C

* ROMPTR 0B3 01C
* refs (1): BA576
ROMP_0B3_01C:
        ::                                       * BB331
          TakeOver                               * BB336
          ROMPTR  0B3 05B                        * BB33B  ~BBEmpty?
          case                                   * BB346
          DoBadKey                               * BB34B
          ROMPTR  0B3 059                        * BB350  ~BBPgDown
          REPEATERCH                             * BB35B
          BINT17                                 * BB360
          ROMPTR  0B3 01D                        * BB365
          SetDA123NoCh                           * BB370
        ;                                        * BB375

* ROMPTR 0B3 01D
* refs (1): BA576
ROMP_0B3_01D:
        ::                                       * BB37A
          18GETLAM                               * BB37F
          #1+                                    * BB384
          DUP                                    * BB389
          12GETLAM                               * BB38E
          #>                                     * BB393
          IT                                     * BB398
          ::                                     * BB39D
            DROP                                 * BB3A2
            BINT1                                * BB3A7
          ;                                      * BB3AC
          ROMPTR  0B3 015                        * BB3B1  ~BBMoveTo
          DA2bOK?                                * BB3BC
          ?SKIP                                  * BB3C1
          ROMPTR  0B3 004                        * BB3C6
          ClrDA2bOK                              * BB3D1
        ;                                        * BB3D6

* ROMPTR 0B3 01E
* refs (1): BA576
ROMP_0B3_01E:
        ::                                       * BB3DB
          TakeOver                               * BB3E0
          ROMPTR  0B3 05B                        * BB3E5  ~BBEmpty?
          case                                   * BB3F0
          DoBadKey                               * BB3F5
          ROMPTR  0B3 05A                        * BB3FA  ~BBPgUp
          18GETLAM                               * BB405
          DUP#1=                                 * BB40A
          casedrop                               * BB40F
          DoBadKey                               * BB414
          11GETLAM                               * BB419
          2DUP                                   * BB41E
          #>ITE                                  * BB423
          #-                                     * BB428
          ::                                     * BB42D
            2DROP                                * BB432
            BINT1                                * BB437
          ;                                      * BB43C
          ROMPTR  0B3 015                        * BB441  ~BBMoveTo
        ;                                        * BB44C

* ROMPTR 0B3 01F
* refs (1): BA576
ROMP_0B3_01F:
        ::                                       * BB451
          TakeOver                               * BB456
          ROMPTR  0B3 05B                        * BB45B  ~BBEmpty?
          case                                   * BB466
          DoBadKey                               * BB46B
          ROMPTR  0B3 059                        * BB470  ~BBPgDown
          12GETLAM                               * BB47B
          18GETLAM                               * BB480
          2DUP                                   * BB485
          #=                                     * BB48A
          case2drop                              * BB48F
          DoBadKey                               * BB494
          11GETLAM                               * BB499
          #+                                     * BB49E
          #MIN                                   * BB4A3
          ROMPTR  0B3 015                        * BB4A8  ~BBMoveTo
        ;                                        * BB4B3

* ROMPTR 0B3 020
* refs (1): BA576
ROMP_0B3_020:
        ::                                       * BB4B8
          TakeOver                               * BB4BD
          ROMPTR  0B3 05B                        * BB4C2  ~BBEmpty?
          case                                   * BB4CD
          DoBadKey                               * BB4D2
          BINT1                                  * BB4D7
          ROMPTR  0B3 015                        * BB4DC  ~BBMoveTo
        ;                                        * BB4E7

* ROMPTR 0B3 021
* refs (1): BA576
ROMP_0B3_021:
        ::                                       * BB4EC
          TakeOver                               * BB4F1
          ROMPTR  0B3 05B                        * BB4F6  ~BBEmpty?
          case                                   * BB501
          DoBadKey                               * BB506
          12GETLAM                               * BB50B
          ROMPTR  0B3 015                        * BB510  ~BBMoveTo
        ;                                        * BB51B

* ROMPTR 0B3 022
* refs (1): BA576
~BBRunEntryProc:
        ::                                       * BB520
          BINT85                                 * BB525
          ROMPTR  0B3 055                        * BB52A
          DROP                                   * BB535
        ;                                        * BB53A

* ROMPTR 0B3 023
* refs (1): BA576
~BBReReadPageSize:
        ::                                       * BB53F
          BINT57                                 * BB544
          ROMPTR  0B3 055                        * BB549
          case                                   * BB554
          11PUTLAM                               * BB559
          14GETLAM                               * BB55E
          case                                   * BB563
          ::                                     * BB568
            BINT6                                * BB56D
            ROMPTR  0B3 056                      * BB572
            IT                                   * BB57D
            #1-                                  * BB582
            11PUTLAM                             * BB587
          ;                                      * BB58C
          BINT5                                  * BB591
          ROMPTR  0B3 056                        * BB596
          IT                                     * BB5A1
          #1-                                    * BB5A6
          12GETLAM                               * BB5AB
          #MIN                                   * BB5B0
          BINT2                                  * BB5B5
          #MAX                                   * BB5BA
          11PUTLAM                               * BB5BF
        ;                                        * BB5C4

* ROMPTR 0B3 024
* refs (1): BA576
~BBReReadHeight:
        ::                                       * BB5C9
          BINT58                                 * BB5CE
          ROMPTR  0B3 055                        * BB5D3
          ?SKIP                                  * BB5DE
          BINT9                                  * BB5E3
          7PUTLAM                                * BB5E8
        ;                                        * BB5ED

* ROMPTR 0B3 025
* refs (1): BA576
~BBReReadCoords:
        ::                                       * BB5F2
          BINT63                                 * BB5F7
          ROMPTR  0B3 055                        * BB5FC
          case                                   * BB607
          ::                                     * BB60C
            9PUTLAM                              * BB611
            10PUTLAM                             * BB616
          ;                                      * BB61B
          14GETLAM                               * BB620
          case                                   * BB625
          ::                                     * BB62A
            BINT0                                * BB62F
            10PUTLAM                             * BB634
            BINT0                                * BB639
            ROMPTR  0B3 044                      * BB63E
            9PUTLAM                              * BB649
          ;                                      * BB64E
          BINT65                                 * BB653
          8GETLAM                                * BB658
          ROMPTR  0B3 046                        * BB65D
          #7+                                    * BB668
          #2/                                    * BB66D
          #-                                     * BB672
          #3+                                    * BB677
          10PUTLAM                               * BB67C
          BINT28                                 * BB681
          7GETLAM                                * BB686
          11GETLAM                               * BB68B
          #*                                     * BB690
          ROMPTR  0B3 044                        * BB695
          #7+                                    * BB6A0
          #2/                                    * BB6A5
          #-                                     * BB6AA
          ROMPTR  0B3 044                        * BB6AF
          #3+                                    * BB6BA
          9PUTLAM                                * BB6BF
        ;                                        * BB6C4

* ROMPTR 0B3 026
* refs (1): BA576
~BBReReadWidth:
        ::                                       * BB6C9
          BINT59                                 * BB6CE
          ROMPTR  0B3 055                        * BB6D3
          case                                   * BB6DE
          8PUTLAM                                * BB6E3
          14GETLAM                               * BB6E8
          ITE                                    * BB6ED
          BINT131                                * BB6F2
          BINT91                                 * BB6F7
          ROMPTR  0B3 047                        * BB6FC
          8PUTLAM                                * BB707
        ;                                        * BB70C

* ROMPTR 0B3 027
* refs (1): BA576
ROMP_0B3_027:
        ::                                       * BB711
          BINT64                                 * BB716
          ROMPTR  0B3 055                        * BB71B
          case                                   * BB726
          6PUTLAM                                * BB72B
          18GETLAM                               * BB730
          11GETLAM                               * BB735
          #MIN                                   * BB73A
          6PUTLAM                                * BB73F
        ;                                        * BB744

* ROMPTR 0B3 028
* refs (1): BA576
~BBRunENTERAction:
        ::                                       * BB749
          BINT96                                 * BB74E
          ROMPTR  0B3 055                        * BB753
          ?SEMI                                  * BB75E
          TRUE                                   * BB763
        ;                                        * BB768

* ROMPTR 0B3 029
* refs (1): BA576
~BBRunCanclAction:
        ::                                       * BB76D
          BINT91                                 * BB772
          ROMPTR  0B3 055                        * BB777
          ?SEMI                                  * BB782
          TRUE                                   * BB787
        ;                                        * BB78C

* ROMPTR 0B3 02A
* refs (1): BA576
DoCKeyCheck:
        ::                                       * BB791
          TakeOver                               * BB796
          ROMPTR  0B3 05B                        * BB79B  ~BBEmpty?
          16GETLAM                               * BB7A6
          NOT                                    * BB7AB
          ORcase                                 * BB7B0
          DoBadKey                               * BB7B5
          18GETLAM                               * BB7BA
          ROMPTR  0B3 040                        * BB7BF
          DA2aBad?                               * BB7CA
          ?SEMI                                  * BB7CF
          18GETLAM                               * BB7D4
          ROMPTR  0B3 04B                        * BB7D9  ~BBIsChecked?
          ITE                                    * BB7E4
          ROMPTR  0B0 080                        * BB7E9
          ROMPTR  0B0 084                        * BB7F4
          HARDBUFF                               * BB7FF
          10GETLAM                               * BB804
          6GETLAM                                * BB809
          #1-                                    * BB80E
          7GETLAM                                * BB813
          #*                                     * BB818
          9GETLAM                                * BB81D
          #+                                     * BB822
          GROB!                                  * BB827
          SetDA123NoCh                           * BB82C
        ;                                        * BB831

* ROMPTR 0B3 02B
* refs (1): BA576
DoCKeyChAll:
        ::                                       * BB836
          TakeOver                               * BB83B
          ROMPTR  0B3 05B                        * BB840  ~BBEmpty?
          16GETLAM                               * BB84B
          NOT                                    * BB850
          ORcase                                 * BB855
          DoBadKey                               * BB85A
          BINT0                                  * BB85F
          ROMPTR  0B3 040                        * BB864
          SetDA12a3NCh                           * BB86F
        ;                                        * BB874

* ROMPTR 0B3 02C
* refs (1): BA576
DoCKeyUnChAll:
        ::                                       * BB879
          TakeOver                               * BB87E
          ROMPTR  0B3 05B                        * BB883  ~BBEmpty?
          16GETLAM                               * BB88E
          NOT                                    * BB893
          ORcase                                 * BB898
          DoBadKey                               * BB89D
          MINUSONE                               * BB8A2
          ROMPTR  0B3 040                        * BB8A7
          SetDA12a3NCh                           * BB8B2
        ;                                        * BB8B7

* ROMPTR 0B3 02D
* refs (1): BA576
DoCKeyCancel:
        ::                                       * BB8BC
          TakeOver                               * BB8C1
          ROMPTR  0B3 029                        * BB8C6  ~BBRunCanclAction
          NOTcase                                * BB8D1
          SetDA123NoCh                           * BB8D6
          FALSE                                  * BB8DB
          TRUE                                   * BB8E0
          2PUTLAM                                * BB8E5
        ;                                        * BB8EA

* ROMPTR 0B3 02E
* refs (1): BA576
DoCKeyOK:
        ::                                       * BB8EF
          TakeOver                               * BB8F4
          ROMPTR  0B3 028                        * BB8F9  ~BBRunENTERAction
          NOTcase                                * BB904
          SetDA123NoCh                           * BB909
          TRUE                                   * BB90E
          2PUTLAM                                * BB913
          ROMPTR  0B3 05B                        * BB918  ~BBEmpty?
          caseFALSE                              * BB923
          17GETLAM                               * BB928
          caseFALSE                              * BB92D
          16GETLAM                               * BB932
          NOTcase                                * BB937
          ::                                     * BB93C
            18GETLAM                             * BB941
            ROMPTR  0B3 03F                      * BB946  ~BBGetN
            TRUE                                 * BB951
          ;                                      * BB956
          15GETLAM                               * BB95B
          DUPNULLCOMP?                           * BB960
          casedrop                               * BB965
          ::                                     * BB96A
            18GETLAM                             * BB96F
            ROMPTR  0B3 03F                      * BB974  ~BBGetN
            ONE{}N                               * BB97F
            TRUE                                 * BB984
          ;                                      * BB989
          INNERCOMP                              * BB98E
          DUP                                    * BB993
          13PUTLAM                               * BB998
          ZERO_DO                                * BB99D
          ISTOP@                                 * BB9A2
          ROLL                                   * BB9A7
          ROMPTR  0B3 03F                        * BB9AC  ~BBGetN
          LOOP                                   * BB9B7
          13GETLAM                               * BB9BC
          {}N                                    * BB9C1
          TRUE                                   * BB9C6
        ;                                        * BB9CB

* ROMPTR 0B3 02F
* refs (1): BA576
~BBReDrawBackgr:
        ::                                       * BB9D0
          BINT65                                 * BB9D5
          ROMPTR  0B3 055                        * BB9DA
          ?SEMI                                  * BB9E5
          14GETLAM                               * BB9EA
          case                                   * BB9EF
          BlankDA12                              * BB9F4
          ROMPTR  0B3 041                        * BB9F9
          case                                   * BBA04
          ROMPTR  0B3 042                        * BBA09
          7GETLAM                                * BBA14
          11GETLAM                               * BBA19
          #*                                     * BBA1E
          ROMPTR  0B3 044                        * BBA23
          #7+                                    * BBA2E
          8GETLAM                                * BBA33
          ROMPTR  0B3 046                        * BBA38
          #7+                                    * BBA43
          MAKEGROB                               * BBA48
          HARDBUFF                               * BBA4D
          10GETLAM                               * BBA52
          #3-                                    * BBA57
          9GETLAM                                * BBA5C
          ROMPTR  0B3 045                        * BBA61
          #3-                                    * BBA6C
          GROB!                                  * BBA71
          10GETLAM                               * BBA76
          #2-                                    * BBA7B
          9GETLAM                                * BBA80
          ROMPTR  0B3 045                        * BBA85
          #2-                                    * BBA90
          OVER                                   * BBA95
          8GETLAM                                * BBA9A
          ROMPTR  0B3 046                        * BBA9F
          #+                                     * BBAAA
          #3+                                    * BBAAF
          OVER                                   * BBAB4
          7GETLAM                                * BBAB9
          11GETLAM                               * BBABE
          #*                                     * BBAC3
          #+                                     * BBAC8
          ROMPTR  0B3 044                        * BBACD
          #3+                                    * BBAD8
          4PICK                                  * BBADD
          4PICK                                  * BBAE2
          4PICKOVER                              * BBAE7
          LINEON                                 * BBAEC
          OVER                                   * BBAF1
          4PICKOVER                              * BBAF6
          4PICK                                  * BBAFB
          LINEON                                 * BBB00
          4PICKOVER                              * BBB05
          4PICKOVER                              * BBB0A
          LINEON                                 * BBB0F
          4PICKOVER                              * BBB14
          OVER                                   * BBB19
          6PICK                                  * BBB1E
          LINEON                                 * BBB23
          OVER                                   * BBB28
          #1+                                    * BBB2D
          4PICK                                  * BBB32
          #1+                                    * BBB37
          OVER                                   * BBB3C
          4PICK                                  * BBB41
          #1+                                    * BBB46
          LINEON                                 * BBB4B
          4ROLL                                  * BBB50
          #1+                                    * BBB55
          SWAP                                   * BBB5A
          #1+                                    * BBB5F
          ROTOVER                                * BBB64
          LINEON                                 * BBB69
          DROP                                   * BBB6E
        ;                                        * BBB73

* ROMPTR 0B3 030
* refs (1): BA576
LEDispPrompt:
        ::                                       * BBB78
          BINT66                                 * BBB7D
          ROMPTR  0B3 055                        * BBB82
          ?SEMI                                  * BBB8D
          ROMPTR  0B3 031                        * BBB92
          HARDBUFF                               * BBB9D
          ROMPTR  0B3 043                        * BBBA2
          ROMPTR  0B3 049                        * BBBAD
          GROB!                                  * BBBB8
          14GETLAM                               * BBBBD
          ?SEMI                                  * BBBC2
          ROMPTR  0B3 04C                        * BBBC7
        ;                                        * BBBD2

* ROMPTR 0B3 031
* refs (1): BA576
ROMP_0B3_031:
        ::                                       * BBBD7
          BINT67                                 * BBBDC
          ROMPTR  0B3 055                        * BBBE1
          ?SEMI                                  * BBBEC
          14GETLAM                               * BBBF1
          ITE                                    * BBBF6
          ROMPTR  0B3 032                        * BBBFB
          ROMPTR  0B3 033                        * BBC06
        ;                                        * BBC11

* ROMPTR 0B3 032
* refs (1): BA576
ROMP_0B3_032:
        ::                                       * BBC16
          BINT68                                 * BBC1B
          ROMPTR  0B3 055                        * BBC20
          ?SEMI                                  * BBC2B
          ROMPTR  0B3 034                        * BBC30
          ROMPTR  0B0 0A5                        * BBC3B
        ;                                        * BBC46

* ROMPTR 0B3 033
* refs (1): BA576
ROMP_0B3_033:
        ::                                       * BBC4B
          BINT69                                 * BBC50
          ROMPTR  0B3 055                        * BBC55
          ?SEMI                                  * BBC60
          ROMPTR  0B3 034                        * BBC65
          $>grob                                 * BBC70
        ;                                        * BBC75

* ROMPTR 0B3 034
* refs (1): BA576
ROMP_0B3_034:
        ::                                       * BBC7A
          BINT70                                 * BBC7F
          ROMPTR  0B3 055                        * BBC84
          ?SEMI                                  * BBC8F
          21GETLAM                               * BBC94
          OBJ_1A002                              * BBC99
        ;                                        * BBC9E

* ROMPTR 0B3 035
* refs (1): BA576
LEDispList:
        ::                                       * BBCA3
          BINT74                                 * BBCA8
          ROMPTR  0B3 055                        * BBCAD
          ?SEMI                                  * BBCB8
          ROMPTR  0B3 05B                        * BBCBD  ~BBEmpty?
          ?SEMI                                  * BBCC8
          18GETLAM                               * BBCCD
          6GETLAM                                * BBCD2
          #1--                                   * BBCD7
          11GETLAM                               * BBCDC
          ZERO_DO                                * BBCE1
          DUP                                    * BBCE6
          INDEX@                                 * BBCEB
          #+                                     * BBCF0
          DUP                                    * BBCF5
          12GETLAM                               * BBCFA
          #>ITE                                  * BBCFF
          DROP                                   * BBD04
          ::                                     * BBD09
            INDEX@                               * BBD0E
            #1+                                  * BBD13
            ROMPTR  0B3 036                      * BBD18  LEDispItem
          ;                                      * BBD23
          LOOP                                   * BBD28
          DROP                                   * BBD2D
          ROMPTR  0B3 04F                        * BBD32
        ;                                        * BBD3D

* ROMPTR 0B3 036
* refs (1): BA576
LEDispItem:
        ::                                       * BBD42
          BINT79                                 * BBD47
          ROMPTR  0B3 055                        * BBD4C
          ?SEMI                                  * BBD57
          OVER                                   * BBD5C
          ROMPTR  0B3 037                        * BBD61  ~BBGetNGrob
          ROT                                    * BBD6C
          18GETLAM                               * BBD71
          #=                                     * BBD76
          17GETLAM                               * BBD7B
          NOTAND                                 * BBD80
          IT                                     * BBD85
          INVGROB                                * BBD8A
          HARDBUFF                               * BBD8F
          10GETLAM                               * BBD94
          4ROLL                                  * BBD99
          #1-                                    * BBD9E
          7GETLAM                                * BBDA3
          #*                                     * BBDA8
          9GETLAM                                * BBDAD
          #+                                     * BBDB2
          GROB!                                  * BBDB7
        ;                                        * BBDBC

* ROMPTR 0B3 037
* refs (1): BA576
~BBGetNGrob:
        ::                                       * BBDC1
          BINT81                                 * BBDC6
          ROMPTR  0B3 055                        * BBDCB
          ?SEMI                                  * BBDD6
          DUP                                    * BBDDB
          ROMPTR  0B3 038                        * BBDE0  ~BBGetNStr
          DUP                                    * BBDEB
          LEN$                                   * BBDF0
          8GETLAM                                * BBDF5
          16GETLAM                               * BBDFA
          IT                                     * BBDFF
          ::                                     * BBE04
            BINT7                                * BBE09
            #-                                   * BBE0E
          ;                                      * BBE13
          BINT6                                  * BBE18
          #/                                     * BBE1D
          SWAPDROP                               * BBE22
          DUPUNROT                               * BBE27
          #>ITE                                  * BBE2C
          ::                                     * BBE31
            1_#1-SUB$                            * BBE36
            CHR_...                              * BBE3B
            >T$                                  * BBE40
          ;                                      * BBE45
          DROP                                   * BBE4A
          $>GROB                                 * BBE4F
          7GETLAM                                * BBE54
          8GETLAM                                * BBE59
          MAKEGROB                               * BBE5E
          DUPUNROT                               * BBE63
          16GETLAM                               * BBE68
          ITE                                    * BBE6D
          BINT7                                  * BBE72
          BINT1                                  * BBE77
          BINT1                                  * BBE7C
          GROB!                                  * BBE81
          16GETLAM                               * BBE86
          NOTcase                                * BBE8B
          SWAPDROP                               * BBE90
          SWAP                                   * BBE95
          ROMPTR  0B3 04B                        * BBE9A  ~BBIsChecked?
          NOT?SEMI                               * BBEA5
          ROMPTR  0B0 07E                        * BBEAA
          OVER                                   * BBEB5
          ZEROZERO                               * BBEBA
          GROB!                                  * BBEBF
        ;                                        * BBEC4

* ROMPTR 0B3 038
* refs (1): BA576
~BBGetNStr:
        ::                                       * BBEC9
          KEYINBUFFER?                           * BBECE
          casedrop                               * BBED3
          ::                                     * BBED8
            _chr(31)_                            * BBEDD
            SetDA2bBad                           * BBEE2
          ;                                      * BBEE7
          BINT82                                 * BBEEC
          ROMPTR  0B3 055                        * BBEF1
          ?SEMI                                  * BBEFC
          ROMPTR  0B3 03F                        * BBF01  ~BBGetN
          20GETLAM                               * BBF0C
          ROMPTR  0B0 074                        * BBF11
        ;                                        * BBF1C

* ROMPTR 0B3 039
* refs (1): BA576
ROMP_0B3_039:
        ::                                       * BBF21
          BINT84                                 * BBF26
          ROMPTR  0B3 055                        * BBF2B
          ?SEMI                                  * BBF36
          HARDBUFF                               * BBF3B
          14GETLAM                               * BBF40
          ITE                                    * BBF45
          ::                                     * BBF4A
            ZEROZERO                             * BBF4F
            BINT131                              * BBF54
            BINT56                               * BBF59
          ;                                      * BBF5E
          ::                                     * BBF63
            10GETLAM                             * BBF68
            #3-                                  * BBF6D
            9GETLAM                              * BBF72
            ROMPTR  0B3 045                      * BBF77
            #3-                                  * BBF82
            OVER                                 * BBF87
            8GETLAM                              * BBF8C
            ROMPTR  0B3 046                      * BBF91
            #+                                   * BBF9C
            #7+                                  * BBFA1
            OVER                                 * BBFA6
            7GETLAM                              * BBFAB
            11GETLAM                             * BBFB0
            #*                                   * BBFB5
            #+                                   * BBFBA
            ROMPTR  0B3 044                      * BBFBF
            #7+                                  * BBFCA
          ;                                      * BBFCF
          SUBGROB                                * BBFD4
          5PUTLAM                                * BBFD9
          HARDBUFF2                              * BBFDE
          TOTEMPOB                               * BBFE3
          4PUTLAM                                * BBFE8
        ;                                        * BBFED

* ROMPTR 0B3 03A
* refs (1): BA576
ROMP_0B3_03A:
        ::                                       * BBFF2
          BINT87                                 * BBFF7
          ROMPTR  0B3 055                        * BBFFC
          ?SEMI                                  * BC007
          5GETLAM                                * BC00C
          HARDBUFF                               * BC011
          14GETLAM                               * BC016
          ITE                                    * BC01B
          ZEROZERO                               * BC020
          ::                                     * BC025
            10GETLAM                             * BC02A
            #3-                                  * BC02F
            9GETLAM                              * BC034
            ROMPTR  0B3 045                      * BC039
            #3-                                  * BC044
          ;                                      * BC049
          GROB!                                  * BC04E
          4GETLAM                                * BC053
          HARDBUFF2                              * BC058
          ZEROZERO                               * BC05D
          GROB!                                  * BC062
        ;                                        * BC067

* ROMPTR 0B3 03B
* refs (1): BA576
~BBRereadChkEnbl:
        ::                                       * BC06C
          BINT61                                 * BC071
          ROMPTR  0B3 055                        * BC076
          ?SKIP                                  * BC081
          FALSE                                  * BC086
          16PUTLAM                               * BC08B
        ;                                        * BC090

* ROMPTR 0B3 03C
* refs (1): BA576
~BBRereadFullScr:
        ::                                       * BC095
          BINT60                                 * BC09A
          ROMPTR  0B3 055                        * BC09F
          ?SKIP                                  * BC0AA
          FALSE                                  * BC0AF
          14PUTLAM                               * BC0B4
        ;                                        * BC0B9

* ROMPTR 0B3 03D
* refs (1): BA576
~BReReadMenus:
        ::                                       * BC0BE
          BINT83                                 * BC0C3
          ROMPTR  0B3 055                        * BC0C8
          case                                   * BC0D3
          13PUTLAM                               * BC0D8
          17GETLAM                               * BC0DD
          case                                   * BC0E2
          ::                                     * BC0E7
            '                                    * BC0EC
            ROMPTR  0B3 005                      * BC0F1  ~ChooseMenu0
            13PUTLAM                             * BC0FC
          ;                                      * BC101
          16GETLAM                               * BC106
          ITE                                    * BC10B
          ::                                     * BC110
            '                                    * BC115
            ROMPTR  0B3 007                      * BC11A  ~ChooseMenu2
          ;                                      * BC125
          ::                                     * BC12A
            '                                    * BC12F
            ROMPTR  0B3 006                      * BC134  ~ChooseMenu1
          ;                                      * BC13F
          13PUTLAM                               * BC144
        ;                                        * BC149

* ROMPTR 0B3 03E
* refs (1): BA576
~BBReReadNElems:
        ::                                       * BC14E
          BINT62                                 * BC153
          ROMPTR  0B3 055                        * BC158
          case                                   * BC163
          12PUTLAM                               * BC168
          19GETLAM                               * BC16D
          LENCOMP                                * BC172
          12PUTLAM                               * BC177
        ;                                        * BC17C

* ROMPTR 0B3 03F
* refs (1): BA576
~BBGetN:
        ::                                       * BC181
          OBJ_64C34                              * BC186
          ROMPTR  0B3 055                        * BC18B
          ?SEMI                                  * BC196
          19GETLAM                               * BC19B
          SWAP                                   * BC1A0
          OBJ_1A01B                              * BC1A5
          OBJ_1A002                              * BC1AA
        ;                                        * BC1AF

* ROMPTR 0B3 040
* refs (1): BA576
ROMP_0B3_040:
        ::                                       * BC1B4
          BINT86                                 * BC1B9
          ROMPTR  0B3 055                        * BC1BE
          ?SEMI                                  * BC1C9
          BINT0                                  * BC1CE
          #=casedrop                             * BC1D3
          ::                                     * BC1D8
            12GETLAM                             * BC1DD
            #1+_ONE_DO                           * BC1E2
            INDEX@                               * BC1E7
            LOOP                                 * BC1EC
            12GETLAM                             * BC1F1
            {}N                                  * BC1F6
            15PUTLAM                             * BC1FB
          ;                                      * BC200
          MINUSONE                               * BC205
          #=casedrop                             * BC20A
          ::                                     * BC20F
            NULL{}                               * BC214
            15PUTLAM                             * BC219
          ;                                      * BC21E
          15GETLAM                               * BC223
          SWAP                                   * BC228
          2DUP                                   * BC22D
          #=POSCOMP                              * BC232
          DUP#0=                                 * BC237
          ITE                                    * BC23C
          ::                                     * BC241
            DROP                                 * BC246
            >TCOMP                               * BC24B
          ;                                      * BC250
          ::                                     * BC255
            SWAPDROPSWAP                         * BC25A
            DUP                                  * BC25F
            BINT1                                * BC264
            4PICK                                * BC269
            #1-                                  * BC26E
            SUBCOMP                              * BC273
            SWAPROT                              * BC278
            #1+                                  * BC27D
            OVER                                 * BC282
            LENCOMP                              * BC287
            SUBCOMP                              * BC28C
            &COMP                                * BC291
          ;                                      * BC296
          15PUTLAM                               * BC29B
        ;                                        * BC2A0

* ROMPTR 0B3 041
* refs (1): BA576
ROMP_0B3_041:
        ::                                       * BC2A5
          8GETLAM                                * BC2AA
          ROMPTR  0B3 046                        * BC2AF
          BINT91                                 * BC2BA
          #<>                                    * BC2BF
          caseFALSE                              * BC2C4
          11GETLAM                               * BC2C9
          7GETLAM                                * BC2CE
          #*                                     * BC2D3
          BINT9                                  * BC2D8
          #/                                     * BC2DD
          SWAP                                   * BC2E2
          #0<>                                   * BC2E7
          casedrop                               * BC2EC
          FALSE                                  * BC2F1
          DUP                                    * BC2F6
          BINT1                                  * BC2FB
          #>                                     * BC300
          BINT5                                  * BC305
          ROMPTR  0B3 056                        * BC30A
          ?SKIP                                  * BC315
          #1+                                    * BC31A
          ROT                                    * BC31F
          #>                                     * BC324
          AND                                    * BC329
        ;                                        * BC32E

* ROMPTR 0B3 042
* refs (1): BA576
ROMP_0B3_042:
        ::                                       * BC333
          {                                      * BC338
            ROMPTR  0B3 05C                      * BC33D  ~BBGetDefltHeight
            ROMPTR  0B3 060                      * BC348  sysCHOOSE
            ROMPTR  0B3 05D                      * BC353
            ROMPTR  0B3 061                      * BC35E
            ROMPTR  0B3 05E                      * BC369
            ROMPTR  0B3 062                      * BC374
            ROMPTR  0B3 05F                      * BC37F  ~$>grobOrGROB
          }                                      * BC38A
          11GETLAM                               * BC38F
          7GETLAM                                * BC394
          #*                                     * BC399
          BINT9                                  * BC39E
          #/                                     * BC3A3
          SWAPDROP                               * BC3A8
          #2-                                    * BC3AD
          #2*                                    * BC3B2
          #1+                                    * BC3B7
          ROMPTR  0B3 056                        * BC3BC
          IT                                     * BC3C7
          #1+                                    * BC3CC
          OBJ_1A01B                              * BC3D1
          HARDBUFF                               * BC3D6
          10GETLAM                               * BC3DB
          #3-                                    * BC3E0
          9GETLAM                                * BC3E5
          ROMPTR  0B3 045                        * BC3EA
          #3-                                    * BC3F5
          GROB!                                  * BC3FA
        ;                                        * BC3FF

* ROMPTR 0B3 043
* refs (1): BA576
ROMP_0B3_043:
        ::                                       * BC404
          10GETLAM                               * BC409
          9GETLAM                                * BC40E
          BINT8                                  * BC413
          #-                                     * BC418
        ;                                        * BC41D

* ROMPTR 0B3 044
* refs (1): BA576
ROMP_0B3_044:
        ::                                       * BC422
          ROMPTR  0B3 056                        * BC427
          NOT?SEMI                               * BC432
          BINT8                                  * BC437
          #+                                     * BC43C
        ;                                        * BC441

* ROMPTR 0B3 045
* refs (1): BA576
ROMP_0B3_045:
        ::                                       * BC446
          ROMPTR  0B3 056                        * BC44B
          NOT?SEMI                               * BC456
          BINT8                                  * BC45B
          #-                                     * BC460
        ;                                        * BC465

* ROMPTR 0B3 046
* refs (1): BA576
ROMP_0B3_046:
        ::                                       * BC46A
          ROMPTR  0B3 048                        * BC46F
          NOT?SEMI                               * BC47A
          BINT6                                  * BC47F
          #+                                     * BC484
        ;                                        * BC489

* ROMPTR 0B3 047
* refs (1): BA576
ROMP_0B3_047:
        ::                                       * BC48E
          ROMPTR  0B3 048                        * BC493
          NOT?SEMI                               * BC49E
          BINT6                                  * BC4A3
          #-                                     * BC4A8
        ;                                        * BC4AD

* ROMPTR 0B3 048
* refs (1): BA576
ROMP_0B3_048:
        ::                                       * BC4B2
          12GETLAM                               * BC4B7
          11GETLAM                               * BC4BC
          #>                                     * BC4C1
        ;                                        * BC4C6

* ROMPTR 0B3 049
* refs (1): BA576
ROMP_0B3_049:
        ::                                       * BC4CB
          BINT8                                  * BC4D0
          8GETLAM                                * BC4D5
          ROMPTR  0B3 046                        * BC4DA
          MAKEGROB                               * BC4E5
          HARDBUFF                               * BC4EA
          ROMPTR  0B3 043                        * BC4EF
          GROB!                                  * BC4FA
        ;                                        * BC4FF

* ROMPTR 0B3 04A
* refs (1): BA576
ROMP_0B3_04A:
        ::                                       * BC504
          16GETLAM                               * BC509
          NOT?SEMI                               * BC50E
          18GETLAM                               * BC513
          DUPTYPEBINT?                           * BC518
          casedrop                               * BC51D
          ::                                     * BC522
            NULL{}                               * BC527
            15PUTLAM                             * BC52C
          ;                                      * BC531
          DUP                                    * BC536
          CARCOMP                                * BC53B
          18PUTLAM                               * BC540
          CDRCOMP                                * BC545
          15PUTLAM                               * BC54A
        ;                                        * BC54F

* ROMPTR 0B3 04B
* refs (1): BA576
~BBIsChecked?:
        ::                                       * BC554
          15GETLAM                               * BC559
          SWAP                                   * BC55E
          #=POSCOMP                              * BC563
          #0<>                                   * BC568
        ;                                        * BC56D

* ROMPTR 0B3 04C
* refs (1): BA576
ROMP_0B3_04C:
        ::                                       * BC572
          10GETLAM                               * BC577
          9GETLAM                                * BC57C
          #2-                                    * BC581
          OVER                                   * BC586
          8GETLAM                                * BC58B
          ROMPTR  0B3 046                        * BC590
          #1-+                                   * BC59B
          OVER                                   * BC5A0
          LINEON                                 * BC5A5
        ;                                        * BC5AA

* ROMPTR 0B3 04E
* refs (2): BA576 BA576
ROMP_0B3_04E:
        ::                                       * BC5AF
          DA2bBad?                               * BC5B4
          caseDROP                               * BC5B9
          17GETLAM                               * BC5BE
          caseDROP                               * BC5C3
          10GETLAM                               * BC5C8
          9GETLAM                                * BC5CD
          ROT                                    * BC5D2
          #1-                                    * BC5D7
          7GETLAM                                * BC5DC
          #*                                     * BC5E1
          #+                                     * BC5E6
          2DUP                                   * BC5EB
          OVER                                   * BC5F0
          8GETLAM                                * BC5F5
          #+                                     * BC5FA
          OVER                                   * BC5FF
          7GETLAM                                * BC604
          #+                                     * BC609
          HARDBUFF                               * BC60E
          5UNROLL                                * BC613
          SUBGROB                                * BC618
          INVGROB                                * BC61D
          3UNROLL                                * BC622
          HARDBUFF                               * BC627
          3UNROLL                                * BC62C
          GROB!                                  * BC631
        ;                                        * BC636

* ROMPTR 0B3 04F
* refs (1): BA576
ROMP_0B3_04F:
        ::                                       * BC63B
          ROMPTR  0B3 048                        * BC640
          NOT?SEMI                               * BC64B
          ROMPTR  0B3 050                        * BC650
          ITE                                    * BC65B
          ROMPTR  0B3 052                        * BC660  ~BBUpArrow
          ROMPTR  0B3 054                        * BC66B  ~BBSpace
          HARDBUFF                               * BC676
          10GETLAM                               * BC67B
          8GETLAM                                * BC680
          #+                                     * BC685
          #1+                                    * BC68A
          DUP4UNROLL                             * BC68F
          9GETLAM                                * BC694
          #1+                                    * BC699
          GROB!                                  * BC69E
          ROMPTR  0B3 051                        * BC6A3
          ITE                                    * BC6AE
          ROMPTR  0B3 053                        * BC6B3  ~BBDownArrow
          ROMPTR  0B3 054                        * BC6BE  ~BBSpace
          HARDBUFF                               * BC6C9
          ROT                                    * BC6CE
          9GETLAM                                * BC6D3
          11GETLAM                               * BC6D8
          #1-                                    * BC6DD
          7GETLAM                                * BC6E2
          #*                                     * BC6E7
          #+                                     * BC6EC
          #1+                                    * BC6F1
          GROB!                                  * BC6F6
        ;                                        * BC6FB

* ROMPTR 0B3 050
* refs (1): BA576
ROMP_0B3_050:
        ::                                       * BC700
          18GETLAM                               * BC705
          6GETLAM                                * BC70A
          #>                                     * BC70F
        ;                                        * BC714

* ROMPTR 0B3 051
* refs (1): BA576
ROMP_0B3_051:
        ::                                       * BC719
          12GETLAM                               * BC71E
          18GETLAM                               * BC723
          #-                                     * BC728
          11GETLAM                               * BC72D
          6GETLAM                                * BC732
          #-                                     * BC737
          #>                                     * BC73C
        ;                                        * BC741

* ROMPTR 0B3 052
* refs (1): BA576
~BBUpArrow:
        ::                                       * BC746
          $       "↑"                            * BC74B
          $>GROB                                 * BC757
        ;                                        * BC75C

* ROMPTR 0B3 053
* refs (1): BA576
~BBDownArrow:
        ::                                       * BC761
          $       "↓"                            * BC766
          $>GROB                                 * BC772
        ;                                        * BC777

* ROMPTR 0B3 054
* refs (1): BA576
~BBSpace:
        ::                                       * BC77C
          $       " "                            * BC781
          $>GROB                                 * BC78D
        ;                                        * BC792

* ROMPTR 0B3 055
* refs (1): BA576
ROMP_0B3_055:
        ::                                       * BC797
          22Lget                                 * BC79C
          EVAL                                   * BC7A1
        ;                                        * BC7A6

* ROMPTR 0B3 056
* refs (1): BA576
ROMP_0B3_056:
        ::                                       * BC7AB
          21GETLAM                               * BC7B0
          OBJ_1A002                              * BC7B5
          NULL$?                                 * BC7BA
          NOT                                    * BC7BF
        ;                                        * BC7C4

* ROMPTR 0B3 057
* refs (1): BA576
ROMP_0B3_057:
        ::                                       * BC7C9
          DA1IsStat?                             * BC7CE
          DA2bEdit?                              * BC7D3
          DA1Bad?                                * BC7D8
          DA2aBad?                               * BC7DD
          DA2bBad?                               * BC7E2
          DA3Bad?                                * BC7E7
          BINT6                                  * BC7EC
          {}N                                    * BC7F1
        ;                                        * BC7F6

* ROMPTR 0B3 058
* refs (1): BA576
ROMP_0B3_058:
        ::                                       * BC7FB
          INCOMPDROP                             * BC800
          ITE                                    * BC805
          SetDA3Bad                              * BC80A
          ClrDA3Bad                              * BC80F
          ITE                                    * BC814
          SetDA2bBad                             * BC819
          ClrDA2bBad                             * BC81E
          ITE                                    * BC823
          SetDA2aBad                             * BC828
          ClrDA2aBad                             * BC82D
          ITE                                    * BC832
          SetDA1Bad                              * BC837
          ClrDA1Bad                              * BC83C
          ITE                                    * BC841
          SetDA2bEdit                            * BC846
          ClrDA2bEdit                            * BC84B
          ITE                                    * BC850
          SetDA1IsStat                           * BC855
          ClrDA1IsStat                           * BC85A
        ;                                        * BC85F

* ROMPTR 0B3 059
* refs (1): BA576
~BBPgDown:
        ::                                       * BC864
          17GETLAM                               * BC869
          NOT?SEMI                               * BC86E
          18GETLAM                               * BC873
          11GETLAM                               * BC878
          12GETLAM                               * BC87D
          #MIN                                   * BC882
          DUPUNROT                               * BC887
          6GETLAM                                * BC88C
          #-                                     * BC891
          #+                                     * BC896
          18PUTLAM                               * BC89B
          6PUTLAM                                * BC8A0
        ;                                        * BC8A5

* ROMPTR 0B3 05A
* refs (1): BA576
~BBPgUp:
        ::                                       * BC8AA
          17GETLAM                               * BC8AF
          NOT?SEMI                               * BC8B4
          18GETLAM                               * BC8B9
          6GETLAM                                * BC8BE
          #1-                                    * BC8C3
          #-                                     * BC8C8
          18PUTLAM                               * BC8CD
          BINT1                                  * BC8D2
          6PUTLAM                                * BC8D7
        ;                                        * BC8DC

* ROMPTR 0B3 05B
* refs (1): BA576
~BBEmpty?:
        ::                                       * BC8E1
          12GETLAM                               * BC8E6
          #0=                                    * BC8EB
        ;                                        * BC8F0

* ROMPTR 0B3 05C
* refs (1): BA576
~BBGetDefltHeight:
        GROB    "images/BC8F5-_BBGetDefltHeight.png" * BC8F5  98 x 25

* ROMPTR 0B3 05D
* refs (1): BA576
ROMP_0B3_05D:
        GROB    "images/BCB93.png"               * BCB93  98 x 34

* ROMPTR 0B3 05E
* refs (1): BA576
ROMP_0B3_05E:
        GROB    "images/BCF1B.png"               * BCF1B  98 x 43

* ROMPTR 0B3 05F
* refs (1): BA576
~$>grobOrGROB:
        GROB    "images/BD38D-___grobOrGROB.png" * BD38D  98 x 52
