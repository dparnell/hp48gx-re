* HP 48GX ROM revision R, #10029-#12001: Unit expressions as metas: simplifying and raising them, dimension vectors; sign and exponent keys on the command line; annunciator words; editor and display counters; grob size, clipping and text in grobs
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
        :: DUPTYPEEXT? case units(uo)=>(_,s)~1   * 1008D
          DROP tok1 BINT1 ;                      * 100A1

* refs (1): 1009C
units(uo)=>(_,s)~1:
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
OBJ_1013C.loop1:
        B=B+1   A                                * 1014E
        D1=D1+  5                                * 10150
        A=DAT1  A                                * 10153
        D0=A                                     * 10156
        A=DAT0  A                                * 10159
        LC(5)   DOCSTR                           * 1015C
        ?C=A    A                                * 10163
        GOYES   OBJ_1013C.L2                     * 10166
        LC(5)   DOCHAR                           * 10168
        ?C=A    A                                * 1016F
        GOYES   OBJ_1013C.L2                     * 10172
        LC(5)   DOREAL                           * 10174
        ?C=A    A                                * 1017B
        GOYES   OBJ_1013C.L2                     * 1017E
        D=D+1   A                                * 10180
        D=D+1   A                                * 10182
OBJ_1013C.L2:
        D=D-1   A                                * 10184
        ?D#0    A                                * 10186
        GOYES   OBJ_1013C.loop1                  * 10189
        A=B     A                                * 1018B
        GOVLNG  PUSH#ALOOP                       * 1018D
        RPL

* refs (4): 0F80F 0F85F 0F8B9 0FA3A
* Probably: unit meta -> unit meta: bring a unit expression to simplest form: split it into terms, merge equal units by adding exponents, and rebuild
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
          ~drop;1-(s);dup;roll(s);FALSE REQcasedrop {} * 10211
          TRUE tok1 OVER EQUALcase OBJ_102D9     * 10220
          DUPTYPECSTR? ITE                       * 10239
          :: NULL$ SWAPROT #1+ ;                 * 10243
          :: SWAP dup;roll(s);swap dup;drop(s) #1- ; * 1025C
          DUPROLL dREALNcase                     * 1027A
          :: %1 ROT#1+ ROT FALSE ;               * 10284
          DUP%0= ITE                             * 102A2
          :: DROPSWAPDROP SWAPDROP #3- ; SWAP    * 102AC
          DUPROLL ~drop;1-(s);dup;roll(s);FALSE ; * 102CA

* refs (1): 10234
OBJ_102D9:
        :: drop;1-(s);dup;roll(s) dREALNcase FALSE * 102D9
          drop;1-(s);dup;roll(s) ~drop;1-(s);dup;roll(s);FALSE ; * 102ED

* refs (3): 102DE 102ED 10315
drop;1-(s);dup;roll(s):
        :: DROP#1- DUPROLL ;                     * 102FC

* refs (3): 10211 102CF 102F2
~drop;1-(s);dup;roll(s);FALSE:
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
OBJ_104D2.L1:
          dup;drop(s) #1- dup;drop(s) #1- dup;drop(s) #1-SWAP #3- SWAPTRUE ; * 105BD

* refs (1): 1057C
OBJ_105EA:
        :: ROT dup;drop(s) #1- dup;drop(s) BINT2 #-ROLL DROP 5PICK BINT6 * 105EA
          #+ROLL #3- 6PICK BINT6 #+UNROLL 4PICK BINT3 #+ROLL DROP 4PICK * 1061C
          #2+UNROLL %- OVER BINT1 #-ROLL DROPOVER BINT2 #-UNROLL TRUE ; * 1064E

* refs (1): 10568
OBJ_10680:
        :: 2DROP SWAPDROP #3- dup;drop(s) #1- dup;drop(s) BINT2 #-ROLL * 10680
          DROPOVER BINT3 #+ROLL #3- 3PICK BINT3 #+UNROLL GOTO OBJ_104D2.L1 ; * 106AD

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
* $ -> $: a leading K or H of a unit name is changed in place to k or h, so that those prefixes are found
st=>uo?~3:
        CON(5)  (*)+5                            * 10B1C  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 10B21
        CD1EX                                    * 10B24
        RSTK=C                                   * 10B27
        D1=D1+  5                                * 10B29
        A=DAT1  B                                * 10B2C
        LC(2)   #4B                              * 10B2F
        ?C#A    B                                * 10B33
        GOYES   st=>uo?~3.L1                     * 10B36
        LC(2)   #6B                              * 10B38
        GONC    st=>uo?~3.L2                     * 10B3C
st=>uo?~3.L1:
        LC(2)   #48                              * 10B3F
        ?C#A    B                                * 10B43
        GOYES   st=>uo?~3.L3                     * 10B46
        LC(2)   #68                              * 10B48
st=>uo?~3.L2:
        DAT1=C  B                                * 10B4C
st=>uo?~3.L3:
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
UMSIN~1:
        :: U>NCQ XLIB Unit>AngleMode %%* ;       * 10B90

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
U>NCQ~5:
        :: 4ROLLROT %%*UNROT OBJ_0F73D ;         * 10C22

* refs (1): 0FEBC
U>NCQ~3:
        :: 4ROLLROT %%/ 3UNROLL OBJ_0F756 ;      * 10C3B

* refs (1): 0FEDA
U>NCQ~4:
        :: %>%% ROTOVER %%^ 3UNROLL SWAPCKREF ONE_DO_ARRY INDEX@ PULLLONGEL * 10C59
          3PICK %%* INDEX@ PUTEL NextInArray SWAPDROP ; * 10C86

* refs (2): 0FECB 0FF57
~3UNROLL;%%*SWAP;TOTEMPOB:
        :: 3UNROLL %%*SWAP TOTEMPOB ;            * 10CA9

* refs (1): 0FEE9
~ROT;%>%%;3UNROLL:
        :: ROT %>%% 3UNROLL ;                    * 10CC2
        ASSEMBLE

* refs (1): 0C44D
* A = packed dimensions, signed nibbles -> A.A = new array of 10 reals in TEMPOB: the dimension vector of a built-in unit, in the order of UDIMS
Dims>Array:
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
        LC(5)   portnotaverr                     * 10D28  "Port Not Available"
        DAT0=C  A                                * 10D2F
        D0=D0+  5                                * 10D32
        AR0EX                                    * 10D35
        LC(1)   #9                               * 10D38
        D=C     P                                * 10D3B
Dims>Array.loop1:
        C=0     W                                * 10D3E
        C=A     P                                * 10D41
        A=A+A   P                                * 10D44
        GONC    Dims>Array.L2                    * 10D47
        C=-C    P                                * 10D4A
        CSRC                                     * 10D4D
        LC(1)   #9                               * 10D50
        GOC     Dims>Array.L3                    * 10D53
Dims>Array.L2:
        CSRC                                     * 10D56
Dims>Array.L3:
        CSRC                                     * 10D59
        DAT0=C  W                                * 10D5C
        D0=D0+  16                               * 10D60
        ASR     W                                * 10D63
        D=D-1   P                                * 10D66
        GONC    Dims>Array.loop1                 * 10D69
        A=R0                                     * 10D6C
        P=      0                                * 10D6F
        GOVLNG  GETPTR                           * 10D71
        RPL

