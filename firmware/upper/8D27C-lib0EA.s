* HP 48GX ROM revision R, #8D27C-#8FFFF: Library part 0EA
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #8D27C in the original ROM).
        ENDLENGTH                                * 8D27C

        CON(5)  DOLIB                            * 8D27C  library object
        LENGTH                                   * 8D281  length, to #8FFB5
        CON(2)  0                                * 8D286  title length

LIB0EA:
        CON(3)  #0EA                             * 8D288  library number
        REL(5)  LIB0EA.hash                      * 8D28B  hash table
        CON(5)  0                                * 8D290  message table
        REL(5)  LIB0EA.link                      * 8D295  link table
        CON(5)  0                                * 8D29A  config
        RPL

* ROMPTR 0EA 000
* refs (1): 8D288
ROMP_0EA_000:
        ::                                       * 8D29F
          TakeOver                               * 8D2A4
          DAsBad?                                * 8D2A9
          ?SEMI                                  * 8D2AE
          EDITPARTS                              * 8D2B3
          #>1                                    * 8D2B8
          ?SKIP                                  * 8D2BD

* ROMPTR 0EA 001
* refs (1): 8D288
ROMP_0EA_001:
          ::                                     * 8D2C2
            SetDA1NoCh                           * 8D2C7
            SetDA2aNoCh                          * 8D2CC
          ;                                      * 8D2D1
          InitEd&Modes                           * 8D2D6
          OBJ_40CC3                              * 8D2DB
        ;                                        * 8D2E0

* ROMPTR 0EA 002
* refs (1): 8D288
ROMP_0EA_002:
        ::                                       * 8D2E5
          TakeOver                               * 8D2EA
          DAsBad?                                * 8D2EF
          ?SEMI                                  * 8D2F4
          17GETLAM                               * 8D2F9
          #0=?SKIP                               * 8D2FE
          ::                                     * 8D303
            GetMat/Vec                           * 8D308
            CK1NOLASTWD                          * 8D30D
            DROP                                 * 8D312
          ;                                      * 8D317
          16GETLAM                               * 8D31C
          #0=?SKIP                               * 8D321
          FALSE                                  * 8D326
          TRUE                                   * 8D32B
          3PUTLAM                                * 8D330
          InitEd&Modes                           * 8D335
        ;                                        * 8D33A

* ROMPTR 0EA 003
* refs (1): 8D288
ROMP_0EA_003:
        ::                                       * 8D33F
          BindMatVars                            * 8D344
          AtUserStack                            * 8D349
          '                                      * 8D34E
          ROMPTR  0EA 008                        * 8D353
          '                                      * 8D35E
          OBJ_44948                              * 8D363
          TrueFalse                              * 8D368
          '                                      * 8D36D
          ROMPTR  0EA 048                        * 8D372
          ONEFALSE                               * 8D37D
          '                                      * 8D382
          3GETLAM                                * 8D387
          'ERRJMP                                * 8D38C
          POLSetUI                               * 8D391
          CLCD10                                 * 8D396
          ClrDAsOK                               * 8D39B
          ERRSET                                 * 8D3A0
          POLKeyUI                               * 8D3A5
          ERRTRAP                                * 8D3AA

* ROMPTR 0EA 004
* refs (1): 8D288
ROMP_0EA_004:
          ::                                     * 8D3AF
            DropSysObs                           * 8D3B4
            OBJ_18295                            * 8D3B9
            17GETLAM                             * 8D3BE
            #0=?SKIP                             * 8D3C3
            GetMat/Vec                           * 8D3C8
            AtUserStack                          * 8D3CD
            TRUE                                 * 8D3D2
            3PUTLAM                              * 8D3D7
            ERRJMP                               * 8D3DC
          ;                                      * 8D3E1
          ABND                                   * 8D3E6
        ;                                        * 8D3EB

* ROMPTR 0EA 005
* refs (1): 8D288
ROMP_0EA_005:
        ::                                       * 8D3F0
          OBJ_68972                              * 8D3F5
          OBJ_6BBFE                              * 8D3FA
          DROP                                   * 8D3FF
        ;                                        * 8D404

* ROMPTR 0EA 006
* refs (1): 8D288
ROMP_0EA_006:
        ::                                       * 8D409
          POLSaveUI                              * 8D40E
          ERRSET                                 * 8D413
          ::                                     * 8D418
            ROMPTR  0EA 052                      * 8D41D
            ROMPTR  0EA 003                      * 8D428
          ;                                      * 8D433
          ERRTRAP                                * 8D438
          POLResUI&Err                           * 8D43D
          POLRestoreUI                           * 8D442
          ClrDAsOK                               * 8D447
        ;                                        * 8D44C

* ROMPTR 0EA 007
* refs (1): 8D288
ROMP_0EA_007:
        ::                                       * 8D451
          EditExstCase                           * 8D456
          ::                                     * 8D45B
            BINT25                               * 8D460
            ?CaseKeyDef                          * 8D465
            ROMPTR  0EA 028                      * 8D46A
            BINT45                               * 8D475
            ?CaseKeyDef                          * 8D47A
            ROMPTR  0EA 000                      * 8D47F
            DROPFALSE                            * 8D48A
          ;                                      * 8D48F
          BINT25                                 * 8D494
          ?CaseKeyDef                            * 8D499
          ROMPTR  0EA 033                        * 8D49E
          BINT45                                 * 8D4A9
          ?CaseKeyDef                            * 8D4AE
          ROMPTR  0EA 002                        * 8D4B3
          DROPFALSE                              * 8D4BE
        ;                                        * 8D4C3

* ROMPTR 0EA 008
* refs (1): 8D288
ROMP_0EA_008:
        ::                                       * 8D4C8
          SetPrgmEntry                           * 8D4CD

* ROMPTR 0EA 009
* refs (1): 8D288
ROMP_0EA_009:
          ::                                     * 8D4D2
            ROMPTR  0EA 015                      * 8D4D7
            5GETLAM                              * 8D4E2
            7GETLAM                              * 8D4E7
            #-                                   * 8D4EC
            #=                                   * 8D4F1
            ?SEMI                                * 8D4F6
            9GETLAM                              * 8D4FB
            DUP                                  * 8D500
            13PUTLAM                             * 8D505
            ROMPTR  0EA 018                      * 8D50A
            #+                                   * 8D515
            11PUTLAM                             * 8D51A
            ROMPTR  0EA 045                      * 8D51F
          ;                                      * 8D52A
          TOADISP                                * 8D52F
          RCLSYSF                                * 8D534
          15GETLAM                               * 8D539
          EQUALNOT                               * 8D53E
          DA1OK?                                 * 8D543
          NOT                                    * 8D548
          DA2aOK?                                * 8D54D
          DA2aLess1OK?                           * 8D552
          ClrNewEditL                            * 8D557
          ORNOT                                  * 8D55C
          OR                                     * 8D561
          OR                                     * 8D566
          IT                                     * 8D56B
          ::                                     * 8D570
            EDITPARTS                            * 8D575
            #>1                                  * 8D57A
            ITE                                  * 8D57F
            ::                                   * 8D584
              DispStatus                         * 8D589
              BlankDA2a                          * 8D58E
            ;                                    * 8D593
            ::                                   * 8D598
              ROMPTR  0EA 00E                    * 8D59D
              ROMPTR  0EA 023                    * 8D5A8

* ROMPTR 0EA 00A
* refs (1): 8D288
ROMP_0EA_00A:
              ::                                 * 8D5B3
                13GETLAM                         * 8D5B8
                ROMPTR  0EA 018                  * 8D5BD
                OVER#+                           * 8D5C8
                ROMPTR  0EA 014                  * 8D5CD
              ;                                  * 8D5D8
              ROMPTR  0EA 011                    * 8D5DD
              ROMPTR  0EA 044                    * 8D5E8
            ;                                    * 8D5F3
            SetDA1Valid                          * 8D5F8
            SetDA2aValid                         * 8D5FD
          ;                                      * 8D602
          RCLSYSF                                * 8D607
          15GETLAM                               * 8D60C
          EQUAL                                  * 8D611
          DA2bOK?                                * 8D616
          AND                                    * 8D61B
          ?SKIP                                  * 8D620
          ::                                     * 8D625
            EditLExists?                         * 8D62A
            case                                 * 8D62F
            DispEditLine                         * 8D634

* ROMPTR 0EA 00B
* refs (1): 8D288
ROMP_0EA_00B:
            ::                                   * 8D639
              TOADISP                            * 8D63E
              8GETLAM                            * 8D643
              ROMPTR  0EA 020                    * 8D648
              CHR     "-"                        * 8D653
              >T$                                * 8D65A
              9GETLAM                            * 8D65F
              ROMPTR  0EA 021                    * 8D664
              &$                                 * 8D66F
              PTR     CHR_:                      * 8D674
              >T$                                * 8D679
              APPEND_SPACE                       * 8D67E
              22Lget                             * 8D683
              8GETLAM                            * 8D688
              9GETLAM                            * 8D68D
              ROMPTR  0EA 01E                    * 8D692
              DUPTYPECSTR?                       * 8D69D
              ?SKIP                              * 8D6A2
              ::                                 * 8D6A7
                OBJ_159D2                        * 8D6AC
                OVERLEN$                         * 8D6B1
                BINT22                           * 8D6B6
                SWAP#-                           * 8D6BB
                2DUPSWAP                         * 8D6C0
                LEN$                             * 8D6C5
                #<ITE                            * 8D6CA
                ::                               * 8D6CF
                  1_#1-SUB$                      * 8D6D4
                  CHR_...                        * 8D6D9
                  >T$                            * 8D6DE
                ;                                * 8D6E3
                DROP                             * 8D6E8
              ;                                  * 8D6ED
              &$                                 * 8D6F2
              BigDisp1(st)                       * 8D6F7
            ;                                    * 8D6FC
            SetDA2bValid                         * 8D701
          ;                                      * 8D706
          DA3OK?                                 * 8D70B
          ?SKIP                                  * 8D710
          ?DispMenu                              * 8D715
          RCLSYSF                                * 8D71A
          15PUTLAM                               * 8D71F
          ClrDAsOK                               * 8D724
        ;                                        * 8D729

* ROMPTR 0EA 00C
* refs (1): 8D288
ROMP_0EA_00C:
        CODE                                     * 8D72E  77 nibbles
          LC(5)   #80702                         * 8D738
          CD0EX                                  * 8D73F
          RSTK=C                                 * 8D742
          C=DAT0  A                              * 8D744
          D0=C                                   * 8D747
          D0=D0+  15                             * 8D74A
          LC(5)   BINT0                          * 8D74D
          DAT0=C  A                              * 8D754
          LC(2)   #14                            * 8D757
L_8D75B:
          D0=D0+  10                             * 8D75B
          A=DAT1  A                              * 8D75E
          D1=D1+  5                              * 8D761
          DAT0=A  A                              * 8D764
          C=C-1   B                              * 8D767
          GONC    L_8D75B                        * 8D76A
          C=RSTK                                 * 8D76D
          D0=C                                   * 8D76F
          LC(5)   #00016                         * 8D772
          D=D+C   A                              * 8D779
          A=DAT0  A                              * 8D77B
          D0=D0+  5                              * 8D77E
          PC=(A)                                 * 8D781
        ENDCODE                                  * 8D785

* ROMPTR 0EA 00D
* refs (1): 8D288
ROMP_0EA_00D:
        ::                                       * 8D785
          BINT21                                 * 8D78A
          '                                      * 8D78F
          NULLLAM                                * 8D794
          CACHE                                  * 8D799
          BINT0                                  * 8D79E
          1PUTLAM                                * 8D7A3
        ;                                        * 8D7A8

