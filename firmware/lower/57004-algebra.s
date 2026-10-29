* HP 48GX ROM revision R, #57004-#5A01C: Symbolic algebra
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: drop;q_58A0C MEQU? Π'+s Π'*s SYMCOLCT NoIdsInMeta? {RULES\D->} swappargunrot nm=>st addtpsh SYMSHOW SYMEXPAN
* Follows on from the previous file (at #57004 in the original ROM).
        RPL

* refs (4): 2E605 2E65F 2E826 56F4A
nm=>st:
        :: DUPTYPEIDNT? ?SKIP LAM>ID             * 57004
          ID>$ ;                                 * 57018

* refs (5): 85EAD 85F2F 85F8E 85FF2 86704
OBJ_57022:
        :: OBJ_56CD1 pshzer parg& COLA MetaConcase * 57022
        ;                                        * 57040

* refs (22): 860BA 86150 861A5 86213 86263 862C7 ...
OBJ_57045:
        :: OBJ_56CD1 dup ;                       * 57045

* refs (1): 571D1
OBJ_57059:
        :: BINT28 ROLL BINT28 4GETLAM 5GETLAM 6GETLAM 9GETLAM 10GETLAM * 57059
          15GETLAM 16GETLAM BINT7 psh DROP BINT29 ONE_DO INDEX@ PUTLAM LOOP * 57086
          DROP 20PUTLAM 15PUTLAM 10PUTLAM 9PUTLAM 6PUTLAM 5PUTLAM 21PUTLAM ; * 570B8

* refs (1): C0228
OBJ_570E5:
        :: OBJ_73230                             * 570E5
          :: OBJ_57171 OBJ_57211 ; ;             * 570EF

* refs (1): C0410
OBJ_57108:
        :: OBJ_73230                             * 57108
          :: OBJ_57171 OBJ_44F4D ; ;             * 57112

* refs (1): C031C
OBJ_5712B:
        :: OBJ_73230                             * 5712B
          :: OBJ_57171 OBJ_44F6C ; ;             * 57135

* refs (1): C06EC
OBJ_5714E:
        :: OBJ_73230                             * 5714E
          :: OBJ_57171 OBJ_458CF ; ;             * 57158

* refs (6): 45C49 45C6C 570F4 57117 5713A 5715D
OBJ_57171:
        :: OBJ_4EE42 NOTcase                     * 57171
          :: BINT21 ROLLDROP ' OBJ_73594 BINT21 UNROLL RDROP ROMPTR 0F1 03E ; * 57180
          'REVAL BINT24 ROLLDROP BINT23 UNROLL OBJ_57059 18GETLAM ' * 571B8
          Π'SAVEDDEPTH STOLAM TRUE'              * 571E0

Π'EnvOK_571EF:
          LAM 'EnvOK STOLAM DispMenu ;           * 571EF

* refs (1): 570F9
OBJ_57211:
        ::                                       * 57211

* refs (5): 44F52 44F81 458EE 8AB90 8B5B6
OBJ_57216:
          :: ROMPTR 0F1 001 ROMPTR 0F1 00B ROMPTR 0F1 003 BIND ; * 57216
          ROMPTR 0F1 004 DUP ' OBJ_5135F ROMPTR 0F1 005 ' NOP %1 * 57246
          ROMPTR 0F1 006 OBJ_4C314 ;             * 5727A
        NIBHEX  0000                             * 5728F  ..

* sym id -> symb
* refs (3): 20AA2 B6BAD B6BB2
SYMISOL:
        ::                                       * 57293
          :: 2DUP %0_2A2B4 3UNROLL BINT1 SWAPROT SINNER get1 SYMISOL~1 * 57298
            OBJ_57324 ABND NOTcase SETISOLERR    * 572C5
          ;                                      * 572D9
          DUP#2+PICK OBJ_57676 case SETISOLERR   * 572DE
          DROP #1+ PTR addt: x= get1 DROP CKSYMBN uncrunch coleval ; * 572F2

* refs (3): 572C5 57626 86DB2
OBJ_57324:
        :: OBJ_57676 NOTcase DROP2dropf          * 57324
          OVER #1=case                           * 57338
          :: DROP 2DROP TRUE ;                   * 57342
          3UNROLL #1-SWAP ROTSWAP nonopcase 2DROP2dropf * 5735B
          REQcasedrop xFCNAPPLY                  * 57374
          OBJ_5739C OBJ_26F26 NOTcase 2DROP2dropf * 5737E
          COLA_EVAL ;                            * 57392

* refs (1): 5737E
OBJ_5739C:
        :: SWAP#1-SWAP 4ROLL CARCOMP NOTROMPcase 2DROP2dropf * 5739C
          DUP OBJ_26F26 NOTcasedrop 2DROP2dropf  * 573BA
          SWAP OBJ_5E9E1 ?SKIP                   * 573CE
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
OBJ_57446:
        ROMPTR 0F0 0C7                           * 57446

* refs (2): 1A982 1ADDB
OBJ_57451:
        ROMPTR 0F0 0C9                           * 57451

* refs (1): 1AEF2
OBJ_5745C:
        ROMPTR 0F0 0CA                           * 5745C

* refs (1): 1AFEB
OBJ_57467:
        ROMPTR 0F0 0CB                           * 57467

* refs (1): 1B0D7
OBJ_57472:
        ROMPTR 0F0 0CC                           * 57472

* refs (1): 86D35
OBJ_5747D:
        ROMPTR 0F0 0CD                           * 5747D

* refs (1): 1AA0C
OBJ_57488:
        :: OBJ_57658 xNEG ;                      * 57488

* refs (1): 1B2BE
OBJ_5749C:
        :: OBJ_57658 xINV ;                      * 5749C

* refs (1): 1B937
OBJ_574B0:
        ROMPTR 0F0 0CE                           * 574B0

* refs (1): 1B981
OBJ_574BB:
        :: OBJ_57658 xEXP ;                      * 574BB

* refs (1): 1B4E8
OBJ_574CF:
        ROMPTR 0F0 0CF                           * 574CF

* refs (1): 1B541
OBJ_574DA:
        ROMPTR 0F0 0D0                           * 574DA

* refs (1): 1B59A
OBJ_574E5:
        ROMPTR 0F0 0D1                           * 574E5

* refs (1): 1B5E9
OBJ_574F0:
        ROMPTR 0F0 0D2                           * 574F0

* refs (1): 1B638
OBJ_574FB:
        ROMPTR 0F0 0D3                           * 574FB

* refs (1): 1B687
OBJ_57506:
        ROMPTR 0F0 0D4                           * 57506

* refs (1): 1B6D6
OBJ_57511:
        :: OBJ_57658 xSIN ;                      * 57511

* refs (1): 1B761
OBJ_57525:
        :: OBJ_57658 xCOS ;                      * 57525

* refs (1): 1B7CE
OBJ_57539:
        :: OBJ_57658 xTAN ;                      * 57539

* refs (1): 1B81D
OBJ_5754D:
        :: OBJ_57658 xSINH ;                     * 5754D

* refs (1): 1B862
OBJ_57561:
        :: OBJ_57658 xCOSH ;                     * 57561

* refs (1): 1B8D4
OBJ_57575:
        :: OBJ_57658 xTANH ;                     * 57575

* refs (1): 1B46C
OBJ_57589:
        :: OBJ_57630 xSQRT OBJ_57856 OBJ_5760D ; * 57589

* refs (1): 1B3BA
OBJ_575A7:
        :: OBJ_57658 xSQ ;                       * 575A7

* refs (1): 1B9F8
OBJ_575BB:
        :: OBJ_57658 xALOG ;                     * 575BB

* refs (1): 1BAB4
OBJ_575CF:
        :: OBJ_57658 xEXPM ;                     * 575CF

* refs (1): 1BA6F
OBJ_575E3:
        ROMPTR 0F0 0D5                           * 575E3

* refs (1): 1AAAA
OBJ_575EE:
        :: OBJ_57658 xCONJ ;                     * 575EE

* refs (1): 1BAEA
OBJ_57602:
        ROMPTR 0F0 0D6                           * 57602

* refs (21): 5759D 5764E 5766C 86BCD 86C3B 86C9A ...
OBJ_5760D:
        :: RDROP psh #1-SWAP COLA OBJ_57324      * 5760D
        ;                                        * 5762B

* refs (10): 5758E 86E70 86E98 86EBB 86EE3 86F06 ...
OBJ_57630:
        :: addtpsh 'R SWAP#1+ PRSOL? case OBJ_5760D * 57630
        ;                                        * 57653

* refs (13): 5748D 574A1 574C0 57516 5752A 5753E ...
OBJ_57658:
        :: addtpsh 'RRDROP SWAP#1+ OBJ_5760D ;   * 57658

* refs (8): 572E3 57329 5A1D0 86BAA 86BF0 86C5E ...
OBJ_57676:
        :: OVER BEGIN DUP#0=case                 * 57676

* meta ob -> meta ob flag
ObInMeta?:
          OBJ_576CB                              * 5768A
          DUP #3+PICK 3PICK EQUALcase OBJ_576B7  * 5768F
          #1- AGAIN ;                            * 576A8

* refs (2): 576A3 584DA
OBJ_576B7:
        :: DROPRDROP TRUE ;                      * 576B7

* refs (2): 5768A 584FD
OBJ_576CB:
        :: DROPRDROP FALSE ;                     * 576CB

* refs (2): 86F10 86F5B
OBJ_576DF:
        ::                                       * 576DF

{PI,I,*}:
          { xPI xi x* } INNERCOMP OBJ_57888 SWAP#1+ meta* ; * 576E4

* refs (6): 86D5D 86E3E 86E7A 86F38 86F7E 86FC4
OBJ_57716:
        ::                                       * 57716

{2,Pi,*,I,*}:
          { %2 xPI x* xi x* } INNERCOMP OBJ_57888 SWAP#1+ meta* ; * 5771B

* refs (1): 86ECA
OBJ_57757:
        :: RAD? case                             * 57757
          :: %2 ' xPI 'x* OBJ_57888 'x* BINT5 ;  * 57766
          DEG? ITE %360 %400                     * 57793
          OBJ_57888 ' x* BINT3 ;                 * 577A7

* refs (2): 86EA2 86EED
OBJ_577C0:
        :: RAD? case                             * 577C0
          :: ' xPI OBJ_57888 'x* BINT3 ;         * 577CF
          DEG? ITE %180 %200                     * 577F2
          OBJ_57888 'x* BINT3 ;                  * 57806

* refs (2): 86EA7 86F15
OBJ_5781A:
        :: %-1 psh1&rev 3PICK psh1&rev psh PTR addt2: x^ x* pshtop& meta+ ; * 5781A

* refs (4): 57598 86DE9 86EC5 86F33
OBJ_57856:
        :: OBJ_578A1 BINT1 pshtop& meta* ;       * 57856

* refs (5): 86D62 86ECF 86EF2 86F3D 86F60
OBJ_57874:
        :: top& meta+ ;                          * 57874

* refs (6): 57702 57743 5777F 577A7 577DE 57806
OBJ_57888:
        :: TRUE Π'ni EVAL ;                      * 57888

* refs (1): 5785B
OBJ_578A1:
        :: TRUE Π'ns EVAL ;                      * 578A1

* refs (1): 5790B
SYMISOL~1~3:
        { Π'ni Π'ns }                            * 578BA

* refs (2): 57892 578BF
Π'ni:
        LAM 'ni                                  * 578CE

* refs (2): 578AB 578C4
Π'ns:
        LAM 'ns                                  * 578DB

* refs (1): 572C0
SYMISOL~1:
        :: ' SYMISOL~1~1 TOTEMPOB ' SYMISOL~1~2 TOTEMPOB SYMISOL~1~3 BIND ; * 578E8

* refs (1): 578F2
SYMISOL~1~1:
        CODE                                     * 5791A  20 nibbles
          GOSBVL  SUB_57956                      * 57924  inline data follows

n0:
          NIBHEX  84E2020E60303                  * 5792B  H. à..
        ENDCODE                                  * 57938

* refs (1): 57901
SYMISOL~1~2:
        CODE                                     * 57938  20 nibbles
          GOSBVL  SUB_57956                      * 57942  inline data follows

s0:
          NIBHEX  84E2020370303                  * 57949  H. 0..
        ENDCODE                                  * 57956
        ASSEMBLE

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
        GONC    L_57985                          * 57974
        P=      3                                * 57977
        CSL     WP                               * 57979
        CSL     WP                               * 5797C
        P=      0                                * 5797F
        LC(2)   #30                              * 57981
L_57985:
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
        GOYES   L_579E9                          * 579C0
        DAT1=A  4                                * 579C2
        LC(2)   #03                              * 579C6
L_579CA:
        D1=D1-  4                                * 579CA
        DAT1=C  2                                * 579CD
        D1=D1-  5                                * 579D1
        C=RSTK                                   * 579D4
        CD1EX                                    * 579D6
        DAT1=C  A                                * 579D9
        LC(5)   TOTEMPOB                         * 579DC
        A=C     A                                * 579E3
        PC=(A)                                   * 579E5
L_579E9:
        ASR     A                                * 579E9
        ASR     A                                * 579EB
        DAT1=A  B                                * 579ED
        LC(2)   #02                              * 579F0
        GOTO    L_579CA                          * 579F4
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
          :: OBJ_57CDF #1-SWAP COLA OBJ_57C3A    * 57AB6
          ;                                      * 57ACF
          MetaD-> Meta<-D MetaE^ MetaL* ?expanneginv Meta->() ?expanapp * 57AD4
          +B21;PullB[1];<1> ;                    * 57AF7

* refs (1): 57AF2
?expanapp:
        :: M1stFNCcase ?expanapp~1               * 57B01
        ;                                        * 57B10

* refs (1): 57B0B
?expanapp~1:
        :: 4PICK ?expanapp~1~1 NOTcaseDROP COLA_EVAL * 57B15
        ;                                        * 57B2E

* refs (2): 57AF7 57B5D
+B21;PullB[1];<1>:
        :: top& #1-SWAP BINT1 ;                  * 57B33

* refs (1): 57AE8
?expanneginv:
        CON(5)  (*)+5                            * 57B4C  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 57B51  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  67000                            * 57B58  pattern: op5 op6
        CON(5)  +B21;PullB[1];<1>                * 57B5D  run if it matches
        NIBHEX  F                                * 57B62  end of the rules
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
OBJ_57C3A:
        :: DROP delB[1-2] M1st+case expansum^    * 57C3A
          M1st-case expansum^                    * 57C53
          dup top& meta* ;                       * 57C5D

* refs (2): 57C4E 57C58
expansum^:
        :: pshzer pullpsh1& pshzerpsharg dup OBJ_57CDF %2 psh1& unrot meta* * 57C71
          psh dup unrot top& meta* psh over& overev& top& OBJ_57CDF meta+ ; * 57CA3

* refs (3): 57ABB 57C8A 57CD0
OBJ_57CDF:
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
L_57D1D:
        ?A#0    P                                * 57D1D
        GOYES   L_57D2F                          * 57D20
        ?C=A    X                                * 57D22
        GOYES   L_57D34                          * 57D25
        P=P+1                                    * 57D27
        C=C-1   X                                * 57D29
        GONC    L_57D1D                          * 57D2C
L_57D2F:
        ?C#A    X                                * 57D2F
        GOYES   L_57D78                          * 57D32
L_57D34:
        C=0     M                                * 57D34
        C=C+1   P                                * 57D37
        A=A-C   M                                * 57D3A
        P=      14                               * 57D3D
        ?A#0    P                                * 57D3F
        GOYES   L_57D4A                          * 57D42
        A=A-1   X                                * 57D44
        ASL     M                                * 57D47
L_57D4A:
        P=      0                                * 57D4A
        SETHEX                                   * 57D4C
        LC(5)   TRUE                             * 57D4E
        ?A=0    S                                * 57D55
        GOYES   L_57D61                          * 57D58
        LC(5)   FALSE                            * 57D5A
L_57D61:
        DAT1=C  A                                * 57D61
        GOSBVL  PUSH%                            * 57D64
        LC(5)   TRUE                             * 57D6B
        A=C     A                                * 57D72
        PC=(A)                                   * 57D74
L_57D78:
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
          OBJ_57F00                              * 57EE9
        ;                                        * 57EEE

* refs (6): 57EA8 57EC1 57ED0 5805E 58086 58095
Π'*s:
        LAM '*s                                  * 57EF3

* refs (2): 57EE9 57FE6
OBJ_57F00:
        :: pick1#0=case OBJ_58045                * 57F00
          swappargunrot NoIdsInMeta? '           * 57F0F
          :: pshtop& COLA OBJ_58045              * 57F1E
          ;                                      * 57F32
          ' OBJ_57F64 COLARPITE ;                * 57F37

* meta1 meta2 -> M_rest meta2 M_last
* refs (4): 57F0F 57F87 58165 581BF
swappargunrot:
        :: psh pshzerpsharg unrot ;              * 57F4B

* refs (3): 57F3C 58013 5803B
OBJ_57F64:
        :: pick1#0=case                          * 57F64
          :: top& COLA OBJ_58045                 * 57F6E
          ;                                      * 57F82
          swappargunrot NoIdsInMeta? case        * 57F87
          :: psh roll2top& roll2top& COLA OBJ_58045 * 57F96
          ;                                      * 57FB4
          OBJ_582BE case                         * 57FB9
          :: OBJ_58081 OBJ_582E6 4roll top& unrot COLA OBJ_57F00 * 57FC3
          ;                                      * 57FEB
          OBJ_58313 case                         * 57FF0
          :: 5roll top& 4unroll COLA OBJ_57F64   * 57FFA
          ;                                      * 58018
          psh 5roll top& 4unroll rotswap COLA OBJ_57F64 * 5801D
        ;                                        * 58040

* refs (4): 57F0A 57F2D 57F7D 57FAF
OBJ_58045:
        :: top& pshtop& top& 'x* Π'*s ABND NDUPN top& psh AGAIN ; * 58045

* refs (1): 57FC8
OBJ_58081:
        :: Π'*s #1- ' Π'*s STO ;                 * 58081

* refs (1): 58200
OBJ_580A4:
        :: Π'+s #1- ' Π'+s STO ;                 * 580A4

* refs (1): 57E53
colrev~2:
        :: SWAPDROP#1- psh larg BINT0 rot parg& unrot count+ #1+ * 580C7

{'+s}:
          { Π'+s } BIND psh count+ Π'+s #+ ' Π'+s STO BINT0 unrot COLA * 580F9
          OBJ_58156                              * 5813F
        ;                                        * 58144

* refs (6): 580A9 580B8 580FE 58117 58126 5829B
Π'+s:
        LAM '+s                                  * 58149

* refs (2): 5813F 5821E
OBJ_58156:
        :: pick1#0=case OBJ_5827D                * 58156
          swappargunrot NoIdsInMeta? case        * 58165
          :: pshtop& COLA OBJ_5827D              * 58174
          ;                                      * 58188
          COLA OBJ_5819C                         * 5818D
        ;                                        * 58197

* refs (3): 58192 5824B 58273
OBJ_5819C:
        :: pick1#0=case                          * 5819C
          :: top& COLA OBJ_5827D                 * 581A6
          ;                                      * 581BA
          swappargunrot NoIdsInMeta? case        * 581BF
          :: psh roll2top& roll2top& COLA OBJ_5827D * 581CE
          ;                                      * 581EC
          OBJ_583C7 case                         * 581F1
          :: OBJ_580A4 OBJ_5848A 4roll top& unrot COLA OBJ_58156 * 581FB
          ;                                      * 58223
          OBJ_583EF case                         * 58228
          :: 5roll top& 4unroll COLA OBJ_5819C   * 58232
          ;                                      * 58250
          psh 5roll top& 4unroll rotswap COLA OBJ_5819C * 58255
        ;                                        * 58278

* refs (4): 58160 58183 581B5 581E7
OBJ_5827D:
        :: top& pshtop& top& ' x+ Π'+s ABND NDUPN top& psh AGAIN ; * 5827D

* refs (1): 57FB9
OBJ_582BE:
        :: OBJ_58620 rot OBJ_58620 rot COLA MEQU? * 582BE
        ;                                        * 582E1

* refs (1): 57FCD
OBJ_582E6:
        :: NDROP unrot psh 2top& PTR addt2: x+ x^ ; * 582E6

* refs (1): 57FF0
OBJ_58313:
        :: MetaLess? '                           * 58313
          :: OBJ_58359 TRUE ; '                  * 58322
          :: OBJ_58359 FALSE ; COLARPITE ;       * 5833B

* refs (2): 58327 58340
OBJ_58359:
        :: unrot psh OVER %1 EQITE 2DROP         * 58359
          :: top& ' x^ SWAP#1+ ; unrot psh %1 MEQ1stcase 2DROP * 5837C
          top& PTR addt: x^ ;                    * 583B3

* refs (1): 581F1
OBJ_583C7:
        :: OBJ_5863E rot OBJ_5863E rot COLA MEQU? * 583C7
        ;                                        * 583EA

* refs (1): 58228
OBJ_583EF:
        :: MetaLess? case                        * 583EF
          :: OBJ_58421 TRUE ;                    * 583FE
          OBJ_58421 FALSE ;                      * 58412

* refs (2): 58403 58412
OBJ_58421:
        :: unrot psh OVER %1 EQITE               * 58421

drop2;delB[1]:
          :: 2DROP SWAPDROP#1- ; pshtop& unrot psh %1 MEQ1stcase * 5843F
          :: 2DROP SWAPDROP#1- ;                 * 5846C
          pshtop& ;                              * 58480

* refs (1): 58205
OBJ_5848A:
        :: NDROP unrot pshtop& PTR addt: x+ pshtop& ; * 5848A

* meta1 meta2 -> meta1 meta2 flag
* refs (8): 56142 56179 56255 562B4 582DC 583E5 ...
MEQU?:
        :: DUP #2+PICK OVER#= NOTcaseFALSE DUP   * 584B2
          BEGIN DUP#0=case OBJ_576B7             * 584D0
          2DUP#+ #3+PICK OVER #3+PICK EQUAL NOTcase OBJ_576CB * 584DF
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
L_585C5:
        A=DAT0  S                                * 585C5
        C=DAT1  S                                * 585C9
        ?C#A    S                                * 585CD
        GOYES   L_585DB                          * 585D0
        D0=D0+  1                                * 585D2
        D1=D1+  1                                * 585D5
        GONC    L_585C5                          * 585D8
L_585DB:
        ?C<A    S                                * 585DB
        GOYES   L_58600                          * 585DE
        GOSBVL  GETPTR                           * 585E0
        D1=D1+  5                                * 585E7
        D=D+1   A                                * 585EA
        LC(5)   FALSE                            * 585EC
        DAT1=C  A                                * 585F3
        A=DAT0  A                                * 585F6
        D0=D0+  5                                * 585F9
        PC=(A)                                   * 585FC
L_58600:
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
OBJ_58620:
        :: M1st^case plDRPpZparg                 * 58620
          %1 pshm1 ;                             * 5862F

* refs (2): 583CC 583D6
OBJ_5863E:
        :: M1st*case OBJ_58661                   * 5863E
          %1 pshm1 addt* ;                       * 5864D

* refs (1): 58648
OBJ_58661:
        :: OBJ_58CB7 pshzer BEGIN parg& NoIdsInMeta? UNTIL DUP#0= IT * 58661
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
L_58732:
        D1=D1+  5                                * 58732
        D0=D0-  1                                * 58735
        GOC     L_58793                          * 58738
        C=DAT1  A                                * 5873B
        CD1EX                                    * 5873E
        A=DAT1  A                                * 58741
        D1=C                                     * 58744
        LC(5)   DOIDNT                           * 58747
        ?C=A    A                                * 5874E
        GOYES   L_58786                          * 58751
        LC(5)   DOLAM                            * 58753
        ?C=A    A                                * 5875A
        GOYES   L_58786                          * 5875D
        LC(5)   DOCOL                            * 5875F
        ?C#A    A                                * 58766
        GOYES   L_58732                          * 58769
        C=DAT1  A                                * 5876B
        CD1EX                                    * 5876E
        D1=D1+  5                                * 58771
        A=DAT1  A                                * 58774
        D1=C                                     * 58777
        LC(5)   CK0                              * 5877A
        ?C#A    A                                * 58781
        GOYES   L_58732                          * 58784
L_58786:
        LC(5)   FALSE                            * 58786
        A=C     A                                * 5878D
        GOTO    L_5879C                          * 5878F
L_58793:
        LC(5)   TRUE                             * 58793
        A=C     A                                * 5879A
L_5879C:
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
          M1stNEGcase OBJ_58854                  * 587D2
          M1stINVcase OBJ_58912                  * 587DC
          M1stSQcase colfac~3                    * 587E6
          pullrev1& AGAIN ;                      * 587F0

* refs (1): 587C3
colfac~1:
        :: SWAPDROP#1- PTR psh1&rev: x+ addtNEG COLA OBJ_58854 * 587FF
        ;                                        * 58822

* refs (1): 587CD
colfac~2:
        :: SWAPDROP#1- PTR psh1&rev: x* PTR addt: xINV COLA OBJ_58912 * 58827
        ;                                        * 5884F

* refs (4): 587D7 5881D 588DB 589DF
OBJ_58854:
        :: SWAPDROP#1- M1st+case OBJ_588B8       * 58854
          M1st-case OBJ_588E5                    * 58868
          M1stNEGcase OBJ_588A4                  * 58872
          PTR psh1&rev: x* pshzerpsharg %-1 SWAP#1+ pshtop& AGAIN ; * 5887C

* refs (2): 58877 58935
OBJ_588A4:
        :: SWAPDROP#1- AGAIN ;                   * 588A4

* refs (1): 58863
OBJ_588B8:
        :: pullrev1& pshzerpsharg addtNEG pshtop& addtNEG COLA OBJ_58854 * 588B8
        ;                                        * 588E0

* refs (1): 5886D
OBJ_588E5:
        :: SWAPDROP#1- PTR psh1&rev: x+ pshzerpsharg addtNEG pshtop& AGAIN ; * 588E5

* refs (3): 587E1 5884A 5898F
OBJ_58912:
        :: SWAPDROP#1- M1st*case OBJ_58962       * 58912
          M1st/case OBJ_58999                    * 58926
          M1stINVcase OBJ_588A4                  * 58930
          M1st^case OBJ_589CB                    * 5893A
          PTR psh1&rev: x^ %-1 SWAP#1+ AGAIN ;   * 58944

* refs (1): 58921
OBJ_58962:
        :: pullrev1& pshzerpsharg PTR addt: xINV pshtop& PTR addt: xINV COLA * 58962
          OBJ_58912                              * 5898F
        ;                                        * 58994

* refs (1): 5892B
OBJ_58999:
        :: SWAPDROP#1- PTR psh1&rev: x* pshzerpsharg PTR addt: xINV pshtop& * 58999
          AGAIN ;                                * 589C1

* refs (1): 5893F
OBJ_589CB:
        :: pullrev1& addtNEG COLA OBJ_58854      * 589CB
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
          M1st*case colunfac~3                   * 58A48
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
        D1=(5)  L_58B17                          * 58AE6
        A=DAT1  15                               * 58AED
        D1=C                                     * 58AF1
        D1=D1+  5                                * 58AF4
        C=DAT1  15                               * 58AF7
        D1=D1-  5                                * 58AFB
        P=      14                               * 58AFE
        ?C#A    WP                               * 58B00
        GOYES   L_58B0E                          * 58B03
        P=      0                                * 58B05
        GOVLNG  docola                           * 58B07
L_58B0E:
        P=      0                                * 58B0E
        GOVLNG  doskip                           * 58B10

L_58B17:
        CON(5)  x*                               * 58B17  address (the code jumps or points through it)

        CON(5)  x^                               * 58B1C  address (the code jumps or points through it)

        CON(5)  %-1                              * 58B21  address (the code jumps or points through it)
        RPL

* refs (1): 58A39
colunfac~1:
        :: BINT3 #- SWAPDROP ROTROT2DROP ' x/ psh1& AGAIN ; * 58B26

* refs (1): 58A43
colunfac~2:
        :: pullpsh1& M1st+case colunfac~2~1      * 58B58
          AGAIN ;                                * 58B6C

* refs (2): 58B67 58B8F
colunfac~2~1:
        :: plDRPpZparg OBJ_5CD02 pshtop& M1st+case colunfac~2~1 * 58B76
          AGAIN ;                                * 58B94

* refs (1): 58A4D
colunfac~3:
        ::                                       * 58B9E
          :: MetaMulInv COLA SKIP                * 58BA3
          ;                                      * 58BB7
          AGAIN pullpsh1& M1st*case colunfac~3~1 * 58BBC
          AGAIN ;                                * 58BD0

* refs (2): 58BCB 58BF3
colunfac~3~1:
        :: plDRPpZparg addt* pshtop& M1st*case colunfac~3~1 * 58BDA
          AGAIN ;                                * 58BF8

* meta -> meta #0 meta &+&+..&+ -> meta #n
* refs (3): 580EF 58112 58C94
count+:
        CON(5)  (*)+5                            * 58C02  primitive code object
        ASSEMBLE
        ST=1    0                                * 58C07
        GOTO    L_58C16                          * 58C0A

* meta -> meta #0 meta &*&*..&* -> meta #n
* refs (3): 57E99 57EBC 58CBC
count*:
        CON(5)  (*)+5                            * 58C0E  primitive code object
        ST=0    0                                * 58C13
L_58C16:
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
        GOYES   L_58C41                          * 58C38
        LC(5)   x+                               * 58C3A
L_58C41:
        D1=D1+  5                                * 58C41
        A=DAT1  A                                * 58C44
        ?C#A    A                                * 58C47
        GOYES   L_58C52                          * 58C4A
        D0=D0+  1                                * 58C4C
        GONC    L_58C41                          * 58C4F
L_58C52:
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
OBJ_58CB7:
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
                OBJ_26F34 DROP EVAL ;            * 58D48
              REPEAT ;                           * 58D5C
            ABND ;                               * 58D66
        ;                                        * 58D70

* sym id/lam -> symf
* refs (4): 20AE2 20AEC 49832 5960A
SYMSHOW:
        :: BINT1 {}N dvarlsBIND EXPLODE OBJ_58DA7 ABND DROP IMPLODE ; * 58D75

* refs (4): 58D8E 58FCB 590A2 59207
OBJ_58DA7:
        :: TRUE                                  * 58DA7

{'fl}:
          {                                      * 58DB1

Π'fl:
            LAM 'fl }                            * 58DB6
          BIND pshzer BEGIN M1stFNCcase OBJ_58E45 * 58DC8
          Mid1stcase OBJ_58F12                   * 58DE1
          :: OVER nonopcase FALSE                * 58DEB
            OBJ_26F7A ;                          * 58DFF
          casedrop OBJ_59020                     * 58E09
          DROP pullpsh1& COLA OBJ_58E2C          * 58E13
        ;                                        * 58E27

* refs (8): 58E22 58EE5 58F08 58F4E 58FBC 58FE9 ...
OBJ_58E2C:
        :: #0=UNTIL DROP 1GETABND ;              * 58E2C

* refs (1): 58DDC
OBJ_58E45:
        :: 4PICK TYPEROMP? case OBJ_59020        * 58E45
          4PICK ROMPTR@NOT casedrop OBJ_58EEF    * 58E5E
          5PICK SWAP 5PICK OBJ_56FD1 BIND 2GETLAM OBJ_5DEF7 * 58E72

* refs (1): 58EB3
OBJ_58E95:
          :: DROP ABND COLA OBJ_58EEF            * 58E95
          ;                                      * 58EAE
          OBJ_58E95 DROP larg SWAPDROP#1- ROTROT2DROP OBJ_56E05 SWAPDROP * 58EB3
          EXPLODE top& COLA OBJ_58E2C            * 58ED6
        ;                                        * 58EEA

* refs (2): 58E6D 58EA9
OBJ_58EEF:
        :: pullpsh1& pullpsh1& pullpsh1& COLA OBJ_58E2C * 58EEF
        ;                                        * 58F0D

* refs (1): 58DE6
OBJ_58F12:
        :: #1-SWAP lam'dvar OVER EQUALPOSCOMP #0<> case * 58F12
          :: psh1& FALSE 1PUTLAM COLA OBJ_58E2C  * 58F35
          ;                                      * 58F53
          DUP ROMPTR@NOT case OBJ_58FA8          * 58F58
          idntlamcase                            * 58F6C
          :: ONECOLA OBJ_58FC6 ;                 * 58F71
          dup;ex? NOTcase OBJ_58FA8              * 58F85
          EXPLODE COLA OBJ_58FC6                 * 58F94
        ;                                        * 58FA3

* refs (2): 58F67 58F8F
OBJ_58FA8:
        :: DROP psh1& COLA OBJ_58E2C             * 58FA8
        ;                                        * 58FC1

* refs (2): 58F7B 58F9E
OBJ_58FC6:
        :: OBJ_58DA7 case                        * 58FC6
          :: NDROP psh1& COLA OBJ_58E2C          * 58FD5
          ;                                      * 58FEE
          get1 DROP ROTUntop& psh FALSE 1PUTLAM COLA OBJ_58E2C * 58FF3
        ;                                        * 5901B

* refs (2): 58E0E 58E59
OBJ_59020:
        :: larg pshzer BINT3 BEGIN DUP#1+PICK    * 59020
          :: idntlamcase OBJ_590D4               * 5903E
          ;                                      * 5904D
          DROP BINT1 splitup 2DUPSWAP #- #2= UNTIL DROP psh lam'dvar * 59052
          INNERtop& {}N dvarlsBIND rotswap pullpsh1& rotswap OBJ_58DA7 ABND * 59084
          1GETLAM AND 1PUTLAM ROTUntop& psh COLA OBJ_58E2C * 590AC
        ;                                        * 590CF

* refs (1): 59048
OBJ_590D4:
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
        :: DUP1LAMBIND OBJ_591E9 DROP 1ABNDSWAP 'EvalNoCK:_sup x= ; * 591C1

* refs (2): 4BD28 591CB
OBJ_591E9:
        :: SWAPcompSWAP ONE{}N dvarlsBIND DUP EXPLODE OBJ_58DA7 1GETLAM * 591E9
          CARCOMP 1PUTLAM 3UNROLL                * 59211
          :: AEQ1stcase x=                       * 59220
            :: drpmeta- ROTDROP FALSE 3UNROLL ; ; * 5922F
          ROT ITE NDROP                          * 59252
          :: IMPLODE symcomp SWAPDROP ;          * 59261
          BINT2 OBJ_59373 ABND DROP DUP%0= NOTcase quad(3ex)? * 5927A
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
OBJ_59373:
        :: OBJ_59503 OBJ_593AF ;                 * 59373

* refs (2): 593A0 59560
OBJ_59387:
        :: lam'dvar ?PURGE_HERE ;                * 59387

* refs (1): 5955B
OBJ_5939B:
        :: OBJ_59387 ERRJMP ;                    * 5939B

* refs (1): 5937D
OBJ_593AF:
        :: DUP %0_2A2B4 lam'dvar XEQSTOID xEVAL OBJ_54BAF xSWAP 1GETLAM * 593AF
          lam'dvar XEQSTOID 2GETLAM #0=case DROPONE * 593DC
          2GETLAM #1=?SKIP                       * 593F5
          :: 2GETLAM ONE_DO OBJ_4241B lam'dvar DERIV xEVAL xDUP %0_2A2B4 * 593FF
            lam'dvar XEQSTOID xEVAL 1GETLAM lam'dvar XEQSTOID INDEX@ * 5942C
            OBJ_594AE xSWAP LOOP ;               * 5944F
          %0_2A2B4 lam'dvar XEQSTOID lam'dvar DERIV 2GETLAM OBJ_594AE DEPTH * 59463
          2GETLAM #1+ #<case SETSTACKERR         * 5948B
          2GETLAM #1+ ;                          * 5949F

* refs (2): 5944F 59481
OBJ_594AE:
        :: UNCOERCE %1=case DROP                 * 594AE
          %2=case x/                             * 594C2
          SYMFACT OVER %ABS %1 EQUALNOTcase x/   * 594CC
          SWAP ONESYMBN SWAP x/ ;                * 594EA

* refs (2): 59378 595C9
OBJ_59503:
        :: lam'dvar OBJ_5956F                    * 59503

{'n,'prog}:
          {                                      * 59512

Π'n:
            LAM 'n                               * 59517

Π'prog:
            LAM 'prog }                          * 59522
          BIND 1GETLAM lam'dvar CREATE ERRSET 'REVAL ERRTRAP OBJ_5939B * 59538
          OBJ_59387 ABND ;                       * 59560

* refs (2): 4BD19 5950D
OBJ_5956F:
        :: ' x<< ' x' ROT ' xENDTIC ' x>> BINT5 ::N ; * 5956F

* refs (1): 49ADD
SymDer(ex,nm):
        :: uncrunch                              * 595B0
          :: DUPDUP dvarlsBIND OBJ_59503 DERIV ; ; * 595BA

* sym id % -> symf
* refs (3): 20B2F B6B8F B6B94
SYMTAYLR:
        :: uncrunch taylr!(ex,gn,r) ;            * 595DD

* refs (1): 595E7
taylr!(ex,gn,r):
        :: COERCE UNROTDUP dvarlsBIND SWAPcompSWAP SYMSHOW symcomp SWAP * 595F1
          OBJ_59373 DUP#1- #0=case               * 59619

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
          :: OBJ_69C64                           * 596C9

* restricted collection
MetaRCOLCT:
            :: OBJ_59F32 ROMPTR 0F0 076 RDROP ; ; * 596D3
        }                                        * 596F7

* refs (1): 3F21F
{RULES\DNEG}:
        {                                        * 596FC

_DNEG_:
          $ "DNEG"                               * 59701
          :: OBJ_69C64                           * 59713

* double negate
MetaDNEG:
            :: OBJ_59F32 PTR addt2: xNEG xNEG RDROP ; ; * 5971D
        }                                        * 59745

* refs (1): 3F224
{RULES\DINV}:
        {                                        * 5974A

_DINV_:
          $ "DINV"                               * 5974F
          :: OBJ_69C64                           * 59761

* double invert
MetaDINV:
            :: OBJ_59F32 PTR addt2: xINV xINV RDROP ; ; * 5976B
        }                                        * 59793

* refs (1): 3F229
{RULES\*1}:
        {                                        * 59798

_*1_:
          $ "*1"                                 * 5979D
          :: OBJ_69C64                           * 597AB

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
          :: OBJ_69C64                           * 59831

* pow by one
Meta^1:
            :: OBJ_59F32 PTR addt2: %1 x^ RDROP ; ; * 5983B
        }                                        * 59863

* refs (1): 3F233
{RULES\/1}:
        {                                        * 59868

_/1_:
          $ "/1"                                 * 5986D
          :: OBJ_69C64                           * 5987B

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
          :: OBJ_69C64                           * 59905

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
          :: OBJ_69C64 Meta<--> ; }              * 59963

* refs (3): 86A6A 86AB0 86AF1
{RULES\<-A}:
        {                                        * 5997C

_<-A_:
          $ "←A"                                 * 59981
          {                                      * 5998F
            :: OBJ_69CAC Meta<-A ; DoBadKey      * 59994
            :: OBJ_69CAC Meta<-Aall ; }          * 599AD
        }                                        * 599C6

* refs (3): 86A6F 86AB5 86AF6
{RULES\A->}:
        {                                        * 599CB

_A->_:
          $ "A→"                                 * 599D0
          {                                      * 599DE
            :: OBJ_69CAC MetaA-> ; DoBadKey      * 599E3
            :: OBJ_69CAC MetaA->all ; }          * 599FC
        }                                        * 59A15

* refs (3): 86A42 86A88 86B50
{RULES\<-T}:
        {                                        * 59A1A

_<-T_:
          $ "←T"                                 * 59A1F
          {                                      * 59A2D
            :: OBJ_69CAC Meta<-T ; DoBadKey      * 59A32
            :: OBJ_69CAC Meta<-Tall ; }          * 59A4B
        }                                        * 59A64

* refs (3): 86A47 86A8D 86B55
{RULES\T->}:
        {                                        * 59A69

_T->_:
          $ "T→"                                 * 59A6E
          {                                      * 59A7C
            :: OBJ_69CAC MetaT-> ; DoBadKey      * 59A81
            :: OBJ_69CAC MetaT->all ; }          * 59A9A
        }                                        * 59AB3

* refs (2): 86A60 86AA6
{RULES\(<-}:
        {                                        * 59AB8

_(<-_:
          $ "(←"                                 * 59ABD
          {                                      * 59ACB
            :: OBJ_69CAC Meta(<- ; DoBadKey      * 59AD0
            :: OBJ_69CAC Meta(<-all ; }          * 59AE9
        }                                        * 59B02

* refs (2): 86A65 86AAB
{RULES\->)}:
        {                                        * 59B07

_->)_:
          $ "→)"                                 * 59B0C
          {                                      * 59B1A
            :: OBJ_69CAC Meta->) ; DoBadKey      * 59B1F
            :: OBJ_69CAC Meta->)all ; }          * 59B38
        }                                        * 59B51

* refs (2): 86A74 86ABF
{RULES\(())}:
        {                                        * 59B56

_(())_:
          $ "(())"                               * 59B5B
          :: OBJ_69CAC Meta(()) ; }              * 59B6D

* refs (1): 86A56
{RULES\AF}:
        {                                        * 59B86

_AF_:
          $ "AF"                                 * 59B8B
          :: OBJ_69C64 MetaAF ; }                * 59B99

* refs (2): 86A4C 86A92
{RULES\<-M}:
        {                                        * 59BB2

_<-M_:
          $ "←M"                                 * 59BB7
          {                                      * 59BC5
            :: OBJ_69C64 Meta<-M ; DoBadKey      * 59BCA
            :: OBJ_69CAC Meta<-Mall ; }          * 59BE3
        }                                        * 59BFC

* refs (2): 86A51 86A97
{RULES\M->}:
        {                                        * 59C01

_M->_:
          $ "M→"                                 * 59C06
          {                                      * 59C14
            :: OBJ_69C64 MetaM-> ; DoBadKey      * 59C19
            :: OBJ_69CAC MetaM->all ; }          * 59C32
        }                                        * 59C4B

* refs (3): 86A79 86AC4 86B23
{RULES\-()}:
        {                                        * 59C50

_-()_:
          $ "-()"                                * 59C55
          :: OBJ_69C64 Meta-() ; }               * 59C65

* refs (3): 86AC9 86ADD 86B05
{RULES\1/()}:
        {                                        * 59C7E

_1/()_:
          $ "1/()"                               * 59C83
          :: OBJ_69C64 Meta1/() ; }              * 59C95

* refs (1): 86AE2
{RULES\E()}:
        {                                        * 59CAE

_E()_:
          $ "E()"                                * 59CB3
          :: OBJ_69C64 MetaE() ; }               * 59CC3

* refs (1): 86ACE
{RULES\L()}:
        {                                        * 59CDC

_L()_:
          $ "L()"                                * 59CE1
          :: OBJ_69C64 MetaL() ; }               * 59CF1

* refs (1): 86B28
{RULES\L*}:
        {                                        * 59D0A

_L*_:
          $ "L*"                                 * 59D0F
          :: OBJ_69C64 MetaL* ; }                * 59D1D

* refs (1): 86B0A
{RULES\E^}:
        {                                        * 59D36

_E^_:
          $ "E^"                                 * 59D3B
          :: OBJ_69C64 MetaE^ ; }                * 59D49

* refs (1): 86B41
{RULES\->()}:
        {                                        * 59D62

_->()_:
          $ "→()"                                * 59D67
          {                                      * 59D77
            :: OBJ_69C64 Meta->() ; DoBadKey     * 59D7C
            :: OBJ_69CAC Meta->()all ; }         * 59D95
        }                                        * 59DAE

* refs (2): 86A9C 86AE7
{RULES\<-D}:
        {                                        * 59DB3

_<-D_:
          $ "←D"                                 * 59DB8
          {                                      * 59DC6
            :: OBJ_69C64 Meta<-D ; DoBadKey      * 59DCB
            :: OBJ_69CAC <-D[_]! ; }             * 59DE4
        }                                        * 59DFD

* refs (4): 86AA1 86AEC 86B14 86B32
{RULES\D->}:
        {                                        * 59E02

_D->_:
          $ "D→"                                 * 59E07
          {                                      * 59E15
            :: OBJ_69C64 MetaD-> ; DoBadKey      * 59E1A
            :: OBJ_69CAC MetaD->all ; }          * 59E33
        }                                        * 59E4C

* refs (1): 86B0F
{RULES\->TRG}:
        {                                        * 59E51

_->TRG_:
          $ "→TRG"                               * 59E56
          :: OBJ_69C64 Meta->TRG ; }             * 59E68

* refs (1): 86B64
{RULES\->()}_59E81:
        {                                        * 59E81

_->()__59E86:
          $ "→()"                                * 59E86
          {                                      * 59E96
            :: OBJ_69C64 Meta->()C% ; DoBadKey   * 59E9B
            :: OBJ_69CAC Meta->()C%all ; }       * 59EB4
        }                                        * 59ECD

* refs (2): 86B73 86B87
{RULES\->DEF}:
        {                                        * 59ED2

_->DEF:
          $ "→DEF"                               * 59ED7
          :: OBJ_69C64 Meta->DEF ; }             * 59EE9

* refs (1): 86B78
{RULES\TRG*}:
        {                                        * 59F02

_TRG*_:
          $ "TRG*"                               * 59F07
          :: OBJ_69C64 MetaTRG* ; }              * 59F19

* refs (7): 596D8 59722 59770 597BA 59840 5988A ...
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
