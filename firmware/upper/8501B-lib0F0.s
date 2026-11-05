* HP 48GX ROM revision R, #8501B-#86FE3: Library 0F0: WHERE handlers, port object access, argument builders, derivative rules, rule menus and ISOL inverses
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Isol- SymbSUM SymbINTEGRAL SymbIFTE SymbDER SymbAPPLY PortTagParse PortTagArg PortRcl PortPurgeAny PortPurge PortLookupPath
* Follows on from the previous file (at #8501B in the original ROM).
        RPL

* ROMPTR 0F0 07A
* refs (1): 82007
* WHERE around WHERE: combines the two substitutions
nWHEREWHERE~1:
        :: ' xWHERE psh1& OBJ_5A0C2 psh DUP {}N ' OBJ_5A0FE BINT3 ::N * 8501B
          SWAPDROP COLA_EVAL ;                   * 85057

* ROMPTR 0F0 07B
* refs (1): 82007
* Makes one WHERE per substitution out of a list of them
SPLITWHERE~1:
        :: SWAPINCOMP BINT0 rot DUP#0_DO pullpsh1& unrot psh #1-SWAP symcomp * 85066
          psh1& unrot psh LOOP DROP top& #1+DUP #1+ Cr xWHERE ; * 85098

* ROMPTR 0F0 07C
* refs (1): 82007
* WHERE around an integral: substitutes in the limits and the integrand, keeping the integration variable
nWHEREINTG~1:
        :: #2- 3UNROLL BINT2 unrot BINT2 SWAP#1+ OBJ_5A0C2 SWAPDROP#1- psh * 850CF
          #1+DUP dup PTR addt: xWHERE rot pullrev psh1& metaROTDUP over& psh * 85101
          PTR addt: xWHERE psh& SWAPDROP#1- rot #1-SWAP psh1&rev psh * 85133
          OBJ_5A1A3 pshm1 #1+DUP {}N psh1&rev psh PTR addt2: uncrunch * 8515B
          OBJ_5A0FE pshtop& top& Cr xINTEGRAL COLA COMPEVAL * 85183
        ;                                        * 851A6

* ROMPTR 0F0 07D
* refs (1): 82007
* WHERE around a sum: substitutes in the limits and the summand, keeping the index
nWHERESUM~1:
        :: pullrev SWAP#1+ #2- 3UNROLL BINT2 unrot BINT2 SWAP#1+ OBJ_5A0C2 * 851AB
          SWAPDROP#1- psh #1+DUP dup PTR addt: xWHERE rot pullrev psh1& * 851DD
          metaROTDUP over& psh PTR addt: xWHERE psh& SWAPDROP#1- rot #1-SWAP * 8520A
          psh1&rev psh OBJ_5A1A3 pshm1 #1+DUP {}N psh1&rev psh PTR addt2: * 85237
          uncrunch OBJ_5A0FE pshtop& top& #1-SWAP pshm1 top& Cr ä COLA * 85264
          COMPEVAL                               * 85296
        ;                                        * 8529B

* ROMPTR 0F0 07E
* refs (1): 82007
* STO to a tagged name: ob :n:name. Port forms go to sto(bk,nm,s), anything else back to plain STO
sto(_,to)~1:
        :: XLIB sto(_,to)~2 case                 * 852A0
          :: 'R sto(bk,nm,s) ;                   * 852B5
          RDROPCOLA xSTONoCK ;                   * 852C9

* ROMPTR 0F0 07F
* refs (1): 82007
* Checks the object and name for port storage: a library or backup under a name, or under a port number
sto(_,to)~2:
        :: idntlamcase                           * 852D8
          :: SWAP CK&DISPATCH0                   * 852E2
            #8F_64D2E ~SWAPDROP;dup;BkpName(bk);TRUE * 852F1  library
            backup ~SWAPDROP;dup;BkpName(bk);TRUE * 852FB  backup
            BINT0                                * 85305  any
            :: RSWAP RDUP 'R RDROP RSWAP #0=case * 8530A
              :: OVERSWAP DoBkpName(_);true ROTSWAP ; * 8532D
              SWAPTRUE ;                         * 85346
          ;                                      * 85350
          dup;r?:dq/sk                           * 85355
          :: SWAP CK&DISPATCH0                   * 8535A
            #8F_64D2E ~SWAPDROP;dup;BkpName(bk);TRUE * 85369  library
            BINT0 swap;false                     * 85373  any
          ;                                      * 8537D
          swap;false ;                           * 85382

* ROMPTR 0F0 080
* refs (1): 82007
* STO of a library or backup to a port number
sto(bk,r)~1:
        :: COERCEDUP BINT33 #>case SETPORTNOTAV  * 8538C
          OVER                                   * 853A5
          :: DNOTBAKcase LIB>#                   * 853AA
            BAKNAME ;                            * 853B9
          DROP SWAP sto(bk,nm,s) ;               * 853C3

* ROMPTR 0F0 081
* refs (1): 82007
* tagged flag -> ...: splits :n:ob for RCL, EVAL and PURGE. The tag & means any port (-1), a number means that port (0..33). When the tag is neither, the plain command in the runstream runs instead. The flag says a list of names is allowed too
PortTagParse:
        :: SWAP TAG> tok& tok=casedrop           * 853D7
          :: XLIB PortTagArg MINUSONE ;          * 853F0
          palparse ITE                           * 8540A
          :: DUPTYPEREAL? NOTcase DROPSWAPDROP   * 85414
            COERCEDUP BINT33 #>case DROPSWAPDROP * 85428
            ' XLIB PortTagArg SWAP BINT2 ::N RDROPCOLA EVAL ; * 8543C
          :: 3DROP SWAPDROP ;                    * 8546A
          COLA RunNextNoCK                       * 8547E
        ;                                        * 85488

* ROMPTR 0F0 082
* refs (1): 82007
* Checks the object under the tag: a name, a list of names, or a real (library number). Anything else falls back to the plain command
PortTagArg:
        :: SWAP IT                               * 8548D
          :: dup;ListOfNames?:dq/sk              * 8549C
            :: RDROP COLA PortTagArg~1           * 854A6
            ;                                    * 854BA
          ;                                      * 854BF
          idntlamcase PortTagArg~1               * 854C4
          dup;r?:dq/sk                           * 854CE
          :: COERCE COLA PortTagArg~1            * 854D3
          ;                                      * 854E7
          RDROPCOLA RunNextNoCK ;                * 854EC

* ROMPTR 0F0 083
* refs (1): 82007
* ob TRUE -> ob' | FALSE -> error: Nonexistent Object unless found; resolves ROM pointers and takes the contents of a found backup
PortLookupDone:
        :: NOTcase SETNONEXTERR                  * 854FB
          ?ROMPTR> DNOTBAKcase NOP               * 8550A
          BAK>OB ?ROMPTR> ;                      * 85519

* ROMPTR 0F0 084
* refs (1): 82007
* RESTORE from a port: checks that the backup holds a directory, then replaces HOME and warm starts
restore(nm,s)~1:
        :: ?ACCPTR> DUP BAK>OB TYPERRP? NcaseTYPEERR restore(nm,s)~2 * 85528
          restore(nm,s)~3 ERRSET                 * 8554B
          :: NULLID CREATE ; ERRTRAP DOAPWL OBJ_09699 DOAPWL ; * 85555

* ROMPTR 0F0 085
* refs (1): 82007
* Sends the HOME directory over the serial port as a backup (ARCHIVE to :IO:), through Kermit, closing the I/O environment on any error
XEQIOBACKUP~1:
        :: DUPTYPECSTR? ?SKIP ID>$               * 85582
          InitIOEnv KERMOPEN CHR_F CHOOSE_INIT ' ID HOMEDIR ERRSET * 85596
          HomeInBkp(nm) ERRTRAP KermErrJmp 3UNROLL XEQIOBACKUP~3 ERRSET * 855C9
          XEQIOBACKUP~2 ERRTRAP                  * 855E7
          :: OBJ_09699 XEQIOBACKUP~4 InitEnab OBJ_42309 caseERRJMP * 855F1
            KermErrOut                           * 8560F
          ;                                      * 85614
          ABND OBJ_09699 XEQIOBACKUP~4 InitEnab AllowPrlcdCl NOTcase * 85619
          KermFailOut                            * 85637
        ;                                        * 8563C

* ROMPTR 0F0 086
* refs (1): 82007
* FREE: frees each library of the list in a port
free(li,r)~1:
        :: COERCEDUP #1<> case SETPORTNOTAV      * 85641
          DUP PORTSTATUS 2DROP AND ANDNOTcase SETPORTNOTAV * 8565A
          SWAPINCOMP DUP#0=case free(li,r)~2     * 85678
          pshzer BEGIN #1-SWAP                   * 85687
          :: CK&DISPATCH1                        * 85696
            BINT6 NOP                            * 856A0  name
            BINT7 NOP                            * 856AA  local
            BINT1 COERCE                         * 856B4  real
          ;                                      * 856BE
          psh1& #0=UNTIL psh BEGIN free(li,r)~8 over& #0=UNTIL drop;dq * 856C3
          free(li,r)~2 ;                         * 856EB

* ROMPTR 0F0 087
* refs (1): 82007
* LIBS: appends one library to the list as "title" number port
libs~1:
        :: ROMPART NOTcase BINT0                 * 856F5
          BINT0 SWAPDUP TYPELIST? ITE INNERCOMP BINT1 * 85709
          BEGIN #1-SWAP                          * 85727
          :: DUP ~NullAcptr;ROMPART>ADDR NOTcaseDROP DUP * 85731
            OBJ_72B22 MINUSONE #= case2DROP OVER * 8574A
            ROMPARTNAME ITE ID>$ NULL$           * 85763
            ROT UNCOERCE ROT BINT3 psh over& ;   * 85777
          #0=UNTIL DROP ;                        * 8579A

* ROMPTR 0F0 088
* refs (1): 82007
* name port -> ob: finds a name in a port. Port -1 searches them all, a list gives a path
PortLookup:
        :: MINUSONE EQcasedrop XLIB PortLookupAny * 857A9
          OVER TYPELIST? COLAITE XLIB PortLookupPath XLIB PortLookupName ; * 857C3

* ROMPTR 0F0 089
* refs (1): 82007
* name port -> ob: finds a name in port 0, or in a higher port
PortLookupName:
        :: DUP#0= ITE                            * 857ED
          :: DROP RclBkp0(nm)? ; RclBkp12(nm,s)? * 857FC
          XLIB PortLookupDone ;                  * 85815

* ROMPTR 0F0 08A
* refs (1): 82007
* {path} port -> ob: finds a path in a backed-up directory
PortLookupPath:
        :: OVER dvarlsBIND SWAP CARCOMP SWAP XLIB PortLookupName 1GETABND * 85825
          DUPLENCOMP #1= caseDROP rcl(di,li)?    * 85853
          XLIB PortLookupDone ;                  * 85867

* ROMPTR 0F0 08B
* refs (1): 82007
* name -> ob: tries ports 33 down to 0 for the name, then plain RCL (which errors)
PortLookupAny:
        :: BINT34                                * 85877
          { LAM 'portn } BIND BEGIN LAM 'portn #1- DUP ' LAM 'portn STO X@ * 85881
          casedrop                               * 858E7
          :: LAM 'portn ABND RDROPCOLA XLIB PortLookup ; * 858EC
          LAM 'portn #0= UNTIL ABND ' xRCL COLA EvalNoCK * 8591E
        ;                                        * 85954

* ROMPTR 0F0 08C
* refs (1): 82007
* name port -> : EVAL of an object in a port. Port -1 searches them all
PortEval:
        :: MINUSONE EQcasedrop XLIB PortEvalAny  * 85959
          XLIB PortRcl COLA EVAL                 * 85973
        ;                                        * 85988

* ROMPTR 0F0 08D
* refs (1): 82007
* name -> : tries ports 33 down to 0 for the name, then plain EVAL
PortEvalAny:
        :: BINT34                                * 8598D
          { LAM 'portn } BIND BEGIN LAM 'portn #1- DUP ' LAM 'portn STO X@ * 85997
          casedrop                               * 859FD
          :: LAM 'portn ABND RDROPCOLA XLIB PortEval ; * 85A02
          LAM 'portn #0= UNTIL ABND ' xEVAL COLA EvalNoCK * 85A34
        ;                                        * 85A6A

* ROMPTR 0F0 08E
* refs (1): 82007
* name port -> : PURGE of a backup object in a port. Port -1 searches them all
PortPurge:
        :: MINUSONE EQcasedrop XLIB PortPurgeAny * 85A6F
          DUP#0= ITE                             * 85A89
          :: DROP PurgeBkp0(nm) ; PurgeBkp12(nm,s) * 85A93
        ;                                        * 85AAC

* ROMPTR 0F0 08F
* refs (1): 82007
* name -> : tries ports 33 down to 0 for the name, then plain PURGE
PortPurgeAny:
        :: BINT34                                * 85AB1
          { LAM 'portn } BIND BEGIN LAM 'portn #1- DUP ' LAM 'portn STO X@ * 85ABB
          casedrop                               * 85B21
          :: LAM 'portn ABND RDROPCOLA XLIB PortPurge ; * 85B26
          LAM 'portn #0= UNTIL ABND ' xPURGE COLA EvalNoCK * 85B58
        ;                                        * 85B8E

* ROMPTR 0F0 090
* refs (1): 82007
libs~2:
        :: pshzer BEGIN #1-SWAP OBJ_72B22 DUP MINUSONE #= ITE * 85B93
          :: DROP SWAPDROP#1- SWAPDROP#1- ;      * 85BC0
          :: UNCOERCE psh1& pullpsh1& pullpsh1& ; * 85BD9
          #0=UNTIL DROP ;                        * 85BF7

* ROMPTR 0F0 091
* refs (1): 82007
* name port -> ob: RCL from a port. Probably: the code object adjusts a backup in place so that a copy of its contents stays valid
PortRcl:
        :: XLIB PortLookup                       * 85C06
          ::                                     * 85C16
            CODE                                 * 85C1B  14 nibbles
              LC(5)   DOEXT1                     * 85C25
              GOVLNG  NOTROMPcase.L1             * 85C2C
            ENDCODE                              * 85C33
            SKIP OBJ_71BB6 NOP TOTEMPOB DUP BAKNAME DROP * 85C33
            CODE                                 * 85C56  73 nibbles
              C=DAT1  A                          * 85C60
              D1=D1+  5                          * 85C63
              D=D+1   A                          * 85C66
              CD1EX                              * 85C68
              D1=D1+  5                          * 85C6B
              A=0     A                          * 85C6E
              A=DAT1  B                          * 85C70
              ?A=0    A                          * 85C73
              GOYES   PortRcl.L1                 * 85C76
              A=A+1   A                          * 85C78
PortRcl.L1:
              A=A+1   A                          * 85C7A
              A=A+A   A                          * 85C7C
              D1=C                               * 85C7E
              A=A+CON A,10                       * 85C81
              C=DAT1  A                          * 85C87
              CD1EX                              * 85C8A
              RSTK=C                             * 85C8D
              D1=D1+  5                          * 85C8F
              C=DAT1  A                          * 85C92
              C=C+A   A                          * 85C95
              DAT1=C  A                          * 85C97
              C=RSTK                             * 85C9A
              D1=C                               * 85C9C
              A=DAT0  A                          * 85C9F
              D0=D0+  5                          * 85CA2
              PC=(A)                             * 85CA5
            ENDCODE                              * 85CA9
          ;                                      * 85CA9
          ?ACCPTR> TRUE XLIB PortLookupDone ;    * 85CAE

* ROMPTR 0F0 092
* refs (1): 82007
* ob1 ob2 -> 'DER(ob1,ob2)': makes the symbolic form from arguments on the stack
SymbDER:
        :: CK2NOLASTWD BINT2 nmetasyms SWAP symcomp SWAPcompSWAP * 85CC8
          ChkExpr1Name SWAP BINT2 Cr xDER ;      * 85CEB

* ROMPTR 0F0 093
* refs (1): 82007
* ob1..ob4 -> symbolic integral, from four arguments on the stack
SymbINTEGRAL:
        :: CK4NOLASTWD BINT4 nmetasyms symcomp SWAPcompSWAP ChkExpr1Name * 85D09
          BINT2 5ROLL 5ROLL 2SINNERtop& pshtop& Cr xINTEGRAL ; * 85D2C

* ROMPTR 0F0 094
* refs (1): 82007
* ob1..ob4 -> symbolic sum, from four arguments on the stack
SymbSUM:
        :: CK4NOLASTWD BINT4 nmetasyms symcomp 4ROLL symcomp ChkExpr1Name * 85D54
          SWAP 4ROLL 4ROLL 2SINNERtop& get1 SWAP#1+ #1+ Cr ä ; * 85D7C

* ROMPTR 0F0 095
* refs (1): 82007
* test then else -> ob: picks the branch at once when the test is a real, otherwise makes the symbolic IFTE
SymbIFTE:
        :: CK3NOLASTWD BINT3 nmetasyms 3PICK TYPEREAL? ITE * 85DAE
          :: ROT %0<> ?SKIP SWAP                 * 85DD1
            DROP ;                               * 85DEA
          xIFTE                                  * 85DF4
        ;                                        * 85DF9

* ROMPTR 0F0 096
* refs (1): 82007
* ob -> 'QUOTE(ob)'
nCOLCTQUOTE~1:
        :: CK1NOLASTWD BINT1 nmetasyms symcomp BINT1 Cr xQUOTE ; * 85DFE

* ROMPTR 0F0 097
* refs (1): 82007
* APPLY as a function from the stack: dispatches on what is applied, a name, a local or a ROM pointer
SymbAPPLY:
        :: {'dvar} BIND 0LASTOWDOB! CK1NOLASTWD DEPTH 1GETLAM #>?SKIP * 85E2B
          SETSTACKERR SINNER DROP DUP CK&DISPATCH0 * 85E53
          BINT6 ApplySym                         * 85E6C  name
          BINT7 ApplySym                         * 85E76  local
          BINT15                                 * 85E80  romptr
          :: ApplyRompChk CmdField6 DROP COLA_EVAL ; * 85E85
        ;                                        * 85EA3

* ROMPTR 0F0 098
* refs (1): 82007
* The derivative rules of the functions follow, one to each D/Dxxx. Each takes the argument meta and builds the chain-rule result
D/D*~1:
        :: DerArgs                               * 85EA8
          :: psh derargABND top&Cr x* ; psh MetaConcase * 85EB2
          :: derprod1 ~ABND;SYMBN ;              * 85EDA
          dup metaROTDUP rot derprod1 unrot psh derargABND 2top& addt* Cr x+ ; * 85EEE

* ROMPTR 0F0 099
* refs (1): 82007
D/D+~1:
        :: DerArgs                               * 85F2A
          :: NDROP derargABND SYMBN ; MetaDER psh MetaConcase * 85F34
          :: NDROP ~ABND;SYMBN ;                 * 85F5C
          MetaDER ABND top&Cr x+ ;               * 85F70

* ROMPTR 0F0 09A
* refs (1): 82007
D/D-~1:
        :: DerArgs                               * 85F89
          :: NDROP derargABND Cr xNEG ; MetaDER psh MetaConcase * 85F93
          :: NDROP ~ABND;SYMBN ;                 * 85FC0
          MetaDER ABND top&Cr x- ;               * 85FD4

* ROMPTR 0F0 09B
* refs (1): 82007
D/D/~1:
        :: DerArgs                               * 85FED
          :: derquot ABND Cr xNEG ; psh MetaConcase * 85FF7
          :: derprod1 drpmeta/ ~ABND;SYMBN ;     * 8601F
          dup metaROTDUP rot derprod1 drpmeta/ unrot derquot ABND top&Cr x- ; * 86038

* ROMPTR 0F0 09D
* refs (2): 82007 82007
D/D=~1:
        :: BindDv pshzerpsharg MetaDER psh derargABND top&Cr x= ; * 8606F

* ROMPTR 0F0 09E
* refs (1): 82007
D/DABS~1:
        :: 3PICK OVER CARCOMP EQUALcase easyabs  * 8609C
          BindDvDup derargABND dup metaROTDUP unrot PTR addt2: xCONJ x* top& * 860BA
          unrot dup ROTUntop&                    * 860E7
          { xCONJ x* x+ } INNERtop& pshtop& top& * 860F6
          { xABS %2 x* x/ } INNERtop& SYMBN ;    * 8611E

* ROMPTR 0F0 09F
* refs (1): 82007
D/DACOS~1:
        :: BindDvDup psh %1 pshm1                * 8614B
          { %2 x^ x- xSQRT xINV xNEG } INNERtop& top& DerTrigIn ; * 86164

* ROMPTR 0F0 0A0
* refs (1): 82007
D/DACOSH~1:
        :: BindDvDup derargABND psh              * 861A0
          { %1 x- xSQRT } INNERtop& dup ROTDROP ' x+ 3UNROLL PTR addt2: x* * 861B4
          x/ top& top& SYMBN ;                   * 861F5

* ROMPTR 0F0 0A1
* refs (1): 82007
D/DALOG~1:
        :: BindDvDup derargABND %10 ' xLN BINT2 unrot addt* pshtop& top& * 8620E
          PTR addt2: xALOG x* SYMBN ;            * 86245

* ROMPTR 0F0 0A2
* refs (1): 82007
D/DARG~1:
        :: BindDvDup derargABND pshtop& PTR addt: x/ dup top& * 8625E
          { xCONJ x- %2 xi x* x/ } INNERtop& Meta*180/π SYMBN ; * 86286

* ROMPTR 0F0 0A3
* refs (1): 82007
D/DASIN~1:
        :: BindDvDup %1 pshm1                    * 862C2
          { %2 x^ x- xSQRT xINV } INNERtop& top& DerTrigIn ; * 862D6

* ROMPTR 0F0 0A4
* refs (1): 82007
D/DASINH~1:
        :: BindDvDup derargABND psh %1 pshm1 2top& * 8630D
          { %2 x^ x+ xSQRT x/ } INNERtop& SYMBN ; * 86330

* ROMPTR 0F0 0A5
* refs (1): 82007
D/DATAN~1:
        :: BindDvDup %1 pshm1                    * 86362
          { %2 x^ x+ xINV } INNERtop& top& DerTrigIn ; * 86376

* ROMPTR 0F0 0A6
* refs (1): 82007
D/DATANH~1:
        :: BindDvDup derargABND psh %1 pshm1 2top& * 863A8
          { %2 x^ x- x/ } INNERtop& SYMBN ;      * 863CB

* ROMPTR 0F0 0A7
* refs (1): 82007
D/DCOS~1:
        :: BindDvDup PTR addt2: xSIN xNEG DerTrigOut ; * 863F8

* ROMPTR 0F0 0A8
* refs (1): 82007
D/DCOSH~1:
        :: BindDvDup derargABND psh PTR addt: xSINH pshtop& Cr x* ; * 8641B

* ROMPTR 0F0 0A9
* refs (1): 82007
D/DEXP~1:
        :: BindDvDup derargABND pshtop& PTR addt2: xEXP x* SYMBN ; * 8644D

* ROMPTR 0F0 0AA
* refs (1): 82007
D/DINV~1:
        :: BindDvDup derargABND metaneg pshtop& %2 SWAP#1+ PTR addt2: x^ x/ * 8647A
          SYMBN ;                                * 864AC

* ROMPTR 0F0 0AB
* refs (1): 82007
D/DLN~1:
        :: BindDvDup derargABND pshtop& Cr x/ ;  * 864B6

* ROMPTR 0F0 0AC
* refs (1): 82007
D/DLNP1~1:
        :: BindDvDup derargABND pshtop&          * 864D9
          { %1 x+ x/ } INNERtop& SYMBN ;         * 864ED

* ROMPTR 0F0 0AD
* refs (1): 82007
D/DLOG~1:
        :: BindDvDup derargABND pshtop&          * 86515
          { %10 xLN x* x/ } INNERtop& SYMBN ;    * 86529

* ROMPTR 0F0 0AE
* refs (1): 82007
D/DIFTE~1:
        :: BindDv #1-SWAP 1GETSWAP 'xDER BINT3 SYMBN pshm1 #1-SWAP 1ABNDSWAP * 86556
          'xDER BINT3 SYMBN SWAP#1+ psh top&Cr xIFTE ; * 86588

* ROMPTR 0F0 0AF
* refs (1): 82007
D/DSIN~1:
        :: BindDvDup PTR addt: xCOS DerTrigOut ; * 865B0

* ROMPTR 0F0 0B0
* refs (1): 82007
D/DSINH~1:
        :: BindDvDup PTR addt: xCOSH psh derargABND top&Cr x* ; * 865CE

* ROMPTR 0F0 0B1
* refs (1): 82007
D/DSQ~1:
        :: BindDvDup %2 pshm1 top& addt* psh derargABND top&Cr x* ; * 865FB

* ROMPTR 0F0 0B2
* refs (1): 82007
D/DSQRT~1:
        :: BindDvDup derargABND psh %2 pshm1 2top& * 86632
          { xSQRT x* x/ } INNERtop& SYMBN ;      * 86655

* ROMPTR 0F0 0B3
* refs (1): 82007
D/DTAN~1:
        :: BindDvDup %1pshm1 top&                * 8667D
          { xTAN %2 x^ x+ } INNERtop& DerTrigOut ; * 86691

* ROMPTR 0F0 0B4
* refs (1): 82007
D/DTANH~1:
        :: BindDvDup derargABND pshtop&          * 866BE
          { xCOSH %2 x^ x/ } INNERtop& SYMBN ;   * 866D2

* ROMPTR 0F0 0B5
* refs (1): 82007
D/D^~1:
        :: DerArgs                               * 866FF
          :: D/D^Y ~ABND;SYMBN ; psh MetaConcase * 86709
          :: D/D^X ~ABND;SYMBN ;                 * 86727
          dup metaROTDUP rot D/D^X unrot D/D^Y ABND top&Cr x+ ; * 8673B

* ROMPTR 0F0 0B6
* refs (1): 82007
D/D^X~1:
        :: psh dup MetaDER metaROTDUP roll2top& addt* over& pshtop& * 8676D
          { %1 x- x^ x* } INNERtop& ;            * 8679A

* ROMPTR 0F0 0B7
* refs (1): 82007
D/D^Y~1:
        :: dup metaROTDUP MetaDER rot PTR addt: xLN pshtop& addt* over& * 867C2
          pshtop& PTR addt2: x^ x* ;             * 867F4

* ROMPTR 0F0 0B8
* refs (1): 82007
D/DDER~1:
        :: BindDv DROP SYMDERSTEP SINNER derargABND SYMBN ; * 8680D

* ROMPTR 0F0 0B9
* refs (1): 82007
D/DWHERE~1:
        :: dvarlsBIND OBJ_5A0C2 DROP SYMBWHERE CK1NOLASTWD BINT1 nmetasyms * 86835
          symcomp 1ABNDSWAP BINT2 Cr xDER ;      * 8685D

* ROMPTR 0F0 0BA
* refs (1): 82007
D/DINTEGRAL~1:
        :: dvarlsBIND dup #2- 3UNROLL BINT2 psh pshzerpsharg NDROP dup * 8687B
          PTR addt2: BINT3 xWHERE 1GETLAM SWAP#1+ psh& top& PTR addt2: xDER * 868AD
          x* psh dup #2- 3UNROLL BINT2 psh larg NDROP dup PTR addt2: BINT3 * 868DA
          xWHERE 1GETLAM SWAP#1+ psh& top& PTR addt2: xDER x* PTR addt: x- * 86916
          psh& 1GETABND 3PICK 2SINNER DROPSWAPDROP EQUALcasedrop * 86948
          :: NDROP IMPLODE ;                     * 86966
          4UNROLL ' xDER 3UNROLL #2+ PTR addt2: xINTEGRAL x+ top& IMPLODE ; * 8697A

* ROMPTR 0F0 0BB
* refs (1): 82007
D/DSUM~1:
        :: OVER #2+PICK OVER 2SINNER DROPSWAPDROP EQUALcase * 869B1
          :: DROPNDROP %0_2A2B4 ;                * 869D4
          ROT BINT2 Cr xDER SWAP Cr ä ;          * 869E8

* ROMPTR 0F0 0BC
* refs (1): 82007
D/DAPPLY~1:
        :: SWAP get1 4UNROLL SWAPROT #1-UNROT COLA DerFcn * 86A10
        ;                                        * 86A38

* ROMPTR 0F0 0BD
* refs (1): 82007
* Menus of the rules for each kind of subexpression, for the EquationWriter's RULES menu
MANMENU+-~1:
        { {RULES\<-T} {RULES\T->} {RULES\<-M} {RULES\M->} {RULES\AF} * 86A3D
          {RULES\<-->} {RULES\(<-} {RULES\->)} {RULES\<-A} {RULES\A->} * 86A5B
          {RULES\(())} {RULES\-()} }             * 86A74

* ROMPTR 0F0 0BE
* refs (1): 82007
MANMENU*/~1:
        { {RULES\<-T} {RULES\T->} {RULES\<-M} {RULES\M->} {RULES\<-D} * 86A83
          {RULES\D->} {RULES\(<-} {RULES\->)} {RULES\<-A} {RULES\A->} * 86AA1
          {RULES\<-->} {RULES\(())} {RULES\-()} {RULES\1/()} {RULES\L()} } * 86ABA

* ROMPTR 0F0 0BF
* refs (1): 82007
MANMENU^~1:
        { {RULES\1/()} {RULES\E()} {RULES\<-D} {RULES\D->} {RULES\<-A} * 86AD8
          {RULES\A->} }                          * 86AF6

* ROMPTR 0F0 0C0
* refs (1): 82007
MANMENUEXP~1:
        { {RULES\1/()} {RULES\E^} {RULES\->TRG} {RULES\D->} } * 86B00

* ROMPTR 0F0 0C1
* refs (1): 82007
MANMENULN~1:
        { {RULES\-()} {RULES\L*} NullMenuKey {RULES\D->} } * 86B1E

* ROMPTR 0F0 0C2
* refs (1): 82007
MANMENUCSIV~1:
        { {RULES\->()} }                         * 86B3C

* ROMPTR 0F0 0C3
* refs (1): 82007
MANMENUEQ~1:
        { {RULES\<-T} {RULES\T->} }              * 86B4B

* ROMPTR 0F0 0C4
* refs (1): 82007
MANMENUCX~1:
        { {RULES\->()}_59E81 }                   * 86B5F

* ROMPTR 0F0 0C5
* refs (1): 82007
MANMENUTRG~1:
        { {RULES\->DEF} {RULES\TRG*} }           * 86B6E

* ROMPTR 0F0 0C6
* refs (1): 82007
MANMENUATG~1:
        { {RULES\->DEF} }                        * 86B82

* ROMPTR 0F0 0C7
* refs (1): 82007
* ISOL through A+B: the known term is subtracted from the target
Isol+:
        :: pshm1 pshzerpsharg rot DROP ObInMeta ITE addtpsh psh1&rev * 86B91
          rotswap top& meta- IsolContinue ;      * 86BBE

* ROMPTR 0F0 0C9
* refs (2): 82007 82007
* ISOL through A-B and A=B: adds the known term, or subtracts the target from it
Isol-:
        :: pshm1 pshzerpsharg rot DROP ObInMeta ITE * 86BD7
          :: SWAP#1+ roll2top& ' x+ ;            * 86BFA
          :: psh1&rev ROTUntop& ' x- ;           * 86C18
          SWAP#1+ IsolContinue ;                 * 86C36

* ROMPTR 0F0 0CA
* refs (1): 82007
* ISOL through A*B: divides the target by the known factor
Isol*:
        :: pshm1 pshzerpsharg rot DROP ObInMeta ITE * 86C45
          :: SWAP#1+ roll2top& ;                 * 86C68
          :: psh1&rev rot pshtop& ;              * 86C7C
          meta/ IsolContinue ;                   * 86C95

* ROMPTR 0F0 0CB
* refs (1): 82007
* ISOL through A/B: target*B when the unknown is in A, A/target when it is in B
Isol/:
        :: pshm1 pshzerpsharg rot DROP ObInMeta ITE * 86CA4
          :: SWAP#1+ roll2top& ' x* ;            * 86CC7
          :: psh1&rev ROTUntop& ' x/ ;           * 86CE5
          SWAP#1+ IsolContinue ;                 * 86D03

* ROMPTR 0F0 0CC
* refs (1): 82007
* ISOL through A^B when the unknown is in B: LN(target)/LN(A), with the 2*pi*i*n term unless principal mode (flag -1) is set. Goes to Isol^Base when the unknown is in A
Isol^:
        :: pshm1 pshzerpsharg rot DROP ObInMeta case Isol^~1 * 86D12
          psh1&rev rot PTR addt: xLN PRSOL? ?SKIP * 86D3A
          :: Isol2πIn ~top&;meta+ ;              * 86D58
          pshtop& PTR addt2: xLN x/ IsolContinue ; * 86D6C

* ROMPTR 0F0 0CD
* refs (1): 82007
* ISOL through A^B when the unknown is in A: exponent 1, 2 (square root with sign term) or any other root
Isol^Base:
        :: addtpsh OVER num1=case                * 86D8A
          :: DROPNDROP #1-SWAP COLA IsolStep     * 86D9E
          ;                                      * 86DB7
          num2=case                              * 86DBC
          :: DROPNDROP psh PTR addt: xSQRT PRSOL? IT IsolContinue * 86DC1
            Isol*s IsolContinue ;                * 86DE9
          DROP rot psh dup roll2top& PTR addt2: xINV x^ PRSOL? case * 86DF8
          :: SWAPUnNDROP IsolContinue ;          * 86E2A
          Isol2πIn ROTUntop& PTR addt2: x/ xEXP pshtop& meta* IsolContinue ; * 86E3E

* ROMPTR 0F0 0CE
* refs (1): 82007
* ISOL through EXP: LN of the target plus the general-solution term
IsolEXP:
        :: IsolInvN xLN Isol2πIn top& meta+ IsolContinue ; * 86E6B

* ROMPTR 0F0 0CF
* refs (1): 82007
* ISOL through SIN: ASIN of the target with the general-solution terms
IsolSIN:
        :: IsolInvN xASIN Isolπn Isol(-1)^n IsolContinue ; * 86E93

* ROMPTR 0F0 0D0
* refs (1): 82007
* ISOL through COS: ACOS of the target with the general-solution terms
IsolCOS:
        :: IsolInvN xACOS Isol*s Isol2πn ~top&;meta+ IsolContinue ; * 86EB6

* ROMPTR 0F0 0D1
* refs (1): 82007
* ISOL through TAN: ATAN of the target with the general-solution term
IsolTAN:
        :: IsolInvN xATAN Isolπn ~top&;meta+ IsolContinue ; * 86EDE

* ROMPTR 0F0 0D2
* refs (1): 82007
* ISOL through SINH: ASINH of the target with the general-solution terms
IsolSINH:
        :: IsolInvN xASINH IsolπIn Isol(-1)^n IsolContinue ; * 86F01

* ROMPTR 0F0 0D3
* refs (1): 82007
* ISOL through COSH: ACOSH of the target with the general-solution terms
IsolCOSH:
        :: IsolInvN xACOSH Isol*s Isol2πIn ~top&;meta+ IsolContinue ; * 86F24

* ROMPTR 0F0 0D4
* refs (1): 82007
* ISOL through TANH: ATANH of the target with the general-solution term
IsolTANH:
        :: IsolInvN xATANH IsolπIn ~top&;meta+ IsolContinue ; * 86F4C

* ROMPTR 0F0 0D5
* refs (1): 82007
* ISOL through ALOG: LOG of the target plus the general-solution term
IsolALOG:
        :: IsolInvN xLOG Isol2πIn top&           * 86F6F
          { %10 xLN x/ x+ } INNERtop& IsolContinue ; * 86F88

* ROMPTR 0F0 0D6
* refs (1): 82007
* ISOL through EXPM: LNP1 of the target plus the general-solution term
IsolEXPM:
        :: IsolInvN xLNP1 Isol2πIn top& meta+ IsolContinue ; * 86FB5
        ENDLENGTH                                * 86FDD

        LENGTH                                   * 86FDD  library object without its prolog (its place is the end of the link table before): length, to #8998E
        CON(2)  0                                * 86FE2  no title
