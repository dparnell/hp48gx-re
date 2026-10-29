* HP 48GX ROM revision R, #2A002-#2BFFF: Real number arithmetic
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: %0_2A2B4 %1 %%* %2 %%/ %%+ %* %%ABS %>%% %%0 %/ %%>%
* Follows on from the previous file (at #2A002 in the original ROM).

* ( %pop1 %pop2 -> A,C ) Pop 2 reals, <REF>SAVPTR
* refs (6): 0CC3E 0CC7E 29FF8 52C96 52E38 52F8A
POP2%:
        CD0EX                                    * 2A002
        D0=(5)  INTRPPTR                         * 2A005
        DAT0=C  A                                * 2A00C
        D0=(5)  RSKTOP                           * 2A00F
        C=B     A                                * 2A016
        DAT0=C  A                                * 2A018
        D0=(5)  AVMEM                            * 2A01B
        D=D+1   A                                * 2A022
        D=D+1   A                                * 2A024
        C=D     A                                * 2A026
        DAT0=C  A                                * 2A028
        A=DAT1  A                                * 2A02B
        AD1EX                                    * 2A02E
        D1=D1+  5                                * 2A031
        C=DAT1  W                                * 2A034
        D1=A                                     * 2A038
        D1=D1+  5                                * 2A03B
        D=C     A                                * 2A03E
        C=DAT1  A                                * 2A040
        D1=D1+  5                                * 2A043
        CD1EX                                    * 2A046
        D1=D1+  5                                * 2A049
        A=DAT1  W                                * 2A04C
        D0=(5)  DSKTOP                           * 2A050
        DAT0=C  A                                * 2A057
        C=D     A                                * 2A05A
        SETDEC                                   * 2A05C
        RTNCC                                    * 2A05E

* refs (11): 10E13 2AEB0 34CB6 356D8 35BFA 372A3 ...
* Pop an extended real (saving the RPL pointers): A.W = sign, mantissa, exponent; B.W = mantissa without sign; decimal mode
POP1%%:
        CD0EX                                    * 2A060
        D0=(5)  INTRPPTR                         * 2A063
        DAT0=C  A                                * 2A06A
        D0=(5)  RSKTOP                           * 2A06D
        C=B     A                                * 2A074
        DAT0=C  A                                * 2A076
        D0=(5)  AVMEM                            * 2A079
        D=D+1   A                                * 2A080
        C=D     A                                * 2A082
        DAT0=C  A                                * 2A084
        C=DAT1  A                                * 2A087
        D1=D1+  5                                * 2A08A
        CD1EX                                    * 2A08D
        D0=(5)  DSKTOP                           * 2A090
        DAT0=C  A                                * 2A097
        D1=D1+  10                               * 2A09A
        A=DAT1  W                                * 2A09D
        B=A     W                                * 2A0A1
        B=0     S                                * 2A0A4
        D1=D1-  5                                * 2A0A7
        A=DAT1  A                                * 2A0AA
        SETDEC                                   * 2A0AD
        RTNCC                                    * 2A0AF

* refs (10): 2AEB7 34CC7 37228 3724C 37283 372C1 ...
SUB_2A0B1:
        CD0EX                                    * 2A0B1
        D0=(5)  INTRPPTR                         * 2A0B4
        DAT0=C  A                                * 2A0BB
        D0=(5)  RSKTOP                           * 2A0BE
        C=B     A                                * 2A0C5
        DAT0=C  A                                * 2A0C7
        D0=(5)  AVMEM                            * 2A0CA
        D=D+1   A                                * 2A0D1
        D=D+1   A                                * 2A0D3
        C=D     A                                * 2A0D5
        DAT0=C  A                                * 2A0D7
        A=DAT1  A                                * 2A0DA
        AD1EX                                    * 2A0DD
        D1=D1+  10                               * 2A0E0
        C=DAT1  W                                * 2A0E3
        D=C     W                                * 2A0E7
        D1=D1-  5                                * 2A0EA
        C=DAT1  A                                * 2A0ED
        RSTK=C                                   * 2A0F0
        D1=A                                     * 2A0F2
        D1=D1+  5                                * 2A0F5
        C=DAT1  A                                * 2A0F8
        D1=D1+  5                                * 2A0FB
        CD1EX                                    * 2A0FE
        D1=D1+  10                               * 2A101
        A=DAT1  W                                * 2A104
        B=A     W                                * 2A108
        B=0     S                                * 2A10B
        D1=D1-  5                                * 2A10E
        A=DAT1  A                                * 2A111
        D0=(5)  DSKTOP                           * 2A114
        DAT0=C  A                                * 2A11B
        C=RSTK                                   * 2A11E
        C=0     S                                * 2A120
        DCEX    S                                * 2A123
        SETDEC                                   * 2A126
        RTNCC                                    * 2A128
L_2A12A:
        ?XM=0                                    * 2A12A
        RTNYES                                   * 2A12D
        ?P=     3                                * 2A12F
        GOYES   L_2A141                          * 2A132
        P=      0                                * 2A134
        LC(5)   #00304                           * 2A136
L_2A13D:
        GOTO    L_29EB7                          * 2A13D
L_2A141:
        D0=(5)  #80848                           * 2A141
        A=DAT0  B                                * 2A148
        P=      0                                * 2A14B
        ?ABIT=1 1                                * 2A14D
        GOYES   L_2A15E                          * 2A152
        LC(5)   infreserr                        * 2A154
        GONC    L_2A13D                          * 2A15B
L_2A15E:
        D0=(5)  #80849                           * 2A15E
        A=DAT0  B                                * 2A165
        ABIT=1  1                                * 2A168
        DAT0=A  B                                * 2A16D
        LC(5)   #00499                           * 2A170
        A=C     A                                * 2A177
        B=0     W                                * 2A179
        B=-B-1  M                                * 2A17C
        RTN                                      * 2A17F

* refs (2): 2A1E9 2A223
GETPTR~jump_5:
        GOVLNG  GETPTR                           * 2A181

* ( A -> %push ) Push A as %, <REF>GETPTR
* refs (11): 18E07 2331A 267F7 2A23D 34468 34611 ...
PUSH%:
        ST=0    10                               * 2A188
        SETHEX                                   * 2A18B
        ?A#0    M                                * 2A18D
        GOYES   L_2A195                          * 2A190
        A=0     W                                * 2A192
L_2A195:
        R0=A                                     * 2A195
L_2A198:
        A=R0                                     * 2A198
        P=      13                               * 2A19B
        ?A=0    WP                               * 2A19D
        GOYES   L_2A1F7                          * 2A1A0
        P=      0                                * 2A1A2
        GOSBVL  ROOM                             * 2A1A4
        A=C     A                                * 2A1AB
        LC(5)   #00020                           * 2A1AD
        ?C<=A   A                                * 2A1B4
        GOYES   L_2A1C4                          * 2A1B7
L_2A1B9:
        GOSBVL  St10Gb                           * 2A1B9
        GOTO    L_2A198                          * 2A1C0
L_2A1C4:
        LC(2)   #15                              * 2A1C4
        GOSBVL  CREATETEMP                       * 2A1C8
        AD0EX                                    * 2A1CF
        D0=A                                     * 2A1D2
        LC(5)   DOREAL                           * 2A1D5
L_2A1DC:
        DAT0=C  A                                * 2A1DC
        D0=D0+  5                                * 2A1DF
        C=R0                                     * 2A1E2
        DAT0=C  W                                * 2A1E5
        GOSUB   GETPTR~jump_5                    * 2A1E9
        D=D-1   A                                * 2A1ED
L_2A1EF:
        D1=D1-  5                                * 2A1EF
        DAT1=A  A                                * 2A1F2
        RTN                                      * 2A1F5
L_2A1F7:
        C=A     W                                * 2A1F7
        P=C     14                               * 2A1FA
        C=P     0                                * 2A1FE
        ?A=0    S                                * 2A202
        GOYES   L_2A20C                          * 2A205
        P=      8                                * 2A207
        C+P+1                                    * 2A209
L_2A20C:
        A=C     A                                * 2A20C
        A=A+A   A                                * 2A20E
        A=A+A   A                                * 2A210
        A=A+C   A                                * 2A212
        CSL     A                                * 2A214
        A=A+C   A                                * 2A216
        P=      0                                * 2A218
        LC(5)   %0_2A2B4                         * 2A21A
        A=A+C   A                                * 2A221
        GOSUB   GETPTR~jump_5                    * 2A223
        D=D-1   A                                * 2A227
        GONC    L_2A1EF                          * 2A229
        D=D+1   A                                * 2A22C
        GOSUB   SAVPTR~jump_11                   * 2A22E
        GONC    L_2A1B9                          * 2A232
L_2A235:
        GOSUB   SUB_2A24B                        * 2A235
        GOTO    L_2A241                          * 2A239

* ( A -> %push ) Push A as %, <REF>GETPTRLOOP
* refs (14): 0CC32 14192 2AEEF 2C122 2CD9E 37240 ...
PUSH%LOOP:
        GOSUB   PUSH%                            * 2A23D
L_2A241:
        A=DAT0  A                                * 2A241
        D0=D0+  5                                * 2A244
        PC=(A)                                   * 2A247

* refs (5): 0C2A1 0C4B3 2A235 3785E 37915
SUB_2A24B:
        SETHEX                                   * 2A24B
        P=      0                                * 2A24D
        ST=0    10                               * 2A24F
        ?B#0    M                                * 2A252
        GOYES   L_2A25E                          * 2A255
        GOVLNG  L_536D6                          * 2A257
L_2A25E:
        R1=A                                     * 2A25E
        B=A     S                                * 2A261
        A=B     W                                * 2A264
        R0=A                                     * 2A267
L_2A26A:
        GOSBVL  ROOM                             * 2A26A
        A=C     A                                * 2A271
        LC(5)   #00025                           * 2A273
        ?C<=A   A                                * 2A27A
        GOYES   L_2A28A                          * 2A27D
        GOSBVL  St10Gb                           * 2A27F
        GOTO    L_2A26A                          * 2A286
L_2A28A:
        LC(2)   #1A                              * 2A28A
        GOSBVL  CREATETEMP                       * 2A28E
        AD0EX                                    * 2A295
        D0=A                                     * 2A298
        LC(5)   DOEREL                           * 2A29B
        DAT0=C  A                                * 2A2A2
        D0=D0+  5                                * 2A2A5
        C=R1                                     * 2A2A8
        GOTO    L_2A1DC                          * 2A2AB
        BSS     5                                * 2A2AF  zeros
        RPL

* refs (360): 0EAE1 0EBC6 0FDD6 10A0E 1427B 142D3 ...
%0_2A2B4:
        % 0E0                                    * 2A2B4

* 1
* refs (241): 0F07A 0F35D 0F95E 0FA30 0FA5D 0FA89 ...
%1:
        % 1E0                                    * 2A2C9

* 2
* refs (145): 1A251 1A2A6 1CBB3 1DD6F 1DEAC 20FC3 ...
%2:
        % 2E0                                    * 2A2DE

* 3
* refs (52): 1CDC5 1DD7E 1DF21 223D8 22414 22455 ...
%3:
        % 3E0                                    * 2A2F3

* 4
* refs (30): 1CDCA 22419 2EBCB 2ED88 47C95 47C9A ...
%4:
        % 4E0                                    * 2A308

* 5
* refs (10): 1CBC7 2EBA3 2ECDE B75D3 B7614 B783A ...
%5:
        % 5E0                                    * 2A31D

* 6
* refs (8): 1CBD1 B75D8 B7619 B7853 B9257 CCDDC ...
%6:
        % 6E0                                    * 2A332

* 7
* refs (5): 1CBDB B75DD B761E B786C B925C
%7:
        % 7E0                                    * 2A347

* 8
* refs (8): 1CDE3 AAB8B B6861 B75E2 B7623 B7885 ...
%8:
        % 8E0                                    * 2A35C

* 9
* refs (8): 1CBEF AE3CC AE409 B75E7 B7628 B789E ...
%9:
        % 9E0                                    * 2A371

* -1
* refs (30): 1CE69 494A5 4A987 4C238 5140E 55558 ...
%-1:
        % -1E0                                   * 2A386

* -2
* refs (8): 82D90 D31B4 D34DF D34F4 D35E7 D35FC ...
%-2:
        % -2E0                                   * 2A39B

* -3
* refs (2): AB2CB B6852
%-3:
        % -3E0                                   * 2A3B0

* -4
%-4:
        % -4E0                                   * 2A3C5

* -5
%-5:
        % -5E0                                   * 2A3DA

* -6
%-6:
        % -6E0                                   * 2A3EF

* -7
%-7:
        % -7E0                                   * 2A404

* -8
* refs (1): D3702
%-8:
        % -8E0                                   * 2A419

* -9
%-9:
        % -9E0                                   * 2A42E

* pi
* refs (5): 3C0C6 54D3F 5A6C6 A1E46 D3724
%PI:
        % 3.14159265359E0                        * 2A443

* pi
* refs (2): 48058 52A9E
%%PI:
        %% 3.14159265358979E0                    * 2A458

* 9.99E499
* refs (8): 3C0DA 494FB 51AD0 5251C 54D1C 89D6C ...
%MAXREAL:
        % 9.99999999999E499                      * 2A472

* -9.99E499
* refs (3): 2B194 51AD5 51FEA
%-MAXREAL:
        % -9.99999999999E499                     * 2A487

* 1E-499
* refs (3): 3C0D0 47B91 54CE5
%MINREAL:
        % 1E-499                                 * 2A49C

* -1E-499
%-MINREAL:
        % -1E-499                                * 2A4B1

* 0
* refs (82): 0F53D 0FC9B 2C981 2C9A9 2C9CC 3671E ...
%%0:
        %% 0E0                                   * 2A4C6

* 1
* refs (57): 0FE5D 2C1D8 37A63 37A95 37AD1 4B819 ...
%%1:
        %% 1E0                                   * 2A4E0

* 2
* refs (13): 4805D 52134 5226F 52773 5295D 52971 ...
%%2:
        %% 2E0                                   * 2A4FA

* 3
* refs (1): C994D
%%3:
        %% 3E0                                   * 2A514

* 4
* refs (4): 52719 527BE 964C5 C993E
%%4:
        %% 4E0                                   * 2A52E

* 5
* refs (2): C904B C90F7
%%5:
        %% 5E0                                   * 2A548

* 0.1
* refs (1): C9153
%%.1:
        %% 1E-1                                  * 2A562

* 0.5
* refs (5): 2B43E 37B35 92E44 C8544 C8C3F
%%.5:
        %% 5E-1                                  * 2A57C

* 10
* refs (5): 4AE00 4AE28 4AE7D 4AE91 9363D
%%10:
        %% 1E1                                   * 2A596

* %% -> %
* refs (77): 0F3CB 0F642 0F6B1 0F783 0FC5F 0FDC7 ...
%%>%:
        CON(5)  (*)+5                            * 2A5B0  primitive code object
        ASSEMBLE
        GOSUBL  POP1%%~jump                      * 2A5B5
        GOLONG  L_2AEDB                          * 2A5BB

* % -> %%
* refs (86): 0FE58 0FF2F 0FFB1 10C5E 10CCC 1DDCE ...
%>%%:
        CON(5)  (*)+5                            * 2A5C1  primitive code object
        GOSUBL  POP1%SPLITA~jump                 * 2A5C6
        GOLONG  L_2AED0                          * 2A5CC
        RPL

* ->
* refs (3): 1C3A3 B9127 B92C3
SETDEG:
        :: BINT18 ClrSysFlag BINT17 ClrSysFlag ; * 2A5D2

* ->
* refs (3): 1C3BE B9131 B92E6
SETRAD:
        :: BINT17 SetSysFlag ;                   * 2A5F0

* ->
* refs (3): 1C3D9 B913B B9309
SETGRAD:
        :: BINT18 SetSysFlag BINT17 ClrSysFlag ; * 2A604

* %deg -> %rad
* refs (1): 1BED7
%D>R:
        :: %>%%                                  * 2A622

* pi/180
* refs (1): 2A65F
PI/180:
          %% 1.74532925199433E-2 %%* %%>% ;      * 2A62C

* %rad -> %deg
* refs (1): 1BF03
%R>D:
        :: %>%% PI/180 %%/ %%>% ;                * 2A655

* % -> %hms
* refs (1): 1BF2D
%>HMS:
        :: %>%% %%H>HMS %%>% ;                   * 2A673

* %hms -> %
* refs (1): 1BF4D
%HMS>:
        :: hm->(r);r=>rr %HMS>~1 ;               * 2A68C

* %hms1 %hms2 -> %hms
* refs (2): 1BF6D 2A6D2
%HMS+:
        :: hm->(r);r=>rr SWAP hm->(r);r=>rr %%+ %HMS+~1 %%>% ; * 2A6A0

* %hms1 %hms2 -> %hms
* refs (1): 1BF8D
%HMS-:
        :: %CHS %HMS+ ;                          * 2A6C8

* %% %%' -> %%max
* refs (15): 369CB 7CE5A 9005B 90D5F 9221D 94078 ...
%%MAX:
        :: 2DUP %%> NOT?SWAPDROP ;               * 2A6DC

* % %' -> %greater
* refs (6): 1BC80 4C069 52C87 89DA6 B61BD C7C57
%MAX:
        :: 2DUP %> NOT?SWAPDROP ;                * 2A6F5

* % %' -> %lesser
* refs (5): 1BCF2 52C6D 89DB5 B61A4 C7C43
%MIN:
        :: 2DUP %< NOT?SWAPDROP ;                * 2A70E

* %% -> flag
* refs (5): 2A7E8 2CBED 36BF3 36C0C 529FD
%%0<:
        CON(5)  (*)+5                            * 2A727  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 2A72C
        CD1EX                                    * 2A72F
        D1=D1+  10                               * 2A732
        GONC    L_2A746                          * 2A735  always taken

* % -> flag
* refs (26): 0F8D2 0F9E5 1B3FF 1B99F 1BA16 2A7FC ...
%0<:
        CON(5)  (*)+5                            * 2A738  primitive code object
        C=DAT1  A                                * 2A73D
        CD1EX                                    * 2A740
        D1=D1+  5                                * 2A743
L_2A746:
        A=DAT1  W                                * 2A746
        D1=C                                     * 2A74A
        ?A#0    S                                * 2A74D
        GOYES   L_2A756                          * 2A750
L_2A752:
        GOTO    L_2A843                          * 2A752
L_2A756:
        GOTO    L_2A85D                          * 2A756

* %% -> flag
* refs (37): 0F411 2A7C0 2C8C8 2CA6C 33972 37AF9 ...
%%0=:
        CON(5)  (*)+5                            * 2A75A  primitive code object
        C=DAT1  A                                * 2A75F
        CD1EX                                    * 2A762
        D1=D1+  10                               * 2A765
        GONC    L_2A779                          * 2A768  always taken

* % -> flag
* refs (23): 0F9B8 1A4AD 1A4FA 1E8DE 2A7D4 2B1B2 ...
%0=:
        CON(5)  (*)+5                            * 2A76B  primitive code object
        C=DAT1  A                                * 2A770
        CD1EX                                    * 2A773
        D1=D1+  5                                * 2A776
L_2A779:
        A=DAT1  W                                * 2A779
        D1=C                                     * 2A77D
        ?A=0    W                                * 2A780
        GOYES   L_2A756                          * 2A783
        GONC    L_2A752                          * 2A785

* %% -> flag
* refs (10): 2A810 2CBCF 90CAB 94E0F 950D1 C9321 ...
%%0>:
        CON(5)  (*)+5                            * 2A788  primitive code object
        C=DAT1  A                                * 2A78D
        CD1EX                                    * 2A790
        D1=D1+  10                               * 2A793
        GONC    L_2A7A7                          * 2A796  always taken

* % -> flag
* refs (22): 1A742 1C2C4 2EBBC 34100 48F2C 4AE46 ...
%0>:
        CON(5)  (*)+5                            * 2A799  primitive code object
        C=DAT1  A                                * 2A79E
        CD1EX                                    * 2A7A1
        D1=D1+  5                                * 2A7A4
L_2A7A7:
        A=DAT1  W                                * 2A7A7
        D1=C                                     * 2A7AB
        ?A#0    S                                * 2A7AE
        GOYES   L_2A752                          * 2A7B1
        ?A=0    W                                * 2A7B3
        GOYES   L_2A752                          * 2A7B6
        GONC    L_2A756                          * 2A7B8
        RPL

* %% -> flag
* refs (4): 52397 523D8 52782 5290D
%%0<>:
        :: %%0= NOT ;                            * 2A7BB

* % -> flag
* refs (19): 1A751 1E7E2 1E7EC 1E868 1E872 1E94B ...
%0<>:
        :: %0= NOT ;                             * 2A7CF

* %% -> flag
* refs (14): 36BDA 36C2F 37AC7 4552E 5215C 5217A ...
%%0>=:
        :: %%0< NOT ;                            * 2A7E3

* % -> flag
* refs (4): 2B17B 45222 45457 4F291
%0>=:
        :: %0< NOT                               * 2A7F7
L_2A806:
        ;                                        * 2A806

* %% -> flag
* refs (1): 2B22D
%%0<=:
        :: %%0> NOT ;                            * 2A80B

* %% %%' -> flag
* refs (14): 33995 37DAA 5294E 7CE46 91F18 92303 ...
%%<:
        CON(5)  (*)+5                            * 2A81F  primitive code object
        ASSEMBLE
        P=      1                                * 2A824
L_2A826:
        GOSUB   SUB_2AEB7                        * 2A826
L_2A82A:
        GOSUBL  TST15                            * 2A82A
        P=      0                                * 2A830
        SETHEX                                   * 2A832
        GOC     L_2A851                          * 2A834
        GOSBVL  GETPTR                           * 2A837
        D1=D1-  5                                * 2A83E
        D=D-1   A                                * 2A841
L_2A843:
        LC(5)   FALSE                            * 2A843
        DAT1=C  A                                * 2A84A
        GOTO    L_2A867                          * 2A84D
L_2A851:
        GOSBVL  GETPTR                           * 2A851
        D1=D1-  5                                * 2A858
        D=D-1   A                                * 2A85B
L_2A85D:
        LC(5)   TRUE                             * 2A85D
        DAT1=C  A                                * 2A864
L_2A867:
        A=DAT0  A                                * 2A867
        D0=D0+  5                                * 2A86A
        PC=(A)                                   * 2A86D

* % %' -> flag
* refs (37): 0FB9C 10572 1B87B 1EC45 2A718 2B14E ...
%<:
        CON(5)  (*)+5                            * 2A871  primitive code object
        P=      1                                * 2A876
L_2A878:
        GOSUB   Pop%ACSrSep~jump                 * 2A878
        GONC    L_2A82A                          * 2A87C

* %% %%' -> flag
* refs (16): 2A6E6 7CE14 91EEB 94B8F 94BF8 94C5C ...
%%>:
        GOC     L_2A806+2                        * 2A87F
        NIBHEX  A2246F9F                         * 2A882  *Böù

* % %' -> flag
* refs (36): 0FB7E 1B703 1ECE4 2A6FF 2C0D1 332C4 ...
%>:
        CON(5)  (*)+5                            * 2A88A  primitive code object
        P=      4                                * 2A88F
        GOTO    L_2A878                          * 2A891

* %% %%' -> flag
* refs (17): 33A08 45330 5222E 52251 90D8C 92637 ...
%%>=:
        CON(5)  (*)+5                            * 2A895  primitive code object
        P=      6                                * 2A89A
        GOTO    L_2A826                          * 2A89C

* % %' -> flag
* refs (17): 1EE22 2B0E3 33332 336E3 4A1DB 4F2B4 ...
%>=:
        CON(5)  (*)+5                            * 2A8A0  primitive code object
        P=      6                                * 2A8A5
        GOTO    L_2A878                          * 2A8A7

* %% %%' -> falg
* refs (18): 52A49 9113F 953F0 95FF2 96312 96713 ...
%%<=:
        CON(5)  (*)+5                            * 2A8AB  primitive code object
        P=      3                                * 2A8B0
        GOTO    L_2A826                          * 2A8B2

* % %' -> flag
* refs (15): 1ED83 3427F 4523B 4546B B7C0C B7C45 ...
%<=:
        CON(5)  (*)+5                            * 2A8B6  primitive code object
        P=      3                                * 2A8BB
        GOTO    L_2A878                          * 2A8BD

* % %' -> flag
* refs (48): 0EAE6 1055E 1093C 142C9 18765 2B125 ...
%=:
        CON(5)  (*)+5                            * 2A8C1  primitive code object
        P=      2                                * 2A8C6
        GOTO    L_2A878                          * 2A8C8

* % %' -> flag
* refs (8): 1DD83 3301C 33265 3327E 334C7 B734D ...
%<>:
        CON(5)  (*)+5                            * 2A8CC  primitive code object
        P=      13                               * 2A8D1
        GOTO    L_2A878                          * 2A8D3

* % -> -1/0/1
* refs (6): 0FCF0 1B339 4FC82 501F9 5021C 89D67
%SGN:
        CON(5)  (*)+5                            * 2A8D7  primitive code object
        GOSUB   POP1%~jump                       * 2A8DC
        ?A=0    W                                * 2A8E0
        GOYES   L_2A90C                          * 2A8E3
        P=      14                               * 2A8E5
        A=0     WP                               * 2A8E7
        A=A+1   P                                * 2A8EA
        GONC    L_2A90C                          * 2A8ED  always taken

* %% -> %%abs
* refs (91): 33986 33990 339EF 33A03 36F65 37C89 ...
%%ABS:
        CON(5)  (*)+5                            * 2A8F0  primitive code object
        GOSUB   POP1%%~jump                      * 2A8F5
        A=0     S                                * 2A8F9
        GOTO    L_2AED0                          * 2A8FC

* % -> %'
* refs (51): 0E6D9 0F606 10905 1AA2E 1B6F9 22251 ...
%ABS:
        CON(5)  (*)+5                            * 2A900  primitive code object
        GOSUB   POP1%~jump                       * 2A905
        A=0     S                                * 2A909
L_2A90C:
        GOTO    L_2AEEF                          * 2A90C

* %% -> -%%
* refs (44): 36BE4 36BFD 36C1B 36C39 36C43 37CE7 ...
%%CHS:
        CON(5)  (*)+5                            * 2A910  primitive code object
        GOSUB   POP1%%~jump                      * 2A915
        A=-A-1  S                                * 2A919
        GOTO    L_2AED0                          * 2A91C

* % -> -%
* refs (28): 0F61F 1A9A4 2A6CD 37CDD 40085 400B2 ...
%CHS:
        CON(5)  (*)+5                            * 2A920  primitive code object
        GOSUB   POP1%~jump                       * 2A925
        A=-A-1  S                                * 2A929
        GOTO    L_2AEEF                          * 2A92C

* % -> %mant
* refs (1): 1BEAB
%MANTISSA:
        CON(5)  (*)+5                            * 2A930  primitive code object
        GOSUB   POP1%~jump                       * 2A935
        A=0     X                                * 2A939
        A=0     S                                * 2A93C
        GOTO    L_2AEEF                          * 2A93F

* %% %%' -> %%+%%'
* refs (121): 0F4A2 0F4B6 0F501 0F6AC 2A6B4 2B241 ...
%%+:
        CON(5)  (*)+5                            * 2A943  primitive code object
        GOSUB   SUB_2AEB7                        * 2A948
        GONC    L_2A967                          * 2A94C  always taken

* %% %%' -> %%-%%'
* refs (67): 0F470 0F4E3 0F77E 0FC4B 2B21E 2B40B ...
%%-:
        CON(5)  (*)+5                            * 2A94F  primitive code object
        GOSUB   SUB_2AEB7                        * 2A954
        GONC    L_2A964                          * 2A958

* % %' -> %%-%%'
* refs (18): 2C0EF 2C931 339EA 339FE 33EEE 33F02 ...
%>%%-:
        RSTK=C                                   * 2A95B
        ?C>A    XS                               * 2A95D
        GOYES   L_2A9B2+5                        * 2A960
        NIBHEX  45                               * 2A962  T
L_2A964:
        C=-C-1  S                                * 2A964
L_2A967:
        HST=0   3                                * 2A967
        GOSUBL  RADDF                            * 2A96A
        GOTO    L_2AED0                          * 2A970

* % %' -> %+%'
* refs (69): 0C672 10405 1AB76 20921 2EBD0 41610 ...
%+:
        CON(5)  (*)+5                            * 2A974  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2A979
        GOTO    L_2A98D                          * 2A97D

* % %' -> %-%'
* refs (74): 0C677 1059F 10653 1AD18 209D7 452D1 ...
%-:
        CON(5)  (*)+5                            * 2A981  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2A986
        C=-C-1  S                                * 2A98A
L_2A98D:
        HST=0   3                                * 2A98D
        GOSUBL  ADDF                             * 2A990
        GOTO    L_2AEE9                          * 2A996

* %% %%' -> %%*%%'
* refs (219): 0F3C1 0F45C 0F4E8 0F506 0FC5A 0FDC2 ...
%%*:
        CON(5)  (*)+5                            * 2A99A  primitive code object
        GOSUB   SUB_2AEB7                        * 2A99F
        GONC    L_2A9AF                          * 2A9A3  always taken

* refs (10): 0FBBF 36A20 51A7B 51A85 51E41 51E4B ...
_*(2r);r=>rr:
        CON(5)  (*)+5                            * 2A9A6  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2A9AB
L_2A9AF:
        HST=0   3                                * 2A9AF
* a branch also enters #2A9B7, where the nibbles decode as RSTK=C
L_2A9B2:
        GOSUBL  MULTF                            * 2A9B2
* the rest of RSTK=C at #2A9B7
* a branch also enters #2A9B8, where the nibbles decode as GOTO #2AED0
        NIBHEX  6                                * 2A9B8
* the rest of GOTO #2AED0 at #2A9B8
        NIBHEX  715                              * 2A9B9  .

* % %' -> %*%'
* refs (99): 0F79C 109FA 1A7E3 1ADFD 1B485 41683 ...
%*:
        CON(5)  (*)+5                            * 2A9BC  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2A9C1
        GOTO    L_2A9DB                          * 2A9C5

* % %' -> %'/% * 100
* refs (1): 1C06F
%OF:
        CON(5)  (*)+5                            * 2A9C9  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2A9CE
        ?B=0    M                                * 2A9D2
        GOYES   L_2A9DB                          * 2A9D5
        A=A-1   A                                * 2A9D7
        A=A-1   A                                * 2A9D9
L_2A9DB:
        HST=0   3                                * 2A9DB
        GOSUBL  MULTF                            * 2A9DE
        GOTO    L_2AEE9                          * 2A9E4

* %% %%' -> %%/%%'
* refs (126): 0F3BC 0F466 0F498 0F4F2 0F72E 10C45 ...
%%/:
        CON(5)  (*)+5                            * 2A9E8  primitive code object
        GOSUB   SUB_2AEB7                        * 2A9ED
        HST=0   3                                * 2A9F1
        GOSUBL  DIVF                             * 2A9F4
        GOTO    L_2AECC                          * 2A9FA

* % %' -> %/%'
* refs (77): 0F82D 109F5 1A256 1A2AB 1AF14 20FC8 ...
%/:
        CON(5)  (*)+5                            * 2A9FE  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2AA03
        GOTO    L_2AA1E                          * 2AA07

* % %' -> %pctotal
* refs (1): 1C0E6
%T:
        CON(5)  (*)+5                            * 2AA0B  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2AA10
        GOSUBL  XYEX                             * 2AA14
        GOSUB   SUB_2AA25                        * 2AA1A
L_2AA1E:
        HST=0   3                                * 2AA1E
        GOTO    L_2AA55                          * 2AA21

* refs (2): 2AA1A 2AA51
SUB_2AA25:
        ?B=0    M                                * 2AA25
        RTNYES                                   * 2AA28
        A=A+1   A                                * 2AA2A
        A=A+1   A                                * 2AA2C
        RTNCC                                    * 2AA2E

* % %' -> %pcchange
* refs (1): 1C158
%CH:
        CON(5)  (*)+5                            * 2AA30  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2AA35
        GOSUBL  STAB0                            * 2AA39
        A=-A-1  S                                * 2AA3F
        HST=0   3                                * 2AA42
        GOSUBL  ADDF                             * 2AA45
        GOSUBL  RCCD0                            * 2AA4B
        GOSUB   SUB_2AA25                        * 2AA51
L_2AA55:
        GOSUBL  DIVF                             * 2AA55
        GOTO    L_2AEE5                          * 2AA5B

* %% %%' -> %%^%%'
* refs (9): 10C68 52446 93647 C7D21 C912F C91FB ...
%%^:
        CON(5)  (*)+5                            * 2AA5F  primitive code object
        GOSUB   SUB_2AEB7                        * 2AA64
        GOSUB   SUB_2AAC0                        * 2AA68
        GOTO    L_2AECC                          * 2AA6C

* % %' -> %^%'
* refs (5): 0F8AA 1B133 4C036 4C078 CD57E
%^:
        CON(5)  (*)+5                            * 2AA70  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2AA75
L_2AA79:
        GOSUB   SUB_2AAC0                        * 2AA79
        GOTO    L_2AEE5                          * 2AA7D

* % %n -> %'
* refs (2): 0F8A5 1B25B
%NROOT:
        CON(5)  (*)+5                            * 2AA81  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2AA86
        GOSUB   SUB_2AAD5                        * 2AA8A
        GOTO    L_2AEE5                          * 2AA8E

* %% -> 1/%%
* refs (2): 92017 95DBA
%%1/:
        CON(5)  (*)+5                            * 2AA92  primitive code object
        GOSUB   POP1%%~jump                      * 2AA97
        GONC    L_2AAA7                          * 2AA9B  always taken

* % -> 1/%%
* refs (3): 33EC1 33ECB 33ED5
%>%%1/:
        CON(5)  (*)+5                            * 2AA9E  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AAA3
L_2AAA7:
        GOSUB   1/X15~jump                       * 2AAA7
        GOTO    L_2AECC                          * 2AAAB

* % -> 1/%
* refs (9): 0F84B 10A6D 1B287 5A85A 8ACE3 8ADD0 ...
%1/:
        CON(5)  (*)+5                            * 2AAAF  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AAB4
        GOSUB   1/X15~jump                       * 2AAB8
        GOTO    L_2AEE5                          * 2AABC

* refs (2): 2AA68 2AA79
SUB_2AAC0:
        GOSUBL  SUB_2B6BC                        * 2AAC0
        ?XM=0                                    * 2AAC6
        GOYES   L_2AAD3                          * 2AAC9
        ?P#     14                               * 2AACB
        RTNYES                                   * 2AACE
        XM=0                                     * 2AAD0
L_2AAD3:
        RTNCC                                    * 2AAD3

* refs (1): 2AA8A
SUB_2AAD5:
        GOSUBL  SUB_2B6CE                        * 2AAD5
        ?XM=0                                    * 2AADB
        GOYES   L_2AAE8                          * 2AADE
        ?P#     14                               * 2AAE0
        RTNYES                                   * 2AAE3
        XM=0                                     * 2AAE5
L_2AAE8:
        RTNCC                                    * 2AAE8

* %% -> SQRT%%
* refs (43): 2C8D7 36A39 3796E 52071 5208F 520C1 ...
%%SQRT:
        CON(5)  (*)+5                            * 2AAEA  primitive code object
        GOSUB   POP1%%~jump                      * 2AAEF
        GONC    L_2AAFF                          * 2AAF3

* % -> SQRT%%
* refs (2): 2C0F9 95F52
%>%%SQRT:
        C=-C    W                                * 2AAF6
        D=D+D   XS                               * 2AAF9
        NIBHEX  3A3                              * 2AAFC  £
L_2AAFF:
        GOSUBL  SUB_2B9F3                        * 2AAFF
        GOTO    L_2AECC                          * 2AB05

* % -> SQRT%
* refs (1): 1B409
%SQRT:
        CON(5)  (*)+5                            * 2AB09  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AB0E
        GOSUBL  SUB_2B9F3                        * 2AB12
        GOTO    L_2AEE5                          * 2AB18

* %% -> e^%%
* refs (7): 2B452 2CA99 2CB3E 2CBB6 521B1 52400 ...
%%EXP:
        CON(5)  (*)+5                            * 2AB1C  primitive code object
        GOSUB   POP1%%~jump                      * 2AB21
        GOSUBL  SUB_2B6AA                        * 2AB25
        GOTO    L_2AED0                          * 2AB2B

* % -> e^%
* refs (4): 1B914 CCD00 CD3DF CD545
%EXP:
        CON(5)  (*)+5                            * 2AB2F  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AB34
        GOSUBL  SUB_2B6AA                        * 2AB38
        GOTO    L_2AEE9                          * 2AB3E

* % -> e^%-1
* refs (1): 1BAD1
%EXPM1:
        CON(5)  (*)+5                            * 2AB42  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AB47
        GOSUBL  SUB_2B6B3                        * 2AB4B
        GOSUBL  RCAB0                            * 2AB51
        GOTO    L_2AEE9                          * 2AB57

* %% -> ln %%
* refs (3): 2B434 2CBDE 52265
%%LN:
        CON(5)  (*)+5                            * 2AB5B  primitive code object
        GOSUB   POP1%%~jump                      * 2AB60
        GOSUBL  SUB_2B698                        * 2AB64
        GOTO    L_2AECC                          * 2AB6A

* % -> LN%
* refs (1): 1B9A9
%LN:
        CON(5)  (*)+5                            * 2AB6E  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AB73
        GOSUBL  SUB_2B698                        * 2AB77
        GOTO    L_2AEE5                          * 2AB7D

* % -> LOG%
* refs (2): 1BA20 CD0F1
%LOG:
        CON(5)  (*)+5                            * 2AB81  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AB86
        GOSUBL  SUB_2B6A1                        * 2AB8A
        GOTO    L_2AEE5                          * 2AB90

* %% -> %%ln(%%+1)
* refs (3): 522B5 527B9 529D5
%%LNP1:
        CON(5)  (*)+5                            * 2AB94  primitive code object
        GOSUB   POP1%%~jump                      * 2AB99
        GOSUBL  SUB_2B68F                        * 2AB9D
        GOTO    L_2AECC                          * 2ABA3

* % -> LN(%+1)
* refs (1): 1BA9B
%LNP1:
        CON(5)  (*)+5                            * 2ABA7  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2ABAC
        GOSUBL  SUB_2B68F                        * 2ABB0
        GOTO    L_2AEE5                          * 2ABB6

* % -> 10^%
* refs (1): 1BA4C
%ALOG:
        CON(5)  (*)+5                            * 2ABBA  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2ABBF
        C=0     W                                * 2ABC3
        D=0     W                                * 2ABC6
        P=      14                               * 2ABC9
        D=D+1   P                                * 2ABCB
        P=      0                                * 2ABCE
        C=C+1   A                                * 2ABD0
        GOSUBL  XYEX                             * 2ABD2
        GOTO    L_2AA79                          * 2ABD8

* % %' -> %rem
* refs (4): 1BE5C 2B1AD 452DB 454F7
%MOD:
        CON(5)  (*)+5                            * 2ABDC  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2ABE1
        GOSUBL  aMODF                            * 2ABE5
        GOTO    L_2AEE9                          * 2ABEB

* % -> SIN%
* refs (1): 1B4BB
%SIN:
        CON(5)  (*)+5                            * 2ABEF  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2ABF4
        GOSUB   GetAngleST                       * 2ABF8
        GOSUBL  SUB_2B6E0                        * 2ABFC
        GOTO    L_2AEE9                          * 2AC02

* %% -> %%sin
* refs (1): 2B4D9
%%SIN:
        CON(5)  (*)+5                            * 2AC06  primitive code object
        GOSUB   POP1%%~jump                      * 2AC0B
        GOSUB   GetAngleST                       * 2AC0F
        GOTO    L_2AC36                          * 2AC13

* %%deg -> %%sin
* refs (4): 0F64C 5241E 5246E 97F63
%%SINDEG:
        CON(5)  (*)+5                            * 2AC17  primitive code object
        GOSUB   POP1%%~jump                      * 2AC1C
        ST=0    9                                * 2AC20
        GOTO    L_2AC33                          * 2AC23

* %% -> %%'
* refs (4): 521CA 52549 5259E 525F3
%%SINRAD:
        CON(5)  (*)+5                            * 2AC27  primitive code object
        GOSUB   POP1%%~jump                      * 2AC2C
        ST=1    9                                * 2AC30
L_2AC33:
        ST=0    4                                * 2AC33
L_2AC36:
        GOSUBL  SUB_2B6E0                        * 2AC36
        GOTO    L_2AED0                          * 2AC3C

* % -> COS%
* refs (1): 1B514
%COS:
        CON(5)  (*)+5                            * 2AC40  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AC45
        GOSUB   GetAngleST                       * 2AC49
        GOSUBL  SUB_2B6E9                        * 2AC4D
        GOTO    L_2AEE9                          * 2AC53

* %% -> %%cos
* refs (1): 2B4CF
%%COS:
        CON(5)  (*)+5                            * 2AC57  primitive code object
        GOSUB   POP1%%~jump                      * 2AC5C
        GOSUB   GetAngleST                       * 2AC60
        GOTO    L_2AC87                          * 2AC64

* %%deg -> %%cos
* refs (4): 0F66A 5240A 52464 97F59
%%COSDEG:
        CON(5)  (*)+5                            * 2AC68  primitive code object
        GOSUB   POP1%%~jump                      * 2AC6D
        ST=0    9                                * 2AC71
        GOTO    L_2AC84                          * 2AC74

* %%rad -> %%cos
* refs (4): 521BB 5255D 5258A 525DA
%%COSRAD:
        CON(5)  (*)+5                            * 2AC78  primitive code object
        GOSUB   POP1%%~jump                      * 2AC7D
        ST=1    9                                * 2AC81
L_2AC84:
        ST=0    4                                * 2AC84
L_2AC87:
        GOSUBL  SUB_2B6E9                        * 2AC87
        GOTO    L_2AED0                          * 2AC8D

* % -> TAN%
* refs (1): 1B56D
%TAN:
        CON(5)  (*)+5                            * 2AC91  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AC96
        GOSUB   GetAngleST                       * 2AC9A
        GOSUBL  SUB_2B6F2                        * 2AC9E
        GOTO    L_2AEE5                          * 2ACA4

* %%rad -> %%tan
%%TANRAD:
        CON(5)  (*)+5                            * 2ACA8  primitive code object
        GOSUB   POP1%%~jump                      * 2ACAD
        ST=1    9                                * 2ACB1
        ST=0    4                                * 2ACB4
        GOSUBL  SUB_2B6F2                        * 2ACB7
        GOTO    L_2AECC                          * 2ACBD

* % -> ASIN%
* refs (1): 1B712
%ASIN:
        CON(5)  (*)+5                            * 2ACC1  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2ACC6
        GOSUB   GetAngleST                       * 2ACCA
        GOSUBL  SUB_2B704                        * 2ACCE
        GOTO    L_2AEE5                          * 2ACD4

* %% -> %%rad
* refs (2): 52A67 52A76
%%ASINRAD:
        CON(5)  (*)+5                            * 2ACD8  primitive code object
        GOSUB   POP1%%~jump                      * 2ACDD
        ST=1    9                                * 2ACE1
        ST=0    4                                * 2ACE4
        GOSUBL  SUB_2B704                        * 2ACE7
        GOTO    L_2AECC                          * 2ACED

* % -> ACOS%
* refs (1): 1B77F
%ACOS:
        CON(5)  (*)+5                            * 2ACF1  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2ACF6
        GOSUB   GetAngleST                       * 2ACFA
        GOSUBL  SUB_2B70D                        * 2ACFE
        GOTO    L_2AEE5                          * 2AD04

* %% -> %%rad
* refs (2): 52A5D 52A80
%%ACOSRAD:
        CON(5)  (*)+5                            * 2AD08  primitive code object
        GOSUB   POP1%%~jump                      * 2AD0D
        ST=1    9                                * 2AD11
        ST=0    4                                * 2AD14
        GOSUBL  SUB_2B70D                        * 2AD17
        GOTO    L_2AECC                          * 2AD1D

* % -> ATAN%
* refs (1): 1B7AB
%ATAN:
        CON(5)  (*)+5                            * 2AD21  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AD26
        GOSUB   GetAngleST                       * 2AD2A
        GOSUBL  SUB_2B6FB                        * 2AD2E
        GOTO    L_2AEE9                          * 2AD34

* %x %y -> %ang
* refs (1): 1B317
%ANGLE:
        CON(5)  (*)+5                            * 2AD38  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2AD3D
        GOSUB   GetAngleST                       * 2AD41
        GOSUBL  SUB_2B6D7                        * 2AD45
        GOTO    L_2AEE9                          * 2AD4B

* %%x %%y -> %%ang
* refs (1): 2B4A7
%%ANGLE:
        CON(5)  (*)+5                            * 2AD4F  primitive code object
        GOSUB   SUB_2AEB7                        * 2AD54
        GONC    L_2AD64                          * 2AD58

* %x %y -> %%ang
* refs (1): 520A3
%>%%ANGLE:
        RSTK=C                                   * 2AD5B
        A=C     A                                * 2AD5D
        P=      7                                * 2AD5F
        GONC    L_2AD75+1                        * 2AD61  never taken
L_2AD64:
        GOSUB   GetAngleST                       * 2AD64
        GOTO    L_2AD8B                          * 2AD68

* %%x %%y -> %%deg
* refs (3): 3795F 523EC 52455
%%ANGLEDEG:
        CON(5)  (*)+5                            * 2AD6C  primitive code object
        GOSUB   SUB_2AEB7                        * 2AD71
L_2AD75:
        ST=0    9                                * 2AD75
        GOTO    L_2AD88                          * 2AD78

* %% -> %%'
* refs (4): 52206 522D8 523B5 5276E
%%ANGLERAD:
        CON(5)  (*)+5                            * 2AD7C  primitive code object
        GOSUB   SUB_2AEB7                        * 2AD81
        ST=1    9                                * 2AD85
L_2AD88:
        ST=0    4                                * 2AD88
L_2AD8B:
        GOSUBL  SUB_2B6D7                        * 2AD8B
        GOTO    L_2AED0                          * 2AD91

* %% -> %%sinh
* refs (3): 52553 52594 525C6
%%SINH:
        CON(5)  (*)+5                            * 2AD95  primitive code object
        GOSUB   POP1%%~jump                      * 2AD9A
        GOSUBL  SUB_2B731                        * 2AD9E
        GOSUBL  RCAB0                            * 2ADA4
        GOTO    L_2AED0                          * 2ADAA

* % -> SINH%
* refs (1): 1B5C6
%SINH:
        CON(5)  (*)+5                            * 2ADAE  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2ADB3
        GOSUBL  SUB_2B731                        * 2ADB7
        GOSUBL  RCAB0                            * 2ADBD
        GOTO    L_2AEDB                          * 2ADC3

* %% -> %%cosh
* refs (3): 5253F 52580 52611
%%COSH:
        CON(5)  (*)+5                            * 2ADC7  primitive code object
        GOSUB   POP1%%~jump                      * 2ADCC
        GOSUBL  SUB_2B731                        * 2ADD0
        GOTO    L_2AED0                          * 2ADD6

* % -> COSH%
* refs (1): 1B615
%COSH:
        CON(5)  (*)+5                            * 2ADDA  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2ADDF
        GOSUBL  SUB_2B731                        * 2ADE3
        GOTO    L_2AEDB                          * 2ADE9

* % -> TANH%
* refs (1): 1B664
%TANH:
        CON(5)  (*)+5                            * 2ADED  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2ADF2
        GOSUBL  SUB_2B73A                        * 2ADF6
        GOTO    L_2AEDB                          * 2ADFC

* % -> ASINH%
* refs (1): 1B7FA
%ASINH:
        CON(5)  (*)+5                            * 2AE00  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AE05
        GOSUBL  SUB_2B743                        * 2AE09
        GOTO    L_2AEDB                          * 2AE0F

* % -> ACOSH%
* refs (1): 1B885
%ACOSH:
        CON(5)  (*)+5                            * 2AE13  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AE18
        GOSUBL  SUB_2B74C                        * 2AE1C
        GOTO    L_2AED7                          * 2AE22

* % -> ATANH%
* refs (1): 1B8E8
%ATANH:
        CON(5)  (*)+5                            * 2AE26  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AE2B
        GOSUBL  SUB_2B755                        * 2AE2F
        GOTO    L_2AED7                          * 2AE35

* % -> %expn
* refs (5): 1BC54 45D5C 4C040 5A752 5A823
%EXPONENT:
        CON(5)  (*)+5                            * 2AE39  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AE3E
        GOSUBL  SUB_2B686                        * 2AE42
        GOTO    L_2AEE5                          * 2AE48

* % -> %!
* refs (1): 2B185
%NFACT:
        CON(5)  (*)+5                            * 2AE4C  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AE51
        HST=0   3                                * 2AE55
        GOSUBL  SUB_2B716                        * 2AE58
        GOTO    L_2AEE9                          * 2AE5E

* % %' -> COMB(%,%')
* refs (1): 1C205
%COMB:
        CON(5)  (*)+5                            * 2AE62  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2AE67
        GOSUBL  SUB_2B728                        * 2AE6B
        GOTO    L_2AE84                          * 2AE71

