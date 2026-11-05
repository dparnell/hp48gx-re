* HP 48GX ROM revision R, #27029-#2A001: The algebraic parser (an operator-precedence parser), the parser of unit expressions, the decompiler of algebraics to text, and the rounding and packing of long reals
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PACK AlgFail tok=casedrop GetGNTData PutGNTData POP1% NOTROMPcase drop;dq AlgLoop CmdField AlgApply true;1Lput
* Follows on from the previous file (at #27029 in the original ROM).
        A=C     A                                * 27029
        PC=(A)                                   * 2702B

* refs (1): 26FDA
* C.A = mask of trailer fields, C.S = field number -> carry set if the field is present, and its position in the trailer: counts the mask bits below it
SlotOffset:
        P=      4                                * 2702F
        A=0     P                                * 27031
        C=C-1   S                                * 27034
        GOC     SlotOffset.L2                    * 27037
SlotOffset.loop1:
        C=0     P                                * 2703A
        C=C+C   A                                * 2703D
        A=A+C   P                                * 2703F
        C=C-1   S                                * 27042
        GONC    SlotOffset.loop1                 * 27045
SlotOffset.L2:
        C=A     P                                * 27048
        P=C     4                                * 2704B
        CPEX    15                               * 2704F
        P=      3                                * 27053
        C=C+C   P                                * 27055
        P=      0                                * 27058
        RTN                                      * 2705A
        RPL

* refs (1): 27022
* Finish a field read: an access pointer or ROMPTR in the field is resolved to its object
SlotResolve:
        :: ?ACCPTR> NOTROMPcase TRUE             * 2705C
          RompNoAcc FALSE SWAPDROP ?ACCPTR> TRUE ; * 27070

* refs (10): 4ABE4 6850F 6852D 68DFA 68ECC 6DEAF ...
* ob -> ob' TRUE | FALSE: the trailer field that header bit 2 says is present. For words of library 700 it comes after the compile routine and the SST handler, when they are there.
CmdField:
        :: CK&DISPATCH0                          * 2708E
          BINT8 CmdFieldWd                       * 27098  program
          BINT15 CmdFieldRomp                    * 270A2  romptr
          BINT0 FALSE                            * 270AC  any
        ;                                        * 270B6

* refs (1): 2709D
* ROM word case of CmdField
CmdFieldWd:
        :: DUPROM-WORD? case CmdFieldCode        * 270BB
          FALSE ;                                * 270CF

* refs (1): 270A7
* ROMPTR case of CmdField
CmdFieldRomp:
        :: OBJ_71DFF FALSE CmdFieldRomp~1 ;      * 270D9

* refs (1): 7222C
* ROMPTR case as called from library code
CmdFieldRomp2:
        :: CmdFieldCode NOTcsdrpfls SWAPDROPTRUE ; * 270F2

* refs (2): 270CA 270F7
* Code object of CmdField. ST6 set for library #700 and above, where header bit 3 means an SST handler and bit 1 clear a compile routine, each taking a field before this one.
CmdFieldCode:
        CON(5)  CmdFieldCode~1                   * 2710B  code object: the address of its machine code
        ASSEMBLE
CmdFieldCode.L1:
        A=DAT1  X                                * 27110
        CD1EX                                    * 27114
        RSTK=C                                   * 27117
        LC(3)   #700                             * 27119
        ST=0    6                                * 2711E
        ?C>A    X                                * 27121
        GOYES   CmdFieldCode.L2                  * 27124
        ST=1    6                                * 27126
CmdFieldCode.L2:
        C=RSTK                                   * 27129
        CD1EX                                    * 2712B
        D1=D1-  1                                * 2712E
        A=DAT1  1                                * 27131
        D1=C                                     * 27135
        ?ABIT=1 2                                * 27138
        GOYES   CmdFieldCode.L4                  * 2713D
CmdFieldCode.L3:
        LC(5)   FALSE                            * 2713F
        A=C     A                                * 27146
        PC=(A)                                   * 27148
CmdFieldCode.L4:
        C=0     S                                * 2714C
        ?ST=0   6                                * 2714F
        GOYES   CmdFieldCode.L6                  * 27152
        ?ABIT=0 3                                * 27154
        GOYES   CmdFieldCode.L5                  * 27159
        C=C+1   S                                * 2715B
CmdFieldCode.L5:
        ?ABIT=1 1                                * 2715E
        GOYES   CmdFieldCode.L6                  * 27163
        C=C+1   S                                * 27165
CmdFieldCode.L6:
        GOSBVL  SAVPTR                           * 27168
        A=R0.F  A                                * 2716F
        D0=A                                     * 27175
        GOTO    GETPTRFALSE.L2                   * 27178
        FILLTO  #271C5                           * 2717C  73 zero nibbles: the next entry stays at #271C5
        RPL

* refs (1): 1476C
* ob -> ob' TRUE | FALSE: the SST handler of a word of library 700
SstHandler:
        :: DUP Lib700? NOTcaseFALSE DUPTYPECOL?  * 271C5
          case SstHandlerCode                    * 271DE
          OBJ_71DFF FALSE SstHandlerCode NOTcsdrpfls SWAPDROPTRUE ; * 271E8

* refs (2): 271E3 271F2
* Code object of SstHandler: the handler is present when header bit 3 is set; it is field 0, or field 1 after a compile routine
SstHandlerCode:
        CON(5)  SstHandlerCode~1                 * 27206  code object: the address of its machine code
        ASSEMBLE
SstHandlerCode.L1:
        A=DAT1  1                                * 2720B
        D1=C                                     * 2720F
        ?ABIT=1 3                                * 27212
        GOYES   SstHandlerCode.L2                * 27217
        GOTO    CmdFieldCode.L3                  * 27219
SstHandlerCode.L2:
        C=0     S                                * 2721D
        GOTO    CmdFieldCode.L5                  * 27220

* bak -> :: bak <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (4): 0902A 215E3 853AF 8550F
DNOTBAKcase:
        CON(5)  (*)+5                            * 27224  primitive code object
        LC(5)   DOBAK                            * 27229
        GOTO    NOTROMPcase.L1                   * 27230

* lib -> :: lib <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (1): 09034
DNOTLIBcase:
        CON(5)  (*)+5                            * 27234  primitive code object
        LC(5)   DOLIB                            * 27239
        GOTO    NOTROMPcase.L1                   * 27240

* {} -> :: {} <ob2> <rest> ; ob -> :: ob <ob1> ;
NOTLISTcase:
        CON(5)  (*)+5                            * 27244  primitive code object
        LC(5)   DOLIST                           * 27249
        GOTO    NOTROMPcase.L1                   * 27250

* seco -> :: seco <ob2> <rest> ; ob -> :: ob <ob1> ;
NOTSECOcase:
        CON(5)  (*)+5                            * 27254  primitive code object
        LC(5)   DOCOL                            * 27259
        GOTO    NOTROMPcase.L1                   * 27260

* romp -> :: romp <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (15): 0F1C3 268DB 2691C 269A4 27066 291F8 ...
NOTROMPcase:
        CON(5)  (*)+5                            * 27264  primitive code object
        LC(5)   DOROMP                           * 27269
NOTROMPcase.L1:
        RSTK=C                                   * 27270
        C=DAT1  A                                * 27272
        CD1EX                                    * 27275
        A=DAT1  A                                * 27278
        D1=C                                     * 2727B
NOTROMPcase.L2:
        C=RSTK                                   * 2727E
        A=A-C   A                                * 27280
        LC(5)   COLA                             * 27282
        ?A#0    A                                * 27289
        GOYES   NOTROMPcase.L3                   * 2728C
        LC(5)   SKIP                             * 2728E
NOTROMPcase.L3:
        A=C     A                                * 27295
        PC=(A)                                   * 27297
        RPL

* refs (1): 24753
* Parse an algebraic, tokens already started. Lams hold the state: 1 = 0 when an operand is expected, 2 = priority, 3..7 the current operator, 8.. the saved tokenizer data. Operators wait on the stack as frames with their priorities.
AlgParse:
        :: BINT4 AlgStartFrame DUP#1+ SWAPUnDROP BINT0 BINT7 NDUPN DROP * 2729B
          {                                      * 272C8

Π'ttt:
            LAM 'ttt                             * 272CD

Π'str:
            LAM 'str                             * 272DC

Π'ofs:
            LAM 'ofs                             * 272EB

Π'tok:
            LAM 'tok                             * 272FA

Π'rbv:
            LAM 'rbv                             * 27309

Π'idfflg:
            LAM 'idfflg                          * 27318

Π'tmpop:
            LAM 'tmpop                           * 2732D

Π'tmppdat:
            LAM 'tmppdat                         * 27340

Π'ploc:
            LAM 'ploc                            * 27357

Π'bv:
            LAM 'bv                              * 27368

Π'unbound:
            LAM 'unbound }                       * 27375
          BIND pshzer AlgLoop ABND ;             * 27391

* refs (12): 2739B 276B1 27814 2792C 27A3A 27ABC ...
* Main loop: dispatch on the next token
AlgLoop:
        :: check_pdata AlgTok AlgLoop~1 AlgLoop~2 8GETLAM nultrior * 273AA
          :: drop;dq AlgEnd ; tok' tok=casedrop AlgEnd * 273CD
          toklparen tok=casedrop AlgLParen       * 273F0
          tokrparen tok=casedrop AlgRParen       * 273FF
          NoDecSep tok=casedrop AlgComma         * 2740E
          tok; tok=casedrop AlgComma             * 2741D
          tok= tok=casedrop AlgEqual             * 2742C
          DROP GetGNTData ParseReal !*trior AlgOperand ngsizecase failed * 2743B
          Tok>Name !*trior AlgOperand SWAP COMPILEID ROT ORNOT casedrop * 2745E
          failed                                 * 27486
          ?AlgUnary ?OKINALG NOTcasedrop failed  * 2748B
          FnInfo NOTcase AlgNotFn                * 2749F
          7UNROLL 7UNROLL 7UNROLL 4DROP COLA AlgOperator * 274AE
        ;                                        * 274CC

* refs (3): 2748B 68814 68AA3
* ob -> ob': at the start of an operand - becomes NEG and + becomes the unary plus
?AlgUnary:
        :: 1GETLAM #0<> ?SEMI                    * 274D1
          DUP M1st-case                          * 274E5
          :: 2DROP ' xNEG ;                      * 274EF
          M1st+case                              * 27508
          :: 2DROP ' xNEGNEG ;                   * 2750D
          DROP ;                                 * 27526

* refs (2): 273D7 273EB
* Closing tick: an operand must have come; reduce everything that's left
AlgEnd:
        :: 1GETLAM #0=case AlgFail               * 27530
          COLA AlgEndReduce                      * 27544
        ;                                        * 2754E

* refs (3): 27549 2757B 275A3
* Apply the waiting operators until none are left; a parenthesis left open is allowed when the input ended there
AlgEndReduce:
        :: DUP#0=case AlgDone                    * 27553
          AlgEndReduce~1 NOTcase                 * 27562
          :: AlgApply COLA AlgEndReduce          * 2756C
          ;                                      * 27580
          OBJ_28616 IT AlgEndParens              * 27585
          OBJ_284C3 AlgApply COLA AlgEndReduce   * 27594
        ;                                        * 275A8

* refs (1): 2758F
* Close the parentheses left open at the end
AlgEndParens:
        :: DUP BINT5 #=case                      * 275AD
          :: NDROP BINT0 RDROPCOLA AlgDone ;     * 275C1
          BEGIN ROT#1+UNROT OBJ_282FA DROP SWAPDUP BINT5 #= SWAP BINT7 #> OR * 275DF
          NOTcase                                * 27616
          :: 2RDROP DROP AlgFail ;               * 2761B
          NOT_UNTIL ;                            * 27634

* refs (2): 2755D 275D5
* Build the symbolic object from the finished stack
AlgDone:
        :: DROPONE OVER#= ITE CKSYMBN PSYMBN     * 2763E
          SWAP#1+ GetGNTData TrueTrue ;          * 2765C

* refs (1): 274A9
* A word that isn't a function: treat it as an operand
AlgNotFn:
        :: PutTok 2DROP COLA AlgOperand          * 27670
        ;                                        * 27689

* refs (1): 273B9
AlgLoop~1:
        :: GetGNTData 5ROLL tok8trior            * 2768E

* refs (1): 276CA
OBJ_276A2:
          :: PutGNTData COLA AlgLoop             * 276A2
          ;                                      * 276B6
          tok; tok=next !*triand OBJ_276A2 ;     * 276BB

* refs (2): 27418 27427
* Argument separator: reduce down to the enclosing call
AlgComma:
        :: 1GETLAM #0=case AlgFail               * 276D4
          COLA AlgCommaReduce                    * 276E8
        ;                                        * 276F2

* refs (3): 276ED 2772E 27756
* Apply operators down to the frame of the enclosing function or parenthesis
AlgCommaReduce:
        :: DUP#0=case AlgFail                    * 276F7
          3PICK #0=case AlgCmpSep                * 27706
          OBJ_282FA NOTcase                      * 27715
          :: AlgApply COLA AlgCommaReduce        * 2771F
          ;                                      * 27733
          OBJ_28616 NOTcase                      * 27738
          :: OBJ_284C3 AlgApply COLA AlgCommaReduce * 27742
          ;                                      * 2775B
          ROT#1+UNROT OBJ_282FA 2DROP BINT6 EQcasedrop OBJ_277B0 * 27760
          DUP BINT7 #>case OBJ_277C9             * 2777E
          DROP                                   * 27792

* refs (22): 2753F 2762A 276E3 27701 2782D 2784B ...
* Parser failure exit: restore the saved token and parser state, then FALSE TRUE
AlgFail:
          :: GetGNTData failed ; ;               * 27797

* refs (4): 27779 278C3 279A9 279F4
OBJ_277B0:
        :: BINT7 COLA OBJ_277C9                  * 277B0
        ;                                        * 277C4

* refs (2): 2778D 277BF
OBJ_277C9:
        :: BINT8 #- 4ROLL SWAP#- 3UNROLL OBJ_284C3 * 277C9

* refs (5): 27922 27A30 27AB2 27C65 27EB8
* Read the next token, set lam 1 to 0 and go on: an operand comes next
AlgNextOperand:
          :: GetGNTData DROP GetNextToken PutGNTData ; ~BINT0;1PUTLAM COLA * 277EC
          AlgLoop                                * 27814
        ;                                        * 27819

* refs (1): 27436
* =: reduce, then treat as an operator
AlgEqual:
        :: 1GETLAM #0=case AlgFail               * 2781E
          COLA AlgEqualReduce                    * 27832
        ;                                        * 2783C

* refs (3): 27837 27878 278A0
* Apply operators down to the = frame
AlgEqualReduce:
        :: DUP#0=case AlgFail                    * 27841
          3PICK #0=case AlgFail                  * 27850
          OBJ_282FA NOTcase                      * 2785F
          :: AlgApply COLA AlgEqualReduce        * 27869
          ;                                      * 2787D
          OBJ_28616 NOTcase                      * 27882
          :: OBJ_284C3 AlgApply COLA AlgEqualReduce * 2788C
          ;                                      * 278A5
          ROT#1+UNROT OBJ_282FA 2DROP BINT7 #=casedrop OBJ_277B0 * 278AA
          DROP AlgFail ;                         * 278C8

* refs (1): 27409
* ): reduce down to the matching (
AlgRParen:
        :: 1GETLAM #0=case AlgFail               * 278D7
          COLA AlgRParenReduce                   * 278EB
        ;                                        * 278F5

* refs (3): 278F0 2794F 27977
* Apply operators until the ( frame or the function's frame, which then closes
AlgRParenReduce:
        :: DUP#0=case AlgFail                    * 278FA
          3PICK #0=case                          * 27909
          :: metatail NDROP AlgNextOperand COLA AlgLoop * 27913
          ;                                      * 27931
          OBJ_282FA NOTcase                      * 27936
          :: AlgApply COLA AlgRParenReduce       * 27940
          ;                                      * 27954
          OBJ_28616 NOTcase                      * 27959
          :: OBJ_284C3 AlgApply COLA AlgRParenReduce * 27963
          ;                                      * 2797C
          ROT#1+UNROT OBJ_282FA DROPOVER BINT5 #=case * 27981
          :: 2DROP COLA OBJ_277B0                * 2799A
          ;                                      * 279AE
          SWAP BINT9 #< casedrop AlgFail         * 279B3
          NOTcase AlgFail                        * 279CC
          ROT#1+UNROT OBJ_282FA 2DROP BINT5 #= case OBJ_277B0 * 279D6
          AlgFail ;                              * 279F9

* refs (1): 273FA
* (: starts a group in operand position; after a name it is a function call, built with xFCNAPPLY
AlgLParen:
        :: 1GETLAM #0=case                       * 27A03
          :: NULLHXS ZEROZERO BINT3 5ROLL #4+ AlgNextOperand COLA AlgLoop * 27A12
          ;                                      * 27A3F
          psh OVERDUP TYPEIDNT? SWAP TYPELAM? OR NOTcase AlgFail * 27A44
          #1-SWAP symcomp BINT0 ' xFCNAPPLY #0590410h BINT0 BINT3 BINT6 * 27A6C
          BINT7 psh over& psh ~BINT0;1PUTLAM AlgNextOperand COLA AlgLoop * 27A99
        ;                                        * 27AC1

* refs (3): 2744F 27468 27684
* ob -> : an operand must be expected here. Keep it and expect an operator.
AlgOperand:
        :: 1GETLAM ~BINT1;1PUTLAM #0= NOTcase    * 27AC6
          :: 4DROP AlgFail ;                     * 27ADF
          PutGNTData pullrev1& COLA AlgLoop      * 27AF3
        ;                                        * 27B07

* refs (1): 274C7
* An operator or function: unpack its descriptor into the lams, reduce by priority, and push it
AlgOperator:
        :: #1+ #0= 6PUTLAM SWAP 5PUTLAM DUP4PUTLAM OBJ_26E61 DROP 7PUTLAM * 27B0C
          2PUTLAM NOTcase AlgPrefix              * 27B3E
          1GETLAM #0=case AlgFail                * 27B4D
          AlgReduce BINT3 3PUTLAM 4GETLAM AlgOperator~1 BINT2 #<> ?SKIP * 27B5C
          OBJ_282B4                              * 27B84
          AlgPushOp OBJ_284C3 COLA AlgLoop       * 27B89
        ;                                        * 27B9D

* refs (1): 27B48
* A prefix function in operand position
AlgPrefix:
        :: 1GETLAM #0= NOTcase AlgFail           * 27BA2
          BINT2 3PUTLAM AlgPushOp COLA AlgLoop   * 27BBB
        ;                                        * 27BD4

* refs (2): 27B89 27BC5
* Push a frame for the operator in the lams, using xFCNAPPLY for a user function
AlgPushOp:
        :: 5GETLAM DUP TYPEROMP? ITE             * 27BD9
          :: symcomp BINT0 ' xFCNAPPLY BINT3 ;   * 27BF2
          :: 6GETLAM ITE                         * 27C15
            :: ZEROSWAP BINT2 ; BINT1            * 27C24
          ;                                      * 27C3D
          4GETLAM 7GETLAM 3GETLAM BINT3 top& DUP#1+ top& AlgNextOperand * 27C42
          ~BINT0;1PUTLAM ;                       * 27C6A

* refs (2): 27B5C 27CC4
* Apply waiting operators of higher or equal priority
AlgReduce:
        :: DUP#0= ?SEMI                          * 27C74
          4PICK 2GETLAM #< ?SEMI                 * 27C83
          OBJ_282FA IT                           * 27C97
          :: OBJ_28616 DROP ;                    * 27CA1
          OBJ_284C3 AlgApply COLA AlgReduce      * 27CB5
        ;                                        * 27CC9

* refs (1): 273BE
AlgLoop~2:
        :: 1GETLAM #0= NOTcase AlgFail           * 27CCE
          ~BINT1;1PUTLAM AlgApply COLA AlgLoop   * 27CE7
        ;                                        * 27CFB

* refs (2): 273AF 27EC7
check_pdata:
        :: DUP#0=case 3SKIP                      * 27D00
          3PICK #0=case 3SKIP                    * 27D0F
          OBJ_282FA NOTcase 2skipcola            * 27D1E
          DROP                                   * 27D2D

* refs (1): 69A59
* Probably: #kind -> : dispatch for the next objects of the stream; kinds 0, 2 and 3 are the frames that hold operators
OBJ_27D32:
          CODE                                   * 27D32  69 nibbles
            GOSBVL  POP#                         * 27D3C
            LC(5)   #00000                       * 27D43
            ?C=A    A                            * 27D4A
            GOYES   OBJ_27D32.L1                 * 27D4D
            LC(1)   #2                           * 27D4F
            ?C=A    A                            * 27D52
            GOYES   OBJ_27D32.L1                 * 27D55
            D0=D0+  5                            * 27D57
            LC(1)   #3                           * 27D5A
            ?C=A    A                            * 27D5D
            GOYES   OBJ_27D32.L1                 * 27D60
            D0=D0+  5                            * 27D62
            D1=D1-  5                            * 27D65
            D=D-1   A                            * 27D68
            A=DAT0  A                            * 27D6A
            D0=D0+  5                            * 27D6D
            PC=(A)                               * 27D70
OBJ_27D32.L1:
            LC(5)   COLA                         * 27D74
            A=C     A                            * 27D7B
            PC=(A)                               * 27D7D
          ENDCODE                                * 27D81
          3SKIP COLA 4ROLL                       * 27D81
          #1+ 4UNROLL                            * 27D90

* refs (1): 69A68
* Probably: #kind -> : as the routine before, for kinds 4..7, the grouping frames (parentheses, comma, equals)
OBJ_27D9A:
          CODE                                   * 27D9A  106 nibbles
            GOSBVL  POP#                         * 27DA4
            LC(5)   #00004                       * 27DAB
            ?C=A    A                            * 27DB2
            GOYES   OBJ_27D9A.L1                 * 27DB5
            D0=D0+  15                           * 27DB7
            D0=D0+  5                            * 27DBA
            LC(1)   #5                           * 27DBD
            ?C=A    A                            * 27DC0
            GOYES   OBJ_27D9A.L1                 * 27DC3
            D0=D0+  15                           * 27DC5
            D0=D0+  5                            * 27DC8
            LC(1)   #6                           * 27DCB
            ?C=A    A                            * 27DCE
            GOYES   OBJ_27D9A.L1                 * 27DD1
            D0=D0+  15                           * 27DD3
            D0=D0+  5                            * 27DD6
            LC(1)   #7                           * 27DD9
            ?C=A    A                            * 27DDC
            GOYES   OBJ_27D9A.L1                 * 27DDF
            D0=D0+  15                           * 27DE1
            D0=D0+  5                            * 27DE4
            LC(1)   #1                           * 27DE7
            ?C#A    A                            * 27DEA
            GOYES   OBJ_27D9A.L2                 * 27DED
OBJ_27D9A.L1:
            LC(5)   COLA                         * 27DEF
            A=C     A                            * 27DF6
            PC=(A)                               * 27DF8
OBJ_27D9A.L2:
            D0=D0+  5                            * 27DFC
            D1=D1-  5                            * 27DFF
            D=D-1   A                            * 27E02
            A=DAT0  A                            * 27E04
            D0=D0+  5                            * 27E07
            PC=(A)                               * 27E0A
          ENDCODE                                * 27E0E
          :: toklparen COLAskipcola ;            * 27E0E
          :: tokrparen COLAskipcola ;            * 27E22
          :: NoDecSep COLAskipcola ;             * 27E36
          :: tok= COLAskipcola ; 3SKIP 8GETLAM   * 27E4A

* refs (1): 69AC7
* $tok -> flag: the token is , or ;
AlgSep?:
          :: NoDecSep tok=casedrop TRUE          * 27E68
            tok; tok=casedrop TRUE               * 27E7C
            2DROPFALSE ;                         * 27E8B
          IT                                     * 27E95
          :: BINT7 #- 4ROLL SWAP#- 3UNROLL AlgNextOperand ; * 27E9A
          COLA check_pdata                       * 27EC2
        ;                                        * 27ECC

* refs (1): 273B4
* Fetch the parser's token data and run the next word on it
AlgTok:
        :: GetGNTData ~;eval;q                   * 27ED1

* refs (2): 246C7 24E51
* A token that isn't a delimiter or too long becomes a name
AlgTok>Id:
          :: ngsizecase failed                   * 27EE0
            delimcase failed                     * 27EEF
            DUP RDROP ;                          * 27EF9
          $>ID DUP undo ITE                      * 27F08

* refs (1): 69801
* id -> lam TRUE: for the EquationWriter
Id>Lam:
          :: DROP ID>LAM TRUE ;                  * 27F1C

* refs (1): 69806
* $ -> ...: the EquationWriter's check for a name that compiles to a global
CompileId?:
          :: DUP COMPILEID DROP TYPEIDNT? ;      * 27F35
          NOTcase                                * 27F53

drop;false;true:
          :: DROP failed ;                       * 27F58
          symcomp 6rolld;1+(s5) DROP GetNextToken PutGNTData pullrev1& * 27F6C
          OBJ_284C3 ROT#1+UNROT COLA AlgLoop     * 27F8A
        ;                                        * 27F9E

* refs (6): 2740E 27E3B 27E6D 68B4D 69616 69A9A
NoDecSep:
        :: DPRADIX? tok, tok. RPITE ;            * 27FA3

* refs (10): 27571 27599 27724 2774C 2786E 27896 ...
* Apply the top operator to its operands, in the symbolic being built
AlgApply:
        :: metatail #3- 4UNROLL3DROP rotswap top& AlgFold psh ; * 27FC1

* refs (2): 27FDF 6B018
* Applying an operator: fold number literals. -5 becomes a negative real, (x,y) a complex, a number and unit a unit object, and the pseudo-commands of the parser turn into real ones.
AlgFold:
        :: M1stNEGcase AlgFoldNeg                * 27FEE
          AEQ1stcase xNEGNEG                     * 27FFD
          SWAPDROP#1- AEQ1stcase ~CK2&Dispatch   * 28007
          AlgFoldCmp AEQ1stcase ~CK2&Dispatch_2  * 28016
          AlgFoldPolar AEQ1stcase xFORMUNIT      * 28025
          AlgFoldUnit AEQ1stcase xPREDIV         * 28034
          PreDiv>/ ;                             * 28043

* refs (2): 28043 6AFB9
* -> : the parser's early divide becomes /
PreDiv>/:
        :: SWAPDROP ' x/ SWAP ;                  * 2804D

* refs (1): 28034
* Number and unit expression: folds to a unit object
AlgFoldUnit:
        :: larg dup                              * 2806B

* refs (1): 28115
{}_2807A:
          { } OVER#2+UNROL SWAPDROP#1- larg CKSYMBN EXPLODE IMPLODE pshm1 * 2807A
          CKSYMBN EXPLODE IMPLODE SWAPDROPSWAP ERRSET * 280A7
          :: ' Fmt>UnitOb parameval ChkEvalNext? x* NOTcase doerrB01 * 280C0
            SWAPDROP pshm1 NDROP DROP ;          * 280E8
          ERRTRAP                                * 28101
          :: ERRORCLR BEGIN {}_2807A EQ UNTIL IMPLODE ; SINNER top& ; * 28106

* refs (1): 27FF8
* ob -> : negate a real, complex or unit literal at once; other things stay symbolic
AlgFoldNeg:
        :: CK&DISPATCH0                          * 2813D
          REALOBOB ~#1-UNROT;EvalNoCK;SWAP       * 28147  real any any
          CMPOBOB ~#1-UNROT;EvalNoCK;SWAP        * 28151  complex any any
          EXTOBOB ~#1-UNROT;EvalNoCK;SWAP        * 2815B  unit any any
          BINT0 NOP                              * 28165  any
        ;                                        * 2816F

* refs (3): 2814C 28156 28160
~#1-UNROT;EvalNoCK;SWAP:
        :: #1-UNROT EvalNoCK SWAP ;              * 28174

* refs (2): 28016 5F594
* (x,y): reals fold to a complex; others become x+i*y
AlgFoldCmp:
        :: SWAPDROP#1- CK&DISPATCH0              * 2818D
          REALREALOB AlgFoldCmp~real,real,any    * 2819C  real real any
          BINT0 Addi*+[_]                        * 281A6  any
        ;                                        * 281B0

* refs (1): 281A1
AlgFoldCmp~real,real,any:
        :: #1-UNROT %>C% SWAP ;                  * 281B5

* refs (2): 281AB 28282
Addi*+[_]:
        ::                                       * 281CE
          { xi x* x+ } INNERtop& ;               * 281D3

* refs (2): 28025 5F599
* (r,∡t): reals fold to a complex; others become the formula of AlgPolarSym
AlgFoldPolar:
        :: SWAPDROP#1- CK&DISPATCH0              * 281F6
          REALREALOB AlgFoldPolar%               * 28205  real real any
          BINT0 AlgPolarSym                      * 2820F  any
        ;                                        * 28219

* refs (1): 2820A
* % % -> C%
AlgFoldPolar%:
        :: #1-UNROT %POL>%REC %>C% SWAP ;        * 2821E

* refs (1): 28214
* Symbolic polar complex: r*COS(t) + i*r*SIN(t)
AlgPolarSym:
        :: pshzerpsharg parg& psh dup PTR addt2: xCOS x* psh PTR addt2: xSIN * 2823C
          x* top& top& Addi*+[_] ;               * 28273
        CON(5)  NOP                              * 2828C  address

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 28291  entry 0

* ob1..obn-i..obn #i #n+1 -> ob1..ob..obn-i #n-i obn-i+1..obn #i
* refs (3): 27918 27FC6 28432
metatail:
        :: OVER#- #1- OVER #2+UNROLL ;           * 28296

* refs (3): 27B84 28639 28648
OBJ_282B4:
        :: psh larg PSYMBN SWAP#1+ psh ;         * 282B4

* refs (1): 27562
AlgEndReduce~1:
        :: 3PICK #0=case FALSE                   * 282D7
          COLA OBJ_282FA                         * 282EB
        ;                                        * 282F5

* refs (13): 275E9 27715 27765 2785F 278AF 27936 ...
* Probably: algebraic parser: nibble #i of its context hex string
OBJ_282FA:
        :: FALSE BINT0 COLA OBJ_28318            * 282FA
        ;                                        * 28313

* refs (1): 2830E
OBJ_28318:
        CON(5)  (*)+5                            * 28318  primitive code object
        ASSEMBLE
        CD1EX                                    * 2831D
        RSTK=C                                   * 28320
        D1=C                                     * 28322
        D1=D1+  5                                * 28325
        D1=D1+  15                               * 28328
OBJ_28318.L1:
        C=DAT1  A                                * 2832B
        CD1EX                                    * 2832E
        D1=D1+  5                                * 28331
        A=DAT1  A                                * 28334
        D1=C                                     * 28337
        D1=D1+  10                               * 2833A
        C=DAT1  A                                * 2833D
        D1=C                                     * 28340
        D1=D1+  5                                * 28343
        C=DAT1  A                                * 28346
        C=C-CON A,7                              * 28349
        ?C<A    A                                * 2834F
        GOYES   OBJ_28318.L2                     * 28352
        A=0     S                                * 28354
        ?C>A    A                                * 28357
        GOYES   OBJ_28318.L3                     * 2835A
        A=A+1   S                                * 2835C
        GONC    OBJ_28318.L3                     * 2835F
OBJ_28318.L2:
        C=RSTK                                   * 28362
        D1=C                                     * 28364
        D1=D1+  5                                * 28367
        D=D+1   A                                * 2836A
        A=DAT0  A                                * 2836C
        D0=D0+  5                                * 2836F
        PC=(A)                                   * 28372
OBJ_28318.L3:
        D1=D1+  5                                * 28376
        CD1EX                                    * 28379
        C=C+A   A                                * 2837C
        D1=C                                     * 2837E
        A=0     A                                * 28381
        A=DAT1  1                                * 28383
        C=A     A                                * 28387
        A=A+A   A                                * 28389
        A=A+A   A                                * 2838B
        A=A+C   A                                * 2838D
        A=A+A   A                                * 2838F
        C=RSTK                                   * 28391
        D1=C                                     * 28393
        LC(5)   BINT0                            * 28396
        A=A+C   A                                * 2839D
        D1=D1+  5                                * 2839F
        DAT1=A  A                                * 283A2
        D1=D1-  5                                * 283A5
        LC(5)   TRUE                             * 283A8
        A=C     A                                * 283AF
        ?A=0    S                                * 283B1
        GOYES   OBJ_28318.L4                     * 283B4
        LC(5)   FALSE                            * 283B6
OBJ_28318.L4:
        DAT1=C  A                                * 283BD
        PC=(A)                                   * 283C0
        RPL

* Drops rest of current stream, skipcola in the above.
* refs (8): 27E18 27E2C 27E40 27E54 69A77 69A8B ...
COLAskipcola:
        :: RDROPCOLA skipcola ;                  * 283C4

* Skips 3 objs in the runstream.
* refs (7): 27D0A 27D19 27D81 27E5E 69A40 69A5E ...
3SKIP:
        :: RSKIP RSKIP RSKIP ;                   * 283D8

* refs (19): 27440 27661 27693 2779C 277F1 27ED6 ...
* -> hxs-mask $ #next $token: the parser's tokenizer state, from lams 11..8
GetGNTData:
        :: 11GETLAM 10GETLAM 9GETLAM 8GETLAM ;   * 283F1

* refs (18): 276A7 27800 27AF3 27F80 2848C 686F7 ...
* hxs-mask $ #next $token -> : store the tokenizer state in lams 8..11
PutGNTData:
        :: 8PUTLAM 9PUTLAM 10PUTLAM 11PUTLAM ;   * 2840F

* refs (1): 27710
* The , in (x,y): next token ∡ selects polar form
AlgCmpSep:
        :: metatail NDROP GetGNTData DROP GetNextToken * 2842D
          :: tokanglesign tok8trior              * 2844B

* refs (3): 699F0 6F1B7 6F8C4
* -> ob: the parser's pseudo-command for a polar complex
'CmpPolarOp:
            :: ' ~CK2&Dispatch_2 ;               * 2845A

* refs (5): 69468 699D7 6F144 6F1F8 6F8B5
* -> ob: the parser's pseudo-command for a rectangular complex
'CmpRectOp:
            :: ' ~CK2&Dispatch ; ;               * 2846E
          5UNROLL PutGNTData #05060410h BINT0 BINT5 BINT4 BINT5 top& * 28487
          ~BINT0;1PUTLAM COLA AlgLoop            * 284AF
        ;                                        * 284BE

* refs (8): 27594 27747 277E7 27891 27968 27B8E ...
OBJ_284C3:
        :: OBJ_284E6 ?SEMI                       * 284C3
          7ROLL #1+ 7UNROLL ;                    * 284D2

* refs (1): 284C8
OBJ_284E6:
        CON(5)  (*)+5                            * 284E6  primitive code object
        ASSEMBLE
        LC(5)   BINT0                            * 284EB
        A=DAT1  A                                * 284F2
        ?C=A    A                                * 284F5
        GOYES   OBJ_284E6.L4                     * 284F8
        D1=D1+  10                               * 284FA
        A=DAT1  A                                * 284FD
        ?C=A    A                                * 28500
        GOYES   OBJ_284E6.L3                     * 28503
        D1=D1+  15                               * 28505
        C=DAT1  A                                * 28508
        LA(5)   xFCNAPPLY                        * 2850B
        ?C=A    A                                * 28515
        GOYES   OBJ_284E6.L1                     * 28518
        CD1EX                                    * 2851A
        D1=D1+  5                                * 2851D
        A=DAT1  A                                * 28520
        D1=C                                     * 28523
        LC(5)   CKINFARGS                        * 28526
        ?C#A    A                                * 2852D
        GOYES   OBJ_284E6.L2                     * 28530
OBJ_284E6.L1:
        D1=D1-  15                               * 28532
        D1=D1-  10                               * 28535
        LC(5)   FALSE                            * 28538
        A=C     A                                * 2853F
        PC=(A)                                   * 28541
OBJ_284E6.L2:
        D1=D1-  15                               * 28545
OBJ_284E6.L3:
        D1=D1-  10                               * 28548
OBJ_284E6.L4:
        LC(5)   TRUE                             * 2854B
        A=C     A                                * 28552
        PC=(A)                                   * 28554
        RPL

* ob ob' # -> #-1 ob ob'
* refs (9): 28179 281BA 28223 56D79 56D88 6F3DD ...
#1-UNROT:
        :: #1- 3UNROLL ;                         * 28558

* $ $' -> :: <ob1> ; -> :: $ <ob2> <rest> ;
* refs (20): 24FF0 273E6 273F5 27404 27413 27422 ...
tok=casedrop:
        :: tok8cktrior drop;dq COLASKIP ;        * 2856C

* refs (14): 1718F 181EB 24DF7 273D2 28576 34EE4 ...
drop;dq:
        :: DROP COLACOLA ;                       * 28585

* refs (1): 27B70
AlgOperator~1:
        :: BINT1 DUPDUP DUP OBJ_282FA 2DROP 6UNROLL 5DROP ; * 28599

* refs (2): 272A5 6C823
* -> ' x= code #0 #1 #4: the frame that starts an algebraic, as an = of lowest priority
AlgStartFrame:
        :: ' x= #00700h BINT0 BINT1 BINT4 ;      * 285C6

* refs (7): 27AD0 27CE7 688CD 68936 68AC6 68E54 ...
~BINT1;1PUTLAM:
        :: BINT1 1PUTLAM ;                       * 285EE

* refs (10): 2780A 27AAD 27C6A 284AF 68887 68F6C ...
~BINT0;1PUTLAM:
        :: BINT0 1PUTLAM ;                       * 28602

* refs (5): 27585 27738 27882 27959 27CA6
OBJ_28616:
        :: SWAP BINT2 #<> ?SEMI                  * 28616
          case                                   * 2862F
          :: OBJ_282B4 TRUE ;                    * 28634
          OBJ_282B4 FALSE ;                      * 28648

* refs (1): 280D4
ChkEvalNext?:
        :: 'R COLA ChkEval?                      * 28657
        ;                                        * 2866B

* refs (3): 28666 2899F 28B28
ChkEval?:
        :: NOTNUM? CLRNUM ERRSET ITE             * 28670
          :: EvalNoCK ERRTRAP ~CLRNUM;RDROP;FALSE CLRNUM TRUE ; * 28689
          :: EvalNoCK ERRTRAP ~SETNUM;RDROP;FALSE SETNUM TRUE ; * 286AC
        ;                                        * 286CF

* refs (1): 28698
~CLRNUM;RDROP;FALSE:
        :: CLRNUM RDROP FALSE ;                  * 286D4

* refs (1): 286BB
~SETNUM;RDROP;FALSE:
        :: SETNUM RDROP FALSE ;                  * 286ED

* refs (3): 24474 28747 3EFA5
* Parse a unit expression: a product of factors with optional ^ powers
UnitExpr:
        :: UnitTerm !*triand COLA UnitRest       * 28706
        ;                                        * 2871F

* refs (2): 2870B 28828
* A factor: a group in parentheses, or UnitAtom
UnitTerm:
        :: toklparen tok8trior UnitGroup UnitAtom ; * 28724

* refs (1): 28733
* ( expression )
UnitGroup:
        :: UnitExpr !*triand nultrior TrueTrue tokrparen tok8trior TrueTrue * 28742
          failed ;                               * 2876A

* refs (1): 28738
* A number, SQRT(...), SQ(...), INV(...) or a unit name
UnitAtom:
        :: ParseReal !*trior TrueTrue _SQRT_ tok8trior UnitSQRT _SQ_ * 28774
          tok8trior UnitSQ _INV_ tok8trior UnitINV COLA UnitName * 2879C
        ;                                        * 287BF

* refs (2): 2871A 28814
* Any number of * / ^ and their right-hand factors
UnitRest:
        :: nultrior TrueTrue                     * 287C4
          :: tok* tok8trior UnitMul tok/ tok8trior UnitDiv tok^ tok8trior * 287D3
            UnitPow FALSE ;                      * 28800
          !*trior UnitRest TrueTrue ;            * 2880F

* refs (5): 2887D 2889B 288FF 2892C 28959
* A factor with its powers
UnitPowTerm:
        :: UnitTerm !*triand COLA UnitPows       * 28823
        ;                                        * 2883C

* refs (2): 28837 28864
* Any number of ^ after a factor
UnitPows:
        :: tok^ tok8trior                        * 28841
          :: UnitPow !*triand COLA UnitPows      * 28850
          ;                                      * 28869
          TrueTrue ;                             * 2886E

* refs (1): 287E2
* * and its right-hand side
UnitMul:
        :: UnitPowTerm !*triand UnitApply x* ;   * 28878

* refs (1): 287F1
* / and its right-hand side
UnitDiv:
        :: UnitPowTerm !*triand UnitApply x/ ;   * 28896

* refs (3): 28800 28855 288C8
* ^ and its exponent: a number, or a negative number giving INV
UnitPow:
        :: tok- tok8trior                        * 288B4
          :: UnitPow !*triand UnitApply xINV ; ParseReal !*triand UnitApply * 288C3
          x^ ;                                   * 288F0

* refs (1): 28792
* SQRT(factor)
UnitSQRT:
        :: UnitPowTerm !*triand UnitApply xSQRT ; * 288FA

* refs (1): 287A1
* SQ(factor)
UnitSQ:
        :: toklparen tok=? !*triand UnitPowTerm !*triand UnitApply xSQ ; * 28918

* refs (1): 287B0
* INV(factor)
UnitINV:
        :: toklparen tok=? !*triand UnitPowTerm !*triand UnitApply xINV ; * 28945

* refs (8): 2447E 28887 288A5 288D2 288EB 28909 ...
* Apply the next stream object to the parsed operands under ChkEval?; a failure drops back to the marker and fails
UnitApply:
        :: {}_23989 BINT5 psh 'R SWAP#1+ larg rotswap DROP ChkEval? case * 28972
          :: ROTROT2DROP 6rolld;1+(s5) TrueTrue ; * 289A9
          BEGIN {}_23989 EQ UNTIL failed ;       * 289C2

* refs (1): 287BA
* $ -> : the token must be a unit's name
UnitName:
        :: DUP st=>uo? NOTcase failed            * 289E0
          SWAPDROP DaDGNTc ;                     * 289F9

* refs (1): 28788
_SQRT_:
        $ "SQRT"                                 * 28A08

* refs (1): 28797
_SQ_:
        $ "SQ"                                   * 28A1A

* refs (1): 287A6
_INV_:
        $ "INV"                                  * 28A28

* refs (1): 1FB0E
xFORMUNIT~name|local|algebraic:
        :: BINT2 nmetasyms ' Fmt>UnitOb parameval COLA x* * 28A38
        ;                                        * 28A60

* refs (2): 280CA 28A4C
* ob -> ob' flag: each element of an expression for →UNIT: names and functions to unit operators
Fmt>UnitOb:
        :: CK&DISPATCH0                          * 28A65
          BINT6 nm=>uo?                          * 28A6F  name
          BINT7 nm=>uo?                          * 28A79  local
          BINT8 Fmt>UnitWd                       * 28A83  program
          BINT15 Fmt>UnitRomp                    * 28A8D  romptr
          BINT0 TRUE                             * 28A97  any
        ;                                        * 28AA1

* refs (1): 28A92
* ROMPTR case: the name of a unit
Fmt>UnitRomp:
        :: ROMPTRDECOMP ?SKIP doerrB01           * 28AA6
          COLA nm=>uo?                           * 28ABA
        ;                                        * 28AC4

* refs (3): 28A74 28A7E 28ABF
nm=>uo?:
        :: ID>$ st=>uo? case TRUE                * 28AC9

* refs (4): 280E3 28AB5 28B14 28B23
doerrB01:
          :: # B01 ERRORSTO ERRJMP ; ;           * 28AE2  "Invalid Unit"

* refs (1): 28A88
* Word case: xFCNAPPLY and words with field 11 are error #B01; others must pass ChkEval?
Fmt>UnitWd:
        :: REQcasedrop xFCNAPPLY                 * 28B05
          doerrB01 CmdFieldB case doerrB01       * 28B14
          ChkEval? ?SKIP ERRJMP                  * 28B28
          TRUE ;                                 * 28B37

* refs (2): 34E85 68990
* symb -> ob1..obn #n: the pieces of an algebraic's text in order: tokens, names, numbers and operators. Lams: 4 flag, 3 limit, 2 pieces count (see 2Lam#+1), 1 failure flag. If it fails the result is 'Invalid Expression'.
Symb>Pieces:
        :: FALSE Symb>Pieces~1 ZEROFALSE ' NULLLAM BINT4 NDUPN DOBIND * 28B41
          DUPTYPESYMB? ITE Symb>Pieces~2 SdcNode * 28B6E
          2GETLAM #1<> 1GETLAM OR ITE SdcBad SdcDone * 28B82
          ABND ;                                 * 28BA5

* refs (1): 73024
Symb>Pieces~5:
        ::                                       * 28BAF

{{}}:
          { {}_600F3 } >R >R BEGIN nextsym'R DUP {}_600F3 EQ NOT_WHILE * 28BB4
          SdcNode REPEAT DROP ;                  * 28BEB

* refs (3): 28B7D 28BEB 73074
* Next node: an operator, a function, a unit, or an atom
SdcNode:
        :: subpdcdptch SdcFcn SdcNode~1 SdcUnit SdcCount1 drop;true;1Lput * 28BFF
          FnInfoWd NOTcase SdcCount1             * 28C22
          MINUSONE #=casedrop SdcVarArgs         * 28C31
          SdcOp ;                                * 28C40

* refs (5): 28C40 2922A 292A7 292BB 2940D
* An operator node: priorities and form from its descriptor, then its operands in order, with parentheses where needed
SdcOp:
        :: 2GETLAM 2DUP #>case SdcAtom           * 28C4A
          SdcOp~2 SdcAtom SdcOp~3 OBJ_26E61 DROP 5ROLL #2+ 6UNROLL 5ROLL * 28C63
          SWAP BINT1 BINT6 BINT7 7ROLL ITE SdcPrefix SdcInfix * 28C90
          BEGIN OBJ_282FA WHILE                  * 28CB8
          :: SWAP SdcOp~1 SdcArg Sdc( Sdc) Sdc= SdcSep SdcComma ; REPEAT * 28CC7
          SdcOp~4 ;                              * 28CFE

* refs (1): 28CD1
* Probably: #kind -> : selects which of the following stream objects handles this piece of the operator's form
SdcOp~1:
        CON(5)  (*)+5                            * 28D08  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 28D0D
        LC(5)   #00000                           * 28D14
        ?C=A    A                                * 28D1B
        GOYES   SdcOp~1.L1                       * 28D1E
        LC(1)   #2                               * 28D20
        ?C=A    A                                * 28D23
        GOYES   SdcOp~1.L1                       * 28D26
        LC(1)   #3                               * 28D28
        ?C=A    A                                * 28D2B
        GOYES   SdcOp~1.L1                       * 28D2E
        D0=D0+  5                                * 28D30
        LC(1)   #4                               * 28D33
        ?C=A    A                                * 28D36
        GOYES   SdcOp~1.L1                       * 28D39
        D0=D0+  5                                * 28D3B
        LC(1)   #5                               * 28D3E
        ?C=A    A                                * 28D41
        GOYES   SdcOp~1.L1                       * 28D44
        D0=D0+  5                                * 28D46
        LC(1)   #7                               * 28D49
        ?C=A    A                                * 28D4C
        GOYES   SdcOp~1.L1                       * 28D4F
        D0=D0+  5                                * 28D51
        LC(1)   #6                               * 28D54
        ?C#A    A                                * 28D57
        GOYES   SdcOp~1.L2                       * 28D5A
SdcOp~1.L1:
        LC(5)   COLA                             * 28D5C
        A=C     A                                * 28D63
        PC=(A)                                   * 28D65
SdcOp~1.L2:
        D0=D0+  5                                * 28D69
        D1=D1-  5                                * 28D6C
        D=D-1   A                                * 28D6F
SdcOp~1.L3:
        A=DAT0  A                                * 28D71
        D0=D0+  5                                * 28D74
        PC=(A)                                   * 28D77
        RPL

* refs (2): 28C5E 28C68
* Show ob as it stands
SdcAtom:
        :: 3DROP true;1Lput COLA SdcCount1       * 28D7B
        ;                                        * 28D94

* refs (1): 28C0E
SdcNode~1:
        :: BINT0 3GETLAM BINT3 2Lam#+1 ;         * 28D99

* refs (3): 28C18 28C2C 28D8F
* #... -> : count 1 piece
SdcCount1:
        :: BINT1 2Lam#+1 ;                       * 28DB7

* refs (1): 28C13
* A unit object: number, _ and the unit's text
SdcUnit:
        :: DUPLENCOMP BINT3 #<case drop;true;1Lput * 28DCB
          INNERCOMP SWAPDROP#1- pullrev tokuscore BINT2 psh AEQ1stcase um/ * 28DE4
          SdcUnitDiv UnitOps>Meta DUPZERO #>case * 28E0C

* refs (2): 28E8E 28EAC
* Unit operators don't parse: show the object plain
SdcUnit!:
          :: NDROP NDROP NDROP true;1Lput ;      * 28E20
          DROP                                   * 28E3E

* refs (1): 28ED4
* Finish a unit's text
SdcUnitEnd:
          :: top& #72109h OBJ_26E61 DROP ROTDROP BINT2 top& 2Lam#+1 ; ; * 28E43

* refs (1): 28E0C
* A unit with a / in it
SdcUnitDiv:
        :: SWAPDROP#1- UnitOps>Meta DUP#0=case SdcUnit! * 28E7A
          UnitOps>Meta DUPZERO #>case            * 28E93
          :: NDROP SdcUnit! ;                    * 28EA2
          DROP PTR addt: x/ psh SdcUnitParen top& SdcUnitEnd ; * 28EB6

* refs (1): 28ECA
* Add parentheses around a divisor product where implicit parentheses mode needs them
SdcUnitParen:
        :: EqwImplicit()? case ParenWrap         * 28EDE
          DUP #<3 ?SEMI                          * 28EF2
          3PICK REQcasedrop x*                   * 28F01
          ParenWrap DROPDUP #3= ?SEMI            * 28F10
          4PICK REQcasedrop x*                   * 28F24
          ParenWrap DROPDUP BINT4 #= ?SEMI       * 28F33
          5PICK REQcasedrop x*                   * 28F4C
          ParenWrap DROPDUP BINT5 #= ?SEMI       * 28F5B
          6PICK REQcasedrop x*                   * 28F74
          ParenWrap DROP ;                       * 28F83

* refs (5): 28EED 28F10 28F33 28F5B 28F83
* ( and ) around the pieces on the meta
ParenWrap:
        :: toklparen pshm1 top& tokrparen SWAP#1+ ; * 28F92

* refs (3): 28E11 28E84 28E93
* -> meta: turn unit operators into a text meta
UnitOps>Meta:
        :: pshzer UnitOp>Meta ;                  * 28FB5

* refs (7): 28FBF 2905A 29078 2908C 29091 290A5 ...
* One level of UnitOps>Meta, by operator
UnitOp>Meta:
        :: DUP#0=case true;1Lput                 * 28FC9
          AEQ1stcase um*                         * 28FD8
          UnitOp* AEQ1stcase um^                 * 28FE2
          UnitOp^ AEQ1stcase umP                 * 28FF1
          UnitOpPrefix pullpsh1& ;               * 29000

* refs (1): 28FE2
* um* as *
UnitOp*:
        :: UnitOpBinary x* ;                     * 2900F

* refs (1): 28FF1
* um^ as ^; with implicit parentheses mode, a power is put in parentheses
UnitOp^:
        :: EqwImplicit()? case UnitOp^()         * 29023
          UnitOpBinary x^ ;                      * 29037

* refs (1): 29032
* The parenthesised form of a unit power
UnitOp^():
        :: SWAPDROP#1- tokrparen psh1& UnitOp>Meta toklparen psh1& ' x^ * 29046
          psh1& UnitOp>Meta ;                    * 29073

* refs (1): 29000
* umP: a prefix joined to its unit
UnitOpPrefix:
        :: SWAPDROP#1- UnitOp>Meta UnitOp>Meta ; * 29082

* refs (2): 29014 29037
* A binary unit operator, the stream giving its symbol
UnitOpBinary:
        :: SWAPDROP#1- UnitOp>Meta 'R psh1& UnitOp>Meta ; * 2909B

* refs (1): 28BA0
* Finish: drop the working meta, adding ticks when wanted
SdcDone:
        :: DUP#1= ?SKIP 2pull2DROP               * 290BE
          get1 IT SdcTicks                       * 290D2
        ;                                        * 290E1

* refs (1): 28B9B
* 'Invalid Expression' in place of what can't be decompiled
SdcBad:
        :: 2GETLAM ZERO_DO NDROP LOOP DROP tok' $InvalidExpr tok' BINT3 ; * 290E6

* refs (1): 290DC
* ' at both ends of the output
SdcTicks:
        :: tok' SWAP#1+ tok' pshm1 top& ;        * 2911D

* refs (3): 28DAD 28DC1 28E6B
* -> : add one to the # in lam 2. ST0 selects the direction, so this shares code with 2Lam#-1.
2Lam#+1:
        CON(5)  (*)+5                            * 29140  primitive code object
        ASSEMBLE
        ST=1    0                                * 29145
2Lam#+1.L1:
        GOSBVL  SAVPTR                           * 29148
        D1=(5)  TEMPENV                          * 2914F
        A=DAT1  A                                * 29156
        LC(5)   #00019                           * 29159
        A=A+C   A                                * 29160
        R1=A.F  A                                * 29162
        D1=A                                     * 29168
        C=DAT1  A                                * 2916B
        D1=C                                     * 2916E
        D1=D1+  5                                * 29171
        A=DAT1  A                                * 29174
        ?ST=1   0                                * 29177
        GOYES   2Lam#+1.L2                       * 2917A
        A=A-1   A                                * 2917C
        GONC    2Lam#+1.L3                       * 2917E
2Lam#+1.L2:
        A=A+1   A                                * 29181
2Lam#+1.L3:
        R0=A.F  A                                * 29183
        GOSBVL  PUSH#                            * 29189
        C=DAT1  A                                * 29190
        D=D+1   A                                * 29193
        D1=D1+  5                                * 29195
        A=R1.F  A                                * 29198
        AD1EX                                    * 2919E
        DAT1=C  A                                * 291A1
        D1=A                                     * 291A4
        GOTO    SdcOp~1.L3                       * 291A7

* refs (3): 291E9 291EE 29403
* -> : subtract one from the # in lam 2
2Lam#-1:
        CON(5)  (*)+5                            * 291AB  primitive code object
        ST=0    0                                * 291B0
        GOTO    2Lam#+1.L1                       * 291B3
        RPL

* refs (1): 28C09
* A function call with xFCNAPPLY: name and arguments in parentheses
SdcFcn:
        :: DROP 2GETLAM BINT3 #<case true;1Lput  * 291B7
          SdcFcn~1 case true;1Lput               * 291D5
          DROPSWAPDROP 2Lam#-1 2Lam#-1 SWAP NOTROMPcase SdcFcn2 * 291E4

* refs (1): 27070
* Resolve a ROMPTR
RompNoAcc:
          :: DUPROMPTR@ COLANOTcase ;            * 29202

* refs (1): 291FD
* Function with the standard function descriptor
SdcFcn2:
          :: #0590410h ROT COLA SdcOp            * 29216
          ;                                      * 2922F
          DROPSWAP OVER ?OKINALG NOTcase         * 29234

3dropn;true;1Lput:
          :: 3DROP true;1Lput ;                  * 29248
          3PICK EQUALNOTcase drop2;true;1Lput    * 2925C
          SWAP FnInfoRomp NOTcase                * 2926B

* refs (5): 29266 293B3 293C7 293DB 293EF
drop2;true;1Lput:
          :: 2DROP true;1Lput ;                  * 2927A
          MINUSONE #=casedrop                    * 2928E
          :: ROT COLA SdcOp                      * 29298
          ;                                      * 292AC
          4ROLLOVER #=casedrop SdcOp             * 292B1
          4DROP true;1Lput ;                     * 292C0

* refs (9): 28D85 28E34 28FD3 291D0 291DF 29252 ...
true;1Lput:
        :: TRUE 1PUTLAM ;                        * 292CF

* refs (2): 28C1D 28DDF
drop;true;1Lput:
        :: DROP true;1Lput ;                     * 292E3

* refs (1): 291D5
SdcFcn~1:
        CON(5)  (*)+5                            * 292F7  primitive code object
        ASSEMBLE
        CD1EX                                    * 292FC
        RSTK=C                                   * 292FF
        D1=C                                     * 29301
        C=DAT1  A                                * 29304
        CD1EX                                    * 29307
        D1=D1+  5                                * 2930A
        A=DAT1  A                                * 2930D
        D1=C                                     * 29310
        A=A-1   A                                * 29313
        ?A=0    A                                * 29315
        GOYES   SdcFcn~1.L3                      * 29318
SdcFcn~1.loop1:
        LC(5)   TRUE                             * 2931A
SdcFcn~1.loop2:
        A=C     A                                * 29321
        C=RSTK                                   * 29323
        D1=C                                     * 29325
        PC=(A)                                   * 29328
SdcFcn~1.L3:
        GOSUB   Next#Level                       * 2932C
        ?A=0    A                                * 29330
        GOYES   SdcFcn~1.loop1                   * 29333
        D1=D1-  5                                * 29335
        A=DAT1  A                                * 29338
        D1=C                                     * 2933B
        LC(5)   DOBINT                           * 2933E
        ?C#A    A                                * 29345
        GOYES   SdcFcn~1.loop1                   * 29348
        GOSUB   Next#Level                       * 2934A
        D1=C                                     * 2934E
        A=A-1   A                                * 29351
        ?A#0    A                                * 29353
        GOYES   SdcFcn~1.loop1                   * 29356
        D1=D1+  5                                * 29358
        C=DAT1  A                                * 2935B
        CD1EX                                    * 2935E
        A=DAT1  A                                * 29361
        LC(5)   DOIDNT                           * 29364
        ?C=A    A                                * 2936B
        GOYES   SdcFcn~1.L4                      * 2936E
        LC(5)   DOLAM                            * 29370
        ?C=A    A                                * 29377
        GOYES   SdcFcn~1.L4                      * 2937A
        LC(5)   DOROMP                           * 2937C
        ?C#A    A                                * 29383
        GOYES   SdcFcn~1.loop1                   * 29386
SdcFcn~1.L4:
        LC(5)   FALSE                            * 29388
        GOTO    SdcFcn~1.loop2                   * 2938F

* refs (4): 2932C 2934A 29586 2958F
* D1 = stack level -> D1 in the # at the next level, A.A = the # itself, C.A = the level's address
Next#Level:
        D1=D1+  5                                * 29393
        C=DAT1  A                                * 29396
        CD1EX                                    * 29399
        D1=D1+  5                                * 2939C
        A=DAT1  A                                * 2939F
        RTN                                      * 293A2
        RPL

* refs (1): 28C3B
* A function with a variable number of arguments (count -1): the real count is a # in the symbolic
SdcVarArgs:
        :: 2GETLAM #0=case drop2;true;1Lput      * 293A4
          3PICK BINT1 #<>case drop2;true;1Lput   * 293B8
          4PICK BINT0 #=casedrop drop2;true;1Lput * 293CC
          DUP TYPEBINT? NOTcasedrop drop2;true;1Lput * 293E0
          BINT3 psh #1+NDROP 2Lam#-1 COLA SdcOp  * 293F4
        ;                                        * 29412

* refs (1): 28CD6
* Operand of an operator, put in parentheses if its priority is below this operator's
SdcArg:
        :: 4Pick#+1 BINT9 ROLL DUP #1- 10UNROLL ONESWAP N+1roll get1 DROP * 29417
          get1 OVER #1= casedrop psh&            * 2944E
          SWAP #2- 4UNROLL case2drop psh&        * 29467
          SdcArg~1 SdcParens psh& ;              * 29480

* refs (1): 28CDB
* Add a ( to the output
Sdc(:
        :: SdcTok toklparen ;                    * 29494

* refs (4): 29499 294D0 294E4 294F8
* Add a token from the stream to the output
SdcTok:
        :: DROP 'R psh1&rev ROT#1+ 3UNROLL ;     * 294A8

* refs (1): 28CE0
* Add a ) to the output
Sdc):
        :: SdcTok tokrparen ;                    * 294CB

* refs (1): 28CE5
* Add an = to the output
Sdc=:
        :: SdcTok tok= ;                         * 294DF

* refs (1): 28CEA
* Add a separator; complex form with ∡ when lam 4 says so
SdcSep:
        :: SdcTok tok; 4GETLAM NOT?SEMI          * 294F3
          tokanglesign psh1&rev FALSE 4PUTLAM ;  * 2950C

* refs (1): 28CEF
* A separator between function arguments
SdcComma:
        :: SWAPDROP 4Pick#+1 8PICK #0=case DROP  * 29525
          8ROLL #1- 8UNROLL BINT7 #- 4ROLL SWAP#- 3UNROLL tok; psh1&rev ; * 29543

* refs (1): 28C63
* Probably: code that scans an operator's form descriptor backwards to find how its operands are placed
SdcOp~2:
        CON(5)  (*)+5                            * 2957A  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 2957F
        GOSUB   Next#Level                       * 29586
        D1=C                                     * 2958A
        B=A     A                                * 2958D
        GOSUB   Next#Level                       * 2958F
        C=A     A                                * 29593
        C=C-CON A,8                              * 29595
        D=C     A                                * 2959B
        CD1EX                                    * 2959D
        C=C+A   A                                * 295A0
        D1=C                                     * 295A2
        D1=D1-  2                                * 295A5
        B=0     S                                * 295A8
        C=0     S                                * 295AB
        P=      8                                * 295AE
        CPEX    15                               * 295B0
        A=C     S                                * 295B4
        D=0     S                                * 295B7
SdcOp~2.loop1:
        C=DAT1  S                                * 295BA
        P=C     15                               * 295BE
        ?P=     0                                * 295C2
        GOYES   SdcOp~2.L5                       * 295C5
        ?P=     2                                * 295C7
        GOYES   SdcOp~2.L5                       * 295CA
        ?P=     3                                * 295CC
        GOYES   SdcOp~2.L5                       * 295CF
        C=C-A   S                                * 295D1
        GOC     SdcOp~2.loop2                    * 295D4
        B=C     S                                * 295D7
        B=B+1   S                                * 295DA
SdcOp~2.loop2:
        D1=D1-  1                                * 295DD
        D=D-1   A                                * 295E0
        GOC     SdcOp~2.L3                       * 295E2
        ?B=0    S                                * 295E5
        GOYES   SdcOp~2.loop1                    * 295E8
        B=B-1   S                                * 295EA
        GONC    SdcOp~2.loop1                    * 295ED
SdcOp~2.L3:
        A=0     A                                * 295F0
        ?B=0    A                                * 295F2
        GOYES   SdcOp~2.L7                       * 295F5
        ?D=0    S                                * 295F7
        GOYES   SdcOp~2.L6                       * 295FA
        C=D     S                                * 295FC
        C=0     A                                * 295FF
        CPEX    15                               * 29601
        CPEX    0                                * 29605
SdcOp~2.loop4:
        A=A+1   A                                * 29609
        B=B-C   A                                * 2960B
        GOC     SdcOp~2.L6                       * 2960D
        ?B=0    A                                * 29610
        GOYES   SdcOp~2.L7                       * 29613
        GONC    SdcOp~2.loop4                    * 29615
SdcOp~2.L5:
        B=B-1   A                                * 29618
        GOC     SdcOp~2.L6                       * 2961A
        ?B=0    S                                * 2961D
        GOYES   SdcOp~2.loop2                    * 29620
        D=D+1   S                                * 29622
        GOTO    SdcOp~2.loop2                    * 29625
SdcOp~2.L6:
        P=      0                                * 29629
        GOSBVL  GETPTR                           * 2962B
        LC(5)   COLA                             * 29632
        A=C     A                                * 29639
        PC=(A)                                   * 2963B
SdcOp~2.L7:
        P=      0                                * 2963F
        R0=A.F  A                                * 29641
        GOSBVL  PUSH#                            * 29647
        LC(5)   SKIP                             * 2964E
        A=C     A                                * 29655
        PC=(A)                                   * 29657
        RPL

* refs (1): 28CB3
* Set up for an infix operator
SdcInfix:
        :: ROTDROP BINT2 3UNROLL DUP #3+PICK ' ~CK2&Dispatch_2 EQ 4PUTLAM ; * 2965B

* refs (1): 28CAE
* Set up for a prefix function
SdcPrefix:
        :: ROTDROP BINT3 3UNROLL 8ROLL #1-DUP 9rolld N+1roll BINT1 * 29692
          #=casedrop psh1&                       * 296BF
          #2- 3UNROLL SdcPrefix~1                * 296C9

* refs (1): 29485
* Parentheses around an argument
SdcParens:
          :: tokrparen SWAP#1+ toklparen BINT1 pshtop& ; unrot over& ; * 296D8

* refs (1): 29109
* $ "Invalid Expression": what the stack shows for an algebraic that can't be decompiled
$InvalidExpr:
        $ "Invalid Expression"                   * 2970A

* refs (1): 296D3
* Probably: code: as the routine at #29829 for a prefix operand
SdcPrefix~1:
        CON(5)  (*)+5                            * 29738  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 2973D
        C=DAT1  A                                * 29740
        R2=C.F  A                                * 29743
        D1=D1-  5                                * 29749
        GOSBVL  POP2#                            * 2974C
        R0=C.F  A                                * 29753
        R1=A.F  A                                * 29759
        GOSUB   PrecFlag?                        * 2975F
        GONC    SdcPrefix~1.L2                   * 29763
SdcPrefix~1.L1:
        A=R0.F  A                                * 29766
        ?A#0    A                                * 2976C
        GOYES   SdcPrefix~1.L3                   * 2976F
        A=R1.F  A                                * 29771
        ?A=0    A                                * 29777
        GOYES   SdcPrefix~1.loop4                * 2977A
        GONC    SdcPrefix~1.L3                   * 2977C
SdcPrefix~1.L2:
        GOSUB   #PickAddr                        * 2977F
        RSTK=C                                   * 29783
        D1=D1+  10                               * 29785
        C=DAT1  A                                * 29788
        CD1EX                                    * 2978B
        D1=D1+  5                                * 2978E
        A=DAT1  A                                * 29791
        D1=C                                     * 29794
        C=R0.F  A                                * 29797
        ?C=0    A                                * 2979D
        GOYES   SdcPrefix~1.L5                   * 297A0
        ?C>=A   A                                * 297A2
        GOYES   SdcPrefix~1.L5                   * 297A5
        C=RSTK                                   * 297A7
        D1=C                                     * 297A9
SdcPrefix~1.L3:
        A=DAT0  A                                * 297AC
        D0=D0+  5                                * 297AF
        PC=(A)                                   * 297B2
SdcPrefix~1.loop4:
        LC(5)   SKIP                             * 297B6
        A=C     A                                * 297BD
        PC=(A)                                   * 297BF
SdcPrefix~1.L5:
        C=R1.F  A                                * 297C3
        ?C=0    A                                * 297C9
        GOYES   SdcPrefix~1.L6                   * 297CC
        ?A=0    A                                * 297CE
        GOYES   SdcPrefix~1.L6                   * 297D1
        ?C>=A   A                                * 297D3
        GOYES   SdcPrefix~1.L6                   * 297D6
        C=R2.F  A                                * 297D8
        DAT1=C  A                                * 297DE
SdcPrefix~1.L6:
        C=RSTK                                   * 297E1
        D1=C                                     * 297E3
        GOTO    SdcPrefix~1.loop4                * 297E6

* refs (2): 2977F 29855
* D1 at a # n -> A.A = the address of stack level n+5 above it
#PickAddr:
        C=DAT1  A                                * 297EA
        CD1EX                                    * 297ED
        RSTK=C                                   * 297F0
        D1=D1+  5                                * 297F2
        A=DAT1  A                                * 297F5
        A=A+CON A,4                              * 297F8
        C=A     A                                * 297FE
        A=A+A   A                                * 29800
        A=A+A   A                                * 29802
        A=A+C   A                                * 29804
        C=RSTK                                   * 29806
        A=A+C   A                                * 29808
        D1=A                                     * 2980A
        RTN                                      * 2980D

* refs (2): 2975F 2984A
* -> carry set when flag -53 is set (precedence shown with all parentheses)
PrecFlag?:
        LC(5)   #80850                           * 2980F
        CD1EX                                    * 29816
        A=DAT1  1                                * 29819
        D1=C                                     * 2981D
        ?ABIT=1 0                                * 29820
        RTNYES                                   * 29825
        RTN                                      * 29827

* refs (1): 29480
* Probably: code: ob #a #b -> ob flag: parentheses are needed for this operand (depends on flag -53)
SdcArg~1:
        CON(5)  (*)+5                            * 29829  primitive code object
        C=DAT1  A                                * 2982E
        R2=C.F  A                                * 29831
        GOSBVL  POP2#                            * 29837
        R1=C.F  A                                * 2983E
        R0=A.F  A                                * 29844
        GOSUB   PrecFlag?                        * 2984A
        GONC    SdcArg~1.L1                      * 2984E
        GOTO    SdcPrefix~1.L1                   * 29851
SdcArg~1.L1:
        GOSUB   #PickAddr                        * 29855
        RSTK=C                                   * 29859
        C=DAT1  A                                * 2985B
        CD1EX                                    * 2985E
        D1=D1+  5                                * 29861
        A=DAT1  A                                * 29864
        D1=C                                     * 29867
        C=R0.F  A                                * 2986A
        ?C=0    A                                * 29870
        GOYES   SdcArg~1.L2                      * 29873
        ?C>A    A                                * 29875
        GOYES   SdcArg~1.L2                      * 29878
        C=RSTK                                   * 2987A
        D1=C                                     * 2987C
        GOTO    SdcPrefix~1.L3                   * 2987F
SdcArg~1.L2:
        C=R1.F  A                                * 29883
        ?C=0    A                                * 29889
        GOYES   SdcArg~1.L3                      * 2988C
        ?A=0    A                                * 2988E
        GOYES   SdcArg~1.L3                      * 29891
        ?C>=A   A                                * 29893
        GOYES   SdcArg~1.L3                      * 29896
        C=R2.F  A                                * 29898
        DAT1=C  A                                * 2989E
SdcArg~1.L3:
        C=RSTK                                   * 298A1
        D1=C                                     * 298A3
        GOTO    SdcPrefix~1.loop4                * 298A6
        RPL

* refs (1): 34FED
* Probably: saves a meta on the stack into a hex string of relative pointers
OBJ_298AA:
        :: NULLHXS 3PICK BINT5 #* EXPAND SWAP OBJ_298D7 ; * 298AA

* refs (1): 298CD
* Probably: code part of the saving of a meta into a hex string
OBJ_298D7:
        CON(5)  (*)+5                            * 298D7  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 298DC
        C=DAT1  A                                * 298E3
        R0=C.F  A                                * 298E6
        D1=D1+  5                                * 298EC
        C=DAT1  A                                * 298EF
        D0=C                                     * 298F2
        D1=D1+  5                                * 298F5
        C=DAT1  A                                * 298F8
        CD1EX                                    * 298FB
        D1=D1+  5                                * 298FE
        A=DAT1  A                                * 29901
        D1=C                                     * 29904
        R1=A.F  A                                * 29907
        B=A     A                                * 2990D
        D0=D0+  5                                * 2990F
        C=DAT0  A                                * 29912
        AD0EX                                    * 29915
        A=A+C   A                                * 29918
        D0=A                                     * 2991A
        B=B-1   A                                * 2991D
        LC(5)   CMOS                             * 2991F
        D=C     A                                * 29926
OBJ_298D7.loop1:
        D1=D1+  5                                * 29928
        D0=D0-  5                                * 2992B
        C=DAT1  A                                * 2992E
        ?D<=C   A                                * 29931
        GOYES   OBJ_298D7.L3                     * 29934
OBJ_298D7.loop2:
        DAT0=C  A                                * 29936
        B=B-1   A                                * 29939
        GONC    OBJ_298D7.loop1                  * 2993B
        D0=D0-  10                               * 2993E
        CD0EX                                    * 29941
        DAT1=C  A                                * 29944
        LC(5)   DSKTOP                           * 29947
        CD1EX                                    * 2994E
        DAT1=C  A                                * 29951
        GOSBVL  GETPTR                           * 29954
        C=R1.F  A                                * 2995B
        C=C+CON A,2                              * 29961
        D=D+C   A                                * 29967
        A=DAT0  A                                * 29969
        D0=D0+  5                                * 2996C
        PC=(A)                                   * 2996F
OBJ_298D7.L3:
        A=R0.F  A                                * 29973
        A=A-C   A                                * 29979
        GONC    OBJ_298D7.L4                     * 2997B
        C=A     A                                * 2997E
        A=A+A   A                                * 29980
        GOC     OBJ_298D7.loop2                  * 29982
OBJ_298D7.L4:
        GOSBVL  GETPTR                           * 29985
        GOVLNG  DOMEMERR                         * 2998C

* refs (1): 34EDA
* Probably: hxs -> ob1..obn #n: expands such a hex string of relative pointers back onto the stack, garbage-collecting once for room
OBJ_29993:
        CON(5)  (*)+5                            * 29993  primitive code object
        GOSBVL  SAVPTR                           * 29998
        ST=0    4                                * 2999F
OBJ_29993.loop1:
        D1=D1+  5                                * 299A2
        C=DAT1  A                                * 299A5
        CD1EX                                    * 299A8
        D=C     A                                * 299AB
        D1=D1+  5                                * 299AD
        A=DAT1  A                                * 299B0
        B=A     A                                * 299B3
        GOSBVL  ROOM                             * 299B5
        ?B<C    A                                * 299BC
        GOYES   OBJ_29993.L3                     * 299BF
        ?ST=0   4                                * 299C1
        GOYES   OBJ_29993.L2                     * 299C4
        GOSBVL  GETPTR                           * 299C6
        GOVLNG  DOMEMERR                         * 299CD
OBJ_29993.L2:
        GOSBVL  GARBAGECOL                       * 299D4
        D1=(5)  DSKTOP                           * 299DB
        C=DAT1  A                                * 299E2
        D1=C                                     * 299E5
        ST=1    4                                * 299E8
        GOTO    OBJ_29993.loop1                  * 299EB
OBJ_29993.L3:
        C=D     A                                * 299EF
        D0=C                                     * 299F1
        D0=D0-  5                                * 299F4
        A=DAT0  A                                * 299F7
        D0=D0+  5                                * 299FA
        D1=D1+  9                                * 299FD
        B=B-CON A,10                             * 29A00
        D=0     A                                * 29A06
OBJ_29993.loop4:
        C=DAT1  S                                * 29A08
        D1=D1-  4                                * 29A0C
        C=DAT1  A                                * 29A0F
        C=C+C   S                                * 29A12
        GONC    OBJ_29993.L5                     * 29A15
        C=A-C   A                                * 29A18
OBJ_29993.L5:
        DAT0=C  A                                * 29A1A
        D0=D0-  5                                * 29A1D
        D1=D1+  9                                * 29A20
        D=D+1   A                                * 29A23
        B=B-CON A,5                              * 29A25
        GONC    OBJ_29993.loop4                  * 29A2B
        D0=D0+  5                                * 29A2E
        D1=(5)  DSKTOP                           * 29A31
        CD0EX                                    * 29A38
        DAT1=C  A                                * 29A3B
        C=D     A                                * 29A3E
        R0=C                                     * 29A40
        GOSBVL  ADJMEM                           * 29A43
        GOVLNG  PUSH#LOOP                        * 29A4A

* refs (1): 28B4B
Symb>Pieces~1:
        CON(5)  (*)+5                            * 29A51  primitive code object
        LC(5)   #8010h+5                         * 29A56  moved into D1
        CD1EX                                    * 29A5D
        A=DAT1  A                                * 29A60
        A=A-1   A                                * 29A63
        CD1EX                                    * 29A65
        A=A+C   A                                * 29A68
        AD1EX                                    * 29A6A
        C=0     A                                * 29A6D
        C=DAT1  1                                * 29A6F
        D1=A                                     * 29A73
        C=C+C   A                                * 29A76
        A=C     A                                * 29A78
        A=A+A   A                                * 29A7A
        A=A+A   A                                * 29A7C
        A=A+C   A                                * 29A7E
        LC(5)   BINT0                            * 29A80
        A=A+C   A                                * 29A87
        PC=(A)                                   * 29A89

* refs (2): 28BD2 730E6
nextsym'R:
        CON(5)  (*)+5                            * 29A8D  primitive code object
        C=B     A                                * 29A92
        CD0EX                                    * 29A94
        RSTK=C                                   * 29A97
        D0=D0-  10                               * 29A99
nextsym'R.loop1:
        C=DAT0  A                                * 29A9C
        CD0EX                                    * 29A9F
        A=DAT0  A                                * 29AA2
        D0=C                                     * 29AA5
nextsym'R.L2:
        LC(5)   SEMI                             * 29AA8
        ?C#A    A                                * 29AAF
        GOYES   nextsym'R.L3                     * 29AB2
        D0=D0+  5                                * 29AB4
        A=DAT0  A                                * 29AB7
        D0=D0-  5                                * 29ABA
        DAT0=A  A                                * 29ABD
        D0=D0-  5                                * 29AC0
        B=B-CON A,5                              * 29AC3
        D=D+1   A                                * 29AC9
        GONC    nextsym'R.loop1                  * 29ACB
nextsym'R.L3:
        LC(5)   DOSYMB                           * 29ACE
        ?C#A    A                                * 29AD5
        GOYES   nextsym'R.L4                     * 29AD8
        GOSUB   TakeWord                         * 29ADA
        A=DAT0  10                               * 29ADE
        A=A+CON A,5                              * 29AE2
        D0=D0+  5                                * 29AE8
        DAT0=A  10                               * 29AEB
        B=B+CON A,5                              * 29AEF
        D0=D0-  5                                * 29AF5
        A=DAT0  A                                * 29AF8
        AD0EX                                    * 29AFB
        R0=A.F  A                                * 29AFE
        GOSBVL  SKIPOB                           * 29B04
        A=R0.F  A                                * 29B0B
        AD0EX                                    * 29B11
        DAT0=A  A                                * 29B14
        D0=D0+  5                                * 29B17
        GOTO    nextsym'R.loop1                  * 29B1A
nextsym'R.L4:
        GOSUB   TakeWord                         * 29B1E
        C=DAT0  A                                * 29B22
        R0=C.F  A                                * 29B25
        CD0EX                                    * 29B2B
        R1=C.F  A                                * 29B2E
        GOSBVL  SKIPOB                           * 29B34
        A=R0.F  A                                * 29B3B
        C=R1.F  A                                * 29B41
        CD0EX                                    * 29B47
        DAT0=C  A                                * 29B4A
        C=C-CON A,5                              * 29B4D
        ?C#A    A                                * 29B53
        GOYES   nextsym'R.L5                     * 29B56
        D0=A                                     * 29B58
        A=DAT0  A                                * 29B5B
nextsym'R.L5:
        D1=D1-  5                                * 29B5E
        DAT1=A  A                                * 29B61
        C=RSTK                                   * 29B64
        D0=C                                     * 29B66
        A=DAT0  A                                * 29B69
        D0=D0+  5                                * 29B6C
        PC=(A)                                   * 29B6F

* refs (2): 29ADA 29B1E
* Take a stack word (D.A - 1); when none is left, garbage-collect, keeping D0 and two return addresses across it
TakeWord:
        ST=0    7                                * 29B73
TakeWord.loop1:
        D=D-1   A                                * 29B76
        RTNNC                                    * 29B78
        C=RSTK                                   * 29B7B
        A=C     A                                * 29B7D
        C=RSTK                                   * 29B7F
        D0=C                                     * 29B81
        CAEX    A                                * 29B84
        RSTK=C                                   * 29B86
        ?ST=0   7                                * 29B88
        GOYES   TakeWord.L2                      * 29B8B
        GOVLNG  DOMEMERR                         * 29B8D
TakeWord.L2:
        GOSBVL  SAVPTR                           * 29B94
        GOSBVL  GARBAGECOL                       * 29B9B
        GOSBVL  GETPTR                           * 29BA2
        A=B     A                                * 29BA9
        AD0EX                                    * 29BAB
        D0=D0-  10                               * 29BAE
        C=RSTK                                   * 29BB1
        CAEX    A                                * 29BB3
        RSTK=C                                   * 29BB5
        CAEX    A                                * 29BB7
        RSTK=C                                   * 29BB9
        ST=1    7                                * 29BBB
        GOTO    TakeWord.loop1                   * 29BBE

* refs (1): 28C04
subpdcdptch:
        CON(5)  (*)+5                            * 29BC2  primitive code object
        A=DAT1  A                                * 29BC7
        LC(5)   xFCNAPPLY                        * 29BCA
        ?C=A    A                                * 29BD1
        GOYES   subpdcdptch.loop2                * 29BD4
        D0=D0+  5                                * 29BD6
        AD1EX                                    * 29BD9
        C=DAT1  A                                * 29BDC
        D1=(5)  DOREAL                           * 29BDF
        AD1EX                                    * 29BE6
        ?C#A    A                                * 29BE9
        GOYES   subpdcdptch.L1                   * 29BEC
        A=DAT1  A                                * 29BEE
        AD1EX                                    * 29BF1
        D1=D1+  5                                * 29BF4
        D1=D1+  15                               * 29BF7
        C=DAT1  S                                * 29BFA
        D1=A                                     * 29BFE
        ?C#0    S                                * 29C01
        GOYES   subpdcdptch.loop2                * 29C04
        D0=D0+  10                               * 29C06
        GOTO    subpdcdptch.loop2                * 29C09
subpdcdptch.L1:
        D0=D0+  5                                * 29C0D
        A=C     A                                * 29C10
        LC(5)   DOEXT                            * 29C12
        ?C=A    A                                * 29C19
        GOYES   subpdcdptch.loop2                * 29C1C
        D0=D0+  5                                * 29C1E
        LC(5)   DOCOL                            * 29C21
        ?C#A    A                                * 29C28
        GOYES   subpdcdptch.loop2                * 29C2B
        D0=D0+  5                                * 29C2D
        A=DAT1  A                                * 29C30
        LC(5)   CMOS                             * 29C33
        ?C<=A   A                                * 29C3A
        GOYES   subpdcdptch.loop2                * 29C3D
        AD1EX                                    * 29C3F
        D1=D1-  7                                * 29C42
        C=DAT1  4                                * 29C45
        D1=A                                     * 29C49
        ?CBIT=0 3                                * 29C4C
        GOYES   subpdcdptch.L3                   * 29C51
subpdcdptch.loop2:
        LC(5)   COLA                             * 29C53
        A=C     A                                * 29C5A
        PC=(A)                                   * 29C5C
subpdcdptch.L3:
        CSR     A                                * 29C60
        A=C     X                                * 29C62
        LC(3)   #002                             * 29C65
        ?C#A    X                                * 29C6A
        GOYES   subpdcdptch.loop2                * 29C6D
        D0=D0+  5                                * 29C6F
        A=DAT0  A                                * 29C72
        D0=D0+  5                                * 29C75
        PC=(A)                                   * 29C78

* refs (2): 2941C 2952F
* -> #: the # in level 4 plus one
4Pick#+1:
        CON(5)  (*)+5                            * 29C7C  primitive code object
        GOSBVL  SAVPTR                           * 29C81
        D1=D1+  15                               * 29C88
        C=DAT1  A                                * 29C8B
        CD1EX                                    * 29C8E
        D1=D1+  5                                * 29C91
        A=DAT1  A                                * 29C94
        D1=C                                     * 29C97
        D1=D1-  15                               * 29C9A
        A=A+1   A                                * 29C9D
        R0=A.F  A                                * 29C9F
        GOSBVL  PUSH#                            * 29CA5
        C=DAT1  A                                * 29CAC
        D=D+1   A                                * 29CAF
        D1=D1+  15                               * 29CB1
        D1=D1+  5                                * 29CB4
        DAT1=C  A                                * 29CB7
        D1=D1-  15                               * 29CBA
        A=DAT0  A                                * 29CBD
        D0=D0+  5                                * 29CC0
        PC=(A)                                   * 29CC3

* refs (1): 28C6D
SdcOp~3:
        CON(5)  (*)+5                            * 29CC7  primitive code object
        D=D-1   A                                * 29CCC
        GONC    SdcOp~3.L1                       * 29CCE
        GOSBVL  SAVPTR                           * 29CD1
        GOSBVL  GARBAGECOL                       * 29CD8
        GOSBVL  GETPTR                           * 29CDF
        D=D-1   A                                * 29CE6
        GONC    SdcOp~3.L1                       * 29CE8
        D=D+1   A                                * 29CEB
        GOVLNG  DOMEMERR                         * 29CED
SdcOp~3.L1:
        D1=D1-  5                                * 29CF4
        GOSBVL  SAVPTR                           * 29CF7
        D1=D1+  10                               * 29CFE
        C=DAT1  A                                * 29D01
        B=C     A                                * 29D04
        D1=D1+  5                                * 29D06
        A=DAT1  10                               * 29D09
        D1=D1+  5                                * 29D0D
        LC(5)   BINT1                            * 29D10
        DAT1=C  A                                * 29D17
        D1=D1-  10                               * 29D1A
        DAT1=A  10                               * 29D1D
        D1=D1+  5                                * 29D21
        C=DAT1  A                                * 29D24
        D1=D1-  15                               * 29D27
        DAT1=C  A                                * 29D2A
        D1=A                                     * 29D2D
        D1=D1+  5                                * 29D30
        A=DAT1  A                                * 29D33
        C=B     A                                * 29D36
        D1=C                                     * 29D38
        D1=D1+  5                                * 29D3B
        C=DAT1  A                                * 29D3E
        C=C-A   A                                * 29D41
        C=C+1   A                                * 29D43
        R0=C.F  A                                * 29D45
        GOSBVL  PUSH#                            * 29D4B
        LC(5)   2PUTLAM                          * 29D52
        A=C     A                                * 29D59
        PC=(A)                                   * 29D5B

* refs (1): 28CFE
SdcOp~4:
        CON(5)  (*)+5                            * 29D5F  primitive code object
        D1=D1+  15                               * 29D64
        A=DAT1  A                                * 29D67
        R1=A.F  A                                * 29D6A
        D1=D1+  10                               * 29D70
        A=DAT1  A                                * 29D73
        D1=D1+  15                               * 29D76
        C=DAT1  A                                * 29D79
        DAT1=A  A                                * 29D7C
        D1=D1-  5                                * 29D7F
        A=R1.F  A                                * 29D82
        DAT1=A  A                                * 29D88
        CAEX    A                                * 29D8B
        GOSBVL  SAVPTR                           * 29D8D
        D1=A                                     * 29D94
        D1=D1+  5                                * 29D97
        A=DAT1  A                                * 29D9A
        A=A+1   A                                * 29D9D
        A=A+1   A                                * 29D9F
        R0=A.F  A                                * 29DA1
        GOVLNG  PUSH#LOOP                        * 29DA7

        LENGTH                                   * 29DAE  library object without its prolog (its place is the end of the link table before): length, to #2C081
        CON(2)  0                                * 29DB3  no title

LIB003:
        CON(3)  #003                             * 29DB5  library number
        CON(5)  0                                * 29DB8  hash table
        REL(5)  LIB003.message                   * 29DBD  message table
        CON(5)  0                                * 29DC2  link table
        CON(5)  0                                * 29DC7  config

* Error 301h
POSFLOWERR:
        CON(5)  (*)+5                            * 29DCC  primitive code object

* refs (1): 29DCC
DoErrPU:
        LC(5)   posunferr                        * 29DD1  "Positive Underflow"
        GOTO    DoErrIR.L1                       * 29DD8

* Error 302h
NEGFLOWERR:
        CON(5)  (*)+5                            * 29DDC  primitive code object

* refs (1): 29DDC
DoErrNU:
        LC(5)   negunferr                        * 29DE1  "Negative Underflow"
        GOTO    DoErrIR.L1                       * 29DE8

* Error 303h
OVERFLOWERR:
        CON(5)  (*)+5                            * 29DEC  primitive code object
        LC(5)   ofloerr                          * 29DF1  "Overflow"
        GOTO    DoErrIR.L1                       * 29DF8

* Error 304h
* refs (3): 3643A 524E8 9799A
SETIVLERR:
        CON(5)  (*)+5                            * 29DFC  primitive code object

* refs (1): 29DFC
DoErrUR:
        LC(5)   #00304                           * 29E01
        GOTO    DoErrIR.L1                       * 29E08

* Error 305h
* refs (1): 5204E
INFRESERR:
        CON(5)  (*)+5                            * 29E0C  primitive code object

* refs (1): 29E0C
DoErrIR:
        LC(5)   infreserr                        * 29E11  "Infinite Result"
DoErrIR.L1:
        A=C     A                                * 29E18
        GOVLNG  Errjmp                           * 29E1A

* ( x -> A ) Converts %% to %.If SB is clear uses roundup, if set uses lowest nibble in % field to determine rounding direction. Obeys and sets flow flags/indicators
* refs (2): 2AEE9 79ECF
PACKSB:
        P=      0                                * 29E21
        ?B#0    M                                * 29E23
        GOYES   PACKSB.L1                        * 29E26
        A=0     W                                * 29E28
        RTN                                      * 29E2B
PACKSB.L1:
        B=B+B   X                                * 29E2D
        GONC    PACK.L4                          * 29E30
        C=0     M                                * 29E33
        C=C+1   M                                * 29E36
        ?B#0    X                                * 29E39
        GOYES   PACK.L3                          * 29E3C
        ?SB=0                                    * 29E3E
        GOYES   PACK.L2                          * 29E41
        GONC    PACK.L3                          * 29E43

* ( x -> A ) <REF>PACKSB without rounding 
* refs (22): 23313 2AEDB 2C11B 2CD97 35AE0 5060D ...
PACK:
        P=      0                                * 29E46
        ?B#0    M                                * 29E48
        GOYES   PACK.L1                          * 29E4B
        A=0     W                                * 29E4D
        RTN                                      * 29E50
PACK.L1:
        B=B+B   X                                * 29E52
        GONC    PACK.L4                          * 29E55
        C=0     M                                * 29E58
        C=C+1   M                                * 29E5B
        GONC    PACK.L3                          * 29E5E
PACK.L2:
        C=C&B   M                                * 29E61
PACK.L3:
        B=B+C   M                                * 29E65
        GONC    PACK.L4                          * 29E68
        P=      14                               * 29E6B
        B=B+1   P                                * 29E6D
        P=      0                                * 29E70
        A=A+1   A                                * 29E72
PACK.L4:
        C=A     A                                * 29E74
        C=C+C   A                                * 29E76
        GOC     PACK.L6                          * 29E78
        LC(5)   #00499                           * 29E7B
        ?C<A    A                                * 29E82
        GOYES   PACK.L11                         * 29E85
PACK.loop5:
        A=B     M                                * 29E87
        RTN                                      * 29E8A
PACK.L6:
        LC(5)   #99501                           * 29E8C
        ?C<=A   A                                * 29E93
        GOYES   PACK.loop5                       * 29E96
        D0=(5)  #80847                           * 29E98
        A=DAT0  B                                * 29E9F
        ?ABIT=0 3                                * 29EA2
        GOYES   PACK.loop8                       * 29EA7
        LC(5)   posunferr                        * 29EA9  "Positive Underflow"
        ?A=0    S                                * 29EB0
        GOYES   PACK.loop7                       * 29EB3
        C=C+1   A                                * 29EB5
PACK.loop7:
        GOVLNG  GPErrjmpC                        * 29EB7
PACK.loop8:
        ?A#0    S                                * 29EBE
        GOYES   PACK.L9                          * 29EC1
        D0=(5)  #80848                           * 29EC3
        A=DAT0  B                                * 29ECA
        ABIT=1  3                                * 29ECD
        GONC    PACK.L10                         * 29ED2
PACK.L9:
        D0=(5)  #80848                           * 29ED5
        A=DAT0  B                                * 29EDC
        ABIT=1  2                                * 29EDF
PACK.L10:
        DAT0=A  B                                * 29EE4
        A=0     W                                * 29EE7
        RTN                                      * 29EEA
* a branch also enters #29EF1, where the nibbles decode as CLRST
PACK.L11:
        D0=(5)  #80848                           * 29EEC
        A=DAT0  B                                * 29EF3
        ?ABIT=0 0                                * 29EF6
        GOYES   PACK.loop12                      * 29EFB
        LC(5)   ofloerr                          * 29EFD  "Overflow"
        GONC    PACK.loop7                       * 29F04
PACK.loop12:
        D0=(5)  #80849                           * 29F07
        A=DAT0  B                                * 29F0E
        ABIT=1  0                                * 29F11
        DAT0=A  B                                * 29F16
        LC(3)   #499                             * 29F19
        A=C     X                                * 29F1E
        A=0     M                                * 29F21
        A=-A-1  M                                * 29F24
        RTN                                      * 29F27
        P=      0                                * 29F29
        ?B#0    M                                * 29F2B
        GOYES   PACK.L13                         * 29F2E
        A=0     W                                * 29F30
        RTN                                      * 29F33
PACK.L13:
        B=B+B   X                                * 29F35
        GONC    PACK.L14                         * 29F38
        B=B+1   M                                * 29F3B
        GONC    PACK.L14                         * 29F3E
        P=      14                               * 29F41
        B=B+1   P                                * 29F43
        P=      0                                * 29F46
        A=A+1   A                                * 29F48
PACK.L14:
        C=A     A                                * 29F4A
        C=C+C   A                                * 29F4C
        GOC     PACK.L16                         * 29F4E
        LC(5)   #00499                           * 29F51
        ?C<A    A                                * 29F58
        GOYES   PACK.L17                         * 29F5B
PACK.loop15:
        A=B     M                                * 29F5D
        RTN                                      * 29F60
PACK.L16:
        LC(5)   #99501                           * 29F62
        ?C<=A   A                                * 29F69
        GOYES   PACK.loop15                      * 29F6C
        GOTO    PACK.loop8                       * 29F6E
PACK.L17:
        GOTO    PACK.loop12                      * 29F72

* refs (6): 3443F 34C3E 37239 535A7 789F1 7D6CB
* x in A:B -> A.W = x rounded to a %. Sets no flags: underflow gives 0, overflow MAXR
PACKq:
        P=      0                                * 29F76
        ?B#0    M                                * 29F78
        GOYES   PACKq.L1                         * 29F7B
        A=0     W                                * 29F7D
        RTN                                      * 29F80
PACKq.L1:
        B=B+B   X                                * 29F82
        GONC    PACKq.L2                         * 29F85
        B=B+1   M                                * 29F88
        GONC    PACKq.L2                         * 29F8B
        P=      14                               * 29F8E
        B=B+1   P                                * 29F90
        P=      0                                * 29F93
        A=A+1   A                                * 29F95
PACKq.L2:
        C=A     A                                * 29F97
        C=C+C   A                                * 29F99
        GOC     PACKq.L4                         * 29F9B
        LC(5)   #00499                           * 29F9E
        ?C<A    A                                * 29FA5
        GOYES   PACKq.L5                         * 29FA8
PACKq.loop3:
        A=B     M                                * 29FAA
        RTN                                      * 29FAD
PACKq.L4:
        LC(5)   #99501                           * 29FAF
        ?C<=A   A                                * 29FB6
        GOYES   PACKq.loop3                      * 29FB9
        A=0     W                                * 29FBB
        RTN                                      * 29FBE
PACKq.L5:
        LC(3)   #499                             * 29FC0
        A=C     X                                * 29FC5
        A=0     M                                * 29FC8
        A=-A-1  M                                * 29FCB
        RTN                                      * 29FCE

* ( %pop -> x ) Pop %, convert to %%, <REF>SAVPTR
* refs (5): 0CE14 2AEA2 3523B 3726C 5066E
POP1%SPLITA:
        GOSUB   POP1%                            * 29FD0
        GOLONG  SPLITA                           * 29FD4

* ( %pop -> A ) Pop %, <REF>SAVPTR
* refs (17): 0D8B0 0D92C 0EEE9 14169 18CDC 18CEF ...
POP1%:
        C=DAT1  A                                * 29FDA
        CD1EX                                    * 29FDD
        D1=D1+  5                                * 29FE0
        A=DAT1  W                                * 29FE3
        D1=C                                     * 29FE7
        D1=D1+  5                                * 29FEA
        D=D+1   A                                * 29FED
        SETDEC                                   * 29FEF

* refs (1): 2A22E
SAVPTR~jump_11:
        GOVLNG  SAVPTR                           * 29FF1

* refs (2): 2AEA9 34C99
Pop%ACSrSep:
        GOSUB   POP2%                            * 29FF8
        GOLONG  SPLTAC                           * 29FFC
