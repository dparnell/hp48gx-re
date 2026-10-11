* HP 48GX ROM revision R, #1A002-#1C016: User arithmetic commands (x+, x*, ...)
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: x* x+ x/ x^ x- xINV xNEG xi xLN x= xSQRT xSIN
* Follows on from the previous file (at #1A002 in the original ROM).
        RPL

* refs (11): B2733 B31D5 B3A23 BBC99 BC1AA BC7B5 ...
OBJ_1A002:
        ::                                       * 1A002
          DUPTYPEBINT?                           * 1A007
          case                                   * 1A00C
          JstGetTHEMESG                          * 1A011
        ;                                        * 1A016

* refs (13): AA1D8 B31D0 BC1A5 BC3D1 D6B9E D7FB2 ...
OBJ_1A01B:
        ::                                       * 1A01B
          SWAP                                   * 1A020
          OBJ_72AFA                              * 1A025
          SWAP                                   * 1A02A
          NTHCOMPDROP                            * 1A02F
          OBJ_72AFA                              * 1A034
        ;                                        * 1A039

* refs (6): 19B26 B15FC B2E81 D6886 D8627 D8729
OBJ_1A03E:
        ::                                       * 1A03E
          SetDA1Bad                              * 1A043
          SetDA2aBad                             * 1A048
          SetDA2bBad                             * 1A04D
          SetDA3Bad                              * 1A052
        ;                                        * 1A057

* refs (1): 19EBC
OBJ_1A05C:
        ::                                       * 1A05C
          2DUP                                   * 1A061
          Key>U/SKeyOb                           * 1A066
          OBJ_4080F                              * 1A06B
          SWAPDROP                               * 1A070
          case2drop                              * 1A075
          'DoBadKeyT                             * 1A07A
          5GETLAM                                * 1A07F
          DUP                                    * 1A084
          ROMPTR  0B0 088                        * 1A089
          casedrop                               * 1A094
          OBJ_19F0F                              * 1A099
          ROMPTR  0B0 08B                        * 1A09E
          NOTcase2drop                           * 1A0A9
          'DoBadKeyT                             * 1A0AE
          ROMPTR  0B0 052                        * 1A0B3
        ;                                        * 1A0BE
        FILLTO  #1A0FE                           * 1A0C3  59 zero nibbles: the next entry stays at #1A0FE

* name ->
* ROMPTR 002 020 CRDIR
* refs (1): 189EA
        CON(1)  8                                * 1A0FE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A0FF  library
        CON(3)  #020                             * 1A102  command
xCRDIR:
        ::                                       * 1A105
          CK1&Dispatch                           * 1A10A
          BINT6                                  * 1A10F
          CREATEDIR                              * 1A114
        ;                                        * 1A119

* -> {HOME dir1 .. dirn}
* ROMPTR 002 021 PATH
* refs (1): 189EA
        CON(1)  8                                * 1A11E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A11F  library
        CON(3)  #021                             * 1A122  command
xPATH:
        ::                                       * 1A125
          CK0                                    * 1A12A
          PATHDIR                                * 1A12F
        ;                                        * 1A134

* ->
* ROMPTR 002 022 HOME
* refs (6): 184D2 189EA 20BCC 39A6F B9CEF D29F2
        CON(1)  8                                * 1A139  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A13A  library
        CON(3)  #022                             * 1A13D  command
xHOME:
        ::                                       * 1A140
          CK0                                    * 1A145
          HOMEDIR                                * 1A14A
        ;                                        * 1A14F

* ->
* ROMPTR 002 023 UPDIR
* refs (2): 189EA B9D03
        CON(1)  8                                * 1A154  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A155  library
        CON(3)  #023                             * 1A158  command
xUPDIR:
        ::                                       * 1A15B
          CK0                                    * 1A160
          UPDIR                                  * 1A165
        ;                                        * 1A16A

* ->
* refs (3): 1A165 D2BDF D2E0F
UPDIR:
        ::                                       * 1A16F
          CONTEXT@                               * 1A174
          MYRAMROMPAIR                           * 1A179
          NOT?SEMI                               * 1A17E
          CONTEXT!                               * 1A183
        ;                                        * 1A188

* -> {}
* ROMPTR 002 024 VARS
* refs (1): 189EA
        CON(1)  8                                * 1A18D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A18E  library
        CON(3)  #024                             * 1A191  command
xVARS:
        ::                                       * 1A194
          CK0                                    * 1A199
          DOVARS                                 * 1A19E
        ;                                        * 1A1A3

* ntype -> {} {n...} -> {}
* ROMPTR 002 025 TVARS
* refs (1): 189EA
        CON(1)  8                                * 1A1A8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A1A9  library
        CON(3)  #025                             * 1A1AC  command
xTVARS:
        ::                                       * 1A1AF
          CK1&Dispatch                           * 1A1B4
          BINT1                                  * 1A1B9
          DOTVARS%                               * 1A1BE
          BINT5                                  * 1A1C3
          tvars(li)                              * 1A1C8
        ;                                        * 1A1CD

* obj -> chksum size
* ROMPTR 002 026 BYTES
* refs (1): 189EA
        CON(1)  8                                * 1A1D2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A1D3  library
        CON(3)  #026                             * 1A1D6  command
xBYTES:
        ::                                       * 1A1D9
          CK1&Dispatch                           * 1A1DE
          BINT6                                  * 1A1E3
          VARSIZE                                * 1A1E8
          BINT0                                  * 1A1ED
          OCRC%                                  * 1A1F2
        ;                                        * 1A1F7

* ob -> hxs %bytes
* refs (1): 1A1F2
OCRC%:
        ::                                       * 1A1FC
          INHARDROM?                             * 1A201
          ITE                                    * 1A206
          ::                                     * 1A20B
            DROP                                 * 1A210

#0000h:
            HXS     0000                         * 1A215

%2.5:
            %       2.5E0                        * 1A223
          ;                                      * 1A238

bytes!(_):
          ::                                     * 1A23D
            OCRC                                 * 1A242
            SWAP                                 * 1A247
            UNCOERCE                             * 1A24C
            %2                                   * 1A251
            %/                                   * 1A256
          ;                                      * 1A25B
        ;                                        * 1A260

* id -> hxs %bytes
* refs (3): 1A1E8 2DC75 B9DB3
VARSIZE:
        ::                                       * 1A265
          DUP                                    * 1A26A
          XEQRCL                                 * 1A26F
          OCRC                                   * 1A274
          SWAPROT                                * 1A279
          ID>$                                   * 1A27E
          LEN$                                   * 1A283
          #2*                                    * 1A288
          #+                                     * 1A28D
          #       9                              * 1A292  9
          #+                                     * 1A29C
          UNCOERCE                               * 1A2A1
          %2                                     * 1A2A6
          %/                                     * 1A2AB
        ;                                        * 1A2B0

* ob -> ob
* ROMPTR 002 027 NEWOB
* refs (1): 189EA
        CON(1)  8                                * 1A2B5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A2B6  library
        CON(3)  #027                             * 1A2B9  command
xNEWOB:
        ::                                       * 1A2BC
          CK1                                    * 1A2C1
          INHARDROM?                             * 1A2C6
          ?SEMI                                  * 1A2CB
          TOTEMPOB                               * 1A2D0
        ;                                        * 1A2D5

* ob -> ob flag
* refs (9): 1479E 14807 150C5 1A201 1A2C6 216B0 ...
INHARDROM?:
        CON(5)  (*)+5                            * 1A2DA  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 1A2DF
        LC(5)   CMOS                             * 1A2E2
        ?C>A    A                                * 1A2E9
        GOYES   L_1A2F5                          * 1A2EC
        GOVLNG  PushFLoop                        * 1A2EE
L_1A2F5:
        GOVLNG  PushTLoop                        * 1A2F5

* ->
* ROMPTR 002 028 KILL
* refs (2): 14785 189EA
        CON(1)  8                                * 1A2FC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A2FD  library
        CON(3)  #028                             * 1A300  command
        RPL
xKILL:
        ::                                       * 1A303
          CK0                                    * 1A308
          kill                                   * 1A30D
        ;                                        * 1A312

* ->
* ROMPTR 002 029 OFF
* refs (1): 189EA
        CON(1)  8                                * 1A317  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A318  library
        CON(3)  #029                             * 1A31B  command
xOFF:
        ::                                       * 1A31E
          CK0                                    * 1A323
          TurnOff                                * 1A328
        ;                                        * 1A32D

* n -> #n -> $ -> 0 ->
* ROMPTR 002 02A DOERR
* refs (1): 189EA
        CON(1)  8                                * 1A332  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A333  library
        CON(3)  #02A                             * 1A336  command
xDOERR:
        ::                                       * 1A339
          CK1&Dispatch                           * 1A33E
          BINT1                                  * 1A343
          DO%EXIT                                * 1A348
          BINT3                                  * 1A34D
          DO$EXIT                                * 1A352
          BINT11                                 * 1A357
          DOHXSEXIT                              * 1A35C
        ;                                        * 1A361

* ->
* ROMPTR 002 02B ERR0
* refs (1): 189EA
        CON(1)  8                                * 1A366  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A367  library
        CON(3)  #02B                             * 1A36A  command
xERR0:
        ::                                       * 1A36D
          CK0                                    * 1A372
          ERR0                                   * 1A377
        ;                                        * 1A37C

* -> $nerr
* ROMPTR 002 02C ERRN
* refs (1): 189EA
        CON(1)  8                                * 1A381  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A382  library
        CON(3)  #02C                             * 1A385  command
xERRN:
        ::                                       * 1A388
          CK0                                    * 1A38D
          ERRN>HXS                               * 1A392
        ;                                        * 1A397

* -> $msg
* ROMPTR 002 02D ERRM
* refs (1): 189EA
        CON(1)  8                                * 1A39C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A39D  library
        CON(3)  #02D                             * 1A3A0  command
xERRM:
        ::                                       * 1A3A3
          CK0                                    * 1A3A8
          ERRM                                   * 1A3AD
        ;                                        * 1A3B2

* ob -> ?
* ROMPTR 002 02E EVAL
* refs (18): 158AF 158D2 158F5 189EA 1A4BC 1A509 ...
        CON(1)  8                                * 1A3B7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A3B8  library
        CON(3)  #02E                             * 1A3BB  command
xEVAL:
        ::                                       * 1A3BE
          CK1&Dispatch                           * 1A3C3
          BINT9                                  * 1A3C8
          COMPEVAL                               * 1A3CD
          BINT5                                  * 1A3D2
          COMPEVAL                               * 1A3D7
          BINT13                                 * 1A3DC
          eval(to)                               * 1A3E1
          BINT0                                  * 1A3E6
          EVAL                                   * 1A3EB
        ;                                        * 1A3F0

* slots of 002 02E (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #A3                              * 1A3F5  end of the slots: property byte (meaning not yet known)

* 0/1 objT objF -> ?
* ROMPTR 002 02F IFTE
* refs (9): 189EA 54649 54689 5BB27 85007 85DF4 ...
        CON(1)  1                                * 1A3F7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A3F8  library
        CON(3)  #02F                             * 1A3FB  command
xIFTE:
        ::                                       * 1A3FE
          CK3&Dispatch                           * 1A403
          REALOBOB                               * 1A408
          %IFTE                                  * 1A40D
          SYMREALREAL                            * 1A412
          ifte(ex,2_)                            * 1A417
          SYMREALCMP                             * 1A41C
          ifte(ex,2_)                            * 1A421
          SYMCMPREAL                             * 1A426
          ifte(ex,2_)                            * 1A42B
          SYMCMPCMP                              * 1A430
          ifte(ex,2_)                            * 1A435
          SYMSYMREAL                             * 1A43A
          ifte(ex,2_)                            * 1A43F
          SYMSYMCMP                              * 1A444
          ifte(ex,2_)                            * 1A449
          SYMREALSYM                             * 1A44E
          ifte(ex,2_)                            * 1A453
          SYMCMPSYM                              * 1A458
          ifte(ex,2_)                            * 1A45D
          3SYM                                   * 1A462
          ifte(ex,2_)                            * 1A467
        ;                                        * 1A46C

#0526260410h:
        HXS     0140626250                       * 1A471
        NIBHEX  28DD7                            * 1A485  ∇Ý

        ROMPTR  0F0 095                          * 1A48A

        CON(5)  nWHEREIFTE                       * 1A495  address (the code jumps or points through it)

        CON(5)  OBJ_5A257                        * 1A49A  address (the code jumps or points through it)
        NIBHEX  0000                             * 1A49F  ..

* % ob1 ob2 -> ?
* refs (1): 1A40D
%IFTE:
        ::                                       * 1A4A3
          ROT                                    * 1A4A8
          %0=                                    * 1A4AD
          ?SWAPDROP                              * 1A4B2
          'EvalNoCK:_sup                         * 1A4B7
          xEVAL                                  * 1A4BC
        ;                                        * 1A4C1

* 0/1 obj -> ?
* ROMPTR 002 030 IFT
* refs (2): 189EA 1A51D
        CON(1)  8                                * 1A4C6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A4C7  library
        CON(3)  #030                             * 1A4CA  command
xIFT:
        ::                                       * 1A4CD
          CK2&Dispatch                           * 1A4D2
          BINT16                                 * 1A4D7
          ift(r,_)                               * 1A4DC
          SYMOB                                  * 1A4E1
          ift(ex,_)                              * 1A4E6
        ;                                        * 1A4EB

* refs (1): 1A4DC
ift(r,_):
        ::                                       * 1A4F0
          SWAP                                   * 1A4F5
          %0=                                    * 1A4FA
          caseDROP                               * 1A4FF
          'EvalNoCK:_sup                         * 1A504
          xEVAL                                  * 1A509
        ;                                        * 1A50E

* refs (1): 1A4E6
ift(ex,_):
        ::                                       * 1A513
          SYMCRUNCH2                             * 1A518
          xIFT                                   * 1A51D
        ;                                        * 1A522

* # -> ?
* ROMPTR 002 031 SYSEVAL
* refs (1): 189EA
        CON(1)  8                                * 1A527  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A528  library
        CON(3)  #031                             * 1A52B  command
xSYSEVAL:
        ::                                       * 1A52E
          CK1&Dispatch                           * 1A533
          BINT11                                 * 1A538
          syseval(b)                             * 1A53D
        ;                                        * 1A542

* refs (1): 1A53D
syseval(b):
        ::                                       * 1A547
          HXS>#                                  * 1A54C
          COLA                                   * 1A551

syseval(s):
          CODE                                   * 1A556  24 nibbles
            C=DAT1  A                            * 1A560
            D1=D1+  5                            * 1A563
            D=D+1   A                            * 1A566
            CD1EX                                * 1A568
            D1=D1+  5                            * 1A56B
            A=DAT1  A                            * 1A56E
            D1=C                                 * 1A571
            PC=(A)                               * 1A574
          ENDCODE                                * 1A578
        ;                                        * 1A578

* obj n_line ->
* ROMPTR 002 032 DISP
* refs (1): 189EA
        CON(1)  8                                * 1A57D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A57E  library
        CON(3)  #032                             * 1A581  command
xDISP:
        ::                                       * 1A584
          CK2&Dispatch                           * 1A589
          BINT1                                  * 1A58E
          DODISP                                 * 1A593
        ;                                        * 1A598

* n ->
* ROMPTR 002 033 FREEZE
* refs (1): 189EA
        CON(1)  8                                * 1A59D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A59E  library
        CON(3)  #033                             * 1A5A1  command
xFREEZE:
        ::                                       * 1A5A4
          CK1&Dispatch                           * 1A5A9
          BINT1                                  * 1A5AE
          Ck&Freeze                              * 1A5B3
        ;                                        * 1A5B8

* freq dur ->
* ROMPTR 002 034 BEEP
* refs (1): 189EA
        CON(1)  8                                * 1A5BD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A5BE  library
        CON(3)  #034                             * 1A5C1  command
xBEEP:
        ::                                       * 1A5C4
          CK2&Dispatch                           * 1A5C9
          BINT17                                 * 1A5CE
          DOBEEP                                 * 1A5D3
        ;                                        * 1A5D8

* x -> x'
* ROMPTR 002 035 →NUM
* refs (2): 189EA 6BBB8
        CON(1)  8                                * 1A5DD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A5DE  library
        CON(3)  #035                             * 1A5E1  command
x>NUM:
        ::                                       * 1A5E4
          CK1                                    * 1A5E9
          STRIPTAGS                              * 1A5EE
          CRUNCH                                 * 1A5F3
        ;                                        * 1A5F8

* -> ob1 .. obn
* ROMPTR 002 036 LASTARG
* refs (1): 189EA
        CON(1)  8                                * 1A5FD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A5FE  library
        CON(3)  #036                             * 1A601  command
xLAST:
        ::                                       * 1A604
          CK0                                    * 1A609
          BINT55                                 * 1A60E
          TestSysFlag                            * 1A613
          NOTcase                                * 1A618
          lastarg                                * 1A61D
          Err#NoLstArg                           * 1A622
          ERROROUT                               * 1A627
        ;                                        * 1A62C

* refs (1): 1A61D
lastarg:
        CON(5)  (*)+5                            * 1A631  primitive code object
        ASSEMBLE
        ST=0    10                               * 1A636
L_1A639:
        AD0EX                                    * 1A639
        D0=(5)  LASTARG5                         * 1A63C
        C=DAT0  A                                * 1A643
        ?C#0    A                                * 1A646
        GOYES   L_1A67B                          * 1A649
        D0=D0-  5                                * 1A64B
        C=DAT0  A                                * 1A64E
        ?C#0    A                                * 1A651
        GOYES   L_1A68C                          * 1A654
        D0=D0-  5                                * 1A656
        C=DAT0  A                                * 1A659
        ?C#0    A                                * 1A65C
        GOYES   L_1A6AD                          * 1A65F
        D0=D0-  5                                * 1A661
        C=DAT0  A                                * 1A664
        ?C#0    A                                * 1A667
        GOYES   L_1A6BE                          * 1A66A
        D0=D0-  5                                * 1A66C
        C=DAT0  A                                * 1A66F
        ?C#0    A                                * 1A672
        GOYES   L_1A6CF                          * 1A675
        GOTO    L_1A6E8                          * 1A677
L_1A67B:
        D=D-CON A,5                              * 1A67B
        GOC     L_1A6F7                          * 1A681
        D1=D1-  10                               * 1A684
        P=      9                                * 1A687
        GONC    L_1A69A                          * 1A689
L_1A68C:
        D=D-CON A,4                              * 1A68C
        GOC     L_1A6F7                          * 1A692
        D1=D1-  5                                * 1A695
        P=      4                                * 1A698
L_1A69A:
        D0=(5)  LASTARG4                         * 1A69A
        C=DAT0  WP                               * 1A6A1
        DAT1=C  WP                               * 1A6A5
        GOTO    L_1A6B6                          * 1A6A9
L_1A6AD:
        D=D-CON A,3                              * 1A6AD
        GOC     L_1A6F7                          * 1A6B3
L_1A6B6:
        D1=D1-  15                               * 1A6B6
        P=      14                               * 1A6B9
        GONC    L_1A6D9                          * 1A6BB
L_1A6BE:
        D=D-CON A,2                              * 1A6BE
        GOC     L_1A6F7                          * 1A6C4
        D1=D1-  10                               * 1A6C7
        P=      9                                * 1A6CA
        GONC    L_1A6D9                          * 1A6CC
L_1A6CF:
        D=D-1   A                                * 1A6CF
        GOC     L_1A6F7                          * 1A6D1
        D1=D1-  5                                * 1A6D4
        P=      4                                * 1A6D7
L_1A6D9:
        D0=(5)  LASTARG                          * 1A6D9
        C=DAT0  WP                               * 1A6E0
        DAT1=C  WP                               * 1A6E4
L_1A6E8:
        D0=A                                     * 1A6E8
        P=      0                                * 1A6EB
        A=DAT0  A                                * 1A6ED
        D0=D0+  5                                * 1A6F0
        PC=(A)                                   * 1A6F3
L_1A6F7:
        D=D+C   A                                * 1A6F7
        D0=A                                     * 1A6F9
        P=      0                                * 1A6FC
        GOSBVL  SUB_14ED6                        * 1A6FE
        ST=1    10                               * 1A705
        GOTO    L_1A639                          * 1A708
        BSS     12                               * 1A70C

* sec -> 0 -> rc.p
* ROMPTR 002 037 WAIT
* refs (1): 189EA
        CON(1)  8                                * 1A718  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A719  library
        CON(3)  #037                             * 1A71C  command
        RPL
xWAIT:
        ::                                       * 1A71F
          CK1&Dispatch                           * 1A724
          BINT1                                  * 1A729
          Wait/GetKey                            * 1A72E
        ;                                        * 1A733

* % -> ?
* refs (1): 1A72E
Wait/GetKey:
        ::                                       * 1A738
          DUP                                    * 1A73D
          %0>                                    * 1A742
          case                                   * 1A747
          dowait/quit?                           * 1A74C
          %0<>                                   * 1A751
          IT                                     * 1A756
          DispMenu.1                             * 1A75B
          WaitForKey                             * 1A760
          InitEdModes                            * 1A765
          OVER                                   * 1A76A
          BINT45                                 * 1A76F
          #=                                     * 1A774
          OVER                                   * 1A779
          BINT1                                  * 1A77E
          #=                                     * 1A783
          3PICK                                  * 1A788
          BINT4                                  * 1A78D
          #=                                     * 1A792
          OR                                     * 1A797
          AND                                    * 1A79C
          case2drop                              * 1A7A1
          ABORT                                  * 1A7A6
          CodePl>%rc.p                           * 1A7AB
        ;                                        * 1A7B0

* %secs ->
* refs (1): 1A74C
dowait/quit?:
        ::                                       * 1A7B5
          dowait                                 * 1A7BA
          OBJ_4241B                              * 1A7BF
        ;                                        * 1A7C4

* %secs ->
* refs (5): 1A7BA 2DC1B 2E0D1 2F031 C0BA9
dowait:
        ::                                       * 1A7C9

%8.192E3:
          %       8.192E3                        * 1A7CE
          %*                                     * 1A7E3
          %>#                                    * 1A7E8

* hxs ->
wait:
          CODE                                   * 1A7ED  85 nibbles
            A=DAT1  A                            * 1A7F7
            D1=D1+  5                            * 1A7FA
            D=D+1   A                            * 1A7FD
            GOSBVL  SAVPTR                       * 1A7FF
            D1=A                                 * 1A806
            D1=D1+  10                           * 1A809
            C=DAT1  W                            * 1A80C
            R0=C                                 * 1A810
            GOSBVL  GetTime++                    * 1A813
            R1=C                                 * 1A81A
L_1A81D:
            D0=(5)  ATTNFLG                      * 1A81D
            A=DAT0  A                            * 1A824
            ?A#0    A                            * 1A827
            GOYES   L_1A843                      * 1A82A
            GOSBVL  GetTime++                    * 1A82C
            A=R1                                 * 1A833
            P=      12                           * 1A836
            C=C-A   WP                           * 1A838
            A=R0                                 * 1A83B
            ?C<=A   WP                           * 1A83E
            GOYES   L_1A81D                      * 1A841
L_1A843:
            P=      0                            * 1A843
            GOVLNG  GETPTRLOOP                   * 1A845
          ENDCODE                                * 1A84C
        ;                                        * 1A84C

* ->
* ROMPTR 002 038 CLLCD
* refs (3): 189EA C7162 C7171
        CON(1)  8                                * 1A851  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A852  library
        CON(3)  #038                             * 1A855  command
xCLLCD:
        ::                                       * 1A858
          CK0                                    * 1A85D
          DOCLLCD                                * 1A862
        ;                                        * 1A867

* -> rc 1 -> 0
* ROMPTR 002 039 KEY
* refs (1): 189EA
        CON(1)  8                                * 1A86C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A86D  library
        CON(3)  #039                             * 1A870  command
xKEY:
        ::                                       * 1A873
          CK0                                    * 1A878
          GETTOUCH                               * 1A87D
          NOTcase                                * 1A882
          %0_2A2B4                               * 1A887
          H/W>KeyCode                            * 1A88C
          BINT63                                 * 1A891
          #AND                                   * 1A896
          BINT1                                  * 1A89B
          CodePl>%rc.p                           * 1A8A0
          %IP                                    * 1A8A5
          %1                                     * 1A8AA
        ;                                        * 1A8AF

* ->
* ROMPTR 002 03A CONT
* refs (1): 189EA
        CON(1)  8                                * 1A8B4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A8B5  library
        CON(3)  #03A                             * 1A8B8  command
xCONT:
        ::                                       * 1A8BB
          CK0                                    * 1A8C0
          cont                                   * 1A8C5
        ;                                        * 1A8CA

* slots of 002 03A (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #C8                              * 1A8CF  end of the slots: property byte (meaning not yet known)

* x y -> x=y
* ROMPTR 002 03B =
* refs (32): 15708 189EA 1CF3D 285D0 476CE 49D1C ...
        CON(1)  5                                * 1A8D1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A8D2  library
        CON(3)  #03B                             * 1A8D5  command
x=:
        ::                                       * 1A8D8
          CK2&Dispatch                           * 1A8DD
          BINT17                                 * 1A8E2
          OBJ_55927                              * 1A8E7
          BINT18                                 * 1A8EC
          OBJ_55927                              * 1A8F1
          BINT33                                 * 1A8F6
          OBJ_55927                              * 1A8FB
          BINT34                                 * 1A900
          OBJ_55927                              * 1A905
          BINT26                                 * 1A90A
          OBJ_55927                              * 1A90F
          BINT42                                 * 1A914
          OBJ_55927                              * 1A919
          SYMREAL                                * 1A91E
          OBJ_55927                              * 1A923
          OBJ_64D7E                              * 1A928
          OBJ_55927                              * 1A92D
          SYMSYM                                 * 1A932
          OBJ_55927                              * 1A937
          2EXT                                   * 1A93C
          OBJ_55927                              * 1A941
          BINT30                                 * 1A946
          OBJ_55927                              * 1A94B
          EXTREAL                                * 1A950
          OBJ_55927                              * 1A955
          SYMEXT                                 * 1A95A
          OBJ_55927                              * 1A95F
          EXTSYM                                 * 1A964
          OBJ_55927                              * 1A969
        ;                                        * 1A96E

* slots of 002 03B (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6E50F                        * 1A973  slot 0
        CON(5)  #00700h                          * 1A978  slot 1
        CON(5)  D/D=                             * 1A97D  slot 2
        CON(5)  OBJ_57451                        * 1A982  slot 3
        CON(5)  MANMENUEQ                        * 1A987  slot 4
        CON(2)  #C8                              * 1A98C  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 03C NEG
* refs (44): 189EA 20389 203A2 274FE 3B59B 3B5B4 ...
        CON(1)  5                                * 1A98E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A98F  library
        CON(3)  #03C                             * 1A992  command
xNEG:
        ::                                       * 1A995
          CK1&Dispatch                           * 1A99A
          BINT1                                  * 1A99F
          %CHS                                   * 1A9A4
          BINT2                                  * 1A9A9
          C%CHS                                  * 1A9AE
          BINT4                                  * 1A9B3
          MATNEG                                 * 1A9B8
          BINT10                                 * 1A9BD
          SYMNEG                                 * 1A9C2
          BINT14                                 * 1A9C7
          UMCHS                                  * 1A9CC
          BINT11                                 * 1A9D1
          bitNEG                                 * 1A9D6
          BINT12                                 * 1A9DB
          inv(go)                                * 1A9E0
          BINT8                                  * 1A9E5
          neg(PICT)                              * 1A9EA
        ;                                        * 1A9EF

* slots of 002 03C (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D55F                        * 1A9F4  slot 0

* refs (1): 1ACFB
#8010h:
        HXS     0108                             * 1A9F9  slot 1
        CON(5)  D/DCHS                           * 1AA07  slot 2
        CON(5)  OBJ_57488                        * 1AA0C  slot 3
        CON(5)  MANMENUCSIV                      * 1AA11  slot 4
        CON(2)  #80                              * 1AA16  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 03D ABS
* refs (4): 189EA 54F13 837B6 86123
        CON(1)  0                                * 1AA18  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AA19  library
        CON(3)  #03D                             * 1AA1C  command
xABS:
        ::                                       * 1AA1F
          CK1&Dispatch                           * 1AA24
          BINT1                                  * 1AA29
          %ABS                                   * 1AA2E
          BINT2                                  * 1AA33
          C%ABS                                  * 1AA38
          BINT4                                  * 1AA3D
          MATABS                                 * 1AA42
          BINT10                                 * 1AA47
          SYMABS                                 * 1AA4C
          BINT14                                 * 1AA51
          UMABS                                  * 1AA56
        ;                                        * 1AA5B

* slots of 002 03D (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DABS                           * 1AA60  slot 0
        CON(2)  #C8                              * 1AA65  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 03E CONJ
* refs (12): 189EA 20408 20421 54F2C 55472 554EA ...
        CON(1)  0                                * 1AA67  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AA68  library
        CON(3)  #03E                             * 1AA6B  command
xCONJ:
        ::                                       * 1AA6E
          CK1&Dispatch                           * 1AA73
          BINT1                                  * 1AA78
          NOP                                    * 1AA7D
          BINT2                                  * 1AA82
          C%CONJ                                 * 1AA87
          BINT4                                  * 1AA8C
          MATCONJ                                * 1AA91
          BINT10                                 * 1AA96
          SYMCONJ                                * 1AA9B
        ;                                        * 1AAA0

* slots of 002 03E (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DCONJ                          * 1AAA5  slot 0
        CON(5)  OBJ_575EE                        * 1AAAA  slot 1
        CON(5)  MANMENUCX                        * 1AAAF  slot 2
        CON(2)  #80                              * 1AAB4  end of the slots: property byte (meaning not yet known)

* -> pi
* ROMPTR 002 03F π
* refs (21): 189EA 3C0C1 54D4E 55454 554CC 56C31 ...
        CON(1)  0                                * 1AAB6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AAB7  library
        CON(3)  #03F                             * 1AABA  command
xPI:
        ::                                       * 1AABD
          CK0                                    * 1AAC2
          pi                                     * 1AAC7
        ;                                        * 1AACC

* slots of 002 03F (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_56B87                        * 1AAD1  slot 0
        CON(2)  #80                              * 1AAD6  end of the slots: property byte (meaning not yet known)

* -> MAXR
* ROMPTR 002 040 MAXR
* refs (4): 189EA 3C0D5 54D2B 8C1F8
        CON(1)  0                                * 1AAD8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AAD9  library
        CON(3)  #040                             * 1AADC  command
xMAXR:
        ::                                       * 1AADF
          CK0                                    * 1AAE4
          maxr                                   * 1AAE9
        ;                                        * 1AAEE

* slots of 002 040 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_56B87                        * 1AAF3  slot 0
        CON(2)  #80                              * 1AAF8  end of the slots: property byte (meaning not yet known)

* -> MINR
* ROMPTR 002 041 MINR
* refs (3): 189EA 3C0CB 54D08
        CON(1)  0                                * 1AAFA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AAFB  library
        CON(3)  #041                             * 1AAFE  command
xMINR:
        ::                                       * 1AB01
          CK0                                    * 1AB06
          OBJ_54CDB                              * 1AB0B
        ;                                        * 1AB10

* slots of 002 041 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_56B87                        * 1AB15  slot 0
        CON(2)  #80                              * 1AB1A  end of the slots: property byte (meaning not yet known)

* -> e
* ROMPTR 002 042 e
* refs (3): 189EA 3C0AD 54D94
        CON(1)  0                                * 1AB1C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AB1D  library
        CON(3)  #042                             * 1AB20  command
xCONSTANTe:
        ::                                       * 1AB23
          CK0                                    * 1AB28
          e                                      * 1AB2D
        ;                                        * 1AB32

* slots of 002 042 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_56B87                        * 1AB37  slot 0
        CON(2)  #80                              * 1AB3C  end of the slots: property byte (meaning not yet known)

* -> i
* ROMPTR 002 043 i
* refs (34): 189EA 281D8 3C0B7 54D71 553F5 55463 ...
        CON(1)  0                                * 1AB3E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AB3F  library
        CON(3)  #043                             * 1AB42  command
xi:
        ::                                       * 1AB45
          CK0                                    * 1AB4A
          i                                      * 1AB4F
        ;                                        * 1AB54

* slots of 002 043 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_56B87                        * 1AB59  slot 0
        CON(2)  #C8                              * 1AB5E  end of the slots: property byte (meaning not yet known)

* x y -> x+y
* ROMPTR 002 044 +
* refs (116): 189EA 204B4 204F0 281E2 48BF7 48C38 ...
        CON(1)  5                                * 1AB60  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AB61  library
        CON(3)  #044                             * 1AB64  command
x+:
        ::                                       * 1AB67
          CK2&Dispatch                           * 1AB6C
          BINT17                                 * 1AB71
          %+                                     * 1AB76
          BINT18                                 * 1AB7B
          C%R+C                                  * 1AB80
          BINT33                                 * 1AB85
          C%C+R                                  * 1AB8A
          BINT34                                 * 1AB8F
          C%C+C                                  * 1AB94
          BINT27                                 * 1AB99
          bit%#+                                 * 1AB9E
          HXSREAL                                * 1ABA3
          bit#%+                                 * 1ABA8
          2HXS                                   * 1ABAD
          bit+                                   * 1ABB2
          2EXT                                   * 1ABB7
          UM+                                    * 1ABBC
          BINT30                                 * 1ABC1
          UM+                                    * 1ABC6
          EXTREAL                                * 1ABCB
          UM+                                    * 1ABD0
          SYMSYM                                 * 1ABD5
          SYM+                                   * 1ABDA
          BINT26                                 * 1ABDF
          O+SYM                                  * 1ABE4
          SYMREAL                                * 1ABE9
          SYM+O                                  * 1ABEE
          BINT42                                 * 1ABF3
          O+SYM                                  * 1ABF8
          OBJ_64D7E                              * 1ABFD
          SYM+O                                  * 1AC02
          SYMEXT                                 * 1AC07
          SYM+O                                  * 1AC0C
          EXTSYM                                 * 1AC11
          O+SYM                                  * 1AC16
          BINT68                                 * 1AC1B
          MAT+                                   * 1AC20
          2GROB                                  * 1AC25
          +(2go)                                 * 1AC2A
          BINT85                                 * 1AC2F
          &COMP                                  * 1AC34
          BINT51                                 * 1AC39
          &$                                     * 1AC3E
          OBJ_64C34                              * 1AC43
          >TCOMP                                 * 1AC48
          BINT5                                  * 1AC4D
          SWAP>HCOMP                             * 1AC52
          BINT48                                 * 1AC57
          +(st,_)                                * 1AC5C
          BINT3                                  * 1AC61
          +(_,st)                                * 1AC66
        ;                                        * 1AC6B

* slots of 002 044 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCCC                        * 1AC70  slot 0

* refs (1): 1ADD1
#70107h:
        HXS     70107                            * 1AC75  slot 1
        CON(5)  D/D+                             * 1AC84  slot 2
        CON(5)  OBJ_57446                        * 1AC89  slot 3
        CON(5)  MANMENU+-                        * 1AC8E  slot 4

* ob comp -> ob+comp
* refs (2): 1AC52 49B0A
SWAP>HCOMP:
        ::                                       * 1AC93  slot 5
          SWAP                                   * 1AC98
          >HCOMP                                 * 1AC9D
        ;                                        * 1ACA2

* refs (1): 1AC5C
+(st,_):
        ::                                       * 1ACA7  slot 6
          DECOMP$                                * 1ACAC
          &$                                     * 1ACB1
        ;                                        * 1ACB6

* refs (1): 1AC66
+(_,st):
        ::                                       * 1ACBB  slot 7
          SWAP                                   * 1ACC0
          DECOMP$                                * 1ACC5
          SWAP&$                                 * 1ACCA
        ;                                        * 1ACCF
        CON(2)  #00                              * 1ACD4  end of the slots: property byte (meaning not yet known)

* ->
* ROMPTR 002 045
* refs (3): 189EA 2751C 28002
        CON(1)  5                                * 1ACD6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1ACD7  library
        CON(3)  #045                             * 1ACDA  command
xNEGNEG:
        ::                                       * 1ACDD
          CK1&Dispatch                           * 1ACE2
          BINT0                                  * 1ACE7
          NOP                                    * 1ACEC
        ;                                        * 1ACF1

* slots of 002 045 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D55F                        * 1ACF6  slot 0
        CON(5)  #8010h                           * 1ACFB  slot 1
        CON(2)  #C8                              * 1AD00  end of the slots: property byte (meaning not yet known)

* x y -> x-y
* ROMPTR 002 046 -
* refs (70): 189EA 20597 205B5 498E4 5594A 55F85 ...
        CON(1)  5                                * 1AD02  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AD03  library
        CON(3)  #046                             * 1AD06  command
x-:
        ::                                       * 1AD09
          CK2&Dispatch                           * 1AD0E
          BINT17                                 * 1AD13
          %-                                     * 1AD18
          BINT18                                 * 1AD1D
          C%R-C                                  * 1AD22
          BINT33                                 * 1AD27
          C%C-R                                  * 1AD2C
          BINT34                                 * 1AD31
          C%C-C                                  * 1AD36
          BINT27                                 * 1AD3B
          bit%#-                                 * 1AD40
          HXSREAL                                * 1AD45
          bit#%-                                 * 1AD4A
          2HXS                                   * 1AD4F
          bit-                                   * 1AD54
          BINT68                                 * 1AD59
          MAT-                                   * 1AD5E
          BINT26                                 * 1AD63
          SYM-                                   * 1AD68
          BINT42                                 * 1AD6D
          SYM-                                   * 1AD72
          SYMREAL                                * 1AD77
          SYM-O                                  * 1AD7C
          OBJ_64D7E                              * 1AD81
          SYM-O                                  * 1AD86
          SYMSYM                                 * 1AD8B
          -(2ex)                                 * 1AD90
          2EXT                                   * 1AD95
          UM-                                    * 1AD9A
          BINT30                                 * 1AD9F
          UM-                                    * 1ADA4
          EXTREAL                                * 1ADA9
          UM-                                    * 1ADAE
          SYMEXT                                 * 1ADB3
          SYM-O                                  * 1ADB8
          EXTSYM                                 * 1ADBD
          SYM-                                   * 1ADC2
        ;                                        * 1ADC7

* slots of 002 046 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCCC                        * 1ADCC  slot 0
        CON(5)  #70107h                          * 1ADD1  slot 1
        CON(5)  D/D-                             * 1ADD6  slot 2
        CON(5)  OBJ_57451                        * 1ADDB  slot 3
        CON(5)  MANMENU+-                        * 1ADE0  slot 4
        CON(2)  #C8                              * 1ADE5  end of the slots: property byte (meaning not yet known)

* x y -> x*y
* ROMPTR 002 047 *
* refs (195): 189EA 1FB45 207DA 207F8 20820 20848 ...
        CON(1)  5                                * 1ADE7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1ADE8  library
        CON(3)  #047                             * 1ADEB  command
x*:
        ::                                       * 1ADEE
          CK2&Dispatch                           * 1ADF3
          BINT17                                 * 1ADF8
          %*                                     * 1ADFD
          BINT18                                 * 1AE02
          C%R*C                                  * 1AE07
          BINT33                                 * 1AE0C
          C%C*R                                  * 1AE11
          BINT34                                 * 1AE16
          C%C*C_51D88                            * 1AE1B
          BINT27                                 * 1AE20
          bit%#*                                 * 1AE25
          HXSREAL                                * 1AE2A
          bit#%*                                 * 1AE2F
          2HXS                                   * 1AE34
          bit*                                   * 1AE39
          BINT20                                 * 1AE3E
          MATFLOAT*                              * 1AE43
          BINT36                                 * 1AE48
          MATFLOAT*                              * 1AE4D
          BINT65                                 * 1AE52
          MATFLOAT*                              * 1AE57
          BINT66                                 * 1AE5C
          MATFLOAT*                              * 1AE61
          BINT68                                 * 1AE66
          MAT*                                   * 1AE6B
          BINT26                                 * 1AE70
          O*SYM                                  * 1AE75
          BINT42                                 * 1AE7A
          O*SYM                                  * 1AE7F
          SYMREAL                                * 1AE84
          SYM*O                                  * 1AE89
          OBJ_64D7E                              * 1AE8E
          SYM*O                                  * 1AE93
          SYMSYM                                 * 1AE98
          SYM*                                   * 1AE9D
          2EXT                                   * 1AEA2
          UM*                                    * 1AEA7
          BINT30                                 * 1AEAC
          UM*                                    * 1AEB1
          EXTREAL                                * 1AEB6
          UM*                                    * 1AEBB
          SYMEXT                                 * 1AEC0
          SYM*O                                  * 1AEC5
          EXTSYM                                 * 1AECA
          O*SYM                                  * 1AECF
        ;                                        * 1AED4

* slots of 002 047 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCCC                        * 1AED9  slot 0

* refs (1): 1B004
#80108h:
        HXS     80108                            * 1AEDE  slot 1
        CON(5)  D/D*                             * 1AEED  slot 2
        CON(5)  OBJ_5745C                        * 1AEF2  slot 3
        CON(5)  MANMENU*/                        * 1AEF7  slot 4
        CON(2)  #C8                              * 1AEFC  end of the slots: property byte (meaning not yet known)

* x y -> x/y
* ROMPTR 002 048 /
* refs (90): 189EA 1FB6C 2067F 2069D 206C5 20706 ...
        CON(1)  5                                * 1AEFE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AEFF  library
        CON(3)  #048                             * 1AF02  command
x/:
        ::                                       * 1AF05
          CK2&Dispatch                           * 1AF0A
          BINT17                                 * 1AF0F
          %/                                     * 1AF14
          BINT18                                 * 1AF19
          C%R/C                                  * 1AF1E
          BINT33                                 * 1AF23
          C%C/R                                  * 1AF28
          BINT34                                 * 1AF2D
          C%C/C                                  * 1AF32
          BINT27                                 * 1AF37
          bit%#/                                 * 1AF3C
          HXSREAL                                * 1AF41
          bit#%/                                 * 1AF46
          2HXS                                   * 1AF4B
          bit/                                   * 1AF50
          BINT65                                 * 1AF55
          MATFLOAT/                              * 1AF5A
          BINT66                                 * 1AF5F
          MATFLOAT/                              * 1AF64
          BINT68                                 * 1AF69
          MAT/                                   * 1AF6E
          BINT26                                 * 1AF73
          O/SYM                                  * 1AF78
          BINT42                                 * 1AF7D
          O/SYM                                  * 1AF82
          SYMREAL                                * 1AF87
          SYM/O                                  * 1AF8C
          OBJ_64D7E                              * 1AF91
          SYM/O                                  * 1AF96
          SYMSYM                                 * 1AF9B
          SYM/                                   * 1AFA0
          2EXT                                   * 1AFA5
          UM/                                    * 1AFAA
          BINT30                                 * 1AFAF
          UM/                                    * 1AFB4
          EXTREAL                                * 1AFB9
          UM/                                    * 1AFBE
          SYMEXT                                 * 1AFC3
          SYM/O                                  * 1AFC8
          EXTSYM                                 * 1AFCD
          O/SYM                                  * 1AFD2
        ;                                        * 1AFD7

* slots of 002 048 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CDDF                        * 1AFDC  slot 0
        CON(5)  OBJ_1AFF5                        * 1AFE1  slot 1
        CON(5)  D/D/                             * 1AFE6  slot 2
        CON(5)  OBJ_57467                        * 1AFEB  slot 3
        CON(5)  MANMENU*/                        * 1AFF0  slot 4

* refs (1): 1AFE1
OBJ_1AFF5:
        ::                                       * 1AFF5  slot 5
          OBJ_6CC10                              * 1AFFA
          #0504108h                              * 1AFFF
          #80108h                                * 1B004
          RPITE                                  * 1B009
        ;                                        * 1B00E

* refs (1): 1AFFF
#0504108h:
        HXS     8014050                          * 1B013  slot 6
        CON(2)  #CC                              * 1B024  end of the slots: property byte (meaning not yet known)

* y x -> y^x
* ROMPTR 002 049 ^
* refs (85): 189EA 288F0 2903C 2906E 48C9C 55639 ...
        CON(1)  5                                * 1B026  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B027  library
        CON(3)  #049                             * 1B02A  command
x^:
        ::                                       * 1B02D
          CK2&Dispatch                           * 1B032
          BINT17                                 * 1B037
          ^(2r)                                  * 1B03C
          BINT18                                 * 1B041
          C%R^C                                  * 1B046
          BINT33                                 * 1B04B
          C%C^R                                  * 1B050
          BINT34                                 * 1B055
          C%C^C                                  * 1B05A
          BINT26                                 * 1B05F
          O^SYM                                  * 1B064
          BINT42                                 * 1B069
          O^SYM                                  * 1B06E
          SYMREAL                                * 1B073
          SYM^O                                  * 1B078
          OBJ_64D7E                              * 1B07D
          SYM^O                                  * 1B082
          SYMSYM                                 * 1B087
          SYM^                                   * 1B08C
          2EXT                                   * 1B091
          ^(2uo)                                 * 1B096
          BINT30                                 * 1B09B
          ^(2uo)                                 * 1B0A0
          EXTREAL                                * 1B0A5
          ^(2uo)                                 * 1B0AA
          SYMEXT                                 * 1B0AF
          SYM^O                                  * 1B0B4
          EXTSYM                                 * 1B0B9
          O^SYM                                  * 1B0BE
        ;                                        * 1B0C3

* slots of 002 049 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D18B                        * 1B0C8  slot 0
        CON(5)  OBJ_1B0E6                        * 1B0CD  slot 1
        CON(5)  D/D^                             * 1B0D2  slot 2
        CON(5)  OBJ_57472                        * 1B0D7  slot 3
        CON(5)  MANMENU^                         * 1B0DC  slot 4
        CON(5)  OBJ_5B906                        * 1B0E1  slot 5

* refs (1): 1B0CD
OBJ_1B0E6:
        ::                                       * 1B0E6  slot 6
          OBJ_6CC10                              * 1B0EB
          #0504109h                              * 1B0F0
          #90109h                                * 1B0F5
          RPITE                                  * 1B0FA
        ;                                        * 1B0FF

* refs (1): 1B0F5
#90109h:
        HXS     90109                            * 1B104  slot 7

* refs (1): 1B0F0
#0504109h:
        HXS     9014050                          * 1B113  slot 8

* refs (1): 1B03C
^(2r):
        ::                                       * 1B124  slot 9
          2DUP                                   * 1B129
          ERRSET                                 * 1B12E
          %^                                     * 1B133
          ERRTRAP                                * 1B138
          ::                                     * 1B13D
            ERROR@                               * 1B142
            #       304                          * 1B147  772
            #=?SKIP                              * 1B151
            ERRJMP                               * 1B156
            RDROP                                * 1B15B
            ERRORCLR                             * 1B160
            Re>C%                                * 1B165
            C%R^C                                * 1B16A
          ;                                      * 1B16F
          ROTROT2DROP                            * 1B174
        ;                                        * 1B179

* ROMPTR 002 04A XROOT
* refs (3): 189EA 21DC8 5A2CF
        CON(1)  10                               * 1B17E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B17F  library
        CON(3)  #04A                             * 1B182  command
rpnXROOT:
        ::                                       * 1B185
          CK2&Dispatch                           * 1B18A
          BINT5                                  * 1B18F
          OBJ_21DBE                              * 1B194
          OBJ_64C34                              * 1B199
          OBJ_21DBE                              * 1B19E
          BINT0                                  * 1B1A3
          OBJ_19EEC                              * 1B1A8
        ;                                        * 1B1AD

* slots of 002 04A (derivative, inverse, ...: used by the symbolic code)
        CON(5)  xXROOT                           * 1B1B2  slot 0
        CON(5)  0                                * 1B1B7  slot 1: none
        CON(5)  0                                * 1B1BC  slot 2: none
        CON(2)  #01                              * 1B1C1  end of the slots: property byte (meaning not yet known)

* y x -> Y'
* ROMPTR 002 04B
* refs (7): 189EA 19EFB 1B1B2 560B1 560CA 560E3 ...
        CON(1)  4                                * 1B1C3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B1C4  library
        CON(3)  #04B                             * 1B1C7  command
xXROOT:
        ::                                       * 1B1CA
          CK2&Dispatch                           * 1B1CF
          BINT17                                 * 1B1D4
          OBJ_1B251                              * 1B1D9
          BINT30                                 * 1B1DE
          OBJ_1B23D                              * 1B1E3
          EXTREAL                                * 1B1E8
          OBJ_1B23D                              * 1B1ED
          2EXT                                   * 1B1F2
          OBJ_1B23D                              * 1B1F7
          BINT26                                 * 1B1FC
          %SYMXROOT                              * 1B201
          SYMREAL                                * 1B206
          SYM%XROOT                              * 1B20B
          SYMSYM                                 * 1B210
          SYMXROOT                               * 1B215
          SYMEXT                                 * 1B21A
          SYM%XROOT                              * 1B21F
          EXTSYM                                 * 1B224
          %SYMXROOT                              * 1B229
        ;                                        * 1B22E

* slots of 002 04B (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_663E5                        * 1B233  slot 0
        CON(5)  OBJ_5A2AC                        * 1B238  slot 1

* refs (3): 1B1E3 1B1ED 1B1F7
OBJ_1B23D:
        ::                                       * 1B23D  slot 2
          SWAP                                   * 1B242
          UMXROOT                                * 1B247
        ;                                        * 1B24C

* refs (1): 1B1D9
OBJ_1B251:
        ::                                       * 1B251  slot 3
          SWAP                                   * 1B256
          %NROOT                                 * 1B25B
        ;                                        * 1B260
        CON(5)  NOP                              * 1B265  slot 4
        CON(5)  NOP                              * 1B26A  slot 5
        CON(2)  #CC                              * 1B26F  end of the slots: property byte (meaning not yet known)

* x -> 1/x [[]] -> [[]]'
* ROMPTR 002 04C INV
* refs (65): 189EA 2030A 20323 288D7 28968 54F45 ...
        CON(1)  0                                * 1B271  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B272  library
        CON(3)  #04C                             * 1B275  command
xINV:
        ::                                       * 1B278
          CK1&Dispatch                           * 1B27D
          BINT1                                  * 1B282
          %1/                                    * 1B287
          BINT2                                  * 1B28C
          C%1/                                   * 1B291
          BINT4                                  * 1B296
          MATINV                                 * 1B29B
          BINT10                                 * 1B2A0
          SYMINV                                 * 1B2A5
          BINT14                                 * 1B2AA
          UMINV                                  * 1B2AF
        ;                                        * 1B2B4

* slots of 002 04C (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DINV                           * 1B2B9  slot 0
        CON(5)  OBJ_5749C                        * 1B2BE  slot 1
        CON(5)  MANMENUCSIV                      * 1B2C3  slot 2
        CON(5)  nINTGINV                         * 1B2C8  slot 3
        CON(5)  0                                * 1B2CD  slot 4: none
        CON(2)  #80                              * 1B2D2  end of the slots: property byte (meaning not yet known)

* c -> \Gh
* ROMPTR 002 04D ARG
* refs (2): 189EA 54F5E
        CON(1)  0                                * 1B2D4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B2D5  library
        CON(3)  #04D                             * 1B2D8  command
xARG:
        ::                                       * 1B2DB
          CK1&Dispatch                           * 1B2E0
          BINT1                                  * 1B2E5
          %ARG                                   * 1B2EA
          BINT2                                  * 1B2EF
          C%ARG                                  * 1B2F4
          BINT10                                 * 1B2F9
          SYMARG                                 * 1B2FE
        ;                                        * 1B303

* slots of 002 04D (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DARG                           * 1B308  slot 0

* % %' -> %rem
* refs (1): 1B2EA
%ARG:
        ::                                       * 1B30D  slot 1
          %0_2A2B4                               * 1B312
          %ANGLE                                 * 1B317
        ;                                        * 1B31C
        CON(2)  #04                              * 1B321  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 04E SIGN
* refs (4): 189EA 54F77 7DC97 8378E
        CON(1)  0                                * 1B323  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B324  library
        CON(3)  #04E                             * 1B327  command
xSIGN:
        ::                                       * 1B32A
          CK1&Dispatch                           * 1B32F
          BINT1                                  * 1B334
          %SGN                                   * 1B339
          BINT2                                  * 1B33E
          C%SGN                                  * 1B343
          BINT10                                 * 1B348
          SYMSIGN                                * 1B34D
          BINT14                                 * 1B352
          UMSIGN                                 * 1B357
        ;                                        * 1B35C

* slots of 002 04E (derivative, inverse, ...: used by the symbolic code)
        CON(5)  nINTGSIGN                        * 1B361  slot 0
        CON(5)  0                                * 1B366  slot 1: none
        CON(2)  #C4                              * 1B36B  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 04F √
* refs (30): 189EA 2890E 54F90 555F3 564DF 57593 ...
        CON(1)  5                                * 1B36D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B36E  library
        CON(3)  #04F                             * 1B371  command
xSQRT:
        ::                                       * 1B374
          CK1&Dispatch                           * 1B379
          BINT1                                  * 1B37E
          CK%SQRT                                * 1B383
          BINT2                                  * 1B388
          C%SQRT                                 * 1B38D
          BINT10                                 * 1B392
          SYMSQRT                                * 1B397
          BINT14                                 * 1B39C
          UMSQRT                                 * 1B3A1
        ;                                        * 1B3A6

* slots of 002 04F (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D729                        * 1B3AB  slot 0
        CON(5)  OBJ_1B3C9                        * 1B3B0  slot 1
        CON(5)  D/DSQRT                          * 1B3B5  slot 2
        CON(5)  OBJ_575A7                        * 1B3BA  slot 3
        CON(5)  nINTGSQRT                        * 1B3BF  slot 4
        CON(5)  0                                * 1B3C4  slot 5: none

* refs (1): 1B3B0
OBJ_1B3C9:
        ::                                       * 1B3C9  slot 6
          OBJ_6CC10                              * 1B3CE
          #050410h                               * 1B3D3
          #C010h                                 * 1B3D8
          RPITE                                  * 1B3DD
        ;                                        * 1B3E2

* refs (1): 1B3D8
#C010h:
        HXS     010C                             * 1B3E7  slot 7

* % -> SQRT%%
* refs (1): 1B383
CK%SQRT:
        ::                                       * 1B3F5  slot 8
          DUP                                    * 1B3FA
          %0<                                    * 1B3FF
          NOTcase                                * 1B404
          %SQRT                                  * 1B409
          Re>C%                                  * 1B40E
          C%SQRT                                 * 1B413
        ;                                        * 1B418
        CON(2)  #C4                              * 1B41D  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 050 SQ
* refs (9): 189EA 2893B 54FA9 575B1 57AB1 5BE29 ...
        CON(1)  0                                * 1B41F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B420  library
        CON(3)  #050                             * 1B423  command
xSQ:
        ::                                       * 1B426
          CK1&Dispatch                           * 1B42B
          BINT1                                  * 1B430
          %SQ                                    * 1B435
          BINT2                                  * 1B43A
          C%C*C                                  * 1B43F
          BINT4                                  * 1B444
          MATSQ                                  * 1B449
          BINT10                                 * 1B44E
          SYMSQ                                  * 1B453
          BINT14                                 * 1B458
          UMSQ                                   * 1B45D
        ;                                        * 1B462

* slots of 002 050 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DSQ                            * 1B467  slot 0
        CON(5)  OBJ_57589                        * 1B46C  slot 1
        CON(5)  nINTGSQ                          * 1B471  slot 2
        CON(5)  0                                * 1B476  slot 3: none

* % -> %'
* refs (1): 1B435
%SQ:
        ::                                       * 1B47B  slot 4
          DUP                                    * 1B480
          %*                                     * 1B485
        ;                                        * 1B48A

* C% -> C%^2
* refs (1): 1B43F
C%C*C:
        ::                                       * 1B48F  slot 5
          DUP                                    * 1B494
          C%C*C_51D88                            * 1B499
        ;                                        * 1B49E
        CON(2)  #CC                              * 1B4A3  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 051 SIN
* refs (27): 189EA 2826E 54FC2 5751B 5BDBB 5BE38 ...
        CON(1)  0                                * 1B4A5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B4A6  library
        CON(3)  #051                             * 1B4A9  command
xSIN:
        ::                                       * 1B4AC
          CK1&Dispatch                           * 1B4B1
          BINT1                                  * 1B4B6
          %SIN                                   * 1B4BB
          BINT2                                  * 1B4C0
          C%SIN                                  * 1B4C5
          BINT10                                 * 1B4CA
          SYMSIN                                 * 1B4CF
          BINT14                                 * 1B4D4
          UMSIN                                  * 1B4D9
        ;                                        * 1B4DE

* slots of 002 051 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DSIN                           * 1B4E3  slot 0
        CON(5)  OBJ_574CF                        * 1B4E8  slot 1
        CON(5)  MANMENUTRG                       * 1B4ED  slot 2
        CON(5)  nINTGSIN                         * 1B4F2  slot 3
        CON(5)  0                                * 1B4F7  slot 4: none
        CON(2)  #CC                              * 1B4FC  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 052 COS
* refs (23): 189EA 2825A 54FDB 5752F 5BDC0 5BE3D ...
        CON(1)  0                                * 1B4FE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B4FF  library
        CON(3)  #052                             * 1B502  command
xCOS:
        ::                                       * 1B505
          CK1&Dispatch                           * 1B50A
          BINT1                                  * 1B50F
          %COS                                   * 1B514
          BINT2                                  * 1B519
          C%COS                                  * 1B51E
          BINT10                                 * 1B523
          SYMCOS                                 * 1B528
          BINT14                                 * 1B52D
          UMCOS                                  * 1B532
        ;                                        * 1B537

* slots of 002 052 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DCOS                           * 1B53C  slot 0
        CON(5)  OBJ_574DA                        * 1B541  slot 1
        CON(5)  MANMENUTRG                       * 1B546  slot 2
        CON(5)  nINTGCOS                         * 1B54B  slot 3
        CON(5)  0                                * 1B550  slot 4: none
        CON(2)  #CC                              * 1B555  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 053 TAN
* refs (17): 189EA 54FF4 57543 5BDC5 5BE42 82541 ...
        CON(1)  0                                * 1B557  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B558  library
        CON(3)  #053                             * 1B55B  command
xTAN:
        ::                                       * 1B55E
          CK1&Dispatch                           * 1B563
          BINT1                                  * 1B568
          %TAN                                   * 1B56D
          BINT2                                  * 1B572
          C%TAN                                  * 1B577
          BINT10                                 * 1B57C
          SYMTAN                                 * 1B581
          BINT14                                 * 1B586
          UMTAN                                  * 1B58B
        ;                                        * 1B590

* slots of 002 053 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DTAN                           * 1B595  slot 0
        CON(5)  OBJ_574E5                        * 1B59A  slot 1
        CON(5)  MANMENUTRG                       * 1B59F  slot 2
        CON(5)  nINTGTAN                         * 1B5A4  slot 3
        CON(5)  0                                * 1B5A9  slot 4: none
        CON(2)  #CC                              * 1B5AE  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 054 SINH
* refs (19): 189EA 5500D 57557 5BDCA 5BE47 82B29 ...
        CON(1)  0                                * 1B5B0  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B5B1  library
        CON(3)  #054                             * 1B5B4  command
xSINH:
        ::                                       * 1B5B7
          CK1&Dispatch                           * 1B5BC
          BINT1                                  * 1B5C1
          %SINH                                  * 1B5C6
          BINT2                                  * 1B5CB
          C%SINH                                 * 1B5D0
          BINT10                                 * 1B5D5
          SYMSINH                                * 1B5DA
        ;                                        * 1B5DF

* slots of 002 054 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DSINH                          * 1B5E4  slot 0
        CON(5)  OBJ_574F0                        * 1B5E9  slot 1
        CON(5)  MANMENUTRG                       * 1B5EE  slot 2
        CON(5)  nINTGSINH                        * 1B5F3  slot 3
        CON(5)  0                                * 1B5F8  slot 4: none
        CON(2)  #CC                              * 1B5FD  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 055 COSH
* refs (20): 189EA 55026 5756B 5BDCF 5BE4C 82B51 ...
        CON(1)  0                                * 1B5FF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B600  library
        CON(3)  #055                             * 1B603  command
xCOSH:
        ::                                       * 1B606
          CK1&Dispatch                           * 1B60B
          BINT1                                  * 1B610
          %COSH                                  * 1B615
          BINT2                                  * 1B61A
          C%COSH                                 * 1B61F
          BINT10                                 * 1B624
          SYMCOSH                                * 1B629
        ;                                        * 1B62E

* slots of 002 055 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DCOSH                          * 1B633  slot 0
        CON(5)  OBJ_574FB                        * 1B638  slot 1
        CON(5)  MANMENUTRG                       * 1B63D  slot 2
        CON(5)  nINTGCOSH                        * 1B642  slot 3
        CON(5)  0                                * 1B647  slot 4: none
        CON(2)  #CC                              * 1B64C  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 056 TANH
* refs (14): 189EA 5503F 5757F 5BDD4 5BE51 82B83 ...
        CON(1)  0                                * 1B64E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B64F  library
        CON(3)  #056                             * 1B652  command
xTANH:
        ::                                       * 1B655
          CK1&Dispatch                           * 1B65A
          BINT1                                  * 1B65F
          %TANH                                  * 1B664
          BINT2                                  * 1B669
          C%TANH                                 * 1B66E
          BINT10                                 * 1B673
          SYMTANH                                * 1B678
        ;                                        * 1B67D

* slots of 002 056 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DTANH                          * 1B682  slot 0
        CON(5)  OBJ_57506                        * 1B687  slot 1
        CON(5)  MANMENUTRG                       * 1B68C  slot 2
        CON(5)  nINTGTANH                        * 1B691  slot 3
        CON(5)  0                                * 1B696  slot 4: none
        CON(2)  #CC                              * 1B69B  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 057 ASIN
* refs (8): 189EA 55058 5536E 5BDD9 8293F 8296C ...
        CON(1)  0                                * 1B69D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B69E  library
        CON(3)  #057                             * 1B6A1  command
xASIN:
        ::                                       * 1B6A4
          CK1&Dispatch                           * 1B6A9
          BINT1                                  * 1B6AE
          CK%ASIN                                * 1B6B3
          BINT2                                  * 1B6B8
          C%ASIN                                 * 1B6BD
          BINT10                                 * 1B6C2
          SYMASIN                                * 1B6C7
        ;                                        * 1B6CC

* slots of 002 057 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DASIN                          * 1B6D1  slot 0
        CON(5)  OBJ_57511                        * 1B6D6  slot 1
        CON(5)  MANMENUATG                       * 1B6DB  slot 2
        CON(5)  nINTGASIN                        * 1B6E0  slot 3
        CON(5)  0                                * 1B6E5  slot 4: none

* % -> ASIN%
* refs (1): 1B6B3
CK%ASIN:
        ::                                       * 1B6EA  slot 5

* refs (2): 1B77A 1B8E3
dup;|r|ó1?:dq/sk:
          ::                                     * 1B6EF
            DUP                                  * 1B6F4
            %ABS                                 * 1B6F9
            %1                                   * 1B6FE
            %>                                   * 1B703
            COLANOTcase                          * 1B708
          ;                                      * 1B70D
          %ASIN                                  * 1B712
          Re>C%                                  * 1B717
          C%ASIN                                 * 1B71C
        ;                                        * 1B721
        CON(2)  #CC                              * 1B726  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 058 ACOS
* refs (7): 189EA 55071 5539B 5BDDE 829DF 82A0C ...
        CON(1)  0                                * 1B728  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B729  library
        CON(3)  #058                             * 1B72C  command
xACOS:
        ::                                       * 1B72F
          CK1&Dispatch                           * 1B734
          BINT1                                  * 1B739
          CK%ACOS                                * 1B73E
          BINT2                                  * 1B743
          C%ACOS                                 * 1B748
          BINT10                                 * 1B74D
          SYMACOS                                * 1B752
        ;                                        * 1B757

* slots of 002 058 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DACOS                          * 1B75C  slot 0
        CON(5)  OBJ_57525                        * 1B761  slot 1
        CON(5)  MANMENUATG                       * 1B766  slot 2
        CON(5)  nINTGACOS                        * 1B76B  slot 3
        CON(5)  0                                * 1B770  slot 4: none

* % -> ACOS%
* refs (1): 1B73E
CK%ACOS:
        ::                                       * 1B775  slot 5
          dup;|r|ó1?:dq/sk                       * 1B77A
          %ACOS                                  * 1B77F
          Re>C%                                  * 1B784
          C%ACOS                                 * 1B789
        ;                                        * 1B78E
        CON(2)  #CC                              * 1B793  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 059 ATAN
* refs (8): 189EA 5508A 553C8 5BDE3 82A7F 82AAC ...
        CON(1)  0                                * 1B795  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B796  library
        CON(3)  #059                             * 1B799  command
xATAN:
        ::                                       * 1B79C
          CK1&Dispatch                           * 1B7A1
          BINT1                                  * 1B7A6
          %ATAN                                  * 1B7AB
          BINT2                                  * 1B7B0
          C%ATAN                                 * 1B7B5
          BINT10                                 * 1B7BA
          SYMATAN                                * 1B7BF
        ;                                        * 1B7C4

* slots of 002 059 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DATAN                          * 1B7C9  slot 0
        CON(5)  OBJ_57539                        * 1B7CE  slot 1
        CON(5)  MANMENUATG                       * 1B7D3  slot 2
        CON(5)  nINTGATAN                        * 1B7D8  slot 3
        CON(5)  0                                * 1B7DD  slot 4: none
        CON(2)  #C8                              * 1B7E2  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05A ASINH
* refs (6): 189EA 550A3 552A6 5BDE8 8354D 86F0B
        CON(1)  0                                * 1B7E4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B7E5  library
        CON(3)  #05A                             * 1B7E8  command
xASINH:
        ::                                       * 1B7EB
          CK1&Dispatch                           * 1B7F0
          BINT1                                  * 1B7F5
          %ASINH                                 * 1B7FA
          BINT2                                  * 1B7FF
          C%ASINH                                * 1B804
          BINT10                                 * 1B809
          SYMASINH                               * 1B80E
        ;                                        * 1B813

* slots of 002 05A (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DASINH                         * 1B818  slot 0
        CON(5)  OBJ_5754D                        * 1B81D  slot 1
        CON(5)  MANMENUATG                       * 1B822  slot 2
        CON(2)  #C8                              * 1B827  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05B ACOSH
* refs (6): 189EA 550BC 552BA 5BDED 83616 86F2E
        CON(1)  0                                * 1B829  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B82A  library
        CON(3)  #05B                             * 1B82D  command
xACOSH:
        ::                                       * 1B830
          CK1&Dispatch                           * 1B835
          BINT1                                  * 1B83A
          CK%ACOSH                               * 1B83F
          BINT2                                  * 1B844
          C%ACOSH                                * 1B849
          BINT10                                 * 1B84E
          SYMACOSH                               * 1B853
        ;                                        * 1B858

* slots of 002 05B (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DACOSH                         * 1B85D  slot 0
        CON(5)  OBJ_57561                        * 1B862  slot 1
        CON(5)  MANMENUATG                       * 1B867  slot 2

* % -> ACOSH%
* refs (1): 1B83F
CK%ACOSH:
        ::                                       * 1B86C  slot 3
          DUP                                    * 1B871
          %1                                     * 1B876
          %<                                     * 1B87B
          NOTcase                                * 1B880
          %ACOSH                                 * 1B885
          Re>C%                                  * 1B88A
          C%ACOSH                                * 1B88F
        ;                                        * 1B894
        CON(2)  #C8                              * 1B899  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05C ATANH
* refs (6): 189EA 550D5 552CE 5BDF2 833D6 86F56
        CON(1)  0                                * 1B89B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B89C  library
        CON(3)  #05C                             * 1B89F  command
xATANH:
        ::                                       * 1B8A2
          CK1&Dispatch                           * 1B8A7
          BINT1                                  * 1B8AC
          CK%ATANH                               * 1B8B1
          BINT2                                  * 1B8B6
          C%ATANH                                * 1B8BB
          BINT10                                 * 1B8C0
          SYMATANH                               * 1B8C5
        ;                                        * 1B8CA

* slots of 002 05C (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DATANH                         * 1B8CF  slot 0
        CON(5)  OBJ_57575                        * 1B8D4  slot 1
        CON(5)  MANMENUATG                       * 1B8D9  slot 2

* % -> ATANH%
* refs (1): 1B8B1
CK%ATANH:
        ::                                       * 1B8DE  slot 3
          dup;|r|ó1?:dq/sk                       * 1B8E3
          %ATANH                                 * 1B8E8
          Re>C%                                  * 1B8ED
          C%ATANH                                * 1B8F2
        ;                                        * 1B8F7
        CON(2)  #CC                              * 1B8FC  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05D EXP
* refs (14): 189EA 48C74 550EE 574C5 5BB90 5BBB8 ...
        CON(1)  0                                * 1B8FE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B8FF  library
        CON(3)  #05D                             * 1B902  command
xEXP:
        ::                                       * 1B905
          CK1&Dispatch                           * 1B90A
          BINT1                                  * 1B90F
          %EXP                                   * 1B914
          BINT2                                  * 1B919
          C%EXP                                  * 1B91E
          BINT10                                 * 1B923
          SYMEXP                                 * 1B928
        ;                                        * 1B92D

* slots of 002 05D (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DEXP                           * 1B932  slot 0
        CON(5)  OBJ_574B0                        * 1B937  slot 1
        CON(5)  MANMENUEXP                       * 1B93C  slot 2
        CON(5)  OBJ_5BB6D                        * 1B941  slot 3
        CON(2)  #CC                              * 1B946  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05E LN
* refs (32): 189EA 48C29 55107 552E2 5B9D8 5BACD ...
        CON(1)  0                                * 1B948  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B949  library
        CON(3)  #05E                             * 1B94C  command
xLN:
        ::                                       * 1B94F
          CK1&Dispatch                           * 1B954
          BINT1                                  * 1B959
          CK%LN                                  * 1B95E
          BINT2                                  * 1B963
          C%LN                                   * 1B968
          BINT10                                 * 1B96D
          SYMLN                                  * 1B972
        ;                                        * 1B977

* slots of 002 05E (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DLN                            * 1B97C  slot 0
        CON(5)  OBJ_574BB                        * 1B981  slot 1
        CON(5)  MANMENULN                        * 1B986  slot 2
        CON(5)  nINTGLN                          * 1B98B  slot 3
        CON(5)  0                                * 1B990  slot 4: none

* % -> LN%
* refs (1): 1B95E
CK%LN:
        ::                                       * 1B995  slot 5
          DUP                                    * 1B99A
          %0<                                    * 1B99F
          NOTcase                                * 1B9A4
          %LN                                    * 1B9A9
          Re>C%                                  * 1B9AE
          C%LN                                   * 1B9B3
        ;                                        * 1B9B8
        CON(2)  #CC                              * 1B9BD  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05F LOG
* refs (6): 189EA 55120 552F6 5F812 83145 86F79
        CON(1)  0                                * 1B9BF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B9C0  library
        CON(3)  #05F                             * 1B9C3  command
xLOG:
        ::                                       * 1B9C6
          CK1&Dispatch                           * 1B9CB
          BINT1                                  * 1B9D0
          CK%LOG                                 * 1B9D5
          BINT2                                  * 1B9DA
          C%LOG                                  * 1B9DF
          BINT10                                 * 1B9E4
          SYMLOG                                 * 1B9E9
        ;                                        * 1B9EE

* slots of 002 05F (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DLOG                           * 1B9F3  slot 0
        CON(5)  OBJ_575BB                        * 1B9F8  slot 1
        CON(5)  MANMENULN                        * 1B9FD  slot 2
        CON(5)  nINTGLOG                         * 1BA02  slot 3
        CON(5)  0                                * 1BA07  slot 4: none

* % -> LOG%
* refs (1): 1B9D5
CK%LOG:
        ::                                       * 1BA0C  slot 5
          DUP                                    * 1BA11
          %0<                                    * 1BA16
          NOTcase                                * 1BA1B
          %LOG                                   * 1BA20
          Re>C%                                  * 1BA25
          C%LOG                                  * 1BA2A
        ;                                        * 1BA2F
        CON(2)  #CC                              * 1BA34  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 060 ALOG
* refs (7): 189EA 55139 575C5 5F808 83031 8306E ...
        CON(1)  0                                * 1BA36  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BA37  library
        CON(3)  #060                             * 1BA3A  command
xALOG:
        ::                                       * 1BA3D
          CK1&Dispatch                           * 1BA42
          BINT1                                  * 1BA47
          %ALOG                                  * 1BA4C
          BINT2                                  * 1BA51
          C%ALOG                                 * 1BA56
          BINT10                                 * 1BA5B
          SYMALOG                                * 1BA60
        ;                                        * 1BA65

* slots of 002 060 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DALOG                          * 1BA6A  slot 0
        CON(5)  OBJ_575E3                        * 1BA6F  slot 1
        CON(5)  MANMENUEXP                       * 1BA74  slot 2
        CON(5)  nINTGALOG                        * 1BA79  slot 3
        CON(5)  0                                * 1BA7E  slot 4: none
        CON(2)  #C0                              * 1BA83  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 061 LNP1
* refs (4): 189EA 55152 5530A 86FBF
        CON(1)  0                                * 1BA85  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BA86  library
        CON(3)  #061                             * 1BA89  command
xLNP1:
        ::                                       * 1BA8C
          CK1&Dispatch                           * 1BA91
          BINT1                                  * 1BA96
          %LNP1                                  * 1BA9B
          BINT10                                 * 1BAA0
          SYMLNP1                                * 1BAA5
        ;                                        * 1BAAA

* slots of 002 061 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DLNP1                          * 1BAAF  slot 0
        CON(5)  OBJ_575CF                        * 1BAB4  slot 1
        CON(2)  #C4                              * 1BAB9  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 062 EXPM
* refs (4): 189EA 5516B 575D9 82FB4
        CON(1)  0                                * 1BABB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BABC  library
        CON(3)  #062                             * 1BABF  command
xEXPM:
        ::                                       * 1BAC2
          CK1&Dispatch                           * 1BAC7
          BINT1                                  * 1BACC
          %EXPM1                                 * 1BAD1
          BINT10                                 * 1BAD6
          SYMEXPM                                * 1BADB
        ;                                        * 1BAE0

* slots of 002 062 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DEXP                           * 1BAE5  slot 0
        CON(5)  OBJ_57602                        * 1BAEA  slot 1
        CON(5)  nINTGEXPM                        * 1BAEF  slot 2
        CON(5)  0                                * 1BAF4  slot 3: none
        CON(2)  #00                              * 1BAF9  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 063 !
* refs (2): 189EA 55184
        CON(1)  5                                * 1BAFB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BAFC  library
        CON(3)  #063                             * 1BAFF  command
xFACT:
        ::                                       * 1BB02
          CK1&Dispatch                           * 1BB07
          BINT1                                  * 1BB0C
          %FACT                                  * 1BB11
          BINT10                                 * 1BB16
          SYMFACT                                * 1BB1B
        ;                                        * 1BB20

* slots of 002 063 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCBD                        * 1BB25  slot 0

#010Ah:
        HXS     A010                             * 1BB2A  slot 1
        CON(2)  #00                              * 1BB38  end of the slots: property byte (meaning not yet known)

* ROMPTR 002 064 FACT
* refs (1): 189EA
        CON(1)  0                                * 1BB3A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BB3B  library
        CON(3)  #064                             * 1BB3E  command
preFACT:
        ::                                       * 1BB41
          CK1&Dispatch                           * 1BB46
          BINT1                                  * 1BB4B
          %FACT                                  * 1BB50
          BINT10                                 * 1BB55
          SYMFACT                                * 1BB5A
        ;                                        * 1BB5F

* slots of 002 064 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BB64  end of the slots: property byte (meaning not yet known)

* x -> n
* ROMPTR 002 065 IP
* refs (6): 189EA 5519D 8AE14 8AF47 8AFF0 8B0A9
        CON(1)  0                                * 1BB66  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BB67  library
        CON(3)  #065                             * 1BB6A  command
xIP:
        ::                                       * 1BB6D
          CK1&Dispatch                           * 1BB72
          BINT1                                  * 1BB77
          %IP                                    * 1BB7C
          BINT10                                 * 1BB81
          SYMIP                                  * 1BB86
          BINT14                                 * 1BB8B
          UMIP                                   * 1BB90
        ;                                        * 1BB95

* slots of 002 065 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BB9A  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 066 FP
* refs (4): 189EA 551B6 8AE5D 8B0F2
        CON(1)  0                                * 1BB9C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BB9D  library
        CON(3)  #066                             * 1BBA0  command
xFP:
        ::                                       * 1BBA3
          CK1&Dispatch                           * 1BBA8
          BINT1                                  * 1BBAD
          %FP                                    * 1BBB2
          BINT10                                 * 1BBB7
          SYMFP                                  * 1BBBC
          BINT14                                 * 1BBC1
          UMFP                                   * 1BBC6
        ;                                        * 1BBCB

* slots of 002 066 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BBD0  end of the slots: property byte (meaning not yet known)

* x -> n
* ROMPTR 002 067 FLOOR
* refs (3): 189EA 551CF D2F77
        CON(1)  0                                * 1BBD2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BBD3  library
        CON(3)  #067                             * 1BBD6  command
xFLOOR:
        ::                                       * 1BBD9
          CK1&Dispatch                           * 1BBDE
          BINT1                                  * 1BBE3
          %FLOOR                                 * 1BBE8
          BINT10                                 * 1BBED
          SYMFLOOR                               * 1BBF2
          BINT14                                 * 1BBF7
          UMFLOOR                                * 1BBFC
        ;                                        * 1BC01

* slots of 002 067 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BC06  end of the slots: property byte (meaning not yet known)

* x -> n
* ROMPTR 002 068 CEIL
* refs (3): 189EA 551E8 D2F8F
        CON(1)  0                                * 1BC08  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BC09  library
        CON(3)  #068                             * 1BC0C  command
xCEIL:
        ::                                       * 1BC0F
          CK1&Dispatch                           * 1BC14
          BINT1                                  * 1BC19
          %CEIL                                  * 1BC1E
          BINT10                                 * 1BC23
          SYMCEIL                                * 1BC28
          BINT14                                 * 1BC2D
          UMCEIL                                 * 1BC32
        ;                                        * 1BC37

* slots of 002 068 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BC3C  end of the slots: property byte (meaning not yet known)

* % -> n symb -> XPON(symb)
* ROMPTR 002 069 XPON
* refs (2): 189EA 55201
        CON(1)  0                                * 1BC3E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BC3F  library
        CON(3)  #069                             * 1BC42  command
xXPON:
        ::                                       * 1BC45
          CK1&Dispatch                           * 1BC4A
          BINT1                                  * 1BC4F
          %EXPONENT                              * 1BC54
          BINT10                                 * 1BC59
          SYMEXPONENT                            * 1BC5E
        ;                                        * 1BC63

* slots of 002 069 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BC68  end of the slots: property byte (meaning not yet known)

* x y -> x'
* ROMPTR 002 06A MAX
* refs (4): 189EA 55E59 55E72 55E8B
        CON(1)  0                                * 1BC6A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BC6B  library
        CON(3)  #06A                             * 1BC6E  command
xMAX:
        ::                                       * 1BC71
          CK2&Dispatch                           * 1BC76
          BINT17                                 * 1BC7B
          %MAX                                   * 1BC80
          BINT26                                 * 1BC85
          %SYMMAX                                * 1BC8A
          SYMREAL                                * 1BC8F
          SYM%MAX                                * 1BC94
          SYMSYM                                 * 1BC99
          SYMMAX                                 * 1BC9E
          BINT30                                 * 1BCA3
          UMMAX                                  * 1BCA8
          EXTREAL                                * 1BCAD
          UMMAX                                  * 1BCB2
          2EXT                                   * 1BCB7
          UMMAX                                  * 1BCBC
          EXTSYM                                 * 1BCC1
          %SYMMAX                                * 1BCC6
          SYMEXT                                 * 1BCCB
          SYM%MAX                                * 1BCD0
        ;                                        * 1BCD5

* slots of 002 06A (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BCDA  end of the slots: property byte (meaning not yet known)

* x y -> x'
* ROMPTR 002 06B MIN
* refs (4): 189EA 55EA4 55EBD 55ED6
        CON(1)  0                                * 1BCDC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BCDD  library
        CON(3)  #06B                             * 1BCE0  command
xMIN:
        ::                                       * 1BCE3
          CK2&Dispatch                           * 1BCE8
          BINT17                                 * 1BCED
          %MIN                                   * 1BCF2
          BINT26                                 * 1BCF7
          %SYMMIN                                * 1BCFC
          SYMREAL                                * 1BD01
          SYM%MIN                                * 1BD06
          SYMSYM                                 * 1BD0B
          SYMMIN                                 * 1BD10
          BINT30                                 * 1BD15
          UMMIN                                  * 1BD1A
          EXTREAL                                * 1BD1F
          UMMIN                                  * 1BD24
          2EXT                                   * 1BD29
          UMMIN                                  * 1BD2E
          EXTSYM                                 * 1BD33
          %SYMMIN                                * 1BD38
          SYMEXT                                 * 1BD3D
          SYM%MIN                                * 1BD42
        ;                                        * 1BD47

* slots of 002 06B (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BD4C  end of the slots: property byte (meaning not yet known)

* x n -> x'
* ROMPTR 002 06C RND
* refs (4): 189EA 55DC3 55DDC 55DF5
        CON(1)  0                                * 1BD4E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BD4F  library
        CON(3)  #06C                             * 1BD52  command
xRND:
        ::                                       * 1BD55
          CK2&Dispatch                           * 1BD5A
          BINT17                                 * 1BD5F
          RNDXY                                  * 1BD64
          BINT26                                 * 1BD69
          SYMRND                                 * 1BD6E
          BINT33                                 * 1BD73
          trunc(c,r)                             * 1BD78
          BINT42                                 * 1BD7D
          SYMRND                                 * 1BD82
          BINT65                                 * 1BD87
          MATRND                                 * 1BD8C
          SYMREAL                                * 1BD91
          SYM%RND                                * 1BD96
          SYMSYM                                 * 1BD9B
          RNDSYM                                 * 1BDA0
          EXTREAL                                * 1BDA5
          UMRND                                  * 1BDAA
          EXTSYM                                 * 1BDAF
          SYMRND                                 * 1BDB4
        ;                                        * 1BDB9

* slots of 002 06C (derivative, inverse, ...: used by the symbolic code)
        CON(5)  NOP                              * 1BDBE  slot 0
        CON(5)  NOP                              * 1BDC3  slot 1
        CON(2)  #00                              * 1BDC8  end of the slots: property byte (meaning not yet known)

* x n ->
* ROMPTR 002 06D TRNC
* refs (4): 189EA 55E0E 55E27 55E40
        CON(1)  0                                * 1BDCA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BDCB  library
        CON(3)  #06D                             * 1BDCE  command
xTRNC:
        ::                                       * 1BDD1
          CK2&Dispatch                           * 1BDD6
          BINT17                                 * 1BDDB
          TRCXY                                  * 1BDE0
          BINT26                                 * 1BDE5
          TRCNYM                                 * 1BDEA
          BINT33                                 * 1BDEF
          conj(ar)                               * 1BDF4
          BINT42                                 * 1BDF9
          TRCNYM                                 * 1BDFE
          BINT65                                 * 1BE03
          MATTRNC                                * 1BE08
          SYMREAL                                * 1BE0D
          SYM%TRNC                               * 1BE12
          SYMSYM                                 * 1BE17
          SYMTRCN                                * 1BE1C
          EXTREAL                                * 1BE21
          UMTRC                                  * 1BE26
          EXTSYM                                 * 1BE2B
          TRCNYM                                 * 1BE30
        ;                                        * 1BE35

* slots of 002 06D (derivative, inverse, ...: used by the symbolic code)
        CON(5)  NOP                              * 1BE3A  slot 0
        CON(5)  NOP                              * 1BE3F  slot 1
        CON(2)  #00                              * 1BE44  end of the slots: property byte (meaning not yet known)

* x y -> x'
* ROMPTR 002 06E MOD
* refs (5): 189EA 56066 5607F 56098 D388A
        CON(1)  1                                * 1BE46  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BE47  library
        CON(3)  #06E                             * 1BE4A  command
xMOD:
        ::                                       * 1BE4D
          CK2&Dispatch                           * 1BE52
          BINT17                                 * 1BE57
          %MOD                                   * 1BE5C
          BINT26                                 * 1BE61
          %SYMMOD                                * 1BE66
          SYMREAL                                * 1BE6B
          SYM%MOD                                * 1BE70
          SYMSYM                                 * 1BE75
          SYMMOD                                 * 1BE7A
        ;                                        * 1BE7F

* slots of 002 06E (derivative, inverse, ...: used by the symbolic code)
#80108h_1BE84:
        HXS     80108                            * 1BE84  slot 0
        CON(2)  #00                              * 1BE93  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 06F MANT
* refs (2): 189EA 5521A
        CON(1)  0                                * 1BE95  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BE96  library
        CON(3)  #06F                             * 1BE99  command
xMANT:
        ::                                       * 1BE9C
          CK1&Dispatch                           * 1BEA1
          BINT1                                  * 1BEA6
          %MANTISSA                              * 1BEAB
          BINT10                                 * 1BEB0
          SYMMANT                                * 1BEB5
        ;                                        * 1BEBA

* slots of 002 06F (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BEBF  end of the slots: property byte (meaning not yet known)

* x -> (pi/180)x
* ROMPTR 002 070 D→R
* refs (2): 189EA 55233
        CON(1)  0                                * 1BEC1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BEC2  library
        CON(3)  #070                             * 1BEC5  command
xD>R:
        ::                                       * 1BEC8
          CK1&Dispatch                           * 1BECD
          BINT1                                  * 1BED2
          %D>R                                   * 1BED7
          BINT10                                 * 1BEDC
          SYMD>R                                 * 1BEE1
        ;                                        * 1BEE6

* slots of 002 070 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BEEB  end of the slots: property byte (meaning not yet known)

* x -> (180/pi)x
* ROMPTR 002 071 R→D
* refs (2): 189EA 5524C
        CON(1)  0                                * 1BEED  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BEEE  library
        CON(3)  #071                             * 1BEF1  command
xR>D:
        ::                                       * 1BEF4
          CK1&Dispatch                           * 1BEF9
          BINT1                                  * 1BEFE
          %R>D                                   * 1BF03
          BINT10                                 * 1BF08
          SYMR>D                                 * 1BF0D
        ;                                        * 1BF12

* x -> x'
* ROMPTR 002 072 →HMS
* refs (1): 189EA
        CON(1)  8                                * 1BF17  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF18  library
        CON(3)  #072                             * 1BF1B  command
x>HMS:
        ::                                       * 1BF1E
          CK1&Dispatch                           * 1BF23
          BINT1                                  * 1BF28
          %>HMS                                  * 1BF2D
        ;                                        * 1BF32

* x -> x'
* ROMPTR 002 073 HMS→
* refs (1): 189EA
        CON(1)  8                                * 1BF37  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF38  library
        CON(3)  #073                             * 1BF3B  command
xHMS>:
        ::                                       * 1BF3E
          CK1&Dispatch                           * 1BF43
          BINT1                                  * 1BF48
          %HMS>                                  * 1BF4D
        ;                                        * 1BF52

* hms1 hms2 -> hms3
* ROMPTR 002 074 HMS+
* refs (1): 189EA
        CON(1)  8                                * 1BF57  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF58  library
        CON(3)  #074                             * 1BF5B  command
xHMS+:
        ::                                       * 1BF5E
          CK2&Dispatch                           * 1BF63
          BINT17                                 * 1BF68
          %HMS+                                  * 1BF6D
        ;                                        * 1BF72

* hms1 hms2 -> hms3
* ROMPTR 002 075 HMS-
* refs (1): 189EA
        CON(1)  8                                * 1BF77  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF78  library
        CON(3)  #075                             * 1BF7B  command
xHMS-:
        ::                                       * 1BF7E
          CK2&Dispatch                           * 1BF83
          BINT17                                 * 1BF88
          %HMS-                                  * 1BF8D
        ;                                        * 1BF92

* [] -> x
* ROMPTR 002 076 RNRM
* refs (1): 189EA
        CON(1)  8                                * 1BF97  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF98  library
        CON(3)  #076                             * 1BF9B  command
xRNRM:
        ::                                       * 1BF9E
          CK1&Dispatch                           * 1BFA3
          BINT4                                  * 1BFA8
          MATRNRM                                * 1BFAD
        ;                                        * 1BFB2

* [] -> col_norm
* ROMPTR 002 077 CNRM
* refs (1): 189EA
        CON(1)  8                                * 1BFB7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BFB8  library
        CON(3)  #077                             * 1BFBB  command
xCNRM:
        ::                                       * 1BFBE
          CK1&Dispatch                           * 1BFC3
          BINT4                                  * 1BFC8
          MATCNRM                                * 1BFCD
        ;                                        * 1BFD2

* [[]] -> x
* ROMPTR 002 078 DET
* refs (1): 189EA
        CON(1)  8                                * 1BFD7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BFD8  library
        CON(3)  #078                             * 1BFDB  command
xDET:
        ::                                       * 1BFDE
          CK1&Dispatch                           * 1BFE3
          BINT4                                  * 1BFE8
          MATDET                                 * 1BFED
        ;                                        * 1BFF2

* [1] [2] -> x
* ROMPTR 002 079 DOT
* refs (1): 189EA
        CON(1)  8                                * 1BFF7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BFF8  library
        CON(3)  #079                             * 1BFFB  command
xDOT:
        ::                                       * 1BFFE
          CK2&Dispatch                           * 1C003
          BINT68                                 * 1C008
          MATDOT                                 * 1C00D
        ;                                        * 1C012