* % %' -> PERM(%,%')
* refs (1): 1C245
%PERM:
        CON(5)  (*)+5                            * 2AE75  primitive code object
        GOSUB   Pop%ACSrSep~jump                 * 2AE7A
        GOSUBL  SUB_2B71F                        * 2AE7E
L_2AE84:
        ?XM=0                                    * 2AE84
        GOYES   L_2AEE5                          * 2AE87
L_2AE89:
        P=      0                                * 2AE89
        SETHEX                                   * 2AE8B
        GOSBVL  GETPTR                           * 2AE8D
        GOVLNG  DOSIZEERR                        * 2AE94

* refs (5): 2A8DC 2A905 2A925 2A935 2B080
POP1%~jump:
        GOVLNG  POP1%                            * 2AE9B

* refs (32): 2A5C6 2AAA3 2AAB4 2AB0E 2AB34 2AB47 ...
POP1%SPLITA~jump:
        GOVLNG  POP1%SPLITA                      * 2AEA2

* refs (15): 2A878 2A979 2A986 2A9AB 2A9C1 2A9CE ...
Pop%ACSrSep~jump:
        GOVLNG  Pop%ACSrSep                      * 2AEA9

* refs (20): 2A5B5 2A8F5 2A915 2AA97 2AAEF 2AB21 ...
POP1%%~jump:
        GOVLNG  POP1%%                           * 2AEB0

