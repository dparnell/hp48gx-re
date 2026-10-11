* HP 48GX ROM revision R, #B4B39-#B7B7C: Library part 0B5
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #B4B39 in the original ROM).

LIB0B5:
        CON(3)  #0B5                             * B4B39  library number
        REL(5)  LIB0B5.hash                      * B4B3C  hash table
        CON(5)  0                                * B4B41  message table
        REL(5)  LIB0B5.link                      * B4B46  link table
        CON(5)  0                                * B4B4B  config
        RPL

* ROMPTR 0B5 000
* refs (1): B4B39
ROMP_0B5_000:
        ::                                       * B4B50
          ROMPTR  0B5 028                        * B4B55
        ;                                        * B4B60

* ROMPTR 0B5 001
* refs (1): B4B39
ROMP_0B5_001:
        ::                                       * B4B65
          ROMPTR  0B5 029                        * B4B6A
        ;                                        * B4B75

* ROMPTR 0B5 002
* refs (1): B4B39
ROMP_0B5_002:
        ::                                       * B4B7A
          ROMPTR  0B5 02B                        * B4B7F
          DUP                                    * B4B8A
          MINUSONE                               * B4B8F
          EQUAL                                  * B4B94
          casedrop                               * B4B99
          NULL{}                                 * B4B9E
          FINDVAR                                * B4BA3
        ;                                        * B4BA8

* ROMPTR 0B5 003
* refs (1): B4B39
ROMP_0B5_003:
        ::                                       * B4BAD
          ROMPTR  0B5 02A                        * B4BB2
          ROMPTR  0B5 008                        * B4BBD
          SWAPDUP                                * B4BC8
          SAFE@                                  * B4BCD
          ?SKIP                                  * B4BD2
          %0_2A2B4                               * B4BD7
          SYMBNUMSOLVE                           * B4BDC
          case                                   * B4BE1
          ::                                     * B4BE6
            JstGetTHEMESG                        * B4BEB
            SWAPDROP                             * B4BF0
            TRUE                                 * B4BF5
          ;                                      * B4BFA
          DUP                                    * B4BFF
          JstGetTHEMESG                          * B4C04
          FALSE                                  * B4C09
        ;                                        * B4C0E

* ROMPTR 0B5 004
* refs (1): B4B39
ROMP_0B5_004:
        ::                                       * B4C13
          ROMPTR  0B5 008                        * B4C18
          DUP                                    * B4C23
          ALGeq?                                 * B4C28
          case                                   * B4C2D
          ::                                     * B4C32
            SPLITEQ                              * B4C37
            1LAMBIND                             * B4C3C
            'EvalNoCK:_sup                       * B4C41
            xEVAL                                * B4C46
            CK1NoBlame                           * B4C4B
            1GETABND                             * B4C50
            'EvalNoCK:_sup                       * B4C55
            xEVAL                                * B4C5A
            CK1NoBlame                           * B4C5F
            TRUE                                 * B4C64
          ;                                      * B4C69
          'EvalNoCK:_sup                         * B4C6E
          xEVAL                                  * B4C73
          CK1NoBlame                             * B4C78
          FALSE                                  * B4C7D
        ;                                        * B4C82

* ROMPTR 0B5 005
* refs (1): B4B39
ROMP_0B5_005:
        ::                                       * B4C87
          SAFE@                                  * B4C8C
        ;                                        * B4C91

* ROMPTR 0B5 006
* refs (1): B4B39
ROMP_0B5_006:
        ::                                       * B4C96
          STRIPTAGSl2                            * B4C9B
          OVER                                   * B4CA0
          FINDVAR                                * B4CA5
          OVERSWAP                               * B4CAA
          matchob?                               * B4CAF
          ITE                                    * B4CB4
          SETCIRCERR                             * B4CB9
          DROP                                   * B4CBE
          OBJ_1552C                              * B4CC3
          XEQSTOID                               * B4CC8
        ;                                        * B4CCD

* ROMPTR 0B5 007
* refs (1): B4B39
ROMP_0B5_007:
        ::                                       * B4CD2
          ROMPTR  0B5 008                        * B4CD7
          '                                      * B4CE2
          ID      X                              * B4CE7
          ROMPTR  0C4 00C                        * B4CF0
        ;                                        * B4CFB

* ROMPTR 0B5 008
* refs (1): B4B39
ROMP_0B5_008:
        ::                                       * B4D00
          DUP                                    * B4D05
          MINUSONE                               * B4D0A
          EQUAL                                  * B4D0F
          case                                   * B4D14
          SETTYPEERR                             * B4D19
        ;                                        * B4D1E

* ROMPTR 0B5 009
* refs (1): B4B39
ROMP_0B5_009:
        ::                                       * B4D23
          ROMPTR  0B5 008                        * B4D28
          '                                      * B4D33
          ID      X                              * B4D38
          ROMPTR  0C4 00D                        * B4D41
        ;                                        * B4D4C

* ROMPTR 0B5 00A
* refs (1): B4B39
ROMP_0B5_00A:
        ::                                       * B4D51
          ROMPTR  0B5 008                        * B4D56
          ROMPTR  0C4 009                        * B4D61
        ;                                        * B4D6C

* ROMPTR 0B5 00B
* refs (1): B4B39
ROMP_0B5_00B:
        ::                                       * B4D71
          ROMPTR  0B5 008                        * B4D76
          ROMPTR  0C0 001                        * B4D81
        ;                                        * B4D8C

* ROMPTR 0B5 00C
* refs (1): B4B39
ROMP_0B5_00C:
        ::                                       * B4D91
          case                                   * B4D96
          DoOldMatrix                            * B4D9B
          DoNewMatrix                            * B4DA0
          DEPTH                                  * B4DA5
          #0=case                                * B4DAA
          FALSE                                  * B4DAF
          DUPTYPEARRY?                           * B4DB4
        ;                                        * B4DB9

* ROMPTR 0B5 00D
* refs (1): B4B39
ROMP_0B5_00D:
        ::                                       * B4DBE
          SWAPDUP                                * B4DC3
          MDIMS                                  * B4DC8
          OBJ_37DE1                              * B4DCD
          #<>case                                * B4DD2
          ROMPTR  0C2 022                        * B4DD7
          DUPUNROT                               * B4DE2
          ERRSET                                 * B4DE7
          ROMPTR  0C2 053                        * B4DEC
          ERRTRAP                                * B4DF7
          ::                                     * B4DFC
            ROT                                  * B4E01
            ROMPTR  0C2 022                      * B4E06
          ;                                      * B4E11
          SWAPDROP                               * B4E16
        ;                                        * B4E1B

* ROMPTR 0B5 00E
* refs (1): B4B39
ROMP_0B5_00E:
        ::                                       * B4E20
          MAT*                                   * B4E25
        ;                                        * B4E2A

* ROMPTR 0B5 00F
* refs (1): B4B39
ROMP_0B5_00F:
        ::                                       * B4E2F
          ROMPTR  0E6 008                        * B4E34
          N                                      * B4E3F
        ;                                        * B4E44

* ROMPTR 0B5 010
* refs (1): B4B39
ROMP_0B5_010:
        ::                                       * B4E49
          ROMPTR  0B5 011                        * B4E4E
          ROMPTR  0E6 009                        * B4E59
          N                                      * B4E64
        ;                                        * B4E69

* ROMPTR 0B5 011
* refs (1): B4B39
ROMP_0B5_011:
        ::                                       * B4E6E
          DUP                                    * B4E73
          MINUSONE                               * B4E78
          EQUAL                                  * B4E7D
          case                                   * B4E82
          drop;q_58A0C                           * B4E87
        ;                                        * B4E8C

* ROMPTR 0B5 012
* refs (1): B4B39
ROMP_0B5_012:
        ::                                       * B4E91
          ROMPTR  0E6 008                        * B4E96
          I%YR                                   * B4EA1
        ;                                        * B4EA6

* ROMPTR 0B5 013
* refs (1): B4B39
ROMP_0B5_013:
        ::                                       * B4EAB
          ROMPTR  0B5 011                        * B4EB0
          ROMPTR  0E6 009                        * B4EBB
          I%YR                                   * B4EC6
        ;                                        * B4ECB

* ROMPTR 0B5 014
* refs (1): B4B39
ROMP_0B5_014:
        ::                                       * B4ED0
          ROMPTR  0E6 008                        * B4ED5
          PV                                     * B4EE0
        ;                                        * B4EE5

* ROMPTR 0B5 015
* refs (1): B4B39
ROMP_0B5_015:
        ::                                       * B4EEA
          ROMPTR  0B5 011                        * B4EEF
          ROMPTR  0E6 009                        * B4EFA
          PV                                     * B4F05
        ;                                        * B4F0A

* ROMPTR 0B5 016
* refs (1): B4B39
ROMP_0B5_016:
        ::                                       * B4F0F
          ROMPTR  0E6 008                        * B4F14
          PMT                                    * B4F1F
        ;                                        * B4F24

* ROMPTR 0B5 017
* refs (1): B4B39
ROMP_0B5_017:
        ::                                       * B4F29
          ROMPTR  0B5 011                        * B4F2E
          ROMPTR  0E6 009                        * B4F39
          PMT                                    * B4F44
        ;                                        * B4F49

* ROMPTR 0B5 018
* refs (1): B4B39
ROMP_0B5_018:
        ::                                       * B4F4E
          ROMPTR  0E6 008                        * B4F53
          FV                                     * B4F5E
        ;                                        * B4F63

* ROMPTR 0B5 019
* refs (1): B4B39
ROMP_0B5_019:
        ::                                       * B4F68
          ROMPTR  0B5 011                        * B4F6D
          ROMPTR  0E6 009                        * B4F78
          FV                                     * B4F83
        ;                                        * B4F88

* ROMPTR 0B5 01A
* refs (1): B4B39
ROMP_0B5_01A:
        ::                                       * B4F8D
          ROMPTR  0E6 008                        * B4F92
          PYR                                    * B4F9D
          %ABS                                   * B4FA2
          %IP                                    * B4FA7
          DUP%0=                                 * B4FAC
          IT                                     * B4FB1
          ::                                     * B4FB6
            DROP                                 * B4FBB
            %12                                  * B4FC0
          ;                                      * B4FC5
        ;                                        * B4FCA

* ROMPTR 0B5 01B
* refs (1): B4B39
ROMP_0B5_01B:
        ::                                       * B4FCF
          ROMPTR  0B5 011                        * B4FD4
          %ABS                                   * B4FDF
          %IP                                    * B4FE4
          DUP%0=                                 * B4FE9
          IT                                     * B4FEE
          ::                                     * B4FF3
            DROP                                 * B4FF8
            %12                                  * B4FFD
          ;                                      * B5002
          ROMPTR  0E6 009                        * B5007
          PYR                                    * B5012
        ;                                        * B5017

* ROMPTR 0B5 01C
* refs (1): B4B39
ROMP_0B5_01C:
        ::                                       * B501C
          ROMPTR  0B5 025                        * B5021
          BINT14                                 * B502C
          SysITE                                 * B5031
          BINT1                                  * B5036
          BINT2                                  * B503B
          NTHCOMPDROP                            * B5040
        ;                                        * B5045

* ROMPTR 0B5 01D
* refs (1): B4B39
ROMP_0B5_01D:
        ::                                       * B504A
          ROMPTR  0B0 09A                        * B504F
          ITE                                    * B505A
          ROMPTR  0E6 005                        * B505F
          ROMPTR  0E6 006                        * B506A
        ;                                        * B5075

* ROMPTR 0B5 01E
* refs (1): B4B39
ROMP_0B5_01E:
        ::                                       * B507A
          '                                      * B507F
          N                                      * B5084
          ROMPTR  0E6 00C                        * B5089
          DUP                                    * B5094
          ROMPTR  0E6 009                        * B5099
          N                                      * B50A4
        ;                                        * B50A9

