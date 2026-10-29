* HP 48GX ROM revision R, #0E006-#10028: Unit objects and conversion
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: tok_m tok_s UM>U ALARMS@ UMCONV U>NCQ tok_g 4dropn;IU! val(2uo) HBUFF_X_Y UMU> UM*
* Follows on from the previous file (at #0E006 in the original ROM).
        RPL

* refs (1): 0DD08
DispTstr(b):
        :: tstr(b) $>GROB HBUFF_X_Y #8+ GROB! ;  * 0E006

* $ ->
* refs (1): 0DD0D
DISPROW1*!:
        :: COERCE$22 $>GROB HBUFF_X_Y GROB! ;    * 0E029

* -> grob
* refs (4): 0DCEA 12B8A 38930 46A04
Save16:
        :: TOP16 SUBGROB ;                       * 0E047

* grob ->
* refs (4): 0DD3F 12BAD 38944 46A36
Restore16:
        :: HBUFF_X_Y GROB! ;                     * 0E05B

* ->
* refs (2): 0DCEF 9DE11
Clr16:
        :: TOP16 GROB!ZERODRP ;                  * 0E06F

* ->
* refs (1): 12739
Clr8:
        :: TOP8 GROB!ZERODRP ;                   * 0E083

* ->
* refs (1): 12761
Clr8-15:
        :: Rows8-15 GROB!ZERODRP ;               * 0E097

* -> HBgrob #x1 #y1 #x1+131 #y1+16
* refs (2): 0E04C 0E074
TOP16:
        :: HBUFF_X_Y 2DUP BINT16 #+SWAP BINT131 #+SWAP ; * 0E0AB

* -> HBgrob #x1 #y #x1+131 #y1+8
* refs (1): 0E088
TOP8:
        :: HBUFF_X_Y 2DUP BINT8 #+SWAP BINT131 #+SWAP ; * 0E0D3

* -> HBgrob #x1 #y1+8 #x1+131 #y1+16
* refs (1): 0E09C
Rows8-15:
        :: HBUFF_X_Y #8+ 2DUP BINT8 #+SWAP BINT131 #+SWAP ; * 0E0FB

* -> HBgrob #x #y
* refs (8): 0E015 0E038 0E060 0E0B0 0E0D8 0E100 ...
HBUFF_X_Y:
        :: HARDBUFF WINDOWCORNER SWAP ;          * 0E128

* refs (1): 38971
ExecAlarm(r):
        :: DUP RCLALARM% BINT3 NTHCOMPDROP EVAL ; * 0E141

* refs (8): 0CD35 0CD49 0CD5D 0DCCC 0DD94 0DE4D ...
OBJ_0E164:
        :: OBJ_0E17D OBJ_0E19B OBJ_0E1B9 ;       * 0E164

* refs (1): 0E169
OBJ_0E17D:
        :: ALARMS@ NextAlarm(li)? case DROP      * 0E17D
        ;                                        * 0E196

* refs (1): 0E16E
OBJ_0E19B:
        :: ALARMS@ OldestPastDue(li)? case DROP  * 0E19B
        ;                                        * 0E1B4

* refs (1): 0E173
OBJ_0E1B9:
        CON(5)  (*)+5                            * 0E1B9  primitive code object
        ASSEMBLE
        GOSUB   SAVPTR~jump_5                    * 0E1BE
        ST=0    15                               * 0E1C2
        GOSBVL  SUB_00672                        * 0E1C5
        GOSUB   AllowIntr~jump                   * 0E1CC
        P=      0                                * 0E1D0
        SETHEX                                   * 0E1D2
        GOTO    L_0E370                          * 0E1D4
        RPL

* {} -> {}'
* refs (2): 0E3F8 B7AEE
ALRMLS>:
        :: INCOMPDROP SWAPDUP Ticks>Date SWAPDUP Ticks>TOD SWAP Ticks>Rpt * 0E1D8
          4ROLL SWAP BINT4 {}N ;                 * 0E200

* refs (2): 0CB39 0DEE8
OBJ_0E219:
        CON(5)  (*)+5                            * 0E219  primitive code object
        ASSEMBLE
        LC(5)   ALARMS                           * 0E21E
        CD0EX                                    * 0E225
        A=DAT1  A                                * 0E228
        DAT0=A  A                                * 0E22B
        D0=C                                     * 0E22E
        GOTO    L_0DF5C                          * 0E231

* -> {}
* refs (15): 0CB5C 0DC40 0DDC6 0E182 0E1A0 0E407 ...
ALARMS@:
        CON(5)  (*)+5                            * 0E235  primitive code object
        LC(5)   ALARMS                           * 0E23A
        GOVLNG  L_12671                          * 0E241

* refs (2): 0DDE9 0DE9D
OBJ_0E248:
        CON(5)  (*)+5                            * 0E248  primitive code object
        CD0EX                                    * 0E24D
        A=DAT1  A                                * 0E250
        D0=A                                     * 0E253
        D0=D0+  5                                * 0E256
        A=DAT0  A                                * 0E259
        D0=(5)  ALARM#                           * 0E25C
        DAT0=A  A                                * 0E263
        D0=C                                     * 0E266
        GOTO    L_0DF5C                          * 0E269

* refs (4): 0DCBD 0DD58 0DE16 0DE70
OBJ_0E26D:
        CON(5)  (*)+5                            * 0E26D  primitive code object
        LC(5)   ALARM#                           * 0E272
        GOTO    L_0E289                          * 0E279

* refs (2): 0DDE4 0EB09
IndexPastDue(li):
        CON(5)  (*)+5                            * 0E27D  primitive code object
        LC(5)   PASTDUE#                         * 0E282
L_0E289:
        RSTK=C                                   * 0E289
        GOSUB   SAVPTR~jump_5                    * 0E28B
        C=RSTK                                   * 0E28F
        D0=C                                     * 0E291
        A=DAT0  A                                * 0E294
        R0=A                                     * 0E297
        GOVLNG  PUSH#LOOP                        * 0E29A

* refs (1): 0DFA2
OBJ_0E2A1:
        CON(5)  (*)+5                            * 0E2A1  primitive code object
        AD1EX                                    * 0E2A6
        GOSBVL  L_0D7EF                          * 0E2A9
        D1=A                                     * 0E2B0
        GOC     L_0E2FB                          * 0E2B3
        GONC    L_0E2F4                          * 0E2B6

* refs (1): 0DFF2
OBJ_0E2B9:
        CON(5)  (*)+5                            * 0E2B9  primitive code object
        AD1EX                                    * 0E2BE
        GOSBVL  SUB_0D7D5                        * 0E2C1
        D1=A                                     * 0E2C8
        GOC     L_0E2FB                          * 0E2CB
        GONC    L_0E2F4                          * 0E2CE

* refs (2): 0DF93 0DFDE
OBJ_0E2D1:
        CON(5)  (*)+5                            * 0E2D1  primitive code object
        A=DAT1  A                                * 0E2D6
        LC(5)   #0001C                           * 0E2D9
        C=C+A   A                                * 0E2E0
        CD1EX                                    * 0E2E2
        A=0     W                                * 0E2E5
        A=DAT1  10                               * 0E2E8
        D1=C                                     * 0E2EC
        ?A#0    W                                * 0E2EF
        GOYES   L_0E2FB                          * 0E2F2
L_0E2F4:
        GOVLNG  PushFLoop                        * 0E2F4
L_0E2FB:
        GOVLNG  PushTLoop                        * 0E2FB

* refs (1): 0DE8E
OBJ_0E302:
        CON(5)  (*)+5                            * 0E302  primitive code object
        GOSUB   SAVPTR~jump_5                    * 0E307
        C=DAT1  A                                * 0E30B
        D0=C                                     * 0E30E
        D0=D0+  15                               * 0E311
        GOSUB   SUB_0E377                        * 0E314
        A=0     W                                * 0E318
        A=DAT0  13                               * 0E31B
        ?A>B    W                                * 0E31F
        GOYES   L_0E370                          * 0E322
        R0=A                                     * 0E324
        D0=D0+  13                               * 0E327
        A=0     W                                * 0E32A
        A=DAT0  10                               * 0E32D
        R1=A                                     * 0E331
        ?A=0    W                                * 0E334
        GOYES   L_0E370                          * 0E337
        D0=D0-  13                               * 0E339
L_0E33C:
        GOSUB   SUB_0E377                        * 0E33C
        A=R0                                     * 0E340
        C=R1                                     * 0E343
        P=      0                                * 0E346
L_0E348:
        A=A+C   W                                * 0E348
        ?A>B    W                                * 0E34B
        GOYES   L_0E36A                          * 0E34E
        P=P+1                                    * 0E350
        GONC    L_0E348                          * 0E352
L_0E355:
        CSL     W                                * 0E355
        A=A+C   W                                * 0E358
        ?A<=B   W                                * 0E35B
        GOYES   L_0E355                          * 0E35E
        A=A-C   W                                * 0E360
        R0=A                                     * 0E363
        GOTO    L_0E33C                          * 0E366
L_0E36A:
        P=      0                                * 0E36A
        DAT0=A  13                               * 0E36C
L_0E370:
        GOVLNG  GETPTRLOOP                       * 0E370

* refs (2): 0E314 0E33C
SUB_0E377:
        ST=0    15                               * 0E377
        GOSBVL  GetTimChk                        * 0E37A
        B=C     W                                * 0E381
        C=0     W                                * 0E384
        LC(5)   #00052                           * 0E387
        B=B+C   W                                * 0E38E

* refs (1): 0E1CC
AllowIntr~jump:
        GOVLNG  AllowIntr                        * 0E391
        NIBHEX  8D2D760                          * 0E398  ØÒg

* refs (7): 0E1BE 0E28B 0E307 0E3B3 0E635 0E66F ...
SAVPTR~jump_5:
        GOVLNG  SAVPTR                           * 0E39F

pastdue(li)?:
        CON(5)  (*)+5                            * 0E3A6  primitive code object
        A=DAT1  A                                * 0E3AB
        D1=D1+  5                                * 0E3AE
        D=D+1   A                                * 0E3B1
        GOSUB   SAVPTR~jump_5                    * 0E3B3
        LC(5)   #00026                           * 0E3B7
        A=A+C   A                                * 0E3BE
        D0=A                                     * 0E3C0
        LC(1)   #2                               * 0E3C3
        D=C     A                                * 0E3C6
        C=DAT0  1                                * 0E3C8
        ?D=C    P                                * 0E3CC
        GOYES   L_0E3D8                          * 0E3CF
        GOVLNG  GETPTRFALSE                      * 0E3D1
L_0E3D8:
        GOVLNG  GETPTRTRUE                       * 0E3D8
        RPL

* %n -> {}
* refs (2): 0E14B 19937
RCLALARM%:
        :: COERCE RCLALM NOTcase NOALARMERR      * 0E3DF
          ALRMLS> ;                              * 0E3F8

* #n -> {} T -> F
* refs (2): 0E3E9 B7AD5
RCLALM:
        :: ALARMS@ SWAP NTHELCOMP ;              * 0E402

* refs (1): 0DCE0
ALARMxcp~5:
        CON(5)  (*)+5                            * 0E41B  primitive code object
        ASSEMBLE
        AD1EX                                    * 0E420
        GOSBVL  SUB_0D877                        * 0E423
        D1=(5)  SAVECLK                          * 0E42A
        DAT1=C  1                                * 0E431
        D1=A                                     * 0E435
        GOTO    L_0DF5C                          * 0E438

* refs (1): 0DD8A
ALARMxcp~6:
        CON(5)  (*)+5                            * 0E43C  primitive code object
        AD1EX                                    * 0E441
        D1=(5)  SAVECLK                          * 0E444
        C=DAT1  S                                * 0E44B
        GOSBVL  SUB_0D877                        * 0E44F
        DAT1=C  S                                * 0E456
        D1=A                                     * 0E45A
        GOTO    L_0DF5C                          * 0E45D
        RPL

* {} ob #n -> {}'
* refs (1): 0DEC5
INSERTN{}:
        :: ROTDUP LENCOMP ROT                    * 0E461
          {                                      * 0E475

ΠM:
            LAM M                                * 0E47A

ΠM_0E483:
            LAM N }                              * 0E483
          BIND INNERCOMP #1+ROLL                 * 0E491

ΠM_0E4A0:
          LAM M #2+                              * 0E4A0

ΠM_0E4AE:
          LAM N #- UNROLL                        * 0E4AE

ΠM_0E4C1:
          LAM M #1+ {}N ABND ;                   * 0E4C1

* {} #n -> {}'
* refs (4): 0DD5D 0DE1B 0DE75 0E77E
REMOVEN{}:
        :: SWAPINCOMP DUP#2+ ROLLSWAP DUP#2+ ROT#- ROLLDROP #1- {}N ; * 0E4DE

* %time -> %
* refs (1): 1990D
STOALARM%:
        :: VerifyTOD DATE SWAP                   * 0E510

__:
          $ ""                                   * 0E524

%0:
          % 0E0 STOALM ;                         * 0E52E

* {} -> %
* refs (1): 19917
STOALARMLS:
        :: INNERDUP BINT2 #< casedrop SETSIZEERR * 0E54D
          DUP BINT4 #> casedrop SETSIZEERR       * 0E56B
          BINT3 #=casedrop                       * 0E584
          ::                                     * 0E58E

%0_0E593:
            % 0E0 StoAlarms(2r,_,r) ;            * 0E593
          BINT4 #=casedrop StoAlarms(2r,_,r)     * 0E5B2
          DROP                                   * 0E5C1

___0E5C6:
          $ ""                                   * 0E5C6

%0_0E5D0:
          % 0E0 StoAlarms(2r,_,r) ;              * 0E5D0

* refs (4): 0E5A8 0E5BC 0E5E5 B7398
StoAlarms(2r,_,r):
        :: CKREAL Ornd(abs(r)) 4UNROLL 4UNROLL CKREAL VerifyTOD 4UNROLL * 0E5EF
          CKREAL chkdate(r) 4UNROLL STOALM ;     * 0E617

* refs (3): 0E61C 0EB18 0EB45
chkdate(r):
        CON(5)  (*)+5                            * 0E630  primitive code object
        ASSEMBLE
        GOSUB   SAVPTR~jump_5                    * 0E635
        C=DAT1  A                                * 0E639
        D1=C                                     * 0E63C
        D1=D1+  5                                * 0E63F
        A=DAT1  W                                * 0E642
        GOSBVL  CLKUTL1                          * 0E646
        SETDEC                                   * 0E64D
        GOSBVL  SUB_0D36C                        * 0E64F
        GOC     L_0E663                          * 0E656
        GOSBVL  SUB_0DB0B                        * 0E659
        GONC    L_0E6CC                          * 0E660
L_0E663:
        GOVLNG  L_0CBB7                          * 0E663

* %time -> %time
* refs (3): 0E515 0E60D 0EB3B
VerifyTOD:
        CON(5)  (*)+5                            * 0E66A  primitive code object
        GOSUB   SAVPTR~jump_5                    * 0E66F
        C=DAT1  A                                * 0E673
        D1=C                                     * 0E676
        D1=D1+  5                                * 0E679
        A=DAT1  W                                * 0E67C
        SETDEC                                   * 0E680
        GOSBVL  CKTIME                           * 0E682
        GONC    L_0E6CC                          * 0E689
        GOVLNG  ErrTime                          * 0E68C

* refs (1): 0E6E3
Ornd(abs(r))~1:
        CON(5)  (*)+5                            * 0E693  primitive code object
        GOSUB   SAVPTR~jump_5                    * 0E698
        C=DAT1  A                                * 0E69C
        D1=C                                     * 0E69F
        D1=D1+  5                                * 0E6A2
        A=DAT1  W                                * 0E6A5
        ?A=0    W                                * 0E6A9
        GOYES   L_0E6CC                          * 0E6AC
        C=0     W                                * 0E6AE
        SETDEC                                   * 0E6B1
        C=C-1   M                                * 0E6B3
        LC(3)   #011                             * 0E6B6
        GOSBVL  Y<=X                             * 0E6BB
        GOC     L_0E6CC                          * 0E6C2
        GOVLNG  L_0CBD1                          * 0E6C5
L_0E6CC:
        P=      0                                * 0E6CC
        SETHEX                                   * 0E6CE
        GOTO    L_0E370                          * 0E6D0
        RPL

* refs (1): 0E5F9
Ornd(abs(r)):
        :: %ABS %INT Ornd(abs(r))~1 ;            * 0E6D4

* %date %time acti %rep -> %
* refs (2): 0E543 0E626
STOALM:
        :: SWAP 4UNROLL >ALRMLS ALARMS@ TOTEMPSWAP InsAlarm(2li) * 0E6ED
          NewAlarm(li) UNCOERCE OBJ_0172B ;      * 0E710

* %n ->
* refs (2): 19981 B7D2D
DELALARM:
        :: COERCE DUP#0= casedrop DelAlarrm(0)   * 0E724
          DUP ALARMS@ LENCOMP #> case NOALARMERR * 0E73D
          DelAlarrm(s) OBJ_0172B OBJ_0E164 ;     * 0E75B

* refs (1): 0E75B
DelAlarrm(s):
        :: ALARMS@ TOTEMPSWAP REMOVEN{} NewAlarm(li) ; * 0E76F

* refs (2): 0E738 17E25
DelAlarrm(0):
        :: NULL{} TOTEMPOB NewAlarm(li) OBJ_0172B OBJ_0E164 ; * 0E78D

        CON(5)  (*)+5                            * 0E7B0  primitive code object
        ASSEMBLE
        P=      1                                * 0E7B5
        GOTO    L_0E7C2                          * 0E7B7

* refs (2): 0DF89 0DFE8
OBJ_0E7BB:
        CON(5)  (*)+5                            * 0E7BB  primitive code object
        P=      4                                * 0E7C0
L_0E7C2:
        GOSUB   SUB_0E859                        * 0E7C2
        C=C&A   S                                * 0E7C6
        GOTO    L_0E7E1                          * 0E7CA

* refs (1): 048AE
OBJ_0E7CE:
        CON(5)  (*)+5                            * 0E7CE  primitive code object

* refs (1): 0E7CE
addrClkOnNib:
        LC(5)   ClkOnNib                         * 0E7D3
L_0E7DA:
        CD1EX                                    * 0E7DA
        C=DAT1  S                                * 0E7DD
L_0E7E1:
        D1=C                                     * 0E7E1
        ?C=0    S                                * 0E7E4
        GOYES   L_0E7F0                          * 0E7E7
        GOVLNG  PushTLoop                        * 0E7E9
L_0E7F0:
        GOVLNG  PushFLoop                        * 0E7F0

* refs (3): 0DC9A 0DD2B 0DDF3
OBJ_0E7F7:
        CON(5)  (*)+5                            * 0E7F7  primitive code object
        P=      4                                * 0E7FC
        GOTO    L_0E814                          * 0E7FE

* refs (2): 0DC95 0DD12
OBJ_0E802:
        CON(5)  (*)+5                            * 0E802  primitive code object
        P=      2                                * 0E807
        GOTO    L_0E814                          * 0E809

* refs (1): 0DFC5
OBJ_0E80D:
        CON(5)  (*)+5                            * 0E80D  primitive code object
        P=      8                                * 0E812
L_0E814:
        GOSUB   SUB_0E859                        * 0E814
        A=A!C   S                                * 0E818
        GOTO    L_0E848                          * 0E81C

* refs (4): 0DC9F 0DD17 0DDFD 0DE89
OBJ_0E820:
        CON(5)  (*)+5                            * 0E820  primitive code object
        P=      1                                * 0E825
        GOTO    L_0E83D                          * 0E827

* refs (1): 0DE84
OBJ_0E82B:
        CON(5)  (*)+5                            * 0E82B  primitive code object
        P=      4                                * 0E830
        GOTO    L_0E83D                          * 0E832

* refs (3): 0DD30 0DDF8 0DE7F
OBJ_0E836:
        CON(5)  (*)+5                            * 0E836  primitive code object
        P=      2                                * 0E83B
L_0E83D:
        GOSUB   SUB_0E859                        * 0E83D
        C=-C-1  S                                * 0E841
        A=A&C   S                                * 0E844
L_0E848:
        DAT1=A  S                                * 0E848
        D1=C                                     * 0E84C
L_0E84F:
        A=DAT0  A                                * 0E84F
        D0=D0+  5                                * 0E852
        PC=(A)                                   * 0E855

* refs (3): 0E7C2 0E814 0E83D
SUB_0E859:
        A=DAT1  A                                * 0E859
        C=P     15                               * 0E85C
        P=      0                                * 0E860
        LC(5)   #00026                           * 0E862
        C=C+A   A                                * 0E869
        CD1EX                                    * 0E86B
        A=DAT1  S                                * 0E86E
        RTN                                      * 0E872
L_0E874:
        GOVLNG  GETPTRLOOP                       * 0E874

* refs (7): 0EA37 0EC13 0EE1B 0EEB0 0EF25 0EF83 ...
GETPTR~jump_2:
        GOVLNG  GETPTR                           * 0E87B

* refs (5): 0E932 0E9BF 0EC22 0ECA5 0EE10
SAVPTR~jump_6:
        GOVLNG  SAVPTR                           * 0E882

* refs (4): 0ECC2 0ECD8 0ECF3 0ED09
SUB_0E889:
        ?ST=1   5                                * 0E889
        RTNYES                                   * 0E88C
        GOVLNG  RCKBp                            * 0E88E

* refs (5): 0E8E3 0E999 0EA4D 0EAB3 0EC60
SAFESKIPOB~jump:
        GOVLNG  SAFESKIPOB                       * 0E895

* refs (1): 0CB90
SUB_0E89C:
        P=      0                                * 0E89C
        SETHEX                                   * 0E89E
        B=0     A                                * 0E8A0
        D0=(5)  ALARMS                           * 0E8A2
        C=DAT0  A                                * 0E8A9
        D0=C                                     * 0E8AC
        GOSUB   SUB_0E914                        * 0E8AF
        RTNC                                     * 0E8B3
L_0E8B6:
        D0=D0+  5                                * 0E8B6
        GOSUB   SUB_0E8F3                        * 0E8B9
        RTNNC                                    * 0E8BD
        B=B+1   A                                * 0E8C0
        GOSUB   SUB_0E914                        * 0E8C2
        RTNC                                     * 0E8C6
        D0=D0+  5                                * 0E8C9
        GOSUB   SUB_0E8FE                        * 0E8CC
        RTNC                                     * 0E8D0
        D0=D0+  5                                * 0E8D3
        GOSUB   SUB_0E909                        * 0E8D6
        RTNC                                     * 0E8DA
        D0=D0+  16                               * 0E8DD
        D0=D0+  13                               * 0E8E0
        GOSUB   SAFESKIPOB~jump                  * 0E8E3
        RTNC                                     * 0E8E7
        GOSUB   SUB_0E8F3                        * 0E8EA
        GONC    L_0E8B6                          * 0E8EE
        RTNSC                                    * 0E8F1

* refs (8): 013A7 0157D 0E8B9 0E8EA 0E95A 0E9E7 ...
SUB_0E8F3:
        LC(5)   SEMI                             * 0E8F3
        GOTO    L_0E91B                          * 0E8FA

* refs (4): 013BE 0159A 0E8CC 0EC80
SUB_0E8FE:
        LC(5)   DOHSTR                           * 0E8FE
        GOTO    L_0E91B                          * 0E905

* refs (4): 013CB 015A7 0E8D6 0EC8A
SUB_0E909:
        LC(5)   #0001D                           * 0E909
        GOTO    L_0E91B                          * 0E910

* refs (9): 0139A 013B1 01570 0158D 0E8AF 0E8C2 ...
SUB_0E914:
        LC(5)   DOLIST                           * 0E914
L_0E91B:
        A=DAT0  A                                * 0E91B
        ?C#A    A                                * 0E91E
        RTNYES                                   * 0E921
        RTNCC                                    * 0E923

* refs (3): 0DDD5 0E1A5 0EAFA
OldestPastDue(li)?:
        CON(5)  (*)+5                            * 0E925  primitive code object
        A=DAT1  A                                * 0E92A
        D=D+1   A                                * 0E92D
        D1=D1+  5                                * 0E92F
        GOSUB   SAVPTR~jump_6                    * 0E932
        ST=0    15                               * 0E936
        D0=(5)  PASTDUE#                         * 0E939
        C=0     A                                * 0E940
        DAT0=C  A                                * 0E942
        D0=(5)  PASTDUE                          * 0E945
        DAT0=C  1                                * 0E94C
        D0=A                                     * 0E950
        B=0     A                                * 0E953
L_0E955:
        D0=D0+  5                                * 0E955
        B=B+1   A                                * 0E958
        GOSUB   SUB_0E8F3                        * 0E95A
        GONC    L_0E9A4                          * 0E95E
        AD0EX                                    * 0E961
        LC(5)   #00026                           * 0E964
        A=A+C   A                                * 0E96B
        D0=A                                     * 0E96D
        A=DAT0  1                                * 0E970
        LC(1)   #2                               * 0E974
        ?C#A    P                                * 0E977
        GOYES   L_0E996                          * 0E97A
        D1=(5)  PASTDUE                          * 0E97C
        C=0     A                                * 0E983
        C=C-1   A                                * 0E985
        DAT1=C  1                                * 0E987
        D1=(5)  PASTDUE#                         * 0E98B
        GOTO    L_0EA1F                          * 0E992
L_0E996:
        D0=D0+  1                                * 0E996
        GOSUB   SAFESKIPOB~jump                  * 0E999
        GONC    L_0E955                          * 0E99D
        GOTO    L_0EC4E                          * 0E9A0
L_0E9A4:
        GOSBVL  AllowIntr                        * 0E9A4
        GOVLNG  GETPTRFALSE                      * 0E9AB

* refs (2): 0DC4F 0E187
NextAlarm(li)?:
        CON(5)  (*)+5                            * 0E9B2  primitive code object
        A=DAT1  A                                * 0E9B7
        D=D+1   A                                * 0E9BA
        D1=D1+  5                                * 0E9BC
        GOSUB   SAVPTR~jump_6                    * 0E9BF
        ST=0    15                               * 0E9C3
        D0=(5)  ALARM#                           * 0E9C6
        C=0     A                                * 0E9CD
        DAT0=C  A                                * 0E9CF
        D0=(5)  ALARMSDUE                        * 0E9D2
        DAT0=C  1                                * 0E9D9
        D0=A                                     * 0E9DD
        B=0     A                                * 0E9E0
L_0E9E2:
        D0=D0+  5                                * 0E9E2
        B=B+1   A                                * 0E9E5
        GOSUB   SUB_0E8F3                        * 0E9E7
        GONC    L_0E9A4                          * 0E9EB
        AD0EX                                    * 0E9EE
        LC(5)   #00026                           * 0E9F1
        A=A+C   A                                * 0E9F8
        D0=A                                     * 0E9FA
        A=DAT0  1                                * 0E9FD
        LC(1)   #1                               * 0EA01
        ?C#A    P                                * 0EA04
        GOYES   L_0EA4A                          * 0EA07
        D1=(5)  ALARMSDUE                        * 0EA09
        C=0     A                                * 0EA10
        C=C-1   A                                * 0EA12
        DAT1=C  1                                * 0EA14
        D1=(5)  ALARM#                           * 0EA18
L_0EA1F:
        C=B     A                                * 0EA1F
        DAT1=C  A                                * 0EA21
        AD0EX                                    * 0EA24
        LC(5)   #00026                           * 0EA27
        A=A-C   A                                * 0EA2E
        GOSBVL  AllowIntr                        * 0EA30
        GOSUB   GETPTR~jump_2                    * 0EA37
        D1=D1-  5                                * 0EA3B
        D=D-1   A                                * 0EA3E
        DAT1=A  A                                * 0EA40
        GOVLNG  PushTLoop                        * 0EA43
L_0EA4A:
        D0=D0+  1                                * 0EA4A
        GOSUB   SAFESKIPOB~jump                  * 0EA4D
        GONC    L_0E9E2                          * 0EA51
        GOTO    L_0EC4E                          * 0EA54

* refs (1): 0CE89
SUB_0EA58:
        R0=C                                     * 0EA58
        B=C     W                                * 0EA5B
        D0=(5)  ALARMS                           * 0EA5E
        A=DAT0  A                                * 0EA65
        D0=A                                     * 0EA68
        P=      0                                * 0EA6B
        GOSUB   SUB_0E914                        * 0EA6D
        GOC     L_0EABA                          * 0EA71
L_0EA74:
        D0=D0+  5                                * 0EA74
        GOSUB   SUB_0E8F3                        * 0EA77
        RTNNC                                    * 0EA7B
        GOSUB   SUB_0EC76                        * 0EA7E
        A=C     W                                * 0EA82
        GOC     L_0EABA                          * 0EA85
        D0=D0+  13                               * 0EA88
        D0=D0+  10                               * 0EA8B
        C=DAT0  1                                * 0EA8E
        ?A<B    W                                * 0EA92
        GOYES   L_0EA9C                          * 0EA95
        C=0     A                                * 0EA97
        GONC    L_0EAAA                          * 0EA99
L_0EA9C:
        P=C     0                                * 0EA9C
        ?P=     2                                * 0EAA0
        GOYES   L_0EAAE                          * 0EAA3
        CBIT=1  3                                * 0EAA5
L_0EAAA:
        DAT0=C  1                                * 0EAAA
L_0EAAE:
        P=      0                                * 0EAAE
        D0=D0+  1                                * 0EAB0
        GOSUB   SAFESKIPOB~jump                  * 0EAB3
        GONC    L_0EA74                          * 0EAB7
L_0EABA:
        GOTO    L_0EC4E                          * 0EABA
        RPL

* refs (1): 0DEB6
~BINT1;NTHCOMPDROP;FindAlarm(li,b):
        :: BINT1 NTHCOMPDROP FindAlarm(li,b) ;   * 0EABE

* %date -> %
* refs (1): 19957
FINDALARM%:
        :: DUP %0_2A2B4 %= casedrop              * 0EAD7
          :: ALARMS@ OldestPastDue(li)? IT DROP  * 0EAF0
            IndexPastDue(li) UNCOERCE ;          * 0EB09
          chkdate(r) Date>hxs13 FindNext Alarm(s=>r) ; * 0EB18

* {} -> %
* refs (1): 19961
FINDALARMLS:
        :: INCOMPDROP VerifyTOD SWAP chkdate(r) Date>hxs13 SWAP TOD>Ticks * 0EB31
          Date+Time FindNext Alarm(s=>r) ;       * 0EB59

FindAlarm!:
        :: CLKTICKS FindNext ;                   * 0EB6D

* -> hxs
* refs (4): 0EB72 19837 2B062 CE153
CLKTICKS:
        :: ~BINT13;MAKEHXS                       * 0EB81
          CODE                                   * 0EB8B  14 nibbles
            GOSBVL  SavPtrTime*                  * 0EB95
            R0=C                                 * 0EB9C
            GOTO    L_0EEB0                      * 0EB9F
          ENDCODE                                * 0EBA3
        ;                                        * 0EBA3

* refs (2): 0EB27 0EB63
Alarm(s=>r):
        :: DUP ALARMS@ LENCOMP #> casedrop %0_2A2B4 * 0EBA8
          UNCOERCE ;                             * 0EBCB

* refs (3): 0EB22 0EB5E 0EB77
FindNext:
        :: ALARMS@ SWAP FindAlarm(li,b) ;        * 0EBD5

* refs (1): 17E07
alarm<>{}?:
        :: ALARMS@ NULLCOMP? NOT ;               * 0EBEE

* refs (2): 0EACD 0EBE4
FindAlarm(li,b):
        CON(5)  (*)+5                            * 0EC07  primitive code object
        ASSEMBLE
        GOSBVL  SUB_0D90A                        * 0EC0C
        GOSUB   GETPTR~jump_2                    * 0EC13
        C=DAT1  A                                * 0EC17
        R1=C                                     * 0EC1A
        D1=D1+  5                                * 0EC1D
        D=D+1   A                                * 0EC20
        GOSUB   SAVPTR~jump_6                    * 0EC22
        C=R0                                     * 0EC26
        D=C     W                                * 0EC29
        C=R1                                     * 0EC2C
        D0=C                                     * 0EC2F
        GOSUB   SUB_0E914                        * 0EC32
        GOC     L_0EC4E                          * 0EC36
        B=0     A                                * 0EC39
L_0EC3B:
        D0=D0+  5                                * 0EC3B
        B=B+1   A                                * 0EC3E
        GOSUB   SUB_0E8F3                        * 0EC40
        GONC    L_0EC6A                          * 0EC44
        GOSUB   SUB_0EC76                        * 0EC47
        GONC    L_0EC55                          * 0EC4B
L_0EC4E:
        GOVLNG  TryToRM?                         * 0EC4E
L_0EC55:
        ?D<=C   W                                * 0EC55
        GOYES   L_0EC6A                          * 0EC58
        D0=D0+  13                               * 0EC5A
        D0=D0+  11                               * 0EC5D
        GOSUB   SAFESKIPOB~jump                  * 0EC60
        GOC     L_0EC4E                          * 0EC64
        GONC    L_0EC3B                          * 0EC67
L_0EC6A:
        C=B     A                                * 0EC6A
        R0=C                                     * 0EC6C
        GOVLNG  PUSH#LOOP                        * 0EC6F

* refs (2): 0EA7E 0EC47
SUB_0EC76:
        GOSUB   SUB_0E914                        * 0EC76
        RTNC                                     * 0EC7A
        D0=D0+  5                                * 0EC7D
        GOSUB   SUB_0E8FE                        * 0EC80
        RTNC                                     * 0EC84
        D0=D0+  5                                * 0EC87
        GOSUB   SUB_0E909                        * 0EC8A
        RTNC                                     * 0EC8E
        D0=D0+  5                                * 0EC91
        C=0     W                                * 0EC94
        C=DAT0  13                               * 0EC97
        RTNCC                                    * 0EC9B

* refs (1): 0DD1C
ALARMxcp~7:
        CON(5)  (*)+5                            * 0EC9D  primitive code object
        ST=0    15                               * 0ECA2
        GOSUB   SAVPTR~jump_6                    * 0ECA5
        GOSBVL  SUB_0D840                        * 0ECA9
        LC(5)   #00199                           * 0ECB0
        GOSUB   SUB_0ED45                        * 0ECB7
        GOC     L_0ED29                          * 0ECBB
        LC(2)   #B9                              * 0ECBE
        GOSUB   SUB_0E889                        * 0ECC2
        LC(5)   #00028                           * 0ECC6
        GOSUB   SUB_0ED45                        * 0ECCD
        GOC     L_0ED29                          * 0ECD1
        LC(2)   #B9                              * 0ECD4
        GOSUB   SUB_0E889                        * 0ECD8
        LC(5)   #01551                           * 0ECDC
        GOSUB   SUB_0ED45                        * 0ECE3
        GOC     L_0ED29                          * 0ECE7
        LC(1)   #9                               * 0ECEA
L_0ECED:
        RSTK=C                                   * 0ECED
        LC(2)   #E0                              * 0ECEF
        GOSUB   SUB_0E889                        * 0ECF3
        LC(5)   #000CB                           * 0ECF7
        GOSUB   SUB_0ED45                        * 0ECFE
        GOC     L_0ED27                          * 0ED02
        LC(2)   #F0                              * 0ED05
        GOSUB   SUB_0E889                        * 0ED09
        LC(5)   #00376                           * 0ED0D
        GOSUB   SUB_0ED45                        * 0ED14
        GOC     L_0ED27                          * 0ED18
        C=RSTK                                   * 0ED1B
        C=C-1   P                                * 0ED1D
        GONC    L_0ECED                          * 0ED20
        GOTO    L_0E9A4                          * 0ED23
L_0ED27:
        C=RSTK                                   * 0ED27
L_0ED29:
        LC(5)   #00028                           * 0ED29
        GOSUB   SUB_0ED45                        * 0ED30
        GOC     L_0ED29                          * 0ED34
        GOSBVL  AllowIntr                        * 0ED37
        GOVLNG  GETPTRTRUE                       * 0ED3E

* refs (6): 0ECB7 0ECCD 0ECE3 0ECFE 0ED14 0ED30
SUB_0ED45:
        B=C     A                                * 0ED45
L_0ED47:
        GOSBVL  BITMAP                           * 0ED47
        ?A#0    W                                * 0ED4E
        GOYES   L_0ED5A                          * 0ED51
        B=B-1   A                                * 0ED53
        GONC    L_0ED47                          * 0ED55
        RTNCC                                    * 0ED58
L_0ED5A:
        C=0     W                                * 0ED5A
        LC(4)   #8001                            * 0ED5D
        ?C#A    W                                * 0ED63
        RTNYES                                   * 0ED66
        LC(1)   #F                               * 0ED68
        D1=(5)  DOUSEALARM                       * 0ED6B
        DAT1=C  1                                * 0ED72
        RTNSC                                    * 0ED76

* refs (2): 0DFCA 421E5
ClrDouseAlm:
        CON(5)  (*)+5                            * 0ED78  primitive code object
        LC(5)   DOUSEALARM                       * 0ED7D
        C=0     S                                * 0ED84
        CD1EX                                    * 0ED87
        DAT1=C  S                                * 0ED8A
        CD1EX                                    * 0ED8E
        GOTO    L_0E84F                          * 0ED91

* refs (1): 0DFB6
OBJ_0ED95:
        CON(5)  (*)+5                            * 0ED95  primitive code object
        LC(5)   DOUSEALARM                       * 0ED9A
        GOTO    L_0E7DA                          * 0EDA1
        RPL

* refs (1): 0EED5
~BINT10;MAKEHXS:
        :: BINT10 MAKEHXS ;                      * 0EDA5

* refs (3): 0EB86 0EE55 0EE88
~BINT13;MAKEHXS:
        :: BINT13 MAKEHXS ;                      * 0EDB9

* refs (1): 0EF68
~BINT24;MAKEHXS:
        :: BINT24 MAKEHXS ;                      * 0EDCD

* #nibs -> hxs
* refs (3): 0EDAF 0EDC3 0EDD7
MAKEHXS:
        :: NULLHXS SWAP EXPAND ;                 * 0EDE1
        ASSEMBLE

* refs (1): 12673
SUB_0EDFA:
        ST=0    10                               * 0EDFA
L_0EDFD:
        D=D-1   A                                * 0EDFD
        D=D+1   A                                * 0EDFF
        RTNNC                                    * 0EE01
        ?ST=0   10                               * 0EE04
        GOYES   L_0EE10                          * 0EE07
        GOVLNG  DOMEMERR                         * 0EE09
L_0EE10:
        GOSUB   SAVPTR~jump_6                    * 0EE10
        GOSBVL  GARBAGECOL                       * 0EE14  inline data follows
        GOSUB   GETPTR~jump_2                    * 0EE1B
        ST=1    10                               * 0EE1F
        GOTO    L_0EDFD                          * 0EE22

* hxs_d hxs_t -> hxs
* refs (2): 0EB59 0EF63
Date+Time:
        CON(5)  (*)+5                            * 0EE26  primitive code object
        GOSBVL  SUB_0D90A                        * 0EE2B
        A=DAT1  A                                * 0EE32
        D1=A                                     * 0EE35
        D1=D1+  10                               * 0EE38
        C=0     W                                * 0EE3B
        C=DAT1  13                               * 0EE3E
        A=R0                                     * 0EE42
        C=C+A   W                                * 0EE45
        DAT1=C  13                               * 0EE48
        GOTO    L_0E874                          * 0EE4C
        RPL

* %date -> hxs
* refs (5): 0D2F5 0EB1D 0EB4A 0EF54 B7185
Date>hxs13:
        :: ~BINT13;MAKEHXS SWAP                  * 0EE50
          CODE                                   * 0EE5F  21 nibbles
            GOSBVL  POPDATE%                     * 0EE69
            GOSBVL  YMD>Ticks                    * 0EE70
            R0=C                                 * 0EE77
            GOTO    L_0EEB0                      * 0EE7A
          ENDCODE                                * 0EE7E
        ;                                        * 0EE7E

* %time -> hxs
* refs (2): 0EB54 0EF5E
TOD>Ticks:
        CON(5)  DOCOL                            * 0EE83  address (the code jumps or points through it)

        CON(5)  ~BINT13;MAKEHXS                  * 0EE88  address (the code jumps or points through it)

        CON(5)  SWAP                             * 0EE8D  address (the code jumps or points through it)

        CON(5)  DOCODE                           * 0EE92  address (the code jumps or points through it)
        NIBHEX  430008F849D01085908D4CBC0        * 0EE97  4.∡↓η..X.ØÄË
        ASSEMBLE
L_0EEB0:
        GOSUB   GETPTR~jump_2                    * 0EEB0
        A=DAT1  A                                * 0EEB4
        AD1EX                                    * 0EEB7
        D1=D1+  10                               * 0EEBA
        C=R0                                     * 0EEBD
        DAT1=C  13                               * 0EEC0
        D1=A                                     * 0EEC4
        GOTO    L_0E84F                          * 0EEC7
        NIBHEX  B2130                            * 0EECB  +1
        RPL

* refs (1): 0EF4A
r=>b10:
        :: ~BINT10;MAKEHXS SWAP                  * 0EED0
          CODE                                   * 0EEDF  87 nibbles
            GOSBVL  POP1%                        * 0EEE9
            GOSBVL  SPLITA                       * 0EEF0
            GOSBVL  CLRFRC                       * 0EEF7
            C=0     W                            * 0EEFE
            R0=C                                 * 0EF01
            C=B     M                            * 0EF04
            ?C=0    W                            * 0EF07
            GOYES   L_0EF21                      * 0EF0A
            CSL     W                            * 0EF0C
L_0EF0F:
            CSLC                                 * 0EF0F
            A=A-1   A                            * 0EF12
            GONC    L_0EF0F                      * 0EF14
            GOSBVL  DCHXW                        * 0EF17
            R0=A                                 * 0EF1E
L_0EF21:
            P=      0                            * 0EF21
            SETHEX                               * 0EF23
            GOSUB   GETPTR~jump_2                * 0EF25
            A=DAT1  A                            * 0EF29
            AD1EX                                * 0EF2C
            D1=D1+  10                           * 0EF2F
            C=R0                                 * 0EF32
            DAT1=C  10                           * 0EF35
            D1=A                                 * 0EF39
            GOTO    L_0E84F                      * 0EF3C
          ENDCODE                                * 0EF40
        ;                                        * 0EF40

* $ %date %time %rpt -> {}
* refs (1): 0E6FC
>ALRMLS:
        :: r=>b10 ROT Date>hxs13 ROT TOD>Ticks Date+Time ~BINT24;MAKEHXS * 0EF45
          3UNROLL                                * 0EF6D
          CODE                                   * 0EF72  99 nibbles
            GOSBVL  SUB_0D90A                    * 0EF7C
            GOSUB   GETPTR~jump_2                * 0EF83
            GOSBVL  >ALRMLS~1                    * 0EF87
            GOSBVL  SUB_012F9                    * 0EF8E
            A=R0                                 * 0EF95
            ST=0    8                            * 0EF98
            P=      12                           * 0EF9B
            ?C<=A   WP                           * 0EF9D
            GOYES   L_0EFA5                      * 0EFA0
            ST=1    8                            * 0EFA2
L_0EFA5:
            P=      0                            * 0EFA5
            GOSUB   GETPTR~jump_2                * 0EFA7
            A=DAT1  A                            * 0EFAB
            AD1EX                                * 0EFAE
            D1=D1+  10                           * 0EFB1
            C=R0                                 * 0EFB4
            DAT1=C  13                           * 0EFB7
            D1=D1+  13                           * 0EFBB
            C=R1                                 * 0EFBE
            DAT1=C  10                           * 0EFC1
            D1=D1+  10                           * 0EFC5
            C=0     A                            * 0EFC8
            ?ST=0   8                            * 0EFCA
            GOYES   L_0EFD2                      * 0EFCD
            LC(1)   #8                           * 0EFCF
L_0EFD2:
            DAT1=C  1                            * 0EFD2
            D1=A                                 * 0EFD6
            GOLONG  L_0E84F                      * 0EFD9
          ENDCODE                                * 0EFDF
          SWAP TWO{}N ;                          * 0EFDF

* 8192
%TICKSsec:
        % 8.192E3                                * 0EFEE

* 491520
%TICKSmin:
        % 4.9152E5                               * 0F003

* 29491200
%HrTicks:
        % 2.94912E7                              * 0F018

* 707788800
%TICKSday:
        % 7.077888E8                             * 0F02D

* 4954521600
%TICKSweek:
        % 4.9545216E9                            * 0F042
        ASSEMBLE
        ?C<=A   A                                * 0F057
* a branch also enters #0F05B, where the nibbles decode as RTNSXM
L_0F05A:
        GOYES   L_0F05A+1                        * 0F05A
* the rest of RTNSXM at #0F05B
* a branch also enters #0F05C, where the nibbles decode as RTNSXM
        NIBHEX  0                                * 0F05C
* the rest of RTNSXM at #0F05C
        NIBHEX  0                                * 0F05D

LIB00B:
        CON(3)  #00B                             * 0F05E  library number
        CON(5)  0                                * 0F061  hash table
        REL(5)  LIB00B.message                   * 0F066  message table
        CON(5)  0                                * 0F06B  link table
        CON(5)  0                                * 0F070  config
        RPL

* refs (2): 289EA 28AD3
st=>uo?:
        :: %1 SWAP dup;stdunit(st)? case makeuo!(r,st) * 0F075
          DUP CAR$ OBJ_0C2CD NOTcase st=>uo?~1   * 0F093
          OVER CDR$ dup;stdunit(st)? NOTcasedrop st=>uo?~1 * 0F0AC
          ROTDROPSWAP st=>uo?~3 SWAP umP BINT4 OBJ_0F124 TRUE ; * 0F0C5

* refs (2): 0F08E 0F11A
makeuo!(r,st):
        :: BINT2 OBJ_0F124 TRUE ;                * 0F0ED

* refs (2): 0F0A7 0F0C0
st=>uo?~1:
        :: DROP st=>uo?~2 case2drpfls makeuo!(r,st) * 0F106
        ;                                        * 0F11F

* refs (2): 0F0DE 0F0F7
OBJ_0F124:
        :: umEND SWAP#1+ PSYMBN                  * 0F124
          CODE                                   * 0F138  29 nibbles
            A=DAT1  A                            * 0F142
            AD1EX                                * 0F145
            LC(5)   DOEXT                        * 0F148
            DAT1=C  A                            * 0F14F
            D1=A                                 * 0F152
            A=DAT0  A                            * 0F155
            D0=D0+  5                            * 0F158
            PC=(A)                               * 0F15B
          ENDCODE                                * 0F15F
        ;                                        * 0F15F

* refs (1): 0F110
st=>uo?~2:
        :: ngsizecase TRUE                       * 0F164
          OBJ_25F4E SWAPONE OVER delimcase drop(1-2,4);true * 0F173
          DROP OBJ_25A93 DROP OBJ_25A93 nultrior * 0F18C
          :: 2DROP SWAPDROPDUP $>ID COMPILEID DROP NOTROMPcase * 0F1A5

<>gn?:
            :: TYPEIDNT? NOT ;                   * 0F1C8
            ROMPTR@ DROP dup;r?:dq/sk DROPFALSE TYPEEXT? NOT ; * 0F1DC

* refs (1): 0F187
drop(1-2,4);true:
          :: 2DROP SWAPDROPTRUE ; ;              * 0F1FF

* u -> $
* refs (2): 41332 5F9F0
UNIT>$:
        :: >R ticR NOT?SEMI                      * 0F218
          DUPTYPEREAL? NOT?GOTO L_0F24A a%>$     * 0F22C
L_0F240:
          ticR NOT?SEMI                          * 0F240
L_0F24A:
          DUPTYPECSTR? ?GOTO L_0F240 DUPTYPECHAR? ?GOTO L_0F240 dup;r?:dq/sk * 0F24A
          :: OBJ_35264 GOTO L_0F240 ; REQcasedrop umP * 0F26D
          :: SWAP >H$ GOTO L_0F240 ; REQcasedrop um* * 0F290
          :: tok* GOTO L_0F321 ; REQcasedrop um/ * 0F2B8
          :: tok/ GOTO L_0F321 ; REQcasedrop um^ * 0F2DB
          :: tok^ GOTO L_0F321 ; DROP tokuscore  * 0F2FE
L_0F321:
          SWAP&$ &$ GOTO L_0F240 ;               * 0F321

* % u -> u'
* refs (16): 0F367 0FE1C 10083 1555E 1975E 48CEC ...
UM>U:
        :: units(uo)=>(_,s) ->unit(_,s) ;        * 0F33A

* u -> % u'
* refs (7): 197CD 1CFC6 567D2 56886 72F8E 9C334 ...
UMU>:
        :: DUP CARCOMP %1 ROT UM>U ;             * 0F34E

* u1 u2 -> u1'
* refs (14): 0F56B 0FA49 196EA 196F4 196FE 5668D ...
UMCONV:
        :: OBJ_0FDE5 ROTDROP 3PICK 5ROLL OBJ_0FDE5 5UNROLL 7UNROLL 7UNROLL * 0F371
          2DROP puretemp? ITE TempConv           * 0F39E
          :: OBJ_0FCA5 %%/ %%* ;                 * 0F3B2
          %%>% Unbr>U ;                          * 0F3CB
        BSS     10                               * 0F3DA

* [] []' -> [] []' flag
* refs (4): 0F3A3 0F6ED CD63A CD695
puretemp?:
        :: DUP puretemp?~1 EQ NOTcaseFALSE 2DUPEQ * 0F3E4
        ;                                        * 0F402

* refs (9): 9362E 94032 95D56 95EC1 9616E 9632B ...
4dropn;IU!:
        :: DUP %%0= ;                            * 0F407

* ???
* refs (2): 0F3AD CD64F
TempConv:
        :: 2DROP 2DUPEQ case2DROP OVER           * 0F41B
          cfC jEQcase TempConv~1                 * 0F434
          OVER cfF jEQcase TempConv~2            * 0F443
          3UNROLL %%* OVER %%/ TempConv~3 %%- SWAPDROP ; * 0F457

* refs (1): 0F43E
TempConv~1:
        :: SWAPDROP cfF EQcase                   * 0F47F
          :: %%/ %%3.2E1 %%+ ;                   * 0F493
          SWAP %%KZERO %%+ SWAP%%/ ;             * 0F4AC

* refs (1): 0F452
TempConv~2:
        :: cfC EQcasedrop                        * 0F4C5
          :: SWAP %%3.2E1 %%- %%* ;              * 0F4D4
          %%/ SWAP %%RZERO %%+ %%* ;             * 0F4F2

* refs (1): 0F46B
TempConv~3:
        :: OVER cfC jEQcase %%KZERO              * 0F510
          OVER cfF jEQcase %%RZERO               * 0F529
          %%0 ;                                  * 0F53D

* refs (2): 0F49D 0F4DE
%%3.2E1:
        %% 3.2E1                                 * 0F547

* refs (8): 0F589 0F59D 0F5B1 0F5C5 0F5D9 0F5ED ...
val(2uo):
        :: DUPUNROT UMCONV U>nbr SWAP U>nbr ;    * 0F561

* u u' -> %flag
* refs (3): 1E9D1 1E9DB 1E9E5
UM=?:
        :: val(2uo) OBJ_1EA30 ;                  * 0F584

* u u' -> %flag
* refs (3): 1EAFC 1EB06 1EB10
UM#?:
        :: val(2uo) OBJ_1EB51 ;                  * 0F598

* u u' -> %flag
* refs (3): 1EC09 1EC13 1EC1D
UM<?:
        :: val(2uo) <(2r) ;                      * 0F5AC

* u u' -> %flag
* refs (6): 1ECA8 1ECB2 1ECBC D1EB4 D1EC3 D1ED2
UM>?:
        :: val(2uo) >(2r) ;                      * 0F5C0

* u u' -> %flag
* refs (3): 1ED47 1ED51 1ED5B
UM<=?:
        :: val(2uo) ó(2r) ;                      * 0F5D4

* u u' -> %flag
* refs (3): 1EDE6 1EDF0 1EDFA
UM>=?:
        :: val(2uo) ò(2r) ;                      * 0F5E8

* u -> u'
* refs (1): 1AA56
UMABS:
        :: dup;uo=>r %ABS Unbr>U ;               * 0F5FC

* u -> u'
* refs (1): 1A9CC
UMCHS:
        :: dup;uo=>r %CHS Unbr>U ;               * 0F615

* u -> u'
* refs (1): 1B4D9
UMSIN:
        ::                                       * 0F62E

* refs (2): 0F665 0F679
OBJ_0F633:
          :: UMSIN~1 'REVAL %%>% ; %%SINDEG ;    * 0F633

* refs (2): 9028A 934A9
OBJ_0F656:
        # 800                                    * 0F656  2048

* u -> u'
* refs (1): 1B532
UMCOS:
        :: OBJ_0F633 %%COSDEG ;                  * 0F660

* u -> u'
* refs (1): 1B58B
UMTAN:
        :: OBJ_0F633 UMTAN~1 ;                   * 0F674

* 2pi
%%2PI:
        %% 6.28318530717959E0                    * 0F688

* u u' -> u''
* refs (3): 1ABBC 1ABC6 1ABD0
UM+:
        :: OBJ_0F6C0 %%+ %%>% Unbr>U ;           * 0F6A2

* refs (4): 0F6A7 0F779 0FC41 0FCD2
OBJ_0F6C0:
        :: OBJ_0FDE5 4PICK 6ROLL OBJ_0FDE5 5UNROLL 7UNROLL 7UNROLL 2DROP * 0F6C0
          puretemp? ITE                          * 0F6ED
          :: 2DROP OBJ_0FC6E 3PICK OBJ_0FC6E SWAPDROP EQ NOTcase * 0F6F7
            CONSTUNITERR                         * 0F71F
          ;                                      * 0F724
          OBJ_0FCA5                              * 0F729
          %%/ %%*SWAP ;                          * 0F72E

* refs (1): 10C31
OBJ_0F73D:
        :: SWAPCKREF SWAP OBJ_7D761 ;            * 0F73D

* refs (2): 10C4F CAC04
OBJ_0F756:
        :: SWAPCKREF SWAP OBJ_7D76D ;            * 0F756
        NIBHEX  00000                            * 0F76F  ..

* u u' -> u''
* refs (3): 1AD9A 1ADA4 1ADAE
UM-:
        :: OBJ_0F6C0 %%- %%>% Unbr>U ;           * 0F774

* u u' -> u''
* refs (7): 0F922 197E6 1AEA7 1AEB1 1AEBB 56895 ...
UM*:
        :: OBJ_0F7B0 %* NOP psh ;                * 0F792

* refs (2): 0F797 0F828
OBJ_0F7B0:
        :: OVER U>nbr OVER U>nbr 'REVAL 3UNROLL units(uo)=>(_,s) OBJ_10100 * 0F7B0
          UobROT units(uo)=>(_,s) OBJ_10100 'REVAL rot OBJ_107E3 psh rot * 0F7DD
          OBJ_107E3 'REVAL OBJ_10194 OBJ_1086F ->unit(_,s) ; * 0F805

* u u' -> u''
* refs (4): 197DC 1AFAA 1AFB4 1AFBE
UM/:
        :: OBJ_0F7B0 %/ psh NOP ;                * 0F823

* u -> u'
* refs (1): 1B2AF
UMINV:
        :: dup;uo=>r %1/ SWAP OBJ_10BAF psh OBJ_10194 OBJ_1086F ->unit(_,s) ; * 0F841

* refs (4): 0F93B 1B096 1B0A0 1B0AA
^(2uo):
        :: OBJ_0FDAE FALSE                       * 0F873

* refs (1): 0F909
UMXROOT~1:
          :: 2NULLLAM{} BIND dup;uo=>r 2GETLAM 1GETLAM ITE %NROOT %^ * 0F882
            SWAP OBJ_10BAF OBJ_10194 OBJ_108F1 psh OBJ_108F1 2GETLAM %0< * 0F8AF
            ?SKIP psh                            * 0F8D7
            OBJ_1086F ->unit(_,s) ABND ;         * 0F8E1
        ;                                        * 0F8F5

* u u' -> u''
* refs (1): 1B247
UMXROOT:
        :: OBJ_0FDAE TRUE UMXROOT~1 ;            * 0F8FA

* u -> u'
* refs (1): 1B45D
UMSQ:
        :: DUP COLA UM*                          * 0F913
        ;                                        * 0F927

* u -> u'
* refs (1): 1B3A1
UMSQRT:
        :: %.5 COLA ^(2uo)                       * 0F92C
        ;                                        * 0F940

* u -> u'
* refs (2): 19780 197E1
UMSI:
        :: UMSI~1 >R DUP U>NCQ %1 BINT1 3UNROLL FALSE 4NULLLAM{} BIND * 0F945
          2DROP00                                * 0F97C
L_0F981:
          ticR NOT?GOTO L_0FA2B 3GETLAM 4GETLAM DUP#1+ 4PUTLAM PULLEL * 0F981
          SWAPDROP DUP 2PUTLAM %0= ?GOTO L_0FA1C units(uo)=>(_,s) OBJ_10100 * 0F9A9
          OBJ_108F1 psh OBJ_108F1 2GETLAM %0< ?SKIP psh * 0F9D1
          rot psh OBJ_107E3 rot rot OBJ_107E3 psh BINT0 * 0F9F4
L_0FA1C:
          DROP GOTO L_0F981                      * 0FA1C
L_0FA2B:
          ABND %1 unrot1 OBJ_10194 OBJ_1086F ->unit(_,s) UMCONV ; * 0FA2B
        NIBHEX  00000                            * 0FA53  ..

* refs (1): 10D7D
1_kg:
        UNIT %1                                  * 0FA58

K__k_:
          CHR "k"                                * 0FA62

* "g"
* refs (10): A172A A180B A184A A1882 EAD49 EB0D8 ...
tok_g:
          $ "g" umP umEND ;                      * 0FA69

* refs (1): 10D82
1_m:
        UNIT %1                                  * 0FA84

* "m"
* refs (52): A15D0 A1623 A1662 A169C A16CA A1707 ...
tok_m:
          $ "m" umEND ;                          * 0FA8E

* refs (1): 10D87
1_A:
        UNIT %1                                  * 0FAA4

_A_:
          $ "A" umEND ;                          * 0FAAE

* refs (1): 10D8C
1_s:
        UNIT %1                                  * 0FAC4

* "s"
* refs (30): A11A7 A11ED A1628 A16CF A1716 A176E ...
tok_s:
          $ "s" umEND ;                          * 0FACE

* refs (1): 10D91
1_K:
        UNIT %1                                  * 0FAE4

_K_:
          $ "K" umEND ;                          * 0FAEE

* refs (1): 10D96
1_cd:
        UNIT %1                                  * 0FB04

_cd_:
          $ "cd" umEND ;                         * 0FB0E

* refs (1): 10D9B
1_mol:
        UNIT %1                                  * 0FB26

_mol_:
          $ "mol" umEND ;                        * 0FB30

* refs (1): 10DE2
1_?:
        UNIT %1                                  * 0FB4A

_?_:
          $ "?" umEND ;                          * 0FB54
        NIBHEX  00000                            * 0FB6A  ..

* u u' -> u?
* refs (3): 1BCA8 1BCB2 1BCBC
UMMAX:
        :: 2DUP val(2uo) %> NOT?SWAPDROP ;       * 0FB6F

* u u' -> u?
* refs (3): 1BD1A 1BD24 1BD2E
UMMIN:
        :: 2DUP val(2uo) %< NOT?SWAPDROP ;       * 0FB8D

* u %percent -> u'
* refs (2): 1C097 1C0BF
UM%:
        :: SWAP dup;uo=>r ROT _*(2r);r=>rr %%1E2 %%/>% Unbr>U ; * 0FBAB
        BSS     10                               * 0FBD8

* refs (1): 0FDBD
OBJ_0FBE2:
        :: OBJ_0FBFB case2DROP CONSTUNITERR      * 0FBE2
        ;                                        * 0FBF6

* refs (3): 0FBE7 0FCAA CAC6D
OBJ_0FBFB:
        :: 2DUP EQUAL caseTRUE %10               * 0FBFB
          MATRND SWAP %10 MATRND SWAP 2DUP EQUAL ; * 0FC14

* u u' -> %
* refs (3): 1C180 1C18A 1C194
UM%CH:
        :: OBJ_0F6C0 OVER %%-                    * 0FC3C
UM%T~1:
          SWAP%%/ %%1E2 %%* %%>% SWAPDROP ;      * 0FC50

* refs (2): 0F701 0F70B
OBJ_0FC6E:
        :: DUP cfC jEQcase %%KZERO               * 0FC6E
          DUP cfF jEQcase %%RZERO                * 0FC87
          %%0 ;                                  * 0FC9B

* refs (2): 0F3B7 0F729
OBJ_0FCA5:
        :: OBJ_0FBFB case2DROP ROMPTR 0C1 020    * 0FCA5
        ;                                        * 0FCBF
        BSS     9                                * 0FCC4

* u u' -> %
* refs (3): 1C10E 1C118 1C122
UM%T:
        :: OBJ_0F6C0 GOTO UM%T~1 ;               * 0FCCD

* u -> %
* refs (1): 1B357
UMSIGN:
        :: CARCOMP %SGN ;                        * 0FCE6

* u -> u'
* refs (1): 1BB90
UMIP:
        :: PTR UMOPER: %IP ;                     * 0FCFA

* u -> u'
* refs (1): 1BBC6
UMFP:
        :: PTR UMOPER: %FP ;                     * 0FD0E

* u -> u'
* refs (1): 1BBFC
UMFLOOR:
        :: PTR UMOPER: %FLOOR ;                  * 0FD22

* u -> u'
* refs (1): 1BC32
UMCEIL:
        :: PTR UMOPER: %CEIL ;                   * 0FD36

* u -> u'
* refs (4): 0FCFF 0FD13 0FD27 0FD3B
UMOPER::
        :: DUP CARCOMP 'REVAL Unbr>U ;           * 0FD4A

* u -> u'
* refs (1): 1BDAA
UMRND:
        :: OVER CARCOMP SWAP RNDXY Unbr>U ;      * 0FD68

* u -> u'
* refs (1): 1BE26
UMTRC:
        :: OVER CARCOMP SWAP TRCXY Unbr>U ;      * 0FD8B

* refs (2): 0F878 0F8FF
OBJ_0FDAE:
        :: U>NCQ OBJ_3835E OBJ_0FBE2 %%* %%>% ;  * 0FDAE

* refs (5): B6166 B617B B6195 B61B3 B6204
~%0;%1:
        :: %0_2A2B4 %1 ;                         * 0FDD1

* refs (4): 0F376 0F38A 0F6C5 0F6D4
OBJ_0FDE5:
        :: dup;r?:dq/sk OBJ_0FE08 DUP GOTO L_0FE6C ; * 0FDE5

* refs (1): 0FDEF
OBJ_0FE08:
        :: %0=case                               * 0FE08
          :: OVER UM>U DUP GOTO L_0FE6C ;        * 0FE12
          DUP OBJ_0FE53 ;                        * 0FE35

* u -> n%% cf%% qhxs
* refs (11): 0F959 0FDB3 0FF52 0FFD4 10B95 9C58C ...
U>NCQ:
        :: DUPTYPEEXT? NOTcase                   * 0FE44

* refs (1): 0FE3A
OBJ_0FE53:
          :: %>%% %%1 OBJ_3835E ;                * 0FE53
L_0FE6C:
          >R                                     * 0FE6C
L_0FE71:
          ticR NOT?SEMI                          * 0FE71
          U>NCQ~1 GOTO L_0FE71 ;                 * 0FE7B

* refs (1): 0FE7B
U>NCQ~1:
        :: DUPTYPECHAR? case U>NCQ~5             * 0FE8F
          REQcasedrop um*                        * 0FEA3
          U>NCQ~7 REQcasedrop um/                * 0FEAD
          U>NCQ~3 REQcasedrop umP                * 0FEBC
          ~3UNROLL;%%*SWAP;TOTEMPOB REQcasedrop um^ * 0FECB
          U>NCQ~4 REQcasedrop umEND              * 0FEDA
          ~ROT;%>%%;3UNROLL DUPTYPECSTR? NOT?SEMI * 0FEE9
          U>NCQ~6 case SWAP                      * 0FEF8
          DUP$>ID U>NCQ~2 NOT?GOTO L_0FF66 DUPTYPEREAL? case * 0FF07
          :: SWAPDROP %>%% OBJ_3835E ;           * 0FF25
          DUPTYPEEXT? case                       * 0FF3E
          :: SWAPDROP U>NCQ ~3UNROLL;%%*SWAP;TOTEMPOB ; * 0FF48
          DROP                                   * 0FF61
L_0FF66:
          DUP CAR$ OBJ_0C2CD NOTcase INVUNITERR  * 0FF66
          U>NCQ~5 SWAP CDR$ $>ID U>NCQ~2 NOTcase INVUNITERR * 0FF7F
          DUPTYPEREAL? case                      * 0FFA2
          :: %>%% %%* OBJ_3835E ;                * 0FFAC
          DUPTYPEEXT? NOTcase INVUNITERR         * 0FFC5
          U>NCQ 4UNROLL %%* %%*SWAP TOTEMPOB ;   * 0FFD4

* refs (2): 0FF0C 0FF93
U>NCQ~2:
        :: COMPILEID NOTcsdrpfls DUPTYPEIDNT? case SAFE@ * 0FFF2
          DUPTYPEROMP? case ROMPTR@              * 10010
          DROPFALSE ;                            * 1001F