* refs (9): 2A826 2A948 2A954 2A99F 2A9ED 2AA64 ...
SUB_2AEB7:
        GOVLNG  SUB_2A0B1                        * 2AEB7

* refs (2): 2AAA7 2AAB8
1/X15~jump:
        GOVLNG  1/X15                            * 2AEBE

* refs (3): 2AECC 2AED7 2AEE5
SUB_2AEC5:
        GOVLNG  L_2A12A                          * 2AEC5
L_2AECC:
        GOSUB   SUB_2AEC5                        * 2AECC
L_2AED0:
        GOVLNG  L_2A235                          * 2AED0
L_2AED7:
        GOSUB   SUB_2AEC5                        * 2AED7
L_2AEDB:
        GOSUBL  PACK                             * 2AEDB
        GOTO    L_2AEEF                          * 2AEE1
L_2AEE5:
        GOSUB   SUB_2AEC5                        * 2AEE5
L_2AEE9:
        GOSUBL  PACKSB                           * 2AEE9
L_2AEEF:
        GOVLNG  PUSH%LOOP                        * 2AEEF

* refs (11): 2ABF8 2AC0F 2AC49 2AC60 2AC9A 2ACCA ...
* Read the angle mode (flags -17/-18) into ST9 (radians) and ST4 (grads); decimal mode
GetAngleST:
        SETDEC                                   * 2AEF6
        ST=0    4                                * 2AEF8
        ST=1    9                                * 2AEFB
        D0=(5)  #80847                           * 2AEFE
        P=C     0                                * 2AF05
        C=DAT0  1                                * 2AF09
        ?CBIT=1 0                                * 2AF0D
        GOYES   L_2AF21                          * 2AF12
        ST=0    9                                * 2AF14
        ?CBIT=0 1                                * 2AF17
        GOYES   L_2AF21                          * 2AF1C
        ST=1    4                                * 2AF1E
