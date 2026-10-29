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
        :: OVER %0< case SETSIZEERR              * 2C09F
          OVER %0= case                          * 2C0B8
          :: SWAPDROP %> case %1                 * 2C0C7
            %0_2A2B4 ;                           * 2C0E0
          ROT %>%%- SWAP %>%%SQRT %%/            * 2C0EA
          CODE                                   * 2C103  28 nibbles
            GOSBVL  utpn(3r)~1                   * 2C10D
            GOSBVL  SUB_77EBC                    * 2C114
L_2C11B:
            GOSBVL  PACK                         * 2C11B
            GOVLNG  PUSH%LOOP                    * 2C122
          ENDCODE                                * 2C129
        ;                                        * 2C129

* refs (1): 20029
utpn(2r):
        :: SWAP %0_2A2B4                         * 2C12E
          CODE                                   * 2C13D  18 nibbles
            GOSBVL  SUB_77E62                    * 2C147
            GOSBVL  utpn(2r)~1                   * 2C14E
            GOTO    L_2C11B                      * 2C155
          ENDCODE                                * 2C159
        ;                                        * 2C159

* refs (1): 20069
utpf(3r):
        :: 3UNROLL                               * 2C15E
          CODE                                   * 2C168  18 nibbles
            GOSBVL  SUB_77E62                    * 2C172
            GOSBVL  utpf(3r)~1                   * 2C179
            GOTO    L_2C11B                      * 2C180
          ENDCODE                                * 2C184
        ;                                        * 2C184

* refs (1): 20089
utpt(2r):
        :: SWAP %0_2A2B4                         * 2C189
          CODE                                   * 2C198  18 nibbles
            GOSBVL  SUB_77E62                    * 2C1A2
            GOSBVL  SUB_78077                    * 2C1A9
            GOTO    L_2C11B                      * 2C1B0
          ENDCODE                                * 2C1B4
        ;                                        * 2C1B4

* refs (2): 0FBC4 0FC55
%%1E2:
        %% 1E2                                   * 2C1B9

* refs (20): 2B25F 2B28C 2B2C8 528A4 912B6 91D65 ...
1+(rr):
        :: %%1 %%+ ;                             * 2C1D3
        BSS     12                               * 2C1E7

* ob ->
* refs (1): 1FD1A
STATSTO:
        :: '                                     * 2C1F3

* ID SIGMADAT
* refs (6): 2C220 2C239 2C252 2C29D C5399 C53A3
ID_SIGMADAT:
          ID ΣDAT XEQSTOID ;                     * 2C1FD

* refs (3): 2C301 2C356 2C374
Sto@ä:
        :: ' ID_SIGMADAT STOAPPLDATA ;           * 2C216

* ->
* refs (4): 1FD35 2C45F B579D B7D65
STATCLST:
        :: ' ID_SIGMADAT ?PURGE_HERE ;           * 2C22F

* refs (1): 2C45A
xSIGMA-~1~1:
        :: ' ID_SIGMADAT dup;Vector*­Rcl(nm)? SWAPDROP NOT?SEMI * 2C248
          ?PURGE_HERE ;                          * 2C266

* -> ob
* refs (5): 2C2DE 2C338 2C379 2C53A 50E18
STATRCL:
        :: Exist@äDAT? NOTcaseFALSE DUPTYPEIDNT? * 2C270
          casedrpfls TRUE                        * 2C284
        ;                                        * 2C28E

* refs (5): 0C7DF 2C275 2C2B1 B5774 B7D3C
Exist@äDAT?:
        :: ' ID_SIGMADAT OBJ_4735A ;             * 2C293

* refs (3): 1FD50 2C2CA 4B779
rclä!:
        :: Exist@äDAT? ?SEMI                     * 2C2AC
          rclä!~1 ;                              * 2C2BB

* refs (8): 200CE 2C428 2C5F8 2C7EC 2C9F9 48E32 ...
rclä:
        :: rclä! OBJ_2D252 ;                     * 2C2C5

* refs (1): 1FD70
ä+(r):
        :: STATRCL NOTcase                       * 2C2D9

Stoä(r):
          :: ONEONE TWO{}N SWAP MAKEARRY Sto@ä ; * 2C2E8
          OBJ_2D252 MDIMSDROP SWAPDROP UNCOERCE XEQ>VECTOR xSIGMA+ ; * 2C30B

