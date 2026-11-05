* HP 48GX ROM revision R, #D1362-#D4805: List commands, SUB and REPL on arrays, TEACH and its example programs and plots, ATICK, and Xmodem in machine code
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: XMPutC XMGetC1 XMPutCBlink XMGetC XMSendHdr XMGetC15 XMCancel ~INTEMPOB? XMTransfer XMInterrupted RomptrOverLists RomptrArgs
* Follows on from the previous file (at #D1362 in the original ROM).
        ENDLENGTH                                * D1362

        CON(5)  DOLIB                            * D1362  library object
        LENGTH                                   * D1367  length, to #D49C7
        CON(2)  0                                * D136C  title length

* Library 0E8: List processing (SEQ, DOSUBS, DOLIST, ADD, SORT, REVLIST and commands applied over lists), SUB and REPL on arrays, TEACH with its EXAMPLES directory, ATICK, and the Xmodem transfers XSEND and XRECV.
LIB0E8:
        CON(3)  #0E8                             * D136E  library number
        REL(5)  LIB0E8.hash                      * D1371  hash table
        CON(5)  0                                * D1376  message table
        REL(5)  LIB0E8.link                      * D137B  link table
        CON(5)  0                                * D1380  config
        RPL

* ROMPTR 0E8 000
* refs (1): D136E
* SEQ: expr index start end step -> {results}. Builds the text of a FOR ... NEXT or STEP loop, in STD format with 64-bit words, and compiles and runs it. The system flags come back afterwards, even after an error.
SEQ~1:
        :: RCLSYSF DEPTH #6- 2NULLLAM{} BIND ERRSET * D1385
          :: DOSTD % 6.4E1 XEQSTWS ROT DO>STR APPEND_SPACE ROT DO>STR &$ * D13A8
            $ " FOR " &$ ROT ID>$ &$ APPEND_SPACE ROT DO>STR &$ $ " EVAL " * D13EA
            &$ SWAPDUP %1 EQUAL ITE              * D143C
            :: DROP $ " NEXT" ;                  * D1455
            :: DO>STR &$ $ " STEP" ;             * D1478
            &$ ;                                 * D14A0
          ERRTRAP                                * D14AA
          :: 2GETLAM STOSYSF ERRJMP ; 2GETLAM STOSYSF DOSTR> DEPTH 1GETLAM * D14AF
          2DUP #>ITE                             * D14E1
          :: #- {}N ; 2DROP ABND ;               * D14EB

* ROMPTR 0E8 001
* refs (1): D136E
* DOSUBS with a program: finds the number of arguments of the program and runs DoSUBS.
DOSUBS~1:
        :: XLIB ProgArgs XLIB DoSUBS ;           * D150E

* ROMPTR 0E8 002
* refs (1): D136E
* DOSUBS with an explicit number of arguments.
DOSUBS~2:
        :: SWAP COERCE DUP#0=case SETSIZEERR     * D152E
          DEPTH BINT3 #<case SETSTACKERR         * D1547
          ROT STRIPTAGS DUPTYPELIST? NOTcase SETTYPEERR * D155B
          3UNROLL                                * D1574

* ROMPTR 0E8 003
* refs (1): D136E
* {list} #n ob -> {results}: runs ob on each run of n neighbouring elements of the list. Binds NSUB and ENDSUB as the locals ntup and mtup. The results above the original depth become the new list.
DoSUBS:
          :: 3PICK LENCOMP 2DUP #>case doerr501  * D1579
            OVER #- #1+ 3UNROLL DEPTH #4- BINT1 3NULLLAM{} ' LAM 'mtup * D1597
            >HCOMP ' LAM 'ntup >TCOMP BIND >R 5GETLAM ZERO_DO ?ATTNQUIT * D15D5
            RSWAP RDUP 3GETLAM ZERO_DO RSWAP 'R RSWAP LOOP RDROP 'R DROP * D160E
            RSWAP 4GETLAM EVAL 1GETLAM #1+ 1PUTLAM LOOP RDROP DEPTH 2GETLAM * D1645
            2DUP #>ITE                           * D1677
            :: #- {}N ; 2DROP ABND ;             * D1681
        ;                                        * D16A4

* ROMPTR 0E8 004
* refs (1): D136E
* DOLIST given a name: runs the command again with the name's contents.
DOLIST~1:
        :: ' XLIB DOLIST_C1D41                   * D16A9  DOLIST

* ROMPTR 0E8 005
* refs (1): D136E
* id ob -> : recalls the name, or errors with Undefined Name, and runs ob.
RclOrErr:
          :: SWAP SAFE@ NOTcase SETNONEXTERR     * D16BE
            SWAP EVAL ;                          * D16D7
        ;                                        * D16E6

* ROMPTR 0E8 006
* refs (1): D136E
* ob -> ob #n: number of arguments of a program. It is read from the argument check at the start of a built-in, or from the locals of << -> a b ... >>.
ProgArgs:
        :: XLIB ArgDispN NOT?SEMI                * D16EB
          DROP DUP CARCOMP ' x<< EQ NOTcase ARGNUMERR * D1700
          DUPLENCOMP BINT3 #<>case XLIB LamProgArgs * D1728
          BINT2 NTHCOMPDROP DUPTYPEROMP? case XLIB RomptrArgs * D1742
          DUPTYPECOL? NOTcase ARGNUMERR          * D1761
          XLIB ArgDispN case ARGNUMERR           * D1770
        ;                                        * D1785

* ROMPTR 0E8 007
* refs (1): D136E
* romptr -> ob #n: as ProgArgs, for a ROMPTR.
RomptrArgs:
        :: DUP Lib700? case ARGNUMERR            * D178A
          ROMPTR@ NOTcase SETROMPERR             * D17A3
          DUPTYPECOL? NOTcase ARGNUMERR          * D17B2
          XLIB ArgDispN case ARGNUMERR           * D17C1
        ;                                        * D17D6

* ROMPTR 0E8 008
* refs (1): D136E
* DOLIST with a program: finds the number of arguments and runs DoDOLIST.
DOLIST~2:
        :: XLIB ProgArgs XLIB DoDOLIST ;         * D17DB

* ROMPTR 0E8 009
* refs (1): D136E
* prog -> prog #n: counts the locals of a program of the form << -> a b ... 'expr' >>. Any other program errors with Invalid User Function.
LamProgArgs:
        :: DUP DUPLENCOMP BINT3 #<case INVFUNCERR * D17FB
          >R 'R ' x<< EQ NOTcase INVFUNCERR      * D1819
          'R DUP ' xALG-> EQ NOT SWAP ' xRPN-> EQ NOT AND case INVFUNCERR * D183C
          BINT0 BEGIN RSWAP 'R RSWAP TYPELAM? WHILE * D1882
          :: #1+ ; REPEAT RDROP ;                * D18A5

* ROMPTR 0E8 00A
* refs (1): D136E
* DOLIST with a ROMPTR.
DOLIST~3:
        :: XLIB RomptrArgs XLIB DoDOLIST ;       * D18C3

* ROMPTR 0E8 00B
* refs (1): D136E
* DOLIST with an explicit number of lists.
DOLIST~4:
        :: SWAP COERCE DUP#0=case ARGNUMERR      * D18E3

* ROMPTR 0E8 00C
* refs (1): D136E
* lists... #n ob -> {results}: runs ob on each set of matching elements of n lists.
DoDOLIST:
          :: DEPTH #2- OVER #<case SETSTACKERR   * D18FC
            FALSE XLIB ListApply ;               * D191A
        ;                                        * D192F

* ROMPTR 0E8 00D
* refs (1): D136E
* Runs a library command over lists, for a list argument.
RomptrOverLists:
        ::                                       * D1934

* ROMPTR 0E8 00E
* refs (1): D136E
* ob -> ob #n flag: looks for CK1&Dispatch to CK5&Dispatch at the start of a secondary, with #n the number of arguments. flag is TRUE when there is none.
ArgDispN:
          ::                                     * D1939
            { CK1&Dispatch                       * D193E
              CK2&Dispatch                       * D1948
              CK3&Dispatch                       * D194D
              CK4&Dispatch                       * D1952
              CK5&Dispatch                       * D1957
            }                                    * D195C
            OVER CARCOMP EQUALPOSCOMP DUP#0= ;   * D1961
          case ARGNUMERR                         * D197A
          TRUE XLIB ListApply ;                  * D1984

* ROMPTR 0E8 00F
* refs (1): D136E
* lists... ob #n flag -> {results}: applies a command over lists. flag TRUE evaluates with EvalNoCK. With two arguments, a list may go with a single object, through ListApply2.
ListApply:
        :: DUP NOTcase XLIB ListApplyN           * D1999
          OVER #2= NOTcase XLIB ListApplyN       * D19B3
          XLIB ListApply2 ;                      * D19CD

* ROMPTR 0E8 010
* refs (1): D136E
* The main loop of ListApply: checks that the lists are the same length, moves them to the return stack, and runs ob on each set of elements. Polls ATTN.
ListApplyN:
        :: 4PICK STRIPTAGS DUPTYPELIST? NOTcase SETTYPEERR * D19DD
          LENCOMP DUP#0=case doerr501            * D19FB
          DEPTH #4- 4PICK #- 3NULLLAM{} 2NULLLAM{} &COMP BIND 4GETLAM #1<> * D1A0A
          IT                                     * D1A3C
          :: 4GETLAM #1+ BINT2 DO INDEX@ PICK STRIPTAGS DUPTYPELIST? NOTcase * D1A41
            SETTYPEERR                           * D1A73
            LENCOMP 2GETLAM #<>case doerr501     * D1A78
            LOOP 4GETLAM ZERO_DO STRIPTAGS 4GETLAM ROLL LOOP ; * D1A8C
          4GETLAM ZERO_DO 4GETLAM INDEX@ #- ROLL >R RSWAP LOOP 2GETLAM * D1AB4
          ZERO_DO ?ATTNQUIT 4GETLAM ZERO_DO 4GETLAM #2+ RROLL 'R RSWAP LOOP * D1AE6
          4GETLAM #1+ RROLL 5GETLAM 3GETLAM ITE EvalNoCK EVAL * D1B18
          LOOP 4GETLAM ZERO_DO RSWAP RDROP LOOP DEPTH 1GETLAM 2DUP #>ITE * D1B40
          :: #- {}N ; 2DROP ABND ;               * D1B72

* ROMPTR 0E8 011
* refs (1): D136E
* Dispatches a command of two arguments on list and list, list and object or object and list.
ListApply2:
        :: 5ROLL STRIPTAGS 5ROLL STRIPTAGS CK&DISPATCH0 * D1B95
          BINT85                                 * D1BB3  list list
          :: 5UNROLL 5UNROLL XLIB ListApplyN ;   * D1BB8
          BINT80 XLIB ListApplyL                 * D1BD7  list any
          BINT5 XLIB ListApplyR                  * D1BE7  list
        ;                                        * D1BF7

* ROMPTR 0E8 012
* refs (1): D136E
* Applies the command with its first argument a list and the second fixed.
ListApplyL:
        :: 5UNROLL 5UNROLL FALSE XLIB ListApply1 ; * D1BFC

* ROMPTR 0E8 013
* refs (1): D136E
* Applies the command with its second argument a list and the first fixed.
ListApplyR:
        :: 5UNROLL 4UNROLL TRUE XLIB ListApply1 ; * D1C20

* ROMPTR 0E8 014
* refs (1): D136E
* Main loop for a list and a fixed object: flag says on which side the object goes.
ListApply1:
        :: ROTDROP 5PICK LENCOMP DUP#0=case doerr501 * D1C44
          DEPTH #6- 3NULLLAM{} 3NULLLAM{} &COMP BIND >R 2GETLAM ZERO_DO * D1C62
          ?ATTNQUIT RSWAP 'R RSWAP 6GETLAM 3GETLAM IT SWAP * D1C8F
          5GETLAM 4GETLAM ITE EvalNoCK EVAL      * D1CB7
          LOOP RDROP DEPTH 1GETLAM 2DUP #>ITE    * D1CD0
          :: #- {}N ; 2DROP ABND ;               * D1CEE

* ROMPTR 0E8 015
* refs (1): D136E
* ADD: {} {} -> {}: adds lists element by element with +, or a list and an object.
ADD~1:
        :: ' x+ BINT2 TRUE XLIB ListApply ;      * D1D11

* ROMPTR 0E8 016
* refs (1): D136E
* SORT: {} -> {}': binary insertion sort of the elements, using ListOp. Reals, strings, binary integers, units, names, locals and lists sort. A list compares by its first element. Names compare as their text.
SORT~1:
        ::                                       * D1D3A
          :: XLIB ListOp                         * D1D3F
            :: SWAP dup;#nm? ITE FalseFalse TrueTrue * D1D4F
              4ROLL 3NULLLAM{} BIND 2GETLAM IT XLIB SORT~2 * D1D6D
              1GETLAM #1+_ONE_DO 1GETLAM ROLL BINT0 INDEX@ BEGIN ?ATTNQUIT * D1D91
              2DUP SWAP#- #2/ DUP#0<> WHILE      * D1DB9
              :: OVERSWAP #-DUP #4+PICK 5PICK    * D1DD2
                CODE                             * D1DEB  20 nibbles
                  C=PC                           * D1DF5
                  LA(5)   #0006B                 * D1DF9
                  A=A+C   A                      * D1E03
                  PC=(A)                         * D1E05
                ENDCODE                          * D1E09
                %1 %= ITE ROTDROPSWAP SWAPDROP   * D1E09
              ;                                  * D1E22
              REPEAT DROPSWAPDROP UNROLL LOOP 2GETLAM IT XLIB SORT~4 * D1E27
              1GETABND ;                         * D1E50
            COLA ;                               * D1E5A

* ob1 ob2 -> %: is ob1 greater than ob2? Dispatches on the types. Objects of different types are Bad Argument Type.
SortCompare:
          :: CK&DISPATCH1                        * D1E64
            BINT17                               * D1E6E  real real
            CODE                                 * D1E73  20 nibbles
              D0=D0+  5                          * D1E7D
              D0=D0+  5                          * D1E80
              LA(5)   %>                         * D1E83
              PC=(A)                             * D1E8D
            ENDCODE                              * D1E91
            BINT51                               * D1E91
            $>$? # BB                            * D1E96
            HXS>HXS # EE                         * D1EA5
            UM>? # E1                            * D1EB4
            UM>? # 1E                            * D1EC3
            UM>? # 66                            * D1ED2
            :: ID>$ SWAP ID>$ SWAP $>$? ;        * D1EE1
            # 77                                 * D1F04  local local
            :: ID>$ SWAP ID>$ SWAP $>$? ;        * D1F0E
            BINT85                               * D1F31  list list
            :: DUPLENCOMP #0=case SETSIZEERR     * D1F36
              CARCOMP SWAP DUPLENCOMP #0=case SETSIZEERR * D1F4A
              CARCOMP SWAP COLA                  * D1F63
              CODE                               * D1F72  20 nibbles
                C=PC                             * D1F7C
                LA(5)   #FFEE4                   * D1F80
                A=A+C   A                        * D1F8A
                PC=(A)                           * D1F8C
              ENDCODE                            * D1F90
            ;                                    * D1F90
          ;                                      * D1F95
        ;                                        * D1F9A

* ROMPTR 0E8 017
* refs (1): D136E
* Before sorting a list of names or locals, turns them into strings, so they compare as text.
SORT~2:
        :: DUPTYPELAM? case XLIB SORT~3          * D1F9F
          1GETLAM ZERO_DO DUPTYPEIDNT? NOTcase SETTYPEERR * D1FB9
          ID>$ 1GETLAM ROLL LOOP ;               * D1FD2

* ROMPTR 0E8 018
* refs (1): D136E
* As the step before, for a list of locals: each element must be one.
SORT~3:
        :: FALSE 3PUTLAM 1GETLAM ZERO_DO DUPTYPELAM? NOTcase SETTYPEERR * D1FEB
          LAM>ID ID>$ 1GETLAM ROLL LOOP ;        * D2013

* ROMPTR 0E8 019
* refs (1): D136E
* After sorting names, turns the strings back into names.
SORT~4:
        :: 3GETLAM NOTcase XLIB SORT~5           * D2031
          1GETLAM ZERO_DO $>ID 1GETLAM ROLL LOOP ; * D204B

* ROMPTR 0E8 01A
* refs (1): D136E
* After sorting locals, turns the strings back into locals.
SORT~5:
        :: 1GETLAM ZERO_DO $>ID ID>LAM 1GETLAM ROLL LOOP ; * D206E

* ROMPTR 0E8 01B
* refs (1): D136E
* Evaluates the next object in the stream with numeric mode (flag -3) set, then puts flag -3 back as it was, also after an error.
EvalNumMode:
        :: 'R NOTNUM? SETNUM ERRSET ITE          * D209B
          :: EVAL ERRTRAP cf(-3);error CLRNUM ;  * D20B9
          :: EVAL ERRTRAP sf(-3);error SETNUM ;  * D20D7
        ;                                        * D20F5

* ROMPTR 0E8 01C
* refs (1): D136E
* {} ob -> {}': runs ob on the elements of a list exploded on the stack and collects the result. A list in temporary memory is first kept safe, in the hidden variable '{}, against memory moving; it is purged, even after an error.
ListOp:
        :: XLIB ~INTEMPOB? NOTcase XLIB ~INNERCOMP;'REVAL;{}N * D20FA
          ID '{} StoHiddenVar ' ID '{} RclHiddenVar DROP ERRSET * D211A
          :: INNERCOMP RSWAP 'R RSWAP EVAL ; ERRTRAP * D214D
          :: ' ID '{} PuHiddenVar ERRJMP ; ' ID '{} PuHiddenVar {}N ; * D2175

* ROMPTR 0E8 01D
* refs (1): D136E
* ListOp for a list outside temporary memory.
~INNERCOMP;'REVAL;{}N:
        :: INNERCOMP 'REVAL {}N ;                * D21BC

* ROMPTR 0E8 01E
* refs (1): D136E
~INTEMPOB?:
        CODE                                     * D21D5  62 nibbles
          A=DAT1  A                              * D21DF
          CD0EX                                  * D21E2
          RSTK=C                                 * D21E5
          D0=(5)  #806E9                         * D21E7
          C=DAT0  A                              * D21EE
          ?C>A    A                              * D21F1
          GOYES   ~INTEMPOB?.L1                  * D21F4
          D0=(5)  #806EE                         * D21F6
          C=DAT0  A                              * D21FD
          ?C>A    A                              * D2200
          GOYES   ~INTEMPOB?.L2                  * D2203
~INTEMPOB?.L1:
          C=RSTK                                 * D2205
          D0=C                                   * D2207
          GOVLNG  PushFLoop                      * D220A
~INTEMPOB?.L2:
          C=RSTK                                 * D2211
          D0=C                                   * D2213
          GOVLNG  PushTLoop                      * D2216
        ENDCODE                                  * D221D

* ROMPTR 0E8 01F
* refs (1): D136E
* SUB for arrays, grobs and PICT: dispatches on the type of the arguments.
xSUB~1:
        :: CK&DISPATCH1                          * D221D
          # 455 XLIB xSUB~4                      * D2227  array list list
          # 411 XLIB xSUB~5                      * D223C  array real real
          # 415 XLIB xSUB~3                      * D2251  array real list
          # 451 XLIB xSUB~2                      * D2266  array list real
          # 855 sub(PICT,2c)                     * D227B  program list list
          # 822 sub(PICT,2c)                     * D228A  program complex complex
          TAGGEDANY                              * D2299  tagged any
          :: STRIPTAGSl2 STRIPTAGS 'EvalNoCK:_sup xSUB ; * D229E
          BINT13                                 * D22BC  tagged
          :: STRIPTAGS 'EvalNoCK:_sup xSUB ;     * D22C1
        ;                                        * D22DA

* ROMPTR 0E8 020
* refs (1): D136E
* REPL for arrays, grobs and PICT.
xREPL~1:
        :: CK&DISPATCH1                          * D22DF
          # 454 XLIB xREPL~3                     * D22E9  array list array
          # 414 XLIB xREPL~2                     * D22FE  array real array
          # 85C repl(PICT,c,go)                  * D2313  program list grob
          # 82C repl(PICT,c,go)                  * D2322  program complex grob
          TAGGEDANY                              * D2331  tagged any
          :: STRIPTAGSl2 STRIPTAGS 'EvalNoCK:_sup xREPL ; * D2336
          BINT13                                 * D2354  tagged
          :: STRIPTAGS 'EvalNoCK:_sup xREPL ;    * D2359
        ;                                        * D2372

* ROMPTR 0E8 021
* refs (1): D136E
* REPL: [] %k [] -> []: position as an element number.
xREPL~2:
        :: 3UNROLL COERCE OVER XLIB Ar#>RowCol XLIB ArRepl ; * D2377

* ROMPTR 0E8 022
* refs (1): D136E
* REPL: [] {row col} [] -> [].
xREPL~3:
        :: ROT {}>%sBIND 4GETLAM 3GETLAM 1GETABND INNERCOMP BINT2 #<>case * D23A6
          SETSIZEERR                             * D23D3
          COERCE2 XLIB ArRepl ;                  * D23D8

* ROMPTR 0E8 023
* refs (1): D136E
* [] #row #col [] -> []: stores one array in another at the position. Both must be real or both complex, and the block must fit. Works out the strides and calls ArMoveBlock.
ArRepl:
        :: 2DUP #* #0=case SETSIZEERR            * D23ED
          ROT TOTEMPOB 3UNROLL 3PICK XLIB ArShape 8PICK XLIB ArShape ROT * D2406
          7PICK XOR case SETTYPEERR              * D243A
          BINT9 PICK 3PICK #+ #1- 6PICK #>case SETSIZEERR * D244E
          8PICK OVER #+ #1- 5PICK #>case SETSIZEERR * D2476
          4NULLLAM{} 3NULLLAM{} 2NULLLAM{} &COMP &COMP BIND 2GETLAM 3GETLAM * D2499
          ITE BINT30 BINT25                      * D24C1
          9GETLAM #1- 4GETLAM #* 8GETLAM #1- #+ 6GETLAM #* 7GETLAM ITE * D24D0
          BINT30 BINT25                          * D2507
          #+ 4GETLAM 1GETLAM #- 6GETLAM #* 1GETLAM 6GETLAM #* BINT0 ABND * D2511
          XLIB ArMoveBlock ;                     * D2548

* ROMPTR 0E8 024
* refs (1): D136E
* SUB: [] {pos} %k.
xSUB~2:
        :: SWAP                                  * D2558

* ROMPTR 0E8 025
* refs (1): D136E
* SUB: [] %k {pos}.
xSUB~3:
          :: 3UNROLL {}>%sBIND 4GETLAM 3GETLAM 1GETABND INNERCOMP BINT2 * D2562
            #<>case SETSIZEERR                   * D258A
            COERCE2 ROT COERCE 4PICK XLIB Ar#>RowCol XLIB ArSub ; * D2594
        ;                                        * D25C3

* ROMPTR 0E8 026
* refs (1): D136E
* SUB: [] {row col} {row col}.
xSUB~4:
        :: ROT {}>%sBIND 4GETLAM 3GETLAM 1GETABND {}>%sBIND 4GETLAM 3GETLAM * D25C8
          1GETABND INNERCOMP BINT2 #<>case SETSIZEERR * D25F5
          COERCE2 ROT INNERCOMP BINT2 #<>case SETSIZEERR * D260E
          COERCE2 XLIB ArSub ;                   * D262C

* ROMPTR 0E8 027
* refs (1): D136E
* [] #r1 #c1 #r2 #c2 -> []': copies the block between two corners to a new array, swapping corners given out of order. A zero index or a block outside the array is Bad Argument Value.
ArSub:
        :: ROT 2DUP #> IT SWAP                   * D2641
          OVER #0=case SETSIZEERR                * D265F
          2SWAP 2DUP #> IT SWAP                  * D266E
          OVER #0=case SETSIZEERR                * D2687
          5PICK XLIB ArShape 4NULLLAM{} BIND 2GETLAM OVER #<case SETSIZEERR * D2696
          1GETLAM 4PICK #<case SETSIZEERR        * D26C4
          OVER #- #1+ 2SWAP OVER #- #1+ 4GETLAM ITE * D26D8
          :: 3PICKOVER BINT2 ; DUPONE            * D2705
          {}N 6PICK TYPERARRY? ITE %0_2A2B4 C%0  * D271E
          MAKEARRY 5UNROLL 4ROLL #1- 1GETLAM #* ROT #+ #1- 3GETLAM #* * D273C
          4GETLAM ITE BINT30 BINT25              * D2773
          DUP ROT#+ SWAP 1GETLAM 3GETLAM #* BINT0 5ROLL 3GETLAM #* ROT OVER * D2787
          #- ABND XLIB ArMoveBlock ;             * D27C3

* ROMPTR 0E8 028
* refs (1): D136E
* SUB: [] %k1 %k2: positions as element numbers.
xSUB~5:
        :: COERCE2 3PICK XLIB Ar#>RowCol ROT 4PICK XLIB Ar#>RowCol * D27DD
          XLIB ArSub ;                           * D280C

* ROMPTR 0E8 029
* refs (1): D136E
* ob1 ob2 #n ... -> : copies a block of n rows, from one array body to another: the four numbers on top give each array's first offset and stride. Replaces the arguments with the destination.
ArMoveBlock:
        CODE                                     * D281C  168 nibbles
          GOSBVL  POP2#                          * D2826
          R4=A.F  A                              * D282D
          R3=C.F  A                              * D2833
          GOSBVL  POP2#                          * D2839
          R2=A.F  A                              * D2840
          R1=C.F  A                              * D2846
          GOSBVL  SAVPTR                         * D284C
          GOSBVL  POP2#                          * D2853
          B=A     A                              * D285A
          B=B-1   A                              * D285C
          D1=D1+  5                              * D285E
          A=DAT1  A                              * D2861
          A=A+C   A                              * D2864
          D0=A                                   * D2866
          D1=D1-  5                              * D2869
          A=DAT1  A                              * D286C
          C=R2.F  A                              * D286F
          A=A+C   A                              * D2875
          D1=A                                   * D2877
ArMoveBlock.loop1:
          C=R4.F  A                              * D287A
          GOSBVL  MOVEDOWN                       * D2880
          B=B-1   A                              * D2887
          GOC     ArMoveBlock.L2                 * D2889
          C=R3.F  A                              * D288C
          AD0EX                                  * D2892
          A=A+C   A                              * D2895
          D0=A                                   * D2897
          C=R1.F  A                              * D289A
          AD1EX                                  * D28A0
          A=A+C   A                              * D28A3
          D1=A                                   * D28A5
          GONC    ArMoveBlock.loop1              * D28A8
ArMoveBlock.L2:
          GOSBVL  GETPTR                         * D28AB
          D1=D1+  10                             * D28B2
          C=DAT1  A                              * D28B5
          D1=D1+  5                              * D28B8
          DAT1=C  A                              * D28BB
          D=D+1   A                              * D28BE
          D=D+1   A                              * D28C0
          D=D+1   A                              * D28C2
          A=DAT0  A                              * D28C4
          D0=D0+  5                              * D28C7
          PC=(A)                                 * D28CA
        ENDCODE                                  * D28CE

* ROMPTR 0E8 02A
* refs (1): D136E
* [] -> [] #elementsize #rows #cols flag: size of an element in nibbles, 16 or 32, the array's dimensions, a vector counted as one row, and TRUE for a matrix.
ArShape:
        :: DUP TYPERARRY? ITE BINT16 BINT32      * D28CE
          SWAP MDIMS DUP ITE ROT BINT1           * D28EC
          3UNROLL 4UNROLL ;                      * D290A

* ROMPTR 0E8 02B
* refs (1): D136E
* #k [] -> #row #col: turns an element number into a row and a column.
Ar#>RowCol:
        :: MDIMS NOTcasedrop ONESWAP             * D2919
          SWAPDROP DUPUNROT #/ OVER#0= case SWAPDROPSWAP * D292D
          #1+ ROTDROPSWAP ;                      * D294B

* ROMPTR 0E8 02C
* refs (1): D136E
* CLTEACH: goes HOME and purges the EXAMPLES directory, if there is one.
DoCLTEACH:
        :: HOMEDIR ' ID EXAMPLES DUP SAFE@ NOTcaseDROP TYPERRP? * D295A
          case XEQPGDIR                          * D2994
          PURGE ;                                * D299E

* ROMPTR 0E8 02D
* refs (1): D136E
* TEACH: replaces EXAMPLES with the demonstration directory. It holds PLOTS, PRGS, EQNS and the programs in the words below.
TEACH~1:
        :: XLIB DoCLTEACH ' ID EXAMPLES DUP CREATEDIR EVAL ' * D29A8
          :: x<< xHOME x' ID EXAMPLES xENDTIC xPGDIR x>> ; ' ID PURGEX * D29E8
          XEQSTOID ' XLIB EX%TILE ?ROMPTR@ ' ID %TILE XEQSTOID ' ID EQNS DUP * D2A3F
          CREATEDIR EVAL $ "6\0Dx\0C-9)+4\0D6+x-x\0C)+2\0Dx\0C+5*x+6)" * D2A8D
          XLIB ELParse ' ID RATFUNC XEQSTOID $ "4*\05X)" XLIB ELParse ' * D2ADB
          ID FOUR XEQSTOID $ "3*\05X)" XLIB ELParse ' ID THREE XEQSTOID * D2B29
          $ "2*\05X)" XLIB ELParse ' ID TWO XEQSTOID $ "\05X)" XLIB ELParse * D2B77
          ' ID ONE XEQSTOID UPDIR ' ID PLOTS DUP CREATEDIR EVAL ' * D2BC8
          XLIB EXXSIN ?ROMPTR@ ' ID XSIN ' XLIB EXELLIP ?ROMPTR@ ' ID ELLIP * D2C0E
          ' XLIB EXLISSA ?ROMPTR@ ' ID LISSA ' XLIB EXROSE ?ROMPTR@ ' * D2C5D
          ID ROSE ' XLIB EXPTRN ?ROMPTR@ ' ID PTRN ' XLIB EXDEQ ?ROMPTR@ ' * D2CA2
          ID DEQ ' XLIB EXSPFLD ?ROMPTR@ ' ID SPFLD ' XLIB EXPSCN ?ROMPTR@ ' * D2CF4
          ID PSCN ' XLIB EXGRID ?ROMPTR@ ' ID GRID ' XLIB EXPSUR ?ROMPTR@ ' * D2D46
          ID PSUR ' XLIB EXWIRE ?ROMPTR@ ' ID WIRE ' XLIB EXSLICE ?ROMPTR@ ' * D2D98
          ID SLICE BINT12 ZERO_DO XEQSTOID LOOP UPDIR ' ID PRGS DUP * D2DEA
          CREATEDIR EVAL ' XLIB EX>RPN ?ROMPTR@ ' ID →RPN XEQSTOID ' * D2E2D
          XLIB EXAPLY ?ROMPTR@ ' ID APLY XEQSTOID ' XLIB EXFIBON ?ROMPTR@ ' * D2E6A
          ID FIBON XEQSTOID ' XLIB EXMEDIAN ?ROMPTR@ ' ID MEDIAN XEQSTOID * D2EAD
          HOMEDIR ClrDAsOK ;                     * D2EF5

* ROMPTR 0E8 02E
* refs (1): D136E
* The %TILE program of EXAMPLES: percentile of a list.
EX%TILE:
        :: x<< xSWAP XLIB SORT xDUP xSIZE %1 x+ xROT % 1E2 x/ x* xRPN-> * D2F04
          LAM p x<< xDUP LAM p xFLOOR xGET xSWAP LAM p xCEIL xGET x+ %2 x/ * D2F5B
          x>>ABND x>> ;                          * D2FA8

* ROMPTR 0E8 02F
* refs (1): D136E
* The SLICE example: a Y-slice plot of X^3*Y-X*Y^3.
EXSLICE:
        :: x<< xRAD                              * D2FB7
          { xPICT ID PPAR ID VPAR } xPURGE XLIB YSLICE * D2FC6
          SYMBOL ID X %3 x^ ID Y x* ID X ID Y %3 x^ x* x- ; xSTEQ % -5E-1 * D3003
          % 5E-1 XLIB ZVOL xDRAW x>> ;           * D306E

* ROMPTR 0E8 030
* refs (1): D136E
* The WIRE example: a wireframe plot of X^3*Y-X*Y^3.
EXWIRE:
        :: x<<                                   * D309D
          { xPICT ID PPAR ID VPAR } xPURGE XLIB WIREFRAME * D30A7
          SYMBOL ID X %3 x^ ID Y x* ID X ID Y %3 x^ x* x- ; xSTEQ % 1.2E1 * D30E4
          XLIB NUMX % 1.2E1 XLIB NUMY % -4E-1 % 4E-1 XLIB ZVOL %0_2A2B4 %-2 * D314F
          %1 XLIB EYEPT xDRAW xGRAPH x>> ;       * D31B9

* ROMPTR 0E8 031
* refs (1): D136E
* The PSUR example: a parametric surface plot.
EXPSUR:
        :: x<< xRAD                              * D31DD
          { xPICT ID PPAR ID VPAR } xPURGE XLIB PARSURFACE * D31EC
          {                                      * D3229
            SYMBOL ID X ID Y xCOS x* ;           * D322E
            SYMBOL ID X ID Y xSIN x* ; ID X }    * D3254
          xSTEQ % 1.6E1 XLIB NUMX % 1.6E1 XLIB NUMY % -3.14159E0 % 3.14159E0 * D3288
          xDUP2 xDUP2 %4 xDUPN XLIB XVOL XLIB YVOL XLIB ZVOL XLIB XXRNG * D32F7
          XLIB YYRNG %0_2A2B4 % -4.2E0 %0_2A2B4 XLIB EYEPT xDRAW xGRAPH x>> ; * D3337

* ROMPTR 0E8 032
* refs (1): D136E
* The GRID example: a gridmap plot of SIN(X+i*Y).
EXGRID:
        :: x<< xRAD                              * D3380
          { xPICT ID PPAR ID VPAR } xPURGE XLIB GRIDMAP * D338F
          SYMBOL ID X ID Y xi x* x+ xSIN ; xSTEQ xDRAW xGRAPH x>> ; * D33CC

* ROMPTR 0E8 033
* refs (1): D136E
* The PSCN example: a Pr-Surface contour plot of (X^2-1)/(Y^2-1).
EXPSCN:
        :: x<< xRAD                              * D3415
          { xPICT ID PPAR ID VPAR } xPURGE XLIB PCONTOUR * D3424
          SYMBOL ID X %2 x^ %1 x- ID Y %2 x^ %1 x- x/ ; xSTEQ % 1.6E1 * D3461
          XLIB NUMX %16 XLIB NUMY %-2 %2 XLIB XVOL %-2 %2 XLIB YVOL xDRAW * D34C4
          xGRAPH x>> ;                           * D350E

* ROMPTR 0E8 034
* refs (1): D136E
* The SPFLD example: a slopefield plot of (X^2-1)/(Y^2-1).
EXSPFLD:
        :: x<< xRAD                              * D351D
          { xPICT ID PPAR ID VPAR } xPURGE XLIB SLOPEFIELD * D352C
          SYMBOL ID X %2 x^ %1 x- ID Y %2 x^ %1 x- x/ ; xSTEQ % 1.6E1 * D3569
          XLIB NUMX %16 XLIB NUMY %-2 %2 XLIB XVOL %-2 %2 XLIB YVOL xDRAW * D35CC
          xGRAPH x>> ;                           * D3616

* ROMPTR 0E8 035
* refs (1): D136E
* The DEQ example: a Diff Eq plot of a forced oscillator.
EXDEQ:
        :: x<< xSILENT'                          * D3625
          :: x<< ID Y xOBJ> xDROP ID T %5 x* xCOS % 1.2E1 x* xROT % 4.9E1 x* * D3634
            x- %2 x>ARRY x>> ;                   * D36A2
          xSTEQ xRAD                             * D36BB
          { xPICT ID PPAR } xPURGE XLIB DIFFEQ %-2 %2 xXRNG %-8 %8 xYRNG * D36C5
          { ID T %0_2A2B4 %PI } xINDEP           * D3711
          { ID Y                                 * D3733
            CON(5)  DOARRY                       * D3741  array 2
            LENGTH                               * D3746  length, to #D377A
            CON(5)  DOREAL                       * D374B  element type
            CON(5)  1                            * D3750  dimensions
            CON(5)  2                            * D3755
            %BODY   0E0                          * D375A
            %BODY   0E0                          * D376A
        ENDLENGTH                                * D377A
            % 1E-3 }                             * D377A
          xDEPND                                 * D3794
          { C% 0E0 0E0 $ "1" $ "2" } xAXES % 5E-2 xRES xDRAX xDRAW xGRAPH * D3799
          x>> ;                                  * D380E

* ROMPTR 0E8 036
* refs (1): D136E
* The PTRN example: a truth plot of (X^2+Y^3) MOD 4 < 2.
EXPTRN:
        :: x<< xRAD                              * D3818
          { xPICT ID PPAR } xPURGE XLIB TRUTH    * D3827
          SYMBOL ID X %2 x^ ID Y %3 x^ x+ %4 xMOD %2 x< ; xSTEQ xDRAX xDRAW * D3855
          xGRAPH x>> ;                           * D38AD

* ROMPTR 0E8 037
* refs (1): D136E
* The ROSE example: a polar plot of 2*COS(4*θ).
EXROSE:
        :: x<< xRAD                              * D38BC
          { xPICT ID PPAR } xPURGE XLIB POLAR_8C9FD ID θ xINDEP * D38CB  POLAR
          SYMBOL %2 %4 ID θ x* xCOS x* ; xSTEQ xDRAX xDRAW xGRAPH x>> ; * D3907

* ROMPTR 0E8 038
* refs (1): D136E
* The LISSA example: a parametric Lissajous figure.
EXLISSA:
        :: x<<                                   * D3951
          { xPICT ID PPAR } xPURGE xRAD XLIB PARAMETRIC * D395B
          { ID T %0_2A2B4 % 6.5E0 } xINDEP       * D398E
          SYMBOL %3 %3 ID T x* xSIN x* xi %2 x* %4 ID T x* xSIN x* x+ ; * D39C0
          xSTEQ xDRAX xDRAW xGRAPH x>> ;         * D3A1D

* ROMPTR 0E8 039
* refs (1): D136E
* The ELLIP example: a conic plot of 5*X^2+3*Y^2-18.
EXELLIP:
        :: x<<                                   * D3A3B
          { xPICT ID PPAR } xPURGE XLIB CONIC % 1E-2 xRES * D3A45
          { ID X %-2 %2 } xINDEP                 * D3A8D
          SYMBOL %5 ID X %2 x^ x* %3 ID Y %2 x^ x* x+ % 1.8E1 x- ; xSTEQ * D3AAF
          xDRAX xDRAW xGRAPH x>> ;               * D3B17

* ROMPTR 0E8 03A
* refs (1): D136E
* The XSIN example: a function plot of X+SIN(2*X).
EXXSIN:
        :: x<< xRAD                              * D3B30
          { xPICT ID PPAR } xPURGE               * D3B3F
          SYMBOL ID X %2 ID X x* xSIN x+ ; xSTEQ xDRAX xDRAW xGRAPH x>> ; * D3B62

* ROMPTR 0E8 03B
* refs (1): D136E
* The ->RPN program of EXAMPLES: turns an algebraic into a list in RPN order.
EX>RPN:
        :: x<< xOBJ> xIF xOVER xTHEN             * D3BB0
          :: xRPN-> LAM n LAM f x<< %1 LAM n xSTARTVAR LAM i xIF xDUP xTYPE * D3BCE
            %9 xSAME xTHEN ID →RPN xIFEND LAM n xROLLD xNEXT xIF xDUP xTYPE * D3C1A
            %5 x#? xTHEN                         * D3C5F
            :: %1 x>LIST ; xIFEND xIF LAM n %1 x> xTHEN * D3C6E
            :: %2 LAM n xSTART x+ xNEXT ; xIFEND LAM f x+ x>>ABND ; * D3CA4
          xELSE                                  * D3CE8
          :: %1 x>LIST xSWAP xDROP ; xIFEND x>> ; * D3CED

* ROMPTR 0E8 03C
* refs (1): D136E
* The APLY program of EXAMPLES: applies a program to each element of an array.
EXAPLY:
        :: x<< xRPN-> LAM a LAM p x<< %1 xCF LAM a xDUP xSIZE xDUP xSIZE xIF * D3D1A
          %1 x== xTHEN                           * D3D6C
          :: %1 xSF %1 x+ xSWAP xOBJ> xOBJ> xDROP %1 x+ xROLL ; xELSE * D3D7B
          :: xDROP2 LAM a xOBJ> ; xIFEND xDUP xOBJ> xDROP x* xSWAP xOVER %2 * D3DC1
          x+ xROLLD x>LIST %1 LAM p XLIB DOSUBS xOBJ> %1 x+ xROLL xIFERR * D3E06
          :: xIF %1 xFS? xTHEN                   * D3E47
            :: xOBJ> xDROP x>LIST ; xIFEND x>ARRY ; * D3E60
          xERRTHEN                               * D3E88
          :: xOBJ> xIF %1 xFC?C xTHEN xDROP xIFEND xRPN-> LAM n LAM m x<< %1 * D3E8D
            LAM n xSTARTVAR LAM i LAM m x>LIST   * D3ED6
            SYMBOL LAM m LAM n LAM i x- x* LAM i x+ ; xEVAL xROLLD xNEXT * D3EFB
            LAM n x>LIST x>>ABND ;               * D3F47
          xIFEND %1 xCF x>>ABND x>> ;            * D3F5F

* ROMPTR 0E8 03D
* refs (1): D136E
* The FIBON program of EXAMPLES: Fibonacci number n.
EXFIBON:
        :: x<< xIF ID n %1 x<=? xTHEN ID n xELSE * D3F7D
          :: %0_2A2B4 %1 %2 ID n xSTART xDUP xROT x+ xNEXT xDROP ; xIFEND * D3FB2
          x>> ;                                  * D3FF7

* ROMPTR 0E8 03E
* refs (1): D136E
* The MEDIAN program of EXAMPLES: medians of the columns of ΣDAT.
EXMEDIAN:
        :: x<< xRCLSIGMA xDUP xSIZE xOBJ> xDROP xRPN-> LAM s LAM n LAM m x<< * D4001
          x' ID ΣDAT xENDTIC xTRN %1 LAM m xSTARTVAR LAM j xSIGMA- xOBJ> * D4049
          xDROP LAM n x>LIST % 5E1 ID %TILE LAM j xROLLD xNEXT LAM m x>ARRY * D408D
          LAM s xSTOSIGMA x>>ABND x>> ;          * D40E7

* ROMPTR 0E8 03F
* refs (1): D136E
* ATICK: % | # | {} -> : stores the tick spacing in the axes entry of PPAR.
ATICK~1:
        :: DUP AxTick? NcaseTYPEERR RclAx*s      * D4104
          :: DUPTYPECMP? case                    * D411D
            :: SWAP TWO{}N ;                     * D412C
            INNERCOMP DUP#1= casedrop            * D4140
            :: SWAP TWO{}N ;                     * D414F
            DUP #2= casedrop                     * D4163
            :: DUPTYPECSTR? case                 * D4172
              :: C%0 4UNROLL BINT4 {}N ;         * D4181
              DROP SWAP TWO{}N ;                 * D419F
            BINT4 #= IT ROTDROP                  * D41B3
            4ROLL 3UNROLL BINT4 {}N ;            * D41C7
          ax*s(c) ;                              * D41E0

* ROMPTR 0E8 040
* refs (1): D136E
* XSEND: name -> : sends a variable by Xmodem.
XSEND~1:
        :: FALSE XLIB XMTransfer ;               * D41EA

* ROMPTR 0E8 041
* refs (1): D136E
* XRECV: name -> : receives a variable by Xmodem.
XRECV~1:
        :: TRUE XLIB XMTransfer ;                * D4204

* ROMPTR 0E8 042
* refs (1): D136E
* name flag -> : opens the serial port and sends, or with flag TRUE receives. Receiving to a name in use, with flag -36 clear, is Name Conflict.
XMTransfer:
        :: DOOPENIO ITE                          * D421E
          :: dup;RclInVars(gn)? IT               * D422D
            :: DROP BINT36 TestSysFlag NOTcase   * D423C  flag -36: RECV renames / RECV overwrites
              :: # 13C ERROROUT ;                * D4255  "Name Conflict"
            ;                                    * D426E
            GARBAGE MEM                          * D4273
* Receive: takes all free memory but 2000 nibbles for a string to hold the data, with interrupts off. R2 holds the block number in its low byte and the retries left in nibble 2. It sends NAK until a block starts, up to 10 times. SOH begins a block, EOT ends the transfer with ACK, and CAN stops it with Transfer Failed.
            CODE                                 * D427D  794 nibbles
              GOSBVL  SAVPTR                     * D4287
              GOSBVL  POP#                       * D428E
              ASRB.F  A                          * D4295
              LC(5)   #007D0                     * D429A
              C=A-C   A                          * D42A1
              GONC    XMTransfer.L1              * D42A3
              GOVLNG  GPMEMERR                   * D42A6
XMTransfer.L1:
              R1=C                               * D42AD
              GOSBVL  MAKE$                      * D42B0
              GOSBVL  DisableIntr                * D42B7
              LC(3)   #A01                       * D42BE
              R2=C                               * D42C3
              ST=0    8                          * D42C6
              ST=1    3                          * D42C9
              ST=1    6                          * D42CC
XMTransfer.loop2:
              A=R2                               * D42CF
              A=A-1   XS                         * D42D2
              GOC     XMTransfer.L5              * D42D5
              R2=A                               * D42D8
              ?ST=1   8                          * D42DB
              GOYES   XMTransfer.L8              * D42DE
              LC(2)   #15                        * D42E0
XMTransfer.loop3:
              GOSUB   XMPutCBlink                * D42E4
              CD0EX                              * D42E8
              D0=C                               * D42EB
              R3=C                               * D42EE
              ST=0    2                          * D42F1
XMTransfer.loop4:
              ST=0    1                          * D42F4
              LC(5)   #14000                     * D42F7
              GOSUB   XMGetC                     * D42FE
              GOC     XMTransfer.loop2           * D4302
              C=0     A                          * D4305
              LC(2)   #7F                        * D4307
              D=C     A                          * D430B
              LC(2)   #01                        * D430D
              ?C=A    B                          * D4311
              GOYES   XMTransfer.L12             * D4314
              LC(2)   #04                        * D4316
              ?C=A    B                          * D431A
              GOYES   XMTransfer.L7              * D431D
              LC(2)   #18                        * D431F
              ?C#A    B                          * D4323
              GOYES   XMTransfer.loop4           * D4326
XMTransfer.L5:
              LC(5)   xferfailerr                * D4328  "Transfer Failed"
XMTransfer.loop6:
              GOTO    XMTransfer.L21             * D432F
XMTransfer.L7:
              LC(2)   #06                        * D4333
              GOSUB   XMPutCBlink                * D4337
              ST=0    3                          * D433B
              GOTO    XMTransfer.L23             * D433E
XMTransfer.L8:
              GOTO    XMTransfer.L20             * D4342
XMTransfer.loop9:
              C=RSTK                             * D4346
XMTransfer.loop10:
              GOSUB   XMGetC1                    * D4348
              GONC    XMTransfer.loop10          * D434C
XMTransfer.loop11:
              GOTO    XMTransfer.loop2           * D434F
XMTransfer.L12:
              GOSUB   XMGetC1                    * D4353
              GOC     XMTransfer.loop10          * D4357
              C=A     A                          * D435A
              A=R2                               * D435C
              ?C=A    B                          * D435F
              GOYES   XMTransfer.L13             * D4362
              A=A-1   A                          * D4364
              ?C#A    B                          * D4366
              GOYES   XMTransfer.loop10          * D4369
              ST=1    2                          * D436B
XMTransfer.L13:
              RSTK=C                             * D436E
              GOSUB   XMGetC1                    * D4370
              GOC     XMTransfer.loop9           * D4374
              A=-A-1  B                          * D4377
              C=RSTK                             * D437A
              ?C#A    B                          * D437C
              GOYES   XMTransfer.loop10          * D437F
              B=0     A                          * D4381
XMTransfer.loop14:
              C=R1                               * D4383
              C=C-1   A                          * D4386
              R1=C                               * D4388
              C=0     A                          * D438B
              LC(1)   #1                         * D438D
              GOC     XMTransfer.loop6           * D4390
              GOSUB   XMGetC1                    * D4393
              GOC     XMTransfer.L15             * D4397
              DAT0=A  B                          * D439A
              D0=D0+  2                          * D439D
              B=B+A   A                          * D43A0
              D=D-1   A                          * D43A2
              GONC    XMTransfer.loop14          * D43A4
              GOSUB   XMGetC1                    * D43A7
              GOC     XMTransfer.L15             * D43AB
              ?ST=1   8                          * D43AE
              GOYES   XMTransfer.L20             * D43B1
* Compares the block's checksum. A bad one or a read error sends NAK and tries again; a block sent twice is dropped.
              ?A=B    B                          * D43B3
              GOYES   XMTransfer.L16             * D43B6
XMTransfer.L15:
              ST=1    1                          * D43B8
XMTransfer.L16:
              ?ST=1   1                          * D43BB
              GOYES   XMTransfer.L17             * D43BE
              ?ST=0   2                          * D43C0
              GOYES   XMTransfer.L18             * D43C3
XMTransfer.L17:
              C=R3                               * D43C5
              D0=C                               * D43C8
              A=R1                               * D43CB
              C=0     A                          * D43CE
              LC(2)   #7F                        * D43D0
              A=A+C   A                          * D43D4
              C=D     A                          * D43D6
              A=A-C   A                          * D43D8
              R1=A                               * D43DA
              ?ST=0   1                          * D43DD
              GOYES   XMTransfer.L19             * D43E0
              GOTO    XMTransfer.loop11          * D43E2
XMTransfer.L18:
              C=R2                               * D43E6
              C=C+1   B                          * D43E9
              P=      2                          * D43EC
              LC(1)   #9                         * D43EE
              P=      0                          * D43F1
              R2=C                               * D43F3
XMTransfer.L19:
              LC(2)   #06                        * D43F6
              GOTO    XMTransfer.loop3           * D43FA
XMTransfer.L20:
              LC(5)   intrptderr                 * D43FE  "Interrupted"
XMTransfer.L21:
              R4=C                               * D4405
              GOSUB   XMCancel                   * D4408
XMTransfer.L22:
              ST=1    3                          * D440C
XMTransfer.L23:
              GOSBVL  Shrink$                    * D440F
* Turns off the transfer annunciator and allows interrupts again, shrinks the string to its received size and returns the result.
              D1=(5)  ANNCTRL2                   * D4416
              C=DAT1  1                          * D441D
              CBIT=0  1                          * D4421
              DAT1=C  1                          * D4426
              GOSBVL  AllowIntr                  * D442A
              GOSBVL  GETPTR                     * D4431
              A=R0                               * D4438
              DAT1=A  A                          * D443B
              C=R4                               * D443E
XMTransfer.L24:
              ?ST=1   3                          * D4441
              GOYES   XMTransfer.L25             * D4444
              GOVLNG  PushTLoop                  * D4446
XMTransfer.L25:
              R0=C                               * D444D
              GOVLNG  Push#FLoop                 * D4450

* refs (2): D4408 D4782
* Sends CAN three times.
XMCancel:
              LC(3)   #218                       * D4457
XMCancel.loop1:
              GOSUB   XMPutC                     * D445C
              C=C-1   XS                         * D4460
              GONC    XMCancel.loop1             * D4463
              RTN                                * D4466

* refs (5): D4348 D4353 D4370 D4393 D43A7
* -> A.B = byte, carry clear; or carry set with C.A = message: XMGetC with a timeout of 1 second.
XMGetC1:
              LC(5)   #02000                     * D4468

* refs (4): D42FE D449E D44E6 D4662
* C.A = timeout in TIMER2 ticks -> as XMGetC1. Polls the receive buffer. The ON key cuts the wait to a quarter of a second and sets ST 8; a read error sets ST 1. The error is Timeout, or Interrupted after ON.
XMGetC:
              D1=(5)  TIMER2                     * D446F
              A=DAT1  A                          * D4476
              A=A-C   A                          * D4479
XMGetC.loop1:
              D1=(2)  #11                        * D447B
              C=DAT1  1                          * D447F
              ?CBIT=1 0                          * D4483
              GOYES   XMInterrupted.L1           * D4488
              GOSBVL  OnKeyDown?                 * D448A
              GONC    XMGetC.L2                  * D4491
              ST=1    8                          * D4494
              LC(5)   #00800                     * D4497
              GOC     XMGetC                     * D449E
XMGetC.L2:
              D1=(2)  #38                        * D44A1
              C=DAT1  A                          * D44A5
              ?C#A    A                          * D44A8
              GOYES   XMGetC.loop1               * D44AB
              LC(5)   timeouterr                 * D44AD  "Timeout"
              ?ST=0   8                          * D44B4
              RTNYES                             * D44B7

* refs (1): D4786
* -> carry set, C.A = Interrupted.
XMInterrupted:
              LC(5)   intrptderr                 * D44B9  "Interrupted"
              RTNSC                              * D44C0
XMInterrupted.L1:
              ?CBIT=0 2                          * D44C2
              GOYES   XMInterrupted.L2           * D44C7
              ST=1    1                          * D44C9
              D1=(2)  #13                        * D44CC
              DAT1=A  1                          * D44D0
XMInterrupted.L2:
              D1=(2)  #14                        * D44D4
              A=0     A                          * D44D8
              A=DAT1  B                          * D44DA
              RTNCC                              * D44DD

* refs (2): D4735 D47A5
* XMGetC with a timeout of 15 seconds.
XMGetC15:
              LC(5)   #1E000                     * D44DF
              GOTO    XMGetC                     * D44E6

* refs (2): D467B D46C1
* Sends the start of a block: SOH, the block number and its complement.
XMSendHdr:
              LC(2)   #01                        * D44EA
              GOSUB   XMPutC                     * D44EE
              C=R2                               * D44F2
              GOSUB   XMPutC                     * D44F5
              C=-C-1  A                          * D44F9

* refs (7): D445C D44EE D44F5 D454E D468B D46EF ...
* C.B = byte: waits until the transmit buffer is free and sends it. If that takes too long the transfer stops, with Transfer Failed when receiving. ON sets ST 8.
XMPutC:
              RSTK=C                             * D44FB
              LC(5)   #09C40                     * D44FD
              A=C     A                          * D4504
              D1=(5)  NOP1MASK18                 * D4506
XMPutC.loop1:
              C=DAT1  1                          * D450D
              ?CBIT=0 0                          * D4511
              GOYES   XMPutC.L4                  * D4516
              GOSBVL  OnKeyDown?                 * D4518
              GONC    XMPutC.L2                  * D451F
              ST=1    8                          * D4522
XMPutC.L2:
              A=A-1   A                          * D4525
              GONC    XMPutC.loop1               * D4527
              C=RSTK                             * D452A
              ?ST=0   6                          * D452C
              GOYES   XMPutC.L3                  * D452F
              LC(5)   xferfailerr                * D4531  "Transfer Failed"
              R4=C                               * D4538
              GOTO    XMTransfer.L22             * D453B
XMPutC.L3:
              GOTO    XMPutCBlink.L20            * D453F
XMPutC.L4:
              D1=(2)  #16                        * D4543
              C=RSTK                             * D4547
              DAT1=C  B                          * D4549
              RTN                                * D454C

* refs (4): D42E4 D4337 D472C D479C
* C.B = byte: sends it, flashes the transfer annunciator and clears any infrared echo from the receive buffer.
XMPutCBlink:
              GOSUB   XMPutC                     * D454E
              D1=(5)  ANNCTRL2                   * D4552
              C=DAT1  1                          * D4559
              A=C     A                          * D455D
              CBIT=0  1                          * D455F
              ?ABIT=1 1                          * D4564
              GOYES   XMPutCBlink.L1             * D4569
              CBIT=1  1                          * D456B
XMPutCBlink.L1:
              DAT1=C  1                          * D4570
              D1=(5)  IRC                        * D4574
              C=DAT1  B                          * D457B
              ?CBIT=0 2                          * D457E
              RTNYES                             * D4583
              AD0EX                              * D4585
              GOSBVL  WaitTbz0                   * D4588
              D0=D0+  2                          * D458F
              C=DAT0  B                          * D4592
              D0=D0-  1                          * D4595
              DAT0=C  1                          * D4598
              D0=A                               * D459C
              RTN                                * D459F
            ENDCODE                              * D45A1
            ITE                                  * D45A1
            :: OBJ_30607 SWAP xSTONoCK ;         * D45A6
            :: SWAPROT xSTONoCK ERROROUT ;       * D45BF
          ;                                      * D45D8
          :: SAFE@ NOTcase SETNONEXTERR          * D45DD
* Send: splits the object into 128-byte blocks, the first starting with HPHP48 and the version letter so the receiver knows the format. It waits for the NAK that starts the transfer, then sends each block with its checksum, repeating it after a NAK, and ends with EOT.
            CODE                                 * D45F1  503 nibbles
              GOSBVL  PopASavptr                 * D45FB
              D0=A                               * D4602
              R0=A                               * D4605
              GOSBVL  SAFESKIPOB                 * D4608
              LC(5)   #00203                     * D460F
              GOC     XMPutCBlink.L3             * D4616
              CD0EX                              * D4619
              A=R0                               * D461C
              C=C-A   A                          * D461F
              C=C+1   A                          * D4621
              CSRB.F  A                          * D4623
              R1=C                               * D4628
              LC(3)   #901                       * D462B
              R2=C                               * D4630
              GOSBVL  GetVersionId               * D4633
              C=DAT1  M                          * D463A
              CSL     W                          * D463E
              LC(4)   #5048                      * D4641
              R4=C                               * D4647
              GOSBVL  DisableIntr                * D464A
              C=0     A                          * D4651
              ST=C                               * D4653
              ST=1    3                          * D4655
              ST=1    7                          * D4658
XMPutCBlink.loop2:
              LC(5)   #78000                     * D465B
              GOSUB   XMGetC                     * D4662
XMPutCBlink.L3:
              GOC     XMPutCBlink.L7             * D4666
              LC(2)   #18                        * D4669
              ?C=A    B                          * D466D
              GOYES   XMPutCBlink.L6             * D4670
              LC(2)   #15                        * D4672
              ?C#A    B                          * D4676
              GOYES   XMPutCBlink.loop2          * D4679
XMPutCBlink.loop4:
              GOSUB   XMSendHdr                  * D467B
              C=0     A                          * D467F
              LC(1)   #7                         * D4681
              D=C     A                          * D4684
              C=R4                               * D4686
              B=0     A                          * D4689
XMPutCBlink.loop5:
              GOSUB   XMPutC                     * D468B
              B=B+C   B                          * D468F
              CSR     W                          * D4692
              CSR     W                          * D4695
              D=D-1   A                          * D4698
              GONC    XMPutCBlink.loop5          * D469A
              A=R0                               * D469D
              D0=A                               * D46A0
              C=0     A                          * D46A3
              LC(2)   #78                        * D46A5
              GOTO    XMPutCBlink.L9             * D46A9
XMPutCBlink.L6:
              LC(5)   intrptderr                 * D46AD  "Interrupted"
XMPutCBlink.L7:
              ST=1    3                          * D46B4
              GOTO    XMPutCBlink.L21            * D46B7
XMPutCBlink.loop8:
              A=R0                               * D46BB
              D0=A                               * D46BE
              GOSUB   XMSendHdr                  * D46C1
              B=0     A                          * D46C5
              C=0     A                          * D46C7
              LC(2)   #80                        * D46C9
XMPutCBlink.L9:
              A=R1                               * D46CD
              A=A-C   A                          * D46D0
              GONC    XMPutCBlink.L10            * D46D2
              C=C+A   A                          * D46D5
              A=-A    A                          * D46D7
              ASL     A                          * D46D9
              ASL     A                          * D46DB
              C=C+A   A                          * D46DD
XMPutCBlink.L10:
              R3=C                               * D46DF
              C=C-1   B                          * D46E2
              D=C     A                          * D46E5
XMPutCBlink.loop11:
              C=DAT0  B                          * D46E7
              D0=D0+  2                          * D46EA
              B=B+C   A                          * D46ED
              GOSUB   XMPutC                     * D46EF
              D=D-1   B                          * D46F3
              GONC    XMPutCBlink.loop11         * D46F6
              DSR     A                          * D46F9
              DSR     A                          * D46FB
              GOC     XMPutCBlink.L15            * D46FD
XMPutCBlink.loop12:
              C=R2                               * D4700
              C=C-1   XS                         * D4703
              R2=C                               * D4706
              GOC     XMPutCBlink.loop13         * D4709
              ?ST=1   8                          * D470C
              GOYES   XMPutCBlink.L17            * D470F
              ?ST=0   7                          * D4711
              GOYES   XMPutCBlink.loop8          * D4714
              GOTO    XMPutCBlink.loop4          * D4716
XMPutCBlink.loop13:
              GOTO    XMPutCBlink.L20            * D471A
XMPutCBlink.loop14:
              C=0     A                          * D471E
              GOSUB   XMPutC                     * D4720
XMPutCBlink.L15:
              D=D-1   B                          * D4724
              GONC    XMPutCBlink.loop14         * D4727
              C=B     A                          * D472A
              GOSUB   XMPutCBlink                * D472C
              ?ST=1   8                          * D4730
              GOYES   XMPutCBlink.L17            * D4733
              GOSUB   XMGetC15                   * D4735
XMPutCBlink.loop16:
              GOC     XMPutCBlink.loop12         * D4739
              LC(2)   #18                        * D473C
              ?C=A    B                          * D4740
              GOYES   XMPutCBlink.loop13         * D4743
              LC(2)   #06                        * D4745
              ?C#A    B                          * D4749
              GOYES   XMPutCBlink.loop16         * D474C
              ST=0    7                          * D474E
              AD0EX                              * D4751
              R0=A                               * D4754
              D0=A                               * D4757
              C=R2                               * D475A
              C=C+1   A                          * D475D
              P=      2                          * D475F
              LC(1)   #9                         * D4761
              P=      0                          * D4764
              R2=C                               * D4766
              A=R1                               * D4769
              C=R3                               * D476C
              B=0     A                          * D476F
              B=C     B                          * D4771
              A=A-B   A                          * D4774
              R1=A                               * D4776
              ?A=0    A                          * D4779
              GOYES   XMPutCBlink.L22            * D477C
              GOTO    XMPutCBlink.loop8          * D477E
XMPutCBlink.L17:
              GOSUB   XMCancel                   * D4782
              GOSUB   XMInterrupted              * D4786
              GOTO    XMPutCBlink.L21            * D478A
XMPutCBlink.loop18:
              C=R2                               * D478E
              C=C-1   XS                         * D4791
              GOC     XMPutCBlink.L20            * D4794
XMPutCBlink.loop19:
              R2=C                               * D4797
              C=D     A                          * D479A
              GOSUB   XMPutCBlink                * D479C
              ?ST=1   8                          * D47A0
              GOYES   XMPutCBlink.L20            * D47A3
              GOSUB   XMGetC15                   * D47A5
              GOC     XMPutCBlink.loop18         * D47A9
              LC(2)   #18                        * D47AC
              ?C=A    B                          * D47B0
              GOYES   XMPutCBlink.L20            * D47B3
              LC(2)   #06                        * D47B5
              ?C#A    B                          * D47B9
              GOYES   XMPutCBlink.loop18         * D47BC
              ?ST=1   8                          * D47BE
              GOYES   XMPutCBlink.L20            * D47C1
              ST=0    3                          * D47C3
XMPutCBlink.L20:
              LC(5)   xferfailerr                * D47C6  "Transfer Failed"
XMPutCBlink.L21:
              GOSBVL  AllowIntr                  * D47CD
              A=C     A                          * D47D4
              GOSBVL  GETPTR                     * D47D6
              C=A     A                          * D47DD
              GOTO    XMTransfer.L24             * D47DF
XMPutCBlink.L22:
              LC(2)   #04                        * D47E3
              D=C     A                          * D47E7
              LC(3)   #500                       * D47E9
              GOTO    XMPutCBlink.loop19         * D47EE
            ENDCODE                              * D47F2
            NOTcase ERROROUT                     * D47F2
          ;                                      * D47FC
        ;                                        * D4801
