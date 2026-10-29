* HP 48GX ROM revision R, #96268-#98E01: Library part 0C2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #96268 in the original ROM).
        RPL

* ROMPTR 0C2 040
* refs (1): 90007
ROMP_0C2_040:
        :: ROTOVER PULL%%EL SWAP3PICK 3GETLAM #+ PULL%%EL SWAP 5PICK * 96268
          PULL%%EL SWAP 4UNROLL 3PICK %%ABS OVER %%ABS 2DUP %%< DUP 7UNROLL * 96295
          ITE                                    * 962CC
          :: SWAP 5ROLL 3UNROLL 4ROLL 5UNROLL BINT2 ; BINT0 * 962D1
          5PICK %%ABS DUPUNROT 5PICK %%<= ?SKIP DROPONE * 962FE
          7UNROLL                                * 96321
          :: 4dropn;IU! casedrop                 * 96326
            :: %%1 %%0 2DUP ;                    * 96335
            3PICKOVER %%/ 1+(rr) %%1 EQUALcase   * 9634E
            :: SWAPROT 3PICK3PICK %%1 %%> ITE    * 96367
              :: ROT %%/ %%/ ;                   * 96385
              :: %%/ %%* ;                       * 9639E
              %%1 4PICK 6PICK %%/ 7PICK 7PICK %%/ %%1 ; * 963B2
            DROP 2DUP %%- 3PICK %%/ 5PICK 7PICK %%/ %%2 3PICK %%- OVERDUP * 963DF
            %%* OVERDUP %%* OVER %%+ %%SQRT SWAP 5PICK DUP %%+* %%SQRT 2DUP * 9641B
            %%+ OBJ_37B30 8ROLL OVER %%* 8ROLL 3PICK %%/ 7PICK 7ROLL 7ROLL * 96457
            %%+ %%/ 6PICK 8ROLL 7ROLL %%+ %%/ %%+ 4PICK 1+(rr) %%* %%4 * 9648E
            OVERDUP %%+* %%SQRT %%2 OVER %%/ 3UNROLL %%/ 2DUP 8ROLL %%+* * 964CA
            6PICK %%/ 7PICK BINT10 PICK %%/ 3PICK %%* 7ROLL %%/ 2SWAP ; * 96501
          BINT11 ROLL IT                         * 9653D
          :: BINT9 ROLL 7UNROLL 8ROLL 9rolld 4UNROLL SWAPROT ; * 9654C
          6ROLL 6ROLL BINT10 ROLL DUP#0= ITE     * 96579
          :: DROP 4PICK OBJ_36C2A 6PICK OBJ_36C2A BINT9 PICK OBJ_36C2A ; * 96597
          :: #1=case                             * 965C9
            :: 3PICK OBJ_36C2A 6PICK OBJ_36C2A 8PICK OBJ_36C2A ; * 965D3
            3PICK OBJ_36C2A 5PICK OBJ_36C2A 7PICK OBJ_36C2A ; * 965FB
          8ROLL DROP 7ROLL OBJ_36BD5 7ROLL OBJ_36BD5 7ROLL SWAP BINT9 PICK * 9661E
          PUT%%EL SWAP 7PICK PUT%%EL %%0 7PICK 3GETLAM #+ PUT%%EL 7UNROLL * 96650
          BINT9 PICK 3UNROLL 6PICK 1GETLAM 11GETLAM EVAL 6PICK 3UNROLL 4ROLL * 96682
          2GETLAM 10GETLAM EVAL #2- ;            * 966B4

* ROMPTR 0C2 041
* refs (1): 90007
ROMP_0C2_041:
        :: ROT 3PICK PULL%%EL %%ABS %%1E-13 %%* SWAP 4PICK 3GETLAM #1-+ * 966CD
          PULL%%EL %%ABS ROT %%<= case           * 96704
          :: %%0 4PICK 3GETLAM #1-+ PUT%%EL 3UNROLL TRUE ; * 9671D
          OVER PULL%%EL %%ABS DUP 4PICK BEGIN CkATTNQUIT 4ROLLOVER 3GETLAM * 9674A
          #+ PULL%%EL %%ABS DUP 6PICK %%3E-13 %%* %%<= casedrop * 96777
          :: RDROP OBJ_37B03 %%0 ROT 3GETLAM #+ PUT%%EL 3UNROLL TRUE ; * 967A4
          5ROLL DUPUNROT %%+ %%/ SWAP3PICK #1+ PULL%%EL %%ABS ROT %%* * 967DB
          4ROLLOVER OBJ_37DA0 4ROLL #1+ 6PICK OVER#= UNTIL DROPSWAPDROP SWAP * 9680D
          4UNROLL FALSE ;                        * 9683A

* ROMPTR 0C2 042
* refs (1): 90007
ROMP_0C2_042:
        :: ROTOVER PULL%%EL %%ABS %%1E-13 %%* SWAP3PICK 3GETLAM #+ PULL%%EL * 96849
          %%ABS ROT %%<= case                    * 9687B
          :: %%0 3PICK 3GETLAM #+ PUT%%EL 3UNROLL TRUE ; * 9688F
          3PICK PULL%%EL %%ABS DUP 5PICK BEGIN CkATTNQUIT #1- 4ROLLOVER * 968BC
          3GETLAM #+ PULL%%EL %%ABS DUP 6PICK %%3E-13 %%* %%<= casedrop * 968E9
          :: RDROP OBJ_37B03 %%0 ROT 3GETLAM #+ PUT%%EL 3UNROLL TRUE ; * 9691B
          5ROLL DUPUNROT %%+ %%/ SWAP3PICK PULL%%EL %%ABS ROT %%* 4ROLLOVER * 96952
          OBJ_37DA0 4ROLL 5PICK OVER#= UNTIL DROPSWAPDROP SWAP 4UNROLL FALSE ; * 96984

