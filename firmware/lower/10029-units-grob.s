* HP 48GX ROM revision R, #10029-#12001: Unit arithmetic and graphics objects
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: umEND GROB! um/ um^ umP MAKEGROB um* SUBGROB $>grob PrgmEntry? $>GROB w->W
* Follows on from the previous file (at #10029 in the original ROM).
        RPL

* ob1..ob4 -> T
* refs (1): 104FF
4DROPTRUE:
        :: 4DROP TRUE ;                          * 10029

* refs (5): 0F601 0F61A 0F846 0F891 0FBB5
dup;uo=>r:
        :: DUP                                   * 1003D

* u -> %
* refs (16): 0F570 0F57A 0F7BA 0F7C4 1DFAD 33D6E ...
U>nbr:
          :: DUPTYPEEXT? case CARCOMP            * 10047
          ;                                      * 1005B
        ;                                        * 10060

* u % -> u'
* refs (14): 0F3D0 0F60B 0F624 0F6B6 0F788 0FBCE ...
Unbr>U:
        :: OVER TYPEEXT? NOTcase SWAPDROP        * 10065
          SWAP UM>U ;                            * 1007E

* refs (5): 0F33F 0F7D3 0F7E2 0F9C7 10BB4
units(uo)=>(_,s):
        :: DUPTYPEEXT? case OBJ_100B5            * 1008D
          DROP tok1 BINT1 ;                      * 100A1

* refs (1): 1009C
OBJ_100B5:
        :: INNERCOMP SWAPDROP dup;drop(s) #2- ;  * 100B5

* refs (5): 0F344 0F819 0F869 0F8E6 0FA44
->unit(_,s):
        :: BINT0 over;=?:drq ' umEND SWAP #2+ EXTN ; * 100D3

* refs (4): 0F7D8 0F7E7 0F9CC 10BB9
OBJ_10100:
        :: OVER um/ EQ NOTcase BINT0             * 10100
          SWAPDROP#1- OBJ_1013C DUPUNROT #-OVER #2+UNROLL ; * 1011E

* refs (1): 10123
OBJ_1013C:
        CON(5)  (*)+5                            * 1013C  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 10141
        B=0     A                                * 10148
        D=0     A                                * 1014A
        D=D+1   A                                * 1014C
L_1014E:
        B=B+1   A                                * 1014E
        D1=D1+  5                                * 10150
        A=DAT1  A                                * 10153
        D0=A                                     * 10156
        A=DAT0  A                                * 10159
        LC(5)   DOCSTR                           * 1015C
        ?C=A    A                                * 10163
        GOYES   L_10184                          * 10166
        LC(5)   DOCHAR                           * 10168
        ?C=A    A                                * 1016F
        GOYES   L_10184                          * 10172
        LC(5)   DOREAL                           * 10174
        ?C=A    A                                * 1017B
        GOYES   L_10184                          * 1017E
        D=D+1   A                                * 10180
        D=D+1   A                                * 10182
L_10184:
        D=D-1   A                                * 10184
        ?D#0    A                                * 10186
        GOYES   L_1014E                          * 10189
        A=B     A                                * 1018B
        GOVLNG  PUSH#ALOOP                       * 1018D
        RPL

* refs (4): 0F80F 0F85F 0F8B9 0FA3A
OBJ_10194:
        :: OBJ_101CB OBJ_10324 psh OBJ_101CB OBJ_10324 OBJ_10478 OBJ_106DF * 10194
          psh OBJ_106DF ;                        * 101BC

* refs (2): 10199 101A8
OBJ_101CB:
        ::                                       * 101CB

* refs (3): 1021B 106EE 10748
{}:
          { } SWAP #2+ DUPROLL BEGIN OBJ_10202 UNTIL #2- ; * 101D0

* refs (1): 101EE
OBJ_10202:
        :: REQcase um*                           * 10202
          OBJ_10310 REQcasedrop {}               * 10211
          TRUE tok1 OVER EQUALcase OBJ_102D9     * 10220
          DUPTYPECSTR? ITE                       * 10239
          :: NULL$ SWAPROT #1+ ;                 * 10243
          :: SWAP dup;roll(s);swap dup;drop(s) #1- ; * 1025C
          DUPROLL dREALNcase                     * 1027A
          :: %1 ROT#1+ ROT FALSE ;               * 10284
          DUP%0= ITE                             * 102A2
          :: DROPSWAPDROP SWAPDROP #3- ; SWAP    * 102AC
          DUPROLL OBJ_10310 ;                    * 102CA

* refs (1): 10234
OBJ_102D9:
        :: drop;1-(s);dup;roll(s) dREALNcase FALSE * 102D9
          drop;1-(s);dup;roll(s) OBJ_10310 ;     * 102ED

* refs (3): 102DE 102ED 10315
drop;1-(s);dup;roll(s):
        :: DROP#1- DUPROLL ;                     * 102FC

* refs (3): 10211 102CF 102F2
OBJ_10310:
        :: drop;1-(s);dup;roll(s) FALSE ;        * 10310

* refs (2): 1019E 101AD
OBJ_10324:
        :: BINT5 BEGIN 2DUP#> WHILE              * 10324
          :: pick3(s-3) 4PICK #4+ BEGIN OBJ_10374 UNTIL ; REPEAT DROP ; * 1033D

* refs (1): 10356
OBJ_10374:
        :: #3+ 6PICK BINT7 #+OVER #> NOTcase     * 10374
          :: 4DROP #3+ TRUE ;                    * 10397
          DUPDUP PICK 5PICK EQUAL NOTcsdrpfls PICK 5PICK 3PICK PICK * 103B0
          UNROTOVER EQUALNOT case2drpfls DROP    * 103DD
          5ROLL 5ROLL 2DROP ROT %+ SWAP #4- dup;drop(s) BINT2 #-UNROLL * 103F1
          dup;drop(s) DUPONE #-ROLL DROPDUP BINT2 #-ROLL DROPSWAP #3- * 10423
          SWAPTRUE ;                             * 1044B

* refs (2): 10342 1049B
pick3(s-3):
        :: DUPPICK OVER PICK 3PICK PICK ;        * 10455

* refs (1): 101B2
OBJ_10478:
        :: BINT2 BEGIN 2DUP#> WHILE              * 10478
          :: #3+ pick3(s-3) 5PICK BINT7 #+ BEGIN OBJ_104D2 UNTIL ; REPEAT * 10491
          DROP ;                                 * 104C8

* refs (1): 104B4
OBJ_104D2:
        :: 6PICK BINT7 #+PICK 7PICK #+ #5+ OVER#> NOTcase 4DROPTRUE * 104D2
          #3+ DUPDUP PICK 5PICK EQUAL NOTcsdrpfls PICK 5PICK 3PICK PICK * 10504
          UNROTOVER EQUALNOT case2drpfls DROP    * 10536
          5ROLL 5ROLL DROPOVER 5PICK %= case OBJ_10680 * 1054A
          OVER5PICK %< case OBJ_105EA            * 1056D
          3PICK ROLLDROP 3PICK BINT1 #-UNROLL ROT %- SWAP #4- dup;drop(s) * 10581
          BINT2 #-UNROLL                         * 105B3
L_105BD:
          dup;drop(s) #1- dup;drop(s) #1- dup;drop(s) #1-SWAP #3- SWAPTRUE ; * 105BD

* refs (1): 1057C
OBJ_105EA:
        :: ROT dup;drop(s) #1- dup;drop(s) BINT2 #-ROLL DROP 5PICK BINT6 * 105EA
          #+ROLL #3- 6PICK BINT6 #+UNROLL 4PICK BINT3 #+ROLL DROP 4PICK * 1061C
          #2+UNROLL %- OVER BINT1 #-ROLL DROPOVER BINT2 #-UNROLL TRUE ; * 1064E

* refs (1): 10568
OBJ_10680:
        :: 2DROP SWAPDROP #3- dup;drop(s) #1- dup;drop(s) BINT2 #-ROLL * 10680
          DROPOVER BINT3 #+ROLL #3- 3PICK BINT3 #+UNROLL GOTO L_105BD ; * 106AD

* refs (2): 101B7 101C1
OBJ_106DF:
        :: DUP#0= ?SEMI                          * 106DF
          {} SWAP #2+ OBJ_10739 DROP BEGIN OBJ_10739 WHILE * 106EE

{};swap;1+(s):
          :: um* SWAP#1+ ; REPEAT #2- ;          * 10716

* refs (2): 106FD 1070C
OBJ_10739:
        :: DUPROLL REQcasedrop {}                * 10739
          FALSE DUPTYPECSTR? ITE                 * 1074D
          :: DROP#1- dup;roll(s);swap ;          * 1075C
          :: SWAP dup;roll(s);swap umP SWAP#1+ ; * 10770
          DUPROLL REQcasedrop %1                 * 1078E

1-(s);true:
          :: #1- TRUE ; SWAP um^ SWAP#1+ TRUE ;  * 1079D

* refs (18): 100C4 1026B 10414 10423 105AE 105BD ...
dup;drop(s):
        :: DUP ROLL DROP ;                       * 107CA

* refs (4): 0F7F6 0F805 0F9FE 0FA0D
OBJ_107E3:
        :: BINT0 over;=?:drq OBJ_108C9 case2DROP get1 * 107E3
          BINT0 over;=?:drq BINT1 OVER #<>case   * 10801

+(2s);1+(s);{};swap:
          :: #+ um* SWAP#1+ ;                    * 1081A
          DROPDUP #2+PICK tok1 EQUALNOTcase      * 10833

{};swap;2+(s):
          :: um* SWAP #2+ ;                      * 10847
          get1 DROP ;                            * 10860

* refs (4): 0F814 0F864 0F8E1 0FA3F
OBJ_1086F:
        :: BINT0 over;=?:drq OBJ_108C9 case2DROP get1 * 1086F
          DUP#0<> ?SKIP                          * 1088D
          :: DROP tok1 OVER#2+UNROL BINT1 ;      * 10897
          #+ um/ SWAP#1+ ;                       * 108B5

* refs (2): 107F2 1087E
OBJ_108C9:
        :: DUP #1<> caseFALSE OVER               * 108C9
          tok1 EQUAL ;                           * 108E2

* refs (4): 0F8BE 0F8C8 0F9D1 0F9DB
OBJ_108F1:
        :: DUP#0= ?SEMI                          * 108F1
          2GETLAM %ABS DUP%0= casedrop           * 10900
          :: NDROP BINT0 1GETLAM caseSIZEERR ;   * 10914
          DUP %1 %= caseDROP BINT4               * 10932
          BEGIN 3PICK #4+ OVER#> WHILE           * 1094B
          :: DUPPICK OBJ_1098C #1+ ; REPEAT 2DROP ; * 10964

* refs (1): 1096E
OBJ_1098C:
        :: REQcase um*                           * 1098C
          DROP REQcasedrop um^                   * 1099B
          OBJ_109D7 REQcasedrop umP              * 109AA
          OBJ_10A45 tok1 EQUAL ?SEMI             * 109B9
          OBJ_10A59 ;                            * 109CD

* refs (1): 109AA
OBJ_109D7:
        :: #1+DUP ROLL 3PICK 1GETLAM ITE %/ %*   * 109D7
          %1 EQcasedrop OBJ_10AA4                * 109FF
          %0_2A2B4 EQcasedrop OBJ_10BC3          * 10A0E
          OVER UNROLL #1+DUP PICK TYPECSTR? ?SEMI * 10A1D
          #2+ ;                                  * 10A3B

* refs (1): 109B9
OBJ_10A45:
        :: OBJ_10A59 #2+ ;                       * 10A45

* refs (2): 109CD 10A4A
OBJ_10A59:
        :: OVER 1GETLAM IT %1/                   * 10A59
          OVER UNROLL um^ OVER UNROLL ROT #2+ 3UNROLL #2+ ; * 10A72

* refs (1): 10A09
OBJ_10AA4:
        :: #1- dup;drop(s) ROT #2- UNROTDUP PICK TYPECSTR? ?SEMI * 10AA4
          #2+ ;                                  * 10AD1

* ob meta1 meta2 -> meta1 meta2 ob
* refs (1): 0F7DD
UobROT:
        :: DUP#2+PICK OVER#+ BINT3 #+ROLL ;      * 10ADB

* meta1 meta2 ob -> ob meta1 meta2
* refs (1): 0FA35
unrot1:
        :: OVER #3+PICK 3PICK#+ BINT3 #+UNROLL ; * 10AF9

* refs (1): 0F0CA
OBJ_10B1C:
        CON(5)  (*)+5                            * 10B1C  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 10B21
        CD1EX                                    * 10B24
        RSTK=C                                   * 10B27
        D1=D1+  5                                * 10B29
        A=DAT1  B                                * 10B2C
        LC(2)   #4B                              * 10B2F
        ?C#A    B                                * 10B33
        GOYES   L_10B3F                          * 10B36
        LC(2)   #6B                              * 10B38
        GONC    L_10B4C                          * 10B3C
L_10B3F:
        LC(2)   #48                              * 10B3F
        ?C#A    B                                * 10B43
        GOYES   L_10B4F                          * 10B46
        LC(2)   #68                              * 10B48
L_10B4C:
        DAT1=C  B                                * 10B4C
L_10B4F:
        C=RSTK                                   * 10B4F
        D1=C                                     * 10B51
        A=DAT0  A                                * 10B54
        D0=D0+  5                                * 10B57
        PC=(A)                                   * 10B5A
        RPL

* * marker
* refs (46): 0F2B3 0FEA8 1020C 1071B 10824 1084C ...
um*:
        { }                                      * 10B5E

* / marker
* refs (90): 0F2D6 0FEB7 1010A 108BA 28E07 A0FB9 ...
um/:
        { }                                      * 10B68

* ^ marker
* refs (60): 0F2F9 0FED5 107B6 109A5 10A7C 28FEC ...
um^:
        { }                                      * 10B72

* Char prefix operator
* refs (54): 0F0D4 0F28B 0FA75 0FEC6 1077F 109B4 ...
umP:
        { }                                      * 10B7C

* Unit end operator
* refs (208): 0F129 0FA7A 0FA9A 0FABA 0FADA 0FAFA ...
umEND:
        { }                                      * 10B86

* refs (1): 0F638
OBJ_10B90:
        :: U>NCQ ROMPTR 0C1 022 %%* ;            * 10B90

* refs (2): 0F855 0F8B4
OBJ_10BAF:
        :: units(uo)=>(_,s) OBJ_10100 ;          * 10BAF

* refs (1): 10A18
OBJ_10BC3:
        :: #1- dup;drop(s) DUPROLL TYPECSTR? ITE * 10BC3
          :: ROT #3- ;                           * 10BE1
          :: dup;drop(s) dup;drop(s) ROT #5- ;   * 10BF5
          3UNROLL #1- ;                          * 10C13

* refs (1): 0FEAD
OBJ_10C22:
        :: 4ROLLROT %%*UNROT OBJ_0F73D ;         * 10C22

* refs (1): 0FEBC
OBJ_10C3B:
        :: 4ROLLROT %%/ 3UNROLL OBJ_0F756 ;      * 10C3B

* refs (1): 0FEDA
OBJ_10C59:
        :: %>%% ROTOVER %%^ 3UNROLL SWAPCKREF ONE_DO_ARRY INDEX@ PULLLONGEL * 10C59
          3PICK %%* INDEX@ PUTEL NextInArray SWAPDROP ; * 10C86

* refs (2): 0FECB 0FF57
OBJ_10CA9:
        :: 3UNROLL %%*SWAP TOTEMPOB ;            * 10CA9

* refs (1): 0FEE9
OBJ_10CC2:
        :: ROT %>%% 3UNROLL ;                    * 10CC2
        ASSEMBLE

* refs (1): 0C44D
SUB_10CDB:
        P=      0                                * 10CDB
        R0=A                                     * 10CDD
        LC(5)   #000B9                           * 10CE0
        GOSBVL  GETTEMP                          * 10CE7
        AD0EX                                    * 10CEE
        D0=A                                     * 10CF1
        LC(5)   DOARRY                           * 10CF4
        DAT0=C  A                                * 10CFB
        D0=D0+  5                                * 10CFE
        LC(5)   #000B4                           * 10D01
        DAT0=C  A                                * 10D08
        D0=D0+  5                                * 10D0B
        LC(5)   DOREAL                           * 10D0E
        DAT0=C  A                                * 10D15
        D0=D0+  5                                * 10D18
        LC(5)   #00001                           * 10D1B
        DAT0=C  A                                * 10D22
        D0=D0+  5                                * 10D25
        LC(5)   portnotaverr                     * 10D28
        DAT0=C  A                                * 10D2F
        D0=D0+  5                                * 10D32
        AR0EX                                    * 10D35
        LC(1)   #9                               * 10D38
        D=C     P                                * 10D3B
L_10D3E:
        C=0     W                                * 10D3E
        C=A     P                                * 10D41
        A=A+A   P                                * 10D44
        GONC    L_10D56                          * 10D47
        C=-C    P                                * 10D4A
        CSRC                                     * 10D4D
        LC(1)   #9                               * 10D50
        GOC     L_10D59                          * 10D53
L_10D56:
        CSRC                                     * 10D56
L_10D59:
        CSRC                                     * 10D59
        DAT0=C  W                                * 10D5C
        D0=D0+  16                               * 10D60
        ASR     W                                * 10D63
        D=D-1   P                                * 10D66
        GONC    L_10D3E                          * 10D69
        A=R0                                     * 10D6C
        P=      0                                * 10D6F
        GOVLNG  GETPTR                           * 10D71
        RPL

* refs (1): 0F94A
OBJ_10D78:
        { 1_kg 1_m 1_A 1_s 1_K 1_cd 1_mol        * 10D78

'1_r':
          UNIT %1                                * 10DA0

r:
            $ "r" umEND ;                        * 10DAA

'1_sr':
          UNIT %1                                * 10DC0

sr:
            $ "sr" umEND ;                       * 10DCA
          1_? }                                  * 10DE2

'1_°R':
        UNIT %1                                  * 10DEC

°R:
          $ "°R" umEND ;                         * 10DF6

* refs (1): 0F67E
OBJ_10E0E:
        CON(5)  (*)+5                            * 10E0E  primitive code object
        ASSEMBLE
        GOSBVL  SUB_2A060                        * 10E13
        ST=0    9                                * 10E1A
        ST=0    4                                * 10E1D
        GOSBVL  SUB_2B6F2                        * 10E20
        GOVLNG  L_2AECC                          * 10E27
        BSS     8                                * 10E2E
        RPL

* -> {}
* refs (9): 49149 93C32 C7E65 C8124 C907D C972F ...
8NULLLAM{}:
        { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM } * 10E36

* 0.555...
* refs (6): 0F448 0F489 0F52E 0FC8C CD6FF CD740
cfF:
        %% 5.55555555555556E-1                   * 10E68

* 1
* refs (7): 0F434 0F4CA 0F51A 0FC78 CD6B4 CD6DC ...
cfC:
        %% 1E0                                   * 10E82

* 273.15
* refs (3): 0F4B1 0F524 0FC82
%%KZERO:
        %% 2.7315E2                              * 10E9C

* 459.67
* refs (3): 0F4FC 0F538 0FC96
%%RZERO:
        %% 4.5967E2                              * 10EB6

%%1.31E2:
        %% 1.31E2                                * 10ED0

* Error B01h
* refs (3): 0FF7A 0FF9D 0FFCF
INVUNITERR:
        CON(5)  (*)+5                            * 10EEA  primitive code object
        ASSEMBLE
        LC(5)   #00B01                           * 10EEF
        GOTO    L_10F06                          * 10EF6

* Error B02h
* refs (4): 0F71F 0FBF1 CAC31 CAC86
CONSTUNITERR:
        CON(5)  (*)+5                            * 10EFA  primitive code object
        LC(5)   constuniterr                     * 10EFF
L_10F06:
        A=C     A                                * 10F06
        GOVLNG  Errjmp                           * 10F08
        NIBHEX  4DA7000                          * 10F0F  Ôz.

LIB001:
        CON(3)  #001                             * 10F16  library number
        CON(5)  0                                * 10F19  hash table
        REL(5)  LIB001.message                   * 10F1E  message table
        CON(5)  0                                * 10F23  link table
        REL(5)  ChkUserKeys                      * 10F28  config
L_10F2D:
        LC(3)   #103                             * 10F2D
        GOSBVL  SUB_53B0A                        * 10F32
        LC(5)   #00101                           * 10F39

* A=C.A <REF>GETPTR <REF>Errjmp
* refs (7): 29EB7 3167D 31F34 323ED 7D932 87800 ...
GPErrjmpC:
        SETHEX                                   * 10F40
        A=C     A                                * 10F42
        P=      0                                * 10F44
        GOSBVL  GETPTR                           * 10F46
L_10F4D:
        GOVLNG  Errjmp                           * 10F4D

* Error 102h
* refs (1): 42C33
NULLCHARERR:
        CON(5)  (*)+5                            * 10F54  primitive code object

* refs (1): 10F54
DoErrCEN:
        LC(5)   #00102                           * 10F59
        GOTO    ErrjmpC                          * 10F60

* Error 103h
* refs (6): 1F6B8 5DEC8 5DEE1 D1814 D1837 D187D
INVFUNCERR:
        CON(5)  (*)+5                            * 10F64  primitive code object
        LC(5)   #00103                           * 10F69
        GOTO    ErrjmpC                          * 10F70

* Error 104h
* refs (5): 1537A 1573A 49CE5 4A0A0 8AAFF
NOEQERR:
        CON(5)  (*)+5                            * 10F74  primitive code object

* refs (1): 10F74
DoErrNCE:
        LC(5)   #00104                           * 10F79

* A=C.A <REF>Errjmp
* refs (19): 10F60 10F70 10F92 10FA2 10FB2 10FC2 ...
ErrjmpC:
        A=C     A                                * 10F80
        GOTO    L_10F4D                          * 10F82

* Error 106h
* refs (2): 14150 689D1
SYNTAXERR:
        CON(5)  (*)+5                            * 10F86  primitive code object

* refs (1): 10F86
DoErrIS:
        LC(5)   #00106                           * 10F8B
        GOTO    ErrjmpC                          * 10F92

* Error 12Eh
* refs (2): 4B7CE 514CD
SETINVPPAR:
        CON(5)  (*)+5                            * 10F96  primitive code object

* refs (1): 10F96
DoErrIP:
        LC(5)   #0012E                           * 10F9B
        GOTO    ErrjmpC                          * 10FA2

* Error 12Fh
* refs (1): 53600
SETNONERAL:
        CON(5)  (*)+5                            * 10FA6  primitive code object

* refs (1): 10FA6
DoErrNR:
        LC(5)   #0012F                           * 10FAB
        GOTO    ErrjmpC                          * 10FB2

* Error 130h
* refs (2): 572D4 572ED
SETISOLERR:
        CON(5)  (*)+5                            * 10FB6  primitive code object
        LC(5)   #00130                           * 10FBB
        GOTO    ErrjmpC                          * 10FC2

* Error 126h
* refs (3): 1438C 1454C DD830
NOHALTERR:
        CON(5)  (*)+5                            * 10FC6  primitive code object

* refs (1): 10FC6
DoErrHNA:
        LC(5)   #00126                           * 10FCB
        GOTO    ErrjmpC                          * 10FD2

* refs (3): 146BD 14834 1A30D
kill:
        CON(5)  (*)+5                            * 10FD6  primitive code object

* refs (1): 10FD6
Kill:
        LC(5)   #00123                           * 10FDB
        GOTO    ErrjmpC                          * 10FE2

* Error 124h
* refs (1): 3DE77
LASTSTKERR:
        CON(5)  (*)+5                            * 10FE6  primitive code object
        LC(5)   #00124                           * 10FEB
        GOTO    ErrjmpC                          * 10FF2

* Error 125h
LASTCMDERR:
        CON(5)  (*)+5                            * 10FF6  primitive code object
        LC(5)   #00125                           * 10FFB
        GOTO    ErrjmpC                          * 11002

* Error 128h
* refs (18): 1F78A 1F893 1F8BB 1F901 56DE2 5DEC3 ...
ARGNUMERR:
        CON(5)  (*)+5                            * 11006  primitive code object
        LC(5)   #00128                           * 1100B
        GOTO    ErrjmpC                          * 11012

* Error 129h
* refs (4): 15522 40F31 9E711 B4CB9
SETCIRCERR:
        CON(5)  (*)+5                            * 11016  primitive code object

* refs (1): 11016
DoErrCR:
        LC(5)   #00129                           * 1101B
        GOTO    ErrjmpC                          * 11022

* Error 12Ah
* refs (2): 18509 B9D49
DIRARGERR:
        CON(5)  (*)+5                            * 11026  primitive code object

* refs (1): 11026
DoErrDNA:
        LC(5)   #0012A                           * 1102B
        GOTO    ErrjmpC                          * 11032

* Error 12Bh
* refs (1): 18617
EMPTYDIRERR:
        CON(5)  (*)+5                            * 11036  primitive code object

* refs (1): 11036
DoErrNED:
        LC(5)   #0012B                           * 1103B
        GOTO    ErrjmpC                          * 11042

* Error 12Ch
* refs (4): 20DB5 20EC0 20EED 84E54
INVDEFERR:
        CON(5)  (*)+5                            * 11046  primitive code object

* refs (1): 11046
DoErrID:
        LC(5)   #0012C                           * 1104B
        GOTO    ErrjmpC                          * 11052

* Error 12Dh
* refs (1): 1CFE9
MISLIBERR:
        CON(5)  (*)+5                            * 11056  primitive code object

* refs (1): 11056
DoErrML:
        LC(5)   #0012D                           * 1105B
        GOTO    ErrjmpC                          * 11062

* Error 13Ch
* refs (1): 5A1DA
IDCONFERR:
        CON(5)  (*)+5                            * 11066  primitive code object

* refs (1): 11066
DoErrNC:
        LC(5)   #0013C                           * 1106B
        GOTO    ErrjmpC                          * 11072

* refs (1): 1A8C5
cont:
        CON(5)  (*)+5                            * 11076  primitive code object

* refs (1): 11076
Cont:
        LC(5)   #0013E                           * 1107B
        GOTO    ErrjmpC                          * 11082
        RPL

* refs (1): 10F16
ChkUserKeys:
        :: 'idUserKeys. RclHiddenVar NOTcase NoUserKeys * 11086
          'idUserKeys RclHiddenVar NOTcasedrop NoUserKeys * 1109F
          DUPUNROT OCRC SWAPDROP EQUAL NOTcasedrop NoUserKeys * 110B3
          UserKeys! ;                            * 110D1

* refs (3): 1109A 110AE 110CC
NoUserKeys:
        :: NULL{} StoUserKeys ;                  * 110DB

* refs (1): 3B5A0
OBJ_110EF:
        CON(5)  (*)+5                            * 110EF  primitive code object
        ASSEMBLE
        GOSUB   SUB_11186                        * 110F4
        GOSUB   SUB_11156                        * 110F8
        GOSUB   SUB_111D6                        * 110FC
        GOC     L_11107                          * 11100
        GOSUB   SUB_11156                        * 11103
L_11107:
        A=A+1   A                                * 11107
        D0=D0-  2                                * 11109
        GOSUB   SUB_1120D                        * 1110C
        GOC     L_11138                          * 11110
        A=A-1   A                                * 11113
        D0=D0+  2                                * 11115
        C=DAT0  B                                * 11118
        B=C     B                                * 1111B
        LC(2)   #45                              * 1111E
        ?B#C    B                                * 11122
        GOYES   L_1114F                          * 11125
        ?A=0    A                                * 11127
        GOYES   L_1114F                          * 1112A
        A=A+1   A                                * 1112C
        D0=D0+  2                                * 1112E
        GOSUB   SUB_1120D                        * 11131
        GONC    L_1114F                          * 11135
L_11138:
        R0=A                                     * 11138
        GOSBVL  PUSH#                            * 1113B
        LC(5)   FalseTrue                        * 11142
        A=C     A                                * 11149
        PC=(A)                                   * 1114B
L_1114F:
        GOVLNG  GPPushFLoop                      * 1114F

* refs (2): 110F8 11103
SUB_11156:
        LC(2)   #2B                              * 11156
        ?B=C    B                                * 1115A
        GOYES   L_1115F                          * 1115D
L_1115F:
        LC(2)   #2D                              * 1115F
        GOC     L_1116F                          * 11163  never taken
        ?B#C    B                                * 11166
        RTNYES                                   * 11169
        LC(2)   #2B                              * 1116B
L_1116F:
        DAT0=C  B                                * 1116F
        GOSBVL  GETPTR                           * 11172
        LC(5)   TrueTrue                         * 11179
        A=C     A                                * 11180
        PC=(A)                                   * 11182

* refs (2): 110F4 11244
SUB_11186:
        GOSBVL  SAVPTR                           * 11186
        D0=(5)  #8084F                           * 1118D
        C=DAT0  1                                * 11194
        ?CBIT=1 2                                * 11198
        GOYES   L_111A6                          * 1119D
        LC(2)   #2E                              * 1119F
        GONC    L_111AA                          * 111A3
L_111A6:
        LC(2)   #2C                              * 111A6
L_111AA:
        D=C     B                                * 111AA
        D0=(5)  TEMPENV                          * 111AD
        A=DAT0  A                                * 111B4
        D0=(5)  CURSOR                           * 111B7
        C=DAT0  A                                * 111BE
        B=C     A                                * 111C1
        C=C+1   A                                * 111C3
        C=C+C   A                                * 111C5
        C=A-C   A                                * 111C7
        A=B     A                                * 111C9
        D0=C                                     * 111CB
        C=DAT0  B                                * 111CE
        B=C     B                                * 111D1
        RTN                                      * 111D4

* refs (2): 110FC 11248
SUB_111D6:
        ST=0    0                                * 111D6
        GOTO    L_111E0                          * 111D9

* refs (1): 11287
SUB_111DD:
        ST=1    0                                * 111DD
L_111E0:
        ?ST=0   0                                * 111E0
        GOYES   L_111EE                          * 111E3
        A=A+1   A                                * 111E5
        D0=D0-  2                                * 111E7
        GOTO    L_111F6                          * 111EA
L_111EE:
        D0=D0+  2                                * 111EE
        A=A-1   A                                * 111F1
        RTNC                                     * 111F3
L_111F6:
        GOSUB   SUB_1120D                        * 111F6
        GOC     L_111E0                          * 111FA
        LC(2)   #0A                              * 111FD
        ?B=C    B                                * 11201
        RTNYES                                   * 11204
        ?B=0    B                                * 11206
        RTNYES                                   * 11209
        RTN                                      * 1120B

* refs (5): 1110C 11131 111F6 11276 11297
SUB_1120D:
        C=DAT0  B                                * 1120D
        B=C     B                                * 11210
        C=D     B                                * 11213
        ?B=C    B                                * 11216
        RTNYES                                   * 11219
        LC(2)   #30                              * 1121B
        ?B>=C   B                                * 1121F
        GOYES   L_11226                          * 11222
        RTN                                      * 11224
L_11226:
        LC(2)   #39                              * 11226
        ?B<=C   B                                * 1122A
        RTNYES                                   * 1122D
        RTN                                      * 1122F
        RPL

* refs (1): 112A8
_1E_:
        $ "1E"                                   * 11231

* refs (1): 3B60E
OBJ_1123F:
        CON(5)  (*)+5                            * 1123F  primitive code object
        ASSEMBLE
        GOSUB   SUB_11186                        * 11244
        GOSUB   SUB_111D6                        * 11248
        GOC     L_11271                          * 1124C
        GOSUB   SUB_112C5                        * 1124F
        GOSUB   SUB_112D8                        * 11253
        GONC    L_11271                          * 11257
        D0=D0+  2                                * 1125A
        A=A-1   A                                * 1125D
        GOC     L_1126C                          * 1125F
        C=DAT0  B                                * 11262
        B=C     B                                * 11265
        GOSUB   SUB_112C5                        * 11268
L_1126C:
        D0=D0-  2                                * 1126C
        A=A+1   A                                * 1126F
L_11271:
        A=A+1   A                                * 11271
        D0=D0-  2                                * 11273
        GOSUB   SUB_1120D                        * 11276
        GOC     L_11287                          * 1127A
        GOSUB   SUB_112D8                        * 1127D
        GOC     L_11287                          * 11281
        GONC    L_1128B                          * 11284
L_11287:
        GOSUB   SUB_111DD                        * 11287
L_1128B:
        GOSUB   SUB_112C5                        * 1128B
        D0=D0+  2                                * 1128F
        A=A-1   A                                * 11292
        GOC     L_112A8                          * 11294
        GOSUB   SUB_1120D                        * 11297
        GONC    L_112A8                          * 1129B
        LC(5)   CHR_E                            * 1129E
        GOC     L_112AF                          * 112A5
L_112A8:
        LC(5)   _1E_                             * 112A8
L_112AF:
        RSTK=C                                   * 112AF
        A=A+1   A                                * 112B1
        R0=A                                     * 112B3
        GOSBVL  PUSH#                            * 112B6
        C=RSTK                                   * 112BD
        A=C     A                                * 112BF
        PC=(A)                                   * 112C1

* refs (3): 1124F 11268 1128B
SUB_112C5:
        LC(2)   #45                              * 112C5
        ?B#C    B                                * 112C9
        RTNYES                                   * 112CC
        LC(5)   NULL$                            * 112CE
        GONC    L_112AF                          * 112D5

* refs (2): 11253 1127D
SUB_112D8:
        LC(2)   #2B                              * 112D8
        ?B=C    B                                * 112DC
        RTNYES                                   * 112DF
        LC(2)   #2D                              * 112E1
        ?B=C    B                                * 112E5
        RTNYES                                   * 112E8
        RTN                                      * 112EA

* refs (3): 17D91 3861F 53856
DelLastArg:
        CON(5)  (*)+5                            * 112EC  primitive code object
        LC(5)   LASTARG                          * 112F1
        A=0     W                                * 112F8
        CD0EX                                    * 112FB
        DAT0=A  15                               * 112FE
        D0=D0+  15                               * 11302
        DAT0=A  10                               * 11305
        D0=(5)  LASTARGCOUNT                     * 11309
        DAT0=A  B                                * 11310
        D0=C                                     * 11313
        A=DAT0  A                                * 11316
        D0=D0+  5                                * 11319
        PC=(A)                                   * 1131C

* ->
* refs (1): 17B95
ClrBusyAnn:
        CON(5)  (*)+5                            * 11320  primitive code object
        LC(2)   #80                              * 11325
        GOTO    L_11390                          * 11329

* ->
* refs (3): 3FD3B 3FD68 3FD95
SetAlphaAnn:
        CON(5)  (*)+5                            * 1132D  primitive code object
        LC(2)   #40                              * 11332
        GOTO    L_1137B                          * 11336

* ->
* refs (3): 3FCB4 3FCE1 3FD0E
ClrAlphaAnn:
        CON(5)  (*)+5                            * 1133A  primitive code object
        LC(2)   #40                              * 1133F
        GOTO    L_11390                          * 11343

* ->
* refs (2): 3FD18 3FD9A
SetRightAnn:
        CON(5)  (*)+5                            * 11347  primitive code object
        LC(2)   #20                              * 1134C
        GOTO    L_1137B                          * 11350

* ->
* refs (4): 3FCBE 3FCEB 3FD45 3FD72
ClrRightAnn:
        CON(5)  (*)+5                            * 11354  primitive code object
        LC(2)   #20                              * 11359
        GOTO    L_11390                          * 1135D

* ->
* refs (2): 3FCE6 3FD6D
SetLeftAnn:
        CON(5)  (*)+5                            * 11361  primitive code object
        LC(2)   #10                              * 11366
        GOTO    L_1137B                          * 1136A

* ->
* refs (4): 3FCB9 3FD13 3FD40 3FD9F
ClrLeftAnn:
        CON(5)  (*)+5                            * 1136E  primitive code object
        LC(2)   #10                              * 11373
        GOTO    L_11390                          * 11377
L_1137B:
        GOSUB   SUB_113B0                        * 1137B
        C=C!A   B                                * 1137F
        GOTO    L_1139A                          * 11383

* refs (1): 2D368
OBJ_11387:
        CON(5)  (*)+5                            * 11387  primitive code object
        LC(2)   #02                              * 1138C
L_11390:
        C=-C-1  A                                * 11390
        GOSUB   SUB_113B0                        * 11392
        C=C&A   B                                * 11396
L_1139A:
        DAT0=C  B                                * 1139A
        A=R0                                     * 1139D
        D0=A                                     * 113A0
        LC(5)   OBJ_01E5E                        * 113A3
        A=C     A                                * 113AA
        PC=(A)                                   * 113AC

* refs (2): 1137B 11392
SUB_113B0:
        AD0EX                                    * 113B0
        R0=A                                     * 113B3
        D0=(5)  ANNUNCIATORS                     * 113B6
        A=DAT0  B                                * 113BD
        RTN                                      * 113C0

* refs (4): 64172 6AE2E 6BABF 6C2F3
OBJ_113C2:
        CON(5)  (*)+5                            * 113C2  primitive code object
        LC(5)   DEPTHSAVE                        * 113C7
        GOTO    L_114B3                          * 113CE

* refs (3): 6AE38 6BAC9 6C2FD
OBJ_113D2:
        CON(5)  (*)+5                            * 113D2  primitive code object
        LC(5)   DEPTHSAVE                        * 113D7
        GOTO    L_114C9                          * 113DE

* refs (2): 4255C 428EF
OBJ_113E2:
        CON(5)  (*)+5                            * 113E2  primitive code object
        LC(5)   TOPLINE                          * 113E7
        GOTO    L_114C9                          * 113EE

* refs (8): 3A0E9 427B4 427D7 42845 42863 4288B ...
OBJ_113F2:
        CON(5)  (*)+5                            * 113F2  primitive code object
        LC(5)   TOPLINE                          * 113F7
        GOTO    L_114B3                          * 113FE

* refs (1): 4287C
OBJ_11402:
        CON(5)  (*)+5                            * 11402  primitive code object
        LC(5)   TOPLINE                          * 11407
        GOTO    L_114E1                          * 1140E

* refs (2): 4289F 429FD
OBJ_11412:
        CON(5)  (*)+5                            * 11412  primitive code object
        LC(5)   TOPLINE                          * 11417
        GOTO    L_114EC                          * 1141E

* refs (1): 42B98
OBJ_11422:
        CON(5)  (*)+5                            * 11422  primitive code object
        LC(5)   CR_COUNT                         * 11427
        GOTO    L_114E1                          * 1142E

* -> #
* refs (8): 3A09E 3A175 4258E 4270F 4274B 427B9 ...
FIRSTC@:
        CON(5)  (*)+5                            * 11432  primitive code object
        LC(5)   FIRSTCHAR                        * 11437
        GOTO    L_114B3                          * 1143E

* ->
* refs (3): 425CA 428D6 42B93
SETFIRSTC_0:
        CON(5)  (*)+5                            * 11442  primitive code object
        LC(5)   FIRSTCHAR                        * 11447
        GOTO    L_114F8                          * 1144E

* refs (1): 425A2
OBJ_11452:
        CON(5)  (*)+5                            * 11452  primitive code object
        LC(5)   FIRSTCHAR                        * 11457
        GOTO    L_114EC                          * 1145E

* ->
* refs (2): 42633 42656
FIRSTC+:
        CON(5)  (*)+5                            * 11462  primitive code object
        LC(5)   FIRSTCHAR                        * 11467
        GOTO    L_114E1                          * 1146E

* refs (3): 178E7 17900 17932
OBJ_11472:
        CON(5)  (*)+5                            * 11472  primitive code object
        LA(5)   PADCOUNT                         * 11477
        GOSBVL  SAVPTR                           * 11481
        D0=A                                     * 11488
        A=0     A                                * 1148B
        A=DAT0  1                                * 1148D
        GOTO    L_114C2                          * 11491

* refs (3): 172E8 178F1 1790A
OBJ_11495:
        CON(5)  (*)+5                            * 11495  primitive code object
        GOSBVL  POP#                             * 1149A
        LC(5)   PADCOUNT                         * 114A1
        CD0EX                                    * 114A8
        DAT0=A  1                                * 114AB
        GOTO    L_114DA                          * 114AF
L_114B3:
        A=C     A                                * 114B3
        GOSBVL  SAVPTR                           * 114B5
        D0=A                                     * 114BC
        A=DAT0  A                                * 114BF
L_114C2:
        GOVLNG  PUSH#ALOOP                       * 114C2
L_114C9:
        RSTK=C                                   * 114C9
        GOSBVL  POP#                             * 114CB
        C=RSTK                                   * 114D2
        CD0EX                                    * 114D4
L_114D7:
        DAT0=A  A                                * 114D7
L_114DA:
        D0=C                                     * 114DA
        GOTO    L_11585                          * 114DD
L_114E1:
        CD0EX                                    * 114E1
        A=DAT0  A                                * 114E4
        A=A+1   A                                * 114E7
        GONC    L_114D7                          * 114E9
L_114EC:
        CD0EX                                    * 114EC
        A=DAT0  A                                * 114EF
        A=A-1   A                                * 114F2
        GOTO    L_114D7                          * 114F4
L_114F8:
        CD0EX                                    * 114F8
        A=0     A                                * 114FB
        GOTO    L_114D7                          * 114FD

* -> flag
* refs (3): 3AFB1 3FC14 D73EA
Lock?:
        CON(5)  (*)+5                            * 11501  primitive code object
        LC(5)   KEYLOCK                          * 11506
        GOTO    L_1151D                          * 1150D

* -> flag
* refs (25): 39858 3BE59 3D55B 3DFDD 3EDD4 3EE01 ...
PrgmEntry?:
        CON(5)  (*)+5                            * 11511  primitive code object
        LC(5)   ACCUM                            * 11516
L_1151D:
        CD1EX                                    * 1151D
        A=DAT1  P                                * 11520
        D1=C                                     * 11524
        ?A#0    P                                * 11527
        GOYES   L_1152C                          * 1152A
L_1152C:
        GOVLNG  PushT/FLoop                      * 1152C

* ->
* refs (13): 19CAE 3DFCE 3DFE7 40E7E 42F3A 42FB2 ...
SetPrgmEntry:
        CON(5)  (*)+5                            * 11533  primitive code object
        LC(5)   ACCUM                            * 11538
        GOTO    L_1154F                          * 1153F

* ->
* refs (1): 40D2A
SetLock:
        CON(5)  (*)+5                            * 11543  primitive code object
        LC(5)   KEYLOCK                          * 11548
L_1154F:
        CD1EX                                    * 1154F
        A=0     P                                * 11552
        A=A+1   P                                * 11555
        GOTO    L_1157E                          * 11558

* ->
* refs (1): 443B2
ClrPrgmEntry:
        CON(5)  (*)+5                            * 1155C  primitive code object
        LC(5)   ACCUM                            * 11561
        GOTO    L_11578                          * 11568

* ->
* refs (1): 40D3E
ClrLock:
        CON(5)  (*)+5                            * 1156C  primitive code object
        LC(5)   KEYLOCK                          * 11571
L_11578:
        CD1EX                                    * 11578
        A=0     P                                * 1157B
L_1157E:
        DAT1=A  P                                * 1157E
        D1=C                                     * 11582
L_11585:
        A=DAT0  A                                * 11585
        D0=D0+  5                                * 11588
        PC=(A)                                   * 1158B

* #height #width -> grob
* refs (51): 25B83 44C5F 44CAA 44CDC 44D86 46B63 ...
MAKEGROB:
        CON(5)  (*)+5                            * 1158F  primitive code object
        GOSUB   SUB_11CBE                        * 11594
        R0=A                                     * 11598
        GOSUB   SUB_11CC5                        * 1159B
        GOSUB   SUB_11CBE                        * 1159F
        R1=A                                     * 115A3
        GOSUB   makegrob                         * 115A6
        AD0EX                                    * 115AA
        GOLONG  L_11FF1                          * 115AD

* R0.A = x, R1.A = y --> D0 = body Makes a grob of size x,y Prolog is in D0-20
* refs (6): 115A6 11953 11D6D 11FC3 12098 9D2ED
makegrob:
        ST=0    10                               * 115B3
L_115B6:
        A=R0                                     * 115B6
        GOSUB   w->W                             * 115B9
        R3=A.F  A                                * 115BD
        C=R1.F  A                                * 115C3
        GOSUB   SUB_11642                        * 115C9
        GOC     L_115DB                          * 115CD
        C=0     A                                * 115D0
        LC(2)   #14                              * 115D2
        C=C+B   A                                * 115D6
        GONC    L_115DF                          * 115D8
L_115DB:
        C=0     A                                * 115DB
        C=C-1   A                                * 115DD
L_115DF:
        GOSBVL  CREATETEMP                       * 115DF
        GONC    L_115F4                          * 115E6
        GOSBVL  St10Gb                           * 115E9
        GOTO    L_115B6                          * 115F0
L_115F4:
        LC(5)   DOGROB                           * 115F4
        DAT0=C  A                                * 115FB
        D0=D0+  5                                * 115FE
        C=0     A                                * 11601
        LC(1)   #B                               * 11603
        B=B-C   A                                * 11606
        C=B     A                                * 11608
        DAT0=C  A                                * 1160A
        D0=D0+  5                                * 1160D
        C=R1.F  A                                * 11610
        DAT0=C  A                                * 11616
        D0=D0+  5                                * 11619
        C=R0.F  A                                * 1161C
        DAT0=C  A                                * 11622
        D0=D0+  5                                * 11625
        AD0EX                                    * 11628
        D0=A                                     * 1162B
        D1=A                                     * 1162E
        C=B     A                                * 11631
        C=C-CON A,15                             * 11633
        GOSBVL  WIPEOUT                          * 11639
        RTNCC                                    * 11640

* refs (2): 115C9 12536
SUB_11642:
        B=0     A                                * 11642
        ?C<A    A                                * 11644
        GOYES   L_11653                          * 11647
        CAEX    A                                * 11649
        GONC    L_11653                          * 1164B
L_1164E:
        B=B+A   A                                * 1164E
        RTNC                                     * 11650
L_11653:
        C=C-1   A                                * 11653
        GONC    L_1164E                          * 11655
        RTNCC                                    * 11658

* Calculates GROB width A.A=width in pixels -> A.A=width in nibbles
* refs (19): 115B9 116D2 1174C 11C5E 12338 12527 ...
w->W:
        SB=0                                     * 1165A
        ASRB.F  A                                * 1165D
        ASRB.F  A                                * 11662
        ASRB.F  A                                * 11667
        A=A+A   A                                * 1166C
        ?SB=0                                    * 1166E
        RTNYES                                   * 11671
        A=A+1   A                                * 11673
        A=A+1   A                                * 11675
        RTN                                      * 11677

* grob1 grob2 #x #y ->
* refs (119): 0E01F 0E03D 0E065 1273E 12766 1283D ...
GROB!:
        CON(5)  (*)+5                            * 11679  primitive code object
        GOSUB   SUB_11CBE                        * 1167E
        R0=A                                     * 11682
        GOSUB   SUB_11CBE                        * 11685
        R1=A                                     * 11689
        C=DAT1  A                                * 1168C
        RSTK=C                                   * 1168F
        D1=D1+  5                                * 11691
        D=D+1   A                                * 11694
        A=DAT1  A                                * 11696
        D1=D1+  5                                * 11699
        D=D+1   A                                * 1169C
        GOSUB   SUB_11CC5                        * 1169E
        D0=A                                     * 116A2
        C=RSTK                                   * 116A5
        D1=C                                     * 116A7
        GOSUB   grob!                            * 116AA
L_116AE:
        GOVLNG  GETPTRLOOP                       * 116AE

* R0,R1 = (row,col), D0 = grob1, D1 = grob2 --> Stores grob1 into grob2
* refs (2): 116AA 13D69
grob!:
        GOSUB   SUB_11BED                        * 116B5
        RTNC                                     * 116B9
        D1=D1+  10                               * 116BC
        C=DAT1  A                                * 116BF
        ?C=0    A                                * 116C2
        RTNYES                                   * 116C5
        D1=D1+  5                                * 116C7
        A=DAT1  A                                * 116CA
        ?A=0    A                                * 116CD
        RTNYES                                   * 116D0
        GOSUB   w->W                             * 116D2
        R4=A                                     * 116D6
        D1=D1+  5                                * 116D9
        B=0     A                                * 116DC
        C=R0                                     * 116DE
        GOTO    L_116E7                          * 116E1
L_116E5:
        B=B+A   A                                * 116E5
L_116E7:
        C=C-1   A                                * 116E7
        GONC    L_116E5                          * 116E9
        B=B-A   A                                * 116EC
        C=R1                                     * 116EE
        D=C     A                                * 116F1
        CSRB.F  A                                * 116F3
        CSRB.F  A                                * 116F8
        B=B+C   A                                * 116FD
        AD1EX                                    * 116FF
        A=A+B   A                                * 11702
        R3=A                                     * 11704
        D0=D0+  5                                * 11707
        C=DAT0  A                                * 1170A
        C=C-CON A,15                             * 1170D
        RTNC                                     * 11713
        ?C=0    A                                * 11716
        RTNYES                                   * 11719
        D0=D0+  5                                * 1171B
        C=DAT0  A                                * 1171E
        ?C=0    A                                * 11721
        RTNYES                                   * 11724
        D0=D0+  5                                * 11726
        A=DAT0  A                                * 11729
        ?A=0    A                                * 1172C
        RTNYES                                   * 1172F
        R0=A                                     * 11731
        D0=D0+  5                                * 11734
        C=C-1   A                                * 11737
        R2=C                                     * 11739
        ST=1    1                                * 1173C
        C=0     A                                * 1173F
        LC(1)   #4                               * 11741
        ?C>A    A                                * 11744
        GOYES   L_1174C                          * 11747
        ST=0    1                                * 11749
L_1174C:
        GOSUB   w->W                             * 1174C
        C=A     A                                * 11750
        RSTK=C                                   * 11752
        C=R4                                     * 11754
        RSTK=C                                   * 11757
        CD0EX                                    * 11759
        C=C-A   A                                * 1175C
        R4=C                                     * 1175E
        LC(1)   #3                               * 11761
        C=C&D   P                                * 11764
        CSRC                                     * 11768
        B=C     S                                * 1176B
        LC(2)   #0F                              * 1176E
        GOTO    L_11779                          * 11772
L_11776:
        C=C+C   B                                * 11776
L_11779:
        B=B-1   S                                * 11779
        GONC    L_11776                          * 1177C
        CSR     A                                * 1177F
        D=C     A                                * 11781
        A=R0                                     * 11783
        B=C     S                                * 11786
        P=      4                                * 11789
        CPEX    15                               * 1178B
        BCEX    S                                * 1178F
        C=0     A                                * 11792
        CPEX    0                                * 11794
        A=A+C   A                                * 11798
        LC(1)   #3                               * 1179A
        C=C&A   A                                * 1179D
        B=C     A                                * 117A1
        LC(2)   #FF                              * 117A3
        ?ST=1   1                                * 117A7
        GOYES   L_117B4                          * 117AA
        A=B     A                                * 117AC
        GONC    L_117B4                          * 117AE
L_117B1:
        C=C+C   B                                * 117B1
L_117B4:
        A=A-1   A                                * 117B4
        GONC    L_117B1                          * 117B6
        ?ST=0   1                                * 117B9
        GOYES   L_117C2                          * 117BC
        C=C!D   P                                * 117BE
L_117C2:
        CSL     A                                * 117C2
        C=D     P                                * 117C4
        D=C     A                                * 117C7
        C=RSTK                                   * 117C9
        B=C     A                                * 117CB
        C=RSTK                                   * 117CD
L_117CF:
        ST=1    0                                * 117CF
        A=R3                                     * 117D2
        A=A+B   A                                * 117D5
        R3=A                                     * 117D7
        D1=A                                     * 117DA
        A=R4                                     * 117DD
        A=A+C   A                                * 117E0
        R4=A                                     * 117E2
        D0=A                                     * 117E5
        RSTK=C                                   * 117E8
        C=B     A                                * 117EA
        RSTK=C                                   * 117EC
        A=R0                                     * 117EE
        R1=A                                     * 117F1
L_117F4:
        A=R1                                     * 117F4
        C=0     A                                * 117F7
        LC(1)   #4                               * 117F9
        ?C>A    A                                * 117FC
        GOYES   L_11879                          * 117FF
        B=A     A                                * 11801
        BSRB.F  A                                * 11803
        BSRB.F  A                                * 11808
        LC(1)   #E                               * 1180D
        ?B<C    A                                * 11810
        GOYES   L_11817                          * 11813
        B=C     A                                * 11815
L_11817:
        A=DAT0  W                                * 11817
        GOSUB   SUB_118B8                        * 1181B
        GOSUB   SUB_118F3                        * 1181F
        ?ST=0   0                                * 11823
        GOYES   L_1183E                          * 11826
        C=P     5                                * 11828
        P=      0                                * 1182C
        C=DAT1  1                                * 1182E
        C=C&D   P                                * 11832
        A=A!C   P                                * 11836
        P=C     5                                * 1183A
L_1183E:
        DAT1=A  WP                               * 1183E
        CD1EX                                    * 11842
        C+P+1                                    * 11845
        D1=C                                     * 11848
        P=      0                                * 1184B
        C=R1.F  A                                * 1184D
        C=C-B   A                                * 11853
        R1=C                                     * 11855
        A=R0                                     * 11858
        A=A-C   A                                * 1185B
        ASRB.F  A                                * 1185D
        ASRB.F  A                                * 11862
        C=R4.F  A                                * 11867
        C=C+A   A                                * 1186D
        D0=C                                     * 1186F
        ST=0    0                                * 11872
        GOTO    L_117F4                          * 11875
L_11879:
        ?A=0    A                                * 11879
        GOYES   L_118A3                          * 1187C
        A=DAT0  B                                * 1187E
        GOSUB   SUB_118B8                        * 11881
        C=D     A                                * 11885
        CSR     A                                * 11887
        C=-C-1  A                                * 11889
        A=A&C   B                                * 1188B
        C=DAT1  B                                * 1188F
        B=C     A                                * 11892
        C=D     A                                * 11894
        CSR     A                                * 11896
        C=C&B   B                                * 11898
        A=A!C   B                                * 1189C
        DAT1=A  B                                * 118A0
L_118A3:
        C=RSTK                                   * 118A3
        B=C     A                                * 118A5
        C=RSTK                                   * 118A7
        A=R2                                     * 118A9
        A=A-1   A                                * 118AC
        RTNC                                     * 118AE
        R2=A                                     * 118B1
        GOTO    L_117CF                          * 118B4

* refs (2): 1181B 11881
SUB_118B8:
        ?C=0    S                                * 118B8
        RTNYES                                   * 118BB
        ?ST=1   0                                * 118BD
        GOYES   L_118E1                          * 118C0
        B=C     S                                * 118C2
        P=      15                               * 118C5
        LC(1)   #4                               * 118C7
        P=      0                                * 118CA
        BCEX    S                                * 118CC
        B=B-C   S                                * 118CF
        GOTO    L_118D9                          * 118D2
L_118D6:
        ASRB                                     * 118D6
L_118D9:
        B=B-1   S                                * 118D9
        GONC    L_118D6                          * 118DC
        RTNCC                                    * 118DF
L_118E1:
        B=C     S                                * 118E1
        GOTO    L_118EB                          * 118E4
L_118E8:
        A=A+A   W                                * 118E8
L_118EB:
        B=B-1   S                                * 118EB
        GONC    L_118E8                          * 118EE
        RTNCC                                    * 118F1

* refs (1): 1181F
SUB_118F3:
        C=B     A                                * 118F3
        P=C     0                                * 118F5
        P=P-1                                    * 118F9
        B=B+B   A                                * 118FB
        B=B+B   A                                * 118FD
        ?C=0    S                                * 118FF
        RTNYES                                   * 11902
        ?ST=0   0                                * 11904
        RTNYES                                   * 11907
        CPEX    15                               * 11909
        C=P     0                                * 1190D
        CPEX    15                               * 11911
        B=B-C   A                                * 11915
        RTNCC                                    * 11917
L_11919:
        GOSUBL  SUB_120E7                        * 11919
        LC(5)   NULLPAINT                        * 1191F
        DAT1=C  A                                * 11926
        GOLONG  L_12002                          * 11929

* grob #x1 #y1 #x2 #y2 -> grob'
* refs (35): 0E051 4572B 484CC 4DD5A 4DEEF 4DF5D ...
SUBGROB:
        CON(5)  (*)+5                            * 1192F  primitive code object
        GOSUB   SUB_11BAA                        * 11934
        GOC     L_11919                          * 11938
        C=DAT1  A                                * 1193B
        D1=C                                     * 1193E
        GOSUB   SUB_11BED                        * 11941
        GOC     L_11919                          * 11945
        GOSUB   SUB_11C06                        * 11948
        GONC    L_11919                          * 1194C
        GOSUB   SUB_11C29                        * 1194F
        GOSUBL  makegrob                         * 11953
        GOSUB   SUB_11A58                        * 11959
        GOSUB   SUB_11C58                        * 1195D
        AR4EX                                    * 11961
        C=R0                                     * 11964
        D=C     A                                * 11967
        GOSUB   SUB_11C8B                        * 11969
        D=C     S                                * 1196D
        C=R1                                     * 11970
        C=C-1   A                                * 11973
        R1=C                                     * 11975
        LC(1)   #3                               * 11978
        C=C&A   P                                * 1197B
        CSRC                                     * 1197F
        CD0EX                                    * 11982
        R2=C                                     * 11985
        CR3EX.F A                                * 11988
L_1198E:
        RSTK=C                                   * 1198E
        C=B     A                                * 11990
        RSTK=C                                   * 11992
        A=R0                                     * 11994
        B=A     A                                * 11997
        C=R2.F  A                                * 11999
        D1=C                                     * 1199F
        C=R4.F  A                                * 119A2
        D0=C                                     * 119A8
L_119AB:
        A=DAT0  W                                * 119AB
        C=B     A                                * 119AF
        D=C     A                                * 119B1
        DSRB.F  A                                * 119B3
        DSRB.F  A                                * 119B8
        P=      0                                * 119BD
        C=0     A                                * 119BF
        LC(1)   #E                               * 119C1
        ?D>=C   A                                * 119C4
        GOYES   L_119CB                          * 119C7
        C=D     A                                * 119C9
L_119CB:
        P=C     0                                * 119CB
        P=P+1                                    * 119CF
        B=C     S                                * 119D1
        GOTO    L_119DD                          * 119D4
L_119D8:
        ASRB.F  WP                               * 119D8
L_119DD:
        B=B-1   S                                * 119DD
        GONC    L_119D8                          * 119E0
        P=P-1                                    * 119E3
        P=P-1                                    * 119E5
        GOC     L_11A0A                          * 119E7
        DAT1=A  WP                               * 119EA
        C=C+C   A                                * 119EE
        C=C+C   A                                * 119F0
        B=B-C   A                                * 119F2
        CD0EX                                    * 119F4
        C+P+1                                    * 119F7
        D0=C                                     * 119FA
        CD1EX                                    * 119FD
        C+P+1                                    * 11A00
        D1=C                                     * 11A03
        GOTO    L_119AB                          * 11A06
L_11A0A:
        B=B-1   A                                * 11A0A
        GOC     L_11A27                          * 11A0C
        DCEX    S                                * 11A0F
        P=C     15                               * 11A12
        DCEX    S                                * 11A16
        C=P     0                                * 11A19
        P=      0                                * 11A1D
        A=A&C   P                                * 11A1F
        DAT1=A  1                                * 11A23
L_11A27:
        C=RSTK                                   * 11A27
        B=C     A                                * 11A29
        C=RSTK                                   * 11A2B
        A=R4                                     * 11A2D
        A=A+B   A                                * 11A30
        R4=A                                     * 11A32
        A=R2                                     * 11A35
        A=A+C   A                                * 11A38
        R2=A                                     * 11A3A
        A=R1                                     * 11A3D
        A=A-1   A                                * 11A40
        R1=A                                     * 11A42
        GOC     L_11A4C                          * 11A45
        GOTO    L_1198E                          * 11A48
L_11A4C:
        A=R3.F  A                                * 11A4C
        GOLONG  L_11FF1                          * 11A52

* refs (3): 11959 11D71 11FC9
SUB_11A58:
        D1=(5)  DSKTOP                           * 11A58
        C=DAT1  A                                * 11A5F
        D1=C                                     * 11A62
        C=DAT1  A                                * 11A65
        D1=C                                     * 11A68
        RTN                                      * 11A6B

* grob #x1 #y1 #x2 #y2 -> grob'
* refs (7): 3965A 39912 44DE0 638A3 8D826 AC2E2 ...
GROB!ZERO:
        CON(5)  (*)+5                            * 11A6D  primitive code object
        GOSUB   SUB_11BAA                        * 11A72
        GONC    L_11A7D                          * 11A76
        GOTO    L_116AE                          * 11A79
L_11A7D:
        C=DAT1  A                                * 11A7D
        D1=C                                     * 11A80
        GOSUB   SUB_11BED                        * 11A83
        GONC    L_11A8E                          * 11A87
        GOTO    L_116AE                          * 11A8A
L_11A8E:
        GOSUB   SUB_11C06                        * 11A8E
        GOC     L_11A99                          * 11A92
        GOTO    L_116AE                          * 11A95
L_11A99:
        GOSUB   SUB_11C29                        * 11A99
        GOSUB   SUB_11C58                        * 11A9D
        R3=A                                     * 11AA1
        C=R4                                     * 11AA4
        D=C     A                                * 11AA7
        GOSUB   SUB_11C8B                        * 11AA9
        D=C     S                                * 11AAD
        C=R0                                     * 11AB0
        C=C+D   A                                * 11AB3
        R2=C                                     * 11AB5
        C=C-1   A                                * 11AB8
        D=C     A                                * 11ABA
        GOSUB   SUB_11C96                        * 11ABC
        DCEX    S                                * 11AC0
        A=R2                                     * 11AC3
        ASRB.F  A                                * 11AC6
        ASRB.F  A                                * 11ACB
        C=R4.F  A                                * 11AD0
        CSRB.F  A                                * 11AD6
        CSRB.F  A                                * 11ADB
        ?C#A    A                                * 11AE0
        GOYES   L_11AE9                          * 11AE3
        C=C!D   S                                * 11AE5
L_11AE9:
        C=R1.F  A                                * 11AE9
        C=C-1   A                                * 11AEF
        R1=C                                     * 11AF1
        B=C     S                                * 11AF4
        C=0     A                                * 11AF7
        LC(1)   #4                               * 11AF9
L_11AFC:
        ?B=0    S                                * 11AFC
        GOYES   L_11B0C                          * 11AFF
L_11B01:
        B=B+B   S                                * 11B01
        GONC    L_11B01                          * 11B04
        C=C-1   A                                * 11B07
        GONC    L_11AFC                          * 11B09
L_11B0C:
        A=R0                                     * 11B0C
        A=A-C   A                                * 11B0F
        R0=A                                     * 11B11
        C=B     A                                * 11B14
L_11B16:
        RSTK=C                                   * 11B16
        C=R3.F  A                                * 11B18
        D1=C                                     * 11B1E
        A=DAT1  S                                * 11B21
        A=A&C   S                                * 11B25
        DAT1=A  S                                * 11B29
        D1=D1+  1                                * 11B2D
        A=R0                                     * 11B30
        B=A     A                                * 11B33
        A=0     W                                * 11B35
L_11B38:
        C=B     A                                * 11B38
        D=C     A                                * 11B3A
        DSRB.F  A                                * 11B3C
        DSRB.F  A                                * 11B41
        P=      0                                * 11B46
        C=0     A                                * 11B48
        LC(1)   #E                               * 11B4A
        ?D>=C   A                                * 11B4D
        GOYES   L_11B54                          * 11B50
        C=D     A                                * 11B52
L_11B54:
        P=C     0                                * 11B54
        P=P-1                                    * 11B58
        GOC     L_11B74                          * 11B5A
        DAT1=A  WP                               * 11B5D
        C=C+C   A                                * 11B61
        C=C+C   A                                * 11B63
        B=B-C   A                                * 11B65
        CD1EX                                    * 11B67
        C+P+1                                    * 11B6A
        D1=C                                     * 11B6D
        GOTO    L_11B38                          * 11B70
L_11B74:
        P=      0                                * 11B74
        B=B-1   A                                * 11B76
        GOC     L_11B8D                          * 11B78
        DCEX    S                                * 11B7B
        A=DAT1  S                                * 11B7E
        A=A&C   S                                * 11B82
        DAT1=A  S                                * 11B86
        DCEX    S                                * 11B8A
L_11B8D:
        C=RSTK                                   * 11B8D
        A=R3                                     * 11B8F
        A=A+C   A                                * 11B92
        R3=A                                     * 11B94
        A=R1                                     * 11B97
        A=A-1   A                                * 11B9A
        R1=A                                     * 11B9C
        GOC     L_11BA6                          * 11B9F
        GOTO    L_11B16                          * 11BA2
L_11BA6:
        GOTO    L_116AE                          * 11BA6

* refs (2): 11934 11A72
SUB_11BAA:
        GOSUB   SUB_11CBE                        * 11BAA
        R0=A                                     * 11BAE
        GOSUB   SUB_11CBE                        * 11BB1
        R1=A                                     * 11BB5
        GOSUB   SUB_11CBE                        * 11BB8
        R2=A                                     * 11BBC
        GOSUB   SUB_11CBE                        * 11BBF
        R4=A                                     * 11BC3
        GOSUB   SUB_11CC5                        * 11BC6
        C=R0                                     * 11BCA
        B=C     A                                * 11BCD
        A=R2                                     * 11BCF
        ?C<=A   A                                * 11BD2
        RTNYES                                   * 11BD5
        C=C-A   A                                * 11BD7
        CR1EX                                    * 11BD9
        D=C     A                                * 11BDC
        A=R4                                     * 11BDE
        ?C<=A   A                                * 11BE1
        RTNYES                                   * 11BE4
        C=C-A   A                                * 11BE6
        R0=C                                     * 11BE8
        RTNCC                                    * 11BEB

* refs (3): 116B5 11941 11A83
SUB_11BED:
        D1=D1+  5                                * 11BED
        C=DAT1  A                                * 11BF0
        D1=D1-  5                                * 11BF3
        C=C-CON A,15                             * 11BF6
        RTNC                                     * 11BFC
        ?C=0    A                                * 11BFF
        RTNYES                                   * 11C02
        RTN                                      * 11C04

* refs (2): 11948 11A8E
SUB_11C06:
        D1=D1+  10                               * 11C06
        C=DAT1  A                                * 11C09
        A=R2                                     * 11C0C
        ?C>A    A                                * 11C0F
        GOYES   L_11C16                          * 11C12
        RTNCC                                    * 11C14
L_11C16:
        D1=D1+  5                                * 11C16
        C=DAT1  A                                * 11C19
        D1=D1-  15                               * 11C1C
        A=R4                                     * 11C1F
        ?C>A    A                                * 11C22
        RTNYES                                   * 11C25
        RTNCC                                    * 11C27

* refs (2): 1194F 11A99
SUB_11C29:
        D1=D1+  10                               * 11C29
        C=DAT1  A                                * 11C2C
        ?B<=C   A                                * 11C2F
        GOYES   L_11C3E                          * 11C32
        B=C     A                                * 11C34
        A=R2                                     * 11C36
        C=C-A   A                                * 11C39
        R1=C                                     * 11C3B
L_11C3E:
        D1=D1+  5                                * 11C3E
        C=DAT1  A                                * 11C41
        ?D<=C   A                                * 11C44
        GOYES   L_11C53                          * 11C47
        D=C     A                                * 11C49
        A=R4                                     * 11C4B
        C=C-A   A                                * 11C4E
        R0=C                                     * 11C50
L_11C53:
        D1=D1-  15                               * 11C53
        RTN                                      * 11C56

* refs (3): 1195D 11A9D 121F6
SUB_11C58:
        D1=D1+  15                               * 11C58
        A=DAT1  A                                * 11C5B
        GOSUBL  w->W                             * 11C5E
        B=A     A                                * 11C64
        D1=D1+  5                                * 11C66
        AD1EX                                    * 11C69
        C=R2                                     * 11C6C
        GOTO    L_11C75                          * 11C6F
L_11C73:
        A=A+B   A                                * 11C73
L_11C75:
        C=C-1   A                                * 11C75
        GONC    L_11C73                          * 11C77
        C=R4                                     * 11C7A
        CSRB.F  A                                * 11C7D
        CSRB.F  A                                * 11C82
        A=A+C   A                                * 11C87
        RTN                                      * 11C89

* refs (2): 11969 11AA9
SUB_11C8B:
        LC(5)   #73103                           * 11C8B
        GOTO    L_11C9D                          * 11C92

* refs (1): 11ABC
SUB_11C96:
        LC(5)   #08CE3                           * 11C96
L_11C9D:
        C=C&D   P                                * 11C9D
        P=C     0                                * 11CA1
        CSR     A                                * 11CA5
        GOTO    L_11CAD                          * 11CA7
L_11CAB:
        CSR     A                                * 11CAB
L_11CAD:
        P=P-1                                    * 11CAD
        GONC    L_11CAB                          * 11CAF
        P=C     0                                * 11CB2
        C=P     15                               * 11CB6
        P=      0                                * 11CBA
        RTN                                      * 11CBC

* refs (12): 11594 1159F 1167E 11685 11BAA 11BB1 ...
SUB_11CBE:
        GOVLNG  POP#                             * 11CBE

* refs (10): 1159B 1169E 11BC6 11CD3 11D08 11F88 ...
SUB_11CC5:
        GOVLNG  SAVPTR                           * 11CC5

* refs (4): 11CDB 11CF8 11D83 12421
SUB_11CCC:
        RTNSXM                                   * 11CCC

* refs (1): 13B5B
3->grob(s):
        CON(5)  (*)+5                            * 11CCE  primitive code object
        GOSUB   SUB_11CC5                        * 11CD3
        A=0     A                                * 11CD7
        A=A+1   A                                * 11CD9
        GOSUB   SUB_11CCC                        * 11CDB
        GOSUB   SUB_11D52                        * 11CDF
        C=R3                                     * 11CE3
        D=C     A                                * 11CE6
        D1=D1+  5                                * 11CE8
        A=0     A                                * 11CEB
        A=A+1   A                                * 11CED
        GOTO    L_11D3A                          * 11CEF

* $ -> grob
* refs (4): 44234 4424F 504FB 6CBAC
$>BIGGROB:
        CON(5)  (*)+5                            * 11CF3  primitive code object
        GOSUB   SUB_11CCC                        * 11CF8
        GOTO    L_11D08                          * 11CFC

* $ -> grob
* refs (24): 0E010 0E033 1272F 12752 2F0A4 504EC ...
$>GROB:
        CON(5)  (*)+5                            * 11D00  primitive code object
        XM=0                                     * 11D05
L_11D08:
        GOSUB   SUB_11CC5                        * 11D08
        A=DAT1  A                                * 11D0C
        GOSUB   SUB_120CC                        * 11D0F
        ?A#0    A                                * 11D13
        GOYES   L_11D2A                          * 11D16
L_11D18:
        GOSUB   SUB_120E7                        * 11D18
        LC(5)   NULLPAINT                        * 11D1C
        DAT1=C  A                                * 11D23
        GOTO    L_12002                          * 11D26
L_11D2A:
        GOSUB   SUB_11D52                        * 11D2A
        C=R3                                     * 11D2E
        D=C     A                                * 11D31
        AD1EX                                    * 11D33
        GOSUB   SUB_120CC                        * 11D36
L_11D3A:
        B=0     A                                * 11D3A
        CD0EX                                    * 11D3C
        R3=C                                     * 11D3F
        D0=C                                     * 11D42
        C=A     A                                * 11D45
        GOSUB   SUB_11D92                        * 11D47
        C=R3                                     * 11D4B
        GOTO    L_11FEF                          * 11D4E

* refs (2): 11CDF 11D2A
SUB_11D52:
        C=0     A                                * 11D52
        LC(1)   #8                               * 11D54
        ?XM=0                                    * 11D57
        GOYES   L_11D5F                          * 11D5A
        LC(1)   #A                               * 11D5C
L_11D5F:
        R1=C                                     * 11D5F
        A=A+A   A                                * 11D62
        C=A     A                                * 11D64
        A=A+A   A                                * 11D66
        A=A+C   A                                * 11D68
        R0=A                                     * 11D6A
        GOSUB   makegrob                         * 11D6D
        GOSUB   SUB_11A58                        * 11D71
        A=R1                                     * 11D75
        LC(1)   #8                               * 11D78
        XM=0                                     * 11D7B
        ?C=A    P                                * 11D7E
        RTNYES                                   * 11D81
        GOTO    SUB_11CCC                        * 11D83
        NIBHEX  714F6600                         * 11D87  .ôf.

* ( D.A B.A C.A D0 D1 --> ) Displays string body at D1 in grob at D0 C.A = chars B.A = xlocation D.A = row length in nibbles -> D1 = addr after $ D0 = location of next char D.A = row length
* refs (1): 8163A
$5x7:
        XM=0                                     * 11D8F

* refs (2): 11D47 12549
SUB_11D92:
        P=      0                                * 11D92
        SETHEX                                   * 11D94
        A=B     A                                * 11D96
        BSRB.F  A                                * 11D98
        B=B+A   A                                * 11D9D
        AD0EX                                    * 11D9F
        A=A+B   A                                * 11DA2
        AD0EX                                    * 11DA4
        C=C-1   A                                * 11DA7
        GONC    L_11DB7                          * 11DA9
        ?ABIT=0 0                                * 11DAC
        GOYES   L_11E2B                          * 11DB1
        GOTO    L_11EE9                          * 11DB3
L_11DB7:
        ?ABIT=1 0                                * 11DB7
        GOYES   L_11DC7                          * 11DBC
        ?C#0    A                                * 11DBE
        GOYES   L_11E2D                          * 11DC1
        GOTO    L_11EAA                          * 11DC3
L_11DC7:
        GOSUB   SUB_11F17                        * 11DC7
        RSTK=C                                   * 11DCB
        A=DAT1  B                                * 11DCD
        GOSBVL  SUB_7A126                        * 11DD0
        D1=D1+  2                                * 11DD7
        CD1EX                                    * 11DDA
        GOSUB   SUB_11EF2                        * 11DDD
        RSTK=C                                   * 11DE1
L_11DE3:
        A=DAT0  B                                * 11DE3
        LC(2)   #03                              * 11DE6
        A=A&C   B                                * 11DEA
        C=DAT1  B                                * 11DEE
        C=C+C   B                                * 11DF1
        C=C+C   B                                * 11DF4
        A=A!C   B                                * 11DF7
        DAT0=A  B                                * 11DFB
        D1=D1+  2                                * 11DFE
        CD0EX                                    * 11E01
        C=C+D   A                                * 11E04
        CD0EX                                    * 11E06
        C=C-1   S                                * 11E09
        GONC    L_11DE3                          * 11E0C
        C=RSTK                                   * 11E0F
        D1=C                                     * 11E11
        GOSUB   SUB_11EF9                        * 11E14
        D0=D0+  1                                * 11E18
        C=RSTK                                   * 11E1B
        C=C-1   A                                * 11E1D
        GOC     L_11E2B                          * 11E1F
        ?C#0    A                                * 11E22
        GOYES   L_11E2D                          * 11E25
        GOTO    L_11EAA                          * 11E27
L_11E2B:
        RTNCC                                    * 11E2B
L_11E2D:
        GOSUB   SUB_11F17                        * 11E2D
        RSTK=C                                   * 11E31
        A=DAT1  A                                * 11E33
        GOSBVL  SUB_7A0FD                        * 11E36
        D1=D1+  4                                * 11E3D
        CD1EX                                    * 11E40
        GOSUB   SUB_11EF2                        * 11E43
        A=B     A                                * 11E47
        AD1EX                                    * 11E49
        GOSUB   SUB_11EF2                        * 11E4C
        AD1EX                                    * 11E50
        B=A     A                                * 11E53
        RSTK=C                                   * 11E55
L_11E57:
        C=B     A                                * 11E57
        CD1EX                                    * 11E59
        B=C     A                                * 11E5C
        A=DAT1  B                                * 11E5E
        ASL     X                                * 11E61
        A=A+A   X                                * 11E64
        A=A+A   X                                * 11E67
        D1=D1+  2                                * 11E6A
        C=B     A                                * 11E6D
        CD1EX                                    * 11E6F
        B=C     A                                * 11E72
        C=DAT1  B                                * 11E74
        D1=D1+  2                                * 11E77
        A=A!C   B                                * 11E7A
        DAT0=A  X                                * 11E7E
        CD0EX                                    * 11E82
        C=C+D   A                                * 11E85
        CD0EX                                    * 11E87
        C=C-1   S                                * 11E8A
        GONC    L_11E57                          * 11E8D
        C=RSTK                                   * 11E90
        D1=C                                     * 11E92
        GOSUB   SUB_11EF9                        * 11E95
        D0=D0+  2                                * 11E99
        C=RSTK                                   * 11E9C
        C=C-1   A                                * 11E9E
        C=C-1   A                                * 11EA0
        GOC     L_11E2B                          * 11EA2
        ?C#0    A                                * 11EA5
        GOYES   L_11E2D                          * 11EA8
L_11EAA:
        GOSUB   SUB_11F17                        * 11EAA
        A=DAT1  B                                * 11EAE
        GOSBVL  SUB_7A126                        * 11EB1
        D1=C                                     * 11EB8
        GOSUB   SUB_11EF2                        * 11EBB
L_11EBF:
        A=DAT0  B                                * 11EBF
        LC(2)   #C0                              * 11EC2
        A=A&C   B                                * 11EC6
        C=DAT1  B                                * 11ECA
        A=A!C   B                                * 11ECD
        DAT0=A  B                                * 11ED1
        D1=D1+  2                                * 11ED4
        CD0EX                                    * 11ED7
        C=C+D   A                                * 11EDA
        CD0EX                                    * 11EDC
        C=C-1   S                                * 11EDF
        GONC    L_11EBF                          * 11EE2
        GOSUB   SUB_11EF9                        * 11EE5
L_11EE9:
        RTNSC                                    * 11EE9
        BSS     7                                * 11EEB

* refs (4): 11DDD 11E43 11E4C 11EBB
SUB_11EF2:
        GOVLNG  L_0C169                          * 11EF2

* refs (3): 11E14 11E95 11EE5
SUB_11EF9:
        AD0EX                                    * 11EF9
        C=D     A                                * 11EFC
        C=C+C   A                                * 11EFE
        C=C+C   A                                * 11F00
        C=C+C   A                                * 11F02
        ?XM=0                                    * 11F04
        GOYES   L_11F0D                          * 11F07
        C=C+D   A                                * 11F09
        C=C+D   A                                * 11F0B
L_11F0D:
        A=A-C   A                                * 11F0D
        D0=A                                     * 11F0F
        D0=D0+  1                                * 11F12
        RTN                                      * 11F15

* refs (3): 11DC7 11E2D 11EAA
SUB_11F17:
        P=      7                                * 11F17
        ?XM=0                                    * 11F19
        GOYES   L_11F20                          * 11F1C
        P=      9                                * 11F1E
L_11F20:
        C=P     15                               * 11F20
        P=      0                                * 11F24
        RTN                                      * 11F26

* refs (1): 13C5E
* String renderer. XM=1: 10-row font, glyph = #7A047 + 20*code; XM=0: 8-row font, glyph = #7B257 + 16*code
SUB_11F28:
        C=0     A                                * 11F28
        C=A     B                                * 11F2A
        A=C     A                                * 11F2D
        ?XM=0                                    * 11F2F
        GOYES   L_11F5B                          * 11F32
        LC(2)   #1F                              * 11F34
        ?C<=A   B                                * 11F38
        GOYES   L_11F46                          * 11F3B
        LC(5)   Font10+2540                      * 11F3D  glyph used for codes below #20
        RTN                                      * 11F44
L_11F46:
        C=A     A                                * 11F46
        C=C+C   A                                * 11F48
        C=C+C   A                                * 11F4A
        ASL     A                                * 11F4C
        A=A+C   A                                * 11F4E
        LC(5)   Font10-620                       * 11F50  glyph of code c = #7A047 + 20*c
        C=C+A   A                                * 11F57
        RTN                                      * 11F59
L_11F5B:
        LC(2)   #1F                              * 11F5B
        ?C<=A   B                                * 11F5F
        GOYES   L_11F6D                          * 11F62
        LC(5)   Font8+2032                       * 11F64  glyph used for codes below #20
        RTN                                      * 11F6B
L_11F6D:
        ASL     A                                * 11F6D
        LC(5)   Font8-496                        * 11F6F  glyph of code c = #7B257 + 16*c
        C=C+A   A                                * 11F76
        RTN                                      * 11F78
        BSS     6                                * 11F7A

* $ -> grob
* refs (34): 1281A 3963C 39A3D 39ABA 4712A 47143 ...
$>grob:
        CON(5)  (*)+5                            * 11F80  primitive code object
        ST=1    3                                * 11F85
        GOSUB   SUB_11CC5                        * 11F88
        A=DAT1  A                                * 11F8C
        GOSUB   SUB_120CC                        * 11F8F
        ?A#0    A                                * 11F93
        GOYES   L_11F9C                          * 11F96
        GOTO    L_11D18                          * 11F98
L_11F9C:
        R4=A.F  A                                * 11F9C
        C=A     A                                * 11FA2
        GOSUB   SUB_120F5                        * 11FA4
        A=B     A                                * 11FA8
        R0=A.F  A                                * 11FAA
        C=0     A                                * 11FB0
        LC(1)   #6                               * 11FB2
        ?ST=1   3                                * 11FB5
        GOYES   L_11FBD                          * 11FB8
        LC(1)   #5                               * 11FBA
L_11FBD:
        R1=C.F  A                                * 11FBD
        GOSUBL  makegrob                         * 11FC3
        GOSUB   SUB_11A58                        * 11FC9
        D1=D1+  10                               * 11FCD
L_11FD0:
        A=R3.F  A                                * 11FD0
        CD0EX                                    * 11FD6
        D0=C                                     * 11FD9
        RSTK=C                                   * 11FDC
        C=R4.F  A                                * 11FDE
        B=0     A                                * 11FE4
        ST=0    2                                * 11FE6
        GOSUB   SUB_12223                        * 11FE9
        C=RSTK                                   * 11FED
L_11FEF:
        A=C     A                                * 11FEF
L_11FF1:
        P=      0                                * 11FF1
        C=0     A                                * 11FF3
        LC(2)   #14                              * 11FF5
        A=A-C   A                                * 11FF9
        GOSUB   SUB_120E7                        * 11FFB
L_11FFF:
        DAT1=A  A                                * 11FFF
