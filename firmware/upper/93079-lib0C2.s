* HP 48GX ROM revision R, #93079-#96267: Library part 0C2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #93079 in the original ROM).
        RPL

* ROMPTR 0C2 01D
* refs (1): 90007
ROMP_0C2_01D:
        ::                                       * 93079
          1GETLAM                                * 9307E
          #1=                                    * 93083
          ?SEMI                                  * 93088
          1GETLAM                                * 9308D
          BINT1                                  * 93092
          {}N                                    * 93097
          ((0,0))                                * 9309C
          MAKEARRY                               * 930A1
          4PUTLAM                                * 930A6
          RESOROMP                               * 930AB
          ROMPTR  0C2 016                        * 930B0
          10PUTLAM                               * 930BB
          RESOROMP                               * 930C0
          ROMPTR  0C2 017                        * 930C5
          12PUTLAM                               * 930D0
          1GETLAM                                * 930D5
          DUPDUP                                 * 930DA
          #*                                     * 930DF
          BEGIN                                  * 930E4
          OBJ_357F0                              * 930E9
          10GETLAM                               * 930EE
          EVAL                                   * 930F3
          OVER                                   * 930F8
          BINT2                                  * 930FD
          #<                                     * 93102
          UNTIL                                  * 93107
          2DROP                                  * 9310C
        ;                                        * 93111

* ROMPTR 0C2 01E
* refs (1): 90007
ROMP_0C2_01E:
        ::                                       * 93116
          sqmat(ar)?                             * 9311B
          ONEONE                                 * 93120
          ONEONE                                 * 93125
          ONEONE                                 * 9312A
          ONEONE                                 * 9312F
          ONEONE                                 * 93134
          ONEONE                                 * 93139
          ONEONE                                 * 9313E
          BINT15                                 * 93143
          ROLL                                   * 93148
          OVER                                   * 9314D
          BINT16                                 * 93152
          '                                      * 93157
          NULLLAM                                * 9315C
          CACHE                                  * 93161
          3GETLAM                                * 93166
          1PUTLAM                                * 9316B
        ;                                        * 93170

* ROMPTR 0C2 01F
* refs (1): 90007
ROMP_0C2_01F:
        ::                                       * 93175
          1GETLAM                                * 9317A
          BINT3                                  * 9317F
          #*                                     * 93184
          !MAKEHXS                               * 93189
          SWAP                                   * 9318E
          3GETLAM                                * 93193
          DUP                                    * 93198
          BEGIN                                  * 9319D
          TRUE                                   * 931A2
          OBJ_6DCE7                              * 931A7
          1GETLAM                                * 931AC
          #*                                     * 931B1
          #1+                                    * 931B6
          5PICK                                  * 931BB
          5PICK                                  * 931C0
          #1+_ONE_DO                             * 931C5
          4PICK                                  * 931CA
          INDEX@                                 * 931CF
          #=                                     * 931D4
          ?SKIP                                  * 931D9
          ::                                     * 931DE
            OVER                                 * 931E3
            OBJ_372EF                            * 931E8
            =0?(nb)                              * 931ED
            ?SEMI                                * 931F2
            ROTDROP                              * 931F7
            FALSE                                * 931FC
            3UNROLL                              * 93201
            INDEX@                               * 93206
            ISTOPSTO                             * 9320B
          ;                                      * 93210
          SWAP#1+SWAP                            * 93215
          NextInArray                            * 9321A
          2DROP                                  * 9321F
          IT                                     * 93224
          ::                                     * 93229
            4PICK                                * 9322E
            OBJ_37013                            * 93233
            2DUP#=                               * 93238
            ?SKIP                                * 9323D
            ::                                   * 93242
              SWAPCOLUMNS                        * 93247
              OBJ_375A7                          * 9324C
              DROPDUP                            * 93251
            ;                                    * 93256
            OVER                                 * 9325B
            #1=                                  * 93260
            ?SEMI                                * 93265
            SWAP#1-SWAP                          * 9326A
          ;                                      * 9326F
          #1-                                    * 93274
          DUP#0=                                 * 93279
          UNTIL                                  * 9327E
          DROPDUP                                * 93283
          3PUTLAM                                * 93288
          #1=case                                * 9328D
          SWAP                                   * 93292
          2GETLAM                                * 93297
          DUP                                    * 9329C
          BEGIN                                  * 932A1
          TRUE                                   * 932A6
          3PICK                                  * 932AB
          #1-                                    * 932B0
          1GETLAM                                * 932B5
          #*                                     * 932BA
          3PICK#+                                * 932BF
          5PICK                                  * 932C4
          3GETLAM                                * 932C9
          #1+                                    * 932CE
          6PICK                                  * 932D3
          DO                                     * 932D8
          4PICK                                  * 932DD
          INDEX@                                 * 932E2
          #=                                     * 932E7
          ?SKIP                                  * 932EC
          ::                                     * 932F1
            OVER                                 * 932F6
            OBJ_372EF                            * 932FB
            =0?(nb)                              * 93300
            ?SEMI                                * 93305
            ROTDROP                              * 9330A
            FALSE                                * 9330F
            3UNROLL                              * 93314
            INDEX@                               * 93319
            ISTOPSTO                             * 9331E
          ;                                      * 93323
          1GETLAM                                * 93328
          ROT#+SWAP                              * 9332D
          NextInArray                            * 93332
          2DROP                                  * 93337
          IT                                     * 9333C
          ::                                     * 93341
            4PICK                                * 93346
            OBJ_37013                            * 9334B
            2DUP#=                               * 93350
            ?SKIP                                * 93355
            ::                                   * 9335A
              SWAPCOLUMNS                        * 9335F
              OBJ_375A7                          * 93364
              DROPDUP                            * 93369
            ;                                    * 9336E
            OVER                                 * 93373
            3GETLAM                              * 93378
            #=                                   * 9337D
            ?SEMI                                * 93382
            SWAP#1+SWAP                          * 93387
          ;                                      * 9338C
          #1+                                    * 93391
          DUP                                    * 93396
          3GETLAM                                * 9339B
          #>                                     * 933A0
          UNTIL                                  * 933A5
          DROP                                   * 933AA
          2PUTLAM                                * 933AF
          SWAP                                   * 933B4
        ;                                        * 933B9

* ROMPTR 0C2 020
* refs (1): 90007
ROMP_0C2_020:
        ::                                       * 933BE
          2GETLAM                                * 933C3
          BEGIN                                  * 933C8
          #1-                                    * 933CD
          DUP#0<>                                * 933D2
          WHILE                                  * 933D7
          ::                                     * 933DC
            3PICK                                * 933E1
            OBJ_36FDB                            * 933E6
            2DUP#=                               * 933EB
            ?SKIP                                * 933F0
            SWAPCOLUMNS                          * 933F5
            DROP                                 * 933FA
            OBJ_357F0                            * 933FF
          ;                                      * 93404
          REPEAT                                 * 93409
          DROP                                   * 9340E
          3GETLAM                                * 93413
          BEGIN                                  * 93418
          #1+                                    * 9341D
          DUP                                    * 93422
          1GETLAM                                * 93427
          #>                                     * 9342C
          NOT                                    * 93431
          WHILE                                  * 93436
          ::                                     * 9343B
            3PICK                                * 93440
            OBJ_36FDB                            * 93445
            2DUP#=                               * 9344A
            ?SKIP                                * 9344F
            SWAPCOLUMNS                          * 93454
            DROP                                 * 93459
            OBJ_357F0                            * 9345E
          ;                                      * 93463
          REPEAT                                 * 93468
          DROPSWAPDROP                           * 9346D
        ;                                        * 93472

* ROMPTR 0C2 021
* refs (1): 90007
ROMP_0C2_021:
        ::                                       * 93477
          3GETLAM                                * 9347C
          2GETLAM                                * 93481
          #=                                     * 93486
          ?SEMI                                  * 9348B
          3GETLAM                                * 93490
          #1+                                    * 93495
          2GETLAM                                * 9349A
          DO                                     * 9349F
          INDEX@                                 * 934A4
          OBJ_0F656                              * 934A9
          3PICK                                  * 934AE
          OBJ_37013                              * 934B3
          2DROP                                  * 934B8
          NextInArray                            * 934BD
          SWAP                                   * 934C2
          BEGIN                                  * 934C7
          TRUE                                   * 934CC
          2GETLAM                                * 934D1
          #1-                                    * 934D6
          1GETLAM                                * 934DB
          #1+                                    * 934E0
          #*                                     * 934E5
          #1+                                    * 934EA
          DUP                                    * 934EF
          3GETLAM                                * 934F4
          #1+                                    * 934F9
          2GETLAM                                * 934FE
          DO                                     * 93503
          %%0                                    * 93508
          %%0                                    * 9350D
          2OVER                                  * 93512
          ISTOP@                                 * 93517
          2GETLAM                                * 9351C
          DO                                     * 93521
          INDEX@                                 * 93526
          JINDEX@                                * 9352B
          #=                                     * 93530
          ?SKIP                                  * 93535
          ::                                     * 9353A
            8PICK                                * 9353F
            3PICK                                * 93544
            OBJ_372EF                            * 93549
            OBJ_37C98                            * 9354E
            6ROLL                                * 93553
            %%+                                  * 93558
            SWAP                                 * 9355D
            3PICK                                * 93562
            OBJ_372EF                            * 93567
            OBJ_37C98                            * 9356C
            6ROLL                                * 93571
            %%+                                  * 93576
            SWAPDROP                             * 9357B
            2SWAP                                * 93580
          ;                                      * 93585
          1GETLAM                                * 9358A
          ROT#+SWAP                              * 9358F
          #1+                                    * 93594
          NextInArray                            * 93599
          2DROP                                  * 9359E
          2DUP                                   * 935A3
          %%+                                    * 935A8
          ::                                     * 935AD
            3PICK                                * 935B2
            3PICK                                * 935B7
            OBJ_37DA0                            * 935BC
            %%0=                                 * 935C1
            case                                 * 935C6
            3DROP                                * 935CB
            OVER                                 * 935D0
            4PICK                                * 935D5
            CODE                                 * 935DA  74 nibbles
              GOSBVL  SUB_2A0B1                  * 935E4
              HST=0   3                          * 935EB
              GOSBVL  DIVF                       * 935EE
              GOSBVL  SUB_2B6A1                  * 935F5
              GOSBVL  RADD1                      * 935FC
              GOSBVL  DIV2                       * 93603
              GOSBVL  STAB0                      * 9360A
              GOSBVL  SUB_2B767                  * 93611
              C=R1                               * 93618
              ?B#C    M                          * 9361B
              GOYES   L_93627                    * 9361E
              GOSBVL  RSUB1                      * 93620