* ROMPTR 0EA 00E
* refs (1): 8D288
ROMP_0EA_00E:
        ::                                       * 8D7AD
          TOADISP                                * 8D7B2
          20GETLAM                               * 8D7B7
          ROMPTR  0EA 020                        * 8D7BC
          ROMPTR  0EA 022                        * 8D7C7
          CHR     "·"                            * 8D7D2
          >T$                                    * 8D7D9
          21GETLAM                               * 8D7DE
          ROMPTR  0EA 021                        * 8D7E3
          ROMPTR  0EA 022                        * 8D7EE
          &$                                     * 8D7F9
          $>grob                                 * 8D7FE
          BINT0                                  * 8D803
          BINT0                                  * 8D808
          2DUP                                   * 8D80D
          HARDBUFF                               * 8D812
          3UNROLL                                * 8D817
          BINT22                                 * 8D81C
          BINT6                                  * 8D821
          GROB!ZERO                              * 8D826
          3UNROLL                                * 8D82B
          GROB!                                  * 8D830
        ;                                        * 8D835

* ROMPTR 0EA 00F
* refs (1): 8D288
ROMP_0EA_00F:
        ::                                       * 8D83A
          POLSaveUI                              * 8D83F
          ERRSET                                 * 8D844
          ::                                     * 8D849
            InitOldMat                           * 8D84E
            ROMPTR  0EA 003                      * 8D853
          ;                                      * 8D85E
          ERRTRAP                                * 8D863
          POLResUI&Err                           * 8D868
          POLRestoreUI                           * 8D86D
          ClrDAsOK                               * 8D872
        ;                                        * 8D877

* ROMPTR 0EA 010
* refs (1): 8D288
ROMP_0EA_010:
        ::                                       * 8D87C
          ROMPTR  0EA 053                        * 8D881
          DUP                                    * 8D88C
          DIMLIMITS                              * 8D891
          INNER#1=                               * 8D896
          ITE                                    * 8D89B
          ::                                     * 8D8A0
            BINT1                                * 8D8A5
            2DUPSWAP                             * 8D8AA
            5ROLL                                * 8D8AF
            3UNROLL                              * 8D8B4
            TWO{}N                               * 8D8B9
            MATREDIM                             * 8D8BE
            3UNROLL                              * 8D8C3
            BINT1                                * 8D8C8
          ;                                      * 8D8CD
          ::                                     * 8D8D2
            SWAP                                 * 8D8D7
            BINT0                                * 8D8DC
          ;                                      * 8D8E1
          BINT1                                  * 8D8E6
          2OVER                                  * 8D8EB
          #*                                     * 8D8F0
          BINT1                                  * 8D8F5
          ROMPTR  0EA 054                        * 8D8FA
        ;                                        * 8D905

* ROMPTR 0EA 012
* refs (2): 8D288 8D288
ROMP_0EA_012:
        ::                                       * 8D90A
          TOADISP                                * 8D90F
          HARDBUFF                               * 8D914
          7GETLAM                                * 8D919
          6GETLAM                                * 8D91E
          5GETLAM                                * 8D923
          4GETLAM                                * 8D928
          SUBGROB                                * 8D92D
          INVGROB                                * 8D932
          HARDBUFF                               * 8D937
          7GETLAM                                * 8D93C
          6GETLAM                                * 8D941
          GROB!                                  * 8D946
        ;                                        * 8D94B

* ROMPTR 0EA 013
* refs (1): 8D288
ROMP_0EA_013:
        ::                                       * 8D950
          TOADISP                                * 8D955
          ROMPTR  0EA 015                        * 8D95A
          3UNROLL                                * 8D965
          #1+SWAP                                * 8D96A
          DO                                     * 8D96F
          DUPINDEX@                              * 8D974
          13GETLAM                               * 8D979
          #-                                     * 8D97E
          #*                                     * 8D983
          #12+                                   * 8D988
          2DUP#+                                 * 8D98D
          INDEX@                                 * 8D992
          ROMPTR  0EA 021                        * 8D997
          ROMPTR  0EA 022                        * 8D9A2
          $>grob                                 * 8D9AD
          INVGROB                                * 8D9B2
          ROMPTR  0EA 016                        * 8D9B7
          #1-                                    * 8D9C2
          BINT0                                  * 8D9C7
          6ROLL                                  * 8D9CC
          INDEX@                                 * 8D9D1
          13GETLAM                               * 8D9D6
          #=                                     * 8D9DB
          IT                                     * 8D9E0
          ::                                     * 8D9E5
            BINT10                               * 8D9EA
            #+                                   * 8D9EF
          ;                                      * 8D9F4
          6ROLL                                  * 8D9F9
          OVER#-                                 * 8D9FE
          BINT6                                  * 8DA03
          SWAP                                   * 8DA08
          MAKEGROB                               * 8DA0D
          INVGROB                                * 8DA12
          HARDBUFF                               * 8DA17
          ROT                                    * 8DA1C
          BINT0                                  * 8DA21
          GROB!                                  * 8DA26
          GROB!                                  * 8DA2B
          LOOP                                   * 8DA30
          DROP                                   * 8DA35
        ;                                        * 8DA3A

* ROMPTR 0EA 014
* refs (1): 8D288
ROMP_0EA_014:
        ::                                       * 8DA3F
          2DUP                                   * 8DA44
          ROMPTR  0EA 013                        * 8DA49
          ROMPTR  0EA 017                        * 8DA54
        ;                                        * 8DA5F

* ROMPTR 0EA 015
* refs (1): 8D288
ROMP_0EA_015:
        ::                                       * 8DA64
          OBJ_44B9B                              * 8DA69
          #6*                                    * 8DA6E
        ;                                        * 8DA73

* ROMPTR 0EA 016
* refs (1): 8D288
ROMP_0EA_016:
        ::                                       * 8DA78
          HARDBUFF                               * 8DA7D
          OVER                                   * 8DA82
          GROBDIMw                               * 8DA87
          4PICK                                  * 8DA8C
          SWAP#-                                 * 8DA91
        ;                                        * 8DA96

* ROMPTR 0EA 017
* refs (1): 8D288
ROMP_0EA_017:
        ::                                       * 8DA9B
          TOADISP                                * 8DAA0
          ROMPTR  0EA 015                        * 8DAA5
          3UNROLL                                * 8DAB0
          #1+SWAP                                * 8DAB5
          DO                                     * 8DABA
          DUPINDEX@                              * 8DABF
          13GETLAM                               * 8DAC4
          #-                                     * 8DAC9
          #*                                     * 8DACE
          #12+                                   * 8DAD3
          2DUP#+                                 * 8DAD8
          10GETLAM                               * 8DADD
          #1+                                    * 8DAE2
          12GETLAM                               * 8DAE7
          DO                                     * 8DAEC
          INDEX@                                 * 8DAF1
          JINDEX@                                * 8DAF6
          ROMPTR  0EA 025                        * 8DAFB
          $>GROB                                 * 8DB06
          ROMPTR  0EA 016                        * 8DB0B
          INDEX@                                 * 8DB16
          12GETLAM                               * 8DB1B
          #-                                     * 8DB20
          #8*                                    * 8DB25
          #6+                                    * 8DB2A
          7PICK                                  * 8DB2F
          BINT8                                  * 8DB34
          SWAP                                   * 8DB39
          MAKEGROB                               * 8DB3E
          7PICK                                  * 8DB43
          HARDBUFF                               * 8DB48
          SWAP4PICK                              * 8DB4D
          GROB!                                  * 8DB52
          GROB!                                  * 8DB57
          LOOP                                   * 8DB5C
          2DROP                                  * 8DB61
          LOOP                                   * 8DB66
          DROP                                   * 8DB6B
        ;                                        * 8DB70

* ROMPTR 0EA 018
* refs (1): 8D288
ROMP_0EA_018:
        ::                                       * 8DB75
          BINT20                                 * 8DB7A
          OBJ_44B9B                              * 8DB7F
          #/                                     * 8DB84
          SWAPDROP#1-                            * 8DB89
        ;                                        * 8DB8E

* ROMPTR 0EA 019
* refs (1): 8D288
ROMP_0EA_019:
        ::                                       * 8DB93
          TakeOver                               * 8DB98
          20GETLAM                               * 8DB9D
          #0=                                    * 8DBA2
          caseDoBadKey                           * 8DBA7
          BINT1                                  * 8DBAC
          8PUTLAM                                * 8DBB1
          12GETLAM                               * 8DBB6
          #1=                                    * 8DBBB
          NOTcase                                * 8DBC0
          ROMPTR  0EA 040                        * 8DBC5
          ROMPTR  0EA 012                        * 8DBD0
          ROMPTR  0EA 046                        * 8DBDB
          ROMPTR  0EA 047                        * 8DBE6
        ;                                        * 8DBF1

* ROMPTR 0EA 01A
* refs (1): 8D288
ROMP_0EA_01A:
        ::                                       * 8DBF6
          TakeOver                               * 8DBFB
          20GETLAM                               * 8DC00
          DUP#0=                                 * 8DC05
          caseDrpBadKy                           * 8DC0A
          8PUTLAM                                * 8DC0F
          20GETLAM                               * 8DC14
          10GETLAM                               * 8DC19
          #>case                                 * 8DC1E
          ROMPTR  0EA 040                        * 8DC23
          ROMPTR  0EA 012                        * 8DC2E
          ROMPTR  0EA 046                        * 8DC39
          ROMPTR  0EA 047                        * 8DC44
        ;                                        * 8DC4F

* ROMPTR 0EA 01B
* refs (1): 8D288
ROMP_0EA_01B:
        ::                                       * 8DC54
          TakeOver                               * 8DC59
          21GETLAM                               * 8DC5E
          #0=                                    * 8DC63
          caseDoBadKey                           * 8DC68
          BINT1                                  * 8DC6D
          9PUTLAM                                * 8DC72
          13GETLAM                               * 8DC77
          #1=                                    * 8DC7C
          NOTcase                                * 8DC81
          ROMPTR  0EA 040                        * 8DC86
          ROMPTR  0EA 012                        * 8DC91
          ROMPTR  0EA 045                        * 8DC9C
          ROMPTR  0EA 047                        * 8DCA7
        ;                                        * 8DCB2

* ROMPTR 0EA 01C
* refs (1): 8D288
ROMP_0EA_01C:
        ::                                       * 8DCB7
          TakeOver                               * 8DCBC
          21GETLAM                               * 8DCC1
          DUP#0=                                 * 8DCC6
          caseDrpBadKy                           * 8DCCB
          9PUTLAM                                * 8DCD0
          21GETLAM                               * 8DCD5
          11GETLAM                               * 8DCDA
          #>case                                 * 8DCDF
          ROMPTR  0EA 040                        * 8DCE4
          ROMPTR  0EA 012                        * 8DCEF
          ROMPTR  0EA 045                        * 8DCFA
          ROMPTR  0EA 047                        * 8DD05
        ;                                        * 8DD10

* ROMPTR 0EA 01D
* refs (1): 8D288
ROMP_0EA_01D:
        ::                                       * 8DD15
          TakeOver                               * 8DD1A
          SetDA3NoCh                             * 8DD1F
          REPEATER                               * 8DD24
          BINT18                                 * 8DD29
          ROMPTR  0EA 06D                        * 8DD2E
        ;                                        * 8DD39

* ROMPTR 0EA 01E
* refs (1): 8D288
ROMP_0EA_01E:
        ::                                       * 8DD3E
          2DUP                                   * 8DD43
          21GETLAM                               * 8DD48
          #>                                     * 8DD4D
          SWAP                                   * 8DD52
          20GETLAM                               * 8DD57
          #>                                     * 8DD5C
          ORcase                                 * 8DD61

* ROMPTR 0EA 01F
* refs (1): 8D288
ROMP_0EA_01F:
          ::                                     * 8DD66
            3DROP                                * 8DD6B
            NULL$                                * 8DD70
          ;                                      * 8DD75
          18GETLAM                               * 8DD7A
          #0=case                                * 8DD7F
          GetElt                                 * 8DD84
          2DUP                                   * 8DD89
          ROMPTR  0EA 03B                        * 8DD8E
          17GETLAM                               * 8DD99
          #>ITE                                  * 8DD9E
          ROMPTR  0EA 01F                        * 8DDA3
          GetElt                                 * 8DDAE
        ;                                        * 8DDB3

