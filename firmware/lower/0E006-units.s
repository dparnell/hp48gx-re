* HP 48GX ROM revision R, #0E006-#10028: Unit objects and conversion
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: tok_m tok_s UM>U ALARMS@ UMCONV U>NCQ tok_g 4dropn;IU! val(2uo) HBUFF_X_Y UMU> UM*
* Follows on from the previous file (at #0E006 in the original ROM).
        RPL

* refs (1): 0DD08
DispTstr(b):
        ::                                       * 0E006
          tstr(b)                                * 0E00B
          $>GROB                                 * 0E010
          HBUFF_X_Y                              * 0E015
          #8+                                    * 0E01A
          GROB!                                  * 0E01F
        ;                                        * 0E024

* $ ->
* refs (1): 0DD0D
DISPROW1*!:
        ::                                       * 0E029
          COERCE$22                              * 0E02E
          $>GROB                                 * 0E033
          HBUFF_X_Y                              * 0E038
          GROB!                                  * 0E03D
        ;                                        * 0E042

* -> grob
* refs (4): 0DCEA 12B8A 38930 46A04
Save16:
        ::                                       * 0E047
          TOP16                                  * 0E04C
          SUBGROB                                * 0E051
        ;                                        * 0E056

* grob ->
* refs (4): 0DD3F 12BAD 38944 46A36
Restore16:
        ::                                       * 0E05B
          HBUFF_X_Y                              * 0E060
          GROB!                                  * 0E065
        ;                                        * 0E06A

* ->
* refs (2): 0DCEF 9DE11
Clr16:
        ::                                       * 0E06F
          TOP16                                  * 0E074
          GROB!ZERODRP                           * 0E079
        ;                                        * 0E07E

* ->
* refs (1): 12739
Clr8:
        ::                                       * 0E083
          TOP8                                   * 0E088
          GROB!ZERODRP                           * 0E08D
        ;                                        * 0E092

* ->
* refs (1): 12761
Clr8-15:
        ::                                       * 0E097
          Rows8-15                               * 0E09C
          GROB!ZERODRP                           * 0E0A1
        ;                                        * 0E0A6

* -> HBgrob #x1 #y1 #x1+131 #y1+16
* refs (2): 0E04C 0E074
TOP16:
        ::                                       * 0E0AB
          HBUFF_X_Y                              * 0E0B0
          2DUP                                   * 0E0B5
          BINT16                                 * 0E0BA
          #+SWAP                                 * 0E0BF
          BINT131                                * 0E0C4
          #+SWAP                                 * 0E0C9
        ;                                        * 0E0CE

* -> HBgrob #x1 #y #x1+131 #y1+8
* refs (1): 0E088
TOP8:
        ::                                       * 0E0D3
          HBUFF_X_Y                              * 0E0D8
          2DUP                                   * 0E0DD
          BINT8                                  * 0E0E2
          #+SWAP                                 * 0E0E7
          BINT131                                * 0E0EC
          #+SWAP                                 * 0E0F1
        ;                                        * 0E0F6

* -> HBgrob #x1 #y1+8 #x1+131 #y1+16
* refs (1): 0E09C
Rows8-15:
        ::                                       * 0E0FB
          HBUFF_X_Y                              * 0E100
          #8+                                    * 0E105
          2DUP                                   * 0E10A
          BINT8                                  * 0E10F
          #+SWAP                                 * 0E114
          BINT131                                * 0E119
          #+SWAP                                 * 0E11E
        ;                                        * 0E123

* -> HBgrob #x #y
* refs (8): 0E015 0E038 0E060 0E0B0 0E0D8 0E100 ...
HBUFF_X_Y:
        ::                                       * 0E128
          HARDBUFF                               * 0E12D
          WINDOWCORNER                           * 0E132
          SWAP                                   * 0E137
        ;                                        * 0E13C

* refs (1): 38971
ExecAlarm(r):
        ::                                       * 0E141
          DUP                                    * 0E146
          RCLALARM%                              * 0E14B
          BINT3                                  * 0E150
          NTHCOMPDROP                            * 0E155
          EVAL                                   * 0E15A
        ;                                        * 0E15F

* refs (8): 0CD35 0CD49 0CD5D 0DCCC 0DD94 0DE4D ...
OBJ_0E164:
        ::                                       * 0E164
          OBJ_0E17D                              * 0E169
          OBJ_0E19B                              * 0E16E
          OBJ_0E1B9                              * 0E173
        ;                                        * 0E178

* refs (1): 0E169
OBJ_0E17D:
        ::                                       * 0E17D
          ALARMS@                                * 0E182
          NextAlarm(li)?                         * 0E187
          case                                   * 0E18C
          DROP                                   * 0E191
        ;                                        * 0E196

* refs (1): 0E16E
OBJ_0E19B:
        ::                                       * 0E19B
          ALARMS@                                * 0E1A0
          OldestPastDue(li)?                     * 0E1A5
          case                                   * 0E1AA
          DROP                                   * 0E1AF
        ;                                        * 0E1B4

* refs (1): 0E173
OBJ_0E1B9:
        CON(5)  (*)+5                            * 0E1B9  primitive code object
        ASSEMBLE
        GOSUB   SUB_0E39F                        * 0E1BE
        ST=0    15                               * 0E1C2
        GOSBVL  SUB_00672                        * 0E1C5
        GOSUB   SUB_0E391                        * 0E1CC
        P=      0                                * 0E1D0
        SETHEX                                   * 0E1D2
        GOTO    L_0E370                          * 0E1D4
        RPL

* {} -> {}'
* refs (2): 0E3F8 B7AEE
ALRMLS>:
        ::                                       * 0E1D8
          INCOMPDROP                             * 0E1DD
          SWAPDUP                                * 0E1E2
          Ticks>Date                             * 0E1E7
          SWAPDUP                                * 0E1EC
          Ticks>TOD                              * 0E1F1
          SWAP                                   * 0E1F6
          Ticks>Rpt                              * 0E1FB
          4ROLL                                  * 0E200
          SWAP                                   * 0E205
          BINT4                                  * 0E20A
          {}N                                    * 0E20F
        ;                                        * 0E214

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
        GOSUB   SUB_0E39F                        * 0E28B
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
        GOSUB   SUB_0E39F                        * 0E307
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
SUB_0E391:
        GOVLNG  AllowIntr                        * 0E391
        NIBHEX  8D2D760                          * 0E398  ØÒg

* refs (7): 0E1BE 0E28B 0E307 0E3B3 0E635 0E66F ...
SUB_0E39F:
        GOVLNG  SAVPTR                           * 0E39F

pastdue(li)?:
        CON(5)  (*)+5                            * 0E3A6  primitive code object
        A=DAT1  A                                * 0E3AB
        D1=D1+  5                                * 0E3AE
        D=D+1   A                                * 0E3B1
        GOSUB   SUB_0E39F                        * 0E3B3
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
        ::                                       * 0E3DF
          COERCE                                 * 0E3E4
          RCLALM                                 * 0E3E9
          NOTcase                                * 0E3EE
          NOALARMERR                             * 0E3F3
          ALRMLS>                                * 0E3F8
        ;                                        * 0E3FD

* #n -> {} T -> F
* refs (2): 0E3E9 B7AD5
RCLALM:
        ::                                       * 0E402
          ALARMS@                                * 0E407
          SWAP                                   * 0E40C
          NTHELCOMP                              * 0E411
        ;                                        * 0E416

* refs (1): 0DCE0
OBJ_0E41B:
        CON(5)  (*)+5                            * 0E41B  primitive code object
        ASSEMBLE
        AD1EX                                    * 0E420
        GOSBVL  SUB_0D877                        * 0E423
        D1=(5)  SAVECLK                          * 0E42A
        DAT1=C  1                                * 0E431
        D1=A                                     * 0E435
        GOTO    L_0DF5C                          * 0E438

* refs (1): 0DD8A
OBJ_0E43C:
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
        ::                                       * 0E461
          ROTDUP                                 * 0E466
          LENCOMP                                * 0E46B
          ROT                                    * 0E470
          {                                      * 0E475

ΠM:
            LAM     M                            * 0E47A

ΠM_0E483:
            LAM     N                            * 0E483
          }                                      * 0E48C
          BIND                                   * 0E491
          INNERCOMP                              * 0E496
          #1+ROLL                                * 0E49B

ΠM_0E4A0:
          LAM     M                              * 0E4A0
          #2+                                    * 0E4A9

ΠM_0E4AE:
          LAM     N                              * 0E4AE
          #-                                     * 0E4B7
          UNROLL                                 * 0E4BC

ΠM_0E4C1:
          LAM     M                              * 0E4C1
          #1+                                    * 0E4CA
          {}N                                    * 0E4CF
          ABND                                   * 0E4D4
        ;                                        * 0E4D9

* {} #n -> {}'
* refs (4): 0DD5D 0DE1B 0DE75 0E77E
REMOVEN{}:
        ::                                       * 0E4DE
          SWAPINCOMP                             * 0E4E3
          DUP#2+                                 * 0E4E8
          ROLLSWAP                               * 0E4ED
          DUP#2+                                 * 0E4F2
          ROT#-                                  * 0E4F7
          ROLLDROP                               * 0E4FC
          #1-                                    * 0E501
          {}N                                    * 0E506
        ;                                        * 0E50B

* %time -> %
* refs (1): 1990D
STOALARM%:
        ::                                       * 0E510
          VerifyTOD                              * 0E515
          DATE                                   * 0E51A
          SWAP                                   * 0E51F

__:
          $       ""                             * 0E524

%0:
          %       0E0                            * 0E52E
          STOALM                                 * 0E543
        ;                                        * 0E548

* {} -> %
* refs (1): 19917
STOALARMLS:
        ::                                       * 0E54D
          INNERDUP                               * 0E552
          BINT2                                  * 0E557
          #<                                     * 0E55C
          casedrop                               * 0E561
          SETSIZEERR                             * 0E566
          DUP                                    * 0E56B
          BINT4                                  * 0E570
          #>                                     * 0E575
          casedrop                               * 0E57A
          SETSIZEERR                             * 0E57F
          BINT3                                  * 0E584
          #=casedrop                             * 0E589
          ::                                     * 0E58E

%0_0E593:
            %       0E0                          * 0E593
            StoAlarms(2r,_,r)                    * 0E5A8
          ;                                      * 0E5AD
          BINT4                                  * 0E5B2
          #=casedrop                             * 0E5B7
          StoAlarms(2r,_,r)                      * 0E5BC
          DROP                                   * 0E5C1

___0E5C6:
          $       ""                             * 0E5C6

%0_0E5D0:
          %       0E0                            * 0E5D0
          StoAlarms(2r,_,r)                      * 0E5E5
        ;                                        * 0E5EA

* refs (4): 0E5A8 0E5BC 0E5E5 B7398
StoAlarms(2r,_,r):
        ::                                       * 0E5EF
          CKREAL                                 * 0E5F4
          Ornd(abs(r))                           * 0E5F9
          4UNROLL                                * 0E5FE
          4UNROLL                                * 0E603
          CKREAL                                 * 0E608
          VerifyTOD                              * 0E60D
          4UNROLL                                * 0E612
          CKREAL                                 * 0E617
          chkdate(r)                             * 0E61C
          4UNROLL                                * 0E621
          STOALM                                 * 0E626
        ;                                        * 0E62B

* refs (3): 0E61C 0EB18 0EB45
chkdate(r):
        CON(5)  (*)+5                            * 0E630  primitive code object
        ASSEMBLE
        GOSUB   SUB_0E39F                        * 0E635
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
        GOSUB   SUB_0E39F                        * 0E66F
        C=DAT1  A                                * 0E673
        D1=C                                     * 0E676
        D1=D1+  5                                * 0E679
        A=DAT1  W                                * 0E67C
        SETDEC                                   * 0E680
        GOSBVL  CKTIME                           * 0E682
        GONC    L_0E6CC                          * 0E689
        GOVLNG  ErrTime                          * 0E68C

* refs (1): 0E6E3
OBJ_0E693:
        CON(5)  (*)+5                            * 0E693  primitive code object
        GOSUB   SUB_0E39F                        * 0E698
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
        ::                                       * 0E6D4
          %ABS                                   * 0E6D9
          %INT                                   * 0E6DE
          OBJ_0E693                              * 0E6E3
        ;                                        * 0E6E8

* %date %time acti %rep -> %
* refs (2): 0E543 0E626
STOALM:
        ::                                       * 0E6ED
          SWAP                                   * 0E6F2
          4UNROLL                                * 0E6F7
          >ALRMLS                                * 0E6FC
          ALARMS@                                * 0E701
          TOTEMPSWAP                             * 0E706
          InsAlarm(2li)                          * 0E70B
          NewAlarm(li)                           * 0E710
          UNCOERCE                               * 0E715
          OBJ_0172B                              * 0E71A
        ;                                        * 0E71F

* %n ->
* refs (2): 19981 B7D2D
DELALARM:
        ::                                       * 0E724
          COERCE                                 * 0E729
          DUP#0=                                 * 0E72E
          casedrop                               * 0E733
          DelAlarrm(0)                           * 0E738
          DUP                                    * 0E73D
          ALARMS@                                * 0E742
          LENCOMP                                * 0E747
          #>                                     * 0E74C
          case                                   * 0E751
          NOALARMERR                             * 0E756
          DelAlarrm(s)                           * 0E75B
          OBJ_0172B                              * 0E760
          OBJ_0E164                              * 0E765
        ;                                        * 0E76A

* refs (1): 0E75B
DelAlarrm(s):
        ::                                       * 0E76F
          ALARMS@                                * 0E774
          TOTEMPSWAP                             * 0E779
          REMOVEN{}                              * 0E77E
          NewAlarm(li)                           * 0E783
        ;                                        * 0E788

* refs (2): 0E738 17E25
DelAlarrm(0):
        ::                                       * 0E78D
          NULL{}                                 * 0E792
          TOTEMPOB                               * 0E797
          NewAlarm(li)                           * 0E79C
          OBJ_0172B                              * 0E7A1
          OBJ_0E164                              * 0E7A6
        ;                                        * 0E7AB

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
SUB_0E87B:
        GOVLNG  GETPTR                           * 0E87B

* refs (5): 0E932 0E9BF 0EC22 0ECA5 0EE10
SUB_0E882:
        GOVLNG  SAVPTR                           * 0E882

* refs (4): 0ECC2 0ECD8 0ECF3 0ED09
SUB_0E889:
        ?ST=1   5                                * 0E889
        RTNYES                                   * 0E88C
        GOVLNG  RCKBp                            * 0E88E

* refs (5): 0E8E3 0E999 0EA4D 0EAB3 0EC60
SUB_0E895:
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
        GOSUB   SUB_0E895                        * 0E8E3
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
        GOSUB   SUB_0E882                        * 0E932
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
        GOSUB   SUB_0E895                        * 0E999
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
        GOSUB   SUB_0E882                        * 0E9BF
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
        GOSUB   SUB_0E87B                        * 0EA37
        D1=D1-  5                                * 0EA3B
        D=D-1   A                                * 0EA3E
        DAT1=A  A                                * 0EA40
        GOVLNG  PushTLoop                        * 0EA43
L_0EA4A:
        D0=D0+  1                                * 0EA4A
        GOSUB   SUB_0E895                        * 0EA4D
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
        GOSUB   SUB_0E895                        * 0EAB3
        GONC    L_0EA74                          * 0EAB7
L_0EABA:
        GOTO    L_0EC4E                          * 0EABA
        RPL

* refs (1): 0DEB6
OBJ_0EABE:
        ::                                       * 0EABE
          BINT1                                  * 0EAC3
          NTHCOMPDROP                            * 0EAC8
          FindAlarm(li,b)                        * 0EACD
        ;                                        * 0EAD2

* %date -> %
* refs (1): 19957
FINDALARM%:
        ::                                       * 0EAD7
          DUP                                    * 0EADC
          %0_2A2B4                               * 0EAE1
          %=                                     * 0EAE6
          casedrop                               * 0EAEB
          ::                                     * 0EAF0
            ALARMS@                              * 0EAF5
            OldestPastDue(li)?                   * 0EAFA
            IT                                   * 0EAFF
            DROP                                 * 0EB04
            IndexPastDue(li)                     * 0EB09
            UNCOERCE                             * 0EB0E
          ;                                      * 0EB13
          chkdate(r)                             * 0EB18
          Date>hxs13                             * 0EB1D
          FindNext                               * 0EB22
          Alarm(s=>r)                            * 0EB27
        ;                                        * 0EB2C

* {} -> %
* refs (1): 19961
FINDALARMLS:
        ::                                       * 0EB31
          INCOMPDROP                             * 0EB36
          VerifyTOD                              * 0EB3B
          SWAP                                   * 0EB40
          chkdate(r)                             * 0EB45
          Date>hxs13                             * 0EB4A
          SWAP                                   * 0EB4F
          TOD>Ticks                              * 0EB54
          Date+Time                              * 0EB59
          FindNext                               * 0EB5E
          Alarm(s=>r)                            * 0EB63
        ;                                        * 0EB68

FindAlarm!:
        ::                                       * 0EB6D
          CLKTICKS                               * 0EB72
          FindNext                               * 0EB77
        ;                                        * 0EB7C

* -> hxs
* refs (4): 0EB72 19837 2B062 CE153
CLKTICKS:
        ::                                       * 0EB81
          OBJ_0EDB9                              * 0EB86
          CODE                                   * 0EB8B  14 nibbles
            GOSBVL  SavPtrTime*                  * 0EB95
            R0=C                                 * 0EB9C
            GOTO    L_0EEB0                      * 0EB9F
          ENDCODE                                * 0EBA3
        ;                                        * 0EBA3

* refs (2): 0EB27 0EB63
Alarm(s=>r):
        ::                                       * 0EBA8
          DUP                                    * 0EBAD
          ALARMS@                                * 0EBB2
          LENCOMP                                * 0EBB7
          #>                                     * 0EBBC
          casedrop                               * 0EBC1
          %0_2A2B4                               * 0EBC6
          UNCOERCE                               * 0EBCB
        ;                                        * 0EBD0

* refs (3): 0EB22 0EB5E 0EB77
FindNext:
        ::                                       * 0EBD5
          ALARMS@                                * 0EBDA
          SWAP                                   * 0EBDF
          FindAlarm(li,b)                        * 0EBE4
        ;                                        * 0EBE9

* refs (1): 17E07
alarm<>{}?:
        ::                                       * 0EBEE
          ALARMS@                                * 0EBF3
          NULLCOMP?                              * 0EBF8
          NOT                                    * 0EBFD
        ;                                        * 0EC02

* refs (2): 0EACD 0EBE4
FindAlarm(li,b):
        CON(5)  (*)+5                            * 0EC07  primitive code object
        ASSEMBLE
        GOSBVL  SUB_0D90A                        * 0EC0C
        GOSUB   SUB_0E87B                        * 0EC13
        C=DAT1  A                                * 0EC17
        R1=C                                     * 0EC1A
        D1=D1+  5                                * 0EC1D
        D=D+1   A                                * 0EC20
        GOSUB   SUB_0E882                        * 0EC22
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
        GOSUB   SUB_0E895                        * 0EC60
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
OBJ_0EC9D:
        CON(5)  (*)+5                            * 0EC9D  primitive code object
        ST=0    15                               * 0ECA2
        GOSUB   SUB_0E882                        * 0ECA5
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
OBJ_0EDA5:
        ::                                       * 0EDA5
          BINT10                                 * 0EDAA
          MAKEHXS                                * 0EDAF
        ;                                        * 0EDB4

* refs (3): 0EB86 0EE55 0EE88
OBJ_0EDB9:
        ::                                       * 0EDB9
          BINT13                                 * 0EDBE
          MAKEHXS                                * 0EDC3
        ;                                        * 0EDC8

* refs (1): 0EF68
OBJ_0EDCD:
        ::                                       * 0EDCD
          BINT24                                 * 0EDD2
          MAKEHXS                                * 0EDD7
        ;                                        * 0EDDC

* #nibs -> hxs
* refs (3): 0EDAF 0EDC3 0EDD7
MAKEHXS:
        ::                                       * 0EDE1
          NULLHXS                                * 0EDE6
          SWAP                                   * 0EDEB
          EXPAND                                 * 0EDF0
        ;                                        * 0EDF5
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
        GOSUB   SUB_0E882                        * 0EE10
        GOSBVL  GARBAGECOL                       * 0EE14  inline data follows
        GOSUB   SUB_0E87B                        * 0EE1B
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
        ::                                       * 0EE50
          OBJ_0EDB9                              * 0EE55
          SWAP                                   * 0EE5A
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

        CON(5)  OBJ_0EDB9                        * 0EE88  address (the code jumps or points through it)

        CON(5)  SWAP                             * 0EE8D  address (the code jumps or points through it)

        CON(5)  DOCODE                           * 0EE92  address (the code jumps or points through it)
        NIBHEX  430008F849D01085908D4CBC0        * 0EE97  4.∡↓η..X.ØÄË
        ASSEMBLE
L_0EEB0:
        GOSUB   SUB_0E87B                        * 0EEB0
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
        ::                                       * 0EED0
          OBJ_0EDA5                              * 0EED5
          SWAP                                   * 0EEDA
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
            GOSUB   SUB_0E87B                    * 0EF25
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
        ::                                       * 0EF45
          r=>b10                                 * 0EF4A
          ROT                                    * 0EF4F
          Date>hxs13                             * 0EF54
          ROT                                    * 0EF59
          TOD>Ticks                              * 0EF5E
          Date+Time                              * 0EF63
          OBJ_0EDCD                              * 0EF68
          3UNROLL                                * 0EF6D
          CODE                                   * 0EF72  99 nibbles
            GOSBVL  SUB_0D90A                    * 0EF7C
            GOSUB   SUB_0E87B                    * 0EF83
            GOSBVL  SUB_0D8CF                    * 0EF87
            GOSBVL  SUB_012F9                    * 0EF8E
            A=R0                                 * 0EF95
            ST=0    8                            * 0EF98
            P=      12                           * 0EF9B
            ?C<=A   WP                           * 0EF9D
            GOYES   L_0EFA5                      * 0EFA0
            ST=1    8                            * 0EFA2
L_0EFA5:
            P=      0                            * 0EFA5
            GOSUB   SUB_0E87B                    * 0EFA7
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
          SWAP                                   * 0EFDF
          TWO{}N                                 * 0EFE4
        ;                                        * 0EFE9

* 8192
%TICKSsec:
        %       8.192E3                          * 0EFEE

* 491520
%TICKSmin:
        %       4.9152E5                         * 0F003

* 29491200
%HrTicks:
        %       2.94912E7                        * 0F018

* 707788800
%TICKSday:
        %       7.077888E8                       * 0F02D

* 4954521600
%TICKSweek:
        %       4.9545216E9                      * 0F042
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
        ::                                       * 0F075
          %1                                     * 0F07A
          SWAP                                   * 0F07F
          dup;stdunit(st)?                       * 0F084
          case                                   * 0F089
          makeuo!(r,st)                          * 0F08E
          DUP                                    * 0F093
          CAR$                                   * 0F098
          OBJ_0C2CD                              * 0F09D
          NOTcase                                * 0F0A2
          OBJ_0F106                              * 0F0A7
          OVER                                   * 0F0AC
          CDR$                                   * 0F0B1
          dup;stdunit(st)?                       * 0F0B6
          NOTcasedrop                            * 0F0BB
          OBJ_0F106                              * 0F0C0
          ROTDROPSWAP                            * 0F0C5
          OBJ_10B1C                              * 0F0CA
          SWAP                                   * 0F0CF
          umP                                    * 0F0D4
          BINT4                                  * 0F0D9
          OBJ_0F124                              * 0F0DE
          TRUE                                   * 0F0E3
        ;                                        * 0F0E8

* refs (2): 0F08E 0F11A
makeuo!(r,st):
        ::                                       * 0F0ED
          BINT2                                  * 0F0F2
          OBJ_0F124                              * 0F0F7
          TRUE                                   * 0F0FC
        ;                                        * 0F101

* refs (2): 0F0A7 0F0C0
OBJ_0F106:
        ::                                       * 0F106
          DROP                                   * 0F10B
          OBJ_0F164                              * 0F110
          case2drpfls                            * 0F115
          makeuo!(r,st)                          * 0F11A
        ;                                        * 0F11F

* refs (2): 0F0DE 0F0F7
OBJ_0F124:
        ::                                       * 0F124
          umEND                                  * 0F129
          SWAP#1+                                * 0F12E
          PSYMBN                                 * 0F133
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
OBJ_0F164:
        ::                                       * 0F164
          ngsizecase                             * 0F169
          TRUE                                   * 0F16E
          OBJ_25F4E                              * 0F173
          SWAPONE                                * 0F178
          OVER                                   * 0F17D
          delimcase                              * 0F182
          drop(1-2,4);true                       * 0F187
          DROP                                   * 0F18C
          OBJ_25A93                              * 0F191
          DROP                                   * 0F196
          OBJ_25A93                              * 0F19B
          nultrior                               * 0F1A0
          ::                                     * 0F1A5
            2DROP                                * 0F1AA
            SWAPDROPDUP                          * 0F1AF
            $>ID                                 * 0F1B4
            COMPILEID                            * 0F1B9
            DROP                                 * 0F1BE
            NOTROMPcase                          * 0F1C3

<>gn?:
            ::                                   * 0F1C8
              TYPEIDNT?                          * 0F1CD
              NOT                                * 0F1D2
            ;                                    * 0F1D7
            ROMPTR@                              * 0F1DC
            DROP                                 * 0F1E1
            dup;r?:dq/sk                         * 0F1E6
            DROPFALSE                            * 0F1EB
            TYPEEXT?                             * 0F1F0
            NOT                                  * 0F1F5
          ;                                      * 0F1FA

* refs (1): 0F187
drop(1-2,4);true:
          ::                                     * 0F1FF
            2DROP                                * 0F204
            SWAPDROPTRUE                         * 0F209
          ;                                      * 0F20E
        ;                                        * 0F213

* u -> $
* refs (2): 41332 5F9F0
UNIT>$:
        ::                                       * 0F218
          >R                                     * 0F21D
          ticR                                   * 0F222
          NOT?SEMI                               * 0F227
          DUPTYPEREAL?                           * 0F22C
          NOT?GOTO                               * 0F231
          L_0F24A                                * 0F236
          a%>$                                   * 0F23B
L_0F240:
          ticR                                   * 0F240
          NOT?SEMI                               * 0F245
L_0F24A:
          DUPTYPECSTR?                           * 0F24A
          ?GOTO                                  * 0F24F
          L_0F240                                * 0F254
          DUPTYPECHAR?                           * 0F259
          ?GOTO                                  * 0F25E
          L_0F240                                * 0F263
          dup;r?:dq/sk                           * 0F268
          ::                                     * 0F26D
            OBJ_35264                            * 0F272
            GOTO                                 * 0F277
            L_0F240                              * 0F27C
          ;                                      * 0F281
          REQcasedrop                            * 0F286
          umP                                    * 0F28B
          ::                                     * 0F290
            SWAP                                 * 0F295
            >H$                                  * 0F29A
            GOTO                                 * 0F29F
            L_0F240                              * 0F2A4
          ;                                      * 0F2A9
          REQcasedrop                            * 0F2AE
          um*                                    * 0F2B3
          ::                                     * 0F2B8
            tok*                                 * 0F2BD
            GOTO                                 * 0F2C2
            L_0F321                              * 0F2C7
          ;                                      * 0F2CC
          REQcasedrop                            * 0F2D1
          um/                                    * 0F2D6
          ::                                     * 0F2DB
            tok/                                 * 0F2E0
            GOTO                                 * 0F2E5
            L_0F321                              * 0F2EA
          ;                                      * 0F2EF
          REQcasedrop                            * 0F2F4
          um^                                    * 0F2F9
          ::                                     * 0F2FE
            tok^                                 * 0F303
            GOTO                                 * 0F308
            L_0F321                              * 0F30D
          ;                                      * 0F312
          DROP                                   * 0F317
          tokuscore                              * 0F31C
L_0F321:
          SWAP&$                                 * 0F321
          &$                                     * 0F326
          GOTO                                   * 0F32B
          L_0F240                                * 0F330
        ;                                        * 0F335

* % u -> u'
* refs (16): 0F367 0FE1C 10083 1555E 1975E 48CEC ...
UM>U:
        ::                                       * 0F33A
          units(uo)=>(_,s)                       * 0F33F
          ->unit(_,s)                            * 0F344
        ;                                        * 0F349

* u -> % u'
* refs (7): 197CD 1CFC6 567D2 56886 72F8E 9C334 ...
UMU>:
        ::                                       * 0F34E
          DUP                                    * 0F353
          CARCOMP                                * 0F358
          %1                                     * 0F35D
          ROT                                    * 0F362
          UM>U                                   * 0F367
        ;                                        * 0F36C

* u1 u2 -> u1'
* refs (14): 0F56B 0FA49 196EA 196F4 196FE 5668D ...
UMCONV:
        ::                                       * 0F371
          OBJ_0FDE5                              * 0F376
          ROTDROP                                * 0F37B
          3PICK                                  * 0F380
          5ROLL                                  * 0F385
          OBJ_0FDE5                              * 0F38A
          5UNROLL                                * 0F38F
          7UNROLL                                * 0F394
          7UNROLL                                * 0F399
          2DROP                                  * 0F39E
          puretemp?                              * 0F3A3
          ITE                                    * 0F3A8
          TempConv                               * 0F3AD
          ::                                     * 0F3B2
            OBJ_0FCA5                            * 0F3B7
            %%/                                  * 0F3BC
            %%*                                  * 0F3C1
          ;                                      * 0F3C6
          %%>%                                   * 0F3CB
          Unbr>U                                 * 0F3D0
        ;                                        * 0F3D5
        BSS     10                               * 0F3DA

* [] []' -> [] []' flag
* refs (4): 0F3A3 0F6ED CD63A CD695
puretemp?:
        ::                                       * 0F3E4
          DUP                                    * 0F3E9
          OBJ_38417                              * 0F3EE
          EQ                                     * 0F3F3
          NOTcaseFALSE                           * 0F3F8
          2DUPEQ                                 * 0F3FD
        ;                                        * 0F402

* refs (9): 9362E 94032 95D56 95EC1 9616E 9632B ...
4dropn;IU!:
        ::                                       * 0F407
          DUP                                    * 0F40C
          %%0=                                   * 0F411
        ;                                        * 0F416

* ???
* refs (2): 0F3AD CD64F
TempConv:
        ::                                       * 0F41B
          2DROP                                  * 0F420
          2DUPEQ                                 * 0F425
          case2DROP                              * 0F42A
          OVER                                   * 0F42F
          cfC                                    * 0F434
          jEQcase                                * 0F439
          OBJ_0F47F                              * 0F43E
          OVER                                   * 0F443
          cfF                                    * 0F448
          jEQcase                                * 0F44D
          OBJ_0F4C5                              * 0F452
          3UNROLL                                * 0F457
          %%*                                    * 0F45C
          OVER                                   * 0F461
          %%/                                    * 0F466
          OBJ_0F510                              * 0F46B
          %%-                                    * 0F470
          SWAPDROP                               * 0F475
        ;                                        * 0F47A

* refs (1): 0F43E
OBJ_0F47F:
        ::                                       * 0F47F
          SWAPDROP                               * 0F484
          cfF                                    * 0F489
          EQcase                                 * 0F48E
          ::                                     * 0F493
            %%/                                  * 0F498
            %%3.2E1                              * 0F49D
            %%+                                  * 0F4A2
          ;                                      * 0F4A7
          SWAP                                   * 0F4AC
          %%KZERO                                * 0F4B1
          %%+                                    * 0F4B6
          SWAP%%/                                * 0F4BB
        ;                                        * 0F4C0

* refs (1): 0F452
OBJ_0F4C5:
        ::                                       * 0F4C5
          cfC                                    * 0F4CA
          EQcasedrop                             * 0F4CF
          ::                                     * 0F4D4
            SWAP                                 * 0F4D9
            %%3.2E1                              * 0F4DE
            %%-                                  * 0F4E3
            %%*                                  * 0F4E8
          ;                                      * 0F4ED
          %%/                                    * 0F4F2
          SWAP                                   * 0F4F7
          %%RZERO                                * 0F4FC
          %%+                                    * 0F501
          %%*                                    * 0F506
        ;                                        * 0F50B

* refs (1): 0F46B
OBJ_0F510:
        ::                                       * 0F510
          OVER                                   * 0F515
          cfC                                    * 0F51A
          jEQcase                                * 0F51F
          %%KZERO                                * 0F524
          OVER                                   * 0F529
          cfF                                    * 0F52E
          jEQcase                                * 0F533
          %%RZERO                                * 0F538
          %%0                                    * 0F53D
        ;                                        * 0F542

* refs (2): 0F49D 0F4DE
%%3.2E1:
        %%      3.2E1                            * 0F547

* refs (8): 0F589 0F59D 0F5B1 0F5C5 0F5D9 0F5ED ...
val(2uo):
        ::                                       * 0F561
          DUPUNROT                               * 0F566
          UMCONV                                 * 0F56B
          U>nbr                                  * 0F570
          SWAP                                   * 0F575
          U>nbr                                  * 0F57A
        ;                                        * 0F57F

* u u' -> %flag
* refs (3): 1E9D1 1E9DB 1E9E5
UM=?:
        ::                                       * 0F584
          val(2uo)                               * 0F589
          OBJ_1EA30                              * 0F58E
        ;                                        * 0F593

* u u' -> %flag
* refs (3): 1EAFC 1EB06 1EB10
UM#?:
        ::                                       * 0F598
          val(2uo)                               * 0F59D
          OBJ_1EB51                              * 0F5A2
        ;                                        * 0F5A7

* u u' -> %flag
* refs (3): 1EC09 1EC13 1EC1D
UM<?:
        ::                                       * 0F5AC
          val(2uo)                               * 0F5B1
          <(2r)                                  * 0F5B6
        ;                                        * 0F5BB

* u u' -> %flag
* refs (6): 1ECA8 1ECB2 1ECBC D1EB4 D1EC3 D1ED2
UM>?:
        ::                                       * 0F5C0
          val(2uo)                               * 0F5C5
          >(2r)                                  * 0F5CA
        ;                                        * 0F5CF

* u u' -> %flag
* refs (3): 1ED47 1ED51 1ED5B
UM<=?:
        ::                                       * 0F5D4
          val(2uo)                               * 0F5D9
          ó(2r)                                  * 0F5DE
        ;                                        * 0F5E3

* u u' -> %flag
* refs (3): 1EDE6 1EDF0 1EDFA
UM>=?:
        ::                                       * 0F5E8
          val(2uo)                               * 0F5ED
          ò(2r)                                  * 0F5F2
        ;                                        * 0F5F7

* u -> u'
* refs (1): 1AA56
UMABS:
        ::                                       * 0F5FC
          dup;uo=>r                              * 0F601
          %ABS                                   * 0F606
          Unbr>U                                 * 0F60B
        ;                                        * 0F610

* u -> u'
* refs (1): 1A9CC
UMCHS:
        ::                                       * 0F615
          dup;uo=>r                              * 0F61A
          %CHS                                   * 0F61F
          Unbr>U                                 * 0F624
        ;                                        * 0F629

* u -> u'
* refs (1): 1B4D9
UMSIN:
        ::                                       * 0F62E

* refs (2): 0F665 0F679
OBJ_0F633:
          ::                                     * 0F633
            OBJ_10B90                            * 0F638
            'REVAL                               * 0F63D
            %%>%                                 * 0F642
          ;                                      * 0F647
          %%SINDEG                               * 0F64C
        ;                                        * 0F651

* refs (2): 9028A 934A9
OBJ_0F656:
        #       800                              * 0F656  2048

* u -> u'
* refs (1): 1B532
UMCOS:
        ::                                       * 0F660
          OBJ_0F633                              * 0F665
          %%COSDEG                               * 0F66A
        ;                                        * 0F66F

* u -> u'
* refs (1): 1B58B
UMTAN:
        ::                                       * 0F674
          OBJ_0F633                              * 0F679
          OBJ_10E0E                              * 0F67E
        ;                                        * 0F683

* 2pi
%%2PI:
        %%      6.28318530717959E0               * 0F688

* u u' -> u''
* refs (3): 1ABBC 1ABC6 1ABD0
UM+:
        ::                                       * 0F6A2
          OBJ_0F6C0                              * 0F6A7
          %%+                                    * 0F6AC
          %%>%                                   * 0F6B1
          Unbr>U                                 * 0F6B6
        ;                                        * 0F6BB

* refs (4): 0F6A7 0F779 0FC41 0FCD2
OBJ_0F6C0:
        ::                                       * 0F6C0
          OBJ_0FDE5                              * 0F6C5
          4PICK                                  * 0F6CA
          6ROLL                                  * 0F6CF
          OBJ_0FDE5                              * 0F6D4
          5UNROLL                                * 0F6D9
          7UNROLL                                * 0F6DE
          7UNROLL                                * 0F6E3
          2DROP                                  * 0F6E8
          puretemp?                              * 0F6ED
          ITE                                    * 0F6F2
          ::                                     * 0F6F7
            2DROP                                * 0F6FC
            OBJ_0FC6E                            * 0F701
            3PICK                                * 0F706
            OBJ_0FC6E                            * 0F70B
            SWAPDROP                             * 0F710
            EQ                                   * 0F715
            NOTcase                              * 0F71A
            CONSTUNITERR                         * 0F71F
          ;                                      * 0F724
          OBJ_0FCA5                              * 0F729
          %%/                                    * 0F72E
          %%*SWAP                                * 0F733
        ;                                        * 0F738

* refs (1): 10C31
OBJ_0F73D:
        ::                                       * 0F73D
          SWAPCKREF                              * 0F742
          SWAP                                   * 0F747
          OBJ_7D761                              * 0F74C
        ;                                        * 0F751

* refs (2): 10C4F CAC04
OBJ_0F756:
        ::                                       * 0F756
          SWAPCKREF                              * 0F75B
          SWAP                                   * 0F760
          OBJ_7D76D                              * 0F765
        ;                                        * 0F76A
        NIBHEX  00000                            * 0F76F  ..

* u u' -> u''
* refs (3): 1AD9A 1ADA4 1ADAE
UM-:
        ::                                       * 0F774
          OBJ_0F6C0                              * 0F779
          %%-                                    * 0F77E
          %%>%                                   * 0F783
          Unbr>U                                 * 0F788
        ;                                        * 0F78D

* u u' -> u''
* refs (7): 0F922 197E6 1AEA7 1AEB1 1AEBB 56895 ...
UM*:
        ::                                       * 0F792
          OBJ_0F7B0                              * 0F797
          %*                                     * 0F79C
          NOP                                    * 0F7A1
          psh                                    * 0F7A6
        ;                                        * 0F7AB

* refs (2): 0F797 0F828
OBJ_0F7B0:
        ::                                       * 0F7B0
          OVER                                   * 0F7B5
          U>nbr                                  * 0F7BA
          OVER                                   * 0F7BF
          U>nbr                                  * 0F7C4
          'REVAL                                 * 0F7C9
          3UNROLL                                * 0F7CE
          units(uo)=>(_,s)                       * 0F7D3
          OBJ_10100                              * 0F7D8
          UobROT                                 * 0F7DD
          units(uo)=>(_,s)                       * 0F7E2
          OBJ_10100                              * 0F7E7
          'REVAL                                 * 0F7EC
          rot                                    * 0F7F1
          OBJ_107E3                              * 0F7F6
          psh                                    * 0F7FB
          rot                                    * 0F800
          OBJ_107E3                              * 0F805
          'REVAL                                 * 0F80A
          OBJ_10194                              * 0F80F
          OBJ_1086F                              * 0F814
          ->unit(_,s)                            * 0F819
        ;                                        * 0F81E

* u u' -> u''
* refs (4): 197DC 1AFAA 1AFB4 1AFBE
UM/:
        ::                                       * 0F823
          OBJ_0F7B0                              * 0F828
          %/                                     * 0F82D
          psh                                    * 0F832
          NOP                                    * 0F837
        ;                                        * 0F83C

* u -> u'
* refs (1): 1B2AF
UMINV:
        ::                                       * 0F841
          dup;uo=>r                              * 0F846
          %1/                                    * 0F84B
          SWAP                                   * 0F850
          OBJ_10BAF                              * 0F855
          psh                                    * 0F85A
          OBJ_10194                              * 0F85F
          OBJ_1086F                              * 0F864
          ->unit(_,s)                            * 0F869
        ;                                        * 0F86E

* refs (4): 0F93B 1B096 1B0A0 1B0AA
^(2uo):
        ::                                       * 0F873
          OBJ_0FDAE                              * 0F878
          FALSE                                  * 0F87D

* refs (1): 0F909
OBJ_0F882:
          ::                                     * 0F882
            2NULLLAM{}                           * 0F887
            BIND                                 * 0F88C
            dup;uo=>r                            * 0F891
            2GETLAM                              * 0F896
            1GETLAM                              * 0F89B
            ITE                                  * 0F8A0
            %NROOT                               * 0F8A5
            %^                                   * 0F8AA
            SWAP                                 * 0F8AF
            OBJ_10BAF                            * 0F8B4
            OBJ_10194                            * 0F8B9
            OBJ_108F1                            * 0F8BE
            psh                                  * 0F8C3
            OBJ_108F1                            * 0F8C8
            2GETLAM                              * 0F8CD
            %0<                                  * 0F8D2
            ?SKIP                                * 0F8D7
            psh                                  * 0F8DC
            OBJ_1086F                            * 0F8E1
            ->unit(_,s)                          * 0F8E6
            ABND                                 * 0F8EB
          ;                                      * 0F8F0
        ;                                        * 0F8F5

* u u' -> u''
* refs (1): 1B247
UMXROOT:
        ::                                       * 0F8FA
          OBJ_0FDAE                              * 0F8FF
          TRUE                                   * 0F904
          OBJ_0F882                              * 0F909
        ;                                        * 0F90E

* u -> u'
* refs (1): 1B45D
UMSQ:
        ::                                       * 0F913
          DUP                                    * 0F918
          COLA                                   * 0F91D
          UM*                                    * 0F922
        ;                                        * 0F927

* u -> u'
* refs (1): 1B3A1
UMSQRT:
        ::                                       * 0F92C
          %.5                                    * 0F931
          COLA                                   * 0F936
          ^(2uo)                                 * 0F93B
        ;                                        * 0F940

* u -> u'
* refs (2): 19780 197E1
UMSI:
        ::                                       * 0F945
          OBJ_10D78                              * 0F94A
          >R                                     * 0F94F
          DUP                                    * 0F954
          U>NCQ                                  * 0F959
          %1                                     * 0F95E
          BINT1                                  * 0F963
          3UNROLL                                * 0F968
          FALSE                                  * 0F96D
          4NULLLAM{}                             * 0F972
          BIND                                   * 0F977
          2DROP00                                * 0F97C
L_0F981:
          ticR                                   * 0F981
          NOT?GOTO                               * 0F986
          L_0FA2B                                * 0F98B
          3GETLAM                                * 0F990
          4GETLAM                                * 0F995
          DUP#1+                                 * 0F99A
          4PUTLAM                                * 0F99F
          PULLEL                                 * 0F9A4
          SWAPDROP                               * 0F9A9
          DUP                                    * 0F9AE
          2PUTLAM                                * 0F9B3
          %0=                                    * 0F9B8
          ?GOTO                                  * 0F9BD
          L_0FA1C                                * 0F9C2
          units(uo)=>(_,s)                       * 0F9C7
          OBJ_10100                              * 0F9CC
          OBJ_108F1                              * 0F9D1
          psh                                    * 0F9D6
          OBJ_108F1                              * 0F9DB
          2GETLAM                                * 0F9E0
          %0<                                    * 0F9E5
          ?SKIP                                  * 0F9EA
          psh                                    * 0F9EF
          rot                                    * 0F9F4
          psh                                    * 0F9F9
          OBJ_107E3                              * 0F9FE
          rot                                    * 0FA03
          rot                                    * 0FA08
          OBJ_107E3                              * 0FA0D
          psh                                    * 0FA12
          BINT0                                  * 0FA17
L_0FA1C:
          DROP                                   * 0FA1C
          GOTO                                   * 0FA21
          L_0F981                                * 0FA26
L_0FA2B:
          ABND                                   * 0FA2B
          %1                                     * 0FA30
          unrot1                                 * 0FA35
          OBJ_10194                              * 0FA3A
          OBJ_1086F                              * 0FA3F
          ->unit(_,s)                            * 0FA44
          UMCONV                                 * 0FA49
        ;                                        * 0FA4E
        NIBHEX  00000                            * 0FA53  ..

* refs (1): 10D7D
1_kg:
        UNIT                                     * 0FA58
          %1                                     * 0FA5D

K__k_:
          CHR     "k"                            * 0FA62

* "g"
* refs (10): A172A A180B A184A A1882 EAD49 EB0D8 ...
tok_g:
          $       "g"                            * 0FA69
          umP                                    * 0FA75
          umEND                                  * 0FA7A
        ;                                        * 0FA7F

* refs (1): 10D82
1_m:
        UNIT                                     * 0FA84
          %1                                     * 0FA89

* "m"
* refs (52): A15D0 A1623 A1662 A169C A16CA A1707 ...
tok_m:
          $       "m"                            * 0FA8E
          umEND                                  * 0FA9A
        ;                                        * 0FA9F

* refs (1): 10D87
1_A:
        UNIT                                     * 0FAA4
          %1                                     * 0FAA9

_A_:
          $       "A"                            * 0FAAE
          umEND                                  * 0FABA
        ;                                        * 0FABF

* refs (1): 10D8C
1_s:
        UNIT                                     * 0FAC4
          %1                                     * 0FAC9

* "s"
* refs (30): A11A7 A11ED A1628 A16CF A1716 A176E ...
tok_s:
          $       "s"                            * 0FACE
          umEND                                  * 0FADA
        ;                                        * 0FADF

* refs (1): 10D91
1_K:
        UNIT                                     * 0FAE4
          %1                                     * 0FAE9

_K_:
          $       "K"                            * 0FAEE
          umEND                                  * 0FAFA
        ;                                        * 0FAFF

* refs (1): 10D96
1_cd:
        UNIT                                     * 0FB04
          %1                                     * 0FB09

_cd_:
          $       "cd"                           * 0FB0E
          umEND                                  * 0FB1C
        ;                                        * 0FB21

* refs (1): 10D9B
1_mol:
        UNIT                                     * 0FB26
          %1                                     * 0FB2B

_mol_:
          $       "mol"                          * 0FB30
          umEND                                  * 0FB40
        ;                                        * 0FB45

* refs (1): 10DE2
1_?:
        UNIT                                     * 0FB4A
          %1                                     * 0FB4F

_?_:
          $       "?"                            * 0FB54
          umEND                                  * 0FB60
        ;                                        * 0FB65
        NIBHEX  00000                            * 0FB6A  ..

* u u' -> u?
* refs (3): 1BCA8 1BCB2 1BCBC
UMMAX:
        ::                                       * 0FB6F
          2DUP                                   * 0FB74
          val(2uo)                               * 0FB79
          %>                                     * 0FB7E
          NOT?SWAPDROP                           * 0FB83
        ;                                        * 0FB88

* u u' -> u?
* refs (3): 1BD1A 1BD24 1BD2E
UMMIN:
        ::                                       * 0FB8D
          2DUP                                   * 0FB92
          val(2uo)                               * 0FB97
          %<                                     * 0FB9C
          NOT?SWAPDROP                           * 0FBA1
        ;                                        * 0FBA6

* u %percent -> u'
* refs (2): 1C097 1C0BF
UM%:
        ::                                       * 0FBAB
          SWAP                                   * 0FBB0
          dup;uo=>r                              * 0FBB5
          ROT                                    * 0FBBA
          _*(2r);r=>rr                           * 0FBBF
          %%1E2                                  * 0FBC4
          %%/>%                                  * 0FBC9
          Unbr>U                                 * 0FBCE
        ;                                        * 0FBD3
        BSS     10                               * 0FBD8

* refs (1): 0FDBD
OBJ_0FBE2:
        ::                                       * 0FBE2
          OBJ_0FBFB                              * 0FBE7
          case2DROP                              * 0FBEC
          CONSTUNITERR                           * 0FBF1
        ;                                        * 0FBF6

* refs (3): 0FBE7 0FCAA CAC6D
OBJ_0FBFB:
        ::                                       * 0FBFB
          2DUP                                   * 0FC00
          EQUAL                                  * 0FC05
          caseTRUE                               * 0FC0A
          %10                                    * 0FC0F
          MATRND                                 * 0FC14
          SWAP                                   * 0FC19
          %10                                    * 0FC1E
          MATRND                                 * 0FC23
          SWAP                                   * 0FC28
          2DUP                                   * 0FC2D
          EQUAL                                  * 0FC32
        ;                                        * 0FC37

* u u' -> %
* refs (3): 1C180 1C18A 1C194
UM%CH:
        ::                                       * 0FC3C
          OBJ_0F6C0                              * 0FC41
          OVER                                   * 0FC46
          %%-                                    * 0FC4B
L_0FC50:
          SWAP%%/                                * 0FC50
          %%1E2                                  * 0FC55
          %%*                                    * 0FC5A
          %%>%                                   * 0FC5F
          SWAPDROP                               * 0FC64
        ;                                        * 0FC69

* refs (2): 0F701 0F70B
OBJ_0FC6E:
        ::                                       * 0FC6E
          DUP                                    * 0FC73
          cfC                                    * 0FC78
          jEQcase                                * 0FC7D
          %%KZERO                                * 0FC82
          DUP                                    * 0FC87
          cfF                                    * 0FC8C
          jEQcase                                * 0FC91
          %%RZERO                                * 0FC96
          %%0                                    * 0FC9B
        ;                                        * 0FCA0

* refs (2): 0F3B7 0F729
OBJ_0FCA5:
        ::                                       * 0FCA5
          OBJ_0FBFB                              * 0FCAA
          case2DROP                              * 0FCAF
          ROMPTR  0C1 020                        * 0FCB4
        ;                                        * 0FCBF
        BSS     9                                * 0FCC4

* u u' -> %
* refs (3): 1C10E 1C118 1C122
UM%T:
        ::                                       * 0FCCD
          OBJ_0F6C0                              * 0FCD2
          GOTO                                   * 0FCD7
          L_0FC50                                * 0FCDC
        ;                                        * 0FCE1

* u -> %
* refs (1): 1B357
UMSIGN:
        ::                                       * 0FCE6
          CARCOMP                                * 0FCEB
          %SGN                                   * 0FCF0
        ;                                        * 0FCF5

* u -> u'
* refs (1): 1BB90
UMIP:
        ::                                       * 0FCFA
          PTR     UMOPER:                        * 0FCFF
          %IP                                    * 0FD04
        ;                                        * 0FD09

* u -> u'
* refs (1): 1BBC6
UMFP:
        ::                                       * 0FD0E
          PTR     UMOPER:                        * 0FD13
          %FP                                    * 0FD18
        ;                                        * 0FD1D

* u -> u'
* refs (1): 1BBFC
UMFLOOR:
        ::                                       * 0FD22
          PTR     UMOPER:                        * 0FD27
          %FLOOR                                 * 0FD2C
        ;                                        * 0FD31

* u -> u'
* refs (1): 1BC32
UMCEIL:
        ::                                       * 0FD36
          PTR     UMOPER:                        * 0FD3B
          %CEIL                                  * 0FD40
        ;                                        * 0FD45

* u -> u'
* refs (4): 0FCFF 0FD13 0FD27 0FD3B
UMOPER::
        ::                                       * 0FD4A
          DUP                                    * 0FD4F
          CARCOMP                                * 0FD54
          'REVAL                                 * 0FD59
          Unbr>U                                 * 0FD5E
        ;                                        * 0FD63

* u -> u'
* refs (1): 1BDAA
UMRND:
        ::                                       * 0FD68
          OVER                                   * 0FD6D
          CARCOMP                                * 0FD72
          SWAP                                   * 0FD77
          RNDXY                                  * 0FD7C
          Unbr>U                                 * 0FD81
        ;                                        * 0FD86

* u -> u'
* refs (1): 1BE26
UMTRC:
        ::                                       * 0FD8B
          OVER                                   * 0FD90
          CARCOMP                                * 0FD95
          SWAP                                   * 0FD9A
          TRCXY                                  * 0FD9F
          Unbr>U                                 * 0FDA4
        ;                                        * 0FDA9

* refs (2): 0F878 0F8FF
OBJ_0FDAE:
        ::                                       * 0FDAE
          U>NCQ                                  * 0FDB3
          OBJ_3835E                              * 0FDB8
          OBJ_0FBE2                              * 0FDBD
          %%*                                    * 0FDC2
          %%>%                                   * 0FDC7
        ;                                        * 0FDCC

* refs (5): B6166 B617B B6195 B61B3 B6204
OBJ_0FDD1:
        ::                                       * 0FDD1
          %0_2A2B4                               * 0FDD6
          %1                                     * 0FDDB
        ;                                        * 0FDE0

* refs (4): 0F376 0F38A 0F6C5 0F6D4
OBJ_0FDE5:
        ::                                       * 0FDE5
          dup;r?:dq/sk                           * 0FDEA
          OBJ_0FE08                              * 0FDEF
          DUP                                    * 0FDF4
          GOTO                                   * 0FDF9
          L_0FE6C                                * 0FDFE
        ;                                        * 0FE03

* refs (1): 0FDEF
OBJ_0FE08:
        ::                                       * 0FE08
          %0=case                                * 0FE0D
          ::                                     * 0FE12
            OVER                                 * 0FE17
            UM>U                                 * 0FE1C
            DUP                                  * 0FE21
            GOTO                                 * 0FE26
            L_0FE6C                              * 0FE2B
          ;                                      * 0FE30
          DUP                                    * 0FE35
          OBJ_0FE53                              * 0FE3A
        ;                                        * 0FE3F

* u -> n%% cf%% qhxs
* refs (11): 0F959 0FDB3 0FF52 0FFD4 10B95 9C58C ...
U>NCQ:
        ::                                       * 0FE44
          DUPTYPEEXT?                            * 0FE49
          NOTcase                                * 0FE4E

* refs (1): 0FE3A
OBJ_0FE53:
          ::                                     * 0FE53
            %>%%                                 * 0FE58
            %%1                                  * 0FE5D
            OBJ_3835E                            * 0FE62
          ;                                      * 0FE67
L_0FE6C:
          >R                                     * 0FE6C
L_0FE71:
          ticR                                   * 0FE71
          NOT?SEMI                               * 0FE76
          OBJ_0FE8F                              * 0FE7B
          GOTO                                   * 0FE80
          L_0FE71                                * 0FE85
        ;                                        * 0FE8A

* refs (1): 0FE7B
OBJ_0FE8F:
        ::                                       * 0FE8F
          DUPTYPECHAR?                           * 0FE94
          case                                   * 0FE99
          OBJ_0C24C                              * 0FE9E
          REQcasedrop                            * 0FEA3
          um*                                    * 0FEA8
          OBJ_10C22                              * 0FEAD
          REQcasedrop                            * 0FEB2
          um/                                    * 0FEB7
          OBJ_10C3B                              * 0FEBC
          REQcasedrop                            * 0FEC1
          umP                                    * 0FEC6
          OBJ_10CA9                              * 0FECB
          REQcasedrop                            * 0FED0
          um^                                    * 0FED5
          OBJ_10C59                              * 0FEDA
          REQcasedrop                            * 0FEDF
          umEND                                  * 0FEE4
          OBJ_10CC2                              * 0FEE9
          DUPTYPECSTR?                           * 0FEEE
          NOT?SEMI                               * 0FEF3
          OBJ_0C3A3                              * 0FEF8
          case                                   * 0FEFD
          SWAP                                   * 0FF02
          DUP$>ID                                * 0FF07
          OBJ_0FFF2                              * 0FF0C
          NOT?GOTO                               * 0FF11
          L_0FF66                                * 0FF16
          DUPTYPEREAL?                           * 0FF1B
          case                                   * 0FF20
          ::                                     * 0FF25
            SWAPDROP                             * 0FF2A
            %>%%                                 * 0FF2F
            OBJ_3835E                            * 0FF34
          ;                                      * 0FF39
          DUPTYPEEXT?                            * 0FF3E
          case                                   * 0FF43
          ::                                     * 0FF48
            SWAPDROP                             * 0FF4D
            U>NCQ                                * 0FF52
            OBJ_10CA9                            * 0FF57
          ;                                      * 0FF5C
          DROP                                   * 0FF61
L_0FF66:
          DUP                                    * 0FF66
          CAR$                                   * 0FF6B
          OBJ_0C2CD                              * 0FF70
          NOTcase                                * 0FF75
          INVUNITERR                             * 0FF7A
          OBJ_0C24C                              * 0FF7F
          SWAP                                   * 0FF84
          CDR$                                   * 0FF89
          $>ID                                   * 0FF8E
          OBJ_0FFF2                              * 0FF93
          NOTcase                                * 0FF98
          INVUNITERR                             * 0FF9D
          DUPTYPEREAL?                           * 0FFA2
          case                                   * 0FFA7
          ::                                     * 0FFAC
            %>%%                                 * 0FFB1
            %%*                                  * 0FFB6
            OBJ_3835E                            * 0FFBB
          ;                                      * 0FFC0
          DUPTYPEEXT?                            * 0FFC5
          NOTcase                                * 0FFCA
          INVUNITERR                             * 0FFCF
          U>NCQ                                  * 0FFD4
          4UNROLL                                * 0FFD9
          %%*                                    * 0FFDE
          %%*SWAP                                * 0FFE3
          TOTEMPOB                               * 0FFE8
        ;                                        * 0FFED

* refs (2): 0FF0C 0FF93
OBJ_0FFF2:
        ::                                       * 0FFF2
          COMPILEID                              * 0FFF7
          NOTcsdrpfls                            * 0FFFC
          DUPTYPEIDNT?                           * 10001
          case                                   * 10006
          SAFE@                                  * 1000B
          DUPTYPEROMP?                           * 10010
          case                                   * 10015
          ROMPTR@                                * 1001A
          DROPFALSE                              * 1001F
        ;                                        * 10024
