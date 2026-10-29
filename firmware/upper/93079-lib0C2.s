* HP 48GX ROM revision R, #93079-#96267: Library part 0C2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #93079 in the original ROM).
        RPL

* ROMPTR 0C2 01D
* refs (1): 90007
EGV~1~3:
        :: 1GETLAM #1= ?SEMI                     * 93079
          1GETLAM BINT1 {}N ((0,0)) MAKEARRY 4PUTLAM RESOROMP ROMPTR 0C2 016 * 9308D
          10PUTLAM RESOROMP ROMPTR 0C2 017 12PUTLAM 1GETLAM DUPDUP #* BEGIN * 930BB
          CkATTNQUIT 10GETLAM EVAL OVER BINT2 #< UNTIL 2DROP ; * 930E9

* ROMPTR 0C2 01E
* refs (1): 90007
ROMP_0C2_01E:
        :: sqmat(ar)? ONEONE ONEONE ONEONE ONEONE ONEONE ONEONE ONEONE * 93116
          BINT15 ROLL OVER BINT16 ' NULLLAM CACHE 3GETLAM 1PUTLAM ; * 93143

* ROMPTR 0C2 01F
* refs (1): 90007
ROMP_0C2_01F:
        :: 1GETLAM BINT3 #* !MAKEHXS SWAP 3GETLAM DUP BEGIN TRUE OBJ_6DCE7 * 93175
          1GETLAM #* #1+ 5PICK 5PICK #1+_ONE_DO 4PICK INDEX@ #= ?SKIP * 931AC
          :: OVER PULL%%EL =0?(nb) ?SEMI         * 931DE
            ROTDROP FALSE 3UNROLL INDEX@ ISTOPSTO ; * 931F7
          SWAP#1+SWAP NextInArray 2DROP IT       * 93215
          :: 4PICK OBJ_37013 2DUP#= ?SKIP        * 93229
            :: SWAPCOLUMNS OBJ_375A7 DROPDUP ;   * 93242
            OVER #1= ?SEMI                       * 9325B
            SWAP#1-SWAP ;                        * 9326A
          #1- DUP#0= UNTIL DROPDUP 3PUTLAM #1=case SWAP * 93274
          2GETLAM DUP BEGIN TRUE 3PICK #1- 1GETLAM #* 3PICK#+ 5PICK 3GETLAM * 93297
          #1+ 6PICK DO 4PICK INDEX@ #= ?SKIP     * 932CE
          :: OVER PULL%%EL =0?(nb) ?SEMI         * 932F1
            ROTDROP FALSE 3UNROLL INDEX@ ISTOPSTO ; * 9330A
          1GETLAM ROT#+SWAP NextInArray 2DROP IT * 93328
          :: 4PICK OBJ_37013 2DUP#= ?SKIP        * 93341
            :: SWAPCOLUMNS OBJ_375A7 DROPDUP ;   * 9335A
            OVER 3GETLAM #= ?SEMI                * 93373
            SWAP#1+SWAP ;                        * 93387
          #1+ DUP 3GETLAM #> UNTIL DROP 2PUTLAM SWAP ; * 93391

* ROMPTR 0C2 020
* refs (1): 90007
ROMP_0C2_020:
        :: 2GETLAM BEGIN #1- DUP#0<> WHILE       * 933BE
          :: 3PICK OBJ_36FDB 2DUP#= ?SKIP SWAPCOLUMNS * 933DC
            DROP CkATTNQUIT ;                    * 933FA
          REPEAT DROP 3GETLAM BEGIN #1+ DUP 1GETLAM #> NOT WHILE * 93409
          :: 3PICK OBJ_36FDB 2DUP#= ?SKIP SWAPCOLUMNS * 9343B
            DROP CkATTNQUIT ;                    * 93459
          REPEAT DROPSWAPDROP ;                  * 93468

* ROMPTR 0C2 021
* refs (1): 90007
ROMP_0C2_021:
        :: 3GETLAM 2GETLAM #= ?SEMI              * 93477
          3GETLAM #1+ 2GETLAM DO INDEX@ OBJ_0F656 3PICK OBJ_37013 2DROP * 93490
          NextInArray SWAP BEGIN TRUE 2GETLAM #1- 1GETLAM #1+ #* #1+ DUP * 934BD
          3GETLAM #1+ 2GETLAM DO %%0 %%0 2OVER ISTOP@ 2GETLAM DO INDEX@ * 934F4
          JINDEX@ #= ?SKIP                       * 9352B
          :: 8PICK 3PICK PULL%%EL OBJ_37C98 6ROLL %%+ SWAP 3PICK PULL%%EL * 9353A
            OBJ_37C98 6ROLL %%+ SWAPDROP 2SWAP ; * 9356C
          1GETLAM ROT#+SWAP #1+ NextInArray 2DROP 2DUP %%+ * 9358A
          :: 3PICK 3PICK OBJ_37DA0 %%0= case 3DROP * 935AD
            OVER 4PICK                           * 935D0
            CODE                                 * 935DA  74 nibbles
              GOSBVL  SUB_2A0B1                  * 935E4
              HST=0   3                          * 935EB
              GOSBVL  DIVF                       * 935EE
              GOSBVL  SUB_2B6A1                  * 935F5
              GOSBVL  RADD1                      * 935FC
              GOSBVL  DIV2                       * 93603
              GOSBVL  STAB0                      * 9360A
              GOSBVL  SUB_2B767                  * 93611
              C=R1                               * 93618
              ?B#C    M                          * 9361B
              GOYES   L_93627                    * 9361E
              GOSBVL  RSUB1                      * 93620