* refs (3): 1FD7A B57A2 B7D6A
å-:
        :: dup;ra?#BAT! STATRCL ?GOTO L_2C392 DUP MDIMS case2drop Sto@ä * 2C32E
          BINT1 OVER TWO{}N %0_2A2B4 MAKEARRY Sto@ä STATRCL DROPSWAP BINT0 * 2C35B
          GOTO L_2C3E7                           * 2C388
L_2C392:
          OBJ_2D252 OVER MDIMS ?SKIP ONESWAP     * 2C392
          3PICK MDIMSDROP 3PICK #<> caseSIZEERR ROT#+ * 2C3AB
          SWAP TWO{}N @rdm(ar,ls) OVERARSIZE OVERARSIZE OVER#- * 2C3C9
L_2C3E7:
          4UNROLL #1+_ONE_DO SWAPINDEX@ PULLREALEL ROTSWAP 4PICK INDEX@ #+ * 2C3E7
          PUTREALEL NextInArray 3DROP ;          * 2C40F

* refs (1): 1FD95
xSIGMA-~1:
        :: rclä DUP MDIMSDROP ROTOVER lastv(ra,s) SWAP4ROLL 4ROLLOVER * 2C423
          #1=case                                * 2C44B
          :: 3DROP xSIGMA-~1~1 STATCLST ;        * 2C450
          SWAP#1- SWAP TWO{}N @rdm(ar,ls) DROP ; * 2C469

* refs (1): 2C43C
lastv(ra,s):
        :: DUP # 1 #=ITE                         * 2C487

0;newob:
          :: %0_2A2B4 TOTEMPOB ;                 * 2C4A0

* refs (1): 2C639
nulv(s):
          :: DUPONE {}N %0_2A2B4 MAKEARRY ; SWAP * 2C4B4
          CODE                                   * 2C4D7  79 nibbles
            GOSBVL  POP#                         * 2C4E1
            GOSUBL  SAVPTR~jump_2CE75            * 2C4E8
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
        :: STATRCL NOTcase %0_2A2B4              * 2C535
          OBJ_2D252 OBJ_2CC92 ;                  * 2C549

* -> %
* refs (1): 1FE88
STATSMAX:
        :: BINT0 OBJ_2C5EE ColumnMAX ;           * 2C558

* -> % -> []
* refs (1): 1FEA3
STATMEAN:
        :: BINT0 OBJ_2C5EE ColumnMEAN ;          * 2C571

* -> %
* refs (1): 1FEBE
STATSMIN:
        :: BINT0 OBJ_2C5EE ColumnMIN ;           * 2C58A

* -> % -> []
* refs (1): 1FED9
STATSTDEV:
        :: BINT1 OBJ_2C5EE ColumnTDEV ;          * 2C5A3

* -> % -> []
* refs (1): 1FEF4
STATTOT:
        :: BINT0 OBJ_2C5EE ColumnTOT ;           * 2C5BC

* -> % -> []
* refs (1): 1FF0F
STATVAR:
        :: BINT1 OBJ_2C5EE ColumnVAR ;           * 2C5D5

* refs (8): 2C562 2C57B 2C594 2C5AD 2C5C6 2C5DF ...
OBJ_2C5EE:
        :: 'R rclä DUP MDIMSDROP SWAP 5ROLL #>?SKIP OBJ_2D2D7 DUPONE #=case * 2C5EE
          :: SWAPROT EVAL ;                      * 2C625
          nulv(s) SWAP #1+_ONE_DO INDEX@ 3PICK 5PICK EVAL INDEX@ PUTREALEL * 2C639
          LOOP ROTROT2DROP ;                     * 2C666

* % %' ->
* refs (2): 200A9 B7E0A
STATCOL:
        :: ChkReakäPAR 4ROLLDROP 4ROLLDROP StoäPAR(5_) ; * 2C675

* refs (5): 20248 2C689 2C6C5 2C6E8 2CAD0
StoäPAR(5_):
        :: BINT5 {}N ' äPAR XEQSTOID ;           * 2C693

* n ->
* refs (3): 1FFE9 A7794 A7D04
STATXCOL:
        :: ChkReakäPAR 5ROLLDROP StoäPAR(5_) ;   * 2C6B6