* ROMPTR 0C2 043
* refs (1): 90007
ROMP_0C2_043:
        :: 8GETLAM %%/ 3GETLAM UNCOERCE%% %%* %% 1E-2 %%<= case %%0 * 969B6
          7GETLAM ITE                            * 969FD
          :: 6GETLAM PULL%%EL %%ABS OVER 5GETLAM #1- PULL%%EL SWAP 5GETLAM * 96A07
            3GETLAM #1-+ PULL%%EL SWAP 5GETLAM PULL%%EL ; * 96A39
          :: 5GETLAM PULL%%EL %%ABS OVER 6GETLAM PULL%%EL SWAP 6GETLAM * 96A5C
            3GETLAM #+ PULL%%EL SWAP 6GETLAM #1+ PULL%%EL ; * 96A89
          SWAPDROP SWAP %%ABS ROT %%ABS ROT %%ABS 2DUP OBJ_37DA0 3UNROLL * 96AB1
          :: 3PICK %%0= case2drop SWAPDROP       * 96AE3
            %%MAX 2DUP %%/ 1+(rr) OVER 4PICK %%- 3PICK %%/ 5ROLL 4ROLL %%/ * 96AFC
            DUP %%* ROTDUP %%* OVER %%+ %%SQRT SWAPROT DUP %%+* %%SQRT %%+ * 96B38
            %%/ DUP %%+ ;                        * 96B74
          OVER %%0= case SWAPDROP                * 96B88
          DUPROT %%/ DUP %%* %%1E-14 %%< casedrop %%0 * 96B9C
        ;                                        * 96BC4

* ROMPTR 0C2 044
* refs (1): 90007
ROMP_0C2_044:
        :: 6GETLAM DUP 3GETLAM #+ 4ROLL 3PICK PULL%%EL DUP %%ABS 6PICK %%- * 96BC9
          6ROLL 3PICK %%/ ROT OBJ_37AC2 %%+ %%* SWAP3PICK PULL%%EL ROTSWAP * 96C05
          BEGIN 9GETLAM EVAL 4ROLLSWAP 6PICK 6GETLAM #> ITE * 96C37
          :: 5PICK #1- PUT%%EL ; DROP            * 96C5F
          5PICK PULL%%EL SWAP 5PICK PULL%%EL DUPUNROT 6PICK %%* 4PICK 6PICK * 96C7D
          %%-* 7PICK PUT%%EL ROT 5PICK %%*ROT 4PICK %%+* SWAP 6PICK #1+ * 96CAF
          PULL%%EL DUPUNROT 6PICK %%* 8PICK #1+ PUT%%EL 5UNROLL 3PICK %%* * 96CE6
          BINT9 PICK 5ROLL 5ROLL 8PICK 1GETLAM 11GETLAM EVAL 9GETLAM EVAL * 96D18
          4ROLLSWAP 6PICK PUT%%EL 4PICK PULL%%EL SWAP 6PICK #1+ PULL%%EL * 96D4A
          DUPUNROT 6PICK %%* 4PICK 6PICK %%-* 8PICK #1+ PUT%%EL ROT 5PICK * 96D77
          %%*ROT 4PICK %%+* 6PICK #1+ 5GETLAM #= ITE * 96DAE
          :: DUPUNROT 6PICK PUT%%EL 4UNROLL %%0 ; * 96DD6
          :: SWAP 5PICK #1+ PULL%%EL DUPUNROT 6PICK %%* 7PICK #1+ PUT%%EL * 96DF9
            5UNROLL 3PICK %%* ;                  * 96E30
          8PICK 5ROLL 5ROLL 8PICK 2GETLAM 10GETLAM EVAL 5ROLL #1+ 5UNROLL * 96E44
          4ROLL #1+ 4UNROLL 5PICK 5GETLAM #= UNTIL 5ROLL 2DROP ROT #1- SWAP ; * 96E76

* ROMPTR 0C2 045
* refs (1): 90007
ROMP_0C2_045:
        :: 5GETLAM DUP 3GETLAM #1-+ 4ROLL 3PICK PULL%%EL DUP %%ABS 6PICK %%- * 96EB7
          6ROLL 3PICK %%/ ROT OBJ_37AC2 %%+ %%* SWAP3PICK PULL%%EL ROTSWAP * 96EF3
          BEGIN 9GETLAM EVAL 4ROLLSWAP 6PICK 5GETLAM #< ITE * 96F25
          :: 5PICK #1+ PUT%%EL ; DROP            * 96F4D
          5PICK PULL%%EL SWAP 5PICK PULL%%EL DUPUNROT 6PICK %%* 4PICK 6PICK * 96F6B
          %%-* 7PICK PUT%%EL ROT 5PICK %%*ROT 4PICK %%+* SWAP 6PICK #1- * 96F9D
          PULL%%EL DUPUNROT 6PICK %%* 8PICK #1- PUT%%EL 5UNROLL 3PICK %%* * 96FD4
          8PICK 5ROLL 5ROLL %%CHS 8PICK #1- 2GETLAM 10GETLAM EVAL 9GETLAM * 97006
          EVAL 4ROLLSWAP 6PICK PUT%%EL 4PICK PULL%%EL SWAP 6PICK #1- * 97038
          PULL%%EL DUPUNROT 6PICK %%* 4PICK 6PICK %%-* 8PICK #1- PUT%%EL ROT * 97065
          5PICK %%*ROT 4PICK %%+* 6PICK 6GETLAM #1+ #= ITE * 9709C
          :: DUPUNROT 6PICK PUT%%EL 4UNROLL %%0 ; * 970C9
          :: SWAP 5PICK #1- PULL%%EL DUPUNROT 6PICK %%* 7PICK #1- PUT%%EL * 970EC
            5UNROLL 3PICK %%* ;                  * 97123
          BINT9 PICK 5ROLL 5ROLL %%CHS 8PICK #1- 1GETLAM 11GETLAM EVAL 5ROLL * 97137
          #1- 5UNROLL 4ROLL #1- 4UNROLL 5PICK 6GETLAM #= UNTIL 5ROLL 2DROP * 9716E
          ROT #1+SWAP ;                          * 971A5