* ROMPTR 0B5 01F
* refs (1): B4B39
ROMP_0B5_01F:
        ::                                       * B50AE
          '                                      * B50B3
          I%YR                                   * B50B8
          ROMPTR  0E6 00C                        * B50BD
          DUP                                    * B50C8
          ROMPTR  0E6 009                        * B50CD
          I%YR                                   * B50D8
        ;                                        * B50DD

* ROMPTR 0B5 020
* refs (1): B4B39
ROMP_0B5_020:
        ::                                       * B50E2
          '                                      * B50E7
          PV                                     * B50EC
          ROMPTR  0E6 00C                        * B50F1
          DUP                                    * B50FC
          ROMPTR  0E6 009                        * B5101
          PV                                     * B510C
        ;                                        * B5111

* ROMPTR 0B5 021
* refs (1): B4B39
ROMP_0B5_021:
        ::                                       * B5116
          '                                      * B511B
          PMT                                    * B5120
          ROMPTR  0E6 00C                        * B5125
          DUP                                    * B5130
          ROMPTR  0E6 009                        * B5135
          PMT                                    * B5140
        ;                                        * B5145

* ROMPTR 0B5 022
* refs (1): B4B39
ROMP_0B5_022:
        ::                                       * B514A
          '                                      * B514F
          FV                                     * B5154
          ROMPTR  0E6 00C                        * B5159
          DUP                                    * B5164
          ROMPTR  0E6 009                        * B5169
          FV                                     * B5174
        ;                                        * B5179

* ROMPTR 0B5 023
* refs (1): B4B39
ROMP_0B5_023:
        ::                                       * B517E
          ROMPTR  0B5 008                        * B5183
          ROMPTR  0E6 004                        * B518E
        ;                                        * B5199

* ROMPTR 0B5 024
* refs (1): B4B39
ROMP_0B5_024:
        ::                                       * B519E
          DUP                                    * B51A3
          MINUSONE                               * B51A8
          EQUAL                                  * B51AD
          casedrop                               * B51B2
          NULL$                                  * B51B7
          RCLSYSF                                * B51BC
          SWAP                                   * B51C1
          ERRSET                                 * B51C6
          BINT2                                  * B51CB
          DOFIX                                  * B51D0
          ->str1(r)                              * B51D5
          ERRTRAP                                * B51DA
          ::                                     * B51DF
            TYPEBINT?                            * B51E4
            IT                                   * B51E9
            DROP                                 * B51EE
            STOSYSF                              * B51F3
            ERRJMP                               * B51F8
          ;                                      * B51FD
          SWAP                                   * B5202
          STOSYSF                                * B5207
        ;                                        * B520C

* ROMPTR 0B5 025
* refs (1): B4B39
ROMP_0B5_025:
        {                                        * B5211
          ROMPTR  0B5 026                        * B5216
          ROMPTR  0B5 027                        * B5221
        }                                        * B522C

* ROMPTR 0B5 026
* refs (1): B4B39
ROMP_0B5_026:
        {                                        * B5231
          #       BF4C                           * B5236  48972
          #       BF4D                           * B5240  48973
          TRUE                                   * B524A
        }                                        * B524F

* ROMPTR 0B5 027
* refs (1): B4B39
ROMP_0B5_027:
        {                                        * B5254
          #       BF4B                           * B5259  48971
          #       BF4B                           * B5263  48971
          FALSE                                  * B526D
        }                                        * B5272

* ROMPTR 0B5 028
* refs (1): B4B39
ROMP_0B5_028:
        ::                                       * B5277
          'EQ                                    * B527C
          SAFE@_HERE                             * B5281
          NOTcase                                * B5286
          MINUSONE                               * B528B
        ;                                        * B5290

* ROMPTR 0B5 029
* refs (1): B4B39
ROMP_0B5_029:
        ::                                       * B5295
          DUP                                    * B529A
          MINUSONE                               * B529F
          EQUAL                                  * B52A4
          caseDROP                               * B52A9
          DOSTOE                                 * B52AE
        ;                                        * B52B3

* ROMPTR 0B5 02A
* refs (1): B4B39
ROMP_0B5_02A:
        ::                                       * B52B8
          'EQ                                    * B52BD
          SAFE@_HERE                             * B52C2
          NOTcase                                * B52C7
          MINUSONE                               * B52CC
          ROMPTR  0B5 02B                        * B52D1
        ;                                        * B52DC

* ROMPTR 0B5 02B
* refs (1): B4B39
ROMP_0B5_02B:
        ::                                       * B52E1
          DUP                                    * B52E6
          EqList?                                * B52EB
          ITE                                    * B52F0
          ::                                     * B52F5
            BINT1                                * B52FA
            NTHELCOMP                            * B52FF
          ;                                      * B5304
          TRUE                                   * B5309
          NOTcase                                * B530E
          MINUSONE                               * B5313
          DUPTYPELIST?                           * B5318
          NOT?SEMI                               * B531D
          CARCOMP                                * B5322
        ;                                        * B5327

* ROMPTR 0B5 02C
* refs (1): B4B39
ROMP_0B5_02C:
        ::                                       * B532C
          'EQ                                    * B5331
          SAFE@_HERE                             * B5336
          NOTcase                                * B533B
          ::                                     * B5340
            MINUSONE                             * B5345
            DUPDUP                               * B534A
          ;                                      * B534F
          DUPTYPELIST?                           * B5354
          NOTcasedrop                            * B5359
          ::                                     * B535E
            MINUSONE                             * B5363
            DUPDUP                               * B5368
          ;                                      * B536D
          INNERCOMP                              * B5372
          DUP                                    * B5377
          #3=                                    * B537C
          case                                   * B5381
          DROP                                   * B5386
          NDROP                                  * B538B
          MINUSONE                               * B5390
          DUPDUP                                 * B5395
        ;                                        * B539A

* ROMPTR 0B5 02D
* refs (1): B4B39
ROMP_0B5_02D:
        ::                                       * B539F
          DUP                                    * B53A4
          MINUSONE                               * B53A9
          EQUALcase                              * B53AE
          3DROP                                  * B53B3
          OVER                                   * B53B8
          MINUSONE                               * B53BD
          EQUALcase                              * B53C2
          3DROP                                  * B53C7
          3PICK                                  * B53CC
          MINUSONE                               * B53D1
          EQUALcase                              * B53D6
          3DROP                                  * B53DB
          BINT3                                  * B53E0
          {}N                                    * B53E5
          DOSTOE                                 * B53EA
        ;                                        * B53EF

* ROMPTR 0B5 02F
* refs (2): B4B39 B4B39
ROMP_0B5_02F:
        ::                                       * B53F4
          BINT1                                  * B53F9
          {}N                                    * B53FE
          PUTINDEPLIST                           * B5403
        ;                                        * B5408

* ROMPTR 0B5 030
* refs (1): B4B39
ROMP_0B5_030:
        ::                                       * B540D
          dLISTcase                              * B5412
          ICMPDRPRTDRP                           * B5417
          DROP                                   * B541C
          ZEROZERO                               * B5421
        ;                                        * B5426

* ROMPTR 0B5 031
* refs (1): B4B39
ROMP_0B5_031:
        ::                                       * B542B
          dLISTcase                              * B5430
          ICMPDRPRTDRP                           * B5435
          DROP                                   * B543A
          %0_2A2B4                               * B543F
          1REV                                   * B5444
        ;                                        * B5449

* ROMPTR 0B5 032
* refs (1): B4B39
ROMP_0B5_032:
        ::                                       * B544E
          dLISTcase                              * B5453
          ICMPDRPRTDRP                           * B5458
          DROP                                   * B545D
          %0_2A2B4                               * B5462
          GETXMAX                                * B5467
        ;                                        * B546C

* ROMPTR 0B5 035
* refs (3): B4B39 B4B39 B4B39
ROMP_0B5_035:
        ::                                       * B5471
          DUPTYPEBINT?                           * B5476
          case2drop                              * B547B
          ::                                     * B5480
            INDEPVAR                             * B5485
            PUTINDEP                             * B548A
          ;                                      * B548F
          TWO{}N                                 * B5494
          PUTINDEPLIST                           * B5499
        ;                                        * B549E

* ROMPTR 0B5 036
* refs (1): B4B39
ROMP_0B5_036:
        ::                                       * B54A3
          GETXMIN                                * B54A8
          GETXMAX                                * B54AD
        ;                                        * B54B2

* ROMPTR 0B5 039
* refs (3): B4B39 B4B39 B4B39
ROMP_0B5_039:
        ::                                       * B54B7
          BINT1                                  * B54BC
          {}N                                    * B54C1
          depnd(li)                              * B54C6
        ;                                        * B54CB

* ROMPTR 0B5 03A
* refs (1): B4B39
ROMP_0B5_03A:
        ::                                       * B54D0
          dLISTcase                              * B54D5
          ::                                     * B54DA
            ICMPDRPRTDRP                         * B54DF
            OVER                                 * B54E4
            TYPEREAL?                            * B54E9
            ?SEMI                                * B54EE
            2DROP                                * B54F3
            ZEROZERO                             * B54F8
          ;                                      * B54FD
          DROP                                   * B5502
          ZEROZERO                               * B5507
        ;                                        * B550C

* ROMPTR 0B5 03B
* refs (1): B4B39
ROMP_0B5_03B:
        ::                                       * B5511
          DUPTYPEBINT?                           * B5516
          case2drop                              * B551B
          ::                                     * B5520
            OBJ_4D96B                            * B5525
            depnd(gn)                            * B552A
          ;                                      * B552F
          TWO{}N                                 * B5534
          depnd(li)                              * B5539
        ;                                        * B553E

* ROMPTR 0B5 03C
* refs (1): B4B39
ROMP_0B5_03C:
        ::                                       * B5543
          GETYMIN                                * B5548
          GETYMAX                                * B554D
        ;                                        * B5552

* ROMPTR 0B5 03E
* refs (2): B4B39 B4B39
ROMP_0B5_03E:
        ::                                       * B5557
          DUP                                    * B555C
          TYPEHSTR?                              * B5561
          case                                   * B5566
          ::                                     * B556B
            HXS>#                                * B5570
            DUP#0=case                           * B5575
            FALSE                                * B557A
            UNCOERCE                             * B557F
            TRUE                                 * B5584
          ;                                      * B5589
          DUP                                    * B558E
          %0<>                                   * B5593
          case                                   * B5598
          FALSE                                  * B559D
          DROPZERO                               * B55A2
          FALSE                                  * B55A7
        ;                                        * B55AC

* ROMPTR 0B5 03F
* refs (1): B4B39
ROMP_0B5_03F:
        ::                                       * B55B1
          SWAP                                   * B55B6
          DUPTYPEBINT?                           * B55BB
          case                                   * B55C0
          ::                                     * B55C5
            SWAPDROP                             * B55CA
            #>HXS                                * B55CF
            PUTRES                               * B55D4
          ;                                      * B55D9
          SWAP                                   * B55DE
          NOTcase                                * B55E3
          PUTRES                                 * B55E8
          COERCE                                 * B55ED
          #>HXS                                  * B55F2
          PUTRES                                 * B55F7
        ;                                        * B55FC

* ROMPTR 0B5 040
* refs (1): B4B39
ROMP_0B5_040:
        ::                                       * B5601
          case                                   * B5606
          ::                                     * B560B
            2DROP                                * B5610
            %1                                   * B5615
          ;                                      * B561A
          ROMPTR  0B5 041                        * B561F
          %%1                                    * B562A
          SWAP                                   * B562F
          %%/>%                                  * B5634
        ;                                        * B5639

* ROMPTR 0B5 041
* refs (1): B4B39
ROMP_0B5_041:
        ::                                       * B563E
          RclMaxStdPict                          * B5643
          SWAPDROP                               * B5648
          #1-                                    * B564D
          UNCOERCE%%                             * B5652
          SWAP                                   * B5657
          %>%%                                   * B565C
          ROT                                    * B5661
          %>%%                                   * B5666
          %%-                                    * B566B
          %%/                                    * B5670
        ;                                        * B5675