L_93627:
              GOVLNG  L_2A235                    * 93627
            ENDCODE                              * 9362E
            4dropn;IU!                           * 9362E
            case                                 * 93633
            4DROP                                * 93638
            %%10                                 * 9363D
            OVER                                 * 93642
            %%^                                  * 93647
            5ROLL                                * 9364C
            OVER                                 * 93651
            %%*                                  * 93656
            5ROLL                                * 9365B
            3PICK                                * 93660
            %%/                                  * 93665
            %%+                                  * 9366A
            4ROLL                                * 9366F
            %%      9.5E-1                       * 93674
            %%*                                  * 9368E
            %%>=                                 * 93693
            case2DROP                            * 93698
            INDEX@                               * 9369D
            8PICK                                * 936A2
            OBJ_36FDB                            * 936A7
            UNCOERCE                             * 936AC
            4ROLL                                * 936B1
            %%>%                                 * 936B6
            %+                                   * 936BB
            COERCE                               * 936C0
            8PICK                                * 936C5
            OBJ_37013                            * 936CA
            2DROP                                * 936CF
            OVER                                 * 936D4
            6PICK                                * 936D9
            1GETLAM                              * 936DE
            #1+                                  * 936E3
            2GETLAM                              * 936E8
            DO                                   * 936ED
            OVER                                 * 936F2
            OBJ_372EF                            * 936F7
            4PICK                                * 936FC
            L%/                                  * 93701
            3PICK                                * 93706
            OBJ_37361                            * 9370B
            SWAP#1+SWAP                          * 93710
            NextInArray                          * 93715
            INDEX@                               * 9371A
            ROTDROPSWAP                          * 9371F
            3GETLAM                              * 93724
            #1+_ONE_DO                           * 93729
            OVER                                 * 9372E
            OBJ_372EF                            * 93733
            4PICK                                * 93738
            L%*                                  * 9373D
            3PICK                                * 93742
            OBJ_37361                            * 93747
            1GETLAM                              * 9374C
            ROT#+SWAP                            * 93751
            NextInArray                          * 93756
            3DROP                                * 9375B
            ROTDROP                              * 93760
            FALSE                                * 93765
            3UNROLL                              * 9376A
          ;                                      * 9376F
          SWAP#1+SWAP                            * 93774
          1GETLAM                                * 93779
          #+                                     * 9377E
          LOOP                                   * 93783
          2DROP                                  * 93788
          UNTIL                                  * 9378D
          SWAP                                   * 93792
        ;                                        * 93797

* ROMPTR 0C2 022
* refs (1): 90007
ROMP_0C2_022:
        ::                                       * 9379C
          DUP                                    * 937A1
          MDIMS                                  * 937A6
          OBJ_37DE1                              * 937AB
          4PICK                                  * 937B0
          MDIMS                                  * 937B5
          ?SKIP                                  * 937BA
          BINT1                                  * 937BF
          SWAP                                   * 937C4
          4PICK                                  * 937C9
          #=                                     * 937CE
          OBJ_37DE1                              * 937D3
          4ROLL                                  * 937D8
          5ROLL                                  * 937DD
          OBJ_36B14                              * 937E2
          5UNROLL                                * 937E7
          4UNROLL                                * 937EC
          3UNROLL                                * 937F1
          ROMPTR  0C2 026                        * 937F6
          SWAP                                   * 93801
          OBJ_7CD7E                              * 93806
          ROTSWAP                                * 9380B
          ROMPTR  0C2 028                        * 93810
          SWAP                                   * 9381B
          ROMPTR  0C2 029                        * 93820
          ROMPTR  0C2 02D                        * 9382B
          2GETLAM                                * 93836
          4GETLAM                                * 9383B
          #>                                     * 93840
          IT                                     * 93845
          ROMPTR  0C2 02A                        * 9384A
          SWAP                                   * 93855
          5GETLAM                                * 9385A
          ROMPTR  0C2 02C                        * 9385F
          DROP                                   * 9386A
          3GETLAM                                * 9386F
          2GETLAM                                * 93874
          #=                                     * 93879
          4GETLAM                                * 9387E
          2GETLAM                                * 93883
          #=                                     * 93888
          AND                                    * 9388D
          ?SKIP                                  * 93892
          ::                                     * 93897
            2GETLAM                              * 9389C
            4PICK                                * 938A1
            MDIMS                                * 938A6
            ITE                                  * 938AB
            ::                                   * 938B0
              SWAPDROP                           * 938B5
              BINT2                              * 938BA
            ;                                    * 938BF
            DROPONE                              * 938C4
            {}N                                  * 938C9
            3GETLAM                              * 938CE
            2GETLAM                              * 938D3
            #=?SKIP                              * 938D8
            ::                                   * 938DD
              4ROLLOVER                          * 938E2
              MATREDIM                           * 938E7
              4UNROLL                            * 938EC
            ;                                    * 938F1
            OVER                                 * 938F6
            OBJ_37A0E                            * 938FB
            MAKEARRY                             * 93900
            4GETLAM                              * 93905
            5GETLAM                              * 9390A
            #*                                   * 9390F
            OBJ_7D4C5                            * 93914
            SWAPDROP                             * 93919
          ;                                      * 9391E
          2GETLAM                                * 93923
          4GETLAM                                * 93928
          #>                                     * 9392D
          IT                                     * 93932
          ROMPTR  0C2 02B                        * 93937
          SWAPDROP                               * 93942
          OBJ_7CDE2                              * 93947
          2GETLAM                                * 9394C
          DUP                                    * 93951
          ZERO_DO                                * 93956
          1GETLAM                                * 9395B
          OBJ_36FDB                              * 93960
          2DUP#=                                 * 93965
          ?SKIP                                  * 9396A
          SWAPROWS                               * 9396F
          DROP#1-                                * 93974
          NextInArray                            * 93979
          DROP                                   * 9397E
          ABND                                   * 93983
        ;                                        * 93988

* ROMPTR 0C2 023
* refs (1): 90007
ROMP_0C2_023:
        ::                                       * 9398D
          DUPDUP                                 * 93992
          MDIMS                                  * 93997
          OBJ_37DE1                              * 9399C
          OVERSWAP                               * 939A1
          ROMPTR  0C2 025                        * 939A6
          ROT                                    * 939B1
          OBJ_38185                              * 939B6
          3UNROLL                                * 939BB
        ;                                        * 939C0

* ROMPTR 0C2 024
* refs (1): 90007
ROMP_0C2_024:
        ::                                       * 939C5
          DUP                                    * 939CA
          MDIMS                                  * 939CF
          OBJ_37DE1                              * 939D4
          ROT                                    * 939D9
          CKREF                                  * 939DE
          OBJ_38185                              * 939E3
          DUP                                    * 939E8
          ROTDUP                                 * 939ED
          5ROLL                                  * 939F2
          ROMPTR  0C2 025                        * 939F7
          OBJ_38185                              * 93A02
          SWAP                                   * 93A07
          OBJ_38185                              * 93A0C
          3UNROLL                                * 93A11
        ;                                        * 93A16

* ROMPTR 0C2 025
* refs (1): 90007
ROMP_0C2_025:
        ::                                       * 93A1B
          ROMPTR  0C2 026                        * 93A20
          3GETLAM                                * 93A2B
          DUP                                    * 93A30
          TWO{}N                                 * 93A35
          3PICK                                  * 93A3A
          OBJ_379F0                              * 93A3F
          MAKEARRY                               * 93A44
          SWAPDUP                                * 93A49
          OBJ_37A0E                              * 93A4E
          3GETLAM                                * 93A53
          ROMPTR  0C2 033                        * 93A58
          ROMPTR  0C2 028                        * 93A63
          ROTSWAP                                * 93A6E
          OBJ_7CDE2                              * 93A73
          ROT                                    * 93A78
          CKREF                                  * 93A7D
          ROT                                    * 93A82
          ROMPTR  0C2 029                        * 93A87
          OBJ_7CDE2                              * 93A92
          DUP                                    * 93A97
          OBJ_379F0                              * 93A9C
          SWAPONE                                * 93AA1
          3GETLAM                                * 93AA6
          ZERO_DO                                * 93AAB
          2GETLAM                                * 93AB0
          ZERO_DO                                * 93AB5
          JINDEX@                                * 93ABA
          INDEX@                                 * 93ABF
          #>                                     * 93AC4
          IT                                     * 93AC9
          ::                                     * 93ACE
            SWAP3PICK                            * 93AD3
            3PICK                                * 93AD8
            PUTEL                                * 93ADD
            SWAP                                 * 93AE2
          ;                                      * 93AE7
          #1+                                    * 93AEC
          NextInArray                            * 93AF1
          LOOP                                   * 93AF6
          DROPSWAPDROP                           * 93AFB
          2GETLAM                                * 93B00
          DUP                                    * 93B05
          TWO{}N                                 * 93B0A
          %0_2A2B4                               * 93B0F
          MAKEARRY                               * 93B14
          @idn!(ar)                              * 93B19
          2GETLAM                                * 93B1E
          #1+_ONE_DO                             * 93B23
          INDEX@                                 * 93B28
          1GETLAM                                * 93B2D
          OBJ_36FDB                              * 93B32
          2DUP#=                                 * 93B37
          ?SKIP                                  * 93B3C
          CODE                                   * 93B41  110 nibbles
            GOSBVL  SAVPTR                       * 93B4B
            GOSBVL  POP2#                        * 93B52
            B=C     A                            * 93B59
            C=DAT1  A                            * 93B5B
            D1=C                                 * 93B5E
            D1=D1+  10                           * 93B61
            D1=D1+  15                           * 93B64
            C=DAT1  A                            * 93B67
            D=C     A                            * 93B6A
            D1=D1+  5                            * 93B6C
            B=B-1   A                            * 93B6F
            BSL     A                            * 93B71
            A=A-1   A                            * 93B73
            ASL     A                            * 93B75
            DSL     A                            * 93B77
            BCEX    A                            * 93B79
            AD1EX                                * 93B7B
            C=C+A   A                            * 93B7E
            D0=C                                 * 93B80
            CD1EX                                * 93B83
            C=C+A   A                            * 93B86
            D1=C                                 * 93B88
            B=B-1   A                            * 93B8B
L_93B8D:
            A=DAT0  W                            * 93B8D
            C=DAT1  W                            * 93B91
            DAT0=C  W                            * 93B95
            DAT1=A  W                            * 93B99
            CD1EX                                * 93B9D
            C=C+D   A                            * 93BA0
            D1=C                                 * 93BA2
            CD0EX                                * 93BA5
            C=C+D   A                            * 93BA8
            D0=C                                 * 93BAA
            B=B-1   A                            * 93BAD
            GONC    L_93B8D                      * 93BAF
            GOVLNG  GETPTRLOOP                   * 93BB2
          ENDCODE                                * 93BB9
          2DROP                                  * 93BB9
          NextInArray                            * 93BBE
          ABND                                   * 93BC3
        ;                                        * 93BC8

* ROMPTR 0C2 026
* refs (1): 90007
ROMP_0C2_026:
        ::                                       * 93BCD
          #       FFF                            * 93BD2  4095
          OVER#<                                 * 93BDC
          case                                   * 93BE1
          doerr501                               * 93BE6
          ONEONE                                 * 93BEB
          RESOROMP                               * 93BF0
          ROMPTR  0C2 027                        * 93BF5
          6ROLL                                  * 93C00
          6ROLL                                  * 93C05
          6ROLL                                  * 93C0A
          2DUP                                   * 93C0F
          #MIN                                   * 93C14
          3UNROLL                                * 93C19
          DUP                                    * 93C1E
          BINT3                                  * 93C23
          #*                                     * 93C28
          !MAKEHXS                               * 93C2D
          8NULLLAM{}                             * 93C32
          BIND                                   * 93C37
          3GETLAM                                * 93C3C
          #2+                                    * 93C41
          2GETLAM                                * 93C46
          TWO{}N                                 * 93C4B
          OVER                                   * 93C50
          TYPERARRY?                             * 93C55
          ITE                                    * 93C5A
          %%0                                    * 93C5F
          ((0,0))                                * 93C64
          MAKEARRY                               * 93C69
          OBJ_7CDBF                              * 93C6E
          SWAP                                   * 93C73
          ARSIZE                                 * 93C78
          SWAP                                   * 93C7D
          2GETLAM                                * 93C82
          #1+_ONE_DO                             * 93C87
          INDEX@                                 * 93C8C
          DUP                                    * 93C91
          1GETLAM                                * 93C96
          OBJ_37013                              * 93C9B
          3GETLAM                                * 93CA0
          OBJ_7CA98                              * 93CA5
          DUPUNROT                               * 93CAA
          4PICK                                  * 93CAF
          INDEX@                                 * 93CB4
          #+                                     * 93CB9
          OBJ_37361                              * 93CBE
          SWAP3PICK                              * 93CC3
          2GETLAM                                * 93CC8
          #+                                     * 93CCD
          INDEX@                                 * 93CD2
          #+                                     * 93CD7
          OBJ_37361                              * 93CDC
          NextInArray                            * 93CE1
          BINT1                                  * 93CE6
          3GETLAM                                * 93CEB
          ROT                                    * 93CF0
          BINT1                                  * 93CF5
          BEGIN                                  * 93CFA
          OBJ_357F0                              * 93CFF
          CODE                                   * 93D04  214 nibbles
            GOSBVL  SAVPTR                       * 93D0E
            C=DAT1  A                            * 93D15
            D0=C                                 * 93D18
            D0=D0+  5                            * 93D1B
            C=DAT0  A                            * 93D1E
            R0=C                                 * 93D21
            RSTK=C                               * 93D24
            D1=D1+  5                            * 93D26
            C=DAT1  A                            * 93D29
            D1=C                                 * 93D2C
            D1=D1+  10                           * 93D2F
            A=DAT1  A                            * 93D32
            ST=0    0                            * 93D35
            LC(5)   DOEREL                       * 93D38
            ?C=A    A                            * 93D3F
            GOYES   L_93D47                      * 93D42
            ST=1    0                            * 93D44