L_93627:
              GOVLNG  L_2A235                    * 93627
            ENDCODE                              * 9362E
            4dropn;IU! case 4DROP                * 9362E
            %%10 OVER %%^ 5ROLL OVER %%* 5ROLL 3PICK %%/ %%+ 4ROLL %% 9.5E-1 * 9363D
            %%* %%>= case2DROP INDEX@            * 9368E
            8PICK OBJ_36FDB UNCOERCE 4ROLL %%>% %+ COERCE 8PICK OBJ_37013 * 936A2
            2DROP OVER 6PICK 1GETLAM #1+ 2GETLAM DO OVER PULL%%EL 4PICK L%/ * 936CF
            3PICK PUT%%EL SWAP#1+SWAP NextInArray INDEX@ ROTDROPSWAP 3GETLAM * 93706
            #1+_ONE_DO OVER PULL%%EL 4PICK L%* 3PICK PUT%%EL 1GETLAM * 93729
            ROT#+SWAP NextInArray 3DROP ROTDROP FALSE 3UNROLL ; * 93751
          SWAP#1+SWAP 1GETLAM #+ LOOP 2DROP UNTIL SWAP ; * 93774

* ROMPTR 0C2 022
* refs (1): 90007
ROMP_0C2_022:
        :: DUP MDIMS NcaseDIMERR 4PICK           * 9379C
          MDIMS ?SKIP BINT1                      * 937B5
          SWAP 4PICK #= NcaseDIMERR 4ROLL        * 937C4
          5ROLL OBJ_36B14 5UNROLL 4UNROLL 3UNROLL ROMPTR 0C2 026 SWAP * 937DD
          OBJ_7CD7E ROTSWAP ROMPTR 0C2 028 SWAP ROMPTR 0C2 029 * 93806
          ROMPTR 0C2 02D 2GETLAM 4GETLAM #> IT ROMPTR 0C2 02A * 9382B
          SWAP 5GETLAM ROMPTR 0C2 02C DROP 3GETLAM 2GETLAM #= 4GETLAM * 93855
          2GETLAM #= AND ?SKIP                   * 93883
          :: 2GETLAM 4PICK MDIMS ITE             * 93897
            :: SWAPDROP BINT2 ; DROPONE          * 938B0
            {}N 3GETLAM 2GETLAM #=?SKIP          * 938C9
            :: 4ROLLOVER MATREDIM 4UNROLL ; OVER OBJ_37A0E MAKEARRY 4GETLAM * 938DD
            5GETLAM #* OBJ_7D4C5 SWAPDROP ;      * 9390A
          2GETLAM 4GETLAM #> IT ROMPTR 0C2 02B   * 93923
          SWAPDROP OBJ_7CDE2 2GETLAM DUP ZERO_DO 1GETLAM OBJ_36FDB 2DUP#= * 93942
          ?SKIP SWAPROWS                         * 9396A
          DROP#1- NextInArray DROP ABND ;        * 93974

* ROMPTR 0C2 023
* refs (1): 90007
QR~1:
        :: DUPDUP MDIMS NcaseDIMERR OVERSWAP     * 9398D
          ROMPTR 0C2 025 ROT OBJ_38185 3UNROLL ; * 939A6

* ROMPTR 0C2 024
* refs (1): 90007
LQ~1:
        :: DUP MDIMS NcaseDIMERR ROT             * 939C5
          CKREF OBJ_38185 DUP ROTDUP 5ROLL ROMPTR 0C2 025 OBJ_38185 SWAP * 939DE
          OBJ_38185 3UNROLL ;                    * 93A0C

* ROMPTR 0C2 025
* refs (1): 90007
ROMP_0C2_025:
        :: ROMPTR 0C2 026 3GETLAM DUP TWO{}N 3PICK OBJ_379F0 MAKEARRY * 93A1B
          SWAPDUP OBJ_37A0E 3GETLAM ROMPTR 0C2 033 ROMPTR 0C2 028 ROTSWAP * 93A49
          OBJ_7CDE2 ROT CKREF ROT ROMPTR 0C2 029 OBJ_7CDE2 DUP OBJ_379F0 * 93A73
          SWAPONE 3GETLAM ZERO_DO 2GETLAM ZERO_DO JINDEX@ INDEX@ #> IT * 93AA1
          :: SWAP3PICK 3PICK PUTEL SWAP ;        * 93ACE
          #1+ NextInArray LOOP DROPSWAPDROP 2GETLAM DUP TWO{}N %0_2A2B4 * 93AEC
          MAKEARRY @idn!(ar) 2GETLAM #1+_ONE_DO INDEX@ 1GETLAM OBJ_36FDB * 93B14
          2DUP#= ?SKIP                           * 93B37
          CODE                                   * 93B41  110 nibbles
            GOSBVL  SAVPTR                       * 93B4B
            GOSBVL  POP2#                        * 93B52
            B=C     A                            * 93B59
            C=DAT1  A                            * 93B5B
            D1=C                                 * 93B5E
            D1=D1+  10                           * 93B61
            D1=D1+  15                           * 93B64
            C=DAT1  A                            * 93B67
            D=C     A                            * 93B6A
            D1=D1+  5                            * 93B6C
            B=B-1   A                            * 93B6F
            BSL     A                            * 93B71
            A=A-1   A                            * 93B73
            ASL     A                            * 93B75
            DSL     A                            * 93B77
            BCEX    A                            * 93B79
            AD1EX                                * 93B7B
            C=C+A   A                            * 93B7E
            D0=C                                 * 93B80
            CD1EX                                * 93B83
            C=C+A   A                            * 93B86
            D1=C                                 * 93B88
            B=B-1   A                            * 93B8B
L_93B8D:
            A=DAT0  W                            * 93B8D
            C=DAT1  W                            * 93B91
            DAT0=C  W                            * 93B95
            DAT1=A  W                            * 93B99
            CD1EX                                * 93B9D
            C=C+D   A                            * 93BA0
            D1=C                                 * 93BA2
            CD0EX                                * 93BA5
            C=C+D   A                            * 93BA8
            D0=C                                 * 93BAA
            B=B-1   A                            * 93BAD
            GONC    L_93B8D                      * 93BAF
            GOVLNG  GETPTRLOOP                   * 93BB2
          ENDCODE                                * 93BB9
          2DROP                                  * 93BB9
          NextInArray ABND ;                     * 93BBE

