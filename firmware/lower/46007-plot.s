* HP 48GX ROM revision R, #46007-#49016: Plotting
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Π'SAVEDDEPTH xrng(2r) yrng(2r) STOAPPLDATA 'IDX dup;Vector*­Rcl(nm)? APPprompt1! Trceq SORTASLOW indep(2r) PlotScr*en FastCat?
* Follows on from the previous file (at #46007 in the original ROM).
        RPL

* refs (1): 3C51B
OBJ_46007:
        ::                                       * 46007
          MenuRow@                               * 4600C
          #1=case                                * 46011
          OBJ_46034                              * 46016
          MenuRow@                               * 4601B
          BINT7                                  * 46020
          #=case                                 * 46025
          OBJ_4A678                              * 4602A
        ;                                        * 4602F

* refs (1): 46016
OBJ_46034:
        ::                                       * 46034
          ROMPTR  0B5 08C                        * 46039
          5DROP                                  * 46044
          BINT9                                  * 46049
          ROLL                                   * 4604E
          BINT10                                 * 46053
          ROLL                                   * 46058

_Xvol:_:
          $       "Xvol:"                        * 4605D
          OBJ_4A834                              * 46071
          DISPROW3                               * 46076
          7ROLL                                  * 4607B
          8ROLL                                  * 46080

_Yvol:_:
          $       "Yvol:"                        * 46085
          OBJ_4A834                              * 46099
          DISPROW4                               * 4609E
          5ROLL                                  * 460A3
          6ROLL                                  * 460A8

_Zvol:_:
          $       "Zvol:"                        * 460AD
          OBJ_4A834                              * 460C1
          DISPROW5                               * 460C6
          ROT                                    * 460CB
          4ROLL                                  * 460D0

_Xrng:__460D5:
          $       "Xrng:"                        * 460D5
          OBJ_4A834                              * 460E9
          DISPROW6                               * 460EE
          SWAP                                   * 460F3

_Yrng:__460F8:
          $       "Yrng:"                        * 460F8
          OBJ_4A834                              * 4610C
          DISPROW7                               * 46111
          SetDA2OKTemp                           * 46116
        ;                                        * 4611B

* refs (2): 4A83E 4A857
OBJ_46120:
        ::                                       * 46120
          BINT8                                  * 46125
          OBJ_45D2A                              * 4612A
          BINT8                                  * 4612F
          OBJ_45E6F                              * 46134
        ;                                        * 46139

* refs (3): 4A4FF 4A5D1 4A73C
OBJ_4613E:
        ::                                       * 4613E
          SWAP                                   * 46143
          OBJ_45EB0                              * 46148
        ;                                        * 4614D

* refs (3): 20F94 4B20B 4F386
OBJ_46152:
        ::                                       * 46152
          '                                      * 46157

Π'PlotEnv:
          LAM     'PlotEnv                       * 4615C
          DRPExitAtLOOP                          * 46173
          NOT?SEMI                               * 46178
          BINT9                                  * 4617D
          ERROROUT                               * 46182
        ;                                        * 46187

* refs (1): 4B4E1
OBJ_4618C:
        ::                                       * 4618C
          OBJ_6F595                              * 46191
L_46196:
          #1=                                    * 46196
          TRUE                                   * 4619B
          OBJ_6F621                              * 461A0
          NOTcase                                * 461A5
          OBJ_6F608                              * 461AA
          OBJ_6F883                              * 461AF
          OBJ_678D6                              * 461B4
          OBJ_679D7                              * 461B9
          GOTO                                   * 461BE
          L_46196                                * 461C3
        ;                                        * 461C8

* refs (1): 6F59F
OBJ_461CD:
        ::                                       * 461CD
          TakeOver                               * 461D2

* refs (1): 6C433
OBJ_461D7:
          ::                                     * 461D7
            '                                    * 461DC
            OBJ_6A992                            * 461E1
          ;                                      * 461E6
          DUP                                    * 461EB
          MenuDef@                               * 461F0
          EQ                                     * 461F5
          caseDROP                               * 461FA
          InitMenu                               * 461FF
          DispMenu                               * 46204
        ;                                        * 46209

* refs (2): C0577 C066B
OBJ_4620E:
        ::                                       * 4620E
          15GETLAM                               * 46213
          DUP                                    * 46218
          21GETLAM                               * 4621D

Π'dependvar_46222:
          LAM     'dependvar                     * 46222

Π'vstp:
          LAM     'vstp                          * 4623D
          6ROLL                                  * 4624E
          ::                                     * 46253
            OBJ_45BE8                            * 46258
            ::                                   * 4625D
              3DROP                              * 46262
              RDROP                              * 46267
            ;                                    * 4626C
            ::                                   * 46271
              ROT                                * 46276
              %CHS                               * 4627B
              3UNROLL                            * 46280
            ;                                    * 46285
            ::                                   * 4628A
              2DROP                              * 4628F
              %-                                 * 46294
              RDROP                              * 46299
            ;                                    * 4629E
            %CHS                                 * 462A3
            ROTDROP                              * 462A8
            'EvalNoCK:_sup                       * 462AD
            xSTO-                                * 462B2
          ;                                      * 462B7
          OBJ_4588E                              * 462BC
        ;                                        * 462C1

* refs (1): C0483
OBJ_462C6:
        ::                                       * 462C6
          DUP                                    * 462CB
          OBJ_45CC2                              * 462D0
          ?SKIP                                  * 462D5
          ::                                     * 462DA
            ROMPTR  0F1 018                      * 462DF

Π'dependvar_462EA:
            LAM     'dependvar                   * 462EA

Π'Ystp_46305:
            LAM     'Ystp                        * 46305
            ROT                                  * 46316
            #3=                                  * 4631B
            IT                                   * 46320
            %CHS                                 * 46325
            'EvalNoCK:_sup                       * 4632A
            xSTO+                                * 4632F
            BINT0                                * 46334
          ;                                      * 46339
          OBJ_73C12                              * 4633E
        ;                                        * 46343
        FILLTO  #46378                           * 46348  48 zero nibbles: the next entry stays at #46378

* refs (1): 40BCE
OBJ_46378:
        ::                                       * 46378
          CK0NOLASTWD                            * 4637D
          0LASTOWDOB!                            * 46382
        ;                                        * 46387

* refs (1): 4D290
OBJ_4638C:
        ::                                       * 4638C
          BINT23                                 * 46391
          PUTLAM                                 * 46396
        ;                                        * 4639B

        ::                                       * 463A0
          BINT24                                 * 463A5
          PUTLAM                                 * 463AA
        ;                                        * 463AF

* refs (2): 44B09 44B91
OBJ_463B4:
        ::                                       * 463B4
          {                                      * 463B9
            BINT9                                * 463BE
            BINT10                               * 463C3
            BINT31                               * 463C8
            BINT32                               * 463CD
            BINT33                               * 463D2
            BINT36                               * 463D7
            BINT37                               * 463DC
            BINT41                               * 463E1
            BINT43                               * 463E6
          }                                      * 463EB
          NTHOF                                  * 463F0
          #0=case                                * 463F5
          FALSE                                  * 463FA
          'DoBadKeyT                             * 463FF
        ;                                        * 46404

CopyRowsUp:
        ROMPTR  0EA 057                          * 46409
        FILLTO  #4651C                           * 46414  264 zero nibbles: the next entry stays at #4651C

* refs (1): 8F396
CopyColsLeft:
        ROMPTR  0EA 059                          * 4651C

* refs (1): 45132
OBJ_46527:
        ::                                       * 46527
          DUPTYPECSTR?                           * 4652C
          case                                   * 46531
          ::                                     * 46536
            OVER                                 * 4653B
            TYPECSTR?                            * 46540
            NcaseTYPEERR                         * 46545
            BINT5                                * 4654A
            PPAR(s);dup;li?                      * 4654F
            NOTcase                              * 46554
            ::                                   * 46559
              3UNROLL                            * 4655E
              BINT3                              * 46563
              {}N                                * 46568
            ;                                    * 4656D
            ROTSWAP                              * 46572
            INNERCOMP                            * 46577
            pshzer                               * 4657C
            DUP                                  * 46581
            ZERO_DO                              * 46586
            #1-SWAP                              * 4658B
            DUPTYPECSTR?                         * 46590
            ITE                                  * 46595
            DROP                                 * 4659A
            psh1&rev                             * 4659F
            LOOP                                 * 465A4
            DROP                                 * 465A9
            #2+                                  * 465AE
            reversym                             * 465B3
            {}N                                  * 465B8
          ;                                      * 465BD
          OVER                                   * 465C2
          TYPECMP?                               * 465C7
          NcaseTYPEERR                           * 465CC
          DUP                                    * 465D1
          OBJ_4C64D                              * 465D6
          NcaseTYPEERR                           * 465DB
          BINT2                                  * 465E0
          {}N                                    * 465E5
        ;                                        * 465EA
        FILLTO  #46625                           * 465EF  54 zero nibbles: the next entry stays at #46625

* refs (1): 8F460
CopyRowsDown:
        ROMPTR  0EA 05B                          * 46625
        FILLTO  #4677E                           * 46630  334 zero nibbles: the next entry stays at #4677E

* refs (1): 8F502
CopyColsRght:
        ROMPTR  0EA 05E                          * 4677E

* refs (2): 4527C 454A7
OBJ_46789:
        ::                                       * 46789
          DUPTYPELIST?                           * 4678E
          NOTcasedrop                            * 46793
          ::                                     * 46798
            BINT10                               * 4679D
            BINT10                               * 467A2
          ;                                      * 467A7
          CDRCOMP                                * 467AC
          INNERCOMP                              * 467B1
          #2=                                    * 467B6
          case2drop                              * 467BB
          ::                                     * 467C0
            BINT10                               * 467C5
            BINT10                               * 467CA
          ;                                      * 467CF
          DUPTYPECSTR?                           * 467D4
          IT                                     * 467D9
          2DROP                                  * 467DE
          DUPTYPELIST?                           * 467E3
          ITE                                    * 467E8
          INCOMPDROP                             * 467ED
          DUP                                    * 467F2
          DUPTYPEREAL?                           * 467F7
          ?SEMI                                  * 467FC
          HXS>#                                  * 46801
          SWAP                                   * 46806
          HXS>#                                  * 4680B
          SWAP                                   * 46810
        ;                                        * 46815

* refs (2): 4E898 B615C
OBJ_4681A:
        ::                                       * 4681A
          RclAx*s                                * 4681F
          DUPTYPELIST?                           * 46824
          NOTcasedrop                            * 46829
          FALSE                                  * 4682E
          INNERCOMP                              * 46833
          BINT2                                  * 46838
          #=casedrop                             * 4683D
          2DROPFALSE                             * 46842
          BINT4                                  * 46847
          #=                                     * 4684C
          IT                                     * 46851
          ROTDROP                                * 46856
          ROTDROP                                * 4685B
          TRUE                                   * 46860
        ;                                        * 46865

* refs (5): 73A53 73AA8 73DAC 73E1F 8C690
OBJ_4686A:
        ::                                       * 4686A
          OBJ_46888                              * 4686F
          SWAP                                   * 46874
          RIGHT$3x6                              * 46879
          SWAPDROP                               * 4687E
        ;                                        * 46883

* refs (1): 4686F
OBJ_46888:
        ::                                       * 46888
          SWAPDUP                                * 4688D
          BINT0                                  * 46892
          !DcompWidth                            * 46897
          1stkdecomp$w                           * 4689C
          DUPLEN$                                * 468A1
          4ROLL                                  * 468A6
          #<case                                 * 468AB
          SWAPDROP                               * 468B0
          DROP                                   * 468B5
          savefmt1                               * 468BA
          ERRSET                                 * 468BF
          ::                                     * 468C4
            BINT2                                * 468C9
            DOSCI                                * 468CE
            1stkdecomp$w                         * 468D3
          ;                                      * 468D8
          ERRTRAP                                * 468DD
          ederr                                  * 468E2
          rstfmt1                                * 468E7
        ;                                        * 468EC

* refs (6): 0C6A4 0C717 458B6 46C25 46C89 73D20
OBJ_468F1:
        ::                                       * 468F1
          BINT25                                 * 468F6
          PUTLAM                                 * 468FB
        ;                                        * 46900

* refs (2): 7396D 739C7
OBJ_46905:
        ::                                       * 46905
          EQUATION                               * 4690A
          NOTcase                                * 4690F
          ERRJMP                                 * 46914
          DUPTYPELIST?                           * 46919
          NOTcasedrop                            * 4691E
          ::                                     * 46923
            BINT1                                * 46928
            OBJ_4BABC                            * 4692D
          ;                                      * 46932
          LENCOMP                                * 46937
        ;                                        * 4693C

* refs (2): 46C39 46C98
OBJ_46941:
        ::                                       * 46941
          Message60E                             * 46946
          FlashMsg                               * 4694B
        ;                                        * 46950

* refs (6): 0C681 0C703 45893 47768 47795 73CFD
OBJ_46955:
        ::                                       * 46955
          NEWINDEP                               * 4695A
          BINT24                                 * 4695F
          GETLAM                                 * 46964
          ERRSET                                 * 46969
          EVALCRUNCH                             * 4696E
          ERRTRAP                                * 46973
          ::                                     * 46978
            ERROR@                               * 4697D
            #       100                          * 46982  256
            #/                                   * 4698C
            SWAPDROP                             * 46991
            BINT3                                * 46996
            #<>case                              * 4699B
            ERRJMP                               * 469A0
            ERRORCLR                             * 469A5
            Π'SAVEDDEPTH                         * 469AA
            DEPTH                                * 469AF
            #1-SWAP                              * 469B4
            OBJ_6C339                            * 469B9
            NDROP                                * 469BE
            FALSE                                * 469C3
            RDROP                                * 469C8
          ;                                      * 469CD
          0LASTOWDOB!                            * 469D2
          CK1NOLASTWD                            * 469D7
          U>nbr                                  * 469DC
          TRUE                                   * 469E1
        ;                                        * 469E6
        BSS     20                               * 469EB

* refs (1): 488A0
OBJ_469FF:
        ::                                       * 469FF
          Save16                                 * 46A04
          SWAP                                   * 46A09
          DISPSTATUS2                            * 46A0E
          SORTASLOW                              * 46A13
          REPEATER                               * 46A18
          BINT17                                 * 46A1D
          NOP                                    * 46A22
          REPEATER                               * 46A27
          BINT5                                  * 46A2C
          NOP                                    * 46A31
          Restore16                              * 46A36
        ;                                        * 46A3B

* refs (1): 7347C
OBJ_46A40:
        ::                                       * 46A40
          NoExitAction                           * 46A45

{MenuGRAPH\EDIT}:
          {                                      * 46A4A
            {GRAPH\DOT+}                         * 46A4F
            {GRAPH\DOT-}                         * 46A54
            {GRAPH\LINE}                         * 46A59
            {GRAPH\TLINE}                        * 46A5E
            {GRAPH\BOX}                          * 46A63
            {GRAPH\CIRCLE}                       * 46A68
            {GRAPH\MARK}                         * 46A6D
            {GRAPH\+/-}                          * 46A72
            {GRAPH\LABEL}                        * 46A77
            {GRAPH\DEL}                          * 46A7C

{GRAPH\ERASE}:
            {                                    * 46A81

_ERASE_:
              $       "ERASE"                    * 46A86
              ::                                 * 46A9A
                CHECKMENU                        * 46A9F
                OBJ_4576C                        * 46AA4
              ;                                  * 46AA9
            }                                    * 46AAE

{GRAPH\MENU}:
            {                                    * 46AB3

_MENU_:
              $       "MENU"                     * 46AB8
              MENUOFF                            * 46ACA
            }                                    * 46ACF
            {GRAPH\SUä}                          * 46AD4
            {GRAPH\REPL}                         * 46AD9

{GRAPH\PICT->}:
            {                                    * 46ADE

_PICT->_:
              $       "PICT→"                    * 46AE3
              ::                                 * 46AF7
                CHECKMENU                        * 46AFC
                OBJ_45681                        * 46B01
              ;                                  * 46B06
            }                                    * 46B0B

{GRAPH\X,Y->}:
            {                                    * 46B10

_X,Y->_:
              $       "X,Y→"                     * 46B15
              ::                                 * 46B27
                CHECKMENU                        * 46B2C
                OBJ_73AEE                        * 46B31
              ;                                  * 46B36
            }                                    * 46B3B
            OBJ_456C2                            * 46B40
            OBJ_47D0D                            * 46B45
          }                                      * 46B4A
        ;                                        * 46B4F

* refs (2): 4A88D 8D17F
OBJ_46B54:
        ::                                       * 46B54
          BINT8                                  * 46B59
          BINT50                                 * 46B5E
          MAKEGROB                               * 46B63

{'PlotEnv}:
          {                                      * 46B68

Π'PlotEnv_46B6D:
            LAM     'PlotEnv                     * 46B6D
          }                                      * 46B84
          BIND                                   * 46B89
          BINT27                                 * 46B8E
          '                                      * 46B93
          nohalt                                 * 46B98
          CACHE                                  * 46B9D
        ;                                        * 46BA2

* refs (2): 4CE8D 4D2D1
OBJ_46BA7:
        ::                                       * 46BA7
          FALSE                                  * 46BAC
          ZEROZERO                               * 46BB1
          {                                      * 46BB6

Π'EnvOK:
            LAM     'EnvOK                       * 46BBB

Π'EXITFCN:
            LAM     'EXITFCN                     * 46BCE

* refs (25): 4569F 456AE 45735 45744 469AA 4770E ...
Π'SAVEDDEPTH:
            LAM     'SAVEDDEPTH                  * 46BE5
          }                                      * 46C02
          BIND                                   * 46C07
          EXITFCNsto                             * 46C0C
          NOP                                    * 46C11
        ;                                        * 46C16

* refs (4): 0C68B 0C69A 73D07 73D16
OBJ_46C1B:
        ::                                       * 46C1B
          PTR     NULL::                         * 46C20
          OBJ_468F1                              * 46C25
          7GETLAM                                * 46C2A
          OBJ_5102B                              * 46C2F
          ?SEMI                                  * 46C34
          OBJ_46941                              * 46C39
        ;                                        * 46C3E

* refs (3): 0C6B3 0C73A 458C0
OBJ_46C43:
        ::                                       * 46C43
          OBJ_46D24                              * 46C48
          SWAP                                   * 46C4D
          OBJ_46CCA                              * 46C52
          CROSS_OFF                              * 46C57
          TOTEMPSWAP                             * 46C5C
          TOTEMPSWAP                             * 46C61
          8PUTLAM                                * 46C66
          7PUTLAM                                * 46C6B
          CROSS_HAIRS                            * 46C70
        ;                                        * 46C75

* refs (4): 0C721 0C730 4589D 458AC
OBJ_46C7A:
        ::                                       * 46C7A
          RECORDX&YC%                            * 46C7F
          PTR     NULL::                         * 46C84
          OBJ_468F1                              * 46C89
          OBJ_5102B                              * 46C8E
          ?SEMI                                  * 46C93
          OBJ_46941                              * 46C98
        ;                                        * 46C9D

* refs (1): 472AE
OBJ_46CA2:
        ::                                       * 46CA2
          CROSS_HAIRS                            * 46CA7
          OBJ_4E68B                              * 46CAC
          OBJ_73657                              * 46CB1
          ?SEMI                                  * 46CB6
          CROSS_OFF                              * 46CBB
          OBJ_4703F                              * 46CC0
        ;                                        * 46CC5

* refs (1): 46C52
OBJ_46CCA:
        ::                                       * 46CCA
          6GETLAM                                * 46CCF
          10GETLAM                               * 46CD4
          getxpos                                * 46CD9
          SWAP                                   * 46CDE
          #1=?SKIP                               * 46CE3
          DROPZERO                               * 46CE8
          LEFTCOL                                * 46CED
          2DUP#<                                 * 46CF2
          IT                                     * 46CF7
          SWAP                                   * 46CFC
          DROP                                   * 46D01
          RIGHTCOL                               * 46D06
          2DUP#>                                 * 46D0B
          IT                                     * 46D10
          SWAP                                   * 46D15
          DROP                                   * 46D1A
        ;                                        * 46D1F

* refs (2): 46C48 73D25
OBJ_46D24:
        ::                                       * 46D24
          5GETLAM                                * 46D29
          9GETLAM                                * 46D2E
          getypos                                * 46D33
          SWAP                                   * 46D38
          #1=?SKIP                               * 46D3D
          DROPZERO                               * 46D42
          TOPROW                                 * 46D47
          2DUP#<                                 * 46D4C
          IT                                     * 46D51
          SWAP                                   * 46D56
          DROP                                   * 46D5B
          BOTROW                                 * 46D60
          2DUP#>                                 * 46D65
          IT                                     * 46D6A
          SWAP                                   * 46D6F
          DROP                                   * 46D74
        ;                                        * 46D79

        ::                                       * 46D7E
          #>$                                    * 46D83

Π'Ptype:
          LAM     'Ptype                         * 46D88
          {                                      * 46D9B
            xFUNCTION                            * 46DA0

_F__46DA5:
            $       "F"                          * 46DA5
            POLAR                                * 46DB1

_R__46DB6:
            $       "R"                          * 46DB6
            xPARAMETRIC                          * 46DC2

_P_:
            $       "P"                          * 46DC7
          }                                      * 46DD3
          EQLookup                               * 46DD8
          DROP                                   * 46DDD
          SWAP&$                                 * 46DE2
          $>ID                                   * 46DE7
        ;                                        * 46DEC
        NIBHEX  00000                            * 46DF1  ..

* refs (2): 736B6 736E3
OBJ_46DF6:
        ::                                       * 46DF6
          OBJ_4DCC6                              * 46DFB
          BINT2                                  * 46E00
          OBJ_735CB                              * 46E05
        ;                                        * 46E0A

* refs (2): 73701 7372E
OBJ_46E0F:
        ::                                       * 46E0F
          OBJ_4DCC6                              * 46E14
          BINT1                                  * 46E19
          OBJ_735CB                              * 46E1E
        ;                                        * 46E23

* refs (12): 4D3CB 4D3EE 4D402 4D4F2 4D515 4D529 ...
OBJ_46E28:
        ::                                       * 46E28
          TakeOver                               * 46E2D
          'R'R                                   * 46E32
          OBJ_5102B                              * 46E37
          IT                                     * 46E3C
          ::                                     * 46E41
            ROT                                  * 46E46
            BINT2                                * 46E4B
            ::N                                  * 46E50
          ;                                      * 46E55
          DUP                                    * 46E5A
          EVAL                                   * 46E5F
          OBJ_5102B                              * 46E64
          IT                                     * 46E69
          ::                                     * 46E6E
            ROT                                  * 46E73
            EVAL                                 * 46E78
          ;                                      * 46E7D
          OVER                                   * 46E82
          REPKEY?                                * 46E87
          NOTcase2DROP                           * 46E8C
          BEGIN                                  * 46E91
          2DUPSWAP                               * 46E96
          REPKEY?                                * 46E9B
          WHILE                                  * 46EA0
          ::                                     * 46EA5
            ::                                   * 46EAA
              OBJ_4DCC6                          * 46EAF
              EVAL                               * 46EB4
            ;                                    * 46EB9
          ;                                      * 46EBE
          REPEAT                                 * 46EC3
          3DROP                                  * 46EC8
        ;                                        * 46ECD

        ::                                       * 46ED2
          TakeOver                               * 46ED7
          OBJ_5102B                              * 46EDC
          IT                                     * 46EE1
          ::                                     * 46EE6
            ROT                                  * 46EEB
            BINT2                                * 46EF0
            ::N                                  * 46EF5
          ;                                      * 46EFA
          DUP                                    * 46EFF
          EVAL                                   * 46F04
          OBJ_5102B                              * 46F09
          IT                                     * 46F0E
          ::                                     * 46F13
            ROT                                  * 46F18
            EVAL                                 * 46F1D
          ;                                      * 46F22
          OVER                                   * 46F27
          REPKEY?                                * 46F2C
          NOTcase2DROP                           * 46F31
          BEGIN                                  * 46F36
          2DUPSWAP                               * 46F3B
          REPKEY?                                * 46F40
          WHILE                                  * 46F45
          ::                                     * 46F4A
            ::                                   * 46F4F
              OBJ_4DCC6                          * 46F54
              EVAL                               * 46F59
            ;                                    * 46F5E
          ;                                      * 46F63
          REPEAT                                 * 46F68
          3DROP                                  * 46F6D
        ;                                        * 46F72

        ::                                       * 46F77
          TakeOver                               * 46F7C
          'R'R                                   * 46F81
          OBJ_5102B                              * 46F86
          IT                                     * 46F8B
          ::                                     * 46F90
            ROT                                  * 46F95
            BINT2                                * 46F9A
            ::N                                  * 46F9F
          ;                                      * 46FA4
          DUP                                    * 46FA9
          EVAL                                   * 46FAE
          OBJ_5102B                              * 46FB3
          IT                                     * 46FB8
          ::                                     * 46FBD
            ROT                                  * 46FC2
            EVAL                                 * 46FC7
          ;                                      * 46FCC
          OVER                                   * 46FD1
          REPKEY?                                * 46FD6
          NOTcase2DROP                           * 46FDB
          BEGIN                                  * 46FE0
          2DUPSWAP                               * 46FE5
          REPKEY?                                * 46FEA
          WHILE                                  * 46FEF
          ::                                     * 46FF4
            ::                                   * 46FF9
              OBJ_4DCC6                          * 46FFE
              EVAL                               * 47003
            ;                                    * 47008
          ;                                      * 4700D
          REPEAT                                 * 47012
          3DROP                                  * 47017
        ;                                        * 4701C

* refs (2): 4D36C 4D687
OBJ_47021:
        ::                                       * 47021
          OBJ_4DB45                              * 47026
          OBJ_4E68B                              * 4702B
          OBJ_73657                              * 47030
          ?SEMI                                  * 47035
          CROSS_OFF                              * 4703A

* refs (5): 46CC0 470DF 4710C 4D42F 4D74F
OBJ_4703F:
          ::                                     * 4703F
            OBJ_73643                            * 47044
            case                                 * 47049
            OBJ_4DB8B                            * 4704E
            OBJ_4DB63                            * 47053
          ;                                      * 47058
        ;                                        * 4705D

        ::                                       * 47062
          '                                      * 47067
          OBJ_47236                              * 4706C
          OBJ_73602                              * 47071
          ITE                                    * 47076
          ::                                     * 4707B
            '                                    * 47080
            ::                                   * 47085
              OBJ_47209                          * 4708A
              OBJ_47236                          * 4708F
            ;                                    * 47094
          ;                                      * 47099
          ::                                     * 4709E
            '                                    * 470A3
            OBJ_47209                            * 470A8
          ;                                      * 470AD
        ;                                        * 470B2

* refs (4): 4D623 738B4 7390E 73940
OBJ_470B7:
        ::                                       * 470B7
          WINDOWRIGHT?                           * 470BC
          IT                                     * 470C1
          WINDOWRIGHT                            * 470C6
          CROSS_OFF                              * 470CB
          8GETLAM                                * 470D0
          14GETLAM                               * 470D5
          !#1+IF<dim-1                           * 470DA
          OBJ_4703F                              * 470DF
        ;                                        * 470E4

* refs (4): 0C834 0C88E 0C8C0 4D533
OBJ_470E9:
        ::                                       * 470E9
          WINDOWLEFT?                            * 470EE
          IT                                     * 470F3
          WINDOWLEFT                             * 470F8
          CROSS_OFF                              * 470FD
          8GETLAM                                * 47102
          !#1-IF>0                               * 47107
          OBJ_4703F                              * 4710C
        ;                                        * 47111

* refs (2): 8C835 8CA34
OBJ_47116:
        ::                                       * 47116
          BINT1                                  * 4711B
          16PUTLAM                               * 47120
          OBJ_471B1                              * 47125
          $>grob                                 * 4712A
          HARDBUFF2                              * 4712F
          BINT0                                  * 47134
          BINT2                                  * 47139
          GROB!                                  * 4713E
          $>grob                                 * 47143
          HARDBUFF2                              * 47148
          #       41                             * 4714D  65
          BINT2                                  * 47157
          GROB!                                  * 4715C
          OBJ_47209                              * 47161
          OBJ_47236                              * 47166
        ;                                        * 4716B

* refs (1): 8CB78
OBJ_47170:
        ::                                       * 47170
          BINT1                                  * 47175
          16PUTLAM                               * 4717A
          OBJ_471B1                              * 4717F
          $>grob                                 * 47184
          HARDBUFF2                              * 47189
          BINT0                                  * 4718E
          BINT2                                  * 47193
          GROB!                                  * 47198
          DROP                                   * 4719D
          OBJ_47209                              * 471A2
          OBJ_47236                              * 471A7
        ;                                        * 471AC

* refs (2): 47125 4717F
OBJ_471B1:
        ::                                       * 471B1
          OBJ_4D96B                              * 471B6
          ID>$                                   * 471BB
          ONEONE                                 * 471C0
          SUB$                                   * 471C5
          $       ": "                           * 471CA
          &$                                     * 471D8
          INDEPVAR                               * 471DD
          ID>$                                   * 471E2
          ONEONE                                 * 471E7
          SUB$                                   * 471EC
          $       ": "                           * 471F1
          &$                                     * 471FF
        ;                                        * 47204

* refs (18): 0C7FD 0C848 0C8C5 4708A 470A8 47161 ...
OBJ_47209:
        ::                                       * 47209
          OBJ_73602                              * 4720E
          NOTcase                                * 47213
          OBJ_73DE8                              * 47218
          BINT26                                 * 4721D
          GETLAM                                 * 47222
          CARCOMP                                * 47227
          EVAL                                   * 4722C
        ;                                        * 47231

* refs (10): 0C807 0C84D 4706C 4708F 47166 471A7 ...
OBJ_47236:
        ::                                       * 47236
          OBJ_73602                              * 4723B
          NOTcase                                * 47240
          OBJ_73A8F                              * 47245
          BINT26                                 * 4724A
          GETLAM                                 * 4724F
          BINT2                                  * 47254
          NTHCOMPDROP                            * 47259
          EVAL                                   * 4725E
        ;                                        * 47263

* refs (2): 45BD9 73837
OBJ_47268:
        ::                                       * 47268
          BINT0                                  * 4726D
          OBJ_735CB                              * 47272
          OBJ_5102B                              * 47277
          NOT?SEMI                               * 4727C
          OBJ_73B61                              * 47281
        ;                                        * 47286

* refs (2): 4D493 4D592
OBJ_4728B:
        ::                                       * 4728B
          OBJ_73602                              * 47290
          case                                   * 47295
          DoBadKey                               * 4729A
          CROSS_OFF                              * 4729F
          TOTEMPOB                               * 472A4
          8PUTLAM                                * 472A9
          OBJ_46CA2                              * 472AE
        ;                                        * 472B3

* refs (7): 45A07 8A68D 8B2F2 8B584 8B986 8C0DC ...
OBJ_472B8:
        ::                                       * 472B8
          'R                                     * 472BD
          EVAL                                   * 472C2
          ERRJMP                                 * 472C7
        ;                                        * 472CC

* refs (6): 4B61B 4F723 4F7EB 4FA16 4FBC9 50479
OBJ_472D1:
        ::                                       * 472D1
          3PICK                                  * 472D6
          GROBDIM                                * 472DB
        ;                                        * 472E0
        FILLTO  #4735A                           * 472E5  117 zero nibbles: the next entry stays at #4735A

* refs (11): 1574E 2C2A2 473F0 47C86 496B9 4AA46 ...
OBJ_4735A:
        ::                                       * 4735A
          dup;Vector*­Rcl(nm)?                   * 4735F
          DUP                                    * 47364
          case                                   * 47369
          ROTDROP                                * 4736E
          SWAPDROP                               * 47373
        ;                                        * 47378

* refs (4): 2C257 4735F 4746C 47876
dup;Vector*­Rcl(nm)?:
        ::                                       * 4737D
          dup;RclInVars(gn)?                     * 47382
          NOTcaseFALSE                           * 47387
          OVER                                   * 4738C
          'EQ                                    * 47391
          EQUALcase                              * 47396
          ::                                     * 4739B
            OBJ_473E6                            * 473A0
            OVER                                 * 473A5
            EQUALcase                            * 473AA
            TRUE                                 * 473AF
            GOTO                                 * 473B4
            L_473C3                              * 473B9
          ;                                      * 473BE
L_473C3:
          DUPTYPEIDNT?                           * 473C3
          NOTcaseTRUE                            * 473C8
          DUPSAFE@                               * 473CD
          IT                                     * 473D2
          ROTDROP                                * 473D7
          TRUE                                   * 473DC
        ;                                        * 473E1

* refs (3): 15398 473A0 478D5
OBJ_473E6:
        ::                                       * 473E6
          'IDPAR                                 * 473EB
          OBJ_4735A                              * 473F0
          NOTcase                                * 473F5
          'IDX                                   * 473FA
          DUPTYPELIST?                           * 473FF
          NOTcasedrop                            * 47404
          'IDX                                   * 47409
          BINT3                                  * 4740E
          NTHELCOMP                              * 47413
          NOTcase                                * 47418
          'IDX                                   * 4741D
          1get(li)?                              * 47422
        ;                                        * 47427

* refs (1): 48553
OBJ_4742C:
        ::                                       * 4742C
          7GETLAM                                * 47431
          #1+                                    * 47436
          OBJ_486D9                              * 4743B
        ;                                        * 47440

* refs (3): 0DCD1 0DD99 0DE52
OBJ_47445:
        ::                                       * 47445
        ;                                        * 4744A

* -> id
* refs (11): 473FA 47409 4741D 48BE8 48C1F 48C65 ...
'IDX:
        ::                                       * 4744F
          '                                      * 47454

X:
          ID      X                              * 47459
        ;                                        * 47462

* refs (11): 2C225 49691 49A97 49B14 49D2B 51080 ...
STOAPPLDATA:
        ::                                       * 47467
          dup;Vector*­Rcl(nm)?                   * 4746C
          IT                                     * 47471
          DROP                                   * 47476
          XEQSTOID                               * 4747B
        ;                                        * 47480

* refs (1): 73429
PlotScr*en:
        ::                                       * 47485
          NoExitAction                           * 4748A

{MenuGRAPH\FCN}:
          {                                      * 4748F

{FCN\ROOT}:
            {                                    * 47494

_ROOT_:
              $       "ROOT"                     * 47499
              OBJ_48CFB                          * 474AB
            }                                    * 474B0

{FCN\ISECT}:
            {                                    * 474B5

_ISECT_:
              $       "ISECT"                    * 474BA
              OBJ_48D37                          * 474CE
            }                                    * 474D3

{FCN\SLOPE}:
            {                                    * 474D8

_SLOPE_:
              $       "SLOPE"                    * 474DD
              OBJ_4973A                          * 474F1
            }                                    * 474F6

{FCN\AREA}:
            {                                    * 474FB

_AREA__47500:
              $       "AREA"                     * 47500
              OBJ_497E7                          * 47512
            }                                    * 47517

{FCN\SHADE}:
            {                                    * 4751C

_SHADE_:
              $       "SHADE"                    * 47521
              OBJ_477DB                          * 47535
            }                                    * 4753A

{FCN\EXTR}:
            {                                    * 4753F

_EXTR_:
              $       "EXTR"                     * 47544
              OBJ_48D64                          * 47556
            }                                    * 4755B

{FCN\F(X)}:
            {                                    * 47560

_F(X)_:
              $       "F(X)"                     * 47565
              OBJ_499C2                          * 47577
            }                                    * 4757C

{FCN\F'}:
            {                                    * 47581

_F'_:
              $       "F'"                       * 47586
              OBJ_49ABF                          * 47594
            }                                    * 47599

{FCN\TANL}:
            {                                    * 4759E

_TANL_:
              $       "TANL"                     * 475A3
              OBJ_4762E                          * 475B5
            }                                    * 475BA

{FCN\NXEQ}:
            {                                    * 475BF

_NXEQ__475C4:
              $       "NXEQ"                     * 475C4
              ::                                 * 475D6
                CHECKMENU                        * 475DB
                NextInEQ                         * 475E0
              ;                                  * 475E5
            }                                    * 475EA

{FCN\VIEW}:
            {                                    * 475EF

_VIEW__475F4:
              $       "VIEW"                     * 475F4
              ::                                 * 47606
                CHECKMENU                        * 4760B
                OBJ_48873                        * 47610
              ;                                  * 47615
            }                                    * 4761A
            OBJ_47D0D                            * 4761F
          }                                      * 47624
        ;                                        * 47629

* refs (1): 475B5
OBJ_4762E:
        ::                                       * 4762E
          CHECKMENU                              * 47633
          OBJ_49B4B                              * 47638
          2DROP                                  * 4763D
          CRUNCHNoBlame                          * 47642
          DUPTYPEREAL?                           * 47647
          NOTcasedrop                            * 4764C
          ERRJMP                                 * 47651
          OBJ_49B4B                              * 47656
          CkEQUtil                               * 4765B
          PointDerivUt                           * 47660
          ZEROZERO                               * 47665
          ROT                                    * 4766A
          OBJ_49E3E                              * 4766F
          ROTROT2DROP                            * 47674
          OBJ_4D96B                              * 47679
          SWAP                                   * 4767E
          INDEPVAR                               * 47683
          8GETLAM                                * 47688
          OBJ_4782B                              * 4768D
          3PICK                                  * 47692
          %*                                     * 47697
          5ROLL                                  * 4769C
          SWAP                                   * 476A1
          %-                                     * 476A6
          '                                      * 476AB
          x*                                     * 476B0
          SWAP                                   * 476B5
          BINT5                                  * 476BA
          meta+                                  * 476BF
          DROP                                   * 476C4
          '                                      * 476C9
          x=                                     * 476CE
          BINT7                                  * 476D3
          SYMBN                                  * 476D8
          DUP                                    * 476DD
          GETRHS                                 * 476E2
          BINT24                                 * 476E7
          PUTLAM                                 * 476EC

_TanLine_:
          $       "TanLine"                      * 476F1
          >TAG                                   * 47709
          Π'SAVEDDEPTH                           * 4770E
          #1+                                    * 47713
          '                                      * 47718
          Π'SAVEDDEPTH                           * 4771D
          STO                                    * 47722
          AtUserStack                            * 47727
          DUP                                    * 4772C
          OBJ_49D3A                              * 47731

* refs (2): 47781 477A4
OBJ_47736:
          ::                                     * 47736
            GETINDEP                             * 4773B
            GETPMIN&MAX                          * 47740
            OBJ_4A8F1                            * 47745
            %MAXorder                            * 4774A
            SWAP                                 * 4774F
          ;                                      * 47754
          DROP                                   * 47759
          15GETLAM                               * 4775E
          SWAP                                   * 47763
          OBJ_46955                              * 47768
          NOTcase                                * 4776D
          ERRJMP                                 * 47772
          BINT28                                 * 47777
          PUTLAM                                 * 4777C
          OBJ_47736                              * 47781
          SWAPDROP                               * 47786
          15GETLAM                               * 4778B
          SWAP                                   * 47790
          OBJ_46955                              * 47795
          NOTcase                                * 4779A
          ERRJMP                                 * 4779F
          OBJ_47736                              * 477A4
          ROT                                    * 477A9
          %>C%                                   * 477AE
          SWAP                                   * 477B3
          BINT28                                 * 477B8
          GETLAM                                 * 477BD
          %>C%                                   * 477C2
          OBJ_4E6C7                              * 477C7
          line(2c)                               * 477CC
          CROSSMARKON                            * 477D1
        ;                                        * 477D6

* refs (1): 47535
OBJ_477DB:
        ::                                       * 477DB
          CHECKMENU                              * 477E0
          OBJ_4579E                              * 477E5
          2DROP                                  * 477EA
          OBJ_4781C                              * 477EF
          '                                      * 477F4
          OBJ_488AF                              * 477F9
          BINT3                                  * 477FE
          ::N                                    * 47803
          '                                      * 47808
          ExitFcn                                * 4780D
          STO                                    * 47812
        ;                                        * 47817

* refs (1): 477EF
OBJ_4781C:
        ::                                       * 4781C
          OBJ_73DFC                              * 47821
          1GETLAM                                * 47826

* refs (4): 4768D 4981E 73C85 73E06
OBJ_4782B:
          ::                                     * 4782B
            UNCOERCE%%                           * 47830
            6GETLAM                              * 47835
            %%-                                  * 4783A
            10GETLAM                             * 4783F
            %%/>%                                * 47844
          ;                                      * 47849
          %MAXorder                              * 4784E
        ;                                        * 47853

* refs (5): 49030 49B55 49B82 4B751 4BAC6
OBJ_47858:
        ::                                       * 47858
          DUP                                    * 4785D
          ALGeq?                                 * 47862
        ;                                        * 47867

* refs (3): 15278 153CA 49D35
Trceq:
        ::                                       * 4786C
          'EQ                                    * 47871
          dup;Vector*­Rcl(nm)?                   * 47876
          NOT?SEMI                               * 4787B
          DUP                                    * 47880
          EqList?                                * 47885
          NOTcase                                * 4788A

* refs (1): 478F3
OBJ_4788F:
          ::                                     * 4788F
            SWAP                                 * 47894
            FastCat?                             * 47899
            NOTcase                              * 4789E
            ID>TAG                               * 478A3
            'EQ                                  * 478A8
            EQcase                               * 478AD
            ID>TAG                               * 478B2
            SWAPDROP                             * 478B7
          ;                                      * 478BC
          SWAPDROP                               * 478C1
          CARCOMP                                * 478C6
          DUPTYPEIDNT?                           * 478CB
          NOT?SEMI                               * 478D0
          OBJ_473E6                              * 478D5
          OVER                                   * 478DA
          EQUAL                                  * 478DF
          ?SEMI                                  * 478E4
          dup;RclInVars(gn)?                     * 478E9
          IT                                     * 478EE
          OBJ_4788F                              * 478F3
        ;                                        * 478F8

        #       62E                              * 478FD  1582

        #       618                              * 47907  1560

        #       619                              * 47911  1561

        #       61A                              * 4791B  1562

        #       61B                              * 47925  1563

* refs (1): 2210A
OBJ_4792F:
        #       61C                              * 4792F  1564

        #       61D                              * 47939  1565

        #       61E                              * 47943  1566

* refs (1): 4A03C
OBJ_4794D:
        #       61F                              * 4794D  1567

        #       620                              * 47957  1568

        #       621                              * 47961  1569

* refs (1): 20281
OBJ_4796B:
        #       605                              * 4796B  1541

* refs (1): 15282
1FrDisp(st):
        ::                                       * 47975
          OBJ_479D4                              * 4797A
          caseDROP                               * 4797F

* refs (4): 15586 15617 15680 9EF0A
APPprompt1!:
          ::                                     * 47984
            OBJ_4945A                            * 47989
            DISPROW1                             * 4798E
            DispStsBound                         * 47993
          ;                                      * 47998
          SetDA1Valid                            * 4799D
        ;                                        * 479A2

* refs (1): 99252
APPprompt2:
        ::                                       * 479A7
          OBJ_479D4                              * 479AC
          case2DROP                              * 479B1

1&2FrDisp(st):
          ::                                     * 479B6
            DISPROW1                             * 479BB
            DISPROW2                             * 479C0
            SetDA1Valid                          * 479C5
          ;                                      * 479CA
        ;                                        * 479CF

* refs (4): 15269 220FB 4797A 479AC
OBJ_479D4:
        ::                                       * 479D4
          PrgmEntry?                             * 479D9
          AppMode?                               * 479DE
          OR                                     * 479E3
          OBJ_6DE82                              * 479E8
          OR                                     * 479ED
          EditLExists?                           * 479F2
          OR                                     * 479F7
          BINT58                                 * 479FC
          TestSysFlag                            * 47A01
          OR                                     * 47A06
          KEYINBUFFER?                           * 47A0B
          OR                                     * 47A10
        ;                                        * 47A15

* refs (16): 1E630 48E00 48E6E 48EB4 48EEB 8A134 ...
xrng(2r):
        ::                                       * 47A1A
          %MAXorder                              * 47A1F
          2DUP                                   * 47A24
          %=                                     * 47A29
          caseSIZEERR                            * 47A2E
          PUTXMIN                                * 47A33
          PUTXMAX                                * 47A38
        ;                                        * 47A3D

* refs (13): 1E650 4959B 8A15B 8AC4D 8B625 8BCFE ...
yrng(2r):
        ::                                       * 47A42
          %MAXorder                              * 47A47
          2DUP                                   * 47A4C
          %=                                     * 47A51
          caseSIZEERR                            * 47A56
          PUTYMIN                                * 47A5B
          PUTYMAX                                * 47A60
        ;                                        * 47A65

* refs (1): 1E06D
indep(2r):
        ::                                       * 47A6A
          CK2NOLASTWD                            * 47A6F
          BINT2                                  * 47A74
          {}N                                    * 47A79
          COLA                                   * 47A7E
          xINDEP                                 * 47A83
        ;                                        * 47A88

* refs (1): 1E24E
OBJ_47A8D:
        ::                                       * 47A8D
          CK2NOLASTWD                            * 47A92
          BINT2                                  * 47A97
          {}N                                    * 47A9C
          COLA                                   * 47AA1
          xDEPND                                 * 47AA6
        ;                                        * 47AAB

* refs (1): 47899
FastCat?:
        ::                                       * 47AB0
          BINT59                                 * 47AB5
          TestSysFlag                            * 47ABA
        ;                                        * 47ABF

* refs (1): 47E19
OBJ_47AC4:
        ::                                       * 47AC4
          CHECKMENU                              * 47AC9
          OBJ_4EEBF                              * 47ACE
          TRUE                                   * 47AD3
          OBJ_47B00                              * 47AD8
        ;                                        * 47ADD

* refs (1): 47E3A
OBJ_47AE2:
        ::                                       * 47AE2
          CHECKMENU                              * 47AE7
          FALSE                                  * 47AEC
          OBJ_4EEBF                              * 47AF1
          OBJ_47B00                              * 47AF6
        ;                                        * 47AFB

* refs (2): 47AD8 47AF6
OBJ_47B00:
        ::                                       * 47B00
          OBJ_47C6D                              * 47B05
          3PICKSWAP                              * 47B0A
          OBJ_47B6E                              * 47B0F
          VSCALE                                 * 47B14
          DROP                                   * 47B19
          OBJ_47B6E                              * 47B1E
          HSCALE                                 * 47B23
          DROP                                   * 47B28
          OBJ_47BF5                              * 47B2D
        ;                                        * 47B32

* refs (1): 47BFA
OBJ_47B37:
        ::                                       * 47B37
          OBJ_496A0                              * 47B3C
          NOTcaseFALSE                           * 47B41
          DROP                                   * 47B46
          ROTROT2DROP                            * 47B4B
          DUPTYPEREAL?                           * 47B50
          NOTcasedrop                            * 47B55
          FALSE                                  * 47B5A
          %1                                     * 47B5F
          %=                                     * 47B64
        ;                                        * 47B69

* refs (4): 47B0F 47B1E 48102 4812A
OBJ_47B6E:
        ::                                       * 47B6E
          %ABS                                   * 47B73
          DUP                                    * 47B78
          %0=                                    * 47B7D
          IT                                     * 47B82
          ::                                     * 47B87
            DROP                                 * 47B8C
            %MINREAL                             * 47B91
          ;                                      * 47B96
          DUP                                    * 47B9B
          %1                                     * 47BA0
          %>                                     * 47BA5
          3PICK                                  * 47BAA
          XOR                                    * 47BAF
          ?SEMI                                  * 47BB4
          %1                                     * 47BB9
          SWAP                                   * 47BBE
          %/                                     * 47BC3
        ;                                        * 47BC8

* refs (1): 47E5B
OBJ_47BCD:
        ::                                       * 47BCD
          CHECKMENU                              * 47BD2
          OBJ_4EEBF                              * 47BD7
          GETSCALE                               * 47BDC
          DROPDUP                                * 47BE1
          PUTSCALE                               * 47BE6
          OBJ_47BF5                              * 47BEB
        ;                                        * 47BF0

* refs (8): 47B2D 47BEB 47C63 4801C 48071 48111 ...
OBJ_47BF5:
        ::                                       * 47BF5
          OBJ_47B37                              * 47BFA
          IT                                     * 47BFF
          ::                                     * 47C04
            RECORDX&YC%                          * 47C09
            centr(c)                             * 47C0E
          ;                                      * 47C13
          OBJ_4DAA3                              * 47C18
        ;                                        * 47C1D

        ::                                       * 47C22
          CHECKMENU                              * 47C27
          OBJ_4EEBF                              * 47C2C
          BINT131                                * 47C31
          MakeRange(s)                           * 47C36
          BINT64                                 * 47C3B
          MakeRange(s)                           * 47C40
          ROTSWAP                                * 47C45
          %>C%                                   * 47C4A
          3UNROLL                                * 47C4F
          %>C%                                   * 47C54
          pmin(c)                                * 47C59
          pmax(c)                                * 47C5E
          OBJ_47BF5                              * 47C63
        ;                                        * 47C68

* refs (3): 47B05 480F8 48120
OBJ_47C6D:
        ::                                       * 47C6D
          '                                      * 47C72

ZPAR:
          ID      ZPAR                           * 47C77
          OBJ_4735A                              * 47C86
          NOTcase                                * 47C8B

* refs (3): 47CAE 47CD6 47D03
OBJ_47C90:
          ::                                     * 47C90
            %4                                   * 47C95
            %4                                   * 47C9A
          ;                                      * 47C9F
          DUPTYPELIST?                           * 47CA4
          NOTcasedrop                            * 47CA9
          OBJ_47C90                              * 47CAE
          INNERCOMP                              * 47CB3
          DUP                                    * 47CB8
          BINT4                                  * 47CBD
          #=                                     * 47CC2
          NOTcase                                * 47CC7
          ::                                     * 47CCC
            NDROP                                * 47CD1
            OBJ_47C90                            * 47CD6
          ;                                      * 47CDB
          3DROP                                  * 47CE0
          DUPTYPEREAL?                           * 47CE5
          3PICK                                  * 47CEA
          TYPEREAL?                              * 47CEF
          AND                                    * 47CF4
          ?SEMI                                  * 47CF9
          2DROP                                  * 47CFE
          OBJ_47C90                              * 47D03
        ;                                        * 47D08

* refs (3): 46B45 4761F 47FE5
OBJ_47D0D:
        {                                        * 47D0D
          ::                                     * 47D12

{PICT\}:
            PTR     DirLabel:                    * 47D17

PICT:
            $       "PICT"                       * 47D1C
          ;                                      * 47D2E
          ::                                     * 47D33
            CHECKMENU                            * 47D38
            BINT22                               * 47D3D
            GETLAM                               * 47D42
            InitMenu                             * 47D47
            DispMenu                             * 47D4C
          ;                                      * 47D51
        }                                        * 47D56

* refs (1): 47DCA
OBJ_47D5B:
        ::                                       * 47D5B
          CHECKMENU                              * 47D60
          DOCLLCD                                * 47D65
          TOADISP                                * 47D6A
          CROSS_OFF                              * 47D6F
          ROMPTR  0B4 0D1                        * 47D74
          TOGDISP                                * 47D7F
          CROSS_HAIRS                            * 47D84
          DispMenu                               * 47D89
        ;                                        * 47D8E

* refs (2): 0C910 7334C
OBJ_47D93:
        ::                                       * 47D93
          NoExitAction                           * 47D98
          {                                      * 47D9D
            {                                    * 47DA2

{MenuGRAPH\ZOOM}:
              ::                                 * 47DA7

{ZOOM\ZFACT}:
                PTR     DirLabel:                * 47DAC

ZFACT:
                $       "ZFACT"                  * 47DB1
              ;                                  * 47DC5
              OBJ_47D5B                          * 47DCA
            }                                    * 47DCF
            {                                    * 47DD4
              ::                                 * 47DD9

{ZOOM\BOXZ}:
                PTR     DirLabel:                * 47DDE

BOXZ:
                $       "BOXZ"                   * 47DE3
              ;                                  * 47DF5
              OBJ_0C924                          * 47DFA
            }                                    * 47DFF
            {                                    * 47E04

ZIN:
              $       "ZIN"                      * 47E09
              OBJ_47AC4                          * 47E19
            }                                    * 47E1E
            {                                    * 47E23

ZOUT:
              $       "ZOUT"                     * 47E28
              OBJ_47AE2                          * 47E3A
            }                                    * 47E3F
            {                                    * 47E44

ZSQR:
              $       "ZSQR"                     * 47E49
              OBJ_47BCD                          * 47E5B
            }                                    * 47E60
            {                                    * 47E65

ZDFLT:
              $       "ZDFLT"                    * 47E6A
              OBJ_48161                          * 47E7E
            }                                    * 47E83
            {                                    * 47E88

HZIN:
              $       "HZIN"                     * 47E8D
              OBJ_4807B                          * 47E9F
            }                                    * 47EA4
            {                                    * 47EA9

HZOUT:
              $       "HZOUT"                    * 47EAE
              OBJ_48099                          * 47EC2
            }                                    * 47EC7
            {                                    * 47ECC

VZIN:
              $       "VZIN"                     * 47ED1
              OBJ_480B7                          * 47EE3
            }                                    * 47EE8
            {                                    * 47EED

VZOUT:
              $       "VZOUT"                    * 47EF2
              OBJ_480D5                          * 47F06
            }                                    * 47F0B
            {                                    * 47F10
              $       "CNTR"                     * 47F15
              OBJ_4E753                          * 47F27
            }                                    * 47F2C
            {                                    * 47F31

ZAUTO:
              $       "ZAUTO"                    * 47F36
              OBJ_48143                          * 47F4A
            }                                    * 47F4F
            {                                    * 47F54
              $       "ZDECI"                    * 47F59
              OBJ_47FF4                          * 47F6D
            }                                    * 47F72
            {                                    * 47F77
              $       "ZINTG"                    * 47F7C
              OBJ_4802B                          * 47F90
            }                                    * 47F95
            {                                    * 47F9A
              $       "ZTRIG"                    * 47F9F
              OBJ_48049                          * 47FB3
            }                                    * 47FB8
            {                                    * 47FBD
              $       "ZLAST"                    * 47FC2
              OBJ_4965A                          * 47FD6
            }                                    * 47FDB
            OBJ_456C2                            * 47FE0
            OBJ_47D0D                            * 47FE5
          }                                      * 47FEA
        ;                                        * 47FEF

* refs (1): 47F6D
OBJ_47FF4:
        ::                                       * 47FF4
          CHECKMENU                              * 47FF9
          OBJ_4EEBF                              * 47FFE
          %1                                     * 48003

* refs (1): 4803F
OBJ_48008:
          ::                                     * 48008
            GETSCALE                             * 4800D
            SWAPDROP                             * 48012
            PUTSCALE                             * 48017
            OBJ_47BF5                            * 4801C
          ;                                      * 48021
        ;                                        * 48026

* refs (1): 47F90
OBJ_4802B:
        ::                                       * 4802B
          CHECKMENU                              * 48030
          OBJ_4EEBF                              * 48035
          %10                                    * 4803A
          OBJ_48008                              * 4803F
        ;                                        * 48044

* refs (1): 47FB3
OBJ_48049:
        ::                                       * 48049
          CHECKMENU                              * 4804E
          OBJ_4EEBF                              * 48053
          %%PI                                   * 48058
          %%2                                    * 4805D
          %%/>%                                  * 48062
          %1                                     * 48067
          PUTSCALE                               * 4806C
          OBJ_47BF5                              * 48071
        ;                                        * 48076

* refs (1): 47E9F
OBJ_4807B:
        ::                                       * 4807B
          CHECKMENU                              * 48080
          OBJ_4EEBF                              * 48085
          TRUE                                   * 4808A
          OBJ_480F3                              * 4808F
        ;                                        * 48094

* refs (1): 47EC2
OBJ_48099:
        ::                                       * 48099
          CHECKMENU                              * 4809E
          OBJ_4EEBF                              * 480A3
          FALSE                                  * 480A8
          OBJ_480F3                              * 480AD
        ;                                        * 480B2

* refs (1): 47EE3
OBJ_480B7:
        ::                                       * 480B7
          CHECKMENU                              * 480BC
          OBJ_4EEBF                              * 480C1
          TRUE                                   * 480C6
          OBJ_4811B                              * 480CB
        ;                                        * 480D0

* refs (1): 47F06
OBJ_480D5:
        ::                                       * 480D5
          CHECKMENU                              * 480DA
          OBJ_4EEBF                              * 480DF
          FALSE                                  * 480E4
          OBJ_4811B                              * 480E9
        ;                                        * 480EE

* refs (2): 4808F 480AD
OBJ_480F3:
        ::                                       * 480F3
          OBJ_47C6D                              * 480F8
          DROP                                   * 480FD
          OBJ_47B6E                              * 48102
          HSCALE                                 * 48107
          DROP                                   * 4810C
          OBJ_47BF5                              * 48111
        ;                                        * 48116

* refs (2): 480CB 480E9
OBJ_4811B:
        ::                                       * 4811B
          OBJ_47C6D                              * 48120
          SWAPDROP                               * 48125
          OBJ_47B6E                              * 4812A
          VSCALE                                 * 4812F
          DROP                                   * 48134
          OBJ_47BF5                              * 48139
        ;                                        * 4813E

* refs (1): 47F4A
OBJ_48143:
        ::                                       * 48143
          CHECKMENU                              * 48148
          OBJ_4EEBF                              * 4814D
          AUTOSCALE                              * 48152
          OBJ_47BF5                              * 48157
        ;                                        * 4815C

* refs (1): 47E7E
OBJ_48161:
        ::                                       * 48161
          CHECKMENU                              * 48166
          OBJ_4EEBF                              * 4816B
          ERRSET                                 * 48170
          ::                                     * 48175
            INDEPVAR                             * 4817A
            OBJ_4D96B                            * 4817F
            GETPTYPE                             * 48184
          ;                                      * 48189
          ERRTRAP                                * 4818E
          ::                                     * 48193
            ERRORCLR                             * 48198
            DropSysObs                           * 4819D
            ID_X                                 * 481A2
            ID_Y                                 * 481A7
            'IDFUNCTION                          * 481AC
          ;                                      * 481B1
          MAKEPVARS                              * 481B6
          DROP                                   * 481BB
          PUTPTYPE                               * 481C0
          depnd(gn)                              * 481C5
          PUTINDEP                               * 481CA
          OBJ_4DAA3                              * 481CF
        ;                                        * 481D4

* refs (1): 4D6F0
OBJ_481D9:
        ::                                       * 481D9
          OBJ_4DCC6                              * 481DE
          WINDOWBOT?                             * 481E3
          IT                                     * 481E8
          WINDOWDOWN                             * 481ED
          OBJ_517B2                              * 481F2
          DUP                                    * 481F7
          13GETLAM                               * 481FC
          #=                                     * 48201
          3UNROLL                                * 48206
          OBJ_4E0BA                              * 4820B
          7GETLAM                                * 48210
          13GETLAM                               * 48215
          !#1+IF<dim-1                           * 4821A
          OBJ_48472                              * 4821F
          ?SKIP                                  * 48224
          OBJ_48503                              * 48229
          OBJ_484BD                              * 4822E
        ;                                        * 48233

* refs (1): 4D3D5
OBJ_48238:
        ::                                       * 48238
          OBJ_4DCC6                              * 4823D
          WINDOWTOP?                             * 48242
          IT                                     * 48247
          WINDOWUP                               * 4824C
          OBJ_517B2                              * 48251
          DUP#0=                                 * 48256
          3UNROLL                                * 4825B
          OBJ_4E0BA                              * 48260
          7GETLAM                                * 48265
          !#1-IF>0                               * 4826A
          OBJ_48472                              * 4826F
          ?SKIP                                  * 48274
          OBJ_4853F                              * 48279
          OBJ_484BD                              * 4827E
        ;                                        * 48283

* refs (1): 0C938
OBJ_48288:
        ::                                       * 48288
          EQCURSOR?                              * 4828D
          case2drop                              * 48292
          ::                                     * 48297
            11GETLAM                             * 4829C
            4PUTLAM                              * 482A1
            %0_2A2B4                             * 482A6
            TOTEMPOB                             * 482AB
            1PUTLAM                              * 482B0
            CROSS_OFF                            * 482B5
            CROSS_HAIRS                          * 482BA
          ;                                      * 482BF
          CROSS_OFF                              * 482C4
          PREMARKON                              * 482C9
          CROSS_HAIRS                            * 482CE
        ;                                        * 482D3

* refs (1): 4830A
OBJ_482D8:
        ::                                       * 482D8
          2GETLAM                                * 482DD
          8GETLAM                                * 482E2
          #=                                     * 482E7
          12GETLAM                               * 482EC
          7GETLAM                                * 482F1
          #=                                     * 482F6
          OR                                     * 482FB
        ;                                        * 48300

* refs (2): 0C906 8D214
OBJ_48305:
        ::                                       * 48305
          OBJ_482D8                              * 4830A
          case                                   * 4830F
          ::                                     * 48314
            CROSS_OFF                            * 48319
            2GETLAM                              * 4831E
            12GETLAM                             * 48323
            OBJ_517B2                            * 48328
            TOGGLELINE#3                         * 4832D
            CROSS_HAIRS                          * 48332
          ;                                      * 48337
          CROSS_OFF                              * 4833C
          2GETLAM                                * 48341
          12GETLAM                               * 48346
          8GETLAM                                * 4834B
          DUP                                    * 48350
          4PICK                                  * 48355
          #>                                     * 4835A
          ITE                                    * 4835F
          #1-                                    * 48364
          #1+                                    * 48369
          OVER                                   * 4836E
          TOGGLELINE#3                           * 48373
          8GETLAM                                * 48378
          12GETLAM                               * 4837D
          OVER                                   * 48382
          7GETLAM                                * 48387
          3PICKOVER                              * 4838C
          #<                                     * 48391
          ITE                                    * 48396
          #1-                                    * 4839B
          #1+                                    * 483A0
          TOGGLELINE#3                           * 483A5
          OBJ_517B2                              * 483AA
          2GETLAM                                * 483AF
          3PICKOVER                              * 483B4
          #<                                     * 483B9
          ITE                                    * 483BE
          #1-                                    * 483C3
          #1+                                    * 483C8
          OVER                                   * 483CD
          TOGGLELINE#3                           * 483D2
          2GETLAM                                * 483D7
          7GETLAM                                * 483DC
          OVER                                   * 483E1
          12GETLAM                               * 483E6
          3PICKOVER                              * 483EB
          #<                                     * 483F0
          ITE                                    * 483F5
          #1-                                    * 483FA
          #1+                                    * 483FF
          TOGGLELINE#3                           * 48404
          CROSS_HAIRS                            * 48409
        ;                                        * 4840E

        ::                                       * 48413
          #1=case                                * 48418
          OBJ_4842C                              * 4841D
          OBJ_4881E                              * 48422
        ;                                        * 48427

* refs (2): 4841D 4D5EC
OBJ_4842C:
        ::                                       * 4842C
          OBJ_4DCC6                              * 48431
          WINDOWRIGHT?                           * 48436
          IT                                     * 4843B
          WINDOWRIGHT                            * 48440
          OBJ_517B2                              * 48445
          OVER                                   * 4844A
          14GETLAM                               * 4844F
          #=                                     * 48454
          3UNROLL                                * 48459
          OBJ_4E0BA                              * 4845E
          8GETLAM                                * 48463
          14GETLAM                               * 48468
          !#1+IF<dim-1                           * 4846D

* refs (3): 4821F 4826F 4885A
OBJ_48472:
          ::                                     * 48472
            OBJ_517B2                            * 48477
            CROSSGROB                            * 4847C
            OBJ_4DEB3                            * 48481
            4GETLAM                              * 48486
            GBUFF                                * 4848B
            BINT11                               * 48490
            ROLL                                 * 48495
            BINT11                               * 4849A
            ROLL                                 * 4849F
            GROB!                                * 484A4
            8ROLL                                * 484A9
          ;                                      * 484AE
          ?SKIP                                  * 484B3
          OBJ_4855D                              * 484B8

* refs (3): 4822E 4827E 48869
OBJ_484BD:
          ::                                     * 484BD
            GBUFF                                * 484C2
            5UNROLL                              * 484C7
            SUBGROB                              * 484CC
            DUP4PUTLAM                           * 484D1
            TOTEMPOB                             * 484D6
            4ROLL                                * 484DB
            OBJ_50F2E                            * 484E0
            OBJ_4DF67                            * 484E5
            GBUFF                                * 484EA
            2SWAP                                * 484EF
            GROB!                                * 484F4
          ;                                      * 484F9
        ;                                        * 484FE

* refs (1): 48229
OBJ_48503:
        ::                                       * 48503
          7GETLAM                                * 48508
          12GETLAM                               * 4850D
          #>                                     * 48512
          OBJ_48521                              * 48517
        ;                                        * 4851C

* refs (1): 48517
OBJ_48521:
        ::                                       * 48521
          7GETLAM                                * 48526
          BINT1                                  * 4852B
          OBJ_6C339                              * 48530
          OBJ_486D9                              * 48535
        ;                                        * 4853A

* refs (1): 48279
OBJ_4853F:
        ::                                       * 4853F
          7GETLAM                                * 48544
          12GETLAM                               * 48549
          #<                                     * 4854E
          OBJ_4742C                              * 48553
        ;                                        * 48558

* refs (1): 484B8
OBJ_4855D:
        ::                                       * 4855D
          8GETLAM                                * 48562
          2GETLAM                                * 48567
          #>                                     * 4856C
          OBJ_4857B                              * 48571
        ;                                        * 48576

* refs (1): 48571
OBJ_4857B:
        ::                                       * 4857B
          8GETLAM                                * 48580
          BINT1                                  * 48585
          OBJ_6C339                              * 4858A
          OBJ_485D0                              * 4858F
        ;                                        * 48594

* refs (1): 48864
OBJ_48599:
        ::                                       * 48599
          8GETLAM                                * 4859E
          2GETLAM                                * 485A3
          #<                                     * 485A8
          OBJ_485B7                              * 485AD
        ;                                        * 485B2

* refs (1): 485AD
OBJ_485B7:
        ::                                       * 485B7
          8GETLAM                                * 485BC
          #1+                                    * 485C1
          OBJ_485D0                              * 485C6
        ;                                        * 485CB

* refs (2): 4858F 485C6
OBJ_485D0:
        ::                                       * 485D0
          12GETLAM                               * 485D5
          7GETLAM                                * 485DA
          OBJ_487F6                              * 485DF
          NOT                                    * 485E4
          5PICK                                  * 485E9
          AND                                    * 485EE
          ITE                                    * 485F3
          3DROP                                  * 485F8
          ::                                     * 485FD
            4PICK                                * 48602
            IT                                   * 48607
            ::                                   * 4860C
              SWAP                               * 48611
              #1+                                * 48616
              SWAP                               * 4861B
              #1-                                * 48620
            ;                                    * 48625
            3PICKSWAP                            * 4862A
            OVER                                 * 4862F
            2GETLAM                              * 48634
            #=                                   * 48639
            case                                 * 4863E
            4DROP                                * 48643
            TOGGLELINE#3                         * 48648
          ;                                      * 4864D
          12GETLAM                               * 48652
          7GETLAM                                * 48657
          OBJ_487F6                              * 4865C
          NOT                                    * 48661
          4PICK                                  * 48666
          NOT                                    * 4866B
          AND                                    * 48670
          case                                   * 48675
          3DROP                                  * 4867A
          8GETLAM                                * 4867F
          3UNROLL                                * 48684
          3PICKSWAP                              * 48689
          5ROLL                                  * 4868E
          ?SKIP                                  * 48693
          ::                                     * 48698
            ROT                                  * 4869D
            #1+                                  * 486A2
            3UNROLL                              * 486A7
            #1-                                  * 486AC
          ;                                      * 486B1
          OVER                                   * 486B6
          2GETLAM                                * 486BB
          #=                                     * 486C0
          case                                   * 486C5
          4DROP                                  * 486CA
          TOGGLELINE#3                           * 486CF
        ;                                        * 486D4

* refs (2): 4743B 48535
OBJ_486D9:
        ::                                       * 486D9
          2GETLAM                                * 486DE
          8GETLAM                                * 486E3
          OBJ_487F6                              * 486E8
          NOT                                    * 486ED
          5PICK                                  * 486F2
          AND                                    * 486F7
          ITE                                    * 486FC
          3DROP                                  * 48701
          ::                                     * 48706
            4PICK                                * 4870B
            IT                                   * 48710
            ::                                   * 48715
              SWAP                               * 4871A
              #1+                                * 4871F
              SWAP                               * 48724
              #1-                                * 48729
            ;                                    * 4872E
            3UNROLL                              * 48733
            SWAPROT                              * 48738
            OVER                                 * 4873D
            DUP                                  * 48742
            12GETLAM                             * 48747
            #=                                   * 4874C
            case                                 * 48751
            4DROP                                * 48756
            TOGGLELINE#3                         * 4875B
          ;                                      * 48760
          2GETLAM                                * 48765
          8GETLAM                                * 4876A
          OBJ_487F6                              * 4876F
          NOT                                    * 48774
          4PICK                                  * 48779
          NOT                                    * 4877E
          AND                                    * 48783
          case                                   * 48788
          3DROP                                  * 4878D
          7GETLAM                                * 48792
          3UNROLL                                * 48797
          3PICKSWAP                              * 4879C
          5ROLL                                  * 487A1
          ?SKIP                                  * 487A6
          ::                                     * 487AB
            ROT                                  * 487B0
            #1+                                  * 487B5
            3UNROLL                              * 487BA
            #1-                                  * 487BF
          ;                                      * 487C4
          SWAP4ROLL                              * 487C9
          3UNROLL                                * 487CE
          DUP                                    * 487D3
          12GETLAM                               * 487D8
          #=                                     * 487DD
          case                                   * 487E2
          4DROP                                  * 487E7
          TOGGLELINE#3                           * 487EC
        ;                                        * 487F1

* refs (4): 485DF 4865C 486E8 4876F
OBJ_487F6:
        ::                                       * 487F6
          2DUP#>                                 * 487FB
          IT                                     * 48800
          SWAP                                   * 48805
          2DUPSWAP                               * 4880A
          #-                                     * 4880F
          #>1                                    * 48814
        ;                                        * 48819

* refs (2): 48422 4D4FC
OBJ_4881E:
        ::                                       * 4881E
          OBJ_4DCC6                              * 48823
          WINDOWLEFT?                            * 48828
          IT                                     * 4882D
          WINDOWLEFT                             * 48832
          OBJ_517B2                              * 48837
          OVER                                   * 4883C
          #0=                                    * 48841
          3UNROLL                                * 48846
          OBJ_4E0BA                              * 4884B
          8GETLAM                                * 48850
          !#1-IF>0                               * 48855
          OBJ_48472                              * 4885A
          ?SKIP                                  * 4885F
          OBJ_48599                              * 48864
          OBJ_484BD                              * 48869
        ;                                        * 4886E

* refs (2): 47610 4D69B
OBJ_48873:
        ::                                       * 48873
          TakeOver                               * 48878
          OBJ_73602                              * 4887D
          ITE                                    * 48882
          OBJ_49441                              * 48887
          OBJ_4E248                              * 4888C
          NOTcase                                * 48891
          DoBadKey                               * 48896
          ->StkStr22!                            * 4889B
          OBJ_469FF                              * 488A0
        ;                                        * 488A5
        NIBHEX  00000                            * 488AA  ..

* refs (1): 477F9
OBJ_488AF:
        ::                                       * 488AF
          GDISPCENTER                            * 488B4
          TURNMENUOFF                            * 488B9
          PLOTPREP                               * 488BE
          2DROP                                  * 488C3
          3UNROLL                                * 488C8
          DUP                                    * 488CD
          TOTEMPOB                               * 488D2
          15PUTLAM                               * 488D7
          17PUTLAM                               * 488DC
          16PUTLAM                               * 488E1
          %0_2A2B4                               * 488E6
          GetRes                                 * 488EB
          4PUTLAM                                * 488F0
          OBJ_4B9D6                              * 488F5
          OBJ_4C314                              * 488FA
          ERRSET                                 * 488FF
          ::                                     * 48904
            BINT2                                * 48909
            OBJ_4A96E                            * 4890E
            DROP                                 * 48913
            '                                    * 48918
            15GETLAM                             * 4891D
            '                                    * 48922
            GETXPOS                              * 48927
            '                                    * 4892C
            1PUTLAM                              * 48931
            BINT1                                * 48936
            GetEqN                               * 4893B
            NOTcase                              * 48940
            ERRJMP                               * 48945
            DUP                                  * 4894A
            ALGeq?                               * 4894F
            IT                                   * 48954
            GETRHS                               * 48959
            5ROLL                                * 4895E
            #1=                                  * 48963
            ITE                                  * 48968
            ::                                   * 4896D
              %0_2A2B4                           * 48972
              SWAP                               * 48977
            ;                                    * 4897C
            ::                                   * 48981
              BINT2                              * 48986
              GetEqN                             * 4898B
              NOTcase                            * 48990
              ERRJMP                             * 48995
              DUP                                * 4899A
              ALGeq?                             * 4899F
              IT                                 * 489A4
              GETRHS                             * 489A9
            ;                                    * 489AE
            '                                    * 489B3
            OBJ_5135F                            * 489B8
            BINT1                                * 489BD
            '                                    * 489C2
            OBJ_48A4E                            * 489C7
            4ROLL                                * 489CC
            '                                    * 489D1
            OBJ_5135F                            * 489D6
            BINT2                                * 489DB
            '                                    * 489E0
            OBJ_48A4E                            * 489E5
            BINT11                               * 489EA
            ::N                                  * 489EF
            2PUTLAM                              * 489F4
            19GETLAM                             * 489F9
            TYPEEXT?                             * 489FE
            ITE                                  * 48A03
            OBJ_4BC06                            * 48A08
            OBJ_4C12A                            * 48A0D
          ;                                      * 48A12
          ERRTRAP                                * 48A17
          OBJ_4B4EB                              * 48A1C
          OBJ_4C082                              * 48A21
          ATTNFLGCLR                             * 48A26
          18GETLAM                               * 48A2B
          RESETDEPTH                             * 48A30
          INDEPVAR                               * 48A35
          ?PURGE_HERE                            * 48A3A
          GDISPCENTER                            * 48A3F
          OBJ_4D1DC                              * 48A44
        ;                                        * 48A49

* refs (2): 489C7 489E5
OBJ_48A4E:
        ::                                       * 48A4E
          SWAP                                   * 48A53
          DUPTYPEREAL?                           * 48A58
          NOTcasedrop                            * 48A5D
          OBJ_4C22E                              * 48A62
          GETYPOS                                * 48A67
          1GETLAM                                * 48A6C
          SWAP2DUP                               * 48A71
          PIXON3                                 * 48A76
          3PICK                                  * 48A7B
          #2=                                    * 48A80
          NOTcase                                * 48A85
          OBJ_4C440                              * 48A8A
          ROTDROP                                * 48A8F
          OBJ_48A9E                              * 48A94
        ;                                        * 48A99

* refs (1): 48A94
OBJ_48A9E:
        ::                                       * 48A9E
          OBJ_49AA1                              * 48AA3
          20GETLAM                               * 48AA8
          BINT1                                  * 48AAD
          PULLREALEL                             * 48AB2
          SWAPDROP                               * 48AB7
          %-1=case                               * 48ABC
          ::                                     * 48AC1
            DROP                                 * 48AC6
            BINT2                                * 48ACB
            3UNROLL                              * 48AD0
            OBJ_4C440                            * 48AD5
          ;                                      * 48ADA
          COERCE                                 * 48ADF
          21GETLAM                               * 48AE4
          BINT1                                  * 48AE9
          PULLREALEL                             * 48AEE
          SWAPDROP                               * 48AF3
          COERCE                                 * 48AF8
          OBJ_49AA1                              * 48AFD
          4PICK                                  * 48B02
          4PICK                                  * 48B07
          DRAWLINE#3                             * 48B0C
          BINT2                                  * 48B11
          3UNROLL                                * 48B16
          OBJ_4C440                              * 48B1B
        ;                                        * 48B20

* refs (7): 48D05 48D1E 48D2D 48D41 48D5A 48D6E ...
OBJ_48B25:
        ::                                       * 48B25
          OBJ_4C0E4                              * 48B2A
          OBJ_4C314                              * 48B2F
        ;                                        * 48B34

* refs (3): 497A3 49925 49981
OBJ_48B39:
        ::                                       * 48B39
          SYMBNUMSOLVE                           * 48B3E
          NOTcase                                * 48B43
          ::                                     * 48B48
            2RDROP                               * 48B4D
            JstGetTHEMESG                        * 48B52
            OBJ_0C9FE                            * 48B57
          ;                                      * 48B5C
          ATTN#                                  * 48B61
          OVER                                   * 48B66
          #=                                     * 48B6B
          case                                   * 48B70
          ::                                     * 48B75
            SWAPDROP                             * 48B7A
            2RDROP                               * 48B7F
            GETTHEMESG                           * 48B84
            OBJ_0C9FE                            * 48B89
          ;                                      * 48B8E
          OBJ_33D8C                              * 48B93
          OVER                                   * 48B98

äline:
          #=                                     * 48B9D
          ITE                                    * 48BA2
          DROPNULL$                              * 48BA7
          GETTHEMESG                             * 48BAC
          SWAP                                   * 48BB1
        ;                                        * 48BB6

* refs (3): 200FD 48FBD B7EE6
OBJ_48BBB:
        ::                                       * 48BBB
          STATLR                                 * 48BC0
          ChkReakäPAR                            * 48BC5
          5UNROLL                                * 48BCA
          4DROP                                  * 48BCF
          '                                      * 48BD4
          xLINFIT                                * 48BD9
          EQcasedrop                             * 48BDE
          ::                                     * 48BE3
            'IDX                                 * 48BE8
            'x*                                  * 48BED
            '                                    * 48BF2
            x+                                   * 48BF7
            BINT5                                * 48BFC
            SYMBN                                * 48C01
          ;                                      * 48C06
          '                                      * 48C0B
          xLOGFIT                                * 48C10
          EQcasedrop                             * 48C15
          ::                                     * 48C1A
            'IDX                                 * 48C1F
            '                                    * 48C24
            xLN                                  * 48C29
            'x*                                  * 48C2E
            '                                    * 48C33
            x+                                   * 48C38
            BINT6                                * 48C3D
            SYMBN                                * 48C42
          ;                                      * 48C47
          '                                      * 48C4C
          xEXPFIT                                * 48C51
          EQ                                     * 48C56
          case                                   * 48C5B
          ::                                     * 48C60
            'IDX                                 * 48C65
            'x*                                  * 48C6A
            '                                    * 48C6F
            xEXP                                 * 48C74
            'x*                                  * 48C79
            BINT6                                * 48C7E
            SYMBN                                * 48C83
          ;                                      * 48C88
          'IDX                                   * 48C8D
          SWAP                                   * 48C92
          '                                      * 48C97
          x^                                     * 48C9C
          '                                      * 48CA1
          x*                                     * 48CA6
          BINT5                                  * 48CAB
          SYMBN                                  * 48CB0
        ;                                        * 48CB5

* refs (3): 4997C 49B5F 49B9B
OBJ_48CBA:
        ::                                       * 48CBA
          INDEPVAR                               * 48CBF
          OBJ_73DFC                              * 48CC4
          TOTEMPOB                               * 48CC9
          15GETLAM                               * 48CCE
          OVER                                   * 48CD3
          NEWINDEP                               * 48CD8
          19GETLAM                               * 48CDD
          DUPTYPEEXT?                            * 48CE2
          NOTcaseDROP                            * 48CE7
          UM>U                                   * 48CEC
        ;                                        * 48CF1
        NIBHEX  00000                            * 48CF6  ..

* refs (1): 474AB
OBJ_48CFB:
        ::                                       * 48CFB
          CHECKMENU                              * 48D00
          OBJ_48B25                              * 48D05
          ERRSET                                 * 48D0A
          OBJ_49799                              * 48D0F
          ERRTRAP                                * 48D14

* refs (2): 48D55 48D82
OBJ_48D19:
          ::                                     * 48D19
            OBJ_48B25                            * 48D1E
            ERRJMP                               * 48D23
          ;                                      * 48D28
          OBJ_48B25                              * 48D2D
        ;                                        * 48D32

* refs (1): 474CE
OBJ_48D37:
        ::                                       * 48D37
          CHECKMENU                              * 48D3C
          OBJ_48B25                              * 48D41
          ERRSET                                 * 48D46
          OBJ_49899                              * 48D4B
          ERRTRAP                                * 48D50
          OBJ_48D19                              * 48D55
          OBJ_48B25                              * 48D5A
        ;                                        * 48D5F

* refs (1): 47556
OBJ_48D64:
        ::                                       * 48D64
          CHECKMENU                              * 48D69
          OBJ_48B25                              * 48D6E
          ERRSET                                 * 48D73
          OBJ_49968                              * 48D78
          ERRTRAP                                * 48D7D
          OBJ_48D19                              * 48D82
          OBJ_48B25                              * 48D87
        ;                                        * 48D8C
        NIBHEX  0                                * 48D91

* refs (1): 491DA
OBJ_48D92:
        ::                                       * 48D92
          GETPTYPE                               * 48D97
          BINT17                                 * 48D9C
          PTYPE>PINFO                            * 48DA1
          case                                   * 48DA6
          EVAL                                   * 48DAB
          ::                                     * 48DB0
            OBJ_49017                            * 48DB5
            OBJ_491E4                            * 48DBA
            2DROP                                * 48DBF
          ;                                      * 48DC4
        ;                                        * 48DC9

* refs (2): 8CB30 8CC6E
OBJ_48DCE:
        ::                                       * 48DCE
          OBJ_49017                              * 48DD3
          '                                      * 48DD8
          OBJ_48F4A                              * 48DDD
          8PUTLAM                                * 48DE2
          OBJ_491E4                              * 48DE7
          DUP                                    * 48DEC
          TYPEBINT?                              * 48DF1

ScaleY=ScaleX:
          case2DROP                              * 48DF6
          OBJ_49478                              * 48DFB
          xrng(2r)                               * 48E00
        ;                                        * 48E05

* refs (1): 8C9EC
OBJ_48E0A:
        ::                                       * 48E0A
          GETSCALE                               * 48E0F
          DROP                                   * 48E14
          DUP                                    * 48E19
          PUTSCALE                               * 48E1E
        ;                                        * 48E23

* refs (1): 8CE27
OBJ_48E28:
        ::                                       * 48E28

* refs (2): 48E91 48ED2
OBJ_48E2D:
          ::                                     * 48E2D
            rclä                                 * 48E32
            ChkReakäPAR                          * 48E37
            3DROP                                * 48E3C
            COERCE2                              * 48E41
          ;                                      * 48E46

* refs (1): 200E2
OBJ_48E4B:
          ::                                     * 48E4B
            ROT                                  * 48E50
            OBJ_2CF08                            * 48E55
            DUP                                  * 48E5A
            4ROLL                                * 48E5F
            MinMaxCol(ra,s)                      * 48E64
            OBJ_49478                            * 48E69
            xrng(2r)                             * 48E6E
            SWAP                                 * 48E73
            MinMaxCol(ra,s)                      * 48E78
            OBJ_49293                            * 48E7D
          ;                                      * 48E82
        ;                                        * 48E87

* refs (1): 8CF15
OBJ_48E8C:
        ::                                       * 48E8C
          OBJ_48E2D                              * 48E91
          DROP                                   * 48E96
          DUPROT                                 * 48E9B
          OBJ_2CF08                              * 48EA0
          SWAPDROPSWAP                           * 48EA5
          MinMaxCol(ra,s)                        * 48EAA
          OBJ_49478                              * 48EAF
          xrng(2r)                               * 48EB4
          %0_2A2B4                               * 48EB9
          STATN                                  * 48EBE
          OBJ_49587                              * 48EC3
        ;                                        * 48EC8

* refs (1): 8CFE5
OBJ_48ECD:
        ::                                       * 48ECD
          OBJ_48E2D                              * 48ED2
          %0_2A2B4                               * 48ED7
          PUTRES                                 * 48EDC
          %0_2A2B4                               * 48EE1
          STATN                                  * 48EE6
          xrng(2r)                               * 48EEB
          DROP                                   * 48EF0
          MinMaxCol(ra,s)                        * 48EF5
          2DUP                                   * 48EFA
          %=                                     * 48EFF
          ITE                                    * 48F04
          OBJ_56B87                              * 48F09
          ::                                     * 48F0E
            DUP                                  * 48F13
            %0<                                  * 48F18
            casedrop                             * 48F1D
            %0_2A2B4                             * 48F22
            SWAPDUP                              * 48F27
            %0>                                  * 48F2C
            NOT?SEMI                             * 48F31
            OBJ_56B87                            * 48F36
          ;                                      * 48F3B
          OBJ_49293                              * 48F40
        ;                                        * 48F45

* refs (1): 48DDD
OBJ_48F4A:
        ::                                       * 48F4A
          GETPTYPE                               * 48F4F
          'IDPARAMETER                           * 48F54
          EQITE                                  * 48F59
          ::                                     * 48F5E
            DUP                                  * 48F63
            TYPECMP?                             * 48F68
            case                                 * 48F6D
            C%>%                                 * 48F72
            %0_2A2B4                             * 48F77
          ;                                      * 48F7C
          ::                                     * 48F81
            2GETLAM                              * 48F86
            %POL>%REC                            * 48F8B
          ;                                      * 48F90
          6GETLAM                                * 48F95
          7GETLAM                                * 48F9A
          4ROLL                                  * 48F9F
          OBJ_494EC                              * 48FA4
          7PUTLAM                                * 48FA9
          6PUTLAM                                * 48FAE
        ;                                        * 48FB3

* refs (1): 0C7BC
OBJ_48FB8:
        ::                                       * 48FB8
          OBJ_48BBB                              * 48FBD
          DOSTOE                                 * 48FC2
          'IDFUNCTION                            * 48FC7
          PUTPTYPE                               * 48FCC
          %1                                     * 48FD1
          'IDX                                   * 48FD6
          DUP                                    * 48FDB
          PUTINDEP                               * 48FE0
          XEQSTOID                               * 48FE5
          EXITFCNsto                             * 48FEA
          OBJ_4C2CE                              * 48FEF
        ;                                        * 48FF4

* ->
* refs (2): 46A13 4A005
SORTASLOW:
        ::                                       * 48FF9
          BINT5                                  * 48FFE
          ONE_DO                                 * 49003
          VERYSLOW                               * 49008
          LOOP                                   * 4900D
        ;                                        * 49012
