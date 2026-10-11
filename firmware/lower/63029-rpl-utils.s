* HP 48GX ROM revision R, #63029-#660FB: Control structures and stack utilities
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: MINUSONE CHR_D #<>case 1GETABND ZEROZERO TWO{}N #=casedrpfls DUPLENCOMP SWAP3PICK BINT131 caseTRUE ONEONE
* Follows on from the previous file (at #63029 in the original ROM).
        RPL

* 1 2 3 -> 1 2 1
* refs (8): 10554 10667 106AD 2798B 32039 3406A ...
DROPOVER:
        ::                                       * 63029
          DROP                                   * 6302E
          OVER                                   * 63033
        ;                                        * 63038

* ob3 ob1 ob2 -> ob3 flag ob3
* refs (2): 16F4D 50DE1
EQOVER:
        ::                                       * 6303D
          EQ                                     * 63042
          OVER                                   * 63047
        ;                                        * 6304C

* ob # #' -> ob #+#' ob
* refs (7): 10388 4FAD4 4FB51 5E3D9 60554 6079D ...
#+OVER:
        ::                                       * 63051
          #+                                     * 63056
          OVER                                   * 6305B
        ;                                        * 63060

* ob # #' -> ob #-#' ob
* refs (2): 1012D 5F9A5
#-OVER:
        ::                                       * 63065
          #-                                     * 6306A
          OVER                                   * 6306F
        ;                                        * 63074

* ob -> ob #0 ob
* refs (13): 0B5D9 4548E 546ED 65C45 66039 6CD35 ...
ZEROOVER:
        ::                                       * 63079
          BINT0                                  * 6307E
          OVER                                   * 63083
        ;                                        * 63088

* 1 2 3 -> 3 1 2 1
* refs (21): 103DD 10536 25063 3F46A 4F75A 4FA48 ...
UNROTOVER:
        ::                                       * 6308D
          3UNROLL                                * 63092
          OVER                                   * 63097
        ;                                        * 6309C

* 1 2 3 4 -> 2 3 4 1 4
* refs (17): 292B1 2C446 36732 52903 908F9 921FA ...
4ROLLOVER:
        ::                                       * 630A1
          4ROLL                                  * 630A6
          OVER                                   * 630AB
        ;                                        * 630B0

* 1 2 3 -> 1 2 3 1 3
* refs (26): 1947A 2C8F5 2CA17 339E5 3A0A8 4838C ...
3PICKOVER:
        ::                                       * 630B5
          3PICK                                  * 630BA
          OVER                                   * 630BF
        ;                                        * 630C4

* 1 2 3 4 -> 1 2 3 4 1 4
* refs (16): 364D0 364E9 4E596 4E5A5 6A622 6F7AC ...
4PICKOVER:
        ::                                       * 630C9
          4PICK                                  * 630CE
          OVER                                   * 630D3
        ;                                        * 630D8

* n..1 #n -> n..1 #n n-1
* refs (4): 1045A 10969 6AF5F 6C3F2
DUPPICK:
        ::                                       * 630DD
          DUP                                    * 630E2
          PICK                                   * 630E7
        ;                                        * 630EC

* 1..n #n -> 1 3..n #n 2
* refs (10): 101E4 1027A 102CA 10306 1073E 1078E ...
DUPROLL:
        ::                                       * 630F1
          DUP                                    * 630F6
          ROLL                                   * 630FB
        ;                                        * 63100

* meta ob -> ob meta
* refs (20): 0B6CE 0B6DD 108A6 28084 4403E 5480A ...
OVER#2+UNROL:
        ::                                       * 63105
          OVER                                   * 6310A
          #2+UNROLL                              * 6310F
        ;                                        * 63114

* 1..8 -> 8 1..7
* refs (18): 2954D 45209 4AD33 4AED2 4AEFA 5096E ...
8UNROLL:
        ::                                       * 63119
          BINT8                                  * 6311E
          UNROLL                                 * 63123
        ;                                        * 63128

* 1..10 -> 10 1..9
* refs (5): 29435 42F5D 42F62 567DC 65A79
10UNROLL:
        ::                                       * 6312D
          BINT10                                 * 63132
          UNROLL                                 * 63137
        ;                                        * 6313C

* [] ob -> [] ob #elts
* refs (11): 1DCAF 2C3D8 2C3DD 3670A 3670F 369F3 ...
OVERARSIZE:
        ::                                       * 63141
          OVER                                   * 63146
          ARSIZE                                 * 6314B
        ;                                        * 63150

* -> ERRJMP
* refs (8): 41FBA 4305C 43739 69C23 8D38C CE344 ...
'ERRJMP:
        ::                                       * 63155
          '                                      * 6315A
          ERRJMP                                 * 6315F
        ;                                        * 63164

* T -> :: ERRJMP ; F -> :: <ob> <rest> ;
* refs (5): 14672 38769 641B8 8560A 9ADBB
caseERRJMP:
        ::                                       * 63169
          case                                   * 6316E
          ERRJMP                                 * 63173
        ;                                        * 63178

* comp T -> ob comp F -> comp
* refs (9): 16C84 4B40F 50FA6 510CB 8AAD2 8AAEB ...
?CARCOMP:
        ::                                       * 6317D
          NOT?SEMI                               * 63182
          CARCOMP                                * 63187
        ;                                        * 6318C

* $ -> "$\0a"
* refs (8): 16211 268B3 31BB5 31C0A 31C0F 31D0D ...
NEWLINE$&$:
        ::                                       * 63191
          NEWLINE$                               * 63196
          &$                                     * 6319B
        ;                                        * 631A0

* ob1..obn #n+1 -> {}
* refs (2): 2E696 9F620
#1-{}N:
        ::                                       * 631A5
          #1-                                    * 631AA
          {}N                                    * 631AF
        ;                                        * 631B4

* ob1 ob2 -> { ob1 ob2 }
* refs (71): 05E90 0EFE4 19439 19551 1C62D 1D331 ...
TWO{}N:
        ::                                       * 631B9
          BINT2                                  * 631BE
          {}N                                    * 631C3
        ;                                        * 631C8

* ob1 ob2 ob3 -> { ob1 ob2 ob3 }
* refs (15): 2F1D5 2F315 2FAD3 342CF 4B3BF 4B446 ...
THREE{}N:
        ::                                       * 631CD
          BINT3                                  * 631D2
          {}N                                    * 631D7
        ;                                        * 631DC

* comp -> comp obn..ob1 #n
* refs (5): 1870B 1D05E A2E4D C9558 CAB12
DUPINCOMP:
        ::                                       * 631E1
          DUP                                    * 631E6
          INNERCOMP                              * 631EB
        ;                                        * 631F0

* comp obj -> obj obn..ob1 #n
* refs (8): 0E4E3 2FC18 37E69 5144B 8506B 85678 ...
SWAPINCOMP:
        ::                                       * 631F5
          SWAP                                   * 631FA
          INNERCOMP                              * 631FF
        ;                                        * 63204

* ob -> ob flag
* refs (13): 14114 17086 177CF 2F8A3 321CF 3B668 ...
DUPNULL$?:
        ::                                       * 63209
          DUP                                    * 6320E
          NULL$?                                 * 63213
        ;                                        * 63218

* comp -> comp flag
* refs (32): 1EF23 20F3A 21E05 319DF 31AD4 31CF9 ...
DUPNULLCOMP?:
        ::                                       * 6321D
          DUP                                    * 63222
          NULLCOMP?                              * 63227
        ;                                        * 6322C

* comp -> comp #n
* refs (56): 156F9 193DF 2594D 28DD0 2DC43 330F8 ...
DUPLENCOMP:
        ::                                       * 63231
          DUP                                    * 63236
          LENCOMP                                * 6323B
        ;                                        * 63240

* $ #start #end+#1 -> $'
* refs (4): 405D0 B87B3 B87EF B8A40
#1-SUB$:
        ::                                       * 63245
          #1-                                    * 6324A
          SUB$                                   * 6324F
        ;                                        * 63254

* $ #end -> $'
* refs (13): 2F45F 2F60F 3223D 69369 6B781 6E6D6 ...
1_#1-SUB$:
        ::                                       * 63259
          #1-1SWAP                               * 6325E
          SUB$                                   * 63263
        ;                                        * 63268

* $ #start -> $'
* refs (9): 15D1A 2F437 2F605 314D6 32215 42CD3 ...
LAST$:
        ::                                       * 6326D
          MINUSONE                               * 63272
          SUB$                                   * 63277
        ;                                        * 6327C

* $ #start-#1 -> $'
* refs (5): 2F306 2F455 309FB 32247 4134B
#1+LAST$:
        ::                                       * 63281
          #1+                                    * 63286
          LAST$                                  * 6328B
        ;                                        * 63290

* $ -> $ ID
* refs (3): 0FF07 24618 24627
DUP$>ID:
        ::                                       * 63295
          DUP                                    * 6329A
          $>ID                                   * 6329F
        ;                                        * 632A4

* %im %re -> C%
* refs (5): 35F08 4B5DF 4B5F8 4F16F 51FD1
SWAP%>C%:
        ::                                       * 632A9
          SWAP                                   * 632AE
          %>C%                                   * 632B3
        ;                                        * 632B8

* -> NOP
* refs (18): 3EC8A 40BBA 4108F 4901C 4CE92 4CEF1 ...
'NOP:
        ::                                       * 632BD
          '                                      * 632C2
          NOP                                    * 632C7
        ;                                        * 632CC

* ob1..obn #n -> ?
* refs (4): 148B1 14A3C 14AD7 14BD6
::NEVAL:
        ::                                       * 632D1
          ::N                                    * 632D6
          EVAL                                   * 632DB
        ;                                        * 632E0

* -> ?
* refs (7): 54E16 54E39 54E43 557D8 55864 5589B ...
2GETEVAL:
        ::                                       * 632E5
          2GETLAM                                * 632EA
          EVAL                                   * 632EF
        ;                                        * 632F4

* ob ->
* refs (8): 098C7 21E46 3302B 576BC 576D0 57BA4 ...
DROPRDROP:
        ::                                       * 632F9
          DROP                                   * 632FE
          RSWAP                                  * 63303
          RDROP                                  * 63308
        ;                                        * 6330D

* Does SWAP, then COLA.
* refs (11): 092E4 16C66 16FE8 1F104 21417 2504A ...
SWAPCOLA:
        ::                                       * 63312
          SWAP                                   * 63317
          COLACOLA                               * 6331C
        ;                                        * 63321

* Does UNROT2DROP, then COLA.
* refs (4): 16BCD 16D7C 171E4 17216
XYZ>ZCOLA:
        ::                                       * 63326
          ROTROT2DROP                            * 6332B
          COLACOLA                               * 63330
        ;                                        * 63335

* #0 -> :: <ob2> <rest> ; # -> :: <ob1> <rest> ;
* refs (18): 0B5DE 146B3 1584B 17CBA 17DAA 17E34 ...
#0=?SKIP:
        ::                                       * 6333A
          #0=                                    * 6333F
          COLA                                   * 63344
          ?SKIP                                  * 63349
        ;                                        * 6334E

* #1 -> :: <ob2> <rest> ; # -> :: <ob1> <rest> ;
* refs (7): 1D063 46CE3 46D3D 593FA 6A39D 91B80 ...
#1=?SKIP:
        ::                                       * 63353
          #1=                                    * 63358
          COLA                                   * 6335D
          ?SKIP                                  * 63362
        ;                                        * 63367

* #m #n -> :: <ob2> <rest> ; #m #n -> :: <ob1> <rest> ;
* refs (16): 1B151 1F8B6 239A2 35CE5 4C75B 4C79C ...
#=?SKIP:
        ::                                       * 6336C
          #=                                     * 63371
          COLA                                   * 63376
          ?SKIP                                  * 6337B
        ;                                        * 63380

* # -> flag
* refs (5): 1699B 17423 3A0F3 50F56 64381
ONE_EQ:
        ::                                       * 63385
          BINT1                                  * 6338A
          EQ                                     * 6338F
        ;                                        * 63394

* #m #n -> :: <ob1> <rest> ; #m #n -> :: <ob2> <rest> ;
* refs (3): 1F668 2C611 85E4E
#>?SKIP:
        ::                                       * 63399
          #>                                     * 6339E
          COLA                                   * 633A3
          ?SKIP                                  * 633A8
        ;                                        * 633AD

* Drops rest of current stream and skips one obj in above stream.
* refs (15): 17621 1DE0F 1DE50 21E4B 22F45 22FBF ...
COLASKIP:
        ::                                       * 633B2
          RDROPCOLA                              * 633B7
          SKIP                                   * 633BC
        ;                                        * 633C1

* flag ->
* refs (12): 17EE8 1813C 27634 2F64B 66892 66DA3 ...
NOT_UNTIL:
        ::                                       * 633C6
          NOT                                    * 633CB
          COLA                                   * 633D0
          UNTIL                                  * 633D5
        ;                                        * 633DA

* flag ->
* refs (9): 0B700 28BE6 2DAD6 2F998 31CFE 5AFEC ...
NOT_WHILE:
        ::                                       * 633DF
          NOT                                    * 633E4
          COLA                                   * 633E9
          WHILE                                  * 633EE
        ;                                        * 633F3

* # ->
* refs (6): 548F5 5B203 5DB8D 5DC41 5F2B7 5FA8B
DUP#0<>WHILE:
        ::                                       * 633F8
          DUP#0<>                                * 633FD
          COLA                                   * 63402
          WHILE                                  * 63407
        ;                                        * 6340C

* ob -> ob #
* refs (13): 20F58 2DC5C 41C2A 41C48 4340D 6EB5E ...
DUPINDEX@:
        ::                                       * 63411
          DUP                                    * 63416
          INDEX@                                 * 6341B
        ;                                        * 63420

* ob1 ob2 -> ob2 ob1 #
* refs (10): 17879 2C3F1 35C6D 360ED 36A11 7D00D ...
SWAPINDEX@:
        ::                                       * 63425
          SWAP                                   * 6342A
          INDEX@                                 * 6342F
        ;                                        * 63434

* ob1 ob2 -> ob1 ob2 ob1 #
* refs (3): 45623 8F186 8F2F5
OVERINDEX@:
        ::                                       * 63439
          OVER                                   * 6343E
          INDEX@                                 * 63443
        ;                                        * 63448

* ob1 ob2 -> ob2 ob1
* refs (4): 2DCC0 39D51 54CB8 5A605
SWAPLOOP:
        ::                                       * 6344D
          SWAP                                   * 63452
          COLA                                   * 63457
          LOOP                                   * 6345C
        ;                                        * 63461

* ob ->
* refs (1): 41C93
DROPLOOP:
        ::                                       * 63466
          DROP                                   * 6346B
          COLA                                   * 63470
          LOOP                                   * 63475
        ;                                        * 6347A

* #stop -> #stop
* refs (7): 546F7 57E30 5DE91 8507A 8E1E5 8E508 ...
DUP#0_DO:
        ::                                       * 6347F
          DUP                                    * 63484
          COLA                                   * 63489
          ZERO_DO                                * 6348E
        ;                                        * 63493

* {} -> {}
* refs (4): 20F53 41C25 41C43 43408
toLEN_DO:
        ::                                       * 63498
          DUP                                    * 6349D
          LENCOMP                                * 634A2
          COLA                                   * 634A7
          #1+_ONE_DO                             * 634AC
        ;                                        * 634B1

* -> 1lamob
* refs (91): 090A7 158C8 1D04F 1D6D4 1D6F7 1D71F ...
1GETABND:
        ::                                       * 634B6
          1GETLAM                                * 634BB
          ABND                                   * 634C0
        ;                                        * 634C5

* ob -> ob
* refs (7): 1DB60 1DC73 42D64 42E31 42E8B 43476 ...
DUP1LAMBIND:
        CON(5)  DupAndThen                       * 634CA  code object: the address of its machine code

* ob ->
* refs (24): 158A5 20F4E 58CE9 A27F7 A28DC A30DF ...
1LAMBIND:
        ::                                       * 634CF
          1NULLLAM{}                             * 634D4
          BIND                                   * 634D9
        ;                                        * 634DE

* T -> T F -> :: <ob1> <rest> ;
* refs (49): 093AC 0DFED 0FC0A 17428 18015 19B9F ...
caseTRUE:
        ::                                       * 634E3
          case                                   * 634E8
          COLATRUE                               * 634ED
        ;                                        * 634F2

* -> T F
* refs (16): 19AF8 24645 2D5B9 2D708 2F7B8 2F7D6 ...
TrueFalse:
        ::                                       * 634F7
          TRUE                                   * 634FC
          FALSE                                  * 63501
        ;                                        * 63506

* -> F T
* refs (7): 11142 43232 6FA59 B96DF D063D D5AF9 ...
FalseTrue:
        ::                                       * 6350B
          FALSE                                  * 63510
          TRUE                                   * 63515
        ;                                        * 6351A

* -> #0 F
* refs (10): 28B50 2E908 433AE 4346C 52D21 6C5B4 ...
ZEROFALSE:
        ::                                       * 6351F
          BINT0                                  * 63524
          FALSE                                  * 63529
        ;                                        * 6352E

* -> #1 F
* refs (7): 19B02 4372A 4D90C 8D37D BA6A6 DCC7C ...
ONEFALSE:
        ::                                       * 63533
          BINT1                                  * 63538
          FALSE                                  * 6353D
        ;                                        * 63542

* #m #n -> F #m #n -> :: #m <ob1> <rest> ;
* refs (61): 438F1 438FB 43905 4395A 43964 4396E ...
#=casedrpfls:
        ::                                       * 63547
          OVER                                   * 6354C
          #=                                     * 63551
          NOT?SEMI                               * 63556
          RDROP                                  * 6355B
          DROPFALSE                              * 63560
        ;                                        * 63565

* ob T -> F ob F -> :: ob <ob1> <rest> ;
* refs (19): 17446 2C284 3FC00 3FEC1 4314C 4388D ...
casedrpfls:
        ::                                       * 6356A
          NOT?SEMI                               * 6356F
          RDROP                                  * 63574
          DROPFALSE                              * 63579
        ;                                        * 6357E

* ob1 ob2 T -> F ob1 ob2 F -> :: ob1 ob2 <ob1> <rest> ;
* refs (10): 0F115 103E7 10540 3FA89 3FAAC 3FBEC ...
case2drpfls:
        ::                                       * 63583
          NOT?SEMI                               * 63588
          RDROP                                  * 6358D
          2DROPFALSE                             * 63592
        ;                                        * 63597

* T -> F F -> :: <ob1> <rest> ;
* refs (31): 0DFF7 108D8 18033 26A9B 26AC8 2F3D3 ...
caseFALSE:
        ::                                       * 6359C
          case                                   * 635A1
          RDROPFALSE                             * 635A6
        ;                                        * 635AB

* flag1 flag2 -> flag
* refs (11): 17261 2747C 2E7B8 34E76 408B9 53BD3 ...
ORNOT:
        ::                                       * 635B0
          OR                                     * 635B5
          NOT                                    * 635BA
        ;                                        * 635BF

* ob1 ob2 -> flag
* refs (10): 103E2 1053B 1EB56 399B6 3E698 42796 ...
EQUALNOT:
        ::                                       * 635C4
          EQUAL                                  * 635C9
          NOT                                    * 635CE
        ;                                        * 635D3

* ob1 ob2 -> ob1 ob2 flag
* refs (6): 0F3FD 0F425 36160 36200 648E0 B987C
2DUPEQ:
        ::                                       * 635D8
          2DUP                                   * 635DD
          EQ                                     * 635E2
        ;                                        * 635E7

* ob -> ob flag
DUPEQ::
        CON(5)  DupAndThen                       * 635EC  code object: the address of its machine code

* ob -> flag
* refs (2): 3EFD7 4165B
EQ::
        ::                                       * 635F1
          'R                                     * 635F6
          EQ                                     * 635FB
        ;                                        * 63600

* flag ob1 ob2 -> flag'
* refs (7): 17038 50DEB 50DFA 6F081 6F252 6F8C9 ...
EQOR:
        ::                                       * 63605
          EQ                                     * 6360A
          OR                                     * 6360F
        ;                                        * 63614

* flag ob1 ob2 -> flag'
* refs (16): 154A0 2DEBB 2FB0F 2FB1E 3E661 3E6AC ...
EQUALOR:
        ::                                       * 63619
          EQUAL                                  * 6361E
          OR                                     * 63623
        ;                                        * 63628

* # # -> flag
* refs (2): 4FBB0 5117A
2#0=OR:
        ::                                       * 6362D
          #0=                                    * 63632
          SWAP                                   * 63637
          #0=                                    * 6363C
          OR                                     * 63641
        ;                                        * 63646

* # #' -> # #' flag
* refs (19): 170BD 19425 1942A 1DAAC 1F3AE 219B8 ...
OVER#0=:
        ::                                       * 6364B
          OVER                                   * 63650
          #0=                                    * 63655
        ;                                        * 6365A

* # #' -> # flag
* refs (20): 1DBA1 1DCB4 3E6E3 4169C 441A6 448EE ...
OVER#<:
        ::                                       * 6365F
          OVER                                   * 63664
          #<                                     * 63669
        ;                                        * 6366E

* # -> flag
* refs (4): 28EF7 3062A 4DC99 4DCB7
#<3:
        ::                                       * 63673
          BINT3                                  * 63678
          #<                                     * 6367D
        ;                                        * 63682

* # -> # flag
* refs (13): 43888 4391E 43987 4D312 BAAC4 BAB3A ...
DUP#<7:
        ::                                       * 63687
          DUP                                    * 6368C
          BINT7                                  * 63691
          #<                                     * 63696
        ;                                        * 6369B

* comp -> obn..ob1 flag
* refs (7): 193F8 1952E 1DA3E 31B2E 31BCE 37E5A ...
INNER#1=:
        ::                                       * 636A0
          INNERCOMP                              * 636A5
          #1=                                    * 636AA
        ;                                        * 636AF

* # -> flag
* refs (5): 33625 3862E 4B89B 65E72 663B3
#5=:
        ::                                       * 636B4
          BINT5                                  * 636B9
          #=                                     * 636BE
        ;                                        * 636C3

* # -> flag
* refs (4): 1C6AC 2E623 2E80D B704A
#2<>:
        ::                                       * 636C8
          BINT2                                  * 636CD
          #<>                                    * 636D2
        ;                                        * 636D7

* # #' -> # flag
* refs (16): 104F5 1095A 42589 448DF 448FD 45E3D ...
OVER#>:
        ::                                       * 636DC
          OVER                                   * 636E1
          #>                                     * 636E6
        ;                                        * 636EB

* # -> flag
* refs (17): 22F9F 42953 48814 4CCAD 68DC8 6CB89 ...
#>1:
        ::                                       * 636F0
          BINT1                                  * 636F5
          #>                                     * 636FA
        ;                                        * 636FF

* # #' -> # #' #+#'
* refs (8): 44DC7 584DF 5E3CA 6075C 8D98D 8DAD8 ...
2DUP#+:
        ::                                       * 63704
          2DUP                                   * 63709
          #+                                     * 6370E
        ;                                        * 63713

* # ob #' -> ob #'+#
* refs (10): 2C3C4 41E14 5FFF9 669A1 6AD2F 6AD39 ...
ROT#+:
        ::                                       * 63718
          ROT                                    * 6371D
          #+                                     * 63722
        ;                                        * 63727

* # #' -> # #'+#
* refs (13): 10AE5 3A170 3A4DD 59F55 605D1 60923 ...
OVER#+:
        ::                                       * 6372C
          OVER                                   * 63731
          #+                                     * 63736
        ;                                        * 6373B

* # ob #' -> # ob #'+#
* refs (12): 10B08 126FD 4E4F1 4E53C 4F7B4 6B95C ...
3PICK#+:
        ::                                       * 63740
          3PICK                                  * 63745
          #+                                     * 6374A
        ;                                        * 6374F

* # ob1 ob2 #' -> # ob1 ob2 #'+#
* refs (10): 4C91C 4C926 6A35C 6FC17 90D14 918F1 ...
4PICK#+:
        ::                                       * 63754
          4PICK                                  * 63759
          #+                                     * 6375E
        ;                                        * 63763

* # ob #' -> ob #'-#
* refs (10): 0E4F7 1711C 4B3D3 4B450 4DBFE 4DC0D ...
ROT#-:
        ::                                       * 63768
          ROT                                    * 6376D
          #-                                     * 63772
        ;                                        * 63777

* # #' -> # #'-#
* refs (7): 2829B 2C3E2 437F7 44039 5B014 6E88E ...
OVER#-:
        ::                                       * 6377C
          OVER                                   * 63781
          #-                                     * 63786
        ;                                        * 6378B

* # -> #'
* refs (11): 20E61 3FBAB 411B1 51839 59674 6EAE1 ...
INDEX@#-:
        ::                                       * 63790
          INDEX@                                 * 63795
          #-                                     * 6379A
        ;                                        * 6379F

* # #' -> #' #-#'
* refs (3): 140DD 30625 60125
SWAPOVER#-:
        ::                                       * 637A4
          DUPUNROT                               * 637A9
          #-                                     * 637AE
        ;                                        * 637B3

* # ob ob' -> ob ob' #+1
* refs (20): 1028E 1DA98 21990 294BC 55332 55508 ...
ROT#1+:
        ::                                       * 637B8
          ROT                                    * 637BD
          #1+                                    * 637C2
        ;                                        * 637C7

* # #' -> #-#'+1
* refs (18): 448B2 6A4EC 6A55A 6AFD7 6EFE1 8E8EA ...
#1--:
        CON(5)  (*)+5                            * 637CC  primitive code object
        ASSEMBLE
        GOSUBL  SUB_62829                        * 637D1
        A=A-C   A                                * 637D7
        GOVLNG  L_36FBB                          * 637D9
        RPL

* # ob -> ob #-1
* refs (10): 2C469 3F5AC 4F2DC 5185C 600D5 6EFD7 ...
SWAP#1-:
        ::                                       * 637E0
          SWAP                                   * 637E5
          #1-                                    * 637EA
        ;                                        * 637EF

* # ob -> #-1
* refs (5): 10301 10761 5A51D 5A540 93974
DROP#1-:
        ::                                       * 637F4
          DROP                                   * 637F9
          #1-                                    * 637FE
        ;                                        * 63803

* # #' -> #+#'-1
* refs (19): 437DE 6AC94 6CA4E 6CA85 7CFE0 7D067 ...
#1-+:
        CON(5)  (*)+5                            * 63808  primitive code object
        ASSEMBLE
        GOSUBL  SUB_62829                        * 6380D
        A=A+C   A                                * 63813
        GOVLNG  L_36FCF                          * 63815
        RPL

* T -> :: <ob1> ; F -> :: <ob2> ;
* refs (4): 16B8F 16D9A 16DFE 857CD
COLAITE:
        ::                                       * 6381C
          'R                                     * 63821
          'R                                     * 63826
          RDROP                                  * 6382B
          COLARPITE                              * 63830
        ;                                        * 63835

* # ->
* refs (36): 1A627 2627F 262F7 2D582 2D89D 2D8F2 ...
ERROROUT:
        ::                                       * 6383A
          ERRORSTO                               * 6383F
          ERRJMP                                 * 63844
        ;                                        * 63849
        ASSEMBLE

* Get new D0 from DSKTOP, uses A
* refs (4): 160A9 61E02 623FD 6244E
D0=DSKTOP:
        D0=(5)  DSKTOP                           * 6384E
        A=DAT0  A                                * 63855
        D0=A                                     * 63858
        RTN                                      * 6385B

* Get new D1 from DSKTOP, uses C
* refs (3): 1209E 17A40 2E214
D1=DSKTOP:
        D1=(5)  DSKTOP                           * 6385D
        C=DAT1  A                                * 63864
        D1=C                                     * 63867
        RTN                                      * 6386A
        RPL

* 1 2 -> 2 1 2 1
* refs (8): 173AB 1DAFC 48A71 4956E 4C36E 4C89B ...
SWAP2DUP:
        ::                                       * 6386C
          SWAP                                   * 63871
          2DUP                                   * 63876
        ;                                        * 6387B

* ->
* refs (23): 14983 14988 1498D 14C44 14C7B 14CD0 ...
RSKIP:
        ::                                       * 63880
          RSWAP                                  * 63885
          'R                                     * 6388A
          DROP                                   * 6388F
          RSWAP                                  * 63894
        ;                                        * 63899

* grob #x1 #y1 #x2 #y2 ->
* refs (17): 0E079 0E08D 0E0A1 12702 3992B 3994E ...
GROB!ZERODRP:
        ::                                       * 6389E
          GROB!ZERO                              * 638A3
          DROP                                   * 638A8
        ;                                        * 638AD

* ob T -> T ob F -> :: ob <ob1> <rest> ;
* refs (5): 177D4 177E3 26AEB 2D5AF 314CC
casedrptru:
        ::                                       * 638B2
          NOT?SEMI                               * 638B7
          RDROPCOLA                              * 638BC
          DROPTRUE                               * 638C1
        ;                                        * 638C6

* T -> :: <ob1> <rest> ; F -> T
* refs (11): 1449D 15318 2F61E 473C8 4A109 5E63E ...
NOTcaseTRUE:
        ::                                       * 638CB
          ?SEMI                                  * 638D0
          RDROPCOLA                              * 638D5
          TRUE                                   * 638DA
        ;                                        * 638DF

* ob T -> :: ob ; ob F -> :: <ob1> <rest> ;
* refs (4): 30BCD 42C06 4B841 5FA1D
?SEMIDROP:
        ::                                       * 638E4
          NOTcase                                * 638E9
          DROP                                   * 638EE
          RDROP                                  * 638F3
        ;                                        * 638F8

* meta1 meta2 -> meta2 ob1..obn
* refs (9): 23ECF 24235 24299 2490B 24942 24A49 ...
SWAPUnDROP:
        ::                                       * 638FD
          psh                                    * 63902
          DROP                                   * 63907
        ;                                        * 6390C

* meta1 meta2 -> meta2
* refs (5): 514A5 54909 5A711 5A873 86E2F
SWAPUnNDROP:
        ::                                       * 63911
          psh                                    * 63916
          NDROP                                  * 6391B
        ;                                        * 63920

* ob -> ob nob
* refs (12): 2C76A 3FACA 41BD2 43539 43585 435C9 ...
DUP':
        ::                                       * 63925
          DUP                                    * 6392A
          'R                                     * 6392F
        ;                                        * 63934

* ob1 ob2 -> ob2 ob1 nob
* refs (9): 1565D 18760 2F1BC 362C8 36412 41BE5 ...
SWAP':
        ::                                       * 63939
          SWAP                                   * 6393E
          'R                                     * 63943
        ;                                        * 63948

* ob -> nob
* refs (9): 4D385 4D4BB 4D5AB 4D6A0 5A09A 5A509 ...
DROP':
        ::                                       * 6394D
          DROP                                   * 63952
          'R                                     * 63957
        ;                                        * 6395C

* ob1 ob2 -> ob1 ob2 ob1 nob
* refs (10): 3FAE3 40007 43550 43598 5D17B 5D266 ...
OVER':
        ::                                       * 63961
          OVER                                   * 63966
          'R                                     * 6396B
        ;                                        * 63970

* ob id/lam -> nob
STO':
        ::                                       * 63975
          STO                                    * 6397A
          'R                                     * 6397F
        ;                                        * 63984

* -> T nob
* refs (6): 4EC7B 571EA 69BE2 6ACE4 8D1A2 9E9A0
TRUE':
        ::                                       * 63989
          TRUE                                   * 6398E
          'R                                     * 63993
        ;                                        * 63998

* -> #1 F nob
* refs (4): 4CEAB 69C19 9CB18 CF648
ONEFALSE':
        ::                                       * 6399D
          BINT1                                  * 639A2
          FALSE                                  * 639A7
          'R                                     * 639AC
        ;                                        * 639B1

* -> F nob
* refs (9): 2626B 262CA 2F063 4DA5D 69B92 69BA1 ...
FALSE':
        ::                                       * 639B6
          FALSE                                  * 639BB
          'R                                     * 639C0
        ;                                        * 639C5

* # -> #+1 nob
* refs (1): 24BDC
#1+':
        ::                                       * 639CA
          #1+                                    * 639CF
          'R                                     * 639D4
        ;                                        * 639D9

* -> ob1 ob2
* refs (27): 14BB8 14CAD 3ECBC 3ECDA 3ECF8 3ED2F ...
'R'R:
        ::                                       * 639DE
          RSWAP                                  * 639E3
          'R                                     * 639E8
          'R                                     * 639ED
          RSWAP                                  * 639F2
        ;                                        * 639F7

* -> ob
* refs (4): 21795 217AE 5531E 57662
'RRDROP:
        ::                                       * 639FC
          RSWAP                                  * 63A01
          'R                                     * 63A06
          RDROP                                  * 63A0B
        ;                                        * 63A10

* Does ONE, then COLA.
* refs (8): 144F7 56557 5657A 565C0 565FC 5661F ...
ONECOLA:
        ::                                       * 63A15
          BINT1                                  * 63A1A
          COLACOLA                               * 63A1F
        ;                                        * 63A24

* ob ->
* refs (32): 08F9E 1F60A 21BB1 35079 5471F 54981 ...
dvarlsBIND:
        ::                                       * 63A29
          {'dvar}                                * 63A2E
          BIND                                   * 63A33
        ;                                        * 63A38

* ob ->
* refs (4): 2E60A 2E632 2F8DF 2F920
'LAMLNAMESTO:
        ::                                       * 63A3D
          '                                      * 63A42
          LAMLNAME                               * 63A47
          STO                                    * 63A4C
        ;                                        * 63A51

* ob -> flag
* refs (1): 54C31
'xDEREQ:
        ::                                       * 63A56
          '                                      * 63A5B
          xDER                                   * 63A60
          EQ                                     * 63A65
        ;                                        * 63A6A

* {} -> {} flag
* refs (12): 3FBCE 3FBE7 3FBFB 433D1 4967D A020A ...
DUPNULL{}?:
        ::                                       * 63A6F
          DUP                                    * 63A74
          NULL{}                                 * 63A79
          EQUAL                                  * 63A7E
        ;                                        * 63A83

* ob -> ob ob #0
* refs (12): 28E16 28E98 2D4B8 44DEF 66273 662CD ...
DUPZERO:
        ::                                       * 63A88
          DUP                                    * 63A8D
          BINT0                                  * 63A92
        ;                                        * 63A97

* ob -> ob ob #1
* refs (12): 10428 14328 2C4B9 2C61B 432A0 432E1 ...
DUPONE:
        ::                                       * 63A9C
          DUP                                    * 63AA1
          BINT1                                  * 63AA6
        ;                                        * 63AAB

* ob ob' -> ob' ob #1
* refs (11): 0F178 238D6 246D1 256CB 41201 56F9A ...
SWAPONE:
        ::                                       * 63AB0
          SWAP                                   * 63AB5
          BINT1                                  * 63ABA
        ;                                        * 63ABF

* -> #1 #1
* refs (46): 1DA7F 2C2ED 4339F 471C0 471E7 4DC67 ...
ONEONE:
        ::                                       * 63AC4
          BINT1                                  * 63AC9
          BINT1                                  * 63ACE
        ;                                        * 63AD3

* ob -> ob ob #2
* refs (18): 14341 41647 60428 60694 6B2C8 6CDF8 ...
DUPTWO:
        ::                                       * 63AD8
          DUP                                    * 63ADD
          BINT2                                  * 63AE2
        ;                                        * 63AE7

* ob T -> :: ob <ob1> <rest> ; ob F -> F
* refs (28): 09366 093C0 093DE 0FFFC 103C4 1051D ...
NOTcsdrpfls:
        ::                                       * 63AEC
          ?SEMI                                  * 63AF1
          RDROP                                  * 63AF6
          DROPFALSE                              * 63AFB
        ;                                        * 63B00

* T -> :: SIZEERR ; F -> :: <ob> <rest> ;
* refs (39): 10928 1946B 1DB7E 1DBA6 1DCB9 1DF3F ...
caseSIZEERR:
        ::                                       * 63B05
          NOT?SEMI                               * 63B0A
          SETSIZEERR                             * 63B0F
        ;                                        * 63B14

* T -> :: <ob> <rest> ; F -> :: SIZEERR ;
* refs (27): 15241 1524B 185AE 2EC93 2ECE8 2ED56 ...
NcaseSIZEERR:
        ::                                       * 63B19
          ?SEMI                                  * 63B1E
          SETSIZEERR                             * 63B23
        ;                                        * 63B28

* % -> % Z -> %
* refs (13): 0E5F4 0E608 0E617 18C54 20976 41CA7 ...
CKREAL:
        ::                                       * 63B2D
          DUPTYPEREAL?                           * 63B32
          ?SEMI                                  * 63B37
          SETTYPEERR                             * 63B3C
        ;                                        * 63B41

* T -> :: <ob1> <rest> ; F -> :: TYPEERR ;
* refs (26): 18724 45088 4514B 4515A 45169 45187 ...
NcaseTYPEERR:
        ::                                       * 63B46
          ?SEMI                                  * 63B4B
          SETTYPEERR                             * 63B50
        ;                                        * 63B55

* -> x*
* refs (14): 48BED 48C2E 48C6A 48C79 5562F 5777A ...
'x*:
        ::                                       * 63B5A
          '                                      * 63B5F
          x*                                     * 63B64
        ;                                        * 63B69

* -> xDER
* refs (5): 56D10 56F22 6F059 8656A 86588
'xDER:
        ::                                       * 63B6E
          '                                      * 63B73
          xDER                                   * 63B78
        ;                                        * 63B7D

* %% %%' -> %
* refs (15): 0FBC9 2C8DC 2C936 47844 48062 4B864 ...
%%/>%:
        ::                                       * 63B82
          %%/                                    * 63B87
          %%>%                                   * 63B8C
        ;                                        * 63B91

* # -> %%
* refs (20): 47830 4AC93 4ACA7 4AF59 4B27E 4B2A6 ...
UNCOERCE%%:
        ::                                       * 63B96
          UNCOERCE                               * 63B9B
          %>%%                                   * 63BA0
        ;                                        * 63BA5

* % -> flag
* refs (20): 102A2 1090A 41B6E 45295 454C0 49491 ...
DUP%0=:
        ::                                       * 63BAA
          DUP                                    * 63BAF
          %0=                                    * 63BB4
        ;                                        * 63BB9

* %% %%' -> %%''
* refs (11): 0F4BB 0FC50 4ACCA 4ACDE 4F13D 4F165 ...
SWAP%%/:
        ::                                       * 63BBE
          SWAP                                   * 63BC3
          %%/                                    * 63BC8
        ;                                        * 63BCD

* ob T -> :: DoBadKey ; ob F -> :: ob <ob1> <rest> ;
* refs (7): 3F274 3F283 40512 8DC0A 8DCCB 8EBC6 ...
caseDrpBadKy:
        ::                                       * 63BD2
          NOT?SEMI                               * 63BD7
          RDROPCOLA                              * 63BDC
          DropBadKey                             * 63BE1
        ;                                        * 63BE6

* T -> :: DoBadKey ; F -> :: <ob1> <rest> ;
* refs (24): 3B387 3B4B4 3BE5E 3DDE3 3DE9F 3DECC ...
caseDoBadKey:
        ::                                       * 63BEB
          NOT?SEMI                               * 63BF0
          RDROPCOLA                              * 63BF5
          DoBadKey                               * 63BFA
        ;                                        * 63BFF

* grob -> #width
* refs (11): 12B62 4E9D3 4EAA5 6B7EF 8DA87 8DE9C ...
GROBDIMw:
        ::                                       * 63C04
          GROBDIM                                * 63C09
          SWAPDROP                               * 63C0E
        ;                                        * 63C13

* ob ob' %% %%' -> %%+%%' ob ob'
* refs (13): 10C2C 2B4D4 37978 51B07 51DCE 51F4F ...
%%*UNROT:
        ::                                       * 63C18
          %%*                                    * 63C1D
          3UNROLL                                * 63C22
        ;                                        * 63C27

* 1 2 3 4 -> 2 4 3 1
* refs (11): 2C441 2FC36 487C9 4B5EE 4E924 68FE9 ...
SWAP4ROLL:
        ::                                       * 63C2C
          SWAP                                   * 63C31
          4ROLL                                  * 63C36
        ;                                        * 63C3B

* 1 2 3 -> 2 3 2 3 1
* refs (4): 2505E 25457 4FBCE 6AD20
2DUP5ROLL:
        ::                                       * 63C40
          2DUP                                   * 63C45
          5ROLL                                  * 63C4A
        ;                                        * 63C4F

* 1 2 3 -> 1 3 2 1
* refs (53): 1713A 1D738 1D7B0 365E3 367E1 36A5D ...
SWAP3PICK:
        ::                                       * 63C54
          SWAP                                   * 63C59
          3PICK                                  * 63C5E
        ;                                        * 63C63

* 1 2 3 -> 1 2 3 1 2
* refs (19): 17356 2C904 2CA26 4E910 5097D 5ED87 ...
3PICK3PICK:
        ::                                       * 63C68
          3PICK                                  * 63C6D
          3PICK                                  * 63C72
        ;                                        * 63C77

* 1 2 3 4 -> 1 2 4 3 1
* refs (7): 16CB1 2D77B 4C8FE 4DC4E 8DB4D CC259 ...
SWAP4PICK:
        ::                                       * 63C7C
          SWAP                                   * 63C81
          4PICK                                  * 63C86
        ;                                        * 63C8B

* 1 2 3 4 -> 1 2 3 4 3 1
* refs (7): 1056D 45263 4545C 4CD4D 4CD70 4E802 ...
OVER5PICK:
        ::                                       * 63C90
          OVER                                   * 63C95
          5PICK                                  * 63C9A
        ;                                        * 63C9F

* ob ob1 ob2 -> :: <ob1> ; ob ob1 ob2 -> :: ob <ob2> <rest> ;
* refs (5): 2F82B 2FA24 2FA65 54837 9E4FB
EQUALcasedrp:
        ::                                       * 63CA4
          EQUAL                                  * 63CA9
          COLA                                   * 63CAE
          casedrop                               * 63CB3
        ;                                        * 63CB8

* #0 -> :: ; # -> :: # <ob1> <rest> ;
* refs (13): 17937 38700 39C25 41AAB 41AE7 41B46 ...
DUP#0=csDROP:
        ::                                       * 63CBD
          DUP#0=                                 * 63CC2
          COLA                                   * 63CC7
          caseDROP                               * 63CCC
        ;                                        * 63CD1

* ob1 ob1 -> :: <ob1> ; ob1 ob2 -> :: <ob2> <rest> ;
* refs (8): 0F439 0F44D 0F51F 0F533 0FC7D 0FC91 ...
jEQcase:
        ::                                       * 63CD6
          EQ                                     * 63CDB
          COLAcase                               * 63CE0
        ;                                        * 63CE5

* f1 f2 -> :: <ob1> ; f1 f2 -> :: <ob2> <rest> ;
* refs (19): 1F7FD 3FC64 405F3 40E6F 43228 4CB95 ...
ANDcase:
        ::                                       * 63CEA
          AND                                    * 63CEF
          COLAcase                               * 63CF4
        ;                                        * 63CF9

* ob1 ob1 -> :: <ob1> ; ob1 ob2 -> :: <ob2> <rest> ;
* refs (21): 1022F 2D62C 2D6A9 2DBDA 2F78B 2F7F9 ...
EQUALcase:
        ::                                       * 63CFE
          EQUAL                                  * 63D03
          COLAcase                               * 63D08
        ;                                        * 63D0D

* #m #n -> :: <ob1> ; #m #n -> :: <ob2> <rest> ;
* refs (35): 09093 0B61A 0B642 15FA6 19E76 1F475 ...
#<case:
        ::                                       * 63D12
          #<                                     * 63D17
          COLAcase                               * 63D1C
        ;                                        * 63D21

* #1 -> :: <ob1> ; # -> :: <ob2> <rest> ;
* refs (27): 0C8E3 14726 1F4C0 2C44B 3B378 3B4A5 ...
#1=case:
        ::                                       * 63D26
          #1=                                    * 63D2B
          COLAcase                               * 63D30
        ;                                        * 63D35

* #m #n -> :: <ob2> <rest> ; #m #n -> :: <ob1> ;
* refs (102): 10815 14429 1713F 188BE 19498 1CEB9 ...
#<>case:
        ::                                       * 63D3A
          #<>                                    * 63D3F
          COLAcase                               * 63D44
        ;                                        * 63D49

* #0/#1/#2 -> :: <ob2> <rest> ; # -> :: <ob1> ;
* refs (3): 193E4 1F8FC 213B1
#>2case:
        ::                                       * 63D4E
          BINT2                                  * 63D53
          #>                                     * 63D58
          COLAcase                               * 63D5D
        ;                                        * 63D62

* #m #n -> :: <ob2> <rest> ; #m #n -> :: <ob1> ;
* refs (31): 177F7 21317 22604 23009 234DF 244B5 ...
#>case:
        ::                                       * 63D67
          #>                                     * 63D6C
          COLAcase                               * 63D71
        ;                                        * 63D76

* %0 -> :: <ob1> ; ob -> :: <ob2> <rest> ;
* refs (4): 22F27 237DA 524F2 5A7EC
j%0=case:
        ::                                       * 63D7B
          %0=                                    * 63D80
          COLAcase                               * 63D85
        ;                                        * 63D8A

* % -> :: <ob1> ; ob -> :: <ob2> <rest> ;
* refs (4): 1DA1B 1DB10 1DCD7 1F7A3
REALcase:
        ::                                       * 63D8F
          TYPEREAL?                              * 63D94
          COLAcase                               * 63D99
        ;                                        * 63D9E

* [] -> :: [] <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (9): 202FB 2037A 203F9 206B1 206F7 20811 ...
dARRYcase:
        ::                                       * 63DA3
          DUPTYPEARRY?                           * 63DA8
          COLAcase                               * 63DAD
        ;                                        * 63DB2

* {} -> :: {} ob1 ; ob -> :: ob <ob2> <rest> ;
* refs (12): 1DC78 4325F 4A8FB 4FC14 B5412 B5430 ...
dLISTcase:
        ::                                       * 63DB7
          DUPTYPELIST?                           * 63DBC
          COLAcase                               * 63DC1
        ;                                        * 63DC6

* -> :: <ob1> <rest> ; -> :: <rest> ;
* refs (18): 19DDF 3D8C1 4499E 44AD5 8D456 A2C60 ...
EditExstCase:
        ::                                       * 63DCB
          EditLExists?                           * 63DD0
          COLAcase                               * 63DD5
        ;                                        * 63DDA

* f1 f2 -> :: <ob1> ; f1 f2 -> :: <ob2> <rest> ;
* refs (10): 08FC1 154DC 1554F 155C2 24B4D 434FD ...
ANDNOTcase:
        ::                                       * 63DDF
          AND                                    * 63DE4
          COLANOTcase                            * 63DE9
        ;                                        * 63DEE

* ob1 ob1 -> :: <ob2> <rest> ; ob1 ob2 -> :: <ob1> ;
* refs (15): 10842 1CA94 21290 29261 51157 58575 ...
EQUALNOTcase:
        ::                                       * 63DF3
          EQUAL                                  * 63DF8
          COLANOTcase                            * 63DFD
        ;                                        * 63E02

* id -> :: id <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (4): 1559F 98FD7 9DF08 A0297
dIDNTNcase:
        ::                                       * 63E07
          DUPTYPEIDNT?                           * 63E0C
          COLANOTcase                            * 63E11
        ;                                        * 63E16

* % -> :: % <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (5): 1027F 102E3 49D62 49EDE 49F0B
dREALNcase:
        ::                                       * 63E1B
          DUPTYPEREAL?                           * 63E20
          COLANOTcase                            * 63E25
        ;                                        * 63E2A

* ob1 ob1 -> :: <ob1> <rest> ; ob1 ob2 -> :: <ob2> <rest> ;
* refs (9): 09761 09775 15101 49637 5D185 5D270 ...
EQIT:
        ::                                       * 63E2F
          EQ                                     * 63E34
          ?SEMI                                  * 63E39
          COLASKIP                               * 63E3E
        ;                                        * 63E43

* #0 -> :: #0 <ob1> <rest> ; # -> :: # <ob2> <rest> ;
* refs (13): 140C4 1430F 2EFA5 3220B 3A076 3A4F1 ...
DUP#0=IT:
        ::                                       * 63E48
          DUP#0=                                 * 63E4D
          ?SEMI                                  * 63E52
          COLASKIP                               * 63E57
        ;                                        * 63E5C

* f1 f2 -> :: <ob1> <ob3> <rest> ; f1 f2 -> :: <ob2> <rest> ;
* refs (4): 16F66 2F149 8E4A4 D04B3
ANDITE:
        ::                                       * 63E61
          AND                                    * 63E66
          2'RCOLARPITE                           * 63E6B
        ;                                        * 63E70

* ob1 ob1 -> :: <ob1> <ob3> <rest> ; ob1 ob2 -> :: <ob2> <rest> ;
* refs (10): 38A8C 48F59 58372 5843A 5F58F 6AEC4 ...
EQITE:
        ::                                       * 63E75
          EQ                                     * 63E7A
          2'RCOLARPITE                           * 63E7F
        ;                                        * 63E84

* #0 -> :: <ob1> <ob3> <rest> ; # -> :: <ob2> <rest>
* refs (14): 174A0 17522 2D938 39D2E 41DF6 44DCC ...
#0=ITE:
        ::                                       * 63E89
          #0=                                    * 63E8E
          2'RCOLARPITE                           * 63E93
        ;                                        * 63E98

* #m #n -> :: <ob1> <ob3> <rest> ; #m #n -> :: <ob2> <rest> ;
* refs (18): 41D38 41DB0 43C43 440F7 4CAF0 4CD98 ...
#<ITE:
        ::                                       * 63E9D
          #<                                     * 63EA2
          2'RCOLARPITE                           * 63EA7
        ;                                        * 63EAC

* #m #n -> :: <ob2> <rest> ; #m #n -> :: <ob1> <ob3> <rest> ;
* refs (19): 43BD5 6A2D5 6FC30 6FCA5 73977 8DD9E ...
#>ITE:
        ::                                       * 63EB1
          #>                                     * 63EB6
          2'RCOLARPITE                           * 63EBB
        ;                                        * 63EC0

* #0 -> :: #0 <ob1> <ob3> <rest> ; # -> :: # <ob2> <rest> ;
* refs (19): 0C659 0C6F4 2DC48 321C0 3B631 416E2 ...
DUP#0=ITE:
        ::                                       * 63EC5
          DUP#0=                                 * 63ECA
          2'RCOLARPITE                           * 63ECF
        ;                                        * 63ED4

* #set -> :: <ob1> <ob3> <rest> ; #clr -> :: <ob2> <rest> ;
* refs (11): 9A492 9A4FD 9A76A 9BB98 9C1F0 9C26D ...
UserITE:
        ::                                       * 63ED9
          TestUserFlag                           * 63EDE
          2'RCOLARPITE                           * 63EE3
        ;                                        * 63EE8

* #set -> :: <ob1> <ob3> <rest> ; #clr -> :: <ob2> <rest> ;
* refs (23): 1DEF9 22128 22166 3227E 3967D 396A0 ...
SysITE:
        ::                                       * 63EED
          TestSysFlag                            * 63EF2
          2'RCOLARPITE                           * 63EF7
        ;                                        * 63EFC

* meta1 meta2 -> symb
* refs (11): 54E4D 558AF 85EC1 85F7A 85FDE 86060 ...
top&Cr:
        ::                                       * 63F01
          top&                                   * 63F06
          COLA                                   * 63F0B
          Cr                                     * 63F10
        ;                                        * 63F15

* meta1 meta2 meta3 -> meta2 meta3 meta1 meta1
* refs (14): 54927 5CAB9 83A50 83A87 83A9B 84F9E ...
metaROTDUP:
        ::                                       * 63F1A
          rot                                    * 63F1F
          dup                                    * 63F24
        ;                                        * 63F29

* meta1 meta2 meta3 -> meta2 meta3&meta1
* refs (16): 56F2C 58FFD 590BB 5CA23 5CA87 5CA8C ...
ROTUntop&:
        ::                                       * 63F2E
          rot                                    * 63F33
          top&                                   * 63F38
        ;                                        * 63F3D

* meta1 meta2 meta3 -> meta3 meta1&meta2
* refs (13): 242C1 57FA0 57FA5 581D8 581DD 5870B ...
roll2top&:
        ::                                       * 63F42
          unrot                                  * 63F47
          top&                                   * 63F4C
        ;                                        * 63F51

* meta&ob -> M_last M_rest
* refs (17): 1CF47 51487 514A0 558CD 5862A 58B7B ...
plDRPpZparg:
        ::                                       * 63F56
          SWAPDROP#1-                            * 63F5B
          pshzerpsharg                           * 63F60
        ;                                        * 63F65

* ob $ $' -> $+$' ob
* refs (5): 31C19 31D3D 9CCE4 9F821 D0FD9
&$SWAP:
        ::                                       * 63F6A
          &$                                     * 63F6F
          SWAP                                   * 63F74
        ;                                        * 63F79

* ob1 ob2 -> ob2 ob1'
* refs (6): 0F742 0F75B 10C72 35CB3 35E4A 37E14
SWAPCKREF:
        ::                                       * 63F7E
          SWAP                                   * 63F83
          CKREF                                  * 63F88
        ;                                        * 63F8D

* meta -> M_rest M_last
* refs (2): 69F51 6AFE1
pZpargSWAPUn:
        ::                                       * 63F92
          pshzerpsharg                           * 63F97
          psh                                    * 63F9C
        ;                                        * 63FA1

* meta ob ->
* refs (6): 5630E 5741E 5A1DF 869D9 86DA3 86DC6
DROPNDROP:
        ::                                       * 63FA6
          DROP                                   * 63FAB
          NDROP                                  * 63FB0
        ;                                        * 63FB5

* 1 2 3 4 -> 1 2 3 4 1 2
* refs (12): 7D21F 8D8EB 91D42 92008 93512 972CC ...
2OVER:
        ::                                       * 63FBA
          4PICK                                  * 63FBF
          4PICK                                  * 63FC4
        ;                                        * 63FC9

* ob -> :: ob ;
?Ob>Seco:
        ::                                       * 63FCE
          DUPTYPECOL?                            * 63FD3
          ?SEMI                                  * 63FD8
          Ob>Seco                                * 63FDD
        ;                                        * 63FE2

* ob -> :: ob ;
* refs (2): 1516A 63FDD
Ob>Seco:
        ::                                       * 63FE7
          BINT1                                  * 63FEC
          ::N                                    * 63FF1
        ;                                        * 63FF6

* ob1 ob2 -> :: ob1 ob2 ;
* refs (9): 14735 14B4F 14CB7 36264 3F210 3F4B5 ...
2Ob>Seco:
        ::                                       * 63FFB
          BINT2                                  * 64000
          ::N                                    * 64005
        ;                                        * 6400A

* ->
* refs (18): 178D8 39EFA 3A505 3F796 3F7F0 43359 ...
ExitAtLOOP:
        ::                                       * 6400F
          BINT0                                  * 64014
          ISTOPSTO                               * 64019
        ;                                        * 6401E

* id -> ob T -> F
* refs (6): 0DF3B 11090 110A4 34DDB 41E64 D213E
RclHiddenVar:
        ::                                       * 64023
          WithHidden                             * 64028
          DRPExitAtLOOP                          * 6402D
        ;                                        * 64032

* -> ?
* refs (3): 64028 6407D 64091
WithHidden:
        ::                                       * 64037
          SaveVarRes                             * 6403C
          ERRSET                                 * 64041
          'R                                     * 64046
          SetHiddenRes                           * 6404B
          EVAL                                   * 64050
          ERRTRAP                                * 64055
          ::                                     * 6405A
            RestVarRes                           * 6405F
            ERRJMP                               * 64064
          ;                                      * 64069
          RestVarRes                             * 6406E
        ;                                        * 64073

* ob id ->
* refs (5): 0DF14 34DCC 41E50 41E5A D2127
StoHiddenVar:
        ::                                       * 64078
          WithHidden                             * 6407D
          STO                                    * 64082
        ;                                        * 64087

* id ->
* refs (4): 34E08 34E21 D218C D21AD
PuHiddenVar:
        ::                                       * 6408C
          WithHidden                             * 64091
          PURGE                                  * 64096
        ;                                        * 6409B

* ->
* refs (1): 6403C
SaveVarRes:
        ::                                       * 640A0
          CONTEXT@                               * 640A5
          STOPSIGN@                              * 640AA
          2NULLLAM{}                             * 640AF
          BIND                                   * 640B4
        ;                                        * 640B9

* ->
* refs (1): 6404B
SetHiddenRes:
        ::                                       * 640BE
          OBJ_0B997                              * 640C3
          ?SKIP                                  * 640C8
          ::                                     * 640CD
            OBJ_0BA40                            * 640D2
            OBJ_0B997                            * 640D7
            DROP                                 * 640DC
          ;                                      * 640E1
          DUP                                    * 640E6
          CONTEXT!                               * 640EB
          STOPSIGN!                              * 640F0
        ;                                        * 640F5

* ->
* refs (2): 6405F 6406E
RestVarRes:
        ::                                       * 640FA
          HOMEDIR                                * 640FF
          SYSSTOPSIGN                            * 64104
          1GETLAM                                * 64109
          2GETLAM                                * 6410E
          ABND                                   * 64113
          CONTEXT!                               * 64118
          STOPSIGN!                              * 6411D
        ;                                        * 64122

* ob1 ob2 -> flag
* refs (1): 4176E
Embedded?:
        CON(5)  (*)+5                            * 64127  primitive code object
        ASSEMBLE
        D1=D1+  10                               * 6412C
        D=D+1   A                                * 6412F
        D=D+1   A                                * 64131
        GOSBVL  SAVPTR                           * 64133
        D1=D1-  5                                * 6413A
        C=DAT1  A                                * 6413D
        B=C     A                                * 64140
        D0=C                                     * 64142
        GOSBVL  SKIPOB                           * 64145
        AD0EX                                    * 6414C
        D1=D1-  5                                * 6414F
        C=DAT1  A                                * 64152
        ?B>C    A                                * 64155
        GOYES   L_64166                          * 64158
        ?C>=A   A                                * 6415A
        GOYES   L_64166                          * 6415D
        GOVLNG  GPPushTLoop                      * 6415F
L_64166:
        GOVLNG  GPPushFLoop                      * 64166
        RPL

* -> #
* refs (4): 43667 436BC D519E D526F
UStackDepth:
        ::                                       * 6416D
          OBJ_113C2                              * 64172
          #5-                                    * 64177
          BINT5                                  * 6417C
          #/                                     * 64181
          SWAPDROP                               * 64186
        ;                                        * 6418B

* # ->
* refs (1): 23407
Sig?ErrJmp:
        ::                                       * 64190
          ERROR@                                 * 64195
          {                                      * 6419A
            Err#Cont                             * 6419F
            Err#Kill                             * 641A4
            #CAlarmErr                           * 641A9
          }                                      * 641AE
          matchob?                               * 641B3
          caseERRJMP                             * 641B8
          DROP                                   * 641BD
        ;                                        * 641C2

        CON(5)  (*)+5                            * 641C7  primitive code object
        ASSEMBLE

* refs (42): 18536 61099 6119E 611F9 61610 61891 ...
DupAndThen:
        C=0     A                                * 641CC
        LC(1)   #5                               * 641CE
        A=A+C   A                                * 641D1
        D=D-1   A                                * 641D3
        GOC     L_641E5                          * 641D5
L_641D8:
        C=DAT1  A                                * 641D8
        D1=D1-  5                                * 641DB
        DAT1=C  A                                * 641DE
        PC=(A)                                   * 641E1
L_641E5:
        R1=A.F  A                                * 641E5
        GOSBVL  SafGarbD-1                       * 641EB
        A=R1.F  A                                * 641F2
        GOTO    L_641D8                          * 641F8

* -> #0 #0
* refs (84): 27A1C 45780 45F05 46BB1 47665 49021 ...
ZEROZERO:
        CON(5)  (*)+5                            * 641FC  primitive code object
        A=0     A                                * 64201
        C=0     A                                * 64203
        GOTO    L_64214                          * 64205

* -> #0 #1
* refs (4): 6D050 6DA17 6E596 7CEE6
#ZERO#ONE:
        CON(5)  (*)+5                            * 64209  primitive code object
        A=0     A                                * 6420E
        C=0     A                                * 64210
        C=C+1   A                                * 64212
L_64214:
        D=D-1   A                                * 64214
        GOC     L_64251                          * 64216
        D=D-1   A                                * 64219
        GOC     L_64251                          * 6421B
L_6421E:
        RSTK=C                                   * 6421E
        GOSUB   SUB_64236                        * 64220
        C=RSTK                                   * 64224
        A=C     A                                * 64226
        GOSUB   SUB_64236                        * 64228
        A=DAT0  A                                * 6422C
        D0=D0+  5                                * 6422F
        PC=(A)                                   * 64232

* refs (2): 64220 64228
SUB_64236:
        A=A+A   A                                * 64236
        C=A     A                                * 64238
        A=A+A   A                                * 6423A
        A=A+A   A                                * 6423C
        A=A+C   A                                * 6423E
        LC(5)   BINT0                            * 64240
        A=A+C   A                                * 64247
        D1=D1-  5                                * 64249
        DAT1=A  A                                * 6424C
        RTN                                      * 6424F
L_64251:
        R0=A.F  A                                * 64251
        RSTK=C                                   * 64257
        GOSBVL  SafGarbD-1                       * 64259
        D=D-1   A                                * 64260
        GOC     L_64271                          * 64262
        C=RSTK                                   * 64265
        A=R0.F  A                                * 64267
        GOTO    L_6421E                          * 6426D
L_64271:
        D=0     A                                * 64271
        GOVLNG  DOMEMERR                         * 64273

* -> #0 #7
* refs (1): 6C627
#ZERO#SEVEN:
        CON(5)  (*)+5                            * 6427A  primitive code object
        A=0     A                                * 6427F
        C=0     A                                * 64281
        LC(1)   #7                               * 64283
        GOTO    L_64214                          * 64286

* -> #1 #27d
#ONE#27:
        CON(5)  (*)+5                            * 6428A  primitive code object
        A=0     A                                * 6428F
        A=A+1   A                                * 64291
        C=0     A                                * 64293
        LC(2)   #1B                              * 64295
        GOTO    L_64214                          * 64299

* -> #2 #1
* refs (2): 920E4 92134
#TWO#ONE:
        CON(5)  (*)+5                            * 6429D  primitive code object
        C=0     A                                * 642A2
        LC(1)   #1                               * 642A4
        A=C     A                                * 642A7
        A=A+1   A                                * 642A9
        GOTO    L_64214                          * 642AB

* -> #2 #2
* refs (3): 6C84B 920CB 9211B
#TWO#TWO:
        CON(5)  (*)+5                            * 642AF  primitive code object
        C=0     A                                * 642B4
        LC(1)   #2                               * 642B6
        A=C     A                                * 642B9
        GOTO    L_64214                          * 642BB

* -> #2 #4
#TWO#FOUR:
        CON(5)  (*)+5                            * 642BF  primitive code object
        C=0     A                                * 642C4
        LC(1)   #2                               * 642C6
        A=C     A                                * 642C9
        C=C+C   A                                * 642CB
        GOTO    L_64214                          * 642CD

* -> #3 #4
* refs (2): 664F8 6D819
#THREE#FOUR:
        CON(5)  (*)+5                            * 642D1  primitive code object
        C=0     A                                * 642D6
        LC(1)   #3                               * 642D8
        A=C     A                                * 642DB
        C=C+1   A                                * 642DD
        GOTO    L_64214                          * 642DF
        RPL

* -> #5 #4
#FIVE#FOUR:
        ::                                       * 642E3
          BINT5                                  * 642E8
          BINT4                                  * 642ED
        ;                                        * 642F2

        CON(5)  (*)+5                            * 642F7  primitive code object
        ASSEMBLE
        C=0     A                                * 642FC
        LC(1)   #5                               * 642FE
        A=C     A                                * 64301
        C=C-1   A                                * 64303
        GOTO    L_64214                          * 64305
        RPL

* -> #0 #0 #0
ZEROZEROZERO:
        ::                                       * 64309
          ZEROZERO                               * 6430E
          BINT0                                  * 64313
        ;                                        * 64318

* -> #0 #0 #1
ZEROZEROONE:
        ::                                       * 6431D
          ZEROZERO                               * 64322
          BINT1                                  * 64327
        ;                                        * 6432C

* -> #0 #0 #2
ZEROZEROTWO:
        ::                                       * 64331
          ZEROZERO                               * 64336
          BINT2                                  * 6433B
        ;                                        * 64340

* meta #start #end -> meta'
* refs (1): 41107
SubMetaOb:
        ::                                       * 64345
          ROT                                    * 6434A
          OVER                                   * 6434F
          2DUP                                   * 64354
          #>                                     * 64359
          ITE                                    * 6435E
          SubMetaOb1                             * 64363

drop(1,3):
          ::                                     * 64368
            DROP                                 * 6436D
            SWAPDROP                             * 64372
          ;                                      * 64377
          OVER                                   * 6437C
          ONE_EQ                                 * 64381
          case                                   * 64386
          SWAPDROP                               * 6438B
          SWAP#1-SWAP                            * 64390
          OVER                                   * 64395
          #-                                     * 6439A
          DUPUNROT                               * 6439F
          #2+                                    * 643A4
          UNROLL                                 * 643A9
          psh                                    * 643AE
          NDROP                                  * 643B3
        ;                                        * 643B8

* ob1..obi..obn #n #i #n #i -> ob1..obi #n #i
* refs (1): 64363
SubMetaOb1:
        ::                                       * 643BD
          #-                                     * 643C2
          DUPUNROT                               * 643C7
          #3+                                    * 643CC
          UNROLL                                 * 643D1
          DUPUNROT                               * 643D6
          #3+                                    * 643DB
          UNROLL                                 * 643E0
          NDROP                                  * 643E5
        ;                                        * 643EA

* ob comp -> T -> ob F
* refs (7): 15518 2C7B0 35464 3549B 641B3 9E6FD ...
matchob?:
        ::                                       * 643EF
          >R                                     * 643F4

* refs (1): 64412
matchob?Lp:
          ticR                                   * 643F9
          NOTcaseFALSE                           * 643FE
          OVER                                   * 64403
          EQUAL                                  * 64408
          NOT?GOTO                               * 6440D
          matchob?Lp                             * 64412
          RDROP                                  * 64417
          DROPTRUE                               * 6441C
        ;                                        * 64421

* comp ob pred -> #i -> #0 (eg: pred = ' %<)
* refs (7): 1876A 64499 644B2 B23E5 B40B9 B958B ...
POSCOMP:
        ::                                       * 64426
          ROT                                    * 6442B
          >R                                     * 64430
          BINT0                                  * 64435

* refs (1): 64476
nextpos:
          #1+                                    * 6443A
          ticR                                   * 6443F
          NOTcase                                * 64444

* ob ob ob -> #0
3DROPZERO:
          ::                                     * 64449
            2DROP                                * 6444E
            DROPZERO                             * 64453
          ;                                      * 64458
          4PICK                                  * 6445D
          4PICK                                  * 64462
          EVAL                                   * 64467
          ?ATTNQUIT                              * 6446C
          NOT?GOTO                               * 64471
          nextpos                                * 64476
          RDROP                                  * 6447B
          ROTROT2DROP                            * 64480
        ;                                        * 64485

* comp # -> #i -> #0
* refs (12): 19EA3 BC232 BC563 D6F75 D70C9 D71AB ...
#=POSCOMP:
        ::                                       * 6448A
          '                                      * 6448F
          #=                                     * 64494
          POSCOMP                                * 64499
        ;                                        * 6449E

* comp ob -> #pos -> #0
* refs (16): 1CAF5 22496 5143C 58F26 59162 644C6 ...
EQUALPOSCOMP:
        ::                                       * 644A3
          '                                      * 644A8
          EQUAL                                  * 644AD
          POSCOMP                                * 644B2
        ;                                        * 644B7

* ob comp -> #i -> #0
* refs (5): 463F0 5101C 992AA A1CFC B7D1E
NTHOF:
        ::                                       * 644BC
          SWAP                                   * 644C1
          EQUALPOSCOMP                           * 644C6
        ;                                        * 644CB

* comp test -> ob T -> F
* refs (2): 41507 4158E
Find1stTrue:
        ::                                       * 644D0
          SWAP                                   * 644D5
          >R                                     * 644DA
          COLA                                   * 644DF
          Find1stT.1                             * 644E4
        ;                                        * 644E9

* refs (2): 644E4 64516
Find1stT.1:
        ::                                       * 644EE
          ticR                                   * 644F3
          NOTcase                                * 644F8
          DROPFALSE                              * 644FD
          DUP                                    * 64502
          3PICK                                  * 64507
          EVAL                                   * 6450C
          NOTcasedrop                            * 64511
          Find1stT.1                             * 64516
          SWAPDROP                               * 6451B
          RDROP                                  * 64520
          TRUE                                   * 64525
        ;                                        * 6452A

* ob test comp -> nextob T -> ob F
* refs (6): 19FF8 645A7 6BE66 AA3EB B1E4C B6557
Lookup:
        ::                                       * 6452F
          >R                                     * 64534
          COLA                                   * 64539
          Lookup.1                               * 6453E
        ;                                        * 64543

* ob test -> nextob T -> ob F Return Stack: comp ->
* refs (2): 6453E 6457A
Lookup.1:
        ::                                       * 64548
          ticR                                   * 6454D
          NOTcase                                * 64552
          DROPFALSE                              * 64557
          ticR                                   * 6455C
          DROPSWAP                               * 64561
          4PICK                                  * 64566
          4PICK                                  * 6456B
          EVAL                                   * 64570
          NOTcasedrop                            * 64575
          Lookup.1                               * 6457A
          ROTROT2DROP                            * 6457F
          RDROP                                  * 64584
          TRUE                                   * 64589
        ;                                        * 6458E

* ob comp -> nextob T -> ob F
* refs (46): 46DD8 4B93B 6BDFD 6BF06 A2A2A A2C09 ...
EQLookup:
        ::                                       * 64593
          '                                      * 64598
          EQ                                     * 6459D
          SWAP                                   * 645A2
          Lookup                                 * 645A7
        ;                                        * 645AC

* $ $find start# -> #pos -> #0
* refs (16): 127BB 15F00 1CAE1 2F405 2F44B 3A111 ...
POS$:
        CON(5)  (*)+5                            * 645B1  primitive code object
        ASSEMBLE
        ST=0    1                                * 645B6
        GOTO    L_645C5                          * 645B9

* $ $find #limit -> #pos -> #0
* refs (1): DD1BE
POS$REV:
        CON(5)  (*)+5                            * 645BD  primitive code object
        ST=1    1                                * 645C2
L_645C5:
        GOSBVL  POP#                             * 645C5
        R0=A.F  A                                * 645CC
        C=DAT1  A                                * 645D2
        D1=D1+  5                                * 645D5
        D=D+1   A                                * 645D8
        R3=C.F  A                                * 645DA
        C=DAT1  A                                * 645E0
        D1=D1+  5                                * 645E3
        D=D+1   A                                * 645E6
        R1=C.F  A                                * 645E8
        GOSBVL  SAVPTR                           * 645EE
        A=R1.F  A                                * 645F5
        GOSUB   SUB_64727                        * 645FB
        ?C=0    A                                * 645FF
        GOYES   L_6466C                          * 64602
        R1=A.F  A                                * 64604
        R2=C.F  A                                * 6460A
        A=R3.F  A                                * 64610
        GOSUB   SUB_64727                        * 64616
        ?C=0    A                                * 6461A
        GOYES   L_6466C                          * 6461D
        R3=A.F  A                                * 6461F
        R4=C.F  A                                * 64625
        A=R0.F  A                                * 6462B
        ?A=0    A                                * 64631
        GOYES   L_6466C                          * 64634
        C=R2.F  A                                * 64636
        C=C-A   A                                * 6463C
        GOC     L_6466C                          * 6463E
        ?ST=1   1                                * 64641
        GOYES   L_64672                          * 64644
        C=C+1   A                                * 64646
        D=C     A                                * 64648
        A=A-1   A                                * 6464A
        A=A+A   A                                * 6464C
        C=R1.F  A                                * 6464E
        A=A+C   A                                * 64654
        R2=A.F  A                                * 64656
        C=R4.F  A                                * 6465C
        D=D-C   A                                * 64662
        GOC     L_6466C                          * 64664
        D=D+1   A                                * 64667
        GONC    L_646A6                          * 64669
L_6466C:
        A=0     A                                * 6466C
        GOTO    L_64710                          * 6466E
L_64672:
        B=A     A                                * 64672
        A=R2.F  A                                * 64674
        C=R4.F  A                                * 6467A
        A=A-C   A                                * 64680
        GOC     L_6466C                          * 64682
        A=A+1   A                                * 64685
        ?A<B    A                                * 64687
        GOYES   L_6468E                          * 6468A
        A=B     A                                * 6468C
L_6468E:
        C=A     A                                * 6468E
        D=C     A                                * 64690
        D=D+1   A                                * 64692
        A=A-1   A                                * 64694
        A=A+A   A                                * 64696
        C=R1.F  A                                * 64698
        A=A+C   A                                * 6469E
        R2=A.F  A                                * 646A0
L_646A6:
        D=D-1   A                                * 646A6
        GOC     L_6466C                          * 646A8
        D0=A                                     * 646AB
        A=R3.F  A                                * 646AE
        D1=A                                     * 646B4
        A=R4.F  A                                * 646B7
        B=A     A                                * 646BD
L_646BF:
        B=B-1   A                                * 646BF
        GOC     L_646FB                          * 646C1
        A=DAT0  B                                * 646C4
        C=DAT1  B                                * 646C7
        ?C#A    B                                * 646CA
        GOYES   L_646D8                          * 646CD
        D0=D0+  2                                * 646CF
        D1=D1+  2                                * 646D2
        GONC    L_646BF                          * 646D5
L_646D8:
        A=R2.F  A                                * 646D8
        D0=A                                     * 646DE
        ?ST=1   1                                * 646E1
        GOYES   L_646EC                          * 646E4
        D0=D0+  2                                * 646E6
        GONC    L_646EF                          * 646E9
L_646EC:
        D0=D0-  2                                * 646EC
L_646EF:
        AD0EX                                    * 646EF
        R2=A.F  A                                * 646F2
        GONC    L_646A6                          * 646F8
L_646FB:
        C=R1.F  A                                * 646FB
        A=R2.F  A                                * 64701
        A=A-C   A                                * 64707
        ASRB.F  A                                * 64709
        A=A+1   A                                * 6470E
L_64710:
        R0=A.F  A                                * 64710
        GOSBVL  PUSH#                            * 64716
        A=DAT0  A                                * 6471D
        D0=D0+  5                                * 64720
        PC=(A)                                   * 64723

* refs (2): 645FB 64616
SUB_64727:
        D0=A                                     * 64727
        A=DAT0  A                                * 6472A
        LC(5)   DOCHAR                           * 6472D
        ?C#A    A                                * 64734
        GOYES   L_64740                          * 64737
        C=0     A                                * 64739
        C=C+1   A                                * 6473B
        GONC    L_64754                          * 6473D
L_64740:
        D0=D0+  5                                * 64740
        A=DAT0  A                                * 64743
        D1=A                                     * 64746
        D1=D1-  5                                * 64749
        CD1EX                                    * 6474C
        CSRB.F  A                                * 6474F
L_64754:
        D0=D0+  5                                * 64754
        AD0EX                                    * 64757
        RTN                                      * 6475A
        RPL

* chr -> $* Strings
* refs (8): 406AC 4124C 68A35 69A0E 6BE89 6CB16 ...
CHR>$:
        ::                                       * 6475C
          NULL$                                  * 64761
          SWAP                                   * 64766
          >H$                                    * 6476B
        ;                                        * 64770

* tagged -> ob
* refs (20): 1A5EE 1EA49 1EB6A 1F158 1FA16 1FD15 ...
STRIPTAGS:
        ::                                       * 64775
          DUP                                    * 6477A
          TYPETAGGED?                            * 6477F
          NOT?SEMI                               * 64784
          TAG>                                   * 64789
          DROP                                   * 6478E
          COLA                                   * 64793
          STRIPTAGS                              * 64798
        ;                                        * 6479D

* tagged ob' -> ob ob'
* refs (12): 15504 1EA4E 1EB6F 20CEB 20D04 20D1D ...
STRIPTAGSl2:
        ::                                       * 647A2
          SWAP                                   * 647A7
          STRIPTAGS                              * 647AC
          SWAP                                   * 647B1
        ;                                        * 647B6

* ob $tag -> tagged ob.. { $.. } -> tagged...
* refs (1): 1FF69
TAGOBS:
        ::                                       * 647BB
          DUPTYPECSTR?                           * 647C0
          case                                   * 647C5
          >TAG                                   * 647CA
          DUPLENCOMP                             * 647CF
          #1+_ONE_DO                             * 647D4
          ISTOP@                                 * 647D9
          ROLL                                   * 647DE
          OVER                                   * 647E3
          INDEX@                                 * 647E8
          NTHCOMPDROP                            * 647ED
          >TAG                                   * 647F2
          SWAP                                   * 647F7
          LOOP                                   * 647FC
          DROP                                   * 64801
        ;                                        * 64806

* comp #ofs -> comp #ofs' ob T -> comp F
* refs (9): 16EF8 172D4 1730B 173E2 173F1 21E19 ...
NEXTCOMPOB:
        CON(5)  (*)+5                            * 6480B  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 64810
        ?A#0    A                                * 64817
        GOYES   L_64822                          * 6481A
        LC(1)   #5                               * 6481C
        A=C     P                                * 6481F
L_64822:
        C=DAT1  A                                * 64822
        C=C+A   A                                * 64825
        CD1EX                                    * 64827
        RSTK=C                                   * 6482A
        A=DAT1  A                                * 6482C
        LC(5)   SEMI                             * 6482F
        ?C#A    A                                * 64836
        GOYES   L_6484D                          * 64839
        C=RSTK                                   * 6483B
        D1=C                                     * 6483D
        LC(5)   FALSE                            * 64840
L_64847:
        A=C     A                                * 64847
        PC=(A)                                   * 64849
L_6484D:
        C=A     A                                * 6484D
        CD1EX                                    * 6484F
        RSTK=C                                   * 64852
        A=DAT1  A                                * 64854
        LC(5)   PRLG                             * 64857
        ?C#A    A                                * 6485E
        GOYES   L_6486A                          * 64861
        C=RSTK                                   * 64863
        RSTK=C                                   * 64865
        D1=C                                     * 64867
L_6486A:
        C=RSTK                                   * 6486A
        A=C     A                                * 6486C
        C=RSTK                                   * 6486E
        CD1EX                                    * 64870
        D1=D1-  5                                * 64873
        D=D-1   A                                * 64876
        DAT1=C  A                                * 64878
        GOSBVL  SAVPTR                           * 6487B
        D0=A                                     * 64882
        GOSBVL  SKIPOB                           * 64885
        D1=D1+  5                                * 6488C
        A=DAT1  A                                * 6488F
        CD0EX                                    * 64892
        C=C-A   A                                * 64895
        R0=C                                     * 64897
        GOSBVL  PUSH#                            * 6489A
        C=DAT1  A                                * 648A1
        D1=D1+  5                                * 648A4
        A=DAT1  A                                * 648A7
        DAT1=C  A                                * 648AA
        D1=D1-  5                                * 648AD
        DAT1=A  A                                * 648B0
        LC(5)   TRUE                             * 648B3
        GONC    L_64847                          * 648BA

>LASTRAM-WORD:
        C=B     A                                * 648BD
        C=0     A                                * 648BF
        CLRST                                    * 648C1
        DSLC                                     * 648C3
        C=ST                                     * 648C6
        RTNCC                                    * 648C8
        NIBHEX  80                               * 648CA  .

        CON(5)  DROPDUP                          * 648CC  address (the code jumps or points through it)

        CON(5)  ROTSWAP                          * 648D1  address (the code jumps or points through it)

        CON(5)  LASTRAM-WORD                     * 648D6  address (the code jumps or points through it)

        CON(5)  DROP                             * 648DB  address (the code jumps or points through it)

        CON(5)  2DUPEQ                           * 648E0  address (the code jumps or points through it)

        CON(5)  case                             * 648E5  address (the code jumps or points through it)

        CON(5)  3DROP                            * 648EA  address (the code jumps or points through it)
        RPL

        CODE                                     * 648EF  532 nibbles
          ST=0    10                             * 648F9
L_648FC:
          GOSBVL  SAVPTR                         * 648FC
          GOSBVL  ROOM                           * 64903
          LA(5)   #00005                         * 6490A
          ?C>A    A                              * 64914
          GOYES   L_64924                        * 64917
          GOSBVL  SUB_12D68                      * 64919
          GOTO    L_648FC                        * 64920
L_64924:
          R0=C                                   * 64924
          C=0     S                              * 64927
          D0=(5)  INITEN                         * 6492A
          A=DAT0  S                              * 64931
          DAT0=C  S                              * 64935
          R0=A.F  S                              * 64939
          C=DAT1  A                              * 6493F
          D1=D1+  5                              * 64942
          D=C     A                              * 64945
          D0=C                                   * 64947
          D0=D0-  2                              * 6494A
          C=0     A                              * 6494D
          C=DAT0  B                              * 6494F
          D0=D0+  2                              * 64952
          C=C+1   A                              * 64955
          C=C+1   A                              * 64957
          C=C+C   A                              * 64959
          D=D-C   A                              * 6495B
          GOSBVL  SKIPOB                         * 6495D
          C=DAT1  A                              * 64964
          B=C     A                              * 64967
          CD0EX                                  * 64969
          R1=C                                   * 6496C
          C=C-D   A                              * 6496F
          R2=C                                   * 64971
          D0=D0-  2                              * 64974
          C=0     A                              * 64977
          C=DAT0  B                              * 64979
          D0=D0+  2                              * 6497C
          C=C+1   A                              * 6497F
          C=C+1   A                              * 64981
          C=C+C   A                              * 64983
          B=B-C   A                              * 64985
          GOSBVL  SKIPOB                         * 64987
          CD0EX                                  * 6498E
          D0=C                                   * 64991
          D0=D0+  5                              * 64994
          D1=C                                   * 64997
          R3=C                                   * 6499A
          C=C-B   A                              * 6499D
          R4=C                                   * 6499F
          AD0EX                                  * 649A2
          D0=A                                   * 649A5
          C=R1                                   * 649A8
          C=C-A   A                              * 649AB
          GOSBVL  MOVEDOWN                       * 649AD
          C=R2                                   * 649B4
          DAT1=C  A                              * 649B7
          D1=(5)  DSKTOP                         * 649BA
          C=DAT1  A                              * 649C1
          B=C     A                              * 649C4
          A=R0                                   * 649C6
          A=A-C   A                              * 649C9
          A=-A    A                              * 649CB
          D1=A                                   * 649CD
          AD0EX                                  * 649D0
          D0=C                                   * 649D3
          C=A-C   A                              * 649D6
          GOSBVL  MOVEDOWN                       * 649D8
          A=R3                                   * 649DF
          B=A     A                              * 649E2
          C=R0                                   * 649E4
          A=A-C   A                              * 649E7
          R3=A                                   * 649E9
          C=R1                                   * 649EC
          C=C-B   A                              * 649EF
          R2=C                                   * 649F1
          AD0EX                                  * 649F4
          D1=A                                   * 649F7
L_649FA:
          C=R0                                   * 649FA
          A=R4                                   * 649FD
          A=A-C   A                              * 64A00
          GOC     L_64A10                        * 64A02
          R4=A                                   * 64A05
          GOSUB   SUB_64ADC                      * 64A08
          GOTO    L_649FA                        * 64A0C
L_64A10:
          C=C+A   A                              * 64A10
          GOSUB   SUB_64ADC                      * 64A12
          D0=(5)  DSKTOP                         * 64A16
          A=DAT0  A                              * 64A1D
          CD1EX                                  * 64A20
          D1=C                                   * 64A23
          B=C     A                              * 64A26
          C=C-A   A                              * 64A28
          D=C     A                              * 64A2A
          C=R0                                   * 64A2C
          C=C-B   A                              * 64A2F
          C=-C    A                              * 64A31
          D0=C                                   * 64A33
          C=D     A                              * 64A36
          GOSBVL  MOVEUP                         * 64A38
          D1=D1+  10                             * 64A3F
          A=DAT1  A                              * 64A42
          D1=(5)  USEROB                         * 64A45
          C=DAT1  A                              * 64A4C
          D1=A                                   * 64A4F
          D1=D1+  5                              * 64A52
          ?C#A    A                              * 64A55
          GOYES   L_64A72                        * 64A58
          C=0     A                              * 64A5A
          C=DAT1  X                              * 64A5C
          A=C     A                              * 64A60
          CSL     A                              * 64A62
          C=C-A   A                              * 64A64
          C=C-A   A                              * 64A66
          C=C-A   A                              * 64A68
          AD1EX                                  * 64A6A
          A=A+C   A                              * 64A6D
          D1=A                                   * 64A6F
L_64A72:
          D1=D1+  3                              * 64A72
          CD1EX                                  * 64A75
          D1=C                                   * 64A78
          A=B     A                              * 64A7B
          A=A-C   A                              * 64A7D
          DAT1=A  A                              * 64A7F
          A=R3                                   * 64A82
          C=R0                                   * 64A85
          A=A+C   A                              * 64A88
          R0=A.F  A                              * 64A8A
          ABEX    A                              * 64A90
          C=R1                                   * 64A92
          C=C-B   A                              * 64A95
          D=C     A                              * 64A97
          C=R1                                   * 64A99
          A=A-C   A                              * 64A9C
          C=A     A                              * 64A9E
          A=A+B   A                              * 64AA0
          D0=C                                   * 64AA2
          D0=D0-  5                              * 64AA5
          C=D     A                              * 64AA8
          GOSBVL  SUB_0686E                      * 64AAA
          D1=(5)  INITEN                         * 64AB1
          C=R0.F  S                              * 64AB8
          DAT1=C  S                              * 64ABE
          GOSBVL  GETPTR                         * 64AC2
          D1=D1+  15                             * 64AC9
          D=D+1   A                              * 64ACC
          D=D+1   A                              * 64ACE
          D=D+1   A                              * 64AD0
          A=DAT0  A                              * 64AD2
          D0=D0+  5                              * 64AD5
          PC=(A)                                 * 64AD8

* refs (2): 64A08 64A12
SUB_64ADC:
          D=C     A                              * 64ADC
          GOSBVL  MOVEUP                         * 64ADE
          CD1EX                                  * 64AE5
          DCEX    A                              * 64AE8
          AD0EX                                  * 64AEA
          D1=A                                   * 64AED
          B=A     A                              * 64AF0
          A=A+C   A                              * 64AF2
          D0=A                                   * 64AF4
          C=R2                                   * 64AF7
          GOSBVL  MOVEDOWN                       * 64AFA
          A=B     A                              * 64B01
          D0=A                                   * 64B03
          C=D     A                              * 64B06
          D1=C                                   * 64B08
          RTN                                    * 64B0B
        ENDCODE                                  * 64B0D
        NIBHEX  B2130                            * 64B0D  +1

* 44d 2Ch
* refs (6): 3A229 4D8D5 A4061 A5390 AC2DD D68AF
BINT44:
        #       2C                               * 64B12  44

* 45d 2Dh
* refs (41): 19DC0 1A76F 42104 43160 438DD 43991 ...
BINT45:
        #       2D                               * 64B1C  45

* 46d 2Eh
* refs (7): 8E90E 8F88A 8FA8C 8FC2F D6CE4 D87FB ...
BINT46:
        #       2E                               * 64B26  46

* 47d 2Fh
* refs (29): 1CC80 39E55 73A5D 73A7B 73DC0 A2BAC ...
BINT47:
        #       2F                               * 64B30  47

* 48d 30h
* refs (17): 1AC57 2E2A5 30B6C 41E91 8DDD6 BAE98 ...
BINT48:
        #       30                               * 64B3A  48

* 49d 31h
* refs (29): 41EA5 4D8E4 A596F A59AB A7B14 A7E55 ...
BINT49:
        #       31                               * 64B44  49

* 50d 32h
* refs (12): 46B5E 50D2F A7DDD AF991 B180A CE70A ...
BINT50:
        #       32                               * 64B4E  50

* 51d 33h
* refs (23): 167C4 1AC39 1CAC8 1E7BF 1E845 1E932 ...
BINT51:
        #       33                               * 64B58  51

* 52d 34h
* refs (12): 33396 39F5B A3498 ABCE2 AD04E AD0CA ...
BINT52:
        #       34                               * 64B62  52

* 53d 35h
* refs (5): 224DE 3316B 3997B C1F3A D5A31
BINT53:
        #       35                               * 64B6C  53

* 54d 36h
* refs (6): 36C57 73A99 73E10 98524 98730 D59BB
BINT54:
        #       36                               * 64B76  54

* 55d 37h
* refs (35): 1A60E 53847 A3F45 A3FA7 A7292 A72F4 ...
BINT55:
        #       37                               * 64B80  55

* 56d 38h
* refs (18): 3973E 397AC 3A582 A5F14 A71BB A7806 ...
BINT56:
        #       38                               * 64B8A  56

* 57d 39h
* refs (3): B26CE BB544 CE149
BINT57:
        #       39                               * 64B94  57

* 58d 3Ah
* refs (13): 397A7 479FC 4A2BC A35B3 A36FB A382A ...
BINT58:
        #       3A                               * 64B9E  58

* 59d 3Bh
* refs (3): 47AB5 B95DD BB6CE
BINT59:
        #       3B                               * 64BA8  59

* 60d 3Ch
* refs (29): 3AA19 3AFA7 9A4F8 9A686 9A6A9 9A6E3 ...
BINT60:
        #       3C                               * 64BB2  60

* 61d 3Dh
* refs (25): 3D94C 9A48D 9A73D 9A760 9BB6B 9BB8E ...
BINT61:
        #       3D                               * 64BBC  61

* 62d 3Eh
* refs (13): 385FC 3D97E 40A5B 40D52 40D66 40D7F ...
BINT62:
        #       3E                               * 64BC6  62

* 63d 3Fh
* refs (13): 1A891 398FE 39917 39944 399F2 39AC4 ...
BINT63:
        #       3F                               * 64BD0  63

* 64d 40h
* refs (32): 1DA07 1DA84 1DAF2 1DB3D 24CB2 31AAC ...
BINT64:
        #       40                               * 64BDA  64

* 65d 41h
* refs (15): 1AE52 1AF55 1BD87 1BE03 1D1A4 1D7DA ...
BINT65:
        #       41                               * 64BE4  65

* 66d 42h
* refs (6): 1AE5C 1AF5F 1D1AE 3346D 33A53 BBB7D
BINT66:
        #       42                               * 64BEE  66

* 67d 43h
* refs (22): 331B6 333A5 33427 334A4 335D0 3380F ...
BINT67:
        #       43                               * 64BF8  67

* 68d 44h
* refs (8): 1AC1B 1AD59 1AE66 1AF69 1C008 1C028 ...
BINT68:
        #       44                               * 64C02  68

* 69d 45h
* refs (14): 1D0E9 1D7D0 1D83E 1D8D1 1D93F 33508 ...
BINT69:
        #       45                               * 64C0C  69

* 70d 46h
* refs (16): 20542 2062A 20785 32016 32107 3FDDB ...
BINT70:
        #       46                               * 64C16  70

* 74d 4Ah
* refs (1): BBCA8
BINT74:
        #       4A                               * 64C20  74

* 79d 4Fh
* refs (11): 397B1 3980C A4A3F A4A99 A4BAF A50C5 ...
BINT79:
        #       4F                               * 64C2A  79

* refs (11): 12B99 1AC43 1B199 1CABE AE58A B2137 ...
OBJ_64C34:
        #       50                               * 64C34  80

* 81d 51h
* refs (10): 1D190 1D7EE 1D85C 1D8EF 1D95D 213DB ...
BINT81:
        #       51                               * 64C3E  81

* 82d 52h
* refs (2): 1D19A BBEEC
BINT82:
        #       52                               * 64C48  82

* 83d 53h
* refs (12): 331DE 33229 33567 3367A 33710 33BE3 ...
BINT83:
        #       53                               * 64C52  83

* 84d 54h
* refs (3): 333FA 33ADF BBF26
BINT84:
        #       54                               * 64C5C  84

* 85d 55h
* refs (25): 1AC2F 1D7E4 1D852 1D8E5 1D953 1E3A2 ...
BINT85:
        #       55                               * 64C66  85

* 86d 56h
* refs (3): 1F567 33BB6 BC1B9
BINT86:
        #       56                               * 64C70  86

* 87d 57h
* refs (2): 1F571 BBFF7
BINT87:
        #       57                               * 64C7A  87

* 91d 5Bh
* refs (24): 448F8 A5915 A7501 A7D83 A809C A8CBD ...
BINT91:
        #       5B                               * 64C84  91

* 96d 60h
* refs (8): 20469 2056A 20652 207AD 44907 556CA ...
BINT96:
        #       60                               * 64C8E  96

* 97d 61h
* refs (22): 1D1B8 1D80C 1D90D 20616 20771 213E5 ...
BINT97:
        #       61                               * 64C98  97

* 98d 62h
* refs (9): 1D1C2 20620 2077B 39811 39844 A7DBF ...
BINT98:
        #       62                               * 64CA2  98

* 100d 64h
* refs (15): 20560 20648 207A3 3983F 4168D 45E4C ...
BINT100:
        #       64                               * 64CAC  100

* 101d 65h
* refs (9): 1D0F3 1D7F8 1D8F9 3321F 33440 33530 ...
BINT101:
        #       65                               * 64CB6  101

* 111d 6Fh
* refs (2): 40472 41247
BINT111:
        #       6F                               * 64CC0  111

* 112d 70h
* refs (6): 20473 20574 2065C 207B7 556D4 AFB64
BINT112:
        #       70                               * 64CCA  112

* 113d 71h
* refs (6): 1D1CC 1D816 1D917 213EF A34AC A9598
BINT113:
        #       71                               * 64CD4  113

* 114d 72h
* refs (2): 39849 3987C
BINT114:
        #       72                               * 64CDE  114

* 115d 73h
* refs (7): A2966 A4643 A46A8 A470D A8D45 AEC36 ...
BINT115:
        #       73                               * 64CE8  115

* 116d 74h
* refs (1): 39877
BINT116:
        #       74                               * 64CF2  116

* 117d 75h
* refs (3): 1D0FD 1D802 1D903
BINT117:
        #       75                               * 64CFC  117

* 122d 7Ah
* refs (2): 448E9 BADCF
BINT122:
        #       7A                               * 64D06  122

* 128d 80h
* refs (2): 3FE49 D9B0F
BINT128:
        #       80                               * 64D10  128

* 130d 82h
* refs (3): 6CA67 8C681 8CC31
BINT130:
        #       82                               * 64D1A  130

* 131d 83h
* refs (51): 0E0C4 0E0EC 0E119 126F3 39881 39908 ...
BINT131:
        #       83                               * 64D24  131

* refs (4): 183A1 1CD35 852F1 85369
#8F_64D2E:
        #       8F                               * 64D2E  143

* 145d 91h
* refs (1): 1EFE6
SYMBREAL:
        #       91                               * 64D38  145

* 146d 92h
* refs (1): 1EFF0
SYMBCMP:
        #       92                               * 64D42  146

* 154d 9Ah
* refs (1): 1EFDC
SYMBSYM:
        #       9A                               * 64D4C  154

* 158d 9Eh
* refs (1): 1EFFA
SYMBUNIT:
        #       9E                               * 64D56  158

* 159d 9Fh
* refs (3): 183AB 1CD4F 852FB
backup:
        #       9F                               * 64D60  159

* 160d A0h
* refs (1): 1A4E1
SYMOB:
        #       A0                               * 64D6A  160

* 161d A1h
* refs (35): 1A91E 1ABE9 1AD77 1AE84 1AF87 1B073 ...
SYMREAL:
        #       A1                               * 64D74  161

* refs (8): 1A928 1ABFD 1AD81 1AE8E 1AF91 1B07D ...
OBJ_64D7E:
        #       A2                               * 64D7E  162

* 165d A5h
* refs (4): 1F35E 1FA77 1FAAB 20AF1
SYMLIST:
        #       A5                               * 64D88  165

* 166d A6h
* refs (3): 20A9D 20ABD 20ADD
SYMID:
        #       A6                               * 64D92  166

* 167d A7h
* refs (1): 20AE7
SYMLAM:
        #       A7                               * 64D9C  167

* 169d A9h
* refs (3): 1EF88 41629 416C9
SYMSYMB:
        #       A9                               * 64DA6  169

* 170d AAh
* refs (37): 1A932 1ABD5 1AD8B 1AE98 1AF9B 1B087 ...
SYMSYM:
        #       AA                               * 64DB0  170

* 174d AEh
* refs (25): 1A95A 1AC07 1ADB3 1AEC0 1AFC3 1B0AF ...
SYMEXT:
        #       AE                               * 64DBA  174

* 177d B1h
* refs (4): 1ABA3 1AD45 1AE2A 1AF41
HXSREAL:
        #       B1                               * 64DC4  177

* 187d BBh
* refs (16): 1ABAD 1AD4F 1AE34 1AF4B 1C6C0 1E215 ...
2HXS:
        #       BB                               * 64DCE  187

* 192d C0h
* refs (3): 3FE67 DAAE7 DAAF6
BINTC0h:
        #       C0                               * 64DD8  192

* 204d CCh
* refs (1): 1AC25
2GROB:
        #       CC                               * 64DE2  204

* 208d D0h
* refs (4): 1E9FE 1EB29 D2299 D2331
TAGGEDANY:
        #       D0                               * 64DEC  208

* 225d E1h
* refs (27): 196F9 1A950 1ABCB 1ADA9 1AEB6 1AFB9 ...
EXTREAL:
        #       E1                               * 64DF6  225

* 234d EAh
* refs (29): 1A964 1AC11 1ADBD 1AECA 1AFCD 1B0B9 ...
EXTSYM:
        #       EA                               * 64E00  234

* 238d EEh
* refs (26): 196E5 197AF 1A93C 1ABB7 1AD95 1AEA2 ...
2EXT:
        #       EE                               * 64E0A  238

* 240d F0h
* refs (1): 1F68B
ROMPANY:
        #       F0                               * 64E14  240

* 253d FDh
* refs (1): 244B0
BINT253:
        #       FD                               * 64E1E  253

* 255d FFh
* refs (3): 15F60 225FF 41697
BINT255d:
        #       FF                               * 64E28  255

* 256d 100h
* refs (5): 1A408 214B3 28147 DA9F9 DAA9B
REALOBOB:
        #       100                              * 64E32  256

* 258d 102h
* refs (3): 42C0B 43E77 DAB80
#_102:
        #       102                              * 64E3C  258

* 262d 106h
* refs (6): 2D8E8 2DF74 2F4DE 40B38 6B8EE D69D3
#SyntaxErr:
        #       106                              * 64E46  262

* 263d 107h
* refs (1): 15CED
BINT_263d:
        #       107                              * 64E50  263

* 272d 110h
* refs (2): 2819C 28205
REALREALOB:
        #       110                              * 64E5A  272

* 273d 111h
* refs (5): 1DECC 20044 20064 C0ECB C0F3D
3REAL:
        #       111                              * 64E64  273

* 291d 123h
* refs (4): 14424 1468B 38755 641A4
Err#Kill:
        #       123                              * 64E6E  291

* 292d 124h
* refs (1): 3DE7C
Err#NoLstStk:
        #       124                              * 64E78  292

* 305d 131h
* refs (1): 39C7A
#NoRoomForSt:
        #       131                              * 64E82  305

* refs (2): 0426F 38705
#132_64E8C:
        #       132                              * 64E8C  306

* 307d 133h
* refs (2): 2DD1A 388C7
REALSTRSTR:
        #       133                              * 64E96  307

* refs (1): 17C6F
#134_64EA0:
        #       134                              * 64EA0  308

* refs (1): 17BDB
#135_64EAA:
        #       135                              * 64EAA  309

* refs (1): 17E3E
#136_64EB4:
        #       136                              * 64EB4  310

* refs (1): 17D37
#137_64EBE:
        #       137                              * 64EBE  311

* refs (1): 17D0F
#138_64EC8:
        #       138                              * 64EC8  312

* refs (1): 17DEE
#139_64ED2:
        #       139                              * 64ED2  313

* refs (1): 17E16
#13A_64EDC:
        #       13A                              * 64EDC  314

* refs (1): 17D82
#13B_64EE6:
        #       13B                              * 64EE6  315

* refs (1): 17C9C
#13D_64EF0:
        #       13D                              * 64EF0  317

* 318d 13Eh
* refs (3): 143F7 38746 6419F
Err#Cont:
        #       13E                              * 64EFA  318

* 337d 151h
* refs (2): 3FDE0 D0EB6
INTEGER337:
        #       151                              * 64F04  337

* 512d 200h
* refs (1): 28151
CMPOBOB:
        #       200                              * 64F0E  512

* 517d 205h
* refs (1): 1A622
Err#NoLstArg:
        #       205                              * 64F18  517

* 785d 311h
* refs (1): 1C866
STRREALREAL:
        #       311                              * 64F22  785

* 1041d 411h
* refs (6): 1D46B 1D4B1 1D592 1D643 1D689 1D774
ARRYREALREAL:
        #       411                              * 64F2C  1041

* 1042d 412h
* refs (6): 1D475 1D4BB 1D59C 1D64D 1D693 1D77E
ARRYREALCMP:
        #       412                              * 64F36  1042

* 1092d 444h
* refs (1): 1C048
3ARRY:
        #       444                              * 64F40  1092

* 1105d 451h
* refs (6): 1D457 1D49D 1D57E 1D62F 1D675 1D760
ARRYLISTREAL:
        #       451                              * 64F4A  1105

* 1106d 452h
* refs (6): 1D461 1D4A7 1D588 1D639 1D67F 1D76A
ARRYLISTCMP:
        #       452                              * 64F54  1106

* 1296d 510h
* refs (6): 1D411 1D4CF 1D5B0 1D5E9 1D6A7 1D792
LISTREALOB:
        #       510                              * 64F5E  1296

* 1297d 511h
* refs (1): 1C870
LISTREALREAL:
        #       511                              * 64F68  1297

* 1360d 550h
* refs (6): 1D41B 1D4C5 1D5A6 1D5F3 1D69D 1D788
LISTLISTOB:
        #       550                              * 64F72  1360

* 1552d 610h
* refs (2): 1D43E 1D607
IDREALOB:
        #       610                              * 64F7C  1552

* 1616d 650h
* refs (2): 1D425 1D5FD
IDLISTOB:
        #       650                              * 64F86  1616

* 1792d 700h
* refs (2): 214C7 214DB
FSTMACROROM#:
        #       700                              * 64F90  1792

* 2145d 861h
* refs (1): 1F196
PROGIDREAL:
        #       861                              * 64F9A  2145

* 2146d 862h
* refs (1): 1F1A0
PROGIDCMP:
        #       862                              * 64FA4  2146

* 2149d 865h
* refs (1): 1F1AA
PROGIDLIST:
        #       865                              * 64FAE  2149

* 2158d 86Eh
* refs (1): 1F1BE
PROGIDEXT:
        #       86E                              * 64FB8  2158

* 2563d A03h
* refs (2): 2E4AA 2EFB4
ATTNERR:
        #       A03                              * 64FC2  2563

* 2577d A11h
* refs (1): 1A412
SYMREALREAL:
        #       A11                              * 64FCC  2577

* 2578d A12h
* refs (1): 1A41C
SYMREALCMP:
        #       A12                              * 64FD6  2578

* 2586d A1Ah
* refs (1): 1A44E
SYMREALSYM:
        #       A1A                              * 64FE0  2586

* 2593d A21h
* refs (1): 1A426
SYMCMPREAL:
        #       A21                              * 64FEA  2593

* 2594d A22h
* refs (1): 1A430
SYMCMPCMP:
        #       A22                              * 64FF4  2594

* 2602d A2Ah
* refs (1): 1A458
SYMCMPSYM:
        #       A2A                              * 64FFE  2602

* 2657d A61h
* refs (2): 1F178 20B2A
SYMIDREAL:
        #       A61                              * 65008  2657

* 2658d A62h
* refs (1): 1F182
SYMIDCMP:
        #       A62                              * 65012  2658

* 2661d A65h
* refs (1): 1F18C
SYMIDLIST:
        #       A65                              * 6501C  2661

* 2670d A6Eh
* refs (1): 1F1B4
SYMIDEXT:
        #       A6E                              * 65026  2670

* 2721d AA1h
* refs (1): 1A43A
SYMSYMREAL:
        #       AA1                              * 65030  2721

* 2722d AA2h
* refs (1): 1A444
SYMSYMCMP:
        #       AA2                              * 6503A  2722

* 2730d AAAh
* refs (1): 1A462
3SYM:
        #       AAA                              * 65044  2730

* 3078d C06h
* refs (3): 2D686 2F009 2F6C8
XFERFAIL:
        #       C06                              * 6504E  3078

* 3079d C07h
* refs (1): 30A3F
PROTERR:
        #       C07                              * 65058  3079

* 3080d C08h
* refs (1): 2DC02
InvalServCmd:
        #       C08                              * 65062  3080

* 3082d C0Ah
* refs (2): 2D4C7 2D820
Connecting:
        #       C0A                              * 6506C  3082

* 3083d C0Bh
* refs (1): 2D7D5
Retry:
        #       C0B                              * 65076  3083

* 3583d DFFh
* refs (4): 38778 4247F 641A9 D4A03
#CAlarmErr:
        #       DFF                              * 65080  3583

* 3584d E00h
* refs (1): 2815B
EXTOBOB:
        #       E00                              * 6508A  3584

* 458752d 70000h
* refs (4): 04D69 15052 2D906 388B3
#EXITERR:
        #       70000                            * 65094  458752

* 1048575d FFFFFh
* refs (762): 15E6A 16108 16DC7 19A25 19AB9 1F89D ...
MINUSONE:
        #       FFFFF                            * 6509E  1048575

* e
* refs (2): 3C0B2 54D85
%e:
        %       2.71828182846E0                  * 650A8

* .5
* refs (9): 0F931 8AD1A 8ADDF 8AE8A 8B074 8B11F ...
%.5:
        %       5E-1                             * 650BD

* -.5
* refs (5): 4F2AF 50375 50389 8AE1E 8B0B3
%-.5:
        %       -5E-1                            * 650D2

* 10
* refs (28): 0FC0F 0FC1E 1CBF9 41D9C 4803A 4AB8F ...
%10:
        %       1E1                              * 650E7

* 180
* refs (6): 56C36 56C90 577FC 5B4BA 5DDCE 5DE0A
%180:
        %       1.8E2                            * 650FC

* 200
* refs (6): 56C54 56CAE 57801 5B4D8 5DDD3 5DE0F
%200:
        %       2E2                              * 65111

* 360
* refs (2): 5150A 5779D
%360:
        %       3.6E2                            * 65126

* 400
* refs (2): 5150F 577A2
%400:
        %       4E2                              * 6513B

* "]"
* refs (9): 1712B 174C8 24834 24884 24960 249CE ...
tok]:
        $       "]"                              * 65150

* refs (1): 170DB
lbrac:
        $       "[ "                             * 6515C

* "["
* refs (8): 17180 174AF 243C5 24825 2496F 249DD ...
tok[:
        $       "["                              * 6516A

* "{"
* refs (2): 243D4 39A38
tok{:
        $       "{"                              * 65176

* "}"
* refs (1): 24C3F
tok}:
        $       "}"                              * 65182

* "#"
* refs (1): 243E3
toksharp:
        $       "#"                              * 6518E

* "_"
* refs (4): 0F31C 2444C 28DF3 689EA
tokuscore:
        $       "_"                              * 6519A

* "$"
* refs (1): 24FEB
tok$:
        $       "$"                              * 651A6

* "&"
* refs (2): 3F0CF 853E6
tok&:
        $       "&"                              * 651B2

* "\1B"
* refs (1): 56FB3
tokESC:
        $       "\1B"                            * 651BE

* ">>"
* refs (2): 23E0C 242DF
tok>>:
        $       "»"                              * 651CA

* "<<"
* refs (5): 20E32 241DB 244FB 24C4E 24E0B
tok<<:
        $       "«"                              * 651D6

* "E"
* refs (2): 24FFA 25D08
tokexponent:
        $       "E"                              * 651E2

* "ANG"
* refs (10): 176DA 247A3 248BB 248E8 28450 2950C ...
tokanglesign:
        $       "∡"                              * 651EE

* "SIGMA"
tokSIGMA:
        $       "Σ"                              * 651FA

* "|"
tokWHERE:
        $       "|"                              * 65206

* "\ \ \ \ \ \ \ \ \ \ \ \ \ \ "
* refs (2): 1793C 45E8D
14SPACES$:
        $       "              "                 * 65212

* "\0a"
* refs (6): 2DD2E 321B1 63196 B8772 D0F02 D0F4D
NEWLINE$:
        $       "\0A"                            * 65238

* "der"
* refs (1): 56F54
$DER:
        $       "der"                            * 65244

* "\ "
* refs (23): 148DE 149FB 14A8C 14B1D 15E38 16DD6 ...
SPACE$:
        $       " "                              * 65254

* "UNKNOWN"
* refs (1): 5FA22
tokUNKNOWN:
        $       "UNKNOWN"                        * 65260

* """
* refs (1): 243F2
tokquote:
        $       "\""                             * 65278

* "'"
* refs (12): 23A33 241CC 243A7 24744 273E1 29104 ...
tok':
        $       "'"                              * 65284

* ","
* refs (6): 1755E 25009 25D17 27FAD 35162 68C6A
tok,:
        $       ","                              * 65290

* "."
* refs (3): 25004 25D12 27FB2
tok.:
        $       "."                              * 6529C

* ";"
* refs (11): 17563 2741D 276BB 27E7C 294FD 2956B ...
tok;:
        $       ";"                              * 652A8

* "("
* refs (22): 17531 18191 243B6 248A2 24988 24E8D ...
toklparen:
        $       "("                              * 652B4

* ")"
* refs (16): 17554 181AF 247DA 273FF 27E27 2875B ...
tokrparen:
        $       ")"                              * 652C0

* "^"
* refs (3): 0F303 287F6 28846
tok^:
        $       "^"                              * 652CC

* "*"
* refs (8): 0F2BD 287D8 69223 6922D 692B0 692C9 ...
tok*:
        $       "*"                              * 652D8

* "/"
* refs (2): 0F2E0 287E7
tok/:
        $       "/"                              * 652E4

* "+"
* refs (1): 340D3
tok+:
        $       "+"                              * 652F0

* "-"
* refs (2): 288B9 5FA13
tok-:
        $       "-"                              * 652FC

* "="
* refs (8): 2742C 27E4F 294E9 66264 68B89 695F8 ...
tok=:
        $       "="                              * 65308

* "SQRT"
tokSQRT:
        $       "√"                              * 65314

* "DERIV"
* refs (1): 6D9E0
tokDER:
        $       "∂"                              * 65320

* "GROB"
* refs (1): 2442E
tokCTGROB:
        $       "GROB"                           * 6532C

* "C$"
* refs (1): 2441F
tokCTSTR:
        $       "C$"                             * 6533E

* "0"
* refs (1): 45D3E
tok0:
        $       "0"                              * 6534C

* "1"
* refs (19): 100A6 10225 1083D 108A1 108E2 109BE ...
tok1:
        $       "1"                              * 65358

* "2"
tok2:
        $       "2"                              * 65364

* "3"
tok3:
        $       "3"                              * 65370

* "4"
tok4:
        $       "4"                              * 6537C

* "5"
tok5:
        $       "5"                              * 65388

* "6"
tok6:
        $       "6"                              * 65394

* "7"
tok7:
        $       "7"                              * 653A0

* "8"
tok8:
        $       "8"                              * 653AC

* "9"
tok9:
        $       "9"                              * 653B8
        FILLTO  #6541E                           * 653C4  90 zero nibbles: the next entry stays at #6541E

* '\00', CHR   0d 00h
* refs (5): 3E693 42791 42C47 44496 BAE06
CHR_00:
        CHR     "\00"                            * 6541E

* '...', CHR  31d 1Fh
* refs (12): 12798 3A1A2 3A1BB 8D6D9 8DF5B 8E753 ...
CHR_...:
        CHR     "\1F"                            * 65425

* '"',   CHR  34d 22h
* refs (1): 15EF1
CHR_DblQuote:
        CHR     "\""                             * 6542C

* '#',   CHR  35d 23h
* refs (1): 3E030
CHR_#:
        CHR     "#"                              * 65433

* '*',   CHR  42d 2Ah
CHR_*:
        CHR     "*"                              * 6543A

* '+',   CHR  43d 2Bh
CHR_+:
        CHR     "+"                              * 65441

* ',',   CHR  44d 2Ch
* refs (5): 2FE6B 3B805 3DB50 6BC69 6BC82
CHR_,:
        CHR     ","                              * 65448

* '-',   CHR  45d 2Dh
* refs (3): 3B5DC 6BD17 D9D55
CHR_-:
        CHR     "-"                              * 6544F

* '.',   CHR  46d 2Eh
* refs (3): 2FE66 3B80A 6BC87
CHR_.:
        CHR     "."                              * 65456

* '/',   CHR  47d 2Fh
CHR_/:
        CHR     "/"                              * 6545D

* '0',   CHR  48d 30h
* refs (1): AE3DB
CHR_0:
        CHR     "0"                              * 65464

* '1',   CHR  49d 31h
CHR_1:
        CHR     "1"                              * 6546B

* '2',   CHR  50d 32h
CHR_2:
        CHR     "2"                              * 65472

* '3',   CHR  51d 33h
CHR_3:
        CHR     "3"                              * 65479

* '4',   CHR  52d 34h
CHR_4:
        CHR     "4"                              * 65480

* '5',   CHR  53d 35h
CHR_5:
        CHR     "5"                              * 65487

* '6',   CHR  54d 36h
CHR_6:
        CHR     "6"                              * 6548E

* '7',   CHR  55d 37h
CHR_7:
        CHR     "7"                              * 65495

* '8',   CHR  56d 38h
CHR_8:
        CHR     "8"                              * 6549C

* '9',   CHR  57d 39h
CHR_9:
        CHR     "9"                              * 654A3

* ':',   CHR  58d 3Ah
* refs (6): 8D674 9D151 9D652 A3269 B3EA0 BAE84
CHR_::
        CHR     ":"                              * 654AA

* ';',   CHR  59d 3Bh
* refs (3): 2F180 3DB4B 6BC64
CHR_;:
        CHR     ";"                              * 654B1

* '<',   CHR  60d 3Ch
* refs (1): 15D1F
CHR_<:
        CHR     "<"                              * 654B8

* '=',   CHR  61d 3Dh
CHR_=:
        CHR     "="                              * 654BF

* '>',   CHR  62d 3Eh
* refs (1): 15D29
CHR_>:
        CHR     ">"                              * 654C6

* 'A',   CHR  65d 41h
CHR_A:
        CHR     "A"                              * 654CD

* 'B',   CHR  66d 42h
* refs (2): 2D59B 2F786
CHR_B:
        CHR     "B"                              * 654D4

* 'C',   CHR  67d 43h
* refs (2): 2DBB2 B8A68
CHR_C:
        CHR     "C"                              * 654DB

* 'D',   CHR  68d 44h
* refs (136): 2DECA 2F347 2FA1F 2FA8D 2FAFB A0F7C ...
CHR_D:
        CHR     "D"                              * 654E2

* 'E',   CHR  69d 45h
* refs (5): 1129E 2DBD5 2E0E5 2EFDC 6BD0D
CHR_E:
        CHR     "E"                              * 654E9

* 'F',   CHR  70d 46h
* refs (6): 2DEA7 2E022 2E6FF 2F76D 2FB0A 855A0
CHR_F:
        CHR     "F"                              * 654F0

* 'G',   CHR  71d 47h
* refs (1): 2DBC1
CHR_G:
        CHR     "G"                              * 654F7

* 'H',   CHR  72d 48h
CHR_H:
        CHR     "H"                              * 654FE

* 'I',   CHR  73d 49h
* refs (2): 2D521 2DB85
CHR_I:
        CHR     "I"                              * 65505

* 'J',   CHR  74d 4Ah
CHR_J:
        CHR     "J"                              * 6550C

* 'K',   CHR  75d 4Bh
CHR_K:
        CHR     "K"                              * 65513

* 'L',   CHR  76d 4Ch
* refs (1): 2DEB6
CHR_L:
        CHR     "L"                              * 6551A

* 'M',   CHR  77d 4Dh
CHR_M:
        CHR     "M"                              * 65521

* 'N',   CHR  78d 4Eh
* refs (3): 2D6A4 2E0B8 2F9CF
CHR_N:
        CHR     "N"                              * 65528

* 'O',   CHR  79d 4Fh
CHR_O:
        CHR     "O"                              * 6552F

* 'P',   CHR  80d 50h
CHR_P:
        CHR     "P"                              * 65536

* 'Q',   CHR  81d 51h
CHR_Q:
        CHR     "Q"                              * 6553D

* 'R',   CHR  82d 52h
* refs (1): 2DBA3
CHR_R:
        CHR     "R"                              * 65544

* 'S',   CHR  83d 53h
* refs (4): 2D8AC 2DB76 2EEF6 2F826
CHR_S:
        CHR     "S"                              * 6554B

* 'T',   CHR  84d 54h
CHR_T:
        CHR     "T"                              * 65552

* 'U',   CHR  85d 55h
CHR_U:
        CHR     "U"                              * 65559

* 'V',   CHR  86d 56h
CHR_V:
        CHR     "V"                              * 65560

* 'W',   CHR  87d 57h
CHR_W:
        CHR     "W"                              * 65567

* 'X',   CHR  88d 58h
* refs (4): 2DE0A 2F117 2F7C2 2FB19
CHR_X:
        CHR     "X"                              * 6556E

* 'Y',   CHR  89d 59h
* refs (2): 2D627 2FEA6
CHR_Y:
        CHR     "Y"                              * 65575

* 'Z',   CHR  90d 5Ah
* refs (3): 2F365 2F7F4 2FA60
CHR_Z:
        CHR     "Z"                              * 6557C

* 'a',   CHR  97d 61h
CHR_a:
        CHR     "a"                              * 65583

* 'b',   CHR  98d 62h
* refs (1): 5408E
CHR_b:
        CHR     "b"                              * 6558A

* 'c',   CHR  99d 63h
* refs (15): CD5D6 EAE56 EAE7E EAF86 EAFAE EB132 ...
CHR_c:
        CHR     "c"                              * 65591

* 'd',   CHR 100d 64h
* refs (1): 540AC
CHR_d:
        CHR     "d"                              * 65598

* 'e',   CHR 101d 65h
CHR_e:
        CHR     "e"                              * 6559F

* 'f',   CHR 102d 66h
CHR_f:
        CHR     "f"                              * 655A6

* 'g',   CHR 103d 67h
CHR_g:
        CHR     "g"                              * 655AD

* 'h',   CHR 104d 68h
* refs (1): 540B1
CHR_h:
        CHR     "h"                              * 655B4

* 'i',   CHR 105d 69h
CHR_i:
        CHR     "i"                              * 655BB

* 'j',   CHR 106d 6Ah
CHR_j:
        CHR     "j"                              * 655C2

* 'k',   CHR 107d 6Bh
* refs (18): A1588 A1725 A1806 A1845 A187D EAC59 ...
CHR_k:
        CHR     "k"                              * 655C9

* 'l',   CHR 108d 6Ch
CHR_l:
        CHR     "l"                              * 655D0

* 'm',   CHR 109d 5Dh
* refs (4): EAC85 EAED7 EB796 EB7C0
CHR_m:
        CHR     "m"                              * 655D7

* 'n',   CHR 110d 6Eh
* refs (6): A1986 A1A3B A1AA0 EB0B5 EB281 EB825
CHR_n:
        CHR     "n"                              * 655DE

* 'o',   CHR 111d 6Fh
* refs (1): 5409D
CHR_o:
        CHR     "o"                              * 655E5

* 'p',   CHR 112d 70h
* refs (1): EB95D
CHR_p:
        CHR     "p"                              * 655EC

* 'q',   CHR 113d 71h
CHR_q:
        CHR     "q"                              * 655F3

* 'r',   CHR 114d 72h
CHR_r:
        CHR     "r"                              * 655FA

* 's',   CHR 115d 73h
CHR_s:
        CHR     "s"                              * 65601

* 't',   CHR 116d 74h
CHR_t:
        CHR     "t"                              * 65608

* 'u',   CHR 117d 75h
CHR_u:
        CHR     "u"                              * 6560F

* 'v',   CHR 118d 76h
CHR_v:
        CHR     "v"                              * 65616

* 'w',   CHR 119d 77h
CHR_w:
        CHR     "w"                              * 6561D

* 'x',   CHR 120d 78h
CHR_x:
        CHR     "x"                              * 65624

* 'y',   CHR 121d 79h
CHR_y:
        CHR     "y"                              * 6562B

* 'z',   CHR 122d 7Ah
CHR_z:
        CHR     "z"                              * 65632

* '->', CHR 141d 8Dh
CHR_->:
        CHR     "→"                              * 65639

* '<<', CHR 171d ABh
CHR_<<:
        CHR     "«"                              * 65640

* '>>', CHR 187d BBh
CHR_>>:
        CHR     "»"                              * 65647

* 'ANG', CHR 128d 80h
CHR_Angle:
        CHR     "∡"                              * 6564E

* 'DERIV', CHR 136d 88h
CHR_Deriv:
        CHR     "∂"                              * 65655

* 'INTEG', CHR 132d 84h
CHR_Integral:
        CHR     "∫"                              * 6565C

* '(',   CHR  40d 28h
CHR_LeftPar:
        CHR     "("                              * 65663

* '\0a', CHR  10d 0Ah
* refs (13): 127B1 14AB4 3A107 3E65C 3E6A7 42B7F ...
CHR_Newline:
        CHR     "\0A"                            * 6566A

* 'pi', CHR 135d 87h
CHR_Pi:
        CHR     "π"                              * 65671

* ')',   CHR  41d 29h
* refs (1): A9CC1
CHR_RightPar:
        CHR     ")"                              * 65678

* 'SIGMA', CHR 133d 85h
CHR_Sigma:
        CHR     "Σ"                              * 6567F

* '\ ',  CHR  32d 20h
* refs (19): 14AAA 14AC3 14D91 170CC 3E64D 406C5 ...
CHR_Space:
        CHR     " "                              * 65686

* '_',   CHR  95d 5Fh
* refs (2): 3E089 4133C
CHR_UndScore:
        CHR     "_"                              * 6568D

* '[',   CHR  91d 5Bh
* refs (2): 170C7 B8931
CHR_[:
        CHR     "["                              * 65694

* ']',   CHR  93d 5Dh
CHR_]:
        CHR     "]"                              * 6569B

* '{',   CHR 123d 7Bh
CHR_{:
        CHR     "{"                              * 656A2

* '{',   CHR 125d 7Dh
CHR_}:
        CHR     "}"                              * 656A9

* '<=', CHR 137d 89h
CHR_<=:
        CHR     "≤"                              * 656B0

* '>=', CHR 138d 8Ah
CHR_>=:
        CHR     "≥"                              * 656B7

* '<>', CHR 139d 8Bh
CHR_<>:
        CHR     "≠"                              * 656BE

* "RANGANG"
* refs (1): 396E6
$_R<<:
        $       "R∡∡"                            * 656C5

* "RANGZ"
* refs (1): 396EB
$_R<Z:
        $       "R∡Z"                            * 656D5

* "XYZ"
* refs (1): 406E8
$_XYZ:
        $       "XYZ"                            * 656E5

* "<<>>"
* refs (2): 3AA41 3BB41
$_<<>>:
        $       "«»"                             * 656F5

* "{}"
* refs (1): 3DB74
$_{}:
        $       "{}"                             * 65703

* "[]"
* refs (1): 3DA83
$_[]:
        $       "[]"                             * 65711

* "''"
* refs (1): 3B3DC
$_'':
        $       "''"                             * 6571F

* "::"
* refs (1): 3E13F
$_:::
        $       "::"                             * 6572D

* "()"
* refs (2): 3D9F4 40689
$_LRParens:
        $       "()"                             * 6573B

* """"
* refs (1): 3E0E2
$_2DQ:
        $       "\"\""                           * 65749

* "ECHO"
* refs (1): 43D1A
$_ECHO:
        $       "ECHO"                           * 65757

* "EXIT"
* refs (1): 6AA5A
$_EXIT:
        $       "EXIT"                           * 65769

* "Undefined"
* refs (1): 414AE
$_Undefined:
        $       "Undefined"                      * 6577B

* "RAD"
* refs (3): 39687 3C8F0 C6236
$_RAD:
        $       "RAD"                            * 65797

* "GRAD"
* refs (2): 396A5 C626D
$_GRAD:
        $       "GRAD"                           * 657A7
        ASSEMBLE

* refs (2): 30094 80343
SUB_657B9:
        GOSUB   SUB_657DF                        * 657B9
        C=0     A                                * 657BD
        LC(1)   #6                               * 657BF
        A=C     A                                * 657C2
        GOTO    L_657D1                          * 657C4
L_657C8:
        BSR     W                                * 657C8
        CSL     W                                * 657CB
        CSL     W                                * 657CE
L_657D1:
        LC(2)   #30                              * 657D1
        C=B     P                                * 657D5
        A=A-1   A                                * 657D8
        GONC    L_657C8                          * 657DA
        RTN                                      * 657DD

* refs (1): 657B9
SUB_657DF:
        P=      0                                * 657DF
        C=0     A                                * 657E1
        LC(2)   #23                              * 657E3
        B=0     W                                * 657E7
        P=      5                                * 657EA
L_657EC:
        B=B+B   W                                * 657EC
        SETHEX                                   * 657EF
        A=A+A   WP                               * 657F1
        SETDEC                                   * 657F4
        GONC    L_657FC                          * 657F6
        B=B+1   W                                * 657F9
L_657FC:
        C=C-1   A                                * 657FC
        GONC    L_657EC                          * 657FE
        P=      0                                * 65801
        SETHEX                                   * 65803
        RTNCC                                    * 65805

* refs (12): 017E1 017FE 01855 0D55B 0D69C 0D793 ...
SUB_65807:
        P=      0                                * 65807
L_65809:
        ?C#0    S                                * 65809
        GOYES   L_6581B                          * 6580C
        ?C>=A   W                                * 6580E
        GOYES   L_6581B                          * 65811
        CSL     W                                * 65813
        P=P+1                                    * 65816
        GONC    L_65809                          * 65818
L_6581B:
        B=A     W                                * 6581B
        A=0     W                                * 6581E
        A=A-1   P                                * 65821
L_65824:
        A=A+1   P                                * 65824
L_65827:
        B=B-C   W                                * 65827
        GONC    L_65824                          * 6582A
        B=B+C   W                                * 6582D
        P=P-1                                    * 65830
        GOC     L_6583B                          * 65832
        CSR     W                                * 65835
        GONC    L_65827                          * 65838
L_6583B:
        C=A     W                                * 6583B
        P=      0                                * 6583E
        RTNCC                                    * 65840

* refs (4): 658A3 658B3 658C3 658D3
SUB_65842:
        C=C&A   B                                * 65842
        B=0     A                                * 65846
L_65848:
        ?C=0    B                                * 65848
        GOYES   L_65858                          * 6584B
L_6584D:
        C=C+C   B                                * 6584D
        GONC    L_6584D                          * 65850
        B=B+1   A                                * 65853
        GONC    L_65848                          * 65855
L_65858:
        C=B     A                                * 65858
        ?CBIT=0 0                                * 6585A
        RTNYES                                   * 6585F
        RTNCC                                    * 65861

* refs (2): 658E2 658E6
SUB_65863:
        C=C+C   WP                               * 65863
        C=C+C   WP                               * 65866
        CBIT=1  1                                * 65869
        ?ABIT=0 0                                * 6586E
        GOYES   L_6587F                          * 65873
        CBIT=0  1                                * 65875
        CBIT=1  0                                * 6587A
L_6587F:
        ASRB.F  X                                * 6587F
        RTN                                      * 65884
L_65886:
        P=      0                                * 65886
        SETHEX                                   * 65888
        D0=(5)  ANNCTRL                          * 6588A
        C=DAT0  B                                * 65891
        CBIT=1  5                                * 65894
        DAT0=C  B                                * 65899
        A=0     XS                               * 6589C
        LC(2)   #78                              * 6589F
        GOSUB   SUB_65842                        * 658A3
        GOC     L_658AF                          * 658A7
        ABIT=1  11                               * 658AA
L_658AF:
        LC(2)   #E6                              * 658AF
        GOSUB   SUB_65842                        * 658B3
        GOC     L_658BF                          * 658B7
        ABIT=1  10                               * 658BA
L_658BF:
        LC(2)   #D5                              * 658BF
        GOSUB   SUB_65842                        * 658C3
        GOC     L_658CF                          * 658C7
        ABIT=1  9                                * 658CA
L_658CF:
        LC(2)   #8B                              * 658CF
        GOSUB   SUB_65842                        * 658D3
        GOC     L_658DF                          * 658D7
        ABIT=1  8                                * 658DA
L_658DF:
        C=0     W                                * 658DF
L_658E2:
        GOSUB   SUB_65863                        * 658E2
        GOSUB   SUB_65863                        * 658E6
        P=P+1                                    * 658EA
        ?P#     6                                * 658EC
        GOYES   L_658E2                          * 658EF
        CSL     WP                               * 658F1
        P=      0                                * 658F4
        LC(1)   #E                               * 658F6
        C=C+C   W                                * 658F9
        C=C+C   W                                * 658FC
        A=C     W                                * 658FF
        LC(2)   #44                              * 65902
L_65906:
        GOSBVL  SUB_4DAFD                        * 65906
        ?CBIT=1 9                                * 6590D
        GOYES   L_65906                          * 65912
        LC(2)   #1D                              * 65914
        B=C     A                                * 65918
L_6591A:
        LC(2)   #44                              * 6591A
L_6591E:
        GOSBVL  SUB_4DAFD                        * 6591E
        ?CBIT=1 8                                * 65925
        GOYES   L_6591E                          * 6592A
        D0=(5)  #0011D                           * 6592C
        C=0     A                                * 65933
        ?ABIT=0 0                                * 65935
        GOYES   L_6593E                          * 6593A
        C=C+1   A                                * 6593C
L_6593E:
        DAT0=C  1                                * 6593E
        ASRB                                     * 65942
        B=B-1   B                                * 65945
        GONC    L_6591A                          * 65948
        RTNCC                                    * 6594B
        NIBHEX  0                                * 6594D

* hxs hxs ->
putnibs:
        CON(5)  (*)+5                            * 6594E  primitive code object
        ST=1    0                                * 65953
        GOTO    L_65962                          * 65956

* hxs hxs -> hxs'
getnibs:
        CON(5)  (*)+5                            * 6595A  primitive code object
        ST=0    0                                * 6595F
L_65962:
        A=DAT1  A                                * 65962
        AD1EX                                    * 65965
        D1=D1+  10                               * 65968
        C=DAT1  A                                * 6596B
        R0=C                                     * 6596E
        D1=A                                     * 65971
        D1=D1+  5                                * 65974
        D=D+1   A                                * 65977
        ?ST=0   0                                * 65979
        GOYES   L_65991                          * 6597C
        A=DAT1  A                                * 6597E
        D1=D1+  5                                * 65981
        D=D+1   A                                * 65984
        GOSBVL  SAVPTR                           * 65986
        GOTO    L_6599B                          * 6598D
L_65991:
        GOSBVL  SAVPTR                           * 65991
        A=DAT1  A                                * 65998
L_6599B:
        D1=A                                     * 6599B
        D1=D1+  5                                * 6599E
        C=DAT1  A                                * 659A1
        C=C-CON A,6                              * 659A4
        GOC     L_659D7                          * 659AA
        D1=D1+  5                                * 659AD
        CPEX    0                                * 659B0
        ?C#0    A                                * 659B4
        GOYES   L_659D7                          * 659B7
        C=R0                                     * 659B9
        D0=C                                     * 659BC
        ?ST=0   0                                * 659BF
        GOYES   L_659CD                          * 659C2
        CD0EX                                    * 659C4
        CD1EX                                    * 659C7
        CD0EX                                    * 659CA
L_659CD:
        C=DAT0  WP                               * 659CD
        DAT1=C  WP                               * 659D1
        P=      0                                * 659D5
L_659D7:
        GOVLNG  GETPTRLOOP                       * 659D7
        RPL

* symb ->
* refs (1): 9CB7A
Symb>HBuff:
        ::                                       * 659DE
          POLSaveUI                              * 659E3
          ERRSET                                 * 659E8
          OBJ_6C514                              * 659ED
          ERRTRAP                                * 659F2
          POLResUI&Err                           * 659F7
          POLRestoreUI                           * 659FC
        ;                                        * 65A01

* refs (1): 68425
OBJ_65A06:
        ::                                       * 65A06
          OBJ_67ABC                              * 65A0B
          SWAP                                   * 65A10
          #2/                                    * 65A15
          SWAP                                   * 65A1A
          #2/                                    * 65A1F
        ;                                        * 65A24

* refs (1): 683F8
OBJ_65A29:
        CON(5)  (*)+5                            * 65A29  primitive code object
        ASSEMBLE
        A=DAT0  A                                * 65A2E
        D0=D0+  5                                * 65A31
        PC=(A)                                   * 65A34
        RPL

* refs (2): 68402 6D1D6
OBJ_65A38:
        ::                                       * 65A38
          DUP                                    * 65A3D
          GOTO                                   * 65A42
          L_6E12C                                * 65A47
        ;                                        * 65A4C

* refs (1): 1F1F7
OBJ_65A51:
        ::                                       * 65A51
          SKIP                                   * 65A56
          OBJ_65C90                              * 65A5B
          OBJ_6CFA1                              * 65A60
          3DROP                                  * 65A65
          BINT10                                 * 65A6A
          ROLL                                   * 65A6F
          #1+                                    * 65A74
          10UNROLL                               * 65A79
          OBJ_6E0A1                              * 65A7E
          OBJ_68183                              * 65A83
          #3+                                    * 65A88
          OBJ_65B0A                              * 65A8D
          OBJ_6C873                              * 65A92
          OBJ_6D8DC                              * 65A97
          OBJ_6DD6E                              * 65A9C
          OBJ_67348                              * 65AA1
          OBJ_67416                              * 65AA6
          OBJ_6D9C2                              * 65AAB
          BINT5                                  * 65AB0
          OBJ_65B0A                              * 65AB5
          DUP                                    * 65ABA
          OBJ_44CA0                              * 65ABF
          BINT6                                  * 65AC4
          ROT                                    * 65AC9
          OBJ_6DA4E                              * 65ACE
          OBJ_682DE                              * 65AD3
          OBJ_67381                              * 65AD8
          #9+                                    * 65ADD
          OBJ_67348                              * 65AE2
          OBJ_67381                              * 65AE7
          OBJ_67356                              * 65AEC
          OBJ_67364                              * 65AF1
          MINUSONE                               * 65AF6
          ZEROZERO                               * 65AFB
          NULLPAINT                              * 65B00
          OBJ_6E0A1                              * 65B05

* refs (2): 65A8D 65AB5
OBJ_65B0A:
          ::                                     * 65B0A
            OBJ_6E0C0                            * 65B0F
            #2*                                  * 65B14
            OBJ_6E057                            * 65B19
            #+                                   * 65B1E
          ;                                      * 65B23
          OBJ_6C873                              * 65B28
          OBJ_6D990                              * 65B2D
          OBJ_682DE                              * 65B32
          OBJ_6DD6E                              * 65B37
          OBJ_67381                              * 65B3C
          #8+                                    * 65B41
          OBJ_67381                              * 65B46
          OBJ_6DD6E                              * 65B4B
          OBJ_6E0C0                              * 65B50
          OBJ_6E057                              * 65B55
          #+                                     * 65B5A
          OBJ_6E0A1                              * 65B5F
          OBJ_6DC51                              * 65B64
          OBJ_682DE                              * 65B69
          OBJ_67381                              * 65B6E
          #6+                                    * 65B73
          OBJ_67348                              * 65B78
          DUP                                    * 65B7D
          #3-                                    * 65B82
          BINT0                                  * 65B87
          OBJ_67416                              * 65B8C
          OBJ_6D39D                              * 65B91
          OBJ_6E0A1                              * 65B96
          OBJ_6819D                              * 65B9B
          #1+                                    * 65BA0
          OBJ_6E057                              * 65BA5
          OBJ_6DCA6                              * 65BAA
          OBJ_682DE                              * 65BAF
          OBJ_6DD6E                              * 65BB4
          OBJ_67348                              * 65BB9
          OBJ_67381                              * 65BBE

* refs (1): 65BFA
OBJ_65BC3:
          ::                                     * 65BC3
            OBJ_6DD6E                            * 65BC8
            OBJ_6E057                            * 65BCD
            BINT2                                * 65BD2
            OBJ_6DC51                            * 65BD7
            OBJ_682DE                            * 65BDC
          ;                                      * 65BE1
          ZEROZERO                               * 65BE6
          OBJ_67381                              * 65BEB
          OBJ_67348                              * 65BF0
          OBJ_67364                              * 65BF5
          OBJ_65BC3                              * 65BFA
          OBJ_6D451                              * 65BFF
          DUP#2+                                 * 65C04
          OVER                                   * 65C09
          #2-                                    * 65C0E
          BINT0                                  * 65C13
          OBJ_6D136                              * 65C18
          ZEROZERO                               * 65C1D
          OBJ_6733B                              * 65C22
          DUP#2+                                 * 65C27
          OVER                                   * 65C2C
          #3-                                    * 65C31
          BINT9                                  * 65C36
          OBJ_6D136                              * 65C3B
          OBJ_6D9F9                              * 65C40
          ZEROOVER                               * 65C45
          #4-                                    * 65C4A
          BINT0                                  * 65C4F
          OBJ_6D136                              * 65C54
          OBJ_6D4CE                              * 65C59
          OBJ_67381                              * 65C5E
          #6-                                    * 65C63
          BINT0                                  * 65C68
          OBJ_6DCE7                              * 65C6D
          BINT3                                  * 65C72
          BINT0                                  * 65C77
          OBJ_6DD23                              * 65C7C
          OBJ_682D2                              * 65C81
          OBJ_6D5EB                              * 65C86
        ;                                        * 65C8B

* refs (1): 65A5B
OBJ_65C90:
        ::                                       * 65C90
          SKIP                                   * 65C95
          OBJ_65E0E                              * 65C9A
          OBJ_6FD85                              * 65C9F
          OBJ_6DFDE                              * 65CA4
          OBJ_6FDB6                              * 65CA9
          OBJ_65D0A                              * 65CAE
          OBJ_6FDC6                              * 65CB3
          OBJ_65DAA                              * 65CB8
          BINT7                                  * 65CBD
          OBJ_6E433                              * 65CC2
          OBJ_67E0C                              * 65CC7
          OBJ_679C5                              * 65CCC
          OBJ_65D14                              * 65CD1
          OBJ_6798C                              * 65CD6
          OBJ_6798C                              * 65CDB
          DUP                                    * 65CE0

d:
          $       "d"                            * 65CE5
          OBJ_6CB70                              * 65CF1
          OBJ_68245                              * 65CF6
          #1+                                    * 65CFB
          OBJ_67448                              * 65D00
        ;                                        * 65D05

* refs (1): 65CAE
OBJ_65D0A:
        ::                                       * 65D0A
          OBJ_67E0C                              * 65D0F

* refs (12): 4B8E6 65CD1 65E4F 65EAE 66200 66359 ...
OBJ_65D14:
          ::                                     * 65D14
            OBJ_679B3                            * 65D19
            OBJ_6798C                            * 65D1E
          ;                                      * 65D23
          OBJ_679AE                              * 65D28
          OBJ_6DD6E                              * 65D2D
          4PICK                                  * 65D32
          DUP#1-                                 * 65D37
          BINT5                                  * 65D3C
          OBJ_6D136                              * 65D41
          OBJ_682DE                              * 65D46
          OBJ_67381                              * 65D4B
          OVER                                   * 65D50
          OBJ_6798C                              * 65D55
          OBJ_67AD5                              * 65D5A
          OBJ_67C09                              * 65D5F
          SWAP                                   * 65D64
          OBJ_67381                              * 65D69
          OBJ_67BEF                              * 65D6E
          DUP                                    * 65D73
          OBJ_67381                              * 65D78
          OBJ_67BD5                              * 65D7D
          OBJ_6E00B                              * 65D82
          OBJ_6F42D                              * 65D87
          OBJ_6DFDE                              * 65D8C
          OBJ_44DFE                              * 65D91
          OBJ_67381                              * 65D96
          OBJ_67448                              * 65D9B
          OBJ_6E4F6                              * 65DA0
        ;                                        * 65DA5

* refs (1): 65CB8
OBJ_65DAA:
        ::                                       * 65DAA
          OBJ_6E00B                              * 65DAF
          OBJ_67E0C                              * 65DB4
          OBJ_679C5                              * 65DB9
          ZEROZERO                               * 65DBE
          3PICK                                  * 65DC3
          OBJ_679B3                              * 65DC8
          OBJ_67987                              * 65DCD
          2DUP                                   * 65DD2
          OBJ_6733B                              * 65DD7
          OBJ_67BD5                              * 65DDC
          OBJ_6733B                              * 65DE1
          OBJ_67BE2                              * 65DE6
          5ROLL                                  * 65DEB
          BINT7                                  * 65DF0
          OBJ_6D136                              * 65DF5
          OBJ_682DE                              * 65DFA
          OBJ_67381                              * 65DFF
          OBJ_67448                              * 65E04
        ;                                        * 65E09

* refs (1): 65C9A
OBJ_65E0E:
        ::                                       * 65E0E

* refs (4): 66336 6657A 6E24E 6E528
OBJ_65E13:
          ::                                     * 65E13
            7GETLAM                              * 65E18
            NOTcase                              * 65E1D
            OBJ_6F46E                            * 65E22
            RDROP                                * 65E27
            2DROP                                * 65E2C
          ;                                      * 65E31
          OBJ_67E34                              * 65E36
          BINT3                                  * 65E3B
          #=casedrop                             * 65E40
          ::                                     * 65E45
            OBJ_67E64                            * 65E4A
            OBJ_65D14                            * 65E4F
            DUP#1+                               * 65E54
            DUPUNROT                             * 65E59
            OBJ_67BEF                            * 65E5E
            BINT0                                * 65E63
            OBJ_67BD5                            * 65E68
          ;                                      * 65E6D
          #5=                                    * 65E72
          case                                   * 65E77
          ::                                     * 65E7C
            OBJ_6F36A                            * 65E81
            #1+                                  * 65E86
            DUP#1+                               * 65E8B
            2DUP                                 * 65E90
            OBJ_67BE2                            * 65E95
            SWAP                                 * 65E9A
            OBJ_67BD5                            * 65E9F
          ;                                      * 65EA4
          OBJ_6F36A                              * 65EA9
          OBJ_65D14                              * 65EAE
          OBJ_6798C                              * 65EB3
          OBJ_6798C                              * 65EB8
          DUP                                    * 65EBD
          OBJ_6E057                              * 65EC2

* refs (2): 66179 663DB
OBJ_65EC7:
          ::                                     * 65EC7
            OBJ_6E0A1                            * 65ECC
            MAKEGROB                             * 65ED1
            OBJ_44DFE                            * 65ED6
          ;                                      * 65EDB
          OBJ_6798C                              * 65EE0
          OBJ_6F42D                              * 65EE5
          OBJ_68245                              * 65EEA
        ;                                        * 65EEF

        ::                                       * 65EF4
          SKIP                                   * 65EF9
          OBJ_661A6                              * 65EFE
          OBJ_67381                              * 65F03
          #9+                                    * 65F08
          OBJ_6733B                              * 65F0D
          OBJ_6CFB5                              * 65F12
          3DROP                                  * 65F17
          BINT16                                 * 65F1C
          OBJ_6E0A1                              * 65F21
          #2*                                    * 65F26
          #+                                     * 65F2B
          BINT18                                 * 65F30
          OBJ_6E0C0                              * 65F35
          #2*                                    * 65F3A
          #+                                     * 65F3F
          BINT9                                  * 65F44
          OBJ_6E0A1                              * 65F49
          #2/                                    * 65F4E
          #+                                     * 65F53
          BINT9                                  * 65F58
          OBJ_6E0C0                              * 65F5D
          #+                                     * 65F62
          OBJ_6D909                              * 65F67
          BINT15                                 * 65F6C
          ROLL                                   * 65F71
          OBJ_68283                              * 65F76
          OBJ_67381                              * 65F7B
          #4+                                    * 65F80
          OBJ_6D9AE                              * 65F85
          BINT0                                  * 65F8A
          3PICK                                  * 65F8F
          #3+                                    * 65F94
          OBJ_67416                              * 65F99
          OBJ_6D39D                              * 65F9E
          OBJ_6E057                              * 65FA3
          BINT8                                  * 65FA8
          #=ITE                                  * 65FAD
          BINT16                                 * 65FB2
          BINT18                                 * 65FB7
          OBJ_6E0C0                              * 65FBC
          #2*                                    * 65FC1
          BINT18                                 * 65FC6
          #+                                     * 65FCB
          OBJ_6C873                              * 65FD0
          OBJ_6D990                              * 65FD5
          OBJ_6DD6E                              * 65FDA
          OBJ_67356                              * 65FDF
          OBJ_6D9AE                              * 65FE4
          BINT7                                  * 65FE9
          BINT6                                  * 65FEE
          OBJ_6DD23                              * 65FF3
          OBJ_6D9F9                              * 65FF8
          DUP#2+                                 * 65FFD
          OBJ_6DCE7                              * 66002
          BINT1                                  * 66007
          ZEROZERO                               * 6600C
          OBJ_66F11                              * 66011
          BINT16                                 * 66016
          BINT18                                 * 6601B
          OBJ_6DA4E                              * 66020
          OBJ_6D4CE                              * 66025
          OBJ_67356                              * 6602A
          DUP#1-                                 * 6602F
          OBJ_6D9AE                              * 66034
          ZEROOVER                               * 66039
          #2-                                    * 6603E
          OBJ_6D39D                              * 66043
          OBJ_6E0D2                              * 66048
          OBJ_6819D                              * 6604D
          OBJ_6E0C0                              * 66052
          OBJ_6DCA6                              * 66057
          OBJ_6DD6E                              * 6605C
          OBJ_67356                              * 66061
          OBJ_6D9AE                              * 66066
          BINT3                                  * 6606B
          OBJ_6DD19                              * 66070
          OBJ_6D9F9                              * 66075
          BINT0                                  * 6607A
          OBJ_6DCE7                              * 6607F
          BINT0                                  * 66084
          OBJ_6DD19                              * 66089
          OBJ_6D4CE                              * 6608E
          OBJ_67348                              * 66093
          DUP                                    * 66098
          OBJ_67381                              * 6609D
          #5-                                    * 660A2
          OBJ_67356                              * 660A7
          OBJ_67416                              * 660AC
          OBJ_6D39D                              * 660B1
          OBJ_6C85F                              * 660B6
          OBJ_6C873                              * 660BB
          OBJ_6D990                              * 660C0
          OBJ_682DE                              * 660C5
          OBJ_6D451                              * 660CA
          BINT0                                  * 660CF
          OBJ_6DAE9                              * 660D4
          OBJ_67364                              * 660D9
          BINT0                                  * 660DE
          OBJ_6F199                              * 660E3
          OBJ_6DAE9                              * 660E8
          OBJ_6D5EB                              * 660ED
          #4-                                    * 660F2
        ;                                        * 660F7
