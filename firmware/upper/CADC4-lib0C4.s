* HP 48GX ROM revision R, #CADC4-#CBACD: Library part 0C4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #CADC4 in the original ROM).

LIB0C4:
        CON(3)  #0C4                             * CADC4  library number
        REL(5)  LIB0C4.hash                      * CADC7  hash table
        CON(5)  0                                * CADCC  message table
        REL(5)  LIB0C4.link                      * CADD1  link table
        CON(5)  0                                * CADD6  config
        RPL

* ROMPTR 0C4 000
* refs (1): CADC4
FFT~1:
        :: ROMPTR 0C4 001 FALSE ROMPTR 0C4 004 ROMPTR 0C2 032 ; * CADDB

* ROMPTR 0C4 001
* refs (1): CADC4
ROMP_0C4_001:
        :: ROMPTR 0C4 003 DUP DIMLIMITS ((0,0)) MAKEARRY OBJ_7CDBF SWAPDROP * CAE0B
          # 6A !MAKEHXS ;                        * CAE39

* ROMPTR 0C4 002
* refs (1): CADC4
IFFT~1:
        :: ROMPTR 0C4 001 TRUE ROMPTR 0C4 004 ROMPTR 0C2 032 ; * CAE4D

* ROMPTR 0C4 003
* refs (1): CADC4
ROMP_0C4_003:
        CODE                                     * CAE7D  89 nibbles
          C=DAT1  A                              * CAE87
          CD1EX                                  * CAE8A
          RSTK=C                                 * CAE8D
          D1=D1+  15                             * CAE8F
          A=DAT1  A                              * CAE92
          A=A-1   A                              * CAE95
          GOSUB   SUB_CAEC5                      * CAE97
          GOC     L_CAEB9                        * CAE9B
          A=A-1   A                              * CAE9E
          GOC     L_CAEAA                        * CAEA0
          GOSUB   SUB_CAEC5                      * CAEA3
          GOC     L_CAEB9                        * CAEA7
L_CAEAA:
          C=RSTK                                 * CAEAA
          D1=C                                   * CAEAC
          A=DAT0  A                              * CAEAF
          D0=D0+  5                              * CAEB2
          PC=(A)                                 * CAEB5
L_CAEB9:
          C=RSTK                                 * CAEB9
          D1=C                                   * CAEBB
          GOSBVL  SUB_370B4                      * CAEBE

* refs (2): CAE97 CAEA3
SUB_CAEC5:
          D1=D1+  5                              * CAEC5
          C=0     W                              * CAEC8
          C=DAT1  A                              * CAECB
L_CAECE:
          SB=0                                   * CAECE
          CSRB                                   * CAED1
          ?SB=0                                  * CAED4
          GOYES   L_CAECE                        * CAED7
          ?C#0    A                              * CAED9
          RTNYES                                 * CAEDC
          RTNCC                                  * CAEDE
        ENDCODE                                  * CAEE0

* ROMPTR 0C4 004
* refs (1): CADC4
ROMP_0C4_004:
        CODE                                     * CAEE0  1382 nibbles
          ST=1    3                              * CAEEA
          GOSBVL  popflag                        * CAEED
          GOC     L_CAEFA                        * CAEF4
          ST=0    3                              * CAEF7
L_CAEFA:
          D1=D1+  5                              * CAEFA
          D=D+1   A                              * CAEFD
          GOSBVL  SAVPTR                         * CAEFF
          D1=D1-  5                              * CAF06
          A=DAT1  A                              * CAF09
          D0=A                                   * CAF0C
          D0=D0+  10                             * CAF0F
          D1=D1+  5                              * CAF12
          A=DAT1  A                              * CAF15
          D1=A                                   * CAF18
          D1=D1+  15                             * CAF1B
          A=DAT1  A                              * CAF1E
          D1=D1+  5                              * CAF21
          C=0     W                              * CAF24
          C=DAT1  A                              * CAF27
          D1=D1+  5                              * CAF2A
          A=A-1   A                              * CAF2D
          ?A=0    A                              * CAF2F
          GOYES   L_CAF40                        * CAF32
          D=C     A                              * CAF34
          C=DAT1  A                              * CAF36
          D1=D1+  5                              * CAF39
          GOTO    L_CAF44                        * CAF3C