* ROMPTR 0C2 046
* refs (1): 90007
ROMP_0C2_046:
        :: %%1 %%1 %%0 6GETLAM DUP 3GETLAM #+ BEGIN 6ROLL OVER PULL%%EL SWAP * 971B4
          4PICK PULL%%EL 8ROLL %%*ROT 9GETLAM EVAL 4ROLL 7ROLL 7PICK 6GETLAM * 971F5
          #> ITE                                 * 97227
          :: 3PICK %%* 6PICK #1- PUT%%EL ; DROP  * 97231
          6PICK #1+ PULL%%EL 4PICK %%* ROT 8ROLL %%*SWAP 9GETLAM EVAL * 97259
          4ROLLSWAP 8PICK PUT%%EL BINT9 PICK 6PICK 6ROLL BINT9 PICK 1GETLAM * 9728B
          11GETLAM EVAL 7PICK 2OVER BINT9 PICK 2GETLAM 10GETLAM EVAL 6UNROLL * 972BD
          5ROLL #1+ 5ROLL #1+ OVER 5GETLAM #= UNTIL #1- ; * 972EF

* ROMPTR 0C2 047
* refs (1): 90007
ROMP_0C2_047:
        :: %%1 %%1 %%0 5GETLAM DUP 3GETLAM #1-+ BEGIN 6ROLL OVER PULL%%EL * 97321
          SWAP 4PICK PULL%%EL 8ROLL %%*ROT 9GETLAM EVAL 4ROLL 7ROLL 7PICK * 9735D
          5GETLAM #< ITE                         * 9738F
          :: 3PICK %%* 6PICK #1+ PUT%%EL ; DROP  * 9739E
          6PICK #1- PULL%%EL 4PICK %%* ROT 8ROLL %%*SWAP 9GETLAM EVAL * 973C6
          4ROLLSWAP 8PICK PUT%%EL 8PICK 6PICK 6ROLL %%CHS BINT9 PICK #1- * 973F8
          2GETLAM 10GETLAM EVAL 8PICK 2OVER %%CHS BINT9 PICK #1- 1GETLAM * 9742A
          11GETLAM EVAL 6UNROLL 5ROLL #1- 5ROLL #1- OVER 6GETLAM #= UNTIL * 9745C
          #1+ ;                                  * 97493

* ROMPTR 0C2 048
* refs (1): 90007
ROMP_0C2_048:
        :: CkATTNQUIT 5PICK case 5DROP           * 9749D
          4PICK %%1 EQUAL 4PICK %%0= ANDcase 5DROP * 974B6
          5ROLL 3UNROLL ZERO_DO DUPUNROT PULL%%EL SWAP3PICK #1+ PULL%%EL * 974D9
          DUPUNROT 6PICK L%* 4PICK 8PICK L%* L%+ 5PICK PUT%%EL SWAP 6PICK * 97501
          L%* ROT 5PICK L%* L%- 3PICK #1+ PUT%%EL SWAP ISTOP@ #+ NextInArray * 97538
          4DROP ;                                * 97574

* ROMPTR 0C2 049
* refs (1): 90007
ROMP_0C2_049:
        :: CkATTNQUIT 5PICK case 5DROP           * 9757E
          4PICK %%1 EQUAL 4PICK %%0= ANDcase 5DROP * 97597
          5ROLL SWAPROT #1- OVER #* #1+SWAP ZERO_DO DUPUNROT PULL%%EL * 975BA
          SWAP3PICK ISTOP@ #+ PULL%%EL DUPUNROT 6PICK L%* 4PICK 8PICK L%* * 975E7
          L%+ 5PICK PUT%%EL SWAP 6PICK L%* ROT 5PICK L%* L%- 3PICK ISTOP@ #+ * 97619
          PUT%%EL SWAP#1+ NextInArray 4DROP ;    * 9765A

* ROMPTR 0C2 04A
* refs (1): 90007
ROMP_0C2_04A:
        :: 3GETLAM #1+_ONE_DO INDEX@ DUPUNROT PULL%%EL DUP %%0>= ITE * 97673
          DROPSWAPDROP                           * 976A0
          :: %%CHS 3PICK PUT%%EL 4PICK case SWAPDROP * 976A5
            4ROLLROT 1GETLAM #* #1+ DUP 1GETLAM #- DO INDEX@ PULL%%EL C%%CHS * 976C8
            INDEX@ PUT%%EL NextInArray 3UNROLL ; * 976FF
          NextInArray 3GETLAM #1= ?SEMI          * 97718
          3GETLAM BEGIN BINT1 ROT BINT1 PULL%%EL SWAP 4PICK #1+ BINT2 DO * 9772C
          INDEX@ PULL%%EL 3PICKOVER %%< ITE DROP * 97763
          :: OBJ_37B03 INDEX@ SWAPROT ;          * 97781
          NextInArray 2OVER #= ITE               * 9779A
          :: 4UNROLL 2DROP ;                     * 977AE
          :: 4PICK PULL%%EL 4PICK PUT%%EL SWAP 4PICK PUT%%EL 5UNROLL 3PICK * 977C2
            ?SKIP OBJ_375A7                      * 977F4
            ROT 5UNROLL 3PICK ?SKIP SWAPCOLUMNS  * 977FE
            DROP SWAP 4UNROLL ;                  * 97817
          #1- DUP#1= UNTIL DROP ;                * 9782B

* ROMPTR 0C2 04B
* refs (1): 90007
ROMP_0C2_04B:
        :: ONEONE ONEONE ONEONE ONEONE RESOROMP ROMPTR 0C2 049 RESOROMP * 97844
          ROMPTR 0C2 048 RESOROMP ROMPTR 0C2 03E BINT1 RESOROMP * 97872
          ROMPTR 0C2 03D RESOROMP ROMPTR 0C2 03C RESOROMP ROMPTR 0C2 008 * 97897
          RESOROMP ROMPTR 0C2 03B BINT17 ROLL BINT18 ROLL BINT18 ' NULLLAM * 978C2
          CACHE 3GETLAM 2GETLAM OVER 1PUTLAM #MIN 3PUTLAM ; * 978F5

