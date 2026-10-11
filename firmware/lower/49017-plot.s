* HP 48GX ROM revision R, #49017-#4C081: Plotting
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PUTPTYPE GETPTYPE RESETDEPTH CHECKPVARS GETPMIN&MAX pmin(c) pmax(c) RclDepnd GetEqN rceq! depnd(gn) ICMPDRPRTDRP
* Follows on from the previous file (at #49017 in the original ROM).
        RPL

* refs (2): 48DB5 48DD3
OBJ_49017:
        ::                                       * 49017
          'NOP                                   * 4901C
          ZEROZERO                               * 49021
          ZEROZERO                               * 49026
          rceq!                                  * 4902B
          OBJ_47858                              * 49030
          IT                                     * 49035
          GETRHS                                 * 4903A
          GETINDEP                               * 4903F
          DUPTYPELIST?                           * 49044
          ITE                                    * 49049
          ::                                     * 4904E
            INCOMPDROP                           * 49053
            %MAXorder                            * 49058
            SWAP                                 * 4905D
          ;                                      * 49062
          ::                                     * 49067
            GETPTYPE                             * 4906C
            'IDPOLAR                             * 49071
            jEQcase                              * 49076
            ::                                   * 4907B
              %0_2A2B4                           * 49080
              1REV                               * 49085
            ;                                    * 4908A
            GETXMIN                              * 4908F
            GETXMAX                              * 49094
            GETPTYPE                             * 49099
            'IDPARAMETER                         * 4909E
            EQ                                   * 490A3
            NOT?SEMI                             * 490A8
            2DUP                                 * 490AD
            TWO{}N                               * 490B2
            PUTINDEPLIST                         * 490B7
          ;                                      * 490BC
          SWAPDUP                                * 490C1
          TOTEMPOB                               * 490C6
          4PICK                                  * 490CB
          dup;RclInVars(gn)?                     * 490D0
          IT                                     * 490D5
          ::                                     * 490DA
            GETPTYPE                             * 490DF
            'IDFUNCTION                          * 490E4
            EQ                                   * 490E9
            NOTcaseDROP                          * 490EE
            KeepUnit                             * 490F3
          ;                                      * 490F8
          OVERSWAP                               * 490FD
          XEQSTOID                               * 49102
          3UNROLL                                * 49107
          %-                                     * 4910C

%4E1:
          %       4E1                            * 49111
          %/                                     * 49126
          SWAPDUP                                * 4912B
          KeepUnit                               * 49130
          DROP                                   * 49135
          SWAP                                   * 4913A
          EVAL                                   * 4913F
          SWAP                                   * 49144
          8NULLLAM{}                             * 49149
          BIND                                   * 4914E
        ;                                        * 49153

* refs (3): 6B961 73968 739A4
OBJ_49158:
        ::                                       * 49158
          BINT27                                 * 4915D
          GETLAM                                 * 49162
        ;                                        * 49167
        NIBHEX  00000                            * 4916C  ..

* refs (1): 15415
OBJ_49171:
        #       60E                              * 49171  1550

        #       60F                              * 4917B  1551

        #       610                              * 49185  1552

* refs (1): 15608
OBJ_4918F:
        #       611                              * 4918F  1553

        #       612                              * 49199  1554

        #       613                              * 491A3  1555

        #       614                              * 491AD  1556

        #       615                              * 491B7  1557

        #       616                              * 491C1  1558

        #       617                              * 491CB  1559

* ->
* refs (4): 1E1B5 20147 48152 B6399
AUTOSCALE:
        ::                                       * 491D5
          OBJ_48D92                              * 491DA
        ;                                        * 491DF

* refs (2): 48DBA 48DE7
OBJ_491E4:
        ::                                       * 491E4
          BINT41                                 * 491E9
          ZERO_DO                                * 491EE
          3GETLAM                                * 491F3
          ::                                     * 491F8
            OBJ_495D3                            * 491FD
            8GETLAM                              * 49202
            EVAL                                 * 49207
            4GETLAM                              * 4920C
            5GETLAM                              * 49211
            ROT                                  * 49216
            OBJ_494EC                            * 4921B
            5PUTLAM                              * 49220
            4PUTLAM                              * 49225
          ;                                      * 4922A
          2GETLAM                                * 4922F
          DUP                                    * 49234
          1GETLAM                                * 49239
          'EvalNoCK:_sup                         * 4923E
          x+                                     * 49243
          U>nbr                                  * 49248
          OVER                                   * 4924D
          TYPEEXT?                               * 49252
          ITE                                    * 49257
          OBJ_4C0D4                              * 4925C
          NEWINDEP                               * 49261
          LOOP                                   * 49266
          6GETLAM                                * 4926B
          7GETLAM                                * 49270
          4GETLAM                                * 49275
          5GETLAM                                * 4927A
          ABND                                   * 4927F
          DUP                                    * 49284
          TYPEBINT?                              * 49289
          case2DROP                              * 4928E

* refs (2): 48E7D 48F40
OBJ_49293:
          ::                                     * 49293
            OBJ_49478                            * 49298
            OBJ_49587                            * 4929D
          ;                                      * 492A2
        ;                                        * 492A7

* refs (1): 20A82
OBJ_492AC:
        ::                                       * 492AC
          CK0NOLASTWD                            * 492B1
          RECLAIMDISP                            * 492B6
          OBJ_49417                              * 492BB
          OBJ_493ED                              * 492C0
          OBJ_493B9                              * 492C5
          OBJ_49385                              * 492CA
          OBJ_49351                              * 492CF
          OBJ_49329                              * 492D4
          OBJ_49301                              * 492D9
          BINT8                                  * 492DE
          ONE_DO                                 * 492E3
          INDEX@                                 * 492E8
          DISPN                                  * 492ED
          LOOP                                   * 492F2
          SetDAsTemp                             * 492F7
        ;                                        * 492FC

* refs (1): 492D9
OBJ_49301:
        $       "            M G"                * 49301

* refs (1): 492D4
OBJ_49329:
        $       "      P   DIANA"                * 49329

* refs (1): 492CF
OBJ_49351:
        $       "    CHARLIE X B     D"          * 49351

* refs (1): 492CA
OBJ_49385:
        $       " BILL U   N  TED    A"          * 49385

* refs (1): 492C5
OBJ_493B9:
        $       " O  A L   N    ALCUIN"          * 493B9

* refs (1): 492C0
OBJ_493ED:
        $       " B  I    JIM   V"               * 493ED

* refs (1): 492BB
OBJ_49417:
        $       "  RON     S    E"               * 49417

* refs (1): 48887
OBJ_49441:
        ::                                       * 49441
          BINT24                                 * 49446
          GETLAM                                 * 4944B
          TRUE                                   * 49450
        ;                                        * 49455

* refs (1): 47989
OBJ_4945A:
        ::                                       * 4945A
          TOADISP                                * 4945F
          BlankDA1                               * 49464
        ;                                        * 49469
        BSS     10                               * 4946E

* refs (4): 48DFB 48E69 48EAF 49298
OBJ_49478:
        ::                                       * 49478
          2DUP                                   * 4947D
          %=                                     * 49482
          IT                                     * 49487
          ::                                     * 4948C
            DUP%0=                               * 49491
            case2drop                            * 49496

1;-1:
            ::                                   * 4949B
              %1                                 * 494A0
              %-1                                * 494A5
            ;                                    * 494AA
            DUP                                  * 494AF

* .1
* refs (2): C09E5 C0AFA
%.1:
            %       1E-1                         * 494B4
            %*                                   * 494C9
            ROTOVER                              * 494CE
            %-                                   * 494D3
            3UNROLL                              * 494D8
            %+                                   * 494DD
          ;                                      * 494E2
        ;                                        * 494E7

* refs (2): 48FA4 4921B
OBJ_494EC:
        ::                                       * 494EC
          DUPTYPEREAL?                           * 494F1
          NOTcaseDROP                            * 494F6
          %MAXREAL                               * 494FB
          OVER                                   * 49500
          %ABS                                   * 49505
          %=                                     * 4950A
          caseDROP                               * 4950F
          OVERDUP                                * 49514
          TYPEBINT?                              * 49519
          case                                   * 4951E

drop(1,3-4);dup:
          ::                                     * 49523
            DROPSWAPDROP                         * 49528
            SWAPDROPDUP                          * 4952D
          ;                                      * 49532
          OVER                                   * 49537
          %<                                     * 4953C
          case                                   * 49541
          SWAPDROP                               * 49546
          3PICKOVER                              * 4954B
          %>                                     * 49550
          ITE                                    * 49555
          ROTDROPSWAP                            * 4955A
          DROP                                   * 4955F
        ;                                        * 49564

* refs (4): 48E64 48E78 48EAA 48EF5
MinMaxCol(ra,s):
        ::                                       * 49569
          SWAP2DUP                               * 4956E
          ColumnMIN                              * 49573
          3UNROLL                                * 49578
          ColumnMAX                              * 4957D
        ;                                        * 49582

* refs (2): 48EC3 4929D
OBJ_49587:
        ::                                       * 49587
          %MAXorder                              * 4958C
          SWAP                                   * 49591
          2DUP                                   * 49596
          yrng(2r)                               * 4959B
          OVER                                   * 495A0
          %-                                     * 495A5

* .15
* refs (1): 2E0CC
%.15:
          %       1.5E-1                         * 495AA
          %*                                     * 495BF
          %-                                     * 495C4
          PUTYMIN                                * 495C9
        ;                                        * 495CE

* refs (1): 491FD
OBJ_495D3:
        ::                                       * 495D3
          ERRSET                                 * 495D8
          EVALCRUNCH                             * 495DD
          ERRTRAP                                * 495E2
          ::                                     * 495E7
            ERROR@                               * 495EC
            #       100                          * 495F1  256
            #/                                   * 495FB
            SWAPDROP                             * 49600
            BINT3                                * 49605
            #<>case                              * 4960A
            ERRJMP                               * 4960F
            ERRORCLR                             * 49614
            2RDROP                               * 49619
          ;                                      * 4961E
          CK1NoBlame                             * 49623
          U>nbr                                  * 49628
          2GETLAM                                * 4962D
          OVER                                   * 49632
          EQIT                                   * 49637
          TOTEMPOB                               * 4963C
        ;                                        * 49641

->StackStr22!+:
        ::                                       * 49646
          ->StkStr22!                            * 4964B
          !append$                               * 49650
        ;                                        * 49655

* refs (1): 47FD6
OBJ_4965A:
        ::                                       * 4965A
          CHECKMENU                              * 4965F
          OBJ_496A0                              * 49664
          NOTcase                                * 49669
          DoBadKey                               * 4966E
          4UNROLL3DROP                           * 49673
          OBJ_4EEBF                              * 49678
          DUPNULL{}?                             * 4967D
          casedrop                               * 49682
          DoBadKey                               * 49687
          'IDPAR                                 * 4968C
          STOAPPLDATA                            * 49691
          OBJ_4DAA3                              * 49696
        ;                                        * 4969B

* refs (5): 47B3C 49664 4EEC4 B6295 B6326
OBJ_496A0:
        ::                                       * 496A0
          '                                      * 496A5
          ID      ZPAR                           * 496AA
          OBJ_4735A                              * 496B9
          NOTcaseFALSE                           * 496BE
          DUPTYPELIST?                           * 496C3
          NOTcsdrpfls                            * 496C8
          INNERDUP                               * 496CD
          BINT4                                  * 496D2
          #=                                     * 496D7
          NOTcase                                * 496DC
          NDROPFALSE                             * 496E1
          DROPTRUE                               * 496E6
        ;                                        * 496EB

* refs (3): 6B97F 6CBCF 7380F
OBJ_496F0:
        ::                                       * 496F0
          BINT27                                 * 496F5
          PUTLAM                                 * 496FA
        ;                                        * 496FF
        NIBHEX  00000                            * 49704  ..

* id ob -> $
* refs (3): 15581 9E59F 9F21D
PromptIdUtil:
        ::                                       * 49709
          ->StkStr22!                            * 4970E
          SWAP                                   * 49713
          ID>$                                   * 49718
          $       ": "                           * 4971D
          !append$SWAP                           * 4972B
          !append$                               * 49730
        ;                                        * 49735

* refs (1): 474F1
OBJ_4973A:
        ::                                       * 4973A
          CHECKMENU                              * 4973F
          OBJ_49B4B                              * 49744
          CkEQUtil                               * 49749
          PointDerivUt                           * 4974E
          CRUNCHNoBlame                          * 49753

_Slope__49758:
          $       "Slope"                        * 49758
          >TAG                                   * 4976C
          DUP                                    * 49771
          OBJ_49D3A                              * 49776
          Π'SAVEDDEPTH                           * 4977B
          #1+                                    * 49780
          '                                      * 49785
          Π'SAVEDDEPTH                           * 4978A
          STO                                    * 4978F
        ;                                        * 49794

* refs (1): 48D0F
OBJ_49799:
        ::                                       * 49799
          OBJ_49B4B                              * 4979E
          OBJ_48B39                              * 497A3
          FALSE                                  * 497A8

_Root_:
          $       "Root"                         * 497AD
          OBJ_49E75                              * 497BF
          Π'SAVEDDEPTH                           * 497C4
          #1+                                    * 497C9
          '                                      * 497CE
          Π'SAVEDDEPTH                           * 497D3
          STO                                    * 497D8
        ;                                        * 497DD
        NIBHEX  00000                            * 497E2  ..

* refs (1): 47512
OBJ_497E7:
        ::                                       * 497E7
          CHECKMENU                              * 497EC
          OBJ_49B4B                              * 497F1
          CkEQUtil                               * 497F6
          CURRENTMARK?                           * 497FB
          NOTcase                                * 49800
          ::                                     * 49805
            3DROP                                * 4980A
            NEWMARK                              * 4980F
          ;                                      * 49814
          DROP                                   * 49819
          OBJ_4782B                              * 4981E
          4UNROLL                                * 49823
          3UNROLL                                * 49828
          DUPUNROT                               * 4982D
          SYMSHOW                                * 49832
          SWAP                                   * 49837
          '                                      * 4983C
          INTEG                                  * 49841
          CRUNCHNoBlame                          * 49846

_Area_:
          $       "Area"                         * 4984B
          >TAG                                   * 4985D
          DUP                                    * 49862
          BINT39                                 * 49867
          !DcompWidth                            * 4986C
          1stkdecomp$w                           * 49871
          OBJ_0C9FE                              * 49876
          Π'SAVEDDEPTH                           * 4987B
          #1+                                    * 49880
          '                                      * 49885
          Π'SAVEDDEPTH                           * 4988A
          STO                                    * 4988F
        ;                                        * 49894

* refs (1): 48D4B
OBJ_49899:
        ::                                       * 49899
          OBJ_49B4B                              * 4989E
          DORCLE                                 * 498A3
          EqList?                                * 498A8
          ITE                                    * 498AD
          ::                                     * 498B2
            ROT                                  * 498B7
            '                                    * 498BC
            xEVAL                                * 498C1
            BINT2                                * 498C6
            GetEqN                               * 498CB
            NcaseSIZEERR                         * 498D0
            OBJ_49B7D                            * 498D5
            OVER                                 * 498DA
            '                                    * 498DF
            x-                                   * 498E4
            BINT5                                * 498E9
            ::N                                  * 498EE
            3UNROLL                              * 498F3
          ;                                      * 498F8
          ::                                     * 498FD
            rceq!                                * 49902
            dup;1stMember(_);gn?                 * 49907
            caseDROP                             * 4990C
            4ROLL                                * 49911
            DROP                                 * 49916
            3UNROLL                              * 4991B
          ;                                      * 49920
          OBJ_48B39                              * 49925
          TRUE                                   * 4992A

_I-sect_:
          $       "I-sect"                       * 4992F
          OBJ_49E75                              * 49945
          Π'SAVEDDEPTH                           * 4994A
          #1+                                    * 4994F
          '                                      * 49954
          Π'SAVEDDEPTH                           * 49959
          STO                                    * 4995E
        ;                                        * 49963

* refs (1): 48D78
OBJ_49968:
        ::                                       * 49968
          OBJ_49B4B                              * 4996D
          CkEQUtil                               * 49972
          PointDerivUt                           * 49977
          OBJ_48CBA                              * 4997C
          OBJ_48B39                              * 49981
          TRUE                                   * 49986

_Extrm_:
          $       "Extrm"                        * 4998B
          OBJ_49E75                              * 4999F
          Π'SAVEDDEPTH                           * 499A4
          #1+                                    * 499A9
          '                                      * 499AE
          Π'SAVEDDEPTH                           * 499B3
          STO                                    * 499B8
        ;                                        * 499BD

* refs (1): 47577
OBJ_499C2:
        ::                                       * 499C2
          CHECKMENU                              * 499C7
          OBJ_49B4B                              * 499CC
          2DROP                                  * 499D1
          CRUNCHNoBlame                          * 499D6

_F(x)_:
          $       "F(x)"                         * 499DB
          >TAG                                   * 499ED
          DUP                                    * 499F2
          OBJ_49D3A                              * 499F7
          Π'SAVEDDEPTH                           * 499FC
          #1+                                    * 49A01
          '                                      * 49A06
          Π'SAVEDDEPTH                           * 49A0B
          STO                                    * 49A10
        ;                                        * 49A15

        #       622                              * 49A1A  1570

        #       623                              * 49A24  1571

        #       624                              * 49A2E  1572

* refs (2): 22119 4A343
OBJ_49A38:
        #       628                              * 49A38  1576

* refs (2): 22157 4A381
OBJ_49A42:
        #       629                              * 49A42  1577

* refs (2): 221C2 4A3CE
OBJ_49A4C:
        #       62A                              * 49A4C  1578

* refs (2): 221D6 4A3E7
OBJ_49A56:
        #       62B                              * 49A56  1579

* refs (1): 222B7
OBJ_49A60:
        #       62C                              * 49A60  1580

* refs (1): 222CB
OBJ_49A6A:
        #       62D                              * 49A6A  1581

* refs (2): 4EF00 B633A
OBJ_49A74:
        ::                                       * 49A74
          BINT4                                  * 49A79
          {}N                                    * 49A7E
          '                                      * 49A83

ZPAR_49A88:
          ID      ZPAR                           * 49A88
          STOAPPLDATA                            * 49A97
        ;                                        * 49A9C

* refs (2): 48AA3 48AFD
OBJ_49AA1:
        ::                                       * 49AA1
          DUP                                    * 49AA6
          OBJ_66BAD                              * 49AAB
          IT                                     * 49AB0
          DROPZERO                               * 49AB5
        ;                                        * 49ABA

* refs (1): 47594
OBJ_49ABF:
        ::                                       * 49ABF
          CHECKMENU                              * 49AC4
          OBJ_49B4B                              * 49AC9
          CkEQUtil                               * 49ACE

* refs (3): 47660 4974E 49977
PointDerivUt:
          ::                                     * 49AD3
            DROP                                 * 49AD8
            SymDer(ex,nm)                        * 49ADD
          ;                                      * 49AE2

* refs (1): 49CCC
OBJ_49AE7:
          ::                                     * 49AE7
            DORCLE                               * 49AEC
            DUP                                  * 49AF1
            EqList?                              * 49AF6
          ;                                      * 49AFB
          case                                   * 49B00
          ::                                     * 49B05
            SWAP>HCOMP                           * 49B0A
            'EQ                                  * 49B0F
            STOAPPLDATA                          * 49B14
            OBJ_4DAA3                            * 49B19
          ;                                      * 49B1E
          DROP                                   * 49B23
          'EQ                                    * 49B28
          SAFE@                                  * 49B2D
          DROP                                   * 49B32
          TWO{}N                                 * 49B37
          DOSTOE                                 * 49B3C
          OBJ_4DAA3                              * 49B41
        ;                                        * 49B46

* refs (10): 47638 47656 49744 4979E 497F1 4989E ...
OBJ_49B4B:
        ::                                       * 49B4B
          rceq!                                  * 49B50
          OBJ_47858                              * 49B55
          NOTcase                                * 49B5A
          OBJ_48CBA                              * 49B5F
          DUP                                    * 49B64
          ChkEQ(eq)                              * 49B69
          case                                   * 49B6E
          OBJ_49C95                              * 49B73
          2DROP                                  * 49B78

* refs (5): 498D5 7389B 8AB45 B6BB7 B6BDA
OBJ_49B7D:
          ::                                     * 49B7D
            OBJ_47858                            * 49B82
            NOT?SEMI                             * 49B87
            1stArgRpn(ex)                        * 49B8C
            SYMBN                                * 49B91
          ;                                      * 49B96
          OBJ_48CBA                              * 49B9B
        ;                                        * 49BA0

FcnUtilEnd:
        ::                                       * 49BA5
          INDEPVAR                               * 49BAA
          OBJ_4A078                              * 49BAF
          OVER                                   * 49BB4
          OBJ_1552C                              * 49BB9
          OVER                                   * 49BBE
          SWAP                                   * 49BC3
          XEQSTOID                               * 49BC8
        ;                                        * 49BCD

RootUtil:
        ::                                       * 49BD2
          SYMBNUMSOLVE                           * 49BD7
          NOTcase                                * 49BDC
          ::                                     * 49BE1
            2RDROP                               * 49BE6
            JstGetTHEMESG                        * 49BEB
            DISPCOORD2                           * 49BF0
          ;                                      * 49BF5
          ATTN#                                  * 49BFA
          OVER                                   * 49BFF
          #=                                     * 49C04
          case                                   * 49C09
          ::                                     * 49C0E
            SWAPDROP                             * 49C13
            2RDROP                               * 49C18
            GETTHEMESG                           * 49C1D
            DISPCOORD2                           * 49C22
          ;                                      * 49C27
          OBJ_33D8C                              * 49C2C
          OVER                                   * 49C31
          #=                                     * 49C36
          ITE                                    * 49C3B
          DROPNULL$                              * 49C40
          GETTHEMESG                             * 49C45
          SWAP                                   * 49C4A
        ;                                        * 49C4F

* refs (5): 4765B 49749 497F6 49972 49ACE
CkEQUtil:
        ::                                       * 49C54
          3PICK                                  * 49C59
          DUPTYPESYMB?                           * 49C5E
          OVER                                   * 49C63
          TYPEIDNT?                              * 49C68
          OR                                     * 49C6D
          OVER                                   * 49C72
          TYPEREAL?                              * 49C77
          OR                                     * 49C7C
          SWAP                                   * 49C81
          TYPEEXT?                               * 49C86
          OR                                     * 49C8B
          NOTcase                                * 49C90

* refs (1): 49B73
OBJ_49C95:
          ::                                     * 49C95
            OBJ_4A12C                            * 49C9A
            OBJ_6BC2D                            * 49C9F
            3DROP                                * 49CA4
            RDROP                                * 49CA9
          ;                                      * 49CAE
        ;                                        * 49CB3

* refs (1): 475E0
NextInEQ:
        ::                                       * 49CB8

* refs (1): 15348
NextInEQ!:
          ::                                     * 49CBD
            TakeOver                             * 49CC2
            AtUserStack                          * 49CC7
            OBJ_49AE7                            * 49CCC
            ITE                                  * 49CD1

* {} -> {}'
ROLL{}:
            ::                                   * 49CD6
              INNERCOMP                          * 49CDB
              DUP#0=case                         * 49CE0
              NOEQERR                            * 49CE5
              DUP#1+                             * 49CEA
              ROLLSWAP                           * 49CEF
              {}N                                * 49CF4
            ;                                    * 49CF9
            ::                                   * 49CFE
              dup;BreakEquation?                 * 49D03
              NOT?SEMI                           * 49D08
              ROTDROP                            * 49D0D
              SWAP                               * 49D12
              uncrunch                           * 49D17
              x=                                 * 49D1C
            ;                                    * 49D21
            'EQ                                  * 49D26
            STOAPPLDATA                          * 49D2B
          ;                                      * 49D30
          Trceq                                  * 49D35

* refs (3): 47731 49776 499F7
OBJ_49D3A:
          ::                                     * 49D3A
            ::                                   * 49D3F
              NULL$                              * 49D44
              SWAP                               * 49D49
              OBJ_49B4B                          * 49D4E
              SWAPDROPSWAP                       * 49D53
              OBJ_49E3E                          * 49D58
              U>nbr                              * 49D5D
              dREALNcase                         * 49D62
              2DROP                              * 49D67
              PointMoveCur                       * 49D6C
            ;                                    * 49D71
            OBJ_49FE2                            * 49D76
          ;                                      * 49D7B
        ;                                        * 49D80

* refs (1): 49907
dup;1stMember(_);gn?:
        ::                                       * 49D85
          DUP                                    * 49D8A
          ALGeq?                                 * 49D8F
          NOTcaseFALSE                           * 49D94
          DUP                                    * 49D99
          1stArgb(ex)                            * 49D9E
          DUP#1=                                 * 49DA3
          NOTcase                                * 49DA8

dropB;false:
          ::                                     * 49DAD
            NDROP                                * 49DB2
            FALSE                                * 49DB7
          ;                                      * 49DBC
          DROP                                   * 49DC1
          TYPEIDNT?                              * 49DC6
        ;                                        * 49DCB

* refs (1): 49D03
dup;BreakEquation?:
        ::                                       * 49DD0
          DUP                                    * 49DD5
          ALGeq?                                 * 49DDA
          NOTcaseFALSE                           * 49DDF
          DUP                                    * 49DE4
          1stArgb(ex)                            * 49DE9
          SYMBN                                  * 49DEE
          OVER                                   * 49DF3
          1stArgRpn(ex)                          * 49DF8
          SYMBN                                  * 49DFD
          TRUE                                   * 49E02
        ;                                        * 49E07

* refs (1): 49B69
ChkEQ(eq):
        ::                                       * 49E0C
          DUP                                    * 49E11
          OBJ_4D97F                              * 49E16
          SWAP                                   * 49E1B
          GETRHS                                 * 49E20
          OVER                                   * 49E25
          OBJ_50F42                              * 49E2A
          NOTcaseFALSE                           * 49E2F
          OBJ_51003                              * 49E34
        ;                                        * 49E39

* refs (3): 4766F 49D58 49EA2
OBJ_49E3E:
        ::                                       * 49E3E
          4UNROLL                                * 49E43
          3NULLLAM{}                             * 49E48
          BIND                                   * 49E4D
          CRUNCHNoBlame                          * 49E52
          3GETLAM                                * 49E57
          2GETLAM                                * 49E5C
          1GETLAM                                * 49E61
          ABND                                   * 49E66
          4ROLL                                  * 49E6B
        ;                                        * 49E70

* refs (3): 497BF 49945 4999F
OBJ_49E75:
        ::                                       * 49E75
          15GETLAM                               * 49E7A
          4ROLL                                  * 49E7F
          NEWINDEP                               * 49E84
          rceq!                                  * 49E89
          DUP                                    * 49E8E
          ALGeq?                                 * 49E93
          IT                                     * 49E98
          GETRHS                                 * 49E9D
          OBJ_49E3E                              * 49EA2
          U>nbr                                  * 49EA7
          INDEPVAR                               * 49EAC
          SAFE@_HERE                             * 49EB1
          NcaseSIZEERR                           * 49EB6
          SWAP                                   * 49EBB
          4ROLL                                  * 49EC0
          ITE                                    * 49EC5
          ::                                     * 49ECA
            2DUPSWAP                             * 49ECF
            U>nbr                                * 49ED4
            SWAP                                 * 49ED9
            dREALNcase                           * 49EDE
            DROP                                 * 49EE3
            %>C%                                 * 49EE8
          ;                                      * 49EED
          OVER                                   * 49EF2
          4ROLL                                  * 49EF7
          >TAG                                   * 49EFC
          3UNROLL                                * 49F01

* refs (1): 49D6C
PointMoveCur:
          ::                                     * 49F06
            dREALNcase                           * 49F0B
            2DROP                                * 49F10
            SWAP                                 * 49F15
            U>nbr                                * 49F1A
            SWAP                                 * 49F1F
            RIGHTCOL                             * 49F24
            BOTROW                               * 49F29
            RclMaxStdPict                        * 49F2E
            px->c(2rr,2s)                        * 49F33
            C%>%                                 * 49F38
            3PICK                                * 49F3D
            %>                                   * 49F42
            casedrop                             * 49F47
            OBJ_4A02D                            * 49F4C
            3PICK                                * 49F51
            %<                                   * 49F56
            case                                 * 49F5B
            OBJ_4A02D                            * 49F60
            WINDOWCORNER                         * 49F65
            SWAP                                 * 49F6A
            RclMaxStdPict                        * 49F6F
            px->c(2rr,2s)                        * 49F74
            C%>%                                 * 49F79
            3PICK                                * 49F7E
            %<                                   * 49F83
            casedrop                             * 49F88
            OBJ_4A02D                            * 49F8D
            3PICK                                * 49F92
            %>                                   * 49F97
            case                                 * 49F9C
            OBJ_4A02D                            * 49FA1
            %>C%                                 * 49FA6
            RclMaxStdPict                        * 49FAB
            OBJ_4F1A1                            * 49FB0
            NOT?SEMI                             * 49FB5
            CROSS_OFF                            * 49FBA
            TOTEMPSWAP                           * 49FBF
            TOTEMPOB                             * 49FC4
            8PUTLAM                              * 49FC9
            7PUTLAM                              * 49FCE
            CROSS_HAIRS                          * 49FD3
          ;                                      * 49FD8
          DUPUNROT                               * 49FDD

* refs (1): 49D76
OBJ_49FE2:
          ::                                     * 49FE2
            SWAP                                 * 49FE7
            DUPNULL$?                            * 49FEC
            ITE                                  * 49FF1
            DROP                                 * 49FF6
            ::                                   * 49FFB
              OBJ_0C9FE                          * 4A000
              SORTASLOW                          * 4A005
            ;                                    * 4A00A
            BINT39                               * 4A00F
            !DcompWidth                          * 4A014
            1stkdecomp$w                         * 4A019
            OBJ_0C9FE                            * 4A01E
          ;                                      * 4A023
        ;                                        * 4A028

* refs (4): 49F4C 49F60 49F8D 49FA1
OBJ_4A02D:
        ::                                       * 4A02D
          2DROP                                  * 4A032
          SWAP                                   * 4A037
          OBJ_4794D                              * 4A03C
          JstGetTHEMESG                          * 4A041
          !append$                               * 4A046
          SWAP                                   * 4A04B
        ;                                        * 4A050

* $ ->
* refs (2): 49BF0 49C22
DISPCOORD2:
        ::                                       * 4A055
          DispCoord1                             * 4A05A
          WaitForKey                             * 4A05F
          2DROP                                  * 4A064
          DispMenu                               * 4A069
          InitEdModes                            * 4A06E
        ;                                        * 4A073

* refs (1): 49BAF
OBJ_4A078:
        ::                                       * 4A078
          RECORDX&YC%                            * 4A07D
          C>Re%                                  * 4A082
        ;                                        * 4A087

* refs (8): 155E5 15887 4902B 49902 49B50 49E89 ...
rceq!:
        ::                                       * 4A08C
          BINT1                                  * 4A091
          GetEqN                                 * 4A096
          NOTcase                                * 4A09B
          NOEQERR                                * 4A0A0
        ;                                        * 4A0A5

* #n -> ob T -> NULL$ F
* refs (9): 4893B 4898B 498CB 4A096 4E252 4EE4C ...
GetEqN:
        ::                                       * 4A0AA
          EQUATION                               * 4A0AF
          NOTcsdrpfls                            * 4A0B4
          DUPUNROT                               * 4A0B9
          EqList?                                * 4A0BE
          ITE                                    * 4A0C3
          ::                                     * 4A0C8
            NTHELCOMP                            * 4A0CD
            NOTcase                              * 4A0D2

___4A0D7:
            ::                                   * 4A0D7
              NULL$                              * 4A0DC
              FALSE                              * 4A0E1
            ;                                    * 4A0E6
            OBJ_15389                            * 4A0EB
            TRUE                                 * 4A0F0
          ;                                      * 4A0F5
          #1=                                    * 4A0FA
          NOTcsdrpfls                            * 4A0FF
          DUPTYPELIST?                           * 4A104
          NOTcaseTRUE                            * 4A109
          CARCOMP                                * 4A10E
          OBJ_15389                              * 4A113
          TRUE                                   * 4A118
        ;                                        * 4A11D

* refs (1): 20295
OBJ_4A122:
        #       606                              * 4A122  1542

* refs (1): 49C9A
OBJ_4A12C:
        #       607                              * 4A12C  1543

        #       608                              * 4A136  1544

        #       609                              * 4A140  1545

        #       60A                              * 4A14A  1546

        #       60B                              * 4A154  1547

        #       60C                              * 4A15E  1548

        #       60D                              * 4A168  1549

* refs (1): 2026D
bestfit:
        ::                                       * 4A172

* refs (1): 2C7AB
OBJ_4A177:
          {                                      * 4A177
            xLINFIT                              * 4A17C
            xLOGFIT                              * 4A181
            xEXPFIT                              * 4A186
            xPWRFIT                              * 4A18B
          }                                      * 4A190
          '                                      * 4A195
          xLINFIT                                * 4A19A
          %0_2A2B4                               * 4A19F
          BINT5                                  * 4A1A4
          ONE_DO                                 * 4A1A9
          3PICK                                  * 4A1AE
          INDEX@                                 * 4A1B3
          NTHCOMPDROP                            * 4A1B8
          DUP                                    * 4A1BD
          StoModel                               * 4A1C2
          STATCORR                               * 4A1C7
          %ABS                                   * 4A1CC
          ROTSWAP                                * 4A1D1
          2DUP                                   * 4A1D6
          %>=                                    * 4A1DB
          ITE                                    * 4A1E0
          DROPSWAPDROP                           * 4A1E5
          ::                                     * 4A1EA
            SWAPDROP                             * 4A1EF
            ROTDROP                              * 4A1F4
          ;                                      * 4A1F9
          LOOP                                   * 4A1FE
          DROPSWAPDROP                           * 4A203
          StoModel                               * 4A208
          STATLR                                 * 4A20D
          2DROP                                  * 4A212
        ;                                        * 4A217

* refs (1): 4A311
OBJ_4A21C:
        ::                                       * 4A21C
          OBJ_4A258                              * 4A221
          StdMenuKeyNS                           * 4A226
        ;                                        * 4A22B

* refs (1): 4A320
OBJ_4A230:
        ::                                       * 4A230
          OBJ_4A258                              * 4A235
          StdMenuKeyLS                           * 4A23A
        ;                                        * 4A23F

* refs (1): 4A32F
OBJ_4A244:
        ::                                       * 4A244
          OBJ_4A258                              * 4A249
          StdRightShift                          * 4A24E
        ;                                        * 4A253

* refs (3): 4A221 4A235 4A249
OBJ_4A258:
        ::                                       * 4A258
          OBJ_4080F                              * 4A25D
          'R                                     * 4A262
          SWAP                                   * 4A267
          case                                   * 4A26C
          EVAL                                   * 4A271
          EVAL                                   * 4A276
          OBJ_4A285                              * 4A27B
        ;                                        * 4A280

* refs (4): 3C407 4A27B 4A2DF 4A2F8
OBJ_4A285:
        ::                                       * 4A285
          EditLExists?                           * 4A28A
          ?SEMI                                  * 4A28F
          PrgmEntry?                             * 4A294
          ?SEMI                                  * 4A299
          AppMode?                               * 4A29E
          ?SEMI                                  * 4A2A3
          OBJ_6DE82                              * 4A2A8
          ?SEMI                                  * 4A2AD
          KEYINBUFFER?                           * 4A2B2
          ?SEMI                                  * 4A2B7
          BINT58                                 * 4A2BC
          TestSysFlag                            * 4A2C1
          ?SEMI                                  * 4A2C6
          LocalReview                            * 4A2CB
        ;                                        * 4A2D0

* refs (1): 4A302
OBJ_4A2D5:
        ::                                       * 4A2D5
          SetDA12NoCh                            * 4A2DA
          OBJ_4A285                              * 4A2DF
        ;                                        * 4A2E4

* refs (6): 3C48C 3C516 3C5A0 3C62A 3D3A1 3D3D9
OBJ_4A2E9:
        ::                                       * 4A2E9
          'R                                     * 4A2EE
          ReviewKey!                             * 4A2F3
          OBJ_4A285                              * 4A2F8
          '                                      * 4A2FD
          OBJ_4A2D5                              * 4A302
          MenuRowAct!                            * 4A307
          '                                      * 4A30C
          OBJ_4A21C                              * 4A311
          MenuKeyNS!                             * 4A316
          '                                      * 4A31B
          OBJ_4A230                              * 4A320
          MenuKeyLS!                             * 4A325
          '                                      * 4A32A
          OBJ_4A244                              * 4A32F
          MenuKeyRS!                             * 4A334
        ;                                        * 4A339

* refs (1): 3D3A6
OBJ_4A33E:
        ::                                       * 4A33E
          OBJ_49A38                              * 4A343
          JstGetTHEMESG                          * 4A348
          BINT33                                 * 4A34D
          SysITE                                 * 4A352

_IR__4A357:
          $       "IR"                           * 4A357

_wire__4A365:
          $       "wire"                         * 4A365
          !append$                               * 4A377
          DISPROW3                               * 4A37C
          OBJ_49A42                              * 4A381
          JstGetTHEMESG                          * 4A386
          BINT35                                 * 4A38B
          SysITE                                 * 4A390

_binary__4A395:
          $       "binary"                       * 4A395

_ASCII__4A3AB:
          $       "ASCII"                        * 4A3AB
          !append$                               * 4A3BF
          DISPROW4                               * 4A3C4
          GetIOPAR                               * 4A3C9
          OBJ_49A4C                              * 4A3CE
          JstGetTHEMESG                          * 4A3D3
          7ROLL                                  * 4A3D8
          OBJ_45EB0                              * 4A3DD
          DISPROW5                               * 4A3E2
          OBJ_49A56                              * 4A3E7
          JstGetTHEMESG                          * 4A3EC
          6ROLL                                  * 4A3F1
          ::                                     * 4A3F6
            DUPTYPEREAL?                         * 4A3FB
            NOTcasedrop                          * 4A400

_invalid__4A405:
            $       "invalid"                    * 4A405
            {                                    * 4A41D

_none__4A422:
              $       "none "                    * 4A422

_odd__4A436:
              $       "odd "                     * 4A436

_even__4A448:
              $       "even "                    * 4A448

_mark__4A45C:
              $       "mark "                    * 4A45C
            }                                    * 4A470
            OVER                                 * 4A475
            %ABSCOERCE                           * 4A47A
            #1+                                  * 4A47F
            NTHELCOMP                            * 4A484
            ?SKIP                                * 4A489
            $       "spc "                       * 4A48E
            swap;->EditStr;+(2st)                * 4A4A0
          ;                                      * 4A4A5
          &$                                     * 4A4AA
          DISPROW6                               * 4A4AF
          $       "cksum: "                      * 4A4B4
          ROT                                    * 4A4CC
          OBJ_45EB0                              * 4A4D1
          $       "  translate: "                * 4A4D6
          !!append$                              * 4A4FA
          OBJ_4613E                              * 4A4FF
          DISPROW7                               * 4A504
          2DROP                                  * 4A509
          SetDA2OKTemp                           * 4A50E
        ;                                        * 4A513

* refs (1): 3D3DE
OBJ_4A518:
        ::                                       * 4A518
          ChkPRTPAR                              * 4A51D
          #4-                                    * 4A522
          NDROP                                  * 4A527
          $       "Delay: "                      * 4A52C
          5ROLL                                  * 4A544
          OBJ_45EB0                              * 4A549
          DISPROW3                               * 4A54E
          $       "Remap: "                      * 4A553
          4ROLL                                  * 4A56B
          OBJ_45EB0                              * 4A570
          DISPROW4                               * 4A575
          $       "Line length: "                * 4A57A
          ROT                                    * 4A59E
          OBJ_45EB0                              * 4A5A3
          DISPROW5                               * 4A5A8
          $       "End-of-line: "                * 4A5AD
          OBJ_4613E                              * 4A5D1
          DISPROW6                               * 4A5D6
          NULL$                                  * 4A5DB
          DISPROW7                               * 4A5E0
          SetDA2OKTemp                           * 4A5E5
        ;                                        * 4A5EA

* refs (1): 413C3
OBJ_4A5EF:
        ::                                       * 4A5EF
          $       "Eq: "                         * 4A5F4
          EQUATION                               * 4A606
          IT                                     * 4A60B
          OBJ_45EB0                              * 4A610
          DISPROW3                               * 4A615
          $       "Ptype: "                      * 4A61A
          Chk&BreakPPAR                          * 4A632
          DROP                                   * 4A637
          6UNROLL                                * 4A63C
          5DROP                                  * 4A641
          OBJ_45EB0                              * 4A646
          DISPROW4                               * 4A64B
          NULL$                                  * 4A650
          DISPROW5                               * 4A655
          NULL$                                  * 4A65A
          DISPROW6                               * 4A65F
          NULL$                                  * 4A664
          DISPROW7                               * 4A669
          SetDA2OKTemp                           * 4A66E
        ;                                        * 4A673

* refs (1): 4602A
OBJ_4A678:
        ::                                       * 4A678
          ROMPTR  0B5 08C                        * 4A67D
          $       "Xeye:  "                      * 4A688
          6ROLL                                  * 4A6A0
          OBJ_45EB0                              * 4A6A5
          DISPROW3                               * 4A6AA
          $       "Yeye:  "                      * 4A6AF
          5ROLL                                  * 4A6C7
          OBJ_45EB0                              * 4A6CC
          DISPROW4                               * 4A6D1
          $       "Zeye:  "                      * 4A6D6
          4ROLL                                  * 4A6EE
          OBJ_45EB0                              * 4A6F3
          DISPROW5                               * 4A6F8
          $       "Xstep: "                      * 4A6FD
          ROT                                    * 4A715
          OBJ_45EB0                              * 4A71A
          DISPROW6                               * 4A71F
          $       "Ystep: "                      * 4A724
          OBJ_4613E                              * 4A73C
          DISPROW7                               * 4A741
          BINT10                                 * 4A746
          NDROP                                  * 4A74B
          SetDA2OKTemp                           * 4A750
        ;                                        * 4A755

* refs (2): 3C5A5 3C62F
OBJ_4A75A:
        ::                                       * 4A75A
          ChkReakäPAR                            * 4A75F
          5ROLL                                  * 4A764
          $       "Xcol:  "                      * 4A769
          swap;->EditStr;+(2st)                  * 4A781
          DISPROW3                               * 4A786
          4ROLL                                  * 4A78B
          $       "Ycol:  "                      * 4A790
          swap;->EditStr;+(2st)                  * 4A7A8
          DISPROW4                               * 4A7AD
          ROT                                    * 4A7B2
          $       "Intercept: "                  * 4A7B7
          swap;->EditStr;+(2st)                  * 4A7D7
          DISPROW5                               * 4A7DC
          SWAP                                   * 4A7E1
          $       "Slope: "                      * 4A7E6
          swap;->EditStr;+(2st)                  * 4A7FE
          DISPROW6                               * 4A803

_Mo:
          $       "Model: "                      * 4A808
          swap;->EditStr;+(2st)                  * 4A820
          DISPROW7                               * 4A825
          SetDA2OKTemp                           * 4A82A
        ;                                        * 4A82F

* refs (7): 45FB2 45FD0 46071 46099 460C1 460E9 ...
OBJ_4A834:
        ::                                       * 4A834
          SWAP                                   * 4A839
          OBJ_46120                              * 4A83E
          &$                                     * 4A843
          SPACE$                                 * 4A848
          !!append$                              * 4A84D
          SWAP                                   * 4A852
          OBJ_46120                              * 4A857
          !!append$                              * 4A85C
        ;                                        * 4A861
        BSS     14                               * 4A866

* refs (3): 4B783 4C495 70002
OBJ_4A874:
        ::                                       * 4A874
          %0_2A2B4                               * 4A879
          BINT27                                 * 4A87E
          NDUPN                                  * 4A883
          DROP                                   * 4A888
          OBJ_46B54                              * 4A88D
          CHECKPVARS                             * 4A892
          INCOMPDROP                             * 4A897
          DROP                                   * 4A89C
          11PUTLAM                               * 4A8A1
          OBJ_4C701                              * 4A8A6
          ROT                                    * 4A8AB
          5PICK                                  * 4A8B0
          5PICK                                  * 4A8B5
          OBJ_4A8F1                              * 4A8BA
          %MAXorder                              * 4A8BF
          DUP                                    * 4A8C4
          TOTEMPOB                               * 4A8C9
          15PUTLAM                               * 4A8CE
          17PUTLAM                               * 4A8D3
          OBJ_51901                              * 4A8D8
          DEPTH                                  * 4A8DD
          #3-                                    * 4A8E2
          18PUTLAM                               * 4A8E7
        ;                                        * 4A8EC

* refs (2): 47745 4A8BA
OBJ_4A8F1:
        ::                                       * 4A8F1
          ROT                                    * 4A8F6
          dLISTcase                              * 4A8FB
          ::                                     * 4A900
            ROTROT2DROP                          * 4A905
            ICMPDRPRTDRP                         * 4A90A
          ;                                      * 4A90F
          DROP                                   * 4A914
          11GETLAM                               * 4A919
          'IDPOLAR                               * 4A91E
          jEQcase                                * 4A923
          ::                                     * 4A928
            2DROP                                * 4A92D
            %0_2A2B4                             * 4A932
            1REV                                 * 4A937
          ;                                      * 4A93C
          C>Re%                                  * 4A941
          SWAP                                   * 4A946
          C>Re%                                  * 4A94B
          SWAP                                   * 4A950
        ;                                        * 4A955

* comp -> obn...ob4 ob2 ob1
* refs (8): 4A90A 4B3BA B5417 B5435 B5458 B54DF ...
ICMPDRPRTDRP:
        ::                                       * 4A95A
          INCOMPDROP                             * 4A95F
          ROTDROP                                * 4A964
        ;                                        * 4A969

* refs (8): 4890E 4BBA2 4BD5A 4BDFA 4EDAC 8A58E ...
OBJ_4A96E:
        ::                                       * 4A96E
          BINT1                                  * 4A973
          OVER                                   * 4A978
          #1+                                    * 4A97D
          TWO{}N                                 * 4A982
          %-1                                    * 4A987
          MAKEARRY                               * 4A98C
          TOTEMPOB                               * 4A991
          DUP                                    * 4A996
          TOTEMPOB                               * 4A99B
          20PUTLAM                               * 4A9A0
          21PUTLAM                               * 4A9A5
        ;                                        * 4A9AA

* -> {}
* refs (18): 4A892 4B369 4B428 4FC6E 50F92 8AAB9 ...
CHECKPVARS:
        ::                                       * 4A9AF
          Chk&BreakPPAR                          * 4A9B4
          ROMPTR  0F1 03D                        * 4A9B9
          OBJ_4ABC1                              * 4A9C4
          DUPTYPELIST?                           * 4A9C9
          IT                                     * 4A9CE
          ::                                     * 4A9D3
            INNERCOMP                            * 4A9D8
            BINT3                                * 4A9DD
            EQUALcasedrop                        * 4A9E2
            OBJ_4C6E3                            * 4A9E7
            BINT2                                * 4A9EC
            EQUALcasedrop                        * 4A9F1
            OBJ_4EF0A                            * 4A9F6
            OBJ_4B527                            * 4A9FB
          ;                                      * 4AA00
          TYPECMP?                               * 4AA05
          OBJ_514C3                              * 4AA0A
          DUPTYPEREAL?                           * 4AA0F
          SWAP                                   * 4AA14
          TYPEHSTR?                              * 4AA19
          OR                                     * 4AA1E
          OBJ_514C3                              * 4AA23
          ChkIndep                               * 4AA28
          TYPECMP?                               * 4AA2D
          OBJ_514C3                              * 4AA32
          TYPECMP?                               * 4AA37
          OBJ_514C3                              * 4AA3C
          'IDPAR                                 * 4AA41
          OBJ_4735A                              * 4AA46
          DROP                                   * 4AA4B
        ;                                        * 4AA50
        NIBHEX  0000                             * 4AA55  ..

* refs (1): 4AA28
ChkIndep:
        ::                                       * 4AA59
          DUPTYPELIST?                           * 4AA5E
          IT                                     * 4AA63
          ::                                     * 4AA68
            INNERCOMP                            * 4AA6D
            BINT3                                * 4AA72
            EQUAL                                * 4AA77
            OBJ_514C3                            * 4AA7C
            TYPEREAL?                            * 4AA81
            OBJ_514C3                            * 4AA86
            TYPEREAL?                            * 4AA8B
            OBJ_514C3                            * 4AA90
          ;                                      * 4AA95
          TYPEIDNT?                              * 4AA9A
          OBJ_514C3                              * 4AA9F
        ;                                        * 4AAA4

* refs (5): 45F19 4A632 4A9B4 4B0DF 51044
Chk&BreakPPAR:
        ::                                       * 4AAA9
          'IDPAR                                 * 4AAAE
          OBJ_4735A                              * 4AAB3
          ?SKIP                                  * 4AAB8
          MAKEPVARS                              * 4AABD
          DUPTYPELIST?                           * 4AAC2
          OBJ_514C3                              * 4AAC7
          DUPLENCOMP                             * 4AACC
          BINT7                                  * 4AAD1
          #=                                     * 4AAD6
          OBJ_514C3                              * 4AADB
          INCOMPDROP                             * 4AAE0
        ;                                        * 4AAE5

* -> {}
* refs (4): 45EF6 481B6 4AABD 4EEFB
MAKEPVARS:
        ::                                       * 4AAEA
          BINT131                                * 4AAEF
          MakeRange(s)                           * 4AAF4
          BINT64                                 * 4AAF9
          MakeRange(s)                           * 4AAFE
          ROTSWAP                                * 4AB03
          %>C%                                   * 4AB08
          3UNROLL                                * 4AB0D
          %>C%                                   * 4AB12
          SWAP'                                  * 4AB17

* ID X
* refs (1): 481A2
ID_X:
          ID      X                              * 4AB1C
          %0_2A2B4                               * 4AB25

PvarsC%0:
          C%      0E0 0E0                        * 4AB2A
          'IDFUNCTION                            * 4AB4F
          '                                      * 4AB54

* ID Y
* refs (1): 481A7
ID_Y:
          ID      Y                              * 4AB59
          StoInPPAR(7_)                          * 4AB62
          'IDPAR                                 * 4AB67
          OBJ_4735A                              * 4AB6C
          DROP                                   * 4AB71
        ;                                        * 4AB76

* refs (4): 47C36 47C40 4AAF4 4AAFE
MakeRange(s):
        ::                                       * 4AB7B
          #1-DUP                                 * 4AB80
          #2/                                    * 4AB85
          UNCOERCE                               * 4AB8A
          %10                                    * 4AB8F
          %/                                     * 4AB94
          %CHS                                   * 4AB99
          SWAP                                   * 4AB9E
          UNCOERCE                               * 4ABA3
          %10                                    * 4ABA8
          %/                                     * 4ABAD
          OVER                                   * 4ABB2
          %+                                     * 4ABB7
        ;                                        * 4ABBC

* refs (1): 4A9C4
OBJ_4ABC1:
        ::                                       * 4ABC1
          ?OKINALG                               * 4ABC6
          casedrop                               * 4ABCB
          ::                                     * 4ABD0
            'IDFUNCTION                          * 4ABD5
            PUTPTYPE                             * 4ABDA
          ;                                      * 4ABDF
          OBJ_2708E                              * 4ABE4
          caseDROP                               * 4ABE9
          DROP                                   * 4ABEE
          'IDFUNCTION                            * 4ABF3
          PUTPTYPE                               * 4ABF8
        ;                                        * 4ABFD

* refs (1): 6BE16
OBJ_4AC02:
        ::                                       * 4AC02
          DUPTYPESYMB?                           * 4AC07
          OVER                                   * 4AC0C
          TYPECMP?                               * 4AC11
          OR                                     * 4AC16
          SWAP                                   * 4AC1B
          TYPEEXT?                               * 4AC20
          OR                                     * 4AC25
        ;                                        * 4AC2A
        NIBHEX  00000                            * 4AC2F  ..

* refs (3): 4AE5F 4B567 4B5C1
RclCenter:
        ::                                       * 4AC34
          RclMaxStdPict                          * 4AC39
          2DUP                                   * 4AC3E
          #2/                                    * 4AC43
          4UNROLL                                * 4AC48
          #2/                                    * 4AC4D
          3UNROLL                                * 4AC52
          px->c(2rr,2s)                          * 4AC57
        ;                                        * 4AC5C

* refs (6): 1E0F7 1E110 47C0E 4B5A3 4B602 4E767
centr(c):
        ::                                       * 4AC61
          C%>%                                   * 4AC66
          RclMaxStdPict                          * 4AC6B
          2DUP                                   * 4AC70
          #1-SWAP                                * 4AC75
          #1-DUP                                 * 4AC7A
          2/(s);s=>rr                            * 4AC7F
          3PICK                                  * 4AC84
          2/(s);s=>rr                            * 4AC89
          4PICK                                  * 4AC8E
          UNCOERCE%%                             * 4AC93
          %%/                                    * 4AC98
          6UNROLL                                * 4AC9D
          OVER                                   * 4ACA2
          UNCOERCE%%                             * 4ACA7
          %%/                                    * 4ACAC
          5UNROLL                                * 4ACB1
          UNCOERCE2                              * 4ACB6
          %>%%                                   * 4ACBB
          4ROLL                                  * 4ACC0
          2/(s);s=>rr                            * 4ACC5
          SWAP%%/                                * 4ACCA
          3UNROLL                                * 4ACCF
          %>%%SWAP                               * 4ACD4
          2/(s);s=>rr                            * 4ACD9
          SWAP%%/                                * 4ACDE
          3UNROLL                                * 4ACE3
          GETPMIN&MAX                            * 4ACE8
          SWAP2C%>%                              * 4ACED
          ROTSWAP                                * 4ACF2
          %-                                     * 4ACF7
          %>%%                                   * 4ACFC
          3UNROLL                                * 4AD01
          %-                                     * 4AD06
          %>%%                                   * 4AD0B
          DUP                                    * 4AD10
          6ROLL                                  * 4AD15
          %%*                                    * 4AD1A
          8PICK                                  * 4AD1F
          %>%%SWAP                               * 4AD24
          %%-                                    * 4AD29
          %%>%                                   * 4AD2E
          8UNROLL                                * 4AD33
          5ROLL                                  * 4AD38
          %%*                                    * 4AD3D
          6ROLL                                  * 4AD42
          %>%%                                   * 4AD47
          %%+                                    * 4AD4C
          %%>%                                   * 4AD51
          5UNROLL                                * 4AD56
          DUP                                    * 4AD5B
          4ROLL                                  * 4AD60
          %%*                                    * 4AD65
          4PICK                                  * 4AD6A
          %>%%SWAP                               * 4AD6F
          %%-                                    * 4AD74
          %%>%                                   * 4AD79
          5UNROLL                                * 4AD7E
          %%*SWAP                                * 4AD83
          %>%%                                   * 4AD88
          %%+                                    * 4AD8D
          %%>%                                   * 4AD92
          %>C%                                   * 4AD97
          pmax(c)                                * 4AD9C
          %>C%                                   * 4ADA1
          pmin(c)                                * 4ADA6
        ;                                        * 4ADAB

* -> % %'
* refs (3): 47BDC 4800D 48E0F
GETSCALE:
        ::                                       * 4ADB0
          RclMaxStdPict                          * 4ADB5
          #1-SWAP                                * 4ADBA
          #1-                                    * 4ADBF
          UNCOERCE2                              * 4ADC4
          RclPmin                                * 4ADC9
          C%>%                                   * 4ADCE
          RclPmax                                * 4ADD3
          C%>%                                   * 4ADD8
          3UNROLL                                * 4ADDD
          4ROLL                                  * 4ADE2
          %-                                     * 4ADE7
          %>%%                                   * 4ADEC
          5ROLL                                  * 4ADF1
          %>%%                                   * 4ADF6
          %%/                                    * 4ADFB
          %%10                                   * 4AE00
          %%*                                    * 4AE05
          %%>%                                   * 4AE0A
          4UNROLL                                * 4AE0F
          %-                                     * 4AE14
          %>%%SWAP                               * 4AE19
          %>%%                                   * 4AE1E
          %%/                                    * 4AE23
          %%10                                   * 4AE28
          %%*                                    * 4AE2D
          %%>%                                   * 4AE32
        ;                                        * 4AE37

* % %' ->
* refs (5): 1E1F0 47BE6 48017 4806C 48E1E
PUTSCALE:
        ::                                       * 4AE3C
          DUP                                    * 4AE41
          %0>                                    * 4AE46
          NcaseSIZEERR                           * 4AE4B
          OVER                                   * 4AE50
          %0>                                    * 4AE55
          NcaseSIZEERR                           * 4AE5A
          RclCenter                              * 4AE5F
          C%>%                                   * 4AE64
          %>%%SWAP                               * 4AE69
          %>%%                                   * 4AE6E
          4ROLL                                  * 4AE73
          %>%%                                   * 4AE78
          %%10                                   * 4AE7D
          %%/                                    * 4AE82
          4ROLL                                  * 4AE87
          %>%%                                   * 4AE8C
          %%10                                   * 4AE91
          %%/                                    * 4AE96
          RclMaxStdPict                          * 4AE9B
          2DUP                                   * 4AEA0
          #1-SWAP                                * 4AEA5
          #1-                                    * 4AEAA
          2/(s);s=>rr                            * 4AEAF
          5PICK                                  * 4AEB4
          %%*                                    * 4AEB9
          8PICK                                  * 4AEBE
          SWAP                                   * 4AEC3
          %%-                                    * 4AEC8
          %%>%                                   * 4AECD
          8UNROLL                                * 4AED2
          2/(s);s=>rr                            * 4AED7
          5PICK                                  * 4AEDC
          %%*                                    * 4AEE1
          6PICK                                  * 4AEE6
          SWAP                                   * 4AEEB
          %%-                                    * 4AEF0
          %%>%                                   * 4AEF5
          8UNROLL                                * 4AEFA
          2/(s);s=>rr                            * 4AEFF
          4ROLL                                  * 4AF04
          %%*                                    * 4AF09
          4ROLL                                  * 4AF0E
          %%+                                    * 4AF13
          %%>%                                   * 4AF18
          4UNROLL                                * 4AF1D
          2/(s);s=>rr                            * 4AF22
          %%*                                    * 4AF27
          %%+                                    * 4AF2C
          %%>%                                   * 4AF31
          %>C%                                   * 4AF36
          pmax(c)                                * 4AF3B
          %>C%                                   * 4AF40
          pmin(c)                                * 4AF45
        ;                                        * 4AF4A

* refs (8): 4AC7F 4AC89 4ACC5 4ACD9 4AEAF 4AED7 ...
2/(s);s=>rr:
        ::                                       * 4AF4F
          #2/                                    * 4AF54
          UNCOERCE%%                             * 4AF59
        ;                                        * 4AF5E

* -> id -> {}
* refs (4): 4773B 4903F 510B2 B6402
GETINDEP:
        ::                                       * 4AF63
          BINT3                                  * 4AF68
          GETPARAM                               * 4AF6D
        ;                                        * 4AF72

* ID ->
* refs (6): 1E059 481CA 48FE0 8B643 8BDAB B548A
PUTINDEP:
        ::                                       * 4AF77
          BINT5                                  * 4AF7C
          PutBackPPAR(_,s)                       * 4AF81
        ;                                        * 4AF86

* {} ->
* refs (6): 1E063 490B7 8A193 8B1C9 B5403 B5499
PUTINDEPLIST:
        ::                                       * 4AF8B
          BINT3                                  * 4AF90
          ChkPut('PPAR',li,s)                    * 4AF95
        ;                                        * 4AF9A

* refs (9): 4C562 4D970 A9B91 A9C60 B5CEE B5EF5 ...
RclDepnd:
        ::                                       * 4AF9F
          BINT7                                  * 4AFA4
          GETPARAM                               * 4AFA9
        ;                                        * 4AFAE

* refs (8): 1E23A 481C5 8BDCB B552A B5D11 B5D3A ...
depnd(gn):
        ::                                       * 4AFB3
          BINT1                                  * 4AFB8
          PutBackPPAR(_,s)                       * 4AFBD
        ;                                        * 4AFC2

* refs (3): 1E244 B54C6 B5539
depnd(li):
        ::                                       * 4AFC7
          BINT7                                  * 4AFCC
          ChkPut('PPAR',li,s)                    * 4AFD1
        ;                                        * 4AFD6

* -> %
* refs (3): 4D1B9 8B7A9 B64D3
GETRES:
        ::                                       * 4AFDB
          BINT4                                  * 4AFE0
          GETPARAM                               * 4AFE5
        ;                                        * 4AFEA

* refs (5): 1E135 8A36C 8B19C 8B68C 8BE5A
res(r):
        ::                                       * 4AFEF
          DUP                                    * 4AFF4
          %0<                                    * 4AFF9
          case                                   * 4AFFE
          SETSIZEERR                             * 4B003
          PUTRES                                 * 4B008
        ;                                        * 4B00D

* % ->
* refs (6): 1E13F 48EDC 4B008 B55D4 B55E8 B55F7
PUTRES:
        ::                                       * 4B012
          BINT4                                  * 4B017
          PutBackPPAR(_,s)                       * 4B01C
        ;                                        * 4B021

* refs (6): 4681F 4E906 A9E61 B6003 B6035 D4118
RclAx*s:
        ::                                       * 4B026
          BINT5                                  * 4B02B
          GETPARAM                               * 4B030
        ;                                        * 4B035

* refs (2): 1E0CD D41E0
ax*s(c):
        ::                                       * 4B03A
          BINT3                                  * 4B03F
          PutBackPPAR(_,s)                       * 4B044
        ;                                        * 4B049

* refs (1): 1E0D7
ax*s(li):
        ::                                       * 4B04E
          OBJ_4502E                              * 4B053
        ;                                        * 4B058
        NIBHEX  00000                            * 4B05D  ..

* -> name
* refs (24): 0C7CB 45ED3 48184 48D97 48F4F 4906C ...
GETPTYPE:
        ::                                       * 4B062
          BINT6                                  * 4B067
          GETPARAM                               * 4B06C
        ;                                        * 4B071

* name ->
* refs (43): 20142 45F00 481C0 48FCC 4ABDA 4ABF8 ...
PUTPTYPE:
        ::                                       * 4B076
          BINT2                                  * 4B07B
          PutBackPPAR(_,s)                       * 4B080
        ;                                        * 4B085

* refs (5): 4ADC9 4B111 4B125 4B16B 4B18E
RclPmin:
        ::                                       * 4B08A
          BINT1                                  * 4B08F
          GETPARAM                               * 4B094
        ;                                        * 4B099

* refs (10): 1E08D 47C59 4ADA6 4AF45 4B17F 4B1A2 ...
pmin(c):
        ::                                       * 4B09E
          BINT7                                  * 4B0A3
          PutBackPPAR(_,s)                       * 4B0A8
        ;                                        * 4B0AD

* refs (5): 4ADD3 4B13E 4B152 4B1B1 4B1D4
RclPmax:
        ::                                       * 4B0B2
          BINT2                                  * 4B0B7
          GETPARAM                               * 4B0BC
        ;                                        * 4B0C1

* refs (10): 1E0AD 47C5E 4AD9C 4AF3B 4B1C5 4B1E8 ...
pmax(c):
        ::                                       * 4B0C6
          BINT6                                  * 4B0CB
          PutBackPPAR(_,s)                       * 4B0D0
        ;                                        * 4B0D5

* -> C% C%
* refs (15): 47740 4ACE8 4B256 4B56C 4B5C6 4C59E ...
GETPMIN&MAX:
        ::                                       * 4B0DA
          Chk&BreakPPAR                          * 4B0DF
          5DROP                                  * 4B0E4
          DUP                                    * 4B0E9
          TYPECMP?                               * 4B0EE
          OBJ_514C3                              * 4B0F3
          OVER                                   * 4B0F8
          TYPECMP?                               * 4B0FD
          OBJ_514C3                              * 4B102
        ;                                        * 4B107

* -> %
* refs (4): 452CC 452E0 4908F B54A8
GETXMIN:
        ::                                       * 4B10C
          RclPmin                                * 4B111
          C>Re%                                  * 4B116
        ;                                        * 4B11B

* -> %
* refs (3): 454E8 454FC B5548
GETYMIN:
        ::                                       * 4B120
          RclPmin                                * 4B125
          C%>%                                   * 4B12A
          SWAPDROP                               * 4B12F
        ;                                        * 4B134

* -> %
* refs (4): 45303 49094 B5467 B54AD
GETXMAX:
        ::                                       * 4B139
          RclPmax                                * 4B13E
          C>Re%                                  * 4B143
        ;                                        * 4B148

* -> %
* refs (1): B554D
GETYMAX:
        ::                                       * 4B14D
          RclPmax                                * 4B152
          C%>%                                   * 4B157
          SWAPDROP                               * 4B15C
        ;                                        * 4B161

* % ->
* refs (1): 47A33
PUTXMIN:
        ::                                       * 4B166
          RclPmin                                * 4B16B
          C%>%                                   * 4B170
          SWAPDROP                               * 4B175
          %>C%                                   * 4B17A
          pmin(c)                                * 4B17F
        ;                                        * 4B184

* % ->
* refs (2): 47A5B 495C9
PUTYMIN:
        ::                                       * 4B189
          RclPmin                                * 4B18E
          C%>%                                   * 4B193
          DROPSWAP                               * 4B198
          %>C%                                   * 4B19D
          pmin(c)                                * 4B1A2
        ;                                        * 4B1A7

* % ->
* refs (1): 47A38
PUTXMAX:
        ::                                       * 4B1AC
          RclPmax                                * 4B1B1
          C%>%                                   * 4B1B6
          SWAPDROP                               * 4B1BB
          %>C%                                   * 4B1C0
          pmax(c)                                * 4B1C5
        ;                                        * 4B1CA

* % ->
* refs (1): 47A60
PUTYMAX:
        ::                                       * 4B1CF
          RclPmax                                * 4B1D4
          C%>%                                   * 4B1D9
          DROPSWAP                               * 4B1DE
          %>C%                                   * 4B1E3
          pmax(c)                                * 4B1E8
        ;                                        * 4B1ED

RclPdim:
        ::                                       * 4B1F2
          GBUFF                                  * 4B1F7
          size(go)                               * 4B1FC
        ;                                        * 4B201

* refs (1): 1E210
pdim(2c):
        ::                                       * 4B206
          OBJ_46152                              * 4B20B
          SWAP2C%>%                              * 4B210
          ORDERXY%                               * 4B215
          %>C%                                   * 4B21A
          3UNROLL                                * 4B21F
          %>C%                                   * 4B224
          SWAP                                   * 4B229
          2DUP                                   * 4B22E
          swap;-(2c);c->r                        * 4B233
          DUP                                    * 4B238
          %%0=                                   * 4B23D
          3PICK                                  * 4B242
          %%0=                                   * 4B247
          ORcase                                 * 4B24C
          SETSIZEERR                             * 4B251
          GETPMIN&MAX                            * 4B256
          swap;-(2c);c->r                        * 4B25B
          ROTSWAP                                * 4B260
          %%/                                    * 4B265
          3UNROLL                                * 4B26A
          %%/                                    * 4B26F
          RclMaxStdPict                          * 4B274
          #1-                                    * 4B279
          UNCOERCE%%                             * 4B27E
          4ROLL                                  * 4B283
          %%*                                    * 4B288
          %%>%                                   * 4B28D
          COERCE                                 * 4B292
          #1+                                    * 4B297
          3UNROLL                                * 4B29C
          #1-                                    * 4B2A1
          UNCOERCE%%                             * 4B2A6
          %%*                                    * 4B2AB
          %%>%                                   * 4B2B0
          COERCE                                 * 4B2B5
          #1+                                    * 4B2BA
          MAKEPICT#                              * 4B2BF
          pmax(c)                                * 4B2C4
          pmin(c)                                * 4B2C9
        ;                                        * 4B2CE

* refs (2): 4B233 4B25B
swap;-(2c);c->r:
        ::                                       * 4B2D3
          SWAP2C%>%                              * 4B2D8
          ROTSWAP                                * 4B2DD
          %-                                     * 4B2E2
          %>%%                                   * 4B2E7
          3UNROLL                                * 4B2EC
          %-                                     * 4B2F1
          %>%%                                   * 4B2F6
        ;                                        * 4B2FB

* refs (1): 1E21A
pdim(2b):
        ::                                       * 4B300
          HXS>#                                  * 4B305
          SWAP                                   * 4B30A
          HXS>#                                  * 4B30F
          SWAP                                   * 4B314
          MAKEPICT#                              * 4B319
        ;                                        * 4B31E

* #w #h ->
* refs (3): 45F0A 4B2BF 4B319
MAKEPICT#:
        ::                                       * 4B323
          SWAP                                   * 4B328
          #       800                            * 4B32D  2048
          OVER                                   * 4B337
          #<                                     * 4B33C
          case                                   * 4B341
          SETSIZEERR                             * 4B346
          OBJ_5121F                              * 4B34B
          KILLGDISP                              * 4B350
          MAKEGROB                               * 4B355
          GROB>GDISP                             * 4B35A
        ;                                        * 4B35F

* # -> ob
* refs (7): 4AF6D 4AFA9 4AFE5 4B030 4B06C 4B094 ...
GETPARAM:
        ::                                       * 4B364
          CHECKPVARS                             * 4B369
          SWAP                                   * 4B36E
          NTHCOMPDROP                            * 4B373
        ;                                        * 4B378

* refs (2): 4AF95 4AFD1
ChkPut('PPAR',li,s):
        ::                                       * 4B37D
          ROMPTR  0F1 03C                        * 4B382
        ;                                        * 4B38D

* refs (1): 8D02B
OBJ_4B392:
        ::                                       * 4B392
          DROP                                   * 4B397
          DUPTYPEIDNT?                           * 4B39C
          NcaseTYPEERR                           * 4B3A1
          OVER                                   * 4B3A6
          PPAR(s);dup;li?                        * 4B3AB
          ITE                                    * 4B3B0
          ::                                     * 4B3B5
            ICMPDRPRTDRP                         * 4B3BA
            THREE{}N                             * 4B3BF
          ;                                      * 4B3C4
          DROP                                   * 4B3C9
          BINT8                                  * 4B3CE
          ROT#-                                  * 4B3D3
          PutBackPPAR(_,s)                       * 4B3D8
        ;                                        * 4B3DD

* refs (1): 8D03A
OBJ_4B3E2:
        ::                                       * 4B3E2
          DROP                                   * 4B3E7
          DUPTYPEREAL?                           * 4B3EC
          3PICK                                  * 4B3F1
          TYPEREAL?                              * 4B3F6
          AND                                    * 4B3FB
          NcaseTYPEERR                           * 4B400
          3PICK                                  * 4B405
          PPAR(s);dup;li?                        * 4B40A
          ?CARCOMP                               * 4B40F
          3UNROLL                                * 4B414
          OBJ_4B441                              * 4B419
        ;                                        * 4B41E

* refs (7): 45060 45092 4654F 4B3AB 4B40A B60C6 ...
PPAR(s);dup;li?:
        ::                                       * 4B423
          CHECKPVARS                             * 4B428
          SWAP                                   * 4B42D
          NTHCOMPDROP                            * 4B432
          DUPTYPELIST?                           * 4B437
        ;                                        * 4B43C

* refs (1): 4B419
OBJ_4B441:
        ::                                       * 4B441
          THREE{}N                               * 4B446
          BINT8                                  * 4B44B
          ROT#-                                  * 4B450
          PutBackPPAR(_,s)                       * 4B455
        ;                                        * 4B45A

* refs (1): 4C58F
sort(2r):
        ::                                       * 4B45F
          %MAXorder                              * 4B464
          SWAP                                   * 4B469
        ;                                        * 4B46E

        ::                                       * 4B473
          TakeOver                               * 4B478
          REPEATERCH                             * 4B47D
          BINT11                                 * 4B482
          OBJ_0C758                              * 4B487
        ;                                        * 4B48C

        ::                                       * 4B491
          TakeOver                               * 4B496
          REPEATERCH                             * 4B49B
          BINT16                                 * 4B4A0
          OBJ_6F810                              * 4B4A5
        ;                                        * 4B4AA

        ::                                       * 4B4AF
          TakeOver                               * 4B4B4
          REPEATERCH                             * 4B4B9
          BINT17                                 * 4B4BE
          OBJ_6F85B                              * 4B4C3
        ;                                        * 4B4C8

        ::                                       * 4B4CD
          TakeOver                               * 4B4D2
          REPEATERCH                             * 4B4D7
          BINT18                                 * 4B4DC
          OBJ_4618C                              * 4B4E1
        ;                                        * 4B4E6

* refs (3): 48A1C 4BB6B 4BE6D
OBJ_4B4EB:
        ::                                       * 4B4EB
          ERROR@                                 * 4B4F0
          #0=case                                * 4B4F5
          ExitAtLOOP                             * 4B4FA
          18GETLAM                               * 4B4FF
          ABND                                   * 4B504
          ABND                                   * 4B509
          RESETDEPTH                             * 4B50E
          INDEPVAR                               * 4B513
          ?PURGE_HERE                            * 4B518
          ERRJMP                                 * 4B51D
        ;                                        * 4B522

* refs (1): 4A9FB
OBJ_4B527:
        ::                                       * 4B527
          BINT4                                  * 4B52C
          EQUAL                                  * 4B531
          OBJ_514C3                              * 4B536
          OBJ_4C6E3                              * 4B53B
          OBJ_4EF0A                              * 4B540
        ;                                        * 4B545
        BSS     9                                * 4B54A

* refs (3): 1E15F 47B14 4812F
VSCALE:
        ::                                       * 4B553
          DUP                                    * 4B558
          %0>                                    * 4B55D
          NcaseSIZEERR                           * 4B562
          RclCenter                              * 4B567
          GETPMIN&MAX                            * 4B56C
          C%>%                                   * 4B571
          5PICK                                  * 4B576
          %*                                     * 4B57B
          %>C%                                   * 4B580
          pmax(c)                                * 4B585
          C%>%                                   * 4B58A
          4ROLL                                  * 4B58F
          %*                                     * 4B594
          %>C%                                   * 4B599
          pmin(c)                                * 4B59E
          centr(c)                               * 4B5A3
        ;                                        * 4B5A8

* refs (3): 1E17F 47B23 48107
HSCALE:
        ::                                       * 4B5AD
          DUP                                    * 4B5B2
          %0>                                    * 4B5B7
          NcaseSIZEERR                           * 4B5BC
          RclCenter                              * 4B5C1
          GETPMIN&MAX                            * 4B5C6
          C%>%                                   * 4B5CB
          SWAP                                   * 4B5D0
          5PICK                                  * 4B5D5
          %*                                     * 4B5DA
          SWAP%>C%                               * 4B5DF
          pmax(c)                                * 4B5E4
          C%>%                                   * 4B5E9
          SWAP4ROLL                              * 4B5EE
          %*                                     * 4B5F3
          SWAP%>C%                               * 4B5F8
          pmin(c)                                * 4B5FD
          centr(c)                               * 4B602
        ;                                        * 4B607

* ->
* refs (5): 1E269 20151 4DAB2 8B812 B6358
DOERASE:
        ::                                       * 4B60C
          GBUFF                                  * 4B611
          ZEROZERO                               * 4B616
          OBJ_472D1                              * 4B61B
          SWAP                                   * 4B620
          GROB!ZERODRP                           * 4B625
        ;                                        * 4B62A

* refs (2): 4C62A 7387D
OBJ_4B62F:
        ::                                       * 4B62F
          1stArgb(ex)                            * 4B634
          SYMBN                                  * 4B639
        ;                                        * 4B63E

* refs (1): 041C5
OBJ_4B643:
        ::                                       * 4B643
          IT                                     * 4B648
          ShowInvRomp                            * 4B64D
        ;                                        * 4B652
        NIBHEX  00000                            * 4B657  ..

* refs (3): 1E19A 20156 4C305
draw:
        ::                                       * 4B65C
          GDISPCENTER                            * 4B661
          TURNMENUOFF                            * 4B666
          GETPTYPE                               * 4B66B
          DUP                                    * 4B670
          OBJ_7312B                              * 4B675
          IT                                     * 4B67A
          ::                                     * 4B67F
            EVAL                                 * 4B684
            NOT?SEMI                             * 4B689
            OBJ_73153                            * 4B68E
            RDROP                                * 4B693
            EVAL                                 * 4B698
          ;                                      * 4B69D
          DROP                                   * 4B6A2
          PLOTPREP                               * 4B6A7
          DROP                                   * 4B6AC
          OBJ_4B99F                              * 4B6B1
          ABND                                   * 4B6B6
          ABND                                   * 4B6BB
        ;                                        * 4B6C0

* refs (9): 8C894 8C964 8CA93 8CBD7 8CCBB 8CD9F ...
OBJ_4B6C5:
        ::                                       * 4B6C5
          '                                      * 4B6CA
          OBJ_5135F                              * 4B6CF
        ;                                        * 4B6D4

* refs (1): 4C535
PLOTERR:
        ::                                       * 4B6D9
          ERROR@                                 * 4B6DE
          #0=case                                * 4B6E3
          ExitAtLOOP                             * 4B6E8
          18GETLAM                               * 4B6ED
          ABND                                   * 4B6F2
          ABND                                   * 4B6F7
          RESETDEPTH                             * 4B6FC
          OBJ_4C0E4                              * 4B701
          ERRJMP                                 * 4B706
        ;                                        * 4B70B

* ob1..obn obn+1..obx #n -> ob1..obn
* refs (22): 48A30 4B50E 4B6FC 4BB84 4BE86 4C54E ...
RESETDEPTH:
        ::                                       * 4B710
          DEPTH                                  * 4B715
          #1-SWAP                                * 4B71A
          OBJ_6C339                              * 4B71F
          NDROP                                  * 4B724
          CK0NOLASTWD                            * 4B729
        ;                                        * 4B72E

* refs (2): 4C62F 73882
OBJ_4B733:
        ::                                       * 4B733
          1stArgRpn(ex)                          * 4B738
          SYMBN                                  * 4B73D
        ;                                        * 4B742

* refs (2): 4BBC5 4EDCF
OBJ_4B747:
        ::                                       * 4B747
          OBJ_50D02                              * 4B74C
          OBJ_47858                              * 4B751
          IT                                     * 4B756
          GETRHS                                 * 4B75B
        ;                                        * 4B760

* refs (3): 488BE 4B6A7 8A4EB
PLOTPREP:
        ::                                       * 4B765
          StatPlotMo                             * 4B76A
          case                                   * 4B76F
          ::                                     * 4B774
            rclä!                                * 4B779
            DROPONE                              * 4B77E
            OBJ_4A874                            * 4B783
          ;                                      * 4B788
          DORCLE                                 * 4B78D
          DUP                                    * 4B792
          EqList?                                * 4B797
          ITE                                    * 4B79C
          LENCOMP                                * 4B7A1
          DROPONE                                * 4B7A6
          OBJ_6FFFD                              * 4B7AB
          OVER                                   * 4B7B0
          TYPEREAL?                              * 4B7B5
          NOT?SEMI                               * 4B7BA
          OVER                                   * 4B7BF
          %0<                                    * 4B7C4
          case                                   * 4B7C9
          SETINVPPAR                             * 4B7CE
        ;                                        * 4B7D3

* refs (5): 488EB 4B80A 4B9A4 4D1BE 8B7AE
GetRes:
        ::                                       * 4B7D8
          DUP                                    * 4B7DD
          TYPEHSTR?                              * 4B7E2
          case                                   * 4B7E7
          ::                                     * 4B7EC
            HXS>#                                * 4B7F1
            DUP#0=                               * 4B7F6
            casedrop                             * 4B7FB
            ::                                   * 4B800
              %0_2A2B4                           * 4B805
              GetRes                             * 4B80A
            ;                                    * 4B80F
            UNCOERCE%%                           * 4B814
            %%1                                  * 4B819
            10GETLAM                             * 4B81E
            %%/                                  * 4B823
            %%*                                  * 4B828
            %%>%                                 * 4B82D
          ;                                      * 4B832
          DUP                                    * 4B837
          %0<>                                   * 4B83C
          ?SEMIDROP                              * 4B841
          11GETLAM                               * 4B846
          OBJ_7313F                              * 4B84B
          case                                   * 4B850
          EVAL                                   * 4B855
          %%1                                    * 4B85A
          10GETLAM                               * 4B85F
          %%/>%                                  * 4B864
        ;                                        * 4B869

        ::                                       * 4B86E
          EXITFCNsto                             * 4B873
          ERRJMP                                 * 4B878
        ;                                        * 4B87D

* refs (1): 6D195
OBJ_4B882:
        ::                                       * 4B882
          SKIP                                   * 4B887
          2DROP                                  * 4B88C
          OBJ_67DFC                              * 4B891
          LENHXS                                 * 4B896
          #5=                                    * 4B89B
          ITE                                    * 4B8A0
          BINT3                                  * 4B8A5
          BINT4                                  * 4B8AA
          #=case                                 * 4B8AF
          OBJ_6E00B                              * 4B8B4
        ;                                        * 4B8B9

* refs (1): 6D89B
OBJ_4B8BE:
        ::                                       * 4B8BE
          SKIP                                   * 4B8C3
          OBJ_6F40F                              * 4B8C8
          BINT3                                  * 4B8CD
          #=casedrop                             * 4B8D2
          ::                                     * 4B8D7
            BINT1                                * 4B8DC
            OBJ_67E0C                            * 4B8E1
            OBJ_65D14                            * 4B8E6
            OBJ_68593                            * 4B8EB
            OBJ_67416                            * 4B8F0
            #1+                                  * 4B8F5
            OBJ_67443                            * 4B8FA
            OBJ_679A1                            * 4B8FF
            OBJ_6D779                            * 4B904
            OBJ_44C4B                            * 4B909
            OBJ_68245                            * 4B90E
          ;                                      * 4B913
          BINT5                                  * 4B918
          OBJ_6E113                              * 4B91D
        ;                                        * 4B922

* refs (1): 3FE3A
OBJ_4B927:
        ::                                       * 4B927
          EVAL                                   * 4B92C
          BINT7                                  * 4B931
          GETDF                                  * 4B936
          EQLookup                               * 4B93B
          DROP                                   * 4B940
        ;                                        * 4B945

* refs (1): 54698
OBJ_4B94A:
        ::                                       * 4B94A
          DOBIND                                 * 4B94F
          CK0NOLASTWD                            * 4B954
        ;                                        * 4B959

* refs (1): 6CB93
OBJ_4B95E:
        GROB    "images/4B95E.png"               * 4B95E  3 x 6

* refs (1): 6D492
OBJ_4B97E:
        GROB    "images/4B97E.png"               * 4B97E  6 x 6
        NIBHEX  0                                * 4B99E

* refs (1): 4B6B1
OBJ_4B99F:
        ::                                       * 4B99F
          GetRes                                 * 4B9A4
          4PUTLAM                                * 4B9A9
          11GETLAM                               * 4B9AE
          OBJ_73153                              * 4B9B3
          EVAL                                   * 4B9B8
        ;                                        * 4B9BD

* refs (5): 21092 4BC3D 4BD41 4C33C 4C5EE
rcl(nm)?;drop:
        ::                                       * 4B9C2
          DRPExitAtLOOP                          * 4B9C7
          DROP                                   * 4B9CC
        ;                                        * 4B9D1

* refs (3): 488F5 4BB07 5192E
OBJ_4B9D6:
        ::                                       * 4B9D6
          INDEPVAR                               * 4B9DB
          SAFE@_HERE                             * 4B9E0
          NOT?SEMI                               * 4B9E5
          DUPTYPEEXT?                            * 4B9EA
          NOTcaseDROP                            * 4B9EF
          %1                                     * 4B9F4
          SWAP                                   * 4B9F9
          UM>U                                   * 4B9FE
          19PUTLAM                               * 4BA03
        ;                                        * 4BA08

* refs (1): 8CA20
OBJ_4BA0D:
        ::                                       * 4BA0D
          BINT31                                 * 4BA12
          TestSysFlag                            * 4BA17
          ITE                                    * 4BA1C
          ::                                     * 4BA21
            '                                    * 4BA26
            OBJ_4CDD9                            * 4BA2B
          ;                                      * 4BA30
          ::                                     * 4BA35
            '                                    * 4BA3A
            OBJ_4C382                            * 4BA3F
          ;                                      * 4BA44
          3PUTLAM                                * 4BA49
          COLA                                   * 4BA4E
          OBJ_4BAAD                              * 4BA53
        ;                                        * 4BA58

* refs (1): 8C821
OBJ_4BA5D:
        ::                                       * 4BA5D
          BINT31                                 * 4BA62
          TestSysFlag                            * 4BA67
          ITE                                    * 4BA6C
          ::                                     * 4BA71
            '                                    * 4BA76
            OBJ_4CE0B                            * 4BA7B
          ;                                      * 4BA80
          ::                                     * 4BA85
            '                                    * 4BA8A
            OBJ_4C34B                            * 4BA8F
          ;                                      * 4BA94
          3PUTLAM                                * 4BA99
          COLA                                   * 4BA9E
          OBJ_4BAAD                              * 4BAA3
        ;                                        * 4BAA8

* refs (3): 4BA53 4BAA3 4BEE5
OBJ_4BAAD:
        ::                                       * 4BAAD
          DUP#1=                                 * 4BAB2
          IT                                     * 4BAB7

* refs (2): 4692D 4BF94
OBJ_4BABC:
          ::                                     * 4BABC
            rceq!                                * 4BAC1
            OBJ_47858                            * 4BAC6
            NOTcaseDROP                          * 4BACB
            OBJ_4D97F                            * 4BAD0
            DUPLENCOMP                           * 4BAD5
            #1=                                  * 4BADA
            NOTcase2drop                         * 4BADF
            BINT2                                * 4BAE4
            INCOMPDROP                           * 4BAE9
            TYPEIDNT?                            * 4BAEE
            ?SEMI                                * 4BAF3
            DROP                                 * 4BAF8
            BINT2                                * 4BAFD
          ;                                      * 4BB02
          OBJ_4B9D6                              * 4BB07
          OBJ_4C314                              * 4BB0C
          ZERO_DO                                * 4BB11
          ERRSET                                 * 4BB16
          ::                                     * 4BB1B
            15GETLAM                             * 4BB20
            17GETLAM                             * 4BB25
            NEWINDEP                             * 4BB2A
            OBJ_4ED70                            * 4BB2F
            19GETLAM                             * 4BB34
            TYPEEXT?                             * 4BB39
            ITE                                  * 4BB3E
            OBJ_4BC06                            * 4BB43
            OBJ_4C12A                            * 4BB48
            BINT28                               * 4BB4D
            TestSysFlag                          * 4BB52
            IT                                   * 4BB57
            ExitAtLOOP                           * 4BB5C
          ;                                      * 4BB61
          ERRTRAP                                * 4BB66
          OBJ_4B4EB                              * 4BB6B
          OBJ_4C082                              * 4BB70
          LOOP                                   * 4BB75
          ATTNFLGCLR                             * 4BB7A
          18GETLAM                               * 4BB7F
          RESETDEPTH                             * 4BB84
          INDEPVAR                               * 4BB89
          ?PURGE_HERE                            * 4BB8E
        ;                                        * 4BB93

* refs (1): 4EDA2
OBJ_4BB98:
        ::                                       * 4BB98
          ISTOP@                                 * 4BB9D
          OBJ_4A96E                              * 4BBA2
          ZERO_DO                                * 4BBA7
          '                                      * 4BBAC
          '                                      * 4BBB1
          OBJ_4BF71                              * 4BBB6
          ITE                                    * 4BBBB
          OBJ_4C616                              * 4BBC0
          OBJ_4B747                              * 4BBC5
          OBJ_4BEEF                              * 4BBCA
          BINT6                                  * 4BBCF
          ::N                                    * 4BBD4
          LOOP                                   * 4BBD9
          ISTOP@                                 * 4BBDE
          #3+                                    * 4BBE3
          ::N                                    * 4BBE8
          2PUTLAM                                * 4BBED
        ;                                        * 4BBF2
        BSS     15                               * 4BBF7

* refs (2): 48A08 4BB43
OBJ_4BC06:
        ::                                       * 4BC06
          15GETLAM                               * 4BC0B
          TOTEMPOB                               * 4BC10
          19GETLAM                               * 4BC15
          INDEPVAR                               * 4BC1A
          DUP                                    * 4BC1F
          PURGE                                  * 4BC24
          3UNROLL                                * 4BC29
          UM>U                                   * 4BC2E
          OVER                                   * 4BC33
          CREATE                                 * 4BC38
          rcl(nm)?;drop                          * 4BC3D
          19PUTLAM                               * 4BC42
          BEGIN                                  * 4BC47
          2GETLAM                                * 4BC4C
          EVAL                                   * 4BC51
          NEXTSTEP                               * 4BC56
          OBJ_4C111                              * 4BC5B
          LASTPT?                                * 4BC60
          UNTIL                                  * 4BC65
          PlotOneMore?                           * 4BC6A
          NOT?SEMI                               * 4BC6F
          2GETLAM                                * 4BC74
          EVAL                                   * 4BC79
        ;                                        * 4BC7E

* refs (1): 8C94B
OBJ_4BC83:
        ::                                       * 4BC83
          OBJ_4C314                              * 4BC88
          ZERO_DO                                * 4BC8D
          ERRSET                                 * 4BC92
          ::                                     * 4BC97
            uncrunch                             * 4BC9C
            ::                                   * 4BCA1
              15GETLAM                           * 4BCA6
              17GETLAM                           * 4BCAB
              NEWINDEP                           * 4BCB0
              OBJ_50D02                          * 4BCB5
              DUPTYPESYMB?                       * 4BCBA
              NOTcase                            * 4BCBF
              doerr607                           * 4BCC4
              BINT31                             * 4BCC9
              TestSysFlag                        * 4BCCE
              ITE                                * 4BCD3
              ::                                 * 4BCD8
                '                                * 4BCDD
                OBJ_4C7D3                        * 4BCE2
              ;                                  * 4BCE7
              ::                                 * 4BCEC
                '                                * 4BCF1
                OBJ_4C846                        * 4BCF6
              ;                                  * 4BCFB
              3PUTLAM                            * 4BD00
              OBJ_4D96B                          * 4BD05
              INDEPVAR                           * 4BD0A
              DUP                                * 4BD0F
              15PUTLAM                           * 4BD14
              OBJ_5956F                          * 4BD19
              15GETLAM                           * 4BD1E
              STO                                * 4BD23
              OBJ_591E9                          * 4BD28
              17GETLAM                           * 4BD2D
              15GETLAM                           * 4BD32
              XEQSTOID                           * 4BD37
              15GETLAM                           * 4BD3C
              rcl(nm)?;drop                      * 4BD41
              15PUTLAM                           * 4BD46
              ITE                                * 4BD4B
              ::                                 * 4BD50
                BINT2                            * 4BD55
                OBJ_4A96E                        * 4BD5A
                DROP                             * 4BD5F
                DUP                              * 4BD64
                OBJ_513D7                        * 4BD69
                SWAP                             * 4BD6E
                OBJ_513FF                        * 4BD73
                '                                * 4BD78
                15GETLAM                         * 4BD7D
                '                                * 4BD82
                GETXPOS                          * 4BD87
                '                                * 4BD8C
                1PUTLAM                          * 4BD91
                4ROLL                            * 4BD96
                OBJ_4BEEF                        * 4BD9B
                SWAPDROP                         * 4BDA0
                ONESWAP                          * 4BDA5
                4ROLLDROP                        * 4BDAA
                BINT1                            * 4BDAF
                4UNROLL                          * 4BDB4
                BINT9                            * 4BDB9
                ROLL                             * 4BDBE
                OBJ_4BEEF                        * 4BDC3
                SWAPDROP                         * 4BDC8
                BINT2                            * 4BDCD
                SWAP                             * 4BDD2
                4ROLLDROP                        * 4BDD7
                BINT2                            * 4BDDC
                4UNROLL                          * 4BDE1
                BINT13                           * 4BDE6
              ;                                  * 4BDEB
              ::                                 * 4BDF0
                BINT1                            * 4BDF5
                OBJ_4A96E                        * 4BDFA
                DROP                             * 4BDFF
                '                                * 4BE04
                15GETLAM                         * 4BE09
                '                                * 4BE0E
                GETXPOS                          * 4BE13
                '                                * 4BE18
                1PUTLAM                          * 4BE1D
                4ROLL                            * 4BE22
                OBJ_4BEEF                        * 4BE27
                SWAPDROP                         * 4BE2C
                ONESWAP                          * 4BE31
                4ROLLDROP                        * 4BE36
                BINT1                            * 4BE3B
                4UNROLL                          * 4BE40
                BINT8                            * 4BE45
              ;                                  * 4BE4A
              ::N                                * 4BE4F
              2PUTLAM                            * 4BE54
              OBJ_4C12A                          * 4BE59
            ;                                    * 4BE5E
          ;                                      * 4BE63
          ERRTRAP                                * 4BE68
          OBJ_4B4EB                              * 4BE6D
          OBJ_4C082                              * 4BE72
          LOOP                                   * 4BE77
          ATTNFLGCLR                             * 4BE7C
          18GETLAM                               * 4BE81
          RESETDEPTH                             * 4BE86
          INDEPVAR                               * 4BE8B
          ?PURGE_HERE                            * 4BE90
        ;                                        * 4BE95
        NIBHEX  00000                            * 4BE9A  ..

* refs (1): 8CB64
OBJ_4BE9F:
        ::                                       * 4BE9F
          BINT31                                 * 4BEA4
          TestSysFlag                            * 4BEA9
          ITE                                    * 4BEAE
          ::                                     * 4BEB3
            '                                    * 4BEB8
            OBJ_4C3B9                            * 4BEBD
          ;                                      * 4BEC2
          ::                                     * 4BEC7
            '                                    * 4BECC
            OBJ_4C3E6                            * 4BED1
          ;                                      * 4BED6
          3PUTLAM                                * 4BEDB
          COLA                                   * 4BEE0
          OBJ_4BAAD                              * 4BEE5
        ;                                        * 4BEEA

* refs (4): 4BBCA 4BD9B 4BDC3 4BE27
OBJ_4BEEF:
        ::                                       * 4BEEF
          INDEX@                                 * 4BEF4
          #1+                                    * 4BEF9
          BINT31                                 * 4BEFE
          TestSysFlag                            * 4BF03
          ITE                                    * 4BF08
          ::                                     * 4BF0D
            '                                    * 4BF12
            ::                                   * 4BF17
              DROP                               * 4BF1C
              COLA                               * 4BF21
              OBJ_5135F                          * 4BF26
            ;                                    * 4BF2B
          ;                                      * 4BF30
          ::                                     * 4BF35
            '                                    * 4BF3A
            OBJ_4EF73                            * 4BF3F
          ;                                      * 4BF44
          INDEX@                                 * 4BF49
          #1+                                    * 4BF4E
          3GETLAM                                * 4BF53
        ;                                        * 4BF58

* refs (2): 4D3B7 4D6D2
OBJ_4BF5D:
        ::                                       * 4BF5D
          IT                                     * 4BF62
          OBJ_0C7F3                              * 4BF67
        ;                                        * 4BF6C

* refs (3): 4BBB6 4EDC0 7384B
OBJ_4BF71:
        ::                                       * 4BF71
          EQUATION                               * 4BF76
          NOTcase                                * 4BF7B
          FALSE                                  * 4BF80
          TYPELIST?                              * 4BF85
          caseFALSE                              * 4BF8A
          BINT1                                  * 4BF8F
          OBJ_4BABC                              * 4BF94
          #1=case                                * 4BF99
          FALSE                                  * 4BF9E
          TRUE                                   * 4BFA3
        ;                                        * 4BFA8
        NIBHEX  0                                * 4BFAD

* refs (3): 4BC56 4C13E 4C50D
NEXTSTEP:
        ::                                       * 4BFAE
          15GETLAM                               * 4BFB3
          DUP                                    * 4BFB8
          4GETLAM                                * 4BFBD
          %+                                     * 4BFC2
          2DUP                                   * 4BFC7
          %=                                     * 4BFCC
          IT                                     * 4BFD1
          ::                                     * 4BFD6
            DUP                                  * 4BFDB
            OBJ_4C003                            * 4BFE0
            DUP                                  * 4BFE5
            4PUTLAM                              * 4BFEA
            %+                                   * 4BFEF
          ;                                      * 4BFF4
          NEWINDEP                               * 4BFF9
        ;                                        * 4BFFE

* refs (1): 4BFE0
OBJ_4C003:
        ::                                       * 4C003
          DUP%0=                                 * 4C008
          casedrop                               * 4C00D
          ::                                     * 4C012
            %10                                  * 4C017

%4.99E2:
            %       4.99E2                       * 4C01C
            %CHS                                 * 4C031
            %^                                   * 4C036
          ;                                      * 4C03B
          %EXPONENT                              * 4C040
          %11                                    * 4C045
          %-                                     * 4C04A

%4.99E2_4C04F:
          %       4.99E2                         * 4C04F
          %CHS                                   * 4C064
          %MAX                                   * 4C069
          %10                                    * 4C06E
          SWAP                                   * 4C073
          %^                                     * 4C078
        ;                                        * 4C07D