* ROMPTR 0B5 042
* refs (1): B4B39
ROMP_0B5_042:
        ::                                       * B567A
          3PICK3PICK                             * B567F
          SWAP                                   * B5684
          %-                                     * B5689
          %       1.3E2                          * B568E
          %/                                     * B56A3
          SWAP                                   * B56A8
          NOTcase                                * B56AD
          ROTROT2DROP                            * B56B2
          %>%%                                   * B56B7
          3UNROLL                                * B56BC
          ROMPTR  0B5 041                        * B56C1
          %%*                                    * B56CC
          %%>%                                   * B56D1
        ;                                        * B56D6

* ROMPTR 0B5 043
* refs (1): B4B39
ROMP_0B5_043:
        ::                                       * B56DB
          RAD?                                   * B56E0
          ITE                                    * B56E5
          %       3.49065850399E-2               * B56EA
          %2                                     * B56FF
          SWAP                                   * B5704
          NOTcase                                * B5709
          ROTROT2DROP                            * B570E
          %>%%                                   * B5713
          3UNROLL                                * B5718
          ROMPTR  0B5 041                        * B571D
          %%*                                    * B5728
          %%>%                                   * B572D
        ;                                        * B5732

* ROMPTR 0B5 045
* refs (2): B4B39 B4B39
ROMP_0B5_045:
        ::                                       * B5737
          FALSE                                  * B573C
          ROMPTR  0B5 03F                        * B5741
        ;                                        * B574C

* ROMPTR 0B5 047
* refs (2): B4B39 B4B39
ROMP_0B5_047:
        ::                                       * B5751
          SWAP                                   * B5756
          %-                                     * B575B
          %13                                    * B5760
          %/                                     * B5765
        ;                                        * B576A

* ROMPTR 0B5 049
* refs (2): B4B39 B4B39
ROMP_0B5_049:
        ::                                       * B576F
          Exist@äDAT?                            * B5774
          NOTcase                                * B5779
          MINUSONE                               * B577E
          OBJ_2D252                              * B5783
        ;                                        * B5788

* ROMPTR 0B5 04A
* refs (1): B4B39
ROMP_0B5_04A:
        ::                                       * B578D
          ROMPTR  0B5 011                        * B5792
          STATCLST                               * B579D
          å-                                     * B57A2
        ;                                        * B57A7

* ROMPTR 0B5 04F
* refs (5): B4B39 B4B39 B4B39 B4B39 B4B39
ROMP_0B5_04F:
        ::                                       * B57AC
          {                                      * B57B1
            xFUNCTION                            * B57B6
            ROMPTR  0B5 051                      * B57BB
            POLAR                                * B57C6
            ROMPTR  0B5 052                      * B57CB
            xCONIC                               * B57D6
            ROMPTR  0B5 053                      * B57DB
            xTRUTH                               * B57E6
            ROMPTR  0B5 054                      * B57EB
            xPARAMETRIC                          * B57F6
            ROMPTR  0B5 055                      * B57FB
            ROMPTR  0AB 00E                      * B5806  DIFFEQ
            ROMPTR  0B5 056                      * B5811
            xHISTOGRAM                           * B581C
            ROMPTR  0B5 057                      * B5821
            xBAR                                 * B582C
            ROMPTR  0B5 058                      * B5831
            xSCATTER                             * B583C
            ROMPTR  0B5 059                      * B5841
            ROMPTR  0AB 00C                      * B584C  SLOPEFIELD
            ROMPTR  0B5 05A                      * B5857
            ROMPTR  0AB 008                      * B5862  WIREFRAME
            ROMPTR  0B5 05B                      * B586D
            ROMPTR  0AB 00D                      * B5878  PCONTOUR
            ROMPTR  0B5 05C                      * B5883
            ROMPTR  0AB 00B                      * B588E  YSLICE
            ROMPTR  0B5 05D                      * B5899
            ROMPTR  0AB 00A                      * B58A4  GRIDMAP
            ROMPTR  0B5 05E                      * B58AF
            ROMPTR  0AB 009                      * B58BA  PARSURFACE
            ROMPTR  0B5 05F                      * B58C5
          }                                      * B58D0
          ROMPTR  0B5 07B                        * B58D5
          NcaseSIZEERR                           * B58E0
        ;                                        * B58E5

* ROMPTR 0B5 050
* refs (1): B4B39
ROMP_0B5_050:
        {                                        * B58EA
          ROMPTR  0B5 051                        * B58EF
          ROMPTR  0B5 052                        * B58FA
          ROMPTR  0B5 055                        * B5905
          ROMPTR  0B5 056                        * B5910
          ROMPTR  0B5 053                        * B591B
          ROMPTR  0B5 054                        * B5926
          ROMPTR  0B5 057                        * B5931
          ROMPTR  0B5 058                        * B593C
          ROMPTR  0B5 059                        * B5947
          ROMPTR  0B5 05A                        * B5952
          ROMPTR  0B5 05B                        * B595D
          ROMPTR  0B5 05C                        * B5968
          ROMPTR  0B5 05D                        * B5973
          ROMPTR  0B5 05E                        * B597E
          ROMPTR  0B5 05F                        * B5989
        }                                        * B5994

* ROMPTR 0B5 051
* refs (1): B4B39
ROMP_0B5_051:
        {                                        * B5999
          #       BE69                           * B599E  48745
          ::                                     * B59A8
            'IDFUNCTION                          * B59AD
            PUTPTYPE                             * B59B2
          ;                                      * B59B7
        }                                        * B59BC

* ROMPTR 0B5 052
* refs (1): B4B39
ROMP_0B5_052:
        {                                        * B59C1
          #       BE6A                           * B59C6  48746
          ::                                     * B59D0
            'IDPOLAR                             * B59D5
            PUTPTYPE                             * B59DA
          ;                                      * B59DF
        }                                        * B59E4

* ROMPTR 0B5 053
* refs (1): B4B39
ROMP_0B5_053:
        {                                        * B59E9
          #       BE6B                           * B59EE  48747
          ::                                     * B59F8
            'IDCONIC                             * B59FD
            PUTPTYPE                             * B5A02
          ;                                      * B5A07
        }                                        * B5A0C

* ROMPTR 0B5 054
* refs (1): B4B39
ROMP_0B5_054:
        {                                        * B5A11
          #       BE6C                           * B5A16  48748
          ::                                     * B5A20
            'IDTRUTH                             * B5A25
            PUTPTYPE                             * B5A2A
          ;                                      * B5A2F
        }                                        * B5A34

* ROMPTR 0B5 055
* refs (1): B4B39
ROMP_0B5_055:
        {                                        * B5A39
          #       BE6D                           * B5A3E  48749
          ::                                     * B5A48
            'IDPARAMETER                         * B5A4D
            PUTPTYPE                             * B5A52
          ;                                      * B5A57
        }                                        * B5A5C

* ROMPTR 0B5 056
* refs (1): B4B39
ROMP_0B5_056:
        {                                        * B5A61
          #       BE6E                           * B5A66  48750
          ::                                     * B5A70
            '                                    * B5A75
            ROMPTR  0AB 00E                      * B5A7A  DIFFEQ
            PUTPTYPE                             * B5A85
          ;                                      * B5A8A
        }                                        * B5A8F

* ROMPTR 0B5 057
* refs (1): B4B39
ROMP_0B5_057:
        {                                        * B5A94
          #       BE6F                           * B5A99  48751
          ::                                     * B5AA3
            'IDHISTOGRAM                         * B5AA8
            PUTPTYPE                             * B5AAD
          ;                                      * B5AB2
        }                                        * B5AB7

* ROMPTR 0B5 058
* refs (1): B4B39
ROMP_0B5_058:
        {                                        * B5ABC
          #       BE70                           * B5AC1  48752
          ::                                     * B5ACB
            'IDBAR                               * B5AD0
            PUTPTYPE                             * B5AD5
          ;                                      * B5ADA
        }                                        * B5ADF

* ROMPTR 0B5 059
* refs (1): B4B39
ROMP_0B5_059:
        {                                        * B5AE4
          #       BE71                           * B5AE9  48753
          ::                                     * B5AF3
            'IDSCATTER                           * B5AF8
            PUTPTYPE                             * B5AFD
          ;                                      * B5B02
        }                                        * B5B07

* ROMPTR 0B5 05A
* refs (1): B4B39
ROMP_0B5_05A:
        {                                        * B5B0C
          #       BE72                           * B5B11  48754
          ::                                     * B5B1B
            '                                    * B5B20
            ROMPTR  0AB 00C                      * B5B25  SLOPEFIELD
            PUTPTYPE                             * B5B30
          ;                                      * B5B35
        }                                        * B5B3A

* ROMPTR 0B5 05B
* refs (1): B4B39
ROMP_0B5_05B:
        {                                        * B5B3F
          #       BE73                           * B5B44  48755
          ::                                     * B5B4E
            '                                    * B5B53
            ROMPTR  0AB 008                      * B5B58  WIREFRAME
            PUTPTYPE                             * B5B63
          ;                                      * B5B68
        }                                        * B5B6D

* ROMPTR 0B5 05C
* refs (1): B4B39
ROMP_0B5_05C:
        {                                        * B5B72
          #       BE74                           * B5B77  48756
          ::                                     * B5B81
            '                                    * B5B86
            ROMPTR  0AB 00D                      * B5B8B  PCONTOUR
            PUTPTYPE                             * B5B96
          ;                                      * B5B9B
        }                                        * B5BA0

* ROMPTR 0B5 05D
* refs (1): B4B39
ROMP_0B5_05D:
        {                                        * B5BA5
          #       BE75                           * B5BAA  48757
          ::                                     * B5BB4
            '                                    * B5BB9
            ROMPTR  0AB 00B                      * B5BBE  YSLICE
            PUTPTYPE                             * B5BC9
          ;                                      * B5BCE
        }                                        * B5BD3

* ROMPTR 0B5 05E
* refs (1): B4B39
ROMP_0B5_05E:
        {                                        * B5BD8
          #       BE76                           * B5BDD  48758
          ::                                     * B5BE7
            '                                    * B5BEC
            ROMPTR  0AB 00A                      * B5BF1  GRIDMAP
            PUTPTYPE                             * B5BFC
          ;                                      * B5C01
        }                                        * B5C06

* ROMPTR 0B5 05F
* refs (1): B4B39
ROMP_0B5_05F:
        {                                        * B5C0B
          #       BE77                           * B5C10  48759
          ::                                     * B5C1A
            '                                    * B5C1F
            ROMPTR  0AB 009                      * B5C24  PARSURFACE
            PUTPTYPE                             * B5C2F
          ;                                      * B5C34
        }                                        * B5C39

* ROMPTR 0B5 060
* refs (1): B4B39
ROMP_0B5_060:
        ::                                       * B5C3E
          BINT31                                 * B5C43
          TestSysFlag                            * B5C48
          NOT                                    * B5C4D
        ;                                        * B5C52

* ROMPTR 0B5 061
* refs (1): B4B39
ROMP_0B5_061:
        ::                                       * B5C57
          BINT31                                 * B5C5C
          SWAP                                   * B5C61
          ITE                                    * B5C66
          ClrSysFlag                             * B5C6B
          SetSysFlag                             * B5C70
        ;                                        * B5C75

* ROMPTR 0B5 062
* refs (1): B4B39
ROMP_0B5_062:
        ::                                       * B5C7A
          BINT28                                 * B5C7F
          TestSysFlag                            * B5C84
        ;                                        * B5C89

* ROMPTR 0B5 063
* refs (1): B4B39
ROMP_0B5_063:
        ::                                       * B5C8E
          BINT28                                 * B5C93
          SWAP                                   * B5C98
          ITE                                    * B5C9D
          SetSysFlag                             * B5CA2
          ClrSysFlag                             * B5CA7
        ;                                        * B5CAC