L_CAF40:
          D=0     A                              * CAF40
          D=D+1   A                              * CAF42
L_CAF44:
          DCEX    A                              * CAF44
          D0=D0+  6                              * CAF46
          DAT0=C  A                              * CAF49
          GOSUB   SUB_CB049                      * CAF4C
          D0=D0+  5                              * CAF50
          DAT0=A  1                              * CAF53
          C=D     A                              * CAF57
          D0=D0-  11                             * CAF59
          DAT0=C  A                              * CAF5C
          GOSUB   SUB_CB049                      * CAF5F
          CD1EX                                  * CAF63
          ?A=0    A                              * CAF66
          GOYES   L_CAFD1                        * CAF69
          RSTK=C                                 * CAF6B
          GOSBVL  CSLW5                          * CAF6D
          C=RSTK                                 * CAF74
          R4=C                                   * CAF76
          D0=D0+  5                              * CAF79
          DAT0=A  1                              * CAF7C
          LC(5)   #0002A                         * CAF80
          D0=D0+  7                              * CAF87
          DAT0=C  A                              * CAF8A
          D0=D0+  5                              * CAF8D
          C=0     A                              * CAF90
L_CAF92:
          C=C+1   A                              * CAF92
          DAT0=C  A                              * CAF94
          GOSUB   SUB_CB05C                      * CAF97
          D0=D0-  12                             * CAF9B
          C=DAT0  A                              * CAF9E
          GOSBVL  SUB_3769A                      * CAFA1
          C=R4                                   * CAFA8
          C=C+D   A                              * CAFAB
          R4=C                                   * CAFAD
          D0=D0+  6                              * CAFB0
          A=DAT0  A                              * CAFB3
          D0=D0+  11                             * CAFB6
          C=DAT0  A                              * CAFB9
          ?C#A    A                              * CAFBC
          GOYES   L_CAF92                        * CAFBF
          C=R4                                   * CAFC1
          GOSBVL  CSRW5                          * CAFC4
          D0=D0-  16                             * CAFCB
          D0=D0-  1                              * CAFCE
L_CAFD1:
          R4=C                                   * CAFD1
          D0=D0+  11                             * CAFD4
          A=DAT0  S                              * CAFD7
          ?A=0    S                              * CAFDB
          GOYES   L_CB040                        * CAFDE
          D0=D0-  6                              * CAFE0
          DAT0=A  S                              * CAFE3
          D0=D0+  1                              * CAFE7
          C=DAT0  A                              * CAFEA
          D=C     A                              * CAFED
          D0=D0-  6                              * CAFEF
          C=DAT0  A                              * CAFF2
          DCEX    A                              * CAFF5
          DAT0=C  A                              * CAFF7
          DCEX    A                              * CAFFA
          D0=D0+  6                              * CAFFC
          DAT0=C  A                              * CAFFF
          GOSBVL  SUB_3769A                      * CB002
          C=D     A                              * CB009
          D0=D0+  6                              * CB00B
          DAT0=C  A                              * CB00E
          D0=D0+  5                              * CB011
          C=0     A                              * CB014
L_CB016:
          C=C+1   A                              * CB016
          DAT0=C  A                              * CB018
          GOSUB   SUB_CB05C                      * CB01B
          C=R4                                   * CB01F
          CD0EX                                  * CB022
          GOSUB   SUB_CB3E5                      * CB025
          CD0EX                                  * CB029
          R4=C                                   * CB02C
          D0=D0-  6                              * CB02F
          A=DAT0  A                              * CB032
          D0=D0+  11                             * CB035
          C=DAT0  A                              * CB038
          ?C#A    A                              * CB03B
          GOYES   L_CB016                        * CB03E
L_CB040:
          P=      0                              * CB040
          GOVLNG  GETPTRLOOP                     * CB042

* refs (2): CAF4C CAF5F
SUB_CB049:
          A=0     A                              * CB049
          A=A-1   A                              * CB04B
L_CB04D:
          A=A+1   A                              * CB04D
          SB=0                                   * CB04F
          CSRB                                   * CB052
          ?SB=0                                  * CB055
          GOYES   L_CB04D                        * CB058
          RTN                                    * CB05A