* ROMPTR 0C2 04C
* refs (1): 90007
TRACE~1:
        :: sqmat(ar)? %%0 BINT1 ROT #1+_ONE_DO ROTOVER PULLLONGEL 4ROLL L%+ * 9791D
          ROT ISTOP@ #+ NextInArray DROPSWAPDROP ToNorm(nb) ; * 9794F

* ROMPTR 0C2 04D
* refs (1): 90007
COND~1:
        :: sqmat(ar)? OVER OBJ_36912 3UNROLL 3PICK %%0= case SETIVLERR * 97972
          DUP#1= case                            * 9799F
          :: 3DROP %1 ;                          * 979A9
          SWAP ROMPTR 0C2 059 SWAP OBJ_7CD79 ROT OBJ_7CEA5 4ROLL 3UNROLL * 979BD
          ROMPTR 0C2 052 =0?(nb) IT OBJ_5203A    * 979EB
          RESOROMP ROMPTR 0C2 04F RESOROMP ROMPTR 0C2 058 BINT4 BINT1 %%0 * 97A05
          2GETLAM 1GETABND                       * 97A34
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM } BIND * 97A3E
          2GETLAM BINT1 {}N OVER OBJ_37A4F 2GETLAM UNCOERCE%% L%/ MAKEARRY * 97A70
          BINT1 OBJ_7D11B ROTDROP COND~1~3 3PUTLAM 6GETLAM EVAL 2GETLAM * 97A9D
          7GETLAM EVAL 4PUTLAM BEGIN 5GETLAM #1-DUP 5PUTLAM #0= case * 97AC5
          ROMPTR 0C2 04E                         * 97AF2
          DUP OBJ_37A0E OVER OBJ_37A4F 4GETLAM 4ROLL 2GETLAM #1+_ONE_DO * 97AFD
          INDEX@ 3PICK OVER#= ITE 4PICK 5PICK    * 97B25
          SWAP PUT%%EL NextInArray 4UNROLL3DROP BINT1 OBJ_7D11B ROTDROP * 97B43
          COND~1~3 3GETLAM OVER 3PUTLAM %%<= case ROMPTR 0C2 04E * 97B66
          6GETLAM EVAL 2GETLAM 7GETLAM EVAL 4GETLAM 2DUP#= case2drop * 97B8F
          ROMPTR 0C2 04E                         * 97BB7
          OVER 4PUTLAM ROTSWAP PULL%%EL OBJ_37D69 %%>% SWAPROT PULL%%EL * 97BC2
          %%ABS %%>% ROT %= UNTIL                * 97BEA

* ROMPTR 0C2 04E
* refs (1): 90007
ROMP_0C2_04E:
          :: RDROP 2GETLAM #1- UNCOERCE%% OVER OBJ_37A4F OVER L%* 2GETLAM * 97C03
            #1+_ONE_DO ROT 3PICK3PICK L%/ INDEX@ PUT%%EL ROT 1+(rr) ROT * 97C35
            B%NEG NextInArray 2DROP BINT1 OBJ_7D11B ROTROT2DROP COND~1~3 * 97C62
            %% 6.66666666666667E-1 %%* 2GETLAM UNCOERCE%% %%/ 3GETLAM ABND * 97C85
            2DUP %%> ITE DROPSWAPDROP ROTROT2DROP * 97CBD
            %%* %%>% ;                           * 97CD6
        ;                                        * 97CE5

* ROMPTR 0C2 04F
* refs (1): 90007
COND~1~1:
        :: BINT1 %%0 ROT #1+_ONE_DO ROT INDEX@ PULL%%EL %%ABS ROT 2DUP %%> * 97CEA
          ITE                                    * 97D26
          :: DROP ROTDROP INDEX@ SWAP ;          * 97D2B
          :: SWAPDROP ROTSWAP ;                  * 97D49
          NextInArray DROP ;                     * 97D5D

* ROMPTR 0C2 050
* refs (1): 90007
LU~1:
        :: sqmat(ar)? SWAP CKREF OBJ_7CD7E ROT OBJ_7CEA5 2DROP OBJ_7CDE2 DUP * 97D6C
          TOTEMPOB DUP LU~1~1 OVER OBJ_379F0 2SWAP BINT1 2GETLAM #1+_ONE_DO * 97D9E
          2GETLAM #1+_ONE_DO JINDEX@ INDEX@ 2DUP#< ITE * 97DCB
          :: 2DROP ROT 4PICK 3PICK PUTEL 3UNROLL ; * 97DE9
          :: #= ITE 5PICK 4PICK                  * 97E11
            ROTSWAP 3PICK PUTEL SWAP ;           * 97E2A
          #1+ NextInArray LOOP DROP OBJ_37B03 DUP%0CON @idn!(ar) 2GETLAM * 97E43
          ONE_DO INDEX@ 1GETLAM OBJ_36FDB 2DUP#= ?SKIP SWAPROWS * 97E6B
          2DROP NextInArray ABND ;               * 97E8E

* ROMPTR 0C2 051
* refs (1): 90007
MATDET~1:
        :: sqmat(ar)? DUP#1= case                * 97EA2
          :: PULLEL SWAPDROP ;                   * 97EB6
          DUP #2= case MATDET~1~1                * 97ECA
          SWAP ROMPTR 0C2 059 SWAP OBJ_7CD79 ROT OBJ_7CEA5 ABND ROTDROP * 97EDE
          ROMPTR 0C2 052 ToNorm(nb) ;            * 97F0C

* ROMPTR 0C2 052
* refs (1): 90007
ROMP_0C2_052:
        :: OBJ_37898 OBJ_3798C case              * 97F21
          :: SWAP ROMPTR 0C2 05A ;               * 97F35
          C%%>%% DUP %%COSDEG SWAP %%SINDEG UNROTOVER %%*UNROT %%* RESOROMP * 97F4F
          ROMPTR 0C2 05A ROT 4PICK 3PICK EVAL 4UNROLL ROTSWAP EVAL %%>C%% ; * 97F7C