* ROMPTR 0B5 064
* refs (1): B4B39
ROMP_0B5_064:
        ::                                       * B5CB1
          dLISTcase                              * B5CB6
          ::                                     * B5CBB
            ICMPDRPRTDRP                         * B5CC0
            DROP                                 * B5CC5
          ;                                      * B5CCA
          DROP                                   * B5CCF
          %0_2A2B4                               * B5CD4
        ;                                        * B5CD9

* ROMPTR 0B5 065
* refs (1): B4B39
ROMP_0B5_065:
        ::                                       * B5CDE
          ROMPTR  0B5 011                        * B5CE3
          RclDepnd                               * B5CEE
          dLISTcase                              * B5CF3
          ::                                     * B5CF8
            INCOMPDROP                           * B5CFD
            SWAPDROP                             * B5D02
            ROTSWAP                              * B5D07
            THREE{}N                             * B5D0C
            depnd(gn)                            * B5D11
          ;                                      * B5D16
          SWAP                                   * B5D1B
          %       1E-4                           * B5D20
          THREE{}N                               * B5D35
          depnd(gn)                              * B5D3A
        ;                                        * B5D3F

* ROMPTR 0B5 066
* refs (1): B4B39
ROMP_0B5_066:
        ::                                       * B5D44
          7ROLL                                  * B5D49
          7ROLL                                  * B5D4E
          ROMPTR  0B5 008                        * B5D53
          OVER                                   * B5D5E
          XEQSTOID                               * B5D63
          5ROLL                                  * B5D68
          5ROLL                                  * B5D6D
          ROMPTR  0B5 008                        * B5D72
          OVER                                   * B5D7D
          XEQSTOID                               * B5D82
          6ROLL                                  * B5D87
          ROMPTR  0B5 008                        * B5D8C
          THREE{}N                               * B5D97
          3UNROLL                                * B5D9C
          DUPTYPEBINT?                           * B5DA1
          ITE                                    * B5DA6
          DROP                                   * B5DAB
          TWO{}N                                 * B5DB0
          ROT                                    * B5DB5
          ROMPTR  0B5 008                        * B5DBA
          ROMPTR  0C1 00E                        * B5DC5
          SWAP                                   * B5DD0
          BINT2                                  * B5DD5
          NTHCOMPDROP                            * B5DDA
          OBJ_36E43                              * B5DDF
        ;                                        * B5DE4

* ROMPTR 0B5 067
* refs (1): B4B39
ROMP_0B5_067:
        ::                                       * B5DE9
          7ROLL                                  * B5DEE
          7ROLL                                  * B5DF3
          ROMPTR  0B5 008                        * B5DF8
          OVER                                   * B5E03
          XEQSTOID                               * B5E08
          5ROLL                                  * B5E0D
          5ROLL                                  * B5E12
          ROMPTR  0B5 008                        * B5E17
          OVER                                   * B5E22
          XEQSTOID                               * B5E27
          8ROLL                                  * B5E2C
          ROMPTR  0B5 008                        * B5E31
          8ROLL                                  * B5E3C
          ROMPTR  0B5 008                        * B5E41
          8ROLL                                  * B5E4C
          ROMPTR  0B5 008                        * B5E51
          BINT5                                  * B5E5C
          {}N                                    * B5E61
          3UNROLL                                * B5E66
          DUPTYPEBINT?                           * B5E6B
          ITE                                    * B5E70
          DROP                                   * B5E75
          TWO{}N                                 * B5E7A
          ROT                                    * B5E7F
          ROMPTR  0B5 008                        * B5E84
          ROMPTR  0C1 01D                        * B5E8F
          SWAP                                   * B5E9A
          BINT2                                  * B5E9F
          NTHCOMPDROP                            * B5EA4
          OBJ_36E43                              * B5EA9
        ;                                        * B5EAE

* ROMPTR 0B5 068
* refs (1): B4B39
ROMP_0B5_068:
        ::                                       * B5EB3
          dLISTcase                              * B5EB8
          ::                                     * B5EBD
            ICMPDRPRTDRP                         * B5EC2
            SWAPDROP                             * B5EC7
          ;                                      * B5ECC
          DROP                                   * B5ED1
          %       1E-4                           * B5ED6
        ;                                        * B5EEB

* ROMPTR 0B5 069
* refs (1): B4B39
ROMP_0B5_069:
        ::                                       * B5EF0
          RclDepnd                               * B5EF5
          dLISTcase                              * B5EFA
          ::                                     * B5EFF
            INCOMPDROP                           * B5F04
            DROP                                 * B5F09
            ROT                                  * B5F0E
            THREE{}N                             * B5F13
            depnd(gn)                            * B5F18
          ;                                      * B5F1D
          %0_2A2B4                               * B5F22
          ROT                                    * B5F27
          THREE{}N                               * B5F2C
          depnd(gn)                              * B5F31
        ;                                        * B5F36

* ROMPTR 0B5 06A
* refs (1): B4B39
ROMP_0B5_06A:
        ::                                       * B5F3B
          DUPTYPELIST?                           * B5F40
          NOTcasedrop                            * B5F45
          ::                                     * B5F4A
            %10                                  * B5F4F
            %10                                  * B5F54
            TRUE                                 * B5F59
          ;                                      * B5F5E
          DUPLENCOMP                             * B5F63
          #3=                                    * B5F68
          casedrop                               * B5F6D
          ::                                     * B5F72
            %10                                  * B5F77
            %10                                  * B5F7C
            TRUE                                 * B5F81
          ;                                      * B5F86
          BINT2                                  * B5F8B
          NTHCOMPDROP                            * B5F90
          DUPTYPELIST?                           * B5F95
          ITE                                    * B5F9A
          INCOMPDROP                             * B5F9F
          DUP                                    * B5FA4
          DUPTYPEREAL?                           * B5FA9
          case                                   * B5FAE
          FALSE                                  * B5FB3
          #>%                                    * B5FB8
          SWAP                                   * B5FBD
          #>%                                    * B5FC2
          SWAPTRUE                               * B5FC7
        ;                                        * B5FCC

* ROMPTR 0B5 06B
* refs (1): B4B39
ROMP_0B5_06B:
        ::                                       * B5FD1
          IT                                     * B5FD6
          ::                                     * B5FDB
            %>#                                  * B5FE0
            SWAP                                 * B5FE5
            %>#                                  * B5FEA
            SWAP                                 * B5FEF
          ;                                      * B5FF4
          BINT2                                  * B5FF9
          {}N                                    * B5FFE
          RclAx*s                                * B6003
          DUPTYPELIST?                           * B6008
          IT                                     * B600D
          CARCOMP                                * B6012
          SWAP                                   * B6017
          BINT2                                  * B601C
          {}N                                    * B6021
          OBJ_4502E                              * B6026
        ;                                        * B602B

* ROMPTR 0B5 06C
* refs (1): B4B39
ROMP_0B5_06C:
        ::                                       * B6030
          RclAx*s                                * B6035
          DUPTYPELIST?                           * B603A
          NOTcasedrop                            * B603F
          ::                                     * B6044
            NULL$                                * B6049
            NULL$                                * B604E
          ;                                      * B6053
          INNERCOMP                              * B6058
          DUP                                    * B605D
          #2=                                    * B6062
          case2drop                              * B6067
          ::                                     * B606C
            DROP                                 * B6071
            NULL$                                * B6076
            NULL$                                * B607B
          ;                                      * B6080
          #3=                                    * B6085
          case                                   * B608A
          ROTDROP                                * B608F
          2SWAP                                  * B6094
          2DROP                                  * B6099
        ;                                        * B609E

* ROMPTR 0B5 06D
* refs (1): B4B39
ROMP_0B5_06D:
        ::                                       * B60A3
          BINT2                                  * B60A8
          {}N                                    * B60AD
          OBJ_4502E                              * B60B2
        ;                                        * B60B7

* ROMPTR 0B5 06E
* refs (1): B4B39
ROMP_0B5_06E:
        ::                                       * B60BC
          BINT5                                  * B60C1
          PPAR(s);dup;li?                        * B60C6
          IT                                     * B60CB
          CARCOMP                                * B60D0
        ;                                        * B60D5

* ROMPTR 0B5 06F
* refs (1): B4B39
ROMP_0B5_06F:
        ::                                       * B60DA
          BINT5                                  * B60DF
          PPAR(s);dup;li?                        * B60E4
          ITE                                    * B60E9
          ::                                     * B60EE
            CDRCOMP                              * B60F3
            SWAP                                 * B60F8
            >HCOMP                               * B60FD
          ;                                      * B6102
          DROP                                   * B6107
          BINT3                                  * B610C
          PutBackPPAR(_,s)                       * B6111
        ;                                        * B6116

* ROMPTR 0B5 070
* refs (1): B4B39
ROMP_0B5_070:
        ::                                       * B611B
          BINT29                                 * B6120
          TestSysFlag                            * B6125
          NOT                                    * B612A
        ;                                        * B612F

* ROMPTR 0B5 071
* refs (1): B4B39
ROMP_0B5_071:
        ::                                       * B6134
          BINT29                                 * B6139
          SWAP                                   * B613E
          ITE                                    * B6143
          ClrSysFlag                             * B6148
          SetSysFlag                             * B614D
        ;                                        * B6152

* ROMPTR 0B5 072
* refs (1): B4B39
ROMP_0B5_072:
        ::                                       * B6157
          OBJ_4681A                              * B615C
          NOTcase                                * B6161
          OBJ_0FDD1                              * B6166
          ROMPTR  0B5 073                        * B616B
          NOTcasedrop                            * B6176
          OBJ_0FDD1                              * B617B
          SWAP                                   * B6180
          ROMPTR  0B5 073                        * B6185
          NOTcasedrop                            * B6190
          OBJ_0FDD1                              * B6195
          SWAP                                   * B619A
          2DUP                                   * B619F
          %MIN                                   * B61A4
          %0<                                    * B61A9
          case2drop                              * B61AE
          OBJ_0FDD1                              * B61B3
          2DUP                                   * B61B8
          %MAX                                   * B61BD
          RclDepnd                               * B61C2
          ROMPTR  0B5 064                        * B61C7
          DUPTYPEREAL?                           * B61D2
          ITE                                    * B61D7
          ::                                     * B61DC
            DROP                                 * B61E1
            BINT1                                * B61E6
          ;                                      * B61EB
          ARSIZE                                 * B61F0
          UNCOERCE                               * B61F5
          %>                                     * B61FA
          case2drop                              * B61FF
          OBJ_0FDD1                              * B6204
        ;                                        * B6209

* ROMPTR 0B5 073
* refs (1): B4B39
ROMP_0B5_073:
        ::                                       * B620E
          palparse                               * B6213
          NOTcasedrop                            * B6218
          2DROPFALSE                             * B621D
          DUPTYPEREAL?                           * B6222
          NOTcasedrop                            * B6227
          FALSE                                  * B622C
          TRUE                                   * B6231
        ;                                        * B6236

* ROMPTR 0B5 074
* refs (1): B4B39
ROMP_0B5_074:
        ::                                       * B623B
          DUP                                    * B6240
          MINUSONE                               * B6245
          EQUAL                                  * B624A
          3PICK                                  * B624F
          MINUSONE                               * B6254
          EQUAL                                  * B6259
          OR                                     * B625E
          case                                   * B6263
          2DROP                                  * B6268
          a%>$                                   * B626D
          SWAP                                   * B6272
          a%>$                                   * B6277
          SWAP                                   * B627C
          TWO{}N                                 * B6281
          OBJ_4502E                              * B6286
        ;                                        * B628B

