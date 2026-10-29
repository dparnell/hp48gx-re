* HP 48GX ROM revision R, #6C186-#6F35F: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Push3Zeros EqwFontWidth EqwFontHeight 2DUPHALF DUP#2- EqwImplicit()? #-Floor0 'LB 'TE 'LE 'EL 'ManOp
* Follows on from the previous file (at #6C186 in the original ROM).
        RPL

* refs (1): 6BB40
OBJ_6C186:
        :: OBJ_6BFF6                             * 6C186

* refs (1): 6C3B6
OBJ_6C190:
          :: OBJ_6BBFE ?SEMI                     * 6C190
            RDROP OBJ_6BBD6 OBJ_6BC2D OBJ_6CB25 OBJ_6C555 OBJ_6B894 ; * 6C19F

* refs (1): 6B5A1
ObEdit~2:
          :: EqwBoxCount OBJ_6773D OBJ_673D6 #+ #1+NDROP OBJ_673E6 OBJ_673D6 * 6C1C2
            #- ;                                 * 6C1EA
          OBJ_6AFF0 EqwImplicit()? OBJ_6CC32 SWAP OBJ_6C2C1 OBJ_6B200 * 6C1F4
          :: casedrop OBJ_6C2C1                  * 6C212

* refs (1): 6BEBB
OBJ_6C221:
            :: 10GETLAM DUP DUPLEN$ SUB$1# BINT32 OBJ_6E433 OBJ_6B359 ; ; * 6C221
          10PUTLAM OBJ_6AE42 ;                   * 6C253

* refs (1): 6BB54
OBJ_6C262:
        :: OBJ_6B934 OBJ_6C555 OBJ_6B74F         * 6C262

* refs (1): 6AD70
OBJ_6C276:
          :: OBJ_677EA DEPTH #1- #< ?SEMI        * 6C276
            RDROP # 201                          * 6C294
* The Very Big List names this address <00201h4A9 RPL ArF15h : CNTR, but it is a pointer inside an object; the name is not used
            OBJ_6BC2D ;                          * 6C2A3
          OBJ_677EA #1+PICK OBJ_6E026 IT         * 6C2AD

* refs (5): 69DA7 6AB09 6BEA7 6C208 6C21C
OBJ_6C2C1:
          :: EDITDECOMP$ OBJ_6B31D ;             * 6C2C1
          DUPTYPECSTR? NOTcasedrop OBJ_6AD84     * 6C2D5
          OBJ_6AE6F DROP                         * 6C2E4

* refs (1): 6ADE3
OBJ_6C2EE:
          :: OBJ_113C2 #5- OBJ_113D2             * 6C2EE

* refs (10): 69D84 69D93 69D9D 6A528 6ABFE 6AC21 ...
OBJ_6C302:
            :: MINUSONE OBJ_67682 DROP ; ;       * 6C302
          OBJ_6BF8D ;                            * 6C320

* refs (1): 6B9FC
OBJ_6C32A:
        :: 13GETLAM BINT22                       * 6C32A

* refs (11): 469B9 48530 4858A 4B71F 66697 DDF41 ...
* #a #b -> #a-#b if a > b, else #0
#-Floor0:
          :: 2DUP#> NOTcase2drop BINT0           * 6C339
            #- ;                                 * 6C34D
          LEFTCOL OBJ_6B934                      * 6C357

* refs (3): 6B93E 6BA15 6CB66
OBJ_6C361:
          :: 12GETLAM 13GETLAM BINT26 GETLAM XYGROBDISP NULLPAINT BINT26 * 6C361
            PUTLAM ;                             * 6C389
          OBJ_4CE83 TURNMENUON WINDOWXY OBJ_6C954 ; * 6C393

* refs (1): 6BB0E
OBJ_6C3AC:
        :: OBJ_6BFF6 OBJ_6C190 BINT23 GETLAM IT SetAppMode * 6C3AC
          OBJ_6B939 OBJ_6B79A                    * 6C3CF

* refs (1): 6B54C
ObEdit~3:
          :: OBJ_6731D OBJ_0C4E3 ZERO_DO #1+ DUPPICK OBJ_6B2AA xPREDIV IT * 6C3D9
            :: dup;drop(s) ' x/ OVER UNROLL ;    * 6C406
            LOOP DROP OBJ_461D7 OBJ_67D1B OBJ_69B49 ClrDAsOK DispMenu * 6C429
            PutGNTData ;                         * 6C44C
        ;                                        * 6C456

* refs (2): 50519 50528
0->grob(_)~1:
        :: POLSaveUI ERRSET                      * 6C45B
          :: ERRSET                              * 6C46A

* refs (1): 6C51E
Symb>HBuff~3:
            :: SetDA3NoCh FALSE                  * 6C474

* refs (1): 6B524
ObEdit~4:
              :: TOADISP CLEARVDISP OBJ_6CC21 NULL$SWAP OBJ_6C550 * 6C483

* refs (3): 69D24 6AD75 6B165
OBJ_6C4A1:
                :: OBJ_677EA #1+PICK ; ;         * 6C4A1

* refs (1): 6B533
ObEdit~5:
              :: OBJ_68972 OBJ_666D3 OBJ_6AE6F DROP ; ; * 6C4BA
            ERRTRAP 0->grob(_)~2 HARDBUFF TOTEMPOB OBJ_6A95B OBJ_6C8CD ; * 6C4DD
          ERRTRAP POLResUI&Err POLRestoreUI ;    * 6C500

* refs (1): 659ED
Symb>HBuff~1:
        :: ERRSET Symb>HBuff~3 ERRTRAP           * 6C514

* refs (1): 6C4E2
0->grob(_)~2:
          :: OBJ_6CC32 OBJ_6C8CD ERRJMP ; OBJ_6CC32 Symb>HBuff~2 ; * 6C528

* refs (4): 69D0B 6AE65 6B4B6 6C49C
OBJ_6C550:
        ::                                       * 6C550

* refs (7): 698C4 6AADC 6BE2A 6C159 6C1B3 6C26C ...
OBJ_6C555:
          :: NULL{} OBJ_681D8 ; BINT15 OBJ_6748B BINT30 OBJ_67458 BINT6 DUP * 6C555
          OBJ_6749B OBJ_674AB BINT0 OBJ_6746B BINT15 OBJ_6747B BINT2 * 6C587
          EqwCurBox! NULL$ ZEROFALSE FalseFalse 6ROLL FALSE ZEROZERO * 6C5AA
          NULLPAINT 'NOP TRUE AppMode? ClrAppMode NULLPAINT 'NOP ZEROFALSE * 6C5CD
          BINT0 TrueFalse BINT22 BINT0 2DUP OBJ_25F4E BINT26 ROLL BINT1 * 6C5F5
          NULL$ #ZERO#SEVEN NDUPN DROP           * 6C622
          { NULLLAM                              * 6C636

'L:
            LAM 'L                               * 6C640

'raw:
            LAM 'raw                             * 6C64B

'LA:
            LAM 'LA NULLLAM                      * 6C65A

* refs (1): 6A91A
'KO:
            LAM 'KO                              * 6C66C

* refs (8): 4DA62 4EC4E 4EC80 69BA6 6AC44 6ACE9 ...
'EL:
            LAM 'EL NULLLAM NULLLAM              * 6C679

'S:
            LAM 'S                               * 6C690

* refs (4): 69C98 69E56 69E75 69E9D
'ManOp:
            LAM 'ManOp                           * 6C69B

'nohalt:
            LAM 'nohalt NULLLAM                  * 6C6AE

* refs (2): 6F5B8 6FD70
'NG:
            LAM 'NG                              * 6C6C8

'EXITFCN:
            LAM 'EXITFCN                         * 6C6D5

* refs (1): 3F25B
'FontGauge:
            LAM 'FontGauge                       * 6C6EC

* refs (8): 69B8D 6B0CA 6FC26 6FC4A 6FC59 6FC7C ...
'LE:
            LAM 'LE                              * 6C707

* refs (9): 25C28 69B63 69EC5 69EE3 6A163 6AC6C ...
'LB:
            LAM 'LB                              * 6C714

* refs (8): 69B78 6B0BA 6FC9B 6FCD3 6FCE7 6FD0A ...
'TE:
            LAM 'TE                              * 6C721

* refs (3): 69B97 69BD8 69BE7
'FOK:
            LAM 'FOK                             * 6C72E

'pr:
            LAM 'pr                              * 6C73D

'pc:
            LAM 'pc                              * 6C74A

'cy:
            LAM 'cy                              * 6C757

'cx:
            LAM 'cx NULLLAM                      * 6C764

* refs (1): 6C931
'source:
            LAM 'source NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM * 6C776

* refs (1): 69C7E
'ploc:
            LAM 'ploc NULLLAM                    * 6C7A9

* refs (2): 6B073 6B096
'unbound:
            LAM 'unbound }                       * 6C7BF
          BIND ClrDA1IsStat                      * 6C7DB

* refs (1): 6780B
OBJ_6C7E5:
          CHR "?" BINT45 ZERO_DO                 * 6C7E5

* refs (1): 67625
OBJ_6C7F6:
          { }                                    * 6C7F6
* The Very Big List names this address {}, but it is a pointer inside an object; the name is not used
          LOOP                                   * 6C800
          { }                                    * 6C805
* The Very Big List names this address {}, but it is a pointer inside an object; the name is not used
          DEPTH OBJ_68183 OBJ_67648 BINT1 OBJ_285C6 DROP OBJ_67532 NULLHXS * 6C80F
          BINT30 OBJ_6869D EXPAND OBJ_681B1 #TWO#TWO Push3Zeros Push3Zeros * 6C837
          NULLPAINT                              * 6C85A

* refs (4): 660B6 6D2AD 6D706 6DD3C
OBJ_6C85F:
          :: EqwFontWidth EqwFontHeight ;        * 6C85F

* refs (16): 44E08 65A92 65B28 65FD0 660BB 66421 ...
* #w #h -> #w #h #w/2 #h/2
2DUPHALF:
          :: 2DUP 2/(s);swap;2/(s) SWAP ; BINT0 BINT22 BINT1 EqwNewBox * 6C873
          OBJ_6D909 BINT1 OBJ_6DAE9 BINT0 OBJ_67426 OBJ_69BBA ; * 6C8A0

* refs (1): 6B4DE
OBJ_6C8C3:
        :: RDROP                                 * 6C8C3

* refs (4): 6B579 6B5B0 6C4F6 6C532
OBJ_6C8CD:
          :: OBJ_6CC32                           * 6C8CD

* refs (1): 6C546
Symb>HBuff~2:
            :: OBJ_677DE ClrDAsOK BINT23 GETLAM IT SetAppMode * 6C8D7
              InitEd&Modes OBJ_6C555 NULLHXS OBJ_681B1 ; * 6C8FA
            RECLAIMDISP ;                        * 6C913
          ERROR@ #0=?SEMI                        * 6C91D
ObEdit~6:
          OBJ_18295 ' 'source DRPExitAtLOOP ?SKIP ERRSET * 6C927
          CK0NOLASTWD ERRJMP ;                   * 6C945

* refs (5): 6B6A5 6BA1F 6BFDD 6C3A2 6CC01
OBJ_6C954:
        :: BINT30 GETLAM NOT?SEMI                * 6C954
          12GETLAM 13GETLAM 2DUP                 * 6C968
          :: OBJ_673BB DUP#0=csedrp BigCursor BINT1 #=case MediumCursor * 6C977
            SmallCursor ;                        * 6C99A
          XYGROBDISP OBJ_6F42D BINT26 PUTLAM     * 6C9A4
          :: WINDOWCORNER 3PICK ROT #< IT        * 6C9B8
            :: 2DUP WINDOWXY ;                   * 6C9D6
            3PICKOVER #< IT                      * 6C9EA
            :: TOPROW 4PICK WINDOWXY ;           * 6C9F9
            EqwFontHeight EqwFontWidth 5ROLL #+ SWAP4ROLL #+ BOTROW 2DUP#> * 6CA12
            ITE                                  * 6CA3A
            :: #- TOPROW #1-+ LEFTCOL WINDOWXY ; 2DROP * 6CA3F
            BINT130 ROT#+ 2DUP#> NOTcase2DROP #- * 6CA67
            LEFTCOL #1-+ TOPROW SWAP WINDOWXY ;  * 6CA80
        ;                                        * 6CA9E

* refs (1): 3F26A
OBJ_6CAA3:
        ::                                       * 6CAA3

* refs (3): 6B68C 6C005 6E5D7
OBJ_6CAA8:
          :: 9GETLAM 10GETLAM LEN$ #> ; casedrop DoBadKey * 6CAA8

* refs (2): 6B76D 6CB6B
OBJ_6CAD0:
          :: 10GETLAM 9GETLAM LAST$ ; DUPLEN$ SUB$1# DUPUNROT OBJ_3F2D3 * 6CAD0
          DUPUNROT EQUAL casedrop DoBadKey       * 6CAFD
          #>CHR CHR>$ OBJ_6E5E6 OBJ_6BF8D        * 6CB11

* refs (5): 6B98E 6BF7E 6C15E 6C1AE 6E604
OBJ_6CB25:
          :: FALSE 17PUTLAM ;                    * 6CB25

* refs (3): 6B6BE 6B993 6E613
OBJ_6CB39:
          ::                                     * 6CB39

* refs (4): 6B69B 6B9CA 6BFB5 6E609
OBJ_6CB3E:
            :: KEYINBUFFER? NOTcaseFALSE 17GETLAM * 6CB3E
            ;                                    * 6CB52
            ?SEMI                                * 6CB57
            TRUE 17PUTLAM OBJ_6C361 OBJ_6CAD0    * 6CB5C

* refs (7): 65CF1 66269 69A1D 6D62F 6D9E5 6E483 ...
OBJ_6CB70:
            :: tok* EQUALcasedrop                * 6CB70
              :: OBJ_673BB #>1 case OBJ_4B95E    * 6CB7F
                OBJ_66F6D ;                      * 6CB98
              OBJ_673BB DUP#0=csedrp $>BIGGROB #1=case $>GROB * 6CBA2
              $>grob ;                           * 6CBBB
            DUPGROBDIM DUPROT ~BINT27;PUTLAM BINT28 PUTLAM 14GETLAM #+ * 6CBC5
            12PUTLAM 14GETLAM 15GETLAM ROT XYGROBDISP OBJ_6C954 ; * 6CBE8
        ;                                        * 6CC0B

* refs (12): 1AFFA 1B0EB 1B3CE 28EE3 29028 6B03B ...
* -> flag: implicit parentheses are on (internal flag #10B)
EqwImplicit()?:
        CON(5)  (*)+5                            * 6CC10  primitive code object
        ASSEMBLE
        LC(3)   #10B                             * 6CC15
        GOVLNG  L_539E6                          * 6CC1A

* refs (6): 6B059 6B26E 6B287 6B4C5 6BA7E 6C492
OBJ_6CC21:
        CON(5)  (*)+5                            * 6CC21  primitive code object
        LC(3)   #10B                             * 6CC26
        GOVLNG  SetISysFlag                      * 6CC2B

* refs (8): 38615 6B040 6B07D 6BA65 6C1FE 6C52D ...
OBJ_6CC32:
        CON(5)  (*)+5                            * 6CC32  primitive code object
        LC(3)   #10B                             * 6CC37
        GOVLNG  L_539F1                          * 6CC3C
        RPL

* refs (1): 6BCBD
OBJ_6CC43:
        :: TakeOver WINDOWCORNER ABUFF ZEROZERO BINT131 # 38 SUBGROB * 6CC43
          3NULLLAM{} BIND REDISPHBUFF ROMPTR 0B2 002 3GETLAM 2GETLAM 1GETLAM * 6CC70
          ABND ZEROZERO ROT XYGROBDISP WINDOWXY DispMenu.1 ; * 6CC99
        BSS     1                                * 6CCBC  zeros

* refs (1): 1BB25
OBJ_6CCBD:
        :: SKIP OBJ_6DFFD                        * 6CCBD

* refs (8): 1AC70 1ADCC 1AED9 1FB18 68E13 6CDEE ...
OBJ_6CCCC:
          :: SKIP OBJ_6DFFD DROP ZEROZERO EqwCurBox@ EqwBoxCount#3+ DUP#1- * 6CCCC
            BINT2 ZEROZERO 22Lget OBJ_6CF3D OBJ_6DA4E EqwBoxCount#3+ * 6CCF4
            OBJ_6CFB5 BINT19 PICK #+ OBJ_6D573 ZEROZERO EqwBoxCount#1+ * 6CD12
            ZEROOVER #1+ OBJ_6D163 OBJ_6D4CE EqwBoxCount#1- DUP#1+ ; * 6CD35
          OBJ_6799C OBJ_6D523 3PICKSWAP EqwBoxLast! OVER OBJ_67A98 * 6CD58
          EqwFontWidth #- OBJ_67BAE OVERDUP OBJ_67AD5 EqwFontWidth #2/ #- * 6CD76
          OBJ_67C09 #1-                          * 6CD9E

* refs (1): 6D113
OBJ_6CDA8:
          :: OBJ_673A2 #1+ OBJ_67458 EqwBoxCount#1- OBJ_6746B OBJ_674D6 * 6CDA8
            ROLLDROP OBJ_6C302 ;                 * 6CDCB
        ;                                        * 6CDDA

* refs (1): 1AFDC
OBJ_6CDDF:
        :: SKIP OBJ_6DFFD OBJ_6CCCC OVER DUPTWO OBJ_67C85 BINT3 EqwCurBox@ * 6CDDF
          OBJ_67A9D #2+ BINT2 OVER OBJ_66FF1 3UNROLL OBJ_6DA4E OBJ_67371 * 6CE0C
          OBJ_6822C BINT1 OBJ_67371 OBJ_685B2 EqwCurBox@ OBJ_67ABC OVER #2/ * 6CE34
          #1+ OVER #1+ 5PICK 3UNROLL OBJ_67C23 OBJ_6D779 #+ SWAP#1+SWAP * 6CE5C
          SWAP#1+SWAP                            * 6CE89

* refs (4): 44E26 669CE 6DB5C 6DBC0
OBJ_6CE8E:
          :: 3PICKSWAP OBJ_67BBB OBJ_67BAE ; EqwImplicit()? NOT?SEMI * 6CE8E
          EqwBoxCount BINT4 EqwBox#18! ;         * 6CEB1

* refs (1): 1FB76
OBJ_6CEC5:
        :: SKIP OBJ_6E23F EqwBoxCount#2+ DUP#1+ OBJ_6CFB5 3DROP OBJ_6D7DD * 6CEC5
          EqwFontHeight OBJ_6DA26 2DUPHALF       * 6CEED

* refs (1): 6DC15
OBJ_6CEFC:
          :: OBJ_6D990                           * 6CEFC
L_6CF06:
            BINT15 ROLL OBJ_68283 ;              * 6CF06
          EqwBoxCount#3+ EqwBoxCount#2+ EqwCurBox@ ONEONE BINT3 OBJ_6D7DD * 6CF1A
          OBJ_66FF1                              * 6CF38

* refs (4): 44E03 6CD03 6D023 6D9EA
OBJ_6CF3D:
          :: DUPGROBDIM SWAP ; OBJ_6DA4E EqwNewLeafBox EqwBoxCount BINT0 * 6CF3D
          OBJ_6F199 OBJ_6DAE9 Push3Zeros EqwBoxCount#1- EqwCurBox@ OBJ_6D163 * 6CF65
          EqwNewBox OBJ_6D5EB ;                  * 6CF83

* refs (2): 6D10E 6DF0A
OBJ_6CF92:
        :: SKIP OBJ_6E109                        * 6CF92

* refs (2): 65A60 6D66B
OBJ_6CFA1:
          :: EqwBoxCount#1+ DUP#2+ SWAP          * 6CFA1

* refs (5): 65F12 663FE 6CD12 6CEDE 6D3FC
OBJ_6CFB5:
            :: EqwCurBox@ OBJ_6DDD3 ; ;          * 6CFB5
          3DROP 22Lget GROBDIM EqwFontWidth #12+ #+ SWAP #2+ 2DUPHALF * 6CFCE
          OBJ_6D8DC Push3Zeros EqwBoxCount#2+ EqwCurBox@ OBJ_6D9C2 * 6CFFB

* refs (3): 6D5C8 6D63E 6DED2
OBJ_6D014:
          :: BINT0 22Lget OBJ_6CF3D OBJ_6DA4E ; ZEROZERO EqwBoxCount#1+ DUP * 6D014
          #3+ OBJ_6F199                          * 6D041

* refs (2): 6D44C 6D6C5
OBJ_6D04B:
          :: #ZERO#ONE OBJ_6D779 OBJ_44C4B       * 6D04B
L_6D05F:
            BINT6 OBJ_6D779 OBJ_6DA4E ;          * 6D05F
          OBJ_6D451 #4+ BINT0 EqwCurBox@         * 6D073

* refs (2): 6D6DE 6D945
OBJ_6D087:
          :: Push3Zeros OBJ_6D779 BINT6 MAKEGROB GOTO L_6D05F ; OBJ_6D4CE * 6D087
          EqwBoxCount#1- DUP#1+ EqwCurBox@ OBJ_6D163 EqwNewLeafBox OBJ_6D5EB ; * 6D0B4

* refs (3): 1F6C2 692E7 6DF03
OBJ_6D0D7:
        :: SKIP OBJ_6E352 OBJ_6D0FF ;            * 6D0D7

* refs (1): 6DF18
OBJ_6D0F0:
        :: SKIP OBJ_6E195                        * 6D0F0

* refs (2): 6D0E6 6DF11
OBJ_6D0FF:
          :: SKIP OBJ_6E177 OBJ_6CF92 OBJ_6CDA8 #1+ DUPDUP #3- DUP#1+ 5PICK * 6D0FF
            MINUSONE                             * 6D131

* refs (8): 65C18 65C3B 65C54 65D41 65DF5 6D16D ...
OBJ_6D136:
            :: BINT0 OBJ_6DD2D ; DROPONE EqwNewBox ZEROZERO ZEROZERO * 6D136
            EqwBoxCount                          * 6D15E

* refs (6): 66520 6CD3F 6CF7E 6D0C3 6D71A 6D85F
OBJ_6D163:
            :: BINT3 OBJ_6D136 ; EqwNewBox EqwBoxCount ; * 6D163
        ;                                        * 6D186

* refs (1): 1B0C8
OBJ_6D18B:
        :: SKIP OBJ_4B882 OBJ_69188 OBJ_26BED OBJ_6BFBA * 6D18B
          :: ROTROT2DROP #1= ?SEMI               * 6D1A9
            EqwCurBox@ EqwBoxLast@               * 6D1BD

* refs (3): 6F1D0 6F2F7 6F37E
OBJ_6D1C7:
            :: OBJ_68452 OBJ_6B2AA OBJ_65A38 ; ?SEMI * 6D1C7
            OBJ_6D37F ;                          * 6D1E5
          OBJ_6CCCC DROP DUP#1- OBJ_44E3F OBJ_44DFE EqwBoxCount DUPTWO * 6D1EF
          OBJ_67C85 DUP MINUSONE EqwBox#18! DUP DUP#2+ EqwBoxFirst! DUP * 6D212
          DUP#1+ EqwBoxLast! OBJ_6DFDE EqwCurBox@ OBJ_67AAA EqwFontHeight * 6D23A
          #2- #+ 3PICKSWAP OBJ_67BBB OBJ_67AE2 EqwFontHeight #2- #+ * 6D258
          OBJ_67C16 OBJ_6E00B DUP #3+ BINT0 3pick;1+(s) BINT0 BINT2 BINT0 * 6D280
          OBJ_6C85F #2- 2DUPSWAP MAKEGROB 3UNROLL OVER #2/ EqwCurBox@ * 6D2AD
          OBJ_67AE2 Push3Zeros EqwNewLeafBox OBJ_6DFDE ZEROOVER #2+ 3PICK * 6D2D5
          #1+ BINT4 OBJ_6DAE9 DUP DUP#1+ OBJ_67AAF OBJ_67BBB DUP DUP#1+ * 6D2F8
          OBJ_44D9A OBJ_6E00B DUPDUP OBJ_67A9D EqwFontWidth #-DUP 3PICKSWAP * 6D325
          OBJ_67BAE #2/ OBJ_67C09 OBJ_6DFDE EqwBoxCount EqwImplicit()? ?SEMI * 6D348
          DUP BINT3 EqwBox#18! ;                 * 6D36B

* refs (2): 6AAD7 6D1E5
OBJ_6D37F:
        :: EqwCurBox@ DUP EqwBoxCount#3+ DUP#1+ EqwBoxCount#2+ * 6D37F

* refs (11): 65B91 65F9E 66043 660B1 66449 664C6 ...
* Probably: EquationWriter: -> #-1 #0 #0 NULLPAINT, the arguments of EqwNewBox for a plain box
OBJ_6D39D:
          :: MINUSONE ZEROZERO NULLPAINT ; ZEROZERO BINT10 PICK DUP * 6D39D
          OBJ_67AD5 SWAP OBJ_67AE2 SWAP #6+ SWAP OBJ_6D909 EqwNewBox * 6D3CA
          EqwBoxCount#3+ DUP#1- OBJ_6CFB5 BINT11 ROLLDROP EqwFontWidth #2* * 6D3F2
          #+ ROT #2+ OVER #2/ 4ROLL OBJ_6D909 Push3Zeros EqwBoxCount DUP#1+ * 6D415
          BINT1 OBJ_6D04B                        * 6D447

* refs (5): 65BFF 660CA 6D073 6D715 6D931
OBJ_6D451:
          :: ZEROZERO EqwBoxCount ; BINT0 EqwBoxCount#1+ OBJ_6D990 * 6D451
          EqwCurBox@ OBJ_67AAF #2+ DUP           * 6D474

* refs (1): 6E13B
OBJ_6D488:
          :: OBJ_6FDC6 OBJ_4B97E BINT6 MAKEGROB OBJ_671B0 ; BINT6 ROT BINT3 * 6D488
          EqwBoxCount OBJ_67AE2 #1+ Push3Zeros   * 6D4BA

* refs (10): 65C59 66025 6608E 66525 6CD44 6D0AF ...
OBJ_6D4CE:
          :: OBJ_685DD OBJ_6860A SWAPROT         * 6D4CE

* refs (3): 682EA 6D500 6D505
OBJ_6D4E2:
            :: OBJ_674D6 #1- UNROLL OBJ_6A96F ; OBJ_6D4E2 OBJ_6D4E2 ; * 6D4E2
          OBJ_67371 EqwCurBox@ OBJ_6DF1D DUP     * 6D50F

* refs (9): 66363 663C2 66589 6CD5D 6E2B2 6E4D8 ...
OBJ_6D523:
          :: DUPZERO EqwBoxNext! ; EqwBoxCount #3- OBJ_67BC8 OBJ_6681A DROP * 6D523
          OBJ_67371 EqwCurBox! ;                 * 6D550

* refs (3): 1A9F4 1ACF6 6D613
OBJ_6D55F:
        :: SKIP OBJ_6DFFD OBJ_6D666              * 6D55F

* refs (1): 6CD26
OBJ_6D573:
          :: EqwFontWidth #+ DUP4UNROLL #2/ SWAP OBJ_6D909 ; * 6D573

* refs (1): 6D76F
OBJ_6D59B:
          :: BINT15 ROLL OBJ_68283 Push3Zeros EqwBoxCount#2+ EqwCurBox@ * 6D59B
            OBJ_6D9C2 ;                          * 6D5BE
          OBJ_6D014 EqwNewBox EqwBoxCount BINT0 EqwCurBox@ BINT1 OBJ_6DAE9 * 6D5C8

* refs (8): 65C86 660ED 6652A 6CF88 6D0CD 6D869 ...
OBJ_6D5EB:
          :: EqwCurBox@ EqwBoxCount ; ;          * 6D5EB

* refs (1): 1E8C6
OBJ_6D604:
        :: SKIP OBJ_6DFFD OBJ_6D55F              * 6D604

NOT_6D618:
          $ "NOT "                               * 6D618

* refs (5): 68DF0 68E63 68EC7 692E2 6DEA5
OBJ_6D62A:
          :: OBJ_6CB70 22PUTLAM ; OBJ_6D014 EqwBoxCount#1- OBJ_6822C OVER * 6D62A
          BINT24 OBJ_67BAE ;                     * 6D652

* refs (1): 69160
OBJ_6D661:
        ::                                       * 6D661

* refs (3): 6D56E 6D747 6D8A0
OBJ_6D666:
          :: OBJ_6CFA1 BINT13 ROLL #1- BINT13 UNROLL ; DUP #2* 4UNROLL * 6D666
          ROT#1+UNROT ROT#1+UNROT SWAP#1+ OBJ_6D8DC Push3Zeros * 6D69D
          EqwBoxCount#3+ EqwCurBox@ BINT1 OBJ_6D04B EqwNewBox EqwBoxCount#2+ * 6D6B6
          BINT0 EqwCurBox@ OBJ_6D087 EqwNewLeafBox EqwBoxCount#2+ DUPDUP #3- * 6D6D4
          DUP#1+ EqwCurBox@ OBJ_6D39D OBJ_6C85F OBJ_6DCA6 EqwNewBox * 6D6F7
          OBJ_6D451 OBJ_6D163 EqwNewLeafBox ;    * 6D715

* refs (1): 1B3AB
OBJ_6D729:
        :: SKIP OBJ_6DFFD                        * 6D729
          :: SKIP OBJ_6DFFD OBJ_6D666 SWAPDROP #6+ SWAP #2+ 2DUPHALF #1+ * 6D738
            OBJ_6D909 OBJ_6D59B BINT6            * 6D76A

* refs (9): 4B904 6648A 664D0 6CE7A 6D055 6D064 ...
OBJ_6D779:
            :: EqwFontHeight #2+ ; DUP OBJ_44CD2 BINT4 ROT BINT2 * 6D779
            EqwFontHeight #2/ #2+ Push3Zeros EqwNewBox EqwBoxCount#3+ DUP#1- * 6D7A6
            DUP#2- ZEROOVER #1- OBJ_6D39D        * 6D7C9

* refs (6): 664CB 66502 66629 6CEE8 6CF33 6D81E
OBJ_6D7DD:
            :: EqwFontWidth #2+ ; OBJ_6D779 2DUPHALF #1+ OBJ_6D990 * 6D7DD
            Push3Zeros EqwBoxCount#3+ DUP#2- BINT0 #THREE#FOUR OBJ_6D7DD DUP * 6D805
            OBJ_66FF1 SWAP BINT2 EqwFontWidth #2/ #1+ BINT1 Push3Zeros * 6D828
            OBJ_6D9F9 ZEROOVER #1- OBJ_6D163 OBJ_6D4CE OBJ_6D5EB ; * 6D850
          EqwImplicit()? ?SEMI                   * 6D873
          EqwBoxCount BINT2 EqwBox#18! ;         * 6D87D

* refs (1): 1EFBF
OBJ_6D891:
        :: SKIP OBJ_4B8BE OBJ_6D666 3DROP BINT9 ROLL #2+ 9rolld EqwFontWidth * 6D891
          #3* #12+ EqwFontHeight OBJ_6DA26 2DUPHALF * 6D8C3

* refs (4): 65A97 6642B 6CFFB 6D6AC
OBJ_6D8DC:
          :: OBJ_6D909 GOTO L_6CF06 ; EqwBoxCount#3+ DUP #6+ EqwCurBox@ * 6D8DC

* refs (9): 65F67 6C8A0 6D3E8 6D433 6D591 6D76A ...
OBJ_6D909:
          :: ZEROZERO BINT1 ; OBJ_6D779 BINT6 OBJ_6DC51 EqwNewLeafBox * 6D909
          OBJ_6D451 #8+ BINT0 EqwCurBox@ OBJ_6D087 EqwNewBox EqwBoxCount #4+ * 6D931
          DUP#2- BINT0 3PICK #5- DUP#1- OBJ_6D39D EqwFontWidth OBJ_6DA26 * 6D959
          EqwFontHeight OBJ_6DA26 2DUPHALF       * 6D981

* refs (8): 65B2D 65FD5 660C0 66462 664DF 6CF01 ...
OBJ_6D990:
          :: ZEROZERO BINT2 ; Push3Zeros EqwBoxCount#3+ * 6D990

* refs (14): 65F85 65FE4 66034 66066 6A235 6D7C9 ...
* #n -> #n #n-2
DUP#2-:
          :: DUP #2- ;                           * 6D9AE

* refs (3): 65AAB 6D00F 6D5BE
OBJ_6D9C2:
          :: BINT1 BINT0 ;                       * 6D9C2

* refs (1): 6DAAD
OBJ_6D9D6:
          :: BINT0 tokDER OBJ_6CB70 OBJ_6CF3D OBJ_6DA4E ; * 6D9D6

* refs (6): 65C40 65FF8 66075 6D850 6DAB2 6DD05
OBJ_6D9F9:
          :: ZEROZERO EqwBoxCount#2+ ; DUP#2+ OBJ_6DCE7 #ZERO#ONE BINT3 * 6D9F9
          EqwFontWidth                           * 6DA21

* refs (4): 6CEF2 6D8D2 6D97C 6D986
OBJ_6DA26:
          :: #2* #2+ ; DUP OBJ_66FF1 SWAP BINT2  * 6DA26

* refs (10): 65ACE 66020 6CD08 6CE2A 6CF51 6D028 ...
OBJ_6DA4E:
          :: 2DUPHALF Push3Zeros ; OBJ_6D4CE EqwBoxCount#3+ DUP#1- DUP#2- * 6DA4E
          ZEROOVER #2- OBJ_6D39D EqwFontWidth #2* EqwFontHeight OBJ_6DCA6 * 6DA76
          Push3Zeros EqwBoxCount#3+ DUP#2- ZEROZERO OBJ_6D9D6 OBJ_6D9F9 * 6DA99
          BINT0 OBJ_6DCE7 BINT2 OBJ_6D136 OBJ_6D4CE OBJ_67371 #5- DUP#1+ * 6DAB7
          EqwCurBox@ BINT4                       * 6DADF

* refs (12): 660D4 660E8 66287 665F7 6C8AA 6CF6A ...
* Probably: EquationWriter: create a childless box with a blank cell for the current size level
OBJ_6DAE9:
          :: OBJ_6D136 EqwNewLeafBox ; EqwCurBox@ EqwBoxCount#1- ; * 6DAE9

* refs (2): 1F381 1F407
OBJ_6DB0C:
        :: SKIP OBJ_6E3E3 OBJ_6E00B OBJ_6CCCC OVER EqwCurBox@ OBJ_67A9D #2+ * 6DB0C
          OBJ_6E0D2 #3* #+ OBJ_6DB6B 3PICK EqwCurBox@ OBJ_44D9A OBJ_6CE8E * 6DB39
          EqwBoxPrev@ DUP                        * 6DB61

* refs (2): 6DB48 6DBFC
OBJ_6DB6B:
          :: EqwCurBox@ OBJ_67AAF OBJ_6E0C0 #+ #2- ; OBJ_44D7C 2DUP GROBDIM * 6DB6B
          SWAP OVER 8PICK OBJ_67AE2 5PICK 3UNROLL OBJ_67C23 OBJ_6CE8E * 6DB9D
          EqwBoxObj! BINT8 SWAP OBJ_68593 EqwBoxCount#2+ DUP#1- DUP#1- * 6DBC5
          OBJ_6DDD3 3DROP OBJ_6E0D2 #3* OBJ_6DB6B OVER #2/ EqwCurBox@ * 6DBE8
          OBJ_67AE2 OBJ_6CEFC Push3Zeros EqwBoxCount#2+ DUP#2- BINT0 BINT5 * 6DC10
          BINT0 EqwCurBox@ OBJ_67AAF #2- OBJ_6E0D2 #3* * 6DC33

* refs (5): 65B64 65BD7 66494 66507 6D927
OBJ_6DC51:
          :: 2DUP MAKEGROB SWAPROT OBJ_6DA4E ; EqwNewBox EqwBoxCount #4+ * 6DC51
          DUP#2- DUP#2- BINT0 OBJ_6DCE7 OBJ_6D39D OBJ_6E0D2 #3* OBJ_6E0C0 * 6DC7E

* refs (4): 65BAA 66057 6D70B 6DA94
OBJ_6DCA6:
          :: 2DUPHALF OBJ_6D909 ; EqwNewBox Push3Zeros EqwBoxCount#2+ DUP#2- * 6DCA6
          BINT4 OBJ_6DD19 ZEROZERO EqwBoxCount#1+ DUP#2+ * 6DCCE

* refs (10): 65C6D 66002 6607F 6DA12 6DABC 6DC8D ...
OBJ_6DCE7:
          :: OVER #1- ; BINT0 OBJ_6DD19 OBJ_6D9F9 ZEROOVER #2- BINT6 * 6DCE7

* refs (4): 66070 66089 6DCD3 6DD00
OBJ_6DD19:
          :: BINT0                               * 6DD19

* refs (2): 65C7C 65FF3
OBJ_6DD23:
            :: OBJ_6DFDE                         * 6DD23

* refs (4): 6622D 662F5 6D140 6E9E2
OBJ_6DD2D:
              :: BINT0 OBJ_6F42D OBJ_6C85F OBJ_6DA4E ; OBJ_6E00B ; * 6DD2D
          ;                                      * 6DD55
          OBJ_6D4CE OBJ_67371 OBJ_6DFDE ;        * 6DD5A

* refs (29): 65A9C 65B37 65B4B 65BB4 65BC8 65D2D ...
* -> #0 #0 #0, collecting garbage if memory is short
Push3Zeros:
        CON(5)  (*)+5                            * 6DD6E  primitive code object
        ASSEMBLE
        ST=0    10                               * 6DD73
L_6DD76:
        LC(5)   #00003                           * 6DD76
        GOSUB   SUB_6DDA6                        * 6DD7D
        GOC     L_6DD76                          * 6DD81
        LC(15)  #03FEF03FEF03FEF                 * 6DD84
        D1=D1-  15                               * 6DD95
        DAT1=C  15                               * 6DD98
L_6DD9C:
        A=DAT0  A                                * 6DD9C
        D0=D0+  5                                * 6DD9F
        PC=(A)                                   * 6DDA2

* refs (1): 6DD7D
SUB_6DDA6:
        D=D-C   A                                * 6DDA6
        RTNNC                                    * 6DDA8

* refs (4): 6671E 67EAA 681FF 6DDE9
SUB_6DDAB:
        ?ST=1   10                               * 6DDAB
        GOYES   L_6DDCC                          * 6DDAE
        D=D+C   A                                * 6DDB0
        GOSBVL  SAVPTR                           * 6DDB2
        GOSBVL  GARBAGECOL                       * 6DDB9
        GOSBVL  GETPTR                           * 6DDC0
        ST=1    10                               * 6DDC7
        RTNSC                                    * 6DDCA
L_6DDCC:
        GOVLNG  DOMEMERR                         * 6DDCC

* refs (2): 6CFBF 6DBE8
OBJ_6DDD3:
        CON(5)  (*)+5                            * 6DDD3  primitive code object
        ST=0    10                               * 6DDD8
L_6DDDB:
        LC(5)   #00023                           * 6DDDB
        ?D>=C   A                                * 6DDE2
        GOYES   L_6DDF0                          * 6DDE5
        D=D-C   A                                * 6DDE7
        GOSUB   SUB_6DDAB                        * 6DDE9
        GOC     L_6DDDB                          * 6DDED
L_6DDF0:
        GOSBVL  EqwPOP#>Box                      * 6DDF0
        D1=D1-  5                                * 6DDF7
        D=D-1   A                                * 6DDFA
        D0=D0+  15                               * 6DDFC
        D0=D0+  15                               * 6DDFF
        D0=D0+  3                                * 6DE02
        GOSUB   SUB_6DE70                        * 6DE05
        GOSUB   SUB_6DE70                        * 6DE09
        GOSUB   SUB_6DE70                        * 6DE0D
        D1=D1-  5                                * 6DE11
        LC(5)   BINT0                            * 6DE14
        DAT1=C  A                                * 6DE1B
        D0=D0-  2                                * 6DE1E
        A=0     A                                * 6DE21
        A=DAT0  B                                * 6DE23
        ?A=0    B                                * 6DE26
        GOYES   L_6DE31                          * 6DE29
        C=0     B                                * 6DE2B
        DAT0=C  B                                * 6DE2E
L_6DE31:
        GOSUB   SUB_6DE76                        * 6DE31
        A=0     A                                * 6DE35
        GOSUB   SUB_6DE76                        * 6DE37
        D0=D0-  2                                * 6DE3B
        D1=D1-  5                                * 6DE3E
        LC(5)   NULLPAINT                        * 6DE41
        DAT1=C  A                                * 6DE48
        GOSUB   SUB_6DE70                        * 6DE4B
        D0=D0-  3                                * 6DE4F
        GOSUB   SUB_6DE70                        * 6DE52
        D0=D0+  12                               * 6DE56
        GOSUB   SUB_6DE70                        * 6DE59
        LC(5)   #00004                           * 6DE5D
        D=D-C   A                                * 6DE64
        C=R2                                     * 6DE66
        D0=C                                     * 6DE69
        GOTO    L_6DD9C                          * 6DE6C

* refs (6): 6DE05 6DE09 6DE0D 6DE4B 6DE52 6DE59
SUB_6DE70:
        A=0     A                                * 6DE70
        A=DAT0  X                                * 6DE72

* refs (2): 6DE31 6DE37
SUB_6DE76:
        GOSBVL  SUB_680FB                        * 6DE76
        D0=D0-  3                                * 6DE7D
        RTN                                      * 6DE80
        RPL

* refs (3): 479E8 4A2A8 4D0F1
OBJ_6DE82:
        :: OBJ_677EA #0<> ;                      * 6DE82

* refs (2): 68AD0 69879
OBJ_6DE96:
        :: DUP ->StrExpr(_) OBJ_6D62A            * 6DE96

* refs (1): 68E77
OBJ_6DEAA:
          :: OBJ_2708E ?SKIP                     * 6DEAA
            :: DROP'                             * 6DEB9
              :: SKIP OBJ_6DFFD OBJ_6D014 ; ;    * 6DEC3
            EVAL EqwCurBox@ OBJ_6822C OBJ_6E4F6 ; * 6DEE1
        ;                                        * 6DEFA

* Key dispatch for OBJ_6E311 (through OBJ_6FDE2): keycode byte and object to run
L_6DEFF:
        CON(2)  #04                              * 6DEFF  entries
        CON(2)  #00                              * 6DF01  entry 0
        CON(5)  OBJ_6D0D7                        * 6DF03
        CON(2)  #02                              * 6DF08  entry 1
        CON(5)  OBJ_6CF92                        * 6DF0A
        CON(2)  #03                              * 6DF0F  entry 2
        CON(5)  OBJ_6D0FF                        * 6DF11
        CON(2)  #04                              * 6DF16  entry 3
        CON(5)  OBJ_6D0F0                        * 6DF18

* refs (2): 68E1D 6D519
OBJ_6DF1D:
        CON(5)  (*)+5                            * 6DF1D  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 6DF22
        GOSBVL  POP#                             * 6DF25
        R4=A                                     * 6DF2C
        D1=D1-  10                               * 6DF2F
        D=D-1   A                                * 6DF32
        LC(5)   FONTHEIGHT                       * 6DF34
        CD0EX                                    * 6DF3B
        A=DAT0  A                                * 6DF3E
        R0=A                                     * 6DF41
        D0=C                                     * 6DF44
        GOSBVL  SUB_67A51                        * 6DF47
        D0=D0+  15                               * 6DF4E
        D0=D0+  12                               * 6DF51
        A=0     A                                * 6DF54
        A=DAT0  X                                * 6DF56
        R3=A                                     * 6DF5A
        C=R4                                     * 6DF5D
        DAT0=C  X                                * 6DF60
        GOSBVL  SUB_67A3B                        * 6DF64
        D0=D0-  6                                * 6DF6B
        A=0     A                                * 6DF6E
        A=DAT0  X                                * 6DF70
        R1=A                                     * 6DF74
        GOSUB   SUB_6DFC9                        * 6DF77
        D0=D0+  3                                * 6DF7B
        GOSUB   SUB_6DFC9                        * 6DF7E
        A=R1                                     * 6DF82
L_6DF85:
        GOSBVL  SUB_67A3B                        * 6DF85
        A=0     A                                * 6DF8C
        D0=D0-  9                                * 6DF8E
        GOSUB   SUB_6DFC9                        * 6DF91
        D0=D0-  3                                * 6DF95
        GOSUB   SUB_6DFC9                        * 6DF98
        ?A#0    X                                * 6DF9C
        GOYES   L_6DF85                          * 6DF9F
        A=R0                                     * 6DFA1
        GOSBVL  SUB_67A3B                        * 6DFA4
        D0=D0-  12                               * 6DFAB
        C=R4                                     * 6DFAE
        C=C-1   X                                * 6DFB1
        DAT0=C  X                                * 6DFB4
        D0=D0+  3                                * 6DFB8
        C=0     X                                * 6DFBB
        DAT0=C  X                                * 6DFBE
        GOVLNG  L_685CD                          * 6DFC2

* refs (4): 6DF77 6DF7E 6DF91 6DF98
SUB_6DFC9:
        C=R0                                     * 6DFC9
        A=DAT0  X                                * 6DFCC
        ?C#A    X                                * 6DFD0
        RTNYES                                   * 6DFD3
        C=R4                                     * 6DFD5
        DAT0=C  X                                * 6DFD8
        RTN                                      * 6DFDC

* refs (10): 65CA4 65D8C 661BF 6650C 6D244 6D2E4 ...
OBJ_6DFDE:
        CON(5)  (*)+5                            * 6DFDE  primitive code object
        GOSUB   SUB_6E08F                        * 6DFE3
        A=A+1   B                                * 6DFE7
        CD0EX                                    * 6DFEA
        DAT0=A  B                                * 6DFED
L_6DFF0:
        D0=C                                     * 6DFF0
L_6DFF3:
        A=DAT0  A                                * 6DFF3
        D0=D0+  5                                * 6DFF6
        PC=(A)                                   * 6DFF9

* refs (9): 6CCC7 6CCD6 6CDE9 6D569 6D60E 6D733 ...
OBJ_6DFFD:
        CON(5)  (*)+5                            * 6DFFD  primitive code object
        D1=D1+  5                                * 6E002
        D=D+1   A                                * 6E005
        GOTO    L_6DFF3                          * 6E007

* refs (10): 4B8B4 65D82 65DAF 661F6 665D4 6D285 ...
OBJ_6E00B:
        CON(5)  (*)+5                            * 6E00B  primitive code object
        GOSUB   SUB_6E08F                        * 6E010
        CD0EX                                    * 6E014
        ?A=0    B                                * 6E017
        GOYES   L_6E022                          * 6E01A
        A=A-1   B                                * 6E01C
        DAT0=A  B                                * 6E01F
L_6E022:
        GOTO    L_6DFF0                          * 6E022

* refs (4): 68819 6AEF6 6BE98 6C2B7
OBJ_6E026:
        CON(5)  (*)+5                            * 6E026  primitive code object
        C=DAT1  A                                * 6E02B
        CD1EX                                    * 6E02E
        A=DAT1  A                                * 6E031
        D1=C                                     * 6E034
        LC(5)   DOCOL                            * 6E037
        ?C=A    A                                * 6E03E
        GOYES   L_6E04D                          * 6E041
        LC(5)   ?OKINALG                         * 6E043
        GONC    L_6E06D                          * 6E04A
L_6E04D:
        LC(5)   OBJ_26A82                        * 6E04D
        GOC     L_6E06D                          * 6E054

* refs (18): 65B19 65B55 65BA5 65BCD 65EC2 65FA3 ...
* -> #h: EquationWriter character height for the size level in AppCount: 10, 8 or 6
EqwFontHeight:
        CON(5)  (*)+5                            * 6E057  primitive code object
        GOSUB   SUB_6E08F                        * 6E05C
        A=A-1   B                                * 6E060
        GONC    L_6E073                          * 6E063
        LC(5)   BINT10                           * 6E066
L_6E06D:
        A=C     A                                * 6E06D
        PC=(A)                                   * 6E06F
L_6E073:
        A=A-1   B                                * 6E073
        GOC     L_6E084                          * 6E076
L_6E079:
        LC(5)   BINT6                            * 6E079
        GOTO    L_6E06D                          * 6E080
L_6E084:
        LC(5)   BINT8                            * 6E084
        GOTO    L_6E06D                          * 6E08B

* refs (7): 6DFE3 6E010 6E05C 6E0A6 6E0C5 6E0D7 ...
SUB_6E08F:
        LC(5)   AppCount                         * 6E08F
        CD0EX                                    * 6E096
        A=DAT0  B                                * 6E099
        CD0EX                                    * 6E09C
        RTN                                      * 6E09F

* refs (21): 65A7E 65B05 65B5F 65B96 65ECC 65F21 ...
* -> #w: EquationWriter character width for the size level in AppCount: 6, 6 or 4
EqwFontWidth:
        CON(5)  (*)+5                            * 6E0A1  primitive code object
        GOSUB   SUB_6E08F                        * 6E0A6
        A=A-1   B                                * 6E0AA
        GOC     L_6E079                          * 6E0AD
        A=A-1   B                                * 6E0B0
        GOC     L_6E079                          * 6E0B3
L_6E0B6:
        LC(5)   BINT4                            * 6E0B6
        GONC    L_6E06D                          * 6E0BD

* refs (9): 65B0F 65B50 65F35 65F5D 65FBC 66052 ...
OBJ_6E0C0:
        CON(5)  (*)+5                            * 6E0C0  primitive code object
        GOSUB   SUB_6E08F                        * 6E0C5
        A=A-1   B                                * 6E0C9
        GOC     L_6E084                          * 6E0CC
        GONC    L_6E079                          * 6E0CF

* refs (7): 66048 66408 6644E 6DB39 6DBF2 6DC47 ...
OBJ_6E0D2:
        CON(5)  (*)+5                            * 6E0D2  primitive code object
        GOSUB   SUB_6E08F                        * 6E0D7
        A=A-1   B                                * 6E0DB
        GOC     L_6E079                          * 6E0DE
        GONC    L_6E0B6                          * 6E0E1

        CON(5)  (*)+5                            * 6E0E4  primitive code object
        GOSUB   SUB_6E08F                        * 6E0E9
        A=A-1   B                                * 6E0ED
        GOC     L_6E0FE                          * 6E0F0
        LC(5)   OBJ_66E7F                        * 6E0F3
        GOTO    L_6E06D                          * 6E0FA
L_6E0FE:
        LC(5)   OBJ_66FB1                        * 6E0FE
        GOTO    L_6E06D                          * 6E105
        RPL

* refs (1): 6CF9C
OBJ_6E109:
        :: BINT4                                 * 6E109

* refs (5): 4B91D 6E18B 6E235 6E3C0 6E3D9
OBJ_6E113:
          :: OBJ_6E433                           * 6E113

* refs (1): 6997D
OBJ_6E11D:
            :: OBJ_67E0C EqwBoxLast@             * 6E11D
L_6E12C:
              OBJ_6799C OBJ_67AAA #2+ OBJ_6D488 3PICKSWAP OBJ_44DFE BINT2 * 6E12C
              3PICK OBJ_68593 OBJ_67AE2 #1+ OBJ_67C16 ; * 6E14F
          ;                                      * 6E16D
        ;                                        * 6E172

* refs (1): 6D109
OBJ_6E177:
        :: OBJ_6FDB6 OBJ_6E1A9 BINT6 OBJ_6E113 ; * 6E177

* refs (1): 6D0FA
OBJ_6E195:
        :: OBJ_6FDB6 OBJ_6E1A9 OBJ_6FDC6         * 6E195

* refs (6): 6944F 6E181 6E19F 6E398 6E3A7 6E3CF
OBJ_6E1A9:
          :: OBJ_6F199 OBJ_6E4AB DROP OBJ_6D5EB EqwBoxNext! * 6E1A9

* refs (3): 6625A 663BD 6E40B
OBJ_6E1C7:
            :: EqwCurBox@ EqwBoxNext@ ; DUPDUP OBJ_6E474 ZEROOVER * 6E1C7
            EqwBoxParent@ OBJ_67DDF #1+ OBJ_6DAE9 EqwBoxCount 2DUP * 6E1EA
            EqwBoxNext! OBJ_67443 SWAP EqwBoxParent@ SWAP EqwBoxLast! * 6E208
            OBJ_6E4F6 ;                          * 6E226
          BINT8 OBJ_6E113 ;                      * 6E230

* refs (1): 6CECF
OBJ_6E23F:
        :: SKIP                                  * 6E23F
          :: OBJ_65E13 OBJ_67E64 DUP#2+ DUPUNROT EqwBoxLast! DUP#1- SWAP * 6E249
            EqwBoxNext! ;                        * 6E271
          BINT4 OBJ_6E433 EqwCurBox@ EqwDupBoxParent@ SWAP EqwBoxNext@ DUP * 6E27B
          BINT5 OBJ_6E4AB EqwBoxNext! EqwBoxCount OBJ_6D523 DUPUNROT * 6E29E
          EqwBoxLast! EqwCurBox! OBJ_6E4F6 ;     * 6E2BC

* refs (3): 68D82 68EBD 6998C
OBJ_6E2D0:
        :: OBJ_2708E ?GOTO L_6E343 DUP           * 6E2D0

* refs (5): 6B73B 6E816 6EA78 6F08B 6F2D4
OBJ_6E2E9:
          :: OBJ_26BED NOTcsdrpfls DROPSWAPDROP OBJ_26E61 3DROP ; case2DROP * 6E2E9

* refs (1): 68ED6
OBJ_6E311:
          :: OBJ_26BED DROP ROTROT2DROP #1+ OBJ_6FDE2 L_6DEFF ?SEMI * 6E311
            ERRJMP ;                             * 6E339
L_6E343:
          OBJ_6F261 EVAL ;                       * 6E343

* refs (1): 6D0E1
OBJ_6E352:
        :: SKIP OBJ_6F360 DUP BINT4 #<case DROP  * 6E352
          OBJ_67DEC OBJ_6EF6E OBJ_6B2AA xAPPLY case * 6E375
          :: OBJ_6FDB6 OBJ_6E1A9 OBJ_6FDC6       * 6E38E
            :: OBJ_6E1A9 OBJ_69594 OBJ_69594 ; BINT7 OBJ_6E113 ; * 6E3A2
          OBJ_6FDB6 OBJ_6E1A9 BINT5 OBJ_6E113 ;  * 6E3CA

* refs (1): 6DB16
OBJ_6E3E3:
        :: SKIP OBJ_6F4B4 OBJ_6FD85 OBJ_6DFDE #1- OBJ_6FDB6 * 6E3E3
          :: OBJ_6E1C7 OBJ_6E564 EqwBoxNext@ EqwCurBox! ; OBJ_6FDC6 * 6E406
          OBJ_6E451 BINT7                        * 6E429

* refs (8): 65CC2 661F1 665CF 6B354 6C23F 6E118 ...
OBJ_6E433:
          :: #=?SKIP RDROP ; OBJ_6E00B ;         * 6E433

* refs (1): 6E429
OBJ_6E451:
        :: OBJ_6F199 OBJ_6E4AB EqwCurBox@ OVER EqwBoxNext! DUP * 6E451

* refs (2): 6E1E0 6F211
OBJ_6E474:
          :: OBJ_6BC55 CHR>$ OBJ_6CB70 OBJ_44DFE ; BINT4 OBJ_6E4AB DUPZERO * 6E474
          OBJ_6E4AB BINT6                        * 6E4A1

* refs (5): 6E1B3 6E2A3 6E45B 6E497 6E4A1
OBJ_6E4AB:
          :: SWAP EqwBoxCount#2+ OVER EqwBoxParent@ 4ROLL OBJ_6DAE9 * 6E4AB
            EqwBoxCount ;                        * 6E4CE
          OBJ_6D523 EqwCurBox@ EqwBoxParent@ SWAP EqwBoxLast! EqwCurBox! * 6E4D8

* refs (7): 65DA0 6624B 69165 6DEF0 6E226 6E2C6 ...
OBJ_6E4F6:
          :: EqwCurBox@ OBJ_6681A ; ;            * 6E4F6

* refs (1): 1A973
OBJ_6E50F:
        :: SKIP                                  * 6E50F
          :: SKIP                                * 6E519
            :: OBJ_65E13 GOTO L_6F18A ; #1<> ?SEMI * 6E523
            OBJ_6D5EB #2+ BINT1 BINT2 OBJ_6DAE9 EqwBoxCount * 6E546

* refs (1): 6E410
OBJ_6E564:
            :: DUP tok= OBJ_6CB70 EqwBoxObj! ; EqwCurBox@ SWAP EqwBoxNext! * 6E564
            EqwBoxCount #ZERO#ONE BINT3 OBJ_6DAE9 EqwBoxCount DUP OBJ_6681A * 6E591
            BINT1 OVER EqwBoxLast! EqwCurBox! ;  * 6E5B4
        ;                                        * 6E5CD

* refs (1): 6BB4A
OBJ_6E5D2:
        :: OBJ_6CAA8 NOTcase                     * 6E5D2
          ::                                     * 6E5E1

* refs (1): 6CB1B
OBJ_6E5E6:
            :: 10GETLAM OBJ_6B359 10PUTLAM ; OBJ_6B939 OBJ_6CB25 OBJ_6CB3E * 6E5E6
            ?SEMI                                * 6E60E
            OBJ_6CB39 ;                          * 6E613
          GetGNTData DROPDUP BINT2 #<case        * 6E61D
          :: 3DROP DoBadKey ;                    * 6E631

* refs (4): 69214 6ABA9 6E73F 6E7DA
OBJ_6E645:
          :: DUPDUP OBJ_56FD1 BIND BEGIN 1GETLAM #1-DUP 1PUTLAM GetNextToken * 6E645
            DROPDUP 2PUTLAM GetNextToken SWAPDROPDUP 3PUTLAM NULL$? NOT * 6E672
            OBJ_699B9 OR UNTIL 2GETLAM OBJ_699B9 ITE * 6E695
            :: 2DROP BINT1 NULL$ ;               * 6E6B3
            :: DUPUNROT 1_#1-SUB$ ;              * 6E6CC
            SWAP 3GETLAM ABND ;                  * 6E6E0
          DUP 22PUTLAM toklparen EQUAL IT        * 6E6F4
          :: OBJ_67DFC OBJ_26E61 ROTROT2DROP NOTcaseDROP ITE * 6E70D
            BINT4 BINT3                          * 6E72B
            OBJ_67DDF OBJ_6E433 OBJ_6E645 DROP ; * 6E735
          OBJ_6E7C6 OBJ_67DCF 7PUTLAM OBJ_6E4F6 CLEARVDISP OBJ_67CBE * 6E74E
          OBJ_6B79A WINDOWCORNER SWAPDROP 12GETLAM #< ?SKIP * 6E76C
          :: REDISPHBUFF OBJ_6B79A ;             * 6E78A
          OBJ_6F42D BINT26 PUTLAM EqwCurBox@ OBJ_67AF4 15PUTLAM 14PUTLAM ; * 6E79E

* refs (1): 6E74E
OBJ_6E7C6:
        ::                                       * 6E7C6

* refs (1): 6ABB3
OBJ_6E7CB:
          :: BINT3 NDUP OBJ_6E645 4UNROLL3DROP DUPLEN$ BINT1 #> NOTcaseDROP * 6E7CB
            palparse                             * 6E7F8
            DROP DUP' xNOT EQ SWAP OBJ_6E2E9 OR NOT?SEMI * 6E7FD
            SWAP APPEND_SPACE SWAP #1+ ;         * 6E825
          OBJ_6821C DUPNULLCOMP? casedrop        * 6E83E
          :: RDROP NULL$ PutGNTData OBJ_6AE42 ;  * 6E84D
          OBJ_6C127 CARCOMP INCOMPDROP 8PUTLAM BINT34 PUTLAM EqwBoxCount * 6E86B
          OVER#- DUP#0=ITE DROP                  * 6E88E
          :: ZERO_DO OBJ_674D6 ROLLDROP OBJ_6C302 LOOP ; OBJ_6746B OBJ_67426 * 6E89D
          1PUTLAM OBJ_67458 OBJ_0C4E3 SWAP#- 3UNROLL 4UNROLL OBJ_679EA 8ROLL * 6E8CA
          8ROLL 8ROLL 4ROLL IT                   * 6E8F2
          :: OBJ_699B9 NOT?SEMI                  * 6E906
            22Lget OBJ_0C204 ?SEMI               * 6E915
            8GETLAM LEN$ 2DUP#> NOTcaseDROP #-   * 6E924
          ;                                      * 6E93D
          NULL$ PutGNTData EqwCurBox@ 7PUTLAM EqwCurBox! OVER 12PUTLAM * 6E942
          OBJ_67DDF OBJ_67DEC DUPTYPELIST? OBJ_6BFBA * 6E965
          :: DUPLENCOMP DUP#0= case2DROP #1-     * 6E979
            NTHCOMPDROP #0=?SKIP #1+ ;           * 6E992
          13PUTLAM OBJ_6EB31                     * 6E9A6

* refs (2): 6949A 6C08C
OBJ_6E9B0:
          :: EqwCurBox@ OBJ_679EA ; ROT OR ITE   * 6E9B0
          :: OBJ_699B9 NOTcaseDROP OBJ_6DD2D     * 6E9D3
            EqwCurBox@ OBJ_6822C DUPZERO 2DUP EqwBoxFirst! EqwBoxLast! * 6E9E7
            OBJ_67DDF EqwBox#18! ;               * 6EA05
          :: EqwBoxFirst@ OBJ_67B12 OBJ_66BAD NOT SWAP OBJ_6AAB9 AND ?SEMI * 6EA14
            OBJ_0C4E3 OBJ_6A267 BINT0 BEGIN #1+ OBJ_67B12 3PICK #= UNTIL * 6EA41
            SWAPDROP OBJ_69188 OBJ_6E2E9 ITE BINT2 BINT1 * 6EA6E
            EqwBox#18! ;                         * 6EA8C
          15GETLAM 12GETLAM DUPLENCOMP #2- 3PICK #3* #- NTHCOMPDROP 13GETLAM * 6EA96
          #=?SKIP #1+ DUP#0=IT #1+ ZERO_DO OBJ_672E6 INDEX@#- OBJ_6F0FE LOOP * 6EAC3
          EqwBoxCount #1+_ONE_DO INDEX@ EqwBoxNext@ OBJ_6ECF8 IT * 6EAF0
          :: INDEX@ BINT0 EqwBoxNext! ;          * 6EB0E
          LOOP ;                                 * 6EB27

* refs (1): 6E9AB
OBJ_6EB31:
        :: OBJ_67E0C 3UNROLL FALSE 4PICK 4PICK DUP OBJ_6EDFC #1+_ONE_DO * 6EB31
          DUPINDEX@ #3* #1- NTHCOMPDROP 3PICK #= 4ROLL OR 3UNROLL LOOP 2DROP * 6EB5E
          ?SKIP                                  * 6EB95
          :: OBJ_674BB ROT EqwBoxParent@ 3UNROLL ; * 6EB9A
          OBJ_6EDF2 DUPLENCOMP #0=?SKIP          * 6EBB8
          :: DUPLENCOMP #1+_ONE_DO DUPINDEX@ NTHCOMPDROP DUP OBJ_6EF6E * 6EBC7
            OBJ_6AEF1 ITE OBJ_6EF64              * 6EBEA
            :: DROP EqwCurBox@ OBJ_67DDF ;       * 6EBF9
            EqwBox#18! LOOP ;                    * 6EC12
          2DROP EqwCurBox@ 7GETLAM               * 6EC21
          :: 2DUPSWAP EqwBoxParent@ #=case SWAPDROP * 6EC30
            BEGIN EqwDupBoxParent@ DUP OBJ_68F7B 5PICK #> SWAP 5PICK #< OR * 6EC49
            OVER OBJ_67B17 OBJ_6EE65 IT          * 6EC7B
            :: caseTRUE DROPDUP                  * 6EC8F
              FALSE ;                            * 6EC9E
            OVER EqwBoxParent@ #0<> AND WHILE    * 6ECA8
            :: SWAPDROP ; REPEAT ROTROT2DROP DUP#0<> ?SEMI * 6ECC1
            DROP 7GETLAM ;                       * 6ECE4
          DUP                                    * 6ECF3

* refs (4): 6EB04 6ED70 6F39C 6F4FA
OBJ_6ECF8:
          :: EqwBoxCount #> ; NOTcase2DROP OBJ_679EA * 6ECF8
          IT                                     * 6ED16
          :: BINT1 EqwBoxLast@ BINT1 EqwBoxFirst@ OVER#= caseDROP OVER#= * 6ED1B
            NOT?SEMI                             * 6ED43
            RDROP 2DROP ;                        * 6ED48
          :: EqwCurBox@ BEGIN EqwDupBoxParent@ DUP OBJ_6ECF8 NOT OVER #1<> * 6ED57
            AND WHILE                            * 6ED84
            :: SWAPDROP ; REPEAT #1<> ?SEMI      * 6ED8E
            EqwCurBox@ OVER#= NOTcase2drop drop;q_58A0C * 6EDAC
          ;                                      * 6EDC0
          ROTDROP BINT1 SWAPROT EqwBoxCount BINT1 OBJ_6A5AA ROTDROP * 6EDC5
          OBJ_6F0B8 ;                            * 6EDE8

* refs (1): 6EBB8
OBJ_6EDF2:
        :: OVER                                  * 6EDF2

* refs (2): 6EB54 6EF23
OBJ_6EDFC:
          :: LENCOMP BINT3 #/ SWAPDROP ; OBJ_672E6 #-DUP 15PUTLAM NULL{} * 6EDFC
          BINT0 4ROLL DUP#0=ITE DROP             * 6EE2E
          :: #1+_ONE_DO                          * 6EE42
            :: OBJ_6918D OBJ_26BED NOTcaseFALSE SWAPDROP * 6EE4C

* refs (8): 68CFB 69FA6 6A2BC 6A34D 6AD07 6EC85 ...
OBJ_6EE65:
              :: MINUSONE #= ; NOTcaseTRUE OBJ_6918D * 6EE65
              SWAP DUP' xFCNAPPLY EQITE          * 6EE83
              :: OBJ_6918D 3UNROLL BINT3 OBJ_6EEC4 ; BINT2 {}N TRUE * 6EE97

* refs (3): 68BC5 68BDE 6EEAB
OBJ_6EEC4:
              :: ISTOP@ #1- ISTOPSTO ; ;         * 6EEC4
            4ROLLROT >TCOMP 3UNROLL IT #1+       * 6EEE2
            LOOP ;                               * 6EEFB
          DUP 14PUTLAM ROT OVER#> NOTcaseDROP 3PICK * 6EF05
          OBJ_6EDFC SWAP#- #3* #1- 3PICKSWAP NTHCOMPDROP * 6EF23

* refs (1): 69179
OBJ_6EF41:
          :: NULL{} NULLHXS ZEROZERO OBJ_67532 ; ; * 6EF41

* refs (1): 6EBF4
OBJ_6EF64:
        :: DUP                                   * 6EF64

* refs (5): 69987 6E37A 6EBE5 6F13F 6FF3B
OBJ_6EF6E:
          :: DUPTYPELIST? NOT?SEMI               * 6EF6E
            DUP CARCOMP DUPTYPEROMP? case SWAPDROP * 6EF7D
            DROP DUPLENCOMP NTHCOMPDROP ;        * 6EF96
          DUPUNROT OBJ_6B713 case2drop 2SKIP     * 6EFAA
          4PICK DUPLENCOMP 14GETLAM DUP #3* SWAP#1- 14PUTLAM #1-- 2DUP * 6EFBE
          NTHCOMPDROP 3UNROLL #1+ 2DUP NTHCOMPDROP 5UNROLL #1+ NTHCOMPDROP * 6EFEB
          DUP OBJ_26E61 DROP ROTROT2DROP ROT OBJ_67532 OBJ_67E0C * 6F013
          EqwBoxFirst@ SWAP                      * 6F036
          :: ' ä EQcasedrop EqwBoxSecond@        * 6F040
            'xDER EQcasedrop EqwBoxFirst@        * 6F059
            DUP' xXROOT EQ OVER' xPREDIV EQOR SWAP OBJ_6E2E9 OR NOT?SEMI * 6F068
            RDROP EqwBoxNext@ BINT2 ;            * 6F09A
          BINT1 ;                                * 6F0AE

* refs (1): 6EDE8
OBJ_6F0B8:
        CON(5)  (*)+5                            * 6F0B8  primitive code object
        ASSEMBLE
        GOSBVL  EqwPOP#>Box                      * 6F0BD
        D0=D0+  15                               * 6F0C4
        D0=D0+  7                                * 6F0C7
        C=DAT0  B                                * 6F0CA
        RSTK=C                                   * 6F0CD
        D0=D0+  5                                * 6F0CF
        C=DAT0  W                                * 6F0D2
        RSTK=C                                   * 6F0D6
        GOSBVL  POP#                             * 6F0D8
        GOSBVL  SUB_67A3B                        * 6F0DF
        D0=D0-  15                               * 6F0E6
        C=RSTK                                   * 6F0E9
        DAT0=C  9                                * 6F0EB
        D0=D0-  5                                * 6F0EF
        C=RSTK                                   * 6F0F2
        DAT0=C  B                                * 6F0F4
        GOVLNG  L_685CD                          * 6F0F7
        RPL

* refs (1): 6EAE6
OBJ_6F0FE:
        :: OBJ_67E34 12GETLAM 3PICK #3* #2- NTHCOMPDROP OVER#= 7PUTLAM * 6F0FE
          DUP#0=csedrp OBJ_6F41E OVER OBJ_67E54 OBJ_6EF6E OBJ_2846E * 6F12B
          EQcasedrop                             * 6F149
          :: DROP 7GETLAM case OBJ_6F41E         * 6F14E
            DUP NULL{} OBJ_67F31 DUPZERO OBJ_67F0B OBJ_67E64 EqwBoxSecond@ * 6F167
L_6F18A:
            EqwDupBoxFirst@ OBJ_6D523 EqwBoxLast! * 6F18A

* refs (5): 660E3 6CF65 6D046 6E1AE 6E456
OBJ_6F199:
            :: EqwCurBox@ BINT0 ; EqwBoxNext! ;  * 6F199
          OBJ_2845A EQcasedrop                   * 6F1B7
          :: DROPDUP OBJ_6F36A OBJ_6D1C7 case OBJ_6F41E * 6F1C1
            22Lget tokanglesign EQUAL NOTcaseDROP DUP * 6F1DF
            OBJ_2846E OBJ_67F31 OBJ_67E64 EqwBoxSecond@ EqwBoxSecond@ * 6F1F8
            OBJ_6E474 9GETLAM #1+ 9PUTLAM ;      * 6F211
          OBJ_2708E case                         * 6F22A
          :: OBJ_6F261 OVER #1= OVER' OBJ_6DFFD EQOR case 3DROP * 6F234

* refs (3): 6E343 6F239 8E4C7
OBJ_6F261:
            :: BINT2 NTHCOMPDROP ; EVAL ;        * 6F261
          OBJ_26BED DROPSWAPDROP OBJ_6EE65 casedrop * 6F27F
          :: 2DUP OBJ_6F360 OVER OBJ_67E54 DUPLENCOMP #1- NTHCOMPDROP #0=ITE * 6F293
            OBJ_6F46E DROP DROP ;                * 6F2C0
          OBJ_6E2E9 case2DROP 7GETLAM            * 6F2D4
          casedrop                               * 6F2E3
          :: DUP OBJ_6F36A OBJ_6D1C7 NOTcaseDROP OBJ_6F315 * 6F2E8
            OBJ_6F41E ;                          * 6F306
          OBJ_6F46E                              * 6F310

* refs (1): 6F301
OBJ_6F315:
          :: DUPDUP OBJ_67E54 TYPELIST? NOTcaseDROP OBJ_6F3C4 * 6F315
          ;                                      * 6F333
L_6F338:
          OBJ_6F36A EqwBoxPrev@ OBJ_679C0 EqwBoxPrev@ EqwBoxPrev@ OBJ_6D523 * 6F338
          EqwBoxLast! ;                          * 6F356