* ROMPTR 0C2 026
* refs (1): 90007
ROMP_0C2_026:
        :: # FFF OVER#< case doerr501            * 93BCD
          ONEONE RESOROMP ROMPTR 0C2 027 6ROLL 6ROLL 6ROLL 2DUP #MIN 3UNROLL * 93BEB
          DUP BINT3 #* !MAKEHXS 8NULLLAM{} BIND 3GETLAM #2+ 2GETLAM TWO{}N * 93C1E
          OVER TYPERARRY? ITE %%0 ((0,0))        * 93C50
          MAKEARRY OBJ_7CDBF SWAP ARSIZE SWAP 2GETLAM #1+_ONE_DO INDEX@ DUP * 93C69
          1GETLAM OBJ_37013 3GETLAM OBJ_7CA98 DUPUNROT 4PICK INDEX@ #+ * 93C96
          PUT%%EL SWAP3PICK 2GETLAM #+ INDEX@ #+ PUT%%EL NextInArray BINT1 * 93CBE
          3GETLAM ROT BINT1 BEGIN CkATTNQUIT     * 93CEB
          CODE                                   * 93D04  214 nibbles
            GOSBVL  SAVPTR                       * 93D0E
            C=DAT1  A                            * 93D15
            D0=C                                 * 93D18
            D0=D0+  5                            * 93D1B
            C=DAT0  A                            * 93D1E
            R0=C                                 * 93D21
            RSTK=C                               * 93D24
            D1=D1+  5                            * 93D26
            C=DAT1  A                            * 93D29
            D1=C                                 * 93D2C
            D1=D1+  10                           * 93D2F
            A=DAT1  A                            * 93D32
            ST=0    0                            * 93D35
            LC(5)   DOEREL                       * 93D38
            ?C=A    A                            * 93D3F
            GOYES   L_93D47                      * 93D42
            ST=1    0                            * 93D44
L_93D47:
            D1=D1+  10                           * 93D47
            C=DAT1  A                            * 93D4A
            C=C-1   A                            * 93D4D
            C=C-1   A                            * 93D4F
            D=C     A                            * 93D51
            D1=D1+  5                            * 93D53
            C=DAT1  A                            * 93D56
            R4=C                                 * 93D59
            D1=D1+  5                            * 93D5C
            GOSBVL  L_35790                      * 93D5F
            A=R0                                 * 93D66
            B=B+A   A                            * 93D69
            B=B-1   A                            * 93D6B
            GOSBVL  SUB_3767E                    * 93D6D
            ?ST=0   0                            * 93D74
            GOYES   L_93D7B                      * 93D77
            B=B+B   A                            * 93D79
L_93D7B:
            AD1EX                                * 93D7B
            A=A+B   A                            * 93D7E
            D1=A                                 * 93D80
            A=0     W                            * 93D83
            R2=A                                 * 93D86
            R3=A                                 * 93D89
            ST=0    1                            * 93D8C
L_93D8F:
            GOSBVL  GETAB1                       * 93D8F
            ?ST=0   0                            * 93D96
            GOYES   L_93DA1                      * 93D99
            D1=D1+  16                           * 93D9B
            D1=D1+  5                            * 93D9E
L_93DA1:
            SETDEC                               * 93DA1
            GOSBVL  SUB_2BF81                    * 93DA3
            GOSBVL  RCAB2                        * 93DAA
            P=      6                            * 93DB1
            GOSBVL  TST15                        * 93DB3
            GOC     L_93DCB                      * 93DBA
            GOSBVL  STCD2                        * 93DBD
            C=RSTK                               * 93DC4
            RSTK=C                               * 93DC6
            R0=C                                 * 93DC8
L_93DCB:
            SETHEX                               * 93DCB
            C=RSTK                               * 93DCD
            C=C+1   A                            * 93DCF
            RSTK=C                               * 93DD1
            A=R4                                 * 93DD3
            ?C<=A   A                            * 93DD6
            GOYES   L_93D8F                      * 93DD9
            P=      0                            * 93DDB
            GOVLNG  PUSH#LOOP                    * 93DDD
          ENDCODE                                * 93DE4
          1GETLAM OBJ_37013 2DUP#= ?SKIP OBJ_375A7 * 93DE4
          DROP 4UNROLL 6GETLAM EVAL ROT 2GETLAM OBJ_36FB0 ROT #1- ROT 4ROLL * 93DFD
          #1+ DUP 4GETLAM #> UNTIL DROPSWAPDROP ROTROT2DROP ; * 93E34

* ROMPTR 0C2 027
* refs (1): 90007
ROMP_0C2_027:
        :: 3PICK 2GETLAM #+DUP 4PICK #1- OBJ_7CA98 OBJ_37D69 SWAP 4PICK * 93E5C
          PULL%%EL DUP dup;cc? 5PICK %%0= AND ITE * 93E8E
          :: 4ROLL DROPDUP %%ABS ;               * 93EB1
          :: OVER OBJ_37D37 5ROLL %%+ %%SQRT ;   * 93ECA
          4UNROLL OBJ_36C07 3PICK L%- DUPUNROT 6PICK PUT%%EL 3PICK 8PICK * 93EED
          8PICK #+ PUT%%EL 3UNROLL L%* DUP =0?(nb) casedrop * 93F1A
          :: 4PICK #1- 4PUTLAM ;                 * 93F42
          5PICK 2GETLAM #= caseDROP 4PICK        * 93F5B
          ROT 2GETLAM 7PICK DO SWAP#1+SWAP 5PICK 3PICK 6PICK OBJ_7CA98 4PICK * 93F74
          L%/ SWAP 6PICK 4PICK 7PICK ZERO_DO ROT 3PICK PULL%%EL 5PICK L%* * 93FA6
          SWAP3PICK PULL%%EL ROT L%+ 3PICK PUT%%EL 2GETLAM 4ROLLOVER #+ * 93FDD
          4ROLLROT #+ NextInArray 4ROLL DROP ROTOVER PULL%%EL OBJ_37D69 * 9400A
          4dropn;IU! ITE                         * 94032
          :: DROP ROTROT2DROP ;                  * 9403C
          :: SWAP 5PICK PULL%%EL OBJ_37D37 ROTSWAP %%- %%0 %%MAX SWAP3PICK * 94050
            2GETLAM #+ PULL%%EL OBJ_37D69 DUP 4PICK %% 1E-3 %%* %%+ %%< ITE * 94082
            SWAP                                 * 940CE
            :: SWAPDROP 4PICK 2GETLAM #+DUP 8PICK #1- OBJ_7CA98 DUPUNROT * 940D3
              4PICK 2GETLAM #+ PUT%%EL SWAP ;    * 94100
            ROT PUT%%EL SWAPDROP ;               * 9411E
          LOOP ROTROT2DROP ;                     * 94132

