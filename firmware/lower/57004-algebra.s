* HP 48GX ROM revision R, #57004-#5A01C: Symbolic algebra
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: drop;q_58A0C MEQU? Π'+s Π'*s SYMCOLCT NoIdsInMeta? {RULES\D->} swappargunrot nm=>st addtpsh SYMSHOW SYMEXPAN
* Follows on from the previous file (at #57004 in the original ROM).
        RPL

* refs (4): 2E605 2E65F 2E826 56F4A
nm=>st:
        ::                                       * 57004
          DUPTYPEIDNT?                           * 57009
          ?SKIP                                  * 5700E
          LAM>ID                                 * 57013
          ID>$                                   * 57018
        ;                                        * 5701D

* refs (5): 85EAD 85F2F 85F8E 85FF2 86704
OBJ_57022:
        ::                                       * 57022
          OBJ_56CD1                              * 57027
          pshzer                                 * 5702C
          parg&                                  * 57031
          COLA                                   * 57036
          MetaConcase                            * 5703B
        ;                                        * 57040

* refs (22): 860BA 86150 861A5 86213 86263 862C7 ...
OBJ_57045:
        ::                                       * 57045
          OBJ_56CD1                              * 5704A
          dup                                    * 5704F
        ;                                        * 57054

* refs (1): 571D1
OBJ_57059:
        ::                                       * 57059
          BINT28                                 * 5705E
          ROLL                                   * 57063
          BINT28                                 * 57068
          4GETLAM                                * 5706D
          5GETLAM                                * 57072
          6GETLAM                                * 57077
          9GETLAM                                * 5707C
          10GETLAM                               * 57081
          15GETLAM                               * 57086
          16GETLAM                               * 5708B
          BINT7                                  * 57090
          psh                                    * 57095
          DROP                                   * 5709A
          BINT29                                 * 5709F
          ONE_DO                                 * 570A4
          INDEX@                                 * 570A9
          PUTLAM                                 * 570AE
          LOOP                                   * 570B3
          DROP                                   * 570B8
          20PUTLAM                               * 570BD
          15PUTLAM                               * 570C2
          10PUTLAM                               * 570C7
          9PUTLAM                                * 570CC
          6PUTLAM                                * 570D1
          5PUTLAM                                * 570D6
          21PUTLAM                               * 570DB
        ;                                        * 570E0

* refs (1): C0228
OBJ_570E5:
        ::                                       * 570E5
          OBJ_73230                              * 570EA
          ::                                     * 570EF
            OBJ_57171                            * 570F4
            OBJ_57211                            * 570F9
          ;                                      * 570FE
        ;                                        * 57103

* refs (1): C0410
OBJ_57108:
        ::                                       * 57108
          OBJ_73230                              * 5710D
          ::                                     * 57112
            OBJ_57171                            * 57117
            OBJ_44F4D                            * 5711C
          ;                                      * 57121
        ;                                        * 57126

* refs (1): C031C
OBJ_5712B:
        ::                                       * 5712B
          OBJ_73230                              * 57130
          ::                                     * 57135
            OBJ_57171                            * 5713A
            OBJ_44F6C                            * 5713F
          ;                                      * 57144
        ;                                        * 57149

* refs (1): C06EC
OBJ_5714E:
        ::                                       * 5714E
          OBJ_73230                              * 57153
          ::                                     * 57158
            OBJ_57171                            * 5715D
            OBJ_458CF                            * 57162
          ;                                      * 57167
        ;                                        * 5716C

* refs (6): 45C49 45C6C 570F4 57117 5713A 5715D
OBJ_57171:
        ::                                       * 57171
          OBJ_4EE42                              * 57176
          NOTcase                                * 5717B
          ::                                     * 57180
            BINT21                               * 57185
            ROLLDROP                             * 5718A
            '                                    * 5718F
            OBJ_73594                            * 57194
            BINT21                               * 57199
            UNROLL                               * 5719E
            RDROP                                * 571A3
            ROMPTR  0F1 03E                      * 571A8
          ;                                      * 571B3
          'REVAL                                 * 571B8
          BINT24                                 * 571BD
          ROLLDROP                               * 571C2
          BINT23                                 * 571C7
          UNROLL                                 * 571CC
          OBJ_57059                              * 571D1
          18GETLAM                               * 571D6
          '                                      * 571DB
          Π'SAVEDDEPTH                           * 571E0
          STOLAM                                 * 571E5
          TRUE'                                  * 571EA

Π'EnvOK_571EF:
          LAM     'EnvOK                         * 571EF
          STOLAM                                 * 57202
          DispMenu                               * 57207
        ;                                        * 5720C

* refs (1): 570F9
OBJ_57211:
        ::                                       * 57211

* refs (5): 44F52 44F81 458EE 8AB90 8B5B6
OBJ_57216:
          ::                                     * 57216
            ROMPTR  0F1 001                      * 5721B
            ROMPTR  0F1 00B                      * 57226
            ROMPTR  0F1 003                      * 57231
            BIND                                 * 5723C
          ;                                      * 57241
          ROMPTR  0F1 004                        * 57246
          DUP                                    * 57251
          '                                      * 57256
          OBJ_5135F                              * 5725B
          ROMPTR  0F1 005                        * 57260
          '                                      * 5726B
          NOP                                    * 57270
          %1                                     * 57275
          ROMPTR  0F1 006                        * 5727A
          OBJ_4C314                              * 57285
        ;                                        * 5728A
        NIBHEX  0000                             * 5728F  ..

* sym id -> symb
* refs (3): 20AA2 B6BAD B6BB2
SYMISOL:
        ::                                       * 57293
          ::                                     * 57298
            2DUP                                 * 5729D
            %0_2A2B4                             * 572A2
            3UNROLL                              * 572A7
            BINT1                                * 572AC
            SWAPROT                              * 572B1
            SINNER                               * 572B6
            get1                                 * 572BB
            OBJ_578E8                            * 572C0
            OBJ_57324                            * 572C5
            ABND                                 * 572CA
            NOTcase                              * 572CF
            SETISOLERR                           * 572D4
          ;                                      * 572D9
          DUP#2+PICK                             * 572DE
          OBJ_57676                              * 572E3
          case                                   * 572E8
          SETISOLERR                             * 572ED
          DROP                                   * 572F2
          #1+                                    * 572F7
          PTR     addt:                          * 572FC
          x=                                     * 57301
          get1                                   * 57306
          DROP                                   * 5730B
          CKSYMBN                                * 57310
          uncrunch                               * 57315
          coleval                                * 5731A
        ;                                        * 5731F

* refs (3): 572C5 57626 86DB2
OBJ_57324:
        ::                                       * 57324
          OBJ_57676                              * 57329
          NOTcase                                * 5732E
          DROP2dropf                             * 57333
          OVER                                   * 57338
          #1=case                                * 5733D
          ::                                     * 57342
            DROP                                 * 57347
            2DROP                                * 5734C
            TRUE                                 * 57351
          ;                                      * 57356
          3UNROLL                                * 5735B
          #1-SWAP                                * 57360
          ROTSWAP                                * 57365
          nonopcase                              * 5736A
          2DROP2dropf                            * 5736F
          REQcasedrop                            * 57374
          xFCNAPPLY                              * 57379
          OBJ_5739C                              * 5737E
          OBJ_26F26                              * 57383
          NOTcase                                * 57388
          2DROP2dropf                            * 5738D
          COLA_EVAL                              * 57392
        ;                                        * 57397

* refs (1): 5737E
OBJ_5739C:
        ::                                       * 5739C
          SWAP#1-SWAP                            * 573A1
          4ROLL                                  * 573A6
          CARCOMP                                * 573AB
          NOTROMPcase                            * 573B0
          2DROP2dropf                            * 573B5
          DUP                                    * 573BA
          OBJ_26F26                              * 573BF
          NOTcasedrop                            * 573C4
          2DROP2dropf                            * 573C9
          SWAP                                   * 573CE
          OBJ_5E9E1                              * 573D3
          ?SKIP                                  * 573D8
          ::                                     * 573DD
            4ROLLDROP                            * 573E2
            ROT                                  * 573E7
            #1-                                  * 573EC
            3UNROLL                              * 573F1
          ;                                      * 573F6
          COLA_EVAL                              * 573FB
        ;                                        * 57400

* meta1 meta2 ob1 ob2 -> F
* refs (4): 5736F 5738D 573B5 573C9
2DROP2dropf:
        ::                                       * 57405
          drop;dq                                * 5740A
          DROP2dropf                             * 5740F
        ;                                        * 57414

* meta1 meta2 ob -> F
* refs (2): 57333 5740F
DROP2dropf:
        ::                                       * 57419
          DROPNDROP                              * 5741E
          NDROP                                  * 57423
          FALSE                                  * 57428
        ;                                        * 5742D

* meta1 meta2 ob -> meta1&ob meta2
* refs (4): 57635 5765D 86BB4 86D8F
addtpsh:
        ::                                       * 57432
          SWAP#1+                                * 57437
          psh                                    * 5743C
        ;                                        * 57441

* refs (1): 1AC89
OBJ_57446:
        ROMPTR  0F0 0C7                          * 57446

* refs (2): 1A982 1ADDB
OBJ_57451:
        ROMPTR  0F0 0C9                          * 57451

* refs (1): 1AEF2
OBJ_5745C:
        ROMPTR  0F0 0CA                          * 5745C

* refs (1): 1AFEB
OBJ_57467:
        ROMPTR  0F0 0CB                          * 57467

* refs (1): 1B0D7
OBJ_57472:
        ROMPTR  0F0 0CC                          * 57472

* refs (1): 86D35
OBJ_5747D:
        ROMPTR  0F0 0CD                          * 5747D

* refs (1): 1AA0C
OBJ_57488:
        ::                                       * 57488
          OBJ_57658                              * 5748D
          xNEG                                   * 57492
        ;                                        * 57497

* refs (1): 1B2BE
OBJ_5749C:
        ::                                       * 5749C
          OBJ_57658                              * 574A1
          xINV                                   * 574A6
        ;                                        * 574AB

* refs (1): 1B937
OBJ_574B0:
        ROMPTR  0F0 0CE                          * 574B0

* refs (1): 1B981
OBJ_574BB:
        ::                                       * 574BB
          OBJ_57658                              * 574C0
          xEXP                                   * 574C5
        ;                                        * 574CA

* refs (1): 1B4E8
OBJ_574CF:
        ROMPTR  0F0 0CF                          * 574CF

* refs (1): 1B541
OBJ_574DA:
        ROMPTR  0F0 0D0                          * 574DA

* refs (1): 1B59A
OBJ_574E5:
        ROMPTR  0F0 0D1                          * 574E5

* refs (1): 1B5E9
OBJ_574F0:
        ROMPTR  0F0 0D2                          * 574F0

* refs (1): 1B638
OBJ_574FB:
        ROMPTR  0F0 0D3                          * 574FB

* refs (1): 1B687
OBJ_57506:
        ROMPTR  0F0 0D4                          * 57506

* refs (1): 1B6D6
OBJ_57511:
        ::                                       * 57511
          OBJ_57658                              * 57516
          xSIN                                   * 5751B
        ;                                        * 57520

* refs (1): 1B761
OBJ_57525:
        ::                                       * 57525
          OBJ_57658                              * 5752A
          xCOS                                   * 5752F
        ;                                        * 57534

* refs (1): 1B7CE
OBJ_57539:
        ::                                       * 57539
          OBJ_57658                              * 5753E
          xTAN                                   * 57543
        ;                                        * 57548

* refs (1): 1B81D
OBJ_5754D:
        ::                                       * 5754D
          OBJ_57658                              * 57552
          xSINH                                  * 57557
        ;                                        * 5755C

* refs (1): 1B862
OBJ_57561:
        ::                                       * 57561
          OBJ_57658                              * 57566
          xCOSH                                  * 5756B
        ;                                        * 57570

* refs (1): 1B8D4
OBJ_57575:
        ::                                       * 57575
          OBJ_57658                              * 5757A
          xTANH                                  * 5757F
        ;                                        * 57584

* refs (1): 1B46C
OBJ_57589:
        ::                                       * 57589
          OBJ_57630                              * 5758E
          xSQRT                                  * 57593
          OBJ_57856                              * 57598
          OBJ_5760D                              * 5759D
        ;                                        * 575A2

* refs (1): 1B3BA
OBJ_575A7:
        ::                                       * 575A7
          OBJ_57658                              * 575AC
          xSQ                                    * 575B1
        ;                                        * 575B6

* refs (1): 1B9F8
OBJ_575BB:
        ::                                       * 575BB
          OBJ_57658                              * 575C0
          xALOG                                  * 575C5
        ;                                        * 575CA

* refs (1): 1BAB4
OBJ_575CF:
        ::                                       * 575CF
          OBJ_57658                              * 575D4
          xEXPM                                  * 575D9
        ;                                        * 575DE

* refs (1): 1BA6F
OBJ_575E3:
        ROMPTR  0F0 0D5                          * 575E3

* refs (1): 1AAAA
OBJ_575EE:
        ::                                       * 575EE
          OBJ_57658                              * 575F3
          xCONJ                                  * 575F8
        ;                                        * 575FD

* refs (1): 1BAEA
OBJ_57602:
        ROMPTR  0F0 0D6                          * 57602

* refs (21): 5759D 5764E 5766C 86BCD 86C3B 86C9A ...
OBJ_5760D:
        ::                                       * 5760D
          RDROP                                  * 57612
          psh                                    * 57617
          #1-SWAP                                * 5761C
          COLA                                   * 57621
          OBJ_57324                              * 57626
        ;                                        * 5762B

* refs (10): 5758E 86E70 86E98 86EBB 86EE3 86F06 ...
OBJ_57630:
        ::                                       * 57630
          addtpsh                                * 57635
          'R                                     * 5763A
          SWAP#1+                                * 5763F
          PRSOL?                                 * 57644
          case                                   * 57649
          OBJ_5760D                              * 5764E
        ;                                        * 57653

* refs (13): 5748D 574A1 574C0 57516 5752A 5753E ...
OBJ_57658:
        ::                                       * 57658
          addtpsh                                * 5765D
          'RRDROP                                * 57662
          SWAP#1+                                * 57667
          OBJ_5760D                              * 5766C
        ;                                        * 57671

* refs (8): 572E3 57329 5A1D0 86BAA 86BF0 86C5E ...
OBJ_57676:
        ::                                       * 57676
          OVER                                   * 5767B
          BEGIN                                  * 57680
          DUP#0=case                             * 57685

* meta ob -> meta ob flag
ObInMeta?:
          OBJ_576CB                              * 5768A
          DUP                                    * 5768F
          #3+PICK                                * 57694
          3PICK                                  * 57699
          EQUALcase                              * 5769E
          OBJ_576B7                              * 576A3
          #1-                                    * 576A8
          AGAIN                                  * 576AD
        ;                                        * 576B2

* refs (2): 576A3 584DA
OBJ_576B7:
        ::                                       * 576B7
          DROPRDROP                              * 576BC
          TRUE                                   * 576C1
        ;                                        * 576C6

* refs (2): 5768A 584FD
OBJ_576CB:
        ::                                       * 576CB
          DROPRDROP                              * 576D0
          FALSE                                  * 576D5
        ;                                        * 576DA

* refs (2): 86F10 86F5B
OBJ_576DF:
        ::                                       * 576DF

{PI,I,*}:
          {                                      * 576E4
            xPI                                  * 576E9
            xi                                   * 576EE
            x*                                   * 576F3
          }                                      * 576F8
          INNERCOMP                              * 576FD
          OBJ_57888                              * 57702
          SWAP#1+                                * 57707
          meta*                                  * 5770C
        ;                                        * 57711

* refs (6): 86D5D 86E3E 86E7A 86F38 86F7E 86FC4
OBJ_57716:
        ::                                       * 57716

{2,Pi,*,I,*}:
          {                                      * 5771B
            %2                                   * 57720
            xPI                                  * 57725
            x*                                   * 5772A
            xi                                   * 5772F
            x*                                   * 57734
          }                                      * 57739
          INNERCOMP                              * 5773E
          OBJ_57888                              * 57743
          SWAP#1+                                * 57748
          meta*                                  * 5774D
        ;                                        * 57752

* refs (1): 86ECA
OBJ_57757:
        ::                                       * 57757
          RAD?                                   * 5775C
          case                                   * 57761
          ::                                     * 57766
            %2                                   * 5776B
            '                                    * 57770
            xPI                                  * 57775
            'x*                                  * 5777A
            OBJ_57888                            * 5777F
            'x*                                  * 57784
            BINT5                                * 57789
          ;                                      * 5778E
          DEG?                                   * 57793
          ITE                                    * 57798
          %360                                   * 5779D
          %400                                   * 577A2
          OBJ_57888                              * 577A7
          '                                      * 577AC
          x*                                     * 577B1
          BINT3                                  * 577B6
        ;                                        * 577BB

* refs (2): 86EA2 86EED
OBJ_577C0:
        ::                                       * 577C0
          RAD?                                   * 577C5
          case                                   * 577CA
          ::                                     * 577CF
            '                                    * 577D4
            xPI                                  * 577D9
            OBJ_57888                            * 577DE
            'x*                                  * 577E3
            BINT3                                * 577E8
          ;                                      * 577ED
          DEG?                                   * 577F2
          ITE                                    * 577F7
          %180                                   * 577FC
          %200                                   * 57801
          OBJ_57888                              * 57806
          'x*                                    * 5780B
          BINT3                                  * 57810
        ;                                        * 57815

* refs (2): 86EA7 86F15
OBJ_5781A:
        ::                                       * 5781A
          %-1                                    * 5781F
          psh1&rev                               * 57824
          3PICK                                  * 57829
          psh1&rev                               * 5782E
          psh                                    * 57833
          PTR     addt2:                         * 57838
          x^                                     * 5783D
          x*                                     * 57842
          pshtop&                                * 57847
          meta+                                  * 5784C
        ;                                        * 57851

* refs (4): 57598 86DE9 86EC5 86F33
OBJ_57856:
        ::                                       * 57856
          OBJ_578A1                              * 5785B
          BINT1                                  * 57860
          pshtop&                                * 57865
          meta*                                  * 5786A
        ;                                        * 5786F

* refs (5): 86D62 86ECF 86EF2 86F3D 86F60
OBJ_57874:
        ::                                       * 57874
          top&                                   * 57879
          meta+                                  * 5787E
        ;                                        * 57883

* refs (6): 57702 57743 5777F 577A7 577DE 57806
OBJ_57888:
        ::                                       * 57888
          TRUE                                   * 5788D
          Π'ni                                   * 57892
          EVAL                                   * 57897
        ;                                        * 5789C

* refs (1): 5785B
OBJ_578A1:
        ::                                       * 578A1
          TRUE                                   * 578A6
          Π'ns                                   * 578AB
          EVAL                                   * 578B0
        ;                                        * 578B5

* refs (1): 5790B
OBJ_578BA:
        {                                        * 578BA
          Π'ni                                   * 578BF
          Π'ns                                   * 578C4
        }                                        * 578C9

* refs (2): 57892 578BF
Π'ni:
        LAM     'ni                              * 578CE

* refs (2): 578AB 578C4
Π'ns:
        LAM     'ns                              * 578DB

* refs (1): 572C0
OBJ_578E8:
        ::                                       * 578E8
          '                                      * 578ED
          OBJ_5791A                              * 578F2
          TOTEMPOB                               * 578F7
          '                                      * 578FC
          OBJ_57938                              * 57901
          TOTEMPOB                               * 57906
          OBJ_578BA                              * 5790B
          BIND                                   * 57910
        ;                                        * 57915

* refs (1): 578F2
OBJ_5791A:
        CODE                                     * 5791A  20 nibbles
          GOSBVL  SUB_57956                      * 57924  inline data follows

n0:
          NIBHEX  84E2020E60303                  * 5792B  H. à..
        ENDCODE                                  * 57938

* refs (1): 57901
OBJ_57938:
        CODE                                     * 57938  20 nibbles
          GOSBVL  SUB_57956                      * 57942  inline data follows

s0:
          NIBHEX  84E2020370303                  * 57949  H. 0..
        ENDCODE                                  * 57956
        ASSEMBLE

* refs (2): 57924 57942
SUB_57956:
        C=RSTK                                   * 57956
        CD1EX                                    * 57958
        RSTK=C                                   * 5795B
        D1=D1+  5                                * 5795D
        C=DAT1  S                                * 57960
        D1=D1+  4                                * 57964
        C=DAT1  4                                * 57967
        C=C-1   S                                * 5796B
        C=C-1   S                                * 5796E
        C=C-1   S                                * 57971
        GONC    L_57985                          * 57974
        P=      3                                * 57977
        CSL     WP                               * 57979
        CSL     WP                               * 5797C
        P=      0                                * 5797F
        LC(2)   #30                              * 57981
L_57985:
        A=C     A                                * 57985
        LC(4)   #3030                            * 57987
        P=      3                                * 5798D
        C=A-C   WP                               * 5798F
        P=      0                                * 57992
        CPEX    2                                * 57994
        CPEX    0                                * 57998
        CPEX    1                                * 5799C
        SETDEC                                   * 579A0
        C=C+1   B                                * 579A2
        SETHEX                                   * 579A5
        CPEX    1                                * 579A7
        CPEX    0                                * 579AB
        CPEX    2                                * 579AF
        A=C     A                                * 579B3
        LC(4)   #3030                            * 579B5
        A=A+C   A                                * 579BB
        ?C=A    B                                * 579BD
        GOYES   L_579E9                          * 579C0
        DAT1=A  4                                * 579C2
        LC(2)   #03                              * 579C6
L_579CA:
        D1=D1-  4                                * 579CA
        DAT1=C  2                                * 579CD
        D1=D1-  5                                * 579D1
        C=RSTK                                   * 579D4
        CD1EX                                    * 579D6
        DAT1=C  A                                * 579D9
        LC(5)   TOTEMPOB                         * 579DC
        A=C     A                                * 579E3
        PC=(A)                                   * 579E5
L_579E9:
        ASR     A                                * 579E9
        ASR     A                                * 579EB
        DAT1=A  B                                * 579ED
        LC(2)   #02                              * 579F0
        GOTO    L_579CA                          * 579F4
        BSS     20                               * 579F8
        RPL

* symf -> symf
* refs (4): 20A58 20A62 20A6C B6C13
SYMEXPAN:
        ::                                       * 57A0C
          EXPLODE                                * 57A11
          BINT1                                  * 57A16
          OVER#=case                             * 57A1B
          IMPLODE                                * 57A20
          pshzer                                 * 57A25
          pshzer                                 * 57A2A
          expan                                  * 57A2F
          IMPLODE                                * 57A34
          CK0NOLASTWD                            * 57A39
          ?ATTNQUIT                              * 57A3E
        ;                                        * 57A43

* meta1 meta2 meta3 -> meta
* refs (1): 57A2F
expan:
        ::                                       * 57A48
          BEGIN                                  * 57A4D
          ATTNFLG@                               * 57A52
          #0<>                                   * 57A57
          case                                   * 57A5C
          ::                                     * 57A61
            RDROP                                * 57A66
            top&                                 * 57A6B
            pshtop&                              * 57A70
          ;                                      * 57A75
          expan1                                 * 57A7A
          unrot                                  * 57A7F
          over&                                  * 57A84
          DUP#0=case                             * 57A89
          drop;q_58A0C                           * 57A8E
          larg                                   * 57A93
          AGAIN                                  * 57A98
        ;                                        * 57A9D

* meta -> meta1 meta2
* refs (1): 57A7A
expan1:
        ::                                       * 57AA2
          ?expan^                                * 57AA7
          AEQ1stcase                             * 57AAC
          xSQ                                    * 57AB1

expansq:
          ::                                     * 57AB6
            OBJ_57CDF                            * 57ABB
            #1-SWAP                              * 57AC0
            COLA                                 * 57AC5
            OBJ_57C3A                            * 57ACA
          ;                                      * 57ACF
          MetaD->                                * 57AD4
          Meta<-D                                * 57AD9
          MetaE^                                 * 57ADE
          MetaL*                                 * 57AE3
          ?expanneginv                           * 57AE8
          Meta->()                               * 57AED
          ?expanapp                              * 57AF2
          +B21;PullB[1];<1>                      * 57AF7
        ;                                        * 57AFC

* refs (1): 57AF2
?expanapp:
        ::                                       * 57B01
          M1stFNCcase                            * 57B06
          OBJ_57B15                              * 57B0B
        ;                                        * 57B10

* refs (1): 57B0B
OBJ_57B15:
        ::                                       * 57B15
          4PICK                                  * 57B1A
          OBJ_26F42                              * 57B1F
          NOTcaseDROP                            * 57B24
          COLA_EVAL                              * 57B29
        ;                                        * 57B2E

* refs (2): 57AF7 57B5D
+B21;PullB[1];<1>:
        ::                                       * 57B33
          top&                                   * 57B38
          #1-SWAP                                * 57B3D
          BINT1                                  * 57B42
        ;                                        * 57B47

* refs (1): 57AE8
?expanneginv:
        CON(5)  (*)+5                            * 57B4C  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 57B51  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  67000                            * 57B58  pattern: op5 op6
        CON(5)  +B21;PullB[1];<1>                * 57B5D  run if it matches
        NIBHEX  F                                * 57B62  end of the rules
        RPL

* refs (1): 57AA7
?expan^:
        ::                                       * 57B63
          M1st^case                              * 57B68
          OBJ_57B77                              * 57B6D
        ;                                        * 57B72

* refs (1): 57B6D
OBJ_57B77:
        ::                                       * 57B77
          3PICK                                  * 57B7C
          TYPE                                   * 57B81
          TYPEREAL                               * 57B86
          #<>                                    * 57B8B
          ?SEMI                                  * 57B90
          3PICK                                  * 57B95
          num0=case                              * 57B9A
          ::                                     * 57B9F
            DROPRDROP                            * 57BA4
            NDROP                                * 57BA9
            %1                                   * 57BAE
            BINT1                                * 57BB3
          ;                                      * 57BB8
          num1=case                              * 57BBD
          ::                                     * 57BC2
            DROPRDROP                            * 57BC7
            delB[1-2]                            * 57BCC
          ;                                      * 57BD1
          num2=case                              * 57BD6
          ::                                     * 57BDB
            RDROPCOLA                            * 57BE0
            OBJ_57C3A                            * 57BE5
          ;                                      * 57BEA
          NXTPOT%                                * 57BEF
          NOTcaseDROP                            * 57BF4
          RDROP                                  * 57BF9
          SWAP                                   * 57BFE
          dvarlsBIND                             * 57C03
          4ROLLDROP                              * 57C08
          3UNROLL                                * 57C0D
          dup                                    * 57C12
          delB[1-2]                              * 57C17
          1GETABND                               * 57C1C
          ?SKIP                                  * 57C21
          metainv                                * 57C26
          pshtop&                                * 57C2B
          meta*                                  * 57C30
        ;                                        * 57C35

* refs (2): 57ACA 57BE5
OBJ_57C3A:
        ::                                       * 57C3A
          DROP                                   * 57C3F
          delB[1-2]                              * 57C44
          M1st+case                              * 57C49
          expansum^                              * 57C4E
          M1st-case                              * 57C53
          expansum^                              * 57C58
          dup                                    * 57C5D
          top&                                   * 57C62
          meta*                                  * 57C67
        ;                                        * 57C6C

* refs (2): 57C4E 57C58
expansum^:
        ::                                       * 57C71
          pshzer                                 * 57C76
          pullpsh1&                              * 57C7B
          pshzerpsharg                           * 57C80
          dup                                    * 57C85
          OBJ_57CDF                              * 57C8A
          %2                                     * 57C8F
          psh1&                                  * 57C94
          unrot                                  * 57C99
          meta*                                  * 57C9E
          psh                                    * 57CA3
          dup                                    * 57CA8
          unrot                                  * 57CAD
          top&                                   * 57CB2
          meta*                                  * 57CB7
          psh                                    * 57CBC
          over&                                  * 57CC1
          overev&                                * 57CC6
          top&                                   * 57CCB
          OBJ_57CDF                              * 57CD0
          meta+                                  * 57CD5
        ;                                        * 57CDA

* refs (3): 57ABB 57C8A 57CD0
OBJ_57CDF:
        ::                                       * 57CDF
          PTR     addt2:                         * 57CE4
          %2                                     * 57CE9
          x^                                     * 57CEE
        ;                                        * 57CF3

* % -> flag %' T % -> % F
* refs (1): 57BEF
NXTPOT%:
        CON(5)  (*)+5                            * 57CF8  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 57CFD
        C=DAT1  A                                * 57D04
        CD1EX                                    * 57D07
        D1=D1+  5                                * 57D0A
        A=DAT1  W                                * 57D0D
        D1=C                                     * 57D11
        LC(3)   #011                             * 57D14
        P=      3                                * 57D19
        SETDEC                                   * 57D1B
L_57D1D:
        ?A#0    P                                * 57D1D
        GOYES   L_57D2F                          * 57D20
        ?C=A    X                                * 57D22
        GOYES   L_57D34                          * 57D25
        P=P+1                                    * 57D27
        C=C-1   X                                * 57D29
        GONC    L_57D1D                          * 57D2C
L_57D2F:
        ?C#A    X                                * 57D2F
        GOYES   L_57D78                          * 57D32
L_57D34:
        C=0     M                                * 57D34
        C=C+1   P                                * 57D37
        A=A-C   M                                * 57D3A
        P=      14                               * 57D3D
        ?A#0    P                                * 57D3F
        GOYES   L_57D4A                          * 57D42
        A=A-1   X                                * 57D44
        ASL     M                                * 57D47
L_57D4A:
        P=      0                                * 57D4A
        SETHEX                                   * 57D4C
        LC(5)   TRUE                             * 57D4E
        ?A=0    S                                * 57D55
        GOYES   L_57D61                          * 57D58
        LC(5)   FALSE                            * 57D5A
L_57D61:
        DAT1=C  A                                * 57D61
        GOSBVL  PUSH%                            * 57D64
        LC(5)   TRUE                             * 57D6B
        A=C     A                                * 57D72
        PC=(A)                                   * 57D74
L_57D78:
        P=      0                                * 57D78
        SETHEX                                   * 57D7A
        GOSBVL  GETPTR                           * 57D7C
        LC(5)   FALSE                            * 57D83
        A=C     A                                * 57D8A
        PC=(A)                                   * 57D8C
        RPL

* symf -> symf
* refs (6): 20A24 20A2E 20A38 84E45 9F0ED B6BF9
SYMCOLCT:
        ::                                       * 57D90
          uncrunch                               * 57D95
          colct                                  * 57D9A
        ;                                        * 57D9F

* symf -> symf
* refs (1): 57D9A
colct:
        ::                                       * 57DA4
          EXPLODE                                * 57DA9
          pshzer                                 * 57DAE
          colfac                                 * 57DB3
          pshzer                                 * 57DB8
          colrev                                 * 57DBD
          ATTNFLG@                               * 57DC2
          #0<>                                   * 57DC7
          case                                   * 57DCC
          ::                                     * 57DD1
            CKSYMBN                              * 57DD6
            CK0NOLASTWD                          * 57DDB
            ?ATTNQUIT                            * 57DE0
          ;                                      * 57DE5
          pshzer                                 * 57DEA
          colunfac                               * 57DEF
          SYMBN                                  * 57DF4
          COLA                                   * 57DF9
          coleval                                * 57DFE
        ;                                        * 57E03

* meta1 meta2 -> meta'
* refs (1): 57DBD
colrev:
        ::                                       * 57E08
          BEGIN                                  * 57E0D
          DUP#0=case                             * 57E12
          drop;q_58A0C                           * 57E17
          ATTNFLG@                               * 57E1C
          #0<>                                   * 57E21
          case                                   * 57E26
          ::                                     * 57E2B
            DUP#0_DO                             * 57E30
            pullrev1&                            * 57E35
            LOOP                                 * 57E3A
            COLA                                 * 57E3F
            drop;q_58A0C                         * 57E44
          ;                                      * 57E49
          M1st+case                              * 57E4E
          OBJ_580C7                              * 57E53
          M1st*case                              * 57E58
          OBJ_57E71                              * 57E5D
          pullrev1&                              * 57E62
          AGAIN                                  * 57E67
        ;                                        * 57E6C

* refs (1): 57E5D
OBJ_57E71:
        ::                                       * 57E71
          SWAPDROP#1-                            * 57E76
          psh                                    * 57E7B
          larg                                   * 57E80
          BINT0                                  * 57E85
          rot                                    * 57E8A
          parg&                                  * 57E8F
          unrot                                  * 57E94
          count*                                 * 57E99
          #1+                                    * 57E9E
          {                                      * 57EA3
            Π'*s                                 * 57EA8
          }                                      * 57EAD
          BIND                                   * 57EB2
          psh                                    * 57EB7
          count*                                 * 57EBC
          Π'*s                                   * 57EC1
          #+                                     * 57EC6
          '                                      * 57ECB
          Π'*s                                   * 57ED0
          STO                                    * 57ED5
          BINT0                                  * 57EDA
          unrot                                  * 57EDF
          COLA                                   * 57EE4
          OBJ_57F00                              * 57EE9
        ;                                        * 57EEE

* refs (6): 57EA8 57EC1 57ED0 5805E 58086 58095
Π'*s:
        LAM     '*s                              * 57EF3

* refs (2): 57EE9 57FE6
OBJ_57F00:
        ::                                       * 57F00
          pick1#0=case                           * 57F05
          OBJ_58045                              * 57F0A
          swappargunrot                          * 57F0F
          NoIdsInMeta?                           * 57F14
          '                                      * 57F19
          ::                                     * 57F1E
            pshtop&                              * 57F23
            COLA                                 * 57F28
            OBJ_58045                            * 57F2D
          ;                                      * 57F32
          '                                      * 57F37
          OBJ_57F64                              * 57F3C
          COLARPITE                              * 57F41
        ;                                        * 57F46

* meta1 meta2 -> M_rest meta2 M_last
* refs (4): 57F0F 57F87 58165 581BF
swappargunrot:
        ::                                       * 57F4B
          psh                                    * 57F50
          pshzerpsharg                           * 57F55
          unrot                                  * 57F5A
        ;                                        * 57F5F

* refs (3): 57F3C 58013 5803B
OBJ_57F64:
        ::                                       * 57F64
          pick1#0=case                           * 57F69
          ::                                     * 57F6E
            top&                                 * 57F73
            COLA                                 * 57F78
            OBJ_58045                            * 57F7D
          ;                                      * 57F82
          swappargunrot                          * 57F87
          NoIdsInMeta?                           * 57F8C
          case                                   * 57F91
          ::                                     * 57F96
            psh                                  * 57F9B
            roll2top&                            * 57FA0
            roll2top&                            * 57FA5
            COLA                                 * 57FAA
            OBJ_58045                            * 57FAF
          ;                                      * 57FB4
          OBJ_582BE                              * 57FB9
          case                                   * 57FBE
          ::                                     * 57FC3
            OBJ_58081                            * 57FC8
            OBJ_582E6                            * 57FCD
            4roll                                * 57FD2
            top&                                 * 57FD7
            unrot                                * 57FDC
            COLA                                 * 57FE1
            OBJ_57F00                            * 57FE6
          ;                                      * 57FEB
          OBJ_58313                              * 57FF0
          case                                   * 57FF5
          ::                                     * 57FFA
            5roll                                * 57FFF
            top&                                 * 58004
            4unroll                              * 58009
            COLA                                 * 5800E
            OBJ_57F64                            * 58013
          ;                                      * 58018
          psh                                    * 5801D
          5roll                                  * 58022
          top&                                   * 58027
          4unroll                                * 5802C
          rotswap                                * 58031
          COLA                                   * 58036
          OBJ_57F64                              * 5803B
        ;                                        * 58040

* refs (4): 57F0A 57F2D 57F7D 57FAF
OBJ_58045:
        ::                                       * 58045
          top&                                   * 5804A
          pshtop&                                * 5804F
          top&                                   * 58054
          'x*                                    * 58059
          Π'*s                                   * 5805E
          ABND                                   * 58063
          NDUPN                                  * 58068
          top&                                   * 5806D
          psh                                    * 58072
          AGAIN                                  * 58077
        ;                                        * 5807C

* refs (1): 57FC8
OBJ_58081:
        ::                                       * 58081
          Π'*s                                   * 58086
          #1-                                    * 5808B
          '                                      * 58090
          Π'*s                                   * 58095
          STO                                    * 5809A
        ;                                        * 5809F

* refs (1): 58200
OBJ_580A4:
        ::                                       * 580A4
          Π'+s                                   * 580A9
          #1-                                    * 580AE
          '                                      * 580B3
          Π'+s                                   * 580B8
          STO                                    * 580BD
        ;                                        * 580C2

* refs (1): 57E53
OBJ_580C7:
        ::                                       * 580C7
          SWAPDROP#1-                            * 580CC
          psh                                    * 580D1
          larg                                   * 580D6
          BINT0                                  * 580DB
          rot                                    * 580E0
          parg&                                  * 580E5
          unrot                                  * 580EA
          count+                                 * 580EF
          #1+                                    * 580F4

{'+s}:
          {                                      * 580F9
            Π'+s                                 * 580FE
          }                                      * 58103
          BIND                                   * 58108
          psh                                    * 5810D
          count+                                 * 58112
          Π'+s                                   * 58117
          #+                                     * 5811C
          '                                      * 58121
          Π'+s                                   * 58126
          STO                                    * 5812B
          BINT0                                  * 58130
          unrot                                  * 58135
          COLA                                   * 5813A
          OBJ_58156                              * 5813F
        ;                                        * 58144

* refs (6): 580A9 580B8 580FE 58117 58126 5829B
Π'+s:
        LAM     '+s                              * 58149

* refs (2): 5813F 5821E
OBJ_58156:
        ::                                       * 58156
          pick1#0=case                           * 5815B
          OBJ_5827D                              * 58160
          swappargunrot                          * 58165
          NoIdsInMeta?                           * 5816A
          case                                   * 5816F
          ::                                     * 58174
            pshtop&                              * 58179
            COLA                                 * 5817E
            OBJ_5827D                            * 58183
          ;                                      * 58188
          COLA                                   * 5818D
          OBJ_5819C                              * 58192
        ;                                        * 58197

* refs (3): 58192 5824B 58273
OBJ_5819C:
        ::                                       * 5819C
          pick1#0=case                           * 581A1
          ::                                     * 581A6
            top&                                 * 581AB
            COLA                                 * 581B0
            OBJ_5827D                            * 581B5
          ;                                      * 581BA
          swappargunrot                          * 581BF
          NoIdsInMeta?                           * 581C4
          case                                   * 581C9
          ::                                     * 581CE
            psh                                  * 581D3
            roll2top&                            * 581D8
            roll2top&                            * 581DD
            COLA                                 * 581E2
            OBJ_5827D                            * 581E7
          ;                                      * 581EC
          OBJ_583C7                              * 581F1
          case                                   * 581F6
          ::                                     * 581FB
            OBJ_580A4                            * 58200
            OBJ_5848A                            * 58205
            4roll                                * 5820A
            top&                                 * 5820F
            unrot                                * 58214
            COLA                                 * 58219
            OBJ_58156                            * 5821E
          ;                                      * 58223
          OBJ_583EF                              * 58228
          case                                   * 5822D
          ::                                     * 58232
            5roll                                * 58237
            top&                                 * 5823C
            4unroll                              * 58241
            COLA                                 * 58246
            OBJ_5819C                            * 5824B
          ;                                      * 58250
          psh                                    * 58255
          5roll                                  * 5825A
          top&                                   * 5825F
          4unroll                                * 58264
          rotswap                                * 58269
          COLA                                   * 5826E
          OBJ_5819C                              * 58273
        ;                                        * 58278

* refs (4): 58160 58183 581B5 581E7
OBJ_5827D:
        ::                                       * 5827D
          top&                                   * 58282
          pshtop&                                * 58287
          top&                                   * 5828C
          '                                      * 58291
          x+                                     * 58296
          Π'+s                                   * 5829B
          ABND                                   * 582A0
          NDUPN                                  * 582A5
          top&                                   * 582AA
          psh                                    * 582AF
          AGAIN                                  * 582B4
        ;                                        * 582B9

* refs (1): 57FB9
OBJ_582BE:
        ::                                       * 582BE
          OBJ_58620                              * 582C3
          rot                                    * 582C8
          OBJ_58620                              * 582CD
          rot                                    * 582D2
          COLA                                   * 582D7
          MEQU?                                  * 582DC
        ;                                        * 582E1

* refs (1): 57FCD
OBJ_582E6:
        ::                                       * 582E6
          NDROP                                  * 582EB
          unrot                                  * 582F0
          psh                                    * 582F5
          2top&                                  * 582FA
          PTR     addt2:                         * 582FF
          x+                                     * 58304
          x^                                     * 58309
        ;                                        * 5830E

* refs (1): 57FF0
OBJ_58313:
        ::                                       * 58313
          MetaLess?                              * 58318
          '                                      * 5831D
          ::                                     * 58322
            OBJ_58359                            * 58327
            TRUE                                 * 5832C
          ;                                      * 58331
          '                                      * 58336
          ::                                     * 5833B
            OBJ_58359                            * 58340
            FALSE                                * 58345
          ;                                      * 5834A
          COLARPITE                              * 5834F
        ;                                        * 58354

* refs (2): 58327 58340
OBJ_58359:
        ::                                       * 58359
          unrot                                  * 5835E
          psh                                    * 58363
          OVER                                   * 58368
          %1                                     * 5836D
          EQITE                                  * 58372
          2DROP                                  * 58377
          ::                                     * 5837C
            top&                                 * 58381
            '                                    * 58386
            x^                                   * 5838B
            SWAP#1+                              * 58390
          ;                                      * 58395
          unrot                                  * 5839A
          psh                                    * 5839F
          %1                                     * 583A4
          MEQ1stcase                             * 583A9
          2DROP                                  * 583AE
          top&                                   * 583B3
          PTR     addt:                          * 583B8
          x^                                     * 583BD
        ;                                        * 583C2

* refs (1): 581F1
OBJ_583C7:
        ::                                       * 583C7
          OBJ_5863E                              * 583CC
          rot                                    * 583D1
          OBJ_5863E                              * 583D6
          rot                                    * 583DB
          COLA                                   * 583E0
          MEQU?                                  * 583E5
        ;                                        * 583EA

* refs (1): 58228
OBJ_583EF:
        ::                                       * 583EF
          MetaLess?                              * 583F4
          case                                   * 583F9
          ::                                     * 583FE
            OBJ_58421                            * 58403
            TRUE                                 * 58408
          ;                                      * 5840D
          OBJ_58421                              * 58412
          FALSE                                  * 58417
        ;                                        * 5841C

* refs (2): 58403 58412
OBJ_58421:
        ::                                       * 58421
          unrot                                  * 58426
          psh                                    * 5842B
          OVER                                   * 58430
          %1                                     * 58435
          EQITE                                  * 5843A

drop2;delB[1]:
          ::                                     * 5843F
            2DROP                                * 58444
            SWAPDROP#1-                          * 58449
          ;                                      * 5844E
          pshtop&                                * 58453
          unrot                                  * 58458
          psh                                    * 5845D
          %1                                     * 58462
          MEQ1stcase                             * 58467
          ::                                     * 5846C
            2DROP                                * 58471
            SWAPDROP#1-                          * 58476
          ;                                      * 5847B
          pshtop&                                * 58480
        ;                                        * 58485

* refs (1): 58205
OBJ_5848A:
        ::                                       * 5848A
          NDROP                                  * 5848F
          unrot                                  * 58494
          pshtop&                                * 58499
          PTR     addt:                          * 5849E
          x+                                     * 584A3
          pshtop&                                * 584A8
        ;                                        * 584AD

* meta1 meta2 -> meta1 meta2 flag
* refs (8): 56142 56179 56255 562B4 582DC 583E5 ...
MEQU?:
        ::                                       * 584B2
          DUP                                    * 584B7
          #2+PICK                                * 584BC
          OVER#=                                 * 584C1
          NOTcaseFALSE                           * 584C6
          DUP                                    * 584CB
          BEGIN                                  * 584D0
          DUP#0=case                             * 584D5
          OBJ_576B7                              * 584DA
          2DUP#+                                 * 584DF
          #3+PICK                                * 584E4
          OVER                                   * 584E9
          #3+PICK                                * 584EE
          EQUAL                                  * 584F3
          NOTcase                                * 584F8
          OBJ_576CB                              * 584FD
          #1-                                    * 58502
          AGAIN                                  * 58507
        ;                                        * 5850C

* meta1 meta2 -> meta1 meta2 flag
* refs (2): 58318 583F4
MetaLess?:
        ::                                       * 58511
          MetaMore?                              * 58516
          NOT                                    * 5851B
        ;                                        * 58520

* meta1 meta2 -> meta1 meta2 flag
* refs (1): 58516
MetaMore?:
        ::                                       * 58525
          DUP                                    * 5852A
          #2+PICK                                * 5852F
          2DUP                                   * 58534
          #<>case                                * 58539

over;<(2s)?:
          ::                                     * 5853E
            OVER                                 * 58543
            #<                                   * 58548
          ;                                      * 5854D
          BEGIN                                  * 58552
          2DUP                                   * 58557
          #+                                     * 5855C
          #3+PICK                                * 58561
          OVER                                   * 58566
          #3+PICK                                * 5856B
          2DUP                                   * 58570
          EQUALNOTcase                           * 58575
          ::                                     * 5857A
            RDROP                                * 5857F
            BodyMore?                            * 58584
            SWAPDROP                             * 58589
          ;                                      * 5858E
          2DROP                                  * 58593
          #1-                                    * 58598
          AGAIN                                  * 5859D
        ;                                        * 585A2

* ob1 ob2 -> flag
* refs (1): 58584
BodyMore?:
        CON(5)  (*)+5                            * 585A7  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 585AC
        C=DAT1  A                                * 585B3
        CD1EX                                    * 585B6
        D0=C                                     * 585B9
        D0=D0+  5                                * 585BC
        A=DAT0  A                                * 585BF
        D0=A                                     * 585C2
L_585C5:
        A=DAT0  S                                * 585C5
        C=DAT1  S                                * 585C9
        ?C#A    S                                * 585CD
        GOYES   L_585DB                          * 585D0
        D0=D0+  1                                * 585D2
        D1=D1+  1                                * 585D5
        GONC    L_585C5                          * 585D8
L_585DB:
        ?C<A    S                                * 585DB
        GOYES   L_58600                          * 585DE
        GOSBVL  GETPTR                           * 585E0
        D1=D1+  5                                * 585E7
        D=D+1   A                                * 585EA
        LC(5)   FALSE                            * 585EC
        DAT1=C  A                                * 585F3
        A=DAT0  A                                * 585F6
        D0=D0+  5                                * 585F9
        PC=(A)                                   * 585FC
L_58600:
        GOSBVL  GETPTR                           * 58600
        D1=D1+  5                                * 58607
        D=D+1   A                                * 5860A
        LC(5)   TRUE                             * 5860C
        DAT1=C  A                                * 58613
        A=DAT0  A                                * 58616
        D0=D0+  5                                * 58619
        PC=(A)                                   * 5861C
        RPL

* refs (2): 582C3 582CD
OBJ_58620:
        ::                                       * 58620
          M1st^case                              * 58625
          plDRPpZparg                            * 5862A
          %1                                     * 5862F
          pshm1                                  * 58634
        ;                                        * 58639

* refs (2): 583CC 583D6
OBJ_5863E:
        ::                                       * 5863E
          M1st*case                              * 58643
          OBJ_58661                              * 58648
          %1                                     * 5864D
          pshm1                                  * 58652
          addt*                                  * 58657
        ;                                        * 5865C

* refs (1): 58648
OBJ_58661:
        ::                                       * 58661
          OBJ_58CB7                              * 58666
          pshzer                                 * 5866B
          BEGIN                                  * 58670
          parg&                                  * 58675
          NoIdsInMeta?                           * 5867A
          UNTIL                                  * 5867F
          DUP#0=                                 * 58684
          IT                                     * 58689
          ::                                     * 5868E
            DROP                                 * 58693
            psh                                  * 58698
            PTR     addt:                        * 5869D
            x*                                   * 586A2
            psh                                  * 586A7
            %1                                   * 586AC
            BINT1                                * 586B1
          ;                                      * 586B6
          rotswap                                * 586BB
          pshzerpsharg                           * 586C0
          BEGIN                                  * 586C5
          DUP#0=                                 * 586CA
          NOT                                    * 586CF
          WHILE                                  * 586D4
          ::                                     * 586D9
            parg&                                * 586DE
            psh                                  * 586E3
            rot                                  * 586E8
            pullrev1&                            * 586ED
            psh                                  * 586F2
            rot                                  * 586F7
          ;                                      * 586FC
          REPEAT                                 * 58701
          DROP                                   * 58706
          roll2top&                              * 5870B
        ;                                        * 58710

* meta -> meta flag
* refs (5): 57F14 57F8C 5816A 581C4 5867A
NoIdsInMeta?:
        CON(5)  (*)+5                            * 58715  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 5871A
        CD1EX                                    * 5871D
        RSTK=C                                   * 58720
        D1=D1+  5                                * 58722
        A=DAT1  A                                * 58725
        D1=C                                     * 58728
        C=A     A                                * 5872B
        CD0EX                                    * 5872D
        RSTK=C                                   * 58730
L_58732:
        D1=D1+  5                                * 58732
        D0=D0-  1                                * 58735
        GOC     L_58793                          * 58738
        C=DAT1  A                                * 5873B
        CD1EX                                    * 5873E
        A=DAT1  A                                * 58741
        D1=C                                     * 58744
        LC(5)   DOIDNT                           * 58747
        ?C=A    A                                * 5874E
        GOYES   L_58786                          * 58751
        LC(5)   DOLAM                            * 58753
        ?C=A    A                                * 5875A
        GOYES   L_58786                          * 5875D
        LC(5)   DOCOL                            * 5875F
        ?C#A    A                                * 58766
        GOYES   L_58732                          * 58769
        C=DAT1  A                                * 5876B
        CD1EX                                    * 5876E
        D1=D1+  5                                * 58771
        A=DAT1  A                                * 58774
        D1=C                                     * 58777
        LC(5)   CK0                              * 5877A
        ?C#A    A                                * 58781
        GOYES   L_58732                          * 58784
L_58786:
        LC(5)   FALSE                            * 58786
        A=C     A                                * 5878D
        GOTO    L_5879C                          * 5878F
L_58793:
        LC(5)   TRUE                             * 58793
        A=C     A                                * 5879A
L_5879C:
        C=RSTK                                   * 5879C
        D0=C                                     * 5879E
        C=RSTK                                   * 587A1
        D1=C                                     * 587A3
        PC=(A)                                   * 587A6
        RPL

* meta1 meta2 -> meta'
* refs (1): 57DB3
colfac:
        ::                                       * 587AA
          BEGIN                                  * 587AF
          DUP#0=case                             * 587B4
          drop;q_58A0C                           * 587B9
          M1st-case                              * 587BE
          OBJ_587FF                              * 587C3
          M1st/case                              * 587C8
          OBJ_58827                              * 587CD
          M1stNEGcase                            * 587D2
          OBJ_58854                              * 587D7
          M1stINVcase                            * 587DC
          OBJ_58912                              * 587E1
          M1stSQcase                             * 587E6
          OBJ_589E9                              * 587EB
          pullrev1&                              * 587F0
          AGAIN                                  * 587F5
        ;                                        * 587FA

* refs (1): 587C3
OBJ_587FF:
        ::                                       * 587FF
          SWAPDROP#1-                            * 58804
          PTR     psh1&rev:                      * 58809
          x+                                     * 5880E
          addtNEG                                * 58813
          COLA                                   * 58818
          OBJ_58854                              * 5881D
        ;                                        * 58822

* refs (1): 587CD
OBJ_58827:
        ::                                       * 58827
          SWAPDROP#1-                            * 5882C
          PTR     psh1&rev:                      * 58831
          x*                                     * 58836
          PTR     addt:                          * 5883B
          xINV                                   * 58840
          COLA                                   * 58845
          OBJ_58912                              * 5884A
        ;                                        * 5884F

* refs (4): 587D7 5881D 588DB 589DF
OBJ_58854:
        ::                                       * 58854
          SWAPDROP#1-                            * 58859
          M1st+case                              * 5885E
          OBJ_588B8                              * 58863
          M1st-case                              * 58868
          OBJ_588E5                              * 5886D
          M1stNEGcase                            * 58872
          OBJ_588A4                              * 58877
          PTR     psh1&rev:                      * 5887C
          x*                                     * 58881
          pshzerpsharg                           * 58886
          %-1                                    * 5888B
          SWAP#1+                                * 58890
          pshtop&                                * 58895
          AGAIN                                  * 5889A
        ;                                        * 5889F

* refs (2): 58877 58935
OBJ_588A4:
        ::                                       * 588A4
          SWAPDROP#1-                            * 588A9
          AGAIN                                  * 588AE
        ;                                        * 588B3

* refs (1): 58863
OBJ_588B8:
        ::                                       * 588B8
          pullrev1&                              * 588BD
          pshzerpsharg                           * 588C2
          addtNEG                                * 588C7
          pshtop&                                * 588CC
          addtNEG                                * 588D1
          COLA                                   * 588D6
          OBJ_58854                              * 588DB
        ;                                        * 588E0

* refs (1): 5886D
OBJ_588E5:
        ::                                       * 588E5
          SWAPDROP#1-                            * 588EA
          PTR     psh1&rev:                      * 588EF
          x+                                     * 588F4
          pshzerpsharg                           * 588F9
          addtNEG                                * 588FE
          pshtop&                                * 58903
          AGAIN                                  * 58908
        ;                                        * 5890D

* refs (3): 587E1 5884A 5898F
OBJ_58912:
        ::                                       * 58912
          SWAPDROP#1-                            * 58917
          M1st*case                              * 5891C
          OBJ_58962                              * 58921
          M1st/case                              * 58926
          OBJ_58999                              * 5892B
          M1stINVcase                            * 58930
          OBJ_588A4                              * 58935
          M1st^case                              * 5893A
          OBJ_589CB                              * 5893F
          PTR     psh1&rev:                      * 58944
          x^                                     * 58949
          %-1                                    * 5894E
          SWAP#1+                                * 58953
          AGAIN                                  * 58958
        ;                                        * 5895D

* refs (1): 58921
OBJ_58962:
        ::                                       * 58962
          pullrev1&                              * 58967
          pshzerpsharg                           * 5896C
          PTR     addt:                          * 58971
          xINV                                   * 58976
          pshtop&                                * 5897B
          PTR     addt:                          * 58980
          xINV                                   * 58985
          COLA                                   * 5898A
          OBJ_58912                              * 5898F
        ;                                        * 58994

* refs (1): 5892B
OBJ_58999:
        ::                                       * 58999
          SWAPDROP#1-                            * 5899E
          PTR     psh1&rev:                      * 589A3
          x*                                     * 589A8
          pshzerpsharg                           * 589AD
          PTR     addt:                          * 589B2
          xINV                                   * 589B7
          pshtop&                                * 589BC
          AGAIN                                  * 589C1
        ;                                        * 589C6

* refs (1): 5893F
OBJ_589CB:
        ::                                       * 589CB
          pullrev1&                              * 589D0
          addtNEG                                * 589D5
          COLA                                   * 589DA
          OBJ_58854                              * 589DF
        ;                                        * 589E4

* refs (1): 587EB
OBJ_589E9:
        ::                                       * 589E9
          SWAPDROP#1-                            * 589EE
          PTR     psh1&rev2:                     * 589F3
          x^                                     * 589F8
          %2                                     * 589FD
          AGAIN                                  * 58A02
        ;                                        * 58A07

* refs (10): 57A8E 57E17 57E44 587B9 58A2F 66833 ...
drop;q_58A0C:
        ::                                       * 58A0C
          RDROP                                  * 58A11
          DROP                                   * 58A16
        ;                                        * 58A1B

* meta1 meta2 -> meta'
* refs (2): 57DEF 5AC72
colunfac:
        ::                                       * 58A20
          BEGIN                                  * 58A25
          DUP#0=case                             * 58A2A
          drop;q_58A0C                           * 58A2F
          M-1potcase                             * 58A34
          OBJ_58B26                              * 58A39
          M1st+case                              * 58A3E
          OBJ_58B58                              * 58A43
          M1st*case                              * 58A48
          OBJ_58B9E                              * 58A4D
          pullpsh1&                              * 58A52
          AGAIN                                  * 58A57
        ;                                        * 58A5C

* [expr1 INV expr2 INV *] -> [expr1 expr2 /]
* refs (1): 5BE67
colinv1:
        ::                                       * 58A61
          #2-                                    * 58A66
          ROTROT2DROP                            * 58A6B
          pshzerpsharg                           * 58A70
          SWAPDROP#1-                            * 58A75
          pshtop&                                * 58A7A
          PTR     addt2:                         * 58A7F
          x*                                     * 58A84
          xINV                                   * 58A89
        ;                                        * 58A8E

* [expr INV *] -> [expr /]
* refs (1): 5BE71
colinv2:
        ::                                       * 58A93
          #2-                                    * 58A98
          ROTROT2DROP                            * 58A9D
          meta/                                  * 58AA2
        ;                                        * 58AA7

* [expr1 INV expr2 *] -> [expr1 expr2 /]
* refs (1): 5BE7B
colinv3:
        ::                                       * 58AAC
          SWAPDROP#1-                            * 58AB1
          pshzerpsharg                           * 58AB6
          SWAPDROP#1-                            * 58ABB
          larg                                   * 58AC0
          rotswap                                * 58AC5
          top&                                   * 58ACA
          top&                                   * 58ACF
          meta/                                  * 58AD4
        ;                                        * 58AD9

* Meta&-1&^ ? case
* refs (1): 58A34
M-1potcase:
        CON(5)  (*)+5                            * 58ADE  primitive code object
        ASSEMBLE
        CD1EX                                    * 58AE3
        D1=(5)  L_58B17                          * 58AE6
        A=DAT1  15                               * 58AED
        D1=C                                     * 58AF1
        D1=D1+  5                                * 58AF4
        C=DAT1  15                               * 58AF7
        D1=D1-  5                                * 58AFB
        P=      14                               * 58AFE
        ?C#A    WP                               * 58B00
        GOYES   L_58B0E                          * 58B03
        P=      0                                * 58B05
        GOVLNG  docola                           * 58B07
L_58B0E:
        P=      0                                * 58B0E
        GOVLNG  doskip                           * 58B10

L_58B17:
        CON(5)  x*                               * 58B17  address (the code jumps or points through it)

        CON(5)  x^                               * 58B1C  address (the code jumps or points through it)

        CON(5)  %-1                              * 58B21  address (the code jumps or points through it)
        RPL

* refs (1): 58A39
OBJ_58B26:
        ::                                       * 58B26
          BINT3                                  * 58B2B
          #-                                     * 58B30
          SWAPDROP                               * 58B35
          ROTROT2DROP                            * 58B3A
          '                                      * 58B3F
          x/                                     * 58B44
          psh1&                                  * 58B49
          AGAIN                                  * 58B4E
        ;                                        * 58B53

* refs (1): 58A43
OBJ_58B58:
        ::                                       * 58B58
          pullpsh1&                              * 58B5D
          M1st+case                              * 58B62
          OBJ_58B76                              * 58B67
          AGAIN                                  * 58B6C
        ;                                        * 58B71

* refs (2): 58B67 58B8F
OBJ_58B76:
        ::                                       * 58B76
          plDRPpZparg                            * 58B7B
          OBJ_5CD02                              * 58B80
          pshtop&                                * 58B85
          M1st+case                              * 58B8A
          OBJ_58B76                              * 58B8F
          AGAIN                                  * 58B94
        ;                                        * 58B99

* refs (1): 58A4D
OBJ_58B9E:
        ::                                       * 58B9E
          ::                                     * 58BA3
            MetaMulInv                           * 58BA8
            COLA                                 * 58BAD
            SKIP                                 * 58BB2
          ;                                      * 58BB7
          AGAIN                                  * 58BBC
          pullpsh1&                              * 58BC1
          M1st*case                              * 58BC6
          OBJ_58BDA                              * 58BCB
          AGAIN                                  * 58BD0
        ;                                        * 58BD5

* refs (2): 58BCB 58BF3
OBJ_58BDA:
        ::                                       * 58BDA
          plDRPpZparg                            * 58BDF
          addt*                                  * 58BE4
          pshtop&                                * 58BE9
          M1st*case                              * 58BEE
          OBJ_58BDA                              * 58BF3
          AGAIN                                  * 58BF8
        ;                                        * 58BFD

* meta -> meta #0 meta &+&+..&+ -> meta #n
* refs (3): 580EF 58112 58C94
count+:
        CON(5)  (*)+5                            * 58C02  primitive code object
        ASSEMBLE
        ST=1    0                                * 58C07
        GOTO    L_58C16                          * 58C0A

* meta -> meta #0 meta &*&*..&* -> meta #n
* refs (3): 57E99 57EBC 58CBC
count*:
        CON(5)  (*)+5                            * 58C0E  primitive code object
        ST=0    0                                * 58C13
L_58C16:
        A=DAT1  A                                * 58C16
        AD1EX                                    * 58C19
        D1=D1+  5                                * 58C1C
        C=DAT1  A                                * 58C1F
        D1=A                                     * 58C22
        RSTK=C                                   * 58C25
        C=0     A                                * 58C27
        CD0EX                                    * 58C29
        RSTK=C                                   * 58C2C
        LC(5)   x*                               * 58C2E
        ?ST=0   0                                * 58C35
        GOYES   L_58C41                          * 58C38
        LC(5)   x+                               * 58C3A
L_58C41:
        D1=D1+  5                                * 58C41
        A=DAT1  A                                * 58C44
        ?C#A    A                                * 58C47
        GOYES   L_58C52                          * 58C4A
        D0=D0+  1                                * 58C4C
        GONC    L_58C41                          * 58C4F
L_58C52:
        C=RSTK                                   * 58C52
        CD0EX                                    * 58C54
        A=C     A                                * 58C57
        C=RSTK                                   * 58C59
        C=C-A   A                                * 58C5B
        R0=C                                     * 58C5D
        R1=A                                     * 58C60
        GOSBVL  SAVPTR                           * 58C63
        GOSBVL  PUSH#                            * 58C6A
        A=R1                                     * 58C71
        R0=A                                     * 58C74
        GOSBVL  SAVPTR                           * 58C77
        GOSBVL  PUSH#                            * 58C7E
        A=DAT0  A                                * 58C85
        D0=D0+  5                                * 58C88
        PC=(A)                                   * 58C8B
        RPL

        ::                                       * 58C8F
          count+                                 * 58C94
          '                                      * 58C99
          x+                                     * 58C9E
          SWAP                                   * 58CA3
          NDUPN                                  * 58CA8
          psh                                    * 58CAD
        ;                                        * 58CB2

* refs (1): 58666
OBJ_58CB7:
        ::                                       * 58CB7
          count*                                 * 58CBC
          'x*                                    * 58CC1
          SWAP                                   * 58CC6
          NDUPN                                  * 58CCB
          psh                                    * 58CD0
        ;                                        * 58CD5

* ob -> ob'
* refs (2): 5731A 57DFE
coleval:
        ::                                       * 58CDA
          FALSE                                  * 58CDF

* sym param -> ?
* refs (3): 280CF 28A51 5913A
parameval:
          ::                                     * 58CE4
            1LAMBIND                             * 58CE9

* sym -> ?
* refs (1): 5918F
eval:
            ::                                   * 58CEE
              symcomp                            * 58CF3
              >R                                 * 58CF8
              BEGIN                              * 58CFD
              RSWAP                              * 58D02
              ticR                               * 58D07
              DUP                                * 58D0C
              NOT                                * 58D11
              ?SKIP                              * 58D16
              RSWAP                              * 58D1B
              WHILE                              * 58D20
              ::                                 * 58D25
                1GETLAM                          * 58D2A
                EVAL                             * 58D2F
                case                             * 58D34
                AGAIN                            * 58D39
                nonopcase                        * 58D3E
                AGAIN                            * 58D43
                OBJ_26F34                        * 58D48
                DROP                             * 58D4D
                EVAL                             * 58D52
              ;                                  * 58D57
              REPEAT                             * 58D5C
            ;                                    * 58D61
            ABND                                 * 58D66
          ;                                      * 58D6B
        ;                                        * 58D70

* sym id/lam -> symf
* refs (4): 20AE2 20AEC 49832 5960A
SYMSHOW:
        ::                                       * 58D75
          BINT1                                  * 58D7A
          {}N                                    * 58D7F
          dvarlsBIND                             * 58D84
          EXPLODE                                * 58D89
          OBJ_58DA7                              * 58D8E
          ABND                                   * 58D93
          DROP                                   * 58D98
          IMPLODE                                * 58D9D
        ;                                        * 58DA2

* refs (4): 58D8E 58FCB 590A2 59207
OBJ_58DA7:
        ::                                       * 58DA7
          TRUE                                   * 58DAC

{'fl}:
          {                                      * 58DB1

Π'fl:
            LAM     'fl                          * 58DB6
          }                                      * 58DC3
          BIND                                   * 58DC8
          pshzer                                 * 58DCD
          BEGIN                                  * 58DD2
          M1stFNCcase                            * 58DD7
          OBJ_58E45                              * 58DDC
          Mid1stcase                             * 58DE1
          OBJ_58F12                              * 58DE6
          ::                                     * 58DEB
            OVER                                 * 58DF0
            nonopcase                            * 58DF5
            FALSE                                * 58DFA
            OBJ_26F7A                            * 58DFF
          ;                                      * 58E04
          casedrop                               * 58E09
          OBJ_59020                              * 58E0E
          DROP                                   * 58E13
          pullpsh1&                              * 58E18
          COLA                                   * 58E1D
          OBJ_58E2C                              * 58E22
        ;                                        * 58E27

* refs (8): 58E22 58EE5 58F08 58F4E 58FBC 58FE9 ...
OBJ_58E2C:
        ::                                       * 58E2C
          #0=UNTIL                               * 58E31
          DROP                                   * 58E36
          1GETABND                               * 58E3B
        ;                                        * 58E40

* refs (1): 58DDC
OBJ_58E45:
        ::                                       * 58E45
          4PICK                                  * 58E4A
          TYPEROMP?                              * 58E4F
          case                                   * 58E54
          OBJ_59020                              * 58E59
          4PICK                                  * 58E5E
          ROMPTR@NOT                             * 58E63
          casedrop                               * 58E68
          OBJ_58EEF                              * 58E6D
          5PICK                                  * 58E72
          SWAP                                   * 58E77
          5PICK                                  * 58E7C
          OBJ_56FD1                              * 58E81
          BIND                                   * 58E86
          2GETLAM                                * 58E8B
          OBJ_5DEF7                              * 58E90

* refs (1): 58EB3
OBJ_58E95:
          ::                                     * 58E95
            DROP                                 * 58E9A
            ABND                                 * 58E9F
            COLA                                 * 58EA4
            OBJ_58EEF                            * 58EA9
          ;                                      * 58EAE
          OBJ_58E95                              * 58EB3
          DROP                                   * 58EB8
          larg                                   * 58EBD
          SWAPDROP#1-                            * 58EC2
          ROTROT2DROP                            * 58EC7
          OBJ_56E05                              * 58ECC
          SWAPDROP                               * 58ED1
          EXPLODE                                * 58ED6
          top&                                   * 58EDB
          COLA                                   * 58EE0
          OBJ_58E2C                              * 58EE5
        ;                                        * 58EEA

* refs (2): 58E6D 58EA9
OBJ_58EEF:
        ::                                       * 58EEF
          pullpsh1&                              * 58EF4
          pullpsh1&                              * 58EF9
          pullpsh1&                              * 58EFE
          COLA                                   * 58F03
          OBJ_58E2C                              * 58F08
        ;                                        * 58F0D

* refs (1): 58DE6
OBJ_58F12:
        ::                                       * 58F12
          #1-SWAP                                * 58F17
          lam'dvar                               * 58F1C
          OVER                                   * 58F21
          EQUALPOSCOMP                           * 58F26
          #0<>                                   * 58F2B
          case                                   * 58F30
          ::                                     * 58F35
            psh1&                                * 58F3A
            FALSE                                * 58F3F
            1PUTLAM                              * 58F44
            COLA                                 * 58F49
            OBJ_58E2C                            * 58F4E
          ;                                      * 58F53
          DUP                                    * 58F58
          ROMPTR@NOT                             * 58F5D
          case                                   * 58F62
          OBJ_58FA8                              * 58F67
          idntlamcase                            * 58F6C
          ::                                     * 58F71
            ONECOLA                              * 58F76
            OBJ_58FC6                            * 58F7B
          ;                                      * 58F80
          dup;ex?                                * 58F85
          NOTcase                                * 58F8A
          OBJ_58FA8                              * 58F8F
          EXPLODE                                * 58F94
          COLA                                   * 58F99
          OBJ_58FC6                              * 58F9E
        ;                                        * 58FA3

* refs (2): 58F67 58F8F
OBJ_58FA8:
        ::                                       * 58FA8
          DROP                                   * 58FAD
          psh1&                                  * 58FB2
          COLA                                   * 58FB7
          OBJ_58E2C                              * 58FBC
        ;                                        * 58FC1

* refs (2): 58F7B 58F9E
OBJ_58FC6:
        ::                                       * 58FC6
          OBJ_58DA7                              * 58FCB
          case                                   * 58FD0
          ::                                     * 58FD5
            NDROP                                * 58FDA
            psh1&                                * 58FDF
            COLA                                 * 58FE4
            OBJ_58E2C                            * 58FE9
          ;                                      * 58FEE
          get1                                   * 58FF3
          DROP                                   * 58FF8
          ROTUntop&                              * 58FFD
          psh                                    * 59002
          FALSE                                  * 59007
          1PUTLAM                                * 5900C
          COLA                                   * 59011
          OBJ_58E2C                              * 59016
        ;                                        * 5901B

* refs (2): 58E0E 58E59
OBJ_59020:
        ::                                       * 59020
          larg                                   * 59025
          pshzer                                 * 5902A
          BINT3                                  * 5902F
          BEGIN                                  * 59034
          DUP#1+PICK                             * 59039
          ::                                     * 5903E
            idntlamcase                          * 59043
            OBJ_590D4                            * 59048
          ;                                      * 5904D
          DROP                                   * 59052
          BINT1                                  * 59057
          splitup                                * 5905C
          2DUPSWAP                               * 59061
          #-                                     * 59066
          #2=                                    * 5906B
          UNTIL                                  * 59070
          DROP                                   * 59075
          psh                                    * 5907A
          lam'dvar                               * 5907F
          INNERtop&                              * 59084
          {}N                                    * 59089
          dvarlsBIND                             * 5908E
          rotswap                                * 59093
          pullpsh1&                              * 59098
          rotswap                                * 5909D
          OBJ_58DA7                              * 590A2
          ABND                                   * 590A7
          1GETLAM                                * 590AC
          AND                                    * 590B1
          1PUTLAM                                * 590B6
          ROTUntop&                              * 590BB
          psh                                    * 590C0
          COLA                                   * 590C5
          OBJ_58E2C                              * 590CA
        ;                                        * 590CF

* refs (1): 59048
OBJ_590D4:
        ::                                       * 590D4
          OVER                                   * 590D9
          #2+                                    * 590DE
          OBJ_5F5AD                              * 590E3
          NOT?SEMI                               * 590E8
          ROT#1+                                 * 590ED
          SWAP                                   * 590F2
          psh1&                                  * 590F7
          #1-SWAP                                * 590FC
          DUP                                    * 59101
        ;                                        * 59106

* sym {names} -> symf
* refs (2): 20B0A 4DAEE
SHOWLS:
        ::                                       * 5910B

{'nmls}:
          {                                      * 59110

* refs (1): 59158
Π'nmls:
            LAM     'nmls                        * 59115
          }                                      * 59126
          BIND                                   * 5912B
          '                                      * 59130
          OBJ_59149                              * 59135
          parameval                              * 5913A
          ABND                                   * 5913F
        ;                                        * 59144

* refs (1): 59135
OBJ_59149:
        ::                                       * 59149
          dup;#nm?                               * 5914E
          caseFALSE                              * 59153
          Π'nmls                                 * 59158
          OVER                                   * 5915D
          EQUALPOSCOMP                           * 59162
          #0<>                                   * 59167
          caseFALSE                              * 5916C
          ROMPTR@NOT                             * 59171
          caseFALSE                              * 59176
          ?ATTNQUIT                              * 5917B
          CK&DISPATCH1                           * 59180
          BINT10                                 * 59185

* sym -> ? T
evalTRUE:
          ::                                     * 5918A
            eval                                 * 5918F
            TRUE                                 * 59194
          ;                                      * 59199
          BINT0                                  * 5919E
          FALSE                                  * 591A3
        ;                                        * 591A8

* sym id -> symf
* refs (3): 20AC2 B6BD0 B6BD5
SYMQUAD:
        ::                                       * 591AD
          uncrunch                               * 591B2
          quad!(ex,gn)                           * 591B7
        ;                                        * 591BC

* refs (1): 591B7
quad!(ex,gn):
        ::                                       * 591C1
          DUP1LAMBIND                            * 591C6
          OBJ_591E9                              * 591CB
          DROP                                   * 591D0
          1ABNDSWAP                              * 591D5
          'EvalNoCK:_sup                         * 591DA
          x=                                     * 591DF
        ;                                        * 591E4

* refs (2): 4BD28 591CB
OBJ_591E9:
        ::                                       * 591E9
          SWAPcompSWAP                           * 591EE
          ONE{}N                                 * 591F3
          dvarlsBIND                             * 591F8
          DUP                                    * 591FD
          EXPLODE                                * 59202
          OBJ_58DA7                              * 59207
          1GETLAM                                * 5920C
          CARCOMP                                * 59211
          1PUTLAM                                * 59216
          3UNROLL                                * 5921B
          ::                                     * 59220
            AEQ1stcase                           * 59225
            x=                                   * 5922A
            ::                                   * 5922F
              drpmeta-                           * 59234
              ROTDROP                            * 59239
              FALSE                              * 5923E
              3UNROLL                            * 59243
            ;                                    * 59248
          ;                                      * 5924D
          ROT                                    * 59252
          ITE                                    * 59257
          NDROP                                  * 5925C
          ::                                     * 59261
            IMPLODE                              * 59266
            symcomp                              * 5926B
            SWAPDROP                             * 59270
          ;                                      * 59275
          BINT2                                  * 5927A
          OBJ_59373                              * 5927F
          ABND                                   * 59284
          DROP                                   * 59289
          DUP%0=                                 * 5928E
          NOTcase                                * 59293
          quad(3ex)?                             * 59298
          DROP                                   * 5929D
          x/                                     * 592A2
          xNEG                                   * 592A7
          FALSE                                  * 592AC
        ;                                        * 592B1

* refs (1): 59298
quad(3ex)?:
        ::                                       * 592B6

{'c,'b,'a}:
          {                                      * 592BB

Π'c:
            LAM     'c                           * 592C0

Π'b:
            LAM     'b                           * 592CB

Π'a:
            LAM     'a                           * 592D6
          }                                      * 592E1
          BIND                                   * 592E6
          2GETLAM                                * 592EB
          xNEG                                   * 592F0
          PRSOL?                                 * 592F5
          %1                                     * 592FA

Expr's1':
          SYMBOL                                 * 592FF

s1_59304:
            ID      s1                           * 59304
          ;                                      * 5930F
          RPITE                                  * 59314
          2GETLAM                                * 59319
          %2                                     * 5931E
          x^                                     * 59323
          %4                                     * 59328
          1GETLAM                                * 5932D
          x*                                     * 59332
          3GETLAM                                * 59337
          x*                                     * 5933C
          x-                                     * 59341
          xSQRT                                  * 59346
          x*                                     * 5934B
          x+                                     * 59350
          %2                                     * 59355
          1GETABND                               * 5935A
          x*                                     * 5935F
          x/                                     * 59364
          TRUE                                   * 59369
        ;                                        * 5936E

* refs (2): 5927F 59619
OBJ_59373:
        ::                                       * 59373
          OBJ_59503                              * 59378
          OBJ_593AF                              * 5937D
        ;                                        * 59382

* refs (2): 593A0 59560
OBJ_59387:
        ::                                       * 59387
          lam'dvar                               * 5938C
          ?PURGE_HERE                            * 59391
        ;                                        * 59396

* refs (1): 5955B
OBJ_5939B:
        ::                                       * 5939B
          OBJ_59387                              * 593A0
          ERRJMP                                 * 593A5
        ;                                        * 593AA

* refs (1): 5937D
OBJ_593AF:
        ::                                       * 593AF
          DUP                                    * 593B4
          %0_2A2B4                               * 593B9
          lam'dvar                               * 593BE
          XEQSTOID                               * 593C3
          xEVAL                                  * 593C8
          OBJ_54BAF                              * 593CD
          xSWAP                                  * 593D2
          1GETLAM                                * 593D7
          lam'dvar                               * 593DC
          XEQSTOID                               * 593E1
          2GETLAM                                * 593E6
          #0=case                                * 593EB
          DROPONE                                * 593F0
          2GETLAM                                * 593F5
          #1=?SKIP                               * 593FA
          ::                                     * 593FF
            2GETLAM                              * 59404
            ONE_DO                               * 59409
            OBJ_4241B                            * 5940E
            lam'dvar                             * 59413
            DERIV                                * 59418
            xEVAL                                * 5941D
            xDUP                                 * 59422
            %0_2A2B4                             * 59427
            lam'dvar                             * 5942C
            XEQSTOID                             * 59431
            xEVAL                                * 59436
            1GETLAM                              * 5943B
            lam'dvar                             * 59440
            XEQSTOID                             * 59445
            INDEX@                               * 5944A
            OBJ_594AE                            * 5944F
            xSWAP                                * 59454
            LOOP                                 * 59459
          ;                                      * 5945E
          %0_2A2B4                               * 59463
          lam'dvar                               * 59468
          XEQSTOID                               * 5946D
          lam'dvar                               * 59472
          DERIV                                  * 59477
          2GETLAM                                * 5947C
          OBJ_594AE                              * 59481
          DEPTH                                  * 59486
          2GETLAM                                * 5948B
          #1+                                    * 59490
          #<case                                 * 59495
          SETSTACKERR                            * 5949A
          2GETLAM                                * 5949F
          #1+                                    * 594A4
        ;                                        * 594A9

* refs (2): 5944F 59481
OBJ_594AE:
        ::                                       * 594AE
          UNCOERCE                               * 594B3
          %1=case                                * 594B8
          DROP                                   * 594BD
          %2=case                                * 594C2
          x/                                     * 594C7
          SYMFACT                                * 594CC
          OVER                                   * 594D1
          %ABS                                   * 594D6
          %1                                     * 594DB
          EQUALNOTcase                           * 594E0
          x/                                     * 594E5
          SWAP                                   * 594EA
          ONESYMBN                               * 594EF
          SWAP                                   * 594F4
          x/                                     * 594F9
        ;                                        * 594FE

* refs (2): 59378 595C9
OBJ_59503:
        ::                                       * 59503
          lam'dvar                               * 59508
          OBJ_5956F                              * 5950D

{'n,'prog}:
          {                                      * 59512

Π'n:
            LAM     'n                           * 59517

Π'prog:
            LAM     'prog                        * 59522
          }                                      * 59533
          BIND                                   * 59538
          1GETLAM                                * 5953D
          lam'dvar                               * 59542
          CREATE                                 * 59547
          ERRSET                                 * 5954C
          'REVAL                                 * 59551
          ERRTRAP                                * 59556
          OBJ_5939B                              * 5955B
          OBJ_59387                              * 59560
          ABND                                   * 59565
        ;                                        * 5956A

* refs (2): 4BD19 5950D
OBJ_5956F:
        ::                                       * 5956F
          '                                      * 59574
          x<<                                    * 59579
          '                                      * 5957E
          x'                                     * 59583
          ROT                                    * 59588
          '                                      * 5958D
          xENDTIC                                * 59592
          '                                      * 59597
          x>>                                    * 5959C
          BINT5                                  * 595A1
          ::N                                    * 595A6
        ;                                        * 595AB

* refs (1): 49ADD
SymDer(ex,nm):
        ::                                       * 595B0
          uncrunch                               * 595B5
          ::                                     * 595BA
            DUPDUP                               * 595BF
            dvarlsBIND                           * 595C4
            OBJ_59503                            * 595C9
            DERIV                                * 595CE
          ;                                      * 595D3
        ;                                        * 595D8

* sym id % -> symf
* refs (3): 20B2F B6B8F B6B94
SYMTAYLR:
        ::                                       * 595DD
          uncrunch                               * 595E2
          taylr!(ex,gn,r)                        * 595E7
        ;                                        * 595EC

* refs (1): 595E7
taylr!(ex,gn,r):
        ::                                       * 595F1
          COERCE                                 * 595F6
          UNROTDUP                               * 595FB
          dvarlsBIND                             * 59600
          SWAPcompSWAP                           * 59605
          SYMSHOW                                * 5960A
          symcomp                                * 5960F
          SWAP                                   * 59614
          OBJ_59373                              * 59619
          DUP#1-                                 * 5961E
          #0=case                                * 59623

drop;Lpop:
          ::                                     * 59628
            DROP                                 * 5962D
            ABND                                 * 59632
          ;                                      * 59637
          DUP#1+                                 * 5963C

{'n}:
          {                                      * 59641

Π'n_59646:
            LAM     'n                           * 59646
          }                                      * 59651
          BIND                                   * 59656
          ROLL                                   * 5965B
          1GETLAM                                * 59660
          #1-                                    * 59665
          ONE_DO                                 * 5966A
          1GETLAM                                * 5966F
          INDEX@#-                               * 59674
          ROLL                                   * 59679
          lam'dvar                               * 5967E
          INDEX@                                 * 59683
          UNCOERCE                               * 59688
          x^                                     * 5968D
          x*                                     * 59692
          x+                                     * 59697
          LOOP                                   * 5969C
          ABND                                   * 596A1
          ABND                                   * 596A6
        ;                                        * 596AB

* refs (1): 3F23D
{RULES\COLCT}:
        {                                        * 596B0

_COLCT_:
          $       "COLCT"                        * 596B5
          ::                                     * 596C9
            OBJ_69C64                            * 596CE

* restricted collection
MetaRCOLCT:
            ::                                   * 596D3
              OBJ_59F32                          * 596D8
              ROMPTR  0F0 076                    * 596DD
              RDROP                              * 596E8
            ;                                    * 596ED
          ;                                      * 596F2
        }                                        * 596F7

* refs (1): 3F21F
{RULES\DNEG}:
        {                                        * 596FC

_DNEG_:
          $       "DNEG"                         * 59701
          ::                                     * 59713
            OBJ_69C64                            * 59718

* double negate
MetaDNEG:
            ::                                   * 5971D
              OBJ_59F32                          * 59722
              PTR     addt2:                     * 59727
              xNEG                               * 5972C
              xNEG                               * 59731
              RDROP                              * 59736
            ;                                    * 5973B
          ;                                      * 59740
        }                                        * 59745

* refs (1): 3F224
{RULES\DINV}:
        {                                        * 5974A

_DINV_:
          $       "DINV"                         * 5974F
          ::                                     * 59761
            OBJ_69C64                            * 59766

* double invert
MetaDINV:
            ::                                   * 5976B
              OBJ_59F32                          * 59770
              PTR     addt2:                     * 59775
              xINV                               * 5977A
              xINV                               * 5977F
              RDROP                              * 59784
            ;                                    * 59789
          ;                                      * 5978E
        }                                        * 59793

* refs (1): 3F229
{RULES\*1}:
        {                                        * 59798

_*1_:
          $       "*1"                           * 5979D
          ::                                     * 597AB
            OBJ_69C64                            * 597B0

* mult by one
Meta*1:
            ::                                   * 597B5
              OBJ_59F32                          * 597BA
              PTR     addt2:                     * 597BF
              %1                                 * 597C4
              x*                                 * 597C9
              RDROP                              * 597CE
              4PICK                              * 597D3
              '                                  * 597D8
              x/                                 * 597DD
              EQ                                 * 597E2
              NOT?SEMI                           * 597E7
              5PICK                              * 597EC
              %1                                 * 597F1
              EQUAL                              * 597F6
              NOT?SEMI                           * 597FB
              #4-                                * 59800
              5UNROLL                            * 59805
              4DROP                              * 5980A
            ;                                    * 5980F
          ;                                      * 59814
        }                                        * 59819

* refs (1): 3F22E
{RULES\^1}:
        {                                        * 5981E

_^1_:
          $       "^1"                           * 59823
          ::                                     * 59831
            OBJ_69C64                            * 59836

* pow by one
Meta^1:
            ::                                   * 5983B
              OBJ_59F32                          * 59840
              PTR     addt2:                     * 59845
              %1                                 * 5984A
              x^                                 * 5984F
              RDROP                              * 59854
            ;                                    * 59859
          ;                                      * 5985E
        }                                        * 59863

* refs (1): 3F233
{RULES\/1}:
        {                                        * 59868

_/1_:
          $       "/1"                           * 5986D
          ::                                     * 5987B
            OBJ_69C64                            * 59880

* div by one
Meta1/:
            ::                                   * 59885
              OBJ_59F32                          * 5988A
              PTR     addt2:                     * 5988F
              %1                                 * 59894
              x/                                 * 59899
              RDROP                              * 5989E
              4PICK                              * 598A3
              '                                  * 598A8
              x*                                 * 598AD
              EQ                                 * 598B2
              NOT?SEMI                           * 598B7
              5PICK                              * 598BC
              %1                                 * 598C1
              EQUAL                              * 598C6
              NOT?SEMI                           * 598CB
              #4-                                * 598D0
              5UNROLL                            * 598D5
              4DROP                              * 598DA
            ;                                    * 598DF
          ;                                      * 598E4
        }                                        * 598E9

* refs (1): 3F238
{RULES\+1-1}:
        {                                        * 598EE

_+1-1_:
          $       "+1-1"                         * 598F3
          ::                                     * 59905
            OBJ_69C64                            * 5990A

* add 1 subtract 1
Meta+1-1:
            ::                                   * 5990F
              OBJ_59F32                          * 59914

{1,+,1,-}:
              {                                  * 59919
                %1                               * 5991E
                x+                               * 59923
                %1                               * 59928
                x-                               * 5992D
              }                                  * 59932
              INNERtop&                          * 59937
              RDROP                              * 5993C
            ;                                    * 59941
          ;                                      * 59946
        }                                        * 5994B

* refs (2): 86A5B 86ABA
{RULES\<-->}:
        {                                        * 59950

_<-->_:
          $       "←→"                           * 59955
          ::                                     * 59963
            OBJ_69C64                            * 59968
            Meta<-->                             * 5996D
          ;                                      * 59972
        }                                        * 59977

* refs (3): 86A6A 86AB0 86AF1
{RULES\<-A}:
        {                                        * 5997C

_<-A_:
          $       "←A"                           * 59981
          {                                      * 5998F
            ::                                   * 59994
              OBJ_69CAC                          * 59999
              Meta<-A                            * 5999E
            ;                                    * 599A3
            DoBadKey                             * 599A8
            ::                                   * 599AD
              OBJ_69CAC                          * 599B2
              Meta<-Aall                         * 599B7
            ;                                    * 599BC
          }                                      * 599C1
        }                                        * 599C6

* refs (3): 86A6F 86AB5 86AF6
{RULES\A->}:
        {                                        * 599CB

_A->_:
          $       "A→"                           * 599D0
          {                                      * 599DE
            ::                                   * 599E3
              OBJ_69CAC                          * 599E8
              MetaA->                            * 599ED
            ;                                    * 599F2
            DoBadKey                             * 599F7
            ::                                   * 599FC
              OBJ_69CAC                          * 59A01
              MetaA->all                         * 59A06
            ;                                    * 59A0B
          }                                      * 59A10
        }                                        * 59A15

* refs (3): 86A42 86A88 86B50
{RULES\<-T}:
        {                                        * 59A1A

_<-T_:
          $       "←T"                           * 59A1F
          {                                      * 59A2D
            ::                                   * 59A32
              OBJ_69CAC                          * 59A37
              Meta<-T                            * 59A3C
            ;                                    * 59A41
            DoBadKey                             * 59A46
            ::                                   * 59A4B
              OBJ_69CAC                          * 59A50
              Meta<-Tall                         * 59A55
            ;                                    * 59A5A
          }                                      * 59A5F
        }                                        * 59A64

* refs (3): 86A47 86A8D 86B55
{RULES\T->}:
        {                                        * 59A69

_T->_:
          $       "T→"                           * 59A6E
          {                                      * 59A7C
            ::                                   * 59A81
              OBJ_69CAC                          * 59A86
              MetaT->                            * 59A8B
            ;                                    * 59A90
            DoBadKey                             * 59A95
            ::                                   * 59A9A
              OBJ_69CAC                          * 59A9F
              MetaT->all                         * 59AA4
            ;                                    * 59AA9
          }                                      * 59AAE
        }                                        * 59AB3

* refs (2): 86A60 86AA6
{RULES\(<-}:
        {                                        * 59AB8

_(<-_:
          $       "(←"                           * 59ABD
          {                                      * 59ACB
            ::                                   * 59AD0
              OBJ_69CAC                          * 59AD5
              Meta(<-                            * 59ADA
            ;                                    * 59ADF
            DoBadKey                             * 59AE4
            ::                                   * 59AE9
              OBJ_69CAC                          * 59AEE
              Meta(<-all                         * 59AF3
            ;                                    * 59AF8
          }                                      * 59AFD
        }                                        * 59B02

* refs (2): 86A65 86AAB
{RULES\->)}:
        {                                        * 59B07

_->)_:
          $       "→)"                           * 59B0C
          {                                      * 59B1A
            ::                                   * 59B1F
              OBJ_69CAC                          * 59B24
              Meta->)                            * 59B29
            ;                                    * 59B2E
            DoBadKey                             * 59B33
            ::                                   * 59B38
              OBJ_69CAC                          * 59B3D
              Meta->)all                         * 59B42
            ;                                    * 59B47
          }                                      * 59B4C
        }                                        * 59B51

* refs (2): 86A74 86ABF
{RULES\(())}:
        {                                        * 59B56

_(())_:
          $       "(())"                         * 59B5B
          ::                                     * 59B6D
            OBJ_69CAC                            * 59B72
            Meta(())                             * 59B77
          ;                                      * 59B7C
        }                                        * 59B81

* refs (1): 86A56
{RULES\AF}:
        {                                        * 59B86

_AF_:
          $       "AF"                           * 59B8B
          ::                                     * 59B99
            OBJ_69C64                            * 59B9E
            MetaAF                               * 59BA3
          ;                                      * 59BA8
        }                                        * 59BAD

* refs (2): 86A4C 86A92
{RULES\<-M}:
        {                                        * 59BB2

_<-M_:
          $       "←M"                           * 59BB7
          {                                      * 59BC5
            ::                                   * 59BCA
              OBJ_69C64                          * 59BCF
              Meta<-M                            * 59BD4
            ;                                    * 59BD9
            DoBadKey                             * 59BDE
            ::                                   * 59BE3
              OBJ_69CAC                          * 59BE8
              Meta<-Mall                         * 59BED
            ;                                    * 59BF2
          }                                      * 59BF7
        }                                        * 59BFC

* refs (2): 86A51 86A97
{RULES\M->}:
        {                                        * 59C01

_M->_:
          $       "M→"                           * 59C06
          {                                      * 59C14
            ::                                   * 59C19
              OBJ_69C64                          * 59C1E
              MetaM->                            * 59C23
            ;                                    * 59C28
            DoBadKey                             * 59C2D
            ::                                   * 59C32
              OBJ_69CAC                          * 59C37
              MetaM->all                         * 59C3C
            ;                                    * 59C41
          }                                      * 59C46
        }                                        * 59C4B

* refs (3): 86A79 86AC4 86B23
{RULES\-()}:
        {                                        * 59C50

_-()_:
          $       "-()"                          * 59C55
          ::                                     * 59C65
            OBJ_69C64                            * 59C6A
            Meta-()                              * 59C6F
          ;                                      * 59C74
        }                                        * 59C79

* refs (3): 86AC9 86ADD 86B05
{RULES\1/()}:
        {                                        * 59C7E

_1/()_:
          $       "1/()"                         * 59C83
          ::                                     * 59C95
            OBJ_69C64                            * 59C9A
            Meta1/()                             * 59C9F
          ;                                      * 59CA4
        }                                        * 59CA9

* refs (1): 86AE2
{RULES\E()}:
        {                                        * 59CAE

_E()_:
          $       "E()"                          * 59CB3
          ::                                     * 59CC3
            OBJ_69C64                            * 59CC8
            MetaE()                              * 59CCD
          ;                                      * 59CD2
        }                                        * 59CD7

* refs (1): 86ACE
{RULES\L()}:
        {                                        * 59CDC

_L()_:
          $       "L()"                          * 59CE1
          ::                                     * 59CF1
            OBJ_69C64                            * 59CF6
            MetaL()                              * 59CFB
          ;                                      * 59D00
        }                                        * 59D05

* refs (1): 86B28
{RULES\L*}:
        {                                        * 59D0A

_L*_:
          $       "L*"                           * 59D0F
          ::                                     * 59D1D
            OBJ_69C64                            * 59D22
            MetaL*                               * 59D27
          ;                                      * 59D2C
        }                                        * 59D31

* refs (1): 86B0A
{RULES\E^}:
        {                                        * 59D36

_E^_:
          $       "E^"                           * 59D3B
          ::                                     * 59D49
            OBJ_69C64                            * 59D4E
            MetaE^                               * 59D53
          ;                                      * 59D58
        }                                        * 59D5D

* refs (1): 86B41
{RULES\->()}:
        {                                        * 59D62

_->()_:
          $       "→()"                          * 59D67
          {                                      * 59D77
            ::                                   * 59D7C
              OBJ_69C64                          * 59D81
              Meta->()                           * 59D86
            ;                                    * 59D8B
            DoBadKey                             * 59D90
            ::                                   * 59D95
              OBJ_69CAC                          * 59D9A
              Meta->()all                        * 59D9F
            ;                                    * 59DA4
          }                                      * 59DA9
        }                                        * 59DAE

* refs (2): 86A9C 86AE7
{RULES\<-D}:
        {                                        * 59DB3

_<-D_:
          $       "←D"                           * 59DB8
          {                                      * 59DC6
            ::                                   * 59DCB
              OBJ_69C64                          * 59DD0
              Meta<-D                            * 59DD5
            ;                                    * 59DDA
            DoBadKey                             * 59DDF
            ::                                   * 59DE4
              OBJ_69CAC                          * 59DE9
              <-D[_]!                            * 59DEE
            ;                                    * 59DF3
          }                                      * 59DF8
        }                                        * 59DFD

* refs (4): 86AA1 86AEC 86B14 86B32
{RULES\D->}:
        {                                        * 59E02

_D->_:
          $       "D→"                           * 59E07
          {                                      * 59E15
            ::                                   * 59E1A
              OBJ_69C64                          * 59E1F
              MetaD->                            * 59E24
            ;                                    * 59E29
            DoBadKey                             * 59E2E
            ::                                   * 59E33
              OBJ_69CAC                          * 59E38
              MetaD->all                         * 59E3D
            ;                                    * 59E42
          }                                      * 59E47
        }                                        * 59E4C

* refs (1): 86B0F
{RULES\->TRG}:
        {                                        * 59E51

_->TRG_:
          $       "→TRG"                         * 59E56
          ::                                     * 59E68
            OBJ_69C64                            * 59E6D
            Meta->TRG                            * 59E72
          ;                                      * 59E77
        }                                        * 59E7C

* refs (1): 86B64
{RULES\->()}_59E81:
        {                                        * 59E81

_->()__59E86:
          $       "→()"                          * 59E86
          {                                      * 59E96
            ::                                   * 59E9B
              OBJ_69C64                          * 59EA0
              Meta->()C%                         * 59EA5
            ;                                    * 59EAA
            DoBadKey                             * 59EAF
            ::                                   * 59EB4
              OBJ_69CAC                          * 59EB9
              Meta->()C%all                      * 59EBE
            ;                                    * 59EC3
          }                                      * 59EC8
        }                                        * 59ECD

* refs (2): 86B73 86B87
{RULES\->DEF}:
        {                                        * 59ED2

_->DEF:
          $       "→DEF"                         * 59ED7
          ::                                     * 59EE9
            OBJ_69C64                            * 59EEE
            Meta->DEF                            * 59EF3
          ;                                      * 59EF8
        }                                        * 59EFD

* refs (1): 86B78
{RULES\TRG*}:
        {                                        * 59F02

_TRG*_:
          $       "TRG*"                         * 59F07
          ::                                     * 59F19
            OBJ_69C64                            * 59F1E
            MetaTRG*                             * 59F23
          ;                                      * 59F28
        }                                        * 59F2D

* refs (7): 596D8 59722 59770 597BA 59840 5988A ...
OBJ_59F32:
        ::                                       * 59F32
          AEQ1stcase                             * 59F37
          x=                                     * 59F3C
          ::                                     * 59F41
            RDROP                                * 59F46
          ;                                      * 59F4B
          DUP#2+PICK                             * 59F50
          OVER#+                                 * 59F55
          #3+                                    * 59F5A
          DUP#1+PICK                             * 59F5F
          BINT0                                  * 59F64
          #=casedrop                             * 59F69
          DROP                                   * 59F6E
          #+                                     * 59F73
          #1+                                    * 59F78
          OBJ_5F5AD                              * 59F7D
          NOT?SEMI                               * 59F82
          RDROP                                  * 59F87
        ;                                        * 59F8C

* refs (1): 1C9E5
size(ex):
        ::                                       * 59F91
          symcomp                                * 59F96
          EXPLODE                                * 59F9B
          BINT0                                  * 59FA0
          pshm1                                  * 59FA5
          BEGIN                                  * 59FAA
          ::                                     * 59FAF
            M1stFNCcase                          * 59FB4

delB[1-3]:
            ::                                   * 59FB9
              SWAPDROP#1-                        * 59FBE
              SWAPDROP#1-                        * 59FC3
              SWAPDROP#1-                        * 59FC8
            ;                                    * 59FCD
            #1-SWAP                              * 59FD2
            nonopcase                            * 59FD7
            DROP                                 * 59FDC
            infarg?                              * 59FE1
            casedrop                             * 59FE6
            SWAPDROP#1-                          * 59FEB
            DROP                                 * 59FF0
          ;                                      * 59FF5
          psh                                    * 59FFA
          #+                                     * 59FFF
          pshm1                                  * 5A004
          #0=UNTIL                               * 5A009
          2DROP                                  * 5A00E
          UNCOERCE                               * 5A013
        ;                                        * 5A018
