* HP 48GX ROM revision R, #2E0A9-#2FFFF: Serial I/O and Kermit
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: GetIOPAR FalseFalse GetKermPkt# dup;#nm? GetStrLenStk %IP># 6->list;StoInIPAR KERMOPEN SetIOPARerr IOCheckReal GETNAME BUILDKPACKET
* Follows on from the previous file (at #2E0A9 in the original ROM).
        RPL

* refs (2): 2DAE5 2F71D
SENDNAK:
        ::                                       * 2E0A9
          NULL$                                  * 2E0AE
          GetKermPkt#                            * 2E0B3
          CHR_N                                  * 2E0B8
          SENDPKT                                * 2E0BD
        ;                                        * 2E0C2

* refs (5): 2DC20 2DD06 2E063 2E4CD 2E76D
SENDERROR:
        ::                                       * 2E0C7
          %.15                                   * 2E0CC
          dowait                                 * 2E0D1
          KVISLF                                 * 2E0D6
          ENCODE1PKT                             * 2E0DB
          LAMPKNO                                * 2E0E0
          CHR_E                                  * 2E0E5
          SENDPKT                                * 2E0EA
        ;                                        * 2E0EF

* refs (4): 2E0BD 2E0EA 2F9D4 2FEAB
SENDPKT:
        ::                                       * 2E0F4
          BUILDKPACKET                           * 2E0F9
          OBJ_30E44                              * 2E0FE
        ;                                        * 2E103

* refs (6): 2D4C2 2D5A0 2E0F9 2E949 2F248 2F36A
BUILDKPACKET:
        ::                                       * 2E108
          GETKP                                  * 2E10D
          3UNROLL                                * 2E112
          CODE                                   * 2E117  363 nibbles
            GOSBVL  POP#                         * 2E121
            R2=A                                 * 2E128
            GOSBVL  POP#                         * 2E12B
            C=R2                                 * 2E132
            CSL     A                            * 2E135
            CSL     A                            * 2E137
            C=A     B                            * 2E139
            R2=C                                 * 2E13C
            C=DAT1  A                            * 2E13F
            CD1EX                                * 2E142
            RSTK=C                               * 2E145
            D1=D1+  14                           * 2E147
            C=DAT1  A                            * 2E14A
            A=C     A                            * 2E14D
            ABIT=0  14                           * 2E14F
            ?CBIT=1 14                           * 2E154
            GOYES   L_2E160                      * 2E159
            ABIT=1  14                           * 2E15B
L_2E160:
            LC(2)   #20                          * 2E160
            A=A-C   B                            * 2E164
            R3=A                                 * 2E167
            D1=D1+  4                            * 2E16A
            A=DAT1  B                            * 2E16D
            A=A-C   B                            * 2E170
            ASL     A                            * 2E173
            ASL     A                            * 2E175
            D1=D1+  6                            * 2E177
            A=DAT1  B                            * 2E17A
            LC(2)   #30                          * 2E17D
            A=A-C   B                            * 2E181
            R4=A                                 * 2E184
            C=RSTK                               * 2E187
            D1=C                                 * 2E189
            GOSBVL  PopSavptr                    * 2E18C
            GOSBVL  GetStrLenStk                 * 2E193
            A=R4                                 * 2E19A
            C=C+A   B                            * 2E19D
            A=C     A                            * 2E1A0
            C=0     A                            * 2E1A2
            LC(1)   #5                           * 2E1A4
            C=C+A   A                            * 2E1A7
            RSTK=C                               * 2E1A9
            A=0     A                            * 2E1AB
            C=R3                                 * 2E1AD
            A=C     B                            * 2E1B0
            C=RSTK                               * 2E1B3
            RSTK=C                               * 2E1B5
            C=C+A   A                            * 2E1B7
            GOSBVL  MAKE$                        * 2E1B9
            C=R3                                 * 2E1C0
            A=C     A                            * 2E1C3
            CSR     A                            * 2E1C5
            CSR     A                            * 2E1C7
            GONC    L_2E1D2                      * 2E1C9
L_2E1CC:
            DAT0=C  B                            * 2E1CC
            D0=D0+  2                            * 2E1CF
L_2E1D2:
            A=A-1   B                            * 2E1D2
            GONC    L_2E1CC                      * 2E1D5
            LC(2)   #01                          * 2E1D8
            DAT0=C  B                            * 2E1DC
            D0=D0+  2                            * 2E1DF
            CD0EX                                * 2E1E2
            D0=C                                 * 2E1E5
            R1=C                                 * 2E1E8
            C=0     A                            * 2E1EB
            LC(2)   #20                          * 2E1ED
            A=C     A                            * 2E1F1
            C=RSTK                               * 2E1F3
            C=C-CON A,3                          * 2E1F5
            RSTK=C                               * 2E1FB
            C=C+A   A                            * 2E1FD
            DAT0=C  B                            * 2E1FF
            D0=D0+  2                            * 2E202
            C=R2                                 * 2E205
            C=C+A   A                            * 2E208
            DAT0=C  4                            * 2E20A
            D0=D0+  4                            * 2E20E
            AD0EX                                * 2E211
            GOSBVL  D1=DSKTOP                    * 2E214
            GOSBVL  GetStrLenStk                 * 2E21B
            C=C+C   A                            * 2E222
            AD1EX                                * 2E224
            D0=A                                 * 2E227
            GOSBVL  MOVEDOWN                     * 2E22A
            C=R4                                 * 2E231
            A=0     A                            * 2E234
            A=C     B                            * 2E236
            CD1EX                                * 2E239
            D=C     A                            * 2E23C
            C=RSTK                               * 2E23E
            C=C+1   A                            * 2E240
            C=C-A   A                            * 2E242
            AR1EX                                * 2E244
            D1=A                                 * 2E247
            A=C     A                            * 2E24A
            GOSUB   SUB_2E4FE                    * 2E24C
            P=      5                            * 2E250
            A=C     WP                           * 2E252
            C=R1                                 * 2E255
            C=C+C   A                            * 2E258
            C=C-1   A                            * 2E25A
            P=C     0                            * 2E25C
            C=D     A                            * 2E260
            D0=C                                 * 2E262
            DAT0=A  WP                           * 2E265
            A=C     A                            * 2E269
            C=0     A                            * 2E26B
            CPEX    0                            * 2E26D
            C=C+1   A                            * 2E271
            C=C+A   A                            * 2E273
            D0=C                                 * 2E275
            C=R4                                 * 2E278
            CSR     A                            * 2E27B
            CSR     A                            * 2E27D
            DAT0=C  B                            * 2E27F
            A=R0                                 * 2E282
            GOVLNG  GPOverWrALp                  * 2E285
          ENDCODE                                * 2E28C
        ;                                        * 2E28C

* refs (2): 2E2DC 2E487
OBJ_2E291:
        ::                                       * 2E291
          GETKP                                  * 2E296
          BINT8                                  * 2E29B
          SUB$1#                                 * 2E2A0
          BINT48                                 * 2E2A5
          #-                                     * 2E2AA
        ;                                        * 2E2AF

* refs (4): 2DAD1 2F4CA 2F993 30842
OBJ_2E2B4:
        ::                                       * 2E2B4
          GETKP                                  * 2E2B9
          BINT2                                  * 2E2BE
          SUB$1#                                 * 2E2C3
          BINT32                                 * 2E2C8
          #-                                     * 2E2CD
          #10*                                   * 2E2D2
          StimeXmit(s)                           * 2E2D7
          OBJ_2E291                              * 2E2DC
          CODE                                   * 2E2E1  362 nibbles
            GOSBVL  SAVPTR                       * 2E2EB
            GOSBVL  POP#                         * 2E2F2
            R1=A                                 * 2E2F9
            ST=0    10                           * 2E2FC
L_2E2FF:
            GOSBVL  SUB_311D1                    * 2E2FF
            GONC    L_2E336                      * 2E306
L_2E309:
            R0=C                                 * 2E309
            GOSBVL  GETPTR                       * 2E30C
            D=D+1   A                            * 2E313
            D1=D1+  5                            * 2E315
L_2E318:
            GOSBVL  SAVPTR                       * 2E318

* <REF>GETPTR , Push R0 as #, Do FALSE
* refs (3): 31572 357E9 D4450
Push#FLoop:
            GOSBVL  PUSH#                        * 2E31F
            LC(5)   FALSE                        * 2E326
            A=C     A                            * 2E32D
            PC=(A)                               * 2E32F
L_2E333:
            A=R2                                 * 2E333
L_2E336:
            LC(2)   #01                          * 2E336
            ?C#A    B                            * 2E33A
            GOYES   L_2E2FF                      * 2E33D
            GOSBVL  SUB_311D1                    * 2E33F
L_2E346:
            GOC     L_2E309                      * 2E346
            R2=A                                 * 2E349
            LC(2)   #20                          * 2E34C
            A=A-C   B                            * 2E350
            GOC     L_2E333                      * 2E353
            LC(2)   #5E                          * 2E356
            ?C<A    B                            * 2E35A
            GOYES   L_2E333                      * 2E35D
            C=0     A                            * 2E35F
            C=A     B                            * 2E361
            R3=C                                 * 2E364
            C=C+1   A                            * 2E367
            GOSBVL  MAKE$                        * 2E369
            A=R2                                 * 2E370
L_2E373:
            DAT0=A  B                            * 2E373
            D0=D0+  2                            * 2E376
            CD0EX                                * 2E379
            R2=C                                 * 2E37C
            C=R3                                 * 2E37F
            C=C-1   A                            * 2E382
            GOC     L_2E3C0                      * 2E384
            R3=C                                 * 2E387
            GOSBVL  SUB_311D1                    * 2E38A
            GOC     L_2E346                      * 2E391
            LC(2)   #20                          * 2E394
            ?C>A    B                            * 2E398
            GOYES   L_2E336                      * 2E39B
            LC(4)   #9F7F                        * 2E39D
            GOSUB   SUB_2E447                    * 2E3A3
            GONC    L_2E3B3                      * 2E3A7
            LC(2)   #FF                          * 2E3AA
            ?C#A    B                            * 2E3AE
            GOYES   L_2E3B7                      * 2E3B1
L_2E3B3:
            GOTO    L_2E336                      * 2E3B3
L_2E3B7:
            C=R2                                 * 2E3B7
            D0=C                                 * 2E3BA
            GOC     L_2E373                      * 2E3BD
L_2E3C0:
            C=R0                                 * 2E3C0
            GOSUBL  GetStrLenC                   * 2E3C3
            A=C     A                            * 2E3C9
            C=R1                                 * 2E3CB
            A=A-C   A                            * 2E3CE
            GOC     L_2E3DB                      * 2E3D0
            LC(1)   #3                           * 2E3D3
            ?C<=A   A                            * 2E3D6
            GOYES   L_2E3E6                      * 2E3D9
L_2E3DB:
            LC(5)   #00C07                       * 2E3DB
L_2E3E2:
            GOTO    L_2E309                      * 2E3E2
L_2E3E6:
            GOSUB   SUB_2E4FE                    * 2E3E6
            A=R1                                 * 2E3EA
            A=A+A   A                            * 2E3ED
            A=A-1   A                            * 2E3EF
            CAEX    W                            * 2E3F1
            P=C     0                            * 2E3F4
            C=DAT1  WP                           * 2E3F8
            ?C=A    WP                           * 2E3FC
            GOYES   L_2E40D                      * 2E3FF
            P=      0                            * 2E401
            LC(5)   #00C01                       * 2E403
            GONC    L_2E3E2                      * 2E40A
L_2E40D:
            C=R0                                 * 2E40D
            R3=C                                 * 2E410
            P=      0                            * 2E413
            D1=C                                 * 2E415
            D1=D1+  12                           * 2E418
            A=0     A                            * 2E41B
            A=DAT1  B                            * 2E41D
            LC(2)   #20                          * 2E420
            A=A-C   B                            * 2E424
            R0=A                                 * 2E427
            D1=D1+  2                            * 2E42A
            A=DAT1  B                            * 2E42D
            R1=A                                 * 2E430
            GOSBVL  GETPTR                       * 2E433
            C=R3                                 * 2E43A
            DAT1=C  A                            * 2E43D
            GOVLNG  L_357DB                      * 2E440

* refs (1): 2E3A3
SUB_2E447:
            ?C>A    B                            * 2E447
            RTNYES                               * 2E44A
            CSR     A                            * 2E44C
            CSR     A                            * 2E44E
            C=C-A   B                            * 2E450
            RTN                                  * 2E453
          ENDCODE                                * 2E455
          NOTcase                                * 2E455
          ::                                     * 2E45A
            OBJ_2E4A5                            * 2E45F
            FALSE                                * 2E464
          ;                                      * 2E469
          FLUSHRSBUF                             * 2E46E
          #>CHR                                  * 2E473
          ROT                                    * 2E478
          BINT4                                  * 2E47D
          OVERLEN$                               * 2E482
          OBJ_2E291                              * 2E487
          #-                                     * 2E48C
          SUB$                                   * 2E491
          3UNROLL                                * 2E496
          TRUE                                   * 2E49B
        ;                                        * 2E4A0

* refs (3): 2E45F 2EE5B 30E5D
OBJ_2E4A5:
        ::                                       * 2E4A5
          ATTNERR                                * 2E4AA
          #=casedrop                             * 2E4AF
          ABORT                                  * 2E4B4
        ;                                        * 2E4B9

* refs (4): 2DF3D 2F4E3 2F6CD 2F8C6
OBJ_2E4BE:
        ::                                       * 2E4BE
          DUP                                    * 2E4C3
          OBJ_2EFA0                              * 2E4C8
          SENDERROR                              * 2E4CD
          FALSE                                  * 2E4D2
        ;                                        * 2E4D7

* $ -> $'
* refs (6): 2DCB1 2DD01 2DDD8 2F18A 2F88A 2FCD1
APNDCRLF:
        ::                                       * 2E4DC
          CRLF$                                  * 2E4E1
          !append$                               * 2E4E6
        ;                                        * 2E4EB

* "\0d\0a"
* refs (3): 2D97E 2E4E1 31F6E
CRLF$:
        $       "\0D\0A"                         * 2E4F0
        ASSEMBLE

* refs (2): 2E24C 2E3E6
SUB_2E4FE:
        B=0     A                                * 2E4FE
        C=0     A                                * 2E500
        D0=(5)  #00104                           * 2E502
        ST=0    15                               * 2E509
        DAT0=C  4                                * 2E50C
        GOTO    L_2E51C                          * 2E510
L_2E514:
        C=DAT1  B                                * 2E514
        D1=D1+  2                                * 2E517
        B=B+C   A                                * 2E51A
L_2E51C:
        A=A-1   A                                * 2E51C
        GONC    L_2E514                          * 2E51E
        A=0     W                                * 2E521
        A=DAT0  4                                * 2E524
        GOSBVL  AllowIntr                        * 2E528
        C=R1                                     * 2E52F
        C=C-1   A                                * 2E532
        C=C-1   A                                * 2E534
        C=C-1   A                                * 2E536
        GOC     L_2E55A                          * 2E538
        C=C-1   A                                * 2E53B
        GOC     L_2E569                          * 2E53D
        C=0     A                                * 2E540
        C=C+1   A                                * 2E542
        R1=C                                     * 2E544
        C=B     B                                * 2E547
        CSR     A                                * 2E54A
        CSRB                                     * 2E54C
        CSRB                                     * 2E54F
        B=B+C   A                                * 2E552
        P=      15                               * 2E554
        GOTO    L_2E57E                          * 2E556
L_2E55A:
        C=B     A                                * 2E55A
        B=B+B   A                                * 2E55C
        B=B+B   A                                * 2E55E
        B=C     B                                * 2E560
        P=      14                               * 2E563
        GOTO    L_2E57E                          * 2E565
L_2E569:
        B=A     A                                * 2E569
        ASL     M                                * 2E56B
        P=      3                                * 2E56E
        A=A+A   WP                               * 2E570
        A=A+A   WP                               * 2E573
        A=B     B                                * 2E576
        B=A     W                                * 2E579
        P=      13                               * 2E57C
L_2E57E:
        C=0     W                                * 2E57E
L_2E581:
        CSL     W                                * 2E581
        CSL     W                                * 2E584
        CPEX    15                               * 2E587
        LC(2)   #3F                              * 2E58B
        B=B&C   B                                * 2E58F
        LC(2)   #20                              * 2E593
        C=C+B   B                                * 2E597
        BSR     W                                * 2E59A
        BSR     W                                * 2E59D
        P=C     15                               * 2E5A0
        P=P+1                                    * 2E5A4
        GONC    L_2E581                          * 2E5A6
        RTN                                      * 2E5A9
        RPL

* id/lam ->
* refs (4): 21EFF 21F09 B811A B8B2E
SENDNAME:
        ::                                       * 2E5AB
          ONE{}N                                 * 2E5B0
          SENDLIST                               * 2E5B5
        ;                                        * 2E5BA

* refs (2): 2E60F 2E646
OBJ_2E5BF:
        ::                                       * 2E5BF
          DUP@                                   * 2E5C4
          NOTcase                                * 2E5C9
          OBJ_2E7C2                              * 2E5CE
          '                                      * 2E5D3
          LAMOBJ                                 * 2E5D8
          STO                                    * 2E5DD
          DROP                                   * 2E5E2
          OBJ_2F0DB                              * 2E5E7
          NOTcase                                * 2E5EC
          OBJ_2EFC8                              * 2E5F1
        ;                                        * 2E5F6

* refs (2): 2E736 2E740
OBJ_2E5FB:
        ::                                       * 2E5FB
          DUP                                    * 2E600
          nm=>st                                 * 2E605
          'LAMLNAMESTO                           * 2E60A
          OBJ_2E5BF                              * 2E60F
        ;                                        * 2E614

* refs (1): 2E74A
OBJ_2E619:
        ::                                       * 2E619
          INNERCOMP                              * 2E61E
          #2<>                                   * 2E623
          caseSIZEERR                            * 2E628
          nm=>st!                                * 2E62D
          'LAMLNAMESTO                           * 2E632
          dup;#nm?                               * 2E637
          case                                   * 2E63C
          SETTYPEERR                             * 2E641
          OBJ_2E5BF                              * 2E646
        ;                                        * 2E64B

* refs (3): 2D81B 2E62D 2E8AC
nm=>st!:
        ::                                       * 2E650
          dup;#nm?                               * 2E655
          ?SKIP                                  * 2E65A
          nm=>st                                 * 2E65F
          DUPTYPECSTR?                           * 2E664
          ?SEMI                                  * 2E669
          SETTYPEERR                             * 2E66E
        ;                                        * 2E673

* refs (2): 2E722 2E83A
OBJ_2E678:
        ::                                       * 2E678
          BEGIN                                  * 2E67D
          INNERDUP                               * 2E682
          #0<>                                   * 2E687
          WHILE                                  * 2E68C
          ::                                     * 2E691
            #1-{}N                               * 2E696
            SWAP                                 * 2E69B
            3@REVAL                              * 2E6A0
          ;                                      * 2E6A5
          REPEAT                                 * 2E6AA
          DROP                                   * 2E6AF
          COLASKIP                               * 2E6B4
        ;                                        * 2E6B9

* refs (2): 2E6F0 85596
InitIOEnv:
        ::                                       * 2E6BE
          OBJ_2D37C                              * 2E6C3
          BINT0                                  * 2E6C8
          {                                      * 2E6CD
            LAMKP                                * 2E6D2
            LAMPKNO                              * 2E6D7
          }                                      * 2E6DC
          BIND                                   * 2E6E1
        ;                                        * 2E6E6

* {} ->
* refs (4): 21F13 2E5B5 B8115 B8B29
SENDLIST:
        ::                                       * 2E6EB
          InitIOEnv                              * 2E6F0
          BINT0                                  * 2E6F5
          NULL$                                  * 2E6FA
          CHR_F                                  * 2E6FF
          ERRSET                                 * 2E704
          ::                                     * 2E709
            KERMOPEN                             * 2E70E
            CHOOSE_INIT                          * 2E713
            SendSetup                            * 2E718
            NOTcaseFALSE                         * 2E71D
            OBJ_2E678                            * 2E722
            ::                                   * 2E727
              CK&DISPATCH1                       * 2E72C
              BINT6                              * 2E731
              OBJ_2E5FB                          * 2E736
              BINT7                              * 2E73B
              OBJ_2E5FB                          * 2E740
              BINT5                              * 2E745
              OBJ_2E619                          * 2E74A
            ;                                    * 2E74F
            SENDEOT                              * 2E754
          ;                                      * 2E759
          ERRTRAP                                * 2E75E

* refs (3): 2D91F 2E98A 8560F
OBJ_2E763:
          ::                                     * 2E763
            DropSysErr$                          * 2E768
            SENDERROR                            * 2E76D

* refs (3): 2EE88 2EEB5 855D3
OBJ_2E772:
            ::                                   * 2E772
              AllowPrlcdCl                       * 2E777
              ERRJMP                             * 2E77C
            ;                                    * 2E781
          ;                                      * 2E786
          AllowPrlcdCl                           * 2E78B
          NOTcase                                * 2E790
          OBJ_2EFC8                              * 2E795
          ABND                                   * 2E79A
        ;                                        * 2E79F

* refs (11): 2DFDC 2E637 2E655 2E817 2FDFD 31962 ...
dup;#nm?:
        ::                                       * 2E7A4
          DUPTYPEIDNT?                           * 2E7A9
          OVER                                   * 2E7AE
          TYPELAM?                               * 2E7B3
          ORNOT                                  * 2E7B8
        ;                                        * 2E7BD

* refs (1): 2E5CE
OBJ_2E7C2:
        ::                                       * 2E7C2
          TYPELAM?                               * 2E7C7
          #       3                              * 2E7CC  3

* refs (1): 2E00E
OBJ_2E7D6:
          #       204                            * 2E7D6  516
          RPITE                                  * 2E7E0
          ERROROUT                               * 2E7E5
        ;                                        * 2E7EA

* $/id/lam ->
* refs (6): 21F33 21F3D 21F47 2E84E 2E858 B8AB2
GETNAME:
        ::                                       * 2E7EF
          NULL$                                  * 2E7F4
          kget(nm,st)                            * 2E7F9
        ;                                        * 2E7FE

* refs (1): 2E862
kget({2nm}):
        ::                                       * 2E803
          INNERCOMP                              * 2E808
          #2<>                                   * 2E80D
          caseSIZEERR                            * 2E812
          dup;#nm?                               * 2E817
          case                                   * 2E81C
          SETTYPEERR                             * 2E821
          nm=>st                                 * 2E826
          kget(nm,st)                            * 2E82B
        ;                                        * 2E830

* refs (2): 21F51 B8AAD
kget(li):
        ::                                       * 2E835
          OBJ_2E678                              * 2E83A
          ::                                     * 2E83F
            CK&DISPATCH1                         * 2E844
            BINT6                                * 2E849
            GETNAME                              * 2E84E
            BINT3                                * 2E853
            GETNAME                              * 2E858
            BINT5                                * 2E85D
            kget({2nm})                          * 2E862
          ;                                      * 2E867
          AllowPrlcdCl                           * 2E86C
        ;                                        * 2E871

* ->
* refs (1): 21FC0
DOFINISH:
        ::                                       * 2E876

_F_:
          $       "F"                            * 2E87B

_G_:
          $       "G"                            * 2E887
          DOPKT                                  * 2E893
          DROP                                   * 2E898
        ;                                        * 2E89D

* refs (2): 2E7F9 2E82B
kget(nm,st):
        ::                                       * 2E8A2
          SWAP                                   * 2E8A7
          nm=>st!                                * 2E8AC

_R_:
          $       "R"                            * 2E8B1
          ROT                                    * 2E8BD
          GOTO                                   * 2E8C2
          L_2E8DB                                * 2E8C7
        ;                                        * 2E8CC

* $ $' ->
* refs (3): 220EC 2E893 B89A9
DOPKT:
        ::                                       * 2E8D1
          BINT0                                  * 2E8D6
L_2E8DB:
          OBJ_2D37C                              * 2E8DB
          BINT0                                  * 2E8E0
          {                                      * 2E8E5
            LAMKP                                * 2E8EA
            LAMPKNO                              * 2E8EF
          }                                      * 2E8F4
          BIND                                   * 2E8F9
          ERRSET                                 * 2E8FE
          ::                                     * 2E903
            ZEROFALSE                            * 2E908
            {                                    * 2E90D
              LAMLNAME                           * 2E912
              LAMKMODE                           * 2E917
              LAMKRM                             * 2E91C
            }                                    * 2E921
            BIND                                 * 2E926
            EXCHINITPK                           * 2E92B
            SWAP                                 * 2E930
            ENCODE1PKT                           * 2E935
            BINT0                                * 2E93A
            ROT                                  * 2E93F
            CAR$                                 * 2E944
            BUILDKPACKET                         * 2E949
            SEND_PACKET                          * 2E94E
            case                                 * 2E953
            ::                                   * 2E958
              ABND                               * 2E95D
              AllowPrlcdCl                       * 2E962
              OBJ_2F678                          * 2E967
            ;                                    * 2E96C
            NOTcase                              * 2E971
            ERROROUT                             * 2E976
            OBJ_2D8A2                            * 2E97B
          ;                                      * 2E980
          ERRTRAP                                * 2E985
          OBJ_2E763                              * 2E98A
          ABND                                   * 2E98F
        ;                                        * 2E994

* refs (4): 2EAB0 B8BF7 B8C06 B8C1F
ResetIOPAR&->:
        ::                                       * 2E999

* -> {}
* refs (1): C748E
StdIOPAR:
          {                                      * 2E99E
            %9600                                * 2E9A3
            %0_2A2B4                             * 2E9A8
            %0_2A2B4                             * 2E9AD
            %0_2A2B4                             * 2E9B2
            %3                                   * 2E9B7
            %1                                   * 2E9BC
          }                                      * 2E9C1
          DUP                                    * 2E9C6

* {} ->
* refs (4): 2ECBB 305E3 B8177 C7493
StoIOPAR:
          ::                                     * 2E9CB
            '                                    * 2E9D0

IOPAR:
            ID      IOPAR                        * 2E9D5

* ob ID ->
* refs (1): 31F9A
SysSTO:
            ::                                   * 2E9E6
              CONTEXT@                           * 2E9EB

{local''}_2E9F0:
              {                                  * 2E9F0
                NULLLAM                          * 2E9F5
              }                                  * 2E9FA
              BIND                               * 2E9FF
              HOMEDIR                            * 2EA04
              ERRSET                             * 2EA09
              STO                                * 2EA0E
              ERRTRAP                            * 2EA13
              ::                                 * 2EA18
                1GETLAM                          * 2EA1D
                CONTEXT!                         * 2EA22
                ERRJMP                           * 2EA27
              ;                                  * 2EA2C
              1GETABND                           * 2EA31
              CONTEXT!                           * 2EA36
            ;                                    * 2EA3B
          ;                                      * 2EA40
          INCOMPDROP                             * 2EA45
        ;                                        * 2EA4A

* -> %baud % % % % %
* refs (15): 221A4 22478 2EAE7 2EB67 2EC9D 2ECED ...
GetIOPAR:
        ::                                       * 2EA4F
          '                                      * 2EA54

IOPAR_2EA59:
          ID      IOPAR                          * 2EA59

* ID -> ob T -> F
* refs (3): 31FCB B8B73 B8BED
Sys@:
          ::                                     * 2EA6A
            CONTEXT@                             * 2EA6F
            DUPDUP                               * 2EA74
            2DROP                                * 2EA79
            HOMEDIR                              * 2EA7E
            SWAP                                 * 2EA83
            DRPExitAtLOOP                        * 2EA88
            DUP                                  * 2EA8D
            ITE                                  * 2EA92
            ROT                                  * 2EA97
            SWAP                                 * 2EA9C
            CONTEXT!                             * 2EAA1
          ;                                      * 2EAA6
          NOTcase                                * 2EAAB
          ResetIOPAR&->                          * 2EAB0
          DUPTYPELIST?                           * 2EAB5
          NOTcase                                * 2EABA
          SetIOPARerr                            * 2EABF
          INNERCOMP                              * 2EAC4
          BINT6                                  * 2EAC9
          #<>                                    * 2EACE
          casedrop                               * 2EAD3
          SetIOPARerr                            * 2EAD8
        ;                                        * 2EADD

* refs (7): 2D51C 2D88E 2D9FA 2DB53 2DE19 2E70E ...
KERMOPEN:
        ::                                       * 2EAE2
          GetIOPAR                               * 2EAE7
          4DROP                                  * 2EAEC
          BINT33                                 * 2EAF1
          TestSysFlag                            * 2EAF6
          IT                                     * 2EAFB
          OBJ_56B87                              * 2EB00
          FalseFalse                             * 2EB05
          2SWAP                                  * 2EB0A
          OBJ_2EB8F                              * 2EB0F
          OBJ_2DA4A                              * 2EB14
          ::                                     * 2EB19
            TOADISP                              * 2EB1E
            REDISPHBUFF                          * 2EB23
          ;                                      * 2EB28
          OpenUartClr                            * 2EB2D
        ;                                        * 2EB32

* refs (2): 21EBF D4223
DOOPENIO:
        CON(5)  (*)+5                            * 2EB37  primitive code object
        ASSEMBLE
        AD1EX                                    * 2EB3C
        D1=(5)  uart_error                       * 2EB3F
        C=0     A                                * 2EB46
        DAT1=C  1                                * 2EB48
        D1=D1+  3                                * 2EB4C
        DAT1=C  B                                * 2EB4F
        D1=A                                     * 2EB52
        LC(5)   OpenIO                           * 2EB55
        A=C     A                                * 2EB5C
        PC=(A)                                   * 2EB5E
        RPL

* refs (5): 2EB55 2EE1D 2EE74 2EEA1 31881
OpenIO:
        ::                                       * 2EB62
          GetIOPAR                               * 2EB67
          2DROP                                  * 2EB6C
          IOCheckReal                            * 2EB71
          %0<>                                   * 2EB76
          4UNROLL                                * 2EB7B
          IOCheckReal                            * 2EB80
          %0<>                                   * 2EB85
          4UNROLL                                * 2EB8A

* refs (1): 2EB0F
OBJ_2EB8F:
          ::                                     * 2EB8F
            IOCheckReal                          * 2EB94
            DUP                                  * 2EB99
            %ABS                                 * 2EB9E
            %5                                   * 2EBA3
            %<                                   * 2EBA8
            NOTcase                              * 2EBAD
            SetIOPARerr                          * 2EBB2
            DUP                                  * 2EBB7
            %0>                                  * 2EBBC
            IT                                   * 2EBC1

4+(r):
            ::                                   * 2EBC6
              %4                                 * 2EBCB
              %+                                 * 2EBD0
            ;                                    * 2EBD5
            %IP>#                                * 2EBDA
            4UNROLL                              * 2EBDF
            IOCheckReal                          * 2EBE4
            %IP>#                                * 2EBE9
            s=okBaud?                            * 2EBEE
            NOTcase                              * 2EBF3
            SetIOPARerr                          * 2EBF8
            4UNROLL                              * 2EBFD
          ;                                      * 2EC02
          OpenUart?Clr                           * 2EC07
        ;                                        * 2EC0C

* % -> #IP(ABS(%))
* refs (9): 2EBDA 2EBE9 2EC89 2ED15 2EE9C 30389 ...
%IP>#:
        ::                                       * 2EC11
          %IP                                    * 2EC16
          %ABSCOERCE                             * 2EC1B
        ;                                        * 2EC20

* refs (6): 2EB71 2EB80 2EB94 2EBE4 30384 30B53
IOCheckReal:
        ::                                       * 2EC25
          DUPTYPEREAL?                           * 2EC2A
          ?SEMI                                  * 2EC2F

* Error C12h
* refs (6): 2EABF 2EAD8 2EBB2 2EBF8 303A2 30B62
SetIOPARerr:
          ::                                     * 2EC34
            #       C12                          * 2EC39  3090
            ERROROUT                             * 2EC43
          ;                                      * 2EC48
        ;                                        * 2EC4D

* refs (3): 2EBEE 2EC8E B852B
s=okBaud?:
        CON(5)  (*)+5                            * 2EC52  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 2EC57
        CD1EX                                    * 2EC5A
        D1=D1+  5                                * 2EC5D
        A=DAT1  A                                * 2EC60
        D1=C                                     * 2EC63
        LC(5)   #004B0                           * 2EC66
        P=      12                               * 2EC6D
L_2EC6F:
        ?C=A    A                                * 2EC6F
        GOYES   L_2EC7D                          * 2EC72
        C=C+C   A                                * 2EC74
        P=P+1                                    * 2EC76
        GONC    L_2EC6F                          * 2EC78
        P=P+1                                    * 2EC7B
L_2EC7D:
        GOVLNG  PushT/FLoop                      * 2EC7D
        RPL

* % ->
* refs (2): 2201B 223B5
DOBAUD:
        ::                                       * 2EC84
          %IP>#                                  * 2EC89
          s=okBaud?                              * 2EC8E
          NcaseSIZEERR                           * 2EC93
          UNCOERCE                               * 2EC98
          GetIOPAR                               * 2EC9D
          6ROLL                                  * 2ECA2
          DROP                                   * 2ECA7

* refs (8): 2ED06 2ED42 2ED6A B80E3 B861B B899A ...
6->list;StoInIPAR:
          ::                                     * 2ECAC
            BINT6                                * 2ECB1
            {}N                                  * 2ECB6
            StoIOPAR                             * 2ECBB
          ;                                      * 2ECC0
        ;                                        * 2ECC5

* % ->
* refs (2): 2203B 2242D
DOPARITY:
        ::                                       * 2ECCA
          %IP                                    * 2ECCF
          DUP                                    * 2ECD4
          %ABS                                   * 2ECD9
          %5                                     * 2ECDE
          %<                                     * 2ECE3
          NcaseSIZEERR                           * 2ECE8
          GetIOPAR                               * 2ECED
          7ROLL                                  * 2ECF2
          6ROLL                                  * 2ECF7
          DROP                                   * 2ECFC
          5UNROLL                                * 2ED01
          6->list;StoInIPAR                      * 2ED06
        ;                                        * 2ED0B

* % ->
* refs (2): 2205B 22469
DOTRANSIO:
        ::                                       * 2ED10
          %IP>#                                  * 2ED15
          DUP                                    * 2ED1A
          BINT3                                  * 2ED1F
          #>                                     * 2ED24
          caseSIZEERR                            * 2ED29
          UNCOERCE                               * 2ED2E
          GetIOPAR                               * 2ED33
          DROP                                   * 2ED38
          6ROLL                                  * 2ED3D
          6->list;StoInIPAR                      * 2ED42
        ;                                        * 2ED47

* refs (2): 21FFB 223EC
DOCKSM:
        ::                                       * 2ED4C
          OBJ_2ED74                              * 2ED51
          NcaseSIZEERR                           * 2ED56
          GetIOPAR                               * 2ED5B
          7ROLL                                  * 2ED60
          ROTDROPSWAP                            * 2ED65
          6->list;StoInIPAR                      * 2ED6A
        ;                                        * 2ED6F

* refs (3): 2ED51 30B58 B84EA
OBJ_2ED74:
        ::                                       * 2ED74
          %IP                                    * 2ED79
          %ABS                                   * 2ED7E
          DUP                                    * 2ED83
          %4                                     * 2ED88
          %<                                     * 2ED8D
          OVER                                   * 2ED92
          %0<>                                   * 2ED97
          AND                                    * 2ED9C
        ;                                        * 2EDA1

* -> $
* refs (1): 22076
DOKERRM:
        ::                                       * 2EDA6
          NULL$                                  * 2EDAB
          CODE                                   * 2EDB0  34 nibbles
            AD1EX                                * 2EDBA
            D1=(5)  KERMERRM                     * 2EDBD
            C=DAT1  A                            * 2EDC4
            AD1EX                                * 2EDC7
            ?C=0    A                            * 2EDCA
            GOYES   L_2EDD2                      * 2EDCD
            DAT1=C  A                            * 2EDCF
L_2EDD2:
            A=DAT0  A                            * 2EDD2
            D0=D0+  5                            * 2EDD5
            PC=(A)                               * 2EDD8
          ENDCODE                                * 2EDDC
        ;                                        * 2EDDC

* -> % 0/1
* refs (1): 22091
DOBUFLEN:
        ::                                       * 2EDE1
          UARTBUFLEN                             * 2EDE6
          UNCOERCE2                              * 2EDEB
        ;                                        * 2EDF0

* refs (1): 220B1
DOSTIME:
        ::                                       * 2EDF5
          %10*                                   * 2EDFA
          %ABSCOERCE                             * 2EDFF
          DUP                                    * 2EE04
          StimeSRecv(s)                          * 2EE09
          StimeXmit(s)                           * 2EE0E
        ;                                        * 2EE13

* ->
* refs (1): 220CC
DOSBRK:
        ::                                       * 2EE18
          OpenIO                                 * 2EE1D
          OBJ_31791                              * 2EE22
          OpenIO_324C8                           * 2EE27
        ;                                        * 2EE2C

* refs (1): 2EE60
OBJ_2EE31:
        CON(5)  (*)+5                            * 2EE31  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 2EE36
        CD0EX                                    * 2EE3D
        GOVLNG  L_13FF7                          * 2EE40
        RPL

* refs (2): 2EE8D 2EEBA
OBJ_2EE47:
        ::                                       * 2EE47
          OpenIO_324C8                           * 2EE4C
          case                                   * 2EE51
          %1                                     * 2EE56
          OBJ_2E4A5                              * 2EE5B
          OBJ_2EE31                              * 2EE60
          %0_2A2B4                               * 2EE65
        ;                                        * 2EE6A

* $ ->
* refs (1): 21E84
DOXMIT:
        ::                                       * 2EE6F
          OpenIO                                 * 2EE74
          ERRSET                                 * 2EE79
          PUTSERIAL                              * 2EE7E
          ERRTRAP                                * 2EE83
          OBJ_2E772                              * 2EE88
          OBJ_2EE47                              * 2EE8D
        ;                                        * 2EE92

* % ->
* refs (1): 21EA4
DOSRECV:
        ::                                       * 2EE97
          %IP>#                                  * 2EE9C
          OpenIO                                 * 2EEA1
          ERRSET                                 * 2EEA6
          GETSERIAL                              * 2EEAB
          ERRTRAP                                * 2EEB0
          OBJ_2E772                              * 2EEB5
          OBJ_2EE47                              * 2EEBA
        ;                                        * 2EEBF

* refs (2): 2E718 2EF32
SendSetup:
        ::                                       * 2EEC4
          4UNROLL                                * 2EEC9
          FALSE                                  * 2EECE
          {                                      * 2EED3
            LAMLNAME                             * 2EED8
            LAMOBJ                               * 2EEDD
            LAMPACKET                            * 2EEE2
            LAMKRM                               * 2EEE7
          }                                      * 2EEEC
          BIND                                   * 2EEF1
          CHR_S                                  * 2EEF6
          SWAP                                   * 2EEFB
          OBJ_2D4B3                              * 2EF00
          NOTcase                                * 2EF05
          false;Lpop                             * 2EF0A
          'LamKPSto                              * 2EF0F
          TRUE                                   * 2EF14
        ;                                        * 2EF19

* refs (2): 2DE0F 2E027
OBJ_2EF1E:
        ::                                       * 2EF1E
          LAMEXCHP                               * 2EF23
          ERRSET                                 * 2EF28

* refs (1): 855E7
OBJ_2EF2D:
          ::                                     * 2EF2D
            SendSetup                            * 2EF32
            NOTcaseFALSE                         * 2EF37
            OBJ_2F0DB                            * 2EF3C
            NOTcaseFALSE                         * 2EF41
            SENDEOT                              * 2EF46
            case                                 * 2EF4B

* refs (3): 2D654 2F628 6AE60
Lpop;true:
            ::                                   * 2EF50
              ABND                               * 2EF55
              TRUE                               * 2EF5A
            ;                                    * 2EF5F

* refs (3): 2D4F9 2EF0A 34FAC
false;Lpop:
            ::                                   * 2EF64
              FALSE                              * 2EF69
              ABND                               * 2EF6E
            ;                                    * 2EF73
          ;                                      * 2EF78
          ERRTRAP                                * 2EF7D
          ::                                     * 2EF82
            DropSysObs                           * 2EF87
            ERROR@                               * 2EF8C
            FalseFalse                           * 2EF91
          ;                                      * 2EF96
        ;                                        * 2EF9B

* refs (5): 2DC07 2DCFC 2DDD3 2DF6A 2E4C8
OBJ_2EFA0:
        ::                                       * 2EFA0
          DUP#0=IT                               * 2EFA5
          ::                                     * 2EFAA
            DROP                                 * 2EFAF
            ATTNERR                              * 2EFB4
          ;                                      * 2EFB9
          GETTHEMESG                             * 2EFBE
        ;                                        * 2EFC3

* refs (3): 2E5F1 2E795 85637
OBJ_2EFC8:
        ::                                       * 2EFC8
          NOTcase                                * 2EFCD
          ERROROUT                               * 2EFD2

* refs (2): 2D8BB 2D8DE
TRPACKETFAIL:
          ::                                     * 2EFD7
            CHR_E                                * 2EFDC
            EQUAL                                * 2EFE1
            IT                                   * 2EFE6
            ::                                   * 2EFEB
              DROP                               * 2EFF0
              DECODE                             * 2EFF5
              OBJ_30E6C                          * 2EFFA
              OBJ_2F01D                          * 2EFFF
            ;                                    * 2F004
            XFERFAIL                             * 2F009
            ERROROUT                             * 2F00E
          ;                                      * 2F013
        ;                                        * 2F018

* refs (3): 2DC11 2DFA5 2EFFF
OBJ_2F01D:
        ::                                       * 2F01D
          ERRBEEP                                * 2F022
          KDispStatus2                           * 2F027
          %3                                     * 2F02C
          dowait                                 * 2F031
          ?ATTNQUIT                              * 2F036
        ;                                        * 2F03B

* refs (1): 2F095
OBJ_2F040:
        ::                                       * 2F040

* refs (2): 2F1DF 2F4F7
OBJ_2F045:
          ::                                     * 2F045
            #       C10                          * 2F04A  3088
            JstGetTHEMESG                        * 2F054
          ;                                      * 2F059
          KDispRow2                              * 2F05E
          FALSE'                                 * 2F063
          LAMKRM                                 * 2F068
          STO                                    * 2F06D
        ;                                        * 2F072

* refs (2): 2F266 2FA38
OBJ_2F077:
        ::                                       * 2F077
          BINT39                                 * 2F07C
          TestSysFlag                            * 2F081
          ?SEMI                                  * 2F086
          LAMKRM                                 * 2F08B
          IT                                     * 2F090
          OBJ_2F040                              * 2F095
          LAMPKNO                                * 2F09A
          #>$                                    * 2F09F
          $>GROB                                 * 2F0A4
          HARDBUFF                               * 2F0A9
          LAMKML                                 * 2F0AE
          #       8                              * 2F0B3  8
          GROB!                                  * 2F0BD
        ;                                        * 2F0C2

* refs (1): 2F25C
Lpop;q:
        ::                                       * 2F0C7
          ABND                                   * 2F0CC
          RDROP                                  * 2F0D1
        ;                                        * 2F0D6

* refs (2): 2E5E7 2EF3C
OBJ_2F0DB:
        ::                                       * 2F0DB

<COD>:
          #       C0D                            * 2F0E0  3085
          JstGetTHEMESG                          * 2F0EA
          LAMLNAME                               * 2F0EF
          &$                                     * 2F0F4
          KDispStatus2                           * 2F0F9
          LAMLNAME                               * 2F0FE
          LAMPACKET                              * 2F103
          FalseFalse                             * 2F108
          LAMOBJ                                 * 2F10D
          LAMPACKET                              * 2F112
          CHR_X                                  * 2F117
          EQUAL                                  * 2F11C
          ITE                                    * 2F121
          NULL$TEMP                              * 2F126
          ::                                     * 2F12B
            XEQTYPE                              * 2F130
            COERCE                               * 2F135
            BINT16                               * 2F13A
            #<                                   * 2F13F
            OBJ_30771                            * 2F144
            ANDITE                               * 2F149
            ::                                   * 2F14E
              DUPTYPECSTR?                       * 2F153
              IT                                 * 2F158
              DECOMP$                            * 2F15D

* refs (1): 2F3FB
_%%HP:_:
              $       "%%HP:"                    * 2F162
              HeadIOString                       * 2F176
              !append$                           * 2F17B
              CHR_;                              * 2F180
              >T$                                * 2F185
              APNDCRLF                           * 2F18A
            ;                                    * 2F18F
            ::                                   * 2F194
              ?>ROMPTR                           * 2F199
              ROTDROP                            * 2F19E
              TRUE                               * 2F1A3
              3UNROLL                            * 2F1A8
              VERSTRING                          * 2F1AD
            ;                                    * 2F1B2
          ;                                      * 2F1B7
          SWAP'                                  * 2F1BC
          LAMOBJ                                 * 2F1C1
          STO                                    * 2F1C6
          NULL{}                                 * 2F1CB
          SWAP                                   * 2F1D0
          THREE{}N                               * 2F1D5
          BINT0                                  * 2F1DA
          OBJ_2F045                              * 2F1DF
          DUP                                    * 2F1E4
          5UNROLL                                * 2F1E9
          LEN$                                   * 2F1EE
          BINT6                                  * 2F1F3
          #*                                     * 2F1F8
          {                                      * 2F1FD
            NULLLAM                              * 2F202
            LAMKLIST                             * 2F207
            LAMOPOS                              * 2F20C

* refs (2): 2F0AE 2F50B
LAMKML:
            LAM     'KML                         * 2F211
          }                                      * 2F220
          BIND                                   * 2F225
          KDispRow2                              * 2F22A
          SWAP                                   * 2F22F
          ENCODE1PKT                             * 2F234
          GetKermPkt#                            * 2F239
          ROT                                    * 2F23E
          BEGIN                                  * 2F243
          BUILDKPACKET                           * 2F248
          SEND_PACKET                            * 2F24D
          DUP                                    * 2F252
          NOTcase                                * 2F257
          Lpop;q                                 * 2F25C
          2DROP                                  * 2F261
          OBJ_2F077                              * 2F266
          LAMOPOS                                * 2F26B
          MINUSONE                               * 2F270
          #<>                                    * 2F275
          WHILE                                  * 2F27A
          ::                                     * 2F27F
            LAMOBJ                               * 2F284
            LAMKLIST                             * 2F289
            INCOMPDROP                           * 2F28E
            OBJ_2FD03                            * 2F293
            ITE                                  * 2F298

drop(4);rot:
            ::                                   * 2F29D
              4ROLL                              * 2F2A2
              DROPROT                            * 2F2A7
            ;                                    * 2F2AC
            ::                                   * 2F2B1
              ROT                                * 2F2B6
              NOTcase                            * 2F2BB
              OBJ_2FC04                          * 2F2C0
              ROTDROP                            * 2F2C5
              TRUE                               * 2F2CA
            ;                                    * 2F2CF
            UNROTDUP                             * 2F2D4
            GETKP                                * 2F2D9
            ENCODE                               * 2F2DE
            ITE                                  * 2F2E3

drop(2-4);<FFFFF>:
            ::                                   * 2F2E8
              4UNROLL3DROP                       * 2F2ED
              MINUSONE                           * 2F2F2
            ;                                    * 2F2F7
            ::                                   * 2F2FC
              ROTSWAP                            * 2F301
              #1+LAST$                           * 2F306
              SWAP                               * 2F30B
              4UNROLL                            * 2F310
              THREE{}N                           * 2F315
              '                                  * 2F31A
              LAMKLIST                           * 2F31F
              STO                                * 2F324
              BINT0                              * 2F329
            ;                                    * 2F32E
            '                                    * 2F333
            LAMOPOS                              * 2F338
            STO                                  * 2F33D
            GetKermPkt#                          * 2F342
            CHR_D                                * 2F347
          ;                                      * 2F34C
          REPEAT                                 * 2F351
          ABND                                   * 2F356
          NULL$                                  * 2F35B
          GetKermPkt#                            * 2F360
          CHR_Z                                  * 2F365
          BUILDKPACKET                           * 2F36A
          SEND_PACKET                            * 2F36F
          NOTcaseFALSE                           * 2F374
          DROPTRUE                               * 2F379
        ;                                        * 2F37E

* refs (5): 2D64F 2F731 2F862 2FA47 2FA83
IncrLAMPKNO:
        ::                                       * 2F383
          LAMPKNO                                * 2F388
          #1+                                    * 2F38D
          OBJ_2DAB3                              * 2F392
        ;                                        * 2F397

* refs (12): 2D596 2D63B 2D6E5 2E0B3 2F239 2F342 ...
GetKermPkt#:
        ::                                       * 2F39C
          LAMPKNO                                * 2F3A1
          #       40                             * 2F3A6  64
          #/                                     * 2F3B0
          DROP                                   * 2F3B5
        ;                                        * 2F3BA

* refs (1): 2F556
OBJ_2F3BF:
        ::                                       * 2F3BF
          LAMLNAME                               * 2F3C4
          BINT0                                  * 2F3C9
          EQUAL                                  * 2F3CE
          caseFALSE                              * 2F3D3
          OBJ_3073A                              * 2F3D8
          caseFALSE                              * 2F3DD
          HeadIOString                           * 2F3E2
          '                                      * 2F3E7
          LAMKMODE                               * 2F3EC
          STO                                    * 2F3F1
          DUP                                    * 2F3F6
          _%%HP:_                                * 2F3FB
          BINT1                                  * 2F400
          POS$                                   * 2F405
          DUP#0=                                 * 2F40A
          casedrop                               * 2F40F
          ::                                     * 2F414
            OBJ_30771                            * 2F419
            NOTcaseFALSE                         * 2F41E
            NULL$TEMP                            * 2F423
            TRUE                                 * 2F428
          ;                                      * 2F42D
          #5+                                    * 2F432
          LAST$                                  * 2F437
          DUP                                    * 2F43C
          tok;                                   * 2F441
          BINT1                                  * 2F446
          POS$                                   * 2F44B
          2DUP                                   * 2F450
          #1+LAST$                               * 2F455
          3UNROLL                                * 2F45A
          1_#1-SUB$                              * 2F45F
          TRUE                                   * 2F464
        ;                                        * 2F469

* refs (4): 2F579 2FB69 2FB7D 2FBE1
Π'KEOF:
        LAM     'KEOF                            * 2F46E

* refs (3): 2F597 2F5D3 2F5E2
OBJ_2F47F:
        ::                                       * 2F47F
          LAMKMODE                               * 2F484
          OBJ_30477                              * 2F489
          DROP                                   * 2F48E
          ABND                                   * 2F493
        ;                                        * 2F498

* refs (2): 2F5A1 2F614
OBJ_2F49D:
        ::                                       * 2F49D
          #       86                             * 2F4A2  134
          #>CHR                                  * 2F4AC
          >T$                                    * 2F4B1
          OVER                                   * 2F4B6
          !append$                               * 2F4BB
          OBJ_30E6C                              * 2F4C0
          DROP                                   * 2F4C5
          OBJ_2E2B4                              * 2F4CA
          ITE                                    * 2F4CF
          3DROP                                  * 2F4D4
          DROP                                   * 2F4D9
          #SyntaxErr                             * 2F4DE
          OBJ_2E4BE                              * 2F4E3
          FALSE                                  * 2F4E8
        ;                                        * 2F4ED

* refs (1): 2F916
OBJ_2F4F2:
        ::                                       * 2F4F2
          OBJ_2F045                              * 2F4F7
          DUPLEN$                                * 2F4FC
          #6*                                    * 2F501

{Π'KML}:
          {                                      * 2F506
            LAMKML                               * 2F50B
          }                                      * 2F510
          BIND                                   * 2F515
          KDispRow2                              * 2F51A
          OBJ_2F9ED                              * 2F51F
          NOTcase                                * 2F524
          ::                                     * 2F529
            ROTDROP                              * 2F52E
            FALSE                                * 2F533
          ;                                      * 2F538
          NOTcase                                * 2F53D

* ob ob' -> T
2DROPTRUE:
          ::                                     * 2F542
            2DROP                                * 2F547
            TRUE                                 * 2F54C
          ;                                      * 2F551
          OBJ_2F3BF                              * 2F556
          case                                   * 2F55B
          ::                                     * 2F560
            ROT                                  * 2F565
            BINT0                                * 2F56A
            {                                    * 2F56F
              LAMKPTRN                           * 2F574
              Π'KEOF                             * 2F579
            }                                    * 2F57E
            BIND                                 * 2F583
            OBJ_30477                            * 2F588
            NOTcase                              * 2F58D
            ::                                   * 2F592
              OBJ_2F47F                          * 2F597
              NULL$TEMP                          * 2F59C
              OBJ_2F49D                          * 2F5A1
            ;                                    * 2F5A6
            KINVISLF                             * 2F5AB
            '                                    * 2F5B0
            LAMKPTRN                             * 2F5B5
            STO                                  * 2F5BA
            ERRSET                               * 2F5BF
            OBJ_258DA                            * 2F5C4
            ERRTRAP                              * 2F5C9
            ::                                   * 2F5CE
              OBJ_2F47F                          * 2F5D3
              ERRJMP                             * 2F5D8
            ;                                    * 2F5DD
            OBJ_2F47F                            * 2F5E2
            NOTcaseFALSE                         * 2F5E7
            NOTcase                              * 2F5EC
            ::                                   * 2F5F1
              LEN$                               * 2F5F6
              #-                                 * 2F5FB
              2DUP                               * 2F600
              LAST$                              * 2F605
              3UNROLL                            * 2F60A
              1_#1-SUB$                          * 2F60F
              OBJ_2F49D                          * 2F614
            ;                                    * 2F619
            NOTcaseTRUE                          * 2F61E
            OBJ_2F68C                            * 2F623
            Lpop;true                            * 2F628
          ;                                      * 2F62D
          BEGIN                                  * 2F632
          !!append$                              * 2F637
          OBJ_2F9ED                              * 2F63C
          NOTcase                                * 2F641
          RDROPFALSE                             * 2F646
          NOT_UNTIL                              * 2F64B
          ABND                                   * 2F650
          NOTcase                                * 2F655
          DROPTRUE                               * 2F65A
          OBJ_30607                              * 2F65F
          LAMLNAME                               * 2F664
          BINT0                                  * 2F669
          EQUAL                                  * 2F66E
          ITE                                    * 2F673

* refs (1): 2E967
OBJ_2F678:
          ::                                     * 2F678
            KINVISLF                             * 2F67D
            !append$                             * 2F682
          ;                                      * 2F687

* refs (1): 2F623
OBJ_2F68C:
          ::                                     * 2F68C
            LAMLNAME                             * 2F691
            OBJ_2157E                            * 2F696
          ;                                      * 2F69B
          TRUE                                   * 2F6A0
        ;                                        * 2F6A5

* refs (2): 2F803 2FB2D
OBJ_2F6AA:
        ::                                       * 2F6AA
          DROPSWAPDROP                           * 2F6AF
          MAXRETRY                               * 2F6B4
          OBJ_2D7AD                              * 2F6B9
          NOTcasedrop                            * 2F6BE
          ::                                     * 2F6C3
            XFERFAIL                             * 2F6C8
            OBJ_2E4BE                            * 2F6CD
          ;                                      * 2F6D2
          SENDNULLACK                            * 2F6D7
          TRUE                                   * 2F6DC
        ;                                        * 2F6E1

* refs (2): 2F740 2F9F2
OBJ_2F6E6:
        ::                                       * 2F6E6
          MAXRETRY                               * 2F6EB

{Π'RETRY}:
          {                                      * 2F6F0
            LAMRETRY                             * 2F6F5
          }                                      * 2F6FA
          BIND                                   * 2F6FF
        ;                                        * 2F704

* refs (3): 2D8C5 2DF24 2F83F
OBJ_2F709:
        ::                                       * 2F709
          ACK_INIT                               * 2F70E
          NOTcase                                * 2F713
          ::                                     * 2F718
            SENDNAK                              * 2F71D
            FalseFalse                           * 2F722
          ;                                      * 2F727
          GetKermPkt#                            * 2F72C
          IncrLAMPKNO                            * 2F731
          SENDACK                                * 2F736
          'LamKPSto                              * 2F73B
L_2F740:
          OBJ_2F6E6                              * 2F740
L_2F745:
          RecvNextPkt                            * 2F745
          NOTcaseFALSE                           * 2F74A
          OVER                                   * 2F74F
          GetKermPkt#                            * 2F754
          #=case                                 * 2F759
          ::                                     * 2F75E
            ABND                                 * 2F763
            DUP                                  * 2F768
            CHR_F                                * 2F76D
            EQUAL                                * 2F772
            ?GOTO                                * 2F777
            L_2F85D                              * 2F77C
            DUP                                  * 2F781
            CHR_B                                * 2F786
            EQUALcase                            * 2F78B
            ::                                   * 2F790
              DROPSWAPDROP                       * 2F795
              SENDNULLACK                        * 2F79A
              TRUE                               * 2F79F
            ;                                    * 2F7A4
            LAMLNAME                             * 2F7A9
            TYPECSTR?                            * 2F7AE
            case                                 * 2F7B3
            TrueFalse                            * 2F7B8
            DUP                                  * 2F7BD
            CHR_X                                * 2F7C2
            EQUAL                                * 2F7C7
            ?GOTO                                * 2F7CC
            L_2F85D                              * 2F7D1
            TrueFalse                            * 2F7D6
          ;                                      * 2F7DB
          OBJ_2F957                              * 2F7E0
          case                                   * 2F7E5
          ::                                     * 2F7EA
            DUP                                  * 2F7EF
            CHR_Z                                * 2F7F4
            EQUALcase                            * 2F7F9
            ::                                   * 2F7FE
              OBJ_2F6AA                          * 2F803
              ?GOTO                              * 2F808
              L_2F745                            * 2F80D
              Lpop;2false                        * 2F812
            ;                                    * 2F817
            ABND                                 * 2F81C
            DUP                                  * 2F821
            CHR_S                                * 2F826
            EQUALcasedrp                         * 2F82B
            ::                                   * 2F830
              OBJ_2DAB3                          * 2F835
              COLA                               * 2F83A
              OBJ_2F709                          * 2F83F
            ;                                    * 2F844
            TrueFalse                            * 2F849
          ;                                      * 2F84E
          COLA                                   * 2F853
          Lpop;true;false                        * 2F858
L_2F85D:
          DROP                                   * 2F85D
          IncrLAMPKNO                            * 2F862
          SWAP                                   * 2F867
          DECODE                                 * 2F86C
          LAMLNAME                               * 2F871
          TYPECSTR?                              * 2F876
          NOTcase                                * 2F87B
          ::                                     * 2F880
            ZEROSWAP                             * 2F885
            APNDCRLF                             * 2F88A
            GOTO                                 * 2F88F
            L_2F8DA                              * 2F894
          ;                                      * 2F899
          LAMLNAME                               * 2F89E
          DUPNULL$?                              * 2F8A3
          NOT?SWAPDROP                           * 2F8A8
          OBJ_2FDDF                              * 2F8AD
          NOTcase                                * 2F8B2
          ::                                     * 2F8B7
            DROP                                 * 2F8BC
            OBJ_672DC                            * 2F8C1
            OBJ_2E4BE                            * 2F8C6
            FALSE                                * 2F8CB
          ;                                      * 2F8D0
          NULL$TEMP                              * 2F8D5
L_2F8DA:
          SWAPDUP                                * 2F8DA
          'LAMLNAMESTO                           * 2F8DF
          ID>$                                   * 2F8E4
          DUP                                    * 2F8E9
          #       C0E                            * 2F8EE  3086
          JstGetTHEMESG                          * 2F8F8
          !insert$                               * 2F8FD
          KDispStatus2                           * 2F902
          ENCODE1PKT                             * 2F907
          ROT                                    * 2F90C
          SENDACK                                * 2F911
          OBJ_2F4F2                              * 2F916
          NULL$                                  * 2F91B
          'LAMLNAMESTO                           * 2F920
          ?GOTO                                  * 2F925
          L_2F740                                * 2F92A
          NOTcase                                * 2F92F

* -> F F
* refs (15): 0AAB7 2461D 2D5D7 2D726 2EB05 2EF91 ...
FalseFalse:
          ::                                     * 2F934
            FALSE                                * 2F939
            FALSE                                * 2F93E
          ;                                      * 2F943
          INCOMPDROP                             * 2F948
          TrueFalse                              * 2F94D
        ;                                        * 2F952

* refs (3): 2D65E 2F7E0 2FAE7
OBJ_2F957:
        ::                                       * 2F957
          OVER                                   * 2F95C
          LAMPKNO                                * 2F961
          #1-                                    * 2F966
          #       40                             * 2F96B  64
          #/                                     * 2F975
          DROP                                   * 2F97A
          #=                                     * 2F97F
        ;                                        * 2F984

* refs (3): 2D893 2F745 2F9F7
RecvNextPkt:
        ::                                       * 2F989
          BEGIN                                  * 2F98E
          OBJ_2E2B4                              * 2F993
          NOT_WHILE                              * 2F998
          ::                                     * 2F99D
            MAXRETRY                             * 2F9A2
            OBJ_2D7AD                            * 2F9A7
            NOTcase                              * 2F9AC
            ::                                   * 2F9B1
              2RDROP                             * 2F9B6
              Lpop;2false                        * 2F9BB
            ;                                    * 2F9C0
            DROPNULL$                            * 2F9C5
            GetKermPkt#                          * 2F9CA
            CHR_N                                * 2F9CF
            SENDPKT                              * 2F9D4
          ;                                      * 2F9D9
          REPEAT                                 * 2F9DE
          TRUE                                   * 2F9E3
        ;                                        * 2F9E8

* refs (3): 2F51F 2F63C 2FB8C
OBJ_2F9ED:
        ::                                       * 2F9ED
          OBJ_2F6E6                              * 2F9F2
L_2F9F7:
          RecvNextPkt                            * 2F9F7
          NOTcaseFALSE                           * 2F9FC
          OVER                                   * 2FA01
          GetKermPkt#                            * 2FA06
          #=case                                 * 2FA0B
          ::                                     * 2FA10
            ABND                                 * 2FA15
            DUP                                  * 2FA1A
            CHR_D                                * 2FA1F
            EQUALcasedrp                         * 2FA24
            ::                                   * 2FA29
              SWAP                               * 2FA2E
              DECODE                             * 2FA33
              OBJ_2F077                          * 2FA38
              SWAPDUP                            * 2FA3D
              SENDNULLACK                        * 2FA42
              IncrLAMPKNO                        * 2FA47
              DROP                               * 2FA4C
              TrueTrue                           * 2FA51
            ;                                    * 2FA56
            DUP                                  * 2FA5B
            CHR_Z                                * 2FA60
            EQUALcasedrp                         * 2FA65
            ::                                   * 2FA6A
              DROP                               * 2FA6F
              DECODE                             * 2FA74
              GetKermPkt#                        * 2FA79
              SENDNULLACK                        * 2FA7E
              IncrLAMPKNO                        * 2FA83
              CAR$                               * 2FA88
              CHR_D                              * 2FA8D
              EQUALcase                          * 2FA92
              ::                                 * 2FA97
                #       C0F                      * 2FA9C  3087
                JstGetTHEMESG                    * 2FAA6
                KDispRow2                        * 2FAAB
                FalseFalse                       * 2FAB0
                TRUE                             * 2FAB5
              ;                                  * 2FABA
              TrueFalse                          * 2FABF
              TRUE                               * 2FAC4
            ;                                    * 2FAC9

* refs (2): 2FB4B 2FB5A
3->list;true;false:
            ::                                   * 2FACE
              THREE{}N                           * 2FAD3
              TrueFalse                          * 2FAD8
            ;                                    * 2FADD
          ;                                      * 2FAE2
          OBJ_2F957                              * 2FAE7
          case                                   * 2FAEC
          ::                                     * 2FAF1
            DUP                                  * 2FAF6
            CHR_D                                * 2FAFB
            EQUAL                                * 2FB00
            OVER                                 * 2FB05
            CHR_F                                * 2FB0A
            EQUALOR                              * 2FB0F
            OVER                                 * 2FB14
            CHR_X                                * 2FB19
            EQUALOR                              * 2FB1E
            case                                 * 2FB23
            ::                                   * 2FB28
              OBJ_2F6AA                          * 2FB2D
              ?GOTO                              * 2FB32
              L_2F9F7                            * 2FB37
              Lpop;2false                        * 2FB3C
            ;                                    * 2FB41
            ABND                                 * 2FB46
            3->list;true;false                   * 2FB4B
          ;                                      * 2FB50
          ABND                                   * 2FB55
          3->list;true;false                     * 2FB5A
        ;                                        * 2FB5F

* refs (1): 26257
OBJ_2FB64:
        ::                                       * 2FB64
          Π'KEOF                                 * 2FB69
          TYPEBINT?                              * 2FB6E
          NOTcase                                * 2FB73
          ::                                     * 2FB78
            Π'KEOF                               * 2FB7D
            failed                               * 2FB82
          ;                                      * 2FB87
          OBJ_2F9ED                              * 2FB8C
          NOTcaseFALSE                           * 2FB91
          case                                   * 2FB96
          ::                                     * 2FB9B
            LAMKPTRN                             * 2FBA0
            !insert$                             * 2FBA5
            KINVISLF                             * 2FBAA
            '                                    * 2FBAF
            LAMKPTRN                             * 2FBB4
            STO                                  * 2FBB9
            TrueTrue                             * 2FBBE
          ;                                      * 2FBC3
          LAMKPTRN                               * 2FBC8
          NULL$?                                 * 2FBCD
          NOTcase                                * 2FBD2
          ::                                     * 2FBD7
            '                                    * 2FBDC
            Π'KEOF                               * 2FBE1
            STO                                  * 2FBE6
            LAMKPTRN                             * 2FBEB
            TrueTrue                             * 2FBF0
          ;                                      * 2FBF5
          failed                                 * 2FBFA
        ;                                        * 2FBFF

* refs (1): 2F2C0
OBJ_2FC04:
        ::                                       * 2FC04
          4GETLAM                                * 2FC09
          case                                   * 2FC0E
          ::                                     * 2FC13
            SWAPINCOMP                           * 2FC18
            DUP#0=                               * 2FC1D
            NOT?DROP                             * 2FC22
            CKREF                                * 2FC27
            ROT                                  * 2FC2C
            OBJ_2FD26                            * 2FC31
            SWAP4ROLL                            * 2FC36
            !insert$                             * 2FC3B
            SWAPROT                              * 2FC40
            ONE{}N                               * 2FC45
            3UNROLL                              * 2FC4A
          ;                                      * 2FC4F
          3PICK                                  * 2FC54
          TYPECSTR?                              * 2FC59
          case                                   * 2FC5E
          ::                                     * 2FC63
            NULL$                                * 2FC68
            '                                    * 2FC6D
            LAMOBJ                               * 2FC72
            STO                                  * 2FC77
            ROT                                  * 2FC7C
            KVISLF                               * 2FC81
            !append$                             * 2FC86
            TRUE                                 * 2FC8B
          ;                                      * 2FC90
          BEGIN                                  * 2FC95
          3PICK                                  * 2FC9A
          ROT                                    * 2FC9F
          savefmt1                               * 2FCA4
          ERRSET                                 * 2FCA9
          OBJ_16A0E                              * 2FCAE
          ERRTRAP                                * 2FCB3
          ederr                                  * 2FCB8
          rstfmt1                                * 2FCBD
          3UNROLL                                * 2FCC2
          KVISLF                                 * 2FCC7
          !append$                               * 2FCCC
          APNDCRLF                               * 2FCD1
          OBJ_2FD03                              * 2FCD6
          3PICK                                  * 2FCDB
          NULLCOMP?                              * 2FCE0
          OR                                     * 2FCE5
          UNTIL                                  * 2FCEA
          ROTDROP                                * 2FCEF
          OVER                                   * 2FCF4
          NULLCOMP?                              * 2FCF9
        ;                                        * 2FCFE

* refs (2): 2F293 2FCD6
OBJ_2FD03:
        ::                                       * 2FD03
          DUPLEN$                                * 2FD08
          LAMKP                                  * 2FD0D
          CAR$                                   * 2FD12
          CHR>#                                  * 2FD17
          #>                                     * 2FD1C
        ;                                        * 2FD21

* refs (1): 2FC31
OBJ_2FD26:
        CON(5)  (*)+5                            * 2FD26  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 2FD2B
        A=DAT1  A                                * 2FD32
        D0=A                                     * 2FD35
        R0=A                                     * 2FD38
        D1=D1+  5                                * 2FD3B
        A=DAT1  A                                * 2FD3E
        D1=A                                     * 2FD41
        D1=D1+  5                                * 2FD44
        A=DAT1  A                                * 2FD47
        R3=A                                     * 2FD4A
        C=0     A                                * 2FD4D
        LC(2)   #B6                              * 2FD4F
        A=A+C   A                                * 2FD53
        DAT1=A  A                                * 2FD55
        GOSBVL  SKIPOB                           * 2FD58
        A=R0                                     * 2FD5F
        C=R3                                     * 2FD62
        C=C+A   A                                * 2FD65
        AD0EX                                    * 2FD67
        A=A-C   A                                * 2FD6A
        C=0     A                                * 2FD6C
        GOC     L_2FD7F                          * 2FD6E
        LC(2)   #B6                              * 2FD71
        ST=0    2                                * 2FD75
        A=A-C   A                                * 2FD78
        GONC    L_2FD82                          * 2FD7A
        C=C+A   A                                * 2FD7D
L_2FD7F:
        ST=1    2                                * 2FD7F
L_2FD82:
        GOSUB   SUB_2FD9F                        * 2FD82
        GOSBVL  GETPTR                           * 2FD86
        A=R0                                     * 2FD8D
        DAT1=A  A                                * 2FD90
        ?ST=1   2                                * 2FD93
        GOYES   L_2FD98                          * 2FD96
L_2FD98:
        GOVLNG  PushT/FLoop                      * 2FD98

* refs (1): 2FD82
SUB_2FD9F:
        R1=C                                     * 2FD9F
        C=C+1   A                                * 2FDA2
        CSRB.F  A                                * 2FDA4
        GOSBVL  MAKE$                            * 2FDA9
        AD0EX                                    * 2FDB0
        C=DAT1  A                                * 2FDB3
        B=C     A                                * 2FDB6
        C=R3                                     * 2FDB8
        C=C+B   A                                * 2FDBB
        D0=C                                     * 2FDBD
        D1=A                                     * 2FDC0
        C=R1                                     * 2FDC3
        GOSBVL  MOVEDOWN                         * 2FDC6
        C=R1                                     * 2FDCD
        ?CBIT=0 0                                * 2FDD0
        RTNYES                                   * 2FDD5
        C=0     A                                * 2FDD7
        DAT1=C  1                                * 2FDD9
        RTN                                      * 2FDDD
        RPL

* refs (1): 2F8AD
OBJ_2FDDF:
        ::                                       * 2FDDF
          ZEROSWAP                               * 2FDE4
          DUP                                    * 2FDE9
L_2FDEE:
          palparse                               * 2FDEE
          NOTcase                                * 2FDF3
          5DROPFALSE                             * 2FDF8
          dup;#nm?                               * 2FDFD
          case                                   * 2FE02
          ::                                     * 2FE07
            ROM-WORD?                            * 2FE0C
            ?GOTO                                * 2FE11
            L_2FE52                              * 2FE16
            2DROPFALSE                           * 2FE1B
          ;                                      * 2FE20
          dup;RclInVars(gn)?                     * 2FE25
          NOTcase                                * 2FE2A
          XYZ>ZTRUE                              * 2FE2F
          DROP                                   * 2FE34
          BINT36                                 * 2FE39
          TestSysFlag                            * 2FE3E
          case                                   * 2FE43
          XYZ>ZTRUE                              * 2FE48
          DROP                                   * 2FE4D
L_2FE52:
          SWAP#1+SWAP                            * 2FE52
          DUP                                    * 2FE57
          DPRADIX?                               * 2FE5C
          ITE                                    * 2FE61
          CHR_.                                  * 2FE66
          CHR_,                                  * 2FE6B
          >T$                                    * 2FE70
          3PICK                                  * 2FE75
          #>$                                    * 2FE7A
          &$                                     * 2FE7F
          GOTO                                   * 2FE84
          L_2FDEE                                * 2FE89
        ;                                        * 2FE8E
        BSS     14                               * 2FE93

* refs (4): 2DE5A 2F736 2F911 2FEBF
SENDACK:
        ::                                       * 2FEA1
          CHR_Y                                  * 2FEA6
          SENDPKT                                * 2FEAB
        ;                                        * 2FEB0

* refs (5): 2DEC5 2F6D7 2F79A 2FA42 2FA7E
SENDNULLACK:
        ::                                       * 2FEB5
          NULL$SWAP                              * 2FEBA
          SENDACK                                * 2FEBF
        ;                                        * 2FEC4

* $ -> $'
* refs (3): 2E0D6 2FC81 2FCC7
KVISLF:
        ::                                       * 2FEC9
          ChkTransio                             * 2FECE
          OBJ_2FEF1                              * 2FED3
        ;                                        * 2FED8

* $ -> $'
* refs (1): 3217A
KVIS:
        ::                                       * 2FEDD
          ChkTransio                             * 2FEE2
          OBJ_2FEFD                              * 2FEE7
        ;                                        * 2FEEC

* refs (1): 2FED3
OBJ_2FEF1:
        CON(5)  (*)+5                            * 2FEF1  primitive code object
        ASSEMBLE
        ST=1    4                                * 2FEF6
        GOTO    L_2FF05                          * 2FEF9

* refs (1): 2FEE7
OBJ_2FEFD:
        CON(5)  (*)+5                            * 2FEFD  primitive code object
        ST=0    4                                * 2FF02
L_2FF05:
        GOSBVL  POP#                             * 2FF05
        GOSBVL  SAVPTR                           * 2FF0C
        GOSUB   SUB_2FF8C                        * 2FF13
        GOC     L_2FF1F                          * 2FF17
        A=C     A                                * 2FF1A
        GONC    L_2FF85                          * 2FF1C
L_2FF1F:
        GOSUB   SUB_2FFBD                        * 2FF1F
        R1=C                                     * 2FF23
        B=C     A                                * 2FF26
        D=0     A                                * 2FF28
        ST=0    3                                * 2FF2A
L_2FF2D:
        B=B-1   A                                * 2FF2D
        GOC     L_2FF41                          * 2FF2F
        GOSUB   SUB_2FFD0                        * 2FF32
        C=D     A                                * 2FF36
        C+P+1                                    * 2FF38
        D=C     A                                * 2FF3B
        GOTO    L_2FF2D                          * 2FF3D
L_2FF41:
        P=      0                                * 2FF41
        C=D     A                                * 2FF43
        GOSBVL  MAKE$N                           * 2FF45
        A=DAT1  A                                * 2FF4C
        D1=A                                     * 2FF4F
        D1=D1+  10                               * 2FF52
        C=R0                                     * 2FF55
        D0=C                                     * 2FF58
        D0=D0+  10                               * 2FF5B
        C=R1                                     * 2FF5E
        B=C     A                                * 2FF61
        ST=0    3                                * 2FF63
L_2FF66:
        B=B-1   A                                * 2FF66
        GOC     L_2FF80                          * 2FF68
        GOSUB   SUB_2FFD0                        * 2FF6B
        DAT0=A  WP                               * 2FF6F
        CD0EX                                    * 2FF73
        C+P+1                                    * 2FF76
        D0=C                                     * 2FF79
        GOTO    L_2FF66                          * 2FF7C
L_2FF80:
        A=R0                                     * 2FF80
        P=      0                                * 2FF83
L_2FF85:
        GOVLNG  GPOverWrALp                      * 2FF85

* refs (2): 2FF13 30197
SUB_2FF8C:
        C=DAT1  A                                * 2FF8C
        D1=C                                     * 2FF8F
        D1=D1+  5                                * 2FF92
        A=A-1   A                                * 2FF95
        GONC    L_2FF9C                          * 2FF97
        RTNCC                                    * 2FF9A
L_2FF9C:
        ST=0    1                                * 2FF9C
        ST=0    2                                * 2FF9F
        A=A-1   A                                * 2FFA2
        RTNC                                     * 2FFA4
        ST=1    1                                * 2FFA7
        A=A-1   A                                * 2FFAA
        RTNC                                     * 2FFAC
        ST=1    2                                * 2FFAF
        RTNSC                                    * 2FFB2

* Pop $ -> C.A = length, D1 = body
* refs (9): 1689E 168ED 2E193 2E21B 30C15 30D61 ...
GetStrLenStk:
        C=DAT1  A                                * 2FFB4

* D1 = C, <REF>GetStrLen
* refs (1): 2E3C3
GetStrLenC:
        D1=C                                     * 2FFB7

* D1=$ -> C.A = length, D1 = body
* refs (4): 16084 304A0 323C9 32405
GetStrLen:
        D1=D1+  5                                * 2FFBA

* refs (2): 2FF1F 301A7
SUB_2FFBD:
        C=DAT1  A                                * 2FFBD
        C=C-CON A,5                              * 2FFC0
        CSRB.F  A                                * 2FFC6
        D1=D1+  5                                * 2FFCB
        RTN                                      * 2FFCE

* refs (2): 2FF32 2FF6B
SUB_2FFD0:
        P=      0                                * 2FFD0
        A=0     A                                * 2FFD2
        A=DAT1  B                                * 2FFD4
        D1=D1+  2                                * 2FFD7
        CD1EX                                    * 2FFDA
        RSTK=C                                   * 2FFDD
        ?ST=0   1                                * 2FFDF
        GOYES   L_30000                          * 2FFE2
        ?ABIT=1 7                                * 2FFE4
        GOYES   L_30035                          * 2FFE9
        LC(2)   #5C                              * 2FFEB
        ?C#A    B                                * 2FFEF
        GOYES   L_30000                          * 2FFF2
        P=      2                                * 2FFF4
        LC(2)   #5C                              * 2FFF6
L_2FFFA:
        P=      3                                * 2FFFA
        GOTO    L_3007E                          * 2FFFC