* ROMPTR 0C2 028
* refs (1): 90007
ROMP_0C2_028:
        :: 4GETLAM #0=?SEMI 3GETLAM 2GETLAM #* 3UNROLL ONEONE 3GETLAM BINT1 * 94141
          BEGIN 6ROLL 4PICK PULL%%EL SWAP 8PICK 7PICK #+ PULL%%EL ROT L%* * 94173
          SWAP 7ROLL 5GETLAM ZERO_DO 6PICK 5PICK 7PICK OBJ_7CAA4 4PICK L%/ * 941AA
          3UNROLL 7PICK 6PICK 8PICK ZERO_DO 4ROLL 3PICK PULL%%EL 6PICK L%* * 941DC
          5ROLL 4PICK PULL%%EL ROT L%+ 4PICK PUT%%EL 4ROLL 2GETLAM #+ 4ROLL * 9420E
          5GETLAM #+ NextInArray 2DROP ROTDROP 4ROLL #1+ 4UNROLL LOOP * 94245
          ROTDROP 6ROLL #1+ 6ROLL 2GETLAM OBJ_36FB0 6ROLL #1- 6ROLL 4PICK * 94272
          4GETLAM #> UNTIL 4DROP ROTDROP ;       * 942A4

* ROMPTR 0C2 029
* refs (1): 90007
ROMP_0C2_029:
        :: 4GETLAM #0=?SEMI BINT1 2GETLAM 3GETLAM OVER #* #1+SWAP #1+ * 942C2
          4UNROLL 4GETLAM ZERO_DO ROTOVER PULL%%EL 4PICK PUT%%EL ROT 4PICK#+ * 942F4
          ROT#1+ NextInArray 2DROP SWAPDROP ;    * 94321

* ROMPTR 0C2 02A
* refs (1): 90007
ROMP_0C2_02A:
        :: 4GETLAM #0=?SEMI 4GETLAM 2GETLAM OVER #1- #* OVER #+DUP #1+ ROT * 9433A
          2GETLAM 3GETLAM #* #+ 4GETLAM BEGIN 4UNROLL 5PICK 3PICK DUP * 94376
          2GETLAM 4GETLAM #- OBJ_7CC7F OBJ_37D69 SWAP 5PICK PULL%%EL DUP * 943A8
          dup;cc? 5PICK %%0= AND ITE             * 943D5
          :: 4ROLL DROPDUP %%ABS ;               * 943EE
          :: OVER OBJ_37D37 5ROLL %%+ %%SQRT ;   * 94407
          4UNROLL OBJ_36C07 3PICK L%- DUPUNROT 5PICK PUT%%EL 3PICK 7PICK * 9442A
          PUT%%EL 3UNROLL L%* 6PICK #1=case      * 94457
          :: RDROP 6DROP ;                       * 94470
          SWAP 6PICK 4GETLAM #1+ OVER ONE_DO ROT 5PICK PULL%%EL L%CONJ SWAP * 94484
          4PICK PULL%%EL ROT L%* SWAP 7PICK 4PICK 2GETLAM 4GETLAM #- * 944BB
          OBJ_7CC7F ROT L%+ 5PICK L%/ SWAP 6PICK PULL%%EL 3PICK L%* SWAP * 944ED
          5PICK PULL%%EL ROT L%+ 5PICK PUT%%EL 7PICK 4PICK 2GETLAM 4GETLAM * 94524
          DO ROT 3PICK PULL%%EL 5PICK L%* SWAP3PICK PULL%%EL ROT L%+ 3PICK * 94556
          PUT%%EL ROT#1+ ROT#1+ NextInArray 2DROP SWAPDROP ROT 2GETLAM #+ * 9458D
          ROT 2GETLAM #+ LOOP 4DROP ROT 2GETLAM #-#1- ROT 2GETLAM #- ROT #1- * 945BA
          4ROLL #1- AGAIN ;                      * 945FB

* ROMPTR 0C2 02B
* refs (1): 90007
ROMP_0C2_02B:
        :: 4GETLAM #0=?SEMI BINT1 2GETLAM 3GETLAM #* #1+ 4GETLAM #1+ ONEONE * 9460F
          BEGIN 7PICK 5PICK PULL%%EL SWAP 7PICK PULL%%EL ROT L%* L%CONJ * 94646
          4GETLAM 5GETLAM #* #1+ ROT BINT9 PICK 5GETLAM ZERO_DO SWAP 8PICK * 94678
          PULL%%EL ROT 7PICK PULL%%EL ROT L%* 3UNROLL 8PICK 5PICK 2GETLAM * 946AF
          4GETLAM #- OBJ_7C861 4ROLL L%+ 5PICK L%/ 3UNROLL SWAP BINT9 PICK * 946E1
          PULL%%EL L%CONJ 4PICK L%* ROT 8PICK PULL%%EL ROT L%+ 8PICK PUT%%EL * 94718
          8PICK 5PICK 2GETLAM 4GETLAM DO 4ROLL 3PICK PULL%%EL L%CONJ 6PICK * 9474F
          L%* 5ROLL 4PICK PULL%%EL ROT L%+ 4PICK PUT%%EL 4ROLL #1+ 4ROLL * 94781
          5GETLAM #+ NextInArray 2DROP ROTDROP 6ROLL #1+ 6UNROLL ROT#1+UNROT * 947B8
          LOOP 4DROP 5ROLL 2GETLAM OBJ_36FB0 5ROLL #1+ 5ROLL 2GETLAM #+ * 947E5
          5ROLL 5ROLL #1+ DUP 4GETLAM #> UNTIL 5DROP ; * 94817

