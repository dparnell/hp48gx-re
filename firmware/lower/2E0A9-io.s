* HP 48GX ROM revision R, #2E0A9-#2FFFF: Serial I/O and Kermit: receiving packets, send and get commands, IOPAR and PRTPAR, packet encoding and decoding
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: GetIOPAR FalseFalse GetKermPkt# dup;#nm? GetStrLenStk %IP># 6->list;StoInIPAR KERMOPEN SetIOPARerr IOCheckReal GETNAME BUILDKPACKET
* Follows on from the previous file (at #2E0A9 in the original ROM).
        RPL

* refs (2): 2DAE5 2F71D
SENDNAK:
        :: NULL$ GetKermPkt# CHR_N SENDPKT ;     * 2E0A9

* refs (5): 2DC20 2DD06 2E063 2E4CD 2E76D
SENDERROR:
        :: %.15 dowait KVISLF ENCODE1PKT LAMPKNO CHR_E SENDPKT ; * 2E0C7

* refs (4): 2E0BD 2E0EA 2F9D4 2FEAB
SENDPKT:
        :: BUILDKPACKET KermSendRaw ;            * 2E0F4

* refs (6): 2D4C2 2D5A0 2E0F9 2E949 2F248 2F36A
BUILDKPACKET:
        :: GETKP 3UNROLL                         * 2E108
          CODE                                   * 2E117  363 nibbles
            GOSBVL  POP#                         * 2E121
            R2=A                                 * 2E128
            GOSBVL  POP#                         * 2E12B
            C=R2                                 * 2E132
            CSL     A                            * 2E135
            CSL     A                            * 2E137
            C=A     B                            * 2E139
            R2=C                                 * 2E13C
            C=DAT1  A                            * 2E13F
            CD1EX                                * 2E142
            RSTK=C                               * 2E145
            D1=D1+  14                           * 2E147
            C=DAT1  A                            * 2E14A
            A=C     A                            * 2E14D
            ABIT=0  14                           * 2E14F
            ?CBIT=1 14                           * 2E154
            GOYES   BUILDKPACKET.L1              * 2E159
            ABIT=1  14                           * 2E15B
BUILDKPACKET.L1:
            LC(2)   #20                          * 2E160
            A=A-C   B                            * 2E164
            R3=A                                 * 2E167
            D1=D1+  4                            * 2E16A
            A=DAT1  B                            * 2E16D
            A=A-C   B                            * 2E170
            ASL     A                            * 2E173
            ASL     A                            * 2E175
            D1=D1+  6                            * 2E177
            A=DAT1  B                            * 2E17A
            LC(2)   #30                          * 2E17D
            A=A-C   B                            * 2E181
            R4=A                                 * 2E184
            C=RSTK                               * 2E187
            D1=C                                 * 2E189
            GOSBVL  PopSavptr                    * 2E18C
            GOSBVL  GetStrLenStk                 * 2E193
            A=R4                                 * 2E19A
            C=C+A   B                            * 2E19D
            A=C     A                            * 2E1A0
            C=0     A                            * 2E1A2
            LC(1)   #5                           * 2E1A4
            C=C+A   A                            * 2E1A7
            RSTK=C                               * 2E1A9
            A=0     A                            * 2E1AB
            C=R3                                 * 2E1AD
            A=C     B                            * 2E1B0
            C=RSTK                               * 2E1B3
            RSTK=C                               * 2E1B5
            C=C+A   A                            * 2E1B7
            GOSBVL  MAKE$                        * 2E1B9
            C=R3                                 * 2E1C0
            A=C     A                            * 2E1C3
            CSR     A                            * 2E1C5
            CSR     A                            * 2E1C7
            GONC    BUILDKPACKET.L3              * 2E1C9
BUILDKPACKET.loop2:
            DAT0=C  B                            * 2E1CC
            D0=D0+  2                            * 2E1CF
BUILDKPACKET.L3:
            A=A-1   B                            * 2E1D2
            GONC    BUILDKPACKET.loop2           * 2E1D5
            LC(2)   #01                          * 2E1D8
            DAT0=C  B                            * 2E1DC
            D0=D0+  2                            * 2E1DF
            CD0EX                                * 2E1E2
            D0=C                                 * 2E1E5
            R1=C                                 * 2E1E8
            C=0     A                            * 2E1EB
            LC(2)   #20                          * 2E1ED
            A=C     A                            * 2E1F1
            C=RSTK                               * 2E1F3
            C=C-CON A,3                          * 2E1F5
            RSTK=C                               * 2E1FB
            C=C+A   A                            * 2E1FD
            DAT0=C  B                            * 2E1FF
            D0=D0+  2                            * 2E202
            C=R2                                 * 2E205
            C=C+A   A                            * 2E208
            DAT0=C  4                            * 2E20A
            D0=D0+  4                            * 2E20E
            AD0EX                                * 2E211
            GOSBVL  D1=DSKTOP                    * 2E214
            GOSBVL  GetStrLenStk                 * 2E21B
            C=C+C   A                            * 2E222
            AD1EX                                * 2E224
            D0=A                                 * 2E227
            GOSBVL  MOVEDOWN                     * 2E22A
            C=R4                                 * 2E231
            A=0     A                            * 2E234
            A=C     B                            * 2E236
            CD1EX                                * 2E239
            D=C     A                            * 2E23C
            C=RSTK                               * 2E23E
            C=C+1   A                            * 2E240
            C=C-A   A                            * 2E242
            AR1EX                                * 2E244
            D1=A                                 * 2E247
            A=C     A                            * 2E24A
            GOSUB   KermCheck                    * 2E24C
            P=      5                            * 2E250
            A=C     WP                           * 2E252
            C=R1                                 * 2E255
            C=C+C   A                            * 2E258
            C=C-1   A                            * 2E25A
            P=C     0                            * 2E25C
            C=D     A                            * 2E260
            D0=C                                 * 2E262
            DAT0=A  WP                           * 2E265
            A=C     A                            * 2E269
            C=0     A                            * 2E26B
            CPEX    0                            * 2E26D
            C=C+1   A                            * 2E271
            C=C+A   A                            * 2E273
            D0=C                                 * 2E275
            C=R4                                 * 2E278
            CSR     A                            * 2E27B
            CSR     A                            * 2E27D
            DAT0=C  B                            * 2E27F
            A=R0                                 * 2E282
            GOVLNG  GPOverWrALp                  * 2E285
          ENDCODE                                * 2E28C
        ;                                        * 2E28C

* refs (2): 2E2DC 2E487
* -> #: the block check type (1-3) from the eighth character of the parameters in KP
KermChkType:
        :: GETKP BINT8 SUB$1# BINT48 #- ;        * 2E291

* refs (4): 2DAD1 2F4CA 2F993 30842
* -> $data #seq chr TRUE / #err FALSE: reads a packet from the serial port, waiting for the timeout given in KP. Checks length and block check. ON aborts
KermRecvPkt:
        :: GETKP BINT2 SUB$1# BINT32 #- #10* StimeXmit(s) KermChkType * 2E2B4
          CODE                                   * 2E2E1  362 nibbles
            GOSBVL  SAVPTR                       * 2E2EB
            GOSBVL  POP#                         * 2E2F2
            R1=A                                 * 2E2F9
            ST=0    10                           * 2E2FC
KermRecvPkt.L1:
            GOSBVL  IOGetByte                    * 2E2FF
            GONC    Push#FLoop.loop2             * 2E306
KermRecvPkt.L2:
            R0=C                                 * 2E309
            GOSBVL  GETPTR                       * 2E30C
            D=D+1   A                            * 2E313
            D1=D1+  5                            * 2E315
KermRecvPkt.L3:
            GOSBVL  SAVPTR                       * 2E318

* <REF>GETPTR , Push R0 as #, Do FALSE
* refs (3): 31572 357E9 D4450
Push#FLoop:
            GOSBVL  PUSH#                        * 2E31F
            LC(5)   FALSE                        * 2E326
            A=C     A                            * 2E32D
            PC=(A)                               * 2E32F
Push#FLoop.loop1:
            A=R2                                 * 2E333
Push#FLoop.loop2:
            LC(2)   #01                          * 2E336
            ?C#A    B                            * 2E33A
            GOYES   KermRecvPkt.L1               * 2E33D
            GOSBVL  IOGetByte                    * 2E33F
Push#FLoop.loop3:
            GOC     KermRecvPkt.L2               * 2E346
            R2=A                                 * 2E349
            LC(2)   #20                          * 2E34C
            A=A-C   B                            * 2E350
            GOC     Push#FLoop.loop1             * 2E353
            LC(2)   #5E                          * 2E356
            ?C<A    B                            * 2E35A
            GOYES   Push#FLoop.loop1             * 2E35D
            C=0     A                            * 2E35F
            C=A     B                            * 2E361
            R3=C                                 * 2E364
            C=C+1   A                            * 2E367
            GOSBVL  MAKE$                        * 2E369
            A=R2                                 * 2E370
Push#FLoop.loop4:
            DAT0=A  B                            * 2E373
            D0=D0+  2                            * 2E376
            CD0EX                                * 2E379
            R2=C                                 * 2E37C
            C=R3                                 * 2E37F
            C=C-1   A                            * 2E382
            GOC     Push#FLoop.L7                * 2E384
            R3=C                                 * 2E387
            GOSBVL  IOGetByte                    * 2E38A
            GOC     Push#FLoop.loop3             * 2E391
            LC(2)   #20                          * 2E394
            ?C>A    B                            * 2E398
            GOYES   Push#FLoop.loop2             * 2E39B
            LC(4)   #9F7F                        * 2E39D
            GOSUB   SUB_2E447                    * 2E3A3
            GONC    Push#FLoop.L5                * 2E3A7
            LC(2)   #FF                          * 2E3AA
            ?C#A    B                            * 2E3AE
            GOYES   Push#FLoop.L6                * 2E3B1
Push#FLoop.L5:
            GOTO    Push#FLoop.loop2             * 2E3B3
Push#FLoop.L6:
            C=R2                                 * 2E3B7
            D0=C                                 * 2E3BA
            GOC     Push#FLoop.loop4             * 2E3BD
Push#FLoop.L7:
            C=R0                                 * 2E3C0
            GOSUBL  GetStrLenC                   * 2E3C3
            A=C     A                            * 2E3C9
            C=R1                                 * 2E3CB
            A=A-C   A                            * 2E3CE
            GOC     Push#FLoop.L8                * 2E3D0
            LC(1)   #3                           * 2E3D3
            ?C<=A   A                            * 2E3D6
            GOYES   Push#FLoop.L10               * 2E3D9
Push#FLoop.L8:
            LC(5)   #00C07                       * 2E3DB
Push#FLoop.loop9:
            GOTO    KermRecvPkt.L2               * 2E3E2
Push#FLoop.L10:
            GOSUB   KermCheck                    * 2E3E6
            A=R1                                 * 2E3EA
            A=A+A   A                            * 2E3ED
            A=A-1   A                            * 2E3EF
            CAEX    W                            * 2E3F1
            P=C     0                            * 2E3F4
            C=DAT1  WP                           * 2E3F8
            ?C=A    WP                           * 2E3FC
            GOYES   Push#FLoop.L11               * 2E3FF
            P=      0                            * 2E401
            LC(5)   #00C01                       * 2E403
            GONC    Push#FLoop.loop9             * 2E40A
Push#FLoop.L11:
            C=R0                                 * 2E40D
            R3=C                                 * 2E410
            P=      0                            * 2E413
            D1=C                                 * 2E415
            D1=D1+  12                           * 2E418
            A=0     A                            * 2E41B
            A=DAT1  B                            * 2E41D
            LC(2)   #20                          * 2E420
            A=A-C   B                            * 2E424
            R0=A                                 * 2E427
            D1=D1+  2                            * 2E42A
            A=DAT1  B                            * 2E42D
            R1=A                                 * 2E430
            GOSBVL  GETPTR                       * 2E433
            C=R3                                 * 2E43A
            DAT1=C  A                            * 2E43D
            GOVLNG  KermRecvPkt~1                * 2E440

* refs (1): 2E3A3
SUB_2E447:
            ?C>A    B                            * 2E447
            RTNYES                               * 2E44A
            CSR     A                            * 2E44C
            CSR     A                            * 2E44E
            C=C-A   B                            * 2E450
            RTN                                  * 2E453
          ENDCODE                                * 2E455
          NOTcase                                * 2E455
          :: ~ATTNERR;#=casedrop;ABORT FALSE     * 2E45A
          ;                                      * 2E469
          FLUSHRSBUF #>CHR ROT BINT4 OVERLEN$ KermChkType #- SUB$ 3UNROLL * 2E46E
          TRUE ;                                 * 2E49B

* refs (3): 2E45F 2EE5B 30E5D
~ATTNERR;#=casedrop;ABORT:
        :: ATTNERR #=casedrop ABORT              * 2E4A5
        ;                                        * 2E4B9

* refs (4): 2DF3D 2F4E3 2F6CD 2F8C6
* #err -> #err FALSE: sends the error's text in an E packet
KermSendErr:
        :: DUP KermErrMsg SENDERROR FALSE ;      * 2E4BE

* $ -> $'
* refs (6): 2DCB1 2DD01 2DDD8 2F18A 2F88A 2FCD1
APNDCRLF:
        :: CRLF$ !append$ ;                      * 2E4DC

* "\0d\0a"
* refs (3): 2D97E 2E4E1 31F6E
CRLF$:
        $ "\0D\0A"                               * 2E4F0
        ASSEMBLE

* refs (2): 2E24C 2E3E6
* A.A = bytes, D1 = data -> the Kermit block check of the type in KP. Type 3 uses the hardware CRC register at #00104
KermCheck:
        B=0     A                                * 2E4FE
        C=0     A                                * 2E500
        D0=(5)  #00104                           * 2E502
        ST=0    15                               * 2E509
        DAT0=C  4                                * 2E50C
        GOTO    KermCheck.L2                     * 2E510
KermCheck.loop1:
        C=DAT1  B                                * 2E514
        D1=D1+  2                                * 2E517
        B=B+C   A                                * 2E51A
KermCheck.L2:
        A=A-1   A                                * 2E51C
        GONC    KermCheck.loop1                  * 2E51E
        A=0     W                                * 2E521
        A=DAT0  4                                * 2E524
        GOSBVL  AllowIntr                        * 2E528
        C=R1                                     * 2E52F
        C=C-1   A                                * 2E532
        C=C-1   A                                * 2E534
        C=C-1   A                                * 2E536
        GOC     KermCheck.L3                     * 2E538
        C=C-1   A                                * 2E53B
        GOC     KermCheck.L4                     * 2E53D
        C=0     A                                * 2E540
        C=C+1   A                                * 2E542
        R1=C                                     * 2E544
        C=B     B                                * 2E547
        CSR     A                                * 2E54A
        CSRB                                     * 2E54C
        CSRB                                     * 2E54F
        B=B+C   A                                * 2E552
        P=      15                               * 2E554
        GOTO    KermCheck.L5                     * 2E556
KermCheck.L3:
        C=B     A                                * 2E55A
        B=B+B   A                                * 2E55C
        B=B+B   A                                * 2E55E
        B=C     B                                * 2E560
        P=      14                               * 2E563
        GOTO    KermCheck.L5                     * 2E565
KermCheck.L4:
        B=A     A                                * 2E569
        ASL     M                                * 2E56B
        P=      3                                * 2E56E
        A=A+A   WP                               * 2E570
        A=A+A   WP                               * 2E573
        A=B     B                                * 2E576
        B=A     W                                * 2E579
        P=      13                               * 2E57C
KermCheck.L5:
        C=0     W                                * 2E57E
KermCheck.loop6:
        CSL     W                                * 2E581
        CSL     W                                * 2E584
        CPEX    15                               * 2E587
        LC(2)   #3F                              * 2E58B
        B=B&C   B                                * 2E58F
        LC(2)   #20                              * 2E593
        C=C+B   B                                * 2E597
        BSR     W                                * 2E59A
        BSR     W                                * 2E59D
        P=C     15                               * 2E5A0
        P=P+1                                    * 2E5A4
        GONC    KermCheck.loop6                  * 2E5A6
        RTN                                      * 2E5A9
        RPL

* id/lam ->
* refs (4): 21EFF 21F09 B811A B8B2E
SENDNAME:
        :: ONE{}N SENDLIST ;                     * 2E5AB

* refs (2): 2E60F 2E646
* id -> ...: recalls the variable, keeps it in LAMOBJ and sends it as a file. Undefined name errors if it does not exist
KermSendVar:
        :: DUP@ NOTcase ErrUndefName             * 2E5BF
          ' LAMOBJ STO DROP KermSendObj NOTcase KermFailOut * 2E5D3
        ;                                        * 2E5F6

* refs (2): 2E736 2E740
SENDLIST~1:
        :: DUP nm=>st 'LAMLNAMESTO KermSendVar ; * 2E5FB

* refs (1): 2E74A
SENDLIST~list:
        :: INNERCOMP #2<> caseSIZEERR nm=>st!    * 2E619
          'LAMLNAMESTO dup;#nm? case SETTYPEERR  * 2E632
          KermSendVar ;                          * 2E646

* refs (3): 2D81B 2E62D 2E8AC
nm=>st!:
        :: dup;#nm? ?SKIP nm=>st                 * 2E650
          DUPTYPECSTR? ?SEMI                     * 2E664
          SETTYPEERR ;                           * 2E66E

* refs (2): 2E722 2E83A
* {} ->: runs the next object in the caller's stream for each element of the list, then skips that object
KermDoList:
        :: BEGIN INNERDUP #0<> WHILE             * 2E678
          :: #1-{}N SWAP 3@REVAL ; REPEAT DROP COLASKIP ; * 2E691

* refs (2): 2E6F0 85596
InitIOEnv:
        :: KermInitPar BINT0                     * 2E6BE
          { LAMKP LAMPKNO } BIND ;               * 2E6CD

* {} ->
* refs (4): 21F13 2E5B5 B8115 B8B29
SENDLIST:
        :: InitIOEnv BINT0 NULL$ CHR_F ERRSET    * 2E6EB
          :: KERMOPEN CHOOSE_INIT SendSetup NOTcaseFALSE KermDoList * 2E709
            :: CK&DISPATCH1                      * 2E727
              BINT6 SENDLIST~1                   * 2E731  name
              BINT7 SENDLIST~1                   * 2E73B  local
              BINT5 SENDLIST~list                * 2E745  list
            ;                                    * 2E74F
            SENDEOT ;                            * 2E754
          ERRTRAP                                * 2E75E

* refs (3): 2D91F 2E98A 8560F
* Error handler of the Kermit commands: tells the other side with an E packet, then raises the error again
KermErrOut:
          :: DropSysErr$ SENDERROR               * 2E763

* refs (3): 2EE88 2EEB5 855D3
* Allows the printer and display again, then raises the current error
KermErrJmp:
            :: AllowPrlcdCl ERRJMP ; ;           * 2E772
          AllowPrlcdCl NOTcase KermFailOut       * 2E78B
          ABND ;                                 * 2E79A

* refs (11): 2DFDC 2E637 2E655 2E817 2FDFD 31962 ...
dup;#nm?:
        :: DUPTYPEIDNT? OVER TYPELAM? ORNOT ;    * 2E7A4

* refs (1): 2E5CE
* id ->: raises "Undefined Local Name" for a local name, "Undefined Name" for a global one
ErrUndefName:
        :: TYPELAM? # 3                          * 2E7C2

* refs (1): 2E00E
DOSERVER~5:
          # 204 RPITE ERROROUT ;                 * 2E7D6  "Undefined Name"

* $/id/lam ->
* refs (6): 21F33 21F3D 21F47 2E84E 2E858 B8AB2
GETNAME:
        :: NULL$ kget(nm,st) ;                   * 2E7EF

* refs (1): 2E862
kget({2nm}):
        :: INNERCOMP #2<> caseSIZEERR dup;#nm?   * 2E803
          case SETTYPEERR                        * 2E81C
          nm=>st kget(nm,st) ;                   * 2E826

* refs (2): 21F51 B8AAD
kget(li):
        :: KermDoList                            * 2E835
          :: CK&DISPATCH1                        * 2E83F
            BINT6 GETNAME                        * 2E849  name
            BINT3 GETNAME                        * 2E853  string
            BINT5 kget({2nm})                    * 2E85D  list
          ;                                      * 2E867
          AllowPrlcdCl ;                         * 2E86C

* ->
* refs (1): 21FC0
DOFINISH:
        ::                                       * 2E876

_F_:
          $ "F"                                  * 2E87B

_G_:
          $ "G" DOPKT DROP ;                     * 2E887

* refs (2): 2E7F9 2E82B
kget(nm,st):
        :: SWAP nm=>st!                          * 2E8A2

_R_:
          $ "R" ROT GOTO kget(nm,st)~1 ;         * 2E8B1

* $ $' ->
* refs (3): 220EC 2E893 B89A9
DOPKT:
        :: BINT0                                 * 2E8D1
kget(nm,st)~1:
          KermInitPar BINT0                      * 2E8DB
          { LAMKP LAMPKNO } BIND ERRSET          * 2E8E5
          :: ZEROFALSE                           * 2E903
            { LAMLNAME LAMKMODE LAMKRM } BIND EXCHINITPK SWAP ENCODE1PKT * 2E90D
            BINT0 ROT CAR$ BUILDKPACKET SEND_PACKET case * 2E93A
            :: ABND AllowPrlcdCl DOPKT~2 ;       * 2E958
            NOTcase ERROROUT                     * 2E971
            DOPKT~1 ;                            * 2E97B
          ERRTRAP KermErrOut ABND ;              * 2E985

* refs (4): 2EAB0 B8BF7 B8C06 B8C1F
ResetIOPAR&->:
        ::                                       * 2E999

* -> {}
* refs (1): C748E
StdIOPAR:
          { %9600 %0_2A2B4 %0_2A2B4 %0_2A2B4 %3 %1 } DUP * 2E99E

* {} ->
* refs (4): 2ECBB 305E3 B8177 C7493
StoIOPAR:
          :: '                                   * 2E9CB

IOPAR:
            ID IOPAR                             * 2E9D5

* ob ID ->
* refs (1): 31F9A
SysSTO:
            :: CONTEXT@                          * 2E9E6

{local''}_2E9F0:
              { NULLLAM } BIND HOMEDIR ERRSET STO ERRTRAP * 2E9F0
              :: 1GETLAM CONTEXT! ERRJMP ; 1GETABND CONTEXT! ; * 2EA18
          ;                                      * 2EA40
          INCOMPDROP ;                           * 2EA45

* -> %baud % % % % %
* refs (15): 221A4 22478 2EAE7 2EB67 2EC9D 2ECED ...
GetIOPAR:
        :: '                                     * 2EA4F

IOPAR_2EA59:
          ID IOPAR                               * 2EA59

* ID -> ob T -> F
* refs (3): 31FCB B8B73 B8BED
Sys@:
          :: CONTEXT@ DUPDUP 2DROP HOMEDIR SWAP DRPExitAtLOOP DUP ITE ROT * 2EA6A
            SWAP                                 * 2EA9C
            CONTEXT! ;                           * 2EAA1
          NOTcase ResetIOPAR&->                  * 2EAAB
          DUPTYPELIST? NOTcase SetIOPARerr       * 2EAB5
          INNERCOMP BINT6 #<> casedrop SetIOPARerr * 2EAC4
        ;                                        * 2EADD

* refs (7): 2D51C 2D88E 2D9FA 2DB53 2DE19 2E70E ...
KERMOPEN:
        :: GetIOPAR 4DROP BINT33 TestSysFlag IT DROP%0b * 2EAE2  flag -33: Transfer via wire / Transfer via IR
          FalseFalse 2SWAP KERMOPEN~2 KERMOPEN~1 * 2EB05
          :: TOADISP REDISPHBUFF ; OpenUartClr ; * 2EB19

* refs (2): 21EBF D4223
DOOPENIO:
        CON(5)  (*)+5                            * 2EB37  primitive code object
        ASSEMBLE
        AD1EX                                    * 2EB3C
        D1=(5)  uart_error                       * 2EB3F
        C=0     A                                * 2EB46
        DAT1=C  1                                * 2EB48
        D1=D1+  3                                * 2EB4C
        DAT1=C  B                                * 2EB4F
        D1=A                                     * 2EB52
        LC(5)   OpenIO                           * 2EB55
        A=C     A                                * 2EB5C
        PC=(A)                                   * 2EB5E
        RPL

* refs (5): 2EB55 2EE1D 2EE74 2EEA1 31881
OpenIO:
        :: GetIOPAR 2DROP IOCheckReal %0<> 4UNROLL IOCheckReal %0<> 4UNROLL * 2EB62

* refs (1): 2EB0F
KERMOPEN~2:
          :: IOCheckReal DUP %ABS %5 %< NOTcase SetIOPARerr * 2EB8F
            DUP %0> IT                           * 2EBB7

4+(r):
            :: %4 %+ ;                           * 2EBC6
            %IP># 4UNROLL IOCheckReal %IP># s=okBaud? NOTcase SetIOPARerr * 2EBDA
            4UNROLL ;                            * 2EBFD
          OpenUart?Clr ;                         * 2EC07

* % -> #IP(ABS(%))
* refs (9): 2EBDA 2EBE9 2EC89 2ED15 2EE9C 30389 ...
%IP>#:
        :: %IP %ABSCOERCE ;                      * 2EC11

* refs (6): 2EB71 2EB80 2EB94 2EBE4 30384 30B53
IOCheckReal:
        :: DUPTYPEREAL? ?SEMI                    * 2EC25

* Error C12h
* refs (6): 2EABF 2EAD8 2EBB2 2EBF8 303A2 30B62
SetIOPARerr:
          :: # C12 ERROROUT ; ;                  * 2EC34  "Invalid IOPAR"

* refs (3): 2EBEE 2EC8E B852B
s=okBaud?:
        CON(5)  (*)+5                            * 2EC52  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 2EC57
        CD1EX                                    * 2EC5A
        D1=D1+  5                                * 2EC5D
        A=DAT1  A                                * 2EC60
        D1=C                                     * 2EC63
        LC(5)   #004B0                           * 2EC66
        P=      12                               * 2EC6D
s=okBaud?.loop1:
        ?C=A    A                                * 2EC6F
        GOYES   s=okBaud?.L2                     * 2EC72
        C=C+C   A                                * 2EC74
        P=P+1                                    * 2EC76
        GONC    s=okBaud?.loop1                  * 2EC78
        P=P+1                                    * 2EC7B
s=okBaud?.L2:
        GOVLNG  PushT/FLoop                      * 2EC7D
        RPL

* % ->
* refs (2): 2201B 223B5
DOBAUD:
        :: %IP># s=okBaud? NcaseSIZEERR UNCOERCE * 2EC84
          GetIOPAR 6ROLL DROP                    * 2EC9D

* refs (8): 2ED06 2ED42 2ED6A B80E3 B861B B899A ...
6->list;StoInIPAR:
          :: BINT6 {}N StoIOPAR ; ;              * 2ECAC

* % ->
* refs (2): 2203B 2242D
DOPARITY:
        :: %IP DUP %ABS %5 %< NcaseSIZEERR GetIOPAR * 2ECCA
          7ROLL 6ROLL DROP 5UNROLL 6->list;StoInIPAR ; * 2ECF2

* % ->
* refs (2): 2205B 22469
DOTRANSIO:
        :: %IP># DUP BINT3 #> caseSIZEERR UNCOERCE * 2ED10
          GetIOPAR DROP 6ROLL 6->list;StoInIPAR ; * 2ED33

* refs (2): 21FFB 223EC
DOCKSM:
        :: IO%1to3? NcaseSIZEERR GetIOPAR        * 2ED4C
          7ROLL ROTDROPSWAP 6->list;StoInIPAR ;  * 2ED60

* refs (3): 2ED51 30B58 B84EA
* % -> %' flag: %' is the integer part without sign, flag TRUE when it is 1, 2 or 3 (checksum type, transfer format)
IO%1to3?:
        :: %IP %ABS DUP %4 %< OVER %0<> AND ;    * 2ED74

* -> $
* refs (1): 22076
DOKERRM:
        :: NULL$                                 * 2EDA6
          CODE                                   * 2EDB0  34 nibbles
            AD1EX                                * 2EDBA
            D1=(5)  KERMERRM                     * 2EDBD
            C=DAT1  A                            * 2EDC4
            AD1EX                                * 2EDC7
            ?C=0    A                            * 2EDCA
            GOYES   DOKERRM.L1                   * 2EDCD
            DAT1=C  A                            * 2EDCF
DOKERRM.L1:
            A=DAT0  A                            * 2EDD2
            D0=D0+  5                            * 2EDD5
            PC=(A)                               * 2EDD8
          ENDCODE                                * 2EDDC
        ;                                        * 2EDDC

* -> % 0/1
* refs (1): 22091
DOBUFLEN:
        :: UARTBUFLEN UNCOERCE2 ;                * 2EDE1

* refs (1): 220B1
DOSTIME:
        :: %10* %ABSCOERCE DUP StimeSRecv(s) StimeXmit(s) ; * 2EDF5

* ->
* refs (1): 220CC
DOSBRK:
        :: OpenIO DOSBRK~1 OpenIO_324C8 ;        * 2EE18

* refs (1): 2EE60
* # ->: stores the number as the last error, for ERRN and ERRM after a failed XMIT or SRECV
IOErr!:
        CON(5)  (*)+5                            * 2EE31  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 2EE36
        CD0EX                                    * 2EE3D
        GOVLNG  SAVEERRN.L1                      * 2EE40
        RPL

* refs (2): 2EE8D 2EEBA
* TRUE / #err FALSE -> %: 1 when the transfer worked. On failure saves the error and gives 0. ATTN aborts
IOResult%:
        :: OpenIO_324C8 case %1                  * 2EE47
          ~ATTNERR;#=casedrop;ABORT IOErr!       * 2EE5B
          %0_2A2B4 ;                             * 2EE65

* $ ->
* refs (1): 21E84
DOXMIT:
        :: OpenIO ERRSET PUTSERIAL ERRTRAP KermErrJmp IOResult% ; * 2EE6F

* % ->
* refs (1): 21EA4
DOSRECV:
        :: %IP># OpenIO ERRSET GETSERIAL ERRTRAP KermErrJmp IOResult% ; * 2EE97

* refs (2): 2E718 2EF32
SendSetup:
        :: 4UNROLL FALSE                         * 2EEC4
          { LAMLNAME LAMOBJ LAMPACKET LAMKRM } BIND CHR_S SWAP KermSendInit * 2EED3
          NOTcase false;Lpop                     * 2EF05
          'LamKPSto TRUE ;                       * 2EF0F

* refs (2): 2DE0F 2E027
DOSERVER~6:
        :: LAMEXCHP ERRSET                       * 2EF1E

* refs (1): 855E7
XEQIOBACKUP~2:
          :: SendSetup NOTcaseFALSE KermSendObj  * 2EF2D
            NOTcaseFALSE SENDEOT                 * 2EF41
            case                                 * 2EF4B

* refs (3): 2D654 2F628 6AE60
Lpop;true:
            :: ABND TRUE ;                       * 2EF50

* refs (3): 2D4F9 2EF0A 34FAC
false;Lpop:
            :: FALSE ABND ; ;                    * 2EF64
          ERRTRAP                                * 2EF7D
          :: DropSysObs ERROR@ FalseFalse ; ;    * 2EF82

* refs (5): 2DC07 2DCFC 2DDD3 2DF6A 2E4C8
* #err -> $: the error's text; number 0 counts as ATTN, "Interrupted"
KermErrMsg:
        :: DUP#0=IT                              * 2EFA0
          :: DROP ATTNERR ; GETTHEMESG ;         * 2EFAA

* refs (3): 2E5F1 2E795 85637
* ... flag ->: FALSE raises the error number on the stack; TRUE looks at the packet that failed, showing an E packet's text, and raises "Transfer Failed"
KermFailOut:
        :: NOTcase ERROROUT                      * 2EFC8

* refs (2): 2D8BB 2D8DE
TRPACKETFAIL:
          :: CHR_E EQUAL IT                      * 2EFD7
            :: DROP DECODE KERMERRM! KermShowErr ; * 2EFEB
            XFERFAIL ERROROUT ;                  * 2F009
        ;                                        * 2F018

* refs (3): 2DC11 2DFA5 2EFFF
* $ ->: beeps and shows an error in the status area for 3 seconds. ON quits
KermShowErr:
        :: ERRBEEP KDispStatus2 %3 dowait ?ATTNQUIT ; * 2F01D

* refs (1): 2F095
* Writes "Packet #" on row 2 and clears LAMKRM
KermShowPkt:
        ::                                       * 2F040

* refs (2): 2F1DF 2F4F7
* -> $: the text "Packet #"
KermPacket$:
          :: # C10 JstGetTHEMESG ; KDispRow2 FALSE' LAMKRM STO ; * 2F045  "Packet #"

* refs (2): 2F266 2FA38
* Shows the current packet number after "Packet #", unless I/O messages are off (flag -39). Rewrites the row first if a retry message is on it
KermDispPkt#:
        :: BINT39 TestSysFlag ?SEMI              * 2F077  flag -39: Show I/O messages / No I/O messages
          LAMKRM IT KermShowPkt                  * 2F08B
          LAMPKNO #>$ $>GROB HARDBUFF LAMKML # 8 GROB! ; * 2F09A

* refs (1): 2F25C
Lpop;q:
        :: ABND RDROP ;                          * 2F0C7

* refs (2): 2E5E7 2EF3C
* -> flag: sends the object in LAMOBJ under the name LAMLNAME, showing "Sending ". The header and format depend on the translation settings
KermSendObj:
        ::                                       * 2F0DB

<COD>:
          # C0D JstGetTHEMESG LAMLNAME &$ KDispStatus2 LAMLNAME LAMPACKET * 2F0E0  "Sending "
          FalseFalse LAMOBJ LAMPACKET CHR_X EQUAL ITE NULL$TEMP * 2F108
          :: XEQTYPE COERCE BINT16 #< ASCIIXfer? ANDITE * 2F12B
            :: DUPTYPECSTR? IT DECOMP$           * 2F14E

* refs (1): 2F3FB
_%%HP:_:
              $ "%%HP:" HeadIOString !append$ CHR_; >T$ APNDCRLF ; * 2F162
            :: ?>ROMPTR ROTDROP TRUE 3UNROLL VERSTRING ; ; * 2F194
          SWAP' LAMOBJ STO NULL{} SWAP THREE{}N BINT0 KermPacket$ DUP * 2F1BC
          5UNROLL LEN$ BINT6 #*                  * 2F1E9
          { NULLLAM LAMKLIST LAMOPOS             * 2F1FD

* refs (2): 2F0AE 2F50B
LAMKML:
            LAM 'KML }                           * 2F211
          BIND KDispRow2 SWAP ENCODE1PKT GetKermPkt# ROT BEGIN BUILDKPACKET * 2F225
          SEND_PACKET DUP NOTcase Lpop;q         * 2F24D
          2DROP KermDispPkt# LAMOPOS MINUSONE #<> WHILE * 2F261
          :: LAMOBJ LAMKLIST INCOMPDROP KermPktFull? ITE * 2F27F

drop(4);rot:
            :: 4ROLL DROPROT ;                   * 2F29D
            :: ROT NOTcase KermNextBlock         * 2F2B1
              ROTDROP TRUE ;                     * 2F2C5
            UNROTDUP GETKP ENCODE ITE            * 2F2D4

drop(2-4);<FFFFF>:
            :: 4UNROLL3DROP MINUSONE ;           * 2F2E8
            :: ROTSWAP #1+LAST$ SWAP 4UNROLL THREE{}N ' LAMKLIST STO BINT0 ; * 2F2FC
            ' LAMOPOS STO GetKermPkt# CHR_D ;    * 2F333
          REPEAT ABND NULL$ GetKermPkt# CHR_Z BUILDKPACKET SEND_PACKET * 2F351
          NOTcaseFALSE DROPTRUE                  * 2F374
        ;                                        * 2F37E

* refs (5): 2D64F 2F731 2F862 2FA47 2FA83
IncrLAMPKNO:
        :: LAMPKNO #1+ 'LamPKNOSto ;             * 2F383

* refs (12): 2D596 2D63B 2D6E5 2E0B3 2F239 2F342 ...
GetKermPkt#:
        :: LAMPKNO # 40 #/ DROP ;                * 2F39C

* refs (1): 2F556
KermRecvData~1:
        :: LAMLNAME BINT0 EQUAL caseFALSE HeaderMatch? * 2F3BF
          caseFALSE HeadIOString                 * 2F3DD
          ' LAMKMODE STO DUP _%%HP:_ BINT1 POS$ DUP#0= casedrop * 2F3E7
          :: ASCIIXfer? NOTcaseFALSE NULL$TEMP   * 2F414
            TRUE ;                               * 2F428
          #5+ LAST$ DUP tok; BINT1 POS$ 2DUP #1+LAST$ 3UNROLL 1_#1-SUB$ TRUE ; * 2F432

* refs (4): 2F579 2FB69 2FB7D 2FBE1
Π'KEOF:
        LAM 'KEOF                                * 2F46E

* refs (3): 2F597 2F5D3 2F5E2
KermRecvData~2:
        :: LAMKMODE OBJ_30477 DROP ABND ;        * 2F47F

* refs (2): 2F5A1 2F614
KermRecvData~3:
        :: # 86 #>CHR >T$ OVER !append$ KERMERRM! DROP KermRecvPkt ITE 3DROP * 2F49D
          DROP                                   * 2F4D9
          #SyntaxErr KermSendErr FALSE ;         * 2F4DE

* refs (1): 2F916
* Shows "Packet #", binds the column for the number (LAMKML) and reads the first data packet
KermRecvData:
        :: KermPacket$ DUPLEN$ #6*               * 2F4F2

{Π'KML}:
          { LAMKML } BIND KDispRow2 KermNextData NOTcase * 2F506
          :: ROTDROP FALSE ;                     * 2F529
          NOTcase                                * 2F53D

* ob ob' -> T
2DROPTRUE:
          :: 2DROP TRUE ;                        * 2F542
          KermRecvData~1 case                    * 2F556
          :: ROT BINT0                           * 2F560
            { LAMKPTRN Π'KEOF } BIND OBJ_30477 NOTcase * 2F56F
            :: KermRecvData~2 NULL$TEMP KermRecvData~3 ; * 2F592
            KINVISLF ' LAMKPTRN STO ERRSET ParseIO ERRTRAP * 2F5AB
            :: KermRecvData~2 ERRJMP ; KermRecvData~2 NOTcaseFALSE NOTcase * 2F5CE
            :: LEN$ #- 2DUP LAST$ 3UNROLL 1_#1-SUB$ KermRecvData~3 ; * 2F5F1
            NOTcaseTRUE OBJ_2F68C                * 2F61E
            Lpop;true ;                          * 2F628
          BEGIN !!append$ KermNextData NOTcase RDROPFALSE * 2F632
          NOT_UNTIL ABND NOTcase DROPTRUE        * 2F64B
          OBJ_30607 LAMLNAME BINT0 EQUAL ITE     * 2F65F

* refs (1): 2E967
DOPKT~2:
          :: KINVISLF !append$ ;                 * 2F678

* refs (1): 2F623
OBJ_2F68C:
          :: LAMLNAME xSTONoCK ;                 * 2F68C
          TRUE ;                                 * 2F6A0

* refs (2): 2F803 2FB2D
* #seq x $ -> flag: no usable packet. While retries remain (MAXRETRY), acknowledges again with an empty ACK and returns TRUE; else sends "Transfer Failed" to the other side and returns FALSE
KermRecvRetry:
        :: DROPSWAPDROP MAXRETRY KermRetry? NOTcasedrop * 2F6AA
          :: XFERFAIL KermSendErr ;              * 2F6C3
          SENDNULLACK TRUE ;                     * 2F6D7

* refs (2): 2F740 2F9F2
* Binds LAMRETRY to MAXRETRY
KermBindRetry:
        :: MAXRETRY                              * 2F6E6

{Π'RETRY}:
          { LAMRETRY } BIND ;                    * 2F6F0

* refs (3): 2D8C5 2DF24 2F83F
* -> flag flag: receives a file, from the F packet to the B (end of transmission) packet, acknowledging each packet
KermRecvFile:
        :: ACK_INIT NOTcase                      * 2F709
          :: SENDNAK FalseFalse ;                * 2F718
          GetKermPkt# IncrLAMPKNO SENDACK 'LamKPSto * 2F72C
KermRecvFile.loop1:
          KermBindRetry                          * 2F740
KermRecvFile.loop2:
          RecvNextPkt NOTcaseFALSE OVER          * 2F745
          GetKermPkt# #=case                     * 2F754
          :: ABND DUP CHR_F EQUAL ?GOTO KermRecvFile.L3 DUP CHR_B EQUALcase * 2F75E
            :: DROPSWAPDROP SENDNULLACK TRUE ;   * 2F790
            LAMLNAME TYPECSTR? case TrueFalse    * 2F7A9
            DUP CHR_X EQUAL ?GOTO KermRecvFile.L3 TrueFalse ; * 2F7BD
          KermPrevPkt? case                      * 2F7E0
          :: DUP CHR_Z EQUALcase                 * 2F7EA
            :: KermRecvRetry ?GOTO KermRecvFile.loop2 Lpop;2false ; * 2F7FE
            ABND DUP CHR_S EQUALcasedrp          * 2F81C
            :: 'LamPKNOSto COLA KermRecvFile     * 2F830
            ;                                    * 2F844
            TrueFalse ;                          * 2F849
          COLA Lpop;true;false                   * 2F853
KermRecvFile.L3:
          DROP IncrLAMPKNO SWAP DECODE LAMLNAME TYPECSTR? NOTcase * 2F85D
          :: ZEROSWAP APNDCRLF GOTO KermRecvFile.L4 ; * 2F880
          LAMLNAME DUPNULL$? NOT?SWAPDROP KermRecvFile~1 NOTcase * 2F89E
          :: DROP OBJ_672DC KermSendErr FALSE ;  * 2F8B7
          NULL$TEMP                              * 2F8D5
KermRecvFile.L4:
          SWAPDUP 'LAMLNAMESTO ID>$ DUP # C0E JstGetTHEMESG !insert$ * 2F8DA  "Receiving "
          KDispStatus2 ENCODE1PKT ROT SENDACK KermRecvData NULL$ * 2F902
          'LAMLNAMESTO ?GOTO KermRecvFile.loop1 NOTcase * 2F920

* -> F F
* refs (15): 0AAB7 2461D 2D5D7 2D726 2EB05 2EF91 ...
FalseFalse:
          :: FALSE FALSE ;                       * 2F934
          INCOMPDROP TrueFalse ;                 * 2F948

* refs (3): 2D65E 2F7E0 2FAE7
* #seq x -> #seq x flag: TRUE when #seq is the sequence number of the previous packet, modulo 64: the other side did not see our reply
KermPrevPkt?:
        :: OVER LAMPKNO #1- # 40 #/ DROP #= ;    * 2F957

* refs (3): 2D893 2F745 2F9F7
RecvNextPkt:
        :: BEGIN KermRecvPkt NOT_WHILE           * 2F989
          :: MAXRETRY KermRetry? NOTcase         * 2F99D
            :: 2RDROP Lpop;2false ;              * 2F9B1
            DROPNULL$ GetKermPkt# CHR_N SENDPKT ; * 2F9C5
          REPEAT TRUE ;                          * 2F9DE

* refs (3): 2F51F 2F63C 2FB8C
* -> ...: reads the next packet of a file, retrying as needed. D carries data, Z ends the file. Acknowledges with SENDNULLACK
KermNextData:
        :: KermBindRetry                         * 2F9ED
KermNextData.L1:
          RecvNextPkt NOTcaseFALSE OVER          * 2F9F7
          GetKermPkt# #=case                     * 2FA06
          :: ABND DUP CHR_D EQUALcasedrp         * 2FA10
            :: SWAP DECODE KermDispPkt# SWAPDUP SENDNULLACK IncrLAMPKNO DROP * 2FA29
              TrueTrue ;                         * 2FA51
            DUP CHR_Z EQUALcasedrp               * 2FA5B
            :: DROP DECODE GetKermPkt# SENDNULLACK IncrLAMPKNO CAR$ CHR_D * 2FA6A
              EQUALcase                          * 2FA92
              :: # C0F JstGetTHEMESG KDispRow2 FalseFalse TRUE ; * 2FA97  "Object Discarded"
              TrueFalse TRUE ;                   * 2FABF

* refs (2): 2FB4B 2FB5A
3->list;true;false:
            :: THREE{}N TrueFalse ; ;            * 2FACE
          KermPrevPkt? case                      * 2FAE7
          :: DUP CHR_D EQUAL OVER CHR_F EQUALOR OVER CHR_X EQUALOR case * 2FAF1
            :: KermRecvRetry ?GOTO KermNextData.L1 Lpop;2false ; * 2FB28
            ABND 3->list;true;false ;            * 2FB46
          ABND 3->list;true;false ;              * 2FB55

* refs (1): 26257
* For the parser reading a file as it arrives: the next piece of text from the packets, with Π'KEOF marking the end. Called from #26257
KermParseChunk:
        :: Π'KEOF TYPEBINT? NOTcase              * 2FB64
          :: Π'KEOF failed ;                     * 2FB78
          KermNextData NOTcaseFALSE case         * 2FB8C
          :: LAMKPTRN !insert$ KINVISLF ' LAMKPTRN STO TrueTrue ; * 2FB9B
          LAMKPTRN NULL$? NOTcase                * 2FBC8
          :: ' Π'KEOF STO LAMKPTRN TrueTrue ;    * 2FBD7
          failed ;                               * 2FBFA

* refs (1): 2F2C0
* Builds the next data packet's text from the object being sent: binary chunks for binary mode, the decompiled text otherwise
KermNextBlock:
        :: 4GETLAM case                          * 2FC04
          :: SWAPINCOMP DUP#0= NOT?DROP          * 2FC13
            CKREF ROT KermObjChunk SWAP4ROLL !insert$ SWAPROT ONE{}N 3UNROLL ; * 2FC27
          3PICK TYPECSTR? case                   * 2FC54
          :: NULL$ ' LAMOBJ STO ROT KVISLF !append$ TRUE ; * 2FC63
          BEGIN 3PICK ROT savefmt1 ERRSET DclLine19 ERRTRAP ederr rstfmt1 * 2FC95
          3UNROLL KVISLF !append$ APNDCRLF KermPktFull? 3PICK NULLCOMP? OR * 2FCC2
          UNTIL ROTDROP OVER NULLCOMP? ;         * 2FCEA

* refs (2): 2F293 2FCD6
* $ -> $ flag: TRUE when the text is longer than the packet size in KP
KermPktFull?:
        :: DUPLEN$ LAMKP CAR$ CHR># #> ;         * 2FD03

* refs (1): 2FC31
* ob #pos -> $: copies up to #B6 nibbles (91 bytes) of a binary object from offset #pos into a new string and advances #pos in place
KermObjChunk:
        CON(5)  (*)+5                            * 2FD26  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 2FD2B
        A=DAT1  A                                * 2FD32
        D0=A                                     * 2FD35
        R0=A                                     * 2FD38
        D1=D1+  5                                * 2FD3B
        A=DAT1  A                                * 2FD3E
        D1=A                                     * 2FD41
        D1=D1+  5                                * 2FD44
        A=DAT1  A                                * 2FD47
        R3=A                                     * 2FD4A
        C=0     A                                * 2FD4D
        LC(2)   #B6                              * 2FD4F
        A=A+C   A                                * 2FD53
        DAT1=A  A                                * 2FD55
        GOSBVL  SKIPOB                           * 2FD58
        A=R0                                     * 2FD5F
        C=R3                                     * 2FD62
        C=C+A   A                                * 2FD65
        AD0EX                                    * 2FD67
        A=A-C   A                                * 2FD6A
        C=0     A                                * 2FD6C
        GOC     KermObjChunk.L1                  * 2FD6E
        LC(2)   #B6                              * 2FD71
        ST=0    2                                * 2FD75
        A=A-C   A                                * 2FD78
        GONC    KermObjChunk.L2                  * 2FD7A
        C=C+A   A                                * 2FD7D
KermObjChunk.L1:
        ST=1    2                                * 2FD7F
KermObjChunk.L2:
        GOSUB   KermObjCopy                      * 2FD82
        GOSBVL  GETPTR                           * 2FD86
        A=R0                                     * 2FD8D
        DAT1=A  A                                * 2FD90
        ?ST=1   2                                * 2FD93
        GOYES   KermObjChunk.L3                  * 2FD96
KermObjChunk.L3:
        GOVLNG  PushT/FLoop                      * 2FD98

* refs (1): 2FD82
* C.A = nibbles, R3 = offset, D1 = object -> new string with those nibbles
KermObjCopy:
        R1=C                                     * 2FD9F
        C=C+1   A                                * 2FDA2
        CSRB.F  A                                * 2FDA4
        GOSBVL  MAKE$                            * 2FDA9
        AD0EX                                    * 2FDB0
        C=DAT1  A                                * 2FDB3
        B=C     A                                * 2FDB6
        C=R3                                     * 2FDB8
        C=C+B   A                                * 2FDBB
        D0=C                                     * 2FDBD
        D1=A                                     * 2FDC0
        C=R1                                     * 2FDC3
        GOSBVL  MOVEDOWN                         * 2FDC6
        C=R1                                     * 2FDCD
        ?CBIT=0 0                                * 2FDD0
        RTNYES                                   * 2FDD5
        C=0     A                                * 2FDD7
        DAT1=C  1                                * 2FDD9
        RTN                                      * 2FDDD
        RPL

* refs (1): 2F8AD
KermRecvFile~1:
        :: ZEROSWAP DUP                          * 2FDDF
KermRecvFile~1.loop1:
          palparse NOTcase 5DROPFALSE            * 2FDEE
          dup;#nm? case                          * 2FDFD
          :: ROM-WORD? ?GOTO KermRecvFile~1.L2 2DROPFALSE ; * 2FE07
          dup;RclInVars(gn)? NOTcase XYZ>ZTRUE   * 2FE25
          DROP BINT36 TestSysFlag case XYZ>ZTRUE * 2FE34  flag -36: RECV renames / RECV overwrites
          DROP                                   * 2FE4D
KermRecvFile~1.L2:
          SWAP#1+SWAP DUP DPRADIX? ITE CHR_. CHR_, * 2FE52
          >T$ 3PICK #>$ &$ GOTO KermRecvFile~1.loop1 ; * 2FE70
        BSS     14                               * 2FE93  zeros

* refs (4): 2DE5A 2F736 2F911 2FEBF
SENDACK:
        :: CHR_Y SENDPKT ;                       * 2FEA1

* refs (5): 2DEC5 2F6D7 2F79A 2FA42 2FA7E
SENDNULLACK:
        :: NULL$SWAP SENDACK ;                   * 2FEB5

* $ -> $'
* refs (3): 2E0D6 2FC81 2FCC7
KVISLF:
        :: ChkTransio KVISLF~1 ;                 * 2FEC9

* $ -> $'
* refs (1): 3217A
KVIS:
        :: ChkTransio KVIS~1 ;                   * 2FEDD

* refs (1): 2FED3
KVISLF~1:
        CON(5)  (*)+5                            * 2FEF1  primitive code object
        ASSEMBLE
        ST=1    4                                * 2FEF6
        GOTO    KVIS~1.L1                        * 2FEF9

* refs (1): 2FEE7
KVIS~1:
        CON(5)  (*)+5                            * 2FEFD  primitive code object
        ST=0    4                                * 2FF02
KVIS~1.L1:
        GOSBVL  POP#                             * 2FF05
        GOSBVL  SAVPTR                           * 2FF0C
        GOSUB   KVISMode                         * 2FF13
        GOC     KVIS~1.L2                        * 2FF17
        A=C     A                                * 2FF1A
        GONC    KVIS~1.L7                        * 2FF1C
KVIS~1.L2:
        GOSUB   KVISStr                          * 2FF1F
        R1=C                                     * 2FF23
        B=C     A                                * 2FF26
        D=0     A                                * 2FF28
        ST=0    3                                * 2FF2A
KVIS~1.loop3:
        B=B-1   A                                * 2FF2D
        GOC     KVIS~1.L4                        * 2FF2F
        GOSUB   SUB_2FFD0                        * 2FF32
        C=D     A                                * 2FF36
        C+P+1                                    * 2FF38
        D=C     A                                * 2FF3B
        GOTO    KVIS~1.loop3                     * 2FF3D
KVIS~1.L4:
        P=      0                                * 2FF41
        C=D     A                                * 2FF43
        GOSBVL  MAKE$N                           * 2FF45
        A=DAT1  A                                * 2FF4C
        D1=A                                     * 2FF4F
        D1=D1+  10                               * 2FF52
        C=R0                                     * 2FF55
        D0=C                                     * 2FF58
        D0=D0+  10                               * 2FF5B
        C=R1                                     * 2FF5E
        B=C     A                                * 2FF61
        ST=0    3                                * 2FF63
KVIS~1.loop5:
        B=B-1   A                                * 2FF66
        GOC     KVIS~1.L6                        * 2FF68
        GOSUB   SUB_2FFD0                        * 2FF6B
        DAT0=A  WP                               * 2FF6F
        CD0EX                                    * 2FF73
        C+P+1                                    * 2FF76
        D0=C                                     * 2FF79
        GOTO    KVIS~1.loop5                     * 2FF7C
KVIS~1.L6:
        A=R0                                     * 2FF80
        P=      0                                * 2FF83
KVIS~1.L7:
        GOVLNG  GPOverWrALp                      * 2FF85

* refs (2): 2FF13 30197
* A.A = translation mode (0-3), C=DAT1 reads the string -> D1 = its object; carry clear for mode 0, no translation; otherwise ST1 set for mode 2 and up, ST2 for mode 3
KVISMode:
        C=DAT1  A                                * 2FF8C
        D1=C                                     * 2FF8F
        D1=D1+  5                                * 2FF92
        A=A-1   A                                * 2FF95
        GONC    KVISMode.L1                      * 2FF97
        RTNCC                                    * 2FF9A
KVISMode.L1:
        ST=0    1                                * 2FF9C
        ST=0    2                                * 2FF9F
        A=A-1   A                                * 2FFA2
        RTNC                                     * 2FFA4
        ST=1    1                                * 2FFA7
        A=A-1   A                                * 2FFAA
        RTNC                                     * 2FFAC
        ST=1    2                                * 2FFAF
        RTNSC                                    * 2FFB2

* Pop $ -> C.A = length, D1 = body
* refs (9): 1689E 168ED 2E193 2E21B 30C15 30D61 ...
GetStrLenStk:
        C=DAT1  A                                * 2FFB4

* D1 = C, <REF>GetStrLen
* refs (1): 2E3C3
GetStrLenC:
        D1=C                                     * 2FFB7

* D1=$ -> C.A = length, D1 = body
* refs (4): 16084 304A0 323C9 32405
GetStrLen:
        D1=D1+  5                                * 2FFBA

* refs (2): 2FF1F 301A7
* D1 = string -> C.A = its length in bytes, D1 = its body
KVISStr:
        C=DAT1  A                                * 2FFBD
        C=C-CON A,5                              * 2FFC0
        CSRB.F  A                                * 2FFC6
        D1=D1+  5                                * 2FFCB
        RTN                                      * 2FFCE

* refs (2): 2FF32 2FF6B
SUB_2FFD0:
        P=      0                                * 2FFD0
        A=0     A                                * 2FFD2
        A=DAT1  B                                * 2FFD4
        D1=D1+  2                                * 2FFD7
        CD1EX                                    * 2FFDA
        RSTK=C                                   * 2FFDD
        ?ST=0   1                                * 2FFDF
        GOYES   SUB_2FFD0.L2                     * 2FFE2
        ?ABIT=1 7                                * 2FFE4
        GOYES   SUB_2FFD0.L6                     * 2FFE9
        LC(2)   #5C                              * 2FFEB
        ?C#A    B                                * 2FFEF
        GOYES   SUB_2FFD0.L2                     * 2FFF2
        P=      2                                * 2FFF4
        LC(2)   #5C                              * 2FFF6
SUB_2FFD0.loop1:
        P=      3                                * 2FFFA
        GOTO    SUB_2FFD0.loop10                 * 2FFFC
