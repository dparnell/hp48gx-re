* HP 48GX ROM revision R, #B4B39-#B7B7C: Library part 0B5
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #B4B39 in the original ROM).

LIB0B5:
        CON(3)  #0B5                             * B4B39  library number
        REL(5)  LIB0B5.hash                      * B4B3C  hash table
        CON(5)  0                                * B4B41  message table
        REL(5)  LIB0B5.link                      * B4B46  link table
        CON(5)  0                                * B4B4B  config
        RPL

* ROMPTR 0B5 000
* refs (1): B4B39
ROMP_0B5_000:
        :: ROMPTR 0B5 028 ;                      * B4B50

* ROMPTR 0B5 001
* refs (1): B4B39
ROMP_0B5_001:
        :: ROMPTR 0B5 029 ;                      * B4B65

* ROMPTR 0B5 002
* refs (1): B4B39
ROMP_0B5_002:
        :: ROMPTR 0B5 02B DUP MINUSONE EQUAL casedrop NULL{} * B4B7A
          FINDVAR ;                              * B4BA3

* ROMPTR 0B5 003
* refs (1): B4B39
ROMP_0B5_003:
        :: ROMPTR 0B5 02A ROMPTR 0B5 008 SWAPDUP SAFE@ ?SKIP %0_2A2B4 * B4BAD
          SYMBNUMSOLVE case                      * B4BDC
          :: JstGetTHEMESG SWAPDROP TRUE ;       * B4BE6
          DUP JstGetTHEMESG FALSE ;              * B4BFF

* ROMPTR 0B5 004
* refs (1): B4B39
ROMP_0B5_004:
        :: ROMPTR 0B5 008 DUP ALGeq? case        * B4C13
          :: SPLITEQ 1LAMBIND 'EvalNoCK:_sup xEVAL CK1NoBlame 1GETABND * B4C32
            'EvalNoCK:_sup xEVAL CK1NoBlame TRUE ; * B4C55
          'EvalNoCK:_sup xEVAL CK1NoBlame FALSE ; * B4C6E

* ROMPTR 0B5 005
* refs (1): B4B39
ROMP_0B5_005:
        :: SAFE@ ;                               * B4C87

* ROMPTR 0B5 006
* refs (1): B4B39
ROMP_0B5_006:
        :: STRIPTAGSl2 OVER FINDVAR OVERSWAP matchob? ITE SETCIRCERR DROP * B4C96
          OBJ_1552C XEQSTOID ;                   * B4CC3

* ROMPTR 0B5 007
* refs (1): B4B39
ROMP_0B5_007:
        :: ROMPTR 0B5 008 ' ID X ROMPTR 0C4 00C ; * B4CD2

* ROMPTR 0B5 008
* refs (1): B4B39
ROMP_0B5_008:
        :: DUP MINUSONE EQUAL case SETTYPEERR    * B4D00
        ;                                        * B4D1E

* ROMPTR 0B5 009
* refs (1): B4B39
ROMP_0B5_009:
        :: ROMPTR 0B5 008 ' ID X ROMPTR 0C4 00D ; * B4D23

* ROMPTR 0B5 00A
* refs (1): B4B39
ROMP_0B5_00A:
        :: ROMPTR 0B5 008 ROMPTR 0C4 009 ;       * B4D51

* ROMPTR 0B5 00B
* refs (1): B4B39
ROMP_0B5_00B:
        :: ROMPTR 0B5 008 ROMPTR 0C0 001 ;       * B4D71

* ROMPTR 0B5 00C
* refs (1): B4B39
ROMP_0B5_00C:
        :: case DoOldMatrix                      * B4D91
          DoNewMatrix DEPTH #0=case FALSE        * B4DA0
          DUPTYPEARRY? ;                         * B4DB4

* ROMPTR 0B5 00D
* refs (1): B4B39
ROMP_0B5_00D:
        :: SWAPDUP MDIMS NcaseDIMERR #<>case     * B4DBE
          ROMPTR 0C2 022                         * B4DD7
          DUPUNROT ERRSET ROMPTR 0C2 053 ERRTRAP * B4DE2
          :: ROT ROMPTR 0C2 022 ; SWAPDROP ;     * B4DFC

* ROMPTR 0B5 00E
* refs (1): B4B39
ROMP_0B5_00E:
        :: MAT* ;                                * B4E20

* ROMPTR 0B5 00F
* refs (1): B4B39
ROMP_0B5_00F:
        :: ROMPTR 0E6 008 N ;                    * B4E2F

* ROMPTR 0B5 010
* refs (1): B4B39
ROMP_0B5_010:
        :: ROMPTR 0B5 011 ROMPTR 0E6 009 N ;     * B4E49

* ROMPTR 0B5 011
* refs (1): B4B39
ROMP_0B5_011:
        :: DUP MINUSONE EQUAL case drop;q_58A0C  * B4E6E
        ;                                        * B4E8C

* ROMPTR 0B5 012
* refs (1): B4B39
ROMP_0B5_012:
        :: ROMPTR 0E6 008 I%YR ;                 * B4E91

* ROMPTR 0B5 013
* refs (1): B4B39
ROMP_0B5_013:
        :: ROMPTR 0B5 011 ROMPTR 0E6 009 I%YR ;  * B4EAB

* ROMPTR 0B5 014
* refs (1): B4B39
ROMP_0B5_014:
        :: ROMPTR 0E6 008 PV ;                   * B4ED0

* ROMPTR 0B5 015
* refs (1): B4B39
ROMP_0B5_015:
        :: ROMPTR 0B5 011 ROMPTR 0E6 009 PV ;    * B4EEA

* ROMPTR 0B5 016
* refs (1): B4B39
ROMP_0B5_016:
        :: ROMPTR 0E6 008 PMT ;                  * B4F0F

* ROMPTR 0B5 017
* refs (1): B4B39
ROMP_0B5_017:
        :: ROMPTR 0B5 011 ROMPTR 0E6 009 PMT ;   * B4F29

* ROMPTR 0B5 018
* refs (1): B4B39
ROMP_0B5_018:
        :: ROMPTR 0E6 008 FV ;                   * B4F4E

* ROMPTR 0B5 019
* refs (1): B4B39
ROMP_0B5_019:
        :: ROMPTR 0B5 011 ROMPTR 0E6 009 FV ;    * B4F68

* ROMPTR 0B5 01A
* refs (1): B4B39
ROMP_0B5_01A:
        :: ROMPTR 0E6 008 PYR %ABS %IP DUP%0= IT * B4F8D
          :: DROP %12 ;                          * B4FB6
        ;                                        * B4FCA

* ROMPTR 0B5 01B
* refs (1): B4B39
ROMP_0B5_01B:
        :: ROMPTR 0B5 011 %ABS %IP DUP%0= IT     * B4FCF
          :: DROP %12 ;                          * B4FF3
          ROMPTR 0E6 009 PYR ;                   * B5007

* ROMPTR 0B5 01C
* refs (1): B4B39
ROMP_0B5_01C:
        :: ROMPTR 0B5 025 BINT14 SysITE BINT1 BINT2 NTHCOMPDROP ; * B501C

