* HP 48GX ROM revision R, #B7B7D-#BA575: Library part 0B5
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #B7B7D in the original ROM).
        RPL

* ROMPTR 0B5 0D8
* refs (1): B4B39
ROMP_0B5_0D8:
        :: BINT2 NTHCOMPDROP DUP MINUSONE EQUAL casedrop NULL$ * B7B7D
        ;                                        * B7BA5

* ROMPTR 0B5 0D9
* refs (1): B4B39
ROMP_0B5_0D9:
        :: CARCOMP Ticks>TOD ROMPTR 0B5 0A4 ;    * B7BAA

* ROMPTR 0B5 0DA
* refs (1): B4B39
ROMP_0B5_0DA:
        :: CARCOMP Ticks>Date ROMPTR 0B5 0A7 ;   * B7BC9

* ROMPTR 0B5 0DB
* refs (1): B4B39
ROMP_0B5_0DB:
        ::                                       * B7BE8
          :: CARCOMP Ticks>Rpt ROMPTR 0B5 0C8 OVER %<= case * B7BED
            :: ROMPTR 0B5 0C8 %/ BINT1 ;         * B7C16
            ROMPTR 0B5 0CA OVER %<= case         * B7C35
            :: ROMPTR 0B5 0CA %/ BINT2 ;         * B7C4F
            ROMPTR 0B5 0CC OVER %<= case         * B7C6E
            :: ROMPTR 0B5 0CC %/ BINT3 ;         * B7C88
            ROMPTR 0B5 0CE OVER %<= case         * B7CA7
            :: ROMPTR 0B5 0CE %/ BINT4 ;         * B7CC1
            ROMPTR 0B5 0D0 %/ BINT5 ;            * B7CE0
          ROMPTR 0B5 0C6 SWAP NTHCOMPDROP ;      * B7CFA

* ROMPTR 0B5 0DC
* refs (1): B4B39
ROMP_0B5_0DC:
        :: ALARMS@ NTHOF DUP#0=csDROP UNCOERCE DELALARM ; * B7D14

* ROMPTR 0B5 0DD
* refs (1): B4B39
ROMP_0B5_0DD:
        :: Exist@äDAT? NOTcase MINUSONE          * B7D37
          OBJ_2D252 ;                            * B7D4B

* ROMPTR 0B5 0DE
* refs (1): B4B39
ROMP_0B5_0DE:
        :: ROMPTR 0B5 011 STATCLST å- ;          * B7D55

* ROMPTR 0B5 0DF
* refs (1): B4B39
ROMP_0B5_0DF:
        :: ChkReakäPAR 5UNROLL 4DROP             * B7D74
          { xLINFIT ROMPTR 0B5 0F6 xLOGFIT ROMPTR 0B5 0F7 xEXPFIT * B7D88
            ROMPTR 0B5 0F8 xPWRFIT ROMPTR 0B5 0F9 xBESTFIT ROMPTR 0B5 0FA } * B7DB2
          EQLookup DROP ;                        * B7DE2

* ROMPTR 0B5 0E0
* refs (1): B4B39
~ChkReakäPAR;3DROP:
        :: ChkReakäPAR 3DROP ;                   * B7DF1

* ROMPTR 0B5 0E1
* refs (1): B4B39
~STATCOL:
        :: STATCOL ;                             * B7E05

* ROMPTR 0B5 0E2
* refs (1): B4B39
ROMP_0B5_0E2:
        :: DROP OBJ_2C9EF ColumnMEAN ;           * B7E14

* ROMPTR 0B5 0E3
* refs (1): B4B39
ROMP_0B5_0E3:
        :: SWAP OBJ_2C9EF ROT ITE ColumnTDEV OBJ_2CD27 * B7E2D
        ;                                        * B7E50

* ROMPTR 0B5 0E4
* refs (1): B4B39
ROMP_0B5_0E4:
        :: SWAP OBJ_2C9EF ROT ITE ColumnVAR OBJ_2CD1B * B7E55
        ;                                        * B7E78

* ROMPTR 0B5 0E5
* refs (1): B4B39
ROMP_0B5_0E5:
        :: DROP OBJ_2C9EF ColumnTOT ;            * B7E7D

* ROMPTR 0B5 0E6
* refs (1): B4B39
ROMP_0B5_0E6:
        :: DROP OBJ_2C9EF ColumnMAX ;            * B7E96

* ROMPTR 0B5 0E7
* refs (1): B4B39
ROMP_0B5_0E7:
        :: DROP OBJ_2C9EF ColumnMIN ;            * B7EAF

* ROMPTR 0B5 0E8
* refs (1): B4B39
~4ROLLDROP;SWAP;bins(3r):
        :: 4ROLLDROP SWAP bins(3r) ;             * B7EC8

* ROMPTR 0B5 0E9
* refs (1): B4B39
ROMP_0B5_0E9:
        :: OBJ_48BBB STATCORR STATCOV ;          * B7EE1

* ROMPTR 0B5 0EA
* refs (1): B4B39
~STATPREDX:
        :: STATPREDX ;                           * B7EFA

* ROMPTR 0B5 0EB
* refs (1): B4B39
~STATPREDY:
        :: STATPREDY ;                           * B7F09

* ROMPTR 0B5 0EC
* refs (1): B4B39
~STATX:
        :: STATX ;                               * B7F18

* ROMPTR 0B5 0ED
* refs (1): B4B39
~STATY:
        :: STATY ;                               * B7F27

* ROMPTR 0B5 0EE
* refs (1): B4B39
~STATXX:
        :: STATXX ;                              * B7F36

* ROMPTR 0B5 0EF
* refs (1): B4B39
~STATYY:
        :: STATYY ;                              * B7F45

* ROMPTR 0B5 0F0
* refs (1): B4B39
~STATXY:
        :: STATXY ;                              * B7F54

* ROMPTR 0B5 0F1
* refs (1): B4B39
~STATN:
        :: STATN ;                               * B7F63

* ROMPTR 0B5 0F2
* refs (1): B4B39
ROMP_0B5_0F2:
        { ROMPTR 0B5 0F3 ROMPTR 0B5 0F4 }        * B7F72