L_93D47:
            D1=D1+  10                           * 93D47
            C=DAT1  A                            * 93D4A
            C=C-1   A                            * 93D4D
            C=C-1   A                            * 93D4F
            D=C     A                            * 93D51
            D1=D1+  5                            * 93D53
            C=DAT1  A                            * 93D56
            R4=C                                 * 93D59
            D1=D1+  5                            * 93D5C
            GOSBVL  L_35790                      * 93D5F
            A=R0                                 * 93D66
            B=B+A   A                            * 93D69
            B=B-1   A                            * 93D6B
            GOSBVL  SUB_3767E                    * 93D6D
            ?ST=0   0                            * 93D74
            GOYES   L_93D7B                      * 93D77
            B=B+B   A                            * 93D79
L_93D7B:
            AD1EX                                * 93D7B
            A=A+B   A                            * 93D7E
            D1=A                                 * 93D80
            A=0     W                            * 93D83
            R2=A                                 * 93D86
            R3=A                                 * 93D89
            ST=0    1                            * 93D8C
L_93D8F:
            GOSBVL  GETAB1                       * 93D8F
            ?ST=0   0                            * 93D96
            GOYES   L_93DA1                      * 93D99
            D1=D1+  16                           * 93D9B
            D1=D1+  5                            * 93D9E
L_93DA1:
            SETDEC                               * 93DA1
            GOSBVL  SUB_2BF81                    * 93DA3
            GOSBVL  RCAB2                        * 93DAA
            P=      6                            * 93DB1
            GOSBVL  TST15                        * 93DB3
            GOC     L_93DCB                      * 93DBA
            GOSBVL  STCD2                        * 93DBD
            C=RSTK                               * 93DC4
            RSTK=C                               * 93DC6
            R0=C                                 * 93DC8
L_93DCB:
            SETHEX                               * 93DCB
            C=RSTK                               * 93DCD
            C=C+1   A                            * 93DCF
            RSTK=C                               * 93DD1
            A=R4                                 * 93DD3
            ?C<=A   A                            * 93DD6
            GOYES   L_93D8F                      * 93DD9
            P=      0                            * 93DDB
            GOVLNG  PUSH#LOOP                    * 93DDD
          ENDCODE                                * 93DE4
          1GETLAM                                * 93DE4
          OBJ_37013                              * 93DE9
          2DUP#=                                 * 93DEE
          ?SKIP                                  * 93DF3
          OBJ_375A7                              * 93DF8
          DROP                                   * 93DFD
          4UNROLL                                * 93E02
          6GETLAM                                * 93E07
          EVAL                                   * 93E0C
          ROT                                    * 93E11
          2GETLAM                                * 93E16
          OBJ_36FB0                              * 93E1B
          ROT                                    * 93E20
          #1-                                    * 93E25
          ROT                                    * 93E2A
          4ROLL                                  * 93E2F
          #1+                                    * 93E34
          DUP                                    * 93E39
          4GETLAM                                * 93E3E
          #>                                     * 93E43
          UNTIL                                  * 93E48
          DROPSWAPDROP                           * 93E4D
          ROTROT2DROP                            * 93E52
        ;                                        * 93E57

* ROMPTR 0C2 027
* refs (1): 90007
ROMP_0C2_027:
        ::                                       * 93E5C
          3PICK                                  * 93E61
          2GETLAM                                * 93E66
          #+DUP                                  * 93E6B
          4PICK                                  * 93E70
          #1-                                    * 93E75
          OBJ_7CA98                              * 93E7A
          OBJ_37D69                              * 93E7F
          SWAP                                   * 93E84
          4PICK                                  * 93E89
          OBJ_372EF                              * 93E8E
          DUP                                    * 93E93
          dup;cc?                                * 93E98
          5PICK                                  * 93E9D
          %%0=                                   * 93EA2
          AND                                    * 93EA7
          ITE                                    * 93EAC
          ::                                     * 93EB1
            4ROLL                                * 93EB6
            DROPDUP                              * 93EBB
            %%ABS                                * 93EC0
          ;                                      * 93EC5
          ::                                     * 93ECA
            OVER                                 * 93ECF
            OBJ_37D37                            * 93ED4
            5ROLL                                * 93ED9
            %%+                                  * 93EDE
            %%SQRT                               * 93EE3
          ;                                      * 93EE8
          4UNROLL                                * 93EED
          OBJ_36C07                              * 93EF2
          3PICK                                  * 93EF7
          L%-                                    * 93EFC
          DUPUNROT                               * 93F01
          6PICK                                  * 93F06
          OBJ_37361                              * 93F0B
          3PICK                                  * 93F10
          8PICK                                  * 93F15
          8PICK                                  * 93F1A
          #+                                     * 93F1F
          OBJ_37361                              * 93F24
          3UNROLL                                * 93F29
          L%*                                    * 93F2E
          DUP                                    * 93F33
          =0?(nb)                                * 93F38
          casedrop                               * 93F3D
          ::                                     * 93F42
            4PICK                                * 93F47
            #1-                                  * 93F4C
            4PUTLAM                              * 93F51
          ;                                      * 93F56
          5PICK                                  * 93F5B
          2GETLAM                                * 93F60
          #=                                     * 93F65
          caseDROP                               * 93F6A
          4PICK                                  * 93F6F
          ROT                                    * 93F74
          2GETLAM                                * 93F79
          7PICK                                  * 93F7E
          DO                                     * 93F83
          SWAP#1+SWAP                            * 93F88
          5PICK                                  * 93F8D
          3PICK                                  * 93F92
          6PICK                                  * 93F97
          OBJ_7CA98                              * 93F9C
          4PICK                                  * 93FA1
          L%/                                    * 93FA6
          SWAP                                   * 93FAB
          6PICK                                  * 93FB0
          4PICK                                  * 93FB5
          7PICK                                  * 93FBA
          ZERO_DO                                * 93FBF
          ROT                                    * 93FC4
          3PICK                                  * 93FC9
          OBJ_372EF                              * 93FCE
          5PICK                                  * 93FD3
          L%*                                    * 93FD8
          SWAP3PICK                              * 93FDD
          OBJ_372EF                              * 93FE2
          ROT                                    * 93FE7
          L%+                                    * 93FEC
          3PICK                                  * 93FF1
          OBJ_37361                              * 93FF6
          2GETLAM                                * 93FFB
          4ROLLOVER                              * 94000
          #+                                     * 94005
          4ROLLROT                               * 9400A
          #+                                     * 9400F
          NextInArray                            * 94014
          4ROLL                                  * 94019
          DROP                                   * 9401E
          ROTOVER                                * 94023
          OBJ_372EF                              * 94028
          OBJ_37D69                              * 9402D
          4dropn;IU!                             * 94032
          ITE                                    * 94037
          ::                                     * 9403C
            DROP                                 * 94041
            ROTROT2DROP                          * 94046
          ;                                      * 9404B
          ::                                     * 94050
            SWAP                                 * 94055
            5PICK                                * 9405A
            OBJ_372EF                            * 9405F
            OBJ_37D37                            * 94064
            ROTSWAP                              * 94069
            %%-                                  * 9406E
            %%0                                  * 94073
            %%MAX                                * 94078
            SWAP3PICK                            * 9407D
            2GETLAM                              * 94082
            #+                                   * 94087
            OBJ_372EF                            * 9408C
            OBJ_37D69                            * 94091
            DUP                                  * 94096
            4PICK                                * 9409B
            %%      1E-3                         * 940A0
            %%*                                  * 940BA
            %%+                                  * 940BF
            %%<                                  * 940C4
            ITE                                  * 940C9
            SWAP                                 * 940CE
            ::                                   * 940D3
              SWAPDROP                           * 940D8
              4PICK                              * 940DD
              2GETLAM                            * 940E2
              #+DUP                              * 940E7
              8PICK                              * 940EC
              #1-                                * 940F1
              OBJ_7CA98                          * 940F6
              DUPUNROT                           * 940FB
              4PICK                              * 94100
              2GETLAM                            * 94105
              #+                                 * 9410A
              OBJ_37361                          * 9410F
              SWAP                               * 94114
            ;                                    * 94119
            ROT                                  * 9411E
            OBJ_37361                            * 94123
            SWAPDROP                             * 94128
          ;                                      * 9412D
          LOOP                                   * 94132
          ROTROT2DROP                            * 94137
        ;                                        * 9413C

* ROMPTR 0C2 028
* refs (1): 90007
ROMP_0C2_028:
        ::                                       * 94141
          4GETLAM                                * 94146
          #0=?SEMI                               * 9414B
          3GETLAM                                * 94150
          2GETLAM                                * 94155
          #*                                     * 9415A
          3UNROLL                                * 9415F
          ONEONE                                 * 94164
          3GETLAM                                * 94169
          BINT1                                  * 9416E
          BEGIN                                  * 94173
          6ROLL                                  * 94178
          4PICK                                  * 9417D
          OBJ_372EF                              * 94182
          SWAP                                   * 94187
          8PICK                                  * 9418C
          7PICK                                  * 94191
          #+                                     * 94196
          OBJ_372EF                              * 9419B
          ROT                                    * 941A0
          L%*                                    * 941A5
          SWAP                                   * 941AA
          7ROLL                                  * 941AF
          5GETLAM                                * 941B4
          ZERO_DO                                * 941B9
          6PICK                                  * 941BE
          5PICK                                  * 941C3
          7PICK                                  * 941C8
          OBJ_7CAA4                              * 941CD
          4PICK                                  * 941D2
          L%/                                    * 941D7
          3UNROLL                                * 941DC
          7PICK                                  * 941E1
          6PICK                                  * 941E6
          8PICK                                  * 941EB
          ZERO_DO                                * 941F0
          4ROLL                                  * 941F5
          3PICK                                  * 941FA
          OBJ_372EF                              * 941FF
          6PICK                                  * 94204
          L%*                                    * 94209
          5ROLL                                  * 9420E
          4PICK                                  * 94213
          OBJ_372EF                              * 94218
          ROT                                    * 9421D
          L%+                                    * 94222
          4PICK                                  * 94227
          OBJ_37361                              * 9422C
          4ROLL                                  * 94231
          2GETLAM                                * 94236
          #+                                     * 9423B
          4ROLL                                  * 94240
          5GETLAM                                * 94245
          #+                                     * 9424A
          NextInArray                            * 9424F
          2DROP                                  * 94254
          ROTDROP                                * 94259
          4ROLL                                  * 9425E
          #1+                                    * 94263
          4UNROLL                                * 94268
          LOOP                                   * 9426D
          ROTDROP                                * 94272
          6ROLL                                  * 94277
          #1+                                    * 9427C
          6ROLL                                  * 94281
          2GETLAM                                * 94286
          OBJ_36FB0                              * 9428B
          6ROLL                                  * 94290
          #1-                                    * 94295
          6ROLL                                  * 9429A
          4PICK                                  * 9429F
          4GETLAM                                * 942A4
          #>                                     * 942A9
          UNTIL                                  * 942AE
          4DROP                                  * 942B3
          ROTDROP                                * 942B8
        ;                                        * 942BD