* refs (2): CAF97 CB01B
SUB_CB05C:
          D0=D0-  16                             * CB05C
          D0=D0-  1                              * CB05F
          A=DAT0  A                              * CB062
          GOSBVL  SUB_7A0AA                      * CB065
          C=0     W                              * CB06C
          D=0     W                              * CB06F
          P=      13                             * CB072
          LC(2)   #36                            * CB074
          D=D+1   X                              * CB078
          D=D+1   X                              * CB07B
          DCEX    W                              * CB07E
          GOSBVL  XYEX                           * CB081
          GOSBVL  DIVF                           * CB088
          ?ST=0   3                              * CB08F
          GOYES   L_CB097                        * CB092
          A=-A-1  S                              * CB094
L_CB097:
          D0=D0+  16                             * CB097
          D0=D0+  16                             * CB09A
          D0=D0+  11                             * CB09D
          GOSUB   PUTAB0~jump_4                  * CB0A0
          SETHEX                                 * CB0A4
          D0=D0-  16                             * CB0A6
          D0=D0-  6                              * CB0A9
          C=0     S                              * CB0AC
L_CB0AF:
          DAT0=C  S                              * CB0AF
          D0=D0-  16                             * CB0B3
          D0=D0-  16                             * CB0B6
          D0=D0-  5                              * CB0B9
          A=DAT0  S                              * CB0BC
          A=A-1   S                              * CB0C0
          C=A-C   S                              * CB0C3
          GOSUB   SUB_CB363                      * CB0C6
          D0=D0+  16                             * CB0CA
          D0=D0+  1                              * CB0CD
          DAT0=C  A                              * CB0D0
          D0=D0+  5                              * CB0D3
          C=R4                                   * CB0D6
          DAT0=C  A                              * CB0D9
          D0=D0+  5                              * CB0DC
          C=0     A                              * CB0DF
L_CB0E1:
          C=C+1   A                              * CB0E1
          DAT0=C  A                              * CB0E3
          D0=D0-  16                             * CB0E6
          D0=D0-  11                             * CB0E9
          A=DAT0  S                              * CB0EC
          C=C-1   A                              * CB0F0
          C=C+C   A                              * CB0F2
          GOSUB   SUB_CB346                      * CB0F4
          GOSBVL  SUB_7A0AA                      * CB0F8
          D0=D0+  16                             * CB0FF
          D0=D0+  16                             * CB102
          D0=D0+  6                              * CB105
          GOSUB   SUB_CB42E                      * CB108
          CD0EX                                  * CB10C
          RSTK=C                                 * CB10F
          ST=0    4                              * CB111
          ST=0    9                              * CB114
          GOSUB   SUB_CB385                      * CB117
          C=RSTK                                 * CB11B
          D0=C                                   * CB11D
          A=-A-1  S                              * CB120
          GOSUB   PUTAB0~jump_4                  * CB123
          GOSBVL  RCAB0                          * CB127
          GOSUB   PUTAB0~jump_4                  * CB12E
          SETHEX                                 * CB132
          GOSUB   SUB_CB3D4                      * CB134
          C=0     A                              * CB138