L_2AF21:
        C=P     0                                * 2AF21
        RTN                                      * 2AF25

* %% -> %%hms
* refs (2): 2A67D 35BEB
%%H>HMS:
        CON(5)  (*)+5                            * 2AF27  primitive code object
        GOSBVL  %%H>HMS~1                        * 2AF2C
        GOTO    L_2AECC                          * 2AF33
        BSS     3                                * 2AF37  zeros

* refs (3): 2A691 2A6A5 2A6AF
hm->(r);r=>rr:
        CON(5)  (*)+5                            * 2AF3A  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AF3F
        GOSUBL  SUB_2B779                        * 2AF43
        GOTO    L_2AECC                          * 2AF49

* % -> %frac
* refs (17): 0FD18 1BBB2 4160B 41D60 5A7C4 B6D21 ...
%FP:
        CON(5)  (*)+5                            * 2AF4D  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AF52
        GOSUBL  SUB_2B674                        * 2AF56
        GOTO    L_2AEDB                          * 2AF5C

* % -> %int
* refs (29): 0FD04 1A8A5 1BB7C 2B11B 2B1A3 2EC16 ...
%IP:
        CON(5)  (*)+5                            * 2AF60  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AF65
        GOSUBL  CLRFRC                           * 2AF69
        GOTO    L_2AEDB                          * 2AF6F

* % -> %minint >=%
* refs (3): 0FD40 1BC1E 4C949
%CEIL:
        CON(5)  (*)+5                            * 2AF73  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AF78
        GOSUBL  SUB_2B75E                        * 2AF7C
        GOTO    L_2AEDB                          * 2AF82

* % -> %maxint <=%
* refs (3): 0FD2C 1BBE8 CBB72
%FLOOR:
        CON(5)  (*)+5                            * 2AF86  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AF8B
        GOSUBL  SUB_2B767                        * 2AF8F
        GOTO    L_2AEDB                          * 2AF95

* %% -> %%maxint
* refs (1): 2B223
%%FLOOR:
        CON(5)  (*)+5                            * 2AF99  primitive code object
        GOSUB   POP1%%~jump                      * 2AF9E
        GOSUBL  SUB_2B767                        * 2AFA2
        GOTO    L_2AED0                          * 2AFA8

* % %' -> %rem
* refs (1): 0E6DE
%INT:
        CON(5)  (*)+5                            * 2AFAC  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2AFB1
        ST=0    1                                * 2AFB5
        P=      0                                * 2AFB8
        LC(2)   #01                              * 2AFBA
        GOTO    L_2B576                          * 2AFBE

* -> %random
* refs (4): 1C1C3 CBB63 CBB77 CE211
%RAN:
        CON(5)  (*)+5                            * 2AFC2  primitive code object
        GOSBVL  SAVPTR                           * 2AFC7
        SETDEC                                   * 2AFCE
        D0=(5)  RNSEED                           * 2AFD0
        A=DAT0  15                               * 2AFD7
        A=0     S                                * 2AFDB
        ?A#0    W                                * 2AFDE
        GOYES   L_2AFF8                          * 2AFE1
        LC(16)  #0999500333083533                * 2AFE3
        A=C     W                                * 2AFF5
L_2AFF8:
        B=0     W                                * 2AFF8
        ABEX    W                                * 2AFFB
        LC(16)  #0002851130928467                * 2AFFE
        GOTO    L_2B017                          * 2B010
L_2B014:
        A=A+B   W                                * 2B014
L_2B017:
        C=C-1   P                                * 2B017
        GONC    L_2B014                          * 2B01A
        BSL     W                                * 2B01D
        P=P+1                                    * 2B020
        GONC    L_2B017                          * 2B022
        DAT0=A  15                               * 2B025
        ABEX    W                                * 2B029
        P=      14                               * 2B02C
        A=A-1   A                                * 2B02E
L_2B030:
        ?B#0    P                                * 2B030
        GOYES   L_2B03D                          * 2B033
        A=A-1   A                                * 2B035
        BSL     WP                               * 2B037
        GONC    L_2B030                          * 2B03A