* ROMPTR 0C2 053
* refs (1): 90007
ROMP_0C2_053:
        :: OBJ_36AD3 SWAP OBJ_36B14 ROMPTR 0C2 054 ; * 97FB4

* ROMPTR 0C2 054
* refs (1): 90007
ROMP_0C2_054:
        :: SWAP ROMPTR 0C2 059 SWAP OBJ_7CD79 5ROLL OBJ_7CEA5 4ROLL 3UNROLL * 97FD8
          ROMPTR 0C2 052 =0?(nb) IT OBJ_5203A    * 9800B
          SWAP OBJ_7CD7E ROTSWAP 4ROLL OBJ_7D0CB ABND OBJ_7CDE2 ; * 98025

* ROMPTR 0C2 055
* refs (1): 90007
MATINV~1:
        :: sqmat(ar)? SWAP CKREF ROMPTR 0C2 056 ; * 9804D

* ROMPTR 0C2 056
* refs (1): 90007
ROMP_0C2_056:
        :: ROMPTR 0C2 059 SWAP OBJ_7CD7E 4ROLL OBJ_7CEA5 5ROLL 3UNROLL * 98071
          ROMPTR 0C2 052 =0?(nb) IT OBJ_5203A    * 9809F
          ROMPTR 0C2 057 ABND OBJ_7CDE2 ;        * 980B9

* ROMPTR 0C2 057
* refs (1): 90007
ROMP_0C2_057:
        :: ONESWAP 2GETLAM #1+_ONE_DO INDEX@ 1GETLAM TRUE OBJ_7D3CB 3PICK * 980D3
          BINT1 4ROLL INDEX@ #1+_ONE_DO JINDEX@ INDEX@#- DUP#0= ITE * 98100
          :: DROPDUP OBJ_37A4F ;                 * 98128
          :: 2OVER ROT OBJ_7C855 B%NEG ;         * 9813C
          5PICK L%/ 4PICK PUT%%EL ROT#1+ ROT 2GETLAM OBJ_36FB0 ROT * 9815A
          NextInArray 4UNROLL3DROP 2GETLAM ROT#+SWAP LOOP SWAPDROP 2GETLAM * 98187
          DUP#1= caseDROP DUP#1-                 * 981AA
          #* SWAP 2GETLAM ONE_DO OVERDUP ROT 2GETLAM INDEX@#- #1+_ONE_DO * 981B9
          OVER 4PICK 2GETLAM #+ INDEX@ #1- OBJ_7C855 SWAP 4PICK PULL%%EL ROT * 981E6
          L%+ B%NEG 4PICK PUT%%EL 2GETLAM 4ROLLOVER #- 4ROLLROT #-#1- ROT * 9821D
          NextInArray ROTROT2DROP SWAP 2GETLAM #-#1- SWAP LOOP SWAPDROP * 9824F
          ONESWAP 2GETLAM ONE_DO INDEX@ 3PICKOVER #+ 3UNROLL ZERO_DO OVER * 98277
          2GETLAM 5PICK OVER #+SWAP JINDEX@ #- OBJ_7C855 SWAP 4PICK PULL%%EL * 982A4
          ROT L%+ 4PICK PUT%%EL ROT#1+UNROT NextInArray SWAPDROP 2GETLAM * 982D6
          3PICKOVER #+ 3UNROLL #1+ INDEX@ #1+ DO 3PICK3PICK 2GETLAM INDEX@ * 982FE
          #1-- OBJ_7C855 4PICK PUT%%EL SWAP 2GETLAM OBJ_36FB0 SWAP * 98330
          ROT#1+UNROT NextInArray SWAPDROP LOOP SWAPDROP 2GETLAM BEGIN #1- * 98358
          DUP#0<> WHILE                          * 98380
          :: 1GETLAM OBJ_36FDB 2DUP#= ?SKIP OBJ_375A7 * 9838A
            DROP CkATTNQUIT ;                    * 983A8
          REPEAT DROP ;                          * 983B7

* ROMPTR 0C2 058
* refs (1): 90007
COND~1~2:
        :: 2GETLAM #1+_ONE_DO INDEX@ PULL%%EL COND~1~2~1 INDEX@ PUT%%EL * 983C6
          NextInArray                            * 983EE
          :: 2GETLAM DUP #1= caseDROP #1+        * 983F3
            BINT2 DO INDEX@ BINT1 INDEX@ #1- OBJ_7CAA4 SWAP INDEX@ PULL%%EL * 98411
            ROT L%- INDEX@ PUT%%EL LOOP ;        * 98443
          2GETLAM DUP#1+ #* 2GETLAM 2SWAP 2GETLAM ZERO_DO SWAP 2GETLAM * 98461
          INDEX@#- 1GETLAM TRUE OBJ_7D3CB L%CONJ SWAPROT 5PICK 5PICK #1+ * 9848E
          INDEX@ OBJ_7CAA4 SWAP 5PICK PULL%%EL ROT L%- 4ROLL L%/ 4PICK * 984BB
          PUT%%EL 4ROLL 2GETLAM #-#1- 4ROLL #1- 2SWAP LOOP OBJ_37B03 ; * 984ED

* ROMPTR 0C2 059
* refs (1): 90007
ROMP_0C2_059:
        :: BINT54 TestSysFlag case %%0           * 9851F
          CODE                                   * 98538  220 nibbles
            GOSBVL  SAVPTR                       * 98542
            C=DAT1  A                            * 98549
            D1=C                                 * 9854C
            D1=D1+  10                           * 9854F
            C=DAT1  A                            * 98552
            D=C     A                            * 98555
            D1=D1+  10                           * 98557
            A=DAT1  A                            * 9855A
            R0=A                                 * 9855D
            LC(5)   DOREAL                       * 98560
            ?D=C    A                            * 98567
            GOYES   L_9856E                      * 9856A
            A=A+A   A                            * 9856C