* ROMPTR 0EA 021
* refs (2): 8D288 8D288
ROMP_0EA_021:
        ::                                       * 8DDB8
          NULL$SWAP                              * 8DDBD
          BEGIN                                  * 8DDC2
          BINT10                                 * 8DDC7
          #/                                     * 8DDCC
          SWAP                                   * 8DDD1
          BINT48                                 * 8DDD6
          #+                                     * 8DDDB
          #>CHR                                  * 8DDE0
          ROTSWAP                                * 8DDE5
          >H$                                    * 8DDEA
          SWAPDUP                                * 8DDEF
          #0=                                    * 8DDF4
          UNTIL                                  * 8DDF9
          DROP                                   * 8DDFE
        ;                                        * 8DE03

* ROMPTR 0EA 022
* refs (1): 8D288
ROMP_0EA_022:
        ::                                       * 8DE08
          DUPLEN$                                * 8DE0D
          DUP                                    * 8DE12
          BINT4                                  * 8DE17
          #<case                                 * 8DE1C
          DROP                                   * 8DE21
          DUPTWO                                 * 8DE26
          #-SWAP                                 * 8DE2B
          SUB$                                   * 8DE30
        ;                                        * 8DE35

* ROMPTR 0EA 023
* refs (1): 8D288
ROMP_0EA_023:
        ::                                       * 8DE3A
          12GETLAM                               * 8DE3F
          10GETLAM                               * 8DE44
          ROMPTR  0EA 024                        * 8DE49
        ;                                        * 8DE54

* ROMPTR 0EA 024
* refs (1): 8D288
ROMP_0EA_024:
        ::                                       * 8DE59
          TOADISP                                * 8DE5E
          #1+SWAP                                * 8DE63
          DO                                     * 8DE68
          INDEX@                                 * 8DE6D
          ROMPTR  0EA 020                        * 8DE72
          ROMPTR  0EA 022                        * 8DE7D
          $>grob                                 * 8DE88
          INVGROB                                * 8DE8D
          HARDBUFF                               * 8DE92
          OVER                                   * 8DE97
          GROBDIMw                               * 8DE9C
          BINT12                                 * 8DEA1
          SWAP#-                                 * 8DEA6
          INDEX@                                 * 8DEAB
          12GETLAM                               * 8DEB0
          #-                                     * 8DEB5
          #8*                                    * 8DEBA
          BINT8                                  * 8DEBF
          #+                                     * 8DEC4
          BINT8                                  * 8DEC9
          BINT12                                 * 8DECE
          MAKEGROB                               * 8DED3
          INVGROB                                * 8DED8
          HARDBUFF                               * 8DEDD
          BINT0                                  * 8DEE2
          4PICK                                  * 8DEE7
          BINT2                                  * 8DEEC
          #-                                     * 8DEF1
          GROB!                                  * 8DEF6
          GROB!                                  * 8DEFB
          LOOP                                   * 8DF00
        ;                                        * 8DF05

* ROMPTR 0EA 025
* refs (1): 8D288
ROMP_0EA_025:
        ::                                       * 8DF0A
          22Lget                                 * 8DF0F
          3UNROLL                                * 8DF14
          ROMPTR  0EA 01E                        * 8DF19
          DUPTYPECSTR?                           * 8DF24
          ?SEMI                                  * 8DF29
          DECOMP$                                * 8DF2E
          CHR_Space                              * 8DF33
          >H$                                    * 8DF38
          OBJ_44B9B                              * 8DF3D
          2DUPSWAP                               * 8DF42
          LEN$                                   * 8DF47
          #<case                                 * 8DF4C
          ::                                     * 8DF51
            1_#1-SUB$                            * 8DF56
            CHR_...                              * 8DF5B
            >T$                                  * 8DF60
          ;                                      * 8DF65
          DROP                                   * 8DF6A
        ;                                        * 8DF6F

* ROMPTR 0EA 026
* refs (1): 8D288
ROMP_0EA_026:
        ::                                       * 8DF74
          TakeOver                               * 8DF79
          SetDA3NoCh                             * 8DF7E
          REPEATER                               * 8DF83
          BINT17                                 * 8DF88
          ROMPTR  0EA 069                        * 8DF8D
        ;                                        * 8DF98

* ROMPTR 0EA 027
* refs (1): 8D288
ROMP_0EA_027:
        ::                                       * 8DF9D
          NULL$SWAP                              * 8DFA2
          DUP#0=csDROP                           * 8DFA7
          ZERO_DO                                * 8DFAC
          CHR_Space                              * 8DFB1
          >H$                                    * 8DFB6
          LOOP                                   * 8DFBB
        ;                                        * 8DFC0

* ROMPTR 0EA 028
* refs (1): 8D288
ROMP_0EA_028:
        ::                                       * 8DFC5
          TakeOver                               * 8DFCA
          DEPTH                                  * 8DFCF
          1PUTLAM                                * 8DFD4
          EDITPARTS                              * 8DFD9
          #>1                                    * 8DFDE
          ITE                                    * 8DFE3
          ROMPTR  0EA 03A                        * 8DFE8

* ROMPTR 0EA 029
* refs (1): 8D288
ROMP_0EA_029:
          ::                                     * 8DFF3
            BINT0                                * 8DFF8
            14PUTLAM                             * 8DFFD
          ;                                      * 8E002
          ROMPTR  0EA 02B                        * 8E007
          2PUTLAM                                * 8E012

* ROMPTR 0EA 02A
* refs (1): 8D288
ROMP_0EA_02A:
          ::                                     * 8E017
            OBJ_40ABB                            * 8E01C
            NOT?SEMI                             * 8E021
            InitEd&Modes                         * 8E026
            EVAL                                 * 8E02B
            AtUserStack                          * 8E030
          ;                                      * 8E035

* ROMPTR 0EA 02B
* refs (1): 8D288
ROMP_0EA_02B:
          ::                                     * 8E03A
            HARDBUFF                             * 8E03F
            OCRC                                 * 8E044
            SWAPDROP                             * 8E049
          ;                                      * 8E04E
          2GETLAM                                * 8E053
          EQUAL                                  * 8E058
          ?SKIP                                  * 8E05D
          ROMPTR  0EA 03A                        * 8E062
          DEPTH                                  * 8E06D
          1GETLAM                                * 8E072
          2DUP#>                                 * 8E077
          NOTcase2DROP                           * 8E07C
          #-                                     * 8E081
          22Lget                                 * 8E086
          TYPELIST?                              * 8E08B
          IT                                     * 8E090
          ::                                     * 8E095
            DUP#1+PICK                           * 8E09A
            {                                    * 8E09F
              BINT1                              * 8E0A4
              BINT1                              * 8E0A9
            }                                    * 8E0AE
            SWAP                                 * 8E0B3
            TYPECMP?                             * 8E0B8
            ITE                                  * 8E0BD
            C%0                                  * 8E0C2
            %0_2A2B4                             * 8E0C7
            MAKEARRY                             * 8E0CC
            22PUTLAM                             * 8E0D1
          ;                                      * 8E0D6
          22Lget                                 * 8E0DB
          TYPERARRY?                             * 8E0E0
          ITE                                    * 8E0E5
          ROMPTR  0EA 02E                        * 8E0EA
          ROMPTR  0EA 035                        * 8E0F5
          ROMPTR  0EA 030                        * 8E100

* ROMPTR 0EA 02C
* refs (1): 8D288
ROMP_0EA_02C:
          ::                                     * 8E10B
            14GETLAM                             * 8E110
            ROMPTR  0EA 029                      * 8E115
            BINT0                                * 8E120
            EQcasedrop                           * 8E125
            NOP                                  * 8E12A
            BINT1                                * 8E12F
            EQcasedrop                           * 8E134

* ROMPTR 0EA 02D
* refs (1): 8D288
ROMP_0EA_02D:
            ::                                   * 8E139
              TOADISP                            * 8E13E
              8GETLAM                            * 8E143
              9GETLAM                            * 8E148
              ROMPTR  0EA 03E                    * 8E14D
              $>GROB                             * 8E158
              HARDBUFF                           * 8E15D
              7GETLAM                            * 8E162
              6GETLAM                            * 8E167
              GROB!                              * 8E16C
            ;                                    * 8E171
            BINT2                                * 8E176
            EQ                                   * 8E17B
            case                                 * 8E180
            ::                                   * 8E185
              ROMPTR  0EA 041                    * 8E18A
              ROMPTR  0EA 023                    * 8E195
              ROMPTR  0EA 00A                    * 8E1A0
            ;                                    * 8E1AB
          ;                                      * 8E1B0
          ROMPTR  0EA 00E                        * 8E1B5
          ROMPTR  0EA 00B                        * 8E1C0
          ROMPTR  0EA 011                        * 8E1CB
          SetDA12NoCh                            * 8E1D6
        ;                                        * 8E1DB

* ROMPTR 0EA 02E
* refs (1): 8D288
ROMP_0EA_02E:
        ::                                       * 8E1E0
          DUP#0_DO                               * 8E1E5
          INDEX@                                 * 8E1EA
          #2+PICK                                * 8E1EF
          TYPEREAL?                              * 8E1F4
          ?SKIP                                  * 8E1F9

* ROMPTR 0EA 02F
* refs (1): 8D288
ROMP_0EA_02F:
          ::                                     * 8E1FE
            DROP                                 * 8E203
            #       502                          * 8E208  1282
            JstGetTHEMESG                        * 8E212
            DO$EXIT                              * 8E217
          ;                                      * 8E21C
          LOOP                                   * 8E221
        ;                                        * 8E226

* ROMPTR 0EA 030
* refs (1): 8D288
ROMP_0EA_030:
        ::                                       * 8E22B
          ROMPTR  0EA 012                        * 8E230
          ZERO_DO                                * 8E23B
          8GETLAM                                * 8E240
          20GETLAM                               * 8E245
          #>                                     * 8E24A
          IT                                     * 8E24F
          ::                                     * 8E254
            22Lget                               * 8E259
            8GETLAM                              * 8E25E
            21GETLAM                             * 8E263
            DUP#0=IT                             * 8E268
            DROPONE                              * 8E26D
            TWO{}N                               * 8E272
            MATREDIM                             * 8E277
            22PUTLAM                             * 8E27C
            8GETLAM                              * 8E281
            20PUTLAM                             * 8E286
            OBJ_44BBB                            * 8E28B
            #0=?SEMI                             * 8E290
            21GETLAM                             * 8E295
            #1=                                  * 8E29A
            ?SEMI                                * 8E29F
            ROMPTR  0EA 031                      * 8E2A4
            ROMPTR  0EA 03A                      * 8E2AF
          ;                                      * 8E2BA
          9GETLAM                                * 8E2BF
          21GETLAM                               * 8E2C4
          #>                                     * 8E2C9
          IT                                     * 8E2CE
          ::                                     * 8E2D3
            22Lget                               * 8E2D8
            MATTRN                               * 8E2DD
            9GETLAM                              * 8E2E2
            20GETLAM                             * 8E2E7
            DUP#0=IT                             * 8E2EC
            DROPONE                              * 8E2F1
            TWO{}N                               * 8E2F6
            MATREDIM                             * 8E2FB
            MATTRN                               * 8E300
            22PUTLAM                             * 8E305
            9GETLAM                              * 8E30A
            21PUTLAM                             * 8E30F
            OBJ_44BBB                            * 8E314
            #1=                                  * 8E319
            ?SEMI                                * 8E31E
            20GETLAM                             * 8E323
            #1=                                  * 8E328
            ?SEMI                                * 8E32D

* ROMPTR 0EA 031
* refs (1): 8D288
ROMP_0EA_031:
            ::                                   * 8E332
              20GETLAM                           * 8E337
              21GETLAM                           * 8E33C
              #*                                 * 8E341
              17PUTLAM                           * 8E346
            ;                                    * 8E34B
            ROMPTR  0EA 03A                      * 8E350
          ;                                      * 8E35B
          ISTOP-INDEX                            * 8E360
          ROLL                                   * 8E365
          8GETLAM                                * 8E36A
          9GETLAM                                * 8E36F
          RowElt#                                * 8E374
          22Lget                                 * 8E379
          ERRSET                                 * 8E37E
          BANGARRY                               * 8E383
          ERRTRAP                                * 8E388
          ::                                     * 8E38D
            DropSysObs                           * 8E392
            ISTOP-INDEX                          * 8E397
            UNROLL                               * 8E39C
            ERRJMP                               * 8E3A1
          ;                                      * 8E3A6
          22PUTLAM                               * 8E3AB
          AtUserStack                            * 8E3B0