L_2B03D:
        A=B     M                                * 2B03D
        GOTO    L_2AEEF                          * 2B040
        RPL

* %seed ->
* refs (1): 1C1E3
%RANDOMIZE:
        :: DUP %0<> case DORANDOMIZE             * 2B044
          DROP CLKTICKS HXS># UNCOERCE DORANDOMIZE ; * 2B05D

* % ->
* refs (3): 2B058 2B071 CE162
DORANDOMIZE:
        CON(5)  (*)+5                            * 2B07B  primitive code object
        ASSEMBLE
        GOSUB   POP1%~jump                       * 2B080
        A=0     S                                * 2B084
        B=0     A                                * 2B087
        ABEX    X                                * 2B089
L_2B08C:
        B=B+1   A                                * 2B08C
        ?A=0    W                                * 2B08E
        GOYES   L_2B0A6                          * 2B091
        C=B     A                                * 2B093
        C=C+C   X                                * 2B095
        GONC    L_2B0A6                          * 2B098
        ?C=0    X                                * 2B09B
        GOYES   L_2B0A6                          * 2B09E
        ASR     W                                * 2B0A0
        GONC    L_2B08C                          * 2B0A3
L_2B0A6:
        A=B     X                                * 2B0A6
        ASL     X                                * 2B0A9
        A=A+1   A                                * 2B0AC
        D0=(5)  RNSEED                           * 2B0AE
        DAT0=A  15                               * 2B0B5
        P=      0                                * 2B0B9
        SETHEX                                   * 2B0BB
        GOVLNG  GETPTRLOOP                       * 2B0BD
        RPL

* % -> gamma(%+1)
* refs (2): 1BB11 1BB50
%FACT:
        :: DUP                                   * 2B0C4

%2.6E2:
          % 2.6E2 %>= casedrop                   * 2B0CE
          ::                                     * 2B0ED

%%1E10000:
            %% 1E10000 %%>% ;                    * 2B0F2
          DUP %IP OVER %= case %FACT~1           * 2B116
          DUP                                    * 2B134

%-2.6E2:
          % -2.6E2 %< case %FACT~2               * 2B139
          %>%% fact(rr) %%>% ;                   * 2B15D

* refs (1): 2B12F
%FACT~1:
        :: DUP %0>= case %NFACT                  * 2B171
          OBJ_5203A DROP %-MAXREAL ;             * 2B18A

* refs (1): 2B158
%FACT~2:
        :: %IP %2 %MOD %0= ITE                   * 2B19E

%%1E-10000:
          %% 1E-10000                            * 2B1BC

%%-1E-10000:
          %% -1E-10000                           * 2B1D6
          %%>% ;                                 * 2B1F0

* refs (1): 2B162
fact(rr):
        ::                                       * 2B1FA

* 7
%%7:
          %% 7E0 OVER %%- %%FLOOR DUP %%0<= casedrop fact(rr)~1 * 2B1FF
          2DUP %%+ fact(rr)~1 SWAP %%>% COERCE ROT 1+(rr) DUP ROT BEGIN #1- * 2B23C
          DUP#0<> WHILE                          * 2B278
          :: ROT 1+(rr) ROT OVER %%* ROT ; REPEAT ROT 2DROP %%/ ; * 2B282

* refs (2): 2B237 2B246
fact(rr)~1:
        :: 1+(rr) DUP 2DUP %%*                   * 2B2C3

* 12
%%12:
          %% 1.2E1 %%* DUP                       * 2B2DC

* 60
%%60:
          %% 6E1 %%+                             * 2B300

%%-4.95920119017593E2:
          %% -4.95920119017593E2 SWAP %%/        * 2B31F

%%3.03479606073615E1:
          %% 3.03479606073615E1 %%+ OVER %%+     * 2B343

%%-7.65594818140208E1:
          %% -7.65594818140208E1 SWAP %%/        * 2B36C

%%9.33584905660377:
          %% 9.33584905660377E0 %%+ OVER %%+     * 2B390

%%-1.21142857142857:
          %% -1.21142857142857E0 SWAP %%/        * 2B3B9

* 0.4
%%.4:
          %% 4E-1 %%+ %%+ %%/ OVER %%-           * 2B3DD

%%9.18938533204673E-1:
          %% 9.18938533204673E-1 %%+ OVER %%LN ROT %%.5 %%- %%* %%+ %%EXP ; * 2B410

* % % -> %% %%
* refs (6): 1DDAB 1DE41 2B493 2B4C0 2B4FC 4F0CA
2%>%%:
        :: %>%%SWAP %>%%SWAP ;                   * 2B45C

* %% %%' -> % %'
* refs (4): 2B4B1 2B4E8 2B515 6FFE4
2%%>%:
        :: %%>% SWAP %%>% SWAP ;                 * 2B470

* %r %ang -> %x %y
%REC>%POL:
        :: 2%>%%                                 * 2B48E

* %%x %%y -> %%radius %%angle
* refs (3): 1DDB0 1DDD8 1DE46
%%R>P:
          :: 2DUP%%R 3UNROLL %%ANGLE ; 2%%>% ;   * 2B498

* %x %y -> %r %ang
* refs (11): 0C6AE 1DE93 1DF0D 247FD 24901 28228 ...
%POL>%REC:
        :: 2%>%%                                 * 2B4BB

* %%r %%ang -> %%x %%y
* refs (2): 2B501 2B510
%%P>R:
          :: 2DUP %%COS %%*UNROT %%SIN %%* ; 2%%>% ; * 2B4C5

* %r %ang %ph -> %x %y %z
* refs (2): 1DEFE 24938
%SPH>%REC:
        :: ROTSWAP 2%>%% %%P>R ROT %>%% %%P>R 2%%>% ROT %%>% ; * 2B4F2

* % %places -> %'
* refs (4): 0FD7C 1BD64 4FD86 4FD9A
RNDXY:
        :: OBJ_2B590 OBJ_2B551 ;                 * 2B529

* % %places -> %'
* refs (2): 0FD9F 1BDE0
TRCXY:
        :: OBJ_2B590 OBJ_2B55D ;                 * 2B53D

* refs (6): 0CC6A 2B533 35E36 35ECC 4535D 45560
OBJ_2B551:
        CON(5)  (*)+5                            * 2B551  primitive code object
        ASSEMBLE
        ST=0    1                                * 2B556
        GOTO    L_2B565                          * 2B559

* refs (3): 2B547 35EB3 35F21
OBJ_2B55D:
        CON(5)  (*)+5                            * 2B55D  primitive code object
        ST=1    1                                * 2B562
L_2B565:
        GOSBVL  POP#                             * 2B565
        C=A     A                                * 2B56C
        RSTK=C                                   * 2B56E
        GOSUB   POP1%SPLITA~jump                 * 2B570
        C=RSTK                                   * 2B574
L_2B576:
        HST=0   3                                * 2B576
        GOSBVL  CCSB1                            * 2B579
        ST=1    2                                * 2B580
        GOSBVL  RNDC[B]                          * 2B583
        GOLONG  L_2AEDB                          * 2B58A

* refs (4): 2B52E 2B542 35E45 35EDB
OBJ_2B590:
        CON(5)  (*)+5                            * 2B590  primitive code object
        GOSUB   POP1%SPLITA~jump                 * 2B595
        GOSBVL  CCSB1                            * 2B599
        ST=0    1                                * 2B5A0
        ST=1    2                                * 2B5A3
        P=      0                                * 2B5A6
        LC(2)   #01                              * 2B5A8
        GOSBVL  RNDC[B]                          * 2B5AC
        P=      14                               * 2B5B3
        ?B#0    P                                * 2B5B5
        GOYES   L_2B5C4                          * 2B5B8
        P=      0                                * 2B5BA
        LC(2)   #01                              * 2B5BC
        GOTO    L_2B666                          * 2B5C0
L_2B5C4:
        C=0     W                                * 2B5C4
        P=      13                               * 2B5C7
        LC(2)   #12                              * 2B5C9
        D=C     W                                * 2B5CD
        C=C+1   A                                * 2B5D0
        C=A     S                                * 2B5D2
        P=      3                                * 2B5D5
        ?A=0    S                                * 2B5D7
        GOYES   L_2B5DE                          * 2B5DA
        P=      6                                * 2B5DC
L_2B5DE:
        GOSBVL  TST15                            * 2B5DE
        GOC     L_2B5EF                          * 2B5E5
        GOSBVL  XYEX                             * 2B5E8
L_2B5EF:
        ?A=0    S                                * 2B5EF
        GOYES   L_2B60C                          * 2B5F2
        GOSBVL  RADD1                            * 2B5F4
        P=      14                               * 2B5FB
        ?B#0    P                                * 2B5FD
        GOYES   L_2B60C                          * 2B600
        P=      0                                * 2B602
        LC(2)   #02                              * 2B604
        GOTO    L_2B666                          * 2B608
L_2B60C:
        C=0     W                                * 2B60C
        P=      13                               * 2B60F
        LC(2)   #12                              * 2B611
        ?B#C    W                                * 2B615
        GOYES   L_2B641                          * 2B618
        C=0     A                                * 2B61A
        D0=(5)  #8084E                           * 2B61C
        C=DAT0  1                                * 2B623
        CSL     A                                * 2B627
        D0=(5)  #8084F                           * 2B629
        C=DAT0  1                                * 2B630
        CBIT=0  3                                * 2B634
        CBIT=0  2                                * 2B639
        GONC    L_2B666                          * 2B63E
L_2B641:
        C=B     W                                * 2B641
        CSL     W                                * 2B644
        CSLC                                     * 2B647
        A=A-1   A                                * 2B64A
        GOC     L_2B657                          * 2B64C
        CSLC                                     * 2B64F
        P=      9                                * 2B652
        C+P+1                                    * 2B654
L_2B657:
        CSL     A                                * 2B657
        P=      0                                * 2B659
        LC(1)   #1                               * 2B65B
        ?A=0    S                                * 2B65E
        GOYES   L_2B666                          * 2B661
        LC(1)   #2                               * 2B663
L_2B666:
        R0=C                                     * 2B666
        P=      0                                * 2B669
        SETHEX                                   * 2B66B
        GOVLNG  PUSH#LOOP                        * 2B66D

* refs (1): 2AF56
SUB_2B674:
        GOVLNG  SUB_78A3A                        * 2B674
        BSS     2                                * 2B67B  zeros

* refs (1): 2ABE5
aMODF:
        GOVLNG  aMODF~1                          * 2B67D
        BSS     2                                * 2B684  zeros

* refs (1): 2AE42
SUB_2B686:
        GOVLNG  L_78D53                          * 2B686
        BSS     2                                * 2B68D  zeros

* refs (2): 2AB9D 2ABB0
SUB_2B68F:
        GOVLNG  L_78DBC                          * 2B68F
        BSS     2                                * 2B696  zeros

* refs (4): 2AB64 2AB77 872C6 885E5
SUB_2B698:
        GOVLNG  L_78E05                          * 2B698
        BSS     2                                * 2B69F  zeros

* refs (2): 2AB8A 935F5
SUB_2B6A1:
        GOVLNG  L_791F3                          * 2B6A1
        BSS     2                                * 2B6A8  zeros

* refs (4): 2AB25 2AB38 872D5 885F8
SUB_2B6AA:
        GOVLNG  L_78FCB                          * 2B6AA
        BSS     2                                * 2B6B1  zeros

* refs (1): 2AB4B
SUB_2B6B3:
        GOVLNG  L_78FD5                          * 2B6B3
        BSS     2                                * 2B6BA  zeros

* refs (2): 2AAC0 9030A
SUB_2B6BC:
        GOVLNG  L_79303                          * 2B6BC
        NIBHEX  008DDA39700                      * 2B6C3  .Ø.ε.

* refs (1): 2AAD5
SUB_2B6CE:
        GOVLNG  L_7943E                          * 2B6CE
        BSS     2                                * 2B6D5  zeros

* refs (2): 2AD45 2AD8B
SUB_2B6D7:
        GOVLNG  L_79529                          * 2B6D7
        BSS     2                                * 2B6DE  zeros

* refs (2): 2ABFC 2AC36
SUB_2B6E0:
        GOVLNG  L_7965D                          * 2B6E0
        BSS     2                                * 2B6E7  zeros

* refs (3): 2AC4D 2AC87 CB385
SUB_2B6E9:
        GOVLNG  L_79664                          * 2B6E9
        BSS     2                                * 2B6F0  zeros

* refs (3): 10E20 2AC9E 2ACB7
SUB_2B6F2:
        GOVLNG  L_7966E                          * 2B6F2
        BSS     2                                * 2B6F9  zeros

* refs (1): 2AD2E
SUB_2B6FB:
        GOVLNG  L_79AF5                          * 2B6FB
        BSS     2                                * 2B702  zeros

* refs (2): 2ACCE 2ACE7
SUB_2B704:
        GOVLNG  L_79AFF                          * 2B704
        BSS     2                                * 2B70B  zeros

* refs (2): 2ACFE 2AD17
SUB_2B70D:
        GOVLNG  L_79B06                          * 2B70D
        BSS     2                                * 2B714  zeros

* refs (1): 2AE58
SUB_2B716:
        GOVLNG  L_78AEB                          * 2B716
        BSS     2                                * 2B71D  zeros

* refs (1): 2AE7E
SUB_2B71F:
        GOVLNG  L_78BD4                          * 2B71F
        BSS     2                                * 2B726  zeros

* refs (1): 2AE6B
SUB_2B728:
        GOVLNG  L_78BDB                          * 2B728
        BSS     2                                * 2B72F  zeros

* refs (4): 2AD9E 2ADB7 2ADD0 2ADE3
SUB_2B731:
        GOVLNG  L_79DA9                          * 2B731
        BSS     2                                * 2B738  zeros

* refs (1): 2ADF6
SUB_2B73A:
        GOVLNG  L_79DE2                          * 2B73A
        BSS     2                                * 2B741  zeros

* refs (1): 2AE09
SUB_2B743:
        GOVLNG  L_79DF1                          * 2B743
        BSS     2                                * 2B74A  zeros

* refs (1): 2AE1C
SUB_2B74C:
        GOVLNG  L_79E2D                          * 2B74C
        BSS     2                                * 2B753  zeros

