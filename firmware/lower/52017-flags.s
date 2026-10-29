* HP 48GX ROM revision R, #52017-#53FFF: System and user flags
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: TestSysFlag SetSysFlag ClrSysFlag SetISysFlag EditLExists? TestUserFlag COERCEFLAG C%0 RAD? NOTNUM? POPHXS SETNUM
* Follows on from the previous file (at #52017 in the original ROM).
        RPL

* refs (2): 51F9F 51FB8
OBJ_52017:
        :: DROPDUP =0?(nb) NOTcase OBJ_5203A     * 52017
          drop;doerr304 ;                        * 52030

* refs (8): 2B18A 51FE0 51FFE 5202B 52526 97A00 ...
OBJ_5203A:
        :: BINT22 TestSysFlag NOTcasedrop INFRESERR * 5203A
          BINT26 SetSysFlag ;                    * 52053

* C% -> %
* refs (4): 1AA38 37C84 37CA7 4FCD7
C%ABS:
        :: C%>% 2%>%%SQR %%SQRT %%>% ;           * 52062

* C%% -> %%
* refs (1): 37C8E
C%%ABS:
        :: C%%>%% %%SQR %%SQRT ;                 * 52080

* C% -> %
* refs (1): 1B2F4
C%ARG:
        :: C%>% %>%%ANGLE %%>% ;                 * 52099

* refs (6): 2B49D 37A9F 520E4 52120 91D4C 92E7B
2DUP%%R:
        :: 2DUP %%SQR %%SQRT ;                   * 520B2

* C% -> C%/C%ABS
* refs (1): 1B343
C%SGN:
        :: DUP C%0= ?SEMI                        * 520CB
          C%>%% 2DUP%%R ROTOVER %%/ 3UNROLL %%/ %%>C% ; * 520DF

* C% -> SQRTC%
* refs (2): 1B38D 1B413
C%SQRT:
        :: DUP C%0= ?SEMI                        * 52107
          C%>%% 2DUP%%R 3PICK %%ABS %%+ %%2 %%/ %%SQRT DUPDUP %%+ ROTSWAP * 5211B
          %%/ ROT %%0>= case %%>C%               * 52152
          DUP %%ABS 3UNROLL %%0>= ?SKIP %%CHS    * 5216B
          %%>C% ;                                * 52189

* C% -> e^C%
* refs (1): 1B91E
C%EXP:
        :: C%>%% exp(,i)(2rr) ;                  * 52193

* refs (3): 5219D 52338 523BF
exp(,i)(2rr):
        :: SWAP %%EXP OVER %%COSRAD OVER %%*ROT %%SINRAD ROT %%* %%>C% ; * 521A7

* C% -> ln C%
* refs (2): 1B968 1B9B3
C%LN:
        :: DUP C%0= case OBJ_51FDB               * 521E3
          C%>%% OBJ_52215 %%ANGLERAD %%>C% ;     * 521FC

* refs (4): 52201 522D3 523B0 523E7
OBJ_52215:
        :: 2DUP OVER %%ABS %%7E-1 %%>= ITE OBJ_52283 * 52215
          :: DUPUNROT %%ABS %%7E-1 %%>= case OBJ_52283 * 5223D
            %%SQR %%LN ;                         * 52260

SYMUVAL:
          %%2 %%/ 3UNROLL ;                      * 5226F

* refs (2): 52238 5225B
OBJ_52283:
        :: DUP %%*SWAP %%1 2DUP %%+ 3UNROLL %%- %%* %%+ %%LNP1 ; * 52283

* C% -> log C%
* refs (2): 1B9DF 1BA2A
C%LOG:
        :: C%0=case OBJ_51FDB                    * 522BF
          C%>%% OBJ_52215 %%ANGLERAD %%2.30258509299405 %%/ SWAP * 522CE
          %%2.30258509299405 %%/ SWAP %%>C% ;    * 522EC

* C% -> 10^C%
* refs (1): 1BA56
C%ALOG:
        :: C%>%%                                 * 52305

* refs (3): 522DD 522EC 5232E
%%2.30258509299405:
          %% 2.30258509299405E0 %%*SWAP %%2.30258509299405 %%*SWAP * 5230F
          exp(,i)(2rr) ;                         * 52338

* % C% -> C%'
* refs (2): 1B046 1B16A
C%R^C:
        :: SWAP Re>C% SWAP C%C^C ;               * 52342

* C% % -> C%'
* refs (1): 1B050
C%C^R:
        :: Re>C% C%C^C ;                         * 52360

* C% C%' -> C%''
* refs (3): 1B05A 52356 5236A
C%C^C:
        :: OVER C%0= case C%C^C~1                * 52374
          C%>%% DUP %%0<> case                   * 5238D
          :: ROT C%>%% OBJ_52215 %%ANGLERAD ãcplx(4rr) exp(,i)(2rr) ; * 523A1
          DROPSWAP C%>%% DUP %%0<> ITE           * 523C9
          :: OBJ_52215 %%ANGLEDEG UNROTOVER %%*UNROT %%*SWAP %%EXP OVER * 523E2
            %%COSDEG OVER %%* ROT %%SINDEG ROT ; * 5240A
          :: DROP 2DUP %%ABS SWAP %%^ 3UNROLL %%0 %%ANGLEDEG %%* DUP * 5242D
            %%COSDEG SWAP %%SINDEG UNROTOVER %%*UNROT ; * 52464
          %%* %%>C% ;                            * 52482

* refs (1): 52388
C%C^C~1:
        :: SWAPDROP C%>% OVER %0> case2drop      * 52491

* (0,0)
* refs (17): 19271 36061 36886 3688B 36890 379B9 ...
C%0:
          C% 0E0 0E0                             * 524AF
          %0= NOTcase                            * 524D4

* refs (1): 52030
drop;doerr304:
          :: DROP SETIVLERR ;                    * 524DE
          j%0=case                               * 524F2

* (1,0)
* refs (3): 37A45 56494 5F1A9
C%1:
          C% 1E0 0E0                             * 524F7
          %MAXREAL Re>C% OBJ_5203A ;             * 5251C

* C% -> sin C%
* refs (2): 1B4C5 52639
C%SIN:
        :: C%>%% 2DUP %%COSH SWAP %%SINRAD %%*UNROT %%SINH SWAP %%COSRAD %%* * 52530
          %%>C% ;                                * 52567

* C% -> cos C%
* refs (2): 1B51E 52652
C%COS:
        :: C%>%% 2DUP %%COSH SWAP %%COSRAD %%*UNROT %%SINH SWAP %%SINRAD %%* * 52571
          %%CHS %%>C% ;                          * 525A8

* C% -> tan C%
* refs (2): 1B577 52666
C%TAN:
        :: C%>%% DUP %%SINH DUPDUP %%* 4PICK %%COSRAD DUPDUP %%*ROT %%+ * 525B7
          5ROLL %%SINRAD ROT %%* OVER %%/ 4ROLL %%COSH 4ROLL %%*ROT %%/ * 525EE
          %%>C% ;                                * 52625

* C% -> sinh C%
* refs (1): 1B5D0
C%SINH:
        :: C%*i C%SIN C/i ;                      * 5262F

* C% -> cosh C%
* refs (1): 1B61F
C%COSH:
        :: C%*i C%COS ;                          * 52648

* C% -> tanh C%
* refs (1): 1B66E
C%TANH:
        :: C%*i C%TAN C/i ;                      * 5265C

* C% -> atan C%
* refs (2): 1B7B5 527F5
C%ATAN:
        :: DUP                                   * 52675

* (0,1)
* refs (3): 3C0BC 54D62 8A2FC
C%i:
          C% 0E0 1E0 EQUAL OVER                  * 5267F

* (0,-1)
C%-i:
          C% 0E0 -1E0 EQUAL ORcase C%ATAN~1      * 526AE
          C%>%% %%1 2DUP OVER %%- 3UNROLL %%+ %%* OVER %%ABS DUP %%4 %%*SWAP * 526E2
          %%1 %%- DUP %%* 5PICK DUP %%* DUPUNROT %%+ 4ROLLROT %%- 5ROLL * 52723
          DUPDUP %%+ ROTSWAP %%ANGLERAD %%2 %%/ SWAP %%0<> ?SKIP * 5275F
          :: %%ABS 4PICK %%0>= ?SKIP %%CHS       * 5278C
          ;                                      * 527AA
          4UNROLL %%/ %%LNP1 %%4 %%/ %%ABS SWAP %%0>= ?SKIP %%CHS * 527AF
          %%>C% ;                                * 527E1

* C% -> atanh C%
* refs (2): 1B8BB 1B8F2
C%ATANH:
        :: C%*i C%ATAN C/i ;                     * 527EB

* C% -> asin C%
* refs (3): 1B6BD 1B71C 52827
C%ASIN:
        :: OBJ_52881 SWAPDROPSWAP %%>C% ;        * 52804

* C% -> asinh C%
* refs (1): 1B804
C%ASINH:
        :: C%*i C%ASIN C/i ;                     * 5281D

* C% -> acosh C%
* refs (2): 1B849 1B88F
C%ACOSH:
        :: C%ACOS DUP C>Im% %0> case C/i         * 52836
          C%*i ;                                 * 52859

* C% -> acos C%
* refs (3): 1B748 1B789 5283B
C%ACOS:
        :: OBJ_52881 DROPSWAP %%CHS %%>C% ;      * 52863

* refs (2): 52809 52868
OBJ_52881:
        :: C%>%% 2DUP DUP %%*SWAP %%ABS DUP 1+(rr) DUPDUP %%* 4PICK %%+ * 52881
          %%SQRT %%+ 3PICKSWAP %%/ OVER %%1 %%- %%ABS DUPDUP %%* 5PICK %%+ * 528BD
          %%SQRT %%+ 4ROLLOVER DUP %%0<> ITE %%/ * 528F9

drop2;%%0:
          :: 2DROP %%0 ;                         * 5291C
          UNROTOVER %%+ 3UNROLL %%+ ROT %%1 %%< ?SKIPSWAP DUP %%2 %%+ * 52930
          ROTOVER %%/ %%2 OVER %%- %%* %%SQRT 5PICK DUP %%+ ROT %%/ ROT %%2 * 52967
          %%/ DUP %%2 %%+ OVER %%* %%SQRT %%+ %%LNP1 5ROLL 5ROLL DUP %%0= * 529AD
          ITE                                    * 529EE

drop;<0(rr)?:
          :: DROP %%0< ;                         * 529F3

drop(2);ò0(rr)?:
          :: SWAPDROP %%0>= ;                    * 52A07
          ?SKIP %%CHS                            * 52A1B
          UNROTDUP %%ABS                         * 52A25

* refs (2): 52229 5224C
%%7E-1:
          %% 7E-1 %%<= case                      * 52A2F
          :: SWAPDROPDUP %%ACOSRAD SWAP %%ASINRAD ; * 52A53
          SWAPDUP %%ASINRAD SWAP %%ACOSRAD %%ABS ROT %%0>= ?SEMI * 52A71
          %%CHS %%PI ROT %%- SWAP ;              * 52A99
        ASSEMBLE

* ( C%pop -> A:C ) Pop C% (<REF>SETDEC )
* refs (4): 51A4F 51A64 51B75 51BB7
POPC%:
        A=DAT1  A                                * 52AB7
        D1=D1+  5                                * 52ABA
        D=D+1   A                                * 52ABD
        GOSBVL  SAVPTR                           * 52ABF
        D1=A                                     * 52AC6
        D1=D1+  5                                * 52AC9
        A=DAT1  W                                * 52ACC
        D1=D1+  16                               * 52AD0
        C=DAT1  W                                * 52AD3
        SETDEC                                   * 52AD7
        RTN                                      * 52AD9

* ( A:C -> C%push ) Push C%
* refs (1): 51B81
PUSHC%:
        ST=0    10                               * 52ADB
        SETHEX                                   * 52ADE
        ?A#0    M                                * 52AE0
        GOYES   L_52AE8                          * 52AE3
        A=0     W                                * 52AE5
L_52AE8:
        R0=A                                     * 52AE8
        ?C#0    M                                * 52AEB
        GOYES   L_52AF3                          * 52AEE
        C=0     W                                * 52AF0
L_52AF3:
        R1=C                                     * 52AF3
L_52AF6:
        P=      0                                * 52AF6
        GOSBVL  ROOM                             * 52AF8
        A=C     A                                * 52AFF
        LC(5)   #00030                           * 52B01
        ?C>A    A                                * 52B08
        GOYES   L_52B4D                          * 52B0B
        LC(2)   #25                              * 52B0D
        GOSBVL  CREATETEMP                       * 52B11
        AD0EX                                    * 52B18
        D0=A                                     * 52B1B
        LC(5)   DOCMP                            * 52B1E
        DAT0=C  A                                * 52B25
        D0=D0+  5                                * 52B28
        C=R0                                     * 52B2B
        DAT0=C  W                                * 52B2E
        D0=D0+  16                               * 52B32
        C=R1                                     * 52B35
        DAT0=C  W                                * 52B38
        GOSBVL  GETPTR                           * 52B3C
        D=D-1   A                                * 52B43
        D1=D1-  5                                * 52B45
        DAT1=A  A                                * 52B48
        RTN                                      * 52B4B
L_52B4D:
        GOSBVL  St10Gb                           * 52B4D
        GONC    L_52AF6                          * 52B54

* ( C%%pop -> A:B C:D) Pop C%% (<REF>SETDEC )
* refs (8): 3575D 37815 378D9 37CBB 519FD 51B96 ...
POPC%%:
        A=DAT1  A                                * 52B57
        D1=D1+  5                                * 52B5A
        D=D+1   A                                * 52B5D
        GOSBVL  SAVPTR                           * 52B5F
        D1=A                                     * 52B66
        D1=D1+  5                                * 52B69
        A=DAT1  A                                * 52B6C
        D1=D1+  5                                * 52B6F
        C=DAT1  W                                * 52B72
        A=C     S                                * 52B76
        B=C     W                                * 52B79
        D1=D1+  16                               * 52B7C
        C=DAT1  A                                * 52B7F
        D=C     A                                * 52B82
        D1=D1+  5                                * 52B84
        C=DAT1  W                                * 52B87
        DCEX    W                                * 52B8B
        C=D     S                                * 52B8E
        SETDEC                                   * 52B91
        RTN                                      * 52B93

* ( A:B:C:D -> C%%push ) Push C%%
* refs (2): 37849 51BA2
PUSHC%%:
        ST=0    10                               * 52B95
        SETHEX                                   * 52B98
        ?B#0    M                                * 52B9A
        GOYES   L_52BA2                          * 52B9D
        A=0     W                                * 52B9F
L_52BA2:
        R0=A                                     * 52BA2
        B=A     S                                * 52BA5
        A=B     W                                * 52BA8
        R1=A                                     * 52BAB
        ?D#0    M                                * 52BAE
        GOYES   L_52BB6                          * 52BB1
        C=0     W                                * 52BB3
L_52BB6:
        R2=C                                     * 52BB6
        D=C     S                                * 52BB9
        C=D     W                                * 52BBC
        R3=C                                     * 52BBF
L_52BC2:
        P=      0                                * 52BC2
        GOSBVL  ROOM                             * 52BC4
        A=C     A                                * 52BCB
        LC(5)   #0003A                           * 52BCD
        ?C>A    A                                * 52BD4
        GOYES   L_52C2B                          * 52BD7
        LC(2)   #2F                              * 52BD9
        GOSBVL  CREATETEMP                       * 52BDD
        AD0EX                                    * 52BE4
        D0=A                                     * 52BE7
        LC(5)   DOECMP                           * 52BEA
        DAT0=C  A                                * 52BF1
        D0=D0+  5                                * 52BF4
        C=R0                                     * 52BF7
        DAT0=C  A                                * 52BFA
        D0=D0+  5                                * 52BFD
        C=R1                                     * 52C00
        DAT0=C  W                                * 52C03
        D0=D0+  16                               * 52C07
        C=R2                                     * 52C0A
        DAT0=C  A                                * 52C0D
        D0=D0+  5                                * 52C10
        C=R3                                     * 52C13
        DAT0=C  W                                * 52C16
        GOSBVL  GETPTR                           * 52C1A
        D=D-1   A                                * 52C21
        D1=D1-  5                                * 52C23
        DAT1=A  A                                * 52C26
        RTN                                      * 52C29
L_52C2B:
        GOSBVL  St10Gb                           * 52C2B
        GOTO    L_52BC2                          * 52C32
        RPL

* seco %precision %lo %hi -> %integral %error
* refs (1): 5682C
CALCINTEG:
        :: 2DUP %= case                          * 52C36
          :: 4DROP %0_2A2B4 %0_2A2B4 ;           * 52C4A
          SWAPROT %1 %MIN                        * 52C63

%1E-12:
          % 1E-12 %MAX                           * 52C72
          CODE                                   * 52C8C  139 nibbles
            GOSBVL  POP2%                        * 52C96
            R0=C                                 * 52C9D
            R1=A                                 * 52CA0
            SETHEX                               * 52CA3
            D1=(5)  DSKTOP                       * 52CA5
            A=DAT1  A                            * 52CAC
            D1=A                                 * 52CAF
            A=DAT1  A                            * 52CB2
            D1=A                                 * 52CB5
            D1=D1+  5                            * 52CB8
            A=DAT1  W                            * 52CBB
            R2=A                                 * 52CBF
            LC(5)   #0018F                       * 52CC2
            GOSBVL  GETTEMP                      * 52CC9
            AD0EX                                * 52CD0
            D0=A                                 * 52CD3
            D1=C                                 * 52CD6
            LC(5)   DOHSTR                       * 52CD9
            DAT0=C  A                            * 52CE0
            D0=D0+  5                            * 52CE3
            D1=D1-  5                            * 52CE6
            CD1EX                                * 52CE9
            DAT0=C  A                            * 52CEC
            D0=D0+  5                            * 52CEF
            C=R1                                 * 52CF2
            DAT0=C  W                            * 52CF5
            D0=D0+  16                           * 52CF9
            C=R2                                 * 52CFC
            DAT0=C  W                            * 52CFF
            D0=D0+  16                           * 52D03
            C=R0                                 * 52D06
            DAT0=C  W                            * 52D09
            GOSBVL  GETPTR                       * 52D0D
            DAT1=A  A                            * 52D14
            A=DAT0  A                            * 52D17
            D0=D0+  5                            * 52D1A
            PC=(A)                               * 52D1D
          ENDCODE                                * 52D21
          ZEROFALSE                              * 52D21

* -> {}
* refs (9): 0F972 1DF4E 40FB3 43020 436D5 98703 ...
4NULLLAM{}:
          { NULLLAM NULLLAM NULLLAM NULLLAM } BIND * 52D26
          CODE                                   * 52D49  50 nibbles
            GOSUBL  SAVPTR~jump_5356F            * 52D53
            GOSUBL  SUB_5360F                    * 52D59
            D1=D1+  10                           * 52D5F
            A=DAT1  W                            * 52D62
            D1=D1+  16                           * 52D66
            C=DAT1  W                            * 52D69
            SETDEC                               * 52D6D
            GOSUBL  CALCINTEG~1                  * 52D6F
            GOSUBL  CALCINTEG~12                 * 52D75
            GOSUBL  DIVF~jump_535A0              * 52D7B
            GOTO    L_52F13                      * 52D81
          ENDCODE                                * 52D85
          CALCINTEG~6                            * 52D85
          CODE                                   * 52D8A  39 nibbles
            GOSBVL  POP1%                        * 52D94
            SETHEX                               * 52D9B
            GOSUBL  CALCINTEG~8                  * 52D9D
            DAT1=A  W                            * 52DA3
            D1=D1+  16                           * 52DA7
            A=0     S                            * 52DAA
            DAT1=A  W                            * 52DAD
            D1=D1+  16                           * 52DB1
            A=0     W                            * 52DB4
            GOTO    L_5346C                      * 52DB7
          ENDCODE                                * 52DBB
          BINT16 ONE_DO                          * 52DBB
          CODE                                   * 52DC5  60 nibbles
            CD1EX                                * 52DCF
            RSTK=C                               * 52DD2
            GOSUBL  SUB_5360F                    * 52DD4
            A=C     A                            * 52DDA
            LC(5)   #0016A                       * 52DDC
            C=C+A   A                            * 52DE3
            D1=C                                 * 52DE5
            A=0     W                            * 52DE8
            DAT1=A  W                            * 52DEB
            D1=D1+  16                           * 52DEF
            DAT1=A  W                            * 52DF2
            D1=D1+  16                           * 52DF6
            DAT1=A  A                            * 52DF9
            C=RSTK                               * 52DFC
            D1=C                                 * 52DFE
            A=DAT0  A                            * 52E01
            D0=D0+  5                            * 52E04
            PC=(A)                               * 52E07
          ENDCODE                                * 52E0B
          INDEX@ CALCINTEG~14 ONE_DO INDEX@ UNCOERCE ISTOP@ UNCOERCE * 52E0B
          CODE                                   * 52E2E  230 nibbles
            GOSBVL  POP2%                        * 52E38
            R4=A                                 * 52E3F
            R1=C                                 * 52E42
            A=-A-1  S                            * 52E45
            GOSUB   CALCINTEG~1                  * 52E48
            C=B     W                            * 52E4C
            D=C     W                            * 52E4F
            C=A     W                            * 52E52
            GOSUB   MULTF~jump_53592             * 52E55
            GOSUB   STAB2~jump_535BC             * 52E59
            C=R1                                 * 52E5D
            A=C     W                            * 52E60
            GOSUB   CALCINTEG~1                  * 52E63
            C=R4                                 * 52E67
            GOSUB   CALCINTEG~5                  * 52E6A
            GOSUB   RADDF~jump_53584             * 52E6E
            GOSUB   RCCD2~jump_535D1             * 52E72
            GOSUB   MULTF~jump_53592             * 52E76
            GOSUB   STAB2~jump_535BC             * 52E7A
            C=R1                                 * 52E7E
            A=C     W                            * 52E81
            GOSUB   CALCINTEG~2                  * 52E84
            C=R1                                 * 52E88
            GOSUB   CALCINTEG~5                  * 52E8B
            GOSUB   MULTF~jump_53592             * 52E8F
            GOSUB   RCCD2~jump_535D1             * 52E93
            GOSUB   CALCINTEG~3                  * 52E97
            GOSUB   STAB2~jump_535BC             * 52E9B
            GOSUB   SUB_5360F                    * 52E9F
            D1=D1+  10                           * 52EA3
            A=DAT1  W                            * 52EA6
            D1=D1+  16                           * 52EAA
            C=DAT1  W                            * 52EAD
            A=-A-1  S                            * 52EB1
            GOSUB   CALCINTEG~1                  * 52EB4
            GOSUBL  CALCINTEG~11                 * 52EB8
            GOSUB   DIVF~jump_535A0              * 52EBE
            GOSUB   RCCD2~jump_535D1             * 52EC2
            GOSUB   MULTF~jump_53592             * 52EC6
            C=DAT1  W                            * 52ECA
            GOSUB   STAB2~jump_535BC             * 52ECE
            A=-A-1  S                            * 52ED2
            GOSUB   CALCINTEG~5                  * 52ED5
            GOSUB   RADDF~jump_53584             * 52ED9
            GOSUB   CALCINTEG~4                  * 52EDD
            D1=D1-  16                           * 52EE1
            C=DAT1  W                            * 52EE4
            D=C     W                            * 52EE8
            LC(5)   #00150                       * 52EEB
            B=C     A                            * 52EF2
            CD1EX                                * 52EF4
            SETHEX                               * 52EF7
            C=C+B   A                            * 52EF9
            SETDEC                               * 52EFB
            D1=C                                 * 52EFD
            DAT1=A  W                            * 52F00
            C=D     W                            * 52F04
            GOSUB   RCAB2~jump                   * 52F07
            GOSUB   CALCINTEG~5                  * 52F0B
            GOSUB   RADDF~jump_53584             * 52F0F
L_52F13:
            GOSUB   CALCINTEG~4                  * 52F13
L_52F17:
            GOVLNG  PUSH%LOOP                    * 52F17
          ENDCODE                                * 52F1E
          CALCINTEG~6                            * 52F1E
          CODE                                   * 52F23  42 nibbles
            GOSBVL  POP1%                        * 52F2D
            SETHEX                               * 52F34
            GOSUB   SUB_5360F                    * 52F36
            B=C     A                            * 52F3A
            LC(5)   #0015A                       * 52F3C
            C=C+B   A                            * 52F43
            D1=C                                 * 52F45
            C=DAT1  W                            * 52F48
            CAEX    W                            * 52F4C
            DAT1=C  W                            * 52F4F
            GOTO    L_52F17                      * 52F53
          ENDCODE                                * 52F57
          CALCINTEG~6 INDEX@ UNCOERCE ISTOP@ UNCOERCE * 52F57
          CODE                                   * 52F70  211 nibbles
            GOSBVL  POP1%                        * 52F7A
            R2=A                                 * 52F81
            SETHEX                               * 52F84
            GOSUB   GETPTR~jump_53576            * 52F86
            GOSBVL  POP2%                        * 52F8A
            R4=C                                 * 52F91
            R3=A                                 * 52F94
            C=R2                                 * 52F97
            A=C     W                            * 52F9A
            GOSUB   CALCINTEG~2                  * 52F9D
            GOSUB   STAB0~jump_535B5             * 52FA1
            C=R4                                 * 52FA5
            A=C     W                            * 52FA8
            GOSUB   CALCINTEG~2                  * 52FAB
            A=-A-1  S                            * 52FAF
            GOSUB   RCCD0~jump_535CA             * 52FB2
            GOSUB   RADDF~jump_53584             * 52FB6
            GOSUB   RCCD0~jump_535CA             * 52FBA
            GOSUB   DIVF~jump_535A0              * 52FBE
            D=0     W                            * 52FC2
            C=0     W                            * 52FC5
            P=      13                           * 52FC8
            LC(2)   #15                          * 52FCA
            DCEX    W                            * 52FCE
            GOSUB   MULTF~jump_53592             * 52FD1
            GOSUB   STAB0~jump_535B5             * 52FD5
            GOSUB   SUB_5360F                    * 52FD9
            B=C     A                            * 52FDD
            P=      0                            * 52FDF
            LC(5)   #0015A                       * 52FE1
            SETHEX                               * 52FE8
            C=C+B   A                            * 52FEA
            SETDEC                               * 52FEC
            D1=C                                 * 52FEE
            C=DAT1  W                            * 52FF1
            A=R3                                 * 52FF5
            A=0     S                            * 52FF8
            C=0     S                            * 52FFB
            GOSUB   CALCINTEG~1                  * 52FFE
            GOSUB   RCCD0~jump_535CA             * 53002
            GOSUB   MULTF~jump_53592             * 53006
            D1=D1+  16                           * 5300A
            C=DAT1  W                            * 5300D
            GOSUB   CALCINTEG~5                  * 53011
            GOSUB   RADDF~jump_53584             * 53015
            GOSUB   CALCINTEG~4                  * 53019
            DAT1=A  W                            * 5301D
            D1=D1-  16                           * 53021
            C=DAT1  W                            * 53024
            A=R3                                 * 53028
            GOSUB   CALCINTEG~1                  * 5302B
            GOSUB   RCCD0~jump_535CA             * 5302F
            GOSUB   MULTF~jump_53592             * 53033
            D1=D1+  16                           * 53037
            D1=D1+  16                           * 5303A
            GOSUB   CALCINTEG~9                  * 5303D
            GOSUB   RADDF~jump_53584             * 53041
            GOSUB   CALCINTEG~10                 * 53045
            GOTO    L_53470                      * 53049
          ENDCODE                                * 5304D
          BINT2 +LOOP INDEX@ CALCINTEG~14 UNCOERCE * 5304D
          CODE                                   * 53066  354 nibbles
            GOSBVL  POP1%                        * 53070
            R4=A                                 * 53077
            C=A     W                            * 5307A
            GOSUB   CALCINTEG~2                  * 5307D
            GOSUB   STAB2~jump_535BC             * 53081
            GOSUB   CALCINTEG~8                  * 53085
            A=DAT1  W                            * 53089
            D1=D1+  16                           * 5308D
            D1=D1+  16                           * 53090
            C=DAT1  W                            * 53093
            GOSUB   CALCINTEG~1                  * 53097
            GOSUB   RCCD2~jump_535D1             * 5309B
            GOSUB   DIVF~jump_535A0              * 5309F
            A=-A-1  S                            * 530A3
            C=DAT1  W                            * 530A6
            GOSUB   CALCINTEG~5                  * 530AA
            GOSUB   RADDF~jump_53584             * 530AE
            D1=D1-  16                           * 530B2
            D1=D1-  16                           * 530B5
            C=DAT1  W                            * 530B8
            C=-C-1  S                            * 530BC
            GOSUB   CALCINTEG~5                  * 530BF
            GOSUB   RADDF~jump_53584             * 530C3
            CD1EX                                * 530C7
            RSTK=C                               * 530CA
            D=C     A                            * 530CC
            P=      0                            * 530CE
            LC(5)   #00140                       * 530D0  offset added to a RAM pointer
            SETHEX                               * 530D7
            C=C+D   A                            * 530D9
            SETDEC                               * 530DB
            D1=C                                 * 530DD
            GOSUB   CALCINTEG~9                  * 530E0
            GOSUB   STAB0~jump_535B5             * 530E4
            A=R4                                 * 530E8
            GOSBVL  SPLITA                       * 530EB
            GOSUB   CALCINTEG~3                  * 530F2
            GOSUB   RCCD0~jump_535CA             * 530F6
            GOSUB   RADDF~jump_53584             * 530FA
            GOSUB   CALCINTEG~12                 * 530FE
            GOSUB   DIVF~jump_535A0              * 53102
            C=RSTK                               * 53106
            D0=C                                 * 53108
            C=DAT0  W                            * 5310B
            GOSUB   CALCINTEG~5                  * 5310F
            GOSUB   RADDF~jump_53584             * 53113
            GOSUB   STAB0~jump_535B5             * 53117
            GOSUB   RCAB2~jump                   * 5311B
            GOSUB   CALCINTEG~11                 * 5311F
            GOSUB   MULTF~jump_53592             * 53123
            GOSUB   CALCINTEG~13                 * 53127
            GOSUB   RADDF~jump_53584             * 5312B
            GOSUB   RCCD0~jump_535CA             * 5312F
            GOSUB   CALCINTEG~3                  * 53133
            GOSUB   RCCD0~jump_535CA             * 53137
            GOSUB   RADDF~jump_53584             * 5313B
            GOSUB   CALCINTEG~10                 * 5313F
            D1=D1-  16                           * 53143
            A=DAT1  W                            * 53146
            C=R4                                 * 5314A
            GOSBVL  SPLTAC                       * 5314D
            GOSUB   DIVF~jump_535A0              * 53154
            GOSUB   CALCINTEG~8                  * 53158
            D1=D1+  16                           * 5315C
            C=DAT1  W                            * 5315F
            GOSUB   CALCINTEG~5                  * 53163
            GOSBVL  STCD0                        * 53167
            C=-C-1  S                            * 5316E
            GOSUB   RADDF~jump_53584             * 53171
            GOSBVL  EXAB0                        * 53175
            GOSUB   RCCD2~jump_535D1             * 5317C
            GOSUB   DIVF~jump_535A0              * 53180
            A=-A-1  S                            * 53184
            GOSUB   RCCD0~jump_535CA             * 53187
            GOSUB   RADDF~jump_53584             * 5318B
            GOSUB   CALCINTEG~12                 * 5318F
            GOSUB   DIVF~jump_535A0              * 53193
            C=DAT1  W                            * 53197
            GOSUB   CALCINTEG~5                  * 5319B
            GOSUB   RADDF~jump_53584             * 5319F
            GOSBVL  EXAB2                        * 531A3
            GOSUB   CALCINTEG~11                 * 531AA
            GOSUB   MULTF~jump_53592             * 531AE
            GOSUB   CALCINTEG~13                 * 531B2
            GOSUB   RADDF~jump_53584             * 531B6
            GOSUB   RCCD2~jump_535D1             * 531BA
            GOSUB   CALCINTEG~3                  * 531BE
            GOSUB   RCCD2~jump_535D1             * 531C2
            GOSUB   RADDF~jump_53584             * 531C6
            GOSUB   CALCINTEG~4                  * 531CA
            GOTO    L_5346C                      * 531CE
          ENDCODE                                * 531D2
          INDEX@ DUP                             * 531D2
          CODE                                   * 531DC  559 nibbles
            GOSBVL  POP#                         * 531E6
            GOSUB   SAVPTR~jump_5356F            * 531ED
            ASL     A                            * 531F1
            A=0     S                            * 531F3
            A=A+1   S                            * 531F6
            A=A+1   S                            * 531F9
            R4=A                                 * 531FC
            GOSUB   CALCINTEG~7                  * 531FF
            GOSUB   CALCINTEG~9                  * 53203
            GOSBVL  STCD0                        * 53207
            GOSBVL  RCAB0                        * 5320E
            GOSUB   CALCINTEG~4                  * 53215
            R3=A                                 * 53219
            GOSBVL  SPLITA                       * 5321C
            A=-A-1  S                            * 53223
            GOSUB   RCCD0~jump_535CA             * 53226
            GOSUB   RADDF~jump_53584             * 5322A
            GOSUB   CALCINTEG~4                  * 5322E
            D1=D1-  16                           * 53232
            DAT1=A  W                            * 53235
            D1=D1-  16                           * 53239
            CD1EX                                * 5323C
            RSTK=C                               * 5323F
            GOSUB   CALCINTEG~8                  * 53241
            C=DAT1  W                            * 53245
            A=R3                                 * 53249
            DAT1=A  W                            * 5324C
            C=-C-1  S                            * 53250
            GOSUB   CALCINTEG~1                  * 53253
            GOSUB   CALCINTEG~4                  * 53257
            C=RSTK                               * 5325B
            D1=C                                 * 5325D
            DAT1=A  W                            * 53260
            D1=D1+  16                           * 53264
            D1=D1+  16                           * 53267
            A=0     W                            * 5326A
            DAT1=A  W                            * 5326D
L_53271:
            A=R4                                 * 53271
            A=A-1   S                            * 53274
            R4=A                                 * 53277
            C=0     W                            * 5327A
            D=0     W                            * 5327D
            GOSBVL  STCD2                        * 53280
            GOSUB   SUB_5360F                    * 53287
            B=C     A                            * 5328B
            P=      0                            * 5328D
            LC(5)   #0005A                       * 5328F
            SETHEX                               * 53296
            B=B+C   A                            * 53298
            C=0     A                            * 5329A
            C=A     P                            * 5329C
            CSL     A                            * 5329F
            C=C+B   A                            * 532A1
            RSTK=C                               * 532A3
            D1=C                                 * 532A5
            C=DAT1  W                            * 532A8
            R1=C                                 * 532AC
            C=A     B                            * 532AF
            CSR     B                            * 532B2
            C=C-1   P                            * 532B5
            ?C<=A   P                            * 532B8
            GOYES   L_532D2                      * 532BB
            D1=D1+  16                           * 532BD
            A=DAT1  W                            * 532C0
            C=R1                                 * 532C4
            C=-C-1  S                            * 532C7
            GOSUB   CALCINTEG~1                  * 532CA
            GOSUB   STAB2~jump_535BC             * 532CE
L_532D2:
            GOSUB   CALCINTEG~7                  * 532D2
            A=DAT1  W                            * 532D6
            GOSBVL  SPLITA                       * 532DA
            GOSBVL  CALCINTEG~11                 * 532E1
            GOSUB   MULTF~jump_53592             * 532E8
            GOSUB   CALCINTEG~12                 * 532EC
            D=D+1   P                            * 532F0
            GOSUB   RADDF~jump_53584             * 532F3
            GOSUB   CALCINTEG~4                  * 532F7
            DAT1=A  W                            * 532FB
            D1=D1-  16                           * 532FF
            A=DAT1  W                            * 53302
            C=RSTK                               * 53306
            RSTK=C                               * 53308
            D0=C                                 * 5330A
            C=DAT0  W                            * 5330D
            C=-C-1  S                            * 53311
            GOSUB   CALCINTEG~1                  * 53314
            D1=D1-  16                           * 53318
            C=DAT1  W                            * 5331B
            GOSUB   CALCINTEG~5                  * 5331F
            GOSUB   RADDF~jump_53584             * 53323
            GOSUB   STAB0~jump_535B5             * 53327
            GOSUB   SUB_5360F                    * 5332B
            D1=D1+  10                           * 5332F
            D1=D1+  16                           * 53332
            D1=D1+  16                           * 53335
            A=DAT1  W                            * 53338
            D1=D1+  16                           * 5333C
            D1=D1+  16                           * 5333F
            C=DAT1  W                            * 53342
            GOSUB   CALCINTEG~2                  * 53346
            GOSUB   RCCD0~jump_535CA             * 5334A
            C=0     S                            * 5334E
            P=      6                            * 53351
            GOSBVL  TST15                        * 53353
            GOC     L_5339E                      * 5335A
            A=R4                                 * 5335D
            A=0     S                            * 53360
            A=A+1   S                            * 53363
            R4=A                                 * 53366
            GOSUB   CALCINTEG~7                  * 53369
            C=DAT1  W                            * 5336D
            GOSUB   CALCINTEG~5                  * 53371
            GOSUB   RCAB2~jump                   * 53375
            GOSUB   MULTF~jump_53592             * 53379
            GOSUB   RCCD0~jump_535CA             * 5337D
            GOSUB   DIVF~jump_535A0              * 53381
            GOSUB   CALCINTEG~12                 * 53385
            P=      6                            * 53389
            GOSBVL  TST15                        * 5338B
            GOC     L_5339E                      * 53392
            A=R4                                 * 53395
            A=A+1   S                            * 53398
            R4=A                                 * 5339B
L_5339E:
            GOSUB   CALCINTEG~7                  * 5339E
            C=DAT1  W                            * 533A2
            D1=D1-  16                           * 533A6
            GOSUB   CALCINTEG~5                  * 533A9
            GOSBVL  RCAB0                        * 533AD
            GOSUB   DIVF~jump_535A0              * 533B4
            C=DAT1  W                            * 533B8
            GOSUB   CALCINTEG~5                  * 533BC
            GOSUB   RADDF~jump_53584             * 533C0
            GOSUB   CALCINTEG~4                  * 533C4
            C=DAT1  W                            * 533C8
            DAT1=A  W                            * 533CC
            A=C     W                            * 533D0
            C=RSTK                               * 533D3
            D0=C                                 * 533D5
            DAT0=A  W                            * 533D8
            A=R4                                 * 533DC
            P=      0                            * 533DF
            SETHEX                               * 533E1
            ?A=0    S                            * 533E3
            GOYES   L_53404                      * 533E6
            C=A     B                            * 533E8
            CSR     B                            * 533EB
            A=A+1   P                            * 533EE
            R4=A                                 * 533F1
            ?C=A    P                            * 533F4
            GOYES   L_533FD                      * 533F7
            GOTO    L_53271                      * 533F9
L_533FD:
            GOVLNG  L_0370A                      * 533FD
L_53404:
            GOSUB   GETPTR~jump_53576            * 53404
            LC(5)   TRUE                         * 53408
            A=C     A                            * 5340F
            PC=(A)                               * 53411
          ENDCODE                                * 53415
          DUP 1PUTLAM ITE ISTOPSTO               * 53415
          CODE                                   * 53429  79 nibbles
            GOSBVL  POP#                         * 53433
            GOSUB   SAVPTR~jump_5356F            * 5343A
            B=A     A                            * 5343E
            GOSUB   SUB_5360F                    * 53440
            D=C     A                            * 53444
            LC(5)   #0016A                       * 53446
            C=C+D   A                            * 5344D
            D1=C                                 * 5344F
            A=DAT1  W                            * 53452
            GOSUB   SUB_5360F                    * 53456
            D=C     A                            * 5345A
            LC(5)   #0005A                       * 5345C
            C=C+D   A                            * 53463
            BSL     A                            * 53465
            C=C+B   A                            * 53467
            D1=C                                 * 53469
L_5346C:
            DAT1=A  W                            * 5346C
L_53470:
            SETHEX                               * 53470
            P=      0                            * 53472
            GOSUB   GETPTR~jump_53576            * 53474
            A=DAT0  A                            * 53478
            D0=D0+  5                            * 5347B
            PC=(A)                               * 5347E
          ENDCODE                                * 53482
          LOOP                                   * 53482
          1GETLAM ?SKIP                          * 53487
          CODE                                   * 53491  38 nibbles
            AD1EX                                * 5349B
            GOSUB   CALCINTEG~8                  * 5349E
            D1=D1+  16                           * 534A2
            C=DAT1  W                            * 534A5
            SETDEC                               * 534A9
            C=-C-1  S                            * 534AB
            SETHEX                               * 534AE
            DAT1=C  W                            * 534B0
            D1=A                                 * 534B4
            A=DAT0  A                            * 534B7
            D0=D0+  5                            * 534BA
            PC=(A)                               * 534BD
          ENDCODE                                * 534C1
          CODE                                   * 534C1  154 nibbles
            GOSUB   SAVPTR~jump_5356F            * 534CB
            GOSUB   SUB_5360F                    * 534CF
            D1=D1+  10                           * 534D3
            A=DAT1  W                            * 534D6
            D1=D1+  16                           * 534DA
            C=DAT1  W                            * 534DD
            SETDEC                               * 534E1
            A=-A-1  S                            * 534E3
            GOSUB   CALCINTEG~1                  * 534E6
            GOSUB   STAB0~jump_535B5             * 534EA
            D1=D1+  16                           * 534EE
            C=DAT1  W                            * 534F1
            A=0     S                            * 534F5
            GOSUB   CALCINTEG~5                  * 534F8
            GOSUB   MULTF~jump_53592             * 534FC
            D1=D1+  16                           * 53500
            D1=D1+  16                           * 53503
            C=DAT1  W                            * 53506
            GOSUB   CALCINTEG~5                  * 5350A
            GOSUB   MULTF~jump_53592             * 5350E
            GOSUB   STAB2~jump_535BC             * 53512
            D1=D1-  16                           * 53516
            A=DAT1  W                            * 53519
            CD1EX                                * 5351D
            D=C     A                            * 53520
            P=      0                            * 53522
            LC(5)   #00130                       * 53524
            SETHEX                               * 5352B
            C=C+D   A                            * 5352D
            SETDEC                               * 5352F
            D1=C                                 * 53531
            C=DAT1  W                            * 53534
            GOSUB   CALCINTEG~1                  * 53538
            GOSUB   RCCD0~jump_535CA             * 5353C
            GOSUB   MULTF~jump_53592             * 53540
            GOSBVL  PACK                         * 53544
            GOSBVL  PUSH%                        * 5354B
            GOSUB   SAVPTR~jump_5356F            * 53552
            GOSUB   RCAB2~jump                   * 53556
            GOSBVL  PACK                         * 5355A
            GOTO    L_52F17                      * 53561
          ENDCODE                                * 53565
          ABND                                   * 53565
        ;                                        * 5356A
        ASSEMBLE

* refs (7): 52D53 531ED 5343A 534CB 53552 536CB ...
SAVPTR~jump_5356F:
        GOVLNG  SAVPTR                           * 5356F

* refs (4): 52F86 53404 53474 536D6
GETPTR~jump_53576:
        GOVLNG  GETPTR                           * 53576

* refs (12): 52D6F 52E48 52E63 52EB4 52FFE 5302B ...
CALCINTEG~1:
        GOSBVL  SPLTAC                           * 5357D

* refs (21): 52E6E 52ED9 52F0F 52FB6 53015 53041 ...
RADDF~jump_53584:
        GOVLNG  RADDF                            * 53584

* refs (5): 52E84 52F9D 52FAB 5307D 53346
CALCINTEG~2:
        GOSBVL  SPLTAC                           * 5358B

* refs (14): 52E55 52E76 52E8F 52EC6 52FD1 53006 ...
MULTF~jump_53592:
        GOVLNG  MULTF                            * 53592

* refs (4): 52E97 530F2 53133 531BE
CALCINTEG~3:
        GOSBVL  XYEX                             * 53599

* refs (10): 52D7B 52EBE 52FBE 5309F 53102 53154 ...
DIVF~jump_535A0:
        GOVLNG  DIVF                             * 535A0

* refs (9): 52EDD 52F13 53019 531CA 53215 5322E ...
CALCINTEG~4:
        GOVLNG  SUB_29F76                        * 535A7

* refs (16): 52E6A 52E8B 52ED5 52F0B 53011 530AA ...
CALCINTEG~5:
        GOVLNG  SUB_2BCAC                        * 535AE

* refs (6): 52FA1 52FD5 530E4 53117 53327 534EA
STAB0~jump_535B5:
        GOVLNG  STAB0                            * 535B5

* refs (7): 52E59 52E7A 52E9B 52ECE 53081 532CE ...
STAB2~jump_535BC:
        GOVLNG  STAB2                            * 535BC

* refs (4): 52F07 5311B 53375 53556
RCAB2~jump:
        GOVLNG  RCAB2                            * 535C3

* refs (12): 52FB2 52FBA 53002 5302F 530F6 5312F ...
RCCD0~jump_535CA:
        GOVLNG  RCCD0                            * 535CA

* refs (7): 52E72 52E93 52EC2 5309B 5317C 531BA ...
RCCD2~jump_535D1:
        GOVLNG  RCCD2                            * 535D1
        RPL

* refs (3): 52D85 52F1E 52F57
CALCINTEG~6:
        :: OBJ_4241B 4GETLAM CRUNCH CK1NoBlame DUP TYPEREAL? ?SKIP * 535D8
          SETNONERAL                             * 53600
          OBJ_4241B ;                            * 53605
        ASSEMBLE

* refs (12): 52D59 52DD4 52E9F 52F36 52FD9 53287 ...
SUB_5360F:
        D1=(5)  TEMPENV                          * 5360F
        C=DAT1  A                                * 53616
        D1=C                                     * 53619
        D1=D1+  16                               * 5361C
        D1=D1+  16                               * 5361F
        D1=D1+  3                                * 53622
        C=DAT1  A                                * 53625
        D1=C                                     * 53628
        RTN                                      * 5362B

* refs (4): 531FF 532D2 53369 5339E
CALCINTEG~7:
        GOSUB   SUB_5360F                        * 5362D
        B=C     A                                * 53631
        P=      0                                * 53633
        LC(5)   #0017A                           * 53635
        SETHEX                                   * 5363C
        C=C+B   A                                * 5363E
        SETDEC                                   * 53640
        D1=C                                     * 53642
        RTN                                      * 53645

* refs (5): 52D9D 53085 53158 53241 5349E
CALCINTEG~8:
        GOSUB   SUB_5360F                        * 53647
        D1=D1+  10                               * 5364B
        D1=D1+  16                               * 5364E
        D1=D1+  16                               * 53651
        D1=D1+  16                               * 53654
        RTN                                      * 53657

* refs (3): 5303D 530E0 53203
CALCINTEG~9:
        D1=D1+  5                                * 53659
        C=DAT1  W                                * 5365C
        D=C     W                                * 53660
        D=0     S                                * 53663
        D1=D1-  5                                * 53666
        C=DAT1  A                                * 53669
        RTN                                      * 5366C

* refs (2): 53045 5313F
CALCINTEG~10:
        DAT1=A  A                                * 5366E
        D1=D1+  5                                * 53671
        P=      14                               * 53674
        A=B     WP                               * 53676
        DAT1=A  W                                * 53679
        D1=D1-  5                                * 5367D
        RTN                                      * 53680

* refs (4): 52EB8 5311F 531AA 532E1
CALCINTEG~11:
        C=0     W                                * 53682
        P=      14                               * 53685
        LC(1)   #4                               * 53687
        D=C     W                                * 5368A
        RTN                                      * 5368D

* refs (5): 52D75 530FE 5318F 532EC 53385
CALCINTEG~12:
        C=0     W                                * 5368F
        P=      14                               * 53692
        LC(1)   #2                               * 53694
        D=C     W                                * 53697
        RTN                                      * 5369A

* refs (2): 53127 531B2
CALCINTEG~13:
        C=0     W                                * 5369C
        C=-C-1  S                                * 5369F
        D=0     W                                * 536A2
        P=      14                               * 536A5
        D=D+1   P                                * 536A7
        RTN                                      * 536AA

* refs (2): 52E10 5305C
CALCINTEG~14:
        CON(5)  (*)+5                            * 536AC  primitive code object
        GOSBVL  POP#                             * 536B1
        A=A-1   A                                * 536B8
        LC(5)   #00001                           * 536BA
L_536C1:
        C=C+C   A                                * 536C1
        A=A-1   A                                * 536C3
        GONC    L_536C1                          * 536C5
        R0=C                                     * 536C8
        GOSUB   SAVPTR~jump_5356F                * 536CB
        GOVLNG  PUSH#LOOP                        * 536CF
L_536D6:
        GOSUB   GETPTR~jump_53576                * 536D6
        D=D-1   A                                * 536DA
        GONC    L_536F0                          * 536DC
        D=D+1   A                                * 536DF
        GOSUB   SAVPTR~jump_5356F                * 536E1
        GOSBVL  St10Gb                           * 536E5
        GOTO    L_536D6                          * 536EC
L_536F0:
        LC(5)   %%0                              * 536F0
        D1=D1-  5                                * 536F7
        DAT1=C  A                                * 536FA
        RTN                                      * 536FD
        FILLTO  #53725                           * 536FF  38 zero nibbles: the next entry stays at #53725

* # ->
* refs (7): 1C29C 9A706 9A774 9BB0E 9BBA2 A09E0 ...
SetUserFlag:
        CON(5)  (*)+5                            * 53725  primitive code object
        ST=1    0                                * 5372A
        GOTO    L_53739                          * 5372D

* # ->
* refs (34): 1C2A1 1DA89 1DB42 2A5FA 2A60E 31ABB ...
SetSysFlag:
        CON(5)  (*)+5                            * 53731  primitive code object
        ST=0    0                                * 53736
L_53739:
        GOSUB   SUB_537A6                        * 53739
        C=C!A   XS                               * 5373D
L_53741:
        DAT0=C  XS                               * 53741
        C=R0                                     * 53745
L_53748:
        D0=C                                     * 53748
        A=DAT0  A                                * 5374B
        D0=D0+  5                                * 5374E
        PC=(A)                                   * 53751

* # ->
* refs (8): 1C2FD 1C4E2 9A6AE 9A76F 9BA7C 9BB9D ...
ClrUserFlag:
        CON(5)  (*)+5                            * 53755  primitive code object
        ST=1    0                                * 5375A
        GOTO    L_53769                          * 5375D

* # ->
* refs (33): 1C302 1C500 1DA0C 1DAF7 2A5DC 2A5E6 ...
ClrSysFlag:
        CON(5)  (*)+5                            * 53761  primitive code object
        ST=0    0                                * 53766
L_53769:
        GOSUB   SUB_537A6                        * 53769
        A=-A-1  XS                               * 5376D
        C=C&A   XS                               * 53770
        GOTO    L_53741                          * 53774

* # -> flag
* refs (19): 1C340 1C4D8 63EDE 9A68B 9A6E8 9A742 ...
TestUserFlag:
        CON(5)  (*)+5                            * 53778  primitive code object
        ST=1    0                                * 5377D
        GOTO    L_5378C                          * 53780

* # -> flag
* refs (111): 0D2DF 167C9 1763F 176B7 1A613 1C345 ...
TestSysFlag:
        CON(5)  (*)+5                            * 53784  primitive code object
        ST=0    0                                * 53789
L_5378C:
        GOSUB   SUB_537A6                        * 5378C
        C=C&A   XS                               * 53790
        A=R0                                     * 53794
        D0=A                                     * 53797
        ?C#0    XS                               * 5379A
        GOYES   L_5379F                          * 5379D
L_5379F:
        GOVLNG  PushT/FLoop                      * 5379F

* refs (3): 53739 53769 5378C
SUB_537A6:
        GOSBVL  POP#                             * 537A6
        ?A=0    A                                * 537AD
        GOYES   L_53807                          * 537B0
        LC(5)   #00040                           * 537B2
        ?C<A    A                                * 537B9
        GOYES   L_53807                          * 537BC
        A=A-1   A                                * 537BE
        LC(2)   #03                              * 537C0
        C=C&A   B                                * 537C4
        CSRC                                     * 537C8
        ASRB.F  B                                * 537CB
        ASRB.F  B                                * 537D0
        LC(5)   UserFlags                        * 537D5
        ?ST=1   0                                * 537DC
        GOYES   L_537E8                          * 537DF
        LC(5)   SystemFlags                      * 537E1
L_537E8:
        C=C+A   A                                * 537E8
        CD0EX                                    * 537EA
        R0=C                                     * 537ED
        P=C     15                               * 537F0
        P=P-1                                    * 537F4
        LC(4)   #1248                            * 537F6
        P=      0                                * 537FC
        A=C     XS                               * 537FE
        C=DAT0  XS                               * 53801
        RTN                                      * 53805
L_53807:
        GOVLNG  DOSIZEERR                        * 53807

* T -> %1 F -> %0
* refs (17): 1C34F 1C388 1C50F 1C548 1E770 1E7F6 ...
COERCEFLAG:
        CON(5)  (*)+5                            * 5380E  primitive code object
        A=DAT1  A                                * 53813
        LC(5)   TRUE                             * 53816
        A=A-C   A                                * 5381D
        LC(5)   %1                               * 5381F
        ?A=0    A                                * 53826
        GOYES   L_53832                          * 53829
        LC(5)   %0_2A2B4                         * 5382B
L_53832:
        DAT1=C  A                                * 53832
        LC(5)   SEMI                             * 53835
        A=C     A                                * 5383C
        PC=(A)                                   * 5383E
        RPL

* refs (3): 1C2A6 1C6ED 40062
ChkDelLastArg:
        :: BINT55 TestSysFlag NOT?SEMI           * 53842
          DelLastArg ;                           * 53856

* refs (3): 40C7B C644E C6462
HISTON?:
        CON(5)  (*)+5                            * 53860  primitive code object
        ASSEMBLE
        LC(3)   #105                             * 53865
        GOTO    L_539E6                          * 5386A

* refs (2): 38831 C6471
UnableLastCmd:
        CON(5)  (*)+5                            * 5386E  primitive code object
        LC(3)   #105                             * 53873
        GOTO    SetISysFlag                      * 53878

* refs (1): 5388F
DisLastCmd:
        CON(5)  (*)+5                            * 5387C  primitive code object
        LC(3)   #105                             * 53881
        GOTO    L_539F1                          * 53886
        RPL

* refs (1): C646C
DisLastCmd!:
        :: DisLastCmd DelMemComLine ;            * 5388A

* refs (2): 17D1E 53894
DelMemComLine:
        CON(5)  (*)+5                            * 5389E  primitive code object
        ASSEMBLE
        A=0     W                                * 538A3
        CD0EX                                    * 538A6
        D0=(5)  HISTORY1                         * 538A9
        DAT0=A  W                                * 538B0
        D0=D0+  15                               * 538B4
        DAT0=A  A                                * 538B7
        GOLONG  L_53748                          * 538BA

* -> flag
* refs (7): 14391 143C0 38656 3DE3B 40CEE C639D ...
UNDO_ON?:
        CON(5)  (*)+5                            * 538C0  primitive code object
        LC(3)   #103                             * 538C5
        GOTO    L_539E6                          * 538CA

* ->
* refs (2): 14456 C63E3
UNDO_ON:
        CON(5)  (*)+5                            * 538CE  primitive code object
        LC(3)   #103                             * 538D3
        GOTO    SetISysFlag                      * 538D8

* ->
* refs (2): 14460 C63D9
UNDO_OFF:
        CON(5)  (*)+5                            * 538DC  primitive code object
        LC(3)   #103                             * 538E1
        GOTO    L_539F1                          * 538E6

* refs (1): 42091
?BlinkCursor~1:
        CON(5)  (*)+5                            * 538EA  primitive code object
        LC(3)   #205                             * 538EF
        GOTO    SetISysFlag                      * 538F4

* ->
* refs (3): 17FB6 4204B 42096
NOBLINK:
        CON(5)  (*)+5                            * 538F8  primitive code object
        LC(3)   #205                             * 538FD
        GOTO    L_539F1                          * 53902

* refs (1): 13D1E
OBJ_53906:
        CON(5)  (*)+5                            * 53906  primitive code object
        LC(3)   #205                             * 5390B
        GOTO    L_539E6                          * 53910

* refs (2): 1597D 39E87
OBJ_53914:
        CON(5)  (*)+5                            * 53914  primitive code object
        LC(3)   #805                             * 53919
        GOTO    SetISysFlag                      * 5391E

* refs (3): 159B9 39E9B 39EAA
OBJ_53922:
        CON(5)  (*)+5                            * 53922  primitive code object
        LC(3)   #805                             * 53927
        GOTO    L_539F1                          * 5392C

* refs (9): 15E24 15EDD 15F42 15F88 16D4F 16E5D ...
OBJ_53930:
        CON(5)  (*)+5                            * 53930  primitive code object
        LC(3)   #805                             * 53935
        GOTO    L_539E6                          * 5393A

* refs (1): 319C6
OBJ_5393E:
        CON(5)  (*)+5                            * 5393E  primitive code object
        LC(3)   #803                             * 53943
        GOTO    SetISysFlag                      * 53948

* refs (6): 169E6 16A13 2D36D 31A02 31A11 31B10
OBJ_5394C:
        CON(5)  (*)+5                            * 5394C  primitive code object
        LC(3)   #803                             * 53951
        GOTO    L_539F1                          * 53956

* refs (4): 15F14 16A72 16D54 34E71
OBJ_5395A:
        CON(5)  (*)+5                            * 5395A  primitive code object
        LC(3)   #803                             * 5395F
        GOTO    L_539E6                          * 53964

* -> flag
* refs (10): 39820 3DFEC 40558 405B2 405EE 408B4 ...
AlgEntry?:
        CON(5)  (*)+5                            * 53968  primitive code object
        LC(3)   #403                             * 5396D
        GOTO    L_539E6                          * 53972

* ->
* refs (8): 3DFFB 40E33 42F12 42F1C 42FDA D5F25 ...
SetAlgEntry:
        CON(5)  (*)+5                            * 53976  primitive code object
        LC(3)   #403                             * 5397B
        GOTO    SetISysFlag                      * 53980

* ->
* refs (9): 3DFF6 40E4C 40E79 42EFE 42F08 42F35 ...
ClrAlgEntry:
        CON(5)  (*)+5                            * 53984  primitive code object
        LC(3)   #403                             * 53989
        GOTO    L_539F1                          * 5398E

* refs (2): 448C6 D9B72
MinusMo:
        CON(5)  (*)+5                            * 53992  primitive code object
        LC(3)   #405                             * 53997
        GOTO    L_539E6                          * 5399C

* refs (2): 3BA81 D9C0A
MinusMo_539A0:
        CON(5)  (*)+5                            * 539A0  primitive code object
        LC(3)   #405                             * 539A5
        GOTO    L_53A01                          * 539AA

* refs (1): 443B7
MajusMo:
        CON(5)  (*)+5                            * 539AE  primitive code object
        LC(3)   #405                             * 539B3
        GOTO    L_539F1                          * 539B8

* refs (1): 34E3A
OBJ_539BC:
        CON(5)  (*)+5                            * 539BC  primitive code object
        LC(3)   #20B                             * 539C1
        GOTO    L_539E6                          * 539C6

* refs (2): 16112 1623E
OBJ_539CA:
        CON(5)  (*)+5                            * 539CA  primitive code object
        LC(3)   #20B                             * 539CF
        GOTO    SetISysFlag                      * 539D4

* refs (3): 159BE 1612B 16257
OBJ_539D8:
        CON(5)  (*)+5                            * 539D8  primitive code object
        LC(3)   #20B                             * 539DD
        GOTO    L_539F1                          * 539E2
L_539E6:
        GOSUB   L_53AF2                          * 539E6
        GOVLNG  PushT/FLoop                      * 539EA
L_539F1:
        GOSUB   SUB_53B0A                        * 539F1
        GOTO    D0=ALoop                         * 539F5

* refs (22): 2D9AB 38D94 39584 39FCB 3FF90 3FFC3 ...
SetISysFlag:
        GOSUB   setflag                          * 539F9
        GOTO    D0=ALoop                         * 539FD
L_53A01:
        GOSUB   SUB_53B1D                        * 53A01

* refs (3): 4438D 539F5 539FD
D0=ALoop:
        D0=A                                     * 53A05
        A=DAT0  A                                * 53A08
        D0=D0+  5                                * 53A0B
        PC=(A)                                   * 53A0E

* refs (2): 3AB7B 3E5B9
InvCursor:
        CON(5)  (*)+5                            * 53A12  primitive code object
        LC(3)   #203                             * 53A17
        GOTO    L_53A01                          * 53A1C

* refs (4): 3F2B5 42D28 42FA3 D9BDD
REPLACE_MODE:
        CON(5)  (*)+5                            * 53A20  primitive code object
        LC(3)   #203                             * 53A25
        GOTO    L_539F1                          * 53A2A

* ->
* refs (4): 3F2C9 42D0A 42F9E 443C1
INSERT_MODE:
        CON(5)  (*)+5                            * 53A2E  primitive code object
        LC(3)   #203                             * 53A33
        GOTO    SetISysFlag                      * 53A38

* -> flag
* refs (6): 3E5A5 3F2B0 40733 42B2F 42D00 D9B63
INSERT?:
        CON(5)  (*)+5                            * 53A3C  primitive code object
        LC(3)   #203                             * 53A41
        GOTO    L_539E6                          * 53A46

* -> flag
* refs (20): 19BBD 19BE6 19C33 19CA4 19F28 38822 ...
EditLExists?:
        CON(5)  (*)+5                            * 53A4A  primitive code object
        LC(3)   #10A                             * 53A4F
        GOTO    L_539E6                          * 53A54

BeginComLine:
        CON(5)  (*)+5                            * 53A58  primitive code object
        LC(3)   #10A                             * 53A5D
        GOTO    SetISysFlag                      * 53A62

* refs (1): 4429A
InitEdLine~2:
        CON(5)  (*)+5                            * 53A66  primitive code object
        LC(3)   #10A                             * 53A6B
        GOTO    L_539F1                          * 53A70

* refs (1): 38FBE
DA2aLess1OK?~1:
        CON(5)  (*)+5                            * 53A74  primitive code object
        LC(3)   #40B                             * 53A79
        GOTO    L_539E6                          * 53A7E

* refs (1): 39095
?SetEditRoll~1:
        CON(5)  (*)+5                            * 53A82  primitive code object
        LC(3)   #40B                             * 53A87
        GOTO    SetISysFlag                      * 53A8C

* refs (4): 19C60 38FAA 39BBC 8D557
ClrNewEditL:
        CON(5)  (*)+5                            * 53A90  primitive code object
        LC(3)   #40B                             * 53A95
        GOTO    L_539F1                          * 53A9A

* refs (1): 39AF6
Clock?:
        CON(5)  (*)+5                            * 53A9E  primitive code object
        LC(3)   #102                             * 53AA3
        GOTO    L_539E6                          * 53AA8

DoClock:
        CON(5)  (*)+5                            * 53AAC  primitive code object
        LC(3)   #102                             * 53AB1
        GOTO    SetISysFlag                      * 53AB6

* refs (1): 41030
NoClock:
        CON(5)  (*)+5                            * 53ABA  primitive code object
        LC(3)   #102                             * 53ABF
        GOTO    L_539F1                          * 53AC4

* refs (1): 42235
GETKEY~5~1:
        CON(5)  (*)+5                            * 53AC8  primitive code object
        LC(3)   #801                             * 53ACD
        GOTO    L_539E6                          * 53AD2

* refs (1): 17FBB
OBJ_53AD6:
        CON(5)  (*)+5                            * 53AD6  primitive code object
        LC(3)   #801                             * 53ADB
        GOTO    SetISysFlag                      * 53AE0

* refs (2): 2D9C8 420A5
NoIgnoreAlm:
        CON(5)  (*)+5                            * 53AE4  primitive code object
        LC(3)   #801                             * 53AE9
        GOTO    L_539F1                          * 53AEE
L_53AF2:
        GOSUB   SUB_53B45                        * 53AF2
        A=DAT0  P                                * 53AF6
        AD0EX                                    * 53AFA
        A=A&C   P                                * 53AFD
        ?A#0    P                                * 53B01
        GOYES   L_53B06                          * 53B04
L_53B06:
        P=      0                                * 53B06
        RTN                                      * 53B08

* refs (2): 10F32 539F1
SUB_53B0A:
        GOSUB   SUB_53B45                        * 53B0A
L_53B0E:
        A=DAT0  P                                * 53B0E
        C=-C-1  P                                * 53B12
        A=A&C   P                                * 53B15
        GOTO    L_53B3D                          * 53B19

* refs (1): 53A01
SUB_53B1D:
        GOSUB   SUB_53B45                        * 53B1D
        A=DAT0  P                                * 53B21
        A=A&C   P                                * 53B25
        ?A=0    P                                * 53B29
        GOYES   L_53B35                          * 53B2C
        GONC    L_53B0E                          * 53B2E

* refs (4): 02498 027A9 4466E 539F9
setflag:
        GOSUB   SUB_53B45                        * 53B31
L_53B35:
        A=DAT0  P                                * 53B35
        A=A!C   P                                * 53B39
L_53B3D:
        DAT0=A  P                                * 53B3D
        P=      0                                * 53B41
        RTN                                      * 53B43

* refs (4): 53AF2 53B0A 53B1D 53B31
SUB_53B45:
        LA(5)   SysNib1                          * 53B45
        A=C     B                                * 53B4F
        P=C     2                                * 53B52
        C=P     5                                * 53B56
        P=      5                                * 53B5A
        AD0EX                                    * 53B5C
        RTN                                      * 53B5F

* -> #
* refs (2): 3ED57 B8FA2
NumbMode:
        CON(5)  (*)+5                            * 53B61  primitive code object
        GOSBVL  SAVPTR                           * 53B66
        D0=(5)  #8084F                           * 53B6D
        A=0     A                                * 53B74
        A=DAT0  1                                * 53B76
        LC(1)   #3                               * 53B7A
        A=A&C   P                                * 53B7D
        GOVLNG  PUSH#ALOOP                       * 53B81
        RPL

* ->
* refs (12): 157D8 15819 2867A 2869D 286D9 5A045 ...
CLRNUM:
        :: BINT3 ClrSysFlag ;                    * 53B88

* ->
* refs (12): 15797 1580A 1582D 286C0 286F2 5A086 ...
SETNUM:
        :: BINT3 SetSysFlag ;                    * 53B9C

* -> flag
* refs (15): 15792 1F293 1F744 1F78F 1F7DA 20DC4 ...
NOTNUM?:
        :: BINT3 TestSysFlag NOT ;               * 53BB0

* -> flag
* refs (10): 51500 56C22 56C81 57793 577F2 5B4AB ...
DEG?:
        :: rad?;fs?(-18)? ORNOT ;                * 53BC9

* -> flag
* refs (15): 514E1 53BF6 54E61 56C18 56C77 5775C ...
RAD?:
        :: BINT17 TestSysFlag ;                  * 53BDD

* refs (2): 53BCE C6272
rad?;fs?(-18)?:
        :: RAD? BINT18 TestSysFlag ;             * 53BF1

* -> flag
* refs (1): 5EA77
NOTCONST?:
        :: BINT2 TestSysFlag NOT ;               * 53C0A

* -> flag
* refs (5): 57644 592F5 86D4E 86DDA 86E20
PRSOL?:
        :: BINT1 TestSysFlag ;                   * 53C23

* ->
* refs (1): 1C599
DOHEX:
        CON(5)  (*)+5                            * 53C37  primitive code object
        ASSEMBLE
        LC(1)   #C                               * 53C3C
        GOTO    L_53C62                          * 53C3F

* ->
* refs (1): 1C563
DOBIN:
        CON(5)  (*)+5                            * 53C43  primitive code object
        LC(1)   #8                               * 53C48
        GOTO    L_53C62                          * 53C4B

* ->
* refs (1): 1C5B4
DOOCT:
        CON(5)  (*)+5                            * 53C4F  primitive code object
        LC(1)   #4                               * 53C54
        GOTO    L_53C62                          * 53C57

* ->
* refs (1): 1C57E
DODEC:
        CON(5)  (*)+5                            * 53C5B  primitive code object
        C=0     A                                * 53C60
L_53C62:
        AD0EX                                    * 53C62
        R0=A                                     * 53C65
        D0=(5)  #80845                           * 53C68
        A=DAT0  1                                * 53C6F
        RSTK=C                                   * 53C73
        LC(1)   #3                               * 53C75
        A=A&C   P                                * 53C78
        C=RSTK                                   * 53C7C
        A=A!C   P                                * 53C7E
        DAT0=A  1                                * 53C82
        A=R0                                     * 53C86
        D0=A                                     * 53C89
        A=DAT0  A                                * 53C8C
        D0=D0+  5                                * 53C8F
        PC=(A)                                   * 53C92
        RPL

* % ->
* refs (2): 1C5D4 D13C7
XEQSTWS:
        :: COERCE dostws ;                       * 53C96

* # ->
* refs (2): 1C5E8 53CA0
dostws:
        CON(5)  (*)+5                            * 53CAA  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 53CAF
        GOSUB   SAVPTR~jump_53F69                * 53CB6
        ?A=0    A                                * 53CBA
        GOYES   L_53CC1                          * 53CBD
        A=A-1   A                                * 53CBF
L_53CC1:
        C=0     A                                * 53CC1
        LC(2)   #3F                              * 53CC3
        ?C>=A   A                                * 53CC7
        GOYES   L_53CCE                          * 53CCA
        CAEX    A                                * 53CCC
L_53CCE:
        D0=(5)  #80844                           * 53CCE
        C=DAT0  B                                * 53CD5
        B=C     A                                * 53CD8
        LC(2)   #C0                              * 53CDA
        C=C&B   B                                * 53CDE
        A=A!C   B                                * 53CE2
        DAT0=A  B                                * 53CE6
        GOVLNG  GETPTRLOOP                       * 53CE9
        RPL

* -> %
* refs (1): 1C608
XEQRCWS:
        :: WORDSIZE UNCOERCE ;                   * 53CF0

* hxs hxs' -> hxs''
* refs (1): 1E79C
bitAND:
        CON(5)  (*)+5                            * 53D04  primitive code object
        ASSEMBLE
        GOSUB   POP2HXS                          * 53D09
        A=A&C   WP                               * 53D0D
        GOTO    L_53E95                          * 53D11

* hxs hxs' -> hxs''
* refs (1): 1E822
bitOR:
        CON(5)  (*)+5                            * 53D15  primitive code object
        GOSUB   POP2HXS                          * 53D1A
        A=A!C   WP                               * 53D1E
        GOTO    L_53E95                          * 53D22

* hxs hxs' -> hxs''
* refs (1): 1E90F
bitXOR:
        CON(5)  (*)+5                            * 53D26  primitive code object
        GOSUB   POP2HXS                          * 53D2B
        R0=A                                     * 53D2F
        A=A!C   WP                               * 53D32
        AR0EX                                    * 53D36
        A=-A-1  WP                               * 53D39
        C=-C-1  WP                               * 53D3C
        A=A!C   WP                               * 53D3F
        C=R0                                     * 53D43
        A=A&C   WP                               * 53D46
        GOTO    L_53E95                          * 53D4A

* hxs -> hxs'
* refs (1): 1E8A8
bitNOT:
        CON(5)  (*)+5                            * 53D4E  primitive code object
        GOSUB   POPHXS                           * 53D53
        A=-A-1  WP                               * 53D57
        GOTO    L_53E95                          * 53D5A

* hxs -> hxs'
* refs (1): 1962A
bitSL:
        CON(5)  (*)+5                            * 53D5E  primitive code object
        GOSUB   POPHXS                           * 53D63
        A=A+A   WP                               * 53D67
        GOTO    L_53E95                          * 53D6A

* hxs -> hxs'
* refs (1): 1964A
bitSLB:
        CON(5)  (*)+5                            * 53D6E  primitive code object
        GOSUB   POPHXS                           * 53D73
        ASL     WP                               * 53D77
        ASL     WP                               * 53D7A
        GOTO    L_53E95                          * 53D7D

* hxs -> hxs'
* refs (1): 1966A
bitSR:
        CON(5)  (*)+5                            * 53D81  primitive code object
        GOSUB   POPHXS                           * 53D86
        ASRB                                     * 53D8A
        GOTO    L_53E95                          * 53D8D

* hxs -> hxs'
* refs (1): 1968A
bitSRB:
        CON(5)  (*)+5                            * 53D91  primitive code object
        GOSUB   POPHXS                           * 53D96
        ASR     WP                               * 53D9A
        ASR     WP                               * 53D9D
        GOTO    L_53E95                          * 53DA0

* hxs -> hxs'
* refs (1): 195EA
bitRR:
        CON(5)  (*)+5                            * 53DA4  primitive code object
        GOSUB   POPHXS                           * 53DA9
        GOSUB   SUB_53DB5                        * 53DAD
        GOTO    L_53E95                          * 53DB1

* refs (2): 53DAD 53DFE
SUB_53DB5:
        SB=0                                     * 53DB5
        ASRB                                     * 53DB8
        ?SB=0                                    * 53DBB
        RTNYES                                   * 53DBE
        LC(5)   #01248                           * 53DC0
L_53DC7:
        C=C&B   P                                * 53DC7
        ?C#0    P                                * 53DCB
        GOYES   L_53DDB                          * 53DCE
        CSRC                                     * 53DD0
        ?C=0    P                                * 53DD3
        RTNYES                                   * 53DD6
        GONC    L_53DC7                          * 53DD8
L_53DDB:
        A=A!C   P                                * 53DDB
        RTN                                      * 53DDF

* hxs -> hxs'
* refs (1): 1960A
bitRRB:
        CON(5)  (*)+5                            * 53DE1  primitive code object
        GOSUB   POPHXS                           * 53DE6
        C=P     0                                * 53DEA
        P=      0                                * 53DEE
        D=C     B                                * 53DF0
        LC(2)   #07                              * 53DF3
        DCEX    B                                * 53DF7
        P=C     0                                * 53DFA
L_53DFE:
        GOSUB   SUB_53DB5                        * 53DFE
        D=D-1   B                                * 53E02
        GONC    L_53DFE                          * 53E05
        GOTO    L_53E95                          * 53E08

* hxs -> hxs'
* refs (1): 195AA
bitRL:
        CON(5)  (*)+5                            * 53E0C  primitive code object
        GOSUB   POPHXS                           * 53E11
        GOSUB   SUB_53E1D                        * 53E15
        GOTO    L_53E95                          * 53E19

* refs (2): 53E15 53E58
SUB_53E1D:
        A=A&B   P                                * 53E1D
        C=B     P                                * 53E21
        C=-C-1  P                                * 53E24
        A=A+A   WP                               * 53E27
        GOC     L_53E36                          * 53E2A
        C=C&A   P                                * 53E2D
        ?C=0    P                                * 53E31
        RTNYES                                   * 53E34
L_53E36:
        A=A+1   WP                               * 53E36
        RTN                                      * 53E39

* hxs -> hxs'
* refs (1): 195CA
bitRLB:
        CON(5)  (*)+5                            * 53E3B  primitive code object
        GOSUB   POPHXS                           * 53E40
        C=P     0                                * 53E44
        P=      0                                * 53E48
        D=C     B                                * 53E4A
        LC(2)   #07                              * 53E4D
        DCEX    B                                * 53E51
        P=C     0                                * 53E54
L_53E58:
        GOSUB   SUB_53E1D                        * 53E58
        D=D-1   B                                * 53E5C
        GONC    L_53E58                          * 53E5F
        GOC     L_53E95                          * 53E62

* hxs -> hxs'
* refs (1): 1958A
bitASR:
        CON(5)  (*)+5                            * 53E65  primitive code object
        GOSUB   POPHXS                           * 53E6A
        LC(1)   #8                               * 53E6E
        D=0     W                                * 53E71
        D=C     P                                * 53E74
        C=B     P                                * 53E77
L_53E7A:
        C=C+C   P                                * 53E7A
        GOC     L_53E87                          * 53E7D
        DSRB                                     * 53E80
        GOTO    L_53E7A                          * 53E83
L_53E87:
        C=D     P                                * 53E87
        C=C&A   P                                * 53E8A
        ASRB                                     * 53E8E
        A=A!C   P                                * 53E91
L_53E95:
        A=A&B   P                                * 53E95
        GOVLNG  PUSHhxsLoop                      * 53E99

* hxs hxs' -> hxs''
* refs (3): 1ABB2 5433F 54353
bit+:
        CON(5)  (*)+5                            * 53EA0  primitive code object
        GOSUB   POP2HXS                          * 53EA5
        A=A+C   WP                               * 53EA9
        GOTO    L_53E95                          * 53EAC

* hxs hxs' -> hxs''
* refs (3): 1AD54 54312 54326
bit-:
        CON(5)  (*)+5                            * 53EB0  primitive code object
        GOSUB   POP2HXS                          * 53EB5
        C=-C    WP                               * 53EB9
        A=A+C   WP                               * 53EBC
        GOTO    L_53E95                          * 53EBF

* hxs -> hxs'
* refs (1): 1A9D6
bitNEG:
        CON(5)  (*)+5                            * 53EC3  primitive code object
        GOSUB   POPHXS                           * 53EC8
        A=-A    WP                               * 53ECC
        GOTO    L_53E95                          * 53ECF

* hxs hxs' -> hxs''
* refs (3): 1AE39 542E0 542F4
bit*:
        CON(5)  (*)+5                            * 53ED3  primitive code object
        GOSUB   POP2HXS                          * 53ED8
        GOSUB   MPY                              * 53EDC
        GOTO    L_53E95                          * 53EE0

* Multiply A.W and C.W (-> A.W=C.W) Uses D.W, SB. Returns carry clear
* refs (3): 0181C 01832 53EDC
MPY:
        D=C     W                                * 53EE4
        C=0     W                                * 53EE7
L_53EEA:
        SB=0                                     * 53EEA
        ASRB                                     * 53EED
        ?SB=0                                    * 53EF0
        GOYES   L_53EF8                          * 53EF3
        C=C+D   W                                * 53EF5
L_53EF8:
        D=D+D   W                                * 53EF8
        ?A#0    W                                * 53EFB
        GOYES   L_53EEA                          * 53EFE
        A=C     W                                * 53F00
        RTNCC                                    * 53F03

* hxs hxs' -> hxs''
* refs (3): 1AF50 542B3 542C7
bit/:
        CON(5)  (*)+5                            * 53F05  primitive code object
        GOSUB   POP2HXS                          * 53F0A
        BCEX    W                                * 53F0E
        R0=C                                     * 53F11
        BCEX    W                                * 53F14
        B=0     W                                * 53F17
        D=0     B                                * 53F1A
        ?C#0    W                                * 53F1D
        GOYES   L_53F31                          * 53F20
        GONC    L_53F50                          * 53F22
L_53F25:
        D=D+1   B                                * 53F25
        R1=C                                     * 53F28
        C=C+C   W                                * 53F2B
        GOC     L_53F5D                          * 53F2E
L_53F31:
        ?C<=A   W                                * 53F31
        GOYES   L_53F25                          * 53F34
        GONC    L_53F4A                          * 53F36
L_53F39:
        CSRB                                     * 53F39
L_53F3C:
        B=B+B   W                                * 53F3C
        ?C>A    W                                * 53F3F
        GOYES   L_53F4A                          * 53F42
        A=A-C   W                                * 53F44
        B=B+1   W                                * 53F47
L_53F4A:
        D=D-1   B                                * 53F4A
        GONC    L_53F39                          * 53F4D
L_53F50:
        A=B     W                                * 53F50
        C=R0                                     * 53F53
        BCEX    W                                * 53F56
        GOTO    L_53E95                          * 53F59
L_53F5D:
        C=R1                                     * 53F5D
        D=D-1   B                                * 53F60
        GOC     L_53F50                          * 53F63
        GONC    L_53F3C                          * 53F66

* refs (5): 53CB6 53F92 5403E 54055 540C0
SAVPTR~jump_53F69:
        GOVLNG  SAVPTR                           * 53F69

* refs (3): 53F80 5426B 54519
GETPTR~jump_53F70:
        GOVLNG  GETPTR                           * 53F70

* Pop hxs to C and hxs to A, <REF>SAVPTR , Clear Carry P has current wordsize.
* refs (12): 53D09 53D1A 53D2B 53EA5 53EB5 53ED8 ...
POP2HXS:
        GOSUB   POPHXS                           * 53F77
        R0=A                                     * 53F7B
        P=      0                                * 53F7E
        GOSUB   GETPTR~jump_53F70                * 53F80
        GOSUB   POPHXS                           * 53F84
        C=R0                                     * 53F88
        RTNCC                                    * 53F8B

* Pop hxs to A, <REF>SAVPTR , Clear Carry
* refs (14): 53D53 53D63 53D73 53D86 53D96 53DA9 ...
POPHXS:
        D1=D1+  5                                * 53F8D
        D=D+1   A                                * 53F90
        GOSUB   SAVPTR~jump_53F69                * 53F92
        D1=D1-  5                                * 53F96

* refs (1): 540C4
SUB_53F99:
        A=DAT1  A                                * 53F99
        D1=A                                     * 53F9C
        D1=D1+  5                                * 53F9F
        A=DAT1  A                                * 53FA2
        LC(5)   #00005                           * 53FA5
        C=A-C   A                                * 53FAC
        C=C-1   A                                * 53FAE
        D=C     A                                * 53FB0
        D1=D1+  5                                * 53FB2
        GOSUB   getwordsize                      * 53FB5
        C=A     A                                * 53FB9
        SB=0                                     * 53FBB
        CSRB                                     * 53FBE
        CSRB                                     * 53FC1
        C=C-1   B                                * 53FC4
        ?SB=0                                    * 53FC7
        GOYES   L_53FCF                          * 53FCA
        C=C+1   B                                * 53FCC
L_53FCF:
        RSTK=C                                   * 53FCF
        LC(2)   #03                              * 53FD1
        A=A&C   B                                * 53FD5
        C=RSTK                                   * 53FD9
        P=C     0                                * 53FDB
        B=0     P                                * 53FDF
        B=B-1   P                                * 53FE2
        ?SB=0                                    * 53FE5
        GOYES   L_53FF9                          * 53FE8
L_53FEA:
        A=A-1   B                                * 53FEA
        GOC     L_53FF6                          * 53FED
        B=B+B   P                                * 53FF0
        GOC     L_53FEA                          * 53FF3
L_53FF6:
        B=-B-1  P                                * 53FF6
L_53FF9:
        C=0     B                                * 53FF9
        C=P     0                                * 53FFC
