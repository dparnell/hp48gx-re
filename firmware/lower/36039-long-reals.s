* HP 48GX ROM revision R, #36039-#37FFF: Extended real arithmetic
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: L%* L%/ L%+ CKREF doerr501 L%- MATREDIM ((0,0)) 3NULLLAM{} FreeRefs =0?(nb) B%ABS
* Follows on from the previous file (at #36039 in the original ROM).
        RPL

* [%re] [%im] -> [C%]
* refs (1): 1C7B7
MATR>C:
        :: dup;ra?#BAT! SWAP dup;ra?#BAT! SWAP idsize(2ar)? DUP DIMLIMITS * 36039
          C%0 MAKEARRY ONE_DO_ARRY 3PICK INDEX@ PULLREALEL SWAPDROP 3PICK * 36061
          INDEX@ PULLREALEL SWAPDROP %>C% INDEX@ PUTCMPEL NextInArray * 36089
          ROTROT2DROP ;                          * 360AC

* [C%] -> [%re] [%im]
* refs (1): 1C9A7
MATC>R:
        :: dup;ca?#BAT! DUP%0CON DUP TOTEMPOB ONE_DO_ARRY ROT INDEX@ * 360B6
          PULLCMPEL C%>% 5ROLL SWAPINDEX@ PUTREALEL 4ROLLROT INDEX@ * 360DE
          PUTREALEL NextInArray ROTDROPSWAP ;    * 36101

* [F%] [F%]' -> [F%]''
* refs (1): 1AC20
MAT+:
        :: ' L%+ DUP                             * 36115

* refs (1): 362A0
OBJ_36129:
          :: 2SWAP idsize(2ar)? OBJ_35AEE OBJ_3615B OBJ_36197 OBJ_361A6 * 36129
            OBJ_3615B ;                          * 3614C
        ;                                        * 36156

* refs (2): 3613D 3614C
OBJ_3615B:
        :: 2DUPEQ casedrop                       * 3615B
          :: ROTDROP CKREF DUP DOARRYPRG2 ;      * 3616A
          INTEMNOTREF? case OBJ_361A6            * 36188

* refs (1): 36142
OBJ_36197:
          :: SWAPROT 4UNROLL                     * 36197

* refs (2): 36147 36192
OBJ_361A6:
            :: ROTDROP CKREF DOARRYPRG2 ; ;      * 361A6
        ;                                        * 361C4

* refs (1): 20522
1@+(2ar):
        :: ' L%+                                 * 361C9

* refs (2): 362B9 362D2
OBJ_361D8:
          :: 3UNROLL idsize(2ar)? OBJ_35AEE OBJ_361FB OBJ_36241 OBJ_3620A * 361D8

* refs (1): 361EC
OBJ_361FB:
            :: 2DUPEQ NOTcase                    * 361FB

* refs (1): 361F6
OBJ_3620A:
              :: FreeRefs DOARRYPRG2 ;           * 3620A
              DROP FreeRefs DUP DOARRYPRG2 ;     * 3621E
          ;                                      * 36237
        ;                                        * 3623C

* refs (1): 361F1
OBJ_36241:
        :: TOTEMPOBADJ ROTSWAP REPLACE ' SWAP 4ROLL 2Ob>Seco 3UNROLL * 36241
          DOARRYPRG2 ;                           * 3626E

* [F%] [F%]' -> [F%]''
* refs (1): 1AD5E
MAT-:
        :: ' L%- '                               * 36278

* refs (1): 362CD
OBJ_3628C:
          :: SWAP L%- ; OBJ_36129 ;              * 3628C

* refs (1): 205D3
1@-(2ar):
        :: ' L%- OBJ_361D8 ;                     * 362AA

* refs (1): 205F6
2@-(2ar):
        :: SWAP' OBJ_3628C OBJ_361D8 ;           * 362C3

* [F%] F% -> [F%]'
* refs (4): 1AE43 1AE4D 1AE57 1AE61
MATFLOAT*:
        :: '                                     * 362DC

* refs (1): 36336
OBJ_362E6:
          :: 4PICK L%* ;                         * 362E6

* refs (1): 363FE
OBJ_362FA:
          :: UNROTDUP TYPEARRAY? ?SKIPSWAP OBJ_36395 3UNROLL DOARRYPRG1 * 362FA
            SWAPDROP ;                           * 3631D
        ;                                        * 36327

* refs (1): 2085C
1@*(nb,ar):
        :: ' OBJ_362E6                           * 3632C

* refs (1): 3641C
OBJ_3633B:
          :: 3UNROLL OBJ_3639A ITE FreeRefs      * 3633B
            :: DUP r->c(ar) OBJ_35C18 REPLACE ;  * 36354
            SWAP F%>L% 3UNROLL DOARRYPRG1 SWAPDROP ; * 36372
        ;                                        * 36390

* refs (3): 3630E CBCE1 CBD9F
OBJ_36395:
        ::                                       * 36395

* refs (1): 36345
OBJ_3639A:
          :: OVER TYPEREAL? OVER TYPECARRY? OR ; ITE CKREF r->c(ar) * 3639A
          SWAP F%>L% ;                           * 363CC

* [F%] F% -> [F%]'
* refs (2): 1AF5A 1AF64
MATFLOAT/:
        :: dup;=0?:UR! '                         * 363DB

* refs (1): 36417
OBJ_363EA:
          :: 4PICK L%/ ; OBJ_362FA ;             * 363EA

* refs (1): 206D9
1@/(ar,nb):
        :: dup;=0?:UR! SWAP' OBJ_363EA OBJ_3633B ; * 36408

* refs (2): 363E0 3640D
dup;=0?:UR!:
        :: DUP =0?(nb) case2drop SETIVLERR       * 36426
        ;                                        * 3643F

* [F%] -> [F%]'
* refs (1): 1B449
MATSQ:
        :: DUP                                   * 36444

* [F%] [F%]' -> [F%]''
* refs (2): 1AE6B B4E25
MAT*:
          :: dup2;*(2ar) ROTROT2DROP ; ;         * 3644E

* refs (1): 2089D
1@*(2ar):
        :: dup2;*(2ar) ROTDROPSWAP FreeRefs REPLACE ; * 36467

* refs (1): 208DE
2@*(2ar):
        :: dup2;*(2ar) SWAPDROPSWAP FreeRefs REPLACE ; * 36485

* refs (3): 36453 3646C 3648A
dup2;*(2ar):
        :: 0ChkType(2ar) 3PICK MDIMS OBJ_37DE1 4PICK MDIMS ITE * 364A3

4pick;over;<2>:
          :: 4PICKOVER BINT2 ;                   * 364CB
          :: BINT1 4PICKOVER ;                   * 364DF
          {}N ROT 4PICK #= OBJ_37DE1 5ROLL MAKEARRY OBJ_36525 ROTSWAP ; * 364F3

* refs (2): 36516 36679
OBJ_36525:
        :: BINT1 7ROLL 7ROLL 7ROLL 7PICK #* #1+_ONE_DO 5PICK #1+_ONE_DO * 36525
          JINDEX@ INDEX@ 8PICK OBJ_3582F 5ROLL 5ROLL DUP#1+ 6UNROLL 3@REVAL * 36557
          PUTEL 4UNROLL NextInArray 6PICK +LOOP 5ROLLDROP 5ROLLDROP 2SWAP * 36584
          DROP COLASKIP ;                        * 365AC

* [F%] [F%] [F%] -> [F%]
* refs (1): 1C04D
MATRSD:
        :: OVER MDIMS OBJ_37DE1 3PICK MDIMS ITE  * 365BB
          :: SWAP3PICK #= OBJ_37DE1 6PICK MDIMS OBJ_37DE1 3PICK #= OBJ_37DE1 * 365DE
            4PICK #= OBJ_37DE1 ;                 * 36610
          :: OVER#= OBJ_37DE1 5PICK MDIMS NOT OBJ_37DE1 3PICK #= OBJ_37DE1 * 36624
            BINT1 ;                              * 36656
          6ROLL 6PICK 6PICK OBJ_366AB ROTROT2DROP OBJ_36525 * 36660
          :: DUPUNROT PULLLONGEL 4ROLL L%- ROT ; ROTROT2DROP ; * 3667E

* refs (1): 3666F
OBJ_366AB:
        :: OBJ_35AEE rot;NewobIfNotFree OBJ_366E2 OBJ_366E2 OBJ_366E2 ; * 366AB

* refs (5): 366B5 4F99E 4F9F8 CBBFF CBC78
rot;NewobIfNotFree:
        :: ROT CKREF ;                           * 366CE

* refs (3): 366BA 366BF 366C4
OBJ_366E2:
        :: ROTDUP TYPERARRY? case r->c(ar)       * 366E2
          CKREF ;                                * 366FB

* [F%] [F%]' -> F%
* refs (1): 1C00D
MATDOT:
        :: OVERARSIZE OVERARSIZE OVER#= OBJ_37DE1 %%0 SWAP #1+_ONE_DO INDEX@ * 36705
          4ROLLOVER PULLLONGEL 5ROLL 4ROLL PULLLONGEL ROT L%* 4ROLL L%+ * 36732
          NextInArray ROTROT2DROP                * 3675F

* refs (4): 36A8A 97968 97F17 CBA04
ToNorm(nb):
          :: SWITCHFLOATS NOP NOP %%>% C%%>C% ; ; * 36769

* [F%] [F%]' -> [F%]''
* refs (1): 1C02D
MATCROSS:
        :: OBJ_3689A OBJ_3689A 0ChkType(2ar)     * 36791

{<3>}:
          { BINT3 } SWAP MAKEARRY BINT2 BINT3    * 367A5

* refs (2): 36845 3685E
OBJ_367C8:
          :: 5PICK                               * 367C8

* refs (3): 367FF 36A62 36A7B
OBJ_367D2:
            :: 3PICK PULLLONGEL SWAP3PICK PULLLONGEL SWAPDROP 2SWAP ; 6PICK * 367D2
            OBJ_367D2 2DROP                      * 367FF

* refs (1): 36A85
OBJ_36809:
            :: 4ROLL L%* 3UNROLL L%* L%- ; ;     * 36809
          BINT1 PUTEL BINT3 BINT1 OBJ_367C8 BINT2 PUTEL BINT1 BINT2 * 36831
          OBJ_367C8 BINT3 PUTEL ROTROT2DROP ;    * 3685E

* refs (2): 364A8 367A0
0ChkType(2ar):
        :: OBJ_35AEE %0_2A2B4 C%0 C%0 C%0 ;      * 36877

* refs (2): 36796 3679B
OBJ_3689A:
        :: SWAPDUP MDIMS NOT OBJ_37DE1 DUP #3= caseDROP #2= * 3689A
          NOTcase doerr501                       * 368C7
          DOARRY> DROP%0                         * 368D1
          { %3 } XEQ>ARRAY ;                     * 368DB

* refs (1): 1BFAD
MATRNRM:
        :: OBJ_36930 NOP %%>% ;                  * 368F4

* [F%] -> F%
* refs (1): 1BFCD
MATCNRM:
        ::                                       * 3690D

* refs (4): 97981 C7CB2 C9484 CA45F
OBJ_36912:
          :: OBJ_36930 2SWAP ; %%>% ;            * 36912

* refs (2): 368F9 36917
OBJ_36930:
        :: BINT1 OVER MDIMS ?SKIP BINT1          * 36930
          SWAPDROPDUP 4PICK ARSIZE 'REVAL 5ROLL %%0 ROT #1+_ONE_DO %%0 ROT * 3694E
          INDEX@ DUP 7PICK #+SWAP DO INDEX@ PULLLONGEL B%ABS ROT %%+ SWAP * 36980
          6PICK OBJ_357F0 +LOOP 3UNROLL %%MAX 3PICK +LOOP 5UNROLL 4DROP ; * 369B7

* [F%] -> F%
* refs (2): 1AA42 952C1
MATABS:
        :: %%0 OVERARSIZE 3PICK TYPERARRY? ?SKIP #2* * 369E9
          #1+_ONE_DO SWAPINDEX@ PULLREALEL DUP _*(2r);r=>rr ROT %%+ * 36A0C
          NextInArray SWAPDROP %%SQRT %%>% ;     * 36A2F

* [F%] -> F%
* refs (1): 1BFED
MATDET:
        ROMPTR 0C2 051                           * 36A48

* refs (1): 97ED9
OBJ_36A53:
        :: BINT1 SWAP3PICK OBJ_367D2 2DROP BINT3 BINT4 5PICK OBJ_367D2 2DROP * 36A53
          OBJ_36809 ToNorm(nb) SWAPDROP ;        * 36A85

* [F%] -> [F%]'
* refs (1): 1B29B
MATINV:
        ROMPTR 0C2 055                           * 36A99

* refs (1): 20337
@inv(ar):
        :: sqmat(ar)? OBJ_35C18 ROMPTR 0C2 056 ; * 36AA4

* [F%] [F%]' -> [F%]''
* refs (1): 1AF6E
MAT/:
        ROMPTR 0C2 053                           * 36AC3

* refs (1): 2071A
1@/(2ar):
        ::                                       * 36ACE

* refs (2): 36B60 97FB9
OBJ_36AD3:
          :: sqmat(ar)? 3PICK MDIMS ?SKIP BINT1  * 36AD3
            SWAP3PICK #= OBJ_37DE1 2SWAP ;       * 36AF1
          FreeRefs SWAP                          * 36B0A

* refs (2): 937E2 97FC3
OBJ_36B14:
          :: OBJ_35AEE CKREF r->c(ar) CKREF CKREF ; OVER 5UNROLL * 36B14
          ROMPTR 0C2 054 SWAP REPLACE ;          * 36B41

* refs (1): 2073D
2@/(2ar):
        :: OBJ_36AD3 CKREF SWAP OBJ_35AEE OBJ_36B8D OBJ_36BA7 OBJ_36B8D * 36B5B
          OBJ_36B8D ;                            * 36B83

* refs (3): 36B74 36B7E 36B83
OBJ_36B8D:
        :: FreeRefs ROMPTR 0C2 054 ;             * 36B8D

* refs (1): 36B79
OBJ_36BA7:
        :: FreeRefs DUP r->c(ar) SWAP REPLACE ROMPTR 0C2 054 ; * 36BA7

* refs (3): 92ED0 9662D 96637
OBJ_36BD5:
        :: %%0>= ?SEMI                           * 36BD5
          %%CHS ;                                * 36BE4

* refs (2): 911F3 915DB
OBJ_36BEE:
        :: %%0< ?SEMI                            * 36BEE
          %%CHS ;                                * 36BFD

* refs (5): 9062E 93EF2 9442F 95919 95AFE
OBJ_36C07:
        :: %%0< ?SEMI                            * 36C07
          ROT %%CHS 3UNROLL ;                    * 36C16

* refs (9): 965A6 965B0 965BF 965DD 965E7 965F1 ...
OBJ_36C2A:
        :: %%0>= ?SEMI                           * 36C2A
          %%CHS SWAP %%CHS SWAP ;                * 36C39

* refs (2): 94A40 953B9
OBJ_36C52:
        :: BINT54 TestSysFlag ITE %%0 %%1E-14    * 36C52
        ;                                        * 36C70

* refs (19): 37A27 7CDA1 900C2 90169 90178 903C2 ...
((0,0)):
        C%% 0E0 0E0                              * 36C75

* refs (2): 37AD6 CAC45
%%-1:
        %% -1E0                                  * 36CA4

* refs (1): 92218
%%1E-514:
        %% 1E-514                                * 36CBE

* refs (11): 36C6B 9220E 928A3 928B2 94B80 94BE9 ...
%%1E-14:
        %% 1E-14                                 * 36CD8

* refs (6): 90D78 91135 91ED2 9302E 966E6 9685D
%%1E-13:
        %% 1E-13                                 * 36CF2

* refs (3): 95F3E 96790 96907
%%3E-13:
        %% 3E-13                                 * 36D0C

* refs (2): C9239 CA947
OBJ_36D26:
        :: DUPUNROT OBJ_36DDF                    * 36D26

* refs (1): 36D76
OBJ_36D35:
          :: %>%% %%+ %%>% SWAP OBJ_36EBB ; ;    * 36D35

* refs (2): C9229 CA937
OBJ_36D5D:
        :: DUPUNROT OBJ_36E5C DUPTYPEREAL? case OBJ_36D35 * 36D5D
          TOTEMPOB SWAP OBJ_7D6D2 SWAP OBJ_36EE3 ; * 36D7B

* refs (3): 36DBC 36E25 36E4D
OBJ_36D99:
        :: CRUNCH 0LASTOWDOB! ?ATTNQUIT CK1NOLASTWD ; * 36D99

* refs (15): 36DD5 C7C94 C8187 C82A6 C8360 C843E ...
OBJ_36DB7:
        :: OBJ_36D99 OBJ_36DF8 ;                 * 36DB7

* refs (6): C7BDE C8139 C9092 C93E7 C9744 CA62C
OBJ_36DCB:
        :: OBJ_36E93 OBJ_36DB7 ;                 * 36DCB

* refs (5): 36D30 C7A6A C7F7C C935E CAAB8
OBJ_36DDF:
        :: SAFE@_HERE DROP OBJ_36DF8 ;           * 36DDF

* refs (3): 36DC1 36DEE 36E89
OBJ_36DF8:
        :: DUPTYPEREAL? ?SEMI                    * 36DF8
          DUPTYPEEXT? NOTcase SETTYPEERR         * 36E07
          U>nbr ;                                * 36E16

* refs (14): C7CAD C880A C8942 C8A15 C8B0C C8C21 ...
OBJ_36E20:
        :: OBJ_36D99 DUP TYPERARRY? NOTcase SETTYPEERR * 36E20
        ;                                        * 36E3E

* refs (12): B5DDF B5EA9 C7C07 C814E C8FBB C90A7 ...
OBJ_36E43:
        :: OBJ_36E93 OBJ_36D99 OBJ_36E75 ;       * 36E43

* refs (3): 36D67 C7A7F C7F91
OBJ_36E5C:
        :: SAFE@_HERE DROP OBJ_36E75 ;           * 36E5C

* refs (2): 36E52 36E6B
OBJ_36E75:
        :: DUP TYPERARRY? ?SEMI                  * 36E75
          OBJ_36DF8 ;                            * 36E89

* refs (2): 36DD0 36E48
OBJ_36E93:
        :: dup;RclInVars(gn)? case SWAPDROP      * 36E93
          %0_2A2B4 DUPROT OBJ_36EE3 ;            * 36EA7

* refs (28): 36D4E C8253 C8296 C82E9 C8350 C83A3 ...
OBJ_36EBB:
        :: dup;RclInVars(gn)? IT                 * 36EBB
          :: ROT Unbr>U SWAP ;                   * 36ECA

* refs (11): 36D8F 36EB1 C8932 C8A05 C8AFC C8C11 ...
OBJ_36EE3:
          :: PTR DoHere: STO ; ;                 * 36EE3

* refs (3): C7A8E C7D77 C7FA0
OBJ_36EFC:
        :: 4UNROLL OBJ_36F24 3UNROLL 4ROLL OBJ_36F24 ROTROT2DROP ; * 36EFC

* refs (2): 36F06 36F15
OBJ_36F24:
        :: DUP#0= casedrop OVER                  * 36F24
          OVER TYPEREAL? casedrop DUP            * 36F38
          PULLEL ;                               * 36F4C

* refs (4): C90C0 CA655 CA6F2 CA7A9
OBJ_36F56:
        :: OBJ_3798C case %%ABS                  * 36F56
          OBJ_7D7A9 ;                            * 36F6A

* refs (5): CC059 CC0D3 CC202 CC295 CC569
OBJ_36F74:
        :: OBJ_35AEE NOP r->c(ar) OBJ_36F97 NOP ; * 36F74

* refs (1): 36F88
OBJ_36F97:
        :: SWAP r->c(ar) SWAP ;                  * 36F97

* refs (12): 904F8 905A2 90778 90BBB 9100E 92CF0 ...
OBJ_36FB0:
        CON(5)  (*)+5                            * 36FB0  primitive code object
        ASSEMBLE
        GOSUB   SUB_376BA                        * 36FB5
        A=A+C   A                                * 36FB9
L_36FBB:
        A=A+1   A                                * 36FBB
L_36FBD:
        GOVLNG  Push#Loop                        * 36FBD

* refs (23): 7D274 90DCD 90E3B 90F28 910AE 91AD6 ...
OBJ_36FC4:
        CON(5)  (*)+5                            * 36FC4  primitive code object
        GOSUB   SUB_376BA                        * 36FC9
        A=A-C   A                                * 36FCD
L_36FCF:
        A=A-1   A                                * 36FCF
        GOTO    L_36FBD                          * 36FD1
        BSS     6                                * 36FD5

* refs (9): 7D0E9 90280 933E6 93445 936A7 93960 ...
OBJ_36FDB:
        CON(5)  (*)+5                            * 36FDB  primitive code object
        A=DAT1  A                                * 36FE0
        D1=D1+  5                                * 36FE3
        D=D+1   A                                * 36FE6
        GOSUB   SUB_376AC                        * 36FE8
        C=DAT1  A                                * 36FEC
        D0=C                                     * 36FEF
        D0=D0+  5                                * 36FF2
        C=DAT0  A                                * 36FF5
        C=C-1   A                                * 36FF8
        A=A+C   A                                * 36FFA
        C=C+C   A                                * 36FFC
        A=A+C   A                                * 36FFE
        D0=A                                     * 37000
        D0=D0+  10                               * 37003
        A=0     A                                * 37006
        A=DAT0  X                                * 37008
        R0=A                                     * 3700C
        GOTO    L_377D6                          * 3700F

* refs (7): 7CF1D 93233 9334B 934B3 936CA 93C9B ...
OBJ_37013:
        CON(5)  (*)+5                            * 37013  primitive code object
        CD0EX                                    * 37018
        RSTK=C                                   * 3701B
        C=DAT1  A                                * 3701D
        D1=D1+  5                                * 37020
        D=D+1   A                                * 37023
        RSTK=C                                   * 37025
        C=DAT1  A                                * 37027
        D0=C                                     * 3702A
        D0=D0+  5                                * 3702D
        C=DAT0  A                                * 37030
        R0=C                                     * 37033
        D1=D1+  5                                * 37036
        C=DAT1  A                                * 37039
        D1=D1-  5                                * 3703C
        D0=C                                     * 3703F
        D0=D0+  5                                * 37042
        A=DAT0  A                                * 37045
        C=RSTK                                   * 37048
        A=A-1   A                                * 3704A
        C=C+A   A                                * 3704C
        A=A+A   A                                * 3704E
        C=C+A   A                                * 37050
        D0=C                                     * 37052
        D0=D0+  10                               * 37055
        A=R0                                     * 37058
        DAT0=A  X                                * 3705B
        C=RSTK                                   * 3705F
        D0=C                                     * 37061
        A=DAT0  A                                * 37064
        D0=D0+  5                                * 37067
        PC=(A)                                   * 3706A

* refs (10): C8814 C894C C8A1F C8B16 C8C2B C8D4A ...
OBJ_3706E:
        CON(5)  (*)+5                            * 3706E  primitive code object
        A=DAT1  A                                * 37073
        D1=D1+  5                                * 37076
        D=D+1   A                                * 37079
        GOSUB   SUB_376AC                        * 3707B
        D0=A                                     * 3707F
        C=DAT1  A                                * 37082
        D1=C                                     * 37085
        D1=D1+  15                               * 37088
        A=DAT1  A                                * 3708B
        A=A-1   A                                * 3708E
        ?A#0    A                                * 37090
        GOYES   L_370AD                          * 37093
        D1=D1+  5                                * 37095
        A=DAT1  A                                * 37098
        D0=D0+  15                               * 3709B
        D0=D0+  5                                * 3709E
        C=DAT0  A                                * 370A1
        ?C#A    A                                * 370A4
        GOYES   L_370AD                          * 370A7
        GOTO    L_37501                          * 370A9
L_370AD:
        GOSBVL  GETPTR                           * 370AD

* refs (1): CAEBE
SUB_370B4:
        LC(5)   doerr501                         * 370B4
        A=C     A                                * 370BB
        PC=(A)                                   * 370BD

* refs (25): C889D C891D C89C2 C89F0 C8A95 C8AE7 ...
OBJ_370C1:
        CON(5)  (*)+5                            * 370C1  primitive code object
        C=DAT1  A                                * 370C6
        CD1EX                                    * 370C9
        D1=D1+  10                               * 370CC
        A=DAT1  W                                * 370CF
        R1=A                                     * 370D3
        D1=D1-  5                                * 370D6
        A=DAT1  A                                * 370D9
        R0=A                                     * 370DC
        D1=C                                     * 370DF
        D1=D1+  5                                * 370E2
        D=D+1   A                                * 370E5
        GOSUB   SUB_376AC                        * 370E7
        C=DAT1  A                                * 370EB
        D1=C                                     * 370EE
        D1=D1+  15                               * 370F1
        A=DAT1  A                                * 370F4
        D1=D1+  5                                * 370F7
        C=DAT1  A                                * 370FA
        A=A-1   A                                * 370FD
        ?A=0    A                                * 370FF
        GOYES   L_37115                          * 37102
        D1=D1+  5                                * 37104
        D=C     A                                * 37107
        C=DAT1  A                                * 37109
        GOSBVL  L_35790                          * 3710C
        C=B     A                                * 37113
L_37115:
        C=C-1   A                                * 37115
        R4=C                                     * 37117
        D1=D1+  5                                * 3711A
L_3711D:
        SETDEC                                   * 3711D
        D1=D1+  5                                * 3711F
        A=DAT1  W                                * 37122
        ?A=0    W                                * 37126
        GOYES   L_37151                          * 37129
        B=A     W                                * 3712B
        B=0     S                                * 3712E
        D1=D1-  5                                * 37131
        A=DAT1  A                                * 37134
        GOSBVL  RCCD0                            * 37137
        GOSUB   SUB_372D2                        * 3713E
        DAT1=A  A                                * 37142
        D1=D1+  5                                * 37145
        P=      14                               * 37148
        A=B     WP                               * 3714A
        DAT1=A  W                                * 3714D
L_37151:
        D1=D1+  16                               * 37151
        SETHEX                                   * 37154
        C=R4                                     * 37156
        C=C-1   A                                * 37159
        R4=C                                     * 3715B
        GONC    L_3711D                          * 3715E
        P=      0                                * 37161
        GOTO    L_37501                          * 37163

* refs (34): C89E6 C8AB9 C8ADD C8B9B C8BE8 C8BF2 ...
OBJ_37167:
        CON(5)  (*)+5                            * 37167  primitive code object
        C=DAT1  A                                * 3716C
        CD1EX                                    * 3716F
        D1=D1+  10                               * 37172
        A=DAT1  W                                * 37175
        R1=A                                     * 37179
        D1=D1-  5                                * 3717C
        A=DAT1  A                                * 3717F
        R0=A                                     * 37182
        D1=C                                     * 37185
        D1=D1+  10                               * 37188
        D=D+1   A                                * 3718B
        D=D+1   A                                * 3718D
        GOSUB   SUB_376AC                        * 3718F
        D1=D1-  5                                * 37193
        C=DAT1  A                                * 37196
        D0=C                                     * 37199
        D1=D1+  5                                * 3719C
        C=DAT1  A                                * 3719F
        D1=C                                     * 371A2
        D1=D1+  15                               * 371A5
        D1=D1+  5                                * 371A8
        C=DAT1  A                                * 371AB
        C=C-1   A                                * 371AE
        R4=C                                     * 371B0
        D1=D1+  5                                * 371B3
        D0=D0+  15                               * 371B6
        D0=D0+  10                               * 371B9
        CD0EX                                    * 371BC
        RSTK=C                                   * 371BF
L_371C1:
        C=RSTK                                   * 371C1
        D0=C                                     * 371C3
        GOSBVL  GETAB0                           * 371C6
        CD0EX                                    * 371CD
        RSTK=C                                   * 371D0
        D1=D1+  5                                * 371D2
        ?B=0    W                                * 371D5
        GOYES   L_3720D                          * 371D8
        SETDEC                                   * 371DA
        GOSBVL  RCCD0                            * 371DC
        GOSUB   SUB_372D2                        * 371E3
        C=DAT1  W                                * 371E7
        D=C     W                                * 371EB
        D=0     S                                * 371EE
        D1=D1-  5                                * 371F1
        C=DAT1  A                                * 371F4
        GOSBVL  RADDF                            * 371F7
        DAT1=A  A                                * 371FE
        D1=D1+  5                                * 37201
        P=      14                               * 37204
        A=B     WP                               * 37206
        DAT1=A  W                                * 37209
L_3720D:
        D1=D1+  16                               * 3720D
        SETHEX                                   * 37210
        C=R4                                     * 37212
        C=C-1   A                                * 37215
        R4=C                                     * 37217
        GONC    L_371C1                          * 3721A
        P=      0                                * 3721D
        GOTO    L_37501                          * 3721F

* refs (4): C845C C8B34 C98EB C9E28
OBJ_37223:
        CON(5)  (*)+5                            * 37223  primitive code object
        GOSBVL  SUB_2A0B1                        * 37228
        HST=0   3                                * 3722F
L_37232:
        GOSBVL  RADDF                            * 37232
        GOSBVL  SUB_29F76                        * 37239
        GOVLNG  PUSH%LOOP                        * 37240

* refs (17): C8243 C8286 C82D9 C8340 C8393 C841E ...
OBJ_37247:
        CON(5)  (*)+5                            * 37247  primitive code object
        GOSBVL  SUB_2A0B1                        * 3724C
        HST=0   3                                * 37253
        GOSUB   SUB_372D2                        * 37256
        GOSBVL  STAB0                            * 3725A
        P=      0                                * 37261
        SETHEX                                   * 37263
        GOSBVL  GETPTR                           * 37265
        GOSBVL  POP1%SPLITA                      * 3726C
        GOSBVL  RCCD0                            * 37273
        GOTO    L_37232                          * 3727A

* refs (39): 911E4 9133D 9134C 9136F 9138D 913B0 ...
OBJ_3727E:
        CON(5)  (*)+5                            * 3727E  primitive code object
        GOSBVL  SUB_2A0B1                        * 37283
        HST=0   3                                * 3728A
L_3728D:
        GOSUB   SUB_372D2                        * 3728D
        GOSBVL  STAB0                            * 37291
        P=      0                                * 37298
        SETHEX                                   * 3729A
        GOSBVL  GETPTR                           * 3729C
        GOSBVL  SUB_2A060                        * 372A3
        GOSBVL  RCCD0                            * 372AA
L_372B1:
        GOSBVL  RADDF                            * 372B1
        GOTO    L_37915                          * 372B8

* refs (21): 2CA8A 91DDD 91E1E 91E5F 91EA0 92067 ...
OBJ_372BC:
        CON(5)  (*)+5                            * 372BC  primitive code object
        GOSBVL  SUB_2A0B1                        * 372C1
        HST=0   3                                * 372C8
        A=-A-1  S                                * 372CB
        GOTO    L_3728D                          * 372CE

* refs (4): 3713E 371E3 37256 3728D
SUB_372D2:
        GOVLNG  MULTF                            * 372D2
L_372D9:
        GOSBVL  MOVEDOWN                         * 372D9
        GOTO    L_37501                          * 372E0
L_372E4:
        GOSBVL  MOVEUP                           * 372E4
        GOTO    L_37501                          * 372EB

* refs (226): 7CE7D 7CFFE 7D080 7D17F 7D242 9004C ...
OBJ_372EF:
        CON(5)  (*)+5                            * 372EF  primitive code object
        GOSBVL  POP#                             * 372F4
        A=A-1   A                                * 372FB
        GOSUB   SUB_376AC                        * 372FD
        C=DAT1  A                                * 37301
        D1=C                                     * 37304
        D1=D1+  10                               * 37307
        C=DAT1  A                                * 3730A
        D=C     A                                * 3730D
        ST=0    1                                * 3730F
        LC(5)   DOEREL                           * 37312
        ?D=C    A                                * 37319
        GOYES   L_37323                          * 3731C
        ST=1    1                                * 3731E
        A=A+A   A                                * 37321
L_37323:
        D1=D1+  5                                * 37323
        C=DAT1  B                                * 37326
        D1=D1+  10                               * 37329
        C=C-1   B                                * 3732C
        ?C=0    B                                * 3732F
        GOYES   L_37337                          * 37332
        D1=D1+  5                                * 37334
L_37337:
        GOSUB   SUB_3768C                        * 37337
        CD1EX                                    * 3733B
        C=C+A   A                                * 3733E
        D1=C                                     * 37340
        GOSBVL  GETAB1                           * 37343
        ?ST=1   1                                * 3734A
        GOYES   L_37353                          * 3734D
        GOTO    L_37915                          * 3734F
L_37353:
        GOSBVL  Get1%CD                          * 37353
        GOVLNG  L_51BA2                          * 3735A

* refs (163): 7D030 7D094 7D19D 7D256 90340 9058E ...
OBJ_37361:
        CON(5)  (*)+5                            * 37361  primitive code object
        GOSBVL  POP#                             * 37366
        A=A-1   A                                * 3736D
        D1=D1+  5                                * 3736F
        D=D+1   A                                * 37372
        GOSUB   SUB_376AC                        * 37374
        D1=D1-  5                                * 37378
        C=DAT1  A                                * 3737B
        D0=C                                     * 3737E
        C=DAT0  A                                * 37381
        D=C     A                                * 37384
        ST=0    1                                * 37386
        LC(5)   DOEREL                           * 37389
        ?D=C    A                                * 37390
        GOYES   L_37398                          * 37393
        ST=1    1                                * 37395
L_37398:
        D1=D1+  5                                * 37398
        C=DAT1  A                                * 3739B
        D1=C                                     * 3739E
        D1=D1+  10                               * 373A1
        C=DAT1  A                                * 373A4
        D=C     A                                * 373A7
        ST=0    0                                * 373A9
        LC(5)   DOEREL                           * 373AC
        ?D=C    A                                * 373B3
        GOYES   L_373BD                          * 373B6
        ST=1    0                                * 373B8
        A=A+A   A                                * 373BB
L_373BD:
        D1=D1+  5                                * 373BD
        C=DAT1  B                                * 373C0
        D1=D1+  10                               * 373C3
        C=C-1   B                                * 373C6
        ?C=0    B                                * 373C9
        GOYES   L_373D1                          * 373CC
        D1=D1+  5                                * 373CE
L_373D1:
        GOSUB   SUB_3768C                        * 373D1
        CD1EX                                    * 373D5
        C=C+A   A                                * 373D8
        D1=C                                     * 373DA
        D0=D0+  5                                * 373DD
        GOSBVL  SUB_7D89B                        * 373E0
        GOSBVL  PutAB%1                          * 373E7
        ?ST=0   0                                * 373EE
        GOYES   L_3740C                          * 373F1
        A=0     W                                * 373F3
        B=0     W                                * 373F6
        ?ST=0   1                                * 373F9
        GOYES   L_37405                          * 373FC
        GOSBVL  SUB_7D89B                        * 373FE
L_37405:
        GOSBVL  PutAB%1                          * 37405
L_3740C:
        SETHEX                                   * 3740C
        GOTO    L_37501                          * 3740E

* refs (2): 37450 54248
SUB_37412:
        C=C-CON A,5                              * 37412
        D0=D0+  5                                * 37418
        DAT0=C  A                                * 3741B
        D0=D0-  5                                * 3741E
        LC(5)   DOHSTR                           * 37421
        DAT0=C  A                                * 37428
        RTNCC                                    * 3742B

* #nibs -> hxs
* refs (7): 7CECD 87062 88389 93189 93C2D 986FE ...
!MAKEHXS:
        CON(5)  (*)+5                            * 3742D  primitive code object
        GOSUB   SUB_376AC                        * 37432
        C=DAT1  A                                * 37436
        D1=C                                     * 37439
        D1=D1+  5                                * 3743C
        A=DAT1  A                                * 3743F
        C=0     A                                * 37442
        LC(1)   #A                               * 37444
        C=C+A   A                                * 37447
        GOSBVL  GETTEMP                          * 37449
        GOSUB   SUB_37412                        * 37450
        AD0EX                                    * 37454
        GOVLNG  GPOverWrALp                      * 37457

* [] #m #n -> []' #m #n
* refs (4): 9396F 97E89 CBC09 CBC87
SWAPROWS:
        CON(5)  (*)+5                            * 3745E  primitive code object
        GOSUB   SUB_376AC                        * 37463
        GOSUB   SUB_376BA                        * 37467
        RSTK=C                                   * 3746B
        C=A     A                                * 3746D
        D=C     A                                * 3746F
        C=DAT1  A                                * 37471
        D1=C                                     * 37474
        D1=D1+  10                               * 37477
        A=DAT1  A                                * 3747A
        ST=0    0                                * 3747D
        LC(5)   DOREAL                           * 37480
        ?C=A    A                                * 37487
        GOYES   L_3748F                          * 3748A
        ST=1    0                                * 3748C
L_3748F:
        D1=D1+  5                                * 3748F
        C=DAT1  A                                * 37492
        A=C     A                                * 37495
        D1=D1+  10                               * 37497
        C=C-1   A                                * 3749A
        ?C=0    A                                * 3749C
        GOYES   L_374A7                          * 3749F
        A=DAT1  A                                * 374A1
        D1=D1+  5                                * 374A4
L_374A7:
        C=A     A                                * 374A7
        D=D-1   A                                * 374A9
        GOSUB   SUB_376B3                        * 374AB
        CD1EX                                    * 374AF
        D0=C                                     * 374B2
        BSL     A                                * 374B5
        ?ST=0   0                                * 374B7
        GOYES   L_374BE                          * 374BA
        B=B+B   A                                * 374BC
L_374BE:
        C=C+B   A                                * 374BE
        D1=C                                     * 374C0
        C=RSTK                                   * 374C3
        C=C-1   A                                * 374C5
        D=C     A                                * 374C7
        C=A     A                                * 374C9
        GOSUB   SUB_376B3                        * 374CB
        CD0EX                                    * 374CF
        BSL     A                                * 374D2
        ?ST=0   0                                * 374D4
        GOYES   L_374DD                          * 374D7
        B=B+B   A                                * 374D9
        A=A+A   A                                * 374DB
L_374DD:
        C=C+B   A                                * 374DD
        D0=C                                     * 374DF
        B=A     A                                * 374E2
        B=B-1   A                                * 374E4
L_374E6:
        A=DAT0  W                                * 374E6
        C=DAT1  W                                * 374EA
        DAT0=C  W                                * 374EE
        DAT1=A  W                                * 374F2
        D0=D0+  16                               * 374F6
        D1=D1+  16                               * 374F9
        B=B-1   A                                * 374FC
        GONC    L_374E6                          * 374FE
L_37501:
        GOVLNG  GETPTRLOOP                       * 37501

* [] #m #n -> []' #m #n
* refs (8): 7CF31 7D0F8 93247 9335F 933F5 93454 ...
SWAPCOLUMNS:
        CON(5)  (*)+5                            * 37508  primitive code object
        GOSUB   SUB_376AC                        * 3750D
        GOSUB   SUB_376BA                        * 37511
        RSTK=C                                   * 37515
        C=A     A                                * 37517
        D=C     A                                * 37519
        C=DAT1  A                                * 3751B
        D1=C                                     * 3751E
        D1=D1+  10                               * 37521
        A=DAT1  A                                * 37524
        ST=0    0                                * 37527
        LC(5)   DOEREL                           * 3752A
        ?C=A    A                                * 37531
        GOYES   L_37539                          * 37534
        ST=1    0                                * 37536
L_37539:
        D1=D1+  5                                * 37539
        C=DAT1  A                                * 3753C
        A=C     A                                * 3753F
        D1=D1+  10                               * 37541
        C=C-1   A                                * 37544
        ?C=0    A                                * 37546
        GOYES   L_37551                          * 37549
        A=DAT1  A                                * 3754B
        D1=D1+  5                                * 3754E
L_37551:
        C=A     A                                * 37551
        D=D-1   A                                * 37553
        GOSUB   SUB_376B3                        * 37555
        GOSUB   SUB_3767E                        * 37559
        ?ST=0   0                                * 3755D
        GOYES   L_37564                          * 37560
        B=B+B   A                                * 37562
L_37564:
        CD1EX                                    * 37564
        D0=C                                     * 37567
        C=C+B   A                                * 3756A
        D1=C                                     * 3756C
        C=RSTK                                   * 3756F
        C=C-1   A                                * 37571
        D=C     A                                * 37573
        C=A     A                                * 37575
        GOSUB   SUB_376B3                        * 37577
        GOSUB   SUB_3767E                        * 3757B
        ?ST=0   0                                * 3757F
        GOYES   L_37588                          * 37582
        B=B+B   A                                * 37584
        A=A+A   A                                * 37586
L_37588:
        CD0EX                                    * 37588
        C=C+B   A                                * 3758B
        D0=C                                     * 3758D
        B=A     A                                * 37590
        B=B-1   A                                * 37592
L_37594:
        GOSUB   SUB_3765A                        * 37594
        D0=D0+  16                               * 37598
        D1=D1+  16                               * 3759B
        B=B-1   A                                * 3759E
        GONC    L_37594                          * 375A0
        GOTO    L_37501                          * 375A3

* refs (5): 9324C 93364 93DF8 977F9 983A3
OBJ_375A7:
        CON(5)  (*)+5                            * 375A7  primitive code object
        GOSUB   SUB_376AC                        * 375AC
        GOSUB   SUB_376BA                        * 375B0
        B=C     A                                * 375B4
        C=DAT1  A                                * 375B6
        D1=C                                     * 375B9
        D1=D1+  10                               * 375BC
        C=DAT1  A                                * 375BF
        D=C     A                                * 375C2
        ST=0    0                                * 375C4
        LC(5)   DOEREL                           * 375C7
        ?D=C    A                                * 375CE
        GOYES   L_375D6                          * 375D1
        ST=1    0                                * 375D3
L_375D6:
        D1=D1+  10                               * 375D6
        C=DAT1  A                                * 375D9
        R0=C                                     * 375DC
        D1=D1+  5                                * 375DF
        C=DAT1  A                                * 375E2
        D=C     A                                * 375E5
        D1=D1+  5                                * 375E7
        B=B-1   A                                * 375EA
        A=A-1   A                                * 375EC
        GOSUB   SUB_3767E                        * 375EE
        GOSUB   SUB_3768C                        * 375F2
        GOSUB   SUB_3769E                        * 375F6
        ?ST=0   0                                * 375FA
        GOYES   L_37605                          * 375FD
        A=A+A   A                                * 375FF
        B=B+B   A                                * 37601
        D=D+D   A                                * 37603
L_37605:
        C=R0                                     * 37605
        BCEX    A                                * 37608
        AD1EX                                    * 3760A
        C=C+A   A                                * 3760D
        D0=C                                     * 3760F
        CD1EX                                    * 37612
        C=C+A   A                                * 37615
        D1=C                                     * 37617
        B=B-1   A                                * 3761A
L_3761C:
        GOSUB   SUB_3765A                        * 3761C
        ?ST=0   0                                * 37620
        GOYES   L_3763B                          * 37623
        D0=D0+  16                               * 37625
        D1=D1+  16                               * 37628
        GOSUB   SUB_3765A                        * 3762B
        D0=D0-  5                                * 3762F
        D1=D1-  5                                * 37632
        D0=D0-  16                               * 37635
        D1=D1-  16                               * 37638
L_3763B:
        D0=D0-  5                                * 3763B
        D1=D1-  5                                * 3763E
        CD1EX                                    * 37641
        C=C+D   A                                * 37644
        D1=C                                     * 37646
        CD0EX                                    * 37649
        C=C+D   A                                * 3764C
        D0=C                                     * 3764E
        B=B-1   A                                * 37651
        GONC    L_3761C                          * 37653
        GOTO    L_37501                          * 37656

* refs (3): 37594 3761C 3762B
SUB_3765A:
        A=DAT0  A                                * 3765A
        C=DAT1  A                                * 3765D
        DAT0=C  A                                * 37660
        DAT1=A  A                                * 37663
        D0=D0+  5                                * 37666
        D1=D1+  5                                * 37669
        A=DAT0  W                                * 3766C
        C=DAT1  W                                * 37670
        DAT0=C  W                                * 37674
        DAT1=A  W                                * 37678
        RTN                                      * 3767C

* refs (7): 37559 3757B 375EE 3772C 7CC78 7D436 ...
SUB_3767E:
        C=B     A                                * 3767E
        BSL     A                                * 37680
        B=B+C   A                                * 37682
        C=C+C   A                                * 37684
        C=C+C   A                                * 37686
        B=B+C   A                                * 37688
        RTN                                      * 3768A

* refs (7): 37337 373D1 375F2 37730 7CC71 7D2D4 ...
SUB_3768C:
        C=A     A                                * 3768C
        ASL     A                                * 3768E
        A=A+C   A                                * 37690
        C=C+C   A                                * 37692
        C=C+C   A                                * 37694
        A=A+C   A                                * 37696
        RTN                                      * 37698

* refs (5): 87A31 87DDD 87E20 CAFA1 CB002
SUB_3769A:
        C=C+C   A                                * 3769A

* refs (3): 8903F 89412 89455
SUB_3769C:
        D=C     A                                * 3769C

* refs (1): 375F6
SUB_3769E:
        C=D     A                                * 3769E
        DSL     A                                * 376A0
        D=D+C   A                                * 376A2
        C=C+C   A                                * 376A4
        C=C+C   A                                * 376A6
        D=D+C   A                                * 376A8
        RTN                                      * 376AA

* refs (13): 35D76 36FE8 3707B 370E7 3718F 372FD ...
SUB_376AC:
        GOVLNG  SAVPTR                           * 376AC

* refs (5): 374AB 374CB 37555 37577 37721
SUB_376B3:
        GOVLNG  L_35790                          * 376B3

* refs (5): 36FB5 36FC9 37467 37511 375B0
SUB_376BA:
        GOVLNG  POP2#                            * 376BA

* refs (2): 7CF13 987C1
OBJ_376C1:
        CON(5)  (*)+5                            * 376C1  primitive code object
        GOSBVL  POP#                             * 376C6
        R1=A                                     * 376CD
        GOSUB   SUB_376AC                        * 376D0
        C=DAT1  A                                * 376D4
        D0=C                                     * 376D7
        D0=D0+  5                                * 376DA
        C=DAT0  A                                * 376DD
        R0=C                                     * 376E0
        D1=D1+  5                                * 376E3
        C=DAT1  A                                * 376E6
        D1=C                                     * 376E9
        D1=D1+  10                               * 376EC
        A=DAT1  A                                * 376EF
        ST=0    0                                * 376F2
        LC(5)   DOEREL                           * 376F5
        ?C=A    A                                * 376FC
        GOYES   L_37704                          * 376FF
        ST=1    0                                * 37701
L_37704:
        D1=D1+  10                               * 37704
        C=DAT1  A                                * 37707
        R4=C                                     * 3770A
        D1=D1+  5                                * 3770D
        C=DAT1  A                                * 37710
        A=C     A                                * 37713
        D=C     A                                * 37715
        D1=D1+  5                                * 37717
        C=R0                                     * 3771A
        RSTK=C                                   * 3771D
        C=C-1   A                                * 3771F
        GOSUB   SUB_376B3                        * 37721
        C=R1                                     * 37725
        B=B+C   A                                * 37728
        B=B-1   A                                * 3772A
        GOSUB   SUB_3767E                        * 3772C
        GOSUB   SUB_3768C                        * 37730
        ?ST=0   0                                * 37734
        GOYES   L_3773D                          * 37737
        B=B+B   A                                * 37739
        A=A+A   A                                * 3773B
L_3773D:
        CD1EX                                    * 3773D
        C=C+B   A                                * 37740
        D1=C                                     * 37742
        R1=A                                     * 37745
        A=0     W                                * 37748
        R2=A                                     * 3774B
        R3=A                                     * 3774E
        ST=0    1                                * 37751
L_37754:
        SETDEC                                   * 37754
        D1=D1+  5                                * 37756
        A=DAT1  W                                * 37759
        A=0     S                                * 3775D
        B=A     W                                * 37760
        D1=D1-  5                                * 37763
        A=DAT1  A                                * 37766
        ?ST=0   0                                * 37769
        GOYES   L_37791                          * 3776C
        D1=D1+  16                               * 3776E
        D1=D1+  10                               * 37771
        C=DAT1  W                                * 37774
        C=0     S                                * 37778
        D=C     W                                * 3777B
        D1=D1-  5                                * 3777E
        C=DAT1  A                                * 37781
        D1=D1-  5                                * 37784
        D1=D1-  16                               * 37787
        GOSBVL  RADDF                            * 3778A
L_37791:
        GOSBVL  SUB_2BF81                        * 37791
        GOSBVL  RCAB2                            * 37798
        P=      6                                * 3779F
        GOSBVL  TST15                            * 377A1
        GOC     L_377B9                          * 377A8
        GOSBVL  STCD2                            * 377AB
        C=RSTK                                   * 377B2
        RSTK=C                                   * 377B4
        R0=C                                     * 377B6
L_377B9:
        SETHEX                                   * 377B9
        P=      0                                * 377BB
        A=R1                                     * 377BD
        CD1EX                                    * 377C0
        C=C+A   A                                * 377C3
        D1=C                                     * 377C5
        C=RSTK                                   * 377C8
        C=C+1   A                                * 377CA
        RSTK=C                                   * 377CC
        A=R4                                     * 377CE
        ?C<=A   A                                * 377D1
        GOYES   L_37754                          * 377D4
L_377D6:
        GOVLNG  PUSH#LOOP                        * 377D6

* refs (1): 7CF8B
OBJ_377DD:
        CON(5)  (*)+5                            * 377DD  primitive code object
        GOSBVL  POP#                             * 377E2
        R4=A                                     * 377E9
        C=DAT1  A                                * 377EC
        CD1EX                                    * 377EF
        A=DAT1  A                                * 377F2
        D1=(5)  DOEREL                           * 377F5
        CD1EX                                    * 377FC
        ?C#A    A                                * 377FF
        GOYES   L_37812                          * 37802
        ST=0    0                                * 37804
        GOSBVL  SUB_2A060                        * 37807
        GOTO    L_37823                          * 3780E
L_37812:
        ST=1    0                                * 37812
        GOSBVL  POPC%%                           * 37815
        GOSBVL  STCD2                            * 3781C
L_37823:
        SETHEX                                   * 37823
        LC(5)   #50000                           * 37825
        ?C<=A   A                                * 3782C
        GOYES   L_37869                          * 3782F
        LC(5)   #10000                           * 37831
        ?C<A    A                                * 37838
        GOYES   L_3788A                          * 3783B
L_3783D:
        ?ST=0   0                                * 3783D
        GOYES   L_3785E                          * 37840
        GOSBVL  RCCD2                            * 37842
        GOSBVL  PUSHC%%                          * 37849
L_37850:
        A=R4                                     * 37850
        R0=A                                     * 37853
        GOSUB   SUB_376AC                        * 37856
        GOTO    L_377D6                          * 3785A
L_3785E:
        GOSBVL  SUB_2A24B                        * 3785E
        GOTO    L_37850                          * 37865
L_37869:
        LC(5)   HARDRAMEND                       * 37869
        ?C<=A   A                                * 37870
        GOYES   L_3783D                          * 37873
        LC(5)   #10000                           * 37875
        A=A+C   A                                * 3787C
        C=R4                                     * 3787E
        C=C-1   A                                * 37881
        R4=C                                     * 37883
        GOTO    L_3783D                          * 37886
L_3788A:
        A=A-C   A                                * 3788A
        C=R4                                     * 3788C
        C=C+1   A                                * 3788F
        R4=C                                     * 37891
        GOTO    L_3783D                          * 37894

* refs (1): 97F26
OBJ_37898:
        CON(5)  (*)+5                            * 37898  primitive code object
        GOSBVL  POP#                             * 3789D
        ?A#0    A                                * 378A4
        GOYES   L_378AD                          * 378A7
        GOTO    L_3791C                          * 378A9
L_378AD:
        R4=A                                     * 378AD
        C=DAT1  A                                * 378B0
        CD1EX                                    * 378B3
        A=DAT1  A                                * 378B6
        D1=(5)  DOEREL                           * 378B9
        CD1EX                                    * 378C0
        ?C#A    A                                * 378C3
        GOYES   L_378D6                          * 378C6
        ST=0    0                                * 378C8
        GOSBVL  SUB_2A060                        * 378CB
        GOTO    L_378E7                          * 378D2
L_378D6:
        ST=1    0                                * 378D6
        GOSBVL  POPC%%                           * 378D9
        GOSBVL  STCD2                            * 378E0
L_378E7:
        SETHEX                                   * 378E7
        C=R4                                     * 378E9
        D=C     A                                * 378EC
        C=C+C   A                                * 378EE
        GOC     L_37934                          * 378F0
        LC(5)   #10000                           * 378F3
L_378FA:
        SETDEC                                   * 378FA
        A=A+C   A                                * 378FC
        D=D-1   A                                * 378FE
        ?D=0    A                                * 37900
        GOYES   L_37910                          * 37903
        A=A+C   A                                * 37905
        D=D-1   A                                * 37907
        ?D=0    A                                * 37909
        GOYES   L_37910                          * 3790C
        A=A+C   A                                * 3790E
L_37910:
        ?ST=1   0                                * 37910
        GOYES   L_37926                          * 37913
L_37915:
        GOSBVL  SUB_2A24B                        * 37915
L_3791C:
        A=DAT0  A                                * 3791C
        D0=D0+  5                                * 3791F
        PC=(A)                                   * 37922
L_37926:
        GOSBVL  RCCD2                            * 37926
        GOVLNG  L_51BA2                          * 3792D
L_37934:
        D=-D    A                                * 37934
        LC(5)   HARDRAMEND                       * 37936
        GOTO    L_378FA                          * 3793D
        RPL

* refs (1): 7CF81
OBJ_37941:
        :: OBJ_3798C case %%*                    * 37941
          SWAP2C%%>%% 2DUP %%ANGLEDEG 3UNROLL %%SQR %%SQRT 4ROLL %%*UNROT * 37955
          %%+ %%>C%% ;                           * 3797D

* refs (14): 36F5B 37946 37A77 37AE5 37D3C 37D6E ...
OBJ_3798C:
        :: DUP TYPE TYPEEREL #= ;                * 3798C

* refs (8): 3635E 363C7 366F6 36B23 36BB6 36F83 ...
r->c(ar):
        :: DUP DIMLIMITS C%0 MAKEARRY '          * 379AA
          :: DROP %%0 %%>C% ; 3UNROLL DOARRYPRG2 ; * 379C8

* refs (10): 93A3F 93A9C 97DB2 CBE77 CBF8E CC139 ...
OBJ_379F0:
        :: TYPERARRY? case %0_2A2B4              * 379F0
          C%0 ;                                  * 37A04

* refs (3): 938FB 93A4E 97B02
OBJ_37A0E:
        :: prefix(ar) TYPEEREL #=case %%0        * 37A0E
          ((0,0)) ;                              * 37A27

* refs (1): 97DA8
OBJ_37A31:
        :: TYPERARRY? case %1                    * 37A31
          C%1 ;                                  * 37A45

* refs (5): 7CEE1 97A84 97B0C 97C21 98132
OBJ_37A4F:
        :: prefix(ar) TYPEEREL #=case %%1        * 37A4F
          C%%1 ;                                 * 37A68

* refs (1): 983DF
OBJ_37A72:
        :: OBJ_3798C case OBJ_37AC2              * 37A72
          DUP C%%0= case %%1                     * 37A86
          C%%>%% 2DUP%%R ROTOVER %%/ 3UNROLL %%/ %%>C%% ; * 37A9A

* refs (9): 37A81 91CFC 91D06 91D9C 91F8B 91F95 ...
OBJ_37AC2:
        :: %%0>= case %%1                        * 37AC2
          %%-1 ;                                 * 37AD6

* refs (5): 905F2 93E98 943D5 958CE 95AB3
dup;cc?:
        :: OBJ_3798C case TRUE                   * 37AE0
          C%%>%% %%0= ;                          * 37AF4

* refs (17): 7D1D4 7D283 9114E 924AC 9296B 967AE ...
OBJ_37B03:
        :: ROTDROP ROTDROP ;                     * 37B03

* -> {}
* refs (17): 49E48 6CC70 7CEEB B7447 B80C5 C797C ...
3NULLLAM{}:
        { NULLLAM NULLLAM NULLLAM }              * 37B17

* refs (14): 7CE23 7CE55 91D6A 91D79 91EB4 92E8F ...
OBJ_37B30:
        :: %%.5 %%* ;                            * 37B30

* ob -> ob'
* refs (37): 1DBB5 2FC27 30170 30A05 30D36 3238C ...
CKREF:
        :: INTEMNOTREF? ?SEMI                    * 37B44
          TOTEMPOB ;                             * 37B53

* refs (13): 35C22 35D62 35E04 35F67 3620F 36223 ...
FreeRefs:
        :: REFERENCED? NOT?SEMI                  * 37B5D
          TOTEMPOBADJ SWAPDROP ;                 * 37B6C

* refs (11): 35D3A 35D58 36AA9 36AD8 9311B 97922 ...
sqmat(ar)?:
        :: DUP MDIMS OBJ_37DE1 OVER#= OBJ_37DE1 ; * 37B7B

* refs (3): 36052 36133 361E2
idsize(2ar)?:
        :: OVER DIMLIMITS OVER DIMLIMITS EQUAL ?SEMI * 37B9E
          doerr501 ;                             * 37BC1

* [] -> []
* refs (10): 10C77 1D0B0 35C31 35C68 3606B 360CF ...
ONE_DO_ARRY:
        :: DUP ARSIZE COLA #1+_ONE_DO            * 37BCB
        ;                                        * 37BE4

* L% L% -> L%
* refs (39): 3611F 361D3 3675A 906EC 907FA 908E5 ...
L%+:
        :: SWITCH2FLOATS %%+ C%%C+R C%%R+C C%%C+C ; * 37BE9

* L% L% -> L%
* refs (28): 36282 36296 362B4 36692 36822 7D008 ...
L%-:
        :: SWITCH2FLOATS %%- C%%C-R C%%R-C C%%C-C ; * 37C0C

* L% L% -> L%
* refs (68): 362F0 36750 36813 3681D 90336 90656 ...
L%*:
        :: SWITCH2FLOATS %%* C%%C*R C%%R*C C%%C*C ; * 37C2F

* L% L% -> L%
* refs (51): 363F4 7D026 7D193 906A1 907AA 9089F ...
L%/:
        :: SWITCH2FLOATS %%/ C%%C/R C%%R/C C%%C/C ; * 37C52

* B% -> B%'
* refs (12): 369A3 7CE82 90051 90D41 93051 949C3 ...
B%ABS:
        :: SWITCHFLOATS %ABS C%ABS %%ABS C%%ABS ; * 37C75

* refs (14): 90C7E 90C97 90D87 92209 922F9 92D77 ...
OBJ_37C98:
        :: SWITCHFLOATS %ABS C%ABS %%ABS         * 37C98
          CODE                                   * 37CB1  19 nibbles
            GOSBVL  POPC%%                       * 37CBB
            A=0     S                            * 37CC2
            C=0     S                            * 37CC5
            GOLONG  L_372B1                      * 37CC8
          ENDCODE                                * 37CCE
        ;                                        * 37CCE

* B% -> B%'
* refs (8): 35E13 9224A 92704 94C9D 97C62 98150 ...
B%NEG:
        :: SWITCHFLOATS %CHS C%CHS %%CHS C%%CHS ; * 37CD3

* refs (13): 36430 52021 90C47 922CC 9288F 931ED ...
=0?(nb):
        :: SWITCHFLOATS %0= C%0= %%0= C%%0= ;    * 37CF6

* %  -> %% C% -> C%%
* refs (3): 36377 363D1 CB900
F%>L%:
        :: dup;r?:dq/sk %>%% C%>%% %%>C%% ;      * 37D19

* refs (13): 90615 915B8 915C2 92A4C 93ED4 94064 ...
OBJ_37D37:
        :: OBJ_3798C case                        * 37D37
          :: DUP %%* ;                           * 37D46
          C%%>%% %%SQR ;                         * 37D5A

* refs (9): 905D9 915D6 93E7F 9402D 94091 943BC ...
OBJ_37D69:
        :: OBJ_3798C ?SEMI                       * 37D69
          C%%>%% DROP ;                          * 37D78

* refs (25): 9066A 906CE 907D7 91676 916E9 916FD ...
OBJ_37D87:
        :: OBJ_3798C ?SEMI                       * 37D87
          C%%CONJ ;                              * 37D96

* refs (12): 7CE28 935BC 94C48 95018 95F25 96812 ...
OBJ_37DA0:
        :: 2DUP %%< NOT?SWAPDROP ;               * 37DA0

* -> {}
* refs (12): 0F887 1DC0A 640AF 7CED2 986EA B8723 ...
2NULLLAM{}:
        { NULLLAM NULLLAM }                      * 37DB9

* refs (28): 368CC 370B4 37BC1 37DEB 7CEBE 8830A ...
doerr501:
        :: # 501 ERROROUT                        * 37DCD

* refs (25): 1DD6A 364B7 36507 365CA 365ED 365FC ...
OBJ_37DE1:
          :: ?SEMI                               * 37DE1
L_37DEB:
            doerr501 ;                           * 37DEB
        ;                                        * 37DF5
        BSS     21                               * 37DFA

* [F%] {#n #m} -> [F%]'
* refs (19): 1D11B 1D170 8D8BE 8E277 8E2FB 8E4D1 ...
MATREDIM:
        :: SWAPCKREF SWAP OBJ_37E4B OBJ_37E73 ;  * 37E0F

* refs (3): 1D143 2C3D3 2C478
@rdm(ar,ls):
        :: OBJ_35C18 SWAP OBJ_37E4B OBJ_37E7F ;  * 37E2D

* refs (2): 37E1E 37E3C
OBJ_37E4B:
        :: OVERARSIZE SWAPDUP INNER#1= ?SKIP #*OVF * 37E4B
          SWAPINCOMP ;                           * 37E69

* refs (1): 37E23
OBJ_37E73:
        CON(5)  (*)+5                            * 37E73  primitive code object
        ASSEMBLE
        ST=0    7                                * 37E78
        GOTO    L_37EA2                          * 37E7B

* refs (1): 37E41
OBJ_37E7F:
        CON(5)  (*)+5                            * 37E7F  primitive code object
        ST=1    7                                * 37E84
        GOTO    L_37EA2                          * 37E87
L_37E8B:
        ?ST=0   8                                * 37E8B
        GOYES   L_37E94                          * 37E8E
        GOSUB   SUB_38327                        * 37E90
L_37E94:
        GOSBVL  GETPTR                           * 37E94
L_37E9B:
        GOVLNG  DOMEMERR                         * 37E9B
L_37EA2:
        GOSUB   SUB_38337                        * 37EA2
        ST=0    6                                * 37EA6
        A=A-1   A                                * 37EA9
        ?A=0    A                                * 37EAB
        GOYES   L_37EBA                          * 37EAE
        ST=1    6                                * 37EB0
        GOSUB   SUB_38337                        * 37EB3
        R4=A                                     * 37EB7
L_37EBA:
        GOSUB   SUB_38337                        * 37EBA
        R3=A                                     * 37EBE
        GOSUB   SUB_38337                        * 37EC1
        P=      4                                * 37EC5
        A=A-1   P                                * 37EC7
        P=      0                                * 37ECA
        GONC    L_37E9B                          * 37ECC
        ASL     A                                * 37ECF
        R2=A                                     * 37ED1
        GOSUB   SUB_38337                        * 37ED4
        ASL     A                                * 37ED8
        R1=A                                     * 37EDA
        GOSBVL  SAVPTR                           * 37EDD
        A=DAT1  A                                * 37EE4
        D1=A                                     * 37EE7
        D1=D1+  10                               * 37EEA
        A=DAT1  A                                * 37EED
        LC(5)   DOREAL                           * 37EF0
        ?C=A    A                                * 37EF7
        GOYES   L_37F0F                          * 37EFA
        A=R2                                     * 37EFC
        A=A+A   A                                * 37EFF
        GOC     L_37E94                          * 37F01
        R2=A                                     * 37F04
        A=R1                                     * 37F07
        A=A+A   A                                * 37F0A
        R1=A                                     * 37F0C
L_37F0F:
        ST=0    8                                * 37F0F
        D0=(5)  INITEN                           * 37F12
        C=DAT0  B                                * 37F19
        ?C=0    P                                * 37F1C
        GOYES   L_37F2A                          * 37F1F
        C=0     A                                * 37F21
        DAT0=C  1                                * 37F23
        ST=1    8                                * 37F27
L_37F2A:
        A=R2                                     * 37F2A
        LC(1)   #5                               * 37F2D
        ?ST=0   6                                * 37F30
        GOYES   L_37F38                          * 37F33
        A=C     P                                * 37F35
L_37F38:
        R2=A                                     * 37F38
        C=R1                                     * 37F3B
        D1=D1+  5                                * 37F3E
        C=DAT1  1                                * 37F41
        C=C-1   A                                * 37F45
        ?C=0    P                                * 37F47
        GOYES   L_37F4F                          * 37F4A
        LC(1)   #5                               * 37F4C
L_37F4F:
        ST=0    5                                * 37F4F
        C=C-A   A                                * 37F52
        R1=C                                     * 37F54
        GONC    L_37F73                          * 37F57
        C=-C    A                                * 37F5A
        GOSUB   SUB_3804D                        * 37F5C
        ST=1    5                                * 37F60
        GOSUB   SUB_3807A                        * 37F63
        A=R2                                     * 37F67
        C=R1                                     * 37F6A
        A=A+C   A                                * 37F6D
        GOTO    L_37F7B                          * 37F6F
L_37F73:
        A=0     P                                * 37F73
        ?C=0    A                                * 37F76
        GOYES   L_37FF3                          * 37F79
L_37F7B:
        ?C=0    P                                * 37F7B
        GOYES   L_37FE7                          * 37F7E
        B=A     A                                * 37F80
        D0=(5)  DSKTOP                           * 37F82
        C=DAT0  A                                * 37F89
        D0=C                                     * 37F8C
        C=DAT0  A                                * 37F8F
        D0=C                                     * 37F92
        D0=D0+  15                               * 37F95
        A=C     A                                * 37F98
        C=DAT0  A                                * 37F9A
L_37F9D:
        D0=D0+  5                                * 37F9D
        C=C-1   A                                * 37FA0
        GONC    L_37F9D                          * 37FA2
        C=0     A                                * 37FA5
        LC(1)   #A                               * 37FA7
        A=A+C   A                                * 37FAA
        A=A+C   A                                * 37FAC
        LC(1)   #5                               * 37FAE
        ?ST=0   6                                * 37FB1
        GOYES   L_37FB8                          * 37FB4
        C=C+C   A                                * 37FB6
L_37FB8:
        A=A+C   A                                * 37FB8
        CD0EX                                    * 37FBA
        ?C>A    A                                * 37FBD
        GOYES   L_37FD8                          * 37FC0
        A=A+B   A                                * 37FC2
        D1=A                                     * 37FC4
        C=C+B   A                                * 37FC7
        D0=C                                     * 37FC9
        C=B     A                                * 37FCC
        GOSBVL  MOVEUP                           * 37FCE
        GONC    L_37FE7                          * 37FD5
L_37FD8:
        D1=A                                     * 37FD8
        D0=C                                     * 37FDB
        C=B     A                                * 37FDE
        GOSBVL  MOVEDOWN                         * 37FE0
L_37FE7:
        ?ST=1   5                                * 37FE7
        GOYES   L_37FF3                          * 37FEA
        C=R1                                     * 37FEC
        GOSUB   SUB_3807A                        * 37FEF
L_37FF3:
        D0=(5)  DSKTOP                           * 37FF3
        A=DAT0  A                                * 37FFA
        D0=A                                     * 37FFD
