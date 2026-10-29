* HP 48GX ROM revision R, #38000-#3A00C: Status area and annunciators
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: 'RROMPTR@ SetDA123NoCh ClrDAsOK SetDA3NoCh SetDA1NoCh SetDA2aNoCh SetDA13NoCh POLRestoreUI POLSaveUI POLResUI&Err ClrDA1IsStat SetDA3Bad
* Follows on from the previous file (at #38000 in the original ROM).
        A=DAT0  A                                * 38000
        D0=A                                     * 38003
        A=R2                                     * 38006
        C=0     A                                * 38009
        LC(2)   #14                              * 3800B
        A=A+C   A                                * 3800F
        D0=D0+  5                                * 38011
        DAT0=A  A                                * 38014
        D0=D0+  15                               * 38017
        C=R3                                     * 3801A
        DAT0=C  A                                * 3801D
        C=0     A                                * 38020
        C=C+1   A                                * 38022
        ?ST=0   6                                * 38024
        GOYES   L_38037                          * 38027
        A=R4                                     * 38029
        D0=D0+  5                                * 3802C
        DAT0=A  A                                * 3802F
        D0=D0-  5                                * 38032
        C=C+1   A                                * 38035
L_38037:
        D0=D0-  5                                * 38037
        DAT0=C  A                                * 3803A
        ?ST=0   8                                * 3803D
        GOYES   L_38046                          * 38040
        GOSUB   SUB_38327                        * 38042
L_38046:
        GOVLNG  GETPTRLOOP                       * 38046

* refs (1): 37F5C
SUB_3804D:
        ST=0    1                                * 3804D
L_38050:
        D=C     A                                * 38050
        GOSBVL  ROOM                             * 38052
        DCEX    A                                * 38059
        ?D>=C   A                                * 3805B
        RTNYES                                   * 3805E
        ?ST=0   1                                * 38060
        GOYES   L_38069                          * 38063
        GOTO    L_37E8B                          * 38065
L_38069:
        RSTK=C                                   * 38069
        GOSBVL  GARBAGECOL                       * 3806B  inline data follows
        C=RSTK                                   * 38072
        ST=1    1                                * 38074
        GONC    L_38050                          * 38077

* refs (2): 37F63 37FEF
SUB_3807A:
        D0=(5)  DSKTOP                           * 3807A
        A=DAT0  A                                * 38081
        D0=A                                     * 38084
        A=DAT0  A                                * 38087
        D0=A                                     * 3808A
        ?ST=1   7                                * 3808D
        GOYES   L_380D2                          * 38090
        B=C     A                                * 38092
        GOSBVL  SKIPOB                           * 38094
        A=DAT0  A                                * 3809B
        ?ST=1   5                                * 3809E
        GOYES   L_380B4                          * 380A1
        A=A-B   A                                * 380A3
        DAT0=A  A                                * 380A5
        AD0EX                                    * 380A8
        C=B     A                                * 380AB
        GOVLNG  MOVERSD                          * 380AD
L_380B4:
        A=A+B   A                                * 380B4
        DAT0=A  A                                * 380B6
        AD0EX                                    * 380B9
        C=B     A                                * 380BC
        RSTK=C                                   * 380BE
        GOSBVL  MOVERSU                          * 380C0
        C=RSTK                                   * 380C7
        A=B     A                                * 380C9
        D1=A                                     * 380CB
        GOTO    L_38118                          * 380CE
L_380D2:
        CAEX    A                                * 380D2
        RSTK=C                                   * 380D4
        C=R1                                     * 380D6
        RSTK=C                                   * 380D9
        C=A     A                                * 380DB
        GOSBVL  SUB_0852C                        * 380DD
        C=RSTK                                   * 380E4
        R1=C                                     * 380E6
        C=RSTK                                   * 380E9
        D0=C                                     * 380EB
        GOSBVL  SKIPOB                           * 380EE
        AD0EX                                    * 380F5
        C=R0                                     * 380F8
        ?ST=1   5                                * 380FB
        GOYES   L_38109                          * 380FE
        A=A-C   A                                * 38100
        GOVLNG  MOVEDSU                          * 38102
L_38109:
        GOSBVL  MOVEDSD                          * 38109
        A=B     A                                * 38110
        D1=A                                     * 38112
        C=R0                                     * 38115
L_38118:
        GOVLNG  WIPEOUT                          * 38118
        RPL

* [F%] -> [F%]'
* refs (8): 1D3A1 1D3F1 8E2DD 8E300 8F39B 8F3B9 ...
MATTRN:
        :: DUP MDIMS NOT?GOTO L_37DEB 2DROP CKREF OBJ_38185 ; * 3811F

* refs (1): 1D3D3
@trn(ar):
        :: DUP MDIMS NOT?GOTO L_37DEB 2DROP FreeRefs OBJ_38185 ; * 3814C

* refs (11): CBC7D CBC91 CBFA2 CBFF4 CC216 CC24A ...
@trn!(ar):
        CON(5)  (*)+5                            * 38179  primitive code object
        ASSEMBLE
        ST=0    1                                * 3817E
        GOTO    L_3818D                          * 38181

* refs (6): 38142 3816F 939B6 939E3 93A02 93A0C
OBJ_38185:
        CON(5)  (*)+5                            * 38185  primitive code object
        ST=1    1                                * 3818A
L_3818D:
        GOSBVL  SAVPTR                           * 3818D
        A=DAT1  A                                * 38194
        D0=A                                     * 38197
        D0=D0+  10                               * 3819A
        A=DAT0  A                                * 3819D
        LC(5)   DOREAL                           * 381A0
        ST=0    0                                * 381A7
        ?C=A    A                                * 381AA
        GOYES   L_381B2                          * 381AD
        ST=1    0                                * 381AF
L_381B2:
        D0=D0+  10                               * 381B2
        A=DAT0  A                                * 381B5
        R1=A                                     * 381B8
        D0=D0+  5                                * 381BB
        A=DAT0  A                                * 381BE
        R2=A                                     * 381C1
        D0=D0+  5                                * 381C4
        GOSUB   SUB_381FA                        * 381C7
        GOSBVL  GETPTR                           * 381CB
        A=DAT1  A                                * 381D2
        AD1EX                                    * 381D5
        D1=D1+  15                               * 381D8
        D1=D1+  5                                * 381DB
        C=R2                                     * 381DE
        DAT1=C  A                                * 381E1
        D1=D1+  5                                * 381E4
        C=R1                                     * 381E7
        DAT1=C  A                                * 381EA
        D1=A                                     * 381ED
        A=DAT0  A                                * 381F0
        D0=D0+  5                                * 381F3
        PC=(A)                                   * 381F6

* refs (1): 381C7
SUB_381FA:
        CD0EX                                    * 381FA
        R4=C                                     * 381FD
        C=R1                                     * 38200
        D=C     A                                * 38203
        C=R2                                     * 38205
        GOSUB   SUB_3833E                        * 38208
        C=B     A                                * 3820C
        R3=C                                     * 3820E
        D=C     A                                * 38211
L_38213:
        D=D-1   A                                * 38213
        ?D=0    A                                * 38215
        GOYES   L_38288                          * 38218
        GOSUB   SUB_3830E                        * 3821A
        A=DAT0  W                                * 3821E
        B=A     S                                * 38222
        B=B+B   S                                * 38225
        B=B+B   S                                * 38228
        GOC     L_38213                          * 3822B
        P=      15                               * 3822E
        LC(1)   #4                               * 38230
        A=A!C   S                                * 38233
        DAT0=A  W                                * 38237
        P=      0                                * 3823B
        ?ST=0   0                                * 3823D
        GOYES   L_3824C                          * 38240
        D0=D0+  16                               * 38242
        C=DAT0  W                                * 38245
        R0=C                                     * 38249
L_3824C:
        GOSUB   SUB_382DC                        * 3824C
        C=DAT0  W                                * 38250
        CAEX    W                                * 38254
        DAT0=C  W                                * 38257
        ?ST=0   0                                * 3825B
        GOYES   L_3826E                          * 3825E
        D0=D0+  16                               * 38260
        C=DAT0  W                                * 38263
        CR0EX                                    * 38267
        DAT0=C  W                                * 3826A
L_3826E:
        B=A     S                                * 3826E
        B=B+B   S                                * 38271
        B=B+B   S                                * 38274
        GOC     L_38213                          * 38277
        P=      15                               * 3827A
        LC(1)   #4                               * 3827C
        A=A!C   S                                * 3827F
        P=      0                                * 38283
        GONC    L_3824C                          * 38285
L_38288:
        P=      15                               * 38288
        LC(1)   #B                               * 3828A
        B=C     S                                * 3828D
        P=      0                                * 38290
        C=R3                                     * 38292
        D=C     A                                * 38295
        C=R4                                     * 38297
        D0=C                                     * 3829A
        D=D-1   A                                * 3829D
        D0=D0-  1                                * 3829F
L_382A2:
        D0=D0+  16                               * 382A2
        A=DAT0  S                                * 382A5
        A=A&B   S                                * 382A9
        DAT0=A  S                                * 382AD
        ?ST=0   0                                * 382B1
        GOYES   L_382D5                          * 382B4
        D0=D0+  1                                * 382B6
        A=DAT0  W                                * 382B9
        D0=D0+  15                               * 382BD
        ?ST=0   1                                * 382C0
        GOYES   L_382D5                          * 382C3
        ?A=0    W                                * 382C5
        GOYES   L_382D5                          * 382C8
        SETDEC                                   * 382CA
        A=-A-1  S                                * 382CC
        SETHEX                                   * 382CF
        DAT0=A  S                                * 382D1
L_382D5:
        D=D-1   A                                * 382D5
        GONC    L_382A2                          * 382D7
        RTN                                      * 382DA

* refs (1): 3824C
SUB_382DC:
        C=R1                                     * 382DC
        DCEX    A                                * 382DF
        C=C-1   A                                * 382E1
        RSTK=C                                   * 382E3
        GOSUB   SUB_3833E                        * 382E5
        C=RSTK                                   * 382E9
        BCEX    A                                * 382EB
        RSTK=C                                   * 382ED
        C=R2                                     * 382EF
        D=0     A                                * 382F2
        D=D-1   A                                * 382F4
L_382F6:
        D=D+1   A                                * 382F6
        B=B-C   A                                * 382F8
        GONC    L_382F6                          * 382FA
        C=R3                                     * 382FD
        C=C-1   A                                * 38300
        GOSUB   SUB_3833E                        * 38302
        C=RSTK                                   * 38306
        C=C+1   A                                * 38308
        C=C-B   A                                * 3830A
        D=C     A                                * 3830C

* refs (1): 3821A
SUB_3830E:
        C=D     A                                * 3830E
        C=C-1   A                                * 38310
        CSL     A                                * 38312
        ?ST=0   0                                * 38314
        GOYES   L_3831B                          * 38317
        C=C+C   A                                * 38319
L_3831B:
        B=C     A                                * 3831B
        C=R4                                     * 3831D
        C=C+B   A                                * 38320
        D0=C                                     * 38322
        RTN                                      * 38325

* refs (2): 37E90 38042
SUB_38327:
        D0=(5)  INITEN                           * 38327
        LC(1)   #F                               * 3832E
        DAT0=C  1                                * 38331
        RTN                                      * 38335

* refs (5): 37EA2 37EB3 37EBA 37EC1 37ED4
POP#~jump_3:
        GOVLNG  POP#                             * 38337

* refs (3): 38208 382E5 38302
SUB_3833E:
        GOVLNG  L_35790                          * 3833E
        RPL

* refs (219): A280B A2884 A2D6B A34B6 A352F A35A3 ...
* -> ob: recall the object of the ROMPTR that follows in the caller's runstream, and skip it (no check that it exists)
'RROMPTR@:
        :: 'R ROMPTR@ DROP ;                     * 38345

* refs (6): 0FDB8 0FE62 0FF34 0FFBB CAC27 CAC7C
OBJ_3835E:
        CON(5)  DOARRY                           * 3835E  array 10
        LENGTH                                   * 38363  length, to #38417
        CON(5)  DOREAL                           * 38368  element type
        CON(5)  1                                * 3836D  dimensions
        CON(5)  10                               * 38372
        %BODY   0E0                              * 38377
        %BODY   0E0                              * 38387
        %BODY   0E0                              * 38397
        %BODY   0E0                              * 383A7
        %BODY   0E0                              * 383B7
        %BODY   0E0                              * 383C7
        %BODY   0E0                              * 383D7
        %BODY   0E0                              * 383E7
        %BODY   0E0                              * 383F7
        %BODY   0E0                              * 38407
        ENDLENGTH                                * 38417

* refs (1): 0F3EE
puretemp?~1:
        CON(5)  DOARRY                           * 38417  array 10
        LENGTH                                   * 3841C  length, to #384D0
        CON(5)  DOREAL                           * 38421  element type
        CON(5)  1                                * 38426  dimensions
        CON(5)  10                               * 3842B
        %BODY   0E0                              * 38430
        %BODY   0E0                              * 38440
        %BODY   0E0                              * 38450
        %BODY   0E0                              * 38460
        %BODY   1E0                              * 38470
        %BODY   0E0                              * 38480
        %BODY   0E0                              * 38490
        %BODY   0E0                              * 384A0
        %BODY   0E0                              * 384B0
        %BODY   0E0                              * 384C0
        ENDLENGTH                                * 384D0

* refs (1): CAC68
UMSIN~3:
        CON(5)  DOARRY                           * 384D0  array 10
        LENGTH                                   * 384D5  length, to #38589
        CON(5)  DOREAL                           * 384DA  element type
        CON(5)  1                                * 384DF  dimensions
        CON(5)  10                               * 384E4
        %BODY   0E0                              * 384E9
        %BODY   0E0                              * 384F9
        %BODY   0E0                              * 38509
        %BODY   0E0                              * 38519
        %BODY   0E0                              * 38529
        %BODY   0E0                              * 38539
        %BODY   0E0                              * 38549
        %BODY   1E0                              * 38559
        %BODY   0E0                              * 38569
        %BODY   0E0                              * 38579
        ENDLENGTH                                * 38589
        NIBHEX  00000                            * 38589  ..

* refs (1): 0214E
StartupProc:
        :: StartupProc~1 ERRTRAP VLM ;           * 3858E

* refs (1): 38593
StartupProc~1:
        :: InitSysUI                             * 385A7
L_385B1:
          BEGIN AtUserStack SysMenuCheck SysDisplay GetKeyOb ERRSET DoKeyOb * 385B1
          ERRTRAP SysErrorTrap AGAIN ;           * 385D4

* refs (1): 385AC
InitSysUI:
        :: CLEARLCD InitDispModes OBJ_3FEEE BINT62 ClrSysFlag DoMenuMTH * 385E8
          InitEd&Modes InitPOLVars OBJ_6CC32 OBJ_17F40 DelLastArg * 3860B
          ?FlashAlert ERROR@ #5= IT              * 38624

Warning005:
          :: ERRORCLR BINT5 JstGetTHEMESG DoWarning ; * 38638
          UNDO_ON? IT SAVESTACK                  * 38656
          AtUserStack ;                          * 38665

* ->
* refs (2): 385BB 38B0E
SysMenuCheck:
        :: DA3NoCh? ?SEMI                        * 3866F
          SysMenuCheck~2 IT SysMenuCheck~1       * 3867E
          SysMenuCheck~3 NOT?SEMI                * 3868D
          SetThisRow ;                           * 38697

* ->
* refs (1): 385C0
SysDisplay:
        :: DA2aOK?NOTIT ?DispStack DA1OK?NOTIT ?DispStatus DA2bOK?NOTIT * 386A1
          DispEditLine DA3OK?NOTIT ?DispMenu ClrDAsOK ; * 386BF

* ->
* refs (2): 041CA 38624
?FlashAlert:
        :: AlertStatus ?FlashAlert~1 ?SKIP       * 386D8

and(s,<E>):
          :: BINT14 #AND ;                       * 386EC
          DUP#0=csDROP #132_64E8C JstGetTHEMESG SWAP Alert$ !append$ * 38700
          FlashWarning ;                         * 3871E

* refs (4): 1469F 385D9 3897B DD430
SysErrorTrap:
        :: OBJ_387BE ERROR@ BINT0 #=casedrop OBJ_3881D * 38728
          Err#Cont #=casedrop OBJ_3875F          * 38746
          Err#Kill #=casedrop                    * 38755

* refs (1): 38750
OBJ_3875F:
          :: Halted? caseERRJMP OBJ_3881D        * 3875F
          ;                                      * 38773
          #CAlarmErr #=case SysErrorTrap~1       * 38778
          OBJ_18802 ERROR@ OBJ_3881D ERRBEEP MakeMessage(proc,s) TOADISP * 38787
          REDISPHBUFF DISPROW1 DISPROW2 SetDA1Temp ; * 387A5

* refs (3): 23402 3872D D49EA
OBJ_387BE:
        :: OBJ_18295 OBJ_41837 NOT?SEMI          * 387BE
          LastMenuDef@ LastMenuRow@ 2DUP ERRSET  * 387D2
          :: StartMenu LastMenuRow! LastMenuDef! ; ERRTRAP * 387E6
          :: DropSysObs DoMenuMTH ; ;            * 38804

* refs (8): 2340C 38741 3876E 38791 3895D 38967 ...
OBJ_3881D:
        :: EditLExists? IT                       * 3881D
          :: UnableLastCmd EDITLINE$ SaveLastEdit ; * 3882C
          InitEd&Modes OBJ_38854 ;               * 38845

* refs (2): 17BAE 3884A
OBJ_38854:
        :: AppError? IT                          * 38854
          :: InitPOLVars DoMenuMTH ClrAppError ; * 38863
          OBJ_3FEEE InitDispModes 0LASTOWDOB! SAVEERRN ERRORCLR FLUSHKEYS ; * 3887C

* refs (2): 3879B D4A21
MakeMessage(proc,s):
        :: DUP GETTHEMESG 3UNROLL #EXITERR #= casedrop SEP$NL * 3889F
          REALSTRSTR JstGetTHEMESG SWAPDUP BINT0 EQUAL caseDROP PTR>ROMPTR * 388C7
          PALPTRDCMP NOTcaseDROP APPEND_SPACE    * 388EA
          SWAP !append$ ;                        * 388F9

* $ ->
* refs (7): 3864C 39C84 3DE86 40B42 42C15 4367B ...
DoWarning:
        :: ERRBEEP TOADISP DISPSTATUS2 SetDA1Temp ; * 38908

* $ ->
* refs (2): 04288 3871E
FlashWarning:
        :: ERRBEEP Save16 SWAP DISPSTATUS2 VERYVERYSLOW Restore16 ; * 38926

* refs (1): 38782
SysErrorTrap~1:
        :: SysErrorTrap~2 case OBJ_3881D         * 3894E
          CtlAlarm@ OBJ_3881D ERRSET ExecAlarm(r) ERRTRAP SysErrorTrap ; * 38962

* Disp Keys NonAppKeys? DoStdKeys? menu #row suspendOK? ExitCond AppErr ->
* refs (3): 4CED3 4D934 69C2D
ParOuterLoop:
        :: POLSaveUI ERRSET                      * 38985

* <REF>ParOuterLoop
POLSet&KeyUI:
          :: POLSetUI POLKeyUI ; ERRTRAP POLResUI&Err POLRestoreUI ; * 38994

* Disp Keys NonAppKeys? DoStdKeys? menu #row suspendOK? ExitCond AppErr ->
* refs (18): 199F0 3898A 41F6A 42F49 436A8 659E3 ...
POLSaveUI:
        :: AppMode? ITE                          * 389BC

RclUI:
          :: LastMenuDef@ LastMenuRow@ AppDisplay@ AppKeys@ NAppKeyOK? * 389CB
            DoStdKeys? MenuDef@ MenuRow@ AppSuspOK? AppExitCond@ AppError@ * 389E9
            BINT11 ;                             * 38A07

RclHPUI:
          :: LastMenuDef@ LastMenuRow@ MenuDef@ MenuRow@ BINT4 ; * 38A11
          {}N                                    * 38A34

{'SavedUI}:
          {                                      * 38A39

* refs (1): 38B9A
LAMSavedUI:
            LAM 'SavedUI }                       * 38A3E
          BIND ;                                 * 38A5A

* <REF>ParOuterLoop
* refs (14): 19B21 38999 38AD2 41FBF 43061 4373E ...
POLSetUI:
        :: AppError! AppExitCond! ITE SetAppSuspOK ClrAppSuspOK * 38A64
          OVER FALSE EQITE 2DROP StartMenu ITE SetDoStdKeys ClrDoStdKeys * 38A82
          ITE SetNAppKeyOK ClrNAppKeyOK          * 38AAA
          AppKeys! AppDisplay! SetAppMode ;      * 38AB9

* refs (1): 38BB3
POLRestoreUI~1:
        :: POLSetUI LastMenuRow! LastMenuDef! ClrAppError ; * 38ACD

* ->
* refs (14): 19B49 3899E 41FC4 4306B 43748 8D3A5 ...
POLKeyUI:
        :: BEGIN AppExitCond@ EVAL NOT WHILE     * 38AEB

* ->
1POLKeyUI:
          :: SysMenuCheck AppDisplay@ EVAL GetKeyOb ERRSET DoKeyOb ERRTRAP * 38B09
            POLErrorTrap ;                       * 38B31
          REPEAT ;                               * 38B3B

* refs (1): 38B31
POLErrorTrap:
        :: AppError? IT ERRJMP                   * 38B45
          OBJ_41837 IT ERRJMP                    * 38B59
          AppError@ EVAL ;                       * 38B68

* ->
* refs (18): 19B62 389AD 41FD8 4307F 4375C 659F7 ...
POLResUI&Err:
        :: SetAppError POLRestoreUI ERRJMP ;     * 38B77

* ->
* refs (19): 19B67 389B2 38B81 41FDD 43084 43761 ...
POLRestoreUI:
        :: SetAppError LAMSavedUI ABND INNERCOMP BINT11 #=case * 38B90
          POLRestoreUI~1                         * 38BB3
          StartMenu LastMenuRow! LastMenuDef! InitPOLVars ClrAppError ; * 38BB8

* refs (3): 38610 38868 38BC7
InitPOLVars:
        :: ClrAppMode NoAppDisplay! AppKeys0 ClrNAppKeyOK ClrDoStdKeys * 38BD6
          SetAppSuspOK NoAppExitCnd! NoAppError! ; * 38BF4

* ob ->
* refs (1): 38ABE
AppDisplay!:
        CON(5)  (*)+5                            * 38C08  primitive code object
        ASSEMBLE
        LC(5)   AppDisplay                       * 38C0D
        GOTO    L_38CA4                          * 38C14

* ->
* refs (2): 389DA 38B13
AppDisplay@:
        CON(5)  (*)+5                            * 38C18  primitive code object
        LC(5)   AppDisplay                       * 38C1D
        GOTO    L_38CB7                          * 38C24

* refs (1): 38BE0
NoAppDisplay!:
        CON(5)  (*)+5                            * 38C28  primitive code object
        LC(5)   AppDisplay                       * 38C2D
        GOTO    L_38CCA                          * 38C34

* ob ->
* refs (1): 38AB9
AppKeys!:
        CON(5)  (*)+5                            * 38C38  primitive code object
        LC(5)   AppKeys                          * 38C3D
        GOTO    L_38CA4                          * 38C44

* refs (2): 389DF 3FA16
AppKeys@:
        CON(5)  (*)+5                            * 38C48  primitive code object
        LC(5)   AppKeys                          * 38C4D
        GOTO    L_38CB7                          * 38C54

* ???
* refs (1): 38BE5
AppKeys0:
        CON(5)  (*)+5                            * 38C58  primitive code object
        LC(5)   AppKeys                          * 38C5D
        GOTO    L_38CCA                          * 38C64

* ob ->
* refs (1): 38A6E
AppExitCond!:
        CON(5)  (*)+5                            * 38C68  primitive code object
        LC(5)   AppExitCond                      * 38C6D
        GOTO    L_38CA4                          * 38C74

* -> ob
* refs (2): 389FD 38AF5
AppExitCond@:
        CON(5)  (*)+5                            * 38C78  primitive code object
        LC(5)   AppExitCond                      * 38C7D
        GOTO    L_38CB7                          * 38C84

* refs (1): 38BF9
NoAppExitCnd!:
        CON(5)  (*)+5                            * 38C88  primitive code object
        LC(5)   AppExitCond                      * 38C8D
        GOTO    L_38CCA                          * 38C94

* ob ->
* refs (1): 38A69
AppError!:
        CON(5)  (*)+5                            * 38C98  primitive code object
        LC(5)   AppError                         * 38C9D
L_38CA4:
        GOVLNG  L_08D14                          * 38CA4

* -> ob
* refs (2): 38A02 38B68
AppError@:
        CON(5)  (*)+5                            * 38CAB  primitive code object
        LC(5)   AppError                         * 38CB0
L_38CB7:
        GOVLNG  SysPtr@                          * 38CB7

* ->
* refs (1): 38BFE
NoAppError!:
        CON(5)  (*)+5                            * 38CBE  primitive code object
        LC(5)   AppError                         * 38CC3
L_38CCA:
        GOVLNG  L_08D2F                          * 38CCA

* -> flag
* refs (2): 38859 38B4A
AppError?:
        CON(5)  (*)+5                            * 38CD1  primitive code object
        LC(3)   #406                             * 38CD6
        GOTO    L_38D83                          * 38CDB

* ->
* refs (2): 38B7C 38B95
SetAppError:
        CON(5)  (*)+5                            * 38CDF  primitive code object
        LC(3)   #406                             * 38CE4
        GOTO    L_38D94                          * 38CE9

* ->
* refs (3): 38872 38AE1 38BCC
ClrAppError:
        CON(5)  (*)+5                            * 38CED  primitive code object
        LC(3)   #406                             * 38CF2
        GOTO    L_38DA5                          * 38CF7

* -> flag
* refs (5): 389C1 3FA02 479DE 4A29E 6C5DC
AppMode?:
        CON(5)  (*)+5                            * 38CFB  primitive code object
        LC(3)   #80A                             * 38D00
        GOTO    L_38D83                          * 38D05

* ->
* refs (3): 38AC3 6C3CA 6C8F5
SetAppMode:
        CON(5)  (*)+5                            * 38D09  primitive code object
        LC(3)   #80A                             * 38D0E
        GOTO    L_38D94                          * 38D13

* ->
* refs (2): 38BDB 6C5E1
ClrAppMode:
        CON(5)  (*)+5                            * 38D17  primitive code object
        LC(3)   #80A                             * 38D1C
        GOTO    L_38DA5                          * 38D21

* -> flag
* refs (2): 389E4 3FA2A
NAppKeyOK?:
        CON(5)  (*)+5                            * 38D25  primitive code object
        LC(3)   #20A                             * 38D2A
        GOTO    L_38D83                          * 38D2F

* ->
* refs (1): 38AAF
SetNAppKeyOK:
        CON(5)  (*)+5                            * 38D33  primitive code object
        LC(3)   #20A                             * 38D38
        GOTO    L_38D94                          * 38D3D

* ->
* refs (2): 38AB4 38BEA
ClrNAppKeyOK:
        CON(5)  (*)+5                            * 38D41  primitive code object
        LC(3)   #20A                             * 38D46
        GOTO    L_38DA5                          * 38D4B

* -> flag
* refs (2): 389E9 3FA3E
DoStdKeys?:
        CON(5)  (*)+5                            * 38D4F  primitive code object
        LC(3)   #80B                             * 38D54
        GOTO    L_38D83                          * 38D59

* ->
* refs (1): 38AA0
SetDoStdKeys:
        CON(5)  (*)+5                            * 38D5D  primitive code object
        LC(3)   #80B                             * 38D62
        GOTO    L_38D94                          * 38D67

* ->
* refs (2): 38AA5 38BEF
ClrDoStdKeys:
        CON(5)  (*)+5                            * 38D6B  primitive code object
        LC(3)   #80B                             * 38D70
        GOTO    L_38DA5                          * 38D75

* ->
* refs (2): 14474 389F8
AppSuspOK?:
        CON(5)  (*)+5                            * 38D79  primitive code object
        LC(3)   #206                             * 38D7E
L_38D83:
        GOVLNG  L_539E6                          * 38D83

* ->
* refs (2): 38A78 38BF4
SetAppSuspOK:
        CON(5)  (*)+5                            * 38D8A  primitive code object
        LC(3)   #206                             * 38D8F
L_38D94:
        GOVLNG  SetISysFlag                      * 38D94

* ->
* refs (1): 38A7D
ClrAppSuspOK:
        CON(5)  (*)+5                            * 38D9B  primitive code object
        LC(3)   #206                             * 38DA0
L_38DA5:
        GOVLNG  L_539F1                          * 38DA5
        RPL

* -> flag
* refs (6): 19B80 38F0A 38F2D 8D543 BA717 DD4E0
DA1OK?:
        :: DA1Bad? caseFALSE DA1ValidF?          * 38DAC
          caseTRUE DA1TempF                      * 38DC0
          case SetDA1BadT                        * 38DCA
          DA1NoCh? caseTRUE FALSE                * 38DD4
        ;                                        * 38DE3

* -> T
* refs (1): 38DCF
SetDA1BadT:
        :: SetDA1Bad TRUE ;                      * 38DE8

* -> flag
* refs (6): 19C56 38EA1 38F46 8D54D BA737 DD47B
DA2aOK?:
        :: DA2aBad? caseFALSE DA2aValidF?        * 38DFC
          caseTRUE DA2aTempF?                    * 38E10
          case SetDA2aBadT                       * 38E1A
          DA2aNoCh? caseTRUE FALSE               * 38E24
        ;                                        * 38E33

* -> T
* refs (1): 38E1F
SetDA2aBadT:
        :: SetDA2aBad TRUE ;                     * 38E38

* -> flag
* refs (8): 19BA4 19BC7 38EA6 38F5F 8D616 BA765 ...
DA2bOK?:
        :: DA2bBad? caseFALSE DA2bValidF?        * 38E4C
          caseTRUE DA2bTemp?                     * 38E60
          case SetDA2bBadT                       * 38E6A
          DA2bNoCh? caseTRUE FALSE               * 38E74
        ;                                        * 38E83

* -> T
* refs (1): 38E6F
SetDA2bBadT:
        :: SetDA2bBad TRUE ;                     * 38E88

* -> flag
* refs (2): 38F0F 43775
DA2OK?:
        :: DA2aOK? DA2bOK? AND ;                 * 38E9C

* -> flag
* refs (11): 19C0F 38F19 38F78 69BBF 8D70B 9CDBC ...
DA3OK?:
        :: DA3Bad? caseFALSE DA3ValidF?          * 38EB5
          caseTRUE DA3TempF?                     * 38EC9
          case SetDA3BadT                        * 38ED3
          DA3NoCh? caseTRUE FALSE                * 38EDD
        ;                                        * 38EEC

* -> T
* refs (1): 38ED8
SetDA3BadT:
        :: SetDA3Bad TRUE ;                      * 38EF1

* -> flag
DAsOK?:
        :: DA1OK? DA2OK? AND DA3OK? AND ;        * 38F05

* ->
* refs (3): 386B0 4309D 43784
DA1OK?NOTIT:
        :: DA1OK? COLA ?SKIP                     * 38F28
        ;                                        * 38F3C

* ->
* refs (2): 386A6 430A7
DA2aOK?NOTIT:
        :: DA2aOK? COLA ?SKIP                    * 38F41
        ;                                        * 38F55

* ->
* refs (3): 386BA 430B1 DD4A3
DA2bOK?NOTIT:
        :: DA2bOK? COLA ?SKIP                    * 38F5A
        ;                                        * 38F6E

* ->
* refs (3): 386C4 430BB 4378E
DA3OK?NOTIT:
        :: DA3OK? COLA ?SKIP                     * 38F73
        ;                                        * 38F87

* ->
* refs (2): 385F2 38881
InitDispModes:
        :: ClrDAsOK SetDA1Bad SetDA2aBad SetDA2bBad SetDA3Bad ClrNewEditL * 38F8C
          ClrNoRollDA2 ;                         * 38FAF

* -> flag
* refs (4): 19C5B 39B94 39BB7 8D552
DA2aLess1OK?:
        :: DA2aLess1OK?~1 DA2aBad? NOTAND ;      * 38FB9

* ->
* refs (12): 1558B 2386F 39176 395D3 4799D 479C5 ...
SetDA1Valid:
        :: SetDA1ValidF ClrDA1Bad ClrDA1IsStat ; * 38FD2

* ->
* refs (9): 39162 39BE9 39BF8 430ED 4311A 8D5FD ...
SetDA2aValid:
        :: SetDA2aValidF ClrDA2aBad ;            * 38FEB

* ->
* refs (7): 19CE6 39167 3A017 8D701 BA819 D85FD ...
SetDA2bValid:
        :: SetDA2bValidF ClrDA2bBad ClrDA2bEdit ; * 38FFF

* ->
* refs (5): 39180 3A1F2 9CDD0 9D3BD CF695
SetDA3Valid:
        :: SetDA3ValidF ClrDA3Bad ;              * 39018

* ->
* refs (11): 1433C 14DA0 15685 387B4 3891C 39220 ...
SetDA1Temp:
        :: SetDA1TempF ClrDA1Bad ClrDA1IsStat ;  * 3902C

* ->
* refs (1): 3920C
SetDA2aTemp:
        :: SetDA2aTempF ClrDA2aBad ;             * 39045

* ->
* refs (3): 39211 40BA6 D6A01
SetDA2bTemp:
        :: SetDA2bTempF ClrDA2bBad ClrDA2bEdit ; * 39059

* ->
* refs (2): 1436E 3923E
SetDA3Temp:
        :: SetDA3TempF ClrDA3Bad ;               * 39072

* :: EditExst?NOT ITE SetDA2RollF SetDA2aNoCh ;
* refs (5): 3B609 40DDE 40E01 42AEE 42CE7
?SetEditRoll:
        :: NoEditLine? ITE ?SetEditRoll~1 SetDA2aNoCh * 39086
        ;                                        * 3909F

MENoP&FixDA1:
        :: SetDA1Bad ;                           * 390A4

MENP&FixDA12:
        :: SetDA1Bad SetDA2aBad SetDA2bBad ;     * 390B3

* ->
* refs (1): 39149
ClrDA1OK:
        :: ClrDA1ValidF ClrDA1TempF ClrDA1NoCh ; * 390CC

* ->
* refs (1): 3911C
ClrDA2aOK:
        :: ClrDA2aValidF ClrDA2aTempF ClrDA2NoCh ; * 390E5

* ->
* refs (3): 39121 BB327 BB3D1
ClrDA2bOK:
        :: ClrDA2bValidF ClrDA2bTemp ClrDA2bNoCh ; * 390FE

* ->
* refs (1): 3914E
ClrDA2OK:
        :: ClrDA2aOK ClrDA2bOK ;                 * 39117

* ->
* refs (4): 39153 69C28 DCCAA DCD06
ClrDA3OK:
        :: ClrDA3ValidF ClrDA3TempF ClrDA3NoCh ; * 3912B

* ->
* refs (44): 17C2B 19B71 19C9F 2DDFB 2E072 2E095 ...
ClrDAsOK:
        :: ClrDA1OK ClrDA2OK ClrDA3OK ;          * 39144

* ->
* refs (2): 3917B 43838
SetDA2Valid:
        :: SetDA2aValid SetDA2bValid ;           * 3915D

* ->
SetDAsValid:
        :: SetDA1Valid SetDA2Valid SetDA3Valid ; * 39171

* ->
* refs (7): 391A8 391B7 391F8 3C376 43EBD DD795 ...
SetDA2NoCh:
        :: SetDA2aNoCh SetDA2bNoCh ;             * 3918A

* ->
* refs (14): 3AB80 3E5BE 40193 40DCA 4103A 4A2DA ...
SetDA12NoCh:
        :: SetDA1NoCh SetDA2NoCh ;               * 3919E

* ->
* refs (5): 3D947 3DFD8 43680 43E86 43EC7
SetDA23NoCh:
        :: SetDA2NoCh SetDA3NoCh ;               * 391B2

* ->
* refs (21): 391DF 3B604 3B6A4 3B6F9 3DE5E 3E124 ...
SetDA13NoCh:
        :: SetDA1NoCh SetDA3NoCh ;               * 391C6

* ->
* refs (5): 3B5C8 3B5F0 BAF02 BB86F BB8B2
SetDA12a3NCh:
        :: SetDA13NoCh SetDA2aNoCh ;             * 391DA

* ->
* refs (85): 3A9DD 3AA14 3AC2A 3AFA2 3AFF5 3B02A ...
SetDA123NoCh:
        :: SetDA1NoCh SetDA2NoCh SetDA3NoCh ;    * 391EE

* ->
* refs (10): 14355 39225 39239 45FFD 46116 4A50E ...
SetDA2OKTemp:
        :: SetDA2aTemp SetDA2bTemp ;             * 39207

* ->
* refs (5): 1547D 2219F 3FBBA 41413 9E47B
SetDA12Temp:
        :: SetDA1Temp SetDA2OKTemp ;             * 3921B

* ->
* refs (5): 492F7 C714E C7176 CE3C0 CE41A
SetDAsTemp:
        :: SetDA1Temp SetDA2OKTemp SetDA3Temp ;  * 3922F

* -> flag
* refs (8): 19B35 3B7D1 4320A 43CF2 8D2A9 8D2EF ...
DAsBad?:
        :: DA1Bad? caseTRUE DA2aBad?             * 39248
          caseTRUE DA2bBad?                      * 3925C
          caseTRUE DA3Bad?                       * 39266
        ;                                        * 39270

* -> flag
* refs (1): 38DBB
DA1ValidF?:
        CON(5)  (*)+5                            * 39275  primitive code object
        ASSEMBLE
        LC(3)   #107                             * 3927A
        GOTO    L_39573                          * 3927F

* ->
* refs (1): 38FD7
SetDA1ValidF:
        CON(5)  (*)+5                            * 39283  primitive code object
        LC(3)   #107                             * 39288
        GOTO    L_39584                          * 3928D

* ->
* refs (1): 390D1
ClrDA1ValidF:
        CON(5)  (*)+5                            * 39291  primitive code object
        LC(3)   #107                             * 39296
        GOTO    L_39595                          * 3929B

* -> flag
* refs (1): 38E0B
DA2aValidF?:
        CON(5)  (*)+5                            * 3929F  primitive code object
        LC(3)   #207                             * 392A4
        GOTO    L_39573                          * 392A9

* ->
* refs (1): 38FF0
SetDA2aValidF:
        CON(5)  (*)+5                            * 392AD  primitive code object
        LC(3)   #207                             * 392B2
        GOTO    L_39584                          * 392B7

* ->
* refs (1): 390EA
ClrDA2aValidF:
        CON(5)  (*)+5                            * 392BB  primitive code object
        LC(3)   #207                             * 392C0
        GOTO    L_39595                          * 392C5

* -> flag
* refs (1): 38E5B
DA2bValidF?:
        CON(5)  (*)+5                            * 392C9  primitive code object
        LC(3)   #407                             * 392CE
        GOTO    L_39573                          * 392D3

* ->
* refs (1): 39004
SetDA2bValidF:
        CON(5)  (*)+5                            * 392D7  primitive code object
        LC(3)   #407                             * 392DC
        GOTO    L_39584                          * 392E1

* ->
* refs (1): 39103
ClrDA2bValidF:
        CON(5)  (*)+5                            * 392E5  primitive code object
        LC(3)   #407                             * 392EA
        GOTO    L_39595                          * 392EF

* -> flag
* refs (1): 38EC4
DA3ValidF?:
        CON(5)  (*)+5                            * 392F3  primitive code object
        LC(3)   #807                             * 392F8
        GOTO    L_39573                          * 392FD

* ->
* refs (1): 3901D
SetDA3ValidF:
        CON(5)  (*)+5                            * 39301  primitive code object
        LC(3)   #807                             * 39306
        GOTO    L_39584                          * 3930B

* ->
* refs (1): 39130
ClrDA3ValidF:
        CON(5)  (*)+5                            * 3930F  primitive code object
        LC(3)   #807                             * 39314
        GOTO    L_39595                          * 39319

* ->
* refs (1): 38DC5
DA1TempF:
        CON(5)  (*)+5                            * 3931D  primitive code object
        LC(3)   #806                             * 39322
        GOTO    L_39573                          * 39327

* ->
* refs (1): 39031
SetDA1TempF:
        CON(5)  (*)+5                            * 3932B  primitive code object
        LC(3)   #806                             * 39330
        GOTO    L_39584                          * 39335

* ->
* refs (1): 390D6
ClrDA1TempF:
        CON(5)  (*)+5                            * 39339  primitive code object
        LC(3)   #806                             * 3933E
        GOTO    L_39595                          * 39343

* -> flag
* refs (2): 38E15 DD49E
DA2aTempF?:
        CON(5)  (*)+5                            * 39347  primitive code object
        LC(3)   #104                             * 3934C
        GOTO    L_39573                          * 39351

* ->
* refs (2): 3904A DD48A
SetDA2aTempF:
        CON(5)  (*)+5                            * 39355  primitive code object
        LC(3)   #104                             * 3935A
        GOTO    L_39584                          * 3935F

* ->
* refs (2): 390EF DD48F
ClrDA2aTempF:
        CON(5)  (*)+5                            * 39363  primitive code object
        LC(3)   #104                             * 39368
        GOTO    L_39595                          * 3936D

* refs (2): 19C3D 38E65
DA2bTemp?:
        CON(5)  (*)+5                            * 39371  primitive code object
        LC(3)   #204                             * 39376
        GOTO    L_39573                          * 3937B

* ->
* refs (1): 3905E
SetDA2bTempF:
        CON(5)  (*)+5                            * 3937F  primitive code object
        LC(3)   #204                             * 39384
        GOTO    L_39584                          * 39389

* ->
* refs (1): 39108
ClrDA2bTemp:
        CON(5)  (*)+5                            * 3938D  primitive code object
        LC(3)   #204                             * 39392
        GOTO    L_39595                          * 39397

* -> flag
* refs (1): 38ECE
DA3TempF?:
        CON(5)  (*)+5                            * 3939B  primitive code object
        LC(3)   #404                             * 393A0
        GOTO    L_39573                          * 393A5

* ->
* refs (1): 39077
SetDA3TempF:
        CON(5)  (*)+5                            * 393A9  primitive code object
        LC(3)   #404                             * 393AE
        GOTO    L_39584                          * 393B3

* ->
* refs (1): 39135
ClrDA3TempF:
        CON(5)  (*)+5                            * 393B7  primitive code object
        LC(3)   #404                             * 393BC
        GOTO    L_39595                          * 393C1

* -> flag
* refs (1): 38DD4
DA1NoCh?:
        CON(5)  (*)+5                            * 393C5  primitive code object
        LC(3)   #108                             * 393CA
        GOTO    L_39573                          * 393CF

* ->
* refs (40): 391A3 391CB 391F3 3D9F9 404C7 404EF ...
SetDA1NoCh:
        CON(5)  (*)+5                            * 393D3  primitive code object
        LC(3)   #108                             * 393D8
        GOTO    L_39584                          * 393DD

* ->
* refs (1): 390DB
ClrDA1NoCh:
        CON(5)  (*)+5                            * 393E1  primitive code object
        LC(3)   #108                             * 393E6
        GOTO    L_39595                          * 393EB

* -> flag
* refs (1): 38E24
DA2aNoCh?:
        CON(5)  (*)+5                            * 393EF  primitive code object
        LC(3)   #208                             * 393F4
        GOTO    L_39573                          * 393F9

* ->
* refs (25): 3909A 3918F 391E4 3E6ED 3E6F7 40B47 ...
SetDA2aNoCh:
        CON(5)  (*)+5                            * 393FD  primitive code object
        LC(3)   #208                             * 39402
        GOTO    L_39584                          * 39407

* ->
* refs (1): 390F4
ClrDA2NoCh:
        CON(5)  (*)+5                            * 3940B  primitive code object
        LC(3)   #208                             * 39410
        GOTO    L_39595                          * 39415

* -> flag
* refs (1): 38E74
DA2bNoCh?:
        CON(5)  (*)+5                            * 39419  primitive code object
        LC(3)   #408                             * 3941E
        GOTO    L_39573                          * 39423

* ->
* refs (12): 39194 3DE63 3ED98 4005D 42B57 B1C9D ...
SetDA2bNoCh:
        CON(5)  (*)+5                            * 39427  primitive code object
        LC(3)   #408                             * 3942C
        GOTO    L_39584                          * 39431

* ->
* refs (1): 3910D
ClrDA2bNoCh:
        CON(5)  (*)+5                            * 39435  primitive code object
        LC(3)   #408                             * 3943A
        GOTO    L_39595                          * 3943F

* -> flag
* refs (2): 38674 38EDD
DA3NoCh?:
        CON(5)  (*)+5                            * 39443  primitive code object
        LC(3)   #808                             * 39448
        GOTO    L_39573                          * 3944D

* ->
* refs (40): 15590 222E4 391BC 391D0 391FD 3EED3 ...
SetDA3NoCh:
        CON(5)  (*)+5                            * 39451  primitive code object
        LC(3)   #808                             * 39456
        GOTO    L_39584                          * 3945B

* ->
* refs (1): 3913A
ClrDA3NoCh:
        CON(5)  (*)+5                            * 3945F  primitive code object
        LC(3)   #808                             * 39464
        GOTO    L_39595                          * 39469

* -> flag
* refs (3): 38DB1 3924D BC7D8
DA1Bad?:
        CON(5)  (*)+5                            * 3946D  primitive code object
        LC(3)   #109                             * 39472
        GOTO    L_39573                          * 39477

* ->
* refs (13): 1A043 38DED 38F96 390A9 390B8 395B0 ...
SetDA1Bad:
        CON(5)  (*)+5                            * 3947B  primitive code object
        LC(3)   #109                             * 39480
        GOTO    L_39584                          * 39485

* ->
* refs (3): 38FDC 39036 BC83C
ClrDA1Bad:
        CON(5)  (*)+5                            * 39489  primitive code object
        LC(3)   #109                             * 3948E
        GOTO    L_39595                          * 39493

* -> flag
* refs (8): 38E01 38FC3 39257 BB7CA BC7DD D55A1 ...
DA2aBad?:
        CON(5)  (*)+5                            * 39497  primitive code object
        LC(3)   #209                             * 3949C
        GOTO    L_39573                          * 394A1

* ->
* refs (10): 1A048 38E3D 38F9B 390BD 39BA3 437B6 ...
SetDA2aBad:
        CON(5)  (*)+5                            * 394A5  primitive code object
        LC(3)   #209                             * 394AA
        GOTO    L_39584                          * 394AF

* ->
* refs (3): 38FF5 3904F BC82D
ClrDA2aBad:
        CON(5)  (*)+5                            * 394B3  primitive code object
        LC(3)   #209                             * 394B8
        GOTO    L_39595                          * 394BD

* -> flag
* refs (6): 38E51 39261 BB070 BB122 BC5B4 BC7E2
DA2bBad?:
        CON(5)  (*)+5                            * 394C1  primitive code object
        LC(3)   #409                             * 394C6
        GOTO    L_39573                          * 394CB

* ->
* refs (12): 19CC7 1A04D 38E8D 38FA0 390C2 437BB ...
SetDA2bBad:
        CON(5)  (*)+5                            * 394CF  primitive code object
        LC(3)   #409                             * 394D4
        GOTO    L_39584                          * 394D9

* ->
* refs (3): 39009 39063 BC81E
ClrDA2bBad:
        CON(5)  (*)+5                            * 394DD  primitive code object
        LC(3)   #409                             * 394E2
        GOTO    L_39595                          * 394E7

* -> flag
* refs (3): 38EBA 3926B BC7E7
DA3Bad?:
        CON(5)  (*)+5                            * 394EB  primitive code object
        LC(3)   #809                             * 394F0
        GOTO    L_39573                          * 394F5

* ->
* refs (14): 19C05 1A052 38EF6 38FA5 3A1DE 3D56A ...
SetDA3Bad:
        CON(5)  (*)+5                            * 394F9  primitive code object
        LC(3)   #809                             * 394FE
        GOTO    L_39584                          * 39503

* ->
* refs (3): 39022 3907C BC80F
ClrDA3Bad:
        CON(5)  (*)+5                            * 39507  primitive code object
        LC(3)   #809                             * 3950C
        GOTO    L_39595                          * 39511

* -> flag
* refs (3): 04903 39ADD BC7CE
DA1IsStat?:
        CON(5)  (*)+5                            * 39515  primitive code object
        LC(3)   #10C                             * 3951A
        GOTO    L_39573                          * 3951F

* ->
* refs (2): 395D8 BC855
SetDA1IsStat:
        CON(5)  (*)+5                            * 39523  primitive code object
        LC(3)   #10C                             * 39528
        GOTO    L_39584                          * 3952D

* ->
* refs (15): 17B9F 2DA45 38FE1 3903B 4CECE 4D92A ...
ClrDA1IsStat:
        CON(5)  (*)+5                            * 39531  primitive code object
        LC(3)   #10C                             * 39536
        GOTO    L_39595                          * 3953B

* -> flag
* refs (2): 42082 BC7D3
DA2bEdit?:
        CON(5)  (*)+5                            * 3953F  primitive code object
        LC(3)   #401                             * 39544
        GOTO    L_39573                          * 39549

* ->
* refs (7): 3A01C 40BAB BC846 D6A06 D8631 D8646 ...
SetDA2bEdit:
        CON(5)  (*)+5                            * 3954D  primitive code object
        LC(3)   #401                             * 39552
        GOTO    L_39584                          * 39557

* ->
* refs (5): 3900E 39068 BC84B D69D8 DCC9A
ClrDA2bEdit:
        CON(5)  (*)+5                            * 3955B  primitive code object
        LC(3)   #401                             * 39560
        GOTO    L_39595                          * 39565

* -> flag
* refs (1): 39BFD
NoRollDA2?:
        CON(5)  (*)+5                            * 39569  primitive code object
        LC(3)   #101                             * 3956E
L_39573:
        GOVLNG  L_539E6                          * 39573

* ->
* refs (1): 39DB5
SetNoRollDA2:
        CON(5)  (*)+5                            * 3957A  primitive code object
        LC(3)   #101                             * 3957F
L_39584:
        GOVLNG  SetISysFlag                      * 39584

* ->
* refs (3): 38FAF 39BCB 39C07
ClrNoRollDA2:
        CON(5)  (*)+5                            * 3958B  primitive code object
        LC(3)   #101                             * 39590
L_39595:
        GOVLNG  L_539F1                          * 39595
        RPL

* ->
* refs (3): 386B5 430A2 43789
?DispStatus:
        :: KEYINBUFFER? NOTcase DispStatus       * 3959C
          SetDA1Bad ;                            * 395B0

* ->
* refs (3): 395AB 8D589 DD53D
DispStatus:
        :: TOADISP DispStsBound DispDir?Time DispAllStatus! SetDA1Valid * 395BA
          SetDA1IsStat ;                         * 395D8

* refs (1): 395CE
DispAllStatus!:
        :: AngleStatus Blank&GROB! ComVecStatus Blank&GROB! HaltDispStatus * 395E2
          Blank&GROB! UserFlagStat Blank&GROB! UserKeysStat Blank&GROB! * 39600
          AlgEntryStat Blank&GROB! PrgmEntrStat Blank&GROB! ; * 39619

* $ #x #x1 #x2 ->
* refs (7): 395EC 395F6 39600 3960A 39614 3961E ...
Blank&GROB!:
        :: 4ROLL $>grob 4UNROLL HARDBUFF 3UNROLL ZEROSWAP BINT6 GROB!ZERO * 39632
          SWAP BINT0 GROB! ;                     * 3965F

* refs (1): 395E7
AngleStatus:
        :: BINT17 SysITE                         * 39673
          :: $_RAD BINT4 ;                       * 39682
          :: BINT18 SysITE $_GRAD NULL$ BINT2 ; BINT0 BINT20 ; * 39696

* refs (1): 395F1
ComVecStatus:
        :: BINT16 SysITE                         * 396C8
          :: BINT15 SysITE $_R<< $_R<Z ; NULL$ BINT22 BINT20 BINT37 ; * 396D7

* refs (1): 395FB
HaltDispStatus:
        :: Halted? ITE                           * 3970E

_HALT_:
          $ "HALT" NULL$                         * 3971D
          BINT39 BINT37 BINT56 ;                 * 39734

* refs (1): 39605
UserFlagStat:
        :: # 3039 #>$                            * 39748
          CODE                                   * 3975C  65 nibbles
            GOSBVL  SAVPTR                       * 39766
            A=DAT1  A                            * 3976D
            D1=A                                 * 39770
            D1=D1+  10                           * 39773
            C=DAT1  10                           * 39776
            D0=(5)  UserFlags                    * 3977A
            A=DAT0  B                            * 39781
            A=-A-1  A                            * 39784
L_39786:
            SB=0                                 * 39786
            ASRB                                 * 39789
            ?SB=0                                * 3978C
            GOYES   L_39795                      * 3978F
            LC(2)   #20                          * 39791
L_39795:
            P=P+1                                * 39795
            P=P+1                                * 39797
            GONC    L_39786                      * 39799
            DAT1=C  10                           * 3979C
            GOVLNG  GETPTRLOOP                   * 397A0
          ENDCODE                                * 397A7
          BINT58 BINT56 BINT79 ;                 * 397A7

* refs (1): 3960F
UserKeysStat:
        :: UserKeys? ITE                         * 397BB
          :: 1USR? ITE                           * 397CA

_1USR_:
            $ "1USR"                             * 397D9

_USER_:
            $ "USER"                             * 397EB
          ;                                      * 397FD
          NULL$                                  * 39802
          BINT81 BINT79 BINT98 ;                 * 39807

* refs (1): 39619
AlgEntryStat:
        :: AlgEntry? ITE                         * 3981B

_ALG_:
          $ "ALG" NULL$                          * 3982A
          BINT100 BINT98 BINT114 ;               * 3983F

* refs (1): 39623
PrgmEntrStat:
        :: PrgmEntry? ITE                        * 39853

_PRG_:
          $ "PRG" NULL$                          * 39862
          BINT116 BINT114 BINT131 ;              * 39877

* refs (1): 395C9
DispDir?Time:
        :: DispTimeReq? DUP PathStatus 4ROLL ITE DispDir?Tim1 DispDir?Tim2 * 3988B
          SWAP HARDBUFF BINT0 BINT7 GROB! HARDBUFF BINT4 ROT IT #2+ * 398B3
          BINT7 GROB! ;                          * 398E5

* refs (1): 398A9
DispDir?Tim1:
        :: HARDBUFF BINT63 BINT6 BINT131 BINT7 GROB!ZERO BINT63 BINT13 * 398F4
          BINT131 BINT14 GROB!ZERODRP OBJ_39A83 HARDBUFF BINT0 BINT6 BINT63 * 39921
          BINT14 GROB!ZERODRP ;                  * 39949

* refs (1): 398AE
DispDir?Tim2:
        :: BINT6 BINT8 BLANKIT ;                 * 39958

* refs (1): 3989A
PathStatus:
        :: ITE BINT53 # 7D                       * 39971
          $ " }" CONTEXT@ BEGIN DUP RAM-WORDNAME DUP NULLID EQUALNOT DUP ITE * 3998A
          ~SWAP;ID>$ PathStatus~1                * 399C5
          4ROLL !append$ SPACE$ !insert$ 3UNROLL 3PICK LEN$ BINT63 #< AND * 399CF
          WHILE                                  * 39A01
          :: MYRAMROMPAIR DROP ; REPEAT DROPSWAP RIGHT$3x6 OVER ITE * 39A06
          _chr(31)_ tok{                         * 39A33
          $>grob ROT ;                           * 39A3D

* refs (1): 399C5
~SWAP;ID>$:
        :: SWAP ID>$ ;                           * 39A4C

* refs (1): 399CA
PathStatus~1:
        :: SWAPDROP ' xHOME PTR>ROMPTR ->str(xn) ; * 39A60

* refs (2): 39930 39AE7
OBJ_39A83:
        :: DATE Date>d$ APPEND_SPACE BINT42 TestSysFlag IT APPEND_SPACE * 39A83
          TOD TOD>t$ !append$ $>grob HARDBUFF BINT63 BINT7 GROB! ; * 39AAB

* refs (2): 048C7 048EA
OBJ_39AD8:
        :: DA1IsStat? NOT?SEMI                   * 39AD8
          OBJ_39A83 ;                            * 39AE7

* -> flag
* refs (2): 048FE 39890
DispTimeReq?:
        :: Clock? clock? OR ;                    * 39AF1

* ->
* refs (3): 395C4 47993 DD547
DispStsBound:
        :: LineGrob HARDBUFF BINT0 BINT14 GROB! ; * 39B0A

* 131x2 line
* refs (1): 39B0F
LineGrob:
        GROBW   "images/39B2D-LineGrob.png" 131  * 39B2D  131 x 2; the padding (gray) is not zero

* ->
* refs (2): 386AB DD499
?DispStack:
        :: KEYINBUFFER? NOT DA2aLess1OK? ORcase OBJ_39BAD * 39B85
          SetDA2aBad ;                           * 39BA3

* refs (2): 39B9E 39C75
OBJ_39BAD:
        :: TOADISP DA2aLess1OK? ClrNewEditL case ?RollUpDA2 * 39BAD
          ClrNoRollDA2 ClrAbbrevStk ERRSET OBJ_39C1B ERRTRAP OBJ_39C61 * 39BCB
          SetDA2aValid ;                         * 39BE9

* refs (1): 39BC6
?RollUpDA2:
        :: SetDA2aValid NoRollDA2? case ClrNoRollDA2 * 39BF3
          BINT3 ScreenUpN ;                      * 39C0C

* refs (2): 39BDA 39C8E
OBJ_39C1B:
        :: LINESOFSTACK DUP#0=csDROP ONESWAP ZERO_DO ISTOP-INDEX OVERDUP #3+ * 39C1B
          pick(s)? OBJ_39C9D SWAP#1+SWAP +LOOP DROP ; * 39C43

* refs (1): 39BE4
OBJ_39C61:
        :: DropSysObs ERROR@ #0=case OBJ_39BAD   * 39C61
          #NoRoomForSt JstGetTHEMESG DoWarning SetAbbrevStk OBJ_39C1B * 39C7A
          ClrAbbrevStk ;                         * 39C93

* refs (1): 39C48
OBJ_39C9D:
        :: DUP NOTcase OBJ_39F42                 * 39C9D
          3PICK #1<> case OBJ_39F42              * 39CB1
          MLmode? NOTcase OBJ_39F42              * 39CC5
          OVER OBJ_39E0F NOTcase OBJ_39F42       * 39CD4
          AbbrevStack? case OBJ_39F42            * 39CE8
          DROPSWAPDROP OBJ_39D06 ;               * 39CF7

* refs (1): 39CFC
OBJ_39D06:
        :: OVERSWAP NULL{} SWAP3PICK ZERO_DO DUPUNROT OBJ_39E78 INDEX@ * 39D06
          #0=ITE OBJ_39EB9 OBJ_39F23 5UNROLL DUPNULLCOMP? IT OBJ_39EE1 * 39D2E
          SWAPLOOP 2DROP DUPDUP #3+ UNROLL ZERO_DO ISTOP-INDEX #1+ROLL OVER * 39D51
          ISTOP@ #- INDEX@ #+ #1+ BigDisp(st,s) LOOP DROPDUP BINT4 #= IT * 39D7E
          SetNoRollDA2                           * 39DB5
        ;                                        * 39DBA

* refs (4): 39F47 43810 43AA4 43B71
OBJ_39DBF:
        :: ITE OBJ_39DE2 #:>$                    * 39DBF
          SWAP BigDisp(st,s) ;                   * 39DD3

* refs (1): 39DC9
OBJ_39DE2:
        :: AbbrevStack? NOTcase DoSt:22(s,_)     * 39DE2
          SWAP #:>$ SWAP OBJ_15CCF ;             * 39DF6

* refs (1): 39CD9
OBJ_39E0F:
        :: CK&DISPATCH0                          * 39E0F
          BINT4 DROPTRUE                         * 39E19  array
          BINT5 DROPTRUE                         * 39E23  list
          BINT8 DROPTRUE                         * 39E2D  program
          BINT9 DROPTRUE                         * 39E37  algebraic
          BINT14 DROPTRUE                        * 39E41  unit
          BINT13 DROPTRUE                        * 39E4B  tagged
          BINT47 DROPTRUE                        * 39E55  directory
          BINT2 DROPTRUE                         * 39E5F  complex
          BINT0 DROPFALSE                        * 39E69  any
        ;                                        * 39E73

* refs (1): 39D24
OBJ_39E78:
        :: SWAP ERRSET OBJ_53914 OBJ_16A0E ERRTRAP * 39E78
          :: OBJ_53922 ERRJMP ; OBJ_53922 SWAP ; * 39E96

* refs (1): 39D33
OBJ_39EB9:
        :: OVER NULLCOMP? NOTcase OBJ_39F04      * 39EB9
          BINT1 s:str(st,s) ;                    * 39ED2

* refs (1): 39D4C
OBJ_39EE1:
        :: ROTDROP INDEX@ #1+ 3UNROLL ExitAtLOOP ; * 39EE1

* refs (1): 39ECD
OBJ_39F04:
        ::                                       * 39F04

* refs (1): 17CC4
VLM~6:
          $ "1: " !insert$ ;                     * 39F09

* refs (1): 39D38
OBJ_39F23:
        :: $ "   " !insert$ ;                    * 39F23

* refs (5): 39CAC 39CC0 39CCF 39CE3 39CF2
OBJ_39F42:
        :: OBJ_39DBF BINT1 ;                     * 39F42

* refs (1): 39CC5
MLmode?:
        :: BINT52 TestSysFlag NOT ;              * 39F56

* refs (3): 39C20 42836 448A3
LINESOFSTACK:
        CON(5)  (*)+5                            * 39F6F  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 39F74
        GOSUB   SUB_39F93                        * 39F7B
        R0=C                                     * 39F7F
        GOSBVL  PUSH#                            * 39F82
        A=DAT0  A                                * 39F89
        D0=D0+  5                                * 39F8C
        PC=(A)                                   * 39F8F

* refs (1): 39F7B
SUB_39F93:
        GOSBVL  SUB_44747                        * 39F93
        LC(5)   #00003                           * 39F9A
        ?C<A    A                                * 39FA1
        GOYES   L_39FAC                          * 39FA4
        C=C-A   A                                * 39FA6
        C=C+1   A                                * 39FA8
        RTN                                      * 39FAA
L_39FAC:
        C=0     A                                * 39FAC
        RTN                                      * 39FAE

* refs (2): 39CE8 39DE7
AbbrevStack?:
        CON(5)  (*)+5                            * 39FB0  primitive code object
        LC(3)   #201                             * 39FB5
        GOVLNG  L_539E6                          * 39FBA

* refs (1): 39C89
SetAbbrevStk:
        CON(5)  (*)+5                            * 39FC1  primitive code object
        LC(3)   #201                             * 39FC6
        GOVLNG  SetISysFlag                      * 39FCB

* refs (3): 39BD0 39C93 437CF
ClrAbbrevStk:
        CON(5)  (*)+5                            * 39FD2  primitive code object
        LC(3)   #201                             * 39FD7
        GOVLNG  L_539F1                          * 39FDC
        RPL

* refs (2): 3A04E 3A053
~BINT5:
        :: BINT5 ;                               * 39FE3

* refs (6): 39A33 3A12F AE62A B21DC BBEDD D6E46
_chr(31)_:
        $ "\1F"                                  * 39FF2

* refs (1): 3A143
begin<16>end:
        :: BINT22 ;                              * 39FFE