* ROMPTR 0B5 075
* refs (1): B4B39
ROMP_0B5_075:
        ::                                       * B6290
          OBJ_496A0                              * B6295
          NOTcase                                * B629A
          ::                                     * B629F
            %4                                   * B62A4
            %4                                   * B62A9
            FALSE                                * B62AE
          ;                                      * B62B3
          DROP                                   * B62B8
          DUPTYPEREAL?                           * B62BD
          3PICK                                  * B62C2
          TYPEREAL?                              * B62C7
          AND                                    * B62CC
          4PICK                                  * B62D1
          TYPEREAL?                              * B62D6
          AND                                    * B62DB
          NOTcase                                * B62E0
          ::                                     * B62E5
            3DROP                                * B62EA
            %4                                   * B62EF
            %4                                   * B62F4
            FALSE                                * B62F9
          ;                                      * B62FE
          %0=                                    * B6303
          NOT                                    * B6308
        ;                                        * B630D

* ROMPTR 0B5 076
* refs (1): B4B39
ROMP_0B5_076:
        ::                                       * B6312
          ITE                                    * B6317
          %1                                     * B631C
          %0_2A2B4                               * B6321
          OBJ_496A0                              * B6326
          ITE                                    * B632B
          4UNROLL3DROP                           * B6330
          NULL{}                                 * B6335
          OBJ_49A74                              * B633A
        ;                                        * B633F

* ROMPTR 0B5 077
* refs (1): B4B39
ROMP_0B5_077:
        ::                                       * B6344
          OBJ_45EC4                              * B6349
        ;                                        * B634E

* ROMPTR 0B5 078
* refs (1): B4B39
ROMP_0B5_078:
        ::                                       * B6353
          DOERASE                                * B6358
        ;                                        * B635D

* ROMPTR 0B5 079
* refs (1): B4B39
ROMP_0B5_079:
        ::                                       * B6362
          SWAP                                   * B6367
          {                                      * B636C
            LAM     'SaveAnim                    * B6371
          }                                      * B638A
          BIND                                   * B638F
          IT                                     * B6394
          AUTOSCALE                              * B6399
          OBJ_4C2CE                              * B639E
          ABND                                   * B63A3
        ;                                        * B63A8

* ROMPTR 0B5 07A
* refs (1): B4B39
ROMP_0B5_07A:
        ::                                       * B63AD
          'EQ                                    * B63B2
          SAFE@_HERE                             * B63B7
          NOTcase                                * B63BC
          ERRJMP                                 * B63C1
          DUPTYPELIST?                           * B63C6
          DUPUNROT                               * B63CB
          ITE                                    * B63D0
          ::                                     * B63D5
            INNERCOMP                            * B63DA
            DUP                                  * B63DF
            #3=                                  * B63E4
            NOTcase                              * B63E9
            doerr607                             * B63EE
          ;                                      * B63F3
          BINT1                                  * B63F8
          INDEPVAR                               * B63FD
          GETINDEP                               * B6402
          ROMPTR  0B5 032                        * B6407
          3UNROLL                                * B6412
          OVER                                   * B6417
          XEQSTOID                               * B641C
          OBJ_4D96B                              * B6421
          RclDepnd                               * B6426
          ROMPTR  0B5 064                        * B642B
          OVER                                   * B6436
          XEQSTOID                               * B643B
          4ROLL                                  * B6440
          #1=                                    * B6445
          ITE                                    * B644A
          ::                                     * B644F
            4ROLL                                * B6454
            THREE{}N                             * B6459
          ;                                      * B645E
          ::                                     * B6463
            6ROLL                                * B6468
            6ROLL                                * B646D
            6ROLL                                * B6472
            BINT5                                * B6477
            {}N                                  * B647C
          ;                                      * B6481
          ROMPTR  0B5 072                        * B6486
          DUP                                    * B6491
          MINUSONE                               * B6496
          EQUAL                                  * B649B
          IT                                     * B64A0
          ::                                     * B64A5
            2DROP                                * B64AA
            %0_2A2B4                             * B64AF
            %1                                   * B64B4
          ;                                      * B64B9
          %>C%                                   * B64BE
          RclDepnd                               * B64C3
          ROMPTR  0B5 068                        * B64C8
          GETRES                                 * B64D3
          DUP                                    * B64D8
          TYPEHSTR?                              * B64DD
          IT                                     * B64E2
          ::                                     * B64E7
            HXS>#                                * B64EC
            UNCOERCE                             * B64F1
          ;                                      * B64F6
          5ROLL                                  * B64FB
          6ROLL                                  * B6500
          case                                   * B6505
          ROMPTR  0C1 003                        * B650A
          COLA                                   * B6515
          ROMPTR  0C1 000                        * B651A
        ;                                        * B6525

* ROMPTR 0B5 07B
* refs (1): B4B39
ROMP_0B5_07B:
        ::                                       * B652A
          '                                      * B652F
          ::                                     * B6534
            OBJ_72AFA                            * B6539
            SWAP                                 * B653E
            OBJ_72AFA                            * B6543
            EQUAL                                * B6548
          ;                                      * B654D
          SWAP                                   * B6552
          Lookup                                 * B6557
        ;                                        * B655C

* ROMPTR 0B5 07C
* refs (1): B4B39
ROMP_0B5_07C:
        ::                                       * B6561
          BINT2                                  * B6566
          BINT1                                  * B656B
          ROMPTR  0B5 08F                        * B6570
        ;                                        * B657B

* ROMPTR 0B5 07D
* refs (1): B4B39
ROMP_0B5_07D:
        ::                                       * B6580
          BINT2                                  * B6585
          BINT1                                  * B658A
          ROMPTR  0B5 090                        * B658F
        ;                                        * B659A

* ROMPTR 0B5 07E
* refs (1): B4B39
ROMP_0B5_07E:
        ::                                       * B659F
          BINT1                                  * B65A4
          BINT1                                  * B65A9
          ROMPTR  0B5 08F                        * B65AE
        ;                                        * B65B9

* ROMPTR 0B5 07F
* refs (1): B4B39
ROMP_0B5_07F:
        ::                                       * B65BE
          BINT1                                  * B65C3
          BINT1                                  * B65C8
          ROMPTR  0B5 090                        * B65CD
        ;                                        * B65D8

* ROMPTR 0B5 080
* refs (1): B4B39
ROMP_0B5_080:
        ::                                       * B65DD
          BINT15                                 * B65E2
          BINT14                                 * B65E7
          BINT2                                  * B65EC
          ROMPTR  0B5 08F                        * B65F1
        ;                                        * B65FC

* ROMPTR 0B5 081
* refs (1): B4B39
ROMP_0B5_081:
        ::                                       * B6601
          BINT15                                 * B6606
          SWAP                                   * B660B
          BINT14                                 * B6610
          BINT2                                  * B6615
          ROMPTR  0B5 090                        * B661A
        ;                                        * B6625

* ROMPTR 0B5 082
* refs (1): B4B39
ROMP_0B5_082:
        ::                                       * B662A
          BINT13                                 * B662F
          BINT12                                 * B6634
          BINT2                                  * B6639
          ROMPTR  0B5 08F                        * B663E
        ;                                        * B6649

* ROMPTR 0B5 083
* refs (1): B4B39
ROMP_0B5_083:
        ::                                       * B664E
          BINT13                                 * B6653
          SWAP                                   * B6658
          BINT12                                 * B665D
          BINT2                                  * B6662
          ROMPTR  0B5 090                        * B6667
        ;                                        * B6672

* ROMPTR 0B5 084
* refs (1): B4B39
ROMP_0B5_084:
        ::                                       * B6677
          BINT11                                 * B667C
          BINT10                                 * B6681
          BINT2                                  * B6686
          ROMPTR  0B5 08F                        * B668B
        ;                                        * B6696

* ROMPTR 0B5 085
* refs (1): B4B39
ROMP_0B5_085:
        ::                                       * B669B
          BINT11                                 * B66A0
          SWAP                                   * B66A5
          BINT10                                 * B66AA
          BINT2                                  * B66AF
          ROMPTR  0B5 090                        * B66B4
        ;                                        * B66BF

* ROMPTR 0B5 086
* refs (1): B4B39
ROMP_0B5_086:
        ::                                       * B66C4
          BINT5                                  * B66C9
          BINT4                                  * B66CE
          BINT3                                  * B66D3
          BINT3                                  * B66D8
          ROMPTR  0B5 08F                        * B66DD
        ;                                        * B66E8

* ROMPTR 0B5 087
* refs (1): B4B39
ROMP_0B5_087:
        ::                                       * B66ED
          BINT5                                  * B66F2
          3UNROLL                                * B66F7
          BINT4                                  * B66FC
          SWAP                                   * B6701
          BINT3                                  * B6706
          BINT3                                  * B670B
          ROMPTR  0B5 090                        * B6710
        ;                                        * B671B

* ROMPTR 0B5 088
* refs (1): B4B39
ROMP_0B5_088:
        ::                                       * B6720
          BINT9                                  * B6725
          BINT8                                  * B672A
          BINT2                                  * B672F
          ROMPTR  0B5 08F                        * B6734
        ;                                        * B673F

* ROMPTR 0B5 089
* refs (1): B4B39
ROMP_0B5_089:
        ::                                       * B6744
          BINT9                                  * B6749
          SWAP                                   * B674E
          BINT8                                  * B6753
          BINT2                                  * B6758
          ROMPTR  0B5 090                        * B675D
        ;                                        * B6768

* ROMPTR 0B5 08A
* refs (1): B4B39
ROMP_0B5_08A:
        ::                                       * B676D
          BINT7                                  * B6772
          BINT6                                  * B6777
          BINT2                                  * B677C
          ROMPTR  0B5 08F                        * B6781
        ;                                        * B678C

* ROMPTR 0B5 08B
* refs (1): B4B39
ROMP_0B5_08B:
        ::                                       * B6791
          BINT7                                  * B6796
          SWAP                                   * B679B
          BINT6                                  * B67A0
          BINT2                                  * B67A5
          ROMPTR  0B5 090                        * B67AA
        ;                                        * B67B5

* ROMPTR 0B5 08C
* refs (1): B4B39
ROMP_0B5_08C:
        ::                                       * B67BA
          {}_23989                               * B67BF
          ERRSET                                 * B67C4
          ROMPTR  0F1 00A                        * B67C9
          ERRTRAP                                * B67D4
          ROMPTR  0B5 08D                        * B67D9
          BINT16                                 * B67E4
          ROLL                                   * B67E9
          DROP                                   * B67EE
        ;                                        * B67F3

* ROMPTR 0B5 08D
* refs (1): B4B39
ROMP_0B5_08D:
        ::                                       * B67F8
          BEGIN                                  * B67FD
          {}_23989                               * B6802
          EQ                                     * B6807
          UNTIL                                  * B680C
          {}_23989                               * B6811

* ROMPTR 0B5 08E
* refs (1): B4B39
ROMP_0B5_08E:
          {                                      * B6816
            %-1                                  * B681B
            %1                                   * B6820
            %-1                                  * B6825
            %1                                   * B682A
            %-1                                  * B682F
            %1                                   * B6834
            %-1                                  * B6839
            %1                                   * B683E
            %-1                                  * B6843
            %1                                   * B6848
            %0_2A2B4                             * B684D
            %-3                                  * B6852
            %0_2A2B4                             * B6857
            %10                                  * B685C
            %8                                   * B6861
          }                                      * B6866
          INCOMPDROP                             * B686B
        ;                                        * B6870

* ROMPTR 0B5 08F
* refs (1): B4B39
ROMP_0B5_08F:
        ::                                       * B6875
          ROMPTR  0B5 08C                        * B687A
          BINT16                                 * B6885
          PICK                                   * B688A
          ZERO_DO                                * B688F
          BINT17                                 * B6894
          ROLL                                   * B6899
          INDEX@                                 * B689E
          #-                                     * B68A3
          ROLL                                   * B68A8
          BINT15                                 * B68AD
          UNROLL                                 * B68B2
          LOOP                                   * B68B7
          BINT16                                 * B68BC
          ROLL                                   * B68C1
          BINT15                                 * B68C6
          SWAP                                   * B68CB
          #-                                     * B68D0
          NDROP                                  * B68D5
        ;                                        * B68DA

