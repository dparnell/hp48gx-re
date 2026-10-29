* HP 48GX ROM revision R, #6F360-#70038: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: rot;not(?);3rolld
* Follows on from the previous file (at #6F360 in the original ROM).
        RPL

* refs (2): 6E35C 6F29D
OBJ_6F360:
        :: OVER                                  * 6F360

* refs (8): 65E81 65EA9 6657F 6F1CB 6F2F2 6F338 ...
OBJ_6F36A:
          :: OBJ_67E64 EqwBoxLast@ ; OBJ_6D1C7 3PICK * 6F36A
          :: OBJ_67E64 OBJ_68F7B DROP OBJ_6ECF8 NOT ; OVER NOTAND case 3DROP * 6F388
          3PICK                                  * 6F3BF

* refs (3): 6F32E 6F50E 6F54F
OBJ_6F3C4:
          :: DUP OBJ_67E54 INNERCOMP ROT #1-UNROT {}N OBJ_67F31 ; SWAPDROP * 6F3C4
          case OBJ_6F41E                         * 6F3F6
          GOTO L_6F338 ;                         * 6F400

* refs (1): 4B8C8
OBJ_6F40F:
        :: 7GETLAM casedrop                      * 6F40F

* refs (6): 6F130 6F162 6F1DA 6F306 6F3FB 6F496
OBJ_6F41E:
          :: OBJ_6F36A                           * 6F41E
L_6F428:
            DUP                                  * 6F428

* refs (9): 65D87 65EE5 661C9 66593 665AC 6B7E0 ...
OBJ_6F42D:
            :: OBJ_673BB DUP#0=csedrp OBJ_25BFB #1=case OBJ_66FB1 * 6F42D
              OBJ_66E7F ;                        * 6F44B
            OBJ_44DFE ZEROSWAP OBJ_68593 ;       * 6F455
          DUPUNROT                               * 6F469

* refs (4): 65E22 6F2C0 6F310 6F54A
OBJ_6F46E:
          :: OVERSWAP #2- OBJ_67F0B ; SWAP BINT4 #<>case OBJ_6F41E * 6F46E
          OBJ_67E64 EqwBoxSecond@ GOTO L_6F428 ; * 6F49B

* refs (1): 6E3ED
OBJ_6F4B4:
        :: OVER OBJ_6F36A EqwBoxLast@ EqwCurBox@ BEGIN EqwDupBoxParent@ * 6F4B4
          3PICK OVER#= NOT_WHILE SWAPDROP REPEAT DROPSWAPDROP OBJ_67987 * 6F4D7
          OBJ_6ECF8 case                         * 6F4FA
          :: UNROTOVER OBJ_6F3C4 #2+ OBJ_67F0B OBJ_6D523 EqwDupBoxParent@ * 6F504
            SWAP EqwBoxLast! ;                   * 6F527
          DROP 7GETLAM NOTcase                   * 6F536
          :: OBJ_6F46E OBJ_6F3C4 ;               * 6F545
          DROPDUP OBJ_67E54 INNERCOMP ROT DUPTWO #/ DROP #- 3UNROLL {}N * 6F559
          OBJ_67F31 ;                            * 6F58B

* refs (8): 0C75D 46191 6F815 6F860 6F905 6F923 ...
OBJ_6F595:
        :: TakeOver OBJ_461CD                    * 6F595

* refs (1): 69ECA
EqwRuleKey0~8:
          :: 'EL NOTcase                         * 6F5A4

* refs (1): 6ACDF
OBJ_6F5B3:
            :: 'NG INCOMPDROP ROT XYGROBDISP ;   * 6F5B3
            OBJ_6B0CF OBJ_6ACF3 ;                * 6F5D1
          'LB                                    * 6F5E0

* refs (4): 6F838 6F955 6FA1D 6FA4F
OBJ_6F5E5:
          :: EqwDupBoxParent@ DUP#0= ; NOTcase OBJ_679D7 * 6F5E5
          drop;q_58A0C                           * 6F603

* refs (5): 461AA 6F82E 6F842 6F879 6F946
OBJ_6F608:
          :: OBJ_25C23 DoBadKey ; ;              * 6F608

* refs (6): 461A0 6F6F3 6F824 6F86F 6F93C 6F96E
OBJ_6F621:
        :: 3PICK EqwBoxParent@ OBJ_679D7 4UNROLL ROTOVER 4PICK OBJ_6F9D2 * 6F621
          NOTcase2drop 2DROPFALSE                * 6F649
          SWAPDROP BEGIN OBJ_679EA OVER OBJ_67B17 #0<> AND NOT_WHILE * 6F653
          :: OBJ_679EA ITE                       * 6F67B
            :: 2DUPSWAP ITE EqwBoxNext@ EqwBoxPrev@ * 6F68A
              DUP#0<> case SWAPDROP              * 6F6A3
              DROP EqwDupBoxParent@ OBJ_679D7 5ROLL #=?SKIP * 6F6B2

rot;not(?);3rolld:
              :: ROT NOT 3UNROLL ; 3RDROP 3UNROLL COLA OBJ_6F621 * 6F6CB
            ;                                    * 6F6F8
            OBJ_6F71B                            * 6F6FD
          ;                                      * 6F702
          REPEAT 4UNROLL3DROP TRUE ;             * 6F707

* refs (1): 6F6FD
OBJ_6F71B:
        :: OBJ_679D2 5PICK #= 4PICK ?SKIP NOT    * 6F71B
          case                                   * 6F73E
          :: OVER case EqwBoxFirst@              * 6F743
            EqwBoxLast@ ;                        * 6F757
          ZEROSWAP EqwBoxFirst@ DUP BEGIN OBJ_67B12 DUP OBJ_66BAD ITE * 6F761
          :: DUP OBJ_6EE65 casedrop BINT0        * 6F789
          ;                                      * 6F7A2
          DROPZERO                               * 6F7A7
          4PICKOVER #<ITE                        * 6F7AC
          :: 4ROLLDROP 3UNROLL SWAPDROPDUP ; DROP OBJ_6FEE1 SWAP #0= * 6F7B6
          NOT?SEMI                               * 6F7E3
          BEGIN OBJ_679EA WHILE                  * 6F7E8
          :: EqwBoxNext@ ; REPEAT ;              * 6F7F7

* refs (1): 4B4A5
OBJ_6F810:
        :: OBJ_6F595                             * 6F810
L_6F81A:
          #1= FALSE OBJ_6F621 NOTcase OBJ_6F608  * 6F81A
          OBJ_6F883 OBJ_6F5E5 casedrop OBJ_6F608 * 6F833
          OBJ_679D7 GOTO L_6F81A ;               * 6F847

* refs (1): 4B4C3
OBJ_6F85B:
        :: OBJ_6F595 #1<> TRUE                   * 6F85B
L_6F86F:
          OBJ_6F621 NOTcase OBJ_6F608            * 6F86F

* refs (1): 6F98C
OBJ_6F87E:
          ::                                     * 6F87E

* refs (2): 461AF 6F833
OBJ_6F883:
            :: DUP OBJ_6AAB9 NOT?GOTO L_6F8D8 OBJ_67B12 OBJ_6B381 OBJ_6AC80 * 6F883

* refs (1): 689E0
OBJ_6F8AB:
              :: DUP OBJ_2846E EQ SWAP OBJ_2845A EQOR ; NOT?SEMI * 6F8AB
L_6F8D8:
              RDROP OBJ_6FACC ;                  * 6F8D8
            OBJ_67B17 OBJ_6B39F OBJ_6FACC ;      * 6F8E7
        ;                                        * 6F8FB

* refs (1): 6B407
OBJ_6F900:
        :: OBJ_6F595 TRUE GOTO L_6F92D ;         * 6F900

* refs (1): 6B3F9
OBJ_6F91E:
        :: OBJ_6F595 FALSE                       * 6F91E
L_6F92D:
          3UNROLL #1<> 3PICK OBJ_6F621 NOTcasedrop OBJ_6F608 * 6F92D
          BEGIN DUP OBJ_6F5E5 case2drpfls OBJ_679D7 * 6F94B
          #1<> 4PICK OBJ_6F621 DUP IT ROTDROP    * 6F964
          NOT_UNTIL SWAPDROP OBJ_6F87E ;         * 6F982

* refs (1): 6B400
OBJ_6F996:
        :: OBJ_6F595 2DROP OBJ_67D0F OBJ_6FACC ; * 6F996

* refs (1): 6B40E
OBJ_6F9B4:
        :: OBJ_6F595 2DROP OBJ_67D1B OBJ_6FACC ; * 6F9B4

* refs (2): 6F644 6FAC2
OBJ_6F9D2:
        :: DUP4UNROLL IT                         * 6F9D2
          :: 2DUP ITE EqwBoxNext@ EqwBoxPrev@    * 6F9E1
            DUP#0=csDROP SWAPDROP ROTDROP TRUE RDROP ; * 6F9FA
          SWAP OBJ_6F5E5 casedrop                * 6FA18
          :: ROTROT2DROP FALSE ;                 * 6FA27
          OBJ_679D2 SWAP BEGIN                   * 6FA3B
          :: OBJ_6F5E5 case FalseTrue            * 6FA4A
            OBJ_679D2 4PICK 8PICK ITE #= #<>     * 6FA5E
            case TrueTrue                        * 6FA7C
            drop(2);false ;                      * 6FA86
          UNTIL SWAPDROP ROTDROP 5ROLLDROP 4ROLLSWAP NOTcase2drop FALSE * 6FA90
          ROTDROP TRUE COLA OBJ_6F9D2            * 6FAB3
        ;                                        * 6FAC7

* refs (5): 25C2D 6F8DD 6F8F1 6F9AA 6F9C8
OBJ_6FACC:
        :: DUP ROMPTR 0EA 03C 'LB OBJ_67AEF ROTDUP OBJ_67C6C OBJ_44E3F EQITE * 6FACC
          :: SWAPDROPSWAP #3- SWAP EqwBoxPrev@ OBJ_67A8B #1- OBJ_66FD5 * 6FAFF
            3UNROLL BINT4 BINT5 ;                * 6FB27
          :: DUP OBJ_67ABC 2DUP #2= case         * 6FB3B
            :: 4UNROLL3DROP BINT3 SWAP2DUP MAKEGROB INVGROB BINT1 3PICK #2- * 6FB59
              OBJ_6FBD1 ROT #1-UNROT ;           * 6FB86
            #2= case                             * 6FB9A
            :: ROTROT2DROP BINT3 2DUP MAKEGROB INVGROB 3PICK #2- BINT1 * 6FBA4

* refs (1): 6FB86
OBJ_6FBD1:
              :: MAKEGROB OVER ONEONE GROB! 5UNROLL ; ; * 6FBD1
            SWAPROT OBJ_67C6C TOTEMPOB INVGROB 5UNROLL ; * 6FBF9
          4PICK#+ SWAP 3PICK#+ 'LE 5PICK #>ITE   * 6FC17
          :: 4PICK ROMPTR 0EA 03C 'LE ;          * 6FC35
          :: 'LE BINT131 #+ 3PICKSWAP 2DUP#> NOTcase2DROP #- * 6FC54
            'LE #+ ROMPTR 0EA 03C 'LE ;          * 6FC7C
          'TE 4PICK #>ITE                        * 6FC9B
          :: 3PICK #1-DUP OBJ_66BAD IT DROPZERO  * 6FCAA
            ROMPTR 0EA 03C 'TE ;                 * 6FCC8
          :: DUP 'TE RclRowMenu #+ 2DUP#> NOTcase2DROP #- * 6FCDD
            #1- 'TE #+ ROMPTR 0EA 03C 'TE ;      * 6FD05
          'TE 'LE WINDOWXY 4PICK 4UNROLL 3PICK 5UNROLL HARDBUFF 5UNROLL * 6FD29
          SUBGROB 3PICK3PICK THREE{}N ROMPTR 0EA 03C 'NG ROT XYGROBDISP ; * 6FD56
        NIBHEX  0                                * 6FD84

* refs (3): 65C9F 661B5 6E3F2
OBJ_6FD85:
        CON(5)  (*)+5                            * 6FD85  primitive code object
        ASSEMBLE
        LC(5)   BINT2                            * 6FD8A
L_6FD91:
        A=DAT1  A                                * 6FD91
        ?C=A    A                                * 6FD94
        GOYES   L_6FDA6                          * 6FD97
        LC(5)   SKIP                             * 6FD99
L_6FDA0:
        A=C     A                                * 6FDA0
        PC=(A)                                   * 6FDA2
L_6FDA6:
        D1=D1+  5                                * 6FDA6
        D=D+1   A                                * 6FDA9
        LC(5)   COLA                             * 6FDAB
        GOTO    L_6FDA0                          * 6FDB2

* refs (7): 65CA9 661D8 6E17C 6E19A 6E393 6E3CA ...
OBJ_6FDB6:
        CON(5)  (*)+5                            * 6FDB6  primitive code object
        LC(5)   BINT4                            * 6FDBB
        GOTO    L_6FD91                          * 6FDC2

* refs (7): 44C50 65CB3 661E2 6D48D 6E1A4 6E39D ...
OBJ_6FDC6:
        CON(5)  (*)+5                            * 6FDC6  primitive code object
        LC(5)   BINT6                            * 6FDCB
        GOTO    L_6FD91                          * 6FDD2

* refs (3): 6A888 6A8A6 6A8B5
OBJ_6FDD6:
        CON(5)  (*)+5                            * 6FDD6  primitive code object
        ST=1    0                                * 6FDDB
        GOTO    L_6FDEA                          * 6FDDE

* refs (1): 6E32A
OBJ_6FDE2:
        CON(5)  (*)+5                            * 6FDE2  primitive code object
        ST=0    0                                * 6FDE7
L_6FDEA:
        C=DAT0  A                                * 6FDEA
        D0=D0+  5                                * 6FDED
        RSTK=C                                   * 6FDF0
        GOSBVL  POP#                             * 6FDF2
        GOSBVL  SAVPTR                           * 6FDF9
        B=A     B                                * 6FE00
        C=RSTK                                   * 6FE03
        D1=C                                     * 6FE05
        C=DAT1  B                                * 6FE08
        C=C-1   B                                * 6FE0B
        D1=D1+  2                                * 6FE0E
L_6FE11:
        A=DAT1  B                                * 6FE11
        ?A=B    B                                * 6FE14
        GOYES   L_6FE3B                          * 6FE17
        D1=D1+  7                                * 6FE19
        C=C-1   B                                * 6FE1C
        GONC    L_6FE11                          * 6FE1F
        ?ST=1   0                                * 6FE22
        GOYES   L_6FE2E                          * 6FE25
        GOVLNG  GETPTRFALSE                      * 6FE27
L_6FE2E:
        LA(5)   DoBadKey                         * 6FE2E
        GOC     L_6FE41                          * 6FE38
L_6FE3B:
        D1=D1+  2                                * 6FE3B
        A=DAT1  A                                * 6FE3E
L_6FE41:
        GOSBVL  GETPTR                           * 6FE41
        D1=D1-  5                                * 6FE48
        DAT1=A  A                                * 6FE4B
        D=D-1   A                                * 6FE4E
        LC(5)   TRUE                             * 6FE50
        D1=D1-  5                                * 6FE57
        DAT1=C  A                                * 6FE5A
        D=D-1   A                                * 6FE5D
        A=DAT0  A                                * 6FE5F
        D0=D0+  5                                * 6FE62
        PC=(A)                                   * 6FE65
        RPL

* refs (1): 684C9
OBJ_6FE69:
        :: DUP                                   * 6FE69

* refs (1): 684B6
OBJ_6FE73:
          ::                                     * 6FE73

* refs (2): 6850A 68528
OBJ_6FE78:
            :: OBJ_67B12 OBJ_66BAD case          * 6FE78

* refs (1): 6FED7
OBJ_6FE8C:
              :: OBJ_67B17 OBJ_6B381 OBJ_6AC80 ; * 6FE8C
              EqwDupBoxParent@ EqwBoxFirst@ BEGIN OBJ_67B12 #1+ OBJ_66BAD * 6FEA5
              case                               * 6FEC3
              :: SWAPDROP RDROP OBJ_6FE8C ;      * 6FEC8

* refs (6): 66700 6684C 669AB 68FF8 6F7D4 6FF45
OBJ_6FEE1:
              :: OBJ_67969 COLA NOT_UNTIL        * 6FEE1
              ;                                  * 6FEF5
              OBJ_672E6 DUP OBJ_67E64 BEGIN EqwBoxFirst@ BEGIN 3PICK OVER#= * 6FEFA
              case                               * 6FF22
              :: 2RDROP DROPSWAPDROP OBJ_67E54 OBJ_6EF6E ; * 6FF27
              OBJ_6FEE1 #1-DUP OBJ_67E64 AGAIN ; * 6FF45
            OBJ_2708E DROP BINT4 NTHCOMPDROP ;   * 6FF5E
          EVAL ;                                 * 6FF77
        ASSEMBLE
L_6FF81:
        A=A-1   S                                * 6FF81
        RTNC                                     * 6FF84
        A=A-1   S                                * 6FF87
        RTNC                                     * 6FF8A
        P=      15                               * 6FF8D
        LC(1)   #7                               * 6FF8F
        P=      0                                * 6FF92
        A=A-C   S                                * 6FF94
        GOC     L_6FFB5                          * 6FF97
        D1=(5)  #8084F                           * 6FF9A
        A=DAT1  1                                * 6FFA1
        ?ABIT=0 2                                * 6FFA5
        GOYES   L_6FFAF                          * 6FFAA
        A=A-1   S                                * 6FFAC
L_6FFAF:
        A=A-1   S                                * 6FFAF
        RTNC                                     * 6FFB2
L_6FFB5:
        RTNCC                                    * 6FFB5
        RPL

* refs (1): 4C5DF
OBJ_6FFB7:
        :: 9GETLAM                               * 6FFB7

* refs (1): 7001B
OBJ_6FFC1:
          :: %%1 SWAP %%/ DUP %%2 %%/ 2%%>% SWAP ; 19PUTLAM ; * 6FFC1

* refs (2): 4B7AB 4D1B4
OBJ_6FFFD:
        :: OBJ_4A874 11GETLAM ~BINT12;PTYPE>PINFO;NOTcaseFALSE NOT?SEMI * 6FFFD
          10GETLAM OBJ_6FFC1 DROP 16GETLAM %+ 16PUTLAM ; * 70016