* ROMPTR 0EA 032
* refs (1): 8D288
ROMP_0EA_032:
          ::                                     * 8E3B5
            14GETLAM                             * 8E3BA
            #0=                                  * 8E3BF
            NOT?SEMI                             * 8E3C4
            BINT1                                * 8E3C9
            14PUTLAM                             * 8E3CE
          ;                                      * 8E3D3
          8GETLAM                                * 8E3D8
          9GETLAM                                * 8E3DD
          ROMPTR  0EA 03B                        * 8E3E2
          17GETLAM                               * 8E3ED
          2DUP                                   * 8E3F2
          #>ITE                                  * 8E3F7
          ::                                     * 8E3FC
            #1+                                  * 8E401
            OVER#=                               * 8E406
            ?SKIP                                * 8E40B
            ROMPTR  0EA 03A                      * 8E410
            17PUTLAM                             * 8E41B
          ;                                      * 8E420
          2DROP                                  * 8E425
          ROMPTR  0EA 02C                        * 8E42A
          ROMPTR  0EA 03F                        * 8E435
          LOOP                                   * 8E440
        ;                                        * 8E445

* ROMPTR 0EA 033
* refs (1): 8D288
ROMP_0EA_033:
        ::                                       * 8E44A
          TakeOver                               * 8E44F
          17GETLAM                               * 8E454
          #0=case                                * 8E459
          DoBadKey                               * 8E45E
          GetMat/Vec                             * 8E463
          16GETLAM                               * 8E468
          #0=?SKIP                               * 8E46D
          TRUE                                   * 8E472
          TRUE                                   * 8E477
          3PUTLAM                                * 8E47C
          InitEd&Modes                           * 8E481
        ;                                        * 8E486

* ROMPTR 0EA 034
* refs (1): 8D288
ROMP_0EA_034:
        ::                                       * 8E48B
          20GETLAM                               * 8E490
          #1=                                    * 8E495
          19GETLAM                               * 8E49A
          #1=                                    * 8E49F
          ANDITE                                 * 8E4A4
          ::                                     * 8E4A9
            ERRSET                               * 8E4AE
            ::                                   * 8E4B3
              22Lget                             * 8E4B8
              DUP                                * 8E4BD
              DIMLIMITS                          * 8E4C2
              OBJ_6F261                          * 8E4C7
              ONE{}N                             * 8E4CC
              MATREDIM                           * 8E4D1
            ;                                    * 8E4D6
            ERRTRAP                              * 8E4DB
            ::                                   * 8E4E0
              DropSysObs                         * 8E4E5
              22Lget                             * 8E4EA
            ;                                    * 8E4EF
          ;                                      * 8E4F4
          22Lget                                 * 8E4F9
        ;                                        * 8E4FE

* ROMPTR 0EA 035
* refs (1): 8D288
ROMP_0EA_035:
        ::                                       * 8E503
          DUP#0_DO                               * 8E508
          INDEX@                                 * 8E50D
          #2+PICK                                * 8E512
          DUPTYPEREAL?                           * 8E517
          ITE                                    * 8E51C
          ::                                     * 8E521
            Re>C%                                * 8E526
            INDEX@                               * 8E52B
            #3+                                  * 8E530
            ROLLDROP                             * 8E535
            INDEX@                               * 8E53A
            #2+UNROLL                            * 8E53F
          ;                                      * 8E544
          ::                                     * 8E549
            TYPECMP?                             * 8E54E
            ?SKIP                                * 8E553
            ROMPTR  0EA 02F                      * 8E558
          ;                                      * 8E563
          LOOP                                   * 8E568
        ;                                        * 8E56D

* ROMPTR 0EA 036
* refs (1): 8D288
ROMP_0EA_036:
        ::                                       * 8E572
          9GETLAM                                * 8E577
          21GETLAM                               * 8E57C
          #<>case                                * 8E581
          ROMPTR  0EA 06F                        * 8E586
          18GETLAM                               * 8E591
          #0=case                                * 8E596
          ROMPTR  0EA 06F                        * 8E59B
          BINT1                                  * 8E5A6
          9PUTLAM                                * 8E5AB
          8GETLAM                                * 8E5B0
          #1+                                    * 8E5B5
          8PUTLAM                                * 8E5BA
          ROMPTR  0EA 03A                        * 8E5BF
        ;                                        * 8E5CA

* ROMPTR 0EA 037
* refs (1): 8D288
ROMP_0EA_037:
        ::                                       * 8E5CF
          TakeOver                               * 8E5D4
          SetDA3NoCh                             * 8E5D9
          REPEATER                               * 8E5DE
          BINT16                                 * 8E5E3
          ROMPTR  0EA 06C                        * 8E5E8
        ;                                        * 8E5F3

* ROMPTR 0EA 038
* refs (1): 8D288
ROMP_0EA_038:
        ::                                       * 8E5F8
          SWAP#1-                                * 8E5FD
          21GETLAM                               * 8E602
          #*                                     * 8E607
          #+                                     * 8E60C
        ;                                        * 8E611

* ROMPTR 0EA 039
* refs (1): 8D288
ROMP_0EA_039:
        ::                                       * 8E616
          8GETLAM                                * 8E61B
          20GETLAM                               * 8E620
          #<>case                                * 8E625
          ROMPTR  0EA 06B                        * 8E62A
          18GETLAM                               * 8E635
          #0=case                                * 8E63A
          ROMPTR  0EA 06B                        * 8E63F
          BINT1                                  * 8E64A
          8PUTLAM                                * 8E64F
          9GETLAM                                * 8E654
          #1+                                    * 8E659
          9PUTLAM                                * 8E65E

* ROMPTR 0EA 03A
* refs (1): 8D288
ROMP_0EA_03A:
          ::                                     * 8E663
            BINT2                                * 8E668
            14PUTLAM                             * 8E66D
          ;                                      * 8E672
        ;                                        * 8E677

* ROMPTR 0EA 03B
* refs (1): 8D288
ROMP_0EA_03B:
        ::                                       * 8E67C
          OBJ_44BBB                              * 8E681
          #2=                                    * 8E686
          case2drop                              * 8E68B
          ::                                     * 8E690
            21GETLAM                             * 8E695
            20GETLAM                             * 8E69A
            #*                                   * 8E69F
          ;                                      * 8E6A4
          OBJ_44BBB                              * 8E6A9
          #0=ITE                                 * 8E6AE
          ::                                     * 8E6B3
            SWAP                                 * 8E6B8
            21GETLAM                             * 8E6BD
          ;                                      * 8E6C2
          20GETLAM                               * 8E6C7
          SWAP#1-                                * 8E6CC
          #*                                     * 8E6D1
          #+                                     * 8E6D6
        ;                                        * 8E6DB

* ROMPTR 0EA 03C
* refs (1): 8D288
ROMP_0EA_03C:
        ::                                       * 8E6E0
          'R                                     * 8E6E5
          STO                                    * 8E6EA
        ;                                        * 8E6EF

* ROMPTR 0EA 03D
* refs (1): 8D288
ROMP_0EA_03D:
        ::                                       * 8E6F4
          RowElt#                                * 8E6F9
          PULLEL                                 * 8E6FE
          SWAPDROP                               * 8E703
        ;                                        * 8E708

* ROMPTR 0EA 03E
* refs (1): 8D288
ROMP_0EA_03E:
        ::                                       * 8E70D
          22Lget                                 * 8E712
          3UNROLL                                * 8E717
          GetElt                                 * 8E71C
          DECOMP$                                * 8E721
          CHR_Space                              * 8E726
          >H$                                    * 8E72B
          OBJ_44B9B                              * 8E730
          OVERLEN$                               * 8E735
          2DUP                                   * 8E73A
          #<case                                 * 8E73F
          ::                                     * 8E744
            DROP                                 * 8E749
            1_#1-SUB$                            * 8E74E
            CHR_...                              * 8E753
            >T$                                  * 8E758
          ;                                      * 8E75D
          #-                                     * 8E762
          Blank$                                 * 8E767
          SWAP&$                                 * 8E76C
        ;                                        * 8E771

* ROMPTR 0EA 03F
* refs (1): 8D288
ROMP_0EA_03F:
        ::                                       * 8E776
          OBJ_44BBB                              * 8E77B
          #0=case                                * 8E780
          ROMPTR  0EA 036                        * 8E785
          OBJ_44BBB                              * 8E790
          #1=case                                * 8E795
          ROMPTR  0EA 039                        * 8E79A
        ;                                        * 8E7A5

* ROMPTR 0EA 040
* refs (1): 8D288
ROMP_0EA_040:
        ::                                       * 8E7AA
          ROMPTR  0EA 012                        * 8E7AF

* ROMPTR 0EA 041
* refs (1): 8D288
ROMP_0EA_041:
          ::                                     * 8E7BA

* ROMPTR 0EA 042
* refs (1): 8D288
ROMP_0EA_042:
            ::                                   * 8E7BF
              9GETLAM                            * 8E7C4
              DUP                                * 8E7C9
              13GETLAM                           * 8E7CE
              #<case                             * 8E7D3
              ::                                 * 8E7D8
                DUP                              * 8E7DD
                13PUTLAM                         * 8E7E2
                ROMPTR  0EA 018                  * 8E7E7
                #+                               * 8E7F2
                11PUTLAM                         * 8E7F7
              ;                                  * 8E7FC
              DUP                                * 8E801
              11GETLAM                           * 8E806
              #>case                             * 8E80B
              ::                                 * 8E810
                DUP                              * 8E815
                11PUTLAM                         * 8E81A
                ROMPTR  0EA 018                  * 8E81F
                #-                               * 8E82A
                13PUTLAM                         * 8E82F
              ;                                  * 8E834
              DROP                               * 8E839
            ;                                    * 8E83E

* ROMPTR 0EA 043
* refs (1): 8D288
ROMP_0EA_043:
            ::                                   * 8E843
              8GETLAM                            * 8E848
              DUP                                * 8E84D
              12GETLAM                           * 8E852
              #<case                             * 8E857
              ::                                 * 8E85C
                DUP                              * 8E861
                12PUTLAM                         * 8E866
                #4+                              * 8E86B
                10PUTLAM                         * 8E870
              ;                                  * 8E875
              DUP                                * 8E87A
              10GETLAM                           * 8E87F
              #>case                             * 8E884
              ::                                 * 8E889
                DUP                              * 8E88E
                10PUTLAM                         * 8E893
                #4-                              * 8E898
                12PUTLAM                         * 8E89D
              ;                                  * 8E8A2
              DROP                               * 8E8A7
            ;                                    * 8E8AC
            ROMPTR  0EA 045                      * 8E8B1
            ROMPTR  0EA 046                      * 8E8BC
          ;                                      * 8E8C7
          SetDA3NoCh                             * 8E8CC
        ;                                        * 8E8D1

* ROMPTR 0EA 044
* refs (1): 8D288
ROMP_0EA_044:
        ::                                       * 8E8D6
          HARDBUFF                               * 8E8DB
          11GETLAM                               * 8E8E0
          13GETLAM                               * 8E8E5
          #1--                                   * 8E8EA
          ROMPTR  0EA 015                        * 8E8EF
          #*                                     * 8E8FA
          #12+                                   * 8E8FF
          BINT0                                  * 8E904
          BINT131                                * 8E909
          BINT46                                 * 8E90E
          GROB!ZERODRP                           * 8E913
        ;                                        * 8E918

* ROMPTR 0EA 045
* refs (1): 8D288
ROMP_0EA_045:
        ::                                       * 8E91D
          9GETLAM                                * 8E922
          13GETLAM                               * 8E927
          #-                                     * 8E92C
          ROMPTR  0EA 015                        * 8E931
          #*                                     * 8E93C
          #12+                                   * 8E941
          DUP                                    * 8E946
          7PUTLAM                                * 8E94B
          ROMPTR  0EA 015                        * 8E950
          #+                                     * 8E95B
          5PUTLAM                                * 8E960
        ;                                        * 8E965