L_CB13A:
          C=C+1   A                              * CB13A
          DAT0=C  A                              * CB13C
          GOSBVL  CkATTNcode                     * CB13F
          D0=D0-  16                             * CB146
          D0=D0-  9                              * CB149
          C=DAT0  A                              * CB14C
          D=C     A                              * CB14F
          D0=D0+  10                             * CB151
          C=DAT0  A                              * CB154
          GOSUB   SUB_CB372                      * CB157
          D0=D0+  5                              * CB15B
          C=DAT0  A                              * CB15E
          C=C+D   A                              * CB161
          D1=C                                   * CB163
          SETDEC                                 * CB166
          GOSUB   GETAB1~jump_3                  * CB168
          GOSUB   SUB_CB3E5                      * CB16C
          D0=D0+  16                             * CB170
          GOSUB   SUB_CB42E                      * CB173
          GOSBVL  STAB0                          * CB177
          GOSUB   GETAB1~jump_3                  * CB17E
          GOSUB   SUB_CB3DA                      * CB182
          GOSUB   SUB_CB42E                      * CB186
          A=-A-1  S                              * CB18A
          GOSUB   SUB_CB411                      * CB18D
          GOSBVL  STAB2                          * CB191
          GOSUB   SUB_CB404                      * CB198
          GOSUB   SUB_CB42E                      * CB19C
          GOSBVL  STAB0                          * CB1A0
          GOSUB   SUB_CB3C9                      * CB1A7
          GOSUB   GETAB1~jump_3                  * CB1AB
          GOSUB   SUB_CB3DA                      * CB1AF
          GOSUB   SUB_CB42E                      * CB1B3
          GOSUB   SUB_CB411                      * CB1B7
          GOSBVL  STAB0                          * CB1BB
          GOSUB   SUB_CB3D7                      * CB1C2
          C=DAT0  A                              * CB1C6
          CD0EX                                  * CB1C9
          RSTK=C                                 * CB1CC
          A=-A-1  S                              * CB1CE
          D0=D0+  16                             * CB1D1
          D0=D0+  5                              * CB1D4
          GOSUB   SUB_CB439                      * CB1D7
          GOSUB   PutAB%1~jump_3                 * CB1DB
          GOSBVL  RCAB2                          * CB1DF
          A=-A-1  S                              * CB1E6
          GOSUB   SUB_CB3DA                      * CB1E9
          GOSUB   SUB_CB439                      * CB1ED
          GOSUB   SUB_CB3C9                      * CB1F1
          GOSUB   PutAB%1~jump_3                 * CB1F5
          GOSBVL  RCAB2                          * CB1F9
          D0=D0-  16                             * CB200
          D0=D0-  5                              * CB203
          GOSUB   SUB_CB439                      * CB206
          GOSUB   SUB_CB3F7                      * CB20A
          GOSBVL  RCAB0                          * CB20E
          GOSUB   SUB_CB439                      * CB215
          GOSUB   SUB_CB3F7                      * CB219
          GOSUB   SUB_CB3DA                      * CB21D
          C=RSTK                                 * CB221
          CD0EX                                  * CB223
          SETHEX                                 * CB226
          D0=D0-  15                             * CB228
          A=DAT0  A                              * CB22B
          C=C+A   A                              * CB22E
          D0=D0+  15                             * CB230
          DAT0=C  A                              * CB233
          D0=D0-  5                              * CB236
          A=DAT0  A                              * CB239
          D0=D0+  15                             * CB23C
          C=DAT0  A                              * CB23F
          ?C=A    A                              * CB242
          GOYES   L_CB24B                        * CB245
          GOTO    L_CB13A                        * CB247
L_CB24B:
          D0=D0-  16                             * CB24B
          D0=D0-  9                              * CB24E
          C=DAT0  A                              * CB251
          D=C     A                              * CB254
          C=A     A                              * CB256
          GOSUB   SUB_CB372                      * CB258
          D0=D0+  15                             * CB25C
          C=DAT0  A                              * CB25F
          C=C+D   A                              * CB262
          DAT0=C  A                              * CB264
          D0=D0+  15                             * CB267
          C=DAT0  S                              * CB26A
          GOSUB   SUB_CB363                      * CB26E
          D0=D0-  10                             * CB272
          A=DAT0  A                              * CB275
          ?C=A    A                              * CB278
          GOYES   L_CB283                        * CB27B
          C=A     A                              * CB27D
          GOTO    L_CB0E1                        * CB27F
L_CB283:
          D0=D0-  16                             * CB283
          D0=D0-  11                             * CB286
          A=DAT0  S                              * CB289
          D0=D0+  16                             * CB28D
          D0=D0+  16                             * CB290
          D0=D0+  5                              * CB293
          C=DAT0  S                              * CB296
          C=C+1   S                              * CB29A
          ?C=A    S                              * CB29D
          GOYES   L_CB2A6                        * CB2A0
          GOTO    L_CB0AF                        * CB2A2
L_CB2A6:
          GOSUB   SUB_CB3DA                      * CB2A6
          C=DAT0  A                              * CB2AA
          R0=C                                   * CB2AD
          D0=D0+  5                              * CB2B0
          A=DAT0  S                              * CB2B3
          R1=A                                   * CB2B7
          C=R4                                   * CB2BA
          D1=C                                   * CB2BD
          B=0     A                              * CB2C0
          D0=D0+  7                              * CB2C2