* ROMPTR 0B5 090
* refs (1): B4B39
ROMP_0B5_090:
        ::                                       * B68DF
          ROMPTR  0B5 08C                        * B68E4
          BINT16                                 * B68EF
          PICK                                   * B68F4
          ZERO_DO                                * B68F9
          BINT17                                 * B68FE
          PICK                                   * B6903
          ROLL                                   * B6908
          DROP                                   * B690D
          BINT17                                 * B6912
          ROLL                                   * B6917
          BINT17                                 * B691C
          ROLL                                   * B6921
          UNROLL                                 * B6926
          LOOP                                   * B692B
          BINT15                                 * B6930
          {}N                                    * B6935
          SWAPDROP                               * B693A

* ROMPTR 0B5 091
* refs (1): B4B39
ROMP_0B5_091:
          ::                                     * B693F
            '                                    * B6944
            ID      VPAR                         * B6949
            STOAPPLDATA                          * B6958
          ;                                      * B695D
        ;                                        * B6962

* ROMPTR 0B5 092
* refs (1): B4B39
ROMP_0B5_092:
        ::                                       * B6967
          '                                      * B696C
          ID      EXPR                           * B6971
          SAFE@_HERE                             * B6980
          ?SEMI                                  * B6985
          MINUSONE                               * B698A
        ;                                        * B698F

* ROMPTR 0B5 093
* refs (1): B4B39
ROMP_0B5_093:
        ::                                       * B6994
          DUP                                    * B6999
          MINUSONE                               * B699E
          EQUAL                                  * B69A3
          caseDROP                               * B69A8
          '                                      * B69AD
          ID      EXPR                           * B69B2
          XEQSTOID                               * B69C1
        ;                                        * B69C6

* ROMPTR 0B5 094
* refs (1): B4B39
ROMP_0B5_094:
        ::                                       * B69CB
          BINT3                                  * B69D0
          TestSysFlag                            * B69D5
          NOT                                    * B69DA
        ;                                        * B69DF

* ROMPTR 0B5 095
* refs (1): B4B39
ROMP_0B5_095:
        ::                                       * B69E4
          BINT1                                  * B69E9
          TestSysFlag                            * B69EE
        ;                                        * B69F3

* ROMPTR 0B5 096
* refs (1): B4B39
ROMP_0B5_096:
        ::                                       * B69F8
          BINT1                                  * B69FD
          SWAP                                   * B6A02
          ITE                                    * B6A07
          SetSysFlag                             * B6A0C
          ClrSysFlag                             * B6A11
        ;                                        * B6A16

* ROMPTR 0B5 097
* refs (1): B4B39
ROMP_0B5_097:
        ::                                       * B6A1B
          NOTNUM?                                * B6A20
          SWAP                                   * B6A25
          ITE                                    * B6A2A
          SETNUM                                 * B6A2F
          CLRNUM                                 * B6A34
          case                                   * B6A39
          ::                                     * B6A3E
            2SWAP                                * B6A43
            ERRSET                               * B6A48
            XEQINTEGID                           * B6A4D
            ERRTRAP                              * B6A52
            cf(-3);error                         * B6A57
            CLRNUM                               * B6A5C
          ;                                      * B6A61
          2SWAP                                  * B6A66
          ERRSET                                 * B6A6B
          XEQINTEGID                             * B6A70
          ERRTRAP                                * B6A75
          sf(-3);error                           * B6A7A
          SETNUM                                 * B6A7F
        ;                                        * B6A84

* ROMPTR 0B5 098
* refs (1): B4B39
ROMP_0B5_098:
        ::                                       * B6A89
          2DUP                                   * B6A8E
          ITE                                    * B6A93
          ::                                     * B6A98
            MINUSONE                             * B6A9D
            EQUAL                                * B6AA2
            NOT?SEMI                             * B6AA7
            DROPFALSE                            * B6AAC
          ;                                      * B6AB1
          DROP                                   * B6AB6
          2SWAP                                  * B6ABB
          DUP                                    * B6AC0
          symcomp                                * B6AC5
          ROT                                    * B6ACA
          symcomp                                * B6ACF
          BINT2                                  * B6AD4
          Cr                                     * B6AD9
          xDER                                   * B6ADE
          2SWAP                                  * B6AE3
          case                                   * B6AE8
          ::                                     * B6AED
            ROTSWAP                              * B6AF2
            TWO{}N                               * B6AF7
            WHERE                                * B6AFC
            CRUNCH                               * B6B01
          ;                                      * B6B06
          DROP                                   * B6B0B
          SWAPDUP                                * B6B10
          symcomp                                * B6B15
          TWO{}N                                 * B6B1A
          uncrunch                               * B6B1F
          WHERE                                  * B6B24
        ;                                        * B6B29

* ROMPTR 0B5 099
* refs (1): B4B39
ROMP_0B5_099:
        ::                                       * B6B2E
          2DROP                                  * B6B33
          ROMPTR  0B5 008                        * B6B38
          SWAP                                   * B6B43
          ROMPTR  0B5 008                        * B6B48
          SWAP                                   * B6B53
          symcomp                                * B6B58
          SWAP                                   * B6B5D
          symcomp                                * B6B62
          BINT2                                  * B6B67
          Cr                                     * B6B6C
          xDER                                   * B6B71
          uncrunch                               * B6B76
          COMPEVAL                               * B6B7B
        ;                                        * B6B80

* ROMPTR 0B5 09A
* refs (1): B4B39
ROMP_0B5_09A:
        ::                                       * B6B85
          NOTcase                                * B6B8A
          SYMTAYLR                               * B6B8F
          SYMTAYLR                               * B6B94
          CRUNCH                                 * B6B99
        ;                                        * B6B9E

* ROMPTR 0B5 09B
* refs (1): B4B39
ROMP_0B5_09B:
        ::                                       * B6BA3
          NOTcase                                * B6BA8
          SYMISOL                                * B6BAD
          SYMISOL                                * B6BB2
          OBJ_49B7D                              * B6BB7
          CRUNCH                                 * B6BBC
        ;                                        * B6BC1

* ROMPTR 0B5 09C
* refs (1): B4B39
ROMP_0B5_09C:
        ::                                       * B6BC6
          NOTcase                                * B6BCB
          SYMQUAD                                * B6BD0
          SYMQUAD                                * B6BD5
          OBJ_49B7D                              * B6BDA
          CRUNCH                                 * B6BDF
        ;                                        * B6BE4

* ROMPTR 0B5 09D
* refs (1): B4B39
ROMP_0B5_09D:
        ::                                       * B6BE9
          ROMPTR  0B5 008                        * B6BEE
          SYMCOLCT                               * B6BF9
        ;                                        * B6BFE

* ROMPTR 0B5 09E
* refs (1): B4B39
ROMP_0B5_09E:
        ::                                       * B6C03
          ROMPTR  0B5 008                        * B6C08
          SYMEXPAN                               * B6C13
        ;                                        * B6C18

* ROMPTR 0B5 09F
* refs (1): B4B39
ROMP_0B5_09F:
        ::                                       * B6C1D
          SWAP                                   * B6C22
          4UNROLL                                * B6C27
          ROT                                    * B6C2C
          ROMPTR  0B5 008                        * B6C31
          ROT                                    * B6C3C
          ROMPTR  0B5 008                        * B6C41
          ROT                                    * B6C4C
          DUP                                    * B6C51
          MINUSONE                               * B6C56
          EQUAL                                  * B6C5B
          ITE                                    * B6C60
          ::                                     * B6C65
            DROP                                 * B6C6A
            BINT2                                * B6C6F
          ;                                      * B6C74
          BINT3                                  * B6C79
          {}N                                    * B6C7E
          ROT                                    * B6C83
          ROMPTR  0B5 008                        * B6C88
          SWAPROT                                * B6C93
          ITE                                    * B6C98
          xMATCHUP                               * B6C9D
          xMATCHDN                               * B6CA2
          DROP                                   * B6CA7
        ;                                        * B6CAC

* ROMPTR 0B5 0A0
* refs (1): B4B39
ROMP_0B5_0A0:
        {                                        * B6CB1
          ROMPTR  0B5 0A1                        * B6CB6
          ROMPTR  0B5 0A2                        * B6CC1
        }                                        * B6CCC

* ROMPTR 0B5 0A1
* refs (1): B4B39
ROMP_0B5_0A1:
        {                                        * B6CD1
          #       BD26                           * B6CD6  48422
          FALSE                                  * B6CE0
        }                                        * B6CE5

* ROMPTR 0B5 0A2
* refs (1): B4B39
ROMP_0B5_0A2:
        {                                        * B6CEA
          #       BD27                           * B6CEF  48423
          TRUE                                   * B6CF9
        }                                        * B6CFE

* ROMPTR 0B5 0A3
* refs (1): B4B39
ROMP_0B5_0A3:
        ::                                       * B6D03
          TOD                                    * B6D08

* ROMPTR 0B5 0A4
* refs (1): B4B39
ROMP_0B5_0A4:
          ::                                     * B6D0D
            DUP                                  * B6D12
            %IP                                  * B6D17
            SWAP                                 * B6D1C
            %FP                                  * B6D21
            %100                                 * B6D26
            %*                                   * B6D2B
            DUP                                  * B6D30
            %IP                                  * B6D35
            SWAP                                 * B6D3A
            %FP                                  * B6D3F
            %100                                 * B6D44
            %*                                   * B6D49
            %IP                                  * B6D4E
            ROMPTR  0B5 0B5                      * B6D53
            ::                                   * B6D5E
              BINT41                             * B6D63
              TestSysFlag                        * B6D68
              case                               * B6D6D
              BINT3                              * B6D72
              4PICK                              * B6D77
              %12                                * B6D7C
              %>                                 * B6D81
              ITE                                * B6D86
              ::                                 * B6D8B
                4ROLL                            * B6D90
                %12                              * B6D95
                %-                               * B6D9A
                4UNROLL                          * B6D9F
                BINT2                            * B6DA4
              ;                                  * B6DA9
              ::                                 * B6DAE
                4PICK                            * B6DB3
                %12                              * B6DB8
                %=                               * B6DBD
                case                             * B6DC2
                BINT2                            * B6DC7
                4ROLL                            * B6DCC
                DUP%0=                           * B6DD1
                IT                               * B6DD6
                ::                               * B6DDB
                  DROP                           * B6DE0
                  %12                            * B6DE5
                ;                                * B6DEA
                4UNROLL                          * B6DEF
                BINT1                            * B6DF4
              ;                                  * B6DF9
            ;                                    * B6DFE
            NTHCOMPDROP                          * B6E03
          ;                                      * B6E08
        ;                                        * B6E0D

* ROMPTR 0B5 0A5
* refs (1): B4B39
ROMP_0B5_0A5:
        ::                                       * B6E12
          ROMPTR  0B0 09D                        * B6E17
          5UNROLL                                * B6E22
          5UNROLL                                * B6E27
          %IP                                    * B6E2C
          %       1E4                            * B6E31
          %/                                     * B6E46
          SWAP                                   * B6E4B
          %IP                                    * B6E50
          %100                                   * B6E55
          %/                                     * B6E5A
          %+                                     * B6E5F
          SWAP                                   * B6E64
          %IP                                    * B6E69
          ::                                     * B6E6E
            4ROLL                                * B6E73
            case                                 * B6E78
            ROTDROP                              * B6E7D
            3PICK                                * B6E82
            ?SKIP                                * B6E87
            ::                                   * B6E8C
              DUP                                * B6E91
              %12                                * B6E96
              %=                                 * B6E9B
              casedrop                           * B6EA0
              %0_2A2B4                           * B6EA5
            ;                                    * B6EAA
            ROT                                  * B6EAF
            OVER                                 * B6EB4
            %12                                  * B6EB9
            %<                                   * B6EBE
            AND                                  * B6EC3
            IT                                   * B6EC8
            ::                                   * B6ECD
              %12                                * B6ED2
              %+                                 * B6ED7
            ;                                    * B6EDC
          ;                                      * B6EE1
          %+                                     * B6EE6
          >TIME                                  * B6EEB
        ;                                        * B6EF0