* n ->
* refs (2): 20009 A7CFF
STATYCOL:
        :: ChkReakäPAR 4ROLLDROP 4ROLL 5UNROLL StoäPAR(5_) ; * 2C6CF

* refs (6): 2C945 2C977 4CA05 4D9D9 A76F5 A7C80
STATGETXCOL:
        :: ChkReakäPAR 4DROP ;                   * 2C6F2

* refs (3): 2C95E 2C99F A7C85
STATGETYCOL:
        :: ChkReakäPAR 3DROP SWAPDROP ;          * 2C706

* refs (18): 200D3 20239 2C67A 2C6BB 2C6D4 2C6F7 ...
ChkReakäPAR:
        :: '                                     * 2C71F

* refs (3): 2C6A7 2C76F C6D1E
äPAR:
          ID ΣPAR SAFE@_HERE ?SKIP               * 2C729

ResetäPAR:
          ::                                     * 2C742
            { %1 %2 %0_2A2B4 %0_2A2B4 xLINFIT } DUP' äPAR XEQSTOID ; * 2C747
          DUPTYPELIST? NOTcase OBJ_2D2E7         * 2C77E
          INNERCOMP BINT5 EQ NOTcase OBJ_2D2E7   * 2C78D
          DUP ChkReakäPAR~2 matchob? NOTcase OBJ_2D2E7 * 2C7A6
          CK&DISPATCH0                           * 2C7BF
          ChkReakäPAR~1 NOP                      * 2C7C4  real real real real program
          BINT0 OBJ_2D2E7                        * 2C7CE  any
        ;                                        * 2C7D8

* refs (1): 2C7C4
ChkReakäPAR~1:
        # 11118                                  * 2C7DD  69912

* refs (6): 2C814 2C841 2C9C7 2CA12 4C8D6 CB529
RclXYCol&äDAT:
        :: rclä ChkReakäPAR 3DROP COERCE2 ROT OBJ_2CF08 ; * 2C7E7

* refs (1): 2C8EB
RclXYCol&äDAT!:
        :: RclXYCol&äDAT DUP OBJ_2CC92 %1 %= case OBJ_2D2D7 * 2C80F
        ;                                        * 2C837

* -> %
* refs (3): 1FDCB 4A1C7 B7EEB
STATCORR:
        :: RclXYCol&äDAT 2DUP OBJ_2CC06 OBJ_2CDA5 BINT3 NDUP OBJ_2CC06 * 2C83C
          OBJ_2CDFA 5UNROLL 4ROLLROT 2DUP OBJ_2CC4C OBJ_2CDA5 BINT3 NDUP * 2C864
          OBJ_2CC4C OBJ_2CDFA 6UNROLL 4ROLL 5ROLL 4UNROLL OBJ_2CC4C * 2C88C
          OBJ_2CC06 OBJ_2CE7C 3UNROLL %%* DUP %%0= case2drop %1 * 2C8AF
          %%SQRT %%/>% ;                         * 2C8D7

* -> %
* refs (2): 1FDE6 B7EF0
STATCOV:
        :: RclXYCol&äDAT! DUP4UNROLL 3PICKOVER OBJ_2CC4C OBJ_2CDA5 * 2C8E6
          3PICK3PICK OBJ_2CC06 OBJ_2CDA5 OBJ_2CC4C OBJ_2CC06 OBJ_2CE7C SWAP * 2C904
          OBJ_2CC92 %1 %>%%- %%/>% ;             * 2C927

* -> %
* refs (2): 1FE01 B7F1D
STATX:
        :: STATGETXCOL OBJ_2C9EF ColumnTOT ;     * 2C940

* -> %
* refs (2): 1FE1C B7F2C
STATY:
        :: STATGETYCOL OBJ_2C9EF ColumnTOT ;     * 2C959

* -> %
* refs (2): 1FE37 B7F3B
STATXX:
        :: STATGETXCOL OBJ_2C9EF %%0 FALSE OBJ_2CDFA %%>% ; * 2C972

* -> %
* refs (2): 1FE52 B7F4A
STATYY:
        :: STATGETYCOL OBJ_2C9EF %%0 FALSE OBJ_2CDFA %%>% ; * 2C99A

