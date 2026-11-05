* HP 48GX ROM revision R, #2C000-#2E0A8: Probability tails (UTPN and friends), statistics (ΣDAT, ΣPAR, column sums and fits) in library 006, and the start of Kermit in library 00C: sending, server loop
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: 1+(rr) ChkReakäPAR PwrExpFIT? LAMLNAME PwrLogFIT? LAMPKNO StatColArgs StatPopA rclä StatPerColumn StatColMean PUTAB0
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
        ENDLENGTH                                * 2C081

        LENGTH                                   * 2C081  library object without its prolog (its place is the end of the link table before): length, to #2D33B
        CON(2)  0                                * 2C086  no title

* Library 006: Statistics: no commands of its own, only the message table for the Σ errors #601-#606
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
            GOSBVL  UtpnX%%                      * 2C10D
            GOSBVL  Utpn                         * 2C114
utpn(3r).L1:
            GOSBVL  PACK                         * 2C11B
            GOVLNG  PUSH%LOOP                    * 2C122
          ENDCODE                                * 2C129
        ;                                        * 2C129

* refs (1): 20029
* The real-real case of UTPC (the list's name utpn(2r) is wrong: xUTPC dispatches here)
utpc(2r):
        :: SWAP %0_2A2B4                         * 2C12E
          CODE                                   * 2C13D  18 nibbles
            GOSBVL  UtpArgs                      * 2C147
            GOSBVL  UtpcCore                     * 2C14E
            GOTO    utpn(3r).L1                  * 2C155
          ENDCODE                                * 2C159
        ;                                        * 2C159

* refs (1): 20069
utpf(3r):
        :: 3UNROLL                               * 2C15E
          CODE                                   * 2C168  18 nibbles
            GOSBVL  UtpArgs                      * 2C172
            GOSBVL  UtpfCore                     * 2C179
            GOTO    utpn(3r).L1                  * 2C180
          ENDCODE                                * 2C184
        ;                                        * 2C184

* refs (1): 20089
utpt(2r):
        :: SWAP %0_2A2B4                         * 2C189
          CODE                                   * 2C198  18 nibbles
            GOSBVL  UtpArgs                      * 2C1A2
            GOSBVL  UtptCore                     * 2C1A9
            GOTO    utpn(3r).L1                  * 2C1B0
          ENDCODE                                * 2C1B4
        ;                                        * 2C1B4

* refs (2): 0FBC4 0FC55
%%1E2:
        %% 1E2                                   * 2C1B9

* refs (20): 2B25F 2B28C 2B2C8 528A4 912B6 91D65 ...
1+(rr):
        :: %%1 %%+ ;                             * 2C1D3
        BSS     12                               * 2C1E7  zeros

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
xSIGMA-~2:
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
        :: ' ID_SIGMADAT RclPlotVar? ;           * 2C293

* refs (3): 1FD50 2C2CA 4B779
rclä!:
        :: Exist@äDAT? ?SEMI                     * 2C2AC
          ErrNoStatDat ;                         * 2C2BB

* refs (8): 200CE 2C428 2C5F8 2C7EC 2C9F9 48E32 ...
rclä:
        :: rclä! ChkStatArray ;                  * 2C2C5

* refs (1): 1FD70
ä+(r):
        :: STATRCL NOTcase                       * 2C2D9

Stoä(r):
          :: ONEONE TWO{}N SWAP MAKEARRY Sto@ä ; * 2C2E8
          ChkStatArray MDIMSDROP SWAPDROP UNCOERCE XEQ>VECTOR xSIGMA+ ; * 2C30B

* refs (3): 1FD7A B57A2 B7D6A
å-:
        :: dup;ra?#BAT! STATRCL ?GOTO å-.L1 DUP MDIMS case2drop Sto@ä * 2C32E
          BINT1 OVER TWO{}N %0_2A2B4 MAKEARRY Sto@ä STATRCL DROPSWAP BINT0 * 2C35B
          GOTO å-.L2                             * 2C388
å-.L1:
          ChkStatArray OVER MDIMS ?SKIP ONESWAP  * 2C392
          3PICK MDIMSDROP 3PICK #<> caseSIZEERR ROT#+ * 2C3AB
          SWAP TWO{}N @rdm(ar,ls) OVERARSIZE OVERARSIZE OVER#- * 2C3C9
å-.L2:
          4UNROLL #1+_ONE_DO SWAPINDEX@ PULLREALEL ROTSWAP 4PICK INDEX@ #+ * 2C3E7
          PUTREALEL NextInArray 3DROP ;          * 2C40F

* refs (1): 1FD95
xSIGMA-~1:
        :: rclä DUP MDIMSDROP ROTOVER lastv(ra,s) SWAP4ROLL 4ROLLOVER * 2C423
          #1=case                                * 2C44B
          :: 3DROP xSIGMA-~2 STATCLST ;          * 2C450
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
            GOSUBL  SAVPTR~jump_12               * 2C4E8
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
          ChkStatArray StatRows ;                * 2C549

* -> %
* refs (1): 1FE88
STATSMAX:
        :: BINT0 StatPerColumn ColumnMAX ;       * 2C558

* -> % -> []
* refs (1): 1FEA3
STATMEAN:
        :: BINT0 StatPerColumn ColumnMEAN ;      * 2C571

* -> %
* refs (1): 1FEBE
STATSMIN:
        :: BINT0 StatPerColumn ColumnMIN ;       * 2C58A

* -> % -> []
* refs (1): 1FED9
STATSTDEV:
        :: BINT1 StatPerColumn ColumnTDEV ;      * 2C5A3

* -> % -> []
* refs (1): 1FEF4
STATTOT:
        :: BINT0 StatPerColumn ColumnTOT ;       * 2C5BC

* -> % -> []
* refs (1): 1FF0F
STATVAR:
        :: BINT1 StatPerColumn ColumnVAR ;       * 2C5D5

* refs (8): 2C562 2C57B 2C594 2C5AD 2C5C6 2C5DF ...
* #min -> % / [%]: takes the next object in the caller's stream, a column routine (#col [] -> %), and runs it on every column of ΣDAT. ΣDAT must have more than #min rows, else "Insufficient Σ Data". One column gives a real, several give a vector
StatPerColumn:
        :: 'R rclä DUP MDIMSDROP SWAP 5ROLL #>?SKIP ErrInsufStat DUPONE * 2C5EE
          #=case                                 * 2C620
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
          DUPTYPELIST? NOTcase ErrBadStatPar     * 2C77E
          INNERCOMP BINT5 EQ NOTcase ErrBadStatPar * 2C78D
          DUP ChkReakäPAR~2 matchob? NOTcase ErrBadStatPar * 2C7A6
          CK&DISPATCH0                           * 2C7BF
          ChkReakäPAR~1 NOP                      * 2C7C4  real real real real program
          BINT0 ErrBadStatPar                    * 2C7CE  any
        ;                                        * 2C7D8

* refs (1): 2C7C4
* Argument types for the check of ΣPAR: real real real real program
ChkReakäPAR~1:
        # 11118                                  * 2C7DD  69912

* refs (6): 2C814 2C841 2C9C7 2CA12 4C8D6 CB529
RclXYCol&äDAT:
        :: rclä ChkReakäPAR 3DROP COERCE2 ROT ChkStatCols ; * 2C7E7

* refs (1): 2C8EB
RclXYCol&äDAT!:
        :: RclXYCol&äDAT DUP StatRows %1 %= case ErrInsufStat * 2C80F
        ;                                        * 2C837

* -> %
* refs (3): 1FDCB 4A1C7 B7EEB
STATCORR:
        :: RclXYCol&äDAT 2DUP PwrExpFIT? StatColMean BINT3 NDUP PwrExpFIT? * 2C83C
          StatColSS 5UNROLL 4ROLLROT 2DUP PwrLogFIT? StatColMean BINT3 NDUP * 2C864
          PwrLogFIT? StatColSS 6UNROLL 4ROLL 5ROLL 4UNROLL PwrLogFIT? * 2C88C
          PwrExpFIT? StatColsSP 3UNROLL %%* DUP %%0= case2drop %1 * 2C8AF
          %%SQRT %%/>% ;                         * 2C8D7

* -> %
* refs (2): 1FDE6 B7EF0
STATCOV:
        :: RclXYCol&äDAT! DUP4UNROLL 3PICKOVER PwrLogFIT? StatColMean * 2C8E6
          3PICK3PICK PwrExpFIT? StatColMean PwrLogFIT? PwrExpFIT? StatColsSP * 2C904
          SWAP StatRows %1 %>%%- %%/>% ;         * 2C922

* -> %
* refs (2): 1FE01 B7F1D
STATX:
        :: STATGETXCOL StatColArgs ColumnTOT ;   * 2C940

* -> %
* refs (2): 1FE1C B7F2C
STATY:
        :: STATGETYCOL StatColArgs ColumnTOT ;   * 2C959

* -> %
* refs (2): 1FE37 B7F3B
STATXX:
        :: STATGETXCOL StatColArgs %%0 FALSE StatColSS %%>% ; * 2C972

* -> %
* refs (2): 1FE52 B7F4A
STATYY:
        :: STATGETYCOL StatColArgs %%0 FALSE StatColSS %%>% ; * 2C99A

* -> %
* refs (2): 1FE6D B7F59
STATXY:
        :: RclXYCol&äDAT %%0 DUP FALSE DUP StatColsSP %%>% ; * 2C9C2

* refs (10): 2C94A 2C963 2C97C 2C9A4 B7E1E B7E37 ...
* % -> #col []: the column number as a bint and ΣDAT, checked that the column exists. For ΣX, ΣY, ΣX2 and ΣY2
StatColArgs:
        :: COERCEDUP rclä ChkStatCols SWAPDROP ; * 2C9EF

* refs (4): 1FF2A 48BC0 4A20D AF85F
STATLR:
        :: RclXYCol&äDAT 3PICKOVER PwrLogFIT? StatColMean 3PICK3PICK * 2CA0D
          PwrExpFIT? StatColMean BINT5 NDUP PwrLogFIT? PwrExpFIT? StatColsSP * 2CA2B
          6PICK 5ROLL 5PICK PwrLogFIT? StatColSS DUP %%0= case ErrInsufStat * 2CA4E
          %%/ SWAPROT 3PICK %%-* PwrExpFIT? IT %%EXP * 2CA7B
          %%>% SWAP %%>% 2SWAP 2DROP ChkReakäPAR ROTROT2DROP 4PICKSWAP 6PICK * 2CA9E
          3UNROLL                                * 2CACB
* The Very Big List names this address predy(r), but it is a pointer inside an object; the name is not used
          StoäPAR(5_) ;                          * 2CAD0

* % -> %'
* refs (3): 1FF89 1FFA9 B7F0E
STATPREDY:
        ::                                       * 2CADA
* The Very Big List names this address predx(r), but it is a pointer inside an object; the name is not used
          ChkReakäPAR DROP ROTDROP ROTDROP ROT %>%% PwrLogFIT? IT StatLN * 2CADF
          SWAP %>%% %%*SWAP %>%% PwrExpFIT? IT StatLN * 2CB0C
          %%+ PwrExpFIT? IT %%EXP                * 2CB2F
          %%>% ;                                 * 2CB43

* % -> %'
* refs (2): 1FFC9 B7EFF
STATPREDX:
        ::                                       * 2CB4D
* The Very Big List names this address PwrExpFIT?, but it is a pointer inside an object; the name is not used
          ChkReakäPAR DROP ROTDROP ROTDROP ROT %>%% PwrExpFIT? IT StatLN * 2CB52
          ROT %>%% PwrExpFIT? IT StatLN          * 2CB7F
          %%- SWAP %>%% %%/ PwrLogFIT? IT %%EXP  * 2CB98
          %%>% ;                                 * 2CBBB

* refs (4): 2CB07 2CB2A 2CB7A 2CB93
* %% -> %%': ln, with the statistics errors for values that are not positive
StatLN:
        :: DUP %%0> ?SKIP StatLnErr              * 2CBC5
          %%LN ;                                 * 2CBDE

* refs (1): 2CBD9
* %% ->: raises "Invalid Σ Data LN(Neg)" for a negative value, "Invalid Σ Data LN(0)" for zero
StatLnErr:
        :: %%0< ?SKIP ErrStatLn0                 * 2CBE8
          ErrStatLnNeg ;                         * 2CBFC

* refs (14): 2C84B 2C85F 2C8AF 2C909 2C918 2CA2B ...
* -> flag: TRUE when the statistics model (in ΣPAR) is PWRFIT or EXPFIT, the models that fit ln(y). The VBL puts this name one object off, at #2CB52
PwrExpFIT?:
        ::                                       * 2CC06
* The Very Big List names this address PwrLogFIT?, but it is a pointer inside an object; the name is not used
          ChkReakäPAR 5UNROLL 4DROP DUP ' xPWRFIT EQUAL SWAP ' xEXPFIT EQUAL * 2CC0B
          OR ;                                   * 2CC42

* refs (12): 2C878 2C88C 2C8AA 2C8FA 2C913 2CA1C ...
* -> flag: TRUE when the statistics model (in ΣPAR) is PWRFIT or LOGFIT, the models that fit ln(x). The VBL puts this name one object off, at #2CC0B
PwrLogFIT?:
        ::                                       * 2CC4C
* The Very Big List names this address nrows(ar), but it is a pointer inside an object; the name is not used
          ChkReakäPAR 5UNROLL 4DROP DUP ' xPWRFIT EQUAL SWAP ' xLOGFIT EQUAL * 2CC51
          OR ;                                   * 2CC88

* refs (4): 2C54E 2C81E 2C927 CB565
* [] -> %: the number of rows of an array (N for ΣDAT). The label after the header, maxcols(s,ra), is the Very Big List's and is wrong: it reads the first dimension
StatRows:
        CON(5)  (*)+5                            * 2CC92  primitive code object
        ASSEMBLE

* refs (1): 2CC92
maxcols(s,ra):
        A=DAT1  A                                * 2CC97
        D1=D1+  5                                * 2CC9A
        D=D+1   A                                * 2CC9D
        GOSUB   SAVPTR~jump_12                   * 2CC9F
        D0=A                                     * 2CCA3
        D0=D0+  15                               * 2CCA6
        D0=D0+  5                                * 2CCA9
        A=DAT0  A                                * 2CCAC
        GOSBVL  Hex>%%                           * 2CCAF
        GOTO    ColumnPSDEV.L6                   * 2CCB6

* refs (3): 2C567 4957D B7EA5
ColumnMAX:
        CON(5)  (*)+5                            * 2CCBA  primitive code object
        ST=1    3                                * 2CCBF
ColumnMAX.L1:
        GOSUB   StatPopCol                       * 2CCC2
        SETDEC                                   * 2CCC6
        GOSUB   StatColExtreme                   * 2CCC8
        A=B     M                                * 2CCCC
        GOTO    ColumnPSDEV.L6                   * 2CCCF

* refs (3): 2C599 49573 B7EBE
ColumnMIN:
        CON(5)  (*)+5                            * 2CCD3  primitive code object
        ST=0    3                                * 2CCD8
        GOTO    ColumnMAX.L1                     * 2CCDB

* refs (4): 2C5CB 2C94F 2C968 B7E8C
ColumnTOT:
        CON(5)  (*)+5                            * 2CCDF  primitive code object
        ST=0    3                                * 2CCE4
        ST=0    4                                * 2CCE7
        GOTO    ColumnPSDEV.L2                   * 2CCEA

* refs (2): 2C580 B7E23
ColumnMEAN:
        CON(5)  (*)+5                            * 2CCEE  primitive code object
        ST=1    3                                * 2CCF3
        ST=0    4                                * 2CCF6
        GOTO    ColumnPSDEV.L2                   * 2CCF9

* refs (2): 2C5E4 B7E6E
ColumnVAR:
        CON(5)  (*)+5                            * 2CCFD  primitive code object
        ST=0    3                                * 2CD02
        GOTO    ColumnTDEV.L1                    * 2CD05

* refs (2): 2C5B2 B7E46
ColumnTDEV:
        CON(5)  (*)+5                            * 2CD09  primitive code object
        ST=1    3                                * 2CD0E
ColumnTDEV.L1:
        ST=1    4                                * 2CD11
        ST=0    1                                * 2CD14
        GOTO    ColumnPSDEV.L2                   * 2CD17

* refs (2): B7E73 CB51A
* #col [] -> %: population variance of a column. Flags for the code at ColumnPSDEV: ST3 take the root, ST4 two passes (sum, then squared deviations), ST1 divide by N rather than N-1
ColumnPVAR:
        CON(5)  (*)+5                            * 2CD1B  primitive code object
        ST=0    3                                * 2CD20
        GOTO    ColumnPSDEV.L1                   * 2CD23

* refs (2): B7E4B CB501
* #col [] -> %: population standard deviation of a column. The column routines share this code; the entry they use sets the flags
ColumnPSDEV:
        CON(5)  (*)+5                            * 2CD27  primitive code object
        ST=1    3                                * 2CD2C
ColumnPSDEV.L1:
        ST=1    4                                * 2CD2F
        ST=1    1                                * 2CD32
ColumnPSDEV.L2:
        GOSUB   StatPopCol                       * 2CD35
        R3=A                                     * 2CD39
        DCEX    A                                * 2CD3C
        R2=C                                     * 2CD3E
        C=D     A                                * 2CD41
        ST=0    2                                * 2CD43
        GOSUB   StatSumCol                       * 2CD46
        ?ST=1   4                                * 2CD4A
        GOYES   ColumnPSDEV.L3                   * 2CD4D
        ?ST=0   3                                * 2CD4F
        GOYES   ColumnPSDEV.L5                   * 2CD52
ColumnPSDEV.L3:
        RSTK=C                                   * 2CD54
        A=R2                                     * 2CD56
        GOSUB   StatDivN                         * 2CD59
        C=RSTK                                   * 2CD5D
        ?ST=0   4                                * 2CD5F
        GOYES   ColumnPSDEV.L5                   * 2CD62
        GOSBVL  EXAB2                            * 2CD64
        ABEX    A                                * 2CD6B
        BCEX    A                                * 2CD6D
        RSTK=C                                   * 2CD6F
        C=B     A                                * 2CD71
        ST=0    2                                * 2CD73
        GOSUB   StatSumDevSq                     * 2CD76
        C=RSTK                                   * 2CD7A
        A=C     A                                * 2CD7C
        SETHEX                                   * 2CD7E
        ?ST=1   1                                * 2CD80
        GOYES   ColumnPSDEV.L4                   * 2CD83
        A=A-1   A                                * 2CD85
ColumnPSDEV.L4:
        GOSUB   StatDivN                         * 2CD87
        ?ST=0   3                                * 2CD8B
        GOYES   ColumnPSDEV.L5                   * 2CD8E
        GOSBVL  SQRFchk                          * 2CD90
ColumnPSDEV.L5:
        GOSBVL  PACK                             * 2CD97
ColumnPSDEV.L6:
        GOVLNG  PUSH%LOOP                        * 2CD9E

* refs (8): 2C850 2C87D 2C8FF 2C90E 2CA21 2CA30 ...
* #col [] flag -> %%: mean of a column in extended precision, of ln(x) when flag is TRUE
StatColMean:
        CON(5)  (*)+5                            * 2CDA5  primitive code object
        GOSUB   StatPopA                         * 2CDAA
        R0=A                                     * 2CDAE
        GOSUB   StatPopCol                       * 2CDB1
        AR0EX                                    * 2CDB5
        B=A     A                                * 2CDB8
        GOSUB   StatTRUE                         * 2CDBA
        ST=0    2                                * 2CDBE
        ?A#B    A                                * 2CDC1
        GOYES   StatColMean.L1                   * 2CDC4
        ST=1    2                                * 2CDC6
StatColMean.L1:
        A=R0                                     * 2CDC9
        DCEX    A                                * 2CDCC
        RSTK=C                                   * 2CDCE
        C=D     A                                * 2CDD0
        GOSUB   StatSumCol                       * 2CDD2
        C=RSTK                                   * 2CDD6
        GONC    StatColMean.L3                   * 2CDD8
StatColMean.L2:
        C=D     A                                * 2CDDB
        A=C     A                                * 2CDDD
        P=      0                                * 2CDDF
        SETHEX                                   * 2CDE1
        GOSUB   GETPTR~jump_6                    * 2CDE3
        C=A     A                                * 2CDE7
        GOTO    ErrStatLn0.L1                    * 2CDE9
StatColMean.L3:
        A=C     A                                * 2CDED
        GOSUB   StatDivN                         * 2CDEF
StatColMean.L4:
        GOVLNG  PUSH%.L9                         * 2CDF3

* refs (5): 2C864 2C891 2C98B 2C9B3 2CA62
* #col [] %%m flag -> %%: sum of (x-m)^2 over a column, with ln(x) for x when flag is TRUE. With m = 0 this is ΣX2
StatColSS:
        CON(5)  (*)+5                            * 2CDFA  primitive code object
        GOSUB   StatPopA                         * 2CDFF
        R0=A                                     * 2CE03
        GOSUB   StatPopA                         * 2CE06
        R3=A                                     * 2CE0A
        GOSUB   StatPopCol                       * 2CE0D
        A=R0                                     * 2CE11
        B=A     A                                * 2CE14
        GOSUB   StatTRUE                         * 2CE16
        ST=0    2                                * 2CE1A
        ?A#B    A                                * 2CE1D
        GOYES   StatColSS.L1                     * 2CE20
        ST=1    2                                * 2CE22
StatColSS.L1:
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
        GOSUB   StatSumDevSq                     * 2CE47
StatColSS.L2:
        GONC    StatColMean.L4                   * 2CE4B
        GOTO    StatColMean.L2                   * 2CE4E

* refs (3): 2CD59 2CD87 2CDEF
* A.A = n, the 15-digit sum in the math registers -> sum/n
StatDivN:
        GOSBVL  Hex>15                           * 2CE52
        GOSBVL  RCCD0                            * 2CE59
        GOSBVL  XYEX                             * 2CE60
        GOVLNG  DIVF                             * 2CE67

* refs (3): 2CDE3 2CF14 2CF25
GETPTR~jump_6:
        GOVLNG  GETPTR                           * 2CE6E

* refs (3): 2C4E8 2CC9F 2CF38
SAVPTR~jump_12:
        GOVLNG  SAVPTR                           * 2CE75

* refs (5): 2C8B4 2C91D 2C9E0 2CA49 CB55B
* #x #y [] %%mx %%my flagx flagy -> %%: sum of (x-mx)(y-my) over two columns, with ln taken of a column whose flag is TRUE. With zero means this is ΣXY
StatColsSP:
        CON(5)  (*)+5                            * 2CE7C  primitive code object
        GOSUB   StatPopA                         * 2CE81
        R0=A                                     * 2CE85
        GOSUB   StatPopA                         * 2CE88
        R1=A                                     * 2CE8C
        GOSUB   StatPopA                         * 2CE8F
        GOSBVL  ASLW5                            * 2CE93
        GOSUB   StatPopA                         * 2CE9A
        GOSBVL  ASLW5                            * 2CE9E
        R2=A                                     * 2CEA5
        GOSUB   StatPop2Cols                     * 2CEA8
        A=R0                                     * 2CEAC
        B=A     A                                * 2CEAF
        GOSUB   StatTRUE                         * 2CEB1
        ST=0    1                                * 2CEB5
        ?A#B    A                                * 2CEB8
        GOYES   StatColsSP.L1                    * 2CEBB
        ST=1    1                                * 2CEBD
StatColsSP.L1:
        A=R1                                     * 2CEC0
        B=A     A                                * 2CEC3
        GOSUB   StatTRUE                         * 2CEC5
        ST=0    0                                * 2CEC9
        ?A#B    A                                * 2CECC
        GOYES   StatColsSP.L2                    * 2CECF
        ST=1    0                                * 2CED1
StatColsSP.L2:
        A=R2                                     * 2CED4
        A=R4.F  A                                * 2CED7
        R4=A                                     * 2CEDD
        GOSUB   StatSumProd                      * 2CEE0
        GOTO    StatColSS.L2                     * 2CEE4

* refs (9): 2CDAA 2CDFF 2CE06 2CE81 2CE88 2CE8F ...
* A.A = next object on the stack; one more free stack word in D
StatPopA:
        A=DAT1  A                                * 2CEE8
        D1=D1+  5                                * 2CEEB
        D=D+1   A                                * 2CEEE
        RTN                                      * 2CEF0

* refs (2): 2CF31 2CF8F
* C.A = next object on the stack; one more free stack word in D
StatPopC:
        C=DAT1  A                                * 2CEF2
        D1=D1+  5                                * 2CEF5
        D=D+1   A                                * 2CEF8
        RTN                                      * 2CEFA

* refs (4): 2CDBA 2CE16 2CEB1 2CEC5
* A.A = TRUE, for comparing a flag object just popped
StatTRUE:
        LA(5)   TRUE                             * 2CEFC
        RTN                                      * 2CF06

* refs (5): 2C805 2C9FE 48E55 48EA0 4D9ED
* #x #y [] -> #x #y []: raises "Invalid ΣPAR" if either column is zero or beyond the width of the array
ChkStatCols:
        CON(5)  (*)+5                            * 2CF08  primitive code object
        GOSUB   StatPop2Cols                     * 2CF0D
        GOC     ChkStatCols.L1                   * 2CF11
        GOSUB   GETPTR~jump_6                    * 2CF14
        D1=D1-  15                               * 2CF18
        D=D-1   A                                * 2CF1B
        D=D-1   A                                * 2CF1D
        D=D-1   A                                * 2CF1F
        GOTO    ChkStatArray.L3                  * 2CF21
ChkStatCols.L1:
        GOSUB   GETPTR~jump_6                    * 2CF25
        GOTO    ErrBadStatPar.L1                 * 2CF29

* refs (4): 2CCC2 2CD35 2CDB1 2CE0D
* Pops [] into A.A, then goes on into StatColPtr
StatPopCol:
        GOSUB   StatPopA                         * 2CF2D

* refs (1): 2CF96
* A.A = array; pops #col -> D0 and A.A = first element of the column, C.A = row length in nibbles, D.A = rows, R4 = end of the array (FFFFF if it wraps); carry set if the column is 0 or too big. Saves the RPL pointers
StatColPtr:
        GOSUB   StatPopC                         * 2CF31
        R4=C                                     * 2CF35
        GOSUB   SAVPTR~jump_12                   * 2CF38
        D0=A                                     * 2CF3C
        D0=D0+  5                                * 2CF3F
        AD0EX                                    * 2CF42
        D0=A                                     * 2CF45
        C=DAT0  A                                * 2CF48
        A=A+C   A                                * 2CF4B
        GONC    StatColPtr.L1                    * 2CF4D
        A=0     A                                * 2CF50
        A=A-1   A                                * 2CF52
StatColPtr.L1:
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
* Pops [] #y #x -> D0 = first element of column x, D1 of column y, the rest as StatColPtr. Carry set if either column is out of range
StatPop2Cols:
        GOSUB   StatPopA                         * 2CF8B
        GOSUB   StatPopC                         * 2CF8F
        R3=C                                     * 2CF93
        GOSUB   StatColPtr                       * 2CF96
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
* D0 = first element, C.A = row length, R4 = end -> maximum (ST3 set) or minimum of the column in A
StatColExtreme:
        RSTK=C                                   * 2CFC0
        A=DAT0  W                                * 2CFC2
        GOSUB   SPLITA~jump                      * 2CFC6
StatColExtreme.loop1:
        CD0EX                                    * 2CFCA
        D=C     A                                * 2CFCD
        C=RSTK                                   * 2CFCF
        SETHEX                                   * 2CFD1
        D=D+C   A                                * 2CFD3
        SETDEC                                   * 2CFD5
        RSTK=C                                   * 2CFD7
        C=R4                                     * 2CFD9
        GOC     StatColExtreme.L3                * 2CFDC
        ?D>=C   A                                * 2CFDF
        GOYES   StatColExtreme.L3                * 2CFE2
        C=D     A                                * 2CFE4
        D0=C                                     * 2CFE6
        C=DAT0  W                                * 2CFE9
        GOSBVL  SPLITC                           * 2CFED
        P=      6                                * 2CFF4
        ?ST=1   3                                * 2CFF6
        GOYES   StatColExtreme.L2                * 2CFF9
        P=      3                                * 2CFFB
StatColExtreme.L2:
        GOSBVL  TST15                            * 2CFFD
        GOC     StatColExtreme.loop1             * 2D004
        A=C     W                                * 2D007
        C=D     W                                * 2D00A
        B=C     W                                * 2D00D
        GONC    StatColExtreme.loop1             * 2D010
StatColExtreme.L3:
        C=RSTK                                   * 2D013
        P=      0                                * 2D015
        RTN                                      * 2D017

* refs (2): 2CD46 2CDD2
* A.A = first element, C.A = row length, R4 = end -> sum of the column in R0/R1 form, of ln(x) when ST2 is set. Carry set and C.A = error number on a bad logarithm
StatSumCol:
        D1=A                                     * 2D019
        HST=0   3                                * 2D01C
        A=0     W                                * 2D01F
        R0=A                                     * 2D022
        R1=A                                     * 2D025
StatSumCol.loop1:
        RSTK=C                                   * 2D028
        GOSUB   StatReadElt                      * 2D02A
        ?ST=0   2                                * 2D02E
        GOYES   StatSumCol.L3                    * 2D031
        GOSUB   StatChkLn                        * 2D033
        GONC    StatSumCol.L2                    * 2D037
        C=RSTK                                   * 2D03A
        C=D     A                                * 2D03C
        RTNSC                                    * 2D03E
StatSumCol.L2:
        C=R0                                     * 2D040
        RSTK=C                                   * 2D043
        R4=C.F  S                                * 2D045
        GOSBVL  LN15                             * 2D04B
        C=R4                                     * 2D052
        C=RSTK                                   * 2D055
        R0=C                                     * 2D057
StatSumCol.L3:
        GOSBVL  Acc15                            * 2D05A
        C=RSTK                                   * 2D061
        AD1EX                                    * 2D063
        SETHEX                                   * 2D066
        A=A+C   A                                * 2D068
        SETDEC                                   * 2D06A
        D1=A                                     * 2D06C
        B=A     A                                * 2D06F
        A=R4                                     * 2D071
        GOC     StatSumCol.L4                    * 2D074
        ?A>B    A                                * 2D077
        GOYES   StatSumCol.loop1                 * 2D07A
StatSumCol.L4:
        GOTO    StatSumProd.L5                   * 2D07C

* refs (3): 2D02A 2D0C1 2D1AF
* Reads the real at D1 and splits it for 15-digit arithmetic
StatReadElt:
        A=DAT1  W                                * 2D080

* refs (2): 2CFC6 2D148
SPLITA~jump:
        GOVLNG  SPLITA                           * 2D084

* refs (4): 2D033 2D0CA 2D151 2D1B8
* Split real in A/B -> carry clear if positive; else carry set and D.A = #605 (negative) or #606 (zero)
StatChkLn:
        P=      14                               * 2D08B
        C=0     A                                * 2D08D
        ?B=0    P                                * 2D08F
        GOYES   StatChkLn.L2                     * 2D092
        ?A#0    S                                * 2D094
        GOYES   StatChkLn.L1                     * 2D097
        RTNCC                                    * 2D099
StatChkLn.L1:
        P=      0                                * 2D09B
        LC(3)   #605                             * 2D09D
        GOC     StatChkLn.L3                     * 2D0A2
StatChkLn.L2:
        P=      0                                * 2D0A5
        LC(3)   #606                             * 2D0A7
StatChkLn.L3:
        D=C     A                                * 2D0AC
        RTNSC                                    * 2D0AE

* refs (2): 2CD76 2CE47
* As StatSumCol, summing (x-m)^2 with m in the saved math registers
StatSumDevSq:
        D1=A                                     * 2D0B0
        A=0     W                                * 2D0B3
        R0=A                                     * 2D0B6
        R1=A                                     * 2D0B9
        HST=0   3                                * 2D0BC
StatSumDevSq.loop1:
        RSTK=C                                   * 2D0BF
        GOSUB   StatReadElt                      * 2D0C1
        ?ST=0   2                                * 2D0C5
        GOYES   StatSumDevSq.L3                  * 2D0C8
        GOSUB   StatChkLn                        * 2D0CA
        GONC    StatSumDevSq.L2                  * 2D0CE
        C=RSTK                                   * 2D0D1
        C=D     A                                * 2D0D3
        RTNSC                                    * 2D0D5
StatSumDevSq.L2:
        C=R0                                     * 2D0D7
        RSTK=C                                   * 2D0DA
        R4=C.F  S                                * 2D0DC
        GOSBVL  LN15                             * 2D0E2
        C=R4                                     * 2D0E9
        C=RSTK                                   * 2D0EC
        R0=C                                     * 2D0EE
StatSumDevSq.L3:
        GOSBVL  RCCD2                            * 2D0F1
        C=-C-1  S                                * 2D0F8
        GOSBVL  RADDF                            * 2D0FB
        C=B     W                                * 2D102
        D=C     W                                * 2D105
        C=A     W                                * 2D108
        GOSBVL  MulAcc15                         * 2D10B
        C=RSTK                                   * 2D112
        AD1EX                                    * 2D114
        SETHEX                                   * 2D117
        A=A+C   A                                * 2D119
        SETDEC                                   * 2D11B
        D1=A                                     * 2D11D
        B=A     A                                * 2D120
        A=R4                                     * 2D122
        GOC     StatSumDevSq.L4                  * 2D125
        ?A>B    A                                * 2D128
        GOYES   StatSumDevSq.loop1               * 2D12B
StatSumDevSq.L4:
        GOTO    StatSumProd.L5                   * 2D12D

* refs (1): 2CEE0
* D0, D1 = columns, means by the pointers packed in R4 -> sum of (x-mx)(y-my); ST0 and ST1 take the ln of x and y
StatSumProd:
        A=0     W                                * 2D131
        R0=A                                     * 2D134
        R1=A                                     * 2D137
        HST=0   3                                * 2D13A
StatSumProd.loop1:
        RSTK=C                                   * 2D13D
        A=DAT0  W                                * 2D13F
        CD0EX                                    * 2D143
        RSTK=C                                   * 2D146
        GOSUB   SPLITA~jump                      * 2D148
        ?ST=0   0                                * 2D14C
        GOYES   StatSumProd.L2                   * 2D14F
        GOSUB   StatChkLn                        * 2D151
        GONC    StatSumProd.L2                   * 2D155
        C=RSTK                                   * 2D158
        C=RSTK                                   * 2D15A
        C=D     A                                * 2D15C
        RTNSC                                    * 2D15E
StatSumProd.L2:
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
        GOSUB   StatReadElt                      * 2D1AF
        ?ST=0   1                                * 2D1B3
        GOYES   StatSumProd.L3                   * 2D1B6
        GOSUB   StatChkLn                        * 2D1B8
        GONC    StatSumProd.L3                   * 2D1BC
        C=RSTK                                   * 2D1BF
        C=RSTK                                   * 2D1C1
        C=D     A                                * 2D1C3
        RTNSC                                    * 2D1C5
StatSumProd.L3:
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
        GOYES   StatSumProd.L4                   * 2D229
StatSumProd.L4:
        B=A     A                                * 2D22B
        A=R4                                     * 2D22D
        SETDEC                                   * 2D230
        GOC     StatSumProd.L5                   * 2D232
        ?A<=B   A                                * 2D235
        GOYES   StatSumProd.L5                   * 2D238
        GOTO    StatSumProd.loop1                * 2D23A
StatSumProd.L5:
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
* [] -> []: raises "Invalid Σ Data" unless the object is a real array with at most two dimensions and no zero dimension
ChkStatArray:
        CON(5)  (*)+5                            * 2D252  primitive code object
        A=DAT1  A                                * 2D257
        CD0EX                                    * 2D25A
        RSTK=C                                   * 2D25D
        D0=A                                     * 2D25F
        A=DAT0  A                                * 2D262
        LC(5)   DOARRY                           * 2D265
        ?C#A    A                                * 2D26C
        GOYES   ChkStatArray.loop1               * 2D26F
        D0=D0+  10                               * 2D271
        A=DAT0  A                                * 2D274
        LC(5)   DOREAL                           * 2D277
        ?C#A    A                                * 2D27E
        GOYES   ChkStatArray.loop1               * 2D281
        D0=D0+  5                                * 2D283
        A=DAT0  A                                * 2D286
        A=A-1   A                                * 2D289
        A=A-1   A                                * 2D28B
        A=A-1   A                                * 2D28D
        GONC    ChkStatArray.loop1               * 2D28F
        D0=D0+  5                                * 2D292
        A=DAT0  A                                * 2D295
        ?A#0    A                                * 2D298
        GOYES   ChkStatArray.L2                  * 2D29B
ChkStatArray.loop1:
        C=RSTK                                   * 2D29D
        D0=C                                     * 2D29F
        LC(5)   #00601                           * 2D2A2
        GOTO    ErrStatLn0.L1                    * 2D2A9
ChkStatArray.L2:
        D0=D0+  5                                * 2D2AD
        A=DAT0  A                                * 2D2B0
        ?A=0    A                                * 2D2B3
        GOYES   ChkStatArray.loop1               * 2D2B6
        C=RSTK                                   * 2D2B8
        D0=C                                     * 2D2BA
ChkStatArray.L3:
        A=DAT0  A                                * 2D2BD
        D0=D0+  5                                * 2D2C0
        PC=(A)                                   * 2D2C3

* refs (1): 2C2BB
* Raises "Nonexistent ΣDAT"
ErrNoStatDat:
        CON(5)  (*)+5                            * 2D2C7  primitive code object
        LC(5)   #00602                           * 2D2CC
        GOTO    ErrStatLn0.L1                    * 2D2D3

* refs (3): 2C616 2C832 2CA76
* Raises "Insufficient Σ Data"
ErrInsufStat:
        CON(5)  (*)+5                            * 2D2D7  primitive code object
        LC(5)   #00603                           * 2D2DC
        GOTO    ErrStatLn0.L1                    * 2D2E3

* refs (5): 2C788 2C7A1 2C7BA 2C7D3 4CA3C
* Raises "Invalid ΣPAR"
ErrBadStatPar:
        CON(5)  (*)+5                            * 2D2E7  primitive code object
ErrBadStatPar.L1:
        LC(5)   #00604                           * 2D2EC  error number
        GOTO    ErrStatLn0.L1                    * 2D2F3

* refs (1): 2CBFC
* Raises "Invalid Σ Data LN(Neg)"
ErrStatLnNeg:
        CON(5)  (*)+5                            * 2D2F7  primitive code object
        LC(5)   #00605                           * 2D2FC
        GOTO    ErrStatLn0.L1                    * 2D303

* refs (1): 2CBF7
* Raises "Invalid Σ Data LN(0)". Its tail is the common exit for these errors: C.A = number
ErrStatLn0:
        CON(5)  (*)+5                            * 2D307  primitive code object
        LC(5)   #00606                           * 2D30C
ErrStatLn0.L1:
        A=C     A                                * 2D313
        GOVLNG  Errjmp                           * 2D315
        BSS     31                               * 2D31C
        ENDLENGTH                                * 2D33B

        LENGTH                                   * 2D33B  library object without its prolog (its place is the end of the link table before): length, to #32F59
        CON(2)  0                                * 2D340  no title

* Library 00C: Serial I/O, Kermit and printing
LIB00C:
        CON(3)  #00C                             * 2D342  library number
        CON(5)  0                                * 2D345  hash table
        REL(5)  LIB00C.message                   * 2D34A  message table
        CON(5)  0                                * 2D34F  link table
        REL(5)  LIB00C.config                    * 2D354  config
        RPL

* refs (1): 2D342
LIB00C.config:
        :: CLOSEUART ClrServMode ClrIOAnn ClrISF803 OpenIO_324C8 ; * 2D359

* refs (7): 2D82F 2DA04 2DA90 2E6C3 2E8DB 307FB ...
* The calculator's Send-Init parameters as they go in an S or I packet: maximum packet 80, timeout 5 s, no padding, CR ends a packet, # quotes control characters, no 8th-bit quoting, block check type 1. Each number is the value plus 32
KermInitPar:
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
* chr $par -> ... flag: sends an S or I packet with parameters $par, with "Connecting" on the display, and waits for the other side's reply
KermSendInit:
        :: DUPZERO 4ROLL BUILDKPACKET Connecting JstGetTHEMESG KDispStatus2 * 2D4B3
          SWAP                                   * 2D4D6

{local''}:
          { NULLLAM } BIND SEND_PACKET NOTcase false;Lpop * 2D4DB
          1ABNDSWAP KermMergePar DUP NOTcaseFALSE ; * 2D4FE

* refs (1): 2E92B
EXCHINITPK:
        :: KERMOPEN CHR_I CHOOSE_INIT KermSendInit BINT0 'LamPKNOSto case * 2D517
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
SENDEOT~1.L1:
            SEND_PACKET~1 NOTcase Lpop;2false    * 2D613
            DUP CHR_Y EQUALcase                  * 2D622
            :: OVER GetKermPkt# #=case           * 2D631

* refs (1): 2D6DB
* The packet has been acknowledged: next sequence number, leave the local variables, TRUE
KermAckOK:
              :: 2DROP IncrLAMPKNO Lpop;true ;   * 2D645
              KermPrevPkt? case                  * 2D65E

* refs (1): 2D6EF
* No usable reply: tries again from the top of the send loop while retries remain, else "Transfer Failed"
KermResend:
              :: 3DROP LAMMaxR KermRetry? ?GOTO SENDEOT~1.L1 XFERFAIL * 2D668
                Lpop;2false ;                    * 2D68B
              Lpop;true;false ;                  * 2D695
            DUP CHR_N EQUALcase                  * 2D69F
            :: OVER LAMPKNO #1+ # 40 #/ DROP #=case KermAckOK * 2D6AE
              OVER GetKermPkt# #=case KermResend * 2D6E0
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
        :: BINT39 TestSysFlag caseDROP DISPROW2  * 2D730  flag -39: Show I/O messages / No I/O messages
        ;                                        * 2D749

* refs (6): 2D4D1 2D82A 2DA8B 2F027 2F0F9 2F902
KDispStatus2:
        :: BINT39 TestSysFlag caseDROP DISPSTATUS2 * 2D74E  flag -39: Show I/O messages / No I/O messages
        ;                                        * 2D767

* refs (2): 2D799 2D8B1
* #seq chr #want chrwant -> #seq chr flag: TRUE when a received packet has the wanted type and sequence number
KermPktIs?:
        :: 3PICK EQUAL SWAP4PICK #= AND ;        * 2D76C

* refs (5): 2DB7B 2DB8A 2DBA8 2DBB7 2DBC6
DOSERVER~2:
        :: ZEROSWAP KermPktIs? COLA ?GOTO        * 2D78F
        ;                                        * 2D7A8

* refs (4): 2D677 2F6B9 2F9A7 30851
* #max -> flag: counts down LAMRETRY. FALSE when none remain; otherwise shows "Retry #n" and sets LAMKRM, so that the row is rewritten later
KermRetry?:
        :: LAMRETRY #1-DUP ' LAMRETRY STO #0=case DROPFALSE * 2D7AD
          Retry JstGetTHEMESG SWAP LAMRETRY #- #>$ &$ KDispRow2 TrueTrue ' * 2D7D5
          LAMKRM STO ;                           * 2D807

* $/id/lam ->
* refs (6): 21F71 21F7B 21F85 21FA5 B81D3 B8AC6
DORECN:
        :: nm=>st! Connecting JstGetTHEMESG KDispStatus2 KermInitPar BINT0 * 2D816
          { LAMKP LAMPKNO } BIND ERRSET          * 2D839
          :: MAXRETRY NULL$ FALSE                * 2D857
            { LAMLNAME LAMRETRY LAMKMODE LAMKRM } BIND KERMOPEN RecvNextPkt * 2D86B
            NOTcasedrop ERROROUT                 * 2D898

* refs (1): 2E97B
DOPKT~1:
            :: BINT0 CHR_S KermPktIs? NOTcase TRPACKETFAIL * 2D8A2
              2DROP KermRecvFile case AllowPrlcdCl * 2D8C0
              ABND case TRPACKETFAIL             * 2D8D4
              DUP #SyntaxErr #<>case ERROROUT    * 2D8E3
              JstGetTHEMESG Conc:RC(2st) EXITMSGSTO #EXITERR ERROROUT ; * 2D8F7
          ;                                      * 2D915
          ERRTRAP KermErrOut ABND ;              * 2D91A

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
        GOVLNG  ClrISF20B.L2                     * 2D9BC
        RPL

* refs (2): 2D9EB 2DAEA
DOSERVER~4:
        :: NoIgnoreAlm GETKEY NOT?SEMI           * 2D9C3
          DROP FLUSHKEYS DoBadKey COLA DOSERVER~4 * 2D9D7
        ;                                        * 2D9F0

* refs (2): 21FDB AFE1B
DOSERVER:
        :: KERMOPEN CHOOSE_INIT KermInitPar BINT0 TRUE * 2D9F5
          { LAMEXCHP LAMKP LAMPKNO nohalt } BIND ERRSET * 2DA13
          :: SetServMode                         * 2DA3B
DOSERVER.L1:
            ClrDA1IsStat                         * 2DA45

* refs (4): 2DDE7 2E06D 2E090 2EB14
KERMOPEN~1:
            :: BINT39 TestSysFlag COLA ?SKIP     * 2DA4A  flag -39: Show I/O messages / No I/O messages
            ;                                    * 2DA63
            :: CLEARVDISP CLEARMENU ; # C0C JstGetTHEMESG KDispStatus2 * 2DA68  "Awaiting Server Cmd."
            KermInitPar CHOOSE_INIT              * 2DA90
KERMOPEN~1.L1:
            ' LAMEXCHP STO 'LamKPSto BINT0       * 2DA9A

* refs (4): 2D535 2DB71 2F392 2F835
* # ->: stores the packet count LAMPKNO
'LamPKNOSto:
            :: ' LAMPKNO STO ; BEGIN KermRecvPkt NOT_WHILE * 2DAB3
            :: DROP SENDNAK DOSERVER~4 ATTN? case * 2DADB
              :: ATTNFLGCLR 2RDROP ;             * 2DAF9
              ALARM? case                        * 2DB0D
              :: ALARMxcp DROP NOT?SEMI          * 2DB17
                CtlAlarm! DoCAlarmKey ;          * 2DB2B
              TIMEOUT? IT                        * 2DB3A
              :: TurnOff ClrServMode KERMOPEN SetServMode ; * 2DB44
            ;                                    * 2DB62
            REPEAT                               * 2DB67
'LamPKNOSto.L1:
            BINT0 'LamPKNOSto CHR_S DOSERVER~2 DropSysErr$.L5 CHR_I * 2DB6C
            DOSERVER~2 DropSysErr$.L3 ROT DECODE 3UNROLL CHR_R DOSERVER~2 * 2DB8A
            _:chr(10)_.L2 CHR_C DOSERVER~2 OBJ_2DCE8.L1 CHR_G DOSERVER~2 * 2DBAD
            DropSysErr$.L4 DUP CHR_E EQUALcase   * 2DBCB
            :: 2DROP KERMERRM! GOTO _:chr(10)_.L1 ; * 2DBDF
            3DROP                                * 2DBFD
'LamPKNOSto.L2:
            InvalServCmd                         * 2DC02
'LamPKNOSto.L3:
            KermErrMsg DUP KermShowErr %2 dowait SENDERROR GOTO DOSERVER.L1 * 2DC07
'LamPKNOSto.L4:
            DOSERVER~1 ERRSET                    * 2DC2F

StringVarsBytes(st):
            :: DOVARS DUPLENCOMP DUP#0=ITE 2DROP * 2DC39
              :: #1+_ONE_DO DUPINDEX@ NTHCOMDDUP ID>$ APPEND_SPACE OVER * 2DC52
                VARSIZE EDITDECOMP$ APPEND_SPACE 4ROLL XEQRCL $+TypeName * 2DC75
                APPEND_SPACE SWAP #>% EDITDECOMP$ !append$ !append$ APNDCRLF * 2DC93
                ROT !insert$ SWAPLOOP DROP ;     * 2DCB6
            ;                                    * 2DCCF
            ERRTRAP DropSysErr$ GOTO DropSysErr$.L1 * 2DCD4

* refs (1): 2DDA1
OBJ_2DCE8:
            :: ERRN DUP#0=case                   * 2DCE8
              :: KermErrMsg APNDCRLF SENDERROR ERRJMP ; * 2DCF7
              GETTHEMESG REALSTRSTR JstGetTHEMESG APPEND_SPACE !insert$ * 2DD15
              NEWLINE$ !append$ ' LAMERRMSG STO ; * 2DD2E
OBJ_2DCE8.L1:
            TWODROPNULL$ BINT0                   * 2DD4C
            { LAMERRMSG NULLLAM } BIND # C11 JstGetTHEMESG KDispRow2 * 2DD56  "Processing Command"
            KINVISLF &$ FLUSHKEYS xIFERR xSTR> xERRTHEN OBJ_2DCE8 xIFEND * 2DD83
            CK0NOLASTWD 0LASTOWDOB! ERRSET DOSERVER~3 ERRTRAP * 2DDAB

* refs (2): 2DCD9 2E768
DropSysErr$:
            :: DropSysObs ERROR@ KermErrMsg APNDCRLF ; ABND KERMOPEN~1 * 2DDC4
            :: TOADISP REDISPHBUFF ClrDAsOK ;    * 2DDEC
DropSysErr$.L1:
            NULL$SWAP CHR_X DOSERVER~6 ClrServMode KERMOPEN SetServMode * 2DE05
DropSysErr$.L2:
            ?GOTO DOSERVER.L1 ?GOTO 'LamPKNOSto.L1 GOTO 'LamPKNOSto.L3 * 2DE23
DropSysErr$.L3:
            2DROP ACK_INIT NOT?GOTO 'LamPKNOSto.L3 BINT0 SENDACK CHOOSE_INIT * 2DE41
            CODE                                 * 2DE64  32 nibbles
              GOSUBL  KermParPtrs                * 2DE6E
              D0=D0+  2                          * 2DE74
              D1=D1+  2                          * 2DE77
              A=DAT1  B                          * 2DE7A
              DAT0=A  B                          * 2DE7D
              LC(2)   #31                        * 2DE80
              DAT1=C  B                          * 2DE84
              GOVLNG  GETPTRLOOP                 * 2DE87
            ENDCODE                              * 2DE8E
            GOTO KERMOPEN~1.L1                   * 2DE8E
DropSysErr$.L4:
            DROPSWAP CAR$ DUP CHR_F EQUAL OVER CHR_L EQUALOR casedrop * 2DE98
            SENDNULLACK                          * 2DEC5
            CHR_D EQUAL ?GOTO 'LamPKNOSto.L4 DROP GOTO 'LamPKNOSto.L2 * 2DECA
DropSysErr$.L5:
            2DROP NULL$ DUP FALSE                * 2DEED
            { LAMLNAME LAMKMODE LAMKRM } BIND ERRSET KermRecvFile ERRTRAP * 2DF01
            :: DropSysObs ERROR@ KermSendErr FALSE ; ABND ?GOTO DOSERVER.L1 * 2DF2E
            ?GOTO 'LamPKNOSto.L1 DUP KermErrMsg SWAP #SyntaxErr #= IT * 2DF5B

* refs (1): 2D8FC
Conc:RC(2st):
            ::                                   * 2DF83

_:chr(10)_:
              $ ":\0A" !append$ !insert$ ;       * 2DF88
_:chr(10)_.L1:
            KermShowErr GOTO DOSERVER.L1         * 2DFA5
_:chr(10)_.L2:
            2DROP DUP palparse NOTcase           * 2DFB4
            :: 4DROP OBJ_2DFE6 ;                 * 2DFC8
            dup;#nm? case2drop                   * 2DFDC

* refs (1): 2DFD2
OBJ_2DFE6:
            :: OBJ_672DC GOTO 'LamPKNOSto.L3 ;   * 2DFE6
            DRPExitAtLOOP NOTcasedrop            * 2DFFF
            :: DOSERVER~5 GOTO 'LamPKNOSto.L3 ;  * 2E009
            CHR_F DOSERVER~6 GOTO DropSysErr$.L2 ; * 2E022
          ERRTRAP                                * 2E03B
          :: ERROR@ DUP #0=?SEMI FLUSHKEYS ClrServMode GETTHEMESG SENDERROR * 2E040
            AllowPrlcdCl KERMOPEN~1 ClrDAsOK ERRJMP ; * 2E068
          FLUSHKEYS ClrServMode AllowPrlcdCl KERMOPEN~1 ClrDAsOK ABND * 2E081
          DropSysObs ;                           * 2E09F