* ROMPTR 0B5 0A6
* refs (1): B4B39
ROMP_0B5_0A6:
        ::                                       * B6EF5
          DATE                                   * B6EFA

* ROMPTR 0B5 0A7
* refs (1): B4B39
ROMP_0B5_0A7:
          ::                                     * B6EFF
            DUP                                  * B6F04
            %IP                                  * B6F09
            SWAP                                 * B6F0E
            %FP                                  * B6F13
            %100                                 * B6F18
            %*                                   * B6F1D
            DUP                                  * B6F22
            %IP                                  * B6F27
            SWAP                                 * B6F2C
            %100                                 * B6F31
            %*                                   * B6F36
            %FP                                  * B6F3B
            %100                                 * B6F40
            %*                                   * B6F45
            BINT42                               * B6F4A
            TestSysFlag                          * B6F4F
            IT                                   * B6F54
            ROTSWAP                              * B6F59
          ;                                      * B6F5E
        ;                                        * B6F63

* ROMPTR 0B5 0A8
* refs (1): B4B39
ROMP_0B5_0A8:
        ::                                       * B6F68
          BINT42                                 * B6F6D
          TestSysFlag                            * B6F72
          IT                                     * B6F77
          ROTSWAP                                * B6F7C
          %IP                                    * B6F81
          %100                                   * B6F86
          %/                                     * B6F8B
          %FP                                    * B6F90
          %100                                   * B6F95
          %*                                     * B6F9A
          COERCE                                 * B6F9F
          ROMPTR  0B5 0AA                        * B6FA4
          SWAP                                   * B6FAF
          %IP                                    * B6FB4
          %100                                   * B6FB9
          %/                                     * B6FBE
          %FP                                    * B6FC3
          %+                                     * B6FC8
          %+                                     * B6FCD
          >DATE                                  * B6FD2
        ;                                        * B6FD7

* ROMPTR 0B5 0A9
* refs (1): B4B39
ROMP_0B5_0A9:
        ::                                       * B6FDC
          OVER                                   * B6FE1
          CON(5)  DOARRY                         * B6FE6  array 12
          LENGTH                                 * B6FEB  length, to #B703B
          CON(5)  DOBINT                         * B6FF0  element type
          CON(5)  1                              * B6FF5  dimensions
          CON(5)  12                             * B6FFA
          NIBHEX  F1000                          * B6FFF  #1F
          NIBHEX  C1000                          * B7004  #1C
          NIBHEX  F1000                          * B7009  #1F
          NIBHEX  E1000                          * B700E  #1E
          NIBHEX  F1000                          * B7013  #1F
          NIBHEX  E1000                          * B7018  #1E
          NIBHEX  F1000                          * B701D  #1F
          NIBHEX  F1000                          * B7022  #1F
          NIBHEX  E1000                          * B7027  #1E
          NIBHEX  F1000                          * B702C  #1F
          NIBHEX  E1000                          * B7031  #1E
          NIBHEX  F1000                          * B7036  #1F
        ENDLENGTH                                * B703B
          GETATELN                               * B703B
          DROP                                   * B7040
          SWAPROT                                * B7045
          #2<>                                   * B704A
          caseDROP                               * B704F
          BINT42                                 * B7054
          SysITE                                 * B7059
          %       2.902E1                        * B705E
          %       2.29E0                         * B7073
          SWAP                                   * B7088

* ROMPTR 0B5 0AA
* refs (1): B4B39
ROMP_0B5_0AA:
          ::                                     * B708D
            DUP                                  * B7092
            #       5A                           * B7097  90
            #>                                   * B70A1
            ITE                                  * B70A6
            #       76C                          * B70AB  1900
            #       7D0                          * B70B5  2000
            #+                                   * B70BF
            UNCOERCE                             * B70C4
            %       1E6                          * B70C9
            %/                                   * B70DE
          ;                                      * B70E3
          %+                                     * B70E8
          CODE                                   * B70ED  51 nibbles
            GOSBVL  POP1%                        * B70F7
            GOSBVL  SUB_0D8B7                    * B70FE
            GOSBVL  SUB_0D36C                    * B7105
            SETHEX                               * B710C
            ST=0    1                            * B710E
            GONC    L_B7117                      * B7111
            ST=1    1                            * B7114
L_B7117:
            GOSBVL  GETPTR                       * B7117
            ?ST=1   1                            * B711E
            GOYES   L_B7123                      * B7121
L_B7123:
            GOVLNG  PushT/FLoop                  * B7123
          ENDCODE                                * B712A
          ?SEMI                                  * B712A
          #1+                                    * B712F
        ;                                        * B7134

* ROMPTR 0B5 0AB
* refs (1): B4B39
ROMP_0B5_0AB:
        ::                                       * B7139
          ROMPTR  0B5 0AA                        * B713E
          BINT42                                 * B7149
          TestSysFlag                            * B714E
          IT                                     * B7153
          ROTSWAP                                * B7158
          SWAP                                   * B715D
          UNCOERCE                               * B7162
          %100                                   * B7167
          %/                                     * B716C
          %+                                     * B7171
          SWAP                                   * B7176
          UNCOERCE                               * B717B
          %+                                     * B7180
          Date>hxs13                             * B7185
          CODE                                   * B718A  53 nibbles
            A=DAT1  A                            * B7194
            AD1EX                                * B7197
            D1=D1+  10                           * B719A
            C=0     W                            * B719D
            C=DAT1  13                           * B71A0
            R0=C                                 * B71A4
            D1=A                                 * B71A7
            D1=D1+  5                            * B71AA
            D=D+1   A                            * B71AD
            GOSBVL  SAVPTR                       * B71AF
            C=R0                                 * B71B6
            GOSBVL  dowutil                      * B71B9
            SETHEX                               * B71C0
            GOVLNG  PUSH#ALOOP                   * B71C2
          ENDCODE                                * B71C9
        ;                                        * B71C9

* ROMPTR 0B5 0AC
* refs (1): B4B39
ROMP_0B5_0AC:
        ::                                       * B71CE
          ROMPTR  0B0 09A                        * B71D3
          6ROLL                                  * B71DE
          ROMPTR  0B0 09D                        * B71E3
          SWAP                                   * B71EE
          BINT11                                 * B71F3
          UNROLL                                 * B71F8
          4ROLL                                  * B71FD
          %IP                                    * B7202
          %100                                   * B7207
          %/                                     * B720C
          %FP                                    * B7211
          %100                                   * B7216
          %*                                     * B721B
          COERCE                                 * B7220
          ROMPTR  0B5 0AA                        * B7225
          5ROLL                                  * B7230
          6ROLL                                  * B7235
          BINT42                                 * B723A
          TestSysFlag                            * B723F
          ?SKIP                                  * B7244
          SWAP                                   * B7249
          %IP                                    * B724E
          %100                                   * B7253
          %/                                     * B7258
          %FP                                    * B725D
          ROT                                    * B7262
          %+                                     * B7267
          SWAP                                   * B726C
          %IP                                    * B7271
          %100                                   * B7276
          %/                                     * B727B
          %FP                                    * B7280
          %100                                   * B7285
          %*                                     * B728A
          %+                                     * B728F
          8UNROLL                                * B7294
          4ROLL                                  * B7299
          %IP                                    * B729E
          %100                                   * B72A3
          %/                                     * B72A8
          %FP                                    * B72AD
          %100                                   * B72B2
          %/                                     * B72B7
          5ROLL                                  * B72BC
          %IP                                    * B72C1
          %100                                   * B72C6
          %/                                     * B72CB
          %FP                                    * B72D0
          %+                                     * B72D5
          5ROLL                                  * B72DA
          %IP                                    * B72DF
          %100                                   * B72E4
          %/                                     * B72E9
          %FP                                    * B72EE
          %100                                   * B72F3
          %*                                     * B72F8
          ::                                     * B72FD
            ROT                                  * B7302
            8ROLL                                * B7307
            caseDROP                             * B730C
            ITE                                  * B7311
            ::                                   * B7316
              DUP                                * B731B
              %11                                * B7320
              %>                                 * B7325
              ?SEMI                              * B732A
              %12                                * B732F
              %+                                 * B7334
            ;                                    * B7339
            ::                                   * B733E
              DUP                                * B7343
              %12                                * B7348
              %<>                                * B734D
              ?SEMI                              * B7352
              DROP                               * B7357
              %0_2A2B4                           * B735C
            ;                                    * B7361
          ;                                      * B7366
          %+                                     * B736B
          4UNROLL                                * B7370
          %*                                     * B7375
          SWAPDUP                                * B737A
          MINUSONE                               * B737F
          EQUAL                                  * B7384
          IT                                     * B7389
          DROPNULL$                              * B738E
          SWAP                                   * B7393
          StoAlarms(2r,_,r)                      * B7398
          DROP                                   * B739D
        ;                                        * B73A2

* ROMPTR 0B5 0AD
* refs (1): B4B39
ROMP_0B5_0AD:
        ::                                       * B73A7
          ROMPTR  0B0 09D                        * B73AC
          DROP                                   * B73B7
          BINT41                                 * B73BC
          SWAP                                   * B73C1
          ITE                                    * B73C6
          SetSysFlag                             * B73CB
          ClrSysFlag                             * B73D0
        ;                                        * B73D5

* ROMPTR 0B5 0AE
* refs (1): B4B39
ROMP_0B5_0AE:
        ::                                       * B73DA
          BINT42                                 * B73DF
          SysITE                                 * B73E4
          ROMPTR  0B5 0D4                        * B73E9
          ROMPTR  0B5 0D3                        * B73F4
        ;                                        * B73FF

* ROMPTR 0B5 0AF
* refs (1): B4B39
ROMP_0B5_0AF:
        ::                                       * B7404
          ROMPTR  0B0 09A                        * B7409
          BINT42                                 * B7414
          SWAP                                   * B7419
          ITE                                    * B741E
          SetSysFlag                             * B7423
          ClrSysFlag                             * B7428
        ;                                        * B742D

* ROMPTR 0B5 0B0
* refs (1): B4B39
ROMP_0B5_0B0:
        ::                                       * B7432
          2DUP                                   * B7437
          ROMPTR  0B5 0A9                        * B743C
          3NULLLAM{}                             * B7447
          BIND                                   * B744C
          1GETLAM                                * B7451
          #1+_ONE_DO                             * B7456
          INDEX@                                 * B745B
          DUP                                    * B7460
          DUP                                    * B7465
          #>$                                    * B746A
          SWAP                                   * B746F
          BINT10                                 * B7474
          #<                                     * B7479
          IT                                     * B747E
          ::                                     * B7483
            CHR_Space                            * B7488
            >H$                                  * B748D
          ;                                      * B7492
          APPEND_SPACE                           * B7497
          {                                      * B749C
            #       BC15                         * B74A1  48149
            #       BC16                         * B74AB  48150
            #       BC17                         * B74B5  48151
            #       BC18                         * B74BF  48152
            #       BC19                         * B74C9  48153
            #       BC1A                         * B74D3  48154
            #       BC1B                         * B74DD  48155
          }                                      * B74E7
          3GETLAM                                * B74EC
          INDEX@                                 * B74F1
          2GETLAM                                * B74F6
          ROMPTR  0B5 0AB                        * B74FB
          NTHCOMPDROP                            * B7506
          JstGetTHEMESG                          * B750B
          &$                                     * B7510
          SWAP                                   * B7515
          UNCOERCE                               * B751A
          TWO{}N                                 * B751F
          LOOP                                   * B7524
          1GETABND                               * B7529
          {}N                                    * B752E
        ;                                        * B7533