* -> %
* refs (2): 1FE6D B7F59
STATXY:
        :: RclXYCol&äDAT %%0 DUP FALSE DUP OBJ_2CE7C %%>% ; * 2C9C2

* refs (10): 2C94A 2C963 2C97C 2C9A4 B7E1E B7E37 ...
OBJ_2C9EF:
        :: COERCEDUP rclä OBJ_2CF08 SWAPDROP ;   * 2C9EF

* refs (4): 1FF2A 48BC0 4A20D AF85F
STATLR:
        :: RclXYCol&äDAT 3PICKOVER OBJ_2CC4C OBJ_2CDA5 3PICK3PICK OBJ_2CC06 * 2CA0D
          OBJ_2CDA5 BINT5 NDUP OBJ_2CC4C OBJ_2CC06 OBJ_2CE7C 6PICK 5ROLL * 2CA30
          5PICK OBJ_2CC4C OBJ_2CDFA DUP %%0= case OBJ_2D2D7 * 2CA58
          %%/ SWAPROT 3PICK %%-* OBJ_2CC06 IT %%EXP * 2CA7B
          %%>% SWAP %%>% 2SWAP 2DROP ChkReakäPAR ROTROT2DROP 4PICKSWAP 6PICK * 2CA9E
          3UNROLL                                * 2CACB

predy(r):
          StoäPAR(5_) ;                          * 2CAD0

* % -> %'
* refs (3): 1FF89 1FFA9 B7F0E
STATPREDY:
        ::                                       * 2CADA

predx(r):
          ChkReakäPAR DROP ROTDROP ROTDROP ROT %>%% OBJ_2CC4C IT OBJ_2CBC5 * 2CADF
          SWAP %>%% %%*SWAP %>%% OBJ_2CC06 IT OBJ_2CBC5 * 2CB0C
          %%+ OBJ_2CC06 IT %%EXP                 * 2CB2F
          %%>% ;                                 * 2CB43

* % -> %'
* refs (2): 1FFC9 B7EFF
STATPREDX:
        ::                                       * 2CB4D

PwrExpFIT?:
          ChkReakäPAR DROP ROTDROP ROTDROP ROT %>%% OBJ_2CC06 IT OBJ_2CBC5 * 2CB52
          ROT %>%% OBJ_2CC06 IT OBJ_2CBC5        * 2CB7F
          %%- SWAP %>%% %%/ OBJ_2CC4C IT %%EXP   * 2CB98
          %%>% ;                                 * 2CBBB

* refs (4): 2CB07 2CB2A 2CB7A 2CB93
OBJ_2CBC5:
        :: DUP %%0> ?SKIP OBJ_2CBE8              * 2CBC5
          %%LN ;                                 * 2CBDE

* refs (1): 2CBD9
OBJ_2CBE8:
        :: %%0< ?SKIP OBJ_2D307                  * 2CBE8
          OBJ_2D2F7 ;                            * 2CBFC

* refs (14): 2C84B 2C85F 2C8AF 2C909 2C918 2CA2B ...
OBJ_2CC06:
        ::                                       * 2CC06

PwrLogFIT?:
          ChkReakäPAR 5UNROLL 4DROP DUP ' xPWRFIT EQUAL SWAP ' xEXPFIT EQUAL * 2CC0B
          OR ;                                   * 2CC42

* refs (12): 2C878 2C88C 2C8AA 2C8FA 2C913 2CA1C ...
OBJ_2CC4C:
        ::                                       * 2CC4C

nrows(ar):
          ChkReakäPAR 5UNROLL 4DROP DUP ' xPWRFIT EQUAL SWAP ' xLOGFIT EQUAL * 2CC51
          OR ;                                   * 2CC88

* refs (4): 2C54E 2C81E 2C927 CB565
OBJ_2CC92:
        CON(5)  (*)+5                            * 2CC92  primitive code object
        ASSEMBLE

* refs (1): 2CC92
maxcols(s,ra):
        A=DAT1  A                                * 2CC97
        D1=D1+  5                                * 2CC9A
        D=D+1   A                                * 2CC9D
        GOSUB   SAVPTR~jump_2CE75                * 2CC9F
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
        GOSUB   GETPTR~jump_2CE6E                * 2CDE3
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
GETPTR~jump_2CE6E:
        GOVLNG  GETPTR                           * 2CE6E

