* HP 48GX ROM revision R, #3E005-#40001: Key handling
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: DoBadKey DirLabel: ?CaseKeyDef NullMenuKey 'DoBadKeyT ?CaseRomptr@ NoExitAction Box/StdLabel ComLine?:(bip;q) Key>U/SKeyOb EvalNextChkPRG Box/StdLbl:
* Follows on from the previous file (at #3E005 in the original ROM).
        RPL

* ROMPTR 0A3 01E
* refs (1): 3DCED
ROMP_0A3_01E:
        ROMPTR  0B4 000                          * 3E005

* ROMPTR 0A3 01F
* refs (1): 3DCED
ROMP_0A3_01F:
        ROMPTR  0B4 045                          * 3E010

* ROMPTR 0A3 020
* refs (1): 3DCED
ROMP_0A3_020:
        ROMPTR  0B4 113                          * 3E01B

* ROMPTR 0A3 021
* refs (1): 3DCED
ROMP_0A3_021:
        ::                                       * 3E026
          DoDelim                                * 3E02B
          CHR_#                                  * 3E030
          ?ClrAlg                                * 3E035
        ;                                        * 3E03A

* ROMPTR 0A3 022
* refs (1): 3DCED
ROMP_0A3_022:
        ROMPTR  0A1 022                          * 3E03F

* ROMPTR 0A3 023
* refs (1): 3DCED
ROMP_0A3_023:
        ROMPTR  0B4 137                          * 3E04A

* ROMPTR 0A3 024
* refs (1): 3DCED
ROMP_0A3_024:
        ROMPTR  0B4 175                          * 3E055

* ROMPTR 0A3 025
* refs (1): 3DCED
ROMP_0A3_025:
        ::                                       * 3E060
          MenuMaker                              * 3E065
          ROMPTR  0A9 02A                        * 3E06A
          DoMenuKey                              * 3E075
        ;                                        * 3E07A

* ROMPTR 0A3 026
* refs (3): 3DCED 6BCFE 8F5D9
ROMP_0A3_026:
        ::                                       * 3E07F
          DoDelim                                * 3E084
          CHR_UndScore                           * 3E089
          OBJ_40E1F                              * 3E08E
        ;                                        * 3E093

* ROMPTR 0A3 027
* refs (1): 3DCED
ROMP_0A3_027:
        ROMPTR  0A2 022                          * 3E098

* ROMPTR 0A3 028
* refs (1): 3DCED
ROMP_0A3_028:
        ROMPTR  0B4 192                          * 3E0A3

* ROMPTR 0A3 029
* refs (1): 3DCED
ROMP_0A3_029:
        ::                                       * 3E0AE
          MenuMaker                              * 3E0B3
          ROMPTR  0A9 070                        * 3E0B8
          DoMenuKey                              * 3E0C3
        ;                                        * 3E0C8

* ROMPTR 0A3 02A
* refs (1): 3DCED
ROMP_0A3_02A:
        ROMPTR  0AB 022                          * 3E0CD  EQNLIB

* ROMPTR 0A3 02B
* refs (2): 3DCED 6BAA1
ROMP_0A3_02B:
        ::                                       * 3E0D8
          DoDelims                               * 3E0DD
          $_2DQ                                  * 3E0E2
          ?ClrAlg                                * 3E0E7
        ;                                        * 3E0EC

* ROMPTR 0A3 02C
* refs (1): 3DCED
ROMP_0A3_02C:
        ::                                       * 3E0F1
          Modifier                               * 3E0F6
          TurnOff                                * 3E0FB
          SetDA123NoCh                           * 3E100
        ;                                        * 3E105

* ROMPTR 0A3 02D
* refs (1): 3DCED
ROMP_0A3_02D:
        ROMPTR  700 004                          * 3E10A  →

* ROMPTR 0A3 02E
* refs (1): 3DCED
ROMP_0A3_02E:
        ::                                       * 3E115
          TakeOver                               * 3E11A
          OBJ_42B61                              * 3E11F
          SetDA13NoCh                            * 3E124
        ;                                        * 3E129

* ROMPTR 0A3 02F
* refs (1): 3DCED
K_128_3E12E:
        CHR     "∡"                              * 3E12E

* ROMPTR 0A3 030
* refs (1): 3DCED
ROMP_0A3_030:
        ::                                       * 3E135
          DoDelims                               * 3E13A
          PTR     $_::                           * 3E13F
          ?ClrAlgSetPr                           * 3E144
        ;                                        * 3E149

* refs (1): 3B509
OBJ_3E14E:
        ::                                       * 3E14E
          Cursor&Disp                            * 3E153
          ToNextRowIfEnd                         * 3E158
        ;                                        * 3E15D
        NIBHEX  00000                            * 3E162  ..

LIB0A3.hash:
        CON(5)  DOHSTR                           * 3E167  hash table of library 0A3
        LENGTH                                   * 3E16C  length, to #3E1CB
        CON(5)  0                                * 3E171  names of length 1
        CON(5)  0                                * 3E176  names of length 2
        CON(5)  0                                * 3E17B  names of length 3
        CON(5)  0                                * 3E180  names of length 4
        CON(5)  0                                * 3E185  names of length 5
        CON(5)  0                                * 3E18A  names of length 6
        CON(5)  0                                * 3E18F  names of length 7
        CON(5)  0                                * 3E194  names of length 8
        CON(5)  0                                * 3E199  names of length 9
        CON(5)  0                                * 3E19E  names of length 10
        CON(5)  0                                * 3E1A3  names of length 11
        CON(5)  0                                * 3E1A8  names of length 12
        CON(5)  0                                * 3E1AD  names of length 13
        CON(5)  0                                * 3E1B2  names of length 14
        CON(5)  0                                * 3E1B7  names of length 15
        CON(5)  0                                * 3E1BC  names of length 16
        REL(5)  L_3E1C6                          * 3E1C1  end of the names
L_3E1C6:
        CON(5)  0                                * 3E1C6  command 000 has no name
        ENDLENGTH                                * 3E1CB

LIB0A3.link:
        CON(5)  DOHSTR                           * 3E1CB  link table of library 0A3
        LENGTH                                   * 3E1D0  length, to #3E2CA
        REL(5)  RightShift1                      * 3E1D5  000 
        REL(5)  RightShift2                      * 3E1DA  001 
        REL(5)  ROMP_0A3_002                     * 3E1DF  002 
        REL(5)  RightShift4                      * 3E1E4  003 
        REL(5)  RightShift5                      * 3E1E9  004 
        REL(5)  RightShift6                      * 3E1EE  005 
        REL(5)  ROMP_0A3_006                     * 3E1F3  006 
        REL(5)  ROMP_0A3_007                     * 3E1F8  007 
        REL(5)  ROMP_0A3_008                     * 3E1FD  008 
        REL(5)  ROMP_0A3_009                     * 3E202  009 
        REL(5)  ROMP_0A3_00A                     * 3E207  00A 
        REL(5)  ROMP_0A3_00B                     * 3E20C  00B 
        REL(5)  ROMP_0A3_00C                     * 3E211  00C 
        REL(5)  ROMP_0A3_00D                     * 3E216  00D 
        REL(5)  ROMP_0A3_00E                     * 3E21B  00E 
        REL(5)  ROMP_0A3_00F                     * 3E220  00F 
        REL(5)  ROMP_0A3_010                     * 3E225  010 
        REL(5)  ROMP_0A3_011                     * 3E22A  011 
        REL(5)  ROMP_0A3_012                     * 3E22F  012 
        REL(5)  ROMP_0A3_013                     * 3E234  013 
        REL(5)  ROMP_0A3_014                     * 3E239  014 
        REL(5)  ROMP_0A3_015                     * 3E23E  015 
        REL(5)  ROMP_0A3_016                     * 3E243  016 
        REL(5)  ROMP_0A3_017                     * 3E248  017 
        REL(5)  ROMP_0A3_018                     * 3E24D  018 
        REL(5)  ROMP_0A3_019                     * 3E252  019 
        REL(5)  ROMP_0A3_01A                     * 3E257  01A 
        REL(5)  ROMP_0A3_01B                     * 3E25C  01B 
        REL(5)  ROMP_0A3_01C                     * 3E261  01C 
        REL(5)  ROMP_0A3_01D                     * 3E266  01D 
        REL(5)  ROMP_0A3_01E                     * 3E26B  01E 
        REL(5)  ROMP_0A3_01F                     * 3E270  01F 
        REL(5)  ROMP_0A3_020                     * 3E275  020 
        REL(5)  ROMP_0A3_021                     * 3E27A  021 
        REL(5)  ROMP_0A3_022                     * 3E27F  022 
        REL(5)  ROMP_0A3_023                     * 3E284  023 
        REL(5)  ROMP_0A3_024                     * 3E289  024 
        REL(5)  ROMP_0A3_025                     * 3E28E  025 
        REL(5)  ROMP_0A3_026                     * 3E293  026 
        REL(5)  ROMP_0A3_027                     * 3E298  027 
        REL(5)  ROMP_0A3_028                     * 3E29D  028 
        REL(5)  ROMP_0A3_029                     * 3E2A2  029 
        REL(5)  ROMP_0A3_02A                     * 3E2A7  02A 
        REL(5)  ROMP_0A3_02B                     * 3E2AC  02B 
        REL(5)  ROMP_0A3_02C                     * 3E2B1  02C 
        REL(5)  ROMP_0A3_02D                     * 3E2B6  02D 
        REL(5)  ROMP_0A3_02E                     * 3E2BB  02E 
        REL(5)  K_128_3E12E                      * 3E2C0  02F 
        REL(5)  ROMP_0A3_030                     * 3E2C5  030 
        ENDLENGTH                                * 3E2CA
        BSS     19                               * 3E2CA

* -> {}
* refs (3): 3BDFF D5164 D5235
<SkipKey:
        {                                        * 3E2DD

_<-SKIP_:
          $       "←SKIP"                        * 3E2E2
          ::                                     * 3E2F6
            NoComLine?:(bip;q)                   * 3E2FB
            BegComLine?:(bip;q)                  * 3E300
            Cursor&Disp                          * 3E305
            ::                                   * 3E30A
              BEGIN                              * 3E30F
              OBJ_3E634                          * 3E314
              AND                                * 3E319
              WHILE                              * 3E31E
              <-Skip!                            * 3E323
              REPEAT                             * 3E328
              BEGIN                              * 3E32D
              OBJ_3E634                          * 3E332
              NOTAND                             * 3E337
              WHILE                              * 3E33C
              <-Skip!                            * 3E341
              REPEAT                             * 3E346
            ;                                    * 3E34B
            SetDA123NoCh                         * 3E350
          ;                                      * 3E355
        }                                        * 3E35A

* -> {}
* refs (3): 3BE04 D5169 D523A
>SkipKey:
        {                                        * 3E35F

_SKIP->_:
          $       "SKIP→"                        * 3E364
          ::                                     * 3E378
            NoComLine?:(bip;q)                   * 3E37D
            EndComLine?:(bip;q)                  * 3E382
            Cursor&Disp                          * 3E387
            ::                                   * 3E38C
              BEGIN                              * 3E391
              ChkSkip->                          * 3E396
              NOTAND                             * 3E39B
              WHILE                              * 3E3A0
              Skip->!                            * 3E3A5
              REPEAT                             * 3E3AA
              BEGIN                              * 3E3AF
              ChkSkip->                          * 3E3B4
              AND                                * 3E3B9
              WHILE                              * 3E3BE
              Skip->!                            * 3E3C3
              REPEAT                             * 3E3C8
            ;                                    * 3E3CD
            SetDA123NoCh                         * 3E3D2
          ;                                      * 3E3D7
        }                                        * 3E3DC

* -> {}
* refs (3): 3BE09 D516E D523F
<DelKey:
        {                                        * 3E3E1

_<-DEL_:
          $       "←DEL"                         * 3E3E6
          {                                      * 3E3F8
            ::                                   * 3E3FD
              NoComLine?:(bip;q)                 * 3E402
              BegComLine?:(bip;q)                * 3E407
              EDITPARTS                          * 3E40C
              BEGIN                              * 3E411
              OBJ_3E634                          * 3E416
              AND                                * 3E41B
              WHILE                              * 3E420

<-del!:
              ::                                 * 3E425
                <-Skip!                          * 3E42A
                OBJ_429CB                        * 3E42F
              ;                                  * 3E434
              REPEAT                             * 3E439
              BEGIN                              * 3E43E
              OBJ_3E634                          * 3E443
              NOTAND                             * 3E448
              WHILE                              * 3E44D
              ::                                 * 3E452
                <-Skip!                          * 3E457
                OBJ_429CB                        * 3E45C
              ;                                  * 3E461
              REPEAT                             * 3E466
              SetDA13NoCh                        * 3E46B
              OBJ_3E6D4                          * 3E470
            ;                                    * 3E475
            DoBadKey                             * 3E47A

* refs (1): 3DFA1
OBJ_3E47F:
            ::                                   * 3E47F
              NoComLine?:(bip;q)                 * 3E484
              BEGIN                              * 3E489
              OnTheFirstCol?                     * 3E48E
              NOT                                * 3E493
              WHILE                              * 3E498

DelLeftChr:
              ::                                 * 3E49D
                LCursor                          * 3E4A2
                OBJ_429CB                        * 3E4A7
              ;                                  * 3E4AC
              REPEAT                             * 3E4B1
              SetDA13NoCh                        * 3E4B6
            ;                                    * 3E4BB
          }                                      * 3E4C0
        }                                        * 3E4C5

* -> {}
* refs (3): 3BE0E D5173 D5244
>DelKey:
        {                                        * 3E4CA

_DEL->_:
          $       "DEL→"                         * 3E4CF
          {                                      * 3E4E1
            ::                                   * 3E4E6
              NoComLine?:(bip;q)                 * 3E4EB
              EndComLine?:(bip;q)                * 3E4F0
              EDITPARTS                          * 3E4F5
              BEGIN                              * 3E4FA
              ChkSkip->                          * 3E4FF
              NOTAND                             * 3E504
              WHILE                              * 3E509
              OBJ_429CB                          * 3E50E
              REPEAT                             * 3E513
              BEGIN                              * 3E518
              ChkSkip->                          * 3E51D
              AND                                * 3E522
              WHILE                              * 3E527
              OBJ_429CB                          * 3E52C
              REPEAT                             * 3E531
              SetDA13NoCh                        * 3E536
              OBJ_3E6D4                          * 3E53B
            ;                                    * 3E540
            DoBadKey                             * 3E545

* refs (1): 3DF8D
OBJ_3E54A:
            ::                                   * 3E54A
              NoComLine?:(bip;q)                 * 3E54F
              BEGIN                              * 3E554
              CURSOR_END?                        * 3E559
              NOT                                * 3E55E
              WHILE                              * 3E563
              OBJ_429CB                          * 3E568
              REPEAT                             * 3E56D
              SetDA13NoCh                        * 3E572
            ;                                    * 3E577
          }                                      * 3E57C
        }                                        * 3E581

* refs (3): 3BE13 D5178 D5249
TogInsertKey:
        {                                        * 3E586

INSLabel:
          ::                                     * 3E58B
            PTR     Box/StdLbl:                  * 3E590

_INS_:
            $       "INS"                        * 3E595
            INSERT?                              * 3E5A5
          ;                                      * 3E5AA

\INS:
          ::                                     * 3E5AF
            TakeOver                             * 3E5B4
            InvCursor                            * 3E5B9
            SetDA12NoCh                          * 3E5BE
          ;                                      * 3E5C3
        }                                        * 3E5C8

* refs (1): 3BE18
IStackKey:
        {                                        * 3E5CD

_^STK_:
          $       "↑STK"                         * 3E5D2
          OBJ_4365D                              * 3E5E4
        }                                        * 3E5E9

* refs (9): 3DE95 3DF88 3DF9C 3E2FB 3E37D 3E402 ...
NoComLine?:(bip;q):
        ::                                       * 3E5EE
          TakeOver                               * 3E5F3
          EditLExists?                           * 3E5F8
          ?SEMI                                  * 3E5FD
          DoBadKey                               * 3E602
          RDROP                                  * 3E607
        ;                                        * 3E60C

* refs (18): 43F2B 43F4E 4407F 8EB9D 8EE50 8F071 ...
ComLine?:(bip;q):
        ::                                       * 3E611
          TakeOver                               * 3E616
          EditLExists?                           * 3E61B
          NOT?SEMI                               * 3E620
          DoBadKey                               * 3E625
          RDROP                                  * 3E62A
        ;                                        * 3E62F

* refs (4): 3E314 3E332 3E416 3E443
OBJ_3E634:
        ::                                       * 3E634
          CURSOR@                                * 3E639
          #0<>                                   * 3E63E
          PrevChrInComLine                       * 3E643
          DUP                                    * 3E648
          CHR_Space                              * 3E64D
          EQUAL                                  * 3E652
          SWAP                                   * 3E657
          CHR_Newline                            * 3E65C
          EQUALOR                                * 3E661
        ;                                        * 3E666

* refs (4): 3E323 3E341 3E42A 3E457
<-Skip!:
        ::                                       * 3E66B
          OnTheFirstCol?                         * 3E670
          case                                   * 3E675
          PrevLineIfStart                        * 3E67A
          LCursor                                * 3E67F
        ;                                        * 3E684

* refs (4): 3E396 3E3B4 3E4FF 3E51D
ChkSkip->:
        ::                                       * 3E689
          NextChrInComLine                       * 3E68E
          CHR_00                                 * 3E693
          EQUALNOT                               * 3E698
          NextChrInComLine=space?                * 3E69D
          NextChrInComLine                       * 3E6A2
          CHR_Newline                            * 3E6A7
          EQUALOR                                * 3E6AC
        ;                                        * 3E6B1

* refs (2): 3E3A5 3E3C3
Skip->!:
        ::                                       * 3E6B6
          CURSOR_END?                            * 3E6BB
          case                                   * 3E6C0
          ToNextRowIfEnd                         * 3E6C5
          ->OnTheRow                             * 3E6CA
        ;                                        * 3E6CF

* refs (2): 3E470 3E53B
OBJ_3E6D4:
        ::                                       * 3E6D4
          EDITPARTS                              * 3E6D9
          BINT3                                  * 3E6DE
          OVER#<                                 * 3E6E3
          case2drop                              * 3E6E8
          SetDA2aNoCh                            * 3E6ED
          #=case                                 * 3E6F2
          SetDA2aNoCh                            * 3E6F7
        ;                                        * 3E6FC

* refs (2): 2117B 3BED1
ChkForMenu(_):
        ::                                       * 3E701
          DUPTYPELIST?                           * 3E706
          ?SEMI                                  * 3E70B
          dup;#nm?                               * 3E710
          casedrop                               * 3E715
          NULL{}                                 * 3E71A
          SAFE@                                  * 3E71F
          NOTcase                                * 3E724
          NULL{}                                 * 3E729
          DUPTYPELIST?                           * 3E72E
          NOTcasedrop                            * 3E733
          NULL{}                                 * 3E738
        ;                                        * 3E73D

* refs (1): 46A72
{GRAPH\+/-}:
        {                                        * 3E742
          ::                                     * 3E747
            PTR     Box/StdLbl:                  * 3E74C

_+/-_:
            $       "+/-"                        * 3E751
            OBJ_50F2E                            * 3E761
          ;                                      * 3E766
          OBJ_50ECF                              * 3E76B
        }                                        * 3E770

* refs (1): 46AD9
{GRAPH\REPL}:
        {                                        * 3E775

_REPL_:
          $       "REPL"                         * 3E77A
          \REPL                                  * 3E78C
        }                                        * 3E791

* refs (1): 46AD4
{GRAPH\SUä}:
        {                                        * 3E796

_SUä_:
          $       "SUB"                          * 3E79B
          OBJ_456F9                              * 3E7AB
        }                                        * 3E7B0

* refs (1): 46A7C
{GRAPH\DEL}:
        {                                        * 3E7B5

_DEL_:
          $       "DEL"                          * 3E7BA
          OBJ_45758                              * 3E7CA
        }                                        * 3E7CF

* refs (1): 46A77
{GRAPH\LABEL}:
        {                                        * 3E7D4
          xLABEL                                 * 3E7D9
          OBJ_4E861                              * 3E7DE
        }                                        * 3E7E3

{GRAPH\MENUU}:
        {                                        * 3E7E8

_Keys_:
          $       "Keys"                         * 3E7ED
          MENUOFF                                * 3E7FF
        }                                        * 3E804

* refs (1): 46A6D
{GRAPH\MARK}:
        {                                        * 3E809

_MARK_:
          $       "MARK"                         * 3E80E
          \MARK                                  * 3E820
        }                                        * 3E825

* refs (1): 46A59
{GRAPH\LINE}:
        {                                        * 3E82A
          xLINE                                  * 3E82F
          \LINE                                  * 3E834
        }                                        * 3E839

* refs (1): 46A5E
{GRAPH\TLINE}:
        {                                        * 3E83E
          xTLINE                                 * 3E843
          \TLINE                                 * 3E848
        }                                        * 3E84D

* refs (1): 46A63
{GRAPH\BOX}:
        {                                        * 3E852
          xBOX                                   * 3E857
          \BOX                                   * 3E85C
        }                                        * 3E861

* refs (1): 46A68
{GRAPH\CIRCLE}:
        {                                        * 3E866

_CIRCLE_:
          $       "CIRCLE"                       * 3E86B
          \CIRCLE                                * 3E881
        }                                        * 3E886

* refs (1): 46A4F
{GRAPH\DOT+}:
        {                                        * 3E88B
          ::                                     * 3E890
            PTR     Box/StdLbl:                  * 3E895

_DOT+_:
            $       "DOT+"                       * 3E89A
            OBJ_7362F                            * 3E8AC
          ;                                      * 3E8B1
          OBJ_4DE22                              * 3E8B6
        }                                        * 3E8BB

* refs (1): 46A54
{GRAPH\DOT-}:
        {                                        * 3E8C0
          ::                                     * 3E8C5
            PTR     Box/StdLbl:                  * 3E8CA

_DOT-_:
            $       "DOT-"                       * 3E8CF
            OBJ_50EBB                            * 3E8E1
          ;                                      * 3E8E6
          OBJ_4DE68                              * 3E8EB
        }                                        * 3E8F0
        FILLTO  #3EC71                           * 3E8F5  892 zero nibbles: the next entry stays at #3EC71

* ->
* refs (83): 152DC 4117A 4117F 86B2D 9A788 9A78D ...
NullMenuKey:
        {                                        * 3EC71
          NULL$                                  * 3EC76
          DoBadKey                               * 3EC7B
        }                                        * 3EC80

* ->
* refs (37): 3BEA4 3BF1C 3C0F3 3F20B 40189 41378 ...
NoExitAction:
        ::                                       * 3EC85
          'NOP                                   * 3EC8A
          MenuExitAct!                           * 3EC8F
        ;                                        * 3EC94

* $ flag -> grob
* refs (22): 3ECC6 3ED02 3ED3E 3ED61 8EBF9 8EC27 ...
Box/StdLabel:
        ::                                       * 3EC99
          case                                   * 3EC9E
          MakeBoxLabel                           * 3ECA3
          MakeStdLabel                           * 3ECA8
        ;                                        * 3ECAD

* -> grob
* refs (10): 3E590 3E74C 3E895 3E8CA 733A6 C61EF ...
Box/StdLbl::
        ::                                       * 3ECB2
          TakeOver                               * 3ECB7
          'R'R                                   * 3ECBC
          EVAL                                   * 3ECC1
          Box/StdLabel                           * 3ECC6
        ;                                        * 3ECCB

* -> grob
* refs (9): C53F6 C61BE C62ED C6355 C6406 C648A ...
FStd/BoxLbl::
        ::                                       * 3ECD0
          TakeOver                               * 3ECD5
          'R'R                                   * 3ECDA
          TestSysFlag                            * 3ECDF
          Std/BoxLabel                           * 3ECE4
        ;                                        * 3ECE9

* -> grob
* refs (5): C618B C6322 C6733 C6DFA C73FC
FBox/StdLbl::
        ::                                       * 3ECEE
          TakeOver                               * 3ECF3
          'R'R                                   * 3ECF8
          TestSysFlag                            * 3ECFD
          Box/StdLabel                           * 3ED02
        ;                                        * 3ED07

* $ flag -> grob
* refs (1): 3ECE4
Std/BoxLabel:
        ::                                       * 3ED0C
          case                                   * 3ED11
          MakeStdLabel                           * 3ED16
          MakeBoxLabel                           * 3ED1B
        ;                                        * 3ED20

* -> grob
* refs (4): C56CD C570F C5751 C5793
BBox/StdLbl::
        ::                                       * 3ED25
          TakeOver                               * 3ED2A
          'R'R                                   * 3ED2F
          BASE                                   * 3ED34
          EQ                                     * 3ED39
          Box/StdLabel                           * 3ED3E
        ;                                        * 3ED43

* -> grob
* refs (4): C60B0 C60F2 C6125 C6158
MBox/StdLbl::
        ::                                       * 3ED48
          TakeOver                               * 3ED4D
          'R'R                                   * 3ED52
          NumbMode                               * 3ED57
          EQ                                     * 3ED5C
          Box/StdLabel                           * 3ED61
        ;                                        * 3ED66

* -> grob
* refs (95): 47D17 47DAC 47DDE 6A9AB 73312 733F1 ...
DirLabel::
        ::                                       * 3ED6B
          TakeOver                               * 3ED70
          'R                                     * 3ED75
          MakeDirLabel                           * 3ED7A
        ;                                        * 3ED7F

* refs (2): 3D763 3DD9F
OBJ_3ED84:
        ::                                       * 3ED84
          TakeOver                               * 3ED89
          'R                                     * 3ED8E
          TogSysFlag                             * 3ED93
          SetDA2bNoCh                            * 3ED98
        ;                                        * 3ED9D

* # ->
* refs (5): 22316 22334 3ED93 40058 40D57
TogSysFlag:
        ::                                       * 3EDA2
          DUP                                    * 3EDA7
          TestSysFlag                            * 3EDAC
          case                                   * 3EDB1
          ClrSysFlag                             * 3EDB6
          SetSysFlag                             * 3EDBB
        ;                                        * 3EDC0

* refs (11): C541C C5486 C54ED C56F1 C5733 C5775 ...
EvalNextChkPRG:
        ::                                       * 3EDC5
          TakeOver                               * 3EDCA
          'R                                     * 3EDCF
          PrgmEntry?                             * 3EDD4
          case                                   * 3EDD9
          DoKeyOb                                * 3EDDE
          EVAL                                   * 3EDE3
          AtUserStack                            * 3EDE8
        ;                                        * 3EDED

* -> :: ob1 ; (PRG mode) -> :: ob1 <rest> (no PRG mode)
* refs (6): C6801 C70CC C70F4 C711C C7144 C716C
Do1st/1st+::
        ::                                       * 3EDF2
          TakeOver                               * 3EDF7
          R>                                     * 3EDFC
          PrgmEntry?                             * 3EE01
          IT                                     * 3EE06
          CARCOMP                                * 3EE0B
          DoKeyOb                                * 3EE10
        ;                                        * 3EE15

* -> :: <ob1> ; (PRG mode) -> :: <ob2> <rest> ; (no PRG mode)
* refs (5): 3B3F0 3D8A3 3D8EE 3DF59 C66B4
Do1st/2nd+::
        ::                                       * 3EE1A
          TakeOver                               * 3EE1F
          'R                                     * 3EE24
          R>                                     * 3EE29
          PrgmEntry?                             * 3EE2E
          ?SKIPSWAP                              * 3EE33
          DROP                                   * 3EE38
          DoKeyOb                                * 3EE3D
        ;                                        * 3EE42

* refs (6): 3DB0D C5A05 C5A74 C5A8D C5AF8 C5B11
Echo2Macros:
        ::                                       * 3EE47
          TakeOver                               * 3EE4C
          'R'R                                   * 3EE51
          OBJ_3EEC9                              * 3EE56
          ToTheEndOfRow                          * 3EE5B
        ;                                        * 3EE60

* refs (4): C594D C5B7A C5BEE C5E0C
3NextInCmdLine:
        ::                                       * 3EE65
          TakeOver                               * 3EE6A
          'R'R                                   * 3EE6F
          'R                                     * 3EE74
          OBJ_3EEEC                              * 3EE79
          OBJ_3EEC9                              * 3EE7E
          UCursor                                * 3EE83
          ToTheEndOfRow                          * 3EE88
        ;                                        * 3EE8D

* refs (3): C596B C59E2 C5E2A
4NextInCmdLine:
        ::                                       * 3EE92
          TakeOver                               * 3EE97
          'R'R                                   * 3EE9C
          'R'R                                   * 3EEA1
          OBJ_3EEEC                              * 3EEA6
          OBJ_3EEEC                              * 3EEAB
          OBJ_3EEC9                              * 3EEB0
          UCursor                                * 3EEB5
          UCursor                                * 3EEBA
          ToTheEndOfRow                          * 3EEBF
        ;                                        * 3EEC4

* refs (3): 3EE56 3EE7E 3EEB0
OBJ_3EEC9:
        ::                                       * 3EEC9
          ?ClrAlgSetPr                           * 3EECE
          SetDA3NoCh                             * 3EED3
          OBJ_3EEEC                              * 3EED8
          OBJ_3EEEC                              * 3EEDD
          UCursor                                * 3EEE2
        ;                                        * 3EEE7

* refs (5): 3EE79 3EEA6 3EEAB 3EED8 3EEDD
OBJ_3EEEC:
        ::                                       * 3EEEC
          OnTheFirstCol?                         * 3EEF1
          ?SKIP                                  * 3EEF6
          OBJ_42B61                              * 3EEFB
          OBJ_408C3                              * 3EF00
          APPEND_SPACE                           * 3EF05
          AddInComLine(st)                       * 3EF0A
        ;                                        * 3EF0F

* refs (16): 3C93B 3CAA2 3CB85 3CD00 3CD69 3CE02 ...
OBJ_3EF14:
        ::                                       * 3EF14
          '                                      * 3EF19
          ::                                     * 3EF1E
            OBJ_3F06D                            * 3EF23
            OBJ_3EF87                            * 3EF28
            StdMenuKeyNS                         * 3EF2D
          ;                                      * 3EF32
          MenuKeyNS!                             * 3EF37
          '                                      * 3EF3C
          ::                                     * 3EF41
            OBJ_3F06D                            * 3EF46
            OBJ_3EF87                            * 3EF4B
            StdMenuKeyLS                         * 3EF50
          ;                                      * 3EF55
          MenuKeyLS!                             * 3EF5A
          '                                      * 3EF5F
          ::                                     * 3EF64
            OBJ_3F06D                            * 3EF69
            OBJ_3EF87                            * 3EF6E
            StdRightShift                        * 3EF73
          ;                                      * 3EF78
          MenuKeyRS!                             * 3EF7D
        ;                                        * 3EF82

* refs (3): 3EF28 3EF4B 3EF6E
OBJ_3EF87:
        ::                                       * 3EF87
          BINT0                                  * 3EF8C
          OBJ_25F4E                              * 3EF91
          ROT                                    * 3EF96
          BINT1                                  * 3EF9B
          GetNextToken                           * 3EFA0
          OBJ_28706                              * 3EFA5
          7DROP                                  * 3EFAA
        ;                                        * 3EFAF

* refs (4): 3D425 3D46B 3EFDC 3EFF5
OBJ_3EFB4:
        ::                                       * 3EFB4
          COLA                                   * 3EFB9
          OBJ_3F06D                              * 3EFBE
        ;                                        * 3EFC3

* refs (2): 41525 6BD7B
OBJ_3EFC8:
        ::                                       * 3EFC8
          MenuKeyNS@                             * 3EFCD
          CARCOMP                                * 3EFD2
          PTR     EQ:                            * 3EFD7
          OBJ_3EFB4                              * 3EFDC
        ;                                        * 3EFE1

* refs (5): 3BF17 3C0EE 3C26A 3C6B9 3D498
OBJ_3EFE6:
        ::                                       * 3EFE6
          '                                      * 3EFEB
          ::                                     * 3EFF0
            OBJ_3EFB4                            * 3EFF5
            OBJ_40184                            * 3EFFA
          ;                                      * 3EFFF
          OnlyDefNoShift!                        * 3F004
        ;                                        * 3F009

* refs (8): 3C459 3C4E3 3C56D 3C5F7 3C681 3D434 ...
OnlyDefNoShift!:
        ::                                       * 3F00E
          MenuKeyNS!                             * 3F013
          '                                      * 3F018
          DropBadKey                             * 3F01D
          DUP                                    * 3F022
          MenuKeyLS!                             * 3F027
          MenuKeyRS!                             * 3F02C
        ;                                        * 3F031

* refs (6): 3BF12 3C0E9 3C265 3C6B4 3D416 3D493
OBJ_3F036:
        ::                                       * 3F036
          '                                      * 3F03B
          ::                                     * 3F040
            DUPNULL$?                            * 3F045
            ITE                                  * 3F04A
            MakeStdLabel                         * 3F04F
            MakeDirLabel                         * 3F054
            Grob>Menu                            * 3F059
          ;                                      * 3F05E
          LabelDef!                              * 3F063
        ;                                        * 3F068

* refs (4): 3EF23 3EF46 3EF69 3EFBE
OBJ_3F06D:
        ::                                       * 3F06D
          DUPTYPECOL?                            * 3F072
          NOT?SEMI                               * 3F077
          SystemLevel?                           * 3F07C
          NOT?SEMI                               * 3F081
          RDROP                                  * 3F086
          EVAL                                   * 3F08B
        ;                                        * 3F090

* refs (2): 3BF7D 3C16A
_LIST_:
        $       "LIST"                           * 3F095

* refs (1): 4127E
OBJ_3F0A7:
        ::                                       * 3F0A7
          TAG>                                   * 3F0AC
          OBJ_3F0CA                              * 3F0B1
          case                                   * 3F0B6
          OBJ_41355                              * 3F0BB
          SWAPDROP                               * 3F0C0
        ;                                        * 3F0C5

* refs (2): 3F0B1 40152
OBJ_3F0CA:
        ::                                       * 3F0CA
          tok&                                   * 3F0CF
          tok=casedrop                           * 3F0D4
          TRUE                                   * 3F0D9
          CODE                                   * 3F0DE  148 nibbles
            A=DAT1  A                            * 3F0E8
            CD1EX                                * 3F0EB
            R0=C                                 * 3F0EE
            D1=A                                 * 3F0F1
            D1=D1+  5                            * 3F0F4
            A=DAT1  A                            * 3F0F7
            A=A-CON A,6                          * 3F0FA
            GOC     L_3F111                      * 3F100
            A=A-1   A                            * 3F103
            A=A-1   A                            * 3F105
            GOC     L_3F11E                      * 3F107
            A=A-1   A                            * 3F10A
            A=A-1   A                            * 3F10C
            GOC     L_3F14D                      * 3F10E
L_3F111:
            C=R0                                 * 3F111
            D1=C                                 * 3F114
            GOVLNG  PushFLoop                    * 3F117
L_3F11E:
            D1=D1+  5                            * 3F11E
            GOSUB   SUB_3F13E                    * 3F121
            GOC     L_3F111                      * 3F125
            LC(2)   #09                          * 3F128
L_3F12C:
            ?C<A    A                            * 3F12C
            GOYES   L_3F111                      * 3F12F
            C=R0                                 * 3F131
            D1=C                                 * 3F134
            GOVLNG  OverWrTLoop                  * 3F137

* refs (3): 3F121 3F150 3F16F
SUB_3F13E:
            A=0     A                            * 3F13E
            A=DAT1  B                            * 3F140
            C=0     A                            * 3F143
            LC(2)   #30                          * 3F145
            A=A-C   A                            * 3F149
            RTN                                  * 3F14B
L_3F14D:
            D1=D1+  5                            * 3F14D
            GOSUB   SUB_3F13E                    * 3F150
            GOC     L_3F111                      * 3F154
            LC(2)   #03                          * 3F157
            ?C<A    A                            * 3F15B
            GOYES   L_3F111                      * 3F15E
            ?C=A    A                            * 3F160
            GOYES   L_3F169                      * 3F163
            LC(2)   #09                          * 3F165
L_3F169:
            R1=C                                 * 3F169
            D1=D1+  2                            * 3F16C
            GOSUB   SUB_3F13E                    * 3F16F
            GOC     L_3F111                      * 3F173
            C=R1                                 * 3F176
            GONC    L_3F12C                      * 3F179
          ENDCODE                                * 3F17C
        ;                                        * 3F17C
        FILLTO  #3F1E3                           * 3F181  98 zero nibbles: the next entry stays at #3F1E3

* refs (1): 6AF23
OBJ_3F1E3:
        ::                                       * 3F1E3
          OBJ_26F50                              * 3F1E8
          {MenuRules}                            * 3F1ED
          SWAP                                   * 3F1F2
          ITE                                    * 3F1F7
          &COMP                                  * 3F1FC
          SWAPDROP                               * 3F201
          '                                      * 3F206
          NoExitAction                           * 3F20B
          2Ob>Seco                               * 3F210
        ;                                        * 3F215

* refs (2): 3F1ED 6AF1E
{MenuRules}:
        {                                        * 3F21A
          {RULES\DNEG}                           * 3F21F
          {RULES\DINV}                           * 3F224
          {RULES\*1}                             * 3F229
          {RULES\^1}                             * 3F22E
          {RULES\/1}                             * 3F233
          {RULES\+1-1}                           * 3F238
          {RULES\COLCT}                          * 3F23D
        }                                        * 3F242

* refs (7): 3AB8F 3ABA3 3ABB7 3BA95 3BAA9 3BABD ...
OBJ_3F247:
        ::                                       * 3F247
          TakeOver                               * 3F24C
          'R                                     * 3F251
          '                                      * 3F256
          'FontGauge                             * 3F25B
          FIRST@LAM                              * 3F260
          casedrop                               * 3F265
          OBJ_6CAA3                              * 3F26A
          NoEditLine?                            * 3F26F
          caseDrpBadKy                           * 3F274
          OBJ_3B478                              * 3F279
          CURSOR_END?                            * 3F27E
          caseDrpBadKy                           * 3F283
          NextChrInComLine                       * 3F288
          CHR>#                                  * 3F28D
          DUPUNROT                               * 3F292
          OBJ_3F2D3                              * 3F297
          DUPUNROT                               * 3F29C
          #=case                                 * 3F2A1
          DropBadKey                             * 3F2A6
          #>CHR                                  * 3F2AB
          INSERT?                                * 3F2B0
          REPLACE_MODE                           * 3F2B5
          SWAP                                   * 3F2BA
          EchoChrKey                             * 3F2BF
          IT                                     * 3F2C4
          INSERT_MODE                            * 3F2C9
        ;                                        * 3F2CE

* refs (2): 3F297 6CAF8
OBJ_3F2D3:
        CON(5)  (*)+5                            * 3F2D3  primitive code object
        ASSEMBLE
        GOSBVL  POP2#                            * 3F2D8
        A=A+A   B                                * 3F2DF
        R0=A.F  A                                * 3F2E2
        A=C     A                                * 3F2E8
        GOSBVL  SAVPTR                           * 3F2EA
        LC(14)  #4E59554F494541                  * 3F2F1
        B=A     A                                * 3F301
        LA(2)   #20                              * 3F303
        D1=(5)  L_3F384                          * 3F30A
        P=      6                                * 3F311
L_3F313:
        ?B=C    B                                * 3F313
        GOYES   L_3F35B                          * 3F316
        C=C+A   B                                * 3F318
        ?B=C    B                                * 3F31B
        GOYES   L_3F35B                          * 3F31E
        CSRC                                     * 3F320
        CSRC                                     * 3F323
        D1=D1+  12                               * 3F326
        P=P-1                                    * 3F329
        GONC    L_3F313                          * 3F32B
        P=      0                                * 3F32E
        LC(6)   #435044                          * 3F330
        P=      2                                * 3F338
L_3F33A:
        ?B=C    B                                * 3F33A
        GOYES   L_3F37E                          * 3F33D
        C=C+A   B                                * 3F33F
        ?B=C    B                                * 3F342
        GOYES   L_3F37E                          * 3F345
        CSRC                                     * 3F347
        CSRC                                     * 3F34A
        D1=D1+  2                                * 3F34D
        P=P-1                                    * 3F350
        GONC    L_3F33A                          * 3F352
        C=0     A                                * 3F355
        GOTO    L_3F36C                          * 3F357
L_3F35B:
        AD1EX                                    * 3F35B
        C=R0.F  A                                * 3F35E
        A=A+C   A                                * 3F364
        D1=A                                     * 3F366
L_3F369:
        C=DAT1  B                                * 3F369
L_3F36C:
        C=C+B   B                                * 3F36C
        R0=C.F  A                                * 3F36F
        P=      0                                * 3F375
        GOVLNG  PUSH#LOOP                        * 3F377
L_3F37E:
        C=0     A                                * 3F37E
        GOTO    L_3F369                          * 3F380
L_3F384:
        NIBHEX  F7081828384838485800681838485800 * 3F384  .∡ā∇√∫√∫Σ.▶ā√∫Σ.
        NIBHEX  68003848586878984858680078000048 * 3F3A4  ▶.√∫Σ▶π≤∫Σ▶.π..∫
        NIBHEX  00006800000000380000C8E848       * 3F3C4  ..▶....√..α←∫
        RPL

* refs (1): 3D43E
OBJ_3F3DE:
        ::                                       * 3F3DE
          CONTEXT@                               * 3F3E3
          DUP                                    * 3F3E8
          GetLibs(di)                            * 3F3ED
          BEGIN                                  * 3F3F2
          get1                                   * 3F3F7
          MYRAMROMPAIR                           * 3F3FC
          WHILE                                  * 3F401
          ::                                     * 3F406
            2DUPSWAP                             * 3F40B
            #3+                                  * 3F410
            UNROLL                               * 3F415
            GetLibs(di)                          * 3F41A
            top&                                 * 3F41F
          ;                                      * 3F424
          REPEAT                                 * 3F429
          OBJ_3F447                              * 3F42E
          RDROP                                  * 3F433
          OBJ_410E9                              * 3F438
          LoadTouchTbl                           * 3F43D
        ;                                        * 3F442

* refs (1): 3F42E
OBJ_3F447:
        ::                                       * 3F447
          DUP#0=                                 * 3F44C
          ?SEMI                                  * 3F451
          pshzer                                 * 3F456
          BEGIN                                  * 3F45B
          SWAPDROP#1-                            * 3F460
          #2-                                    * 3F465
          UNROTOVER                              * 3F46A
          NULL$                                  * 3F46F
          EQUAL                                  * 3F474
          ITE                                    * 3F479
          2DROP                                  * 3F47E
          ::                                     * 3F483
            TWO{}N                               * 3F488
            psh1&rev                             * 3F48D
          ;                                      * 3F492
          #0=UNTIL                               * 3F497
          DROP                                   * 3F49C
        ;                                        * 3F4A1

* refs (1): 3D42A
OBJ_3F4A6:
        ::                                       * 3F4A6
          '                                      * 3F4AB
          OBJ_3F4C4                              * 3F4B0
          2Ob>Seco                               * 3F4B5
          InitMenu                               * 3F4BA
        ;                                        * 3F4BF

* refs (3): 3F4B0 41660 416B5
OBJ_3F4C4:
        ::                                       * 3F4C4
          COERCEDUP                              * 3F4C9
          NumEntryLin(s)                         * 3F4CE
          DUP#0=                                 * 3F4D3
          case2drop                              * 3F4D8
          NULL{}                                 * 3F4DD
          '                                      * 3F4E2
          OBJ_3F589                              * 3F4E7
          BINT3                                  * 3F4EC
          ::N                                    * 3F4F1
        ;                                        * 3F4F6

* refs (1): 3F4CE
NumEntryLin(s):
        ::                                       * 3F4FB
          GETHASH                                * 3F500
          NOTcase                                * 3F505
          BINT0                                  * 3F50A
          NumEntryLin(b)                         * 3F50F
        ;                                        * 3F514

* refs (1): 3F50F
NumEntryLin(b):
        CON(5)  L_7175E                          * 3F519  code object: the address of its machine code
        ASSEMBLE
L_3F51E:
        D0=D0+  5                                * 3F51E
        A=DAT0  A                                * 3F521
        CD0EX                                    * 3F524
        C=C+A   A                                * 3F527
        D=C     A                                * 3F529
        LA(5)   #0005A                           * 3F52B
        A=A+B   A                                * 3F535
        D1=A                                     * 3F537
        A=DAT1  A                                * 3F53A
        CD1EX                                    * 3F53D
        C=C+A   A                                * 3F540
        D1=C                                     * 3F542
        D=D-C   A                                * 3F545
        C=D     A                                * 3F547
        GOSBVL  DIV5                             * 3F549
        B=C     A                                * 3F550
L_3F552:
        A=DAT1  A                                * 3F552
        ?A=0    A                                * 3F555
        GOYES   L_3F565                          * 3F558
        B=B-1   A                                * 3F55A
        GOC     L_3F567                          * 3F55C
        D1=D1+  5                                * 3F55F
        GONC    L_3F552                          * 3F562
L_3F565:
        C=C-B   A                                * 3F565
L_3F567:
        R0=C.F  A                                * 3F567
        C=R2.F  A                                * 3F56D
        ?C=0    A                                * 3F573
        GOYES   L_3F57E                          * 3F576
        P=      1                                * 3F578
        GOSUB   SUB_3F585                        * 3F57A
L_3F57E:
        GOVLNG  PUSH#LOOP                        * 3F57E

* refs (1): 3F57A
SUB_3F585:
        RSTK=C                                   * 3F585
        RTN                                      * 3F587
        RPL

* refs (1): 3F4E7
OBJ_3F589:
        ::                                       * 3F589
          2RDROP                                 * 3F58E
          CheckMenuRow                           * 3F593
          DUP                                    * 3F598
          #5+                                    * 3F59D
          ROT                                    * 3F5A2
          #MIN                                   * 3F5A7
          SWAP#1-                                * 3F5AC
          BINT0                                  * 3F5B1
          4UNROLL                                * 3F5B6
          BINT1                                  * 3F5BB
          3UNROLL                                * 3F5C0
          DO                                     * 3F5C5
          OVER                                   * 3F5CA
          INDEX@                                 * 3F5CF
          #>ROMPTR                               * 3F5D4
          psh1&rev                               * 3F5D9
          LOOP                                   * 3F5DE
          2DROP                                  * 3F5E3
          LoadTouchTbl                           * 3F5E8
        ;                                        * 3F5ED
        NIBHEX  00000                            * 3F5F2  ..

* refs (1): 3D457
OBJ_3F5F7:
        ::                                       * 3F5F7
          DUPTYPECSTR?                           * 3F5FC
          ITE                                    * 3F601
          MakeStdLabel                           * 3F606
          ::                                     * 3F60B
            #:>$                                 * 3F610
            _:__253B8                            * 3F615
            SWAP                                 * 3F61A
            &$                                   * 3F61F
            MakeDirLabel                         * 3F624
          ;                                      * 3F629
          Grob>Menu                              * 3F62E
        ;                                        * 3F633

* refs (1): 3D484
OBJ_3F638:
        ::                                       * 3F638
          BINT0                                  * 3F63D
          BINT1                                  * 3F642
          BINT34                                 * 3F647
          ONE_DO                                 * 3F64C
          OBJ_3F66F                              * 3F651
          LOOP                                   * 3F656
          RDROP                                  * 3F65B
          OBJ_410E9                              * 3F660
          LoadTouchTbl                           * 3F665
        ;                                        * 3F66A

* refs (1): 3F651
OBJ_3F66F:
        ::                                       * 3F66F
          INDEX@                                 * 3F674
          DUP                                    * 3F679
          PORTSTATUS                             * 3F67E
          2DROP                                  * 3F683
          case                                   * 3F688
          3DROP                                  * 3F68D
          DROP                                   * 3F692
          NOTcaseDROP                            * 3F697
          SWAP#1+                                * 3F69C
        ;                                        * 3F6A1

* refs (1): 3D470
OBJ_3F6A6:
        ::                                       * 3F6A6
          '                                      * 3F6AB
          SetRebuild                             * 3F6B0
          '                                      * 3F6B5
          '                                      * 3F6BA
          ROT                                    * 3F6BF
          '                                      * 3F6C4
          OBJ_3F6E7                              * 3F6C9
          2Ob>Seco                               * 3F6CE
          BINT3                                  * 3F6D3
          ::N                                    * 3F6D8
          InitMenu                               * 3F6DD
        ;                                        * 3F6E2

* refs (1): 3F6C9
OBJ_3F6E7:
        ::                                       * 3F6E7
          2RDROP                                 * 3F6EC
          GetBVars                               * 3F6F1
          OBJ_410E9                              * 3F6F6
          pvars(s,B)                             * 3F6FB
          LoadTouchTbl                           * 3F700
        ;                                        * 3F705

* refs (1): 3BF03
OBJ_3F70A:
        ::                                       * 3F70A
          RDROP                                  * 3F70F
          CONTEXT@                               * 3F714
          LastNonNull                            * 3F719
          NOTcase                                * 3F71E
          ::                                     * 3F723
            BINT1                                * 3F728
            MenuRow!                             * 3F72D
            BINT0                                * 3F732
            LoadTouchTbl                         * 3F737
          ;                                      * 3F73C
          OBJ_3F7B4                              * 3F741
          DUP                                    * 3F746
          RAM-WORDNAME                           * 3F74B
          BINT1                                  * 3F750
          ROT                                    * 3F755
          BINT6                                  * 3F75A
          ONE_DO                                 * 3F75F
          PrevNonNull                            * 3F764
          ITE                                    * 3F769
          ::                                     * 3F76E
            DUP                                  * 3F773
            RAM-WORDNAME                         * 3F778
            SWAPROT                              * 3F77D
            #1+SWAP                              * 3F782
          ;                                      * 3F787

* ob -> ob ob
DUPExitAtLOOP:
          ::                                     * 3F78C
            DUP                                  * 3F791
            ExitAtLOOP                           * 3F796
          ;                                      * 3F79B
          LOOP                                   * 3F7A0
          DROP                                   * 3F7A5
          LoadTouchTbl                           * 3F7AA
        ;                                        * 3F7AF

* refs (2): 3F741 3F827
OBJ_3F7B4:
        ::                                       * 3F7B4
          MenuRow@                               * 3F7B9
          DUP#1=                                 * 3F7BE
          caseDROP                               * 3F7C3
          BINT1                                  * 3F7C8
          3PICK                                  * 3F7CD
          ROT                                    * 3F7D2
          ONE_DO                                 * 3F7D7
          PrevNonNull                            * 3F7DC
          ITE                                    * 3F7E1
          SWAP#1+SWAP                            * 3F7E6

* ob -> ob ob
ExitAtLOOPDUP:
          ::                                     * 3F7EB
            ExitAtLOOP                           * 3F7F0
            DUP                                  * 3F7F5
          ;                                      * 3F7FA
          LOOP                                   * 3F7FF
          OVER                                   * 3F804
          MenuRow@                               * 3F809
          #=case                                 * 3F80E
          ROTROT2DROP                            * 3F813
          DROP                                   * 3F818
          CheckMenuRow                           * 3F81D
          2DROP                                  * 3F822
          OBJ_3F7B4                              * 3F827
        ;                                        * 3F82C

* refs (1): 3FCC8
RclKeyP1(s):
        ::                                       * 3F831
          OBJ_3F8FE                              * 3F836
          BINT1                                  * 3F83B
          over;=1(s);?:3+(s)                     * 3F840
          over;=2(s);?:1+(s)                     * 3F845
          over;=3(s);?:2+(s)                     * 3F84A
          OBJ_3F9DA                              * 3F84F
        ;                                        * 3F854

* refs (1): 3FCF5
RclKeyP2(s):
        ::                                       * 3F859
          OBJ_3F8FE                              * 3F85E
          BINT2                                  * 3F863
          over;=1(s);?:3+(s)                     * 3F868
          over;=3(s);?:1+(s)                     * 3F86D
          OBJ_3F9DA                              * 3F872
        ;                                        * 3F877

* refs (1): 3FD22
RclKeyP3(s):
        ::                                       * 3F87C
          OBJ_3F8FE                              * 3F881
          BINT3                                  * 3F886
          over;=1(s);?:3+(s)                     * 3F88B
          OBJ_3F99E                              * 3F890
          OBJ_3F9DA                              * 3F895
        ;                                        * 3F89A

* refs (1): 3FD4F
RclKeyP4(s):
        ::                                       * 3F89F
          OBJ_3F8FE                              * 3F8A4
          BINT4                                  * 3F8A9
          over;=2(s);?:1+(s)                     * 3F8AE
          over;=3(s);?:2+(s)                     * 3F8B3
          OBJ_3F9DA                              * 3F8B8
        ;                                        * 3F8BD

* refs (1): 3FD7C
RclKeyP5(s):
        ::                                       * 3F8C2
          OBJ_3F8FE                              * 3F8C7
          BINT5                                  * 3F8CC
          over;=3(s);?:1+(s)                     * 3F8D1
          OBJ_3F9DA                              * 3F8D6
        ;                                        * 3F8DB

* refs (1): 3FDA9
RclKeyP6(s):
        ::                                       * 3F8E0
          OBJ_3F8FE                              * 3F8E5
          BINT6                                  * 3F8EA
          OBJ_3F99E                              * 3F8EF
          OBJ_3F9DA                              * 3F8F4
        ;                                        * 3F8F9

* refs (6): 3F836 3F85E 3F881 3F8A4 3F8C7 3F8E5
OBJ_3F8FE:
        ::                                       * 3F8FE
          BINT64                                 * 3F903
          #/                                     * 3F908
          DUP                                    * 3F90D
          #0=?SEMI                               * 3F912
          DUP#1=                                 * 3F917
          casedrop                               * 3F91C
          BINT2                                  * 3F921
          DUP                                    * 3F926
          #2=                                    * 3F92B
          casedrop                               * 3F930
          BINT1                                  * 3F935
        ;                                        * 3F93A
        NIBHEX  E8E60                            * 3F93F  ←n

* refs (3): 3F840 3F868 3F88B
over;=1(s);?:3+(s):
        ::                                       * 3F944
          OVER                                   * 3F949
          #1=                                    * 3F94E
          IT                                     * 3F953
          #3+                                    * 3F958
        ;                                        * 3F95D

* refs (2): 3F845 3F8AE
over;=2(s);?:1+(s):
        ::                                       * 3F962
          OVER                                   * 3F967
          #2=                                    * 3F96C
          IT                                     * 3F971
          #1+                                    * 3F976
        ;                                        * 3F97B

* refs (2): 3F84A 3F8B3
over;=3(s);?:2+(s):
        ::                                       * 3F980
          OVER                                   * 3F985
          #3=                                    * 3F98A
          IT                                     * 3F98F
          #2+                                    * 3F994
        ;                                        * 3F999

* refs (2): 3F890 3F8EF
OBJ_3F99E:
        ::                                       * 3F99E
          OVER                                   * 3F9A3
          #2=                                    * 3F9A8
          IT                                     * 3F9AD
          #1-                                    * 3F9B2
        ;                                        * 3F9B7

* refs (2): 3F86D 3F8D1
over;=3(s);?:1+(s):
        ::                                       * 3F9BC
          OVER                                   * 3F9C1
          #3=                                    * 3F9C6
          IT                                     * 3F9CB
          #1+                                    * 3F9D0
        ;                                        * 3F9D5

* refs (6): 3F84F 3F872 3F895 3F8B8 3F8D6 3F8F4
OBJ_3F9DA:
        ::                                       * 3F9DA
          SWAPDROP                               * 3F9DF
          2DUP                                   * 3F9E4
          OBJ_3F9FD                              * 3F9E9
          3UNROLL                                * 3F9EE
          OBJ_3FC0F                              * 3F9F3
        ;                                        * 3F9F8

* refs (1): 3F9E9
OBJ_3F9FD:
        ::                                       * 3F9FD
          AppMode?                               * 3FA02
          NOTcase                                * 3FA07
          Key>U/SKeyOb                           * 3FA0C
          2DUP                                   * 3FA11
          AppKeys@                               * 3FA16
          EVAL                                   * 3FA1B
          case                                   * 3FA20
          ROTROT2DROP                            * 3FA25
          NAppKeyOK?                             * 3FA2A
          NOT                                    * 3FA2F
          case2drop                              * 3FA34
          'DoBadKey                              * 3FA39
          DoStdKeys?                             * 3FA3E
          case                                   * 3FA43
          Key>StdKeyOb                           * 3FA48
          Key>U/SKeyOb                           * 3FA4D
        ;                                        * 3FA52

* #kc #pl -> ob
* refs (15): 19F56 1A066 3FA0C 3FA4D A2C6F A3C63 ...
Key>U/SKeyOb:
        ::                                       * 3FA57
          2DUP                                   * 3FA5C
          ?Key>UKeyOb                            * 3FA61
          case                                   * 3FA66
          ROTROT2DROP                            * 3FA6B
          Key>StdKeyOb                           * 3FA70
        ;                                        * 3FA75

* refs (2): 3FA61 3FC82
?Key>UKeyOb:
        ::                                       * 3FA7A
          UserKeys?                              * 3FA7F
          NOT                                    * 3FA84
          case2drpfls                            * 3FA89
          2DUP                                   * 3FA8E
          GetUserKeys                            * 3FA93
          OBJ_3FBC9                              * 3FA98
          case                                   * 3FA9D
          OBJ_3FAC5                              * 3FAA2
          NonUsrKeyOK?                           * 3FAA7
          case2drpfls                            * 3FAAC
          ModifierKey?                           * 3FAB1
          caseFALSE                              * 3FAB6
          'DoBadKeyT                             * 3FABB
        ;                                        * 3FAC0

* refs (1): 3FAA2
OBJ_3FAC5:
        ::                                       * 3FAC5
          DUP'                                   * 3FACA

* ID SKEY
ID_SKEY:
          ID      SKEY                           * 3FACF
          EQUAL                                  * 3FADE
          OVER'                                  * 3FAE3

* LAM SKEY
LAM_SKEY:
          LAM     SKEY                           * 3FAE8
          EQUALOR                                * 3FAF7
          NOTcase                                * 3FAFC
          XYZ>ZTRUE                              * 3FB01
          DROP                                   * 3FB06
          Key>StdKeyOb                           * 3FB0B
          TRUE                                   * 3FB10
        ;                                        * 3FB15

* #kc #pl -> ob
* refs (5): 19F98 3FA48 3FA70 3FB0B CFC4F
Key>StdKeyOb:
        ::                                       * 3FB1A
          OBJ_3A94E                              * 3FB1F
          ROMPTR@                                * 3FB24
          ?SEMI                                  * 3FB29
          'DoBadKey                              * 3FB2E
        ;                                        * 3FB33
        FILLTO  #3FB5A                           * 3FB38  34 zero nibbles: the next entry stays at #3FB5A

* refs (1): 3C35C
OBJ_3FB5A:
        ::                                       * 3FB5A
          SolvMenuInit                           * 3FB5F
          '                                      * 3FB64
          OBJ_3FB78                              * 3FB69
          ReviewKey!                             * 3FB6E
        ;                                        * 3FB73

* refs (1): 3FB69
OBJ_3FB78:
        ::                                       * 3FB78
          ROMPTR  0E6 00A                        * 3FB7D
          OBJ_7D966                              * 3FB88
          INNERCOMP                              * 3FB8D
          #1+                                    * 3FB92
          ONE_DO                                 * 3FB97
          ONESWAP                                * 3FB9C
          OBJ_41495                              * 3FBA1
          BINT8                                  * 3FBA6
          INDEX@#-                               * 3FBAB
          DISPN                                  * 3FBB0
          LOOP                                   * 3FBB5
          SetDA12Temp                            * 3FBBA
          SetDA3NoCh                             * 3FBBF
        ;                                        * 3FBC4

* refs (1): 3FA98
OBJ_3FBC9:
        ::                                       * 3FBC9
          DUPNULL{}?                             * 3FBCE
          casedrop                               * 3FBD3
          2DROPFALSE                             * 3FBD8
          ROT                                    * 3FBDD
          NTHCOMPDROP                            * 3FBE2
          DUPNULL{}?                             * 3FBE7
          case2drpfls                            * 3FBEC
          SWAP                                   * 3FBF1
          NTHCOMPDROP                            * 3FBF6
          DUPNULL{}?                             * 3FBFB
          casedrpfls                             * 3FC00
          TRUE                                   * 3FC05
        ;                                        * 3FC0A

* refs (1): 3F9F3
OBJ_3FC0F:
        ::                                       * 3FC0F
          Lock?                                  * 3FC14
          ITE                                    * 3FC19
          àShiftOnly                             * 3FC1E
          SetKeysNS                              * 3FC23
          1USR?                                  * 3FC28
          NOTcase2DROP                           * 3FC2D
          2DUP                                   * 3FC32
          ModifierKey?                           * 3FC37
          case                                   * 3FC3C
          OBJ_3FC7D                              * 3FC41
          OVER                                   * 3FC46
          BINT30                                 * 3FC4B
          #=                                     * 3FC50
          OVER                                   * 3FC55
          BINT2                                  * 3FC5A
          #=                                     * 3FC5F
          ANDcase                                * 3FC64
          OBJ_3FC7D                              * 3FC69
          2DROP                                  * 3FC6E
          OBJ_3FC9B                              * 3FC73
        ;                                        * 3FC78

* refs (2): 3FC41 3FC69
OBJ_3FC7D:
        ::                                       * 3FC7D
          ?Key>UKeyOb                            * 3FC82
          NOT?SEMI                               * 3FC87
          DROP                                   * 3FC8C
          OBJ_3FC9B                              * 3FC91
        ;                                        * 3FC96

* refs (2): 3FC73 3FC91
OBJ_3FC9B:
        ::                                       * 3FC9B
          QuitUserMo                             * 3FCA0
          SetDA1Bad                              * 3FCA5
        ;                                        * 3FCAA

* ob ->
* refs (5): 3DA0D 3FC23 3FEF3 40D43 CF6C9
SetKeysNS:
        ::                                       * 3FCAF
          ClrAlphaAnn                            * 3FCB4
          ClrLeftAnn                             * 3FCB9
          ClrRightAnn                            * 3FCBE
          '                                      * 3FCC3
          RclKeyP1(s)                            * 3FCC8
          BINT7                                  * 3FCCD
          OBJ_04A57                              * 3FCD2
        ;                                        * 3FCD7

* refs (1): 3B75F
RShiftOnly:
        ::                                       * 3FCDC
          ClrAlphaAnn                            * 3FCE1
          SetLeftAnn                             * 3FCE6
          ClrRightAnn                            * 3FCEB
          '                                      * 3FCF0
          RclKeyP2(s)                            * 3FCF5
          BINT7                                  * 3FCFA
          OBJ_04A57                              * 3FCFF
        ;                                        * 3FD04

* refs (2): 3B798 3DA9C
LShiftOnly:
        ::                                       * 3FD09
          ClrAlphaAnn                            * 3FD0E
          ClrLeftAnn                             * 3FD13
          SetRightAnn                            * 3FD18
          '                                      * 3FD1D
          RclKeyP3(s)                            * 3FD22
          BINT7                                  * 3FD27
          OBJ_04A57                              * 3FD2C
        ;                                        * 3FD31

* refs (4): 3AA2D 3BAE1 3FC1E 40D2F
àShiftOnly:
        ::                                       * 3FD36
          SetAlphaAnn                            * 3FD3B
          ClrLeftAnn                             * 3FD40
          ClrRightAnn                            * 3FD45
          '                                      * 3FD4A
          RclKeyP4(s)                            * 3FD4F
          BINT7                                  * 3FD54
          OBJ_04A57                              * 3FD59
        ;                                        * 3FD5E

* refs (1): 3AFF0
àLShiftOnly:
        ::                                       * 3FD63
          SetAlphaAnn                            * 3FD68
          SetLeftAnn                             * 3FD6D
          ClrRightAnn                            * 3FD72
          '                                      * 3FD77
          RclKeyP5(s)                            * 3FD7C
          BINT7                                  * 3FD81
          OBJ_04A57                              * 3FD86
        ;                                        * 3FD8B

* refs (1): 3B025
àRShiftOnly:
        ::                                       * 3FD90
          SetAlphaAnn                            * 3FD95
          SetRightAnn                            * 3FD9A
          ClrLeftAnn                             * 3FD9F
          '                                      * 3FDA4
          RclKeyP6(s)                            * 3FDA9
          BINT7                                  * 3FDAE
          OBJ_04A57                              * 3FDB3
        ;                                        * 3FDB8

* ob ob' ->
* refs (1): 4035F
2DropBadKey:
        ::                                       * 3FDBD
          DROP                                   * 3FDC2

* ob ->
* refs (6): 3F01D 3F2A6 4007B 400A8 63BE1 8F9B6
DropBadKey:
          ::                                     * 3FDC7
            DROP                                 * 3FDCC

* ->
* refs (149): 0C7B7 144C0 144ED 14515 18038 19E53 ...
DoBadKey:
            ::                                   * 3FDD1
              TakeOver                           * 3FDD6
              BINT70                             * 3FDDB
              INTEGER337                         * 3FDE0
              setbeep                            * 3FDE5
              SetDA123NoCh                       * 3FDEA
            ;                                    * 3FDEF
          ;                                      * 3FDF4
        ;                                        * 3FDF9

* -> DoBadKey
* refs (5): 3FA39 3FB2E 3FE17 411FC CFC8D
'DoBadKey:
        ::                                       * 3FDFE
          '                                      * 3FE03
          DoBadKey                               * 3FE08
        ;                                        * 3FE0D

* -> DoBadKey T
* refs (44): 1A07A 1A0AE 3FABB 43879 4390F 43978 ...
'DoBadKeyT:
        ::                                       * 3FE12
          'DoBadKey                              * 3FE17
          TRUE                                   * 3FE1C
        ;                                        * 3FE21

* refs (1): 42055
H/WKey>KeyOb:
        ::                                       * 3FE26
          H/W>KeyCode                            * 3FE2B
          BINT7                                  * 3FE30
          GETPROC                                * 3FE35
          OBJ_4B927                              * 3FE3A
        ;                                        * 3FE3F

* # -> #'
* refs (2): 1A88C 3FE2B
H/W>KeyCode:
        ::                                       * 3FE44
          BINT128                                * 3FE49
          #=casedrop                             * 3FE4E
          BINT30                                 * 3FE53
          BINT64                                 * 3FE58
          #=casedrop                             * 3FE5D
          BINT35                                 * 3FE62
          BINTC0h                                * 3FE67
          #=casedrop                             * 3FE6C
          BINT40                                 * 3FE71
        ;                                        * 3FE76

* #kc #pl -> flag
* refs (3): 3FAB1 3FC37 41FF1
ModifierKey?:
        ::                                       * 3FE7B
          OVER                                   * 3FE80
          BINT35                                 * 3FE85
          #=                                     * 3FE8A
          case2drop                              * 3FE8F
          TRUE                                   * 3FE94
          OVER                                   * 3FE99
          BINT40                                 * 3FE9E
          #=                                     * 3FEA3
          case2drop                              * 3FEA8
          TRUE                                   * 3FEAD
          SWAP                                   * 3FEB2
          BINT30                                 * 3FEB7
          #<>                                    * 3FEBC
          casedrpfls                             * 3FEC1
          DUP                                    * 3FEC6
          BINT1                                  * 3FECB
          #=                                     * 3FED0
          SWAP                                   * 3FED5
          BINT4                                  * 3FEDA
          #=                                     * 3FEDF
          OR                                     * 3FEE4
        ;                                        * 3FEE9

* refs (2): 385F7 3887C
OBJ_3FEEE:
        ::                                       * 3FEEE
          SetKeysNS                              * 3FEF3
          OBJ_3FFCA                              * 3FEF8
          KeyOb0                                 * 3FEFD
          OBJ_424C7                              * 3FF02
        ;                                        * 3FF07

        CON(5)  NOP                              * 3FF0C  address (the code jumps or points through it)

        CON(5)  NOP                              * 3FF11  address (the code jumps or points through it)

        CON(5)  NOP                              * 3FF16  address (the code jumps or points through it)

* # #' -> :: ' ob1 T ; -> :: <ob2> <rest> ;
* refs (84): 43156 43165 43897 438A6 438B5 438C4 ...
?CaseKeyDef:
        ::                                       * 3FF1B
          OVER                                   * 3FF20
          #<>case                                * 3FF25
          SKIP                                   * 3FF2A
          DROP                                   * 3FF2F
          'R                                     * 3FF34
          TRUE                                   * 3FF39
          RDROP                                  * 3FF3E
        ;                                        * 3FF43

* # #' -> ob T -> F -> :: <ob2> <rest> ;
* refs (40): 9CE7F 9CE94 9CEB3 9CEC8 9CF41 9CF56 ...
?CaseRomptr@:
        ::                                       * 3FF48
          OVER                                   * 3FF4D
          #<>case                                * 3FF52
          SKIP                                   * 3FF57
          DROP                                   * 3FF5C
          'R                                     * 3FF61
          ROMPTR@                                * 3FF66
          RDROP                                  * 3FF6B
        ;                                        * 3FF70

* -> flag
* refs (2): 22595 3FAA7
NonUsrKeyOK?:
        CON(5)  (*)+5                            * 3FF75  primitive code object
        ASSEMBLE
        LC(3)   #40A                             * 3FF7A
        GOVLNG  L_539E6                          * 3FF7F

* ->
* refs (2): 41BAF 41F22
SetNUsrKeyOK:
        CON(5)  (*)+5                            * 3FF86  primitive code object
        LC(3)   #40A                             * 3FF8B
        GOVLNG  SetISysFlag                      * 3FF90

* ->
* refs (1): 41BC3
ClrNUsrKeyOK:
        CON(5)  (*)+5                            * 3FF97  primitive code object
        LC(3)   #40A                             * 3FF9C
        GOVLNG  L_539F1                          * 3FFA1

* refs (3): 397CF 3D96F 3FC28
1USR?:
        CON(5)  (*)+5                            * 3FFA8  primitive code object
        LC(3)   #106                             * 3FFAD
        GOVLNG  L_539E6                          * 3FFB2

* refs (1): 40D70
OBJ_3FFB9:
        CON(5)  (*)+5                            * 3FFB9  primitive code object
        LC(3)   #106                             * 3FFBE
        GOVLNG  SetISysFlag                      * 3FFC3

* refs (3): 3D979 3FEF8 40D89
OBJ_3FFCA:
        CON(5)  (*)+5                            * 3FFCA  primitive code object
        LC(3)   #106                             * 3FFCF
        GOVLNG  L_539F1                          * 3FFD4
        FILLTO  #40002                           * 3FFDB  39 zero nibbles: the next entry stays at #40002