* ROMPTR 0C2 029
* refs (1): 90007
ROMP_0C2_029:
        ::                                       * 942C2
          4GETLAM                                * 942C7
          #0=?SEMI                               * 942CC
          BINT1                                  * 942D1
          2GETLAM                                * 942D6
          3GETLAM                                * 942DB
          OVER                                   * 942E0
          #*                                     * 942E5
          #1+SWAP                                * 942EA
          #1+                                    * 942EF
          4UNROLL                                * 942F4
          4GETLAM                                * 942F9
          ZERO_DO                                * 942FE
          ROTOVER                                * 94303
          OBJ_372EF                              * 94308
          4PICK                                  * 9430D
          OBJ_37361                              * 94312
          ROT                                    * 94317
          4PICK#+                                * 9431C
          ROT#1+                                 * 94321
          NextInArray                            * 94326
          2DROP                                  * 9432B
          SWAPDROP                               * 94330
        ;                                        * 94335

* ROMPTR 0C2 02A
* refs (1): 90007
ROMP_0C2_02A:
        ::                                       * 9433A
          4GETLAM                                * 9433F
          #0=?SEMI                               * 94344
          4GETLAM                                * 94349
          2GETLAM                                * 9434E
          OVER                                   * 94353
          #1-                                    * 94358
          #*                                     * 9435D
          OVER                                   * 94362
          #+DUP                                  * 94367
          #1+                                    * 9436C
          ROT                                    * 94371
          2GETLAM                                * 94376
          3GETLAM                                * 9437B
          #*                                     * 94380
          #+                                     * 94385
          4GETLAM                                * 9438A
          BEGIN                                  * 9438F
          4UNROLL                                * 94394
          5PICK                                  * 94399
          3PICK                                  * 9439E
          DUP                                    * 943A3
          2GETLAM                                * 943A8
          4GETLAM                                * 943AD
          #-                                     * 943B2
          OBJ_7CC7F                              * 943B7
          OBJ_37D69                              * 943BC
          SWAP                                   * 943C1
          5PICK                                  * 943C6
          OBJ_372EF                              * 943CB
          DUP                                    * 943D0
          dup;cc?                                * 943D5
          5PICK                                  * 943DA
          %%0=                                   * 943DF
          AND                                    * 943E4
          ITE                                    * 943E9
          ::                                     * 943EE
            4ROLL                                * 943F3
            DROPDUP                              * 943F8
            %%ABS                                * 943FD
          ;                                      * 94402
          ::                                     * 94407
            OVER                                 * 9440C
            OBJ_37D37                            * 94411
            5ROLL                                * 94416
            %%+                                  * 9441B
            %%SQRT                               * 94420
          ;                                      * 94425
          4UNROLL                                * 9442A
          OBJ_36C07                              * 9442F
          3PICK                                  * 94434
          L%-                                    * 94439
          DUPUNROT                               * 9443E
          5PICK                                  * 94443
          OBJ_37361                              * 94448
          3PICK                                  * 9444D
          7PICK                                  * 94452
          OBJ_37361                              * 94457
          3UNROLL                                * 9445C
          L%*                                    * 94461
          6PICK                                  * 94466
          #1=case                                * 9446B
          ::                                     * 94470
            RDROP                                * 94475
            6DROP                                * 9447A
          ;                                      * 9447F
          SWAP                                   * 94484
          6PICK                                  * 94489
          4GETLAM                                * 9448E
          #1+                                    * 94493
          OVER                                   * 94498
          ONE_DO                                 * 9449D
          ROT                                    * 944A2
          5PICK                                  * 944A7
          OBJ_372EF                              * 944AC
          OBJ_37D87                              * 944B1
          SWAP                                   * 944B6
          4PICK                                  * 944BB
          OBJ_372EF                              * 944C0
          ROT                                    * 944C5
          L%*                                    * 944CA
          SWAP                                   * 944CF
          7PICK                                  * 944D4
          4PICK                                  * 944D9
          2GETLAM                                * 944DE
          4GETLAM                                * 944E3
          #-                                     * 944E8
          OBJ_7CC7F                              * 944ED
          ROT                                    * 944F2
          L%+                                    * 944F7
          5PICK                                  * 944FC
          L%/                                    * 94501
          SWAP                                   * 94506
          6PICK                                  * 9450B
          OBJ_372EF                              * 94510
          3PICK                                  * 94515
          L%*                                    * 9451A
          SWAP                                   * 9451F
          5PICK                                  * 94524
          OBJ_372EF                              * 94529
          ROT                                    * 9452E
          L%+                                    * 94533
          5PICK                                  * 94538
          OBJ_37361                              * 9453D
          7PICK                                  * 94542
          4PICK                                  * 94547
          2GETLAM                                * 9454C
          4GETLAM                                * 94551
          DO                                     * 94556
          ROT                                    * 9455B
          3PICK                                  * 94560
          OBJ_372EF                              * 94565
          5PICK                                  * 9456A
          L%*                                    * 9456F
          SWAP3PICK                              * 94574
          OBJ_372EF                              * 94579
          ROT                                    * 9457E
          L%+                                    * 94583
          3PICK                                  * 94588
          OBJ_37361                              * 9458D
          ROT#1+                                 * 94592
          ROT#1+                                 * 94597
          NextInArray                            * 9459C
          2DROP                                  * 945A1
          SWAPDROP                               * 945A6
          ROT                                    * 945AB
          2GETLAM                                * 945B0
          #+                                     * 945B5
          ROT                                    * 945BA
          2GETLAM                                * 945BF
          #+                                     * 945C4
          LOOP                                   * 945C9
          4DROP                                  * 945CE
          ROT                                    * 945D3
          2GETLAM                                * 945D8
          OBJ_36FC4                              * 945DD
          ROT                                    * 945E2
          2GETLAM                                * 945E7
          #-                                     * 945EC
          ROT                                    * 945F1
          #1-                                    * 945F6
          4ROLL                                  * 945FB
          #1-                                    * 94600
          AGAIN                                  * 94605
        ;                                        * 9460A

* ROMPTR 0C2 02B
* refs (1): 90007
ROMP_0C2_02B:
        ::                                       * 9460F
          4GETLAM                                * 94614
          #0=?SEMI                               * 94619
          BINT1                                  * 9461E
          2GETLAM                                * 94623
          3GETLAM                                * 94628
          #*                                     * 9462D
          #1+                                    * 94632
          4GETLAM                                * 94637
          #1+                                    * 9463C
          ONEONE                                 * 94641
          BEGIN                                  * 94646
          7PICK                                  * 9464B
          5PICK                                  * 94650
          OBJ_372EF                              * 94655
          SWAP                                   * 9465A
          7PICK                                  * 9465F
          OBJ_372EF                              * 94664
          ROT                                    * 94669
          L%*                                    * 9466E
          OBJ_37D87                              * 94673
          4GETLAM                                * 94678
          5GETLAM                                * 9467D
          #*                                     * 94682
          #1+                                    * 94687
          ROT                                    * 9468C
          BINT9                                  * 94691
          PICK                                   * 94696
          5GETLAM                                * 9469B
          ZERO_DO                                * 946A0
          SWAP                                   * 946A5
          8PICK                                  * 946AA
          OBJ_372EF                              * 946AF
          ROT                                    * 946B4
          7PICK                                  * 946B9
          OBJ_372EF                              * 946BE
          ROT                                    * 946C3
          L%*                                    * 946C8
          3UNROLL                                * 946CD
          8PICK                                  * 946D2
          5PICK                                  * 946D7
          2GETLAM                                * 946DC
          4GETLAM                                * 946E1
          #-                                     * 946E6
          OBJ_7C861                              * 946EB
          4ROLL                                  * 946F0
          L%+                                    * 946F5
          5PICK                                  * 946FA
          L%/                                    * 946FF
          3UNROLL                                * 94704
          SWAP                                   * 94709
          BINT9                                  * 9470E
          PICK                                   * 94713
          OBJ_372EF                              * 94718
          OBJ_37D87                              * 9471D
          4PICK                                  * 94722
          L%*                                    * 94727
          ROT                                    * 9472C
          8PICK                                  * 94731
          OBJ_372EF                              * 94736
          ROT                                    * 9473B
          L%+                                    * 94740
          8PICK                                  * 94745
          OBJ_37361                              * 9474A
          8PICK                                  * 9474F
          5PICK                                  * 94754
          2GETLAM                                * 94759
          4GETLAM                                * 9475E
          DO                                     * 94763
          4ROLL                                  * 94768
          3PICK                                  * 9476D
          OBJ_372EF                              * 94772
          OBJ_37D87                              * 94777
          6PICK                                  * 9477C
          L%*                                    * 94781
          5ROLL                                  * 94786
          4PICK                                  * 9478B
          OBJ_372EF                              * 94790
          ROT                                    * 94795
          L%+                                    * 9479A
          4PICK                                  * 9479F
          OBJ_37361                              * 947A4
          4ROLL                                  * 947A9
          #1+                                    * 947AE
          4ROLL                                  * 947B3
          5GETLAM                                * 947B8
          #+                                     * 947BD
          NextInArray                            * 947C2
          2DROP                                  * 947C7
          ROTDROP                                * 947CC
          6ROLL                                  * 947D1
          #1+                                    * 947D6
          6UNROLL                                * 947DB
          ROT#1+UNROT                            * 947E0
          LOOP                                   * 947E5
          4DROP                                  * 947EA
          5ROLL                                  * 947EF
          2GETLAM                                * 947F4
          OBJ_36FB0                              * 947F9
          5ROLL                                  * 947FE
          #1+                                    * 94803
          5ROLL                                  * 94808
          2GETLAM                                * 9480D
          #+                                     * 94812
          5ROLL                                  * 94817
          5ROLL                                  * 9481C
          #1+                                    * 94821
          DUP                                    * 94826
          4GETLAM                                * 9482B
          #>                                     * 94830
          UNTIL                                  * 94835
          5DROP                                  * 9483A
        ;                                        * 9483F

* ROMPTR 0C2 02C
* refs (1): 90007
ROMP_0C2_02C:
        ::                                       * 94844
          4GETLAM                                * 94849
          #0=?SEMI                               * 9484E
          2GETLAM                                * 94853
          4GETLAM                                * 94858
          DUP#1-                                 * 9485D
          3PICK                                  * 94862
          #*                                     * 94867
          OVER#+                                 * 9486C
          4PICK                                  * 94871
          3PICK                                  * 94876
          #*                                     * 9487B
          ROT                                    * 94880
          ZERO_DO                                * 94885
          5PICK                                  * 9488A
          7PICK                                  * 9488F
          4PICK                                  * 94894
          OBJ_372EF                              * 94899
          SWAP                                   * 9489E
          ROT                                    * 948A3
          7PICK                                  * 948A8
          ZERO_DO                                * 948AD
          5PICK                                  * 948B2
          #1+                                    * 948B7
          5PICK                                  * 948BC
          BINT9                                  * 948C1
          PICK                                   * 948C6
          #+                                     * 948CB
          JINDEX@                                * 948D0
          OBJ_7C861                              * 948D5
          SWAP                                   * 948DA
          5PICK                                  * 948DF
          OBJ_372EF                              * 948E4
          ROT                                    * 948E9
          L%-                                    * 948EE
          4PICK                                  * 948F3
          L%/                                    * 948F8
          5PICK                                  * 948FD
          OBJ_37361                              * 94902
          4ROLL                                  * 94907
          #1-                                    * 9490C
          4UNROLL                                * 94911
          NextInArray                            * 94916
          3DROP                                  * 9491B
          SWAP                                   * 94920
          3PICK                                  * 94925
          OBJ_36FC4                              * 9492A
          SWAP                                   * 9492F
          LOOP                                   * 94934
          3DROP                                  * 94939
        ;                                        * 9493E