* refs (1): 2AE2F
SUB_2B755:
        GOVLNG  L_79E6A                          * 2B755
        BSS     2                                * 2B75C  zeros

* refs (1): 2AF7C
SUB_2B75E:
        GOVLNG  L_79F90                          * 2B75E
        BSS     2                                * 2B765  zeros

* refs (3): 2AF8F 2AFA2 93611
SUB_2B767:
        GOVLNG  L_79FA6                          * 2B767
        NIBHEX  008D1EE9700                      * 2B76E  .Øá■.

* refs (1): 2AF43
SUB_2B779:
        GOVLNG  SUB_79F51                        * 2B779
        BSS     9                                * 2B780  zeros

* refs (8): 2AEBE 787D3 794AE 79832 7992C 79C18 ...
1/X15:
        HST=0   3                                * 2B789

* refs (1): 79115
SUB_2B78C:
        C=0     W                                * 2B78C
        D=0     W                                * 2B78F
        P=      14                               * 2B792
        D=D+1   P                                * 2B794

* refs (2): 79C07 79DEA
SUB_2B797:
        BCEX    W                                * 2B797
        DCEX    W                                * 2B79A
        BCEX    W                                * 2B79D
        CAEX    W                                * 2B7A0
        GOTO    L_2B971                          * 2B7A3

* x=x-1 see <REF>RADDF
* refs (12): 7884F 78C37 79125 7926B 79FB5 88095 ...
RSUB1:
        C=0     W                                * 2B7A7
        C=-C-1  S                                * 2B7AA
        GONC    L_2B7B3                          * 2B7AD

* x=x+1 see <REF>RADDF
* refs (13): 2B5F4 34AA8 34AB6 34B87 7838F 78CD2 ...
RADD1:
        C=0     W                                * 2B7B0
L_2B7B3:
        P=      14                               * 2B7B3
        D=0     W                                * 2B7B5
        D=D+1   P                                * 2B7B8
        GONC    L_2B7C1                          * 2B7BB

* refs (1): 346DC
SUB_2B7BE:
        XM=0                                     * 2B7BE
L_2B7C1:
        SB=0                                     * 2B7C1
        P=      3                                * 2B7C4
        GOTO    L_2BAA1                          * 2B7C6

* x=x+y
* refs (44): 232E2 2A96A 2BACB 2D0FB 34C65 35A3B ...
RADDF:
        P=      3                                * 2B7CA
        GOTO    L_2B7DE                          * 2B7CC
L_2B7D0:
        XM=0                                     * 2B7D0
L_2B7D3:
        SB=0                                     * 2B7D3
        P=      0                                * 2B7D6
        GOTO    L_2BAA1                          * 2B7D8

* refs (4): 2A990 2AA45 2BAC2 795B2
ADDF:
        P=      0                                * 2B7DC
L_2B7DE:
        SB=0                                     * 2B7DE
        BCEX    W                                * 2B7E1
        C=P     15                               * 2B7E4
        CD0EX                                    * 2B7E8
        P=      4                                * 2B7EB
        LC(1)   #5                               * 2B7ED
        A=A+C   P                                * 2B7F0
        B=B+C   P                                * 2B7F3
        P=      0                                * 2B7F6
        CD0EX                                    * 2B7F8
        D=0     S                                * 2B7FB
        CPEX    15                               * 2B7FE
        ?D=0    W                                * 2B802
        GOYES   L_2B812                          * 2B805
        ?C#0    W                                * 2B807
        GOYES   L_2B823                          * 2B80A
        ABEX    W                                * 2B80C
        DCEX    W                                * 2B80F
L_2B812:
        ?P=     3                                * 2B812
        GOYES   L_2B81D                          * 2B815
        P=      0                                * 2B817
        GOTO    L_2B8DB                          * 2B819
L_2B81D:
        P=      0                                * 2B81D
        GOTO    L_2B898                          * 2B81F
L_2B823:
        ?A>B    A                                * 2B823
        GOYES   L_2B841                          * 2B826
        ?A<B    A                                * 2B828
        GOYES   L_2B83B                          * 2B82B
        ?D<=C   W                                * 2B82D
        GOYES   L_2B84B                          * 2B830
        ABEX    S                                * 2B832
        DCEX    W                                * 2B835
        GONC    L_2B84B                          * 2B838
L_2B83B:
        ABEX    W                                * 2B83B
        DCEX    W                                * 2B83E
L_2B841:
        ?A=B    S                                * 2B841
        GOYES   L_2B84B                          * 2B844
        CSL     W                                * 2B846
        A=A-1   A                                * 2B849
L_2B84B:
        B=B-A   A                                * 2B84B
        B=-B    A                                * 2B84D
        D0=C                                     * 2B84F
        C=0     A                                * 2B852
        ?P=     0                                * 2B854
        GOYES   L_2B8BB                          * 2B857
        P=      0                                * 2B859
        LC(2)   #15                              * 2B85B
        C=C-B   A                                * 2B85F
        GOC     L_2B87C                          * 2B861
        ?C=0    A                                * 2B864
        GOYES   L_2B872                          * 2B867
        CD0EX                                    * 2B869
        DCEX    W                                * 2B86C
        GONC    L_2B890                          * 2B86F
L_2B872:
        DCEX    M                                * 2B872
        P=C     14                               * 2B875
        DCEX    M                                * 2B879
L_2B87C:
        CD0EX                                    * 2B87C
        D=0     W                                * 2B87F
        D=D+1   A                                * 2B882
        DSR     A                                * 2B884
        GONC    L_2B898                          * 2B886
L_2B889:
        P=C     0                                * 2B889
        CSR     W                                * 2B88D
L_2B890:
        B=B-1   A                                * 2B890
        GONC    L_2B889                          * 2B892
        DCEX    W                                * 2B895
L_2B898:
        CPEX    15                               * 2B898
        C=C+C   S                                * 2B89C
        C=P     15                               * 2B89F
        GONC    L_2B8A9                          * 2B8A3
        D=D+1   W                                * 2B8A6
L_2B8A9:
        ?A=B    S                                * 2B8A9
        GOYES   L_2B8B4                          * 2B8AC
        C=C-D   W                                * 2B8AE
        GONC    L_2B906                          * 2B8B1
L_2B8B4:
        C=C+D   W                                * 2B8B4
        GOTO    L_2B906                          * 2B8B7
L_2B8BB:
        P=      0                                * 2B8BB
        LC(2)   #14                              * 2B8BD
        C=C-B   A                                * 2B8C1
        CD0EX                                    * 2B8C3
        GONC    L_2B8D6                          * 2B8C6
        D=0     W                                * 2B8C9
        D=D+1   A                                * 2B8CC
        DSR     A                                * 2B8CE
        GONC    L_2B8DB                          * 2B8D0
L_2B8D3:
        DSR     W                                * 2B8D3
L_2B8D6:
        B=B-1   A                                * 2B8D6
        GONC    L_2B8D3                          * 2B8D8
L_2B8DB:
        ?A=B    S                                * 2B8DB
        GOYES   L_2B903                          * 2B8DE
        ?SB=0                                    * 2B8E0
        GOYES   L_2B8E8                          * 2B8E3
        D=D+1   W                                * 2B8E5
L_2B8E8:
        C=C-D   W                                * 2B8E8
        ?C#0    W                                * 2B8EB
        GOYES   L_2B906                          * 2B8EE
        A=0     S                                * 2B8F0
        ?ST=0   10                               * 2B8F3
        GOYES   L_2B906                          * 2B8F6
        ?ST=0   11                               * 2B8F8
        GOYES   L_2B906                          * 2B8FB
        A=-A-1  S                                * 2B8FD
        GONC    L_2B906                          * 2B900
L_2B903:
        C=C+D   W                                * 2B903
L_2B906:
        B=C     W                                * 2B906
        P=      4                                * 2B909
        LC(1)   #5                               * 2B90B
        A=A-C   P                                * 2B90E
        GOTO    L_2B95E                          * 2B911

* refs (3): 7927C 7937F 79917
SUB_2B915:
        HST=0   3                                * 2B915
        P=      1                                * 2B918
        GOTO    L_2BAA1                          * 2B91A

* x=x*y
* refs (29): 2A9B2 2A9DE 2BAD4 346BA 35A2D 35A54 ...
MULTF:
        BCEX    W                                * 2B91E
        C=0     S                                * 2B921
        D=0     S                                * 2B924
        A=A+B   A                                * 2B927
        A=B-A   S                                * 2B929
        GONC    L_2B932                          * 2B92C
        A=-A    S                                * 2B92F
L_2B932:
        B=0     W                                * 2B932
        ?C=0    W                                * 2B935
        GOYES   L_2B968                          * 2B938
        ?D=0    W                                * 2B93A
        GOYES   L_2B968                          * 2B93D
        P=      15                               * 2B93F
L_2B941:
        P=P+1                                    * 2B941
        BSR     W                                * 2B943
        GOTO    L_2B94D                          * 2B946
L_2B94A:
        B=B+C   W                                * 2B94A
L_2B94D:
        D=D-1   P                                * 2B94D
        GONC    L_2B94A                          * 2B950
        ?P#     14                               * 2B953
        GOYES   L_2B941                          * 2B956
        C=B     W                                * 2B958
        D=C     W                                * 2B95B
L_2B95E:
        ?B=0    S                                * 2B95E
        GOYES   L_2B968                          * 2B961
        A=A+1   A                                * 2B963
        BSR     W                                * 2B965
L_2B968:
        GOLONG  L_2BC7E                          * 2B968

* refs (1): 79560
SUB_2B96E:
        HST=0   3                                * 2B96E
L_2B971:
        P=      2                                * 2B971
        GOTO    L_2BAA1                          * 2B973

* x=x/y
* refs (18): 2A9F4 2AA55 2BAD8 2CE67 34C73 535A0 ...
DIVF:
        BCEX    W                                * 2B977

* refs (1): 798DF
SUB_2B97A:
        C=0     S                                * 2B97A
        D=0     S                                * 2B97D
        ?D#0    W                                * 2B980
        GOYES   L_2B9B9                          * 2B983
        ?C#0    W                                * 2B985
        GOYES   L_2B994                          * 2B988
        P=      0                                * 2B98A
        LC(2)   #07                              * 2B98C
        GOTO    L_2BB53                          * 2B990
L_2B994:
        A=A-B   S                                * 2B994
        GONC    L_2B99D                          * 2B997
        A=-A    S                                * 2B99A
L_2B99D:
        P=      0                                * 2B99D
        LC(2)   #08                              * 2B99F
L_2B9A3:
        A=0     A                                * 2B9A3
        A=C     B                                * 2B9A5
        LC(3)   #F00                             * 2B9A8
        CAEX    A                                * 2B9AD
        B=0     W                                * 2B9AF
        B=-B-1  M                                * 2B9B2
        P=      3                                * 2B9B5
        RTNSXM                                   * 2B9B7
L_2B9B9:
        A=A-B   A                                * 2B9B9
        A=A-B   S                                * 2B9BB
        GONC    L_2B9C4                          * 2B9BE
        A=-A    S                                * 2B9C1
L_2B9C4:
        ?D<=C   W                                * 2B9C4
        GOYES   L_2B9CE                          * 2B9C7
        CSL     W                                * 2B9C9
        A=A-1   A                                * 2B9CC
L_2B9CE:
        P=      14                               * 2B9CE
        B=0     W                                * 2B9D0
        ?C=0    W                                * 2B9D3
        GOYES   L_2B9EF                          * 2B9D6
        B=B-1   P                                * 2B9D8
L_2B9DB:
        B=B+1   P                                * 2B9DB
L_2B9DE:
        C=C-D   W                                * 2B9DE
        GONC    L_2B9DB                          * 2B9E1
        C=C+D   W                                * 2B9E4
        CSL     W                                * 2B9E7
        P=P-1                                    * 2B9EA
        GONC    L_2B9DE                          * 2B9EC
L_2B9EF:
        GOTO    L_2BA91                          * 2B9EF

* refs (4): 2AAFF 2AB12 2CD90 79925
SUB_2B9F3:
        HST=0   3                                * 2B9F3
        SETHEX                                   * 2B9F6
        A=A+1   XS                               * 2B9F8
        A=A-1   XS                               * 2B9FB
        SETDEC                                   * 2B9FE
        GONC    SQRF                             * 2BA00
        ?A#0    B                                * 2BA03
        RTNYES                                   * 2BA06
        ?A#0    S                                * 2BA08
        GOYES   L_2BA1F                          * 2BA0B
        RTN                                      * 2BA0D

* refs (9): 2BA00 34AAF 34B0F 78892 79BFC 79E0E ...
SQRF:
        B=0     S                                * 2BA0F
        C=B     W                                * 2BA12
        ?B=0    W                                * 2BA15
        GOYES   L_2BA8E                          * 2BA18
        ?A=0    S                                * 2BA1A
        GOYES   L_2BA29                          * 2BA1D
L_2BA1F:
        P=      0                                * 2BA1F
        LC(2)   #0A                              * 2BA21
        GOTO    L_2BB53                          * 2BA25
L_2BA29:
        B=B+B   W                                * 2BA29
        B=B+B   W                                * 2BA2C
        B=B+C   W                                * 2BA2F
        C=A     A                                * 2BA32
        C=C+C   A                                * 2BA34
        C=0     M                                * 2BA36
        GONC    L_2BA3F                          * 2BA39
        C=-C-1  M                                * 2BA3C
L_2BA3F:
        C=A     A                                * 2BA3F
        A=C     W                                * 2BA41
        C=C+C   W                                * 2BA44
        C=C+C   W                                * 2BA47
        A=A+C   W                                * 2BA4A
        P=      0                                * 2BA4D
        A=A-1   P                                * 2BA4F
        ASR     W                                * 2BA52
        GONC    L_2BA63                          * 2BA55
        ?B=0    P                                * 2BA58
        GOYES   L_2BA60                          * 2BA5B
        A=A+1   S                                * 2BA5D
L_2BA60:
        BSR     W                                * 2BA60
L_2BA63:
        C=0     W                                * 2BA63
        P=      14                               * 2BA66
        LC(1)   #5                               * 2BA68
        BCEX    W                                * 2BA6B