* ROMPTR 0C2 02C
* refs (1): 90007
ROMP_0C2_02C:
        :: 4GETLAM #0=?SEMI 2GETLAM 4GETLAM DUP#1- 3PICK #* OVER#+ 4PICK * 94844
          3PICK #* ROT ZERO_DO 5PICK 7PICK 4PICK PULL%%EL SWAP ROT 7PICK * 94876
          ZERO_DO 5PICK #1+ 5PICK BINT9 PICK #+ JINDEX@ OBJ_7C861 SWAP 5PICK * 948AD
          PULL%%EL ROT L%- 4PICK L%/ 5PICK PUT%%EL 4ROLL #1- 4UNROLL * 948E4
          NextInArray 3DROP SWAP 3PICK #-#1- SWAP LOOP 3DROP ; * 94916

* ROMPTR 0C2 02D
* refs (1): 90007
ROMP_0C2_02D:
        :: 4GETLAM BINT2 #< ?SEMI                * 94943
          RESOROMP ROMPTR 0C2 02F 6PUTLAM RESOROMP ROMPTR 0C2 030 7PUTLAM * 9495C
          RESOROMP ROMPTR 0C2 02E 8PUTLAM 2GETLAM 3GETLAM #* #1+ ONEONE * 94986
          4PICK OVER PULL%%EL B%ABS DUP ROT %%1 7PICK PUT%%EL %%1 7PICK * 949B4
          2GETLAM #+ PUT%%EL BEGIN 4ROLL 2GETLAM OBJ_36FB0 4UNROLL 6GETLAM * 949EB
          EVAL 8UNROLL 8UNROLL 7GETLAM EVAL 8UNROLL 8UNROLL OVER OBJ_36C52 * 94A18
          %%* 4PICK %%< ?SKIP                    * 94A45
          :: 5PICK 4PUTLAM ;                     * 94A59
          5ROLL #1+ 4GETLAM OVER #> WHILE        * 94A6D
          :: 5UNROLL BINT9 ROLL L%CONJ BINT10 ROLL L%CONJ 8PICK 4ROLL 8PICK * 94A8B
            8GETLAM EVAL 7ROLL L%CONJ 8ROLL L%CONJ 8PICK 2GETLAM #+ 4ROLL * 94AC2
            8PICK 8GETLAM EVAL ;                 * 94AF4
          REPEAT BINT10 NDROP ;                  * 94B08

* ROMPTR 0C2 02E
* refs (1): 90007
ROMP_0C2_02E:
        :: ONE_DO OVER PULL%%EL 4PICK L%* 3PICK PUT%%EL SWAP#1+SWAP * 94B1C
          NextInArray ROTDROP 3UNROLL PUT%%EL ;  * 94B49

* ROMPTR 0C2 02F
* refs (1): 90007
ROMP_0C2_02F:
        :: 4PICK PULL%%EL DUP B%ABS 5PICK %%1E-14 %%* OVER %%> case * 94B62
          :: 5UNROLL 4ROLL 2DROP %%0 %%1 ;       * 94B99
          ROT 8PICK 8PICK DUP#1+ SWAP OBJ_7C855 DUP B%ABS 7PICK %%1E-14 %%* * 94BBC
          OVER %%> case2drop                     * 94BF3
          :: ROTDROP %%1 %%0 4ROLL 6PICK OVER %%< caseDROP 6UNROLL * 94C02
            5ROLL DROPSWAP ;                     * 94C34
          4PICKOVER OBJ_37DA0 %%1E-14 %%* 8PICK %%> case * 94C43
          :: 4PICK %%SQR %%SQRT 4ROLLOVER %%/ 7ROLL %%* 6UNROLL 4ROLL L%CONJ * 94C66
            B%NEG OVER L%/ 3UNROLL L%/ L%CONJ ;  * 94C9D
          7PICK %%/ 4ROLL 7PICK %%/ 2DUP %%+ 3PICKOVER %%* 1+(rr) 3PICK3PICK * 94CC0
          %%* %%MAX 5UNROLL 3PICK3PICK %%- %%* DUP %%+ 1+(rr) %%0>= ITE * 94CF7
          :: DUP %%* SWAPDUP %%* OVER %%+ 1+(rr) OBJ_37B30 DUPDUP %%* 3PICK * 94D2E
            %%- %%ABS %%SQRT %%+ %%/ SWAP 7PICK L%/ %%1 3PICK %%- L%/ 5ROLL * 94D6A
            7PICK %%CHS L%/ 3PICK L%/ ROT ;      * 94DAB
          :: SWAPDUP %%* SWAPDUP %%* OVER %%+ %%1 %%- OBJ_37B30 DUPDUP %%* * 94DCE
            OVER %%0> ITE                        * 94E0A
            :: 3PICK %%+ %%SQRT %%+ %%/ %%CHS ;  * 94E19
            :: ROT %%+ %%SQRT %%- ;              * 94E41
            SWAP 7PICK %%CHS L%/ OVER L%/ 5ROLL 7PICK %%CHS L%/ 3PICK 1+(rr) * 94E5F
            L%/ ROT 1+(rr) ;                     * 94E9B
          4ROLL %% 4E-28 %%+* %%SQRT 6ROLL %%* 5UNROLL OVER OBJ_37D37 OVER * 94EAF
          OBJ_37D37 %%+ %%SQRT DUPUNROT L%/ 3UNROLL L%/ SWAP ; * 94EF6