* ROMPTR 0B5 0B1
* refs (1): B4B39
ROMP_0B5_0B1:
        ::                                       * B7538
          DUP                                    * B753D
          COERCE                                 * B7542
          BINT4                                  * B7547
          ZERO_DO                                * B754C
          #1+                                    * B7551
          BINT100                                * B7556
          #/                                     * B755B
          DROP                                   * B7560
          DUP                                    * B7565
          UNCOERCE                               * B756A
          SWAP                                   * B756F
          LOOP                                   * B7574
          DROP                                   * B7579
          BINT5                                  * B757E
          {}N                                    * B7583
        ;                                        * B7588

* ROMPTR 0B5 0B2
* refs (1): B4B39
ROMP_0B5_0B2:
        ::                                       * B758D
          BINT60                                 * B7592
          ZERO_DO                                * B7597
          INDEX@                                 * B759C
          UNCOERCE                               * B75A1
          LOOP                                   * B75A6
          BINT60                                 * B75AB
          {}N                                    * B75B0
        ;                                        * B75B5

* ROMPTR 0B5 0B3
* refs (1): B4B39
ROMP_0B5_0B3:
        {                                        * B75BA
          %1                                     * B75BF
          %2                                     * B75C4
          %3                                     * B75C9
          %4                                     * B75CE
          %5                                     * B75D3
          %6                                     * B75D8
          %7                                     * B75DD
          %8                                     * B75E2
          %9                                     * B75E7
          %10                                    * B75EC
        }                                        * B75F1

* ROMPTR 0B5 0B4
* refs (1): B4B39
ROMP_0B5_0B4:
        {                                        * B75F6
          %0_2A2B4                               * B75FB
          %1                                     * B7600
          %2                                     * B7605
          %3                                     * B760A
          %4                                     * B760F
          %5                                     * B7614
          %6                                     * B7619
          %7                                     * B761E
          %8                                     * B7623
          %9                                     * B7628
          %10                                    * B762D
          %11                                    * B7632
          %12                                    * B7637
          %13                                    * B763C
          %14                                    * B7641
          %15                                    * B7646
          %16                                    * B764B
          %17                                    * B7650
          %18                                    * B7655
          %19                                    * B765A
          %20                                    * B765F
          %21                                    * B7664
          %22                                    * B7669
          %23                                    * B766E
        }                                        * B7673

* ROMPTR 0B5 0B5
* refs (1): B4B39
ROMP_0B5_0B5:
        {                                        * B7678
          ROMPTR  0B5 0B6                        * B767D
          ROMPTR  0B5 0B7                        * B7688
          ROMPTR  0B5 0B8                        * B7693
        }                                        * B769E

* ROMPTR 0B5 0B6
* refs (1): B4B39
ROMP_0B5_0B6:
        {                                        * B76A3
          #       BC1D                           * B76A8  48157
          #       BC1D                           * B76B2  48157
          ::                                     * B76BC
            FALSE                                * B76C1
            FALSE                                * B76C6
          ;                                      * B76CB
        }                                        * B76D0

* ROMPTR 0B5 0B7
* refs (1): B4B39
ROMP_0B5_0B7:
        {                                        * B76D5
          #       BC1E                           * B76DA  48158
          #       BC1E                           * B76E4  48158
          ::                                     * B76EE
            FALSE                                * B76F3
            TRUE                                 * B76F8
          ;                                      * B76FD
        }                                        * B7702

* ROMPTR 0B5 0B8
* refs (1): B4B39
ROMP_0B5_0B8:
        {                                        * B7707
          #       BC1F                           * B770C  48159
          #       BC20                           * B7716  48160
          ::                                     * B7720
            TRUE                                 * B7725
            FALSE                                * B772A
          ;                                      * B772F
        }                                        * B7734

* ROMPTR 0B5 0B9
* refs (1): B4B39
ROMP_0B5_0B9:
        {                                        * B7739
          ROMPTR  0B5 0BA                        * B773E
          ROMPTR  0B5 0BB                        * B7749
          ROMPTR  0B5 0BC                        * B7754
          ROMPTR  0B5 0BD                        * B775F
          ROMPTR  0B5 0BE                        * B776A
          ROMPTR  0B5 0BF                        * B7775
          ROMPTR  0B5 0C0                        * B7780
          ROMPTR  0B5 0C1                        * B778B
          ROMPTR  0B5 0C2                        * B7796
          ROMPTR  0B5 0C3                        * B77A1
          ROMPTR  0B5 0C4                        * B77AC
          ROMPTR  0B5 0C5                        * B77B7
        }                                        * B77C2

* ROMPTR 0B5 0BA
* refs (1): B4B39
ROMP_0B5_0BA:
        {                                        * B77C7
          #       BC21                           * B77CC  48161
          %1                                     * B77D6
        }                                        * B77DB

* ROMPTR 0B5 0BB
* refs (1): B4B39
ROMP_0B5_0BB:
        {                                        * B77E0
          #       BC22                           * B77E5  48162
          %2                                     * B77EF
        }                                        * B77F4

* ROMPTR 0B5 0BC
* refs (1): B4B39
ROMP_0B5_0BC:
        {                                        * B77F9
          #       BC23                           * B77FE  48163
          %3                                     * B7808
        }                                        * B780D

* ROMPTR 0B5 0BD
* refs (1): B4B39
ROMP_0B5_0BD:
        {                                        * B7812
          #       BC24                           * B7817  48164
          %4                                     * B7821
        }                                        * B7826

* ROMPTR 0B5 0BE
* refs (1): B4B39
ROMP_0B5_0BE:
        {                                        * B782B
          #       BC25                           * B7830  48165
          %5                                     * B783A
        }                                        * B783F

* ROMPTR 0B5 0BF
* refs (1): B4B39
ROMP_0B5_0BF:
        {                                        * B7844
          #       BC26                           * B7849  48166
          %6                                     * B7853
        }                                        * B7858

* ROMPTR 0B5 0C0
* refs (1): B4B39
ROMP_0B5_0C0:
        {                                        * B785D
          #       BC27                           * B7862  48167
          %7                                     * B786C
        }                                        * B7871

* ROMPTR 0B5 0C1
* refs (1): B4B39
ROMP_0B5_0C1:
        {                                        * B7876
          #       BC28                           * B787B  48168
          %8                                     * B7885
        }                                        * B788A

* ROMPTR 0B5 0C2
* refs (1): B4B39
ROMP_0B5_0C2:
        {                                        * B788F
          #       BC29                           * B7894  48169
          %9                                     * B789E
        }                                        * B78A3

* ROMPTR 0B5 0C3
* refs (1): B4B39
ROMP_0B5_0C3:
        {                                        * B78A8
          #       BC2A                           * B78AD  48170
          %10                                    * B78B7
        }                                        * B78BC

* ROMPTR 0B5 0C4
* refs (1): B4B39
ROMP_0B5_0C4:
        {                                        * B78C1
          #       BC2B                           * B78C6  48171
          %11                                    * B78D0
        }                                        * B78D5

* ROMPTR 0B5 0C5
* refs (1): B4B39
ROMP_0B5_0C5:
        {                                        * B78DA
          #       BC2C                           * B78DF  48172
          %12                                    * B78E9
        }                                        * B78EE

* ROMPTR 0B5 0C6
* refs (1): B4B39
ROMP_0B5_0C6:
        {                                        * B78F3
          ROMPTR  0B5 0C7                        * B78F8
          ROMPTR  0B5 0C9                        * B7903
          ROMPTR  0B5 0CB                        * B790E
          ROMPTR  0B5 0CD                        * B7919
          ROMPTR  0B5 0CF                        * B7924
        }                                        * B792F

* ROMPTR 0B5 0C7
* refs (1): B4B39
ROMP_0B5_0C7:
        {                                        * B7934
          #       BC2D                           * B7939  48173
          BINT1                                  * B7943

* ROMPTR 0B5 0C8
* refs (1): B4B39
ROMP_0B5_0C8:
          %       4.9545216E9                    * B7948
        }                                        * B795D

* ROMPTR 0B5 0C9
* refs (1): B4B39
ROMP_0B5_0C9:
        {                                        * B7962
          #       BC2E                           * B7967  48174
          BINT2                                  * B7971

* ROMPTR 0B5 0CA
* refs (1): B4B39
ROMP_0B5_0CA:
          %       7.077888E8                     * B7976
        }                                        * B798B

* ROMPTR 0B5 0CB
* refs (1): B4B39
ROMP_0B5_0CB:
        {                                        * B7990
          #       BC2F                           * B7995  48175
          BINT3                                  * B799F

* ROMPTR 0B5 0CC
* refs (1): B4B39
ROMP_0B5_0CC:
          %       2.94912E7                      * B79A4
        }                                        * B79B9

* ROMPTR 0B5 0CD
* refs (1): B4B39
ROMP_0B5_0CD:
        {                                        * B79BE
          #       BC30                           * B79C3  48176
          BINT4                                  * B79CD

* ROMPTR 0B5 0CE
* refs (1): B4B39
ROMP_0B5_0CE:
          %       4.9152E5                       * B79D2
        }                                        * B79E7

* ROMPTR 0B5 0CF
* refs (1): B4B39
ROMP_0B5_0CF:
        {                                        * B79EC
          #       BC31                           * B79F1  48177
          BINT5                                  * B79FB

* ROMPTR 0B5 0D0
* refs (1): B4B39
ROMP_0B5_0D0:
          %       8.192E3                        * B7A00
        }                                        * B7A15

* ROMPTR 0B5 0D1
* refs (1): B4B39
ROMP_0B5_0D1:
        {                                        * B7A1A
          #       BC32                           * B7A1F  48178
          #       BC33                           * B7A29  48179
          #       BC34                           * B7A33  48180
          #       BC35                           * B7A3D  48181
          #       BC36                           * B7A47  48182
        }                                        * B7A51

* ROMPTR 0B5 0D2
* refs (1): B4B39
ROMP_0B5_0D2:
        {                                        * B7A56
          ROMPTR  0B5 0D3                        * B7A5B
          ROMPTR  0B5 0D4                        * B7A66
        }                                        * B7A71

* ROMPTR 0B5 0D3
* refs (1): B4B39
ROMP_0B5_0D3:
        {                                        * B7A76
          #       BC37                           * B7A7B  48183
          #       BC38                           * B7A85  48184
          FALSE                                  * B7A8F
        }                                        * B7A94

* ROMPTR 0B5 0D4
* refs (1): B4B39
ROMP_0B5_0D4:
        {                                        * B7A99
          #       BC39                           * B7A9E  48185
          #       BC3A                           * B7AA8  48186
          TRUE                                   * B7AB2
        }                                        * B7AB7

* ROMPTR 0B5 0D5
* refs (1): B4B39
ROMP_0B5_0D5:
        ::                                       * B7ABC
          ALARMS@                                * B7AC1
          LENCOMP                                * B7AC6
        ;                                        * B7ACB

* ROMPTR 0B5 0D6
* refs (1): B4B39
ROMP_0B5_0D6:
        ::                                       * B7AD0
          RCLALM                                 * B7AD5
          NOTcase                                * B7ADA
          NOALARMERR                             * B7ADF
        ;                                        * B7AE4

* ROMPTR 0B5 0D7
* refs (1): B4B39
ROMP_0B5_0D7:
        ::                                       * B7AE9
          ALRMLS>                                * B7AEE
          INCOMPDROP                             * B7AF3
          2SWAP                                  * B7AF8
          TIMESTR                                * B7AFD
          SWAP                                   * B7B02
          %0=                                    * B7B07
          ITE                                    * B7B0C
          $       "   "                          * B7B11
          $       " R "                          * B7B21
          &$                                     * B7B31
          SWAP                                   * B7B36
          DUP                                    * B7B3B
          MINUSONE                               * B7B40
          EQUAL                                  * B7B45
          caseDROP                               * B7B4A
          DUPTYPECSTR?                           * B7B4F
          ?SKIP                                  * B7B54
          ::                                     * B7B59
            BINT4                                * B7B5E
            ROMPTR  0B0 074                      * B7B63
          ;                                      * B7B6E
          &$                                     * B7B73
        ;                                        * B7B78