* ROMPTR 0B5 01D
* refs (1): B4B39
ROMP_0B5_01D:
        :: ROMPTR 0B0 09A ITE ROMPTR 0E6 005 ROMPTR 0E6 006 * B504A
        ;                                        * B5075

* ROMPTR 0B5 01E
* refs (1): B4B39
ROMP_0B5_01E:
        :: ' N ROMPTR 0E6 00C DUP ROMPTR 0E6 009 N ; * B507A

* ROMPTR 0B5 01F
* refs (1): B4B39
ROMP_0B5_01F:
        :: ' I%YR ROMPTR 0E6 00C DUP ROMPTR 0E6 009 I%YR ; * B50AE

* ROMPTR 0B5 020
* refs (1): B4B39
ROMP_0B5_020:
        :: ' PV ROMPTR 0E6 00C DUP ROMPTR 0E6 009 PV ; * B50E2

* ROMPTR 0B5 021
* refs (1): B4B39
ROMP_0B5_021:
        :: ' PMT ROMPTR 0E6 00C DUP ROMPTR 0E6 009 PMT ; * B5116

* ROMPTR 0B5 022
* refs (1): B4B39
ROMP_0B5_022:
        :: ' FV ROMPTR 0E6 00C DUP ROMPTR 0E6 009 FV ; * B514A

* ROMPTR 0B5 023
* refs (1): B4B39
ROMP_0B5_023:
        :: ROMPTR 0B5 008 ROMPTR 0E6 004 ;       * B517E

* ROMPTR 0B5 024
* refs (1): B4B39
ROMP_0B5_024:
        :: DUP MINUSONE EQUAL casedrop NULL$     * B519E
          RCLSYSF SWAP ERRSET BINT2 DOFIX ->str1(r) ERRTRAP * B51BC
          :: TYPEBINT? IT DROP                   * B51DF
            STOSYSF ERRJMP ;                     * B51F3
          SWAP STOSYSF ;                         * B5202

* ROMPTR 0B5 025
* refs (1): B4B39
ROMP_0B5_025:
        { ROMPTR 0B5 026 ROMPTR 0B5 027 }        * B5211