L_CB2C5:
          A=R1                                   * CB2C5
          C=B     A                              * CB2C8
          GOSUB   SUB_CB346                      * CB2CA
          ?A>=B   A                              * CB2CE
          GOYES   L_CB305                        * CB2D1
          C=B     A                              * CB2D3
          C=C-A   A                              * CB2D5
          D=C     A                              * CB2D7
          C=DAT0  A                              * CB2D9
          A=B     A                              * CB2DC
          GOSBVL  L_35790                        * CB2DE
          ABEX    A                              * CB2E5
          CD1EX                                  * CB2E7
          D1=C                                   * CB2EA
          C=C-A   A                              * CB2ED
          CD0EX                                  * CB2EF
          RSTK=C                                 * CB2F2
          GOSUB   SUB_CB31C                      * CB2F4
          GOSUB   SUB_CB31C                      * CB2F8
          GOSUB   SUB_CB3C9                      * CB2FC
          C=RSTK                                 * CB300
          D0=C                                   * CB302
L_CB305:
          C=DAT0  A                              * CB305
          AD1EX                                  * CB308
          A=A+C   A                              * CB30B
          AD1EX                                  * CB30D
          B=B+1   A                              * CB310
          C=R0                                   * CB312
          ?B#C    A                              * CB315
          GOYES   L_CB2C5                        * CB318
          RTN                                    * CB31A

* refs (2): CB2F4 CB2F8
SUB_CB31C:
          A=DAT0  A                              * CB31C
          C=DAT1  A                              * CB31F
          DAT0=C  A                              * CB322
          DAT1=A  A                              * CB325
          D0=D0+  5                              * CB328
          D1=D1+  5                              * CB32B
          A=DAT0  W                              * CB32E
          C=DAT1  W                              * CB332
          DAT0=C  W                              * CB336
          DAT1=A  W                              * CB33A
          D0=D0+  16                             * CB33E
          D1=D1+  16                             * CB341
          RTN                                    * CB344

* refs (2): CB0F4 CB2CA
SUB_CB346:
          A=0     A                              * CB346
          GOTO    L_CB35B                        * CB348
L_CB34C:
          A=A+A   A                              * CB34C
          SB=0                                   * CB34E
          CSRB                                   * CB351
          ?SB=0                                  * CB354
          GOYES   L_CB35B                        * CB357
          A=A+1   A                              * CB359
L_CB35B:
          A=A-1   S                              * CB35B
          GONC    L_CB34C                        * CB35E
          RTN                                    * CB361

* refs (2): CB0C6 CB26E
SUB_CB363:
          C=0     A                              * CB363
          C=C+1   A                              * CB365
L_CB367:
          C=C-1   S                              * CB367
          RTNC                                   * CB36A
          C=C+C   A                              * CB36D
          GONC    L_CB367                        * CB36F

* refs (2): CB157 CB258
SUB_CB372:
          SB=0                                   * CB372
L_CB375:
          CSRB                                   * CB375
          ?SB=0                                  * CB378
          GOYES   L_CB37F                        * CB37B
          RTN                                    * CB37D
L_CB37F:
          D=D+D   A                              * CB37F
          GOTO    L_CB375                        * CB381

* refs (1): CB117
SUB_CB385:
          GOSBVL  SUB_2B6E9                      * CB385
          GOSBVL  EXAB0                          * CB38C
          ?ST=0   11                             * CB393
          GOYES   L_CB39B                        * CB396
          A=-A-1  S                              * CB398
L_CB39B:
          P=      0                              * CB39B
          LC(3)   #F00                           * CB39D
          ?C=A    X                              * CB3A2
          GOYES   L_CB3B5                        * CB3A5
          GOSBVL  RCCD0                          * CB3A7
L_CB3AE:
          GOVLNG  MULTF                          * CB3AE