L_2BA6E:
        BSR     WP                               * 2BA6E
        B=B-1   P                                * 2BA71
L_2BA74:
        B=B+1   P                                * 2BA74
        C=C-B   W                                * 2BA77
        GONC    L_2BA74                          * 2BA7A
        C=C+B   W                                * 2BA7D
        CSL     W                                * 2BA80
        P=P-1                                    * 2BA83
        GONC    L_2BA6E                          * 2BA85
        C=A     S                                * 2BA88
        A=0     S                                * 2BA8B
L_2BA8E:
        SB=0                                     * 2BA8E
L_2BA91:
        ?C=0    W                                * 2BA91
        GOYES   L_2BA9F                          * 2BA94
        C=0     XS                               * 2BA96
        C=C-1   XS                               * 2BA99
        CSR     XS                               * 2BA9C
L_2BA9F:
        RTNCC                                    * 2BA9F
L_2BAA1:
        B=0     S                                * 2BAA1
        D=0     S                                * 2BAA4
        SETHEX                                   * 2BAA7
        C=C+1   XS                               * 2BAA9
        C=C-1   XS                               * 2BAAC
        GOC     L_2BAFF                          * 2BAAF
        A=A+1   XS                               * 2BAB2
        A=A-1   XS                               * 2BAB5
        SETDEC                                   * 2BAB8
        GOC     L_2BADC                          * 2BABA
        ?P#     0                                * 2BABD
        GOYES   L_2BAC6                          * 2BAC0
        GOTO    ADDF                             * 2BAC2
L_2BAC6:
        ?P#     3                                * 2BAC6
        GOYES   L_2BACF                          * 2BAC9
        GOTO    RADDF                            * 2BACB
L_2BACF:
        ?P#     1                                * 2BACF
        GOYES   L_2BAD8                          * 2BAD2
        GOTO    MULTF                            * 2BAD4
L_2BAD8:
        GOTO    DIVF                             * 2BAD8
L_2BADC:
        ?A#0    B                                * 2BADC
        RTNYES                                   * 2BADF
        ?P=     2                                * 2BAE1
        GOYES   L_2BB29                          * 2BAE4
        ?P=     0                                * 2BAE6
        RTNYES                                   * 2BAE9
        ?P=     3                                * 2BAEB
        RTNYES                                   * 2BAEE
        ?D#0    W                                * 2BAF0
        GOYES   L_2BB29                          * 2BAF3
L_2BAF5:
        P=      0                                * 2BAF5
        LC(2)   #10                              * 2BAF7
        GOTO    L_2BB53                          * 2BAFB
L_2BAFF:
        SETDEC                                   * 2BAFF
        ?C=A    XS                               * 2BB01
        GOYES   L_2BB34                          * 2BB04
        ?C#0    B                                * 2BB06
        GOYES   L_2BB6B                          * 2BB09
        ?P=     2                                * 2BB0B
        GOYES   L_2BB24                          * 2BB0E
        ?P=     0                                * 2BB10
        GOYES   L_2BB6B                          * 2BB13
        ?P=     3                                * 2BB15
        GOYES   L_2BB6B                          * 2BB18
        ?B=0    W                                * 2BB1A
        GOYES   L_2BAF5                          * 2BB1D
        A=C     A                                * 2BB1F
        GONC    L_2BB29                          * 2BB21
L_2BB24:
        A=0     A                                * 2BB24
        B=0     W                                * 2BB26
L_2BB29:
        A=A-C   S                                * 2BB29
        RTNNC                                    * 2BB2C
        A=-A    S                                * 2BB2F
        RTN                                      * 2BB32
L_2BB34:
        ?C#0    B                                * 2BB34
        GOYES   L_2BB66                          * 2BB37
        ?A#0    B                                * 2BB39
        RTNYES                                   * 2BB3C
        ?P=     0                                * 2BB3E
        GOYES   L_2BB59                          * 2BB41
        ?P=     3                                * 2BB43
        GOYES   L_2BB59                          * 2BB46
        ?P=     1                                * 2BB48
        GOYES   L_2BB29                          * 2BB4B
        P=      0                                * 2BB4D
        LC(2)   #0E                              * 2BB4F
L_2BB53:
        GOLONG  L_2BB8C                          * 2BB53
L_2BB59:
        P=      0                                * 2BB59
        LC(2)   #0F                              * 2BB5B
        ?C#A    S                                * 2BB5F
        GOYES   L_2BB53                          * 2BB62
        RTN                                      * 2BB64
L_2BB66:
        ?A#0    B                                * 2BB66
        GOYES   L_2BB72                          * 2BB69
L_2BB6B:
        GOVLNG  XYEX                             * 2BB6B
L_2BB72:
        DCEX    W                                * 2BB72
        ?B>C    XS                               * 2BB75
        GOYES   L_2BB84                          * 2BB78
        ?B<C    XS                               * 2BB7A
        RTNYES                                   * 2BB7D
        ?B>C    M                                * 2BB7F
        GOYES   L_2BB84                          * 2BB82
L_2BB84:
        DCEX    W                                * 2BB84
        GOC     L_2BB6B                          * 2BB87  never taken
        RTN                                      * 2BB8A
L_2BB8C:
        B=0     W                                * 2BB8C
        B=C     B                                * 2BB8F
        A=0     W                                * 2BB92
        P=      0                                * 2BB95
        LC(3)   #F01                             * 2BB97
        A=C     X                                * 2BB9C
        C=B     A                                * 2BB9F
L_2BBA1:
        P=P+1                                    * 2BBA1
        BSRC                                     * 2BBA3
        ?P#     5                                * 2BBA6
        GOYES   L_2BBA1                          * 2BBA9
        B=-B-1  XS                               * 2BBAB
        SB=0                                     * 2BBAE
        P=      4                                * 2BBB1
        RTNSXM                                   * 2BBB3

* refs (4): 7826A 93603 99CD7 CB449
DIV2:
        P=      14                               * 2BBB5
        ?B=0    P                                * 2BBB7
        RTNYES                                   * 2BBBA
L_2BBBC:
        B=0     S                                * 2BBBC
        A=A-1   A                                * 2BBBF
        C=B     W                                * 2BBC1
        B=B+B   W                                * 2BBC4
        B=B+B   W                                * 2BBC7
        B=B+C   W                                * 2BBCA
L_2BBCD:
        ?B=0    S                                * 2BBCD
        RTNYES                                   * 2BBD0
        BSR     W                                * 2BBD2
        A=A+1   A                                * 2BBD5
        RTNSC                                    * 2BBD7
L_2BBD9:
        B=0     S                                * 2BBD9
        B=B+B   W                                * 2BBDC
        GONC    L_2BBCD                          * 2BBDF

* refs (7): 0CE21 0EEF7 2AF69 78811 79361 79D86 ...
CLRFRC:
        GOSUB   SUB_2BBFC                        * 2BBE2
        ?P=     15                               * 2BBE6
        RTNYES                                   * 2BBE9
        ?B=0    WP                               * 2BBEB
        RTNYES                                   * 2BBEE
        B=0     WP                               * 2BBF0
        ?P#     14                               * 2BBF3
        GOYES   L_2BBFA                          * 2BBF6
        A=0     A                                * 2BBF8
L_2BBFA:
        RTNCC                                    * 2BBFA

* refs (6): 2BBE2 35242 78A4F 793E2 794C1 79EEF
SUB_2BBFC:
        SETHEX                                   * 2BBFC
        A=A+1   XS                               * 2BBFE
        A=A-1   XS                               * 2BC01
        SETDEC                                   * 2BC04
        GOC     L_2BC46                          * 2BC06

* refs (1): 78D31
SUB_2BC09:
        SETDEC                                   * 2BC09
        P=      14                               * 2BC0B
        ?B#0    P                                * 2BC0D
        GOYES   L_2BC14                          * 2BC10
        A=0     A                                * 2BC12
L_2BC14:
        P=      0                                * 2BC14
        C=0     A                                * 2BC16
        LC(2)   #13                              * 2BC18
        C=C-A   A                                * 2BC1C
        GOC     L_2BC33                          * 2BC1E
        P=      1                                * 2BC21
        ?C=0    P                                * 2BC23
        GOYES   L_2BC2D                          * 2BC26
        P=      9                                * 2BC28
        C+P+1                                    * 2BC2A
L_2BC2D:
        P=C     0                                * 2BC2D
        RTN                                      * 2BC31
L_2BC33:
        C=C+1   A                                * 2BC33
        GOC     L_2BC46                          * 2BC35
        LC(5)   #50000                           * 2BC38
        P=      14                               * 2BC3F
        ?C<=A   A                                * 2BC41
        RTNYES                                   * 2BC44
L_2BC46:
        P=      15                               * 2BC46
        RTN                                      * 2BC48

* ( A -> x ) Convert % to %%
* refs (19): 0DAFE 0EEF0 233CD 29FD4 2BCA4 2D084 ...
SPLITA:
        SETDEC                                   * 2BC4A
        ABEX    M                                * 2BC4C
        B=A     X                                * 2BC4F
        A=A+A   XS                               * 2BC52
        A=0     A                                * 2BC55
        GONC    L_2BC5C                          * 2BC57
        A=A-1   A                                * 2BC5A
L_2BC5C:
        A=B     X                                * 2BC5C
        B=0     X                                * 2BC5F

* refs (2): 791F3 79319
SUB_2BC62:
        SETHEX                                   * 2BC62
        A=A+1   XS                               * 2BC64
        A=A-1   XS                               * 2BC67
        SETDEC                                   * 2BC6A
        GONC    L_2BC77                          * 2BC6C
        A=0     M                                * 2BC6F
        B=A     XS                               * 2BC72
        RTNSC                                    * 2BC75
L_2BC77:
        B=C     S                                * 2BC77
        CPEX    15                               * 2BC7A
L_2BC7E:
        P=      14                               * 2BC7E
        ?B=0    WP                               * 2BC80
        GOYES   L_2BC93                          * 2BC83
L_2BC85:
        ?B#0    P                                * 2BC85
        GOYES   L_2BC95                          * 2BC88
        A=A-1   A                                * 2BC8A
        BSL     WP                               * 2BC8C
        GOTO    L_2BC85                          * 2BC8F
L_2BC93:
        A=0     A                                * 2BC93
L_2BC95:
        P=      0                                * 2BC95
        CPEX    15                               * 2BC97
        BCEX    S                                * 2BC9B
        RTNCC                                    * 2BC9E

* ( A,C -> x, y ) Convert 2 reals to long reals
* refs (7): 29FFC 34C5B 35AE7 5314D 5357D 5358B ...
SPLTAC:
        D=C     A                                * 2BCA0
        C=RSTK                                   * 2BCA2
        GOSUB   SPLITA                           * 2BCA4
        RSTK=C                                   * 2BCA8
        C=D     A                                * 2BCAA

* refs (7): 232D0 232F9 2CFED 344FB 535AE 78556 ...
SUB_2BCAC:
        SETDEC                                   * 2BCAC
        DCEX    M                                * 2BCAE
        D=C     X                                * 2BCB1
        C=C+C   XS                               * 2BCB4
        C=0     A                                * 2BCB7
        GONC    L_2BCBE                          * 2BCB9
        C=C-1   A                                * 2BCBC
L_2BCBE:
        C=D     X                                * 2BCBE
        D=0     X                                * 2BCC1

* refs (1): 79326
SUB_2BCC4:
        SETHEX                                   * 2BCC4
        C=C+1   XS                               * 2BCC6
        C=C-1   XS                               * 2BCC9
        SETDEC                                   * 2BCCC
        GONC    L_2BCD9                          * 2BCCE
        C=0     M                                * 2BCD1
        D=C     XS                               * 2BCD4
        RTNSC                                    * 2BCD7
L_2BCD9:
        D=C     S                                * 2BCD9
        CPEX    15                               * 2BCDC
        P=      14                               * 2BCE0
        ?D=0    WP                               * 2BCE2
        GOYES   L_2BCF5                          * 2BCE5
L_2BCE7:
        ?D#0    P                                * 2BCE7
        GOYES   L_2BCF7                          * 2BCEA
        C=C-1   A                                * 2BCEC
        DSL     WP                               * 2BCEE
        GOTO    L_2BCE7                          * 2BCF1
L_2BCF5:
        C=0     A                                * 2BCF5
L_2BCF7:
        P=      0                                * 2BCF7
        CPEX    15                               * 2BCF9
        DCEX    S                                * 2BCFD
        RTNCC                                    * 2BD00

* refs (3): 2BD8A 34675 7962B
SUB_2BD02:
        SETHEX                                   * 2BD02
        A=A+1   XS                               * 2BD04
        A=A-1   XS                               * 2BD07
        SETDEC                                   * 2BD0A
        RTN                                      * 2BD0C

* refs (3): 2BDDB 792EE 79351
SUB_2BD0E:
        SETHEX                                   * 2BD0E
        C=C+1   XS                               * 2BD10
        C=C-1   XS                               * 2BD13
        SETDEC                                   * 2BD16
        RTN                                      * 2BD18

* refs (3): 2BD57 2BD60 2BD6B
SUB_2BD1A:
        BCEX    XS                               * 2BD1A
        P=      5                                * 2BD1D
        CPEX    2                                * 2BD1F
        A=A+C   XS                               * 2BD23
        B=B+C   XS                               * 2BD26
        CPEX    2                                * 2BD29
        BCEX    XS                               * 2BD2D
        RTN                                      * 2BD30

* refs (2): 0CCA9 0E6BB
Y<=X:
        ?C#A    S                                * 2BD32
        GOYES   L_2BD6F                          * 2BD35
        P=      14                               * 2BD37
        ?A=0    P                                * 2BD39
        RTNYES                                   * 2BD3C
        ?C#0    P                                * 2BD3E
        GOYES   L_2BD45                          * 2BD41
        RTN                                      * 2BD43
L_2BD45:
        ?C#A    X                                * 2BD45
        GOYES   L_2BD57                          * 2BD48
        ?C<A    M                                * 2BD4A
        GOYES   L_2BD6F                          * 2BD4D
        ?C=A    M                                * 2BD4F
        RTNYES                                   * 2BD52
        GONC    L_2BD64                          * 2BD54