* refs (3): 2C4E8 2CC9F 2CF38
SAVPTR~jump_2CE75:
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
        GOSUB   GETPTR~jump_2CE6E                * 2CF14
        D1=D1-  15                               * 2CF18
        D=D-1   A                                * 2CF1B
        D=D-1   A                                * 2CF1D
        D=D-1   A                                * 2CF1F
        GOTO    L_2D2BD                          * 2CF21
L_2CF25:
        GOSUB   GETPTR~jump_2CE6E                * 2CF25
        GOTO    L_2D2EC                          * 2CF29

* refs (4): 2CCC2 2CD35 2CDB1 2CE0D
SUB_2CF2D:
        GOSUB   SUB_2CEE8                        * 2CF2D

* refs (1): 2CF96
SUB_2CF31:
        GOSUB   SUB_2CEF2                        * 2CF31
        R4=C                                     * 2CF35
        GOSUB   SAVPTR~jump_2CE75                * 2CF38
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
        GOSUB   SPLITA~jump                      * 2CFC6
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
SPLITA~jump:
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
        GOSUB   SPLITA~jump                      * 2D148
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
rclä!~1:
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
        :: CLOSEUART ClrServMode OBJ_11387 OBJ_5394C OpenIO_324C8 ; * 2D359

* refs (7): 2D82F 2DA04 2DA90 2E6C3 2E8DB 307FB ...
OBJ_2D37C:
        $ "p% @-# 1"                             * 2D37C

* refs (5): 2D5E6 2D85C 2F6B4 2F6EB 2F9A2
MAXRETRY:
        # A                                      * 2D396  10

* refs (11): 2D6B8 2D843 2DA22 2DABD 2E0E0 2E6D7 ...
LAMPKNO:
        LAM 'PKNO                                * 2D3A0

* refs (5): 2D5FA 2EEE2 2F103 2F112 30838
LAMPACKET:
        LAM 'PACKET                              * 2D3B1

* refs (6): 2D5FF 2D7B2 2D7C1 2D7E4 2D875 2F6F5
LAMRETRY:
        LAM 'RETRY                               * 2D3C6

* refs (3): 2D992 2DD3D 2DD5B
LAMERRMSG:
        LAM 'ERRMSG                              * 2D3D9

* refs (7): 2D44B 2D83E 2DA1D 2E6D2 2E8EA 2FD0D ...
LAMKP:
        LAM 'KP                                  * 2D3EE

* refs (13): 2D870 2DF06 2E912 2EED8 2F0EF 2F0FE ...
LAMLNAME:
        LAM 'LNAME                               * 2D3FB

* refs (6): 2E5D8 2EEDD 2F10D 2F1C1 2F284 2FC72
LAMOBJ:
        LAM 'OBJ                                 * 2D40E

* refs (3): 2F20C 2F26B 2F338
LAMOPOS:
        LAM 'OPOS                                * 2D41D

* refs (3): 2DA18 2DA9F 2EF23
LAMEXCHP:
        LAM 'EXCHP                               * 2D42E

* refs (4): 2D56E 2DAA9 2EF0F 2F73B
'LamKPSto:
        :: ' LAMKP STO ;                         * 2D441

* refs (3): 2F207 2F289 2F31F
LAMKLIST:
        LAM 'KLIST                               * 2D45A

* refs (5): 2D87A 2DF0B 2E917 2F3EC 2F484
LAMKMODE:
        LAM 'KMODE                               * 2D46D

* refs (6): 2F574 2F5B5 2FBA0 2FBB4 2FBC8 2FBEB
LAMKPTRN:
        LAM 'KPTRN                               * 2D480

* refs (7): 2D807 2D87F 2DF10 2E91C 2EEE7 2F068 ...
LAMKRM:
        LAM 'KRM                                 * 2D493

* refs (3): 2D604 2D672 3084C
LAMMaxR:
        LAM 'MaxR                                * 2D4A2

* refs (2): 2D52B 2EF00
OBJ_2D4B3:
        :: DUPZERO 4ROLL BUILDKPACKET Connecting JstGetTHEMESG KDispStatus2 * 2D4B3
          SWAP                                   * 2D4D6

{local''}:
          { NULLLAM } BIND SEND_PACKET NOTcase false;Lpop * 2D4DB
          1ABNDSWAP OBJ_3088E DUP NOTcaseFALSE ; * 2D4FE