* ROMPTR 0EA 046
* refs (1): 8D288
ROMP_0EA_046:
        ::                                       * 8E96A
          8GETLAM                                * 8E96F
          12GETLAM                               * 8E974
          #-                                     * 8E979
          #8*                                    * 8E97E
          BINT6                                  * 8E983
          #+DUP                                  * 8E988
          6PUTLAM                                * 8E98D
          #8+                                    * 8E992
          4PUTLAM                                * 8E997
        ;                                        * 8E99C

* ROMPTR 0EA 047
* refs (1): 8D288
ROMP_0EA_047:
        ::                                       * 8E9A1
          ROMPTR  0EA 00B                        * 8E9A6
          ROMPTR  0EA 011                        * 8E9B1
          SetDA123NoCh                           * 8E9BC
        ;                                        * 8E9C1

* ROMPTR 0EA 048
* refs (1): 8D288
ROMP_0EA_048:
        ::                                       * 8E9C6
          NoExitAction                           * 8E9CB
          {                                      * 8E9D0
            {                                    * 8E9D5
              $       "EDIT"                     * 8E9DA
              ROMPTR  0EA 05A                    * 8E9EC
            }                                    * 8E9F7
            {                                    * 8E9FC
              ROMPTR  0EA 04C                    * 8EA01
              ROMPTR  0EA 050                    * 8EA0C
            }                                    * 8EA17
            {                                    * 8EA1C
              $       "←WID"                     * 8EA21
              ROMPTR  0EA 05C                    * 8EA33
            }                                    * 8EA3E
            {                                    * 8EA43
              $       "WID→"                     * 8EA48
              ROMPTR  0EA 062                    * 8EA5A
            }                                    * 8EA65
            {                                    * 8EA6A
              ROMPTR  0EA 04A                    * 8EA6F
              ROMPTR  0EA 04D                    * 8EA7A
            }                                    * 8EA85
            {                                    * 8EA8A
              ROMPTR  0EA 04B                    * 8EA8F
              ROMPTR  0EA 04E                    * 8EA9A
            }                                    * 8EAA5
            {                                    * 8EAAA
              $       "+ROW"                     * 8EAAF
              ROMPTR  0EA 060                    * 8EAC1
            }                                    * 8EACC
            {                                    * 8EAD1
              $       "-ROW"                     * 8EAD6
              ROMPTR  0EA 056                    * 8EAE8
            }                                    * 8EAF3
            {                                    * 8EAF8
              $       "+COL"                     * 8EAFD
              ROMPTR  0EA 061                    * 8EB0F
            }                                    * 8EB1A
            {                                    * 8EB1F
              $       "-COL"                     * 8EB24
              ROMPTR  0EA 05F                    * 8EB36
            }                                    * 8EB41
            {                                    * 8EB46
              $       "→STK"                     * 8EB4B
              ROMPTR  0EA 049                    * 8EB5D
            }                                    * 8EB68
            {                                    * 8EB6D
              $       "↑STK"                     * 8EB72
              OBJ_4365D                          * 8EB84
            }                                    * 8EB89
          }                                      * 8EB8E
        ;                                        * 8EB93

* ROMPTR 0EA 049
* refs (1): 8D288
ROMP_0EA_049:
        ::                                       * 8EB98
          ComLine?:(bip;q)                       * 8EB9D
          22Lget                                 * 8EBA2
          8GETLAM                                * 8EBA7
          9GETLAM                                * 8EBAC
          ROMPTR  0EA 01E                        * 8EBB1
          SetDA123NoCh                           * 8EBBC
          DUPTYPECSTR?                           * 8EBC1
          caseDrpBadKy                           * 8EBC6
          AtUserStack                            * 8EBCB
        ;                                        * 8EBD0

* ROMPTR 0EA 04A
* refs (1): 8D288
ROMP_0EA_04A:
        ::                                       * 8EBD5
          TakeOver                               * 8EBDA
          $       "GO→"                          * 8EBDF
          OBJ_44BBB                              * 8EBEF
          #0=                                    * 8EBF4
          Box/StdLabel                           * 8EBF9
        ;                                        * 8EBFE

* ROMPTR 0EA 04B
* refs (1): 8D288
ROMP_0EA_04B:
        ::                                       * 8EC03
          TakeOver                               * 8EC08
          $       "GO↓"                          * 8EC0D
          OBJ_44BBB                              * 8EC1D
          #1=                                    * 8EC22
          Box/StdLabel                           * 8EC27
        ;                                        * 8EC2C

* ROMPTR 0EA 04C
* refs (1): 8D288
ROMP_0EA_04C:
        ::                                       * 8EC31
          TakeOver                               * 8EC36
          $       "VEC"                          * 8EC3B
          19GETLAM                               * 8EC4B
          #1=                                    * 8EC50
          Box/StdLabel                           * 8EC55
        ;                                        * 8EC5A

* ROMPTR 0EA 04D
* refs (1): 8D288
ROMP_0EA_04D:
        ::                                       * 8EC5F
          TakeOver                               * 8EC64
          OBJ_44BBB                              * 8EC69
          #0=ITE                                 * 8EC6E
          BINT2                                  * 8EC73
          BINT0                                  * 8EC78
          OBJ_44BCB                              * 8EC7D
          ROMPTR  0EA 04F                        * 8EC82
        ;                                        * 8EC8D

* ROMPTR 0EA 04E
* refs (1): 8D288
ROMP_0EA_04E:
        ::                                       * 8EC92
          TakeOver                               * 8EC97
          OBJ_44BBB                              * 8EC9C
          #1=                                    * 8ECA1
          ITE                                    * 8ECA6
          BINT2                                  * 8ECAB
          BINT1                                  * 8ECB0
          OBJ_44BCB                              * 8ECB5
          ROMPTR  0EA 04F                        * 8ECBA
        ;                                        * 8ECC5

* ROMPTR 0EA 04F
* refs (1): 8D288
ROMP_0EA_04F:
        ::                                       * 8ECCA
          20GETLAM                               * 8ECCF
          21GETLAM                               * 8ECD4
          #*                                     * 8ECD9
          DUP#0=                                 * 8ECDE
          ?SKIP                                  * 8ECE3
          ::                                     * 8ECE8
            BINT1                                * 8ECED
            18PUTLAM                             * 8ECF2
          ;                                      * 8ECF7
          17GETLAM                               * 8ECFC
          OVER#<                                 * 8ED01
          case                                   * 8ED06
          ::                                     * 8ED0B
            17PUTLAM                             * 8ED10
            ROMPTR  0EA 040                      * 8ED15
          ;                                      * 8ED20
          DROP                                   * 8ED25
          SetDA12NoCh                            * 8ED2A
        ;                                        * 8ED2F

* ROMPTR 0EA 050
* refs (1): 8D288
ROMP_0EA_050:
        ::                                       * 8ED34
          TakeOver                               * 8ED39
          19GETLAM                               * 8ED3E
          #0=ITE                                 * 8ED43
          BINT1                                  * 8ED48
          BINT0                                  * 8ED4D
          19PUTLAM                               * 8ED52
          SetDA12NoCh                            * 8ED57
        ;                                        * 8ED5C

* ROMPTR 0EA 051
* refs (1): 8D288
ROMP_0EA_051:
        ::                                       * 8ED61
          16GETLAM                               * 8ED66
          19GETLAM                               * 8ED6B

* ROMPTR 0EA 052
* refs (1): 8D288
ROMP_0EA_052:
          ::                                     * 8ED70

* ROMPTR 0EA 053
* refs (1): 8D288
ROMP_0EA_053:
            ::                                   * 8ED75
              OBJ_44B9B                          * 8ED7A
              #0=                                * 8ED7F
              NOT?SEMI                           * 8ED84
              BINT5                              * 8ED89
              OBJ_44BAB                          * 8ED8E
            ;                                    * 8ED93
            NULL{}                               * 8ED98
            OBJ_6D909                            * 8ED9D
            OBJ_6DD6E                            * 8EDA2

* ROMPTR 0EA 054
* refs (1): 8D288
ROMP_0EA_054:
            ::                                   * 8EDA7
              RCLSYSF                            * 8EDAC
              BINT0                              * 8EDB1
              ONEONE                             * 8EDB6
              ROMPTR  0EA 018                    * 8EDBB
              3PICK#+                            * 8EDC6
              BINT5                              * 8EDCB
              ONEONE                             * 8EDD0
              BINT12                             * 8EDD5
              BINT6                              * 8EDDA
              ROMPTR  0EA 015                    * 8EDDF
              #12+                               * 8EDEA
              BINT14                             * 8EDEF
              FALSE                              * 8EDF4
              BINT0                              * 8EDF9
            ;                                    * 8EDFE
          ;                                      * 8EE03
          ROMPTR  0EA 00C                        * 8EE08
          19PUTLAM                               * 8EE13
          16PUTLAM                               * 8EE18
        ;                                        * 8EE1D

* ROMPTR 0EA 055
* refs (1): 8D288
ROMP_0EA_055:
        ::                                       * 8EE22
          TakeOver                               * 8EE27
          SetDA3NoCh                             * 8EE2C
          REPEATER                               * 8EE31
          BINT11                                 * 8EE36
          ROMPTR  0EA 067                        * 8EE3B
        ;                                        * 8EE46

* ROMPTR 0EA 056
* refs (1): 8D288
ROMP_0EA_056:
        ::                                       * 8EE4B
          ComLine?:(bip;q)                       * 8EE50
          8GETLAM                                * 8EE55
          20GETLAM                               * 8EE5A
          #>case                                 * 8EE5F
          DoBadKey                               * 8EE64
          #       503                            * 8EE69  1283
          JstGetTHEMESG                          * 8EE73
          BigDisp1(st)                           * 8EE78
          20GETLAM                               * 8EE7D
          #1=case                                * 8EE82
          ROMPTR  0EA 051                        * 8EE87
          22Lget                                 * 8EE92
          8GETLAM                                * 8EE97
          20GETLAM                               * 8EE9C
          #=?SKIP                                * 8EEA1

* ROMPTR 0EA 057
* refs (1): 8D288
ROMP_0EA_057:
          ::                                     * 8EEA6
            20GETLAM                             * 8EEAB
            #1+                                  * 8EEB0
            8GETLAM                              * 8EEB5
            #1+                                  * 8EEBA
            DO                                   * 8EEBF
            INDEX@                               * 8EEC4
            SWAP                                 * 8EEC9
            21GETLAM                             * 8EECE
            #1+_ONE_DO                           * 8EED3
            2DUPSWAP                             * 8EED8
            INDEX@                               * 8EEDD
            GetElt                               * 8EEE2
            3PICK                                * 8EEE7
            #1-                                  * 8EEEC
            INDEX@                               * 8EEF1
            RowElt#                              * 8EEF6
            ROT                                  * 8EEFB
            BANGARRY                             * 8EF00
            ?ATTNQUIT                            * 8EF05
            LOOP                                 * 8EF0A
            SWAPDROP                             * 8EF0F
            LOOP                                 * 8EF14
          ;                                      * 8EF19
          20GETLAM                               * 8EF1E
          #1-                                    * 8EF23
          21GETLAM                               * 8EF28
          TWO{}N                                 * 8EF2D
          MATREDIM                               * 8EF32
          22PUTLAM                               * 8EF37
          20GETLAM                               * 8EF3C
          #1-                                    * 8EF41
          20PUTLAM                               * 8EF46
          ROMPTR  0EA 031                        * 8EF4B
          ROMPTR  0EA 040                        * 8EF56
        ;                                        * 8EF61

* ROMPTR 0EA 058
* refs (1): 8D288
ROMP_0EA_058:
        ::                                       * 8EF66
          ROMPTR  0EA 012                        * 8EF6B
          9GETLAM                                * 8EF76
          13GETLAM                               * 8EF7B
          #-                                     * 8EF80
          ROMPTR  0EA 015                        * 8EF85
          #*                                     * 8EF90
          #12+                                   * 8EF95
          DUP                                    * 8EF9A
          7PUTLAM                                * 8EF9F
          ROMPTR  0EA 015                        * 8EFA4
          #+                                     * 8EFAF
          5PUTLAM                                * 8EFB4
          ROMPTR  0EA 00A                        * 8EFB9
          ROMPTR  0EA 044                        * 8EFC4
          ROMPTR  0EA 00E                        * 8EFCF
          ROMPTR  0EA 047                        * 8EFDA
        ;                                        * 8EFE5

