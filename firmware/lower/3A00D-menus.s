* HP 48GX ROM revision R, #3A00D-#3D00D: Menus and the built-in libraries 0A1-0A7
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: 'DROPFALSE DispMenu MakeStdLabel Grob>Menu DispEditLine ?DispMenu DispMenu.1 BlankDA12 SetSomeRow MakeLabel MakeDirLabel EditMenu
* Follows on from the previous file (at #3A00D in the original ROM).
        RPL

* ->
* refs (8): 19BB3 386BF 427F0 4298F 429B7 430B6 ...
DispEditLine:
        ::                                       * 3A00D
          TOADISP                                * 3A012
          SetDA2bValid                           * 3A017
          SetDA2bEdit                            * 3A01C
          COLA                                   * 3A021
          OBJ_3A030                              * 3A026
        ;                                        * 3A02B

* refs (4): 3A026 40B6F D85F3 D8700
OBJ_3A030:
        ::                                       * 3A030
          NoEditLine?                            * 3A035
          ?SEMI                                  * 3A03A
          EDITLINE$                              * 3A03F
          BINT1                                  * 3A044
          OBJ_3A0E4                              * 3A049
          OBJ_39FE3                              * 3A04E
          OBJ_39FE3                              * 3A053
          EDITPARTS                              * 3A058
          BINT4                                  * 3A05D
          #MIN                                   * 3A062
          #-                                     * 3A067
          DO                                     * 3A06C
          dup2;spos(st,RC)                       * 3A071
          DUP#0=IT                               * 3A076
          ::                                     * 3A07B
            DROP                                 * 3A080
            OVERLEN$                             * 3A085
            #1+                                  * 3A08A
          ;                                      * 3A08F
          3PICK                                  * 3A094
          ROT                                    * 3A099
          FIRSTC@                                * 3A09E
          #+                                     * 3A0A3
          3PICKOVER                              * 3A0A8
          2DUP#<                                 * 3A0AD
          ITE                                    * 3A0B2
          OBJ_3A125                              * 3A0B7
          OBJ_3A139                              * 3A0BC
          INDEX@                                 * 3A0C1
          BigDisp(st,s)                          * 3A0C6
          #1+                                    * 3A0CB
          LOOP                                   * 3A0D0
          2DROP                                  * 3A0D5
          OBJ_42831                              * 3A0DA
        ;                                        * 3A0DF

* refs (1): 3A049
OBJ_3A0E4:
        ::                                       * 3A0E4
          OBJ_113F2                              * 3A0E9
          DUP                                    * 3A0EE
          ONE_EQ                                 * 3A0F3
          caseDROP                               * 3A0F8
          ONE_DO                                 * 3A0FD
          OVER                                   * 3A102
          CHR_Newline                            * 3A107
          ROT                                    * 3A10C
          POS$                                   * 3A111
          #1+                                    * 3A116
          LOOP                                   * 3A11B
        ;                                        * 3A120

* refs (1): 3A0B7
OBJ_3A125:
        ::                                       * 3A125
          4DROP                                  * 3A12A
          _chr(31)_                              * 3A12F
        ;                                        * 3A134

* refs (1): 3A0BC
OBJ_3A139:
        ::                                       * 3A139
          #-                                     * 3A13E
          begin<16>end                           * 3A143
          2DUP#>                                 * 3A148
          5UNROLL                                * 3A14D
          2DUP#=                                 * 3A152
          3UNROLL                                * 3A157
          #MIN                                   * 3A15C
          SWAP                                   * 3A161
          ?SKIP                                  * 3A166
          #1-                                    * 3A16B
          OVER#+                                 * 3A170
          FIRSTC@                                * 3A175
          #0<>                                   * 3A17A
          DUP                                    * 3A17F
          5UNROLL                                * 3A184
          IT                                     * 3A189
          SWAP#1+SWAP                            * 3A18E
          SUB$SWAP                               * 3A193
          IT                                     * 3A198

+(_..._,st):
          ::                                     * 3A19D
            CHR_...                              * 3A1A2
            >H$                                  * 3A1A7
          ;                                      * 3A1AC
          SWAP                                   * 3A1B1
          NOT?SEMI                               * 3A1B6
          CHR_...                                * 3A1BB
          >T$                                    * 3A1C0
        ;                                        * 3A1C5

* ->
* refs (8): 19C1E 386C9 430C0 43793 8D715 BA760 ...
?DispMenu:
        ::                                       * 3A1CA
          KEYINBUFFER?                           * 3A1CF
          NOTcase                                * 3A1D4
          DispMenu                               * 3A1D9
          SetDA3Bad                              * 3A1DE
        ;                                        * 3A1E3

* ->
* refs (45): 0C91A 3A1D9 46204 47D4C 47D89 4A069 ...
DispMenu:
        ::                                       * 3A1E8
          DispMenu.1                             * 3A1ED
          SetDA3Valid                            * 3A1F2
        ;                                        * 3A1F7

* ->
* refs (6): 0C9DB 1A75B 3A1ED 4EE97 6CCB2 737C9
DispMenu.1:
        ::                                       * 3A1FC
          TURNMENUON                             * 3A201
          OBJ_12847                              * 3A206
          #       6E                             * 3A20B  110
          #       58                             * 3A215  88
          #       42                             * 3A21F  66
          BINT44                                 * 3A229
          BINT22                                 * 3A22E
          BINT0                                  * 3A233
          BINT7                                  * 3A238
          ONE_DO                                 * 3A23D
          INDEX@                                 * 3A242
          GETDF                                  * 3A247
          DoLabel                                * 3A24C
          LOOP                                   * 3A251
          OBJ_72ED8                              * 3A256
        ;                                        * 3A25B

* #col grob -> #col $ -> #col id -> #col :: ->
* refs (2): 154AA 41049
>MENU:
        ::                                       * 3A260
          CK&DISPATCH0                           * 3A265
          BINT12                                 * 3A26A
          Grob>Menu                              * 3A26F
          BINT3                                  * 3A274
          Str>Menu                               * 3A279
          BINT8                                  * 3A27E
          Seco>Menu                              * 3A283
          BINT6                                  * 3A288
          Id>Menu                                * 3A28D
        ;                                        * 3A292

* #col grob ->
* refs (8): 154C3 3A26F 3A2BF 3A31E 3F059 3F62E ...
Grob>Menu:
        ::                                       * 3A297
          HARDBUFF2                              * 3A29C
          ROT                                    * 3A2A1
          BINT0                                  * 3A2A6
          GROB!                                  * 3A2AB
        ;                                        * 3A2B0

* #col $ ->
* refs (1): 3A279
Str>Menu:
        ::                                       * 3A2B5
          MakeStdLabel                           * 3A2BA
          Grob>Menu                              * 3A2BF
        ;                                        * 3A2C4

* #col :: ->
* refs (1): 3A283
Seco>Menu:
        ::                                       * 3A2C9
          EVAL                                   * 3A2CE
          DoLabel                                * 3A2D3
        ;                                        * 3A2D8

* #col id ->
* refs (1): 3A28D
Id>Menu:
        ::                                       * 3A2DD
          DUP                                    * 3A2E2
          ID>$                                   * 3A2E7
          SWAP                                   * 3A2EC
          DRPExitAtLOOP                          * 3A2F1
          ITE                                    * 3A2F6

MakeLabel(st,di?):
          ::                                     * 3A2FB
            TYPERRP?                             * 3A300
            ITE                                  * 3A305
            MakeDirLabel                         * 3A30A
            MakeStdLabel                         * 3A30F
          ;                                      * 3A314
          MakeStdLabel                           * 3A319
          Grob>Menu                              * 3A31E
        ;                                        * 3A323

* $ -> grob
* refs (9): 3A2BA 3A30F 3A319 3ECA8 3ED16 3F04F ...
MakeStdLabel:
        ::                                       * 3A328
          BINT20                                 * 3A32D
          BINT11                                 * 3A332

* 21x8 normal menu key
* refs (1): 412FB
NullMenuLbl:
          CON(5)  DOGROB                         * 3A337  DOGROB
          LENGTH                                 * 3A33C  length, to #3A37B
          NIBHEX  8000051000FFFFFF               * 3A341  ..P..ÿÿÿ
          BSS     42                             * 3A351
        ENDLENGTH                                * 3A37B
          MakeLabel                              * 3A37B
          INVGROB                                * 3A380
        ;                                        * 3A385

* $ -> grob
* refs (3): 3ECA3 3ED1B 9DFBD
MakeBoxLabel:
        ::                                       * 3A38A
          BINT16                                 * 3A38F
          BINT9                                  * 3A394

* 21x8 menu key with box
BoxLabelGrob:
          CON(5)  DOGROB                         * 3A399  DOGROB
          LENGTH                                 * 3A39E  length, to #3A3DD
          NIBHEX  8000051000FFFFFF               * 3A3A3  ..P..ÿÿÿ
          BSS     16                             * 3A3B3
          NIBHEX  E00000E00000E0000000000000     * 3A3C3  .............
        ENDLENGTH                                * 3A3DD
          MakeLabel                              * 3A3DD
          INVGROB                                * 3A3E2
        ;                                        * 3A3E7

* $ -> grob
* refs (5): 3A30A 3ED7A 3F054 3F624 9DF53
MakeDirLabel:
        ::                                       * 3A3EC
          BINT20                                 * 3A3F1
          BINT11                                 * 3A3F6

* 21x8 directory menu key
DirLabelGrob:
          CON(5)  DOGROB                         * 3A3FB  DOGROB
          LENGTH                                 * 3A400  length, to #3A43F
          NIBHEX  80000510001CFFFF               * 3A405  ..P..Áÿÿ
          BSS     42                             * 3A415
        ENDLENGTH                                * 3A43F
          MakeLabel                              * 3A43F
          INVGROB                                * 3A444
        ;                                        * 3A449

* $ -> grob
* refs (3): 154BE 9DF26 9E047
MakeInvLabel:
        ::                                       * 3A44E
          BINT18                                 * 3A453
          BINT11                                 * 3A458

* 21x8 inverse menu key
InvLabelGrob:
          CON(5)  DOGROB                         * 3A45D  DOGROB
          LENGTH                                 * 3A462  length, to #3A4A1
          NIBHEX  8000051000FFFFFF1000011000011000 * 3A467  ..P..ÿÿÿ........
          NIBHEX  01100001100001100001FFFFFF     * 3A487  ..........ÿÿÿ
        ENDLENGTH                                * 3A4A1
          MakeLabel                              * 3A4A1
        ;                                        * 3A4A6

* $ #w #x grob -> grob'
* refs (5): 3A37B 3A3DD 3A43F 3A4A1 9E015
MakeLabel:
        ::                                       * 3A4AB
          TOTEMPSWAP                             * 3A4B0
          2SWAP                                  * 3A4B5
          BINT5                                  * 3A4BA
          3UNROLL                                * 3A4BF
          CENTER$3x5                             * 3A4C4
        ;                                        * 3A4C9

* $ #start #max ->
* refs (4): 140E7 43115 9CC7F D101F
Disp5x7:
        ::                                       * 3A4CE
          BINT1                                  * 3A4D3
          3UNROLL                                * 3A4D8
          OVER#+                                 * 3A4DD
          SWAP                                   * 3A4E2
          DO                                     * 3A4E7
          dup2;spos(st,RC)                       * 3A4EC
          DUP#0=IT                               * 3A4F1
          ::                                     * 3A4F6
            DROP                                 * 3A4FB
            MINUSONE                             * 3A500
            ExitAtLOOP                           * 3A505
          ;                                      * 3A50A
          DUP#1+                                 * 3A50F
          3UNROLL                                * 3A514
          4PICK                                  * 3A519
          3UNROLL                                * 3A51E
          #1-                                    * 3A523
          SUB$                                   * 3A528
          INDEX@                                 * 3A52D
          DISPN                                  * 3A532
          LOOP                                   * 3A537
          2DROP                                  * 3A53C
        ;                                        * 3A541

* ->
* refs (1): 49464
BlankDA1:
        ::                                       * 3A546
          BINT0                                  * 3A54B
          BINT16                                 * 3A550
          BLANKIT                                * 3A555
        ;                                        * 3A55A

* ->
BlankDA2:
        ::                                       * 3A55F
          BINT16                                 * 3A564
          BINT40                                 * 3A569
          BLANKIT                                * 3A56E
        ;                                        * 3A573

* ->
* refs (6): 153C5 19B44 2014C 9E434 9EA36 BB9F4
BlankDA12:
        ::                                       * 3A578
          BINT0                                  * 3A57D
          BINT56                                 * 3A582
          BLANKIT                                * 3A587
        ;                                        * 3A58C

* ->
* refs (2): 43101 8D58E
BlankDA2a:
        ::                                       * 3A591
          BINT16                                 * 3A596
          BINT4                                  * 3A59B
          EDITPARTS                              * 3A5A0
          BINT4                                  * 3A5A5
          #MIN                                   * 3A5AA
          #-                                     * 3A5AF
          #10*                                   * 3A5B4
          DUP#0=case                             * 3A5B9
          2DROP                                  * 3A5BE
          BLANKIT                                * 3A5C3
        ;                                        * 3A5C8

* refs (1): 410B2
OBJ_3A5CD:
        ::                                       * 3A5CD
          CK&DISPATCH0                           * 3A5D2
          BINT5                                  * 3A5D7
          NOP                                    * 3A5DC
          BINT8                                  * 3A5E1
          EVAL                                   * 3A5E6
          BINT15                                 * 3A5EB
          OBJ_3A5FA                              * 3A5F0
        ;                                        * 3A5F5

* refs (1): 3A5F0
OBJ_3A5FA:
        ::                                       * 3A5FA
          DUP                                    * 3A5FF
          OBJ_72BBE                              * 3A604
          #       DOARRY                         * 3A609  address
          #<>case                                * 3A613
          EVAL                                   * 3A618
          DROP                                   * 3A61D
          '                                      * 3A622
          ::                                     * 3A627
            MenuDef@                             * 3A62C
            OBJ_3A640                            * 3A631
          ;                                      * 3A636
        ;                                        * 3A63B

* refs (13): 3A631 3C426 3C478 3C4B0 3C502 3C53A ...
OBJ_3A640:
        ::                                       * 3A640
          2RDROP                                 * 3A645
          MenuRow@                               * 3A64A
          OBJ_3A753                              * 3A64F
          MenuRow!                               * 3A654
          OBJ_41826                              * 3A659
          OBJ_3A939                              * 3A65E
          OBJ_3A929                              * 3A663
          OBJ_3A919                              * 3A668
          OBJ_3A909                              * 3A66D
          OBJ_3A8F9                              * 3A672
          OBJ_3A8E9                              * 3A677
          BINT7                                  * 3A67C
          ONE_DO                                 * 3A681
          OBJ_3A6AE                              * 3A686
          INDEX@                                 * 3A68B
          DUPUNROT                               * 3A690
          OBJ_04A4C                              * 3A695
          OBJ_04A57                              * 3A69A
          LOOP                                   * 3A69F
          OBJ_41815                              * 3A6A4
        ;                                        * 3A6A9

* refs (2): 3A686 411A7
OBJ_3A6AE:
        ::                                       * 3A6AE
          DUPTYPEROMP?                           * 3A6B3
          NOTcase                                * 3A6B8
          OBJ_411D4                              * 3A6BD
          DUP                                    * 3A6C2
          ROMPTRDECOMP                           * 3A6C7
          case                                   * 3A6CC
          ID>$                                   * 3A6D1
          ROMPTR@                                * 3A6D6
          ?SKIP                                  * 3A6DB
          ROMPTR  0A8 000                        * 3A6E0
          OBJ_411D4                              * 3A6EB
        ;                                        * 3A6F0
        FILLTO  #3A71C                           * 3A6F5  39 zero nibbles: the next entry stays at #3A71C

* refs (2): 4D78B 6A81A
DoNextRow:
        ::                                       * 3A71C
          MenuMaker                              * 3A721
          BINT6                                  * 3A726
          SetSomeRow                             * 3A72B
        ;                                        * 3A730

* refs (3): 4D7AE 6A83D CFD28
DoPrevRow:
        ::                                       * 3A735
          MenuMaker                              * 3A73A
          #       FFFFA                          * 3A73F  1048570
          SetSomeRow                             * 3A749
        ;                                        * 3A74E

* refs (1): 3A64F
OBJ_3A753:
        CON(5)  (*)+5                            * 3A753  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 3A758
        R4=A.F  A                                * 3A75F
        A=DAT1  A                                * 3A765
        D1=D1+  5                                * 3A768
        D=D+1   A                                * 3A76B
        GOSBVL  SAVPTR                           * 3A76D
        D0=(5)  KeyRomPtr1                       * 3A774
        LC(5)   DOROMP                           * 3A77B
        P=      5                                * 3A782
        LC(6)   #0000A8                          * 3A784
        P=      0                                * 3A78C
        DAT0=C  11                               * 3A78E
        D0=D0+  11                               * 3A792
        DAT0=C  11                               * 3A795
        D0=D0+  11                               * 3A799
        DAT0=C  11                               * 3A79C
        D0=D0+  11                               * 3A7A0
        DAT0=C  11                               * 3A7A3
        D0=D0+  11                               * 3A7A7
        DAT0=C  11                               * 3A7AA
        D0=D0+  11                               * 3A7AE
        DAT0=C  11                               * 3A7B1
        GOSBVL  SUB_07ED8                        * 3A7B5
        ?ST=1   1                                * 3A7BC
        GOYES   L_3A7D6                          * 3A7BF
        GOSUB   SUB_3A83B                        * 3A7C1
L_3A7C5:
        GOSUB   SUB_3A8B9                        * 3A7C5
        A=R4.F  A                                * 3A7C9
        GOVLNG  PUSH#ALOOP                       * 3A7CF
L_3A7D6:
        D0=(5)  #800FF                           * 3A7D6
        C=DAT0  A                                * 3A7DD
        R3=C.F  A                                * 3A7E0
        P=      0                                * 3A7E6
        GOSUB   SUB_3A837                        * 3A7E8
        GOSUB   SUB_3A83B                        * 3A7EC
        A=B     A                                * 3A7F0
        R2=A.F  A                                * 3A7F2
        C=0     S                                * 3A7F8
        R0=C.F  A                                * 3A7FB
        LC(5)   IRAMBUFF                         * 3A801
        R1=C.F  A                                * 3A808
        A=A+1   A                                * 3A80E
        C=A     A                                * 3A810
        C=C+C   A                                * 3A812
        A=A+C   A                                * 3A814
        A=A+A   A                                * 3A816
        P=      2                                * 3A818
        C=R3.F  A                                * 3A81A
        GOSUB   SUB_3A837                        * 3A820
        C=R2.F  A                                * 3A824
        B=C     A                                * 3A82A
        LC(5)   IRAMBUFF                         * 3A82C
        GOTO    L_3A7C5                          * 3A833

* refs (2): 3A7E8 3A820
SUB_3A837:
        RSTK=C                                   * 3A837
        RTN                                      * 3A839

* refs (2): 3A7C1 3A7EC
SUB_3A83B:
        D1=A                                     * 3A83B
        D1=D1+  10                               * 3A83E
        D1=D1+  10                               * 3A841
        C=DAT1  A                                * 3A844
        A=R4.F  A                                * 3A847
        ?C>=A   A                                * 3A84D
        GOYES   L_3A85F                          * 3A850
        GOSUB   SUB_3A883                        * 3A852
        R4=A.F  A                                * 3A856
        C=DAT1  A                                * 3A85C
L_3A85F:
        C=C-A   A                                * 3A85F
        B=C     A                                * 3A861
        C=0     A                                * 3A863
        LC(1)   #5                               * 3A865
        ?B<=C   A                                * 3A868
        GOYES   L_3A86F                          * 3A86B
        B=C     A                                * 3A86D
L_3A86F:
        D1=D1+  5                                * 3A86F
        A=A-1   A                                * 3A872
        C=A     A                                * 3A874
        C=C+C   A                                * 3A876
        A=A+C   A                                * 3A878
        A=A+A   A                                * 3A87A
        CD1EX                                    * 3A87C
        C=C+A   A                                * 3A87F
        RTN                                      * 3A881

* refs (1): 3A852
SUB_3A883:
        B=C     A                                * 3A883
        LC(5)   #FFFFB                           * 3A885
        ?C=A    A                                * 3A88C
        GOYES   L_3A897                          * 3A88F
        A=0     A                                * 3A891
        A=A+1   A                                * 3A893
        RTN                                      * 3A895
L_3A897:
        A=B     A                                * 3A897
        R0=A.F  A                                * 3A899
        A=A-1   A                                * 3A89F
        C=0     A                                * 3A8A1
        LC(1)   #6                               * 3A8A3
        GOSBVL  IntDiv                           * 3A8A6
        C=R0.F  A                                * 3A8AD
        C=C-A   A                                * 3A8B3
        A=C     A                                * 3A8B5
        RTN                                      * 3A8B7

* refs (1): 3A7C5
SUB_3A8B9:
        D0=C                                     * 3A8B9
        D1=(5)  #80961                           * 3A8BC
L_3A8C3:
        C=DAT0  6                                * 3A8C3
        DAT1=C  6                                * 3A8C7
        B=B-1   A                                * 3A8CB
        RTNC                                     * 3A8CD
        D0=D0+  6                                * 3A8D0
        D1=D1+  11                               * 3A8D3
        GONC    L_3A8C3                          * 3A8D6
        B=C-B   A                                * 3A8D9
        ?D=C    A                                * 3A8DB
        GOYES   L_3A91E+3                        * 3A8DE
        DAT1=A  1                                * 3A8E0
        ?ST=0   15                               * 3A8E4
        GOYES   OBJ_3A8E9+3                      * 3A8E7

* refs (1): 3A677
OBJ_3A8E9:
        CON(5)  (*)+5                            * 3A8E9  primitive code object
        LC(5)   KeyRomPtr1                       * 3A8EE
        GOTO    L_3A945                          * 3A8F5

* refs (1): 3A672
OBJ_3A8F9:
        CON(5)  (*)+5                            * 3A8F9  primitive code object
        LC(5)   KeyRomPtr2                       * 3A8FE
        GOTO    L_3A945                          * 3A905

* refs (1): 3A66D
OBJ_3A909:
        CON(5)  (*)+5                            * 3A909  primitive code object
        LC(5)   KeyRomPtr3                       * 3A90E
        GOTO    L_3A945                          * 3A915

* refs (1): 3A668
OBJ_3A919:
        CON(5)  (*)+5                            * 3A919  primitive code object
* a branch also enters #3A921, where the nibbles decode as GOSUB #3A12E
L_3A91E:
        LC(5)   KeyRomPtr4                       * 3A91E
        GOTO    L_3A945                          * 3A925

* refs (1): 3A663
OBJ_3A929:
        CON(5)  (*)+5                            * 3A929  primitive code object
        LC(5)   KeyRomPtr5                       * 3A92E
        GOTO    L_3A945                          * 3A935

* refs (1): 3A65E
OBJ_3A939:
        CON(5)  (*)+5                            * 3A939  primitive code object
        LC(5)   KeyRomPtr6                       * 3A93E
L_3A945:
        A=C     A                                * 3A945
        GOVLNG  DOBINT                           * 3A947

* refs (1): 3FB1F
OBJ_3A94E:
        CON(5)  (*)+5                            * 3A94E  primitive code object
        GOSBVL  POP#                             * 3A953
        LC(5)   #000A0                           * 3A95A
        A=A+C   A                                * 3A961
        LC(5)   #80956                           * 3A963
        CD0EX                                    * 3A96A
        R0=C.F  A                                * 3A96D
        DAT0=A  3                                * 3A973
        C=DAT1  A                                * 3A977
        CD1EX                                    * 3A97A
        D1=D1+  5                                * 3A97D
        A=DAT1  A                                * 3A980
        A=A-1   A                                * 3A983
        D0=D0+  3                                * 3A985
        DAT0=A  3                                * 3A988
        LA(5)   DOROMP                           * 3A98C
        D0=D0-  8                                * 3A996
        DAT0=A  A                                * 3A999
        D1=C                                     * 3A99C
        CD0EX                                    * 3A99F
        DAT1=C  A                                * 3A9A2
        C=R0.F  A                                * 3A9A5
        D0=C                                     * 3A9AB
        A=DAT0  A                                * 3A9AE
        D0=D0+  5                                * 3A9B1
        PC=(A)                                   * 3A9B4

* -> DROPFALSE
* refs (82): A2DF6 A49EA A4A3A A4A8A A4AE5 A4BA0 ...
'DROPFALSE:
        CON(5)  (*)+5                            * 3A9B8  primitive code object
        LC(5)   DROPFALSE                        * 3A9BD
        A=C     A                                * 3A9C4
        GOVLNG  PUSHA                            * 3A9C6
        NIBHEX  0                                * 3A9CD
        RPL

* refs (2): 4D0AB 4D853
TurnOffKey:
        ::                                       * 3A9CE
          Modifier                               * 3A9D3
          TurnOff                                * 3A9D8
          SetDA123NoCh                           * 3A9DD
        ;                                        * 3A9E2

* #n ->
* refs (5): 3A72B 3A749 3B3C8 3D802 CFCCF
SetSomeRow:
        ::                                       * 3A9E7
          MenuRow@                               * 3A9EC
          #+                                     * 3A9F1
          MenuRow!                               * 3A9F6
          SetThisRow                             * 3A9FB
          OBJ_418E4                              * 3AA00
        ;                                        * 3AA05

* ->
* refs (1): 3B72B
1A/LockA:
        ::                                       * 3AA0A
          Modifier                               * 3AA0F
          SetDA123NoCh                           * 3AA14
          BINT60                                 * 3AA19
          TestSysFlag                            * 3AA1E
          case                                   * 3AA23
          LockAlpha                              * 3AA28
          àShiftOnly                             * 3AA2D
        ;                                        * 3AA32

        ::                                       * 3AA37
          DoDelims                               * 3AA3C
          $_<<>>                                 * 3AA41
          ?ClrAlgSetPr                           * 3AA46
        ;                                        * 3AA4B

* refs (1): C62C7
OBJ_3AA50:
        CON(5)  (*)+5                            * 3AA50  primitive code object
        ASSEMBLE
        AD0EX                                    * 3AA55
        D0=(5)  SystemFlags                      * 3AA58
        P=      8                                * 3AA5F
        LC(8)   #00000000                        * 3AA61
        P=      0                                * 3AA6B
        LC(8)   #000003F0                        * 3AA6D
        DAT0=C  W                                * 3AA77
        AD0EX                                    * 3AA7B
        A=DAT0  A                                * 3AA7E
        D0=D0+  5                                * 3AA81
        PC=(A)                                   * 3AA84
        CSL     A                                * 3AA88
        LC(1)   #0                               * 3AA8A
        RTNSXM                                   * 3AA8D

LIB0A6:
        CON(3)  #0A6                             * 3AA8F  library number
        REL(5)  LIB0A6.hash                      * 3AA92  hash table
        CON(5)  0                                * 3AA97  message table
        REL(5)  LIB0A6.link                      * 3AA9C  link table
        CON(5)  0                                * 3AAA1  config
        RPL

* ROMPTR 0A6 000
* refs (1): 3AA8F
K_140:
        CHR     "α"                              * 3AAA6

* ROMPTR 0A6 001
* refs (1): 3AA8F
K_223:
        CHR     "ß"                              * 3AAAD

* ROMPTR 0A6 002
* refs (1): 3AA8F
K_155:
        CHR     "Δ"                              * 3AAB4

* ROMPTR 0A6 003
* refs (1): 3AA8F
K_146:
        CHR     "δ"                              * 3AABB

* ROMPTR 0A6 004
* refs (1): 3AA8F
K_147:
        CHR     "ε"                              * 3AAC2

* ROMPTR 0A6 005
* refs (1): 3AA8F
K_149:
        CHR     "θ"                              * 3AAC9

* ROMPTR 0A6 006
* refs (1): 3AA8F
K_145:
        CHR     "γ"                              * 3AAD0

* ROMPTR 0A6 007
* refs (1): 3AA8F
K_148:
        CHR     "η"                              * 3AAD7

* ROMPTR 0A6 008
* refs (1): 3AA8F
K_159:
        CHR     "∞"                              * 3AADE

* ROMPTR 0A6 009
* refs (1): 3AA8F
K__!_:
        CHR     "|"                              * 3AAE5

* ROMPTR 0A6 00A
* refs (1): 3AA8F
K_144:
        CHR     "↑"                              * 3AAEC

* ROMPTR 0A6 00B
* refs (1): 3AA8F
K_150:
        CHR     "λ"                              * 3AAF3

* ROMPTR 0A6 00C
* refs (1): 3AA8F
K__'_:
        CHR     "'"                              * 3AAFA

* ROMPTR 0A6 00D
* refs (1): 3AA8F
K_181:
        CHR     "µ"                              * 3AB01

* ROMPTR 0A6 00E
* refs (1): 3AA8F
K_157:
        CHR     "Ω"                              * 3AB08

* ROMPTR 0A6 00F
* refs (1): 3AA8F
K_142:
        CHR     "←"                              * 3AB0F

* ROMPTR 0A6 010
* refs (1): 3AA8F
K_143:
        CHR     "↓"                              * 3AB16

* ROMPTR 0A6 011
* refs (1): 3AA8F
K_151:
        CHR     "ρ"                              * 3AB1D

* ROMPTR 0A6 012
* refs (1): 3AA8F
K_152:
        CHR     "σ"                              * 3AB24

* ROMPTR 0A6 013
* refs (1): 3AA8F
K_153:
        CHR     "τ"                              * 3AB2B

* ROMPTR 0A6 014
* refs (1): 3AA8F
K__%_:
        CHR     "%"                              * 3AB32

* ROMPTR 0A6 015
* refs (1): 3AA8F
K__~_:
        CHR     "~"                              * 3AB39

* ROMPTR 0A6 016
* refs (1): 3AA8F
K_154:
        CHR     "ω"                              * 3AB40

* ROMPTR 0A6 017
* refs (1): 3AA8F
K_129:
        CHR     "ā"                              * 3AB47

* ROMPTR 0A6 018
* refs (2): 3AA8F 6BD30
K__ë_:
        CHR     "@"                              * 3AB4E

* ROMPTR 0A6 019
* refs (1): 3AA8F
K_177:
        CHR     "±"                              * 3AB55

* ROMPTR 0A6 01A
* refs (1): 3AA8F
K_156:
        CHR     "Π"                              * 3AB5C

* ROMPTR 0A6 01B
* refs (1): 3AA8F
K_161:
        CHR     "¡"                              * 3AB63

* ROMPTR 0A6 01C
* refs (1): 3AA8F
K_191:
        CHR     "¿"                              * 3AB6A

* ROMPTR 0A6 01D
* refs (1): 3AA8F
ROMP_0A6_01D:
        ::                                       * 3AB71
          TakeOver                               * 3AB76
          InvCursor                              * 3AB7B
          SetDA12NoCh                            * 3AB80
        ;                                        * 3AB85

* ROMPTR 0A6 01E
* refs (1): 3AA8F
ROMP_0A6_01E:
        ::                                       * 3AB8A
          OBJ_3F247                              * 3AB8F
          BINT1                                  * 3AB94
        ;                                        * 3AB99

* ROMPTR 0A6 01F
* refs (1): 3AA8F
ROMP_0A6_01F:
        ::                                       * 3AB9E
          OBJ_3F247                              * 3ABA3
          BINT3                                  * 3ABA8
        ;                                        * 3ABAD

* ROMPTR 0A6 020
* refs (1): 3AA8F
ROMP_0A6_020:
        ::                                       * 3ABB2
          OBJ_3F247                              * 3ABB7
          BINT5                                  * 3ABBC
        ;                                        * 3ABC1

* ROMPTR 0A6 021
* refs (1): 3AA8F
K__#_:
        CHR     "#"                              * 3ABC6

* ROMPTR 0A6 022
* refs (1): 3AA8F
ROMP_0A6_022:
        ROMPTR  0A4 022                          * 3ABCD

* ROMPTR 0A6 023
* refs (1): 3AA8F
K_162:
        CHR     "¢"                              * 3ABD8

* ROMPTR 0A6 024
* refs (1): 3AA8F
K_165:
        CHR     "¥"                              * 3ABDF

* ROMPTR 0A6 025
* refs (1): 3AA8F
K_176:
        CHR     "°"                              * 3ABE6

* ROMPTR 0A6 026
* refs (1): 3AA8F
K____:
        CHR     "_"                              * 3ABED

* ROMPTR 0A6 027
* refs (1): 3AA8F
ROMP_0A6_027:
        ROMPTR  0A5 022                          * 3ABF4

* ROMPTR 0A6 028
* refs (1): 3AA8F
K_139:
        CHR     "≠"                              * 3ABFF

* ROMPTR 0A6 029
* refs (1): 3AA8F
K__>_:
        CHR     ">"                              * 3AC06

* ROMPTR 0A6 02A
* refs (1): 3AA8F
K_138:
        CHR     "≥"                              * 3AC0D

* ROMPTR 0A6 02B
* refs (1): 3AA8F
K_____3AC14:
        CHR     "\""                             * 3AC14

* ROMPTR 0A6 02C
* refs (1): 3AA8F
ROMP_0A6_02C:
        ::                                       * 3AC1B
          Modifier                               * 3AC20
          TurnOff                                * 3AC25
          SetDA123NoCh                           * 3AC2A
        ;                                        * 3AC2F

* ROMPTR 0A6 02D
* refs (1): 3AA8F
K_141:
        CHR     "→"                              * 3AC34

* ROMPTR 0A6 02E
* refs (1): 3AA8F
ROMP_0A6_02E:
        ROMPTR  0A3 02E                          * 3AC3B

* ROMPTR 0A6 02F
* refs (1): 3AA8F
K_128:
        CHR     "∡"                              * 3AC46

* ROMPTR 0A6 030
* refs (1): 3AA8F
K__:_:
        CHR     ":"                              * 3AC4D

LIB0A6.hash:
        CON(5)  DOHSTR                           * 3AC54  hash table of library 0A6
        LENGTH                                   * 3AC59  length, to #3ACB8
        CON(5)  0                                * 3AC5E  names of length 1
        CON(5)  0                                * 3AC63  names of length 2
        CON(5)  0                                * 3AC68  names of length 3
        CON(5)  0                                * 3AC6D  names of length 4
        CON(5)  0                                * 3AC72  names of length 5
        CON(5)  0                                * 3AC77  names of length 6
        CON(5)  0                                * 3AC7C  names of length 7
        CON(5)  0                                * 3AC81  names of length 8
        CON(5)  0                                * 3AC86  names of length 9
        CON(5)  0                                * 3AC8B  names of length 10
        CON(5)  0                                * 3AC90  names of length 11
        CON(5)  0                                * 3AC95  names of length 12
        CON(5)  0                                * 3AC9A  names of length 13
        CON(5)  0                                * 3AC9F  names of length 14
        CON(5)  0                                * 3ACA4  names of length 15
        CON(5)  0                                * 3ACA9  names of length 16
        REL(5)  L_3ACB3                          * 3ACAE  end of the names
L_3ACB3:
        CON(5)  0                                * 3ACB3  command 000 has no name
        ENDLENGTH                                * 3ACB8

LIB0A6.link:
        CON(5)  DOHSTR                           * 3ACB8  link table of library 0A6
        LENGTH                                   * 3ACBD  length, to #3ADB7
        REL(5)  K_140                            * 3ACC2  000 
        REL(5)  K_223                            * 3ACC7  001 
        REL(5)  K_155                            * 3ACCC  002 
        REL(5)  K_146                            * 3ACD1  003 
        REL(5)  K_147                            * 3ACD6  004 
        REL(5)  K_149                            * 3ACDB  005 
        REL(5)  K_145                            * 3ACE0  006 
        REL(5)  K_148                            * 3ACE5  007 
        REL(5)  K_159                            * 3ACEA  008 
        REL(5)  K__!_                            * 3ACEF  009 
        REL(5)  K_144                            * 3ACF4  00A 
        REL(5)  K_150                            * 3ACF9  00B 
        REL(5)  K__'_                            * 3ACFE  00C 
        REL(5)  K_181                            * 3AD03  00D 
        REL(5)  K_157                            * 3AD08  00E 
        REL(5)  K_142                            * 3AD0D  00F 
        REL(5)  K_143                            * 3AD12  010 
        REL(5)  K_151                            * 3AD17  011 
        REL(5)  K_152                            * 3AD1C  012 
        REL(5)  K_153                            * 3AD21  013 
        REL(5)  K__%_                            * 3AD26  014 
        REL(5)  K__~_                            * 3AD2B  015 
        REL(5)  K_154                            * 3AD30  016 
        REL(5)  K_129                            * 3AD35  017 
        REL(5)  K__ë_                            * 3AD3A  018 
        REL(5)  K_177                            * 3AD3F  019 
        REL(5)  K_156                            * 3AD44  01A 
        REL(5)  K_161                            * 3AD49  01B 
        REL(5)  K_191                            * 3AD4E  01C 
        REL(5)  ROMP_0A6_01D                     * 3AD53  01D 
        REL(5)  ROMP_0A6_01E                     * 3AD58  01E 
        REL(5)  ROMP_0A6_01F                     * 3AD5D  01F 
        REL(5)  ROMP_0A6_020                     * 3AD62  020 
        REL(5)  K__#_                            * 3AD67  021 
        REL(5)  ROMP_0A6_022                     * 3AD6C  022 
        REL(5)  K_162                            * 3AD71  023 
        REL(5)  K_165                            * 3AD76  024 
        REL(5)  K_176                            * 3AD7B  025 
        REL(5)  K____                            * 3AD80  026 
        REL(5)  ROMP_0A6_027                     * 3AD85  027 
        REL(5)  K_139                            * 3AD8A  028 
        REL(5)  K__>_                            * 3AD8F  029 
        REL(5)  K_138                            * 3AD94  02A 
        REL(5)  K_____3AC14                      * 3AD99  02B 
        REL(5)  ROMP_0A6_02C                     * 3AD9E  02C 
        REL(5)  K_141                            * 3ADA3  02D 
        REL(5)  ROMP_0A6_02E                     * 3ADA8  02E 
        REL(5)  K_128                            * 3ADAD  02F 
        REL(5)  K__:_                            * 3ADB2  030 
        ENDLENGTH                                * 3ADB7
        NIBHEX  0000                             * 3ADB7  ..

* refs (1): 3D8DA
OBJ_3ADBB:
        ::                                       * 3ADBB
          CK1NOLASTWD                            * 3ADC0
          CK&DISPATCH1                           * 3ADC5
          BINT6                                  * 3ADCA
          Visit(nm)                              * 3ADCF
          BINT7                                  * 3ADD4
          Visit(nm)                              * 3ADD9
          BINT0                                  * 3ADDE
          EditLevel1                             * 3ADE3
        ;                                        * 3ADE8

DoPlotMenu:
        ::                                       * 3ADED
          MenuMaker                              * 3ADF2
          ROMPTR  0A9 051                        * 3ADF7
          DoMenuKey                              * 3AE02
        ;                                        * 3AE07

* refs (1): 1520A
OBJ_3AE0C:
        ::                                       * 3AE0C
          MenuMaker                              * 3AE11
          ROMPTR  0A9 04A                        * 3AE16
          DoMenuKey                              * 3AE21
        ;                                        * 3AE26

* refs (1): 43F17
OBJ_3AE2B:
        ::                                       * 3AE2B
          '                                      * 3AE30
          ::                                     * 3AE35
            CK1NOLASTWD                          * 3AE3A
            CK&DISPATCH1                         * 3AE3F
            BINT1                                * 3AE44
            BestEditLevel(r)                     * 3AE49
            BINT6                                * 3AE4E
            BestVisit(nm)                        * 3AE53
            BINT7                                * 3AE58
            BestVisit(nm)                        * 3AE5D
          ;                                      * 3AE62
          DoKeyOb                                * 3AE67
        ;                                        * 3AE6C

* refs (1): 43F5D
OBJ_3AE71:
        ::                                       * 3AE71
          CK1NOLASTWD                            * 3AE76
          CK&DISPATCH1                           * 3AE7B
          BINT1                                  * 3AE80
          OBJ_42DFF                              * 3AE85
          BINT6                                  * 3AE8A
          Visit(nm)                              * 3AE8F
          BINT7                                  * 3AE94
          Visit(nm)                              * 3AE99
        ;                                        * 3AE9E
        NIBHEX  B330000                          * 3AEA3  ;..

LIB0A4:
        CON(3)  #0A4                             * 3AEAA  library number
        REL(5)  LIB0A4.hash                      * 3AEAD  hash table
        CON(5)  0                                * 3AEB2  message table
        REL(5)  LIB0A4.link                      * 3AEB7  link table
        CON(5)  0                                * 3AEBC  config

* ROMPTR 0A4 000
* refs (1): 3AEAA
ROMP_0A4_000:
        CHR     "A"                              * 3AEC1

* ROMPTR 0A4 001
* refs (1): 3AEAA
K__B_:
        CHR     "B"                              * 3AEC8

* ROMPTR 0A4 002
* refs (1): 3AEAA
K__C_:
        CHR     "C"                              * 3AECF

* ROMPTR 0A4 003
* refs (1): 3AEAA
K__D_:
        CHR     "D"                              * 3AED6

* ROMPTR 0A4 004
* refs (1): 3AEAA
K__E_:
        CHR     "E"                              * 3AEDD

* ROMPTR 0A4 005
* refs (1): 3AEAA
K__F_:
        CHR     "F"                              * 3AEE4

* ROMPTR 0A4 006
* refs (1): 3AEAA
K__G_:
        CHR     "G"                              * 3AEEB

* ROMPTR 0A4 007
* refs (1): 3AEAA
K__H_:
        CHR     "H"                              * 3AEF2

* ROMPTR 0A4 008
* refs (1): 3AEAA
K__I_:
        CHR     "I"                              * 3AEF9

* ROMPTR 0A4 009
* refs (1): 3AEAA
K__J_:
        CHR     "J"                              * 3AF00

* ROMPTR 0A4 00A
* refs (1): 3AEAA
K__K_:
        CHR     "K"                              * 3AF07

* ROMPTR 0A4 00B
* refs (1): 3AEAA
K__L_:
        CHR     "L"                              * 3AF0E

* ROMPTR 0A4 00C
* refs (1): 3AEAA
K__M_:
        CHR     "M"                              * 3AF15

* ROMPTR 0A4 00D
* refs (1): 3AEAA
K__N_:
        CHR     "N"                              * 3AF1C

* ROMPTR 0A4 00E
* refs (1): 3AEAA
K__O_:
        CHR     "O"                              * 3AF23

* ROMPTR 0A4 00F
* refs (1): 3AEAA
K__P_:
        CHR     "P"                              * 3AF2A

* ROMPTR 0A4 010
* refs (1): 3AEAA
K__Q_:
        CHR     "Q"                              * 3AF31

* ROMPTR 0A4 011
* refs (1): 3AEAA
K__R_:
        CHR     "R"                              * 3AF38

* ROMPTR 0A4 012
* refs (1): 3AEAA
K__S_:
        CHR     "S"                              * 3AF3F

* ROMPTR 0A4 013
* refs (1): 3AEAA
K__T_:
        CHR     "T"                              * 3AF46

* ROMPTR 0A4 014
* refs (1): 3AEAA
K__U_:
        CHR     "U"                              * 3AF4D

* ROMPTR 0A4 015
* refs (1): 3AEAA
K__V_:
        CHR     "V"                              * 3AF54

* ROMPTR 0A4 016
* refs (1): 3AEAA
K__W_:
        CHR     "W"                              * 3AF5B

* ROMPTR 0A4 017
* refs (1): 3AEAA
K__X_:
        CHR     "X"                              * 3AF62

* ROMPTR 0A4 018
* refs (1): 3AEAA
ROMP_0A4_018:
        ROMPTR  0A1 018                          * 3AF69

* ROMPTR 0A4 019
* refs (1): 3AEAA
K__Y_:
        CHR     "Y"                              * 3AF74

* ROMPTR 0A4 01A
* refs (1): 3AEAA
K__Z_:
        CHR     "Z"                              * 3AF7B

* ROMPTR 0A4 01B
* refs (1): 3AEAA
ROMP_0A4_01B:
        ROMPTR  0A1 01B                          * 3AF82

* ROMPTR 0A4 01C
* refs (1): 3AEAA
ROMP_0A4_01C:
        ROMPTR  0A1 01C                          * 3AF8D

* ROMPTR 0A4 01D
* refs (1): 3AEAA
ROMP_0A4_01D:
        ::                                       * 3AF98
          Modifier                               * 3AF9D
          SetDA123NoCh                           * 3AFA2
          BINT60                                 * 3AFA7
          TestSysFlag                            * 3AFAC
          Lock?                                  * 3AFB1
          ORcase                                 * 3AFB6
          UnLockAlpha                            * 3AFBB
          LockAlpha                              * 3AFC0
        ;                                        * 3AFC5

* ROMPTR 0A4 01E
* refs (1): 3AEAA
K__7_:
        CHR     "7"                              * 3AFCA

* ROMPTR 0A4 01F
* refs (1): 3AEAA
K__8_:
        CHR     "8"                              * 3AFD1

* ROMPTR 0A4 020
* refs (1): 3AEAA
K__9_:
        CHR     "9"                              * 3AFD8

* ROMPTR 0A4 021
* refs (1): 3AEAA
K__/_:
        CHR     "/"                              * 3AFDF

* ROMPTR 0A4 022
* refs (1): 3AEAA
ROMP_0A4_022:
        ::                                       * 3AFE6
          Modifier                               * 3AFEB
          àLShiftOnly                            * 3AFF0
          SetDA123NoCh                           * 3AFF5
        ;                                        * 3AFFA

* ROMPTR 0A4 023
* refs (1): 3AEAA
K__4_:
        CHR     "4"                              * 3AFFF

* ROMPTR 0A4 024
* refs (1): 3AEAA
K__5_:
        CHR     "5"                              * 3B006

* ROMPTR 0A4 025
* refs (1): 3AEAA
ROMP_0A4_025:
        CHR     "6"                              * 3B00D

* ROMPTR 0A4 026
* refs (1): 3AEAA
K__*_:
        CHR     "*"                              * 3B014

* ROMPTR 0A4 027
* refs (1): 3AEAA
ROMP_0A4_027:
        ::                                       * 3B01B
          Modifier                               * 3B020
          àRShiftOnly                            * 3B025
          SetDA123NoCh                           * 3B02A
        ;                                        * 3B02F

* ROMPTR 0A4 028
* refs (1): 3AEAA
K__1_:
        CHR     "1"                              * 3B034

* ROMPTR 0A4 029
* refs (1): 3AEAA
K__2_:
        CHR     "2"                              * 3B03B

* ROMPTR 0A4 02A
* refs (1): 3AEAA
K__3_:
        CHR     "3"                              * 3B042

* ROMPTR 0A4 02B
* refs (1): 3AEAA
K__~__3B049:
        CHR     "-"                              * 3B049

* ROMPTR 0A4 02C
* refs (1): 3AEAA
ROMP_0A4_02C:
        ROMPTR  0A1 02C                          * 3B050

* ROMPTR 0A4 02D
* refs (1): 3AEAA
K__0_:
        CHR     "0"                              * 3B05B

* ROMPTR 0A4 02E
* refs (2): 3AEAA 6BCD6
ROMP_0A4_02E:
        ROMPTR  0A1 02E                          * 3B062

* ROMPTR 0A4 02F
* refs (2): 3AEAA 6BD1C
ROMP_0A4_02F:
        CHR     " "                              * 3B06D

* ROMPTR 0A4 030
* refs (1): 3AEAA
K__+_:
        CHR     "+"                              * 3B074

LIB0A4.hash:
        CON(5)  DOHSTR                           * 3B07B  hash table of library 0A4
        LENGTH                                   * 3B080  length, to #3B0DF
        CON(5)  0                                * 3B085  names of length 1
        CON(5)  0                                * 3B08A  names of length 2
        CON(5)  0                                * 3B08F  names of length 3
        CON(5)  0                                * 3B094  names of length 4
        CON(5)  0                                * 3B099  names of length 5
        CON(5)  0                                * 3B09E  names of length 6
        CON(5)  0                                * 3B0A3  names of length 7
        CON(5)  0                                * 3B0A8  names of length 8
        CON(5)  0                                * 3B0AD  names of length 9
        CON(5)  0                                * 3B0B2  names of length 10
        CON(5)  0                                * 3B0B7  names of length 11
        CON(5)  0                                * 3B0BC  names of length 12
        CON(5)  0                                * 3B0C1  names of length 13
        CON(5)  0                                * 3B0C6  names of length 14
        CON(5)  0                                * 3B0CB  names of length 15
        CON(5)  0                                * 3B0D0  names of length 16
        REL(5)  L_3B0DA                          * 3B0D5  end of the names
L_3B0DA:
        CON(5)  0                                * 3B0DA  command 000 has no name
        ENDLENGTH                                * 3B0DF

LIB0A4.link:
        CON(5)  DOHSTR                           * 3B0DF  link table of library 0A4
        LENGTH                                   * 3B0E4  length, to #3B1DE
        REL(5)  ROMP_0A4_000                     * 3B0E9  000 
        REL(5)  K__B_                            * 3B0EE  001 
        REL(5)  K__C_                            * 3B0F3  002 
        REL(5)  K__D_                            * 3B0F8  003 
        REL(5)  K__E_                            * 3B0FD  004 
        REL(5)  K__F_                            * 3B102  005 
        REL(5)  K__G_                            * 3B107  006 
        REL(5)  K__H_                            * 3B10C  007 
        REL(5)  K__I_                            * 3B111  008 
        REL(5)  K__J_                            * 3B116  009 
        REL(5)  K__K_                            * 3B11B  00A 
        REL(5)  K__L_                            * 3B120  00B 
        REL(5)  K__M_                            * 3B125  00C 
        REL(5)  K__N_                            * 3B12A  00D 
        REL(5)  K__O_                            * 3B12F  00E 
        REL(5)  K__P_                            * 3B134  00F 
        REL(5)  K__Q_                            * 3B139  010 
        REL(5)  K__R_                            * 3B13E  011 
        REL(5)  K__S_                            * 3B143  012 
        REL(5)  K__T_                            * 3B148  013 
        REL(5)  K__U_                            * 3B14D  014 
        REL(5)  K__V_                            * 3B152  015 
        REL(5)  K__W_                            * 3B157  016 
        REL(5)  K__X_                            * 3B15C  017 
        REL(5)  ROMP_0A4_018                     * 3B161  018 
        REL(5)  K__Y_                            * 3B166  019 
        REL(5)  K__Z_                            * 3B16B  01A 
        REL(5)  ROMP_0A4_01B                     * 3B170  01B 
        REL(5)  ROMP_0A4_01C                     * 3B175  01C 
        REL(5)  ROMP_0A4_01D                     * 3B17A  01D 
        REL(5)  K__7_                            * 3B17F  01E 
        REL(5)  K__8_                            * 3B184  01F 
        REL(5)  K__9_                            * 3B189  020 
        REL(5)  K__/_                            * 3B18E  021 
        REL(5)  ROMP_0A4_022                     * 3B193  022 
        REL(5)  K__4_                            * 3B198  023 
        REL(5)  K__5_                            * 3B19D  024 
        REL(5)  ROMP_0A4_025                     * 3B1A2  025 
        REL(5)  K__*_                            * 3B1A7  026 
        REL(5)  ROMP_0A4_027                     * 3B1AC  027 
        REL(5)  K__1_                            * 3B1B1  028 
        REL(5)  K__2_                            * 3B1B6  029 
        REL(5)  K__3_                            * 3B1BB  02A 
        REL(5)  K__~__3B049                      * 3B1C0  02B 
        REL(5)  ROMP_0A4_02C                     * 3B1C5  02C 
        REL(5)  K__0_                            * 3B1CA  02D 
        REL(5)  ROMP_0A4_02E                     * 3B1CF  02E 
        REL(5)  ROMP_0A4_02F                     * 3B1D4  02F 
        REL(5)  K__+_                            * 3B1D9  030 
        ENDLENGTH                                * 3B1DE
        FILLTO  #3B211                           * 3B1DE  51 zero nibbles: the next entry stays at #3B211

* ->
* refs (2): 6A860 CFD81
DoFirstRow:
        ::                                       * 3B211
          MenuMaker                              * 3B216
          BINT1                                  * 3B21B
          MenuRow!                               * 3B220
          SetThisRow                             * 3B225
          OBJ_418E4                              * 3B22A
        ;                                        * 3B22F
        NIBHEX  A570000                          * 3B234  Z..

LIB0A1:
        CON(3)  #0A1                             * 3B23B  library number
        REL(5)  LIB0A1.hash                      * 3B23E  hash table
        CON(5)  0                                * 3B243  message table
        REL(5)  LIB0A1.link                      * 3B248  link table
        CON(5)  0                                * 3B24D  config

* ROMPTR 0A1 000
* refs (1): 3B23B
NoShift1:
        ::                                       * 3B252
          MenuKey                                * 3B257
          BINT1                                  * 3B25C
          DoMenuKeyNS                            * 3B261
        ;                                        * 3B266

* ROMPTR 0A1 001
* refs (1): 3B23B
NoShift2:
        ::                                       * 3B26B
          MenuKey                                * 3B270
          BINT2                                  * 3B275
          DoMenuKeyNS                            * 3B27A
        ;                                        * 3B27F

* ROMPTR 0A1 002
* refs (1): 3B23B
NoShift3:
        ::                                       * 3B284
          MenuKey                                * 3B289
          BINT3                                  * 3B28E
          DoMenuKeyNS                            * 3B293
        ;                                        * 3B298

* ROMPTR 0A1 003
* refs (1): 3B23B
NoShift4:
        ::                                       * 3B29D
          MenuKey                                * 3B2A2
          BINT4                                  * 3B2A7
          DoMenuKeyNS                            * 3B2AC
        ;                                        * 3B2B1

* ROMPTR 0A1 004
* refs (1): 3B23B
NoShift5:
        ::                                       * 3B2B6
          MenuKey                                * 3B2BB
          BINT5                                  * 3B2C0
          DoMenuKeyNS                            * 3B2C5
        ;                                        * 3B2CA

* ROMPTR 0A1 005
* refs (1): 3B23B
NoShift6:
        ::                                       * 3B2CF
          MenuKey                                * 3B2D4
          BINT6                                  * 3B2D9
          DoMenuKeyNS                            * 3B2DE
        ;                                        * 3B2E3

* ROMPTR 0A1 006
* refs (1): 3B23B
MenuMTH:
        ::                                       * 3B2E8
          MenuMaker                              * 3B2ED

* refs (1): 41382
OBJ_3B2F2:
          ROMPTR  0A9 003                        * 3B2F2
          DoMenuKey                              * 3B2FD
        ;                                        * 3B302

* ROMPTR 0A1 007
* refs (1): 3B23B
MenuPr:
        ::                                       * 3B307
          MenuMaker                              * 3B30C
          ROMPTR  0A9 016                        * 3B311
          DoMenuKey                              * 3B31C
        ;                                        * 3B321

* ROMPTR 0A1 008
* refs (1): 3B23B
MenuCST:
        ::                                       * 3B326
          MenuMaker                              * 3B32B
          ROMPTR  0A9 001                        * 3B330
          DoMenuKey                              * 3B33B
        ;                                        * 3B340

* ROMPTR 0A1 009
* refs (1): 3B23B
ROMP_0A1_009:
        ::                                       * 3B345
          MenuMaker                              * 3B34A
          ROMPTR  0A9 002                        * 3B34F
          DoMenuKey                              * 3B35A
        ;                                        * 3B35F

* ROMPTR 0A1 00A
* refs (3): 3B23B 6BADD D7906
ROMP_0A1_00A:
        ::                                       * 3B364
          NoEdit?case                            * 3B369
          OBJ_4365D                              * 3B36E
          EDITPARTS                              * 3B373
          #1=case                                * 3B378
          OBJ_4365D                              * 3B37D
          TopERow?                               * 3B382
          caseDoBadKey                           * 3B387
          REPEATER                               * 3B38C
          #       B                              * 3B391  11
          ::                                     * 3B39B
            Cursor&Disp                          * 3B3A0
            UCursor                              * 3B3A5
          ;                                      * 3B3AA
          SetDA123NoCh                           * 3B3AF
        ;                                        * 3B3B4

* ROMPTR 0A1 00B
* refs (1): 3B23B
ROMP_0A1_00B:
        ::                                       * 3B3B9
          MenuMaker                              * 3B3BE
          BINT6                                  * 3B3C3
          SetSomeRow                             * 3B3C8
        ;                                        * 3B3CD

* ROMPTR 0A1 00C
* refs (4): 3B23B 6BD53 8F5C0 D73F9
ROMP_0A1_00C:
        ::                                       * 3B3D2
          DoDelims                               * 3B3D7
          $_''                                   * 3B3DC
          OBJ_40E1F                              * 3B3E1
        ;                                        * 3B3E6

* ROMPTR 0A1 00D
* refs (3): 3B23B 403F5 6BA01
ROMP_0A1_00D:
        ::                                       * 3B3EB
          PTR     Do1st/2nd+:                    * 3B3F0
          xSTO                                   * 3B3F5
          OBJ_4EC94                              * 3B3FA
          CK&DISPATCH0                           * 3B3FF
          BINT6                                  * 3B404
          XEQStoKey                              * 3B409
          BINT7                                  * 3B40E
          XEQStoKey                              * 3B413
          BINT0                                  * 3B418
          xSTO                                   * 3B41D
        ;                                        * 3B422

* ROMPTR 0A1 00E
* refs (2): 3B23B 6BB8B
EVAL_3B427:
        ROMPTR  002 02E                          * 3B427  EVAL

* ROMPTR 0A1 00F
* refs (2): 3B23B 6BB09
ROMP_0A1_00F:
        ::                                       * 3B432
          NoEdit?case                            * 3B437
          xGRAPH                                 * 3B43C
          BegComLine?:(bip;q)                    * 3B441
          SetDA123NoCh                           * 3B446
          OnTheFirstCol?                         * 3B44B
          case                                   * 3B450
          ::                                     * 3B455
            Cursor&Disp                          * 3B45A
            PrevLineIfStart                      * 3B45F
          ;                                      * 3B464
          REPEATER                               * 3B469
          #       10                             * 3B46E  16

* refs (1): 3F279
OBJ_3B478:
          ::                                     * 3B478
            Cursor&Disp                          * 3B47D
            LCursor                              * 3B482
          ;                                      * 3B487
        ;                                        * 3B48C

* ROMPTR 0A1 010
* refs (3): 3B23B 6BB13 D793E
ROMP_0A1_010:
        ::                                       * 3B491
          NoEdit?case                            * 3B496
          ViewLevel1                             * 3B49B
          EDITPARTS                              * 3B4A0
          #1=case                                * 3B4A5
          OBJ_3D8C6                              * 3B4AA
          LastERow?                              * 3B4AF
          caseDoBadKey                           * 3B4B4
          REPEATER                               * 3B4B9
          #       11                             * 3B4BE  17
          ::                                     * 3B4C8
            Cursor&Disp                          * 3B4CD
            DCursor                              * 3B4D2
          ;                                      * 3B4D7
          SetDA123NoCh                           * 3B4DC
        ;                                        * 3B4E1

* ROMPTR 0A1 011
* refs (2): 3B23B 6BB1D
ROMP_0A1_011:
        ::                                       * 3B4E6
          NoEdit?case                            * 3B4EB
          xSWAP                                  * 3B4F0
          EndComLine?:(bip;q)                    * 3B4F5
          SetDA123NoCh                           * 3B4FA
          CURSOR_END?                            * 3B4FF
          case                                   * 3B504
          OBJ_3E14E                              * 3B509
          REPEATER                               * 3B50E
          #       12                             * 3B513  18
          ::                                     * 3B51D
            Cursor&Disp                          * 3B522
            ->OnTheRow                           * 3B527
          ;                                      * 3B52C
        ;                                        * 3B531

* ROMPTR 0A1 012
* refs (1): 3B23B
ROMP_0A1_012:
        ROMPTR  002 051                          * 3B536  SIN

* ROMPTR 0A1 013
* refs (1): 3B23B
ROMP_0A1_013:
        ROMPTR  002 052                          * 3B541  COS

* ROMPTR 0A1 014
* refs (1): 3B23B
ROMP_0A1_014:
        ROMPTR  002 053                          * 3B54C  TAN

* ROMPTR 0A1 015
* refs (1): 3B23B
ROMP_0A1_015:
        ROMPTR  002 04F                          * 3B557  √

* ROMPTR 0A1 016
* refs (1): 3B23B
ROMP_0A1_016:
        ROMPTR  002 049                          * 3B562  ^

* ROMPTR 0A1 017
* refs (1): 3B23B
ROMP_0A1_017:
        ROMPTR  002 04C                          * 3B56D  INV

* ROMPTR 0A1 018
* refs (3): 3B23B 6BB77 DD803
ROMP_0A1_018:
        ::                                       * 3B578
          NoEdit?case                            * 3B57D
          xDUP                                   * 3B582
          EnterComLine                           * 3B587
        ;                                        * 3B58C

* ROMPTR 0A1 019
* refs (2): 3B23B 6BD12
ROMP_0A1_019:
        ::                                       * 3B591
          NoEdit?case                            * 3B596
          xNEG                                   * 3B59B
          OBJ_110EF                              * 3B5A0
          NOTcase                                * 3B5A5
          ::                                     * 3B5AA
            '                                    * 3B5AF
            xNEG                                 * 3B5B4
            DoKeyOb                              * 3B5B9
          ;                                      * 3B5BE
          case                                   * 3B5C3
          SetDA12a3NCh                           * 3B5C8
          CURSOR@                                * 3B5CD
          SWAP                                   * 3B5D2
          SETCURSOR                              * 3B5D7
          CHR_-                                  * 3B5DC
          InsertEcho                             * 3B5E1
          #1+                                    * 3B5E6
          SETCURSOR                              * 3B5EB
          SetDA12a3NCh                           * 3B5F0
        ;                                        * 3B5F5

* ROMPTR 0A1 01A
* refs (2): 3B23B 6BD08
ROMP_0A1_01A:
        ::                                       * 3B5FA
          TakeOver                               * 3B5FF
          SetDA13NoCh                            * 3B604
          ?SetEditRoll                           * 3B609
          OBJ_1123F                              * 3B60E
          SWAP                                   * 3B613
          CURSOR@                                * 3B618
          2DUP#>                                 * 3B61D
          DUP4UNROLL                             * 3B622
          ?SKIPSWAP                              * 3B627
          #-                                     * 3B62C
          DUP#0=ITE                              * 3B631
          2DROP                                  * 3B636
          ::                                     * 3B63B
            ZERO_DO                              * 3B640
            DUP                                  * 3B645
            ITE                                  * 3B64A
            ->OnTheRow                           * 3B64F
            LCursor                              * 3B654
            LOOP                                 * 3B659
            DROP                                 * 3B65E
          ;                                      * 3B663
          DUPNULL$?                              * 3B668
          caseDROP                               * 3B66D
          InsertEcho                             * 3B672
        ;                                        * 3B677

* ROMPTR 0A1 01B
* refs (1): 3B23B
ROMP_0A1_01B:
        ::                                       * 3B67C
          NoEdit?case                            * 3B681
          xCLEAR                                 * 3B686
          EndComLine?:(bip;q)                    * 3B68B
          CURSOR_END?                            * 3B690
          case                                   * 3B695
          ::                                     * 3B69A
            OBJ_429CB                            * 3B69F
            SetDA13NoCh                          * 3B6A4
          ;                                      * 3B6A9
          REPEATER                               * 3B6AE
          #       1C                             * 3B6B3  28
          OBJ_429A3                              * 3B6BD
          SetDA123NoCh                           * 3B6C2
        ;                                        * 3B6C7

* ROMPTR 0A1 01C
* refs (2): 3B23B 6BB45
ROMP_0A1_01C:
        ::                                       * 3B6CC
          NoEdit?case                            * 3B6D1
          xDROP                                  * 3B6D6
          BegComLine?:(bip;q)                    * 3B6DB
          OnTheFirstCol?                         * 3B6E0
          case                                   * 3B6E5
          ::                                     * 3B6EA
            PrevLineIfStart                      * 3B6EF
            OBJ_429CB                            * 3B6F4
            SetDA13NoCh                          * 3B6F9
          ;                                      * 3B6FE
          REPEATER                               * 3B703
          #       1D                             * 3B708  29
          OBJ_42935                              * 3B712
          SetDA123NoCh                           * 3B717
        ;                                        * 3B71C

* ROMPTR 0A1 01D
* refs (1): 3B23B
ROMP_0A1_01D:
        ::                                       * 3B721
          Modifier                               * 3B726
          1A/LockA                               * 3B72B
        ;                                        * 3B730

* ROMPTR 0A1 01E
* refs (1): 3B23B
K__7__3B735:
        CHR     "7"                              * 3B735

* ROMPTR 0A1 01F
* refs (1): 3B23B
K__8__3B73C:
        CHR     "8"                              * 3B73C

* ROMPTR 0A1 020
* refs (1): 3B23B
K__9__3B743:
        CHR     "9"                              * 3B743

* ROMPTR 0A1 021
* refs (1): 3B23B
ROMP_0A1_021:
        ROMPTR  002 048                          * 3B74A  /

* ROMPTR 0A1 022
* refs (1): 3B23B
ROMP_0A1_022:
        ::                                       * 3B755
          Modifier                               * 3B75A
          RShiftOnly                             * 3B75F
          SetDA123NoCh                           * 3B764
        ;                                        * 3B769

* ROMPTR 0A1 023
* refs (1): 3B23B
K__4__3B76E:
        CHR     "4"                              * 3B76E

* ROMPTR 0A1 024
* refs (1): 3B23B
K__5__3B775:
        CHR     "5"                              * 3B775

* ROMPTR 0A1 025
* refs (1): 3B23B
K__6_:
        CHR     "6"                              * 3B77C

* ROMPTR 0A1 026
* refs (1): 3B23B
ROMP_0A1_026:
        ROMPTR  002 047                          * 3B783  *

* ROMPTR 0A1 027
* refs (1): 3B23B
ROMP_0A1_027:
        ::                                       * 3B78E
          Modifier                               * 3B793
          LShiftOnly                             * 3B798
          SetDA123NoCh                           * 3B79D
        ;                                        * 3B7A2

* ROMPTR 0A1 028
* refs (1): 3B23B
K__1__3B7A7:
        CHR     "1"                              * 3B7A7

* ROMPTR 0A1 029
* refs (1): 3B23B
K__2__3B7AE:
        CHR     "2"                              * 3B7AE

* ROMPTR 0A1 02A
* refs (1): 3B23B
K__3__3B7B5:
        CHR     "3"                              * 3B7B5

* ROMPTR 0A1 02B
* refs (1): 3B23B
ROMP_0A1_02B:
        ROMPTR  002 046                          * 3B7BC  -

* ROMPTR 0A1 02C
* refs (4): 3B23B 6BA3D D77A8 DD7DB
ROMP_0A1_02C:
        ::                                       * 3B7C7
          TakeOver                               * 3B7CC
          DAsBad?                                * 3B7D1
          ?SEMI                                  * 3B7D6
          InitEd&Modes                           * 3B7DB
          FLUSHKEYS                              * 3B7E0
        ;                                        * 3B7E5

* ROMPTR 0A1 02D
* refs (1): 3B23B
K__0__3B7EA:
        CHR     "0"                              * 3B7EA

* ROMPTR 0A1 02E
* refs (2): 3B23B 6BCE0
ROMP_0A1_02E:
        ::                                       * 3B7F1
          TakeOver                               * 3B7F6
          BINT51                                 * 3B7FB
          SysITE                                 * 3B800
          CHR_,                                  * 3B805
          CHR_.                                  * 3B80A
          EchoChrKey                             * 3B80F
        ;                                        * 3B814

* ROMPTR 0A1 02F
* refs (2): 3B23B 6BD26
ROMP_0A1_02F:
        CHR     " "                              * 3B819

* ROMPTR 0A1 030
* refs (1): 3B23B
ROMP_0A1_030:
        ROMPTR  002 044                          * 3B820  +

LIB0A1.hash:
        CON(5)  DOHSTR                           * 3B82B  hash table of library 0A1
        LENGTH                                   * 3B830  length, to #3B88F
        CON(5)  0                                * 3B835  names of length 1
        CON(5)  0                                * 3B83A  names of length 2
        CON(5)  0                                * 3B83F  names of length 3
        CON(5)  0                                * 3B844  names of length 4
        CON(5)  0                                * 3B849  names of length 5
        CON(5)  0                                * 3B84E  names of length 6
        CON(5)  0                                * 3B853  names of length 7
        CON(5)  0                                * 3B858  names of length 8
        CON(5)  0                                * 3B85D  names of length 9
        CON(5)  0                                * 3B862  names of length 10
        CON(5)  0                                * 3B867  names of length 11
        CON(5)  0                                * 3B86C  names of length 12
        CON(5)  0                                * 3B871  names of length 13
        CON(5)  0                                * 3B876  names of length 14
        CON(5)  0                                * 3B87B  names of length 15
        CON(5)  0                                * 3B880  names of length 16
        REL(5)  L_3B88A                          * 3B885  end of the names
L_3B88A:
        CON(5)  0                                * 3B88A  command 000 has no name
        ENDLENGTH                                * 3B88F

LIB0A1.link:
        CON(5)  DOHSTR                           * 3B88F  link table of library 0A1
        LENGTH                                   * 3B894  length, to #3B98E
        REL(5)  NoShift1                         * 3B899  000 
        REL(5)  NoShift2                         * 3B89E  001 
        REL(5)  NoShift3                         * 3B8A3  002 
        REL(5)  NoShift4                         * 3B8A8  003 
        REL(5)  NoShift5                         * 3B8AD  004 
        REL(5)  NoShift6                         * 3B8B2  005 
        REL(5)  MenuMTH                          * 3B8B7  006 
        REL(5)  MenuPr                           * 3B8BC  007 
        REL(5)  MenuCST                          * 3B8C1  008 
        REL(5)  ROMP_0A1_009                     * 3B8C6  009 
        REL(5)  ROMP_0A1_00A                     * 3B8CB  00A 
        REL(5)  ROMP_0A1_00B                     * 3B8D0  00B 
        REL(5)  ROMP_0A1_00C                     * 3B8D5  00C 
        REL(5)  ROMP_0A1_00D                     * 3B8DA  00D 
        REL(5)  EVAL_3B427                       * 3B8DF  00E 
        REL(5)  ROMP_0A1_00F                     * 3B8E4  00F 
        REL(5)  ROMP_0A1_010                     * 3B8E9  010 
        REL(5)  ROMP_0A1_011                     * 3B8EE  011 
        REL(5)  ROMP_0A1_012                     * 3B8F3  012 
        REL(5)  ROMP_0A1_013                     * 3B8F8  013 
        REL(5)  ROMP_0A1_014                     * 3B8FD  014 
        REL(5)  ROMP_0A1_015                     * 3B902  015 
        REL(5)  ROMP_0A1_016                     * 3B907  016 
        REL(5)  ROMP_0A1_017                     * 3B90C  017 
        REL(5)  ROMP_0A1_018                     * 3B911  018 
        REL(5)  ROMP_0A1_019                     * 3B916  019 
        REL(5)  ROMP_0A1_01A                     * 3B91B  01A 
        REL(5)  ROMP_0A1_01B                     * 3B920  01B 
        REL(5)  ROMP_0A1_01C                     * 3B925  01C 
        REL(5)  ROMP_0A1_01D                     * 3B92A  01D 
        REL(5)  K__7__3B735                      * 3B92F  01E 
        REL(5)  K__8__3B73C                      * 3B934  01F 
        REL(5)  K__9__3B743                      * 3B939  020 
        REL(5)  ROMP_0A1_021                     * 3B93E  021 
        REL(5)  ROMP_0A1_022                     * 3B943  022 
        REL(5)  K__4__3B76E                      * 3B948  023 
        REL(5)  K__5__3B775                      * 3B94D  024 
        REL(5)  K__6_                            * 3B952  025 
        REL(5)  ROMP_0A1_026                     * 3B957  026 
        REL(5)  ROMP_0A1_027                     * 3B95C  027 
        REL(5)  K__1__3B7A7                      * 3B961  028 
        REL(5)  K__2__3B7AE                      * 3B966  029 
        REL(5)  K__3__3B7B5                      * 3B96B  02A 
        REL(5)  ROMP_0A1_02B                     * 3B970  02B 
        REL(5)  ROMP_0A1_02C                     * 3B975  02C 
        REL(5)  K__0__3B7EA                      * 3B97A  02D 
        REL(5)  ROMP_0A1_02E                     * 3B97F  02E 
        REL(5)  ROMP_0A1_02F                     * 3B984  02F 
        REL(5)  ROMP_0A1_030                     * 3B989  030 
        ENDLENGTH                                * 3B98E
        NIBHEX  4530000                          * 3B98E  T..

LIB0A5:
        CON(3)  #0A5                             * 3B995  library number
        REL(5)  LIB0A5.hash                      * 3B998  hash table
        CON(5)  0                                * 3B99D  message table
        REL(5)  LIB0A5.link                      * 3B9A2  link table
        CON(5)  0                                * 3B9A7  config

* ROMPTR 0A5 000
* refs (1): 3B995
K__a_:
        CHR     "a"                              * 3B9AC

* ROMPTR 0A5 001
* refs (1): 3B995
K__b_:
        CHR     "b"                              * 3B9B3

* ROMPTR 0A5 002
* refs (1): 3B995
K__c_:
        CHR     "c"                              * 3B9BA

* ROMPTR 0A5 003
* refs (1): 3B995
K__d_:
        CHR     "d"                              * 3B9C1

* ROMPTR 0A5 004
* refs (1): 3B995
K__e_:
        CHR     "e"                              * 3B9C8

* ROMPTR 0A5 005
* refs (1): 3B995
K__f_:
        CHR     "f"                              * 3B9CF

* ROMPTR 0A5 006
* refs (1): 3B995
K__g_:
        CHR     "g"                              * 3B9D6

* ROMPTR 0A5 007
* refs (1): 3B995
K__h_:
        CHR     "h"                              * 3B9DD

* ROMPTR 0A5 008
* refs (1): 3B995
K__i_:
        CHR     "i"                              * 3B9E4

* ROMPTR 0A5 009
* refs (1): 3B995
K__j_:
        CHR     "j"                              * 3B9EB

* ROMPTR 0A5 00A
* refs (1): 3B995
K__k__3B9F2:
        CHR     "k"                              * 3B9F2

* ROMPTR 0A5 00B
* refs (1): 3B995
K__l_:
        CHR     "l"                              * 3B9F9

* ROMPTR 0A5 00C
* refs (1): 3B995
K__m_:
        CHR     "m"                              * 3BA00

* ROMPTR 0A5 00D
* refs (1): 3B995
K__n_:
        CHR     "n"                              * 3BA07

* ROMPTR 0A5 00E
* refs (1): 3B995
K__o_:
        CHR     "o"                              * 3BA0E

* ROMPTR 0A5 00F
* refs (1): 3B995
K__p_:
        CHR     "p"                              * 3BA15

* ROMPTR 0A5 010
* refs (1): 3B995
K__q_:
        CHR     "q"                              * 3BA1C

* ROMPTR 0A5 011
* refs (1): 3B995
K__r_:
        CHR     "r"                              * 3BA23

* ROMPTR 0A5 012
* refs (1): 3B995
K__s_:
        CHR     "s"                              * 3BA2A

* ROMPTR 0A5 013
* refs (1): 3B995
K__t_:
        CHR     "t"                              * 3BA31

* ROMPTR 0A5 014
* refs (1): 3B995
K__u_:
        CHR     "u"                              * 3BA38

* ROMPTR 0A5 015
* refs (1): 3B995
K__v_:
        CHR     "v"                              * 3BA3F

* ROMPTR 0A5 016
* refs (1): 3B995
K__w_:
        CHR     "w"                              * 3BA46

* ROMPTR 0A5 017
* refs (1): 3B995
K__x_:
        CHR     "x"                              * 3BA4D

* ROMPTR 0A5 018
* refs (1): 3B995
K__&_:
        CHR     "&"                              * 3BA54

* ROMPTR 0A5 019
* refs (1): 3B995
K__y_:
        CHR     "y"                              * 3BA5B

* ROMPTR 0A5 01A
* refs (1): 3B995
K__z_:
        CHR     "z"                              * 3BA62

* ROMPTR 0A5 01B
* refs (1): 3B995
K__!__3BA69:
        CHR     "!"                              * 3BA69

* ROMPTR 0A5 01C
* refs (1): 3B995
K__?_:
        CHR     "?"                              * 3BA70

* ROMPTR 0A5 01D
* refs (1): 3B995
ROMP_0A5_01D:
        ::                                       * 3BA77
          Modifier                               * 3BA7C
          MinusMo_539A0                          * 3BA81
          SetDA123NoCh                           * 3BA86
        ;                                        * 3BA8B

* ROMPTR 0A5 01E
* refs (1): 3B995
ROMP_0A5_01E:
        ::                                       * 3BA90
          OBJ_3F247                              * 3BA95
          BINT0                                  * 3BA9A
        ;                                        * 3BA9F

* ROMPTR 0A5 01F
* refs (1): 3B995
ROMP_0A5_01F:
        ::                                       * 3BAA4
          OBJ_3F247                              * 3BAA9
          BINT2                                  * 3BAAE
        ;                                        * 3BAB3

* ROMPTR 0A5 020
* refs (1): 3B995
ROMP_0A5_020:
        ::                                       * 3BAB8
          OBJ_3F247                              * 3BABD
          BINT4                                  * 3BAC2
        ;                                        * 3BAC7

* ROMPTR 0A5 021
* refs (2): 3B995 6BCEA
ROMP_0A5_021:
        ROMPTR  0A2 021                          * 3BACC

* ROMPTR 0A5 022
* refs (1): 3B995
ROMP_0A5_022:
        ::                                       * 3BAD7
          Modifier                               * 3BADC
          àShiftOnly                             * 3BAE1
          SetDA123NoCh                           * 3BAE6
        ;                                        * 3BAEB

* ROMPTR 0A5 023
* refs (1): 3B995
K__$_:
        CHR     "$"                              * 3BAF0

* ROMPTR 0A5 024
* refs (1): 3B995
K_163:
        CHR     "£"                              * 3BAF7

* ROMPTR 0A5 025
* refs (1): 3B995
K_164:
        CHR     "¤"                              * 3BAFE

* ROMPTR 0A5 026
* refs (1): 3B995
ROMP_0A5_026:
        ROMPTR  0A2 026                          * 3BB05

* ROMPTR 0A5 027
* refs (1): 3B995
ROMP_0A5_027:
        ROMPTR  0A4 027                          * 3BB10

* ROMPTR 0A5 028
* refs (1): 3B995
_==_:
        $       "=="                             * 3BB1B

* ROMPTR 0A5 029
* refs (1): 3B995
K__<_:
        CHR     "<"                              * 3BB29

* ROMPTR 0A5 02A
* refs (1): 3B995
K_137:
        CHR     "≤"                              * 3BB30

* ROMPTR 0A5 02B
* refs (1): 3B995
ROMP_0A5_02B:
        ::                                       * 3BB37
          DoDelims                               * 3BB3C
          $_<<>>                                 * 3BB41
          ?ClrAlgSetPr                           * 3BB46
        ;                                        * 3BB4B

* ROMPTR 0A5 02C
* refs (1): 3B995
ROMP_0A5_02C:
        ROMPTR  002 03A                          * 3BB50  CONT

* ROMPTR 0A5 02D
* refs (1): 3B995
K__=_:
        CHR     "="                              * 3BB5B

* ROMPTR 0A5 02E
* refs (2): 3B995 6BCC2
ROMP_0A5_02E:
        ROMPTR  0A2 02E                          * 3BB62

* ROMPTR 0A5 02F
* refs (1): 3B995
K_135:
        CHR     "π"                              * 3BB6D

* ROMPTR 0A5 030
* refs (1): 3B995
ROMP_0A5_030:
        ROMPTR  0A2 030                          * 3BB74

LIB0A5.hash:
        CON(5)  DOHSTR                           * 3BB7F  hash table of library 0A5
        LENGTH                                   * 3BB84  length, to #3BBE3
        CON(5)  0                                * 3BB89  names of length 1
        CON(5)  0                                * 3BB8E  names of length 2
        CON(5)  0                                * 3BB93  names of length 3
        CON(5)  0                                * 3BB98  names of length 4
        CON(5)  0                                * 3BB9D  names of length 5
        CON(5)  0                                * 3BBA2  names of length 6
        CON(5)  0                                * 3BBA7  names of length 7
        CON(5)  0                                * 3BBAC  names of length 8
        CON(5)  0                                * 3BBB1  names of length 9
        CON(5)  0                                * 3BBB6  names of length 10
        CON(5)  0                                * 3BBBB  names of length 11
        CON(5)  0                                * 3BBC0  names of length 12
        CON(5)  0                                * 3BBC5  names of length 13
        CON(5)  0                                * 3BBCA  names of length 14
        CON(5)  0                                * 3BBCF  names of length 15
        CON(5)  0                                * 3BBD4  names of length 16
        REL(5)  L_3BBDE                          * 3BBD9  end of the names
L_3BBDE:
        CON(5)  0                                * 3BBDE  command 000 has no name
        ENDLENGTH                                * 3BBE3

LIB0A5.link:
        CON(5)  DOHSTR                           * 3BBE3  link table of library 0A5
        LENGTH                                   * 3BBE8  length, to #3BCE2
        REL(5)  K__a_                            * 3BBED  000 
        REL(5)  K__b_                            * 3BBF2  001 
        REL(5)  K__c_                            * 3BBF7  002 
        REL(5)  K__d_                            * 3BBFC  003 
        REL(5)  K__e_                            * 3BC01  004 
        REL(5)  K__f_                            * 3BC06  005 
        REL(5)  K__g_                            * 3BC0B  006 
        REL(5)  K__h_                            * 3BC10  007 
        REL(5)  K__i_                            * 3BC15  008 
        REL(5)  K__j_                            * 3BC1A  009 
        REL(5)  K__k__3B9F2                      * 3BC1F  00A 
        REL(5)  K__l_                            * 3BC24  00B 
        REL(5)  K__m_                            * 3BC29  00C 
        REL(5)  K__n_                            * 3BC2E  00D 
        REL(5)  K__o_                            * 3BC33  00E 
        REL(5)  K__p_                            * 3BC38  00F 
        REL(5)  K__q_                            * 3BC3D  010 
        REL(5)  K__r_                            * 3BC42  011 
        REL(5)  K__s_                            * 3BC47  012 
        REL(5)  K__t_                            * 3BC4C  013 
        REL(5)  K__u_                            * 3BC51  014 
        REL(5)  K__v_                            * 3BC56  015 
        REL(5)  K__w_                            * 3BC5B  016 
        REL(5)  K__x_                            * 3BC60  017 
        REL(5)  K__&_                            * 3BC65  018 
        REL(5)  K__y_                            * 3BC6A  019 
        REL(5)  K__z_                            * 3BC6F  01A 
        REL(5)  K__!__3BA69                      * 3BC74  01B 
        REL(5)  K__?_                            * 3BC79  01C 
        REL(5)  ROMP_0A5_01D                     * 3BC7E  01D 
        REL(5)  ROMP_0A5_01E                     * 3BC83  01E 
        REL(5)  ROMP_0A5_01F                     * 3BC88  01F 
        REL(5)  ROMP_0A5_020                     * 3BC8D  020 
        REL(5)  ROMP_0A5_021                     * 3BC92  021 
        REL(5)  ROMP_0A5_022                     * 3BC97  022 
        REL(5)  K__$_                            * 3BC9C  023 
        REL(5)  K_163                            * 3BCA1  024 
        REL(5)  K_164                            * 3BCA6  025 
        REL(5)  ROMP_0A5_026                     * 3BCAB  026 
        REL(5)  ROMP_0A5_027                     * 3BCB0  027 
        REL(5)  _==_                             * 3BCB5  028 
        REL(5)  K__<_                            * 3BCBA  029 
        REL(5)  K_137                            * 3BCBF  02A 
        REL(5)  ROMP_0A5_02B                     * 3BCC4  02B 
        REL(5)  ROMP_0A5_02C                     * 3BCC9  02C 
        REL(5)  K__=_                            * 3BCCE  02D 
        REL(5)  ROMP_0A5_02E                     * 3BCD3  02E 
        REL(5)  K_135                            * 3BCD8  02F 
        REL(5)  ROMP_0A5_030                     * 3BCDD  030 
        ENDLENGTH                                * 3BCE2

* refs (1): 151F6
OBJ_3BCE2:
        ::                                       * 3BCE2
          '                                      * 3BCE7
          ::                                     * 3BCEC
            SetDA1Bad                            * 3BCF1
            SaveLastMenu                         * 3BCF6
          ;                                      * 3BCFB
          MenuExitAct!                           * 3BD00
        ;                                        * 3BD05
        FILLTO  #3BDFA                           * 3BD0A  240 zero nibbles: the next entry stays at #3BDFA

* -> {}
* refs (4): 3D8CB 42DAA 6B237 C38E0
EditMenu:
        {                                        * 3BDFA
          <SkipKey                               * 3BDFF
          >SkipKey                               * 3BE04
          <DelKey                                * 3BE09
          >DelKey                                * 3BE0E
          TogInsertKey                           * 3BE13
          IStackKey                              * 3BE18
        }                                        * 3BE1D

* refs (1): 415CE
OBJ_3BE22:
        ::                                       * 3BE22
          MenuDef@                               * 3BE27
          CK&DISPATCH0                           * 3BE2C
          BINT15                                 * 3BE31
          NumCurMenu                             * 3BE36
          BINT8                                  * 3BE3B
          OBJ_41642                              * 3BE40
          BINT0                                  * 3BE45
          OBJ_56B87                              * 3BE4A
        ;                                        * 3BE4F

* ->
* refs (1): 9C6F0
DoSolvrMenu:
        ::                                       * 3BE54
          PrgmEntry?                             * 3BE59
          caseDoBadKey                           * 3BE5E
          '                                      * 3BE63
          OBJ_15200                              * 3BE68
          InitMenu                               * 3BE6D
        ;                                        * 3BE72
        NIBHEX  3381000                          * 3BE77  3..

LIB0A7:
        CON(3)  #0A7                             * 3BE7E  library number
        REL(5)  LIB0A7.hash                      * 3BE81  hash table
        CON(5)  0                                * 3BE86  message table
        REL(5)  LIB0A7.link                      * 3BE8B  link table
        CON(5)  0                                * 3BE90  config

* ROMPTR 0A7 000
* refs (1): 3BE7E
ROMP_0A7_000:
        ::                                       * 3BE95
          PTR     InitTrack:                     * 3BE9A
          ::                                     * 3BE9F
            NoExitAction                         * 3BEA4
            MenuDef@                             * 3BEA9
            InitMenu                             * 3BEAE
          ;                                      * 3BEB3
          '                                      * 3BEB8
          ID_CST                                 * 3BEBD
          SAFE@                                  * 3BEC2
          NOTcase                                * 3BEC7
          NULL{}                                 * 3BECC
          ChkForMenu(_)                          * 3BED1
        ;                                        * 3BED6

* ROMPTR 0A7 001
* refs (1): 3BE7E
ROMP_0A7_001:
        ::                                       * 3BEDB
          PTR     InitTrack:                     * 3BEE0
          ::                                     * 3BEE5
            BINT1                                * 3BEEA
            MenuRow!                             * 3BEEF
          ;                                      * 3BEF4
          SetRebuild                             * 3BEF9
          '                                      * 3BEFE
          OBJ_3F70A                              * 3BF03
        ;                                        * 3BF08

* ROMPTR 0A7 002
* refs (1): 3BE7E
ROMP_0A7_002:
        ::                                       * 3BF0D
          OBJ_3F036                              * 3BF12
          OBJ_3EFE6                              * 3BF17
          NoExitAction                           * 3BF1C

{MEnuMTH}:
          {                                      * 3BF21
            {                                    * 3BF26

VECTR:
              $       "VECTR"                    * 3BF2B
              ROMPTR  0A9 004                    * 3BF3F
            }                                    * 3BF4A

{MTH\MATRX}:
            {                                    * 3BF4F

_MATRX_:
              $       "MATRX"                    * 3BF54
              ROMPTR  0A9 005                    * 3BF68
            }                                    * 3BF73

{MTH\LIST}:
            {                                    * 3BF78
              _LIST_                             * 3BF7D
              ROMPTR  0A9 00B                    * 3BF82
            }                                    * 3BF8D

{MTH\HYP}:
            {                                    * 3BF92

_HYP_:
              $       "HYP"                      * 3BF97
              ROMPTR  0A9 00C                    * 3BFA7
            }                                    * 3BFB2

{MTH\REAL}:
            {                                    * 3BFB7

_REAL_:
              $       "REAL"                     * 3BFBC
              ROMPTR  0A9 00E                    * 3BFCE
            }                                    * 3BFD9

{MTH\BASE}:
            {                                    * 3BFDE

_BASE_:
              $       "BASE"                     * 3BFE3
              ROMPTR  0A9 00F                    * 3BFF5
            }                                    * 3C000

{MTH\PROB}:
            {                                    * 3C005

_PROB_:
              $       "PROB"                     * 3C00A
              ROMPTR  0A9 00D                    * 3C01C
            }                                    * 3C027

{MTH\HYP}_3C02C:
            {                                    * 3C02C
              ROMPTR  0AB 025                    * 3C031  FFT
              ROMPTR  0A9 013                    * 3C03C
            }                                    * 3C047

{MTH\CMPLX}:
            {                                    * 3C04C

_CMPLX_:
              $       "CMPLX"                    * 3C051
              ROMPTR  0A9 014                    * 3C065
            }                                    * 3C070

{MTH\CONST}:
            {                                    * 3C075

_CONST_:
              $       "CONST"                    * 3C07A
              ROMPTR  0A9 015                    * 3C08E
            }                                    * 3C099
          }                                      * 3C09E
        ;                                        * 3C0A3

* ROMPTR 0A7 003
* refs (1): 3BE7E
ROMP_0A7_003:
        {                                        * 3C0A8
          xCONSTANTe                             * 3C0AD
          %e                                     * 3C0B2
          xi                                     * 3C0B7
          C%i                                    * 3C0BC
          xPI                                    * 3C0C1
          %PI                                    * 3C0C6
          xMINR                                  * 3C0CB
          %MINREAL                               * 3C0D0
          xMAXR                                  * 3C0D5
          %MAXREAL                               * 3C0DA
        }                                        * 3C0DF

* ROMPTR 0A7 004
* refs (1): 3BE7E
ROMP_0A7_004:
        ::                                       * 3C0E4
          OBJ_3F036                              * 3C0E9
          OBJ_3EFE6                              * 3C0EE
          NoExitAction                           * 3C0F3
          {                                      * 3C0F8

{PRG\BRCH}:
            {                                    * 3C0FD

_BRCH_:
              $       "BRCH"                     * 3C102
              ROMPTR  0A9 017                    * 3C114
            }                                    * 3C11F

{PRG\TEST}:
            {                                    * 3C124

_TEST_:
              $       "TEST"                     * 3C129
              ROMPTR  0A9 020                    * 3C13B
            }                                    * 3C146

{PRG\TYPE}:
            {                                    * 3C14B
              xTYPE                              * 3C150
              ROMPTR  0A9 021                    * 3C155
            }                                    * 3C160

{PRG\LIST}:
            {                                    * 3C165
              _LIST_                             * 3C16A
              ROMPTR  0A9 022                    * 3C16F
            }                                    * 3C17A

{PRG\GROB}:
            {                                    * 3C17F

_GROB_:
              $       "GROB"                     * 3C184
              ROMPTR  0A9 025                    * 3C196
            }                                    * 3C1A1

{PRG\PICT}:
            {                                    * 3C1A6
              xPICT                              * 3C1AB
              ROMPTR  0A9 026                    * 3C1B0
            }                                    * 3C1BB

{PRG\IN}:
            {                                    * 3C1C0

_IN_:
              $       "IN"                       * 3C1C5
              ROMPTR  0A9 027                    * 3C1D3
            }                                    * 3C1DE

{PRG\OUT}:
            {                                    * 3C1E3

_OUT_:
              $       "OUT"                      * 3C1E8
              ROMPTR  0A9 028                    * 3C1F8
            }                                    * 3C203

{PRG\RUN}:
            {                                    * 3C208

_RUN_:
              $       "RUN"                      * 3C20D
              ROMPTR  0A9 029                    * 3C21D
            }                                    * 3C228

{PRG\ERROR}:
            {                                    * 3C22D

_ERROR_:
              $       "ERROR"                    * 3C232
              ROMPTR  0A9 03D                    * 3C246
            }                                    * 3C251
          }                                      * 3C256
        ;                                        * 3C25B

* ROMPTR 0A7 005
* refs (1): 3BE7E
ROMP_0A7_005:
        ::                                       * 3C260
          OBJ_3F036                              * 3C265
          OBJ_3EFE6                              * 3C26A

{MenuSOLVE}:
          {                                      * 3C26F

{SOLVE\ROOT}:
            {                                    * 3C274
              xROOT                              * 3C279
              ROMPTR  0A9 04B                    * 3C27E
            }                                    * 3C289

{SOLVE\DIFFE}:
            {                                    * 3C28E
              ROMPTR  0AB 00E                    * 3C293  DIFFEQ
              ROMPTR  0A9 04C                    * 3C29E
            }                                    * 3C2A9

{SOLVE\POLY}:
            {                                    * 3C2AE

_POLY_:
              $       "POLY"                     * 3C2B3
              ROMPTR  0A9 04D                    * 3C2C5
            }                                    * 3C2D0

{SOLVE\SYS}:
            {                                    * 3C2D5

_SYS_:
              $       "SYS"                      * 3C2DA
              ROMPTR  0A9 04E                    * 3C2EA
            }                                    * 3C2F5

{SOLVE\TVM}:
            {                                    * 3C2FA
              ROMPTR  0AB 055                    * 3C2FF  TVM
              ROMPTR  0A9 04F                    * 3C30A
            }                                    * 3C315
          }                                      * 3C31A
        ;                                        * 3C31F

* ROMPTR 0A7 006
* refs (1): 3BE7E
ROMP_0A7_006:
        ::                                       * 3C324
          OBJ_15200                              * 3C329
        ;                                        * 3C32E

* ROMPTR 0A7 007
* refs (1): 3BE7E
ROMP_0A7_007:
        ::                                       * 3C333
          PTR     InitTrack:                     * 3C338
          ::                                     * 3C33D
            '                                    * 3C342
            ROMPTR  0A9 04F                      * 3C347
            InitMenu                             * 3C352
          ;                                      * 3C357
          OBJ_3FB5A                              * 3C35C
          '                                      * 3C361
          ::                                     * 3C366
            ROMPTR  0E6 00A                      * 3C36B
            SetDA2NoCh                           * 3C376
          ;                                      * 3C37B
          MenuRowAct!                            * 3C380
          '                                      * 3C385
          ROMPTR  0E6 002                        * 3C38A
          MenuKeyLS!                             * 3C395
          ROMPTR  0E6 00A                        * 3C39A
          {                                      * 3C3A5
            N                                    * 3C3AA
            I%YR                                 * 3C3AF

{SOLVE\TVM\}:
            PV                                   * 3C3B4
            PMT                                  * 3C3B9
            FV                                   * 3C3BE
            ROMPTR  0A8 046                      * 3C3C3
            ROMPTR  0A8 047                      * 3C3CE
            ROMPTR  0A8 048                      * 3C3D9
          }                                      * 3C3E4
        ;                                        * 3C3E9
        BSS     15                               * 3C3EE

* ROMPTR 0A7 008
* refs (1): 3BE7E
ROMP_0A7_008:
        ::                                       * 3C3FD
          OBJ_413B9                              * 3C402
          OBJ_4A285                              * 3C407
          '                                      * 3C40C
          ::                                     * 3C411
            '                                    * 3C416
            ROMPTR  0AA 000                      * 3C41B
            OBJ_3A640                            * 3C426
          ;                                      * 3C42B
        ;                                        * 3C430

* ROMPTR 0A7 009
* refs (1): 3BE7E
ROMP_0A7_009:
        ::                                       * 3C435
          '                                      * 3C43A
          ::                                     * 3C43F
            OBJ_3D54C                            * 3C444
            ROMPTR  0A9 051                      * 3C449
          ;                                      * 3C454
          OnlyDefNoShift!                        * 3C459
          '                                      * 3C45E
          ::                                     * 3C463
            '                                    * 3C468
            ROMPTR  0AA 001                      * 3C46D
            OBJ_3A640                            * 3C478
          ;                                      * 3C47D
        ;                                        * 3C482

* ROMPTR 0A7 00A
* refs (1): 3BE7E
ROMP_0A7_00A:
        ::                                       * 3C487
          OBJ_4A2E9                              * 3C48C
          OBJ_45F14                              * 3C491
          '                                      * 3C496
          ::                                     * 3C49B
            '                                    * 3C4A0
            ROMPTR  0AA 002                      * 3C4A5
            OBJ_3A640                            * 3C4B0
          ;                                      * 3C4B5
        ;                                        * 3C4BA

* ROMPTR 0A7 00B
* refs (1): 3BE7E
ROMP_0A7_00B:
        ::                                       * 3C4BF
          '                                      * 3C4C4
          ::                                     * 3C4C9
            OBJ_3D54C                            * 3C4CE
            ROMPTR  0A9 054                      * 3C4D3
          ;                                      * 3C4DE
          OnlyDefNoShift!                        * 3C4E3
          '                                      * 3C4E8
          ::                                     * 3C4ED
            '                                    * 3C4F2
            ROMPTR  0AA 003                      * 3C4F7
            OBJ_3A640                            * 3C502
          ;                                      * 3C507
        ;                                        * 3C50C

* ROMPTR 0A7 00C
* refs (1): 3BE7E
ROMP_0A7_00C:
        ::                                       * 3C511
          OBJ_4A2E9                              * 3C516
          OBJ_46007                              * 3C51B
          '                                      * 3C520
          ::                                     * 3C525
            '                                    * 3C52A
            ROMPTR  0AA 004                      * 3C52F
            OBJ_3A640                            * 3C53A
          ;                                      * 3C53F
        ;                                        * 3C544

* ROMPTR 0A7 00D
* refs (1): 3BE7E
ROMP_0A7_00D:
        ::                                       * 3C549
          '                                      * 3C54E
          ::                                     * 3C553
            OBJ_3D54C                            * 3C558
            ROMPTR  0A9 057                      * 3C55D
          ;                                      * 3C568
          OnlyDefNoShift!                        * 3C56D
          '                                      * 3C572
          ::                                     * 3C577
            '                                    * 3C57C
            ROMPTR  0AA 005                      * 3C581
            OBJ_3A640                            * 3C58C
          ;                                      * 3C591
        ;                                        * 3C596

* ROMPTR 0A7 00E
* refs (1): 3BE7E
ROMP_0A7_00E:
        ::                                       * 3C59B
          OBJ_4A2E9                              * 3C5A0
          OBJ_4A75A                              * 3C5A5
          '                                      * 3C5AA
          ::                                     * 3C5AF
            '                                    * 3C5B4
            ROMPTR  0AA 006                      * 3C5B9
            OBJ_3A640                            * 3C5C4
          ;                                      * 3C5C9
        ;                                        * 3C5CE

* ROMPTR 0A7 00F
* refs (1): 3BE7E
ROMP_0A7_00F:
        ::                                       * 3C5D3
          '                                      * 3C5D8
          ::                                     * 3C5DD
            OBJ_3D54C                            * 3C5E2
            ROMPTR  0A9 059                      * 3C5E7
          ;                                      * 3C5F2
          OnlyDefNoShift!                        * 3C5F7
          '                                      * 3C5FC
          ::                                     * 3C601
            '                                    * 3C606
            ROMPTR  0AA 007                      * 3C60B
            OBJ_3A640                            * 3C616
          ;                                      * 3C61B
        ;                                        * 3C620

* ROMPTR 0A7 010
* refs (1): 3BE7E
ROMP_0A7_010:
        ::                                       * 3C625
          OBJ_4A2E9                              * 3C62A
          OBJ_4A75A                              * 3C62F
          '                                      * 3C634
          ::                                     * 3C639
            '                                    * 3C63E
            ROMPTR  0AA 008                      * 3C643
            OBJ_3A640                            * 3C64E
          ;                                      * 3C653
        ;                                        * 3C658

* ROMPTR 0A7 011
* refs (1): 3BE7E
ROMP_0A7_011:
        ::                                       * 3C65D
          '                                      * 3C662
          ::                                     * 3C667
            OBJ_3D54C                            * 3C66C
            ROMPTR  0A9 062                      * 3C671
          ;                                      * 3C67C
          OnlyDefNoShift!                        * 3C681
          '                                      * 3C686
          ::                                     * 3C68B
            '                                    * 3C690
            ROMPTR  0AA 009                      * 3C695
            OBJ_3A640                            * 3C6A0
          ;                                      * 3C6A5
        ;                                        * 3C6AA

* ROMPTR 0A7 012
* refs (1): 3BE7E
ROMP_0A7_012:
        ::                                       * 3C6AF
          OBJ_3F036                              * 3C6B4
          OBJ_3EFE6                              * 3C6B9

{MenuUnits}:
          {                                      * 3C6BE

{UNITS\LENG}:
            {                                    * 3C6C3

_LENG_:
              $       "LENG"                     * 3C6C8
              ROMPTR  0A9 02B                    * 3C6DA
            }                                    * 3C6E5

{UNITS\AREA}:
            {                                    * 3C6EA

_AREA_:
              $       "AREA"                     * 3C6EF
              ROMPTR  0A9 02C                    * 3C701
            }                                    * 3C70C

{UNITS\VOL}:
            {                                    * 3C711

_VOL_:
              $       "VOL"                      * 3C716
              ROMPTR  0A9 02D                    * 3C726
            }                                    * 3C731

{UNITS\TIME}:
            {                                    * 3C736

_TIME_:
              $       "TIME"                     * 3C73B
              ROMPTR  0A9 02E                    * 3C74D
            }                                    * 3C758

{UNITS\SPEED}:
            {                                    * 3C75D

_SPEED_:
              $       "SPEED"                    * 3C762
              ROMPTR  0A9 02F                    * 3C776
            }                                    * 3C781

{UNITS\MASS}:
            {                                    * 3C786

_MASS_:
              $       "MASS"                     * 3C78B
              ROMPTR  0A9 030                    * 3C79D
            }                                    * 3C7A8

{UNITS\FORCE}:
            {                                    * 3C7AD

_FORCE_:
              $       "FORCE"                    * 3C7B2
              ROMPTR  0A9 031                    * 3C7C6
            }                                    * 3C7D1

{UNITS\ENRG}:
            {                                    * 3C7D6

_ENRG_:
              $       "ENRG"                     * 3C7DB
              ROMPTR  0A9 032                    * 3C7ED
            }                                    * 3C7F8

{UNITS\POWR}:
            {                                    * 3C7FD

_POWR_:
              $       "POWR"                     * 3C802
              ROMPTR  0A9 033                    * 3C814
            }                                    * 3C81F

{UNITS\PRESS}:
            {                                    * 3C824

_PRESS_:
              $       "PRESS"                    * 3C829
              ROMPTR  0A9 034                    * 3C83D
            }                                    * 3C848

{UNITS\TEMP}:
            {                                    * 3C84D

_TEMP_:
              $       "TEMP"                     * 3C852
              ROMPTR  0A9 035                    * 3C864
            }                                    * 3C86F

{UNITS\ELEC}:
            {                                    * 3C874

_ELEC_:
              $       "ELEC"                     * 3C879
              ROMPTR  0A9 036                    * 3C88B
            }                                    * 3C896

{UNITS\ANGLE}:
            {                                    * 3C89B

_ANGLE_:
              $       "ANGL"                     * 3C8A0
              ROMPTR  0A9 037                    * 3C8B2
            }                                    * 3C8BD

{UNITS\LIGHT}:
            {                                    * 3C8C2

_LIGHT_:
              $       "LIGHT"                    * 3C8C7
              ROMPTR  0A9 038                    * 3C8DB
            }                                    * 3C8E6

{UNITS\RAD}:
            {                                    * 3C8EB
              $_RAD                              * 3C8F0
              ROMPTR  0A9 039                    * 3C8F5
            }                                    * 3C900

{UNITS\VISC}:
            {                                    * 3C905

_VISC_:
              $       "VISC"                     * 3C90A
              ROMPTR  0A9 03A                    * 3C91C
            }                                    * 3C927
          }                                      * 3C92C
        ;                                        * 3C931

* ROMPTR 0A7 013
* refs (1): 3BE7E
ROMP_0A7_013:
        ::                                       * 3C936
          OBJ_3EF14                              * 3C93B

{Length-Units}:
          {                                      * 3C940

_m_:
            $       "m"                          * 3C945

_cm_:
            $       "cm"                         * 3C951

_mm_:
            $       "mm"                         * 3C95F

_yd_:
            $       "yd"                         * 3C96D

_ft_:
            $       "ft"                         * 3C97B

_in_:
            $       "in"                         * 3C989

_Mpc_:
            $       "Mpc"                        * 3C997

_pc_:
            $       "pc"                         * 3C9A7

_lyr_:
            $       "lyr"                        * 3C9B5

_au_:
            $       "au"                         * 3C9C5

_km_:
            $       "km"                         * 3C9D3

_mi_:
            $       "mi"                         * 3C9E1

_nmi_:
            $       "nmi"                        * 3C9EF

_miUS_:
            $       "miUS"                       * 3C9FF

_chain_:
            $       "chain"                      * 3CA11

_rad_:
            $       "rd"                         * 3CA25

_fath_:
            $       "fath"                       * 3CA33

_ftUS_:
            $       "ftUS"                       * 3CA45

_mil_:
            $       "mil"                        * 3CA57

_æ_:
            $       "µ"                          * 3CA67

_↓_:
            $       "Å"                          * 3CA73

_fermi_:
            $       "fermi"                      * 3CA7F
          }                                      * 3CA93
        ;                                        * 3CA98

* ROMPTR 0A7 014
* refs (1): 3BE7E
ROMP_0A7_014:
        ::                                       * 3CA9D
          OBJ_3EF14                              * 3CAA2

{Area-Units}:
          {                                      * 3CAA7

_m^2_:
            $       "m^2"                        * 3CAAC

_cm^2_:
            $       "cm^2"                       * 3CABC

_b_:
            $       "b"                          * 3CACE

_yd^2_:
            $       "yd^2"                       * 3CADA

_ft^2_:
            $       "ft^2"                       * 3CAEC

_in^2_:
            $       "in^2"                       * 3CAFE

_km^2_:
            $       "km^2"                       * 3CB10

_ha_:
            $       "ha"                         * 3CB22

_a_:
            $       "a"                          * 3CB30

_mi^2_:
            $       "mi^2"                       * 3CB3C

_miUS^2_:
            $       "miUS^2"                     * 3CB4E

_acre_:
            $       "acre"                       * 3CB64
          }                                      * 3CB76
        ;                                        * 3CB7B

* ROMPTR 0A7 015
* refs (1): 3BE7E
ROMP_0A7_015:
        ::                                       * 3CB80
          OBJ_3EF14                              * 3CB85
          {                                      * 3CB8A

_m^3_:
            $       "m^3"                        * 3CB8F

_st_:
            $       "st"                         * 3CB9F

_cm^2__3CBAD:
            $       "cm^3"                       * 3CBAD

_yd^2__3CBBF:
            $       "yd^3"                       * 3CBBF

_ft^2__3CBD1:
            $       "ft^3"                       * 3CBD1

_in^2__3CBE3:
            $       "in^3"                       * 3CBE3

_l_:
            $       "l"                          * 3CBF5

_galUK_:
            $       "galUK"                      * 3CC01

_galC_:
            $       "galC"                       * 3CC15

_gal_:
            $       "gal"                        * 3CC27

_qt_:
            $       "qt"                         * 3CC37

_pt_:
            $       "pt"                         * 3CC45

_ml_:
            $       "ml"                         * 3CC53

_cu_:
            $       "cu"                         * 3CC61

_ozfl_:
            $       "ozfl"                       * 3CC6F

_ozUK_:
            $       "ozUK"                       * 3CC81

_tpsp_:
            $       "tbsp"                       * 3CC93

_tsp_:
            $       "tsp"                        * 3CCA5

_bbl_:
            $       "bbl"                        * 3CCB5

_bu_:
            $       "bu"                         * 3CCC5

_pk_:
            $       "pk"                         * 3CCD3

_fbm_:
            $       "fbm"                        * 3CCE1
          }                                      * 3CCF1
        ;                                        * 3CCF6

* ROMPTR 0A7 016
* refs (1): 3BE7E
ROMP_0A7_016:
        ::                                       * 3CCFB
          OBJ_3EF14                              * 3CD00

{Time-Untis}:
          {                                      * 3CD05

_yr_:
            $       "yr"                         * 3CD0A

_d_:
            $       "d"                          * 3CD18

_h_:
            $       "h"                          * 3CD24

_min_:
            $       "min"                        * 3CD30

_s_:
            $       "s"                          * 3CD40

_Hz_:
            $       "Hz"                         * 3CD4C
          }                                      * 3CD5A
        ;                                        * 3CD5F

* ROMPTR 0A7 017
* refs (1): 3BE7E
ROMP_0A7_017:
        ::                                       * 3CD64
          OBJ_3EF14                              * 3CD69
          {                                      * 3CD6E

_m/s:
            $       "m/s"                        * 3CD73

_cm/s_:
            $       "cm/s"                       * 3CD83

_ft/s_:
            $       "ft/s"                       * 3CD95

_kph_:
            $       "kph"                        * 3CDA7

_mph_:
            $       "mph"                        * 3CDB7

_knot_:
            $       "knot"                       * 3CDC7

_c_:
            $       "c"                          * 3CDD9

_ga_:
            $       "ga"                         * 3CDE5
          }                                      * 3CDF3
        ;                                        * 3CDF8

* ROMPTR 0A7 018
* refs (1): 3BE7E
ROMP_0A7_018:
        ::                                       * 3CDFD
          OBJ_3EF14                              * 3CE02

{Mass-Units}:
          {                                      * 3CE07

_kg_:
            $       "kg"                         * 3CE0C

_g_:
            $       "g"                          * 3CE1A

_lb_:
            $       "lb"                         * 3CE26

_oz_:
            $       "oz"                         * 3CE34

_slug_:
            $       "slug"                       * 3CE42

_lbt_:
            $       "lbt"                        * 3CE54

_ton_:
            $       "ton"                        * 3CE64

_tonUK_:
            $       "tonUK"                      * 3CE74

_t_:
            $       "t"                          * 3CE88

_ozt_:
            $       "ozt"                        * 3CE94

_ct_:
            $       "ct"                         * 3CEA4

_grain_:
            $       "grain"                      * 3CEB2

_u_:
            $       "u"                          * 3CEC6

_mol__3CED2:
            $       "mol"                        * 3CED2
          }                                      * 3CEE2
        ;                                        * 3CEE7

* ROMPTR 0A7 019
* refs (1): 3BE7E
ROMP_0A7_019:
        ::                                       * 3CEEC
          OBJ_3EF14                              * 3CEF1

{Force-Units}:
          {                                      * 3CEF6

_N_:
            $       "N"                          * 3CEFB

_dyn_:
            $       "dyn"                        * 3CF07

_gf_:
            $       "gf"                         * 3CF17

_kip_:
            $       "kip"                        * 3CF25

_ldf_:
            $       "lbf"                        * 3CF35

_pdl_:
            $       "pdl"                        * 3CF45
          }                                      * 3CF55
        ;                                        * 3CF5A

* ROMPTR 0A7 01A
* refs (1): 3BE7E
ROMP_0A7_01A:
        ::                                       * 3CF5F
          OBJ_3EF14                              * 3CF64

{Enrg-Units}:
          {                                      * 3CF69

_J_:
            $       "J"                          * 3CF6E

_erg_:
            $       "erg"                        * 3CF7A

_Kcal_:
            $       "Kcal"                       * 3CF8A

cal:
            $       "cal"                        * 3CF9C

_Btu_:
            $       "Btu"                        * 3CFAC

_ft*lbf_:
            $       "ft*lbf"                     * 3CFBC

_therm_:
            $       "therm"                      * 3CFD2

_MeV_:
            $       "MeV"                        * 3CFE6

_eV_:
            $       "eV"                         * 3CFF6
          }                                      * 3D004
        ;                                        * 3D009
