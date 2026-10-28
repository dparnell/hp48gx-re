* HP 48GX ROM revision R, #BA576-#BD8E8: Library part 0B3
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~ChooseMenu2 ~ChooseMenu1 ~ChooseMenu0 ~Choose ~BReReadMenus ~BBUpArrow ~BBSpace ~BBRunEntryProc ~BBRunENTERAction ~BBRunCanclAction ~BBRereadFullScr ~BBRereadChkEnbl
* Follows on from the previous file (at #BA576 in the original ROM).

LIB0B3:
        CON(3)  #0B3                             * BA576  library number
        REL(5)  LIB0B3.hash                      * BA579  hash table
        CON(5)  0                                * BA57E  message table
        REL(5)  LIB0B3.link                      * BA583  link table
        CON(5)  0                                * BA588  config
        RPL

* ROMPTR 0B3 000
* refs (1): BA576
~Choose:
        :: POLSaveUI ERRSET                      * BA58D
          :: DUP#0= ITE                          * BA59C
            :: DROPONE TRUE ; FALSE              * BA5AB
            MINUSONE BINT13 NDUPN DROP ROMPTR 0B3 057 FALSE BINT21 * BA5C4
            ROMPTR 0B0 0DB                       * BA5ED  ~nNullBind
            ROMPTR 0B3 03B                       * BA5F8  ~BBRereadChkEnbl
            ROMPTR 0B3 03C                       * BA603  ~BBRereadFullScr
            ROMPTR 0B3 03D                       * BA60E  ~BReReadMenus
            ROMPTR 0B3 03E                       * BA619  ~BBReReadNElems
            ROMPTR 0B3 024                       * BA624  ~BBReReadHeight
            ROMPTR 0B3 023                       * BA62F  ~BBReReadPageSize
            ROMPTR 0B3 026                       * BA63A  ~BBReReadWidth
            ROMPTR 0B3 025 ROMPTR 0B3 04A ROMPTR 0B3 027 ROMPTR 0B3 039 * BA645  ~BBReReadCoords
            ROMPTR 0B3 022 ' ROMPTR 0B3 001 ' ROMPTR 0B3 008 TrueTrue * BA671  ~BBRunEntryProc
            13GETLAM ONEFALSE ' 2GETLAM ' ROMPTR 0B0 000 POLSetUI ClrDAsOK * BA6A1
            POLKeyUI ROMPTR 0B3 03A ClrDAsOK 3GETLAM ROMPTR 0B3 058 ABND ; * BA6CF
          ERRTRAP POLResUI&Err POLRestoreUI ;    * BA6FE

* ROMPTR 0B3 001
* refs (1): BA576
ROMP_0B3_001:
        :: DA1OK? ?SKIP ROMPTR 0B3 002           * BA712
          ROMPTR 0B3 056 DA2aOK? NOT AND IT ROMPTR 0B3 003 * BA72C
          DA3OK? ?SKIP ?DispMenu                 * BA756
          DA2bOK? ?SKIP ROMPTR 0B3 004           * BA765
          ClrDAsOK ;                             * BA77A

* ROMPTR 0B3 002
* refs (1): BA576
ROMP_0B3_002:
        :: KEYINBUFFER? case SetDA1Bad           * BA784
          ROMPTR 0B3 02F SetDA1Valid SetDA2bBad ROMPTR 0B3 056 IT SetDA2aBad * BA798  ~BBReDrawBackgr
        ;                                        * BA7C2

* ROMPTR 0B3 003
* refs (1): BA576
ROMP_0B3_003:
        :: KEYINBUFFER? case SetDA2aBad          * BA7C7
          ROMPTR 0B3 030 SetDA2aValid ;          * BA7DB  LEDispPrompt

* ROMPTR 0B3 004
* refs (1): BA576
ROMP_0B3_004:
        :: KEYINBUFFER? case SetDA2bBad          * BA7F0
          ROMPTR 0B3 035 KEYINBUFFER? ?SEMI      * BA804  LEDispList
          SetDA2bValid ;                         * BA819

* ROMPTR 0B3 005
* refs (1): BA576
~ChooseMenu0:
        :: NoExitAction                          * BA823
          { NullMenuKey NullMenuKey NullMenuKey NullMenuKey NullMenuKey * BA82D
            { $ "OK" ROMPTR 0B3 02E } }          * BA84B  DoCKeyOK
        ;                                        * BA873

* ROMPTR 0B3 006
* refs (1): BA576
~ChooseMenu1:
        :: NoExitAction                          * BA878
          { NullMenuKey NullMenuKey NullMenuKey NullMenuKey * BA882
            { $ "(AN(L" ROMPTR 0B3 02D }         * BA89B  DoCKeyCancel
            { $ "OK" ROMPTR 0B3 02E } }          * BA8C4  DoCKeyOK
        ;                                        * BA8EC

* ROMPTR 0B3 007
* refs (1): BA576
~ChooseMenu2:
        :: NoExitAction                          * BA8F1
          { NullMenuKey NullMenuKey              * BA8FB
            {                                    * BA90A
              :: TakeOver ROMPTR 0B3 05B ITE NULL$ * BA90F  ~BBEmpty?
                ROMPTR 0B0 086                   * BA92E  ~grobCheckKey
              ;                                  * BA939
              { ROMPTR 0B3 02A                   * BA93E  DoCKeyCheck
                ROMPTR 0B3 02B                   * BA94E  DoCKeyChAll
                ROMPTR 0B3 02C }                 * BA959  DoCKeyUnChAll
            }                                    * BA969
            NullMenuKey                          * BA96E
            { $ "(AN(L" ROMPTR 0B3 02D }         * BA973  DoCKeyCancel
            { $ "OK" ROMPTR 0B3 02E } }          * BA99C  DoCKeyOK
        ;                                        * BA9C4

* ROMPTR 0B3 008
* refs (1): BA576
ROMP_0B3_008:
        :: BINT1 #=casedrop ROMPTR 0B3 009       * BA9C9
          BINT2 #=casedrop ROMPTR 0B3 00A        * BA9E3
          BINT3 #=casedrop ROMPTR 0B3 00B        * BA9F8
          BINT4 #=casedrop ROMPTR 0B3 00C        * BAA0D
          BINT5 #=casedrop ROMPTR 0B3 00D        * BAA22
          BINT6 #=casedrop ROMPTR 0B3 00E        * BAA37
        ;                                        * BAA4C

* ROMPTR 0B3 009
* refs (1): BA576
ROMP_0B3_009:
        ::                                       * BAA51
          { BINT11 ROMPTR 0B3 01A BINT17 ROMPTR 0B3 01C BINT26 * BAA56
            ROMPTR 0B3 02A BINT25                * BAA80  DoCKeyCheck
            ROMPTR 0B3 02E BINT45                * BAA90  DoCKeyOK
            ROMPTR 0B3 02D }                     * BAAA0  DoCKeyCancel
          OBJ_19FE4 caseTRUE BINT30              * BAAB0
          #=casedrpfls DUP#<7                    * BAABF
          casedrpfls BINT12                      * BAAC9
          #=casedrpfls BINT35                    * BAAD3
          #=casedrpfls BINT40                    * BAADD
          #=casedrpfls BINT1                     * BAAE7
          ROMPTR 0B3 00F ;                       * BAAF1

* ROMPTR 0B3 00A
* refs (1): BA576
ROMP_0B3_00A:
        ::                                       * BAB01
          { BINT11 ROMPTR 0B3 01E BINT17 ROMPTR 0B3 01F } OBJ_19FE4 caseTRUE * BAB06
          DUP#<7                                 * BAB3A
          casedrpfls BINT12                      * BAB3F
          #=casedrpfls BINT35                    * BAB49
          #=casedrpfls BINT40                    * BAB53
          #=casedrpfls BINT2                     * BAB5D
          ROMPTR 0B3 00F ;                       * BAB67

* ROMPTR 0B3 00B
* refs (1): BA576
ROMP_0B3_00B:
        ::                                       * BAB77
          { BINT11 ROMPTR 0B3 020 BINT17 ROMPTR 0B3 021 } OBJ_19FE4 caseTRUE * BAB7C
          BINT45                                 * BABB0
          #=casedrpfls DUP#<7                    * BABB5
          casedrpfls BINT35                      * BABBF
          #=casedrpfls BINT40                    * BABC9
          #=casedrpfls BINT3                     * BABD3
          ROMPTR 0B3 00F ;                       * BABDD

* ROMPTR 0B3 00C
* refs (1): BA576
ROMP_0B3_00C:
        ::                                       * BABED
          { BINT25 ROMPTR 0B3 02E BINT45         * BABF2  DoCKeyOK
            ROMPTR 0B3 02D }                     * BAC0C  DoCKeyCancel
          OBJ_19FE4 caseTRUE BINT30              * BAC1C
          #=casedrpfls BINT35                    * BAC2B
          #=casedrpfls BINT40                    * BAC35
          #=casedrpfls BINT4                     * BAC3F
          ROMPTR 0B3 00F ;                       * BAC49

* ROMPTR 0B3 00D
* refs (1): BA576
ROMP_0B3_00D:
        :: BINT30 #=casedrpfls BINT35            * BAC59
          #=casedrpfls BINT40                    * BAC6D
          #=casedrpfls BINT5                     * BAC77
          ROMPTR 0B3 00F ;                       * BAC81

* ROMPTR 0B3 00E
* refs (1): BA576
ROMP_0B3_00E:
        :: BINT35 #=casedrpfls BINT40            * BAC91
          #=casedrpfls BINT45                    * BACA5
          #=casedrpfls BINT6                     * BACAF
          ROMPTR 0B3 00F ;                       * BACB9

* ROMPTR 0B3 00F
* refs (1): BA576
ROMP_0B3_00F:
        :: Key>U/SKeyOb DUPTYPECHAR? case ROMPTR 0B3 010 * BACC9
          DUPTYPECSTR? case                      * BACE8
          :: ROMPTR 0B3 013 ROMPTR 0B3 010 ;     * BACF2
          DROP 'DoBadKeyT ;                      * BAD12

* ROMPTR 0B3 010
* refs (1): BA576
ROMP_0B3_010:
        :: ' TakeOver SWAP BINT2 ::N ' ROMPTR 0B3 011 >TCOMP TRUE ; * BAD21

* ROMPTR 0B3 011
* refs (1): BA576
ROMP_0B3_011:
        :: ' ROMPTR 0B3 03F 12GETLAM 20GETLAM 18GETLAM #1+ 5ROLL * BAD5E  ~BBGetN
          ROMPTR 0B0 09E NOTcase DoBadKey        * BAD8C
          ROMPTR 0B3 015 ;                       * BADA1  ~BBMoveTo

* ROMPTR 0B3 012
* refs (1): BA576
ROMP_0B3_012:
        :: DUP CHR># BINT97 OVER#> caseDROP BINT122 * BADB1
          OVER#< caseDROP SWAPDROP               * BADD4
          BINT32 #- #>CHR ;                      * BADE3

* ROMPTR 0B3 013
* refs (1): BA576
ROMP_0B3_013:
        :: DUPNULL$? casedrop CHR_00             * BADF7
          FALSE SWAP DUPLEN$ #1+_ONE_DO DUP INDEX@ DUP SUB$ CAR$ DUP * BAE0B
          ROMPTR 0B3 014 ITE                     * BAE3D
          :: ROTROT2DROP TRUE SWAP ExitAtLOOP ; DROP * BAE4D
          LOOP SWAP ?SEMI                        * BAE70
          DROP PTR CHR_: ;                       * BAE7F

* ROMPTR 0B3 014
* refs (1): BA576
ROMP_0B3_014:
        :: CHR># BINT48 OVER#> casedrop FALSE    * BAE8E
          BINT58 OVER#> casedrop TRUE            * BAEAC
          ROMPTR 0B3 012 BINT65 OVER#> casedrop FALSE * BAEC0
          BINT91 OVER#> casedrop TRUE            * BAEDF
          DROPFALSE ;                            * BAEF3

* ROMPTR 0B3 015
* refs (1): BA576
~BBMoveTo:
        :: SetDA12a3NCh 18GETLAM 2DUP #= case2drop SetDA123NoCh * BAEFD
          OVER 18PUTLAM 2DUP #> ITE              * BAF20
          :: #- DUP #1= 6GETLAM 11GETLAM #= AND casedrop ROMPTR 0B3 016 * BAF39
            6GETLAM #+ DUP 11GETLAM #> NOTcase   * BAF71
            :: 6GETLAM SWAP DUP 6PUTLAM ROMPTR 0B3 018 ; * BAF8F
            DROP TRUE ROMPTR 0B3 019 ;           * BAFB8  ~BBRecalOff&Disp
          :: SWAP #- DUP #1= 6GETLAM #1= AND casedrop ROMPTR 0B3 017 * BAFD2
            DUP 6GETLAM #< case                  * BB00A
            :: 6GETLAM DUPROT #- DUP 6PUTLAM ROMPTR 0B3 018 ; * BB01E
            DROP TRUE ROMPTR 0B3 019 ;           * BB04C  ~BBRecalOff&Disp
        ;                                        * BB066

* ROMPTR 0B3 016
* refs (1): BA576
ROMP_0B3_016:
        :: DA2bBad? ?SEMI                        * BB06B
          10GETLAM 9GETLAM 2DUP 7GETLAM #+ OVER 8GETLAM #+ OVER 11GETLAM #1- * BB07A
          7GETLAM #* #+ HARDBUFF 5UNROLL 6GETLAM ROMPTR 0B3 04E SUBGROB * BB0B1
          3UNROLL HARDBUFF 3UNROLL GROB! 18GETLAM 6GETLAM ROMPTR 0B3 036 * BB0DF  LEDispItem
          ROMPTR 0B3 04F SetDA2bNoCh ;           * BB108

* ROMPTR 0B3 017
* refs (1): BA576
ROMP_0B3_017:
        :: DA2bBad? ?SEMI                        * BB11D
          10GETLAM 9GETLAM 2DUP OVER 8GETLAM #+ OVER 11GETLAM #1- 7GETLAM #* * BB12C
          #+ HARDBUFF 5UNROLL 6GETLAM ROMPTR 0B3 04E SUBGROB 3UNROLL 7GETLAM * BB163
          #+ HARDBUFF 3UNROLL GROB! 18GETLAM 6GETLAM ROMPTR 0B3 036 * BB191  LEDispItem
          ROMPTR 0B3 04F SetDA2bNoCh ;           * BB1BA

* ROMPTR 0B3 018
* refs (1): BA576
ROMP_0B3_018:
        :: 2DUP #= case2drop SetDA2bNoCh         * BB1CF
          SWAP ROMPTR 0B3 04E ROMPTR 0B3 04D SetDA2bNoCh ; * BB1E8

* ROMPTR 0B3 019
* refs (1): BA576
~BBRecalOff&Disp:
        :: ROMPTR 0B3 05B caseDROP 6GETLAM       * BB20D  ~BBEmpty?
          DUP 18GETLAM #MIN 6PUTLAM 12GETLAM 11GETLAM #MAX 18GETLAM #- * BB227
          11GETLAM DUPUNROT #MIN #- 6GETLAM #MAX 6PUTLAM SWAP NOTcaseDROP * BB254
          ROMPTR 0B3 04E                         * BB281
        ;                                        * BB28C

* ROMPTR 0B3 01A
* refs (1): BA576
ROMP_0B3_01A:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * BB291  ~BBEmpty?
          ROMPTR 0B3 05A REPEATERCH BINT11 ROMPTR 0B3 01B SetDA123NoCh ; * BB2B0  ~BBPgUp

* ROMPTR 0B3 01B
* refs (1): BA576
ROMP_0B3_01B:
        :: 18GETLAM #1- DUP#0= IT                * BB2DA
          :: DROP 12GETLAM ;                     * BB2F3
          ROMPTR 0B3 015 DA2bOK? ?SKIP ROMPTR 0B3 004 * BB307  ~BBMoveTo
          ClrDA2bOK ;                            * BB327

* ROMPTR 0B3 01C
* refs (1): BA576
ROMP_0B3_01C:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * BB331  ~BBEmpty?
          ROMPTR 0B3 059 REPEATERCH BINT17 ROMPTR 0B3 01D SetDA123NoCh ; * BB350  ~BBPgDown

* ROMPTR 0B3 01D
* refs (1): BA576
ROMP_0B3_01D:
        :: 18GETLAM #1+ DUP 12GETLAM #> IT       * BB37A
          :: DROP BINT1 ;                        * BB39D
          ROMPTR 0B3 015 DA2bOK? ?SKIP ROMPTR 0B3 004 * BB3B1  ~BBMoveTo
          ClrDA2bOK ;                            * BB3D1

* ROMPTR 0B3 01E
* refs (1): BA576
ROMP_0B3_01E:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * BB3DB  ~BBEmpty?
          ROMPTR 0B3 05A 18GETLAM DUP#1= casedrop DoBadKey * BB3FA  ~BBPgUp
          11GETLAM 2DUP #>ITE #-                 * BB419
          :: 2DROP BINT1 ; ROMPTR 0B3 015 ;      * BB42D  ~BBMoveTo

* ROMPTR 0B3 01F
* refs (1): BA576
ROMP_0B3_01F:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * BB451  ~BBEmpty?
          ROMPTR 0B3 059 12GETLAM 18GETLAM 2DUP #= case2drop DoBadKey * BB470  ~BBPgDown
          11GETLAM #+ #MIN ROMPTR 0B3 015 ;      * BB499  ~BBMoveTo

* ROMPTR 0B3 020
* refs (1): BA576
ROMP_0B3_020:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * BB4B8  ~BBEmpty?
          BINT1 ROMPTR 0B3 015 ;                 * BB4D7  ~BBMoveTo

* ROMPTR 0B3 021
* refs (1): BA576
ROMP_0B3_021:
        :: TakeOver ROMPTR 0B3 05B case DoBadKey * BB4EC  ~BBEmpty?
          12GETLAM ROMPTR 0B3 015 ;              * BB50B  ~BBMoveTo

* ROMPTR 0B3 022
* refs (1): BA576
~BBRunEntryProc:
        :: BINT85 ROMPTR 0B3 055 DROP ;          * BB520

* ROMPTR 0B3 023
* refs (1): BA576
~BBReReadPageSize:
        :: BINT57 ROMPTR 0B3 055 case 11PUTLAM   * BB53F
          14GETLAM case                          * BB55E
          :: BINT6 ROMPTR 0B3 056 IT #1-         * BB568
            11PUTLAM ;                           * BB587
          BINT5 ROMPTR 0B3 056 IT #1-            * BB591
          12GETLAM #MIN BINT2 #MAX 11PUTLAM ;    * BB5AB

* ROMPTR 0B3 024
* refs (1): BA576
~BBReReadHeight:
        :: BINT58 ROMPTR 0B3 055 ?SKIP BINT9     * BB5C9
          7PUTLAM ;                              * BB5E8

* ROMPTR 0B3 025
* refs (1): BA576
~BBReReadCoords:
        :: BINT63 ROMPTR 0B3 055 case            * BB5F2
          :: 9PUTLAM 10PUTLAM ;                  * BB60C
          14GETLAM case                          * BB620
          :: BINT0 10PUTLAM BINT0 ROMPTR 0B3 044 9PUTLAM ; * BB62A
          BINT65 8GETLAM ROMPTR 0B3 046 #7+ #2/ #- #3+ 10PUTLAM BINT28 * BB653
          7GETLAM 11GETLAM #* ROMPTR 0B3 044 #7+ #2/ #- ROMPTR 0B3 044 #3+ * BB686
          9PUTLAM ;                              * BB6BF

* ROMPTR 0B3 026
* refs (1): BA576
~BBReReadWidth:
        :: BINT59 ROMPTR 0B3 055 case 8PUTLAM    * BB6C9
          14GETLAM ITE BINT131 BINT91            * BB6E8
          ROMPTR 0B3 047 8PUTLAM ;               * BB6FC

* ROMPTR 0B3 027
* refs (1): BA576
ROMP_0B3_027:
        :: BINT64 ROMPTR 0B3 055 case 6PUTLAM    * BB711
          18GETLAM 11GETLAM #MIN 6PUTLAM ;       * BB730

* ROMPTR 0B3 028
* refs (1): BA576
~BBRunENTERAction:
        :: BINT96 ROMPTR 0B3 055 ?SEMI           * BB749
          TRUE ;                                 * BB763

* ROMPTR 0B3 029
* refs (1): BA576
~BBRunCanclAction:
        :: BINT91 ROMPTR 0B3 055 ?SEMI           * BB76D
          TRUE ;                                 * BB787

* ROMPTR 0B3 02A
* refs (1): BA576
DoCKeyCheck:
        :: TakeOver ROMPTR 0B3 05B 16GETLAM NOT ORcase DoBadKey * BB791  ~BBEmpty?
          18GETLAM ROMPTR 0B3 040 DA2aBad? ?SEMI * BB7BA
          18GETLAM ROMPTR 0B3 04B ITE ROMPTR 0B0 080 ROMPTR 0B0 084 * BB7D4  ~BBIsChecked?
          HARDBUFF 10GETLAM 6GETLAM #1- 7GETLAM #* 9GETLAM #+ GROB! * BB7FF
          SetDA123NoCh ;                         * BB82C

* ROMPTR 0B3 02B
* refs (1): BA576
DoCKeyChAll:
        :: TakeOver ROMPTR 0B3 05B 16GETLAM NOT ORcase DoBadKey * BB836  ~BBEmpty?
          BINT0 ROMPTR 0B3 040 SetDA12a3NCh ;    * BB85F

* ROMPTR 0B3 02C
* refs (1): BA576
DoCKeyUnChAll:
        :: TakeOver ROMPTR 0B3 05B 16GETLAM NOT ORcase DoBadKey * BB879  ~BBEmpty?
          MINUSONE ROMPTR 0B3 040 SetDA12a3NCh ; * BB8A2

* ROMPTR 0B3 02D
* refs (1): BA576
DoCKeyCancel:
        :: TakeOver ROMPTR 0B3 029 NOTcase SetDA123NoCh * BB8BC  ~BBRunCanclAction
          FALSE TRUE 2PUTLAM ;                   * BB8DB

* ROMPTR 0B3 02E
* refs (1): BA576
DoCKeyOK:
        :: TakeOver ROMPTR 0B3 028 NOTcase SetDA123NoCh * BB8EF  ~BBRunENTERAction
          TRUE 2PUTLAM ROMPTR 0B3 05B caseFALSE 17GETLAM * BB90E  ~BBEmpty?
          caseFALSE 16GETLAM                     * BB92D
          NOTcase                                * BB937
          :: 18GETLAM ROMPTR 0B3 03F TRUE ;      * BB93C  ~BBGetN
          15GETLAM DUPNULLCOMP? casedrop         * BB95B
          :: 18GETLAM ROMPTR 0B3 03F ONE{}N TRUE ; * BB96A  ~BBGetN
          INNERCOMP DUP 13PUTLAM ZERO_DO ISTOP@ ROLL ROMPTR 0B3 03F LOOP * BB98E  ~BBGetN
          13GETLAM {}N TRUE ;                    * BB9BC

* ROMPTR 0B3 02F
* refs (1): BA576
~BBReDrawBackgr:
        :: BINT65 ROMPTR 0B3 055 ?SEMI           * BB9D0
          14GETLAM case BlankDA12                * BB9EA
          ROMPTR 0B3 041 case ROMPTR 0B3 042     * BB9F9
          7GETLAM 11GETLAM #* ROMPTR 0B3 044 #7+ 8GETLAM ROMPTR 0B3 046 #7+ * BBA14
          MAKEGROB HARDBUFF 10GETLAM #3- 9GETLAM ROMPTR 0B3 045 #3- GROB! * BBA48
          10GETLAM #2- 9GETLAM ROMPTR 0B3 045 #2- OVER 8GETLAM * BBA76
          ROMPTR 0B3 046 #+ #3+ OVER 7GETLAM 11GETLAM #* #+ ROMPTR 0B3 044 * BBA9F
          #3+ 4PICK 4PICK 4PICKOVER LINEON OVER 4PICKOVER 4PICK LINEON * BBAD8
          4PICKOVER 4PICKOVER LINEON 4PICKOVER OVER 6PICK LINEON OVER #1+ * BBB05
          4PICK #1+ OVER 4PICK #1+ LINEON 4ROLL #1+ SWAP #1+ ROTOVER LINEON * BBB32
          DROP ;                                 * BBB6E

* ROMPTR 0B3 030
* refs (1): BA576
LEDispPrompt:
        :: BINT66 ROMPTR 0B3 055 ?SEMI           * BBB78
          ROMPTR 0B3 031 HARDBUFF ROMPTR 0B3 043 ROMPTR 0B3 049 GROB! * BBB92
          14GETLAM ?SEMI                         * BBBBD
          ROMPTR 0B3 04C ;                       * BBBC7

* ROMPTR 0B3 031
* refs (1): BA576
ROMP_0B3_031:
        :: BINT67 ROMPTR 0B3 055 ?SEMI           * BBBD7
          14GETLAM ITE ROMPTR 0B3 032 ROMPTR 0B3 033 * BBBF1
        ;                                        * BBC11

* ROMPTR 0B3 032
* refs (1): BA576
ROMP_0B3_032:
        :: BINT68 ROMPTR 0B3 055 ?SEMI           * BBC16
          ROMPTR 0B3 034 ROMPTR 0B0 0A5 ;        * BBC30

* ROMPTR 0B3 033
* refs (1): BA576
ROMP_0B3_033:
        :: BINT69 ROMPTR 0B3 055 ?SEMI           * BBC4B
          ROMPTR 0B3 034 $>grob ;                * BBC65

* ROMPTR 0B3 034
* refs (1): BA576
ROMP_0B3_034:
        :: BINT70 ROMPTR 0B3 055 ?SEMI           * BBC7A
          21GETLAM OBJ_1A002 ;                   * BBC94

* ROMPTR 0B3 035
* refs (1): BA576
LEDispList:
        :: BINT74 ROMPTR 0B3 055 ?SEMI           * BBCA3
          ROMPTR 0B3 05B ?SEMI                   * BBCBD  ~BBEmpty?
          18GETLAM 6GETLAM #1-- 11GETLAM ZERO_DO DUP INDEX@ #+ DUP 12GETLAM * BBCCD
          #>ITE DROP                             * BBCFF
          :: INDEX@ #1+ ROMPTR 0B3 036 ; LOOP DROP ROMPTR 0B3 04F ; * BBD09  LEDispItem

* ROMPTR 0B3 036
* refs (1): BA576
LEDispItem:
        :: BINT79 ROMPTR 0B3 055 ?SEMI           * BBD42
          OVER ROMPTR 0B3 037 ROT 18GETLAM #= 17GETLAM NOTAND IT INVGROB * BBD5C  ~BBGetNGrob
          HARDBUFF 10GETLAM 4ROLL #1- 7GETLAM #* 9GETLAM #+ GROB! ; * BBD8F

* ROMPTR 0B3 037
* refs (1): BA576
~BBGetNGrob:
        :: BINT81 ROMPTR 0B3 055 ?SEMI           * BBDC1
          DUP ROMPTR 0B3 038 DUP LEN$ 8GETLAM 16GETLAM IT * BBDDB  ~BBGetNStr
          :: BINT7 #- ;                          * BBE04
          BINT6 #/ SWAPDROP DUPUNROT #>ITE       * BBE18
          :: 1_#1-SUB$ CHR_... >T$ ; DROP $>GROB 7GETLAM 8GETLAM MAKEGROB * BBE31
          DUPUNROT 16GETLAM ITE BINT7 BINT1      * BBE63
          BINT1 GROB! 16GETLAM NOTcase SWAPDROP  * BBE7C
          SWAP ROMPTR 0B3 04B NOT?SEMI           * BBE95  ~BBIsChecked?
          ROMPTR 0B0 07E OVER ZEROZERO GROB! ;   * BBEAA

* ROMPTR 0B3 038
* refs (1): BA576
~BBGetNStr:
        :: KEYINBUFFER? casedrop                 * BBEC9
          :: _chr(31)_ SetDA2bBad ;              * BBED8
          BINT82 ROMPTR 0B3 055 ?SEMI            * BBEEC
          ROMPTR 0B3 03F 20GETLAM ROMPTR 0B0 074 ; * BBF01  ~BBGetN

* ROMPTR 0B3 039
* refs (1): BA576
ROMP_0B3_039:
        :: BINT84 ROMPTR 0B3 055 ?SEMI           * BBF21
          HARDBUFF 14GETLAM ITE                  * BBF3B
          :: ZEROZERO BINT131 BINT56 ;           * BBF4A
          :: 10GETLAM #3- 9GETLAM ROMPTR 0B3 045 #3- OVER 8GETLAM * BBF63
            ROMPTR 0B3 046 #+ #7+ OVER 7GETLAM 11GETLAM #* #+ ROMPTR 0B3 044 * BBF91
            #7+ ;                                * BBFCA
          SUBGROB 5PUTLAM HARDBUFF2 TOTEMPOB 4PUTLAM ; * BBFD4

* ROMPTR 0B3 03A
* refs (1): BA576
ROMP_0B3_03A:
        :: BINT87 ROMPTR 0B3 055 ?SEMI           * BBFF2
          5GETLAM HARDBUFF 14GETLAM ITE ZEROZERO * BC00C
          :: 10GETLAM #3- 9GETLAM ROMPTR 0B3 045 #3- ; * BC025
          GROB! 4GETLAM HARDBUFF2 ZEROZERO GROB! ; * BC04E

* ROMPTR 0B3 03B
* refs (1): BA576
~BBRereadChkEnbl:
        :: BINT61 ROMPTR 0B3 055 ?SKIP FALSE     * BC06C
          16PUTLAM ;                             * BC08B

* ROMPTR 0B3 03C
* refs (1): BA576
~BBRereadFullScr:
        :: BINT60 ROMPTR 0B3 055 ?SKIP FALSE     * BC095
          14PUTLAM ;                             * BC0B4

* ROMPTR 0B3 03D
* refs (1): BA576
~BReReadMenus:
        :: BINT83 ROMPTR 0B3 055 case 13PUTLAM   * BC0BE
          17GETLAM case                          * BC0DD
          :: ' ROMPTR 0B3 005 13PUTLAM ;         * BC0E7  ~ChooseMenu0
          16GETLAM ITE                           * BC106
          :: ' ROMPTR 0B3 007 ;                  * BC110  ~ChooseMenu2
          :: ' ROMPTR 0B3 006 ;                  * BC12A  ~ChooseMenu1
          13PUTLAM ;                             * BC144

* ROMPTR 0B3 03E
* refs (1): BA576
~BBReReadNElems:
        :: BINT62 ROMPTR 0B3 055 case 12PUTLAM   * BC14E
          19GETLAM LENCOMP 12PUTLAM ;            * BC16D

* ROMPTR 0B3 03F
* refs (1): BA576
~BBGetN:
        :: OBJ_64C34 ROMPTR 0B3 055 ?SEMI        * BC181
          19GETLAM SWAP OBJ_1A01B OBJ_1A002 ;    * BC19B

* ROMPTR 0B3 040
* refs (1): BA576
ROMP_0B3_040:
        :: BINT86 ROMPTR 0B3 055 ?SEMI           * BC1B4
          BINT0 #=casedrop                       * BC1CE
          :: 12GETLAM #1+_ONE_DO INDEX@ LOOP 12GETLAM {}N 15PUTLAM ; * BC1D8
          MINUSONE #=casedrop                    * BC205
          :: NULL{} 15PUTLAM ;                   * BC20F
          15GETLAM SWAP 2DUP #=POSCOMP DUP#0= ITE * BC223
          :: DROP >TCOMP ;                       * BC241
          :: SWAPDROPSWAP DUP BINT1 4PICK #1- SUBCOMP SWAPROT #1+ OVER * BC255
            LENCOMP SUBCOMP &COMP ;              * BC287
          15PUTLAM ;                             * BC29B

* ROMPTR 0B3 041
* refs (1): BA576
ROMP_0B3_041:
        :: 8GETLAM ROMPTR 0B3 046 BINT91 #<> caseFALSE 11GETLAM * BC2A5
          7GETLAM #* BINT9 #/ SWAP #0<> casedrop FALSE * BC2CE
          DUP BINT1 #> BINT5 ROMPTR 0B3 056 ?SKIP #1+ * BC2F6
          ROT #> AND ;                           * BC31F

* ROMPTR 0B3 042
* refs (1): BA576
ROMP_0B3_042:
        ::                                       * BC333
          { ROMPTR 0B3 05C                       * BC338  ~BBGetDefltHeight
            ROMPTR 0B3 060 ROMPTR 0B3 05D ROMPTR 0B3 061 ROMPTR 0B3 05E * BC348  sysCHOOSE
            ROMPTR 0B3 062 ROMPTR 0B3 05F }      * BC374  ~$>grobOrGROB
          11GETLAM 7GETLAM #* BINT9 #/ SWAPDROP #2- #2* #1+ ROMPTR 0B3 056 * BC38F
          IT #1+                                 * BC3C7
          OBJ_1A01B HARDBUFF 10GETLAM #3- 9GETLAM ROMPTR 0B3 045 #3- GROB! ; * BC3D1

* ROMPTR 0B3 043
* refs (1): BA576
ROMP_0B3_043:
        :: 10GETLAM 9GETLAM BINT8 #- ;           * BC404

* ROMPTR 0B3 044
* refs (1): BA576
ROMP_0B3_044:
        :: ROMPTR 0B3 056 NOT?SEMI               * BC422
          BINT8 #+ ;                             * BC437

* ROMPTR 0B3 045
* refs (1): BA576
ROMP_0B3_045:
        :: ROMPTR 0B3 056 NOT?SEMI               * BC446
          BINT8 #- ;                             * BC45B

* ROMPTR 0B3 046
* refs (1): BA576
ROMP_0B3_046:
        :: ROMPTR 0B3 048 NOT?SEMI               * BC46A
          BINT6 #+ ;                             * BC47F

* ROMPTR 0B3 047
* refs (1): BA576
ROMP_0B3_047:
        :: ROMPTR 0B3 048 NOT?SEMI               * BC48E
          BINT6 #- ;                             * BC4A3

* ROMPTR 0B3 048
* refs (1): BA576
ROMP_0B3_048:
        :: 12GETLAM 11GETLAM #> ;                * BC4B2

* ROMPTR 0B3 049
* refs (1): BA576
ROMP_0B3_049:
        :: BINT8 8GETLAM ROMPTR 0B3 046 MAKEGROB HARDBUFF ROMPTR 0B3 043 * BC4CB
          GROB! ;                                * BC4FA

* ROMPTR 0B3 04A
* refs (1): BA576
ROMP_0B3_04A:
        :: 16GETLAM NOT?SEMI                     * BC504
          18GETLAM DUPTYPEBINT? casedrop         * BC513
          :: NULL{} 15PUTLAM ;                   * BC522
          DUP CARCOMP 18PUTLAM CDRCOMP 15PUTLAM ; * BC536

* ROMPTR 0B3 04B
* refs (1): BA576
~BBIsChecked?:
        :: 15GETLAM SWAP #=POSCOMP #0<> ;        * BC554

* ROMPTR 0B3 04C
* refs (1): BA576
ROMP_0B3_04C:
        :: 10GETLAM 9GETLAM #2- OVER 8GETLAM ROMPTR 0B3 046 #1-+ OVER LINEON ; * BC572

* ROMPTR 0B3 04E
* refs (2): BA576 BA576
ROMP_0B3_04E:
        :: DA2bBad? caseDROP 17GETLAM            * BC5AF
          caseDROP 10GETLAM                      * BC5C3
          9GETLAM ROT #1- 7GETLAM #* #+ 2DUP OVER 8GETLAM #+ OVER 7GETLAM #+ * BC5CD
          HARDBUFF 5UNROLL SUBGROB INVGROB 3UNROLL HARDBUFF 3UNROLL GROB! ; * BC60E

* ROMPTR 0B3 04F
* refs (1): BA576
ROMP_0B3_04F:
        :: ROMPTR 0B3 048 NOT?SEMI               * BC63B
          ROMPTR 0B3 050 ITE ROMPTR 0B3 052      * BC650  ~BBUpArrow
          ROMPTR 0B3 054                         * BC66B  ~BBSpace
          HARDBUFF 10GETLAM 8GETLAM #+ #1+ DUP4UNROLL 9GETLAM #1+ GROB! * BC676
          ROMPTR 0B3 051 ITE ROMPTR 0B3 053      * BC6A3  ~BBDownArrow
          ROMPTR 0B3 054                         * BC6BE  ~BBSpace
          HARDBUFF ROT 9GETLAM 11GETLAM #1- 7GETLAM #* #+ #1+ GROB! ; * BC6C9

* ROMPTR 0B3 050
* refs (1): BA576
ROMP_0B3_050:
        :: 18GETLAM 6GETLAM #> ;                 * BC700

* ROMPTR 0B3 051
* refs (1): BA576
ROMP_0B3_051:
        :: 12GETLAM 18GETLAM #- 11GETLAM 6GETLAM #- #> ; * BC719

* ROMPTR 0B3 052
* refs (1): BA576
~BBUpArrow:
        :: $ "↑" $>GROB ;                        * BC746

* ROMPTR 0B3 053
* refs (1): BA576
~BBDownArrow:
        :: $ "↓" $>GROB ;                        * BC761

* ROMPTR 0B3 054
* refs (1): BA576
~BBSpace:
        :: $ " " $>GROB ;                        * BC77C

* ROMPTR 0B3 055
* refs (1): BA576
ROMP_0B3_055:
        :: 22Lget EVAL ;                         * BC797

* ROMPTR 0B3 056
* refs (1): BA576
ROMP_0B3_056:
        :: 21GETLAM OBJ_1A002 NULL$? NOT ;       * BC7AB

* ROMPTR 0B3 057
* refs (1): BA576
ROMP_0B3_057:
        :: DA1IsStat? DA2bEdit? DA1Bad? DA2aBad? DA2bBad? DA3Bad? BINT6 {}N ; * BC7C9

* ROMPTR 0B3 058
* refs (1): BA576
ROMP_0B3_058:
        :: INCOMPDROP ITE SetDA3Bad ClrDA3Bad    * BC7FB
          ITE SetDA2bBad ClrDA2bBad              * BC814
          ITE SetDA2aBad ClrDA2aBad              * BC823
          ITE SetDA1Bad ClrDA1Bad                * BC832
          ITE SetDA2bEdit ClrDA2bEdit            * BC841
          ITE SetDA1IsStat ClrDA1IsStat          * BC850
        ;                                        * BC85F

* ROMPTR 0B3 059
* refs (1): BA576
~BBPgDown:
        :: 17GETLAM NOT?SEMI                     * BC864
          18GETLAM 11GETLAM 12GETLAM #MIN DUPUNROT 6GETLAM #- #+ 18PUTLAM * BC873
          6PUTLAM ;                              * BC8A0

* ROMPTR 0B3 05A
* refs (1): BA576
~BBPgUp:
        :: 17GETLAM NOT?SEMI                     * BC8AA
          18GETLAM 6GETLAM #1- #- 18PUTLAM BINT1 6PUTLAM ; * BC8B9

* ROMPTR 0B3 05B
* refs (1): BA576
~BBEmpty?:
        :: 12GETLAM #0= ;                        * BC8E1

* ROMPTR 0B3 05C
* refs (1): BA576
~BBGetDefltHeight:
        GROB    "images/BC8F5-_BBGetDefltHeight.png" * BC8F5  98 x 25

* ROMPTR 0B3 05D
* refs (1): BA576
ROMP_0B3_05D:
        GROB    "images/BCB93.png"               * BCB93  98 x 34

* ROMPTR 0B3 05E
* refs (1): BA576
ROMP_0B3_05E:
        GROB    "images/BCF1B.png"               * BCF1B  98 x 43

* ROMPTR 0B3 05F
* refs (1): BA576
~$>grobOrGROB:
        GROB    "images/BD38D-___grobOrGROB.png" * BD38D  98 x 52
