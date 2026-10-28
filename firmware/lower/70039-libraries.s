* HP 48GX ROM revision R, #70039-#73087: Library table, access pointers, bank switching
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ?ACCPTR> RPTRACC rNTHELCOMP -0.26480225202E-23 {{}}_7303D RomLibTable Code_72EDD Code_72A11 BANKMTHDS (-0.26650264802E-740,-4.16487E
* Follows on from the previous file (at #70039 in the original ROM).

* refs (1): 855DD
OBJ_70039:
        CON(5)  (*)+5                            * 70039  primitive code object
        C=0     S                                * 7003E
        C=-C-1  S                                * 70041
        GOTO    L_70050                          * 70044

* refs (2): 855FB 85623
OBJ_70048:
        CON(5)  (*)+5                            * 70048  primitive code object
        C=0     S                                * 7004D
L_70050:
        LC(5)   NOALARMSRV                       * 70050
        CD1EX                                    * 70057
        DAT1=C  S                                * 7005A
        D1=C                                     * 7005E
        GOVLNG  Loop                             * 70061
        RPL

        :: DROPOVER #3+ SINNERMETA IMPLODE TRUE ; * 70068
        ASSEMBLE

* refs (1): 17F2B
SUB_7008B:
        D=C     A                                * 7008B
        SETHEX                                   * 7008D
        GOSBVL  SUB_09D49                        * 7008F
        C=D     A                                * 70096
        RSTK=C                                   * 70098
        P=      0                                * 7009A
        LC(5)   CMOS                             * 7009C
        UNCNFG                                   * 700A3
        GOSBVL  SUB_022D9                        * 700A6
        GOSUB   SUB_700F7                        * 700AD
        C=RSTK                                   * 700B1
        A=C     A                                * 700B3
        LC(5)   L_700C2                          * 700B5
        RSTK=C                                   * 700BC
        PC=A                                     * 700BE
L_700C2:
        P=      0                                * 700C2
        LC(5)   #C0000                           * 700C4
        UNCNFG                                   * 700CB
        GOSBVL  SUB_0224F                        * 700CE
        D0=(5)  #80535                           * 700D5
        C=DAT0  S                                * 700DC
        C=0     A                                * 700E0
        ?C=0    S                                * 700E2
        GOYES   L_700F0                          * 700E5
        C=C+1   S                                * 700E7
        GOC     L_700F0                          * 700EA
        C=C+1   B                                * 700ED
L_700F0:
        GOSBVL  L_09CFA                          * 700F0

* refs (1): 700AD
SUB_700F7:
        GOVLNG  L_01C7F                          * 700F7
L_700FE:
        D=C     A                                * 700FE
        SETHEX                                   * 70100
        GOSBVL  SUB_09D49                        * 70102
        C=D     A                                * 70109
        RSTK=C                                   * 7010B
        LC(5)   CMOS                             * 7010D
        GOVLNG  L_026D1                          * 70114

* refs (2): 00418 00462
SUB_7011B:
        D0=(2)  #11                              * 7011B
        A=DAT0  XS                               * 7011F
        ABIT=0  11                               * 70123
        ABIT=0  9                                * 70128
        ?A#0    XS                               * 7012D
        RTNYES                                   * 70130
        RTNCC                                    * 70132

* refs (2): 004E7 004FD
SUB_70134:
        D1=(4)  #0520                            * 70134
        C=DAT1  S                                * 7013A
        C=C+C   S                                * 7013E
        RTNNC                                    * 70141
        LC(2)   #80                              * 70144
        C=C&B   B                                * 70148
        A=A!C   B                                * 7014C
        C=C+C   S                                * 70150
        RTNNC                                    * 70153
        GOVLNG  SUB_3114C                        * 70156

* refs (2): 005CA 30F2D
SUB_7015D:
        D0=(2)  #16                              * 7015D
        DAT0=A  B                                * 70161
        D1=(4)  #051E                            * 70164
        A=DAT1  B                                * 7016A
        ABIT=1  0                                * 7016D
        ABIT=0  7                                * 70172
        DAT1=A  B                                * 70177
        RTN                                      * 7017A

* refs (2): 02130 80375
SUB_7017C:
        C=B     A                                * 7017C
        CSRB.F  A                                * 7017E
        C=C+A   A                                * 70183
        A=0     W                                * 70185
        A=C     A                                * 70188
        RTNCC                                    * 7018A
* Boot code, reached from RESET (#01FEA)
L_7018C:
        MP=0                                     * 7018C
        P=      0                                * 7018F
        SETHEX                                   * 70191
        GOSBVL  SUB_02241                        * 70193
        D0=(5)  LINECOUNT                        * 7019A
        C=0     B                                * 701A1
        DAT0=C  B                                * 701A4
        GOSBVL  SUB_0224F                        * 701A7
        D0=(5)  LINECOUNTg                       * 701AE
        LC(2)   #3F                              * 701B5
        DAT0=C  B                                * 701B9
        GOVLNG  L_01FF4                          * 701BC
L_701C3:
        P=      0                                * 701C3
        C=0     B                                * 701C5
        D0=(5)  LINECOUNT                        * 701C8
        DAT0=C  B                                * 701CF
        LC(5)   #FF000                           * 701D2
        CONFIG                                   * 701D9
        LC(5)   HARDRAMEND                       * 701DC
        CONFIG                                   * 701E3
        CD0EX                                    * 701E6
        C=DAT0  B                                * 701E9
        LC(5)   #F0000                           * 701EC
        CONFIG                                   * 701F3
        LC(5)   #A0000                           * 701F6
        CONFIG                                   * 701FD
        LC(5)   #F0000                           * 70200
        CONFIG                                   * 70207
        LC(5)   #B0000                           * 7020A
        CONFIG                                   * 70211
        LC(5)   #C0000                           * 70214
        LC(4)   #069A                            * 7021B
        CD0EX                                    * 70221
        RSTK=C                                   * 70224
        C=DAT0  B                                * 70226
        CBIT=1  7                                * 70229
        DAT0=C  B                                * 7022E
        D0=(5)  LINECOUNT                        * 70231
        DAT0=C  B                                * 70238
        C=RSTK                                   * 7023B
        D0=C                                     * 7023D
        RTNCC                                    * 70240

* refs (1): 0424B
SUB_70242:
        GOSBVL  AllowIntr                        * 70242
        GOVLNG  L_7DFCF                          * 70249
L_70250:
        D0=(5)  #7F000                           * 70250
        C=DAT0  B                                * 70257
        D0=(5)  LINECOUNT                        * 7025A
        C=DAT0  B                                * 70261
        CBIT=1  7                                * 70264
        DAT0=C  B                                * 70269
        D0=(5)  IOC                              * 7026C
        C=0     A                                * 70273
        DAT0=C  1                                * 70275
        GOVLNG  L_00306                          * 70279
        RPL

* refs (1): 0AAC1
OBJ_70280:
        # 40000                                  * 70280  262144

* refs (4): 08072 0AACB 0AB27 0BBAC
OBJ_7028A:
        CON(5)  (*)+5                            * 7028A  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 7028F
        C=0     A                                * 70296
        R0=C.F  A                                * 70298
        GOTO    L_706A1                          * 7029E

* refs (5): 09E5C 7134C 7136E 716B8 7188F
SUB_702A2:
        C=DAT1  A                                * 702A2
        CD1EX                                    * 702A5
        D1=D1+  10                               * 702A8
        A=DAT1  A                                * 702AB
        R0=A.F  A                                * 702AE
        D1=D1-  5                                * 702B4
        A=DAT1  A                                * 702B7
        D1=C                                     * 702BA
        D1=D1+  5                                * 702BD
        D=D+1   A                                * 702C0
        RTNCC                                    * 702C2

* ROM library table: lib# (3), header address (5), access handler (5); ends with lib #FFF
RomLibTable:
        CON(3)  #000                             * 702C4  library
        CON(5)  LIB000                           * 702C7  header
        CON(5)  0                                * 702CC  directly visible
        CON(3)  #001                             * 702D1  library
        CON(5)  LIB001                           * 702D4  header
        CON(5)  0                                * 702D9  directly visible
        CON(3)  #002                             * 702DE  library
        CON(5)  LIB002                           * 702E1  header
        CON(5)  0                                * 702E6  directly visible
        CON(3)  #003                             * 702EB  library
        CON(5)  LIB003                           * 702EE  header
        CON(5)  0                                * 702F3  directly visible
        CON(3)  #005                             * 702F8  library
        CON(5)  LIB005                           * 702FB  header
        CON(5)  0                                * 70300  directly visible
        CON(3)  #006                             * 70305  library
        CON(5)  LIB006                           * 70308  header
        CON(5)  0                                * 7030D  directly visible
        CON(3)  #00A                             * 70312  library
        CON(5)  LIB00A                           * 70315  header
        CON(5)  0                                * 7031A  directly visible
        CON(3)  #00B                             * 7031F  library
        CON(5)  LIB00B                           * 70322  header
        CON(5)  0                                * 70327  directly visible
        CON(3)  #00C                             * 7032C  library
        CON(5)  LIB00C                           * 7032F  header
        CON(5)  0                                * 70334  directly visible
        CON(3)  #00D                             * 70339  library
        CON(5)  LIB00D                           * 7033C  header
        CON(5)  0                                * 70341  directly visible
        CON(3)  #019                             * 70346  library
        CON(5)  LIB019                           * 70349  header
        CON(5)  0                                * 7034E  directly visible
        CON(3)  #0A1                             * 70353  library
        CON(5)  LIB0A1                           * 70356  header
        CON(5)  0                                * 7035B  directly visible
        CON(3)  #0A2                             * 70360  library
        CON(5)  LIB0A2                           * 70363  header
        CON(5)  0                                * 70368  directly visible
        CON(3)  #0A3                             * 7036D  library
        CON(5)  LIB0A3                           * 70370  header
        CON(5)  0                                * 70375  directly visible
        CON(3)  #0A4                             * 7037A  library
        CON(5)  LIB0A4                           * 7037D  header
        CON(5)  0                                * 70382  directly visible
        CON(3)  #0A5                             * 70387  library
        CON(5)  LIB0A5                           * 7038A  header
        CON(5)  0                                * 7038F  directly visible
        CON(3)  #0A6                             * 70394  library
        CON(5)  LIB0A6                           * 70397  header
        CON(5)  0                                * 7039C  directly visible
        CON(3)  #0A7                             * 703A1  library
        CON(5)  LIB0A7                           * 703A4  header
        CON(5)  0                                * 703A9  directly visible
        CON(3)  #0F0                             * 703AE  library
        CON(5)  LIB0F0                           * 703B1  header
        CON(5)  L_726A1                          * 703B6  access handler
        CON(3)  #0C0                             * 703BB  library
        CON(5)  LIB0C0                           * 703BE  header
        CON(5)  L_726A1                          * 703C3  access handler
        CON(3)  #0F1                             * 703C8  library
        CON(5)  LIB0F1                           * 703CB  header
        CON(5)  L_726A1                          * 703D0  access handler
        CON(3)  #0EA                             * 703D5  library
        CON(5)  LIB0EA                           * 703D8  header
        CON(5)  L_726A1                          * 703DD  access handler
        CON(3)  #0C2                             * 703E2  library
        CON(5)  LIB0C2                           * 703E5  header
        CON(5)  L_72386                          * 703EA  access handler
        CON(3)  #0E6                             * 703EF  library
        CON(5)  LIB0E6                           * 703F2  header
        CON(5)  L_72386                          * 703F7  access handler
        CON(3)  #0E3                             * 703FC  library
        CON(5)  LIB0E3                           * 703FF  header
        CON(5)  L_72386                          * 70404  access handler
        CON(3)  #0E4                             * 70409  library
        CON(5)  LIB0E4                           * 7040C  header
        CON(5)  L_72386                          * 70411  access handler
        CON(3)  #0E1                             * 70416  library
        CON(5)  LIB0E1                           * 70419  header
        CON(5)  L_72386                          * 7041E  access handler
        CON(3)  #0B4                             * 70423  library
        CON(5)  LIB0B4                           * 70426  header
        CON(5)  L_72386                          * 7042B  access handler
        CON(3)  #0B5                             * 70430  library
        CON(5)  LIB0B5                           * 70433  header
        CON(5)  L_72386                          * 70438  access handler
        CON(3)  #0B3                             * 7043D  library
        CON(5)  LIB0B3                           * 70440  header
        CON(5)  L_72386                          * 70445  access handler
        CON(3)  #0AB                             * 7044A  library
        CON(5)  LIB0AB                           * 7044D  header
        CON(5)  L_70B38                          * 70452  access handler
        CON(3)  #0A9                             * 70457  library
        CON(5)  LIB0A9                           * 7045A  header
        CON(5)  L_70B38                          * 7045F  access handler
        CON(3)  #0AA                             * 70464  library
        CON(5)  LIB0AA                           * 70467  header
        CON(5)  L_70B38                          * 7046C  access handler
        CON(3)  #0A8                             * 70471  library
        CON(5)  LIB0A8                           * 70474  header
        CON(5)  L_70B38                          * 70479  access handler
        CON(3)  #0C1                             * 7047E  library
        CON(5)  LIB0C1                           * 70481  header
        CON(5)  L_70B38                          * 70486  access handler
        CON(3)  #0C4                             * 7048B  library
        CON(5)  LIB0C4                           * 7048E  header
        CON(5)  L_70B38                          * 70493  access handler
        CON(3)  #0C3                             * 70498  library
        CON(5)  LIB0C3                           * 7049B  header
        CON(5)  L_70B38                          * 704A0  access handler
        CON(3)  #0E7                             * 704A5  library
        CON(5)  LIB0E7                           * 704A8  header
        CON(5)  L_70B38                          * 704AD  access handler
        CON(3)  #0E0                             * 704B2  library
        CON(5)  LIB0E0                           * 704B5  header
        CON(5)  L_70B38                          * 704BA  access handler
        CON(3)  #0E8                             * 704BF  library
        CON(5)  LIB0E8                           * 704C2  header
        CON(5)  L_70B38                          * 704C7  access handler
        CON(3)  #0B0                             * 704CC  library
        CON(5)  LIB0B0                           * 704CF  header
        CON(5)  L_70B38                          * 704D4  access handler
        CON(3)  #0B2                             * 704D9  library
        CON(5)  LIB0B2                           * 704DC  header
        CON(5)  L_70B38                          * 704E1  access handler
        CON(3)  #0B1                             * 704E6  library
        CON(5)  LIB0B1                           * 704E9  header
        CON(5)  L_70B38                          * 704EE  access handler
        CON(3)  #0BF                             * 704F3  library
        CON(5)  LIB0BF                           * 704F6  header
        CON(5)  L_70B38                          * 704FB  access handler
        CON(3)  #0BE                             * 70500  library
        CON(5)  LIB0BE                           * 70503  header
        CON(5)  L_70B38                          * 70508  access handler
        CON(3)  #0BD                             * 7050D  library
        CON(5)  LIB0BD                           * 70510  header
        CON(5)  L_70B38                          * 70515  access handler
        CON(3)  #0BC                             * 7051A  library
        CON(5)  LIB0BC                           * 7051D  header
        CON(5)  L_70B38                          * 70522  access handler
        CON(3)  #0BB                             * 70527  library
        CON(5)  LIB0BB                           * 7052A  header
        CON(5)  L_70B38                          * 7052F  access handler
        CON(3)  #0BA                             * 70534  library
        CON(5)  LIB0BA                           * 70537  header
        CON(5)  L_70B38                          * 7053C  access handler
        CON(3)  #0B9                             * 70541  library
        CON(5)  LIB0B9                           * 70544  header
        CON(5)  L_70B38                          * 70549  access handler
        CON(3)  #0E2                             * 7054E  library
        CON(5)  LIB0E2                           * 70551  header
        CON(5)  L_70B38                          * 70556  access handler
        CON(3)  #700                             * 7055B  library
        CON(5)  LIB700                           * 7055E  header
        CON(5)  0                                * 70563  directly visible
        NIBHEX  FFF                              * 70568  ÿ
        RPL

LIB000.message:
        ACPTR MsgTab(0) Reset                    * 7056B

LIB001.message:
        ACPTR MsgTab(1) Reset                    * 7057A

LIB002.message:
        ACPTR MsgTab(2) Reset                    * 70589

LIB003.message:
        ACPTR MsgTab(3) Reset                    * 70598

LIB005.message:
        ACPTR MsgTab(5) Reset                    * 705A7

LIB006.message:
        ACPTR MsgTab(6) Reset                    * 705B6

LIB00A.message:
        ACPTR MsgTab(10) Reset                   * 705C5

LIB00B.message:
        ACPTR MsgTab(11) Reset                   * 705D4

LIB00C.message:
        ACPTR MsgTab(12) Reset                   * 705E3

LIB00D.message:
        ACPTR MsgTab(13) Reset                   * 705F2

BANKMTHDS:
        NIBHEX  F3707                            * 70601  ?.

* Bank switcher methods after BANKMTHDS: stubs of D0=(5) #7F0xx, GOTO #708C2
        CON(5)  L_7074A                          * 70606  entry 0
        CON(5)  L_70755                          * 7060B  entry 1
        CON(5)  L_70760                          * 70610  entry 2
        CON(5)  L_7076B                          * 70615  entry 3
        CON(5)  L_70776                          * 7061A  entry 4
        CON(5)  L_70781                          * 7061F  entry 5
        CON(5)  L_7078C                          * 70624  entry 6
        CON(5)  L_70797                          * 70629  entry 7
        CON(5)  L_707A2                          * 7062E  entry 8
        CON(5)  L_707AD                          * 70633  entry 9
        CON(5)  L_707B8                          * 70638  entry 10
        CON(5)  L_707C3                          * 7063D  entry 11
        CON(5)  L_707CE                          * 70642  entry 12
        CON(5)  L_707D9                          * 70647  entry 13
        CON(5)  L_707E4                          * 7064C  entry 14
        CON(5)  L_707EF                          * 70651  entry 15
        CON(5)  L_707FA                          * 70656  entry 16
        CON(5)  L_70805                          * 7065B  entry 17
        CON(5)  L_70810                          * 70660  entry 18
        CON(5)  L_7081B                          * 70665  entry 19
        CON(5)  L_70826                          * 7066A  entry 20
        CON(5)  L_70831                          * 7066F  entry 21
        CON(5)  L_7083C                          * 70674  entry 22
        CON(5)  L_70847                          * 70679  entry 23
        CON(5)  L_70852                          * 7067E  entry 24
        CON(5)  L_7085D                          * 70683  entry 25
        CON(5)  L_70868                          * 70688  entry 26
        CON(5)  L_70873                          * 7068D  entry 27
        CON(5)  L_7087E                          * 70692  entry 28
        CON(5)  L_70889                          * 70697  entry 29
        CON(5)  L_70894                          * 7069C  entry 30
        ASSEMBLE
L_706A1:
        C=0     A                                * 706A1
        R1=C.F  A                                * 706A3
        GOSUB   SUB_706B7                        * 706A9
        A=DAT0  A                                * 706AD
        D0=D0+  5                                * 706B0
        PC=(A)                                   * 706B3

* refs (2): 706A9 71B1A
SUB_706B7:
        ST=0    10                               * 706B7
        LC(5)   #0000F                           * 706BA
        B=C     A                                * 706C1
        LC(2)   #1A                              * 706C3
        D=C     A                                * 706C7
        D1=(5)  DSKTOP                           * 706C9
        C=DAT1  A                                * 706D0
        D1=(5)  RSKTOP                           * 706D3
        A=DAT1  A                                * 706DA
        C=C-A   A                                * 706DD
        C=C-D   A                                * 706DF
        GOC     L_70726                          * 706E1
        C=B     A                                * 706E4
        GOSBVL  CREATETEMP                       * 706E6
        AD0EX                                    * 706ED
        D0=A                                     * 706F0
        LC(5)   DOEXT1                           * 706F3
        DAT0=C  A                                * 706FA
        D0=D0+  5                                * 706FD
        C=R0.F  A                                * 70700
        DAT0=C  A                                * 70706
        D0=D0+  5                                * 70709
        C=R1.F  A                                * 7070C
        DAT0=C  A                                * 70712
        GOSBVL  GETPTR                           * 70715
        D=D-1   A                                * 7071C
        D1=D1-  5                                * 7071E
        DAT1=A  A                                * 70721
        RTN                                      * 70724
L_70726:
        ?ST=1   10                               * 70726
        GOYES   L_70738                          * 70729
        GOSBVL  GARBAGECOL                       * 7072B  inline data follows
        NIBHEX  85A548                           * 70732  XZ∫
L_70738:
        GOVLNG  GPMEMERR                         * 70738
* Bank-select stubs, reached through computed jumps: D0=(5) #7F040+2n, then GOTO
        NIBHEX  1B040F76B71                      * 7073F  ±@ðg{
L_7074A:
        D0=(5)  #7F042                           * 7074A
        GOTO    L_708C2                          * 70751
L_70755:
        D0=(5)  #7F044                           * 70755
        GOTO    L_708C2                          * 7075C
L_70760:
        D0=(5)  #7F046                           * 70760
        GOTO    L_708C2                          * 70767
L_7076B:
        D0=(5)  #7F048                           * 7076B
        GOTO    L_708C2                          * 70772
L_70776:
        D0=(5)  #7F04A                           * 70776
        GOTO    L_708C2                          * 7077D
L_70781:
        D0=(5)  #7F04C                           * 70781
        GOTO    L_708C2                          * 70788
L_7078C:
        D0=(5)  #7F04E                           * 7078C
        GOTO    L_708C2                          * 70793
L_70797:
        D0=(5)  #7F050                           * 70797
        GOTO    L_708C2                          * 7079E
L_707A2:
        D0=(5)  #7F052                           * 707A2
        GOTO    L_708C2                          * 707A9
L_707AD:
        D0=(5)  #7F054                           * 707AD
        GOTO    L_708C2                          * 707B4
L_707B8:
        D0=(5)  #7F056                           * 707B8
        GOTO    L_708C2                          * 707BF
L_707C3:
        D0=(5)  #7F058                           * 707C3
        GOTO    L_708C2                          * 707CA
L_707CE:
        D0=(5)  #7F05A                           * 707CE
        GOTO    L_708C2                          * 707D5
L_707D9:
        D0=(5)  #7F05C                           * 707D9
        GOTO    L_708C2                          * 707E0
L_707E4:
        D0=(5)  #7F05E                           * 707E4
        GOTO    L_708C2                          * 707EB
L_707EF:
        D0=(5)  #7F060                           * 707EF
        GOTO    L_708C2                          * 707F6
L_707FA:
        D0=(5)  #7F062                           * 707FA
        GOTO    L_708C2                          * 70801
L_70805:
        D0=(5)  #7F064                           * 70805
        GOTO    L_708C2                          * 7080C
L_70810:
        D0=(5)  #7F066                           * 70810
        GOTO    L_708C2                          * 70817
L_7081B:
        D0=(5)  #7F068                           * 7081B
        GOTO    L_708C2                          * 70822
L_70826:
        D0=(5)  #7F06A                           * 70826
        GOTO    L_708C2                          * 7082D
L_70831:
        D0=(5)  #7F06C                           * 70831
        GOTO    L_708C2                          * 70838
L_7083C:
        D0=(5)  #7F06E                           * 7083C
        GOTO    L_708C2                          * 70843
L_70847:
        D0=(5)  #7F070                           * 70847
        GOTO    L_708C2                          * 7084E
L_70852:
        D0=(5)  #7F072                           * 70852
        GOTO    L_708C2                          * 70859
L_7085D:
        D0=(5)  #7F074                           * 7085D
        GOTO    L_708C2                          * 70864
L_70868:
        D0=(5)  #7F076                           * 70868
        GOTO    L_708C2                          * 7086F
L_70873:
        D0=(5)  #7F078                           * 70873
        GOTO    L_708C2                          * 7087A
L_7087E:
        D0=(5)  #7F07A                           * 7087E
        GOTO    L_708C2                          * 70885
L_70889:
        D0=(5)  #7F07C                           * 70889
        GOTO    L_708C2                          * 70890
L_70894:
        D0=(5)  #7F07E                           * 70894
        GOTO    L_708C2                          * 7089B

* refs (2): 70917 70B7E
SUB_7089F:
        D0=(5)  INITEN                           * 7089F
        C=0     B                                * 708A6
        C=DAT0  1                                * 708A9
        P=      1                                * 708AD
        DAT0=C  P                                * 708AF
        D0=(5)  AccessInit                       * 708B3
        P=      0                                * 708BA
        DAT0=C  P                                * 708BC
        RTN                                      * 708C0
L_708C2:
        ?P=     0                                * 708C2
        GOYES   L_70902                          * 708C5
        ?P=     1                                * 708C7
        GOYES   L_70927                          * 708CA
        ?P=     2                                * 708CC
        GOYES   L_708DF                          * 708CF
        ?P=     3                                * 708D1
        GOYES   L_708E3                          * 708D4
        ?P=     4                                * 708D6
        GOYES   L_708E7                          * 708D9
        GOTO    L_70B15                          * 708DB
L_708DF:
        GOTO    L_70972                          * 708DF
L_708E3:
        GOTO    L_709DB                          * 708E3
L_708E7:
        P=      0                                * 708E7
        LC(5)   #7F03C                           * 708E9
        CD0EX                                    * 708F0
        AD0EX                                    * 708F3
        C=C-A   A                                * 708F6
        CSRB.F  A                                * 708F8
        AD0EX                                    * 708FD
        RTN                                      * 70900
L_70902:
        P=      0                                * 70902
        C=DAT0  B                                * 70904
        D0=(5)  #80530                           * 70907
        C=DAT0  1                                * 7090E
        ?C=0    P                                * 70912
        RTNYES                                   * 70915
        GOSUB   SUB_7089F                        * 70917
        LC(5)   #C0000                           * 7091B
        UNCNFG                                   * 70922
        RTN                                      * 70925
L_70927:
        P=      0                                * 70927
        LC(5)   #F0000                           * 70929
        D0=(5)  #80530                           * 70930
        C=DAT0  1                                * 70937
        C=C-1   P                                * 7093B
        RTNC                                     * 7093E
        ?C=0    P                                * 70941
        GOYES   L_7094D                          * 70944
        LC(5)   #C0000                           * 70946
L_7094D:
        CONFIG                                   * 7094D
        LC(5)   #C0000                           * 70950
        CONFIG                                   * 70957
L_7095A:
        D0=(5)  AccessInit                       * 7095A
        C=DAT0  1                                * 70961
        D0=(5)  INITEN                           * 70965
        DAT0=C  1                                * 7096C
        RTN                                      * 70970
L_70972:
        P=      0                                * 70972
        ?C=0    S                                * 70974
        GOYES   L_709AA                          * 70977
        C=R1.F  A                                * 70979
        D0=C                                     * 7097F
        C=R0.F  A                                * 70982
        D1=C                                     * 70988
        C=A     A                                * 7098B
        GOSBVL  MOVEDOWN                         * 7098D
        CD1EX                                    * 70994
        R0=C.F  A                                * 70997
        CD0EX                                    * 7099D
        R1=C.F  A                                * 709A0
        GOTO    L_70927                          * 709A6
L_709AA:
        C=R0.F  A                                * 709AA
        D0=C                                     * 709B0
        C=R1.F  A                                * 709B3
        D1=C                                     * 709B9
        C=A     A                                * 709BC
        GOSBVL  MOVEDOWN                         * 709BE
        CD1EX                                    * 709C5
        R1=C.F  A                                * 709C8
        CD0EX                                    * 709CE
        R0=C.F  A                                * 709D1
        GOTO    L_70927                          * 709D7
L_709DB:
        P=      0                                * 709DB
        ST=0    10                               * 709DD
        CD0EX                                    * 709E0
        R1=C.F  A                                * 709E3
L_709E9:
        C=A     A                                * 709E9
        GOSBVL  CREATETEMP                       * 709EB
        C=B     A                                * 709F2
        D0=C                                     * 709F4
        GOC     L_70A20                          * 709F7
        D0=D0-  6                                * 709FA
        A=R3.F  A                                * 709FD
        AD0EX                                    * 70A03
        GOSUB   L_70902                          * 70A06
        D0=(5)  #8052F                           * 70A0A
        C=DAT0  1                                * 70A11
        ?CBIT=0 1                                * 70A15
        GOYES   L_70A5A                          * 70A1A
        GOTO    L_70A7D                          * 70A1C
L_70A20:
        ?ST=1   10                               * 70A20
        RTNYES                                   * 70A23
        ST=1    10                               * 70A25
        D0=D0-  6                                * 70A28
        C=RSTK                                   * 70A2B
        GOSUB   SUB_71215                        * 70A2D
        CD0EX                                    * 70A31
        GOSUB   SUB_71215                        * 70A34
        C=R1.F  A                                * 70A38
        R1=C                                     * 70A3E
        GOSBVL  GARBAGECOL                       * 70A41  inline data follows
        C=R1                                     * 70A48
        GOSUB   SUB_7121C                        * 70A4B
        A=C     A                                * 70A4F
        GOSUB   SUB_7121C                        * 70A51
        RSTK=C                                   * 70A55
        GONC    L_709E9                          * 70A57
L_70A5A:
        C=R0.F  A                                * 70A5A
        C=C+A   A                                * 70A60
        D0=C                                     * 70A62
        C=A     A                                * 70A65
        GOSBVL  MOVEUP                           * 70A67
L_70A6E:
        AD1EX                                    * 70A6E
        R0=A.F  A                                * 70A71
        GOSUB   L_70927                          * 70A77
        RTNCC                                    * 70A7B
L_70A7D:
        C=R0.F  A                                * 70A7D
        C=C+A   A                                * 70A83
L_70A85:
        D0=C                                     * 70A85
        LC(5)   #80309                           * 70A88
        CD1EX                                    * 70A8F
        R0=C.F  A                                * 70A92
        LC(5)   #00214                           * 70A98
        A=A-C   A                                * 70A9F
        GONC    L_70AA8                          * 70AA1
        C=C+A   A                                * 70AA4
        A=0     A                                * 70AA6
L_70AA8:
        DAT1=A  A                                * 70AA8
        GOSBVL  MOVEUP                           * 70AAB
        A=R0.F  A                                * 70AB2
        AD1EX                                    * 70AB8
        LC(5)   #80309                           * 70ABB
        CAEX    A                                * 70AC2
        C=A-C   A                                * 70AC4
        AD0EX                                    * 70AC6
        R0=A.F  A                                * 70AC9
        A=C     A                                * 70ACF
        LC(5)   #C0000                           * 70AD1
        CONFIG                                   * 70AD8
        LC(5)   #C0000                           * 70ADB
        CONFIG                                   * 70AE2
        C=A     A                                * 70AE5
        GOSBVL  MOVEUP                           * 70AE7
        LC(5)   #C0000                           * 70AEE
        UNCNFG                                   * 70AF5
        D0=(5)  #80309                           * 70AF8
        A=DAT0  A                                * 70AFF
        ?A#0    A                                * 70B02
        GOYES   L_70B0B                          * 70B05
        GOTO    L_70A6E                          * 70B07
L_70B0B:
        C=R0.F  A                                * 70B0B
        GOTO    L_70A85                          * 70B11
L_70B15:
        GOSUB   L_70902                          * 70B15
        C=R0.F  A                                * 70B19
        D0=C                                     * 70B1F
        GOSBVL  SKIPOB                           * 70B22
        AD0EX                                    * 70B29
        C=R0.F  A                                * 70B2C
        A=A-C   A                                * 70B32
        GOTO    L_70927                          * 70B34
L_70B38:
        ?P=     0                                * 70B38
        GOYES   L_70B66                          * 70B3B
        ?P=     1                                * 70B3D
        GOYES   L_70BB7                          * 70B40
        ?P=     2                                * 70B42
        GOYES   L_70B59                          * 70B45
        ?P=     3                                * 70B47
        GOYES   L_70B55                          * 70B4A
        ?P=     4                                * 70B4C
        GOYES   L_70B5D                          * 70B4F
        GOTO    L_70DE9                          * 70B51
L_70B55:
        GOTO    L_70CBE                          * 70B55
L_70B59:
        GOTO    L_70C55                          * 70B59
L_70B5D:
        C=0     A                                * 70B5D
        P=      0                                * 70B5F
        C=C-1   A                                * 70B61
        RTNC                                     * 70B63
L_70B66:
        P=      0                                * 70B66
        D0=(5)  #80535                           * 70B68
        C=DAT0  1                                * 70B6F
        ?C=0    P                                * 70B73
        RTNYES                                   * 70B76
        C=C+1   P                                * 70B78
        RTNC                                     * 70B7B
        GOSUB   SUB_7089F                        * 70B7E
        D0=(5)  #7F000                           * 70B82
        C=DAT0  B                                * 70B89
        D0=(5)  LINECOUNTg                       * 70B8C
        C=DAT0  B                                * 70B93
        CBIT=1  7                                * 70B96
        DAT0=C  B                                * 70B9B
        D0=(5)  LINECOUNT                        * 70B9E
        DAT0=C  B                                * 70BA5
        LC(5)   #C0000                           * 70BA8
        UNCNFG                                   * 70BAF
        UNCNFG                                   * 70BB2
        RTNCC                                    * 70BB5
L_70BB7:
        P=      0                                * 70BB7
        D0=(5)  #80535                           * 70BB9
        C=DAT0  1                                * 70BC0
        ?C=0    P                                * 70BC4
        RTNYES                                   * 70BC7
        C=C+1   P                                * 70BC9
        RTNC                                     * 70BCC
        D0=D0-  5                                * 70BCF
        C=DAT0  1                                * 70BD2
        C=C-1   P                                * 70BD6
        GOC     L_70BFD                          * 70BD9
        C=C-1   P                                * 70BDC
        LC(5)   #F0000                           * 70BDF
        GOC     L_70BF0                          * 70BE6
        LC(5)   #C0000                           * 70BE9
L_70BF0:
        CONFIG                                   * 70BF0
        LC(5)   #C0000                           * 70BF3
        CONFIG                                   * 70BFA
L_70BFD:
        D0=D0+  2                                * 70BFD
        C=DAT0  1                                * 70C00
        C=C-1   P                                * 70C04
        GOC     L_70C2B                          * 70C07
        C=C-1   P                                * 70C0A
        LC(5)   #F0000                           * 70C0D
        GOC     L_70C1E                          * 70C14
        LC(5)   #C0000                           * 70C17
L_70C1E:
        CONFIG                                   * 70C1E
        LC(5)   #C0000                           * 70C21
        CONFIG                                   * 70C28
L_70C2B:
        D0=(5)  LINECOUNTg                       * 70C2B
        C=DAT0  B                                * 70C32
        CBIT=0  7                                * 70C35
        DAT0=C  B                                * 70C3A
        D0=(5)  LINECOUNT                        * 70C3D
        DAT0=C  B                                * 70C44
        D0=(5)  #7F040                           * 70C47
        C=DAT0  B                                * 70C4E
        GOTO    L_7095A                          * 70C51
L_70C55:
        P=      0                                * 70C55
        ?C=0    S                                * 70C57
        GOYES   L_70C8D                          * 70C5A
        C=R1.F  A                                * 70C5C
        D0=C                                     * 70C62
        C=R0.F  A                                * 70C65
        D1=C                                     * 70C6B
        C=A     A                                * 70C6E
        GOSBVL  MOVEDOWN                         * 70C70
        CD1EX                                    * 70C77
        R0=C.F  A                                * 70C7A
        CD0EX                                    * 70C80
        R1=C.F  A                                * 70C83
        GOTO    L_70BB7                          * 70C89
L_70C8D:
        C=R0.F  A                                * 70C8D
        D0=C                                     * 70C93
        C=R1.F  A                                * 70C96
        D1=C                                     * 70C9C
        C=A     A                                * 70C9F
        GOSBVL  MOVEDOWN                         * 70CA1
        CD1EX                                    * 70CA8
        R1=C.F  A                                * 70CAB
        CD0EX                                    * 70CB1
        R0=C.F  A                                * 70CB4
        GOTO    L_70BB7                          * 70CBA
L_70CBE:
        P=      0                                * 70CBE
        ST=0    10                               * 70CC0
L_70CC3:
        C=A     A                                * 70CC3
        GOSBVL  CREATETEMP                       * 70CC5
        C=B     A                                * 70CCC
        D0=C                                     * 70CCE
        GOC     L_70CF4                          * 70CD1
        D0=D0-  6                                * 70CD4
        AD0EX                                    * 70CD7
        GOSUB   L_70B66                          * 70CDA
        D0=(5)  #8052F                           * 70CDE
        C=DAT0  1                                * 70CE5
        ?CBIT=0 1                                * 70CE9
        GOYES   L_70D2E                          * 70CEE
        GOTO    L_70D51                          * 70CF0
L_70CF4:
        ?ST=1   10                               * 70CF4
        RTNYES                                   * 70CF7
        ST=1    10                               * 70CF9
        D0=D0-  6                                * 70CFC
        C=RSTK                                   * 70CFF
        GOSUB   SUB_71215                        * 70D01
        CD0EX                                    * 70D05
        GOSUB   SUB_71215                        * 70D08
        C=R1.F  A                                * 70D0C
        R1=C                                     * 70D12
        GOSBVL  GARBAGECOL                       * 70D15  inline data follows
        C=R1                                     * 70D1C
        GOSUB   SUB_7121C                        * 70D1F
        A=C     A                                * 70D23
        GOSUB   SUB_7121C                        * 70D25
        RSTK=C                                   * 70D29
        GONC    L_70CC3                          * 70D2B
L_70D2E:
        C=R0.F  A                                * 70D2E
        C=C+A   A                                * 70D34
        D0=C                                     * 70D36
        C=A     A                                * 70D39
        GOSBVL  MOVEUP                           * 70D3B
L_70D42:
        AD1EX                                    * 70D42
        R0=A.F  A                                * 70D45
        GOSUB   L_70BB7                          * 70D4B
        RTNCC                                    * 70D4F
L_70D51:
        C=R0.F  A                                * 70D51
        C=C+A   A                                * 70D57
L_70D59:
        D0=C                                     * 70D59
        LC(5)   #80309                           * 70D5C
        CD1EX                                    * 70D63
        R0=C.F  A                                * 70D66
        LC(5)   #00214                           * 70D6C
        A=A-C   A                                * 70D73
        GONC    L_70D7C                          * 70D75
        C=C+A   A                                * 70D78
        A=0     A                                * 70D7A
L_70D7C:
        DAT1=A  A                                * 70D7C
        GOSBVL  MOVEUP                           * 70D7F
        A=R0.F  A                                * 70D86
        AD1EX                                    * 70D8C
        LC(5)   #80309                           * 70D8F
        CAEX    A                                * 70D96
        C=A-C   A                                * 70D98
        AD0EX                                    * 70D9A
        R0=A.F  A                                * 70D9D
        A=C     A                                * 70DA3
        LC(5)   #C0000                           * 70DA5
        CONFIG                                   * 70DAC
        LC(5)   #C0000                           * 70DAF
        CONFIG                                   * 70DB6
        C=A     A                                * 70DB9
        GOSBVL  MOVEUP                           * 70DBB
        LC(5)   #C0000                           * 70DC2
        UNCNFG                                   * 70DC9
        D0=(5)  #80309                           * 70DCC
        A=DAT0  A                                * 70DD3
        ?A=0    A                                * 70DD6
        GOYES   L_70DE5                          * 70DD9
        C=R0.F  A                                * 70DDB
        GOTO    L_70D59                          * 70DE1
L_70DE5:
        GOTO    L_70D42                          * 70DE5
L_70DE9:
        GOSUB   L_70B66                          * 70DE9
        C=R0.F  A                                * 70DED
        D0=C                                     * 70DF3
        GOSBVL  SKIPOB                           * 70DF6
        AD0EX                                    * 70DFD
        C=R0.F  A                                * 70E00
        A=A-C   A                                * 70E06
        GOTO    L_70BB7                          * 70E08
L_70E0C:
        AD1EX                                    * 70E0C
        C=DAT1  A                                * 70E0F
        D1=(5)  DOROMP                           * 70E12
        AD1EX                                    * 70E19
        ?C=A    A                                * 70E1C
        GOYES   L_70E86                          * 70E1F
        LC(5)   TEMPTOP                          * 70E21
        CD1EX                                    * 70E28
        A=DAT1  A                                * 70E2B
        CD1EX                                    * 70E2E
        C=R3.F  A                                * 70E31
        ?C>=A   A                                * 70E37
        GOYES   L_70E57                          * 70E3A
        LC(5)   TEMPOB                           * 70E3C
        CD1EX                                    * 70E43
        A=DAT1  A                                * 70E46
        CD1EX                                    * 70E49
        C=R3.F  A                                * 70E4C
        ?C>=A   A                                * 70E52
        GOYES   L_70E65                          * 70E55
L_70E57:
        GOSBVL  SUB_077B2                        * 70E57
        GOVLNG  L_07698                          * 70E5E
L_70E65:
        C=C-CON A,11                             * 70E65
        R3=C.F  A                                * 70E6B
        CD1EX                                    * 70E71
        A=DAT1  A                                * 70E74
        CD1EX                                    * 70E77
        LC(5)   DOROMP                           * 70E7A
        ?C#A    A                                * 70E81
        GOYES   L_70ECF                          * 70E84
L_70E86:
        GOSBVL  SAVPTR                           * 70E86
        A=R3.F  A                                * 70E8D
        ?ST=0   11                               * 70E93
        GOYES   L_70EA6                          * 70E96
        GOSBVL  SUB_07ED8                        * 70E98
        ST=1    11                               * 70E9F
        GOTO    L_70EB0                          * 70EA2
L_70EA6:
        GOSBVL  SUB_07ED8                        * 70EA6
        ST=0    11                               * 70EAD
L_70EB0:
        GOC     L_70EC8                          * 70EB0
        ?ST=1   1                                * 70EB3
        GOYES   L_70EDE                          * 70EB6
L_70EB8:
        R3=A.F  A                                * 70EB8
        GOSBVL  GETPTR                           * 70EBE
        GONC    L_70E57                          * 70EC5
L_70EC8:
        GOSBVL  GETPTR                           * 70EC8
L_70ECF:
        D1=D1+  5                                * 70ECF
        D=D+1   A                                * 70ED2
        A=DAT0  A                                * 70ED4
        D0=D0+  5                                * 70ED7
        PC=(A)                                   * 70EDA
L_70EDE:
        D0=(5)  IRAMBUFF                         * 70EDE
        D0=D0+  5                                * 70EE5
        A=DAT0  10                               * 70EE8
        D0=(5)  #809A2                           * 70EEC
        C=0     A                                * 70EF3
        C=DAT0  4                                * 70EF5
        C=0     P                                * 70EF9
        AD0EX                                    * 70EFC
        A=A+C   A                                * 70EFF
        AD0EX                                    * 70F01
        D1=(5)  VDISP2                           * 70F04
        C=DAT1  A                                * 70F0B
        D1=C                                     * 70F0E
        D0=D0-  8                                * 70F11
        P=      9                                * 70F14
        R3=A.F  WP                               * 70F16
        GONC    L_70F2E                          * 70F1C
L_70F1F:
        AD0EX                                    * 70F1F
        CD1EX                                    * 70F22
        C=DAT0  10                               * 70F25
        ?C=A    WP                               * 70F29
        GOYES   L_70F75                          * 70F2C
L_70F2E:
        D0=D0+  15                               * 70F2E
        AD0EX                                    * 70F31
        CD1EX                                    * 70F34
        ?C>A    A                                * 70F37
        GOYES   L_70F1F                          * 70F3A
        D0=D0-  5                                * 70F3C
        P=      0                                * 70F3F
        LC(5)   #0000F                           * 70F41
        GOSBVL  SUB_02541                        * 70F48
        AD0EX                                    * 70F4F
        GOSBVL  MOVERSU                          * 70F52
        GOC     L_70F81                          * 70F59
        A=B     A                                * 70F5C
        D0=A                                     * 70F5E
        LC(5)   DOEXT1                           * 70F61
        DAT0=C  A                                * 70F68
        D0=D0+  5                                * 70F6B
        C=R3                                     * 70F6E
        DAT0=C  10                               * 70F71
L_70F75:
        P=      0                                * 70F75
        D0=D0-  5                                * 70F77
        AD0EX                                    * 70F7A
        GOTO    L_70EB8                          * 70F7D
L_70F81:
        GOTO    L_70EC8                          * 70F81
L_70F85:
        AR3EX                                    * 70F85
        GOTO    L_70FA9                          * 70F88
L_70F8C:
        D0=D0+  11                               * 70F8C
        AD0EX                                    * 70F8F
        GOSBVL  GETPTR                           * 70F92
        DAT1=A  A                                * 70F99
        LC(5)   TRUE                             * 70F9C
        A=C     A                                * 70FA3
        PC=(A)                                   * 70FA5
L_70FA9:
        AR3EX                                    * 70FA9
        R0=A.F  A                                * 70FAC
        D0=(5)  #800FF                           * 70FB2
        C=DAT0  A                                * 70FB9
        R4=C.F  A                                * 70FBC
        P=      5                                * 70FC2
        GOSUB   SUB_71603                        * 70FC4
        C=0     A                                * 70FC8
        LC(1)   #B                               * 70FCA
        A=A+C   A                                * 70FCD
        AR0EX.F A                                * 70FCF
        A=A-C   A                                * 70FD5
        AR0EX.F A                                * 70FD7
        P=      3                                * 70FDD
        C=R4.F  A                                * 70FDF
        GOSUB   SUB_71603                        * 70FE5
        GOC     L_70FFF                          * 70FE9
        C=R0.F  A                                * 70FEC
        D0=C                                     * 70FF2
        A=R3                                     * 70FF5
        DAT0=A  11                               * 70FF8
        GONC    L_70F8C                          * 70FFC
L_70FFF:
        GOSBVL  GETPTR                           * 70FFF
        GOVLNG  DOMEMERR                         * 71006
L_7100D:
        GOVLNG  L_0769E                          * 7100D
L_71014:
        GOSBVL  SUB_0843A                        * 71014
        GOC     L_7100D                          * 7101B
        CD0EX                                    * 7101E
        R3=C                                     * 71021
        C=DAT0  A                                * 71024
        ?C#0    A                                * 71027
        GOYES   L_71087                          * 7102A
        D0=(5)  IRAMBUFF                         * 7102C
        DAT0=A  A                                * 71033
        D0=D0+  3                                * 71036
        C=R3.F  A                                * 71039
        CD0EX                                    * 7103F
        D0=D0+  3                                * 71042
        A=DAT0  A                                * 71045
        CD0EX                                    * 71048
        ?A=0    A                                * 7104B
        GOYES   L_71052                          * 7104E
        A=A+C   A                                * 71050
L_71052:
        DAT0=A  A                                * 71052
        D0=D0+  5                                * 71055
        CD0EX                                    * 71058
        D0=D0+  5                                * 7105B
        A=DAT0  A                                * 7105E
        CD0EX                                    * 71061
        ?A=0    A                                * 71064
        GOYES   L_7106B                          * 71067
        A=A+C   A                                * 71069
L_7106B:
        DAT0=A  A                                * 7106B
L_7106E:
        D0=D0-  8                                * 7106E
        A=DAT0  A                                * 71071
        CD0EX                                    * 71074
        R3=C.F  A                                * 71077
        D1=D1+  8                                * 7107D
        GOVLNG  L_07719                          * 71080
L_71087:
        RSTK=C                                   * 71087
        GOSUB   SUB_71603                        * 71089
        C=R3.F  A                                * 7108D
        D0=C                                     * 71093
        A=DAT0  13                               * 71096
        P=      1                                * 7109A
        C=RSTK                                   * 7109C
        RSTK=C                                   * 7109E
        GOSUB   SUB_71603                        * 710A0
        D0=(5)  IRAMBUFF                         * 710A4
        DAT0=A  13                               * 710AB
        D0=D0+  3                                * 710AF
        C=0     S                                * 710B2
        C=R3.F  A                                * 710B5
        C=C+CON A,3                              * 710BB
        A=DAT0  A                                * 710C1
        ?A=0    A                                * 710C4
        GOYES   L_710D1                          * 710C7
        A=A+C   A                                * 710C9
        DAT0=A  A                                * 710CB
        C=C+1   S                                * 710CE
L_710D1:
        D0=D0+  5                                * 710D1
        C=C+CON A,5                              * 710D4
        A=DAT0  A                                * 710DA
        ?A=0    A                                * 710DD
        GOYES   L_710EA                          * 710E0
        A=A+C   A                                * 710E2
        DAT0=A  A                                * 710E4
        C=C+1   S                                * 710E7
L_710EA:
        C=RSTK                                   * 710EA
        ?C#0    S                                * 710EC
        GOYES   L_710F5                          * 710EF
        GOTO    L_7106E                          * 710F1
L_710F5:
        D0=D0+  5                                * 710F5
        DAT0=C  A                                * 710F8
        D0=D0+  5                                * 710FB
        C=B     A                                * 710FE
        DAT0=C  A                                * 71100
        D0=D0+  5                                * 71103
        CD1EX                                    * 71106
        DAT0=C  A                                * 71109
        D0=D0-  15                               * 7110C
        A=DAT0  10                               * 7110F
        ?A=0    A                                * 71113
        GOYES   L_71130                          * 71116
        GOSUB   SUB_7116E                        * 71118
        GOC     L_71167                          * 7111C
        LC(5)   #800FD                           * 7111F
        CD0EX                                    * 71126
        DAT0=C  A                                * 71129
        A=DAT0  10                               * 7112C
L_71130:
        D0=D0-  5                                * 71130
        A=DAT0  A                                * 71133
        ?A=0    A                                * 71136
        GOYES   L_7114F                          * 71139
        GOSUB   SUB_7116E                        * 7113B
        GOC     L_71167                          * 7113F
        LC(5)   #800F8                           * 71142
        CD0EX                                    * 71149
        DAT0=C  A                                * 7114C
L_7114F:
        D0=D0+  15                               * 7114F
        C=DAT0  A                                * 71152
        B=C     A                                * 71155
        D0=D0+  5                                * 71157
        C=DAT0  A                                * 7115A
        D1=C                                     * 7115D
        D0=D0-  15                               * 71160
        GOTO    L_7106E                          * 71163
L_71167:
        GOVLNG  GPMEMERR                         * 71167

* refs (2): 71118 7113B
SUB_7116E:
        D0=(5)  #809A2                           * 7116E
        C=0     A                                * 71175
        C=DAT0  4                                * 71177
        C=0     P                                * 7117B
        AD0EX                                    * 7117E
        A=A+C   A                                * 71181
        AD0EX                                    * 71183
        D1=(5)  VDISP2                           * 71186
        C=DAT1  A                                * 7118D
        D1=C                                     * 71190
        D0=D0-  6                                * 71193
        P=      9                                * 71196
        R3=A.F  WP                               * 71198
        GONC    L_711B0                          * 7119E
L_711A1:
        AD0EX                                    * 711A1
        CD1EX                                    * 711A4
        C=DAT0  10                               * 711A7
        ?C=A    WP                               * 711AB
        GOYES   L_7120B                          * 711AE
L_711B0:
        D0=D0+  15                               * 711B0
        AD0EX                                    * 711B3
        CD1EX                                    * 711B6
        ?C>A    A                                * 711B9
        GOYES   L_711A1                          * 711BC
        AD0EX                                    * 711BE
        D0=D0-  5                                * 711C1
        P=      0                                * 711C4
        D1=(5)  #00010                           * 711C6
        AD0EX                                    * 711CD
        ?C=A    A                                * 711D0
        GOYES   L_711D8                          * 711D3
        D1=D1-  2                                * 711D5
L_711D8:
        D0=A                                     * 711D8
        CD1EX                                    * 711DB
        GOSBVL  SUB_02541                        * 711DE
        AD0EX                                    * 711E5
        GOSBVL  MOVERSU                          * 711E8
        RTNC                                     * 711EF
        A=B     A                                * 711F2
        D0=A                                     * 711F4
        LC(5)   DOEXT1                           * 711F7
        DAT0=C  A                                * 711FE
        D0=D0+  5                                * 71201
        C=R3                                     * 71204
        DAT0=C  10                               * 71207
L_7120B:
        P=      0                                * 7120B
        D0=D0-  5                                * 7120D
        RTNCC                                    * 71210
        NIBHEX  000                              * 71212  .

* refs (5): 70A2D 70A34 70D01 70D08 71281
SUB_71215:
        GOVLNG  CSLW5                            * 71215

* refs (4): 70A4B 70A51 70D1F 70D25
SUB_7121C:
        GOVLNG  CSRW5                            * 7121C
L_71223:
        GOSUB   SUB_7122B                        * 71223
        GOTO    L_71281                          * 71227

* refs (2): 71223 712AE
SUB_7122B:
        D1=C                                     * 7122B
        C=DAT1  A                                * 7122E
        ?C#0    A                                * 71231
        GOYES   L_7124D                          * 71234
        GOSUB   SUB_7127A                        * 71236
        D0=D0-  5                                * 7123A
        A=DAT0  A                                * 7123D
        D1=A                                     * 71240
        D0=D0+  5                                * 71243
        AD0EX                                    * 71246
        C=0     A                                * 71249
        RTN                                      * 7124B
L_7124D:
        AD0EX                                    * 7124D
        RSTK=C                                   * 71250
        GOSUB   SUB_71603                        * 71252
        D0=A                                     * 71256
        GOSUB   SUB_7127A                        * 71259
        D0=D0-  5                                * 7125D
        A=DAT0  A                                * 71260
        D1=A                                     * 71263
        D0=D0+  5                                * 71266
        AD0EX                                    * 71269
        C=RSTK                                   * 7126C
        RSTK=C                                   * 7126E
        P=      1                                * 71270
        GOSUB   SUB_71603                        * 71272
        C=RSTK                                   * 71276
        RTN                                      * 71278

* refs (2): 71236 71259
SUB_7127A:
        GOVLNG  SUB_0841E                        * 7127A
L_71281:
        GOSUB   SUB_71215                        * 71281
        C=A     A                                * 71285
        A=C     W                                * 71287
        GOSBVL  GETPTR                           * 7128A
        C=DAT1  A                                * 71291
        CD1EX                                    * 71294
        D1=D1+  5                                * 71297
        DAT1=A  10                               * 7129A
        D1=C                                     * 7129E
        LC(5)   TRUE                             * 712A1
        A=C     A                                * 712A8
        PC=(A)                                   * 712AA
L_712AE:
        GOSUB   SUB_7122B                        * 712AE
        AD1EX                                    * 712B2
        LC(5)   #00005                           * 712B5
        A=A-C   A                                * 712BC
        GOVLNG  L_07FBD                          * 712BE
L_712C5:
        CD0EX                                    * 712C5
        A=C     A                                * 712C8
        C=DAT0  A                                * 712CA
        ?C=0    A                                * 712CD
        GOYES   L_71317                          * 712D0
        RSTK=C                                   * 712D2
        GOSUB   SUB_71603                        * 712D4
        D0=A                                     * 712D8
        B=A     A                                * 712DB
        GOSBVL  SUB_0841E                        * 712DD
        CD0EX                                    * 712E4
        A=B     A                                * 712E7
        A=A-C   A                                * 712E9
        R0=C.F  A                                * 712EB
L_712F1:
        LC(5)   IRAMBUFF                         * 712F1
        R1=C.F  A                                * 712F8
        C=RSTK                                   * 712FE
        C=0     S                                * 71300
        P=      2                                * 71303
        GOSUB   SUB_71603                        * 71305
        D0=(5)  IRAMBUFF                         * 71309
L_71310:
        GOVLNG  L_081B4                          * 71310
L_71317:
        D0=A                                     * 71317
        GOSBVL  SUB_0841E                        * 7131A
        GONC    L_71310                          * 71321
L_71324:
        C=0     A                                * 71324
        R0=C.F  A                                * 71326
        C=DAT1  A                                * 7132C
        CD1EX                                    * 7132F
        RSTK=C                                   * 71332
        A=DAT1  A                                * 71334
        LC(5)   DOEXT1                           * 71337
        A=A-C   A                                * 7133E
        C=RSTK                                   * 71340
        CD1EX                                    * 71342
        CAEX    A                                * 71345
        ?C#0    A                                * 71347
        GOYES   L_71357                          * 7134A
        GOSBVL  SUB_702A2                        * 7134C
        GOTO    L_7135C                          * 71353
L_71357:
        D1=D1+  5                                * 71357
        D=D+1   A                                * 7135A
L_7135C:
        R2=A.F  A                                * 7135C
        A=R0.F  A                                * 71362
        R3=A.F  A                                * 71368
        GOSBVL  SUB_702A2                        * 7136E
        R0=A.F  A                                * 71375
        GOSBVL  POP#                             * 7137B
        GOSBVL  SAVPTR                           * 71382
        ST=0    1                                * 71389
        C=R3.F  A                                * 7138C
        ?C=0    A                                * 71392
        GOYES   L_7139E                          * 71395
        ST=1    1                                * 71397
        GOSUB   SUB_71603                        * 7139A
L_7139E:
        C=R0.F  A                                * 7139E
        C=C+A   A                                * 713A4
        C=C-1   A                                * 713A6
        B=C     A                                * 713A8
        D0=C                                     * 713AA
        C=DAT0  S                                * 713AD
        R3=C.F  S                                * 713B1
        A=R2.F  A                                * 713B7
        D0=A                                     * 713BD
        GOSBVL  SKIPOB                           * 713C0
        AD0EX                                    * 713C7
        R1=A.F  A                                * 713CA
        ST=0    1                                * 713D0
        C=R3.F  A                                * 713D3
        ?C=0    A                                * 713D9
        GOYES   L_713E7                          * 713DC
        ST=1    1                                * 713DE
        P=      1                                * 713E1
        GOSUB   SUB_71603                        * 713E3
L_713E7:
        C=R2.F  A                                * 713E7
        C=C-A   A                                * 713ED
        R0=C.F  A                                * 713EF
        A=R3.F  A                                * 713F5
        P=      9                                * 713FB
        ASL     WP                               * 713FD
        ASL     WP                               * 71400
        ASL     WP                               * 71403
        ASL     WP                               * 71406
        ASL     WP                               * 71409
        P=      0                                * 7140C
        A=R1.F  A                                * 7140E
        GOVLNG  L_0B240                          * 71414
L_7141B:
        D=C     A                                * 7141B
        P=      9                                * 7141D
        C=A     WP                               * 7141F
        C=0     A                                * 71422
        ?C#0    WP                               * 71424
        GOYES   L_714A1                          * 71427
        D0=(5)  PORT0EOS                         * 71429
        GOSUB   SUB_714EA                        * 71430
        D0=D0+  5                                * 71434
        GOSUB   SUB_714EA                        * 71437
L_7143B:
        D0=(5)  ROMPTAB                          * 7143B
        C=0     A                                * 71442
        C=DAT0  X                                * 71444
        D1=C                                     * 71448
        D1=D1-  1                                * 7144B
        GOC     L_71468                          * 7144E
        D0=D0-  10                               * 71451
L_71454:
        D0=D0+  16                               * 71454
        C=DAT0  10                               * 71457
        GOSUB   SUB_714EA                        * 7145B
        D1=D1-  1                                * 7145F
        GONC    L_71454                          * 71462
        D0=D0+  10                               * 71465
L_71468:
        D1=(5)  VDISP2                           * 71468
        C=DAT1  A                                * 7146F
        D1=C                                     * 71472
        D0=D0-  7                                * 71475
        GONC    L_71489                          * 71478
L_7147B:
        AD1EX                                    * 7147B
        CD0EX                                    * 7147E
        C=DAT0  10                               * 71481
        GOSUB   SUB_714EA                        * 71485
L_71489:
        D0=D0+  15                               * 71489
        AD1EX                                    * 7148C
        CD0EX                                    * 7148F
        ?C<A    A                                * 71492
        GOYES   L_7147B                          * 71495
        AD1EX                                    * 71497
        CD0EX                                    * 7149A
        P=      0                                * 7149D
        RTN                                      * 7149F
L_714A1:
        CSR     WP                               * 714A1
        CSR     WP                               * 714A4
        CSR     WP                               * 714A7
        CSR     WP                               * 714AA
        CSR     WP                               * 714AD
        P=      4                                * 714B0
        GOSUB   SUB_71603                        * 714B2
        P=      9                                * 714B6
        C=C+1   A                                * 714B8
        GONC    L_714C1                          * 714BA
        GOTO    L_7143B                          * 714BD
L_714C1:
        D0=C                                     * 714C1
        C=C+C   A                                * 714C4
        C=C+C   A                                * 714C6
        AD0EX                                    * 714C8
        C=C+A   A                                * 714CB
        AD0EX                                    * 714CD
        D0=(5)  #80531                           * 714D0
        AD0EX                                    * 714D7
        A=A+C   A                                * 714DA
        AD0EX                                    * 714DC
        C=A     WP                               * 714DF
        GOSUB   SUB_714EA                        * 714E2
        GOTO    L_7143B                          * 714E6

* refs (7): 71430 71437 7145B 71485 714E2 7151D ...
SUB_714EA:
        GOVLNG  L_0B2DF                          * 714EA
L_714F1:
        D=C     A                                * 714F1
        D0=(5)  USEROB                           * 714F3
        C=DAT0  A                                * 714FA
        D0=C                                     * 714FD
        D0=D0+  5                                * 71500
        C=0     M                                * 71503
        C=0     A                                * 71506
        C=DAT0  X                                * 71508
        D1=C                                     * 7150C
        D1=D1-  1                                * 7150F
        RTNC                                     * 71512
        D0=D0-  2                                * 71515
        P=      9                                * 71518
L_7151A:
        D0=D0+  8                                * 7151A
        GOSUB   SUB_714EA                        * 7151D
        D0=D0+  5                                * 71521
        GOSUB   SUB_714EA                        * 71524
        D1=D1-  1                                * 71528
        GONC    L_7151A                          * 7152B
        P=      0                                * 7152E
        RTN                                      * 71530
L_71532:
        D0=D0-  5                                * 71532
        AD0EX                                    * 71535
        D0=A                                     * 71538
        D0=D0+  15                               * 7153B
        D=D-1   A                                * 7153E
        GOC     L_71553                          * 71540
        D1=D1-  5                                * 71543
        DAT1=A  A                                * 71546
        A=DAT0  A                                * 71549
        D0=D0+  5                                * 7154C
        PC=(A)                                   * 7154F
L_71553:
        GOVLNG  L_02D52                          * 71553
L_7155A:
        D0=D0+  5                                * 7155A
        GOVLNG  L_0308E                          * 7155D
L_71564:
        D0=A                                     * 71564
        C=DAT0  A                                * 71567
        D0=(5)  DOEXT1                           * 7156A
        AD0EX                                    * 71571
        ?C=A    A                                * 71574
        GOYES   L_71583                          * 71577
        AD0EX                                    * 71579
        GOVLNG  L_08060                          * 7157C
L_71583:
        AD0EX                                    * 71583
        GOSBVL  GETPTR                           * 71586
        DAT1=A  A                                * 7158D
        LC(5)   OBJ_7159D                        * 71590
        A=C     A                                * 71597
        PC=(A)                                   * 71599
        RPL

* refs (1): 71590
OBJ_7159D:
        :: TOTEMPOB TRUE ;                       * 7159D

* refs (7): 09307 27061 2707F 71650 721AB 8552D ...
?ACCPTR>:
        CON(5)  (*)+5                            * 715B1  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 715B6
        CD1EX                                    * 715B9
        A=DAT1  A                                * 715BC
        D1=C                                     * 715BF
        LC(5)   DOEXT1                           * 715C2
        ?C=A    A                                * 715C9
        GOYES   L_715D8                          * 715CC
        A=DAT0  A                                * 715CE
        D0=D0+  5                                * 715D1
        PC=(A)                                   * 715D4
L_715D8:
        GOSBVL  SAVPTR                           * 715D8
        C=DAT1  A                                * 715DF
        CD1EX                                    * 715E2
        D1=D1+  10                               * 715E5
        A=DAT1  A                                * 715E8
        D1=D1-  5                                * 715EB
        ?A#0    A                                * 715EE
        GOYES   L_71607                          * 715F1
        A=DAT1  A                                * 715F3
        D1=C                                     * 715F6
        DAT1=A  A                                * 715F9
        GOVLNG  GETPTRLOOP                       * 715FC

* refs (31): 70FC4 70FE5 71089 710A0 71252 71272 ...
SUB_71603:
        RSTK=C                                   * 71603
        RTN                                      * 71605
L_71607:
        C=A     A                                * 71607
        A=DAT1  A                                * 71609
        R0=A.F  A                                * 7160C
        RSTK=C                                   * 71612
        P=      5                                * 71614
        GOSUB   SUB_71603                        * 71616
        C=RSTK                                   * 7161A
        P=      3                                * 7161C
        GOSUB   SUB_71603                        * 7161E
        GONC    L_7162C                          * 71622
        GOVLNG  GPMEMERR                         * 71625
L_7162C:
        GOSBVL  GETPTR                           * 7162C
        A=R0.F  A                                * 71633
        DAT1=A  A                                * 71639
        A=DAT0  A                                * 7163C
        D0=D0+  5                                * 7163F
        PC=(A)                                   * 71642
        RPL

* refs (1): 0222D
OBJ_71646:
        :: ERRSET ?ACCPTR> ERRTRAP               * 71646
          :: DROP COLASKIP ; EVAL ;              * 7165A
        ASSEMBLE
L_71678:
        D0=D0+  5                                * 71678
        A=DAT0  A                                * 7167B
        D0=A                                     * 7167E
        GOTO    L_716B0                          * 71681
L_71685:
        C=0     A                                * 71685
        R0=C.F  A                                * 71687
        C=DAT1  A                                * 7168D
        CD0EX                                    * 71690
        A=DAT0  A                                * 71693
        RSTK=C                                   * 71696
        LC(5)   DOBINT                           * 71698
        ?C=A    A                                * 7169F
        GOYES   L_71678                          * 716A2
        LC(5)   DOEXT1                           * 716A4
        ?C=A    A                                * 716AB
        GOYES   L_716B0                          * 716AE
L_716B0:
        C=RSTK                                   * 716B0
        CD0EX                                    * 716B2
        GONC    L_716C8                          * 716B5
L_716B8:
        GOSBVL  SUB_702A2                        * 716B8
        R1=A.F  A                                * 716BF
        GONC    L_716D3                          * 716C5
L_716C8:
        R1=C.F  A                                * 716C8
        D1=D1+  5                                * 716CE
        D=D+1   A                                * 716D1
L_716D3:
        GOSBVL  SAVPTR                           * 716D3
        GOSBVL  POP#                             * 716DA
        AR0EX.F A                                * 716E1
        R3=A.F  A                                * 716E7
        ST=0    4                                * 716ED
        ?A=0    A                                * 716F0
        GOYES   L_716FE                          * 716F3
        ST=1    4                                * 716F5
        C=A     A                                * 716F8
        GOSUB   SUB_71603                        * 716FA
L_716FE:
        GOVLNG  L_0C50F                          * 716FE
L_71705:
        A=DAT1  A                                * 71705
        GOSBVL  SAVPTR                           * 71708
        GOSBVL  SUB_07ED8                        * 7170F
        GONC    L_71736                          * 71716
        GOSBVL  GETPTR                           * 71719
        D1=D1+  10                               * 71720
        D=D+CON A,2                              * 71723
        LC(5)   FALSE                            * 71729
        A=C     A                                * 71730
        PC=(A)                                   * 71732
L_71736:
        C=0     A                                * 71736
        R0=C.F  A                                * 71738
        GOSBVL  GETPTR                           * 7173E
        C=A     A                                * 71745
        ?ST=1   1                                * 71747
        GOYES   L_71750                          * 7174A
        GOTO    L_716C8                          * 7174C
L_71750:
        LC(5)   IRAMBUFF                         * 71750
        DAT1=C  A                                * 71757
        GOTO    L_716B8                          * 7175A
L_7175E:
        A=DAT1  A                                * 7175E
        D1=D1+  5                                * 71761
        D=D+1   A                                * 71764
        GOSBVL  SAVPTR                           * 71766
        C=0     A                                * 7176D
        R2=C.F  A                                * 7176F
        D0=A                                     * 71775
        A=DAT0  A                                * 71778
        LC(5)   DOEXT1                           * 7177B
        ?C#A    A                                * 71782
        GOYES   L_717A5                          * 71785
        D0=D0+  5                                * 71787
        A=DAT0  A                                * 7178A
        D0=D0+  5                                * 7178D
        C=DAT0  A                                * 71790
        R2=C.F  A                                * 71793
        ?C=0    A                                * 71799
        GOYES   L_717A8                          * 7179C
        GOSUB   SUB_71603                        * 7179E
        D0=A                                     * 717A2
L_717A5:
        AD0EX                                    * 717A5
L_717A8:
        D0=A                                     * 717A8
        B=A     A                                * 717AB
        GOVLNG  L_3F51E                          * 717AD
L_717B4:
        C=DAT1  A                                * 717B4
        CD1EX                                    * 717B7
        RSTK=C                                   * 717BA
        A=DAT1  A                                * 717BC
        D1=D1+  10                               * 717BF
        LC(5)   DOEXT1                           * 717C2
        ?C#A    A                                * 717C9
        GOYES   L_717E5                          * 717CC
        C=DAT1  A                                * 717CE
        ?C#0    A                                * 717D1
        GOYES   L_71818                          * 717D4
        D1=D1-  5                                * 717D6
        C=DAT1  A                                * 717D9
        D1=C                                     * 717DC
        A=DAT1  A                                * 717DF
        D1=D1+  10                               * 717E2
L_717E5:
        LC(5)   DOLIB                            * 717E5
        ?C#A    A                                * 717EC
        GOYES   L_71811                          * 717EF
        A=0     A                                * 717F1
        A=DAT1  B                                * 717F3
        D1=D1+  2                                * 717F6
        ?A=0    B                                * 717F9
        GOYES   L_7180A                          * 717FC
        A=A+1   A                                * 717FE
        A=A+A   A                                * 71800
        CD1EX                                    * 71802
        C=C+A   A                                * 71805
        D1=C                                     * 71807
L_7180A:
        GOVLNG  L_08EAD                          * 7180A
L_71811:
        GOVLNG  L_08EFB                          * 71811
L_71818:
        R3=C.F  A                                * 71818
        D1=D1-  5                                * 7181E
        A=DAT1  A                                * 71821
        C=RSTK                                   * 71824
        RSTK=C                                   * 71826
        D1=C                                     * 71828
        GOSBVL  SAVPTR                           * 7182B
        C=R3.F  A                                * 71832
        GOSUB   SUB_71603                        * 71838
        GOVLNG  L_08E5B                          * 7183C
L_71843:
        A=C     A                                * 71843
        LC(5)   #80104                           * 71845
        R1=C.F  A                                * 7184C
        CD1EX                                    * 71852
        R0=C.F  A                                * 71855
        P=      2                                * 7185B
        C=0     S                                * 7185D
        C=R3.F  A                                * 71860
        GOSUB   SUB_71603                        * 71866
        GOSBVL  GETPTR                           * 7186A
        D1=(5)  #80104                           * 71871
        GOTO    L_71811                          * 71878
L_7187C:
        GOSBVL  POP2#                            * 7187C
        R4=C.F  A                                * 71883
        R3=A.F  A                                * 71889
        GOSBVL  SUB_702A2                        * 7188F
        C=R0.F  A                                * 71896
        R2=C.F  A                                * 7189C
        D1=D1+  10                               * 718A2
        D=D+1   A                                * 718A5
        D=D+1   A                                * 718A7
        GOSBVL  SAVPTR                           * 718A9
        D1=D1-  10                               * 718B0
        C=DAT1  A                                * 718B3
        D0=C                                     * 718B6
        D1=A                                     * 718B9
        A=DAT0  A                                * 718BC
        LC(5)   DOLIB                            * 718BF
        ?C=A    A                                * 718C6
        GOYES   L_718D7                          * 718C9
        LC(5)   DOBAK                            * 718CB
        ?C#A    A                                * 718D2
        GOYES   L_718DE                          * 718D5
L_718D7:
        GOVLNG  L_090C3                          * 718D7
L_718DE:
        GOVLNG  L_09110                          * 718DE

* refs (2): 090CF 0920C
SUB_718E5:
        A=R2.F  A                                * 718E5
        ?A#0    A                                * 718EB
        GOYES   L_718F7                          * 718EE
        GOVLNG  MOVEDOWN                         * 718F0
L_718F7:
        AD1EX                                    * 718F7
        R0=A.F  A                                * 718FA
L_71900:
        D1=(5)  L_0020F                          * 71900
        AD1EX                                    * 71907
        CAEX    A                                * 7190A
        A=A-C   A                                * 7190C
        GONC    L_71917                          * 7190E
        A=A+C   A                                * 71911
        C=0     A                                * 71913
        CAEX    A                                * 71915
L_71917:
        RSTK=C                                   * 71917
        D1=(5)  IRAMBUFF                         * 71919
        DAT1=A  A                                * 71920
        D1=D1+  10                               * 71923
        GOSBVL  MOVEDOWN                         * 71926
        D1=(5)  #800FA                           * 7192D
        AD0EX                                    * 71934
        DAT1=A  A                                * 71937
        D1=D1+  5                                * 7193A
        AD1EX                                    * 7193D
        R1=A.F  A                                * 71940
        C=RSTK                                   * 71946
        A=C     A                                * 71948
        C=R2.F  A                                * 7194A
        GOSUB   SUB_71603                        * 71950
        P=      2                                * 71954
        C=0     S                                * 71956
        C=C+1   S                                * 71959
        C=R2.F  A                                * 7195C
        GOSUB   SUB_71603                        * 71962
        D1=(5)  IRAMBUFF                         * 71966
        C=DAT1  A                                * 7196D
        D1=D1+  5                                * 71970
        A=DAT1  A                                * 71973
        D0=A                                     * 71976
        ?C#0    A                                * 71979
        GOYES   L_71900                          * 7197C
        C=R0.F  A                                * 7197E
        D1=C                                     * 71984
        RTNCC                                    * 71987
L_71989:
        GOSBVL  SAVPTR                           * 71989
        C=0     A                                * 71990
        R1=C.F  A                                * 71992
        A=DAT1  A                                * 71998
        R0=A.F  A                                * 7199B
        D0=A                                     * 719A1
        A=DAT0  A                                * 719A4
        LC(5)   DOEXT1                           * 719A7
        ?C#A    A                                * 719AE
        GOYES   L_719E0                          * 719B1
        D0=D0+  5                                * 719B3
        A=DAT0  A                                * 719B6
        R0=A.F  A                                * 719B9
        D0=D0+  5                                * 719BF
        C=DAT0  A                                * 719C2
        R1=C.F  A                                * 719C5
        D0=A                                     * 719CB
        ?C=0    A                                * 719CE
        GOYES   L_719E0                          * 719D1
        GOSUB   SUB_71603                        * 719D3
        A=R0.F  A                                * 719D7
        D0=A                                     * 719DD
L_719E0:
        GOSBVL  SKIPOB                           * 719E0
        AD0EX                                    * 719E7
        C=R1.F  A                                * 719EA
        ?C=0    A                                * 719F0
        GOYES   L_719FB                          * 719F3
        P=      1                                * 719F5
        GOSUB   SUB_71603                        * 719F7
L_719FB:
        B=A     A                                * 719FB
        A=R0.F  A                                * 719FD
        D0=(5)  USEROB                           * 71A03
        C=DAT0  A                                * 71A0A
        D0=C                                     * 71A0D
        D0=D0+  5                                * 71A10
        C=0     A                                * 71A13
        C=DAT0  X                                * 71A15
        D1=C                                     * 71A19
        D1=D1-  1                                * 71A1C
        GOC     L_71A35                          * 71A1F
        D0=D0-  2                                * 71A22
        LC(5)   DOEXT1                           * 71A25
        D=C     A                                * 71A2C
        GOVLNG  L_0BB30                          * 71A2E
L_71A35:
        GOVLNG  GETPTRFALSE                      * 71A35

* refs (1): 09424
OBJ_71A3C:
        CON(5)  (*)+5                            * 71A3C  primitive code object
        C=DAT1  A                                * 71A41
        CD1EX                                    * 71A44
        RSTK=C                                   * 71A47
        A=DAT1  A                                * 71A49
        LC(5)   DOEXT1                           * 71A4C
        ?C=A    A                                * 71A53
        GOYES   L_71A69                          * 71A56
L_71A58:
        C=RSTK                                   * 71A58
        CD1EX                                    * 71A5A
        A=C     A                                * 71A5D
        ST=1    1                                * 71A5F
        GOVLNG  L_065F0                          * 71A62
L_71A69:
        D1=D1+  10                               * 71A69
        A=DAT1  A                                * 71A6C
        D1=D1-  5                                * 71A6F
        C=DAT1  A                                * 71A72
        D1=C                                     * 71A75
        ?A=0    A                                * 71A78
        GOYES   L_71A58                          * 71A7B
        C=RSTK                                   * 71A7D
        D1=C                                     * 71A7F
        LC(5)   FALSE                            * 71A82
        A=C     A                                * 71A89
        PC=(A)                                   * 71A8B
L_71A8F:
        C=DAT1  A                                * 71A8F
        CD1EX                                    * 71A92
        RSTK=C                                   * 71A95
        A=DAT1  A                                * 71A97
        LC(5)   DOEXT1                           * 71A9A
        ?C=A    A                                * 71AA1
        GOYES   L_71AB2                          * 71AA4
        C=RSTK                                   * 71AA6
        D1=C                                     * 71AA8
        GOVLNG  L_09493                          * 71AAB
L_71AB2:
        D1=D1+  10                               * 71AB2
        A=DAT1  A                                * 71AB5
        D1=D1-  5                                * 71AB8
        ?A#0    A                                * 71ABB
        GOYES   L_71AD9                          * 71ABE
        GOSBVL  SUB_09474                        * 71AC0
        C=RSTK                                   * 71AC7
        D1=C                                     * 71AC9
        DAT1=A  A                                * 71ACC
        A=DAT0  A                                * 71ACF
        D0=D0+  5                                * 71AD2
        PC=(A)                                   * 71AD5
L_71AD9:
        C=DAT1  A                                * 71AD9
        R0=C.F  A                                * 71ADC
        C=RSTK                                   * 71AE2
        D1=C                                     * 71AE4
        D1=D1+  5                                * 71AE7
        D=D+1   A                                * 71AEA
        GOSBVL  SAVPTR                           * 71AEC
        C=A     A                                * 71AF3
        GOSUB   SUB_71603                        * 71AF5
        AR0EX.F A                                * 71AF9
        GOSBVL  SUB_09477                        * 71AFF
        AR0EX.F A                                * 71B06
        R1=A.F  A                                * 71B0C
        C=A     A                                * 71B12
        P=      1                                * 71B14
        GOSUB   SUB_71603                        * 71B16
        GOSBVL  SUB_706B7                        * 71B1A
        A=DAT0  A                                * 71B21
        D0=D0+  5                                * 71B24
        PC=(A)                                   * 71B27
L_71B2B:
        C=DAT1  A                                * 71B2B
        CD1EX                                    * 71B2E
        RSTK=C                                   * 71B31
        LC(5)   DOEXT1                           * 71B33
        A=DAT1  A                                * 71B3A
        ?C=A    A                                * 71B3D
        GOYES   L_71B4E                          * 71B40
        C=RSTK                                   * 71B42
        D1=C                                     * 71B44
L_71B47:
        GOVLNG  L_0817F                          * 71B47
L_71B4E:
        D1=D1+  10                               * 71B4E
        A=DAT1  A                                * 71B51
        D1=D1-  5                                * 71B54
        ?A#0    A                                * 71B57
        GOYES   L_71B6A                          * 71B5A
        A=DAT1  A                                * 71B5C
        C=RSTK                                   * 71B5F
        D1=C                                     * 71B61
        DAT1=A  A                                * 71B64
        GONC    L_71B47                          * 71B67
L_71B6A:
        C=DAT1  A                                * 71B6A
        D1=C                                     * 71B6D
        D1=D1+  10                               * 71B70
        C=RSTK                                   * 71B73
        CD1EX                                    * 71B75
        R0=C.F  A                                * 71B78
        R2=A.F  A                                * 71B7E
        GOSBVL  SAVPTR                           * 71B84
        C=R2.F  A                                * 71B8B
        RSTK=C                                   * 71B91
        GOSUB   SUB_71603                        * 71B93
        A=R0.F  A                                * 71B97
        D1=A                                     * 71B9D
        A=0     A                                * 71BA0
        A=DAT1  B                                * 71BA2
        ?A=0    A                                * 71BA5
        GOYES   L_71BAC                          * 71BA8
        A=A+1   A                                * 71BAA
L_71BAC:
        A=A+1   A                                * 71BAC
        A=A+A   A                                * 71BAE
        GOLONG  L_712F1                          * 71BB0

* refs (3): 219DB 21B25 85C38
OBJ_71BB6:
        CON(5)  (*)+5                            * 71BB6  primitive code object
        LC(5)   DOBAK                            * 71BBB
        GOTO    L_71BD2                          * 71BC2

        CON(5)  (*)+5                            * 71BC6  primitive code object
        LC(5)   DOLIB                            * 71BCB
L_71BD2:
        RSTK=C                                   * 71BD2
        C=DAT1  A                                * 71BD4
        RSTK=C                                   * 71BD7
        CD1EX                                    * 71BD9
        A=DAT1  A                                * 71BDC
        D1=C                                     * 71BDF
        LC(5)   DOEXT1                           * 71BE2
        ?C=A    A                                * 71BE9
        GOYES   L_71BF7                          * 71BEC
        C=RSTK                                   * 71BEE
        GOVLNG  L_2727E                          * 71BF0
L_71BF7:
        GOSBVL  SAVPTR                           * 71BF7
        C=RSTK                                   * 71BFE
        D1=C                                     * 71C00
        D1=D1+  5                                * 71C03
        A=DAT1  A                                * 71C06
        D1=D1+  5                                * 71C09
        C=DAT1  A                                * 71C0C
        B=C     A                                * 71C0F
        ?C=0    A                                * 71C11
        GOYES   L_71C1A                          * 71C14
        GOSUB   SUB_71603                        * 71C16
L_71C1A:
        D1=A                                     * 71C1A
        A=DAT1  A                                * 71C1D
        C=B     A                                * 71C20
        ?C=0    A                                * 71C22
        GOYES   L_71C2D                          * 71C25
        P=      1                                * 71C27
        GOSUB   SUB_71603                        * 71C29
L_71C2D:
        GOSBVL  GETPTR                           * 71C2D
        GOVLNG  L_2727E                          * 71C34

* romptr #i -> ob T -> F
* refs (1): 71DA3
rNTHELCOMP:
        CON(5)  (*)+5                            * 71C3B  primitive code object
        GOSBVL  SAVPTR                           * 71C40
        D1=D1+  5                                * 71C47
        A=DAT1  A                                * 71C4A
        GOSBVL  SUB_07ED8                        * 71C4D
        GONC    L_71C74                          * 71C54
L_71C57:
        GOSBVL  GETPTR                           * 71C57
        D1=D1+  10                               * 71C5E
        D=D+CON A,2                              * 71C61
        LC(5)   FALSE                            * 71C67
        A=C     A                                * 71C6E
        PC=(A)                                   * 71C70
L_71C74:
        D1=(5)  DSKTOP                           * 71C74
        C=DAT1  A                                * 71C7B
        D1=C                                     * 71C7E
        R0=A.F  A                                * 71C81
        A=DAT1  A                                * 71C87
        AD1EX                                    * 71C8A
        D1=D1+  5                                * 71C8D
        C=DAT1  A                                * 71C90
        D=C     A                                * 71C93
        D1=A                                     * 71C95
        C=0     A                                * 71C98
        ?ST=0   1                                * 71C9A
        GOYES   L_71CA9                          * 71C9D
        D0=(5)  #800FF                           * 71C9F
        C=DAT0  A                                * 71CA6
L_71CA9:
        R3=C.F  A                                * 71CA9
        ?C=0    A                                * 71CAF
        GOYES   L_71CB8                          * 71CB2
        GOSUB   SUB_71603                        * 71CB4
L_71CB8:
        A=R0.F  A                                * 71CB8
        D0=A                                     * 71CBE
        D0=D0+  5                                * 71CC1
        LC(5)   SEMI                             * 71CC4
        B=C     A                                * 71CCB
        D=D-1   A                                * 71CCD
        GOC     L_71D2F                          * 71CCF
L_71CD2:
        A=DAT0  A                                * 71CD2
        ?A=B    A                                * 71CD5
        GOYES   L_71D2F                          * 71CD8
        D=D-1   A                                * 71CDA
        GOC     L_71CE9                          * 71CDC
        GOSBVL  SKIPOB                           * 71CDF
        GONC    L_71CD2                          * 71CE6
L_71CE9:
        D1=A                                     * 71CE9
        A=DAT1  A                                * 71CEC
        LC(5)   PRLG                             * 71CEF
        ?C=A    A                                * 71CF6
        GOYES   L_71D40                          * 71CF9
        AD1EX                                    * 71CFB
        GOSUB   SUB_71D8A                        * 71CFE
        GOC     L_71D0B                          * 71D02
        P=      1                                * 71D05
        GOSUB   SUB_71603                        * 71D07
L_71D0B:
        GOSBVL  GETPTR                           * 71D0B
        D1=D1+  5                                * 71D12
        DAT1=A  A                                * 71D15
        D1=D1-  5                                * 71D18
        LC(5)   TRUE                             * 71D1B
        DAT1=C  A                                * 71D22
        A=DAT0  A                                * 71D25
        D0=D0+  5                                * 71D28
        PC=(A)                                   * 71D2B
L_71D2F:
        GOSUB   SUB_71D8A                        * 71D2F
        GOC     L_71D3C                          * 71D33
        P=      1                                * 71D36
        GOSUB   SUB_71603                        * 71D38
L_71D3C:
        GOTO    L_71C57                          * 71D3C
L_71D40:
        AD0EX                                    * 71D40
        GOSUB   SUB_71D8A                        * 71D43
        GOC     L_71D0B                          * 71D47
        R0=A.F  A                                * 71D4A
        D0=A                                     * 71D50
        GOSBVL  SKIPOB                           * 71D53
        AD0EX                                    * 71D5A
        C=R0.F  A                                * 71D5D
        A=A-C   A                                * 71D63
        C=R3.F  A                                * 71D65
        P=      1                                * 71D6B
        GOSUB   SUB_71603                        * 71D6D
        P=      3                                * 71D71
        C=R3.F  A                                * 71D73
        GOSUB   SUB_71603                        * 71D79
        A=R0.F  A                                * 71D7D
        GONC    L_71D0B                          * 71D83
        GOTO    L_71D97                          * 71D86

* refs (3): 71CFE 71D2F 71D43
SUB_71D8A:
        C=R3.F  A                                * 71D8A
        ?C=0    A                                * 71D90
        RTNYES                                   * 71D93
        RTNCC                                    * 71D95
L_71D97:
        GOVLNG  GPMEMERR                         * 71D97
        RPL

        :: rNTHELCOMP DROP ;                     * 71D9E

* refs (5): 268F9 2693A 71E09 72BAA 8D241
RPTRACC:
        CON(5)  (*)+5                            * 71DB2  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 71DB7
        GOSBVL  SAVPTR                           * 71DBA
        GOSBVL  SUB_07ED8                        * 71DC1
        GOC     L_71DE4                          * 71DC8
        ?ST=0   1                                * 71DCB
        GOYES   L_71DDD                          * 71DCE
        D0=(5)  IRAMBUFF                         * 71DD0
        GOLONG  L_71583                          * 71DD7
L_71DDD:
        GOVLNG  L_08060                          * 71DDD
L_71DE4:
        GOSBVL  GETPTR                           * 71DE4
        LC(5)   FALSE                            * 71DEB
        DAT1=C  A                                * 71DF2
        A=DAT0  A                                * 71DF5
        D0=D0+  5                                * 71DF8
        PC=(A)                                   * 71DFB
        RPL

* refs (5): 26ACD 26C1F 270DE 271E8 72A07
OBJ_71DFF:
        :: DUP RPTRACC COLA NOTcase              * 71DFF
        ;                                        * 71E18
        ASSEMBLE
L_71E1D:
        GOSUB   SUB_71E57                        * 71E1D
        D1=D1-  7                                * 71E21
        A=0     A                                * 71E24
        A=DAT1  1                                * 71E26
        ABIT=0  2                                * 71E2A
        ABIT=0  3                                * 71E2F
        D1=C                                     * 71E34
        A=A+A   A                                * 71E37
        C=A     A                                * 71E39
        A=A+A   A                                * 71E3B
        A=A+A   A                                * 71E3D
        A=A+C   A                                * 71E3F
        LC(5)   BINT0                            * 71E41
        A=A+C   A                                * 71E48
        DAT1=A  A                                * 71E4A
        A=DAT0  A                                * 71E4D
        D0=D0+  5                                * 71E50
        PC=(A)                                   * 71E53

* refs (11): 71E1D 71F00 71F13 71F8B 71F99 71FA7 ...
SUB_71E57:
        C=0     A                                * 71E57
        R3=C.F  A                                * 71E59
        C=DAT1  A                                * 71E5F
        R0=C.F  A                                * 71E62
        CD1EX                                    * 71E68
        A=DAT1  A                                * 71E6B
        D1=C                                     * 71E6E
        LC(5)   DOEXT1                           * 71E71
        A=A-C   A                                * 71E78
        ST=0    1                                * 71E7A
        C=R0.F  A                                * 71E7D
        CD1EX                                    * 71E83
        ?A#0    A                                * 71E86
        RTNYES                                   * 71E89
        D1=D1+  5                                * 71E8B
        A=DAT1  A                                * 71E8E
        R0=A.F  A                                * 71E91
        D1=D1+  5                                * 71E97
        A=DAT1  A                                * 71E9A
        R3=A.F  A                                * 71E9D
        ?A#0    A                                * 71EA3
        GOYES   L_71EB3                          * 71EA6
        A=R0.F  A                                * 71EA8
        D1=A                                     * 71EAE
        RTNSC                                    * 71EB1
L_71EB3:
        D1=C                                     * 71EB3
        GOSBVL  SAVPTR                           * 71EB6
        ST=1    1                                * 71EBD
        C=A     A                                * 71EC0
        GOSUB   SUB_72048                        * 71EC2
        A=R0.F  A                                * 71EC6
        D1=A                                     * 71ECC
        D1=D1-  10                               * 71ECF
        A=DAT1  W                                * 71ED2
        C=R3.F  A                                * 71ED6
        P=      1                                * 71EDC
        GOSUB   SUB_72048                        * 71EDE
        D1=(5)  IRAMBUFF                         * 71EE2
        DAT1=A  W                                * 71EE9
        GOSBVL  GETPTR                           * 71EED
        LC(5)   #800FF                           * 71EF4
        CD1EX                                    * 71EFB
        RTN                                      * 71EFE
L_71F00:
        GOSUB   SUB_71E57                        * 71F00
        D1=D1-  6                                * 71F04
        GOVLNG  L_26B09                          * 71F07

* refs (1): 26AD7
OBJ_71F0E:
        CON(5)  (*)+5                            * 71F0E  primitive code object
        GOSUB   SUB_71E57                        * 71F13
        RSTK=C                                   * 71F17
        A=DAT1  A                                * 71F19
        D1=(5)  -0.26480225202E-23               * 71F1C
L_71F23:
        C=DAT1  A                                * 71F23
        ?C=A    A                                * 71F26
        GOYES   L_71F36                          * 71F29
        ?C=0    A                                * 71F2B
        GOYES   L_71F48                          * 71F2E
        D1=D1+  10                               * 71F30
        GONC    L_71F23                          * 71F33
L_71F36:
        LC(5)   DROPTRUE                         * 71F36
L_71F3D:
        A=C     A                                * 71F3D
        C=RSTK                                   * 71F3F
        D1=C                                     * 71F41
        PC=(A)                                   * 71F44
L_71F48:
        LC(5)   DOCOL                            * 71F48
        A=A-C   A                                * 71F4F
        LC(5)   OBJ_26AE1                        * 71F51
        ?A=0    A                                * 71F58
        GOYES   L_71F3D                          * 71F5B
        LC(5)   DROPFALSE                        * 71F5D
        GOTO    L_71F3D                          * 71F64

* refs (1): 71F1C
-0.26480225202E-23:
        CON(5)  DOREAL                           * 71F68  DOREAL

(-0.26650264802E-740,-4.16487E:
        NIBHEX  77920ADA2084E20D                 * 71F6D  w)...H.Ð
        NIBHEX  6E208BA2000000                   * 71F7D  æ.¸*...
L_71F8B:
        GOSUB   SUB_71E57                        * 71F8B
        D1=D1-  6                                * 71F8F
        GOVLNG  L_26B33                          * 71F92
L_71F99:
        GOSUB   SUB_71E57                        * 71F99
        D1=D1-  7                                * 71F9D
        GOVLNG  L_26958                          * 71FA0
L_71FA7:
        GOSUB   SUB_71E57                        * 71FA7
        D1=D1-  6                                * 71FAB
        GOVLNG  L_27110                          * 71FAE
L_71FB5:
        GOSUB   SUB_71E57                        * 71FB5
        D1=D1-  7                                * 71FB9
        GOVLNG  L_2720B                          * 71FBC
L_71FC3:
        C=C-A   A                                * 71FC3
        AD1EX                                    * 71FC5
        ?C=0    A                                * 71FC8
        GOYES   L_71FE2                          * 71FCB
L_71FCD:
        C=0     A                                * 71FCD
        R3=C.F  A                                * 71FCF
        R0=A.F  A                                * 71FD5
L_71FDB:
        GOVLNG  L_26FC2                          * 71FDB
L_71FE2:
        GOSBVL  SUB_07ED8                        * 71FE2
        GONC    L_71FF3                          * 71FE9
        GOVLNG  GETPTRFALSE                      * 71FEC
L_71FF3:
        ?ST=0   1                                * 71FF3
        GOYES   L_71FCD                          * 71FF6
        D1=(5)  #800FA                           * 71FF8
        A=DAT1  A                                * 71FFF
        R0=A.F  A                                * 72002
        D1=D1+  5                                * 72008
        C=DAT1  A                                * 7200B
        R3=C.F  A                                * 7200E
        ?C=0    A                                * 72014
        GOYES   L_71FDB                          * 72017
        GOSUB   SUB_72048                        * 72019
        D1=A                                     * 7201D
        D1=D1-  10                               * 72020
        A=DAT1  W                                * 72023
        C=R3.F  A                                * 72027
        P=      1                                * 7202D
        GOSUB   SUB_72048                        * 7202F
        D1=(5)  IRAMBUFF                         * 72033
        DAT1=A  W                                * 7203A
        D1=D1+  10                               * 7203E
        AD1EX                                    * 72041
        GOTO    L_71FDB                          * 72044

* refs (10): 71EC2 71EDE 72019 7202F 7206F 720C9 ...
SUB_72048:
        RSTK=C                                   * 72048
        RTN                                      * 7204A

* refs (1): 26FE1
SUB_7204C:
        C=R3.F  A                                * 7204C
        ?C#0    A                                * 72052
        GOYES   L_72066                          * 72055
L_72057:
        GOSBVL  SKIPOB                           * 72057
        C=C-1   S                                * 7205E
        GONC    L_72057                          * 72061
        RTN                                      * 72064
L_72066:
        R4=C.F  S                                * 72066
        AD0EX                                    * 7206C
        GOSUB   SUB_72048                        * 7206F
        C=R4.F  S                                * 72073
        AD0EX                                    * 72079
        GOTO    L_72057                          * 7207C

* refs (1): 27012
SUB_72080:
        C=R3.F  A                                * 72080
        ?C#0    A                                * 72086
        GOYES   L_72092                          * 72089
        GOVLNG  GETPTR                           * 7208B
L_72092:
        ?ST=0   1                                * 72092
        GOYES   L_720C7                          * 72095
        D0=(5)  #800FF                           * 72097
        DAT0=C  A                                * 7209E
        D0=D0-  5                                * 720A1
        A=R0.F  A                                * 720A4
        DAT0=A  A                                * 720AA
        D0=D0-  5                                * 720AD
        A=C     A                                * 720B0
        LC(5)   DOEXT1                           * 720B2
        DAT0=C  A                                * 720B9
        CD0EX                                    * 720BC
        R0=C.F  A                                * 720BF
        C=A     A                                * 720C5
L_720C7:
        P=      1                                * 720C7
        GOSUB   SUB_72048                        * 720C9
        GOVLNG  GETPTR                           * 720CD

* refs (1): 26C29
OBJ_720D4:
        CON(5)  (*)+5                            * 720D4  primitive code object
        GOSUB   SUB_71E57                        * 720D9
        GOSUB   SUB_72107                        * 720DD
        ?A=0    A                                * 720E1
        GOYES   L_720FD                          * 720E4
        LC(5)   FALSE                            * 720E6
        DAT1=C  A                                * 720ED
        LC(5)   SEMI                             * 720F0
        A=C     A                                * 720F7
        PC=(A)                                   * 720F9
L_720FD:
        A=DAT0  A                                * 720FD
        D0=D0+  5                                * 72100
        PC=(A)                                   * 72103

* refs (2): 720DD 72228
SUB_72107:
        RSTK=C                                   * 72107
        A=DAT1  A                                * 72109
        LC(5)   DOCOL                            * 7210C
        A=A-C   A                                * 72113
        C=RSTK                                   * 72115
        CD1EX                                    * 72117
        RTN                                      * 7211A
L_7211C:
        GOSBVL  SAVPTR                           * 7211C
        C=0     A                                * 72123
        R3=C.F  A                                * 72125
        C=DAT1  A                                * 7212B
        R0=C.F  A                                * 7212E
        D0=C                                     * 72134
        A=DAT0  A                                * 72137
        LC(5)   DOEXT1                           * 7213A
        A=A-C   A                                * 72141
        ST=0    1                                * 72143
        ?A#0    A                                * 72146
        GOYES   L_7217A                          * 72149
        D0=D0+  5                                * 7214B
        A=DAT0  A                                * 7214E
        R0=A.F  A                                * 72151
        D0=D0+  5                                * 72157
        A=DAT0  A                                * 7215A
        R3=A.F  A                                * 7215D
        ?A=0    A                                * 72163
        GOYES   L_72171                          * 72166
        C=A     A                                * 72168
        GOSUB   SUB_72048                        * 7216A
        ST=1    1                                * 7216E
L_72171:
        A=R0.F  A                                * 72171
        D0=A                                     * 72177
L_7217A:
        D0=D0+  5                                * 7217A
        A=DAT0  A                                * 7217D
        LC(5)   x<<                              * 72180
        GOVLNG  L_26C90                          * 72187
L_7218E:
        C=R3.F  A                                * 7218E
        ?C=0    A                                * 72194
        GOYES   L_7219F                          * 72197
        P=      1                                * 72199
        GOSUB   SUB_72048                        * 7219B
L_7219F:
        GOVLNG  GETPTRFALSE                      * 7219F
        RPL

* refs (1): 26C81
OBJ_721A6:
        :: ?ACCPTR> EVAL SWAP TRUE ;             * 721A6
        ASSEMBLE
L_721C4:
        C=R3.F  A                                * 721C4
        ?C#0    A                                * 721CA
        GOYES   L_721E0                          * 721CD
L_721CF:
        GOSBVL  PUSH#                            * 721CF
        A=R1.F  A                                * 721D6
        PC=(A)                                   * 721DC
L_721E0:
        ?ST=0   1                                * 721E0
        GOYES   L_72215                          * 721E3
        D0=(5)  #800FF                           * 721E5
        DAT0=C  A                                * 721EC
        D0=D0-  5                                * 721EF
        A=R1.F  A                                * 721F2
        DAT0=A  A                                * 721F8
        D0=D0-  5                                * 721FB
        A=C     A                                * 721FE
        LC(5)   DOEXT1                           * 72200
        DAT0=C  A                                * 72207
        CD0EX                                    * 7220A
        R1=C.F  A                                * 7220D
        C=A     A                                * 72213
L_72215:
        P=      1                                * 72215
        GOSUB   SUB_72048                        * 72217
        GOTO    L_721CF                          * 7221B

* refs (1): 270E8
OBJ_7221F:
        CON(5)  (*)+5                            * 7221F  primitive code object
        GOSUB   SUB_71E57                        * 72224
        GOSUB   SUB_72107                        * 72228
        LC(5)   OBJ_270F2                        * 7222C
        ?A=0    A                                * 72233
        GOYES   L_7223F                          * 72236
        LC(5)   DROPFALSE                        * 72238
L_7223F:
        A=C     A                                * 7223F
        PC=(A)                                   * 72241

* refs (2): 307B1 D4633
SUB_72245:
        D1=(5)  #7FFBF                           * 72245
        P=      0                                * 7224C
        LC(5)   #7F000                           * 7224E
        UNCNFG                                   * 72255
        C=DAT1  12                               * 72258
        D1=C                                     * 7225C
        LC(5)   #FF000                           * 7225F
        CONFIG                                   * 72266
        LC(5)   #7F000                           * 72269
        CONFIG                                   * 72270
        LC(5)   IRAMBUFF                         * 72273
        CD1EX                                    * 7227A
        DAT1=C  12                               * 7227D
        SETHEX                                   * 72281
        RTN                                      * 72283
L_72285:
        C=0     A                                * 72285
        R3=C.F  A                                * 72287
        A=DAT1  A                                * 7228D
        D1=D1+  5                                * 72290
        D=D+1   A                                * 72293
        GOSBVL  SAVPTR                           * 72295
        R0=A                                     * 7229C
        D0=A                                     * 7229F
        A=DAT0  A                                * 722A2
        LC(5)   DOEXT1                           * 722A5
        ?C#A    A                                * 722AC
        GOYES   L_722D1                          * 722AF
        D0=D0+  10                               * 722B1
        C=DAT0  A                                * 722B4
        R3=C.F  A                                * 722B7
        D0=D0-  5                                * 722BD
        A=DAT0  A                                * 722C0
        R0=A.F  A                                * 722C3
        ?C#0    A                                * 722C9
        GOYES   L_722E9                          * 722CC
        D0=A                                     * 722CE
L_722D1:
        GOSBVL  SKIPOB                           * 722D1
        AD0EX                                    * 722D8
        ?A#0    A                                * 722DB
        GOYES   L_722E2                          * 722DE
        A=A-1   A                                * 722E0
L_722E2:
        GOVLNG  L_0B356                          * 722E2
L_722E9:
        P=      5                                * 722E9
        GOSUB   SUB_72048                        * 722EB
        C=R0.F  A                                * 722EF
        A=A+C   A                                * 722F5
        GONC    L_722E2                          * 722F7
        A=A-1   A                                * 722FA
        GOTO    L_722E2                          * 722FC
        RPL

* refs (1): 09016
OBJ_72300:
        :: SWAPDROP 2DUP #>case SETCORPORT       * 72300
          2DUP SWAP#- 4ROLL 2DUP #>case SETCORPORT * 72319
          SWAP#- ROTDROP ROTDUP OSIZE ;          * 72337
        ASSEMBLE

* refs (1): 723BD
SUB_72350:
        D0=(5)  INITEN                           * 72350
        C=0     B                                * 72357
        C=DAT0  1                                * 7235A
        P=      1                                * 7235E
        DAT0=C  P                                * 72360
        D0=(5)  AccessInit                       * 72364
        ?ST=0   15                               * 7236B
        GOYES   L_72373                          * 7236E
        C=C+1   P                                * 72370
L_72373:
        P=      0                                * 72373
        DAT0=C  B                                * 72375
        ST=0    15                               * 72378
        RTN                                      * 7237B
L_7237D:
        C=0     A                                * 7237D
        P=      0                                * 7237F
        C=C-1   A                                * 72381
        RTNC                                     * 72383
L_72386:
        ?P=     0                                * 72386
        GOYES   L_723AB                          * 72389
        ?P=     1                                * 7238B
        GOYES   L_72407                          * 7238E
        ?P=     2                                * 72390
        GOYES   L_723A7                          * 72393
        ?P=     3                                * 72395
        GOYES   L_723A3                          * 72398
        ?P=     4                                * 7239A
        GOYES   L_7237D                          * 7239D
        GOTO    L_7263A                          * 7239F
L_723A3:
        GOTO    L_724F5                          * 723A3
L_723A7:
        GOTO    L_7248C                          * 723A7
L_723AB:
        P=      0                                * 723AB
        D0=(5)  #80535                           * 723AD
        C=DAT0  1                                * 723B4
        ?C=0    P                                * 723B8
        RTNYES                                   * 723BB
        GOSUB   SUB_72350                        * 723BD
        D0=(5)  #7F000                           * 723C1
        C=DAT0  B                                * 723C8
        D0=(5)  LINECOUNTg                       * 723CB
        C=DAT0  B                                * 723D2
        CBIT=1  7                                * 723D5
        DAT0=C  B                                * 723DA
        D0=(5)  LINECOUNT                        * 723DD
        DAT0=C  B                                * 723E4
        LC(5)   CMOS                             * 723E7
        UNCNFG                                   * 723EE
        LC(5)   #F0000                           * 723F1
        CONFIG                                   * 723F8
        LC(5)   CMOS                             * 723FB
        CONFIG                                   * 72402
        RTNCC                                    * 72405
L_72407:
        P=      0                                * 72407
        D0=(5)  #80535                           * 72409
        C=DAT0  1                                * 72410
        ?C=0    P                                * 72414
        RTNYES                                   * 72417
        C=C+1   P                                * 72419
        GOC     L_72445                          * 7241C
        D0=(5)  LINECOUNTg                       * 7241F
        C=DAT0  B                                * 72426
        CBIT=0  7                                * 72429
        DAT0=C  B                                * 7242E
        D0=(5)  LINECOUNT                        * 72431
        DAT0=C  B                                * 72438
        D0=(5)  #7F040                           * 7243B
        C=DAT0  B                                * 72442
L_72445:
        LC(5)   CMOS                             * 72445
        UNCNFG                                   * 7244C
        LC(5)   #C0000                           * 7244F
        CONFIG                                   * 72456
        LC(5)   CMOS                             * 72459
        CONFIG                                   * 72460
        D0=(5)  AccessInit                       * 72463
        C=DAT0  B                                * 7246A
        D0=(5)  INITEN                           * 7246D
        DAT0=C  1                                * 72474
        C=0     P                                * 72478
        ?C#0    B                                * 7247B
        GOYES   L_72482                          * 7247E
        RTN                                      * 72480
L_72482:
        ST=1    15                               * 72482
        RSI                                      * 72485
        RTI                                      * 7248A
L_7248C:
        P=      0                                * 7248C
        ?C=0    S                                * 7248E
        GOYES   L_724C4                          * 72491
        C=R1.F  A                                * 72493
        D0=C                                     * 72499
        C=R0.F  A                                * 7249C
        D1=C                                     * 724A2
        C=A     A                                * 724A5
        GOSBVL  MOVEDOWN                         * 724A7
        CD1EX                                    * 724AE
        R0=C.F  A                                * 724B1
        CD0EX                                    * 724B7
        R1=C.F  A                                * 724BA
        GOTO    L_72407                          * 724C0
L_724C4:
        C=R0.F  A                                * 724C4
        D0=C                                     * 724CA
        C=R1.F  A                                * 724CD
        D1=C                                     * 724D3
        C=A     A                                * 724D6
        GOSBVL  MOVEDOWN                         * 724D8
        CD1EX                                    * 724DF
        R1=C.F  A                                * 724E2
        CD0EX                                    * 724E8
        R0=C.F  A                                * 724EB
        GOTO    L_72407                          * 724F1
L_724F5:
        P=      0                                * 724F5
        ST=0    10                               * 724F7
L_724FA:
        C=A     A                                * 724FA
        GOSBVL  CREATETEMP                       * 724FC
        C=B     A                                * 72503
        D0=C                                     * 72505
        GOC     L_72529                          * 72508
        D0=D0-  6                                * 7250B
        AD0EX                                    * 7250E
        GOSUB   L_723AB                          * 72511
        D0=(5)  #80535                           * 72515
        C=DAT0  1                                * 7251C
        ?C=0    P                                * 72520
        GOYES   L_72563                          * 72523
        GOTO    L_72586                          * 72525
L_72529:
        ?ST=1   10                               * 72529
        RTNYES                                   * 7252C
        ST=1    10                               * 7252E
        D0=D0-  6                                * 72531
        C=RSTK                                   * 72534
        GOSUB   SUB_7265D                        * 72536
        CD0EX                                    * 7253A
        GOSUB   SUB_7265D                        * 7253D
        C=R1.F  A                                * 72541
        R1=C                                     * 72547
        GOSBVL  GARBAGECOL                       * 7254A  inline data follows
        C=R1                                     * 72551
        GOSUB   SUB_72664                        * 72554
        A=C     A                                * 72558
        GOSUB   SUB_72664                        * 7255A
        RSTK=C                                   * 7255E
        GONC    L_724FA                          * 72560
L_72563:
        C=R0.F  A                                * 72563
        C=C+A   A                                * 72569
        D0=C                                     * 7256B
        C=A     A                                * 7256E
        GOSBVL  MOVEUP                           * 72570
L_72577:
        AD1EX                                    * 72577
        R0=A.F  A                                * 7257A
        GOSUB   L_72407                          * 72580
        RTNCC                                    * 72584
L_72586:
        LC(5)   #C0000                           * 72586
        B=C     A                                * 7258D
        LC(5)   #F0000                           * 7258F
        D=C     A                                * 72596
        C=R0.F  A                                * 72598
        C=C+A   A                                * 7259E
L_725A0:
        D0=C                                     * 725A0
        LC(5)   #80309                           * 725A3
        CD1EX                                    * 725AA
        R0=C.F  A                                * 725AD
        LC(5)   #00214                           * 725B3
        A=A-C   A                                * 725BA
        GONC    L_725C3                          * 725BC
        C=C+A   A                                * 725BF
        A=0     A                                * 725C1
L_725C3:
        DAT1=A  A                                * 725C3
        GOSBVL  MOVEUP                           * 725C6
        A=R0.F  A                                * 725CD
        AD1EX                                    * 725D3
        LC(5)   #80309                           * 725D6
        CAEX    A                                * 725DD
        C=A-C   A                                * 725DF
        AD0EX                                    * 725E1
        R0=A.F  A                                * 725E4
        A=C     A                                * 725EA
        LC(5)   CMOS                             * 725EC
        UNCNFG                                   * 725F3
        BCEX    A                                * 725F6
        CONFIG                                   * 725F8
        BCEX    A                                * 725FB
        CONFIG                                   * 725FD
        C=A     A                                * 72600
        GOSBVL  MOVEUP                           * 72602
        LC(5)   CMOS                             * 72609
        UNCNFG                                   * 72610
        DCEX    A                                * 72613
        CONFIG                                   * 72615
        DCEX    A                                * 72618
        CONFIG                                   * 7261A
        D0=(5)  #80309                           * 7261D
        A=DAT0  A                                * 72624
        ?A=0    A                                * 72627
        GOYES   L_72636                          * 7262A
        C=R0.F  A                                * 7262C
        GOTO    L_725A0                          * 72632
L_72636:
        GOTO    L_72577                          * 72636
L_7263A:
        GOSUB   L_723AB                          * 7263A
        C=R0.F  A                                * 7263E
        D0=C                                     * 72644
        GOSBVL  SKIPOB                           * 72647
        AD0EX                                    * 7264E
        C=R0.F  A                                * 72651
        A=A-C   A                                * 72657
        GOTO    L_72407                          * 72659

* refs (4): 72536 7253D 72849 72850
SUB_7265D:
        GOVLNG  CSLW5                            * 7265D

* refs (4): 72554 7255A 72867 7286D
SUB_72664:
        GOVLNG  CSRW5                            * 72664

* refs (1): 726C8
SUB_7266B:
        D0=(5)  INITEN                           * 7266B
        C=0     B                                * 72672
        C=DAT0  1                                * 72675
        P=      1                                * 72679
        DAT0=C  P                                * 7267B
        D0=(5)  AccessInit                       * 7267F
        ?ST=0   15                               * 72686
        GOYES   L_7268E                          * 72689
        C=C+1   P                                * 7268B
L_7268E:
        P=      0                                * 7268E
        DAT0=C  B                                * 72690
        ST=0    15                               * 72693
        RTN                                      * 72696
L_72698:
        C=0     A                                * 72698
        P=      0                                * 7269A
        C=C-1   A                                * 7269C
        RTNC                                     * 7269E
L_726A1:
        ?P=     0                                * 726A1
        GOYES   L_726C6                          * 726A4
        ?P=     1                                * 726A6
        GOYES   L_72712                          * 726A9
        ?P=     2                                * 726AB
        GOYES   L_726C2                          * 726AE
        ?P=     3                                * 726B0
        GOYES   L_726BE                          * 726B3
        ?P=     4                                * 726B5
        GOYES   L_72698                          * 726B8
        GOTO    L_72939                          * 726BA
L_726BE:
        GOTO    L_72818                          * 726BE
L_726C2:
        GOTO    L_727AF                          * 726C2
L_726C6:
        P=      0                                * 726C6
        GOSUB   SUB_7266B                        * 726C8
        D0=(5)  #7F000                           * 726CC
        C=DAT0  B                                * 726D3
        D0=(5)  LINECOUNTg                       * 726D6
        C=DAT0  B                                * 726DD
        CBIT=1  7                                * 726E0
        DAT0=C  B                                * 726E5
        D0=(5)  LINECOUNT                        * 726E8
        DAT0=C  B                                * 726EF
        LC(5)   CMOS                             * 726F2
        UNCNFG                                   * 726F9
        LC(5)   #FE000                           * 726FC
        CONFIG                                   * 72703
        LC(5)   CMOS                             * 72706
        CONFIG                                   * 7270D
        RTNCC                                    * 72710
L_72712:
        P=      0                                * 72712
        D0=(5)  #80535                           * 72714
        C=DAT0  1                                * 7271B
        ?C=0    P                                * 7271F
        GOYES   L_72797                          * 72722
        C=C+1   P                                * 72724
        GOC     L_72750                          * 72727
        D0=(5)  LINECOUNTg                       * 7272A
        C=DAT0  B                                * 72731
        CBIT=0  7                                * 72734
        DAT0=C  B                                * 72739
        D0=(5)  LINECOUNT                        * 7273C
        DAT0=C  B                                * 72743
        D0=(5)  #7F040                           * 72746
        C=DAT0  B                                * 7274D
L_72750:
        LC(5)   CMOS                             * 72750
        UNCNFG                                   * 72757
        LC(5)   #C0000                           * 7275A
        CONFIG                                   * 72761
L_72764:
        LC(5)   CMOS                             * 72764
        CONFIG                                   * 7276B
        D0=(5)  AccessInit                       * 7276E
        C=DAT0  B                                * 72775
        D0=(5)  INITEN                           * 72778
        DAT0=C  1                                * 7277F
        C=0     P                                * 72783
        ?C#0    B                                * 72786
        GOYES   L_7278D                          * 72789
        RTN                                      * 7278B
L_7278D:
        ST=1    15                               * 7278D
        RSI                                      * 72790
        RTI                                      * 72795
L_72797:
        LC(5)   CMOS                             * 72797
        UNCNFG                                   * 7279E
        LC(5)   #F0000                           * 727A1
        CONFIG                                   * 727A8
        GOTO    L_72764                          * 727AB
L_727AF:
        P=      0                                * 727AF
        ?C=0    S                                * 727B1
        GOYES   L_727E7                          * 727B4
        C=R1.F  A                                * 727B6
        D0=C                                     * 727BC
        C=R0.F  A                                * 727BF
        D1=C                                     * 727C5
        C=A     A                                * 727C8
        GOSBVL  MOVEDOWN                         * 727CA
        CD1EX                                    * 727D1
        R0=C.F  A                                * 727D4
        CD0EX                                    * 727DA
        R1=C.F  A                                * 727DD
        GOTO    L_72712                          * 727E3
L_727E7:
        C=R0.F  A                                * 727E7
        D0=C                                     * 727ED
        C=R1.F  A                                * 727F0
        D1=C                                     * 727F6
        C=A     A                                * 727F9
        GOSBVL  MOVEDOWN                         * 727FB
        CD1EX                                    * 72802
        R1=C.F  A                                * 72805
        CD0EX                                    * 7280B
        R0=C.F  A                                * 7280E
        GOTO    L_72712                          * 72814
L_72818:
        P=      0                                * 72818
        ST=0    10                               * 7281A
L_7281D:
        C=A     A                                * 7281D
        GOSBVL  CREATETEMP                       * 7281F
        C=B     A                                * 72826
        D0=C                                     * 72828
        GOC     L_7283C                          * 7282B
        D0=D0-  6                                * 7282E
        AD0EX                                    * 72831
        GOSUB   L_726C6                          * 72834
        GOTO    L_72885                          * 72838
L_7283C:
        ?ST=1   10                               * 7283C
        RTNYES                                   * 7283F
        ST=1    10                               * 72841
        D0=D0-  6                                * 72844
        C=RSTK                                   * 72847
        GOSUB   SUB_7265D                        * 72849
        CD0EX                                    * 7284D
        GOSUB   SUB_7265D                        * 72850
        C=R1.F  A                                * 72854
        R1=C                                     * 7285A
        GOSBVL  GARBAGECOL                       * 7285D  inline data follows
        C=R1                                     * 72864
        GOSUB   SUB_72664                        * 72867
        A=C     A                                * 7286B
        GOSUB   SUB_72664                        * 7286D
        RSTK=C                                   * 72871
        GONC    L_7281D                          * 72873
L_72876:
        AD1EX                                    * 72876
        R0=A.F  A                                * 72879
        GOSUB   L_72712                          * 7287F
        RTNCC                                    * 72883
L_72885:
        LC(5)   #C0000                           * 72885
        B=C     A                                * 7288C
        LC(5)   #FE000                           * 7288E
        D=C     A                                * 72895
        C=R0.F  A                                * 72897
        C=C+A   A                                * 7289D
L_7289F:
        D0=C                                     * 7289F
        LC(5)   #80309                           * 728A2
        CD1EX                                    * 728A9
        R0=C.F  A                                * 728AC
        LC(5)   #00214                           * 728B2
        A=A-C   A                                * 728B9
        GONC    L_728C2                          * 728BB
        C=C+A   A                                * 728BE
        A=0     A                                * 728C0
L_728C2:
        DAT1=A  A                                * 728C2
        GOSBVL  MOVEUP                           * 728C5
        A=R0.F  A                                * 728CC
        AD1EX                                    * 728D2
        LC(5)   #80309                           * 728D5
        CAEX    A                                * 728DC
        C=A-C   A                                * 728DE
        AD0EX                                    * 728E0
        R0=A.F  A                                * 728E3
        A=C     A                                * 728E9
        LC(5)   CMOS                             * 728EB
        UNCNFG                                   * 728F2
        BCEX    A                                * 728F5
        CONFIG                                   * 728F7
        BCEX    A                                * 728FA
        CONFIG                                   * 728FC
        C=A     A                                * 728FF
        GOSBVL  MOVEUP                           * 72901
        LC(5)   CMOS                             * 72908
        UNCNFG                                   * 7290F
        DCEX    A                                * 72912
        CONFIG                                   * 72914
        DCEX    A                                * 72917
        CONFIG                                   * 72919
        D0=(5)  #80309                           * 7291C
        A=DAT0  A                                * 72923
        ?A=0    A                                * 72926
        GOYES   L_72935                          * 72929
        C=R0.F  A                                * 7292B
        GOTO    L_7289F                          * 72931
L_72935:
        GOTO    L_72876                          * 72935
L_72939:
        GOSUB   L_726C6                          * 72939
        C=R0.F  A                                * 7293D
        D0=C                                     * 72943
        GOSBVL  SKIPOB                           * 72946
        AD0EX                                    * 7294D
        C=R0.F  A                                * 72950
        A=A-C   A                                * 72956
        GOTO    L_72712                          * 72958

* refs (1): C07F8
OBJ_7295C:
        CON(5)  (*)+5                            * 7295C  primitive code object
        GOSBVL  SAVPTR                           * 72961
        A=DAT1  A                                * 72968
        D1=A                                     * 7296B
        D1=D1+  5                                * 7296E
        A=DAT1  A                                * 72971
        LC(5)   #7F000                           * 72974
        UNCNFG                                   * 7297B
        LC(5)   #7E000                           * 7297E
        UNCNFG                                   * 72985
        UNCNFG                                   * 72988
        D0=A                                     * 7298B
        B=A     A                                * 7298E
        GOSBVL  SKIPOB                           * 72990
        C=B     A                                * 72997
        CD0EX                                    * 72999
        C=C-B   A                                * 7299C
        D1=(5)  IRAMBUFF                         * 7299E
        GOSBVL  MOVEDOWN                         * 729A5
        LC(5)   #FF000                           * 729AC
        A=C     A                                * 729B3
        CONFIG                                   * 729B5
        LC(5)   #7F000                           * 729B8
        CONFIG                                   * 729BF
        LC(5)   #7E000                           * 729C2
        CAEX    A                                * 729C9
        CONFIG                                   * 729CB
        CAEX    A                                * 729CE
        CONFIG                                   * 729D0
        CAEX    A                                * 729D3
        CONFIG                                   * 729D5
        CAEX    A                                * 729D8
        CONFIG                                   * 729DA
        GOSBVL  GETPTR                           * 729DD
        LC(5)   IRAMBUFF                         * 729E4
        DAT1=C  A                                * 729EB
        A=DAT0  A                                * 729EE
        D0=D0+  5                                * 729F1
        PC=(A)                                   * 729F4
        RPL

* refs (2): 4045E 72FF7
OBJ_729F8:
        :: NOTROMPcase ROM-WORD?                 * 729F8
          OBJ_71DFF DROPFALSE                    * 72A07

Code_72A11:
          CODE                                   * 72A11  83 nibbles
            GOSBVL  SUB_71E57                    * 72A1B
            D1=D1-  6                            * 72A22
            A=DAT1  6                            * 72A25
            R2=A                                 * 72A29
            D1=C                                 * 72A2C
            D1=D1+  5                            * 72A2F
            C=DAT1  A                            * 72A32
            CD1EX                                * 72A35
            D1=D1+  5                            * 72A38
            A=DAT1  6                            * 72A3B
            D1=C                                 * 72A3F
            D=D+1   A                            * 72A42
            C=R2                                 * 72A44
            P=      6                            * 72A47
            ?C=A    WP                           * 72A49
            GOYES   L_72A4E                      * 72A4C
L_72A4E:
            P=      0                            * 72A4E
            LC(5)   TRUE                         * 72A50
            GOC     L_72A61                      * 72A57  never taken
            LC(5)   FALSE                        * 72A5A
L_72A61:
            DAT1=C  A                            * 72A61
            A=DAT0  A                            * 72A64
            D0=D0+  5                            * 72A67
            PC=(A)                               * 72A6A
          ENDCODE                                * 72A6E
        ;                                        * 72A6E

* refs (1): 2121A
OBJ_72A73:
        :: BINT33 #> COLAcase ;                  * 72A73

* refs (2): 097C0 72AF0
OBJ_72A8C:
        :: BEGIN DUP LASTRAM-WORD WHILE          * 72A8C
          :: DUP TYPERRP? ITE pgdir!(di) purge(_) * 72AA5
          ;                                      * 72AC3
          REPEAT DROP ;                          * 72AC8

* refs (1): 8554B
OBJ_72AD7:
        :: HOMEDIR SYSSTOPSIGN CONTEXT@ COLA OBJ_72A8C * 72AD7
        ;                                        * 72AF5

* refs (44): 1A025 1A034 5B31B 5B3C0 5B40B 5B46F ...
OBJ_72AFA:
        :: DUPTYPEROMP? NOT?SEMI                 * 72AFA
          DUP ROMPTR@ NOT?SEMI                   * 72B09
          SWAPDROP ;                             * 72B18

* refs (2): 8574A 85BA7
OBJ_72B22:
        CON(5)  (*)+5                            * 72B22  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 72B27
        D=D+1   A                                * 72B2A
        GOSBVL  SAVPTR                           * 72B2C
        D1=D1-  5                                * 72B33
        C=DAT1  A                                * 72B36
        D1=C                                     * 72B39
        D1=D1+  5                                * 72B3C
        A=DAT1  A                                * 72B3F
        D1=D1+  5                                * 72B42
        C=DAT1  A                                * 72B45
        ?C=0    A                                * 72B48
        GOYES   L_72B60                          * 72B4B
        P=      4                                * 72B4D
        GOSUB   SUB_72BA1                        * 72B4F
L_72B53:
        R0=C.F  A                                * 72B53
        GOVLNG  PUSH#LOOP                        * 72B59
L_72B60:
        C=0     A                                * 72B60
        C=C-1   A                                * 72B62
        D=C     A                                * 72B64
        LC(5)   CMOS                             * 72B66
        ?C>A    A                                * 72B6D
        GOYES   L_72B9B                          * 72B70
        D=D+1   A                                * 72B72
        D0=(5)  RAMEND                           * 72B74
        C=DAT0  A                                * 72B7B
        ?C>A    A                                * 72B7E
        GOYES   L_72B9B                          * 72B81
        D=D+1   A                                * 72B83
        D0=(5)  #8052F                           * 72B85
        C=DAT0  S                                * 72B8C
        ?C#0    S                                * 72B90
        GOYES   L_72B9B                          * 72B93
        D=D-CON A,2                              * 72B95
L_72B9B:
        C=D     A                                * 72B9B
        GOTO    L_72B53                          * 72B9D

* refs (1): 72B4F
SUB_72BA1:
        PC=C                                     * 72BA1
        RPL

* refs (1): 72BC3
OBJ_72BA5:
        :: RPTRACC ?SEMI                         * 72BA5
          SETROMPERR ;                           * 72BB4

* refs (1): 3A604
OBJ_72BBE:
        :: OBJ_72BA5 OBJ_72BD2 ;                 * 72BBE

* refs (2): 72BC8 8D24B
OBJ_72BD2:
        CON(5)  (*)+5                            * 72BD2  primitive code object
        ASSEMBLE
        GOSUBL  SUB_71E57                        * 72BD7
        A=DAT1  A                                * 72BDD
        D1=C                                     * 72BE0
        D1=D1+  5                                * 72BE3
        D=D+1   A                                * 72BE6
        GOSBVL  SAVPTR                           * 72BE8
        GOVLNG  PUSH#ALOOP                       * 72BEF

        CON(5)  (*)+5                            * 72BF6  primitive code object
        C=DAT1  A                                * 72BFB
        RSTK=C                                   * 72BFE
        D1=D1+  5                                * 72C00
        D=D+1   A                                * 72C03
        GOSBVL  POP#                             * 72C05
        GOSBVL  SAVPTR                           * 72C0C
        C=RSTK                                   * 72C13
        D1=C                                     * 72C15
        D1=D1+  10                               * 72C18
        D1=D1+  10                               * 72C1B
        C=DAT1  A                                * 72C1E
        D=C     A                                * 72C21
        B=C     A                                * 72C23
        B=B-1   A                                * 72C25
L_72C27:
        D1=D1+  5                                * 72C27
        C=DAT1  A                                * 72C2A
        ?C>=A   A                                * 72C2D
        GOYES   L_72C3C                          * 72C30
        B=B-1   A                                * 72C32
        GONC    L_72C27                          * 72C34
L_72C37:
        A=0     A                                * 72C37
        GOC     L_72C47                          * 72C39
L_72C3C:
        ?C>A    A                                * 72C3C
        GOYES   L_72C37                          * 72C3F
        C=D     A                                * 72C41
        C=C-B   A                                * 72C43
        A=C     A                                * 72C45
L_72C47:
        GOVLNG  PUSH#ALOOP                       * 72C47

        CON(5)  (*)+5                            * 72C4E  primitive code object
        A=DAT1  A                                * 72C53
        D1=D1+  5                                * 72C56
        D=D+1   A                                * 72C59
        GOSBVL  SAVPTR                           * 72C5B
        C=DAT1  A                                * 72C62
        D1=C                                     * 72C65
        D1=D1+  5                                * 72C68
        C=DAT1  A                                * 72C6B
        R0=C.F  A                                * 72C6E
        GOSBVL  SUB_07ED8                        * 72C74
        ?ST=0   1                                * 72C7B
        GOYES   L_72C93                          * 72C7E
        LC(5)   #800FF                           * 72C80
        R1=C.F  A                                * 72C87
        P=      0                                * 72C8D
        GOSUB   SUB_72CF2                        * 72C8F
L_72C93:
        D1=A                                     * 72C93
        D1=D1+  10                               * 72C96
        D1=D1+  10                               * 72C99
        C=DAT1  A                                * 72C9C
        A=R0.F  A                                * 72C9F
        ?C<A    A                                * 72CA5
        GOYES   L_72CF6                          * 72CA8
        A=A-1   A                                * 72CAA
        C=A     A                                * 72CAC
        C=C+C   A                                * 72CAE
        A=A+C   A                                * 72CB0
        A=A+A   A                                * 72CB2
        CD1EX                                    * 72CB4
        C=C+A   A                                * 72CB7
        D1=C                                     * 72CB9
        C=DAT1  W                                * 72CBC
        D1=(5)  IRAMBUFF                         * 72CC0
        DAT1=C  W                                * 72CC7
        GOSUB   SUB_72D01                        * 72CCB
        AD1EX                                    * 72CCF
        GOSBVL  SUB_07ED8                        * 72CD2
        GOC     L_72CF6                          * 72CD9
        ?ST=0   1                                * 72CDC
        GOYES   L_72CEB                          * 72CDF
        LA(5)   IRAMBUFF                         * 72CE1
L_72CEB:
        GOVLNG  L_0570D                          * 72CEB

* refs (1): 72C8F
SUB_72CF2:
        RSTK=C                                   * 72CF2
        RTN                                      * 72CF4
L_72CF6:
        GOSUB   SUB_72D01                        * 72CF6
        GOVLNG  GPOverWrFLp                      * 72CFA

* refs (2): 72CCB 72CF6
SUB_72D01:
        ?ST=0   1                                * 72D01
        RTNYES                                   * 72D04
        C=R1.F  A                                * 72D06
        P=      1                                * 72D0C
        RSTK=C                                   * 72D0E
        RTN                                      * 72D10
L_72D12:
        GOC     L_72D1A                          * 72D12
        CBIT=1  7                                * 72D15
L_72D1A:
        DAT1=C  B                                * 72D1A
        RTN                                      * 72D1D

* refs (2): 72D4E 72D67
SUB_72D1F:
        PC=C                                     * 72D1F
L_72D23:
        ?A=0    A                                * 72D23
        GOYES   L_72D9D                          * 72D26
        LC(5)   #800FF                           * 72D28
        CD0EX                                    * 72D2F
        DAT0=A  A                                * 72D32
        CAEX    A                                * 72D35
        CD1EX                                    * 72D37
        D0=D0-  5                                * 72D3A
        DAT0=C  A                                * 72D3D
        D0=D0-  5                                * 72D40
        C=RSTK                                   * 72D43
        DAT0=C  A                                * 72D45
        CD1EX                                    * 72D48
        D1=C                                     * 72D4B
        GOSUB   SUB_72D1F                        * 72D4E
        D0=A                                     * 72D52
        A=DAT0  A                                * 72D55
        ?A=0    A                                * 72D58
        GOYES   L_72D62                          * 72D5B
        CD0EX                                    * 72D5D
        A=A+C   A                                * 72D60
L_72D62:
        P=      1                                * 72D62
        CD1EX                                    * 72D64
        GOSUB   SUB_72D1F                        * 72D67
        D0=(5)  IRAMBUFF                         * 72D6B
        C=DAT0  A                                * 72D72
        RSTK=C                                   * 72D75
        LC(5)   DOEXT1                           * 72D77
        DAT0=C  A                                * 72D7E
        D0=D0+  5                                * 72D81
        C=DAT0  A                                * 72D84
        D1=C                                     * 72D87
        ?A=0    A                                * 72D8A
        RTNYES                                   * 72D8D
        DAT0=A  A                                * 72D8F
        D0=D0-  5                                * 72D92
        AD0EX                                    * 72D95
        D0=A                                     * 72D98
        RTNCC                                    * 72D9B
L_72D9D:
        A=DAT0  A                                * 72D9D
        ?A=0    A                                * 72DA0
        RTNYES                                   * 72DA3
        CD0EX                                    * 72DA5
        A=A+C   A                                * 72DA8
        D0=A                                     * 72DAA
        RTNCC                                    * 72DAD
        BSS     22                               * 72DAF

* refs (1): 2462C
OBJ_72DC5:
        CON(5)  (*)+5                            * 72DC5  primitive code object
        A=DAT1  A                                * 72DCA
        AD1EX                                    * 72DCD
        LC(5)   DOLAM                            * 72DD0
        DAT1=C  A                                * 72DD7
        D1=D1+  7                                * 72DDA
        C=DAT1  B                                * 72DDD
        D1=A                                     * 72DE0
        LA(2)   #8E                              * 72DE3
        ?C#A    B                                * 72DEA
        GOYES   L_72E0F                          * 72DED
        C=B     A                                * 72DEF
        CD0EX                                    * 72DF1
        D0=D0-  5                                * 72DF4
        D=D+1   A                                * 72DF7
        C=DAT0  A                                * 72DF9
        CD0EX                                    * 72DFC
        B=C     A                                * 72DFF
        LA(5)   OBJ_24681                        * 72E01
        PC=(A)                                   * 72E0B
L_72E0F:
        A=DAT0  A                                * 72E0F
        D0=D0+  5                                * 72E12
        PC=(A)                                   * 72E15
L_72E19:
        C=DAT1  A                                * 72E19
        RSTK=C                                   * 72E1C
        CD1EX                                    * 72E1E
        A=DAT1  A                                * 72E21
        D1=C                                     * 72E24
        LC(5)   DOROMP                           * 72E27
        ?C#A    A                                * 72E2E
        GOYES   L_72E41                          * 72E31
        LA(5)   OBJ_72E87                        * 72E33
        PC=(A)                                   * 72E3D
L_72E41:
        D1=D1+  5                                * 72E41
        C=RSTK                                   * 72E44
        A=B     A                                * 72E46
        AD0EX                                    * 72E48
        DAT0=A  A                                * 72E4B
        D0=D0+  5                                * 72E4E
        CD0EX                                    * 72E51
        B=C     A                                * 72E54
        D0=D0+  5                                * 72E56
        A=C     A                                * 72E59
        A=DAT0  A                                * 72E5B
        LC(5)   CK1&Dispatch                     * 72E5E
        ?C>A    A                                * 72E65
        GOYES   L_72E80                          * 72E68
        LC(5)   CK5&Dispatch                     * 72E6A
        ?C<A    A                                * 72E71
        GOYES   L_72E80                          * 72E74
        D0=D0+  5                                * 72E76
        GOVLNG  L_18F55                          * 72E79
L_72E80:
        GOVLNG  L_07152                          * 72E80
        RPL

* refs (1): 72E33
OBJ_72E87:
        :: ROMPTR@ NOTcase DoErrUXM              * 72E87
          EvalNoCK ;                             * 72E9B

* refs (1): 18F44
OBJ_72EA5:
        :: OBJ_18802 DUP PTR>ROMPTR OBJ_2699F case SETTYPEERR * 72EA5
          ROMPTR 0E8 00D ;                       * 72EC8

* refs (1): 3A256
OBJ_72ED8:
        ::                                       * 72ED8

Code_72EDD:
          CODE                                   * 72EDD  51 nibbles
            CD1EX                                * 72EE7
            RSTK=C                               * 72EEA
            D1=(5)  VDISP2                       * 72EEC
            A=DAT1  A                            * 72EF3
            LC(5)   #00122                       * 72EF6
            A=A+C   A                            * 72EFD
            D1=A                                 * 72EFF
            A=DAT1  1                            * 72F02
            LC(1)   #8                           * 72F06
            A=A!C   P                            * 72F09
            DAT1=A  1                            * 72F0D
            C=RSTK                               * 72F11
            D1=C                                 * 72F13
            GOTO    L_72E0F                      * 72F16
          ENDCODE                                * 72F1A
        ;                                        * 72F1A

* refs (1): 1FA43
OBJ_72F1F:
        :: CK&DISPATCH1                          * 72F1F
          BINT10 NOP                             * 72F29  name|local|algebraic
          BINT14 OBJ_72F89                       * 72F33  unit
          BINT5                                  * 72F3D  list
          :: '                                   * 72F42
            :: OBJ_1FA07 ABND ; 1GETLAM >HCOMP BINT1 FALSE ROMPTR 0E8 00F ; * 72F4C
        ;                                        * 72F84

* refs (2): 72F38 72FD9
OBJ_72F89:
        :: UMU> SWAP OBJ_5A9F5 DUPUNROT TYPEREAL? case UM>U * 72F89
          BINT2 SINNERMETA Cr x* ;               * 72FB1

* refs (1): 5AA9A
OBJ_72FCA:
        :: CK&DISPATCH0                          * 72FCA
          BINT14 OBJ_72F89                       * 72FD4  unit
          BINT0 NOP                              * 72FDE  any
        ;                                        * 72FE8

* refs (1): 6BE0C
OBJ_72FED:
        :: DUP OBJ_729F8 ?SKIP OBJ_72AFA         * 72FED
          DUPTYPECSTR? ;                         * 73006

* refs (1): 28B78
OBJ_73010:
        :: BINT27 TestSysFlag case OBJ_28BAF     * 73010
          COLA OBJ_73038                         * 73029
        ;                                        * 73033

* refs (1): 7302E
OBJ_73038:
        ::                                       * 73038

{{}}_7303D:
          { {}_600F3 } >R >R BEGIN OBJ_73088 DUP {}_600F3 EQ NOT_WHILE * 7303D
          OBJ_28BFF REPEAT DROP ;                * 73074
