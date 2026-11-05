* HP 48GX ROM revision R, #B4B39-#B7B7C: Form data, part 1: Solve, TVM, plot parameters and PPAR fields, VPAR, Symbolic forms, Time and Alarm items
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PltPtypeItem PltPutIndepRng PltPutDepend StatGetDAT PltRes>Fld PltPutResNum PltPutIndep PltDefWidth VparZvol@ VparZvol! VparYvol@ VparYvol!
* Follows on from the previous file (at #B4B39 in the original ROM).

* Library 0B5: Field getters, setters and choose lists behind the input forms of library 0B4: Solve, TVM, Plot, VPAR, Symbolic, Time and Alarms, Statistics, I/O and Kermit, Modes, Flags browser, Var browser. Empty fields hold -1 (MINUSONE)
LIB0B5:
        CON(3)  #0B5                             * B4B39  library number
        REL(5)  LIB0B5.hash                      * B4B3C  hash table
        CON(5)  0                                * B4B41  message table
        REL(5)  LIB0B5.link                      * B4B46  link table
        CON(5)  0                                * B4B4B  config
        RPL

* ROMPTR 0B5 000
* refs (1): B4B39
* -> ob|-1: value of the EQ field in the Solve form
SlvGetEQ:
        :: XLIB GetEQ ;                          * B4B50

* ROMPTR 0B5 001
* refs (1): B4B39
* ob|-1 -> : stores the EQ field
SlvPutEQ:
        :: XLIB PutEQ ;                          * B4B65

* ROMPTR 0B5 002
* refs (1): B4B39
* ob -> {ids}: variables of the equation; {} when there is none
SlvEqVars:
        :: XLIB FirstEq DUP MINUSONE EQUAL casedrop NULL{} * B4B7A
          FINDVAR ;                              * B4BA3

* ROMPTR 0B5 003
* refs (1): B4B39
* id -> ... msg flag: solves the first equation of EQ for id, with its current value (or 0) as the guess, and fetches the solver's result message. flag tells the two outcomes apart
SlvSolveVar:
        :: XLIB GetFirstEq XLIB IFCkVal SWAPDUP SAFE@ ?SKIP %0_2A2B4 * B4BAD
          SYMBNUMSOLVE case                      * B4BDC
          :: JstGetTHEMESG SWAPDROP TRUE ;       * B4BE6
          DUP JstGetTHEMESG FALSE ;              * B4BFF

* ROMPTR 0B5 004
* refs (1): B4B39
* eq -> left right TRUE | value FALSE: the Solver's EXPR= key. Evaluates both sides of an equation, or the whole expression
SlvEvalEq:
        :: XLIB IFCkVal DUP ALGeq? case          * B4C13
          :: SPLITEQ 1LAMBIND 'EvalNoCK:_sup xEVAL CK1NoBlame 1GETABND * B4C32
            'EvalNoCK:_sup xEVAL CK1NoBlame TRUE ; * B4C55
          'EvalNoCK:_sup xEVAL CK1NoBlame FALSE ; * B4C6E

* ROMPTR 0B5 005
* refs (1): B4B39
~SAFE@:
        :: SAFE@ ;                               * B4C87

* ROMPTR 0B5 006
* refs (1): B4B39
* val id -> : stores a Solver variable. A circular reference (id appears in val) is an error
SlvStoVar:
        :: STRIPTAGSl2 OVER FINDVAR OVERSWAP matchob? ITE SETCIRCERR DROP * B4C96
          SolvStoKeep XEQSTOID ;                 * B4CC3

* ROMPTR 0B5 007
* refs (1): B4B39
* [coefficients] -> poly: symbolic polynomial in X from its coefficients, with the empty-field check
PolyCoef>Sym:
        :: XLIB IFCkVal ' ID X XLIB Poly>Symb ;  * B4CD2

* ROMPTR 0B5 008
* refs (1): B4B39
* ob -> ob: Bad Argument Type if ob is -1, an empty field
IFCkVal:
        :: DUP MINUSONE EQUAL case SETTYPEERR    * B4D00
        ;                                        * B4D1E

* ROMPTR 0B5 009
* refs (1): B4B39
* [roots] -> poly: symbolic product of factors in X from the roots
PolyRoots>Sym:
        :: XLIB IFCkVal ' ID X XLIB Roots>Symb ; * B4D23

* ROMPTR 0B5 00A
* refs (1): B4B39
* [roots] -> [coefficients]: PCOEF, with the empty-field check
PolyRoots>Coef:
        :: XLIB IFCkVal XLIB DoPCOEF ;           * B4D51

* ROMPTR 0B5 00B
* refs (1): B4B39
* [coefficients] -> [roots]: PROOT, with the empty-field check
PolyCoef>Roots:
        :: XLIB IFCkVal XLIB PROOTcore ;         * B4D71

* ROMPTR 0B5 00C
* refs (1): B4B39
* Runs the MatrixWriter: if flag, on the object below it, else on a new matrix. Leaves a flag telling whether an array came back
IFEditMatrix:
        :: case DoOldMatrix                      * B4D91
          DoNewMatrix DEPTH #0=case FALSE        * B4DA0
          DUPTYPEARRY? ;                         * B4DB4

* ROMPTR 0B5 00D
* refs (1): B4B39
* A B -> X: Solve Linear System. Non-square A goes to LSQ; so does a square A when direct solution fails
SysSolveAxB:
        :: SWAPDUP MDIMS NcaseDIMERR #<>case     * B4DBE
          XLIB LSQSolve                          * B4DD7
          DUPUNROT ERRSET XLIB MatDiv ERRTRAP    * B4DE2
          :: ROT XLIB LSQSolve ; SWAPDROP ;      * B4DFC

* ROMPTR 0B5 00E
* refs (1): B4B39
~MAT*:
        :: MAT* ;                                * B4E20

* ROMPTR 0B5 00F
* refs (1): B4B39
* -> %: TVM variable N (0 when undefined). Getters and setters of I%YR, PV, PMT and FV follow in the same way
TvmGetN:
        :: XLIB TVMVal N ;                       * B4E2F

* ROMPTR 0B5 010
* refs (1): B4B39
* %|-1 -> : stores N unless the field is empty
TvmPutN:
        :: XLIB IFSkipNoVal XLIB TVMStoVal N ;   * B4E49

* ROMPTR 0B5 011
* refs (1): B4B39
* ob -> ob: if ob is -1 (empty field), drops it and returns from the caller too
IFSkipNoVal:
        :: DUP MINUSONE EQUAL case drop;q_58A0C  * B4E6E
        ;                                        * B4E8C

* ROMPTR 0B5 012
* refs (1): B4B39
* -> %
TvmGetI%YR:
        :: XLIB TVMVal I%YR ;                    * B4E91

* ROMPTR 0B5 013
* refs (1): B4B39
* %|-1 ->
TvmPutI%YR:
        :: XLIB IFSkipNoVal XLIB TVMStoVal I%YR ; * B4EAB

* ROMPTR 0B5 014
* refs (1): B4B39
* -> %
TvmGetPV:
        :: XLIB TVMVal PV ;                      * B4ED0

* ROMPTR 0B5 015
* refs (1): B4B39
* %|-1 ->
TvmPutPV:
        :: XLIB IFSkipNoVal XLIB TVMStoVal PV ;  * B4EEA

* ROMPTR 0B5 016
* refs (1): B4B39
* -> %
TvmGetPMT:
        :: XLIB TVMVal PMT ;                     * B4F0F

* ROMPTR 0B5 017
* refs (1): B4B39
* %|-1 ->
TvmPutPMT:
        :: XLIB IFSkipNoVal XLIB TVMStoVal PMT ; * B4F29

* ROMPTR 0B5 018
* refs (1): B4B39
* -> %
TvmGetFV:
        :: XLIB TVMVal FV ;                      * B4F4E

* ROMPTR 0B5 019
* refs (1): B4B39
* %|-1 ->
TvmPutFV:
        :: XLIB IFSkipNoVal XLIB TVMStoVal FV ;  * B4F68

* ROMPTR 0B5 01A
* refs (1): B4B39
* -> %: payments per year as a positive integer; 0 or undefined gives 12
TvmGetPYR:
        :: XLIB TVMVal PYR %ABS %IP DUP%0= IT    * B4F8D
          :: DROP %12 ;                          * B4FB6
        ;                                        * B4FCA

* ROMPTR 0B5 01B
* refs (1): B4B39
* %|-1 -> : stores P/YR as a positive integer; 0 becomes 12
TvmPutPYR:
        :: XLIB IFSkipNoVal %ABS %IP DUP%0= IT   * B4FCF
          :: DROP %12 ;                          * B4FF3
          XLIB TVMStoVal PYR ;                   * B5007

* ROMPTR 0B5 01C
* refs (1): B4B39
* -> item: Begin or End item, from flag -14
TvmGetBegEnd:
        :: XLIB TvmBegEndItems BINT14 SysITE BINT1 BINT2 NTHCOMPDROP ; * B501C  flag -14: Payment at end / Payment at begin

* ROMPTR 0B5 01D
* refs (1): B4B39
* item -> : sets flag -14 from the Begin or End item
TvmPutBegEnd:
        :: XLIB ~BINT3;NTHCOMPROM@ ITE XLIB TVMBegin XLIB TVMEnd * B504A
        ;                                        * B5075

* ROMPTR 0B5 01E
* refs (1): B4B39
* -> %: solves for N and stores it. The next four do the same for I%YR, PV, PMT and FV
TvmSolveN:
        :: ' N XLIB TVMSolve DUP XLIB TVMStoVal N ; * B507A

* ROMPTR 0B5 01F
* refs (1): B4B39
* -> %
TvmSolveI%YR:
        :: ' I%YR XLIB TVMSolve DUP XLIB TVMStoVal I%YR ; * B50AE

* ROMPTR 0B5 020
* refs (1): B4B39
* -> %
TvmSolvePV:
        :: ' PV XLIB TVMSolve DUP XLIB TVMStoVal PV ; * B50E2

* ROMPTR 0B5 021
* refs (1): B4B39
* -> %
TvmSolvePMT:
        :: ' PMT XLIB TVMSolve DUP XLIB TVMStoVal PMT ; * B5116

* ROMPTR 0B5 022
* refs (1): B4B39
* -> %
TvmSolveFV:
        :: ' FV XLIB TVMSolve DUP XLIB TVMStoVal FV ; * B514A

* ROMPTR 0B5 023
* refs (1): B4B39
* %n|-1 -> ...: AMORT, with the empty-field check
TvmAmort:
        :: XLIB IFCkVal XLIB AMORTArgs ;         * B517E

* ROMPTR 0B5 024
* refs (1): B4B39
* %|-1 -> $: amortization field text in FIX 2 whatever the mode (flags restored afterwards, also on error); an empty field gives ""
TvmFldFmt:
        :: DUP MINUSONE EQUAL casedrop NULL$     * B519E
          RCLSYSF SWAP ERRSET BINT2 DOFIX ->str1(r) ERRTRAP * B51BC
          :: TYPEBINT? IT DROP                   * B51DF
            STOSYSF ERRJMP ;                     * B51F3
          SWAP STOSYSF ;                         * B5202

* ROMPTR 0B5 025
* refs (1): B4B39
* { Begin End }: choose list of the payment-time field
TvmBegEndItems:
        { XLIB TvmItemBegin XLIB TvmItemEnd }    * B5211

* ROMPTR 0B5 026
* refs (1): B4B39
* Item: message, short message, flag
TvmItemBegin:
        { # BF4C # BF4D TRUE }                   * B5231  "Begin"  "Beg"

* ROMPTR 0B5 027
* refs (1): B4B39
* Item: message, short message, flag
TvmItemEnd:
        { # BF4B # BF4B FALSE }                  * B5254  "End"  "End"

* ROMPTR 0B5 028
* refs (1): B4B39
* -> ob|-1: contents of EQ, -1 if there is none
GetEQ:
        :: 'EQ SAFE@_HERE NOTcase MINUSONE       * B5277
        ;                                        * B5290

* ROMPTR 0B5 029
* refs (1): B4B39
* ob|-1 -> : stores ob in EQ unless it is -1
PutEQ:
        :: DUP MINUSONE EQUAL caseDROP DOSTOE    * B5295
        ;                                        * B52B3

* ROMPTR 0B5 02A
* refs (1): B4B39
* -> eq|-1: first equation in EQ
GetFirstEq:
        :: 'EQ SAFE@_HERE NOTcase MINUSONE       * B52B8
          XLIB FirstEq ;                         * B52D1

* ROMPTR 0B5 02B
* refs (1): B4B39
* ob -> eq|-1: an equation list gives its first equation, an empty list -1, another list its first element, any other object itself
FirstEq:
        :: DUP EqList? ITE                       * B52E1
          :: BINT1 NTHELCOMP ; TRUE              * B52F5
          NOTcase MINUSONE                       * B530E
          DUPTYPELIST? NOT?SEMI                  * B5318
          CARCOMP ;                              * B5322

* ROMPTR 0B5 02C
* refs (1): B4B39
* -> f ft fy | -1 -1 -1: the three objects of a three-element list in EQ (the Diff Eq forms), else three -1s
GetDeq3:
        :: 'EQ SAFE@_HERE NOTcase                * B532C
          :: MINUSONE DUPDUP ;                   * B5340
          DUPTYPELIST? NOTcasedrop               * B5354
          :: MINUSONE DUPDUP ;                   * B535E
          INNERCOMP DUP #3= case DROP            * B5372
          NDROP MINUSONE DUPDUP ;                * B538B

* ROMPTR 0B5 02D
* refs (1): B4B39
* f ft fy -> : stores the three as a list in EQ, unless one of them is -1
PutDeq3:
        :: DUP MINUSONE EQUALcase 3DROP          * B539F
          OVER MINUSONE EQUALcase 3DROP          * B53B8
          3PICK MINUSONE EQUALcase 3DROP         * B53CC
          BINT3 {}N DOSTOE ;                     * B53E0

* ROMPTR 0B5 02F
* refs (2): B4B39 B4B39
* name -> : sets INDEP to { name }. Link entries 02E and 02F are both this object
PltPutIndep:
        :: BINT1 {}N PUTINDEPLIST ;              * B53F4

* ROMPTR 0B5 030
* refs (1): B4B39
* ob -> lo hi: the range in INDEP's list, #0 #0 if ob is no list
PltIndepRng:
        :: dLISTcase ICMPDRPRTDRP                * B540D
          DROP ZEROZERO ;                        * B541C

* ROMPTR 0B5 031
* refs (1): B4B39
* ob -> lo hi: as PltIndepRng, default 0 to one revolution (polar plots)
PltIndepRngRev:
        :: dLISTcase ICMPDRPRTDRP                * B542B
          DROP %0_2A2B4 1REV ;                   * B543A

* ROMPTR 0B5 032
* refs (1): B4B39
* ob -> lo hi: as PltIndepRng, default 0 to Xmax (diff eq plots)
PltIndepRngT:
        :: dLISTcase ICMPDRPRTDRP                * B544E
          DROP %0_2A2B4 GETXMAX ;                * B545D

* ROMPTR 0B5 035
* refs (3): B4B39 B4B39 B4B39
* name lo hi -> : INDEP becomes { name lo hi }; a binary hi or lo means no range. Link entries 033 to 035 are this object
PltPutIndepRng:
        :: DUPTYPEBINT? case2drop                * B5471
          :: INDEPVAR PUTINDEP ;                 * B5480
          TWO{}N PUTINDEPLIST ;                  * B5494

* ROMPTR 0B5 036
* refs (1): B4B39
* -> xmin xmax
PltHView:
        :: GETXMIN GETXMAX ;                     * B54A3

* ROMPTR 0B5 039
* refs (3): B4B39 B4B39 B4B39
* name -> : sets DEPND to { name }. Link entries 037 to 039 are this object
PltPutDepend:
        :: BINT1 {}N depnd(li) ;                 * B54B7

* ROMPTR 0B5 03A
* refs (1): B4B39
* ob -> lo hi: DEPND's range, #0 #0 if it holds none
PltDepRng:
        :: dLISTcase                             * B54D0
          :: ICMPDRPRTDRP OVER TYPEREAL? ?SEMI   * B54DA
            2DROP ZEROZERO ;                     * B54F3
          DROP ZEROZERO ;                        * B5502

* ROMPTR 0B5 03B
* refs (1): B4B39
* lo hi -> : stores DEPND's range; a binary value keeps only the name
PltPutDepRng:
        :: DUPTYPEBINT? case2drop                * B5511
          :: ~RclDepnd;1get(li)? depnd(gn) ;     * B5520
          TWO{}N depnd(li) ;                     * B5534

* ROMPTR 0B5 03C
* refs (1): B4B39
* -> ymin ymax
PltVView:
        :: GETYMIN GETYMAX ;                     * B5543

* ROMPTR 0B5 03E
* refs (2): B4B39 B4B39
* res -> %step flag: RES value for the Step field. flag TRUE means pixels (a binary integer in PPAR). 0 gives #0 FALSE, meaning the default. Link entries 03D and 03E
PltRes>Fld:
        :: DUP TYPEHSTR? case                    * B5557
          :: HXS># DUP#0=case FALSE              * B556B
            UNCOERCE TRUE ;                      * B557F
          DUP %0<> case FALSE                    * B558E
          DROPZERO FALSE ;                       * B55A2

* ROMPTR 0B5 03F
* refs (1): B4B39
* %step|# flag -> : stores RES; flag means pixels (binary integer)
PltPutRes:
        :: SWAP DUPTYPEBINT? case                * B55B1
          :: SWAPDROP #>HXS PUTRES ;             * B55C5
          SWAP NOTcase PUTRES                    * B55DE
          COERCE #>HXS PUTRES ;                  * B55ED

* ROMPTR 0B5 040
* refs (1): B4B39
* min max flag -> %: size of one pixel in user units; 1 if flag
PltPixelStep:
        :: case                                  * B5601
          :: 2DROP %1 ;                          * B560B
          XLIB PltPixPerUnit %%1 SWAP %%/>% ;    * B561F

* ROMPTR 0B5 041
* refs (1): B4B39
* min max -> %%: pixels per user unit across the standard PICT
PltPixPerUnit:
        :: RclMaxStdPict SWAPDROP #1- UNCOERCE%% SWAP %>%% ROT %>%% %%- %%/ ; * B563E

* ROMPTR 0B5 042
* refs (1): B4B39
* min max flag -> %: default step, one 130th of the range; flag converts it to pixels
PltDefStep:
        :: 3PICK3PICK SWAP %- % 1.3E2 %/ SWAP NOTcase ROTROT2DROP * B567A
          %>%% 3UNROLL XLIB PltPixPerUnit %%* %%>% ; * B56B7

* ROMPTR 0B5 043
* refs (1): B4B39
* min max flag -> %: default polar step: 2, or its radian value in RAD mode; flag converts it to pixels
PltDefStepPolar:
        :: RAD? ITE % 3.49065850399E-2 %2        * B56DB
          SWAP NOTcase ROTROT2DROP               * B5704
          %>%% 3UNROLL XLIB PltPixPerUnit %%* %%>% ; * B5713

* ROMPTR 0B5 045
* refs (2): B4B39 B4B39
* %step -> : PltPutRes in user units. Link entries 044 and 045
PltPutResNum:
        :: FALSE XLIB PltPutRes ;                * B5737

* ROMPTR 0B5 047
* refs (2): B4B39 B4B39
* min max -> %: a 13th of the range. Link entries 046 and 047
PltDefWidth:
        :: SWAP %- %13 %/ ;                      * B5751

* ROMPTR 0B5 049
* refs (2): B4B39 B4B39
* -> ΣDAT|-1. Link entries 048 and 049
StatGetDAT:
        :: Exist@äDAT? NOTcase MINUSONE          * B576F
          ChkStatArray ;                         * B5783

* ROMPTR 0B5 04A
* refs (1): B4B39
* ob|-1 -> : replaces ΣDAT unless the field is empty
StatPutDAT:
        :: XLIB IFSkipNoVal STATCLST å- ;        * B578D

* ROMPTR 0B5 04F
* refs (5): B4B39 B4B39 B4B39 B4B39 B4B39
* ptype -> item: the Plot form's choose item for a plot type; Bad Argument Value if unknown. Link entries 04B to 04F
PltPtypeItem:
        ::                                       * B57AC
          { xFUNCTION XLIB PltItemFUNCTION POLAR XLIB PltItemPOLAR xCONIC * B57B1
            XLIB PltItemCONIC xTRUTH XLIB PltItemTRUTH xPARAMETRIC * B57DB
            XLIB PltItemPARAMETRIC XLIB DIFFEQ XLIB PltItemDIFFEQ xHISTOGRAM * B57FB
            XLIB PltItemHISTOGRAM xBAR XLIB PltItemBAR xSCATTER * B5821
            XLIB PltItemSCATTER XLIB SLOPEFIELD XLIB PltItemSLOPEFIELD * B5841
            XLIB WIREFRAME XLIB PltItemWIREFRAME XLIB PCONTOUR * B5862
            XLIB PltItemPCONTOUR XLIB YSLICE XLIB PltItemYSLICE XLIB GRIDMAP * B5883
            XLIB PltItemGRIDMAP XLIB PARSURFACE XLIB PltItemPARSURFACE } * B58AF
          XLIB RompLookup NcaseSIZEERR ;         * B58D5

* ROMPTR 0B5 050
* refs (1): B4B39
* Choose list of the Type field in the Plot form
PltPtypeItems:
        { XLIB PltItemFUNCTION XLIB PltItemPOLAR XLIB PltItemPARAMETRIC * B58EA
          XLIB PltItemDIFFEQ XLIB PltItemCONIC XLIB PltItemTRUTH * B5910
          XLIB PltItemHISTOGRAM XLIB PltItemBAR XLIB PltItemSCATTER * B5931
          XLIB PltItemSLOPEFIELD XLIB PltItemWIREFRAME XLIB PltItemPCONTOUR * B5952
          XLIB PltItemYSLICE XLIB PltItemGRIDMAP XLIB PltItemPARSURFACE } * B5973

* ROMPTR 0B5 051
* refs (1): B4B39
* Item: message, and the action that sets the plot type. The other types follow
PltItemFUNCTION:
        { # BE69                                 * B5999  "Function"
          :: 'IDFUNCTION PUTPTYPE ; }            * B59A8

* ROMPTR 0B5 052
* refs (1): B4B39
PltItemPOLAR:
        { # BE6A                                 * B59C1  "Polar"
          :: 'IDPOLAR PUTPTYPE ; }               * B59D0

* ROMPTR 0B5 053
* refs (1): B4B39
PltItemCONIC:
        { # BE6B                                 * B59E9  "Conic"
          :: 'IDCONIC PUTPTYPE ; }               * B59F8

* ROMPTR 0B5 054
* refs (1): B4B39
PltItemTRUTH:
        { # BE6C                                 * B5A11  "Truth"
          :: 'IDTRUTH PUTPTYPE ; }               * B5A20

* ROMPTR 0B5 055
* refs (1): B4B39
PltItemPARAMETRIC:
        { # BE6D                                 * B5A39  "Parametric"
          :: 'IDPARAMETER PUTPTYPE ; }           * B5A48

* ROMPTR 0B5 056
* refs (1): B4B39
PltItemDIFFEQ:
        { # BE6E                                 * B5A61  "Diff Eq"
          :: ' XLIB DIFFEQ PUTPTYPE ; }          * B5A70

* ROMPTR 0B5 057
* refs (1): B4B39
PltItemHISTOGRAM:
        { # BE6F                                 * B5A94  "Histogram"
          :: 'IDHISTOGRAM PUTPTYPE ; }           * B5AA3

* ROMPTR 0B5 058
* refs (1): B4B39
PltItemBAR:
        { # BE70                                 * B5ABC  "Bar"
          :: 'IDBAR PUTPTYPE ; }                 * B5ACB

* ROMPTR 0B5 059
* refs (1): B4B39
PltItemSCATTER:
        { # BE71                                 * B5AE4  "Scatter"
          :: 'IDSCATTER PUTPTYPE ; }             * B5AF3

* ROMPTR 0B5 05A
* refs (1): B4B39
PltItemSLOPEFIELD:
        { # BE72                                 * B5B0C  "Slopefield"
          :: ' XLIB SLOPEFIELD PUTPTYPE ; }      * B5B1B

* ROMPTR 0B5 05B
* refs (1): B4B39
PltItemWIREFRAME:
        { # BE73                                 * B5B3F  "Wireframe"
          :: ' XLIB WIREFRAME PUTPTYPE ; }       * B5B4E

* ROMPTR 0B5 05C
* refs (1): B4B39
PltItemPCONTOUR:
        { # BE74                                 * B5B72  "Ps-Contour"
          :: ' XLIB PCONTOUR PUTPTYPE ; }        * B5B81

* ROMPTR 0B5 05D
* refs (1): B4B39
PltItemYSLICE:
        { # BE75                                 * B5BA5  "Y-Slice"
          :: ' XLIB YSLICE PUTPTYPE ; }          * B5BB4

* ROMPTR 0B5 05E
* refs (1): B4B39
PltItemGRIDMAP:
        { # BE76                                 * B5BD8  "Gridmap"
          :: ' XLIB GRIDMAP PUTPTYPE ; }         * B5BE7

* ROMPTR 0B5 05F
* refs (1): B4B39
PltItemPARSURFACE:
        { # BE77                                 * B5C0B  "Pr-Surface"
          :: ' XLIB PARSURFACE PUTPTYPE ; }      * B5C1A

* ROMPTR 0B5 060
* refs (1): B4B39
* -> flag: connect points (flag -31 clear)
PltConnect?:
        :: BINT31 TestSysFlag NOT ;              * B5C3E  flag -31: Connect points / Plot points only

* ROMPTR 0B5 061
* refs (1): B4B39
* flag ->
PltConnect!:
        :: BINT31 SWAP ITE ClrSysFlag SetSysFlag * B5C57
        ;                                        * B5C75

* ROMPTR 0B5 062
* refs (1): B4B39
* -> flag: simultaneous plotting (flag -28)
PltSimult?:
        :: BINT28 TestSysFlag ;                  * B5C7A  flag -28: Sequential plot / Simultaneous plot

* ROMPTR 0B5 063
* refs (1): B4B39
* flag ->
PltSimult!:
        :: BINT28 SWAP ITE SetSysFlag ClrSysFlag * B5C8E
        ;                                        * B5CAC

* ROMPTR 0B5 064
* refs (1): B4B39
* ob -> %: initial y from DEPND's list, 0 if ob is no list
DeqInitVal:
        :: dLISTcase                             * B5CB1
          :: ICMPDRPRTDRP DROP ;                 * B5CBB
          DROP %0_2A2B4 ;                        * B5CCF

* ROMPTR 0B5 065
* refs (1): B4B39
* %|-1 -> : stores initial y in DEPND
DeqPutInit:
        :: XLIB IFSkipNoVal RclDepnd dLISTcase   * B5CDE
          :: INCOMPDROP SWAPDROP ROTSWAP THREE{}N depnd(gn) ; * B5CF8
          SWAP % 1E-4 THREE{}N depnd(gn) ;       * B5D1B

* ROMPTR 0B5 066
* refs (1): B4B39
* Solve Diff Eq form, RKF method. Stores initial t and y, then runs RKF to the final t and returns the solution
DeqSolveRKF:
        :: 7ROLL 7ROLL XLIB IFCkVal OVER XEQSTOID 5ROLL 5ROLL XLIB IFCkVal * B5D44
          OVER XEQSTOID 6ROLL XLIB IFCkVal THREE{}N 3UNROLL DUPTYPEBINT? ITE * B5D7D
          DROP TWO{}N                            * B5DAB
          ROT XLIB IFCkVal XLIB DoRKF SWAP BINT2 NTHCOMPDROP RCLCRUNCH>%ARRY ; * B5DB5

* ROMPTR 0B5 067
* refs (1): B4B39
* As DeqSolveRKF, for the RRK method, which also takes the two partial derivatives
DeqSolveRRK:
        :: 7ROLL 7ROLL XLIB IFCkVal OVER XEQSTOID 5ROLL 5ROLL XLIB IFCkVal * B5DE9
          OVER XEQSTOID 8ROLL XLIB IFCkVal 8ROLL XLIB IFCkVal 8ROLL * B5E22
          XLIB IFCkVal BINT5 {}N 3UNROLL DUPTYPEBINT? ITE DROP TWO{}N * B5E51
          ROT XLIB IFCkVal XLIB DoRRK SWAP BINT2 NTHCOMPDROP RCLCRUNCH>%ARRY ; * B5E7F

* ROMPTR 0B5 068
* refs (1): B4B39
* ob -> %: tolerance from DEPND's list, default 1E-4
DeqTol:
        :: dLISTcase                             * B5EB3
          :: ICMPDRPRTDRP SWAPDROP ;             * B5EBD
          DROP % 1E-4 ;                          * B5ED1

* ROMPTR 0B5 069
* refs (1): B4B39
* % -> : stores the tolerance in DEPND
DeqPutTol:
        :: RclDepnd dLISTcase                    * B5EF0
          :: INCOMPDROP DROP ROT THREE{}N depnd(gn) ; * B5EFF
          %0_2A2B4 ROT THREE{}N depnd(gn) ;      * B5F22

* ROMPTR 0B5 06A
* refs (1): B4B39
* axes -> %x %y flag: ATICK spacing from the AXES value; flag TRUE means pixels. Default 10 and 10 pixels
PltTicks>Fld:
        :: DUPTYPELIST? NOTcasedrop              * B5F3B
          :: %10 %10 TRUE ;                      * B5F4A
          DUPLENCOMP #3= casedrop                * B5F63
          :: %10 %10 TRUE ;                      * B5F72
          BINT2 NTHCOMPDROP DUPTYPELIST? ITE INCOMPDROP DUP * B5F8B
          DUPTYPEREAL? case FALSE                * B5FA9
          #>% SWAP #>% SWAPTRUE ;                * B5FB8

* ROMPTR 0B5 06B
* refs (1): B4B39
* %x %y flag -> : stores ATICK, as binary integers if flag (pixels), and keeps the axes centre
PltPutTicks:
        :: IT                                    * B5FD1
          :: %># SWAP %># SWAP ;                 * B5FDB
          BINT2 {}N RclAx*s DUPTYPELIST? IT CARCOMP * B5FF9
          SWAP BINT2 {}N AXES>List ;             * B6017

* ROMPTR 0B5 06C
* refs (1): B4B39
* -> $x $y: axis labels in AXES, "" when there are none. Not used in this ROM
PltGetAxesLbl:
        :: RclAx*s DUPTYPELIST? NOTcasedrop      * B6030
          :: NULL$ NULL$ ;                       * B6044
          INNERCOMP DUP #2= case2drop            * B6058
          :: DROP NULL$ NULL$ ;                  * B606C
          #3= case ROTDROP                       * B6085
          2SWAP 2DROP ;                          * B6094

* ROMPTR 0B5 06D
* refs (1): B4B39
* $x $y -> : stores the axis labels through the AXES code. Not used in this ROM
PltPutAxesLbl:
        :: BINT2 {}N AXES>List ;                 * B60A3

* ROMPTR 0B5 06E
* refs (1): B4B39
* -> ob: axes centre. Not used in this ROM
PltGetAxesCtr:
        :: BINT5 PPAR(s);dup;li? IT CARCOMP      * B60BC
        ;                                        * B60D5

* ROMPTR 0B5 06F
* refs (1): B4B39
* ob -> : replaces the axes centre in PPAR. Not used in this ROM
PltPutAxesCtr:
        :: BINT5 PPAR(s);dup;li? ITE             * B60DA
          :: CDRCOMP SWAP >HCOMP ; DROP          * B60EE
          BINT3 PutBackPPAR(_,s) ;               * B610C

* ROMPTR 0B5 070
* refs (1): B4B39
* -> flag: draw axes (flag -29 clear)
PltAxes?:
        :: BINT29 TestSysFlag NOT ;              * B611B  flag -29: Draw axes too / Don't draw axes

* ROMPTR 0B5 071
* refs (1): B4B39
* flag ->
PltAxes!:
        :: BINT29 SWAP ITE ClrSysFlag SetSysFlag * B6134
        ;                                        * B6152

* ROMPTR 0B5 072
* refs (1): B4B39
* -> %h %v: H-Var and V-Var from the axis labels: solution columns to plot. Anything invalid gives 0 and 1 (t and y)
DeqGetPlotVars:
        :: RclAxLabels NOTcase ~%0;%1            * B6157
          XLIB Deq$>% NOTcasedrop ~%0;%1         * B616B
          SWAP XLIB Deq$>% NOTcasedrop ~%0;%1    * B6180
          SWAP 2DUP %MIN %0< case2drop ~%0;%1    * B619A
          2DUP %MAX RclDepnd XLIB DeqInitVal DUPTYPEREAL? ITE * B61B8
          :: DROP BINT1 ; ARSIZE                 * B61DC
          UNCOERCE %> case2drop ~%0;%1           * B61F5
        ;                                        * B6209

* ROMPTR 0B5 073
* refs (1): B4B39
* $ -> % TRUE | FALSE: parses a label, which must hold a real number
Deq$>%:
        :: palparse NOTcasedrop 2DROPFALSE       * B620E
          DUPTYPEREAL? NOTcasedrop FALSE         * B6222
          TRUE ;                                 * B6231

* ROMPTR 0B5 074
* refs (1): B4B39
* %h %v -> : stores H-Var and V-Var as axis labels, unless one is -1
DeqPutPlotVars:
        :: DUP MINUSONE EQUAL 3PICK MINUSONE EQUAL OR case 2DROP * B623B
          a%>$ SWAP a%>$ SWAP TWO{}N AXES>List ; * B626D

* ROMPTR 0B5 075
* refs (1): B4B39
* -> %h %v flag: zoom factors and recenter flag from ZPAR; defaults 4, 4 and FALSE
PltGetZoom:
        :: RclZPAR NOTcase                       * B6290
          :: %4 %4 FALSE ;                       * B629F
          DROP DUPTYPEREAL? 3PICK TYPEREAL? AND 4PICK TYPEREAL? AND NOTcase * B62B8
          :: 3DROP %4 %4 FALSE ;                 * B62E5
          %0= NOT ;                              * B6303

* ROMPTR 0B5 076
* refs (1): B4B39
* %h %v flag -> : stores them in ZPAR, keeping its fourth element
PltPutZoom:
        :: ITE %1 %0_2A2B4                       * B6312
          RclZPAR ITE 4UNROLL3DROP NULL{}        * B6326
          ZPAR! ;                                * B633A

* ROMPTR 0B5 077
* refs (1): B4B39
* -> : Plot form RESET: default PPAR for the current type
PltReset:
        :: ResetPICT ;                           * B6344

* ROMPTR 0B5 078
* refs (1): B4B39
~DOERASE:
        :: DOERASE ;                             * B6353

* ROMPTR 0B5 079
* refs (1): B4B39
* flagSave flagAuto -> : draws the plot with LAM 'SaveAnim bound to flagSave, autoscaling first if flagAuto
PltDraw:
        :: SWAP                                  * B6362
          { LAM 'SaveAnim } BIND IT AUTOSCALE    * B636C
          AxesAndDraw ABND ;                     * B639E

* ROMPTR 0B5 07A
* refs (1): B4B39
* DIFFEQ's drawing entry, in its plot-type record at #C0736. Reads EQ, the range and initial values from PPAR, stores the initial t and y, then runs the RKF (one object in EQ) or RRK (three) plotter of library 0C1
DeqDraw:
        :: 'EQ SAFE@_HERE NOTcase ERRJMP         * B63AD
          DUPTYPELIST? DUPUNROT ITE              * B63C6
          :: INNERCOMP DUP #3= NOTcase doerr607  * B63D5
          ;                                      * B63F3
          BINT1                                  * B63F8
          INDEPVAR GETINDEP XLIB PltIndepRngT 3UNROLL OVER XEQSTOID * B63FD
          ~RclDepnd;1get(li)? RclDepnd XLIB DeqInitVal OVER XEQSTOID 4ROLL * B6421
          #1= ITE                                * B6445
          :: 4ROLL THREE{}N ;                    * B644F
          :: 6ROLL 6ROLL 6ROLL BINT5 {}N ;       * B6463
          XLIB DeqGetPlotVars DUP MINUSONE EQUAL IT * B6486
          :: 2DROP %0_2A2B4 %1 ;                 * B64A5
          %>C% RclDepnd XLIB DeqTol GETRES DUP TYPEHSTR? IT * B64BE
          :: HXS># UNCOERCE ;                    * B64E7
          5ROLL 6ROLL case XLIB DEPlotRRK        * B64FB
          COLA XLIB DEPlotRKF                    * B6515
        ;                                        * B6525

* ROMPTR 0B5 07B
* refs (1): B4B39
* ob {key value ...} -> value TRUE | ob FALSE: Lookup that compares ROMPTRs by the objects they stand for
RompLookup:
        :: '                                     * B652A
          :: ?ROMPTR@ SWAP ?ROMPTR@ EQUAL ; SWAP Lookup ; * B6534

* ROMPTR 0B5 07C
* refs (1): B4B39
* -> %: VPAR getters and setters follow, in pairs. Each passes indexes counted from the end of VPAR to VparGet or VparPut
VparNumX@:
        :: BINT2 BINT1 XLIB VparGet ;            * B6561

* ROMPTR 0B5 07D
* refs (1): B4B39
* % ->
VparNumX!:
        :: BINT2 BINT1 XLIB VparPut ;            * B6580

* ROMPTR 0B5 07E
* refs (1): B4B39
* -> %
VparNumY@:
        :: BINT1 BINT1 XLIB VparGet ;            * B659F

* ROMPTR 0B5 07F
* refs (1): B4B39
* % ->
VparNumY!:
        :: BINT1 BINT1 XLIB VparPut ;            * B65BE

* ROMPTR 0B5 080
* refs (1): B4B39
* -> %lo %hi
VparXvol@:
        :: BINT15 BINT14 BINT2 XLIB VparGet ;    * B65DD

* ROMPTR 0B5 081
* refs (1): B4B39
* %lo %hi ->
VparXvol!:
        :: BINT15 SWAP BINT14 BINT2 XLIB VparPut ; * B6601

* ROMPTR 0B5 082
* refs (1): B4B39
* -> %near %far
VparYvol@:
        :: BINT13 BINT12 BINT2 XLIB VparGet ;    * B662A

* ROMPTR 0B5 083
* refs (1): B4B39
* %near %far ->
VparYvol!:
        :: BINT13 SWAP BINT12 BINT2 XLIB VparPut ; * B664E

* ROMPTR 0B5 084
* refs (1): B4B39
* -> %lo %hi
VparZvol@:
        :: BINT11 BINT10 BINT2 XLIB VparGet ;    * B6677

* ROMPTR 0B5 085
* refs (1): B4B39
* %lo %hi ->
VparZvol!:
        :: BINT11 SWAP BINT10 BINT2 XLIB VparPut ; * B669B

* ROMPTR 0B5 086
* refs (1): B4B39
* -> %x %y %z
VparEye@:
        :: BINT5 BINT4 BINT3 BINT3 XLIB VparGet ; * B66C4

* ROMPTR 0B5 087
* refs (1): B4B39
* %x %y %z ->
VparEye!:
        :: BINT5 3UNROLL BINT4 SWAP BINT3 BINT3 XLIB VparPut ; * B66ED

* ROMPTR 0B5 088
* refs (1): B4B39
* -> %lo %hi
VparXXrng@:
        :: BINT9 BINT8 BINT2 XLIB VparGet ;      * B6720

* ROMPTR 0B5 089
* refs (1): B4B39
* %lo %hi ->
VparXXrng!:
        :: BINT9 SWAP BINT8 BINT2 XLIB VparPut ; * B6744

* ROMPTR 0B5 08A
* refs (1): B4B39
* -> %lo %hi
VparYYrng@:
        :: BINT7 BINT6 BINT2 XLIB VparGet ;      * B676D

* ROMPTR 0B5 08B
* refs (1): B4B39
* %lo %hi ->
VparYYrng!:
        :: BINT7 SWAP BINT6 BINT2 XLIB VparPut ; * B6791

* ROMPTR 0B5 08C
* refs (1): B4B39
* -> 15 values of VPAR, the defaults if VPAR is bad. A list marks the stack so that an error can be cleaned up
VparVals:
        :: {}_23989 ERRSET XLIB RclVPAR ERRTRAP XLIB VparDefault> BINT16 * B67BA
          ROLL DROP ;                            * B67E9

* ROMPTR 0B5 08D
* refs (1): B4B39
* Error path of VparVals: drops everything down to the marker, then gives the defaults
VparDefault>:
        :: BEGIN {}_23989 EQ UNTIL {}_23989      * B67F8

* ROMPTR 0B5 08E
* refs (1): B4B39
* Default VPAR: Xleft Xright Ynear Yfar Zlow Zhigh XXleft XXright YYnear YYfar Xeye Yeye Zeye Nx Ny
VparDefaults:
          { %-1 %1 %-1 %1 %-1 %1 %-1 %1 %-1 %1 %0_2A2B4 %-3 %0_2A2B4 %10 %8 } * B6816
          INCOMPDROP ;                           * B686B

* ROMPTR 0B5 08F
* refs (1): B4B39
* #i1..#ik #k -> values: elements of VPAR, each index counted from the end (1 = Ny, 15 = Xleft)
VparGet:
        :: XLIB VparVals BINT16 PICK ZERO_DO BINT17 ROLL INDEX@ #- ROLL * B6875
          BINT15 UNROLL LOOP BINT16 ROLL BINT15 SWAP #- NDROP ; * B68AD

* ROMPTR 0B5 090
* refs (1): B4B39
* v1 #i1 .. vk #ik #k -> : replaces those elements and stores VPAR
VparPut:
        :: XLIB VparVals BINT16 PICK ZERO_DO BINT17 PICK ROLL DROP BINT17 * B68DF
          ROLL BINT17 ROLL UNROLL LOOP BINT15 {}N SWAPDROP * B6917

* ROMPTR 0B5 091
* refs (1): B4B39
* {} -> : stores in VPAR
VparSto:
          :: ' ID VPAR STOAPPLDATA ; ;           * B693F

* ROMPTR 0B5 092
* refs (1): B4B39
* -> ob|-1: variable EXPR, shared by the Symbolic forms
SymFGetExpr:
        :: ' ID EXPR SAFE@_HERE ?SEMI            * B6967
          MINUSONE ;                             * B698A

* ROMPTR 0B5 093
* refs (1): B4B39
* ob|-1 -> : stores EXPR unless the field is empty
SymFPutExpr:
        :: DUP MINUSONE EQUAL caseDROP '         * B6994
          ID EXPR XEQSTOID ;                     * B69B2

* ROMPTR 0B5 094
* refs (1): B4B39
* -> flag: default of the Result field, symbolic (flag -3 clear)
SymFSymbolic?:
        :: BINT3 TestSysFlag NOT ;               * B69CB  flag -3: Function → symb / Function → num

* ROMPTR 0B5 095
* refs (1): B4B39
* -> flag: flag -1
SymFPrincipal?:
        :: BINT1 TestSysFlag ;                   * B69E4  flag -1: General solutions / Principal value

* ROMPTR 0B5 096
* refs (1): B4B39
* flag -> : sets flag -1
SymFPrincipal!:
        :: BINT1 SWAP ITE SetSysFlag ClrSysFlag  * B69F8
        ;                                        * B6A16

* ROMPTR 0B5 097
* refs (1): B4B39
* Integrate form: runs the integral with flag -3 as the form asks, and restores it afterwards, also on error
SymFIntegrate:
        :: NOTNUM? SWAP ITE SETNUM CLRNUM        * B6A1B
          case                                   * B6A39
          :: 2SWAP ERRSET XEQINTEGID ERRTRAP cf(-3);error CLRNUM ; * B6A3E
          2SWAP ERRSET XEQINTEGID ERRTRAP sf(-3);error SETNUM ; * B6A66

* ROMPTR 0B5 098
* refs (1): B4B39
* expr var value flagNum -> result: Differentiate form. A value is substituted through WHERE; with flagNum the result is evaluated, and with no value it stays symbolic
SymFDeriv:
        :: 2DUP ITE                              * B6A89
          :: MINUSONE EQUAL NOT?SEMI             * B6A98
            DROPFALSE ;                          * B6AAC
          DROP                                   * B6AB6
          2SWAP DUP symcomp ROT symcomp BINT2 Cr xDER 2SWAP case * B6ABB
          :: ROTSWAP TWO{}N WHERE CRUNCH ;       * B6AED
          DROP SWAPDUP symcomp TWO{}N uncrunch WHERE ; * B6B0B

* ROMPTR 0B5 099
* refs (1): B4B39
* STEP key of the Differentiate form: one evaluation of the unexpanded derivative
SymFDerivStep:
        :: 2DROP XLIB IFCkVal SWAP XLIB IFCkVal SWAP symcomp SWAP symcomp * B6B2E
          BINT2 Cr xDER uncrunch COMPEVAL ;      * B6B67

* ROMPTR 0B5 09A
* refs (1): B4B39
* expr var %n flagNum -> poly
SymFTaylor:
        :: NOTcase SYMTAYLR                      * B6B85
          SYMTAYLR CRUNCH ;                      * B6B94

* ROMPTR 0B5 09B
* refs (1): B4B39
* expr var flagNum -> result
SymFIsol:
        :: NOTcase SYMISOL                       * B6BA3
          SYMISOL EqRHS CRUNCH ;                 * B6BB2

* ROMPTR 0B5 09C
* refs (1): B4B39
* expr var flagNum -> result
SymFQuad:
        :: NOTcase SYMQUAD                       * B6BC6
          SYMQUAD EqRHS CRUNCH ;                 * B6BD5

* ROMPTR 0B5 09D
* refs (1): B4B39
* ob -> ob'
SymFColct:
        :: XLIB IFCkVal SYMCOLCT ;               * B6BE9

* ROMPTR 0B5 09E
* refs (1): B4B39
* ob -> ob'
SymFExpan:
        :: XLIB IFCkVal SYMEXPAN ;               * B6C03

* ROMPTR 0B5 09F
* refs (1): B4B39
* Match Expression form: builds { pattern replacement [condition] } and runs ↑MATCH or ↓MATCH, leaving the result only
SymFMatch:
        :: SWAP 4UNROLL ROT XLIB IFCkVal ROT XLIB IFCkVal ROT DUP MINUSONE * B6C1D
          EQUAL ITE                              * B6C5B
          :: DROP BINT2 ; BINT3                  * B6C65
          {}N ROT XLIB IFCkVal SWAPROT ITE xMATCHUP xMATCHDN * B6C7E
          DROP ;                                 * B6CA7

* ROMPTR 0B5 0A0
* refs (1): B4B39
* Choose list of the Result field
SymFResultItems:
        { XLIB SymFItemSymb XLIB SymFItemNum }   * B6CB1

* ROMPTR 0B5 0A1
* refs (1): B4B39
* Item: message, flag
SymFItemSymb:
        { # BD26 FALSE }                         * B6CD1  "Symbolic"

* ROMPTR 0B5 0A2
* refs (1): B4B39
* Item: message, flag
SymFItemNum:
        { # BD27 TRUE }                          * B6CEA  "Numeric"

* ROMPTR 0B5 0A3
* refs (1): B4B39
* -> %h %m %s item: current time as form fields
TimNow:
        :: TOD                                   * B6D03

* ROMPTR 0B5 0A4
* refs (1): B4B39
* %hms -> %h %m %s item: splits HH.MMSS. item is AM, PM or 24-hour from flag -41, and the hour is converted to 12-hour form if needed
Tim%>Fields:
          :: DUP %IP SWAP %FP %100 %* DUP %IP SWAP %FP %100 %* %IP * B6D0D
            XLIB TimAMPMItems                    * B6D53
            :: BINT41 TestSysFlag case BINT3     * B6D5E  flag -41: 12-hour clock / 24-hour clock
              4PICK %12 %> ITE                   * B6D77
              :: 4ROLL %12 %- 4UNROLL BINT2 ;    * B6D8B
              :: 4PICK %12 %= case BINT2         * B6DAE
                4ROLL DUP%0= IT                  * B6DCC
                :: DROP %12 ;                    * B6DDB
                4UNROLL BINT1 ;                  * B6DEF
            ;                                    * B6DFE
            NTHCOMPDROP ;                        * B6E03
        ;                                        * B6E0D

* ROMPTR 0B5 0A5
* refs (1): B4B39
* %h %m %s item -> : sets the clock from the form fields
TimSetTime:
        :: XLIB NTHEval3 5UNROLL 5UNROLL %IP % 1E4 %/ SWAP %IP %100 %/ %+ * B6E12
          SWAP %IP                               * B6E64
          :: 4ROLL case ROTDROP                  * B6E6E
            3PICK ?SKIP                          * B6E82
            :: DUP %12 %= casedrop %0_2A2B4      * B6E8C
            ;                                    * B6EAA
            ROT OVER %12 %< AND IT               * B6EAF
            :: %12 %+ ;                          * B6ECD
          ;                                      * B6EE1
          %+ >TIME ;                             * B6EE6

* ROMPTR 0B5 0A6
* refs (1): B4B39
* -> %m %d %yy
TimToday:
        :: DATE                                  * B6EF5

* ROMPTR 0B5 0A7
* refs (1): B4B39
* %date -> %m %d %yy: splits a date as flag -42 lays it out. The year keeps two digits
Date>Fields:
          :: DUP %IP SWAP %FP %100 %* DUP %IP SWAP %100 %* %FP %100 %* * B6EFF
            BINT42 TestSysFlag IT ROTSWAP        * B6F4A  flag -42: mm/dd/yy format / dd.mm.yy format
          ;                                      * B6F5E
        ;                                        * B6F63

* ROMPTR 0B5 0A8
* refs (1): B4B39
* %m %d %yy -> : sets the date from the form fields
TimSetDate:
        :: BINT42 TestSysFlag IT ROTSWAP         * B6F68  flag -42: mm/dd/yy format / dd.mm.yy format
          %IP %100 %/ %FP %100 %* COERCE XLIB TimYear% SWAP %IP %100 %/ %FP * B6F81
          %+ %+ >DATE ;                          * B6FC8

* ROMPTR 0B5 0A9
* refs (1): B4B39
* #month #yy -> #days: table of days in a month. For February it tests whether 29 February is a valid date
TimMonthDays:
        :: OVER                                  * B6FDC
          CON(5)  DOARRY                         * B6FE6  array 12
          LENGTH                                 * B6FEB  length, to #B703B
          CON(5)  DOBINT                         * B6FF0  element type
          CON(5)  1                              * B6FF5  dimensions
          CON(5)  12                             * B6FFA
          CON(5)  #1F                            * B6FFF
          CON(5)  #1C                            * B7004
          CON(5)  #1F                            * B7009
          CON(5)  #1E                            * B700E
          CON(5)  #1F                            * B7013
          CON(5)  #1E                            * B7018
          CON(5)  #1F                            * B701D
          CON(5)  #1F                            * B7022
          CON(5)  #1E                            * B7027
          CON(5)  #1F                            * B702C
          CON(5)  #1E                            * B7031
          CON(5)  #1F                            * B7036
        ENDLENGTH                                * B703B
          GETATELN DROP SWAPROT #2<> caseDROP BINT42 * B703B
          SysITE % 2.902E1 % 2.29E0 SWAP         * B7059

* ROMPTR 0B5 0AA
* refs (1): B4B39
* #yy -> %: full year divided by 1E6, for adding to a date. Two-digit years above 90 are 19xx, the others 20xx
TimYear%:
          :: DUP # 5A #> ITE # 76C # 7D0         * B708D
            #+ UNCOERCE % 1E6 %/ ;               * B70BF
          %+                                     * B70E8
          CODE                                   * B70ED  51 nibbles
            GOSBVL  POP1%                        * B70F7
            GOSBVL  ClkFlags>ST                  * B70FE
            GOSBVL  %>YMD                        * B7105
            SETHEX                               * B710C
            ST=0    1                            * B710E
            GONC    TimYear%.L1                  * B7111
            ST=1    1                            * B7114
TimYear%.L1:
            GOSBVL  GETPTR                       * B7117
            ?ST=1   1                            * B711E
            GOYES   TimYear%.L2                  * B7121
TimYear%.L2:
            GOVLNG  PushT/FLoop                  * B7123
          ENDCODE                                * B712A
          ?SEMI                                  * B712A
          #1+ ;                                  * B712F

* ROMPTR 0B5 0AB
* refs (1): B4B39
* #m #d #yy -> #dow: index into the day names, Monday first
TimDayOfWeek:
        :: XLIB TimYear% BINT42 TestSysFlag IT ROTSWAP * B7139  flag -42: mm/dd/yy format / dd.mm.yy format
          SWAP UNCOERCE %100 %/ %+ SWAP UNCOERCE %+ Date>hxs13 * B715D
          CODE                                   * B718A  53 nibbles
            A=DAT1  A                            * B7194
            AD1EX                                * B7197
            D1=D1+  10                           * B719A
            C=0     W                            * B719D
            C=DAT1  13                           * B71A0
            R0=C                                 * B71A4
            D1=A                                 * B71A7
            D1=D1+  5                            * B71AA
            D=D+1   A                            * B71AD
            GOSBVL  SAVPTR                       * B71AF
            C=R0                                 * B71B6
            GOSBVL  dowutil                      * B71B9
            SETHEX                               * B71C0
            GOVLNG  PUSH#ALOOP                   * B71C2
          ENDCODE                                * B71C9
        ;                                        * B71C9

* ROMPTR 0B5 0AC
* refs (1): B4B39
* Set Alarm form: turns the fields into a date, a time and a repeat in ticks, and stores the alarm. An empty message becomes ""
TimStoAlarm:
        :: XLIB ~BINT3;NTHCOMPROM@ 6ROLL XLIB NTHEval3 SWAP BINT11 UNROLL * B71CE
          4ROLL %IP %100 %/ %FP %100 %* COERCE XLIB TimYear% 5ROLL 6ROLL * B71FD
          BINT42 TestSysFlag ?SKIP SWAP          * B723A  flag -42: mm/dd/yy format / dd.mm.yy format
          %IP %100 %/ %FP ROT %+ SWAP %IP %100 %/ %FP %100 %* %+ 8UNROLL * B724E
          4ROLL %IP %100 %/ %FP %100 %/ 5ROLL %IP %100 %/ %FP %+ 5ROLL %IP * B7299
          %100 %/ %FP %100 %*                    * B72E4
          :: ROT 8ROLL caseDROP ITE              * B72FD
            :: DUP %11 %> ?SEMI                  * B7316
              %12 %+ ;                           * B732F
            :: DUP %12 %<> ?SEMI                 * B733E
              DROP %0_2A2B4 ;                    * B7357
          ;                                      * B7366
          %+ 4UNROLL %* SWAPDUP MINUSONE EQUAL IT DROPNULL$ * B736B
          SWAP StoAlarms(2r,_,r) DROP ;          * B7393

* ROMPTR 0B5 0AD
* refs (1): B4B39
* item -> : sets flag -41 from the AM, PM or 24-hour item
Tim24h!:
        :: XLIB NTHEval3 DROP BINT41 SWAP ITE SetSysFlag ClrSysFlag * B73A7
        ;                                        * B73D5

* ROMPTR 0B5 0AE
* refs (1): B4B39
* -> item: M/D/Y or D.M.Y from flag -42
TimDateFmt@:
        :: BINT42 SysITE XLIB TimItemDMY XLIB TimItemMDY ; * B73DA  flag -42: mm/dd/yy format / dd.mm.yy format

* ROMPTR 0B5 0AF
* refs (1): B4B39
* item -> : sets flag -42
TimDateFmt!:
        :: XLIB ~BINT3;NTHCOMPROM@ BINT42 SWAP ITE SetSysFlag ClrSysFlag * B7404
        ;                                        * B742D

* ROMPTR 0B5 0B0
* refs (1): B4B39
* #m #yy -> { { $ %day } ... }: choose list of a month's days, as "dd Weekday"
TimDayItems:
        :: 2DUP XLIB TimMonthDays 3NULLLAM{} BIND 1GETLAM #1+_ONE_DO INDEX@ * B7432
          DUP DUP #>$ SWAP BINT10 #< IT          * B7460
          :: CHR_Space >H$ ;                     * B7483
          APPEND_SPACE                           * B7497
          { # BC15 # BC16 # BC17 # BC18 # BC19 # BC1A # BC1B } 3GETLAM * B749C  "Monday"  "Tuesday"  "Wednesday"  "Thursday"  "Friday"  "Saturday"  "Sunday"
          INDEX@ 2GETLAM XLIB TimDayOfWeek NTHCOMPDROP JstGetTHEMESG &$ SWAP * B74F1
          UNCOERCE TWO{}N LOOP 1GETABND {}N ;    * B751A

* ROMPTR 0B5 0B1
* refs (1): B4B39
* %yy -> { 5 years }: choose list of this year and the next four, modulo 100
TimYearItems:
        :: DUP COERCE BINT4 ZERO_DO #1+ BINT100 #/ DROP DUP UNCOERCE SWAP * B7538
          LOOP DROP BINT5 {}N ;                  * B7574

* ROMPTR 0B5 0B2
* refs (1): B4B39
* -> { %0 .. %59 }: choose list of minutes and seconds
TimMinItems:
        :: BINT60 ZERO_DO INDEX@ UNCOERCE LOOP BINT60 {}N ; * B758D

* ROMPTR 0B5 0B3
* refs (1): B4B39
* Choose list of the repeat multiple
AlmMultItems:
        { %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 }       * B75BA

* ROMPTR 0B5 0B4
* refs (1): B4B39
* Choose list of hours
TimHourItems:
        { %0_2A2B4 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 * B75F6
          %17 %18 %19 %20 %21 %22 %23 }          * B7650

* ROMPTR 0B5 0B5
* refs (1): B4B39
* { AM PM 24-hour }
TimAMPMItems:
        { XLIB TimItemAM XLIB TimItemPM XLIB TimItem24h } * B7678

* ROMPTR 0B5 0B6
* refs (1): B4B39
* Item: message, short message, and an action giving the flags 24-hour? and PM?
TimItemAM:
        { # BC1D # BC1D                          * B76A3  "AM"  "AM"
          :: FALSE FALSE ; }                     * B76BC

* ROMPTR 0B5 0B7
* refs (1): B4B39
TimItemPM:
        { # BC1E # BC1E                          * B76D5  "PM"  "PM"
          :: FALSE TRUE ; }                      * B76EE

* ROMPTR 0B5 0B8
* refs (1): B4B39
TimItem24h:
        { # BC1F # BC20                          * B7707  "24-hour time"  "24-hr"
          :: TRUE FALSE ; }                      * B7720

* ROMPTR 0B5 0B9
* refs (1): B4B39
* Choose list of months; each item is a message and the month number
TimMonthItems:
        { XLIB TimMonthItems~1 XLIB TimMonthItems~2 XLIB TimMonthItems~3 * B7739
          XLIB TimMonthItems~4 XLIB TimMonthItems~5 XLIB TimMonthItems~6 * B775F
          XLIB TimMonthItems~7 XLIB TimMonthItems~8 XLIB TimMonthItems~9 * B7780
          XLIB TimMonthItems~10 XLIB TimMonthItems~11 XLIB TimMonthItems~12 } * B77A1

* ROMPTR 0B5 0BA
* refs (1): B4B39
TimMonthItems~1:
        { # BC21 %1 }                            * B77C7  " 1 January"

* ROMPTR 0B5 0BB
* refs (1): B4B39
TimMonthItems~2:
        { # BC22 %2 }                            * B77E0  " 2 February"

* ROMPTR 0B5 0BC
* refs (1): B4B39
TimMonthItems~3:
        { # BC23 %3 }                            * B77F9  " 3 March"

* ROMPTR 0B5 0BD
* refs (1): B4B39
TimMonthItems~4:
        { # BC24 %4 }                            * B7812  " 4 April"

* ROMPTR 0B5 0BE
* refs (1): B4B39
TimMonthItems~5:
        { # BC25 %5 }                            * B782B  " 5 May"

* ROMPTR 0B5 0BF
* refs (1): B4B39
TimMonthItems~6:
        { # BC26 %6 }                            * B7844  " 6 June"

* ROMPTR 0B5 0C0
* refs (1): B4B39
TimMonthItems~7:
        { # BC27 %7 }                            * B785D  " 7 July"

* ROMPTR 0B5 0C1
* refs (1): B4B39
TimMonthItems~8:
        { # BC28 %8 }                            * B7876  " 8 August"

* ROMPTR 0B5 0C2
* refs (1): B4B39
TimMonthItems~9:
        { # BC29 %9 }                            * B788F  " 9 September"

* ROMPTR 0B5 0C3
* refs (1): B4B39
TimMonthItems~10:
        { # BC2A %10 }                           * B78A8  "10 October"

* ROMPTR 0B5 0C4
* refs (1): B4B39
TimMonthItems~11:
        { # BC2B %11 }                           * B78C1  "11 November"

* ROMPTR 0B5 0C5
* refs (1): B4B39
TimMonthItems~12:
        { # BC2C %12 }                           * B78DA  "12 December"

* ROMPTR 0B5 0C6
* refs (1): B4B39
* Choose list of the repeat unit
AlmUnitItems:
        { XLIB AlmUnitWeek XLIB AlmUnitDay XLIB AlmUnitHour XLIB AlmUnitMin * B78F3
          XLIB AlmUnitSec }                      * B7924

* ROMPTR 0B5 0C7
* refs (1): B4B39
* Item: message, unit number, ticks. The tick count is a ROMPTR of its own, the next one
AlmUnitWeek:
        { # BC2D BINT1                           * B7934  "Week"

* ROMPTR 0B5 0C8
* refs (1): B4B39
* 8192 ticks a second
TicksPerWeek:
          % 4.9545216E9 }                        * B7948

* ROMPTR 0B5 0C9
* refs (1): B4B39
AlmUnitDay:
        { # BC2E BINT2                           * B7962  "Day"

* ROMPTR 0B5 0CA
* refs (1): B4B39
TicksPerDay:
          % 7.077888E8 }                         * B7976

* ROMPTR 0B5 0CB
* refs (1): B4B39
AlmUnitHour:
        { # BC2F BINT3                           * B7990  "Hour"

* ROMPTR 0B5 0CC
* refs (1): B4B39
TicksPerHour:
          % 2.94912E7 }                          * B79A4

* ROMPTR 0B5 0CD
* refs (1): B4B39
AlmUnitMin:
        { # BC30 BINT4                           * B79BE  "Minute"

* ROMPTR 0B5 0CE
* refs (1): B4B39
TicksPerMin:
          % 4.9152E5 }                           * B79D2

* ROMPTR 0B5 0CF
* refs (1): B4B39
AlmUnitSec:
        { # BC31 BINT5                           * B79EC  "Second"

* ROMPTR 0B5 0D0
* refs (1): B4B39
TicksPerSec:
          % 8.192E3 }                            * B7A00

* ROMPTR 0B5 0D1
* refs (1): B4B39
* Plural unit names by unit number
AlmUnitNames:
        { # BC32 # BC33 # BC34 # BC35 # BC36 }   * B7A1A  "Weeks"  "Days"  "Hours"  "Minutes"  "Seconds"

* ROMPTR 0B5 0D2
* refs (1): B4B39
* Choose list of the date format
TimDateFmtItems:
        { XLIB TimItemMDY XLIB TimItemDMY }      * B7A56

* ROMPTR 0B5 0D3
* refs (1): B4B39
TimItemMDY:
        { # BC37 # BC38 FALSE }                  * B7A76  "Month/Day/Year"  "M/D/Y"

* ROMPTR 0B5 0D4
* refs (1): B4B39
TimItemDMY:
        { # BC39 # BC3A TRUE }                   * B7A99  "Day.Month.Year"  "D.M.Y"

* ROMPTR 0B5 0D5
* refs (1): B4B39
* -> #: number of alarms
AlmCount:
        :: ALARMS@ LENCOMP ;                     * B7ABC

* ROMPTR 0B5 0D6
* refs (1): B4B39
* # -> alarm: Nonexistent Alarm if there is none
AlmGet:
        :: RCLALM NOTcase NOALARMERR             * B7AD0
        ;                                        * B7AE4

* ROMPTR 0B5 0D7
* refs (1): B4B39
* alarm -> $: alarm browser line: date, time, " R " when repeating, message
AlmLine:
        :: ALRMLS> INCOMPDROP 2SWAP TIMESTR SWAP %0= ITE $ "   " $ " R " * B7AE9
          &$ SWAP DUP MINUSONE EQUAL caseDROP DUPTYPECSTR? * B7B31
          ?SKIP                                  * B7B54
          :: BINT4 XLIB IFDecomp ;               * B7B59
          &$ ;                                   * B7B73