L_9856E:
            C=R0                                 * 9856E
            D=C     A                            * 98571
            LC(5)   #0004F                       * 98573
            ?D<C    A                            * 9857A
            GOYES   L_98589                      * 9857D
            A=0     W                            * 9857F
            B=0     W                            * 98582
            GOTO    L_98617                      * 98585
L_98589:
            C=A     A                            * 98589
            GOSBVL  L_35790                      * 9858B
            C=B     A                            * 98592
            D1=D1+  10                           * 98594
            C=C-1   A                            * 98597
            RSTK=C                               * 98599
            LC(5)   #99999                       * 9859B
            D=C     A                            * 985A2
L_985A4:
            A=DAT1  W                            * 985A4
            ?A=0    M                            * 985A8
            GOYES   L_985D4                      * 985AB
            GOSBVL  SPLITA                       * 985AD
            P=      0                            * 985B4
            LC(5)   #50000                       * 985B6
            C=C+A   A                            * 985BD
            P=      13                           * 985BF
L_985C1:
            ?B=0    WP                           * 985C1
            GOYES   L_985CD                      * 985C4
            P=P-1                                * 985C6
            C=C-1   A                            * 985C8
            GONC    L_985C1                      * 985CA
L_985CD:
            ?D<=C   A                            * 985CD
            GOYES   L_985D4                      * 985D0
            D=C     A                            * 985D2
L_985D4:
            SETHEX                               * 985D4
            D1=D1+  16                           * 985D6
            C=RSTK                               * 985D9
            C=C-1   A                            * 985DB
            RSTK=C                               * 985DD
            GONC    L_985A4                      * 985DF
            SETDEC                               * 985E2
            P=      0                            * 985E4
            C=D     A                            * 985E6
            C=C+1   A                            * 985E8
            GOC     L_9860A                      * 985EA
            LC(5)   #50000                       * 985ED
            D=D-C   A                            * 985F4
            A=R0                                 * 985F6
            SETHEX                               * 985F9
            A=A-1   A                            * 985FB
            C=0     A                            * 985FD
L_985FF:
            SETDEC                               * 985FF
            C=C+D   A                            * 98601
            SETHEX                               * 98603
            A=A-1   A                            * 98605
            GONC    L_985FF                      * 98607
L_9860A:
            A=0     W                            * 9860A
            B=0     W                            * 9860D
            P=      14                           * 98610
            B=B+1   P                            * 98612
            A=C     A                            * 98615
L_98617:
            GOVLNG  L_37915                      * 98617
          ENDCODE                                * 9861E
        ;                                        * 9861E

* ROMPTR 0C2 05A
* refs (1): 90007
ROMP_0C2_05A:
        CODE                                     * 98623  127 nibbles
          HST=0   3                              * 9862D
          GOSBVL  SUB_2A0B1                      * 98630
          ?D#0    M                              * 98637
          GOYES   L_98654                        * 9863A
L_9863C:
          SETHEX                                 * 9863C
          GOSBVL  GETPTR                         * 9863E
          D1=D1-  5                              * 98645
          D=D-1   A                              * 98648
          A=DAT0  A                              * 9864A
          D0=D0+  5                              * 9864D
          PC=(A)                                 * 98650
L_98654:
          R0=C                                   * 98654
          P=      0                              * 98657
          LC(5)   #50000                         * 98659
          A=A+C   A                              * 98660
          R1=A                                   * 98662
          A=R0                                   * 98665
          A=A+C   A                              * 98668
          C=A     W                              * 9866A
          A=R1                                   * 9866D
          A=A-C   A                              * 98670
          GOC     L_98684                        * 98672
          LC(5)   #40000                         * 98675
          ?C<=A   A                              * 9867C
          GOYES   L_9863C                        * 9867F
          GONC    L_98690                        * 98681
L_98684:
          LC(5)   #60000                         * 98684
          ?C>=A   A                              * 9868B
          GOYES   L_9863C                        * 9868E
L_98690:
          ST=0    1                              * 98690
          ST=1    2                              * 98693
          C=0     S                              * 98696
          GOSBVL  SUB_2BF26                      * 98699
          C=R0                                   * 986A0
          A=A+C   A                              * 986A3
          GOVLNG  L_37915                        * 986A5
        ENDCODE                                  * 986AC

* ROMPTR 0C2 05B
* refs (1): 90007
RREF~1:
        :: BINT1 OVER MDIMS NOTcase doerr501     * 986AC
          RESOROMP ROMPTR 0C2 05C RESOROMP ROMPTR 0C2 05E 2NULLLAM{} BIND * 986CA
          DUP #8* !MAKEHXS 4NULLLAM{} BIND CKREF OBJ_7CD7E 1GETLAM OBJ_7D28D * 986F4
          ONESWAP 2GETLAM #1+_ONE_DO BINT54 TestSysFlag ITE %%0 * 98721
          :: 1GETLAM 2GETLAM INDEX@ 6GETLAM EVAL ; * 98744
          4GETLAM #1- OBJ_6819D 5PICK TYPERARRY? ?SKIP #2* * 98767
          UNCOERCE%% %%* SWAP 4GETLAM 3GETLAM #> ITE %%0 * 9878A
          :: 4GETLAM INDEX@ OBJ_376C1 2DUP#= ?SKIP SWAPCOLUMNS * 987B2
            2DROP 3PICK PULL%%EL ;               * 987D5
          DUP B%ABS ROT 4GETLAM #1=?SKIP         * 987E9
          :: INDEX@ SWAP 4GETLAM ONE_DO 7GETLAM EVAL 2GETLAM ROT#+SWAP * 98802
            NextInArray SWAPDROP ;               * 9882F
          4GETLAM 3GETLAM #< IT                  * 9883E
          :: 5PICK SWAP 3GETLAM 4GETLAM DO 2GETLAM ROT#+SWAP 7GETLAM EVAL * 98852
            NextInArray SWAPDROP ;               * 98884
          ROTDROP OVER 4ROLL %%> ITE             * 98893
          :: SWAPDROP 4GETLAM #1+ 4PUTLAM 2GETLAM ROT#+SWAP ; * 988AC
          :: SWAP =0?(nb) ?SEMI                  * 988D4
            %%0 3PICK PUT%%EL ;                  * 988E8
          SWAP#1+SWAP NextInArray RESOROMP ROMPTR 0C2 05D 6PUTLAM SWAPDROP * 988FC
          BINT1 DUPUNROT 4PUTLAM 2GETLAM #1+_ONE_DO 6GETLAM EVAL SWAP#1+SWAP * 98920
          NextInArray SWAPDROP ABND ABND OBJ_7CDE2 ; * 98948