* ROMPTR 0C2 02D
* refs (1): 90007
ROMP_0C2_02D:
        ::                                       * 94943
          4GETLAM                                * 94948
          BINT2                                  * 9494D
          #<                                     * 94952
          ?SEMI                                  * 94957
          RESOROMP                               * 9495C
          ROMPTR  0C2 02F                        * 94961
          6PUTLAM                                * 9496C
          RESOROMP                               * 94971
          ROMPTR  0C2 030                        * 94976
          7PUTLAM                                * 94981
          RESOROMP                               * 94986
          ROMPTR  0C2 02E                        * 9498B
          8PUTLAM                                * 94996
          2GETLAM                                * 9499B
          3GETLAM                                * 949A0
          #*                                     * 949A5
          #1+                                    * 949AA
          ONEONE                                 * 949AF
          4PICK                                  * 949B4
          OVER                                   * 949B9
          OBJ_372EF                              * 949BE
          B%ABS                                  * 949C3
          DUP                                    * 949C8
          ROT                                    * 949CD
          %%1                                    * 949D2
          7PICK                                  * 949D7
          OBJ_37361                              * 949DC
          %%1                                    * 949E1
          7PICK                                  * 949E6
          2GETLAM                                * 949EB
          #+                                     * 949F0
          OBJ_37361                              * 949F5
          BEGIN                                  * 949FA
          4ROLL                                  * 949FF
          2GETLAM                                * 94A04
          OBJ_36FB0                              * 94A09
          4UNROLL                                * 94A0E
          6GETLAM                                * 94A13
          EVAL                                   * 94A18
          8UNROLL                                * 94A1D
          8UNROLL                                * 94A22
          7GETLAM                                * 94A27
          EVAL                                   * 94A2C
          8UNROLL                                * 94A31
          8UNROLL                                * 94A36
          OVER                                   * 94A3B
          OBJ_36C52                              * 94A40
          %%*                                    * 94A45
          4PICK                                  * 94A4A
          %%<                                    * 94A4F
          ?SKIP                                  * 94A54
          ::                                     * 94A59
            5PICK                                * 94A5E
            4PUTLAM                              * 94A63
          ;                                      * 94A68
          5ROLL                                  * 94A6D
          #1+                                    * 94A72
          4GETLAM                                * 94A77
          OVER                                   * 94A7C
          #>                                     * 94A81
          WHILE                                  * 94A86
          ::                                     * 94A8B
            5UNROLL                              * 94A90
            BINT9                                * 94A95
            ROLL                                 * 94A9A
            OBJ_37D87                            * 94A9F
            BINT10                               * 94AA4
            ROLL                                 * 94AA9
            OBJ_37D87                            * 94AAE
            8PICK                                * 94AB3
            4ROLL                                * 94AB8
            8PICK                                * 94ABD
            8GETLAM                              * 94AC2
            EVAL                                 * 94AC7
            7ROLL                                * 94ACC
            OBJ_37D87                            * 94AD1
            8ROLL                                * 94AD6
            OBJ_37D87                            * 94ADB
            8PICK                                * 94AE0
            2GETLAM                              * 94AE5
            #+                                   * 94AEA
            4ROLL                                * 94AEF
            8PICK                                * 94AF4
            8GETLAM                              * 94AF9
            EVAL                                 * 94AFE
          ;                                      * 94B03
          REPEAT                                 * 94B08
          BINT10                                 * 94B0D
          NDROP                                  * 94B12
        ;                                        * 94B17

* ROMPTR 0C2 02E
* refs (1): 90007
ROMP_0C2_02E:
        ::                                       * 94B1C
          ONE_DO                                 * 94B21
          OVER                                   * 94B26
          OBJ_372EF                              * 94B2B
          4PICK                                  * 94B30
          L%*                                    * 94B35
          3PICK                                  * 94B3A
          OBJ_37361                              * 94B3F
          SWAP#1+SWAP                            * 94B44
          NextInArray                            * 94B49
          ROTDROP                                * 94B4E
          3UNROLL                                * 94B53
          OBJ_37361                              * 94B58
        ;                                        * 94B5D

* ROMPTR 0C2 02F
* refs (1): 90007
ROMP_0C2_02F:
        ::                                       * 94B62
          4PICK                                  * 94B67
          OBJ_372EF                              * 94B6C
          DUP                                    * 94B71
          B%ABS                                  * 94B76
          5PICK                                  * 94B7B
          %%1E-14                                * 94B80
          %%*                                    * 94B85
          OVER                                   * 94B8A
          %%>                                    * 94B8F
          case                                   * 94B94
          ::                                     * 94B99
            5UNROLL                              * 94B9E
            4ROLL                                * 94BA3
            2DROP                                * 94BA8
            %%0                                  * 94BAD
            %%1                                  * 94BB2
          ;                                      * 94BB7
          ROT                                    * 94BBC
          8PICK                                  * 94BC1
          8PICK                                  * 94BC6
          DUP#1+                                 * 94BCB
          SWAP                                   * 94BD0
          OBJ_7C855                              * 94BD5
          DUP                                    * 94BDA
          B%ABS                                  * 94BDF
          7PICK                                  * 94BE4
          %%1E-14                                * 94BE9
          %%*                                    * 94BEE
          OVER                                   * 94BF3
          %%>                                    * 94BF8
          case2drop                              * 94BFD
          ::                                     * 94C02
            ROTDROP                              * 94C07
            %%1                                  * 94C0C
            %%0                                  * 94C11
            4ROLL                                * 94C16
            6PICK                                * 94C1B
            OVER                                 * 94C20
            %%<                                  * 94C25
            caseDROP                             * 94C2A
            6UNROLL                              * 94C2F
            5ROLL                                * 94C34
            DROPSWAP                             * 94C39
          ;                                      * 94C3E
          4PICKOVER                              * 94C43
          OBJ_37DA0                              * 94C48
          %%1E-14                                * 94C4D
          %%*                                    * 94C52
          8PICK                                  * 94C57
          %%>                                    * 94C5C
          case                                   * 94C61
          ::                                     * 94C66
            4PICK                                * 94C6B
            %%SQR                                * 94C70
            %%SQRT                               * 94C75
            4ROLLOVER                            * 94C7A
            %%/                                  * 94C7F
            7ROLL                                * 94C84
            %%*                                  * 94C89
            6UNROLL                              * 94C8E
            4ROLL                                * 94C93
            OBJ_37D87                            * 94C98
            B%NEG                                * 94C9D
            OVER                                 * 94CA2
            L%/                                  * 94CA7
            3UNROLL                              * 94CAC
            L%/                                  * 94CB1
            OBJ_37D87                            * 94CB6
          ;                                      * 94CBB
          7PICK                                  * 94CC0
          %%/                                    * 94CC5
          4ROLL                                  * 94CCA
          7PICK                                  * 94CCF
          %%/                                    * 94CD4
          2DUP                                   * 94CD9
          %%+                                    * 94CDE
          3PICKOVER                              * 94CE3
          %%*                                    * 94CE8
          1+(rr)                                 * 94CED
          3PICK3PICK                             * 94CF2
          %%*                                    * 94CF7
          %%MAX                                  * 94CFC
          5UNROLL                                * 94D01
          3PICK3PICK                             * 94D06
          %%-                                    * 94D0B
          %%*                                    * 94D10
          DUP                                    * 94D15
          %%+                                    * 94D1A
          1+(rr)                                 * 94D1F
          %%0>=                                  * 94D24
          ITE                                    * 94D29
          ::                                     * 94D2E
            DUP                                  * 94D33
            %%*                                  * 94D38
            SWAPDUP                              * 94D3D
            %%*                                  * 94D42
            OVER                                 * 94D47
            %%+                                  * 94D4C
            1+(rr)                               * 94D51
            OBJ_37B30                            * 94D56
            DUPDUP                               * 94D5B
            %%*                                  * 94D60
            3PICK                                * 94D65
            %%-                                  * 94D6A
            %%ABS                                * 94D6F
            %%SQRT                               * 94D74
            %%+                                  * 94D79
            %%/                                  * 94D7E
            SWAP                                 * 94D83
            7PICK                                * 94D88
            L%/                                  * 94D8D
            %%1                                  * 94D92
            3PICK                                * 94D97
            %%-                                  * 94D9C
            L%/                                  * 94DA1
            5ROLL                                * 94DA6
            7PICK                                * 94DAB
            %%CHS                                * 94DB0
            L%/                                  * 94DB5
            3PICK                                * 94DBA
            L%/                                  * 94DBF
            ROT                                  * 94DC4
          ;                                      * 94DC9
          ::                                     * 94DCE
            SWAPDUP                              * 94DD3
            %%*                                  * 94DD8
            SWAPDUP                              * 94DDD
            %%*                                  * 94DE2
            OVER                                 * 94DE7
            %%+                                  * 94DEC
            %%1                                  * 94DF1
            %%-                                  * 94DF6
            OBJ_37B30                            * 94DFB
            DUPDUP                               * 94E00
            %%*                                  * 94E05
            OVER                                 * 94E0A
            %%0>                                 * 94E0F
            ITE                                  * 94E14
            ::                                   * 94E19
              3PICK                              * 94E1E
              %%+                                * 94E23
              %%SQRT                             * 94E28
              %%+                                * 94E2D
              %%/                                * 94E32
              %%CHS                              * 94E37
            ;                                    * 94E3C
            ::                                   * 94E41
              ROT                                * 94E46
              %%+                                * 94E4B
              %%SQRT                             * 94E50
              %%-                                * 94E55
            ;                                    * 94E5A
            SWAP                                 * 94E5F
            7PICK                                * 94E64
            %%CHS                                * 94E69
            L%/                                  * 94E6E
            OVER                                 * 94E73
            L%/                                  * 94E78
            5ROLL                                * 94E7D
            7PICK                                * 94E82
            %%CHS                                * 94E87
            L%/                                  * 94E8C
            3PICK                                * 94E91
            1+(rr)                               * 94E96
            L%/                                  * 94E9B
            ROT                                  * 94EA0
            1+(rr)                               * 94EA5
          ;                                      * 94EAA
          4ROLL                                  * 94EAF
          %%      4E-28                          * 94EB4
          OBJ_3727E                              * 94ECE
          %%SQRT                                 * 94ED3
          6ROLL                                  * 94ED8
          %%*                                    * 94EDD
          5UNROLL                                * 94EE2
          OVER                                   * 94EE7
          OBJ_37D37                              * 94EEC
          OVER                                   * 94EF1
          OBJ_37D37                              * 94EF6
          %%+                                    * 94EFB
          %%SQRT                                 * 94F00
          DUPUNROT                               * 94F05
          L%/                                    * 94F0A
          3UNROLL                                * 94F0F
          L%/                                    * 94F14
          SWAP                                   * 94F19
        ;                                        * 94F1E