L_CB3B5:
          A=0     A                              * CB3B5
          B=0     W                              * CB3B7
          P=      14                             * CB3BA
          B=B+1   P                              * CB3BC
          ?ST=1   10                             * CB3BF
          RTNYES                                 * CB3C2
          A=-A-1  S                              * CB3C4
          RTN                                    * CB3C7

* refs (3): CB1A7 CB1F1 CB2FC
SUB_CB3C9:
          D1=D1-  16                             * CB3C9
          D1=D1-  16                             * CB3CC
          D1=D1-  10                             * CB3CF
          RTN                                    * CB3D2

* refs (1): CB134
SUB_CB3D4:
          D0=D0-  11                             * CB3D4

* refs (1): CB1C2
SUB_CB3D7:
          D0=D0-  16                             * CB3D7

* refs (5): CB182 CB1AF CB1E9 CB21D CB2A6
SUB_CB3DA:
          D0=D0-  16                             * CB3DA
          D0=D0-  16                             * CB3DD
          D0=D0-  10                             * CB3E0
          RTN                                    * CB3E3

* refs (2): CB025 CB16C
SUB_CB3E5:
          D0=D0+  16                             * CB3E5
          D0=D0+  16                             * CB3E8
          D0=D0+  10                             * CB3EB
          RTN                                    * CB3EE

* refs (2): CB1DB CB1F5
PutAB%1~jump_3:
          GOVLNG  PutAB%1                        * CB3F0

* refs (2): CB20A CB219
SUB_CB3F7:
          D0=D0-  16                             * CB3F7
          D0=D0-  5                              * CB3FA

* refs (3): CB0A0 CB123 CB12E
PUTAB0~jump_4:
          GOVLNG  PUTAB0                         * CB3FD

* refs (1): CB198
SUB_CB404:
          D1=D1-  16                             * CB404
          D1=D1-  5                              * CB407

* refs (3): CB168 CB17E CB1AB
GETAB1~jump_3:
          GOVLNG  GETAB1                         * CB40A

* refs (2): CB18D CB1B7
SUB_CB411:
          GOSBVL  RCCD0                          * CB411

* refs (1): CB440
SUB_CB418:
          CD0EX                                  * CB418
          RSTK=C                                 * CB41B
          CD0EX                                  * CB41D
          GOSBVL  RADDF                          * CB420
          C=RSTK                                 * CB427
          D0=C                                   * CB429
          RTN                                    * CB42C

* refs (5): CB108 CB173 CB186 CB19C CB1B3
SUB_CB42E:
          GOSBVL  GETCD0                         * CB42E
          GOTO    L_CB3AE                        * CB435

* refs (4): CB1D7 CB1ED CB206 CB215
SUB_CB439:
          GOSBVL  GETCD0                         * CB439
          GOSUB   SUB_CB418                      * CB440
          ?ST=0   3                              * CB444
          RTNYES                                 * CB447
          GOVLNG  DIV2                           * CB449
        ENDCODE                                  * CB450

* ROMPTR 0C4 005
* refs (1): CADC4
NDIST~1:
        :: OVER %0> NOTcase SETSIZEERR           * CB450
          ROT %>%%- DUP %%* SWAP %>%% SWAP OVER %%/ %% -5E-1 %%* %%EXP SWAP * CB469
          %% 6.28318530717959E0 %%* %%SQRT %%/ %%>% ; * CB4BF

* ROMPTR 0C4 006
* refs (1): CADC4
PSDEV~1:
        :: BINT0 OBJ_2C5EE OBJ_2CD27 ;           * CB4F2

* ROMPTR 0C4 007
* refs (1): CADC4
PVAR~1:
        :: BINT0 OBJ_2C5EE OBJ_2CD1B ;           * CB50B

* ROMPTR 0C4 008
* refs (1): CADC4
PCOV~1:
        :: RclXYCol&äDAT DUP4UNROLL 3PICKOVER OBJ_2CC4C OBJ_2CDA5 3PICK3PICK * CB524
          OBJ_2CC06 OBJ_2CDA5 OBJ_2CC4C OBJ_2CC06 OBJ_2CE7C SWAP OBJ_2CC92 * CB547
          %>%% %%/>% ;                           * CB56A

