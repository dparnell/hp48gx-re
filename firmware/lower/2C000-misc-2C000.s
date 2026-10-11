* HP 48GX ROM revision R, #2C000-#2E0A8: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: 1+(rr) ChkReakäPAR LAMLNAME LAMPKNO rclä PUTAB0 LAMKRM LAMKP GETCD0 STATGETXCOL RclXYCol&äDAT LAMRETRY
* Follows on from the previous file (at #2C000 in the original ROM).
        D0=D0+  5                                * 2C000
        B=A     A                                * 2C003
        A=DAT0  W                                * 2C005
        D0=D0+  16                               * 2C009
        B=A     S                                * 2C00C
        A=0     S                                * 2C00F
        ABEX    W                                * 2C012
        RTN                                      * 2C015

* refs (4): 37353 7D469 87C37 89240
Get1%CD:
        C=DAT1  A                                * 2C017
        D1=D1+  5                                * 2C01A
        D=C     A                                * 2C01D
        C=DAT1  W                                * 2C01F
        D1=D1+  16                               * 2C023
        D=C     S                                * 2C026
        C=0     S                                * 2C029
        DCEX    W                                * 2C02C
        RTN                                      * 2C02F

* refs (7): 7865D 87C8A 89293 9945F 99761 CB42E ...
GETCD0:
        C=DAT0  A                                * 2C031
        D0=D0+  5                                * 2C034
        D=C     A                                * 2C037
        C=DAT0  W                                * 2C039
        D0=D0+  16                               * 2C03D
        D=C     S                                * 2C040
        C=0     S                                * 2C043
        DCEX    W                                * 2C046
        RTN                                      * 2C049

* refs (7): 786BC 7D5AC 7DA04 87C1C 89225 9943A ...
PUTAB0:
        DAT0=A  A                                * 2C04B
        D0=D0+  5                                * 2C04E
        ABEX    W                                * 2C051
        A=B     S                                * 2C054
        DAT0=A  W                                * 2C057
        D0=D0+  16                               * 2C05B
        A=0     S                                * 2C05E
        ABEX    W                                * 2C061
        RTN                                      * 2C064

* refs (5): 373E7 37405 87C0F 89218 CB3F0
PutAB%1:
        DAT1=A  A                                * 2C066
        D1=D1+  5                                * 2C069
        ABEX    W                                * 2C06C
        A=B     S                                * 2C06F
        DAT1=A  W                                * 2C072
        D1=D1+  16                               * 2C076
        A=0     S                                * 2C079
        ABEX    W                                * 2C07C
        RTN                                      * 2C07F
        NIBHEX  AB21000                          * 2C081  º..

LIB006:
        CON(3)  #006                             * 2C088  library number
        CON(5)  0                                * 2C08B  hash table
        REL(5)  LIB006.message                   * 2C090  message table
        CON(5)  0                                * 2C095  link table
        CON(5)  0                                * 2C09A  config
        RPL

* refs (1): 20049
utpn(3r):
        ::                                       * 2C09F
          OVER                                   * 2C0A4
          %0<                                    * 2C0A9
          case                                   * 2C0AE
          SETSIZEERR                             * 2C0B3
          OVER                                   * 2C0B8
          %0=                                    * 2C0BD
          case                                   * 2C0C2
          ::                                     * 2C0C7
            SWAPDROP                             * 2C0CC
            %>                                   * 2C0D1
            case                                 * 2C0D6
            %1                                   * 2C0DB
            %0_2A2B4                             * 2C0E0
          ;                                      * 2C0E5
          ROT                                    * 2C0EA
          %>%%-                                  * 2C0EF
          SWAP                                   * 2C0F4
          %>%%SQRT                               * 2C0F9
          %%/                                    * 2C0FE
          CODE                                   * 2C103  28 nibbles
            GOSBVL  SUB_77EA8                    * 2C10D
            GOSBVL  SUB_77EBC                    * 2C114
L_2C11B:
            GOSBVL  PACK                         * 2C11B
            GOVLNG  PUSH%LOOP                    * 2C122
          ENDCODE                                * 2C129
        ;                                        * 2C129

* refs (1): 20029
utpn(2r):
        ::                                       * 2C12E
          SWAP                                   * 2C133
          %0_2A2B4                               * 2C138
          CODE                                   * 2C13D  18 nibbles
            GOSBVL  SUB_77E62                    * 2C147
            GOSBVL  SUB_78167                    * 2C14E
            GOTO    L_2C11B                      * 2C155
          ENDCODE                                * 2C159
        ;                                        * 2C159

* refs (1): 20069
utpf(3r):
        ::                                       * 2C15E
          3UNROLL                                * 2C163
          CODE                                   * 2C168  18 nibbles
            GOSBVL  SUB_77E62                    * 2C172
            GOSBVL  SUB_7827D                    * 2C179
            GOTO    L_2C11B                      * 2C180
          ENDCODE                                * 2C184
        ;                                        * 2C184

* refs (1): 20089
utpt(2r):
        ::                                       * 2C189
          SWAP                                   * 2C18E
          %0_2A2B4                               * 2C193
          CODE                                   * 2C198  18 nibbles
            GOSBVL  SUB_77E62                    * 2C1A2
            GOSBVL  SUB_78077                    * 2C1A9
            GOTO    L_2C11B                      * 2C1B0
          ENDCODE                                * 2C1B4
        ;                                        * 2C1B4

* refs (2): 0FBC4 0FC55
%%1E2:
        %%      1E2                              * 2C1B9

* refs (20): 2B25F 2B28C 2B2C8 528A4 912B6 91D65 ...
1+(rr):
        ::                                       * 2C1D3
          %%1                                    * 2C1D8
          %%+                                    * 2C1DD
        ;                                        * 2C1E2
        BSS     12                               * 2C1E7

* ob ->
* refs (1): 1FD1A
STATSTO:
        ::                                       * 2C1F3
          '                                      * 2C1F8

* ID SIGMADAT
* refs (6): 2C220 2C239 2C252 2C29D C5399 C53A3
ID_SIGMADAT:
          ID      ΣDAT                           * 2C1FD
          XEQSTOID                               * 2C20C
        ;                                        * 2C211

* refs (3): 2C301 2C356 2C374
Sto@ä:
        ::                                       * 2C216
          '                                      * 2C21B
          ID_SIGMADAT                            * 2C220
          STOAPPLDATA                            * 2C225
        ;                                        * 2C22A

* ->
* refs (4): 1FD35 2C45F B579D B7D65
STATCLST:
        ::                                       * 2C22F
          '                                      * 2C234
          ID_SIGMADAT                            * 2C239
          ?PURGE_HERE                            * 2C23E
        ;                                        * 2C243

* refs (1): 2C45A
OBJ_2C248:
        ::                                       * 2C248
          '                                      * 2C24D
          ID_SIGMADAT                            * 2C252
          dup;Vector*­Rcl(nm)?                   * 2C257
          SWAPDROP                               * 2C25C
          NOT?SEMI                               * 2C261
          ?PURGE_HERE                            * 2C266
        ;                                        * 2C26B

* -> ob
* refs (5): 2C2DE 2C338 2C379 2C53A 50E18
STATRCL:
        ::                                       * 2C270
          Exist@äDAT?                            * 2C275
          NOTcaseFALSE                           * 2C27A
          DUPTYPEIDNT?                           * 2C27F
          casedrpfls                             * 2C284
          TRUE                                   * 2C289
        ;                                        * 2C28E

* refs (5): 0C7DF 2C275 2C2B1 B5774 B7D3C
Exist@äDAT?:
        ::                                       * 2C293
          '                                      * 2C298
          ID_SIGMADAT                            * 2C29D
          OBJ_4735A                              * 2C2A2
        ;                                        * 2C2A7

* refs (3): 1FD50 2C2CA 4B779
rclä!:
        ::                                       * 2C2AC
          Exist@äDAT?                            * 2C2B1
          ?SEMI                                  * 2C2B6
          OBJ_2D2C7                              * 2C2BB
        ;                                        * 2C2C0

* refs (8): 200CE 2C428 2C5F8 2C7EC 2C9F9 48E32 ...
rclä:
        ::                                       * 2C2C5
          rclä!                                  * 2C2CA
          OBJ_2D252                              * 2C2CF
        ;                                        * 2C2D4

* refs (1): 1FD70
ä+(r):
        ::                                       * 2C2D9
          STATRCL                                * 2C2DE
          NOTcase                                * 2C2E3

Stoä(r):
          ::                                     * 2C2E8
            ONEONE                               * 2C2ED
            TWO{}N                               * 2C2F2
            SWAP                                 * 2C2F7
            MAKEARRY                             * 2C2FC
            Sto@ä                                * 2C301
          ;                                      * 2C306
          OBJ_2D252                              * 2C30B
          MDIMSDROP                              * 2C310
          SWAPDROP                               * 2C315
          UNCOERCE                               * 2C31A
          XEQ>VECTOR                             * 2C31F
          xSIGMA+                                * 2C324
        ;                                        * 2C329

* refs (3): 1FD7A B57A2 B7D6A
å-:
        ::                                       * 2C32E
          dup;ra?#BAT!                           * 2C333
          STATRCL                                * 2C338
          ?GOTO                                  * 2C33D
          L_2C392                                * 2C342
          DUP                                    * 2C347
          MDIMS                                  * 2C34C
          case2drop                              * 2C351
          Sto@ä                                  * 2C356
          BINT1                                  * 2C35B
          OVER                                   * 2C360
          TWO{}N                                 * 2C365
          %0_2A2B4                               * 2C36A
          MAKEARRY                               * 2C36F
          Sto@ä                                  * 2C374
          STATRCL                                * 2C379
          DROPSWAP                               * 2C37E
          BINT0                                  * 2C383
          GOTO                                   * 2C388
          L_2C3E7                                * 2C38D
L_2C392:
          OBJ_2D252                              * 2C392
          OVER                                   * 2C397
          MDIMS                                  * 2C39C
          ?SKIP                                  * 2C3A1
          ONESWAP                                * 2C3A6
          3PICK                                  * 2C3AB
          MDIMSDROP                              * 2C3B0
          3PICK                                  * 2C3B5
          #<>                                    * 2C3BA
          caseSIZEERR                            * 2C3BF
          ROT#+                                  * 2C3C4
          SWAP                                   * 2C3C9
          TWO{}N                                 * 2C3CE
          @rdm(ar,ls)                            * 2C3D3
          OVERARSIZE                             * 2C3D8
          OVERARSIZE                             * 2C3DD
          OVER#-                                 * 2C3E2
L_2C3E7:
          4UNROLL                                * 2C3E7
          #1+_ONE_DO                             * 2C3EC
          SWAPINDEX@                             * 2C3F1
          PULLREALEL                             * 2C3F6
          ROTSWAP                                * 2C3FB
          4PICK                                  * 2C400
          INDEX@                                 * 2C405
          #+                                     * 2C40A
          PUTREALEL                              * 2C40F
          NextInArray                            * 2C414
          3DROP                                  * 2C419
        ;                                        * 2C41E

* refs (1): 1FD95
OBJ_2C423:
        ::                                       * 2C423
          rclä                                   * 2C428
          DUP                                    * 2C42D
          MDIMSDROP                              * 2C432
          ROTOVER                                * 2C437
          lastv(ra,s)                            * 2C43C
          SWAP4ROLL                              * 2C441
          4ROLLOVER                              * 2C446
          #1=case                                * 2C44B
          ::                                     * 2C450
            3DROP                                * 2C455
            OBJ_2C248                            * 2C45A
            STATCLST                             * 2C45F
          ;                                      * 2C464
          SWAP#1-                                * 2C469
          SWAP                                   * 2C46E
          TWO{}N                                 * 2C473
          @rdm(ar,ls)                            * 2C478
          DROP                                   * 2C47D
        ;                                        * 2C482

* refs (1): 2C43C
lastv(ra,s):
        ::                                       * 2C487
          DUP                                    * 2C48C
          #       1                              * 2C491  1
          #=ITE                                  * 2C49B

0;newob:
          ::                                     * 2C4A0
            %0_2A2B4                             * 2C4A5
            TOTEMPOB                             * 2C4AA
          ;                                      * 2C4AF

* refs (1): 2C639
nulv(s):
          ::                                     * 2C4B4
            DUPONE                               * 2C4B9
            {}N                                  * 2C4BE
            %0_2A2B4                             * 2C4C3
            MAKEARRY                             * 2C4C8
          ;                                      * 2C4CD
          SWAP                                   * 2C4D2
          CODE                                   * 2C4D7  79 nibbles
            GOSBVL  POP#                         * 2C4E1
            GOSUBL  SUB_2CE75                    * 2C4E8
            A=A+A   A                            * 2C4EE
            A=A+A   A                            * 2C4F0
            A=A+A   A                            * 2C4F2
            A=A+A   A                            * 2C4F4
            R0=A                                 * 2C4F6
            C=DAT1  A                            * 2C4F9
            D1=D1+  5                            * 2C4FC
            A=DAT1  A                            * 2C4FF
            R1=A                                 * 2C502
            D0=C                                 * 2C505
            GOSBVL  SKIPOB                       * 2C508
            C=R1                                 * 2C50F
            CD0EX                                * 2C512
            D1=C                                 * 2C515
            GOSBVL  SKIPOB                       * 2C518
            C=R0                                 * 2C51F
            GOSBVL  MOVEUP                       * 2C522
            GOVLNG  GETPTRLOOP                   * 2C529
          ENDCODE                                * 2C530
        ;                                        * 2C530

* -> N
* refs (4): 1FDB0 48EBE 48EE6 B7F68
STATN:
        ::                                       * 2C535
          STATRCL                                * 2C53A
          NOTcase                                * 2C53F
          %0_2A2B4                               * 2C544
          OBJ_2D252                              * 2C549
          OBJ_2CC92                              * 2C54E
        ;                                        * 2C553

* -> %
* refs (1): 1FE88
STATSMAX:
        ::                                       * 2C558
          BINT0                                  * 2C55D
          OBJ_2C5EE                              * 2C562
          ColumnMAX                              * 2C567
        ;                                        * 2C56C

* -> % -> []
* refs (1): 1FEA3
STATMEAN:
        ::                                       * 2C571
          BINT0                                  * 2C576
          OBJ_2C5EE                              * 2C57B
          ColumnMEAN                             * 2C580
        ;                                        * 2C585

* -> %
* refs (1): 1FEBE
STATSMIN:
        ::                                       * 2C58A
          BINT0                                  * 2C58F
          OBJ_2C5EE                              * 2C594
          ColumnMIN                              * 2C599
        ;                                        * 2C59E

* -> % -> []
* refs (1): 1FED9
STATSTDEV:
        ::                                       * 2C5A3
          BINT1                                  * 2C5A8
          OBJ_2C5EE                              * 2C5AD
          ColumnTDEV                             * 2C5B2
        ;                                        * 2C5B7

* -> % -> []
* refs (1): 1FEF4
STATTOT:
        ::                                       * 2C5BC
          BINT0                                  * 2C5C1
          OBJ_2C5EE                              * 2C5C6
          ColumnTOT                              * 2C5CB
        ;                                        * 2C5D0

* -> % -> []
* refs (1): 1FF0F
STATVAR:
        ::                                       * 2C5D5
          BINT1                                  * 2C5DA
          OBJ_2C5EE                              * 2C5DF
          ColumnVAR                              * 2C5E4
        ;                                        * 2C5E9

* refs (8): 2C562 2C57B 2C594 2C5AD 2C5C6 2C5DF ...
OBJ_2C5EE:
        ::                                       * 2C5EE
          'R                                     * 2C5F3
          rclä                                   * 2C5F8
          DUP                                    * 2C5FD
          MDIMSDROP                              * 2C602
          SWAP                                   * 2C607
          5ROLL                                  * 2C60C
          #>?SKIP                                * 2C611
          OBJ_2D2D7                              * 2C616
          DUPONE                                 * 2C61B
          #=case                                 * 2C620
          ::                                     * 2C625
            SWAPROT                              * 2C62A
            EVAL                                 * 2C62F
          ;                                      * 2C634
          nulv(s)                                * 2C639
          SWAP                                   * 2C63E
          #1+_ONE_DO                             * 2C643
          INDEX@                                 * 2C648
          3PICK                                  * 2C64D
          5PICK                                  * 2C652
          EVAL                                   * 2C657
          INDEX@                                 * 2C65C
          PUTREALEL                              * 2C661
          LOOP                                   * 2C666
          ROTROT2DROP                            * 2C66B
        ;                                        * 2C670

* % %' ->
* refs (2): 200A9 B7E0A
STATCOL:
        ::                                       * 2C675
          ChkReakäPAR                            * 2C67A
          4ROLLDROP                              * 2C67F
          4ROLLDROP                              * 2C684
          StoäPAR(5_)                            * 2C689
        ;                                        * 2C68E

* refs (5): 20248 2C689 2C6C5 2C6E8 2CAD0
StoäPAR(5_):
        ::                                       * 2C693
          BINT5                                  * 2C698
          {}N                                    * 2C69D
          '                                      * 2C6A2
          äPAR                                   * 2C6A7
          XEQSTOID                               * 2C6AC
        ;                                        * 2C6B1

* n ->
* refs (3): 1FFE9 A7794 A7D04
STATXCOL:
        ::                                       * 2C6B6
          ChkReakäPAR                            * 2C6BB
          5ROLLDROP                              * 2C6C0
          StoäPAR(5_)                            * 2C6C5
        ;                                        * 2C6CA

* n ->
* refs (2): 20009 A7CFF
STATYCOL:
        ::                                       * 2C6CF
          ChkReakäPAR                            * 2C6D4
          4ROLLDROP                              * 2C6D9
          4ROLL                                  * 2C6DE
          5UNROLL                                * 2C6E3
          StoäPAR(5_)                            * 2C6E8
        ;                                        * 2C6ED

* refs (6): 2C945 2C977 4CA05 4D9D9 A76F5 A7C80
STATGETXCOL:
        ::                                       * 2C6F2
          ChkReakäPAR                            * 2C6F7
          4DROP                                  * 2C6FC
        ;                                        * 2C701

* refs (3): 2C95E 2C99F A7C85
STATGETYCOL:
        ::                                       * 2C706
          ChkReakäPAR                            * 2C70B
          3DROP                                  * 2C710
          SWAPDROP                               * 2C715
        ;                                        * 2C71A

* refs (18): 200D3 20239 2C67A 2C6BB 2C6D4 2C6F7 ...
ChkReakäPAR:
        ::                                       * 2C71F
          '                                      * 2C724

* refs (3): 2C6A7 2C76F C6D1E
äPAR:
          ID      ΣPAR                           * 2C729
          SAFE@_HERE                             * 2C738
          ?SKIP                                  * 2C73D

ResetäPAR:
          ::                                     * 2C742
            {                                    * 2C747
              %1                                 * 2C74C
              %2                                 * 2C751
              %0_2A2B4                           * 2C756
              %0_2A2B4                           * 2C75B
              xLINFIT                            * 2C760
            }                                    * 2C765
            DUP'                                 * 2C76A
            äPAR                                 * 2C76F
            XEQSTOID                             * 2C774
          ;                                      * 2C779
          DUPTYPELIST?                           * 2C77E
          NOTcase                                * 2C783
          OBJ_2D2E7                              * 2C788
          INNERCOMP                              * 2C78D
          BINT5                                  * 2C792
          EQ                                     * 2C797
          NOTcase                                * 2C79C
          OBJ_2D2E7                              * 2C7A1
          DUP                                    * 2C7A6
          OBJ_4A177                              * 2C7AB
          matchob?                               * 2C7B0
          NOTcase                                * 2C7B5
          OBJ_2D2E7                              * 2C7BA
          CK&DISPATCH0                           * 2C7BF
          OBJ_2C7DD                              * 2C7C4
          NOP                                    * 2C7C9
          BINT0                                  * 2C7CE
          OBJ_2D2E7                              * 2C7D3
        ;                                        * 2C7D8

* refs (1): 2C7C4
OBJ_2C7DD:
        #       11118                            * 2C7DD  69912

* refs (6): 2C814 2C841 2C9C7 2CA12 4C8D6 CB529
RclXYCol&äDAT:
        ::                                       * 2C7E7
          rclä                                   * 2C7EC
          ChkReakäPAR                            * 2C7F1
          3DROP                                  * 2C7F6
          COERCE2                                * 2C7FB
          ROT                                    * 2C800
          OBJ_2CF08                              * 2C805
        ;                                        * 2C80A

* refs (1): 2C8EB
RclXYCol&äDAT!:
        ::                                       * 2C80F
          RclXYCol&äDAT                          * 2C814
          DUP                                    * 2C819
          OBJ_2CC92                              * 2C81E
          %1                                     * 2C823
          %=                                     * 2C828
          case                                   * 2C82D
          OBJ_2D2D7                              * 2C832
        ;                                        * 2C837

* -> %
* refs (3): 1FDCB 4A1C7 B7EEB
STATCORR:
        ::                                       * 2C83C
          RclXYCol&äDAT                          * 2C841
          2DUP                                   * 2C846
          OBJ_2CC06                              * 2C84B
          OBJ_2CDA5                              * 2C850
          BINT3                                  * 2C855
          NDUP                                   * 2C85A
          OBJ_2CC06                              * 2C85F
          OBJ_2CDFA                              * 2C864
          5UNROLL                                * 2C869
          4ROLLROT                               * 2C86E
          2DUP                                   * 2C873
          OBJ_2CC4C                              * 2C878
          OBJ_2CDA5                              * 2C87D
          BINT3                                  * 2C882
          NDUP                                   * 2C887
          OBJ_2CC4C                              * 2C88C
          OBJ_2CDFA                              * 2C891
          6UNROLL                                * 2C896
          4ROLL                                  * 2C89B
          5ROLL                                  * 2C8A0
          4UNROLL                                * 2C8A5
          OBJ_2CC4C                              * 2C8AA
          OBJ_2CC06                              * 2C8AF
          OBJ_2CE7C                              * 2C8B4
          3UNROLL                                * 2C8B9
          %%*                                    * 2C8BE
          DUP                                    * 2C8C3
          %%0=                                   * 2C8C8
          case2drop                              * 2C8CD
          %1                                     * 2C8D2
          %%SQRT                                 * 2C8D7
          %%/>%                                  * 2C8DC
        ;                                        * 2C8E1

* -> %
* refs (2): 1FDE6 B7EF0
STATCOV:
        ::                                       * 2C8E6
          RclXYCol&äDAT!                         * 2C8EB
          DUP4UNROLL                             * 2C8F0
          3PICKOVER                              * 2C8F5
          OBJ_2CC4C                              * 2C8FA
          OBJ_2CDA5                              * 2C8FF
          3PICK3PICK                             * 2C904
          OBJ_2CC06                              * 2C909
          OBJ_2CDA5                              * 2C90E
          OBJ_2CC4C                              * 2C913
          OBJ_2CC06                              * 2C918
          OBJ_2CE7C                              * 2C91D
          SWAP                                   * 2C922
          OBJ_2CC92                              * 2C927
          %1                                     * 2C92C
          %>%%-                                  * 2C931
          %%/>%                                  * 2C936
        ;                                        * 2C93B

* -> %
* refs (2): 1FE01 B7F1D
STATX:
        ::                                       * 2C940
          STATGETXCOL                            * 2C945
          OBJ_2C9EF                              * 2C94A
          ColumnTOT                              * 2C94F
        ;                                        * 2C954

* -> %
* refs (2): 1FE1C B7F2C
STATY:
        ::                                       * 2C959
          STATGETYCOL                            * 2C95E
          OBJ_2C9EF                              * 2C963
          ColumnTOT                              * 2C968
        ;                                        * 2C96D

* -> %
* refs (2): 1FE37 B7F3B
STATXX:
        ::                                       * 2C972
          STATGETXCOL                            * 2C977
          OBJ_2C9EF                              * 2C97C
          %%0                                    * 2C981
          FALSE                                  * 2C986
          OBJ_2CDFA                              * 2C98B
          %%>%                                   * 2C990
        ;                                        * 2C995

* -> %
* refs (2): 1FE52 B7F4A
STATYY:
        ::                                       * 2C99A
          STATGETYCOL                            * 2C99F
          OBJ_2C9EF                              * 2C9A4
          %%0                                    * 2C9A9
          FALSE                                  * 2C9AE
          OBJ_2CDFA                              * 2C9B3
          %%>%                                   * 2C9B8
        ;                                        * 2C9BD

* -> %
* refs (2): 1FE6D B7F59
STATXY:
        ::                                       * 2C9C2
          RclXYCol&äDAT                          * 2C9C7
          %%0                                    * 2C9CC
          DUP                                    * 2C9D1
          FALSE                                  * 2C9D6
          DUP                                    * 2C9DB
          OBJ_2CE7C                              * 2C9E0
          %%>%                                   * 2C9E5
        ;                                        * 2C9EA

* refs (10): 2C94A 2C963 2C97C 2C9A4 B7E1E B7E37 ...
OBJ_2C9EF:
        ::                                       * 2C9EF
          COERCEDUP                              * 2C9F4
          rclä                                   * 2C9F9
          OBJ_2CF08                              * 2C9FE
          SWAPDROP                               * 2CA03
        ;                                        * 2CA08

* refs (4): 1FF2A 48BC0 4A20D AF85F
STATLR:
        ::                                       * 2CA0D
          RclXYCol&äDAT                          * 2CA12
          3PICKOVER                              * 2CA17
          OBJ_2CC4C                              * 2CA1C
          OBJ_2CDA5                              * 2CA21
          3PICK3PICK                             * 2CA26
          OBJ_2CC06                              * 2CA2B
          OBJ_2CDA5                              * 2CA30
          BINT5                                  * 2CA35
          NDUP                                   * 2CA3A
          OBJ_2CC4C                              * 2CA3F
          OBJ_2CC06                              * 2CA44
          OBJ_2CE7C                              * 2CA49
          6PICK                                  * 2CA4E
          5ROLL                                  * 2CA53
          5PICK                                  * 2CA58
          OBJ_2CC4C                              * 2CA5D
          OBJ_2CDFA                              * 2CA62
          DUP                                    * 2CA67
          %%0=                                   * 2CA6C
          case                                   * 2CA71
          OBJ_2D2D7                              * 2CA76
          %%/                                    * 2CA7B
          SWAPROT                                * 2CA80
          3PICK                                  * 2CA85
          OBJ_372BC                              * 2CA8A
          OBJ_2CC06                              * 2CA8F
          IT                                     * 2CA94
          %%EXP                                  * 2CA99
          %%>%                                   * 2CA9E
          SWAP                                   * 2CAA3
          %%>%                                   * 2CAA8
          2SWAP                                  * 2CAAD
          2DROP                                  * 2CAB2
          ChkReakäPAR                            * 2CAB7
          ROTROT2DROP                            * 2CABC
          4PICKSWAP                              * 2CAC1
          6PICK                                  * 2CAC6
          3UNROLL                                * 2CACB

predy(r):
          StoäPAR(5_)                            * 2CAD0
        ;                                        * 2CAD5

* % -> %'
* refs (3): 1FF89 1FFA9 B7F0E
STATPREDY:
        ::                                       * 2CADA

predx(r):
          ChkReakäPAR                            * 2CADF
          DROP                                   * 2CAE4
          ROTDROP                                * 2CAE9
          ROTDROP                                * 2CAEE
          ROT                                    * 2CAF3
          %>%%                                   * 2CAF8
          OBJ_2CC4C                              * 2CAFD
          IT                                     * 2CB02
          OBJ_2CBC5                              * 2CB07
          SWAP                                   * 2CB0C
          %>%%                                   * 2CB11
          %%*SWAP                                * 2CB16
          %>%%                                   * 2CB1B
          OBJ_2CC06                              * 2CB20
          IT                                     * 2CB25
          OBJ_2CBC5                              * 2CB2A
          %%+                                    * 2CB2F
          OBJ_2CC06                              * 2CB34
          IT                                     * 2CB39
          %%EXP                                  * 2CB3E
          %%>%                                   * 2CB43
        ;                                        * 2CB48

* % -> %'
* refs (2): 1FFC9 B7EFF
STATPREDX:
        ::                                       * 2CB4D

PwrExpFIT?:
          ChkReakäPAR                            * 2CB52
          DROP                                   * 2CB57
          ROTDROP                                * 2CB5C
          ROTDROP                                * 2CB61
          ROT                                    * 2CB66
          %>%%                                   * 2CB6B
          OBJ_2CC06                              * 2CB70
          IT                                     * 2CB75
          OBJ_2CBC5                              * 2CB7A
          ROT                                    * 2CB7F
          %>%%                                   * 2CB84
          OBJ_2CC06                              * 2CB89
          IT                                     * 2CB8E
          OBJ_2CBC5                              * 2CB93
          %%-                                    * 2CB98
          SWAP                                   * 2CB9D
          %>%%                                   * 2CBA2
          %%/                                    * 2CBA7
          OBJ_2CC4C                              * 2CBAC
          IT                                     * 2CBB1
          %%EXP                                  * 2CBB6
          %%>%                                   * 2CBBB
        ;                                        * 2CBC0

* refs (4): 2CB07 2CB2A 2CB7A 2CB93
OBJ_2CBC5:
        ::                                       * 2CBC5
          DUP                                    * 2CBCA
          %%0>                                   * 2CBCF
          ?SKIP                                  * 2CBD4
          OBJ_2CBE8                              * 2CBD9
          %%LN                                   * 2CBDE
        ;                                        * 2CBE3

* refs (1): 2CBD9
OBJ_2CBE8:
        ::                                       * 2CBE8
          %%0<                                   * 2CBED
          ?SKIP                                  * 2CBF2
          OBJ_2D307                              * 2CBF7
          OBJ_2D2F7                              * 2CBFC
        ;                                        * 2CC01

* refs (14): 2C84B 2C85F 2C8AF 2C909 2C918 2CA2B ...
OBJ_2CC06:
        ::                                       * 2CC06

PwrLogFIT?:
          ChkReakäPAR                            * 2CC0B
          5UNROLL                                * 2CC10
          4DROP                                  * 2CC15
          DUP                                    * 2CC1A
          '                                      * 2CC1F
          xPWRFIT                                * 2CC24
          EQUAL                                  * 2CC29
          SWAP                                   * 2CC2E
          '                                      * 2CC33
          xEXPFIT                                * 2CC38
          EQUAL                                  * 2CC3D
          OR                                     * 2CC42
        ;                                        * 2CC47

* refs (12): 2C878 2C88C 2C8AA 2C8FA 2C913 2CA1C ...
OBJ_2CC4C:
        ::                                       * 2CC4C

nrows(ar):
          ChkReakäPAR                            * 2CC51
          5UNROLL                                * 2CC56
          4DROP                                  * 2CC5B
          DUP                                    * 2CC60
          '                                      * 2CC65
          xPWRFIT                                * 2CC6A
          EQUAL                                  * 2CC6F
          SWAP                                   * 2CC74
          '                                      * 2CC79
          xLOGFIT                                * 2CC7E
          EQUAL                                  * 2CC83
          OR                                     * 2CC88
        ;                                        * 2CC8D

* refs (4): 2C54E 2C81E 2C927 CB565
OBJ_2CC92:
        CON(5)  (*)+5                            * 2CC92  primitive code object
        ASSEMBLE

* refs (1): 2CC92
maxcols(s,ra):
        A=DAT1  A                                * 2CC97
        D1=D1+  5                                * 2CC9A
        D=D+1   A                                * 2CC9D
        GOSUB   SUB_2CE75                        * 2CC9F
        D0=A                                     * 2CCA3
        D0=D0+  15                               * 2CCA6
        D0=D0+  5                                * 2CCA9
        A=DAT0  A                                * 2CCAC
        GOSBVL  SUB_7A08B                        * 2CCAF
        GOTO    L_2CD9E                          * 2CCB6

* refs (3): 2C567 4957D B7EA5
ColumnMAX:
        CON(5)  (*)+5                            * 2CCBA  primitive code object
        ST=1    3                                * 2CCBF
L_2CCC2:
        GOSUB   SUB_2CF2D                        * 2CCC2
        SETDEC                                   * 2CCC6
        GOSUB   SUB_2CFC0                        * 2CCC8
        A=B     M                                * 2CCCC
        GOTO    L_2CD9E                          * 2CCCF

* refs (3): 2C599 49573 B7EBE
ColumnMIN:
        CON(5)  (*)+5                            * 2CCD3  primitive code object
        ST=0    3                                * 2CCD8
        GOTO    L_2CCC2                          * 2CCDB

* refs (4): 2C5CB 2C94F 2C968 B7E8C
ColumnTOT:
        CON(5)  (*)+5                            * 2CCDF  primitive code object
        ST=0    3                                * 2CCE4
        ST=0    4                                * 2CCE7
        GOTO    L_2CD35                          * 2CCEA

* refs (2): 2C580 B7E23
ColumnMEAN:
        CON(5)  (*)+5                            * 2CCEE  primitive code object
        ST=1    3                                * 2CCF3
        ST=0    4                                * 2CCF6
        GOTO    L_2CD35                          * 2CCF9

* refs (2): 2C5E4 B7E6E
ColumnVAR:
        CON(5)  (*)+5                            * 2CCFD  primitive code object
        ST=0    3                                * 2CD02
        GOTO    L_2CD11                          * 2CD05

* refs (2): 2C5B2 B7E46
ColumnTDEV:
        CON(5)  (*)+5                            * 2CD09  primitive code object
        ST=1    3                                * 2CD0E
L_2CD11:
        ST=1    4                                * 2CD11
        ST=0    1                                * 2CD14
        GOTO    L_2CD35                          * 2CD17

* refs (2): B7E73 CB51A
OBJ_2CD1B:
        CON(5)  (*)+5                            * 2CD1B  primitive code object
        ST=0    3                                * 2CD20
        GOTO    L_2CD2F                          * 2CD23

* refs (2): B7E4B CB501
OBJ_2CD27:
        CON(5)  (*)+5                            * 2CD27  primitive code object
        ST=1    3                                * 2CD2C
L_2CD2F:
        ST=1    4                                * 2CD2F
        ST=1    1                                * 2CD32
L_2CD35:
        GOSUB   SUB_2CF2D                        * 2CD35
        R3=A                                     * 2CD39
        DCEX    A                                * 2CD3C
        R2=C                                     * 2CD3E
        C=D     A                                * 2CD41
        ST=0    2                                * 2CD43
        GOSUB   SUB_2D019                        * 2CD46
        ?ST=1   4                                * 2CD4A
        GOYES   L_2CD54                          * 2CD4D
        ?ST=0   3                                * 2CD4F
        GOYES   L_2CD97                          * 2CD52
L_2CD54:
        RSTK=C                                   * 2CD54
        A=R2                                     * 2CD56
        GOSUB   SUB_2CE52                        * 2CD59
        C=RSTK                                   * 2CD5D
        ?ST=0   4                                * 2CD5F
        GOYES   L_2CD97                          * 2CD62
        GOSBVL  EXAB2                            * 2CD64
        ABEX    A                                * 2CD6B
        BCEX    A                                * 2CD6D
        RSTK=C                                   * 2CD6F
        C=B     A                                * 2CD71
        ST=0    2                                * 2CD73
        GOSUB   SUB_2D0B0                        * 2CD76
        C=RSTK                                   * 2CD7A
        A=C     A                                * 2CD7C
        SETHEX                                   * 2CD7E
        ?ST=1   1                                * 2CD80
        GOYES   L_2CD87                          * 2CD83
        A=A-1   A                                * 2CD85
L_2CD87:
        GOSUB   SUB_2CE52                        * 2CD87
        ?ST=0   3                                * 2CD8B
        GOYES   L_2CD97                          * 2CD8E
        GOSBVL  SUB_2B9F3                        * 2CD90
L_2CD97:
        GOSBVL  PACK                             * 2CD97
L_2CD9E:
        GOVLNG  PUSH%LOOP                        * 2CD9E

* refs (8): 2C850 2C87D 2C8FF 2C90E 2CA21 2CA30 ...
OBJ_2CDA5:
        CON(5)  (*)+5                            * 2CDA5  primitive code object
        GOSUB   SUB_2CEE8                        * 2CDAA
        R0=A                                     * 2CDAE
        GOSUB   SUB_2CF2D                        * 2CDB1
        AR0EX                                    * 2CDB5
        B=A     A                                * 2CDB8
        GOSUB   SUB_2CEFC                        * 2CDBA
        ST=0    2                                * 2CDBE
        ?A#B    A                                * 2CDC1
        GOYES   L_2CDC9                          * 2CDC4
        ST=1    2                                * 2CDC6
L_2CDC9:
        A=R0                                     * 2CDC9
        DCEX    A                                * 2CDCC
        RSTK=C                                   * 2CDCE
        C=D     A                                * 2CDD0
        GOSUB   SUB_2D019                        * 2CDD2
        C=RSTK                                   * 2CDD6
        GONC    L_2CDED                          * 2CDD8
L_2CDDB:
        C=D     A                                * 2CDDB
        A=C     A                                * 2CDDD
        P=      0                                * 2CDDF
        SETHEX                                   * 2CDE1
        GOSUB   SUB_2CE6E                        * 2CDE3
        C=A     A                                * 2CDE7
        GOTO    L_2D313                          * 2CDE9
L_2CDED:
        A=C     A                                * 2CDED
        GOSUB   SUB_2CE52                        * 2CDEF
L_2CDF3:
        GOVLNG  L_2A235                          * 2CDF3

* refs (5): 2C864 2C891 2C98B 2C9B3 2CA62
OBJ_2CDFA:
        CON(5)  (*)+5                            * 2CDFA  primitive code object
        GOSUB   SUB_2CEE8                        * 2CDFF
        R0=A                                     * 2CE03
        GOSUB   SUB_2CEE8                        * 2CE06
        R3=A                                     * 2CE0A
        GOSUB   SUB_2CF2D                        * 2CE0D
        A=R0                                     * 2CE11
        B=A     A                                * 2CE14
        GOSUB   SUB_2CEFC                        * 2CE16
        ST=0    2                                * 2CE1A
        ?A#B    A                                * 2CE1D
        GOYES   L_2CE25                          * 2CE20
        ST=1    2                                * 2CE22
L_2CE25:
        A=R3                                     * 2CE25
        D1=A                                     * 2CE28
        D1=D1+  10                               * 2CE2B
        A=DAT1  W                                * 2CE2E
        B=A     W                                * 2CE32
        D1=D1-  5                                * 2CE35
        A=DAT1  A                                * 2CE38
        GOSBVL  STAB2                            * 2CE3B
        AD0EX                                    * 2CE42
        SETDEC                                   * 2CE45
        GOSUB   SUB_2D0B0                        * 2CE47
L_2CE4B:
        GONC    L_2CDF3                          * 2CE4B
        GOTO    L_2CDDB                          * 2CE4E

* refs (3): 2CD59 2CD87 2CDEF
SUB_2CE52:
        GOSBVL  SUB_7A0AA                        * 2CE52
        GOSBVL  RCCD0                            * 2CE59
        GOSBVL  XYEX                             * 2CE60
        GOVLNG  DIVF                             * 2CE67

* refs (3): 2CDE3 2CF14 2CF25
SUB_2CE6E:
        GOVLNG  GETPTR                           * 2CE6E

* refs (3): 2C4E8 2CC9F 2CF38
SUB_2CE75:
        GOVLNG  SAVPTR                           * 2CE75

* refs (5): 2C8B4 2C91D 2C9E0 2CA49 CB55B
OBJ_2CE7C:
        CON(5)  (*)+5                            * 2CE7C  primitive code object
        GOSUB   SUB_2CEE8                        * 2CE81
        R0=A                                     * 2CE85
        GOSUB   SUB_2CEE8                        * 2CE88
        R1=A                                     * 2CE8C
        GOSUB   SUB_2CEE8                        * 2CE8F
        GOSBVL  ASLW5                            * 2CE93
        GOSUB   SUB_2CEE8                        * 2CE9A
        GOSBVL  ASLW5                            * 2CE9E
        R2=A                                     * 2CEA5
        GOSUB   SUB_2CF8B                        * 2CEA8
        A=R0                                     * 2CEAC
        B=A     A                                * 2CEAF
        GOSUB   SUB_2CEFC                        * 2CEB1
        ST=0    1                                * 2CEB5
        ?A#B    A                                * 2CEB8
        GOYES   L_2CEC0                          * 2CEBB
        ST=1    1                                * 2CEBD
L_2CEC0:
        A=R1                                     * 2CEC0
        B=A     A                                * 2CEC3
        GOSUB   SUB_2CEFC                        * 2CEC5
        ST=0    0                                * 2CEC9
        ?A#B    A                                * 2CECC
        GOYES   L_2CED4                          * 2CECF
        ST=1    0                                * 2CED1
L_2CED4:
        A=R2                                     * 2CED4
        A=R4.F  A                                * 2CED7
        R4=A                                     * 2CEDD
        GOSUB   SUB_2D131                        * 2CEE0
        GOTO    L_2CE4B                          * 2CEE4

* refs (9): 2CDAA 2CDFF 2CE06 2CE81 2CE88 2CE8F ...
SUB_2CEE8:
        A=DAT1  A                                * 2CEE8
        D1=D1+  5                                * 2CEEB
        D=D+1   A                                * 2CEEE
        RTN                                      * 2CEF0

* refs (2): 2CF31 2CF8F
SUB_2CEF2:
        C=DAT1  A                                * 2CEF2
        D1=D1+  5                                * 2CEF5
        D=D+1   A                                * 2CEF8
        RTN                                      * 2CEFA

* refs (4): 2CDBA 2CE16 2CEB1 2CEC5
SUB_2CEFC:
        LA(5)   TRUE                             * 2CEFC
        RTN                                      * 2CF06

* refs (5): 2C805 2C9FE 48E55 48EA0 4D9ED
OBJ_2CF08:
        CON(5)  (*)+5                            * 2CF08  primitive code object
        GOSUB   SUB_2CF8B                        * 2CF0D
        GOC     L_2CF25                          * 2CF11
        GOSUB   SUB_2CE6E                        * 2CF14
        D1=D1-  15                               * 2CF18
        D=D-1   A                                * 2CF1B
        D=D-1   A                                * 2CF1D
        D=D-1   A                                * 2CF1F
        GOTO    L_2D2BD                          * 2CF21
L_2CF25:
        GOSUB   SUB_2CE6E                        * 2CF25
        GOTO    L_2D2EC                          * 2CF29

* refs (4): 2CCC2 2CD35 2CDB1 2CE0D
SUB_2CF2D:
        GOSUB   SUB_2CEE8                        * 2CF2D

* refs (1): 2CF96
SUB_2CF31:
        GOSUB   SUB_2CEF2                        * 2CF31
        R4=C                                     * 2CF35
        GOSUB   SUB_2CE75                        * 2CF38
        D0=A                                     * 2CF3C
        D0=D0+  5                                * 2CF3F
        AD0EX                                    * 2CF42
        D0=A                                     * 2CF45
        C=DAT0  A                                * 2CF48
        A=A+C   A                                * 2CF4B
        GONC    L_2CF54                          * 2CF4D
        A=0     A                                * 2CF50
        A=A-1   A                                * 2CF52
L_2CF54:
        AR4EX                                    * 2CF54
        D1=A                                     * 2CF57
        D1=D1+  5                                * 2CF5A
        A=DAT1  A                                * 2CF5D
        D0=D0+  15                               * 2CF60
        C=DAT0  A                                * 2CF63
        D=C     A                                * 2CF66
        D0=D0+  5                                * 2CF68
        C=DAT0  A                                * 2CF6B
        ?A=0    A                                * 2CF6E
        RTNYES                                   * 2CF71
        ?C<A    A                                * 2CF73
        RTNYES                                   * 2CF76
        ASL     A                                * 2CF78
        B=A     A                                * 2CF7A
        D0=D0-  11                               * 2CF7C
        AD0EX                                    * 2CF7F
        A=A+B   A                                * 2CF82
        D0=A                                     * 2CF84
        CSL     A                                * 2CF87
        RTNCC                                    * 2CF89

* refs (2): 2CEA8 2CF0D
SUB_2CF8B:
        GOSUB   SUB_2CEE8                        * 2CF8B
        GOSUB   SUB_2CEF2                        * 2CF8F
        R3=C                                     * 2CF93
        GOSUB   SUB_2CF31                        * 2CF96
        RTNC                                     * 2CF9A
        A=A-B   A                                * 2CF9D
        B=A     A                                * 2CF9F
        A=R3                                     * 2CFA1
        D1=A                                     * 2CFA4
        D1=D1+  5                                * 2CFA7
        A=DAT1  A                                * 2CFAA
        ASL     A                                * 2CFAD
        ?A=0    A                                * 2CFAF
        RTNYES                                   * 2CFB2
        ?C<A    A                                * 2CFB4
        RTNYES                                   * 2CFB7
        A=A+B   A                                * 2CFB9
        D1=A                                     * 2CFBB
        RTN                                      * 2CFBE

* refs (1): 2CCC8
SUB_2CFC0:
        RSTK=C                                   * 2CFC0
        A=DAT0  W                                * 2CFC2
        GOSUB   SUB_2D084                        * 2CFC6
L_2CFCA:
        CD0EX                                    * 2CFCA
        D=C     A                                * 2CFCD
        C=RSTK                                   * 2CFCF
        SETHEX                                   * 2CFD1
        D=D+C   A                                * 2CFD3
        SETDEC                                   * 2CFD5
        RSTK=C                                   * 2CFD7
        C=R4                                     * 2CFD9
        GOC     L_2D013                          * 2CFDC
        ?D>=C   A                                * 2CFDF
        GOYES   L_2D013                          * 2CFE2
        C=D     A                                * 2CFE4
        D0=C                                     * 2CFE6
        C=DAT0  W                                * 2CFE9
        GOSBVL  SUB_2BCAC                        * 2CFED
        P=      6                                * 2CFF4
        ?ST=1   3                                * 2CFF6
        GOYES   L_2CFFD                          * 2CFF9
        P=      3                                * 2CFFB
L_2CFFD:
        GOSBVL  TST15                            * 2CFFD
        GOC     L_2CFCA                          * 2D004
        A=C     W                                * 2D007
        C=D     W                                * 2D00A
        B=C     W                                * 2D00D
        GONC    L_2CFCA                          * 2D010
L_2D013:
        C=RSTK                                   * 2D013
        P=      0                                * 2D015
        RTN                                      * 2D017

* refs (2): 2CD46 2CDD2
SUB_2D019:
        D1=A                                     * 2D019
        HST=0   3                                * 2D01C
        A=0     W                                * 2D01F
        R0=A                                     * 2D022
        R1=A                                     * 2D025
L_2D028:
        RSTK=C                                   * 2D028
        GOSUB   SUB_2D080                        * 2D02A
        ?ST=0   2                                * 2D02E
        GOYES   L_2D05A                          * 2D031
        GOSUB   SUB_2D08B                        * 2D033
        GONC    L_2D040                          * 2D037
        C=RSTK                                   * 2D03A
        C=D     A                                * 2D03C
        RTNSC                                    * 2D03E
L_2D040:
        C=R0                                     * 2D040
        RSTK=C                                   * 2D043
        R4=C.F  S                                * 2D045
        GOSBVL  L_78E05                          * 2D04B
        C=R4                                     * 2D052
        C=RSTK                                   * 2D055
        R0=C                                     * 2D057
L_2D05A:
        GOSBVL  SUB_7A076                        * 2D05A
        C=RSTK                                   * 2D061
        AD1EX                                    * 2D063
        SETHEX                                   * 2D066
        A=A+C   A                                * 2D068
        SETDEC                                   * 2D06A
        D1=A                                     * 2D06C
        B=A     A                                * 2D06F
        A=R4                                     * 2D071
        GOC     L_2D07C                          * 2D074
        ?A>B    A                                * 2D077
        GOYES   L_2D028                          * 2D07A
L_2D07C:
        GOTO    L_2D23E                          * 2D07C

* refs (3): 2D02A 2D0C1 2D1AF
SUB_2D080:
        A=DAT1  W                                * 2D080

* refs (2): 2CFC6 2D148
SUB_2D084:
        GOVLNG  SPLITA                           * 2D084

* refs (4): 2D033 2D0CA 2D151 2D1B8
SUB_2D08B:
        P=      14                               * 2D08B
        C=0     A                                * 2D08D
        ?B=0    P                                * 2D08F
        GOYES   L_2D0A5                          * 2D092
        ?A#0    S                                * 2D094
        GOYES   L_2D09B                          * 2D097
        RTNCC                                    * 2D099
L_2D09B:
        P=      0                                * 2D09B
        LC(3)   #605                             * 2D09D
        GOC     L_2D0AC                          * 2D0A2
L_2D0A5:
        P=      0                                * 2D0A5
        LC(3)   #606                             * 2D0A7
L_2D0AC:
        D=C     A                                * 2D0AC
        RTNSC                                    * 2D0AE

* refs (2): 2CD76 2CE47
SUB_2D0B0:
        D1=A                                     * 2D0B0
        A=0     W                                * 2D0B3
        R0=A                                     * 2D0B6
        R1=A                                     * 2D0B9
        HST=0   3                                * 2D0BC
L_2D0BF:
        RSTK=C                                   * 2D0BF
        GOSUB   SUB_2D080                        * 2D0C1
        ?ST=0   2                                * 2D0C5
        GOYES   L_2D0F1                          * 2D0C8
        GOSUB   SUB_2D08B                        * 2D0CA
        GONC    L_2D0D7                          * 2D0CE
        C=RSTK                                   * 2D0D1
        C=D     A                                * 2D0D3
        RTNSC                                    * 2D0D5
L_2D0D7:
        C=R0                                     * 2D0D7
        RSTK=C                                   * 2D0DA
        R4=C.F  S                                * 2D0DC
        GOSBVL  L_78E05                          * 2D0E2
        C=R4                                     * 2D0E9
        C=RSTK                                   * 2D0EC
        R0=C                                     * 2D0EE
L_2D0F1:
        GOSBVL  RCCD2                            * 2D0F1
        C=-C-1  S                                * 2D0F8
        GOSBVL  RADDF                            * 2D0FB
        C=B     W                                * 2D102
        D=C     W                                * 2D105
        C=A     W                                * 2D108
        GOSBVL  SUB_7A06F                        * 2D10B
        C=RSTK                                   * 2D112
        AD1EX                                    * 2D114
        SETHEX                                   * 2D117
        A=A+C   A                                * 2D119
        SETDEC                                   * 2D11B
        D1=A                                     * 2D11D
        B=A     A                                * 2D120
        A=R4                                     * 2D122
        GOC     L_2D12D                          * 2D125
        ?A>B    A                                * 2D128
        GOYES   L_2D0BF                          * 2D12B
L_2D12D:
        GOTO    L_2D23E                          * 2D12D

* refs (1): 2CEE0
SUB_2D131:
        A=0     W                                * 2D131
        R0=A                                     * 2D134
        R1=A                                     * 2D137
        HST=0   3                                * 2D13A
L_2D13D:
        RSTK=C                                   * 2D13D
        A=DAT0  W                                * 2D13F
        CD0EX                                    * 2D143
        RSTK=C                                   * 2D146
        GOSUB   SUB_2D084                        * 2D148
        ?ST=0   0                                * 2D14C
        GOYES   L_2D160                          * 2D14F
        GOSUB   SUB_2D08B                        * 2D151
        GONC    L_2D160                          * 2D155
        C=RSTK                                   * 2D158
        C=RSTK                                   * 2D15A
        C=D     A                                * 2D15C
        RTNSC                                    * 2D15E
L_2D160:
        C=R4                                     * 2D160
        P=      15                               * 2D163
        C=P     15                               * 2D165
        R2=C                                     * 2D169
        P=      9                                * 2D16C
        CSR     WP                               * 2D16E
        CSR     WP                               * 2D171
        CSR     WP                               * 2D174
        CSR     WP                               * 2D177
        CSR     WP                               * 2D17A
        CD0EX                                    * 2D17D
        D0=D0+  10                               * 2D180
        C=DAT0  W                                * 2D183
        D=C     W                                * 2D187
        D=0     S                                * 2D18A
        D0=D0-  5                                * 2D18D
        GOSBVL  DisableIntr                      * 2D190
        C=DAT0  A                                * 2D197
        GOSBVL  SUB_79FD2                        * 2D19A
        GOSBVL  AllowIntr                        * 2D1A1
        GOSBVL  STAB2                            * 2D1A8
        GOSUB   SUB_2D080                        * 2D1AF
        ?ST=0   1                                * 2D1B3
        GOYES   L_2D1C7                          * 2D1B6
        GOSUB   SUB_2D08B                        * 2D1B8
        GONC    L_2D1C7                          * 2D1BC
        C=RSTK                                   * 2D1BF
        C=RSTK                                   * 2D1C1
        C=D     A                                * 2D1C3
        RTNSC                                    * 2D1C5
L_2D1C7:
        C=R4                                     * 2D1C7
        CSL     W                                * 2D1CA
        CSLC                                     * 2D1CD
        CSLC                                     * 2D1D0
        CSLC                                     * 2D1D3
        CSLC                                     * 2D1D6
        CSLC                                     * 2D1D9
        D0=C                                     * 2D1DC
        D0=D0+  10                               * 2D1DF
        C=DAT0  W                                * 2D1E2
        D=C     W                                * 2D1E6
        D=0     S                                * 2D1E9
        D0=D0-  5                                * 2D1EC
        GOSBVL  DisableIntr                      * 2D1EF
        C=DAT0  A                                * 2D1F6
        GOSBVL  SUB_79FD2                        * 2D1F9
        GOSBVL  AllowIntr                        * 2D200
        C=RSTK                                   * 2D207
        D0=C                                     * 2D209
        C=RSTK                                   * 2D20C
        B=0     A                                * 2D20E
        AD0EX                                    * 2D210
        SETHEX                                   * 2D213
        GOSUB   ChkäData(_)                      * 2D215
        D0=A                                     * 2D219
        AD1EX                                    * 2D21C
        GOSUB   ChkäData(_)                      * 2D21F
        D1=A                                     * 2D223
        ?B#0    A                                * 2D226
        GOYES   L_2D22B                          * 2D229
L_2D22B:
        B=A     A                                * 2D22B
        A=R4                                     * 2D22D
        SETDEC                                   * 2D230
        GOC     L_2D23E                          * 2D232  never taken
        ?A<=B   A                                * 2D235
        GOYES   L_2D23E                          * 2D238
        GOTO    L_2D13D                          * 2D23A
L_2D23E:
        GOSBVL  RCAB0                            * 2D23E
        P=      0                                * 2D245
        RTNCC                                    * 2D247

* refs (2): 2D215 2D21F
ChkäData(_):
        A=A+C   A                                * 2D249
        RTNNC                                    * 2D24B
        B=B-1   A                                * 2D24E
        RTN                                      * 2D250

* refs (6): 2C2CF 2C30B 2C392 2C549 B5783 B7D4B
OBJ_2D252:
        CON(5)  (*)+5                            * 2D252  primitive code object
        A=DAT1  A                                * 2D257
        CD0EX                                    * 2D25A
        RSTK=C                                   * 2D25D
        D0=A                                     * 2D25F
        A=DAT0  A                                * 2D262
        LC(5)   DOARRY                           * 2D265
        ?C#A    A                                * 2D26C
        GOYES   L_2D29D                          * 2D26F
        D0=D0+  10                               * 2D271
        A=DAT0  A                                * 2D274
        LC(5)   DOREAL                           * 2D277
        ?C#A    A                                * 2D27E
        GOYES   L_2D29D                          * 2D281
        D0=D0+  5                                * 2D283
        A=DAT0  A                                * 2D286
        A=A-1   A                                * 2D289
        A=A-1   A                                * 2D28B
        A=A-1   A                                * 2D28D
        GONC    L_2D29D                          * 2D28F
        D0=D0+  5                                * 2D292
        A=DAT0  A                                * 2D295
        ?A#0    A                                * 2D298
        GOYES   L_2D2AD                          * 2D29B
L_2D29D:
        C=RSTK                                   * 2D29D
        D0=C                                     * 2D29F
        LC(5)   #00601                           * 2D2A2
        GOTO    L_2D313                          * 2D2A9
L_2D2AD:
        D0=D0+  5                                * 2D2AD
        A=DAT0  A                                * 2D2B0
        ?A=0    A                                * 2D2B3
        GOYES   L_2D29D                          * 2D2B6
        C=RSTK                                   * 2D2B8
        D0=C                                     * 2D2BA
L_2D2BD:
        A=DAT0  A                                * 2D2BD
        D0=D0+  5                                * 2D2C0
        PC=(A)                                   * 2D2C3

* refs (1): 2C2BB
OBJ_2D2C7:
        CON(5)  (*)+5                            * 2D2C7  primitive code object
        LC(5)   #00602                           * 2D2CC
        GOTO    L_2D313                          * 2D2D3

* refs (3): 2C616 2C832 2CA76
OBJ_2D2D7:
        CON(5)  (*)+5                            * 2D2D7  primitive code object
        LC(5)   #00603                           * 2D2DC
        GOTO    L_2D313                          * 2D2E3

* refs (5): 2C788 2C7A1 2C7BA 2C7D3 4CA3C
OBJ_2D2E7:
        CON(5)  (*)+5                            * 2D2E7  primitive code object
L_2D2EC:
        LC(5)   #00604                           * 2D2EC  error number
        GOTO    L_2D313                          * 2D2F3

* refs (1): 2CBFC
OBJ_2D2F7:
        CON(5)  (*)+5                            * 2D2F7  primitive code object
        LC(5)   #00605                           * 2D2FC
        GOTO    L_2D313                          * 2D303

* refs (1): 2CBF7
OBJ_2D307:
        CON(5)  (*)+5                            * 2D307  primitive code object
        LC(5)   #00606                           * 2D30C
L_2D313:
        A=C     A                                * 2D313
        GOVLNG  Errjmp                           * 2D315
        BSS     31                               * 2D31C
        NIBHEX  E1C5000                          * 2D33B  .\.

LIB00C:
        CON(3)  #00C                             * 2D342  library number
        CON(5)  0                                * 2D345  hash table
        REL(5)  LIB00C.message                   * 2D34A  message table
        CON(5)  0                                * 2D34F  link table
        REL(5)  LIB00C.config                    * 2D354  config
        RPL

* refs (1): 2D342
LIB00C.config:
        ::                                       * 2D359
          CLOSEUART                              * 2D35E
          ClrServMode                            * 2D363
          OBJ_11387                              * 2D368
          OBJ_5394C                              * 2D36D
          OpenIO_324C8                           * 2D372
        ;                                        * 2D377

* refs (7): 2D82F 2DA04 2DA90 2E6C3 2E8DB 307FB ...
OBJ_2D37C:
        $       "p% @-# 1"                       * 2D37C

* refs (5): 2D5E6 2D85C 2F6B4 2F6EB 2F9A2
MAXRETRY:
        #       A                                * 2D396  10

* refs (11): 2D6B8 2D843 2DA22 2DABD 2E0E0 2E6D7 ...
LAMPKNO:
        LAM     'PKNO                            * 2D3A0

* refs (5): 2D5FA 2EEE2 2F103 2F112 30838
LAMPACKET:
        LAM     'PACKET                          * 2D3B1

* refs (6): 2D5FF 2D7B2 2D7C1 2D7E4 2D875 2F6F5
LAMRETRY:
        LAM     'RETRY                           * 2D3C6

* refs (3): 2D992 2DD3D 2DD5B
LAMERRMSG:
        LAM     'ERRMSG                          * 2D3D9

* refs (7): 2D44B 2D83E 2DA1D 2E6D2 2E8EA 2FD0D ...
LAMKP:
        LAM     'KP                              * 2D3EE

* refs (13): 2D870 2DF06 2E912 2EED8 2F0EF 2F0FE ...
LAMLNAME:
        LAM     'LNAME                           * 2D3FB

* refs (6): 2E5D8 2EEDD 2F10D 2F1C1 2F284 2FC72
LAMOBJ:
        LAM     'OBJ                             * 2D40E

* refs (3): 2F20C 2F26B 2F338
LAMOPOS:
        LAM     'OPOS                            * 2D41D

* refs (3): 2DA18 2DA9F 2EF23
LAMEXCHP:
        LAM     'EXCHP                           * 2D42E

* refs (4): 2D56E 2DAA9 2EF0F 2F73B
'LamKPSto:
        ::                                       * 2D441
          '                                      * 2D446
          LAMKP                                  * 2D44B
          STO                                    * 2D450
        ;                                        * 2D455

* refs (3): 2F207 2F289 2F31F
LAMKLIST:
        LAM     'KLIST                           * 2D45A

* refs (5): 2D87A 2DF0B 2E917 2F3EC 2F484
LAMKMODE:
        LAM     'KMODE                           * 2D46D

* refs (6): 2F574 2F5B5 2FBA0 2FBB4 2FBC8 2FBEB
LAMKPTRN:
        LAM     'KPTRN                           * 2D480

* refs (7): 2D807 2D87F 2DF10 2E91C 2EEE7 2F068 ...
LAMKRM:
        LAM     'KRM                             * 2D493

* refs (3): 2D604 2D672 3084C
LAMMaxR:
        LAM     'MaxR                            * 2D4A2

* refs (2): 2D52B 2EF00
OBJ_2D4B3:
        ::                                       * 2D4B3
          DUPZERO                                * 2D4B8
          4ROLL                                  * 2D4BD
          BUILDKPACKET                           * 2D4C2
          Connecting                             * 2D4C7
          JstGetTHEMESG                          * 2D4CC
          KDispStatus2                           * 2D4D1
          SWAP                                   * 2D4D6

{local''}:
          {                                      * 2D4DB
            NULLLAM                              * 2D4E0
          }                                      * 2D4E5
          BIND                                   * 2D4EA
          SEND_PACKET                            * 2D4EF
          NOTcase                                * 2D4F4
          false;Lpop                             * 2D4F9
          1ABNDSWAP                              * 2D4FE
          OBJ_3088E                              * 2D503
          DUP                                    * 2D508
          NOTcaseFALSE                           * 2D50D
        ;                                        * 2D512

* refs (1): 2E92B
EXCHINITPK:
        ::                                       * 2D517
          KERMOPEN                               * 2D51C
          CHR_I                                  * 2D521
          CHOOSE_INIT                            * 2D526
          OBJ_2D4B3                              * 2D52B
          BINT0                                  * 2D530
          OBJ_2DAB3                              * 2D535
          case                                   * 2D53A
          ::                                     * 2D53F
            CODE                                 * 2D544  32 nibbles
              A=DAT1  A                          * 2D54E
              AD1EX                              * 2D551
              D1=D1+  10                         * 2D554
              D1=D1+  14                         * 2D557
              LC(2)   #31                        * 2D55A
              DAT1=C  B                          * 2D55E
              AD1EX                              * 2D561

* refs (2): 307DC 70061
Loop:
              A=DAT0  A                          * 2D564
              D0=D0+  5                          * 2D567
              PC=(A)                             * 2D56A
            ENDCODE                              * 2D56E
            'LamKPSto                            * 2D56E
          ;                                      * 2D573
          case                                   * 2D578
          3DROP                                  * 2D57D
          ERROROUT                               * 2D582
        ;                                        * 2D587

* refs (2): 2E754 2EF46
SENDEOT:
        ::                                       * 2D58C
          NULL$                                  * 2D591
          GetKermPkt#                            * 2D596
          CHR_B                                  * 2D59B
          BUILDKPACKET                           * 2D5A0
          BINT2                                  * 2D5A5
          OBJ_2D5EB                              * 2D5AA
          casedrptru                             * 2D5AF
          case                                   * 2D5B4
          TrueFalse                              * 2D5B9
          DUP                                    * 2D5BE
          #       C02                            * 2D5C3  3074
          #=case                                 * 2D5CD
          DROPTRUE                               * 2D5D2
          FalseFalse                             * 2D5D7
        ;                                        * 2D5DC

* refs (4): 2D4EF 2E94E 2F24D 2F36F
SEND_PACKET:
        ::                                       * 2D5E1
          MAXRETRY                               * 2D5E6

* refs (1): 2D5AA
OBJ_2D5EB:
          ::                                     * 2D5EB
            DUP                                  * 2D5F0
            {                                    * 2D5F5
              LAMPACKET                          * 2D5FA
              LAMRETRY                           * 2D5FF
              LAMMaxR                            * 2D604
            }                                    * 2D609
            BIND                                 * 2D60E
L_2D613:
            OBJ_30833                            * 2D613
            NOTcase                              * 2D618
            Lpop;2false                          * 2D61D
            DUP                                  * 2D622
            CHR_Y                                * 2D627
            EQUALcase                            * 2D62C
            ::                                   * 2D631
              OVER                               * 2D636
              GetKermPkt#                        * 2D63B
              #=case                             * 2D640

* refs (1): 2D6DB
OBJ_2D645:
              ::                                 * 2D645
                2DROP                            * 2D64A
                IncrLAMPKNO                      * 2D64F
                Lpop;true                        * 2D654
              ;                                  * 2D659
              OBJ_2F957                          * 2D65E
              case                               * 2D663

* refs (1): 2D6EF
OBJ_2D668:
              ::                                 * 2D668
                3DROP                            * 2D66D
                LAMMaxR                          * 2D672
                OBJ_2D7AD                        * 2D677
                ?GOTO                            * 2D67C
                L_2D613                          * 2D681
                XFERFAIL                         * 2D686
                Lpop;2false                      * 2D68B
              ;                                  * 2D690
              Lpop;true;false                    * 2D695
            ;                                    * 2D69A
            DUP                                  * 2D69F
            CHR_N                                * 2D6A4
            EQUALcase                            * 2D6A9
            ::                                   * 2D6AE
              OVER                               * 2D6B3
              LAMPKNO                            * 2D6B8
              #1+                                * 2D6BD
              #       40                         * 2D6C2  64
              #/                                 * 2D6CC
              DROP                               * 2D6D1
              #=case                             * 2D6D6
              OBJ_2D645                          * 2D6DB
              OVER                               * 2D6E0
              GetKermPkt#                        * 2D6E5
              #=case                             * 2D6EA
              OBJ_2D668                          * 2D6EF
              Lpop;true;false                    * 2D6F4
            ;                                    * 2D6F9

* refs (3): 2D695 2D6F4 2F858
Lpop;true;false:
            ::                                   * 2D6FE
              ABND                               * 2D703
              TrueFalse                          * 2D708
            ;                                    * 2D70D
          ;                                      * 2D712
        ;                                        * 2D717

* refs (5): 2D61D 2D68B 2F812 2F9BB 2FB3C
Lpop;2false:
        ::                                       * 2D71C
          ABND                                   * 2D721
          FalseFalse                             * 2D726
        ;                                        * 2D72B

* refs (6): 2D7F8 2DD7E 2F05E 2F22A 2F51A 2FAAB
KDispRow2:
        ::                                       * 2D730
          BINT39                                 * 2D735
          TestSysFlag                            * 2D73A
          caseDROP                               * 2D73F
          DISPROW2                               * 2D744
        ;                                        * 2D749

* refs (6): 2D4D1 2D82A 2DA8B 2F027 2F0F9 2F902
KDispStatus2:
        ::                                       * 2D74E
          BINT39                                 * 2D753
          TestSysFlag                            * 2D758
          caseDROP                               * 2D75D
          DISPSTATUS2                            * 2D762
        ;                                        * 2D767

* refs (2): 2D799 2D8B1
OBJ_2D76C:
        ::                                       * 2D76C
          3PICK                                  * 2D771
          EQUAL                                  * 2D776
          SWAP4PICK                              * 2D77B
          #=                                     * 2D780
          AND                                    * 2D785
        ;                                        * 2D78A

* refs (5): 2DB7B 2DB8A 2DBA8 2DBB7 2DBC6
OBJ_2D78F:
        ::                                       * 2D78F
          ZEROSWAP                               * 2D794
          OBJ_2D76C                              * 2D799
          COLA                                   * 2D79E
          ?GOTO                                  * 2D7A3
        ;                                        * 2D7A8

* refs (4): 2D677 2F6B9 2F9A7 30851
OBJ_2D7AD:
        ::                                       * 2D7AD
          LAMRETRY                               * 2D7B2
          #1-DUP                                 * 2D7B7
          '                                      * 2D7BC
          LAMRETRY                               * 2D7C1
          STO                                    * 2D7C6
          #0=case                                * 2D7CB
          DROPFALSE                              * 2D7D0
          Retry                                  * 2D7D5
          JstGetTHEMESG                          * 2D7DA
          SWAP                                   * 2D7DF
          LAMRETRY                               * 2D7E4
          #-                                     * 2D7E9
          #>$                                    * 2D7EE
          &$                                     * 2D7F3
          KDispRow2                              * 2D7F8
          TrueTrue                               * 2D7FD
          '                                      * 2D802
          LAMKRM                                 * 2D807
          STO                                    * 2D80C
        ;                                        * 2D811

* $/id/lam ->
* refs (6): 21F71 21F7B 21F85 21FA5 B81D3 B8AC6
DORECN:
        ::                                       * 2D816
          nm=>st!                                * 2D81B
          Connecting                             * 2D820
          JstGetTHEMESG                          * 2D825
          KDispStatus2                           * 2D82A
          OBJ_2D37C                              * 2D82F
          BINT0                                  * 2D834
          {                                      * 2D839
            LAMKP                                * 2D83E
            LAMPKNO                              * 2D843
          }                                      * 2D848
          BIND                                   * 2D84D
          ERRSET                                 * 2D852
          ::                                     * 2D857
            MAXRETRY                             * 2D85C
            NULL$                                * 2D861
            FALSE                                * 2D866
            {                                    * 2D86B
              LAMLNAME                           * 2D870
              LAMRETRY                           * 2D875
              LAMKMODE                           * 2D87A
              LAMKRM                             * 2D87F
            }                                    * 2D884
            BIND                                 * 2D889
            KERMOPEN                             * 2D88E
            RecvNextPkt                          * 2D893
            NOTcasedrop                          * 2D898
            ERROROUT                             * 2D89D

* refs (1): 2E97B
OBJ_2D8A2:
            ::                                   * 2D8A2
              BINT0                              * 2D8A7
              CHR_S                              * 2D8AC
              OBJ_2D76C                          * 2D8B1
              NOTcase                            * 2D8B6
              TRPACKETFAIL                       * 2D8BB
              2DROP                              * 2D8C0
              OBJ_2F709                          * 2D8C5
              case                               * 2D8CA
              AllowPrlcdCl                       * 2D8CF
              ABND                               * 2D8D4
              case                               * 2D8D9
              TRPACKETFAIL                       * 2D8DE
              DUP                                * 2D8E3
              #SyntaxErr                         * 2D8E8
              #<>case                            * 2D8ED
              ERROROUT                           * 2D8F2
              JstGetTHEMESG                      * 2D8F7
              Conc:RC(2st)                       * 2D8FC
              EXITMSGSTO                         * 2D901
              #EXITERR                           * 2D906
              ERROROUT                           * 2D90B
            ;                                    * 2D910
          ;                                      * 2D915
          ERRTRAP                                * 2D91A
          OBJ_2E763                              * 2D91F
          ABND                                   * 2D924
        ;                                        * 2D929

* refs (1): 2DDBA
OBJ_2D92E:
        ::                                       * 2D92E
          DEPTH                                  * 2D933
          #0=ITE                                 * 2D938
          MessageC15                             * 2D93D
          ::                                     * 2D942
            NULL$TEMP                            * 2D947
            DEPTH                                * 2D94C
            ONE_DO                               * 2D951
            ?ATTNQUIT                            * 2D956
            ISTOP-INDEX                          * 2D95B
            DUP#2+                               * 2D960
            PICK                                 * 2D965
            #       4B                           * 2D96A  75
            DoSt:(s,_,s)                         * 2D974
            !!append$                            * 2D979
            CRLF$                                * 2D97E
            !!append$                            * 2D983
            LOOP                                 * 2D988
          ;                                      * 2D98D
          LAMERRMSG                              * 2D992
          !insert$                               * 2D997
        ;                                        * 2D99C

* refs (3): 2DA40 2DB58 2DE1E
SetServMode:
        CON(5)  (*)+5                            * 2D9A1  primitive code object
        ASSEMBLE
        LC(3)   #202                             * 2D9A6
        GOVLNG  SetISysFlag                      * 2D9AB

* refs (5): 2D363 2DB4E 2DE14 2E059 2E086
ClrServMode:
        CON(5)  (*)+5                            * 2D9B2  primitive code object
        LC(3)   #202                             * 2D9B7
        GOVLNG  L_539F1                          * 2D9BC
        RPL

* refs (2): 2D9EB 2DAEA
OBJ_2D9C3:
        ::                                       * 2D9C3
          NoIgnoreAlm                            * 2D9C8
          GETKEY                                 * 2D9CD
          NOT?SEMI                               * 2D9D2
          DROP                                   * 2D9D7
          FLUSHKEYS                              * 2D9DC
          DoBadKey                               * 2D9E1
          COLA                                   * 2D9E6
          OBJ_2D9C3                              * 2D9EB
        ;                                        * 2D9F0

* refs (2): 21FDB AFE1B
DOSERVER:
        ::                                       * 2D9F5
          KERMOPEN                               * 2D9FA
          CHOOSE_INIT                            * 2D9FF
          OBJ_2D37C                              * 2DA04
          BINT0                                  * 2DA09
          TRUE                                   * 2DA0E
          {                                      * 2DA13
            LAMEXCHP                             * 2DA18
            LAMKP                                * 2DA1D
            LAMPKNO                              * 2DA22
            nohalt                               * 2DA27
          }                                      * 2DA2C
          BIND                                   * 2DA31
          ERRSET                                 * 2DA36
          ::                                     * 2DA3B
            SetServMode                          * 2DA40
L_2DA45:
            ClrDA1IsStat                         * 2DA45

* refs (4): 2DDE7 2E06D 2E090 2EB14
OBJ_2DA4A:
            ::                                   * 2DA4A
              BINT39                             * 2DA4F
              TestSysFlag                        * 2DA54
              COLA                               * 2DA59
              ?SKIP                              * 2DA5E
            ;                                    * 2DA63
            ::                                   * 2DA68
              CLEARVDISP                         * 2DA6D
              CLEARMENU                          * 2DA72
            ;                                    * 2DA77
            #       C0C                          * 2DA7C  3084
            JstGetTHEMESG                        * 2DA86
            KDispStatus2                         * 2DA8B
            OBJ_2D37C                            * 2DA90
            CHOOSE_INIT                          * 2DA95
L_2DA9A:
            '                                    * 2DA9A
            LAMEXCHP                             * 2DA9F
            STO                                  * 2DAA4
            'LamKPSto                            * 2DAA9
            BINT0                                * 2DAAE

* refs (4): 2D535 2DB71 2F392 2F835
OBJ_2DAB3:
            ::                                   * 2DAB3
              '                                  * 2DAB8
              LAMPKNO                            * 2DABD
              STO                                * 2DAC2
            ;                                    * 2DAC7
            BEGIN                                * 2DACC
            OBJ_2E2B4                            * 2DAD1
            NOT_WHILE                            * 2DAD6
            ::                                   * 2DADB
              DROP                               * 2DAE0
              SENDNAK                            * 2DAE5
              OBJ_2D9C3                          * 2DAEA
              ATTN?                              * 2DAEF
              case                               * 2DAF4
              ::                                 * 2DAF9
                ATTNFLGCLR                       * 2DAFE
                2RDROP                           * 2DB03
              ;                                  * 2DB08
              ALARM?                             * 2DB0D
              case                               * 2DB12
              ::                                 * 2DB17
                ALARMxcp                         * 2DB1C
                DROP                             * 2DB21
                NOT?SEMI                         * 2DB26
                CtlAlarm!                        * 2DB2B
                DoCAlarmKey                      * 2DB30
              ;                                  * 2DB35
              TIMEOUT?                           * 2DB3A
              IT                                 * 2DB3F
              ::                                 * 2DB44
                TurnOff                          * 2DB49
                ClrServMode                      * 2DB4E
                KERMOPEN                         * 2DB53
                SetServMode                      * 2DB58
              ;                                  * 2DB5D
            ;                                    * 2DB62
            REPEAT                               * 2DB67
L_2DB6C:
            BINT0                                * 2DB6C
            OBJ_2DAB3                            * 2DB71
            CHR_S                                * 2DB76
            OBJ_2D78F                            * 2DB7B
            L_2DEED                              * 2DB80
            CHR_I                                * 2DB85
            OBJ_2D78F                            * 2DB8A
            L_2DE41                              * 2DB8F
            ROT                                  * 2DB94
            DECODE                               * 2DB99
            3UNROLL                              * 2DB9E
            CHR_R                                * 2DBA3
            OBJ_2D78F                            * 2DBA8
            L_2DFB4                              * 2DBAD
            CHR_C                                * 2DBB2
            OBJ_2D78F                            * 2DBB7
            L_2DD4C                              * 2DBBC
            CHR_G                                * 2DBC1
            OBJ_2D78F                            * 2DBC6
            L_2DE98                              * 2DBCB
            DUP                                  * 2DBD0
            CHR_E                                * 2DBD5
            EQUALcase                            * 2DBDA
            ::                                   * 2DBDF
              2DROP                              * 2DBE4
              OBJ_30E6C                          * 2DBE9
              GOTO                               * 2DBEE
              L_2DFA5                            * 2DBF3
            ;                                    * 2DBF8
            3DROP                                * 2DBFD
L_2DC02:
            InvalServCmd                         * 2DC02
L_2DC07:
            OBJ_2EFA0                            * 2DC07
            DUP                                  * 2DC0C
            OBJ_2F01D                            * 2DC11
            %2                                   * 2DC16
            dowait                               * 2DC1B
            SENDERROR                            * 2DC20
            GOTO                                 * 2DC25
            L_2DA45                              * 2DC2A
L_2DC2F:
            OBJ_26886                            * 2DC2F
            ERRSET                               * 2DC34

StringVarsBytes(st):
            ::                                   * 2DC39
              DOVARS                             * 2DC3E
              DUPLENCOMP                         * 2DC43
              DUP#0=ITE                          * 2DC48
              2DROP                              * 2DC4D
              ::                                 * 2DC52
                #1+_ONE_DO                       * 2DC57
                DUPINDEX@                        * 2DC5C
                NTHCOMDDUP                       * 2DC61
                ID>$                             * 2DC66
                APPEND_SPACE                     * 2DC6B
                OVER                             * 2DC70
                VARSIZE                          * 2DC75
                EDITDECOMP$                      * 2DC7A
                APPEND_SPACE                     * 2DC7F
                4ROLL                            * 2DC84
                XEQRCL                           * 2DC89
                OBJ_15CCF                        * 2DC8E
                APPEND_SPACE                     * 2DC93
                SWAP                             * 2DC98
                #>%                              * 2DC9D
                EDITDECOMP$                      * 2DCA2
                !append$                         * 2DCA7
                !append$                         * 2DCAC
                APNDCRLF                         * 2DCB1
                ROT                              * 2DCB6
                !insert$                         * 2DCBB
                SWAPLOOP                         * 2DCC0
                DROP                             * 2DCC5
              ;                                  * 2DCCA
            ;                                    * 2DCCF
            ERRTRAP                              * 2DCD4
            DropSysErr$                          * 2DCD9
            GOTO                                 * 2DCDE
            L_2DE05                              * 2DCE3

* refs (1): 2DDA1
OBJ_2DCE8:
            ::                                   * 2DCE8
              ERRN                               * 2DCED
              DUP#0=case                         * 2DCF2
              ::                                 * 2DCF7
                OBJ_2EFA0                        * 2DCFC
                APNDCRLF                         * 2DD01
                SENDERROR                        * 2DD06
                ERRJMP                           * 2DD0B
              ;                                  * 2DD10
              GETTHEMESG                         * 2DD15
              REALSTRSTR                         * 2DD1A
              JstGetTHEMESG                      * 2DD1F
              APPEND_SPACE                       * 2DD24
              !insert$                           * 2DD29
              NEWLINE$                           * 2DD2E
              !append$                           * 2DD33
              '                                  * 2DD38
              LAMERRMSG                          * 2DD3D
              STO                                * 2DD42
            ;                                    * 2DD47
L_2DD4C:
            TWODROPNULL$                         * 2DD4C
            BINT0                                * 2DD51
            {                                    * 2DD56
              LAMERRMSG                          * 2DD5B
              NULLLAM                            * 2DD60
            }                                    * 2DD65
            BIND                                 * 2DD6A
            #       C11                          * 2DD6F  3089
            JstGetTHEMESG                        * 2DD79
            KDispRow2                            * 2DD7E
            KINVISLF                             * 2DD83
            &$                                   * 2DD88
            FLUSHKEYS                            * 2DD8D
            xIFERR                               * 2DD92
            xSTR>                                * 2DD97
            xERRTHEN                             * 2DD9C
            OBJ_2DCE8                            * 2DDA1
            xIFEND                               * 2DDA6
            CK0NOLASTWD                          * 2DDAB
            0LASTOWDOB!                          * 2DDB0
            ERRSET                               * 2DDB5
            OBJ_2D92E                            * 2DDBA
            ERRTRAP                              * 2DDBF

* refs (2): 2DCD9 2E768
DropSysErr$:
            ::                                   * 2DDC4
              DropSysObs                         * 2DDC9
              ERROR@                             * 2DDCE
              OBJ_2EFA0                          * 2DDD3
              APNDCRLF                           * 2DDD8
            ;                                    * 2DDDD
            ABND                                 * 2DDE2
            OBJ_2DA4A                            * 2DDE7
            ::                                   * 2DDEC
              TOADISP                            * 2DDF1
              REDISPHBUFF                        * 2DDF6
              ClrDAsOK                           * 2DDFB
            ;                                    * 2DE00
L_2DE05:
            NULL$SWAP                            * 2DE05
            CHR_X                                * 2DE0A
            OBJ_2EF1E                            * 2DE0F
            ClrServMode                          * 2DE14
            KERMOPEN                             * 2DE19
            SetServMode                          * 2DE1E
L_2DE23:
            ?GOTO                                * 2DE23
            L_2DA45                              * 2DE28
            ?GOTO                                * 2DE2D
            L_2DB6C                              * 2DE32
            GOTO                                 * 2DE37
            L_2DC07                              * 2DE3C
L_2DE41:
            2DROP                                * 2DE41
            ACK_INIT                             * 2DE46
            NOT?GOTO                             * 2DE4B
            L_2DC07                              * 2DE50
            BINT0                                * 2DE55
            SENDACK                              * 2DE5A
            CHOOSE_INIT                          * 2DE5F
            CODE                                 * 2DE64  32 nibbles
              GOSUBL  SUB_3086F                  * 2DE6E
              D0=D0+  2                          * 2DE74
              D1=D1+  2                          * 2DE77
              A=DAT1  B                          * 2DE7A
              DAT0=A  B                          * 2DE7D
              LC(2)   #31                        * 2DE80
              DAT1=C  B                          * 2DE84
              GOVLNG  GETPTRLOOP                 * 2DE87
            ENDCODE                              * 2DE8E
            GOTO                                 * 2DE8E
            L_2DA9A                              * 2DE93
L_2DE98:
            DROPSWAP                             * 2DE98
            CAR$                                 * 2DE9D
            DUP                                  * 2DEA2
            CHR_F                                * 2DEA7
            EQUAL                                * 2DEAC
            OVER                                 * 2DEB1
            CHR_L                                * 2DEB6
            EQUALOR                              * 2DEBB
            casedrop                             * 2DEC0
            SENDNULLACK                          * 2DEC5
            CHR_D                                * 2DECA
            EQUAL                                * 2DECF
            ?GOTO                                * 2DED4
            L_2DC2F                              * 2DED9
            DROP                                 * 2DEDE
            GOTO                                 * 2DEE3
            L_2DC02                              * 2DEE8
L_2DEED:
            2DROP                                * 2DEED
            NULL$                                * 2DEF2
            DUP                                  * 2DEF7
            FALSE                                * 2DEFC
            {                                    * 2DF01
              LAMLNAME                           * 2DF06
              LAMKMODE                           * 2DF0B
              LAMKRM                             * 2DF10
            }                                    * 2DF15
            BIND                                 * 2DF1A
            ERRSET                               * 2DF1F
            OBJ_2F709                            * 2DF24
            ERRTRAP                              * 2DF29
            ::                                   * 2DF2E
              DropSysObs                         * 2DF33
              ERROR@                             * 2DF38
              OBJ_2E4BE                          * 2DF3D
              FALSE                              * 2DF42
            ;                                    * 2DF47
            ABND                                 * 2DF4C
            ?GOTO                                * 2DF51
            L_2DA45                              * 2DF56
            ?GOTO                                * 2DF5B
            L_2DB6C                              * 2DF60
            DUP                                  * 2DF65
            OBJ_2EFA0                            * 2DF6A
            SWAP                                 * 2DF6F
            #SyntaxErr                           * 2DF74
            #=                                   * 2DF79
            IT                                   * 2DF7E

* refs (1): 2D8FC
Conc:RC(2st):
            ::                                   * 2DF83

_:chr(10)_:
              $       ":\0A"                     * 2DF88
              !append$                           * 2DF96
              !insert$                           * 2DF9B
            ;                                    * 2DFA0
L_2DFA5:
            OBJ_2F01D                            * 2DFA5
            GOTO                                 * 2DFAA
            L_2DA45                              * 2DFAF
L_2DFB4:
            2DROP                                * 2DFB4
            DUP                                  * 2DFB9
            palparse                             * 2DFBE
            NOTcase                              * 2DFC3
            ::                                   * 2DFC8
              4DROP                              * 2DFCD
              OBJ_2DFE6                          * 2DFD2
            ;                                    * 2DFD7
            dup;#nm?                             * 2DFDC
            case2drop                            * 2DFE1

* refs (1): 2DFD2
OBJ_2DFE6:
            ::                                   * 2DFE6
              OBJ_672DC                          * 2DFEB
              GOTO                               * 2DFF0
              L_2DC07                            * 2DFF5
            ;                                    * 2DFFA
            DRPExitAtLOOP                        * 2DFFF
            NOTcasedrop                          * 2E004
            ::                                   * 2E009
              OBJ_2E7D6                          * 2E00E
              GOTO                               * 2E013
              L_2DC07                            * 2E018
            ;                                    * 2E01D
            CHR_F                                * 2E022
            OBJ_2EF1E                            * 2E027
            GOTO                                 * 2E02C
            L_2DE23                              * 2E031
          ;                                      * 2E036
          ERRTRAP                                * 2E03B
          ::                                     * 2E040
            ERROR@                               * 2E045
            DUP                                  * 2E04A
            #0=?SEMI                             * 2E04F
            FLUSHKEYS                            * 2E054
            ClrServMode                          * 2E059
            GETTHEMESG                           * 2E05E
            SENDERROR                            * 2E063
            AllowPrlcdCl                         * 2E068
            OBJ_2DA4A                            * 2E06D
            ClrDAsOK                             * 2E072
            ERRJMP                               * 2E077
          ;                                      * 2E07C
          FLUSHKEYS                              * 2E081
          ClrServMode                            * 2E086
          AllowPrlcdCl                           * 2E08B
          OBJ_2DA4A                              * 2E090
          ClrDAsOK                               * 2E095
          ABND                                   * 2E09A
          DropSysObs                             * 2E09F
        ;                                        * 2E0A4