* ROMPTR 0C2 030
* refs (1): 90007
ROMP_0C2_030:
        ::                                       * 94F23
          4PICK                                  * 94F28
          OBJ_372EF                              * 94F2D
          DUP                                    * 94F32
          B%ABS                                  * 94F37
          ROT                                    * 94F3C
          8PICK                                  * 94F41
          2GETLAM                                * 94F46
          #+                                     * 94F4B
          8PICK                                  * 94F50
          DUP#1+                                 * 94F55
          SWAP                                   * 94F5A
          OBJ_7C855                              * 94F5F
          DUP                                    * 94F64
          B%ABS                                  * 94F69
          6PICK                                  * 94F6E
          %%1E-14                                * 94F73
          %%*                                    * 94F78
          5PICK                                  * 94F7D
          OVER                                   * 94F82
          %%<                                    * 94F87
          casedrop                               * 94F8C
          ::                                     * 94F91
            6ROLL                                * 94F96
            %%SQR                                * 94F9B
            %%SQRT                               * 94FA0
            5UNROLL                              * 94FA5
            DROP                                 * 94FAA
            ROTROT2DROP                          * 94FAF
            %%1                                  * 94FB4
            %%0                                  * 94FB9
          ;                                      * 94FBE
          OVER                                   * 94FC3
          %%>                                    * 94FC8
          case2drop                              * 94FCD
          ::                                     * 94FD2
            ROTDROP                              * 94FD7
            %%1                                  * 94FDC
            %%0                                  * 94FE1
            4ROLL                                * 94FE6
            5PICK                                * 94FEB
            OVER                                 * 94FF0
            %%<                                  * 94FF5
            caseDROP                             * 94FFA
            5UNROLL                              * 94FFF
            4ROLL                                * 95004
            DROPSWAP                             * 95009
          ;                                      * 9500E
          4PICKOVER                              * 95013
          OBJ_37DA0                              * 95018
          %%1E-14                                * 9501D
          %%*                                    * 95022
          7PICK                                  * 95027
          %%>                                    * 9502C
          case                                   * 95031
          ::                                     * 95036
            6ROLL                                * 9503B
            DROP                                 * 95040
            4ROLL                                * 95045
            %%SQR                                * 9504A
            %%SQRT                               * 9504F
            DUP                                  * 95054
            6UNROLL                              * 95059
            DUPUNROT                             * 9505E
            L%/                                  * 95063
            4ROLLROT                             * 95068
            L%/                                  * 9506D
          ;                                      * 95072
          6PICK                                  * 95077
          %%/                                    * 9507C
          DUP                                    * 95081
          %%*                                    * 95086
          4ROLL                                  * 9508B
          6PICK                                  * 95090
          %%/                                    * 95095
          DUP                                    * 9509A
          %%*                                    * 9509F
          %%1                                    * 950A4
          3PICK                                  * 950A9
          %%-                                    * 950AE
          SWAP                                   * 950B3
          %%-                                    * 950B8
          OBJ_37B30                              * 950BD
          DUPDUP                                 * 950C2
          %%*                                    * 950C7
          OVER                                   * 950CC
          %%0>                                   * 950D1
          ITE                                    * 950D6
          ::                                     * 950DB
            3PICK                                * 950E0
            %%+                                  * 950E5
            %%SQRT                               * 950EA
            %%+                                  * 950EF
            %%/                                  * 950F4
          ;                                      * 950F9
          ::                                     * 950FE
            ROT                                  * 95103
            %%+                                  * 95108
            %%SQRT                               * 9510D
            SWAP                                 * 95112
            %%-                                  * 95117
          ;                                      * 9511C
          SWAP                                   * 95121
          5PICK                                  * 95126
          %%CHS                                  * 9512B
          L%/                                    * 95130
          OVER                                   * 95135
          L%/                                    * 9513A
          4ROLL                                  * 9513F
          5PICK                                  * 95144
          %%CHS                                  * 95149
          L%/                                    * 9514E
          3PICK                                  * 95153
          1+(rr)                                 * 95158
          L%/                                    * 9515D
          ROT                                    * 95162
          1+(rr)                                 * 95167
          5ROLL                                  * 9516C
          %%*                                    * 95171
          4UNROLL                                * 95176
          OVER                                   * 9517B
          OBJ_37D37                              * 95180
          OVER                                   * 95185
          OBJ_37D37                              * 9518A
          %%+                                    * 9518F
          %%SQRT                                 * 95194
          DUPUNROT                               * 95199
          L%/                                    * 9519E
          3UNROLL                                * 951A3
          L%/                                    * 951A8
          SWAP                                   * 951AD
        ;                                        * 951B2

* ROMPTR 0C2 031
* refs (1): 90007
ROMP_0C2_031:
        ::                                       * 951B7
          DUP                                    * 951BC
          DIMLIMITS                              * 951C1
          OVER                                   * 951C6
          OBJ_7D7F9                              * 951CB
          ITE                                    * 951D0
          %%0                                    * 951D5
          ((0,0))                                * 951DA
          MAKEARRY                               * 951DF
          OBJ_7CDBF                              * 951E4
        ;                                        * 951E9

* ROMPTR 0C2 032
* refs (1): 90007
ROMP_0C2_032:
        ::                                       * 951EE
          DUP                                    * 951F3
          DIMLIMITS                              * 951F8
          OVER                                   * 951FD
          OBJ_7D7F9                              * 95202
          ITE                                    * 95207
          %0_2A2B4                               * 9520C
          C%0                                    * 95211
          MAKEARRY                               * 95216
          SWAP                                   * 9521B
          OBJ_7CDE2                              * 95220
        ;                                        * 95225

* ROMPTR 0C2 033
* refs (1): 90007
ROMP_0C2_033:
        ::                                       * 9522A
          DUP                                    * 9522F
          TWO{}N                                 * 95234
          SWAP                                   * 95239
          MAKEARRY                               * 9523E
          CODE                                   * 95243  91 nibbles
            GOSBVL  SAVPTR                       * 9524D
            C=DAT1  A                            * 95254
            D1=C                                 * 95257
            D1=D1+  10                           * 9525A
            C=DAT1  A                            * 9525D
            D=C     A                            * 95260
            D1=D1+  10                           * 95262
            A=DAT1  A                            * 95265
            D1=D1+  15                           * 95268
            D1=D1+  14                           * 9526B
            B=A     A                            * 9526E
            A=A+1   A                            * 95270
            GOSBVL  SUB_3768C                    * 95272
            LC(5)   DOEREL                       * 95279
            ?D=C    A                            * 95280
            GOYES   L_95287                      * 95283
            A=A+A   A                            * 95285
L_95287:
            C=0     S                            * 95287
            C=C+1   S                            * 9528A
            GONC    L_9529C                      * 9528D
L_95290:
            DAT1=C  S                            * 95290
            CD1EX                                * 95294
            C=C+A   A                            * 95297
            D1=C                                 * 95299
L_9529C:
            B=B-1   A                            * 9529C
            GONC    L_95290                      * 9529E
            GOVLNG  GETPTRLOOP                   * 952A1
          ENDCODE                                * 952A8
        ;                                        * 952A8

* ROMPTR 0C2 034
* refs (1): 90007
ROMP_0C2_034:
        ::                                       * 952AD
          DUP                                    * 952B2
          MDIMS                                  * 952B7
          NOTcasedrop                            * 952BC
          MATABS                                 * 952C1
          ROMPTR  0C2 035                        * 952C6
          ABND                                   * 952D1
          DROP                                   * 952D6
          %%>%                                   * 952DB
        ;                                        * 952E0

* ROMPTR 0C2 035
* refs (1): 90007
ROMP_0C2_035:
        ::                                       * 952E5
          ROMPTR  0C2 04B                        * 952EA
          BINT2                                  * 952F5
          3GETLAM                                * 952FA
          TWO{}N                                 * 952FF
          %%0                                    * 95304
          MAKEARRY                               * 95309
          SWAP                                   * 9530E
          TRUE                                   * 95313
          TRUE                                   * 95318
          ROT                                    * 9531D
          ROMPTR  0C2 031                        * 95322
          SWAPDROP                               * 9532D
          2GETLAM                                * 95332
          1GETLAM                                * 95337
          #<                                     * 9533C
          ITE                                    * 95341
          ROMPTR  0C2 03A                        * 95346
          ROMPTR  0C2 039                        * 95351
          ROMPTR  0C2 03F                        * 9535C
          ROTROT2DROP                            * 95367
          3GETLAM                                * 9536C
          ROMPTR  0C2 001                        * 95371
        ;                                        * 9537C

* ROMPTR 0C2 036
* refs (1): 90007
ROMP_0C2_036:
        ::                                       * 95381
          DUP                                    * 95386
          MDIMS                                  * 9538B
          OBJ_37DE1                              * 95390
          ROMPTR  0C2 035                        * 95395
          OVER                                   * 953A0
          %%0=                                   * 953A5
          case2drop                              * 953AA
          %0_2A2B4                               * 953AF
          SWAP                                   * 953B4
          OBJ_36C52                              * 953B9
          %%*                                    * 953BE
          BINT0                                  * 953C3
          ROT                                    * 953C8
          3GETLAM                                * 953CD
          ABND                                   * 953D2
          #1+_ONE_DO                             * 953D7
          INDEX@                                 * 953DC
          OBJ_372EF                              * 953E1
          %%ABS                                  * 953E6
          4PICK                                  * 953EB
          %%<=                                   * 953F0
          ?SKIP                                  * 953F5
          SWAP#1+SWAP                            * 953FA
          NextInArray                            * 953FF
          DROPSWAPDROP                           * 95404
          UNCOERCE                               * 95409
        ;                                        * 9540E

* ROMPTR 0C2 037
* refs (1): 90007
ROMP_0C2_037:
        ::                                       * 95413
          DUP                                    * 95418
          MDIMS                                  * 9541D
          OBJ_37DE1                              * 95422
          ROMPTR  0C2 04B                        * 95427
          BINT2                                  * 95432
          3GETLAM                                * 95437
          TWO{}N                                 * 9543C
          %%0                                    * 95441
          MAKEARRY                               * 95446
          SWAP                                   * 9544B
          TRUE                                   * 95450
          TRUE                                   * 95455
          ROT                                    * 9545A
          ROMPTR  0C2 031                        * 9545F
          SWAPDROP                               * 9546A
          2GETLAM                                * 9546F
          1GETLAM                                * 95474
          #<                                     * 95479
          ITE                                    * 9547E
          ROMPTR  0C2 03A                        * 95483
          ROMPTR  0C2 039                        * 9548E
          ROMPTR  0C2 03F                        * 95499
          ROMPTR  0C2 04A                        * 954A4
          ROTROT2DROP                            * 954AF
          3GETLAM                                * 954B4
          ABND                                   * 954B9
          BINT1                                  * 954BE
          {}N                                    * 954C3
          OVER                                   * 954C8
          OBJ_7D7F9                              * 954CD
          ITE                                    * 954D2
          %0_2A2B4                               * 954D7
          C%0                                    * 954DC
          MAKEARRY                               * 954E1
          SWAP                                   * 954E6
          OBJ_7CDE2                              * 954EB
        ;                                        * 954F0

* ROMPTR 0C2 038
* refs (1): 90007
ROMP_0C2_038:
        ::                                       * 954F5
          DUP                                    * 954FA
          MDIMS                                  * 954FF
          OBJ_37DE1                              * 95504
          ROMPTR  0C2 04B                        * 95509
          BINT2                                  * 95514
          3GETLAM                                * 95519
          TWO{}N                                 * 9551E
          %%0                                    * 95523
          MAKEARRY                               * 95528
          SWAP                                   * 9552D
          ((0,0))                                * 95532
          1GETLAM                                * 95537
          ROMPTR  0C2 033                        * 9553C
          SWAP                                   * 95547
          ((0,0))                                * 9554C
          2GETLAM                                * 95551
          ROMPTR  0C2 033                        * 95556
          SWAP                                   * 95561
          ROMPTR  0C2 031                        * 95566
          SWAPDROP                               * 95571
          2GETLAM                                * 95576
          1GETLAM                                * 9557B
          #<                                     * 95580
          ITE                                    * 95585
          ROMPTR  0C2 03A                        * 9558A
          ROMPTR  0C2 039                        * 95595
          ROMPTR  0C2 03F                        * 955A0
          ROMPTR  0C2 04A                        * 955AB
          3GETLAM                                * 955B6
          ABND                                   * 955BB
          BINT1                                  * 955C0
          {}N                                    * 955C5
          OVER                                   * 955CA
          OBJ_7D7F9                              * 955CF
          ITE                                    * 955D4
          %0_2A2B4                               * 955D9
          C%0                                    * 955DE
          MAKEARRY                               * 955E3
          SWAP                                   * 955E8
          OBJ_7CDE2                              * 955ED
          3UNROLL                                * 955F2
          ROMPTR  0C2 032                        * 955F7
          3UNROLL                                * 95602
          ROMPTR  0C2 032                        * 95607
          SWAP                                   * 95612
        ;                                        * 95617

