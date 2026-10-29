* HP 48GX ROM revision R, #73088-#740E0: Library table, access pointers, bank switching
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ZOOM Y: X: TRACE MsgTab(0) FCN EDIT_73456 (X,Y) (AN(L 'EnvOK
* Follows on from the previous file (at #73088 in the original ROM).

* refs (1): 7305B
OBJ_73088:
        CON(5)  (*)+5                            * 73088  primitive code object
        A=0     W                                * 7308D
        C=0     W                                * 73090
        C=B     A                                * 73093
        CD0EX                                    * 73095
        RSTK=C                                   * 73098
        D0=D0-  10                               * 7309A
        C=DAT0  A                                * 7309D
        CD0EX                                    * 730A0
        A=DAT0  15                               * 730A3
        D0=C                                     * 730A7
        LC(5)   xi                               * 730AA
        ?C=A    A                                * 730B1
        GOYES   L_730BD                          * 730B4
        GOVLNG  L_29AA8                          * 730B6
L_730BD:
        C=RSTK                                   * 730BD
        CD0EX                                    * 730BF
        R0=C.F  A                                * 730C2
        P=      10                               * 730C8
        LC(5)   x+                               * 730CA
        P=      5                                * 730D1
        LC(5)   x*                               * 730D3
        P=      0                                * 730DA
        LC(5)   xi                               * 730DC
        A=A-C   W                                * 730E3
        LC(5)   nextsym'R                        * 730E6
        ?A#0    W                                * 730ED
        GOYES   L_73111                          * 730F0
        A=R0.F  A                                * 730F2
        AD0EX                                    * 730F8
        C=DAT0  A                                * 730FB
        C=C+CON A,15                             * 730FE
        DAT0=C  A                                * 73104
        D0=A                                     * 73107
        LC(5)   OBJ_73117                        * 7310A
L_73111:
        A=C     A                                * 73111
        PC=(A)                                   * 73113
        RPL

* refs (1): 7310A
OBJ_73117:
        :: ' ROMP_002_105 ;                      * 73117

* refs (1): 4B675
draw~2:
        :: BINT1 PTYPE>PINFO ;                   * 7312B

* refs (1): 4B84B
GetRes~1:
        :: BINT9 PTYPE>PINFO ;                   * 7313F

* refs (2): 4B68E 4B9B3
OBJ_73153:
        :: BINT2 PTYPE>PINFO DROP ;              * 73153

* refs (1): 4C0F8
OBJ_7316C:
        :: BINT11 PTYPE>PINFO NOTcaseFALSE ;     * 7316C

* refs (1): 4C2E2
OBJ_73185:
        :: BINT4 PTYPE>PINFO NOTcaseFALSE ;      * 73185

        :: BINT6 PTYPE>PINFO NOTcaseFALSE ;      * 7319E

* refs (1): 4D286
OBJ_731B7:
        :: BINT5 PTYPE>PINFO NOTcaseFALSE DUPNULLCOMP? * 731B7
          casedrpfls TRUE                        * 731D0
        ;                                        * 731DA

* refs (1): 7000C
OBJ_731DF:
        :: BINT12 PTYPE>PINFO NOTcaseFALSE ;     * 731DF

* refs (1): 4D2DB
OBJ_731F8:
        :: BINT13 PTYPE>PINFO ?SEMI              * 731F8
          '                                      * 7320C

* refs (9): 8C902 8C9D2 8CB16 8CC54 8CD29 8CE0D ...
OBJ_73211:
          :: OBJ_73230 ROMPTR 0F1 03E ; ;        * 73211

* refs (8): 45C3F 45C62 570EA 5710D 57130 57153 ...
OBJ_73230:
        ::                                       * 73230

'EnvOK:
          LAM 'EnvOK COLA NOTcase                * 73235
        ;                                        * 73252

* refs (1): 4D91B
OBJ_73257:
        :: BINT14 PTYPE>PINFO ?SEMI              * 73257
          '                                      * 7326B

* refs (9): 8C907 8C9D7 8CB1B 8CC59 8CD2E 8CE12 ...
OBJ_73270:
          :: GraphicExit DUP NOT?SEMI            * 73270
            ROMPTR 0F1 040 ;                     * 73284
        ;                                        * 73294

* refs (1): 4D925
OBJ_73299:
        :: BINT15 PTYPE>PINFO ?SEMI              * 73299
          ' ROMPTR 0F1 03F ;                     * 732AD

* refs (1): 4D295
OBJ_732C2:
        :: BINT16 PTYPE>PINFO ?SEMI              * 732C2
          ' OBJ_73594 ;                          * 732D6

* refs (1): 8C917
OBJ_732E5:
        :: NoExitAction                          * 732E5
          {                                      * 732EF

* refs (3): 73535 7356C 735A3
OBJ_732F4:
            {                                    * 732F4
              :: TakeOver OBJ_4EE42 NOTcase NULL$ * 732F9
                PTR DirLabel:                    * 73312

ZOOM:
                $ "ZOOM" ;                       * 73317
              :: CHECKMENU OBJ_4EE42 NOTcase DoBadKey * 7332E
                ' OBJ_47D93 InitMenu DispMenu ;  * 73347
            }                                    * 73360

* refs (4): 7353A 73571 735A8 8C54F
OBJ_73365:
            {                                    * 73365

(X,Y):
              $ "(X,Y)" OBJ_73B20 }              * 7336A

* refs (2): 7353F 8C554
OBJ_73388:
            {                                    * 73388
              :: TakeOver OBJ_4EE42 NOTcase NULL$ * 7338D
                PTR Box/StdLbl:                  * 733A6

TRACE:
                $ "TRACE" OBJ_73602 ;            * 733AB
              OBJ_73792 }                        * 733C9
            {                                    * 733D3
              :: TakeOver OBJ_4EE42 NOTcase NULL$ * 733D8
                PTR DirLabel:                    * 733F1

FCN:
                $ "FCN" ;                        * 733F6
              :: CHECKMENU OBJ_4EE42 NOTcase DoBadKey * 7340B
                ' PlotScr*en InitMenu OBJ_4EE60 DispMenu ; * 73424
            }                                    * 73442

* refs (4): 73549 73580 735B7 8C55E
OBJ_73447:
            {                                    * 73447
              :: PTR DirLabel:                   * 7344C

EDIT_73456:
                $ "EDIT" ;                       * 73456
              :: CHECKMENU ' OBJ_46A40 InitMenu DispMenu ; } * 7346D

* refs (4): 7354E 73585 735BC 8C563
OBJ_73495:
            {                                    * 73495

(AN(L:
              $ "(AN(L"                          * 7349A
              :: CHECKMENU OBJ_4DA8F ; }         * 734AE
          }                                      * 734C7
        ;                                        * 734CC

* refs (1): 7357B
OBJ_734D1:
        {                                        * 734D1
          :: TakeOver OBJ_0C77B ;                * 734D6
          :: CHECKMENU OBJ_0C7A8 ; }             * 734EA

* refs (6): 73544 73576 735AD 735B2 8C54A 8C559
OBJ_73503:
        { NULL$                                  * 73503
          :: CHECKMENU DoBadKey ; }              * 7350D

* refs (2): 8CB2B 8CC69
OBJ_73526:
        :: NoExitAction                          * 73526
          { OBJ_732F4 OBJ_73365 OBJ_73388 OBJ_73503 OBJ_73447 OBJ_73495 } ; * 73530

* refs (1): 8CE22
OBJ_7355D:
        :: NoExitAction                          * 7355D
          { OBJ_732F4 OBJ_73365 OBJ_73503 OBJ_734D1 OBJ_73447 OBJ_73495 } ; * 73567

* refs (7): 57194 732DB 8C9E7 8CD3E 8CF10 8CFE0 ...
OBJ_73594:
        :: NoExitAction                          * 73594
          { OBJ_732F4 OBJ_73365 OBJ_73503 OBJ_73503 OBJ_73447 OBJ_73495 } ; * 7359E

* refs (5): 46E05 46E1E 47272 4D3A8 4D6C3
OBJ_735CB:
        :: OBJ_456E5 BINT2 NTHCOMPDROP EVAL OBJ_73742 ; * 735CB

* refs (9): 4D349 4D3BC 4D475 4D4E3 4D574 4D5D3 ...
OBJ_735EE:
        :: 3GETLAM #3= ;                         * 735EE

* refs (20): 47071 4720E 4723B 47290 4887D 4D33F ...
OBJ_73602:
        :: 3GETLAM BINT4 #= ;                    * 73602

* refs (4): 4D3DF 4D506 4D5F6 4D6FA
OBJ_7361B:
        :: 3GETLAM #0= ;                         * 7361B

* refs (2): 3E8AC 4DE2C
OBJ_7362F:
        :: 3GETLAM #2= ;                         * 7362F

* refs (2): 47044 4DE72
OBJ_73643:
        :: 3GETLAM #1= ;                         * 73643

* refs (2): 46CB1 47030
OBJ_73657:
        :: 3GETLAM DUP #1= SWAP #2= OR NOT ;     * 73657

* refs (4): 0C901 4D259 4DE36 4DE7C
OBJ_73684:
        :: BINT0 3PUTLAM ;                       * 73684

* refs (1): 737C4
OBJ_73698:
        :: BINT4 3PUTLAM ;                       * 73698

* refs (1): 4D4D4
OBJ_736AC:
        :: TakeOver OBJ_46DF6 BINT16 REPKEY? NOT?SEMI * 736AC
          BEGIN BINT16 REPKEY? WHILE             * 736CA
          :: OBJ_46DF6 ; REPEAT ;                * 736DE

* refs (1): 4D5C4
OBJ_736F7:
        :: TakeOver OBJ_46E0F BINT18 REPKEY? NOT?SEMI * 736F7
          BEGIN BINT18 REPKEY? WHILE             * 73715
          :: OBJ_46E0F ; REPEAT ;                * 73729

* refs (1): 735E4
OBJ_73742:
        :: OBJ_7376A IT                          * 73742
          :: OBJ_47209 OBJ_47236 ;               * 73751
        ;                                        * 73765

* refs (1): 73747
OBJ_7376A:
        :: 16GETLAM DUP #1= SWAP #3= OR ;        * 7376A

* refs (1): 733C9
OBJ_73792:
        :: CHECKMENU OBJ_73602 case OBJ_4EE60    * 73792
          BINT27 GETLAM OBJ_737D3 NOTcase DoBadKey * 737AB
          OBJ_73698 DispMenu.1 ;                 * 737C4

* refs (3): 737B5 73986 739D1
OBJ_737D3:
        :: OBJ_456E5 BINT3 NTHCOMPDROP EVAL ;    * 737D3

* refs (3): 8C83F 8CA3E 8CB82
OBJ_737F1:
        :: DUP OBJ_73846 NOTcasedrop FALSE       * 737F1
          SWAP OBJ_496F0 BINT24 PUTLAM OBJ_456E5 BINT4 NTHCOMPDROP BINT26 * 7380A
          PUTLAM OBJ_47268 TRUE ;                * 73832

* refs (1): 737FB
OBJ_73846:
        :: OBJ_4BF71 case                        * 73846
          :: BINT1 GetEqN NOTcasedrop FALSE      * 73855
            SWAP #1= ITE OBJ_4B62F OBJ_4B733     * 7386E
            TRUE ;                               * 73887
          GetEqN NOTcaseFALSE OBJ_49B7D          * 73891
          TRUE ;                                 * 738A0

        :: TakeOver OBJ_470B7 OBJ_5102B IT       * 738AA
          :: OBJ_47209 OBJ_47236 ;               * 738C3
          BINT18 REPKEY? NOT?SEMI                * 738D7
          OBJ_5102B NOTcase                      * 738E6
          :: BEGIN BINT18 REPKEY? WHILE          * 738F0
            :: OBJ_470B7 ; REPEAT ;              * 73909
          BEGIN BINT18 REPKEY? WHILE             * 73922
          ::                                     * 73936
            :: OBJ_470B7 OBJ_47209 ; ;           * 7393B
          REPEAT ;                               * 73954

* refs (3): 0C631 0C6CC 73BFE
OBJ_7395E:
        :: TakeOver OBJ_49158 OBJ_46905 OVER #>ITE #1+ DROPONE OBJ_737D3 * 7395E
          NOTcase DoBadKey                       * 7398B
        ;                                        * 73995

* refs (3): 0C640 0C6DB 73C0D
OBJ_7399A:
        :: TakeOver OBJ_49158 BINT1 OVER #<ITE #1- * 7399A
          :: DROP OBJ_46905 ; OBJ_737D3 NOTcase DoBadKey * 739BD
        ;                                        * 739E0

* refs (2): 73A3A 73A94
OBJ_739E5:
        :: OBJ_73602 ITE                         * 739E5
          :: BINT25 GETLAM ;                     * 739F4
          :: 5GETLAM 7GETLAM UNCOERCE%% %%- 9GETLAM %%/>% ; * 73A08
        ;                                        * 73A30

* refs (1): 8CB91
OBJ_73A35:
        :: OBJ_739E5 # 52 SWAP BINT20 OBJ_4686A HARDBUFF2 BINT47 BINT2 * 73A35
          BINT131 BINT7 GROB!ZERODRP HARDBUFF2 BINT47 BINT2 GROB! ; * 73A67

* refs (3): 47245 8C84E 8CA4D
OBJ_73A8F:
        :: OBJ_739E5 BINT54 SWAP BINT13 OBJ_4686A HARDBUFF2 # 49 BINT2 * 73A8F
          BINT131 BINT7 GROB!ZERODRP HARDBUFF2 # 49 BINT2 GROB! ; * 73AC1

* refs (2): 46B31 4D8C1
OBJ_73AEE:
        :: TakeOver OBJ_4EC12 CK0NOLASTWD Π'SAVEDDEPTH #1+ ' Π'SAVEDDEPTH * 73AEE
          STO ;                                  * 73B16

* refs (2): 4D8EE 7337E
OBJ_73B20:
        :: TakeOver MENUOFF? IT CHECKMENU        * 73B20
          16GETLAM #3= ITE                       * 73B39
          :: BINT1 16PUTLAM ; CHECKMENU          * 73B48

* refs (1): 47281
OBJ_73B61:
          :: CLEARMENU OBJ_73602 case OBJ_4EEA1  * 73B61
            BINT1 16PUTLAM                       * 73B7A

Y::
            $ "Y: "                              * 73B84

X::
            $ "X: " $>grob HARDBUFF2 BINT0 BINT2 GROB! $>grob HARDBUFF2 # 41 * 73B94
            BINT2 GROB! OBJ_47209 OBJ_47236 ;    * 73BD1
        ;                                        * 73BEA

* refs (1): 8C83A
OBJ_73BEF:
        :: BINT3 EQcasedrop OBJ_7395E            * 73BEF
          BINT4 EQcasedrop OBJ_7399A             * 73C03

* refs (1): 4633E
OBJ_73C12:
          :: 15GETLAM 8GETLAM DUP 4PICK DUP#0=ITE 2DROP * 73C12
            :: #1= ITE                           * 73C35
              :: RIGHTCOL #< IT #1+              * 73C44
              ;                                  * 73C5D
              :: LEFTCOL #> IT #1-               * 73C62
              ;                                  * 73C7B
            ;                                    * 73C80
            OBJ_4782B ROT BINT0 #=casedrop       * 73C85
            :: OBJ_73CF8 OBJ_73D6B CROSS_HAIRS ; * 73C99
            #1=case                              * 73CB2
            :: OBJ_73CF8 OBJ_73D6B 8GETLAM DUP RIGHTCOL #< IT #1+ * 73CB7
              TOTEMPOB 8PUTLAM CROSS_HAIRS ;     * 73CE4

* refs (2): 73C9E 73CBC
OBJ_73CF8:
            :: OBJ_46955 NOTcase OBJ_46C1B       * 73CF8
              DUPTYPEREAL? NOTcasedrop OBJ_46C1B * 73D0C
              DUP OBJ_468F1 OBJ_46D24 ;          * 73D1B
            OBJ_73D6B 8GETLAM DUP LEFTCOL #> IT #1- * 73D2F
            TOTEMPOB 8PUTLAM CROSS_HAIRS ;       * 73D52
        ;                                        * 73D66

* refs (3): 73CA3 73CC1 73D2F
OBJ_73D6B:
        :: TOTEMPOB CROSS_OFF 7PUTLAM ;          * 73D6B

* refs (1): 8CB8C
OBJ_73D84:
        :: OBJ_73602 ITE 15GETLAM OBJ_73DFC      * 73D84
          BINT38 SWAP BINT9 OBJ_4686A HARDBUFF2 BINT8 BINT2 BINT47 BINT7 * 73D9D
          GROB!ZERODRP HARDBUFF2 BINT8 BINT2 GROB! ; * 73DCA

* refs (3): 47218 8C849 8CA48
OBJ_73DE8:
        :: OBJ_73602 ITE 15GETLAM                * 73DE8

* refs (3): 47821 48CC4 73D98
OBJ_73DFC:
          :: 8GETLAM OBJ_4782B ;                 * 73DFC
          BINT54 SWAP BINT13 OBJ_4686A HARDBUFF2 BINT8 BINT2 # 41 BINT7 * 73E10
          GROB!ZERODRP HARDBUFF2 BINT8 BINT2 GROB! ; * 73E42

MsgTab(0):
        CON(5)  DOARRY                           * 73E60  array 16
        LENGTH                                   * 73E65  length, to #740E1
        CON(5)  DOCSTR                           * 73E6A  element type
        CON(5)  1                                * 73E6F  dimensions
        CON(5)  16                               * 73E74
L_73E79:
        $BODY   "Insufficient Memory"            * 73E79  1
        $BODY   "Directory Recursion"            * 73EA4  2
        $BODY   "Undefined Local Name"           * 73ECF  3
        $BODY   "Undefined XLIB Name"            * 73EFC  4
        $BODY   "Memory Clear"                   * 73F27  5
        $BODY   "Power Lost"                     * 73F44  6
        $BODY   "Warning:"                       * 73F5D  7
        $BODY   "Invalid Card Data"              * 73F72  8
        $BODY   "Object In Use"                  * 73F99  9
        $BODY   "Port Not Available"             * 73FB8  10
        $BODY   "No Room in Port"                * 73FE1  11
        $BODY   "Object Not in Port"             * 74004  12
        $BODY   "Recovering Memory"              * 7402D  13
        $BODY   "Try To Recover Memory?"         * 74054  14
        $BODY   "Replace RAM, Press ON"          * 74085  15
        $BODY   "No Mem To Config All"           * 740B4  16