* ROMPTR 0B5 026
* refs (1): B4B39
ROMP_0B5_026:
        { # BF4C # BF4D TRUE }                   * B5231

* ROMPTR 0B5 027
* refs (1): B4B39
ROMP_0B5_027:
        { # BF4B # BF4B FALSE }                  * B5254

* ROMPTR 0B5 028
* refs (1): B4B39
ROMP_0B5_028:
        :: 'EQ SAFE@_HERE NOTcase MINUSONE       * B5277
        ;                                        * B5290

* ROMPTR 0B5 029
* refs (1): B4B39
ROMP_0B5_029:
        :: DUP MINUSONE EQUAL caseDROP DOSTOE    * B5295
        ;                                        * B52B3

* ROMPTR 0B5 02A
* refs (1): B4B39
ROMP_0B5_02A:
        :: 'EQ SAFE@_HERE NOTcase MINUSONE       * B52B8
          ROMPTR 0B5 02B ;                       * B52D1

* ROMPTR 0B5 02B
* refs (1): B4B39
ROMP_0B5_02B:
        :: DUP EqList? ITE                       * B52E1
          :: BINT1 NTHELCOMP ; TRUE              * B52F5
          NOTcase MINUSONE                       * B530E
          DUPTYPELIST? NOT?SEMI                  * B5318
          CARCOMP ;                              * B5322

* ROMPTR 0B5 02C
* refs (1): B4B39
ROMP_0B5_02C:
        :: 'EQ SAFE@_HERE NOTcase                * B532C
          :: MINUSONE DUPDUP ;                   * B5340
          DUPTYPELIST? NOTcasedrop               * B5354
          :: MINUSONE DUPDUP ;                   * B535E
          INNERCOMP DUP #3= case DROP            * B5372
          NDROP MINUSONE DUPDUP ;                * B538B

* ROMPTR 0B5 02D
* refs (1): B4B39
ROMP_0B5_02D:
        :: DUP MINUSONE EQUALcase 3DROP          * B539F
          OVER MINUSONE EQUALcase 3DROP          * B53B8
          3PICK MINUSONE EQUALcase 3DROP         * B53CC
          BINT3 {}N DOSTOE ;                     * B53E0

* ROMPTR 0B5 02F
* refs (2): B4B39 B4B39
ROMP_0B5_02F:
        :: BINT1 {}N PUTINDEPLIST ;              * B53F4

* ROMPTR 0B5 030
* refs (1): B4B39
ROMP_0B5_030:
        :: dLISTcase ICMPDRPRTDRP                * B540D
          DROP ZEROZERO ;                        * B541C

* ROMPTR 0B5 031
* refs (1): B4B39
ROMP_0B5_031:
        :: dLISTcase ICMPDRPRTDRP                * B542B
          DROP %0_2A2B4 1REV ;                   * B543A

* ROMPTR 0B5 032
* refs (1): B4B39
ROMP_0B5_032:
        :: dLISTcase ICMPDRPRTDRP                * B544E
          DROP %0_2A2B4 GETXMAX ;                * B545D

* ROMPTR 0B5 035
* refs (3): B4B39 B4B39 B4B39
ROMP_0B5_035:
        :: DUPTYPEBINT? case2drop                * B5471
          :: INDEPVAR PUTINDEP ;                 * B5480
          TWO{}N PUTINDEPLIST ;                  * B5494

* ROMPTR 0B5 036
* refs (1): B4B39
ROMP_0B5_036:
        :: GETXMIN GETXMAX ;                     * B54A3

* ROMPTR 0B5 039
* refs (3): B4B39 B4B39 B4B39
ROMP_0B5_039:
        :: BINT1 {}N depnd(li) ;                 * B54B7

* ROMPTR 0B5 03A
* refs (1): B4B39
ROMP_0B5_03A:
        :: dLISTcase                             * B54D0
          :: ICMPDRPRTDRP OVER TYPEREAL? ?SEMI   * B54DA
            2DROP ZEROZERO ;                     * B54F3
          DROP ZEROZERO ;                        * B5502

* ROMPTR 0B5 03B
* refs (1): B4B39
ROMP_0B5_03B:
        :: DUPTYPEBINT? case2drop                * B5511
          :: OBJ_4D96B depnd(gn) ;               * B5520
          TWO{}N depnd(li) ;                     * B5534

* ROMPTR 0B5 03C
* refs (1): B4B39
ROMP_0B5_03C:
        :: GETYMIN GETYMAX ;                     * B5543

* ROMPTR 0B5 03E
* refs (2): B4B39 B4B39
ROMP_0B5_03E:
        :: DUP TYPEHSTR? case                    * B5557
          :: HXS># DUP#0=case FALSE              * B556B
            UNCOERCE TRUE ;                      * B557F
          DUP %0<> case FALSE                    * B558E
          DROPZERO FALSE ;                       * B55A2

* ROMPTR 0B5 03F
* refs (1): B4B39
ROMP_0B5_03F:
        :: SWAP DUPTYPEBINT? case                * B55B1
          :: SWAPDROP #>HXS PUTRES ;             * B55C5
          SWAP NOTcase PUTRES                    * B55DE
          COERCE #>HXS PUTRES ;                  * B55ED

* ROMPTR 0B5 040
* refs (1): B4B39
ROMP_0B5_040:
        :: case                                  * B5601
          :: 2DROP %1 ;                          * B560B
          ROMPTR 0B5 041 %%1 SWAP %%/>% ;        * B561F

* ROMPTR 0B5 041
* refs (1): B4B39
ROMP_0B5_041:
        :: RclMaxStdPict SWAPDROP #1- UNCOERCE%% SWAP %>%% ROT %>%% %%- %%/ ; * B563E

* ROMPTR 0B5 042
* refs (1): B4B39
ROMP_0B5_042:
        :: 3PICK3PICK SWAP %- % 1.3E2 %/ SWAP NOTcase ROTROT2DROP * B567A
          %>%% 3UNROLL ROMPTR 0B5 041 %%* %%>% ; * B56B7

* ROMPTR 0B5 043
* refs (1): B4B39
ROMP_0B5_043:
        :: RAD? ITE % 3.49065850399E-2 %2        * B56DB
          SWAP NOTcase ROTROT2DROP               * B5704
          %>%% 3UNROLL ROMPTR 0B5 041 %%* %%>% ; * B5713

* ROMPTR 0B5 045
* refs (2): B4B39 B4B39
ROMP_0B5_045:
        :: FALSE ROMPTR 0B5 03F ;                * B5737

* ROMPTR 0B5 047
* refs (2): B4B39 B4B39
ROMP_0B5_047:
        :: SWAP %- %13 %/ ;                      * B5751

* ROMPTR 0B5 049
* refs (2): B4B39 B4B39
ROMP_0B5_049:
        :: Exist@äDAT? NOTcase MINUSONE          * B576F
          OBJ_2D252 ;                            * B5783

* ROMPTR 0B5 04A
* refs (1): B4B39
ROMP_0B5_04A:
        :: ROMPTR 0B5 011 STATCLST å- ;          * B578D

* ROMPTR 0B5 04F
* refs (5): B4B39 B4B39 B4B39 B4B39 B4B39
ROMP_0B5_04F:
        ::                                       * B57AC
          { xFUNCTION ROMPTR 0B5 051 POLAR ROMPTR 0B5 052 xCONIC * B57B1
            ROMPTR 0B5 053 xTRUTH ROMPTR 0B5 054 xPARAMETRIC ROMPTR 0B5 055 * B57DB
            ROMPTR 0AB 00E ROMPTR 0B5 056 xHISTOGRAM ROMPTR 0B5 057 xBAR * B5806  DIFFEQ
            ROMPTR 0B5 058 xSCATTER ROMPTR 0B5 059 ROMPTR 0AB 00C * B5831  SLOPEFIELD
            ROMPTR 0B5 05A ROMPTR 0AB 008 ROMPTR 0B5 05B * B5857  WIREFRAME
            ROMPTR 0AB 00D ROMPTR 0B5 05C        * B5878  PCONTOUR
            ROMPTR 0AB 00B ROMPTR 0B5 05D        * B588E  YSLICE
            ROMPTR 0AB 00A ROMPTR 0B5 05E        * B58A4  GRIDMAP
            ROMPTR 0AB 009 ROMPTR 0B5 05F }      * B58BA  PARSURFACE
          ROMPTR 0B5 07B NcaseSIZEERR ;          * B58D5

* ROMPTR 0B5 050
* refs (1): B4B39
ROMP_0B5_050:
        { ROMPTR 0B5 051 ROMPTR 0B5 052 ROMPTR 0B5 055 ROMPTR 0B5 056 * B58EA
          ROMPTR 0B5 053 ROMPTR 0B5 054 ROMPTR 0B5 057 ROMPTR 0B5 058 * B591B
          ROMPTR 0B5 059 ROMPTR 0B5 05A ROMPTR 0B5 05B ROMPTR 0B5 05C * B5947
          ROMPTR 0B5 05D ROMPTR 0B5 05E ROMPTR 0B5 05F } * B5973

* ROMPTR 0B5 051
* refs (1): B4B39
ROMP_0B5_051:
        { # BE69                                 * B5999
          :: 'IDFUNCTION PUTPTYPE ; }            * B59A8

* ROMPTR 0B5 052
* refs (1): B4B39
ROMP_0B5_052:
        { # BE6A                                 * B59C1
          :: 'IDPOLAR PUTPTYPE ; }               * B59D0

* ROMPTR 0B5 053
* refs (1): B4B39
ROMP_0B5_053:
        { # BE6B                                 * B59E9
          :: 'IDCONIC PUTPTYPE ; }               * B59F8

* ROMPTR 0B5 054
* refs (1): B4B39
ROMP_0B5_054:
        { # BE6C                                 * B5A11
          :: 'IDTRUTH PUTPTYPE ; }               * B5A20

* ROMPTR 0B5 055
* refs (1): B4B39
ROMP_0B5_055:
        { # BE6D                                 * B5A39
          :: 'IDPARAMETER PUTPTYPE ; }           * B5A48

* ROMPTR 0B5 056
* refs (1): B4B39
ROMP_0B5_056:
        { # BE6E                                 * B5A61
          :: ' ROMPTR 0AB 00E PUTPTYPE ; }       * B5A70  DIFFEQ

* ROMPTR 0B5 057
* refs (1): B4B39
ROMP_0B5_057:
        { # BE6F                                 * B5A94
          :: 'IDHISTOGRAM PUTPTYPE ; }           * B5AA3

* ROMPTR 0B5 058
* refs (1): B4B39
ROMP_0B5_058:
        { # BE70                                 * B5ABC
          :: 'IDBAR PUTPTYPE ; }                 * B5ACB

* ROMPTR 0B5 059
* refs (1): B4B39
ROMP_0B5_059:
        { # BE71                                 * B5AE4
          :: 'IDSCATTER PUTPTYPE ; }             * B5AF3

* ROMPTR 0B5 05A
* refs (1): B4B39
ROMP_0B5_05A:
        { # BE72                                 * B5B0C
          :: ' ROMPTR 0AB 00C PUTPTYPE ; }       * B5B1B  SLOPEFIELD

* ROMPTR 0B5 05B
* refs (1): B4B39
ROMP_0B5_05B:
        { # BE73                                 * B5B3F
          :: ' ROMPTR 0AB 008 PUTPTYPE ; }       * B5B4E  WIREFRAME

* ROMPTR 0B5 05C
* refs (1): B4B39
ROMP_0B5_05C:
        { # BE74                                 * B5B72
          :: ' ROMPTR 0AB 00D PUTPTYPE ; }       * B5B81  PCONTOUR

* ROMPTR 0B5 05D
* refs (1): B4B39
ROMP_0B5_05D:
        { # BE75                                 * B5BA5
          :: ' ROMPTR 0AB 00B PUTPTYPE ; }       * B5BB4  YSLICE

* ROMPTR 0B5 05E
* refs (1): B4B39
ROMP_0B5_05E:
        { # BE76                                 * B5BD8
          :: ' ROMPTR 0AB 00A PUTPTYPE ; }       * B5BE7  GRIDMAP

* ROMPTR 0B5 05F
* refs (1): B4B39
ROMP_0B5_05F:
        { # BE77                                 * B5C0B
          :: ' ROMPTR 0AB 009 PUTPTYPE ; }       * B5C1A  PARSURFACE

* ROMPTR 0B5 060
* refs (1): B4B39
ROMP_0B5_060:
        :: BINT31 TestSysFlag NOT ;              * B5C3E

* ROMPTR 0B5 061
* refs (1): B4B39
ROMP_0B5_061:
        :: BINT31 SWAP ITE ClrSysFlag SetSysFlag * B5C57
        ;                                        * B5C75

* ROMPTR 0B5 062
* refs (1): B4B39
ROMP_0B5_062:
        :: BINT28 TestSysFlag ;                  * B5C7A

* ROMPTR 0B5 063
* refs (1): B4B39
ROMP_0B5_063:
        :: BINT28 SWAP ITE SetSysFlag ClrSysFlag * B5C8E
        ;                                        * B5CAC

* ROMPTR 0B5 064
* refs (1): B4B39
ROMP_0B5_064:
        :: dLISTcase                             * B5CB1
          :: ICMPDRPRTDRP DROP ;                 * B5CBB
          DROP %0_2A2B4 ;                        * B5CCF

* ROMPTR 0B5 065
* refs (1): B4B39
ROMP_0B5_065:
        :: ROMPTR 0B5 011 RclDepnd dLISTcase     * B5CDE
          :: INCOMPDROP SWAPDROP ROTSWAP THREE{}N depnd(gn) ; * B5CF8
          SWAP % 1E-4 THREE{}N depnd(gn) ;       * B5D1B

* ROMPTR 0B5 066
* refs (1): B4B39
ROMP_0B5_066:
        :: 7ROLL 7ROLL ROMPTR 0B5 008 OVER XEQSTOID 5ROLL 5ROLL * B5D44
          ROMPTR 0B5 008 OVER XEQSTOID 6ROLL ROMPTR 0B5 008 THREE{}N 3UNROLL * B5D72
          DUPTYPEBINT? ITE DROP TWO{}N           * B5DA1
          ROT ROMPTR 0B5 008 ROMPTR 0C1 00E SWAP BINT2 NTHCOMPDROP OBJ_36E43 ; * B5DB5

* ROMPTR 0B5 067
* refs (1): B4B39
ROMP_0B5_067:
        :: 7ROLL 7ROLL ROMPTR 0B5 008 OVER XEQSTOID 5ROLL 5ROLL * B5DE9
          ROMPTR 0B5 008 OVER XEQSTOID 8ROLL ROMPTR 0B5 008 8ROLL * B5E17
          ROMPTR 0B5 008 8ROLL ROMPTR 0B5 008 BINT5 {}N 3UNROLL DUPTYPEBINT? * B5E41
          ITE DROP TWO{}N                        * B5E70
          ROT ROMPTR 0B5 008 ROMPTR 0C1 01D SWAP BINT2 NTHCOMPDROP OBJ_36E43 ; * B5E7F

* ROMPTR 0B5 068
* refs (1): B4B39
ROMP_0B5_068:
        :: dLISTcase                             * B5EB3
          :: ICMPDRPRTDRP SWAPDROP ;             * B5EBD
          DROP % 1E-4 ;                          * B5ED1

* ROMPTR 0B5 069
* refs (1): B4B39
ROMP_0B5_069:
        :: RclDepnd dLISTcase                    * B5EF0
          :: INCOMPDROP DROP ROT THREE{}N depnd(gn) ; * B5EFF
          %0_2A2B4 ROT THREE{}N depnd(gn) ;      * B5F22

* ROMPTR 0B5 06A
* refs (1): B4B39
ROMP_0B5_06A:
        :: DUPTYPELIST? NOTcasedrop              * B5F3B
          :: %10 %10 TRUE ;                      * B5F4A
          DUPLENCOMP #3= casedrop                * B5F63
          :: %10 %10 TRUE ;                      * B5F72
          BINT2 NTHCOMPDROP DUPTYPELIST? ITE INCOMPDROP DUP * B5F8B
          DUPTYPEREAL? case FALSE                * B5FA9
          #>% SWAP #>% SWAPTRUE ;                * B5FB8

* ROMPTR 0B5 06B
* refs (1): B4B39
ROMP_0B5_06B:
        :: IT                                    * B5FD1
          :: %># SWAP %># SWAP ;                 * B5FDB
          BINT2 {}N RclAx*s DUPTYPELIST? IT CARCOMP * B5FF9
          SWAP BINT2 {}N OBJ_4502E ;             * B6017

* ROMPTR 0B5 06C
* refs (1): B4B39
ROMP_0B5_06C:
        :: RclAx*s DUPTYPELIST? NOTcasedrop      * B6030
          :: NULL$ NULL$ ;                       * B6044
          INNERCOMP DUP #2= case2drop            * B6058
          :: DROP NULL$ NULL$ ;                  * B606C
          #3= case ROTDROP                       * B6085
          2SWAP 2DROP ;                          * B6094

* ROMPTR 0B5 06D
* refs (1): B4B39
ROMP_0B5_06D:
        :: BINT2 {}N OBJ_4502E ;                 * B60A3

* ROMPTR 0B5 06E
* refs (1): B4B39
ROMP_0B5_06E:
        :: BINT5 PPAR(s);dup;li? IT CARCOMP      * B60BC
        ;                                        * B60D5

* ROMPTR 0B5 06F
* refs (1): B4B39
ROMP_0B5_06F:
        :: BINT5 PPAR(s);dup;li? ITE             * B60DA
          :: CDRCOMP SWAP >HCOMP ; DROP          * B60EE
          BINT3 PutBackPPAR(_,s) ;               * B610C

* ROMPTR 0B5 070
* refs (1): B4B39
ROMP_0B5_070:
        :: BINT29 TestSysFlag NOT ;              * B611B

* ROMPTR 0B5 071
* refs (1): B4B39
ROMP_0B5_071:
        :: BINT29 SWAP ITE ClrSysFlag SetSysFlag * B6134
        ;                                        * B6152

* ROMPTR 0B5 072
* refs (1): B4B39
ROMP_0B5_072:
        :: OBJ_4681A NOTcase OBJ_0FDD1           * B6157
          ROMPTR 0B5 073 NOTcasedrop OBJ_0FDD1   * B616B
          SWAP ROMPTR 0B5 073 NOTcasedrop OBJ_0FDD1 * B6180
          SWAP 2DUP %MIN %0< case2drop OBJ_0FDD1 * B619A
          2DUP %MAX RclDepnd ROMPTR 0B5 064 DUPTYPEREAL? ITE * B61B8
          :: DROP BINT1 ; ARSIZE                 * B61DC
          UNCOERCE %> case2drop OBJ_0FDD1        * B61F5
        ;                                        * B6209

* ROMPTR 0B5 073
* refs (1): B4B39
ROMP_0B5_073:
        :: palparse NOTcasedrop 2DROPFALSE       * B620E
          DUPTYPEREAL? NOTcasedrop FALSE         * B6222
          TRUE ;                                 * B6231

* ROMPTR 0B5 074
* refs (1): B4B39
ROMP_0B5_074:
        :: DUP MINUSONE EQUAL 3PICK MINUSONE EQUAL OR case 2DROP * B623B
          a%>$ SWAP a%>$ SWAP TWO{}N OBJ_4502E ; * B626D

* ROMPTR 0B5 075
* refs (1): B4B39
ROMP_0B5_075:
        :: OBJ_496A0 NOTcase                     * B6290
          :: %4 %4 FALSE ;                       * B629F
          DROP DUPTYPEREAL? 3PICK TYPEREAL? AND 4PICK TYPEREAL? AND NOTcase * B62B8
          :: 3DROP %4 %4 FALSE ;                 * B62E5
          %0= NOT ;                              * B6303

* ROMPTR 0B5 076
* refs (1): B4B39
ROMP_0B5_076:
        :: ITE %1 %0_2A2B4                       * B6312
          OBJ_496A0 ITE 4UNROLL3DROP NULL{}      * B6326
          OBJ_49A74 ;                            * B633A

* ROMPTR 0B5 077
* refs (1): B4B39
ROMP_0B5_077:
        :: OBJ_45EC4 ;                           * B6344

* ROMPTR 0B5 078
* refs (1): B4B39
ROMP_0B5_078:
        :: DOERASE ;                             * B6353

* ROMPTR 0B5 079
* refs (1): B4B39
ROMP_0B5_079:
        :: SWAP                                  * B6362
          { LAM 'SaveAnim } BIND IT AUTOSCALE    * B636C
          OBJ_4C2CE ABND ;                       * B639E

* ROMPTR 0B5 07A
* refs (1): B4B39
ROMP_0B5_07A:
        :: 'EQ SAFE@_HERE NOTcase ERRJMP         * B63AD
          DUPTYPELIST? DUPUNROT ITE              * B63C6
          :: INNERCOMP DUP #3= NOTcase doerr607  * B63D5
          ;                                      * B63F3
          BINT1                                  * B63F8
          INDEPVAR GETINDEP ROMPTR 0B5 032 3UNROLL OVER XEQSTOID OBJ_4D96B * B63FD
          RclDepnd ROMPTR 0B5 064 OVER XEQSTOID 4ROLL #1= ITE * B6426
          :: 4ROLL THREE{}N ;                    * B644F
          :: 6ROLL 6ROLL 6ROLL BINT5 {}N ;       * B6463
          ROMPTR 0B5 072 DUP MINUSONE EQUAL IT   * B6486
          :: 2DROP %0_2A2B4 %1 ;                 * B64A5
          %>C% RclDepnd ROMPTR 0B5 068 GETRES DUP TYPEHSTR? IT * B64BE
          :: HXS># UNCOERCE ;                    * B64E7
          5ROLL 6ROLL case ROMPTR 0C1 003        * B64FB
          COLA ROMPTR 0C1 000                    * B6515
        ;                                        * B6525

* ROMPTR 0B5 07B
* refs (1): B4B39
ROMP_0B5_07B:
        :: '                                     * B652A
          :: ?ROMPTR@ SWAP ?ROMPTR@ EQUAL ; SWAP Lookup ; * B6534

* ROMPTR 0B5 07C
* refs (1): B4B39
ROMP_0B5_07C:
        :: BINT2 BINT1 ROMPTR 0B5 08F ;          * B6561

* ROMPTR 0B5 07D
* refs (1): B4B39
ROMP_0B5_07D:
        :: BINT2 BINT1 ROMPTR 0B5 090 ;          * B6580

* ROMPTR 0B5 07E
* refs (1): B4B39
ROMP_0B5_07E:
        :: BINT1 BINT1 ROMPTR 0B5 08F ;          * B659F

* ROMPTR 0B5 07F
* refs (1): B4B39
ROMP_0B5_07F:
        :: BINT1 BINT1 ROMPTR 0B5 090 ;          * B65BE

* ROMPTR 0B5 080
* refs (1): B4B39
ROMP_0B5_080:
        :: BINT15 BINT14 BINT2 ROMPTR 0B5 08F ;  * B65DD

* ROMPTR 0B5 081
* refs (1): B4B39
ROMP_0B5_081:
        :: BINT15 SWAP BINT14 BINT2 ROMPTR 0B5 090 ; * B6601

* ROMPTR 0B5 082
* refs (1): B4B39
ROMP_0B5_082:
        :: BINT13 BINT12 BINT2 ROMPTR 0B5 08F ;  * B662A

* ROMPTR 0B5 083
* refs (1): B4B39
ROMP_0B5_083:
        :: BINT13 SWAP BINT12 BINT2 ROMPTR 0B5 090 ; * B664E

* ROMPTR 0B5 084
* refs (1): B4B39
ROMP_0B5_084:
        :: BINT11 BINT10 BINT2 ROMPTR 0B5 08F ;  * B6677

* ROMPTR 0B5 085
* refs (1): B4B39
ROMP_0B5_085:
        :: BINT11 SWAP BINT10 BINT2 ROMPTR 0B5 090 ; * B669B

* ROMPTR 0B5 086
* refs (1): B4B39
ROMP_0B5_086:
        :: BINT5 BINT4 BINT3 BINT3 ROMPTR 0B5 08F ; * B66C4

* ROMPTR 0B5 087
* refs (1): B4B39
ROMP_0B5_087:
        :: BINT5 3UNROLL BINT4 SWAP BINT3 BINT3 ROMPTR 0B5 090 ; * B66ED

* ROMPTR 0B5 088
* refs (1): B4B39
ROMP_0B5_088:
        :: BINT9 BINT8 BINT2 ROMPTR 0B5 08F ;    * B6720

* ROMPTR 0B5 089
* refs (1): B4B39
ROMP_0B5_089:
        :: BINT9 SWAP BINT8 BINT2 ROMPTR 0B5 090 ; * B6744

* ROMPTR 0B5 08A
* refs (1): B4B39
ROMP_0B5_08A:
        :: BINT7 BINT6 BINT2 ROMPTR 0B5 08F ;    * B676D

* ROMPTR 0B5 08B
* refs (1): B4B39
ROMP_0B5_08B:
        :: BINT7 SWAP BINT6 BINT2 ROMPTR 0B5 090 ; * B6791

* ROMPTR 0B5 08C
* refs (1): B4B39
ROMP_0B5_08C:
        :: {}_23989 ERRSET ROMPTR 0F1 00A ERRTRAP ROMPTR 0B5 08D BINT16 ROLL * B67BA
          DROP ;                                 * B67EE

* ROMPTR 0B5 08D
* refs (1): B4B39
ROMP_0B5_08D:
        :: BEGIN {}_23989 EQ UNTIL {}_23989      * B67F8

* ROMPTR 0B5 08E
* refs (1): B4B39
ROMP_0B5_08E:
          { %-1 %1 %-1 %1 %-1 %1 %-1 %1 %-1 %1 %0_2A2B4 %-3 %0_2A2B4 %10 %8 } * B6816
          INCOMPDROP ;                           * B686B

* ROMPTR 0B5 08F
* refs (1): B4B39
ROMP_0B5_08F:
        :: ROMPTR 0B5 08C BINT16 PICK ZERO_DO BINT17 ROLL INDEX@ #- ROLL * B6875
          BINT15 UNROLL LOOP BINT16 ROLL BINT15 SWAP #- NDROP ; * B68AD

* ROMPTR 0B5 090
* refs (1): B4B39
ROMP_0B5_090:
        :: ROMPTR 0B5 08C BINT16 PICK ZERO_DO BINT17 PICK ROLL DROP BINT17 * B68DF
          ROLL BINT17 ROLL UNROLL LOOP BINT15 {}N SWAPDROP * B6917

* ROMPTR 0B5 091
* refs (1): B4B39
ROMP_0B5_091:
          :: ' ID VPAR STOAPPLDATA ; ;           * B693F

* ROMPTR 0B5 092
* refs (1): B4B39
ROMP_0B5_092:
        :: ' ID EXPR SAFE@_HERE ?SEMI            * B6967
          MINUSONE ;                             * B698A

* ROMPTR 0B5 093
* refs (1): B4B39
ROMP_0B5_093:
        :: DUP MINUSONE EQUAL caseDROP '         * B6994
          ID EXPR XEQSTOID ;                     * B69B2

* ROMPTR 0B5 094
* refs (1): B4B39
ROMP_0B5_094:
        :: BINT3 TestSysFlag NOT ;               * B69CB

* ROMPTR 0B5 095
* refs (1): B4B39
ROMP_0B5_095:
        :: BINT1 TestSysFlag ;                   * B69E4

* ROMPTR 0B5 096
* refs (1): B4B39
ROMP_0B5_096:
        :: BINT1 SWAP ITE SetSysFlag ClrSysFlag  * B69F8
        ;                                        * B6A16

* ROMPTR 0B5 097
* refs (1): B4B39
ROMP_0B5_097:
        :: NOTNUM? SWAP ITE SETNUM CLRNUM        * B6A1B
          case                                   * B6A39
          :: 2SWAP ERRSET XEQINTEGID ERRTRAP cf(-3);error CLRNUM ; * B6A3E
          2SWAP ERRSET XEQINTEGID ERRTRAP sf(-3);error SETNUM ; * B6A66

* ROMPTR 0B5 098
* refs (1): B4B39
ROMP_0B5_098:
        :: 2DUP ITE                              * B6A89
          :: MINUSONE EQUAL NOT?SEMI             * B6A98
            DROPFALSE ;                          * B6AAC
          DROP                                   * B6AB6
          2SWAP DUP symcomp ROT symcomp BINT2 Cr xDER 2SWAP case * B6ABB
          :: ROTSWAP TWO{}N WHERE CRUNCH ;       * B6AED
          DROP SWAPDUP symcomp TWO{}N uncrunch WHERE ; * B6B0B

* ROMPTR 0B5 099
* refs (1): B4B39
ROMP_0B5_099:
        :: 2DROP ROMPTR 0B5 008 SWAP ROMPTR 0B5 008 SWAP symcomp SWAP * B6B2E
          symcomp BINT2 Cr xDER uncrunch COMPEVAL ; * B6B62

* ROMPTR 0B5 09A
* refs (1): B4B39
ROMP_0B5_09A:
        :: NOTcase SYMTAYLR                      * B6B85
          SYMTAYLR CRUNCH ;                      * B6B94

* ROMPTR 0B5 09B
* refs (1): B4B39
ROMP_0B5_09B:
        :: NOTcase SYMISOL                       * B6BA3
          SYMISOL OBJ_49B7D CRUNCH ;             * B6BB2

* ROMPTR 0B5 09C
* refs (1): B4B39
ROMP_0B5_09C:
        :: NOTcase SYMQUAD                       * B6BC6
          SYMQUAD OBJ_49B7D CRUNCH ;             * B6BD5

* ROMPTR 0B5 09D
* refs (1): B4B39
ROMP_0B5_09D:
        :: ROMPTR 0B5 008 SYMCOLCT ;             * B6BE9

* ROMPTR 0B5 09E
* refs (1): B4B39
ROMP_0B5_09E:
        :: ROMPTR 0B5 008 SYMEXPAN ;             * B6C03

* ROMPTR 0B5 09F
* refs (1): B4B39
ROMP_0B5_09F:
        :: SWAP 4UNROLL ROT ROMPTR 0B5 008 ROT ROMPTR 0B5 008 ROT DUP * B6C1D
          MINUSONE EQUAL ITE                     * B6C56
          :: DROP BINT2 ; BINT3                  * B6C65
          {}N ROT ROMPTR 0B5 008 SWAPROT ITE xMATCHUP xMATCHDN * B6C7E
          DROP ;                                 * B6CA7

* ROMPTR 0B5 0A0
* refs (1): B4B39
ROMP_0B5_0A0:
        { ROMPTR 0B5 0A1 ROMPTR 0B5 0A2 }        * B6CB1

* ROMPTR 0B5 0A1
* refs (1): B4B39
ROMP_0B5_0A1:
        { # BD26 FALSE }                         * B6CD1

* ROMPTR 0B5 0A2
* refs (1): B4B39
ROMP_0B5_0A2:
        { # BD27 TRUE }                          * B6CEA

* ROMPTR 0B5 0A3
* refs (1): B4B39
ROMP_0B5_0A3:
        :: TOD                                   * B6D03

* ROMPTR 0B5 0A4
* refs (1): B4B39
ROMP_0B5_0A4:
          :: DUP %IP SWAP %FP %100 %* DUP %IP SWAP %FP %100 %* %IP * B6D0D
            ROMPTR 0B5 0B5                       * B6D53
            :: BINT41 TestSysFlag case BINT3     * B6D5E
              4PICK %12 %> ITE                   * B6D77
              :: 4ROLL %12 %- 4UNROLL BINT2 ;    * B6D8B
              :: 4PICK %12 %= case BINT2         * B6DAE
                4ROLL DUP%0= IT                  * B6DCC
                :: DROP %12 ;                    * B6DDB
                4UNROLL BINT1 ;                  * B6DEF
            ;                                    * B6DFE
            NTHCOMPDROP ;                        * B6E03
        ;                                        * B6E0D

* ROMPTR 0B5 0A5
* refs (1): B4B39
ROMP_0B5_0A5:
        :: ROMPTR 0B0 09D 5UNROLL 5UNROLL %IP % 1E4 %/ SWAP %IP %100 %/ %+ * B6E12
          SWAP %IP                               * B6E64
          :: 4ROLL case ROTDROP                  * B6E6E
            3PICK ?SKIP                          * B6E82
            :: DUP %12 %= casedrop %0_2A2B4      * B6E8C
            ;                                    * B6EAA
            ROT OVER %12 %< AND IT               * B6EAF
            :: %12 %+ ;                          * B6ECD
          ;                                      * B6EE1
          %+ >TIME ;                             * B6EE6

* ROMPTR 0B5 0A6
* refs (1): B4B39
ROMP_0B5_0A6:
        :: DATE                                  * B6EF5

* ROMPTR 0B5 0A7
* refs (1): B4B39
ROMP_0B5_0A7:
          :: DUP %IP SWAP %FP %100 %* DUP %IP SWAP %100 %* %FP %100 %* * B6EFF
            BINT42 TestSysFlag IT ROTSWAP        * B6F4A
          ;                                      * B6F5E
        ;                                        * B6F63

* ROMPTR 0B5 0A8
* refs (1): B4B39
ROMP_0B5_0A8:
        :: BINT42 TestSysFlag IT ROTSWAP         * B6F68
          %IP %100 %/ %FP %100 %* COERCE ROMPTR 0B5 0AA SWAP %IP %100 %/ %FP * B6F81
          %+ %+ >DATE ;                          * B6FC8

* ROMPTR 0B5 0A9
* refs (1): B4B39
ROMP_0B5_0A9:
        :: OVER                                  * B6FDC
          CON(5)  DOARRY                         * B6FE6  array 12
          LENGTH                                 * B6FEB  length, to #B703B
          CON(5)  DOBINT                         * B6FF0  element type
          CON(5)  1                              * B6FF5  dimensions
          CON(5)  12                             * B6FFA
          NIBHEX  F1000                          * B6FFF  #1F
          NIBHEX  C1000                          * B7004  #1C
          NIBHEX  F1000                          * B7009  #1F
          NIBHEX  E1000                          * B700E  #1E
          NIBHEX  F1000                          * B7013  #1F
          NIBHEX  E1000                          * B7018  #1E
          NIBHEX  F1000                          * B701D  #1F
          NIBHEX  F1000                          * B7022  #1F
          NIBHEX  E1000                          * B7027  #1E
          NIBHEX  F1000                          * B702C  #1F
          NIBHEX  E1000                          * B7031  #1E
          NIBHEX  F1000                          * B7036  #1F
        ENDLENGTH                                * B703B
          GETATELN DROP SWAPROT #2<> caseDROP BINT42 * B703B
          SysITE % 2.902E1 % 2.29E0 SWAP         * B7059

* ROMPTR 0B5 0AA
* refs (1): B4B39
ROMP_0B5_0AA:
          :: DUP # 5A #> ITE # 76C # 7D0         * B708D
            #+ UNCOERCE % 1E6 %/ ;               * B70BF
          %+                                     * B70E8
          CODE                                   * B70ED  51 nibbles
            GOSBVL  POP1%                        * B70F7
            GOSBVL  SUB_0D8B7                    * B70FE
            GOSBVL  SUB_0D36C                    * B7105
            SETHEX                               * B710C
            ST=0    1                            * B710E
            GONC    L_B7117                      * B7111
            ST=1    1                            * B7114
L_B7117:
            GOSBVL  GETPTR                       * B7117
            ?ST=1   1                            * B711E
            GOYES   L_B7123                      * B7121
L_B7123:
            GOVLNG  PushT/FLoop                  * B7123
          ENDCODE                                * B712A
          ?SEMI                                  * B712A
          #1+ ;                                  * B712F

* ROMPTR 0B5 0AB
* refs (1): B4B39
ROMP_0B5_0AB:
        :: ROMPTR 0B5 0AA BINT42 TestSysFlag IT ROTSWAP * B7139
          SWAP UNCOERCE %100 %/ %+ SWAP UNCOERCE %+ Date>hxs13 * B715D
          CODE                                   * B718A  53 nibbles
            A=DAT1  A                            * B7194
            AD1EX                                * B7197
            D1=D1+  10                           * B719A
            C=0     W                            * B719D
            C=DAT1  13                           * B71A0
            R0=C                                 * B71A4
            D1=A                                 * B71A7
            D1=D1+  5                            * B71AA
            D=D+1   A                            * B71AD
            GOSBVL  SAVPTR                       * B71AF
            C=R0                                 * B71B6
            GOSBVL  dowutil                      * B71B9
            SETHEX                               * B71C0
            GOVLNG  PUSH#ALOOP                   * B71C2
          ENDCODE                                * B71C9
        ;                                        * B71C9

* ROMPTR 0B5 0AC
* refs (1): B4B39
ROMP_0B5_0AC:
        :: ROMPTR 0B0 09A 6ROLL ROMPTR 0B0 09D SWAP BINT11 UNROLL 4ROLL %IP * B71CE
          %100 %/ %FP %100 %* COERCE ROMPTR 0B5 0AA 5ROLL 6ROLL BINT42 * B7207
          TestSysFlag ?SKIP SWAP                 * B723F
          %IP %100 %/ %FP ROT %+ SWAP %IP %100 %/ %FP %100 %* %+ 8UNROLL * B724E
          4ROLL %IP %100 %/ %FP %100 %/ 5ROLL %IP %100 %/ %FP %+ 5ROLL %IP * B7299
          %100 %/ %FP %100 %*                    * B72E4
          :: ROT 8ROLL caseDROP ITE              * B72FD
            :: DUP %11 %> ?SEMI                  * B7316
              %12 %+ ;                           * B732F
            :: DUP %12 %<> ?SEMI                 * B733E
              DROP %0_2A2B4 ;                    * B7357
          ;                                      * B7366
          %+ 4UNROLL %* SWAPDUP MINUSONE EQUAL IT DROPNULL$ * B736B
          SWAP StoAlarms(2r,_,r) DROP ;          * B7393

* ROMPTR 0B5 0AD
* refs (1): B4B39
ROMP_0B5_0AD:
        :: ROMPTR 0B0 09D DROP BINT41 SWAP ITE SetSysFlag ClrSysFlag * B73A7
        ;                                        * B73D5

* ROMPTR 0B5 0AE
* refs (1): B4B39
ROMP_0B5_0AE:
        :: BINT42 SysITE ROMPTR 0B5 0D4 ROMPTR 0B5 0D3 ; * B73DA

* ROMPTR 0B5 0AF
* refs (1): B4B39
ROMP_0B5_0AF:
        :: ROMPTR 0B0 09A BINT42 SWAP ITE SetSysFlag ClrSysFlag * B7404
        ;                                        * B742D

* ROMPTR 0B5 0B0
* refs (1): B4B39
ROMP_0B5_0B0:
        :: 2DUP ROMPTR 0B5 0A9 3NULLLAM{} BIND 1GETLAM #1+_ONE_DO INDEX@ DUP * B7432
          DUP #>$ SWAP BINT10 #< IT              * B7465
          :: CHR_Space >H$ ;                     * B7483
          APPEND_SPACE                           * B7497
          { # BC15 # BC16 # BC17 # BC18 # BC19 # BC1A # BC1B } 3GETLAM * B749C
          INDEX@ 2GETLAM ROMPTR 0B5 0AB NTHCOMPDROP JstGetTHEMESG &$ SWAP * B74F1
          UNCOERCE TWO{}N LOOP 1GETABND {}N ;    * B751A

* ROMPTR 0B5 0B1
* refs (1): B4B39
ROMP_0B5_0B1:
        :: DUP COERCE BINT4 ZERO_DO #1+ BINT100 #/ DROP DUP UNCOERCE SWAP * B7538
          LOOP DROP BINT5 {}N ;                  * B7574

* ROMPTR 0B5 0B2
* refs (1): B4B39
ROMP_0B5_0B2:
        :: BINT60 ZERO_DO INDEX@ UNCOERCE LOOP BINT60 {}N ; * B758D

* ROMPTR 0B5 0B3
* refs (1): B4B39
ROMP_0B5_0B3:
        { %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 }       * B75BA

* ROMPTR 0B5 0B4
* refs (1): B4B39
ROMP_0B5_0B4:
        { %0_2A2B4 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 * B75F6
          %17 %18 %19 %20 %21 %22 %23 }          * B7650

* ROMPTR 0B5 0B5
* refs (1): B4B39
ROMP_0B5_0B5:
        { ROMPTR 0B5 0B6 ROMPTR 0B5 0B7 ROMPTR 0B5 0B8 } * B7678

* ROMPTR 0B5 0B6
* refs (1): B4B39
ROMP_0B5_0B6:
        { # BC1D # BC1D                          * B76A3
          :: FALSE FALSE ; }                     * B76BC

* ROMPTR 0B5 0B7
* refs (1): B4B39
ROMP_0B5_0B7:
        { # BC1E # BC1E                          * B76D5
          :: FALSE TRUE ; }                      * B76EE

* ROMPTR 0B5 0B8
* refs (1): B4B39
ROMP_0B5_0B8:
        { # BC1F # BC20                          * B7707
          :: TRUE FALSE ; }                      * B7720

* ROMPTR 0B5 0B9
* refs (1): B4B39
ROMP_0B5_0B9:
        { ROMPTR 0B5 0BA ROMPTR 0B5 0BB ROMPTR 0B5 0BC ROMPTR 0B5 0BD * B7739
          ROMPTR 0B5 0BE ROMPTR 0B5 0BF ROMPTR 0B5 0C0 ROMPTR 0B5 0C1 * B776A
          ROMPTR 0B5 0C2 ROMPTR 0B5 0C3 ROMPTR 0B5 0C4 ROMPTR 0B5 0C5 } * B7796

* ROMPTR 0B5 0BA
* refs (1): B4B39
ROMP_0B5_0BA:
        { # BC21 %1 }                            * B77C7

* ROMPTR 0B5 0BB
* refs (1): B4B39
ROMP_0B5_0BB:
        { # BC22 %2 }                            * B77E0

* ROMPTR 0B5 0BC
* refs (1): B4B39
ROMP_0B5_0BC:
        { # BC23 %3 }                            * B77F9

* ROMPTR 0B5 0BD
* refs (1): B4B39
ROMP_0B5_0BD:
        { # BC24 %4 }                            * B7812

* ROMPTR 0B5 0BE
* refs (1): B4B39
ROMP_0B5_0BE:
        { # BC25 %5 }                            * B782B

* ROMPTR 0B5 0BF
* refs (1): B4B39
ROMP_0B5_0BF:
        { # BC26 %6 }                            * B7844

* ROMPTR 0B5 0C0
* refs (1): B4B39
ROMP_0B5_0C0:
        { # BC27 %7 }                            * B785D

* ROMPTR 0B5 0C1
* refs (1): B4B39
ROMP_0B5_0C1:
        { # BC28 %8 }                            * B7876

* ROMPTR 0B5 0C2
* refs (1): B4B39
ROMP_0B5_0C2:
        { # BC29 %9 }                            * B788F

* ROMPTR 0B5 0C3
* refs (1): B4B39
ROMP_0B5_0C3:
        { # BC2A %10 }                           * B78A8

* ROMPTR 0B5 0C4
* refs (1): B4B39
ROMP_0B5_0C4:
        { # BC2B %11 }                           * B78C1

* ROMPTR 0B5 0C5
* refs (1): B4B39
ROMP_0B5_0C5:
        { # BC2C %12 }                           * B78DA

* ROMPTR 0B5 0C6
* refs (1): B4B39
ROMP_0B5_0C6:
        { ROMPTR 0B5 0C7 ROMPTR 0B5 0C9 ROMPTR 0B5 0CB ROMPTR 0B5 0CD * B78F3
          ROMPTR 0B5 0CF }                       * B7924

* ROMPTR 0B5 0C7
* refs (1): B4B39
ROMP_0B5_0C7:
        { # BC2D BINT1                           * B7934

* ROMPTR 0B5 0C8
* refs (1): B4B39
ROMP_0B5_0C8:
          % 4.9545216E9 }                        * B7948

* ROMPTR 0B5 0C9
* refs (1): B4B39
ROMP_0B5_0C9:
        { # BC2E BINT2                           * B7962

* ROMPTR 0B5 0CA
* refs (1): B4B39
ROMP_0B5_0CA:
          % 7.077888E8 }                         * B7976

* ROMPTR 0B5 0CB
* refs (1): B4B39
ROMP_0B5_0CB:
        { # BC2F BINT3                           * B7990

* ROMPTR 0B5 0CC
* refs (1): B4B39
ROMP_0B5_0CC:
          % 2.94912E7 }                          * B79A4

* ROMPTR 0B5 0CD
* refs (1): B4B39
ROMP_0B5_0CD:
        { # BC30 BINT4                           * B79BE

* ROMPTR 0B5 0CE
* refs (1): B4B39
ROMP_0B5_0CE:
          % 4.9152E5 }                           * B79D2

* ROMPTR 0B5 0CF
* refs (1): B4B39
ROMP_0B5_0CF:
        { # BC31 BINT5                           * B79EC

* ROMPTR 0B5 0D0
* refs (1): B4B39
ROMP_0B5_0D0:
          % 8.192E3 }                            * B7A00

* ROMPTR 0B5 0D1
* refs (1): B4B39
ROMP_0B5_0D1:
        { # BC32 # BC33 # BC34 # BC35 # BC36 }   * B7A1A

* ROMPTR 0B5 0D2
* refs (1): B4B39
ROMP_0B5_0D2:
        { ROMPTR 0B5 0D3 ROMPTR 0B5 0D4 }        * B7A56

* ROMPTR 0B5 0D3
* refs (1): B4B39
ROMP_0B5_0D3:
        { # BC37 # BC38 FALSE }                  * B7A76

* ROMPTR 0B5 0D4
* refs (1): B4B39
ROMP_0B5_0D4:
        { # BC39 # BC3A TRUE }                   * B7A99

* ROMPTR 0B5 0D5
* refs (1): B4B39
ROMP_0B5_0D5:
        :: ALARMS@ LENCOMP ;                     * B7ABC

* ROMPTR 0B5 0D6
* refs (1): B4B39
ROMP_0B5_0D6:
        :: RCLALM NOTcase NOALARMERR             * B7AD0
        ;                                        * B7AE4

* ROMPTR 0B5 0D7
* refs (1): B4B39
ROMP_0B5_0D7:
        :: ALRMLS> INCOMPDROP 2SWAP TIMESTR SWAP %0= ITE $ "   " $ " R " * B7AE9
          &$ SWAP DUP MINUSONE EQUAL caseDROP DUPTYPECSTR? * B7B31
          ?SKIP                                  * B7B54
          :: BINT4 ROMPTR 0B0 074 ;              * B7B59
          &$ ;                                   * B7B73