* ROMPTR 0C2 039
* refs (1): 90007
ROMP_0C2_039:
        ::                                       * 9561C
          ONEONE                                 * 95621
          ROT                                    * 95626
          BEGIN                                  * 9562B
          2GETLAM                                * 95630
          4PICK                                  * 95635
          #-SWAP                                 * 9563A
          4GETLAM                                * 9563F
          EVAL                                   * 95644
          7PICK                                  * 95649
          5ROLL                                  * 9564E
          5PICK                                  * 95653
          OBJ_37361                              * 95658
          DROP                                   * 9565D
          3PICK                                  * 95662
          1GETLAM                                * 95667
          #<                                     * 9566C
          WHILE                                  * 95671
          ::                                     * 95676
            SWAP#1+                              * 9567B
            1GETLAM                              * 95680
            4PICK                                * 95685
            OBJ_36FC4                            * 9568A
            ROT                                  * 9568F
            6GETLAM                              * 95694
            EVAL                                 * 95699
            7PICK                                * 9569E
            5ROLL                                * 956A3
            5PICK                                * 956A8
            3GETLAM                              * 956AD
            #+                                   * 956B2
            OBJ_37361                            * 956B7
            DROP                                 * 956BC
            ROT#1+                               * 956C1
            ROT                                  * 956C6
            1GETLAM                              * 956CB
            #+                                   * 956D0
            ROT                                  * 956D5
            OBJ_357F0                            * 956DA
          ;                                      * 956DF
          REPEAT                                 * 956E4
          3DROP                                  * 956E9
          ROT                                    * 956EE
        ;                                        * 956F3

* ROMPTR 0C2 03A
* refs (1): 90007
ROMP_0C2_03A:
        ::                                       * 956F8
          ONEONE                                 * 956FD
          ROT                                    * 95702
          BEGIN                                  * 95707
          1GETLAM                                * 9570C
          4PICK                                  * 95711
          #-SWAP                                 * 95716
          6GETLAM                                * 9571B
          EVAL                                   * 95720
          7PICK                                  * 95725
          5ROLL                                  * 9572A
          5PICK                                  * 9572F
          OBJ_37361                              * 95734
          DROP                                   * 95739
          3PICK                                  * 9573E
          2GETLAM                                * 95743
          #<                                     * 95748
          WHILE                                  * 9574D
          ::                                     * 95752
            1GETLAM                              * 95757
            ROT#+                                * 9575C
            2GETLAM                              * 95761
            4PICK                                * 95766
            OBJ_36FC4                            * 9576B
            ROT                                  * 95770
            4GETLAM                              * 95775
            EVAL                                 * 9577A
            7PICK                                * 9577F
            5ROLL                                * 95784
            5PICK                                * 95789
            3GETLAM                              * 9578E
            #+                                   * 95793
            OBJ_37361                            * 95798
            DROP                                 * 9579D
            ROT#1+UNROT                          * 957A2
            SWAP#1+SWAP                          * 957A7
            OBJ_357F0                            * 957AC
          ;                                      * 957B1
          REPEAT                                 * 957B6
          3DROP                                  * 957BB
          ROT                                    * 957C0
          3GETLAM                                * 957C5
          DUP#1=                                 * 957CA
          caseDROP                               * 957CF
          ONE_DO                                 * 957D4
          INDEX@                                 * 957D9
          3GETLAM                                * 957DE
          #+                                     * 957E3
          OBJ_372EF                              * 957E8
          SWAP                                   * 957ED
          INDEX@                                 * 957F2
          OBJ_372EF                              * 957F7
          ROT                                    * 957FC
          9GETLAM                                * 95801
          EVAL                                   * 95806
          4ROLLSWAP                              * 9580B
          INDEX@                                 * 95810
          OBJ_37361                              * 95815
          INDEX@                                 * 9581A
          #1+                                    * 9581F
          OBJ_372EF                              * 95824
          3PICKOVER                              * 95829
          %%*                                    * 9582E
          ROTSWAP                                * 95833
          INDEX@                                 * 95838
          3GETLAM                                * 9583D
          #+                                     * 95842
          OBJ_37361                              * 95847
          SWAP                                   * 9584C
          4PICK                                  * 95851
          %%*                                    * 95856
          INDEX@                                 * 9585B
          #1+                                    * 95860
          OBJ_37361                              * 95865
          3UNROLL                                * 9586A
          4PICK                                  * 9586F
          3UNROLL                                * 95874
          INDEX@                                 * 95879
          2GETLAM                                * 9587E
          10GETLAM                               * 95883
          EVAL                                   * 95888
          NextInArray                            * 9588D
        ;                                        * 95892

* ROMPTR 0C2 03B
* refs (1): 90007
ROMP_0C2_03B:
        ::                                       * 95897
          3PICK                                  * 9589C
          1GETLAM                                * 958A1
          #+DUP                                  * 958A6
          4PICK                                  * 958AB
          OBJ_7CA98                              * 958B0
          OBJ_37D69                              * 958B5
          SWAP                                   * 958BA
          4PICK                                  * 958BF
          OBJ_372EF                              * 958C4
          DUP                                    * 958C9
          dup;cc?                                * 958CE
          5PICK                                  * 958D3
          %%0=                                   * 958D8
          ANDcase                                * 958DD
          ::                                     * 958E2
            7UNROLL                              * 958E7
            DROP                                 * 958EC
            ROTROT2DROP                          * 958F1
          ;                                      * 958F6
          OVER                                   * 958FB
          OBJ_37D37                              * 95900
          5ROLL                                  * 95905
          %%+                                    * 9590A
          %%SQRT                                 * 9590F
          4UNROLL                                * 95914
          OBJ_36C07                              * 95919
          3PICK                                  * 9591E
          L%-                                    * 95923
          DUPUNROT                               * 95928
          6PICK                                  * 9592D
          OBJ_37361                              * 95932
          UNROTOVER                              * 95937
          7UNROLL                                * 9593C
          L%*                                    * 95941
          ROT#1+UNROT                            * 95946
          5PICK                                  * 9594B
          1GETLAM                                * 95950
          #=                                     * 95955
          ITE                                    * 9595A
          SWAP                                   * 9595F
          ::                                     * 95964
            5GETLAM                              * 95969
            EVAL                                 * 9596E
          ;                                      * 95973
          7PICK                                  * 95978
          case                                   * 9597D
          ROTROT2DROP                            * 95982
          SWAP                                   * 95987
          OBJ_37D87                              * 9598C
          SWAP                                   * 95991
          7PICK                                  * 95996
          SWAP                                   * 9599B
          2GETLAM                                * 959A0
          5PICK                                  * 959A5
          #1--                                   * 959AA
          2GETLAM                                * 959AF
          ZERO_DO                                * 959B4
          3UNROLL                                * 959B9
          3PICK                                  * 959BE
          7PICK                                  * 959C3
          7PICK                                  * 959C8
          OBJ_7C861                              * 959CD
          5PICK                                  * 959D2
          L%/                                    * 959D7
          3UNROLL                                * 959DC
          7PICK                                  * 959E1
          5PICK                                  * 959E6
          8PICK                                  * 959EB
          ZERO_DO                                * 959F0
          ROT                                    * 959F5
          3PICK                                  * 959FA
          OBJ_372EF                              * 959FF
          OBJ_37D87                              * 95A04
          6PICK                                  * 95A09
          L%*                                    * 95A0E
          5ROLL                                  * 95A13
          4PICK                                  * 95A18
          OBJ_372EF                              * 95A1D
          ROT                                    * 95A22
          L%+                                    * 95A27
          4PICK                                  * 95A2C
          OBJ_37361                              * 95A31
          SWAP4ROLL                              * 95A36
          1GETLAM                                * 95A3B
          #+                                     * 95A40
          4ROLL                                  * 95A45
          #1+                                    * 95A4A
          NextInArray                            * 95A4F
          2DROP                                  * 95A54
          2SWAP                                  * 95A59
          DROP                                   * 95A5E
          2GETLAM                                * 95A63
          #+                                     * 95A68
          LOOP                                   * 95A6D
          DROPSWAPDROP                           * 95A72
          ROTROT2DROP                            * 95A77
        ;                                        * 95A7C

* ROMPTR 0C2 03C
* refs (1): 90007
ROMP_0C2_03C:
        ::                                       * 95A81
          3PICK                                  * 95A86
          #1+DUP                                 * 95A8B
          4PICK                                  * 95A90
          OBJ_7CC7F                              * 95A95
          OBJ_37D69                              * 95A9A
          SWAP                                   * 95A9F
          4PICK                                  * 95AA4
          OBJ_372EF                              * 95AA9
          DUP                                    * 95AAE
          dup;cc?                                * 95AB3
          5PICK                                  * 95AB8
          %%0=                                   * 95ABD
          ANDcase                                * 95AC2
          ::                                     * 95AC7
            7UNROLL                              * 95ACC
            DROP                                 * 95AD1
            ROTROT2DROP                          * 95AD6
          ;                                      * 95ADB
          OVER                                   * 95AE0
          OBJ_37D37                              * 95AE5
          5ROLL                                  * 95AEA
          %%+                                    * 95AEF
          %%SQRT                                 * 95AF4
          4UNROLL                                * 95AF9
          OBJ_36C07                              * 95AFE
          3PICK                                  * 95B03
          L%-                                    * 95B08
          DUPUNROT                               * 95B0D
          6PICK                                  * 95B12
          OBJ_37361                              * 95B17
          UNROTOVER                              * 95B1C
          7UNROLL                                * 95B21
          L%*                                    * 95B26
          ROT#1+UNROT                            * 95B2B
          5PICK                                  * 95B30
          2GETLAM                                * 95B35
          #=                                     * 95B3A
          ITE                                    * 95B3F
          SWAP                                   * 95B44
          ::                                     * 95B49
            7GETLAM                              * 95B4E
            EVAL                                 * 95B53
          ;                                      * 95B58
          8PICK                                  * 95B5D
          case                                   * 95B62
          ROTROT2DROP                            * 95B67
          SWAP                                   * 95B6C
          OBJ_37D87                              * 95B71
          SWAP                                   * 95B76
          8PICK                                  * 95B7B
          1GETLAM                                * 95B80
          5PICK                                  * 95B85
          #-                                     * 95B8A
          1GETLAM                                * 95B8F
          #*                                     * 95B94
          #1+                                    * 95B99
          1GETLAM                                * 95B9E
          ZERO_DO                                * 95BA3
          3UNROLL                                * 95BA8
          6PICK                                  * 95BAD
          4PICK                                  * 95BB2
          7PICK                                  * 95BB7
          OBJ_7C861                              * 95BBC
          5PICK                                  * 95BC1
          L%/                                    * 95BC6
          SWAPROT                                * 95BCB
          7PICK                                  * 95BD0
          5PICK                                  * 95BD5
          8PICK                                  * 95BDA
          ZERO_DO                                * 95BDF
          ROT                                    * 95BE4
          3PICK                                  * 95BE9
          OBJ_372EF                              * 95BEE
          OBJ_37D87                              * 95BF3
          6PICK                                  * 95BF8
          L%*                                    * 95BFD
          5ROLL                                  * 95C02
          4PICK                                  * 95C07
          OBJ_372EF                              * 95C0C
          ROT                                    * 95C11
          L%+                                    * 95C16
          4PICK                                  * 95C1B
          OBJ_37361                              * 95C20
          SWAP4ROLL                              * 95C25
          #1+                                    * 95C2A
          4ROLL                                  * 95C2F
          1GETLAM                                * 95C34
          #+                                     * 95C39
          NextInArray                            * 95C3E
          2DROP                                  * 95C43
          SWAP                                   * 95C48
          2SWAP                                  * 95C4D
          DROP                                   * 95C52
          #1+                                    * 95C57
          LOOP                                   * 95C5C
          2DROP                                  * 95C61
          ROTROT2DROP                            * 95C66
        ;                                        * 95C6B

