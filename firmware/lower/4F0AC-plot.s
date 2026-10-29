* HP 48GX ROM revision R, #4F0AC-#52016: Plotting
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ISTOP-INDEX SWAP#1+SWAP NOT?INVPPAR CHECKPICT INDEPVAR GROBDIM C%>%% 1get(li)? Re>C% %1- %%>C% RclMaxStdPict
* Follows on from the previous file (at #4F0AC in the original ROM).
        RPL

* { hxs hxs' } -> C%
* refs (1): 1E289
DOPX>C:
        :: 2HXSLIST? s=>ñr SWAP s=>ñr SWAP 2%>%% RclMaxStdPict px->c(2rr,2s) ; * 4F0AC

* refs (6): 4F0B6 4F0C0 4FD45 4FD4F 4FD63 508F1
s=>ñr:
        :: DUP s=>ñr~1 #<case UNCOERCE           * 4F0DE
          BINT0 SWAP#- UNCOERCE %CHS ;           * 4F0F7

* refs (6): 49F33 49F74 4AC57 4E7A3 4E7B7 4F0D4
px->c(2rr,2s):
        :: GETPMIN&MAX 2SWAP OBJ_4F2CD 5ROLL DUPTYPEBINT? IT UNCOERCE%% * 4F110
          %%- SWAP%%/ %%>% 4UNROLLROT DUPTYPEBINT? IT UNCOERCE%% * 4F138
          SWAP %%- SWAP%%/ %%>% SWAP%>C% ;       * 4F15B

* C% -> { hxs hxs' }
* refs (1): 1E2A9
DOC>PX:
        :: C%># SWAP #>HXS SWAP #>HXS TWO{}N ;   * 4F179

* refs (4): 49FB0 4F013 4F728 4FA1B
OBJ_4F1A1:
        :: OBJ_4F20F (rò-0.5)=>s? NOTcasedrop 2DROPFALSE * 4F1A1
          4UNROLLROT r=>rr;rot;*(2rr);+(2rr);r=>r (rò-0.5)=>s? NOTcsdrpfls * 4F1BA
          SWAPTRUE ;                             * 4F1CE

* ob1 ob2 -> ob2 ob1 T
* refs (5): 1044B 105E0 4F1CE 85346 B5FC7
SWAPTRUE:
        :: SWAP TRUE ;                           * 4F1D8

* refs (2): 4FBD8 4FBE7
sub(go,2c)~1:
        :: OBJ_4F20F COERCE 4UNROLLROT r=>rr;rot;*(2rr);+(2rr);r=>r * 4F1EC
          COERCESWAP ;                           * 4F205

* refs (3): 4E915 4F1A6 4F1F1
OBJ_4F20F:
        :: ROT C%>% GETPMIN&MAX 6ROLL 6ROLL OBJ_4F2CD 5ROLL * 4F20F
          r=>rr;rot;*(2rr);-(2rr);r=>r ;         * 4F237

* refs (4): 4E91F 4F1BF 4F200 4FE58
r=>rr;rot;*(2rr);+(2rr);r=>r:
        :: %>%% ROT %%* %%+ %%>% ;               * 4F241

* refs (2): 4F237 4FE4E
r=>rr;rot;*(2rr);-(2rr);r=>r:
        :: %>%% ROT %%* %%- %%>% ;               * 4F264

* refs (3): 4E997 4F1AB 4F1C4
(rò-0.5)=>s?:
        :: DUP %0>= case                         * 4F287

r+=>s;true:
          :: COERCE TRUE ;                       * 4F29B
          %-.5 %>= NOTcaseFALSE BINT0            * 4F2AF
          TRUE ;                                 * 4F2C3

* refs (7): 4F11F 4F22D 4F41C 4F5ED 4FE44 51915 ...
OBJ_4F2CD:
        :: #1- UNCOERCE%% SWAP#1- UNCOERCE%% 4ROLL C%>% %>%%SWAP %>%% 5ROLL * 4F2CD
          C%>% %>%%SWAP %>%% 3PICK %%- DUP 7PICK SWAP%%/ 7UNROLL ROT %%CHS * 4F2FF
          6ROLL %%*SWAP %%/ 4UNROLL DUPROT %%- DUP 4PICKSWAP %%/ 4UNROLL * 4F336
          SWAPROT %%*SWAP %%/ ;                  * 4F368

* refs (1): 20D36
sto(go,PICT):
        :: CKPICT OBJ_46152 DUPGROBDIM # 800 OVER#< case SETSIZEERR * 4F37C
          KILLGDISP MAKEGROB GROB>GDISP CHECKPICT GBUFF ZEROZERO GROB! ; * 4F3A9

* hxs hxs -> # #
* refs (2): 4F6A6 5155A
2HXS>#:
        :: HXS># SWAP HXS># SWAP ;               * 4F3D1

* refs (1): 1E329
pixon(c):
        :: CHECKPICT C%># PIXON3 ;               * 4F3EF

* C% -> # #'
* refs (4): 4F17E 4F3F9 4F47B 4F4AD
C%>#:
        :: C%>% GETPMIN&MAX RclMaxStdPict OBJ_4F2CD 5ROLL SWAPROT getypos * 4F408
          5UNROLL 5UNROLL SWAP getxpos SgnMag># 3UNROLL SgnMag># ; * 4F430

* refs (1): 1E333
pixon(li):
        :: 2HXSLIST? CHECKPICT PIXON3 ;          * 4F458

* refs (1): 1E353
pixoff(c):
        :: CHECKPICT C%># PIXOFF3 ;              * 4F471

* refs (1): 1E35D
pixoff(li):
        :: 2HXSLIST? CHECKPICT PIXOFF3 ;         * 4F48A

* refs (1): 1E37D
pix?(c):
        :: CHECKPICT C%># pix?(2s) ;             * 4F4A3

* refs (1): 1E387
pix?(li):
        :: 2HXSLIST? CHECKPICT                   * 4F4BC

* refs (1): 4F4B2
pix?(2s):
          ::                                     * 4F4CB

* refs (1): 4F0E8
s=>ñr~1:
            # 80000 2DUP#< 4PICK ROT #< AND NOTcase 2DROP%0 * 4F4D0
            GBUFF InGrob(2s,go)? NOTcase 2DROP%0 * 4F4FD
            PIXON?3 COERCEFLAG ;                 * 4F511
        ;                                        * 4F520

* refs (1): 1E3A7
line(2li):
        :: TRUE line(2li,?) ;                    * 4F525

* refs (1): 1E3D1
tline(2li):
        :: FALSE line(2li,?) ;                   * 4F539

* refs (2): 4F52F 4F543
line(2li,?):
        :: 3UNROLL 2HXSLIST? ROT 2HXSLIST? CHECKPICT 5ROLL ITE DRAWLINE#3 * 4F54D
          TOGGLELINE#3                           * 4F57A
        ;                                        * 4F57F

* refs (4): 1E3B1 477CC 8A80F 8C403
line(2c):
        :: TRUE line(2c,?) ;                     * 4F584

* refs (1): 1E3DB
tline(2c):
        :: FALSE line(2c,?) ;                    * 4F598

* refs (2): 4F58E 4F5A2
line(2c,?):
        :: 3UNROLL CHECKPICT 2c=>pxs 5ROLL ITE DRAWLINE#3 TOGGLELINE#3 * 4F5AC
        ;                                        * 4F5D4

* refs (2): 4F5BB 4F692
2c=>pxs:
        :: SWAP2C%>% GETPMIN&MAX RclMaxStdPict OBJ_4F2CD 2DUP 7ROLL SWAPROT * 4F5D9
          getypos SgnMag># 5UNROLL 7ROLL SWAPROT getypos SgnMag># 3UNROLL * 4F601
          2DUP 8ROLL SWAPROT getxpos SgnMag># 4UNROLL 6ROLL SWAPROT getxpos * 4F629
          SgnMag># 4UNROLL ;                     * 4F656

* refs (1): 1E3FB
box(2li):
        :: 2HXSLIST? ROT 2HXSLIST? CHECKPICT DRAWBOX# ; * 4F665

* refs (1): 1E405
box(2c):
        :: CHECKPICT 2c=>pxs DRAWBOX# ;          * 4F688

* refs (1): 1E425
blank(2b):
        :: 2HXS># SWAP MAKEGROB ;                * 4F6A1

* refs (2): 1E474 1E502
g?or(go,li,go,?):
        :: 4ROLL CKREF 4UNROLL 4UNROLL OBJ_4F6DD ; * 4F6BA

* refs (2): 4F6D3 4F76E
OBJ_4F6DD:
        :: SWAP 2HXSLIST? GROB+# ;               * 4F6DD

* refs (2): 1E492 1E520
g?or(go,c,go,?):
        :: 4ROLL CKREF 4UNROLL 4UNROLL OBJ_4F719 ; * 4F6F6

* refs (2): 4F70F 4F77D
OBJ_4F719:
        :: SWAP OBJ_472D1 OBJ_4F1A1 case GROB+#  * 4F719
          SETSIZEERR ;                           * 4F737

* refs (4): 1E4B0 1E4CE 1E53E 1E55C
g?or(PICT,c,go,?):
        :: 4UNROLLROT CKPICT CHECKPICT GBUFF UNROTOVER TYPELIST? case * 4F741
          :: OBJ_4F6DD DROP ;                    * 4F769
          OBJ_4F719 DROP ;                       * 4F77D

* flag grob1 grob2 #x #y -> grob'
* refs (2): 4F6EC 4F732
GROB+#:
        :: 4PICK InGrob(2s,go)?#:BAV! CKGROBFITS 2DUP 5PICK GROBDIM * 4F78C
          4PICK#+SWAP 3PICK#+ 8PICK 5UNROLL SUBGROB 4ROLL GROB+#~1 4PICK * 4F7AF
          2SWAP GROB! ;                          * 4F7D7

* g1 g2 #n #m -> g1 g2' #n #m
* refs (5): 4EA69 4ED52 4F79B 4F9DA 50451
CKGROBFITS:
        :: OBJ_472D1 2DUP 6PICK #+SWAP 5PICK #+ 8PICK GROBDIM DUP 5ROLL * 4F7E6
          #<ITE                                  * 4F81D
          :: 7PICK #- 4ROLLDROP TRUE ;           * 4F822
          :: DROPROT FALSE ; 3PICK 5ROLL #<ITE   * 4F840
          :: ROT 5PICK #- 4ROLLDROP TRUE ;       * 4F863

drop(3);rot;false:
          :: ROTDROP ROT FALSE ; ROT OR NOTcase2DROP 5ROLL * 4F886
          ZEROZERO 5ROLL 5ROLL SUBGROB 3UNROLL ; * 4F8B3

* refs (1): 1AC2A
+(2go):
        :: DUPGROBDIM 4PICK GROBDIM ROT #= 3UNROLL #= AND NcaseSIZEERR * 4F8D1
          OBJ_4F949                              * 4F903
          !OR$ &HXS OBJ_515CD ;                  * 4F908

* refs (1): 4F7CD
GROB+#~1:
        :: OBJ_4F949 7ROLL ITE !OR$ !XOR$        * 4F91C
          &HXS OBJ_515CD ;                       * 4F93A

* refs (2): 4F903 4F921
OBJ_4F949:
        :: DUP LENHXS OVER BINT1 BINT10 SUBHXS ROT BINT11 4PICK SUBHXS 4ROLL * 4F949
          BINT11 5ROLL SUBHXS ;                  * 4F985

* refs (1): 1C8FE
repl(go,li,go):
        :: rot;NewobIfNotFree 3UNROLL repl!(go,li,go) ; * 4F999

* refs (2): 4F9A8 4FA5C
repl!(go,li,go):
        :: SWAP 2HXSLIST? ChkRepl(2go,2s) ;      * 4F9B2

* refs (5): 4F9C1 4FA25 8BB80 8BCBC C0B9A
ChkRepl(2go,2s):
        :: 4PICK InGrob(2s,go)?#:BAV! CKGROBFITS 4PICK 3UNROLL GROB! ; * 4F9CB

* refs (1): 1C90D
repl(go,c,go):
        :: rot;NewobIfNotFree 3UNROLL repl!(go,c,go) ; * 4F9F3

* refs (2): 4FA02 4FA6B
repl!(go,c,go):
        :: SWAP OBJ_472D1 OBJ_4F1A1 NOTcaseDROP ChkRepl(2go,2s) * 4FA0C
        ;                                        * 4FA2A

* refs (2): D231D D232C
repl(PICT,c,go):
        :: ROT CKPICT CHECKPICT GBUFF UNROTOVER TYPELIST? case * 4FA2F
          :: repl!(go,li,go) DROP ;              * 4FA57
          repl!(go,c,go) DROP ;                  * 4FA6B

* refs (1): 1C92B
xREPL~list,real,list:
        :: SWAP COERCE DUP#0=case SETSIZEERR     * 4FA7A
          3PICK LENCOMP OVER#< casedrop &COMP    * 4FA93
          3PICK BINT1 3PICK #1- SUBCOMP 4ROLLROT 4PICK LENCOMP #+OVER * 4FAAC
          LENCOMP SUBCOMP ROTSWAP &COMP &COMP ;  * 4FAD9

* refs (1): 1C91C
repl(st,s,st):
        :: SWAP COERCE DUP#0=case SETSIZEERR     * 4FAF7
          3PICK LEN$ OVER#< casedrop &$          * 4FB10
          3PICK BINT1 3PICK #1- SUB$ 4ROLLROT 4PICK LEN$ #+OVER LEN$ SUB$ * 4FB29
          ROTSWAP &$ &$ ;                        * 4FB60

* refs (2): 1C884 4FC19
sub(go,2li):
        :: 2HXSLIST? ROT 2HXSLIST? sub(go,4s) ;  * 4FB74

* refs (2): 4FB88 4FBEC
sub(go,4s):
        :: ORDERXY# #1+ SWAP#1+SWAP SUBGROB DUPGROBDIM 2#0=OR casedrop * 4FB92
          SETSIZEERR                             * 4FBBA
        ;                                        * 4FBBF

* refs (2): 1C893 4FC1E
sub(go,2c):
        :: OBJ_472D1 2DUP5ROLL 3UNROLL sub(go,2c)~1 5UNROLL 5UNROLL * 4FBC4
          sub(go,2c)~1 sub(go,4s) ;              * 4FBE7

* refs (2): D2285 D2294
sub(PICT,2c):
        :: ROT CKPICT CHECKPICT GBUFF 3UNROLL dLISTcase sub(go,2li) * 4FBF6
          sub(go,2c) ;                           * 4FC1E

* refs (1): 1A9E0
inv(go):
        :: CKREF INVGROB ;                       * 4FC28

* refs (1): 1A9EA
neg(PICT):
        :: CKPICT CHECKPICT GBUFF INVGROB DROP ; * 4FC3C

* refs (1): 1E5E6
arc(c,3r):
        :: CHECKPICT OBJ_4FDCC CHECKPVARS DROP 4UNROLL OVER %SGN 4UNROLL * 4FC5F
          %POL>%REC %>C% OVER C%C+C RclMaxStdPict 2DUP 5ROLL C%>% OBJ_4FE30 * 4FC8C
          4UNROLL ROT C%>% OBJ_4FE30 2DUP C%C-C C%ABS 4ROLL %* 4ROLL * 4FCB9
          %POL>%REC %CHS %>C% OVER C%C+C arc(c,3r)~1 2SWAP arc(c,3r)~1 ROT * 4FCEB
          arc(c,3r)~1 2SWAP OBJ_4FE6C ;          * 4FD18

* refs (1): 1E5F5
arc(li,b,2r):
        :: CHECKPICT OBJ_4FDCC 4ROLL 2HXSLIST? s=>ñr SWAP s=>ñr SWAP 5ROLL * 4FD2C
          HXS># s=>ñr DUP4UNROLL 5ROLL           * 4FD5E

* refs (1): 4FDBD
OBJ_4FD72:
          :: %CHS %POL>%REC %0_2A2B4 RNDXY 3PICK %+SWAP %0_2A2B4 RNDXY 4PICK * 4FD72
            %+SWAP 2SWAP ;                       * 4FDA4
          5ROLL 6ROLL OBJ_4FD72 OBJ_4FE6C ;      * 4FDB3

* refs (2): 4FC69 4FD36
OBJ_4FDCC:
        :: 2DUP dist(2r) 1REV 2DUP %1- %< 7UNROLL %> IT DROPDUP * 4FDCC
        ;                                        * 4FE03

* refs (1): 45218
drax~1~5:
        :: OBJ_4FE30                             * 4FE08

* refs (3): 4FD04 4FD0E 4FD18
arc(c,3r)~1:
          :: %0_2A2B4 trunc(c,r) C%>% ; ;        * 4FE12

* refs (3): 4FCB4 4FCC8 4FE0D
OBJ_4FE30:
        :: GETPMIN&MAX 6ROLL 6ROLL OBJ_4F2CD 5ROLL * 4FE30
          r=>rr;rot;*(2rr);-(2rr);r=>r 4UNROLLROT * 4FE4E
          r=>rr;rot;*(2rr);+(2rr);r=>r SWAP %>C% ; * 4FE58

* refs (3): 4E622 4FD22 4FDC2
OBJ_4FE6C:
        ::                                       * 4FE6C
          {                                      * 4FE71
            :: 9GETLAM %= SWAP 6GETLAM %>= ;     * 4FE76
            :: 5GETLAM %>= SWAP 10GETLAM %= ;    * 4FE99
            :: 9GETLAM %= SWAP 6GETLAM %< ;      * 4FEBC
            :: 5GETLAM %< SWAP 10GETLAM %= ; }   * 4FEDF
          7PICK 4PICK %- 7PICK 4PICK %- 2DUP %ABS SWAP %ABS %> ITE * 4FF07
          :: SWAPDROP %0> ITE BINT2 BINT4        * 4FF43
          ;                                      * 4FF61
          :: DROP %0> ITE BINT1 BINT3            * 4FF66
          ;                                      * 4FF84
          NTHCOMPDROP TrueTrue 3PICK             * 4FF89
          {                                      * 4FF98

Π'xe:
            LAM 'xe                              * 4FF9D

Π'ye:
            LAM 'ye                              * 4FFAA

Π'x:
            LAM 'x                               * 4FFB7

Π'y:
            LAM 'y                               * 4FFC2

Π'xc:
            LAM 'xc                              * 4FFCD

Π'yc:
            LAM 'yc                              * 4FFDA

Π'r2:
            LAM 'r2                              * 4FFE7

Π'left:
            LAM 'left                            * 4FFF4

Π'up:
            LAM 'up                              * 50005

Π'exit:
            LAM 'exit }                          * 50012
          BIND 8GETLAM 10GETLAM %= 7GETLAM 9GETLAM %= AND AND 8GETLAM * 50028
          6GETLAM %= 7GETLAM 5GETLAM %= AND ORcase * 5005A
          :: OBJ_5036B ABND ;                    * 5007D
          8GETLAM 7GETLAM OBJ_5032A DUP %3 %< IT OBJ_501DB * 50091
          4PUTLAM 2DROP OBJ_5036B BEGIN OBJ_5028A 8GETLAM 3GETLAM ITE %1- * 500B9
          %1+                                    * 500E6
          7GETLAM OBJ_5032A OBJ_517B2 2GETLAM ITE %1- %1+ * 500EB
          OBJ_5032A 6PICK 3PICK OBJ_5032A 4GETLAM dist(2r) 4ROLL 4GETLAM * 5010E
          dist(2r) 2DUP %> ITE 4UNROLL3DROP      * 50136

drop(1,5-6):
          :: DROP 4ROLLDROP 4ROLLDROP ;          * 5014F
          4ROLL 4GETLAM dist(2r) %> ?SKIP 2SWAP  * 50168
          2DROP TOTEMPSWAP TOTEMPSWAP 7PUTLAM 8PUTLAM OBJ_5036B OBJ_517B2 * 50186
          1GETLAM EVAL AND ATTNFLG@ ATTNFLGCLR #0<> OR UNTIL ABND ; * 501A9

* refs (1): 500B4
OBJ_501DB:
        :: DROP %2 9GETLAM 5GETLAM %- %SGN 5GETLAM %+ 9PUTLAM 10GETLAM * 501DB
          6GETLAM %- %SGN 6GETLAM %+ 10PUTLAM '  * 50212
          :: 9GETLAM %= SWAP 10GETLAM %= ; 1PUTLAM ; * 50235

* % -> %+1
* refs (8): 2098F 4CB1D 4EF5F 500E6 50109 AE262 ...
%1+:
        :: %1 %+ ;                               * 50262

* % -> %-1
* refs (17): 209FA 4FDE5 500E1 50104 8A184 8A1D2 ...
%1-:
        :: %1 %- ;                               * 50276

* refs (1): 500CD
OBJ_5028A:
        :: 8GETLAM 6GETLAM %= ITE                * 5028A
          :: 7GETLAM 5GETLAM %> ;                * 502A3

* refs (1): 502EE
OBJ_502BC:
          :: 8GETLAM 6GETLAM %> ;                * 502BC
          2PUTLAM 7GETLAM 5GETLAM %= ITE OBJ_502BC * 502D5
          :: 5GETLAM 7GETLAM %> ;                * 502F3
          3PUTLAM ;                              * 5030C

* refs (2): 4F075 4F084
WINDOW#~1:
        :: #+ #< ;                               * 50316

* refs (4): 5009B 500F0 5010E 5011D
OBJ_5032A:
        :: DUP 5GETLAM %- DUP %* 3PICK 6GETLAM %- DUP %* %+ ; * 5032A

* refs (3): 50082 500C3 5019F
OBJ_5036B:
        :: 8GETLAM %-.5 %< ?SEMI                 * 5036B
          7GETLAM %-.5 %< ?SEMI                  * 50384
          8GETLAM 7GETLAM COERCE2 PIXON3 ;       * 50398

* refs (6): 4FDD6 50127 50136 50172 50905 50914
dist(2r):
        :: %MAXorder %- ;                        * 503B1

* refs (1): 1E610
text:
        :: TOADISP ;                             * 503C5

* -> grob
* refs (1): 1E57C
DOLCD>:
        :: BINT64 BINT131 MAKEGROB ABUFF ZEROZERO BINT131 # 38 SUBGROB OVER * 503D4
          ZEROZERO GROB! HARDBUFF2 OVER BINT0 # 38 GROB! ; * 5040B

* grob ->
* refs (1): 1E59C
DO>LCD:
        :: DOCLLCD ABUFF SWAP ZEROZERO CKGROBFITS 4ROLL 3UNROLL GROB! ; * 50438

* ->
* refs (4): 1A862 47D65 5043D 6B25A
DOCLLCD:
        :: ABUFF ZEROZERO OBJ_472D1 SWAP GROB!ZERODRP ; * 5046A

* refs (2): 1E5C1 50532
->grob(_,r):
        :: %0_2A2B4 EQUALcasedrop 0->grob(_)     * 5048D
          OVER TYPECSTR? ?SKIP                   * 504A1
          :: SWAP BINT0 !DcompWidth 1stkdecomp$w SWAP ; * 504B0
          %1 EQUALcasedrop $>grob                * 504D3
          %2 EQUALcasedrop $>GROB                * 504E2
          %3 EQUALcasedrop $>BIGGROB             * 504F1
          SETSIZEERR ;                           * 50500

* refs (1): 5049C
0->grob(_):
        :: DUPTYPESYMB? case 0->grob(_)~1        * 5050A
          DUPTYPEEXT? case 0->grob(_)~1          * 5051E
          %3 ->grob(_,r) ;                       * 5052D

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
        :: 6GETLAM 10GETLAM getxpos SgnMag># ;   * 505C6

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
        :: 5GETLAM 9GETLAM getypos SgnMag># ;    * 5068D

* refs (9): 46D33 4CBF9 4F42B 4F601 4F61A 5069C ...
getypos:
        CON(5)  (*)+5                            * 506AB  primitive code object
        ASSEMBLE
        GOSUB   SUB_5064F                        * 506B0
        A=-A-1  S                                * 506B4
        GOSBVL  RADDF                            * 506B7
        GOTO    L_505F4                          * 506BE

* refs (15): 4F444 4F44E 4F606 4F61F 4F63D 4F656 ...
* #sign #mag -> #n: 20-bit two's complement (#sign 0 = negative; magnitude capped at #7FFFF)
SgnMag>#:
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
        :: OutOfPICT(4s)? NOTcase TOGLINE3       * 5072B
          ChkPictLine(4s) OutOfPICT(4s)? DROP TOGLINE3 ; * 5073F

* #x1 #y1 #x2 #y2 ->
* refs (13): 45272 4549D 48B0C 4C2BF 4E59B 4E5AF ...
DRAWLINE#3:
        :: OutOfPICT(4s)? NOTcase LINEON3        * 50758
          ChkPictLine(4s) OutOfPICT(4s)? DROP LINEON3 ; * 5076C

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
        :: BINT4 ZERO_DO s=>ñr 4ROLL LOOP 3PICKOVER dist(2r) 5PICK 4PICK * 508E2
          dist(2r) %< ITE                        * 50914

Reverse4;true:
          :: SWAPROT 4ROLL TRUE ; FALSE          * 50923
          5UNROLL DUP 4PICK %- DUP %ABS 6UNROLL %0> DUP 8UNROLL IT 2SWAP * 50941
          3PICK3PICK %* OVER 6PICK %* %- 6PICK %/ GBUFFGROBDIM BINT9 PICK IT * 5097D
          SWAP                                   * 509B9
          DROP #1- UNCOERCE 5PICK OVER %> ITE    * 509BE
          :: 5ROLLDROP 5ROLL 5PICK %- 6PICK %/ OVER 6UNROLL %* OVER %+ * 509E1
            5UNROLL ;                            * 50A1D
          DROP                                   * 50A27
          OVER %0< ITE                           * 50A2C

* 1 2 3 -> 3 %0
UNROT2DROP%0:
          :: ROTROT2DROP %0_2A2B4 ; DROP         * 50A3B
          5ROLLDROP 5ROLL IT                     * 50A54

swap(1,3);4roll:
          :: SWAPROT 4ROLL ;                     * 50A63
          BINT4 ZERO_DO BINT1 OVER %0< IT DROPZERO * 50A77
          SWAP %ABS COERCE SgnMag># 4ROLL LOOP 5ROLL NOT?SEMI * 50A9A
          2SWAP ;                                * 50AC2

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
        :: INDEX@ #1+ GetEqN NOTcase ERRJMP      * 50D02
        ;                                        * 50D20

        :: BINT8 BINT50 MAKEGROB                 * 50D25

{Π'PlotEnv}:
          {                                      * 50D39

* refs (1): 8D1EC
Π'PlotEnv_50D3E:
            LAM 'PlotEnv }                       * 50D3E
          BIND BINT18 ' nohalt CACHE ;           * 50D5A

* refs (3): 4BC60 4C143 4C512
LASTPT?:
        :: 15GETLAM 16GETLAM %< NOTcase TRUE     * 50D78
          ATTNFLG@ #0<> ;                        * 50D96

* refs (3): 4BC6A 4C14D 4C51C
PlotOneMore?:
        :: ATTNFLG@ #0= 15GETLAM 16GETLAM %= AND ; * 50DA5

* refs (2): 4B76A 50E09
StatPlotMo:
        :: GETPTYPE DUP 'IDSCATTER EQOVER 'IDHISTOGRAM EQOR SWAP 'IDBAR EQOR ; * 50DCD

* refs (1): 4E780
LookForEQ/äDAT:
        :: StatPlotMo DUP ITE STATRCL EQUATION   * 50E04
          case2DROP RDROP                        * 50E22
          ITE LookForEQ/äDAT~2 LookForEQ/äDAT~1  * 50E2C
          OBJ_6BC2D ;                            * 50E3B

* refs (1): 50E36
LookForEQ/äDAT~1:
        # 104                                    * 50E45  260

* refs (1): 50E31
LookForEQ/äDAT~2:
        # 602                                    * 50E4F  1538

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
{GRAPH\DOT-}~2:
        :: 3GETLAM #1= ;                         * 50EBB

* refs (1): 3E76B
{GRAPH\+/-}~1:
        :: CHECKMENU OBJ_50EE3 ;                 * 50ECF

* refs (2): 4D8D0 50ED9
OBJ_50EE3:
        :: TakeOver CROSSMARKOFF BINT32 OBJ_50F2E ITE ClrSysFlag SetSysFlag * 50EE3
          OBJ_5102B MENUOFF? OR ?SKIP DispMenu   * 50F0B
          CROSSMARKON ;                          * 50F24

* refs (4): 3E761 484E0 4DB27 50EF7
OBJ_50F2E:
        :: BINT32 TestSysFlag ;                  * 50F2E

* refs (1): 49E2A
ChkEQ(eq)~1:
        :: BINT3 SWAP INNERDUP ONE_EQ NOTcase    * 50F42

* ob meta -> F
dropDROPf:
          :: NDROP DROPFALSE ;                   * 50F60
          DROP 'IDPAR OBJ_4735A ITE              * 50F74
          :: DROP CHECKPVARS ROT NTHCOMDDUP TYPELIST? ?CARCOMP ; * 50F88
          :: SWAP #3= ITE                        * 50FB0

~X:
            :: '                                 * 50FC4

X_50FCE:
              ID X ;                             * 50FCE

~Y:
            :: '                                 * 50FDC

Y:
              ID Y ;                             * 50FE6
          ;                                      * 50FF4
          EQUAL ;                                * 50FF9

* refs (1): 49E34
ChkEQ(eq)~2:
        :: OVER INCOMPDROP OVER FINDVAR NTHOF #0= ; * 51003

* refs (19): 0C839 0C866 46C2F 46C8E 46E37 46E64 ...
* Probably: PICTURE: TRUE when the menu area shows the x/y readout (lam 16 = 1)
OBJ_5102B:
        :: 16GETLAM #1= ;                        * 5102B

* refs (12): 451D7 4AF81 4AFBD 4B01C 4B044 4B080 ...
PutBackPPAR(_,s):
        :: Chk&BreakPPAR 8PICK ROLLDROP 8ROLL 8ROLL UNROLL StoInPPAR(7_) ; * 5103F

* refs (2): 4AB62 51062
StoInPPAR(7_):
        :: BINT7 {}N 'IDPAR STOAPPLDATA ;        * 5106C
        NIBHEX  00000                            * 5108A  ..

* refs (2): 4CEDD 4D961
OBJ_5108F:
        :: ClrDAsOK ExitFcn ABND COLA_EVAL ;     * 5108F

* -> id
* refs (21): 471DD 47683 4817A 48A35 48CBF 49BAA ...
INDEPVAR:
        :: GETINDEP 1get(li)? ;                  * 510AD

* refs (19): 47422 4D975 4E90B 510B7 A3A5E A3A78 ...
1get(li)?:
        :: DUPTYPELIST? ?CARCOMP ;               * 510C1

* refs (6): 46C7F 47C09 4A07D 4E762 4EC21 4EC3F
RECORDX&YC%:
        :: 8GETLAM UNCOERCE%% 6GETLAM %%- 10GETLAM %%/>% 7GETLAM UNCOERCE%% * 510D5
          5GETLAM SWAP %%- 9GETLAM %%/>% %>C% ;  * 51102

* ->
* refs (4): 2DA72 4E730 73B66 8C695
CLEARMENU:
        :: HARDBUFF2 ZEROZERO BINT131 BINT8 GROB!ZERODRP ; * 51125

* xPICT ->
* refs (7): 20CB2 20F8F 4F381 4F74B 4FA39 4FC00 ...
CKPICT:
        :: ' xPICT EQUALNOTcase SETTYPEERR       * 51148
        ;                                        * 51161

* ->
* refs (23): 4C48B 4CF0A 4E2C0 4E88E 4F057 4F3B8 ...
CHECKPICT:
        :: GBUFF DUPGROBDIM 2DUP 2#0=OR case     * 51166
          :: 3DROP BINT64 BINT131 MAKEGROB GROB>GDISP ; * 51184
          BINT131 OVER#> ITE                     * 511A7
          :: BINT131 SWAP#- 3PICKSWAP BROADENGROB ; DROP * 511B6
          CHECKHEIGHT ;                          * 511D9

* grob #height ->
* refs (2): 4E2DE 511D9
CHECKHEIGHT:
        :: BINT64 OVER#> NOTcase2DROP BINT64     * 511E3
          SWAP#- HEIGHTENGROB ;                  * 511FC

* refs (16): 49F2E 49F6F 49FAB 4AC39 4AC6B 4ADB5 ...
RclMaxStdPict:
        :: GBUFFGROBDIM OBJ_5121F ;              * 5120B

* refs (2): 4B34B 51215
OBJ_5121F:
        :: DUP BINT131 #< IT                     * 5121F

drop;<83>:
          :: DROP BINT131 ;                      * 51238
          SWAPDUP BINT64 #< IT                   * 5124C

drop;<40>:
          :: DROP BINT64 ;                       * 51260
          SWAP ;                                 * 51274

* -> id
* refs (8): 473EB 4968C 4AA41 4AAAE 4AB67 4EEEC ...
'IDPAR:
        :: '                                     * 5127E

PPAR:
          ID PPAR ;                              * 51288

* -> xFUNCTION
* refs (10): 45EEC 481AC 48FC7 490E4 4AB4F 4ABD5 ...
'IDFUNCTION:
        :: ' xFUNCTION ;                         * 5129C

* -> xCONIC
* refs (2): 8C932 B59FD
'IDCONIC:
        :: ' xCONIC ;                            * 512B0

* -> xPOLAR
* refs (4): 49071 4A91E 8CA07 B59D5
'IDPOLAR:
        :: ' POLAR ;                             * 512C4

* -> xPARAMETRIC
* refs (6): 48F54 4909E 8A108 8AC57 8CB4B B5A4D
'IDPARAMETER:
        :: ' xPARAMETRIC ;                       * 512D8

* -> xTRUTH
* refs (2): 8CC89 B5A25
'IDTRUTH:
        :: ' xTRUTH ;                            * 512EC

* -> xSCATTER
* refs (5): 0C7D0 20196 50DDC 8CD5E B5AF8
'IDSCATTER:
        :: ' xSCATTER ;                          * 51300

* -> xHISTOGRAM
* refs (4): 20171 50DE6 8CE42 B5AA8
'IDHISTOGRAM:
        :: ' xHISTOGRAM ;                        * 51314

* -> xBAR
* refs (4): 2013D 50DF5 8CF30 B5AD0
'IDBAR:
        :: ' xBAR ;                              * 51328

* refs (2): 4C3A0 4CDF7
PtoR:
        :: %POL>%REC SWAP GETXPOS SWAP GETYPOS ; * 5133C

* refs (11): 489B8 489D6 4B6CF 4BF26 4C189 4EE01 ...
OBJ_5135F:
        :: ERRSET EVALCRUNCH ERRTRAP             * 5135F
          :: ERROR@ # 100 #/ SWAPDROP BINT3 #<>case ERRJMP * 51373
            ERRORCLR BINT31 TestSysFlag ?SKIP OBJ_4C251 * 513A0
            2RDROP ;                             * 513B9
          0LASTOWDOB! CK1NOLASTWD U>nbr ;        * 513C3

* refs (1): 4BD69
OBJ_513D7:
        :: OBJ_51427 NOT?SEMI                    * 513D7
          %1 SWAP UNROLL ::N ;                   * 513E6

* refs (1): 4BD73
OBJ_513FF:
        :: OBJ_51427 NOT?SEMI                    * 513FF
          %-1 SWAP UNROLL ::N ;                  * 5140E

* refs (2): 513DC 51404
OBJ_51427:
        :: DUP'                                  * 51427

s1:
          ID s1 EQUALPOSCOMP DUP#0=case FALSE    * 51431
          SWAPINCOMP DUPDUP #3+ ROLL #- #2+ DUP#1+ ROLLDROP TRUE ; * 5144B

* refs (4): 49B8C 49DF8 4B738 514B4
1stArgRpn(ex):
        :: INNERCOMP plDRPpZparg NDROP ;         * 5147D

* refs (4): 49D9E 49DE9 4B634 4D984
1stArgb(ex):
        :: INNERCOMP plDRPpZparg SWAPUnNDROP ;   * 51496

* refs (8): 476E2 48959 489A9 4903A 49E20 49E9D ...
GETRHS:
        :: 1stArgRpn(ex) ::N ;                   * 514AF

* refs (24): 45F7B 45F8F 4AA0A 4AA23 4AA32 4AA3C ...
* flag -> : Invalid PPAR error unless the flag is TRUE
NOT?INVPPAR:
        :: ?SKIP SETINVPPAR                      * 514C3
        ;                                        * 514D2
        NIBHEX  00000                            * 514D7  ..

* -> 6.28318530718 -> 360. -> 400.
* refs (5): 49085 4A937 4FDDB A89D3 B5444
1REV:
        :: RAD? case                             * 514DC

* 2pi
%2PI:
          % 6.28318530718E0                      * 514EB
          DEG? case %360                         * 51500
          %400 ;                                 * 5150F

* refs (1): 51537
break;<>2?:BAV!:
        :: INNERCOMP #2= NcaseSIZEERR ;          * 51519

* { hxs hxs' } -> # #'
* refs (15): 4F03B 4F0B1 4F45D 4F48F 4F4C1 4F557 ...
2HXSLIST?:
        :: break;<>2?:BAV! DUP TYPEHSTR? NcaseSIZEERR OVER * 51532
          TYPEHSTR? NcaseSIZEERR 2HXS>#          * 51550
        ;                                        * 5155F

* refs (3): 4F061 4F796 4F9D5
InGrob(2s,go)?#:BAV!:
        :: InGrob(2s,go)? NcaseSIZEERR ;         * 51564

* refs (3): 4EA50 4F502 51569
InGrob(2s,go)?:
        :: GROBDIM 4PICK #> SWAP3PICK #> AND ;   * 51578

* -> #y
* refs (10): 46D47 4D367 515B9 51631 516EF 5170D ...
TOPROW:
        :: WINDOWCORNER DROP ;                   * 515A0

* -> #y
* refs (5): 46D60 49F29 4D682 5164A 6CA30
BOTROW:
        :: TOPROW RclRowMenu #+ ;                * 515B4

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
        :: WINDOWCORNER SWAPDROP ;               * 515FA

* -> #x
* refs (6): 46D06 49F24 4D58D 5167C 73C49 73CD0
RIGHTCOL:
        :: LEFTCOL BINT131 #1- #+ ;              * 5160E

* -> flag
* refs (4): 48242 4D353 4D411 4DCF6
WINDOWTOP?:
        :: TOPROW 7GETLAM #= ;                   * 5162C

* -> flag
* refs (4): 481E3 4D66E 4D72C 4DD7D
WINDOWBOT?:
        :: BOTROW 7GETLAM #= ;                   * 51645

* -> flag
* refs (4): 470EE 48828 4D47F 4DDB9
WINDOWLEFT?:
        :: LEFTCOL 8GETLAM #= ;                  * 5165E

* -> flag
* refs (4): 470BC 48436 4D57E 4DDF0
WINDOWRIGHT?:
        :: RIGHTCOL 8GETLAM #= ;                 * 51677

* ->
* refs (3): 4CFC0 4D35D 9CF8E
JUMPTOP:
        :: TakeOver LEFTCOL ZEROSWAP WINDOWXY ;  * 51690

* ->
* refs (3): 4D03D 4D678 9CF9D
JUMPBOT:
        :: TakeOver HARDHEIGHT RclRowMenu #1+ UNCOERCE2 %- COERCE LEFTCOL * 516AE
          WINDOWXY ;                             * 516DB

* ->
* refs (3): 4D006 4D489 9CFAC
JUMPLEFT:
        :: TakeOver TOPROW BINT0 WINDOWXY ;      * 516E5

* ->
* refs (3): 4D074 4D588 9CFBB
JUMPRIGHT:
        :: TakeOver TOPROW HBUFFDIMw BINT131 UNCOERCE2 %- COERCE WINDOWXY ; * 51703

* ->
* refs (15): 4B47D 4B49B 4B4B9 4B4D7 BB2BB BB35B ...
REPEATERCH:
        :: 'R'R DUP EVAL OVER REPKEY? NOTcase2DROP BEGIN * 51735
          2DUPSWAP REPKEY? WHILE                 * 5175D
          ::                                     * 5176C
            :: OBJ_4DCC6 EVAL ; ;                * 51771
          REPEAT 3DROP ;                         * 5178A
        NIBHEX  00000                            * 51799  ..

* grob -> grob #height #width
* refs (11): 4DC3F 4E6F9 4EB27 4EB72 4F38B 4F8D6 ...
DUPGROBDIM:
        :: DUP GROBDIM ;                         * 5179E

* refs (29): 0C947 0C9EA 4570D 481F2 48251 48328 ...
* Probably: PICTURE cursor position: -> #x #y (lams 8 and 7)
OBJ_517B2:
        :: 8GETLAM 7GETLAM ;                     * 517B2

* refs (4): 100DD 107ED 10806 10879
over;=?:drq:
        :: OVER EQ case                          * 517C6

drop;q:
          :: DROP RDROP ;                        * 517DA
        ;                                        * 517EE

* ob1 ob2 -> :: <ob1> ; ob1 ob2 -> :: ob1 <ob2> <rest> ;
* refs (15): 4A9E2 4A9F1 4F031 50497 504D8 504E7 ...
EQUALcasedrop:
        :: OVER EQUAL case                       * 517F3

drop;dq_51807:
          :: DROP COLA COLA                      * 51807
          ;                                      * 5181B
          COLA SKIP                              * 51820
        ;                                        * 5182A

* -> #
* refs (34): 2D95B 318BD 31A39 31A43 39C34 39D6F ...
ISTOP-INDEX:
        :: ISTOP@ INDEX@#- ;                     * 5182F

* # ob -> #+1 ob
* refs (29): 14A0A 14A5F 170E5 2FE52 39C4D 3A18E ...
SWAP#1+SWAP:
        :: SWAP#1+ SWAP ;                        * 51843

* # ob -> #-1 ob
* refs (8): 573A1 64390 90F37 925B0 92F4D 9326A ...
SWAP#1-SWAP:
        :: SWAP#1- SWAP ;                        * 51857

* refs (1): 6BF5B
OBJ_5186B:
        :: DROP DoBadKey ;                       * 5186B

* -> #height #width
* refs (12): 45785 4CD0C 4CF0F 4D1E1 4E79E 4E7B2 ...
GBUFFGROBDIM:
        :: GBUFF GROBDIM ;                       * 5187F

* #x1 #y1 #x2 #y2 -> #x1' #y1' #x2' #y2'
* refs (4): 45712 4E587 4EBF4 4FB97
ORDERXY#:
        :: 4PICK 3PICK #> IT 2SWAP               * 51893
          3PICKOVER #> IT SWAPROT                * 518B1
        ;                                        * 518C5

* %x1 %y1 %x2 %y2 -> %x1' %y1' %x2' %y2'
* refs (2): 4B215 4E7C1
ORDERXY%:
        :: 4PICK 3PICK %> IT 2SWAP               * 518CA
          3PICKOVER %> IT SWAPROT                * 518E8
        ;                                        * 518FC

* refs (1): 4A8D8
OBJ_51901:
        :: 16PUTLAM 2SWAP RclMaxStdPict OBJ_4F2CD 5PUTLAM 9PUTLAM 6PUTLAM * 51901
          10PUTLAM OBJ_4B9D6 ;                   * 51929
        NIBHEX  000                              * 51938  .

* (Q%%1,%%0Q)
* refs (3): 37A68 92646 92AAB
C%%1:
        C%% 1E0 0E0                              * 5193B

* (-1,0)
* refs (3): 56511 5B97E 5F28F
C%-1:
        C% -1E0 0E0                              * 5196A

* ob -> %0
* refs (3): 1C828 368D6 54B23
DROP%0:
        :: DROP %0_2A2B4 ;                       * 5198F

* C% -> %re
* refs (7): 1C7E3 1DF94 4A082 4A941 4A94B 4B116 ...
C>Re%:
        :: C%>% DROP ;                           * 519A3

* C% -> %im
* refs (2): 1C832 52845
C>Im%:
        :: C%>% SWAPDROP ;                       * 519B7

* C% -> %%re %%im
* refs (19): 37D28 51D8D 51D97 51ED7 51EE1 520DF ...
C%>%%:
        :: C%>%%SWAP SWAP ;                      * 519CB

* C% -> %%im %%re
* refs (1): 519D0
C%>%%SWAP:
        :: C%>% %>%%SWAP %>%% ;                  * 519DF

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
        :: DUP _*(2r);r=>rr SWAPDUP _*(2r);r=>rr %%+ ; * 51A71

* %% -> %%'
* refs (11): 37969 37D5F 51EAF 5208A 520BC 52260 ...
%%SQR:
        :: DUP %%*SWAP DUP %%* %%+ ;             * 51A94

* % %' -> %max %min
* refs (4): 51FA4 51FC2 51FCC 52008
%MAXIMIZE:
        :: DUP%0= ?SEMI                          * 51AB7
          %0> case %MAXREAL                      * 51AC6
          %-MAXREAL ;                            * 51AD5

* refs (5): 51D9C 51DEC 51EE6 51F27 523BA
ãcplx(4rr):
        :: ROT2DUP %%* 5UNROLL 3PICK %%* 4UNROLL 3PICK %%*UNROT %%* 4ROLL * 51ADF
          %%- 3UNROLL %%+ ;                      * 51B16

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
        :: SWAP C%R+C ;                          * 51BD0

* ob % %' -> %+%' ob
* refs (4): 4FD90 4FDA4 51C07 51C2F
%+SWAP:
        :: %+ SWAP ;                             * 51BE4

* % C% -> C%'
* refs (3): 1AB80 51BDA 51CDE
C%R+C:
        :: C%>% 3UNROLL %+SWAP %>C% ;            * 51BF8

* C% C%' -> C%''
* refs (5): 1AB94 4FC9B 4FCFF 51D06 8C3FE
C%C+C:
        :: SWAP2C%>% ROT %+ 3UNROLL %+SWAP %>C% ; * 51C16

* C%% C%%' -> C%%''
* refs (5): 37C02 51D1A 92E5D 92F11 CB7A7
C%%C+C:
        :: SWAP2C%%>%% ROT %%+ 3UNROLL %%+ SWAP %%>C%% ; * 51C3E

* C% C%' -> %re %im %re' %im'
* refs (8): 4ACED 4B210 4B2D8 4E7E9 4E825 4E8DE ...
SWAP2C%>%:
        :: C%>% ROT C%>% ;                       * 51C6B

* C%% C%%' -> %%re %%im %%re' %%im'
* refs (3): 37955 51C43 51DE7
SWAP2C%%>%%:
        :: C%%>%% ROT C%%>%% ;                   * 51C84

* C%% %% -> C%%'
* refs (2): 37BF8 51D42
C%%C+R:
        :: SWAP C%%R+C ;                         * 51C9D

* %% C%% -> C%%'
* refs (3): 37BFD 51CA7 51D2E
C%%R+C:
        :: C%%>%% 3UNROLL %%+ SWAP %%>C%% ;      * 51CB1

* % C% -> C%'
* refs (1): 1AD22
C%R-C:
        :: C%CHS C%R+C ;                         * 51CD4

* C% % -> C%'
* refs (1): 1AD2C
C%C-R:
        :: %CHS C%C+R ;                          * 51CE8

* C% C%' -> C%''
* refs (3): 1AD36 4FCD2 8C3F4
C%C-C:
        :: C%CHS C%C+C ;                         * 51CFC

* C%% C%%' -> C%%''
* refs (5): 37C25 92E3F 92F25 CB79D CB7D9
C%%C-C:
        :: C%%CHS C%%C+C ;                       * 51D10

* %% C%% -> C%%'
* refs (1): 37C20
C%%R-C:
        :: C%%CHS C%%R+C ;                       * 51D24

* C%% %% -> C%%'
* refs (1): 37C1B
C%%C-R:
        :: %%CHS C%%C+R ;                        * 51D38

* C% % -> C%'
* refs (1): 1AE11
C%C*R:
        :: SWAP C%R*C ;                          * 51D4C

* % C% -> C%'
* refs (2): 1AE07 51D56
C%R*C:
        :: C%>% UNROTOVER %* 3UNROLL %* %>C% ;   * 51D60

* refs (2): 1AE1B 1B499
C%C*C_51D88:
        :: C%>%% ROT C%>%% ãcplx(4rr) %%>C% ;    * 51D88

* C%% %% -> C%%'
* refs (6): 37C3E 92E49 CB789 CB798 CB7C5 CB7D4
C%%C*R:
        :: SWAP C%%R*C ;                         * 51DAB

* %% C%% -> C%%'
* refs (3): 37C43 51DB5 CB7ED
C%%R*C:
        :: C%%>%% UNROTOVER %%*UNROT %%* %%>C%% ; * 51DBF

* C%% C%%' -> C%%''
* refs (4): 37C48 92AF1 92E03 92E53
C%%C*C:
        :: SWAP2C%%>%% ãcplx(4rr) %%>C%% ;       * 51DE2

* refs (4): 51E55 51EEB 51F2C 51F8B
axy=>(x/a,y/a):
        :: UNROTOVER %%/ 3UNROLL %%/ ;           * 51DFB

* % C% -> C%'
* refs (2): 1AF1E 51F09
C%R/C:
        :: C%0=case C%R/C~1                      * 51E19
          C%>% 2DUP 2%>%%SQR 4UNROLL UNROTOVER _*(2r);r=>rr 3UNROLL * 51E28
          _*(2r);r=>rr %%CHS axy=>(x/a,y/a) %%>C% ; * 51E4B

* C% % -> C%'
* refs (1): 1AF28
C%C/R:
        :: %0=case OBJ_51FB3                     * 51E64
          SWAP C%>% UNROTOVER %/ 3UNROLL %/ %>C% ; * 51E73

* refs (2): 51EDC 51F1D
OBJ_51E9B:
        :: %%CHS                                 * 51E9B

* refs (1): 51F45
C%%R/C~1:
          :: 2DUP %%SQR 4UNROLL ; ROT ;          * 51EA5

* C% C%' -> C%''
* refs (1): 1AF32
C%C/C:
        :: C%0=case OBJ_51FB3                    * 51EC8
          C%>%% OBJ_51E9B C%>%% ãcplx(4rr) axy=>(x/a,y/a) %%>C% ; * 51ED7

* C% -> 1/C%
* refs (1): 1B291
C%1/:
        :: %1 SWAP C%R/C ;                       * 51EFA

* C%% C%%' -> C%%''
* refs (2): 37C6B 92F1B
C%%C/C:
        :: C%%>%% OBJ_51E9B C%%>%% ãcplx(4rr) axy=>(x/a,y/a) %%>C%% ; * 51F13

* %% C%% -> C%%'
* refs (1): 37C66
C%%R/C:
        :: C%%>%% C%%R/C~1 3PICK %%*UNROT %%* 3PICK %%/ SWAPROT %%/ %%CHS * 51F3B
          %%>C%% ;                               * 51F72

* C%% %% -> C%%'
* refs (2): 37C61 92AFB
C%%C/R:
        :: SWAP C%%>%% axy=>(x/a,y/a) %%>C%% ;   * 51F7C

* refs (1): 51E23
C%R/C~1:
        :: OBJ_52017 %MAXIMIZE Re>C% ;           * 51F9A

* refs (2): 51E6E 51ED2
OBJ_51FB3:
        :: OBJ_52017 C%>% %MAXIMIZE SWAP %MAXIMIZE SWAP%>C% ; * 51FB3

* refs (2): 521F7 522C9
OBJ_51FDB:
        :: OBJ_5203A DROP %-MAXREAL Re>C% ;      * 51FDB

* refs (1): 526DD
C%ATAN~1:
        :: OBJ_5203A C%>% %MAXIMIZE %>C% ;       * 51FF9