* refs (1): 0F94A
UMSI~1:
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
UMTAN~1:
        CON(5)  (*)+5                            * 10E0E  primitive code object
        ASSEMBLE
        GOSBVL  POP1%%                           * 10E13
        ST=0    9                                * 10E1A
        ST=0    4                                * 10E1D
        GOSBVL  aTAN                             * 10E20
        GOVLNG  GoFltExc.L1                      * 10E27
        BSS     8                                * 10E2E  zeros
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
        GOTO    CONSTUNITERR.L1                  * 10EF6

* Error B02h
* refs (4): 0F71F 0FBF1 CAC31 CAC86
CONSTUNITERR:
        CON(5)  (*)+5                            * 10EFA  primitive code object
        LC(5)   constuniterr                     * 10EFF  "Inconsistent Units"
CONSTUNITERR.L1:
        A=C     A                                * 10F06
        GOVLNG  Errjmp                           * 10F08

        LENGTH                                   * 10F0F  library object without its prolog (its place is the end of the link table before): length, to #189E3
        CON(2)  0                                * 10F14  no title

LIB001:
        CON(3)  #001                             * 10F16  library number
        CON(5)  0                                * 10F19  hash table
        REL(5)  LIB001.message                   * 10F1E  message table
        CON(5)  0                                * 10F23  link table
        REL(5)  ChkUserKeys                      * 10F28  config
LIB001.L1:
        LC(3)   #103                             * 10F2D
        GOSBVL  ClrFlagBit                       * 10F32
        LC(5)   #00101                           * 10F39

* A=C.A <REF>GETPTR <REF>Errjmp
* refs (7): 29EB7 3167D 31F34 323ED 7D932 87800 ...
GPErrjmpC:
        SETHEX                                   * 10F40
        A=C     A                                * 10F42
        P=      0                                * 10F44
        GOSBVL  GETPTR                           * 10F46
GPErrjmpC.L1:
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
        GOTO    GPErrjmpC.L1                     * 10F82

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
* -> # F T, T T or F: +/- key while editing: find the number under the cursor; if it has a sign, or a sign in its exponent, change it in place (T T); if it needs one, say where (# F T); if the cursor is not on a number, FALSE
EdNegNum:
        CON(5)  (*)+5                            * 110EF  primitive code object
        ASSEMBLE
        GOSUB   EdCursor@                        * 110F4
        GOSUB   EdFlipSign                       * 110F8
        GOSUB   EdScanFwd                        * 110FC
        GOC     EdNegNum.L1                      * 11100
        GOSUB   EdFlipSign                       * 11103
EdNegNum.L1:
        A=A+1   A                                * 11107
        D0=D0-  2                                * 11109
        GOSUB   EdDigit?                         * 1110C
        GOC     EdNegNum.L2                      * 11110
        A=A-1   A                                * 11113
        D0=D0+  2                                * 11115
        C=DAT0  B                                * 11118
        B=C     B                                * 1111B
        LC(2)   #45                              * 1111E
        ?B#C    B                                * 11122
        GOYES   EdNegNum.L3                      * 11125
        ?A=0    A                                * 11127
        GOYES   EdNegNum.L3                      * 1112A
        A=A+1   A                                * 1112C
        D0=D0+  2                                * 1112E
        GOSUB   EdDigit?                         * 11131
        GONC    EdNegNum.L3                      * 11135
EdNegNum.L2:
        R0=A                                     * 11138
        GOSBVL  PUSH#                            * 1113B
        LC(5)   FalseTrue                        * 11142
        A=C     A                                * 11149
        PC=(A)                                   * 1114B
EdNegNum.L3:
        GOVLNG  GPPushFLoop                      * 1114F

* refs (2): 110F8 11103
* B.B = character, D0 at it -> : if it is + or -, write the other and leave through TrueTrue
EdFlipSign:
        LC(2)   #2B                              * 11156
        ?B=C    B                                * 1115A
        GOYES   EdFlipSign.L1                    * 1115D
EdFlipSign.L1:
        LC(2)   #2D                              * 1115F
        GOC     EdFlipSign.L2                    * 11163
        ?B#C    B                                * 11166
        RTNYES                                   * 11169
        LC(2)   #2B                              * 1116B
EdFlipSign.L2:
        DAT0=C  B                                * 1116F
        GOSBVL  GETPTR                           * 11172
        LC(5)   TrueTrue                         * 11179
        A=C     A                                * 11180
        PC=(A)                                   * 11182

* refs (2): 110F4 11244
* -> SAVPTR; D.B = fraction mark (flag -51), A.A = CURSOR, B.B = character at the cursor, D0 at it in the edit line
EdCursor@:
        GOSBVL  SAVPTR                           * 11186
        D0=(5)  #8084F                           * 1118D
        C=DAT0  1                                * 11194
        ?CBIT=1 2                                * 11198
        GOYES   EdCursor@.L1                     * 1119D
        LC(2)   #2E                              * 1119F
        GONC    EdCursor@.L2                     * 111A3
EdCursor@.L1:
        LC(2)   #2C                              * 111A6
EdCursor@.L2:
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
* A.A, D0, ST0 clear -> scan forward from the cursor over digits; carry set at the end of the line
EdScanFwd:
        ST=0    0                                * 111D6
        GOTO    EdScanBack.loop1                 * 111D9

* refs (1): 11287
* A.A, D0, ST0 set -> scan back from the cursor over digits; carry set at the start of a line or on a NUL or newline
EdScanBack:
        ST=1    0                                * 111DD
EdScanBack.loop1:
        ?ST=0   0                                * 111E0
        GOYES   EdScanBack.L2                    * 111E3
        A=A+1   A                                * 111E5
        D0=D0-  2                                * 111E7
        GOTO    EdScanBack.L3                    * 111EA
EdScanBack.L2:
        D0=D0+  2                                * 111EE
        A=A-1   A                                * 111F1
        RTNC                                     * 111F3
EdScanBack.L3:
        GOSUB   EdDigit?                         * 111F6
        GOC     EdScanBack.loop1                 * 111FA
        LC(2)   #0A                              * 111FD
        ?B=C    B                                * 11201
        RTNYES                                   * 11204
        ?B=0    B                                * 11206
        RTNYES                                   * 11209
        RTN                                      * 1120B

* refs (5): 1110C 11131 111F6 11276 11297
* D0 -> B.B = character there; carry set if it is a digit or the fraction mark
EdDigit?:
        C=DAT0  B                                * 1120D
        B=C     B                                * 11210
        C=D     B                                * 11213
        ?B=C    B                                * 11216
        RTNYES                                   * 11219
        LC(2)   #30                              * 1121B
        ?B>=C   B                                * 1121F
        GOYES   EdDigit?.L1                      * 11222
        RTN                                      * 11224
EdDigit?.L1:
        LC(2)   #39                              * 11226
        ?B<=C   B                                * 1122A
        RTNYES                                   * 1122D
        RTN                                      * 1122F
        RPL

* refs (1): 112A8
_1E_:
        $ "1E"                                   * 11231