* ROMPTR 0C4 009
* refs (1): CADC4
ROMP_0C4_009:
        :: DUP ARSIZE RESOROMP ROMPTR 0C4 00B RESOROMP ROMPTR 0C4 00A 3PICK * CB579
          3NULLLAM{} BIND #1+ DUP BINT1 {}N 3PICK TYPERARRY? ITE %%0 ((0,0)) * CB5AD
          MAKEARRY %%1 3PICK PUT%%EL 3UNROLL ONE_DO INDEX@ PULLLONGEL * CB5E4
          :: DUPTYPEEREL? case 2GETLAM           * CB60C
            INDEX@ 1GETLAM #=case 2GETLAM        * CB620
            SWAP INDEX@ #1+ PULLLONGEL C%%CONJ ROT DUPUNROT EQUAL ITE * CB634
            3GETLAM 2GETLAM                      * CB661
          ;                                      * CB66B
          EVAL LOOP ABND DROP ROMPTR 0C2 032 ;   * CB670

* ROMPTR 0C4 00A
* refs (1): CADC4
ROMP_0C4_00A:
        :: B%NEG %%0 4ROLL ISTOP@ DUP INDEX@ #- DO SWAP 3PICK L%* SWAP * CB694
          INDEX@ #1+ PULL%%EL DUPUNROT 4ROLL L%+ INDEX@ PUT%%EL NextInArray * CB6D5
          3UNROLL L%* ISTOP@ PUT%%EL SWAP ;      * CB702

* ROMPTR 0C4 00B
* refs (1): CADC4
ROMP_0C4_00B:
        :: C%%>%% OVER %%SQR SWAP DUP %%+ ((0,0)) ((0,0)) 6ROLL 1GETLAM DUP * CB720
          INDEX@ #- DO INDEX@ #2+ PULL%%EL SWAP 4ROLL 6PICK C%%C*R 4PICK * CB75C
          6PICK C%%C*R C%%C-C 3PICK C%%C+C INDEX@ PUT%%EL NextInArray ROT * CB793
          5PICK C%%C*R 3PICK 5ROLL C%%C*R C%%C-C 1GETLAM PUT%%EL 3UNROLL * CB7C0
          C%%R*C 1GETLAM #1+ PUT%%EL SWAP INDEX@ #1+ INDEXSTO ; * CB7ED

* ROMPTR 0C4 00C
* refs (1): CADC4
ROMP_0C4_00C:
        :: NOTNUM? SWAP CLRNUM %0_2A2B4 4ROLL ONE_DO_ARRY INDEX@ PULLEL * CB81A
          ROTSWAP 4PICK ISTOP@ INDEX@ #-#1- UNCOERCE x^ x* x+ SWAP * CB847
          NextInArray DROPSWAPDROP SWAP ?SKIP SETNUM * CB879
        ;                                        * CB892

* ROMPTR 0C4 00D
* refs (1): CADC4
ROMP_0C4_00D:
        :: NOTNUM? SWAP CLRNUM %1 4ROLL ONE_DO_ARRY INDEX@ PULLEL 4PICKSWAP * CB897
          x- ROTSWAP x* SWAP NextInArray DROPSWAPDROP SWAP ?SKIP SETNUM * CB8C9
        ;                                        * CB8F6

* ROMPTR 0C4 00E
* refs (1): CADC4
PEVAL~1:
        :: F%>L% SWAP %%0 OVERARSIZE #1+_ONE_DO 3PICK L%* SWAP INDEX@ * CB8FB
          PULLLONGEL ROT L%+                     * CB92D
          CODE                                   * CB93C  180 nibbles
            C=DAT1  A                            * CB946
            CD1EX                                * CB949
            A=DAT1  A                            * CB94C
            D1=(5)  DOEREL                       * CB94F
            CD1EX                                * CB956
            ?C#A    A                            * CB959
            GOYES   L_CB973                      * CB95C
            GOSBVL  POP1%%                       * CB95E
            GOSUB   SUB_CB9CE                    * CB965
            GOC     L_CB996                      * CB969
            GOVLNG  L_2A235                      * CB96C
L_CB973:
            GOSBVL  POPC%%                       * CB973
            GOSBVL  STCD0                        * CB97A
            GOSUB   SUB_CB9CE                    * CB981
            GONC    L_CB9AE                      * CB985
            GOSBVL  EXAB0                        * CB988
            GOSUB   SUB_CB9CE                    * CB98F
            GONC    L_CB9B9                      * CB993