L_2BD57:
        GOSUB   SUB_2BD1A                        * 2BD57
        ?C<A    X                                * 2BD5B
        GOYES   L_2BD6B                          * 2BD5E
        GOSUB   SUB_2BD1A                        * 2BD60
L_2BD64:
        ?A=0    S                                * 2BD64
        RTNYES                                   * 2BD67
        RTN                                      * 2BD69
L_2BD6B:
        GOSUB   SUB_2BD1A                        * 2BD6B
L_2BD6F:
        ?A#0    S                                * 2BD6F
        RTNYES                                   * 2BD72
        RTN                                      * 2BD74

* refs (15): 23309 2A82A 2B5DE 2CFFD 34CA0 377A1 ...
TST15:
        D=C     S                                * 2BD76
        CPEX    15                               * 2BD79
        DCEX    S                                * 2BD7D
        GOSUB   A+5P4                            * 2BD80
        GOSUB   A+5P_2BE40                       * 2BD84
        P=      8                                * 2BD88
        GOSUBL  SUB_2BD02                        * 2BD8A
        GONC    L_2BDDB                          * 2BD90
        BCEX    W                                * 2BD93
        ?A#0    B                                * 2BD96
        GOYES   L_2BDB1                          * 2BD99
        ?A#B    XS                               * 2BD9B
        GOYES   L_2BDAA                          * 2BD9E
        ?B#0    B                                * 2BDA0
        GOYES   L_2BDB1                          * 2BDA3
        ?A=B    S                                * 2BDA5
        GOYES   L_2BE0B                          * 2BDA8
L_2BDAA:
        ?A=0    S                                * 2BDAA
        GOYES   L_2BDF1                          * 2BDAD
L_2BDAF:
        P=      1                                * 2BDAF
L_2BDB1:
        CPEX    15                               * 2BDB1
        D=D&C   S                                * 2BDB5
        BCEX    W                                * 2BDB9
        GOSUB   A+5P4                            * 2BDBC
        GOSUB   A+5P_2BE40                       * 2BDC0
        BCEX    S                                * 2BDC4
        P=C     15                               * 2BDC7
        C=0     S                                * 2BDCB
        BCEX    S                                * 2BDCE
        ?D#0    S                                * 2BDD1
        GOYES   L_2BDD6                          * 2BDD4
L_2BDD6:
        D=0     S                                * 2BDD6
        RTN                                      * 2BDD9
L_2BDDB:
        GOSUBL  SUB_2BD0E                        * 2BDDB
        BCEX    W                                * 2BDE1
        GONC    L_2BDF7                          * 2BDE4
        ?B#0    B                                * 2BDE7
        GOYES   L_2BDB1                          * 2BDEA
L_2BDEC:
        ?B=0    S                                * 2BDEC
        GOYES   L_2BDAF                          * 2BDEF
L_2BDF1:
        P=      4                                * 2BDF1
        GOTO    L_2BDB1                          * 2BDF3
L_2BDF7:
        P=      14                               * 2BDF7
        ?C=0    WP                               * 2BDF9
        GOYES   L_2BE06                          * 2BDFC
        ?D#0    WP                               * 2BDFE
        GOYES   L_2BE11                          * 2BE01
        GONC    L_2BDAA                          * 2BE03
L_2BE06:
        ?D#0    WP                               * 2BE06
        GOYES   L_2BDEC                          * 2BE09
L_2BE0B:
        P=      2                                * 2BE0B
        GOTO    L_2BDB1                          * 2BE0D
L_2BE11:
        ?A#B    S                                * 2BE11
        GOYES   L_2BDAA                          * 2BE14
        ?A>B    A                                * 2BE16
        GOYES   L_2BDAA                          * 2BE19
        ?A<B    A                                * 2BE1B
        GOYES   L_2BDEC                          * 2BE1E
        ?D<C    WP                               * 2BE20
        GOYES   L_2BDAA                          * 2BE23
        ?D>C    WP                               * 2BE25
        GOYES   L_2BDEC                          * 2BE28
        GONC    L_2BE0B                          * 2BE2A

* refs (2): 2BD80 2BDBC
A+5P4:
        P=      4                                * 2BE2D

A+5P:
        A=A+1   P                                * 2BE2F

A+4P:
        A=A+1   P                                * 2BE32

A+3P:
        A=A+1   P                                * 2BE35

A+2P:
        A=A+1   P                                * 2BE38
        A=A+1   P                                * 2BE3B
        RTN                                      * 2BE3E

* refs (2): 2BD84 2BDC0
A+5P_2BE40:
        P=      4                                * 2BE40

A+5P_2BE42:
        C=C+1   P                                * 2BE42

A+4P_2BE45:
        C=C+1   P                                * 2BE45

A+3P_2BE48:
        C=C+1   P                                * 2BE48

A+2P_2BE4B:
        C=C+1   P                                * 2BE4B
        C=C+1   P                                * 2BE4E
        RTN                                      * 2BE51

* A:B <-> C:D
* refs (24): 0CE43 2AA14 2ABD2 2B5E8 2BB6B 2BF15 ...
XYEX:
        BCEX    W                                * 2BE53
        DCEX    W                                * 2BE56
        BCEX    W                                * 2BE59
        CAEX    W                                * 2BE5C
        RTN                                      * 2BE5F

* A.W -> R0 \ B.W -> R1
* refs (22): 2AA39 34C7A 35A42 3725A 37291 535B5 ...
STAB0:
        R0=A                                     * 2BE61
        ABEX    W                                * 2BE64
        R1=A                                     * 2BE67
        ABEX    W                                * 2BE6A
        RTN                                      * 2BE6D

* A.W -> R2 \ B.W -> R3
* refs (22): 2CE3B 2D1A8 34C81 35A69 535BC 786FD ...
STAB2:
        R2=A                                     * 2BE6F
        ABEX    W                                * 2BE72
        R3=A                                     * 2BE75
        ABEX    W                                * 2BE78

SavC0D1:
        RTN                                      * 2BE7B

* C.W -> R0 \ B.W -> R1
* refs (10): 53167 53207 78BE1 795F3 7DAF9 873C3 ...
STCD0:
        R0=C                                     * 2BE7D
        DCEX    W                                * 2BE80
        R1=C                                     * 2BE83
        DCEX    W                                * 2BE86
        RTN                                      * 2BE89

* C.W -> R2 \ B.W -> R3
* refs (17): 34A68 35764 377AB 3781C 378E0 53280 ...
* a branch also enters #2BE8D, where the nibbles decode as DCEX XS
STCD2:
        R2=C                                     * 2BE8B
* the rest of DCEX XS at #2BE8D
* a branch also enters #2BE8E, where the nibbles decode as DCEX W
        NIBHEX  AF                               * 2BE8E  ú
* the rest of DCEX W at #2BE8E
        NIBHEX  F                                * 2BE90
        R3=C                                     * 2BE91
        DCEX    W                                * 2BE94
        RTN                                      * 2BE97

* A.W <-> R0 B.W <-> R1
* refs (18): 34B16 34B42 34B59 53175 78924 79616 ...
EXAB0:
        AR0EX                                    * 2BE99
        ABEX    W                                * 2BE9C
        AR1EX                                    * 2BE9F
        ABEX    W                                * 2BEA2
        RTN                                      * 2BEA5

* A.W <-> R2 B.W <-> R3
* refs (11): 2CD64 34A7B 531A3 7892B 7961D 87FCB ...
EXAB2:
        AR2EX                                    * 2BEA7
        ABEX    W                                * 2BEAA
        AR3EX                                    * 2BEAD
        ABEX    W                                * 2BEB0
        RTN                                      * 2BEB3

* R0 -> A.W \ R1 -> B.W
* refs (21): 2AB51 2ADA4 2ADBD 2D23E 34B01 5320E ...
RCAB0:
        A=R1                                     * 2BEB5
        B=A     W                                * 2BEB8
        A=R0                                     * 2BEBB
        RTN                                      * 2BEBE

* R2 -> A.W \ R3 -> B.W
* refs (15): 35772 37798 535C3 7893C 79601 7D7EC ...
RCAB2:
        A=R3                                     * 2BEC0
        B=A     W                                * 2BEC3
        A=R2                                     * 2BEC6
        RTN                                      * 2BEC9

* R0 -> C.W \ R1 -> D.W
* refs (25): 2AA4B 2CE59 34C6C 34C88 35A34 37137 ...
RCCD0:
        C=R1                                     * 2BECB
        D=C     W                                * 2BECE
        C=R0                                     * 2BED1
        RTN                                      * 2BED4

* R2 -> C.W \ R3 -> D.W
* refs (24): 2D0F1 34C8F 35A5B 37842 37926 535D1 ...
RCCD2:
        C=R3                                     * 2BED6
        D=C     W                                * 2BED9
        C=R2                                     * 2BEDC
        RTN                                      * 2BEDF

* Uses D.S to set SB, clears carry
* refs (4): 2B579 2B599 99534 9956D
CCSB1:
        D=0     S                                * 2BEE1
        D=D+1   S                                * 2BEE4
        DSR     S                                * 2BEE7
        RTNCC                                    * 2BEEA

* refs (3): 2B583 2B5AC 99566
RNDC[B]:
        P=      0                                * 2BEEC
        C=C-1   P                                * 2BEEE
        GOC     L_2BF1C                          * 2BEF1
        CPEX    1                                * 2BEF4
        C=C-1   B                                * 2BEF8
        GOC     L_2BF22                          * 2BEFB
        C=P     0                                * 2BEFE
        P=      2                                * 2BF02
        C+P+1                                    * 2BF04
        SETHEX                                   * 2BF07
        C=-C    A                                * 2BF09
        SETDEC                                   * 2BF0B
        P=C     0                                * 2BF0D
L_2BF11:
        GOSUB   SUB_2BF83                        * 2BF11

* refs (1): 2BF73
XYEX~jump:
        GOVLNG  XYEX                             * 2BF15
L_2BF1C:
        P=      2                                * 2BF1C
        GOTO    L_2BF11                          * 2BF1E
L_2BF22:
        C=P     15                               * 2BF22

* refs (1): 98699
SUB_2BF26:
        P=      14                               * 2BF26
        ?B#0    P                                * 2BF28
        GOYES   L_2BF2F                          * 2BF2B
        RTN                                      * 2BF2D
L_2BF2F:
        P=P-1                                    * 2BF2F
        C=C-1   S                                * 2BF31
        GONC    L_2BF2F                          * 2BF34
        C=A     A                                * 2BF37
        C=C+C   A                                * 2BF39
        C=A     A                                * 2BF3B
        GONC    L_2BF6A                          * 2BF3D
L_2BF40:
        P=P+1                                    * 2BF40
        ?P=     15                               * 2BF42
        GOYES   L_2BF4F                          * 2BF45
        C=C+1   A                                * 2BF47
        GONC    L_2BF40                          * 2BF49
        GOC     L_2BF6F                          * 2BF4C
L_2BF4F:
        ?ST=0   2                                * 2BF4F
        RTNYES                                   * 2BF52
        A=0     W                                * 2BF54
        B=0     W                                * 2BF57
L_2BF5A:
        D=0     S                                * 2BF5A
        D=D+1   S                                * 2BF5D
        DSR     S                                * 2BF60
        RTNCC                                    * 2BF63
L_2BF65:
        P=P-1                                    * 2BF65
        RTNC                                     * 2BF67
L_2BF6A:
        C=C-1   A                                * 2BF6A
        GONC    L_2BF65                          * 2BF6C
L_2BF6F:
        GOSUB   SUB_2BF83                        * 2BF6F
        GOSUB   XYEX~jump                        * 2BF73
        ?ST=1   7                                * 2BF77
        GOYES   L_2BF5A                          * 2BF7A
        SB=0                                     * 2BF7C
        RTNCC                                    * 2BF7F

* refs (2): 37791 93DA3
SUB_2BF81:
        P=      2                                * 2BF81

* refs (2): 2BF11 2BF6F
SUB_2BF83:
        ST=0    7                                * 2BF83
        C=B     W                                * 2BF86
        C=0     S                                * 2BF89
        ?C#0    WP                               * 2BF8C
        GOYES   L_2BF96                          * 2BF8F
        ?SB=0                                    * 2BF91
        GOYES   L_2BFBB                          * 2BF94
L_2BF96:
        ST=1    7                                * 2BF96
        ?ST=1   1                                * 2BF99
        GOYES   L_2BFA4                          * 2BF9C
        C=C+C   WP                               * 2BF9E
        GOC     L_2BFAB                          * 2BFA1
L_2BFA4:
        C=0     WP                               * 2BFA4
        GOTO    L_2BFBB                          * 2BFA7
L_2BFAB:
        ?C#0    WP                               * 2BFAB
        GOYES   L_2BFB5                          * 2BFAE
        ?SB=0                                    * 2BFB0
        GOYES   L_2BFD5                          * 2BFB3
L_2BFB5:
        C=0     WP                               * 2BFB5
        C=-C-1  WP                               * 2BFB8
L_2BFBB:
        P=      14                               * 2BFBB
        D=C     W                                * 2BFBD
        C=A     W                                * 2BFC0
        D=D+1   WP                               * 2BFC3
        GONC    L_2BFCE                          * 2BFC6
        C=C+1   A                                * 2BFC9
        D=D+1   P                                * 2BFCB
L_2BFCE:
        P=      0                                * 2BFCE
        D=0     P                                * 2BFD0
        RTNCC                                    * 2BFD3
L_2BFD5:
        D=C     W                                * 2BFD5
        DSRB                                     * 2BFD8
        ?D=0    P                                * 2BFDB
        GOYES   L_2BFBB                          * 2BFDE
        GONC    L_2BFB5                          * 2BFE0

* refs (9): 37343 7D44C 7D580 7D7C1 87C29 89232 ...
GETAB1:
        A=DAT1  A                                * 2BFE3
        D1=D1+  5                                * 2BFE6
        B=A     A                                * 2BFE9
        A=DAT1  W                                * 2BFEB
        D1=D1+  16                               * 2BFEF
        B=A     S                                * 2BFF2
        A=0     S                                * 2BFF5
        ABEX    W                                * 2BFF8
        RTN                                      * 2BFFB

* refs (9): 371C6 785FE 7D669 7D6F1 7D89B 87C30 ...
GETAB0:
        A=DAT0  A                                * 2BFFD
