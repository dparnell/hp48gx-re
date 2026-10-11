* HP 48GX ROM revision R, #38000-#3A00C: Status area and annunciators
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: SetDA123NoCh ClrDAsOK SetDA3NoCh SetDA1NoCh SetDA2aNoCh SetDA13NoCh POLRestoreUI POLSaveUI POLResUI&Err ClrDA1IsStat SetDA3Bad SetDA12NoCh
* Follows on from the previous file (at #38000 in the original ROM).
        A=DAT0  A                                * 38000
        D0=A                                     * 38003
        A=R2                                     * 38006
        C=0     A                                * 38009
        LC(2)   #14                              * 3800B
        A=A+C   A                                * 3800F
        D0=D0+  5                                * 38011
        DAT0=A  A                                * 38014
        D0=D0+  15                               * 38017
        C=R3                                     * 3801A
        DAT0=C  A                                * 3801D
        C=0     A                                * 38020
        C=C+1   A                                * 38022
        ?ST=0   6                                * 38024
        GOYES   L_38037                          * 38027
        A=R4                                     * 38029
        D0=D0+  5                                * 3802C
        DAT0=A  A                                * 3802F
        D0=D0-  5                                * 38032
        C=C+1   A                                * 38035
L_38037:
        D0=D0-  5                                * 38037
        DAT0=C  A                                * 3803A
        ?ST=0   8                                * 3803D
        GOYES   L_38046                          * 38040
        GOSUB   SUB_38327                        * 38042
L_38046:
        GOVLNG  GETPTRLOOP                       * 38046

* refs (1): 37F5C
SUB_3804D:
        ST=0    1                                * 3804D
L_38050:
        D=C     A                                * 38050
        GOSBVL  ROOM                             * 38052
        DCEX    A                                * 38059
        ?D>=C   A                                * 3805B
        RTNYES                                   * 3805E
        ?ST=0   1                                * 38060
        GOYES   L_38069                          * 38063
        GOTO    L_37E8B                          * 38065
L_38069:
        RSTK=C                                   * 38069
        GOSBVL  GARBAGECOL                       * 3806B  inline data follows
        C=RSTK                                   * 38072
        ST=1    1                                * 38074
        GONC    L_38050                          * 38077

* refs (2): 37F63 37FEF
SUB_3807A:
        D0=(5)  DSKTOP                           * 3807A
        A=DAT0  A                                * 38081
        D0=A                                     * 38084
        A=DAT0  A                                * 38087
        D0=A                                     * 3808A
        ?ST=1   7                                * 3808D
        GOYES   L_380D2                          * 38090
        B=C     A                                * 38092
        GOSBVL  SKIPOB                           * 38094
        A=DAT0  A                                * 3809B
        ?ST=1   5                                * 3809E
        GOYES   L_380B4                          * 380A1
        A=A-B   A                                * 380A3
        DAT0=A  A                                * 380A5
        AD0EX                                    * 380A8
        C=B     A                                * 380AB
        GOVLNG  MOVERSD                          * 380AD
L_380B4:
        A=A+B   A                                * 380B4
        DAT0=A  A                                * 380B6
        AD0EX                                    * 380B9
        C=B     A                                * 380BC
        RSTK=C                                   * 380BE
        GOSBVL  MOVERSU                          * 380C0
        C=RSTK                                   * 380C7
        A=B     A                                * 380C9
        D1=A                                     * 380CB
        GOTO    L_38118                          * 380CE
L_380D2:
        CAEX    A                                * 380D2
        RSTK=C                                   * 380D4
        C=R1                                     * 380D6
        RSTK=C                                   * 380D9
        C=A     A                                * 380DB
        GOSBVL  SUB_0852C                        * 380DD
        C=RSTK                                   * 380E4
        R1=C                                     * 380E6
        C=RSTK                                   * 380E9
        D0=C                                     * 380EB
        GOSBVL  SKIPOB                           * 380EE
        AD0EX                                    * 380F5
        C=R0                                     * 380F8
        ?ST=1   5                                * 380FB
        GOYES   L_38109                          * 380FE
        A=A-C   A                                * 38100
        GOVLNG  MOVEDSU                          * 38102
L_38109:
        GOSBVL  MOVEDSD                          * 38109
        A=B     A                                * 38110
        D1=A                                     * 38112
        C=R0                                     * 38115
L_38118:
        GOVLNG  WIPEOUT                          * 38118
        RPL

* [F%] -> [F%]'
* refs (8): 1D3A1 1D3F1 8E2DD 8E300 8F39B 8F3B9 ...
MATTRN:
        ::                                       * 3811F
          DUP                                    * 38124
          MDIMS                                  * 38129
          NOT?GOTO                               * 3812E
          L_37DEB                                * 38133
          2DROP                                  * 38138
          CKREF                                  * 3813D
          OBJ_38185                              * 38142
        ;                                        * 38147

* refs (1): 1D3D3
@trn(ar):
        ::                                       * 3814C
          DUP                                    * 38151
          MDIMS                                  * 38156
          NOT?GOTO                               * 3815B
          L_37DEB                                * 38160
          2DROP                                  * 38165
          FreeRefs                               * 3816A
          OBJ_38185                              * 3816F
        ;                                        * 38174

* refs (11): CBC7D CBC91 CBFA2 CBFF4 CC216 CC24A ...
@trn!(ar):
        CON(5)  (*)+5                            * 38179  primitive code object
        ASSEMBLE
        ST=0    1                                * 3817E
        GOTO    L_3818D                          * 38181

* refs (6): 38142 3816F 939B6 939E3 93A02 93A0C
OBJ_38185:
        CON(5)  (*)+5                            * 38185  primitive code object
        ST=1    1                                * 3818A
L_3818D:
        GOSBVL  SAVPTR                           * 3818D
        A=DAT1  A                                * 38194
        D0=A                                     * 38197
        D0=D0+  10                               * 3819A
        A=DAT0  A                                * 3819D
        LC(5)   DOREAL                           * 381A0
        ST=0    0                                * 381A7
        ?C=A    A                                * 381AA
        GOYES   L_381B2                          * 381AD
        ST=1    0                                * 381AF
L_381B2:
        D0=D0+  10                               * 381B2
        A=DAT0  A                                * 381B5
        R1=A                                     * 381B8
        D0=D0+  5                                * 381BB
        A=DAT0  A                                * 381BE
        R2=A                                     * 381C1
        D0=D0+  5                                * 381C4
        GOSUB   SUB_381FA                        * 381C7
        GOSBVL  GETPTR                           * 381CB
        A=DAT1  A                                * 381D2
        AD1EX                                    * 381D5
        D1=D1+  15                               * 381D8
        D1=D1+  5                                * 381DB
        C=R2                                     * 381DE
        DAT1=C  A                                * 381E1
        D1=D1+  5                                * 381E4
        C=R1                                     * 381E7
        DAT1=C  A                                * 381EA
        D1=A                                     * 381ED
        A=DAT0  A                                * 381F0
        D0=D0+  5                                * 381F3
        PC=(A)                                   * 381F6

* refs (1): 381C7
SUB_381FA:
        CD0EX                                    * 381FA
        R4=C                                     * 381FD
        C=R1                                     * 38200
        D=C     A                                * 38203
        C=R2                                     * 38205
        GOSUB   SUB_3833E                        * 38208
        C=B     A                                * 3820C
        R3=C                                     * 3820E
        D=C     A                                * 38211
L_38213:
        D=D-1   A                                * 38213
        ?D=0    A                                * 38215
        GOYES   L_38288                          * 38218
        GOSUB   SUB_3830E                        * 3821A
        A=DAT0  W                                * 3821E
        B=A     S                                * 38222
        B=B+B   S                                * 38225
        B=B+B   S                                * 38228
        GOC     L_38213                          * 3822B
        P=      15                               * 3822E
        LC(1)   #4                               * 38230
        A=A!C   S                                * 38233
        DAT0=A  W                                * 38237
        P=      0                                * 3823B
        ?ST=0   0                                * 3823D
        GOYES   L_3824C                          * 38240
        D0=D0+  16                               * 38242
        C=DAT0  W                                * 38245
        R0=C                                     * 38249
L_3824C:
        GOSUB   SUB_382DC                        * 3824C
        C=DAT0  W                                * 38250
        CAEX    W                                * 38254
        DAT0=C  W                                * 38257
        ?ST=0   0                                * 3825B
        GOYES   L_3826E                          * 3825E
        D0=D0+  16                               * 38260
        C=DAT0  W                                * 38263
        CR0EX                                    * 38267
        DAT0=C  W                                * 3826A
L_3826E:
        B=A     S                                * 3826E
        B=B+B   S                                * 38271
        B=B+B   S                                * 38274
        GOC     L_38213                          * 38277
        P=      15                               * 3827A
        LC(1)   #4                               * 3827C
        A=A!C   S                                * 3827F
        P=      0                                * 38283
        GONC    L_3824C                          * 38285
L_38288:
        P=      15                               * 38288
        LC(1)   #B                               * 3828A
        B=C     S                                * 3828D
        P=      0                                * 38290
        C=R3                                     * 38292
        D=C     A                                * 38295
        C=R4                                     * 38297
        D0=C                                     * 3829A
        D=D-1   A                                * 3829D
        D0=D0-  1                                * 3829F
L_382A2:
        D0=D0+  16                               * 382A2
        A=DAT0  S                                * 382A5
        A=A&B   S                                * 382A9
        DAT0=A  S                                * 382AD
        ?ST=0   0                                * 382B1
        GOYES   L_382D5                          * 382B4
        D0=D0+  1                                * 382B6
        A=DAT0  W                                * 382B9
        D0=D0+  15                               * 382BD
        ?ST=0   1                                * 382C0
        GOYES   L_382D5                          * 382C3
        ?A=0    W                                * 382C5
        GOYES   L_382D5                          * 382C8
        SETDEC                                   * 382CA
        A=-A-1  S                                * 382CC
        SETHEX                                   * 382CF
        DAT0=A  S                                * 382D1
L_382D5:
        D=D-1   A                                * 382D5
        GONC    L_382A2                          * 382D7
        RTN                                      * 382DA

* refs (1): 3824C
SUB_382DC:
        C=R1                                     * 382DC
        DCEX    A                                * 382DF
        C=C-1   A                                * 382E1
        RSTK=C                                   * 382E3
        GOSUB   SUB_3833E                        * 382E5
        C=RSTK                                   * 382E9
        BCEX    A                                * 382EB
        RSTK=C                                   * 382ED
        C=R2                                     * 382EF
        D=0     A                                * 382F2
        D=D-1   A                                * 382F4
L_382F6:
        D=D+1   A                                * 382F6
        B=B-C   A                                * 382F8
        GONC    L_382F6                          * 382FA
        C=R3                                     * 382FD
        C=C-1   A                                * 38300
        GOSUB   SUB_3833E                        * 38302
        C=RSTK                                   * 38306
        C=C+1   A                                * 38308
        C=C-B   A                                * 3830A
        D=C     A                                * 3830C

* refs (1): 3821A
SUB_3830E:
        C=D     A                                * 3830E
        C=C-1   A                                * 38310
        CSL     A                                * 38312
        ?ST=0   0                                * 38314
        GOYES   L_3831B                          * 38317
        C=C+C   A                                * 38319
L_3831B:
        B=C     A                                * 3831B
        C=R4                                     * 3831D
        C=C+B   A                                * 38320
        D0=C                                     * 38322
        RTN                                      * 38325

* refs (2): 37E90 38042
SUB_38327:
        D0=(5)  INITEN                           * 38327
        LC(1)   #F                               * 3832E
        DAT0=C  1                                * 38331
        RTN                                      * 38335

* refs (5): 37EA2 37EB3 37EBA 37EC1 37ED4
SUB_38337:
        GOVLNG  POP#                             * 38337

* refs (3): 38208 382E5 38302
SUB_3833E:
        GOVLNG  L_35790                          * 3833E
        RPL

* refs (219): A280B A2884 A2D6B A34B6 A352F A35A3 ...
OBJ_38345:
        ::                                       * 38345
          'R                                     * 3834A
          ROMPTR@                                * 3834F
          DROP                                   * 38354
        ;                                        * 38359

* refs (6): 0FDB8 0FE62 0FF34 0FFBB CAC27 CAC7C
OBJ_3835E:
        CON(5)  DOARRY                           * 3835E  array 10
        LENGTH                                   * 38363  length, to #38417

0.00000010:
        CON(5)  DOREAL                           * 38368  element type
        CON(5)  1                                * 3836D  dimensions
        CON(5)  10                               * 38372
        NIBHEX  0000000000000000                 * 38377  0E0
        NIBHEX  0000000000000000                 * 38387  0E0
        NIBHEX  0000000000000000                 * 38397  0E0
        NIBHEX  0000000000000000                 * 383A7  0E0
        NIBHEX  0000000000000000                 * 383B7  0E0
        NIBHEX  0000000000000000                 * 383C7  0E0
        NIBHEX  0000000000000000                 * 383D7  0E0
        NIBHEX  0000000000000000                 * 383E7  0E0
        NIBHEX  0000000000000000                 * 383F7  0E0
        NIBHEX  0000000000000000                 * 38407  0E0
        ENDLENGTH                                * 38417

* refs (1): 0F3EE
OBJ_38417:
        CON(5)  DOARRY                           * 38417  array 10
        LENGTH                                   * 3841C  length, to #384D0

0.00000010_38421:
        CON(5)  DOREAL                           * 38421  element type
        CON(5)  1                                * 38426  dimensions
        CON(5)  10                               * 3842B
        NIBHEX  0000000000000000                 * 38430  0E0
        NIBHEX  0000000000000000                 * 38440  0E0
        NIBHEX  0000000000000000                 * 38450  0E0
        NIBHEX  0000000000000000                 * 38460  0E0
        NIBHEX  0000000000000010                 * 38470  1E0
        NIBHEX  0000000000000000                 * 38480  0E0
        NIBHEX  0000000000000000                 * 38490  0E0
        NIBHEX  0000000000000000                 * 384A0  0E0
        NIBHEX  0000000000000000                 * 384B0  0E0
        NIBHEX  0000000000000000                 * 384C0  0E0
        ENDLENGTH                                * 384D0

* refs (1): CAC68
OBJ_384D0:
        CON(5)  DOARRY                           * 384D0  array 10
        LENGTH                                   * 384D5  length, to #38589

0.00000010_384DA:
        CON(5)  DOREAL                           * 384DA  element type
        CON(5)  1                                * 384DF  dimensions
        CON(5)  10                               * 384E4
        NIBHEX  0000000000000000                 * 384E9  0E0
        NIBHEX  0000000000000000                 * 384F9  0E0
        NIBHEX  0000000000000000                 * 38509  0E0
        NIBHEX  0000000000000000                 * 38519  0E0
        NIBHEX  0000000000000000                 * 38529  0E0
        NIBHEX  0000000000000000                 * 38539  0E0
        NIBHEX  0000000000000000                 * 38549  0E0
        NIBHEX  0000000000000010                 * 38559  1E0
        NIBHEX  0000000000000000                 * 38569  0E0
        NIBHEX  0000000000000000                 * 38579  0E0
        ENDLENGTH                                * 38589
        NIBHEX  00000                            * 38589  ..

* refs (1): 0214E
StartupProc:
        ::                                       * 3858E
          OBJ_385A7                              * 38593
          ERRTRAP                                * 38598
          VLM                                    * 3859D
        ;                                        * 385A2

* refs (1): 38593
OBJ_385A7:
        ::                                       * 385A7
          InitSysUI                              * 385AC
L_385B1:
          BEGIN                                  * 385B1
          AtUserStack                            * 385B6
          SysMenuCheck                           * 385BB
          SysDisplay                             * 385C0
          GetKeyOb                               * 385C5
          ERRSET                                 * 385CA
          DoKeyOb                                * 385CF
          ERRTRAP                                * 385D4
          SysErrorTrap                           * 385D9
          AGAIN                                  * 385DE
        ;                                        * 385E3

* refs (1): 385AC
InitSysUI:
        ::                                       * 385E8
          CLEARLCD                               * 385ED
          InitDispModes                          * 385F2
          OBJ_3FEEE                              * 385F7
          BINT62                                 * 385FC
          ClrSysFlag                             * 38601
          DoMenuMTH                              * 38606
          InitEd&Modes                           * 3860B
          InitPOLVars                            * 38610
          OBJ_6CC32                              * 38615
          OBJ_17F40                              * 3861A
          DelLastArg                             * 3861F
          ?FlashAlert                            * 38624
          ERROR@                                 * 38629
          #5=                                    * 3862E
          IT                                     * 38633

Warning005:
          ::                                     * 38638
            ERRORCLR                             * 3863D
            BINT5                                * 38642
            JstGetTHEMESG                        * 38647
            DoWarning                            * 3864C
          ;                                      * 38651
          UNDO_ON?                               * 38656
          IT                                     * 3865B
          SAVESTACK                              * 38660
          AtUserStack                            * 38665
        ;                                        * 3866A

* ->
* refs (2): 385BB 38B0E
SysMenuCheck:
        ::                                       * 3866F
          DA3NoCh?                               * 38674
          ?SEMI                                  * 38679
          OBJ_417D1                              * 3867E
          IT                                     * 38683
          OBJ_41787                              * 38688
          OBJ_41804                              * 3868D
          NOT?SEMI                               * 38692
          SetThisRow                             * 38697
        ;                                        * 3869C

* ->
* refs (1): 385C0
SysDisplay:
        ::                                       * 386A1
          DA2aOK?NOTIT                           * 386A6
          ?DispStack                             * 386AB
          DA1OK?NOTIT                            * 386B0
          ?DispStatus                            * 386B5
          DA2bOK?NOTIT                           * 386BA
          DispEditLine                           * 386BF
          DA3OK?NOTIT                            * 386C4
          ?DispMenu                              * 386C9
          ClrDAsOK                               * 386CE
        ;                                        * 386D3

* ->
* refs (2): 041CA 38624
?FlashAlert:
        ::                                       * 386D8
          AlertStatus                            * 386DD
          OBJ_422C6                              * 386E2
          ?SKIP                                  * 386E7

and(s,<E>):
          ::                                     * 386EC
            BINT14                               * 386F1
            #AND                                 * 386F6
          ;                                      * 386FB
          DUP#0=csDROP                           * 38700
          #132_64E8C                             * 38705
          JstGetTHEMESG                          * 3870A
          SWAP                                   * 3870F
          Alert$                                 * 38714
          !append$                               * 38719
          FlashWarning                           * 3871E
        ;                                        * 38723

* refs (4): 1469F 385D9 3897B DD430
SysErrorTrap:
        ::                                       * 38728
          OBJ_387BE                              * 3872D
          ERROR@                                 * 38732
          BINT0                                  * 38737
          #=casedrop                             * 3873C
          OBJ_3881D                              * 38741
          Err#Cont                               * 38746
          #=casedrop                             * 3874B
          OBJ_3875F                              * 38750
          Err#Kill                               * 38755
          #=casedrop                             * 3875A

* refs (1): 38750
OBJ_3875F:
          ::                                     * 3875F
            Halted?                              * 38764
            caseERRJMP                           * 38769
            OBJ_3881D                            * 3876E
          ;                                      * 38773
          #CAlarmErr                             * 38778
          #=case                                 * 3877D
          OBJ_3894E                              * 38782
          OBJ_18802                              * 38787
          ERROR@                                 * 3878C
          OBJ_3881D                              * 38791
          ERRBEEP                                * 38796
          MakeMessage(proc,s)                    * 3879B
          TOADISP                                * 387A0
          REDISPHBUFF                            * 387A5
          DISPROW1                               * 387AA
          DISPROW2                               * 387AF
          SetDA1Temp                             * 387B4
        ;                                        * 387B9

* refs (3): 23402 3872D D49EA
OBJ_387BE:
        ::                                       * 387BE
          OBJ_18295                              * 387C3
          OBJ_41837                              * 387C8
          NOT?SEMI                               * 387CD
          LastMenuDef@                           * 387D2
          LastMenuRow@                           * 387D7
          2DUP                                   * 387DC
          ERRSET                                 * 387E1
          ::                                     * 387E6
            StartMenu                            * 387EB
            LastMenuRow!                         * 387F0
            LastMenuDef!                         * 387F5
          ;                                      * 387FA
          ERRTRAP                                * 387FF
          ::                                     * 38804
            DropSysObs                           * 38809
            DoMenuMTH                            * 3880E
          ;                                      * 38813
        ;                                        * 38818

* refs (8): 2340C 38741 3876E 38791 3895D 38967 ...
OBJ_3881D:
        ::                                       * 3881D
          EditLExists?                           * 38822
          IT                                     * 38827
          ::                                     * 3882C
            UnableLastCmd                        * 38831
            EDITLINE$                            * 38836
            SaveLastEdit                         * 3883B
          ;                                      * 38840
          InitEd&Modes                           * 38845
          OBJ_38854                              * 3884A
        ;                                        * 3884F

* refs (2): 17BAE 3884A
OBJ_38854:
        ::                                       * 38854
          AppError?                              * 38859
          IT                                     * 3885E
          ::                                     * 38863
            InitPOLVars                          * 38868
            DoMenuMTH                            * 3886D
            ClrAppError                          * 38872
          ;                                      * 38877
          OBJ_3FEEE                              * 3887C
          InitDispModes                          * 38881
          0LASTOWDOB!                            * 38886
          SAVEERRN                               * 3888B
          ERRORCLR                               * 38890
          FLUSHKEYS                              * 38895
        ;                                        * 3889A

* refs (2): 3879B D4A21
MakeMessage(proc,s):
        ::                                       * 3889F
          DUP                                    * 388A4
          GETTHEMESG                             * 388A9
          3UNROLL                                * 388AE
          #EXITERR                               * 388B3
          #=                                     * 388B8
          casedrop                               * 388BD
          SEP$NL                                 * 388C2
          REALSTRSTR                             * 388C7
          JstGetTHEMESG                          * 388CC
          SWAPDUP                                * 388D1
          BINT0                                  * 388D6
          EQUAL                                  * 388DB
          caseDROP                               * 388E0
          PTR>ROMPTR                             * 388E5
          PALPTRDCMP                             * 388EA
          NOTcaseDROP                            * 388EF
          APPEND_SPACE                           * 388F4
          SWAP                                   * 388F9
          !append$                               * 388FE
        ;                                        * 38903

* $ ->
* refs (7): 3864C 39C84 3DE86 40B42 42C15 4367B ...
DoWarning:
        ::                                       * 38908
          ERRBEEP                                * 3890D
          TOADISP                                * 38912
          DISPSTATUS2                            * 38917
          SetDA1Temp                             * 3891C
        ;                                        * 38921

* $ ->
* refs (2): 04288 3871E
FlashWarning:
        ::                                       * 38926
          ERRBEEP                                * 3892B
          Save16                                 * 38930
          SWAP                                   * 38935
          DISPSTATUS2                            * 3893A
          VERYVERYSLOW                           * 3893F
          Restore16                              * 38944
        ;                                        * 38949

* refs (1): 38782
OBJ_3894E:
        ::                                       * 3894E
          OBJ_424B4                              * 38953
          case                                   * 38958
          OBJ_3881D                              * 3895D
          CtlAlarm@                              * 38962
          OBJ_3881D                              * 38967
          ERRSET                                 * 3896C
          ExecAlarm(r)                           * 38971
          ERRTRAP                                * 38976
          SysErrorTrap                           * 3897B
        ;                                        * 38980

* Disp Keys NonAppKeys? DoStdKeys? menu #row suspendOK? ExitCond AppErr ->
* refs (3): 4CED3 4D934 69C2D
ParOuterLoop:
        ::                                       * 38985
          POLSaveUI                              * 3898A
          ERRSET                                 * 3898F

* <REF>ParOuterLoop
POLSet&KeyUI:
          ::                                     * 38994
            POLSetUI                             * 38999
            POLKeyUI                             * 3899E
          ;                                      * 389A3
          ERRTRAP                                * 389A8
          POLResUI&Err                           * 389AD
          POLRestoreUI                           * 389B2
        ;                                        * 389B7

* Disp Keys NonAppKeys? DoStdKeys? menu #row suspendOK? ExitCond AppErr ->
* refs (18): 199F0 3898A 41F6A 42F49 436A8 659E3 ...
POLSaveUI:
        ::                                       * 389BC
          AppMode?                               * 389C1
          ITE                                    * 389C6

RclUI:
          ::                                     * 389CB
            LastMenuDef@                         * 389D0
            LastMenuRow@                         * 389D5
            AppDisplay@                          * 389DA
            AppKeys@                             * 389DF
            NAppKeyOK?                           * 389E4
            DoStdKeys?                           * 389E9
            MenuDef@                             * 389EE
            MenuRow@                             * 389F3
            AppSuspOK?                           * 389F8
            AppExitCond@                         * 389FD
            AppError@                            * 38A02
            BINT11                               * 38A07
          ;                                      * 38A0C

RclHPUI:
          ::                                     * 38A11
            LastMenuDef@                         * 38A16
            LastMenuRow@                         * 38A1B
            MenuDef@                             * 38A20
            MenuRow@                             * 38A25
            BINT4                                * 38A2A
          ;                                      * 38A2F
          {}N                                    * 38A34

{'SavedUI}:
          {                                      * 38A39

* refs (1): 38B9A
LAMSavedUI:
            LAM     'SavedUI                     * 38A3E
          }                                      * 38A55
          BIND                                   * 38A5A
        ;                                        * 38A5F

* <REF>ParOuterLoop
* refs (14): 19B21 38999 38AD2 41FBF 43061 4373E ...
POLSetUI:
        ::                                       * 38A64
          AppError!                              * 38A69
          AppExitCond!                           * 38A6E
          ITE                                    * 38A73
          SetAppSuspOK                           * 38A78
          ClrAppSuspOK                           * 38A7D
          OVER                                   * 38A82
          FALSE                                  * 38A87
          EQITE                                  * 38A8C
          2DROP                                  * 38A91
          StartMenu                              * 38A96
          ITE                                    * 38A9B
          SetDoStdKeys                           * 38AA0
          ClrDoStdKeys                           * 38AA5
          ITE                                    * 38AAA
          SetNAppKeyOK                           * 38AAF
          ClrNAppKeyOK                           * 38AB4
          AppKeys!                               * 38AB9
          AppDisplay!                            * 38ABE
          SetAppMode                             * 38AC3
        ;                                        * 38AC8

* refs (1): 38BB3
OBJ_38ACD:
        ::                                       * 38ACD
          POLSetUI                               * 38AD2
          LastMenuRow!                           * 38AD7
          LastMenuDef!                           * 38ADC
          ClrAppError                            * 38AE1
        ;                                        * 38AE6

* ->
* refs (14): 19B49 3899E 41FC4 4306B 43748 8D3A5 ...
POLKeyUI:
        ::                                       * 38AEB
          BEGIN                                  * 38AF0
          AppExitCond@                           * 38AF5
          EVAL                                   * 38AFA
          NOT                                    * 38AFF
          WHILE                                  * 38B04

* ->
1POLKeyUI:
          ::                                     * 38B09
            SysMenuCheck                         * 38B0E
            AppDisplay@                          * 38B13
            EVAL                                 * 38B18
            GetKeyOb                             * 38B1D
            ERRSET                               * 38B22
            DoKeyOb                              * 38B27
            ERRTRAP                              * 38B2C
            POLErrorTrap                         * 38B31
          ;                                      * 38B36
          REPEAT                                 * 38B3B
        ;                                        * 38B40

* refs (1): 38B31
POLErrorTrap:
        ::                                       * 38B45
          AppError?                              * 38B4A
          IT                                     * 38B4F
          ERRJMP                                 * 38B54
          OBJ_41837                              * 38B59
          IT                                     * 38B5E
          ERRJMP                                 * 38B63
          AppError@                              * 38B68
          EVAL                                   * 38B6D
        ;                                        * 38B72

* ->
* refs (18): 19B62 389AD 41FD8 4307F 4375C 659F7 ...
POLResUI&Err:
        ::                                       * 38B77
          SetAppError                            * 38B7C
          POLRestoreUI                           * 38B81
          ERRJMP                                 * 38B86
        ;                                        * 38B8B

* ->
* refs (19): 19B67 389B2 38B81 41FDD 43084 43761 ...
POLRestoreUI:
        ::                                       * 38B90
          SetAppError                            * 38B95
          LAMSavedUI                             * 38B9A
          ABND                                   * 38B9F
          INNERCOMP                              * 38BA4
          BINT11                                 * 38BA9
          #=case                                 * 38BAE
          OBJ_38ACD                              * 38BB3
          StartMenu                              * 38BB8
          LastMenuRow!                           * 38BBD
          LastMenuDef!                           * 38BC2
          InitPOLVars                            * 38BC7
          ClrAppError                            * 38BCC
        ;                                        * 38BD1

* refs (3): 38610 38868 38BC7
InitPOLVars:
        ::                                       * 38BD6
          ClrAppMode                             * 38BDB
          NoAppDisplay!                          * 38BE0
          AppKeys0                               * 38BE5
          ClrNAppKeyOK                           * 38BEA
          ClrDoStdKeys                           * 38BEF
          SetAppSuspOK                           * 38BF4
          NoAppExitCnd!                          * 38BF9
          NoAppError!                            * 38BFE
        ;                                        * 38C03

* ob ->
* refs (1): 38ABE
AppDisplay!:
        CON(5)  (*)+5                            * 38C08  primitive code object
        ASSEMBLE
        LC(5)   AppDisplay                       * 38C0D
        GOTO    L_38CA4                          * 38C14

* ->
* refs (2): 389DA 38B13
AppDisplay@:
        CON(5)  (*)+5                            * 38C18  primitive code object
        LC(5)   AppDisplay                       * 38C1D
        GOTO    L_38CB7                          * 38C24

* refs (1): 38BE0
NoAppDisplay!:
        CON(5)  (*)+5                            * 38C28  primitive code object
        LC(5)   AppDisplay                       * 38C2D
        GOTO    L_38CCA                          * 38C34

* ob ->
* refs (1): 38AB9
AppKeys!:
        CON(5)  (*)+5                            * 38C38  primitive code object
        LC(5)   AppKeys                          * 38C3D
        GOTO    L_38CA4                          * 38C44

* refs (2): 389DF 3FA16
AppKeys@:
        CON(5)  (*)+5                            * 38C48  primitive code object
        LC(5)   AppKeys                          * 38C4D
        GOTO    L_38CB7                          * 38C54

* ???
* refs (1): 38BE5
AppKeys0:
        CON(5)  (*)+5                            * 38C58  primitive code object
        LC(5)   AppKeys                          * 38C5D
        GOTO    L_38CCA                          * 38C64

* ob ->
* refs (1): 38A6E
AppExitCond!:
        CON(5)  (*)+5                            * 38C68  primitive code object
        LC(5)   AppExitCond                      * 38C6D
        GOTO    L_38CA4                          * 38C74

* -> ob
* refs (2): 389FD 38AF5
AppExitCond@:
        CON(5)  (*)+5                            * 38C78  primitive code object
        LC(5)   AppExitCond                      * 38C7D
        GOTO    L_38CB7                          * 38C84

* refs (1): 38BF9
NoAppExitCnd!:
        CON(5)  (*)+5                            * 38C88  primitive code object
        LC(5)   AppExitCond                      * 38C8D
        GOTO    L_38CCA                          * 38C94

* ob ->
* refs (1): 38A69
AppError!:
        CON(5)  (*)+5                            * 38C98  primitive code object
        LC(5)   AppError                         * 38C9D
L_38CA4:
        GOVLNG  L_08D14                          * 38CA4

* -> ob
* refs (2): 38A02 38B68
AppError@:
        CON(5)  (*)+5                            * 38CAB  primitive code object
        LC(5)   AppError                         * 38CB0
L_38CB7:
        GOVLNG  SysPtr@                          * 38CB7

* ->
* refs (1): 38BFE
NoAppError!:
        CON(5)  (*)+5                            * 38CBE  primitive code object
        LC(5)   AppError                         * 38CC3
L_38CCA:
        GOVLNG  L_08D2F                          * 38CCA

* -> flag
* refs (2): 38859 38B4A
AppError?:
        CON(5)  (*)+5                            * 38CD1  primitive code object
        LC(3)   #406                             * 38CD6
        GOTO    L_38D83                          * 38CDB

* ->
* refs (2): 38B7C 38B95
SetAppError:
        CON(5)  (*)+5                            * 38CDF  primitive code object
        LC(3)   #406                             * 38CE4
        GOTO    L_38D94                          * 38CE9

* ->
* refs (3): 38872 38AE1 38BCC
ClrAppError:
        CON(5)  (*)+5                            * 38CED  primitive code object
        LC(3)   #406                             * 38CF2
        GOTO    L_38DA5                          * 38CF7

* -> flag
* refs (5): 389C1 3FA02 479DE 4A29E 6C5DC
AppMode?:
        CON(5)  (*)+5                            * 38CFB  primitive code object
        LC(3)   #80A                             * 38D00
        GOTO    L_38D83                          * 38D05

* ->
* refs (3): 38AC3 6C3CA 6C8F5
SetAppMode:
        CON(5)  (*)+5                            * 38D09  primitive code object
        LC(3)   #80A                             * 38D0E
        GOTO    L_38D94                          * 38D13

* ->
* refs (2): 38BDB 6C5E1
ClrAppMode:
        CON(5)  (*)+5                            * 38D17  primitive code object
        LC(3)   #80A                             * 38D1C
        GOTO    L_38DA5                          * 38D21

* -> flag
* refs (2): 389E4 3FA2A
NAppKeyOK?:
        CON(5)  (*)+5                            * 38D25  primitive code object
        LC(3)   #20A                             * 38D2A
        GOTO    L_38D83                          * 38D2F

* ->
* refs (1): 38AAF
SetNAppKeyOK:
        CON(5)  (*)+5                            * 38D33  primitive code object
        LC(3)   #20A                             * 38D38
        GOTO    L_38D94                          * 38D3D

* ->
* refs (2): 38AB4 38BEA
ClrNAppKeyOK:
        CON(5)  (*)+5                            * 38D41  primitive code object
        LC(3)   #20A                             * 38D46
        GOTO    L_38DA5                          * 38D4B

* -> flag
* refs (2): 389E9 3FA3E
DoStdKeys?:
        CON(5)  (*)+5                            * 38D4F  primitive code object
        LC(3)   #80B                             * 38D54
        GOTO    L_38D83                          * 38D59

* ->
* refs (1): 38AA0
SetDoStdKeys:
        CON(5)  (*)+5                            * 38D5D  primitive code object
        LC(3)   #80B                             * 38D62
        GOTO    L_38D94                          * 38D67

* ->
* refs (2): 38AA5 38BEF
ClrDoStdKeys:
        CON(5)  (*)+5                            * 38D6B  primitive code object
        LC(3)   #80B                             * 38D70
        GOTO    L_38DA5                          * 38D75

* ->
* refs (2): 14474 389F8
AppSuspOK?:
        CON(5)  (*)+5                            * 38D79  primitive code object
        LC(3)   #206                             * 38D7E
L_38D83:
        GOVLNG  L_539E6                          * 38D83

* ->
* refs (2): 38A78 38BF4
SetAppSuspOK:
        CON(5)  (*)+5                            * 38D8A  primitive code object
        LC(3)   #206                             * 38D8F
L_38D94:
        GOVLNG  SetISysFlag                      * 38D94

* ->
* refs (1): 38A7D
ClrAppSuspOK:
        CON(5)  (*)+5                            * 38D9B  primitive code object
        LC(3)   #206                             * 38DA0
L_38DA5:
        GOVLNG  L_539F1                          * 38DA5
        RPL

* -> flag
* refs (6): 19B80 38F0A 38F2D 8D543 BA717 DD4E0
DA1OK?:
        ::                                       * 38DAC
          DA1Bad?                                * 38DB1
          caseFALSE                              * 38DB6
          DA1ValidF?                             * 38DBB
          caseTRUE                               * 38DC0
          DA1TempF                               * 38DC5
          case                                   * 38DCA
          SetDA1BadT                             * 38DCF
          DA1NoCh?                               * 38DD4
          caseTRUE                               * 38DD9
          FALSE                                  * 38DDE
        ;                                        * 38DE3

* -> T
* refs (1): 38DCF
SetDA1BadT:
        ::                                       * 38DE8
          SetDA1Bad                              * 38DED
          TRUE                                   * 38DF2
        ;                                        * 38DF7

* -> flag
* refs (6): 19C56 38EA1 38F46 8D54D BA737 DD47B
DA2aOK?:
        ::                                       * 38DFC
          DA2aBad?                               * 38E01
          caseFALSE                              * 38E06
          DA2aValidF?                            * 38E0B
          caseTRUE                               * 38E10
          DA2aTempF?                             * 38E15
          case                                   * 38E1A
          SetDA2aBadT                            * 38E1F
          DA2aNoCh?                              * 38E24
          caseTRUE                               * 38E29
          FALSE                                  * 38E2E
        ;                                        * 38E33

* -> T
* refs (1): 38E1F
SetDA2aBadT:
        ::                                       * 38E38
          SetDA2aBad                             * 38E3D
          TRUE                                   * 38E42
        ;                                        * 38E47

* -> flag
* refs (8): 19BA4 19BC7 38EA6 38F5F 8D616 BA765 ...
DA2bOK?:
        ::                                       * 38E4C
          DA2bBad?                               * 38E51
          caseFALSE                              * 38E56
          DA2bValidF?                            * 38E5B
          caseTRUE                               * 38E60
          DA2bTemp?                              * 38E65
          case                                   * 38E6A
          SetDA2bBadT                            * 38E6F
          DA2bNoCh?                              * 38E74
          caseTRUE                               * 38E79
          FALSE                                  * 38E7E
        ;                                        * 38E83

* -> T
* refs (1): 38E6F
SetDA2bBadT:
        ::                                       * 38E88
          SetDA2bBad                             * 38E8D
          TRUE                                   * 38E92
        ;                                        * 38E97

* -> flag
* refs (2): 38F0F 43775
DA2OK?:
        ::                                       * 38E9C
          DA2aOK?                                * 38EA1
          DA2bOK?                                * 38EA6
          AND                                    * 38EAB
        ;                                        * 38EB0

* -> flag
* refs (11): 19C0F 38F19 38F78 69BBF 8D70B 9CDBC ...
DA3OK?:
        ::                                       * 38EB5
          DA3Bad?                                * 38EBA
          caseFALSE                              * 38EBF
          DA3ValidF?                             * 38EC4
          caseTRUE                               * 38EC9
          DA3TempF?                              * 38ECE
          case                                   * 38ED3
          SetDA3BadT                             * 38ED8
          DA3NoCh?                               * 38EDD
          caseTRUE                               * 38EE2
          FALSE                                  * 38EE7
        ;                                        * 38EEC

* -> T
* refs (1): 38ED8
SetDA3BadT:
        ::                                       * 38EF1
          SetDA3Bad                              * 38EF6
          TRUE                                   * 38EFB
        ;                                        * 38F00

* -> flag
DAsOK?:
        ::                                       * 38F05
          DA1OK?                                 * 38F0A
          DA2OK?                                 * 38F0F
          AND                                    * 38F14
          DA3OK?                                 * 38F19
          AND                                    * 38F1E
        ;                                        * 38F23

* ->
* refs (3): 386B0 4309D 43784
DA1OK?NOTIT:
        ::                                       * 38F28
          DA1OK?                                 * 38F2D
          COLA                                   * 38F32
          ?SKIP                                  * 38F37
        ;                                        * 38F3C

* ->
* refs (2): 386A6 430A7
DA2aOK?NOTIT:
        ::                                       * 38F41
          DA2aOK?                                * 38F46
          COLA                                   * 38F4B
          ?SKIP                                  * 38F50
        ;                                        * 38F55

* ->
* refs (3): 386BA 430B1 DD4A3
DA2bOK?NOTIT:
        ::                                       * 38F5A
          DA2bOK?                                * 38F5F
          COLA                                   * 38F64
          ?SKIP                                  * 38F69
        ;                                        * 38F6E

* ->
* refs (3): 386C4 430BB 4378E
DA3OK?NOTIT:
        ::                                       * 38F73
          DA3OK?                                 * 38F78
          COLA                                   * 38F7D
          ?SKIP                                  * 38F82
        ;                                        * 38F87

* ->
* refs (2): 385F2 38881
InitDispModes:
        ::                                       * 38F8C
          ClrDAsOK                               * 38F91
          SetDA1Bad                              * 38F96
          SetDA2aBad                             * 38F9B
          SetDA2bBad                             * 38FA0
          SetDA3Bad                              * 38FA5
          ClrNewEditL                            * 38FAA
          ClrNoRollDA2                           * 38FAF
        ;                                        * 38FB4

* -> flag
* refs (4): 19C5B 39B94 39BB7 8D552
DA2aLess1OK?:
        ::                                       * 38FB9
          OBJ_53A74                              * 38FBE
          DA2aBad?                               * 38FC3
          NOTAND                                 * 38FC8
        ;                                        * 38FCD

* ->
* refs (12): 1558B 2386F 39176 395D3 4799D 479C5 ...
SetDA1Valid:
        ::                                       * 38FD2
          SetDA1ValidF                           * 38FD7
          ClrDA1Bad                              * 38FDC
          ClrDA1IsStat                           * 38FE1
        ;                                        * 38FE6

* ->
* refs (9): 39162 39BE9 39BF8 430ED 4311A 8D5FD ...
SetDA2aValid:
        ::                                       * 38FEB
          SetDA2aValidF                          * 38FF0
          ClrDA2aBad                             * 38FF5
        ;                                        * 38FFA

* ->
* refs (7): 19CE6 39167 3A017 8D701 BA819 D85FD ...
SetDA2bValid:
        ::                                       * 38FFF
          SetDA2bValidF                          * 39004
          ClrDA2bBad                             * 39009
          ClrDA2bEdit                            * 3900E
        ;                                        * 39013

* ->
* refs (5): 39180 3A1F2 9CDD0 9D3BD CF695
SetDA3Valid:
        ::                                       * 39018
          SetDA3ValidF                           * 3901D
          ClrDA3Bad                              * 39022
        ;                                        * 39027

* ->
* refs (11): 1433C 14DA0 15685 387B4 3891C 39220 ...
SetDA1Temp:
        ::                                       * 3902C
          SetDA1TempF                            * 39031
          ClrDA1Bad                              * 39036
          ClrDA1IsStat                           * 3903B
        ;                                        * 39040

* ->
* refs (1): 3920C
SetDA2aTemp:
        ::                                       * 39045
          SetDA2aTempF                           * 3904A
          ClrDA2aBad                             * 3904F
        ;                                        * 39054

* ->
* refs (3): 39211 40BA6 D6A01
SetDA2bTemp:
        ::                                       * 39059
          SetDA2bTempF                           * 3905E
          ClrDA2bBad                             * 39063
          ClrDA2bEdit                            * 39068
        ;                                        * 3906D

* ->
* refs (2): 1436E 3923E
SetDA3Temp:
        ::                                       * 39072
          SetDA3TempF                            * 39077
          ClrDA3Bad                              * 3907C
        ;                                        * 39081

* :: EditExst?NOT ITE SetDA2RollF SetDA2aNoCh ;
* refs (5): 3B609 40DDE 40E01 42AEE 42CE7
?SetEditRoll:
        ::                                       * 39086
          NoEditLine?                            * 3908B
          ITE                                    * 39090
          OBJ_53A82                              * 39095
          SetDA2aNoCh                            * 3909A
        ;                                        * 3909F

MENoP&FixDA1:
        ::                                       * 390A4
          SetDA1Bad                              * 390A9
        ;                                        * 390AE

MENP&FixDA12:
        ::                                       * 390B3
          SetDA1Bad                              * 390B8
          SetDA2aBad                             * 390BD
          SetDA2bBad                             * 390C2
        ;                                        * 390C7

* ->
* refs (1): 39149
ClrDA1OK:
        ::                                       * 390CC
          ClrDA1ValidF                           * 390D1
          ClrDA1TempF                            * 390D6
          ClrDA1NoCh                             * 390DB
        ;                                        * 390E0

* ->
* refs (1): 3911C
ClrDA2aOK:
        ::                                       * 390E5
          ClrDA2aValidF                          * 390EA
          ClrDA2aTempF                           * 390EF
          ClrDA2NoCh                             * 390F4
        ;                                        * 390F9

* ->
* refs (3): 39121 BB327 BB3D1
ClrDA2bOK:
        ::                                       * 390FE
          ClrDA2bValidF                          * 39103
          ClrDA2bTemp                            * 39108
          ClrDA2bNoCh                            * 3910D
        ;                                        * 39112

* ->
* refs (1): 3914E
ClrDA2OK:
        ::                                       * 39117
          ClrDA2aOK                              * 3911C
          ClrDA2bOK                              * 39121
        ;                                        * 39126

* ->
* refs (4): 39153 69C28 DCCAA DCD06
ClrDA3OK:
        ::                                       * 3912B
          ClrDA3ValidF                           * 39130
          ClrDA3TempF                            * 39135
          ClrDA3NoCh                             * 3913A
        ;                                        * 3913F

* ->
* refs (44): 17C2B 19B71 19C9F 2DDFB 2E072 2E095 ...
ClrDAsOK:
        ::                                       * 39144
          ClrDA1OK                               * 39149
          ClrDA2OK                               * 3914E
          ClrDA3OK                               * 39153
        ;                                        * 39158

* ->
* refs (2): 3917B 43838
SetDA2Valid:
        ::                                       * 3915D
          SetDA2aValid                           * 39162
          SetDA2bValid                           * 39167
        ;                                        * 3916C

* ->
SetDAsValid:
        ::                                       * 39171
          SetDA1Valid                            * 39176
          SetDA2Valid                            * 3917B
          SetDA3Valid                            * 39180
        ;                                        * 39185

* ->
* refs (7): 391A8 391B7 391F8 3C376 43EBD DD795 ...
SetDA2NoCh:
        ::                                       * 3918A
          SetDA2aNoCh                            * 3918F
          SetDA2bNoCh                            * 39194
        ;                                        * 39199

* ->
* refs (14): 3AB80 3E5BE 40193 40DCA 4103A 4A2DA ...
SetDA12NoCh:
        ::                                       * 3919E
          SetDA1NoCh                             * 391A3
          SetDA2NoCh                             * 391A8
        ;                                        * 391AD

* ->
* refs (5): 3D947 3DFD8 43680 43E86 43EC7
SetDA23NoCh:
        ::                                       * 391B2
          SetDA2NoCh                             * 391B7
          SetDA3NoCh                             * 391BC
        ;                                        * 391C1

* ->
* refs (21): 391DF 3B604 3B6A4 3B6F9 3DE5E 3E124 ...
SetDA13NoCh:
        ::                                       * 391C6
          SetDA1NoCh                             * 391CB
          SetDA3NoCh                             * 391D0
        ;                                        * 391D5

* ->
* refs (5): 3B5C8 3B5F0 BAF02 BB86F BB8B2
SetDA12a3NCh:
        ::                                       * 391DA
          SetDA13NoCh                            * 391DF
          SetDA2aNoCh                            * 391E4
        ;                                        * 391E9

* ->
* refs (85): 3A9DD 3AA14 3AC2A 3AFA2 3AFF5 3B02A ...
SetDA123NoCh:
        ::                                       * 391EE
          SetDA1NoCh                             * 391F3
          SetDA2NoCh                             * 391F8
          SetDA3NoCh                             * 391FD
        ;                                        * 39202

* ->
* refs (10): 14355 39225 39239 45FFD 46116 4A50E ...
SetDA2OKTemp:
        ::                                       * 39207
          SetDA2aTemp                            * 3920C
          SetDA2bTemp                            * 39211
        ;                                        * 39216

* ->
* refs (5): 1547D 2219F 3FBBA 41413 9E47B
SetDA12Temp:
        ::                                       * 3921B
          SetDA1Temp                             * 39220
          SetDA2OKTemp                           * 39225
        ;                                        * 3922A

* ->
* refs (5): 492F7 C714E C7176 CE3C0 CE41A
SetDAsTemp:
        ::                                       * 3922F
          SetDA1Temp                             * 39234
          SetDA2OKTemp                           * 39239
          SetDA3Temp                             * 3923E
        ;                                        * 39243

* -> flag
* refs (8): 19B35 3B7D1 4320A 43CF2 8D2A9 8D2EF ...
DAsBad?:
        ::                                       * 39248
          DA1Bad?                                * 3924D
          caseTRUE                               * 39252
          DA2aBad?                               * 39257
          caseTRUE                               * 3925C
          DA2bBad?                               * 39261
          caseTRUE                               * 39266
          DA3Bad?                                * 3926B
        ;                                        * 39270

* -> flag
* refs (1): 38DBB
DA1ValidF?:
        CON(5)  (*)+5                            * 39275  primitive code object
        ASSEMBLE
        LC(3)   #107                             * 3927A
        GOTO    L_39573                          * 3927F

* ->
* refs (1): 38FD7
SetDA1ValidF:
        CON(5)  (*)+5                            * 39283  primitive code object
        LC(3)   #107                             * 39288
        GOTO    L_39584                          * 3928D

* ->
* refs (1): 390D1
ClrDA1ValidF:
        CON(5)  (*)+5                            * 39291  primitive code object
        LC(3)   #107                             * 39296
        GOTO    L_39595                          * 3929B

* -> flag
* refs (1): 38E0B
DA2aValidF?:
        CON(5)  (*)+5                            * 3929F  primitive code object
        LC(3)   #207                             * 392A4
        GOTO    L_39573                          * 392A9

* ->
* refs (1): 38FF0
SetDA2aValidF:
        CON(5)  (*)+5                            * 392AD  primitive code object
        LC(3)   #207                             * 392B2
        GOTO    L_39584                          * 392B7

* ->
* refs (1): 390EA
ClrDA2aValidF:
        CON(5)  (*)+5                            * 392BB  primitive code object
        LC(3)   #207                             * 392C0
        GOTO    L_39595                          * 392C5

* -> flag
* refs (1): 38E5B
DA2bValidF?:
        CON(5)  (*)+5                            * 392C9  primitive code object
        LC(3)   #407                             * 392CE
        GOTO    L_39573                          * 392D3

* ->
* refs (1): 39004
SetDA2bValidF:
        CON(5)  (*)+5                            * 392D7  primitive code object
        LC(3)   #407                             * 392DC
        GOTO    L_39584                          * 392E1

* ->
* refs (1): 39103
ClrDA2bValidF:
        CON(5)  (*)+5                            * 392E5  primitive code object
        LC(3)   #407                             * 392EA
        GOTO    L_39595                          * 392EF

* -> flag
* refs (1): 38EC4
DA3ValidF?:
        CON(5)  (*)+5                            * 392F3  primitive code object
        LC(3)   #807                             * 392F8
        GOTO    L_39573                          * 392FD

* ->
* refs (1): 3901D
SetDA3ValidF:
        CON(5)  (*)+5                            * 39301  primitive code object
        LC(3)   #807                             * 39306
        GOTO    L_39584                          * 3930B

* ->
* refs (1): 39130
ClrDA3ValidF:
        CON(5)  (*)+5                            * 3930F  primitive code object
        LC(3)   #807                             * 39314
        GOTO    L_39595                          * 39319

* ->
* refs (1): 38DC5
DA1TempF:
        CON(5)  (*)+5                            * 3931D  primitive code object
        LC(3)   #806                             * 39322
        GOTO    L_39573                          * 39327

* ->
* refs (1): 39031
SetDA1TempF:
        CON(5)  (*)+5                            * 3932B  primitive code object
        LC(3)   #806                             * 39330
        GOTO    L_39584                          * 39335

* ->
* refs (1): 390D6
ClrDA1TempF:
        CON(5)  (*)+5                            * 39339  primitive code object
        LC(3)   #806                             * 3933E
        GOTO    L_39595                          * 39343

* -> flag
* refs (2): 38E15 DD49E
DA2aTempF?:
        CON(5)  (*)+5                            * 39347  primitive code object
        LC(3)   #104                             * 3934C
        GOTO    L_39573                          * 39351

* ->
* refs (2): 3904A DD48A
SetDA2aTempF:
        CON(5)  (*)+5                            * 39355  primitive code object
        LC(3)   #104                             * 3935A
        GOTO    L_39584                          * 3935F

* ->
* refs (2): 390EF DD48F
ClrDA2aTempF:
        CON(5)  (*)+5                            * 39363  primitive code object
        LC(3)   #104                             * 39368
        GOTO    L_39595                          * 3936D

* refs (2): 19C3D 38E65
DA2bTemp?:
        CON(5)  (*)+5                            * 39371  primitive code object
        LC(3)   #204                             * 39376
        GOTO    L_39573                          * 3937B

* ->
* refs (1): 3905E
SetDA2bTempF:
        CON(5)  (*)+5                            * 3937F  primitive code object
        LC(3)   #204                             * 39384
        GOTO    L_39584                          * 39389

* ->
* refs (1): 39108
ClrDA2bTemp:
        CON(5)  (*)+5                            * 3938D  primitive code object
        LC(3)   #204                             * 39392
        GOTO    L_39595                          * 39397

* -> flag
* refs (1): 38ECE
DA3TempF?:
        CON(5)  (*)+5                            * 3939B  primitive code object
        LC(3)   #404                             * 393A0
        GOTO    L_39573                          * 393A5

* ->
* refs (1): 39077
SetDA3TempF:
        CON(5)  (*)+5                            * 393A9  primitive code object
        LC(3)   #404                             * 393AE
        GOTO    L_39584                          * 393B3

* ->
* refs (1): 39135
ClrDA3TempF:
        CON(5)  (*)+5                            * 393B7  primitive code object
        LC(3)   #404                             * 393BC
        GOTO    L_39595                          * 393C1

* -> flag
* refs (1): 38DD4
DA1NoCh?:
        CON(5)  (*)+5                            * 393C5  primitive code object
        LC(3)   #108                             * 393CA
        GOTO    L_39573                          * 393CF

* ->
* refs (40): 391A3 391CB 391F3 3D9F9 404C7 404EF ...
SetDA1NoCh:
        CON(5)  (*)+5                            * 393D3  primitive code object
        LC(3)   #108                             * 393D8
        GOTO    L_39584                          * 393DD

* ->
* refs (1): 390DB
ClrDA1NoCh:
        CON(5)  (*)+5                            * 393E1  primitive code object
        LC(3)   #108                             * 393E6
        GOTO    L_39595                          * 393EB

* -> flag
* refs (1): 38E24
DA2aNoCh?:
        CON(5)  (*)+5                            * 393EF  primitive code object
        LC(3)   #208                             * 393F4
        GOTO    L_39573                          * 393F9

* ->
* refs (25): 3909A 3918F 391E4 3E6ED 3E6F7 40B47 ...
SetDA2aNoCh:
        CON(5)  (*)+5                            * 393FD  primitive code object
        LC(3)   #208                             * 39402
        GOTO    L_39584                          * 39407

* ->
* refs (1): 390F4
ClrDA2NoCh:
        CON(5)  (*)+5                            * 3940B  primitive code object
        LC(3)   #208                             * 39410
        GOTO    L_39595                          * 39415

* -> flag
* refs (1): 38E74
DA2bNoCh?:
        CON(5)  (*)+5                            * 39419  primitive code object
        LC(3)   #408                             * 3941E
        GOTO    L_39573                          * 39423

* ->
* refs (12): 39194 3DE63 3ED98 4005D 42B57 B1C9D ...
SetDA2bNoCh:
        CON(5)  (*)+5                            * 39427  primitive code object
        LC(3)   #408                             * 3942C
        GOTO    L_39584                          * 39431

* ->
* refs (1): 3910D
ClrDA2bNoCh:
        CON(5)  (*)+5                            * 39435  primitive code object
        LC(3)   #408                             * 3943A
        GOTO    L_39595                          * 3943F

* -> flag
* refs (2): 38674 38EDD
DA3NoCh?:
        CON(5)  (*)+5                            * 39443  primitive code object
        LC(3)   #808                             * 39448
        GOTO    L_39573                          * 3944D

* ->
* refs (40): 15590 222E4 391BC 391D0 391FD 3EED3 ...
SetDA3NoCh:
        CON(5)  (*)+5                            * 39451  primitive code object
        LC(3)   #808                             * 39456
        GOTO    L_39584                          * 3945B

* ->
* refs (1): 3913A
ClrDA3NoCh:
        CON(5)  (*)+5                            * 3945F  primitive code object
        LC(3)   #808                             * 39464
        GOTO    L_39595                          * 39469

* -> flag
* refs (3): 38DB1 3924D BC7D8
DA1Bad?:
        CON(5)  (*)+5                            * 3946D  primitive code object
        LC(3)   #109                             * 39472
        GOTO    L_39573                          * 39477

* ->
* refs (13): 1A043 38DED 38F96 390A9 390B8 395B0 ...
SetDA1Bad:
        CON(5)  (*)+5                            * 3947B  primitive code object
        LC(3)   #109                             * 39480
        GOTO    L_39584                          * 39485

* ->
* refs (3): 38FDC 39036 BC83C
ClrDA1Bad:
        CON(5)  (*)+5                            * 39489  primitive code object
        LC(3)   #109                             * 3948E
        GOTO    L_39595                          * 39493

* -> flag
* refs (8): 38E01 38FC3 39257 BB7CA BC7DD D55A1 ...
DA2aBad?:
        CON(5)  (*)+5                            * 39497  primitive code object
        LC(3)   #209                             * 3949C
        GOTO    L_39573                          * 394A1

* ->
* refs (10): 1A048 38E3D 38F9B 390BD 39BA3 437B6 ...
SetDA2aBad:
        CON(5)  (*)+5                            * 394A5  primitive code object
        LC(3)   #209                             * 394AA
        GOTO    L_39584                          * 394AF

* ->
* refs (3): 38FF5 3904F BC82D
ClrDA2aBad:
        CON(5)  (*)+5                            * 394B3  primitive code object
        LC(3)   #209                             * 394B8
        GOTO    L_39595                          * 394BD

* -> flag
* refs (6): 38E51 39261 BB070 BB122 BC5B4 BC7E2
DA2bBad?:
        CON(5)  (*)+5                            * 394C1  primitive code object
        LC(3)   #409                             * 394C6
        GOTO    L_39573                          * 394CB

* ->
* refs (12): 19CC7 1A04D 38E8D 38FA0 390C2 437BB ...
SetDA2bBad:
        CON(5)  (*)+5                            * 394CF  primitive code object
        LC(3)   #409                             * 394D4
        GOTO    L_39584                          * 394D9

* ->
* refs (3): 39009 39063 BC81E
ClrDA2bBad:
        CON(5)  (*)+5                            * 394DD  primitive code object
        LC(3)   #409                             * 394E2
        GOTO    L_39595                          * 394E7

* -> flag
* refs (3): 38EBA 3926B BC7E7
DA3Bad?:
        CON(5)  (*)+5                            * 394EB  primitive code object
        LC(3)   #809                             * 394F0
        GOTO    L_39573                          * 394F5

* ->
* refs (14): 19C05 1A052 38EF6 38FA5 3A1DE 3D56A ...
SetDA3Bad:
        CON(5)  (*)+5                            * 394F9  primitive code object
        LC(3)   #809                             * 394FE
        GOTO    L_39584                          * 39503

* ->
* refs (3): 39022 3907C BC80F
ClrDA3Bad:
        CON(5)  (*)+5                            * 39507  primitive code object
        LC(3)   #809                             * 3950C
        GOTO    L_39595                          * 39511

* -> flag
* refs (3): 04903 39ADD BC7CE
DA1IsStat?:
        CON(5)  (*)+5                            * 39515  primitive code object
        LC(3)   #10C                             * 3951A
        GOTO    L_39573                          * 3951F

* ->
* refs (2): 395D8 BC855
SetDA1IsStat:
        CON(5)  (*)+5                            * 39523  primitive code object
        LC(3)   #10C                             * 39528
        GOTO    L_39584                          * 3952D

* ->
* refs (15): 17B9F 2DA45 38FE1 3903B 4CECE 4D92A ...
ClrDA1IsStat:
        CON(5)  (*)+5                            * 39531  primitive code object
        LC(3)   #10C                             * 39536
        GOTO    L_39595                          * 3953B

* -> flag
* refs (2): 42082 BC7D3
DA2bEdit?:
        CON(5)  (*)+5                            * 3953F  primitive code object
        LC(3)   #401                             * 39544
        GOTO    L_39573                          * 39549

* ->
* refs (7): 3A01C 40BAB BC846 D6A06 D8631 D8646 ...
SetDA2bEdit:
        CON(5)  (*)+5                            * 3954D  primitive code object
        LC(3)   #401                             * 39552
        GOTO    L_39584                          * 39557

* ->
* refs (5): 3900E 39068 BC84B D69D8 DCC9A
ClrDA2bEdit:
        CON(5)  (*)+5                            * 3955B  primitive code object
        LC(3)   #401                             * 39560
        GOTO    L_39595                          * 39565

* -> flag
* refs (1): 39BFD
NoRollDA2?:
        CON(5)  (*)+5                            * 39569  primitive code object
        LC(3)   #101                             * 3956E
L_39573:
        GOVLNG  L_539E6                          * 39573

* ->
* refs (1): 39DB5
SetNoRollDA2:
        CON(5)  (*)+5                            * 3957A  primitive code object
        LC(3)   #101                             * 3957F
L_39584:
        GOVLNG  SetISysFlag                      * 39584

* ->
* refs (3): 38FAF 39BCB 39C07
ClrNoRollDA2:
        CON(5)  (*)+5                            * 3958B  primitive code object
        LC(3)   #101                             * 39590
L_39595:
        GOVLNG  L_539F1                          * 39595
        RPL

* ->
* refs (3): 386B5 430A2 43789
?DispStatus:
        ::                                       * 3959C
          KEYINBUFFER?                           * 395A1
          NOTcase                                * 395A6
          DispStatus                             * 395AB
          SetDA1Bad                              * 395B0
        ;                                        * 395B5

* ->
* refs (3): 395AB 8D589 DD53D
DispStatus:
        ::                                       * 395BA
          TOADISP                                * 395BF
          DispStsBound                           * 395C4
          DispDir?Time                           * 395C9
          DispAllStatus!                         * 395CE
          SetDA1Valid                            * 395D3
          SetDA1IsStat                           * 395D8
        ;                                        * 395DD

* refs (1): 395CE
DispAllStatus!:
        ::                                       * 395E2
          AngleStatus                            * 395E7
          Blank&GROB!                            * 395EC
          ComVecStatus                           * 395F1
          Blank&GROB!                            * 395F6
          HaltDispStatus                         * 395FB
          Blank&GROB!                            * 39600
          UserFlagStat                           * 39605
          Blank&GROB!                            * 3960A
          UserKeysStat                           * 3960F
          Blank&GROB!                            * 39614
          AlgEntryStat                           * 39619
          Blank&GROB!                            * 3961E
          PrgmEntrStat                           * 39623
          Blank&GROB!                            * 39628
        ;                                        * 3962D

* $ #x #x1 #x2 ->
* refs (7): 395EC 395F6 39600 3960A 39614 3961E ...
Blank&GROB!:
        ::                                       * 39632
          4ROLL                                  * 39637
          $>grob                                 * 3963C
          4UNROLL                                * 39641
          HARDBUFF                               * 39646
          3UNROLL                                * 3964B
          ZEROSWAP                               * 39650
          BINT6                                  * 39655
          GROB!ZERO                              * 3965A
          SWAP                                   * 3965F
          BINT0                                  * 39664
          GROB!                                  * 39669
        ;                                        * 3966E

* refs (1): 395E7
AngleStatus:
        ::                                       * 39673
          BINT17                                 * 39678
          SysITE                                 * 3967D
          ::                                     * 39682
            $_RAD                                * 39687
            BINT4                                * 3968C
          ;                                      * 39691
          ::                                     * 39696
            BINT18                               * 3969B
            SysITE                               * 396A0
            $_GRAD                               * 396A5
            NULL$                                * 396AA
            BINT2                                * 396AF
          ;                                      * 396B4
          BINT0                                  * 396B9
          BINT20                                 * 396BE
        ;                                        * 396C3

* refs (1): 395F1
ComVecStatus:
        ::                                       * 396C8
          BINT16                                 * 396CD
          SysITE                                 * 396D2
          ::                                     * 396D7
            BINT15                               * 396DC
            SysITE                               * 396E1
            $_R<<                                * 396E6
            $_R<Z                                * 396EB
          ;                                      * 396F0
          NULL$                                  * 396F5
          BINT22                                 * 396FA
          BINT20                                 * 396FF
          BINT37                                 * 39704
        ;                                        * 39709

* refs (1): 395FB
HaltDispStatus:
        ::                                       * 3970E
          Halted?                                * 39713
          ITE                                    * 39718

_HALT_:
          $       "HALT"                         * 3971D
          NULL$                                  * 3972F
          BINT39                                 * 39734
          BINT37                                 * 39739
          BINT56                                 * 3973E
        ;                                        * 39743

* refs (1): 39605
UserFlagStat:
        ::                                       * 39748
          #       3039                           * 3974D  12345
          #>$                                    * 39757
          CODE                                   * 3975C  65 nibbles
            GOSBVL  SAVPTR                       * 39766
            A=DAT1  A                            * 3976D
            D1=A                                 * 39770
            D1=D1+  10                           * 39773
            C=DAT1  10                           * 39776
            D0=(5)  UserFlags                    * 3977A
            A=DAT0  B                            * 39781
            A=-A-1  A                            * 39784
L_39786:
            SB=0                                 * 39786
            ASRB                                 * 39789
            ?SB=0                                * 3978C
            GOYES   L_39795                      * 3978F
            LC(2)   #20                          * 39791
L_39795:
            P=P+1                                * 39795
            P=P+1                                * 39797
            GONC    L_39786                      * 39799
            DAT1=C  10                           * 3979C
            GOVLNG  GETPTRLOOP                   * 397A0
          ENDCODE                                * 397A7
          BINT58                                 * 397A7
          BINT56                                 * 397AC
          BINT79                                 * 397B1
        ;                                        * 397B6

* refs (1): 3960F
UserKeysStat:
        ::                                       * 397BB
          UserKeys?                              * 397C0
          ITE                                    * 397C5
          ::                                     * 397CA
            1USR?                                * 397CF
            ITE                                  * 397D4

_1USR_:
            $       "1USR"                       * 397D9

_USER_:
            $       "USER"                       * 397EB
          ;                                      * 397FD
          NULL$                                  * 39802
          BINT81                                 * 39807
          BINT79                                 * 3980C
          BINT98                                 * 39811
        ;                                        * 39816

* refs (1): 39619
AlgEntryStat:
        ::                                       * 3981B
          AlgEntry?                              * 39820
          ITE                                    * 39825

_ALG_:
          $       "ALG"                          * 3982A
          NULL$                                  * 3983A
          BINT100                                * 3983F
          BINT98                                 * 39844
          BINT114                                * 39849
        ;                                        * 3984E

* refs (1): 39623
PrgmEntrStat:
        ::                                       * 39853
          PrgmEntry?                             * 39858
          ITE                                    * 3985D

_PRG_:
          $       "PRG"                          * 39862
          NULL$                                  * 39872
          BINT116                                * 39877
          BINT114                                * 3987C
          BINT131                                * 39881
        ;                                        * 39886

* refs (1): 395C9
DispDir?Time:
        ::                                       * 3988B
          DispTimeReq?                           * 39890
          DUP                                    * 39895
          PathStatus                             * 3989A
          4ROLL                                  * 3989F
          ITE                                    * 398A4
          DispDir?Tim1                           * 398A9
          DispDir?Tim2                           * 398AE
          SWAP                                   * 398B3
          HARDBUFF                               * 398B8
          BINT0                                  * 398BD
          BINT7                                  * 398C2
          GROB!                                  * 398C7
          HARDBUFF                               * 398CC
          BINT4                                  * 398D1
          ROT                                    * 398D6
          IT                                     * 398DB
          #2+                                    * 398E0
          BINT7                                  * 398E5
          GROB!                                  * 398EA
        ;                                        * 398EF

* refs (1): 398A9
DispDir?Tim1:
        ::                                       * 398F4
          HARDBUFF                               * 398F9
          BINT63                                 * 398FE
          BINT6                                  * 39903
          BINT131                                * 39908
          BINT7                                  * 3990D
          GROB!ZERO                              * 39912
          BINT63                                 * 39917
          BINT13                                 * 3991C
          BINT131                                * 39921
          BINT14                                 * 39926
          GROB!ZERODRP                           * 3992B
          OBJ_39A83                              * 39930
          HARDBUFF                               * 39935
          BINT0                                  * 3993A
          BINT6                                  * 3993F
          BINT63                                 * 39944
          BINT14                                 * 39949
          GROB!ZERODRP                           * 3994E
        ;                                        * 39953

* refs (1): 398AE
DispDir?Tim2:
        ::                                       * 39958
          BINT6                                  * 3995D
          BINT8                                  * 39962
          BLANKIT                                * 39967
        ;                                        * 3996C

* refs (1): 3989A
PathStatus:
        ::                                       * 39971
          ITE                                    * 39976
          BINT53                                 * 3997B
          #       7D                             * 39980  125
          $       " }"                           * 3998A
          CONTEXT@                               * 39998
          BEGIN                                  * 3999D
          DUP                                    * 399A2
          RAM-WORDNAME                           * 399A7
          DUP                                    * 399AC
          NULLID                                 * 399B1
          EQUALNOT                               * 399B6
          DUP                                    * 399BB
          ITE                                    * 399C0
          OBJ_39A4C                              * 399C5
          OBJ_39A60                              * 399CA
          4ROLL                                  * 399CF
          !append$                               * 399D4
          SPACE$                                 * 399D9
          !insert$                               * 399DE
          3UNROLL                                * 399E3
          3PICK                                  * 399E8
          LEN$                                   * 399ED
          BINT63                                 * 399F2
          #<                                     * 399F7
          AND                                    * 399FC
          WHILE                                  * 39A01
          ::                                     * 39A06
            MYRAMROMPAIR                         * 39A0B
            DROP                                 * 39A10
          ;                                      * 39A15
          REPEAT                                 * 39A1A
          DROPSWAP                               * 39A1F
          RIGHT$3x6                              * 39A24
          OVER                                   * 39A29
          ITE                                    * 39A2E
          _chr(31)_                              * 39A33
          tok{                                   * 39A38
          $>grob                                 * 39A3D
          ROT                                    * 39A42
        ;                                        * 39A47

* refs (1): 399C5
OBJ_39A4C:
        ::                                       * 39A4C
          SWAP                                   * 39A51
          ID>$                                   * 39A56
        ;                                        * 39A5B

* refs (1): 399CA
OBJ_39A60:
        ::                                       * 39A60
          SWAPDROP                               * 39A65
          '                                      * 39A6A
          xHOME                                  * 39A6F
          PTR>ROMPTR                             * 39A74
          ->str(xn)                              * 39A79
        ;                                        * 39A7E

* refs (2): 39930 39AE7
OBJ_39A83:
        ::                                       * 39A83
          DATE                                   * 39A88
          Date>d$                                * 39A8D
          APPEND_SPACE                           * 39A92
          BINT42                                 * 39A97
          TestSysFlag                            * 39A9C
          IT                                     * 39AA1
          APPEND_SPACE                           * 39AA6
          TOD                                    * 39AAB
          TOD>t$                                 * 39AB0
          !append$                               * 39AB5
          $>grob                                 * 39ABA
          HARDBUFF                               * 39ABF
          BINT63                                 * 39AC4
          BINT7                                  * 39AC9
          GROB!                                  * 39ACE
        ;                                        * 39AD3

* refs (2): 048C7 048EA
OBJ_39AD8:
        ::                                       * 39AD8
          DA1IsStat?                             * 39ADD
          NOT?SEMI                               * 39AE2
          OBJ_39A83                              * 39AE7
        ;                                        * 39AEC

* -> flag
* refs (2): 048FE 39890
DispTimeReq?:
        ::                                       * 39AF1
          Clock?                                 * 39AF6
          clock?                                 * 39AFB
          OR                                     * 39B00
        ;                                        * 39B05

* ->
* refs (3): 395C4 47993 DD547
DispStsBound:
        ::                                       * 39B0A
          LineGrob                               * 39B0F
          HARDBUFF                               * 39B14
          BINT0                                  * 39B19
          BINT14                                 * 39B1E
          GROB!                                  * 39B23
        ;                                        * 39B28

* 131x2 line
* refs (1): 39B0F
LineGrob:
        CON(5)  DOGROB                           * 39B2D  DOGROB
        LENGTH                                   * 39B32  length, to #39B85
        NIBHEX  2000038000FFFFFFFFFFFFFFFFFFFFFF * 39B37  ..0..ÿÿÿÿÿÿÿÿÿÿÿ
        NIBHEX  FFFFFFFFFFFF                     * 39B57  ÿÿÿÿÿÿ
        FILLTO  #39B85                           * 39B63  34 zero nibbles: the next entry stays at #39B85
        ENDLENGTH                                * 39B85

* ->
* refs (2): 386AB DD499
?DispStack:
        ::                                       * 39B85
          KEYINBUFFER?                           * 39B8A
          NOT                                    * 39B8F
          DA2aLess1OK?                           * 39B94
          ORcase                                 * 39B99
          OBJ_39BAD                              * 39B9E
          SetDA2aBad                             * 39BA3
        ;                                        * 39BA8

* refs (2): 39B9E 39C75
OBJ_39BAD:
        ::                                       * 39BAD
          TOADISP                                * 39BB2
          DA2aLess1OK?                           * 39BB7
          ClrNewEditL                            * 39BBC
          case                                   * 39BC1
          ?RollUpDA2                             * 39BC6
          ClrNoRollDA2                           * 39BCB
          ClrAbbrevStk                           * 39BD0
          ERRSET                                 * 39BD5
          OBJ_39C1B                              * 39BDA
          ERRTRAP                                * 39BDF
          OBJ_39C61                              * 39BE4
          SetDA2aValid                           * 39BE9
        ;                                        * 39BEE

* refs (1): 39BC6
?RollUpDA2:
        ::                                       * 39BF3
          SetDA2aValid                           * 39BF8
          NoRollDA2?                             * 39BFD
          case                                   * 39C02
          ClrNoRollDA2                           * 39C07
          BINT3                                  * 39C0C
          ScreenUpN                              * 39C11
        ;                                        * 39C16

* refs (2): 39BDA 39C8E
OBJ_39C1B:
        ::                                       * 39C1B
          LINESOFSTACK                           * 39C20
          DUP#0=csDROP                           * 39C25
          ONESWAP                                * 39C2A
          ZERO_DO                                * 39C2F
          ISTOP-INDEX                            * 39C34
          OVERDUP                                * 39C39
          #3+                                    * 39C3E
          pick(s)?                               * 39C43
          OBJ_39C9D                              * 39C48
          SWAP#1+SWAP                            * 39C4D
          +LOOP                                  * 39C52
          DROP                                   * 39C57
        ;                                        * 39C5C

* refs (1): 39BE4
OBJ_39C61:
        ::                                       * 39C61
          DropSysObs                             * 39C66
          ERROR@                                 * 39C6B
          #0=case                                * 39C70
          OBJ_39BAD                              * 39C75
          #NoRoomForSt                           * 39C7A
          JstGetTHEMESG                          * 39C7F
          DoWarning                              * 39C84
          SetAbbrevStk                           * 39C89
          OBJ_39C1B                              * 39C8E
          ClrAbbrevStk                           * 39C93
        ;                                        * 39C98

* refs (1): 39C48
OBJ_39C9D:
        ::                                       * 39C9D
          DUP                                    * 39CA2
          NOTcase                                * 39CA7
          OBJ_39F42                              * 39CAC
          3PICK                                  * 39CB1
          #1<>                                   * 39CB6
          case                                   * 39CBB
          OBJ_39F42                              * 39CC0
          MLmode?                                * 39CC5
          NOTcase                                * 39CCA
          OBJ_39F42                              * 39CCF
          OVER                                   * 39CD4
          OBJ_39E0F                              * 39CD9
          NOTcase                                * 39CDE
          OBJ_39F42                              * 39CE3
          AbbrevStack?                           * 39CE8
          case                                   * 39CED
          OBJ_39F42                              * 39CF2
          DROPSWAPDROP                           * 39CF7
          OBJ_39D06                              * 39CFC
        ;                                        * 39D01

* refs (1): 39CFC
OBJ_39D06:
        ::                                       * 39D06
          OVERSWAP                               * 39D0B
          NULL{}                                 * 39D10
          SWAP3PICK                              * 39D15
          ZERO_DO                                * 39D1A
          DUPUNROT                               * 39D1F
          OBJ_39E78                              * 39D24
          INDEX@                                 * 39D29
          #0=ITE                                 * 39D2E
          OBJ_39EB9                              * 39D33
          OBJ_39F23                              * 39D38
          5UNROLL                                * 39D3D
          DUPNULLCOMP?                           * 39D42
          IT                                     * 39D47
          OBJ_39EE1                              * 39D4C
          SWAPLOOP                               * 39D51
          2DROP                                  * 39D56
          DUPDUP                                 * 39D5B
          #3+                                    * 39D60
          UNROLL                                 * 39D65
          ZERO_DO                                * 39D6A
          ISTOP-INDEX                            * 39D6F
          #1+ROLL                                * 39D74
          OVER                                   * 39D79
          ISTOP@                                 * 39D7E
          #-                                     * 39D83
          INDEX@                                 * 39D88
          #+                                     * 39D8D
          #1+                                    * 39D92
          BigDisp(st,s)                          * 39D97
          LOOP                                   * 39D9C
          DROPDUP                                * 39DA1
          BINT4                                  * 39DA6
          #=                                     * 39DAB
          IT                                     * 39DB0
          SetNoRollDA2                           * 39DB5
        ;                                        * 39DBA

* refs (4): 39F47 43810 43AA4 43B71
OBJ_39DBF:
        ::                                       * 39DBF
          ITE                                    * 39DC4
          OBJ_39DE2                              * 39DC9
          #:>$                                   * 39DCE
          SWAP                                   * 39DD3
          BigDisp(st,s)                          * 39DD8
        ;                                        * 39DDD

* refs (1): 39DC9
OBJ_39DE2:
        ::                                       * 39DE2
          AbbrevStack?                           * 39DE7
          NOTcase                                * 39DEC
          DoSt:22(s,_)                           * 39DF1
          SWAP                                   * 39DF6
          #:>$                                   * 39DFB
          SWAP                                   * 39E00
          OBJ_15CCF                              * 39E05
        ;                                        * 39E0A

* refs (1): 39CD9
OBJ_39E0F:
        ::                                       * 39E0F
          CK&DISPATCH0                           * 39E14
          BINT4                                  * 39E19
          DROPTRUE                               * 39E1E
          BINT5                                  * 39E23
          DROPTRUE                               * 39E28
          BINT8                                  * 39E2D
          DROPTRUE                               * 39E32
          BINT9                                  * 39E37
          DROPTRUE                               * 39E3C
          BINT14                                 * 39E41
          DROPTRUE                               * 39E46
          BINT13                                 * 39E4B
          DROPTRUE                               * 39E50
          BINT47                                 * 39E55
          DROPTRUE                               * 39E5A
          BINT2                                  * 39E5F
          DROPTRUE                               * 39E64
          BINT0                                  * 39E69
          DROPFALSE                              * 39E6E
        ;                                        * 39E73

* refs (1): 39D24
OBJ_39E78:
        ::                                       * 39E78
          SWAP                                   * 39E7D
          ERRSET                                 * 39E82
          OBJ_53914                              * 39E87
          OBJ_16A0E                              * 39E8C
          ERRTRAP                                * 39E91
          ::                                     * 39E96
            OBJ_53922                            * 39E9B
            ERRJMP                               * 39EA0
          ;                                      * 39EA5
          OBJ_53922                              * 39EAA
          SWAP                                   * 39EAF
        ;                                        * 39EB4

* refs (1): 39D33
OBJ_39EB9:
        ::                                       * 39EB9
          OVER                                   * 39EBE
          NULLCOMP?                              * 39EC3
          NOTcase                                * 39EC8
          OBJ_39F04                              * 39ECD
          BINT1                                  * 39ED2
          s:str(st,s)                            * 39ED7
        ;                                        * 39EDC

* refs (1): 39D4C
OBJ_39EE1:
        ::                                       * 39EE1
          ROTDROP                                * 39EE6
          INDEX@                                 * 39EEB
          #1+                                    * 39EF0
          3UNROLL                                * 39EF5
          ExitAtLOOP                             * 39EFA
        ;                                        * 39EFF

* refs (1): 39ECD
OBJ_39F04:
        ::                                       * 39F04

* refs (1): 17CC4
OBJ_39F09:
          $       "1: "                          * 39F09
          !insert$                               * 39F19
        ;                                        * 39F1E

* refs (1): 39D38
OBJ_39F23:
        ::                                       * 39F23
          $       "   "                          * 39F28
          !insert$                               * 39F38
        ;                                        * 39F3D

* refs (5): 39CAC 39CC0 39CCF 39CE3 39CF2
OBJ_39F42:
        ::                                       * 39F42
          OBJ_39DBF                              * 39F47
          BINT1                                  * 39F4C
        ;                                        * 39F51

* refs (1): 39CC5
MLmode?:
        ::                                       * 39F56
          BINT52                                 * 39F5B
          TestSysFlag                            * 39F60
          NOT                                    * 39F65
        ;                                        * 39F6A

* refs (3): 39C20 42836 448A3
LINESOFSTACK:
        CON(5)  (*)+5                            * 39F6F  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 39F74
        GOSUB   SUB_39F93                        * 39F7B
        R0=C                                     * 39F7F
        GOSBVL  PUSH#                            * 39F82
        A=DAT0  A                                * 39F89
        D0=D0+  5                                * 39F8C
        PC=(A)                                   * 39F8F

* refs (1): 39F7B
SUB_39F93:
        GOSBVL  SUB_44747                        * 39F93
        LC(5)   #00003                           * 39F9A
        ?C<A    A                                * 39FA1
        GOYES   L_39FAC                          * 39FA4
        C=C-A   A                                * 39FA6
        C=C+1   A                                * 39FA8
        RTN                                      * 39FAA
L_39FAC:
        C=0     A                                * 39FAC
        RTN                                      * 39FAE

* refs (2): 39CE8 39DE7
AbbrevStack?:
        CON(5)  (*)+5                            * 39FB0  primitive code object
        LC(3)   #201                             * 39FB5
        GOVLNG  L_539E6                          * 39FBA

* refs (1): 39C89
SetAbbrevStk:
        CON(5)  (*)+5                            * 39FC1  primitive code object
        LC(3)   #201                             * 39FC6
        GOVLNG  SetISysFlag                      * 39FCB

* refs (3): 39BD0 39C93 437CF
ClrAbbrevStk:
        CON(5)  (*)+5                            * 39FD2  primitive code object
        LC(3)   #201                             * 39FD7
        GOVLNG  L_539F1                          * 39FDC
        RPL

* refs (2): 3A04E 3A053
OBJ_39FE3:
        ::                                       * 39FE3
          BINT5                                  * 39FE8
        ;                                        * 39FED

* refs (6): 39A33 3A12F AE62A B21DC BBEDD D6E46
_chr(31)_:
        $       "\1F"                            * 39FF2

* refs (1): 3A143
begin<16>end:
        ::                                       * 39FFE
          BINT22                                 * 3A003
        ;                                        * 3A008