* ROMPTR 0C2 03D
* refs (1): 90007
ROMP_0C2_03D:
        ::                                       * 95C70
          4PICK                                  * 95C75
          ROT                                    * 95C7A
          2GETLAM                                * 95C7F
          7PICK                                  * 95C84
          DO                                     * 95C89
          SWAP                                   * 95C8E
          1GETLAM                                * 95C93
          #+SWAP                                 * 95C98
          5PICK                                  * 95C9D
          3PICK                                  * 95CA2
          6PICK                                  * 95CA7
          OBJ_7CC7F                              * 95CAC
          4PICK                                  * 95CB1
          L%/                                    * 95CB6
          SWAP                                   * 95CBB
          6PICK                                  * 95CC0
          4PICK                                  * 95CC5
          7PICK                                  * 95CCA
          ZERO_DO                                * 95CCF
          ROT                                    * 95CD4
          3PICK                                  * 95CD9
          OBJ_372EF                              * 95CDE
          5PICK                                  * 95CE3
          L%*                                    * 95CE8
          SWAP3PICK                              * 95CED
          OBJ_372EF                              * 95CF2
          ROT                                    * 95CF7
          L%+                                    * 95CFC
          3PICK                                  * 95D01
          OBJ_37361                              * 95D06
          ROT#1+                                 * 95D0B
          ROT#1+                                 * 95D10
          NextInArray                            * 95D15
          2DROP                                  * 95D1A
          SWAPDROP                               * 95D1F
          LOOP                                   * 95D24
          SWAPDROP                               * 95D29
        ;                                        * 95D2E

* ROMPTR 0C2 03E
* refs (1): 90007
ROMP_0C2_03E:
        ::                                       * 95D33
          OVER                                   * 95D38
          %%0=                                   * 95D3D
          case                                   * 95D42
          ::                                     * 95D47
            %%1                                  * 95D4C
            3UNROLL                              * 95D51
            4dropn;IU!                           * 95D56
            ?SEMI                                * 95D5B
            ROTSWAP                              * 95D60
          ;                                      * 95D65
          OVER                                   * 95D6A
          %%ABS                                  * 95D6F
          OVER                                   * 95D74
          %%ABS                                  * 95D79
          %%>                                    * 95D7E
          3UNROLL                                * 95D83
          3PICK                                  * 95D88
          ?SKIP                                  * 95D8D
          SWAP                                   * 95D92
          OVER                                   * 95D97
          %%/                                    * 95D9C
          DUPDUP                                 * 95DA1
          %%*                                    * 95DA6
          1+(rr)                                 * 95DAB
          %%SQRT                                 * 95DB0
          DUP                                    * 95DB5
          %%1/                                   * 95DBA
          ROTOVER                                * 95DBF
          %%*                                    * 95DC4
          2SWAP                                  * 95DC9
          %%*                                    * 95DCE
          4ROLL                                  * 95DD3
          ?SKIP                                  * 95DD8
          ROTSWAP                                * 95DDD
        ;                                        * 95DE2

* ROMPTR 0C2 03F
* refs (1): 90007
ROMP_0C2_03F:
        ::                                       * 95DE7
          3GETLAM                                * 95DEC
          #1=                                    * 95DF1
          ?SEMI                                  * 95DF6
          RESOROMP                               * 95DFB
          ROMPTR  0C2 040                        * 95E00
          12PUTLAM                               * 95E0B
          RESOROMP                               * 95E10
          ROMPTR  0C2 041                        * 95E15
          13PUTLAM                               * 95E20
          RESOROMP                               * 95E25
          ROMPTR  0C2 042                        * 95E2A
          14PUTLAM                               * 95E35
          RESOROMP                               * 95E3A
          ROMPTR  0C2 043                        * 95E3F
          15PUTLAM                               * 95E4A
          RESOROMP                               * 95E4F
          ROMPTR  0C2 046                        * 95E54
          16PUTLAM                               * 95E5F
          RESOROMP                               * 95E64
          ROMPTR  0C2 047                        * 95E69
          17PUTLAM                               * 95E74
          RESOROMP                               * 95E79
          ROMPTR  0C2 044                        * 95E7E
          18PUTLAM                               * 95E89
          RESOROMP                               * 95E8E
          ROMPTR  0C2 045                        * 95E93
          19PUTLAM                               * 95E9E
          BINT1                                  * 95EA3
          OBJ_372EF                              * 95EA8
          %%ABS                                  * 95EAD
          DUP                                    * 95EB2
          3GETLAM                                * 95EB7
          ONE_DO                                 * 95EBC
          4dropn;IU!                             * 95EC1
          ?SKIP                                  * 95EC6
          ::                                     * 95ECB
            ROT                                  * 95ED0
            INDEX@                               * 95ED5
            3GETLAM                              * 95EDA
            #+                                   * 95EDF
            OBJ_372EF                            * 95EE4
            %%ABS                                * 95EE9
            SWAPINDEX@                           * 95EEE
            #1+                                  * 95EF3
            OBJ_372EF                            * 95EF8
            %%ABS                                * 95EFD
            ROT                                  * 95F02
            4ROLL                                * 95F07
            DUPUNROT                             * 95F0C
            %%+                                  * 95F11
            %%/                                  * 95F16
            %%*                                  * 95F1B
            ROTOVER                              * 95F20
            OBJ_37DA0                            * 95F25
            SWAP                                 * 95F2A
          ;                                      * 95F2F
          NextInArray                            * 95F34
          DROP                                   * 95F39
          %%3E-13                                * 95F3E
          %%*                                    * 95F43
          3GETLAM                                * 95F48
          UNCOERCE                               * 95F4D
          %>%%SQRT                               * 95F52
          %%/                                    * 95F57
          4PUTLAM                                * 95F5C
          BINT0                                  * 95F61
          5PUTLAM                                * 95F66
          #       FFFFF                          * 95F6B  1048575
          6PUTLAM                                * 95F75
          TRUE                                   * 95F7A
          7PUTLAM                                * 95F7F
          %%0                                    * 95F84
          8PUTLAM                                * 95F89
          3GETLAM                                * 95F8E
          BEGIN                                  * 95F93
          DUPUNROT                               * 95F98
          OBJ_372EF                              * 95F9D
          %%ABS                                  * 95FA2
          3PICK                                  * 95FA7
          #1-                                    * 95FAC
          ::                                     * 95FB1
            BEGIN                                * 95FB6
            OBJ_357F0                            * 95FBB
            ROTOVER                              * 95FC0
            OBJ_372EF                            * 95FC5
            %%ABS                                * 95FCA
            SWAP3PICK                            * 95FCF
            3GETLAM                              * 95FD4
            #+                                   * 95FD9
            OBJ_372EF                            * 95FDE
            %%ABS                                * 95FE3
            DUPUNROT                             * 95FE8
            4GETLAM                              * 95FED
            %%<=                                 * 95FF2
            case                                 * 95FF7
            ::                                   * 95FFC
              RDROP                              * 96001
              SWAP                               * 96006
              %%0=                               * 9600B
              ?SKIP                              * 96010
              ::                                 * 96015
                %%0                              * 9601A
                4PICK                            * 9601F
                3GETLAM                          * 96024
                #+                               * 96029
                OBJ_37361                        * 9602E
              ;                                  * 96033
              5UNROLL                            * 96038
              DROPSWAP                           * 9603D
              8PUTLAM                            * 96042
            ;                                    * 96047
            3UNROLL                              * 9604C
            %%MAX                                * 96051
            4ROLL                                * 96056
            %%MAX                                * 9605B
            ROT                                  * 96060
            #1-                                  * 96065
            DUP#0=                               * 9606A
            UNTIL                                * 9606F
            SWAP                                 * 96074
            8PUTLAM                              * 96079
            ROTSWAP                              * 9607E
          ;                                      * 96083
          ::                                     * 96088
            2DUP                                 * 9608D
            #1+                                  * 96092
            #=case                               * 96097
            SWAPDROP                             * 9609C
            #1+                                  * 960A1
            2DUP                                 * 960A6
            #1+                                  * 960AB
            #=case                               * 960B0
            ::                                   * 960B5
              12GETLAM                           * 960BA
              EVAL                               * 960BF
            ;                                    * 960C4
            OVER                                 * 960C9
            6GETLAM                              * 960CE
            #<                                   * 960D3
            OVER                                 * 960D8
            5GETLAM                              * 960DD
            #>                                   * 960E2
            OR                                   * 960E7
            IT                                   * 960EC
            ::                                   * 960F1
              ROT                                * 960F6
              3PICK                              * 960FB
              OBJ_372EF                          * 96100
              %%ABS                              * 96105
              SWAP3PICK                          * 9610A
              OBJ_372EF                          * 9610F
              %%ABS                              * 96114
              ROT                                * 96119
              %%>=                               * 9611E
              7PUTLAM                            * 96123
              3UNROLL                            * 96128
            ;                                    * 9612D
            7GETLAM                              * 96132
            ITE                                  * 96137
            13GETLAM                             * 9613C
            14GETLAM                             * 96141
            EVAL                                 * 96146
            caseDROP                             * 9614B
            SWAP                                 * 96150
            6PUTLAM                              * 96155
            SWAP                                 * 9615A
            5PUTLAM                              * 9615F
            15GETLAM                             * 96164
            EVAL                                 * 96169
            4dropn;IU!                           * 9616E
            ITE                                  * 96173
            ::                                   * 96178
              DROP                               * 9617D
              7GETLAM                            * 96182
              ITE                                * 96187
              16GETLAM                           * 9618C
              17GETLAM                           * 96191
              EVAL                               * 96196
              6ROLL                              * 9619B
              3PICK                              * 961A0
              OBJ_372EF                          * 961A5
              7ROLL                              * 961AA
              %%*                                * 961AF
              DUPUNROT                           * 961B4
              7ROLL                              * 961B9
              %%*                                * 961BE
              5ROLL                              * 961C3
              OBJ_37361                          * 961C8
              SWAP4ROLL                          * 961CD
              %%*                                * 961D2
              DUPUNROT                           * 961D7
              4PICK                              * 961DC
              OBJ_37361                          * 961E1
              3UNROLL                            * 961E6
            ;                                    * 961EB
            ::                                   * 961F0
              7GETLAM                            * 961F5
              ITE                                * 961FA
              18GETLAM                           * 961FF
              19GETLAM                           * 96204
              EVAL                               * 96209
            ;                                    * 9620E
            %%ABS                                * 96213
            4GETLAM                              * 96218
            %%>                                  * 9621D
            ITE                                  * 96222
            DROP                                 * 96227
            ::                                   * 9622C
              %%0                                * 96231
              SWAP                               * 96236
              OBJ_37361                          * 9623B
            ;                                    * 96240
            5GETLAM                              * 96245
          ;                                      * 9624A
          DUPTWO                                 * 9624F
          #<                                     * 96254
          UNTIL                                  * 96259
          DROP                                   * 9625E
        ;                                        * 96263