* ROMPTR 0C2 030
* refs (1): 90007
ROMP_0C2_030:
        :: 4PICK PULL%%EL DUP B%ABS ROT 8PICK 2GETLAM #+ 8PICK DUP#1+ SWAP * 94F23
          OBJ_7C855 DUP B%ABS 6PICK %%1E-14 %%* 5PICK OVER %%< casedrop * 94F5F
          :: 6ROLL %%SQR %%SQRT 5UNROLL DROP ROTROT2DROP %%1 %%0 ; * 94F91
          OVER %%> case2drop                     * 94FC3
          :: ROTDROP %%1 %%0 4ROLL 5PICK OVER %%< caseDROP 5UNROLL * 94FD2
            4ROLL DROPSWAP ;                     * 95004
          4PICKOVER OBJ_37DA0 %%1E-14 %%* 7PICK %%> case * 95013
          :: 6ROLL DROP 4ROLL %%SQR %%SQRT DUP 6UNROLL DUPUNROT L%/ 4ROLLROT * 95036
            L%/ ;                                * 9506D
          6PICK %%/ DUP %%* 4ROLL 6PICK %%/ DUP %%* %%1 3PICK %%- SWAP %%- * 95077
          OBJ_37B30 DUPDUP %%* OVER %%0> ITE     * 950BD
          :: 3PICK %%+ %%SQRT %%+ %%/ ;          * 950DB
          :: ROT %%+ %%SQRT SWAP %%- ;           * 950FE
          SWAP 5PICK %%CHS L%/ OVER L%/ 4ROLL 5PICK %%CHS L%/ 3PICK 1+(rr) * 95121
          L%/ ROT 1+(rr) 5ROLL %%* 4UNROLL OVER OBJ_37D37 OVER OBJ_37D37 %%+ * 9515D
          %%SQRT DUPUNROT L%/ 3UNROLL L%/ SWAP ; * 95194

* ROMPTR 0C2 031
* refs (1): 90007
ROMP_0C2_031:
        :: DUP DIMLIMITS OVER OBJ_7D7F9 ITE %%0 ((0,0)) * 951B7
          MAKEARRY OBJ_7CDBF ;                   * 951DF

* ROMPTR 0C2 032
* refs (1): 90007
ROMP_0C2_032:
        :: DUP DIMLIMITS OVER OBJ_7D7F9 ITE %0_2A2B4 C%0 * 951EE
          MAKEARRY SWAP OBJ_7CDE2 ;              * 95216

* ROMPTR 0C2 033
* refs (1): 90007
ROMP_0C2_033:
        :: DUP TWO{}N SWAP MAKEARRY              * 9522A
          CODE                                   * 95243  91 nibbles
            GOSBVL  SAVPTR                       * 9524D
            C=DAT1  A                            * 95254
            D1=C                                 * 95257
            D1=D1+  10                           * 9525A
            C=DAT1  A                            * 9525D
            D=C     A                            * 95260
            D1=D1+  10                           * 95262
            A=DAT1  A                            * 95265
            D1=D1+  15                           * 95268
            D1=D1+  14                           * 9526B
            B=A     A                            * 9526E
            A=A+1   A                            * 95270
            GOSBVL  SUB_3768C                    * 95272
            LC(5)   DOEREL                       * 95279
            ?D=C    A                            * 95280
            GOYES   L_95287                      * 95283
            A=A+A   A                            * 95285
L_95287:
            C=0     S                            * 95287
            C=C+1   S                            * 9528A
            GONC    L_9529C                      * 9528D
L_95290:
            DAT1=C  S                            * 95290
            CD1EX                                * 95294
            C=C+A   A                            * 95297
            D1=C                                 * 95299
L_9529C:
            B=B-1   A                            * 9529C
            GONC    L_95290                      * 9529E
            GOVLNG  GETPTRLOOP                   * 952A1
          ENDCODE                                * 952A8
        ;                                        * 952A8

* ROMPTR 0C2 034
* refs (1): 90007
SNRM~1:
        :: DUP MDIMS NOTcasedrop MATABS          * 952AD
          ROMPTR 0C2 035 ABND DROP %%>% ;        * 952C6

* ROMPTR 0C2 035
* refs (1): 90007
ROMP_0C2_035:
        :: ROMPTR 0C2 04B BINT2 3GETLAM TWO{}N %%0 MAKEARRY SWAP TRUE TRUE * 952E5
          ROT ROMPTR 0C2 031 SWAPDROP 2GETLAM 1GETLAM #< ITE ROMPTR 0C2 03A * 9531D
          ROMPTR 0C2 039                         * 95351
          ROMPTR 0C2 03F ROTROT2DROP 3GETLAM ROMPTR 0C2 001 ; * 9535C

* ROMPTR 0C2 036
* refs (1): 90007
RANK~1:
        :: DUP MDIMS NcaseDIMERR ROMPTR 0C2 035  * 95381
          OVER %%0= case2drop %0_2A2B4           * 953A0
          SWAP OBJ_36C52 %%* BINT0 ROT 3GETLAM ABND #1+_ONE_DO INDEX@ * 953B4
          PULL%%EL %%ABS 4PICK %%<= ?SKIP SWAP#1+SWAP * 953E1
          NextInArray DROPSWAPDROP UNCOERCE ;    * 953FF

* ROMPTR 0C2 037
* refs (1): 90007
SVL~1:
        :: DUP MDIMS NcaseDIMERR ROMPTR 0C2 04B  * 95413
          BINT2 3GETLAM TWO{}N %%0 MAKEARRY SWAP TRUE TRUE ROT * 95432
          ROMPTR 0C2 031 SWAPDROP 2GETLAM 1GETLAM #< ITE ROMPTR 0C2 03A * 9545F
          ROMPTR 0C2 039                         * 9548E
          ROMPTR 0C2 03F ROMPTR 0C2 04A ROTROT2DROP 3GETLAM ABND BINT1 {}N * 95499
          OVER OBJ_7D7F9 ITE %0_2A2B4 C%0        * 954C8
          MAKEARRY SWAP OBJ_7CDE2 ;              * 954E1

