* HP 48GX ROM revision R, #4F0AC-#52016: Plotting
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ISTOP-INDEX SWAP#1+SWAP CHECKPICT INDEPVAR GROBDIM C%>%% 1get(li)? Re>C% %1- %%>C% RclMaxStdPict REPEATERCH
* Follows on from the previous file (at #4F0AC in the original ROM).
        RPL

* { hxs hxs' } -> C%
* refs (1): 1E289
DOPX>C:
        ::                                       * 4F0AC
          2HXSLIST?                              * 4F0B1
          s=>ñr                                  * 4F0B6
          SWAP                                   * 4F0BB
          s=>ñr                                  * 4F0C0
          SWAP                                   * 4F0C5
          2%>%%                                  * 4F0CA
          RclMaxStdPict                          * 4F0CF
          px->c(2rr,2s)                          * 4F0D4
        ;                                        * 4F0D9

* refs (6): 4F0B6 4F0C0 4FD45 4FD4F 4FD63 508F1
s=>ñr:
        ::                                       * 4F0DE
          DUP                                    * 4F0E3
          OBJ_4F4D0                              * 4F0E8
          #<case                                 * 4F0ED
          UNCOERCE                               * 4F0F2
          BINT0                                  * 4F0F7
          SWAP#-                                 * 4F0FC
          UNCOERCE                               * 4F101
          %CHS                                   * 4F106
        ;                                        * 4F10B

* refs (6): 49F33 49F74 4AC57 4E7A3 4E7B7 4F0D4
px->c(2rr,2s):
        ::                                       * 4F110
          GETPMIN&MAX                            * 4F115
          2SWAP                                  * 4F11A
          OBJ_4F2CD                              * 4F11F
          5ROLL                                  * 4F124
          DUPTYPEBINT?                           * 4F129
          IT                                     * 4F12E
          UNCOERCE%%                             * 4F133
          %%-                                    * 4F138
          SWAP%%/                                * 4F13D
          %%>%                                   * 4F142
          4UNROLLROT                             * 4F147
          DUPTYPEBINT?                           * 4F14C
          IT                                     * 4F151
          UNCOERCE%%                             * 4F156
          SWAP                                   * 4F15B
          %%-                                    * 4F160
          SWAP%%/                                * 4F165
          %%>%                                   * 4F16A
          SWAP%>C%                               * 4F16F
        ;                                        * 4F174

* C% -> { hxs hxs' }
* refs (1): 1E2A9
DOC>PX:
        ::                                       * 4F179
          C%>#                                   * 4F17E
          SWAP                                   * 4F183
          #>HXS                                  * 4F188
          SWAP                                   * 4F18D
          #>HXS                                  * 4F192
          TWO{}N                                 * 4F197
        ;                                        * 4F19C

* refs (4): 49FB0 4F013 4F728 4FA1B
OBJ_4F1A1:
        ::                                       * 4F1A1
          OBJ_4F20F                              * 4F1A6
          (rò-0.5)=>s?                           * 4F1AB
          NOTcasedrop                            * 4F1B0
          2DROPFALSE                             * 4F1B5
          4UNROLLROT                             * 4F1BA
          r=>rr;rot;*(2rr);+(2rr);r=>r           * 4F1BF
          (rò-0.5)=>s?                           * 4F1C4
          NOTcsdrpfls                            * 4F1C9
          SWAPTRUE                               * 4F1CE
        ;                                        * 4F1D3

* ob1 ob2 -> ob2 ob1 T
* refs (5): 1044B 105E0 4F1CE 85346 B5FC7
SWAPTRUE:
        ::                                       * 4F1D8
          SWAP                                   * 4F1DD
          TRUE                                   * 4F1E2
        ;                                        * 4F1E7

* refs (2): 4FBD8 4FBE7
OBJ_4F1EC:
        ::                                       * 4F1EC
          OBJ_4F20F                              * 4F1F1
          COERCE                                 * 4F1F6
          4UNROLLROT                             * 4F1FB
          r=>rr;rot;*(2rr);+(2rr);r=>r           * 4F200
          COERCESWAP                             * 4F205
        ;                                        * 4F20A

* refs (3): 4E915 4F1A6 4F1F1
OBJ_4F20F:
        ::                                       * 4F20F
          ROT                                    * 4F214
          C%>%                                   * 4F219
          GETPMIN&MAX                            * 4F21E
          6ROLL                                  * 4F223
          6ROLL                                  * 4F228
          OBJ_4F2CD                              * 4F22D
          5ROLL                                  * 4F232
          r=>rr;rot;*(2rr);-(2rr);r=>r           * 4F237
        ;                                        * 4F23C

* refs (4): 4E91F 4F1BF 4F200 4FE58
r=>rr;rot;*(2rr);+(2rr);r=>r:
        ::                                       * 4F241
          %>%%                                   * 4F246
          ROT                                    * 4F24B
          %%*                                    * 4F250
          %%+                                    * 4F255
          %%>%                                   * 4F25A
        ;                                        * 4F25F

* refs (2): 4F237 4FE4E
r=>rr;rot;*(2rr);-(2rr);r=>r:
        ::                                       * 4F264
          %>%%                                   * 4F269
          ROT                                    * 4F26E
          %%*                                    * 4F273
          %%-                                    * 4F278
          %%>%                                   * 4F27D
        ;                                        * 4F282

* refs (3): 4E997 4F1AB 4F1C4
(rò-0.5)=>s?:
        ::                                       * 4F287
          DUP                                    * 4F28C
          %0>=                                   * 4F291
          case                                   * 4F296

r+=>s;true:
          ::                                     * 4F29B
            COERCE                               * 4F2A0
            TRUE                                 * 4F2A5
          ;                                      * 4F2AA
          %-.5                                   * 4F2AF
          %>=                                    * 4F2B4
          NOTcaseFALSE                           * 4F2B9
          BINT0                                  * 4F2BE
          TRUE                                   * 4F2C3
        ;                                        * 4F2C8

* refs (7): 4F11F 4F22D 4F41C 4F5ED 4FE44 51915 ...
OBJ_4F2CD:
        ::                                       * 4F2CD
          #1-                                    * 4F2D2
          UNCOERCE%%                             * 4F2D7
          SWAP#1-                                * 4F2DC
          UNCOERCE%%                             * 4F2E1
          4ROLL                                  * 4F2E6
          C%>%                                   * 4F2EB
          %>%%SWAP                               * 4F2F0
          %>%%                                   * 4F2F5
          5ROLL                                  * 4F2FA
          C%>%                                   * 4F2FF
          %>%%SWAP                               * 4F304
          %>%%                                   * 4F309
          3PICK                                  * 4F30E
          %%-                                    * 4F313
          DUP                                    * 4F318
          7PICK                                  * 4F31D
          SWAP%%/                                * 4F322
          7UNROLL                                * 4F327
          ROT                                    * 4F32C
          %%CHS                                  * 4F331
          6ROLL                                  * 4F336
          %%*SWAP                                * 4F33B
          %%/                                    * 4F340
          4UNROLL                                * 4F345
          DUPROT                                 * 4F34A
          %%-                                    * 4F34F
          DUP                                    * 4F354
          4PICKSWAP                              * 4F359
          %%/                                    * 4F35E
          4UNROLL                                * 4F363
          SWAPROT                                * 4F368
          %%*SWAP                                * 4F36D
          %%/                                    * 4F372
        ;                                        * 4F377

* refs (1): 20D36
sto(go,PICT):
        ::                                       * 4F37C
          CKPICT                                 * 4F381
          OBJ_46152                              * 4F386
          DUPGROBDIM                             * 4F38B
          #       800                            * 4F390  2048
          OVER#<                                 * 4F39A
          case                                   * 4F39F
          SETSIZEERR                             * 4F3A4
          KILLGDISP                              * 4F3A9
          MAKEGROB                               * 4F3AE
          GROB>GDISP                             * 4F3B3
          CHECKPICT                              * 4F3B8
          GBUFF                                  * 4F3BD
          ZEROZERO                               * 4F3C2
          GROB!                                  * 4F3C7
        ;                                        * 4F3CC

* hxs hxs -> # #
* refs (2): 4F6A6 5155A
2HXS>#:
        ::                                       * 4F3D1
          HXS>#                                  * 4F3D6
          SWAP                                   * 4F3DB
          HXS>#                                  * 4F3E0
          SWAP                                   * 4F3E5
        ;                                        * 4F3EA

* refs (1): 1E329
pixon(c):
        ::                                       * 4F3EF
          CHECKPICT                              * 4F3F4
          C%>#                                   * 4F3F9
          PIXON3                                 * 4F3FE
        ;                                        * 4F403

* C% -> # #'
* refs (4): 4F17E 4F3F9 4F47B 4F4AD
C%>#:
        ::                                       * 4F408
          C%>%                                   * 4F40D
          GETPMIN&MAX                            * 4F412
          RclMaxStdPict                          * 4F417
          OBJ_4F2CD                              * 4F41C
          5ROLL                                  * 4F421
          SWAPROT                                * 4F426
          getypos                                * 4F42B
          5UNROLL                                * 4F430
          5UNROLL                                * 4F435
          SWAP                                   * 4F43A
          getxpos                                * 4F43F
          OBJ_506C2                              * 4F444
          3UNROLL                                * 4F449
          OBJ_506C2                              * 4F44E
        ;                                        * 4F453

* refs (1): 1E333
pixon(li):
        ::                                       * 4F458
          2HXSLIST?                              * 4F45D
          CHECKPICT                              * 4F462
          PIXON3                                 * 4F467
        ;                                        * 4F46C

* refs (1): 1E353
pixoff(c):
        ::                                       * 4F471
          CHECKPICT                              * 4F476
          C%>#                                   * 4F47B
          PIXOFF3                                * 4F480
        ;                                        * 4F485

* refs (1): 1E35D
pixoff(li):
        ::                                       * 4F48A
          2HXSLIST?                              * 4F48F
          CHECKPICT                              * 4F494
          PIXOFF3                                * 4F499
        ;                                        * 4F49E

* refs (1): 1E37D
pix?(c):
        ::                                       * 4F4A3
          CHECKPICT                              * 4F4A8
          C%>#                                   * 4F4AD
          pix?(2s)                               * 4F4B2
        ;                                        * 4F4B7

* refs (1): 1E387
pix?(li):
        ::                                       * 4F4BC
          2HXSLIST?                              * 4F4C1
          CHECKPICT                              * 4F4C6

* refs (1): 4F4B2
pix?(2s):
          ::                                     * 4F4CB

* refs (1): 4F0E8
OBJ_4F4D0:
            #       80000                        * 4F4D0  524288
            2DUP#<                               * 4F4DA
            4PICK                                * 4F4DF
            ROT                                  * 4F4E4
            #<                                   * 4F4E9
            AND                                  * 4F4EE
            NOTcase                              * 4F4F3
            2DROP%0                              * 4F4F8
            GBUFF                                * 4F4FD
            InGrob(2s,go)?                       * 4F502
            NOTcase                              * 4F507
            2DROP%0                              * 4F50C
            PIXON?3                              * 4F511
            COERCEFLAG                           * 4F516
          ;                                      * 4F51B
        ;                                        * 4F520

* refs (1): 1E3A7
line(2li):
        ::                                       * 4F525
          TRUE                                   * 4F52A
          line(2li,?)                            * 4F52F
        ;                                        * 4F534

* refs (1): 1E3D1
tline(2li):
        ::                                       * 4F539
          FALSE                                  * 4F53E
          line(2li,?)                            * 4F543
        ;                                        * 4F548

* refs (2): 4F52F 4F543
line(2li,?):
        ::                                       * 4F54D
          3UNROLL                                * 4F552
          2HXSLIST?                              * 4F557
          ROT                                    * 4F55C
          2HXSLIST?                              * 4F561
          CHECKPICT                              * 4F566
          5ROLL                                  * 4F56B
          ITE                                    * 4F570
          DRAWLINE#3                             * 4F575
          TOGGLELINE#3                           * 4F57A
        ;                                        * 4F57F

* refs (4): 1E3B1 477CC 8A80F 8C403
line(2c):
        ::                                       * 4F584
          TRUE                                   * 4F589
          line(2c,?)                             * 4F58E
        ;                                        * 4F593

* refs (1): 1E3DB
tline(2c):
        ::                                       * 4F598
          FALSE                                  * 4F59D
          line(2c,?)                             * 4F5A2
        ;                                        * 4F5A7

* refs (2): 4F58E 4F5A2
line(2c,?):
        ::                                       * 4F5AC
          3UNROLL                                * 4F5B1
          CHECKPICT                              * 4F5B6
          2c=>pxs                                * 4F5BB
          5ROLL                                  * 4F5C0
          ITE                                    * 4F5C5
          DRAWLINE#3                             * 4F5CA
          TOGGLELINE#3                           * 4F5CF
        ;                                        * 4F5D4

* refs (2): 4F5BB 4F692
2c=>pxs:
        ::                                       * 4F5D9
          SWAP2C%>%                              * 4F5DE
          GETPMIN&MAX                            * 4F5E3
          RclMaxStdPict                          * 4F5E8
          OBJ_4F2CD                              * 4F5ED
          2DUP                                   * 4F5F2
          7ROLL                                  * 4F5F7
          SWAPROT                                * 4F5FC
          getypos                                * 4F601
          OBJ_506C2                              * 4F606
          5UNROLL                                * 4F60B
          7ROLL                                  * 4F610
          SWAPROT                                * 4F615
          getypos                                * 4F61A
          OBJ_506C2                              * 4F61F
          3UNROLL                                * 4F624
          2DUP                                   * 4F629
          8ROLL                                  * 4F62E
          SWAPROT                                * 4F633
          getxpos                                * 4F638
          OBJ_506C2                              * 4F63D
          4UNROLL                                * 4F642
          6ROLL                                  * 4F647
          SWAPROT                                * 4F64C
          getxpos                                * 4F651
          OBJ_506C2                              * 4F656
          4UNROLL                                * 4F65B
        ;                                        * 4F660

* refs (1): 1E3FB
box(2li):
        ::                                       * 4F665
          2HXSLIST?                              * 4F66A
          ROT                                    * 4F66F
          2HXSLIST?                              * 4F674
          CHECKPICT                              * 4F679
          DRAWBOX#                               * 4F67E
        ;                                        * 4F683

* refs (1): 1E405
box(2c):
        ::                                       * 4F688
          CHECKPICT                              * 4F68D
          2c=>pxs                                * 4F692
          DRAWBOX#                               * 4F697
        ;                                        * 4F69C

* refs (1): 1E425
blank(2b):
        ::                                       * 4F6A1
          2HXS>#                                 * 4F6A6
          SWAP                                   * 4F6AB
          MAKEGROB                               * 4F6B0
        ;                                        * 4F6B5

* refs (2): 1E474 1E502
g?or(go,li,go,?):
        ::                                       * 4F6BA
          4ROLL                                  * 4F6BF
          CKREF                                  * 4F6C4
          4UNROLL                                * 4F6C9
          4UNROLL                                * 4F6CE
          OBJ_4F6DD                              * 4F6D3
        ;                                        * 4F6D8

* refs (2): 4F6D3 4F76E
OBJ_4F6DD:
        ::                                       * 4F6DD
          SWAP                                   * 4F6E2
          2HXSLIST?                              * 4F6E7
          GROB+#                                 * 4F6EC
        ;                                        * 4F6F1

* refs (2): 1E492 1E520
g?or(go,c,go,?):
        ::                                       * 4F6F6
          4ROLL                                  * 4F6FB
          CKREF                                  * 4F700
          4UNROLL                                * 4F705
          4UNROLL                                * 4F70A
          OBJ_4F719                              * 4F70F
        ;                                        * 4F714

* refs (2): 4F70F 4F77D
OBJ_4F719:
        ::                                       * 4F719
          SWAP                                   * 4F71E
          OBJ_472D1                              * 4F723
          OBJ_4F1A1                              * 4F728
          case                                   * 4F72D
          GROB+#                                 * 4F732
          SETSIZEERR                             * 4F737
        ;                                        * 4F73C

* refs (4): 1E4B0 1E4CE 1E53E 1E55C
g?or(PICT,c,go,?):
        ::                                       * 4F741
          4UNROLLROT                             * 4F746
          CKPICT                                 * 4F74B
          CHECKPICT                              * 4F750
          GBUFF                                  * 4F755
          UNROTOVER                              * 4F75A
          TYPELIST?                              * 4F75F
          case                                   * 4F764
          ::                                     * 4F769
            OBJ_4F6DD                            * 4F76E
            DROP                                 * 4F773
          ;                                      * 4F778
          OBJ_4F719                              * 4F77D
          DROP                                   * 4F782
        ;                                        * 4F787

* flag grob1 grob2 #x #y -> grob'
* refs (2): 4F6EC 4F732
GROB+#:
        ::                                       * 4F78C
          4PICK                                  * 4F791
          InGrob(2s,go)?#:BAV!                   * 4F796
          CKGROBFITS                             * 4F79B
          2DUP                                   * 4F7A0
          5PICK                                  * 4F7A5
          GROBDIM                                * 4F7AA
          4PICK#+SWAP                            * 4F7AF
          3PICK#+                                * 4F7B4
          8PICK                                  * 4F7B9
          5UNROLL                                * 4F7BE
          SUBGROB                                * 4F7C3
          4ROLL                                  * 4F7C8
          OBJ_4F91C                              * 4F7CD
          4PICK                                  * 4F7D2
          2SWAP                                  * 4F7D7
          GROB!                                  * 4F7DC
        ;                                        * 4F7E1

* g1 g2 #n #m -> g1 g2' #n #m
* refs (5): 4EA69 4ED52 4F79B 4F9DA 50451
CKGROBFITS:
        ::                                       * 4F7E6
          OBJ_472D1                              * 4F7EB
          2DUP                                   * 4F7F0
          6PICK                                  * 4F7F5
          #+SWAP                                 * 4F7FA
          5PICK                                  * 4F7FF
          #+                                     * 4F804
          8PICK                                  * 4F809
          GROBDIM                                * 4F80E
          DUP                                    * 4F813
          5ROLL                                  * 4F818
          #<ITE                                  * 4F81D
          ::                                     * 4F822
            7PICK                                * 4F827
            #-                                   * 4F82C
            4ROLLDROP                            * 4F831
            TRUE                                 * 4F836
          ;                                      * 4F83B
          ::                                     * 4F840
            DROPROT                              * 4F845
            FALSE                                * 4F84A
          ;                                      * 4F84F
          3PICK                                  * 4F854
          5ROLL                                  * 4F859
          #<ITE                                  * 4F85E
          ::                                     * 4F863
            ROT                                  * 4F868
            5PICK                                * 4F86D
            #-                                   * 4F872
            4ROLLDROP                            * 4F877
            TRUE                                 * 4F87C
          ;                                      * 4F881

drop(3);rot;false:
          ::                                     * 4F886
            ROTDROP                              * 4F88B
            ROT                                  * 4F890
            FALSE                                * 4F895
          ;                                      * 4F89A
          ROT                                    * 4F89F
          OR                                     * 4F8A4
          NOTcase2DROP                           * 4F8A9
          5ROLL                                  * 4F8AE
          ZEROZERO                               * 4F8B3
          5ROLL                                  * 4F8B8
          5ROLL                                  * 4F8BD
          SUBGROB                                * 4F8C2
          3UNROLL                                * 4F8C7
        ;                                        * 4F8CC

* refs (1): 1AC2A
+(2go):
        ::                                       * 4F8D1
          DUPGROBDIM                             * 4F8D6
          4PICK                                  * 4F8DB
          GROBDIM                                * 4F8E0
          ROT                                    * 4F8E5
          #=                                     * 4F8EA
          3UNROLL                                * 4F8EF
          #=                                     * 4F8F4
          AND                                    * 4F8F9
          NcaseSIZEERR                           * 4F8FE
          OBJ_4F949                              * 4F903
          !OR$                                   * 4F908
          &HXS                                   * 4F90D
          OBJ_515CD                              * 4F912
        ;                                        * 4F917

* refs (1): 4F7CD
OBJ_4F91C:
        ::                                       * 4F91C
          OBJ_4F949                              * 4F921
          7ROLL                                  * 4F926
          ITE                                    * 4F92B
          !OR$                                   * 4F930
          !XOR$                                  * 4F935
          &HXS                                   * 4F93A
          OBJ_515CD                              * 4F93F
        ;                                        * 4F944

* refs (2): 4F903 4F921
OBJ_4F949:
        ::                                       * 4F949
          DUP                                    * 4F94E
          LENHXS                                 * 4F953
          OVER                                   * 4F958
          BINT1                                  * 4F95D
          BINT10                                 * 4F962
          SUBHXS                                 * 4F967
          ROT                                    * 4F96C
          BINT11                                 * 4F971
          4PICK                                  * 4F976
          SUBHXS                                 * 4F97B
          4ROLL                                  * 4F980
          BINT11                                 * 4F985
          5ROLL                                  * 4F98A
          SUBHXS                                 * 4F98F
        ;                                        * 4F994

* refs (1): 1C8FE
repl(go,li,go):
        ::                                       * 4F999
          rot;NewobIfNotFree                     * 4F99E
          3UNROLL                                * 4F9A3
          repl!(go,li,go)                        * 4F9A8
        ;                                        * 4F9AD

* refs (2): 4F9A8 4FA5C
repl!(go,li,go):
        ::                                       * 4F9B2
          SWAP                                   * 4F9B7
          2HXSLIST?                              * 4F9BC
          ChkRepl(2go,2s)                        * 4F9C1
        ;                                        * 4F9C6

* refs (5): 4F9C1 4FA25 8BB80 8BCBC C0B9A
ChkRepl(2go,2s):
        ::                                       * 4F9CB
          4PICK                                  * 4F9D0
          InGrob(2s,go)?#:BAV!                   * 4F9D5
          CKGROBFITS                             * 4F9DA
          4PICK                                  * 4F9DF
          3UNROLL                                * 4F9E4
          GROB!                                  * 4F9E9
        ;                                        * 4F9EE

* refs (1): 1C90D
repl(go,c,go):
        ::                                       * 4F9F3
          rot;NewobIfNotFree                     * 4F9F8
          3UNROLL                                * 4F9FD
          repl!(go,c,go)                         * 4FA02
        ;                                        * 4FA07

* refs (2): 4FA02 4FA6B
repl!(go,c,go):
        ::                                       * 4FA0C
          SWAP                                   * 4FA11
          OBJ_472D1                              * 4FA16
          OBJ_4F1A1                              * 4FA1B
          NOTcaseDROP                            * 4FA20
          ChkRepl(2go,2s)                        * 4FA25
        ;                                        * 4FA2A

* refs (2): D231D D232C
repl(PICT,c,go):
        ::                                       * 4FA2F
          ROT                                    * 4FA34
          CKPICT                                 * 4FA39
          CHECKPICT                              * 4FA3E
          GBUFF                                  * 4FA43
          UNROTOVER                              * 4FA48
          TYPELIST?                              * 4FA4D
          case                                   * 4FA52
          ::                                     * 4FA57
            repl!(go,li,go)                      * 4FA5C
            DROP                                 * 4FA61
          ;                                      * 4FA66
          repl!(go,c,go)                         * 4FA6B
          DROP                                   * 4FA70
        ;                                        * 4FA75

* refs (1): 1C92B
OBJ_4FA7A:
        ::                                       * 4FA7A
          SWAP                                   * 4FA7F
          COERCE                                 * 4FA84
          DUP#0=case                             * 4FA89
          SETSIZEERR                             * 4FA8E
          3PICK                                  * 4FA93
          LENCOMP                                * 4FA98
          OVER#<                                 * 4FA9D
          casedrop                               * 4FAA2
          &COMP                                  * 4FAA7
          3PICK                                  * 4FAAC
          BINT1                                  * 4FAB1
          3PICK                                  * 4FAB6
          #1-                                    * 4FABB
          SUBCOMP                                * 4FAC0
          4ROLLROT                               * 4FAC5
          4PICK                                  * 4FACA
          LENCOMP                                * 4FACF
          #+OVER                                 * 4FAD4
          LENCOMP                                * 4FAD9
          SUBCOMP                                * 4FADE
          ROTSWAP                                * 4FAE3
          &COMP                                  * 4FAE8
          &COMP                                  * 4FAED
        ;                                        * 4FAF2

* refs (1): 1C91C
repl(st,s,st):
        ::                                       * 4FAF7
          SWAP                                   * 4FAFC
          COERCE                                 * 4FB01
          DUP#0=case                             * 4FB06
          SETSIZEERR                             * 4FB0B
          3PICK                                  * 4FB10
          LEN$                                   * 4FB15
          OVER#<                                 * 4FB1A
          casedrop                               * 4FB1F
          &$                                     * 4FB24
          3PICK                                  * 4FB29
          BINT1                                  * 4FB2E
          3PICK                                  * 4FB33
          #1-                                    * 4FB38
          SUB$                                   * 4FB3D
          4ROLLROT                               * 4FB42
          4PICK                                  * 4FB47
          LEN$                                   * 4FB4C
          #+OVER                                 * 4FB51
          LEN$                                   * 4FB56
          SUB$                                   * 4FB5B
          ROTSWAP                                * 4FB60
          &$                                     * 4FB65
          &$                                     * 4FB6A
        ;                                        * 4FB6F

* refs (2): 1C884 4FC19
sub(go,2li):
        ::                                       * 4FB74
          2HXSLIST?                              * 4FB79
          ROT                                    * 4FB7E
          2HXSLIST?                              * 4FB83
          sub(go,4s)                             * 4FB88
        ;                                        * 4FB8D

* refs (2): 4FB88 4FBEC
sub(go,4s):
        ::                                       * 4FB92
          ORDERXY#                               * 4FB97
          #1+                                    * 4FB9C
          SWAP#1+SWAP                            * 4FBA1
          SUBGROB                                * 4FBA6
          DUPGROBDIM                             * 4FBAB
          2#0=OR                                 * 4FBB0
          casedrop                               * 4FBB5
          SETSIZEERR                             * 4FBBA
        ;                                        * 4FBBF

* refs (2): 1C893 4FC1E
sub(go,2c):
        ::                                       * 4FBC4
          OBJ_472D1                              * 4FBC9
          2DUP5ROLL                              * 4FBCE
          3UNROLL                                * 4FBD3
          OBJ_4F1EC                              * 4FBD8
          5UNROLL                                * 4FBDD
          5UNROLL                                * 4FBE2
          OBJ_4F1EC                              * 4FBE7
          sub(go,4s)                             * 4FBEC
        ;                                        * 4FBF1

* refs (2): D2285 D2294
sub(PICT,2c):
        ::                                       * 4FBF6
          ROT                                    * 4FBFB
          CKPICT                                 * 4FC00
          CHECKPICT                              * 4FC05
          GBUFF                                  * 4FC0A
          3UNROLL                                * 4FC0F
          dLISTcase                              * 4FC14
          sub(go,2li)                            * 4FC19
          sub(go,2c)                             * 4FC1E
        ;                                        * 4FC23

* refs (1): 1A9E0
inv(go):
        ::                                       * 4FC28
          CKREF                                  * 4FC2D
          INVGROB                                * 4FC32
        ;                                        * 4FC37

* refs (1): 1A9EA
neg(PICT):
        ::                                       * 4FC3C
          CKPICT                                 * 4FC41
          CHECKPICT                              * 4FC46
          GBUFF                                  * 4FC4B
          INVGROB                                * 4FC50
          DROP                                   * 4FC55
        ;                                        * 4FC5A

* refs (1): 1E5E6
arc(c,3r):
        ::                                       * 4FC5F
          CHECKPICT                              * 4FC64
          OBJ_4FDCC                              * 4FC69
          CHECKPVARS                             * 4FC6E
          DROP                                   * 4FC73
          4UNROLL                                * 4FC78
          OVER                                   * 4FC7D
          %SGN                                   * 4FC82
          4UNROLL                                * 4FC87
          %POL>%REC                              * 4FC8C
          %>C%                                   * 4FC91
          OVER                                   * 4FC96
          C%C+C                                  * 4FC9B
          RclMaxStdPict                          * 4FCA0
          2DUP                                   * 4FCA5
          5ROLL                                  * 4FCAA
          C%>%                                   * 4FCAF
          OBJ_4FE30                              * 4FCB4
          4UNROLL                                * 4FCB9
          ROT                                    * 4FCBE
          C%>%                                   * 4FCC3
          OBJ_4FE30                              * 4FCC8
          2DUP                                   * 4FCCD
          C%C-C                                  * 4FCD2
          C%ABS                                  * 4FCD7
          4ROLL                                  * 4FCDC
          %*                                     * 4FCE1
          4ROLL                                  * 4FCE6
          %POL>%REC                              * 4FCEB
          %CHS                                   * 4FCF0
          %>C%                                   * 4FCF5
          OVER                                   * 4FCFA
          C%C+C                                  * 4FCFF
          OBJ_4FE12                              * 4FD04
          2SWAP                                  * 4FD09
          OBJ_4FE12                              * 4FD0E
          ROT                                    * 4FD13
          OBJ_4FE12                              * 4FD18
          2SWAP                                  * 4FD1D
          OBJ_4FE6C                              * 4FD22
        ;                                        * 4FD27

* refs (1): 1E5F5
arc(li,b,2r):
        ::                                       * 4FD2C
          CHECKPICT                              * 4FD31
          OBJ_4FDCC                              * 4FD36
          4ROLL                                  * 4FD3B
          2HXSLIST?                              * 4FD40
          s=>ñr                                  * 4FD45
          SWAP                                   * 4FD4A
          s=>ñr                                  * 4FD4F
          SWAP                                   * 4FD54
          5ROLL                                  * 4FD59
          HXS>#                                  * 4FD5E
          s=>ñr                                  * 4FD63
          DUP4UNROLL                             * 4FD68
          5ROLL                                  * 4FD6D

* refs (1): 4FDBD
OBJ_4FD72:
          ::                                     * 4FD72
            %CHS                                 * 4FD77
            %POL>%REC                            * 4FD7C
            %0_2A2B4                             * 4FD81
            RNDXY                                * 4FD86
            3PICK                                * 4FD8B
            %+SWAP                               * 4FD90
            %0_2A2B4                             * 4FD95
            RNDXY                                * 4FD9A
            4PICK                                * 4FD9F
            %+SWAP                               * 4FDA4
            2SWAP                                * 4FDA9
          ;                                      * 4FDAE
          5ROLL                                  * 4FDB3
          6ROLL                                  * 4FDB8
          OBJ_4FD72                              * 4FDBD
          OBJ_4FE6C                              * 4FDC2
        ;                                        * 4FDC7

* refs (2): 4FC69 4FD36
OBJ_4FDCC:
        ::                                       * 4FDCC
          2DUP                                   * 4FDD1
          dist(2r)                               * 4FDD6
          1REV                                   * 4FDDB
          2DUP                                   * 4FDE0
          %1-                                    * 4FDE5
          %<                                     * 4FDEA
          7UNROLL                                * 4FDEF
          %>                                     * 4FDF4
          IT                                     * 4FDF9
          DROPDUP                                * 4FDFE
        ;                                        * 4FE03

* refs (1): 45218
OBJ_4FE08:
        ::                                       * 4FE08
          OBJ_4FE30                              * 4FE0D

* refs (3): 4FD04 4FD0E 4FD18
OBJ_4FE12:
          ::                                     * 4FE12
            %0_2A2B4                             * 4FE17
            trunc(c,r)                           * 4FE1C
            C%>%                                 * 4FE21
          ;                                      * 4FE26
        ;                                        * 4FE2B

* refs (3): 4FCB4 4FCC8 4FE0D
OBJ_4FE30:
        ::                                       * 4FE30
          GETPMIN&MAX                            * 4FE35
          6ROLL                                  * 4FE3A
          6ROLL                                  * 4FE3F
          OBJ_4F2CD                              * 4FE44
          5ROLL                                  * 4FE49
          r=>rr;rot;*(2rr);-(2rr);r=>r           * 4FE4E
          4UNROLLROT                             * 4FE53
          r=>rr;rot;*(2rr);+(2rr);r=>r           * 4FE58
          SWAP                                   * 4FE5D
          %>C%                                   * 4FE62
        ;                                        * 4FE67

* refs (3): 4E622 4FD22 4FDC2
OBJ_4FE6C:
        ::                                       * 4FE6C
          {                                      * 4FE71
            ::                                   * 4FE76
              9GETLAM                            * 4FE7B
              %=                                 * 4FE80
              SWAP                               * 4FE85
              6GETLAM                            * 4FE8A
              %>=                                * 4FE8F
            ;                                    * 4FE94
            ::                                   * 4FE99
              5GETLAM                            * 4FE9E
              %>=                                * 4FEA3
              SWAP                               * 4FEA8
              10GETLAM                           * 4FEAD
              %=                                 * 4FEB2
            ;                                    * 4FEB7
            ::                                   * 4FEBC
              9GETLAM                            * 4FEC1
              %=                                 * 4FEC6
              SWAP                               * 4FECB
              6GETLAM                            * 4FED0
              %<                                 * 4FED5
            ;                                    * 4FEDA
            ::                                   * 4FEDF
              5GETLAM                            * 4FEE4
              %<                                 * 4FEE9
              SWAP                               * 4FEEE
              10GETLAM                           * 4FEF3
              %=                                 * 4FEF8
            ;                                    * 4FEFD
          }                                      * 4FF02
          7PICK                                  * 4FF07
          4PICK                                  * 4FF0C
          %-                                     * 4FF11
          7PICK                                  * 4FF16
          4PICK                                  * 4FF1B
          %-                                     * 4FF20
          2DUP                                   * 4FF25
          %ABS                                   * 4FF2A
          SWAP                                   * 4FF2F
          %ABS                                   * 4FF34
          %>                                     * 4FF39
          ITE                                    * 4FF3E
          ::                                     * 4FF43
            SWAPDROP                             * 4FF48
            %0>                                  * 4FF4D
            ITE                                  * 4FF52
            BINT2                                * 4FF57
            BINT4                                * 4FF5C
          ;                                      * 4FF61
          ::                                     * 4FF66
            DROP                                 * 4FF6B
            %0>                                  * 4FF70
            ITE                                  * 4FF75
            BINT1                                * 4FF7A
            BINT3                                * 4FF7F
          ;                                      * 4FF84
          NTHCOMPDROP                            * 4FF89
          TrueTrue                               * 4FF8E
          3PICK                                  * 4FF93
          {                                      * 4FF98

Π'xe:
            LAM     'xe                          * 4FF9D

Π'ye:
            LAM     'ye                          * 4FFAA

Π'x:
            LAM     'x                           * 4FFB7

Π'y:
            LAM     'y                           * 4FFC2

Π'xc:
            LAM     'xc                          * 4FFCD

Π'yc:
            LAM     'yc                          * 4FFDA

Π'r2:
            LAM     'r2                          * 4FFE7

Π'left:
            LAM     'left                        * 4FFF4

Π'up:
            LAM     'up                          * 50005

Π'exit:
            LAM     'exit                        * 50012
          }                                      * 50023
          BIND                                   * 50028
          8GETLAM                                * 5002D
          10GETLAM                               * 50032
          %=                                     * 50037
          7GETLAM                                * 5003C
          9GETLAM                                * 50041
          %=                                     * 50046
          AND                                    * 5004B
          AND                                    * 50050
          8GETLAM                                * 50055
          6GETLAM                                * 5005A
          %=                                     * 5005F
          7GETLAM                                * 50064
          5GETLAM                                * 50069
          %=                                     * 5006E
          AND                                    * 50073
          ORcase                                 * 50078
          ::                                     * 5007D
            OBJ_5036B                            * 50082
            ABND                                 * 50087
          ;                                      * 5008C
          8GETLAM                                * 50091
          7GETLAM                                * 50096
          OBJ_5032A                              * 5009B
          DUP                                    * 500A0
          %3                                     * 500A5
          %<                                     * 500AA
          IT                                     * 500AF
          OBJ_501DB                              * 500B4
          4PUTLAM                                * 500B9
          2DROP                                  * 500BE
          OBJ_5036B                              * 500C3
          BEGIN                                  * 500C8
          OBJ_5028A                              * 500CD
          8GETLAM                                * 500D2
          3GETLAM                                * 500D7
          ITE                                    * 500DC
          %1-                                    * 500E1
          %1+                                    * 500E6
          7GETLAM                                * 500EB
          OBJ_5032A                              * 500F0
          OBJ_517B2                              * 500F5
          2GETLAM                                * 500FA
          ITE                                    * 500FF
          %1-                                    * 50104
          %1+                                    * 50109
          OBJ_5032A                              * 5010E
          6PICK                                  * 50113
          3PICK                                  * 50118
          OBJ_5032A                              * 5011D
          4GETLAM                                * 50122
          dist(2r)                               * 50127
          4ROLL                                  * 5012C
          4GETLAM                                * 50131
          dist(2r)                               * 50136
          2DUP                                   * 5013B
          %>                                     * 50140
          ITE                                    * 50145
          4UNROLL3DROP                           * 5014A

drop(1,5-6):
          ::                                     * 5014F
            DROP                                 * 50154
            4ROLLDROP                            * 50159
            4ROLLDROP                            * 5015E
          ;                                      * 50163
          4ROLL                                  * 50168
          4GETLAM                                * 5016D
          dist(2r)                               * 50172
          %>                                     * 50177
          ?SKIP                                  * 5017C
          2SWAP                                  * 50181
          2DROP                                  * 50186
          TOTEMPSWAP                             * 5018B
          TOTEMPSWAP                             * 50190
          7PUTLAM                                * 50195
          8PUTLAM                                * 5019A
          OBJ_5036B                              * 5019F
          OBJ_517B2                              * 501A4
          1GETLAM                                * 501A9
          EVAL                                   * 501AE
          AND                                    * 501B3
          ATTNFLG@                               * 501B8
          ATTNFLGCLR                             * 501BD
          #0<>                                   * 501C2
          OR                                     * 501C7
          UNTIL                                  * 501CC
          ABND                                   * 501D1
        ;                                        * 501D6

* refs (1): 500B4
OBJ_501DB:
        ::                                       * 501DB
          DROP                                   * 501E0
          %2                                     * 501E5
          9GETLAM                                * 501EA
          5GETLAM                                * 501EF
          %-                                     * 501F4
          %SGN                                   * 501F9
          5GETLAM                                * 501FE
          %+                                     * 50203
          9PUTLAM                                * 50208
          10GETLAM                               * 5020D
          6GETLAM                                * 50212
          %-                                     * 50217
          %SGN                                   * 5021C
          6GETLAM                                * 50221
          %+                                     * 50226
          10PUTLAM                               * 5022B
          '                                      * 50230
          ::                                     * 50235
            9GETLAM                              * 5023A
            %=                                   * 5023F
            SWAP                                 * 50244
            10GETLAM                             * 50249
            %=                                   * 5024E
          ;                                      * 50253
          1PUTLAM                                * 50258
        ;                                        * 5025D

* % -> %+1
* refs (8): 2098F 4CB1D 4EF5F 500E6 50109 AE262 ...
%1+:
        ::                                       * 50262
          %1                                     * 50267
          %+                                     * 5026C
        ;                                        * 50271

* % -> %-1
* refs (17): 209FA 4FDE5 500E1 50104 8A184 8A1D2 ...
%1-:
        ::                                       * 50276
          %1                                     * 5027B
          %-                                     * 50280
        ;                                        * 50285

* refs (1): 500CD
OBJ_5028A:
        ::                                       * 5028A
          8GETLAM                                * 5028F
          6GETLAM                                * 50294
          %=                                     * 50299
          ITE                                    * 5029E
          ::                                     * 502A3
            7GETLAM                              * 502A8
            5GETLAM                              * 502AD
            %>                                   * 502B2
          ;                                      * 502B7

* refs (1): 502EE
OBJ_502BC:
          ::                                     * 502BC
            8GETLAM                              * 502C1
            6GETLAM                              * 502C6
            %>                                   * 502CB
          ;                                      * 502D0
          2PUTLAM                                * 502D5
          7GETLAM                                * 502DA
          5GETLAM                                * 502DF
          %=                                     * 502E4
          ITE                                    * 502E9
          OBJ_502BC                              * 502EE
          ::                                     * 502F3
            5GETLAM                              * 502F8
            7GETLAM                              * 502FD
            %>                                   * 50302
          ;                                      * 50307
          3PUTLAM                                * 5030C
        ;                                        * 50311

* refs (2): 4F075 4F084
OBJ_50316:
        ::                                       * 50316
          #+                                     * 5031B
          #<                                     * 50320
        ;                                        * 50325

* refs (4): 5009B 500F0 5010E 5011D
OBJ_5032A:
        ::                                       * 5032A
          DUP                                    * 5032F
          5GETLAM                                * 50334
          %-                                     * 50339
          DUP                                    * 5033E
          %*                                     * 50343
          3PICK                                  * 50348
          6GETLAM                                * 5034D
          %-                                     * 50352
          DUP                                    * 50357
          %*                                     * 5035C
          %+                                     * 50361
        ;                                        * 50366

* refs (3): 50082 500C3 5019F
OBJ_5036B:
        ::                                       * 5036B
          8GETLAM                                * 50370
          %-.5                                   * 50375
          %<                                     * 5037A
          ?SEMI                                  * 5037F
          7GETLAM                                * 50384
          %-.5                                   * 50389
          %<                                     * 5038E
          ?SEMI                                  * 50393
          8GETLAM                                * 50398
          7GETLAM                                * 5039D
          COERCE2                                * 503A2
          PIXON3                                 * 503A7
        ;                                        * 503AC

* refs (6): 4FDD6 50127 50136 50172 50905 50914
dist(2r):
        ::                                       * 503B1
          %MAXorder                              * 503B6
          %-                                     * 503BB
        ;                                        * 503C0

* refs (1): 1E610
text:
        ::                                       * 503C5
          TOADISP                                * 503CA
        ;                                        * 503CF

* -> grob
* refs (1): 1E57C
DOLCD>:
        ::                                       * 503D4
          BINT64                                 * 503D9
          BINT131                                * 503DE
          MAKEGROB                               * 503E3
          ABUFF                                  * 503E8
          ZEROZERO                               * 503ED
          BINT131                                * 503F2
          #       38                             * 503F7  56
          SUBGROB                                * 50401
          OVER                                   * 50406
          ZEROZERO                               * 5040B
          GROB!                                  * 50410
          HARDBUFF2                              * 50415
          OVER                                   * 5041A
          BINT0                                  * 5041F
          #       38                             * 50424  56
          GROB!                                  * 5042E
        ;                                        * 50433

* grob ->
* refs (1): 1E59C
DO>LCD:
        ::                                       * 50438
          DOCLLCD                                * 5043D
          ABUFF                                  * 50442
          SWAP                                   * 50447
          ZEROZERO                               * 5044C
          CKGROBFITS                             * 50451
          4ROLL                                  * 50456
          3UNROLL                                * 5045B
          GROB!                                  * 50460
        ;                                        * 50465

* ->
* refs (4): 1A862 47D65 5043D 6B25A
DOCLLCD:
        ::                                       * 5046A
          ABUFF                                  * 5046F
          ZEROZERO                               * 50474
          OBJ_472D1                              * 50479
          SWAP                                   * 5047E
          GROB!ZERODRP                           * 50483
        ;                                        * 50488

* refs (2): 1E5C1 50532
->grob(_,r):
        ::                                       * 5048D
          %0_2A2B4                               * 50492
          EQUALcasedrop                          * 50497
          0->grob(_)                             * 5049C
          OVER                                   * 504A1
          TYPECSTR?                              * 504A6
          ?SKIP                                  * 504AB
          ::                                     * 504B0
            SWAP                                 * 504B5
            BINT0                                * 504BA
            !DcompWidth                          * 504BF
            1stkdecomp$w                         * 504C4
            SWAP                                 * 504C9
          ;                                      * 504CE
          %1                                     * 504D3
          EQUALcasedrop                          * 504D8
          $>grob                                 * 504DD
          %2                                     * 504E2
          EQUALcasedrop                          * 504E7
          $>GROB                                 * 504EC
          %3                                     * 504F1
          EQUALcasedrop                          * 504F6
          $>BIGGROB                              * 504FB
          SETSIZEERR                             * 50500
        ;                                        * 50505

* refs (1): 5049C
0->grob(_):
        ::                                       * 5050A
          DUPTYPESYMB?                           * 5050F
          case                                   * 50514
          OBJ_6C45B                              * 50519
          DUPTYPEEXT?                            * 5051E
          case                                   * 50523
          OBJ_6C45B                              * 50528
          %3                                     * 5052D
          ->grob(_,r)                            * 50532
        ;                                        * 50537

* -> grob
* refs (3): 4847C 4DA17 4DD23
CROSSGROB:
        GROB    "images/5053C-CROSSGROB.png"     * 5053C  5 x 5

* -> grob
* refs (1): 4ECC6
MARKGROB:
        GROB    "images/5055A-MARKGROB.png"      * 5055A  5 x 5

* grob -> #height #width
* refs (20): 12B76 15DC9 17DA0 1CA67 412F6 41300 ...
GROBDIM:
        CON(5)  (*)+5                            * 50578  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 5057D
        D1=D1+  5                                * 50580
        D=D+1   A                                * 50583
        GOSBVL  SAVPTR                           * 50585
        D1=A                                     * 5058C
        D1=D1+  10                               * 5058F
        A=DAT1  A                                * 50592
        R0=A                                     * 50595
        D1=D1+  5                                * 50598
        A=DAT1  A                                * 5059B
        R1=A                                     * 5059E
        GOSBVL  PUSH2#                           * 505A1
        A=DAT0  A                                * 505A8
        D0=D0+  5                                * 505AB
        PC=(A)                                   * 505AE

* -> grob
* refs (9): 1191F 11D1C 65B00 6C37F 6C5CD 6C5E6 ...
NULLPAINT:
        CON(5)  DOGROB                           * 505B2  DOGROB
        LENGTH                                   * 505B7  length, to #505C6
        BSS     10                               * 505BC
        ENDLENGTH                                * 505C6
        RPL

* refs (9): 48927 4BD87 4BE13 4C1AC 4C42C 4C908 ...
GETXPOS:
        ::                                       * 505C6
          6GETLAM                                * 505CB
          10GETLAM                               * 505D0
          getxpos                                * 505D5
          OBJ_506C2                              * 505DA
        ;                                        * 505DF

* refs (9): 46CD9 4CB7C 4F43F 4F638 4F651 505D5 ...
getxpos:
        CON(5)  (*)+5                            * 505E4  primitive code object
        ASSEMBLE
        GOSUB   SUB_5064F                        * 505E9
        GOSBVL  RADDF                            * 505ED
L_505F4:
        ?A=0    S                                * 505F4
        GOYES   L_5061F                          * 505F7
        C=0     W                                * 505F9
        P=      14                               * 505FC
        LC(1)   #1                               * 505FE
        D=C     W                                * 50601
        C=C-1   A                                * 50604
        GOSBVL  RADDF                            * 50606
        GOSBVL  PACK                             * 5060D
        A=-A-1  S                                * 50614
        SETHEX                                   * 50617
        C=0     A                                * 50619
        GOTO    L_5062C                          * 5061B
L_5061F:
        GOSBVL  PACK                             * 5061F
        SETHEX                                   * 50626
        C=0     A                                * 50628
        C=C+1   A                                * 5062A
L_5062C:
        R0=C.F  A                                * 5062C
        R1=A                                     * 50632
        GOSBVL  PUSH#                            * 50635
        GOSBVL  SAVPTR                           * 5063C
        SETDEC                                   * 50643
        A=R1                                     * 50645
        GOVLNG  L_18CF6                          * 50648

* refs (2): 505E9 506B0
SUB_5064F:
        GOSBVL  SUB_2A0B1                        * 5064F
        R4=A                                     * 50656
        A=B     W                                * 50659
        R3=A                                     * 5065C
        SETHEX                                   * 5065F
        RSTK=C                                   * 50661
        C=D     A                                * 50663
        RSTK=C                                   * 50665
        GOSBVL  GETPTR                           * 50667
        GOSBVL  POP1%SPLITA                      * 5066E
        C=RSTK                                   * 50675
        D=C     A                                * 50677
        C=RSTK                                   * 50679
        GOSBVL  MULTF                            * 5067B
        C=R3                                     * 50682
        D=C     W                                * 50685
        C=R4                                     * 50688
        RTN                                      * 5068B
        RPL

* refs (9): 48A67 4C1B6 4C364 4C436 4C819 4C891 ...
GETYPOS:
        ::                                       * 5068D
          5GETLAM                                * 50692
          9GETLAM                                * 50697
          getypos                                * 5069C
          OBJ_506C2                              * 506A1
        ;                                        * 506A6

* refs (9): 46D33 4CBF9 4F42B 4F601 4F61A 5069C ...
getypos:
        CON(5)  (*)+5                            * 506AB  primitive code object
        ASSEMBLE
        GOSUB   SUB_5064F                        * 506B0
        A=-A-1  S                                * 506B4
        GOSBVL  RADDF                            * 506B7
        GOTO    L_505F4                          * 506BE

* refs (15): 4F444 4F44E 4F606 4F61F 4F63D 4F656 ...
OBJ_506C2:
        CON(5)  (*)+5                            * 506C2  primitive code object
        GOSBVL  POP2#                            * 506C7
        CAEX    A                                * 506CE
        R1=C.F  A                                * 506D0
        LC(5)   #7FFFF                           * 506D6
        ?C>=A   A                                * 506DD
        GOYES   L_506E4                          * 506E0
        A=C     A                                * 506E2
L_506E4:
        C=R1.F  A                                * 506E4
        ?C#0    A                                * 506EA
        GOYES   L_506F6                          * 506ED
        C=0     W                                * 506EF
        C=C-A   A                                * 506F2
        A=C     A                                * 506F4
L_506F6:
        GOSBVL  SAVPTR                           * 506F6
        GOTO    L_50721                          * 506FD

* refs (4): 4E365 515BE 516BD 6FCEC
RclRowMenu:
        CON(5)  (*)+5                            * 50701  primitive code object
        GOSBVL  SAVPTR                           * 50706
        D0=(5)  LINECOUNTg                       * 5070D
        A=0     A                                * 50714
        A=DAT0  B                                * 50716
        LC(2)   #3F                              * 50719
        A=A&C   B                                * 5071D
L_50721:
        R0=A                                     * 50721
        GOVLNG  PUSH#LOOP                        * 50724
        RPL

* #x1 #y1 #x2 #y2 ->
* refs (12): 4832D 48373 483A5 483D2 48404 48648 ...
TOGGLELINE#3:
        ::                                       * 5072B
          OutOfPICT(4s)?                         * 50730
          NOTcase                                * 50735
          TOGLINE3                               * 5073A
          ChkPictLine(4s)                        * 5073F
          OutOfPICT(4s)?                         * 50744
          DROP                                   * 50749
          TOGLINE3                               * 5074E
        ;                                        * 50753

* #x1 #y1 #x2 #y2 ->
* refs (13): 45272 4549D 48B0C 4C2BF 4E59B 4E5AF ...
DRAWLINE#3:
        ::                                       * 50758
          OutOfPICT(4s)?                         * 5075D
          NOTcase                                * 50762
          LINEON3                                * 50767
          ChkPictLine(4s)                        * 5076C
          OutOfPICT(4s)?                         * 50771
          DROP                                   * 50776
          LINEON3                                * 5077B
        ;                                        * 50780

* refs (4): 50730 50744 5075D 50771
OutOfPICT(4s)?:
        CON(5)  (*)+5                            * 50785  primitive code object
        ASSEMBLE
        GOSUB   SUB_508BF                        * 5078A
        ST=0    2                                * 5078E
        ST=0    1                                * 50791
        A=A+A   A                                * 50794
        GONC    L_5079F                          * 50796
        ST=1    2                                * 50799
        ST=1    1                                * 5079C
L_5079F:
        A=R3                                     * 5079F
        A=A+A   A                                * 507A2
        GONC    L_507AF                          * 507A4
        ?ST=1   1                                * 507A7
        GOYES   L_507CD                          * 507AA
        ST=1    2                                * 507AC
L_507AF:
        ST=0    1                                * 507AF
        A=R2                                     * 507B2
        A=A+A   A                                * 507B5
        GONC    L_507C0                          * 507B7
        ST=1    2                                * 507BA
        ST=1    1                                * 507BD
L_507C0:
        A=R4                                     * 507C0
        A=A+A   A                                * 507C3
        GONC    L_507E5                          * 507C5
        ?ST=0   1                                * 507C8
        GOYES   L_507E2                          * 507CB
L_507CD:
        GOSBVL  GETPTR                           * 507CD
        LA(5)   SEMI                             * 507D4
        PC=(A)                                   * 507DE
L_507E2:
        ST=1    2                                * 507E2
L_507E5:
        ST=0    1                                * 507E5
        LC(5)   CMOS                             * 507E8
        B=C     A                                * 507EF
        LC(5)   GDISP                            * 507F1
        D0=C                                     * 507F8
        C=DAT0  A                                * 507FB
        D0=C                                     * 507FE
        D0=D0+  10                               * 50801
        C=DAT0  A                                * 50804
        C=C+B   A                                * 50807
        A=R4                                     * 50809
        A=A+B   A                                * 5080C
        ?C>A    A                                * 5080E
        GOYES   L_50819                          * 50811
        ST=1    2                                * 50813
        ST=1    1                                * 50816
L_50819:
        A=R2                                     * 50819
        A=A+B   A                                * 5081C
        ?C>A    A                                * 5081E
        GOYES   L_5082B                          * 50821
        ?ST=1   1                                * 50823
        GOYES   L_507CD                          * 50826
        ST=1    2                                * 50828
L_5082B:
        ST=0    1                                * 5082B
        D0=D0+  5                                * 5082E
        C=DAT0  A                                * 50831
        C=C+B   A                                * 50834
        A=R1                                     * 50836
        A=A+B   A                                * 50839
        R0=A                                     * 5083B
        ?C>A    A                                * 5083E
        GOYES   L_50849                          * 50841
        ST=1    2                                * 50843
        ST=1    1                                * 50846
L_50849:
        A=R3                                     * 50849
        A=A+B   A                                * 5084C
        ?C>A    A                                * 5084E
        GOYES   L_5085F                          * 50851
        ?ST=0   1                                * 50853
        GOYES   L_5085C                          * 50856
        GOTO    L_507CD                          * 50858
L_5085C:
        ST=1    2                                * 5085C
L_5085F:
        C=R0                                     * 5085F
        ?C<A    A                                * 50862
        GOYES   L_5087F                          * 50865
        A=R1                                     * 50867
        C=R3                                     * 5086A
        R1=C                                     * 5086D
        R3=A                                     * 50870
        A=R4                                     * 50873
        C=R2                                     * 50876
        R2=A                                     * 50879
        R4=C                                     * 5087C
L_5087F:
        A=R1                                     * 5087F
        R0=A                                     * 50882
        A=R2                                     * 50885
        R1=A                                     * 50888
        GOSBVL  PUSH2#                           * 5088B
        GOSBVL  SAVPTR                           * 50892
        A=R3                                     * 50899
        R0=A                                     * 5089C
        A=R4                                     * 5089F
        R1=A                                     * 508A2
        GOSBVL  PUSH2#                           * 508A5
        ?ST=1   2                                * 508AC
        GOYES   L_508B8                          * 508AF
        GOVLNG  PushFLoop                        * 508B1
L_508B8:
        GOVLNG  PushTLoop                        * 508B8

* refs (2): 5078A 50B28
SUB_508BF:
        GOSBVL  POP2#                            * 508BF
        R4=C                                     * 508C6
        R3=A                                     * 508C9
        GOSBVL  POP2#                            * 508CC
        R2=C                                     * 508D3
        R1=A                                     * 508D6
        GOSBVL  SAVPTR                           * 508D9
        RTN                                      * 508E0
        RPL

* refs (2): 5073F 5076C
ChkPictLine(4s):
        ::                                       * 508E2
          BINT4                                  * 508E7
          ZERO_DO                                * 508EC
          s=>ñr                                  * 508F1
          4ROLL                                  * 508F6
          LOOP                                   * 508FB
          3PICKOVER                              * 50900
          dist(2r)                               * 50905
          5PICK                                  * 5090A
          4PICK                                  * 5090F
          dist(2r)                               * 50914
          %<                                     * 50919
          ITE                                    * 5091E

Reverse4;true:
          ::                                     * 50923
            SWAPROT                              * 50928
            4ROLL                                * 5092D
            TRUE                                 * 50932
          ;                                      * 50937
          FALSE                                  * 5093C
          5UNROLL                                * 50941
          DUP                                    * 50946
          4PICK                                  * 5094B
          %-                                     * 50950
          DUP                                    * 50955
          %ABS                                   * 5095A
          6UNROLL                                * 5095F
          %0>                                    * 50964
          DUP                                    * 50969
          8UNROLL                                * 5096E
          IT                                     * 50973
          2SWAP                                  * 50978
          3PICK3PICK                             * 5097D
          %*                                     * 50982
          OVER                                   * 50987
          6PICK                                  * 5098C
          %*                                     * 50991
          %-                                     * 50996
          6PICK                                  * 5099B
          %/                                     * 509A0
          GBUFFGROBDIM                           * 509A5
          BINT9                                  * 509AA
          PICK                                   * 509AF
          IT                                     * 509B4
          SWAP                                   * 509B9
          DROP                                   * 509BE
          #1-                                    * 509C3
          UNCOERCE                               * 509C8
          5PICK                                  * 509CD
          OVER                                   * 509D2
          %>                                     * 509D7
          ITE                                    * 509DC
          ::                                     * 509E1
            5ROLLDROP                            * 509E6
            5ROLL                                * 509EB
            5PICK                                * 509F0
            %-                                   * 509F5
            6PICK                                * 509FA
            %/                                   * 509FF
            OVER                                 * 50A04
            6UNROLL                              * 50A09
            %*                                   * 50A0E
            OVER                                 * 50A13
            %+                                   * 50A18
            5UNROLL                              * 50A1D
          ;                                      * 50A22
          DROP                                   * 50A27
          OVER                                   * 50A2C
          %0<                                    * 50A31
          ITE                                    * 50A36

* 1 2 3 -> 3 %0
UNROT2DROP%0:
          ::                                     * 50A3B
            ROTROT2DROP                          * 50A40
            %0_2A2B4                             * 50A45
          ;                                      * 50A4A
          DROP                                   * 50A4F
          5ROLLDROP                              * 50A54
          5ROLL                                  * 50A59
          IT                                     * 50A5E

swap(1,3);4roll:
          ::                                     * 50A63
            SWAPROT                              * 50A68
            4ROLL                                * 50A6D
          ;                                      * 50A72
          BINT4                                  * 50A77
          ZERO_DO                                * 50A7C
          BINT1                                  * 50A81
          OVER                                   * 50A86
          %0<                                    * 50A8B
          IT                                     * 50A90
          DROPZERO                               * 50A95
          SWAP                                   * 50A9A
          %ABS                                   * 50A9F
          COERCE                                 * 50AA4
          OBJ_506C2                              * 50AA9
          4ROLL                                  * 50AAE
          LOOP                                   * 50AB3
          5ROLL                                  * 50AB8
          NOT?SEMI                               * 50ABD
          2SWAP                                  * 50AC2
        ;                                        * 50AC7

* #x1 #y1 #x2 #y2 ->
LINEOFF3:
        CON(5)  (*)+5                            * 50ACC  primitive code object
        ASSEMBLE
        ST=1    0                                * 50AD1
        ST=0    1                                * 50AD4
        GOTO    L_50B22                          * 50AD7

* #x1 #y1 #x2 #y2 ->
* refs (2): 5073A 5074E
TOGLINE3:
        CON(5)  (*)+5                            * 50ADB  primitive code object
        ST=1    4                                * 50AE0
        ST=0    1                                * 50AE3
        GOTO    L_50B25                          * 50AE6

* #x1 #y1 #x2 #y2 ->
* refs (2): 50767 5077B
LINEON3:
        CON(5)  (*)+5                            * 50AEA  primitive code object
        ST=0    0                                * 50AEF
        ST=0    1                                * 50AF2
        GOTO    L_50B22                          * 50AF5

* #x1 #y1 #x2 #y2 ->
TOGLINE:
        CON(5)  (*)+5                            * 50AF9  primitive code object
        ST=1    4                                * 50AFE
        ST=1    1                                * 50B01
        GOTO    L_50B25                          * 50B04

* #x1 #y1 #x2 #y2 ->
LINEOFF:
        CON(5)  (*)+5                            * 50B08  primitive code object
        ST=1    0                                * 50B0D
        ST=1    1                                * 50B10
        GOTO    L_50B22                          * 50B13

* #x1 #y1 #x2 #y2 ->
* refs (9): BBAEC BBB00 BBB0F BBB23 BBB4B BBB69 ...
LINEON:
        CON(5)  (*)+5                            * 50B17  primitive code object
        ST=0    0                                * 50B1C
        ST=1    1                                * 50B1F
L_50B22:
        ST=0    4                                * 50B22
L_50B25:
        ST=0    5                                * 50B25
        GOSUB   SUB_508BF                        * 50B28
        A=R2                                     * 50B2C
        ST=0    2                                * 50B2F
        LC(5)   #7FFFF                           * 50B32
        ?C<A    A                                * 50B39
        GOYES   L_50B4D                          * 50B3C
        A=R4                                     * 50B3E
        ?C<A    A                                * 50B41
        GOYES   L_50B54                          * 50B44
        A=R2                                     * 50B46
        GOTO    L_50B5E                          * 50B49
L_50B4D:
        C=R4                                     * 50B4D
        GOTO    L_50B6B                          * 50B50
L_50B54:
        C=R2                                     * 50B54
        ST=1    2                                * 50B57
        GOTO    L_50B6B                          * 50B5A
L_50B5E:
        C=R4                                     * 50B5E
        ?C>=A   A                                * 50B61
        GOYES   L_50B6B                          * 50B64
        ST=1    2                                * 50B66
        CAEX    A                                * 50B69
L_50B6B:
        C=C-A   A                                * 50B6B
        R4=C                                     * 50B6D
        A=R1                                     * 50B70
        C=R3                                     * 50B73
        C=C-A   A                                * 50B76
        R3=C                                     * 50B78
        A=R4                                     * 50B7B
        ST=0    3                                * 50B7E
        ?C>=A   A                                * 50B81
        GOYES   L_50B89                          * 50B84
        ST=1    3                                * 50B86
L_50B89:
        ?ST=0   3                                * 50B89
        GOYES   L_50B90                          * 50B8C
        CAEX    A                                * 50B8E
L_50B90:
        A=A+A   A                                * 50B90
        R0=A                                     * 50B92
        A=A-C   A                                * 50B95
        B=A     A                                * 50B97
        A=R4                                     * 50B99
        C=R3                                     * 50B9C
        ?ST=0   3                                * 50B9F
        GOYES   L_50BA6                          * 50BA2
        CAEX    A                                * 50BA4
L_50BA6:
        D=C     A                                * 50BA6
        A=A-C   A                                * 50BA8
        A=A+A   A                                * 50BAA
        R3=A                                     * 50BAC
        A=B     A                                * 50BAF
        R4=A                                     * 50BB1
        C=R0                                     * 50BB4
        RSTK=C                                   * 50BB7
L_50BB9:
        C=R2                                     * 50BB9
        R0=C                                     * 50BBC
        A=R1                                     * 50BBF
        C=D     A                                * 50BC2
        RSTK=C                                   * 50BC4
        ?ST=0   1                                * 50BC6
        GOYES   L_50BD6                          * 50BC9
        D1=(5)  ADISP                            * 50BCB
        GOTO    L_50BDD                          * 50BD2
L_50BD6:
        D1=(5)  GDISP                            * 50BD6
L_50BDD:
        GOSUB   SUB_50CD7                        * 50BDD
        GOC     L_50C10                          * 50BE1
        ST=1    5                                * 50BE4
        GOSBVL  GETPIX3                          * 50BE7
        ?ST=0   4                                * 50BEE
        GOYES   L_50C05                          * 50BF1
        ST=0    0                                * 50BF3
        C=A     P                                * 50BF6
        C=C&B   P                                * 50BF9
        ?C=0    P                                * 50BFD
        GOYES   L_50C05                          * 50C00
        ST=1    0                                * 50C02
L_50C05:
        GOSBVL  pixon2                           * 50C05
        GOTO    L_50C19                          * 50C0C
L_50C10:
        ?ST=0   5                                * 50C10
        GOYES   L_50C19                          * 50C13
        GOTO    L_50CD0                          * 50C15
L_50C19:
        D0=(5)  ATTNFLG                          * 50C19
        C=DAT0  A                                * 50C20
        ?C=0    A                                * 50C23
        GOYES   L_50C2C                          * 50C26
        GOTO    L_50CD0                          * 50C28
L_50C2C:
        C=RSTK                                   * 50C2C
        D=C     A                                * 50C2E
        C=R4.F  A                                * 50C30
        C=C+C   A                                * 50C36
        GOC     L_50C83                          * 50C38
        ?ST=1   3                                * 50C3B
        GOYES   L_50C51                          * 50C3E
        C=R2.F  A                                * 50C40
        ?ST=0   2                                * 50C46
        GOYES   L_50C63                          * 50C49
        C=C-1   A                                * 50C4B
        GOTO    L_50C65                          * 50C4D
L_50C51:
        C=R1.F  A                                * 50C51
        C=C+1   A                                * 50C57
        R1=C.F  A                                * 50C59
        GOTO    L_50C6B                          * 50C5F
L_50C63:
        C=C+1   A                                * 50C63
L_50C65:
        R2=C.F  A                                * 50C65
L_50C6B:
        C=R4.F  A                                * 50C6B
        A=R3.F  A                                * 50C71
        C=C+A   A                                * 50C77
        R4=C.F  A                                * 50C79
        GOTO    L_50C95                          * 50C7F
L_50C83:
        A=R4.F  A                                * 50C83
        C=RSTK                                   * 50C89
        RSTK=C                                   * 50C8B
        A=A+C   A                                * 50C8D
        R4=A.F  A                                * 50C8F
L_50C95:
        ?ST=0   3                                * 50C95
        GOYES   L_50CB7                          * 50C98
        C=R2.F  A                                * 50C9A
        ?ST=0   2                                * 50CA0
        GOYES   L_50CAB                          * 50CA3
        C=C-1   A                                * 50CA5
        GOTO    L_50CAD                          * 50CA7
L_50CAB:
        C=C+1   A                                * 50CAB
L_50CAD:
        R2=C.F  A                                * 50CAD
        GOTO    L_50CC5                          * 50CB3
L_50CB7:
        C=R1.F  A                                * 50CB7
        C=C+1   A                                * 50CBD
        R1=C.F  A                                * 50CBF
L_50CC5:
        D=D-1   A                                * 50CC5
        GOC     L_50CD0                          * 50CC7
        GOLONG  L_50BB9                          * 50CCA
L_50CD0:
        GOVLNG  GETPTRLOOP                       * 50CD0

* refs (1): 50BDD
SUB_50CD7:
        C=DAT1  A                                * 50CD7
        D1=C                                     * 50CDA
        D1=D1+  15                               * 50CDD
        C=DAT1  A                                * 50CE0
        C=C-1   A                                * 50CE3
        C=C-A   A                                * 50CE5
        RTNC                                     * 50CE7
        D1=D1-  5                                * 50CEA
        C=DAT1  A                                * 50CED
        C=C-1   A                                * 50CF0
        AR0EX.F A                                * 50CF2
        C=C-A   A                                * 50CF8
        AR0EX.F A                                * 50CFA
        RTN                                      * 50D00
        RPL

* refs (3): 4B74C 4BCB5 4C4E5
OBJ_50D02:
        ::                                       * 50D02
          INDEX@                                 * 50D07
          #1+                                    * 50D0C
          GetEqN                                 * 50D11
          NOTcase                                * 50D16
          ERRJMP                                 * 50D1B
        ;                                        * 50D20

        ::                                       * 50D25
          BINT8                                  * 50D2A
          BINT50                                 * 50D2F
          MAKEGROB                               * 50D34

{Π'PlotEnv}:
          {                                      * 50D39

* refs (1): 8D1EC
Π'PlotEnv_50D3E:
            LAM     'PlotEnv                     * 50D3E
          }                                      * 50D55
          BIND                                   * 50D5A
          BINT18                                 * 50D5F
          '                                      * 50D64
          nohalt                                 * 50D69
          CACHE                                  * 50D6E
        ;                                        * 50D73

* refs (3): 4BC60 4C143 4C512
LASTPT?:
        ::                                       * 50D78
          15GETLAM                               * 50D7D
          16GETLAM                               * 50D82
          %<                                     * 50D87
          NOTcase                                * 50D8C
          TRUE                                   * 50D91
          ATTNFLG@                               * 50D96
          #0<>                                   * 50D9B
        ;                                        * 50DA0

* refs (3): 4BC6A 4C14D 4C51C
PlotOneMore?:
        ::                                       * 50DA5
          ATTNFLG@                               * 50DAA
          #0=                                    * 50DAF
          15GETLAM                               * 50DB4
          16GETLAM                               * 50DB9
          %=                                     * 50DBE
          AND                                    * 50DC3
        ;                                        * 50DC8

* refs (2): 4B76A 50E09
StatPlotMo:
        ::                                       * 50DCD
          GETPTYPE                               * 50DD2
          DUP                                    * 50DD7
          'IDSCATTER                             * 50DDC
          EQOVER                                 * 50DE1
          'IDHISTOGRAM                           * 50DE6
          EQOR                                   * 50DEB
          SWAP                                   * 50DF0
          'IDBAR                                 * 50DF5
          EQOR                                   * 50DFA
        ;                                        * 50DFF

* refs (1): 4E780
LookForEQ/äDAT:
        ::                                       * 50E04
          StatPlotMo                             * 50E09
          DUP                                    * 50E0E
          ITE                                    * 50E13
          STATRCL                                * 50E18
          EQUATION                               * 50E1D
          case2DROP                              * 50E22
          RDROP                                  * 50E27
          ITE                                    * 50E2C
          OBJ_50E4F                              * 50E31
          OBJ_50E45                              * 50E36
          OBJ_6BC2D                              * 50E3B
        ;                                        * 50E40

* refs (1): 50E36
OBJ_50E45:
        #       104                              * 50E45  260

* refs (1): 50E31
OBJ_50E4F:
        #       602                              * 50E4F  1538

* refs (6): 470DA 4821A 4846D 4D74A 4DDA0 4DE13
!#1+IF<dim-1:
        CON(5)  (*)+5                            * 50E59  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 50E5E
        R1=A.F  A                                * 50E65
        GOSUB   SUB_50E94                        * 50E6B
        C=R1.F  A                                * 50E6F
        ?C<=A   A                                * 50E75
        GOYES   L_50E7C                          * 50E78
        A=A+1   A                                * 50E7A
L_50E7C:
        D=D+1   A                                * 50E7C
        DAT1=A  A                                * 50E7E
        C=R0                                     * 50E81
        D1=C                                     * 50E84
        D1=D1+  5                                * 50E87
        A=DAT0  A                                * 50E8A
        D0=D0+  5                                * 50E8D
        PC=(A)                                   * 50E90

* refs (2): 50E6B 50EAA
SUB_50E94:
        C=DAT1  A                                * 50E94
        CD1EX                                    * 50E97
        R0=C                                     * 50E9A
        D1=D1+  5                                * 50E9D
        A=DAT1  A                                * 50EA0
        RTN                                      * 50EA3

* refs (6): 47107 4826A 48855 4D42A 4DD14 4DDD7
!#1-IF>0:
        CON(5)  (*)+5                            * 50EA5  primitive code object
        GOSUB   SUB_50E94                        * 50EAA
        A=A-1   A                                * 50EAE
        GONC    L_50E7C                          * 50EB0
        A=0     A                                * 50EB3
        GOTO    L_50E7C                          * 50EB5
        NIBHEX  00                               * 50EB9  .
        RPL

* refs (1): 3E8E1
OBJ_50EBB:
        ::                                       * 50EBB
          3GETLAM                                * 50EC0
          #1=                                    * 50EC5
        ;                                        * 50ECA

* refs (1): 3E76B
OBJ_50ECF:
        ::                                       * 50ECF
          CHECKMENU                              * 50ED4
          OBJ_50EE3                              * 50ED9
        ;                                        * 50EDE

* refs (2): 4D8D0 50ED9
OBJ_50EE3:
        ::                                       * 50EE3
          TakeOver                               * 50EE8
          OBJ_4E6C7                              * 50EED
          BINT32                                 * 50EF2
          OBJ_50F2E                              * 50EF7
          ITE                                    * 50EFC
          ClrSysFlag                             * 50F01
          SetSysFlag                             * 50F06
          OBJ_5102B                              * 50F0B
          MENUOFF?                               * 50F10
          OR                                     * 50F15
          ?SKIP                                  * 50F1A
          DispMenu                               * 50F1F
          CROSSMARKON                            * 50F24
        ;                                        * 50F29

* refs (4): 3E761 484E0 4DB27 50EF7
OBJ_50F2E:
        ::                                       * 50F2E
          BINT32                                 * 50F33
          TestSysFlag                            * 50F38
        ;                                        * 50F3D

* refs (1): 49E2A
OBJ_50F42:
        ::                                       * 50F42
          BINT3                                  * 50F47
          SWAP                                   * 50F4C
          INNERDUP                               * 50F51
          ONE_EQ                                 * 50F56
          NOTcase                                * 50F5B

* ob meta -> F
dropDROPf:
          ::                                     * 50F60
            NDROP                                * 50F65
            DROPFALSE                            * 50F6A
          ;                                      * 50F6F
          DROP                                   * 50F74
          'IDPAR                                 * 50F79
          OBJ_4735A                              * 50F7E
          ITE                                    * 50F83
          ::                                     * 50F88
            DROP                                 * 50F8D
            CHECKPVARS                           * 50F92
            ROT                                  * 50F97
            NTHCOMDDUP                           * 50F9C
            TYPELIST?                            * 50FA1
            ?CARCOMP                             * 50FA6
          ;                                      * 50FAB
          ::                                     * 50FB0
            SWAP                                 * 50FB5
            #3=                                  * 50FBA
            ITE                                  * 50FBF

~X:
            ::                                   * 50FC4
              '                                  * 50FC9

X_50FCE:
              ID      X                          * 50FCE
            ;                                    * 50FD7

~Y:
            ::                                   * 50FDC
              '                                  * 50FE1

Y:
              ID      Y                          * 50FE6
            ;                                    * 50FEF
          ;                                      * 50FF4
          EQUAL                                  * 50FF9
        ;                                        * 50FFE

* refs (1): 49E34
OBJ_51003:
        ::                                       * 51003
          OVER                                   * 51008
          INCOMPDROP                             * 5100D
          OVER                                   * 51012
          FINDVAR                                * 51017
          NTHOF                                  * 5101C
          #0=                                    * 51021
        ;                                        * 51026

* refs (19): 0C839 0C866 46C2F 46C8E 46E37 46E64 ...
OBJ_5102B:
        ::                                       * 5102B
          16GETLAM                               * 51030
          #1=                                    * 51035
        ;                                        * 5103A

* refs (12): 451D7 4AF81 4AFBD 4B01C 4B044 4B080 ...
PutBackPPAR(_,s):
        ::                                       * 5103F
          Chk&BreakPPAR                          * 51044
          8PICK                                  * 51049
          ROLLDROP                               * 5104E
          8ROLL                                  * 51053
          8ROLL                                  * 51058
          UNROLL                                 * 5105D
          StoInPPAR(7_)                          * 51062
        ;                                        * 51067

* refs (2): 4AB62 51062
StoInPPAR(7_):
        ::                                       * 5106C
          BINT7                                  * 51071
          {}N                                    * 51076
          'IDPAR                                 * 5107B
          STOAPPLDATA                            * 51080
        ;                                        * 51085
        NIBHEX  00000                            * 5108A  ..

* refs (2): 4CEDD 4D961
OBJ_5108F:
        ::                                       * 5108F
          ClrDAsOK                               * 51094
          ExitFcn                                * 51099
          ABND                                   * 5109E
          COLA_EVAL                              * 510A3
        ;                                        * 510A8

* -> id
* refs (21): 471DD 47683 4817A 48A35 48CBF 49BAA ...
INDEPVAR:
        ::                                       * 510AD
          GETINDEP                               * 510B2
          1get(li)?                              * 510B7
        ;                                        * 510BC

* refs (19): 47422 4D975 4E90B 510B7 A3A5E A3A78 ...
1get(li)?:
        ::                                       * 510C1
          DUPTYPELIST?                           * 510C6
          ?CARCOMP                               * 510CB
        ;                                        * 510D0

* refs (6): 46C7F 47C09 4A07D 4E762 4EC21 4EC3F
RECORDX&YC%:
        ::                                       * 510D5
          8GETLAM                                * 510DA
          UNCOERCE%%                             * 510DF
          6GETLAM                                * 510E4
          %%-                                    * 510E9
          10GETLAM                               * 510EE
          %%/>%                                  * 510F3
          7GETLAM                                * 510F8
          UNCOERCE%%                             * 510FD
          5GETLAM                                * 51102
          SWAP                                   * 51107
          %%-                                    * 5110C
          9GETLAM                                * 51111
          %%/>%                                  * 51116
          %>C%                                   * 5111B
        ;                                        * 51120

* ->
* refs (4): 2DA72 4E730 73B66 8C695
CLEARMENU:
        ::                                       * 51125
          HARDBUFF2                              * 5112A
          ZEROZERO                               * 5112F
          BINT131                                * 51134
          BINT8                                  * 51139
          GROB!ZERODRP                           * 5113E
        ;                                        * 51143

* xPICT ->
* refs (7): 20CB2 20F8F 4F381 4F74B 4FA39 4FC00 ...
CKPICT:
        ::                                       * 51148
          '                                      * 5114D
          xPICT                                  * 51152
          EQUALNOTcase                           * 51157
          SETTYPEERR                             * 5115C
        ;                                        * 51161

* ->
* refs (23): 4C48B 4CF0A 4E2C0 4E88E 4F057 4F3B8 ...
CHECKPICT:
        ::                                       * 51166
          GBUFF                                  * 5116B
          DUPGROBDIM                             * 51170
          2DUP                                   * 51175
          2#0=OR                                 * 5117A
          case                                   * 5117F
          ::                                     * 51184
            3DROP                                * 51189
            BINT64                               * 5118E
            BINT131                              * 51193
            MAKEGROB                             * 51198
            GROB>GDISP                           * 5119D
          ;                                      * 511A2
          BINT131                                * 511A7
          OVER#>                                 * 511AC
          ITE                                    * 511B1
          ::                                     * 511B6
            BINT131                              * 511BB
            SWAP#-                               * 511C0
            3PICKSWAP                            * 511C5
            BROADENGROB                          * 511CA
          ;                                      * 511CF
          DROP                                   * 511D4
          CHECKHEIGHT                            * 511D9
        ;                                        * 511DE

* grob #height ->
* refs (2): 4E2DE 511D9
CHECKHEIGHT:
        ::                                       * 511E3
          BINT64                                 * 511E8
          OVER#>                                 * 511ED
          NOTcase2DROP                           * 511F2
          BINT64                                 * 511F7
          SWAP#-                                 * 511FC
          HEIGHTENGROB                           * 51201
        ;                                        * 51206

* refs (16): 49F2E 49F6F 49FAB 4AC39 4AC6B 4ADB5 ...
RclMaxStdPict:
        ::                                       * 5120B
          GBUFFGROBDIM                           * 51210
          OBJ_5121F                              * 51215
        ;                                        * 5121A

* refs (2): 4B34B 51215
OBJ_5121F:
        ::                                       * 5121F
          DUP                                    * 51224
          BINT131                                * 51229
          #<                                     * 5122E
          IT                                     * 51233

drop;<83>:
          ::                                     * 51238
            DROP                                 * 5123D
            BINT131                              * 51242
          ;                                      * 51247
          SWAPDUP                                * 5124C
          BINT64                                 * 51251
          #<                                     * 51256
          IT                                     * 5125B

drop;<40>:
          ::                                     * 51260
            DROP                                 * 51265
            BINT64                               * 5126A
          ;                                      * 5126F
          SWAP                                   * 51274
        ;                                        * 51279

* -> id
* refs (8): 473EB 4968C 4AA41 4AAAE 4AB67 4EEEC ...
'IDPAR:
        ::                                       * 5127E
          '                                      * 51283

PPAR:
          ID      PPAR                           * 51288
        ;                                        * 51297

* -> xFUNCTION
* refs (10): 45EEC 481AC 48FC7 490E4 4AB4F 4ABD5 ...
'IDFUNCTION:
        ::                                       * 5129C
          '                                      * 512A1
          xFUNCTION                              * 512A6
        ;                                        * 512AB

* -> xCONIC
* refs (2): 8C932 B59FD
'IDCONIC:
        ::                                       * 512B0
          '                                      * 512B5
          xCONIC                                 * 512BA
        ;                                        * 512BF

* -> xPOLAR
* refs (4): 49071 4A91E 8CA07 B59D5
'IDPOLAR:
        ::                                       * 512C4
          '                                      * 512C9
          POLAR                                  * 512CE
        ;                                        * 512D3

* -> xPARAMETRIC
* refs (6): 48F54 4909E 8A108 8AC57 8CB4B B5A4D
'IDPARAMETER:
        ::                                       * 512D8
          '                                      * 512DD
          xPARAMETRIC                            * 512E2
        ;                                        * 512E7

* -> xTRUTH
* refs (2): 8CC89 B5A25
'IDTRUTH:
        ::                                       * 512EC
          '                                      * 512F1
          xTRUTH                                 * 512F6
        ;                                        * 512FB

* -> xSCATTER
* refs (5): 0C7D0 20196 50DDC 8CD5E B5AF8
'IDSCATTER:
        ::                                       * 51300
          '                                      * 51305
          xSCATTER                               * 5130A
        ;                                        * 5130F

* -> xHISTOGRAM
* refs (4): 20171 50DE6 8CE42 B5AA8
'IDHISTOGRAM:
        ::                                       * 51314
          '                                      * 51319
          xHISTOGRAM                             * 5131E
        ;                                        * 51323

* -> xBAR
* refs (4): 2013D 50DF5 8CF30 B5AD0
'IDBAR:
        ::                                       * 51328
          '                                      * 5132D
          xBAR                                   * 51332
        ;                                        * 51337

* refs (2): 4C3A0 4CDF7
PtoR:
        ::                                       * 5133C
          %POL>%REC                              * 51341
          SWAP                                   * 51346
          GETXPOS                                * 5134B
          SWAP                                   * 51350
          GETYPOS                                * 51355
        ;                                        * 5135A

* refs (11): 489B8 489D6 4B6CF 4BF26 4C189 4EE01 ...
OBJ_5135F:
        ::                                       * 5135F
          ERRSET                                 * 51364
          EVALCRUNCH                             * 51369
          ERRTRAP                                * 5136E
          ::                                     * 51373
            ERROR@                               * 51378
            #       100                          * 5137D  256
            #/                                   * 51387
            SWAPDROP                             * 5138C
            BINT3                                * 51391
            #<>case                              * 51396
            ERRJMP                               * 5139B
            ERRORCLR                             * 513A0
            BINT31                               * 513A5
            TestSysFlag                          * 513AA
            ?SKIP                                * 513AF
            OBJ_4C251                            * 513B4
            2RDROP                               * 513B9
          ;                                      * 513BE
          0LASTOWDOB!                            * 513C3
          CK1NOLASTWD                            * 513C8
          U>nbr                                  * 513CD
        ;                                        * 513D2

* refs (1): 4BD69
OBJ_513D7:
        ::                                       * 513D7
          OBJ_51427                              * 513DC
          NOT?SEMI                               * 513E1
          %1                                     * 513E6
          SWAP                                   * 513EB
          UNROLL                                 * 513F0
          ::N                                    * 513F5
        ;                                        * 513FA

* refs (1): 4BD73
OBJ_513FF:
        ::                                       * 513FF
          OBJ_51427                              * 51404
          NOT?SEMI                               * 51409
          %-1                                    * 5140E
          SWAP                                   * 51413
          UNROLL                                 * 51418
          ::N                                    * 5141D
        ;                                        * 51422

* refs (2): 513DC 51404
OBJ_51427:
        ::                                       * 51427
          DUP'                                   * 5142C

s1:
          ID      s1                             * 51431
          EQUALPOSCOMP                           * 5143C
          DUP#0=case                             * 51441
          FALSE                                  * 51446
          SWAPINCOMP                             * 5144B
          DUPDUP                                 * 51450
          #3+                                    * 51455
          ROLL                                   * 5145A
          #-                                     * 5145F
          #2+                                    * 51464
          DUP#1+                                 * 51469
          ROLLDROP                               * 5146E
          TRUE                                   * 51473
        ;                                        * 51478

* refs (4): 49B8C 49DF8 4B738 514B4
1stArgRpn(ex):
        ::                                       * 5147D
          INNERCOMP                              * 51482
          plDRPpZparg                            * 51487
          NDROP                                  * 5148C
        ;                                        * 51491

* refs (4): 49D9E 49DE9 4B634 4D984
1stArgb(ex):
        ::                                       * 51496
          INNERCOMP                              * 5149B
          plDRPpZparg                            * 514A0
          SWAPUnNDROP                            * 514A5
        ;                                        * 514AA

* refs (8): 476E2 48959 489A9 4903A 49E20 49E9D ...
GETRHS:
        ::                                       * 514AF
          1stArgRpn(ex)                          * 514B4
          ::N                                    * 514B9
        ;                                        * 514BE

* refs (24): 45F7B 45F8F 4AA0A 4AA23 4AA32 4AA3C ...
OBJ_514C3:
        ::                                       * 514C3
          ?SKIP                                  * 514C8
          SETINVPPAR                             * 514CD
        ;                                        * 514D2
        NIBHEX  00000                            * 514D7  ..

* -> 6.28318530718 -> 360. -> 400.
* refs (5): 49085 4A937 4FDDB A89D3 B5444
1REV:
        ::                                       * 514DC
          RAD?                                   * 514E1
          case                                   * 514E6

* 2pi
%2PI:
          %       6.28318530718E0                * 514EB
          DEG?                                   * 51500
          case                                   * 51505
          %360                                   * 5150A
          %400                                   * 5150F
        ;                                        * 51514

* refs (1): 51537
break;<>2?:BAV!:
        ::                                       * 51519
          INNERCOMP                              * 5151E
          #2=                                    * 51523
          NcaseSIZEERR                           * 51528
        ;                                        * 5152D

* { hxs hxs' } -> # #'
* refs (15): 4F03B 4F0B1 4F45D 4F48F 4F4C1 4F557 ...
2HXSLIST?:
        ::                                       * 51532
          break;<>2?:BAV!                        * 51537
          DUP                                    * 5153C
          TYPEHSTR?                              * 51541
          NcaseSIZEERR                           * 51546
          OVER                                   * 5154B
          TYPEHSTR?                              * 51550
          NcaseSIZEERR                           * 51555
          2HXS>#                                 * 5155A
        ;                                        * 5155F

* refs (3): 4F061 4F796 4F9D5
InGrob(2s,go)?#:BAV!:
        ::                                       * 51564
          InGrob(2s,go)?                         * 51569
          NcaseSIZEERR                           * 5156E
        ;                                        * 51573

* refs (3): 4EA50 4F502 51569
InGrob(2s,go)?:
        ::                                       * 51578
          GROBDIM                                * 5157D
          4PICK                                  * 51582
          #>                                     * 51587
          SWAP3PICK                              * 5158C
          #>                                     * 51591
          AND                                    * 51596
        ;                                        * 5159B

* -> #y
* refs (10): 46D47 4D367 515B9 51631 516EF 5170D ...
TOPROW:
        ::                                       * 515A0
          WINDOWCORNER                           * 515A5
          DROP                                   * 515AA
        ;                                        * 515AF

* -> #y
* refs (5): 46D60 49F29 4D682 5164A 6CA30
BOTROW:
        ::                                       * 515B4
          TOPROW                                 * 515B9
          RclRowMenu                             * 515BE
          #+                                     * 515C3
        ;                                        * 515C8

* refs (2): 4F912 4F93F
OBJ_515CD:
        CON(5)  (*)+5                            * 515CD  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 515D2
        A=DAT1  A                                * 515D9
        D1=A                                     * 515DC
        LC(5)   DOGROB                           * 515DF
        DAT1=C  A                                * 515E6
        GOSBVL  GETPTR                           * 515E9
        A=DAT0  A                                * 515F0
        D0=D0+  5                                * 515F3
        PC=(A)                                   * 515F6
        RPL

* -> #x
* refs (12): 46CED 4D48E 51613 51663 5169A 516D6 ...
LEFTCOL:
        ::                                       * 515FA
          WINDOWCORNER                           * 515FF
          SWAPDROP                               * 51604
        ;                                        * 51609

* -> #x
* refs (6): 46D06 49F24 4D58D 5167C 73C49 73CD0
RIGHTCOL:
        ::                                       * 5160E
          LEFTCOL                                * 51613
          BINT131                                * 51618
          #1-                                    * 5161D
          #+                                     * 51622
        ;                                        * 51627

* -> flag
* refs (4): 48242 4D353 4D411 4DCF6
WINDOWTOP?:
        ::                                       * 5162C
          TOPROW                                 * 51631
          7GETLAM                                * 51636
          #=                                     * 5163B
        ;                                        * 51640

* -> flag
* refs (4): 481E3 4D66E 4D72C 4DD7D
WINDOWBOT?:
        ::                                       * 51645
          BOTROW                                 * 5164A
          7GETLAM                                * 5164F
          #=                                     * 51654
        ;                                        * 51659

* -> flag
* refs (4): 470EE 48828 4D47F 4DDB9
WINDOWLEFT?:
        ::                                       * 5165E
          LEFTCOL                                * 51663
          8GETLAM                                * 51668
          #=                                     * 5166D
        ;                                        * 51672

* -> flag
* refs (4): 470BC 48436 4D57E 4DDF0
WINDOWRIGHT?:
        ::                                       * 51677
          RIGHTCOL                               * 5167C
          8GETLAM                                * 51681
          #=                                     * 51686
        ;                                        * 5168B

* ->
* refs (3): 4CFC0 4D35D 9CF8E
JUMPTOP:
        ::                                       * 51690
          TakeOver                               * 51695
          LEFTCOL                                * 5169A
          ZEROSWAP                               * 5169F
          WINDOWXY                               * 516A4
        ;                                        * 516A9

* ->
* refs (3): 4D03D 4D678 9CF9D
JUMPBOT:
        ::                                       * 516AE
          TakeOver                               * 516B3
          HARDHEIGHT                             * 516B8
          RclRowMenu                             * 516BD
          #1+                                    * 516C2
          UNCOERCE2                              * 516C7
          %-                                     * 516CC
          COERCE                                 * 516D1
          LEFTCOL                                * 516D6
          WINDOWXY                               * 516DB
        ;                                        * 516E0

* ->
* refs (3): 4D006 4D489 9CFAC
JUMPLEFT:
        ::                                       * 516E5
          TakeOver                               * 516EA
          TOPROW                                 * 516EF
          BINT0                                  * 516F4
          WINDOWXY                               * 516F9
        ;                                        * 516FE

* ->
* refs (3): 4D074 4D588 9CFBB
JUMPRIGHT:
        ::                                       * 51703
          TakeOver                               * 51708
          TOPROW                                 * 5170D
          HBUFFDIMw                              * 51712
          BINT131                                * 51717
          UNCOERCE2                              * 5171C
          %-                                     * 51721
          COERCE                                 * 51726
          WINDOWXY                               * 5172B
        ;                                        * 51730

* ->
* refs (15): 4B47D 4B49B 4B4B9 4B4D7 BB2BB BB35B ...
REPEATERCH:
        ::                                       * 51735
          'R'R                                   * 5173A
          DUP                                    * 5173F
          EVAL                                   * 51744
          OVER                                   * 51749
          REPKEY?                                * 5174E
          NOTcase2DROP                           * 51753
          BEGIN                                  * 51758
          2DUPSWAP                               * 5175D
          REPKEY?                                * 51762
          WHILE                                  * 51767
          ::                                     * 5176C
            ::                                   * 51771
              OBJ_4DCC6                          * 51776
              EVAL                               * 5177B
            ;                                    * 51780
          ;                                      * 51785
          REPEAT                                 * 5178A
          3DROP                                  * 5178F
        ;                                        * 51794
        NIBHEX  00000                            * 51799  ..

* grob -> grob #height #width
* refs (11): 4DC3F 4E6F9 4EB27 4EB72 4F38B 4F8D6 ...
DUPGROBDIM:
        ::                                       * 5179E
          DUP                                    * 517A3
          GROBDIM                                * 517A8
        ;                                        * 517AD

* refs (29): 0C947 0C9EA 4570D 481F2 48251 48328 ...
OBJ_517B2:
        ::                                       * 517B2
          8GETLAM                                * 517B7
          7GETLAM                                * 517BC
        ;                                        * 517C1

* refs (4): 100DD 107ED 10806 10879
over;=?:drq:
        ::                                       * 517C6
          OVER                                   * 517CB
          EQ                                     * 517D0
          case                                   * 517D5

drop;q:
          ::                                     * 517DA
            DROP                                 * 517DF
            RDROP                                * 517E4
          ;                                      * 517E9
        ;                                        * 517EE

* ob1 ob2 -> :: <ob1> ; ob1 ob2 -> :: ob1 <ob2> <rest> ;
* refs (15): 4A9E2 4A9F1 4F031 50497 504D8 504E7 ...
EQUALcasedrop:
        ::                                       * 517F3
          OVER                                   * 517F8
          EQUAL                                  * 517FD
          case                                   * 51802

drop;dq_51807:
          ::                                     * 51807
            DROP                                 * 5180C
            COLA                                 * 51811
            COLA                                 * 51816
          ;                                      * 5181B
          COLA                                   * 51820
          SKIP                                   * 51825
        ;                                        * 5182A

* -> #
* refs (34): 2D95B 318BD 31A39 31A43 39C34 39D6F ...
ISTOP-INDEX:
        ::                                       * 5182F
          ISTOP@                                 * 51834
          INDEX@#-                               * 51839
        ;                                        * 5183E

* # ob -> #+1 ob
* refs (29): 14A0A 14A5F 170E5 2FE52 39C4D 3A18E ...
SWAP#1+SWAP:
        ::                                       * 51843
          SWAP#1+                                * 51848
          SWAP                                   * 5184D
        ;                                        * 51852

* # ob -> #-1 ob
* refs (8): 573A1 64390 90F37 925B0 92F4D 9326A ...
SWAP#1-SWAP:
        ::                                       * 51857
          SWAP#1-                                * 5185C
          SWAP                                   * 51861
        ;                                        * 51866

* refs (1): 6BF5B
OBJ_5186B:
        ::                                       * 5186B
          DROP                                   * 51870
          DoBadKey                               * 51875
        ;                                        * 5187A

* -> #height #width
* refs (12): 45785 4CD0C 4CF0F 4D1E1 4E79E 4E7B2 ...
GBUFFGROBDIM:
        ::                                       * 5187F
          GBUFF                                  * 51884
          GROBDIM                                * 51889
        ;                                        * 5188E

* #x1 #y1 #x2 #y2 -> #x1' #y1' #x2' #y2'
* refs (4): 45712 4E587 4EBF4 4FB97
ORDERXY#:
        ::                                       * 51893
          4PICK                                  * 51898
          3PICK                                  * 5189D
          #>                                     * 518A2
          IT                                     * 518A7
          2SWAP                                  * 518AC
          3PICKOVER                              * 518B1
          #>                                     * 518B6
          IT                                     * 518BB
          SWAPROT                                * 518C0
        ;                                        * 518C5

* %x1 %y1 %x2 %y2 -> %x1' %y1' %x2' %y2'
* refs (2): 4B215 4E7C1
ORDERXY%:
        ::                                       * 518CA
          4PICK                                  * 518CF
          3PICK                                  * 518D4
          %>                                     * 518D9
          IT                                     * 518DE
          2SWAP                                  * 518E3
          3PICKOVER                              * 518E8
          %>                                     * 518ED
          IT                                     * 518F2
          SWAPROT                                * 518F7
        ;                                        * 518FC

* refs (1): 4A8D8
OBJ_51901:
        ::                                       * 51901
          16PUTLAM                               * 51906
          2SWAP                                  * 5190B
          RclMaxStdPict                          * 51910
          OBJ_4F2CD                              * 51915
          5PUTLAM                                * 5191A
          9PUTLAM                                * 5191F
          6PUTLAM                                * 51924
          10PUTLAM                               * 51929
          OBJ_4B9D6                              * 5192E
        ;                                        * 51933
        NIBHEX  000                              * 51938  .

* (Q%%1,%%0Q)
* refs (3): 37A68 92646 92AAB
C%%1:
        C%%     1E0 0E0                          * 5193B

* (-1,0)
* refs (3): 56511 5B97E 5F28F
C%-1:
        C%      -1E0 0E0                         * 5196A

* ob -> %0
* refs (3): 1C828 368D6 54B23
DROP%0:
        ::                                       * 5198F
          DROP                                   * 51994
          %0_2A2B4                               * 51999
        ;                                        * 5199E

* C% -> %re
* refs (7): 1C7E3 1DF94 4A082 4A941 4A94B 4B116 ...
C>Re%:
        ::                                       * 519A3
          C%>%                                   * 519A8
          DROP                                   * 519AD
        ;                                        * 519B2

* C% -> %im
* refs (2): 1C832 52845
C>Im%:
        ::                                       * 519B7
          C%>%                                   * 519BC
          SWAPDROP                               * 519C1
        ;                                        * 519C6

* C% -> %%re %%im
* refs (19): 37D28 51D8D 51D97 51ED7 51EE1 520DF ...
C%>%%:
        ::                                       * 519CB
          C%>%%SWAP                              * 519D0
          SWAP                                   * 519D5
        ;                                        * 519DA

* C% -> %%im %%re
* refs (1): 519D0
C%>%%SWAP:
        ::                                       * 519DF
          C%>%                                   * 519E4
          %>%%SWAP                               * 519E9
          %>%%                                   * 519EE
        ;                                        * 519F3

* C%% -> C%
* refs (1): 36782
C%%>C%:
        CON(5)  (*)+5                            * 519F8  primitive code object
        ASSEMBLE
        GOSUBL  POPC%%                           * 519FD
        GOTO    L_51A13                          * 51A03

* %%re %%im -> C%
* refs (17): 379D7 51DA1 51E5A 51EF0 520FD 52166 ...
%%>C%:
        CON(5)  (*)+5                            * 51A07  primitive code object
        GOSBVL  SUB_2A0B1                        * 51A0C
L_51A13:
        R3=C                                     * 51A13
        GOSBVL  PACK                             * 51A16
        AR3EX                                    * 51A1D
        C=D     W                                * 51A20
        B=C     W                                * 51A23
        GOSBVL  PACK                             * 51A26
        C=R3                                     * 51A2D
        CAEX    W                                * 51A30
        GOTO    L_51B81                          * 51A33

* %re -> C%
* refs (17): 1B165 1B40E 1B717 1B784 1B88A 1B8ED ...
Re>C%:
        CON(5)  (*)+5                            * 51A37  primitive code object
        GOSBVL  POP1%                            * 51A3C
        C=0     W                                * 51A43
        GOTO    L_51B81                          * 51A46

* C% -> C%'
* refs (6): 52634 5264D 52661 527F0 52822 52859
C%*i:
        CON(5)  (*)+5                            * 51A4A  primitive code object
        GOSUBL  POPC%                            * 51A4F
        CAEX    W                                * 51A55
        A=-A-1  S                                * 51A58
        GOTO    L_51B81                          * 51A5B

* C% -> C%'
* refs (5): 5263E 5266B 527FA 5282C 52854
C/i:
        CON(5)  (*)+5                            * 51A5F  primitive code object
        GOSUBL  POPC%                            * 51A64
        CAEX    W                                * 51A6A
        GOTO    L_51B7E                          * 51A6D
        RPL

* %r %ang %ph -> %x %y %z
* refs (2): 51E32 5206C
2%>%%SQR:
        ::                                       * 51A71
          DUP                                    * 51A76
          _*(2r);r=>rr                           * 51A7B
          SWAPDUP                                * 51A80
          _*(2r);r=>rr                           * 51A85
          %%+                                    * 51A8A
        ;                                        * 51A8F

* %% -> %%'
* refs (11): 37969 37D5F 51EAF 5208A 520BC 52260 ...
%%SQR:
        ::                                       * 51A94
          DUP                                    * 51A99
          %%*SWAP                                * 51A9E
          DUP                                    * 51AA3
          %%*                                    * 51AA8
          %%+                                    * 51AAD
        ;                                        * 51AB2

* % %' -> %max %min
* refs (4): 51FA4 51FC2 51FCC 52008
%MAXIMIZE:
        ::                                       * 51AB7
          DUP%0=                                 * 51ABC
          ?SEMI                                  * 51AC1
          %0>                                    * 51AC6
          case                                   * 51ACB
          %MAXREAL                               * 51AD0
          %-MAXREAL                              * 51AD5
        ;                                        * 51ADA

* refs (5): 51D9C 51DEC 51EE6 51F27 523BA
ãcplx(4rr):
        ::                                       * 51ADF
          ROT2DUP                                * 51AE4
          %%*                                    * 51AE9
          5UNROLL                                * 51AEE
          3PICK                                  * 51AF3
          %%*                                    * 51AF8
          4UNROLL                                * 51AFD
          3PICK                                  * 51B02
          %%*UNROT                               * 51B07
          %%*                                    * 51B0C
          4ROLL                                  * 51B11
          %%-                                    * 51B16
          3UNROLL                                * 51B1B
          %%+                                    * 51B20
        ;                                        * 51B25

* C%% -> flag
* refs (4): 37A8B 37D0F 92E0D 92E6C
C%%0=:
        CON(5)  (*)+5                            * 51B2A  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 51B2F
        AD1EX                                    * 51B32
        D1=D1+  10                               * 51B35
        C=DAT1  W                                * 51B38
        D1=D1+  5                                * 51B3C
        GOTO    L_51B55                          * 51B3F

* C% -> flag
* refs (6): 37D05 520D5 52111 521ED 5237E 5F145
C%0=:
        CON(5)  (*)+5                            * 51B43  primitive code object
        A=DAT1  A                                * 51B48
        AD1EX                                    * 51B4B
        D1=D1+  5                                * 51B4E
        C=DAT1  W                                * 51B51
L_51B55:
        ?C#0    W                                * 51B55
        GOYES   L_51B66                          * 51B58
        D1=D1+  16                               * 51B5A
        C=DAT1  W                                * 51B5D
        ?C#0    W                                * 51B61
        GOYES   L_51B66                          * 51B64
L_51B66:
        D1=A                                     * 51B66
        GOVLNG  OverWrF/TLp                      * 51B69

* C% -> -C%
* refs (4): 1A9AE 37CE2 51CD9 51D01
C%CHS:
        CON(5)  (*)+5                            * 51B70  primitive code object
        GOSUBL  POPC%                            * 51B75
        A=-A-1  S                                * 51B7B
L_51B7E:
        C=-C-1  S                                * 51B7E
L_51B81:
        GOSUBL  PUSHC%                           * 51B81
        A=DAT0  A                                * 51B87
        D0=D0+  5                                * 51B8A
        PC=(A)                                   * 51B8D

* C%% -> -C%%
* refs (6): 37CEC 51D15 51D29 7CF4F 92F0C 976FA
C%%CHS:
        CON(5)  (*)+5                            * 51B91  primitive code object
        GOSUBL  POPC%%                           * 51B96
        A=-A-1  S                                * 51B9C
L_51B9F:
        C=-C-1  S                                * 51B9F
L_51BA2:
        GOSUBL  PUSHC%%                          * 51BA2
        A=DAT0  A                                * 51BA8
        D0=D0+  5                                * 51BAB
        PC=(A)                                   * 51BAE

* C% -> C%'
* refs (1): 1AA87
C%CONJ:
        CON(5)  (*)+5                            * 51BB2  primitive code object
        GOSUBL  POPC%                            * 51BB7
        GOTO    L_51B7E                          * 51BBD

* C%% -> C%%'
* refs (5): 35F76 37D96 7CF54 92AC9 CB648
C%%CONJ:
        CON(5)  (*)+5                            * 51BC1  primitive code object
        GOSUBL  POPC%%                           * 51BC6
        GOTO    L_51B9F                          * 51BCC
        RPL

* C% % -> C%'
* refs (2): 1AB8A 51CF2
C%C+R:
        ::                                       * 51BD0
          SWAP                                   * 51BD5
          C%R+C                                  * 51BDA
        ;                                        * 51BDF

* ob % %' -> %+%' ob
* refs (4): 4FD90 4FDA4 51C07 51C2F
%+SWAP:
        ::                                       * 51BE4
          %+                                     * 51BE9
          SWAP                                   * 51BEE
        ;                                        * 51BF3

* % C% -> C%'
* refs (3): 1AB80 51BDA 51CDE
C%R+C:
        ::                                       * 51BF8
          C%>%                                   * 51BFD
          3UNROLL                                * 51C02
          %+SWAP                                 * 51C07
          %>C%                                   * 51C0C
        ;                                        * 51C11

* C% C%' -> C%''
* refs (5): 1AB94 4FC9B 4FCFF 51D06 8C3FE
C%C+C:
        ::                                       * 51C16
          SWAP2C%>%                              * 51C1B
          ROT                                    * 51C20
          %+                                     * 51C25
          3UNROLL                                * 51C2A
          %+SWAP                                 * 51C2F
          %>C%                                   * 51C34
        ;                                        * 51C39

* C%% C%%' -> C%%''
* refs (5): 37C02 51D1A 92E5D 92F11 CB7A7
C%%C+C:
        ::                                       * 51C3E
          SWAP2C%%>%%                            * 51C43
          ROT                                    * 51C48
          %%+                                    * 51C4D
          3UNROLL                                * 51C52
          %%+                                    * 51C57
          SWAP                                   * 51C5C
          %%>C%%                                 * 51C61
        ;                                        * 51C66

* C% C%' -> %re %im %re' %im'
* refs (8): 4ACED 4B210 4B2D8 4E7E9 4E825 4E8DE ...
SWAP2C%>%:
        ::                                       * 51C6B
          C%>%                                   * 51C70
          ROT                                    * 51C75
          C%>%                                   * 51C7A
        ;                                        * 51C7F

* C%% C%%' -> %%re %%im %%re' %%im'
* refs (3): 37955 51C43 51DE7
SWAP2C%%>%%:
        ::                                       * 51C84
          C%%>%%                                 * 51C89
          ROT                                    * 51C8E
          C%%>%%                                 * 51C93
        ;                                        * 51C98

* C%% %% -> C%%'
* refs (2): 37BF8 51D42
C%%C+R:
        ::                                       * 51C9D
          SWAP                                   * 51CA2
          C%%R+C                                 * 51CA7
        ;                                        * 51CAC

* %% C%% -> C%%'
* refs (3): 37BFD 51CA7 51D2E
C%%R+C:
        ::                                       * 51CB1
          C%%>%%                                 * 51CB6
          3UNROLL                                * 51CBB
          %%+                                    * 51CC0
          SWAP                                   * 51CC5
          %%>C%%                                 * 51CCA
        ;                                        * 51CCF

* % C% -> C%'
* refs (1): 1AD22
C%R-C:
        ::                                       * 51CD4
          C%CHS                                  * 51CD9
          C%R+C                                  * 51CDE
        ;                                        * 51CE3

* C% % -> C%'
* refs (1): 1AD2C
C%C-R:
        ::                                       * 51CE8
          %CHS                                   * 51CED
          C%C+R                                  * 51CF2
        ;                                        * 51CF7

* C% C%' -> C%''
* refs (3): 1AD36 4FCD2 8C3F4
C%C-C:
        ::                                       * 51CFC
          C%CHS                                  * 51D01
          C%C+C                                  * 51D06
        ;                                        * 51D0B

* C%% C%%' -> C%%''
* refs (5): 37C25 92E3F 92F25 CB79D CB7D9
C%%C-C:
        ::                                       * 51D10
          C%%CHS                                 * 51D15
          C%%C+C                                 * 51D1A
        ;                                        * 51D1F

* %% C%% -> C%%'
* refs (1): 37C20
C%%R-C:
        ::                                       * 51D24
          C%%CHS                                 * 51D29
          C%%R+C                                 * 51D2E
        ;                                        * 51D33

* C%% %% -> C%%'
* refs (1): 37C1B
C%%C-R:
        ::                                       * 51D38
          %%CHS                                  * 51D3D
          C%%C+R                                 * 51D42
        ;                                        * 51D47

* C% % -> C%'
* refs (1): 1AE11
C%C*R:
        ::                                       * 51D4C
          SWAP                                   * 51D51
          C%R*C                                  * 51D56
        ;                                        * 51D5B

* % C% -> C%'
* refs (2): 1AE07 51D56
C%R*C:
        ::                                       * 51D60
          C%>%                                   * 51D65
          UNROTOVER                              * 51D6A
          %*                                     * 51D6F
          3UNROLL                                * 51D74
          %*                                     * 51D79
          %>C%                                   * 51D7E
        ;                                        * 51D83

* refs (2): 1AE1B 1B499
C%C*C_51D88:
        ::                                       * 51D88
          C%>%%                                  * 51D8D
          ROT                                    * 51D92
          C%>%%                                  * 51D97
          ãcplx(4rr)                             * 51D9C
          %%>C%                                  * 51DA1
        ;                                        * 51DA6

* C%% %% -> C%%'
* refs (6): 37C3E 92E49 CB789 CB798 CB7C5 CB7D4
C%%C*R:
        ::                                       * 51DAB
          SWAP                                   * 51DB0
          C%%R*C                                 * 51DB5
        ;                                        * 51DBA

* %% C%% -> C%%'
* refs (3): 37C43 51DB5 CB7ED
C%%R*C:
        ::                                       * 51DBF
          C%%>%%                                 * 51DC4
          UNROTOVER                              * 51DC9
          %%*UNROT                               * 51DCE
          %%*                                    * 51DD3
          %%>C%%                                 * 51DD8
        ;                                        * 51DDD

* C%% C%%' -> C%%''
* refs (4): 37C48 92AF1 92E03 92E53
C%%C*C:
        ::                                       * 51DE2
          SWAP2C%%>%%                            * 51DE7
          ãcplx(4rr)                             * 51DEC
          %%>C%%                                 * 51DF1
        ;                                        * 51DF6

* refs (4): 51E55 51EEB 51F2C 51F8B
axy=>(x/a,y/a):
        ::                                       * 51DFB
          UNROTOVER                              * 51E00
          %%/                                    * 51E05
          3UNROLL                                * 51E0A
          %%/                                    * 51E0F
        ;                                        * 51E14

* % C% -> C%'
* refs (2): 1AF1E 51F09
C%R/C:
        ::                                       * 51E19
          C%0=case                               * 51E1E
          OBJ_51F9A                              * 51E23
          C%>%                                   * 51E28
          2DUP                                   * 51E2D
          2%>%%SQR                               * 51E32
          4UNROLL                                * 51E37
          UNROTOVER                              * 51E3C
          _*(2r);r=>rr                           * 51E41
          3UNROLL                                * 51E46
          _*(2r);r=>rr                           * 51E4B
          %%CHS                                  * 51E50
          axy=>(x/a,y/a)                         * 51E55
          %%>C%                                  * 51E5A
        ;                                        * 51E5F

* C% % -> C%'
* refs (1): 1AF28
C%C/R:
        ::                                       * 51E64
          %0=case                                * 51E69
          OBJ_51FB3                              * 51E6E
          SWAP                                   * 51E73
          C%>%                                   * 51E78
          UNROTOVER                              * 51E7D
          %/                                     * 51E82
          3UNROLL                                * 51E87
          %/                                     * 51E8C
          %>C%                                   * 51E91
        ;                                        * 51E96

* refs (2): 51EDC 51F1D
OBJ_51E9B:
        ::                                       * 51E9B
          %%CHS                                  * 51EA0

* refs (1): 51F45
OBJ_51EA5:
          ::                                     * 51EA5
            2DUP                                 * 51EAA
            %%SQR                                * 51EAF
            4UNROLL                              * 51EB4
          ;                                      * 51EB9
          ROT                                    * 51EBE
        ;                                        * 51EC3

* C% C%' -> C%''
* refs (1): 1AF32
C%C/C:
        ::                                       * 51EC8
          C%0=case                               * 51ECD
          OBJ_51FB3                              * 51ED2
          C%>%%                                  * 51ED7
          OBJ_51E9B                              * 51EDC
          C%>%%                                  * 51EE1
          ãcplx(4rr)                             * 51EE6
          axy=>(x/a,y/a)                         * 51EEB
          %%>C%                                  * 51EF0
        ;                                        * 51EF5

* C% -> 1/C%
* refs (1): 1B291
C%1/:
        ::                                       * 51EFA
          %1                                     * 51EFF
          SWAP                                   * 51F04
          C%R/C                                  * 51F09
        ;                                        * 51F0E

* C%% C%%' -> C%%''
* refs (2): 37C6B 92F1B
C%%C/C:
        ::                                       * 51F13
          C%%>%%                                 * 51F18
          OBJ_51E9B                              * 51F1D
          C%%>%%                                 * 51F22
          ãcplx(4rr)                             * 51F27
          axy=>(x/a,y/a)                         * 51F2C
          %%>C%%                                 * 51F31
        ;                                        * 51F36

* %% C%% -> C%%'
* refs (1): 37C66
C%%R/C:
        ::                                       * 51F3B
          C%%>%%                                 * 51F40
          OBJ_51EA5                              * 51F45
          3PICK                                  * 51F4A
          %%*UNROT                               * 51F4F
          %%*                                    * 51F54
          3PICK                                  * 51F59
          %%/                                    * 51F5E
          SWAPROT                                * 51F63
          %%/                                    * 51F68
          %%CHS                                  * 51F6D
          %%>C%%                                 * 51F72
        ;                                        * 51F77

* C%% %% -> C%%'
* refs (2): 37C61 92AFB
C%%C/R:
        ::                                       * 51F7C
          SWAP                                   * 51F81
          C%%>%%                                 * 51F86
          axy=>(x/a,y/a)                         * 51F8B
          %%>C%%                                 * 51F90
        ;                                        * 51F95

* refs (1): 51E23
OBJ_51F9A:
        ::                                       * 51F9A
          OBJ_52017                              * 51F9F
          %MAXIMIZE                              * 51FA4
          Re>C%                                  * 51FA9
        ;                                        * 51FAE

* refs (2): 51E6E 51ED2
OBJ_51FB3:
        ::                                       * 51FB3
          OBJ_52017                              * 51FB8
          C%>%                                   * 51FBD
          %MAXIMIZE                              * 51FC2
          SWAP                                   * 51FC7
          %MAXIMIZE                              * 51FCC
          SWAP%>C%                               * 51FD1
        ;                                        * 51FD6

* refs (2): 521F7 522C9
OBJ_51FDB:
        ::                                       * 51FDB
          OBJ_5203A                              * 51FE0
          DROP                                   * 51FE5
          %-MAXREAL                              * 51FEA
          Re>C%                                  * 51FEF
        ;                                        * 51FF4

* refs (1): 526DD
OBJ_51FF9:
        ::                                       * 51FF9
          OBJ_5203A                              * 51FFE
          C%>%                                   * 52003
          %MAXIMIZE                              * 52008
          %>C%                                   * 5200D
        ;                                        * 52012