* ROMPTR 0C2 05C
* refs (1): 90007
RREF~1~1:
        :: OVER PULL%%EL DUPUNROT B%ABS 7PICK %%> 5PICK 8PICK %%<= AND ?SKIP * 98966
          :: %%0 4PICK PUT%%EL ;                 * 989A2
          4PICK 7PICK %%<= 2GETLAM JINDEX@ #= OR case SWAPDROP * 989BB
          SWAP 5PICK L%/ SWAP 7PICK 4PICK ROT 2GETLAM JINDEX@ DO ROT#1+ * 989E8
          ROT#1+ ROT 3PICK PULL%%EL 5PICK L%* SWAP3PICK PULL%%EL ROT L%- * 98A1F
          3PICK PUT%%EL NextInArray 4UNROLL3DROP ; * 98A51

* ROMPTR 0C2 05D
* refs (1): 90007
RREF~1~2:
        :: 4GETLAM 3GETLAM #> ?SEMI              * 98A6A
          OVER PULL%%EL SWAP OVER =0?(nb) case SWAPDROP * 98A83
          %%1 4PICK PUT%%EL 2GETLAM INDEX@ #=case SWAPDROP * 98AA6
          3PICKSWAP 2GETLAM INDEX@ DO SWAP#1+SWAP OVER PULL%%EL 4PICK L%/ * 98AC9
          3PICK PUT%%EL NextInArray ROTROT2DROP 2GETLAM ROT#+SWAP 4GETLAM * 98AF6
          #1+ 4PUTLAM ;                          * 98B19

* ROMPTR 0C2 05E
* refs (1): 90007
RREF~1~3:
        CODE                                     * 98B28  98 nibbles
          GOSBVL  POP2#                          * 98B32
          R1=C                                   * 98B39
          R2=A                                   * 98B3C
          A=DAT1  A                              * 98B3F
          D1=D1+  5                              * 98B42
          D=D+1   A                              * 98B45
          GOSBVL  SAVPTR                         * 98B47
          R0=A                                   * 98B4E
          A=R2                                   * 98B51
          B=A     A                              * 98B54
          A=A+A   A                              * 98B56
          A=A+B   A                              * 98B58
          C=R1                                   * 98B5A
          C=C-1   A                              * 98B5D
          D=C     A                              * 98B5F
          C=C+C   A                              * 98B61
          C=C+C   A                              * 98B63
          C=C+D   A                              * 98B65
          C=C+A   A                              * 98B67
          A=R0                                   * 98B69
          C=C+A   A                              * 98B6C
          D0=C                                   * 98B6E
          D0=D0+  10                             * 98B71
          A=DAT0  A                              * 98B74
          LC(5)   #49987                         * 98B77
          SETDEC                                 * 98B7E
          A=A+C   A                              * 98B80
          A=0     S                              * 98B82
          B=0     W                              * 98B85
          P=      14                             * 98B88
          B=B+1   P                              * 98B8A
          GOVLNG  L_37915                        * 98B8D
        ENDCODE                                  * 98B94

LIB0C2.hash:
        CON(5)  DOHSTR                           * 98B94  hash table of library 0C2
        LENGTH                                   * 98B99  length, to #98BF8
        CON(5)  0                                * 98B9E  names of length 1
        CON(5)  0                                * 98BA3  names of length 2
        CON(5)  0                                * 98BA8  names of length 3
        CON(5)  0                                * 98BAD  names of length 4
        CON(5)  0                                * 98BB2  names of length 5
        CON(5)  0                                * 98BB7  names of length 6
        CON(5)  0                                * 98BBC  names of length 7
        CON(5)  0                                * 98BC1  names of length 8
        CON(5)  0                                * 98BC6  names of length 9
        CON(5)  0                                * 98BCB  names of length 10
        CON(5)  0                                * 98BD0  names of length 11
        CON(5)  0                                * 98BD5  names of length 12
        CON(5)  0                                * 98BDA  names of length 13
        CON(5)  0                                * 98BDF  names of length 14
        CON(5)  0                                * 98BE4  names of length 15
        CON(5)  0                                * 98BE9  names of length 16
        REL(5)  L_98BF3                          * 98BEE  end of the names
L_98BF3:
        CON(5)  0                                * 98BF3  command 000 has no name
        ENDLENGTH                                * 98BF8

