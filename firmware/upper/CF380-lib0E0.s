* HP 48GX ROM revision R, #CF380-#D1361: Library part 0E0
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~BRoutput ~BRbrowse ~BRStoC1 ~BRRclCurRow ~BRRclC1 BRinverse BRdone BRViewItem BRGetItem BRDispItems
* Follows on from the previous file (at #CF380 in the original ROM).
        ENDLENGTH                                * CF380

        CON(5)  DOLIB                            * CF380  library object
        LENGTH                                   * CF385  length, to #D1362
        CON(2)  0                                * CF38A  title length

LIB0E0:
        CON(3)  #0E0                             * CF38C  library number
        REL(5)  LIB0E0.hash                      * CF38F  hash table
        CON(5)  0                                * CF394  message table
        REL(5)  LIB0E0.link                      * CF399  link table
        CON(5)  0                                * CF39E  config
        RPL

* ROMPTR 0E0 000
* refs (1): CF38C
ROMP_0E0_000:
        ::                                       * CF3A3
          '                                      * CF3A8
          LAM     'BR1                           * CF3AD
          STO                                    * CF3BC
        ;                                        * CF3C1

* ROMPTR 0E0 001
* refs (1): CF38C
ROMP_0E0_001:
        ::                                       * CF3C6
          '                                      * CF3CB
          LAM     'BR2                           * CF3D0
          STO                                    * CF3DF
        ;                                        * CF3E4

* ROMPTR 0E0 002
* refs (1): CF38C
ROMP_0E0_002:
        ::                                       * CF3E9
          '                                      * CF3EE
          LAM     'BR3                           * CF3F3
          STO                                    * CF402
        ;                                        * CF407

* ROMPTR 0E0 003
* refs (1): CF38C
~BRStoC1:
        ::                                       * CF40C
          '                                      * CF411
          LAM     'BR5                           * CF416
          STO                                    * CF425
        ;                                        * CF42A

* ROMPTR 0E0 004
* refs (1): CF38C
ROMP_0E0_004:
        ::                                       * CF42F
          '                                      * CF434
          LAM     'BR6                           * CF439
          STO                                    * CF448
        ;                                        * CF44D

* ROMPTR 0E0 005
* refs (1): CF38C
ROMP_0E0_005:
        ::                                       * CF452
          '                                      * CF457
          LAM     'BR12                          * CF45C
          STO                                    * CF46D
        ;                                        * CF472

* ROMPTR 0E0 006
* refs (1): CF38C
ROMP_0E0_006:
        ::                                       * CF477
          '                                      * CF47C
          LAM     'BR14                          * CF481
          STO                                    * CF492
        ;                                        * CF497

* ROMPTR 0E0 007
* refs (1): CF38C
ROMP_0E0_007:
        ::                                       * CF49C
          '                                      * CF4A1
          LAM     'BR16                          * CF4A6
          STO                                    * CF4B7
        ;                                        * CF4BC

* ROMPTR 0E0 008
* refs (1): CF38C
ROMP_0E0_008:
        ::                                       * CF4C1
          '                                      * CF4C6
          LAM     'BR20                          * CF4CB
          STO                                    * CF4DC
        ;                                        * CF4E1

* ROMPTR 0E0 009
* refs (1): CF38C
ROMP_0E0_009:
        ::                                       * CF4E6
          '                                      * CF4EB
          LAM     'BR21                          * CF4F0
          STO                                    * CF501
        ;                                        * CF506

* ROMPTR 0E0 00A
* refs (1): CF38C
ROMP_0E0_00A:
        ::                                       * CF50B
          '                                      * CF510
          LAM     'BR22                          * CF515
          STO                                    * CF526
        ;                                        * CF52B

* ROMPTR 0E0 00B
* refs (1): CF38C
ROMP_0E0_00B:
        ::                                       * CF530
          '                                      * CF535
          LAM     'BR24                          * CF53A
          STO                                    * CF54B
        ;                                        * CF550

* ROMPTR 0E0 00C
* refs (1): CF38C
ROMP_0E0_00C:
        ::                                       * CF555
          '                                      * CF55A
          LAM     'BR25                          * CF55F
          STO                                    * CF570
        ;                                        * CF575

* ROMPTR 0E0 00D
* refs (1): CF38C
ROMP_0E0_00D:
        ::                                       * CF57A
          '                                      * CF57F
          LAM     'BR26                          * CF584
          STO                                    * CF595
        ;                                        * CF59A

* ROMPTR 0E0 00E
* refs (1): CF38C
ROMP_0E0_00E:
        ::                                       * CF59F
          '                                      * CF5A4
          LAM     'BR27                          * CF5A9
          STO                                    * CF5BA
        ;                                        * CF5BF

* ROMPTR 0E0 00F
* refs (1): CF38C
ROMP_0E0_00F:
        ::                                       * CF5C4
          '                                      * CF5C9
          LAM     'BR28                          * CF5CE
          STO                                    * CF5DF
        ;                                        * CF5E4

* ROMPTR 0E0 010
* refs (1): CF38C
~BRbrowse:
        ::                                       * CF5E9
          CLCD10                                 * CF5EE
          UnLockAlpha                            * CF5F3
          ROMPTR  0E0 014                        * CF5F8
          ROMPTR  0E0 045                        * CF603  BRDispItems
          ROMPTR  0E0 049                        * CF60E  BRinverse
          ClrDAsOK                               * CF619
          RESOROMP                               * CF61E
          ROMPTR  0E0 011                        * CF623
          RESOROMP                               * CF62E
          ROMPTR  0E0 025                        * CF633
          TrueTrue                               * CF63E
          5ROLL                                  * CF643
          ONEFALSE'                              * CF648
          LAM     'BR20                          * CF64D
          'ERRJMP                                * CF65E
          POLSetUI                               * CF663
          POLKeyUI                               * CF668
          ABND                                   * CF66D
          ClrDAsOK                               * CF672
        ;                                        * CF677

* ROMPTR 0E0 011
* refs (1): CF38C
ROMP_0E0_011:
        ::                                       * CF67C
          DA3OK?                                 * CF681
          ?SKIP                                  * CF686
          ::                                     * CF68B
            DispMenu                             * CF690
            SetDA3Valid                          * CF695
          ;                                      * CF69A
        ;                                        * CF69F

* ROMPTR 0E0 012
* refs (1): CF38C
~BRoutput:
        ::                                       * CF6A4
          ROMPTR  0E0 016                        * CF6A9
          ROMPTR  0E0 017                        * CF6B4  ~BRRclCurRow
        ;                                        * CF6BF

* ROMPTR 0E0 013
* refs (1): CF38C
BRdone:
        ::                                       * CF6C4
          SetKeysNS                              * CF6C9
          TRUE                                   * CF6CE
          ROMPTR  0E0 008                        * CF6D3
        ;                                        * CF6DE

* ROMPTR 0E0 014
* refs (1): CF38C
ROMP_0E0_014:
        ::                                       * CF6E3
          8PICK                                  * CF6E8
          LENCOMP                                * CF6ED
          BINT0                                  * CF6F2
          BINT9                                  * CF6F7
          NDUPN                                  * CF6FC
          DROP                                   * CF701
          {                                      * CF706

* ROMPTR 0E0 015
* refs (1): CF38C
ROMP_0E0_015:
            LAM     'BR21                        * CF70B

* ROMPTR 0E0 016
* refs (1): CF38C
ROMP_0E0_016:
            LAM     'BR1                         * CF71C

* ROMPTR 0E0 017
* refs (1): CF38C
~BRRclCurRow:
            LAM     'BR3                         * CF72B

* ROMPTR 0E0 018
* refs (1): CF38C
~BRRclC1:
            LAM     'BR5                         * CF73A

* ROMPTR 0E0 019
* refs (1): CF38C
ROMP_0E0_019:
            LAM     'BR22                        * CF749

* ROMPTR 0E0 01A
* refs (1): CF38C
ROMP_0E0_01A:
            LAM     'BR27                        * CF75A

* ROMPTR 0E0 01B
* refs (1): CF38C
ROMP_0E0_01B:
            LAM     'BR28                        * CF76B

* ROMPTR 0E0 01C
* refs (1): CF38C
ROMP_0E0_01C:
            LAM     'BR2                         * CF77C

* ROMPTR 0E0 01D
* refs (1): CF38C
ROMP_0E0_01D:
            LAM     'BR6                         * CF78B

* ROMPTR 0E0 01E
* refs (1): CF38C
ROMP_0E0_01E:
            LAM     'BR12                        * CF79A

* ROMPTR 0E0 01F
* refs (1): CF38C
ROMP_0E0_01F:
            LAM     'BR14                        * CF7AB

* ROMPTR 0E0 020
* refs (1): CF38C
ROMP_0E0_020:
            LAM     'BR16                        * CF7BC

* ROMPTR 0E0 021
* refs (1): CF38C
ROMP_0E0_021:
            LAM     'BR20                        * CF7CD

* ROMPTR 0E0 022
* refs (1): CF38C
ROMP_0E0_022:
            LAM     'BR24                        * CF7DE

* ROMPTR 0E0 023
* refs (1): CF38C
ROMP_0E0_023:
            LAM     'BR25                        * CF7EF

* ROMPTR 0E0 024
* refs (1): CF38C
ROMP_0E0_024:
            LAM     'BR26                        * CF800
          }                                      * CF811
          BIND                                   * CF816
          DUPNULL$?                              * CF81B
          ITE                                    * CF820
          DROPZERO                               * CF825
          ::                                     * CF82A
            ROMPTR  0E0 044                      * CF82F
            BINT8                                * CF83A
          ;                                      * CF83F
          DUP                                    * CF844
          ROMPTR  0E0 007                        * CF849
          ROMPTR  0E0 018                        * CF854  ~BRRclC1
          BINT0                                  * CF85F
          ROMPTR  0E0 019                        * CF864
          EVAL                                   * CF86F
          DUP                                    * CF874
          ROMPTR  0E0 004                        * CF879
          SWAP                                   * CF884
          #0=ITE                                 * CF889
          BINT7                                  * CF88E
          BINT6                                  * CF893
          OVER                                   * CF898
          #MIN                                   * CF89D
          DUP                                    * CF8A2
          ROMPTR  0E0 00D                        * CF8A7
          ROMPTR  0E0 016                        * CF8B2
          #1-+                                   * CF8BD
          #MIN                                   * CF8C2
          ROMPTR  0E0 001                        * CF8C7
          FALSE                                  * CF8D2
          ROMPTR  0E0 008                        * CF8D7
          ROMPTR  0E0 017                        * CF8E2  ~BRRclCurRow
          ROMPTR  0E0 04F                        * CF8ED
        ;                                        * CF8F8

* ROMPTR 0E0 025
* refs (1): CF38C
ROMP_0E0_025:
        ::                                       * CF8FD
          BINT1                                  * CF902
          #=casedrop                             * CF907
          ROMPTR  0E0 026                        * CF90C
          BINT2                                  * CF917
          #=casedrop                             * CF91C
          ROMPTR  0E0 027                        * CF921
          BINT3                                  * CF92C
          #=casedrop                             * CF931
          ROMPTR  0E0 028                        * CF936
          BINT4                                  * CF941
          #=casedrop                             * CF946
          ROMPTR  0E0 029                        * CF94B
          BINT5                                  * CF956
          #=casedrop                             * CF95B
          ROMPTR  0E0 02A                        * CF960
          DROP                                   * CF96B
          ROMPTR  0E0 02B                        * CF970
        ;                                        * CF97B

* ROMPTR 0E0 026
* refs (1): CF38C
ROMP_0E0_026:
        ::                                       * CF980
          BINT11                                 * CF985
          ?CaseRomptr@                           * CF98A
          ROMPTR  0E0 030                        * CF98F
          BINT12                                 * CF99A
          ?CaseRomptr@                           * CF99F
          ROMPTR  0E0 02D                        * CF9A4
          BINT17                                 * CF9AF
          ?CaseRomptr@                           * CF9B4
          ROMPTR  0E0 031                        * CF9B9
          BINT25                                 * CF9C4
          ?CaseRomptr@                           * CF9C9
          ROMPTR  0E0 038                        * CF9CE
          BINT45                                 * CF9D9
          ?CaseRomptr@                           * CF9DE
          ROMPTR  0E0 039                        * CF9E3
          BINT30                                 * CF9EE
          #=casedrpfls                           * CF9F3
          BINT35                                 * CF9F8
          #=casedrpfls                           * CF9FD
          BINT40                                 * CFA02
          #=casedrpfls                           * CFA07
          DUP                                    * CFA0C
          BINT7                                  * CFA11
          #<                                     * CFA16
          casedrpfls                             * CFA1B
          BINT1                                  * CFA20
          ROMPTR  0E0 02C                        * CFA25
        ;                                        * CFA30

* ROMPTR 0E0 027
* refs (1): CF38C
ROMP_0E0_027:
        ::                                       * CFA35
          BINT11                                 * CFA3A
          ?CaseRomptr@                           * CFA3F
          ROMPTR  0E0 034                        * CFA44
          BINT12                                 * CFA4F
          ?CaseRomptr@                           * CFA54
          ROMPTR  0E0 02E                        * CFA59
          BINT17                                 * CFA64
          ?CaseRomptr@                           * CFA69
          ROMPTR  0E0 035                        * CFA6E
          BINT25                                 * CFA79
          ?CaseRomptr@                           * CFA7E
          ROMPTR  0E0 052                        * CFA83  BRViewItem
          BINT35                                 * CFA8E
          #=casedrpfls                           * CFA93
          BINT40                                 * CFA98
          #=casedrpfls                           * CFA9D
          BINT2                                  * CFAA2
          ROMPTR  0E0 02C                        * CFAA7
        ;                                        * CFAB2

* ROMPTR 0E0 028
* refs (1): CF38C
ROMP_0E0_028:
        ::                                       * CFAB7
          BINT11                                 * CFABC
          ?CaseRomptr@                           * CFAC1
          ROMPTR  0E0 036                        * CFAC6
          BINT12                                 * CFAD1
          ?CaseRomptr@                           * CFAD6
          ROMPTR  0E0 02F                        * CFADB
          BINT17                                 * CFAE6
          ?CaseRomptr@                           * CFAEB
          ROMPTR  0E0 037                        * CFAF0
          BINT25                                 * CFAFB
          ?CaseRomptr@                           * CFB00
          ROMPTR  0E0 052                        * CFB05  BRViewItem
          BINT35                                 * CFB10
          #=casedrpfls                           * CFB15
          BINT40                                 * CFB1A
          #=casedrpfls                           * CFB1F
          BINT45                                 * CFB24
          #=casedrpfls                           * CFB29
          BINT3                                  * CFB2E
          ROMPTR  0E0 02C                        * CFB33
        ;                                        * CFB3E

* ROMPTR 0E0 029
* refs (1): CF38C
ROMP_0E0_029:
        ::                                       * CFB43
          BINT25                                 * CFB48
          ?CaseRomptr@                           * CFB4D
          ROMPTR  0E0 038                        * CFB52
          BINT45                                 * CFB5D
          ?CaseRomptr@                           * CFB62
          ROMPTR  0E0 039                        * CFB67
          BINT30                                 * CFB72
          #=casedrpfls                           * CFB77
          BINT35                                 * CFB7C
          #=casedrpfls                           * CFB81
          BINT40                                 * CFB86
          #=casedrpfls                           * CFB8B
          BINT4                                  * CFB90
          ROMPTR  0E0 02C                        * CFB95
        ;                                        * CFBA0

* ROMPTR 0E0 02A
* refs (1): CF38C
ROMP_0E0_02A:
        ::                                       * CFBA5
          BINT45                                 * CFBAA
          ?CaseRomptr@                           * CFBAF
          ROMPTR  0E0 039                        * CFBB4
          BINT25                                 * CFBBF
          ?CaseRomptr@                           * CFBC4
          ROMPTR  0E0 038                        * CFBC9
          BINT35                                 * CFBD4
          #=casedrpfls                           * CFBD9
          BINT40                                 * CFBDE
          #=casedrpfls                           * CFBE3
          BINT5                                  * CFBE8
          ROMPTR  0E0 02C                        * CFBED
        ;                                        * CFBF8

* ROMPTR 0E0 02B
* refs (1): CF38C
ROMP_0E0_02B:
        ::                                       * CFBFD
          BINT45                                 * CFC02
          #=casedrpfls                           * CFC07
          BINT25                                 * CFC0C
          ?CaseRomptr@                           * CFC11
          ROMPTR  0E0 038                        * CFC16
          BINT35                                 * CFC21
          #=casedrpfls                           * CFC26
          BINT40                                 * CFC2B
          #=casedrpfls                           * CFC30
          BINT6                                  * CFC35
          ROMPTR  0E0 02C                        * CFC3A
        ;                                        * CFC45

* ROMPTR 0E0 02C
* refs (1): CF38C
ROMP_0E0_02C:
        ::                                       * CFC4A
          Key>StdKeyOb                           * CFC4F
          DUPTYPECHAR?                           * CFC54
          ITE                                    * CFC59
          ::                                     * CFC5E
            ROMPTR  0E0 00C                      * CFC63
            RESOROMP                             * CFC6E
            ROMPTR  0E0 03A                      * CFC73
          ;                                      * CFC7E
          ::                                     * CFC83
            DROP                                 * CFC88
            'DoBadKey                            * CFC8D
          ;                                      * CFC92
          TRUE                                   * CFC97
        ;                                        * CFC9C

* ROMPTR 0E0 02D
* refs (1): CF38C
ROMP_0E0_02D:
        ::                                       * CFCA1
          TakeOver                               * CFCA6
          ROMPTR  0E0 01B                        * CFCAB
          BINT7                                  * CFCB6
          #<                                     * CFCBB
          case                                   * CFCC0
          DoBadKey                               * CFCC5
          BINT6                                  * CFCCA
          SetSomeRow                             * CFCCF
          DispMenu                               * CFCD4
          ROMPTR  0E0 049                        * CFCD9  BRinverse
          ROMPTR  0E0 045                        * CFCE4  BRDispItems
          ROMPTR  0E0 049                        * CFCEF  BRinverse
        ;                                        * CFCFA

* ROMPTR 0E0 02E
* refs (1): CF38C
ROMP_0E0_02E:
        ::                                       * CFCFF
          TakeOver                               * CFD04
          ROMPTR  0E0 01B                        * CFD09
          BINT7                                  * CFD14
          #<                                     * CFD19
          case                                   * CFD1E
          DoBadKey                               * CFD23
          DoPrevRow                              * CFD28
          DispMenu                               * CFD2D
          ROMPTR  0E0 049                        * CFD32  BRinverse
          ROMPTR  0E0 045                        * CFD3D  BRDispItems
          ROMPTR  0E0 049                        * CFD48  BRinverse
        ;                                        * CFD53

* ROMPTR 0E0 02F
* refs (1): CF38C
ROMP_0E0_02F:
        ::                                       * CFD58
          TakeOver                               * CFD5D
          ROMPTR  0E0 01B                        * CFD62
          BINT7                                  * CFD6D
          #<                                     * CFD72
          case                                   * CFD77
          DoBadKey                               * CFD7C
          DoFirstRow                             * CFD81
          DispMenu                               * CFD86
          ROMPTR  0E0 049                        * CFD8B  BRinverse
          ROMPTR  0E0 045                        * CFD96  BRDispItems
          ROMPTR  0E0 049                        * CFDA1  BRinverse
        ;                                        * CFDAC

* ROMPTR 0E0 030
* refs (1): CF38C
ROMP_0E0_030:
        ::                                       * CFDB1
          TakeOver                               * CFDB6
          REPEATER                               * CFDBB
          BINT11                                 * CFDC0
          ROMPTR  0E0 032                        * CFDC5
        ;                                        * CFDD0

* ROMPTR 0E0 031
* refs (1): CF38C
ROMP_0E0_031:
        ::                                       * CFDD5
          TakeOver                               * CFDDA
          REPEATER                               * CFDDF
          BINT17                                 * CFDE4
          ROMPTR  0E0 033                        * CFDE9
        ;                                        * CFDF4

* ROMPTR 0E0 032
* refs (1): CF38C
ROMP_0E0_032:
        ::                                       * CFDF9
          ROMPTR  0E0 017                        * CFDFE  ~BRRclCurRow
          #1-DUP                                 * CFE09
          #0=case                                * CFE0E
          ::                                     * CFE13
            DROP                                 * CFE18
            ROMPTR  0E0 037                      * CFE1D
          ;                                      * CFE28
          ROMPTR  0E0 049                        * CFE2D  BRinverse
          DUP                                    * CFE38
          ROMPTR  0E0 002                        * CFE3D
          DUP                                    * CFE48
          ROMPTR  0E0 016                        * CFE4D
          #<                                     * CFE58
          IT                                     * CFE5D
          ::                                     * CFE62
            DUP                                  * CFE67
            ROMPTR  0E0 000                      * CFE6C
            ROMPTR  0E0 01C                      * CFE77
            #1-                                  * CFE82
            ROMPTR  0E0 001                      * CFE87
            ROMPTR  0E0 04A                      * CFE92
            DUP                                  * CFE9D
            ROMPTR  0E0 046                      * CFEA2
            ROMPTR  0E0 048                      * CFEAD
          ;                                      * CFEB8
          ROMPTR  0E0 04F                        * CFEBD
          ROMPTR  0E0 049                        * CFEC8  BRinverse
        ;                                        * CFED3

* ROMPTR 0E0 033
* refs (1): CF38C
ROMP_0E0_033:
        ::                                       * CFED8
          ROMPTR  0E0 017                        * CFEDD  ~BRRclCurRow
          DUP                                    * CFEE8
          ROMPTR  0E0 01D                        * CFEED
          #=                                     * CFEF8
          casedrop                               * CFEFD
          ROMPTR  0E0 036                        * CFF02
          #1+                                    * CFF0D
          ROMPTR  0E0 049                        * CFF12  BRinverse
          DUP                                    * CFF1D
          ROMPTR  0E0 002                        * CFF22
          DUP                                    * CFF2D
          ROMPTR  0E0 01C                        * CFF32
          #>                                     * CFF3D
          IT                                     * CFF42
          ::                                     * CFF47
            DUP                                  * CFF4C
            ROMPTR  0E0 001                      * CFF51
            ROMPTR  0E0 016                      * CFF5C
            #1+                                  * CFF67
            ROMPTR  0E0 000                      * CFF6C
            ROMPTR  0E0 04C                      * CFF77
            DUP                                  * CFF82
            ROMPTR  0E0 046                      * CFF87
            ROMPTR  0E0 048                      * CFF92
          ;                                      * CFF9D
          ROMPTR  0E0 04F                        * CFFA2
          ROMPTR  0E0 049                        * CFFAD  BRinverse
        ;                                        * CFFB8

* ROMPTR 0E0 034
* refs (1): CF38C
ROMP_0E0_034:
        ::                                       * CFFBD
          TakeOver                               * CFFC2
          ROMPTR  0E0 042                        * CFFC7
          ROMPTR  0E0 017                        * CFFD2  ~BRRclCurRow
          #1=case                                * CFFDD
          ROMPTR  0E0 037                        * CFFE2
          ROMPTR  0E0 049                        * CFFED  BRinverse
          ROMPTR  0E0 016                        * CFFF8
          DUP                                    * D0003
          ROMPTR  0E0 017                        * D0008  ~BRRclCurRow
          #<>                                    * D0013
          ITE                                    * D0018
          ROMPTR  0E0 002                        * D001D
          ::                                     * D0028
            DUP                                  * D002D
            ROMPTR  0E0 024                      * D0032
            #>ITE                                * D003D
            ::                                   * D0042
              DUP                                * D0047
              ROMPTR  0E0 024                    * D004C
              #-DUP                              * D0057
              ROMPTR  0E0 000                    * D005C
              ROMPTR  0E0 002                    * D0067
              #1-                                * D0072
            ;                                    * D0077
            ::                                   * D007C
              DROP                               * D0081
              ONEONE                             * D0086
              ROMPTR  0E0 000                    * D008B
              ROMPTR  0E0 002                    * D0096
              ROMPTR  0E0 024                    * D00A1
            ;                                    * D00AC
            ROMPTR  0E0 001                      * D00B1
            ROMPTR  0E0 045                      * D00BC  BRDispItems
          ;                                      * D00C7
          ROMPTR  0E0 04E                        * D00CC
        ;                                        * D00D7

* ROMPTR 0E0 035
* refs (1): CF38C
ROMP_0E0_035:
        ::                                       * D00DC
          TakeOver                               * D00E1
          ROMPTR  0E0 042                        * D00E6
          ROMPTR  0E0 017                        * D00F1  ~BRRclCurRow
          ROMPTR  0E0 01D                        * D00FC
          #=casedrop                             * D0107
          ROMPTR  0E0 036                        * D010C
          ROMPTR  0E0 049                        * D0117  BRinverse
          ROMPTR  0E0 01C                        * D0122
          DUPUNROT                               * D012D
          #<>                                    * D0132
          ITE                                    * D0137
          ROMPTR  0E0 002                        * D013C
          ::                                     * D0147
            DUP                                  * D014C
            ROMPTR  0E0 024                      * D0151
            #+                                   * D015C
            ROMPTR  0E0 01D                      * D0161
            #<ITE                                * D016C
            ::                                   * D0171
              ROMPTR  0E0 024                    * D0176
              OVER                               * D0181
              #+DUP                              * D0186
              ROMPTR  0E0 002                    * D018B
              ROMPTR  0E0 001                    * D0196
              #1+                                * D01A1
            ;                                    * D01A6
            ::                                   * D01AB
              DROP                               * D01B0
              ROMPTR  0E0 01D                    * D01B5
              DUP                                * D01C0
              ROMPTR  0E0 001                    * D01C5
              DUP                                * D01D0
              ROMPTR  0E0 002                    * D01D5
              ROMPTR  0E0 024                    * D01E0
              #1--                               * D01EB
            ;                                    * D01F0
            ROMPTR  0E0 000                      * D01F5
            ROMPTR  0E0 045                      * D0200  BRDispItems
          ;                                      * D020B
          ROMPTR  0E0 04E                        * D0210
        ;                                        * D021B

* ROMPTR 0E0 036
* refs (1): CF38C
ROMP_0E0_036:
        ::                                       * D0220
          TakeOver                               * D0225
          ROMPTR  0E0 042                        * D022A
          ROMPTR  0E0 016                        * D0235
          #1=                                    * D0240
          case                                   * D0245
          ::                                     * D024A
            ROMPTR  0E0 017                      * D024F  ~BRRclCurRow
            BINT1                                * D025A
            #=casedrop                           * D025F
            DoBadKey                             * D0264
            DROP                                 * D0269
            BINT1                                * D026E
            ROMPTR  0E0 002                      * D0273
            ROMPTR  0E0 04D                      * D027E
          ;                                      * D0289
          ROMPTR  0E0 049                        * D028E  BRinverse
          BINT1                                  * D0299
          ROMPTR  0E0 002                        * D029E
          BINT1                                  * D02A9
          ROMPTR  0E0 000                        * D02AE
          ROMPTR  0E0 024                        * D02B9
          ROMPTR  0E0 001                        * D02C4
          ROMPTR  0E0 045                        * D02CF  BRDispItems
          ROMPTR  0E0 04E                        * D02DA
        ;                                        * D02E5

* ROMPTR 0E0 037
* refs (1): CF38C
ROMP_0E0_037:
        ::                                       * D02EA
          TakeOver                               * D02EF
          ROMPTR  0E0 042                        * D02F4
          ROMPTR  0E0 01D                        * D02FF
          ROMPTR  0E0 01C                        * D030A
          OVER                                   * D0315
          #=                                     * D031A
          case                                   * D031F
          ::                                     * D0324
            ROMPTR  0E0 017                      * D0329  ~BRRclCurRow
            OVER#=case                           * D0334
            ::                                   * D0339
              DROP                               * D033E
              DoBadKey                           * D0343
            ;                                    * D0348
            ROMPTR  0E0 002                      * D034D
            ROMPTR  0E0 04D                      * D0358
          ;                                      * D0363
          ROMPTR  0E0 049                        * D0368  BRinverse
          DUP                                    * D0373
          ROMPTR  0E0 002                        * D0378
          DUP                                    * D0383
          ROMPTR  0E0 024                        * D0388
          #1--                                   * D0393
          ROMPTR  0E0 000                        * D0398
          ROMPTR  0E0 001                        * D03A3
          ROMPTR  0E0 045                        * D03AE  BRDispItems
          ROMPTR  0E0 04E                        * D03B9
        ;                                        * D03C4

* ROMPTR 0E0 038
* refs (1): CF38C
ROMP_0E0_038:
        ::                                       * D03C9
          TakeOver                               * D03CE
          ROMPTR  0E0 042                        * D03D3
          ROMPTR  0E0 015                        * D03DE
          CARCOMP                                * D03E9
          COLA_EVAL                              * D03EE
        ;                                        * D03F3

* ROMPTR 0E0 039
* refs (1): CF38C
ROMP_0E0_039:
        ::                                       * D03F8
          TakeOver                               * D03FD
          ROMPTR  0E0 042                        * D0402
          ROMPTR  0E0 015                        * D040D
          BINT2                                  * D0418
          NTHCOMPDROP                            * D041D
          COLA_EVAL                              * D0422
        ;                                        * D0427

* ROMPTR 0E0 03A
* refs (1): CF38C
ROMP_0E0_03A:
        ::                                       * D042C
          TakeOver                               * D0431
          ROMPTR  0E0 023                        * D0436
          ROMPTR  0E0 043                        * D0441
          ITE                                    * D044C
          ROMPTR  0E0 03C                        * D0451
          ROMPTR  0E0 03B                        * D045C
        ;                                        * D0467

* ROMPTR 0E0 03B
* refs (1): CF38C
ROMP_0E0_03B:
        ::                                       * D046C
          DUP                                    * D0471
          CHR>#                                  * D0476
          DUP                                    * D047B
          BINT64                                 * D0480
          #>                                     * D0485
          SWAP                                   * D048A
          BINT91                                 * D048F
          #<                                     * D0494
          AND                                    * D0499
          ROMPTR  0E0 01A                        * D049E
          NULL{}                                 * D04A9
          EQUALNOT                               * D04AE
          ANDITE                                 * D04B3
          ::                                     * D04B8
            DUP                                  * D04BD
            CHR>#                                * D04C2
            ROMPTR  0E0 01A                      * D04C7
            SWAP                                 * D04D2
            BINT64                               * D04D7
            #-                                   * D04DC
            NTHCOMDDUP                           * D04E1
            #0<>                                 * D04E6
            DUP                                  * D04EB
            ?SKIP                                * D04F0
            SWAPDROP                             * D04F5
          ;                                      * D04FA
          ::                                     * D04FF
            DUP                                  * D0504
            ROMPTR  0E0 017                      * D0509  ~BRRclCurRow
            #1+                                  * D0514
            ROMPTR  0E0 03D                      * D0519
            DUP                                  * D0524
            ?SKIP                                * D0529
            ::                                   * D052E
              DROPDUP                            * D0533
              BINT1                              * D0538
              ROMPTR  0E0 017                    * D053D  ~BRRclCurRow
              ROMPTR  0E0 03E                    * D0548
            ;                                    * D0553
          ;                                      * D0558
          case                                   * D055D
          ::                                     * D0562
            ROMPTR  0E0 040                      * D0567
            ROMPTR  0E0 041                      * D0572
          ;                                      * D057D
          DROP                                   * D0582
          ROMPTR  0E0 042                        * D0587
          DoBadKey                               * D0592
        ;                                        * D0597

* ROMPTR 0E0 03C
* refs (1): CF38C
ROMP_0E0_03C:
        ::                                       * D059C
          DUP                                    * D05A1
          ROMPTR  0E0 017                        * D05A6  ~BRRclCurRow
          #1+                                    * D05B1
          ROMPTR  0E0 03D                        * D05B6
          ?SKIP                                  * D05C1
          ::                                     * D05C6
            DUPONE                               * D05CB
            ROMPTR  0E0 03D                      * D05D0
            DROP                                 * D05DB
          ;                                      * D05E0
          SWAPDROP                               * D05E5
          ROMPTR  0E0 040                        * D05EA
        ;                                        * D05F5

* ROMPTR 0E0 03D
* refs (1): CF38C
ROMP_0E0_03D:
        ::                                       * D05FA
          ROMPTR  0E0 01D                        * D05FF
          ROMPTR  0E0 03E                        * D060A
        ;                                        * D0615

* ROMPTR 0E0 03E
* refs (1): CF38C
ROMP_0E0_03E:
        ::                                       * D061A
          SWAP                                   * D061F
          BEGIN                                  * D0624
          2DUPSWAP                               * D0629
          #>ITE                                  * D062E
          ::                                     * D0633
            3DROP                                * D0638
            FalseTrue                            * D063D
          ;                                      * D0642
          ::                                     * D0647
            DUP                                  * D064C
            ROMPTR  0E0 053                      * D0651  BRGetItem
            CAR$                                 * D065C
            4PICK                                * D0661
            EQUAL                                * D0666
            ITE                                  * D066B
            ::                                   * D0670
              ROTROT2DROP                        * D0675
              TrueTrue                           * D067A
            ;                                    * D067F
            ::                                   * D0684
              #1+                                * D0689
              FALSE                              * D068E
            ;                                    * D0693
          ;                                      * D0698
          UNTIL                                  * D069D
        ;                                        * D06A2

* ROMPTR 0E0 03F
* refs (1): CF38C
ROMP_0E0_03F:
        ::                                       * D06A7
          ROMPTR  0E0 017                        * D06AC  ~BRRclCurRow
          OVER#=                                 * D06B7
          ROMPTR  0E0 016                        * D06BC
          3PICK                                  * D06C7
          #=                                     * D06CC
          ANDcase                                * D06D1
          DROP                                   * D06D6
          ROMPTR  0E0 01D                        * D06DB
          2DUPSWAP                               * D06E6
          #-                                     * D06EB
          ROMPTR  0E0 024                        * D06F0
          #1-                                    * D06FB
          DUPROT                                 * D0700
          #>ITE                                  * D0705
          ::                                     * D070A
            OVERSWAP                             * D070F
            #-SWAP                               * D0714
          ;                                      * D0719
          ::                                     * D071E
            SWAPDROP                             * D0723
            OVER                                 * D0728
            DUPUNROT                             * D072D
            #+                                   * D0732
          ;                                      * D0737
          ROMPTR  0E0 049                        * D073C  BRinverse
          ROMPTR  0E0 001                        * D0747
          ROMPTR  0E0 000                        * D0752
          ROMPTR  0E0 002                        * D075D
          ROMPTR  0E0 045                        * D0768  BRDispItems
          ROMPTR  0E0 04E                        * D0773
        ;                                        * D077E

* ROMPTR 0E0 040
* refs (1): CF38C
ROMP_0E0_040:
        ::                                       * D0783
          DUPDUP                                 * D0788
          ROMPTR  0E0 016                        * D078D
          #<                                     * D0798
          ROMPTR  0E0 01C                        * D079D
          ROTSWAP                                * D07A8
          #>                                     * D07AD
          ORcase                                 * D07B2
          ROMPTR  0E0 03F                        * D07B7
          ROMPTR  0E0 002                        * D07C2
          ROMPTR  0E0 04D                        * D07CD
        ;                                        * D07D8

* ROMPTR 0E0 041
* refs (1): CF38C
ROMP_0E0_041:
        ::                                       * D07DD
          ROMPTR  0E0 00B                        * D07E2
        ;                                        * D07ED

* ROMPTR 0E0 042
* refs (1): CF38C
ROMP_0E0_042:
        ::                                       * D07F2
          BINT0                                  * D07F7
          ROMPTR  0E0 00B                        * D07FC
          UnLockAlpha                            * D0807
        ;                                        * D080C

* ROMPTR 0E0 043
* refs (1): CF38C
ROMP_0E0_043:
        ::                                       * D0811
          DUP                                    * D0816
          ROMPTR  0E0 022                        * D081B
          EQUAL                                  * D0826
        ;                                        * D082B

* ROMPTR 0E0 044
* refs (1): CF38C
ROMP_0E0_044:
        ::                                       * D0830
          ROMPTR  0B0 0A5                        * D0835
          ZEROZERO                               * D0840
          ROT                                    * D0845
          XYGROBDISP                             * D084A
        ;                                        * D084F

* ROMPTR 0E0 045
* refs (1): CF38C
BRDispItems:
        ::                                       * D0854
          RESOROMP                               * D0859
          ROMPTR  0E0 053                        * D085E  BRGetItem
          RESOROMP                               * D0869
          ROMPTR  0E0 047                        * D086E
          ROMPTR  0E0 01C                        * D0879
          #1+                                    * D0884
          ROMPTR  0E0 016                        * D0889
          DO                                     * D0894
          INDEX@                                 * D0899
          DUP                                    * D089E
          4PICK                                  * D08A3
          EVAL                                   * D08A8
          3PICK                                  * D08AD
          EVAL                                   * D08B2
          LOOP                                   * D08B7
          2DROP                                  * D08BC
          ROMPTR  0E0 048                        * D08C1
        ;                                        * D08CC

* ROMPTR 0E0 046
* refs (1): CF38C
ROMP_0E0_046:
        ::                                       * D08D1
          DUP                                    * D08D6
          ROMPTR  0E0 053                        * D08DB  BRGetItem
          ROMPTR  0E0 047                        * D08E6
        ;                                        * D08F1

* ROMPTR 0E0 047
* refs (1): CF38C
ROMP_0E0_047:
        ::                                       * D08F6
          DUPDUP                                 * D08FB
          LEN$                                   * D0900
          DUP#0=                                 * D0905
          ITE                                    * D090A
          2DROP                                  * D090F
          ::                                     * D0914
            SUB$1#                               * D0919
            BINT10                               * D091E
            #=                                   * D0923
            IT                                   * D0928
            ::                                   * D092D
              BINT1                              * D0932
              OVERLEN$                           * D0937
              #1-                                * D093C
              SUB$                               * D0941
            ;                                    * D0946
            CODE                                 * D094B  83 nibbles
              GOSBVL  SAVPTR                     * D0955
              A=DAT1  A                          * D095C
              D1=A                               * D095F
              D1=D1+  5                          * D0962
              C=0     M                          * D0965
              C=DAT1  A                          * D0968
              CSRB                               * D096B
              D=C     A                          * D096E
              D1=D1+  3                          * D0970
              LC(2)   #0A                        * D0973
              B=C     B                          * D0977
L_D097A:
              D1=D1+  2                          * D097A
              D=D-1   A                          * D097D
              GOC     L_D0997                    * D097F
              A=DAT1  B                          * D0982
              ?A#B    B                          * D0985
              GOYES   L_D097A                    * D0988
              LA(2)   #20                        * D098A
              DAT1=A  B                          * D0991
              GONC    L_D097A                    * D0994
L_D0997:
              GOSBVL  GETPTR                     * D0997
              A=DAT0  A                          * D099E
              D0=D0+  5                          * D09A1
              PC=(A)                             * D09A4
            ENDCODE                              * D09A8
          ;                                      * D09A8
          BINT21                                 * D09AD
          OVERLEN$                               * D09B2
          2DUP#<                                 * D09B7
          ITE                                    * D09BC
          ::                                     * D09C1
            DROP                                 * D09C6
            1_#1-SUB$                            * D09CB
            CHR_...                              * D09D0
            >T$                                  * D09D5
          ;                                      * D09DA
          ::                                     * D09DF
            2DUP#=                               * D09E4
            ITE                                  * D09E9
            2DROP                                * D09EE
            ::                                   * D09F3
              #-                                 * D09F8
              Blank$                             * D09FD
              &$                                 * D0A02
            ;                                    * D0A07
          ;                                      * D0A0C
          $>GROB                                 * D0A11
          SWAP                                   * D0A16
          ROMPTR  0E0 016                        * D0A1B
          #-                                     * D0A26
          #8*                                    * D0A2B
          ROMPTR  0E0 020                        * D0A30
          #+                                     * D0A3B
          ONESWAP                                * D0A40
          ROT                                    * D0A45
          XYGROBDISP                             * D0A4A
        ;                                        * D0A4F

* ROMPTR 0E0 048
* refs (1): CF38C
ROMP_0E0_048:
        ::                                       * D0A54
          #       7F                             * D0A59  127
          DUP                                    * D0A63
          ROMPTR  0E0 020                        * D0A68
          ROMPTR  0E0 016                        * D0A73
          #1=                                    * D0A7E
          ITE                                    * D0A83
          ROMPTR  0E0 056                        * D0A88
          ROMPTR  0E0 054                        * D0A93
          XYGROBDISP                             * D0A9E
          BINT48                                 * D0AA3
          ROMPTR  0E0 01C                        * D0AA8
          ROMPTR  0E0 01D                        * D0AB3
          #=ITE                                  * D0ABE
          ROMPTR  0E0 056                        * D0AC3
          ROMPTR  0E0 055                        * D0ACE
          XYGROBDISP                             * D0AD9
        ;                                        * D0ADE

* ROMPTR 0E0 049
* refs (1): CF38C
BRinverse:
        ::                                       * D0AE3
          HARDBUFF                               * D0AE8
          BINT0                                  * D0AED
          ROMPTR  0E0 01F                        * D0AF2
          2DUP                                   * D0AFD
          5PICK                                  * D0B02
          3UNROLL                                * D0B07
          #       7F                             * D0B0C  127
          ROMPTR  0E0 01E                        * D0B16
          SUBGROB                                * D0B21
          INVGROB                                * D0B26
          4UNROLL                                * D0B2B
          GROB!                                  * D0B30
        ;                                        * D0B35

* ROMPTR 0E0 04A
* refs (1): CF38C
ROMP_0E0_04A:
        ::                                       * D0B3A
          BINT1                                  * D0B3F
          ROMPTR  0E0 050                        * D0B44
          HARDBUFF                               * D0B4F
          ROMPTR  0E0 024                        * D0B54
          BINT2                                  * D0B5F
          #-                                     * D0B64
          BINT0                                  * D0B69
          ROMPTR  0E0 051                        * D0B6E
          3PICK                                  * D0B79
          6UNROLL                                * D0B7E
          SUBGROB                                * D0B83
          SWAP                                   * D0B88
          ZEROSWAP                               * D0B8D
          ROMPTR  0E0 04B                        * D0B92
          XYGROBDISP                             * D0B9D
          XYGROBDISP                             * D0BA2
        ;                                        * D0BA7

* ROMPTR 0E0 04B
* refs (1): CF38C
ROMP_0E0_04B:
        ::                                       * D0BAC
          GROB    "images/D0BB1.png"             * D0BB1  127 x 8
        ;                                        * D0CC5

* ROMPTR 0E0 04C
* refs (1): CF38C
ROMP_0E0_04C:
        ::                                       * D0CCA
          BINT0                                  * D0CCF
          ROMPTR  0E0 050                        * D0CD4
          HARDBUFF                               * D0CDF
          ROMPTR  0E0 024                        * D0CE4
          #1-                                    * D0CEF
          BINT1                                  * D0CF4
          ROMPTR  0E0 051                        * D0CF9
          DUP                                    * D0D04
          BINT7                                  * D0D09
          #-                                     * D0D0E
          6UNROLL                                * D0D13
          SUBGROB                                * D0D18
          SWAP#1-                                * D0D1D
          ZEROSWAP                               * D0D22
          ROMPTR  0E0 04B                        * D0D27
          XYGROBDISP                             * D0D32
          XYGROBDISP                             * D0D37
        ;                                        * D0D3C

* ROMPTR 0E0 04D
* refs (1): CF38C
ROMP_0E0_04D:
        ::                                       * D0D41
          ROMPTR  0E0 049                        * D0D46  BRinverse
          ROMPTR  0E0 04E                        * D0D51
        ;                                        * D0D5C

* ROMPTR 0E0 04E
* refs (1): CF38C
ROMP_0E0_04E:
        ::                                       * D0D61
          ROMPTR  0E0 017                        * D0D66  ~BRRclCurRow
          ROMPTR  0E0 04F                        * D0D71
          ROMPTR  0E0 049                        * D0D7C  BRinverse
        ;                                        * D0D87

* ROMPTR 0E0 04F
* refs (1): CF38C
ROMP_0E0_04F:
        ::                                       * D0D8C
          ROMPTR  0E0 016                        * D0D91
          #-                                     * D0D9C
          #8*                                    * D0DA1
          ROMPTR  0E0 020                        * D0DA6
          #+                                     * D0DB1
          DUP#0=ITE                              * D0DB6
          ::                                     * D0DBB
            DUP                                  * D0DC0
            #8+                                  * D0DC5
          ;                                      * D0DCA
          ::                                     * D0DCF
            DUP#1-                               * D0DD4
            SWAP                                 * D0DD9
            #8+                                  * D0DDE
          ;                                      * D0DE3
          ROMPTR  0E0 005                        * D0DE8
          ROMPTR  0E0 006                        * D0DF3
        ;                                        * D0DFE

* ROMPTR 0E0 050
* refs (1): CF38C
ROMP_0E0_050:
        ::                                       * D0E03
          #8*                                    * D0E08
          ROMPTR  0E0 020                        * D0E0D
          #+                                     * D0E18
          ZEROSWAP                               * D0E1D
        ;                                        * D0E22

* ROMPTR 0E0 051
* refs (1): CF38C
ROMP_0E0_051:
        ::                                       * D0E27
          #8*                                    * D0E2C
          ROMPTR  0E0 020                        * D0E31
          DUPUNROT                               * D0E3C
          #+                                     * D0E41
          SWAPROT                                * D0E46
          #1+                                    * D0E4B
          #8*                                    * D0E50
          #+                                     * D0E55
          BINT0                                  * D0E5A
          3UNROLL                                * D0E5F
          #       7F                             * D0E64  127
          SWAP                                   * D0E6E
        ;                                        * D0E73

* ROMPTR 0E0 052
* refs (1): CF38C
BRViewItem:
        ::                                       * D0E78
          ROMPTR  0E0 017                        * D0E7D  ~BRRclCurRow
          ROMPTR  0E0 053                        * D0E88  BRGetItem
          BINT21                                 * D0E93
          OVERLEN$                               * D0E98
          #<                                     * D0E9D
          NOTcase                                * D0EA2
          ::                                     * D0EA7
            DROP                                 * D0EAC
            BINT70                               * D0EB1
            INTEGER337                           * D0EB6
            setbeep                              * D0EBB
          ;                                      * D0EC0
          ROMPTR  0E0 049                        * D0EC5  BRinverse
          TURNMENUOFF                            * D0ED0
          BINT8                                  * D0ED5
          BINT56                                 * D0EDA
          BLANKIT                                * D0EDF
          ::                                     * D0EE4
            BINT1                                * D0EE9
            #       9A                           * D0EEE  154
            SUB$                                 * D0EF8
            DUP                                  * D0EFD
            NEWLINE$                             * D0F02
            BINT1                                * D0F07
            POS$                                 * D0F0C
            DUP#0<>                              * D0F11
            case                                 * D0F16
            ::                                   * D0F1B
              BINT0                              * D0F20
              3UNROLL                            * D0F25
              BEGIN                              * D0F2A
              DUP#0<>                            * D0F2F
              WHILE                              * D0F34
              ::                                 * D0F39
                ROT#1+UNROT                      * D0F3E
                SWAPDUP                          * D0F43
                ROT#1+                           * D0F48
                NEWLINE$                         * D0F4D
                SWAP                             * D0F52
                POS$                             * D0F57
              ;                                  * D0F5C
              REPEAT                             * D0F61
              DROPSWAP                           * D0F66
            ;                                    * D0F6B
            NULL$                                * D0F70
            ROT                                  * D0F75
            BEGIN                                * D0F7A
            DUPLEN$                              * D0F7F
            BINT22                               * D0F84
            #>                                   * D0F89
            WHILE                                * D0F8E
            ::                                   * D0F93
              DUPONE                             * D0F98
              BINT22                             * D0F9D
              SUB$                               * D0FA2
              ROTSWAP                            * D0FA7
              &$                                 * D0FAC
              NEWLINE$&$                         * D0FB1
              SWAP                               * D0FB6
              BINT23                             * D0FBB
              OVERLEN$                           * D0FC0
              SUB$                               * D0FC5
              ROT#1+UNROT                        * D0FCA
            ;                                    * D0FCF
            REPEAT                               * D0FD4
            &$SWAP                               * D0FD9
          ;                                      * D0FDE
          {                                      * D0FE3
            BINT4                                * D0FE8
            BINT4                                * D0FED
            BINT4                                * D0FF2
            BINT3                                * D0FF7
            BINT3                                * D0FFC
            BINT2                                * D1001
            BINT2                                * D1006
          }                                      * D100B
          SWAP#1+                                * D1010
          NTHCOMPDROP                            * D1015
          BINT7                                  * D101A
          Disp5x7                                * D101F
          BEGIN                                  * D1024
          ::                                     * D1029
            WaitForKey                           * D102E
            DROPDUP                              * D1033
            BINT45                               * D1038
            #=                                   * D103D
            SWAP                                 * D1042
            BINT25                               * D1047
            #=                                   * D104C
            ORcase                               * D1051
            FALSE                                * D1056
            TRUE                                 * D105B
          ;                                      * D1060
          WHILE                                  * D1065
          ::                                     * D106A
            DoBadKey                             * D106F
          ;                                      * D1074
          REPEAT                                 * D1079
          BINT8                                  * D107E
          BINT56                                 * D1083
          BLANKIT                                * D1088
          ROMPTR  0E0 045                        * D108D  BRDispItems
          ROMPTR  0E0 049                        * D1098  BRinverse
          TURNMENUON                             * D10A3
        ;                                        * D10A8

* ROMPTR 0E0 053
* refs (1): CF38C
BRGetItem:
        ::                                       * D10AD
          ROMPTR  0E0 018                        * D10B2  ~BRRclC1
          SWAP                                   * D10BD
          ROMPTR  0E0 019                        * D10C2
          EVAL                                   * D10CD
        ;                                        * D10D2

* ROMPTR 0E0 054
* refs (1): CF38C
ROMP_0E0_054:
        GROB    "images/D10D7.png"               * D10D7  4 x 7

* ROMPTR 0E0 055
* refs (1): CF38C
ROMP_0E0_055:
        GROB    "images/D10F9.png"               * D10F9  4 x 7

* ROMPTR 0E0 056
* refs (1): CF38C
ROMP_0E0_056:
        GROB    "images/D111B.png"               * D111B  4 x 7

LIB0E0.hash:
        CON(5)  DOHSTR                           * D113D  hash table of library 0E0
        LENGTH                                   * D1142  length, to #D11A1
        CON(5)  0                                * D1147  names of length 1
        CON(5)  0                                * D114C  names of length 2
        CON(5)  0                                * D1151  names of length 3
        CON(5)  0                                * D1156  names of length 4
        CON(5)  0                                * D115B  names of length 5
        CON(5)  0                                * D1160  names of length 6
        CON(5)  0                                * D1165  names of length 7
        CON(5)  0                                * D116A  names of length 8
        CON(5)  0                                * D116F  names of length 9
        CON(5)  0                                * D1174  names of length 10
        CON(5)  0                                * D1179  names of length 11
        CON(5)  0                                * D117E  names of length 12
        CON(5)  0                                * D1183  names of length 13
        CON(5)  0                                * D1188  names of length 14
        CON(5)  0                                * D118D  names of length 15
        CON(5)  0                                * D1192  names of length 16
        REL(5)  L_D119C                          * D1197  end of the names
L_D119C:
        CON(5)  0                                * D119C  command 000 has no name
        ENDLENGTH                                * D11A1

LIB0E0.link:
        CON(5)  DOHSTR                           * D11A1  link table of library 0E0
        LENGTH                                   * D11A6  length, to #D135E
        REL(5)  ROMP_0E0_000                     * D11AB  000 
        REL(5)  ROMP_0E0_001                     * D11B0  001 
        REL(5)  ROMP_0E0_002                     * D11B5  002 
        REL(5)  ~BRStoC1                         * D11BA  003 ~BRStoC1
        REL(5)  ROMP_0E0_004                     * D11BF  004 
        REL(5)  ROMP_0E0_005                     * D11C4  005 
        REL(5)  ROMP_0E0_006                     * D11C9  006 
        REL(5)  ROMP_0E0_007                     * D11CE  007 
        REL(5)  ROMP_0E0_008                     * D11D3  008 
        REL(5)  ROMP_0E0_009                     * D11D8  009 
        REL(5)  ROMP_0E0_00A                     * D11DD  00A 
        REL(5)  ROMP_0E0_00B                     * D11E2  00B 
        REL(5)  ROMP_0E0_00C                     * D11E7  00C 
        REL(5)  ROMP_0E0_00D                     * D11EC  00D 
        REL(5)  ROMP_0E0_00E                     * D11F1  00E 
        REL(5)  ROMP_0E0_00F                     * D11F6  00F 
        REL(5)  ~BRbrowse                        * D11FB  010 ~BRbrowse
        REL(5)  ROMP_0E0_011                     * D1200  011 
        REL(5)  ~BRoutput                        * D1205  012 ~BRoutput
        REL(5)  BRdone                           * D120A  013 BRdone
        REL(5)  ROMP_0E0_014                     * D120F  014 
        REL(5)  ROMP_0E0_015                     * D1214  015 
        REL(5)  ROMP_0E0_016                     * D1219  016 
        REL(5)  ~BRRclCurRow                     * D121E  017 ~BRRclCurRow
        REL(5)  ~BRRclC1                         * D1223  018 ~BRRclC1
        REL(5)  ROMP_0E0_019                     * D1228  019 
        REL(5)  ROMP_0E0_01A                     * D122D  01A 
        REL(5)  ROMP_0E0_01B                     * D1232  01B 
        REL(5)  ROMP_0E0_01C                     * D1237  01C 
        REL(5)  ROMP_0E0_01D                     * D123C  01D 
        REL(5)  ROMP_0E0_01E                     * D1241  01E 
        REL(5)  ROMP_0E0_01F                     * D1246  01F 
        REL(5)  ROMP_0E0_020                     * D124B  020 
        REL(5)  ROMP_0E0_021                     * D1250  021 
        REL(5)  ROMP_0E0_022                     * D1255  022 
        REL(5)  ROMP_0E0_023                     * D125A  023 
        REL(5)  ROMP_0E0_024                     * D125F  024 
        REL(5)  ROMP_0E0_025                     * D1264  025 
        REL(5)  ROMP_0E0_026                     * D1269  026 
        REL(5)  ROMP_0E0_027                     * D126E  027 
        REL(5)  ROMP_0E0_028                     * D1273  028 
        REL(5)  ROMP_0E0_029                     * D1278  029 
        REL(5)  ROMP_0E0_02A                     * D127D  02A 
        REL(5)  ROMP_0E0_02B                     * D1282  02B 
        REL(5)  ROMP_0E0_02C                     * D1287  02C 
        REL(5)  ROMP_0E0_02D                     * D128C  02D 
        REL(5)  ROMP_0E0_02E                     * D1291  02E 
        REL(5)  ROMP_0E0_02F                     * D1296  02F 
        REL(5)  ROMP_0E0_030                     * D129B  030 
        REL(5)  ROMP_0E0_031                     * D12A0  031 
        REL(5)  ROMP_0E0_032                     * D12A5  032 
        REL(5)  ROMP_0E0_033                     * D12AA  033 
        REL(5)  ROMP_0E0_034                     * D12AF  034 
        REL(5)  ROMP_0E0_035                     * D12B4  035 
        REL(5)  ROMP_0E0_036                     * D12B9  036 
        REL(5)  ROMP_0E0_037                     * D12BE  037 
        REL(5)  ROMP_0E0_038                     * D12C3  038 
        REL(5)  ROMP_0E0_039                     * D12C8  039 
        REL(5)  ROMP_0E0_03A                     * D12CD  03A 
        REL(5)  ROMP_0E0_03B                     * D12D2  03B 
        REL(5)  ROMP_0E0_03C                     * D12D7  03C 
        REL(5)  ROMP_0E0_03D                     * D12DC  03D 
        REL(5)  ROMP_0E0_03E                     * D12E1  03E 
        REL(5)  ROMP_0E0_03F                     * D12E6  03F 
        REL(5)  ROMP_0E0_040                     * D12EB  040 
        REL(5)  ROMP_0E0_041                     * D12F0  041 
        REL(5)  ROMP_0E0_042                     * D12F5  042 
        REL(5)  ROMP_0E0_043                     * D12FA  043 
        REL(5)  ROMP_0E0_044                     * D12FF  044 
        REL(5)  BRDispItems                      * D1304  045 BRDispItems
        REL(5)  ROMP_0E0_046                     * D1309  046 
        REL(5)  ROMP_0E0_047                     * D130E  047 
        REL(5)  ROMP_0E0_048                     * D1313  048 
        REL(5)  BRinverse                        * D1318  049 BRinverse
        REL(5)  ROMP_0E0_04A                     * D131D  04A 
        REL(5)  ROMP_0E0_04B                     * D1322  04B 
        REL(5)  ROMP_0E0_04C                     * D1327  04C 
        REL(5)  ROMP_0E0_04D                     * D132C  04D 
        REL(5)  ROMP_0E0_04E                     * D1331  04E 
        REL(5)  ROMP_0E0_04F                     * D1336  04F 
        REL(5)  ROMP_0E0_050                     * D133B  050 
        REL(5)  ROMP_0E0_051                     * D1340  051 
        REL(5)  BRViewItem                       * D1345  052 BRViewItem
        REL(5)  BRGetItem                        * D134A  053 BRGetItem
        REL(5)  ROMP_0E0_054                     * D134F  054 
        REL(5)  ROMP_0E0_055                     * D1354  055 
        REL(5)  ROMP_0E0_056                     * D1359  056 
        ENDLENGTH                                * D135E
        NIBHEX  0000                             * D135E  ..
