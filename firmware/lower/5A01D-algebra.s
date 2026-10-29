* HP 48GX ROM revision R, #5A01D-#5D01C: Symbolic algebra
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: meta+ meta* metaneg evalcase: addt* metainv meta/ addtNEG uncrunch meta- dvars? drpmeta/
* Follows on from the previous file (at #5A01D in the original ROM).
        RPL

* ob ob' -> ob'' ob'
* refs (10): 591EE 59605 5A126 5A301 5A379 5A446 ...
SWAPcompSWAP:
        :: SWAP symcomp SWAP ;                   * 5A01D

* ->
* refs (14): 1F5FB 49D17 4BC9C 4DAE9 57315 57D95 ...
uncrunch:
        :: 'R NOTNUM? CLRNUM ERRSET ITE          * 5A036
          :: EVAL ERRTRAP cf(-3);error CLRNUM ;  * 5A054
          :: EVAL ERRTRAP sf(-3);error SETNUM ;  * 5A072
        ;                                        * 5A090

* refs (2): 84EA9 84ECC
nWHEREFCNAPP~2:
        :: DROP' xFCNAPPLY pshm1 pullpsh1& pullpsh1& COLA OBJ_548D2 * 5A095
        ;                                        * 5A0BD

* refs (4): 8502F 850F2 851D8 8683F
OBJ_5A0C2:
        :: OVER pshm1 #1-SWAP ZERO_DO larg CKSYMBN symcomp psh1& LOOP DROP ; * 5A0C2

* refs (3): 85048 85183 85269
OBJ_5A0FE:
        :: CK2NOLASTWD OVER BINT1 nmetasyms TYPESYMB? case OBJ_5A14E * 5A0FE
          SWAPcompSWAP COLA                      * 5A126

* refs (1): 5A199
OBJ_5A130:
          :: INCOMPDROP COLA XEQSYMWHERE         * 5A130
          ;                                      * 5A144
        ;                                        * 5A149

* refs (1): 5A121
OBJ_5A14E:
        :: OVER INNERCOMP #1-SWAP pshm1 #1+NDROP REQcasedrop xWHERE * 5A14E
          :: INNERCOMP #1+DUP Cr xWHERE ; drop;dq OBJ_5A130 ; * 5A176

* refs (2): 8515B 85241
OBJ_5A1A3:
        :: #1-SWAP dvarlsBIND dup BEGIN #1-SWAP EXPLODE 1GETLAM CARCOMP * 5A1A3
          OBJ_57676 case IDCONFERR               * 5A1D0
          DROPNDROP #0=UNTIL DROP 1GETABND ;     * 5A1DF

* refs (1): 1F03F
OBJ_5A1F8:
        { OBJ_5A2F7 =1(s)? OBJ_5A4E6 }           * 5A1F8

* refs (1): 1F271
OBJ_5A211:
        { OBJ_5A333 =4(s)? ~DROP';INTEG }        * 5A211

* refs (1): 1F344
OBJ_5A22A:
        { OBJ_5A365 =1(s)? }                     * 5A22A

* refs (1): 1F42F
OBJ_5A23E:
        { OBJ_5A397 OBJ_5A4B9 OBJ_5A518 }        * 5A23E

* refs (1): 1A49A
OBJ_5A257:
        { OBJ_5A3EC drop;false }                 * 5A257

* refs (1): 1F538
OBJ_5A26B:
        { ~larg;symbn;SWAP#1+ drop;false }       * 5A26B

* refs (1): 1F5F1
OBJ_5A27F:
        { OBJ_5A432 drop;=1(s)? OBJ_5A53B }      * 5A27F

* refs (1): 1FB2C
OBJ_5A298:
        { ~larg;symbn;SWAP#1+_2 drop;false }     * 5A298

* refs (1): 1B238
OBJ_5A2AC:
        { NOP DROPFALSE                          * 5A2AC
          :: DROP ROTSWAP ' rpnXROOT ; }         * 5A2BB
        BSS     25                               * 5A2DE

* refs (1): 5A1FD
OBJ_5A2F7:
        :: pshzerpsharg SWAPcompSWAP psh         * 5A2F7
          ::                                     * 5A30B

* refs (8): 5A34C 5A388 5A3D8 5A3FB 5A40A 5A423 ...
symbn:
            :: CKSYMBN symcomp ; SWAP#1+ ;       * 5A310
        ;                                        * 5A32E

* refs (2): 5A216 C0D1E
OBJ_5A333:
        :: #1-SWAP symcomp OVER#2+UNROL larg symbn SWAP#1+ get1 SWAP#1+ ; * 5A333

* refs (1): 5A22F
OBJ_5A365:
        :: pshzerpsharg pshzerpsharg parg& SWAPcompSWAP pshtop& psh symbn * 5A365
          SWAP#1+ ;                              * 5A38D

* refs (1): 5A243
OBJ_5A397:
        :: OVER pshm1 #1-SWAP #1- ZERO_DO parg& #1-SWAP symcomp psh1& BINT2 * 5A397
          +LOOP larg symbn psh1& pshtop& ;       * 5A3CE

* refs (1): 5A25C
OBJ_5A3EC:
        :: pshzerpsharg larg symbn SWAP#1+ psh symbn SWAP#1+ ; * 5A3EC

* refs (1): 5A270
~larg;symbn;SWAP#1+:
        :: larg symbn SWAP#1+ ;                  * 5A419

* refs (1): 5A284
OBJ_5A432:
        :: PTR addt: xAPPLY pargop SWAPcompSWAP pshtop& SWAPDROP#1- ; * 5A432

* refs (1): 5A29D
~larg;symbn;SWAP#1+_2:
        :: larg symbn SWAP#1+ ;                  * 5A45A

* refs (1): 5A21B
=4(s)?:
        :: BINT4 #= ;                            * 5A473

* refs (2): 5A202 5A234
=1(s)?:
        :: #1= ;                                 * 5A487

* refs (3): 5A261 5A275 5A2A2
drop;false:
        :: DROPFALSE ;                           * 5A496

* refs (1): 5A289
drop;=1(s)?:
        :: DROP #1= ;                            * 5A4A5

* refs (1): 5A248
OBJ_5A4B9:
        :: DROPONE #=casedrpfls #2-              * 5A4B9
          BINT2 #/ DROP #0= ;                    * 5A4CD

* refs (1): 5A207
OBJ_5A4E6:
        :: DROP ROTSWAP ' DERIV ;                * 5A4E6

* refs (1): 5A220
~DROP';INTEG:
        :: DROP' INTEG ;                         * 5A504

* refs (1): 5A24D
OBJ_5A518:
        :: DROP#1- {}N BINT2 ' WHERE ;           * 5A518

* refs (1): 5A28E
OBJ_5A53B:
        :: DROP#1- {}N BINT2 ' APPLY ;           * 5A53B

* refs (1): 5A748
OBJ_5A55E:
        CON(5)  (*)+5                            * 5A55E  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 5A563
        C=DAT1  A                                * 5A56A
        CD1EX                                    * 5A56D
        D1=D1+  5                                * 5A570
        A=DAT1  W                                * 5A573
        B=0     A                                * 5A577
        ?A=0    M                                * 5A579
        GOYES   L_5A5B6                          * 5A57C
        C=0     A                                * 5A57E
        C=A     X                                * 5A580
        A=0     X                                * 5A583
        P=      13                               * 5A586
        SETDEC                                   * 5A588
L_5A58A:
        ?A=0    WP                               * 5A58A
        GOYES   L_5A597                          * 5A58D
        P=P-1                                    * 5A58F
        B=B+1   X                                * 5A591
        GONC    L_5A58A                          * 5A594
L_5A597:
        ?C=0    X                                * 5A597
        GOYES   L_5A5B6                          * 5A59A
        A=C     X                                * 5A59C
        A=A+A   X                                * 5A59F
        GONC    L_5A5AB                          * 5A5A2
        P=      3                                * 5A5A5
        LC(2)   #99                              * 5A5A7
L_5A5AB:
        B=B-C   A                                * 5A5AB
        P=      4                                * 5A5AD
        ?B=0    P                                * 5A5AF
        GOYES   L_5A5B6                          * 5A5B2
        B=0     A                                * 5A5B4
L_5A5B6:
        P=      0                                * 5A5B6
        SETHEX                                   * 5A5B8
        A=B     A                                * 5A5BA
        R0=A.F  A                                * 5A5BC
        GOVLNG  PUSH#LOOP                        * 5A5C2
        RPL

* refs (1): 5A7DD
OBJ_5A5C9:
        :: BINT1 #=casedrop %1                   * 5A5C9
          %1 SWAP ONE_DO UNROTDUP 3UNROLL %* ROT %+ SWAPLOOP ; * 5A5DD

* refs (1): 1FA0C
{'piflag}:
        {                                        * 5A60F

* refs (1): 5A69E
Π'piflag:
          LAM 'piflag }                          * 5A614

* refs (3): 5AA04 5AA31 5AA40
OBJ_5A62E:
        :: BINT1 M-1stcasechs                    * 5A62E
          :: OBJ_5A651 addtNEG ;                 * 5A63D

* refs (1): 5A642
OBJ_5A651:
          :: DROP 2DUP                           * 5A651

{'d,'r}:
            {                                    * 5A660

Π'd:
              LAM 'd                             * 5A665

Π'r:
              LAM 'r }                           * 5A670
            BIND OBJ_5A72A DUP#1= case ABND      * 5A680
            ' Π'piflag DRPExitAtLOOP NOTcase ABND * 5A699
            NOTcase ABND                         * 5A6B2
            2GETLAM 1GETABND %PI %/ OBJ_5A72A DUP#1= case OBJ_5A70C * 5A6BC
            7PICK 4PICK %> case OBJ_5A70C        * 5A6E4
            NDROP ;                              * 5A6FD
        ;                                        * 5A707

* refs (2): 5A6DF 5A6F8
OBJ_5A70C:
        :: SWAPUnNDROP PTR addt2: xPI x* ;       * 5A70C

* refs (2): 5A685 5A6D0
OBJ_5A72A:
        :: %0=case                               * 5A72A

drop(2);<1>:
          :: SWAPDROP BINT1 ;                    * 5A734
          OBJ_5A55E OVER %EXPONENT BINT0         * 5A748
          {                                      * 5A75C

Π'D:
            LAM 'd                               * 5A761

Π'R:
            LAM 'R                               * 5A76C

* refs (1): 23448
Π'est:
            LAM 'est                             * 5A777

Π'X:
            LAM 'X                               * 5A786

Π'T:
            LAM 'T }                             * 5A791
          BIND BINT0 4GETLAM BEGIN DUP %IP SWAP %FP ROT #1+SWAP 1PUTLAM dup * 5A7A1
          OBJ_5A5C9                              * 5A7DD
          :: 1GETLAM j%0=case FALSE              * 5A7E2
            3GETLAM OBJ_5A8A5 FALSE 2DUP %/ 4GETLAM %- DUP%0= casedrpfls * 5A7F6
            %EXPONENT                            * 5A823
            2GETLAM SWAP %- 5GETLAM OBJ_5A8E8 ;  * 5A828
          WHILE                                  * 5A846
          :: 2DROP 1GETLAM %1/ ; REPEAT ABND BINT2 SWAPUnNDROP DROPDUP %1 %= * 5A84B
          casedrop BINT1                         * 5A887
          ' x/ BINT3 ;                           * 5A891

* refs (1): 5A7FB
OBJ_5A8A5:
        CON(5)  (*)+5                            * 5A8A5  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 5A8AA
        R0=A.F  A                                * 5A8B1
        C=DAT1  A                                * 5A8B7
        CD1EX                                    * 5A8BA
        D1=D1+  5                                * 5A8BD
        A=0     A                                * 5A8C0
        A=DAT1  X                                * 5A8C2
        D1=C                                     * 5A8C6
        C=R0.F  A                                * 5A8C9
        A=A-C   A                                * 5A8CF
        LC(5)   COLA                             * 5A8D1
        GONC    L_5A8E2                          * 5A8D8
        LC(5)   SKIP                             * 5A8DB
L_5A8E2:
        A=C     A                                * 5A8E2
        PC=(A)                                   * 5A8E4

* refs (1): 5A83C
OBJ_5A8E8:
        CON(5)  (*)+5                            * 5A8E8  primitive code object
        GOSBVL  POP#                             * 5A8ED
        R0=A.F  B                                * 5A8F4
        A=DAT1  A                                * 5A8FA
        D1=D1+  5                                * 5A8FD
        D=D+1   A                                * 5A900
        AD1EX                                    * 5A902
        D1=D1+  5                                * 5A905
        C=DAT1  W                                * 5A908
        D1=A                                     * 5A90C
        ?C#0    S                                * 5A90F
        GOYES   L_5A944                          * 5A912
        CAEX    X                                * 5A914
        LC(3)   #001                             * 5A917
        ?C<A    X                                * 5A91C
        GOYES   L_5A94B                          * 5A91F
        P=C     13                               * 5A921
        CPEX    0                                * 5A925
        P=C     14                               * 5A929
        CPEX    1                                * 5A92D
        ?A#0    X                                * 5A931
        GOYES   L_5A939                          * 5A934
        CSR     B                                * 5A936
L_5A939:
        A=R0.F  B                                * 5A939
        ?C>A    B                                * 5A93F
        GOYES   L_5A94B                          * 5A942
L_5A944:
        GOVLNG  PushTLoop                        * 5A944
L_5A94B:
        GOVLNG  PushFLoop                        * 5A94B

* refs (1): 56822
OBJ_5A952:
        CON(5)  (*)+5                            * 5A952  primitive code object
        GOSUB   SUB_5A999                        * 5A957
        C=A     B                                * 5A95B
        A=0     W                                * 5A95E
        A=C     B                                * 5A961
        SETDEC                                   * 5A964
        A=-A    X                                * 5A966
        SETHEX                                   * 5A969
        P=      14                               * 5A96B
        A=A+1   P                                * 5A96D
        P=      0                                * 5A970
        GOSBVL  PUSH%                            * 5A972
        A=DAT0  A                                * 5A979
        D0=D0+  5                                * 5A97C
        PC=(A)                                   * 5A97F

* refs (2): 5A9FA 5AA1D
RclAccuracy:
        CON(5)  (*)+5                            * 5A983  primitive code object
        GOSUB   SUB_5A999                        * 5A988
        R0=A.F  A                                * 5A98C
        GOVLNG  PUSH#LOOP                        * 5A992

* refs (2): 5A957 5A988
SUB_5A999:
        GOSBVL  SAVPTR                           * 5A999
        A=0     A                                * 5A9A0
        LC(2)   #11                              * 5A9A2
        D1=(5)  #8084F                           * 5A9A6
        A=DAT1  1                                * 5A9AD
        ?ABIT=1 0                                * 5A9B1
        GOYES   L_5A9C5                          * 5A9B6
        ?ABIT=1 1                                * 5A9B8
        GOYES   L_5A9C5                          * 5A9BD
        A=C     B                                * 5A9BF
        GONC    L_5A9F1                          * 5A9C2
L_5A9C5:
        D1=(5)  #8084E                           * 5A9C5
        A=DAT1  1                                * 5A9CC
        LC(1)   #A                               * 5A9D0
        C=A-C   P                                * 5A9D3
        GOC     L_5A9F1                          * 5A9D6
        A=C     P                                * 5A9D9
        P=      1                                * 5A9DC
        A=A+1   P                                * 5A9DE
        P=      0                                * 5A9E1
        LC(1)   #2                               * 5A9E3
        ?C>A    P                                * 5A9E6
        GOYES   L_5A9F1                          * 5A9E9
        A=0     P                                * 5A9EB
        A=A+1   P                                * 5A9EE
L_5A9F1:
        P=      0                                * 5A9F1
        RTN                                      * 5A9F3
        RPL

* refs (3): 1FA25 5AA86 72F98
OBJ_5A9F5:
        :: RclAccuracy SWAP OBJ_5A62E CKSYMBN ;  * 5A9F5

* refs (2): 1FA2F 5AA90
OBJ_5AA13:
        :: C%>% RclAccuracy DUPROT BINT2 3UNROLL OBJ_5A62E psh DROPSWAP * 5AA13
          OBJ_5A62E pshtop& PTR addt: ~CK2&Dispatch IMPLODE ; * 5AA40

* refs (1): 1FA39
OBJ_5AA5E:
        :: ZEROSWAP EXPLODE BEGIN #1-SWAP        * 5AA5E
          :: CK&DISPATCH0                        * 5AA77
            BINT1 OBJ_5A9F5                      * 5AA81  real
            BINT2 OBJ_5AA13                      * 5AA8B  complex
            BINT0 OBJ_72FCA                      * 5AA95  any
          ;                                      * 5AA9F
          SINNER unrot over& #0=UNTIL DROP IMPLODE ; * 5AAA4

* symf symf symf QN -> symf
* refs (2): 1F2B6 5B8D9
SYMINTEG:
        :: 2SWAP TWO{}N SWAP CARCOMP             * 5AAC7

{'bnds,'dvar}:
          {                                      * 5AAE0

* refs (2): 5AB4B 5AC0E
Π'bnds:
            LAM 'bnds lam'dvar }                 * 5AAE5
          BIND ZEROZERO BINT0 4ROLL EXPLODE >dvars intg psh DUP#0= ?SKIP * 5AB00
          :: dvars> lam'dvar SWAP#1+ dup Π'bnds INNERtop& #1-SWAP EXPLODE * 5AB32
            psh& #1-SWAP EXPLODE top&            * 5AB5F

{<3>,WHERE()}:
            { BINT3 xWHERE } INNERCOMP psh&      * 5AB73

{<3>,WHERE()}_5AB91:
            { BINT3 xWHERE } INNERtop& top& meta- ; * 5AB91
          psh DUP#0= ?SKIP                       * 5ABB9

* refs (2): 5ABE6 5ABF0
OBJ_5ABC8:
          :: AEQ1stcase x=                       * 5ABC8
            :: SWAPDROP#1- larg OBJ_5ABC8 psh OBJ_5ABC8 top& PTR addt: x= ; * 5ABD7
            dvars> Π'bnds INNERCOMP SINNERMETA pshtop& lam'dvar ' xINTEGRAL * 5AC09
            ROT #2+ ;                            * 5AC31
          DUP#0= OVER #3+PICK #0= OR ?SKIP meta+ * 5AC40
          top& ABND pshzer colunfac IMPLODE ;    * 5AC63

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 5AC81  entry 0

* meta -> meta'
* refs (3): 5AB37 5AC09 5B898
dvars>:
        :: pshzer BEGIN #1-SWAP                  * 5AC86
          :: REQcasedrop lam'dvar                * 5AC9A
            1GETLAM ;                            * 5ACA9
          psh1& #0=UNTIL DROP ;                  * 5ACB3

* #0 #0 meta -> meta_ok meta_fail
* refs (1): 5AB1E
intg:
        :: BEGIN forceadd                        * 5ACC7

* meta&+ -> meta
M1st+?Drp:
          :: M1st+case SWAPDROP#1-               * 5ACD6
          ;                                      * 5ACE5
          larg forcemul?aga intg1 #0=UNTIL DROP ; * 5ACEA

* meta -> meta flag
* refs (12): 5AECF 5AFB0 5B136 5B2A8 5B38E 5B447 ...
dvars?:
        :: DUP#2+ BEGIN #1- BINT1 #=casedrop RDROPFALSE * 5AD08
          DUP#1+PICK ' lam'dvar EQ UNTIL TRUE ;  * 5AD2B

* refs (2): 83856 83897
~REQcase;lam'dvar;SKIP:
        :: REQcase lam'dvar                      * 5AD4E
          SKIP ;                                 * 5AD5D

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 5AD67  entry 0

* meta #level -> meta' flag
* refs (5): 5AEDE 5B398 5B451 5B569 C0D91
linear!:
        :: linear SWAPDROP ;                     * 5AD6C

* meta #level -> meta' T meta #level -> meta' #loc F
* refs (3): 5AFBF 5AFE7 5B06E
linear?:
        :: linear DUP IT SWAPDROP                * 5AD80
        ;                                        * 5AD99

* meta #level -> meta #loc flag
* refs (2): 5AD71 5AD85
linear:
        :: TRUE dvarlsBIND BEGIN DUP #2= NOT 1GETLAM AND WHILE * 5AD9E
          :: linear~1 ; REPEAT 1GETABND ;        * 5ADD0

* refs (1): 5ADD5
linear~1:
        :: BINT1 splitdown OVER #2+PICK REQcasedrop xNEG * 5ADEE
          DROP REQcasedrop x+                    * 5AE11
          linear~3 REQcasedrop x-                * 5AE20
          linear~3 REQcasedrop x*                * 5AE2F
          OBJ_5AF01 REQcasedrop x/               * 5AE3E
          linear~4 REQcasedrop x^                * 5AE4D
          linear~5 REQcasedrop ä                 * 5AE5C
          linear~2 2DROP false;1Lput ;           * 5AE6B

* refs (1): 5AE6B
linear~2:
        :: BINT4 #= ?SEMI                        * 5AE7F
          FALSE 1PUTLAM ;                        * 5AE93

* refs (2): 5AE20 5AE2F
linear~3:
        :: #2= ?SEMI                             * 5AEA2

* refs (1): 5AF10
OBJ_5AEB1:
          :: SWAP#1+ OVER #1+ tailpsh larg dvars? ; ITE linear! TRUE * 5AEB1
          1PUTLAM top& pshtop& #1-SWAP ;         * 5AEE8

* refs (2): 5AE3E 5AF65
OBJ_5AF01:
        :: #2= ?SEMI                             * 5AF01
          OBJ_5AEB1 NOT DUP ?SKIP SWAPDROP       * 5AF10
          1PUTLAM top& pshtop& #1-SWAP ;         * 5AF29

* refs (1): 5AE4D
linear~4:
        :: BINT2 #=casedrop                      * 5AF42

* refs (3): 5AE75 5AF7E 5AFA1
false;1Lput:
          :: FALSE 1PUTLAM ;                     * 5AF51
          OBJ_5AF01 ;                            * 5AF65

* refs (1): 5AE5C
linear~5:
        :: BINT2 #=casedrop false;1Lput          * 5AF6F
          #1+PICK num0=case DROP                 * 5AF83
          num1=case DROP                         * 5AF92
          DROP false;1Lput ;                     * 5AF9C

* M_ok M_fail M_temp meta -> M_ok' M_fail' M_temp
* refs (1): 5ACF4
intg1:
        :: dvars? NOTcase intgconst              * 5AFAB
          linear? case intglinear                * 5AFBF
          DUPDUP DUP OBJ_56FD1 BIND BEGIN linear? NOT_WHILE * 5AFCE
          :: DUP 1PUTLAM ; REPEAT 1GETLAM 2GETLAM OVER#- #2+ 2PUTLAM #1- * 5AFF1
          tailpsh larg 2GETLAM BEGIN DUP 2PUTLAM intg1~1 ITE * 5B028
          :: OBJ_5B1F4 intg1ok ;                 * 5B050
          :: 2GETLAM linear? NOTcaseFALSE top&   * 5B064
            pshtop& intg1fail ;                  * 5B07D
          UNTIL ABND ;                           * 5B08C

* M1 M2 M3 M4 -> M1 M2' M4 T
* refs (1): 5B082
intg1fail:
        :: rotswap DUP #2+PICK #0=?SKIP meta+ top& psh TRUE ; * 5B09B

* M_ok M_fail M_temp meta -> M_ok' M_fail' M_temp
* refs (1): 5AFBA
intgconst:
        ::                                       * 5B0CD

* refs (2): 5B2B7 5B2E4
OBJ_5B0D2:
          :: PTR addt: lam'dvar meta* ; intg1ok DROP ; * 5B0D2

* M1 M2 M3 M4 -> M1' M2 M3 T
* refs (3): 5B05A 5B0EB 5B186
intg1ok:
        :: 4roll psh DUP #2+PICK #0=?SKIP meta+ top& unrot TRUE ; * 5B0FA

* M1 M2 M3 M4 -> M1' M2 M3
* refs (1): 5AFC9
intglinear:
        :: dvars? DROP                           * 5B131

* meta #loc -> meta'
* refs (1): 5B2B2
intgaddlin:
          :: #1- tailpsh #1-SWAP                 * 5B140

{2,^,2,/}:
            { %2 x^ %2 x/ } INNERCOMP #1+ OBJ_5B1F4 ; * 5B154
          intg1ok DROP ;                         * 5B186

* refs (1): 5B046
intg1~1:
        :: DUP#1+PICK                            * 5B195
          :: REQcase xFCNAPPLY                   * 5B19F
            :: OVER #4+PICK NOTROMPcase DROP     * 5B1AE
              SWAPDROP ;                         * 5B1C7
          ;                                      * 5B1D1
          intg1~2 NOTcase 2DROPFALSE             * 5B1D6
          EVAL ;                                 * 5B1E5

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 5B1EF  entry 0

* refs (2): 5B055 5B17C
OBJ_5B1F4:
        :: rot BEGIN DUP#0<>WHILE                * 5B1F4
          :: DUP #2+ BINT1 splitdown OVER #2+PICK BINT1 M1st+case OBJ_5B28A * 5B208
            M1st-case OBJ_5B28A                  * 5B23A
            3DROP #1- tailpsh psh& over& psh larg rot ; * 5B244
          REPEAT DROP get1 DROP ;                * 5B271

* refs (2): 5B235 5B23F
OBJ_5B28A:
        :: 2DROP #2= case OBJ_5B2D0              * 5B28A
          tailpsh dvars? ITE intgaddlin OBJ_5B0D2 * 5B2A3
          psh& pullrev psh1&rev ;                * 5B2BC

* refs (1): 5B29E
OBJ_5B2D0:
        :: DROP rot larg OBJ_5B0D2 4roll top& rot pullrev psh1&rev ; * 5B2D0
        NIBHEX  E8E60                            * 5B307  ←n

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 5B30C  entry 0

        CON(5)  DOCOL                            * 5B311  address (the code jumps or points through it)

        CON(5)  'R                               * 5B316  address (the code jumps or points through it)

        CON(5)  ?ROMPTR@                         * 5B31B  address (the code jumps or points through it)

        CON(5)  EXPLODE                          * 5B320  address (the code jumps or points through it)

        CON(5)  OBJ_600A3                        * 5B325  address (the code jumps or points through it)

        CON(5)  SEMI                             * 5B32A  address (the code jumps or points through it)

* refs (11): 5B90B 5BB72 82921 829C1 82A61 82F96 ...
OBJ_5B32F:
        :: #2= ?SEMI                             * 5B32F
          FALSE RDROP ;                          * 5B33E

* refs (20): 5B9C4 5BA87 5BBD6 8264B 82727 82912 ...
* Probably: meta {varls {pattern ...}...} -> meta' TRUE | FALSE: try an integration pattern table
OBJ_5B34D:
        ::                                       * 5B34D
          :: OBJ_60BCB FALSE RDROP ; TRUE ;      * 5B352

* refs (26): 5BBA4 82B3D 82BA1 82C0A 82C78 82CF0 ...
* Probably: integration tables: rule body for an argument linear in the variable
OBJ_5B375:
        :: 'R BINT1 OBJ_600A3                    * 5B375

* refs (3): 5B3ED 5B5B4 5B6FE
OBJ_5B389:
          :: dvars? ITE linear! FALSE            * 5B389
          ;                                      * 5B3A2
          pshm1 #1+NDROP 'R SWAP NOTcsdrpfls ?ROMPTR@ SINNER OBJ_5B4FB ; * 5B3A7

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 5B3D4  entry 0

* refs (9): 824F6 8255F 825C8 8268C 826F0 82772 ...
OBJ_5B3D9:
        :: 'R BINT1 OBJ_600A3 OBJ_5B389 pshm1 #1+NDROP 'R SWAP NOTcsdrpfls * 5B3D9
          ?ROMPTR@ SINNER RAD? ?SKIP OBJ_5B4A6   * 5B40B
          OBJ_5B4FB ;                            * 5B424

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 5B42E  entry 0

* refs (3): 82953 829F3 82A93
OBJ_5B433:
        :: 'R BINT1 OBJ_600A3 dvars? DROP linear! pshm1 #1+NDROP 'R SWAP * 5B433
          NOTcsdrpfls ?ROMPTR@ SINNER RAD? ?SKIP * 5B46A
          :: OBJ_5B4A6 6ROLL SWAP ;              * 5B483
          OBJ_5B4FB ;                            * 5B49C

* refs (2): 5B41F 5B488
OBJ_5B4A6:
        :: DEG? ITE                              * 5B4A6

{180,PI,/,*}_5B4B5:
          { %180 xPI x/ x* }                     * 5B4B5

{200,PI,/,*}_5B4D3:
          { %200 xPI x/ x* }                     * 5B4D3
          INNERtop& ;                            * 5B4F1

* refs (3): 5B3CA 5B424 5B49C
OBJ_5B4FB:
        ::                                       * 5B4FB
          { lam'dvar Π&1 xDER x/ } INNERtop& CKSYMBN ' Π'rhs STOLAM TRUE ; * 5B500

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 5B541  entry 0

* refs (1): 5BA96
OBJ_5B546:
        :: 'R BINT1 OBJ_600A3 dvars? NOTcase OBJ_5B596 * 5B546
          linear! case OBJ_5B5F0                 * 5B569
          NDROP FALSE RSKIP RSKIP RSKIP ;        * 5B578

* refs (1): 5B564
OBJ_5B596:
        :: NDROP 'R BINT1 RSKIP OBJ_600A3 OBJ_5B389 pshm1 NDROP DROP DUP * 5B596
          NOTcase SKIP                           * 5B5CD
          'R ' Π'rhs STOLAM ;                    * 5B5D7

* refs (1): 5B573
OBJ_5B5F0:
        :: NDROP 'R BINT1 OBJ_600A3 dvars? casedrop * 5B5F0
          :: NDROP RSKIP RSKIP FALSE ;           * 5B613
          NDROP 'R ' Π'rhs STOLAM TRUE RSKIP ;   * 5B631

* meta -> meta'
* refs (1): 5ACEF
forcemul?aga:
        ::                                       * 5B659
          :: Meta<-D!                            * 5B65E
            :: M1st*case MetaD->                 * 5B668
            ;                                    * 5B677
            forcemul RDROP ;                     * 5B67C
          top& COLA AGAIN                        * 5B68B
        ;                                        * 5B69A

* refs (1): 5B910
OBJ_5B69F:
        ::                                       * 5B69F
          :: M1stFNCcase BINT5                   * 5B6A4
            OVER infarg? casedrop BINT4          * 5B6B3
            DROP BINT3 ;                         * 5B6C7
          PICK DUPTYPEREAL? SWAP TYPECMP? OR ;   * 5B6D6

* refs (1): 5B933
OBJ_5B6F4:
        :: pargop OBJ_5B389 psh1&rev pshtop& #1-SWAP ; * 5B6F4

* meta -> meta'
* refs (1): 5B67C
forcemul:
        :: pshzer BEGIN                          * 5B717
          :: M1st/case ~SWAPDROP#1-;metainv;addt* * 5B726
            M1stINVcase forcemul~1               * 5B735
          ;                                      * 5B73F
          pullpsh1& #0=UNTIL DROP ;              * 5B744

* refs (2): 5B730 5B79E
~SWAPDROP#1-;metainv;addt*:
        :: SWAPDROP#1- metainv addt* ;           * 5B758

* refs (2): 5B73A 5B7AD
forcemul~1:
        :: 3PICK REQcasedrop xNEG                * 5B771
          ROTSWAP REQcasedrop x/                 * 5B785
          :: SWAPDROP#1- ~SWAPDROP#1-;metainv;addt* addtINV COLA forcemul~1 * 5B794
          ;                                      * 5B7B2
          'x* EQ NOT?SEMI                        * 5B7B7
          larg dvars? NOTcase top&               * 5B7C6
          DROP SWAPDROP#1- SWAPDROP#1- larg dvars? NOTcase forcemul~2 * 5B7DA
          DROP psh dvars? NOTcase forcemul~2     * 5B7FD
          DROP pshtop& PTR addt2: x* xINV top& ; * 5B816

* refs (2): 5B7F8 5B811
forcemul~2:
        :: metainv addt* over& unrot over& metainv ; * 5B839

* meta1 meta2 meta3 -> meta2&meta3&meta1
top&pshtop&:
        :: top& pshtop& ;                        * 5B861

* refs (1): 1F267
OBJ_5B875:
        :: #1- tailpsh larg SWAPDROP#1- lam'dvar dvarlsBIND dvars> #1-SWAP * 5B875
          symcomp pshm1 larg SYMBN psh1& larg CKSYMBN psh1& CKSYMBN SWAPDROP * 5B8A2
          4UNROLL SYMINTEG ZEROSWAP EXPLODE >dvars ABND top& pshtop& FALSE ; * 5B8D4

* refs (1): 1B0E1
OBJ_5B906:
        :: OBJ_5B32F OBJ_5B69F ' OBJ_5BA41 SWAP NOTcase EVAL * 5B906
          DROP OBJ_5B6F4 NOTcaseFALSE            * 5B92E
          { IntgPatVars                          * 5B93D
            {                                    * 5B947

'&1^-1':
              SYMBOL Π&1 %-1 x^ ; OBJ_5B9CE }    * 5B94C
            {                                    * 5B96F

'&1^(-1,0)':
              SYMBOL Π&1 C%-1 x^ ; OBJ_5B9CE }   * 5B974
            {                                    * 5B997

'&1^&2':
              SYMBOL Π&1 Π&2 x^ ; OBJ_5B9F6 }    * 5B99C
          }                                      * 5B9BF
          OBJ_5B34D ;                            * 5B9C4

* refs (2): 5B965 5B98D
OBJ_5B9CE:
        SYMBOL Π&1 xLN lam'dvar Π&1 xDER x/ ;    * 5B9CE

* refs (1): 5B9B5
OBJ_5B9F6:
        SYMBOL Π&1 Π&2 %1 x+ x^ Π&2 %1 x+ lam'dvar Π&1 xDER x* x/ ; * 5B9F6

* refs (1): 5B91A
OBJ_5BA41:
        ::                                       * 5BA41
          { IntgPatVars                          * 5BA46
            {                                    * 5BA50

'&1^&2'_5BA55:
              SYMBOL Π&1 Π&2 x^ ; NULL{} OBJ_5BA91 NULL{} } * 5BA55
          }                                      * 5BA82
          OBJ_5B34D ;                            * 5BA87

* refs (1): 5BA73
OBJ_5BA91:
        :: OBJ_5B546 Π&1 Π&2 OBJ_5BAB4 OBJ_5BB31 ; * 5BA91

* refs (1): 5BAA5
OBJ_5BAB4:
        SYMBOL Π&2 %-1 x== Π&1 xLN lam'dvar Π&1 xDER x/ Π&1 Π&2 %1 x+ x^ Π&2 * 5BAB4
          %1 x+ lam'dvar Π&1 xDER x* x/ xIFTE ;  * 5BB04

* refs (1): 5BAAA
OBJ_5BB31:
        SYMBOL Π&1 Π&2 x^ Π&1 xLN lam'dvar Π&2 xDER x* x/ ; * 5BB31

* refs (1): 1B941
OBJ_5BB6D:
        :: OBJ_5B32F                             * 5BB6D
          { IntgPatVars                          * 5BB77
            {                                    * 5BB81

'EXP(&1)':
              SYMBOL Π&1 xEXP ; NULL{}           * 5BB86
              :: OBJ_5B375 Π&1                   * 5BB9F

'EXP(&1)'_5BBAE:
                SYMBOL Π&1 xEXP ; ;              * 5BBAE
              NULL{} }                           * 5BBC7
          }                                      * 5BBD1
          OBJ_5B34D ;                            * 5BBD6
        NIBHEX  E8E60                            * 5BBE0  ←n

* meta&NEG -> meta meta -> meta&NEG
* refs (19): 55350 5620A 56246 56372 563BD 565B6 ...
metaneg:
        :: M-1stcasechs NOP                      * 5BBE5
          PTR addt: xNEG ;                       * 5BBF4

* meta -> meta'
* refs (4): 5CC35 5CC4E 83D4D 83E0B
metaneglft:
        :: pargop metaneg COLA pshtop&           * 5BC03
        ;                                        * 5BC1C

* meta -> meta'
* refs (4): 5CC99 5CCB2 83D66 83DF7
metainvlft:
        :: pargop metainv COLA pshtop&           * 5BC21
        ;                                        * 5BC3A

* meta&INV -> meta meta -> meta&INV
* refs (16): 564C1 57C26 5B762 5B83E 5B857 5BC2B ...
metainv:
        :: M1stINVcase SWAPDROP#1-               * 5BC3F
          PTR addt: xINV ;                       * 5BC4E

* meta&NEG -> meta&-
* refs (28): 476BF 5616A 5784C 5787E 57CD5 5AC5E ...
meta+:
        :: M-1stcasechs                          * 5BC5D

* meta -> meta&-
addt-:
          :: PTR addt: x- ;                      * 5BC67
          PTR addt: x+ ;                         * 5BC7B

* meta&NEG -> meta&+
* refs (13): 561B0 5ABAF 5BD66 5DD0F 839D2 839FA ...
meta-:
        :: M-1stcasechs                          * 5BC8A

* meta -> meta&+
addt+:
          :: PTR addt: x+ ;                      * 5BC94
          PTR addt: x- ;                         * 5BCA8

* meta&INV -> meta&/
* refs (28): 561F1 56205 5770C 5774D 5786A 57C30 ...
meta*:
        :: M1stINVcase                           * 5BCB7

* meta&ob -> meta&/
repl/:
          :: PTR repl: x/ ;                      * 5BCC1
          PTR addt: x* ;                         * 5BCD5

* meta&INV -> meta&*
* refs (15): 5622D 56241 56403 58AA2 58AD4 5BD98 ...
meta/:
        :: M1stINVcase                           * 5BCE4

* meta&ob -> meta&*
repl*:
          :: PTR repl: x* ;                      * 5BCEE
          PTR addt: x/ ;                         * 5BD02

* refs (4): 5DA93 5DB74 5DBBA 844A4
[X]=>[NEG(X)]!:
        :: addtNEG Meta->() ;                    * 5BD11

* refs (4): 5DAF2 5DC28 5DC6E 8453F
[X]=>[INV(X)]!:
        :: PTR addt: xINV Meta->() ;             * 5BD25

* meta&NEG&ob -> meta&- meta&ob -> meta&+
* refs (7): 5CC44 83BC2 83C3F 83D20 83FDB 84021 ...
drpmeta+:
        :: SWAPDROP#1- COLA meta+                * 5BD3E
        ;                                        * 5BD52

* meta&NEG&ob -> meta&+ meta&ob -> meta&-
* refs (8): 59234 5CC2B 83BA9 83C26 83D39 83FFE ...
drpmeta-:
        :: SWAPDROP#1- COLA meta-                * 5BD57
        ;                                        * 5BD6B

* meta&INV&ob -> meta&/ meta&ob -> meta&*
* refs (10): 5CCA8 83BF4 83C71 83C99 83CBC 83CEE ...
drpmeta*:
        :: SWAPDROP#1- COLA meta*                * 5BD70
        ;                                        * 5BD84

* meta&INV&ob -> meta&* meta&ob -> meta&/
* refs (11): 5CC8F 83BDB 83C58 83CD5 83D07 8400D ...
drpmeta/:
        :: SWAPDROP#1- COLA meta/                * 5BD89
        ;                                        * 5BD9D

L_5BDA2:
        CON(5)  x+                               * 5BDA2  address (the code jumps or points through it)

        CON(5)  x-                               * 5BDA7  address (the code jumps or points through it)

        CON(5)  x*                               * 5BDAC  address (the code jumps or points through it)

        CON(5)  x/                               * 5BDB1  address (the code jumps or points through it)

        CON(5)  x=                               * 5BDB6  address (the code jumps or points through it)

L_5BDBB:
        CON(5)  xSIN                             * 5BDBB  address (the code jumps or points through it)

        CON(5)  xCOS                             * 5BDC0  address (the code jumps or points through it)

        CON(5)  xTAN                             * 5BDC5  address (the code jumps or points through it)

        CON(5)  xSINH                            * 5BDCA  address (the code jumps or points through it)

        CON(5)  xCOSH                            * 5BDCF  address (the code jumps or points through it)

        CON(5)  xTANH                            * 5BDD4  address (the code jumps or points through it)

        CON(5)  xASIN                            * 5BDD9  address (the code jumps or points through it)

        CON(5)  xACOS                            * 5BDDE  address (the code jumps or points through it)

        CON(5)  xATAN                            * 5BDE3  address (the code jumps or points through it)

        CON(5)  xASINH                           * 5BDE8  address (the code jumps or points through it)

        CON(5)  xACOSH                           * 5BDED  address (the code jumps or points through it)

        CON(5)  xATANH                           * 5BDF2  address (the code jumps or points through it)

L_5BDF7:
        CON(5)  xCONJ                            * 5BDF7  address (the code jumps or points through it)

        CON(5)  xRE                              * 5BDFC  address (the code jumps or points through it)

        CON(5)  xIM                              * 5BE01  address (the code jumps or points through it)

        CON(5)  x+                               * 5BE06  address (the code jumps or points through it)

        CON(5)  x-                               * 5BE0B  address (the code jumps or points through it)

        CON(5)  x*                               * 5BE10  address (the code jumps or points through it)

        CON(5)  x/                               * 5BE15  address (the code jumps or points through it)

        CON(5)  xNEG                             * 5BE1A  address (the code jumps or points through it)

        CON(5)  xINV                             * 5BE1F  address (the code jumps or points through it)

        CON(5)  xEXP                             * 5BE24  address (the code jumps or points through it)

        CON(5)  xSQ                              * 5BE29  address (the code jumps or points through it)

L_5BE2E:
        CON(5)  x+                               * 5BE2E  address (the code jumps or points through it)

        CON(5)  x-                               * 5BE33  address (the code jumps or points through it)

        CON(5)  xSIN                             * 5BE38  address (the code jumps or points through it)

        CON(5)  xCOS                             * 5BE3D  address (the code jumps or points through it)

        CON(5)  xTAN                             * 5BE42  address (the code jumps or points through it)

        CON(5)  xSINH                            * 5BE47  address (the code jumps or points through it)

        CON(5)  xCOSH                            * 5BE4C  address (the code jumps or points through it)

        CON(5)  xTANH                            * 5BE51  address (the code jumps or points through it)

* refs (1): 58BA8
MetaMulInv:
        CON(5)  (*)+5                            * 5BE56  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5BE5B  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  37070                            * 5BE62  pattern: op2 op6 arg op6
        CON(5)  colinv1                          * 5BE67  run if it matches
        NIBHEX  37000                            * 5BE6C  pattern: op2 op6
        CON(5)  colinv2                          * 5BE71  run if it matches
        NIBHEX  30700                            * 5BE76  pattern: op2 arg op6
        CON(5)  colinv3                          * 5BE7B  run if it matches
        NIBHEX  F                                * 5BE80  end of the rules

* commute terms
* refs (1): 5996D
Meta<-->:
        CON(5)  (*)+5                            * 5BE81  primitive code object
        GOSBVL  RuleMatch                        * 5BE86  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5BE8D  pattern: op0
        RPL
        ROMPTR 0F0 01F                           * 5BE92  run if it matches
        NIBHEX  20000                            * 5BE9D  pattern: op1
        ROMPTR 0F0 020                           * 5BEA2  run if it matches
        NIBHEX  30000                            * 5BEAD  pattern: op2
        ROMPTR 0F0 021                           * 5BEB2  run if it matches
        NIBHEX  40000                            * 5BEBD  pattern: op3
        ROMPTR 0F0 022                           * 5BEC2  run if it matches
        NIBHEX  F                                * 5BECD  end of the rules

* associate left term
* refs (3): 5999E 5CE1F 5CE33
Meta<-A:
        CON(5)  (*)+5                            * 5BECE  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5BED3  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  11000                            * 5BEDA  pattern: op0 op0
        CON(5)  OBJ_5C9FB                        * 5BEDF  run if it matches
        NIBHEX  12000                            * 5BEE4  pattern: op0 op1
        CON(5)  OBJ_5C9FB                        * 5BEE9  run if it matches
        NIBHEX  21000                            * 5BEEE  pattern: op1 op0
        RPL
        ROMPTR 0F0 023                           * 5BEF3  run if it matches
        NIBHEX  22000                            * 5BEFE  pattern: op1 op1
        ROMPTR 0F0 024                           * 5BF03  run if it matches
        NIBHEX  33000                            * 5BF0E  pattern: op2 op2
        CON(5)  OBJ_5C9FB                        * 5BF13  run if it matches
        NIBHEX  34000                            * 5BF18  pattern: op2 op3
        CON(5)  OBJ_5C9FB                        * 5BF1D  run if it matches
        NIBHEX  43000                            * 5BF22  pattern: op3 op2
        ROMPTR 0F0 025                           * 5BF27  run if it matches
        NIBHEX  44000                            * 5BF32  pattern: op3 op3
        ROMPTR 0F0 026                           * 5BF37  run if it matches
        NIBHEX  53000                            * 5BF42  pattern: op4 op2
        ROMPTR 0F0 027                           * 5BF47  run if it matches
        NIBHEX  F                                * 5BF52  end of the rules

* associate right term
* refs (3): 599ED 5CE56 5CE6A
MetaA->:
        CON(5)  (*)+5                            * 5BF53  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5BF58  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10100                            * 5BF5F  pattern: op0 arg op0
        CON(5)  OBJ_5CA32                        * 5BF64  run if it matches
        NIBHEX  20100                            * 5BF69  pattern: op1 arg op0
        CON(5)  OBJ_5CA32                        * 5BF6E  run if it matches
        NIBHEX  10200                            * 5BF73  pattern: op0 arg op1
        RPL
        ROMPTR 0F0 028                           * 5BF78  run if it matches
        NIBHEX  20200                            * 5BF83  pattern: op1 arg op1
        ROMPTR 0F0 029                           * 5BF88  run if it matches
        NIBHEX  30300                            * 5BF93  pattern: op2 arg op2
        CON(5)  OBJ_5CA32                        * 5BF98  run if it matches
        NIBHEX  40300                            * 5BF9D  pattern: op3 arg op2
        CON(5)  OBJ_5CA32                        * 5BFA2  run if it matches
        NIBHEX  30400                            * 5BFA7  pattern: op2 arg op3
        ROMPTR 0F0 02A                           * 5BFAC  run if it matches
        NIBHEX  40400                            * 5BFB7  pattern: op3 arg op3
        ROMPTR 0F0 02B                           * 5BFBC  run if it matches
        NIBHEX  50500                            * 5BFC7  pattern: op4 arg op4
        ROMPTR 0F0 02C                           * 5BFCC  run if it matches
        NIBHEX  F                                * 5BFD7  end of the rules

* delete right term
* refs (5): 57AD4 59E24 5B672 5CEFB 5CF0A
MetaD->:
        CON(5)  (*)+5                            * 5BFD8  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5BFDD  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  31000                            * 5BFE4  pattern: op2 op0
        CON(5)  OBJ_5CA50                        * 5BFE9  run if it matches
        NIBHEX  32000                            * 5BFEE  pattern: op2 op1
        CON(5)  OBJ_5CA50                        * 5BFF3  run if it matches
        NIBHEX  41000                            * 5BFF8  pattern: op3 op0
        RPL
        ROMPTR 0F0 02D                           * 5BFFD  run if it matches
        NIBHEX  42000                            * 5C008  pattern: op3 op1
        ROMPTR 0F0 02E                           * 5C00D  run if it matches
        NIBHEX  51000                            * 5C018  pattern: op4 op0
        ROMPTR 0F0 02F                           * 5C01D  run if it matches
        NIBHEX  52000                            * 5C028  pattern: op4 op1
        ROMPTR 0F0 030                           * 5C02D  run if it matches
        NIBHEX  81000                            * 5C038  pattern: op7 op0
        ROMPTR 0F0 031                           * 5C03D  run if it matches
        NIBHEX  91000                            * 5C048  pattern: op8 op0
        ROMPTR 0F0 031                           * 5C04D  run if it matches
        NIBHEX  82000                            * 5C058  pattern: op7 op1
        ROMPTR 0F0 032                           * 5C05D  run if it matches
        NIBHEX  92000                            * 5C068  pattern: op8 op1
        ROMPTR 0F0 032                           * 5C06D  run if it matches
        NIBHEX  A3000                            * 5C078  pattern: op9 op2
        ROMPTR 0F0 033                           * 5C07D  run if it matches
        NIBHEX  B3000                            * 5C088  pattern: op10 op2
        ROMPTR 0F0 033                           * 5C08D  run if it matches
        NIBHEX  A4000                            * 5C098  pattern: op9 op3
        ROMPTR 0F0 034                           * 5C09D  run if it matches
        NIBHEX  B4000                            * 5C0A8  pattern: op10 op3
        ROMPTR 0F0 034                           * 5C0AD  run if it matches
        NIBHEX  F                                * 5C0B8  end of the rules

* delete left term
* refs (4): 57AD9 59DD5 5CDED 5CDFC
Meta<-D:
        CON(5)  (*)+5                            * 5C0B9  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C0BE  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  30100                            * 5C0C5  pattern: op2 arg op0
        CON(5)  OBJ_5CAA5                        * 5C0CA  run if it matches
        NIBHEX  30200                            * 5C0CF  pattern: op2 arg op1
        CON(5)  OBJ_5CAA5                        * 5C0D4  run if it matches
        NIBHEX  40100                            * 5C0D9  pattern: op3 arg op0
        CON(5)  OBJ_5CAA5                        * 5C0DE  run if it matches
        NIBHEX  40200                            * 5C0E3  pattern: op3 arg op1
        CON(5)  OBJ_5CAA5                        * 5C0E8  run if it matches
        NIBHEX  50300                            * 5C0ED  pattern: op4 arg op2
        CON(5)  OBJ_5CAA5                        * 5C0F2  run if it matches
        NIBHEX  50400                            * 5C0F7  pattern: op4 arg op3
        CON(5)  OBJ_5CAA5                        * 5C0FC  run if it matches
        NIBHEX  F                                * 5C101  end of the rules

* delete left term
* refs (1): 5B663
Meta<-D!:
        CON(5)  (*)+5                            * 5C102  primitive code object
        GOSBVL  RuleMatch                        * 5C107  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  30100                            * 5C10E  pattern: op2 arg op0
        CON(5)  OBJ_5CAA5                        * 5C113  run if it matches
        NIBHEX  30200                            * 5C118  pattern: op2 arg op1
        CON(5)  OBJ_5CAA5                        * 5C11D  run if it matches
        NIBHEX  40100                            * 5C122  pattern: op3 arg op0
        CON(5)  OBJ_5CAA5                        * 5C127  run if it matches
        NIBHEX  40200                            * 5C12C  pattern: op3 arg op1
        CON(5)  OBJ_5CAA5                        * 5C131  run if it matches
        NIBHEX  F                                * 5C136  end of the rules

* remove prefix
* refs (6): 57AED 59D86 5BD1B 5BD34 5CF9B 5CFAA
Meta->():
        CON(5)  (*)+5                            * 5C137  primitive code object
        GOSBVL  RuleMatch                        * 5C13C  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  61000                            * 5C143  pattern: op5 op0
        CON(5)  ~SWAPDROP#1-;COLA;[f(X,Y)]=>[-X-Y]! * 5C148  run if it matches
        NIBHEX  62000                            * 5C14D  pattern: op5 op1
        CON(5)  ~SWAPDROP#1-;COLA;[f(X,Y)]=>[-X+Y]! * 5C152  run if it matches
        NIBHEX  63000                            * 5C157  pattern: op5 op2
        RPL
        ROMPTR 0F0 035                           * 5C15C  run if it matches
        NIBHEX  64000                            * 5C167  pattern: op5 op3
        ROMPTR 0F0 036                           * 5C16C  run if it matches
        NIBHEX  6A000                            * 5C177  pattern: op5 op9
        ROMPTR 0F0 037                           * 5C17C  run if it matches
        NIBHEX  6B000                            * 5C187  pattern: op5 op10
        ROMPTR 0F0 037                           * 5C18C  run if it matches
        NIBHEX  66000                            * 5C197  pattern: op5 op5
        CON(5)  2pull2DROP                       * 5C19C  run if it matches
        NIBHEX  67000                            * 5C1A1  pattern: op5 op6
        CON(5)  ROTSWAP                          * 5C1A6  run if it matches
        NIBHEX  75000                            * 5C1AB  pattern: op6 op4
        ROMPTR 0F0 038                           * 5C1B0  run if it matches
        NIBHEX  78000                            * 5C1BB  pattern: op6 op7
        ROMPTR 0F0 039                           * 5C1C0  run if it matches
        NIBHEX  79000                            * 5C1CB  pattern: op6 op8
        ROMPTR 0F0 039                           * 5C1D0  run if it matches
        NIBHEX  73000                            * 5C1DB  pattern: op6 op2
        CON(5)  ~SWAPDROP#1-;COLA;[f(X,Y)]=>[INV(X)/Y]! * 5C1E0  run if it matches
        NIBHEX  74000                            * 5C1E5  pattern: op6 op3
        CON(5)  ~SWAPDROP#1-;COLA;[f(X,Y)]=>[INV(X)*Y]! * 5C1EA  run if it matches
        NIBHEX  77000                            * 5C1EF  pattern: op6 op6
        CON(5)  2pull2DROP                       * 5C1F4  run if it matches
        NIBHEX  76000                            * 5C1F9  pattern: op6 op5
        CON(5)  ROTSWAP                          * 5C1FE  run if it matches
        NIBHEX  F                                * 5C203  end of the rules

* double invert & remove prefix
* refs (1): 59C9F
Meta1/():
        CON(5)  (*)+5                            * 5C204  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C209  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  30000                            * 5C210  pattern: op2
        RPL
        ROMPTR 0F0 03A                           * 5C215  run if it matches
        NIBHEX  40000                            * 5C220  pattern: op3
        ROMPTR 0F0 03B                           * 5C225  run if it matches
        NIBHEX  50000                            * 5C230  pattern: op4
        ROMPTR 0F0 03C                           * 5C235  run if it matches
        NIBHEX  80000                            * 5C240  pattern: op7
        ROMPTR 0F0 03D                           * 5C245  run if it matches
        NIBHEX  90000                            * 5C250  pattern: op8
        ROMPTR 0F0 03D                           * 5C255  run if it matches
        NIBHEX  F                                * 5C260  end of the rules

* double negate & remove prefix
* refs (1): 59C6F
Meta-():
        CON(5)  (*)+5                            * 5C261  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C266  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  A0000                            * 5C26D  pattern: op9
        RPL
        ROMPTR 0F0 03E                           * 5C272  run if it matches
        NIBHEX  B0000                            * 5C27D  pattern: op10
        ROMPTR 0F0 03E                           * 5C282  run if it matches
        NIBHEX  10000                            * 5C28D  pattern: op0
        ROMPTR 0F0 041                           * 5C292  run if it matches
        NIBHEX  20000                            * 5C29D  pattern: op1
        ROMPTR 0F0 042                           * 5C2A2  run if it matches
        NIBHEX  30000                            * 5C2AD  pattern: op2
        ROMPTR 0F0 03F                           * 5C2B2  run if it matches
        NIBHEX  40000                            * 5C2BD  pattern: op3
        ROMPTR 0F0 040                           * 5C2C2  run if it matches
        NIBHEX  F                                * 5C2CD  end of the rules

* EXP(a*b) -> EXP(a)^b
* refs (2): 57ADE 59D53
MetaE^:
        CON(5)  (*)+5                            * 5C2CE  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C2D3  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  83000                            * 5C2DA  pattern: op7 op2
        RPL
        ROMPTR 0F0 043                           * 5C2DF  run if it matches
        NIBHEX  93000                            * 5C2EA  pattern: op8 op2
        ROMPTR 0F0 043                           * 5C2EF  run if it matches
        NIBHEX  84000                            * 5C2FA  pattern: op7 op3
        ROMPTR 0F0 044                           * 5C2FF  run if it matches
        NIBHEX  94000                            * 5C30A  pattern: op8 op3
        ROMPTR 0F0 044                           * 5C30F  run if it matches
        NIBHEX  F                                * 5C31A  end of the rules

* EXP(a)^b -> EXP(a*b)
* refs (1): 59CCD
MetaE():
        CON(5)  (*)+5                            * 5C31B  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C320  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  50800                            * 5C327  pattern: op4 arg op7
        RPL
        ROMPTR 0F0 045                           * 5C32C  run if it matches
        NIBHEX  50900                            * 5C337  pattern: op4 arg op8
        ROMPTR 0F0 045                           * 5C33C  run if it matches
        NIBHEX  F                                * 5C347  end of the rules

* LN(a^b) -> b*LN(a)
* refs (2): 57AE3 59D27
MetaL*:
        CON(5)  (*)+5                            * 5C348  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C34D  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  A5000                            * 5C354  pattern: op9 op4
        RPL
        ROMPTR 0F0 046                           * 5C359  run if it matches
        NIBHEX  B5000                            * 5C364  pattern: op10 op4
        ROMPTR 0F0 046                           * 5C369  run if it matches
        NIBHEX  F                                * 5C374  end of the rules

* b*LN(a) -> LN(a^b)
* refs (1): 59CFB
MetaL():
        CON(5)  (*)+5                            * 5C375  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C37A  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  30A00                            * 5C381  pattern: op2 arg op9
        RPL
        ROMPTR 0F0 047                           * 5C386  run if it matches
        NIBHEX  30B00                            * 5C391  pattern: op2 arg op10
        ROMPTR 0F0 047                           * 5C396  run if it matches
        NIBHEX  40A00                            * 5C3A1  pattern: op3 arg op9
        ROMPTR 0F0 048                           * 5C3A6  run if it matches
        NIBHEX  40B00                            * 5C3B1  pattern: op3 arg op10
        ROMPTR 0F0 048                           * 5C3B6  run if it matches
        NIBHEX  F                                * 5C3C1  end of the rules

* merge common factor on left
* refs (2): 59BD4 5CFFF
Meta<-M:
        CON(5)  (*)+5                            * 5C3C2  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C3C7  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  35005                            * 5C3CE  pattern: op2 op4 arg arg op4
        RPL
        ROMPTR 0F0 04E                           * 5C3D3  run if it matches
        NIBHEX  45005                            * 5C3DE  pattern: op3 op4 arg arg op4
        ROMPTR 0F0 04F                           * 5C3E3  run if it matches
        NIBHEX  38080                            * 5C3EE  pattern: op2 op7 arg op7
        ROMPTR 0F0 050                           * 5C3F3  run if it matches
        NIBHEX  39090                            * 5C3FE  pattern: op2 op8 arg op8
        ROMPTR 0F0 050                           * 5C403  run if it matches
        NIBHEX  48080                            * 5C40E  pattern: op3 op7 arg op7
        ROMPTR 0F0 051                           * 5C413  run if it matches
        NIBHEX  49090                            * 5C41E  pattern: op3 op8 arg op8
        ROMPTR 0F0 051                           * 5C423  run if it matches
        NIBHEX  1A0A0                            * 5C42E  pattern: op0 op9 arg op9
        ROMPTR 0F0 052                           * 5C433  run if it matches
        NIBHEX  1B0B0                            * 5C43E  pattern: op0 op10 arg op10
        ROMPTR 0F0 052                           * 5C443  run if it matches
        NIBHEX  2A0A0                            * 5C44E  pattern: op1 op9 arg op9
        ROMPTR 0F0 053                           * 5C453  run if it matches
        NIBHEX  2B0B0                            * 5C45E  pattern: op1 op10 arg op10
        ROMPTR 0F0 053                           * 5C463  run if it matches
        NIBHEX  13000                            * 5C46E  pattern: op0 op2
        ROMPTR 0F0 049                           * 5C473  run if it matches
        NIBHEX  23000                            * 5C47E  pattern: op1 op2
        ROMPTR 0F0 04A                           * 5C483  run if it matches
        NIBHEX  14000                            * 5C48E  pattern: op0 op3
        ROMPTR 0F0 049                           * 5C493  run if it matches
        NIBHEX  24000                            * 5C49E  pattern: op1 op3
        ROMPTR 0F0 04A                           * 5C4A3  run if it matches
        NIBHEX  10000                            * 5C4AE  pattern: op0
        ROMPTR 0F0 049                           * 5C4B3  run if it matches
        NIBHEX  20000                            * 5C4BE  pattern: op1
        ROMPTR 0F0 04A                           * 5C4C3  run if it matches
        NIBHEX  F                                * 5C4CE  end of the rules

* merge common factor on right
* refs (2): 59C23 5D013
MetaM->:
        CON(5)  (*)+5                            * 5C4CF  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C4D4  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  13003                            * 5C4DB  pattern: op0 op2 arg arg op2
        RPL
        ROMPTR 0F0 054                           * 5C4E0  run if it matches
        NIBHEX  23003                            * 5C4EB  pattern: op1 op2 arg arg op2
        ROMPTR 0F0 054                           * 5C4F0  run if it matches
        NIBHEX  14004                            * 5C4FB  pattern: op0 op3 arg arg op3
        ROMPTR 0F0 054                           * 5C500  run if it matches
        NIBHEX  24004                            * 5C50B  pattern: op1 op3 arg arg op3
        ROMPTR 0F0 054                           * 5C510  run if it matches
        NIBHEX  35005                            * 5C51B  pattern: op2 op4 arg arg op4
        ROMPTR 0F0 054                           * 5C520  run if it matches
        NIBHEX  45005                            * 5C52B  pattern: op3 op4 arg arg op4
        ROMPTR 0F0 054                           * 5C530  run if it matches
        NIBHEX  F                                * 5C53B  end of the rules

* add fractions
* refs (1): 59BA3
MetaAF:
        CON(5)  (*)+5                            * 5C53C  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C541  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  14000                            * 5C548  pattern: op0 op3
        RPL
        ROMPTR 0F0 01C                           * 5C54D  run if it matches
        NIBHEX  24000                            * 5C558  pattern: op1 op3
        ROMPTR 0F0 01C                           * 5C55D  run if it matches
        NIBHEX  10400                            * 5C568  pattern: op0 arg op3
        ROMPTR 0F0 01E                           * 5C56D  run if it matches
        NIBHEX  20400                            * 5C578  pattern: op1 arg op3
        ROMPTR 0F0 01E                           * 5C57D  run if it matches
        NIBHEX  F                                * 5C588  end of the rules

* include left term
* refs (3): 59ADA 5CEC4 5CED8
Meta(<-:
        CON(5)  (*)+5                            * 5C589  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C58E  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C595  pattern: op0
        RPL
        ROMPTR 0F0 059                           * 5C59A  run if it matches
        NIBHEX  20000                            * 5C5A5  pattern: op1
        ROMPTR 0F0 059                           * 5C5AA  run if it matches
        NIBHEX  30000                            * 5C5B5  pattern: op2
        ROMPTR 0F0 05A                           * 5C5BA  run if it matches
        NIBHEX  40000                            * 5C5C5  pattern: op3
        ROMPTR 0F0 05A                           * 5C5CA  run if it matches
        NIBHEX  F                                * 5C5D5  end of the rules

* include right term
* refs (3): 59B29 5CE8D 5CEA1
Meta->):
        CON(5)  (*)+5                            * 5C5D6  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C5DB  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C5E2  pattern: op0
        RPL
        ROMPTR 0F0 05B                           * 5C5E7  run if it matches
        NIBHEX  20000                            * 5C5F2  pattern: op1
        ROMPTR 0F0 05B                           * 5C5F7  run if it matches
        NIBHEX  30000                            * 5C602  pattern: op2
        ROMPTR 0F0 05C                           * 5C607  run if it matches
        NIBHEX  40000                            * 5C612  pattern: op3
        ROMPTR 0F0 05C                           * 5C617  run if it matches
        NIBHEX  F                                * 5C622  end of the rules

* parenthesise nearest term
* refs (1): 59B77
Meta(()):
        CON(5)  (*)+5                            * 5C623  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C628  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C62F  pattern: op0
        RPL
        ROMPTR 0F0 05D                           * 5C634  run if it matches
        NIBHEX  20000                            * 5C63F  pattern: op1
        ROMPTR 0F0 05D                           * 5C644  run if it matches
        NIBHEX  30000                            * 5C64F  pattern: op2
        ROMPTR 0F0 05E                           * 5C654  run if it matches
        NIBHEX  40000                            * 5C65F  pattern: op3
        ROMPTR 0F0 05E                           * 5C664  run if it matches
        NIBHEX  F                                * 5C66F  end of the rules

* change EXP to trig. fns.
* refs (1): 59E72
Meta->TRG:
        CON(5)  (*)+5                            * 5C670  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 5C675  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  80000                            * 5C67C  pattern: op7
        RPL
        ROMPTR 0F0 063                           * 5C681  run if it matches
        NIBHEX  F                                * 5C68C  end of the rules

* move nearest left term to right
* refs (3): 59A8B 5CF2D 5CF41
MetaT->:
        CON(5)  (*)+5                            * 5C68D  primitive code object
        ASSEMBLE
        LC(5)   L_5BDA2                          * 5C692
        GOSBVL  SUB_5F6F9                        * 5C699  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C6A0  pattern: op0
        CON(5)  OBJ_5D794                        * 5C6A5  run if it matches
        NIBHEX  20000                            * 5C6AA  pattern: op1
        CON(5)  OBJ_5D794                        * 5C6AF  run if it matches
        NIBHEX  30000                            * 5C6B4  pattern: op2
        CON(5)  OBJ_5D7EF                        * 5C6B9  run if it matches
        NIBHEX  40000                            * 5C6BE  pattern: op3
        CON(5)  OBJ_5D7EF                        * 5C6C3  run if it matches
        NIBHEX  50000                            * 5C6C8  pattern: op4
        RPL
        ROMPTR 0F0 01A                           * 5C6CD  run if it matches
        NIBHEX  F                                * 5C6D8  end of the rules

* move nearest right term to left
* refs (3): 59A3C 5CF64 5CF78
Meta<-T:
        CON(5)  (*)+5                            * 5C6D9  primitive code object
        ASSEMBLE
        LC(5)   L_5BDA2                          * 5C6DE
        GOSBVL  SUB_5F6F9                        * 5C6E5  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C6EC  pattern: op0
        RPL
        ROMPTR 0F0 057                           * 5C6F1  run if it matches
        NIBHEX  20000                            * 5C6FC  pattern: op1
        ROMPTR 0F0 057                           * 5C701  run if it matches
        NIBHEX  30000                            * 5C70C  pattern: op2
        ROMPTR 0F0 058                           * 5C711  run if it matches
        NIBHEX  40000                            * 5C71C  pattern: op3
        ROMPTR 0F0 058                           * 5C721  run if it matches
        NIBHEX  50000                            * 5C72C  pattern: op4
        ROMPTR 0F0 01B                           * 5C731  run if it matches
        NIBHEX  F                                * 5C73C  end of the rules

* remove 1st RE,IM; CONJ
* refs (3): 59EA5 5CFCD 5CFDC
Meta->()C%:
        CON(5)  (*)+5                            * 5C73D  primitive code object
        ASSEMBLE
        LC(5)   L_5BDF7                          * 5C742
        GOSBVL  SUB_5F6F9                        * 5C749  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  14000                            * 5C750  pattern: op0 op3
        RPL
        ROMPTR 0F0 05F                           * 5C755  run if it matches
        NIBHEX  15000                            * 5C760  pattern: op0 op4
        ROMPTR 0F0 05F                           * 5C765  run if it matches
        NIBHEX  16000                            * 5C770  pattern: op0 op5
        ROMPTR 0F0 05F                           * 5C775  run if it matches
        NIBHEX  17000                            * 5C780  pattern: op0 op6
        ROMPTR 0F0 05F                           * 5C785  run if it matches
        NIBHEX  18000                            * 5C790  pattern: op0 op7
        ROMPTR 0F0 05F                           * 5C795  run if it matches
        NIBHEX  19000                            * 5C7A0  pattern: op0 op8
        ROMPTR 0F0 05F                           * 5C7A5  run if it matches
        NIBHEX  1A000                            * 5C7B0  pattern: op0 op9
        ROMPTR 0F0 05F                           * 5C7B5  run if it matches
        NIBHEX  1B000                            * 5C7C0  pattern: op0 op10
        ROMPTR 0F0 05F                           * 5C7C5  run if it matches
        NIBHEX  24000                            * 5C7D0  pattern: op1 op3
        ROMPTR 0F0 060                           * 5C7D5  run if it matches
        NIBHEX  25000                            * 5C7E0  pattern: op1 op4
        ROMPTR 0F0 060                           * 5C7E5  run if it matches
        NIBHEX  28000                            * 5C7F0  pattern: op1 op7
        ROMPTR 0F0 060                           * 5C7F5  run if it matches
        NIBHEX  34000                            * 5C800  pattern: op2 op3
        ROMPTR 0F0 061                           * 5C805  run if it matches
        NIBHEX  35000                            * 5C810  pattern: op2 op4
        ROMPTR 0F0 061                           * 5C815  run if it matches
        NIBHEX  38000                            * 5C820  pattern: op2 op7
        ROMPTR 0F0 061                           * 5C825  run if it matches
        NIBHEX  26000                            * 5C830  pattern: op1 op5
        CON(5)  OBJ_5DCEB                        * 5C835  run if it matches
        NIBHEX  36000                            * 5C83A  pattern: op2 op5
        CON(5)  OBJ_5DD19                        * 5C83F  run if it matches
        NIBHEX  F                                * 5C844  end of the rules

* define function
* refs (1): 59EF3
Meta->DEF:
        CON(5)  (*)+5                            * 5C845  primitive code object
        ASSEMBLE
        LC(5)   L_5BDBB                          * 5C84A
        GOSBVL  SUB_5F6F9                        * 5C851  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C858  pattern: op0
        RPL
        ROMPTR 0F0 064                           * 5C85D  run if it matches
        NIBHEX  20000                            * 5C868  pattern: op1
        ROMPTR 0F0 065                           * 5C86D  run if it matches
        NIBHEX  30000                            * 5C878  pattern: op2
        ROMPTR 0F0 066                           * 5C87D  run if it matches
        NIBHEX  40000                            * 5C888  pattern: op3
        ROMPTR 0F0 06A                           * 5C88D  run if it matches
        NIBHEX  50000                            * 5C898  pattern: op4
        ROMPTR 0F0 06B                           * 5C89D  run if it matches
        NIBHEX  60000                            * 5C8A8  pattern: op5
        ROMPTR 0F0 06C                           * 5C8AD  run if it matches
        NIBHEX  70000                            * 5C8B8  pattern: op6
        ROMPTR 0F0 067                           * 5C8BD  run if it matches
        NIBHEX  80000                            * 5C8C8  pattern: op7
        ROMPTR 0F0 068                           * 5C8CD  run if it matches
        NIBHEX  90000                            * 5C8D8  pattern: op8
        ROMPTR 0F0 069                           * 5C8DD  run if it matches
        NIBHEX  A0000                            * 5C8E8  pattern: op9
        ROMPTR 0F0 06D                           * 5C8ED  run if it matches
        NIBHEX  B0000                            * 5C8F8  pattern: op10
        ROMPTR 0F0 06E                           * 5C8FD  run if it matches
        NIBHEX  C0000                            * 5C908  pattern: op11
        ROMPTR 0F0 06F                           * 5C90D  run if it matches
        NIBHEX  F                                * 5C918  end of the rules
        NIBHEX  0000                             * 5C919  ..

* expand trig fns. of a sum
* refs (1): 59F23
MetaTRG*:
        CON(5)  (*)+5                            * 5C91D  primitive code object
        ASSEMBLE
        LC(5)   L_5BE2E                          * 5C922
        GOSBVL  SUB_5F6F9                        * 5C929  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  31000                            * 5C930  pattern: op2 op0
        RPL
        ROMPTR 0F0 070                           * 5C935  run if it matches
        NIBHEX  32000                            * 5C940  pattern: op2 op1
        ROMPTR 0F0 070                           * 5C945  run if it matches
        NIBHEX  41000                            * 5C950  pattern: op3 op0
        ROMPTR 0F0 071                           * 5C955  run if it matches
        NIBHEX  42000                            * 5C960  pattern: op3 op1
        ROMPTR 0F0 071                           * 5C965  run if it matches
        NIBHEX  61000                            * 5C970  pattern: op5 op0
        ROMPTR 0F0 073                           * 5C975  run if it matches
        NIBHEX  62000                            * 5C980  pattern: op5 op1
        ROMPTR 0F0 073                           * 5C985  run if it matches
        NIBHEX  71000                            * 5C990  pattern: op6 op0
        ROMPTR 0F0 074                           * 5C995  run if it matches
        NIBHEX  72000                            * 5C9A0  pattern: op6 op1
        ROMPTR 0F0 074                           * 5C9A5  run if it matches
        NIBHEX  81000                            * 5C9B0  pattern: op7 op0
        ROMPTR 0F0 075                           * 5C9B5  run if it matches
        NIBHEX  82000                            * 5C9C0  pattern: op7 op1
        ROMPTR 0F0 075                           * 5C9C5  run if it matches
        NIBHEX  51000                            * 5C9D0  pattern: op4 op0
        ROMPTR 0F0 072                           * 5C9D5  run if it matches
        NIBHEX  52000                            * 5C9E0  pattern: op4 op1
        ROMPTR 0F0 072                           * 5C9E5  run if it matches
        NIBHEX  F                                * 5C9F0  end of the rules

* refs (6): 5CA05 83BAE 83BC7 83BE0 83BF9 83C17
OBJ_5C9F1:
        :: ;                                     * 5C9F1

* refs (4): 5BEDF 5BEE9 5BF13 5BF1D
OBJ_5C9FB:
        :: OBJ_5CA0F OBJ_5C9F1 ;                 * 5C9FB

* refs (6): 5CA00 83BA4 83BBD 83BD6 83BEF 83C08
OBJ_5CA0F:
        :: #1-SWAP pshm1 pargop ROTUntop& pshtop& ; * 5CA0F

* refs (8): 5BF64 5BF6E 5BF98 5BFA2 83C30 83C49 ...
OBJ_5CA32:
        :: pargop #1-SWAP psh1&rev pshtop& ;     * 5CA32

* refs (5): 5BFE9 5BFF3 83C9E 83CB2 83CCB
OBJ_5CA50:
        :: #1-SWAP BINT1 2DUP rot #1-SWAP psh1&rev pshzerpsharg dup larg * 5CA50
          NDROP ROTUntop& ROTUntop& rotswap top& top& ; * 5CA82

* refs (14): 5C0CA 5C0D4 5C0DE 5C0E8 5C0F2 5C0FC ...
OBJ_5CAA5:
        :: pargop #1-SWAP pshm1 metaROTDUP over& psh pshzerpsharg ROTUntop& * 5CAA5
          pshtop& pshtop& ;                      * 5CAD2

* refs (6): 83E47 83E60 83E8D 83E9C 83EC4 83EEC
OBJ_5CAE1:
        :: pargop pargop ROTUntop& pshtop& ;     * 5CAE1

* refs (3): 83F05 83FE0 84003
OBJ_5CAFF:
        :: #1-SWAP pshm1 pargop pshzerpsharg pargop rotswap MEQU? case * 5CAFF
          OBJ_5CB4F                              * 5CB2C
          ROTUntop& pshtop& pshtop& pshtop& FALSE ; * 5CB31

* refs (1): 5CB2C
OBJ_5CB4F:
        :: NDROP pshtop& SWAPDROP#1- pshtop& pshtop& ROTSWAP TRUE ; * 5CB4F

* refs (5): 84026 8403F 84058 84071 84085
OBJ_5CB7C:
        :: #1-SWAP pshm1 pargop pshzerpsharg rotswap pargop unrot MEQU? case * 5CB7C
          OBJ_5CBD6                              * 5CBAE
          rotswap top& over& pshtop& pshtop& FALSE ; * 5CBB3

* refs (1): 5CBAE
OBJ_5CBD6:
        :: NDROP overev& overev& top& TRUE ;     * 5CBD6

* meta&ob -> M_last&M_rest
* refs (2): 83B22 83B63
drppargtop&:
        :: plDRPpZparg COLA top&                 * 5CBF9
        ;                                        * 5CC0D

* meta&ob1&ob2 -> meta
* refs (3): 290CD 5C19C 5C1F4
2pull2DROP:
        :: ROTROT2DROP #2- ;                     * 5CC12

* refs (2): 5CC67 83E1F
[f(X,Y)]=>[-X-Y]!:
        :: drpmeta- COLA metaneglft              * 5CC26
        ;                                        * 5CC3A

* refs (2): 5CC80 83E33
[f(X,Y)]=>[-X+Y]!:
        :: drpmeta+ COLA metaneglft              * 5CC3F
        ;                                        * 5CC53

* refs (3): 5C148 5D126 5D1F3
~SWAPDROP#1-;COLA;[f(X,Y)]=>[-X-Y]!:
        :: SWAPDROP#1- COLA [f(X,Y)]=>[-X-Y]!    * 5CC58
        ;                                        * 5CC6C

* refs (3): 5C152 5D149 5D216
~SWAPDROP#1-;COLA;[f(X,Y)]=>[-X+Y]!:
        :: SWAPDROP#1- COLA [f(X,Y)]=>[-X+Y]!    * 5CC71
        ;                                        * 5CC85

* refs (2): 5CCCB 83D9D
[f(X,Y)]=>[INV(X)/Y]!:
        :: drpmeta/ COLA metainvlft              * 5CC8A
        ;                                        * 5CC9E

* refs (2): 5CCE4 83DB6
[f(X,Y)]=>[INV(X)*Y]!:
        :: drpmeta* COLA metainvlft              * 5CCA3
        ;                                        * 5CCB7

* refs (3): 5C1E0 5D39D 5D46A
~SWAPDROP#1-;COLA;[f(X,Y)]=>[INV(X)/Y]!:
        :: SWAPDROP#1- COLA [f(X,Y)]=>[INV(X)/Y]! * 5CCBC
        ;                                        * 5CCD0

* refs (3): 5C1EA 5D3C0 5D48D
~SWAPDROP#1-;COLA;[f(X,Y)]=>[INV(X)*Y]!:
        :: SWAPDROP#1- COLA [f(X,Y)]=>[INV(X)*Y]! * 5CCD5
        ;                                        * 5CCE9

* meta1 meta2 -> meta1&M_rest M_last
* refs (8): 5D91C 5D9F3 8390F 8393C 83964 839B4 ...
larg&:
        :: larg over& ;                          * 5CCEE

* refs (6): 58B80 5D0F9 5D1A8 5D243 5D298 5D2B1
~addt:;x+:
        :: PTR addt: x+ ;                        * 5CD02

* meta -> meta&*
* refs (17): 58657 58BE4 5B767 5B843 5D370 5D41F ...
addt*:
        :: PTR addt: x* ;                        * 5CD16

* meta -> meta&NEG
* refs (15): 553FA 55576 58813 588C7 588D1 588FE ...
addtNEG:
        :: PTR addt: xNEG ;                      * 5CD2A

* meta -> meta&INV
* refs (2): 5B7A3 5DB29
addtINV:
        :: PTR addt: xINV ;                      * 5CD3E

* meta -> ?
* refs (17): 5CDA2 5CDE8 5CE1A 5CE2E 5CE51 5CE65 ...
evalcase::
        :: 'R                                    * 5CD52
          :: EVAL RDROPCOLA SKIP ; ;             * 5CD5C

* meta -> ?omeg
* refs (4): 5CDF7 5CF05 5CFA5 5CFD7
revalcase::
        :: 'R dvarlsBIND                         * 5CD7A

* refs (1): 5CDBB
OBJ_5CD89:
          :: #1-SWAP pshm1 BEGIN larg PTR evalcase: * 5CD89
            :: 1GETLAM COLA_EVAL ; OBJ_5CD89 unrot over& #0=UNTIL DROP ; * 5CDA7
          ABND ;                                 * 5CDD9

* refs (1): 59DEE
<-D[_]!:
        :: PTR evalcase: Meta<-D                 * 5CDE3

Meta<-Dall:
          :: PTR revalcase: Meta<-D COLA RDROP   * 5CDF2
          ;                                      * 5CE0B
        ;                                        * 5CE10

* refs (1): 599B7
Meta<-Aall:
        :: PTR evalcase: Meta<-A                 * 5CE15
          :: BEGIN PTR evalcase: Meta<-A AGAIN 3RDROP ; ; * 5CE24

* refs (1): 59A06
MetaA->all:
        :: PTR evalcase: MetaA->                 * 5CE4C
          :: BEGIN PTR evalcase: MetaA-> AGAIN 3RDROP ; ; * 5CE5B

* refs (1): 59B42
Meta->)all:
        :: PTR evalcase: Meta->)                 * 5CE83
          :: BEGIN PTR evalcase: Meta->) AGAIN 3RDROP ; ; * 5CE92

* refs (1): 59AF3
Meta(<-all:
        :: PTR evalcase: Meta(<-                 * 5CEBA
          :: BEGIN PTR evalcase: Meta(<- AGAIN 3RDROP ; ; * 5CEC9

* refs (1): 59E3D
MetaD->all:
        :: PTR evalcase: MetaD->                 * 5CEF1
          :: PTR revalcase: MetaD-> COLA RDROP   * 5CF00
          ;                                      * 5CF19
        ;                                        * 5CF1E

* refs (1): 59AA4
MetaT->all:
        :: PTR evalcase: MetaT->                 * 5CF23
          :: BEGIN PTR evalcase: MetaT-> AGAIN 3RDROP ; ; * 5CF32

* refs (1): 59A55
Meta<-Tall:
        :: PTR evalcase: Meta<-T                 * 5CF5A
          :: BEGIN PTR evalcase: Meta<-T AGAIN 3RDROP ; ; * 5CF69

* refs (1): 59D9F
Meta->()all:
        :: PTR evalcase: Meta->()                * 5CF91
          :: PTR revalcase: Meta->() COLA RDROP  * 5CFA0
          ;                                      * 5CFB9
        ;                                        * 5CFBE

* refs (1): 59EBE
Meta->()C%all:
        :: PTR evalcase: Meta->()C%              * 5CFC3
          :: PTR revalcase: Meta->()C% COLA RDROP * 5CFD2
          ;                                      * 5CFEB
        ;                                        * 5CFF0

* refs (1): 59BED
Meta<-Mall:
        :: OBJ_5D01D Meta<-M ;                   * 5CFF5

* refs (1): 59C3C
MetaM->all:
        :: OBJ_5D01D MetaM-> ;                   * 5D009
