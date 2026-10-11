* HP 48GX ROM revision R, #6C186-#6F35F: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: 'LB 'TE 'LE 'EL 'ManOp 'FOK 'unbound 'NG 'source 'ploc 'KO 'FontGauge
* Follows on from the previous file (at #6C186 in the original ROM).
        RPL

* refs (1): 6BB40
OBJ_6C186:
        ::                                       * 6C186
          OBJ_6BFF6                              * 6C18B

* refs (1): 6C3B6
OBJ_6C190:
          ::                                     * 6C190
            OBJ_6BBFE                            * 6C195
            ?SEMI                                * 6C19A
            RDROP                                * 6C19F
            OBJ_6BBD6                            * 6C1A4
            OBJ_6BC2D                            * 6C1A9
            OBJ_6CB25                            * 6C1AE
            OBJ_6C555                            * 6C1B3
            OBJ_6B894                            * 6C1B8
          ;                                      * 6C1BD

* refs (1): 6B5A1
OBJ_6C1C2:
          ::                                     * 6C1C2
            OBJ_67381                            * 6C1C7
            OBJ_6773D                            * 6C1CC
            OBJ_673D6                            * 6C1D1
            #+                                   * 6C1D6
            #1+NDROP                             * 6C1DB
            OBJ_673E6                            * 6C1E0
            OBJ_673D6                            * 6C1E5
            #-                                   * 6C1EA
          ;                                      * 6C1EF
          OBJ_6AFF0                              * 6C1F4
          OBJ_6CC10                              * 6C1F9
          OBJ_6CC32                              * 6C1FE
          SWAP                                   * 6C203
          OBJ_6C2C1                              * 6C208
          OBJ_6B200                              * 6C20D
          ::                                     * 6C212
            casedrop                             * 6C217
            OBJ_6C2C1                            * 6C21C

* refs (1): 6BEBB
OBJ_6C221:
            ::                                   * 6C221
              10GETLAM                           * 6C226
              DUP                                * 6C22B
              DUPLEN$                            * 6C230
              SUB$1#                             * 6C235
              BINT32                             * 6C23A
              OBJ_6E433                          * 6C23F
              OBJ_6B359                          * 6C244
            ;                                    * 6C249
          ;                                      * 6C24E
          10PUTLAM                               * 6C253
          OBJ_6AE42                              * 6C258
        ;                                        * 6C25D

* refs (1): 6BB54
OBJ_6C262:
        ::                                       * 6C262
          OBJ_6B934                              * 6C267
          OBJ_6C555                              * 6C26C
          OBJ_6B74F                              * 6C271

* refs (1): 6AD70
OBJ_6C276:
          ::                                     * 6C276
            OBJ_677EA                            * 6C27B
            DEPTH                                * 6C280
            #1-                                  * 6C285
            #<                                   * 6C28A
            ?SEMI                                * 6C28F
            RDROP                                * 6C294
            #       201                          * 6C299  513
            OBJ_6BC2D                            * 6C2A3
          ;                                      * 6C2A8
          OBJ_677EA                              * 6C2AD
          #1+PICK                                * 6C2B2
          OBJ_6E026                              * 6C2B7
          IT                                     * 6C2BC

* refs (5): 69DA7 6AB09 6BEA7 6C208 6C21C
OBJ_6C2C1:
          ::                                     * 6C2C1
            EDITDECOMP$                          * 6C2C6
            OBJ_6B31D                            * 6C2CB
          ;                                      * 6C2D0
          DUPTYPECSTR?                           * 6C2D5
          NOTcasedrop                            * 6C2DA
          OBJ_6AD84                              * 6C2DF
          OBJ_6AE6F                              * 6C2E4
          DROP                                   * 6C2E9

* refs (1): 6ADE3
OBJ_6C2EE:
          ::                                     * 6C2EE
            OBJ_113C2                            * 6C2F3
            #5-                                  * 6C2F8
            OBJ_113D2                            * 6C2FD

* refs (10): 69D84 69D93 69D9D 6A528 6ABFE 6AC21 ...
OBJ_6C302:
            ::                                   * 6C302
              MINUSONE                           * 6C307
              OBJ_67682                          * 6C30C
              DROP                               * 6C311
            ;                                    * 6C316
          ;                                      * 6C31B
          OBJ_6BF8D                              * 6C320
        ;                                        * 6C325

* refs (1): 6B9FC
OBJ_6C32A:
        ::                                       * 6C32A
          13GETLAM                               * 6C32F
          BINT22                                 * 6C334

* refs (11): 469B9 48530 4858A 4B71F 66697 DDF41 ...
OBJ_6C339:
          ::                                     * 6C339
            2DUP#>                               * 6C33E
            NOTcase2drop                         * 6C343
            BINT0                                * 6C348
            #-                                   * 6C34D
          ;                                      * 6C352
          LEFTCOL                                * 6C357
          OBJ_6B934                              * 6C35C

* refs (3): 6B93E 6BA15 6CB66
OBJ_6C361:
          ::                                     * 6C361
            12GETLAM                             * 6C366
            13GETLAM                             * 6C36B
            BINT26                               * 6C370
            GETLAM                               * 6C375
            XYGROBDISP                           * 6C37A
            NULLPAINT                            * 6C37F
            BINT26                               * 6C384
            PUTLAM                               * 6C389
          ;                                      * 6C38E
          OBJ_4CE83                              * 6C393
          TURNMENUON                             * 6C398
          WINDOWXY                               * 6C39D
          OBJ_6C954                              * 6C3A2
        ;                                        * 6C3A7

* refs (1): 6BB0E
OBJ_6C3AC:
        ::                                       * 6C3AC
          OBJ_6BFF6                              * 6C3B1
          OBJ_6C190                              * 6C3B6
          BINT23                                 * 6C3BB
          GETLAM                                 * 6C3C0
          IT                                     * 6C3C5
          SetAppMode                             * 6C3CA
          OBJ_6B939                              * 6C3CF
          OBJ_6B79A                              * 6C3D4

* refs (1): 6B54C
OBJ_6C3D9:
          ::                                     * 6C3D9
            OBJ_6731D                            * 6C3DE
            OBJ_0C4E3                            * 6C3E3
            ZERO_DO                              * 6C3E8
            #1+                                  * 6C3ED
            DUPPICK                              * 6C3F2
            OBJ_6B2AA                            * 6C3F7
            xPREDIV                              * 6C3FC
            IT                                   * 6C401
            ::                                   * 6C406
              dup;drop(s)                        * 6C40B
              '                                  * 6C410
              x/                                 * 6C415
              OVER                               * 6C41A
              UNROLL                             * 6C41F
            ;                                    * 6C424
            LOOP                                 * 6C429
            DROP                                 * 6C42E
            OBJ_461D7                            * 6C433
            OBJ_67D1B                            * 6C438
            OBJ_69B49                            * 6C43D
            ClrDAsOK                             * 6C442
            DispMenu                             * 6C447
            OBJ_2840F                            * 6C44C
          ;                                      * 6C451
        ;                                        * 6C456

* refs (2): 50519 50528
OBJ_6C45B:
        ::                                       * 6C45B
          POLSaveUI                              * 6C460
          ERRSET                                 * 6C465
          ::                                     * 6C46A
            ERRSET                               * 6C46F

* refs (1): 6C51E
OBJ_6C474:
            ::                                   * 6C474
              SetDA3NoCh                         * 6C479
              FALSE                              * 6C47E

* refs (1): 6B524
OBJ_6C483:
              ::                                 * 6C483
                TOADISP                          * 6C488
                CLEARVDISP                       * 6C48D
                OBJ_6CC21                        * 6C492
                NULL$SWAP                        * 6C497
                OBJ_6C550                        * 6C49C

* refs (3): 69D24 6AD75 6B165
OBJ_6C4A1:
                ::                               * 6C4A1
                  OBJ_677EA                      * 6C4A6
                  #1+PICK                        * 6C4AB
                ;                                * 6C4B0
              ;                                  * 6C4B5

* refs (1): 6B533
OBJ_6C4BA:
              ::                                 * 6C4BA
                OBJ_68972                        * 6C4BF
                OBJ_666D3                        * 6C4C4
                OBJ_6AE6F                        * 6C4C9
                DROP                             * 6C4CE
              ;                                  * 6C4D3
            ;                                    * 6C4D8
            ERRTRAP                              * 6C4DD
            OBJ_6C528                            * 6C4E2
            HARDBUFF                             * 6C4E7
            TOTEMPOB                             * 6C4EC
            OBJ_6A95B                            * 6C4F1
            OBJ_6C8CD                            * 6C4F6
          ;                                      * 6C4FB
          ERRTRAP                                * 6C500
          POLResUI&Err                           * 6C505
          POLRestoreUI                           * 6C50A
        ;                                        * 6C50F

* refs (1): 659ED
OBJ_6C514:
        ::                                       * 6C514
          ERRSET                                 * 6C519
          OBJ_6C474                              * 6C51E
          ERRTRAP                                * 6C523

* refs (1): 6C4E2
OBJ_6C528:
          ::                                     * 6C528
            OBJ_6CC32                            * 6C52D
            OBJ_6C8CD                            * 6C532
            ERRJMP                               * 6C537
          ;                                      * 6C53C
          OBJ_6CC32                              * 6C541
          OBJ_6C8D7                              * 6C546
        ;                                        * 6C54B

* refs (4): 69D0B 6AE65 6B4B6 6C49C
OBJ_6C550:
        ::                                       * 6C550

* refs (7): 698C4 6AADC 6BE2A 6C159 6C1B3 6C26C ...
OBJ_6C555:
          ::                                     * 6C555
            NULL{}                               * 6C55A
            OBJ_681D8                            * 6C55F
          ;                                      * 6C564
          BINT15                                 * 6C569
          OBJ_6748B                              * 6C56E
          BINT30                                 * 6C573
          OBJ_67458                              * 6C578
          BINT6                                  * 6C57D
          DUP                                    * 6C582
          OBJ_6749B                              * 6C587
          OBJ_674AB                              * 6C58C
          BINT0                                  * 6C591
          OBJ_6746B                              * 6C596
          BINT15                                 * 6C59B
          OBJ_6747B                              * 6C5A0
          BINT2                                  * 6C5A5
          OBJ_67448                              * 6C5AA
          NULL$                                  * 6C5AF
          ZEROFALSE                              * 6C5B4
          FalseFalse                             * 6C5B9
          6ROLL                                  * 6C5BE
          FALSE                                  * 6C5C3
          ZEROZERO                               * 6C5C8
          NULLPAINT                              * 6C5CD
          'NOP                                   * 6C5D2
          TRUE                                   * 6C5D7
          AppMode?                               * 6C5DC
          ClrAppMode                             * 6C5E1
          NULLPAINT                              * 6C5E6
          'NOP                                   * 6C5EB
          ZEROFALSE                              * 6C5F0
          BINT0                                  * 6C5F5
          TrueFalse                              * 6C5FA
          BINT22                                 * 6C5FF
          BINT0                                  * 6C604
          2DUP                                   * 6C609
          OBJ_25F4E                              * 6C60E
          BINT26                                 * 6C613
          ROLL                                   * 6C618
          BINT1                                  * 6C61D
          NULL$                                  * 6C622
          #ZERO#SEVEN                            * 6C627
          NDUPN                                  * 6C62C
          DROP                                   * 6C631
          {                                      * 6C636
            NULLLAM                              * 6C63B

'L:
            LAM     'L                           * 6C640

'raw:
            LAM     'raw                         * 6C64B

'LA:
            LAM     'LA                          * 6C65A
            NULLLAM                              * 6C667

* refs (1): 6A91A
'KO:
            LAM     'KO                          * 6C66C

* refs (8): 4DA62 4EC4E 4EC80 69BA6 6AC44 6ACE9 ...
'EL:
            LAM     'EL                          * 6C679
            NULLLAM                              * 6C686
            NULLLAM                              * 6C68B

'S:
            LAM     'S                           * 6C690

* refs (4): 69C98 69E56 69E75 69E9D
'ManOp:
            LAM     'ManOp                       * 6C69B

'nohalt:
            LAM     'nohalt                      * 6C6AE
            NULLLAM                              * 6C6C3

* refs (2): 6F5B8 6FD70
'NG:
            LAM     'NG                          * 6C6C8

'EXITFCN:
            LAM     'EXITFCN                     * 6C6D5

* refs (1): 3F25B
'FontGauge:
            LAM     'FontGauge                   * 6C6EC

* refs (8): 69B8D 6B0CA 6FC26 6FC4A 6FC59 6FC7C ...
'LE:
            LAM     'LE                          * 6C707

* refs (9): 25C28 69B63 69EC5 69EE3 6A163 6AC6C ...
'LB:
            LAM     'LB                          * 6C714

* refs (8): 69B78 6B0BA 6FC9B 6FCD3 6FCE7 6FD0A ...
'TE:
            LAM     'TE                          * 6C721

* refs (3): 69B97 69BD8 69BE7
'FOK:
            LAM     'FOK                         * 6C72E

'pr:
            LAM     'pr                          * 6C73D

'pc:
            LAM     'pc                          * 6C74A

'cy:
            LAM     'cy                          * 6C757

'cx:
            LAM     'cx                          * 6C764
            NULLLAM                              * 6C771

* refs (1): 6C931
'source:
            LAM     'source                      * 6C776
            NULLLAM                              * 6C78B
            NULLLAM                              * 6C790
            NULLLAM                              * 6C795
            NULLLAM                              * 6C79A
            NULLLAM                              * 6C79F
            NULLLAM                              * 6C7A4

* refs (1): 69C7E
'ploc:
            LAM     'ploc                        * 6C7A9
            NULLLAM                              * 6C7BA

* refs (2): 6B073 6B096
'unbound:
            LAM     'unbound                     * 6C7BF
          }                                      * 6C7D6
          BIND                                   * 6C7DB
          ClrDA1IsStat                           * 6C7E0

* refs (1): 6780B
OBJ_6C7E5:
          CHR     "?"                            * 6C7E5
          BINT45                                 * 6C7EC
          ZERO_DO                                * 6C7F1

* refs (1): 67625
OBJ_6C7F6:
          {                                      * 6C7F6
          }                                      * 6C7FB

{}_6C800:
          LOOP                                   * 6C800
          {                                      * 6C805
          }                                      * 6C80A

{}_6C80F:
          DEPTH                                  * 6C80F
          OBJ_68183                              * 6C814
          OBJ_67648                              * 6C819
          BINT1                                  * 6C81E
          OBJ_285C6                              * 6C823
          DROP                                   * 6C828
          OBJ_67532                              * 6C82D
          NULLHXS                                * 6C832
          BINT30                                 * 6C837
          OBJ_6869D                              * 6C83C
          EXPAND                                 * 6C841
          OBJ_681B1                              * 6C846
          #TWO#TWO                               * 6C84B
          OBJ_6DD6E                              * 6C850
          OBJ_6DD6E                              * 6C855
          NULLPAINT                              * 6C85A

* refs (4): 660B6 6D2AD 6D706 6DD3C
OBJ_6C85F:
          ::                                     * 6C85F
            OBJ_6E0A1                            * 6C864
            OBJ_6E057                            * 6C869
          ;                                      * 6C86E

* refs (16): 44E08 65A92 65B28 65FD0 660BB 66421 ...
OBJ_6C873:
          ::                                     * 6C873
            2DUP                                 * 6C878
            2/(s);swap;2/(s)                     * 6C87D
            SWAP                                 * 6C882
          ;                                      * 6C887
          BINT0                                  * 6C88C
          BINT22                                 * 6C891
          BINT1                                  * 6C896
          OBJ_682DE                              * 6C89B
          OBJ_6D909                              * 6C8A0
          BINT1                                  * 6C8A5
          OBJ_6DAE9                              * 6C8AA
          BINT0                                  * 6C8AF
          OBJ_67426                              * 6C8B4
          OBJ_69BBA                              * 6C8B9
        ;                                        * 6C8BE

* refs (1): 6B4DE
OBJ_6C8C3:
        ::                                       * 6C8C3
          RDROP                                  * 6C8C8

* refs (4): 6B579 6B5B0 6C4F6 6C532
OBJ_6C8CD:
          ::                                     * 6C8CD
            OBJ_6CC32                            * 6C8D2

* refs (1): 6C546
OBJ_6C8D7:
            ::                                   * 6C8D7
              OBJ_677DE                          * 6C8DC
              ClrDAsOK                           * 6C8E1
              BINT23                             * 6C8E6
              GETLAM                             * 6C8EB
              IT                                 * 6C8F0
              SetAppMode                         * 6C8F5
              InitEd&Modes                       * 6C8FA
              OBJ_6C555                          * 6C8FF
              NULLHXS                            * 6C904
              OBJ_681B1                          * 6C909
            ;                                    * 6C90E
            RECLAIMDISP                          * 6C913
          ;                                      * 6C918
          ERROR@                                 * 6C91D
          #0=?SEMI                               * 6C922
L_6C927:
          OBJ_18295                              * 6C927
          '                                      * 6C92C
          'source                                * 6C931
          DRPExitAtLOOP                          * 6C936
          ?SKIP                                  * 6C93B
          ERRSET                                 * 6C940
          CK0NOLASTWD                            * 6C945
          ERRJMP                                 * 6C94A
        ;                                        * 6C94F

* refs (5): 6B6A5 6BA1F 6BFDD 6C3A2 6CC01
OBJ_6C954:
        ::                                       * 6C954
          BINT30                                 * 6C959
          GETLAM                                 * 6C95E
          NOT?SEMI                               * 6C963
          12GETLAM                               * 6C968
          13GETLAM                               * 6C96D
          2DUP                                   * 6C972
          ::                                     * 6C977
            OBJ_673BB                            * 6C97C
            DUP#0=csedrp                         * 6C981
            BigCursor                            * 6C986
            BINT1                                * 6C98B
            #=case                               * 6C990
            MediumCursor                         * 6C995
            SmallCursor                          * 6C99A
          ;                                      * 6C99F
          XYGROBDISP                             * 6C9A4
          OBJ_6F42D                              * 6C9A9
          BINT26                                 * 6C9AE
          PUTLAM                                 * 6C9B3
          ::                                     * 6C9B8
            WINDOWCORNER                         * 6C9BD
            3PICK                                * 6C9C2
            ROT                                  * 6C9C7
            #<                                   * 6C9CC
            IT                                   * 6C9D1
            ::                                   * 6C9D6
              2DUP                               * 6C9DB
              WINDOWXY                           * 6C9E0
            ;                                    * 6C9E5
            3PICKOVER                            * 6C9EA
            #<                                   * 6C9EF
            IT                                   * 6C9F4
            ::                                   * 6C9F9
              TOPROW                             * 6C9FE
              4PICK                              * 6CA03
              WINDOWXY                           * 6CA08
            ;                                    * 6CA0D
            OBJ_6E057                            * 6CA12
            OBJ_6E0A1                            * 6CA17
            5ROLL                                * 6CA1C
            #+                                   * 6CA21
            SWAP4ROLL                            * 6CA26
            #+                                   * 6CA2B
            BOTROW                               * 6CA30
            2DUP#>                               * 6CA35
            ITE                                  * 6CA3A
            ::                                   * 6CA3F
              #-                                 * 6CA44
              TOPROW                             * 6CA49
              #1-+                               * 6CA4E
              LEFTCOL                            * 6CA53
              WINDOWXY                           * 6CA58
            ;                                    * 6CA5D
            2DROP                                * 6CA62
            BINT130                              * 6CA67
            ROT#+                                * 6CA6C
            2DUP#>                               * 6CA71
            NOTcase2DROP                         * 6CA76
            #-                                   * 6CA7B
            LEFTCOL                              * 6CA80
            #1-+                                 * 6CA85
            TOPROW                               * 6CA8A
            SWAP                                 * 6CA8F
            WINDOWXY                             * 6CA94
          ;                                      * 6CA99
        ;                                        * 6CA9E

* refs (1): 3F26A
OBJ_6CAA3:
        ::                                       * 6CAA3

* refs (3): 6B68C 6C005 6E5D7
OBJ_6CAA8:
          ::                                     * 6CAA8
            9GETLAM                              * 6CAAD
            10GETLAM                             * 6CAB2
            LEN$                                 * 6CAB7
            #>                                   * 6CABC
          ;                                      * 6CAC1
          casedrop                               * 6CAC6
          DoBadKey                               * 6CACB

* refs (2): 6B76D 6CB6B
OBJ_6CAD0:
          ::                                     * 6CAD0
            10GETLAM                             * 6CAD5
            9GETLAM                              * 6CADA
            LAST$                                * 6CADF
          ;                                      * 6CAE4
          DUPLEN$                                * 6CAE9
          SUB$1#                                 * 6CAEE
          DUPUNROT                               * 6CAF3
          OBJ_3F2D3                              * 6CAF8
          DUPUNROT                               * 6CAFD
          EQUAL                                  * 6CB02
          casedrop                               * 6CB07
          DoBadKey                               * 6CB0C
          #>CHR                                  * 6CB11
          CHR>$                                  * 6CB16
          OBJ_6E5E6                              * 6CB1B
          OBJ_6BF8D                              * 6CB20

* refs (5): 6B98E 6BF7E 6C15E 6C1AE 6E604
OBJ_6CB25:
          ::                                     * 6CB25
            FALSE                                * 6CB2A
            17PUTLAM                             * 6CB2F
          ;                                      * 6CB34

* refs (3): 6B6BE 6B993 6E613
OBJ_6CB39:
          ::                                     * 6CB39

* refs (4): 6B69B 6B9CA 6BFB5 6E609
OBJ_6CB3E:
            ::                                   * 6CB3E
              KEYINBUFFER?                       * 6CB43
              NOTcaseFALSE                       * 6CB48
              17GETLAM                           * 6CB4D
            ;                                    * 6CB52
            ?SEMI                                * 6CB57
            TRUE                                 * 6CB5C
            17PUTLAM                             * 6CB61
            OBJ_6C361                            * 6CB66
            OBJ_6CAD0                            * 6CB6B

* refs (7): 65CF1 66269 69A1D 6D62F 6D9E5 6E483 ...
OBJ_6CB70:
            ::                                   * 6CB70
              tok*                               * 6CB75
              EQUALcasedrop                      * 6CB7A
              ::                                 * 6CB7F
                OBJ_673BB                        * 6CB84
                #>1                              * 6CB89
                case                             * 6CB8E
                OBJ_4B95E                        * 6CB93
                OBJ_66F6D                        * 6CB98
              ;                                  * 6CB9D
              OBJ_673BB                          * 6CBA2
              DUP#0=csedrp                       * 6CBA7
              $>BIGGROB                          * 6CBAC
              #1=case                            * 6CBB1
              $>GROB                             * 6CBB6
              $>grob                             * 6CBBB
            ;                                    * 6CBC0
            DUPGROBDIM                           * 6CBC5
            DUPROT                               * 6CBCA
            OBJ_496F0                            * 6CBCF
            BINT28                               * 6CBD4
            PUTLAM                               * 6CBD9
            14GETLAM                             * 6CBDE
            #+                                   * 6CBE3
            12PUTLAM                             * 6CBE8
            14GETLAM                             * 6CBED
            15GETLAM                             * 6CBF2
            ROT                                  * 6CBF7
            XYGROBDISP                           * 6CBFC
            OBJ_6C954                            * 6CC01
          ;                                      * 6CC06
        ;                                        * 6CC0B

* refs (12): 1AFFA 1B0EB 1B3CE 28EE3 29028 6B03B ...
OBJ_6CC10:
        CON(5)  (*)+5                            * 6CC10  primitive code object
        ASSEMBLE
        LC(3)   #10B                             * 6CC15
        GOVLNG  L_539E6                          * 6CC1A

* refs (6): 6B059 6B26E 6B287 6B4C5 6BA7E 6C492
OBJ_6CC21:
        CON(5)  (*)+5                            * 6CC21  primitive code object
        LC(3)   #10B                             * 6CC26
        GOVLNG  SetISysFlag                      * 6CC2B

* refs (8): 38615 6B040 6B07D 6BA65 6C1FE 6C52D ...
OBJ_6CC32:
        CON(5)  (*)+5                            * 6CC32  primitive code object
        LC(3)   #10B                             * 6CC37
        GOVLNG  L_539F1                          * 6CC3C
        RPL

* refs (1): 6BCBD
OBJ_6CC43:
        ::                                       * 6CC43
          TakeOver                               * 6CC48
          WINDOWCORNER                           * 6CC4D
          ABUFF                                  * 6CC52
          ZEROZERO                               * 6CC57
          BINT131                                * 6CC5C
          #       38                             * 6CC61  56
          SUBGROB                                * 6CC6B
          3NULLLAM{}                             * 6CC70
          BIND                                   * 6CC75
          REDISPHBUFF                            * 6CC7A
          ROMPTR  0B2 002                        * 6CC7F
          3GETLAM                                * 6CC8A
          2GETLAM                                * 6CC8F
          1GETLAM                                * 6CC94
          ABND                                   * 6CC99
          ZEROZERO                               * 6CC9E
          ROT                                    * 6CCA3
          XYGROBDISP                             * 6CCA8
          WINDOWXY                               * 6CCAD
          DispMenu.1                             * 6CCB2
        ;                                        * 6CCB7
        NIBHEX  0                                * 6CCBC

* refs (1): 1BB25
OBJ_6CCBD:
        ::                                       * 6CCBD
          SKIP                                   * 6CCC2
          OBJ_6DFFD                              * 6CCC7

* refs (8): 1AC70 1ADCC 1AED9 1FB18 68E13 6CDEE ...
OBJ_6CCCC:
          ::                                     * 6CCCC
            SKIP                                 * 6CCD1
            OBJ_6DFFD                            * 6CCD6
            DROP                                 * 6CCDB
            ZEROZERO                             * 6CCE0
            OBJ_67416                            * 6CCE5
            OBJ_67356                            * 6CCEA
            DUP#1-                               * 6CCEF
            BINT2                                * 6CCF4
            ZEROZERO                             * 6CCF9
            22Lget                               * 6CCFE
            OBJ_6CF3D                            * 6CD03
            OBJ_6DA4E                            * 6CD08
            OBJ_67356                            * 6CD0D
            OBJ_6CFB5                            * 6CD12
            BINT19                               * 6CD17
            PICK                                 * 6CD1C
            #+                                   * 6CD21
            OBJ_6D573                            * 6CD26
            ZEROZERO                             * 6CD2B
            OBJ_6733B                            * 6CD30
            ZEROOVER                             * 6CD35
            #1+                                  * 6CD3A
            OBJ_6D163                            * 6CD3F
            OBJ_6D4CE                            * 6CD44
            OBJ_67364                            * 6CD49
            DUP#1+                               * 6CD4E
          ;                                      * 6CD53
          OBJ_6799C                              * 6CD58
          OBJ_6D523                              * 6CD5D
          3PICKSWAP                              * 6CD62
          OBJ_67BFC                              * 6CD67
          OVER                                   * 6CD6C
          OBJ_67A98                              * 6CD71
          OBJ_6E0A1                              * 6CD76
          #-                                     * 6CD7B
          OBJ_67BAE                              * 6CD80
          OVERDUP                                * 6CD85
          OBJ_67AD5                              * 6CD8A
          OBJ_6E0A1                              * 6CD8F
          #2/                                    * 6CD94
          #-                                     * 6CD99
          OBJ_67C09                              * 6CD9E
          #1-                                    * 6CDA3

* refs (1): 6D113
OBJ_6CDA8:
          ::                                     * 6CDA8
            OBJ_673A2                            * 6CDAD
            #1+                                  * 6CDB2
            OBJ_67458                            * 6CDB7
            OBJ_67364                            * 6CDBC
            OBJ_6746B                            * 6CDC1
            OBJ_674D6                            * 6CDC6
            ROLLDROP                             * 6CDCB
            OBJ_6C302                            * 6CDD0
          ;                                      * 6CDD5
        ;                                        * 6CDDA

* refs (1): 1AFDC
OBJ_6CDDF:
        ::                                       * 6CDDF
          SKIP                                   * 6CDE4
          OBJ_6DFFD                              * 6CDE9
          OBJ_6CCCC                              * 6CDEE
          OVER                                   * 6CDF3
          DUPTWO                                 * 6CDF8
          OBJ_67C85                              * 6CDFD
          BINT3                                  * 6CE02
          OBJ_67416                              * 6CE07
          OBJ_67A9D                              * 6CE0C
          #2+                                    * 6CE11
          BINT2                                  * 6CE16
          OVER                                   * 6CE1B
          OBJ_66FF1                              * 6CE20
          3UNROLL                                * 6CE25
          OBJ_6DA4E                              * 6CE2A
          OBJ_67371                              * 6CE2F
          OBJ_6822C                              * 6CE34
          BINT1                                  * 6CE39
          OBJ_67371                              * 6CE3E
          OBJ_685B2                              * 6CE43
          OBJ_67416                              * 6CE48
          OBJ_67ABC                              * 6CE4D
          OVER                                   * 6CE52
          #2/                                    * 6CE57
          #1+                                    * 6CE5C
          OVER                                   * 6CE61
          #1+                                    * 6CE66
          5PICK                                  * 6CE6B
          3UNROLL                                * 6CE70
          OBJ_67C23                              * 6CE75
          OBJ_6D779                              * 6CE7A
          #+                                     * 6CE7F
          SWAP#1+SWAP                            * 6CE84
          SWAP#1+SWAP                            * 6CE89

* refs (4): 44E26 669CE 6DB5C 6DBC0
OBJ_6CE8E:
          ::                                     * 6CE8E
            3PICKSWAP                            * 6CE93
            OBJ_67BBB                            * 6CE98
            OBJ_67BAE                            * 6CE9D
          ;                                      * 6CEA2
          OBJ_6CC10                              * 6CEA7
          NOT?SEMI                               * 6CEAC
          OBJ_67381                              * 6CEB1
          BINT4                                  * 6CEB6
          OBJ_67C3C                              * 6CEBB
        ;                                        * 6CEC0

* refs (1): 1FB76
OBJ_6CEC5:
        ::                                       * 6CEC5
          SKIP                                   * 6CECA
          OBJ_6E23F                              * 6CECF
          OBJ_67348                              * 6CED4
          DUP#1+                                 * 6CED9
          OBJ_6CFB5                              * 6CEDE
          3DROP                                  * 6CEE3
          OBJ_6D7DD                              * 6CEE8
          OBJ_6E057                              * 6CEED
          OBJ_6DA26                              * 6CEF2
          OBJ_6C873                              * 6CEF7

* refs (1): 6DC15
OBJ_6CEFC:
          ::                                     * 6CEFC
            OBJ_6D990                            * 6CF01
L_6CF06:
            BINT15                               * 6CF06
            ROLL                                 * 6CF0B
            OBJ_68283                            * 6CF10
          ;                                      * 6CF15
          OBJ_67356                              * 6CF1A
          OBJ_67348                              * 6CF1F
          OBJ_67416                              * 6CF24
          ONEONE                                 * 6CF29
          BINT3                                  * 6CF2E
          OBJ_6D7DD                              * 6CF33
          OBJ_66FF1                              * 6CF38

* refs (4): 44E03 6CD03 6D023 6D9EA
OBJ_6CF3D:
          ::                                     * 6CF3D
            DUPGROBDIM                           * 6CF42
            SWAP                                 * 6CF47
          ;                                      * 6CF4C
          OBJ_6DA4E                              * 6CF51
          OBJ_682D2                              * 6CF56
          OBJ_67381                              * 6CF5B
          BINT0                                  * 6CF60
          OBJ_6F199                              * 6CF65
          OBJ_6DAE9                              * 6CF6A
          OBJ_6DD6E                              * 6CF6F
          OBJ_67364                              * 6CF74
          OBJ_67416                              * 6CF79
          OBJ_6D163                              * 6CF7E
          OBJ_682DE                              * 6CF83
          OBJ_6D5EB                              * 6CF88
        ;                                        * 6CF8D

* refs (1): 6D10E
OBJ_6CF92:
        ::                                       * 6CF92
          SKIP                                   * 6CF97
          OBJ_6E109                              * 6CF9C

* refs (2): 65A60 6D66B
OBJ_6CFA1:
          ::                                     * 6CFA1
            OBJ_6733B                            * 6CFA6
            DUP#2+                               * 6CFAB
            SWAP                                 * 6CFB0

* refs (5): 65F12 663FE 6CD12 6CEDE 6D3FC
OBJ_6CFB5:
            ::                                   * 6CFB5
              OBJ_67416                          * 6CFBA
              OBJ_6DDD3                          * 6CFBF
            ;                                    * 6CFC4
          ;                                      * 6CFC9
          3DROP                                  * 6CFCE
          22Lget                                 * 6CFD3
          GROBDIM                                * 6CFD8
          OBJ_6E0A1                              * 6CFDD
          #12+                                   * 6CFE2
          #+                                     * 6CFE7
          SWAP                                   * 6CFEC
          #2+                                    * 6CFF1
          OBJ_6C873                              * 6CFF6
          OBJ_6D8DC                              * 6CFFB
          OBJ_6DD6E                              * 6D000
          OBJ_67348                              * 6D005
          OBJ_67416                              * 6D00A
          OBJ_6D9C2                              * 6D00F

* refs (3): 6D5C8 6D63E 6DED2
OBJ_6D014:
          ::                                     * 6D014
            BINT0                                * 6D019
            22Lget                               * 6D01E
            OBJ_6CF3D                            * 6D023
            OBJ_6DA4E                            * 6D028
          ;                                      * 6D02D
          ZEROZERO                               * 6D032
          OBJ_6733B                              * 6D037
          DUP                                    * 6D03C
          #3+                                    * 6D041
          OBJ_6F199                              * 6D046

* refs (2): 6D44C 6D6C5
OBJ_6D04B:
          ::                                     * 6D04B
            #ZERO#ONE                            * 6D050
            OBJ_6D779                            * 6D055
            OBJ_44C4B                            * 6D05A
L_6D05F:
            BINT6                                * 6D05F
            OBJ_6D779                            * 6D064
            OBJ_6DA4E                            * 6D069
          ;                                      * 6D06E
          OBJ_6D451                              * 6D073
          #4+                                    * 6D078
          BINT0                                  * 6D07D
          OBJ_67416                              * 6D082

* refs (2): 6D6DE 6D945
OBJ_6D087:
          ::                                     * 6D087
            OBJ_6DD6E                            * 6D08C
            OBJ_6D779                            * 6D091
            BINT6                                * 6D096
            MAKEGROB                             * 6D09B
            GOTO                                 * 6D0A0
            L_6D05F                              * 6D0A5
          ;                                      * 6D0AA
          OBJ_6D4CE                              * 6D0AF
          OBJ_67364                              * 6D0B4
          DUP#1+                                 * 6D0B9
          OBJ_67416                              * 6D0BE
          OBJ_6D163                              * 6D0C3
          OBJ_682D2                              * 6D0C8
          OBJ_6D5EB                              * 6D0CD
        ;                                        * 6D0D2

* refs (2): 1F6C2 692E7
OBJ_6D0D7:
        ::                                       * 6D0D7
          SKIP                                   * 6D0DC
          OBJ_6E352                              * 6D0E1
          OBJ_6D0FF                              * 6D0E6
        ;                                        * 6D0EB

        ::                                       * 6D0F0
          SKIP                                   * 6D0F5
          OBJ_6E195                              * 6D0FA

* refs (1): 6D0E6
OBJ_6D0FF:
          ::                                     * 6D0FF
            SKIP                                 * 6D104
            OBJ_6E177                            * 6D109
            OBJ_6CF92                            * 6D10E
            OBJ_6CDA8                            * 6D113
            #1+                                  * 6D118
            DUPDUP                               * 6D11D
            #3-                                  * 6D122
            DUP#1+                               * 6D127
            5PICK                                * 6D12C
            MINUSONE                             * 6D131

* refs (8): 65C18 65C3B 65C54 65D41 65DF5 6D16D ...
OBJ_6D136:
            ::                                   * 6D136
              BINT0                              * 6D13B
              OBJ_6DD2D                          * 6D140
            ;                                    * 6D145
            DROPONE                              * 6D14A
            OBJ_682DE                            * 6D14F
            ZEROZERO                             * 6D154
            ZEROZERO                             * 6D159
            OBJ_67381                            * 6D15E

* refs (6): 66520 6CD3F 6CF7E 6D0C3 6D71A 6D85F
OBJ_6D163:
            ::                                   * 6D163
              BINT3                              * 6D168
              OBJ_6D136                          * 6D16D
            ;                                    * 6D172
            OBJ_682DE                            * 6D177
            OBJ_67381                            * 6D17C
          ;                                      * 6D181
        ;                                        * 6D186

* refs (1): 1B0C8
OBJ_6D18B:
        ::                                       * 6D18B
          SKIP                                   * 6D190
          OBJ_4B882                              * 6D195
          OBJ_69188                              * 6D19A
          OBJ_26BED                              * 6D19F
          OBJ_6BFBA                              * 6D1A4
          ::                                     * 6D1A9
            ROTROT2DROP                          * 6D1AE
            #1=                                  * 6D1B3
            ?SEMI                                * 6D1B8
            OBJ_67416                            * 6D1BD
            OBJ_679C5                            * 6D1C2

* refs (3): 6F1D0 6F2F7 6F37E
OBJ_6D1C7:
            ::                                   * 6D1C7
              OBJ_68452                          * 6D1CC
              OBJ_6B2AA                          * 6D1D1
              OBJ_65A38                          * 6D1D6
            ;                                    * 6D1DB
            ?SEMI                                * 6D1E0
            OBJ_6D37F                            * 6D1E5
          ;                                      * 6D1EA
          OBJ_6CCCC                              * 6D1EF
          DROP                                   * 6D1F4
          DUP#1-                                 * 6D1F9
          OBJ_44E3F                              * 6D1FE
          OBJ_44DFE                              * 6D203
          OBJ_67381                              * 6D208
          DUPTWO                                 * 6D20D
          OBJ_67C85                              * 6D212
          DUP                                    * 6D217
          MINUSONE                               * 6D21C
          OBJ_67C3C                              * 6D221
          DUP                                    * 6D226
          DUP#2+                                 * 6D22B
          OBJ_67BEF                              * 6D230
          DUP                                    * 6D235
          DUP#1+                                 * 6D23A
          OBJ_67BFC                              * 6D23F
          OBJ_6DFDE                              * 6D244
          OBJ_67416                              * 6D249
          OBJ_67AAA                              * 6D24E
          OBJ_6E057                              * 6D253
          #2-                                    * 6D258
          #+                                     * 6D25D
          3PICKSWAP                              * 6D262
          OBJ_67BBB                              * 6D267
          OBJ_67AE2                              * 6D26C
          OBJ_6E057                              * 6D271
          #2-                                    * 6D276
          #+                                     * 6D27B
          OBJ_67C16                              * 6D280
          OBJ_6E00B                              * 6D285
          DUP                                    * 6D28A
          #3+                                    * 6D28F
          BINT0                                  * 6D294
          3pick;1+(s)                            * 6D299
          BINT0                                  * 6D29E
          BINT2                                  * 6D2A3
          BINT0                                  * 6D2A8
          OBJ_6C85F                              * 6D2AD
          #2-                                    * 6D2B2
          2DUPSWAP                               * 6D2B7
          MAKEGROB                               * 6D2BC
          3UNROLL                                * 6D2C1
          OVER                                   * 6D2C6
          #2/                                    * 6D2CB
          OBJ_67416                              * 6D2D0
          OBJ_67AE2                              * 6D2D5
          OBJ_6DD6E                              * 6D2DA
          OBJ_682D2                              * 6D2DF
          OBJ_6DFDE                              * 6D2E4
          ZEROOVER                               * 6D2E9
          #2+                                    * 6D2EE
          3PICK                                  * 6D2F3
          #1+                                    * 6D2F8
          BINT4                                  * 6D2FD
          OBJ_6DAE9                              * 6D302
          DUP                                    * 6D307
          DUP#1+                                 * 6D30C
          OBJ_67AAF                              * 6D311
          OBJ_67BBB                              * 6D316
          DUP                                    * 6D31B
          DUP#1+                                 * 6D320
          OBJ_44D9A                              * 6D325
          OBJ_6E00B                              * 6D32A
          DUPDUP                                 * 6D32F
          OBJ_67A9D                              * 6D334
          OBJ_6E0A1                              * 6D339
          #-DUP                                  * 6D33E
          3PICKSWAP                              * 6D343
          OBJ_67BAE                              * 6D348
          #2/                                    * 6D34D
          OBJ_67C09                              * 6D352
          OBJ_6DFDE                              * 6D357
          OBJ_67381                              * 6D35C
          OBJ_6CC10                              * 6D361
          ?SEMI                                  * 6D366
          DUP                                    * 6D36B
          BINT3                                  * 6D370
          OBJ_67C3C                              * 6D375
        ;                                        * 6D37A

* refs (2): 6AAD7 6D1E5
OBJ_6D37F:
        ::                                       * 6D37F
          OBJ_67416                              * 6D384
          DUP                                    * 6D389
          OBJ_67356                              * 6D38E
          DUP#1+                                 * 6D393
          OBJ_67348                              * 6D398

* refs (11): 65B91 65F9E 66043 660B1 66449 664C6 ...
OBJ_6D39D:
          ::                                     * 6D39D
            MINUSONE                             * 6D3A2
            ZEROZERO                             * 6D3A7
            NULLPAINT                            * 6D3AC
          ;                                      * 6D3B1
          ZEROZERO                               * 6D3B6
          BINT10                                 * 6D3BB
          PICK                                   * 6D3C0
          DUP                                    * 6D3C5
          OBJ_67AD5                              * 6D3CA
          SWAP                                   * 6D3CF
          OBJ_67AE2                              * 6D3D4
          SWAP                                   * 6D3D9
          #6+                                    * 6D3DE
          SWAP                                   * 6D3E3
          OBJ_6D909                              * 6D3E8
          OBJ_682DE                              * 6D3ED
          OBJ_67356                              * 6D3F2
          DUP#1-                                 * 6D3F7
          OBJ_6CFB5                              * 6D3FC
          BINT11                                 * 6D401
          ROLLDROP                               * 6D406
          OBJ_6E0A1                              * 6D40B
          #2*                                    * 6D410
          #+                                     * 6D415
          ROT                                    * 6D41A
          #2+                                    * 6D41F
          OVER                                   * 6D424
          #2/                                    * 6D429
          4ROLL                                  * 6D42E
          OBJ_6D909                              * 6D433
          OBJ_6DD6E                              * 6D438
          OBJ_67381                              * 6D43D
          DUP#1+                                 * 6D442
          BINT1                                  * 6D447
          OBJ_6D04B                              * 6D44C

* refs (5): 65BFF 660CA 6D073 6D715 6D931
OBJ_6D451:
          ::                                     * 6D451
            ZEROZERO                             * 6D456
            OBJ_67381                            * 6D45B
          ;                                      * 6D460
          BINT0                                  * 6D465
          OBJ_6733B                              * 6D46A
          OBJ_6D990                              * 6D46F
          OBJ_67416                              * 6D474
          OBJ_67AAF                              * 6D479
          #2+                                    * 6D47E
          DUP                                    * 6D483

* refs (1): 6E13B
OBJ_6D488:
          ::                                     * 6D488
            OBJ_6FDC6                            * 6D48D
            OBJ_4B97E                            * 6D492
            BINT6                                * 6D497
            MAKEGROB                             * 6D49C
            OBJ_671B0                            * 6D4A1
          ;                                      * 6D4A6
          BINT6                                  * 6D4AB
          ROT                                    * 6D4B0
          BINT3                                  * 6D4B5
          OBJ_67381                              * 6D4BA
          OBJ_67AE2                              * 6D4BF
          #1+                                    * 6D4C4
          OBJ_6DD6E                              * 6D4C9

* refs (10): 65C59 66025 6608E 66525 6CD44 6D0AF ...
OBJ_6D4CE:
          ::                                     * 6D4CE
            OBJ_685DD                            * 6D4D3
            OBJ_6860A                            * 6D4D8
            SWAPROT                              * 6D4DD

* refs (3): 682EA 6D500 6D505
OBJ_6D4E2:
            ::                                   * 6D4E2
              OBJ_674D6                          * 6D4E7
              #1-                                * 6D4EC
              UNROLL                             * 6D4F1
              OBJ_6A96F                          * 6D4F6
            ;                                    * 6D4FB
            OBJ_6D4E2                            * 6D500
            OBJ_6D4E2                            * 6D505
          ;                                      * 6D50A
          OBJ_67371                              * 6D50F
          OBJ_67416                              * 6D514
          OBJ_6DF1D                              * 6D519
          DUP                                    * 6D51E

* refs (9): 66363 663C2 66589 6CD5D 6E2B2 6E4D8 ...
OBJ_6D523:
          ::                                     * 6D523
            DUPZERO                              * 6D528
            OBJ_67BE2                            * 6D52D
          ;                                      * 6D532
          OBJ_67381                              * 6D537
          #3-                                    * 6D53C
          OBJ_67BC8                              * 6D541
          OBJ_6681A                              * 6D546
          DROP                                   * 6D54B
          OBJ_67371                              * 6D550
          OBJ_67448                              * 6D555
        ;                                        * 6D55A

* refs (3): 1A9F4 1ACF6 6D613
OBJ_6D55F:
        ::                                       * 6D55F
          SKIP                                   * 6D564
          OBJ_6DFFD                              * 6D569
          OBJ_6D666                              * 6D56E

* refs (1): 6CD26
OBJ_6D573:
          ::                                     * 6D573
            OBJ_6E0A1                            * 6D578
            #+                                   * 6D57D
            DUP4UNROLL                           * 6D582
            #2/                                  * 6D587
            SWAP                                 * 6D58C
            OBJ_6D909                            * 6D591
          ;                                      * 6D596

* refs (1): 6D76F
OBJ_6D59B:
          ::                                     * 6D59B
            BINT15                               * 6D5A0
            ROLL                                 * 6D5A5
            OBJ_68283                            * 6D5AA
            OBJ_6DD6E                            * 6D5AF
            OBJ_67348                            * 6D5B4
            OBJ_67416                            * 6D5B9
            OBJ_6D9C2                            * 6D5BE
          ;                                      * 6D5C3
          OBJ_6D014                              * 6D5C8
          OBJ_682DE                              * 6D5CD
          OBJ_67381                              * 6D5D2
          BINT0                                  * 6D5D7
          OBJ_67416                              * 6D5DC
          BINT1                                  * 6D5E1
          OBJ_6DAE9                              * 6D5E6

* refs (8): 65C86 660ED 6652A 6CF88 6D0CD 6D869 ...
OBJ_6D5EB:
          ::                                     * 6D5EB
            OBJ_67416                            * 6D5F0
            OBJ_67381                            * 6D5F5
          ;                                      * 6D5FA
        ;                                        * 6D5FF

* refs (1): 1E8C6
OBJ_6D604:
        ::                                       * 6D604
          SKIP                                   * 6D609
          OBJ_6DFFD                              * 6D60E
          OBJ_6D55F                              * 6D613

NOT_6D618:
          $       "NOT "                         * 6D618

* refs (5): 68DF0 68E63 68EC7 692E2 6DEA5
OBJ_6D62A:
          ::                                     * 6D62A
            OBJ_6CB70                            * 6D62F
            22PUTLAM                             * 6D634
          ;                                      * 6D639
          OBJ_6D014                              * 6D63E
          OBJ_67364                              * 6D643
          OBJ_6822C                              * 6D648
          OVER                                   * 6D64D
          BINT24                                 * 6D652
          OBJ_67BAE                              * 6D657
        ;                                        * 6D65C

* refs (1): 69160
OBJ_6D661:
        ::                                       * 6D661

* refs (3): 6D56E 6D747 6D8A0
OBJ_6D666:
          ::                                     * 6D666
            OBJ_6CFA1                            * 6D66B
            BINT13                               * 6D670
            ROLL                                 * 6D675
            #1-                                  * 6D67A
            BINT13                               * 6D67F
            UNROLL                               * 6D684
          ;                                      * 6D689
          DUP                                    * 6D68E
          #2*                                    * 6D693
          4UNROLL                                * 6D698
          ROT#1+UNROT                            * 6D69D
          ROT#1+UNROT                            * 6D6A2
          SWAP#1+                                * 6D6A7
          OBJ_6D8DC                              * 6D6AC
          OBJ_6DD6E                              * 6D6B1
          OBJ_67356                              * 6D6B6
          OBJ_67416                              * 6D6BB
          BINT1                                  * 6D6C0
          OBJ_6D04B                              * 6D6C5
          OBJ_682DE                              * 6D6CA
          OBJ_67348                              * 6D6CF
          BINT0                                  * 6D6D4
          OBJ_67416                              * 6D6D9
          OBJ_6D087                              * 6D6DE
          OBJ_682D2                              * 6D6E3
          OBJ_67348                              * 6D6E8
          DUPDUP                                 * 6D6ED
          #3-                                    * 6D6F2
          DUP#1+                                 * 6D6F7
          OBJ_67416                              * 6D6FC
          OBJ_6D39D                              * 6D701
          OBJ_6C85F                              * 6D706
          OBJ_6DCA6                              * 6D70B
          OBJ_682DE                              * 6D710
          OBJ_6D451                              * 6D715
          OBJ_6D163                              * 6D71A
          OBJ_682D2                              * 6D71F
        ;                                        * 6D724

* refs (1): 1B3AB
OBJ_6D729:
        ::                                       * 6D729
          SKIP                                   * 6D72E
          OBJ_6DFFD                              * 6D733
          ::                                     * 6D738
            SKIP                                 * 6D73D
            OBJ_6DFFD                            * 6D742
            OBJ_6D666                            * 6D747
            SWAPDROP                             * 6D74C
            #6+                                  * 6D751
            SWAP                                 * 6D756
            #2+                                  * 6D75B
            OBJ_6C873                            * 6D760
            #1+                                  * 6D765
            OBJ_6D909                            * 6D76A
            OBJ_6D59B                            * 6D76F
            BINT6                                * 6D774

* refs (9): 4B904 6648A 664D0 6CE7A 6D055 6D064 ...
OBJ_6D779:
            ::                                   * 6D779
              OBJ_6E057                          * 6D77E
              #2+                                * 6D783
            ;                                    * 6D788
            DUP                                  * 6D78D
            OBJ_44CD2                            * 6D792
            BINT4                                * 6D797
            ROT                                  * 6D79C
            BINT2                                * 6D7A1
            OBJ_6E057                            * 6D7A6
            #2/                                  * 6D7AB
            #2+                                  * 6D7B0
            OBJ_6DD6E                            * 6D7B5
            OBJ_682DE                            * 6D7BA
            OBJ_67356                            * 6D7BF
            DUP#1-                               * 6D7C4
            OBJ_6D9AE                            * 6D7C9
            ZEROOVER                             * 6D7CE
            #1-                                  * 6D7D3
            OBJ_6D39D                            * 6D7D8

* refs (6): 664CB 66502 66629 6CEE8 6CF33 6D81E
OBJ_6D7DD:
            ::                                   * 6D7DD
              OBJ_6E0A1                          * 6D7E2
              #2+                                * 6D7E7
            ;                                    * 6D7EC
            OBJ_6D779                            * 6D7F1
            OBJ_6C873                            * 6D7F6
            #1+                                  * 6D7FB
            OBJ_6D990                            * 6D800
            OBJ_6DD6E                            * 6D805
            OBJ_67356                            * 6D80A
            OBJ_6D9AE                            * 6D80F
            BINT0                                * 6D814
            #THREE#FOUR                          * 6D819
            OBJ_6D7DD                            * 6D81E
            DUP                                  * 6D823
            OBJ_66FF1                            * 6D828
            SWAP                                 * 6D82D
            BINT2                                * 6D832
            OBJ_6E0A1                            * 6D837
            #2/                                  * 6D83C
            #1+                                  * 6D841
            BINT1                                * 6D846
            OBJ_6DD6E                            * 6D84B
            OBJ_6D9F9                            * 6D850
            ZEROOVER                             * 6D855
            #1-                                  * 6D85A
            OBJ_6D163                            * 6D85F
            OBJ_6D4CE                            * 6D864
            OBJ_6D5EB                            * 6D869
          ;                                      * 6D86E
          OBJ_6CC10                              * 6D873
          ?SEMI                                  * 6D878
          OBJ_67381                              * 6D87D
          BINT2                                  * 6D882
          OBJ_67C3C                              * 6D887
        ;                                        * 6D88C

* refs (1): 1EFBF
OBJ_6D891:
        ::                                       * 6D891
          SKIP                                   * 6D896
          OBJ_4B8BE                              * 6D89B
          OBJ_6D666                              * 6D8A0
          3DROP                                  * 6D8A5
          BINT9                                  * 6D8AA
          ROLL                                   * 6D8AF
          #2+                                    * 6D8B4
          9rolld                                 * 6D8B9
          OBJ_6E0A1                              * 6D8BE
          OBJ_6819D                              * 6D8C3
          #12+                                   * 6D8C8
          OBJ_6E057                              * 6D8CD
          OBJ_6DA26                              * 6D8D2
          OBJ_6C873                              * 6D8D7

* refs (4): 65A97 6642B 6CFFB 6D6AC
OBJ_6D8DC:
          ::                                     * 6D8DC
            OBJ_6D909                            * 6D8E1
            GOTO                                 * 6D8E6
            L_6CF06                              * 6D8EB
          ;                                      * 6D8F0
          OBJ_67356                              * 6D8F5
          DUP                                    * 6D8FA
          #6+                                    * 6D8FF
          OBJ_67416                              * 6D904

* refs (9): 65F67 6C8A0 6D3E8 6D433 6D591 6D76A ...
OBJ_6D909:
          ::                                     * 6D909
            ZEROZERO                             * 6D90E
            BINT1                                * 6D913
          ;                                      * 6D918
          OBJ_6D779                              * 6D91D
          BINT6                                  * 6D922
          OBJ_6DC51                              * 6D927
          OBJ_682D2                              * 6D92C
          OBJ_6D451                              * 6D931
          #8+                                    * 6D936
          BINT0                                  * 6D93B
          OBJ_67416                              * 6D940
          OBJ_6D087                              * 6D945
          OBJ_682DE                              * 6D94A
          OBJ_67381                              * 6D94F
          #4+                                    * 6D954
          OBJ_6D9AE                              * 6D959
          BINT0                                  * 6D95E
          3PICK                                  * 6D963
          #5-                                    * 6D968
          DUP#1-                                 * 6D96D
          OBJ_6D39D                              * 6D972
          OBJ_6E0A1                              * 6D977
          OBJ_6DA26                              * 6D97C
          OBJ_6E057                              * 6D981
          OBJ_6DA26                              * 6D986
          OBJ_6C873                              * 6D98B

* refs (8): 65B2D 65FD5 660C0 66462 664DF 6CF01 ...
OBJ_6D990:
          ::                                     * 6D990
            ZEROZERO                             * 6D995
            BINT2                                * 6D99A
          ;                                      * 6D99F
          OBJ_6DD6E                              * 6D9A4
          OBJ_67356                              * 6D9A9

* refs (14): 65F85 65FE4 66034 66066 6A235 6D7C9 ...
OBJ_6D9AE:
          ::                                     * 6D9AE
            DUP                                  * 6D9B3
            #2-                                  * 6D9B8
          ;                                      * 6D9BD

* refs (3): 65AAB 6D00F 6D5BE
OBJ_6D9C2:
          ::                                     * 6D9C2
            BINT1                                * 6D9C7
            BINT0                                * 6D9CC
          ;                                      * 6D9D1

* refs (1): 6DAAD
OBJ_6D9D6:
          ::                                     * 6D9D6
            BINT0                                * 6D9DB
            tokDER                               * 6D9E0
            OBJ_6CB70                            * 6D9E5
            OBJ_6CF3D                            * 6D9EA
            OBJ_6DA4E                            * 6D9EF
          ;                                      * 6D9F4

* refs (6): 65C40 65FF8 66075 6D850 6DAB2 6DD05
OBJ_6D9F9:
          ::                                     * 6D9F9
            ZEROZERO                             * 6D9FE
            OBJ_67348                            * 6DA03
          ;                                      * 6DA08
          DUP#2+                                 * 6DA0D
          OBJ_6DCE7                              * 6DA12
          #ZERO#ONE                              * 6DA17
          BINT3                                  * 6DA1C
          OBJ_6E0A1                              * 6DA21

* refs (4): 6CEF2 6D8D2 6D97C 6D986
OBJ_6DA26:
          ::                                     * 6DA26
            #2*                                  * 6DA2B
            #2+                                  * 6DA30
          ;                                      * 6DA35
          DUP                                    * 6DA3A
          OBJ_66FF1                              * 6DA3F
          SWAP                                   * 6DA44
          BINT2                                  * 6DA49

* refs (10): 65ACE 66020 6CD08 6CE2A 6CF51 6D028 ...
OBJ_6DA4E:
          ::                                     * 6DA4E
            OBJ_6C873                            * 6DA53
            OBJ_6DD6E                            * 6DA58
          ;                                      * 6DA5D
          OBJ_6D4CE                              * 6DA62
          OBJ_67356                              * 6DA67
          DUP#1-                                 * 6DA6C
          OBJ_6D9AE                              * 6DA71
          ZEROOVER                               * 6DA76
          #2-                                    * 6DA7B
          OBJ_6D39D                              * 6DA80
          OBJ_6E0A1                              * 6DA85
          #2*                                    * 6DA8A
          OBJ_6E057                              * 6DA8F
          OBJ_6DCA6                              * 6DA94
          OBJ_6DD6E                              * 6DA99
          OBJ_67356                              * 6DA9E
          OBJ_6D9AE                              * 6DAA3
          ZEROZERO                               * 6DAA8
          OBJ_6D9D6                              * 6DAAD
          OBJ_6D9F9                              * 6DAB2
          BINT0                                  * 6DAB7
          OBJ_6DCE7                              * 6DABC
          BINT2                                  * 6DAC1
          OBJ_6D136                              * 6DAC6
          OBJ_6D4CE                              * 6DACB
          OBJ_67371                              * 6DAD0
          #5-                                    * 6DAD5
          DUP#1+                                 * 6DADA
          OBJ_67416                              * 6DADF
          BINT4                                  * 6DAE4

* refs (12): 660D4 660E8 66287 665F7 6C8AA 6CF6A ...
OBJ_6DAE9:
          ::                                     * 6DAE9
            OBJ_6D136                            * 6DAEE
            OBJ_682D2                            * 6DAF3
          ;                                      * 6DAF8
          OBJ_67416                              * 6DAFD
          OBJ_67364                              * 6DB02
        ;                                        * 6DB07

* refs (2): 1F381 1F407
OBJ_6DB0C:
        ::                                       * 6DB0C
          SKIP                                   * 6DB11
          OBJ_6E3E3                              * 6DB16
          OBJ_6E00B                              * 6DB1B
          OBJ_6CCCC                              * 6DB20
          OVER                                   * 6DB25
          OBJ_67416                              * 6DB2A
          OBJ_67A9D                              * 6DB2F
          #2+                                    * 6DB34
          OBJ_6E0D2                              * 6DB39
          OBJ_6819D                              * 6DB3E
          #+                                     * 6DB43
          OBJ_6DB6B                              * 6DB48
          3PICK                                  * 6DB4D
          OBJ_67416                              * 6DB52
          OBJ_44D9A                              * 6DB57
          OBJ_6CE8E                              * 6DB5C
          OBJ_679A1                              * 6DB61
          DUP                                    * 6DB66

* refs (2): 6DB48 6DBFC
OBJ_6DB6B:
          ::                                     * 6DB6B
            OBJ_67416                            * 6DB70
            OBJ_67AAF                            * 6DB75
            OBJ_6E0C0                            * 6DB7A
            #+                                   * 6DB7F
            #2-                                  * 6DB84
          ;                                      * 6DB89
          OBJ_44D7C                              * 6DB8E
          2DUP                                   * 6DB93
          GROBDIM                                * 6DB98
          SWAP                                   * 6DB9D
          OVER                                   * 6DBA2
          8PICK                                  * 6DBA7
          OBJ_67AE2                              * 6DBAC
          5PICK                                  * 6DBB1
          3UNROLL                                * 6DBB6
          OBJ_67C23                              * 6DBBB
          OBJ_6CE8E                              * 6DBC0
          OBJ_68245                              * 6DBC5
          BINT8                                  * 6DBCA
          SWAP                                   * 6DBCF
          OBJ_68593                              * 6DBD4
          OBJ_67348                              * 6DBD9
          DUP#1-                                 * 6DBDE
          DUP#1-                                 * 6DBE3
          OBJ_6DDD3                              * 6DBE8
          3DROP                                  * 6DBED
          OBJ_6E0D2                              * 6DBF2
          OBJ_6819D                              * 6DBF7
          OBJ_6DB6B                              * 6DBFC
          OVER                                   * 6DC01
          #2/                                    * 6DC06
          OBJ_67416                              * 6DC0B
          OBJ_67AE2                              * 6DC10
          OBJ_6CEFC                              * 6DC15
          OBJ_6DD6E                              * 6DC1A
          OBJ_67348                              * 6DC1F
          OBJ_6D9AE                              * 6DC24
          BINT0                                  * 6DC29
          BINT5                                  * 6DC2E
          BINT0                                  * 6DC33
          OBJ_67416                              * 6DC38
          OBJ_67AAF                              * 6DC3D
          #2-                                    * 6DC42
          OBJ_6E0D2                              * 6DC47
          OBJ_6819D                              * 6DC4C

* refs (5): 65B64 65BD7 66494 66507 6D927
OBJ_6DC51:
          ::                                     * 6DC51
            2DUP                                 * 6DC56
            MAKEGROB                             * 6DC5B
            SWAPROT                              * 6DC60
            OBJ_6DA4E                            * 6DC65
          ;                                      * 6DC6A
          OBJ_682DE                              * 6DC6F
          OBJ_67381                              * 6DC74
          #4+                                    * 6DC79
          OBJ_6D9AE                              * 6DC7E
          OBJ_6D9AE                              * 6DC83
          BINT0                                  * 6DC88
          OBJ_6DCE7                              * 6DC8D
          OBJ_6D39D                              * 6DC92
          OBJ_6E0D2                              * 6DC97
          OBJ_6819D                              * 6DC9C
          OBJ_6E0C0                              * 6DCA1

* refs (4): 65BAA 66057 6D70B 6DA94
OBJ_6DCA6:
          ::                                     * 6DCA6
            OBJ_6C873                            * 6DCAB
            OBJ_6D909                            * 6DCB0
          ;                                      * 6DCB5
          OBJ_682DE                              * 6DCBA
          OBJ_6DD6E                              * 6DCBF
          OBJ_67348                              * 6DCC4
          OBJ_6D9AE                              * 6DCC9
          BINT4                                  * 6DCCE
          OBJ_6DD19                              * 6DCD3
          ZEROZERO                               * 6DCD8
          OBJ_6733B                              * 6DCDD
          DUP#2+                                 * 6DCE2

* refs (10): 65C6D 66002 6607F 6DA12 6DABC 6DC8D ...
OBJ_6DCE7:
          ::                                     * 6DCE7
            OVER                                 * 6DCEC
            #1-                                  * 6DCF1
          ;                                      * 6DCF6
          BINT0                                  * 6DCFB
          OBJ_6DD19                              * 6DD00
          OBJ_6D9F9                              * 6DD05
          ZEROOVER                               * 6DD0A
          #2-                                    * 6DD0F
          BINT6                                  * 6DD14

* refs (4): 66070 66089 6DCD3 6DD00
OBJ_6DD19:
          ::                                     * 6DD19
            BINT0                                * 6DD1E

* refs (2): 65C7C 65FF3
OBJ_6DD23:
            ::                                   * 6DD23
              OBJ_6DFDE                          * 6DD28

* refs (4): 6622D 662F5 6D140 6E9E2
OBJ_6DD2D:
              ::                                 * 6DD2D
                BINT0                            * 6DD32
                OBJ_6F42D                        * 6DD37
                OBJ_6C85F                        * 6DD3C
                OBJ_6DA4E                        * 6DD41
              ;                                  * 6DD46
              OBJ_6E00B                          * 6DD4B
            ;                                    * 6DD50
          ;                                      * 6DD55
          OBJ_6D4CE                              * 6DD5A
          OBJ_67371                              * 6DD5F
          OBJ_6DFDE                              * 6DD64
        ;                                        * 6DD69

* refs (29): 65A9C 65B37 65B4B 65BB4 65BC8 65D2D ...
OBJ_6DD6E:
        CON(5)  (*)+5                            * 6DD6E  primitive code object
        ASSEMBLE
        ST=0    10                               * 6DD73
L_6DD76:
        LC(5)   #00003                           * 6DD76
        GOSUB   SUB_6DDA6                        * 6DD7D
        GOC     L_6DD76                          * 6DD81
        LC(15)  #03FEF03FEF03FEF                 * 6DD84
        D1=D1-  15                               * 6DD95
        DAT1=C  15                               * 6DD98
L_6DD9C:
        A=DAT0  A                                * 6DD9C
        D0=D0+  5                                * 6DD9F
        PC=(A)                                   * 6DDA2

* refs (1): 6DD7D
SUB_6DDA6:
        D=D-C   A                                * 6DDA6
        RTNNC                                    * 6DDA8

* refs (4): 6671E 67EAA 681FF 6DDE9
SUB_6DDAB:
        ?ST=1   10                               * 6DDAB
        GOYES   L_6DDCC                          * 6DDAE
        D=D+C   A                                * 6DDB0
        GOSBVL  SAVPTR                           * 6DDB2
        GOSBVL  GARBAGECOL                       * 6DDB9  inline data follows
        GOSBVL  GETPTR                           * 6DDC0
        ST=1    10                               * 6DDC7
        RTNSC                                    * 6DDCA
L_6DDCC:
        GOVLNG  DOMEMERR                         * 6DDCC

* refs (2): 6CFBF 6DBE8
OBJ_6DDD3:
        CON(5)  (*)+5                            * 6DDD3  primitive code object
        ST=0    10                               * 6DDD8
L_6DDDB:
        LC(5)   #00023                           * 6DDDB
        ?D>=C   A                                * 6DDE2
        GOYES   L_6DDF0                          * 6DDE5
        D=D-C   A                                * 6DDE7
        GOSUB   SUB_6DDAB                        * 6DDE9
        GOC     L_6DDDB                          * 6DDED
L_6DDF0:
        GOSBVL  SUB_67A4A                        * 6DDF0
        D1=D1-  5                                * 6DDF7
        D=D-1   A                                * 6DDFA
        D0=D0+  15                               * 6DDFC
        D0=D0+  15                               * 6DDFF
        D0=D0+  3                                * 6DE02
        GOSUB   SUB_6DE70                        * 6DE05
        GOSUB   SUB_6DE70                        * 6DE09
        GOSUB   SUB_6DE70                        * 6DE0D
        D1=D1-  5                                * 6DE11
        LC(5)   BINT0                            * 6DE14
        DAT1=C  A                                * 6DE1B
        D0=D0-  2                                * 6DE1E
        A=0     A                                * 6DE21
        A=DAT0  B                                * 6DE23
        ?A=0    B                                * 6DE26
        GOYES   L_6DE31                          * 6DE29
        C=0     B                                * 6DE2B
        DAT0=C  B                                * 6DE2E
L_6DE31:
        GOSUB   SUB_6DE76                        * 6DE31
        A=0     A                                * 6DE35
        GOSUB   SUB_6DE76                        * 6DE37
        D0=D0-  2                                * 6DE3B
        D1=D1-  5                                * 6DE3E
        LC(5)   NULLPAINT                        * 6DE41
        DAT1=C  A                                * 6DE48
        GOSUB   SUB_6DE70                        * 6DE4B
        D0=D0-  3                                * 6DE4F
        GOSUB   SUB_6DE70                        * 6DE52
        D0=D0+  12                               * 6DE56
        GOSUB   SUB_6DE70                        * 6DE59
        LC(5)   #00004                           * 6DE5D
        D=D-C   A                                * 6DE64
        C=R2                                     * 6DE66
        D0=C                                     * 6DE69
        GOTO    L_6DD9C                          * 6DE6C

* refs (6): 6DE05 6DE09 6DE0D 6DE4B 6DE52 6DE59
SUB_6DE70:
        A=0     A                                * 6DE70
        A=DAT0  X                                * 6DE72

* refs (2): 6DE31 6DE37
SUB_6DE76:
        GOSBVL  SUB_680FB                        * 6DE76
        D0=D0-  3                                * 6DE7D
        RTN                                      * 6DE80
        RPL

* refs (3): 479E8 4A2A8 4D0F1
OBJ_6DE82:
        ::                                       * 6DE82
          OBJ_677EA                              * 6DE87
          #0<>                                   * 6DE8C
        ;                                        * 6DE91

* refs (2): 68AD0 69879
OBJ_6DE96:
        ::                                       * 6DE96
          DUP                                    * 6DE9B
          ->StrExpr(_)                           * 6DEA0
          OBJ_6D62A                              * 6DEA5

* refs (1): 68E77
OBJ_6DEAA:
          ::                                     * 6DEAA
            OBJ_2708E                            * 6DEAF
            ?SKIP                                * 6DEB4
            ::                                   * 6DEB9
              DROP'                              * 6DEBE
              ::                                 * 6DEC3
                SKIP                             * 6DEC8
                OBJ_6DFFD                        * 6DECD
                OBJ_6D014                        * 6DED2
              ;                                  * 6DED7
            ;                                    * 6DEDC
            EVAL                                 * 6DEE1
            OBJ_67416                            * 6DEE6
            OBJ_6822C                            * 6DEEB
            OBJ_6E4F6                            * 6DEF0
          ;                                      * 6DEF5
        ;                                        * 6DEFA
L_6DEFF:
        NIBHEX  40007D0D62029FC630FF0D6400F0D6   * 6DEFF  ..×Ð& ùl.ÿÐF..m

* refs (2): 68E1D 6D519
OBJ_6DF1D:
        CON(5)  (*)+5                            * 6DF1D  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 6DF22
        GOSBVL  POP#                             * 6DF25
        R4=A                                     * 6DF2C
        D1=D1-  10                               * 6DF2F
        D=D-1   A                                * 6DF32
        LC(5)   FONTHEIGHT                       * 6DF34
        CD0EX                                    * 6DF3B
        A=DAT0  A                                * 6DF3E
        R0=A                                     * 6DF41
        D0=C                                     * 6DF44
        GOSBVL  SUB_67A51                        * 6DF47
        D0=D0+  15                               * 6DF4E
        D0=D0+  12                               * 6DF51
        A=0     A                                * 6DF54
        A=DAT0  X                                * 6DF56
        R3=A                                     * 6DF5A
        C=R4                                     * 6DF5D
        DAT0=C  X                                * 6DF60
        GOSBVL  SUB_67A3B                        * 6DF64
        D0=D0-  6                                * 6DF6B
        A=0     A                                * 6DF6E
        A=DAT0  X                                * 6DF70
        R1=A                                     * 6DF74
        GOSUB   SUB_6DFC9                        * 6DF77
        D0=D0+  3                                * 6DF7B
        GOSUB   SUB_6DFC9                        * 6DF7E
        A=R1                                     * 6DF82
L_6DF85:
        GOSBVL  SUB_67A3B                        * 6DF85
        A=0     A                                * 6DF8C
        D0=D0-  9                                * 6DF8E
        GOSUB   SUB_6DFC9                        * 6DF91
        D0=D0-  3                                * 6DF95
        GOSUB   SUB_6DFC9                        * 6DF98
        ?A#0    X                                * 6DF9C
        GOYES   L_6DF85                          * 6DF9F
        A=R0                                     * 6DFA1
        GOSBVL  SUB_67A3B                        * 6DFA4
        D0=D0-  12                               * 6DFAB
        C=R4                                     * 6DFAE
        C=C-1   X                                * 6DFB1
        DAT0=C  X                                * 6DFB4
        D0=D0+  3                                * 6DFB8
        C=0     X                                * 6DFBB
        DAT0=C  X                                * 6DFBE
        GOVLNG  L_685CD                          * 6DFC2

* refs (4): 6DF77 6DF7E 6DF91 6DF98
SUB_6DFC9:
        C=R0                                     * 6DFC9
        A=DAT0  X                                * 6DFCC
        ?C#A    X                                * 6DFD0
        RTNYES                                   * 6DFD3
        C=R4                                     * 6DFD5
        DAT0=C  X                                * 6DFD8
        RTN                                      * 6DFDC

* refs (10): 65CA4 65D8C 661BF 6650C 6D244 6D2E4 ...
OBJ_6DFDE:
        CON(5)  (*)+5                            * 6DFDE  primitive code object
        GOSUB   SUB_6E08F                        * 6DFE3
        A=A+1   B                                * 6DFE7
        CD0EX                                    * 6DFEA
        DAT0=A  B                                * 6DFED
L_6DFF0:
        D0=C                                     * 6DFF0
L_6DFF3:
        A=DAT0  A                                * 6DFF3
        D0=D0+  5                                * 6DFF6
        PC=(A)                                   * 6DFF9

* refs (9): 6CCC7 6CCD6 6CDE9 6D569 6D60E 6D733 ...
OBJ_6DFFD:
        CON(5)  (*)+5                            * 6DFFD  primitive code object
        D1=D1+  5                                * 6E002
        D=D+1   A                                * 6E005
        GOTO    L_6DFF3                          * 6E007

* refs (10): 4B8B4 65D82 65DAF 661F6 665D4 6D285 ...
OBJ_6E00B:
        CON(5)  (*)+5                            * 6E00B  primitive code object
        GOSUB   SUB_6E08F                        * 6E010
        CD0EX                                    * 6E014
        ?A=0    B                                * 6E017
        GOYES   L_6E022                          * 6E01A
        A=A-1   B                                * 6E01C
        DAT0=A  B                                * 6E01F
L_6E022:
        GOTO    L_6DFF0                          * 6E022

* refs (4): 68819 6AEF6 6BE98 6C2B7
OBJ_6E026:
        CON(5)  (*)+5                            * 6E026  primitive code object
        C=DAT1  A                                * 6E02B
        CD1EX                                    * 6E02E
        A=DAT1  A                                * 6E031
        D1=C                                     * 6E034
        LC(5)   DOCOL                            * 6E037
        ?C=A    A                                * 6E03E
        GOYES   L_6E04D                          * 6E041
        LC(5)   ?OKINALG                         * 6E043
        GONC    L_6E06D                          * 6E04A
L_6E04D:
        LC(5)   OBJ_26A82                        * 6E04D
        GOC     L_6E06D                          * 6E054

* refs (18): 65B19 65B55 65BA5 65BCD 65EC2 65FA3 ...
OBJ_6E057:
        CON(5)  (*)+5                            * 6E057  primitive code object
        GOSUB   SUB_6E08F                        * 6E05C
        A=A-1   B                                * 6E060
        GONC    L_6E073                          * 6E063
        LC(5)   BINT10                           * 6E066
L_6E06D:
        A=C     A                                * 6E06D
        PC=(A)                                   * 6E06F
L_6E073:
        A=A-1   B                                * 6E073
        GOC     L_6E084                          * 6E076
L_6E079:
        LC(5)   BINT6                            * 6E079
        GOTO    L_6E06D                          * 6E080
L_6E084:
        LC(5)   BINT8                            * 6E084
        GOTO    L_6E06D                          * 6E08B

* refs (7): 6DFE3 6E010 6E05C 6E0A6 6E0C5 6E0D7 ...
SUB_6E08F:
        LC(5)   AppCount                         * 6E08F
        CD0EX                                    * 6E096
        A=DAT0  B                                * 6E099
        CD0EX                                    * 6E09C
        RTN                                      * 6E09F

* refs (21): 65A7E 65B05 65B5F 65B96 65ECC 65F21 ...
OBJ_6E0A1:
        CON(5)  (*)+5                            * 6E0A1  primitive code object
        GOSUB   SUB_6E08F                        * 6E0A6
        A=A-1   B                                * 6E0AA
        GOC     L_6E079                          * 6E0AD
        A=A-1   B                                * 6E0B0
        GOC     L_6E079                          * 6E0B3
L_6E0B6:
        LC(5)   BINT4                            * 6E0B6
        GONC    L_6E06D                          * 6E0BD

* refs (9): 65B0F 65B50 65F35 65F5D 65FBC 66052 ...
OBJ_6E0C0:
        CON(5)  (*)+5                            * 6E0C0  primitive code object
        GOSUB   SUB_6E08F                        * 6E0C5
        A=A-1   B                                * 6E0C9
        GOC     L_6E084                          * 6E0CC
        GONC    L_6E079                          * 6E0CF

* refs (7): 66048 66408 6644E 6DB39 6DBF2 6DC47 ...
OBJ_6E0D2:
        CON(5)  (*)+5                            * 6E0D2  primitive code object
        GOSUB   SUB_6E08F                        * 6E0D7
        A=A-1   B                                * 6E0DB
        GOC     L_6E079                          * 6E0DE
        GONC    L_6E0B6                          * 6E0E1

        CON(5)  (*)+5                            * 6E0E4  primitive code object
        GOSUB   SUB_6E08F                        * 6E0E9
        A=A-1   B                                * 6E0ED
        GOC     L_6E0FE                          * 6E0F0
        LC(5)   OBJ_66E7F                        * 6E0F3
        GOTO    L_6E06D                          * 6E0FA
L_6E0FE:
        LC(5)   OBJ_66FB1                        * 6E0FE
        GOTO    L_6E06D                          * 6E105
        RPL

* refs (1): 6CF9C
OBJ_6E109:
        ::                                       * 6E109
          BINT4                                  * 6E10E

* refs (5): 4B91D 6E18B 6E235 6E3C0 6E3D9
OBJ_6E113:
          ::                                     * 6E113
            OBJ_6E433                            * 6E118

* refs (1): 6997D
OBJ_6E11D:
            ::                                   * 6E11D
              OBJ_67E0C                          * 6E122
              OBJ_679C5                          * 6E127
L_6E12C:
              OBJ_6799C                          * 6E12C
              OBJ_67AAA                          * 6E131
              #2+                                * 6E136
              OBJ_6D488                          * 6E13B
              3PICKSWAP                          * 6E140
              OBJ_44DFE                          * 6E145
              BINT2                              * 6E14A
              3PICK                              * 6E14F
              OBJ_68593                          * 6E154
              OBJ_67AE2                          * 6E159
              #1+                                * 6E15E
              OBJ_67C16                          * 6E163
            ;                                    * 6E168
          ;                                      * 6E16D
        ;                                        * 6E172

* refs (1): 6D109
OBJ_6E177:
        ::                                       * 6E177
          OBJ_6FDB6                              * 6E17C
          OBJ_6E1A9                              * 6E181
          BINT6                                  * 6E186
          OBJ_6E113                              * 6E18B
        ;                                        * 6E190

* refs (1): 6D0FA
OBJ_6E195:
        ::                                       * 6E195
          OBJ_6FDB6                              * 6E19A
          OBJ_6E1A9                              * 6E19F
          OBJ_6FDC6                              * 6E1A4

* refs (6): 6944F 6E181 6E19F 6E398 6E3A7 6E3CF
OBJ_6E1A9:
          ::                                     * 6E1A9
            OBJ_6F199                            * 6E1AE
            OBJ_6E4AB                            * 6E1B3
            DROP                                 * 6E1B8
            OBJ_6D5EB                            * 6E1BD
            OBJ_67BE2                            * 6E1C2

* refs (3): 6625A 663BD 6E40B
OBJ_6E1C7:
            ::                                   * 6E1C7
              OBJ_67416                          * 6E1CC
              OBJ_6798C                          * 6E1D1
            ;                                    * 6E1D6
            DUPDUP                               * 6E1DB
            OBJ_6E474                            * 6E1E0
            ZEROOVER                             * 6E1E5
            OBJ_678DB                            * 6E1EA
            OBJ_67DDF                            * 6E1EF
            #1+                                  * 6E1F4
            OBJ_6DAE9                            * 6E1F9
            OBJ_67381                            * 6E1FE
            2DUP                                 * 6E203
            OBJ_67BE2                            * 6E208
            OBJ_67443                            * 6E20D
            SWAP                                 * 6E212
            OBJ_678DB                            * 6E217
            SWAP                                 * 6E21C
            OBJ_67BFC                            * 6E221
            OBJ_6E4F6                            * 6E226
          ;                                      * 6E22B
          BINT8                                  * 6E230
          OBJ_6E113                              * 6E235
        ;                                        * 6E23A

* refs (1): 6CECF
OBJ_6E23F:
        ::                                       * 6E23F
          SKIP                                   * 6E244
          ::                                     * 6E249
            OBJ_65E13                            * 6E24E
            OBJ_67E64                            * 6E253
            DUP#2+                               * 6E258
            DUPUNROT                             * 6E25D
            OBJ_67BFC                            * 6E262
            DUP#1-                               * 6E267
            SWAP                                 * 6E26C
            OBJ_67BE2                            * 6E271
          ;                                      * 6E276
          BINT4                                  * 6E27B
          OBJ_6E433                              * 6E280
          OBJ_67416                              * 6E285
          OBJ_678D6                              * 6E28A
          SWAP                                   * 6E28F
          OBJ_6798C                              * 6E294
          DUP                                    * 6E299
          BINT5                                  * 6E29E
          OBJ_6E4AB                              * 6E2A3
          OBJ_67BE2                              * 6E2A8
          OBJ_67381                              * 6E2AD
          OBJ_6D523                              * 6E2B2
          DUPUNROT                               * 6E2B7
          OBJ_67BFC                              * 6E2BC
          OBJ_67448                              * 6E2C1
          OBJ_6E4F6                              * 6E2C6
        ;                                        * 6E2CB

* refs (3): 68D82 68EBD 6998C
OBJ_6E2D0:
        ::                                       * 6E2D0
          OBJ_2708E                              * 6E2D5
          ?GOTO                                  * 6E2DA
          L_6E343                                * 6E2DF
          DUP                                    * 6E2E4

* refs (5): 6B73B 6E816 6EA78 6F08B 6F2D4
OBJ_6E2E9:
          ::                                     * 6E2E9
            OBJ_26BED                            * 6E2EE
            NOTcsdrpfls                          * 6E2F3
            DROPSWAPDROP                         * 6E2F8
            OBJ_26E61                            * 6E2FD
            3DROP                                * 6E302
          ;                                      * 6E307
          case2DROP                              * 6E30C

* refs (1): 68ED6
OBJ_6E311:
          ::                                     * 6E311
            OBJ_26BED                            * 6E316
            DROP                                 * 6E31B
            ROTROT2DROP                          * 6E320
            #1+                                  * 6E325
            OBJ_6FDE2                            * 6E32A
            L_6DEFF                              * 6E32F
            ?SEMI                                * 6E334
            ERRJMP                               * 6E339
          ;                                      * 6E33E
L_6E343:
          OBJ_6F261                              * 6E343
          EVAL                                   * 6E348
        ;                                        * 6E34D

* refs (1): 6D0E1
OBJ_6E352:
        ::                                       * 6E352
          SKIP                                   * 6E357
          OBJ_6F360                              * 6E35C
          DUP                                    * 6E361
          BINT4                                  * 6E366
          #<case                                 * 6E36B
          DROP                                   * 6E370
          OBJ_67DEC                              * 6E375
          OBJ_6EF6E                              * 6E37A
          OBJ_6B2AA                              * 6E37F
          xAPPLY                                 * 6E384
          case                                   * 6E389
          ::                                     * 6E38E
            OBJ_6FDB6                            * 6E393
            OBJ_6E1A9                            * 6E398
            OBJ_6FDC6                            * 6E39D
            ::                                   * 6E3A2
              OBJ_6E1A9                          * 6E3A7
              OBJ_69594                          * 6E3AC
              OBJ_69594                          * 6E3B1
            ;                                    * 6E3B6
            BINT7                                * 6E3BB
            OBJ_6E113                            * 6E3C0
          ;                                      * 6E3C5
          OBJ_6FDB6                              * 6E3CA
          OBJ_6E1A9                              * 6E3CF
          BINT5                                  * 6E3D4
          OBJ_6E113                              * 6E3D9
        ;                                        * 6E3DE

* refs (1): 6DB16
OBJ_6E3E3:
        ::                                       * 6E3E3
          SKIP                                   * 6E3E8
          OBJ_6F4B4                              * 6E3ED
          OBJ_6FD85                              * 6E3F2
          OBJ_6DFDE                              * 6E3F7
          #1-                                    * 6E3FC
          OBJ_6FDB6                              * 6E401
          ::                                     * 6E406
            OBJ_6E1C7                            * 6E40B
            OBJ_6E564                            * 6E410
            OBJ_6798C                            * 6E415
            OBJ_67448                            * 6E41A
          ;                                      * 6E41F
          OBJ_6FDC6                              * 6E424
          OBJ_6E451                              * 6E429
          BINT7                                  * 6E42E

* refs (8): 65CC2 661F1 665CF 6B354 6C23F 6E118 ...
OBJ_6E433:
          ::                                     * 6E433
            #=?SKIP                              * 6E438
            RDROP                                * 6E43D
          ;                                      * 6E442
          OBJ_6E00B                              * 6E447
        ;                                        * 6E44C

* refs (1): 6E429
OBJ_6E451:
        ::                                       * 6E451
          OBJ_6F199                              * 6E456
          OBJ_6E4AB                              * 6E45B
          OBJ_67416                              * 6E460
          OVER                                   * 6E465
          OBJ_67BE2                              * 6E46A
          DUP                                    * 6E46F

* refs (2): 6E1E0 6F211
OBJ_6E474:
          ::                                     * 6E474
            OBJ_6BC55                            * 6E479
            CHR>$                                * 6E47E
            OBJ_6CB70                            * 6E483
            OBJ_44DFE                            * 6E488
          ;                                      * 6E48D
          BINT4                                  * 6E492
          OBJ_6E4AB                              * 6E497
          DUPZERO                                * 6E49C
          OBJ_6E4AB                              * 6E4A1
          BINT6                                  * 6E4A6

* refs (5): 6E1B3 6E2A3 6E45B 6E497 6E4A1
OBJ_6E4AB:
          ::                                     * 6E4AB
            SWAP                                 * 6E4B0
            OBJ_67348                            * 6E4B5
            OVER                                 * 6E4BA
            OBJ_678DB                            * 6E4BF
            4ROLL                                * 6E4C4
            OBJ_6DAE9                            * 6E4C9
            OBJ_67381                            * 6E4CE
          ;                                      * 6E4D3
          OBJ_6D523                              * 6E4D8
          OBJ_67416                              * 6E4DD
          OBJ_678DB                              * 6E4E2
          SWAP                                   * 6E4E7
          OBJ_67BFC                              * 6E4EC
          OBJ_67448                              * 6E4F1

* refs (7): 65DA0 6624B 69165 6DEF0 6E226 6E2C6 ...
OBJ_6E4F6:
          ::                                     * 6E4F6
            OBJ_67416                            * 6E4FB
            OBJ_6681A                            * 6E500
          ;                                      * 6E505
        ;                                        * 6E50A

* refs (1): 1A973
OBJ_6E50F:
        ::                                       * 6E50F
          SKIP                                   * 6E514
          ::                                     * 6E519
            SKIP                                 * 6E51E
            ::                                   * 6E523
              OBJ_65E13                          * 6E528
              GOTO                               * 6E52D
              L_6F18A                            * 6E532
            ;                                    * 6E537
            #1<>                                 * 6E53C
            ?SEMI                                * 6E541
            OBJ_6D5EB                            * 6E546
            #2+                                  * 6E54B
            BINT1                                * 6E550
            BINT2                                * 6E555
            OBJ_6DAE9                            * 6E55A
            OBJ_67381                            * 6E55F

* refs (1): 6E410
OBJ_6E564:
            ::                                   * 6E564
              DUP                                * 6E569
              tok=                               * 6E56E
              OBJ_6CB70                          * 6E573
              OBJ_68245                          * 6E578
            ;                                    * 6E57D
            OBJ_67416                            * 6E582
            SWAP                                 * 6E587
            OBJ_67BE2                            * 6E58C
            OBJ_67381                            * 6E591
            #ZERO#ONE                            * 6E596
            BINT3                                * 6E59B
            OBJ_6DAE9                            * 6E5A0
            OBJ_67381                            * 6E5A5
            DUP                                  * 6E5AA
            OBJ_6681A                            * 6E5AF
            BINT1                                * 6E5B4
            OVER                                 * 6E5B9
            OBJ_67BFC                            * 6E5BE
            OBJ_67448                            * 6E5C3
          ;                                      * 6E5C8
        ;                                        * 6E5CD

* refs (1): 6BB4A
OBJ_6E5D2:
        ::                                       * 6E5D2
          OBJ_6CAA8                              * 6E5D7
          NOTcase                                * 6E5DC
          ::                                     * 6E5E1

* refs (1): 6CB1B
OBJ_6E5E6:
            ::                                   * 6E5E6
              10GETLAM                           * 6E5EB
              OBJ_6B359                          * 6E5F0
              10PUTLAM                           * 6E5F5
            ;                                    * 6E5FA
            OBJ_6B939                            * 6E5FF
            OBJ_6CB25                            * 6E604
            OBJ_6CB3E                            * 6E609
            ?SEMI                                * 6E60E
            OBJ_6CB39                            * 6E613
          ;                                      * 6E618
          OBJ_283F1                              * 6E61D
          DROPDUP                                * 6E622
          BINT2                                  * 6E627
          #<case                                 * 6E62C
          ::                                     * 6E631
            3DROP                                * 6E636
            DoBadKey                             * 6E63B
          ;                                      * 6E640

* refs (4): 69214 6ABA9 6E73F 6E7DA
OBJ_6E645:
          ::                                     * 6E645
            DUPDUP                               * 6E64A
            OBJ_56FD1                            * 6E64F
            BIND                                 * 6E654
            BEGIN                                * 6E659
            1GETLAM                              * 6E65E
            #1-DUP                               * 6E663
            1PUTLAM                              * 6E668
            GetNextToken                         * 6E66D
            DROPDUP                              * 6E672
            2PUTLAM                              * 6E677
            GetNextToken                         * 6E67C
            SWAPDROPDUP                          * 6E681
            3PUTLAM                              * 6E686
            NULL$?                               * 6E68B
            NOT                                  * 6E690
            OBJ_699B9                            * 6E695
            OR                                   * 6E69A
            UNTIL                                * 6E69F
            2GETLAM                              * 6E6A4
            OBJ_699B9                            * 6E6A9
            ITE                                  * 6E6AE
            ::                                   * 6E6B3
              2DROP                              * 6E6B8
              BINT1                              * 6E6BD
              NULL$                              * 6E6C2
            ;                                    * 6E6C7
            ::                                   * 6E6CC
              DUPUNROT                           * 6E6D1
              1_#1-SUB$                          * 6E6D6
            ;                                    * 6E6DB
            SWAP                                 * 6E6E0
            3GETLAM                              * 6E6E5
            ABND                                 * 6E6EA
          ;                                      * 6E6EF
          DUP                                    * 6E6F4
          22PUTLAM                               * 6E6F9
          toklparen                              * 6E6FE
          EQUAL                                  * 6E703
          IT                                     * 6E708
          ::                                     * 6E70D
            OBJ_67DFC                            * 6E712
            OBJ_26E61                            * 6E717
            ROTROT2DROP                          * 6E71C
            NOTcaseDROP                          * 6E721
            ITE                                  * 6E726
            BINT4                                * 6E72B
            BINT3                                * 6E730
            OBJ_67DDF                            * 6E735
            OBJ_6E433                            * 6E73A
            OBJ_6E645                            * 6E73F
            DROP                                 * 6E744
          ;                                      * 6E749
          OBJ_6E7C6                              * 6E74E
          OBJ_67DCF                              * 6E753
          7PUTLAM                                * 6E758
          OBJ_6E4F6                              * 6E75D
          CLEARVDISP                             * 6E762
          OBJ_67CBE                              * 6E767
          OBJ_6B79A                              * 6E76C
          WINDOWCORNER                           * 6E771
          SWAPDROP                               * 6E776
          12GETLAM                               * 6E77B
          #<                                     * 6E780
          ?SKIP                                  * 6E785
          ::                                     * 6E78A
            REDISPHBUFF                          * 6E78F
            OBJ_6B79A                            * 6E794
          ;                                      * 6E799
          OBJ_6F42D                              * 6E79E
          BINT26                                 * 6E7A3
          PUTLAM                                 * 6E7A8
          OBJ_67416                              * 6E7AD
          OBJ_67AF4                              * 6E7B2
          15PUTLAM                               * 6E7B7
          14PUTLAM                               * 6E7BC
        ;                                        * 6E7C1

* refs (1): 6E74E
OBJ_6E7C6:
        ::                                       * 6E7C6

* refs (1): 6ABB3
OBJ_6E7CB:
          ::                                     * 6E7CB
            BINT3                                * 6E7D0
            NDUP                                 * 6E7D5
            OBJ_6E645                            * 6E7DA
            4UNROLL3DROP                         * 6E7DF
            DUPLEN$                              * 6E7E4
            BINT1                                * 6E7E9
            #>                                   * 6E7EE
            NOTcaseDROP                          * 6E7F3
            palparse                             * 6E7F8
            DROP                                 * 6E7FD
            DUP'                                 * 6E802
            xNOT                                 * 6E807
            EQ                                   * 6E80C
            SWAP                                 * 6E811
            OBJ_6E2E9                            * 6E816
            OR                                   * 6E81B
            NOT?SEMI                             * 6E820
            SWAP                                 * 6E825
            APPEND_SPACE                         * 6E82A
            SWAP                                 * 6E82F
            #1+                                  * 6E834
          ;                                      * 6E839
          OBJ_6821C                              * 6E83E
          DUPNULLCOMP?                           * 6E843
          casedrop                               * 6E848
          ::                                     * 6E84D
            RDROP                                * 6E852
            NULL$                                * 6E857
            OBJ_2840F                            * 6E85C
            OBJ_6AE42                            * 6E861
          ;                                      * 6E866
          OBJ_6C127                              * 6E86B
          CARCOMP                                * 6E870
          INCOMPDROP                             * 6E875
          8PUTLAM                                * 6E87A
          BINT34                                 * 6E87F
          PUTLAM                                 * 6E884
          OBJ_67381                              * 6E889
          OVER#-                                 * 6E88E
          DUP#0=ITE                              * 6E893
          DROP                                   * 6E898
          ::                                     * 6E89D
            ZERO_DO                              * 6E8A2
            OBJ_674D6                            * 6E8A7
            ROLLDROP                             * 6E8AC
            OBJ_6C302                            * 6E8B1
            LOOP                                 * 6E8B6
          ;                                      * 6E8BB
          OBJ_6746B                              * 6E8C0
          OBJ_67426                              * 6E8C5
          1PUTLAM                                * 6E8CA
          OBJ_67458                              * 6E8CF
          OBJ_0C4E3                              * 6E8D4
          SWAP#-                                 * 6E8D9
          3UNROLL                                * 6E8DE
          4UNROLL                                * 6E8E3
          OBJ_679EA                              * 6E8E8
          8ROLL                                  * 6E8ED
          8ROLL                                  * 6E8F2
          8ROLL                                  * 6E8F7
          4ROLL                                  * 6E8FC
          IT                                     * 6E901
          ::                                     * 6E906
            OBJ_699B9                            * 6E90B
            NOT?SEMI                             * 6E910
            22Lget                               * 6E915
            OBJ_0C204                            * 6E91A
            ?SEMI                                * 6E91F
            8GETLAM                              * 6E924
            LEN$                                 * 6E929
            2DUP#>                               * 6E92E
            NOTcaseDROP                          * 6E933
            #-                                   * 6E938
          ;                                      * 6E93D
          NULL$                                  * 6E942
          OBJ_2840F                              * 6E947
          OBJ_67416                              * 6E94C
          7PUTLAM                                * 6E951
          OBJ_67448                              * 6E956
          OVER                                   * 6E95B
          12PUTLAM                               * 6E960
          OBJ_67DDF                              * 6E965
          OBJ_67DEC                              * 6E96A
          DUPTYPELIST?                           * 6E96F
          OBJ_6BFBA                              * 6E974
          ::                                     * 6E979
            DUPLENCOMP                           * 6E97E
            DUP#0=                               * 6E983
            case2DROP                            * 6E988
            #1-                                  * 6E98D
            NTHCOMPDROP                          * 6E992
            #0=?SKIP                             * 6E997
            #1+                                  * 6E99C
          ;                                      * 6E9A1
          13PUTLAM                               * 6E9A6
          OBJ_6EB31                              * 6E9AB

* refs (2): 6949A 6C08C
OBJ_6E9B0:
          ::                                     * 6E9B0
            OBJ_67416                            * 6E9B5
            OBJ_679EA                            * 6E9BA
          ;                                      * 6E9BF
          ROT                                    * 6E9C4
          OR                                     * 6E9C9
          ITE                                    * 6E9CE
          ::                                     * 6E9D3
            OBJ_699B9                            * 6E9D8
            NOTcaseDROP                          * 6E9DD
            OBJ_6DD2D                            * 6E9E2
            OBJ_67416                            * 6E9E7
            OBJ_6822C                            * 6E9EC
            DUPZERO                              * 6E9F1
            2DUP                                 * 6E9F6
            OBJ_67BEF                            * 6E9FB
            OBJ_67BFC                            * 6EA00
            OBJ_67DDF                            * 6EA05
            OBJ_67C3C                            * 6EA0A
          ;                                      * 6EA0F
          ::                                     * 6EA14
            OBJ_679B3                            * 6EA19
            OBJ_67B12                            * 6EA1E
            OBJ_66BAD                            * 6EA23
            NOT                                  * 6EA28
            SWAP                                 * 6EA2D
            OBJ_6AAB9                            * 6EA32
            AND                                  * 6EA37
            ?SEMI                                * 6EA3C
            OBJ_0C4E3                            * 6EA41
            OBJ_6A267                            * 6EA46
            BINT0                                * 6EA4B
            BEGIN                                * 6EA50
            #1+                                  * 6EA55
            OBJ_67B12                            * 6EA5A
            3PICK                                * 6EA5F
            #=                                   * 6EA64
            UNTIL                                * 6EA69
            SWAPDROP                             * 6EA6E
            OBJ_69188                            * 6EA73
            OBJ_6E2E9                            * 6EA78
            ITE                                  * 6EA7D
            BINT2                                * 6EA82
            BINT1                                * 6EA87
            OBJ_67C3C                            * 6EA8C
          ;                                      * 6EA91
          15GETLAM                               * 6EA96
          12GETLAM                               * 6EA9B
          DUPLENCOMP                             * 6EAA0
          #2-                                    * 6EAA5
          3PICK                                  * 6EAAA
          OBJ_6819D                              * 6EAAF
          #-                                     * 6EAB4
          NTHCOMPDROP                            * 6EAB9
          13GETLAM                               * 6EABE
          #=?SKIP                                * 6EAC3
          #1+                                    * 6EAC8
          DUP#0=IT                               * 6EACD
          #1+                                    * 6EAD2
          ZERO_DO                                * 6EAD7
          OBJ_672E6                              * 6EADC
          INDEX@#-                               * 6EAE1
          OBJ_6F0FE                              * 6EAE6
          LOOP                                   * 6EAEB
          OBJ_67381                              * 6EAF0
          #1+_ONE_DO                             * 6EAF5
          INDEX@                                 * 6EAFA
          OBJ_6798C                              * 6EAFF
          OBJ_6ECF8                              * 6EB04
          IT                                     * 6EB09
          ::                                     * 6EB0E
            INDEX@                               * 6EB13
            BINT0                                * 6EB18
            OBJ_67BE2                            * 6EB1D
          ;                                      * 6EB22
          LOOP                                   * 6EB27
        ;                                        * 6EB2C

* refs (1): 6E9AB
OBJ_6EB31:
        ::                                       * 6EB31
          OBJ_67E0C                              * 6EB36
          3UNROLL                                * 6EB3B
          FALSE                                  * 6EB40
          4PICK                                  * 6EB45
          4PICK                                  * 6EB4A
          DUP                                    * 6EB4F
          OBJ_6EDFC                              * 6EB54
          #1+_ONE_DO                             * 6EB59
          DUPINDEX@                              * 6EB5E
          OBJ_6819D                              * 6EB63
          #1-                                    * 6EB68
          NTHCOMPDROP                            * 6EB6D
          3PICK                                  * 6EB72
          #=                                     * 6EB77
          4ROLL                                  * 6EB7C
          OR                                     * 6EB81
          3UNROLL                                * 6EB86
          LOOP                                   * 6EB8B
          2DROP                                  * 6EB90
          ?SKIP                                  * 6EB95
          ::                                     * 6EB9A
            OBJ_674BB                            * 6EB9F
            ROT                                  * 6EBA4
            OBJ_678DB                            * 6EBA9
            3UNROLL                              * 6EBAE
          ;                                      * 6EBB3
          OBJ_6EDF2                              * 6EBB8
          DUPLENCOMP                             * 6EBBD
          #0=?SKIP                               * 6EBC2
          ::                                     * 6EBC7
            DUPLENCOMP                           * 6EBCC
            #1+_ONE_DO                           * 6EBD1
            DUPINDEX@                            * 6EBD6
            NTHCOMPDROP                          * 6EBDB
            DUP                                  * 6EBE0
            OBJ_6EF6E                            * 6EBE5
            OBJ_6AEF1                            * 6EBEA
            ITE                                  * 6EBEF
            OBJ_6EF64                            * 6EBF4
            ::                                   * 6EBF9
              DROP                               * 6EBFE
              OBJ_67416                          * 6EC03
              OBJ_67DDF                          * 6EC08
            ;                                    * 6EC0D
            OBJ_67C3C                            * 6EC12
            LOOP                                 * 6EC17
          ;                                      * 6EC1C
          2DROP                                  * 6EC21
          OBJ_67416                              * 6EC26
          7GETLAM                                * 6EC2B
          ::                                     * 6EC30
            2DUPSWAP                             * 6EC35
            OBJ_678DB                            * 6EC3A
            #=case                               * 6EC3F
            SWAPDROP                             * 6EC44
            BEGIN                                * 6EC49
            OBJ_678D6                            * 6EC4E
            DUP                                  * 6EC53
            OBJ_68F7B                            * 6EC58
            5PICK                                * 6EC5D
            #>                                   * 6EC62
            SWAP                                 * 6EC67
            5PICK                                * 6EC6C
            #<                                   * 6EC71
            OR                                   * 6EC76
            OVER                                 * 6EC7B
            OBJ_67B17                            * 6EC80
            OBJ_6EE65                            * 6EC85
            IT                                   * 6EC8A
            ::                                   * 6EC8F
              caseTRUE                           * 6EC94
              DROPDUP                            * 6EC99
              FALSE                              * 6EC9E
            ;                                    * 6ECA3
            OVER                                 * 6ECA8
            OBJ_678DB                            * 6ECAD
            #0<>                                 * 6ECB2
            AND                                  * 6ECB7
            WHILE                                * 6ECBC
            ::                                   * 6ECC1
              SWAPDROP                           * 6ECC6
            ;                                    * 6ECCB
            REPEAT                               * 6ECD0
            ROTROT2DROP                          * 6ECD5
            DUP#0<>                              * 6ECDA
            ?SEMI                                * 6ECDF
            DROP                                 * 6ECE4
            7GETLAM                              * 6ECE9
          ;                                      * 6ECEE
          DUP                                    * 6ECF3

* refs (4): 6EB04 6ED70 6F39C 6F4FA
OBJ_6ECF8:
          ::                                     * 6ECF8
            OBJ_67381                            * 6ECFD
            #>                                   * 6ED02
          ;                                      * 6ED07
          NOTcase2DROP                           * 6ED0C
          OBJ_679EA                              * 6ED11
          IT                                     * 6ED16
          ::                                     * 6ED1B
            BINT1                                * 6ED20
            OBJ_679C5                            * 6ED25
            BINT1                                * 6ED2A
            OBJ_679B3                            * 6ED2F
            OVER#=                               * 6ED34
            caseDROP                             * 6ED39
            OVER#=                               * 6ED3E
            NOT?SEMI                             * 6ED43
            RDROP                                * 6ED48
            2DROP                                * 6ED4D
          ;                                      * 6ED52
          ::                                     * 6ED57
            OBJ_67416                            * 6ED5C
            BEGIN                                * 6ED61
            OBJ_678D6                            * 6ED66
            DUP                                  * 6ED6B
            OBJ_6ECF8                            * 6ED70
            NOT                                  * 6ED75
            OVER                                 * 6ED7A
            #1<>                                 * 6ED7F
            AND                                  * 6ED84
            WHILE                                * 6ED89
            ::                                   * 6ED8E
              SWAPDROP                           * 6ED93
            ;                                    * 6ED98
            REPEAT                               * 6ED9D
            #1<>                                 * 6EDA2
            ?SEMI                                * 6EDA7
            OBJ_67416                            * 6EDAC
            OVER#=                               * 6EDB1
            NOTcase2drop                         * 6EDB6
            drop;q_58A0C                         * 6EDBB
          ;                                      * 6EDC0
          ROTDROP                                * 6EDC5
          BINT1                                  * 6EDCA
          SWAPROT                                * 6EDCF
          OBJ_67381                              * 6EDD4
          BINT1                                  * 6EDD9
          OBJ_6A5AA                              * 6EDDE
          ROTDROP                                * 6EDE3
          OBJ_6F0B8                              * 6EDE8
        ;                                        * 6EDED

* refs (1): 6EBB8
OBJ_6EDF2:
        ::                                       * 6EDF2
          OVER                                   * 6EDF7

* refs (2): 6EB54 6EF23
OBJ_6EDFC:
          ::                                     * 6EDFC
            LENCOMP                              * 6EE01
            BINT3                                * 6EE06
            #/                                   * 6EE0B
            SWAPDROP                             * 6EE10
          ;                                      * 6EE15
          OBJ_672E6                              * 6EE1A
          #-DUP                                  * 6EE1F
          15PUTLAM                               * 6EE24
          NULL{}                                 * 6EE29
          BINT0                                  * 6EE2E
          4ROLL                                  * 6EE33
          DUP#0=ITE                              * 6EE38
          DROP                                   * 6EE3D
          ::                                     * 6EE42
            #1+_ONE_DO                           * 6EE47
            ::                                   * 6EE4C
              OBJ_6918D                          * 6EE51
              OBJ_26BED                          * 6EE56
              NOTcaseFALSE                       * 6EE5B
              SWAPDROP                           * 6EE60

* refs (8): 68CFB 69FA6 6A2BC 6A34D 6AD07 6EC85 ...
OBJ_6EE65:
              ::                                 * 6EE65
                MINUSONE                         * 6EE6A
                #=                               * 6EE6F
              ;                                  * 6EE74
              NOTcaseTRUE                        * 6EE79
              OBJ_6918D                          * 6EE7E
              SWAP                               * 6EE83
              DUP'                               * 6EE88
              xFCNAPPLY                          * 6EE8D
              EQITE                              * 6EE92
              ::                                 * 6EE97
                OBJ_6918D                        * 6EE9C
                3UNROLL                          * 6EEA1
                BINT3                            * 6EEA6
                OBJ_6EEC4                        * 6EEAB
              ;                                  * 6EEB0
              BINT2                              * 6EEB5
              {}N                                * 6EEBA
              TRUE                               * 6EEBF

* refs (3): 68BC5 68BDE 6EEAB
OBJ_6EEC4:
              ::                                 * 6EEC4
                ISTOP@                           * 6EEC9
                #1-                              * 6EECE
                ISTOPSTO                         * 6EED3
              ;                                  * 6EED8
            ;                                    * 6EEDD
            4ROLLROT                             * 6EEE2
            >TCOMP                               * 6EEE7
            3UNROLL                              * 6EEEC
            IT                                   * 6EEF1
            #1+                                  * 6EEF6
            LOOP                                 * 6EEFB
          ;                                      * 6EF00
          DUP                                    * 6EF05
          14PUTLAM                               * 6EF0A
          ROT                                    * 6EF0F
          OVER#>                                 * 6EF14
          NOTcaseDROP                            * 6EF19
          3PICK                                  * 6EF1E
          OBJ_6EDFC                              * 6EF23
          SWAP#-                                 * 6EF28
          OBJ_6819D                              * 6EF2D
          #1-                                    * 6EF32
          3PICKSWAP                              * 6EF37
          NTHCOMPDROP                            * 6EF3C

* refs (1): 69179
OBJ_6EF41:
          ::                                     * 6EF41
            NULL{}                               * 6EF46
            NULLHXS                              * 6EF4B
            ZEROZERO                             * 6EF50
            OBJ_67532                            * 6EF55
          ;                                      * 6EF5A
        ;                                        * 6EF5F

* refs (1): 6EBF4
OBJ_6EF64:
        ::                                       * 6EF64
          DUP                                    * 6EF69

* refs (5): 69987 6E37A 6EBE5 6F13F 6FF3B
OBJ_6EF6E:
          ::                                     * 6EF6E
            DUPTYPELIST?                         * 6EF73
            NOT?SEMI                             * 6EF78
            DUP                                  * 6EF7D
            CARCOMP                              * 6EF82
            DUPTYPEROMP?                         * 6EF87
            case                                 * 6EF8C
            SWAPDROP                             * 6EF91
            DROP                                 * 6EF96
            DUPLENCOMP                           * 6EF9B
            NTHCOMPDROP                          * 6EFA0
          ;                                      * 6EFA5
          DUPUNROT                               * 6EFAA
          OBJ_6B713                              * 6EFAF
          case2drop                              * 6EFB4
          2SKIP                                  * 6EFB9
          4PICK                                  * 6EFBE
          DUPLENCOMP                             * 6EFC3
          14GETLAM                               * 6EFC8
          DUP                                    * 6EFCD
          OBJ_6819D                              * 6EFD2
          SWAP#1-                                * 6EFD7
          14PUTLAM                               * 6EFDC
          #1--                                   * 6EFE1
          2DUP                                   * 6EFE6
          NTHCOMPDROP                            * 6EFEB
          3UNROLL                                * 6EFF0
          #1+                                    * 6EFF5
          2DUP                                   * 6EFFA
          NTHCOMPDROP                            * 6EFFF
          5UNROLL                                * 6F004
          #1+                                    * 6F009
          NTHCOMPDROP                            * 6F00E
          DUP                                    * 6F013
          OBJ_26E61                              * 6F018
          DROP                                   * 6F01D
          ROTROT2DROP                            * 6F022
          ROT                                    * 6F027
          OBJ_67532                              * 6F02C
          OBJ_67E0C                              * 6F031
          OBJ_679B3                              * 6F036
          SWAP                                   * 6F03B
          ::                                     * 6F040
            '                                    * 6F045
            ä                                    * 6F04A
            EQcasedrop                           * 6F04F
            OBJ_65D14                            * 6F054
            'xDER                                * 6F059
            EQcasedrop                           * 6F05E
            OBJ_679B3                            * 6F063
            DUP'                                 * 6F068
            xXROOT                               * 6F06D
            EQ                                   * 6F072
            OVER'                                * 6F077
            xPREDIV                              * 6F07C
            EQOR                                 * 6F081
            SWAP                                 * 6F086
            OBJ_6E2E9                            * 6F08B
            OR                                   * 6F090
            NOT?SEMI                             * 6F095
            RDROP                                * 6F09A
            OBJ_6798C                            * 6F09F
            BINT2                                * 6F0A4
          ;                                      * 6F0A9
          BINT1                                  * 6F0AE
        ;                                        * 6F0B3

* refs (1): 6EDE8
OBJ_6F0B8:
        CON(5)  (*)+5                            * 6F0B8  primitive code object
        ASSEMBLE
        GOSBVL  SUB_67A4A                        * 6F0BD
        D0=D0+  15                               * 6F0C4
        D0=D0+  7                                * 6F0C7
        C=DAT0  B                                * 6F0CA
        RSTK=C                                   * 6F0CD
        D0=D0+  5                                * 6F0CF
        C=DAT0  W                                * 6F0D2
        RSTK=C                                   * 6F0D6
        GOSBVL  POP#                             * 6F0D8
        GOSBVL  SUB_67A3B                        * 6F0DF
        D0=D0-  15                               * 6F0E6
        C=RSTK                                   * 6F0E9
        DAT0=C  9                                * 6F0EB
        D0=D0-  5                                * 6F0EF
        C=RSTK                                   * 6F0F2
        DAT0=C  B                                * 6F0F4
        GOVLNG  L_685CD                          * 6F0F7
        RPL

* refs (1): 6EAE6
OBJ_6F0FE:
        ::                                       * 6F0FE
          OBJ_67E34                              * 6F103
          12GETLAM                               * 6F108
          3PICK                                  * 6F10D
          OBJ_6819D                              * 6F112
          #2-                                    * 6F117
          NTHCOMPDROP                            * 6F11C
          OVER#=                                 * 6F121
          7PUTLAM                                * 6F126
          DUP#0=csedrp                           * 6F12B
          OBJ_6F41E                              * 6F130
          OVER                                   * 6F135
          OBJ_67E54                              * 6F13A
          OBJ_6EF6E                              * 6F13F
          OBJ_2846E                              * 6F144
          EQcasedrop                             * 6F149
          ::                                     * 6F14E
            DROP                                 * 6F153
            7GETLAM                              * 6F158
            case                                 * 6F15D
            OBJ_6F41E                            * 6F162
            DUP                                  * 6F167
            NULL{}                               * 6F16C
            OBJ_67F31                            * 6F171
            DUPZERO                              * 6F176
            OBJ_67F0B                            * 6F17B
            OBJ_67E64                            * 6F180
            OBJ_65D14                            * 6F185
L_6F18A:
            OBJ_679AE                            * 6F18A
            OBJ_6D523                            * 6F18F
            OBJ_67BFC                            * 6F194

* refs (5): 660E3 6CF65 6D046 6E1AE 6E456
OBJ_6F199:
            ::                                   * 6F199
              OBJ_67416                          * 6F19E
              BINT0                              * 6F1A3
            ;                                    * 6F1A8
            OBJ_67BE2                            * 6F1AD
          ;                                      * 6F1B2
          OBJ_2845A                              * 6F1B7
          EQcasedrop                             * 6F1BC
          ::                                     * 6F1C1
            DROPDUP                              * 6F1C6
            OBJ_6F36A                            * 6F1CB
            OBJ_6D1C7                            * 6F1D0
            case                                 * 6F1D5
            OBJ_6F41E                            * 6F1DA
            22Lget                               * 6F1DF
            tokanglesign                         * 6F1E4
            EQUAL                                * 6F1E9
            NOTcaseDROP                          * 6F1EE
            DUP                                  * 6F1F3
            OBJ_2846E                            * 6F1F8
            OBJ_67F31                            * 6F1FD
            OBJ_67E64                            * 6F202
            OBJ_65D14                            * 6F207
            OBJ_65D14                            * 6F20C
            OBJ_6E474                            * 6F211
            9GETLAM                              * 6F216
            #1+                                  * 6F21B
            9PUTLAM                              * 6F220
          ;                                      * 6F225
          OBJ_2708E                              * 6F22A
          case                                   * 6F22F
          ::                                     * 6F234
            OBJ_6F261                            * 6F239
            OVER                                 * 6F23E
            #1=                                  * 6F243
            OVER'                                * 6F248
            OBJ_6DFFD                            * 6F24D
            EQOR                                 * 6F252
            case                                 * 6F257
            3DROP                                * 6F25C

* refs (3): 6E343 6F239 8E4C7
OBJ_6F261:
            ::                                   * 6F261
              BINT2                              * 6F266
              NTHCOMPDROP                        * 6F26B
            ;                                    * 6F270
            EVAL                                 * 6F275
          ;                                      * 6F27A
          OBJ_26BED                              * 6F27F
          DROPSWAPDROP                           * 6F284
          OBJ_6EE65                              * 6F289
          casedrop                               * 6F28E
          ::                                     * 6F293
            2DUP                                 * 6F298
            OBJ_6F360                            * 6F29D
            OVER                                 * 6F2A2
            OBJ_67E54                            * 6F2A7
            DUPLENCOMP                           * 6F2AC
            #1-                                  * 6F2B1
            NTHCOMPDROP                          * 6F2B6
            #0=ITE                               * 6F2BB
            OBJ_6F46E                            * 6F2C0
            DROP                                 * 6F2C5
            DROP                                 * 6F2CA
          ;                                      * 6F2CF
          OBJ_6E2E9                              * 6F2D4
          case2DROP                              * 6F2D9
          7GETLAM                                * 6F2DE
          casedrop                               * 6F2E3
          ::                                     * 6F2E8
            DUP                                  * 6F2ED
            OBJ_6F36A                            * 6F2F2
            OBJ_6D1C7                            * 6F2F7
            NOTcaseDROP                          * 6F2FC
            OBJ_6F315                            * 6F301
            OBJ_6F41E                            * 6F306
          ;                                      * 6F30B
          OBJ_6F46E                              * 6F310

* refs (1): 6F301
OBJ_6F315:
          ::                                     * 6F315
            DUPDUP                               * 6F31A
            OBJ_67E54                            * 6F31F
            TYPELIST?                            * 6F324
            NOTcaseDROP                          * 6F329
            OBJ_6F3C4                            * 6F32E
          ;                                      * 6F333
L_6F338:
          OBJ_6F36A                              * 6F338
          OBJ_679A1                              * 6F33D
          OBJ_679C0                              * 6F342
          OBJ_679A1                              * 6F347
          OBJ_679A1                              * 6F34C
          OBJ_6D523                              * 6F351
          OBJ_67BFC                              * 6F356
        ;                                        * 6F35B