* ROMPTR 0C2 038
* refs (1): 90007
SVD~1:
        :: DUP MDIMS NcaseDIMERR ROMPTR 0C2 04B  * 954F5
          BINT2 3GETLAM TWO{}N %%0 MAKEARRY SWAP ((0,0)) 1GETLAM * 95514
          ROMPTR 0C2 033 SWAP ((0,0)) 2GETLAM ROMPTR 0C2 033 SWAP * 9553C
          ROMPTR 0C2 031 SWAPDROP 2GETLAM 1GETLAM #< ITE ROMPTR 0C2 03A * 95566
          ROMPTR 0C2 039                         * 95595
          ROMPTR 0C2 03F ROMPTR 0C2 04A 3GETLAM ABND BINT1 {}N OVER * 955A0
          OBJ_7D7F9 ITE %0_2A2B4 C%0             * 955CF
          MAKEARRY SWAP OBJ_7CDE2 3UNROLL ROMPTR 0C2 032 3UNROLL * 955E3
          ROMPTR 0C2 032 SWAP ;                  * 95607

* ROMPTR 0C2 039
* refs (1): 90007
ROMP_0C2_039:
        :: ONEONE ROT BEGIN 2GETLAM 4PICK #-SWAP 4GETLAM EVAL 7PICK 5ROLL * 9561C
          5PICK PUT%%EL DROP 3PICK 1GETLAM #< WHILE * 95653
          :: SWAP#1+ 1GETLAM 4PICK #-#1- ROT 6GETLAM EVAL 7PICK 5ROLL 5PICK * 95676
            3GETLAM #+ PUT%%EL DROP ROT#1+ ROT 1GETLAM #+ ROT CkATTNQUIT ; * 956AD
          REPEAT 3DROP ROT ;                     * 956E4

* ROMPTR 0C2 03A
* refs (1): 90007
ROMP_0C2_03A:
        :: ONEONE ROT BEGIN 1GETLAM 4PICK #-SWAP 6GETLAM EVAL 7PICK 5ROLL * 956F8
          5PICK PUT%%EL DROP 3PICK 2GETLAM #< WHILE * 9572F
          :: 1GETLAM ROT#+ 2GETLAM 4PICK #-#1- ROT 4GETLAM EVAL 7PICK 5ROLL * 95752
            5PICK 3GETLAM #+ PUT%%EL DROP ROT#1+UNROT SWAP#1+SWAP CkATTNQUIT ; * 95789
          REPEAT 3DROP ROT 3GETLAM DUP#1= caseDROP ONE_DO * 957B6
          INDEX@ 3GETLAM #+ PULL%%EL SWAP INDEX@ PULL%%EL ROT 9GETLAM EVAL * 957D9
          4ROLLSWAP INDEX@ PUT%%EL INDEX@ #1+ PULL%%EL 3PICKOVER %%* ROTSWAP * 9580B
          INDEX@ 3GETLAM #+ PUT%%EL SWAP 4PICK %%* INDEX@ #1+ PUT%%EL * 95838
          3UNROLL 4PICK 3UNROLL INDEX@ 2GETLAM 10GETLAM EVAL NextInArray ; * 9586A

* ROMPTR 0C2 03B
* refs (1): 90007
ROMP_0C2_03B:
        :: 3PICK 1GETLAM #+DUP 4PICK OBJ_7CA98 OBJ_37D69 SWAP 4PICK PULL%%EL * 95897
          DUP dup;cc? 5PICK %%0= ANDcase         * 958C9
          :: 7UNROLL DROP ROTROT2DROP ;          * 958E2
          OVER OBJ_37D37 5ROLL %%+ %%SQRT 4UNROLL OBJ_36C07 3PICK L%- * 958FB
          DUPUNROT 6PICK PUT%%EL UNROTOVER 7UNROLL L%* ROT#1+UNROT 5PICK * 95928
          1GETLAM #= ITE SWAP                    * 95950
          :: 5GETLAM EVAL ;                      * 95964
          7PICK case ROTROT2DROP                 * 95978
          SWAP L%CONJ SWAP 7PICK SWAP 2GETLAM 5PICK #1-- 2GETLAM ZERO_DO * 95987
          3UNROLL 3PICK 7PICK 7PICK OBJ_7C861 5PICK L%/ 3UNROLL 7PICK 5PICK * 959B9
          8PICK ZERO_DO ROT 3PICK PULL%%EL L%CONJ 6PICK L%* 5ROLL 4PICK * 959EB
          PULL%%EL ROT L%+ 4PICK PUT%%EL SWAP4ROLL 1GETLAM #+ 4ROLL #1+ * 95A1D
          NextInArray 2DROP 2SWAP DROP 2GETLAM #+ LOOP DROPSWAPDROP * 95A4F
          ROTROT2DROP ;                          * 95A77