* refs (1): 2E92B
EXCHINITPK:
        :: KERMOPEN CHR_I CHOOSE_INIT OBJ_2D4B3 BINT0 OBJ_2DAB3 case * 2D517
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
            'LamKPSto ;                          * 2D56E
          case 3DROP                             * 2D578
          ERROROUT ;                             * 2D582

* refs (2): 2E754 2EF46
SENDEOT:
        :: NULL$ GetKermPkt# CHR_B BUILDKPACKET BINT2 SENDEOT~1 casedrptru * 2D58C
          case                                   * 2D5B4
          TrueFalse                              * 2D5B9
          DUP # C02 #=case DROPTRUE              * 2D5BE
          FalseFalse ;                           * 2D5D7

* refs (4): 2D4EF 2E94E 2F24D 2F36F
SEND_PACKET:
        :: MAXRETRY                              * 2D5E1

* refs (1): 2D5AA
SENDEOT~1:
          :: DUP                                 * 2D5EB
            { LAMPACKET LAMRETRY LAMMaxR } BIND  * 2D5F5
L_2D613:
            SEND_PACKET~1 NOTcase Lpop;2false    * 2D613
            DUP CHR_Y EQUALcase                  * 2D622
            :: OVER GetKermPkt# #=case           * 2D631

* refs (1): 2D6DB
OBJ_2D645:
              :: 2DROP IncrLAMPKNO Lpop;true ;   * 2D645
              OBJ_2F957 case                     * 2D65E

* refs (1): 2D6EF
OBJ_2D668:
              :: 3DROP LAMMaxR OBJ_2D7AD ?GOTO L_2D613 XFERFAIL Lpop;2false ; * 2D668
              Lpop;true;false ;                  * 2D695
            DUP CHR_N EQUALcase                  * 2D69F
            :: OVER LAMPKNO #1+ # 40 #/ DROP #=case OBJ_2D645 * 2D6AE
              OVER GetKermPkt# #=case OBJ_2D668  * 2D6E0
              Lpop;true;false ;                  * 2D6F4

* refs (3): 2D695 2D6F4 2F858
Lpop;true;false:
            :: ABND TrueFalse ; ;                * 2D6FE
        ;                                        * 2D717

* refs (5): 2D61D 2D68B 2F812 2F9BB 2FB3C
Lpop;2false:
        :: ABND FalseFalse ;                     * 2D71C

* refs (6): 2D7F8 2DD7E 2F05E 2F22A 2F51A 2FAAB
KDispRow2:
        :: BINT39 TestSysFlag caseDROP DISPROW2  * 2D730
        ;                                        * 2D749

* refs (6): 2D4D1 2D82A 2DA8B 2F027 2F0F9 2F902
KDispStatus2:
        :: BINT39 TestSysFlag caseDROP DISPSTATUS2 * 2D74E
        ;                                        * 2D767

* refs (2): 2D799 2D8B1
OBJ_2D76C:
        :: 3PICK EQUAL SWAP4PICK #= AND ;        * 2D76C

* refs (5): 2DB7B 2DB8A 2DBA8 2DBB7 2DBC6
DOSERVER~2:
        :: ZEROSWAP OBJ_2D76C COLA ?GOTO         * 2D78F
        ;                                        * 2D7A8

* refs (4): 2D677 2F6B9 2F9A7 30851
OBJ_2D7AD:
        :: LAMRETRY #1-DUP ' LAMRETRY STO #0=case DROPFALSE * 2D7AD
          Retry JstGetTHEMESG SWAP LAMRETRY #- #>$ &$ KDispRow2 TrueTrue ' * 2D7D5
          LAMKRM STO ;                           * 2D807

* $/id/lam ->
* refs (6): 21F71 21F7B 21F85 21FA5 B81D3 B8AC6
DORECN:
        :: nm=>st! Connecting JstGetTHEMESG KDispStatus2 OBJ_2D37C BINT0 * 2D816
          { LAMKP LAMPKNO } BIND ERRSET          * 2D839
          :: MAXRETRY NULL$ FALSE                * 2D857
            { LAMLNAME LAMRETRY LAMKMODE LAMKRM } BIND KERMOPEN RecvNextPkt * 2D86B
            NOTcasedrop ERROROUT                 * 2D898