* ROMPTR 0B5 0F3
* refs (1): B4B39
ROMP_0B5_0F3:
        { # BB17 TRUE }                          * B7F92

* ROMPTR 0B5 0F4
* refs (1): B4B39
ROMP_0B5_0F4:
        { # BB18 FALSE }                         * B7FAB

* ROMPTR 0B5 0F5
* refs (1): B4B39
ROMP_0B5_0F5:
        { ROMPTR 0B5 0F6 ROMPTR 0B5 0F7 ROMPTR 0B5 0F8 ROMPTR 0B5 0F9 * B7FC4
          ROMPTR 0B5 0FA }                       * B7FF5

* ROMPTR 0B5 0F6
* refs (1): B4B39
ROMP_0B5_0F6:
        { # BB3B xLINFIT }                       * B8005

* ROMPTR 0B5 0F7
* refs (1): B4B39
ROMP_0B5_0F7:
        { # BB3C xLOGFIT }                       * B801E

* ROMPTR 0B5 0F8
* refs (1): B4B39
ROMP_0B5_0F8:
        { # BB3D xEXPFIT }                       * B8037

* ROMPTR 0B5 0F9
* refs (1): B4B39
ROMP_0B5_0F9:
        { # BB3E xPWRFIT }                       * B8050

* ROMPTR 0B5 0FA
* refs (1): B4B39
ROMP_0B5_0FA:
        { # BB3F xBESTFIT }                      * B8069

* ROMPTR 0B5 0FB
* refs (1): B4B39
ROMP_0B5_0FB:
        :: ROMPTR 0B5 0FE                        * B8082

* ROMPTR 0B5 0FC
* refs (1): B4B39
ROMP_0B5_0FC:
          :: ROMPTR 0B5 11E BINT6 {}N DUP BINT33 TestSysFlag BINT35 * B8092
            TestSysFlag 3NULLLAM{} BIND INCOMPDROP SWAPDROP %3 SWAP * B80C0
            6->list;StoInIPAR BINT33 SetSysFlag BINT35 SetSysFlag ; * B80E3
          ERRSET                                 * B8101
          :: DUPTYPELIST? ITE SENDLIST SENDNAME  * B8106
          ;                                      * B811F
          ERRTRAP                                * B8124
          :: ROMPTR 0B5 0FD ERRJMP ;             * B8129

* ROMPTR 0B5 0FD
* refs (1): B4B39
ROMP_0B5_0FD:
          :: 1GETLAM BINT35 ROMPTR 0B5 11B 2GETLAM BINT33 ROMPTR 0B5 11B * B8143
            3GETLAM StoIOPAR ABND ;              * B8172
        ;                                        * B8186

* ROMPTR 0B5 0FE
* refs (1): B4B39
ROMP_0B5_0FE:
        :: MINUSONE OVER EQUAL casedrop ROMPTR 0E7 007 * B818B
        ;                                        * B81AF

* ROMPTR 0B5 0FF
* refs (1): B4B39
ROMP_0B5_0FF:
        :: ROMPTR 0B5 0FC ERRSET                 * B81B4
          :: NULL$TEMP DORECN ; ERRTRAP          * B81C9
          :: ROMPTR 0B5 0FD ERRJMP ; ROMPTR 0B5 0FD ; * B81E2

* ROMPTR 0B5 100
* refs (1): B4B39
ROMP_0B5_100:
        :: BINT34 TestSysFlag ITE ROMPTR 0B5 121 ROMPTR 0B5 120 * B820C
        ;                                        * B8236

* ROMPTR 0B5 101
* refs (1): B4B39
ROMP_0B5_101:
        :: ROMPTR 0B0 09A DUP ?SKIP              * B823B
          :: BINT33 ClrSysFlag ;                 * B8255
          NOT BINT34 ROMPTR 0B5 11B ;            * B8269

* ROMPTR 0B5 102
* refs (1): B4B39
ROMP_0B5_102:
        :: ROMPTR 0B5 0FE DODELAY ;              * B8283

* ROMPTR 0B5 103
* refs (1): B4B39
ROMP_0B5_103:
        :: ROMPTR 0B5 11C #3- NDROP SWAPDROP DUPTYPEREAL? NOTcasedrop %80 * B829D
          SWAP DUPTYPEREAL? NOTcasedrop %1.8     * B82CB
          SWAP ;                                 * B82DF

* ROMPTR 0B5 104
* refs (1): B4B39
~BINT38;TestSysFlag;NOT:
        :: BINT38 TestSysFlag NOT ;              * B82E9

* ROMPTR 0B5 105
* refs (1): B4B39
ROMP_0B5_105:
        :: NOT BINT38 ROMPTR 0B5 11B ;           * B8302

* ROMPTR 0B5 106
* refs (1): B4B39
ROMP_0B5_106:
        :: ROMPTR 0B5 0FE DUP %1 %>= ?SKIP       * B8321
          :: DROP %80 ;                          * B8345
          ROMPTR 0B5 11C DUP#1- ROLLDROP DUP#1+ ROLL OBJ_6DCE7 UNROLL {}N * B8359
          StoPRTPAR ;                            * B8387

* ROMPTR 0B5 107
* refs (1): B4B39
ROMP_0B5_107:
        :: DUP MINUSONE EQUAL casedrop DOCR      * B8391
          pr1 DROP ;                             * B83AF

* ROMPTR 0B5 108
* refs (1): B4B39
ROMP_0B5_108:
        :: BINT33 TestSysFlag ITE ROMPTR 0B5 120 ROMPTR 0B5 121 * B83BE
        ;                                        * B83E8

* ROMPTR 0B5 109
* refs (1): B4B39
ROMP_0B5_109:
        :: ROMPTR 0B0 09A BINT33 ROMPTR 0B5 11B ; * B83ED

* ROMPTR 0B5 10A
* refs (1): B4B39
ROMP_0B5_10A:
        :: ROMPTR 0B5 12C BINT35 TestSysFlag ITE BINT2 BINT1 * B8412
          NTHCOMPDROP ;                          * B843B

* ROMPTR 0B5 10B
* refs (1): B4B39
ROMP_0B5_10B:
        :: ROMPTR 0B0 09A NOT BINT35 ROMPTR 0B5 11B ; * B8445

* ROMPTR 0B5 10C
* refs (1): B4B39
ROMP_0B5_10C:
        :: ROMPTR 0B5 11E ROMPTR 0B5 12F SWAP DUPTYPEREAL? ITE COERCE * B846F
          DROPONE                                * B849E
          DUP BINT3 #> IT DROPONE                * B84A3
          #1+ NTHCOMPDROP ROMPTR 0B5 134 ROT     * B84BC
          :: DUPTYPEREAL? NOTcasedrop BINT3      * B84D6
            OBJ_2ED74 NOTcasedrop BINT3          * B84EA
            COERCE ;                             * B84F9
          NTHCOMPDROP ROTDROPROTDROP 4ROLL       * B8503
          :: DUPTYPEREAL? NOTcasedrop %9600      * B8512
            %IP># s=okBaud? NOTcasedrop %9600    * B8526
            UNCOERCE ;                           * B853A
          ROMPTR 0B5 126 5ROLL                   * B8544
          :: DUPTYPEREAL? NOTcasedrop BINT1      * B8554
            %IP># DUP BINT4 #>case DROPONE       * B8568
            #1+ ;                                * B8581
          NTHCOMPDROP ;                          * B858B

* ROMPTR 0B5 10D
* refs (1): B4B39
ROMP_0B5_10D:
        :: ROMPTR 0B0 09A 4ROLL ROMPTR 0B0 09A 4UNROLL ROMPTR 0B5 11E DROP * B8595
          7UNROLL ROTDROPROTDROP 6ROLL DUPTYPEBINT? ITE * B85CA
          :: DROP 5ROLL ;                        * B85E3
          :: 6ROLL DROP ROMPTR 0B0 099 ;         * B85F7
          6ROLL 6->list;StoInIPAR ;              * B8616

* ROMPTR 0B5 10E
* refs (1): B4B39
~BINT36;TestSysFlag:
        :: BINT36 TestSysFlag ;                  * B8625

* ROMPTR 0B5 10F
* refs (1): B4B39
ROMP_0B5_10F:
        :: BINT36 ROMPTR 0B5 11B ;               * B8639

* ROMPTR 0B5 110
* refs (1): B4B39
ROMP_0B5_110:
        :: $ "DIR /W" $ "C" ROMPTR 0B5 115 '     * B8653
          CODE                                   * B868A  143 nibbles
            GOSBVL  POP#                         * B8694
            GOSBVL  SAVPTR                       * B869B
            C=0     A                            * B86A2
            R0=C                                 * B86A4
            GOSBVL  GetStrLenStk                 * B86A7
            ?C<A    A                            * B86AE
            GOYES   L_B86E5                      * B86B1
            D=C     A                            * B86B3
            A=A-1   A                            * B86B5
            B=A     A                            * B86B7
            CD1EX                                * B86B9
            A=A+A   A                            * B86BC
            C=C+A   A                            * B86BE
            D1=C                                 * B86C0
            ST=0    4                            * B86C3
L_B86C6:
            GOSUB   SUB_B86EE                    * B86C6
            GOC     L_B86C6                      * B86CA
            C=B     A                            * B86CD
            R0=C                                 * B86CF
L_B86D2:
            GOSUB   SUB_B86EE                    * B86D2
            GONC    L_B86D2                      * B86D6
            C=B     A                            * B86D9
            R1=C                                 * B86DB
            GOVLNG  Push2#Loop                   * B86DE
L_B86E5:
            A=0     A                            * B86E5
            GOVLNG  PUSH#ALOOP                   * B86E7

* refs (2): B86C6 B86D2
SUB_B86EE:
            D=D-1   A                            * B86EE
            GOC     L_B86E5                      * B86F0
            B=B+1   A                            * B86F3
            A=DAT1  B                            * B86F5
            D1=D1+  2                            * B86F8
            LC(2)   #20                          * B86FB
            ?C=A    B                            * B86FF
            GOYES   L_B871C                      * B8702
            LC(2)   #09                          * B8704
            ?C=A    B                            * B8708
            GOYES   L_B871C                      * B870B
            C=C+1   A                            * B870D
            ST=1    4                            * B870F
            ?C=A    B                            * B8712
            RTNYES                               * B8715
            ST=0    4                            * B8717
            RTNCC                                * B871A
L_B871C:
            ?ST=1   4                            * B871C
            GOYES   L_B86E5                      * B871F
            RTNSC                                * B8721
          ENDCODE                                * B8723
          2NULLLAM{} BIND 2GETLAM $ ":\\" BINT1 POS$ DUP#0=csedrp * B8723
          :: NULL$ NULL{} ABND ; #1- 2GETLAM NEWLINE$ 3PICK POS$ DUP#0=case * B874F
          :: 2DROP NULL$ NULL{} ABND ;           * B8786
          DUPUNROT 2GETLAM 3UNROLL #1-SUB$ BINT0 ROT BEGIN 2GETLAM SWAP * B87A4
          1GETLAM EVAL DUP#0<> WHILE             * B87D1
          :: DUP4UNROLL #1-SUB$ DUP $ "$KERMIT$.TMP" EQUAL ITE DROP * B87E5
            :: ROT#1+ ROT ;                      * B882A
          ;                                      * B883E
          REPEAT 2DROP {}N ABND ;                * B8843

* ROMPTR 0B5 111
* refs (1): B4B39
ROMP_0B5_111:
        :: ' NOT ROMPTR 0B5 113 ;                * B885C

* ROMPTR 0B5 112
* refs (1): B4B39
ROMP_0B5_112:
        :: ' NOP ROMPTR 0B5 113 ;                * B887B

* ROMPTR 0B5 113
* refs (1): B4B39
ROMP_0B5_113:
        :: SWAP DUPNULL{}? case SWAPDROP         * B889A
          INNERDUP ZERO_DO SWAP ROMPTR 0B5 114 SWAPDROP 3PICK #3+PICK EVAL * B88B3
          ITE                                    * B88E1
          :: OVER #1+UNROLL ;                    * B88E6
          :: DROP #1- ;                          * B88FA
          LOOP {}N SWAPDROP ;                    * B890E

* ROMPTR 0B5 114
* refs (1): B4B39
ROMP_0B5_114:
        :: DUP CAR$ CHR_[ EQUAL SWAP DUPLEN$ 2DUP SUB$1# # 5D #= 4ROLL AND ; * B8922

* ROMPTR 0B5 115
* refs (1): B4B39
ROMP_0B5_115:
        :: GetIOPAR RCLSYSF 2NULLLAM{} BIND BINT39 ERRSET SetSysFlag %1 * B896D
          6->list;StoInIPAR %1 3UNROLL DOPKT ERRTRAP * B899A
          :: GetIOPAR DROP 2GETLAM 6->list;StoInIPAR 1GETABND STOSYSF ERRJMP ; * B89B3
          GetIOPAR DROP 2GETLAM 6->list;StoInIPAR 1GETABND STOSYSF * B89E0
          DUPTYPECSTR? ITE SWAPDROP DROPNULL$    * B89FE
        ;                                        * B8A12

* ROMPTR 0B5 116
* refs (1): B4B39
ROMP_0B5_116:
        :: ROMPTR 0B5 114 IT                     * B8A17
          :: SWAP BINT2 3PICK #1-SUB$ SWAP #2- ; * B8A2C
          BINT32 #+ #>CHR >H$ CHR_C >H$ $ "G" ROMPTR 0B5 115 DROP ; * B8A54

* ROMPTR 0B5 117
* refs (1): B4B39
ROMP_0B5_117:
        :: ROMPTR 0B5 0FE DUPTYPELIST? ITE kget(li) GETNAME * B8A93
        ;                                        * B8AB7

* ROMPTR 0B5 118
* refs (1): B4B39
~NULL$TEMP;DORECN:
        :: NULL$TEMP DORECN ;                    * B8ABC

* ROMPTR 0B5 119
* refs (1): B4B39
ROMP_0B5_119:
        :: SWAP ROMPTR 0B5 0FE SWAP ITE ROMPTR 0AB 05F * B8AD0  XRECV
          ROMPTR 0AB 05E                         * B8AFA  XSEND
          AtUserStack ;                          * B8B05

* ROMPTR 0B5 11A
* refs (1): B4B39
ROMP_0B5_11A:
        :: ROMPTR 0B5 0FE DUPTYPELIST? ITE SENDLIST SENDNAME * B8B0F
        ;                                        * B8B33

* ROMPTR 0B5 11B
* refs (1): B4B39
ROMP_0B5_11B:
        :: SWAP ITE SetSysFlag ClrSysFlag        * B8B38
        ;                                        * B8B51

* ROMPTR 0B5 11C
* refs (1): B4B39
ROMP_0B5_11C:
        :: ' ID PRTPAR Sys@ NOTcase Reset&BreakPRTPAR * B8B56
          DUPTYPELIST? NOTcasedrop Reset&BreakPRTPAR * B8B82
          INNERDUP BINT3 #> NOTcase              * B8B91
          :: NDROP Reset&BreakPRTPAR ;           * B8BA5
        ;                                        * B8BB9

* ROMPTR 0B5 11D
* refs (1): B4B39
~Reset&BreakPRTPAR;DROP:
        :: Reset&BreakPRTPAR DROP ;              * B8BBE

* ROMPTR 0B5 11E
* refs (1): B4B39
ROMP_0B5_11E:
        :: ' ID IOPAR Sys@ NOTcase ResetIOPAR&-> * B8BD2
          DUPTYPELIST? NOTcasedrop ResetIOPAR&-> * B8BFC
          DUPLENCOMP BINT6 #<> casedrop ResetIOPAR&-> * B8C0B
          INCOMPDROP ;                           * B8C24

* ROMPTR 0B5 11F
* refs (1): B4B39
ROMP_0B5_11F:
        { ROMPTR 0B5 120 ROMPTR 0B5 121 }        * B8C2E

* ROMPTR 0B5 120
* refs (1): B4B39
ROMP_0B5_120:
        { # BA2C # BA2D TRUE }                   * B8C4E

* ROMPTR 0B5 121
* refs (1): B4B39
ROMP_0B5_121:
        { # BA2E # BA2E FALSE }                  * B8C71

* ROMPTR 0B5 122
* refs (1): B4B39
ROMP_0B5_122:
        { ROMPTR 0B5 123 ROMPTR 0B5 124 }        * B8C94

* ROMPTR 0B5 123
* refs (1): B4B39
ROMP_0B5_123:
        { # BA2F TRUE }                          * B8CB4

* ROMPTR 0B5 124
* refs (1): B4B39
ROMP_0B5_124:
        { # BA30 FALSE }                         * B8CCD

* ROMPTR 0B5 125
* refs (1): B4B39
ROMP_0B5_125:
        { %1200 %2400 %4800 %9600 }              * B8CE6

* ROMPTR 0B5 126
* refs (1): B4B39
ROMP_0B5_126:
        { ROMPTR 0B5 127 ROMPTR 0B5 128 ROMPTR 0B5 129 ROMPTR 0B5 12A * B8D04
          ROMPTR 0B5 12B }                       * B8D35

* ROMPTR 0B5 127
* refs (1): B4B39
ROMP_0B5_127:
        { # BA3A # BA3A %0_2A2B4 }               * B8D45

* ROMPTR 0B5 128
* refs (1): B4B39
ROMP_0B5_128:
        { # BA31 # BA31 %1 }                     * B8D68

* ROMPTR 0B5 129
* refs (1): B4B39
ROMP_0B5_129:
        { # BA32 # BA32 %2 }                     * B8D8B

* ROMPTR 0B5 12A
* refs (1): B4B39
ROMP_0B5_12A:
        { # BA33 # BA33 %3 }                     * B8DAE

* ROMPTR 0B5 12B
* refs (1): B4B39
ROMP_0B5_12B:
        { # BA34 # BA35 %4 }                     * B8DD1

* ROMPTR 0B5 12C
* refs (1): B4B39
ROMP_0B5_12C:
        { ROMPTR 0B5 12D ROMPTR 0B5 12E }        * B8DF4

* ROMPTR 0B5 12D
* refs (1): B4B39
ROMP_0B5_12D:
        { # BA36 # BA37 TRUE }                   * B8E14

* ROMPTR 0B5 12E
* refs (1): B4B39
ROMP_0B5_12E:
        { # BA38 # BA39 FALSE }                  * B8E37

* ROMPTR 0B5 12F
* refs (1): B4B39
ROMP_0B5_12F:
        { ROMPTR 0B5 130 ROMPTR 0B5 131 ROMPTR 0B5 132 ROMPTR 0B5 133 } * B8E5A

* ROMPTR 0B5 130
* refs (1): B4B39
ROMP_0B5_130:
        { # BA3A # BA3A %0_2A2B4 }               * B8E90

* ROMPTR 0B5 131
* refs (1): B4B39
ROMP_0B5_131:
        { # BA3B # BA3C %1 }                     * B8EB3

* ROMPTR 0B5 132
* refs (1): B4B39
ROMP_0B5_132:
        { # BA3D # BA3E %2 }                     * B8ED6

* ROMPTR 0B5 133
* refs (1): B4B39
ROMP_0B5_133:
        { # BA40 # BA3F %3 }                     * B8EF9

* ROMPTR 0B5 134
* refs (1): B4B39
ROMP_0B5_134:
        { ROMPTR 0B5 135 ROMPTR 0B5 136 ROMPTR 0B5 137 } * B8F1C

* ROMPTR 0B5 135
* refs (1): B4B39
ROMP_0B5_135:
        { # BA41 %1 }                            * B8F47

* ROMPTR 0B5 136
* refs (1): B4B39
ROMP_0B5_136:
        { # BA42 %2 }                            * B8F60

* ROMPTR 0B5 137
* refs (1): B4B39
ROMP_0B5_137:
        { # BA43 %3 }                            * B8F79

* ROMPTR 0B5 138
* refs (1): B4B39
ROMP_0B5_138:
        :: ROMPTR 0B5 143 NumbMode #1+ NTHCOMPDROP * B8F92

* ROMPTR 0B5 139
* refs (1): B4B39
ROMP_0B5_139:
          CODE                                   * B8FB1  27 nibbles
            GOSBVL  SAVPTR                       * B8FBB
            A=0     A                            * B8FC2
            D0=(5)  #8084E                       * B8FC4
            A=DAT0  1                            * B8FCB
            GOVLNG  PUSH#ALOOP                   * B8FCF
          ENDCODE                                * B8FD6
          UNCOERCE ;                             * B8FD6

* ROMPTR 0B5 13A
* refs (1): B4B39
ROMP_0B5_13A:
        :: DEG? case ROMPTR 0B5 14A              * B8FE0
          RAD? case ROMPTR 0B5 14B               * B8FFA
          ROMPTR 0B5 14C ;                       * B900F

* ROMPTR 0B5 13B
* refs (1): B4B39
ROMP_0B5_13B:
        :: BINT16 TestSysFlag NOTcase ROMPTR 0B5 14E * B901F
          BINT15 TestSysFlag NOTcase ROMPTR 0B5 14F * B903E
          ROMPTR 0B5 150 ;                       * B9058

* ROMPTR 0B5 13C
* refs (1): B4B39
~BINT56;TestSysFlag;NOT:
        :: BINT56 TestSysFlag NOT ;              * B9068

* ROMPTR 0B5 13D
* refs (1): B4B39
ROMP_0B5_13D:
        :: BINT56 SWAP ITE ClrSysFlag SetSysFlag * B9081
        ;                                        * B909F

* ROMPTR 0B5 13E
* refs (1): B4B39
~BINT40;TestSysFlag:
        :: BINT40 TestSysFlag ;                  * B90A4

* ROMPTR 0B5 13F
* refs (1): B4B39
ROMP_0B5_13F:
        :: BINT40 SWAP ITE SetSysFlag ClrSysFlag * B90B8
        ;                                        * B90D6

* ROMPTR 0B5 140
* refs (1): B4B39
~BINT51;TestSysFlag:
        :: BINT51 TestSysFlag ;                  * B90DB

* ROMPTR 0B5 141
* refs (1): B4B39
ROMP_0B5_141:
        :: BINT51 SWAP ITE SetSysFlag ClrSysFlag * B90EF
        ;                                        * B910D

* ROMPTR 0B5 142
* refs (1): B4B39
ROMP_0B5_142:
        :: ROMPTR 0B0 09A                        * B9112
          { SETDEG xDEG SETRAD xRAD SETGRAD xGRAD } EQLookup DROP BINT1 ::N ; * B9122

* ROMPTR 0B5 143
* refs (1): B4B39
ROMP_0B5_143:
        { ROMPTR 0B5 144 ROMPTR 0B5 145 ROMPTR 0B5 146 ROMPTR 0B5 147 } * B9163

* ROMPTR 0B5 144
* refs (1): B4B39
ROMP_0B5_144:
        { # B924 # B925                          * B9199
          :: DROP DOSTD ; }                      * B91B2

* ROMPTR 0B5 145
* refs (1): B4B39
ROMP_0B5_145:
        { # B926 # B927 DOFIX }                  * B91CB

* ROMPTR 0B5 146
* refs (1): B4B39
ROMP_0B5_146:
        { # B928 # B929 DOSCI }                  * B91EE

* ROMPTR 0B5 147
* refs (1): B4B39
ROMP_0B5_147:
        { # B92A # B92B DOENG }                  * B9211

* ROMPTR 0B5 148
* refs (1): B4B39
ROMP_0B5_148:
        { %0_2A2B4 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 } * B9234

* ROMPTR 0B5 149
* refs (1): B4B39
ROMP_0B5_149:
        { ROMPTR 0B5 14A ROMPTR 0B5 14B ROMPTR 0B5 14C } * B927F

* ROMPTR 0B5 14A
* refs (1): B4B39
ROMP_0B5_14A:
        { # B92C # B92D SETDEG }                 * B92AA

* ROMPTR 0B5 14B
* refs (1): B4B39
ROMP_0B5_14B:
        { # B92E # B92F SETRAD }                 * B92CD

* ROMPTR 0B5 14C
* refs (1): B4B39
ROMP_0B5_14C:
        { # B930 # B931 SETGRAD }                * B92F0

* ROMPTR 0B5 14D
* refs (1): B4B39
ROMP_0B5_14D:
        { ROMPTR 0B5 14E ROMPTR 0B5 14F ROMPTR 0B5 150 } * B9313

* ROMPTR 0B5 14E
* refs (1): B4B39
ROMP_0B5_14E:
        { # B932 ROMPTR 0B5 151 }                * B933E

* ROMPTR 0B5 14F
* refs (1): B4B39
ROMP_0B5_14F:
        { # B933 ROMPTR 0B5 152 }                * B935D

* ROMPTR 0B5 150
* refs (1): B4B39
ROMP_0B5_150:
        { # B934 ROMPTR 0B5 153 }                * B937C

* ROMPTR 0B5 151
* refs (1): B4B39
~BINT16;ClrSysFlag:
        :: BINT16 ClrSysFlag ;                   * B939B

* ROMPTR 0B5 152
* refs (1): B4B39
ROMP_0B5_152:
        :: BINT15 ClrSysFlag BINT16 SetSysFlag ; * B93AF

* ROMPTR 0B5 153
* refs (1): B4B39
ROMP_0B5_153:
        :: BINT15 SetSysFlag BINT16 SetSysFlag ; * B93CD

* ROMPTR 0B5 154
* refs (1): B4B39
ROMP_0B5_154:
        $ "\01\02\03\0E\13\14\15\16\1B\1C\1D\1F !\"#$%&'()*+,3456789:;<=>?" * B93EB

* ROMPTR 0B5 155
* refs (1): B4B39
ROMP_0B5_155:
        # 26                                     * B9441  38

* ROMPTR 0B5 156
* refs (1): B4B39
ROMP_0B5_156:
        :: ROMPTR 0B5 154 SWAP SUB$1# ;          * B944B

* ROMPTR 0B5 157
* refs (1): B4B39
ROMP_0B5_157:
        :: DUP ROMPTR 0B4 1D5 ITE # B95C # B936  * B946A
          ROMPTR 0B5 154 ROT #>CHR BINT1 POS$ #1-+ JstGetTHEMESG ; * B9498

* ROMPTR 0B5 158
* refs (1): B4B39
ROMP_0B5_158:
        :: ;                                     * B94C6

* ROMPTR 0B5 159
* refs (1): B4B39
ROMP_0B5_159:
        :: DUPTYPELIST? ?SKIP ONE{}N             * B94D0
          ' ROMPTR 0B5 15A BINT1 MINUSONE ROMPTR 0B4 1DB DUP BINT1 psh #1+ * B94E4
          NDROP ;                                * B951D

* ROMPTR 0B5 15A
* refs (1): B4B39
ROMP_0B5_15A:
        :: 3PICK ?ROMPTR> XEQTYPE COERCE SWAPDROP 5PICK SWAP' * B9527
          :: DUP MINUSONE #= 3PICK MINUSONE #= OR case2drop TRUE * B954F
            #= ;                                 * B9581
          POSCOMP #0<> ;                         * B958B

* ROMPTR 0B5 15C
* refs (2): B4B39 B4B39
ROMP_0B5_15C:
        :: ROMPTR 0B5 0FE SWAP ROMPTR 0B5 0FE SWAP STRIPTAGSl2 XEQSTOID ; * B959A

* ROMPTR 0B5 15D
* refs (1): B4B39
ROMP_0B5_15D:
        :: DUP ID>$ BINT59 TestSysFlag ITE SWAPDROP * B95CE
          :: $ ": " &$ SWAP XEQRCL ROMPTR 0B0 075 &$ ; * B95F1
          BINT1 BINT23 SUB$ ;                    * B9628

* ROMPTR 0B5 15E
* refs (1): B4B39
ROMP_0B5_15E:
        :: CONTEXT@ BINT0 ROMPTR 0B5 161 MINUSONE ROMPTR 0B5 160 DROP * B963C
          ZEROSWAP #- BINT0 ROT#- SWAP ;         * B966B

* ROMPTR 0B5 15F
* refs (1): B4B39
ROMP_0B5_15F:
        :: ROMPTR 0B5 160 ROTROT2DROP ;          * B9689

* ROMPTR 0B5 160
* refs (1): B4B39
ROMP_0B5_160:
        :: '                                     * B96A3
          :: BEGIN ?ATTNQUIT DUP MYRAMROMPAIR ITE * B96AD
            :: SWAP PrevNonNull ITE FalseTrue FALSE * B96CB
            ;                                    * B96E9
            TrueTrue                             * B96EE
            UNTIL ;                              * B96F3
          '                                      * B96FD
          :: SWAPDROP SWAP#1-SWAP CONTEXT@ OVER EQ IT * B9702
            :: ROTDROP OVERSWAP ;                * B9725
            OVER#0= NOT?SEMI                     * B9739
            2RDROP TRUE ;                        * B9743
          2SWAP DUPUNROT SWAP BEGIN DUP LastNonNull * B9752
          :: ?SKIP                               * B9770
            :: 5PICK EVAL case COLATRUE          * B977A
            ;                                    * B9793
            BEGIN ?ATTNQUIT DUPTYPERRP? case     * B9798
            :: 5PICK EVAL FALSE RDROP ;          * B97AC
            PrevNonNull ITE FALSE                * B97CA
            :: 5PICK EVAL ;                      * B97D9
            UNTIL TRUE ;                         * B97ED
          UNTIL 4ROLLDROP 4ROLLDROP ;            * B97FC

* ROMPTR 0B5 161
* refs (1): B4B39
ROMP_0B5_161:
        :: DUP#0=csedrp                          * B9810
          ::                                     * B981A
            CODE                                 * B981F  23 nibbles
              LC(5)   #80711                     * B9829
              CD1EX                              * B9830
              A=DAT1  A                          * B9833
              D1=C                               * B9836
              GOVLNG  PUSHA                      * B9839
            ENDCODE                              * B9840
          ;                                      * B9840
          SWAP BEGIN DUP MYRAMROMPAIR NOTcase SWAPDROP * B9845
          DUPUNROT LastNonNull DROP BEGIN ?ATTNQUIT 2DUPEQ ITE FALSE * B9863
          :: DUPTYPERRP? NOTcaseTRUE ROTDROP     * B988B
            DUPUNROT TRUE ;                      * B989F
          WHILE                                  * B98AE
          :: PrevNonNull DROP ; REPEAT DROP MYRAMROMPAIR DROPOVER EQ BEGIN * B98B3
          OVERSWAP ITE DROPFALSE LastNonNull     * B98E5
          WHILE                                  * B98F9
          :: BINT0 3UNROLL BEGIN DUPTYPERRP? IT  * B98FE
            :: SWAPDROPDUP ROT#1+UNROT ;         * B991C
            PrevNonNull NOT_UNTIL SWAP #0= ;     * B9930
          REPEAT SWAP#1-SWAP OVER#0= UNTIL SWAPDROP ; * B9949

* ROMPTR 0B5 162
* refs (1): B4B39
ROMP_0B5_162:
        :: ROMPTR 0B5 0FE CREATEDIR ;            * B9967

* ROMPTR 0B5 163
* refs (1): B4B39
ROMP_0B5_163:
        :: BINT0 OVER BEGIN MYRAMROMPAIR NOT DUP ?SKIP ROT#1+UNROT * B9981
          UNTIL SWAPDUP SYSRRP? case             * B99AE
          :: 2DROP $ "HOME" ;                    * B99C2
          RAM-WORDNAME ID>$ SWAP #2* Blank$ !insert$ BINT1 BINT23 SUB$ ; * B99E3

* ROMPTR 0B5 164
* refs (1): B4B39
ROMP_0B5_164:
        :: ' NOP ROMPTR 0B5 165 ;                * B9A15

* ROMPTR 0B5 165
* refs (1): B4B39
ROMP_0B5_165:
        :: SWAPROT ROMPTR 0B5 0FE SWAP ROMPTR 0B5 0FE DUPTYPEIDNT? IT * B9A34
          :: BINT1 {}N ;                         * B9A63
          DUPNULLCOMP? caseSIZEERR ZEROZERO      * B9A77
          5ROLL CONTEXT@ 4NULLLAM{} BIND ERRSET  * B9A86
          :: INNERCOMP #1-SWAP OVER #2+UNROLL DUP#0=ITE DROP * B9A9F
            :: ZERO_DO ISTOP-INDEX ROLL ROMPTR 0B5 166 NOTcase * B9AC2
              :: caseSIZEERR SETNONEXTERR        * B9AE6
              ;                                  * B9AF5
              LOOP ;                             * B9AFA
            ROMPTR 0B5 166 CONTEXT@ 3UNROLL ITE ZEROSWAP * B9B04
            :: DROP SWAPROT DUPTYPELIST? NOT?SEMI * B9B23
              DUPLENCOMP #1= ?SEMI               * B9B3C
              ROTDROP SWAP2DUP EQUALPOSCOMP #0=?SKIP * B9B4B
              :: # 13C ERROROUT ; DUP CREATEDIR XEQRCL SWAP ZEROSWAP ; * B9B5F
            DUPTYPELIST? ITE INNERCOMP BINT1     * B9B96
            DUP#0=csDROP ZERO_DO DUPTYPEIDNT? NcaseTYPEERR DUP * B9BAA
            3PUTLAM 1GETLAM CONTEXT! DUP XEQRCL DUP 4PUTLAM 2GETLAM EVAL * B9BC3
            ERRSET                               * B9BF0
            :: ISTOP-INDEX #3+PICK CONTEXT! ISTOP-INDEX #2+PICK DUP#0=ITE * B9BF5
              DROPSWAP ROTDROP STRIPTAGSl2 XEQSTOID ; * B9C18
            ERRTRAP                              * B9C31
            :: 1GETLAM CONTEXT! 4GETLAM 3GETLAM 2GETLAM TYPECOL? IT XEQSTOID * B9C36
              ERRJMP ;                           * B9C63
            LOOP ;                               * B9C6D
          ERRTRAP                                * B9C77
          :: 1GETABND CONTEXT! ERRJMP ; 1GETABND CONTEXT! 2DROP ; * B9C7C

* ROMPTR 0B5 166
* refs (1): B4B39
ROMP_0B5_166:
        :: DUPTYPEIDNT? case                     * B9CA9
          :: dup;RclInVars(gn)? NOTcase FalseFalse * B9CB8
            TYPERRP? NOTcase TrueFalse           * B9CCC
            EVAL TRUE ;                          * B9CDB
          ' xHOME OVER EQ ' xUPDIR 3PICK EQOR NOTcase SETTYPEERR * B9CEA
          EvalNoCK TRUE ;                        * B9D1C

* ROMPTR 0B5 167
* refs (1): B4B39
ROMP_0B5_167:
        :: '                                     * B9D2B
          :: DUPTYPERRP? 3PICKSWAP ITE DIRARGERR ?PURGE_HERE * B9D35
          ;                                      * B9D53
          ROMPTR 0B5 165 ;                       * B9D58

* ROMPTR 0B5 168
* refs (1): B4B39
ROMP_0B5_168:
        :: DUPTYPEIDNT? case ?PURGE_HERE         * B9D68
          purge(li) ;                            * B9D7C

* ROMPTR 0B5 169
* refs (1): B4B39
ROMP_0B5_169:
        :: DUPTYPELIST? ITE INNERCOMP BINT1      * B9D86
          ZEROSWAP DUP#0=csDROP ZERO_DO SWAP VARSIZE SWAPDROP COERCE #+ LOOP ; * B9D9F

* ROMPTR 0B5 16A
* refs (1): B4B39
~GARBAGE;MEM;#2/:
        :: GARBAGE MEM #2/ ;                     * B9DD1

LIB0B5.hash:
        CON(5)  DOHSTR                           * B9DEA  hash table of library 0B5
        LENGTH                                   * B9DEF  length, to #B9E4E
        CON(5)  0                                * B9DF4  names of length 1
        CON(5)  0                                * B9DF9  names of length 2
        CON(5)  0                                * B9DFE  names of length 3
        CON(5)  0                                * B9E03  names of length 4
        CON(5)  0                                * B9E08  names of length 5
        CON(5)  0                                * B9E0D  names of length 6
        CON(5)  0                                * B9E12  names of length 7
        CON(5)  0                                * B9E17  names of length 8
        CON(5)  0                                * B9E1C  names of length 9
        CON(5)  0                                * B9E21  names of length 10
        CON(5)  0                                * B9E26  names of length 11
        CON(5)  0                                * B9E2B  names of length 12
        CON(5)  0                                * B9E30  names of length 13
        CON(5)  0                                * B9E35  names of length 14
        CON(5)  0                                * B9E3A  names of length 15
        CON(5)  0                                * B9E3F  names of length 16
        REL(5)  L_B9E49                          * B9E44  end of the names
L_B9E49:
        CON(5)  0                                * B9E49  command 000 has no name
        ENDLENGTH                                * B9E4E

LIB0B5.link:
        CON(5)  DOHSTR                           * B9E4E  link table of library 0B5
        LENGTH                                   * B9E53  length, to #BA56F
        REL(5)  ROMP_0B5_000                     * B9E58  000 
        REL(5)  ROMP_0B5_001                     * B9E5D  001 
        REL(5)  ROMP_0B5_002                     * B9E62  002 
        REL(5)  ROMP_0B5_003                     * B9E67  003 
        REL(5)  ROMP_0B5_004                     * B9E6C  004 
        REL(5)  ~SAFE@                           * B9E71  005 
        REL(5)  ROMP_0B5_006                     * B9E76  006 
        REL(5)  ROMP_0B5_007                     * B9E7B  007 
        REL(5)  ROMP_0B5_008                     * B9E80  008 
        REL(5)  ROMP_0B5_009                     * B9E85  009 
        REL(5)  ROMP_0B5_00A                     * B9E8A  00A 
        REL(5)  ROMP_0B5_00B                     * B9E8F  00B 
        REL(5)  ROMP_0B5_00C                     * B9E94  00C 
        REL(5)  ROMP_0B5_00D                     * B9E99  00D 
        REL(5)  ~MAT*                            * B9E9E  00E 
        REL(5)  ROMP_0B5_00F                     * B9EA3  00F 
        REL(5)  ROMP_0B5_010                     * B9EA8  010 
        REL(5)  ROMP_0B5_011                     * B9EAD  011 
        REL(5)  ROMP_0B5_012                     * B9EB2  012 
        REL(5)  ROMP_0B5_013                     * B9EB7  013 
        REL(5)  ROMP_0B5_014                     * B9EBC  014 
        REL(5)  ROMP_0B5_015                     * B9EC1  015 
        REL(5)  ROMP_0B5_016                     * B9EC6  016 
        REL(5)  ROMP_0B5_017                     * B9ECB  017 
        REL(5)  ROMP_0B5_018                     * B9ED0  018 
        REL(5)  ROMP_0B5_019                     * B9ED5  019 
        REL(5)  ROMP_0B5_01A                     * B9EDA  01A 
        REL(5)  ROMP_0B5_01B                     * B9EDF  01B 
        REL(5)  ROMP_0B5_01C                     * B9EE4  01C 
        REL(5)  ROMP_0B5_01D                     * B9EE9  01D 
        REL(5)  ROMP_0B5_01E                     * B9EEE  01E 
        REL(5)  ROMP_0B5_01F                     * B9EF3  01F 
        REL(5)  ROMP_0B5_020                     * B9EF8  020 
        REL(5)  ROMP_0B5_021                     * B9EFD  021 
        REL(5)  ROMP_0B5_022                     * B9F02  022 
        REL(5)  ROMP_0B5_023                     * B9F07  023 
        REL(5)  ROMP_0B5_024                     * B9F0C  024 
        REL(5)  ROMP_0B5_025                     * B9F11  025 
        REL(5)  ROMP_0B5_026                     * B9F16  026 
        REL(5)  ROMP_0B5_027                     * B9F1B  027 
        REL(5)  ROMP_0B5_028                     * B9F20  028 
        REL(5)  ROMP_0B5_029                     * B9F25  029 
        REL(5)  ROMP_0B5_02A                     * B9F2A  02A 
        REL(5)  ROMP_0B5_02B                     * B9F2F  02B 
        REL(5)  ROMP_0B5_02C                     * B9F34  02C 
        REL(5)  ROMP_0B5_02D                     * B9F39  02D 
        REL(5)  ~BINT1;{}N;PUTINDEPLIST          * B9F3E  02E 
        REL(5)  ~BINT1;{}N;PUTINDEPLIST          * B9F43  02F 
        REL(5)  ROMP_0B5_030                     * B9F48  030 
        REL(5)  ROMP_0B5_031                     * B9F4D  031 
        REL(5)  ROMP_0B5_032                     * B9F52  032 
        REL(5)  ROMP_0B5_035                     * B9F57  033 
        REL(5)  ROMP_0B5_035                     * B9F5C  034 
        REL(5)  ROMP_0B5_035                     * B9F61  035 
        REL(5)  ~GETXMIN;GETXMAX                 * B9F66  036 
        REL(5)  ~BINT1;{}N;depnd(li)             * B9F6B  037 
        REL(5)  ~BINT1;{}N;depnd(li)             * B9F70  038 
        REL(5)  ~BINT1;{}N;depnd(li)             * B9F75  039 
        REL(5)  ROMP_0B5_03A                     * B9F7A  03A 
        REL(5)  ROMP_0B5_03B                     * B9F7F  03B 
        REL(5)  ~GETYMIN;GETYMAX                 * B9F84  03C 
        REL(5)  ROMP_0B5_03E                     * B9F89  03D 
        REL(5)  ROMP_0B5_03E                     * B9F8E  03E 
        REL(5)  ROMP_0B5_03F                     * B9F93  03F 
        REL(5)  ROMP_0B5_040                     * B9F98  040 
        REL(5)  ROMP_0B5_041                     * B9F9D  041 
        REL(5)  ROMP_0B5_042                     * B9FA2  042 
        REL(5)  ROMP_0B5_043                     * B9FA7  043 
        REL(5)  ROMP_0B5_045                     * B9FAC  044 
        REL(5)  ROMP_0B5_045                     * B9FB1  045 
        REL(5)  ROMP_0B5_047                     * B9FB6  046 
        REL(5)  ROMP_0B5_047                     * B9FBB  047 
        REL(5)  ROMP_0B5_049                     * B9FC0  048 
        REL(5)  ROMP_0B5_049                     * B9FC5  049 
        REL(5)  ROMP_0B5_04A                     * B9FCA  04A 
        REL(5)  ROMP_0B5_04F                     * B9FCF  04B 
        REL(5)  ROMP_0B5_04F                     * B9FD4  04C 
        REL(5)  ROMP_0B5_04F                     * B9FD9  04D 
        REL(5)  ROMP_0B5_04F                     * B9FDE  04E 
        REL(5)  ROMP_0B5_04F                     * B9FE3  04F 
        REL(5)  ROMP_0B5_050                     * B9FE8  050 
        REL(5)  ROMP_0B5_051                     * B9FED  051 
        REL(5)  ROMP_0B5_052                     * B9FF2  052 
        REL(5)  ROMP_0B5_053                     * B9FF7  053 
        REL(5)  ROMP_0B5_054                     * B9FFC  054 
        REL(5)  ROMP_0B5_055                     * BA001  055 
        REL(5)  ROMP_0B5_056                     * BA006  056 
        REL(5)  ROMP_0B5_057                     * BA00B  057 
        REL(5)  ROMP_0B5_058                     * BA010  058 
        REL(5)  ROMP_0B5_059                     * BA015  059 
        REL(5)  ROMP_0B5_05A                     * BA01A  05A 
        REL(5)  ROMP_0B5_05B                     * BA01F  05B 
        REL(5)  ROMP_0B5_05C                     * BA024  05C 
        REL(5)  ROMP_0B5_05D                     * BA029  05D 
        REL(5)  ROMP_0B5_05E                     * BA02E  05E 
        REL(5)  ROMP_0B5_05F                     * BA033  05F 
        REL(5)  ~BINT31;TestSysFlag;NOT          * BA038  060 
        REL(5)  ROMP_0B5_061                     * BA03D  061 
        REL(5)  ~BINT28;TestSysFlag              * BA042  062 
        REL(5)  ROMP_0B5_063                     * BA047  063 
        REL(5)  ROMP_0B5_064                     * BA04C  064 
        REL(5)  ROMP_0B5_065                     * BA051  065 
        REL(5)  ROMP_0B5_066                     * BA056  066 
        REL(5)  ROMP_0B5_067                     * BA05B  067 
        REL(5)  ROMP_0B5_068                     * BA060  068 
        REL(5)  ROMP_0B5_069                     * BA065  069 
        REL(5)  ROMP_0B5_06A                     * BA06A  06A 
        REL(5)  ROMP_0B5_06B                     * BA06F  06B 
        REL(5)  ROMP_0B5_06C                     * BA074  06C 
        REL(5)  ROMP_0B5_06D                     * BA079  06D 
        REL(5)  ROMP_0B5_06E                     * BA07E  06E 
        REL(5)  ROMP_0B5_06F                     * BA083  06F 
        REL(5)  ~BINT29;TestSysFlag;NOT          * BA088  070 
        REL(5)  ROMP_0B5_071                     * BA08D  071 
        REL(5)  ROMP_0B5_072                     * BA092  072 
        REL(5)  ROMP_0B5_073                     * BA097  073 
        REL(5)  ROMP_0B5_074                     * BA09C  074 
        REL(5)  ROMP_0B5_075                     * BA0A1  075 
        REL(5)  ROMP_0B5_076                     * BA0A6  076 
        REL(5)  ROMP_0B5_077                     * BA0AB  077 
        REL(5)  ~DOERASE                         * BA0B0  078 
        REL(5)  ROMP_0B5_079                     * BA0B5  079 
        REL(5)  ROMP_0B5_07A                     * BA0BA  07A 
        REL(5)  ROMP_0B5_07B                     * BA0BF  07B 
        REL(5)  ROMP_0B5_07C                     * BA0C4  07C 
        REL(5)  ROMP_0B5_07D                     * BA0C9  07D 
        REL(5)  ROMP_0B5_07E                     * BA0CE  07E 
        REL(5)  ROMP_0B5_07F                     * BA0D3  07F 
        REL(5)  ROMP_0B5_080                     * BA0D8  080 
        REL(5)  ROMP_0B5_081                     * BA0DD  081 
        REL(5)  ROMP_0B5_082                     * BA0E2  082 
        REL(5)  ROMP_0B5_083                     * BA0E7  083 
        REL(5)  ROMP_0B5_084                     * BA0EC  084 
        REL(5)  ROMP_0B5_085                     * BA0F1  085 
        REL(5)  ROMP_0B5_086                     * BA0F6  086 
        REL(5)  ROMP_0B5_087                     * BA0FB  087 
        REL(5)  ROMP_0B5_088                     * BA100  088 
        REL(5)  ROMP_0B5_089                     * BA105  089 
        REL(5)  ROMP_0B5_08A                     * BA10A  08A 
        REL(5)  ROMP_0B5_08B                     * BA10F  08B 
        REL(5)  ROMP_0B5_08C                     * BA114  08C 
        REL(5)  ROMP_0B5_08D                     * BA119  08D 
        REL(5)  ROMP_0B5_08E                     * BA11E  08E 
        REL(5)  ROMP_0B5_08F                     * BA123  08F 
        REL(5)  ROMP_0B5_090                     * BA128  090 
        REL(5)  ROMP_0B5_091                     * BA12D  091 
        REL(5)  ROMP_0B5_092                     * BA132  092 
        REL(5)  ROMP_0B5_093                     * BA137  093 
        REL(5)  ~BINT3;TestSysFlag;NOT           * BA13C  094 
        REL(5)  ~BINT1;TestSysFlag               * BA141  095 
        REL(5)  ROMP_0B5_096                     * BA146  096 
        REL(5)  ROMP_0B5_097                     * BA14B  097 
        REL(5)  ROMP_0B5_098                     * BA150  098 
        REL(5)  ROMP_0B5_099                     * BA155  099 
        REL(5)  ROMP_0B5_09A                     * BA15A  09A 
        REL(5)  ROMP_0B5_09B                     * BA15F  09B 
        REL(5)  ROMP_0B5_09C                     * BA164  09C 
        REL(5)  ROMP_0B5_09D                     * BA169  09D 
        REL(5)  ROMP_0B5_09E                     * BA16E  09E 
        REL(5)  ROMP_0B5_09F                     * BA173  09F 
        REL(5)  ROMP_0B5_0A0                     * BA178  0A0 
        REL(5)  ROMP_0B5_0A1                     * BA17D  0A1 
        REL(5)  ROMP_0B5_0A2                     * BA182  0A2 
        REL(5)  ROMP_0B5_0A3                     * BA187  0A3 
        REL(5)  ROMP_0B5_0A4                     * BA18C  0A4 
        REL(5)  ROMP_0B5_0A5                     * BA191  0A5 
        REL(5)  ROMP_0B5_0A6                     * BA196  0A6 
        REL(5)  ROMP_0B5_0A7                     * BA19B  0A7 
        REL(5)  ROMP_0B5_0A8                     * BA1A0  0A8 
        REL(5)  ROMP_0B5_0A9                     * BA1A5  0A9 
        REL(5)  ROMP_0B5_0AA                     * BA1AA  0AA 
        REL(5)  ROMP_0B5_0AB                     * BA1AF  0AB 
        REL(5)  ROMP_0B5_0AC                     * BA1B4  0AC 
        REL(5)  ROMP_0B5_0AD                     * BA1B9  0AD 
        REL(5)  ROMP_0B5_0AE                     * BA1BE  0AE 
        REL(5)  ROMP_0B5_0AF                     * BA1C3  0AF 
        REL(5)  ROMP_0B5_0B0                     * BA1C8  0B0 
        REL(5)  ROMP_0B5_0B1                     * BA1CD  0B1 
        REL(5)  ROMP_0B5_0B2                     * BA1D2  0B2 
        REL(5)  ROMP_0B5_0B3                     * BA1D7  0B3 
        REL(5)  ROMP_0B5_0B4                     * BA1DC  0B4 
        REL(5)  ROMP_0B5_0B5                     * BA1E1  0B5 
        REL(5)  ROMP_0B5_0B6                     * BA1E6  0B6 
        REL(5)  ROMP_0B5_0B7                     * BA1EB  0B7 
        REL(5)  ROMP_0B5_0B8                     * BA1F0  0B8 
        REL(5)  ROMP_0B5_0B9                     * BA1F5  0B9 
        REL(5)  ROMP_0B5_0BA                     * BA1FA  0BA 
        REL(5)  ROMP_0B5_0BB                     * BA1FF  0BB 
        REL(5)  ROMP_0B5_0BC                     * BA204  0BC 
        REL(5)  ROMP_0B5_0BD                     * BA209  0BD 
        REL(5)  ROMP_0B5_0BE                     * BA20E  0BE 
        REL(5)  ROMP_0B5_0BF                     * BA213  0BF 
        REL(5)  ROMP_0B5_0C0                     * BA218  0C0 
        REL(5)  ROMP_0B5_0C1                     * BA21D  0C1 
        REL(5)  ROMP_0B5_0C2                     * BA222  0C2 
        REL(5)  ROMP_0B5_0C3                     * BA227  0C3 
        REL(5)  ROMP_0B5_0C4                     * BA22C  0C4 
        REL(5)  ROMP_0B5_0C5                     * BA231  0C5 
        REL(5)  ROMP_0B5_0C6                     * BA236  0C6 
        REL(5)  ROMP_0B5_0C7                     * BA23B  0C7 
        REL(5)  ROMP_0B5_0C8                     * BA240  0C8 
        REL(5)  ROMP_0B5_0C9                     * BA245  0C9 
        REL(5)  ROMP_0B5_0CA                     * BA24A  0CA 
        REL(5)  ROMP_0B5_0CB                     * BA24F  0CB 
        REL(5)  ROMP_0B5_0CC                     * BA254  0CC 
        REL(5)  ROMP_0B5_0CD                     * BA259  0CD 
        REL(5)  ROMP_0B5_0CE                     * BA25E  0CE 
        REL(5)  ROMP_0B5_0CF                     * BA263  0CF 
        REL(5)  ROMP_0B5_0D0                     * BA268  0D0 
        REL(5)  ROMP_0B5_0D1                     * BA26D  0D1 
        REL(5)  ROMP_0B5_0D2                     * BA272  0D2 
        REL(5)  ROMP_0B5_0D3                     * BA277  0D3 
        REL(5)  ROMP_0B5_0D4                     * BA27C  0D4 
        REL(5)  ~ALARMS@;LENCOMP                 * BA281  0D5 
        REL(5)  ~RCLALM;NOTcase;NOALARMERR       * BA286  0D6 
        REL(5)  ROMP_0B5_0D7                     * BA28B  0D7 
        REL(5)  ROMP_0B5_0D8                     * BA290  0D8 
        REL(5)  ROMP_0B5_0D9                     * BA295  0D9 
        REL(5)  ROMP_0B5_0DA                     * BA29A  0DA 
        REL(5)  ROMP_0B5_0DB                     * BA29F  0DB 
        REL(5)  ROMP_0B5_0DC                     * BA2A4  0DC 
        REL(5)  ROMP_0B5_0DD                     * BA2A9  0DD 
        REL(5)  ROMP_0B5_0DE                     * BA2AE  0DE 
        REL(5)  ROMP_0B5_0DF                     * BA2B3  0DF 
        REL(5)  ~ChkReakäPAR;3DROP               * BA2B8  0E0 
        REL(5)  ~STATCOL                         * BA2BD  0E1 
        REL(5)  ROMP_0B5_0E2                     * BA2C2  0E2 
        REL(5)  ROMP_0B5_0E3                     * BA2C7  0E3 
        REL(5)  ROMP_0B5_0E4                     * BA2CC  0E4 
        REL(5)  ROMP_0B5_0E5                     * BA2D1  0E5 
        REL(5)  ROMP_0B5_0E6                     * BA2D6  0E6 
        REL(5)  ROMP_0B5_0E7                     * BA2DB  0E7 
        REL(5)  ~4ROLLDROP;SWAP;bins(3r)         * BA2E0  0E8 
        REL(5)  ROMP_0B5_0E9                     * BA2E5  0E9 
        REL(5)  ~STATPREDX                       * BA2EA  0EA 
        REL(5)  ~STATPREDY                       * BA2EF  0EB 
        REL(5)  ~STATX                           * BA2F4  0EC 
        REL(5)  ~STATY                           * BA2F9  0ED 
        REL(5)  ~STATXX                          * BA2FE  0EE 
        REL(5)  ~STATYY                          * BA303  0EF 
        REL(5)  ~STATXY                          * BA308  0F0 
        REL(5)  ~STATN                           * BA30D  0F1 
        REL(5)  ROMP_0B5_0F2                     * BA312  0F2 
        REL(5)  ROMP_0B5_0F3                     * BA317  0F3 
        REL(5)  ROMP_0B5_0F4                     * BA31C  0F4 
        REL(5)  ROMP_0B5_0F5                     * BA321  0F5 
        REL(5)  ROMP_0B5_0F6                     * BA326  0F6 
        REL(5)  ROMP_0B5_0F7                     * BA32B  0F7 
        REL(5)  ROMP_0B5_0F8                     * BA330  0F8 
        REL(5)  ROMP_0B5_0F9                     * BA335  0F9 
        REL(5)  ROMP_0B5_0FA                     * BA33A  0FA 
        REL(5)  ROMP_0B5_0FB                     * BA33F  0FB 
        REL(5)  ROMP_0B5_0FC                     * BA344  0FC 
        REL(5)  ROMP_0B5_0FD                     * BA349  0FD 
        REL(5)  ROMP_0B5_0FE                     * BA34E  0FE 
        REL(5)  ROMP_0B5_0FF                     * BA353  0FF 
        REL(5)  ROMP_0B5_100                     * BA358  100 
        REL(5)  ROMP_0B5_101                     * BA35D  101 
        REL(5)  ROMP_0B5_102                     * BA362  102 
        REL(5)  ROMP_0B5_103                     * BA367  103 
        REL(5)  ~BINT38;TestSysFlag;NOT          * BA36C  104 
        REL(5)  ROMP_0B5_105                     * BA371  105 
        REL(5)  ROMP_0B5_106                     * BA376  106 
        REL(5)  ROMP_0B5_107                     * BA37B  107 
        REL(5)  ROMP_0B5_108                     * BA380  108 
        REL(5)  ROMP_0B5_109                     * BA385  109 
        REL(5)  ROMP_0B5_10A                     * BA38A  10A 
        REL(5)  ROMP_0B5_10B                     * BA38F  10B 
        REL(5)  ROMP_0B5_10C                     * BA394  10C 
        REL(5)  ROMP_0B5_10D                     * BA399  10D 
        REL(5)  ~BINT36;TestSysFlag              * BA39E  10E 
        REL(5)  ROMP_0B5_10F                     * BA3A3  10F 
        REL(5)  ROMP_0B5_110                     * BA3A8  110 
        REL(5)  ROMP_0B5_111                     * BA3AD  111 
        REL(5)  ROMP_0B5_112                     * BA3B2  112 
        REL(5)  ROMP_0B5_113                     * BA3B7  113 
        REL(5)  ROMP_0B5_114                     * BA3BC  114 
        REL(5)  ROMP_0B5_115                     * BA3C1  115 
        REL(5)  ROMP_0B5_116                     * BA3C6  116 
        REL(5)  ROMP_0B5_117                     * BA3CB  117 
        REL(5)  ~NULL$TEMP;DORECN                * BA3D0  118 
        REL(5)  ROMP_0B5_119                     * BA3D5  119 
        REL(5)  ROMP_0B5_11A                     * BA3DA  11A 
        REL(5)  ROMP_0B5_11B                     * BA3DF  11B 
        REL(5)  ROMP_0B5_11C                     * BA3E4  11C 
        REL(5)  ~Reset&BreakPRTPAR;DROP          * BA3E9  11D 
        REL(5)  ROMP_0B5_11E                     * BA3EE  11E 
        REL(5)  ROMP_0B5_11F                     * BA3F3  11F 
        REL(5)  ROMP_0B5_120                     * BA3F8  120 
        REL(5)  ROMP_0B5_121                     * BA3FD  121 
        REL(5)  ROMP_0B5_122                     * BA402  122 
        REL(5)  ROMP_0B5_123                     * BA407  123 
        REL(5)  ROMP_0B5_124                     * BA40C  124 
        REL(5)  ROMP_0B5_125                     * BA411  125 
        REL(5)  ROMP_0B5_126                     * BA416  126 
        REL(5)  ROMP_0B5_127                     * BA41B  127 
        REL(5)  ROMP_0B5_128                     * BA420  128 
        REL(5)  ROMP_0B5_129                     * BA425  129 
        REL(5)  ROMP_0B5_12A                     * BA42A  12A 
        REL(5)  ROMP_0B5_12B                     * BA42F  12B 
        REL(5)  ROMP_0B5_12C                     * BA434  12C 
        REL(5)  ROMP_0B5_12D                     * BA439  12D 
        REL(5)  ROMP_0B5_12E                     * BA43E  12E 
        REL(5)  ROMP_0B5_12F                     * BA443  12F 
        REL(5)  ROMP_0B5_130                     * BA448  130 
        REL(5)  ROMP_0B5_131                     * BA44D  131 
        REL(5)  ROMP_0B5_132                     * BA452  132 
        REL(5)  ROMP_0B5_133                     * BA457  133 
        REL(5)  ROMP_0B5_134                     * BA45C  134 
        REL(5)  ROMP_0B5_135                     * BA461  135 
        REL(5)  ROMP_0B5_136                     * BA466  136 
        REL(5)  ROMP_0B5_137                     * BA46B  137 
        REL(5)  ROMP_0B5_138                     * BA470  138 
        REL(5)  ROMP_0B5_139                     * BA475  139 
        REL(5)  ROMP_0B5_13A                     * BA47A  13A 
        REL(5)  ROMP_0B5_13B                     * BA47F  13B 
        REL(5)  ~BINT56;TestSysFlag;NOT          * BA484  13C 
        REL(5)  ROMP_0B5_13D                     * BA489  13D 
        REL(5)  ~BINT40;TestSysFlag              * BA48E  13E 
        REL(5)  ROMP_0B5_13F                     * BA493  13F 
        REL(5)  ~BINT51;TestSysFlag              * BA498  140 
        REL(5)  ROMP_0B5_141                     * BA49D  141 
        REL(5)  ROMP_0B5_142                     * BA4A2  142 
        REL(5)  ROMP_0B5_143                     * BA4A7  143 
        REL(5)  ROMP_0B5_144                     * BA4AC  144 
        REL(5)  ROMP_0B5_145                     * BA4B1  145 
        REL(5)  ROMP_0B5_146                     * BA4B6  146 
        REL(5)  ROMP_0B5_147                     * BA4BB  147 
        REL(5)  ROMP_0B5_148                     * BA4C0  148 
        REL(5)  ROMP_0B5_149                     * BA4C5  149 
        REL(5)  ROMP_0B5_14A                     * BA4CA  14A 
        REL(5)  ROMP_0B5_14B                     * BA4CF  14B 
        REL(5)  ROMP_0B5_14C                     * BA4D4  14C 
        REL(5)  ROMP_0B5_14D                     * BA4D9  14D 
        REL(5)  ROMP_0B5_14E                     * BA4DE  14E 
        REL(5)  ROMP_0B5_14F                     * BA4E3  14F 
        REL(5)  ROMP_0B5_150                     * BA4E8  150 
        REL(5)  ~BINT16;ClrSysFlag               * BA4ED  151 
        REL(5)  ROMP_0B5_152                     * BA4F2  152 
        REL(5)  ROMP_0B5_153                     * BA4F7  153 
        REL(5)  ROMP_0B5_154                     * BA4FC  154 
        REL(5)  ROMP_0B5_155                     * BA501  155 
        REL(5)  ROMP_0B5_156                     * BA506  156 
        REL(5)  ROMP_0B5_157                     * BA50B  157 
        REL(5)  ROMP_0B5_158                     * BA510  158 
        REL(5)  ROMP_0B5_159                     * BA515  159 
        REL(5)  ROMP_0B5_15A                     * BA51A  15A 
        REL(5)  ROMP_0B5_15C                     * BA51F  15B 
        REL(5)  ROMP_0B5_15C                     * BA524  15C 
        REL(5)  ROMP_0B5_15D                     * BA529  15D 
        REL(5)  ROMP_0B5_15E                     * BA52E  15E 
        REL(5)  ROMP_0B5_15F                     * BA533  15F 
        REL(5)  ROMP_0B5_160                     * BA538  160 
        REL(5)  ROMP_0B5_161                     * BA53D  161 
        REL(5)  ROMP_0B5_162                     * BA542  162 
        REL(5)  ROMP_0B5_163                     * BA547  163 
        REL(5)  ROMP_0B5_164                     * BA54C  164 
        REL(5)  ROMP_0B5_165                     * BA551  165 
        REL(5)  ROMP_0B5_166                     * BA556  166 
        REL(5)  ROMP_0B5_167                     * BA55B  167 
        REL(5)  ROMP_0B5_168                     * BA560  168 
        REL(5)  ROMP_0B5_169                     * BA565  169 
        REL(5)  ~GARBAGE;MEM;#2/                 * BA56A  16A 
        ENDLENGTH                                * BA56F
        NIBHEX  5444000                          * BA56F  ED.