* refs (1): 3B60E
* -> # $ or NULL$: EEX key while editing: find the place for the exponent of the number at the cursor, with "E" or "1E" to insert there, or NULL$ if it already has one
EdEEXKey:
        CON(5)  (*)+5                            * 1123F  primitive code object
        ASSEMBLE
        GOSUB   EdCursor@                        * 11244
        GOSUB   EdScanFwd                        * 11248
        GOC     EdEEXKey.L2                      * 1124C
        GOSUB   EdIsE?                           * 1124F
        GOSUB   EdIsSign?                        * 11253
        GONC    EdEEXKey.L2                      * 11257
        D0=D0+  2                                * 1125A
        A=A-1   A                                * 1125D
        GOC     EdEEXKey.L1                      * 1125F
        C=DAT0  B                                * 11262
        B=C     B                                * 11265
        GOSUB   EdIsE?                           * 11268
EdEEXKey.L1:
        D0=D0-  2                                * 1126C
        A=A+1   A                                * 1126F
EdEEXKey.L2:
        A=A+1   A                                * 11271
        D0=D0-  2                                * 11273
        GOSUB   EdDigit?                         * 11276
        GOC     EdEEXKey.L3                      * 1127A
        GOSUB   EdIsSign?                        * 1127D
        GOC     EdEEXKey.L3                      * 11281
        GONC    EdEEXKey.L4                      * 11284
EdEEXKey.L3:
        GOSUB   EdScanBack                       * 11287
EdEEXKey.L4:
        GOSUB   EdIsE?                           * 1128B
        D0=D0+  2                                * 1128F
        A=A-1   A                                * 11292
        GOC     EdEEXKey.L5                      * 11294
        GOSUB   EdDigit?                         * 11297
        GONC    EdEEXKey.L5                      * 1129B
        LC(5)   CHR_E                            * 1129E
        GOC     EdEEXKey.L6                      * 112A5
EdEEXKey.L5:
        LC(5)   _1E_                             * 112A8
EdEEXKey.L6:
        RSTK=C                                   * 112AF
        A=A+1   A                                * 112B1
        R0=A                                     * 112B3
        GOSBVL  PUSH#                            * 112B6
        C=RSTK                                   * 112BD
        A=C     A                                * 112BF
        PC=(A)                                   * 112C1

* refs (3): 1124F 11268 1128B
* B.B = character: if E, leave with NULL$ (no exponent needed)
EdIsE?:
        LC(2)   #45                              * 112C5
        ?B#C    B                                * 112C9
        RTNYES                                   * 112CC
        LC(5)   NULL$                            * 112CE
        GONC    EdEEXKey.L6                      * 112D5

* refs (2): 11253 1127D
* B.B -> carry set if it is + or -
EdIsSign?:
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
        GOTO    ClrIOAnn.L1                      * 11329

* ->
* refs (3): 3FD3B 3FD68 3FD95
SetAlphaAnn:
        CON(5)  (*)+5                            * 1132D  primitive code object
        LC(2)   #40                              * 11332
        GOTO    ClrLeftAnn.L1                    * 11336

* ->
* refs (3): 3FCB4 3FCE1 3FD0E
ClrAlphaAnn:
        CON(5)  (*)+5                            * 1133A  primitive code object
        LC(2)   #40                              * 1133F
        GOTO    ClrIOAnn.L1                      * 11343

* ->
* refs (2): 3FD18 3FD9A
SetRightAnn:
        CON(5)  (*)+5                            * 11347  primitive code object
        LC(2)   #20                              * 1134C
        GOTO    ClrLeftAnn.L1                    * 11350

* ->
* refs (4): 3FCBE 3FCEB 3FD45 3FD72
ClrRightAnn:
        CON(5)  (*)+5                            * 11354  primitive code object
        LC(2)   #20                              * 11359
        GOTO    ClrIOAnn.L1                      * 1135D

* ->
* refs (2): 3FCE6 3FD6D
SetLeftAnn:
        CON(5)  (*)+5                            * 11361  primitive code object
        LC(2)   #10                              * 11366
        GOTO    ClrLeftAnn.L1                    * 1136A

* ->
* refs (4): 3FCB9 3FD13 3FD40 3FD9F
ClrLeftAnn:
        CON(5)  (*)+5                            * 1136E  primitive code object
        LC(2)   #10                              * 11373
        GOTO    ClrIOAnn.L1                      * 11377
ClrLeftAnn.L1:
        GOSUB   Ann@                             * 1137B
        C=C!A   B                                * 1137F
        GOTO    ClrIOAnn.L2                      * 11383