* ROMPTR 0EA 059
* refs (1): 8D288
ROMP_0EA_059:
        ::                                       * 8EFEA
          21GETLAM                               * 8EFEF
          #1+                                    * 8EFF4
          9GETLAM                                * 8EFF9
          #1+                                    * 8EFFE
          DO                                     * 8F003
          INDEX@                                 * 8F008
          SWAP                                   * 8F00D
          20GETLAM                               * 8F012
          #1+_ONE_DO                             * 8F017
          2DUPSWAP                               * 8F01C
          INDEX@                                 * 8F021
          SWAP                                   * 8F026
          GetElt                                 * 8F02B
          3PICK                                  * 8F030
          #1-                                    * 8F035
          INDEX@                                 * 8F03A
          SWAP                                   * 8F03F
          RowElt#                                * 8F044
          ROT                                    * 8F049
          BANGARRY                               * 8F04E
          ?ATTNQUIT                              * 8F053
          LOOP                                   * 8F058
          SWAPDROP                               * 8F05D
          LOOP                                   * 8F062
        ;                                        * 8F067

* ROMPTR 0EA 05A
* refs (1): 8D288
ROMP_0EA_05A:
        ::                                       * 8F06C
          ComLine?:(bip;q)                       * 8F071
          8GETLAM                                * 8F076
          9GETLAM                                * 8F07B
          ROMPTR  0EA 03B                        * 8F080
          17GETLAM                               * 8F08B
          #>                                     * 8F090
          8GETLAM                                * 8F095
          20GETLAM                               * 8F09A
          #>                                     * 8F09F
          9GETLAM                                * 8F0A4
          21GETLAM                               * 8F0A9
          #>                                     * 8F0AE
          OR                                     * 8F0B3
          OR                                     * 8F0B8
          ITE                                    * 8F0BD
          NULL$                                  * 8F0C2
          ::                                     * 8F0C7
            22Lget                               * 8F0CC
            8GETLAM                              * 8F0D1
            9GETLAM                              * 8F0D6
            ROMPTR  0EA 01E                      * 8F0DB
            EDITDECOMP$                          * 8F0E6
          ;                                      * 8F0EB
          InitEd&Modes                           * 8F0F0
          EditString                             * 8F0F5
        ;                                        * 8F0FA

* ROMPTR 0EA 05B
* refs (1): 8D288
ROMP_0EA_05B:
        ::                                       * 8F0FF
          20GETLAM                               * 8F104
          #1+                                    * 8F109
          8GETLAM                                * 8F10E
          #-                                     * 8F113
          ONE_DO                                 * 8F118
          20GETLAM                               * 8F11D
          INDEX@                                 * 8F122
          #-SWAP                                 * 8F127
          21GETLAM                               * 8F12C
          #1+_ONE_DO                             * 8F131
          2DUPSWAP                               * 8F136
          INDEX@                                 * 8F13B
          GetElt                                 * 8F140
          3pick;1+(s)                            * 8F145
          INDEX@                                 * 8F14A
          RowElt#                                * 8F14F
          ROT                                    * 8F154
          BANGARRY                               * 8F159
          ?ATTNQUIT                              * 8F15E
          LOOP                                   * 8F163
          SWAPDROP                               * 8F168
          LOOP                                   * 8F16D
          8GETLAM                                * 8F172
          SWAP                                   * 8F177
          21GETLAM                               * 8F17C
          #1+_ONE_DO                             * 8F181
          OVERINDEX@                             * 8F186
          RowElt#                                * 8F18B
          OVER                                   * 8F190
          TYPECARRY?                             * 8F195
          ITE                                    * 8F19A
          C%0                                    * 8F19F
          %0_2A2B4                               * 8F1A4
          SWAPROT                                * 8F1A9
          BANGARRY                               * 8F1AE
          ?ATTNQUIT                              * 8F1B3
          LOOP                                   * 8F1B8
          SWAPDROP                               * 8F1BD
        ;                                        * 8F1C2

* ROMPTR 0EA 05C
* refs (1): 8D288
ROMP_0EA_05C:
        ::                                       * 8F1C7
          ComLine?:(bip;q)                       * 8F1CC
          OBJ_44B9B                              * 8F1D1
          BINT5                                  * 8F1D6
          #<case                                 * 8F1DB
          DoBadKey                               * 8F1E0
          ROMPTR  0EA 018                        * 8F1E5
          DUP                                    * 8F1F0
          #2+                                    * 8F1F5

* ROMPTR 0EA 05D
* refs (1): 8D288
ROMP_0EA_05D:
          ::                                     * 8F1FA
            BINT20                               * 8F1FF
            SWAP                                 * 8F204
            #/                                   * 8F209
            SWAPDROP                             * 8F20E
          ;                                      * 8F213
          OBJ_44BAB                              * 8F218
          #1+                                    * 8F21D
          11GETLAM                               * 8F222
          SWAP#-                                 * 8F227
          DUP#0=IT                               * 8F22C
          ::                                     * 8F231
            #1+                                  * 8F236
            11GETLAM                             * 8F23B
            #1+                                  * 8F240
            11PUTLAM                             * 8F245
          ;                                      * 8F24A
          13PUTLAM                               * 8F24F
          ROMPTR  0EA 058                        * 8F254
        ;                                        * 8F25F

* ROMPTR 0EA 05E
* refs (1): 8D288
ROMP_0EA_05E:
        ::                                       * 8F264
          21GETLAM                               * 8F269
          #1+                                    * 8F26E
          9GETLAM                                * 8F273
          #-                                     * 8F278
          ONE_DO                                 * 8F27D
          21GETLAM                               * 8F282
          INDEX@                                 * 8F287
          #-SWAP                                 * 8F28C
          20GETLAM                               * 8F291
          #1+_ONE_DO                             * 8F296
          2DUPSWAP                               * 8F29B
          INDEX@                                 * 8F2A0
          SWAP                                   * 8F2A5
          GetElt                                 * 8F2AA
          3pick;1+(s)                            * 8F2AF
          INDEX@                                 * 8F2B4
          SWAP                                   * 8F2B9
          RowElt#                                * 8F2BE
          ROT                                    * 8F2C3
          BANGARRY                               * 8F2C8
          ?ATTNQUIT                              * 8F2CD
          LOOP                                   * 8F2D2
          SWAPDROP                               * 8F2D7
          LOOP                                   * 8F2DC
          9GETLAM                                * 8F2E1
          SWAP                                   * 8F2E6
          20GETLAM                               * 8F2EB
          #1+_ONE_DO                             * 8F2F0
          OVERINDEX@                             * 8F2F5
          SWAP                                   * 8F2FA
          RowElt#                                * 8F2FF
          OVER                                   * 8F304
          TYPECARRY?                             * 8F309
          ITE                                    * 8F30E
          C%0                                    * 8F313
          %0_2A2B4                               * 8F318
          SWAPROT                                * 8F31D
          BANGARRY                               * 8F322
          ?ATTNQUIT                              * 8F327
          LOOP                                   * 8F32C
          SWAPDROP                               * 8F331
        ;                                        * 8F336

* ROMPTR 0EA 05F
* refs (1): 8D288
ROMP_0EA_05F:
        ::                                       * 8F33B
          ComLine?:(bip;q)                       * 8F340
          9GETLAM                                * 8F345
          21GETLAM                               * 8F34A
          #>case                                 * 8F34F
          DoBadKey                               * 8F354
          #       504                            * 8F359  1284
          JstGetTHEMESG                          * 8F363
          BigDisp1(st)                           * 8F368
          21GETLAM                               * 8F36D
          #1=case                                * 8F372
          ROMPTR  0EA 051                        * 8F377
          22Lget                                 * 8F382
          9GETLAM                                * 8F387
          21GETLAM                               * 8F38C
          #=?SKIP                                * 8F391
          CopyColsLeft                           * 8F396
          MATTRN                                 * 8F39B
          21GETLAM                               * 8F3A0
          #1-                                    * 8F3A5
          20GETLAM                               * 8F3AA
          TWO{}N                                 * 8F3AF
          MATREDIM                               * 8F3B4
          MATTRN                                 * 8F3B9
          22PUTLAM                               * 8F3BE
          21GETLAM                               * 8F3C3
          #1-                                    * 8F3C8
          21PUTLAM                               * 8F3CD
          ROMPTR  0EA 031                        * 8F3D2
          ROMPTR  0EA 040                        * 8F3DD
        ;                                        * 8F3E8

* ROMPTR 0EA 060
* refs (1): 8D288
ROMP_0EA_060:
        ::                                       * 8F3ED
          ComLine?:(bip;q)                       * 8F3F2
          20GETLAM                               * 8F3F7
          #0=                                    * 8F3FC
          caseDoBadKey                           * 8F401
          BINT1                                  * 8F406
          18PUTLAM                               * 8F40B
          #       505                            * 8F410  1285
          JstGetTHEMESG                          * 8F41A
          BigDisp1(st)                           * 8F41F
          22Lget                                 * 8F424
          20GETLAM                               * 8F429
          #1+                                    * 8F42E
          21GETLAM                               * 8F433
          TWO{}N                                 * 8F438
          MATREDIM                               * 8F43D
          20GETLAM                               * 8F442
          #1+                                    * 8F447
          20PUTLAM                               * 8F44C
          8GETLAM                                * 8F451
          20GETLAM                               * 8F456
          #=?SKIP                                * 8F45B
          CopyRowsDown                           * 8F460
          22PUTLAM                               * 8F465
          ROMPTR  0EA 031                        * 8F46A
          ROMPTR  0EA 040                        * 8F475
        ;                                        * 8F480

* ROMPTR 0EA 061
* refs (1): 8D288
ROMP_0EA_061:
        ::                                       * 8F485
          ComLine?:(bip;q)                       * 8F48A
          21GETLAM                               * 8F48F
          #0=                                    * 8F494
          caseDoBadKey                           * 8F499
          BINT1                                  * 8F49E
          18PUTLAM                               * 8F4A3
          #       506                            * 8F4A8  1286
          JstGetTHEMESG                          * 8F4B2
          BigDisp1(st)                           * 8F4B7
          22Lget                                 * 8F4BC
          MATTRN                                 * 8F4C1
          21GETLAM                               * 8F4C6
          #1+                                    * 8F4CB
          20GETLAM                               * 8F4D0
          TWO{}N                                 * 8F4D5
          MATREDIM                               * 8F4DA
          MATTRN                                 * 8F4DF
          21GETLAM                               * 8F4E4
          #1+                                    * 8F4E9
          21PUTLAM                               * 8F4EE
          9GETLAM                                * 8F4F3
          21GETLAM                               * 8F4F8
          #=?SKIP                                * 8F4FD
          CopyColsRght                           * 8F502
          22PUTLAM                               * 8F507
          ROMPTR  0EA 031                        * 8F50C
          ROMPTR  0EA 040                        * 8F517
        ;                                        * 8F522

* ROMPTR 0EA 062
* refs (1): 8D288
ROMP_0EA_062:
        ::                                       * 8F527
          ComLine?:(bip;q)                       * 8F52C
          OBJ_44B9B                              * 8F531
          BINT19                                 * 8F536
          #>case                                 * 8F53B
          DoBadKey                               * 8F540
          ROMPTR  0EA 018                        * 8F545
          DUP                                    * 8F550
          ROMPTR  0EA 05D                        * 8F555
          OBJ_44BAB                              * 8F560
          #1-                                    * 8F565
          13GETLAM                               * 8F56A
          #+                                     * 8F56F
          9GETLAM                                * 8F574
          OVER#>                                 * 8F579
          IT                                     * 8F57E
          ::                                     * 8F583
            #1+                                  * 8F588
            13GETLAM                             * 8F58D
            #1+                                  * 8F592
            13PUTLAM                             * 8F597
          ;                                      * 8F59C
          11PUTLAM                               * 8F5A1
          ROMPTR  0EA 058                        * 8F5A6
        ;                                        * 8F5B1

* ROMPTR 0EA 063
* refs (1): 8D288
ROMP_0EA_063:
        ::                                       * 8F5B6
          TakeOver                               * 8F5BB
          ROMP_0A1_00C                           * 8F5C0
          SetDA1NoCh                             * 8F5C5
        ;                                        * 8F5CA

