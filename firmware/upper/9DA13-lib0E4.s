* HP 48GX ROM revision R, #9DA13-#A07E8: Library part 0E4
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~MESRclEqn
* Follows on from the previous file (at #9DA13 in the original ROM).
        ENDLENGTH                                * 9DA13

        CON(5)  DOLIB                            * 9DA13  library object
        LENGTH                                   * 9DA18  length, to #A07E9
        CON(2)  0                                * 9DA1D  title length

LIB0E4:
        CON(3)  #0E4                             * 9DA1F  library number
        REL(5)  LIB0E4.hash                      * 9DA22  hash table
        REL(5)  ROMP_0E4_051                     * 9DA27  message table
        REL(5)  LIB0E4.link                      * 9DA2C  link table
        CON(5)  0                                * 9DA31  config
        RPL

* ROMPTR 0E4 000
* refs (1): 9DA1F
ROMP_0E4_000:
        ::                                       * 9DA36
          '                                      * 9DA3B
          LAM     'PC3                           * 9DA40
          STO                                    * 9DA4F
        ;                                        * 9DA54

* ROMPTR 0E4 001
* refs (1): 9DA1F
ROMP_0E4_001:
        ::                                       * 9DA59
          '                                      * 9DA5E
          LAM     'PC2                           * 9DA63
          STO                                    * 9DA72
        ;                                        * 9DA77

* ROMPTR 0E4 002
* refs (1): 9DA1F
ROMP_0E4_002:
        ::                                       * 9DA7C
          '                                      * 9DA81
          LAM     'PC1                           * 9DA86
          STO                                    * 9DA95
        ;                                        * 9DA9A

* ROMPTR 0E4 003
* refs (1): 9DA1F
ROMP_0E4_003:
        ::                                       * 9DA9F
          '                                      * 9DAA4
          LAM     MSTargetId                     * 9DAA9
          STO                                    * 9DAC4
        ;                                        * 9DAC9

* ROMPTR 0E4 004
* refs (1): 9DA1F
ROMP_0E4_004:
        ::                                       * 9DACE
          '                                      * 9DAD3
          LAM     MSFnl                          * 9DAD8
          STO                                    * 9DAE9
        ;                                        * 9DAEE

* ROMPTR 0E4 005
* refs (1): 9DA1F
ROMP_0E4_005:
        ::                                       * 9DAF3
          '                                      * 9DAF8
          LAM     MSNumVar                       * 9DAFD
          STO                                    * 9DB14
        ;                                        * 9DB19

* ROMPTR 0E4 006
* refs (1): 9DA1F
ROMP_0E4_006:
        ::                                       * 9DB1E
          '                                      * 9DB23
          LAM     MSnf                           * 9DB28
          STO                                    * 9DB37
        ;                                        * 9DB3C

* ROMPTR 0E4 007
* refs (1): 9DA1F
ROMP_0E4_007:
        ::                                       * 9DB41
          '                                      * 9DB46
          LAM     MStnf                          * 9DB4B
          STO                                    * 9DB5C
        ;                                        * 9DB61

* ROMPTR 0E4 008
* refs (1): 9DA1F
ROMP_0E4_008:
        ::                                       * 9DB66
          '                                      * 9DB6B
          LAM     MSRnflg                        * 9DB70
          STO                                    * 9DB85
        ;                                        * 9DB8A

* ROMPTR 0E4 009
* refs (1): 9DA1F
ROMP_0E4_009:
        ::                                       * 9DB8F
          '                                      * 9DB94
          LAM     MSMflg                         * 9DB99
          STO                                    * 9DBAC
        ;                                        * 9DBB1

* ROMPTR 0E4 00A
* refs (1): 9DA1F
ROMP_0E4_00A:
        ::                                       * 9DBB6
          '                                      * 9DBBB
          LAM     MSnftp                         * 9DBC0
          STO                                    * 9DBD3
        ;                                        * 9DBD8

* ROMPTR 0E4 00B
* refs (1): 9DA1F
ROMP_0E4_00B:
        ::                                       * 9DBDD
          DUPDUP                                 * 9DBE2
          LENCOMP                                * 9DBE7
          NTHCOMPDROP                            * 9DBEC
          LENCOMP                                * 9DBF1
          BINT0                                  * 9DBF6
          SWAP                                   * 9DBFB
          NDUPN                                  * 9DC00
          {}N                                    * 9DC05
          >TCOMP                                 * 9DC0A
          SWAP                                   * 9DC0F
          >TCOMP                                 * 9DC14
          NULL{}                                 * 9DC19
          >TCOMP                                 * 9DC1E
          DUP                                    * 9DC23
          ROMPTR  0E4 011                        * 9DC28
          DUPLENCOMP                             * 9DC33
          #4-                                    * 9DC38
          ONESWAP                                * 9DC3D
          SUBCOMP                                * 9DC42
          '                                      * 9DC47
          ID      EQ                             * 9DC4C
          XEQSTOID                               * 9DC57
          '                                      * 9DC5C
          ROMPTR  0E4 00C                        * 9DC61
          '                                      * 9DC6C
          InitMenu                               * 9DC71
        ;                                        * 9DC76

* ROMPTR 0E4 00C
* refs (1): 9DA1F
ROMP_0E4_00C:
        ::                                       * 9DC7B
          '                                      * 9DC80
          ID      Mpar                           * 9DC85
          SAFE@                                  * 9DC94
          NOTcase                                * 9DC99
          ROMPTR  0E4 031                        * 9DC9E
          OCRC                                   * 9DCA9
          SWAPDROP                               * 9DCAE
          '                                      * 9DCB3
          DROP                                   * 9DCB8
          '                                      * 9DCBD
          ROMPTR  0E4 01A                        * 9DCC2
          BINT3                                  * 9DCCD
          ::N                                    * 9DCD2
          ReviewKey!                             * 9DCD7
          '                                      * 9DCDC
          ROMPTR  0E4 00D                        * 9DCE1
          LabelDef!                              * 9DCEC
          '                                      * 9DCF1
          ROMPTR  0E4 01B                        * 9DCF6
          MenuKeyNS!                             * 9DD01
          '                                      * 9DD06
          ROMPTR  0E4 023                        * 9DD0B
          MenuKeyLS!                             * 9DD16
          '                                      * 9DD1B
          ROMPTR  0E4 021                        * 9DD20
          MenuKeyRS!                             * 9DD2B
          ROMPTR  0E4 013                        * 9DD30
          BINT6                                  * 9DD3B
          #/                                     * 9DD40
          DROP                                   * 9DD45
          BINT6                                  * 9DD4A
          SWAP#-                                 * 9DD4F
          DUPONE                                 * 9DD54
          #<>                                    * 9DD59
          ITE                                    * 9DD5E
          ::                                     * 9DD63
            ONE_DO                               * 9DD68
            NULL$                                * 9DD6D
            >TCOMP                               * 9DD72
            LOOP                                 * 9DD77
          ;                                      * 9DD7C
          DROP                                   * 9DD81
          $       "ALL"                          * 9DD86
          >TCOMP                                 * 9DD96
          BINT63                                 * 9DD9B
          TestUserFlag                           * 9DDA0
          ?SKIP                                  * 9DDA5
          ::                                     * 9DDAA
            INNERCOMP                            * 9DDAF
            '                                    * 9DDB4
            ROMPTR  0AB 072                      * 9DDB9  MUSER
            '                                    * 9DDC4
            ROMPTR  0AB 073                      * 9DDC9  MCALC
            NULL$                                * 9DDD4
            DUP                                  * 9DDD9
            2DUP                                 * 9DDDE
            7ROLL                                * 9DDE3
            #6+                                  * 9DDE8
            {}N                                  * 9DDED
          ;                                      * 9DDF2
          GDISPON?                               * 9DDF7
          ?SEMI                                  * 9DDFC
          ZEROZERO                               * 9DE01
          ROMPTR  0E4 015                        * 9DE06
          Clr16                                  * 9DE11
          ROMPTR  0B0 0A5                        * 9DE16
          XYGROBDISP                             * 9DE21
          SetDA1Temp                             * 9DE26
        ;                                        * 9DE2B

* ROMPTR 0E4 00D
* refs (1): 9DA1F
ROMP_0E4_00D:
        ::                                       * 9DE30
          ERRSET                                 * 9DE35
          ::                                     * 9DE3A
            '                                    * 9DE3F
            ID      Mpar                         * 9DE44
            SAFE@                                * 9DE53
            NOT                                  * 9DE58
            IT                                   * 9DE5D
            ERRJMP                               * 9DE62
            OCRC                                 * 9DE67
            SWAPDROP                             * 9DE6C
            CODE                                 * 9DE71  14 nibbles
              LC(5)   #807C5                     * 9DE7B
              GOVLNG  SysPtr@                    * 9DE82
            ENDCODE                              * 9DE89
            CARCOMP                              * 9DE89
            EQUAL                                * 9DE8E
            NOT                                  * 9DE93
            IT                                   * 9DE98
            ::                                   * 9DE9D
              ROMPTR  0E4 012                    * 9DEA2  ~MESRclEqn
              DROP                               * 9DEAD
              '                                  * 9DEB2
              ROMPTR  0E4 00C                    * 9DEB7
              InitMenu                           * 9DEC2
              DROP                               * 9DEC7
              BINT1                              * 9DECC
              GETDF                              * 9DED1
            ;                                    * 9DED6
          ;                                      * 9DEDB
          ERRTRAP                                * 9DEE0
          ::                                     * 9DEE5
            %3                                   * 9DEEA
            InitMenu%                            * 9DEEF
            DROP                                 * 9DEF4
            BINT1                                * 9DEF9
            GETDF                                * 9DEFE
          ;                                      * 9DF03
          dIDNTNcase                             * 9DF08
          ::                                     * 9DF0D
            DUP                                  * 9DF12
            NULL$                                * 9DF17
            EQUAL                                * 9DF1C
            ITE                                  * 9DF21
            MakeInvLabel                         * 9DF26
            ::                                   * 9DF2B
              DUP                                * 9DF30
              $       "VECTR"                    * 9DF35
              EQUAL                              * 9DF49
              ITE                                * 9DF4E
              MakeDirLabel                       * 9DF53
              MakeStdLabel                       * 9DF58
            ;                                    * 9DF5D
            Grob>Menu                            * 9DF62
          ;                                      * 9DF67
          DUP                                    * 9DF6C
          ROMPTR  0E4 00F                        * 9DF71
          SWAP                                   * 9DF7C
          ID>$                                   * 9DF81
          OVER                                   * 9DF86
          BINT2                                  * 9DF8B
          #AND                                   * 9DF90
          #0<>                                   * 9DF95
          ITE                                    * 9DF9A
          ::                                     * 9DF9F
            SWAP                                 * 9DFA4
            BINT1                                * 9DFA9
            #AND                                 * 9DFAE
            #0<>                                 * 9DFB3
            ITE                                  * 9DFB8
            MakeBoxLabel                         * 9DFBD
            ::                                   * 9DFC2
              BINT14                             * 9DFC7
              BINT10                             * 9DFCC
              CON(5)  DOGROB                     * 9DFD1  DOGROB
              LENGTH                             * 9DFD6  length, to #9E015
              NIBHEX  8000051000FFFFFF1000011000011000 * 9DFDB  ..P..ÿÿÿ........
              NIBHEX  E11000E11000E1100001FFFFFF * 9DFFB  ..........ÿÿÿ
        ENDLENGTH                                * 9E015
              MakeLabel                          * 9E015
            ;                                    * 9E01A
          ;                                      * 9E01F
          ::                                     * 9E024
            SWAP                                 * 9E029
            BINT1                                * 9E02E
            #AND                                 * 9E033
            #0<>                                 * 9E038
            ITE                                  * 9E03D
            MakeStdLabel                         * 9E042
            MakeInvLabel                         * 9E047
          ;                                      * 9E04C
          Grob>Menu                              * 9E051
        ;                                        * 9E056

* ROMPTR 0E4 00E
* refs (1): 9DA1F
ROMP_0E4_00E:
        ::                                       * 9E05B
          ROMPTR  0E4 013                        * 9E060
          DROPSWAP                               * 9E06B
          EQUALPOSCOMP                           * 9E070
        ;                                        * 9E075

* ROMPTR 0E4 00F
* refs (1): 9DA1F
ROMP_0E4_00F:
        ::                                       * 9E07A
          ROMPTR  0E4 012                        * 9E07F  ~MESRclEqn
          DUP                                    * 9E08A
          DUPLENCOMP                             * 9E08F
          DUP                                    * 9E094
          3UNROLL                                * 9E099
          #3-                                    * 9E09E
          NTHCOMPDROP                            * 9E0A3
          4ROLL                                  * 9E0A8
          EQUALPOSCOMP                           * 9E0AD
          3UNROLL                                * 9E0B2
          #2-                                    * 9E0B7
          NTHCOMPDROP                            * 9E0BC
          SWAP                                   * 9E0C1
          NTHCOMPDROP                            * 9E0C6
        ;                                        * 9E0CB

* ROMPTR 0E4 010
* refs (1): 9DA1F
ROMP_0E4_010:
        ::                                       * 9E0D0
          SWAP                                   * 9E0D5
          ROMPTR  0E4 00E                        * 9E0DA
          ROMPTR  0E4 018                        * 9E0E5
          PUTLIST                                * 9E0F0
          ROMPTR  0E4 012                        * 9E0F5  ~MESRclEqn
          DUPLENCOMP                             * 9E100
          #2-                                    * 9E105
          SWAP                                   * 9E10A
          PUTLIST                                * 9E10F
          ROMPTR  0E4 011                        * 9E114
        ;                                        * 9E11F

* ROMPTR 0E4 011
* refs (1): 9DA1F
ROMP_0E4_011:
        ::                                       * 9E124
          #       E4                             * 9E129  228
          SWAP                                   * 9E133
          TWO{}N                                 * 9E138
          DUP                                    * 9E13D
          OSIZE                                  * 9E142
          CODE                                   * 9E147  71 nibbles
            GOSBVL  POP#                         * 9E151
            R1=A.F  A                            * 9E158
            GOSBVL  SAVPTR                       * 9E15E
            A=DAT1  A                            * 9E165
            D1=A                                 * 9E168
            LC(5)   DOEXT0                       * 9E16B
            DAT1=C  A                            * 9E172
            D1=D1+  5                            * 9E175
            C=R1.F  A                            * 9E178
            C=C-CON A,5                          * 9E17E
            DAT1=C  A                            * 9E184
            GOSBVL  GETPTR                       * 9E187
            A=DAT0  A                            * 9E18E
            D0=D0+  5                            * 9E191
            PC=(A)                               * 9E194
          ENDCODE                                * 9E198
          DUP                                    * 9E198
          '                                      * 9E19D
          ID      Mpar                           * 9E1A2
          XEQSTOID                               * 9E1B1
          CODE                                   * 9E1B6  14 nibbles
            LC(5)   #807C5                       * 9E1C0
            GOVLNG  SysPtr@                      * 9E1C7
          ENDCODE                                * 9E1CE
          DUPTYPECOL?                            * 9E1CE
          NOTcasedrop                            * 9E1D3
          DROP                                   * 9E1D8
          BINT3                                  * 9E1DD
          NTHELCOMP                              * 9E1E2
          NOTcase                                * 9E1E7
          DROP                                   * 9E1EC
          '                                      * 9E1F1
          ROMPTR  0E4 01A                        * 9E1F6
          EQUAL                                  * 9E201
          NOTcase                                * 9E206
          DROP                                   * 9E20B
          OCRC                                   * 9E210
          SWAPDROP                               * 9E215
          '                                      * 9E21A
          DROP                                   * 9E21F
          '                                      * 9E224
          ROMPTR  0E4 01A                        * 9E229
          BINT3                                  * 9E234
          ::N                                    * 9E239
          ReviewKey!                             * 9E23E
        ;                                        * 9E243

* ROMPTR 0E4 012
* refs (1): 9DA1F
~MESRclEqn:
        ::                                       * 9E248
          '                                      * 9E24D
          ID      Mpar                           * 9E252
          SAFE@                                  * 9E261
          NOTcase                                * 9E266
          ROMPTR  0E4 031                        * 9E26B
          TOTEMPOB                               * 9E276
          DUP                                    * 9E27B
          ROMPTR  0E7 058                        * 9E280  ~UTTYPEEXT0?
          NOTcasedrop                            * 9E28B
          ROMPTR  0E4 031                        * 9E290
          CODE                                   * 9E29B  64 nibbles
            C=DAT1  A                            * 9E2A5
            CD1EX                                * 9E2A8
            RSTK=C                               * 9E2AB
            D1=D1+  10                           * 9E2AD
            A=DAT1  A                            * 9E2B0
            LC(5)   #000E4                       * 9E2B3
            ?C#A    A                            * 9E2BA
            GOYES   L_9E2D9                      * 9E2BD
            D1=D1-  10                           * 9E2BF
            LC(5)   DOLIST                       * 9E2C2
            DAT1=C  A                            * 9E2C9
            D1=D1+  5                            * 9E2CC
            LC(5)   DOBINT                       * 9E2CF
            DAT1=C  A                            * 9E2D6
L_9E2D9:
            C=RSTK                               * 9E2D9
            D1=C                                 * 9E2DB
            GOVLNG  PushF/TLoop                  * 9E2DE
          ENDCODE                                * 9E2E5
          NOTcasedrop                            * 9E2E5
          ROMPTR  0E4 031                        * 9E2EA
          INCOMPDROP                             * 9E2F5
          SWAPDROP                               * 9E2FA
        ;                                        * 9E2FF

* ROMPTR 0E4 013
* refs (1): 9DA1F
ROMP_0E4_013:
        ::                                       * 9E304
          ROMPTR  0E4 012                        * 9E309  ~MESRclEqn
          DUPLENCOMP                             * 9E314
          #3-                                    * 9E319
          NTHCOMPDROP                            * 9E31E
          DUPLENCOMP                             * 9E323
        ;                                        * 9E328

* ROMPTR 0E4 014
* refs (1): 9DA1F
ROMP_0E4_014:
        ::                                       * 9E32D
          ROMPTR  0E4 012                        * 9E332  ~MESRclEqn
          DUPLENCOMP                             * 9E33D
          #4-                                    * 9E342
          ONESWAP                                * 9E347
          3UNROLL                                * 9E34C
          3PICK                                  * 9E351
          SUBCOMP                                * 9E356
          SWAP                                   * 9E35B
        ;                                        * 9E360

* ROMPTR 0E4 015
* refs (1): 9DA1F
ROMP_0E4_015:
        ::                                       * 9E365
          ROMPTR  0E4 012                        * 9E36A  ~MESRclEqn
          DUPLENCOMP                             * 9E375
          #1-                                    * 9E37A
          NTHCOMPDROP                            * 9E37F
        ;                                        * 9E384

* ROMPTR 0E4 016
* refs (1): 9DA1F
ROMP_0E4_016:
        ::                                       * 9E389
          ROMPTR  0E4 012                        * 9E38E  ~MESRclEqn
          DUPLENCOMP                             * 9E399
          NTHCOMPDROP                            * 9E39E
        ;                                        * 9E3A3

* ROMPTR 0E4 017
* refs (1): 9DA1F
ROMP_0E4_017:
        ::                                       * 9E3A8
          ROMPTR  0E4 012                        * 9E3AD  ~MESRclEqn
          DUPLENCOMP                             * 9E3B8
          SWAP                                   * 9E3BD
          PUTLIST                                * 9E3C2
          ROMPTR  0E4 011                        * 9E3C7
        ;                                        * 9E3D2

* ROMPTR 0E4 018
* refs (1): 9DA1F
ROMP_0E4_018:
        ::                                       * 9E3D7
          ROMPTR  0E4 012                        * 9E3DC  ~MESRclEqn
          DUPLENCOMP                             * 9E3E7
          #2-                                    * 9E3EC
          NTHCOMPDROP                            * 9E3F1
        ;                                        * 9E3F6

* ROMPTR 0E4 019
* refs (1): 9DA1F
ROMP_0E4_019:
        ::                                       * 9E3FB
          ROMPTR  0E4 012                        * 9E400  ~MESRclEqn
          DUPLENCOMP                             * 9E40B
          #2-                                    * 9E410
          SWAP                                   * 9E415
          PUTLIST                                * 9E41A
          ROMPTR  0E4 011                        * 9E41F
        ;                                        * 9E42A

* ROMPTR 0E4 01A
* refs (1): 9DA1F
ROMP_0E4_01A:
        ::                                       * 9E42F
          BlankDA12                              * 9E434
          ROMPTR  0E4 015                        * 9E439
          DISPSTATUS2                            * 9E444
          BINT7                                  * 9E449
          ONE_DO                                 * 9E44E
          INDEX@                                 * 9E453
          DUP                                    * 9E458
          GETPROC                                * 9E45D
          >Review$                               * 9E462
          INDEX@                                 * 9E467
          #1+                                    * 9E46C
          DISPN                                  * 9E471
          LOOP                                   * 9E476
          SetDA12Temp                            * 9E47B
          SetDA3NoCh                             * 9E480
        ;                                        * 9E485
        NIBHEX  BA0F60                           * 9E48A  «ð.

* ROMPTR 0E4 01B
* refs (1): 9DA1F
ROMP_0E4_01B:
        ::                                       * 9E490
          ERRSET                                 * 9E495
          ROMPTR  0E4 012                        * 9E49A  ~MESRclEqn
          ERRTRAP                                * 9E4A5
          ::                                     * 9E4AA
            DROP                                 * 9E4AF
            DoBadKey                             * 9E4B4
            RDROP                                * 9E4B9
          ;                                      * 9E4BE
          DROP                                   * 9E4C3
          DUPTYPECSTR?                           * 9E4C8
          case                                   * 9E4CD
          ::                                     * 9E4D2
            ImmedEntry?                          * 9E4D7
            NOTcase                              * 9E4DC
            StdMenuKeyNS                         * 9E4E1
            DUP                                  * 9E4E6
            $       "ALL"                        * 9E4EB
            EQUALcasedrp                         * 9E4FB
            ::                                   * 9E500
              ROMPTR  0E4 01D                    * 9E505
              ROMPTR  0E4 01E                    * 9E510
            ;                                    * 9E51B
            DROP                                 * 9E520
            DoBadKey                             * 9E525
          ;                                      * 9E52A
          ImmedEntry?                            * 9E52F
          NOTcase                                * 9E534
          StdMenuKeyNS                           * 9E539
          DUPTYPEROMP?                           * 9E53E
          case                                   * 9E543
          StdMenuKeyNS                           * 9E548
          '                                      * 9E54D
          ROMPTR  0E4 01C                        * 9E552
          DoNameKeyLRS                           * 9E55D
        ;                                        * 9E562

* ROMPTR 0E4 01C
* refs (1): 9DA1F
ROMP_0E4_01C:
        ::                                       * 9E567
          CK2NOLASTWD                            * 9E56C
          STRIPTAGSl2                            * 9E571
          ROMPTR  0E4 020                        * 9E576
          DUPSAFE@                               * 9E581
          IT                                     * 9E586
          KeepUnit                               * 9E58B
          2DUP                                   * 9E590
          XEQStoKey                              * 9E595
          DUPROT                                 * 9E59A
          PromptIdUtil                           * 9E59F
          DISPSTATUS2                            * 9E5A4
          SetDA1Valid                            * 9E5A9
          BINT1                                  * 9E5AE
          ROMPTR  0E4 010                        * 9E5B3
          ROMPTR  0E4 01E                        * 9E5BE
        ;                                        * 9E5C9

* ROMPTR 0E4 01D
* refs (1): 9DA1F
ROMP_0E4_01D:
        ::                                       * 9E5CE
          BINT0                                  * 9E5D3
          ROMPTR  0E4 018                        * 9E5D8
          INNERDUP                               * 9E5E3
          ZERO_DO                                * 9E5E8
          #1-SWAP                                * 9E5ED
          BINT2                                  * 9E5F2
          #AND                                   * 9E5F7
          psh1&                                  * 9E5FC
          LOOP                                   * 9E601
          DROP                                   * 9E606
          {}N                                    * 9E60B
          ROMPTR  0E4 019                        * 9E610
        ;                                        * 9E61B

* ROMPTR 0E4 01E
* refs (1): 9DA1F
ROMP_0E4_01E:
        ::                                       * 9E620
          BINT0                                  * 9E625
          ROMPTR  0E4 018                        * 9E62A
          INNERDUP                               * 9E635
          ZERO_DO                                * 9E63A
          #1-SWAP                                * 9E63F
          BINT1                                  * 9E644
          #AND                                   * 9E649
          psh1&                                  * 9E64E
          LOOP                                   * 9E653
          DROP                                   * 9E658
          {}N                                    * 9E65D
          ROMPTR  0E4 019                        * 9E662
          NULL{}                                 * 9E66D
          ROMPTR  0E4 017                        * 9E672
        ;                                        * 9E67D

* ROMPTR 0E4 01F
* refs (1): 9DA1F
ROMP_0E4_01F:
        ::                                       * 9E682
          INNERDUP                               * 9E687
          ZERO_DO                                * 9E68C
          #1-SWAP                                * 9E691
          DUP                                    * 9E696
          ROMPTR  0E4 00F                        * 9E69B
          BINT1                                  * 9E6A6
          EQUAL                                  * 9E6AB
          ITE                                    * 9E6B0
          ::                                     * 9E6B5
            BINT3                                * 9E6BA
            ROMPTR  0E4 010                      * 9E6BF
          ;                                      * 9E6CA
          DROP                                   * 9E6CF
          LOOP                                   * 9E6D4
          DROP                                   * 9E6D9
        ;                                        * 9E6DE

* ROMPTR 0E4 020
* refs (1): 9DA1F
ROMP_0E4_020:
        ::                                       * 9E6E3
          OVER                                   * 9E6E8
          ROMPTR  0E4 013                        * 9E6ED
          DROP                                   * 9E6F8
          matchob?                               * 9E6FD
          casedrop                               * 9E702
          ::                                     * 9E707
            CK1NOLASTWD                          * 9E70C
            SETCIRCERR                           * 9E711
            ERRJMP                               * 9E716
          ;                                      * 9E71B
          DROP                                   * 9E720
        ;                                        * 9E725
        NIBHEX  BA0F60                           * 9E72A  «ð.

* ROMPTR 0E4 021
* refs (1): 9DA1F
ROMP_0E4_021:
        ::                                       * 9E730
          ERRSET                                 * 9E735
          ROMPTR  0E4 012                        * 9E73A  ~MESRclEqn
          ERRTRAP                                * 9E745
          ::                                     * 9E74A
            DROP                                 * 9E74F
            DoBadKey                             * 9E754
            RDROP                                * 9E759
          ;                                      * 9E75E
          DROP                                   * 9E763
          DUPTYPECSTR?                           * 9E768
          case                                   * 9E76D
          ::                                     * 9E772
            ImmedEntry?                          * 9E777
            NOTcase                              * 9E77C
            StdMenuKeyNS                         * 9E781
            DUP                                  * 9E786
            $       "ALL"                        * 9E78B
            EQUALcase                            * 9E79B
            ROMPTR  0E4 03B                      * 9E7A0
            DROP                                 * 9E7AB
            DoBadKey                             * 9E7B0
          ;                                      * 9E7B5
          BINT63                                 * 9E7BA
          TestUserFlag                           * 9E7BF
          NOTcase                                * 9E7C4
          DoNameKeyRS                            * 9E7C9
          DUP                                    * 9E7CE
          ROMPTR  0E4 00F                        * 9E7D3
          DUP                                    * 9E7DE
          BINT1                                  * 9E7E3
          #AND                                   * 9E7E8
          #0<>                                   * 9E7ED
          ITE                                    * 9E7F2
          ::                                     * 9E7F7
            BINT2                                * 9E7FC
            #AND                                 * 9E801
          ;                                      * 9E806
          ::                                     * 9E80B
            BINT1                                * 9E810
            #+                                   * 9E815
          ;                                      * 9E81A
          ROMPTR  0E4 010                        * 9E81F
          ROMPTR  0E4 01E                        * 9E82A
        ;                                        * 9E835

* ROMPTR 0E4 022
* refs (1): 9DA1F
ROMP_0E4_022:
        ::                                       * 9E83A
          SWAP                                   * 9E83F
          ROMPTR  0E4 039                        * 9E844
          DUP                                    * 9E84F
          LENCOMP                                * 9E854
          ROMPTR  0E4 013                        * 9E859
          SWAPDROP                               * 9E864
          2DUP#=                                 * 9E869
          casedrop                               * 9E86E
          ::                                     * 9E873
            4DROP                                * 9E878
            ROMPTR  0E4 033                      * 9E87D
          ;                                      * 9E888
          BINT1                                  * 9E88D
          ZEROFALSE                              * 9E892
          BINT1                                  * 9E897
          BINT9                                  * 9E89C
          ROLL                                   * 9E8A1
          ROMPTR  0E4 025                        * 9E8A6
        ;                                        * 9E8B1
        NIBHEX  BA0470                           * 9E8B6  «@.

* ROMPTR 0E4 023
* refs (1): 9DA1F
ROMP_0E4_023:
        ::                                       * 9E8BC
          ERRSET                                 * 9E8C1
          ROMPTR  0E4 012                        * 9E8C6  ~MESRclEqn
          ERRTRAP                                * 9E8D1
          ::                                     * 9E8D6
            DROP                                 * 9E8DB
            DoBadKey                             * 9E8E0
            RDROP                                * 9E8E5
          ;                                      * 9E8EA
          DROP                                   * 9E8EF
          DUPTYPECSTR?                           * 9E8F4
          case                                   * 9E8F9
          ::                                     * 9E8FE
            ImmedEntry?                          * 9E903
            NOTcase                              * 9E908
            StdMenuKeyNS                         * 9E90D
            DUP                                  * 9E912
            $       "ALL"                        * 9E917
            EQUALcase                            * 9E927
            ::                                   * 9E92C
              TRUE                               * 9E931
              ROMPTR  0E4 022                    * 9E936
            ;                                    * 9E941
            DROP                                 * 9E946
            DoBadKey                             * 9E94B
          ;                                      * 9E950
          DUPTYPEIDNT?                           * 9E955
          ImmedEntry?                            * 9E95A
          ANDNOTcase                             * 9E95F
          StdMenuKeyNS                           * 9E964
          {                                      * 9E969
            LAM     temp                         * 9E96E
          }                                      * 9E97D
          BIND                                   * 9E982
          CK0NOLASTWD                            * 9E987
          LAM     temp                           * 9E98C
          ABND                                   * 9E99B
          TRUE'                                  * 9E9A0
          ROMPTR  0E4 024                        * 9E9A5
          COLA_EVAL                              * 9E9B0
        ;                                        * 9E9B5

* ROMPTR 0E4 024
* refs (1): 9DA1F
ROMP_0E4_024:
        ::                                       * 9E9BA
          SWAP                                   * 9E9BF
          ROMPTR  0E4 039                        * 9E9C4
          OVER                                   * 9E9CF
          ROMPTR  0E4 03A                        * 9E9D4
          DUPLENCOMP                             * 9E9DF
          ROMPTR  0E4 013                        * 9E9E4
          SWAPDROP                               * 9E9EF
          BINT1                                  * 9E9F4
          ZEROFALSE                              * 9E9F9
          BINT0                                  * 9E9FE
          BINT9                                  * 9EA03
          ROLL                                   * 9EA08
          ROMPTR  0E4 025                        * 9EA0D
        ;                                        * 9EA18

* ROMPTR 0E4 025
* refs (1): 9DA1F
ROMP_0E4_025:
        ::                                       * 9EA1D
          RDROP                                  * 9EA22
          DUP                                    * 9EA27
          IT                                     * 9EA2C
          ::                                     * 9EA31
            BlankDA12                            * 9EA36
            #       E408                         * 9EA3B  58376
            JstGetTHEMESG                        * 9EA45
            DISPROW1                             * 9EA4A
          ;                                      * 9EA4F
          ERRSET                                 * 9EA54
          ::                                     * 9EA59
            {                                    * 9EA5E

* ROMPTR 0E4 026
* refs (1): 9DA1F
ROMP_0E4_026:
              LAM     MSTargetId                 * 9EA63

* ROMPTR 0E4 027
* refs (1): 9DA1F
ROMP_0E4_027:
              LAM     MSFnl                      * 9EA7E

* ROMPTR 0E4 028
* refs (1): 9DA1F
ROMP_0E4_028:
              LAM     MSnf                       * 9EA8F

* ROMPTR 0E4 029
* refs (1): 9DA1F
ROMP_0E4_029:
              LAM     MSNumVar                   * 9EA9E

* ROMPTR 0E4 02A
* refs (1): 9DA1F
ROMP_0E4_02A:
              LAM     MSnftp                     * 9EAB5

* ROMPTR 0E4 02B
* refs (1): 9DA1F
ROMP_0E4_02B:
              LAM     MStnf                      * 9EAC8

* ROMPTR 0E4 02C
* refs (1): 9DA1F
ROMP_0E4_02C:
              LAM     MSRnflg                    * 9EAD9

* ROMPTR 0E4 02D
* refs (1): 9DA1F
ROMP_0E4_02D:
              LAM     MSMflg                     * 9EAEE

* ROMPTR 0E4 02E
* refs (1): 9DA1F
ROMP_0E4_02E:
              LAM     MSMsgFlg                   * 9EB01
            }                                    * 9EB18
            BIND                                 * 9EB1D
            NULL{}                               * 9EB22
            ROMPTR  0E4 017                      * 9EB27
            ROMPTR  0E4 02D                      * 9EB32
            BINT1                                * 9EB3D
            EQUAL                                * 9EB42
            ?SKIP                                * 9EB47
            ::                                   * 9EB4C
              ROMPTR  0E4 014                    * 9EB51
              SWAPDROP                           * 9EB5C
              #1+_ONE_DO                         * 9EB61
              INDEX@                             * 9EB66
              ROMPTR  0E4 037                    * 9EB6B
              ROMPTR  0E4 027                    * 9EB76
              ROMPTR  0E4 036                    * 9EB81
              IT                                 * 9EB8C
              ::                                 * 9EB91
                DUP                              * 9EB96
                ROMPTR  0E4 026                  * 9EB9B
                EQUAL                            * 9EBA6
                ITE                              * 9EBAB
                ::                               * 9EBB0
                  ROMPTR  0E4 02F                * 9EBB5
                  BINT0                          * 9EBC0
                  ISTOPSTO                       * 9EBC5
                  BINT0                          * 9EBCA
                  ROMPTR  0E4 00A                * 9EBCF
                  BINT1                          * 9EBDA
                  ROMPTR  0E4 007                * 9EBDF
                  NOTcase                        * 9EBEA
                  ::                             * 9EBEF
                    ROMPTR  0E4 02E              * 9EBF4
                    IT                           * 9EBFF
                    SetDA1Temp                   * 9EC04
                    $       "Int"                * 9EC09
                    ROMPTR  0E4 003              * 9EC19
                  ;                              * 9EC24
                  ROMPTR  0E4 02E                * 9EC29
                  ITE                            * 9EC34
                  ID>TAG                         * 9EC39
                  DROP                           * 9EC3E
                ;                                * 9EC43
                DROP                             * 9EC48
              ;                                  * 9EC4D
              LOOP                               * 9EC52
            ;                                    * 9EC57
            BEGIN                                * 9EC5C
            ROMPTR  0E4 02A                      * 9EC61
            BINT0                                * 9EC6C
            #>                                   * 9EC71
            WHILE                                * 9EC76
            ::                                   * 9EC7B
              BINT0                              * 9EC80
              ROMPTR  0E4 00A                    * 9EC85
              ROMPTR  0E4 014                    * 9EC90
              SWAPDROP                           * 9EC9B
              #1+_ONE_DO                         * 9ECA0
              ROMPTR  0E4 02E                    * 9ECA5
              IT                                 * 9ECB0
              ::                                 * 9ECB5
                #       E408                     * 9ECBA  58376
                JstGetTHEMESG                    * 9ECC4
                DISPROW1                         * 9ECC9
              ;                                  * 9ECCE
              INDEX@                             * 9ECD3
              ROMPTR  0E4 037                    * 9ECD8
              ROMPTR  0E4 027                    * 9ECE3
              ROMPTR  0E4 036                    * 9ECEE
              IT                                 * 9ECF9
              ::                                 * 9ECFE
                ROMPTR  0E4 02F                  * 9ED03
                NOTcase                          * 9ED0E
                ::                               * 9ED13
                  BINT0                          * 9ED18
                  ISTOPSTO                       * 9ED1D
                  BINT0                          * 9ED22
                  ROMPTR  0E4 00A                * 9ED27
                  BINT1                          * 9ED32
                  ROMPTR  0E4 007                * 9ED37
                  ROMPTR  0E4 02E                * 9ED42
                  IT                             * 9ED4D
                  SetDA1Temp                     * 9ED52
                  $       "Int"                  * 9ED57
                  ROMPTR  0E4 003                * 9ED67
                ;                                * 9ED72
                DUP                              * 9ED77
                ROMPTR  0E4 026                  * 9ED7C
                EQUAL                            * 9ED87
                ROMPTR  0E4 02D                  * 9ED8C
                BINT0                            * 9ED97
                EQUAL                            * 9ED9C
                ANDcase                          * 9EDA1
                ::                               * 9EDA6
                  ROMPTR  0E4 02E                * 9EDAB
                  ITE                            * 9EDB6
                  ID>TAG                         * 9EDBB
                  DROP                           * 9EDC0
                  BINT0                          * 9EDC5
                  ISTOPSTO                       * 9EDCA
                  BINT0                          * 9EDCF
                  ROMPTR  0E4 00A                * 9EDD4
                  ROMPTR  0E4 02B                * 9EDDF
                  #1+                            * 9EDEA
                  ROMPTR  0E4 007                * 9EDEF
                ;                                * 9EDFA
                SWAPDROP                         * 9EDFF
                ROMPTR  0E4 027                  * 9EE04
                SWAP                             * 9EE0F
                >TCOMP                           * 9EE14
                ROMPTR  0E4 004                  * 9EE19
                ROMPTR  0E4 028                  * 9EE24
                #1+DUP                           * 9EE2F
                ROMPTR  0E4 006                  * 9EE34
                ROMPTR  0E4 02B                  * 9EE3F
                #1+                              * 9EE4A
                ROMPTR  0E4 007                  * 9EE4F
                ROMPTR  0E4 02A                  * 9EE5A
                #1+                              * 9EE65
                ROMPTR  0E4 00A                  * 9EE6A
                ROMPTR  0E4 029                  * 9EE75
                #=case                           * 9EE80
                ::                               * 9EE85
                  BINT0                          * 9EE8A
                  ISTOPSTO                       * 9EE8F
                ;                                * 9EE94
              ;                                  * 9EE99
              LOOP                               * 9EE9E
            ;                                    * 9EEA3
            REPEAT                               * 9EEA8
            ROMPTR  0E4 026                      * 9EEAD
            $       "Int"                        * 9EEB8
            EQUAL                                * 9EEC8
            case                                 * 9EECD
            ::                                   * 9EED2
              ROMPTR  0E4 02E                    * 9EED7
              ABND                               * 9EEE2
              NOT                                * 9EEE7
              ?SEMI                              * 9EEEC
              FLUSHKEYS                          * 9EEF1
              ATTNFLGCLR                         * 9EEF6
              #       A03                        * 9EEFB  2563
              GETTHEMESG                         * 9EF05
              APPprompt1!                        * 9EF0A
              SetDA1Temp                         * 9EF0F
            ;                                    * 9EF14
            ROMPTR  0E4 02D                      * 9EF19
            BINT0                                * 9EF24
            EQUAL                                * 9EF29
            case                                 * 9EF2E
            ::                                   * 9EF33
              ROMPTR  0E4 026                    * 9EF38
              ROMPTR  0E4 00F                    * 9EF43
              BINT2                              * 9EF4E
              #<>case                            * 9EF53
              ::                                 * 9EF58
                ROMPTR  0E4 02E                  * 9EF5D
                ?SKIP                            * 9EF68
                ROMPTR  0E4 026                  * 9EF6D
                ABND                             * 9EF78
                CK0NOLASTWD                      * 9EF7D
                ROMPTR  0E4 030                  * 9EF82
              ;                                  * 9EF8D
              ABND                               * 9EF92
            ;                                    * 9EF97
            ROMPTR  0E4 02B                      * 9EF9C
            ABND                                 * 9EFA7
            #0=case                              * 9EFAC
            ROMPTR  0E4 030                      * 9EFB1
          ;                                      * 9EFBC
          ERRTRAP                                * 9EFC1
          ::                                     * 9EFC6
            ERROR@                               * 9EFCB
            #0=                                  * 9EFD0
            IT                                   * 9EFD5
            ::                                   * 9EFDA
              ATTN#                              * 9EFDF
              ERRORSTO                           * 9EFE4
            ;                                    * 9EFE9
            ERRJMP                               * 9EFEE
          ;                                      * 9EFF3
        ;                                        * 9EFF8

* ROMPTR 0E4 02F
* refs (1): 9DA1F
ROMP_0E4_02F:
        ::                                       * 9EFFD
          ROMPTR  0E4 02C                        * 9F002
          ?SKIP                                  * 9F00D
          ROMPTR  0E4 01E                        * 9F012
          TRUE                                   * 9F01D
          ROMPTR  0E4 008                        * 9F022
          DUP                                    * 9F02D
          ID>$                                   * 9F032
          #       E407                           * 9F037  58375
          JstGetTHEMESG                          * 9F041
          SWAP&$                                 * 9F046
          ROMPTR  0E4 02E                        * 9F04B
          ITE                                    * 9F056
          DISPROW1                               * 9F05B
          DROP                                   * 9F060
          '                                      * 9F065
          ID      Mpar                           * 9F06A
          SAFE@                                  * 9F079
          DROP                                   * 9F07E
          OCRC                                   * 9F083
          SWAPDROP                               * 9F088
          {                                      * 9F08D
            nohalt                               * 9F092
            NULLLAM                              * 9F097
          }                                      * 9F09C
          BIND                                   * 9F0A1
          ROMPTR  0E4 012                        * 9F0A6  ~MESRclEqn
          INDEX@                                 * 9F0B1
          NTHCOMPDROP                            * 9F0B6
          DUPTYPESYMB?                           * 9F0BB
          IT                                     * 9F0C0
          ::                                     * 9F0C5
            nohalt                               * 9F0CA
            BINT1                                * 9F0CF
            {}N                                  * 9F0D4
            uncrunch                             * 9F0D9
            XEQSHOWLS                            * 9F0DE
            DUPTYPESYMB?                         * 9F0E3
            IT                                   * 9F0E8
            SYMCOLCT                             * 9F0ED
            '                                    * 9F0F2
            ID      Mpar                         * 9F0F7
            SAFE@                                * 9F106
            NOTcase                              * 9F10B
            ROMPTR  0E4 031                      * 9F110
            OCRC                                 * 9F11B
            SWAPDROP                             * 9F120
            1GETLAM                              * 9F125
            EQUAL                                * 9F12A
            NOTcase                              * 9F12F
            ROMPTR  0E4 031                      * 9F134
          ;                                      * 9F13F
          nohalt                                 * 9F144
          DUP                                    * 9F149
          SAFE@                                  * 9F14E
          ?SKIP                                  * 9F153
          %0_2A2B4                               * 9F158
          SYMBNUMSOLVE                           * 9F15D
          {                                      * 9F162
            NULLLAM                              * 9F167
            NULLLAM                              * 9F16C
          }                                      * 9F171
          BIND                                   * 9F176
          CK0NOLASTWD                            * 9F17B
          2GETLAM                                * 9F180
          1GETLAM                                * 9F185
          ABND                                   * 9F18A
          ?SKIP                                  * 9F18F
          ERROROUT                               * 9F194
          '                                      * 9F199
          ID      Mpar                           * 9F19E
          SAFE@                                  * 9F1AD
          NOTcase                                * 9F1B2
          ROMPTR  0E4 031                        * 9F1B7
          OCRC                                   * 9F1C2
          SWAPDROP                               * 9F1C7
          1GETLAM                                * 9F1CC
          EQUAL                                  * 9F1D1
          NOTcase                                * 9F1D6
          ROMPTR  0E4 031                        * 9F1DB
          DUP                                    * 9F1E6
          ATTN#                                  * 9F1EB
          #=case                                 * 9F1F0
          ERROROUT                               * 9F1F5
          GETTHEMESG                             * 9F1FA
          SWAP                                   * 9F1FF
          nohalt                                 * 9F204
          ABND                                   * 9F209
          DUPDUP                                 * 9F20E
          SAFE@                                  * 9F213
          ITE                                    * 9F218
          PromptIdUtil                           * 9F21D
          ::                                     * 9F222
            ID>$                                 * 9F227
            $       ": Undefined"                * 9F22C
            !append$                             * 9F24C
          ;                                      * 9F251
          ROMPTR  0E4 02E                        * 9F256
          ITE                                    * 9F261
          ::                                     * 9F266
            DISPROW2                             * 9F26B
            ROT                                  * 9F270
            DISPROW3                             * 9F275
          ;                                      * 9F27A
          ::                                     * 9F27F
            DROP                                 * 9F284
            ROTDROP                              * 9F289
          ;                                      * 9F28E
          DUPINDEX@                              * 9F293
          TWO{}N                                 * 9F298
          ROMPTR  0E4 016                        * 9F29D
          SWAP                                   * 9F2A8
          >TCOMP                                 * 9F2AD
          ROMPTR  0E4 017                        * 9F2B2
          2DUP                                   * 9F2BD
          XEQSTOID                               * 9F2C2
          DUP                                    * 9F2C7
          BINT2                                  * 9F2CC
          ROMPTR  0E4 010                        * 9F2D1
          INDEX@                                 * 9F2DC
          ROMPTR  0E4 037                        * 9F2E1
          ROMPTR  0E4 01F                        * 9F2EC
          TRUE                                   * 9F2F7
        ;                                        * 9F2FC

* ROMPTR 0E4 030
* refs (1): 9DA1F
ROMP_0E4_030:
        ::                                       * 9F301
          #       E404                           * 9F306  58372
          ERROROUT                               * 9F310
        ;                                        * 9F315

* ROMPTR 0E4 031
* refs (1): 9DA1F
ROMP_0E4_031:
        ::                                       * 9F31A
          #       E401                           * 9F31F  58369
          ERROROUT                               * 9F329
        ;                                        * 9F32E

* ROMPTR 0E4 032
* refs (1): 9DA1F
ROMP_0E4_032:
        ::                                       * 9F333
          #       E406                           * 9F338  58374
          ERROROUT                               * 9F342
        ;                                        * 9F347

* ROMPTR 0E4 033
* refs (1): 9DA1F
ROMP_0E4_033:
        ::                                       * 9F34C
          #       E405                           * 9F351  58373
          ERROROUT                               * 9F35B
        ;                                        * 9F360

* ROMPTR 0E4 034
* refs (1): 9DA1F
ROMP_0E4_034:
        ::                                       * 9F365
          #       E402                           * 9F36A  58370
          ERROROUT                               * 9F374
        ;                                        * 9F379

* ROMPTR 0E4 035
* refs (1): 9DA1F
ROMP_0E4_035:
        ::                                       * 9F37E
          #       E403                           * 9F383  58371
          ERROROUT                               * 9F38D
        ;                                        * 9F392

* ROMPTR 0E4 036
* refs (1): 9DA1F
ROMP_0E4_036:
        ::                                       * 9F397
          ZEROZERO                               * 9F39C
          2SWAP                                  * 9F3A1
          OVER                                   * 9F3A6
          LENCOMP                                * 9F3AB
          DUP#0=case                             * 9F3B0
          ::                                     * 9F3B5
            5DROP                                * 9F3BA
            FALSE                                * 9F3BF
          ;                                      * 9F3C4
          #1+_ONE_DO                             * 9F3C9
          OVER                                   * 9F3CE
          INDEX@                                 * 9F3D3
          NTHCOMDDUP                             * 9F3D8
          3PICKSWAP                              * 9F3DD
          EQUALPOSCOMP                           * 9F3E2
          #0=ITE                                 * 9F3E7
          ::                                     * 9F3EC
            DROP                                 * 9F3F1
            4ROLLDROP                            * 9F3F6
            INDEX@                               * 9F3FB
            4UNROLL                              * 9F400
            ROT                                  * 9F405
            #1+                                  * 9F40A
            3UNROLL                              * 9F40F
          ;                                      * 9F414
          ::                                     * 9F419
            SAFE@                                * 9F41E
            caseDROP                             * 9F423
            4ROLLDROP                            * 9F428
            INDEX@                               * 9F42D
            4UNROLL                              * 9F432
            ROT                                  * 9F437
            #1+                                  * 9F43C
            3UNROLL                              * 9F441
          ;                                      * 9F446
          LOOP                                   * 9F44B
          DROPSWAP                               * 9F450
          #1=case                                * 9F455
          ::                                     * 9F45A
            SWAP                                 * 9F45F
            NTHCOMPDROP                          * 9F464
            TRUE                                 * 9F469
          ;                                      * 9F46E
          2DROPFALSE                             * 9F473
        ;                                        * 9F478

* ROMPTR 0E4 037
* refs (1): 9DA1F
ROMP_0E4_037:
        ::                                       * 9F47D
          ROMPTR  0E4 012                        * 9F482  ~MESRclEqn
          SWAP                                   * 9F48D
          NTHCOMPDROP                            * 9F492
          NULL{}                                 * 9F497
          {                                      * 9F49C
            LAM     vlist                        * 9F4A1
          }                                      * 9F4B2
          BIND                                   * 9F4B7
          ROMPTR  0E4 038                        * 9F4BC
          LAM     vlist                          * 9F4C7
          ABND                                   * 9F4D8
        ;                                        * 9F4DD

* ROMPTR 0E4 038
* refs (1): 9DA1F
ROMP_0E4_038:
        ::                                       * 9F4E2
          INNERCOMP                              * 9F4E7
          ZERO_DO                                * 9F4EC
          ::                                     * 9F4F1
            DUPTYPEIDNT?                         * 9F4F6
            case                                 * 9F4FB
            ::                                   * 9F500
              LAM     vlist                      * 9F505
              SWAP                               * 9F516
              apndvarlst                         * 9F51B
              '                                  * 9F520
              LAM     vlist                      * 9F525
              STO                                * 9F536
            ;                                    * 9F53B
            '                                    * 9F540
            xIFTE                                * 9F545
            EQUAL                                * 9F54A
            NOT?SEMI                             * 9F54F
            ROMPTR  0E4 038                      * 9F554
            ROMPTR  0E4 038                      * 9F55F
            ZEROZERO                             * 9F56A
          ;                                      * 9F56F
          LOOP                                   * 9F574
        ;                                        * 9F579

* ROMPTR 0E4 039
* refs (1): 9DA1F
ROMP_0E4_039:
        ::                                       * 9F57E
          ROMPTR  0E4 013                        * 9F583
          DROP                                   * 9F58E
          ZEROSWAP                               * 9F593
          INNERCOMP                              * 9F598
          DUP#0_DO                               * 9F59D
          #1-SWAP                                * 9F5A2
          DUP                                    * 9F5A7
          ROMPTR  0E4 00F                        * 9F5AC
          BINT1                                  * 9F5B7
          #AND                                   * 9F5BC
          #0<>                                   * 9F5C1
          ITE                                    * 9F5C6
          psh1&                                  * 9F5CB
          DROP                                   * 9F5D0
          LOOP                                   * 9F5D5
          DROP                                   * 9F5DA
          {}N                                    * 9F5DF
        ;                                        * 9F5E4

* ROMPTR 0E4 03A
* refs (1): 9DA1F
ROMP_0E4_03A:
        ::                                       * 9F5E9
          OVERSWAP                               * 9F5EE
          EQUALPOSCOMP                           * 9F5F3
          DUP#0=case                             * 9F5F8
          DROP                                   * 9F5FD
          SWAPINCOMP                             * 9F602
          get1                                   * 9F607
          OVERSWAP                               * 9F60C
          #-                                     * 9F611
          #2+ROLL                                * 9F616
          DROP                                   * 9F61B
          #1-{}N                                 * 9F620
        ;                                        * 9F625

* ROMPTR 0E4 03B
* refs (1): 9DA1F
ROMP_0E4_03B:
        ::                                       * 9F62A
          RDROP                                  * 9F62F
          DROP                                   * 9F634
          ROMPTR  0E4 016                        * 9F639
          LENCOMP                                * 9F644
          #0=                                    * 9F649
          case                                   * 9F64E
          DoBadKey                               * 9F653
          POLSaveUI                              * 9F658
          ERRSET                                 * 9F65D
          ::                                     * 9F662
            TRUE                                 * 9F667
            FALSE                                * 9F66C
            {                                    * 9F671

* ROMPTR 0E4 03C
* refs (1): 9DA1F
ROMP_0E4_03C:
              LAM     'PC2                       * 9F676

* ROMPTR 0E4 03D
* refs (1): 9DA1F
ROMP_0E4_03D:
              LAM     'PC1                       * 9F685
            }                                    * 9F694
            BIND                                 * 9F699
            ClrDAsOK                             * 9F69E
            ClrDA1IsStat                         * 9F6A3
            ROMPTR  0E4 040                      * 9F6A8
            ROMPTR  0E4 015                      * 9F6B3
            ROMPTR  0E4 041                      * 9F6BE
            ONEONE                               * 9F6C9
            ROMPTR  0E4 016                      * 9F6CE
            RESOROMP                             * 9F6D9
            ROMPTR  0E4 03E                      * 9F6DE
            NULL{}                               * 9F6E9
            ROMPTR  0E0 010                      * 9F6EE  ~BRbrowse
            ABND                                 * 9F6F9
          ;                                      * 9F6FE
          ERRTRAP                                * 9F703
          POLResUI&Err                           * 9F708
          POLRestoreUI                           * 9F70D
          ClrDAsOK                               * 9F712
        ;                                        * 9F717

* ROMPTR 0E4 03E
* refs (1): 9DA1F
ROMP_0E4_03E:
        ::                                       * 9F71C
          DUP#0=case                             * 9F721
          ::                                     * 9F726
            DROP                                 * 9F72B
            LENCOMP                              * 9F730
          ;                                      * 9F735
          NTHCOMPDROP                            * 9F73A
          INCOMPDROP                             * 9F73F
          ROMPTR  0E4 03C                        * 9F744
          ITE                                    * 9F74F
          ::                                     * 9F754
            DROP                                 * 9F759
            DUPSAFE@                             * 9F75E
            NOTcase                              * 9F763
            ::                                   * 9F768
              ID>$                               * 9F76D
              $       ": Undefined"              * 9F772
              !append$                           * 9F792
            ;                                    * 9F797
            DUP                                  * 9F79C
            DO>STR                               * 9F7A1
            SWAP                                 * 9F7A6
            TYPEEXT?                             * 9F7AB
            IT                                   * 9F7B0
            ::                                   * 9F7B5
              CDR$                               * 9F7BA
              BINT1                              * 9F7BF
              OVER                               * 9F7C4
              LEN$                               * 9F7C9
              #1-                                * 9F7CE
              SUB$                               * 9F7D3
            ;                                    * 9F7D8
            SWAP                                 * 9F7DD
            ID>$                                 * 9F7E2
            $       ": "                         * 9F7E7
            !append$SWAP                         * 9F7F5
            !append$                             * 9F7FA
          ;                                      * 9F7FF
          ::                                     * 9F804
            SWAP                                 * 9F809
            ID>$                                 * 9F80E
            $       ": "                         * 9F813
            &$SWAP                               * 9F821
            ROMPTR  0E4 012                      * 9F826  ~MESRclEqn
            SWAP                                 * 9F831
            NTHCOMPDROP                          * 9F836
            DO>STR                               * 9F83B
            &$                                   * 9F840
          ;                                      * 9F845
        ;                                        * 9F84A

* ROMPTR 0E4 03F
* refs (1): 9DA1F
ROMP_0E4_03F:
        ::                                       * 9F84F
          CK0NOLASTWD                            * 9F854
          ERRSET                                 * 9F859
          ::                                     * 9F85E
            SetEcma94                            * 9F863
            ROMPTR  0E4 015                      * 9F868
            PRINT                                * 9F873
            ROMPTR  0E4 016                      * 9F878
            DUP                                  * 9F883
            BINT0                                * 9F888
            ROMPTR  0E4 03E                      * 9F88D
            #1+                                  * 9F898
            ONE_DO                               * 9F89D
            NULL$                                * 9F8A2
            PRINT                                * 9F8A7
            DUP                                  * 9F8AC
            INDEX@                               * 9F8B1
            NTHCOMPDROP                          * 9F8B6
            INCOMPDROP                           * 9F8BB
            DROP                                 * 9F8C0
            DUPSAFE@                             * 9F8C5
            ITE                                  * 9F8CA
            ::                                   * 9F8CF
              DUP                                * 9F8D4
              EDITDECOMP$                        * 9F8D9
              SWAP                               * 9F8DE
              TYPEEXT?                           * 9F8E3
              IT                                 * 9F8E8
              ::                                 * 9F8ED
                CDR$                             * 9F8F2
                BINT1                            * 9F8F7
                OVER                             * 9F8FC
                LEN$                             * 9F901
                #1-                              * 9F906
                SUB$                             * 9F90B
              ;                                  * 9F910
              SWAP                               * 9F915
              ID>$                               * 9F91A
              $       ": "                       * 9F91F
              !append$SWAP                       * 9F92D
              !append$                           * 9F932
            ;                                    * 9F937
            ::                                   * 9F93C
              ID>$                               * 9F941
              $       ": Undefined"              * 9F946
              !append$                           * 9F966
            ;                                    * 9F96B
            PRINT                                * 9F970
            DUP                                  * 9F975
            INDEX@                               * 9F97A
            NTHCOMPDROP                          * 9F97F
            INCOMPDROP                           * 9F984
            SWAPDROP                             * 9F989
            ROMPTR  0E4 012                      * 9F98E  ~MESRclEqn
            SWAP                                 * 9F999
            NTHCOMPDROP                          * 9F99E
            DECOMP$                              * 9F9A3
            PRINT                                * 9F9A8
            LOOP                                 * 9F9AD
            NULL$                                * 9F9B2
            PRINT                                * 9F9B7
            DROP                                 * 9F9BC
          ;                                      * 9F9C1
          ERRTRAP                                * 9F9C6
          DropSysObs                             * 9F9CB
        ;                                        * 9F9D0

* ROMPTR 0E4 040
* refs (1): 9DA1F
ROMP_0E4_040:
        {                                        * 9F9D5
          {                                      * 9F9DA
            ::                                   * 9F9DF
              TakeOver                           * 9F9E4
              $       "VALUE"                    * 9F9E9
              ROMPTR  0E4 03C                    * 9F9FD
              Box/StdLabel                       * 9FA08
            ;                                    * 9FA0D
            ::                                   * 9FA12
              TakeOver                           * 9FA17
              ROMPTR  0E4 03C                    * 9FA1C
              ?SKIP                              * 9FA27
              ::                                 * 9FA2C
                TRUE                             * 9FA31
                ROMPTR  0E4 001                  * 9FA36
                ROMPTR  0E0 049                  * 9FA41  BRinverse
                ROMPTR  0E0 045                  * 9FA4C  BRDispItems
                ROMPTR  0E0 049                  * 9FA57  BRinverse
                DispMenu                         * 9FA62
              ;                                  * 9FA67
            ;                                    * 9FA6C
          }                                      * 9FA71
          {                                      * 9FA76
            ::                                   * 9FA7B
              TakeOver                           * 9FA80
              $       "EQNS"                     * 9FA85
              ROMPTR  0E4 03C                    * 9FA97
              NOT                                * 9FAA2
              Box/StdLabel                       * 9FAA7
            ;                                    * 9FAAC
            ::                                   * 9FAB1
              TakeOver                           * 9FAB6
              ROMPTR  0E4 03C                    * 9FABB
              IT                                 * 9FAC6
              ::                                 * 9FACB
                FALSE                            * 9FAD0
                ROMPTR  0E4 001                  * 9FAD5
                ROMPTR  0E0 049                  * 9FAE0  BRinverse
                ROMPTR  0E0 045                  * 9FAEB  BRDispItems
                ROMPTR  0E0 049                  * 9FAF6  BRinverse
                DispMenu                         * 9FB01
              ;                                  * 9FB06
            ;                                    * 9FB0B
          }                                      * 9FB10
          {                                      * 9FB15
            $       "PRINT"                      * 9FB1A
            ::                                   * 9FB2E
              TakeOver                           * 9FB33
              ROMPTR  0E4 03F                    * 9FB38
            ;                                    * 9FB43
          }                                      * 9FB48
          NullMenuKey                            * 9FB4D
          NullMenuKey                            * 9FB52
          {                                      * 9FB57
            $       "EXIT"                       * 9FB5C
            ::                                   * 9FB6E
              TakeOver                           * 9FB73
              ROMPTR  0E0 013                    * 9FB78  BRdone
            ;                                    * 9FB83
          }                                      * 9FB88
        }                                        * 9FB8D

* ROMPTR 0E4 041
* refs (1): 9DA1F
ROMP_0E4_041:
        {                                        * 9FB92
          ROMPTR  0E0 052                        * 9FB97  BRViewItem
          ROMPTR  0E0 013                        * 9FBA2  BRdone
        }                                        * 9FBAD

* ROMPTR 0E4 042
* refs (1): 9DA1F
ROMP_0E4_042:
        ::                                       * 9FBB2
          NULL{}                                 * 9FBB7
          DORCLE                                 * 9FBBC
          DUP                                    * 9FBC1
          EqList?                                * 9FBC6
          NOTcase2drop                           * 9FBCB
          ROMPTR  0E4 034                        * 9FBD0
          LENCOMP                                * 9FBDB
          DUP                                    * 9FBE0
          #1=                                    * 9FBE5
          IT                                     * 9FBEA
          ROMPTR  0E4 034                        * 9FBEF
          #1+_ONE_DO                             * 9FBFA
          DORCLE                                 * 9FBFF
          INDEX@                                 * 9FC04
          NTHCOMPDROP                            * 9FC09
          ::                                     * 9FC0E
            DUPTYPESYMB?                         * 9FC13
            ?SEMI                                * 9FC18
            DUPTYPECOL?                          * 9FC1D
            ?SEMI                                * 9FC22
            DUPTYPEIDNT?                         * 9FC27
            NOTcasedrop                          * 9FC2C
            ROMPTR  0E4 035                      * 9FC31
            SAFE@                                * 9FC3C
            NOTcasedrop                          * 9FC41
            ROMPTR  0E4 035                      * 9FC46
            DUPTYPESYMB?                         * 9FC51
            ?SEMI                                * 9FC56
            DUPTYPECOL?                          * 9FC5B
            ?SEMI                                * 9FC60
            DUPTYPELIST?                         * 9FC65
            NOTcasedrop                          * 9FC6A
            ROMPTR  0E4 035                      * 9FC6F
            CARCOMP                              * 9FC7A
            DUPTYPESYMB?                         * 9FC7F
            ?SEMI                                * 9FC84
            DUPTYPECOL?                          * 9FC89
            ?SEMI                                * 9FC8E
            DUPTYPEIDNT?                         * 9FC93
            NOTcasedrop                          * 9FC98
            ROMPTR  0E4 035                      * 9FC9D
            SAFE@                                * 9FCA8
            NOTcasedrop                          * 9FCAD
            ROMPTR  0E4 035                      * 9FCB2
            DUPTYPESYMB?                         * 9FCBD
            ?SEMI                                * 9FCC2
            DUPTYPECOL?                          * 9FCC7
            ?SEMI                                * 9FCCC
            DUPTYPELIST?                         * 9FCD1
            NOTcasedrop                          * 9FCD6
            ROMPTR  0E4 035                      * 9FCDB
            CARCOMP                              * 9FCE6
            DUPTYPESYMB?                         * 9FCEB
            ?SEMI                                * 9FCF0
            DUPTYPECOL?                          * 9FCF5
            NOTcasedrop                          * 9FCFA
            ROMPTR  0E4 035                      * 9FCFF
          ;                                      * 9FD0A
          INTEMNOTREF?                           * 9FD0F
          ?SKIP                                  * 9FD14
          TOTEMPOB                               * 9FD19
          >TCOMP                                 * 9FD1E
          LOOP                                   * 9FD23
          DUP                                    * 9FD28
          INNERCOMP                              * 9FD2D
          NULL{}                                 * 9FD32
          {                                      * 9FD37
            LAM     vlist                        * 9FD3C
          }                                      * 9FD4D
          BIND                                   * 9FD52
          BINT0                                  * 9FD57
          DO                                     * 9FD5C
          ROMPTR  0E4 038                        * 9FD61
          LOOP                                   * 9FD6C
          LAM     vlist                          * 9FD71
          ABND                                   * 9FD82
          DUP                                    * 9FD87
          '                                      * 9FD8C
          ID      Mpar                           * 9FD91
          EQUALPOSCOMP                           * 9FDA0
          #0<>                                   * 9FDA5
          case                                   * 9FDAA
          ROMPTR  0E4 035                        * 9FDAF
          INNERCOMP                              * 9FDBA
          reversym                               * 9FDBF
          DUP                                    * 9FDC4
          BINT2                                  * 9FDC9
          #<                                     * 9FDCE
          case                                   * 9FDD3
          ROMPTR  0E4 035                        * 9FDD8
          {}N                                    * 9FDE3
          >TCOMP                                 * 9FDE8
          $       "EQ"                           * 9FDED
          SWAP                                   * 9FDFB
          DUPDUP                                 * 9FE00
          LENCOMP                                * 9FE05
          NTHCOMPDROP                            * 9FE0A
          LENCOMP                                * 9FE0F
          BINT0                                  * 9FE14
          SWAP                                   * 9FE19
          NDUPN                                  * 9FE1E
          {}N                                    * 9FE23
          >TCOMP                                 * 9FE28
          SWAP                                   * 9FE2D
          >TCOMP                                 * 9FE32
          NULL{}                                 * 9FE37
          >TCOMP                                 * 9FE3C
          ROMPTR  0E4 011                        * 9FE41
          CODE                                   * 9FE4C  14 nibbles
            LC(5)   #807C5                       * 9FE56
            GOVLNG  SysPtr@                      * 9FE5D
          ENDCODE                                * 9FE64
          DUPTYPECOL?                            * 9FE64
          NOTcase                                * 9FE69
          DROP                                   * 9FE6E
          BINT3                                  * 9FE73
          NTHELCOMP                              * 9FE78
          NOT                                    * 9FE7D
          ?SEMI                                  * 9FE82
          '                                      * 9FE87
          ROMPTR  0E4 01A                        * 9FE8C
          EQUAL                                  * 9FE97
          NOT                                    * 9FE9C
          ?SEMI                                  * 9FEA1
          '                                      * 9FEA6
          ROMPTR  0E4 00C                        * 9FEAB
          InitMenu                               * 9FEB6
        ;                                        * 9FEBB

* ROMPTR 0E4 043
* refs (1): 9DA1F
ROMP_0E4_043:
        ::                                       * 9FEC0
          ROMPTR  0E4 013                        * 9FEC5
          DROP                                   * 9FED0
          OVER                                   * 9FED5
          LENCOMP                                * 9FEDA
          #1+_ONE_DO                             * 9FEDF
          2DUPSWAP                               * 9FEE4
          INDEX@                                 * 9FEE9
          NTHCOMPDROP                            * 9FEEE
          EQUALPOSCOMP                           * 9FEF3
          #0=                                    * 9FEF8
          IT                                     * 9FEFD
          ::                                     * 9FF02
            OVER                                 * 9FF07
            INDEX@                               * 9FF0C
            NTHCOMPDROP                          * 9FF11
            NULL$                                * 9FF16
            EQUAL                                * 9FF1B
            ?SEMI                                * 9FF20
            ROMPTR  0E7 007                      * 9FF25
          ;                                      * 9FF30
          LOOP                                   * 9FF35
          SWAP                                   * 9FF3A
          OVER                                   * 9FF3F
          LENCOMP                                * 9FF44
          #1+_ONE_DO                             * 9FF49
          2DUPSWAP                               * 9FF4E
          INDEX@                                 * 9FF53
          NTHCOMPDROP                            * 9FF58
          EQUALPOSCOMP                           * 9FF5D
          #0=                                    * 9FF62
          IT                                     * 9FF67
          ::                                     * 9FF6C
            OVER                                 * 9FF71
            INDEX@                               * 9FF76
            NTHCOMPDROP                          * 9FF7B
            NULL$                                * 9FF80
            EQUAL                                * 9FF85
            ?SEMI                                * 9FF8A
            ROMPTR  0E7 007                      * 9FF8F
          ;                                      * 9FF9A
          LOOP                                   * 9FF9F
          SWAPDROP                               * 9FFA4
          NULL{}                                 * 9FFA9
          {                                      * 9FFAE
            LAM     vlist                        * 9FFB3
          }                                      * 9FFC4
          BIND                                   * 9FFC9
          DUP                                    * 9FFCE
          ROMPTR  0E4 038                        * 9FFD3
          LAM     vlist                          * 9FFDE
          ABND                                   * 9FFEF
          INNERCOMP                              * 9FFF4
          DUP                                    * 9FFF9
          #2+                                    * 9FFFE
          PICK                                   * A0003
          SWAP                                   * A0008
          ZERO_DO                                * A000D
          SWAP                                   * A0012
          ROMPTR  0E4 03A                        * A0017
          LOOP                                   * A0022
          DUPLENCOMP                             * A0027
          #0=                                    * A002C
          ITE                                    * A0031
          DROP                                   * A0036
          ::                                     * A003B
            INNERCOMP                            * A0040
            ZERO_DO                              * A0045
            NULL$                                * A004A
            EQUAL                                * A004F
            ?SKIP                                * A0054
            ROMPTR  0E7 007                      * A0059
            LOOP                                 * A0064
          ;                                      * A0069
          SWAP                                   * A006E
          DUPTYPECSTR?                           * A0073
          NOTcase                                * A0078
          ROMPTR  0E7 007                        * A007D
          NULL{}                                 * A0088
          3PICK                                  * A008D
          LENCOMP                                * A0092
          #1+_ONE_DO                             * A0097
          3PICK                                  * A009C
          INDEX@                                 * A00A1
          NTHCOMPDROP                            * A00A6
          DUP                                    * A00AB
          NULL$                                  * A00B0
          EQUAL                                  * A00B5
          ITE                                    * A00BA
          DROPZERO                               * A00BF
          ROMPTR  0E4 00F                        * A00C4
          >TCOMP                                 * A00CF
          LOOP                                   * A00D4
          SWAP                                   * A00D9
          NULL{}                                 * A00DE
          BINT4                                  * A00E3
          {}N                                    * A00E8
          ROMPTR  0E4 012                        * A00ED  ~MESRclEqn
          DUP                                    * A00F8
          LENCOMP                                * A00FD
          ONESWAP                                * A0102
          #4-                                    * A0107
          SUBCOMP                                * A010C
          SWAP                                   * A0111
          &COMP                                  * A0116
          ROMPTR  0E4 011                        * A011B
          CODE                                   * A0126  14 nibbles
            LC(5)   #807C5                       * A0130
            GOVLNG  SysPtr@                      * A0137
          ENDCODE                                * A013E
          DUPTYPECOL?                            * A013E
          NOTcase                                * A0143
          DROP                                   * A0148
          BINT3                                  * A014D
          NTHELCOMP                              * A0152
          NOT                                    * A0157
          ?SEMI                                  * A015C
          '                                      * A0161
          ROMPTR  0E4 01A                        * A0166
          EQUAL                                  * A0171
          NOT                                    * A0176
          ?SEMI                                  * A017B
          '                                      * A0180
          ROMPTR  0E4 00C                        * A0185
          InitMenu                               * A0190
        ;                                        * A0195

* ROMPTR 0E4 044
* refs (1): 9DA1F
ROMP_0E4_044:
        ::                                       * A019A
          ROMPTR  0E4 04F                        * A019F
          ROMPTR  0E4 01E                        * A01AA
          BINT1                                  * A01B5
          ROMPTR  0E4 049                        * A01BA
        ;                                        * A01C5

* ROMPTR 0E4 045
* refs (1): 9DA1F
ROMP_0E4_045:
        ::                                       * A01CA
          ROMPTR  0E4 04F                        * A01CF
          ROMPTR  0E4 01E                        * A01DA
          BINT0                                  * A01E5
          ROMPTR  0E4 049                        * A01EA
        ;                                        * A01F5

* ROMPTR 0E4 046
* refs (1): 9DA1F
ROMP_0E4_046:
        ::                                       * A01FA
          ROMPTR  0E4 04F                        * A01FF
          DUPNULL{}?                             * A020A
          case                                   * A020F
          ROMPTR  0E7 007                        * A0214
          BINT1                                  * A021F
          ROMPTR  0E4 048                        * A0224
        ;                                        * A022F

* ROMPTR 0E4 047
* refs (1): 9DA1F
ROMP_0E4_047:
        ::                                       * A0234
          ROMPTR  0E4 04F                        * A0239
          DUPNULL{}?                             * A0244
          case                                   * A0249
          ROMPTR  0E7 007                        * A024E
          BINT0                                  * A0259
          ROMPTR  0E4 048                        * A025E
        ;                                        * A0269

* ROMPTR 0E4 048
* refs (1): 9DA1F
ROMP_0E4_048:
        ::                                       * A026E
          ROMPTR  0E4 01E                        * A0273
          OVER                                   * A027E
          DUPLENCOMP                             * A0283
          #1+_ONE_DO                             * A0288
          DUPINDEX@                              * A028D
          NTHCOMPDROP                            * A0292
          dIDNTNcase                             * A0297
          ROMPTR  0E7 007                        * A029C
          3PICK                                  * A02A7
          ROMPTR  0E4 049                        * A02AC
          LOOP                                   * A02B7
          3DROP                                  * A02BC
        ;                                        * A02C1

* ROMPTR 0E4 049
* refs (1): 9DA1F
ROMP_0E4_049:
        ::                                       * A02C6
          OVER                                   * A02CB
          ROMPTR  0E4 00E                        * A02D0
          #0=case                                * A02DB
          ROMPTR  0E7 007                        * A02E0
          ROMPTR  0E4 010                        * A02EB
        ;                                        * A02F6

* ROMPTR 0E4 04A
* refs (1): 9DA1F
ROMP_0E4_04A:
        ::                                       * A02FB
          ROMPTR  0E4 04F                        * A0300
          $       "ALL"                          * A030B
          EQUALNOTcase                           * A031B
          ROMPTR  0E7 007                        * A0320
          BINT1                                  * A032B
          ROMPTR  0E4 04C                        * A0330
        ;                                        * A033B

* ROMPTR 0E4 04B
* refs (1): 9DA1F
ROMP_0E4_04B:
        ::                                       * A0340
          ROMPTR  0E4 04F                        * A0345
          $       "ALL"                          * A0350
          EQUALNOTcase                           * A0360
          ROMPTR  0E7 007                        * A0365
          BINT0                                  * A0370
          ROMPTR  0E4 04C                        * A0375
        ;                                        * A0380

* ROMPTR 0E4 04C
* refs (1): 9DA1F
ROMP_0E4_04C:
        ::                                       * A0385
          ROMPTR  0E4 018                        * A038A
          LENCOMP                                * A0395
          DUP#1-                                 * A039A
          ZERO_DO                                * A039F
          OVERSWAP                               * A03A4
          LOOP                                   * A03A9
          {}N                                    * A03AE
          ROMPTR  0E4 019                        * A03B3
        ;                                        * A03BE

* ROMPTR 0E4 04D
* refs (1): 9DA1F
ROMP_0E4_04D:
        ::                                       * A03C3
          ROMPTR  0E4 04F                        * A03C8
          DUP                                    * A03D3
          ROMPTR  0E4 00E                        * A03D8
          #0=case                                * A03E3
          ROMPTR  0E7 007                        * A03E8
          FALSE'                                 * A03F3
          ROMPTR  0E4 024                        * A03F8
          COLA_EVAL                              * A0403
        ;                                        * A0408

* ROMPTR 0E4 04E
* refs (1): 9DA1F
ROMP_0E4_04E:
        ::                                       * A040D
          ROMPTR  0E4 04F                        * A0412
          DUP                                    * A041D
          $       "ALL"                          * A0422
          EQUALNOTcase                           * A0432
          ROMPTR  0E7 007                        * A0437
          FALSE'                                 * A0442
          ROMPTR  0E4 022                        * A0447
          COLA_EVAL                              * A0452
        ;                                        * A0457

* ROMPTR 0E4 04F
* refs (1): 9DA1F
ROMP_0E4_04F:
        ::                                       * A045C
          ERRSET                                 * A0461
          ::                                     * A0466
            ROMPTR  0E4 02E                      * A046B
            DROP                                 * A0476
            TRUE                                 * A047B
          ;                                      * A0480
          ERRTRAP                                * A0485
          FALSE                                  * A048A
          IT                                     * A048F
          ROMPTR  0E4 032                        * A0494
        ;                                        * A049F

* ROMPTR 0E4 051
* refs (2): 9DA1F 9DA1F
ROMP_0E4_051:
        CON(5)  DOARRY                           * A04A4  array 8
        LENGTH                                   * A04A9  length, to #A05DD
        CON(5)  DOCSTR                           * A04AE  element type
        CON(5)  1                                * A04B3  dimensions
        CON(5)  8                                * A04B8
        $BODY   "Invalid Mpar"                   * A04BD  1
        $BODY   "Single Equation"                * A04DA  2
        $BODY   "EQ Invalid for MINIT"           * A04FD  3
        $BODY   "Too Many Unknowns"              * A052A  4
        $BODY   "All Variables Known"            * A0551  5
        $BODY   "Illegal During MROOT"           * A057C  6
        $BODY   "Solving for "                   * A05A9  7
        $BODY   "Searching"                      * A05C6  8
        ENDLENGTH                                * A05DD

LIB0E4.hash:
        CON(5)  DOHSTR                           * A05DD  hash table of library 0E4
        LENGTH                                   * A05E2  length, to #A0641
        CON(5)  0                                * A05E7  names of length 1
        CON(5)  0                                * A05EC  names of length 2
        CON(5)  0                                * A05F1  names of length 3
        CON(5)  0                                * A05F6  names of length 4
        CON(5)  0                                * A05FB  names of length 5
        CON(5)  0                                * A0600  names of length 6
        CON(5)  0                                * A0605  names of length 7
        CON(5)  0                                * A060A  names of length 8
        CON(5)  0                                * A060F  names of length 9
        CON(5)  0                                * A0614  names of length 10
        CON(5)  0                                * A0619  names of length 11
        CON(5)  0                                * A061E  names of length 12
        CON(5)  0                                * A0623  names of length 13
        CON(5)  0                                * A0628  names of length 14
        CON(5)  0                                * A062D  names of length 15
        CON(5)  0                                * A0632  names of length 16
        REL(5)  L_A063C                          * A0637  end of the names
L_A063C:
        CON(5)  0                                * A063C  command 000 has no name
        ENDLENGTH                                * A0641

LIB0E4.link:
        CON(5)  DOHSTR                           * A0641  link table of library 0E4
        LENGTH                                   * A0646  length, to #A07E5
        REL(5)  ROMP_0E4_000                     * A064B  000 
        REL(5)  ROMP_0E4_001                     * A0650  001 
        REL(5)  ROMP_0E4_002                     * A0655  002 
        REL(5)  ROMP_0E4_003                     * A065A  003 
        REL(5)  ROMP_0E4_004                     * A065F  004 
        REL(5)  ROMP_0E4_005                     * A0664  005 
        REL(5)  ROMP_0E4_006                     * A0669  006 
        REL(5)  ROMP_0E4_007                     * A066E  007 
        REL(5)  ROMP_0E4_008                     * A0673  008 
        REL(5)  ROMP_0E4_009                     * A0678  009 
        REL(5)  ROMP_0E4_00A                     * A067D  00A 
        REL(5)  ROMP_0E4_00B                     * A0682  00B 
        REL(5)  ROMP_0E4_00C                     * A0687  00C 
        REL(5)  ROMP_0E4_00D                     * A068C  00D 
        REL(5)  ROMP_0E4_00E                     * A0691  00E 
        REL(5)  ROMP_0E4_00F                     * A0696  00F 
        REL(5)  ROMP_0E4_010                     * A069B  010 
        REL(5)  ROMP_0E4_011                     * A06A0  011 
        REL(5)  ~MESRclEqn                       * A06A5  012 ~MESRclEqn
        REL(5)  ROMP_0E4_013                     * A06AA  013 
        REL(5)  ROMP_0E4_014                     * A06AF  014 
        REL(5)  ROMP_0E4_015                     * A06B4  015 
        REL(5)  ROMP_0E4_016                     * A06B9  016 
        REL(5)  ROMP_0E4_017                     * A06BE  017 
        REL(5)  ROMP_0E4_018                     * A06C3  018 
        REL(5)  ROMP_0E4_019                     * A06C8  019 
        REL(5)  ROMP_0E4_01A                     * A06CD  01A 
        REL(5)  ROMP_0E4_01B                     * A06D2  01B 
        REL(5)  ROMP_0E4_01C                     * A06D7  01C 
        REL(5)  ROMP_0E4_01D                     * A06DC  01D 
        REL(5)  ROMP_0E4_01E                     * A06E1  01E 
        REL(5)  ROMP_0E4_01F                     * A06E6  01F 
        REL(5)  ROMP_0E4_020                     * A06EB  020 
        REL(5)  ROMP_0E4_021                     * A06F0  021 
        REL(5)  ROMP_0E4_022                     * A06F5  022 
        REL(5)  ROMP_0E4_023                     * A06FA  023 
        REL(5)  ROMP_0E4_024                     * A06FF  024 
        REL(5)  ROMP_0E4_025                     * A0704  025 
        REL(5)  ROMP_0E4_026                     * A0709  026 
        REL(5)  ROMP_0E4_027                     * A070E  027 
        REL(5)  ROMP_0E4_028                     * A0713  028 
        REL(5)  ROMP_0E4_029                     * A0718  029 
        REL(5)  ROMP_0E4_02A                     * A071D  02A 
        REL(5)  ROMP_0E4_02B                     * A0722  02B 
        REL(5)  ROMP_0E4_02C                     * A0727  02C 
        REL(5)  ROMP_0E4_02D                     * A072C  02D 
        REL(5)  ROMP_0E4_02E                     * A0731  02E 
        REL(5)  ROMP_0E4_02F                     * A0736  02F 
        REL(5)  ROMP_0E4_030                     * A073B  030 
        REL(5)  ROMP_0E4_031                     * A0740  031 
        REL(5)  ROMP_0E4_032                     * A0745  032 
        REL(5)  ROMP_0E4_033                     * A074A  033 
        REL(5)  ROMP_0E4_034                     * A074F  034 
        REL(5)  ROMP_0E4_035                     * A0754  035 
        REL(5)  ROMP_0E4_036                     * A0759  036 
        REL(5)  ROMP_0E4_037                     * A075E  037 
        REL(5)  ROMP_0E4_038                     * A0763  038 
        REL(5)  ROMP_0E4_039                     * A0768  039 
        REL(5)  ROMP_0E4_03A                     * A076D  03A 
        REL(5)  ROMP_0E4_03B                     * A0772  03B 
        REL(5)  ROMP_0E4_03C                     * A0777  03C 
        REL(5)  ROMP_0E4_03D                     * A077C  03D 
        REL(5)  ROMP_0E4_03E                     * A0781  03E 
        REL(5)  ROMP_0E4_03F                     * A0786  03F 
        REL(5)  ROMP_0E4_040                     * A078B  040 
        REL(5)  ROMP_0E4_041                     * A0790  041 
        REL(5)  ROMP_0E4_042                     * A0795  042 
        REL(5)  ROMP_0E4_043                     * A079A  043 
        REL(5)  ROMP_0E4_044                     * A079F  044 
        REL(5)  ROMP_0E4_045                     * A07A4  045 
        REL(5)  ROMP_0E4_046                     * A07A9  046 
        REL(5)  ROMP_0E4_047                     * A07AE  047 
        REL(5)  ROMP_0E4_048                     * A07B3  048 
        REL(5)  ROMP_0E4_049                     * A07B8  049 
        REL(5)  ROMP_0E4_04A                     * A07BD  04A 
        REL(5)  ROMP_0E4_04B                     * A07C2  04B 
        REL(5)  ROMP_0E4_04C                     * A07C7  04C 
        REL(5)  ROMP_0E4_04D                     * A07CC  04D 
        REL(5)  ROMP_0E4_04E                     * A07D1  04E 
        REL(5)  ROMP_0E4_04F                     * A07D6  04F 
        REL(5)  ROMP_0E4_051                     * A07DB  050 
        REL(5)  ROMP_0E4_051                     * A07E0  051 
        ENDLENGTH                                * A07E5
        NIBHEX  0000                             * A07E5  ..