* refs (1): 2D368
* -> : clear the I/O annunciator bit (#02) of the annunciator byte and show it. The entries before work the same way for other bits
ClrIOAnn:
        CON(5)  (*)+5                            * 11387  primitive code object
        LC(2)   #02                              * 1138C
ClrIOAnn.L1:
        C=-C-1  A                                * 11390
        GOSUB   Ann@                             * 11392
        C=C&A   B                                * 11396
ClrIOAnn.L2:
        DAT0=C  B                                * 1139A
        A=R0                                     * 1139D
        D0=A                                     * 113A0
        LC(5)   ShowHeldAnn                      * 113A3
        A=C     A                                * 113AA
        PC=(A)                                   * 113AC

* refs (2): 1137B 11392
* -> A.B = annunciator byte, D0 at it, R0 = old D0
Ann@:
        AD0EX                                    * 113B0
        R0=A                                     * 113B3
        D0=(5)  ANNUNCIATORS                     * 113B6
        A=DAT0  B                                * 113BD
        RTN                                      * 113C0

* refs (4): 64172 6AE2E 6BABF 6C2F3
* -> #
DEPTHSAVE@:
        CON(5)  (*)+5                            * 113C2  primitive code object
        LC(5)   DEPTHSAVE                        * 113C7
        GOTO    PADCOUNT!.L1                     * 113CE

* refs (3): 6AE38 6BAC9 6C2FD
* # ->
DEPTHSAVE!:
        CON(5)  (*)+5                            * 113D2  primitive code object
        LC(5)   DEPTHSAVE                        * 113D7
        GOTO    PADCOUNT!.L3                     * 113DE

* refs (2): 4255C 428EF
* # ->
TOPLINE!:
        CON(5)  (*)+5                            * 113E2  primitive code object
        LC(5)   TOPLINE                          * 113E7
        GOTO    PADCOUNT!.L3                     * 113EE

* refs (8): 3A0E9 427B4 427D7 42845 42863 4288B ...
* -> #
TOPLINE@:
        CON(5)  (*)+5                            * 113F2  primitive code object
        LC(5)   TOPLINE                          * 113F7
        GOTO    PADCOUNT!.L1                     * 113FE

* refs (1): 4287C
* -> :
TOPLINE+1:
        CON(5)  (*)+5                            * 11402  primitive code object
        LC(5)   TOPLINE                          * 11407
        GOTO    PADCOUNT!.L6                     * 1140E

* refs (2): 4289F 429FD
* -> :
TOPLINE-1:
        CON(5)  (*)+5                            * 11412  primitive code object
        LC(5)   TOPLINE                          * 11417
        GOTO    PADCOUNT!.L7                     * 1141E

* refs (1): 42B98
* -> :
CR_COUNT+1:
        CON(5)  (*)+5                            * 11422  primitive code object
        LC(5)   CR_COUNT                         * 11427
        GOTO    PADCOUNT!.L6                     * 1142E

* -> #
* refs (8): 3A09E 3A175 4258E 4270F 4274B 427B9 ...
FIRSTC@:
        CON(5)  (*)+5                            * 11432  primitive code object
        LC(5)   FIRSTCHAR                        * 11437
        GOTO    PADCOUNT!.L1                     * 1143E

* ->
* refs (3): 425CA 428D6 42B93
SETFIRSTC_0:
        CON(5)  (*)+5                            * 11442  primitive code object
        LC(5)   FIRSTCHAR                        * 11447
        GOTO    PADCOUNT!.L8                     * 1144E

* refs (1): 425A2
* -> :
FIRSTCHAR-1:
        CON(5)  (*)+5                            * 11452  primitive code object
        LC(5)   FIRSTCHAR                        * 11457
        GOTO    PADCOUNT!.L7                     * 1145E

* ->
* refs (2): 42633 42656
FIRSTC+:
        CON(5)  (*)+5                            * 11462  primitive code object
        LC(5)   FIRSTCHAR                        * 11467
        GOTO    PADCOUNT!.L6                     * 1146E

* refs (3): 178E7 17900 17932
* -> #
PADCOUNT@:
        CON(5)  (*)+5                            * 11472  primitive code object
        LA(5)   PADCOUNT                         * 11477
        GOSBVL  SAVPTR                           * 11481
        D0=A                                     * 11488
        A=0     A                                * 1148B
        A=DAT0  1                                * 1148D
        GOTO    PADCOUNT!.L2                     * 11491

* refs (3): 172E8 178F1 1790A
* # ->
PADCOUNT!:
        CON(5)  (*)+5                            * 11495  primitive code object
        GOSBVL  POP#                             * 1149A
        LC(5)   PADCOUNT                         * 114A1
        CD0EX                                    * 114A8
        DAT0=A  1                                * 114AB
        GOTO    PADCOUNT!.L5                     * 114AF
PADCOUNT!.L1:
        A=C     A                                * 114B3
        GOSBVL  SAVPTR                           * 114B5
        D0=A                                     * 114BC
        A=DAT0  A                                * 114BF
PADCOUNT!.L2:
        GOVLNG  PUSH#ALOOP                       * 114C2
PADCOUNT!.L3:
        RSTK=C                                   * 114C9
        GOSBVL  POP#                             * 114CB
        C=RSTK                                   * 114D2
        CD0EX                                    * 114D4
PADCOUNT!.loop4:
        DAT0=A  A                                * 114D7
PADCOUNT!.L5:
        D0=C                                     * 114DA
        GOTO    ClrLock.L3                       * 114DD
PADCOUNT!.L6:
        CD0EX                                    * 114E1
        A=DAT0  A                                * 114E4
        A=A+1   A                                * 114E7
        GONC    PADCOUNT!.loop4                  * 114E9
PADCOUNT!.L7:
        CD0EX                                    * 114EC
        A=DAT0  A                                * 114EF
        A=A-1   A                                * 114F2
        GOTO    PADCOUNT!.loop4                  * 114F4
PADCOUNT!.L8:
        CD0EX                                    * 114F8
        A=0     A                                * 114FB
        GOTO    PADCOUNT!.loop4                  * 114FD

* -> flag
* refs (3): 3AFB1 3FC14 D73EA
Lock?:
        CON(5)  (*)+5                            * 11501  primitive code object
        LC(5)   KEYLOCK                          * 11506
        GOTO    PrgmEntry?.L1                    * 1150D

* -> flag
* refs (25): 39858 3BE59 3D55B 3DFDD 3EDD4 3EE01 ...
PrgmEntry?:
        CON(5)  (*)+5                            * 11511  primitive code object
        LC(5)   ACCUM                            * 11516
PrgmEntry?.L1:
        CD1EX                                    * 1151D
        A=DAT1  P                                * 11520
        D1=C                                     * 11524
        ?A#0    P                                * 11527
        GOYES   PrgmEntry?.L2                    * 1152A
PrgmEntry?.L2:
        GOVLNG  PushT/FLoop                      * 1152C

* ->
* refs (13): 19CAE 3DFCE 3DFE7 40E7E 42F3A 42FB2 ...
SetPrgmEntry:
        CON(5)  (*)+5                            * 11533  primitive code object
        LC(5)   ACCUM                            * 11538
        GOTO    SetLock.L1                       * 1153F

* ->
* refs (1): 40D2A
SetLock:
        CON(5)  (*)+5                            * 11543  primitive code object
        LC(5)   KEYLOCK                          * 11548
SetLock.L1:
        CD1EX                                    * 1154F
        A=0     P                                * 11552
        A=A+1   P                                * 11555
        GOTO    ClrLock.L2                       * 11558

* ->
* refs (1): 443B2
ClrPrgmEntry:
        CON(5)  (*)+5                            * 1155C  primitive code object
        LC(5)   ACCUM                            * 11561
        GOTO    ClrLock.L1                       * 11568

* ->
* refs (1): 40D3E
ClrLock:
        CON(5)  (*)+5                            * 1156C  primitive code object
        LC(5)   KEYLOCK                          * 11571
ClrLock.L1:
        CD1EX                                    * 11578
        A=0     P                                * 1157B
ClrLock.L2:
        DAT1=A  P                                * 1157E
        D1=C                                     * 11582
ClrLock.L3:
        A=DAT0  A                                * 11585
        D0=D0+  5                                * 11588
        PC=(A)                                   * 1158B

* #height #width -> grob
* refs (51): 25B83 44C5F 44CAA 44CDC 44D86 46B63 ...
MAKEGROB:
        CON(5)  (*)+5                            * 1158F  primitive code object
        GOSUB   POP#~jump                        * 11594
        R0=A                                     * 11598
        GOSUB   SAVPTR~jump_7                    * 1159B
        GOSUB   POP#~jump                        * 1159F
        R1=A                                     * 115A3
        GOSUB   makegrob                         * 115A6
        AD0EX                                    * 115AA
        GOLONG  $>grob.L5                        * 115AD

* R0.A = x, R1.A = y --> D0 = body Makes a grob of size x,y Prolog is in D0-20
* refs (6): 115A6 11953 11D6D 11FC3 12098 9D2ED
makegrob:
        ST=0    10                               * 115B3
makegrob.loop1:
        A=R0                                     * 115B6
        GOSUB   w->W                             * 115B9
        R3=A.F  A                                * 115BD
        C=R1.F  A                                * 115C3
        GOSUB   A*C>B                            * 115C9
        GOC     makegrob.L2                      * 115CD
        C=0     A                                * 115D0
        LC(2)   #14                              * 115D2
        C=C+B   A                                * 115D6
        GONC    makegrob.L3                      * 115D8
makegrob.L2:
        C=0     A                                * 115DB
        C=C-1   A                                * 115DD
makegrob.L3:
        GOSBVL  CREATETEMP                       * 115DF
        GONC    makegrob.L4                      * 115E6
        GOSBVL  St10Gb                           * 115E9
        GOTO    makegrob.loop1                   * 115F0
makegrob.L4:
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
* A.A, C.A -> B.A = their product, by repeated addition of the larger; carry set on overflow
A*C>B:
        B=0     A                                * 11642
        ?C<A    A                                * 11644
        GOYES   A*C>B.L2                         * 11647
        CAEX    A                                * 11649
        GONC    A*C>B.L2                         * 1164B
A*C>B.loop1:
        B=B+A   A                                * 1164E
        RTNC                                     * 11650
A*C>B.L2:
        C=C-1   A                                * 11653
        GONC    A*C>B.loop1                      * 11655
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
        GOSUB   POP#~jump                        * 1167E
        R0=A                                     * 11682
        GOSUB   POP#~jump                        * 11685
        R1=A                                     * 11689
        C=DAT1  A                                * 1168C
        RSTK=C                                   * 1168F
        D1=D1+  5                                * 11691
        D=D+1   A                                * 11694
        A=DAT1  A                                * 11696
        D1=D1+  5                                * 11699
        D=D+1   A                                * 1169C
        GOSUB   SAVPTR~jump_7                    * 1169E
        D0=A                                     * 116A2
        C=RSTK                                   * 116A5
        D1=C                                     * 116A7
        GOSUB   grob!                            * 116AA
GROB!.L1:
        GOVLNG  GETPTRLOOP                       * 116AE

* R0,R1 = (row,col), D0 = grob1, D1 = grob2 --> Stores grob1 into grob2
* refs (2): 116AA 13D69
grob!:
        GOSUB   GrobEmpty?                       * 116B5
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
        GOTO    grob!.L2                         * 116E1
grob!.loop1:
        B=B+A   A                                * 116E5
grob!.L2:
        C=C-1   A                                * 116E7
        GONC    grob!.loop1                      * 116E9
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
        GOYES   grob!.L3                         * 11747
        ST=0    1                                * 11749
grob!.L3:
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
        GOTO    grob!.L5                         * 11772
grob!.loop4:
        C=C+C   B                                * 11776
grob!.L5:
        B=B-1   S                                * 11779
        GONC    grob!.loop4                      * 1177C
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
        GOYES   grob!.L7                         * 117AA
        A=B     A                                * 117AC
        GONC    grob!.L7                         * 117AE
grob!.loop6:
        C=C+C   B                                * 117B1
grob!.L7:
        A=A-1   A                                * 117B4
        GONC    grob!.loop6                      * 117B6
        ?ST=0   1                                * 117B9
        GOYES   grob!.L8                         * 117BC
        C=C!D   P                                * 117BE
grob!.L8:
        CSL     A                                * 117C2
        C=D     P                                * 117C4
        D=C     A                                * 117C7
        C=RSTK                                   * 117C9
        B=C     A                                * 117CB
        C=RSTK                                   * 117CD
grob!.loop9:
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
grob!.loop10:
        A=R1                                     * 117F4
        C=0     A                                * 117F7
        LC(1)   #4                               * 117F9
        ?C>A    A                                * 117FC
        GOYES   grob!.L13                        * 117FF
        B=A     A                                * 11801
        BSRB.F  A                                * 11803
        BSRB.F  A                                * 11808
        LC(1)   #E                               * 1180D
        ?B<C    A                                * 11810
        GOYES   grob!.L11                        * 11813
        B=C     A                                * 11815
grob!.L11:
        A=DAT0  W                                * 11817
        GOSUB   SUB_118B8                        * 1181B
        GOSUB   SUB_118F3                        * 1181F
        ?ST=0   0                                * 11823
        GOYES   grob!.L12                        * 11826
        C=P     5                                * 11828
        P=      0                                * 1182C
        C=DAT1  1                                * 1182E
        C=C&D   P                                * 11832
        A=A!C   P                                * 11836
        P=C     5                                * 1183A
grob!.L12:
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
        GOTO    grob!.loop10                     * 11875
grob!.L13:
        ?A=0    A                                * 11879
        GOYES   grob!.L14                        * 1187C
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
grob!.L14:
        C=RSTK                                   * 118A3
        B=C     A                                * 118A5
        C=RSTK                                   * 118A7
        A=R2                                     * 118A9
        A=A-1   A                                * 118AC
        RTNC                                     * 118AE
        R2=A                                     * 118B1
        GOTO    grob!.loop9                      * 118B4

* refs (2): 1181B 11881
SUB_118B8:
        ?C=0    S                                * 118B8
        RTNYES                                   * 118BB
        ?ST=1   0                                * 118BD
        GOYES   SUB_118B8.L3                     * 118C0
        B=C     S                                * 118C2
        P=      15                               * 118C5
        LC(1)   #4                               * 118C7
        P=      0                                * 118CA
        BCEX    S                                * 118CC
        B=B-C   S                                * 118CF
        GOTO    SUB_118B8.L2                     * 118D2
SUB_118B8.loop1:
        ASRB                                     * 118D6
SUB_118B8.L2:
        B=B-1   S                                * 118D9
        GONC    SUB_118B8.loop1                  * 118DC
        RTNCC                                    * 118DF
SUB_118B8.L3:
        B=C     S                                * 118E1
        GOTO    SUB_118B8.L5                     * 118E4
SUB_118B8.loop4:
        A=A+A   W                                * 118E8
SUB_118B8.L5:
        B=B-1   S                                * 118EB
        GONC    SUB_118B8.loop4                  * 118EE
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
SUB_118F3.L1:
        GOSUBL  GETPTR~jump_3                    * 11919
        LC(5)   NULLPAINT                        * 1191F
        DAT1=C  A                                * 11926
        GOLONG  $>grob.L7                        * 11929

* grob #x1 #y1 #x2 #y2 -> grob'
* refs (35): 0E051 4572B 484CC 4DD5A 4DEEF 4DF5D ...
SUBGROB:
        CON(5)  (*)+5                            * 1192F  primitive code object
        GOSUB   PopRect                          * 11934
        GOC     SUB_118F3.L1                     * 11938
        C=DAT1  A                                * 1193B
        D1=C                                     * 1193E
        GOSUB   GrobEmpty?                       * 11941
        GOC     SUB_118F3.L1                     * 11945
        GOSUB   PtInGrob?                        * 11948
        GONC    SUB_118F3.L1                     * 1194C
        GOSUB   ClipRect                         * 1194F
        GOSUBL  makegrob                         * 11953
        GOSUB   D1=Lev1                          * 11959
        GOSUB   GrobPixAddr                      * 1195D
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
SUBGROB.loop1:
        RSTK=C                                   * 1198E
        C=B     A                                * 11990
        RSTK=C                                   * 11992
        A=R0                                     * 11994
        B=A     A                                * 11997
        C=R2.F  A                                * 11999
        D1=C                                     * 1199F
        C=R4.F  A                                * 119A2
        D0=C                                     * 119A8
SUBGROB.loop2:
        A=DAT0  W                                * 119AB
        C=B     A                                * 119AF
        D=C     A                                * 119B1
        DSRB.F  A                                * 119B3
        DSRB.F  A                                * 119B8
        P=      0                                * 119BD
        C=0     A                                * 119BF
        LC(1)   #E                               * 119C1
        ?D>=C   A                                * 119C4
        GOYES   SUBGROB.L3                       * 119C7
        C=D     A                                * 119C9
SUBGROB.L3:
        P=C     0                                * 119CB
        P=P+1                                    * 119CF
        B=C     S                                * 119D1
        GOTO    SUBGROB.L5                       * 119D4
SUBGROB.loop4:
        ASRB.F  WP                               * 119D8
SUBGROB.L5:
        B=B-1   S                                * 119DD
        GONC    SUBGROB.loop4                    * 119E0
        P=P-1                                    * 119E3
        P=P-1                                    * 119E5
        GOC     SUBGROB.L6                       * 119E7
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
        GOTO    SUBGROB.loop2                    * 11A06
SUBGROB.L6:
        B=B-1   A                                * 11A0A
        GOC     SUBGROB.L7                       * 11A0C
        DCEX    S                                * 11A0F
        P=C     15                               * 11A12
        DCEX    S                                * 11A16
        C=P     0                                * 11A19
        P=      0                                * 11A1D
        A=A&C   P                                * 11A1F
        DAT1=A  1                                * 11A23
SUBGROB.L7:
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
        GOC     SUBGROB.L8                       * 11A45
        GOTO    SUBGROB.loop1                    * 11A48
SUBGROB.L8:
        A=R3.F  A                                * 11A4C
        GOLONG  $>grob.L5                        * 11A52

* refs (3): 11959 11D71 11FC9
* -> D1 at the object on level 1
D1=Lev1:
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
        GOSUB   PopRect                          * 11A72
        GONC    GROB!ZERO.L1                     * 11A76
        GOTO    GROB!.L1                         * 11A79
GROB!ZERO.L1:
        C=DAT1  A                                * 11A7D
        D1=C                                     * 11A80
        GOSUB   GrobEmpty?                       * 11A83
        GONC    GROB!ZERO.L2                     * 11A87
        GOTO    GROB!.L1                         * 11A8A
GROB!ZERO.L2:
        GOSUB   PtInGrob?                        * 11A8E
        GOC     GROB!ZERO.L3                     * 11A92
        GOTO    GROB!.L1                         * 11A95
GROB!ZERO.L3:
        GOSUB   ClipRect                         * 11A99
        GOSUB   GrobPixAddr                      * 11A9D
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
        GOYES   GROB!ZERO.L4                     * 11AE3
        C=C!D   S                                * 11AE5
GROB!ZERO.L4:
        C=R1.F  A                                * 11AE9
        C=C-1   A                                * 11AEF
        R1=C                                     * 11AF1
        B=C     S                                * 11AF4
        C=0     A                                * 11AF7
        LC(1)   #4                               * 11AF9
GROB!ZERO.loop5:
        ?B=0    S                                * 11AFC
        GOYES   GROB!ZERO.L7                     * 11AFF
GROB!ZERO.loop6:
        B=B+B   S                                * 11B01
        GONC    GROB!ZERO.loop6                  * 11B04
        C=C-1   A                                * 11B07
        GONC    GROB!ZERO.loop5                  * 11B09
GROB!ZERO.L7:
        A=R0                                     * 11B0C
        A=A-C   A                                * 11B0F
        R0=A                                     * 11B11
        C=B     A                                * 11B14
GROB!ZERO.loop8:
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
GROB!ZERO.loop9:
        C=B     A                                * 11B38
        D=C     A                                * 11B3A
        DSRB.F  A                                * 11B3C
        DSRB.F  A                                * 11B41
        P=      0                                * 11B46
        C=0     A                                * 11B48
        LC(1)   #E                               * 11B4A
        ?D>=C   A                                * 11B4D
        GOYES   GROB!ZERO.L10                    * 11B50
        C=D     A                                * 11B52
GROB!ZERO.L10:
        P=C     0                                * 11B54
        P=P-1                                    * 11B58
        GOC     GROB!ZERO.L11                    * 11B5A
        DAT1=A  WP                               * 11B5D
        C=C+C   A                                * 11B61
        C=C+C   A                                * 11B63
        B=B-C   A                                * 11B65
        CD1EX                                    * 11B67
        C+P+1                                    * 11B6A
        D1=C                                     * 11B6D
        GOTO    GROB!ZERO.loop9                  * 11B70
GROB!ZERO.L11:
        P=      0                                * 11B74
        B=B-1   A                                * 11B76
        GOC     GROB!ZERO.L12                    * 11B78
        DCEX    S                                * 11B7B
        A=DAT1  S                                * 11B7E
        A=A&C   S                                * 11B82
        DAT1=A  S                                * 11B86
        DCEX    S                                * 11B8A
GROB!ZERO.L12:
        C=RSTK                                   * 11B8D
        A=R3                                     * 11B8F
        A=A+C   A                                * 11B92
        R3=A                                     * 11B94
        A=R1                                     * 11B97
        A=A-1   A                                * 11B9A
        R1=A                                     * 11B9C
        GOC     GROB!ZERO.L13                    * 11B9F
        GOTO    GROB!ZERO.loop8                  * 11BA2
GROB!ZERO.L13:
        GOTO    GROB!.L1                         * 11BA6

* refs (2): 11934 11A72
* #x1 #y1 #x2 #y2 -> R4 = x1, R2 = y1, D.A = x2, B.A = y2, R0 = width, R1 = height, after SAVPTR; carry set if the rectangle is empty
PopRect:
        GOSUB   POP#~jump                        * 11BAA
        R0=A                                     * 11BAE
        GOSUB   POP#~jump                        * 11BB1
        R1=A                                     * 11BB5
        GOSUB   POP#~jump                        * 11BB8
        R2=A                                     * 11BBC
        GOSUB   POP#~jump                        * 11BBF
        R4=A                                     * 11BC3
        GOSUB   SAVPTR~jump_7                    * 11BC6
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
* D1 at a grob -> carry set if it has no pixels
GrobEmpty?:
        D1=D1+  5                                * 11BED
        C=DAT1  A                                * 11BF0
        D1=D1-  5                                * 11BF3
        C=C-CON A,15                             * 11BF6
        RTNC                                     * 11BFC
        ?C=0    A                                * 11BFF
        RTNYES                                   * 11C02
        RTN                                      * 11C04

* refs (2): 11948 11A8E
* D1 at a grob -> carry set if the point R4, R2 lies inside it
PtInGrob?:
        D1=D1+  10                               * 11C06
        C=DAT1  A                                * 11C09
        A=R2                                     * 11C0C
        ?C>A    A                                * 11C0F
        GOYES   PtInGrob?.L1                     * 11C12
        RTNCC                                    * 11C14
PtInGrob?.L1:
        D1=D1+  5                                * 11C16
        C=DAT1  A                                * 11C19
        D1=D1-  15                               * 11C1C
        A=R4                                     * 11C1F
        ?C>A    A                                * 11C22
        RTNYES                                   * 11C25
        RTNCC                                    * 11C27

* refs (2): 1194F 11A99
* D1 at a grob -> : clip the rectangle from PopRect to the grob's size
ClipRect:
        D1=D1+  10                               * 11C29
        C=DAT1  A                                * 11C2C
        ?B<=C   A                                * 11C2F
        GOYES   ClipRect.L1                      * 11C32
        B=C     A                                * 11C34
        A=R2                                     * 11C36
        C=C-A   A                                * 11C39
        R1=C                                     * 11C3B
ClipRect.L1:
        D1=D1+  5                                * 11C3E
        C=DAT1  A                                * 11C41
        ?D<=C   A                                * 11C44
        GOYES   ClipRect.L2                      * 11C47
        D=C     A                                * 11C49
        A=R4                                     * 11C4B
        C=C-A   A                                * 11C4E
        R0=C                                     * 11C50
ClipRect.L2:
        D1=D1-  15                               * 11C53
        RTN                                      * 11C56

* refs (3): 1195D 11A9D 121F6
* D1 at a grob, R4 = x, R2 = y -> A.A = address of the nibble holding the pixel, B.A = nibbles per row
GrobPixAddr:
        D1=D1+  15                               * 11C58
        A=DAT1  A                                * 11C5B
        GOSUBL  w->W                             * 11C5E
        B=A     A                                * 11C64
        D1=D1+  5                                * 11C66
        AD1EX                                    * 11C69
        C=R2                                     * 11C6C
        GOTO    GrobPixAddr.L2                   * 11C6F
GrobPixAddr.loop1:
        A=A+B   A                                * 11C73
GrobPixAddr.L2:
        C=C-1   A                                * 11C75
        GONC    GrobPixAddr.loop1                * 11C77
        C=R4                                     * 11C7A
        CSRB.F  A                                * 11C7D
        CSRB.F  A                                * 11C82
        A=A+C   A                                * 11C87
        RTN                                      * 11C89

* refs (2): 11969 11AA9
SUB_11C8B:
        LC(5)   #73103                           * 11C8B
        GOTO    SUB_11C96.L1                     * 11C92

* refs (1): 11ABC
SUB_11C96:
        LC(5)   #08CE3                           * 11C96
SUB_11C96.L1:
        C=C&D   P                                * 11C9D
        P=C     0                                * 11CA1
        CSR     A                                * 11CA5
        GOTO    SUB_11C96.L3                     * 11CA7
SUB_11C96.loop2:
        CSR     A                                * 11CAB
SUB_11C96.L3:
        P=P-1                                    * 11CAD
        GONC    SUB_11C96.loop2                  * 11CAF
        P=C     0                                * 11CB2
        C=P     15                               * 11CB6
        P=      0                                * 11CBA
        RTN                                      * 11CBC

* refs (12): 11594 1159F 1167E 11685 11BAA 11BB1 ...
POP#~jump:
        GOVLNG  POP#                             * 11CBE

* refs (10): 1159B 1169E 11BC6 11CD3 11D08 11F88 ...
SAVPTR~jump_7:
        GOVLNG  SAVPTR                           * 11CC5

* refs (4): 11CDB 11CF8 11D83 12421
SUB_11CCC:
        RTNSXM                                   * 11CCC

* refs (1): 13B5B
3->grob(s):
        CON(5)  (*)+5                            * 11CCE  primitive code object
        GOSUB   SAVPTR~jump_7                    * 11CD3
        A=0     A                                * 11CD7
        A=A+1   A                                * 11CD9
        GOSUB   SUB_11CCC                        * 11CDB
        GOSUB   MakeTextGrob                     * 11CDF
        C=R3                                     * 11CE3
        D=C     A                                * 11CE6
        D1=D1+  5                                * 11CE8
        A=0     A                                * 11CEB
        A=A+1   A                                * 11CED
        GOTO    $>GROB.L4                        * 11CEF

* $ -> grob
* refs (4): 44234 4424F 504FB 6CBAC
$>BIGGROB:
        CON(5)  (*)+5                            * 11CF3  primitive code object
        GOSUB   SUB_11CCC                        * 11CF8
        GOTO    $>GROB.L1                        * 11CFC

* $ -> grob
* refs (24): 0E010 0E033 1272F 12752 2F0A4 504EC ...
$>GROB:
        CON(5)  (*)+5                            * 11D00  primitive code object
        XM=0                                     * 11D05
$>GROB.L1:
        GOSUB   SAVPTR~jump_7                    * 11D08
        A=DAT1  A                                * 11D0C
        GOSUB   $>Body                           * 11D0F
        ?A#0    A                                * 11D13
        GOYES   $>GROB.L3                        * 11D16
$>GROB.L2:
        GOSUB   GETPTR~jump_3                    * 11D18
        LC(5)   NULLPAINT                        * 11D1C
        DAT1=C  A                                * 11D23
        GOTO    $>grob.L7                        * 11D26
$>GROB.L3:
        GOSUB   MakeTextGrob                     * 11D2A
        C=R3                                     * 11D2E
        D=C     A                                * 11D31
        AD1EX                                    * 11D33
        GOSUB   $>Body                           * 11D36
$>GROB.L4:
        B=0     A                                * 11D3A
        CD0EX                                    * 11D3C
        R3=C                                     * 11D3F
        D0=C                                     * 11D42
        C=A     A                                * 11D45
        GOSUB   GrobPut$                         * 11D47
        C=R3                                     * 11D4B
        GOTO    $>grob.L4                        * 11D4E

* refs (2): 11CDF 11D2A
* A.A = characters, XM set for the 10-row font -> : make a grob 6 pixels a character wide and 8 or 10 rows high, D1 at it. XM kept
MakeTextGrob:
        C=0     A                                * 11D52
        LC(1)   #8                               * 11D54
        ?XM=0                                    * 11D57
        GOYES   MakeTextGrob.L1                  * 11D5A
        LC(1)   #A                               * 11D5C
MakeTextGrob.L1:
        R1=C                                     * 11D5F
        A=A+A   A                                * 11D62
        C=A     A                                * 11D64
        A=A+A   A                                * 11D66
        A=A+C   A                                * 11D68
        R0=A                                     * 11D6A
        GOSUB   makegrob                         * 11D6D
        GOSUB   D1=Lev1                          * 11D71
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
* D1 at a string body, D0 at a grob, C.A = characters, D.A = nibbles per row, B.A = pixel offset, XM for the font -> : draw it, two characters at a time. Carry set if it ends on a half cell
GrobPut$:
        P=      0                                * 11D92
        SETHEX                                   * 11D94
        A=B     A                                * 11D96
        BSRB.F  A                                * 11D98
        B=B+A   A                                * 11D9D
        AD0EX                                    * 11D9F
        A=A+B   A                                * 11DA2
        AD0EX                                    * 11DA4
        C=C-1   A                                * 11DA7
        GONC    GrobPut$.L1                      * 11DA9
        ?ABIT=0 0                                * 11DAC
        GOYES   GrobPut$.loop4                   * 11DB1
        GOTO    GrobPut$.L9                      * 11DB3
GrobPut$.L1:
        ?ABIT=1 0                                * 11DB7
        GOYES   GrobPut$.L2                      * 11DBC
        ?C#0    A                                * 11DBE
        GOYES   GrobPut$.loop5                   * 11DC1
        GOTO    GrobPut$.L7                      * 11DC3
GrobPut$.L2:
        GOSUB   GlyphRows                        * 11DC7
        RSTK=C                                   * 11DCB
        A=DAT1  B                                * 11DCD
        GOSBVL  CharGlyph1                       * 11DD0
        D1=D1+  2                                * 11DD7
        CD1EX                                    * 11DDA
        GOSUB   SUB_11EF2                        * 11DDD
        RSTK=C                                   * 11DE1
GrobPut$.loop3:
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
        GONC    GrobPut$.loop3                   * 11E0C
        C=RSTK                                   * 11E0F
        D1=C                                     * 11E11
        GOSUB   GlyphNext                        * 11E14
        D0=D0+  1                                * 11E18
        C=RSTK                                   * 11E1B
        C=C-1   A                                * 11E1D
        GOC     GrobPut$.loop4                   * 11E1F
        ?C#0    A                                * 11E22
        GOYES   GrobPut$.loop5                   * 11E25
        GOTO    GrobPut$.L7                      * 11E27
GrobPut$.loop4:
        RTNCC                                    * 11E2B
GrobPut$.loop5:
        GOSUB   GlyphRows                        * 11E2D
        RSTK=C                                   * 11E31
        A=DAT1  A                                * 11E33
        GOSBVL  CharGlyph2                       * 11E36
        D1=D1+  4                                * 11E3D
        CD1EX                                    * 11E40
        GOSUB   SUB_11EF2                        * 11E43
        A=B     A                                * 11E47
        AD1EX                                    * 11E49
        GOSUB   SUB_11EF2                        * 11E4C
        AD1EX                                    * 11E50
        B=A     A                                * 11E53
        RSTK=C                                   * 11E55
GrobPut$.loop6:
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
        GONC    GrobPut$.loop6                   * 11E8D
        C=RSTK                                   * 11E90
        D1=C                                     * 11E92
        GOSUB   GlyphNext                        * 11E95
        D0=D0+  2                                * 11E99
        C=RSTK                                   * 11E9C
        C=C-1   A                                * 11E9E
        C=C-1   A                                * 11EA0
        GOC     GrobPut$.loop4                   * 11EA2
        ?C#0    A                                * 11EA5
        GOYES   GrobPut$.loop5                   * 11EA8
GrobPut$.L7:
        GOSUB   GlyphRows                        * 11EAA
        A=DAT1  B                                * 11EAE
        GOSBVL  CharGlyph1                       * 11EB1
        D1=C                                     * 11EB8
        GOSUB   SUB_11EF2                        * 11EBB
GrobPut$.loop8:
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
        GONC    GrobPut$.loop8                   * 11EE2
        GOSUB   GlyphNext                        * 11EE5
GrobPut$.L9:
        RTNSC                                    * 11EE9
        BSS     7                                * 11EEB  zeros

* refs (4): 11DDD 11E43 11E4C 11EBB
SUB_11EF2:
        GOVLNG  CoveredRead.L3                   * 11EF2

* refs (3): 11E14 11E95 11EE5
* Step D0 back to the top of the character row and on one nibble
GlyphNext:
        AD0EX                                    * 11EF9
        C=D     A                                * 11EFC
        C=C+C   A                                * 11EFE
        C=C+C   A                                * 11F00
        C=C+C   A                                * 11F02
        ?XM=0                                    * 11F04
        GOYES   GlyphNext.L1                     * 11F07
        C=C+D   A                                * 11F09
        C=C+D   A                                * 11F0B
GlyphNext.L1:
        A=A-C   A                                * 11F0D
        D0=A                                     * 11F0F
        D0=D0+  1                                * 11F12
        RTN                                      * 11F15

* refs (3): 11DC7 11E2D 11EAA
* -> C.S = rows-1 of the font: 7, or 9 with XM
GlyphRows:
        P=      7                                * 11F17
        ?XM=0                                    * 11F19
        GOYES   GlyphRows.L1                     * 11F1C
        P=      9                                * 11F1E
GlyphRows.L1:
        C=P     15                               * 11F20
        P=      0                                * 11F24
        RTN                                      * 11F26

* refs (1): 13C5E
* String renderer. XM=1: 10-row font, glyph = #7A047 + 20*code; XM=0: 8-row font, glyph = #7B257 + 16*code
* A.B = character -> C.A = its glyph
Char>Glyph:
        C=0     A                                * 11F28
        C=A     B                                * 11F2A
        A=C     A                                * 11F2D
        ?XM=0                                    * 11F2F
        GOYES   Char>Glyph.L2                    * 11F32
        LC(2)   #1F                              * 11F34
        ?C<=A   B                                * 11F38
        GOYES   Char>Glyph.L1                    * 11F3B
        LC(5)   Font10+2540                      * 11F3D  glyph used for codes below #20
        RTN                                      * 11F44
Char>Glyph.L1:
        C=A     A                                * 11F46
        C=C+C   A                                * 11F48
        C=C+C   A                                * 11F4A
        ASL     A                                * 11F4C
        A=A+C   A                                * 11F4E
        LC(5)   Font10-620                       * 11F50  glyph of code c = #7A047 + 20*c
        C=C+A   A                                * 11F57
        RTN                                      * 11F59
Char>Glyph.L2:
        LC(2)   #1F                              * 11F5B
        ?C<=A   B                                * 11F5F
        GOYES   Char>Glyph.L3                    * 11F62
        LC(5)   Font8+2032                       * 11F64  glyph used for codes below #20
        RTN                                      * 11F6B
Char>Glyph.L3:
        ASL     A                                * 11F6D
        LC(5)   Font8-496                        * 11F6F  glyph of code c = #7B257 + 16*c
        C=C+A   A                                * 11F76
        RTN                                      * 11F78
        BSS     6                                * 11F7A  zeros

* $ -> grob
* refs (34): 1281A 3963C 39A3D 39ABA 4712A 47143 ...
$>grob:
        CON(5)  (*)+5                            * 11F80  primitive code object
        ST=1    3                                * 11F85
        GOSUB   SAVPTR~jump_7                    * 11F88
        A=DAT1  A                                * 11F8C
        GOSUB   $>Body                           * 11F8F
        ?A#0    A                                * 11F93
        GOYES   $>grob.L1                        * 11F96
        GOTO    $>GROB.L2                        * 11F98
$>grob.L1:
        R4=A.F  A                                * 11F9C
        C=A     A                                * 11FA2
        GOSUB   Mini$Width                       * 11FA4
        A=B     A                                * 11FA8
        R0=A.F  A                                * 11FAA
        C=0     A                                * 11FB0
        LC(1)   #6                               * 11FB2
        ?ST=1   3                                * 11FB5
        GOYES   $>grob.L2                        * 11FB8
        LC(1)   #5                               * 11FBA
$>grob.L2:
        R1=C.F  A                                * 11FBD
        GOSUBL  makegrob                         * 11FC3
        GOSUB   D1=Lev1                          * 11FC9
        D1=D1+  10                               * 11FCD
$>grob.L3:
        A=R3.F  A                                * 11FD0
        CD0EX                                    * 11FD6
        D0=C                                     * 11FD9
        RSTK=C                                   * 11FDC
        C=R4.F  A                                * 11FDE
        B=0     A                                * 11FE4
        ST=0    2                                * 11FE6
        GOSUB   MiniDraw                         * 11FE9
        C=RSTK                                   * 11FED
$>grob.L4:
        A=C     A                                * 11FEF
$>grob.L5:
        P=      0                                * 11FF1
        C=0     A                                * 11FF3
        LC(2)   #14                              * 11FF5
        A=A-C   A                                * 11FF9
        GOSUB   GETPTR~jump_3                    * 11FFB
$>grob.L6:
        DAT1=A  A                                * 11FFF