* refs (1): 2E97B
DOPKT~1:
            :: BINT0 CHR_S OBJ_2D76C NOTcase TRPACKETFAIL * 2D8A2
              2DROP OBJ_2F709 case AllowPrlcdCl  * 2D8C0
              ABND case TRPACKETFAIL             * 2D8D4
              DUP #SyntaxErr #<>case ERROROUT    * 2D8E3
              JstGetTHEMESG Conc:RC(2st) EXITMSGSTO #EXITERR ERROROUT ; * 2D8F7
          ;                                      * 2D915
          ERRTRAP OBJ_2E763 ABND ;               * 2D91A

* refs (1): 2DDBA
DOSERVER~3:
        :: DEPTH #0=ITE MessageC15               * 2D92E
          :: NULL$TEMP DEPTH ONE_DO ?ATTNQUIT ISTOP-INDEX DUP#2+ PICK # 4B * 2D942
            DoSt:(s,_,s) !!append$ CRLF$ !!append$ LOOP ; * 2D974
          LAMERRMSG !insert$ ;                   * 2D992

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
DOSERVER~4:
        :: NoIgnoreAlm GETKEY NOT?SEMI           * 2D9C3
          DROP FLUSHKEYS DoBadKey COLA DOSERVER~4 * 2D9D7
        ;                                        * 2D9F0

* refs (2): 21FDB AFE1B
DOSERVER:
        :: KERMOPEN CHOOSE_INIT OBJ_2D37C BINT0 TRUE * 2D9F5
          { LAMEXCHP LAMKP LAMPKNO nohalt } BIND ERRSET * 2DA13
          :: SetServMode                         * 2DA3B
L_2DA45:
            ClrDA1IsStat                         * 2DA45

* refs (4): 2DDE7 2E06D 2E090 2EB14
KERMOPEN~1:
            :: BINT39 TestSysFlag COLA ?SKIP     * 2DA4A
            ;                                    * 2DA63
            :: CLEARVDISP CLEARMENU ; # C0C JstGetTHEMESG KDispStatus2 * 2DA68
            OBJ_2D37C CHOOSE_INIT                * 2DA90
L_2DA9A:
            ' LAMEXCHP STO 'LamKPSto BINT0       * 2DA9A

* refs (4): 2D535 2DB71 2F392 2F835
OBJ_2DAB3:
            :: ' LAMPKNO STO ; BEGIN OBJ_2E2B4 NOT_WHILE * 2DAB3
            :: DROP SENDNAK DOSERVER~4 ATTN? case * 2DADB
              :: ATTNFLGCLR 2RDROP ;             * 2DAF9
              ALARM? case                        * 2DB0D
              :: ALARMxcp DROP NOT?SEMI          * 2DB17
                CtlAlarm! DoCAlarmKey ;          * 2DB2B
              TIMEOUT? IT                        * 2DB3A
              :: TurnOff ClrServMode KERMOPEN SetServMode ; * 2DB44
            ;                                    * 2DB62
            REPEAT                               * 2DB67
L_2DB6C:
            BINT0 OBJ_2DAB3 CHR_S DOSERVER~2 L_2DEED CHR_I DOSERVER~2 * 2DB6C
            L_2DE41 ROT DECODE 3UNROLL CHR_R DOSERVER~2 L_2DFB4 CHR_C * 2DB8F
            DOSERVER~2 L_2DD4C CHR_G DOSERVER~2 L_2DE98 DUP CHR_E EQUALcase * 2DBB7
            :: 2DROP OBJ_30E6C GOTO L_2DFA5 ;    * 2DBDF
            3DROP                                * 2DBFD
L_2DC02:
            InvalServCmd                         * 2DC02
L_2DC07:
            OBJ_2EFA0 DUP OBJ_2F01D %2 dowait SENDERROR GOTO L_2DA45 * 2DC07
L_2DC2F:
            DOSERVER~1 ERRSET                    * 2DC2F