* ROMPTR 0EA 064
* refs (1): 8D288
ROMP_0EA_064:
        ::                                       * 8F5CF
          TakeOver                               * 8F5D4
          ROMP_0A3_026                           * 8F5D9
          SetDA1NoCh                             * 8F5DE
        ;                                        * 8F5E3

* ROMPTR 0EA 065
* refs (1): 8D288
ROMP_0EA_065:
        ::                                       * 8F5E8
          TakeOver                               * 8F5ED
          '                                      * 8F5F2
          ROMPTR  0EA 048                        * 8F5F7
          InitMenu                               * 8F602
        ;                                        * 8F607

* ROMPTR 0EA 066
* refs (1): 8D288
ROMP_0EA_066:
        ::                                       * 8F60C
          TakeOver                               * 8F611
          OBJ_3D8C6                              * 8F616
        ;                                        * 8F61B

* ROMPTR 0EA 067
* refs (1): 8D288
ROMP_0EA_067:
        ::                                       * 8F620
          8GETLAM                                * 8F625
          #1-DUP                                 * 8F62A
          #0=                                    * 8F62F
          caseDrpBadKy                           * 8F634
          ROMPTR  0EA 012                        * 8F639
          DUP                                    * 8F644
          8PUTLAM                                * 8F649
          DUP                                    * 8F64E
          12GETLAM                               * 8F653
          #<ITE                                  * 8F658
          ::                                     * 8F65D
            12PUTLAM                             * 8F662
            10GETLAM                             * 8F667
            #1-                                  * 8F66C
            10PUTLAM                             * 8F671
            HARDBUFF                             * 8F676
            BINT0                                * 8F67B
            BINT6                                * 8F680

* ROMPTR 0EA 068
* refs (1): 8D288
ROMP_0EA_068:
            #       84                           * 8F685  132
            BINT38                               * 8F68F
            SUBGROB                              * 8F694
            HARDBUFF                             * 8F699
            BINT0                                * 8F69E
            BINT14                               * 8F6A3
            GROB!                                * 8F6A8
            12GETLAM                             * 8F6AD
            DUP                                  * 8F6B2
            ROMPTR  0EA 024                      * 8F6B7
            ROMPTR  0EA 015                      * 8F6C2
            11GETLAM                             * 8F6CD
            #1+                                  * 8F6D2
            13GETLAM                             * 8F6D7
            DO                                   * 8F6DC
            DUPINDEX@                            * 8F6E1
            13GETLAM                             * 8F6E6
            #-                                   * 8F6EB
            #*                                   * 8F6F0
            #12+                                 * 8F6F5
            2DUP#+                               * 8F6FA
            12GETLAM                             * 8F6FF
            INDEX@                               * 8F704
            ROMPTR  0EA 025                      * 8F709
            $>GROB                               * 8F714
            ROMPTR  0EA 016                      * 8F719
            BINT6                                * 8F724
            7PICK                                * 8F729
            BINT8                                * 8F72E
            SWAP                                 * 8F733
            MAKEGROB                             * 8F738
            7PICK                                * 8F73D
            HARDBUFF                             * 8F742
            SWAP                                 * 8F747
            BINT6                                * 8F74C
            GROB!                                * 8F751
            GROB!                                * 8F756
            2DROP                                * 8F75B
            LOOP                                 * 8F760
            DROP                                 * 8F765
          ;                                      * 8F76A
          ::                                     * 8F76F
            DROP                                 * 8F774
            6GETLAM                              * 8F779
            DUP                                  * 8F77E
            4PUTLAM                              * 8F783
            BINT8                                * 8F788
            #-                                   * 8F78D
            6PUTLAM                              * 8F792
          ;                                      * 8F797
          ROMPTR  0EA 047                        * 8F79C
        ;                                        * 8F7A7

* ROMPTR 0EA 069
* refs (1): 8D288
ROMP_0EA_069:
        ::                                       * 8F7AC
          17GETLAM                               * 8F7B1
          #0=                                    * 8F7B6
          8GETLAM                                * 8F7BB
          20GETLAM                               * 8F7C0
          #>                                     * 8F7C5
          OR                                     * 8F7CA
          caseDoBadKey                           * 8F7CF
          OBJ_44BBB                              * 8F7D4
          #0=                                    * 8F7D9
          18GETLAM                               * 8F7DE
          #0=                                    * 8F7E3
          ANDcase                                * 8F7E8
          ::                                     * 8F7ED
            ONEONE                               * 8F7F2
            20PUTLAM                             * 8F7F7
            9PUTLAM                              * 8F7FC
            BINT2                                * 8F801
            8PUTLAM                              * 8F806

* ROMPTR 0EA 06A
* refs (1): 8D288
ROMP_0EA_06A:
            ::                                   * 8F80B
              BINT1                              * 8F810
              18PUTLAM                           * 8F815
              ROMPTR  0EA 040                    * 8F81A
            ;                                    * 8F825
          ;                                      * 8F82A
          ROMPTR  0EA 012                        * 8F82F

* ROMPTR 0EA 06B
* refs (1): 8D288
ROMP_0EA_06B:
          ::                                     * 8F83A
            8GETLAM                              * 8F83F
            #1+DUP                               * 8F844
            8PUTLAM                              * 8F849
            DUP                                  * 8F84E
            10GETLAM                             * 8F853
            #>case                               * 8F858
            ::                                   * 8F85D
              10PUTLAM                           * 8F862
              12GETLAM                           * 8F867
              #1+                                * 8F86C
              12PUTLAM                           * 8F871
              HARDBUFF                           * 8F876
              BINT0                              * 8F87B
              BINT14                             * 8F880
              BINT131                            * 8F885
              BINT46                             * 8F88A
              SUBGROB                            * 8F88F
              HARDBUFF                           * 8F894
              BINT0                              * 8F899
              BINT6                              * 8F89E
              GROB!                              * 8F8A3
              10GETLAM                           * 8F8A8
              DUP                                * 8F8AD
              ROMPTR  0EA 024                    * 8F8B2
              ROMPTR  0EA 015                    * 8F8BD
              11GETLAM                           * 8F8C8
              #1+                                * 8F8CD
              13GETLAM                           * 8F8D2
              DO                                 * 8F8D7
              DUPINDEX@                          * 8F8DC
              13GETLAM                           * 8F8E1
              #-                                 * 8F8E6
              #*                                 * 8F8EB
              #12+                               * 8F8F0
              2DUP#+                             * 8F8F5
              10GETLAM                           * 8F8FA
              INDEX@                             * 8F8FF
              ROMPTR  0EA 025                    * 8F904
              $>GROB                             * 8F90F
              ROMPTR  0EA 016                    * 8F914
              BINT38                             * 8F91F
              7PICK                              * 8F924
              BINT8                              * 8F929
              SWAP                               * 8F92E
              MAKEGROB                           * 8F933
              7PICK                              * 8F938
              HARDBUFF                           * 8F93D
              SWAP                               * 8F942
              #       26                         * 8F947  38
              GROB!                              * 8F951
              GROB!                              * 8F956
              2DROP                              * 8F95B
              LOOP                               * 8F960
              DROP                               * 8F965
            ;                                    * 8F96A
            DROP                                 * 8F96F
            4GETLAM                              * 8F974
            DUP                                  * 8F979
            6PUTLAM                              * 8F97E
            #8+                                  * 8F983
            4PUTLAM                              * 8F988
          ;                                      * 8F98D
          ROMPTR  0EA 047                        * 8F992
        ;                                        * 8F99D

* ROMPTR 0EA 06C
* refs (1): 8D288
ROMP_0EA_06C:
        ::                                       * 8F9A2
          9GETLAM                                * 8F9A7
          #1-DUP                                 * 8F9AC
          #0=case                                * 8F9B1
          DropBadKey                             * 8F9B6
          ROMPTR  0EA 012                        * 8F9BB
          DUP                                    * 8F9C6
          9PUTLAM                                * 8F9CB
          DUP                                    * 8F9D0
          13GETLAM                               * 8F9D5
          #<ITE                                  * 8F9DA
          ::                                     * 8F9DF
            13PUTLAM                             * 8F9E4
            11GETLAM                             * 8F9E9
            #1-                                  * 8F9EE
            11PUTLAM                             * 8F9F3
            HARDBUFF                             * 8F9F8
            BINT24                               * 8F9FD
            BINT0                                * 8FA02
            11GETLAM                             * 8FA07
            13GETLAM                             * 8FA0C
            #-                                   * 8FA11
            ROMPTR  0EA 015                      * 8FA16
            #*                                   * 8FA21
            #12+                                 * 8FA26
            BINT6                                * 8FA2B
            SUBGROB                              * 8FA30
            HARDBUFF                             * 8FA35
            ROMPTR  0EA 015                      * 8FA3A
            BINT24                               * 8FA45
            #+                                   * 8FA4A
            BINT0                                * 8FA4F
            GROB!                                * 8FA54
            HARDBUFF                             * 8FA59
            BINT12                               * 8FA5E
            BINT6                                * 8FA63
            11GETLAM                             * 8FA68
            13GETLAM                             * 8FA6D
            #-                                   * 8FA72
            ROMPTR  0EA 015                      * 8FA77
            #*                                   * 8FA82
            #12+                                 * 8FA87
            BINT46                               * 8FA8C
            SUBGROB                              * 8FA91
            HARDBUFF                             * 8FA96
            ROMPTR  0EA 015                      * 8FA9B
            #12+                                 * 8FAA6
            BINT6                                * 8FAAB
            GROB!                                * 8FAB0
            13GETLAM                             * 8FAB5
            DUP                                  * 8FABA
            ROMPTR  0EA 014                      * 8FABF
          ;                                      * 8FACA
          ::                                     * 8FACF
            DROP                                 * 8FAD4
            7GETLAM                              * 8FAD9
            DUP                                  * 8FADE
            5PUTLAM                              * 8FAE3
            ROMPTR  0EA 015                      * 8FAE8
            #-                                   * 8FAF3
            7PUTLAM                              * 8FAF8
          ;                                      * 8FAFD
          ROMPTR  0EA 047                        * 8FB02
        ;                                        * 8FB0D

* ROMPTR 0EA 06D
* refs (1): 8D288
ROMP_0EA_06D:
        ::                                       * 8FB12
          17GETLAM                               * 8FB17
          #0=                                    * 8FB1C
          9GETLAM                                * 8FB21
          21GETLAM                               * 8FB26
          #>                                     * 8FB2B
          OR                                     * 8FB30
          caseDoBadKey                           * 8FB35
          OBJ_44BBB                              * 8FB3A
          #1=                                    * 8FB3F
          18GETLAM                               * 8FB44
          #0=                                    * 8FB49
          ANDcase                                * 8FB4E

* ROMPTR 0EA 06E
* refs (1): 8D288
ROMP_0EA_06E:
          ::                                     * 8FB53
            ONEONE                               * 8FB58
            21PUTLAM                             * 8FB5D
            8PUTLAM                              * 8FB62
            BINT2                                * 8FB67
            9PUTLAM                              * 8FB6C
            ROMPTR  0EA 06A                      * 8FB71
          ;                                      * 8FB7C
          ROMPTR  0EA 012                        * 8FB81