L_CB996:
            SETHEX                               * CB996
            GOSBVL  GETPTR                       * CB998
            D1=D1-  5                            * CB99F
            D=D-1   A                            * CB9A2
            A=DAT0  A                            * CB9A4
            D0=D0+  5                            * CB9A7
            PC=(A)                               * CB9AA
L_CB9AE:
            GOSBVL  EXAB0                        * CB9AE
            GOSUB   SUB_CB9CE                    * CB9B5
L_CB9B9:
            GOSBVL  RCCD0                        * CB9B9
            GOSBVL  XYEX                         * CB9C0
            GOVLNG  L_51BA2                      * CB9C7

* refs (4): CB965 CB981 CB98F CB9B5
SUB_CB9CE:
            LC(5)   #50000                       * CB9CE
            ?C<=A   A                            * CB9D5
            GOYES   L_CB9EA                      * CB9D8
            LC(5)   #10000                       * CB9DA
            ?C>A    A                            * CB9E1
            RTNYES                               * CB9E4
            A=C     A                            * CB9E6
            RTNCC                                * CB9E8
L_CB9EA:
            LC(5)   #90000                       * CB9EA
            ?C<A    A                            * CB9F1
            RTNYES                               * CB9F4
            A=C     A                            * CB9F6
            RTNCC                                * CB9F8
          ENDCODE                                * CB9FA
          NextInArray ROTROT2DROP ToNorm(nb) ;   * CB9FA

LIB0C4.hash:
        CON(5)  DOHSTR                           * CBA0E  hash table of library 0C4
        LENGTH                                   * CBA13  length, to #CBA72
        CON(5)  0                                * CBA18  names of length 1
        CON(5)  0                                * CBA1D  names of length 2
        CON(5)  0                                * CBA22  names of length 3
        CON(5)  0                                * CBA27  names of length 4
        CON(5)  0                                * CBA2C  names of length 5
        CON(5)  0                                * CBA31  names of length 6
        CON(5)  0                                * CBA36  names of length 7
        CON(5)  0                                * CBA3B  names of length 8
        CON(5)  0                                * CBA40  names of length 9
        CON(5)  0                                * CBA45  names of length 10
        CON(5)  0                                * CBA4A  names of length 11
        CON(5)  0                                * CBA4F  names of length 12
        CON(5)  0                                * CBA54  names of length 13
        CON(5)  0                                * CBA59  names of length 14
        CON(5)  0                                * CBA5E  names of length 15
        CON(5)  0                                * CBA63  names of length 16
        REL(5)  L_CBA6D                          * CBA68  end of the names
L_CBA6D:
        CON(5)  0                                * CBA6D  command 000 has no name
        ENDLENGTH                                * CBA72

LIB0C4.link:
        CON(5)  DOHSTR                           * CBA72  link table of library 0C4
        LENGTH                                   * CBA77  length, to #CBAC7
        REL(5)  FFT~1                            * CBA7C  000 
        REL(5)  ROMP_0C4_001                     * CBA81  001 
        REL(5)  IFFT~1                           * CBA86  002 
        REL(5)  ROMP_0C4_003                     * CBA8B  003 
        REL(5)  ROMP_0C4_004                     * CBA90  004 
        REL(5)  NDIST~1                          * CBA95  005 
        REL(5)  PSDEV~1                          * CBA9A  006 
        REL(5)  PVAR~1                           * CBA9F  007 
        REL(5)  PCOV~1                           * CBAA4  008 
        REL(5)  ROMP_0C4_009                     * CBAA9  009 
        REL(5)  ROMP_0C4_00A                     * CBAAE  00A 
        REL(5)  ROMP_0C4_00B                     * CBAB3  00B 
        REL(5)  ROMP_0C4_00C                     * CBAB8  00C 
        REL(5)  ROMP_0C4_00D                     * CBABD  00D 
        REL(5)  PEVAL~1                          * CBAC2  00E 
        ENDLENGTH                                * CBAC7
        NIBHEX  8DF0000                          * CBAC7  Ø..
