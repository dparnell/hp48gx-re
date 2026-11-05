* HP 48GX ROM revision R, #57004-#5A01C: Symbolic algebra: user-function derivatives, ISOL, EXPAN, COLCT, SHOW, QUAD, TAYLR and the RULES menu commands
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: BindDvDup IsolContinue IsolInv1 drop;q_58A0C IsolInvN ObInMeta MEQU? Π'+s Π'*s SYMCOLCT Pict3DPrep Isol2πIn
* Follows on from the previous file (at #57004 in the original ROM).
        RPL

* refs (4): 2E605 2E65F 2E826 56F4A
nm=>st:
        :: DUPTYPEIDNT? ?SKIP LAM>ID             * 57004
          ID>$ ;                                 * 57018

* refs (5): 85EAD 85F2F 85F8E 85FF2 86704
* meta -> ...: bind dv and take the derivative of each argument
DerArgs:
        :: BindDv pshzer parg& COLA MetaConcase  * 57022
        ;                                        * 57040

* refs (22): 860BA 86150 861A5 86213 86263 862C7 ...
* Derivatives: bind the variable to 'dv, then duplicate the argument meta
BindDvDup:
        :: BindDv dup ;                          * 57045

* refs (1): 571D1
* ...: 3D plots: move 7 of the lams to the places the 2D code expects, then copy the rest in
Lams3DOrder:
        :: BINT28 ROLL BINT28 4GETLAM 5GETLAM 6GETLAM 9GETLAM 10GETLAM * 57059
          15GETLAM 16GETLAM BINT7 psh DROP BINT29 ONE_DO INDEX@ PUTLAM LOOP * 57086
          DROP 20PUTLAM 15PUTLAM 10PUTLAM 9PUTLAM 6PUTLAM 5PUTLAM 21PUTLAM ; * 570B8

* refs (1): C0228
* -> : WIREFRAME: element 13 of the plot info, run on entering PICTURE
WirePictStart:
        :: OBJ_73230                             * 570E5
          :: Pict3DPrep WirePictStart~1 ; ;      * 570EF

* refs (1): C0410
* -> : GRIDMAP: element 13 of the plot info, run on entering PICTURE
GridPictStart:
        :: OBJ_73230                             * 57108
          :: Pict3DPrep GridPictStart~1 ; ;      * 57112

* refs (1): C031C
* -> : PARSURFACE: element 13 of the plot info, run on entering PICTURE
ParsurfPictStart:
        :: OBJ_73230                             * 5712B
          :: Pict3DPrep ParsurfPictStart~1 ; ;   * 57135

* refs (1): C06EC
* -> : PCONTOUR: element 13 of the plot info, run on entering PICTURE
PcontourPictStart:
        :: OBJ_73230                             * 5714E
          :: Pict3DPrep PcontourPictStart~1 ; ;  * 57158

* refs (6): 45C49 45C6C 570F4 57117 5713A 5715D
* -> : entering PICTURE on a 3D plot: with no EQ, plain menu and leave; otherwise set up lams and the depth
Pict3DPrep:
        :: EqExists? NOTcase                     * 57171
          :: BINT21 ROLLDROP ' PictMenuBare BINT21 UNROLL RDROP * 57180
            XLIB PlotEnvOK ;                     * 571A8
          'REVAL BINT24 ROLLDROP BINT23 UNROLL Lams3DOrder 18GETLAM ' * 571B8
          Π'SAVEDDEPTH STOLAM TRUE'              * 571E0

Π'EnvOK_571EF:
          LAM 'EnvOK STOLAM DispMenu ;           * 571EF

* refs (1): 570F9
* Probably: wireframe setup on entering PICTURE
WirePictStart~1:
        ::                                       * 57211

* refs (5): 44F52 44F81 458EE 8AB90 8B5B6
* -> ...: 3D plots: read the view parameters and bind them, then make the independent variable
Plot3DBind:
          :: XLIB VPARBounds XLIB Plot3DVars XLIB Plot3DLams BIND ; * 57216
          XLIB WireSetup DUP ' PlotEval XLIB WireInit ' NOP %1 * 57246
          XLIB Plot3DBegin MakeIndep ;           * 5727A
        BSS     4                                * 5728F  zeros

* sym id -> symb
* refs (3): 20AA2 B6BAD B6BB2
SYMISOL:
        ::                                       * 57293
          :: 2DUP %0_2A2B4 3UNROLL BINT1 SWAPROT SINNER get1 SYMISOL~1 * 57298
            IsolStep ABND NOTcase SETISOLERR     * 572C5
          ;                                      * 572D9
          DUP#2+PICK ObInMeta case SETISOLERR    * 572DE
          DROP #1+ PTR addt: x= get1 DROP CKSYMBN uncrunch coleval ; * 572F2

* refs (3): 572C5 57626 86DB2
* meta ob -> ...: ISOL: unwrap one operator around the variable by its inverse from the operator's trailer
IsolStep:
        :: ObInMeta NOTcase DROP2dropf           * 57324
          OVER #1=case                           * 57338
          :: DROP 2DROP TRUE ;                   * 57342
          3UNROLL #1-SWAP ROTSWAP nonopcase 2DROP2dropf * 5735B
          REQcasedrop xFCNAPPLY                  * 57374
          IsolStep~1 CmdField5 NOTcase 2DROP2dropf * 5737E
          COLA_EVAL ;                            * 57392

* refs (1): 5737E
* Probably: ISOL: run the operator's isolation rule from its ROMPTR
IsolStep~1:
        :: SWAP#1-SWAP 4ROLL CARCOMP NOTROMPcase 2DROP2dropf * 5739C
          DUP CmdField5 NOTcasedrop 2DROP2dropf  * 573BA
          SWAP ROMPinfarg? ?SKIP                 * 573CE
          :: 4ROLLDROP ROT #1- 3UNROLL ;         * 573DD
          COLA_EVAL ;                            * 573FB

* meta1 meta2 ob1 ob2 -> F
* refs (4): 5736F 5738D 573B5 573C9
2DROP2dropf:
        :: drop;dq DROP2dropf ;                  * 57405

* meta1 meta2 ob -> F
* refs (2): 57333 5740F
DROP2dropf:
        :: DROPNDROP NDROP FALSE ;               * 57419

* meta1 meta2 ob -> meta1&ob meta2
* refs (4): 57635 5765D 86BB4 86D8F
addtpsh:
        :: SWAP#1+ psh ;                         * 57432

* refs (1): 1AC89
* ISOL rule of +
Isol+Rule:
        XLIB Isol+                               * 57446

* refs (2): 1A982 1ADDB
* ISOL rule of - and =
Isol-Rule:
        XLIB Isol-                               * 57451

* refs (1): 1AEF2
* ISOL rule of *
Isol*Rule:
        XLIB Isol*                               * 5745C

* refs (1): 1AFEB
* ISOL rule of /
Isol/Rule:
        XLIB Isol/                               * 57467

* refs (1): 1B0D7
* ISOL rule of ^
Isol^Rule:
        XLIB Isol^                               * 57472

* refs (1): 86D35
Isol^~1:
        XLIB Isol^Base                           * 5747D

* refs (1): 1AA0C
~IsolInv1;xNEG:
        :: IsolInv1 xNEG ;                       * 57488

* refs (1): 1B2BE
~IsolInv1;xINV:
        :: IsolInv1 xINV ;                       * 5749C

* refs (1): 1B937
* ISOL rule of EXP
IsolEXPRule:
        XLIB IsolEXP                             * 574B0

* refs (1): 1B981
~IsolInv1;xEXP:
        :: IsolInv1 xEXP ;                       * 574BB

* refs (1): 1B4E8
* ISOL rule of SIN
IsolSINRule:
        XLIB IsolSIN                             * 574CF

* refs (1): 1B541
* ISOL rule of COS
IsolCOSRule:
        XLIB IsolCOS                             * 574DA

* refs (1): 1B59A
* ISOL rule of TAN
IsolTANRule:
        XLIB IsolTAN                             * 574E5

* refs (1): 1B5E9
* ISOL rule of SINH
IsolSINHRule:
        XLIB IsolSINH                            * 574F0

* refs (1): 1B638
* ISOL rule of COSH
IsolCOSHRule:
        XLIB IsolCOSH                            * 574FB

* refs (1): 1B687
* ISOL rule of TANH
IsolTANHRule:
        XLIB IsolTANH                            * 57506

* refs (1): 1B6D6
~IsolInv1;xSIN:
        :: IsolInv1 xSIN ;                       * 57511

* refs (1): 1B761
~IsolInv1;xCOS:
        :: IsolInv1 xCOS ;                       * 57525

* refs (1): 1B7CE
~IsolInv1;xTAN:
        :: IsolInv1 xTAN ;                       * 57539

* refs (1): 1B81D
~IsolInv1;xSINH:
        :: IsolInv1 xSINH ;                      * 5754D

* refs (1): 1B862
~IsolInv1;xCOSH:
        :: IsolInv1 xCOSH ;                      * 57561

* refs (1): 1B8D4
~IsolInv1;xTANH:
        :: IsolInv1 xTANH ;                      * 57575

* refs (1): 1B46C
* ISOL rule of SQ: ±√ with the sign variable s
IsolSQ:
        :: IsolInvN xSQRT Isol*s IsolContinue ;  * 57589

* refs (1): 1B3BA
~IsolInv1;xSQ:
        :: IsolInv1 xSQ ;                        * 575A7

* refs (1): 1B9F8
~IsolInv1;xALOG:
        :: IsolInv1 xALOG ;                      * 575BB

* refs (1): 1BAB4
~IsolInv1;xEXPM:
        :: IsolInv1 xEXPM ;                      * 575CF

* refs (1): 1BA6F
* ISOL rule of ALOG
IsolALOGRule:
        XLIB IsolALOG                            * 575E3

* refs (1): 1AAAA
~IsolInv1;xCONJ:
        :: IsolInv1 xCONJ ;                      * 575EE

* refs (1): 1BAEA
* ISOL rule of EXPM
IsolEXPMRule:
        XLIB IsolEXPM                            * 57602

* refs (21): 5759D 5764E 5766C 86BCD 86C3B 86C9A ...
* SYMISOL: carry on isolating with the next inverse (tail call into the isolation loop)
IsolContinue:
        :: RDROP psh #1-SWAP COLA IsolStep       * 5760D
        ;                                        * 5762B

* refs (10): 5758E 86E70 86E98 86EBB 86EE3 86F06 ...
* Isolation step for an inverse with many values: as IsolInv1 for principal solutions (flag -1); otherwise goes on to the general-solution terms after it
IsolInvN:
        :: addtpsh 'R SWAP#1+ PRSOL? case IsolContinue * 57630
        ;                                        * 57653

* refs (13): 5748D 574A1 574C0 57516 5752A 5753E ...
* Isolation step for an inverse with one value: the inverse function follows in the runstream (:: IsolInv1 xNEG ;)
IsolInv1:
        :: addtpsh 'RRDROP SWAP#1+ IsolContinue ; * 57658

* refs (8): 572E3 57329 5A1D0 86BAA 86BF0 86C5E ...
* meta ob -> meta ob flag: the secondary around ObInMeta?
ObInMeta:
        :: OVER BEGIN DUP#0=case                 * 57676

* meta ob -> meta ob flag
ObInMeta?:
          ~DROPRDROP;FALSE                       * 5768A
          DUP #3+PICK 3PICK EQUALcase ~DROPRDROP;TRUE * 5768F
          #1- AGAIN ;                            * 576A8

* refs (2): 576A3 584DA
~DROPRDROP;TRUE:
        :: DROPRDROP TRUE ;                      * 576B7

* refs (2): 5768A 584FD
~DROPRDROP;FALSE:
        :: DROPRDROP FALSE ;                     * 576CB

* refs (2): 86F10 86F5B
* meta -> meta': add π·i·n, n a new integer variable
IsolπIn:
        ::                                       * 576DF

{PI,I,*}:
          { xPI xi x* } INNERCOMP ~TRUE;Π'ni;EVAL SWAP#1+ meta* ; * 576E4

* refs (6): 86D5D 86E3E 86E7A 86F38 86F7E 86FC4
* meta -> meta': add 2·π·i·n, n a new integer variable
Isol2πIn:
        ::                                       * 57716

{2,Pi,*,I,*}:
          { %2 xPI x* xi x* } INNERCOMP ~TRUE;Π'ni;EVAL SWAP#1+ meta* ; * 5771B

* refs (1): 86ECA
* -> meta: the full turn times n, in the current angle mode
Isol2πn:
        :: RAD? case                             * 57757
          :: %2 ' xPI 'x* ~TRUE;Π'ni;EVAL 'x* BINT5 ; * 57766
          DEG? ITE %360 %400                     * 57793
          ~TRUE;Π'ni;EVAL ' x* BINT3 ;           * 577A7

* refs (2): 86EA2 86EED
* -> meta: the half turn times n, in the current angle mode
Isolπn:
        :: RAD? case                             * 577C0
          :: ' xPI ~TRUE;Π'ni;EVAL 'x* BINT3 ;   * 577CF
          DEG? ITE %180 %200                     * 577F2
          ~TRUE;Π'ni;EVAL 'x* BINT3 ;            * 57806

* refs (2): 86EA7 86F15
* meta -> meta': multiply by (-1)^n
Isol(-1)^n:
        :: %-1 psh1&rev 3PICK psh1&rev psh PTR addt2: x^ x* pshtop& meta+ ; * 5781A

* refs (4): 57598 86DE9 86EC5 86F33
* meta -> meta': multiply by the sign variable s, a new one
Isol*s:
        :: ~TRUE;Π'ns;EVAL BINT1 pshtop& meta* ; * 57856

* refs (5): 86D62 86ECF 86EF2 86F3D 86F60
~top&;meta+:
        :: top& meta+ ;                          * 57874

* refs (6): 57702 57743 5777F 577A7 577DE 57806
~TRUE;Π'ni;EVAL:
        :: TRUE Π'ni EVAL ;                      * 57888

* refs (1): 5785B
~TRUE;Π'ns;EVAL:
        :: TRUE Π'ns EVAL ;                      * 578A1

* refs (1): 5790B
SYMISOL~4:
        { Π'ni Π'ns }                            * 578BA

* refs (2): 57892 578BF
Π'ni:
        LAM 'ni                                  * 578CE

* refs (2): 578AB 578C4
Π'ns:
        LAM 'ns                                  * 578DB

* refs (1): 572C0
SYMISOL~1:
        :: ' SYMISOL~2 TOTEMPOB ' SYMISOL~3 TOTEMPOB SYMISOL~4 BIND ; * 578E8
SYMISOL~2:
        CON(5)  DOCODE                           * 5791A  address
        LENGTH                                   * 5791F  code object's length, to #57938
        ASSEMBLE
        GOSBVL  SUB_57956                        * 57924  inline data follows

* ISOL's fresh-name template: ID "n0" and a spare byte for a second digit (SUB_57956 counts it up: n1, n2, ...)
n0:
        CON(5)  DOIDNT                           * 5792B  entry 0
        CON(2)  #02                              * 57930
        NIBASC  "n00"                            * 57932
        ENDLENGTH                                * 57938
SYMISOL~3:
        CON(5)  DOCODE                           * 57938  address
        LENGTH                                   * 5793D  code object's length, to #57956
        GOSBVL  SUB_57956                        * 57942  inline data follows

* ISOL's fresh-name template: ID "s0" and a spare byte for a second digit
s0:
        CON(5)  DOIDNT                           * 57949  entry 0
        CON(2)  #02                              * 5794E
        NIBASC  "s00"                            * 57950
        ENDLENGTH                                * 57956

* refs (2): 57924 57942
SUB_57956:
        C=RSTK                                   * 57956
        CD1EX                                    * 57958
        RSTK=C                                   * 5795B
        D1=D1+  5                                * 5795D
        C=DAT1  S                                * 57960
        D1=D1+  4                                * 57964
        C=DAT1  4                                * 57967
        C=C-1   S                                * 5796B
        C=C-1   S                                * 5796E
        C=C-1   S                                * 57971
        GONC    SUB_57956.L1                     * 57974
        P=      3                                * 57977
        CSL     WP                               * 57979
        CSL     WP                               * 5797C
        P=      0                                * 5797F
        LC(2)   #30                              * 57981
SUB_57956.L1:
        A=C     A                                * 57985
        LC(4)   #3030                            * 57987
        P=      3                                * 5798D
        C=A-C   WP                               * 5798F
        P=      0                                * 57992
        CPEX    2                                * 57994
        CPEX    0                                * 57998
        CPEX    1                                * 5799C
        SETDEC                                   * 579A0
        C=C+1   B                                * 579A2
        SETHEX                                   * 579A5
        CPEX    1                                * 579A7
        CPEX    0                                * 579AB
        CPEX    2                                * 579AF
        A=C     A                                * 579B3
        LC(4)   #3030                            * 579B5
        A=A+C   A                                * 579BB
        ?C=A    B                                * 579BD
        GOYES   SUB_57956.L3                     * 579C0
        DAT1=A  4                                * 579C2
        LC(2)   #03                              * 579C6
SUB_57956.loop2:
        D1=D1-  4                                * 579CA
        DAT1=C  2                                * 579CD
        D1=D1-  5                                * 579D1
        C=RSTK                                   * 579D4
        CD1EX                                    * 579D6
        DAT1=C  A                                * 579D9
        LC(5)   TOTEMPOB                         * 579DC
        A=C     A                                * 579E3
        PC=(A)                                   * 579E5
SUB_57956.L3:
        ASR     A                                * 579E9
        ASR     A                                * 579EB
        DAT1=A  B                                * 579ED
        LC(2)   #02                              * 579F0
        GOTO    SUB_57956.loop2                  * 579F4
        BSS     20                               * 579F8
        RPL

* symf -> symf
* refs (4): 20A58 20A62 20A6C B6C13
SYMEXPAN:
        :: EXPLODE BINT1 OVER#=case IMPLODE      * 57A0C
          pshzer pshzer expan IMPLODE CK0NOLASTWD ?ATTNQUIT ; * 57A25

* meta1 meta2 meta3 -> meta
* refs (1): 57A2F
expan:
        :: BEGIN ATTNFLG@ #0<> case              * 57A48
          :: RDROP top& pshtop& ;                * 57A61
          expan1 unrot over& DUP#0=case drop;q_58A0C * 57A7A
          larg AGAIN ;                           * 57A93

* meta -> meta1 meta2
* refs (1): 57A7A
expan1:
        :: ?expan^ AEQ1stcase xSQ                * 57AA2

expansq:
          :: ~addt2:;%2;x^ #1-SWAP COLA OBJ_57C3A * 57AB6
          ;                                      * 57ACF
          MetaD-> Meta<-D MetaE^ MetaL* ?expanneginv Meta->() ?expanapp * 57AD4
          +B21;PullB[1];<1> ;                    * 57AF7

* refs (1): 57AF2
?expanapp:
        :: M1stFNCcase ?expanapp~1               * 57B01
        ;                                        * 57B10

* refs (1): 57B0B
?expanapp~1:
        :: 4PICK ?expanapp~2 NOTcaseDROP COLA_EVAL * 57B15
        ;                                        * 57B2E

* refs (2): 57AF7 57B5D
+B21;PullB[1];<1>:
        :: top& #1-SWAP BINT1 ;                  * 57B33

* refs (1): 57AE8
?expanneginv:
        CON(5)  (*)+5                            * 57B4C  primitive code object
        ASSEMBLE
        GOSBVL  RuleMatch                        * 57B51  inline data follows

* rewrite rules, read by the interpreter called just before (RuleMatch, #5F6F2)
        PATTERN op5 op6                          * 57B58  xNEG xINV
        CON(5)  +B21;PullB[1];<1>                * 57B5D  run if it matches
        CON(1)  #F                               * 57B62  end of the rules
        RPL

* refs (1): 57AA7
?expan^:
        :: M1st^case ?expan^~1                   * 57B63
        ;                                        * 57B72

* refs (1): 57B6D
?expan^~1:
        :: 3PICK TYPE TYPEREAL #<> ?SEMI         * 57B77
          3PICK num0=case                        * 57B95
          :: DROPRDROP NDROP %1 BINT1 ;          * 57B9F
          num1=case                              * 57BBD
          :: DROPRDROP delB[1-2] ;               * 57BC2
          num2=case                              * 57BD6
          :: RDROPCOLA OBJ_57C3A ;               * 57BDB
          NXTPOT% NOTcaseDROP RDROP              * 57BEF
          SWAP dvarlsBIND 4ROLLDROP 3UNROLL dup delB[1-2] 1GETABND ?SKIP * 57BFE
          metainv                                * 57C26
          pshtop& meta* ;                        * 57C2B

* refs (2): 57ACA 57BE5
* EXPAN of a power: expand a sum in the base, else repeat the multiplication
OBJ_57C3A:
        :: DROP delB[1-2] M1st+case expansum^    * 57C3A
          M1st-case expansum^                    * 57C53
          dup top& meta* ;                       * 57C5D

* refs (2): 57C4E 57C58
expansum^:
        :: pshzer pullpsh1& pshzerpsharg dup ~addt2:;%2;x^ %2 psh1& unrot * 57C71
          meta* psh dup unrot top& meta* psh over& overev& top& * 57C9E
          ~addt2:;%2;x^ meta+ ;                  * 57CD0

* refs (3): 57ABB 57C8A 57CD0
~addt2:;%2;x^:
        :: PTR addt2: %2 x^ ;                    * 57CDF

* % -> flag %' T % -> % F
* refs (1): 57BEF
NXTPOT%:
        CON(5)  (*)+5                            * 57CF8  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 57CFD
        C=DAT1  A                                * 57D04
        CD1EX                                    * 57D07
        D1=D1+  5                                * 57D0A
        A=DAT1  W                                * 57D0D
        D1=C                                     * 57D11
        LC(3)   #011                             * 57D14
        P=      3                                * 57D19
        SETDEC                                   * 57D1B
NXTPOT%.loop1:
        ?A#0    P                                * 57D1D
        GOYES   NXTPOT%.L2                       * 57D20
        ?C=A    X                                * 57D22
        GOYES   NXTPOT%.L3                       * 57D25
        P=P+1                                    * 57D27
        C=C-1   X                                * 57D29
        GONC    NXTPOT%.loop1                    * 57D2C
NXTPOT%.L2:
        ?C#A    X                                * 57D2F
        GOYES   NXTPOT%.L6                       * 57D32
NXTPOT%.L3:
        C=0     M                                * 57D34
        C=C+1   P                                * 57D37
        A=A-C   M                                * 57D3A
        P=      14                               * 57D3D
        ?A#0    P                                * 57D3F
        GOYES   NXTPOT%.L4                       * 57D42
        A=A-1   X                                * 57D44
        ASL     M                                * 57D47
NXTPOT%.L4:
        P=      0                                * 57D4A
        SETHEX                                   * 57D4C
        LC(5)   TRUE                             * 57D4E
        ?A=0    S                                * 57D55
        GOYES   NXTPOT%.L5                       * 57D58
        LC(5)   FALSE                            * 57D5A
NXTPOT%.L5:
        DAT1=C  A                                * 57D61
        GOSBVL  PUSH%                            * 57D64
        LC(5)   TRUE                             * 57D6B
        A=C     A                                * 57D72
        PC=(A)                                   * 57D74
NXTPOT%.L6:
        P=      0                                * 57D78
        SETHEX                                   * 57D7A
        GOSBVL  GETPTR                           * 57D7C
        LC(5)   FALSE                            * 57D83
        A=C     A                                * 57D8A
        PC=(A)                                   * 57D8C
        RPL

* symf -> symf
* refs (6): 20A24 20A2E 20A38 84E45 9F0ED B6BF9
SYMCOLCT:
        :: uncrunch colct ;                      * 57D90

* symf -> symf
* refs (1): 57D9A
colct:
        :: EXPLODE pshzer colfac pshzer colrev ATTNFLG@ #0<> case * 57DA4
          :: CKSYMBN CK0NOLASTWD ?ATTNQUIT ;     * 57DD1
          pshzer colunfac SYMBN COLA coleval     * 57DEA
        ;                                        * 57E03

* meta1 meta2 -> meta'
* refs (1): 57DBD
colrev:
        :: BEGIN DUP#0=case drop;q_58A0C         * 57E08
          ATTNFLG@ #0<> case                     * 57E1C
          :: DUP#0_DO pullrev1& LOOP COLA drop;q_58A0C * 57E2B
          ;                                      * 57E49
          M1st+case colrev~2                     * 57E4E
          M1st*case colrev~1                     * 57E58
          pullrev1& AGAIN ;                      * 57E62

* refs (1): 57E5D
colrev~1:
        :: SWAPDROP#1- psh larg BINT0 rot parg& unrot count* #1+ * 57E71
          { Π'*s } BIND psh count* Π'*s #+ ' Π'*s STO BINT0 unrot COLA * 57EA3
          colrev*Next                            * 57EE9
        ;                                        * 57EEE

* refs (6): 57EA8 57EC1 57ED0 5805E 58086 58095
Π'*s:
        LAM '*s                                  * 57EF3

* refs (2): 57EE9 57FE6
* COLCT: take the next factor, numbers apart from the rest
colrev*Next:
        :: pick1#0=case colrev*End               * 57F00
          swappargunrot NoIdsInMeta? '           * 57F0F
          :: pshtop& COLA colrev*End             * 57F1E
          ;                                      * 57F32
          ' colrev*Loop COLARPITE ;              * 57F37

* meta1 meta2 -> M_rest meta2 M_last
* refs (4): 57F0F 57F87 58165 581BF
swappargunrot:
        :: psh pshzerpsharg unrot ;              * 57F4B

* refs (3): 57F3C 58013 5803B
* COLCT: combine like factors, comparing each with the factor collected so far
colrev*Loop:
        :: pick1#0=case                          * 57F64
          :: top& COLA colrev*End                * 57F6E
          ;                                      * 57F82
          swappargunrot NoIdsInMeta? case        * 57F87
          :: psh roll2top& roll2top& COLA colrev*End * 57F96
          ;                                      * 57FB4
          SameBase? case                         * 57FB9
          :: Lam*s-1 AddPowers 4roll top& unrot COLA colrev*Next * 57FC3
          ;                                      * 57FEB
          OrderFactors case                      * 57FF0
          :: 5roll top& 4unroll COLA colrev*Loop * 57FFA
          ;                                      * 58018
          psh 5roll top& 4unroll rotswap COLA colrev*Loop * 5801D
        ;                                        * 58040

* refs (4): 57F0A 57F2D 57F7D 57FAF
* COLCT: factors done: rebuild the product from what is left
colrev*End:
        :: top& pshtop& top& 'x* Π'*s ABND NDUPN top& psh AGAIN ; * 58045

* refs (1): 57FC8
* -> : one factor fewer (lam *s)
Lam*s-1:
        :: Π'*s #1- ' Π'*s STO ;                 * 58081

* refs (1): 58200
* -> : one term fewer (lam +s)
Lam+s-1:
        :: Π'+s #1- ' Π'+s STO ;                 * 580A4

* refs (1): 57E53
colrev~2:
        :: SWAPDROP#1- psh larg BINT0 rot parg& unrot count+ #1+ * 580C7

{'+s}:
          { Π'+s } BIND psh count+ Π'+s #+ ' Π'+s STO BINT0 unrot COLA * 580F9
          colrev+Next                            * 5813F
        ;                                        * 58144

* refs (6): 580A9 580B8 580FE 58117 58126 5829B
Π'+s:
        LAM '+s                                  * 58149

* refs (2): 5813F 5821E
* COLCT: as colrev*Next, for terms
colrev+Next:
        :: pick1#0=case colrev+End               * 58156
          swappargunrot NoIdsInMeta? case        * 58165
          :: pshtop& COLA colrev+End             * 58174
          ;                                      * 58188
          COLA colrev+Loop                       * 5818D
        ;                                        * 58197

* refs (3): 58192 5824B 58273
* COLCT: as colrev*Loop, for terms
colrev+Loop:
        :: pick1#0=case                          * 5819C
          :: top& COLA colrev+End                * 581A6
          ;                                      * 581BA
          swappargunrot NoIdsInMeta? case        * 581BF
          :: psh roll2top& roll2top& COLA colrev+End * 581CE
          ;                                      * 581EC
          SameTerm? case                         * 581F1
          :: Lam+s-1 AddCoeffs 4roll top& unrot COLA colrev+Next * 581FB
          ;                                      * 58223
          OrderTerms case                        * 58228
          :: 5roll top& 4unroll COLA colrev+Loop * 58232
          ;                                      * 58250
          psh 5roll top& 4unroll rotswap COLA colrev+Loop * 58255
        ;                                        * 58278

* refs (4): 58160 58183 581B5 581E7
* COLCT: as colrev*End, for terms
colrev+End:
        :: top& pshtop& top& ' x+ Π'+s ABND NDUPN top& psh AGAIN ; * 5827D

* refs (1): 57FB9
* meta1 meta2 -> ...: COLCT: do two factors have the same base?
SameBase?:
        :: BasePower rot BasePower rot COLA MEQU? * 582BE
        ;                                        * 582E1

* refs (1): 57FCD
* ... -> meta: COLCT: same base: add the exponents, x^(a+b)
AddPowers:
        :: NDROP unrot psh 2top& PTR addt2: x+ x^ ; * 582E6

* refs (1): 57FF0
* ... -> ...: COLCT: put two factors in order, flag saying if they swapped
OrderFactors:
        :: MetaLess? '                           * 58313
          :: FactorBack TRUE ; '                 * 58322
          :: FactorBack FALSE ; COLARPITE ;      * 5833B

* refs (2): 58327 58340
* meta -> meta': COLCT: put x^1 back as x, or base^power together
FactorBack:
        :: unrot psh OVER %1 EQITE 2DROP         * 58359
          :: top& ' x^ SWAP#1+ ; unrot psh %1 MEQ1stcase 2DROP * 5837C
          top& PTR addt: x^ ;                    * 583B3

* refs (1): 581F1
* meta1 meta2 -> ...: COLCT: do two terms differ only by a number?
SameTerm?:
        :: CoeffTerm rot CoeffTerm rot COLA MEQU? * 583C7
        ;                                        * 583EA

* refs (1): 58228
* ... -> ...: COLCT: put two terms in order, flag saying if they swapped
OrderTerms:
        :: MetaLess? case                        * 583EF
          :: TermBack TRUE ;                     * 583FE
          TermBack FALSE ;                       * 58412

* refs (2): 58403 58412
* meta -> meta': COLCT: put 1*x back as x, or coefficient*term together
TermBack:
        :: unrot psh OVER %1 EQITE               * 58421

drop2;delB[1]:
          :: 2DROP SWAPDROP#1- ; pshtop& unrot psh %1 MEQ1stcase * 5843F
          :: 2DROP SWAPDROP#1- ;                 * 5846C
          pshtop& ;                              * 58480

* refs (1): 58205
* ... -> meta: COLCT: same term: add the coefficients
AddCoeffs:
        :: NDROP unrot pshtop& PTR addt: x+ pshtop& ; * 5848A

* meta1 meta2 -> meta1 meta2 flag
* refs (8): 56142 56179 56255 562B4 582DC 583E5 ...
MEQU?:
        :: DUP #2+PICK OVER#= NOTcaseFALSE DUP   * 584B2
          BEGIN DUP#0=case ~DROPRDROP;TRUE       * 584D0
          2DUP#+ #3+PICK OVER #3+PICK EQUAL NOTcase ~DROPRDROP;FALSE * 584DF
          #1- AGAIN ;                            * 58502

* meta1 meta2 -> meta1 meta2 flag
* refs (2): 58318 583F4
MetaLess?:
        :: MetaMore? NOT ;                       * 58511

* meta1 meta2 -> meta1 meta2 flag
* refs (1): 58516
MetaMore?:
        :: DUP #2+PICK 2DUP #<>case              * 58525

over;<(2s)?:
          :: OVER #< ;                           * 5853E
          BEGIN 2DUP #+ #3+PICK OVER #3+PICK 2DUP EQUALNOTcase * 58552
          :: RDROP BodyMore? SWAPDROP ;          * 5857A
          2DROP #1- AGAIN ;                      * 58593

* ob1 ob2 -> flag
* refs (1): 58584
BodyMore?:
        CON(5)  (*)+5                            * 585A7  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 585AC
        C=DAT1  A                                * 585B3
        CD1EX                                    * 585B6
        D0=C                                     * 585B9
        D0=D0+  5                                * 585BC
        A=DAT0  A                                * 585BF
        D0=A                                     * 585C2
BodyMore?.loop1:
        A=DAT0  S                                * 585C5
        C=DAT1  S                                * 585C9
        ?C#A    S                                * 585CD
        GOYES   BodyMore?.L2                     * 585D0
        D0=D0+  1                                * 585D2
        D1=D1+  1                                * 585D5
        GONC    BodyMore?.loop1                  * 585D8
BodyMore?.L2:
        ?C<A    S                                * 585DB
        GOYES   BodyMore?.L3                     * 585DE
        GOSBVL  GETPTR                           * 585E0
        D1=D1+  5                                * 585E7
        D=D+1   A                                * 585EA
        LC(5)   FALSE                            * 585EC
        DAT1=C  A                                * 585F3
        A=DAT0  A                                * 585F6
        D0=D0+  5                                * 585F9
        PC=(A)                                   * 585FC
BodyMore?.L3:
        GOSBVL  GETPTR                           * 58600
        D1=D1+  5                                * 58607
        D=D+1   A                                * 5860A
        LC(5)   TRUE                             * 5860C
        DAT1=C  A                                * 58613
        A=DAT0  A                                * 58616
        D0=D0+  5                                * 58619
        PC=(A)                                   * 5861C
        RPL

* refs (2): 582C3 582CD
* meta -> base power: COLCT: split x^n; anything else has power 1
BasePower:
        :: M1st^case plDRPpZparg                 * 58620
          %1 pshm1 ;                             * 5862F

* refs (2): 583CC 583D6
* meta -> term coeff: COLCT: split the number from a product; anything else has coefficient 1
CoeffTerm:
        :: M1st*case CoeffSplit                  * 5863E
          %1 pshm1 addt* ;                       * 5864D

* refs (1): 58648
* meta -> term coeff: COLCT: take the numbers of a product apart from the other factors
CoeffSplit:
        :: Metas* pshzer BEGIN parg& NoIdsInMeta? UNTIL DUP#0= IT * 58661
          :: DROP psh PTR addt: x* psh %1 BINT1 ; * 5868E
          rotswap pshzerpsharg BEGIN DUP#0= NOT WHILE * 586BB
          :: parg& psh rot pullrev1& psh rot ; REPEAT DROP roll2top& ; * 586D9

* meta -> meta flag
* refs (5): 57F14 57F8C 5816A 581C4 5867A
NoIdsInMeta?:
        CON(5)  (*)+5                            * 58715  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 5871A
        CD1EX                                    * 5871D
        RSTK=C                                   * 58720
        D1=D1+  5                                * 58722
        A=DAT1  A                                * 58725
        D1=C                                     * 58728
        C=A     A                                * 5872B
        CD0EX                                    * 5872D
        RSTK=C                                   * 58730
NoIdsInMeta?.loop1:
        D1=D1+  5                                * 58732
        D0=D0-  1                                * 58735
        GOC     NoIdsInMeta?.L3                  * 58738
        C=DAT1  A                                * 5873B
        CD1EX                                    * 5873E
        A=DAT1  A                                * 58741
        D1=C                                     * 58744
        LC(5)   DOIDNT                           * 58747
        ?C=A    A                                * 5874E
        GOYES   NoIdsInMeta?.L2                  * 58751
        LC(5)   DOLAM                            * 58753
        ?C=A    A                                * 5875A
        GOYES   NoIdsInMeta?.L2                  * 5875D
        LC(5)   DOCOL                            * 5875F
        ?C#A    A                                * 58766
        GOYES   NoIdsInMeta?.loop1               * 58769
        C=DAT1  A                                * 5876B
        CD1EX                                    * 5876E
        D1=D1+  5                                * 58771
        A=DAT1  A                                * 58774
        D1=C                                     * 58777
        LC(5)   CK0                              * 5877A
        ?C#A    A                                * 58781
        GOYES   NoIdsInMeta?.loop1               * 58784
NoIdsInMeta?.L2:
        LC(5)   FALSE                            * 58786
        A=C     A                                * 5878D
        GOTO    NoIdsInMeta?.L4                  * 5878F
NoIdsInMeta?.L3:
        LC(5)   TRUE                             * 58793
        A=C     A                                * 5879A
NoIdsInMeta?.L4:
        C=RSTK                                   * 5879C
        D0=C                                     * 5879E
        C=RSTK                                   * 587A1
        D1=C                                     * 587A3
        PC=(A)                                   * 587A6
        RPL

* meta1 meta2 -> meta'
* refs (1): 57DB3
colfac:
        :: BEGIN DUP#0=case drop;q_58A0C         * 587AA
          M1st-case colfac~1                     * 587BE
          M1st/case colfac~2                     * 587C8
          M1stNEGcase colfac+                    * 587D2
          M1stINVcase colfac*                    * 587DC
          M1stSQcase colfac~3                    * 587E6
          pullrev1& AGAIN ;                      * 587F0

* refs (1): 587C3
colfac~1:
        :: SWAPDROP#1- PTR psh1&rev: x+ addtNEG COLA colfac+ * 587FF
        ;                                        * 58822

* refs (1): 587CD
colfac~2:
        :: SWAPDROP#1- PTR psh1&rev: x* PTR addt: xINV COLA colfac* * 58827
        ;                                        * 5884F

* refs (4): 587D7 5881D 588DB 589DF
* COLCT: into a sum, turning - and NEG into + of a negated term
colfac+:
        :: SWAPDROP#1- M1st+case colfac+Add      * 58854
          M1st-case colfac-                      * 58868
          M1stNEGcase ~SWAPDROP#1-;AGAIN         * 58872
          PTR psh1&rev: x* pshzerpsharg %-1 SWAP#1+ pshtop& AGAIN ; * 5887C

* refs (2): 58877 58935
~SWAPDROP#1-;AGAIN:
        :: SWAPDROP#1- AGAIN ;                   * 588A4

* refs (1): 58863
* COLCT: a sum under NEG: distribute
colfac+Add:
        :: pullrev1& pshzerpsharg addtNEG pshtop& addtNEG COLA colfac+ * 588B8
        ;                                        * 588E0

* refs (1): 5886D
* COLCT: a difference: write it as a + with a NEG
colfac-:
        :: SWAPDROP#1- PTR psh1&rev: x+ pshzerpsharg addtNEG pshtop& AGAIN ; * 588E5

* refs (3): 587E1 5884A 5898F
* COLCT: into a product, turning / and INV into * and ^-1
colfac*:
        :: SWAPDROP#1- M1st*case colfac*Mul      * 58912
          M1st/case colfac/                      * 58926
          M1stINVcase ~SWAPDROP#1-;AGAIN         * 58930
          M1st^case colfac^                      * 5893A
          PTR psh1&rev: x^ %-1 SWAP#1+ AGAIN ;   * 58944

* refs (1): 58921
* COLCT: a product under INV: invert each factor
colfac*Mul:
        :: pullrev1& pshzerpsharg PTR addt: xINV pshtop& PTR addt: xINV COLA * 58962
          colfac*                                * 5898F
        ;                                        * 58994

* refs (1): 5892B
* COLCT: a quotient: write it as * with INV
colfac/:
        :: SWAPDROP#1- PTR psh1&rev: x* pshzerpsharg PTR addt: xINV pshtop& * 58999
          AGAIN ;                                * 589C1

* refs (1): 5893F
* COLCT: a power: negate the exponent, under INV
colfac^:
        :: pullrev1& addtNEG COLA colfac+        * 589CB
        ;                                        * 589E4

* refs (1): 587EB
colfac~3:
        :: SWAPDROP#1- PTR psh1&rev2: x^ %2 AGAIN ; * 589E9

* refs (10): 57A8E 57E17 57E44 587B9 58A2F 66833 ...
drop;q_58A0C:
        :: RDROP DROP ;                          * 58A0C

* meta1 meta2 -> meta'
* refs (2): 57DEF 5AC72
colunfac:
        :: BEGIN DUP#0=case drop;q_58A0C         * 58A20
          M-1potcase colunfac~1                  * 58A34
          M1st+case colunfac~2                   * 58A3E
          M1st*case colunfac~4                   * 58A48
          pullpsh1& AGAIN ;                      * 58A52

* [expr1 INV expr2 INV *] -> [expr1 expr2 /]
* refs (1): 5BE67
colinv1:
        :: #2- ROTROT2DROP pshzerpsharg SWAPDROP#1- pshtop& PTR addt2: x* * 58A61
          xINV ;                                 * 58A89

* [expr INV *] -> [expr /]
* refs (1): 5BE71
colinv2:
        :: #2- ROTROT2DROP meta/ ;               * 58A93

* [expr1 INV expr2 *] -> [expr1 expr2 /]
* refs (1): 5BE7B
colinv3:
        :: SWAPDROP#1- pshzerpsharg SWAPDROP#1- larg rotswap top& top& meta/ ; * 58AAC

* Meta&-1&^ ? case
* refs (1): 58A34
M-1potcase:
        CON(5)  (*)+5                            * 58ADE  primitive code object
        ASSEMBLE
        CD1EX                                    * 58AE3
        D1=(5)  M-1potcase.L2                    * 58AE6
        A=DAT1  15                               * 58AED
        D1=C                                     * 58AF1
        D1=D1+  5                                * 58AF4
        C=DAT1  15                               * 58AF7
        D1=D1-  5                                * 58AFB
        P=      14                               * 58AFE
        ?C#A    WP                               * 58B00
        GOYES   M-1potcase.L1                    * 58B03
        P=      0                                * 58B05
        GOVLNG  docola                           * 58B07
M-1potcase.L1:
        P=      0                                * 58B0E
        GOVLNG  doskip                           * 58B10

M-1potcase.L2:
        CON(5)  x*                               * 58B17  address (the code jumps or points through it)

        CON(5)  x^                               * 58B1C  address (the code jumps or points through it)

        CON(5)  %-1                              * 58B21  address (the code jumps or points through it)
        RPL

* refs (1): 58A39
colunfac~1:
        :: BINT3 #- SWAPDROP ROTROT2DROP ' x/ psh1& AGAIN ; * 58B26

* refs (1): 58A43
colunfac~2:
        :: pullpsh1& M1st+case colunfac~3        * 58B58
          AGAIN ;                                * 58B6C

* refs (2): 58B67 58B8F
colunfac~3:
        :: plDRPpZparg ~addt:;x+ pshtop& M1st+case colunfac~3 * 58B76
          AGAIN ;                                * 58B94

* refs (1): 58A4D
colunfac~4:
        ::                                       * 58B9E
          :: MetaMulInv COLA SKIP                * 58BA3
          ;                                      * 58BB7
          AGAIN pullpsh1& M1st*case colunfac~5   * 58BBC
          AGAIN ;                                * 58BD0

* refs (2): 58BCB 58BF3
colunfac~5:
        :: plDRPpZparg addt* pshtop& M1st*case colunfac~5 * 58BDA
          AGAIN ;                                * 58BF8

* meta -> meta #0 meta &+&+..&+ -> meta #n
* refs (3): 580EF 58112 58C94
count+:
        CON(5)  (*)+5                            * 58C02  primitive code object
        ASSEMBLE
        ST=1    0                                * 58C07
        GOTO    count*.L1                        * 58C0A

* meta -> meta #0 meta &*&*..&* -> meta #n
* refs (3): 57E99 57EBC 58CBC
count*:
        CON(5)  (*)+5                            * 58C0E  primitive code object
        ST=0    0                                * 58C13
count*.L1:
        A=DAT1  A                                * 58C16
        AD1EX                                    * 58C19
        D1=D1+  5                                * 58C1C
        C=DAT1  A                                * 58C1F
        D1=A                                     * 58C22
        RSTK=C                                   * 58C25
        C=0     A                                * 58C27
        CD0EX                                    * 58C29
        RSTK=C                                   * 58C2C
        LC(5)   x*                               * 58C2E
        ?ST=0   0                                * 58C35
        GOYES   count*.loop2                     * 58C38
        LC(5)   x+                               * 58C3A
count*.loop2:
        D1=D1+  5                                * 58C41
        A=DAT1  A                                * 58C44
        ?C#A    A                                * 58C47
        GOYES   count*.L3                        * 58C4A
        D0=D0+  1                                * 58C4C
        GONC    count*.loop2                     * 58C4F
count*.L3:
        C=RSTK                                   * 58C52
        CD0EX                                    * 58C54
        A=C     A                                * 58C57
        C=RSTK                                   * 58C59
        C=C-A   A                                * 58C5B
        R0=C                                     * 58C5D
        R1=A                                     * 58C60
        GOSBVL  SAVPTR                           * 58C63
        GOSBVL  PUSH#                            * 58C6A
        A=R1                                     * 58C71
        R0=A                                     * 58C74
        GOSBVL  SAVPTR                           * 58C77
        GOSBVL  PUSH#                            * 58C7E
        A=DAT0  A                                * 58C85
        D0=D0+  5                                * 58C88
        PC=(A)                                   * 58C8B
        RPL

        :: count+ ' x+ SWAP NDUPN psh ;          * 58C8F

* refs (1): 58666
* #n -> meta: n-1 x* for rebuilding a product
Metas*:
        :: count* 'x* SWAP NDUPN psh ;           * 58CB7

* ob -> ob'
* refs (2): 5731A 57DFE
coleval:
        :: FALSE                                 * 58CDA

* sym param -> ?
* refs (3): 280CF 28A51 5913A
parameval:
          :: 1LAMBIND                            * 58CE4

* sym -> ?
* refs (1): 5918F
eval:
            :: symcomp >R BEGIN RSWAP ticR DUP NOT ?SKIP RSWAP * 58CEE
              WHILE                              * 58D20
              :: 1GETLAM EVAL case AGAIN         * 58D25
                nonopcase AGAIN                  * 58D3E
                CmdField6 DROP EVAL ;            * 58D48
              REPEAT ;                           * 58D5C
            ABND ;                               * 58D66
        ;                                        * 58D70

* sym id/lam -> symf
* refs (4): 20AE2 20AEC 49832 5960A
SYMSHOW:
        :: BINT1 {}N dvarlsBIND EXPLODE ShowMeta ABND DROP IMPLODE ; * 58D75

* refs (4): 58D8E 58FCB 590A2 59207
* meta -> meta' flag: SHOW: walk the meta, replacing names that aren't wanted by their values; TRUE (lam fl) if none of the names was reached
ShowMeta:
        :: TRUE                                  * 58DA7

{'fl}:
          {                                      * 58DB1

Π'fl:
            LAM 'fl }                            * 58DB6
          BIND pshzer BEGIN M1stFNCcase ShowFcn  * 58DC8
          Mid1stcase ShowName                    * 58DE1
          :: OVER nonopcase FALSE                * 58DEB
            CmdFieldB ;                          * 58DFF
          casedrop ShowWhere                     * 58E09
          DROP pullpsh1& COLA ~#0=UNTIL;DROP;1GETABND * 58E13
        ;                                        * 58E27

* refs (8): 58E22 58EE5 58F08 58F4E 58FBC 58FE9 ...
~#0=UNTIL;DROP;1GETABND:
        :: #0=UNTIL DROP 1GETABND ;              * 58E2C

* refs (1): 58DDC
* SHOW: a function application: expand it where it can be shown
ShowFcn:
        :: 4PICK TYPEROMP? case ShowWhere        * 58E45
          4PICK ROMPTR@NOT casedrop ShowCopy3    * 58E5E
          5PICK SWAP 5PICK {'dv,'op,'nm} BIND 2GETLAM OBJ_5DEF7 * 58E72

* refs (1): 58EB3
* SHOW: the function isn't defined in a way that can be expanded: keep it
ShowFcnSkip:
          :: DROP ABND COLA ShowCopy3            * 58E95
          ;                                      * 58EAE
          ShowFcnSkip DROP larg SWAPDROP#1- ROTROT2DROP OBJ_56E05 SWAPDROP * 58EB3
          EXPLODE top& COLA ~#0=UNTIL;DROP;1GETABND * 58ED6
        ;                                        * 58EEA

* refs (2): 58E6D 58EA9
* SHOW: copy the application and its parts unchanged
ShowCopy3:
        :: pullpsh1& pullpsh1& pullpsh1& COLA ~#0=UNTIL;DROP;1GETABND * 58EEF
        ;                                        * 58F0D

* refs (1): 58DE6
* SHOW: a name: keep it if wanted, expand a variable that holds an expression
ShowName:
        :: #1-SWAP lam'dvar OVER EQUALPOSCOMP #0<> case * 58F12
          :: psh1& FALSE 1PUTLAM COLA ~#0=UNTIL;DROP;1GETABND * 58F35
          ;                                      * 58F53
          DUP ROMPTR@NOT case ShowKeep           * 58F58
          idntlamcase                            * 58F6C
          :: ONECOLA ShowValue ;                 * 58F71
          dup;ex? NOTcase ShowKeep               * 58F85
          EXPLODE COLA ShowValue                 * 58F94
        ;                                        * 58FA3

* refs (2): 58F67 58F8F
* SHOW: copy the object unchanged
ShowKeep:
        :: DROP psh1& COLA ~#0=UNTIL;DROP;1GETABND * 58FA8
        ;                                        * 58FC1

* refs (2): 58F7B 58F9E
* SHOW: the name's value goes through ShowMeta
ShowValue:
        :: ShowMeta case                         * 58FC6
          :: NDROP psh1& COLA ~#0=UNTIL;DROP;1GETABND * 58FD5
          ;                                      * 58FEE
          get1 DROP ROTUntop& psh FALSE 1PUTLAM COLA ~#0=UNTIL;DROP;1GETABND * 58FF3
        ;                                        * 5901B

* refs (2): 58E0E 58E59
* SHOW: inside a WHERE: names bound there aren't to be replaced
ShowWhere:
        :: larg pshzer BINT3 BEGIN DUP#1+PICK    * 59020
          :: idntlamcase ShowWhere~1             * 5903E
          ;                                      * 5904D
          DROP BINT1 splitup 2DUPSWAP #- #2= UNTIL DROP psh lam'dvar * 59052
          INNERtop& {}N dvarlsBIND rotswap pullpsh1& rotswap ShowMeta ABND * 59084
          1GETLAM AND 1PUTLAM ROTUntop& psh COLA ~#0=UNTIL;DROP;1GETABND * 590AC
        ;                                        * 590CF

* refs (1): 59048
* Part of ShowWhere
ShowWhere~1:
        :: OVER #2+ OBJ_5F5AD NOT?SEMI           * 590D4
          ROT#1+ SWAP psh1& #1-SWAP DUP ;        * 590ED

* sym {names} -> symf
* refs (2): 20B0A 4DAEE
SHOWLS:
        ::                                       * 5910B

{'nmls}:
          {                                      * 59110

* refs (1): 59158
Π'nmls:
            LAM 'nmls }                          * 59115
          BIND ' SHOWLS~1 parameval ABND ;       * 5912B

* refs (1): 59135
SHOWLS~1:
        :: dup;#nm? caseFALSE Π'nmls             * 59149
          OVER EQUALPOSCOMP #0<> caseFALSE ROMPTR@NOT * 5915D
          caseFALSE ?ATTNQUIT                    * 59176
          CK&DISPATCH1                           * 59180
          BINT10                                 * 59185  name|local|algebraic

* sym -> ? T
evalTRUE:
          :: eval TRUE ;                         * 5918A
          BINT0 FALSE                            * 5919E  any
        ;                                        * 591A8

* sym id -> symf
* refs (3): 20AC2 B6BD0 B6BD5
SYMQUAD:
        :: uncrunch quad!(ex,gn) ;               * 591AD

* refs (1): 591B7
quad!(ex,gn):
        :: DUP1LAMBIND QuadCore DROP 1ABNDSWAP 'EvalNoCK:_sup x= ; * 591C1

* refs (2): 4BD28 591CB
* symb id -> symb' flag: QUAD: SHOW the variable, turn an equation into a difference, take the Taylor polynomial of degree 2 and solve it: linear, or by quad(3ex)?
QuadCore:
        :: SWAPcompSWAP ONE{}N dvarlsBIND DUP EXPLODE ShowMeta 1GETLAM * 591E9
          CARCOMP 1PUTLAM 3UNROLL                * 59211
          :: AEQ1stcase x=                       * 59220
            :: drpmeta- ROTDROP FALSE 3UNROLL ; ; * 5922F
          ROT ITE NDROP                          * 59252
          :: IMPLODE symcomp SWAPDROP ;          * 59261
          BINT2 TaylorPoly ABND DROP DUP%0= NOTcase quad(3ex)? * 5927A
          DROP x/ xNEG FALSE ;                   * 5929D

* refs (1): 59298
quad(3ex)?:
        ::                                       * 592B6

{'c,'b,'a}:
          {                                      * 592BB

Π'c:
            LAM 'c                               * 592C0

Π'b:
            LAM 'b                               * 592CB

Π'a:
            LAM 'a }                             * 592D6
          BIND 2GETLAM xNEG PRSOL? %1            * 592E6

Expr's1':
          SYMBOL                                 * 592FF

s1_59304:
            ID s1 ;                              * 59304
          RPITE 2GETLAM %2                       * 59314
          x^ %4 1GETLAM x* 3GETLAM x* x- xSQRT x* x+ %2 1GETABND x* x/ TRUE ; * 59323

* refs (2): 5927F 59619
* Taylor polynomial of the expression around 0 by repeated DERIV and EVAL at 0
TaylorPoly:
        :: KeepNameSym TaylorSum ;               * 59373

* refs (2): 593A0 59560
~lam'dvar;?PURGE_HERE:
        :: lam'dvar ?PURGE_HERE ;                * 59387

* refs (1): 5955B
* ERRTRAP arm: purge the variable and carry the error on
TaylorErr:
        :: ~lam'dvar;?PURGE_HERE ERRJMP ;        * 5939B

* refs (1): 5937D
* TAYLR's loop: term by term
TaylorSum:
        :: DUP %0_2A2B4 lam'dvar XEQSTOID xEVAL DerEvalLoop xSWAP 1GETLAM * 593AF
          lam'dvar XEQSTOID 2GETLAM #0=case DROPONE * 593DC
          2GETLAM #1=?SKIP                       * 593F5
          :: 2GETLAM ONE_DO ?ATTNQUIT0 lam'dvar DERIV xEVAL xDUP %0_2A2B4 * 593FF
            lam'dvar XEQSTOID xEVAL 1GETLAM lam'dvar XEQSTOID INDEX@ Term/n! * 5942C
            xSWAP LOOP ;                         * 59454
          %0_2A2B4 lam'dvar XEQSTOID lam'dvar DERIV 2GETLAM Term/n! DEPTH * 59463
          2GETLAM #1+ #<case SETSTACKERR         * 5948B
          2GETLAM #1+ ;                          * 5949F

* refs (2): 5944F 59481
* symb %n -> symb': divide a term by n!
Term/n!:
        :: UNCOERCE %1=case DROP                 * 594AE
          %2=case x/                             * 594C2
          SYMFACT OVER %ABS %1 EQUALNOTcase x/   * 594CC
          SWAP ONESYMBN SWAP x/ ;                * 594EA

* refs (2): 59378 595C9
* ...: create the variable holding a program that gives its own quoted name, so that it stays symbolic during DERIV and EVAL, run the object after this call, and purge it
KeepNameSym:
        :: lam'dvar Quote<<id>>                  * 59503

{'n,'prog}:
          {                                      * 59512

Π'n:
            LAM 'n                               * 59517

Π'prog:
            LAM 'prog }                          * 59522
          BIND 1GETLAM lam'dvar CREATE ERRSET 'REVAL ERRTRAP TaylorErr * 59538
          ~lam'dvar;?PURGE_HERE ABND ;           * 59560

* refs (2): 4BD19 5950D
* id -> program: a program that quotes id
Quote<<id>>:
        :: ' x<< ' x' ROT ' xENDTIC ' x>> BINT5 ::N ; * 5956F

* refs (1): 49ADD
SymDer(ex,nm):
        :: uncrunch                              * 595B0
          :: DUPDUP dvarlsBIND KeepNameSym DERIV ; ; * 595BA

* sym id % -> symf
* refs (3): 20B2F B6B8F B6B94
SYMTAYLR:
        :: uncrunch taylr!(ex,gn,r) ;            * 595DD

* refs (1): 595E7
taylr!(ex,gn,r):
        :: COERCE UNROTDUP dvarlsBIND SWAPcompSWAP SYMSHOW symcomp SWAP * 595F1
          TaylorPoly DUP#1- #0=case              * 59619

drop;Lpop:
          :: DROP ABND ;                         * 59628
          DUP#1+                                 * 5963C

{'n}:
          {                                      * 59641

Π'n_59646:
            LAM 'n }                             * 59646
          BIND ROLL 1GETLAM #1- ONE_DO 1GETLAM INDEX@#- ROLL lam'dvar INDEX@ * 59656
          UNCOERCE x^ x* x+ LOOP ABND ABND ;     * 59688

* refs (1): 3F23D
{RULES\COLCT}:
        {                                        * 596B0

_COLCT_:
          $ "COLCT"                              * 596B5
          :: EqwRuleKey0                         * 596C9

* restricted collection
MetaRCOLCT:
            :: OBJ_59F32 XLIB {RULES\COLCT}~1 RDROP ; ; * 596D3
        }                                        * 596F7

* refs (1): 3F21F
{RULES\DNEG}:
        {                                        * 596FC

_DNEG_:
          $ "DNEG"                               * 59701
          :: EqwRuleKey0                         * 59713

* double negate
MetaDNEG:
            :: OBJ_59F32 PTR addt2: xNEG xNEG RDROP ; ; * 5971D
        }                                        * 59745

* refs (1): 3F224
{RULES\DINV}:
        {                                        * 5974A

_DINV_:
          $ "DINV"                               * 5974F
          :: EqwRuleKey0                         * 59761

* double invert
MetaDINV:
            :: OBJ_59F32 PTR addt2: xINV xINV RDROP ; ; * 5976B
        }                                        * 59793

* refs (1): 3F229
{RULES\*1}:
        {                                        * 59798

_*1_:
          $ "*1"                                 * 5979D
          :: EqwRuleKey0                         * 597AB

* mult by one
Meta*1:
            :: OBJ_59F32 PTR addt2: %1 x* RDROP 4PICK ' x/ EQ NOT?SEMI * 597B5
              5PICK %1 EQUAL NOT?SEMI            * 597EC
              #4- 5UNROLL 4DROP ;                * 59800
          ;                                      * 59814
        }                                        * 59819

* refs (1): 3F22E
{RULES\^1}:
        {                                        * 5981E

_^1_:
          $ "^1"                                 * 59823
          :: EqwRuleKey0                         * 59831

* pow by one
Meta^1:
            :: OBJ_59F32 PTR addt2: %1 x^ RDROP ; ; * 5983B
        }                                        * 59863

* refs (1): 3F233
{RULES\/1}:
        {                                        * 59868

_/1_:
          $ "/1"                                 * 5986D
          :: EqwRuleKey0                         * 5987B

* div by one
Meta1/:
            :: OBJ_59F32 PTR addt2: %1 x/ RDROP 4PICK ' x* EQ NOT?SEMI * 59885
              5PICK %1 EQUAL NOT?SEMI            * 598BC
              #4- 5UNROLL 4DROP ;                * 598D0
          ;                                      * 598E4
        }                                        * 598E9

* refs (1): 3F238
{RULES\+1-1}:
        {                                        * 598EE

_+1-1_:
          $ "+1-1"                               * 598F3
          :: EqwRuleKey0                         * 59905

* add 1 subtract 1
Meta+1-1:
            :: OBJ_59F32                         * 5990F

{1,+,1,-}:
              { %1 x+ %1 x- } INNERtop& RDROP ;  * 59919
          ;                                      * 59946
        }                                        * 5994B

* refs (2): 86A5B 86ABA
{RULES\<-->}:
        {                                        * 59950

_<-->_:
          $ "←→"                                 * 59955
          :: EqwRuleKey0 Meta<--> ; }            * 59963

* refs (3): 86A6A 86AB0 86AF1
{RULES\<-A}:
        {                                        * 5997C

_<-A_:
          $ "←A"                                 * 59981
          {                                      * 5998F
            :: EqwRuleKey3 Meta<-A ; DoBadKey    * 59994
            :: EqwRuleKey3 Meta<-Aall ; }        * 599AD
        }                                        * 599C6

* refs (3): 86A6F 86AB5 86AF6
{RULES\A->}:
        {                                        * 599CB

_A->_:
          $ "A→"                                 * 599D0
          {                                      * 599DE
            :: EqwRuleKey3 MetaA-> ; DoBadKey    * 599E3
            :: EqwRuleKey3 MetaA->all ; }        * 599FC
        }                                        * 59A15

* refs (3): 86A42 86A88 86B50
{RULES\<-T}:
        {                                        * 59A1A

_<-T_:
          $ "←T"                                 * 59A1F
          {                                      * 59A2D
            :: EqwRuleKey3 Meta<-T ; DoBadKey    * 59A32
            :: EqwRuleKey3 Meta<-Tall ; }        * 59A4B
        }                                        * 59A64

* refs (3): 86A47 86A8D 86B55
{RULES\T->}:
        {                                        * 59A69

_T->_:
          $ "T→"                                 * 59A6E
          {                                      * 59A7C
            :: EqwRuleKey3 MetaT-> ; DoBadKey    * 59A81
            :: EqwRuleKey3 MetaT->all ; }        * 59A9A
        }                                        * 59AB3

* refs (2): 86A60 86AA6
{RULES\(<-}:
        {                                        * 59AB8

_(<-_:
          $ "(←"                                 * 59ABD
          {                                      * 59ACB
            :: EqwRuleKey3 Meta(<- ; DoBadKey    * 59AD0
            :: EqwRuleKey3 Meta(<-all ; }        * 59AE9
        }                                        * 59B02

* refs (2): 86A65 86AAB
{RULES\->)}:
        {                                        * 59B07

_->)_:
          $ "→)"                                 * 59B0C
          {                                      * 59B1A
            :: EqwRuleKey3 Meta->) ; DoBadKey    * 59B1F
            :: EqwRuleKey3 Meta->)all ; }        * 59B38
        }                                        * 59B51

* refs (2): 86A74 86ABF
{RULES\(())}:
        {                                        * 59B56

_(())_:
          $ "(())"                               * 59B5B
          :: EqwRuleKey3 Meta(()) ; }            * 59B6D

* refs (1): 86A56
{RULES\AF}:
        {                                        * 59B86

_AF_:
          $ "AF"                                 * 59B8B
          :: EqwRuleKey0 MetaAF ; }              * 59B99

* refs (2): 86A4C 86A92
{RULES\<-M}:
        {                                        * 59BB2

_<-M_:
          $ "←M"                                 * 59BB7
          {                                      * 59BC5
            :: EqwRuleKey0 Meta<-M ; DoBadKey    * 59BCA
            :: EqwRuleKey3 Meta<-Mall ; }        * 59BE3
        }                                        * 59BFC

* refs (2): 86A51 86A97
{RULES\M->}:
        {                                        * 59C01

_M->_:
          $ "M→"                                 * 59C06
          {                                      * 59C14
            :: EqwRuleKey0 MetaM-> ; DoBadKey    * 59C19
            :: EqwRuleKey3 MetaM->all ; }        * 59C32
        }                                        * 59C4B

* refs (3): 86A79 86AC4 86B23
{RULES\-()}:
        {                                        * 59C50

_-()_:
          $ "-()"                                * 59C55
          :: EqwRuleKey0 Meta-() ; }             * 59C65

* refs (3): 86AC9 86ADD 86B05
{RULES\1/()}:
        {                                        * 59C7E

_1/()_:
          $ "1/()"                               * 59C83
          :: EqwRuleKey0 Meta1/() ; }            * 59C95

* refs (1): 86AE2
{RULES\E()}:
        {                                        * 59CAE

_E()_:
          $ "E()"                                * 59CB3
          :: EqwRuleKey0 MetaE() ; }             * 59CC3

* refs (1): 86ACE
{RULES\L()}:
        {                                        * 59CDC

_L()_:
          $ "L()"                                * 59CE1
          :: EqwRuleKey0 MetaL() ; }             * 59CF1

* refs (1): 86B28
{RULES\L*}:
        {                                        * 59D0A

_L*_:
          $ "L*"                                 * 59D0F
          :: EqwRuleKey0 MetaL* ; }              * 59D1D

* refs (1): 86B0A
{RULES\E^}:
        {                                        * 59D36

_E^_:
          $ "E^"                                 * 59D3B
          :: EqwRuleKey0 MetaE^ ; }              * 59D49

* refs (1): 86B41
{RULES\->()}:
        {                                        * 59D62

_->()_:
          $ "→()"                                * 59D67
          {                                      * 59D77
            :: EqwRuleKey0 Meta->() ; DoBadKey   * 59D7C
            :: EqwRuleKey3 Meta->()all ; }       * 59D95
        }                                        * 59DAE

* refs (2): 86A9C 86AE7
{RULES\<-D}:
        {                                        * 59DB3

_<-D_:
          $ "←D"                                 * 59DB8
          {                                      * 59DC6
            :: EqwRuleKey0 Meta<-D ; DoBadKey    * 59DCB
            :: EqwRuleKey3 <-D[_]! ; }           * 59DE4
        }                                        * 59DFD

* refs (4): 86AA1 86AEC 86B14 86B32
{RULES\D->}:
        {                                        * 59E02

_D->_:
          $ "D→"                                 * 59E07
          {                                      * 59E15
            :: EqwRuleKey0 MetaD-> ; DoBadKey    * 59E1A
            :: EqwRuleKey3 MetaD->all ; }        * 59E33
        }                                        * 59E4C

* refs (1): 86B0F
{RULES\->TRG}:
        {                                        * 59E51

_->TRG_:
          $ "→TRG"                               * 59E56
          :: EqwRuleKey0 Meta->TRG ; }           * 59E68

* refs (1): 86B64
{RULES\->()}_59E81:
        {                                        * 59E81

_->()__59E86:
          $ "→()"                                * 59E86
          {                                      * 59E96
            :: EqwRuleKey0 Meta->()C% ; DoBadKey * 59E9B
            :: EqwRuleKey3 Meta->()C%all ; }     * 59EB4
        }                                        * 59ECD

* refs (2): 86B73 86B87
{RULES\->DEF}:
        {                                        * 59ED2

_->DEF:
          $ "→DEF"                               * 59ED7
          :: EqwRuleKey0 Meta->DEF ; }           * 59EE9

* refs (1): 86B78
{RULES\TRG*}:
        {                                        * 59F02

_TRG*_:
          $ "TRG*"                               * 59F07
          :: EqwRuleKey0 MetaTRG* ; }            * 59F19

* refs (7): 596D8 59722 59770 597BA 59840 5988A ...
* Probably: RULES: look past the = at the top of an equation and find the argument
OBJ_59F32:
        :: AEQ1stcase x=                         * 59F32
          :: RDROP ; DUP#2+PICK OVER#+ #3+ DUP#1+PICK BINT0 #=casedrop DROP * 59F41
          #+ #1+ OBJ_5F5AD NOT?SEMI              * 59F73
          RDROP ;                                * 59F87

* refs (1): 1C9E5
size(ex):
        :: symcomp EXPLODE BINT0 pshm1 BEGIN     * 59F91
          :: M1stFNCcase                         * 59FAF

delB[1-3]:
            :: SWAPDROP#1- SWAPDROP#1- SWAPDROP#1- ; * 59FB9
            #1-SWAP nonopcase DROP               * 59FD2
            infarg? casedrop SWAPDROP#1-         * 59FE1
            DROP ;                               * 59FF0
          psh #+ pshm1 #0=UNTIL 2DROP UNCOERCE ; * 59FFA