* ROMPTR 0C2 03C
* refs (1): 90007
ROMP_0C2_03C:
        :: 3PICK #1+DUP 4PICK OBJ_7CC7F OBJ_37D69 SWAP 4PICK PULL%%EL DUP * 95A81
          dup;cc? 5PICK %%0= ANDcase             * 95AB3
          :: 7UNROLL DROP ROTROT2DROP ;          * 95AC7
          OVER OBJ_37D37 5ROLL %%+ %%SQRT 4UNROLL OBJ_36C07 3PICK L%- * 95AE0
          DUPUNROT 6PICK PUT%%EL UNROTOVER 7UNROLL L%* ROT#1+UNROT 5PICK * 95B0D
          2GETLAM #= ITE SWAP                    * 95B35
          :: 7GETLAM EVAL ;                      * 95B49
          8PICK case ROTROT2DROP                 * 95B5D
          SWAP L%CONJ SWAP 8PICK 1GETLAM 5PICK #- 1GETLAM #* #1+ 1GETLAM * 95B6C
          ZERO_DO 3UNROLL 6PICK 4PICK 7PICK OBJ_7C861 5PICK L%/ SWAPROT * 95BA3
          7PICK 5PICK 8PICK ZERO_DO ROT 3PICK PULL%%EL L%CONJ 6PICK L%* * 95BD0
          5ROLL 4PICK PULL%%EL ROT L%+ 4PICK PUT%%EL SWAP4ROLL #1+ 4ROLL * 95C02
          1GETLAM #+ NextInArray 2DROP SWAP 2SWAP DROP #1+ LOOP 2DROP * 95C34
          ROTROT2DROP ;                          * 95C66

* ROMPTR 0C2 03D
* refs (1): 90007
ROMP_0C2_03D:
        :: 4PICK ROT 2GETLAM 7PICK DO SWAP 1GETLAM #+SWAP 5PICK 3PICK 6PICK * 95C70
          OBJ_7CC7F 4PICK L%/ SWAP 6PICK 4PICK 7PICK ZERO_DO ROT 3PICK * 95CAC
          PULL%%EL 5PICK L%* SWAP3PICK PULL%%EL ROT L%+ 3PICK PUT%%EL ROT#1+ * 95CDE
          ROT#1+ NextInArray 2DROP SWAPDROP LOOP SWAPDROP ; * 95D10

* ROMPTR 0C2 03E
* refs (1): 90007
ROMP_0C2_03E:
        :: OVER %%0= case                        * 95D33
          :: %%1 3UNROLL 4dropn;IU! ?SEMI        * 95D47
            ROTSWAP ;                            * 95D60
          OVER %%ABS OVER %%ABS %%> 3UNROLL 3PICK ?SKIP SWAP * 95D6A
          OVER %%/ DUPDUP %%* 1+(rr) %%SQRT DUP %%1/ ROTOVER %%* 2SWAP %%* * 95D97
          4ROLL ?SKIP ROTSWAP                    * 95DD3
        ;                                        * 95DE2

* ROMPTR 0C2 03F
* refs (1): 90007
ROMP_0C2_03F:
        :: 3GETLAM #1= ?SEMI                     * 95DE7
          RESOROMP ROMPTR 0C2 040 12PUTLAM RESOROMP ROMPTR 0C2 041 13PUTLAM * 95DFB
          RESOROMP ROMPTR 0C2 042 14PUTLAM RESOROMP ROMPTR 0C2 043 15PUTLAM * 95E25
          RESOROMP ROMPTR 0C2 046 16PUTLAM RESOROMP ROMPTR 0C2 047 17PUTLAM * 95E4F
          RESOROMP ROMPTR 0C2 044 18PUTLAM RESOROMP ROMPTR 0C2 045 19PUTLAM * 95E79
          BINT1 PULL%%EL %%ABS DUP 3GETLAM ONE_DO 4dropn;IU! ?SKIP * 95EA3
          :: ROT INDEX@ 3GETLAM #+ PULL%%EL %%ABS SWAPINDEX@ #1+ PULL%%EL * 95ECB
            %%ABS ROT 4ROLL DUPUNROT %%+ %%/ %%* ROTOVER OBJ_37DA0 SWAP ; * 95EFD
          NextInArray DROP %%3E-13 %%* 3GETLAM UNCOERCE %>%%SQRT %%/ 4PUTLAM * 95F34
          BINT0 5PUTLAM # FFFFF 6PUTLAM TRUE 7PUTLAM %%0 8PUTLAM 3GETLAM * 95F61
          BEGIN DUPUNROT PULL%%EL %%ABS 3PICK #1- * 95F93
          :: BEGIN CkATTNQUIT ROTOVER PULL%%EL %%ABS SWAP3PICK 3GETLAM #+ * 95FB1
            PULL%%EL %%ABS DUPUNROT 4GETLAM %%<= case * 95FDE
            :: RDROP SWAP %%0= ?SKIP             * 95FFC
              :: %%0 4PICK 3GETLAM #+ PUT%%EL ;  * 96015
              5UNROLL DROPSWAP 8PUTLAM ;         * 96038
            3UNROLL %%MAX 4ROLL %%MAX ROT #1- DUP#0= UNTIL SWAP 8PUTLAM * 9604C
            ROTSWAP ;                            * 9607E
          :: 2DUP #1+ #=case SWAPDROP            * 96088
            #1+ 2DUP #1+ #=case                  * 960A1
            :: 12GETLAM EVAL ;                   * 960B5
            OVER 6GETLAM #< OVER 5GETLAM #> OR IT * 960C9
            :: ROT 3PICK PULL%%EL %%ABS SWAP3PICK PULL%%EL %%ABS ROT %%>= * 960F1
              7PUTLAM 3UNROLL ;                  * 96123
            7GETLAM ITE 13GETLAM 14GETLAM        * 96132
            EVAL caseDROP SWAP                   * 96146
            6PUTLAM SWAP 5PUTLAM 15GETLAM EVAL 4dropn;IU! ITE * 96155
            :: DROP 7GETLAM ITE 16GETLAM 17GETLAM * 96178
              EVAL 6ROLL 3PICK PULL%%EL 7ROLL %%* DUPUNROT 7ROLL %%* 5ROLL * 96196
              PUT%%EL SWAP4ROLL %%* DUPUNROT 4PICK PUT%%EL 3UNROLL ; * 961C8
            :: 7GETLAM ITE 18GETLAM 19GETLAM     * 961F0
              EVAL ;                             * 96209
            %%ABS 4GETLAM %%> ITE DROP           * 96213
            :: %%0 SWAP PUT%%EL ;                * 9622C
            5GETLAM ;                            * 96245
          DUPTWO #< UNTIL DROP ;                 * 9624F
