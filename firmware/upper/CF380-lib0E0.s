* HP 48GX ROM revision R, #CF380-#D1361: Library part 0E0
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~BRoutput ~BRbrowse ~BRStoC1 ~BRRclCurRow ~BRRclC1 BRinverse BRdone BRViewItem BRGetItem BRDispItems
* Follows on from the previous file (at #CF380 in the original ROM).
        ENDLENGTH                                * CF380

        CON(5)  DOLIB                            * CF380  library object
        LENGTH                                   * CF385  length, to #D1362
        CON(2)  0                                * CF38A  title length

LIB0E0:
        CON(3)  #0E0                             * CF38C  library number
        REL(5)  LIB0E0.hash                      * CF38F  hash table
        CON(5)  0                                * CF394  message table
        REL(5)  LIB0E0.link                      * CF399  link table
        CON(5)  0                                * CF39E  config
        RPL

* ROMPTR 0E0 000
* refs (1): CF38C
ROMP_0E0_000:
        :: ' LAM 'BR1 STO ;                      * CF3A3

* ROMPTR 0E0 001
* refs (1): CF38C
ROMP_0E0_001:
        :: ' LAM 'BR2 STO ;                      * CF3C6

* ROMPTR 0E0 002
* refs (1): CF38C
ROMP_0E0_002:
        :: ' LAM 'BR3 STO ;                      * CF3E9

* ROMPTR 0E0 003
* refs (1): CF38C
~BRStoC1:
        :: ' LAM 'BR5 STO ;                      * CF40C

* ROMPTR 0E0 004
* refs (1): CF38C
~BRbrowse~22:
        :: ' LAM 'BR6 STO ;                      * CF42F

* ROMPTR 0E0 005
* refs (1): CF38C
ROMP_0E0_005:
        :: ' LAM 'BR12 STO ;                     * CF452

* ROMPTR 0E0 006
* refs (1): CF38C
ROMP_0E0_006:
        :: ' LAM 'BR14 STO ;                     * CF477

* ROMPTR 0E0 007
* refs (1): CF38C
~BRbrowse~23:
        :: ' LAM 'BR16 STO ;                     * CF49C

* ROMPTR 0E0 008
* refs (1): CF38C
ROMP_0E0_008:
        :: ' LAM 'BR20 STO ;                     * CF4C1

* ROMPTR 0E0 009
* refs (1): CF38C
ROMP_0E0_009:
        :: ' LAM 'BR21 STO ;                     * CF4E6

* ROMPTR 0E0 00A
* refs (1): CF38C
ROMP_0E0_00A:
        :: ' LAM 'BR22 STO ;                     * CF50B

* ROMPTR 0E0 00B
* refs (1): CF38C
ROMP_0E0_00B:
        :: ' LAM 'BR24 STO ;                     * CF530

* ROMPTR 0E0 00C
* refs (1): CF38C
ROMP_0E0_00C:
        :: ' LAM 'BR25 STO ;                     * CF555

* ROMPTR 0E0 00D
* refs (1): CF38C
~BRbrowse~24:
        :: ' LAM 'BR26 STO ;                     * CF57A

* ROMPTR 0E0 00E
* refs (1): CF38C
ROMP_0E0_00E:
        :: ' LAM 'BR27 STO ;                     * CF59F

* ROMPTR 0E0 00F
* refs (1): CF38C
ROMP_0E0_00F:
        :: ' LAM 'BR28 STO ;                     * CF5C4

* ROMPTR 0E0 010
* refs (1): CF38C
~BRbrowse:
        :: CLCD10 UnLockAlpha ROMPTR 0E0 014 ROMPTR 0E0 045 * CF5E9  BRDispItems
          ROMPTR 0E0 049 ClrDAsOK RESOROMP ROMPTR 0E0 011 RESOROMP * CF60E  BRinverse
          ROMPTR 0E0 025 TrueTrue 5ROLL ONEFALSE' LAM 'BR20 'ERRJMP POLSetUI * CF633
          POLKeyUI ABND ClrDAsOK ;               * CF668

* ROMPTR 0E0 011
* refs (1): CF38C
~BRbrowse~1:
        :: DA3OK? ?SKIP                          * CF67C
          :: DispMenu SetDA3Valid ;              * CF68B
        ;                                        * CF69F

* ROMPTR 0E0 012
* refs (1): CF38C
~BRoutput:
        :: ROMPTR 0E0 016 ROMPTR 0E0 017 ;       * CF6A4  ~BRRclCurRow

* ROMPTR 0E0 013
* refs (1): CF38C
BRdone:
        :: SetKeysNS TRUE ROMPTR 0E0 008 ;       * CF6C4

* ROMPTR 0E0 014
* refs (1): CF38C
~BRbrowse~2:
        :: 8PICK LENCOMP BINT0 BINT9 NDUPN DROP  * CF6E3
          {                                      * CF706

* ROMPTR 0E0 015
* refs (1): CF38C
ROMP_0E0_015:
            LAM 'BR21                            * CF70B

* ROMPTR 0E0 016
* refs (1): CF38C
ROMP_0E0_016:
            LAM 'BR1                             * CF71C

* ROMPTR 0E0 017
* refs (1): CF38C
~BRRclCurRow:
            LAM 'BR3                             * CF72B

* ROMPTR 0E0 018
* refs (1): CF38C
~BRRclC1:
            LAM 'BR5                             * CF73A

* ROMPTR 0E0 019
* refs (1): CF38C
BRGetItem~1:
            LAM 'BR22                            * CF749

* ROMPTR 0E0 01A
* refs (1): CF38C
ROMP_0E0_01A:
            LAM 'BR27                            * CF75A

* ROMPTR 0E0 01B
* refs (1): CF38C
ROMP_0E0_01B:
            LAM 'BR28                            * CF76B

* ROMPTR 0E0 01C
* refs (1): CF38C
ROMP_0E0_01C:
            LAM 'BR2                             * CF77C

* ROMPTR 0E0 01D
* refs (1): CF38C
ROMP_0E0_01D:
            LAM 'BR6                             * CF78B

* ROMPTR 0E0 01E
* refs (1): CF38C
BRinverse~1:
            LAM 'BR12                            * CF79A

* ROMPTR 0E0 01F
* refs (1): CF38C
BRinverse~2:
            LAM 'BR14                            * CF7AB

* ROMPTR 0E0 020
* refs (1): CF38C
ROMP_0E0_020:
            LAM 'BR16                            * CF7BC

* ROMPTR 0E0 021
* refs (1): CF38C
ROMP_0E0_021:
            LAM 'BR20                            * CF7CD

* ROMPTR 0E0 022
* refs (1): CF38C
ROMP_0E0_022:
            LAM 'BR24                            * CF7DE

* ROMPTR 0E0 023
* refs (1): CF38C
ROMP_0E0_023:
            LAM 'BR25                            * CF7EF

* ROMPTR 0E0 024
* refs (1): CF38C
ROMP_0E0_024:
            LAM 'BR26 }                          * CF800
          BIND DUPNULL$? ITE DROPZERO            * CF816
          :: ROMPTR 0E0 044 BINT8 ;              * CF82A
          DUP ROMPTR 0E0 007 ROMPTR 0E0 018 BINT0 ROMPTR 0E0 019 EVAL DUP * CF844  ~BRRclC1
          ROMPTR 0E0 004 SWAP #0=ITE BINT7 BINT6 OVER #MIN DUP * CF879
          ROMPTR 0E0 00D ROMPTR 0E0 016 #1-+ #MIN ROMPTR 0E0 001 FALSE * CF8A7
          ROMPTR 0E0 008 ROMPTR 0E0 017 ROMPTR 0E0 04F ; * CF8D7  ~BRRclCurRow

* ROMPTR 0E0 025
* refs (1): CF38C
~BRbrowse~3:
        :: BINT1 #=casedrop ROMPTR 0E0 026       * CF8FD
          BINT2 #=casedrop ROMPTR 0E0 027        * CF917
          BINT3 #=casedrop ROMPTR 0E0 028        * CF92C
          BINT4 #=casedrop ROMPTR 0E0 029        * CF941
          BINT5 #=casedrop ROMPTR 0E0 02A        * CF956
          DROP ROMPTR 0E0 02B ;                  * CF96B

* ROMPTR 0E0 026
* refs (1): CF38C
~BRbrowse~4:
        :: BINT11 ?CaseRomptr@ ROMPTR 0E0 030 BINT12 ?CaseRomptr@ * CF980
          ROMPTR 0E0 02D BINT17 ?CaseRomptr@ ROMPTR 0E0 031 BINT25 * CF9A4
          ?CaseRomptr@ ROMPTR 0E0 038 BINT45 ?CaseRomptr@ ROMPTR 0E0 039 * CF9C9
          BINT30 #=casedrpfls BINT35             * CF9EE
          #=casedrpfls BINT40                    * CF9FD
          #=casedrpfls DUP                       * CFA07
          BINT7 #< casedrpfls BINT1              * CFA11
          ROMPTR 0E0 02C ;                       * CFA25

* ROMPTR 0E0 027
* refs (1): CF38C
~BRbrowse~5:
        :: BINT11 ?CaseRomptr@ ROMPTR 0E0 034 BINT12 ?CaseRomptr@ * CFA35
          ROMPTR 0E0 02E BINT17 ?CaseRomptr@ ROMPTR 0E0 035 BINT25 * CFA59
          ?CaseRomptr@ ROMPTR 0E0 052 BINT35 #=casedrpfls BINT40 * CFA7E  BRViewItem
          #=casedrpfls BINT2                     * CFA9D
          ROMPTR 0E0 02C ;                       * CFAA7

* ROMPTR 0E0 028
* refs (1): CF38C
~BRbrowse~6:
        :: BINT11 ?CaseRomptr@ ROMPTR 0E0 036 BINT12 ?CaseRomptr@ * CFAB7
          ROMPTR 0E0 02F BINT17 ?CaseRomptr@ ROMPTR 0E0 037 BINT25 * CFADB
          ?CaseRomptr@ ROMPTR 0E0 052 BINT35 #=casedrpfls BINT40 * CFB00  BRViewItem
          #=casedrpfls BINT45                    * CFB1F
          #=casedrpfls BINT3                     * CFB29
          ROMPTR 0E0 02C ;                       * CFB33

* ROMPTR 0E0 029
* refs (1): CF38C
~BRbrowse~7:
        :: BINT25 ?CaseRomptr@ ROMPTR 0E0 038 BINT45 ?CaseRomptr@ * CFB43
          ROMPTR 0E0 039 BINT30 #=casedrpfls BINT35 * CFB67
          #=casedrpfls BINT40                    * CFB81
          #=casedrpfls BINT4                     * CFB8B
          ROMPTR 0E0 02C ;                       * CFB95

* ROMPTR 0E0 02A
* refs (1): CF38C
~BRbrowse~8:
        :: BINT45 ?CaseRomptr@ ROMPTR 0E0 039 BINT25 ?CaseRomptr@ * CFBA5
          ROMPTR 0E0 038 BINT35 #=casedrpfls BINT40 * CFBC9
          #=casedrpfls BINT5                     * CFBE3
          ROMPTR 0E0 02C ;                       * CFBED

* ROMPTR 0E0 02B
* refs (1): CF38C
~BRbrowse~9:
        :: BINT45 #=casedrpfls BINT25            * CFBFD
          ?CaseRomptr@ ROMPTR 0E0 038 BINT35 #=casedrpfls BINT40 * CFC11
          #=casedrpfls BINT6                     * CFC30
          ROMPTR 0E0 02C ;                       * CFC3A

* ROMPTR 0E0 02C
* refs (1): CF38C
ROMP_0E0_02C:
        :: Key>StdKeyOb DUPTYPECHAR? ITE         * CFC4A
          :: ROMPTR 0E0 00C RESOROMP ROMPTR 0E0 03A ; * CFC5E
          :: DROP 'DoBadKey ;                    * CFC83
          TRUE ;                                 * CFC97

* ROMPTR 0E0 02D
* refs (1): CF38C
~BRbrowse~10:
        :: TakeOver ROMPTR 0E0 01B BINT7 #< case DoBadKey * CFCA1
          BINT6 SetSomeRow DispMenu ROMPTR 0E0 049 * CFCCA  BRinverse
          ROMPTR 0E0 045                         * CFCE4  BRDispItems
          ROMPTR 0E0 049 ;                       * CFCEF  BRinverse

* ROMPTR 0E0 02E
* refs (1): CF38C
~BRbrowse~11:
        :: TakeOver ROMPTR 0E0 01B BINT7 #< case DoBadKey * CFCFF
          DoPrevRow DispMenu ROMPTR 0E0 049      * CFD28  BRinverse
          ROMPTR 0E0 045                         * CFD3D  BRDispItems
          ROMPTR 0E0 049 ;                       * CFD48  BRinverse

* ROMPTR 0E0 02F
* refs (1): CF38C
~BRbrowse~12:
        :: TakeOver ROMPTR 0E0 01B BINT7 #< case DoBadKey * CFD58
          DoFirstRow DispMenu ROMPTR 0E0 049     * CFD81  BRinverse
          ROMPTR 0E0 045                         * CFD96  BRDispItems
          ROMPTR 0E0 049 ;                       * CFDA1  BRinverse

* ROMPTR 0E0 030
* refs (1): CF38C
~BRbrowse~13:
        :: TakeOver REPEATER BINT11 ROMPTR 0E0 032 ; * CFDB1

* ROMPTR 0E0 031
* refs (1): CF38C
~BRbrowse~14:
        :: TakeOver REPEATER BINT17 ROMPTR 0E0 033 ; * CFDD5

* ROMPTR 0E0 032
* refs (1): CF38C
~BRbrowse~15:
        :: ROMPTR 0E0 017 #1-DUP #0=case         * CFDF9  ~BRRclCurRow
          :: DROP ROMPTR 0E0 037 ;               * CFE13
          ROMPTR 0E0 049 DUP ROMPTR 0E0 002 DUP ROMPTR 0E0 016 #< IT * CFE2D  BRinverse
          :: DUP ROMPTR 0E0 000 ROMPTR 0E0 01C #1- ROMPTR 0E0 001 * CFE62
            ROMPTR 0E0 04A DUP ROMPTR 0E0 046 ROMPTR 0E0 048 ; * CFE92
          ROMPTR 0E0 04F ROMPTR 0E0 049 ;        * CFEBD  BRinverse

* ROMPTR 0E0 033
* refs (1): CF38C
~BRbrowse~16:
        :: ROMPTR 0E0 017 DUP ROMPTR 0E0 01D #= casedrop ROMPTR 0E0 036 * CFED8  ~BRRclCurRow
          #1+ ROMPTR 0E0 049 DUP ROMPTR 0E0 002 DUP ROMPTR 0E0 01C #> IT * CFF0D  BRinverse
          :: DUP ROMPTR 0E0 001 ROMPTR 0E0 016 #1+ ROMPTR 0E0 000 * CFF47
            ROMPTR 0E0 04C DUP ROMPTR 0E0 046 ROMPTR 0E0 048 ; * CFF77
          ROMPTR 0E0 04F ROMPTR 0E0 049 ;        * CFFA2  BRinverse

* ROMPTR 0E0 034
* refs (1): CF38C
~BRbrowse~17:
        :: TakeOver ROMPTR 0E0 042 ROMPTR 0E0 017 #1=case ROMPTR 0E0 037 * CFFBD  ~BRRclCurRow
          ROMPTR 0E0 049 ROMPTR 0E0 016 DUP      * CFFED  BRinverse
          ROMPTR 0E0 017 #<> ITE ROMPTR 0E0 002  * D0008  ~BRRclCurRow
          :: DUP ROMPTR 0E0 024 #>ITE            * D0028
            :: DUP ROMPTR 0E0 024 #-DUP ROMPTR 0E0 000 ROMPTR 0E0 002 #1- ; * D0042
            :: DROP ONEONE ROMPTR 0E0 000 ROMPTR 0E0 002 ROMPTR 0E0 024 ; * D007C
            ROMPTR 0E0 001 ROMPTR 0E0 045 ;      * D00B1  BRDispItems
          ROMPTR 0E0 04E ;                       * D00CC

* ROMPTR 0E0 035
* refs (1): CF38C
~BRbrowse~18:
        :: TakeOver ROMPTR 0E0 042 ROMPTR 0E0 017 ROMPTR 0E0 01D #=casedrop * D00DC  ~BRRclCurRow
          ROMPTR 0E0 036                         * D010C
          ROMPTR 0E0 049 ROMPTR 0E0 01C DUPUNROT #<> ITE ROMPTR 0E0 002 * D0117  BRinverse
          :: DUP ROMPTR 0E0 024 #+ ROMPTR 0E0 01D #<ITE * D0147
            :: ROMPTR 0E0 024 OVER #+DUP ROMPTR 0E0 002 ROMPTR 0E0 001 #1+ ; * D0171
            :: DROP ROMPTR 0E0 01D DUP ROMPTR 0E0 001 DUP ROMPTR 0E0 002 * D01AB
              ROMPTR 0E0 024 #1-- ;              * D01E0
            ROMPTR 0E0 000 ROMPTR 0E0 045 ;      * D01F5  BRDispItems
          ROMPTR 0E0 04E ;                       * D0210

* ROMPTR 0E0 036
* refs (1): CF38C
ROMP_0E0_036:
        :: TakeOver ROMPTR 0E0 042 ROMPTR 0E0 016 #1= case * D0220
          :: ROMPTR 0E0 017 BINT1 #=casedrop DoBadKey * D024A  ~BRRclCurRow
            DROP BINT1 ROMPTR 0E0 002 ROMPTR 0E0 04D ; * D0269
          ROMPTR 0E0 049 BINT1 ROMPTR 0E0 002 BINT1 ROMPTR 0E0 000 * D028E  BRinverse
          ROMPTR 0E0 024 ROMPTR 0E0 001 ROMPTR 0E0 045 ROMPTR 0E0 04E ; * D02B9  BRDispItems

* ROMPTR 0E0 037
* refs (1): CF38C
ROMP_0E0_037:
        :: TakeOver ROMPTR 0E0 042 ROMPTR 0E0 01D ROMPTR 0E0 01C OVER #= * D02EA
          case                                   * D031F
          :: ROMPTR 0E0 017 OVER#=case           * D0324  ~BRRclCurRow
            :: DROP DoBadKey ;                   * D0339
            ROMPTR 0E0 002 ROMPTR 0E0 04D ;      * D034D
          ROMPTR 0E0 049 DUP ROMPTR 0E0 002 DUP ROMPTR 0E0 024 #1-- * D0368  BRinverse
          ROMPTR 0E0 000 ROMPTR 0E0 001 ROMPTR 0E0 045 ROMPTR 0E0 04E ; * D0398  BRDispItems

* ROMPTR 0E0 038
* refs (1): CF38C
ROMP_0E0_038:
        :: TakeOver ROMPTR 0E0 042 ROMPTR 0E0 015 CARCOMP COLA_EVAL ; * D03C9

* ROMPTR 0E0 039
* refs (1): CF38C
ROMP_0E0_039:
        :: TakeOver ROMPTR 0E0 042 ROMPTR 0E0 015 BINT2 NTHCOMPDROP * D03F8
          COLA_EVAL ;                            * D0422

* ROMPTR 0E0 03A
* refs (1): CF38C
ROMP_0E0_03A:
        :: TakeOver ROMPTR 0E0 023 ROMPTR 0E0 043 ITE ROMPTR 0E0 03C * D042C
          ROMPTR 0E0 03B                         * D045C
        ;                                        * D0467

* ROMPTR 0E0 03B
* refs (1): CF38C
ROMP_0E0_03B:
        :: DUP CHR># DUP BINT64 #> SWAP BINT91 #< AND ROMPTR 0E0 01A NULL{} * D046C
          EQUALNOT ANDITE                        * D04AE
          :: DUP CHR># ROMPTR 0E0 01A SWAP BINT64 #- NTHCOMDDUP #0<> DUP * D04B8
            ?SKIP SWAPDROP                       * D04F0
          ;                                      * D04FA
          :: DUP ROMPTR 0E0 017 #1+ ROMPTR 0E0 03D DUP ?SKIP * D04FF  ~BRRclCurRow
            :: DROPDUP BINT1 ROMPTR 0E0 017 ROMPTR 0E0 03E ; * D052E  ~BRRclCurRow
          ;                                      * D0558
          case                                   * D055D
          :: ROMPTR 0E0 040 ROMPTR 0E0 041 ;     * D0562
          DROP ROMPTR 0E0 042 DoBadKey ;         * D0582

* ROMPTR 0E0 03C
* refs (1): CF38C
ROMP_0E0_03C:
        :: DUP ROMPTR 0E0 017 #1+ ROMPTR 0E0 03D ?SKIP * D059C  ~BRRclCurRow
          :: DUPONE ROMPTR 0E0 03D DROP ;        * D05C6
          SWAPDROP ROMPTR 0E0 040 ;              * D05E5

* ROMPTR 0E0 03D
* refs (1): CF38C
ROMP_0E0_03D:
        :: ROMPTR 0E0 01D ROMPTR 0E0 03E ;       * D05FA

* ROMPTR 0E0 03E
* refs (1): CF38C
ROMP_0E0_03E:
        :: SWAP BEGIN 2DUPSWAP #>ITE             * D061A
          :: 3DROP FalseTrue ;                   * D0633
          :: DUP ROMPTR 0E0 053 CAR$ 4PICK EQUAL ITE * D0647  BRGetItem
            :: ROTROT2DROP TrueTrue ;            * D0670
            :: #1+ FALSE ;                       * D0684
          ;                                      * D0698
          UNTIL ;                                * D069D

* ROMPTR 0E0 03F
* refs (1): CF38C
ROMP_0E0_03F:
        :: ROMPTR 0E0 017 OVER#= ROMPTR 0E0 016 3PICK #= ANDcase DROP * D06A7  ~BRRclCurRow
          ROMPTR 0E0 01D 2DUPSWAP #- ROMPTR 0E0 024 #1- DUPROT #>ITE * D06DB
          :: OVERSWAP #-SWAP ;                   * D070A
          :: SWAPDROP OVER DUPUNROT #+ ; ROMPTR 0E0 049 ROMPTR 0E0 001 * D071E  BRinverse
          ROMPTR 0E0 000 ROMPTR 0E0 002 ROMPTR 0E0 045 ROMPTR 0E0 04E ; * D0752  BRDispItems

* ROMPTR 0E0 040
* refs (1): CF38C
ROMP_0E0_040:
        :: DUPDUP ROMPTR 0E0 016 #< ROMPTR 0E0 01C ROTSWAP #> ORcase * D0783
          ROMPTR 0E0 03F                         * D07B7
          ROMPTR 0E0 002 ROMPTR 0E0 04D ;        * D07C2

* ROMPTR 0E0 041
* refs (1): CF38C
ROMP_0E0_041:
        :: ROMPTR 0E0 00B ;                      * D07DD

* ROMPTR 0E0 042
* refs (1): CF38C
ROMP_0E0_042:
        :: BINT0 ROMPTR 0E0 00B UnLockAlpha ;    * D07F2

* ROMPTR 0E0 043
* refs (1): CF38C
ROMP_0E0_043:
        :: DUP ROMPTR 0E0 022 EQUAL ;            * D0811

* ROMPTR 0E0 044
* refs (1): CF38C
~BRbrowse~19:
        :: ROMPTR 0B0 0A5 ZEROZERO ROT XYGROBDISP ; * D0830

* ROMPTR 0E0 045
* refs (1): CF38C
BRDispItems:
        :: RESOROMP ROMPTR 0E0 053 RESOROMP ROMPTR 0E0 047 ROMPTR 0E0 01C * D0854  BRGetItem
          #1+ ROMPTR 0E0 016 DO INDEX@ DUP 4PICK EVAL 3PICK EVAL LOOP 2DROP * D0884
          ROMPTR 0E0 048 ;                       * D08C1

* ROMPTR 0E0 046
* refs (1): CF38C
ROMP_0E0_046:
        :: DUP ROMPTR 0E0 053 ROMPTR 0E0 047 ;   * D08D1  BRGetItem

* ROMPTR 0E0 047
* refs (1): CF38C
ROMP_0E0_047:
        :: DUPDUP LEN$ DUP#0= ITE 2DROP          * D08F6
          :: SUB$1# BINT10 #= IT                 * D0914
            :: BINT1 OVERLEN$ #1- SUB$ ;         * D092D
            CODE                                 * D094B  83 nibbles
              GOSBVL  SAVPTR                     * D0955
              A=DAT1  A                          * D095C
              D1=A                               * D095F
              D1=D1+  5                          * D0962
              C=0     M                          * D0965
              C=DAT1  A                          * D0968
              CSRB                               * D096B
              D=C     A                          * D096E
              D1=D1+  3                          * D0970
              LC(2)   #0A                        * D0973
              B=C     B                          * D0977
L_D097A:
              D1=D1+  2                          * D097A
              D=D-1   A                          * D097D
              GOC     L_D0997                    * D097F
              A=DAT1  B                          * D0982
              ?A#B    B                          * D0985
              GOYES   L_D097A                    * D0988
              LA(2)   #20                        * D098A
              DAT1=A  B                          * D0991
              GONC    L_D097A                    * D0994
L_D0997:
              GOSBVL  GETPTR                     * D0997
              A=DAT0  A                          * D099E
              D0=D0+  5                          * D09A1
              PC=(A)                             * D09A4
            ENDCODE                              * D09A8
          ;                                      * D09A8
          BINT21 OVERLEN$ 2DUP#< ITE             * D09AD
          :: DROP 1_#1-SUB$ CHR_... >T$ ;        * D09C1
          :: 2DUP#= ITE 2DROP                    * D09DF
            :: #- Blank$ &$ ;                    * D09F3
          ;                                      * D0A0C
          $>GROB SWAP ROMPTR 0E0 016 #- #8* ROMPTR 0E0 020 #+ ONESWAP ROT * D0A11
          XYGROBDISP ;                           * D0A4A

* ROMPTR 0E0 048
* refs (1): CF38C
ROMP_0E0_048:
        :: # 7F DUP ROMPTR 0E0 020 ROMPTR 0E0 016 #1= ITE ROMPTR 0E0 056 * D0A54
          ROMPTR 0E0 054                         * D0A93
          XYGROBDISP BINT48 ROMPTR 0E0 01C ROMPTR 0E0 01D #=ITE * D0A9E
          ROMPTR 0E0 056 ROMPTR 0E0 055 XYGROBDISP ; * D0AC3

* ROMPTR 0E0 049
* refs (1): CF38C
BRinverse:
        :: HARDBUFF BINT0 ROMPTR 0E0 01F 2DUP 5PICK 3UNROLL # 7F * D0AE3
          ROMPTR 0E0 01E SUBGROB INVGROB 4UNROLL GROB! ; * D0B16

* ROMPTR 0E0 04A
* refs (1): CF38C
~BRbrowse~20:
        :: BINT1 ROMPTR 0E0 050 HARDBUFF ROMPTR 0E0 024 BINT2 #- BINT0 * D0B3A
          ROMPTR 0E0 051 3PICK 6UNROLL SUBGROB SWAP ZEROSWAP ROMPTR 0E0 04B * D0B6E
          XYGROBDISP XYGROBDISP ;                * D0B9D

* ROMPTR 0E0 04B
* refs (1): CF38C
ROMP_0E0_04B:
        ::                                       * D0BAC
          GROB    "images/D0BB1.png"             * D0BB1  127 x 8
        ;                                        * D0CC5

* ROMPTR 0E0 04C
* refs (1): CF38C
~BRbrowse~21:
        :: BINT0 ROMPTR 0E0 050 HARDBUFF ROMPTR 0E0 024 #1- BINT1 * D0CCA
          ROMPTR 0E0 051 DUP BINT7 #- 6UNROLL SUBGROB SWAP#1- ZEROSWAP * D0CF9
          ROMPTR 0E0 04B XYGROBDISP XYGROBDISP ; * D0D27

* ROMPTR 0E0 04D
* refs (1): CF38C
ROMP_0E0_04D:
        :: ROMPTR 0E0 049 ROMPTR 0E0 04E ;       * D0D41  BRinverse

* ROMPTR 0E0 04E
* refs (1): CF38C
ROMP_0E0_04E:
        :: ROMPTR 0E0 017 ROMPTR 0E0 04F         * D0D61  ~BRRclCurRow
          ROMPTR 0E0 049 ;                       * D0D7C  BRinverse

* ROMPTR 0E0 04F
* refs (1): CF38C
ROMP_0E0_04F:
        :: ROMPTR 0E0 016 #- #8* ROMPTR 0E0 020 #+ DUP#0=ITE * D0D8C
          :: DUP #8+ ;                           * D0DBB
          :: DUP#1- SWAP #8+ ; ROMPTR 0E0 005 ROMPTR 0E0 006 ; * D0DCF

* ROMPTR 0E0 050
* refs (1): CF38C
ROMP_0E0_050:
        :: #8* ROMPTR 0E0 020 #+ ZEROSWAP ;      * D0E03

* ROMPTR 0E0 051
* refs (1): CF38C
ROMP_0E0_051:
        :: #8* ROMPTR 0E0 020 DUPUNROT #+ SWAPROT #1+ #8* #+ BINT0 3UNROLL * D0E27
          # 7F SWAP ;                            * D0E64

* ROMPTR 0E0 052
* refs (1): CF38C
BRViewItem:
        :: ROMPTR 0E0 017                        * D0E78  ~BRRclCurRow
          ROMPTR 0E0 053 BINT21 OVERLEN$ #< NOTcase * D0E88  BRGetItem
          :: DROP BINT70 INTEGER337 setbeep ;    * D0EA7
          ROMPTR 0E0 049 TURNMENUOFF BINT8 BINT56 BLANKIT * D0EC5  BRinverse
          :: BINT1 # 9A SUB$ DUP NEWLINE$ BINT1 POS$ DUP#0<> case * D0EE4
            :: BINT0 3UNROLL BEGIN DUP#0<> WHILE * D0F1B
              :: ROT#1+UNROT SWAPDUP ROT#1+ NEWLINE$ SWAP POS$ ; REPEAT * D0F39
              DROPSWAP ;                         * D0F66
            NULL$ ROT BEGIN DUPLEN$ BINT22 #> WHILE * D0F70
            :: DUPONE BINT22 SUB$ ROTSWAP &$ NEWLINE$&$ SWAP BINT23 OVERLEN$ * D0F93
              SUB$ ROT#1+UNROT ;                 * D0FC5
            REPEAT &$SWAP ;                      * D0FD4
          { BINT4 BINT4 BINT4 BINT3 BINT3 BINT2 BINT2 } SWAP#1+ NTHCOMPDROP * D0FE3
          BINT7 Disp5x7 BEGIN                    * D101A
          :: WaitForKey DROPDUP BINT45 #= SWAP BINT25 #= ORcase FALSE * D1029
            TRUE ;                               * D105B
          WHILE                                  * D1065
          :: DoBadKey ; REPEAT BINT8 BINT56 BLANKIT ROMPTR 0E0 045 * D106A  BRDispItems
          ROMPTR 0E0 049 TURNMENUON ;            * D1098  BRinverse

* ROMPTR 0E0 053
* refs (1): CF38C
BRGetItem:
        :: ROMPTR 0E0 018 SWAP ROMPTR 0E0 019 EVAL ; * D10AD  ~BRRclC1

* ROMPTR 0E0 054
* refs (1): CF38C
ROMP_0E0_054:
        GROB    "images/D10D7.png"               * D10D7  4 x 7

* ROMPTR 0E0 055
* refs (1): CF38C
ROMP_0E0_055:
        GROB    "images/D10F9.png"               * D10F9  4 x 7

* ROMPTR 0E0 056
* refs (1): CF38C
ROMP_0E0_056:
        GROB    "images/D111B.png"               * D111B  4 x 7

LIB0E0.hash:
        CON(5)  DOHSTR                           * D113D  hash table of library 0E0
        LENGTH                                   * D1142  length, to #D11A1
        CON(5)  0                                * D1147  names of length 1
        CON(5)  0                                * D114C  names of length 2
        CON(5)  0                                * D1151  names of length 3
        CON(5)  0                                * D1156  names of length 4
        CON(5)  0                                * D115B  names of length 5
        CON(5)  0                                * D1160  names of length 6
        CON(5)  0                                * D1165  names of length 7
        CON(5)  0                                * D116A  names of length 8
        CON(5)  0                                * D116F  names of length 9
        CON(5)  0                                * D1174  names of length 10
        CON(5)  0                                * D1179  names of length 11
        CON(5)  0                                * D117E  names of length 12
        CON(5)  0                                * D1183  names of length 13
        CON(5)  0                                * D1188  names of length 14
        CON(5)  0                                * D118D  names of length 15
        CON(5)  0                                * D1192  names of length 16
        REL(5)  L_D119C                          * D1197  end of the names
L_D119C:
        CON(5)  0                                * D119C  command 000 has no name
        ENDLENGTH                                * D11A1

LIB0E0.link:
        CON(5)  DOHSTR                           * D11A1  link table of library 0E0
        LENGTH                                   * D11A6  length, to #D135E
        REL(5)  ROMP_0E0_000                     * D11AB  000 
        REL(5)  ROMP_0E0_001                     * D11B0  001 
        REL(5)  ROMP_0E0_002                     * D11B5  002 
        REL(5)  ~BRStoC1                         * D11BA  003 ~BRStoC1
        REL(5)  ~BRbrowse~22                     * D11BF  004 
        REL(5)  ROMP_0E0_005                     * D11C4  005 
        REL(5)  ROMP_0E0_006                     * D11C9  006 
        REL(5)  ~BRbrowse~23                     * D11CE  007 
        REL(5)  ROMP_0E0_008                     * D11D3  008 
        REL(5)  ROMP_0E0_009                     * D11D8  009 
        REL(5)  ROMP_0E0_00A                     * D11DD  00A 
        REL(5)  ROMP_0E0_00B                     * D11E2  00B 
        REL(5)  ROMP_0E0_00C                     * D11E7  00C 
        REL(5)  ~BRbrowse~24                     * D11EC  00D 
        REL(5)  ROMP_0E0_00E                     * D11F1  00E 
        REL(5)  ROMP_0E0_00F                     * D11F6  00F 
        REL(5)  ~BRbrowse                        * D11FB  010 ~BRbrowse
        REL(5)  ~BRbrowse~1                      * D1200  011 
        REL(5)  ~BRoutput                        * D1205  012 ~BRoutput
        REL(5)  BRdone                           * D120A  013 BRdone
        REL(5)  ~BRbrowse~2                      * D120F  014 
        REL(5)  ROMP_0E0_015                     * D1214  015 
        REL(5)  ROMP_0E0_016                     * D1219  016 
        REL(5)  ~BRRclCurRow                     * D121E  017 ~BRRclCurRow
        REL(5)  ~BRRclC1                         * D1223  018 ~BRRclC1
        REL(5)  BRGetItem~1                      * D1228  019 
        REL(5)  ROMP_0E0_01A                     * D122D  01A 
        REL(5)  ROMP_0E0_01B                     * D1232  01B 
        REL(5)  ROMP_0E0_01C                     * D1237  01C 
        REL(5)  ROMP_0E0_01D                     * D123C  01D 
        REL(5)  BRinverse~1                      * D1241  01E 
        REL(5)  BRinverse~2                      * D1246  01F 
        REL(5)  ROMP_0E0_020                     * D124B  020 
        REL(5)  ROMP_0E0_021                     * D1250  021 
        REL(5)  ROMP_0E0_022                     * D1255  022 
        REL(5)  ROMP_0E0_023                     * D125A  023 
        REL(5)  ROMP_0E0_024                     * D125F  024 
        REL(5)  ~BRbrowse~3                      * D1264  025 
        REL(5)  ~BRbrowse~4                      * D1269  026 
        REL(5)  ~BRbrowse~5                      * D126E  027 
        REL(5)  ~BRbrowse~6                      * D1273  028 
        REL(5)  ~BRbrowse~7                      * D1278  029 
        REL(5)  ~BRbrowse~8                      * D127D  02A 
        REL(5)  ~BRbrowse~9                      * D1282  02B 
        REL(5)  ROMP_0E0_02C                     * D1287  02C 
        REL(5)  ~BRbrowse~10                     * D128C  02D 
        REL(5)  ~BRbrowse~11                     * D1291  02E 
        REL(5)  ~BRbrowse~12                     * D1296  02F 
        REL(5)  ~BRbrowse~13                     * D129B  030 
        REL(5)  ~BRbrowse~14                     * D12A0  031 
        REL(5)  ~BRbrowse~15                     * D12A5  032 
        REL(5)  ~BRbrowse~16                     * D12AA  033 
        REL(5)  ~BRbrowse~17                     * D12AF  034 
        REL(5)  ~BRbrowse~18                     * D12B4  035 
        REL(5)  ROMP_0E0_036                     * D12B9  036 
        REL(5)  ROMP_0E0_037                     * D12BE  037 
        REL(5)  ROMP_0E0_038                     * D12C3  038 
        REL(5)  ROMP_0E0_039                     * D12C8  039 
        REL(5)  ROMP_0E0_03A                     * D12CD  03A 
        REL(5)  ROMP_0E0_03B                     * D12D2  03B 
        REL(5)  ROMP_0E0_03C                     * D12D7  03C 
        REL(5)  ROMP_0E0_03D                     * D12DC  03D 
        REL(5)  ROMP_0E0_03E                     * D12E1  03E 
        REL(5)  ROMP_0E0_03F                     * D12E6  03F 
        REL(5)  ROMP_0E0_040                     * D12EB  040 
        REL(5)  ROMP_0E0_041                     * D12F0  041 
        REL(5)  ROMP_0E0_042                     * D12F5  042 
        REL(5)  ROMP_0E0_043                     * D12FA  043 
        REL(5)  ~BRbrowse~19                     * D12FF  044 
        REL(5)  BRDispItems                      * D1304  045 BRDispItems
        REL(5)  ROMP_0E0_046                     * D1309  046 
        REL(5)  ROMP_0E0_047                     * D130E  047 
        REL(5)  ROMP_0E0_048                     * D1313  048 
        REL(5)  BRinverse                        * D1318  049 BRinverse
        REL(5)  ~BRbrowse~20                     * D131D  04A 
        REL(5)  ROMP_0E0_04B                     * D1322  04B 
        REL(5)  ~BRbrowse~21                     * D1327  04C 
        REL(5)  ROMP_0E0_04D                     * D132C  04D 
        REL(5)  ROMP_0E0_04E                     * D1331  04E 
        REL(5)  ROMP_0E0_04F                     * D1336  04F 
        REL(5)  ROMP_0E0_050                     * D133B  050 
        REL(5)  ROMP_0E0_051                     * D1340  051 
        REL(5)  BRViewItem                       * D1345  052 BRViewItem
        REL(5)  BRGetItem                        * D134A  053 BRGetItem
        REL(5)  ROMP_0E0_054                     * D134F  054 
        REL(5)  ROMP_0E0_055                     * D1354  055 
        REL(5)  ROMP_0E0_056                     * D1359  056 
        ENDLENGTH                                * D135E
        BSS     4                                * D135E  zeros