StringVarsBytes(st):
            :: DOVARS DUPLENCOMP DUP#0=ITE 2DROP * 2DC39
              :: #1+_ONE_DO DUPINDEX@ NTHCOMDDUP ID>$ APPEND_SPACE OVER * 2DC52
                VARSIZE EDITDECOMP$ APPEND_SPACE 4ROLL XEQRCL OBJ_15CCF * 2DC75
                APPEND_SPACE SWAP #>% EDITDECOMP$ !append$ !append$ APNDCRLF * 2DC93
                ROT !insert$ SWAPLOOP DROP ;     * 2DCB6
            ;                                    * 2DCCF
            ERRTRAP DropSysErr$ GOTO L_2DE05     * 2DCD4

* refs (1): 2DDA1
OBJ_2DCE8:
            :: ERRN DUP#0=case                   * 2DCE8
              :: OBJ_2EFA0 APNDCRLF SENDERROR ERRJMP ; * 2DCF7
              GETTHEMESG REALSTRSTR JstGetTHEMESG APPEND_SPACE !insert$ * 2DD15
              NEWLINE$ !append$ ' LAMERRMSG STO ; * 2DD2E
L_2DD4C:
            TWODROPNULL$ BINT0                   * 2DD4C
            { LAMERRMSG NULLLAM } BIND # C11 JstGetTHEMESG KDispRow2 * 2DD56
            KINVISLF &$ FLUSHKEYS xIFERR xSTR> xERRTHEN OBJ_2DCE8 xIFEND * 2DD83
            CK0NOLASTWD 0LASTOWDOB! ERRSET DOSERVER~3 ERRTRAP * 2DDAB

* refs (2): 2DCD9 2E768
DropSysErr$:
            :: DropSysObs ERROR@ OBJ_2EFA0 APNDCRLF ; ABND KERMOPEN~1 * 2DDC4
            :: TOADISP REDISPHBUFF ClrDAsOK ;    * 2DDEC
L_2DE05:
            NULL$SWAP CHR_X DOSERVER~6 ClrServMode KERMOPEN SetServMode * 2DE05
L_2DE23:
            ?GOTO L_2DA45 ?GOTO L_2DB6C GOTO L_2DC07 * 2DE23
L_2DE41:
            2DROP ACK_INIT NOT?GOTO L_2DC07 BINT0 SENDACK CHOOSE_INIT * 2DE41
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
            GOTO L_2DA9A                         * 2DE8E
L_2DE98:
            DROPSWAP CAR$ DUP CHR_F EQUAL OVER CHR_L EQUALOR casedrop * 2DE98
            SENDNULLACK                          * 2DEC5
            CHR_D EQUAL ?GOTO L_2DC2F DROP GOTO L_2DC02 * 2DECA
L_2DEED:
            2DROP NULL$ DUP FALSE                * 2DEED
            { LAMLNAME LAMKMODE LAMKRM } BIND ERRSET OBJ_2F709 ERRTRAP * 2DF01
            :: DropSysObs ERROR@ OBJ_2E4BE FALSE ; ABND ?GOTO L_2DA45 ?GOTO * 2DF2E
            L_2DB6C DUP OBJ_2EFA0 SWAP #SyntaxErr #= IT * 2DF60

* refs (1): 2D8FC
Conc:RC(2st):
            ::                                   * 2DF83

_:chr(10)_:
              $ ":\0A" !append$ !insert$ ;       * 2DF88
L_2DFA5:
            OBJ_2F01D GOTO L_2DA45               * 2DFA5
L_2DFB4:
            2DROP DUP palparse NOTcase           * 2DFB4
            :: 4DROP OBJ_2DFE6 ;                 * 2DFC8
            dup;#nm? case2drop                   * 2DFDC

* refs (1): 2DFD2
OBJ_2DFE6:
            :: OBJ_672DC GOTO L_2DC07 ;          * 2DFE6
            DRPExitAtLOOP NOTcasedrop            * 2DFFF
            :: DOSERVER~5 GOTO L_2DC07 ;         * 2E009
            CHR_F DOSERVER~6 GOTO L_2DE23 ;      * 2E022
          ERRTRAP                                * 2E03B
          :: ERROR@ DUP #0=?SEMI FLUSHKEYS ClrServMode GETTHEMESG SENDERROR * 2E040
            AllowPrlcdCl KERMOPEN~1 ClrDAsOK ERRJMP ; * 2E068
          FLUSHKEYS ClrServMode AllowPrlcdCl KERMOPEN~1 ClrDAsOK ABND * 2E081
          DropSysObs ;                           * 2E09F