LIB0C2.link:
        CON(5)  DOHSTR                           * 98BF8  link table of library 0C2
        LENGTH                                   * 98BFD  length, to #98DDD
        REL(5)  SRAD~1                           * 98C02  000 
        REL(5)  ROMP_0C2_001                     * 98C07  001 
        REL(5)  EGVL~1                           * 98C0C  002 
        REL(5)  ROMP_0C2_003                     * 98C11  003 
        REL(5)  EGV~1                            * 98C16  004 
        REL(5)  SCHUR~1                          * 98C1B  005 
        REL(5)  ROMP_0C2_006                     * 98C20  006 
        REL(5)  ROMP_0C2_007                     * 98C25  007 
        REL(5)  ROMP_0C2_008                     * 98C2A  008 
        REL(5)  ROMP_0C2_009                     * 98C2F  009 
        REL(5)  ROMP_0C2_00A                     * 98C34  00A 
        REL(5)  ROMP_0C2_00B                     * 98C39  00B 
        REL(5)  ROMP_0C2_00C                     * 98C3E  00C 
        REL(5)  ROMP_0C2_00D                     * 98C43  00D 
        REL(5)  ROMP_0C2_00E                     * 98C48  00E 
        REL(5)  ROMP_0C2_00F                     * 98C4D  00F 
        REL(5)  ROMP_0C2_010                     * 98C52  010 
        REL(5)  ROMP_0C2_011                     * 98C57  011 
        REL(5)  ROMP_0C2_012                     * 98C5C  012 
        REL(5)  ROMP_0C2_013                     * 98C61  013 
        REL(5)  ROMP_0C2_014                     * 98C66  014 
        REL(5)  EGV~1~1                          * 98C6B  015 
        REL(5)  ROMP_0C2_016                     * 98C70  016 
        REL(5)  ROMP_0C2_017                     * 98C75  017 
        REL(5)  EGV~1~1~1                        * 98C7A  018 
        REL(5)  EGV~1~2                          * 98C7F  019 
        REL(5)  ROMP_0C2_01A                     * 98C84  01A 
        REL(5)  ROMP_0C2_01B                     * 98C89  01B 
        REL(5)  ROMP_0C2_01C                     * 98C8E  01C 
        REL(5)  EGV~1~3                          * 98C93  01D 
        REL(5)  ROMP_0C2_01E                     * 98C98  01E 
        REL(5)  ROMP_0C2_01F                     * 98C9D  01F 
        REL(5)  ROMP_0C2_020                     * 98CA2  020 
        REL(5)  ROMP_0C2_021                     * 98CA7  021 
        REL(5)  ROMP_0C2_022                     * 98CAC  022 
        REL(5)  QR~1                             * 98CB1  023 
        REL(5)  LQ~1                             * 98CB6  024 
        REL(5)  ROMP_0C2_025                     * 98CBB  025 
        REL(5)  ROMP_0C2_026                     * 98CC0  026 
        REL(5)  ROMP_0C2_027                     * 98CC5  027 
        REL(5)  ROMP_0C2_028                     * 98CCA  028 
        REL(5)  ROMP_0C2_029                     * 98CCF  029 
        REL(5)  ROMP_0C2_02A                     * 98CD4  02A 
        REL(5)  ROMP_0C2_02B                     * 98CD9  02B 
        REL(5)  ROMP_0C2_02C                     * 98CDE  02C 
        REL(5)  ROMP_0C2_02D                     * 98CE3  02D 
        REL(5)  ROMP_0C2_02E                     * 98CE8  02E 
        REL(5)  ROMP_0C2_02F                     * 98CED  02F 
        REL(5)  ROMP_0C2_030                     * 98CF2  030 
        REL(5)  ROMP_0C2_031                     * 98CF7  031 
        REL(5)  ROMP_0C2_032                     * 98CFC  032 
        REL(5)  ROMP_0C2_033                     * 98D01  033 
        REL(5)  SNRM~1                           * 98D06  034 
        REL(5)  ROMP_0C2_035                     * 98D0B  035 
        REL(5)  RANK~1                           * 98D10  036 
        REL(5)  SVL~1                            * 98D15  037 
        REL(5)  SVD~1                            * 98D1A  038 
        REL(5)  ROMP_0C2_039                     * 98D1F  039 
        REL(5)  ROMP_0C2_03A                     * 98D24  03A 
        REL(5)  ROMP_0C2_03B                     * 98D29  03B 
        REL(5)  ROMP_0C2_03C                     * 98D2E  03C 
        REL(5)  ROMP_0C2_03D                     * 98D33  03D 
        REL(5)  ROMP_0C2_03E                     * 98D38  03E 
        REL(5)  ROMP_0C2_03F                     * 98D3D  03F 
        REL(5)  ROMP_0C2_040                     * 98D42  040 
        REL(5)  ROMP_0C2_041                     * 98D47  041 
        REL(5)  ROMP_0C2_042                     * 98D4C  042 
        REL(5)  ROMP_0C2_043                     * 98D51  043 
        REL(5)  ROMP_0C2_044                     * 98D56  044 
        REL(5)  ROMP_0C2_045                     * 98D5B  045 
        REL(5)  ROMP_0C2_046                     * 98D60  046 
        REL(5)  ROMP_0C2_047                     * 98D65  047 
        REL(5)  ROMP_0C2_048                     * 98D6A  048 
        REL(5)  ROMP_0C2_049                     * 98D6F  049 
        REL(5)  ROMP_0C2_04A                     * 98D74  04A 
        REL(5)  ROMP_0C2_04B                     * 98D79  04B 
        REL(5)  TRACE~1                          * 98D7E  04C 
        REL(5)  COND~1                           * 98D83  04D 
        REL(5)  ROMP_0C2_04E                     * 98D88  04E 
        REL(5)  COND~1~1                         * 98D8D  04F 
        REL(5)  LU~1                             * 98D92  050 
        REL(5)  MATDET~1                         * 98D97  051 
        REL(5)  ROMP_0C2_052                     * 98D9C  052 
        REL(5)  ROMP_0C2_053                     * 98DA1  053 
        REL(5)  ROMP_0C2_054                     * 98DA6  054 
        REL(5)  MATINV~1                         * 98DAB  055 
        REL(5)  ROMP_0C2_056                     * 98DB0  056 
        REL(5)  ROMP_0C2_057                     * 98DB5  057 
        REL(5)  COND~1~2                         * 98DBA  058 
        REL(5)  ROMP_0C2_059                     * 98DBF  059 
        REL(5)  ROMP_0C2_05A                     * 98DC4  05A 
        REL(5)  RREF~1                           * 98DC9  05B 
        REL(5)  RREF~1~1                         * 98DCE  05C 
        REL(5)  RREF~1~2                         * 98DD3  05D 
        REL(5)  RREF~1~3                         * 98DD8  05E 
        ENDLENGTH                                * 98DDD
        NIBHEX  C0210E06494E4020202A36496E616E63 * 98DDD  ..à`ηä...¢cηæ.æ6
        NIBHEX  656E0                            * 98DFD  Væ