* ROMPTR 0EA 06F
* refs (1): 8D288
ROMP_0EA_06F:
          ::                                     * 8FB8C
            9GETLAM                              * 8FB91
            #1+DUP                               * 8FB96
            9PUTLAM                              * 8FB9B
            DUP                                  * 8FBA0
            11GETLAM                             * 8FBA5
            #>case                               * 8FBAA
            ::                                   * 8FBAF
              11PUTLAM                           * 8FBB4
              13GETLAM                           * 8FBB9
              #1+                                * 8FBBE
              13PUTLAM                           * 8FBC3
              HARDBUFF                           * 8FBC8
              ROMPTR  0EA 015                    * 8FBCD
              BINT24                             * 8FBD8
              #+                                 * 8FBDD
              BINT0                              * 8FBE2
              ROMPTR  0EA 068                    * 8FBE7
              BINT6                              * 8FBF2
              SUBGROB                            * 8FBF7
              HARDBUFF                           * 8FBFC
              BINT24                             * 8FC01
              BINT0                              * 8FC06
              GROB!                              * 8FC0B
              HARDBUFF                           * 8FC10
              ROMPTR  0EA 015                    * 8FC15
              #12+                               * 8FC20
              BINT6                              * 8FC25
              BINT131                            * 8FC2A
              BINT46                             * 8FC2F
              SUBGROB                            * 8FC34
              HARDBUFF                           * 8FC39
              BINT12                             * 8FC3E
              BINT6                              * 8FC43
              GROB!                              * 8FC48
              11GETLAM                           * 8FC4D
              DUP                                * 8FC52
              ROMPTR  0EA 014                    * 8FC57
            ;                                    * 8FC62
            DROP                                 * 8FC67
            5GETLAM                              * 8FC6C
            DUP                                  * 8FC71
            7PUTLAM                              * 8FC76
            ROMPTR  0EA 015                      * 8FC7B
            #+                                   * 8FC86
            5PUTLAM                              * 8FC8B
          ;                                      * 8FC90
          ROMPTR  0EA 047                        * 8FC95
        ;                                        * 8FCA0

* ROMPTR 0EA 070
* refs (1): 8D288
ROMP_0EA_070:
        ::                                       * 8FCA5
          BINT33                                 * 8FCAA
          ONE_DO                                 * 8FCAF
          ?ATTNQUIT                              * 8FCB4
          %0_2A2B4                               * 8FCB9
          ID      'tmp                           * 8FCBE
          INDEX@                                 * 8FCCD
          #>$                                    * 8FCD2
          >TAG                                   * 8FCD7
          DUPUNROT                               * 8FCDC
          ERRSET                                 * 8FCE1
          ::                                     * 8FCE6
            sto(_,to)                            * 8FCEB
            purge(to)                            * 8FCF0
          ;                                      * 8FCF5
          ERRTRAP                                * 8FCFA
          DropSysObs                             * 8FCFF
          LOOP                                   * 8FD04
        ;                                        * 8FD09

LIB0EA.hash:
        CON(5)  DOHSTR                           * 8FD0E  hash table of library 0EA
        LENGTH                                   * 8FD13  length, to #8FD72
        CON(5)  0                                * 8FD18  names of length 1
        CON(5)  0                                * 8FD1D  names of length 2
        CON(5)  0                                * 8FD22  names of length 3
        CON(5)  0                                * 8FD27  names of length 4
        CON(5)  0                                * 8FD2C  names of length 5
        CON(5)  0                                * 8FD31  names of length 6
        CON(5)  0                                * 8FD36  names of length 7
        CON(5)  0                                * 8FD3B  names of length 8
        CON(5)  0                                * 8FD40  names of length 9
        CON(5)  0                                * 8FD45  names of length 10
        CON(5)  0                                * 8FD4A  names of length 11
        CON(5)  0                                * 8FD4F  names of length 12
        CON(5)  0                                * 8FD54  names of length 13
        CON(5)  0                                * 8FD59  names of length 14
        CON(5)  0                                * 8FD5E  names of length 15
        CON(5)  0                                * 8FD63  names of length 16
        REL(5)  L_8FD6D                          * 8FD68  end of the names
L_8FD6D:
        CON(5)  0                                * 8FD6D  command 000 has no name
        ENDLENGTH                                * 8FD72

LIB0EA.link:
        CON(5)  DOHSTR                           * 8FD72  link table of library 0EA
        LENGTH                                   * 8FD77  length, to #8FFB1
        REL(5)  ROMP_0EA_000                     * 8FD7C  000 
        REL(5)  ROMP_0EA_001                     * 8FD81  001 
        REL(5)  ROMP_0EA_002                     * 8FD86  002 
        REL(5)  ROMP_0EA_003                     * 8FD8B  003 
        REL(5)  ROMP_0EA_004                     * 8FD90  004 
        REL(5)  ROMP_0EA_005                     * 8FD95  005 
        REL(5)  ROMP_0EA_006                     * 8FD9A  006 
        REL(5)  ROMP_0EA_007                     * 8FD9F  007 
        REL(5)  ROMP_0EA_008                     * 8FDA4  008 
        REL(5)  ROMP_0EA_009                     * 8FDA9  009 
        REL(5)  ROMP_0EA_00A                     * 8FDAE  00A 
        REL(5)  ROMP_0EA_00B                     * 8FDB3  00B 
        REL(5)  ROMP_0EA_00C                     * 8FDB8  00C 
        REL(5)  ROMP_0EA_00D                     * 8FDBD  00D 
        REL(5)  ROMP_0EA_00E                     * 8FDC2  00E 
        REL(5)  ROMP_0EA_00F                     * 8FDC7  00F 
        REL(5)  ROMP_0EA_010                     * 8FDCC  010 
        REL(5)  ROMP_0EA_012                     * 8FDD1  011 
        REL(5)  ROMP_0EA_012                     * 8FDD6  012 
        REL(5)  ROMP_0EA_013                     * 8FDDB  013 
        REL(5)  ROMP_0EA_014                     * 8FDE0  014 
        REL(5)  ROMP_0EA_015                     * 8FDE5  015 
        REL(5)  ROMP_0EA_016                     * 8FDEA  016 
        REL(5)  ROMP_0EA_017                     * 8FDEF  017 
        REL(5)  ROMP_0EA_018                     * 8FDF4  018 
        REL(5)  ROMP_0EA_019                     * 8FDF9  019 
        REL(5)  ROMP_0EA_01A                     * 8FDFE  01A 
        REL(5)  ROMP_0EA_01B                     * 8FE03  01B 
        REL(5)  ROMP_0EA_01C                     * 8FE08  01C 
        REL(5)  ROMP_0EA_01D                     * 8FE0D  01D 
        REL(5)  ROMP_0EA_01E                     * 8FE12  01E 
        REL(5)  ROMP_0EA_01F                     * 8FE17  01F 
        REL(5)  ROMP_0EA_021                     * 8FE1C  020 
        REL(5)  ROMP_0EA_021                     * 8FE21  021 
        REL(5)  ROMP_0EA_022                     * 8FE26  022 
        REL(5)  ROMP_0EA_023                     * 8FE2B  023 
        REL(5)  ROMP_0EA_024                     * 8FE30  024 
        REL(5)  ROMP_0EA_025                     * 8FE35  025 
        REL(5)  ROMP_0EA_026                     * 8FE3A  026 
        REL(5)  ROMP_0EA_027                     * 8FE3F  027 
        REL(5)  ROMP_0EA_028                     * 8FE44  028 
        REL(5)  ROMP_0EA_029                     * 8FE49  029 
        REL(5)  ROMP_0EA_02A                     * 8FE4E  02A 
        REL(5)  ROMP_0EA_02B                     * 8FE53  02B 
        REL(5)  ROMP_0EA_02C                     * 8FE58  02C 
        REL(5)  ROMP_0EA_02D                     * 8FE5D  02D 
        REL(5)  ROMP_0EA_02E                     * 8FE62  02E 
        REL(5)  ROMP_0EA_02F                     * 8FE67  02F 
        REL(5)  ROMP_0EA_030                     * 8FE6C  030 
        REL(5)  ROMP_0EA_031                     * 8FE71  031 
        REL(5)  ROMP_0EA_032                     * 8FE76  032 
        REL(5)  ROMP_0EA_033                     * 8FE7B  033 
        REL(5)  ROMP_0EA_034                     * 8FE80  034 
        REL(5)  ROMP_0EA_035                     * 8FE85  035 
        REL(5)  ROMP_0EA_036                     * 8FE8A  036 
        REL(5)  ROMP_0EA_037                     * 8FE8F  037 
        REL(5)  ROMP_0EA_038                     * 8FE94  038 
        REL(5)  ROMP_0EA_039                     * 8FE99  039 
        REL(5)  ROMP_0EA_03A                     * 8FE9E  03A 
        REL(5)  ROMP_0EA_03B                     * 8FEA3  03B 
        REL(5)  ROMP_0EA_03C                     * 8FEA8  03C 
        REL(5)  ROMP_0EA_03D                     * 8FEAD  03D 
        REL(5)  ROMP_0EA_03E                     * 8FEB2  03E 
        REL(5)  ROMP_0EA_03F                     * 8FEB7  03F 
        REL(5)  ROMP_0EA_040                     * 8FEBC  040 
        REL(5)  ROMP_0EA_041                     * 8FEC1  041 
        REL(5)  ROMP_0EA_042                     * 8FEC6  042 
        REL(5)  ROMP_0EA_043                     * 8FECB  043 
        REL(5)  ROMP_0EA_044                     * 8FED0  044 
        REL(5)  ROMP_0EA_045                     * 8FED5  045 
        REL(5)  ROMP_0EA_046                     * 8FEDA  046 
        REL(5)  ROMP_0EA_047                     * 8FEDF  047 
        REL(5)  ROMP_0EA_048                     * 8FEE4  048 
        REL(5)  ROMP_0EA_049                     * 8FEE9  049 
        REL(5)  ROMP_0EA_04A                     * 8FEEE  04A 
        REL(5)  ROMP_0EA_04B                     * 8FEF3  04B 
        REL(5)  ROMP_0EA_04C                     * 8FEF8  04C 
        REL(5)  ROMP_0EA_04D                     * 8FEFD  04D 
        REL(5)  ROMP_0EA_04E                     * 8FF02  04E 
        REL(5)  ROMP_0EA_04F                     * 8FF07  04F 
        REL(5)  ROMP_0EA_050                     * 8FF0C  050 
        REL(5)  ROMP_0EA_051                     * 8FF11  051 
        REL(5)  ROMP_0EA_052                     * 8FF16  052 
        REL(5)  ROMP_0EA_053                     * 8FF1B  053 
        REL(5)  ROMP_0EA_054                     * 8FF20  054 
        REL(5)  ROMP_0EA_055                     * 8FF25  055 
        REL(5)  ROMP_0EA_056                     * 8FF2A  056 
        REL(5)  ROMP_0EA_057                     * 8FF2F  057 
        REL(5)  ROMP_0EA_058                     * 8FF34  058 
        REL(5)  ROMP_0EA_059                     * 8FF39  059 
        REL(5)  ROMP_0EA_05A                     * 8FF3E  05A 
        REL(5)  ROMP_0EA_05B                     * 8FF43  05B 
        REL(5)  ROMP_0EA_05C                     * 8FF48  05C 
        REL(5)  ROMP_0EA_05D                     * 8FF4D  05D 
        REL(5)  ROMP_0EA_05E                     * 8FF52  05E 
        REL(5)  ROMP_0EA_05F                     * 8FF57  05F 
        REL(5)  ROMP_0EA_060                     * 8FF5C  060 
        REL(5)  ROMP_0EA_061                     * 8FF61  061 
        REL(5)  ROMP_0EA_062                     * 8FF66  062 
        REL(5)  ROMP_0EA_063                     * 8FF6B  063 
        REL(5)  ROMP_0EA_064                     * 8FF70  064 
        REL(5)  ROMP_0EA_065                     * 8FF75  065 
        REL(5)  ROMP_0EA_066                     * 8FF7A  066 
        REL(5)  ROMP_0EA_067                     * 8FF7F  067 
        REL(5)  ROMP_0EA_068                     * 8FF84  068 
        REL(5)  ROMP_0EA_069                     * 8FF89  069 
        REL(5)  ROMP_0EA_06A                     * 8FF8E  06A 
        REL(5)  ROMP_0EA_06B                     * 8FF93  06B 
        REL(5)  ROMP_0EA_06C                     * 8FF98  06C 
        REL(5)  ROMP_0EA_06D                     * 8FF9D  06D 
        REL(5)  ROMP_0EA_06E                     * 8FFA2  06E 
        REL(5)  ROMP_0EA_06F                     * 8FFA7  06F 
        REL(5)  ROMP_0EA_070                     * 8FFAC  070 
        ENDLENGTH                                * 8FFB1
        BSS     4                                * 8FFB1
        ENDLENGTH                                * 8FFB5
        FILLTO  #90000                           * 8FFB5  75 zero nibbles: the next entry stays at #90000
